qp_spower_time_info = {
	name = 'qp_spower_time'
	goal_type = quickplay_challenge
	title_string = qs(0x29592230)
	constants = {
		song_complete = qp_spower_time_song_complete
		target_value = songstat_max_starpower
		leaderboard_metric_string = qs(0x8796bdae)
		desc_txt = qs(0xe4221507)
		units_txt = qs(0xe0a15b60)
		score_converion_script = qp_spower_time_display_seconds_conversion
		required_band = [
			solo_only
		]
	}
	data = {
		percent_targets = [
			8000
			10000
			13000
		]
		calculated_targets = [
			-1
			-1
			-1
		]
		round_direction = down
		round_to_nearest = 1000
	}
	$g_qp_spower_time_core
}
qp_spower_time_band_info = {
	name = 'qp_spower_time_band'
	goal_type = quickplay_challenge
	goal_subtype = band
	title_string = qs(0xea54bd0b)
	constants = {
		song_complete = qp_spower_time_song_complete
		target_value = duration
		leaderboard_metric_string = qs(0x8796bdae)
		desc_txt = qs(0x8be1359d)
		units_txt = qs(0xe0a15b60)
		score_converion_script = qp_spower_time_display_seconds_conversion
	}
	data = {
		percent_targets = [
			10000
			15000
			25000
		]
		calculated_targets = [
			-1
			-1
			-1
		]
		round_direction = down
		round_to_nearest = 1000
	}
	$g_qp_spower_time_core
}
g_qp_spower_time_core = {
	player_data = {
		current_progress = 0
		section_base_value = 0
		previous_progress = 0
		longest_deployment = 0
	}
	initial_data = {
		current_progress = 0
		longest_deployment = 0
	}
	checkpoints = [
		{
			name = 'main'
			tools = [
				{
					name = 'watcher'
					type = var_watcher
					var_updated = qp_spower_time_watcher_update
					vars = [
						{
							source = playerinfo
							var = star_power_used
							type = int
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
					tic = qp_spower_time_main_timer_tic
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
					section_marker_hit = qp_spower_time_section_marker_hit
				}
			]
		}
	]
}

script qp_spower_time_watcher_update 
	if NOT challenge_qp_current_section_is_valid goal_id = <goal_id>
		gman_timerfunc goal = <goal_id> tool = timer func = stop
		gman_timerfunc goal = <goal_id> tool = timer func = reset
		return
	endif
	if (<current_value> = 1)
		gman_timerfunc goal = <goal_id> tool = timer func = start
	else
		if challenge_is_band_subtype goal_id = <goal_id>
			getnumplayersingame
			if (<num_players> > 1)
				getfirstplayer
				begin
				getplayerinfo <player> star_power_used
				if (<star_power_used> = 1)
					return
				endif
				getnextplayer player = <player>
				repeat <num_players>
			endif
		endif
		gman_timerfunc goal = <goal_id> tool = timer func = stop
		gman_timerfunc goal = <goal_id> tool = timer func = reset
	endif
endscript

script qp_spower_time_main_timer_tic 
	if challenge_is_band_subtype goal_id = <goal_id>
		gman_setdata goal = <goal_id> params = {current_progress = <time_ms>}
		gman_getdata goal = <goal_id> name = longest_deployment
		if (<time_ms> > <longest_deployment>)
			gman_setdata goal = <goal_id> params = {longest_deployment = <time_ms>}
		endif
	else
		gman_setdata goal = <goal_id> player = <assigned_player> params = {current_progress = <time_ms>}
		gman_getdata goal = <goal_id> player = <assigned_player> name = longest_deployment
		if (<time_ms> > <longest_deployment>)
			gman_setdata goal = <goal_id> player = <assigned_player> params = {longest_deployment = <time_ms>}
		endif
	endif
endscript

script qp_spower_time_song_complete 
	gman_getassignedplayer goal_name = <goal_id>
	if challenge_is_band_subtype goal_id = <goal_id>
		gman_getdata goal = <goal_id> name = longest_deployment
		gman_setdata goal = <goal_id> params = {current_progress = <longest_deployment>}
	else
		gman_getdata goal = <goal_id> player = <assigned_player> name = longest_deployment
		gman_setdata goal = <goal_id> player = <assigned_player> params = {current_progress = <longest_deployment>}
	endif
	challenge_output_grade_marks <...>
endscript

script qp_spower_time_section_marker_hit 
	if challenge_is_band_subtype goal_id = <goal_id>
		qp_spower_time_watcher_update goal_id = <goal_id> assigned_player = <assigned_player> current_value = 0
	else
		getplayerinfo <assigned_player> star_power_used
		qp_spower_time_watcher_update goal_id = <goal_id> assigned_player = <assigned_player> current_value = <star_power_used>
	endif
endscript

script qp_spower_time_display_seconds_conversion 
	out_score = (<score> * 0.001)
	return score = <out_score>
endscript
