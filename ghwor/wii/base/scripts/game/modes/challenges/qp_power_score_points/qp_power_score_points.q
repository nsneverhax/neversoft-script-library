qp_power_score_points_info = {
	Name = 'qp_power_score_points'
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
			Name = 'main'
			tools = [
				{
					Name = 'score_watcher'
					Type = var_watcher
					var_updated = qp_power_score_points_score_watcher_update
					vars = [
						{
							Source = playerinfo
							var = score
							Type = float
						}
					]
				}
				{
					Name = 'star_watcher'
					Type = var_watcher
					var_updated = qp_power_score_star_watcher_update
					vars = [
						{
							Source = playerinfo
							var = projected_song_stars
							Type = float
						}
					]
				}
			]
		}
	]
}

script qp_power_score_points_score_watcher_update 
	gman_setdata goal = <goal_id> Player = <Player> params = {current_progress = <current_value>}
endscript

script qp_power_score_star_watcher_update 
	CastToInteger \{current_value}
	gman_setdata goal = <goal_id> Player = <Player> params = {pending_grade = <current_value>}
endscript
