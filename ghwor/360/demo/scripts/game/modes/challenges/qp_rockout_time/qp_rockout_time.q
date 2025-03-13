qp_rockout_time_info = {
	name = 'qp_rockout_time'
	goal_type = quickplay_challenge
	title_string = qs(0xe0f515be)
	constants = {
		song_complete = qp_rockout_time_song_complete
		target_value = songstat_max_starpower
		leaderboard_metric_string = qs(0x8796bdae)
		desc_txt = qs(0x4ed87b5c)
		units_txt = qs(0xe0a15b60)
		score_converion_script = qp_rockout_time_display_seconds_conversion
		single_play_only
	}
	data = {
		percent_targets = [
			7000
			9000
			12000
		]
		calculated_targets = [
			-1
			-1
			-1
		]
		round_direction = down
		round_to_nearest = 1000
	}
	player_data = {
		current_progress = 0
		section_base_value = 0
		previous_progress = 0
		old_rockout_value = 0
	}
	checkpoints = [
		{
			name = 'main'
			tools = [
				{
					name = 'watcher'
					type = var_watcher
					var_updated = qp_rockout_time_watcher_update
					vars = [
						{
							source = playerinfo
							var = star_power_used
							type = int
						}
					]
				}
				{
					name = 'input'
					type = rawinput
					analog_callback = qp_rockout_time_motion_watcher
					read_guitar_analog_inputs
				}
				{
					name = 'timer'
					type = timer
					start_time = 0
					end_time = 600
					dont_start_on_enter
					dont_show_on_enter
					dont_show_expire_message
					tic = qp_rockout_time_main_timer_tic
					tic_interval_ms = 10
					is_song_timer
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
	wait \{0.5
		second}
	if gman_goalisactive goal = <goal_id>
		qp_rockout_time_stop_timer assigned_player = <assigned_player> goal_id = <goal_id>
	endif
endscript

script qp_rockout_time_stop_timer \{assigned_player = -1
		goal_id = null}
	formattext checksumname = timeout_script_id 'rockout_timeout_%t' t = <assigned_player>
	gman_timerfunc goal = <goal_id> tool = timer func = stop
	killspawnedscript id = <timeout_script_id>
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
		gman_getdata goal = <goal_id> player = <assigned_player> name = old_rockout_value
		if gotparam \{current_value}
			if ((<current_value> > (<old_rockout_value> + 0.25)) || (<current_value> < (<old_rockout_value> - 0.25)))
				gman_setdata goal = <goal_id> player = <assigned_player> params = {old_rockout_value = <current_value>}
				gman_timerfunc goal = <goal_id> tool = timer func = start
				formattext checksumname = timeout_script_id 'rockout_timeout_%t' t = <assigned_player>
				killspawnedscript id = <timeout_script_id>
				spawnscript qp_rockout_time_timeout params = {assigned_player = <assigned_player> goal_id = <goal_id>} id = <timeout_script_id>
				return
			endif
		endif
	endif
endscript

script qp_rockout_time_main_timer_tic 
	gman_setdata goal = <goal_id> player = <assigned_player> params = {current_progress = <time_ms>}
endscript

script qp_rockout_time_section_marker_hit 
	getplayerinfo <assigned_player> star_power_used
	qp_rockout_time_watcher_update goal_id = <goal_id> assigned_player = <assigned_player> current_value = <star_power_used>
endscript

script qp_rockout_time_song_complete 
	killspawnedscript \{name = qp_rockout_time_timeout}
	challenge_output_grade_marks <...>
endscript

script qp_rockout_time_display_seconds_conversion 
	out_score = (<score> * 0.001)
	return score = <out_score>
endscript
