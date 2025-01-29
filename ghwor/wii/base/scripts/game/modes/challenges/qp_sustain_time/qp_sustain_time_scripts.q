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
			Name = 'main'
			tools = [
				{
					Name = 'sustain_event'
					Type = event_listener
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
					Name = 'sustain_event_drums'
					Type = event_listener
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
					Name = 'timer'
					Type = Timer
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
					Name = 'whammy_watcher'
					var_updated = qp_sustain_time_main_whammy_watcher
					Type = var_watcher
					vars = [
						{
							Source = playerinfo
							var = whammy_control
							Type = float
						}
					]
				}
				{
					Name = 'progress_watcher'
					Type = var_watcher
					var_updated = challenge_qp_evaluate_progress
					vars = [
						{
							Source = goalplayerdata
							var = current_progress
							Type = float
						}
					]
				}
				{
					Name = 'section_watcher'
					Type = section_watcher
				}
			]
		}
	]
}

script qp_sustain_time_main_sustain_event 
	<Player> = (<event_data>.Player)
	if NOT challenge_qp_current_section_is_valid goal_id = <goal_id>
		gman_setdata goal = <goal_id> Player = <Player> params = {hitting_sustain_note = 0}
		qp_sustain_time_stop_timer goal_id = <goal_id> Player = <Player>
		return
	endif
	formatText checksumName = whammy_off 'whammy_offp%t' t = <Player>
	formatText checksumName = whammy_on 'whammy_onp%t' t = <Player>
	switch <event>
		case (<whammy_on>)
		gman_setdata goal = <goal_id> Player = <Player> params = {hitting_sustain_note = 1}
		gman_getconstant goal = <goal_id> Name = required_modifier return_name = required_modifier
		if NOT (<required_modifier> = whammy)
			gman_timerfunc goal = <goal_id> tool = Timer func = start
		endif
		case (<whammy_off>)
		gman_setdata goal = <goal_id> Player = <Player> params = {hitting_sustain_note = 0}
		qp_sustain_time_stop_timer goal_id = <goal_id> Player = <Player>
	endswitch
endscript

script qp_sustain_time_main_sustain_event_drums 
	<Player> = (<assigned_player>)
	formatText checksumName = whammy_off 'whammy_offp%t' t = <Player>
	formatText checksumName = whammy_on 'whammy_onp%t' t = <Player>
	formatText checksumName = drumsustain_startscore 'drumsustain_startscorep%t' t = <Player>
	formatText checksumName = drumsustain_stopscore 'drumsustain_stopscorep%t' t = <Player>
	switch <event>
		case (<drumsustain_startscore>)
		<event> = (<whammy_on>)
		case (<drumsustain_stopscore>)
		<event> = (<whammy_off>)
	endswitch
	qp_sustain_time_main_sustain_event <...>
endscript

script qp_sustain_time_stop_timer \{Player = -1
		goal_id = NULL}
	formatText checksumName = timeout_script_id 'whammy_timeout_%t' t = <Player>
	KillSpawnedScript id = <timeout_script_id>
	gman_timerfunc goal = <goal_id> tool = Timer func = stop
endscript

script qp_sustain_time_main_timer_tic 
	gman_setdata goal = <goal_id> Player = <assigned_player> params = {current_progress = <time_ms>}
endscript

script qp_sustain_time_main_whammy_watcher 
	gman_getconstant goal = <goal_id> Name = required_modifier return_name = required_modifier
	if NOT (<required_modifier> = whammy)
		return
	endif
	if NOT challenge_qp_current_section_is_valid goal_id = <goal_id>
		gman_setdata goal = <goal_id> Player = <Player> params = {hitting_sustain_note = 0}
		qp_sustain_time_stop_timer goal_id = <goal_id> Player = <Player>
		return
	endif
	formatText checksumName = timeout_script_id 'whammy_timeout_%t' t = <Player>
	getplayerinfo <Player> is_local_client
	if (<is_local_client> = 0)
		return
	endif
	gman_getdata goal = <goal_id> Player = <Player> Name = hitting_sustain_note
	if (<hitting_sustain_note> = 1)
		gman_getdata goal = <goal_id> Player = <Player> Name = old_whammy_pos
		if ((<current_value> > (<old_whammy_pos> + 0.1)) || (<current_value> < (<old_whammy_pos> - 0.1)))
			gman_setdata goal = <goal_id> Player = <Player> params = {old_whammy_pos = <current_value>}
			gman_timerfunc goal = <goal_id> tool = Timer func = start
			KillSpawnedScript id = <timeout_script_id>
			SpawnScriptNow qp_sustain_time_main_whammy_timeout params = {Player = <Player> goal_id = <goal_id>} id = <timeout_script_id>
			return
		endif
	else
		gman_timerfunc goal = <goal_id> tool = Timer func = stop
		gman_setdata goal = <goal_id> Player = <Player> params = {old_whammy_pos = 0}
	endif
endscript

script qp_sustain_time_main_whammy_timeout 
	Wait \{0.1
		Second}
	if GMan_GoalIsActive goal = <goal_id>
		gman_timerfunc goal = <goal_id> tool = Timer func = stop
		gman_setdata goal = <goal_id> Player = <Player> params = {old_whammy_pos = 0}
	endif
endscript

script qp_sustain_time_display_seconds_conversion 
	out_score = (<score> * 0.001)
	return score = <out_score>
endscript
