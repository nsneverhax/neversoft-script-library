qp_streak_notes_info = {
	Name = 'qp_streak_notes'
	goal_type = quickplay_challenge
	title_string = qs(0x83b2be80)
	constants = {
		song_complete = qp_streak_notes_song_complete
		target_value = songstat_max_notes
		leaderboard_metric_string = qs(0xc6f89ca2)
		desc_txt = qs(0x2d56463c)
	}
	data = {
		percent_targets = [
			40
			40
			40
		]
		calculated_targets = [
			-1
			-1
			-1
		]
		round_direction = down
		round_to_nearest = 1
		valid_sections = [
		]
	}
	$g_qp_streak_notes_core
}
qp_streak_phrases_info = {
	Name = 'qp_streak_phrases'
	goal_type = quickplay_challenge
	title_string = qs(0x83b2be80)
	constants = {
		song_complete = qp_streak_notes_song_complete
		target_value = songstat_num_phrases
		leaderboard_metric_string = qs(0xd0b0c46c)
		desc_txt = qs(0x47cf3081)
	}
	data = {
		percent_targets = [
			30
			45
			60
		]
		calculated_targets = [
			-1
			-1
			-1
		]
		valid_sections = [
		]
	}
	$g_qp_streak_phrases_core
}
qp_streak_notes_band_info = {
	Name = 'qp_streak_notes_band'
	goal_type = quickplay_challenge
	goal_subtype = Band
	title_string = qs(0x83b2be80)
	constants = {
		song_complete = qp_streak_notes_song_complete
		target_value = songstat_max_notes_band
		leaderboard_metric_string = qs(0xc6f89ca2)
		desc_txt = qs(0x6626f953)
	}
	data = {
		percent_targets = [
			30
			35
			40
		]
		calculated_targets = [
			-1
			-1
			-1
		]
		valid_sections = [
		]
	}
	$g_qp_streak_notes_core
}
g_qp_streak_notes_core = {
	player_data = {
		high_streak = 0
		current_progress = 0
		section_base_value = 0
		previous_progress = 0
	}
	initial_data = {
		current_progress = 0
		high_streak = 0
	}
	checkpoints = [
		{
			Name = 'main'
			tools = [
				{
					Name = 'streak_watcher'
					Type = var_watcher
					var_updated = qp_streak_notes_streak_watcher_update
					vars = [
						{
							Source = playerinfo
							var = current_run
							Type = int
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
				}
			]
		}
	]
}
g_qp_streak_phrases_core = {
	player_data = {
		high_streak = 0
		current_progress = 0
		section_base_value = 0
		previous_progress = 0
	}
	initial_data = {
		current_progress = 0
		high_streak = 0
	}
	checkpoints = [
		{
			Name = 'main'
			tools = [
				{
					Name = 'streak_watcher'
					Type = var_watcher
					var_updated = qp_streak_notes_streak_watcher_update
					vars = [
						{
							Source = playerinfo
							var = current_vocal_phrase_run
							Type = int
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
				}
			]
		}
	]
}

script qp_streak_notes_streak_watcher_update \{current_value = 0
		goal_id = NULL
		Player = -1}
	if challenge_qp_current_section_is_valid goal_id = <goal_id>
		if (<current_value> < 1)
			getplayerinfo <Player> is_local_client
			if (<is_local_client> = 1)
				gman_setdata goal = <goal_id> Player = <Player> params = {previous_progress = 0}
			endif
		endif
	endif
	challenge_qp_calculate_current_progress goal_id = <goal_id> Player = <Player> current_value = <current_value> var_type = song_total
	getplayerinfo <Player> is_local_client
	if (<is_local_client> = 1)
		gman_setdata goal = <goal_id> Player = <Player> params = {current_progress = <current_progress>}
	endif
	if challenge_is_band_subtype goal_id = <goal_id>
		challenge_qp_calculate_total_band_progress goal_id = <goal_id>
		gman_setdata goal = <goal_id> params = {current_progress = <total_band_progress>}
		gman_getdata goal = <goal_id> Name = high_streak
		if (<total_band_progress> > <high_streak>)
			gman_setdata goal = <goal_id> params = {high_streak = <total_band_progress>}
		endif
	else
		getplayerinfo <Player> is_local_client
		if (<is_local_client> = 1)
			gman_getdata goal = <goal_id> Player = <Player> Name = high_streak
			if (<current_progress> > <high_streak>)
				gman_setdata goal = <goal_id> Player = <Player> params = {high_streak = <current_progress>}
			endif
		endif
	endif
endscript

script qp_streak_notes_song_complete 
	gman_getassignedplayer goal_name = <goal_id>
	hide_all_challenge_meters
	if challenge_is_band_subtype goal_id = <goal_id>
		gman_getdata goal = <goal_id> Name = high_streak
		gman_setdata goal = <goal_id> params = {current_progress = <high_streak>}
	else
		getplayerinfo <assigned_player> is_local_client
		if (<is_local_client> = 1)
			gman_getdata goal = <goal_id> Player = <assigned_player> Name = high_streak
			gman_setdata goal = <goal_id> Player = <assigned_player> params = {current_progress = <high_streak>}
		endif
	endif
	challenge_output_grade_marks <...>
endscript
