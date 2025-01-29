BussTree = {
	Master = {
		User_Vocals = {
			Vocals_Balance = {
				LeafNodes = [
					Vocals_Stream
					Vocals_Options_SFX_Buss
				]
			}
		}
		User_Microphone = {
			Microphone_Balance = {
				LeafNodes = [
					Mic_Options_SFX_Buss
					Microphone_Input_Buss
				]
			}
		}
		User_Drums = {
			Drums_Balance = {
				Drums_Total = {
					LeafNodes = [
						DrumKick_Stream
						DrumSnare_Stream
						DrumTom_Stream
						DrumCymbal_Stream
					]
				}
				LeafNodes = [
					Options_Drums
				]
			}
			Drums_InGame = {
				drums_ingame_cymbals = {
					LeafNodes = [
						Drums_InGame_Cymbals_Crash
						Drums_InGame_Cymbals_Hats
					]
				}
				LeafNodes = [
					InGame_Drums
					Drums_InGame_Hats
					drums_ingame_toms
					drums_ingame_kick
					drums_ingame_snare
				]
			}
			LeafNodes = [
				PracticeMode_Drums
			]
		}
		User_Guitar = {
			Guitar_Balance = {
				LeafNodes = [
					guitar_stream
					Options_Guitar
				]
			}
		}
		User_Bass = {
			Bass_Balance = {
				LeafNodes = [
					Bass_Stream
					Options_Bass
				]
			}
		}
		User_RhythmGTR = {
			RhythmGTR_Balance = {
				LeafNodes = [
					User_RhythmGTR_Dummy
				]
			}
		}
		User_Crowd = {
			Crowd_Balance = {
				Crowd = {
					Crowd_W_Reverb = {
						LeafNodes = [
							Crowd_One_Shots
						]
					}
					LeafNodes = [
						Crowd_beds
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
					Options_Crowd
				]
			}
		}
		User_SFX = {
			SFX_Balance = {
				ui = {
					LeafNodes = [
						UI_InGame
						UI_Star_Power
						Wrong_Notes_Bass
						Wrong_Notes_Drums
						Wrong_Notes_Guitar
						UI_Star_Power_Delay
					]
				}
				LeafNodes = [
					Default
					Test_Tones
					Encore_Loops
					Practice_Band_Playback
					Options_SFX
					Pyro
				]
			}
		}
		User_Band = {
			Band_Balance = {
				LeafNodes = [
					Band_Stream
					Band_Playback
					Single_Player_Rhythm_Playback
					Countoffs
				]
			}
		}
		User_CrowdSingalong = {
			CrowdSingalong_Balance = {
				LeafNodes = [
					CrowdSingalong_Stream
				]
			}
		}
		User_Misc = {
			Misc_Balance = {
				LeafNodes = [
					Music_FrontEnd
					Music_Setlist
					BinkCutScenes
					Tutorial_VO
					Encore_Events
					front_end
					pause_menu
				]
			}
		}
		User_JamMode = {
			Drums_JamMode = {
				JamMode_Drums = {
					JamMode_Drums_Cymbals = {
						LeafNodes = [
							JamMode_Drums_Cymbals_Crash
							JamMode_Drums_Cymbals_Hats
						]
					}
					LeafNodes = [
						JamMode_Drums_Hats
						JamMode_Drums_Toms
						JamMode_Drums_Kick
						JamMode_Drums_Snare
					]
				}
			}
			Guitar_JamMode = {
				LeafNodes = [
					JamMode_LeadGuitar
					JamMode_RhythmGuitar
				]
			}
			Bass_JamMode = {
				LeafNodes = [
					JamMode_Bass
				]
			}
			Melody_JamMode = {
				LeafNodes = [
					JamMode_Vox
				]
			}
			Clean_JamMode = {
				Lead_Clean_JM = {
					LeafNodes = [
						JM_Lead_Clean
					]
				}
				Rhythm_Clean_JM = {
					LeafNodes = [
						JM_Rhythm_Clean
					]
				}
				Keys_Clean_JM = {
					LeafNodes = [
						JM_Keys_Clean
					]
				}
				Drums_Clean_JM = {
					JM_Drums_Clean = {
						JM_Drums_Cymbals_Clean = {
							LeafNodes = [
								JM_Drums_Cymbals_Crash_Clean
								JM_Drums_Cymbals_Hats_Clean
							]
						}
						LeafNodes = [
							JM_Drums_Hats_Clean
							JM_Drums_Toms_Clean
							JM_Drums_Kick_Clean
							JM_Drums_Snare_Clean
						]
					}
				}
				Bass_Clean_JM = {
					LeafNodes = [
						JM_Bass_Clean
					]
				}
			}
			Line61_JamMode = {
				Lead_Line61_JM = {
					LeafNodes = [
						JM_Lead_Line61
					]
				}
				Rhythm_Line61_JM = {
					LeafNodes = [
						JM_Rhythm_Line61
					]
				}
				Keys_Line61_JM = {
					LeafNodes = [
						JM_Keys_Line61
					]
				}
				Drums_Line61_JM = {
					JM_Drums_Line61 = {
						JM_Drums_Cymbals_Line61 = {
							LeafNodes = [
								JM_Drums_Cymbals_Crash_Line61
								JM_Drums_Cymbals_Hats_Line61
							]
						}
						LeafNodes = [
							JM_Drums_Hats_Line61
							JM_Drums_Toms_Line61
							JM_Drums_Kick_Line61
							JM_Drums_Snare_Line61
						]
					}
				}
				Bass_Line61_JM = {
					LeafNodes = [
						JM_Bass_Line61
					]
				}
			}
			Line62_JamMode = {
				Lead_Line62_JM = {
					LeafNodes = [
						JM_Lead_Line62
					]
				}
				Rhythm_Line62_JM = {
					LeafNodes = [
						JM_Rhythm_Line62
					]
				}
				Keys_Line62_JM = {
					LeafNodes = [
						JM_Keys_Line62
					]
				}
				Drums_Line62_JM = {
					JM_Drums_Line62 = {
						JM_Drums_Cymbals_Line62 = {
							LeafNodes = [
								JM_Drums_Cymbals_Crash_Line62
								JM_Drums_Cymbals_Hats_Line62
							]
						}
						LeafNodes = [
							JM_Drums_Hats_Line62
							JM_Drums_Toms_Line62
							JM_Drums_Kick_Line62
							JM_Drums_Snare_Line62
						]
					}
				}
				Bass_Line62_JM = {
					LeafNodes = [
						JM_Bass_Line62
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
	ui = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	User_Band = {
		Priority = 1
		vol = -3.5
		pitch = 0
	}
	Band_Stream = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Band_Balance = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Guitar_JamMode = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Rhythm_Clean_JM = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Rhythm_Line61_JM = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Rhythm_Line62_JM = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Lead_Clean_JM = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Lead_Line61_JM = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Lead_Line62_JM = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	JamMode_LeadGuitar = {
		Priority = 1
		vol = 1
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 2
	}
	JM_Lead_Clean = {
		Priority = 1
		vol = 1
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 2
	}
	JM_Lead_Line61 = {
		Priority = 1
		vol = 1
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 2
	}
	JM_Lead_Line62 = {
		Priority = 1
		vol = 1
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 2
	}
	Bass_JamMode = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Bass_Clean_JM = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Bass_Line61_JM = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Bass_Line62_JM = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	JamMode_Bass = {
		Priority = 1
		vol = -2
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 3
	}
	JM_Bass_Clean = {
		Priority = 1
		vol = -2
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 3
	}
	JM_Bass_Line61 = {
		Priority = 1
		vol = -2
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 3
	}
	JM_Bass_Line62 = {
		Priority = 1
		vol = -2
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 3
	}
	JamMode_RhythmGuitar = {
		Priority = 1
		vol = -12
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 2
	}
	JM_Rhythm_Clean = {
		Priority = 1
		vol = -12
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 2
	}
	JM_Rhythm_Line61 = {
		Priority = 1
		vol = -12
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 2
	}
	JM_Rhythm_Line62 = {
		Priority = 1
		vol = -12
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 2
	}
	Wrong_Notes_Guitar = {
		Priority = 1
		vol = -5
		pitch = 0
		instance_rule = oldest
		max_instances = 2
	}
	Wrong_Notes_Bass = {
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
	front_end = {
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
	UI_Star_Power_Delay = {
		Priority = 1
		vol = -6
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 20
	}
	Crowd = {
		Priority = 1
		vol = -7
		pitch = 0
	}
	Crowd_beds = {
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
	CrowdSingalong_Stream = {
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
	Encore_Loops = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	BinkCutScenes = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Tutorial_VO = {
		Priority = 1
		vol = -3
		pitch = 0
	}
	JamMode_Vox = {
		Priority = 1
		vol = -8
		pitch = 0
		instance_rule = oldest
		max_instances = 2
	}
	JM_Keys_Clean = {
		Priority = 1
		vol = 0
		pitch = 0
		instance_rule = oldest
		max_instances = 2
	}
	JM_Keys_Line61 = {
		Priority = 1
		vol = 0
		pitch = 0
		instance_rule = oldest
		max_instances = 2
	}
	JM_Keys_Line62 = {
		Priority = 1
		vol = 0
		pitch = 0
		instance_rule = oldest
		max_instances = 2
	}
	User_Drums = {
		Priority = 1
		vol = -3.5
		pitch = 0
	}
	User_Vocals = {
		Priority = 1
		vol = -3.5
		pitch = 0
	}
	User_Microphone = {
		Priority = 1
		vol = -3.5
		pitch = 0
	}
	Clean_JamMode = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Line61_JamMode = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Line62_JamMode = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Drums_JamMode = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Drums_Clean_JM = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Drums_Line61_JM = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Drums_Line62_JM = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	JamMode_Drums = {
		Priority = 1
		vol = -5
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 5
	}
	JM_Drums_Clean = {
		Priority = 1
		vol = -5
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 5
	}
	JM_Drums_Line61 = {
		Priority = 1
		vol = -5
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 5
	}
	JM_Drums_Line62 = {
		Priority = 1
		vol = -5
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 5
	}
	JamMode_Drums_Cymbals = {
		Priority = 1
		vol = 0
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 3
	}
	JM_Drums_Cymbals_Clean = {
		Priority = 1
		vol = 0
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 3
	}
	JM_Drums_Cymbals_Line61 = {
		Priority = 1
		vol = 0
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 3
	}
	JM_Drums_Cymbals_Line62 = {
		Priority = 1
		vol = 0
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 3
	}
	JamMode_Drums_Hats = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	JM_Drums_Hats_Clean = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	JM_Drums_Hats_Line61 = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	JM_Drums_Hats_Line62 = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	JamMode_Drums_Toms = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	JM_Drums_Toms_Clean = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	JM_Drums_Toms_Line61 = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	JM_Drums_Toms_Line62 = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	JamMode_Drums_Kick = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	JM_Drums_Kick_Clean = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	JM_Drums_Kick_Line61 = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	JM_Drums_Kick_Line62 = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	JamMode_Drums_Snare = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	JM_Drums_Snare_Clean = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	JM_Drums_Snare_Line61 = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	JM_Drums_Snare_Line62 = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	PracticeMode_Drums = {
		Priority = 1
		vol = -8
		pitch = 0
		instance_rule = oldest
		max_instances = 8
	}
	Drums_Total = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	DrumKick_Stream = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Vocals_Stream = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Vocals_Options_SFX_Buss = {
		Priority = 10
		vol = 0
		pitch = 0
	}
	Mic_Options_SFX_Buss = {
		Priority = 10
		vol = 0
		pitch = 0
	}
	Microphone_Input_Buss = {
		Priority = 5
		vol = 0
		pitch = 0
	}
	DrumSnare_Stream = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	DrumTom_Stream = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	DrumCymbal_Stream = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	User_Guitar = {
		Priority = 1
		vol = -3.5
		pitch = 0
	}
	User_Bass = {
		Priority = 1
		vol = -3.5
		pitch = 0
	}
	User_RhythmGTR = {
		Priority = 1
		vol = -3.5
		pitch = 0
	}
	User_Crowd = {
		Priority = 1
		vol = -3.5
		pitch = 0
	}
	Vocals_Balance = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Microphone_Balance = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Drums_Balance = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Wrong_Notes_Drums = {
		Priority = 5
		vol = -4
		pitch = 0
		instance_rule = oldest
		max_instances = 4
	}
	Drums_InGame = {
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
	Drums_InGame_Hats = {
		Priority = 1
		vol = 0
		pitch = 0
		instance_rule = oldest
		max_instances = 1
	}
	drums_ingame_cymbals = {
		Priority = 3
		vol = 0
		pitch = 0
		instance_rule = oldest
		max_instances = 3
	}
	InGame_Drums = {
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
	Bass_Balance = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Bass_Stream = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	RhythmGTR_Balance = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	User_RhythmGTR_Dummy = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Crowd_Balance = {
		Priority = 1
		vol = -1.5
		pitch = 0
	}
	SFX_Balance = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Options_Drums = {
		Priority = 10
		vol = 0
		pitch = 0
	}
	Options_Guitar = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Options_Bass = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Options_Crowd = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Options_SFX = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Pyro = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	User_Misc = {
		Priority = 1
		vol = -3.5
		pitch = 0
	}
	Misc_Balance = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	User_CrowdSingalong = {
		Priority = 1
		vol = -3.5
		pitch = 0
	}
	CrowdSingalong_Balance = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	JamMode_Drums_Cymbals_Crash = {
		Priority = 2
		vol = 0
		pitch = 0
		instance_rule = oldest
		max_instances = 2
	}
	JM_Drums_Cymbals_Crash_Clean = {
		Priority = 2
		vol = 0
		pitch = 0
		instance_rule = oldest
		max_instances = 2
	}
	JM_Drums_Cymbals_Crash_Line61 = {
		Priority = 2
		vol = 0
		pitch = 0
		instance_rule = oldest
		max_instances = 2
	}
	JM_Drums_Cymbals_Crash_Line62 = {
		Priority = 2
		vol = 0
		pitch = 0
		instance_rule = oldest
		max_instances = 2
	}
	JamMode_Drums_Cymbals_Hats = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	JM_Drums_Cymbals_Hats_Clean = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	JM_Drums_Cymbals_Hats_Line61 = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	JM_Drums_Cymbals_Hats_Line62 = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Drums_InGame_Cymbals_Crash = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Drums_InGame_Cymbals_Hats = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	User_JamMode = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Melody_JamMode = {
		Priority = 1
		vol = -2.5
		pitch = 0
	}
	Keys_Clean_JM = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Keys_Line61_JM = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Keys_Line62_JM = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	UI_InGame = {
		Priority = 1
		vol = 0
		pitch = 0
	}
}
House_BussSet = {
	DrumKick_Stream = {
		Priority = 1
		vol = -9
		pitch = 0
	}
	DrumSnare_Stream = {
		Priority = 1
		vol = -9
		pitch = 0
	}
	DrumTom_Stream = {
		Priority = 1
		vol = -8
		pitch = 0
	}
	DrumCymbal_Stream = {
		Priority = 1
		vol = -8
		pitch = 0
	}
	guitar_stream = {
		Priority = 1
		vol = -10
		pitch = 0
	}
	Bass_Stream = {
		Priority = 1
		vol = -5
		pitch = 0
	}
	Vocals_Stream = {
		Priority = 1
		vol = -9
		pitch = 0
	}
	Band_Stream = {
		Priority = 1
		vol = -8
		pitch = 0
	}
}
House_Crowd_BussSet = {
	Crowd = {
		Priority = 1
		vol = -5
		pitch = 0
	}
}
House_3db_BussSet = {
	DrumKick_Stream = {
		Priority = 1
		vol = -6
		pitch = 0
	}
	DrumSnare_Stream = {
		Priority = 1
		vol = -6
		pitch = 0
	}
	DrumTom_Stream = {
		Priority = 1
		vol = -6
		pitch = 0
	}
	DrumCymbal_Stream = {
		Priority = 1
		vol = -6
		pitch = 0
	}
	guitar_stream = {
		Priority = 1
		vol = -5
		pitch = 0
	}
	Bass_Stream = {
		Priority = 1
		vol = -6
		pitch = 0
	}
	Vocals_Stream = {
		Priority = 1
		vol = -6
		pitch = 0
	}
	Band_Stream = {
		Priority = 1
		vol = -8
		pitch = 0
	}
	CrowdSingalong_Stream = {
		Priority = 1
		vol = -100
		pitch = 0
	}
}
Stage_Crowd_BussSet = {
	Crowd = {
		Priority = 1
		vol = -12
		pitch = 0
	}
}
PreStage_Crowd_BussSet = {
	Crowd = {
		Priority = 1
		vol = -12
		pitch = 0
	}
}
Stage_BussSet = {
	DrumKick_Stream = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	DrumSnare_Stream = {
		Priority = 1
		vol = -6
		pitch = 0
	}
	DrumTom_Stream = {
		Priority = 1
		vol = -3
		pitch = 0
	}
	DrumCymbal_Stream = {
		Priority = 1
		vol = -8
		pitch = 0
	}
	guitar_stream = {
		Priority = 1
		vol = -8
		pitch = 0
	}
	Bass_Stream = {
		Priority = 1
		vol = -6
		pitch = 0
	}
	Vocals_Stream = {
		Priority = 1
		vol = -3
		pitch = 0
	}
	Band_Stream = {
		Priority = 1
		vol = -8
		pitch = 0
	}
	Crowd = {
		Priority = 1
		vol = -9
		pitch = 0
	}
	Pyro = {
		Priority = 1
		vol = -100
		pitch = 0
	}
}
Game_BussSet = {
	DrumKick_Stream = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	DrumSnare_Stream = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	DrumTom_Stream = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	DrumCymbal_Stream = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	guitar_stream = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Bass_Stream = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Vocals_Stream = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Band_Stream = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Crowd = {
		Priority = 1
		vol = -7
		pitch = 0
	}
	Pyro = {
		Priority = 1
		vol = -5
		pitch = 0
	}
}
Join_BussSet = {
	DrumKick_Stream = {
		Priority = 1
		vol = -3
		pitch = 0
	}
	DrumSnare_Stream = {
		Priority = 1
		vol = -3
		pitch = 0
	}
	DrumTom_Stream = {
		Priority = 1
		vol = -3
		pitch = 0
	}
	DrumCymbal_Stream = {
		Priority = 1
		vol = -3
		pitch = 0
	}
	guitar_stream = {
		Priority = 1
		vol = -3
		pitch = 0
	}
	Bass_Stream = {
		Priority = 1
		vol = -3
		pitch = 0
	}
	Vocals_Stream = {
		Priority = 1
		vol = -3
		pitch = 0
	}
	Band_Stream = {
		Priority = 1
		vol = -3
		pitch = 0
	}
	Crowd = {
		Priority = 1
		vol = -4.5
		pitch = 0
	}
	Pyro = {
		Priority = 1
		vol = -10
		pitch = 0
	}
}
Pause_BussSet = {
	DrumKick_Stream = {
		Priority = 1
		vol = -3
		pitch = 0
	}
	DrumSnare_Stream = {
		Priority = 1
		vol = -3
		pitch = 0
	}
	DrumTom_Stream = {
		Priority = 1
		vol = -3
		pitch = 0
	}
	DrumCymbal_Stream = {
		Priority = 1
		vol = -3
		pitch = 0
	}
	guitar_stream = {
		Priority = 1
		vol = -3
		pitch = 0
	}
	Bass_Stream = {
		Priority = 1
		vol = -3
		pitch = 0
	}
	Vocals_Stream = {
		Priority = 1
		vol = -3
		pitch = 0
	}
	Band_Stream = {
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
Music_Stream_Quiet_BussSet = {
	DrumKick_Stream = {
		Priority = 1
		vol = -100
		pitch = 0
	}
	DrumSnare_Stream = {
		Priority = 1
		vol = -100
		pitch = 0
	}
	DrumTom_Stream = {
		Priority = 1
		vol = -100
		pitch = 0
	}
	DrumCymbal_Stream = {
		Priority = 1
		vol = -100
		pitch = 0
	}
	guitar_stream = {
		Priority = 1
		vol = -100
		pitch = 0
	}
	Bass_Stream = {
		Priority = 1
		vol = -100
		pitch = 0
	}
	Vocals_Stream = {
		Priority = 1
		vol = -100
		pitch = 0
	}
	Band_Stream = {
		Priority = 1
		vol = -100
		pitch = 0
	}
	CrowdSingalong_Stream = {
		Priority = 1
		vol = -100
		pitch = 0
	}
}
Start_Of_Game_Crowds_Silence_BussSet = {
	Crowd = {
		Priority = 1
		vol = -100
		pitch = 0
	}
}
