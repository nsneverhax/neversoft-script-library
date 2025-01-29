qp_sustain_time_info = {
	Name = 'qp_sustain_time'
	goal_type = quickplay_challenge
	constants = {
		song_complete = challenge_output_grade_marks
		target_value = songstat_sustain_time
		required_modifier = None
		desc_txt = qs(0x4b5e836d)
	}
	data = {
		percent_targets = [
			0.065
			0.075
			0.095000006
		]
		calculated_targets = [
			-1
			-1
			-1
		]
		valid_sections = [
		]
	}
	$g_qp_sustain_time_core
}
qp_whammy_time_info = {
	Name = 'qp_whammy_time'
	goal_type = quickplay_challenge
	constants = {
		song_complete = challenge_output_grade_marks
		target_value = songstat_sustain_time
		required_modifier = whammy
		desc_txt = qs(0x3933da4c)
	}
	data = {
		percent_targets = [
			0.055
			0.067
			0.085
		]
		calculated_targets = [
			-1
			-1
			-1
		]
		valid_sections = [
		]
	}
	$g_qp_sustain_time_core
}
