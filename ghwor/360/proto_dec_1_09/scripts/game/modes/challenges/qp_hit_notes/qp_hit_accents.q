qp_drum_accents_info = {
	Name = 'qp_drum_accents'
	goal_type = quickplay_challenge
	constants = {
		song_complete = challenge_output_grade_marks
		target_value = songstat_num_accent_notes
		note_requirements = {
			special = drum_accent
		}
		desc_txt = qs(0xe022d934)
	}
	data = {
		percent_targets = [
			75
			85
			95
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
