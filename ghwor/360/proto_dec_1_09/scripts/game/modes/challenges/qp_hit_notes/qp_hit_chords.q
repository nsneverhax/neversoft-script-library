qp_hit_chords_info = {
	Name = 'qp_hit_chords'
	goal_type = quickplay_challenge
	constants = {
		song_complete = challenge_output_grade_marks
		target_value = songstat_num_chords
		note_requirements = {
			chord_color = [
				all
			]
		}
		desc_txt = qs(0xfb483015)
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
