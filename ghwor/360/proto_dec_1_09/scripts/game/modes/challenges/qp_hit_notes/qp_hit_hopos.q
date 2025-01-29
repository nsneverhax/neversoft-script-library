qp_hit_hopos_info = {
	Name = 'qp_hit_hopos'
	goal_type = quickplay_challenge
	constants = {
		song_complete = challenge_output_grade_marks
		target_value = songstat_num_hammerons
		note_requirements = {
			special = hopo
		}
		desc_txt = qs(0x8ccb779d)
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
