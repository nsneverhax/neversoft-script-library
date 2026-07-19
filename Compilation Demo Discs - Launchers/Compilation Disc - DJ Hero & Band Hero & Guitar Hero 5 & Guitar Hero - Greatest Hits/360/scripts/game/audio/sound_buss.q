BussTree = {
	Master = {
		User_LeadVox = {
			LeadVox_Balance = {
				LeafNodes = [
					Lead_Vox
					JamMode_Vox
					Options_Vox
				]
			}
		}
		User_Drums = {
			Drums_Balance = {
				Drums_Total = {
					LeafNodes = [
						Drums_Kick
						Drums_Snare
						Drums_Tom
						Drums_Cymbal
					]
				}
				LeafNodes = [
					Options_Drums
				]
			}
			Drums_InGame = {
				Drums_InGame_Cymbals = {
					LeafNodes = [
						Drums_InGame_Cymbals_Crash
						Drums_InGame_Cymbals_Hats
					]
				}
				LeafNodes = [
					InGame_Drums
					Drums_InGame_Hats
					Drums_InGame_Toms
					Drums_InGame_Kick
					Drums_InGame_Snare
				]
			}
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
			LeafNodes = [
				PracticeMode_Drums
			]
		}
		User_LeadGTR = {
			leadGTR_balance = {
				Guitar_JamMode = {
					LeafNodes = [
						JamMode_LeadGuitar
						JamMode_RhythmGuitar
					]
				}
				LeafNodes = [
					User_LeadGTR_Dummy
					Options_Guitar
				]
			}
		}
		User_Bass = {
			bass_balance = {
				LeafNodes = [
					User_Bass_Dummy
					Options_Bass
				]
			}
			Bass_JamMode = {
				LeafNodes = [
					JamMode_Bass
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
					User_Crowd_Dummy
					Options_Crowd
				]
			}
		}
		User_Sfx = {
			SFX_Balance = {
				ui = {
					LeafNodes = [
						front_end
						Pause_Menu
						UI_Star_Power
						UI_Battle_Mode
						Wrong_Notes_Bass
						Wrong_Notes_Drums
						Wrong_Notes_Guitar
					]
				}
				LeafNodes = [
					`default`
					Test_Tones
					Encore_Events
					Encore_Loops
					Practice_Band_Playback
					Training_VO
				]
			}
		}
		User_Band = {
			Band_Balance = {
				LeafNodes = [
					Band_Playback
					Single_Player_Rhythm_Playback
					Countoffs
				]
			}
		}
		User_CrowdSingalong = {
			CrowdSingalong_Balance = {
				LeafNodes = [
					Crowd_Singalong
				]
			}
		}
		User_Misc = {
			Misc_Balance = {
				LeafNodes = [
					Music_FrontEnd
					Music_Setlist
					binkcutscenes
				]
			}
		}
	}
}
Default_BussSet = {
	Master = {
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
	Test_Tones = {
		priority = 5
		vol = 0
		pitch = 0
	}
	User_Sfx = {
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
	User_Band = {
		priority = 1
		vol = -3.5
		pitch = 0
	}
	Band_Balance = {
		priority = 1
		vol = 0
		pitch = 0
	}
	Guitar_JamMode = {
		priority = 1
		vol = 0
		pitch = 0
	}
	JamMode_LeadGuitar = {
		priority = 1
		vol = 1
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 2
	}
	Bass_JamMode = {
		priority = 1
		vol = 0
		pitch = 0
	}
	JamMode_Bass = {
		priority = 1
		vol = -2
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 3
	}
	JamMode_RhythmGuitar = {
		priority = 1
		vol = -12
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 2
	}
	Wrong_Notes_Guitar = {
		priority = 1
		vol = -5
		pitch = 0
		instance_rule = oldest
		max_instances = 2
	}
	Wrong_Notes_Bass = {
		priority = 1
		vol = -5
		pitch = 0
		instance_rule = oldest
		max_instances = 2
	}
	Band_Playback = {
		priority = 1
		vol = 0
		pitch = 0
	}
	Countoffs = {
		priority = 1
		vol = -7
		pitch = 0
	}
	Practice_Band_Playback = {
		priority = 1
		vol = -3
		pitch = 0
	}
	front_end = {
		priority = 1
		vol = -6
		pitch = 0
	}
	Pause_Menu = {
		priority = 1
		vol = 0
		pitch = 0
	}
	UI_Star_Power = {
		priority = 1
		vol = -6
		pitch = 0
	}
	UI_Battle_Mode = {
		priority = 1
		vol = 0
		pitch = 0
	}
	Crowd = {
		priority = 1
		vol = -7
		pitch = 0
	}
	Crowd_Beds = {
		priority = 1
		vol = -7
		pitch = 0
	}
	Crowd_Cheers = {
		priority = 1
		vol = -6
		pitch = 0
	}
	Crowd_Boos = {
		priority = 1
		vol = -6
		pitch = 0
	}
	Crowd_Nuetral = {
		priority = 1
		vol = -6
		pitch = 0
	}
	Crowd_Star_Power = {
		priority = 1
		vol = 1
		pitch = 0
	}
	Crowd_PreEncore_Building = {
		priority = 1
		vol = 0
		pitch = 0
	}
	Crowd_PreSong_Intro = {
		priority = 1
		vol = -6
		pitch = 0
	}
	Crowd_Applause = {
		priority = 1
		vol = 0
		pitch = 0
	}
	Crowd_Transitions = {
		priority = 1
		vol = -8
		pitch = 0
		instance_rule = ignore
		max_instances = 10
	}
	Crowd_Singalong = {
		priority = 1
		vol = -100
		pitch = 0
	}
	Crowd_W_Reverb = {
		priority = 1
		vol = 0
		pitch = 0
	}
	Crowd_One_Shots = {
		priority = 1
		vol = -7
		pitch = 0
		instance_rule = oldest
		max_instances = 20
	}
	Music_FrontEnd = {
		priority = 1
		vol = -16
		pitch = 0
	}
	Music_Setlist = {
		priority = 1
		vol = 0
		pitch = 0
	}
	Encore_Events = {
		priority = 1
		vol = 0
		pitch = 0
	}
	Encore_Loops = {
		priority = 1
		vol = 0
		pitch = 0
	}
	binkcutscenes = {
		priority = 1
		vol = 0
		pitch = 0
	}
	Training_VO = {
		priority = 1
		vol = 0
		pitch = 0
	}
	User_LeadVox = {
		priority = 1
		vol = -3.5
		pitch = 0
	}
	Lead_Vox = {
		priority = 1
		vol = 0
		pitch = 0
	}
	JamMode_Vox = {
		priority = 1
		vol = 0
		pitch = 0
		instance_rule = oldest
		max_instances = 2
	}
	User_Drums = {
		priority = 1
		vol = -3.5
		pitch = 0
	}
	Drums_JamMode = {
		priority = 1
		vol = 0
		pitch = 0
	}
	JamMode_Drums = {
		priority = 1
		vol = -5
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 5
	}
	JamMode_Drums_Cymbals = {
		priority = 1
		vol = 0
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 3
	}
	JamMode_Drums_Cymbals_Crash = {
		priority = 2
		vol = 0
		pitch = 0
		instance_rule = oldest
		max_instances = 2
	}
	JamMode_Drums_Cymbals_Hats = {
		priority = 1
		vol = 0
		pitch = 0
	}
	JamMode_Drums_Hats = {
		priority = 1
		vol = 0
		pitch = 0
	}
	JamMode_Drums_Toms = {
		priority = 1
		vol = 0
		pitch = 0
	}
	JamMode_Drums_Kick = {
		priority = 1
		vol = 0
		pitch = 0
	}
	JamMode_Drums_Snare = {
		priority = 1
		vol = 0
		pitch = 0
	}
	PracticeMode_Drums = {
		priority = 1
		vol = -13
		pitch = 0
		instance_rule = oldest
		max_instances = 8
	}
	Drums_Total = {
		priority = 1
		vol = 0
		pitch = 0
	}
	Drums_Kick = {
		priority = 1
		vol = 0
		pitch = 0
	}
	Drums_Snare = {
		priority = 1
		vol = 0
		pitch = 0
	}
	Drums_Tom = {
		priority = 1
		vol = 0
		pitch = 0
	}
	Drums_Cymbal = {
		priority = 1
		vol = 0
		pitch = 0
	}
	User_LeadGTR = {
		priority = 1
		vol = -3.5
		pitch = 0
	}
	User_LeadGTR_Dummy = {
		priority = 1
		vol = 0
		pitch = 0
	}
	User_Bass = {
		priority = 1
		vol = -3.5
		pitch = 0
	}
	User_Bass_Dummy = {
		priority = 1
		vol = 0
		pitch = 0
	}
	User_RhythmGTR = {
		priority = 1
		vol = -3.5
		pitch = 0
	}
	User_Crowd = {
		priority = 1
		vol = -3.5
		pitch = 0
	}
	User_Crowd_Dummy = {
		priority = 1
		vol = 0
		pitch = 0
	}
	LeadVox_Balance = {
		priority = 1
		vol = 0
		pitch = 0
	}
	Drums_Balance = {
		priority = 1
		vol = 0
		pitch = 0
	}
	Wrong_Notes_Drums = {
		priority = 5
		vol = -4
		pitch = 0
		instance_rule = oldest
		max_instances = 4
	}
	Drums_InGame = {
		priority = 1
		vol = -7
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 8
	}
	Drums_InGame_Kick = {
		priority = 1
		vol = 0
		pitch = 0
	}
	Drums_InGame_Snare = {
		priority = 1
		vol = 0
		pitch = 0
	}
	Drums_InGame_Toms = {
		priority = 1
		vol = 0
		pitch = 0
	}
	Drums_InGame_Hats = {
		priority = 1
		vol = 0
		pitch = 0
	}
	Drums_InGame_Cymbals = {
		priority = 1
		vol = 0
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 4
	}
	Drums_InGame_Cymbals_Crash = {
		priority = 2
		vol = 0
		pitch = 0
		instance_rule = oldest
		max_instances = 2
	}
	Drums_InGame_Cymbals_Hats = {
		priority = 1
		vol = 0
		pitch = 0
	}
	InGame_Drums = {
		priority = 1
		vol = 0
		pitch = 0
		instance_rule = oldest_with_priority
		max_instances = 8
	}
	leadGTR_balance = {
		priority = 1
		vol = 0
		pitch = 0
	}
	bass_balance = {
		priority = 1
		vol = 0
		pitch = 0
	}
	RhythmGTR_Balance = {
		priority = 1
		vol = 0
		pitch = 0
	}
	User_RhythmGTR_Dummy = {
		priority = 1
		vol = 0
		pitch = 0
	}
	Crowd_Balance = {
		priority = 1
		vol = -1.0
		pitch = 0
	}
	SFX_Balance = {
		priority = 1
		vol = 0
		pitch = 0
	}
	Options_Vox = {
		priority = 1
		vol = 0
		pitch = 0
	}
	Options_Drums = {
		priority = 1
		vol = 0
		pitch = 0
	}
	Options_Guitar = {
		priority = 1
		vol = 0
		pitch = 0
	}
	Options_Bass = {
		priority = 1
		vol = 0
		pitch = 0
	}
	Options_Crowd = {
		priority = 1
		vol = 0
		pitch = 0
	}
	User_Misc = {
		priority = 1
		vol = -3.5
		pitch = 0
	}
	Misc_Balance = {
		priority = 1
		vol = 0
		pitch = 0
	}
	User_CrowdSingalong = {
		priority = 1
		vol = -3.5
		pitch = 0
	}
	CrowdSingalong_Balance = {
		priority = 1
		vol = 0
		pitch = 0
	}
}
