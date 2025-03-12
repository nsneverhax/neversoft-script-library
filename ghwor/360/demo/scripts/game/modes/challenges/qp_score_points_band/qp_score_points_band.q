qp_score_points_band_info = {
	name = 'qp_score_points_band'
	goal_type = quickplay_challenge
	title_string = qs(0x08952d17)
	goal_subtype = band
	constants = {
		song_complete = challenge_output_grade_marks
		target_value = songstat_max_score_band
		leaderboard_metric_string = qs(0xfb40ab1c)
		desc_txt = qs(0xfa950eec)
		required_band = [
			non_standard_band
		]
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
	name = 'qp_score_points_stdband'
	goal_type = quickplay_challenge
	title_string = qs(0x08952d17)
	goal_subtype = band
	constants = {
		song_complete = challenge_output_grade_marks
		target_value = songstat_max_score_band
		leaderboard_metric_string = qs(0xfb40ab1c)
		desc_txt = qs(0x5d1a9963)
		required_band = [
			standard_band
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
			name = 'main'
			tools = [
				{
					name = 'score_watcher'
					type = var_watcher
					var_updated = qp_score_points_band_score_watcher_update
					vars = [
						{
							source = playerinfo
							var = individual_band_score
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
							source = goaldata
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

script qp_score_points_band_score_watcher_update \{current_value = 0
		goal_id = null}
	challenge_qp_calculate_current_progress goal_id = <goal_id> player = <player> current_value = <current_value> var_type = song_total
	getplayerinfo <player> is_local_client
	if (<is_local_client> = 1)
		gman_setdata goal = <goal_id> player = <player> params = {current_progress = <current_progress>}
	endif
	challenge_qp_calculate_total_band_progress goal_id = <goal_id>
	gman_setdata goal = <goal_id> params = {current_progress = <total_band_progress>}
endscript
