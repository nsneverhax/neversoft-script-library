qp_power_score_points_info = {
	name = 'qp_power_score_points'
	goal_type = quickplay_challenge
	title_string = qs(0xab7c82ea)
	constants = {
		song_complete = challenge_output_grade_marks
		target_value = songstat_max_score
		leaderboard_metric_string = qs(0xfb40ab1c)
		desc_txt = qs(0xbe825e4e)
		single_play_only
	}
	data = {
		percent_targets = [
			-1
			-1
			-1
		]
		static_targets = [
			-1
			-1
			-1
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
		pending_grade = 0
	}
	checkpoints = [
		{
			name = 'main'
			tools = [
				{
					name = 'score_watcher'
					type = var_watcher
					var_updated = qp_power_score_points_score_watcher_update
					vars = [
						{
							source = playerinfo
							var = score
							type = float
						}
					]
				}
				{
					name = 'star_watcher'
					type = var_watcher
					var_updated = qp_power_score_star_watcher_update
					vars = [
						{
							source = playerinfo
							var = projected_song_stars
							type = float
						}
					]
				}
			]
		}
	]
}

script qp_power_score_points_score_watcher_update 
	gman_setdata goal = <goal_id> player = <player> params = {current_progress = <current_value>}
endscript

script qp_power_score_star_watcher_update 
	casttointeger \{current_value}
	gman_setdata goal = <goal_id> player = <player> params = {pending_grade = <current_value>}
endscript
