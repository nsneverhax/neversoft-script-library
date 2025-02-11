BussTree = {
	Master = {
		User_SFX = {
			UI = {
				LeafNodes = [
					Front_End
					pause_menu
					UI_Star_Power
					UI_Battle_Mode
					Wrong_Notes_Player1
					Wrong_Notes_Player2
				]
			}
			Crowd = {
				Crowd_W_Reverb = {
					LeafNodes = [
						Crowd_Singalong
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
				Default
				Test_Tones
				Encore_Events
				binkcutscenes
				Practice_Band_Playback
				Training_VO
			]
		}
		User_Band = {
			band_Balance = {
				LeafNodes = [
					Band_Playback
					Single_Player_Rhythm_Playback
					Music_FrontEnd
					Music_Setlist
					Countoffs
				]
			}
		}
		User_Guitar = {
			Guitar_Balance = {
				Guitar_Balance_First_Player = {
					LeafNodes = [
						First_Player_Lead_Playback
					]
				}
				Guitar_Balance_Second_Player = {
					LeafNodes = [
						Second_Player_Lead_Playback
						Second_Player_Rhythm_Playback
					]
				}
			}
			LeafNodes = [
				Test_Tones_DSP
				Right_Notes_Player1
				Right_Notes_Player2
			]
		}
	}
	User_Coin = {
		LeafNodes = [
			Coin
		]
	}
	User_Sine = {
		LeafNodes = [
			Sine
		]
	}
}
default_BussSet = {
	Master = {
		Priority = 5
		vol = 0
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
	User_Coin = {
		Priority = 1
		vol = -9
		pitch = 0
	}
	Coin = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	User_Sine = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Sine = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	User_SFX = {
		Priority = 1
		vol = 0
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
		vol = 0
		pitch = 0
	}
	band_Balance = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	User_Guitar = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Guitar_Balance = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Guitar_Balance_First_Player = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Guitar_Balance_Second_Player = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Right_Notes_Player1 = {
		Priority = 1
		vol = -4
		pitch = 0
	}
	First_Player_Lead_Playback = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Second_Player_Lead_Playback = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Second_Player_Rhythm_Playback = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Single_Player_Rhythm_Playback = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Wrong_Notes_Player1 = {
		Priority = 1
		vol = -3.5
		pitch = 0
	}
	Right_Notes_Player2 = {
		Priority = 1
		vol = -4
		pitch = 0
	}
	Wrong_Notes_Player2 = {
		Priority = 1
		vol = -3.5
		pitch = 0
	}
	Band_Playback = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Countoffs = {
		Priority = 1
		vol = -7
		pitch = 0
	}
	Practice_Band_Playback = {
		Priority = 1
		vol = -3.0
		pitch = 0
	}
	Front_End = {
		Priority = 1
		vol = -6
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
	}
	UI_Battle_Mode = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Crowd = {
		Priority = 1
		vol = -1
		pitch = 0
	}
	Crowd_Beds = {
		Priority = 1
		vol = -7
		pitch = 0
	}
	Crowd_Cheers = {
		Priority = 1
		vol = -6
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
	}
	Crowd_Singalong = {
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
		vol = -7.58
		pitch = 0
	}
	Music_FrontEnd = {
		Priority = 1
		vol = -11
		pitch = 0
	}
	Music_Setlist = {
		Priority = 1
		vol = -2
		pitch = 0
	}
	Test_Tones_DSP = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Encore_Events = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	binkcutscenes = {
		Priority = 1
		vol = -5
		pitch = 0
	}
	Training_VO = {
		Priority = 1
		vol = 0
		pitch = 0
	}
}
Star_Power_BussSet = {
	Right_Notes_Player1 = {
		Priority = 1
		vol = -2.0
		pitch = 0
	}
	Right_Notes_Player2 = {
		Priority = 1
		vol = -2.0
		pitch = 0
	}
}
BattleMode_Thin_BussSet = {
	Right_Notes_Player1 = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	First_Player_Lead_Playback = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Second_Player_Lead_Playback = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Second_Player_Rhythm_Playback = {
		Priority = 1
		vol = 0
		pitch = 0
	}
	Single_Player_Rhythm_Playback = {
		Priority = 1
		vol = 0
		pitch = 0
	}
}
AutoWah_BussSet = {
	Right_Notes_Player1 = {
		Priority = 1
		vol = -10
		pitch = 0
	}
}
CrowdSurgeBig_BussSet = {
	Crowd_Beds = {
		Priority = 1
		vol = 3.0
		pitch = 0
	}
}
CrowdSurgeSmall_BussSet = {
	Crowd_Beds = {
		Priority = 1
		vol = 1.0
		pitch = 0
	}
}
CrowdNormal_BussSet = {
	Crowd_Beds = {
		Priority = 1
		vol = -6
		pitch = 0
	}
}
CrowdSingingVolUp_BussSet = {
	Crowd_Singalong = {
		Priority = 1
		vol = -8
		pitch = 0
	}
}
CrowdSingingVolDown_BussSet = {
	Crowd_Singalong = {
		Priority = 1
		vol = -100
		pitch = 0
	}
}
Failed_Song_Pitching_Down_BussSet = {
	band_Balance = {
		Priority = 1
		vol = -10
		pitch = -8
	}
	Guitar_Balance = {
		Priority = 1
		vol = -10
		pitch = -8
	}
}

script output_current_sound_info 
	printf \{"output_current_sound_info: Status"}
	printf \{"================================="}
	GetSoundBussParams \{Master = {
			vol
		}}
	printf "master: %d" d = <vol>
	GetSoundBussParams \{Guitar_Balance = {
			vol
		}}
	printf "guitar: %e" e = <vol>
	GetSoundBussParams \{Guitar_Balance_First_Player = {
			vol
		}}
	printf "1P guitar: %e" e = <vol>
	GetSoundBussParams \{Guitar_Balance_Second_Player = {
			vol
		}}
	printf "2P guitar: %e" e = <vol>
	GetSoundBussParams \{band_Balance = {
			vol
		}}
	printf "band: %f" f = <vol>
	GetSoundBussParams \{User_SFX = {
			vol
		}}
	printf "sfx: %g" g = <vol>
endscript

script reset_sound_for_mode \{master_vol = -9.0
		guitar_bal_vol = -1.0
		band_bal_vol = -1.0}
	printf "reset_sound_for_mode: setting master=%d, guitar=%e, band=%f" d = <master_vol> e = <guitar_bal_vol> f = <guitar_bal_vol>
	SoundBussUnlock \{Master}
	setsoundbussparams {Master = {vol = <master_vol>}} time = 0.5
	SoundBussLock \{Master}
	setsoundbussparams {Guitar_Balance = {vol = <guitar_bal_vol>}} time = 0
	setsoundbussparams {band_Balance = {vol = <band_bal_vol>}} time = 0
	SoundBussLock \{Guitar_Balance}
	SoundBussLock \{band_Balance}
endscript
