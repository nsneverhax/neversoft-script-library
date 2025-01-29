qp_score_points_info = {
	Name = 'qp_score_points'
	goal_type = quickplay_challenge
	constants = {
		song_complete = challenge_output_grade_marks
		target_value = songstat_max_score
		desc_txt = qs(0x08952d17)
	}
	data = {
		percent_targets = [
			80
			85
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
	player_data = {
		current_progress = 0
		section_base_value = 0
		previous_progress = 0
	}
	checkpoints = [
		{
			Name = 'main'
			tools = [
				{
					Name = 'score_watcher'
					Type = var_watcher
					var_updated = qp_score_points_score_watcher_update
					vars = [
						{
							Source = playerinfo
							var = score
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

script qp_score_points_score_watcher_update \{current_value = 0
		goal_id = NULL
		Player = -1}
	challenge_qp_calculate_current_progress goal_id = <goal_id> Player = <Player> current_value = <current_value> var_type = song_total
	gman_setdata goal = <goal_id> Player = <Player> params = {current_progress = <current_progress>}
endscript
