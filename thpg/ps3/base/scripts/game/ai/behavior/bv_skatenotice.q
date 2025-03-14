PedNoticePlayerDelay = 1.0
PedNoticeRepeatDelay = 20.0
PedNoticePlayerStopDelay = 1.0
MaxNoticeBehaviorPeds = 1
NoVoNoticeMinSecs = 3.0
NoVoNoticeMaxSecs = 5.0
NumNoticeBehaviorPeds = 0

script RegisterBehaviors_SkateNotice 
	registerstate {
		name = Bv_NoticeDetect
		transitions = [{events = [enter_behavior]
				responses = [{
						replacement = state
						state = Bv_NoticeDetect_InitDelay
					}]
			}
			{events = [Disable_Notice_Detect]
				responses = [{
						replacement = state
						state = Bv_NoticeDetect_Disabled
					}]
			}
			{
				events = [Notice_Detect_Enable]
				responses = [{replacement = state
						state = Bv_NoticeDetect_WaitForPlayerToGetClose
					}]
			}]
	}
	registerstate {
		name = Bv_NoticeDetect_Disabled
		transitions = []
	}
	registerstate {
		name = Bv_NoticeDetect_WaitForPlayerToGetClose
		transitions = [{events = [enter_behavior]
				responses = [{replacement = dist
						state = Notice_GenEventsNoticeDist
						params = [{name = greater_than val = Null_Event}
							{name = less_than val = Player_In_Notice_Range}]
					}]
			}
			{
				events = [Player_In_Notice_Range]
				responses = [{replacement = this
						state = Bv_NoticeDetect_WaitWhileInRange
					}]
			}]
	}
	registerstate {
		name = Bv_NoticeDetect_WaitWhileInRange
		transitions = [{
				events = [enter_behavior]
				responses = [{
						replacement = dist
						state = Notice_GenEventsNoticeDist
						params = [{name = greater_than val = Player_Out_Of_Notice_Range}
							{name = less_than val = Null_Event}]
					}
					{
						replacement = timer
						state = Bv_Timer
						params = [{name = min_duration_secs val = $PedNoticePlayerDelay}
							{name = max_duration_secs val = $PedNoticePlayerDelay}
							{name = event_id val = Start_Player_Noticed}]
					}]
			}
			{
				events = [Player_Out_Of_Notice_Range]
				responses = [{replacement = this
						state = Bv_NoticeDetect_WaitForPlayerToGetClose
					}]
			}
			{
				events = [Start_Player_Noticed]
				conditions = [{name = agent_comparereactionstateparam
						params = {param = notice_enabled val = true}
					}]
				responses = [{replacement = this
						state = Bv_NoticeDetect_SendNoticedEvent
					}]
			}]
	}
	registerstate {
		name = Bv_NoticeDetect_SendNoticedEvent
		transitions = [{
				events = [enter_behavior]
				responses = [{
						replacement = dist
						state = Notice_GenEventsNoticeDist
						params = [{name = greater_than val = Player_Outside_Of_Notice_Range}
							{name = less_than val = Player_Maybe_Noticed}]
					}]
			}
			{
				events = [Player_Inside_Of_Notice_Range]
				conditions = [{name = IsNoticeVoAllowed}]
				responses = [{replacement = event_player_maybe_noticed
						state = eventcache_add
						params = [{name = event_id val = Player_Maybe_Noticed}]
					}]
			}
			{
				events = [Player_Maybe_Noticed]
				conditions = [{name = agent_comparereactionstateparam
						params = {param = notice_enabled val = true}
					}]
				responses = [{replacement = event_player_noticed
						state = eventcache_add
						params = [{name = event_id val = Player_Noticed}]
					}]
			}
			{
				events = [Player_Outside_Of_Notice_Range]
				responses = [{replacement = this
						state = Bv_NoticeDetect_WaitForPlayerToGetClose
					}]
			}]
	}
	registerstate {
		name = Bv_Notice
		transitions = [{events = [enter_behavior]
				responses = [{
						replacement = notice_ped_count
						state = Notice_IncrementPedCount
					}
					{
						replacement = state
						state = Bv_Notice_StopWalking
					}]
			}
			{events = [exit_behavior]
				responses = [{
						replacement = notice_ped_count
						state = Notice_DecrementPedCount
					}]
			}]
	}
	registerstate {
		name = Bv_Notice_StopWalking
		transitions = [{events = [enter_behavior]
				responses = [{replacement = move_stop
						state = Bv_Stop
					}
					{replacement = save_start_time
						state = Notice_SaveStartTime
					}
					{replacement = timer_stop
						state = Bv_Timer
						params = [{name = min_duration_secs val = $PedNoticePlayerStopDelay}
							{name = max_duration_secs val = $PedNoticePlayerStopDelay}
							{name = event_id val = Notice_Stop_Walking_Done}]
					}]
			}
			{
				events = [Notice_Stop_Walking_Done]
				responses = [{replacement = this
						state = Bv_Notice_FacePlayer
					}]
			}]
	}
	registerstate {
		name = Bv_Notice_FacePlayer
		transitions = [{events = [enter_behavior]
				responses = [{
						replacement = interest_location_player
						state = agent_setinterest
						params = [{name = interest_type_id val = location}
							{name = object_id val = player1}
							{name = acquire_vis_loc val = false}]
					}
					{replacement = force_align
						state = bv_setmovedesc
						params = [{name = movement_desc val = {force_align = true}}
							{name = movement_desc_stage val = action}]
					}
					{replacement = lookat_location_player
						state = Bv_AimAt_Location
						params = [{name = finished_event_id val = Is_Facing_Player}]
					}]
			}
			{
				events = [Is_Facing_Player]
				responses = [{replacement = this
						state = Bv_Notice_Interact
					}]
			}]
	}
	registerstate {
		name = Bv_Notice_Interact
		transitions = [{events = [enter_behavior]
				responses = [{
						replacement = interest_location_player
						state = agent_setinterest
						params = [{name = interest_type_id val = location}
							{name = object_id val = player1}
							{name = acquire_vis_loc val = false}]
					}
					{replacement = force_align
						state = bv_setmovedesc
						params = [{name = movement_desc val = {force_align = true}}
							{name = movement_desc_stage val = action}]
					}
					{replacement = lookat_location_player
						state = Bv_AimAt_Location
						params = [{name = finished_event_id val = Is_Facing_Player}]
					}
					{
						replacement = script_interaction
						state = Notice_Interact
					}]
			}]
	}
