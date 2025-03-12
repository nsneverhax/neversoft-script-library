busstree = {
	master = {
		user_sfx = {
			ui = {
				leafnodes = [
					front_end
					pause_menu
					ui_star_power
					ui_battle_mode
					wrong_notes_player1
					wrong_notes_player2
				]
			}
			crowd = {
				crowd_w_reverb = {
					leafnodes = [
						crowd_singalong
						crowd_one_shots
					]
				}
				leafnodes = [
					crowd_beds
					crowd_cheers
					crowd_boos
					crowd_nuetral
					crowd_star_power
					crowd_preencore_building
					crowd_presong_intro
					crowd_applause
					crowd_transitions
				]
			}
			leafnodes = [
				`default`
				test_tones
				encore_events
				binkcutscenes
				training_vo
			]
		}
		user_band = {
			band_balance = {
				leafnodes = [
					band_playback
					single_player_rhythm_playback
					music_frontend
					music_setlist
					countoffs
				]
			}
			leafnodes = [
				practice_band_playback
			]
		}
		user_guitar = {
			guitar_balance = {
				guitar_balance_first_player = {
					leafnodes = [
						first_player_lead_playback
					]
				}
				guitar_balance_second_player = {
					leafnodes = [
						second_player_lead_playback
						second_player_rhythm_playback
					]
				}
			}
			leafnodes = [
				test_tones_dsp
				right_notes_player1
				right_notes_player2
			]
		}
	}
}
default_bussset = {
	master = {
		priority = 5
		vol = -2.5
		pitch = 0
		instance_rule = ignore
		max_instances = 64
	}
	`default` = {
		priority = 5
		vol = -4
		pitch = 0
	}
	test_tones = {
		priority = 5
		vol = 0
		pitch = 0
	}
	user_sfx = {
		priority = 1
		vol = 0
		pitch = 0
		instance_rule = ignore
		max_instances = 500
	}
	ui = {
		priority = 1
		vol = 0
		pitch = 0
	}
	user_band = {
		priority = 1
		vol = 0
		pitch = 0
	}
	band_balance = {
		priority = 1
		vol = 0
		pitch = 0
	}
	user_guitar = {
		priority = 1
		vol = 0
		pitch = 0
	}
	guitar_balance = {
		priority = 1
		vol = 0
		pitch = 0
	}
	guitar_balance_first_player = {
		priority = 1
		vol = 0
		pitch = 0
	}
	guitar_balance_second_player = {
		priority = 1
		vol = 0
		pitch = 0
	}
	right_notes_player1 = {
		priority = 1
		vol = -4
		pitch = 0
	}
	first_player_lead_playback = {
		priority = 1
		vol = 0
		pitch = 0
	}
	second_player_lead_playback = {
		priority = 1
		vol = 0
		pitch = 0
	}
	second_player_rhythm_playback = {
		priority = 1
		vol = 0
		pitch = 0
	}
	single_player_rhythm_playback = {
		priority = 1
		vol = 0
		pitch = 0
	}
	wrong_notes_player1 = {
		priority = 1
		vol = -3.5
		pitch = 0
	}
	right_notes_player2 = {
		priority = 1
		vol = -4
		pitch = 0
	}
	wrong_notes_player2 = {
		priority = 1
		vol = -3.5
		pitch = 0
	}
	band_playback = {
		priority = 1
		vol = 0
		pitch = 0
	}
	countoffs = {
		priority = 1
		vol = -7
		pitch = 0
	}
	practice_band_playback = {
		priority = 1
		vol = -3.0
		pitch = 0
	}
	front_end = {
		priority = 1
		vol = -6
		pitch = 0
	}
	pause_menu = {
		priority = 1
		vol = 0
		pitch = 0
	}
	ui_star_power = {
		priority = 1
		vol = -6
		pitch = 0
	}
	ui_battle_mode = {
		priority = 1
		vol = 0
		pitch = 0
	}
	crowd = {
		priority = 1
		vol = -1
		pitch = 0
	}
	crowd_beds = {
		priority = 1
		vol = -7
		pitch = 0
	}
	crowd_cheers = {
		priority = 1
		vol = -6
		pitch = 0
	}
	crowd_boos = {
		priority = 1
		vol = -6
		pitch = 0
	}
	crowd_nuetral = {
		priority = 1
		vol = -6
		pitch = 0
	}
	crowd_star_power = {
		priority = 1
		vol = 0
		pitch = 0
	}
	crowd_preencore_building = {
		priority = 1
		vol = 0
		pitch = 0
	}
	crowd_presong_intro = {
		priority = 1
		vol = -6
		pitch = 0
	}
	crowd_applause = {
		priority = 1
		vol = 0
		pitch = 0
	}
	crowd_transitions = {
		priority = 1
		vol = -8
		pitch = 0
	}
	crowd_singalong = {
		priority = 1
		vol = -100
		pitch = 0
	}
	crowd_w_reverb = {
		priority = 1
		vol = 0
		pitch = 0
	}
	crowd_one_shots = {
		priority = 1
		vol = -7.58
		pitch = 0
	}
	music_frontend = {
		priority = 1
		vol = -11
		pitch = 0
	}
	music_setlist = {
		priority = 1
		vol = -2
		pitch = 0
	}
	test_tones_dsp = {
		priority = 1
		vol = 0
		pitch = 0
	}
	encore_events = {
		priority = 1
		vol = 0
		pitch = 0
	}
	binkcutscenes = {
		priority = 1
		vol = 0
		pitch = 0
	}
	training_vo = {
		priority = 1
		vol = 0
		pitch = 0
	}
}
star_power_bussset = {
	right_notes_player1 = {
		priority = 1
		vol = -2.0
		pitch = 0
	}
	right_notes_player2 = {
		priority = 1
		vol = -2.0
		pitch = 0
	}
}
battlemode_thin_bussset = {
	right_notes_player1 = {
		priority = 1
		vol = 0
		pitch = 0
	}
	first_player_lead_playback = {
		priority = 1
		vol = 0
		pitch = 0
	}
	second_player_lead_playback = {
		priority = 1
		vol = 0
		pitch = 0
	}
	second_player_rhythm_playback = {
		priority = 1
		vol = 0
		pitch = 0
	}
	single_player_rhythm_playback = {
		priority = 1
		vol = 0
		pitch = 0
	}
}
autowah_bussset = {
	right_notes_player1 = {
		priority = 1
		vol = -10
		pitch = 0
	}
}
crowdsurgebig_bussset = {
	crowd_beds = {
		priority = 1
		vol = 3.0
		pitch = 0
	}
}
crowdsurgesmall_bussset = {
	crowd_beds = {
		priority = 1
		vol = 1.0
		pitch = 0
	}
}
crowdnormal_bussset = {
	crowd_beds = {
		priority = 1
		vol = -6
		pitch = 0
	}
}
crowdsingingvolup_bussset = {
	crowd_singalong = {
		priority = 1
		vol = -2
		pitch = 0
	}
}
crowdsingingvoldown_bussset = {
	crowd_singalong = {
		priority = 1
		vol = -100
		pitch = 0
	}
}
failed_song_pitching_down_bussset = {
	band_balance = {
		priority = 1
		vol = -10
		pitch = -8
	}
	guitar_balance = {
		priority = 1
		vol = -10
		pitch = -8
	}
}
