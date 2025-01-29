qp_spower_banked_info = {
	Name = 'qp_spower_banked'
	goal_type = quickplay_challenge
	constants = {
		song_complete = challenge_output_grade_marks
		target_value = songstat_max_starpower
		desc_txt = qs(0x7d952b3a)
	}
	data = {
		percent_targets = [
			65
			80
			90
		]
		calculated_targets = [
			-1
			-1
			-1
		]
		round_direction = down
		round_to_nearest = 5
		valid_sections = [
		]
	}
	$g_qp_spower_banked_core
}
qp_spower_banked_band_info = {
	Name = 'qp_spower_banked_band'
	goal_type = quickplay_challenge
	goal_subtype = Band
	constants = {
		song_complete = challenge_output_grade_marks
		target_value = songstat_max_starpower_band
		desc_txt = qs(0x7d952b3a)
	}
	data = {
		percent_targets = [
			65
			80
			90
		]
		calculated_targets = [
			-1
			-1
			-1
		]
		round_direction = down
		round_to_nearest = 5
		valid_sections = [
		]
	}
	$g_qp_spower_banked_core
}
g_qp_spower_banked_core = {
	initial_data = {
		current_progress = 0
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
					Name = 'spower_watcher'
					Type = var_watcher
					var_updated = qp_spower_banked_spower_watcher_update
					vars = [
						{
							Source = playerinfo
							var = star_power_amount
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

script qp_spower_banked_spower_watcher_update 
	if (<current_value> > <last_value>)
		<new_starpower> = (<current_value> - <last_value>)
		challenge_qp_calculate_current_progress goal_id = <goal_id> Player = <Player> current_value = <new_starpower> var_type = incremental
		gman_setdata goal = <goal_id> Player = <Player> params = {current_progress = <current_progress> previous_progress = <current_progress>}
		if challenge_is_band_subtype goal_id = <goal_id>
			challenge_qp_calculate_total_band_progress goal_id = <goal_id>
			gman_setdata goal = <goal_id> params = {current_progress = <total_band_progress>}
		endif
	endif
endscript
