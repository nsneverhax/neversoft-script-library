BussTree = {
	Master = {
		User_SFX = {
			UI = {
				LeafNodes = [
					Front_End
					Pause_Menu
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
				DEFAULT
				Test_Tones
				Encore_Events
				BinkCutScenes
				Practice_Band_Playback
				Training_VO
			]
		}
		User_Band = {
			Band_Balance = {
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
}
Default_BussSet = {
	Master = {
		Priority = 5
		vol = -2.5
		Pitch = 0
		instance_rule = ignore
		max_instances = 64
	}
	DEFAULT = {
		Priority = 5
		vol = -4
		Pitch = 0
	}
	Test_Tones = {
		Priority = 5
		vol = 0
		Pitch = 0
	}
	User_SFX = {
		Priority = 1
		vol = 0
		Pitch = 0
		instance_rule = ignore
		max_instances = 500
	}
	UI = {
		Priority = 1
		vol = 0
		Pitch = 0
	}
	User_Band = {
		Priority = 1
		vol = 0
		Pitch = 0
	}
	Band_Balance = {
		Priority = 1
		vol = 0
		Pitch = 0
	}
	User_Guitar = {
		Priority = 1
		vol = 0
		Pitch = 0
	}
	Guitar_Balance = {
		Priority = 1
		vol = 0
		Pitch = 0
	}
	Guitar_Balance_First_Player = {
		Priority = 1
		vol = 0
		Pitch = 0
	}
	Guitar_Balance_Second_Player = {
		Priority = 1
		vol = 0
		Pitch = 0
	}
	Right_Notes_Player1 = {
		Priority = 1
		vol = -4
		Pitch = 0
	}
	First_Player_Lead_Playback = {
		Priority = 1
		vol = 0
		Pitch = 0
	}
	Second_Player_Lead_Playback = {
		Priority = 1
		vol = 0
		Pitch = 0
	}
	Second_Player_Rhythm_Playback = {
		Priority = 1
		vol = 0
		Pitch = 0
	}
	Single_Player_Rhythm_Playback = {
		Priority = 1
		vol = 0
		Pitch = 0
	}
	Wrong_Notes_Player1 = {
		Priority = 1
		vol = -3.5
		Pitch = 0
	}
	Right_Notes_Player2 = {
		Priority = 1
		vol = -4
		Pitch = 0
	}
	Wrong_Notes_Player2 = {
		Priority = 1
		vol = -3.5
		Pitch = 0
	}
	Band_Playback = {
		Priority = 1
		vol = 0
		Pitch = 0
	}
	Countoffs = {
		Priority = 1
		vol = -7
		Pitch = 0
	}
	Practice_Band_Playback = {
		Priority = 1
		vol = -3.0
		Pitch = 0
	}
	Front_End = {
		Priority = 1
		vol = -6
		Pitch = 0
	}
	Pause_Menu = {
		Priority = 1
		vol = 0
		Pitch = 0
	}
	UI_Star_Power = {
		Priority = 1
		vol = -6
		Pitch = 0
	}
	UI_Battle_Mode = {
		Priority = 1
		vol = 0
		Pitch = 0
	}
	Crowd = {
		Priority = 1
		vol = -1
		Pitch = 0
	}
	Crowd_Beds = {
		Priority = 1
		vol = -7
		Pitch = 0
	}
	Crowd_Cheers = {
		Priority = 1
		vol = -6
		Pitch = 0
	}
	Crowd_Boos = {
		Priority = 1
		vol = -6
		Pitch = 0
	}
	Crowd_Nuetral = {
		Priority = 1
		vol = -6
		Pitch = 0
	}
	Crowd_Star_Power = {
		Priority = 1
		vol = 0
		Pitch = 0
	}
	Crowd_PreEncore_Building = {
		Priority = 1
		vol = 0
		Pitch = 0
	}
	Crowd_PreSong_Intro = {
		Priority = 1
		vol = -6
		Pitch = 0
	}
	Crowd_Applause = {
		Priority = 1
		vol = 0
		Pitch = 0
	}
	Crowd_Transitions = {
		Priority = 1
		vol = -8
		Pitch = 0
	}
	Crowd_Singalong = {
		Priority = 1
		vol = -100
		Pitch = 0
	}
	Crowd_W_Reverb = {
		Priority = 1
		vol = 0
		Pitch = 0
	}
	Crowd_One_Shots = {
		Priority = 1
		vol = -7.58
		Pitch = 0
	}
	Music_FrontEnd = {
		Priority = 1
		vol = -11
		Pitch = 0
	}
	Music_Setlist = {
		Priority = 1
		vol = -2
		Pitch = 0
	}
	Test_Tones_DSP = {
		Priority = 1
		vol = 0
		Pitch = 0
	}
	Encore_Events = {
		Priority = 1
		vol = 0
		Pitch = 0
	}
	BinkCutScenes = {
		Priority = 1
		vol = 0
		Pitch = 0
	}
	Training_VO = {
		Priority = 1
		vol = 0
		Pitch = 0
	}
}
Star_Power_BussSet = {
	Right_Notes_Player1 = {
		Priority = 1
		vol = -2.0
		Pitch = 0
	}
	Right_Notes_Player2 = {
		Priority = 1
		vol = -2.0
		Pitch = 0
	}
}
BattleMode_Thin_BussSet = {
	Right_Notes_Player1 = {
		Priority = 1
		vol = 0
		Pitch = 0
	}
	First_Player_Lead_Playback = {
		Priority = 1
		vol = 0
		Pitch = 0
	}
	Second_Player_Lead_Playback = {
		Priority = 1
		vol = 0
		Pitch = 0
	}
	Second_Player_Rhythm_Playback = {
		Priority = 1
		vol = 0
		Pitch = 0
	}
	Single_Player_Rhythm_Playback = {
		Priority = 1
		vol = 0
		Pitch = 0
	}
}
AutoWah_BussSet = {
	Right_Notes_Player1 = {
		Priority = 1
		vol = -10
		Pitch = 0
	}
}
CrowdSurgeBig_BussSet = {
	Crowd_Beds = {
		Priority = 1
		vol = 3.0
		Pitch = 0
	}
}
CrowdSurgeSmall_BussSet = {
	Crowd_Beds = {
		Priority = 1
		vol = 1.0
		Pitch = 0
	}
}
CrowdNormal_BussSet = {
	Crowd_Beds = {
		Priority = 1
		vol = -6
		Pitch = 0
	}
}
CrowdSingingVolUp_BussSet = {
	Crowd_Singalong = {
		Priority = 1
		vol = -8
		Pitch = 0
	}
}
CrowdSingingVolDown_BussSet = {
	Crowd_Singalong = {
		Priority = 1
		vol = -100
		Pitch = 0
	}
}
Failed_Song_Pitching_Down_BussSet = {
	Band_Balance = {
		Priority = 1
		vol = -10
		Pitch = -8
	}
	Guitar_Balance = {
		Priority = 1
		vol = -10
		Pitch = -8
	}
}
