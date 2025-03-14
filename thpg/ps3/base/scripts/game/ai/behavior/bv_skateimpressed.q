PlayerWatchPointThreshold = 500
WatchPlayerRadius = 10.0
WatchPlayerMaxAlignTime = 2.0
NumPedsWatchingPlayer = 0
NumPedsWatchingPlayerOnLand = 0
CheatCheerleaderPeds = 0

script RegisterBehaviors_SkateImpressed 
	registerstate {
		name = Bv_ImpressLocalsDetect
		transitions = [{events = [enter_behavior]
				responses = [{
						replacement = dist_in_range
						state = Bv_GenEvents_Distance
						params = [{name = distance val = $WatchPlayerRadius}
							{name = greater_than val = Watch_Player_Out_Of_Range}
							{name = less_than val = Watch_Player_In_Range}
							{name = interest_type_id val = location}]
					}
					{replacement = detect_impressive_score
						state = ImpressLocalsDetectImpressiveScore
					}]
			}]
	}
	registerstate {
		name = Bv_WatchPlayer
		transitions = [{events = [enter_behavior]
				responses = [{replacement = init
						state = WatchPlayerInit
					}
					{replacement = move_stop
						state = Bv_Stop
					}
					{
						replacement = dist_cancel
						state = Bv_GenEvents_Distance
						params = [{name = distance val = $WatchPlayerRadius}
							{name = greater_than val = Watch_Player_Done}
							{name = less_than val = Null_Event}
							{name = interest_type_id val = location}]
					}
					{
						replacement = timer_align_limit
						state = Bv_Timer
						params = [{name = min_duration_secs val = $WatchPlayerMaxAlignTime}
							{name = max_duration_secs val = $WatchPlayerMaxAlignTime}
							{name = event_id val = Emulate_Is_Facing_Player}]
					}
					{replacement = movedesc
						state = Navigation_SetMoveDescription
						params = [{name = movement_desc val = {force_align = true shuffle = true}}]
					}
					{
						replacement = genevents_facing
						state = Bv_GenEvents_Facing
						params = [{name = finished_event_id val = Is_Facing_Player}
							{name = interest_type_id val = location}]
					}
					{
						replacement = aimat_location_player
						state = Bv_LookAt_Location
					}
					{
						replacement = action_when_aligned
						state = WatchPlayer_ActionWhenAligned
					}]
			}
			{
				events = [Emulate_Is_Facing_Player]
				recur = true
				responses = [{replacement = event_aligned
						state = eventcache_add
						params = [{name = event_id val = Is_Facing_Player}]
					}
					{replacement = timer_send_aligned_event
						state = Bv_Timer
						params = [{name = min_duration_secs val = 0.5}
							{name = max_duration_secs val = 0.5}
							{name = event_id val = Emulate_Is_Facing_Player}]
					}]
			}
			{
				events = [exit_behavior]
				responses = [{replacement = Watch_Player_Done
						state = OnWatchPlayerDone
					}]
			}]
	}
	registerstate {
		name = Bv_WatchPlayer_EncourageThenCheer
		transitions = [{
				events = [enter_behavior]
				responses = [{replacement = state
						state = Bv_WatchPlayer_EncourageThenCheer_Encourage
					}]
			}
			{
				events = [enter_behavior
					Cheer_Anim_Done]
				recur = true
				responses = [{replacement = script_anim
						state = PlayCheerAnim
						params = [{name = finished_event_id val = Cheer_Anim_Done}]
					}]
			}
			{
				events = [skaterlanded]
				responses = [{replacement = this
						state = Bv_WatchPlayer_FinalCheer
					}]
			}
			{
				events = [skaterbailed]
				responses = [{replacement = this
						state = Bv_WatchPlayer_HeckleWhenAligned
					}]
			}]
	}
	registerstate {
		name = Bv_WatchPlayer_EncourageThenCheer_Encourage
		transitions = [{
				events = [enter_behavior]
				responses = [{replacement = vo_keep_it_up
						state = playvoiceoverbyevent
						params = [{name = event_id val = KeepItUp}]
					}]
			}
			{
				events = [skaterlanded]
				responses = [{replacement = this
						state = Bv_WatchPlayer_EncourageThenCheer_Cheer
					}]
			}]
	}
	registerstate {
		name = Bv_WatchPlayer_EncourageThenCheer_Cheer
		transitions = [{events = [enter_behavior]
				responses = [{
						replacement = tokens_and_vo
						state = WatchPlayer_OnSkaterLanded
					}
					{
						replacement = timer_min_cheer_time
						state = Bv_Timer
						params = [{name = min_duration_secs val = 2.0}
							{name = max_duration_secs val = 2.0}
							{name = event_id val = Watch_Player_Finish_Anim}]
					}]
			}
			{
				events = [Watch_Player_Finish_Anim]
				responses = [{replacement = this
						state = Bv_WatchPlayer_EncourageThenCheer_FinishAnim
					}]
			}]
	}
	registerstate {
		name = Bv_WatchPlayer_EncourageThenCheer_FinishAnim
		transitions = [{events = [Cheer_Anim_Done]
				responses = [{replacement = event_finish
						state = eventcache_add
						params = [{name = event_id val = Watch_Player_Done}]
					}]
			}]
	}
	registerstate {
		name = Bv_WatchPlayer_FinalCheer
		transitions = [{
				events = [enter_behavior]
				recur = true
				responses = [{replacement = script_anim
						state = PlayFinalCheerAnim
						params = [{name = finished_event_id val = Watch_Player_Done}]
					}]
			}]
	}
	registerstate {
		name = Bv_WatchPlayer_CheerWhenAligned
		transitions = [{events = [Is_Facing_Player]
				responses = [{replacement = script_anim
						state = PlayCheerAnim
						params = [{name = finished_event_id val = Watch_Player_Done}]
					}
					{
						replacement = tokens_and_vo
						state = WatchPlayer_OnSkaterLanded
					}]
			}]
	}
	registerstate {
		name = Bv_WatchPlayer_HeckleWhenAligned
		transitions = [{events = [Is_Facing_Player]
				responses = [{replacement = anim
						state = Bv_PlayAnimSet ,
						params = [{name = anim_stage val = custom}
							{name = anim_set_id val = Human_Jeer_Once}
							{name = blend_in_dur val = 0.2}
							{name = blend_out_dur val = 0.2}
							{name = sync_start_time val = false}
							{name = finished_event_id val = Watch_Player_Done}]
					}
					{
						replacement = cleanup
						state = OnWatchPlayerDone
					}
					{
						replacement = vo
						state = PlayHeckleVoIfLast
					}]
			}]
	}
