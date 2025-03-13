qp_multiplier_time_info = {
	name = 'qp_multiplier_time'
	goal_type = quickplay_challenge
	title_string = qs(0xc94d7155)
	constants = {
		song_complete = challenge_output_grade_marks
		target_value = duration
		target_multiplier = 4
		leaderboard_metric_string = qs(0x8796bdae)
		desc_txt = qs(0xa4a6add0)
		units_txt = qs(0xe0a15b60)
		score_converion_script = qp_multiplier_time_display_seconds_conversion
	}
	data = {
		percent_targets = [
			40000
			65000
			80000
		]
		calculated_targets = [
			-1
			-1
			-1
		]
		round_direction = down
		round_to_nearest = 1000
	}
	$g_qp_multiplier_time_core
}
qp_multiplier_time_band_info = {
	name = 'qp_multiplier_time_band'
	goal_type = quickplay_challenge
	goal_subtype = band
	title_string = qs(0xc94d7155)
	constants = {
		song_complete = challenge_output_grade_marks
		target_value = duration
		target_multiplier = 5
		leaderboard_metric_string = qs(0x8796bdae)
		desc_txt = qs(0x701d4341)
		units_txt = qs(0xe0a15b60)
		score_converion_script = qp_multiplier_time_display_seconds_conversion
	}
	data = {
		percent_targets = [
			5000
			10000
			20000
		]
		calculated_targets = [
			-1
			-1
			-1
		]
		round_direction = down
		round_to_nearest = 1000
	}
	$g_qp_multiplier_time_core
}
g_qp_multiplier_time_core = {
	player_data = {
		current_progress = 0
		section_base_value = 0
		previous_progress = 0
	}
	initial_data = {
		current_progress = 0
	}
	checkpoints = [
		{
			name = 'main'
			tools = [
				{
					name = 'watcher'
					type = var_watcher
					var_updated = qp_multiplier_time_watcher_update
					vars = [
						{
							source = playerinfo
							var = current_run
							type = int
						}
					]
				}
				{
					name = 'watcher_band'
					type = var_watcher
					var_updated = qp_multiplier_time_watcher_update_band
					vars = [
						{
							source = bandinfo
							var = current_mult
							type = float
						}
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
					tic = qp_multiplier_time_main_timer_tic
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
						{
							source = goaldata
							var = current_progress
							type = float
						}
					]
				}
				{
					name = 'section_watcher'
					type = section_watcher
					section_marker_hit = qp_multiplier_time_section_marker_hit
				}
			]
		}
	]
}

script qp_multiplier_time_watcher_update 
	if challenge_is_band_subtype goal_id = <goal_id>
		return
	endif
	if NOT challenge_qp_current_section_is_valid goal_id = <goal_id>
		gman_timerfunc goal = <goal_id> tool = timer func = stop
		return
	endif
	get_current_multiplier player = <assigned_player>
	gman_getconstant goal = <goal_id> name = target_multiplier return_name = target_multiplier
	if (<multiplier> >= <target_multiplier>)
		gman_timerfunc goal = <goal_id> tool = timer func = start
	else
		gman_timerfunc goal = <goal_id> tool = timer func = stop
	endif
endscript

script qp_multiplier_time_watcher_update_band 
	if NOT challenge_is_band_subtype goal_id = <goal_id>
		return
	endif
	if NOT challenge_qp_current_section_is_valid goal_id = <goal_id>
		gman_timerfunc goal = <goal_id> tool = timer func = stop
		return
	endif
	gman_getconstant goal = <goal_id> name = target_multiplier return_name = target_multiplier
	if (<current_value> >= <target_multiplier>)
		gman_timerfunc goal = <goal_id> tool = timer func = start
	else
		gman_timerfunc goal = <goal_id> tool = timer func = stop
	endif
endscript

script qp_multiplier_time_main_timer_tic 
	if challenge_is_band_subtype goal_id = <goal_id>
		gman_setdata goal = <goal_id> params = {current_progress = <time_ms>}
	else
		gman_setdata goal = <goal_id> player = <assigned_player> params = {current_progress = <time_ms>}
	endif
endscript

script qp_multiplier_time_section_marker_hit 
	if challenge_is_band_subtype goal_id = <goal_id>
		getfirstplayer
		getplayerinfo <player> band
		getbandinfo <band> current_mult
		qp_multiplier_time_watcher_update_band goal_id = <goal_id> current_value = <current_mult> assigned_player = <assigned_player>
	else
		qp_multiplier_time_watcher_update goal_id = <goal_id> assigned_player = <assigned_player>
	endif
endscript

script qp_multiplier_time_display_seconds_conversion 
	out_score = (<score> * 0.001)
	return score = <out_score>
endscript
