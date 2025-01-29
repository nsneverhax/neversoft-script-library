qp_hit_taps_info = {
	Name = 'qp_hit_taps'
	goal_type = quickplay_challenge
	title_string = qs(0x73f458b0)
	constants = {
		song_complete = challenge_output_grade_marks
		target_value = songstat_num_tapping_notes
		leaderboard_metric_string = qs(0xc6f89ca2)
		note_requirements = {
			special = tapping
		}
		desc_txt = qs(0xebba3cc1)
	}
	data = {
		percent_targets = [
			75
			85
			98
		]
		calculated_targets = [
			-1
			-1
			-1
		]
		valid_sections = [
		]
	}
	$g_qp_hit_notes_core
}
