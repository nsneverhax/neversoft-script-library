qp_spower_time_info = {
	Name = 'qp_spower_time'
	goal_type = quickplay_challenge
	constants = {
		song_complete = qp_spower_time_song_complete
		target_value = Duration
		desc_txt = qs(0xae9de7d3)
	}
	data = {
		percent_targets = [
			4
			5
			7
		]
		calculated_targets = [
			-1
			-1
			-1
		]
		valid_sections = [
		]
	}
	$g_qp_spower_time_core
}
qp_spower_time_band_info = {
	Name = 'qp_spower_time_band'
	goal_type = quickplay_challenge
	goal_subtype = Band
	constants = {
		song_complete = qp_spower_time_song_complete
		target_value = Duration
		desc_txt = qs(0xae9de7d3)
	}
	data = {
		percent_targets = [
			10
			15
			25
		]
		calculated_targets = [
			-1
			-1
			-1
		]
		valid_sections = [
		]
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
			Name = 'main'
			tools = [
				{
					Name = 'watcher'
					Type = var_watcher
					var_updated = qp_spower_time_watcher_update
					vars = [
						{
							Source = playerinfo
							var = star_power_used
							Type = int
						}
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
					tic = qp_spower_time_main_timer_tic
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
						{
							Source = goaldata
							var = current_progress
							Type = float
						}
					]
				}
				{
					Name = 'section_watcher'
					Type = section_watcher
					section_marker_hit = qp_spower_time_section_marker_hit
				}
			]
		}
	]
}

script qp_spower_time_watcher_update 
	if NOT challenge_qp_current_section_is_valid goal_id = <goal_id>
		gman_timerfunc goal = <goal_id> tool = Timer func = stop
		gman_timerfunc goal = <goal_id> tool = Timer func = reset
		return
	endif
	if (<current_value> = 1)
		gman_timerfunc goal = <goal_id> tool = Timer func = start
	else
		if challenge_is_band_subtype goal_id = <goal_id>
			getnumplayersingame
			if (<num_players> > 1)
				getfirstplayer
				begin
				getplayerinfo <Player> star_power_used
				if (<star_power_used> = 1)
					return
				endif
				getnextplayer Player = <Player>
				repeat <num_players>
			endif
		endif
		gman_timerfunc goal = <goal_id> tool = Timer func = stop
		gman_timerfunc goal = <goal_id> tool = Timer func = reset
	endif
endscript

script qp_spower_time_main_timer_tic 
	<0xc5c763d3> = (<time_ms> / 1000)
	if challenge_is_band_subtype goal_id = <goal_id>
		gman_setdata goal = <goal_id> params = {current_progress = <0xc5c763d3>}
		gman_getdata goal = <goal_id> Name = longest_deployment
		if (<0xc5c763d3> > <longest_deployment>)
			gman_setdata goal = <goal_id> params = {longest_deployment = <0xc5c763d3>}
		endif
	else
		gman_setdata goal = <goal_id> Player = <assigned_player> params = {current_progress = <0xc5c763d3>}
		gman_getdata goal = <goal_id> Player = <assigned_player> Name = longest_deployment
		if (<0xc5c763d3> > <longest_deployment>)
			gman_setdata goal = <goal_id> Player = <assigned_player> params = {longest_deployment = <0xc5c763d3>}
		endif
	endif
endscript

script qp_spower_time_song_complete 
	gman_getassignedplayer goal_name = <goal_id>
	if challenge_is_band_subtype goal_id = <goal_id>
		gman_getdata goal = <goal_id> Name = longest_deployment
		gman_setdata goal = <goal_id> params = {current_progress = <longest_deployment>}
	else
		gman_getdata goal = <goal_id> Player = <assigned_player> Name = longest_deployment
		gman_setdata goal = <goal_id> Player = <assigned_player> params = {current_progress = <longest_deployment>}
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
