qp_score_points_band_info = {
	Name = 'qp_score_points_band'
	goal_type = quickplay_challenge
	goal_subtype = Band
	constants = {
		song_complete = challenge_output_grade_marks
		target_value = songstat_max_score_band
		desc_txt = qs(0x255a8e47)
	}
	data = {
		percent_targets = [
			60
			80
			100
		]
		calculated_targets = [
			-1
			-1
			-1
		]
		round_direction = down
		round_to_nearest = 1000
		valid_sections = [
		]
	}
	$g_qp_score_points_band_core
}
qp_score_points_stdband_info = {
	Name = 'qp_score_points_stdband'
	goal_type = quickplay_challenge
	goal_subtype = Band
	constants = {
		song_complete = challenge_output_grade_marks
		target_value = songstat_max_score_band
		desc_txt = qs(0x0e824bc1)
		required_band = [
			guitar
			bass
			drum
			vocals
		]
	}
	data = {
		percent_targets = [
			50
			75
			95
		]
		calculated_targets = [
			-1
			-1
			-1
		]
		round_direction = down
		round_to_nearest = 5000
		valid_sections = [
		]
	}
	$g_qp_score_points_band_core
}
g_qp_score_points_band_core = {
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
			Name = 'main'
			tools = [
				{
					Name = 'score_watcher'
					Type = var_watcher
					var_updated = qp_score_points_band_score_watcher_update
					vars = [
						{
							Source = playerinfo
							var = individual_band_score
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
							Source = goaldata
							var = current_progress
							Type = float
						}
					]
				}
			]
		}
	]
}

script qp_score_points_band_score_watcher_update \{current_value = 0
		goal_id = NULL}
	challenge_qp_calculate_current_progress goal_id = <goal_id> Player = <Player> current_value = <current_value> var_type = song_total
	getplayerinfo <Player> is_local_client
	if (<is_local_client> = 1)
		gman_setdata goal = <goal_id> Player = <Player> params = {current_progress = <current_progress>}
	endif
	challenge_qp_calculate_total_band_progress goal_id = <goal_id>
	gman_setdata goal = <goal_id> params = {current_progress = <total_band_progress>}
endscript
