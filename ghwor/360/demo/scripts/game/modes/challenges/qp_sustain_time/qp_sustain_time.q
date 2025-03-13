qp_sustain_time_info = {
	name = 'qp_sustain_time'
	goal_type = quickplay_challenge
	title_string = qs(0x825b1d34)
	constants = {
		song_complete = challenge_output_grade_marks
		target_value = songstat_sustain_time
		leaderboard_metric_string = qs(0x8796bdae)
		required_modifier = none
		desc_txt = qs(0x624c9afe)
		units_txt = qs(0xe0a15b60)
		score_converion_script = qp_sustain_time_display_seconds_conversion
	}
	data = {
		percent_targets = [
			65
			75
			95
		]
		calculated_targets = [
			-1
			-1
			-1
		]
		round_direction = down
		round_to_nearest = 1000
	}
	$g_qp_sustain_time_core
}
qp_whammy_time_info = {
	name = 'qp_whammy_time'
	goal_type = quickplay_challenge
	title_string = qs(0x91639f57)
	constants = {
		song_complete = challenge_output_grade_marks
		target_value = songstat_sustain_time
		leaderboard_metric_string = qs(0x8796bdae)
		required_modifier = whammy
		desc_txt = qs(0x41a62ab5)
		units_txt = qs(0xe0a15b60)
		score_converion_script = qp_sustain_time_display_seconds_conversion
	}
	data = {
		percent_targets = [
			50
			60
			70
		]
		calculated_targets = [
			-1
			-1
			-1
		]
		round_direction = down
		round_to_nearest = 1000
	}
	$g_qp_sustain_time_core
}
