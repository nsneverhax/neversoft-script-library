PedGetAttentionBigWaveStartRadius = 15.0
PedGetAttentionBigWaveStopRadius = 20.0
PedGetAttentionSmallWaveStartRadius = 8.0
PedGetAttentionSmallWaveStopRadius = 12.0
PedGetAttentionStopWavingTimeout = 10.0
PedGetAttentionImpatientTimeout = 5.0
PedImpatientMinVoRepeatDelay = 35.0
PedImpatientMaxVoRepeatDelay = 65.0
PedMinFarVoRepeatDelay = 30.0
PedMaxGetAttentionAlignTime = 2.0
PedMaxScorePotForFarVoEnable = 500

script RegisterBehaviors_SkateGetAttention 
endscript

script Bv_GetAttentionDetect 
	begin
	if (compositeobjectexists player1)
		break
	endif
	wait 1 gameframe
	repeat
	agent_setinterest {interest_type_id = location
		object_id = player1
		acquire_vis_loc = false}
	ai_giveorder {replacement = child
		name = Bv_GenEvents_Distance
		params = {distance = $PedGetAttentionBigWaveStartRadius
			greater_than = Null_Event
			less_than = Close_Enough_For_Get_Attention
			interest_type_id = location}}
	if gman_hasactivegoals
		in_goal = true
	else
		in_goal = false
	endif
	begin
	blockuntilevent anytypes = [goal_activating goal_deactivating Close_Enough_For_Get_Attention]
	switch <type>
		case goal_activating
		<in_goal> = true
		case goal_deactivating
		<in_goal> = false
		case Close_Enough_For_Get_Attention
		if (<in_goal> = false)
			if skatercamanimfinished
				eventcache_add event_id = Start_Get_Attention
			endif
		endif
	endswitch
	repeat
endscript

script Bv_GetAttention 
	onexitrun GetAttention_Exit
	getstarttime
	settags GetAttentionStartTime = <starttime>
	agent_setinterest interest_type_id = location object_id = player1 acquire_vis_loc = false
	ai_giveorder replacement = lookat name = Bv_LookAt_Location
	<current_state> = GetAttention_FacePlayer
	begin
	ai_giveorder replacement = state name = <current_state>
	blockuntilevent anytypes = [Big_Wave_Start Small_Wave_Start Wave_Timeout Became_Impatient]
	switch <type>
		case Big_Wave_Start
		<current_state> = GetAttention_BigWave
		case Small_Wave_Start
		<current_state> = GetAttention_SmallWave
		case Wave_Timeout
		<current_state> = GetAttention_Idle
		case Became_Impatient
		<current_state> = GetAttention_Impatient
	endswitch
	repeat
endscript

script GetAttention_Exit 
	agent_finishcustomanim
endscript

script GetAttention_FacePlayer 
	ai_giveorder \{replacement = aimat_location_player
		name = Bv_AimAt_Location
		params = {
			finished_event_id = Big_Wave_Start
		}}
	wait \{$PedMaxGetAttentionAlignTime
		seconds}
	eventcache_add \{event_id = Big_Wave_Start}
endscript

script GetAttention_BigWave 
	SkaterGetScoreInfo
	if (<ScorePot> < $PedMaxScorePotForFarVoEnable)
		if getsingletag LastFarVoTime
			getelapsedtime starttime = <LastFarVoTime>
			if (<elapsedtime> > ($PedMinFarVoRepeatDelay * 1000))
				if ($NumAngryChaseBehaviorPeds = 0)
					getstarttime
					settags LastFarVoTime = <starttime>
					playvoiceoverbyevent event_id = far
				endif
			endif
		else
			if ($NumAngryChaseBehaviorPeds = 0)
				getstarttime
				settags LastFarVoTime = <starttime>
				playvoiceoverbyevent event_id = far
			endif
		endif
	endif
	getsingletag GetAttentionStartTime
	begin
	getelapsedtime starttime = <GetAttentionStartTime>
	if (<elapsedtime> > ($PedGetAttentionStopWavingTimeout * 1000))
		eventcache_add event_id = Wave_Timeout
		break
	endif
	obj_getid
	getdistance objecta = player1 objectb = <objid>
	if (<dist_atob> > $PedGetAttentionBigWaveStopRadius)
		eventcache_add event_id = Get_Attention_Done
		break
	else
		if (<dist_atob> < $PedGetAttentionSmallWaveStartRadius)
			eventcache_add event_id = Small_Wave_Start
			break
		endif
	endif
	ai_giveorder {
		replacement = anim
		name = Bv_PlayAnimSet ,
		params =
		{
			anim_stage = custom ,
			anim_set_id = Human_Attention_Far
			blend_in_dur = 0.2
			blend_out_dur = 0.2
			sync_start_time = false
			finished_event_id = Get_Attention_Anim_Finished
		}
	}
	blockuntilevent type = Get_Attention_Anim_Finished
	repeat
endscript

