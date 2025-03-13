qp_alt_strum_info = {
	name = 'qp_alt_strum'
	goal_type = quickplay_challenge
	title_string = qs(0x08cb0475)
	constants = {
		song_complete = challenge_output_grade_marks
		target_value = songstat_num_strum_notes
		leaderboard_metric_string = qs(0xc6f89ca2)
		note_requirements = {
			strum = up_and_down
		}
		desc_txt = qs(0x852d7d12)
	}
	data = {
		percent_targets = [
			75
			75
			85
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
