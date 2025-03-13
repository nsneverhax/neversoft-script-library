qp_spower_banked_info = {
	name = 'qp_spower_banked'
	goal_type = quickplay_challenge
	title_string = qs(0x1b64e503)
	constants = {
		song_complete = challenge_output_grade_marks
		target_value = songstat_max_starpower
		leaderboard_metric_string = qs(0x81cd1aad)
		desc_txt = qs(0xf0be9eab)
		units_txt = qs(0x035582ab)
		score_converion_script = qp_spower_banked_to_multiplier
		required_band = [
			solo_only
		]
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
	name = 'qp_spower_banked_band'
	goal_type = quickplay_challenge
	goal_subtype = band
	title_string = qs(0x1b64e503)
	constants = {
		song_complete = challenge_output_grade_marks
		target_value = songstat_max_starpower_band
		leaderboard_metric_string = qs(0x81cd1aad)
		desc_txt = qs(0x0b58845f)
		units_txt = qs(0x035582ab)
		score_converion_script = qp_spower_banked_to_multiplier
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
			name = 'main'
			tools = [
				{
					name = 'spower_watcher'
					type = var_watcher
					var_updated = qp_spower_banked_spower_watcher_update
					vars = [
						{
							source = playerinfo
							var = star_power_amount
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

script qp_spower_banked_spower_watcher_update 
	if (<current_value> > <last_value>)
		<new_starpower> = (<current_value> - <last_value>)
		challenge_qp_calculate_current_progress goal_id = <goal_id> player = <player> current_value = <new_starpower> var_type = incremental
		getplayerinfo <player> is_local_client
		if (<is_local_client> = 1)
			gman_setdata goal = <goal_id> player = <player> params = {current_progress = <current_progress> previous_progress = <current_progress>}
		endif
		if challenge_is_band_subtype goal_id = <goal_id>
			challenge_qp_calculate_total_band_progress goal_id = <goal_id>
			gman_setdata goal = <goal_id> params = {current_progress = <total_band_progress>}
		endif
	endif
endscript

script qp_spower_banked_to_multiplier \{score = !i1768515945}
	out_score = (<score> * 0.01)
	return score = <out_score>
endscript
