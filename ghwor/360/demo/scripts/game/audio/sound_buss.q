busstree = {
	master = {
		user_vocals = {
			vocals_balance = {
				leafnodes = [
					vocals_stream
					vocals_options_sfx_buss
				]
			}
		}
		user_microphone = {
			microphone_balance = {
				leafnodes = [
					mic_options_sfx_buss
					microphone_input_buss
				]
			}
		}
		user_drums = {
			drums_balance = {
				drums_total = {
					leafnodes = [
						drumkick_stream
						drumsnare_stream
						drumtom_stream
						drumcymbal_stream
					]
				}
				leafnodes = [
					options_drums
				]
			}
			drums_ingame = {
				drums_ingame_cymbals = {
					leafnodes = [
						drums_ingame_cymbals_crash
						drums_ingame_cymbals_hats
					]
				}
				leafnodes = [
					ingame_drums
					drums_ingame_hats
					drums_ingame_toms
					drums_ingame_kick
					drums_ingame_snare
				]
			}
			drums_practicemode = {
				drums_practicemode_cymbals = {
					leafnodes = [
						drums_practicemode_cymbals_crash
						drums_practicemode_cymbals_hats
					]
				}
				leafnodes = [
					drums_practicemode_hats
					drums_practicemode_toms
					drums_practicemode_kick
					drums_practicemode_snare
				]
			}
			leafnodes = [
				practicemode_drums
			]
		}
		user_guitar = {
			guitar_balance = {
				leafnodes = [
					guitar_stream
					options_guitar
				]
			}
			leafnodes = [
				notetracker_stream
			]
		}
		user_bass = {
			bass_balance = {
				leafnodes = [
					bass_stream
					options_bass
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
							inner_crowd_one_shots
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
					options_crowd
				]
			}
		}
		user_sfx = {
			sfx_balance = {
				sfx = {
					ui = {
						leafnodes = [
							ui_ingame
							ui_star_power
							wrong_notes_bass
							wrong_notes_drums
							wrong_notes_guitar
						]
					}
					leafnodes = [
						`default`
						test_tones
						encore_loops
						practice_band_playback
						options_sfx
						pyro
					]
				}
			}
		}
		user_band = {
			band_balance = {
				leafnodes = [
					band_stream
					band_playback
					single_player_rhythm_playback
					countoffs
				]
			}
		}
		user_crowdsingalong = {
			crowdsingalong_balance = {
				leafnodes = [
					crowdsingalong_stream
				]
			}
		}
		user_misc = {
			misc_balance = {
				leafnodes = [
					music_frontend
					music_setlist
					binkcutscenes
					tutorial_vo
					encore_events
					front_end
					pause_menu
				]
			}
		}
		user_jammode = {
			drums_jammode = {
				jammode_drums = {
					jammode_drums_cymbals = {
						leafnodes = [
							jammode_drums_cymbals_crash
							jammode_drums_cymbals_hats
						]
					}
					leafnodes = [
						jammode_drums_hats
						jammode_drums_toms
						jammode_drums_kick
						jammode_drums_snare
					]
				}
			}
			guitar_jammode = {
				leafnodes = [
					jammode_leadguitar
					jammode_rhythmguitar
				]
			}
			bass_jammode = {
				leafnodes = [
					jammode_bass
				]
			}
			melody_jammode = {
				leafnodes = [
					jammode_vox
				]
			}
			clean_jammode = {
				lead_clean_jm = {
					leafnodes = [
						jm_lead_clean
					]
				}
				rhythm_clean_jm = {
					leafnodes = [
						jm_rhythm_clean
					]
				}
				keys_clean_jm = {
					leafnodes = [
						jm_keys_clean
					]
				}
				drums_clean_jm = {
					jm_drums_clean = {
						jm_drums_cymbals_clean = {
							leafnodes = [
								jm_drums_cymbals_crash_clean
								jm_drums_cymbals_hats_clean
							]
						}
						leafnodes = [
							jm_drums_hats_clean
							jm_drums_toms_clean
							jm_drums_kick_clean
							jm_drums_snare_clean
						]
					}
				}
				bass_clean_jm = {
					leafnodes = [
						jm_bass_clean
					]
				}
			}
			line61_jammode = {
				lead_line61_jm = {
					leafnodes = [
						jm_lead_line61
					]
				}
				rhythm_line61_jm = {
					leafnodes = [
						jm_rhythm_line61
					]
				}
				keys_line61_jm = {
					leafnodes = [
						jm_keys_line61
					]
				}
				drums_line61_jm = {
					jm_drums_line61 = {
						jm_drums_cymbals_line61 = {
							leafnodes = [
								jm_drums_cymbals_crash_line61
								jm_drums_cymbals_hats_line61
							]
						}
						leafnodes = [
							jm_drums_hats_line61
							jm_drums_toms_line61
							jm_drums_kick_line61
							jm_drums_snare_line61
						]
					}
				}
				bass_line61_jm = {
					leafnodes = [
						jm_bass_line61
					]
				}
			}
			line62_jammode = {
				lead_line62_jm = {
					leafnodes = [
						jm_lead_line62
					]
				}
				rhythm_line62_jm = {
					leafnodes = [
						jm_rhythm_line62
					]
				}
				keys_line62_jm = {
					leafnodes = [
						jm_keys_line62
					]
				}
				drums_line62_jm = {
					jm_drums_line62 = {
						jm_drums_cymbals_line62 = {
							leafnodes = [
								jm_drums_cymbals_crash_line62
								jm_drums_cymbals_hats_line62
							]
						}
						leafnodes = [
							jm_drums_hats_line62
							jm_drums_toms_line62
							jm_drums_kick_line62
							jm_drums_snare_line62
						]
					}
				}
				bass_line62_jm = {
					leafnodes = [
						jm_bass_line62
					]
				}
			}
		}
	}
}
default_bussset = {
	master = {
		priority = 5
		vol = 1
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
	band_stream = {
		priority = 1
		vol = 0
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
	rhythm_clean_jm = {
		priority = 1
		vol = 0
		pitch = 0
	}
	rhythm_line61_jm = {
		priority = 1
		vol = 0
		pitch = 0
	}
	rhythm_line62_jm = {
		priority = 1
		vol = 0
		pitch = 0
	}
	lead_clean_jm = {
		priority = 1
		vol = 0
		pitch = 0
	}
	lead_line61_jm = {
		priority = 1
		vol = 0
		pitch = 0
	}
	lead_line62_jm = {
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
	jm_lead_clean = {
		priority = 1
		vol = 1
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 2
	}
	jm_lead_line61 = {
		priority = 1
		vol = 1
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 2
	}
	jm_lead_line62 = {
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
	bass_clean_jm = {
		priority = 1
		vol = 0
		pitch = 0
	}
	bass_line61_jm = {
		priority = 1
		vol = 0
		pitch = 0
	}
	bass_line62_jm = {
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
	jm_bass_clean = {
		priority = 1
		vol = -2
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 3
	}
	jm_bass_line61 = {
		priority = 1
		vol = -2
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 3
	}
	jm_bass_line62 = {
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
	jm_rhythm_clean = {
		priority = 1
		vol = -12
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 2
	}
	jm_rhythm_line61 = {
		priority = 1
		vol = -12
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 2
	}
	jm_rhythm_line62 = {
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
		vol = -10.5
		pitch = 0
	}
	practice_band_playback = {
		priority = 1
		vol = -3
		pitch = 0
	}
	front_end = {
		priority = 1
		vol = -2.5
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
		instance_rule = oldest_with_priority
		max_instances = 9
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
		instance_rule = oldest_with_priority
		max_instances = 4
	}
	crowd_cheers = {
		priority = 1
		vol = -10
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
		instance_rule = ignore
		max_instances = 6
	}
	crowdsingalong_stream = {
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
		vol = -18
		pitch = 0
		instance_rule = oldest
		max_instances = 10
	}
	inner_crowd_one_shots = {
		priority = 1
		vol = -25
		pitch = 0
		instance_rule = oldest
		max_instances = 15
	}
	music_frontend = {
		priority = 1
		vol = -11
		pitch = 0
	}
	music_setlist = {
		priority = 1
		vol = 2.5
		pitch = 0
	}
	encore_events = {
		priority = 1
		vol = 3.5
		pitch = 0
	}
	encore_loops = {
		priority = 1
		vol = 0
		pitch = 0
	}
	binkcutscenes = {
		priority = 1
		vol = -1.5
		pitch = 0
	}
	tutorial_vo = {
		priority = 1
		vol = -3
		pitch = 0
	}
	jammode_vox = {
		priority = 1
		vol = -8
		pitch = 0
		instance_rule = oldest
		max_instances = 2
	}
	jm_keys_clean = {
		priority = 1
		vol = 0
		pitch = 0
		instance_rule = oldest
		max_instances = 2
	}
	jm_keys_line61 = {
		priority = 1
		vol = 0
		pitch = 0
		instance_rule = oldest
		max_instances = 2
	}
	jm_keys_line62 = {
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
	user_vocals = {
		priority = 1
		vol = -3.5
		pitch = 0
	}
	user_microphone = {
		priority = 1
		vol = -3.5
		pitch = 0
	}
	clean_jammode = {
		priority = 1
		vol = 0
		pitch = 0
	}
	line61_jammode = {
		priority = 1
		vol = 0
		pitch = 0
	}
	line62_jammode = {
		priority = 1
		vol = 0
		pitch = 0
	}
	drums_jammode = {
		priority = 1
		vol = 0
		pitch = 0
	}
	drums_clean_jm = {
		priority = 1
		vol = 0
		pitch = 0
	}
	drums_line61_jm = {
		priority = 1
		vol = 0
		pitch = 0
	}
	drums_line62_jm = {
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
	jm_drums_clean = {
		priority = 1
		vol = -5
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 5
	}
	jm_drums_line61 = {
		priority = 1
		vol = -5
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 5
	}
	jm_drums_line62 = {
		priority = 1
		vol = -5
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 5
	}
	jammode_drums_cymbals = {
		priority = 1
		vol = 0
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 3
	}
	jm_drums_cymbals_clean = {
		priority = 1
		vol = 0
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 3
	}
	jm_drums_cymbals_line61 = {
		priority = 1
		vol = 0
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 3
	}
	jm_drums_cymbals_line62 = {
		priority = 1
		vol = 0
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 3
	}
	jammode_drums_hats = {
		priority = 1
		vol = 0
		pitch = 0
	}
	jm_drums_hats_clean = {
		priority = 1
		vol = 0
		pitch = 0
	}
	jm_drums_hats_line61 = {
		priority = 1
		vol = 0
		pitch = 0
	}
	jm_drums_hats_line62 = {
		priority = 1
		vol = 0
		pitch = 0
	}
	jammode_drums_toms = {
		priority = 1
		vol = 0
		pitch = 0
	}
	jm_drums_toms_clean = {
		priority = 1
		vol = 0
		pitch = 0
	}
	jm_drums_toms_line61 = {
		priority = 1
		vol = 0
		pitch = 0
	}
	jm_drums_toms_line62 = {
		priority = 1
		vol = 0
		pitch = 0
	}
	jammode_drums_kick = {
		priority = 1
		vol = 0
		pitch = 0
	}
	jm_drums_kick_clean = {
		priority = 1
		vol = 0
		pitch = 0
	}
	jm_drums_kick_line61 = {
		priority = 1
		vol = 0
		pitch = 0
	}
	jm_drums_kick_line62 = {
		priority = 1
		vol = 0
		pitch = 0
	}
	jammode_drums_snare = {
		priority = 1
		vol = 0
		pitch = 0
	}
	jm_drums_snare_clean = {
		priority = 1
		vol = 0
		pitch = 0
	}
	jm_drums_snare_line61 = {
		priority = 1
		vol = 0
		pitch = 0
	}
	jm_drums_snare_line62 = {
		priority = 1
		vol = 0
		pitch = 0
	}
	practicemode_drums = {
		priority = 1
		vol = -8
		pitch = 0
		instance_rule = oldest
		max_instances = 8
	}
	drums_total = {
		priority = 1
		vol = 0
		pitch = 0
	}
	drumkick_stream = {
		priority = 1
		vol = 0
		pitch = 0
	}
	vocals_stream = {
		priority = 1
		vol = 0
		pitch = 0
	}
	vocals_options_sfx_buss = {
		priority = 10
		vol = 0
		pitch = 0
	}
	mic_options_sfx_buss = {
		priority = 10
		vol = 0
		pitch = 0
	}
	microphone_input_buss = {
		priority = 5
		vol = 0
		pitch = 0
	}
	drumsnare_stream = {
		priority = 1
		vol = 0
		pitch = 0
	}
	drumtom_stream = {
		priority = 1
		vol = 0
		pitch = 0
	}
	drumcymbal_stream = {
		priority = 1
		vol = 0
		pitch = 0
	}
	user_guitar = {
		priority = 1
		vol = -3.5
		pitch = 0
	}
	user_bass = {
		priority = 1
		vol = -3.5
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
	vocals_balance = {
		priority = 1
		vol = 0
		pitch = 0
	}
	microphone_balance = {
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
		priority = 2
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
		instance_rule = oldest
		max_instances = 1
	}
	drums_ingame_cymbals = {
		priority = 3
		vol = 0
		pitch = 0
		instance_rule = oldest
		max_instances = 3
	}
	ingame_drums = {
		priority = 2
		vol = 0
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 8
	}
	guitar_balance = {
		priority = 1
		vol = 0
		pitch = 0
	}
	guitar_stream = {
		priority = 1
		vol = 0
		pitch = 0
	}
	notetracker_stream = {
		priority = 1
		vol = 0
		pitch = 0
	}
	bass_balance = {
		priority = 1
		vol = 0
		pitch = 0
	}
	bass_stream = {
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
	options_drums = {
		priority = 10
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
	options_sfx = {
		priority = 1
		vol = 0
		pitch = 0
	}
	pyro = {
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
	jammode_drums_cymbals_crash = {
		priority = 2
		vol = 0
		pitch = 0
		instance_rule = oldest
		max_instances = 2
	}
	jm_drums_cymbals_crash_clean = {
		priority = 2
		vol = 0
		pitch = 0
		instance_rule = oldest
		max_instances = 2
	}
	jm_drums_cymbals_crash_line61 = {
		priority = 2
		vol = 0
		pitch = 0
		instance_rule = oldest
		max_instances = 2
	}
	jm_drums_cymbals_crash_line62 = {
		priority = 2
		vol = 0
		pitch = 0
		instance_rule = oldest
		max_instances = 2
	}
	jammode_drums_cymbals_hats = {
		priority = 1
		vol = 0
		pitch = 0
	}
	jm_drums_cymbals_hats_clean = {
		priority = 1
		vol = 0
		pitch = 0
	}
	jm_drums_cymbals_hats_line61 = {
		priority = 1
		vol = 0
		pitch = 0
	}
	jm_drums_cymbals_hats_line62 = {
		priority = 1
		vol = 0
		pitch = 0
	}
	drums_ingame_cymbals_crash = {
		priority = 1
		vol = 0
		pitch = 0
	}
	drums_ingame_cymbals_hats = {
		priority = 1
		vol = 0
		pitch = 0
	}
	user_jammode = {
		priority = 1
		vol = -5
		pitch = 0
	}
	melody_jammode = {
		priority = 1
		vol = -2.5
		pitch = 0
	}
	keys_clean_jm = {
		priority = 1
		vol = 0
		pitch = 0
	}
	keys_line61_jm = {
		priority = 1
		vol = 0
		pitch = 0
	}
	keys_line62_jm = {
		priority = 1
		vol = 0
		pitch = 0
	}
	ui_ingame = {
		priority = 1
		vol = 0
		pitch = 0
	}
	drums_practicemode = {
		priority = 2
		vol = -7
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 8
	}
	drums_practicemode_cymbals = {
		priority = 3
		vol = -2
		pitch = 0
	}
	drums_practicemode_cymbals_crash = {
		priority = 3
		vol = 0
		pitch = 0
		instance_rule = oldest
		max_instances = 3
	}
	drums_practicemode_cymbals_hats = {
		priority = 1
		vol = 0
		pitch = 0
		instance_rule = oldest
		max_instances = 1
	}
	drums_practicemode_hats = {
		priority = 1
		vol = 0
		pitch = 0
		instance_rule = oldest
		max_instances = 1
	}
	drums_practicemode_toms = {
		priority = 1
		vol = 0
		pitch = 0
	}
	drums_practicemode_kick = {
		priority = 1
		vol = 0
		pitch = 0
	}
	drums_practicemode_snare = {
		priority = 1
		vol = 0
		pitch = 0
	}
	sfx = {
		priority = 1
		vol = 0
		pitch = 0
	}
}
house_bussset = {
	drumkick_stream = {
		priority = 1
		vol = -9
		pitch = 0
	}
	drumsnare_stream = {
		priority = 1
		vol = -9
		pitch = 0
	}
	drumtom_stream = {
		priority = 1
		vol = -8
		pitch = 0
	}
	drumcymbal_stream = {
		priority = 1
		vol = -8
		pitch = 0
	}
	guitar_stream = {
		priority = 1
		vol = -10
		pitch = 0
	}
	bass_stream = {
		priority = 1
		vol = -5
		pitch = 0
	}
	vocals_stream = {
		priority = 1
		vol = -9
		pitch = 0
	}
	band_stream = {
		priority = 1
		vol = -8
		pitch = 0
	}
}
house_crowd_bussset = {
	crowd = {
		priority = 1
		vol = -5
		pitch = 0
	}
}
house_3db_bussset = {
	drumkick_stream = {
		priority = 1
		vol = -6
		pitch = 0
	}
	drumsnare_stream = {
		priority = 1
		vol = -6
		pitch = 0
	}
	drumtom_stream = {
		priority = 1
		vol = -6
		pitch = 0
	}
	drumcymbal_stream = {
		priority = 1
		vol = -6
		pitch = 0
	}
	guitar_stream = {
		priority = 1
		vol = -5
		pitch = 0
	}
	bass_stream = {
		priority = 1
		vol = -6
		pitch = 0
	}
	vocals_stream = {
		priority = 1
		vol = -6
		pitch = 0
	}
	band_stream = {
		priority = 1
		vol = -8
		pitch = 0
	}
	crowdsingalong_stream = {
		priority = 1
		vol = -100
		pitch = 0
	}
}
stage_crowd_bussset = {
	crowd = {
		priority = 1
		vol = -12
		pitch = 0
	}
}
prestage_crowd_bussset = {
	crowd = {
		priority = 1
		vol = -12
		pitch = 0
	}
}
stage_bussset = {
	drumkick_stream = {
		priority = 1
		vol = 1
		pitch = 0
	}
	drumsnare_stream = {
		priority = 1
		vol = -5
		pitch = 0
	}
	drumtom_stream = {
		priority = 1
		vol = -2
		pitch = 0
	}
	drumcymbal_stream = {
		priority = 1
		vol = -7
		pitch = 0
	}
	guitar_stream = {
		priority = 1
		vol = -7.25
		pitch = 0
	}
	bass_stream = {
		priority = 1
		vol = -4
		pitch = 0
	}
	vocals_stream = {
		priority = 1
		vol = -1
		pitch = 0
	}
	band_stream = {
		priority = 1
		vol = -5.5
		pitch = 0
	}
	crowd = {
		priority = 1
		vol = -8.5
		pitch = 0
	}
	pyro = {
		priority = 1
		vol = 0
		pitch = 0
	}
}
game_bussset = {
	drumkick_stream = {
		priority = 1
		vol = 0
		pitch = 0
	}
	drumsnare_stream = {
		priority = 1
		vol = 0
		pitch = 0
	}
	drumtom_stream = {
		priority = 1
		vol = 0
		pitch = 0
	}
	drumcymbal_stream = {
		priority = 1
		vol = 0
		pitch = 0
	}
	guitar_stream = {
		priority = 1
		vol = 0
		pitch = 0
	}
	bass_stream = {
		priority = 1
		vol = 0
		pitch = 0
	}
	vocals_stream = {
		priority = 1
		vol = 0
		pitch = 0
	}
	band_stream = {
		priority = 1
		vol = 0
		pitch = 0
	}
	crowd = {
		priority = 1
		vol = -7
		pitch = 0
	}
}
join_bussset = {
	drumkick_stream = {
		priority = 1
		vol = -3
		pitch = 0
	}
	drumsnare_stream = {
		priority = 1
		vol = -3
		pitch = 0
	}
	drumtom_stream = {
		priority = 1
		vol = -3
		pitch = 0
	}
	drumcymbal_stream = {
		priority = 1
		vol = -3
		pitch = 0
	}
	guitar_stream = {
		priority = 1
		vol = -3
		pitch = 0
	}
	bass_stream = {
		priority = 1
		vol = -3
		pitch = 0
	}
	vocals_stream = {
		priority = 1
		vol = -3
		pitch = 0
	}
	band_stream = {
		priority = 1
		vol = -3
		pitch = 0
	}
	crowd = {
		priority = 1
		vol = -4.5
		pitch = 0
	}
}
pause_bussset = {
	drumkick_stream = {
		priority = 1
		vol = -3
		pitch = 0
	}
	drumsnare_stream = {
		priority = 1
		vol = -3
		pitch = 0
	}
	drumtom_stream = {
		priority = 1
		vol = -3
		pitch = 0
	}
	drumcymbal_stream = {
		priority = 1
		vol = -3
		pitch = 0
	}
	guitar_stream = {
		priority = 1
		vol = -3
		pitch = 0
	}
	bass_stream = {
		priority = 1
		vol = -3
		pitch = 0
	}
	vocals_stream = {
		priority = 1
		vol = -3
		pitch = 0
	}
	band_stream = {
		priority = 1
		vol = -3
		pitch = 0
	}
	crowd = {
		priority = 1
		vol = -4.5
		pitch = 0
	}
}
music_stream_quiet_bussset = {
	drumkick_stream = {
		priority = 1
		vol = -100
		pitch = 0
	}
	drumsnare_stream = {
		priority = 1
		vol = -100
		pitch = 0
	}
	drumtom_stream = {
		priority = 1
		vol = -100
		pitch = 0
	}
	drumcymbal_stream = {
		priority = 1
		vol = -100
		pitch = 0
	}
	guitar_stream = {
		priority = 1
		vol = -100
		pitch = 0
	}
	bass_stream = {
		priority = 1
		vol = -100
		pitch = 0
	}
	vocals_stream = {
		priority = 1
		vol = -100
		pitch = 0
	}
	band_stream = {
		priority = 1
		vol = -100
		pitch = 0
	}
	crowdsingalong_stream = {
		priority = 1
		vol = -100
		pitch = 0
	}
}
start_of_game_crowds_silence_bussset = {
	crowd = {
		priority = 1
		vol = -100
		pitch = 0
	}
}
music_stream_zero_db_bussset = {
	drumkick_stream = {
		priority = 1
		vol = 0
		pitch = 0
	}
	drumsnare_stream = {
		priority = 1
		vol = 0
		pitch = 0
	}
	drumtom_stream = {
		priority = 1
		vol = 0
		pitch = 0
	}
	drumcymbal_stream = {
		priority = 1
		vol = 0
		pitch = 0
	}
	guitar_stream = {
		priority = 1
		vol = 0
		pitch = 0
	}
	bass_stream = {
		priority = 1
		vol = 0
		pitch = 0
	}
	vocals_stream = {
		priority = 1
		vol = 0
		pitch = 0
	}
	band_stream = {
		priority = 1
		vol = 0
		pitch = 0
	}
	crowdsingalong_stream = {
		priority = 1
		vol = 0
		pitch = 0
	}
}
