qp_up_strum_info = {
	Name = 'qp_up_strum'
	goal_type = quickplay_challenge
	constants = {
		song_complete = challenge_output_grade_marks
		target_value = songstat_num_strum_notes
		note_requirements = {
			strum = up_only
		}
		desc_txt = qs(0xe37b82ca)
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
