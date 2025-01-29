BussTree = {
	Master = {
		user_vocals = {
			vocals_balance = {
				LeafNodes = [
					vocals_stream
					vocals_options_sfx_buss
				]
			}
		}
		user_microphone = {
			microphone_balance = {
				LeafNodes = [
					mic_options_sfx_buss
					microphone_input_buss
				]
			}
		}
		user_drums = {
			drums_balance = {
				drums_total = {
					LeafNodes = [
						drumkick_stream
						drumsnare_stream
						drumtom_stream
						drumcymbal_stream
					]
				}
				LeafNodes = [
					options_drums
				]
			}
			drums_ingame = {
				drums_ingame_cymbals = {
					LeafNodes = [
						drums_ingame_cymbals_crash
						drums_ingame_cymbals_hats
					]
				}
				LeafNodes = [
					ingame_drums
					drums_ingame_hats
					drums_ingame_toms
					drums_ingame_kick
					drums_ingame_snare
				]
			}
			LeafNodes = [
				practicemode_drums
			]
		}
		User_Guitar = {
			Guitar_Balance = {
				LeafNodes = [
					guitar_stream
					options_guitar
				]
			}
		}
		user_bass = {
			bass_balance = {
				LeafNodes = [
					bass_stream
					options_bass
				]
			}
		}
		user_rhythmgtr = {
			rhythmgtr_balance = {
				LeafNodes = [
					user_rhythmgtr_dummy
				]
			}
		}
		user_crowd = {
			crowd_balance = {
				Crowd = {
					Crowd_W_Reverb = {
						LeafNodes = [
							Crowd_One_Shots
						]
					}
					LeafNodes = [
						Crowd_Beds
						Crowd_Cheers
						Crowd_Boos
						Crowd_Nuetral
						Crowd_Star_Power
						Crowd_PreEncore_Building
						Crowd_PreSong_Intro
						Crowd_Applause
						Crowd_Transitions
					]
				}
				LeafNodes = [
					options_crowd
				]
			}
		}
		User_SFX = {
			sfx_balance = {
				UI = {
					LeafNodes = [
						ui_ingame
						UI_Star_Power
						wrong_notes_bass
						wrong_notes_drums
						wrong_notes_guitar
					]
				}
				LeafNodes = [
					Default
					Test_Tones
					encore_loops
					Practice_Band_Playback
					options_sfx
					pyro
				]
			}
		}
		User_Band = {
			band_Balance = {
				LeafNodes = [
					band_stream
					Band_Playback
					Single_Player_Rhythm_Playback
					Countoffs
				]
			}
		}
		user_crowdsingalong = {
			crowdsingalong_balance = {
				LeafNodes = [
					crowdsingalong_stream
				]
			}
		}
		user_misc = {
			misc_balance = {
				LeafNodes = [
					Music_FrontEnd
					Music_Setlist
					binkcutscenes
					tutorial_vo
					Encore_Events
					Front_End
					pause_menu
				]
			}
		}
		user_jammode = {
			drums_jammode = {
				jammode_drums = {
					jammode_drums_cymbals = {
						LeafNodes = [
							jammode_drums_cymbals_crash
							jammode_drums_cymbals_hats
						]
					}
					LeafNodes = [
						jammode_drums_hats
						jammode_drums_toms
						jammode_drums_kick
						jammode_drums_snare
					]
				}
			}
			guitar_jammode = {
				LeafNodes = [
					jammode_leadguitar
					jammode_rhythmguitar
				]
			}
			bass_jammode = {
				LeafNodes = [
					jammode_bass
				]
			}
			melody_jammode = {
				LeafNodes = [
					jammode_vox
				]
			}
			clean_jammode = {
				lead_clean_jm = {
					LeafNodes = [
						jm_lead_clean
					]
				}
				rhythm_clean_jm = {
					LeafNodes = [
						jm_rhythm_clean
					]
				}
				keys_clean_jm = {
					LeafNodes = [
						jm_keys_clean
					]
				}
				drums_clean_jm = {
					jm_drums_clean = {
						jm_drums_cymbals_clean = {
							LeafNodes = [
								jm_drums_cymbals_crash_clean
								jm_drums_cymbals_hats_clean
							]
						}
						LeafNodes = [
							jm_drums_hats_clean
							jm_drums_toms_clean
							jm_drums_kick_clean
							jm_drums_snare_clean
						]
					}
				}
				bass_clean_jm = {
					LeafNodes = [
						jm_bass_clean
					]
				}
			}
			line61_jammode = {
				lead_line61_jm = {
					LeafNodes = [
						jm_lead_line61
					]
				}
				rhythm_line61_jm = {
					LeafNodes = [
						jm_rhythm_line61
					]
				}
				keys_line61_jm = {
					LeafNodes = [
						jm_keys_line61
					]
				}
				drums_line61_jm = {
					jm_drums_line61 = {
						jm_drums_cymbals_line61 = {
							LeafNodes = [
								jm_drums_cymbals_crash_line61
								jm_drums_cymbals_hats_line61
							]
						}
						LeafNodes = [
							jm_drums_hats_line61
							jm_drums_toms_line61
							jm_drums_kick_line61
							jm_drums_snare_line61
						]
					}
				}
				bass_line61_jm = {
					LeafNodes = [
						jm_bass_line61
					]
				}
			}
			line62_jammode = {
				lead_line62_jm = {
					LeafNodes = [
						jm_lead_line62
					]
				}
				rhythm_line62_jm = {
					LeafNodes = [
						jm_rhythm_line62
					]
				}
				keys_line62_jm = {
					LeafNodes = [
						jm_keys_line62
					]
				}
				drums_line62_jm = {
					jm_drums_line62 = {
						jm_drums_cymbals_line62 = {
							LeafNodes = [
								jm_drums_cymbals_crash_line62
								jm_drums_cymbals_hats_line62
							]
						}
						LeafNodes = [
							jm_drums_hats_line62
							jm_drums_toms_line62
							jm_drums_kick_line62
							jm_drums_snare_line62
						]
					}
				}
				bass_line62_jm = {
					LeafNodes = [
						jm_bass_line62
					]
				}
			}
		}
	}
}
default_BussSet = {
	Master = {
		Priority = 5
		vol = -3
		pitch = 0
		instance_rule = ignore
		max_instances = 64
	}
	Default = {
		Priority = 5
		vol = -4
		pitch = 0
	}
	Test_Tones = {
		Priority = 5
		vol = 0
		pitch = 0
	}
	User_SFX = {
		Priority = 1
		vol = -3.5
		pitch = 0
		instance_rule = ignore
		max_instances = 500
	}
	UI = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	User_Band = {
		Priority = 1
		vol = -3.5
		pitch = 0
	}
	band_stream = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	band_Balance = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	guitar_jammode = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	rhythm_clean_jm = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	rhythm_line61_jm = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	rhythm_line62_jm = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	lead_clean_jm = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	lead_line61_jm = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	lead_line62_jm = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	jammode_leadguitar = {
		Priority = 1
		vol = 1
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 2
	}
	jm_lead_clean = {
		Priority = 1
		vol = 1
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 2
	}
	jm_lead_line61 = {
		Priority = 1
		vol = 1
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 2
	}
	jm_lead_line62 = {
		Priority = 1
		vol = 1
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 2
	}
	bass_jammode = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	bass_clean_jm = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	bass_line61_jm = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	bass_line62_jm = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	jammode_bass = {
		Priority = 1
		vol = -2
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 3
	}
	jm_bass_clean = {
		Priority = 1
		vol = -2
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 3
	}
	jm_bass_line61 = {
		Priority = 1
		vol = -2
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 3
	}
	jm_bass_line62 = {
		Priority = 1
		vol = -2
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 3
	}
	jammode_rhythmguitar = {
		Priority = 1
		vol = -12
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 2
	}
	jm_rhythm_clean = {
		Priority = 1
		vol = -12
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 2
	}
	jm_rhythm_line61 = {
		Priority = 1
		vol = -12
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 2
	}
	jm_rhythm_line62 = {
		Priority = 1
		vol = -12
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 2
	}
	wrong_notes_guitar = {
		Priority = 1
		vol = -5
		pitch = 0
		instance_rule = oldest
		max_instances = 2
	}
	wrong_notes_bass = {
		Priority = 1
		vol = -5
		pitch = 0
		instance_rule = oldest
		max_instances = 2
	}
	Band_Playback = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Countoffs = {
		Priority = 1
		vol = -10.5
		pitch = 0
	}
	Practice_Band_Playback = {
		Priority = 1
		vol = -3
		pitch = 0
	}
	Front_End = {
		Priority = 1
		vol = -2.5
		pitch = 0
	}
	pause_menu = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	UI_Star_Power = {
		Priority = 1
		vol = -6
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 9
	}
	Crowd = {
		Priority = 1
		vol = -7
		pitch = 0
	}
	Crowd_Beds = {
		Priority = 1
		vol = -7
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 4
	}
	Crowd_Cheers = {
		Priority = 1
		vol = -10
		pitch = 0
	}
	Crowd_Boos = {
		Priority = 1
		vol = -6
		pitch = 0
	}
	Crowd_Nuetral = {
		Priority = 1
		vol = -6
		pitch = 0
	}
	Crowd_Star_Power = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Crowd_PreEncore_Building = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Crowd_PreSong_Intro = {
		Priority = 1
		vol = -6
		pitch = 0
	}
	Crowd_Applause = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Crowd_Transitions = {
		Priority = 1
		vol = -8
		pitch = 0
		instance_rule = ignore
		max_instances = 6
	}
	crowdsingalong_stream = {
		Priority = 1
		vol = -100
		pitch = 0
	}
	Crowd_W_Reverb = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Crowd_One_Shots = {
		Priority = 1
		vol = -18
		pitch = 0
		instance_rule = oldest
		max_instances = 10
	}
	Music_FrontEnd = {
		Priority = 1
		vol = -11
		pitch = 0
	}
	Music_Setlist = {
		Priority = 1
		vol = 3.5
		pitch = 0
	}
	Encore_Events = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	encore_loops = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	binkcutscenes = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	tutorial_vo = {
		Priority = 1
		vol = -3
		pitch = 0
	}
	jammode_vox = {
		Priority = 1
		vol = -8
		pitch = 0
		instance_rule = oldest
		max_instances = 2
	}
	jm_keys_clean = {
		Priority = 1
		vol = 0
		pitch = 0
		instance_rule = oldest
		max_instances = 2
	}
	jm_keys_line61 = {
		Priority = 1
		vol = 0
		pitch = 0
		instance_rule = oldest
		max_instances = 2
	}
	jm_keys_line62 = {
		Priority = 1
		vol = 0
		pitch = 0
		instance_rule = oldest
		max_instances = 2
	}
	user_drums = {
		Priority = 1
		vol = -3.5
		pitch = 0
	}
	user_vocals = {
		Priority = 1
		vol = -3.5
		pitch = 0
	}
	user_microphone = {
		Priority = 1
		vol = -3.5
		pitch = 0
	}
	clean_jammode = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	line61_jammode = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	line62_jammode = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	drums_jammode = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	drums_clean_jm = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	drums_line61_jm = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	drums_line62_jm = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	jammode_drums = {
		Priority = 1
		vol = -5
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 5
	}
	jm_drums_clean = {
		Priority = 1
		vol = -5
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 5
	}
	jm_drums_line61 = {
		Priority = 1
		vol = -5
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 5
	}
	jm_drums_line62 = {
		Priority = 1
		vol = -5
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 5
	}
	jammode_drums_cymbals = {
		Priority = 1
		vol = 0
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 3
	}
	jm_drums_cymbals_clean = {
		Priority = 1
		vol = 0
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 3
	}
	jm_drums_cymbals_line61 = {
		Priority = 1
		vol = 0
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 3
	}
	jm_drums_cymbals_line62 = {
		Priority = 1
		vol = 0
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 3
	}
	jammode_drums_hats = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	jm_drums_hats_clean = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	jm_drums_hats_line61 = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	jm_drums_hats_line62 = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	jammode_drums_toms = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	jm_drums_toms_clean = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	jm_drums_toms_line61 = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	jm_drums_toms_line62 = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	jammode_drums_kick = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	jm_drums_kick_clean = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	jm_drums_kick_line61 = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	jm_drums_kick_line62 = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	jammode_drums_snare = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	jm_drums_snare_clean = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	jm_drums_snare_line61 = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	jm_drums_snare_line62 = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	practicemode_drums = {
		Priority = 1
		vol = -8
		pitch = 0
		instance_rule = oldest
		max_instances = 8
	}
	drums_total = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	drumkick_stream = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	vocals_stream = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	vocals_options_sfx_buss = {
		Priority = 10
		vol = 0
		pitch = 0
	}
	mic_options_sfx_buss = {
		Priority = 10
		vol = 0
		pitch = 0
	}
	microphone_input_buss = {
		Priority = 5
		vol = 0
		pitch = 0
	}
	drumsnare_stream = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	drumtom_stream = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	drumcymbal_stream = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	User_Guitar = {
		Priority = 1
		vol = -3.5
		pitch = 0
	}
	user_bass = {
		Priority = 1
		vol = -3.5
		pitch = 0
	}
	user_rhythmgtr = {
		Priority = 1
		vol = -3.5
		pitch = 0
	}
	user_crowd = {
		Priority = 1
		vol = -3.5
		pitch = 0
	}
	vocals_balance = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	microphone_balance = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	drums_balance = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	wrong_notes_drums = {
		Priority = 5
		vol = -4
		pitch = 0
		instance_rule = oldest
		max_instances = 4
	}
	drums_ingame = {
		Priority = 2
		vol = -7
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 8
	}
	drums_ingame_kick = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	drums_ingame_snare = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	drums_ingame_toms = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	drums_ingame_hats = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	drums_ingame_cymbals = {
		Priority = 3
		vol = 0
		pitch = 0
		instance_rule = oldest
		max_instances = 3
	}
	ingame_drums = {
		Priority = 2
		vol = 0
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 8
	}
	Guitar_Balance = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	guitar_stream = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	bass_balance = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	bass_stream = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	rhythmgtr_balance = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	user_rhythmgtr_dummy = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	crowd_balance = {
		Priority = 1
		vol = -1.5
		pitch = 0
	}
	sfx_balance = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	options_drums = {
		Priority = 10
		vol = 0
		pitch = 0
	}
	options_guitar = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	options_bass = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	options_crowd = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	options_sfx = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	pyro = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	user_misc = {
		Priority = 1
		vol = -3.5
		pitch = 0
	}
	misc_balance = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	user_crowdsingalong = {
		Priority = 1
		vol = -3.5
		pitch = 0
	}
	crowdsingalong_balance = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	jammode_drums_cymbals_crash = {
		Priority = 2
		vol = 0
		pitch = 0
		instance_rule = oldest
		max_instances = 2
	}
	jm_drums_cymbals_crash_clean = {
		Priority = 2
		vol = 0
		pitch = 0
		instance_rule = oldest
		max_instances = 2
	}
	jm_drums_cymbals_crash_line61 = {
		Priority = 2
		vol = 0
		pitch = 0
		instance_rule = oldest
		max_instances = 2
	}
	jm_drums_cymbals_crash_line62 = {
		Priority = 2
		vol = 0
		pitch = 0
		instance_rule = oldest
		max_instances = 2
	}
	jammode_drums_cymbals_hats = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	jm_drums_cymbals_hats_clean = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	jm_drums_cymbals_hats_line61 = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	jm_drums_cymbals_hats_line62 = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	drums_ingame_cymbals_crash = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	drums_ingame_cymbals_hats = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	user_jammode = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	melody_jammode = {
		Priority = 1
		vol = -2.5
		pitch = 0
	}
	keys_clean_jm = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	keys_line61_jm = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	keys_line62_jm = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	ui_ingame = {
		Priority = 1
		vol = 0
		pitch = 0
	}
}
house_bussset = {
	drumkick_stream = {
		Priority = 1
		vol = -9
		pitch = 0
	}
	drumsnare_stream = {
		Priority = 1
		vol = -9
		pitch = 0
	}
	drumtom_stream = {
		Priority = 1
		vol = -8
		pitch = 0
	}
	drumcymbal_stream = {
		Priority = 1
		vol = -8
		pitch = 0
	}
	guitar_stream = {
		Priority = 1
		vol = -10
		pitch = 0
	}
	bass_stream = {
		Priority = 1
		vol = -5
		pitch = 0
	}
	vocals_stream = {
		Priority = 1
		vol = -9
		pitch = 0
	}
	band_stream = {
		Priority = 1
		vol = -8
		pitch = 0
	}
}
house_crowd_bussset = {
	Crowd = {
		Priority = 1
		vol = -5
		pitch = 0
	}
}
house_3db_bussset = {
	drumkick_stream = {
		Priority = 1
		vol = -6
		pitch = 0
	}
	drumsnare_stream = {
		Priority = 1
		vol = -6
		pitch = 0
	}
	drumtom_stream = {
		Priority = 1
		vol = -6
		pitch = 0
	}
	drumcymbal_stream = {
		Priority = 1
		vol = -6
		pitch = 0
	}
	guitar_stream = {
		Priority = 1
		vol = -5
		pitch = 0
	}
	bass_stream = {
		Priority = 1
		vol = -6
		pitch = 0
	}
	vocals_stream = {
		Priority = 1
		vol = -6
		pitch = 0
	}
	band_stream = {
		Priority = 1
		vol = -8
		pitch = 0
	}
	crowdsingalong_stream = {
		Priority = 1
		vol = -100
		pitch = 0
	}
}
stage_crowd_bussset = {
	Crowd = {
		Priority = 1
		vol = -12
		pitch = 0
	}
}
prestage_crowd_bussset = {
	Crowd = {
		Priority = 1
		vol = -12
		pitch = 0
	}
}
stage_bussset = {
	drumkick_stream = {
		Priority = 1
		vol = 1
		pitch = 0
	}
	drumsnare_stream = {
		Priority = 1
		vol = -5
		pitch = 0
	}
	drumtom_stream = {
		Priority = 1
		vol = -2
		pitch = 0
	}
	drumcymbal_stream = {
		Priority = 1
		vol = -7
		pitch = 0
	}
	guitar_stream = {
		Priority = 1
		vol = -7.25
		pitch = 0
	}
	bass_stream = {
		Priority = 1
		vol = -4
		pitch = 0
	}
	vocals_stream = {
		Priority = 1
		vol = -1
		pitch = 0
	}
	band_stream = {
		Priority = 1
		vol = -5.5
		pitch = 0
	}
	Crowd = {
		Priority = 1
		vol = -8.5
		pitch = 0
	}
	pyro = {
		Priority = 1
		vol = 0
		pitch = 0
	}
}
game_bussset = {
	drumkick_stream = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	drumsnare_stream = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	drumtom_stream = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	drumcymbal_stream = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	guitar_stream = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	bass_stream = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	vocals_stream = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	band_stream = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Crowd = {
		Priority = 1
		vol = -7
		pitch = 0
	}
}
join_bussset = {
	drumkick_stream = {
		Priority = 1
		vol = -3
		pitch = 0
	}
	drumsnare_stream = {
		Priority = 1
		vol = -3
		pitch = 0
	}
	drumtom_stream = {
		Priority = 1
		vol = -3
		pitch = 0
	}
	drumcymbal_stream = {
		Priority = 1
		vol = -3
		pitch = 0
	}
	guitar_stream = {
		Priority = 1
		vol = -3
		pitch = 0
	}
	bass_stream = {
		Priority = 1
		vol = -3
		pitch = 0
	}
	vocals_stream = {
		Priority = 1
		vol = -3
		pitch = 0
	}
	band_stream = {
		Priority = 1
		vol = -3
		pitch = 0
	}
	Crowd = {
		Priority = 1
		vol = -4.5
		pitch = 0
	}
}
pause_bussset = {
	drumkick_stream = {
		Priority = 1
		vol = -3
		pitch = 0
	}
	drumsnare_stream = {
		Priority = 1
		vol = -3
		pitch = 0
	}
	drumtom_stream = {
		Priority = 1
		vol = -3
		pitch = 0
	}
	drumcymbal_stream = {
		Priority = 1
		vol = -3
		pitch = 0
	}
	guitar_stream = {
		Priority = 1
		vol = -3
		pitch = 0
	}
	bass_stream = {
		Priority = 1
		vol = -3
		pitch = 0
	}
	vocals_stream = {
		Priority = 1
		vol = -3
		pitch = 0
	}
	band_stream = {
		Priority = 1
		vol = -3
		pitch = 0
	}
	Crowd = {
		Priority = 1
		vol = -4.5
		pitch = 0
	}
}
music_stream_quiet_bussset = {
	drumkick_stream = {
		Priority = 1
		vol = -100
		pitch = 0
	}
	drumsnare_stream = {
		Priority = 1
		vol = -100
		pitch = 0
	}
	drumtom_stream = {
		Priority = 1
		vol = -100
		pitch = 0
	}
	drumcymbal_stream = {
		Priority = 1
		vol = -100
		pitch = 0
	}
	guitar_stream = {
		Priority = 1
		vol = -100
		pitch = 0
	}
	bass_stream = {
		Priority = 1
		vol = -100
		pitch = 0
	}
	vocals_stream = {
		Priority = 1
		vol = -100
		pitch = 0
	}
	band_stream = {
		Priority = 1
		vol = -100
		pitch = 0
	}
	crowdsingalong_stream = {
		Priority = 1
		vol = -100
		pitch = 0
	}
}
start_of_game_crowds_silence_bussset = {
	Crowd = {
		Priority = 1
		vol = -100
		pitch = 0
	}
}