endscript

script ImpressLocalsDetectImpressiveScore 
	if NOT compositeobjectexists \{player1}
		return
	endif
	agent_setinterest \{interest_type_id = location
		object_id = player1
		acquire_vis_loc = false}
	begin
	blockuntilevent \{type = Watch_Player_In_Range}
	if IsSpectatorPedWatchPlayerEnabled
		if NOT skater :isinbail
			if skatercurrentscorepotgreaterthan \{$PlayerWatchPointThreshold}
				eventcache_add \{event_id = Impressive_Score_Detected}
			endif
		endif
	endif
	repeat
endscript

script WatchPlayerInit 
	agent_stopcustomanims
	change NumPedsWatchingPlayer = ($NumPedsWatchingPlayer + 1)
	change \{NumPedsWatchingPlayerOnLand = $NumPedsWatchingPlayer}
	settags \{is_watching_player = 1}
	agent_setinterest \{interest_type_id = location
		object_id = player1
		acquire_vis_loc = false}
endscript

script WatchPlayer_ActionWhenAligned 
	blockuntilevent \{anytypes = [
			Is_Facing_Player
			skaterlanded
			skaterbailed
		]}
	switch <type>
		case Is_Facing_Player
		if (skatercurrentscorepotgreaterthan 0)
			ai_giveorder \{replacement = state
				name = Bv_WatchPlayer_EncourageThenCheer}
		else
			eventcache_add \{event_id = Watch_Player_Done}
		endif
		case skaterlanded
		ai_giveorder \{replacement = state
			name = Bv_WatchPlayer_CheerWhenAligned}
		case skaterbailed
		ai_giveorder \{replacement = state
			name = Bv_WatchPlayer_HeckleWhenAligned}
	endswitch
