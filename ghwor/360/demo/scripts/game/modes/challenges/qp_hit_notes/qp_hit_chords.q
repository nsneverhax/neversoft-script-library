qp_hit_chords_info = {
	name = 'qp_hit_chords'
	goal_type = quickplay_challenge
	title_string = qs(0xfb483015)
	constants = {
		song_complete = challenge_output_grade_marks
		target_value = songstat_num_chords
		leaderboard_metric_string = qs(0x7aa1a384)
		note_requirements = {
			chord_color = [
				all
			]
		}
		desc_txt = qs(0x1d19ef7e)
	}
	data = {
		percent_targets = [
			75
			85
			97
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
