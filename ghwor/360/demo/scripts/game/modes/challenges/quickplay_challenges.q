qp_test_hits_info = {
	name = 'QP_test_hits'
	goal_type = testing
	constants = {
		target_value = songstat_max_notes
		desc_txt = qs(0x2b116df6)
	}
	data = {
		percent_targets = [
			70
			88
			98
		]
		calculated_targets = [
			-1
			-1
			-1
		]
	}
	player_data = {
		current_progress = 0
	}
	checkpoints = [
		{
			name = 'main'
			tools = [
				{
					name = 'hit_listener'
					type = event_listener
					callback_mode = any
					got_event = qp_test_note_hit
					events = [
						hit_notep1
						hit_notep2
						hit_notep3
						hit_notep4
						vocals_note_hit_eventp1
						vocals_note_hit_eventp2
						vocals_note_hit_eventp3
						vocals_note_hit_eventp4
					]
				}
			]
		}
	]
}
qp_test_whammy_info = {
	name = 'QP_test_whammy'
	goal_type = testing
	constants = {
		target_value = songstat_sustain_time
		desc_txt = qs(0x2ff4f1ef)
	}
	data = {
		percent_targets = [
			70
			85
			98
		]
		calculated_targets = [
			-1
			-1
			-1
		]
	}
	player_data = {
		current_progress = 0
	}
	checkpoints = [
		{
			name = 'main'
			tools = [
				{
					name = 'whammy_listener'
					type = event_listener
					got_event = qp_test_whammy_update
					callback_mode = any
					events = [
						whammy_onp1
						whammy_onp2
						whammy_onp3
						whammy_onp4
						whammy_offp1
						whammy_offp2
						whammy_offp3
						whammy_offp4
					]
				}
			]
		}
	]
}

script qp_test_note_hit 
endscript

script qp_test_whammy_update 
endscript