script GetAttention_SmallWave 
	getsingletag GetAttentionStartTime
	begin
	getelapsedtime starttime = <GetAttentionStartTime>
	if (<elapsedtime> > ($PedGetAttentionStopWavingTimeout * 1000))
		eventcache_add event_id = Wave_Timeout
		break
	endif
	obj_getid
	getdistance objecta = player1 objectb = <objid>
	if (<dist_atob> > $PedGetAttentionSmallWaveStopRadius)
		eventcache_add event_id = Big_Wave_Start
		break
	endif
	ai_giveorder {
		replacement = anim
		name = Bv_PlayAnimSet ,
		params =
		{
			anim_stage = custom ,
			anim_set_id = Human_Attention_Close
			blend_in_dur = 0.2
			blend_out_dur = 0.2
			sync_start_time = false
			finished_event_id = Get_Attention_Anim_Finished
		}
	}
	blockuntilevent type = Get_Attention_Anim_Finished
	repeat
endscript

script GetAttention_Idle 
	ai_giveorder {
		replacement = anim
		name = Bv_PlayAnimSet ,
		params =
		{
			anim_stage = custom ,
			anim_set_id = Human_Attention_Idle
			blend_in_dur = 0.2
			blend_out_dur = 0.2
			sync_start_time = false
			finished_event_id = Get_Attention_Anim_Finished
		}
	}
	blockuntilevent type = Get_Attention_Anim_Finished
	obj_getid
	getdistance objecta = player1 objectb = <objid>
	if (<dist_atob> > $PedGetAttentionBigWaveStopRadius)
		eventcache_add event_id = Get_Attention_Done
	else
		eventcache_add event_id = Became_Impatient
	endif
endscript

script GetAttention_Impatient 
	onexitrun GetAttention_Impatient_Exit
	getstarttime
	getrandomvalue name = vo_repeat_delay a = ($PedImpatientMinVoRepeatDelay * 1000) b = ($PedImpatientMaxVoRepeatDelay * 1000)
	if ($NumAngryChaseBehaviorPeds = 0)
		playvoiceoverbyevent event_id = Impatient
	endif
	getsingletag profile
	if structurecontains structure = <profile> bv_impatient_script
		obj_spawnscriptnow (<profile>.bv_impatient_script) params = {exit_okay_event_id = Custom_Bv_Exit_Okay}
	else
		ai_giveorder {
			replacement = anim
			name = Bv_PlayAnimSet ,
			params =
			{
				anim_stage = custom ,
				anim_set_id = Human_Impatient_Talk
				blend_in_dur = 0.2
				blend_out_dur = 0.2
				sync_start_time = false
				finished_event_id = Default_Anim_Finished
			}
		}
	endif
	begin
	blockuntilevent anytypes = [Default_Anim_Finished Custom_Bv_Exit_Okay]
	switch <type>
		case Default_Anim_Finished
		SendGetAttentionDoneEventIfPlayerIsFarAway
		getelapsedtime starttime = <starttime>
		if (<elapsedtime> > <vo_repeat_delay>)
			if ($NumAngryChaseBehaviorPeds = 0)
				playvoiceoverbyevent event_id = Impatient
			endif
			getstarttime
			getrandomvalue name = vo_repeat_delay a = ($PedImpatientMinVoRepeatDelay * 1000) b = ($PedImpatientMaxVoRepeatDelay * 1000)
			anim_set = Human_Impatient_Talk
		else
			anim_set = Human_Impatient_Idle
		endif
		ai_giveorder {
			replacement = anim
			name = Bv_PlayAnimSet ,
			params =
			{
				anim_stage = custom ,
				anim_set_id = <anim_set>
				blend_in_dur = 0.2
				blend_out_dur = 0.2
				sync_start_time = false
				finished_event_id = Default_Anim_Finished
			}
		}
		case Custom_Bv_Exit_Okay
		SendGetAttentionDoneEventIfPlayerIsFarAway
	endswitch
	repeat
endscript

script GetAttention_Impatient_Exit 
	getsingletag \{profile}
	if structurecontains structure = <profile> bv_impatient_script
		obj_killspawnedscript name = (<profile>.bv_impatient_script)
	endif
endscript

script SendGetAttentionDoneEventIfPlayerIsFarAway 
	obj_getid
	getdistance objecta = player1 objectb = <objid>
	if (<dist_atob> > $PedGetAttentionBigWaveStopRadius)
		eventcache_add \{event_id = Get_Attention_Done}
	endif
endscript

script ExampleImpatientScript 
	begin
	ai_giveorder {
		replacement = anim
		name = Bv_PlayAnimSet ,
		params =
		{
			anim_stage = custom ,
			anim_set_id = Human_Impatient_Talk
			blend_in_dur = 0.2
			blend_out_dur = 0.2
			sync_start_time = false
			finished_event_id = <exit_okay_event_id>
		}
	}
	blockuntilevent type = <exit_okay_event_id>
	repeat
endscript
