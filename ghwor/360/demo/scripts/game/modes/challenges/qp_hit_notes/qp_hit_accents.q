qp_drum_accents_info = {
	name = 'qp_drum_accents'
	goal_type = quickplay_challenge
	title_string = qs(0x83cb780f)
	constants = {
		song_complete = challenge_output_grade_marks
		target_value = songstat_num_accent_notes
		leaderboard_metric_string = qs(0xc6f89ca2)
		note_requirements = {
			special = drum_accent
		}
		desc_txt = qs(0xa60c77c0)
	}
	data = {
		percent_targets = [
			75
			80
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
