g_qp_sustain_time_core = {
	player_data = {
		current_progress = 0
		section_base_value = 0
		previous_progress = 0
		hitting_sustain_note = 0
		old_whammy_pos = 0
	}
	checkpoints = [
		{
			name = 'main'
			tools = [
				{
					name = 'sustain_event'
					type = event_listener
					got_event = qp_sustain_time_main_sustain_event
					callback_mode = any
					events = [
						whammy_onp1
						whammy_onp2
						whammy_onp3
						whammy_onp4
						whammy_offp1
						whammy_offp2
						whammy_offp3
						whammy_offp4
					]
				}
				{
					name = 'sustain_event_drums'
					type = event_listener
					got_event = qp_sustain_time_main_sustain_event_drums
					callback_mode = any
					events = [
						drumsustain_startscorep1
						drumsustain_startscorep2
						drumsustain_startscorep3
						drumsustain_startscorep4
						drumsustain_stopscorep1
						drumsustain_stopscorep2
						drumsustain_stopscorep3
						drumsustain_stopscorep4
					]
				}
				{
					name = 'timer'
					type = timer
					start_time = 0
					end_time = 600
					dont_start_on_enter
					dont_show_on_enter
					dont_show_expire_message
					tic = qp_sustain_time_main_timer_tic
					tic_interval_ms = 10
					is_song_timer
				}
				{
					name = 'whammy_watcher'
					var_updated = qp_sustain_time_main_whammy_watcher
					type = var_watcher
					vars = [
						{
							source = playerinfo
							var = whammy_control
							type = float
						}
					]
				}
				{
					name = 'progress_watcher'
					type = var_watcher
					var_updated = challenge_qp_evaluate_progress
					vars = [
						{
							source = goalplayerdata
							var = current_progress
							type = float
						}
					]
				}
				{
					name = 'section_watcher'
					type = section_watcher
				}
			]
		}
	]
}

script qp_sustain_time_main_sustain_event 
	<player> = (<event_data>.player)
	if NOT challenge_qp_current_section_is_valid goal_id = <goal_id>
		gman_setdata goal = <goal_id> player = <player> params = {hitting_sustain_note = 0}
		qp_sustain_time_stop_timer goal_id = <goal_id> player = <player>
		return
	endif
	formattext checksumname = whammy_off 'whammy_offp%t' t = <player>
	formattext checksumname = whammy_on 'whammy_onp%t' t = <player>
	switch <event>
		case (<whammy_on>)
		gman_setdata goal = <goal_id> player = <player> params = {hitting_sustain_note = 1}
		gman_getconstant goal = <goal_id> name = required_modifier return_name = required_modifier
		if NOT (<required_modifier> = whammy)
			gman_timerfunc goal = <goal_id> tool = timer func = start
		endif
		case (<whammy_off>)
		gman_setdata goal = <goal_id> player = <player> params = {hitting_sustain_note = 0}
		qp_sustain_time_stop_timer goal_id = <goal_id> player = <player>
	endswitch
endscript

script qp_sustain_time_main_sustain_event_drums 
	<player> = (<assigned_player>)
	formattext checksumname = whammy_off 'whammy_offp%t' t = <player>
	formattext checksumname = whammy_on 'whammy_onp%t' t = <player>
	formattext checksumname = drumsustain_startscore 'drumsustain_startscorep%t' t = <player>
	formattext checksumname = drumsustain_stopscore 'drumsustain_stopscorep%t' t = <player>
	switch <event>
		case (<drumsustain_startscore>)
		<event> = (<whammy_on>)
		case (<drumsustain_stopscore>)
		<event> = (<whammy_off>)
	endswitch
	qp_sustain_time_main_sustain_event <...>
endscript

script qp_sustain_time_stop_timer \{player = -1
		goal_id = null}
	formattext checksumname = timeout_script_id 'whammy_timeout_%t' t = <player>
	killspawnedscript id = <timeout_script_id>
	gman_timerfunc goal = <goal_id> tool = timer func = stop
endscript

script qp_sustain_time_main_timer_tic 
	gman_setdata goal = <goal_id> player = <assigned_player> params = {current_progress = <time_ms>}
endscript

script qp_sustain_time_main_whammy_watcher 
	gman_getconstant goal = <goal_id> name = required_modifier return_name = required_modifier
	if NOT (<required_modifier> = whammy)
		return
	endif
	if NOT challenge_qp_current_section_is_valid goal_id = <goal_id>
		gman_setdata goal = <goal_id> player = <player> params = {hitting_sustain_note = 0}
		qp_sustain_time_stop_timer goal_id = <goal_id> player = <player>
		return
	endif
	formattext checksumname = timeout_script_id 'whammy_timeout_%t' t = <player>
	getplayerinfo <player> is_local_client
	if (<is_local_client> = 0)
		return
	endif
	gman_getdata goal = <goal_id> player = <player> name = hitting_sustain_note
	if (<hitting_sustain_note> = 1)
		gman_getdata goal = <goal_id> player = <player> name = old_whammy_pos
		if ((<current_value> > (<old_whammy_pos> + 0.1)) || (<current_value> < (<old_whammy_pos> - 0.1)))
			gman_setdata goal = <goal_id> player = <player> params = {old_whammy_pos = <current_value>}
			gman_timerfunc goal = <goal_id> tool = timer func = start
			killspawnedscript id = <timeout_script_id>
			spawnscriptnow qp_sustain_time_main_whammy_timeout params = {player = <player> goal_id = <goal_id>} id = <timeout_script_id>
			return
		endif
	else
		gman_timerfunc goal = <goal_id> tool = timer func = stop
		gman_setdata goal = <goal_id> player = <player> params = {old_whammy_pos = 0}
	endif
endscript

script qp_sustain_time_main_whammy_timeout 
	wait \{0.1
		second}
	if gman_goalisactive goal = <goal_id>
		gman_timerfunc goal = <goal_id> tool = timer func = stop
		gman_setdata goal = <goal_id> player = <player> params = {old_whammy_pos = 0}
	endif
endscript

script qp_sustain_time_display_seconds_conversion 
	out_score = (<score> * 0.001)
	return score = <out_score>
endscript
