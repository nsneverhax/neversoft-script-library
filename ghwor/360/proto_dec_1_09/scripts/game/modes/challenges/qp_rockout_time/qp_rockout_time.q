qp_rockout_time_info = {
	Name = 'qp_rockout_time'
	goal_type = quickplay_challenge
	constants = {
		song_complete = qp_rockout_time_song_complete
		target_value = Duration
		desc_txt = qs(0xe0f515be)
	}
	data = {
		percent_targets = [
			2
			4
			6
		]
		calculated_targets = [
			-1
			-1
			-1
		]
		valid_sections = [
		]
	}
	player_data = {
		current_progress = 0
		section_base_value = 0
		previous_progress = 0
		old_rockout_value = 0
	}
	checkpoints = [
		{
			Name = 'main'
			tools = [
				{
					Name = 'watcher'
					Type = var_watcher
					var_updated = qp_rockout_time_watcher_update
					vars = [
						{
							Source = playerinfo
							var = star_power_used
							Type = int
						}
					]
				}
				{
					Name = 'input'
					Type = rawinput
					analog_callback = qp_rockout_time_motion_watcher
				}
				{
					Name = 'timer'
					Type = Timer
					start_time = 0
					end_time = 600
					dont_start_on_enter
					dont_show_on_enter
					dont_show_expire_message
					tic = qp_rockout_time_main_timer_tic
					tic_interval_ms = 100
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
					section_marker_hit = qp_rockout_time_section_marker_hit
				}
			]
		}
	]
}

script qp_rockout_time_watcher_update 
	if NOT challenge_qp_current_section_is_valid goal_id = <goal_id>
		qp_rockout_time_stop_timer assigned_player = <assigned_player> goal_id = <goal_id>
		return
	endif
	if (<current_value> = 0)
		qp_rockout_time_stop_timer assigned_player = <assigned_player> goal_id = <goal_id>
	endif
endscript

script qp_rockout_time_timeout 
	Wait \{1
		Second}
	printf \{channel = qp_challenge
		'There was not enough Rocking Out, stop counting'}
	qp_rockout_time_stop_timer assigned_player = <assigned_player> goal_id = <goal_id>
endscript

script qp_rockout_time_stop_timer \{assigned_player = -1
		goal_id = NULL}
	formatText checksumName = timeout_script_id 'rockout_timeout_%t' t = <assigned_player>
	KillSpawnedScript id = <timeout_script_id>
	gman_timerfunc goal = <goal_id> tool = Timer func = stop
endscript

script qp_rockout_time_motion_watcher 
	if NOT challenge_qp_current_section_is_valid goal_id = <goal_id>
		qp_rockout_time_stop_timer goal_id = <goal_id> assigned_player = <assigned_player>
		return
	endif
	getplayerinfo <assigned_player> is_local_client
	if (<is_local_client> = 0)
		return
	endif
	<current_value> = (<tilt_angle>)
	getplayerinfo <assigned_player> star_power_used
	if (<star_power_used> = 1)
		gman_getdata goal = <goal_id> Player = <assigned_player> Name = old_rockout_value
		if ((<current_value> > (<old_rockout_value> + 0.5)) || (<current_value> < (<old_rockout_value> - 0.5)))
			gman_setdata goal = <goal_id> Player = <assigned_player> params = {old_rockout_value = <current_value>}
			gman_timerfunc goal = <goal_id> tool = Timer func = start
			formatText checksumName = timeout_script_id 'rockout_timeout_%t' t = <assigned_player>
			KillSpawnedScript id = <timeout_script_id>
			SpawnScriptNow qp_rockout_time_timeout params = {assigned_player = <assigned_player> goal_id = <goal_id>} id = <timeout_script_id>
			return
		endif
	endif
endscript

script qp_rockout_time_main_timer_tic 
	<0xc5c763d3> = (<time_ms> / 1000)
	gman_setdata goal = <goal_id> Player = <assigned_player> params = {current_progress = <0xc5c763d3>}
endscript

script qp_rockout_time_section_marker_hit 
	getplayerinfo <assigned_player> star_power_used
	qp_rockout_time_watcher_update goal_id = <goal_id> assigned_player = <assigned_player> current_value = <star_power_used>
endscript