endscript

script IsNoticeVoAllowed 
	if ($NumNoticeBehaviorPeds < $MaxNoticeBehaviorPeds)
		if ($IdleVoIsPlaying = false)
			return \{true}
		endif
	endif
	return \{false}
endscript

script Bv_NoticeDetect_InitDelay 
	force_notice = false
	if globalexists name = allow_notice_without_vo type = integer
		if ($allow_notice_without_vo = 1)
			<force_notice> = true
		endif
	endif
	getsingletag has_notice_vo
	if ((<has_notice_vo> = true) || (<force_notice> = true))
		begin
		if (compositeobjectexists player1)
			break
		endif
		wait 1 gameframe
		repeat
		agent_setinterest interest_type_id = location object_id = player1 acquire_vis_loc = false
		if getsingletag LastNoticeTime
			getelapsedtime starttime = <LastNoticeTime>
			elapsed_secs = (<elapsedtime> / 1000)
			remaining_time = ($PedNoticeRepeatDelay - <elapsed_secs>)
			if (<remaining_time> > 0.0)
				wait <remaining_time> seconds
			endif
			eventcache_add event_id = Notice_Detect_Enable
		else
			eventcache_add event_id = Notice_Detect_Enable
		endif
	else
		eventcache_add event_id = Disable_Notice_Detect
	endif
endscript

script Notice_IncrementPedCount 
	if NOT IsNoticeVoAllowed
		eventcache_add \{event_id = Notice_Reaction_Done}
	endif
	change NumNoticeBehaviorPeds = ($NumNoticeBehaviorPeds + 1)
endscript

script Notice_DecrementPedCount 
	change NumNoticeBehaviorPeds = ($NumNoticeBehaviorPeds - 1)
endscript

script Notice_SaveStartTime 
	getstarttime
	settags LastNoticeTime = <starttime>
endscript

script Notice_GenEventsNoticeDist 
	getsingletag \{profile}
	ai_giveorder {replacement = dist_location_player1
		name = Bv_GenEvents_Distance
		params = {distance = (<profile>.notice_radius)
			greater_than = <greater_than>
			less_than = <less_than>
			interest_type_id = location}}
endscript

script Notice_Interact 
	getsingletag profile
	if structurecontains structure = <profile> bv_notice_script
		obj_spawnscriptnow (<profile>.bv_notice_script) params = {finished_event_id = Notice_Reaction_Done}
	else
		ai_giveorder {name = Bv_PlayAnimSet ,
			params = {anim_stage = custom ,
				anim_set_id = Human_Notice ,
				blend_in_dur = 0.2
				blend_out_dur = 0.2
				sync_start_time = false}
		}
		getsingletag has_notice_vo
		if (<has_notice_vo> = true)
			playvoiceoverbyevent event_id = Notice finished_event_id = Notice_Reaction_Done failed_event_id = Notice_Reaction_Done
		else
			getrandomvalue name = notice_duration a = $NoVoNoticeMinSecs b = $NoVoNoticeMaxSecs float
			wait <notice_duration> seconds
			eventcache_add event_id = Notice_Reaction_Done
		endif
	endif
	block
endscript

script Notice_KillInteractScript 
	getsingletag \{profile}
	if structurecontains structure = <profile> bv_notice_script
		obj_killspawnedscript name = (<profile>.bv_notice_script)
	endif
endscript

script ExampleNoticeScript 
	agent_playcustomanim anim = PedM_Clap02_P blend_period = 0.2 motion_extract = false finished_event_id = <finished_event_id>
endscript
