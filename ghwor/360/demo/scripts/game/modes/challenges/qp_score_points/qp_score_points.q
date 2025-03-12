qp_score_points_info = {
	name = 'qp_score_points'
	goal_type = quickplay_challenge
	title_string = qs(0x08952d17)
	constants = {
		song_complete = challenge_output_grade_marks
		target_value = songstat_max_score
		leaderboard_metric_string = qs(0xfb40ab1c)
		desc_txt = qs(0x99a56d57)
		single_play_only
	}
	data = {
		percent_targets = [
			75
			75
			75
		]
		calculated_targets = [
			-1
			-1
			-1
		]
		round_direction = down
		round_to_nearest = 100
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
			name = 'main'
			tools = [
				{
					name = 'score_watcher'
					type = var_watcher
					var_updated = qp_score_points_score_watcher_update
					vars = [
						{
							source = playerinfo
							var = score
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
							source = goalplayerdata
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

script qp_score_points_score_watcher_update \{current_value = 0
		goal_id = null
		player = -1}
	challenge_qp_calculate_current_progress goal_id = <goal_id> player = <player> current_value = <current_value> var_type = song_total
	gman_setdata goal = <goal_id> player = <player> params = {current_progress = <current_progress>}
endscript