endscript

script WatchPlayer_OnSkaterLanded 
	impress_locals_drop_stokens
	OnWatchPlayerDone
	PlayCheerVoIfLast
endscript

script OnWatchPlayerDone 
	gettags
	if (<is_watching_player> = 1)
		change NumPedsWatchingPlayer = ($NumPedsWatchingPlayer - 1)
		settags \{is_watching_player = 0}
	endif
endscript

script PlayCheerAnim 
	if ($CheatCheerleaderPeds = 1)
		ai_giveorder {replacement = move_desc
			name = bv_setmovedesc
			params = {movement_desc = {shuffle = false}
				movement_desc_stage = action}}
		ai_giveorder {replacement = anim
			name = Bv_CustomAnim
			params = {anim = Cheerleader_Cheers
				blend_period = 0.2
				custom_finished_event_id = <finished_event_id>}}
	else
		ai_giveorder {replacement = anim
			name = Bv_PlayAnimSet
			params = {anim_stage = custom
				anim_set_id = Human_Cheer
				blend_in_dur = 0.2
				blend_out_dur = 0.2
				sync_start_time = false
				finished_event_id = <finished_event_id>}}
	endif
endscript

script PlayFinalCheerAnim 
	ai_giveorder \{replacement = move_desc
		name = bv_setmovedesc
		params = {
			movement_desc = {
				shuffle = false
			}
			movement_desc_stage = action
		}}
	ai_giveorder {replacement = anim
		name = Bv_CustomAnim
		params = {anim = Full_Cheer
			blend_period = 0.2
			custom_finished_event_id = <finished_event_id>}}
endscript

script PlayKeepItUpCheerVO 
	Master_Ped_AI_VO_KeepItUp
endscript

script PlayCheerVoIfLast 
	if ($NumPedsWatchingPlayer = 0)
		Master_Crowd_VO_CheerLand \{numpedsactivated = $NumPedsWatchingPlayerOnLand}
		playvoiceoverbyevent \{event_id = CheerLand}
	endif
endscript

script PlayHeckleVoIfLast 
	if ($NumPedsWatchingPlayer = 0)
		Master_Crowd_VO_BooLand \{numpedsactivated = $NumPedsWatchingPlayerOnLand}
		playvoiceoverbyevent \{event_id = BooLand}
	endif
endscript

script impress_locals_drop_stokens 
	gettags
	if (<is_watching_player> = 0)
		return
	endif
	if ($NumPedsWatchingPlayer < 1)
		scriptassert \{"Invalid count for NumPedsWatchingPlayer."}
		change \{NumPedsWatchingPlayer = 1}
	endif
	SkaterGetScoreInfo
	if (<lastscorelanded> > $PlayerWatchPointThreshold)
		if ($toggle_show_stoken_msg = 1)
			panel_got_stoken
		endif
		soundevent \{event = Impress_Locals_Stoken_Sound}
	endif
endscript

script impress_locals_stoken_msg_style 
	domorph \{alpha = 0.0}
	domorph \{scale = 0.6
		alpha = 1
		time = 0.3}
	domorph \{scale = 0.5
		time = 0.2}
	domorph \{scale = 0.6
		time = 0.15}
	domorph \{scale = 0.5
		time = 0.1}
	domorph \{alpha = 0.0
		time = 2.0}
	die
endscript
