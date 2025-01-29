busstree = {
	master = {
		user_leadvox = {
			leadvox_balance = {
				leafnodes = [
					lead_vox
					jammode_vox
					options_vox
				]
			}
		}
		user_drums = {
			drums_balance = {
				drums_total = {
					leafnodes = [
						drums_kick
						drums_snare
						drums_tom
						drums_cymbal
					]
				}
				leafnodes = [
					options_drums
				]
			}
			drums_ingame = {
				leafnodes = [
					ingame_drums
					drums_ingame_cymbals
					drums_ingame_hats
					drums_ingame_toms
					drums_ingame_kick
					drums_ingame_snare
				]
			}
			drums_jammode = {
				jammode_drums = {
					leafnodes = [
						jammode_drums_cymbals
						jammode_drums_hats
						jammode_drums_toms
						jammode_drums_kick
						jammode_drums_snare
					]
				}
			}
			leafnodes = [
				practicemode_drums
			]
		}
		user_leadgtr = {
			leadgtr_balance = {
				guitar_jammode = {
					leafnodes = [
						jammode_leadguitar
						jammode_rhythmguitar
					]
				}
				leafnodes = [
					user_leadgtr_dummy
					options_guitar
				]
			}
		}
		user_bass = {
			bass_balance = {
				leafnodes = [
					user_bass_dummy
					options_bass
				]
			}
			bass_jammode = {
				leafnodes = [
					jammode_bass
				]
			}
		}
		user_rhythmgtr = {
			rhythmgtr_balance = {
				leafnodes = [
					user_rhythmgtr_dummy
				]
			}
		}
		user_crowd = {
			crowd_balance = {
				crowd = {
					crowd_w_reverb = {
						leafnodes = [
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
					user_crowd_dummy
					options_crowd
				]
			}
		}
		user_sfx = {
			sfx_balance = {
				ui = {
					leafnodes = [
						front_end
						pause_menu
						ui_star_power
						ui_battle_mode
						wrong_notes_bass
						wrong_notes_drums
						wrong_notes_guitar
					]
				}
				leafnodes = [
					`default`
					test_tones
					encore_events
					encore_loops
					practice_band_playback
					training_vo
				]
			}
		}
		user_band = {
			band_balance = {
				leafnodes = [
					band_playback
					single_player_rhythm_playback
					countoffs
				]
			}
		}
		user_crowdsingalong = {
			crowdsingalong_balance = {
				leafnodes = [
					crowd_singalong
				]
			}
		}
		user_misc = {
			misc_balance = {
				leafnodes = [
					music_frontend
					music_setlist
					binkcutscenes
				]
			}
		}
	}
}
default_bussset = {
	master = {
		priority = 5
		vol = 2
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
		vol = -3.5
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
		vol = -3.5
		pitch = 0
	}
	band_balance = {
		priority = 1
		vol = 0
		pitch = 0
	}
	guitar_jammode = {
		priority = 1
		vol = 0
		pitch = 0
	}
	jammode_leadguitar = {
		priority = 1
		vol = 1
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 2
	}
	bass_jammode = {
		priority = 1
		vol = 0
		pitch = 0
	}
	jammode_bass = {
		priority = 1
		vol = -2
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 3
	}
	jammode_rhythmguitar = {
		priority = 1
		vol = -12
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 2
	}
	wrong_notes_guitar = {
		priority = 1
		vol = -5
		pitch = 0
		instance_rule = oldest
		max_instances = 2
	}
	wrong_notes_bass = {
		priority = 1
		vol = -5
		pitch = 0
		instance_rule = oldest
		max_instances = 2
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
		vol = -3
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
		vol = -7
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
		vol = -7
		pitch = 0
		instance_rule = oldest
		max_instances = 20
	}
	music_frontend = {
		priority = 1
		vol = -11
		pitch = 0
	}
	music_setlist = {
		priority = 1
		vol = 0
		pitch = 0
	}
	encore_events = {
		priority = 1
		vol = 0
		pitch = 0
	}
	encore_loops = {
		priority = 1
		vol = 0
		pitch = 0
	}
	binkcutscenes = {
		priority = 1
		vol = -5
		pitch = 0
	}
	training_vo = {
		priority = 1
		vol = 0
		pitch = 0
	}
	user_leadvox = {
		priority = 1
		vol = -3.5
		pitch = 0
	}
	lead_vox = {
		priority = 1
		vol = 0
		pitch = 0
	}
	jammode_vox = {
		priority = 1
		vol = 0
		pitch = 0
		instance_rule = oldest
		max_instances = 2
	}
	user_drums = {
		priority = 1
		vol = -3.5
		pitch = 0
	}
	drums_jammode = {
		priority = 1
		vol = 0
		pitch = 0
	}
	jammode_drums = {
		priority = 1
		vol = -5
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 5
	}
	jammode_drums_cymbals = {
		priority = 2
		vol = 0
		pitch = 0
		instance_rule = oldest
		max_instances = 2
	}
	jammode_drums_hats = {
		priority = 1
		vol = 0
		pitch = 0
	}
	jammode_drums_toms = {
		priority = 1
		vol = 0
		pitch = 0
	}
	jammode_drums_kick = {
		priority = 1
		vol = 0
		pitch = 0
	}
	jammode_drums_snare = {
		priority = 1
		vol = 0
		pitch = 0
	}
	practicemode_drums = {
		priority = 1
		vol = -5
		pitch = 0
		instance_rule = oldest
		max_instances = 8
	}
	drums_total = {
		priority = 1
		vol = 0
		pitch = 0
	}
	drums_kick = {
		priority = 1
		vol = 0
		pitch = 0
	}
	drums_snare = {
		priority = 1
		vol = 0
		pitch = 0
	}
	drums_tom = {
		priority = 1
		vol = 0
		pitch = 0
	}
	drums_cymbal = {
		priority = 1
		vol = 0
		pitch = 0
	}
	user_leadgtr = {
		priority = 1
		vol = -3.5
		pitch = 0
	}
	user_leadgtr_dummy = {
		priority = 1
		vol = 0
		pitch = 0
	}
	user_bass = {
		priority = 1
		vol = -3.5
		pitch = 0
	}
	user_bass_dummy = {
		priority = 1
		vol = 0
		pitch = 0
	}
	user_rhythmgtr = {
		priority = 1
		vol = -3.5
		pitch = 0
	}
	user_crowd = {
		priority = 1
		vol = -3.5
		pitch = 0
	}
	user_crowd_dummy = {
		priority = 1
		vol = 0
		pitch = 0
	}
	leadvox_balance = {
		priority = 1
		vol = 0
		pitch = 0
	}
	drums_balance = {
		priority = 1
		vol = 0
		pitch = 0
	}
	wrong_notes_drums = {
		priority = 5
		vol = -4
		pitch = 0
		instance_rule = oldest
		max_instances = 4
	}
	drums_ingame = {
		priority = 1
		vol = -7
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 8
	}
	drums_ingame_kick = {
		priority = 1
		vol = 0
		pitch = 0
	}
	drums_ingame_snare = {
		priority = 1
		vol = 0
		pitch = 0
	}
	drums_ingame_toms = {
		priority = 1
		vol = 0
		pitch = 0
	}
	drums_ingame_hats = {
		priority = 1
		vol = 0
		pitch = 0
	}
	drums_ingame_cymbals = {
		priority = 2
		vol = 0
		pitch = 0
		instance_rule = oldest
		max_instances = 3
	}
	ingame_drums = {
		priority = 1
		vol = 0
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 8
	}
	leadgtr_balance = {
		priority = 1
		vol = 0
		pitch = 0
	}
	bass_balance = {
		priority = 1
		vol = 0
		pitch = 0
	}
	rhythmgtr_balance = {
		priority = 1
		vol = 0
		pitch = 0
	}
	user_rhythmgtr_dummy = {
		priority = 1
		vol = 0
		pitch = 0
	}
	crowd_balance = {
		priority = 1
		vol = -1.5
		pitch = 0
	}
	sfx_balance = {
		priority = 1
		vol = 0
		pitch = 0
	}
	options_vox = {
		priority = 1
		vol = 0
		pitch = 0
	}
	options_drums = {
		priority = 1
		vol = 0
		pitch = 0
	}
	options_guitar = {
		priority = 1
		vol = 0
		pitch = 0
	}
	options_bass = {
		priority = 1
		vol = 0
		pitch = 0
	}
	options_crowd = {
		priority = 1
		vol = 0
		pitch = 0
	}
	user_misc = {
		priority = 1
		vol = -3.5
		pitch = 0
	}
	misc_balance = {
		priority = 1
		vol = 0
		pitch = 0
	}
	user_crowdsingalong = {
		priority = 1
		vol = -3.5
		pitch = 0
	}
	crowdsingalong_balance = {
		priority = 1
		vol = 0
		pitch = 0
	}
}
