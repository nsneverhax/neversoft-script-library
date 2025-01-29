qp_hit_notes_info = {
	Name = 'qp_hit_notes'
	goal_type = quickplay_challenge
	constants = {
		song_complete = challenge_output_grade_marks
		target_value = songstat_max_notes
		note_requirements = {
		}
		desc_txt = qs(0x2b116df6)
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
		round_direction = down
		round_to_nearest = 5
		valid_sections = [
		]
	}
	$g_qp_hit_notes_core
}
qp_hit_notes_band_info = {
	Name = 'qp_hit_notes_band'
	goal_type = quickplay_challenge
	goal_subtype = Band
	constants = {
		song_complete = challenge_output_grade_marks
		target_value = songstat_max_notes_band
		note_requirements = {
		}
		desc_txt = qs(0xb0ca0103)
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
		round_direction = down
		round_to_nearest = 10
		valid_sections = [
		]
		current_progress = 0
	}
	$g_qp_hit_notes_core
}
qp_green_notes_info = {
	Name = 'qp_green_notes'
	goal_type = quickplay_challenge
	constants = {
		song_complete = challenge_output_grade_marks
		target_value = songstat_count_note_1
		note_requirements = {
			note_color = [
				green
			]
		}
		desc_txt = qs(0xf3f2618c)
	}
	data = {
		percent_targets = [
			75
			85
			100
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
qp_red_notes_info = {
	Name = 'qp_red_notes'
	goal_type = quickplay_challenge
	constants = {
		song_complete = challenge_output_grade_marks
		target_value = songstat_count_note_2
		note_requirements = {
			note_color = [
				red
			]
		}
		desc_txt = qs(0xd6a71bc5)
	}
	data = {
		percent_targets = [
			75
			85
			100
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
qp_yellow_notes_info = {
	Name = 'qp_yellow_notes'
	goal_type = quickplay_challenge
	constants = {
		song_complete = challenge_output_grade_marks
		target_value = songstat_count_note_3
		note_requirements = {
			note_color = [
				yellow
			]
		}
		desc_txt = qs(0x69201cb1)
	}
	data = {
		percent_targets = [
			75
			85
			100
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
qp_blue_notes_info = {
	Name = 'qp_blue_notes'
	goal_type = quickplay_challenge
	constants = {
		song_complete = challenge_output_grade_marks
		target_value = songstat_count_note_4
		note_requirements = {
			note_color = [
				blue
			]
		}
		desc_txt = qs(0x50bfb0d6)
	}
	data = {
		percent_targets = [
			75
			85
			100
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
qp_orange_notes_info = {
	Name = 'qp_orange_notes'
	goal_type = quickplay_challenge
	constants = {
		song_complete = challenge_output_grade_marks
		target_value = songstat_count_note_5
		note_requirements = {
			note_color = [
				orange
			]
		}
		desc_txt = qs(0x2d124f7d)
	}
	data = {
		percent_targets = [
			75
			85
			100
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
qp_open_notes_info = {
	Name = 'qp_open_notes'
	goal_type = quickplay_challenge
	constants = {
		song_complete = challenge_output_grade_marks
		target_value = songstat_count_note_6
		note_requirements = {
			note_color = [
				extra
			]
		}
		desc_txt = qs(0x7dab961a)
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
		valid_sections = [
		]
	}
	$g_qp_hit_notes_core
}
qp_spoken_notes_info = {
	Name = 'qp_spoken_notes'
	goal_type = quickplay_challenge
	constants = {
		song_complete = challenge_output_grade_marks
		target_value = songstat_num_spoken_notes
		note_requirements = {
			special = spoken
		}
		desc_txt = qs(0xf2b86f2f)
	}
	data = {
		percent_targets = [
			75
			85
			100
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
