Keyboard_SFX_GUI_Buzzer_struct = {
	default_priority = 65
	default_buss = frontend
	norepeatfor = 0.15
	instancemanagement = ignore
	instancelimit = 3
}
Keyboard_SFX_GUI_Buzzer_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			small_negative_message_01
			vol = 165
		}
	}
}
Keyboard_SFX_MenuUp_struct = {
	default_priority = 65
	default_buss = frontend
	norepeatfor = 0.15
	instancemanagement = ignore
	instancelimit = 3
}
Keyboard_SFX_MenuUp_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			menu03
			vol = 60
			pitch = 55
		}
	}
}
Keyboard_SFX_Backspace_struct = {
	default_priority = 65
	default_buss = frontend
	norepeatfor = 0.15
	instancemanagement = ignore
	instancelimit = 3
}
Keyboard_SFX_Backspace_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			MenuUp
			vol = 65
		}
	}
}
Keyboard_SFX_ChangeKey_struct = {
	default_priority = 65
	default_buss = frontend
	norepeatfor = 0.0
	instancemanagement = stop_oldest
	instancelimit = 3
}
Keyboard_SFX_ChangeKey_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			menu03
			vol = 55
		}
	}
}
GoalUtils_SFX_FailGoal_struct = {
	default_priority = 95
	default_buss = frontend
	norepeatfor = 0.3
	instancemanagement = ignore
	instancelimit = 4
}
GoalUtils_SFX_FailGoal_container = {
	command = playsound
	randomness = none
}
ChalkChallenge_FailGoal_struct = {
	default_priority = 95
	default_buss = frontend
	norepeatfor = 0.3
	instancemanagement = ignore
	instancelimit = 4
}
ChalkChallenge_FailGoal_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_GoalFail
			vol = 175
		}
	}
}
GoalUtils_SFX_GotFlag_struct = {
	default_priority = 95
	default_buss = frontend
	norepeatfor = 0.3
	instancelimit = 4
	instancemanagement = ignore
}
GoalUtils_SFX_GotFlag_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			GoalMidGood
			vol = 85
		}
	}
}
GridControl_SFX_Add_Block_struct = {
	default_priority = 95
	default_buss = MissionSFX
	norepeatfor = 0.0
	instancemanagement = ignore
	instancelimit = 4
}
GridControl_SFX_Add_Block_container = {
	command = playsound
	randomness = none
}
GridControl_SFX_Remove_Block_struct = {
	default_priority = 95
	default_buss = MissionSFX
	norepeatfor = 0.0
	instancemanagement = ignore
	instancelimit = 4
}
GridControl_SFX_Remove_Block_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			SK8_Generic_Select_01
			vol = 60
		}
	}
}
GridControl_SFX_Move_Cursor_struct = {
	default_priority = 95
	default_buss = MissionSFX
	norepeatfor = 0.0
	instancemanagement = ignore
	instancelimit = 4
}
GridControl_SFX_Move_Cursor_container = {
	command = playsound
	randomness = none
}
GridControl_SFX_Block_SnapTo_struct = {
	default_priority = 95
	default_buss = MissionSFX
	norepeatfor = 0.0
	instancemanagement = ignore
	instancelimit = 4
}
GridControl_SFX_Block_SnapTo_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk8_bonk_wood_01
			vol = 50
		}
	}
}
Impress_Locals_Stoken_Sound_struct = {
	default_priority = 55
	default_buss = frontend
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 3
}
Impress_Locals_Stoken_Sound_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			Collect_Stoken
			randompitch = {
				type = randomrangetype
				vals = [
					99
					101
				]
			}
		}
	}
}
Collect_Goal_Collect_Sound_struct = {
	default_priority = 95
	default_buss = GoalFeedback
	norepeatfor = 0.5
	instancemanagement = stop_oldest
	instancelimit = 4
}
Collect_Goal_Collect_Sound_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			SKATE_COLLECT
		}
	}
}
Generic_menu_Buzzer_SFX_struct = {
	default_priority = 55
	default_buss = frontend
	norepeatfor = 0.3
	instancemanagement = stop_oldest
	instancelimit = 4
}
Generic_menu_Buzzer_SFX_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			GUI_Buzzer01
		}
	}
}
Generic_menu_pad_back_SFX_struct = {
	default_priority = 55
	default_buss = frontend
	norepeatfor = 0.02
	instancemanagement = stop_oldest
	instancelimit = 4
}
Generic_menu_pad_back_SFX_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			SK8_Generic_Back_01
			vol = 90
		}
	}
}
Generic_menu_pad_choose_SFX_struct = {
	default_priority = 55
	default_buss = frontend
	norepeatfor = 0.05
	instancemanagement = stop_oldest
	instancelimit = 4
}
Generic_menu_pad_choose_SFX_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			SK8_Generic_Select_01
			vol = 90
		}
	}
}
Generic_menu_pad_up_SFX_struct = {
	default_priority = 55
	default_buss = frontend
	norepeatfor = 0.05
	instancemanagement = stop_oldest
	instancelimit = 3
}
Generic_menu_pad_up_SFX_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_menu_scroll_right
			randompitch = {
				type = randomrangetype
				vals = [
					90
					110
				]
			}
			vol = 120
		}
	}
}
Generic_menu_pad_down_SFX_struct = {
	default_priority = 55
	default_buss = frontend
	norepeatfor = 0.05
	instancemanagement = stop_oldest
	instancelimit = 3
}
Generic_menu_pad_down_SFX_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_menu_scroll_left
			randompitch = {
				type = randomrangetype
				vals = [
					95
					105
				]
			}
			vol = 120
		}
	}
}
Generic_menu_pad_sideways_SFX_struct = {
	default_priority = 55
	default_buss = frontend
	norepeatfor = 0.3
	instancelimit = 4
	instancemanagement = stop_oldest
}
Generic_menu_pad_sideways_SFX_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			MenuUp
		}
	}
}
Generic_menu_exit_SFX_struct = {
	default_priority = 55
	default_buss = frontend
	norepeatfor = 0.1
	instancelimit = 2
	instancemanagement = stop_oldest
}
Generic_menu_exit_SFX_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			SK8_Generic_Back_01
			vol = 30
		}
	}
}
CAS_menu_pad_up_SFX_struct = {
	default_priority = 56
	default_buss = frontend
	norepeatfor = 0
	instancemanagement = stop_oldest
	instancelimit = 6
}
CAS_menu_pad_up_SFX_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_menu_scroll_right
			randompitch = {
				type = randomrangetype
				vals = [
					90
					110
				]
			}
			vol = 110
		}
	}
}
CAS_menu_pad_down_SFX_struct = {
	default_priority = 56
	default_buss = frontend
	norepeatfor = 0
	instancemanagement = stop_oldest
	instancelimit = 6
}
CAS_menu_pad_down_SFX_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_menu_scroll_left
			randompitch = {
				type = randomrangetype
				vals = [
					95
					105
				]
			}
			vol = 110
		}
	}
}
View_Gaps_Scroll_LEFT_SFX_struct = {
	default_priority = 56
	default_buss = frontend
	norepeatfor = 0
	instancemanagement = stop_oldest
	instancelimit = 6
}
View_Gaps_Scroll_LEFT_SFX_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_menu_scroll_left
			randompitch = {
				type = randomrangetype
				vals = [
					65
					70
				]
			}
			vol = 110
		}
	}
}
View_Gaps_Scroll_RIGHT_SFX_struct = {
	default_priority = 56
	default_buss = frontend
	norepeatfor = 0.0
	instancemanagement = stop_oldest
	instancelimit = 6
}
View_Gaps_Scroll_RIGHT_SFX_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_menu_scroll_right
			randompitch = {
				type = randomrangetype
				vals = [
					65
					70
				]
			}
			vol = 110
		}
	}
}
stat_focusing_sfx_struct = {
	default_priority = 55
	default_buss = frontend
	norepeatfor = 0.3
	instancemanagement = stop_oldest
	instancelimit = 4
}
stat_focusing_sfx_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			MenuUp
		}
	}
}
high_score_change_level_sfx_struct = {
	default_priority = 55
	default_buss = frontend
	norepeatfor = 0.3
	instancemanagement = stop_oldest
	instancelimit = 4
}
high_score_change_level_sfx_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			MenuUp
		}
	}
}
toggle_special_sounds_sfx_struct = {
	default_priority = 55
	default_buss = frontend
	norepeatfor = 0.3
	instancemanagement = stop_oldest
	instancelimit = 4
}
toggle_special_sounds_sfx_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			HUD_specialtrickAA
		}
	}
}
toggle_playlist_genre_sfx_struct = {
	default_priority = 55
	default_buss = frontend
	norepeatfor = 0.3
	instancemanagement = stop_oldest
	instancelimit = 4
}
toggle_playlist_genre_sfx_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			SK8_Generic_Select_01
			vol = 30
		}
	}
}
menu_cheat_bad_sfx_struct = {
	default_priority = 55
	default_buss = frontend
	norepeatfor = 0.3
	instancemanagement = stop_oldest
	instancelimit = 4
}
menu_cheat_bad_sfx_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			HUDtrickslopC
			vol = 60
		}
	}
}
sk3_sfx_death_sound_struct = {
	default_priority = 55
	default_buss = frontend
	norepeatfor = 0.3
	instancemanagement = stop_oldest
	instancelimit = 4
}
sk3_sfx_death_sound_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			sk9_BailBodyPunch01
		}
		sound2 = {
			sk9_BailSlap01
		}
		sound3 = {
			BailBodyFall01
		}
	}
}
net_new_king_other_sfx_struct = {
	default_priority = 55
	default_buss = frontend
	norepeatfor = 0.3
	instancemanagement = stop_oldest
	instancelimit = 2
}
net_new_king_other_sfx_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_midgoal_rank
			vol = 50
		}
	}
}
net_new_gold_owner_other_sfx_struct = {
	default_priority = 55
	default_buss = frontend
	norepeatfor = 0.3
	instancemanagement = stop_oldest
	instancelimit = 2
}
net_new_gold_owner_other_sfx_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_midgoal_rank
			vol = 50
		}
	}
}
net_new_king_you_sfx_struct = {
	default_priority = 55
	default_buss = frontend
	norepeatfor = 0.3
	instancemanagement = stop_oldest
	instancelimit = 2
}
net_new_king_you_sfx_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_midgoal_rank
			vol = 50
		}
	}
}
net_new_gold_owner_you_sfx_struct = {
	default_priority = 55
	default_buss = frontend
	norepeatfor = 0.3
	instancemanagement = stop_oldest
	instancelimit = 2
}
net_new_gold_owner_you_sfx_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_midgoal_rank
			vol = 50
		}
	}
}
netmessage_timer_runout_beep_sfx_struct = {
	default_priority = 75
	default_buss = slomo
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 2
}
netmessage_timer_runout_beep_sfx_container = {
	command = playsound
	randomness = none
}
netmessage_skater_Collide_bail_sfx_struct = {
	default_priority = 55
	default_buss = frontend
	norepeatfor = 0.3
	instancemanagement = stop_oldest
	instancelimit = 2
}
netmessage_skater_Collide_bail_sfx_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			HUDtrickslopC
			vol = 40
		}
	}
}
netmessage_head_smack_sfx_struct = {
	default_priority = 55
	default_buss = frontend
	norepeatfor = 0.2
	instancemanagement = stop_oldest
	instancelimit = 2
}
netmessage_head_smack_sfx_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_BailSlap03
			vol = 50
		}
	}
}
netmessage_team_join_sfx_struct = {
	default_priority = 55
	default_buss = frontend
	norepeatfor = 0.3
	instancemanagement = stop_oldest
	instancelimit = 2
}
netmessage_team_join_sfx_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			Sk8_JamSession_Race_Go
			vol = 50
		}
	}
}
scavenger_hunt_done_sfx_struct = {
	default_priority = 55
	default_buss = frontend
	norepeatfor = 0.3
	instancemanagement = stop_oldest
	instancelimit = 4
}
scavenger_hunt_done_sfx_container = {
	command = playsound
	randomness = none
}
scavenger_hunt_got_object_sfx_struct = {
	default_priority = 55
	default_buss = frontend
	norepeatfor = 0.3
	instancemanagement = stop_oldest
	instancelimit = 4
}
scavenger_hunt_got_object_sfx_container = {
	command = playsound
	randomness = none
}
fliptrick_bail_bloodframe_sfx_struct = {
	default_priority = 35
	default_buss = Sweetners
	norepeatfor = 0.3
	instancemanagement = stop_oldest
	instancelimit = 4
}
fliptrick_bail_bloodframe_sfx_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			hitblood01
			vol = 50
		}
		sound2 = {
			hitblood02
			vol = 50
		}
		sound3 = {
			hitblood03
			vol = 50
		}
	}
}
fliptrick_bail_slap_sfx_struct = {
	default_priority = 45
	default_buss = Sweetners
	norepeatfor = 0.2
	instancemanagement = stop_oldest
	instancelimit = 2
}
fliptrick_bail_slap_sfx_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			sk9_BailSlap01
			vol = 50
		}
		sound2 = {
			sk9_BailSlap02
			vol = 50
		}
		sound3 = {
			sk9_BailSlap03
			vol = 50
		}
	}
}
grabtrick_bail_bloodframe_sfx_struct = {
	default_priority = 55
	default_buss = frontend
	norepeatfor = 0.3
	instancemanagement = stop_oldest
	instancelimit = 4
}
grabtrick_bail_bloodframe_sfx_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			hitblood01
			vol = 50
		}
		sound2 = {
			hitblood02
			vol = 50
		}
		sound3 = {
			hitblood03
			vol = 50
		}
	}
}
grabtrick_bail_slap_sfx_struct = {
	default_priority = 55
	default_buss = frontend
	norepeatfor = 0.3
	instancelimit = 4
	instancemanagement = stop_oldest
}
grabtrick_bail_slap_sfx_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			sk9_BailSlap01
			vol = 50
		}
		sound2 = {
			sk9_BailSlap02
			vol = 50
		}
		sound3 = {
			sk9_BailSlap03
			vol = 50
		}
	}
}
air_to_tail_sfx_struct = {
	default_priority = 55
	default_buss = OlliesLands
	norepeatfor = 0.2
	instancemanagement = stop_oldest
	instancelimit = 4
}
air_to_tail_sfx_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			SK8_Asphalt_Ollie_01
			randompitch = {
				type = randomrangetype
				vals = [
					60
					80
				]
			}
			vol = 30
		}
	}
}
generic_bail_blood_sfx_struct = {
	default_priority = 35
	default_buss = Sweetners
	norepeatfor = 0.3
	instancemanagement = stop_oldest
	instancelimit = 4
}
generic_bail_blood_sfx_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			hitblood01
			vol = 50
		}
		sound2 = {
			hitblood02
			vol = 50
		}
		sound3 = {
			hitblood03
			vol = 50
		}
	}
}
tantrum_gotstat_sfx_struct = {
	default_priority = 55
	default_buss = frontend
	norepeatfor = 0.3
	instancemanagement = stop_oldest
	instancelimit = 4
}
tantrum_gotstat_sfx_container = {
	command = playsound
	randomness = none
}
grind_shake_camera_sfx_struct = {
	default_priority = 35
	default_buss = frontend
	norepeatfor = 0.3
	instancemanagement = stop_oldest
	instancelimit = 4
}
grind_shake_camera_sfx_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_BailSlap03
			vol = 60
		}
	}
}
manual_foleymove_cess_sfx_struct = {
	default_priority = 55
	default_buss = frontend
	norepeatfor = 0.3
	instancemanagement = stop_oldest
	instancelimit = 4
}
manual_foleymove_cess_sfx_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			foleymove01
			pitch = 110
			vol = 50
		}
	}
}
clock_tick_down_sfx_struct = {
	default_priority = 55
	default_buss = frontend
	norepeatfor = 0.05
	instancemanagement = stop_oldest
	instancelimit = 2
}
clock_tick_down_sfx_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ClockTickDown
			vol = 125
		}
	}
}
clock_tick_up_sfx_struct = {
	default_priority = 55
	default_buss = frontend
	norepeatfor = 0.05
	instancemanagement = stop_oldest
	instancelimit = 2
}
clock_tick_up_sfx_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ClockTickUp
			vol = 60
		}
	}
}
special_sound_in_multiplayer_game_struct = {
	default_priority = 55
	default_buss = frontend
	norepeatfor = 0.3
	instancemanagement = stop_oldest
	instancelimit = 4
}
special_sound_in_multiplayer_game_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			Sk8_JamSession_Race_Go
			vol = 50
		}
	}
}
special_sound_in_slowmo_cool_struct = {
	default_priority = 55
	default_buss = frontend
	norepeatfor = 0.3
	instancemanagement = stop_oldest
	instancelimit = 4
}
special_sound_in_slowmo_cool_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			HUD_specialtrickAA
			pitch = 75
			vol = 70
		}
	}
}
special_sound_in_otherm_modes_struct = {
	default_priority = 55
	default_buss = frontend
	norepeatfor = 0.3
	instancemanagement = stop_oldest
	instancelimit = 4
}
special_sound_in_otherm_modes_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_special_trick
			vol = 90
		}
	}
}
Skater_Bail_Board_Sound_struct = {
	default_priority = 50
	default_buss = DropsBounces
	norepeatfor = 0.1
	instancemanagement = stop_furthest
	instancelimit = 4
}
Skater_Bail_Board_Sound_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			BailBoard01
			randompitch = {
				type = randomrangetype
				vals = [
					100
					102
				]
			}
			randomvol = {
				type = randomrangetype
				vals = [
					90
					100
				]
			}
		}
		sound2 = {
			BailBoard02
			randompitch = {
				type = randomrangetype
				vals = [
					100
					102
				]
			}
			randomvol = {
				type = randomrangetype
				vals = [
					90
					100
				]
			}
		}
		sound3 = {
			BailBoard03
			randompitch = {
				type = randomrangetype
				vals = [
					100
					102
				]
			}
			randomvol = {
				type = randomrangetype
				vals = [
					90
					100
				]
			}
		}
		sound4 = {
			BailBoard04
			randompitch = {
				type = randomrangetype
				vals = [
					100
					102
				]
			}
			randomvol = {
				type = randomrangetype
				vals = [
					90
					100
				]
			}
		}
	}
}
stat_goal_success_struct = {
	default_priority = 50
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
stat_goal_success_container = {
	command = playsound
	randomness = none
}
LandPointsSound_struct = {
	default_priority = 50
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 4
}
LandPointsSound_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			LandCombo01
		}
	}
}
Classic_Mode_Out_of_bounds_Timer_Beep_sfx_struct = {
	default_priority = 65
	default_buss = GoalFeedback
	norepeatfor = 0.2
	instancelimit = 2
	instancemanagement = stop_oldest
}
Classic_Mode_Out_of_bounds_Timer_Beep_sfx_container = {
	command = playsound
	randomness = none
}
General_Goal_Success_Sound_sfx_struct = {
	default_priority = 85
	default_buss = GoalFeedback
	norepeatfor = 0.5
	instancemanagement = stop_oldest
	instancelimit = 2
}
General_Goal_Success_Sound_sfx_container = {
	command = playsound
	randomness = none
}
ExtraTrick_SFX_InstanceLimiting_struct = {
	default_priority = 75
	default_buss = GoalFeedback
	norepeatfor = 0.05
	instancemanagement = stop_oldest
	instancelimit = 3
}
ExtraTrick_SFX_InstanceLimiting_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			Sk8_Double_Tap_Extra_Trick
		}
	}
}
Pause_Menu_Scroll_LEFT_SFX_struct = {
	default_priority = 65
	default_buss = pausemenu
	norepeatfor = 0.05
	instancemanagement = stop_oldest
	instancelimit = 2
}
Pause_Menu_Scroll_LEFT_SFX_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_menu_scroll_right
			randompitch = {
				type = randomrangetype
				vals = [
					90
					110
				]
			}
			vol = 110
		}
	}
}
Pause_Menu_Scroll_RIGHT_SFX_struct = {
	default_priority = 65
	default_buss = frontend
	norepeatfor = 0.05
	instancemanagement = stop_oldest
	instancelimit = 2
}
Pause_Menu_Scroll_RIGHT_SFX_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_menu_scroll_left
			randompitch = {
				type = randomrangetype
				vals = [
					95
					105
				]
			}
			vol = 110
		}
	}
}
CAS_Pan_Left_SFX_struct = {
	default_priority = 50
	default_buss = frontend
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 4
}
CAS_Pan_Left_SFX_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			SK8_CAS_Pan_Left
			pitch = 90
			vol = 200
		}
	}
}
CAS_SFX_Skater_Shoes_Change_struct = {
	default_priority = 60
	default_buss = frontend
	norepeatfor = 0.2
	instancemanagement = stop_oldest
	instancelimit = 4
}
CAS_SFX_Skater_Shoes_Change_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			CAS_Change_Shoes
		}
	}
}
CAS_SFX_Skater_Glasses_Change_struct = {
	default_priority = 60
	default_buss = frontend
	norepeatfor = 0.2
	instancemanagement = stop_oldest
	instancelimit = 4
}
CAS_SFX_Skater_Glasses_Change_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			Sk8_CaS_Sunglasses
			vol = 150
		}
	}
}
CAS_SFX_Skater_Backpack_Change_struct = {
	default_priority = 60
	default_buss = frontend
	norepeatfor = 0.2
	instancemanagement = stop_oldest
	instancelimit = 4
}
CAS_SFX_Skater_Backpack_Change_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			Sk8_CaS_Sunglasses
		}
	}
}
CAS_SFX_Skater_BoardGraphic_Change_struct = {
	default_priority = 60
	default_buss = frontend
	norepeatfor = 0.2
	instancemanagement = stop_oldest
	instancelimit = 4
}
CAS_SFX_Skater_BoardGraphic_Change_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			SK8_CAS_Board_Spray_01
		}
	}
}
CAS_SFX_Skater_Griptape_Change_struct = {
	default_priority = 60
	default_buss = frontend
	norepeatfor = 0.2
	instancemanagement = stop_oldest
	instancelimit = 4
}
CAS_SFX_Skater_Griptape_Change_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			SK8_CAS_Griptape_01
		}
	}
}
CAS_SFX_Skater_Eyeballs_Change_struct = {
	default_priority = 60
	default_buss = frontend
	norepeatfor = 0.2
	instancemanagement = stop_oldest
	instancelimit = 4
}
CAS_SFX_Skater_Eyeballs_Change_container = {
	command = playsound
	randomness = none
}
CAS_SFX_Skater_Face_Change_struct = {
	default_priority = 60
	default_buss = frontend
	norepeatfor = 0.2
	instancemanagement = stop_oldest
	instancelimit = 4
}
CAS_SFX_Skater_Face_Change_container = {
	command = playsound
	randomness = none
}
CAS_SFX_Skater_Hair_Change_struct = {
	default_priority = 60
	default_buss = frontend
	norepeatfor = 0.2
	instancemanagement = stop_oldest
	instancelimit = 4
}
CAS_SFX_Skater_Hair_Change_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			Sk8_CaS_Hair
			vol = 150
		}
	}
}
ntt_into_sfx_loop_struct = {
	default_priority = 1
	default_buss = TransitionSounds
	norepeatfor = 0.5
	instancemanagement = stop_oldest
	instancelimit = 4
}
ntt_into_sfx_loop_container = {
	command = playsound
	randomness = none
}
nail_the_trick_Board_Rotate_SFX_struct = {
	default_priority = 85
	default_buss = GoalFeedback
	norepeatfor = 0.3
	instancemanagement = stop_oldest
	instancelimit = 4
}
nail_the_trick_Board_Rotate_SFX_container = {
	command = obj_playsound
	randomness = none
	sounds = {
		sound1 = {
			sk8_NTT_boardspin_02
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Turfwar_Cell_Menu_Exit_SFX_struct = {
	default_priority = 95
	default_buss = GoalFeedback
	norepeatfor = 0.25
	instancelimit = 4
	instancemanagement = stop_oldest
}
Turfwar_Cell_Menu_Exit_SFX_container = {
	command = playsound
	randomness = none
}
Turfwar_Cell_Menu_Select_SFX_struct = {
	default_priority = 95
	default_buss = GoalFeedback
	norepeatfor = 0.22
	instancelimit = 4
	instancemanagement = stop_oldest
}
Turfwar_Cell_Menu_Select_SFX_container = {
	command = playsound
	randomness = none
}
Turfwar_Cell_Menu_UpDown_SFX_struct = {
	default_priority = 95
	default_buss = GoalFeedback
	norepeatfor = 0.04
	instancelimit = 4
	instancemanagement = stop_oldest
}
Turfwar_Cell_Menu_UpDown_SFX_container = {
	command = playsound
	randomness = none
}
Turfwar_SprayPaint_Small_SFX_struct = {
	default_priority = 95
	default_buss = GoalFeedback
	norepeatfor = 2.1
	instancemanagement = stop_oldest
	instancelimit = 4
}
Turfwar_SprayPaint_Small_SFX_container = {
	command = playsound
	randomness = none
}
Turfwar_SprayPaint_Big_SFX_struct = {
	default_priority = 95
	default_buss = GoalFeedback
	norepeatfor = 6
	instancemanagement = stop_oldest
	instancelimit = 4
}
Turfwar_SprayPaint_Big_SFX_container = {
	command = playsound
	randomness = none
}
Combo_Letter_Collect_SFX_struct = {
	default_priority = 65
	default_buss = GoalFeedback
	norepeatfor = 0.25
	instancemanagement = stop_oldest
	instancelimit = 2
}
Combo_Letter_Collect_SFX_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			COMBO_COLLECT
			vol = 300
		}
	}
}
Skate_Letter_Collect_SFX_struct = {
	default_priority = 65
	default_buss = GoalFeedback
	norepeatfor = 0.3
	instancemanagement = stop_oldest
	instancelimit = 2
}
Skate_Letter_Collect_SFX_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			SKATE_COLLECT
			vol = 150
		}
	}
}
Bail_Torso_Slide_sfx_struct = {
	default_priority = 65
	default_buss = GoalFeedback
	norepeatfor = 0.3
	instancemanagement = stop_oldest
	instancelimit = 2
}
Bail_Torso_Slide_sfx_container = {
	command = playsound
	randomness = none
}
Crowd_Ped_AI_CheerLand_BIG_struct = {
	default_priority = 50
	default_buss = crowd
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 3
}
Crowd_Ped_AI_CheerLand_BIG_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			Cheer_Big_04
			vol = 70
		}
		sound2 = {
			Cheer_Big_01
			vol = 70
		}
		sound3 = {
			Cheer_Big_05
			vol = 70
		}
	}
}
Crowd_Ped_AI_CheerLand_MEDIUM_struct = {
	default_priority = 50
	default_buss = crowd
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 4
}
Crowd_Ped_AI_CheerLand_MEDIUM_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			Cheer_Med_01
			vol = 150
		}
		sound2 = {
			Cheer_Med_02
			vol = 150
		}
		sound3 = {
			Cheer_Med_03
			vol = 150
		}
		sound4 = {
			Cheer_Med_04
			vol = 150
		}
		sound5 = {
			Cheer_Med_05
			vol = 150
		}
	}
}
Crowd_Ped_AI_CheerLand_SMALL_struct = {
	default_priority = 50
	default_buss = crowd
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 4
}
Crowd_Ped_AI_CheerLand_SMALL_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			Cheer_Small_01
		}
		sound2 = {
			Cheer_Small_02
		}
		sound3 = {
			Cheer_Small_03
		}
		sound4 = {
			Cheer_Small_04
		}
		sound5 = {
			Cheer_Small_05
		}
		sound6 = {
			Cheer_Small_06
		}
		sound7 = {
			Cheer_Small_07
		}
	}
}
Generic_Male_KnockDown_Sound_struct = {
	default_priority = 90
	default_buss = PedCallouts_WET
	norepeatfor = 0.2
	instancemanagement = stop_furthest
	instancelimit = 4
}
Generic_Male_KnockDown_Sound_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			m1_knockdown_01
			dropoff = 50
			dropoff_function = standard
			randomvol = {
				type = randomrangetype
				vals = [
					85
					95
				]
			}
			randompitch = {
				type = randomrangetype
				vals = [
					95
					105
				]
			}
		}
		sound2 = {
			m1_knockdown_02
			dropoff = 50
			dropoff_function = standard
			randomvol = {
				type = randomrangetype
				vals = [
					85
					95
				]
			}
			randompitch = {
				type = randomrangetype
				vals = [
					95
					105
				]
			}
		}
		sound3 = {
			m1_knockdown_03
			dropoff = 50
			dropoff_function = standard
			randomvol = {
				type = randomrangetype
				vals = [
					85
					95
				]
			}
			randompitch = {
				type = randomrangetype
				vals = [
					95
					105
				]
			}
		}
		sound4 = {
			m1_knockdown_04
			dropoff = 50
			dropoff_function = standard
			randomvol = {
				type = randomrangetype
				vals = [
					85
					95
				]
			}
			randompitch = {
				type = randomrangetype
				vals = [
					95
					105
				]
			}
		}
		sound5 = {
			m1_knockdown_05
			dropoff = 50
			dropoff_function = standard
			randomvol = {
				type = randomrangetype
				vals = [
					85
					95
				]
			}
			randompitch = {
				type = randomrangetype
				vals = [
					95
					105
				]
			}
		}
		sound6 = {
			m1_knockdown_06
			dropoff = 50
			dropoff_function = standard
			randomvol = {
				type = randomrangetype
				vals = [
					85
					95
				]
			}
			randompitch = {
				type = randomrangetype
				vals = [
					95
					105
				]
			}
		}
		sound7 = {
			m1_knockdown_07
			dropoff = 50
			dropoff_function = standard
			randomvol = {
				type = randomrangetype
				vals = [
					85
					95
				]
			}
			randompitch = {
				type = randomrangetype
				vals = [
					95
					105
				]
			}
		}
		sound8 = {
			m1_knockdown_08
			dropoff = 50
			dropoff_function = standard
			randomvol = {
				type = randomrangetype
				vals = [
					85
					95
				]
			}
			randompitch = {
				type = randomrangetype
				vals = [
					95
					105
				]
			}
		}
		sound9 = {
			m1_knockdown_09
			dropoff = 50
			dropoff_function = standard
			randomvol = {
				type = randomrangetype
				vals = [
					85
					95
				]
			}
			randompitch = {
				type = randomrangetype
				vals = [
					95
					105
				]
			}
		}
		sound10 = {
			m1_knockdown_10
			dropoff = 50
			dropoff_function = standard
			randomvol = {
				type = randomrangetype
				vals = [
					85
					95
				]
			}
			randompitch = {
				type = randomrangetype
				vals = [
					95
					105
				]
			}
		}
	}
}
Generic_Female_KnockDown_Sound_struct = {
	default_priority = 90
	default_buss = PedCallouts_WET
	norepeatfor = 0.2
	instancemanagement = stop_furthest
	instancelimit = 4
}
Generic_Female_KnockDown_Sound_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			f1_knockdown_02
			dropoff = 50
			dropoff_function = linear
			randomvol = {
				type = randomrangetype
				vals = [
					75
					85
				]
			}
			randompitch = {
				type = randomrangetype
				vals = [
					95
					105
				]
			}
		}
		sound2 = {
			f1_knockdown_03
			dropoff = 50
			dropoff_function = linear
			randomvol = {
				type = randomrangetype
				vals = [
					75
					85
				]
			}
			randompitch = {
				type = randomrangetype
				vals = [
					95
					105
				]
			}
		}
		sound3 = {
			f1_knockdown_05
			dropoff = 50
			dropoff_function = linear
			randomvol = {
				type = randomrangetype
				vals = [
					75
					85
				]
			}
			randompitch = {
				type = randomrangetype
				vals = [
					95
					105
				]
			}
		}
		sound4 = {
			f1_knockdown_06
			dropoff = 50
			dropoff_function = linear
			randomvol = {
				type = randomrangetype
				vals = [
					75
					85
				]
			}
			randompitch = {
				type = randomrangetype
				vals = [
					95
					105
				]
			}
		}
		sound5 = {
			f1_knockdown_07
			dropoff = 50
			dropoff_function = linear
			randomvol = {
				type = randomrangetype
				vals = [
					75
					85
				]
			}
			randompitch = {
				type = randomrangetype
				vals = [
					95
					105
				]
			}
		}
		sound6 = {
			f1_knockdown_08
			dropoff = 50
			dropoff_function = linear
			randomvol = {
				type = randomrangetype
				vals = [
					75
					85
				]
			}
			randompitch = {
				type = randomrangetype
				vals = [
					95
					105
				]
			}
		}
		sound7 = {
			f1_knockdown_11
			dropoff = 50
			dropoff_function = linear
			randomvol = {
				type = randomrangetype
				vals = [
					75
					85
				]
			}
			randompitch = {
				type = randomrangetype
				vals = [
					95
					105
				]
			}
		}
		sound8 = {
			f1_knockdown_13
			dropoff = 50
			dropoff_function = linear
			randomvol = {
				type = randomrangetype
				vals = [
					75
					85
				]
			}
			randompitch = {
				type = randomrangetype
				vals = [
					95
					105
				]
			}
		}
		sound9 = {
			f1_knockdown_14
			dropoff = 50
			dropoff_function = linear
			randomvol = {
				type = randomrangetype
				vals = [
					75
					85
				]
			}
			randompitch = {
				type = randomrangetype
				vals = [
					95
					105
				]
			}
		}
		sound10 = {
			f1_knockdown_15
			dropoff = 50
			dropoff_function = linear
			randomvol = {
				type = randomrangetype
				vals = [
					75
					85
				]
			}
			randompitch = {
				type = randomrangetype
				vals = [
					95
					105
				]
			}
		}
		sound11 = {
			f1_knockdown_01
			dropoff = 50
			dropoff_function = linear
			randomvol = {
				type = randomrangetype
				vals = [
					75
					85
				]
			}
			randompitch = {
				type = randomrangetype
				vals = [
					95
					105
				]
			}
		}
	}
}
Ped_Hit_By_Skater_Small_SFX_struct = {
	default_priority = 65
	default_buss = PedBodyFalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 4
}
Ped_Hit_By_Skater_Small_SFX_container = {
	command = obj_playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			BailBodyFall01
			randompitch = {
				type = randomrangetype
				vals = [
					95
					105
				]
			}
			randomvol = {
				type = randomrangetype
				vals = [
					90
					100
				]
			}
		}
		sound2 = {
			BailBodyFall02
			randompitch = {
				type = randomrangetype
				vals = [
					95
					105
				]
			}
			randomvol = {
				type = randomrangetype
				vals = [
					90
					100
				]
			}
		}
		sound3 = {
			BailBodyFall03
			randompitch = {
				type = randomrangetype
				vals = [
					95
					105
				]
			}
			randomvol = {
				type = randomrangetype
				vals = [
					90
					100
				]
			}
		}
		sound4 = {
			BailBodyFall04
			randompitch = {
				type = randomrangetype
				vals = [
					95
					105
				]
			}
			randomvol = {
				type = randomrangetype
				vals = [
					90
					100
				]
			}
		}
		sound5 = {
			BailBodyFall05
			randompitch = {
				type = randomrangetype
				vals = [
					95
					105
				]
			}
			randomvol = {
				type = randomrangetype
				vals = [
					90
					100
				]
			}
		}
	}
}
Ped_Hit_By_Skater_Big_SFX_struct = {
	default_priority = 65
	default_buss = PedBodyFalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 4
}
Ped_Hit_By_Skater_Big_SFX_container = {
	command = playsound
	randomness = none
}
Skater_Hit_By_Ped_Tackle_SFX_struct = {
	default_priority = 65
	default_buss = BodyFalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 4
}
Skater_Hit_By_Ped_Tackle_SFX_container = {
	command = playsound
	randomness = none
}
Ped_Hit_By_Skater_KnockDown_SFX_struct = {
	default_priority = 65
	default_buss = PedBodyFalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 4
}
Ped_Hit_By_Skater_KnockDown_SFX_container = {
	command = playsound
	randomness = none
}
Go_Into_Slo_Mo_sfx_struct = {
	default_priority = 85
	default_buss = slomo
	norepeatfor = 0.5
	instancemanagement = stop_oldest
	instancelimit = 4
}
Go_Into_Slo_Mo_sfx_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			SK8_Focus_Into
			vol = 90
		}
	}
}
Go_Outof_Slo_Mo_sfx_struct = {
	default_priority = 100
	default_buss = slomo
	norepeatfor = 0.01
	instancemanagement = stop_oldest
	instancelimit = 40
}
Go_Outof_Slo_Mo_sfx_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			SK8_Focus_OutOf
			vol = 375
		}
	}
}
Wheel_Spin_Speed_1_struct = {
	default_priority = 45
	default_buss = wheelspins
	norepeatfor = 0.0
	instancemanagement = stop_oldest
	instancelimit = 4
}
Wheel_Spin_Speed_1_container = {
	command = playsound
	randomness = none
}
Wheel_Spin_Speed_2_struct = {
	default_priority = 45
	default_buss = wheelspins
	norepeatfor = 0
	instancemanagement = stop_oldest
	instancelimit = 4
}
Wheel_Spin_Speed_2_container = {
	command = playsound
	randomness = none
}
Wheel_Spin_Speed_3_struct = {
	default_priority = 45
	default_buss = wheelspins
	norepeatfor = 0.0
	instancemanagement = stop_oldest
	instancelimit = 4
}
Wheel_Spin_Speed_3_container = {
	command = playsound
	randomness = none
}
Wheel_Spin_Speed_4_struct = {
	default_priority = 45
	default_buss = wheelspins
	norepeatfor = 0
	instancemanagement = stop_oldest
	instancelimit = 4
}
Wheel_Spin_Speed_4_container = {
	command = playsound
	randomness = none
}
Wheel_Spin_Speed_5_struct = {
	default_priority = 45
	default_buss = wheelspins
	norepeatfor = 0.0
	instancemanagement = stop_oldest
	instancelimit = 4
}
Wheel_Spin_Speed_5_container = {
	command = playsound
	randomness = none
}
Wheel_Spin_Speed_6_struct = {
	default_priority = 45
	default_buss = wheelspins
	norepeatfor = 0
	instancemanagement = stop_oldest
	instancelimit = 4
}
Wheel_Spin_Speed_6_container = {
	command = playsound
	randomness = none
}
Sk8_BoardSqueaks_struct = {
	default_priority = 30
	default_buss = BoardMovement
	norepeatfor = 0.2
	instancemanagement = stop_oldest
	instancelimit = 3
}
Sk8_BoardSqueaks_container = {
	command = playsound
	randomness = none
}
sk8_CAS_SURF_Inhale_struct = {
	default_priority = 50
	default_buss = FocusBreaths
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 4
}
sk8_CAS_SURF_Inhale_container = {
	command = playsound
	randomness = none
}
sk8_CAS_SURF_Exhale_struct = {
	default_priority = 50
	default_buss = FocusBreaths
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 4
}
sk8_CAS_SURF_Exhale_container = {
	command = playsound
	randomness = none
}
sk8_CAS_SURF_LandLgGrunt_struct = {
	default_priority = 50
	default_buss = CAS_CAREER
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 4
}
sk8_CAS_SURF_LandLgGrunt_container = {
	command = playsound
	randomness = none
}
sk8_CAS_SURF_BailSmGrunt_struct = {
	default_priority = 50
	default_buss = CAS_CAREER
	norepeatfor = 1
	instancemanagement = stop_oldest
	instancelimit = 4
}
sk8_CAS_SURF_BailSmGrunt_container = {
	command = playsound
	randomness = none
}
sk9_CAS_YOU_BailInitSmGrunt_struct = {
	default_priority = 50
	default_buss = CAS_CAREER
	norepeatfor = 1
	instancemanagement = stop_oldest
	instancelimit = 4
}
sk9_CAS_YOU_BailInitSmGrunt_container = {
	command = playsound
	randomness = none
}
sk9_CAS_YOU_BailSmGrunt_struct = {
	default_priority = 50
	default_buss = CAS_CAREER
	norepeatfor = 1
	instancemanagement = stop_oldest
	instancelimit = 4
}
sk9_CAS_YOU_BailSmGrunt_container = {
	command = playsound
	randomness = none
}
sk9_CAS_YOU_BailLgGrunt_struct = {
	default_priority = 50
	default_buss = CAS_CAREER
	norepeatfor = 1
	instancemanagement = stop_oldest
	instancelimit = 4
}
sk9_CAS_YOU_BailLgGrunt_container = {
	command = playsound
	randomness = none
}
sk9_CAS_YOU_BailInitLgGrunt_struct = {
	default_priority = 50
	default_buss = CAS_CAREER
	norepeatfor = 1
	instancemanagement = stop_oldest
	instancelimit = 4
}
sk9_CAS_YOU_BailInitLgGrunt_container = {
	command = playsound
	randomness = none
}
sk8_CAS_SURF_BailLgGrunt_struct = {
	default_priority = 50
	default_buss = CAS_CAREER
	norepeatfor = 1
	instancemanagement = stop_oldest
	instancelimit = 4
}
sk8_CAS_SURF_BailLgGrunt_container = {
	command = playsound
	randomness = none
}
sk8_CAS_SURF_BailInitSmGrunt_struct = {
	default_priority = 50
	default_buss = CAS_CAREER
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 4
}
sk8_CAS_SURF_BailInitSmGrunt_container = {
	command = playsound
	randomness = none
}
sk8_CAS_SURF_BailInitLgGrunt_struct = {
	default_priority = 50
	default_buss = CAS_CAREER
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 4
}
sk8_CAS_SURF_BailInitLgGrunt_container = {
	command = playsound
	randomness = none
}
AAA_TERRAIN_DUMMY_struct = {
	default_priority = 5
	default_buss = SkaterOllies
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 4
}
AAA_TERRAIN_DUMMY_container = {
	command = playsound
	randomness = none
}
sk8_CAS_URBN_Inhale_struct = {
	default_priority = 50
	default_buss = FocusBreaths
	norepeatfor = 1
	instancemanagement = ignore
	instancelimit = 2
}
sk8_CAS_URBN_Inhale_container = {
	command = playsound
	randomness = none
}
sk8_CAS_URBN_Exhale_struct = {
	default_priority = 50
	default_buss = FocusBreaths
	norepeatfor = 1
	instancemanagement = ignore
	instancelimit = 2
}
sk8_CAS_URBN_Exhale_container = {
	command = playsound
	randomness = none
}
sk8_CAS_PUNK_Inhale_struct = {
	default_priority = 50
	default_buss = FocusBreaths
	norepeatfor = 1
	instancemanagement = ignore
	instancelimit = 2
}
sk8_CAS_PUNK_Inhale_container = {
	command = playsound
	randomness = none
}
sk8_CAS_PUNK_Exhale_struct = {
	default_priority = 50
	default_buss = FocusBreaths
	norepeatfor = 1
	instancemanagement = ignore
	instancelimit = 2
}
sk8_CAS_PUNK_Exhale_container = {
	command = playsound
	randomness = none
}
sk8_CAS_URBN_LandLgGrunt_struct = {
	default_priority = 50
	default_buss = generic_male
	norepeatfor = 0.8
	instancemanagement = ignoreF
	instancelimit = 4
}
sk8_CAS_URBN_LandLgGrunt_container = {
	command = playsound
	randomness = none
}
sk8_CAS_PUNK_LandLgGrunt_struct = {
	default_priority = 50
	default_buss = generic_male
	norepeatfor = 0.8
	instancemanagement = ignore
	instancelimit = 4
}
sk8_CAS_PUNK_LandLgGrunt_container = {
	command = playsound
	randomness = none
}
sk8_CAS_URBN_BailSmGrunt_struct = {
	default_priority = 50
	default_buss = generic_male
	norepeatfor = 1
	instancemanagement = ignore
	instancelimit = 4
}
sk8_CAS_URBN_BailSmGrunt_container = {
	command = playsound
	randomness = none
}
sk8_CAS_PUNK_BailSmGrunt_struct = {
	default_priority = 50
	default_buss = generic_male
	norepeatfor = 1
	instancemanagement = ignore
	instancelimit = 4
}
sk8_CAS_PUNK_BailSmGrunt_container = {
	command = playsound
	randomness = none
}
sk8_CAS_URBN_BailLgGrunt_struct = {
	default_priority = 50
	default_buss = generic_male
	norepeatfor = 1
	instancemanagement = ignore
	instancelimit = 4
}
sk8_CAS_URBN_BailLgGrunt_container = {
	command = playsound
	randomness = none
}
sk8_CAS_PUNK_BailLgGrunt_struct = {
	default_priority = 50
	default_buss = generic_male
	norepeatfor = 1
	instancemanagement = ignore
	instancelimit = 4
}
sk8_CAS_PUNK_BailLgGrunt_container = {
	command = playsound
	randomness = none
}
sk8_CAS_URBN_BailInitLgGrunt_struct = {
	default_priority = 50
	default_buss = generic_male
	norepeatfor = 0.8
	instancemanagement = ignore
	instancelimit = 4
}
sk8_CAS_URBN_BailInitLgGrunt_container = {
	command = playsound
	randomness = none
}
sk8_CAS_URBN_BailInitSmGrunt_struct = {
	default_priority = 50
	default_buss = generic_male
	norepeatfor = 0.8
	instancemanagement = ignore
	instancelimit = 4
}
sk8_CAS_URBN_BailInitSmGrunt_container = {
	command = playsound
	randomness = none
}
sk8_CAS_PUNK_BailInitLgGrunt_struct = {
	default_priority = 50
	default_buss = generic_male
	norepeatfor = 0.8
	instancemanagement = ignore
	instancelimit = 4
}
sk8_CAS_PUNK_BailInitLgGrunt_container = {
	command = playsound
	randomness = none
}
sk8_CAS_PUNK_BailInitSmGrunt_struct = {
	default_priority = 50
	default_buss = generic_male
	norepeatfor = 0.8
	instancemanagement = ignore
	instancelimit = 4
}
sk8_CAS_PUNK_BailInitSmGrunt_container = {
	command = playsound
	randomness = none
}
BG_OneShot_Bmore_City_struct = {
	default_priority = 10
	default_buss = OneShots
	norepeatfor = 3
	instancemanagement = stop_oldest
	instancelimit = 4
}
BG_OneShot_Bmore_City_container = {
	command = playsound
	randomness = none
}
BG_OneShot_Bmore_Harbor_struct = {
	default_priority = 10
	default_buss = OneShots
	norepeatfor = 3
	instancemanagement = stop_oldest
	instancelimit = 4
}
BG_OneShot_Bmore_Harbor_container = {
	command = playsound
	randomness = none
}
BG_OneShot_Bmore_Lansdowne_struct = {
	default_priority = 10
	default_buss = OneShots
	norepeatfor = 3
	instancemanagement = ignore
	instancelimit = 4
}
BG_OneShot_Bmore_Lansdowne_container = {
	command = playsound
	randomness = none
}
BG_OneShot_Bmore_Roofs_struct = {
	default_priority = 10
	default_buss = OneShots
	norepeatfor = 3
	instancemanagement = stop_oldest
	instancelimit = 4
}
BG_OneShot_Bmore_Roofs_container = {
	command = playsound
	randomness = none
}
BG_OneShot_DC_City_struct = {
	default_priority = 10
	default_buss = OneShots
	norepeatfor = 3
	instancemanagement = ignore
	instancelimit = 4
}
BG_OneShot_DC_City_container = {
	command = playsound
	randomness = none
}
BG_OneShot_DC_Museums_struct = {
	default_priority = 10
	default_buss = OneShots
	norepeatfor = 3
	instancemanagement = ignore
	instancelimit = 4
}
BG_OneShot_DC_Museums_container = {
	command = playsound
	randomness = none
}
BG_OneShot_DC_Roofs_struct = {
	default_priority = 10
	default_buss = OneShots
	norepeatfor = 3
	instancemanagement = ignore
	instancelimit = 4
}
BG_OneShot_DC_Roofs_container = {
	command = playsound
	randomness = none
}
BG_OneShot_Moon_struct = {
	default_priority = 10
	default_buss = OneShots
	norepeatfor = 3
	instancemanagement = stop_oldest
	instancelimit = 4
}
BG_OneShot_Moon_container = {
	command = playsound
	randomness = none
}
BG_OneShot_Philly_Slums_struct = {
	default_priority = 10
	default_buss = OneShots
	norepeatfor = 3
	instancemanagement = stop_oldest
	instancelimit = 4
}
BG_OneShot_Philly_Slums_container = {
	command = playsound
	randomness = none
}
BG_OneShot_Philly_City_struct = {
	default_priority = 10
	default_buss = OneShots
	norepeatfor = 3
	instancemanagement = stop_oldest
	instancelimit = 4
}
BG_OneShot_Philly_City_container = {
	command = playsound
	randomness = none
}
BG_OneShot_Bridges_struct = {
	default_priority = 10
	default_buss = OneShots
	norepeatfor = 3
	instancemanagement = stop_oldest
	instancelimit = 4
}
BG_OneShot_Bridges_container = {
	command = playsound
	randomness = none
}
TurfWar_LandOnObject_BelowAm_struct = {
	default_priority = 85
	default_buss = GoalFeedback
	norepeatfor = 0.2
	instancemanagement = stop_oldest
	instancelimit = 2
}
TurfWar_LandOnObject_BelowAm_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk8_goal_turfwar_02
			vol = 100
		}
	}
}
TurfWar_LandOnObject_Am_struct = {
	default_priority = 85
	default_buss = GoalFeedback
	norepeatfor = 0.2
	instancemanagement = stop_oldest
	instancelimit = 2
}
TurfWar_LandOnObject_Am_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk8_goal_turfwar_03
			vol = 100
		}
	}
}
TurfWar_LandOnObject_HitTarget_struct = {
	default_priority = 85
	default_buss = GoalFeedback
	norepeatfor = 0.2
	instancemanagement = stop_oldest
	instancelimit = 2
}
TurfWar_LandOnObject_HitTarget_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk8_goal_turfwar_04
		}
	}
}
TurfWar_LandOnObject_HitTarget2_struct = {
	default_priority = 85
	default_buss = GoalFeedback
	norepeatfor = 0.2
	instancemanagement = stop_oldest
	instancelimit = 2
}
TurfWar_LandOnObject_HitTarget2_container = {
	command = playsound
	randomness = none
}
TurfWar_LandOnObject_HitTarget3_struct = {
	default_priority = 85
	default_buss = GoalFeedback
	norepeatfor = 0.2
	instancemanagement = stop_oldest
	instancelimit = 2
}
TurfWar_LandOnObject_HitTarget3_container = {
	command = playsound
	randomness = none
}
TurfWar_LandOnObject_FirstObject_struct = {
	default_priority = 85
	default_buss = GoalFeedback
	norepeatfor = 0.2
	instancemanagement = stop_oldest
	instancelimit = 2
}
TurfWar_LandOnObject_FirstObject_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk8_goal_turfwar_01
			vol = 100
		}
	}
}
Goal_Chalk_Challenge_Start_struct = {
	default_priority = 85
	default_buss = GoalFeedback
	norepeatfor = 0.3
	instancemanagement = stop_oldest
	instancelimit = 4
}
Goal_Chalk_Challenge_Start_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			SK8_Chalk_Challenge_Start
		}
	}
}
sk8_BodySplat_struct = {
	default_priority = 85
	default_buss = GoalFeedback
	norepeatfor = 0.2
	instancemanagement = stop_oldest
	instancelimit = 4
}
sk8_BodySplat_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk8_BodySplat
		}
	}
}
Medal_Am_SFX_struct = {
	default_priority = 50
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
Medal_Am_SFX_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_MidGoal_Am
			vol = 80
		}
	}
}
Medal_Pro_SFX_struct = {
	default_priority = 50
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 4
}
Medal_Pro_SFX_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_MidGoal_Pro
			vol = 80
		}
	}
}
Medal_Sick_SFX_struct = {
	default_priority = 50
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 4
}
Medal_Sick_SFX_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_MidGoal_Sick
			vol = 80
		}
	}
}
SK8_Wind_Boost_SFX_struct = {
	default_priority = 50
	default_buss = SkaterSpecialFX
	norepeatfor = 0.5
	instancemanagement = stop_oldest
	instancelimit = 2
}
SK8_Wind_Boost_SFX_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			SK8_Skater_Boost_Sound
			vol = 80
			pitch = 90
		}
	}
}
SK8_Wind_Boost_SFX_bell_struct = {
	default_priority = 50
	default_buss = SkaterSpecialFX
	norepeatfor = 0.5
	instancemanagement = stop_oldest
	instancelimit = 2
}
SK8_Wind_Boost_SFX_bell_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			SK8_Skater_Boost_Sound
			vol = 200
			pitch = 90
		}
	}
}
Skaters_Eye_Into_struct = {
	default_priority = 50
	default_buss = SkaterSpecialFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 4
}
Skaters_Eye_Into_container = {
	command = playsound
	randomness = none
}
Skaters_Eye_OutOf_struct = {
	default_priority = 50
	default_buss = SkaterSpecialFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 4
}
Skaters_Eye_OutOf_container = {
	command = playsound
	randomness = none
}
sk8_handclaps_struct = {
	default_priority = 50
	default_buss = PedClaps
	norepeatfor = 0.0
	instancemanagement = stop_furthest
	instancelimit = 8
}
sk8_handclaps_container = {
	command = obj_playsound
	randomness = randomnorepeattype
}
Goal_UI_Negative_Text_struct = {
	default_priority = 50
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 4
}
Goal_UI_Negative_Text_container = {
	command = playsound
	randomness = none
}
Comp_Drop_Scores_struct = {
	default_priority = 75
	default_buss = CompetitionHUD
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 4
}
Comp_Drop_Scores_container = {
	command = playsound
	randomness = none
}
Comp_Combine_Scores_struct = {
	default_priority = 75
	default_buss = CompetitionHUD
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 4
}
Comp_Combine_Scores_container = {
	command = playsound
	randomness = none
}
sk8_ReadySet_struct = {
	default_priority = 50
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 4
}
sk8_ReadySet_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			SK8_JamSession_Race_ReadySet
			vol = 75
		}
	}
}
sk8_Race_GO_struct = {
	default_priority = 50
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 4
}
sk8_Race_GO_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			Sk8_JamSession_Race_Go
			vol = 200
		}
	}
}
Medal_Screen_Am_struct = {
	default_priority = 50
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 4
}
Medal_Screen_Am_container = {
	command = playsound
	randomness = none
}
Medal_Screen_Pro_struct = {
	default_priority = 50
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 4
}
Medal_Screen_Pro_container = {
	command = playsound
	randomness = none
}
Medal_Screen_Sick_struct = {
	default_priority = 50
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 4
}
Medal_Screen_Sick_container = {
	command = playsound
	randomness = none
}
Goal_UI_Positive_Text_struct = {
	default_priority = 50
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 4
}
Goal_UI_Positive_Text_container = {
	command = playsound
	randomness = none
}
PlayTrainingVOSoundEvent_struct = {
	default_priority = 90
	default_buss = GoalVO_WET
	norepeatfor = 0.2
	instancemanagement = stop_oldest
	instancelimit = 2
}
PlayTrainingVOSoundEvent_container = {
	command = playsound
	randomness = none
}
Graffiti_Opponent_Stole_From_You_SFX_struct = {
	default_priority = 85
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 4
}
Graffiti_Opponent_Stole_From_You_SFX_container = {
	command = playsound
	randomness = none
}
Graffiti_You_Stole_From_An_Opponent_SFX_struct = {
	default_priority = 85
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 4
}
Graffiti_You_Stole_From_An_Opponent_SFX_container = {
	command = playsound
	randomness = none
}
Skate_The_Line_Land_On_New_Obj_struct = {
	default_priority = 50
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 4
}
Skate_The_Line_Land_On_New_Obj_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk8_goal_turfwar_03
			vol = 65
		}
	}
}
sk8_bailboard_struct = {
	default_priority = 50
	default_buss = DropsBounces
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 4
}
sk8_bailboard_container = {
	command = obj_playsound
	randomness = randomnorepeattype
}
UI_Toggle_Checkbox_SFX_struct = {
	default_priority = 50
	default_buss = frontend
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
UI_Toggle_Checkbox_SFX_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_toggle
		}
	}
}
UI_Toggle_Genre_SFX_struct = {
	default_priority = 50
	default_buss = frontend
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
UI_Toggle_Genre_SFX_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_toggle
		}
	}
}
UI_Found_Secret_Spot_SFX_struct = {
	default_priority = 85
	default_buss = pausemenu
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
UI_Found_Secret_Spot_SFX_container = {
	command = playsound
	randomness = none
}
Crowd_Ped_AI_Comp_CheerLand_BIG_struct = {
	default_priority = 50
	default_buss = crowd
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 3
}
Crowd_Ped_AI_Comp_CheerLand_BIG_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			Cheer_Big_01
			vol = 400
		}
		sound2 = {
			Cheer_Big_04
			vol = 400
		}
		sound3 = {
			Cheer_Big_05
			vol = 400
		}
	}
}
Crowd_Ped_AI_Comp_CheerLand_MEDIUM_struct = {
	default_priority = 50
	default_buss = crowd
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 4
}
Crowd_Ped_AI_Comp_CheerLand_MEDIUM_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			Cheer_Med_01
			vol = 400
		}
		sound2 = {
			Cheer_Med_02
			vol = 400
		}
		sound3 = {
			Cheer_Med_03
			vol = 400
		}
		sound4 = {
			Cheer_Med_04
			vol = 400
		}
		sound5 = {
			Cheer_Med_05
			vol = 400
		}
	}
}
Crowd_Ped_AI_Comp_CheerLand_SMALL_struct = {
	default_priority = 50
	default_buss = crowd
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 4
}
Crowd_Ped_AI_Comp_CheerLand_SMALL_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			Cheer_Small_01
			vol = 400
		}
		sound2 = {
			Cheer_Small_02
			vol = 400
		}
		sound3 = {
			Cheer_Small_03
			vol = 400
		}
		sound4 = {
			Cheer_Small_04
			vol = 400
		}
		sound5 = {
			Cheer_Small_05
			vol = 400
		}
		sound6 = {
			Cheer_Small_06
			vol = 400
		}
		sound7 = {
			Cheer_Small_07
			vol = 400
		}
	}
}
Stoken_Lost_SFX_struct = {
	default_priority = 55
	default_buss = frontend
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
Stoken_Lost_SFX_container = {
	command = playsound
	randomness = none
}
sk8_Blocker_SecGuard_Notice_struct = {
	default_priority = 60
	default_buss = generic_male
	norepeatfor = 30
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk8_Blocker_SecGuard_Notice_container = {
	command = playsound
	randomness = none
}
sk8_watersplash_sfx_struct = {
	default_priority = 50
	default_buss = ExploLandFXSounds
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk8_watersplash_sfx_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk8_watersplash
		}
	}
}
Online_Generic_You_Took_The_Lead_SFX_struct = {
	default_priority = 85
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 4
}
Online_Generic_You_Took_The_Lead_SFX_container = {
	command = playsound
	randomness = none
}
Online_Generic_Other_Took_Lead_From_You_SFX_struct = {
	default_priority = 85
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 4
}
Online_Generic_Other_Took_Lead_From_You_SFX_container = {
	command = playsound
	randomness = none
}
Online_Generic_You_Won_Screen_SFX_struct = {
	default_priority = 50
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 4
}
Online_Generic_You_Won_Screen_SFX_container = {
	command = playsound
	randomness = none
}
Online_Walls_You_Took_Someone_Out_SFX_struct = {
	default_priority = 85
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 4
}
Online_Walls_You_Took_Someone_Out_SFX_container = {
	command = playsound
	randomness = none
}
Online_Walls_Someone_Took_You_Out_SFX_struct = {
	default_priority = 85
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 4
}
Online_Walls_Someone_Took_You_Out_SFX_container = {
	command = playsound
	randomness = none
}
Teleport_Back_SFX_struct = {
	default_priority = 50
	default_buss = SkaterSpecialFX
	norepeatfor = 0.8
	instancemanagement = ignore
	instancelimit = 1
}
Teleport_Back_SFX_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			SK8_Teleport_Back
			vol = 350
		}
	}
}
CAS_Switch_Skater_SFX_struct = {
	default_priority = 60
	default_buss = frontend
	norepeatfor = 0.05
	instancemanagement = stop_oldest
	instancelimit = 3
}
CAS_Switch_Skater_SFX_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			SK8_CAS_Switch_Skater
			vol = 50
		}
	}
}
CAS_SFX_Skater_Socks_Change_struct = {
	default_priority = 50
	default_buss = frontend
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
CAS_SFX_Skater_Socks_Change_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			CAS_Change_Socks
		}
	}
}
Stat_PopUp_SFX_struct = {
	default_priority = 50
	default_buss = frontend
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Stat_PopUp_SFX_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			SK8_Stat_Popup
			vol = 50
		}
	}
}
CAS_SFX_Skater_Change_Accessory_struct = {
	default_priority = 50
	default_buss = frontend
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 3
}
CAS_SFX_Skater_Change_Accessory_container = {
	command = playsound
	randomness = none
}
Pause_Menu_Level_Change_SFX_struct = {
	default_priority = 50
	default_buss = frontend
	norepeatfor = 0.05
	instancemanagement = stop_oldest
	instancelimit = 2
}
Pause_Menu_Level_Change_SFX_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_soundoptions_levelchange
			vol = 110
		}
	}
}
RankUp_Tick_struct = {
	default_priority = 50
	default_buss = frontend
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
RankUp_Tick_container = {
	command = playsound
	randomness = none
}
RankUp_5_Highlight_struct = {
	default_priority = 50
	default_buss = frontend
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
RankUp_5_Highlight_container = {
	command = playsound
	randomness = none
}
UI_Menu_Rank_Screen_Page_Thru_SFX_struct = {
	default_priority = 50
	default_buss = frontend
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 3
}
UI_Menu_Rank_Screen_Page_Thru_SFX_container = {
	command = playsound
	randomness = none
}
Stacker_SFX_Add_Trick_struct = {
	default_priority = 75
	default_buss = GoalFeedback
	norepeatfor = 0
	instancemanagement = stop_oldest
	instancelimit = 4
}
Stacker_SFX_Add_Trick_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk8_Bouncy_GlassBlock_Collide_02
		}
	}
}
Training_Complete_Trick_SFX_struct = {
	default_priority = 50
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
Training_Complete_Trick_SFX_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_MidGoal_Am
			vol = 70
		}
	}
}
Training_Complete_Tutorial_SFX_struct = {
	default_priority = 50
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
Training_Complete_Tutorial_SFX_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			General_Success_01
			vol = 90
		}
	}
}
CAS_Jump_Land_In_Room_SFX_struct = {
	default_priority = 50
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
CAS_Jump_Land_In_Room_SFX_container = {
	command = playsound
	randomness = none
}
Goal_Comp_Announcer_Callout_VO_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Goal_Comp_Announcer_Callout_VO_container = {
	command = playsound
	randomness = none
}
Goal_Comp_Crowd_Pre_Run_struct = {
	default_priority = 75
	default_buss = crowd
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 3
}
Goal_Comp_Crowd_Pre_Run_container = {
	command = playsound
	randomness = none
}
End_Ranking_Screens_struct = {
	default_priority = 109
	default_buss = cutscenes
	norepeatfor = 0.5
	instancemanagement = ignore
	instancelimit = 1
}
End_Ranking_Screens_container = {
	command = playsound
	randomness = none
}
photo_SFX_move_down_struct = {
	default_priority = 50
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
photo_SFX_move_down_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_photo_move_down
			vol = 120
		}
	}
}
photo_SFX_move_left_struct = {
	default_priority = 50
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
photo_SFX_move_left_container = {
	command = playsound
	randomness = none
}
photo_SFX_zoom_in_struct = {
	default_priority = 50
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
photo_SFX_zoom_in_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_photo_zoom_in
			vol = 120
		}
	}
}
photo_SFX_zoom_out_struct = {
	default_priority = 50
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Z_Shops_NxSpline_15_KNOT_2 = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_photo_zoom_out
			vol = 120
		}
	}
}
Break_Metal_Small_SFX_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 10
}
Break_Metal_Small_SFX_container = {
	command = obj_playsound
	randomness = randomnorepeattype
}
Break_Wood_Small_SFX_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Break_Wood_Small_SFX_container = {
	command = obj_playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			SK8_WoodBreak_Explode_01
			vol = 40
			pitch = 150
		}
		sound2 = {
			SK8_WoodBreak_Explode_02
			vol = 40
			pitch = 150
		}
		sound3 = {
			SK8_WoodBreak_Explode_03
			vol = 40
			pitch = 150
		}
	}
}
Break_Wood_Med_SFX_struct = {
	default_priority = 65
	default_buss = zonesfx
	norepeatfor = 0.3
	instancemanagement = stop_oldest
	instancelimit = 2
}
Break_Wood_Med_SFX_container = {
	command = obj_playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			Fence_Break_01
			vol = 130
		}
		sound2 = {
			Fence_Break_02
			vol = 130
		}
		sound3 = {
			Fence_Break_03
			vol = 130
		}
	}
}
Sk9_Z_Love_BreakWood_SFX_01_struct = {
	default_priority = 65
	default_buss = zonesfx
	norepeatfor = 0.3
	instancemanagement = stop_oldest
	instancelimit = 2
}
Sk9_Z_Love_BreakWood_SFX_01_container = {
	command = obj_playsound
	randomness = none
	sounds = {
		sound1 = {
			Fence_Break_01
			emitter = z_love_SFX_SFX_Plywood_Explo_01
			dropoff = 100
			dropoff_function = standard
			randomvol = {
				type = randomrangetype
				vals = [
					140
					150
				]
			}
			randompitch = {
				type = randomrangetype
				vals = [
					95
					105
				]
			}
		}
	}
}
Sk9_Z_Love_BreakWood_SFX_02_struct = {
	default_priority = 65
	default_buss = zonesfx
	norepeatfor = 0.3
	instancemanagement = stop_oldest
	instancelimit = 2
}
Sk9_Z_Love_BreakWood_SFX_02_container = {
	command = obj_playsound
	randomness = none
	sounds = {
		sound1 = {
			Fence_Break_02
			emitter = z_love_SFX_SFX_Plywood_Explo_02
			dropoff = 100
			dropoff_function = standard
			randomvol = {
				type = randomrangetype
				vals = [
					140
					150
				]
			}
			randompitch = {
				type = randomrangetype
				vals = [
					95
					105
				]
			}
		}
	}
}
Sk9_Z_Love_BreakWood_SFX_03_struct = {
	default_priority = 65
	default_buss = zonesfx
	norepeatfor = 0.3
	instancemanagement = stop_oldest
	instancelimit = 2
}
Sk9_Z_Love_BreakWood_SFX_03_container = {
	command = obj_playsound
	randomness = none
	sounds = {
		sound1 = {
			Fence_Break_03
			emitter = z_love_SFX_SFX_Plywood_Explo_03
			dropoff = 100
			dropoff_function = standard
			randomvol = {
				type = randomrangetype
				vals = [
					140
					150
				]
			}
			randompitch = {
				type = randomrangetype
				vals = [
					95
					105
				]
			}
		}
	}
}
Sk9_Z_Love_BreakWood_SFX_04_struct = {
	default_priority = 65
	default_buss = zonesfx
	norepeatfor = 0.3
	instancemanagement = stop_oldest
	instancelimit = 2
}
Sk9_Z_Love_BreakWood_SFX_04_container = {
	command = obj_playsound
	randomness = none
	sounds = {
		sound1 = {
			Fence_Break_01
			emitter = z_love_SFX_SFX_Plywood_Explo_04
			dropoff = 100
			dropoff_function = standard
			randomvol = {
				type = randomrangetype
				vals = [
					140
					150
				]
			}
			randompitch = {
				type = randomrangetype
				vals = [
					95
					105
				]
			}
		}
	}
}
Break_Wood_Large_SFX_struct = {
	default_priority = 65
	default_buss = zonesfx
	norepeatfor = 0.2
	instancemanagement = stop_oldest
	instancelimit = 4
}
Break_Wood_Large_SFX_container = {
	command = obj_playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			SK8_WoodBreak_Explode_02
			dropoff = 100
			dropoff_function = standard
		}
		sound2 = {
			SK8_WoodBreak_Explode_01
			dropoff = 100
			dropoff_function = standard
		}
		sound3 = {
			SK8_WoodBreak_Explode_03
			dropoff = 100
			dropoff_function = standard
		}
	}
}
Break_Wooden_Picket_Fence_struct = {
	default_priority = 65
	default_buss = zonesfx
	norepeatfor = 0.3
	instancemanagement = stop_oldest
	instancelimit = 2
}
Break_Wooden_Picket_Fence_container = {
	command = obj_playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			Fence_Break_01
			vol = 130
		}
		sound2 = {
			Fence_Break_02
			vol = 130
		}
		sound3 = {
			Fence_Break_03
			vol = 130
		}
	}
}
Chair_Break_SFX_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Chair_Break_SFX_container = {
	command = playsound
	randomness = none
}
Ghetto_Wood_Post_Break_struct = {
	default_priority = 65
	default_buss = zonesfx
	norepeatfor = 0.2
	instancemanagement = stop_oldest
	instancelimit = 4
}
Ghetto_Wood_Post_Break_container = {
	command = obj_playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			SK8_WoodBreak_Explode_01
			randompitch = {
				type = randomrangetype
				vals = [
					120
					170
				]
			}
			vol = 70
			dropoff = 100
			dropoff_function = standard
		}
		sound2 = {
			SK8_WoodBreak_Explode_02
			randompitch = {
				type = randomrangetype
				vals = [
					120
					170
				]
			}
			vol = 70
			dropoff = 100
			dropoff_function = standard
		}
		sound3 = {
			SK8_WoodBreak_Explode_03
			randompitch = {
				type = randomrangetype
				vals = [
					120
					170
				]
			}
			vol = 70
			dropoff = 100
			dropoff_function = standard
		}
	}
}
Plywood_Break_SFX_struct = {
	default_priority = 65
	default_buss = zonesfx
	norepeatfor = 0.2
	instancemanagement = stop_oldest
	instancelimit = 4
}
Plywood_Break_SFX_container = {
	command = playsound
	randomness = none
}
Slalom_Wood_Fence_Break_SFX_struct = {
	default_priority = 65
	default_buss = zonesfx
	norepeatfor = 0.2
	instancemanagement = stop_oldest
	instancelimit = 4
}
Slalom_Wood_Fence_Break_SFX_container = {
	command = playsound
	randomness = none
}
Break_Glass_Small_SFX_struct = {
	default_priority = 65
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 3
}
Break_Glass_Small_SFX_container = {
	command = obj_playsound
	randomness = none
}
Stacker_SFX_Collapsing_struct = {
	default_priority = 75
	default_buss = GoalFeedback
	norepeatfor = 0.5
	instancemanagement = stop_oldest
	instancelimit = 1
}
Stacker_SFX_Collapsing_container = {
	command = playsound
	randomness = none
}
shoulder_check_SFX_struct = {
	default_priority = 50
	default_buss = checking
	norepeatfor = 0.1
	instancelimit = 4
	instancemanagement = stop_oldest
}
shoulder_check_SFX_container = {
	command = obj_playsound
	randomness = none
}
shoulder_check_miss_SFX_struct = {
	default_priority = 50
	default_buss = checking
	norepeatfor = 0.3
	instancelimit = 1
	instancemanagement = stop_oldest
}
shoulder_check_miss_SFX_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			SK9_shoulder_check_wsh1
			randompitch = {
				type = randomrangetype
				vals = [
					85
					115
				]
			}
			randomvol = {
				type = randomrangetype
				vals = [
					115
					130
				]
			}
		}
		sound2 = {
			SK9_shoulder_check_wsh2
			randompitch = {
				type = randomrangetype
				vals = [
					85
					115
				]
			}
			randomvol = {
				type = randomrangetype
				vals = [
					115
					130
				]
			}
		}
	}
}
WindLoop_SFX_Skater_Speed_struct = {
	default_priority = 50
	default_buss = SkaterSpecialFX
	norepeatfor = 0
	instancelimit = 1
	instancemanagement = ignore
}
WindLoop_SFX_Skater_Speed_container = {
	command = playsound
	sounds = {
		sound1 = {
			WindLoop3
			vol = 0
			num_loops = -1
		}
	}
}
WindLoop_SFX_Skater_Speed_FadeOut_struct = {
	default_priority = 50
	default_buss = SkaterSpecialFX
	norepeatfor = 0
	instancelimit = 1
	instancemanagement = ignore
}
WindLoop_SFX_Skater_Speed_FadeOut_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			WindLoop3Out
			vol = 20
		}
	}
}
NTG_Camera_Whoosh_In_SFX_struct = {
	default_priority = 75
	default_buss = slomo
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 2
}
NTG_Camera_Whoosh_In_SFX_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			SK9_NTG_Whoosh_In
			vol = 200
		}
	}
}
NTG_Grab_Board_SFX_struct = {
	default_priority = 75
	default_buss = slomo
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 2
}
NTG_Grab_Board_SFX_container = {
	command = playsound
	randomness = none
}
NTG_Grab_Stretch_SFX_struct = {
	default_priority = 75
	default_buss = slomo
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 2
}
NTG_Grab_Stretch_SFX_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			sk9_NTG_Foley_Move_01
			vol = 200
		}
		sound2 = {
			sk9_NTG_Foley_Move_02
			vol = 200
		}
		sound3 = {
			sk9_NTG_Foley_Move_03
			vol = 200
		}
		sound4 = {
			sk9_NTG_Foley_Move_04
			vol = 200
		}
	}
}
NTG_UI_Nailed_The_Grab_SFX_struct = {
	default_priority = 85
	default_buss = slomo
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
NTG_UI_Nailed_The_Grab_SFX_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			small_positive_message_01
			vol = 20
		}
	}
}
NTG_FingerFlip_Board_Rotate_SFX_struct = {
	default_priority = 85
	default_buss = slomo
	norepeatfor = 0.3
	instancemanagement = stop_oldest
	instancelimit = 4
}
NTG_FingerFlip_Board_Rotate_SFX_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk8_NTT_boardspin_02
			vol = 125
			pitch = 150
		}
	}
}
NTG_FingerFlip_SFX_struct = {
	default_priority = 85
	default_buss = slomo
	norepeatfor = 0.3
	instancemanagement = stop_oldest
	instancelimit = 4
}
NTG_FingerFlip_SFX_container = {
	command = playsound
	randomness = none
}
NTG_FingerFlip_Start_SFX_struct = {
	default_priority = 85
	default_buss = slomo
	norepeatfor = 0.3
	instancemanagement = stop_oldest
	instancelimit = 4
}
NTG_FingerFlip_Start_SFX_container = {
	command = playsound
	randomness = none
}
PedRigger_DitchPiece_struct = {
	default_priority = 50
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
PedRigger_DitchPiece_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			pedAI_rigger_Ditch_01
		}
	}
}
PedRigger_Fail_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
PedRigger_Fail_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			pedAI_rigger_fail_01
			vol = 300
		}
		sound2 = {
			pedAI_rigger_fail_02
			vol = 300
		}
		sound3 = {
			pedAI_rigger_fail_03
			vol = 300
		}
		sound4 = {
			pedAI_rigger_fail_04
			vol = 300
		}
		sound5 = {
			pedAI_rigger_fail_05
			vol = 300
		}
	}
}
PedRigger_Incidental_struct = {
	default_priority = 50
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
PedRigger_Incidental_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			pedAI_rigger_Inc_01
		}
		sound2 = {
			pedAI_rigger_Inc_02
		}
	}
}
PedRigger_BadLay_struct = {
	default_priority = 50
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
PedRigger_BadLay_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			pedAI_rigger_LayNeg_01
		}
		sound2 = {
			pedAI_rigger_LayNeg_02
		}
		sound3 = {
			pedAI_rigger_LayNeg_03
		}
	}
}
PedRigger_GoodLay_struct = {
	default_priority = 50
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
PedRigger_GoodLay_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			pedAI_rigger_LayPos_01
		}
		sound2 = {
			pedAI_rigger_LayPos_02
		}
		sound3 = {
			pedAI_rigger_LayPos_03
		}
	}
}
PedRigger_NoBoost_struct = {
	default_priority = 50
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
PedRigger_NoBoost_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			pedAI_rigger_NoBoost_01
		}
	}
}
PedRigger_PickAnother_struct = {
	default_priority = 50
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
PedRigger_PickAnother_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			pedAI_rigger_PickOther_01
		}
		sound2 = {
			pedAI_rigger_PickOther_02
		}
		sound3 = {
			pedAI_rigger_PickOther_03
		}
	}
}
PedRigger_Progress_struct = {
	default_priority = 50
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
PedRigger_Progress_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			pedAI_rigger_Prog_01
		}
		sound2 = {
			pedAI_rigger_Prog_02
		}
		sound3 = {
			pedAI_rigger_Prog_03
		}
		sound4 = {
			pedAI_rigger_Prog_04
		}
		sound5 = {
			pedAI_rigger_Prog_05
		}
	}
}
PedRigger_Success_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
PedRigger_Success_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			pedAI_rigger_Suc_01
			vol = 300
		}
		sound2 = {
			pedAI_rigger_Suc_02
			vol = 300
		}
		sound3 = {
			pedAI_rigger_Suc_03
			vol = 300
		}
		sound4 = {
			pedAI_rigger_Suc_04
			vol = 300
		}
		sound5 = {
			pedAI_rigger_Suc_05
			vol = 300
		}
		sound6 = {
			pedAI_rigger_Suc_06
			vol = 300
		}
	}
}
PedRigger_TooBig_struct = {
	default_priority = 50
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
PedRigger_TooBig_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			pedAI_rigger_TooBig_01
		}
	}
}
PedRigger_TooSmall_struct = {
	default_priority = 50
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
PedRigger_TooSmall_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			pedAI_rigger_TooSmall_01
		}
	}
}
sk9_AgroKick_BreathInhale_struct = {
	default_priority = 50
	default_buss = FocusBreaths
	norepeatfor = 0.6
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_AgroKick_BreathInhale_container = {
	command = playsound
	randomness = none
}
sk9_agro_woosh_SFX_struct = {
	default_priority = 50
	default_buss = TrickFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_agro_woosh_SFX_container = {
	command = obj_playsound
	randomness = none
}
sk9_AgroKick_BoostWhoosh_struct = {
	default_priority = 50
	default_buss = TrickFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_AgroKick_BoostWhoosh_container = {
	command = playsound
	randomness = none
}
sk9_car_boost_SFX_struct = {
	default_priority = 50
	default_buss = TrickFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_car_boost_SFX_container = {
	command = playsound
	randomness = none
}
sk9_wall_boost_SFX_struct = {
	default_priority = 50
	default_buss = TrickFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_wall_boost_SFX_container = {
	command = playsound
	randomness = none
}
sk9_FDR_CarBy_01_struct = {
	default_priority = 20
	default_buss = zonesfx
	norepeatfor = 2
	instancemanagement = ignore
	instancelimit = 1
}
sk9_FDR_CarBy_01_container = {
	command = playsound
	randomness = none
}
sk9_FDR_CarBy_02_struct = {
	default_priority = 20
	default_buss = zonesfx
	norepeatfor = 2
	instancemanagement = ignore
	instancelimit = 1
}
sk9_FDR_CarBy_02_container = {
	command = playsound
	randomness = none
}
sk9_FDR_CarBy_03_struct = {
	default_priority = 20
	default_buss = zonesfx
	norepeatfor = 2
	instancemanagement = ignore
	instancelimit = 1
}
sk9_FDR_CarBy_03_container = {
	command = playsound
	randomness = none
}
sk9_FDR_CarBy_04_struct = {
	default_priority = 20
	default_buss = zonesfx
	norepeatfor = 2
	instancemanagement = ignore
	instancelimit = 1
}
sk9_FDR_CarBy_04_container = {
	command = playsound
	randomness = none
}
sk9_FDR_CarBy_05_struct = {
	default_priority = 20
	default_buss = zonesfx
	norepeatfor = 2
	instancemanagement = ignore
	instancelimit = 1
}
sk9_FDR_CarBy_05_container = {
	command = playsound
	randomness = none
}
sk9_FDR_CarBy_06_struct = {
	default_priority = 20
	default_buss = zonesfx
	norepeatfor = 2
	instancemanagement = ignore
	instancelimit = 1
}
sk9_FDR_CarBy_06_container = {
	command = playsound
	randomness = none
}
sk9_FDR_CarBy_07_struct = {
	default_priority = 20
	default_buss = zonesfx
	norepeatfor = 2
	instancemanagement = ignore
	instancelimit = 1
}
sk9_FDR_CarBy_07_container = {
	command = playsound
	randomness = none
}
sk9_FDR_CarBy_08_struct = {
	default_priority = 20
	default_buss = zonesfx
	norepeatfor = 2
	instancemanagement = ignore
	instancelimit = 1
}
sk9_FDR_CarBy_08_container = {
	command = playsound
	randomness = none
}
sk9_FDR_CarBy_09_struct = {
	default_priority = 20
	default_buss = zonesfx
	norepeatfor = 2
	instancemanagement = ignore
	instancelimit = 1
}
sk9_FDR_CarBy_09_container = {
	command = playsound
	randomness = none
}
sk9_BW_Bridge_Ship_Horn_01_struct = {
	default_priority = 20
	default_buss = zonesfx
	norepeatfor = 2
	instancemanagement = ignore
	instancelimit = 1
}
sk9_BW_Bridge_Ship_Horn_01_container = {
	command = playsound
	randomness = none
}
sk9_BW_Bridge_Ship_Horn_02_struct = {
	default_priority = 20
	default_buss = zonesfx
	norepeatfor = 2
	instancemanagement = ignore
	instancelimit = 1
}
sk9_BW_Bridge_Ship_Horn_02_container = {
	command = playsound
	randomness = none
}
VO_AmbScene_AmbScene_Line01_Ped_Female01_struct = {
	default_priority = 95
	default_buss = IGCs
	norepeatfor = 0.5
	instancemanagement = ignore
	instancelimit = 1
}
VO_AmbScene_AmbScene_Line01_Ped_Female01_container = {
	command = agent_playvo
	randomness = none
	sounds = {
		sound1 = {
			AmbScene_Line01_Ped_Female01
			vol = 120
			dropoff = 120
			dropoff_function = standard
		}
	}
}
VO_AmbScene_AmbScene_Line02_Ped_Male01_struct = {
	default_priority = 95
	default_buss = IGCs
	norepeatfor = 0.5
	instancemanagement = ignore
	instancelimit = 1
}
VO_AmbScene_AmbScene_Line02_Ped_Male01_container = {
	command = agent_playvo
	randomness = none
	sounds = {
		sound1 = {
			AmbScene_Line02_Ped_Male01
			vol = 120
			dropoff = 120
			dropoff_function = standard
		}
	}
}
VO_AmbScene_AmbScene_Line03_Ped_Male02_struct = {
	default_priority = 95
	default_buss = IGCs
	norepeatfor = 0.5
	instancemanagement = ignore
	instancelimit = 1
}
VO_AmbScene_AmbScene_Line03_Ped_Male02_container = {
	command = agent_playvo
	randomness = none
	sounds = {
		sound1 = {
			AmbScene_Line03_Ped_Male02
			vol = 120
			dropoff = 120
			dropoff_function = standard
		}
	}
}
VO_AmbScene_AmbScene_Line04_Ped_Female01_struct = {
	default_priority = 95
	default_buss = IGCs
	norepeatfor = 0.5
	instancemanagement = ignore
	instancelimit = 1
}
VO_AmbScene_AmbScene_Line04_Ped_Female01_container = {
	command = agent_playvo
	randomness = none
	sounds = {
		sound1 = {
			AmbScene_Line04_Ped_Female01
			vol = 120
			dropoff = 120
			dropoff_function = standard
		}
	}
}
VO_AmbScene_AmbScene_Line05_Ped_Male02_struct = {
	default_priority = 95
	default_buss = IGCs
	norepeatfor = 0.5
	instancemanagement = ignore
	instancelimit = 1
}
VO_AmbScene_AmbScene_Line05_Ped_Male02_container = {
	command = agent_playvo
	randomness = none
	sounds = {
		sound1 = {
			AmbScene_Line05_Ped_Male02
			vol = 120
			dropoff = 120
			dropoff_function = standard
		}
	}
}
VO_AmbScene_AmbScene_Line06_Ped_Male01_struct = {
	default_priority = 95
	default_buss = IGCs
	norepeatfor = 0.5
	instancemanagement = ignore
	instancelimit = 1
}
VO_AmbScene_AmbScene_Line06_Ped_Male01_container = {
	command = agent_playvo
	randomness = none
	sounds = {
		sound1 = {
			AmbScene_Line06_Ped_Male01
			vol = 120
			dropoff = 120
			dropoff_function = standard
		}
	}
}
VO_AmbScene_AmbScene_Line07_Ped_Female01_struct = {
	default_priority = 95
	default_buss = IGCs
	norepeatfor = 0.5
	instancemanagement = ignore
	instancelimit = 1
}
VO_AmbScene_AmbScene_Line07_Ped_Female01_container = {
	command = agent_playvo
	randomness = none
	sounds = {
		sound1 = {
			AmbScene_Line07_Ped_Female01
			vol = 120
			dropoff = 120
			dropoff_function = standard
		}
	}
}
sk9_BW_Bridge_Construction_01_struct = {
	default_priority = 20
	default_buss = OneShots
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_BW_Bridge_Construction_01_container = {
	command = playsound
	randomness = none
}
sk9_PB_Bridge_Shipyard_01_struct = {
	default_priority = 20
	default_buss = OneShots
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_PB_Bridge_Shipyard_01_container = {
	command = playsound
	randomness = none
}
sk9_PB_Shipyard_Horn_01_struct = {
	default_priority = 65
	default_buss = GoalFeedback
	norepeatfor = 0.3
	instancemanagement = stop_oldest
	instancelimit = 2
}
sk9_PB_Shipyard_Horn_01_container = {
	command = playsound
	randomness = none
}
sk9_PB_Shipyard_Horn_02_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_PB_Shipyard_Horn_02_container = {
	command = playsound
	randomness = none
}
sk9_PB_Shipyard_Horn_03_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_PB_Shipyard_Horn_03_container = {
	command = playsound
	randomness = none
}
CAP_SFX_menu_show_struct = {
	default_priority = 50
	default_buss = frontend
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
CAP_SFX_menu_show_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_cap_show
			vol = 160
		}
	}
}
CAP_SFX_menu_hide_struct = {
	default_priority = 50
	default_buss = frontend
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
CAP_SFX_menu_hide_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_cap_hide
			vol = 160
		}
	}
}
CAP_SFX_item_scroll_struct = {
	default_priority = 50
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
CAP_SFX_item_scroll_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_cap_item_scroll
			vol = 65
		}
	}
}
CAP_SFX_cat_scroll_struct = {
	default_priority = 50
	default_buss = frontend
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
CAP_SFX_cat_scroll_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_cap_cat_scroll
			vol = 85
		}
	}
}
CAP_SFX_delete_struct = {
	default_priority = 50
	default_buss = frontend
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
CAP_SFX_delete_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_cap_delete
			vol = 70
		}
	}
}
Hawkman_Get_Pellet_Grind_struct = {
	default_priority = 50
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Hawkman_Get_Pellet_Grind_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_hawkman_pellet1
			vol = 125
		}
	}
}
Hawkman_Get_Pellet_Man_struct = {
	default_priority = 50
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Hawkman_Get_Pellet_Man_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_hawkman_pellet3
			vol = 60
		}
	}
}
Hawkman_Get_Pellet_Tran_struct = {
	default_priority = 50
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Hawkman_Get_Pellet_Tran_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_hawkman_pellet4
		}
	}
}
Hawkman_Get_Pellet_Wall_struct = {
	default_priority = 50
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Hawkman_Get_Pellet_Wall_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_hawkman_pellet2
		}
	}
}
SFX_Trig_m_h2_boneless_ThugWalla_struct = {
	default_priority = 90
	default_buss = MissionSFX
	norepeatfor = 0.5
	instancemanagement = stop_oldest
	instancelimit = 1
}
SFX_Trig_m_h2_boneless_ThugWalla_container = {
	command = playsound
	randomness = none
}
m_c2_revman_Inst_01_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_revman_Inst_01_container = {
	command = playsound
	randomness = none
}
m_c2_revman_Inst_02_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_revman_Inst_02_container = {
	command = playsound
	randomness = none
}
m_c2_revman_Inst_03_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_revman_Inst_03_container = {
	command = playsound
	randomness = none
}
m_c2_revman_Inst_04_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_revman_Inst_04_container = {
	command = playsound
	randomness = none
}
Sk9_SFX_Goal_Land_for_Am_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Sk9_SFX_Goal_Land_for_Am_container = {
	command = playsound
	randomness = none
}
Sk9_SFX_Goal_Land_for_Pro_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Sk9_SFX_Goal_Land_for_Pro_container = {
	command = playsound
	randomness = none
}
Sk9_SFX_Goal_Land_for_Sick_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Sk9_SFX_Goal_Land_for_Sick_container = {
	command = playsound
	randomness = none
}
sk9_m_h2_learncheck_chk1_struct = {
	default_priority = 20
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_m_h2_learncheck_chk1_container = {
	command = playsound
	randomness = none
}
sk9_m_h2_learncheck_chk2_pt1_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_m_h2_learncheck_chk2_pt1_container = {
	command = playsound
	randomness = none
}
sk9_m_h2_learncheck_chk2_pt2_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_m_h2_learncheck_chk2_pt2_container = {
	command = playsound
	randomness = none
}
PhotoSFX_Remove_Photo_struct = {
	default_priority = 50
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
PhotoSFX_Remove_Photo_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_remove_photo
			vol = 150
		}
	}
}
PhotoSFX_Show_Photo_struct = {
	default_priority = 50
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
PhotoSFX_Show_Photo_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_show_photo
			vol = 200
		}
	}
}
PhotoSFX_Take_Photo_struct = {
	default_priority = 50
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
PhotoSFX_Take_Photo_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_take_photo
			vol = 150
		}
	}
}
m_c2_ntg_inst_01_struct = {
	default_priority = 75
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_ntg_inst_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_ntg_inst_01
			dropoff = 80
			dropoff_function = standard
			vol = 375
		}
	}
}
m_c2_ntg_inst_02_struct = {
	default_priority = 75
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_ntg_inst_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_ntg_inst_02
			dropoff = 80
			dropoff_function = standard
			vol = 375
		}
	}
}
m_c2_ntg_inst_03_struct = {
	default_priority = 75
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_ntg_inst_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_ntg_inst_03
			dropoff = 80
			dropoff_function = standard
			vol = 375
		}
	}
}
m_c2_ntg_inst_04_struct = {
	default_priority = 75
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_ntg_inst_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_ntg_inst_04
			dropoff = 80
			dropoff_function = standard
			vol = 375
		}
	}
}
m_c2_ntg_inst_05_struct = {
	default_priority = 75
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_ntg_inst_05_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_ntg_inst_05
			dropoff = 80
			dropoff_function = standard
			vol = 375
		}
	}
}
m_c2_ntg_inst_06_struct = {
	default_priority = 75
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_ntg_inst_06_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_ntg_inst_06
			dropoff = 80
			dropoff_function = standard
			vol = 375
		}
	}
}
m_c2_ntg_inst_07_struct = {
	default_priority = 75
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_ntg_inst_07_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_ntg_inst_07
			dropoff = 80
			dropoff_function = standard
			vol = 375
		}
	}
}
sk9_arcade_mzk_loop_start_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 0.3
	instancemanagement = ignore
	instancelimit = 1
}
sk9_arcade_mzk_loop_start_container = {
	command = obj_playsound
	randomness = none
}
VO_m_h2_takefdr_Thug_Callout_struct = {
	default_priority = 95
	default_buss = generic_male
	norepeatfor = 0.5
	instancemanagement = stop_oldest
	instancelimit = 10
}
VO_m_h2_takefdr_Thug_Callout_container = {
	command = playsound
	randomness = none
}
models/car/male/m_glam_hair_izzy1.skin = {
	default_priority = 90
	default_buss = GoalVO_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_localcomp_chk1_pt1_container = {
	command = playsound
	randomness = none
}
VO_m_c2_localcomp_inst_01a_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_localcomp_inst_01a_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_localcomp_inst_01a
			vol = 350
		}
	}
}
VO_m_c2_localcomp_chk1_pt2_struct = {
	default_priority = 90
	default_buss = GoalVO_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_localcomp_chk1_pt2_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_localcomp_inst_02
			vol = 80
		}
	}
}
VO_m_c2_localcomp_chk1_pt3_struct = {
	default_priority = 90
	default_buss = GoalVO_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_localcomp_chk1_pt3_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_localcomp_inst_03
			vol = 80
		}
	}
}
VO_m_c2_localcomp_chk1_pt4_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_localcomp_chk1_pt4_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			TEMP_VO_m_c2_localcomp_chk1_pt4
		}
	}
}
VO_m_c2_localcomp_chk1_pt5_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_localcomp_chk1_pt5_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			TEMP_VO_m_c2_localcomp_chk1_pt5
		}
	}
}
VO_m_c2_localcomp_end_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_localcomp_end_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			TEMP_VO_m_c2_localcomp_End
		}
	}
}
VO_m_c2_localcomp_Event1_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_localcomp_Event1_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			TEMP_VO_m_c2_localcomp_Event1
		}
	}
}
VO_m_c2_localcomp_Event2_pt1_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_localcomp_Event2_pt1_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			TEMP_VO_m_c2_localcomp_Event2_pt1
		}
	}
}
VO_m_c2_localcomp_Event2_pt2_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_localcomp_Event2_pt2_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			TEMP_VO_m_c2_localcomp_Event2_pt2
		}
	}
}
VO_m_c2_localcomp_Event3_pt1_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_localcomp_Event3_pt1_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			TEMP_VO_m_c2_localcomp_Event3_pt1
		}
	}
}
VO_m_c2_localcomp_Event3_pt2_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_localcomp_Event3_pt2_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			TEMP_VO_m_c2_localcomp_Event3_pt2
		}
	}
}
VO_m_c2_localcomp_Event3_pt3_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_localcomp_Event3_pt3_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			TEMP_VO_m_c2_localcomp_Event3_pt3
		}
	}
}
m_c2_localcomp_CrowdCheer_struct = {
	default_priority = 75
	default_buss = crowd
	norepeatfor = 0.5
	instancemanagement = ignore
	instancelimit = 4
}
m_c2_localcomp_CrowdCheer_container = {
	command = playsound
	randomness = none
}
m_c2_compvert_CrowdCheer_struct = {
	default_priority = 75
	default_buss = crowd
	norepeatfor = 0.5
	instancemanagement = ignore
	instancelimit = 4
}
m_c2_compvert_CrowdCheer_container = {
	command = playsound
	randomness = none
}
sk9_comp_goal_crowd_cheer_Am_struct = {
	default_priority = 50
	default_buss = crowd
	norepeatfor = 0.5
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_comp_goal_crowd_cheer_Am_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			Comp_Crowd_Am
		}
	}
}
sk9_comp_goal_crowd_cheer_prelim_struct = {
	default_priority = 50
	default_buss = crowd
	norepeatfor = 0.5
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_comp_goal_crowd_cheer_prelim_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			Comp_Crowd_Prelim
		}
	}
}
sk9_comp_goal_crowd_cheer_Pro_struct = {
	default_priority = 50
	default_buss = crowd
	norepeatfor = 0.5
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_comp_goal_crowd_cheer_Pro_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			Comp_Crowd_Pro
			vol = 150
		}
	}
}
sk9_comp_goal_crowd_cheer_Sick_struct = {
	default_priority = 20
	default_buss = crowd
	norepeatfor = 2
	instancemanagement = ignore
	instancelimit = 1
}
sk9_comp_goal_crowd_cheer_Sick_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			Comp_Crowd_Sick
		}
	}
}
Sk9_Temp_Goal_Chkpt_SFX_struct = {
	default_priority = 65
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 5
}
Sk9_Temp_Goal_Chkpt_SFX_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			Temp_Goal_Chkpt_SFX
			vol = 65
		}
	}
}
VE_category_toggle_struct = {
	default_priority = 50
	default_buss = pausemenu
	norepeatfor = 0.05
	instancemanagement = stop_oldest
	instancelimit = 1
}
VE_category_toggle_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_VE_cat_toggle
			vol = 175
		}
	}
}
VE_deselect_struct = {
	default_priority = 50
	default_buss = pausemenu
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VE_deselect_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_VE_deselect
			vol = 250
		}
	}
}
VE_edit_cut_struct = {
	default_priority = 50
	default_buss = pausemenu
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VE_edit_cut_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_VE_edit_cut
			vol = 200
		}
	}
}
VE_edit_grow_struct = {
	default_priority = 50
	default_buss = pausemenu
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VE_edit_grow_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_VE_edit_grow
			vol = 200
		}
	}
}
VE_scroll_down_struct = {
	default_priority = 50
	default_buss = pausemenu
	norepeatfor = 0.05
	instancemanagement = stop_oldest
	instancelimit = 1
}
VE_scroll_down_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_VE_scroll_down
			vol = 235
		}
	}
}
VE_scroll_up_struct = {
	default_priority = 50
	default_buss = pausemenu
	norepeatfor = 0.05
	instancemanagement = stop_oldest
	instancelimit = 1
}
VE_scroll_up_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_VE_scroll_up
			vol = 235
		}
	}
}
VE_select_struct = {
	default_priority = 50
	default_buss = pausemenu
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VE_select_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_VE_select
			vol = 225
		}
	}
}
VO_m_h2_clearbcity_scream_struct = {
	default_priority = 95
	default_buss = generic_male
	norepeatfor = 0.5
	instancemanagement = ignore
	instancelimit = 4
}
VO_m_h2_clearbcity_scream_container = {
	command = playsound
	randomness = none
}
VO_m_h2_learncheck_scream_struct = {
	default_priority = 95
	default_buss = generic_male
	norepeatfor = 0.5
	instancemanagement = ignore
	instancelimit = 4
}
VO_m_h2_learncheck_scream_container = {
	command = obj_playsound
	randomness = none
}
Check_SlowMo_Out_SFX_struct = {
	default_priority = 100
	default_buss = slomo
	norepeatfor = 0.01
	instancemanagement = stop_oldest
	instancelimit = 40
}
Check_SlowMo_Out_SFX_container = {
	command = playsound
	randomness = none
}
Check_SlowMo_SFX_struct = {
	default_priority = 100
	default_buss = slomo
	norepeatfor = 0.01
	instancemanagement = stop_oldest
	instancelimit = 40
}
Check_SlowMo_SFX_container = {
	command = playsound
	randomness = none
}
m_r1_Buildspine_vo_negatives_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 30
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r1_Buildspine_vo_negatives_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			m_r1_buildspine_vo_negatives_CanDoIt
			vol = 350
		}
		sound2 = {
			m_r1_buildspine_vo_negatives_GotThis
			vol = 350
		}
		sound3 = {
			m_r1_buildspine_vo_negatives_KeepAtIt
			vol = 350
		}
	}
}
m_r1_buildspine_vo_positives_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r1_buildspine_vo_positives_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			m_r1_buildspine_vo_positives_AlmostGot
			vol = 350
		}
		sound2 = {
			m_r1_buildspine_vo_positives_GotThis
			vol = 350
		}
	}
}
m_r1_buildspine_vo_SickReaction_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r1_buildspine_vo_SickReaction_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_buildspine_vo_SickReaction
			vol = 350
		}
	}
}
m_r1_buildspine_vo_ProReaction_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r1_buildspine_vo_ProReaction_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_buildspine_vo_ProReaction
			vol = 350
		}
	}
}
m_r1_buildspine_vo_AmReaction_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r1_buildspine_vo_AmReaction_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_buildspine_vo_AmReaction
			vol = 350
		}
	}
}
arcade_mzk_background_struct = {
	default_priority = 100
	default_buss = MusicInGame
	norepeatfor = 0.5
	instancemanagement = ignore
	instancelimit = 1
}
arcade_mzk_background_container = {
	command = playsound
	randomness = none
}
stall_truck_squeak_struct = {
	default_priority = 50
	default_buss = Grinding
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
stall_truck_squeak_container = {
	command = playsound
	randomness = none
}
sk9_Focus_Timer_struct = {
	default_priority = 70
	default_buss = slomo
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Focus_Timer_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_Focus_Timer17
			vol = 400
			pan1x = -0.495
			pan1y = 0.869
			pan2x = 0.49
			pan2y = 0.872
		}
	}
}
sk9_new_zone_beep_struct = {
	default_priority = 70
	default_buss = frontend
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_new_zone_beep_container = {
	command = playsound
	randomness = none
}
sk9_Checkpoint_SFX_struct = {
	default_priority = 70
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Checkpoint_SFX_container = {
	command = playsound
	randomness = none
}
VO_m_c2_compvert_chk1_pt1_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_compvert_chk1_pt1_container = {
	command = playsound
	randomness = none
}
VO_m_c2_compvert_chk1_pt5_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_compvert_chk1_pt5_container = {
	command = playsound
	randomness = none
}
VO_m_c2_compvert_chk3_pt1_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_compvert_chk3_pt1_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			Comp_Crowd_Pro
			vol = 150
		}
	}
}
VO_m_c2_compvert_chk5_pt1_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_compvert_chk5_pt1_container = {
	command = playsound
	randomness = none
}
VO_m_c2_compvert_end_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_compvert_end_container = {
	command = playsound
	randomness = none
}
Air_Bonus_SFX_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Air_Bonus_SFX_container = {
	command = playsound
	randomness = none
}
VO_m_c2_compstreet_finalscore_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_compstreet_finalscore_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_compstreet_finalscore
		}
	}
}
Skip_Cam_SFX_struct = {
	default_priority = 50
	default_buss = MissionSFX
	norepeatfor = 0.5
	instancemanagement = stop_oldest
	instancelimit = 1
}
Skip_Cam_SFX_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_skip_cam
			vol = 250
		}
	}
}
m_r2_climb_temp_vo_struct = {
	default_priority = 90
	default_buss = GoalVO_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_climb_temp_vo_container = {
	command = obj_playsound
	randomness = none
}
m_r2_breakin_vo_chk1p1_struct = {
	default_priority = 90
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_breakin_vo_chk1p1_container = {
	command = playsound
	randomness = none
}
m_r2_breakin_vo_chk1p2_struct = {
	default_priority = 90
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_breakin_vo_chk1p2_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r2_breakin_inst_02
			vol = 350
		}
	}
}
m_r2_breakin_vo_chk1p3_struct = {
	default_priority = 90
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_breakin_vo_chk1p3_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			Temp_vo_Chk1_p3
			vol = 400
		}
	}
}
m_r2_breakin_vo_chk2p1_struct = {
	default_priority = 90
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_breakin_vo_chk2p1_container = {
	command = playsound
	randomness = none
}
m_r2_breakin_vo_chk2p2_struct = {
	default_priority = 90
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_breakin_vo_chk2p2_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			Temp_vo_Chk2_p2
			vol = 400
		}
	}
}
m_r2_breakin_vo_chk2p3_struct = {
	default_priority = 90
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_breakin_vo_chk2p3_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			Temp_vo_Chk2_p3
			vol = 400
		}
	}
}
m_r2_breakin_vo_chk3p1_struct = {
	default_priority = 90
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_breakin_vo_chk3p1_container = {
	command = playsound
	randomness = none
}
m_r2_breakin_vo_chk3p2_struct = {
	default_priority = 90
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_breakin_vo_chk3p2_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			Temp_vo_Chk3_p2
			vol = 400
		}
	}
}
m_r2_breakin_vo_chk3p3_struct = {
	default_priority = 90
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_breakin_vo_chk3p3_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			Temp_vo_Chk3_p3
			vol = 400
		}
	}
}
m_r2_breakin_vo_chk4p1_struct = {
	default_priority = 90
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_breakin_vo_chk4p1_container = {
	command = playsound
	randomness = none
}
m_r2_breakin_vo_chk4p2_struct = {
	default_priority = 90
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_breakin_vo_chk4p2_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			Temp_vo_Chk4_p2
			vol = 400
		}
	}
}
m_r2_breakin_vo_chk4p3_struct = {
	default_priority = 90
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_breakin_vo_chk4p3_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			Temp_vo_Chk4_p3
			vol = 400
		}
	}
}
m_r2_breakin_Guard_Talk_01_struct = {
	default_priority = 60
	default_buss = generic_male
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_breakin_Guard_Talk_01_container = {
	command = obj_playsound
	randomness = none
}
m_r2_breakin_Guard_Talk_02_struct = {
	default_priority = 60
	default_buss = generic_male
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_breakin_Guard_Talk_02_container = {
	command = obj_playsound
	randomness = none
}
m_r2_breakin_Guard_Talk_03_struct = {
	default_priority = 60
	default_buss = generic_male
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_breakin_Guard_Talk_03_container = {
	command = obj_playsound
	randomness = none
}
m_r2_breakin_Guard_Talk_04_struct = {
	default_priority = 60
	default_buss = generic_male
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_breakin_Guard_Talk_04_container = {
	command = obj_playsound
	randomness = none
}
m_r2_breakin_Guard_Talk_Doughnuts_struct = {
	default_priority = 60
	default_buss = generic_male
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_breakin_Guard_Talk_Doughnuts_container = {
	command = obj_playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			m_r2_breakin_inc_guard_07
			vol = 400
			dropoff = 200
		}
		sound2 = {
			m_r2_breakin_inc_guard_08
			vol = 400
			dropoff = 200
		}
		sound3 = {
			m_r2_breakin_inc_guard_15
			vol = 400
			dropoff = 200
		}
	}
}
m_r2_breakin_Guard_Talk_SeesYou_struct = {
	default_priority = 60
	default_buss = generic_male
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_breakin_Guard_Talk_SeesYou_container = {
	command = obj_playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			m_r2_breakin_inc_guard_12
			vol = 400
			dropoff = 200
		}
		sound2 = {
			m_r2_breakin_inc_guard_09
			vol = 400
			dropoff = 200
		}
		sound3 = {
			m_r2_breakin_inc_guard_10
			vol = 400
			dropoff = 200
		}
	}
}
m_r2_breakin_Guard_Talk_AlrightPunk_struct = {
	default_priority = 60
	default_buss = generic_male
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_breakin_Guard_Talk_AlrightPunk_container = {
	command = obj_playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r2_breakin_inc_guard_13
			vol = 400
			dropoff = 200
		}
	}
}
m_r2_breakin_Shayne_Ladder_struct = {
	default_priority = 60
	default_buss = generic_male
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_breakin_Shayne_Ladder_container = {
	command = obj_playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r2_breakin_inst_05
			vol = 400
			dropoff = 200
		}
	}
}
m_r2_breakin_Shayne_Doughnuts_struct = {
	default_priority = 60
	default_buss = generic_male
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_breakin_Shayne_Doughnuts_container = {
	command = obj_playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r2_breakin_inst_04
			vol = 400
			dropoff = 200
		}
	}
}
m_r2_breakin_Rube_Alert_01_struct = {
	default_priority = 90
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_breakin_Rube_Alert_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			Rube_Alert_Temp_1
			vol = 400
		}
	}
}
m_r2_breakin_Rube_Alert_02_struct = {
	default_priority = 90
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_breakin_Rube_Alert_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			Rube_Alert_Temp_2
			vol = 400
		}
	}
}
m_r2_breakin_Rube_Alert_03_struct = {
	default_priority = 90
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_breakin_Rube_Alert_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			Rube_Alert_Temp_3
			vol = 400
		}
	}
}
m_r2_breakin_Rube_Alert_04_struct = {
	default_priority = 90
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_breakin_Rube_Alert_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			Rube_Alert_Temp_4
			vol = 400
		}
	}
}
m_r2_breakin_Rube_Alert_05_struct = {
	default_priority = 90
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_breakin_Rube_Alert_05_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			Rube_Alert_Temp_5
			vol = 400
		}
	}
}
m_r2_breakin_Rube_Alert_06_struct = {
	default_priority = 90
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_breakin_Rube_Alert_06_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			Rube_Alert_Temp_6
			vol = 400
		}
	}
}
m_r2_breakin_Rube_Alert_07_struct = {
	default_priority = 90
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_breakin_Rube_Alert_07_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			Rube_Alert_Temp_7
			vol = 400
		}
	}
}
m_r2_breakin_Rube_Alert_08_struct = {
	default_priority = 90
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_breakin_Rube_Alert_08_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			Rube_Alert_Temp_8
			vol = 400
		}
	}
}
m_r2_breakin_Rube_OffWall_Alert_struct = {
	default_priority = 90
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_breakin_Rube_OffWall_Alert_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			Rube_Off_Alert_temp
			vol = 400
		}
	}
}
arcade_scroll_SFX_struct = {
	default_priority = 50
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 3
}
arcade_scroll_SFX_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_arcade_scroll
		}
	}
}
arcade_select_SFX_struct = {
	default_priority = 50
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
arcade_select_SFX_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_arcade_select
		}
	}
}
nail_the_manual_land_sfx_struct = {
	default_priority = 85
	default_buss = GoalFeedback
	norepeatfor = 0.3
	instancemanagement = stop_oldest
	instancelimit = 2
}
nail_the_manual_land_sfx_container = {
	command = playsound
	randomness = none
}
SK9_New_Show_Goal_Cam_struct = {
	default_priority = 60
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
SK9_New_Show_Goal_Cam_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_New_Show_Goal
			pitch = 75
			vol = 75
		}
	}
}
m_c1_impress_inst_01_struct = {
	default_priority = 60
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_impress_inst_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_impress_inst_Sk8tr1_01
			vol = 350
		}
	}
}
m_c1_impress_inst_02_struct = {
	default_priority = 60
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_impress_inst_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_impress_inst_Sk8tr1_02
			vol = 350
		}
	}
}
m_c1_impress_inst_03_struct = {
	default_priority = 60
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_impress_inst_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_impress_inst_Sk8tr2_03
			vol = 350
		}
	}
}
m_c1_impress_inst_04_struct = {
	default_priority = 60
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_impress_inst_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_impress_inst_Sk8tr2_04
			vol = 350
		}
	}
}
m_c1_impress_inst_skater1_impressed_struct = {
	default_priority = 60
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_impress_inst_skater1_impressed_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			skatermale1_cheerland_02
			vol = 350
		}
		sound2 = {
			skatermale1_cheerland_03
			vol = 350
		}
		sound3 = {
			skatermale1_cheerland_04
			vol = 350
		}
		sound4 = {
			skatermale1_cheerland_05
			vol = 350
		}
		sound5 = {
			skatermale1_cheerland_06
			vol = 350
		}
		sound6 = {
			skatermale1_cheerland_10
			vol = 350
		}
		sound7 = {
			skatermale1_cheerland_08
			vol = 350
		}
		sound8 = {
			skatermale1_cheerland_09
			vol = 350
		}
	}
}
m_c1_impress_inst_skater2_impressed_struct = {
	default_priority = 60
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_impress_inst_skater2_impressed_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			skatermale2_cheerlead_01
			vol = 350
		}
		sound2 = {
			skatermale2_cheerlead_02
			vol = 350
		}
		sound3 = {
			skatermale2_cheerlead_03
			vol = 350
		}
		sound4 = {
			skatermale2_cheerlead_04
			vol = 350
		}
		sound5 = {
			skatermale2_cheerlead_07
			vol = 350
		}
		sound6 = {
			skatermale2_cheerlead_09
			vol = 350
		}
		sound7 = {
			skatermale2_cheerlead_10
			vol = 350
		}
		sound8 = {
			skatermale2_cheerlead_11
			vol = 350
		}
	}
}
SK9_show_waypoint_sfx_struct = {
	default_priority = 60
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
SK9_show_waypoint_sfx_container = {
	command = playsound
	randomness = none
}
SK9_New_Show_Goal_in_Classic_struct = {
	default_priority = 60
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
SK9_New_Show_Goal_in_Classic_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_New_Show_Goal
			vol = 125
		}
	}
}
sk9_New_OB_Alarm_struct = {
	default_priority = 60
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_New_OB_Alarm_container = {
	command = playsound
	randomness = none
}
sk9_PED_Drumming_struct = {
	default_priority = 50
	default_buss = generic_male
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_PED_Drumming_container = {
	command = playsound
	randomness = randomnorepeattype
}
sk9_Photo_Aperture_In_struct = {
	default_priority = 50
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Photo_Aperture_In_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_photo_Aperture_In
			vol = 250
		}
	}
}
sk9_Photo_Aperture_Out_struct = {
	default_priority = 50
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Photo_Aperture_Out_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_photo_Aperture_Out
			vol = 250
		}
	}
}
sk9_m_h1_KickNow_SFX_struct = {
	default_priority = 80
	default_buss = slomo
	norepeatfor = 0.5
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_m_h1_KickNow_SFX_container = {
	command = playsound
	randomness = none
}
m_r2_Breakin_Guard_Alarm_struct = {
	default_priority = 70
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_Breakin_Guard_Alarm_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r2_Breakin_Guard_Alarm
			vol = 300
		}
	}
}
VO_m_r2_breakin_inst_01_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_breakin_inst_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r2_breakin_inst_01
			vol = 350
		}
	}
}
sk9_Hammer_CarHood_struct = {
	default_priority = 50
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Hammer_CarHood_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_Hammer_CarHood
			vol = 200
		}
	}
}
sk9_Hammer_Concrete_struct = {
	default_priority = 50
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Hammer_Concrete_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_Hammer_Concrete
			vol = 200
		}
	}
}
sk9_Hammer_SolidMetal_struct = {
	default_priority = 50
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Hammer_SolidMetal_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_Hammer_SolidMetal
			vol = 200
		}
	}
}
sk9_Hammer_Wood_struct = {
	default_priority = 50
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Hammer_Wood_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_Hammer_Wood
			vol = 200
		}
	}
}
Sk9_Rain_Loop_Heavy_struct = {
	default_priority = 50
	default_buss = rain
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Sk9_Rain_Loop_Heavy_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			Sk9_Rain_Heavy_Loop
			vol = 0
			num_loops = -1
			pan1y = 0.2
			pan2y = 0.2
			pan1x = -1
			pan2x = 1
		}
	}
}
Sk9_Rain_Loop_Light_struct = {
	default_priority = 50
	default_buss = rain
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Sk9_Rain_Loop_Light_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			Sk9_Rain_Light_Loop
			vol = 0
			num_loops = -1
			pan1y = 0.2
			pan2y = 0.2
			pan1x = -1
			pan2x = 1
		}
	}
}
sk9_Water_Loop_1_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 4
}
sk9_Water_Loop_1_container = {
	command = obj_playsound
	randomness = none
}
sk9_Water_Loop_2_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 3
}
sk9_Water_Loop_2_container = {
	command = obj_playsound
	randomness = none
}
sk9_Revolving_Door_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
}
sk9_Revolving_Door_container = {
	command = obj_playsound
	randomness = none
}
sk9_Globe_Spinning_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Globe_Spinning_container = {
	command = obj_playsound
	randomness = none
}
sk9_Secret_Pipe_Loop_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Secret_Pipe_Loop_container = {
	command = obj_playsound
	randomness = none
}
sk9_Secret_Grate_Breaking_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Secret_Grate_Breaking_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_Secret_Grate_Breaking
			vol = 300
		}
	}
}
sk9_Misc_Foliage_struct = {
	default_priority = 85
	default_buss = Foliage
	norepeatfor = 0.5
	instancemanagement = ignore
	instancelimit = 1
}
sk9_Misc_Foliage_container = {
	command = playsound
	randomness = none
}
sk9_speed_sign_sfx_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_speed_sign_sfx_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_Speed_Sign_SFX
			vol = 200
		}
	}
}
m_h1_bigspines_inst_01_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h1_bigspines_inst_01_container = {
	command = playsound
	randomness = none
}
m_h1_bigspines_inst_02_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h1_bigspines_inst_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h1_bigspines_inst_02
			vol = 350
		}
	}
}
m_h1_bigspines_inst_03_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h1_bigspines_inst_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h1_bigspines_inst_03
			vol = 350
		}
	}
}
m_h1_bigspines_inst_04_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h1_bigspines_inst_04_container = {
	command = playsound
	randomness = none
}
m_h1_bigspines_Positives_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 10
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h1_bigspines_Positives_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
}
m_h1_bigspines_Positives_02_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 10
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h1_bigspines_Positives_02_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			m_h1_bigspines_inc_pos_01
			vol = 350
		}
		sound2 = {
			m_h1_bigpush_inc_pos_02
			vol = 350
		}
		sound3 = {
			m_h1_bigpush_inc_pos_01
			vol = 350
		}
	}
}
m_h1_bigspines_Negatives_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 20
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h1_bigspines_Negatives_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			m_h1_finalepic_inc_neg_01
			vol = 350
		}
		sound2 = {
			m_h1_finalepic_inc_neg_02
			vol = 350
		}
		sound3 = {
			m_h1_bigspines_inc_neg_01
			vol = 350
		}
		sound4 = {
			m_h1_bigspines_inc_neg_02
			vol = 350
		}
		sound5 = {
			m_h1_bigpush_inc_neg_01
			vol = 350
		}
		sound6 = {
			m_h1_bigpush_inc_neg_02
			vol = 350
		}
	}
}
Sk9_Love_Newspaper_Coin_SFX_struct = {
	default_priority = 85
	default_buss = zonesfx
	norepeatfor = 0.5
	instancemanagement = stop_oldest
	instancelimit = 2
}
Sk9_Love_Newspaper_Coin_SFX_container = {
	command = obj_playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_Newspaper_Coin_SFX
		}
	}
}
sk9_LovePark_Revolving_Door_struct = {
	default_priority = 80
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
}
sk9_LovePark_Revolving_Door_container = {
	command = obj_playsound
	randomness = none
}
Sk9_Love_SignExplode_Galleria_struct = {
	default_priority = 90
	default_buss = zonesfx
	norepeatfor = 0.5
	instancemanagement = stop_oldest
	instancelimit = 1
}
Sk9_Love_SignExplode_Galleria_container = {
	command = obj_playsound
	randomness = none
	sounds = {
		sound1 = {
			Sk9_LightExplo_Galleria
			vol = 250
			emitter = z_love_SFX_SFX_Explo_GalleriaSign_GHOST
			dropoff = 100
		}
	}
}
Sk9_Love_SignExplode_Philly_struct = {
	default_priority = 90
	default_buss = zonesfx
	norepeatfor = 0.5
	instancemanagement = stop_oldest
	instancelimit = 1
}
Sk9_Love_SignExplode_Philly_container = {
	command = obj_playsound
	randomness = none
	sounds = {
		sound1 = {
			Sk9_LightExplo_Philly
			vol = 200
			emitter = z_love_SFX_SFX_Explo_PhillySign_GHOST
			dropoff = 100
		}
	}
}
Sk9_Love_SignExplode_Parking_struct = {
	default_priority = 90
	default_buss = zonesfx
	norepeatfor = 0.5
	instancemanagement = stop_oldest
	instancelimit = 1
}
Sk9_Love_SignExplode_Parking_container = {
	command = obj_playsound
	randomness = none
	sounds = {
		sound1 = {
			Sk9_LightExplo_Philly
			vol = 150
			pitch = 115
			emitter = z_love_SFX_SFX_Explo_ParkingSign_GHOST
			dropoff = 100
		}
	}
}
Sk9_Love_GrateExplo_Subway_struct = {
	default_priority = 90
	default_buss = zonesfx
	norepeatfor = 0.5
	instancemanagement = stop_oldest
	instancelimit = 1
}
Sk9_Love_GrateExplo_Subway_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			SK8_Metal_Fence_Break_01
			vol = 300
		}
	}
}
sk9_Love_Fountain_Spray_SFX_struct = {
	default_priority = 80
	default_buss = zonesfx
	norepeatfor = 0.120000005
	instancemanagement = ignore
	instancelimit = 10
}
sk9_Love_Fountain_Spray_SFX_container = {
	command = obj_playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			sk9_Love_Fountain_Spray_01
			emitter = z_love_SFX_SFX_Fountain_Spray_GHOST
			dropoff = 100
			dropoff_function = inv_exponential
			randomvol = {
				type = randomrangetype
				vals = [
					100
					130
				]
			}
			randompitch = {
				type = randomrangetype
				vals = [
					95
					105
				]
			}
		}
		sound2 = {
			sk9_Love_Fountain_Spray_02
			emitter = z_love_SFX_SFX_Fountain_Spray_GHOST
			dropoff = 100
			dropoff_function = inv_exponential
			randomvol = {
				type = randomrangetype
				vals = [
					100
					130
				]
			}
			randompitch = {
				type = randomrangetype
				vals = [
					95
					105
				]
			}
		}
	}
}
sk9_Love_Seethru_Waterfall_Loop_struct = {
	default_priority = 90
	default_buss = zonesfx
	norepeatfor = 0.5
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Love_Seethru_Waterfall_Loop_container = {
	command = obj_playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_Water_Loop_1
			vol = 200
			num_loops = -1
			emitter = z_love_SFX_SFX_Emitter_Seethru_Waterfall
			dropoff_function = inv_exponential
		}
	}
}
sk9_Love_Seethru_Waterfall_Loop_Inside_struct = {
	default_priority = 90
	default_buss = zonesfx
	norepeatfor = 0.5
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Love_Seethru_Waterfall_Loop_Inside_container = {
	command = obj_playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_Water_Loop_1
			vol = 200
			num_loops = -1
			emitter = z_love_SFX_SFX_Emitter_Seethru_Waterfall02
			dropoff_function = inv_exponential
		}
	}
}
Sk9_Love_Corner_Fountain_01_SFX_struct = {
	default_priority = 90
	default_buss = zonesfx
	norepeatfor = 0.5
	instancemanagement = stop_oldest
	instancelimit = 1
}
Sk9_Love_Corner_Fountain_01_SFX_container = {
	command = obj_playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_Water_Loop_2
			vol = 200
			num_loops = -1
			emitter = z_love_SFX_SFX_Emitter_Love_Corner_Fountain_01
			dropoff_function = inv_exponential
		}
	}
}
Sk9_Love_Corner_Fountain_02_SFX_struct = {
	default_priority = 90
	default_buss = zonesfx
	norepeatfor = 0.5
	instancemanagement = stop_oldest
	instancelimit = 1
}
Sk9_Love_Corner_Fountain_02_SFX_container = {
	command = obj_playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_Water_Loop_2
			vol = 200
			pitch = 95
			num_loops = -1
			emitter = z_love_SFX_SFX_Emitter_Love_Corner_Fountain_02
			dropoff_function = inv_exponential
		}
	}
}
Sk9_Love_Corner_Fountain_03_SFX_struct = {
	default_priority = 90
	default_buss = zonesfx
	norepeatfor = 0.5
	instancemanagement = stop_oldest
	instancelimit = 1
}
Sk9_Love_Corner_Fountain_03_SFX_container = {
	command = obj_playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_Water_Loop_2
			vol = 200
			pitch = 105
			num_loops = -1
			emitter = z_love_SFX_SFX_Emitter_Love_Corner_Fountain_03
			dropoff_function = inv_exponential
		}
	}
}
Sk9_Love_Corner_StepOn_Fountain_Loop_SFX_struct = {
	default_priority = 90
	default_buss = zonesfx
	norepeatfor = 0.5
	instancemanagement = stop_oldest
	instancelimit = 1
}
Sk9_Love_Corner_StepOn_Fountain_Loop_SFX_container = {
	command = obj_playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_Water_Loop_1
			vol = 155
			randompitch = {
				type = randomrangetype
				vals = [
					120
					140
				]
			}
			num_loops = -1
			dropoff = 50
			dropoff_function = inv_exponential
		}
	}
}
VO_m_r2_Skateoff_chkp2ap1_struct = {
	default_priority = 80
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_Skateoff_chkp2ap1_container = {
	command = obj_playsound
	randomness = none
}
VO_m_r2_Skateoff_chkp2ap2_struct = {
	default_priority = 80
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_Skateoff_chkp2ap2_container = {
	command = obj_playsound
	randomness = none
}
VO_m_r2_Skateoff_chkp2p1_struct = {
	default_priority = 80
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_Skateoff_chkp2p1_container = {
	command = obj_playsound
	randomness = none
}
VO_m_r2_Skateoff_chkp2p2_struct = {
	default_priority = 80
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_Skateoff_chkp2p2_container = {
	command = obj_playsound
	randomness = none
}
VO_m_r2_Skateoff_chkp3ap1_struct = {
	default_priority = 80
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_Skateoff_chkp3ap1_container = {
	command = obj_playsound
	randomness = none
}
VO_m_r2_Skateoff_chkp3p1_struct = {
	default_priority = 80
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_Skateoff_chkp3p1_container = {
	command = obj_playsound
	randomness = none
}
VO_m_r2_Skateoff_chkp3p2_struct = {
	default_priority = 80
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_Skateoff_chkp3p2_container = {
	command = obj_playsound
	randomness = none
}
VO_m_r2_Skateoff_chkp4ap1_struct = {
	default_priority = 80
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_Skateoff_chkp4ap1_container = {
	command = obj_playsound
	randomness = none
}
VO_m_r2_Skateoff_chkp4ap2_struct = {
	default_priority = 80
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_Skateoff_chkp4ap2_container = {
	command = obj_playsound
	randomness = none
}
VO_m_r2_Skateoff_chkp4ap3_struct = {
	default_priority = 80
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_Skateoff_chkp4ap3_container = {
	command = obj_playsound
	randomness = none
}
VO_m_r2_Skateoff_chkp4p1_struct = {
	default_priority = 80
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_Skateoff_chkp4p1_container = {
	command = obj_playsound
	randomness = none
}
VO_m_r2_Skateoff_chkp4p2_struct = {
	default_priority = 80
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_Skateoff_chkp4p2_container = {
	command = obj_playsound
	randomness = none
}
VO_m_r2_Skateoff_chkp5ap1_struct = {
	default_priority = 80
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_Skateoff_chkp5ap1_container = {
	command = obj_playsound
	randomness = none
}
VO_m_r2_Skateoff_chkp5ap2_struct = {
	default_priority = 80
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_Skateoff_chkp5ap2_container = {
	command = obj_playsound
	randomness = none
}
VO_m_r2_Skateoff_chkp5p1_struct = {
	default_priority = 80
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_Skateoff_chkp5p1_container = {
	command = obj_playsound
	randomness = none
}
VO_m_r2_Skateoff_chkp5p2_struct = {
	default_priority = 80
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_Skateoff_chkp5p2_container = {
	command = obj_playsound
	randomness = none
}
VO_m_r2_Skateoff_BAM_Negatives_01_struct = {
	default_priority = 60
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_Skateoff_BAM_Negatives_01_container = {
	command = obj_playsound
	randomness = none
}
VO_m_r2_Skateoff_BAM_Negatives_02_struct = {
	default_priority = 60
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_Skateoff_BAM_Negatives_02_container = {
	command = obj_playsound
	randomness = none
}
VO_m_r2_Skateoff_BAM_Negatives_03_struct = {
	default_priority = 60
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_Skateoff_BAM_Negatives_03_container = {
	command = obj_playsound
	randomness = none
}
VO_m_r2_Skateoff_BAM_Negatives_04_struct = {
	default_priority = 60
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_Skateoff_BAM_Negatives_04_container = {
	command = obj_playsound
	randomness = none
}
VO_m_r2_Skateoff_BAM_Negatives_05_struct = {
	default_priority = 60
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_Skateoff_BAM_Negatives_05_container = {
	command = obj_playsound
	randomness = none
}
VO_m_r2_Skateoff_Crew_Negatives_01_struct = {
	default_priority = 60
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_Skateoff_Crew_Negatives_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			TEMP_VO_Crew_Negatives_01
			vol = 400
		}
	}
}
VO_m_r2_Skateoff_Crew_Negatives_02_struct = {
	default_priority = 60
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_Skateoff_Crew_Negatives_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			TEMP_VO_Crew_Negatives_02
			vol = 400
		}
	}
}
VO_m_r2_Skateoff_Crew_Negatives_03_struct = {
	default_priority = 60
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_Skateoff_Crew_Negatives_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			TEMP_VO_Crew_Negatives_03
			vol = 400
		}
	}
}
sk9_m_r2_skateoff_platform_SFX_struct = {
	default_priority = 70
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_m_r2_skateoff_platform_SFX_container = {
	command = playsound
	randomness = none
}
Hit_Glass_Railing_struct = {
	default_priority = 60
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Hit_Glass_Railing_container = {
	command = playsound
	randomness = none
}
sk9_Street_Lamp_Break_struct = {
	default_priority = 60
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
}
sk9_Street_Lamp_Break_container = {
	command = playsound
	randomness = none
}
sk9_Water_Boost_struct = {
	default_priority = 60
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Water_Boost_container = {
	command = playsound
	randomness = none
}
sk9_Door_Open_Automatic_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
}
sk9_Door_Open_Automatic_container = {
	command = obj_playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_Door_Open
		}
	}
}
sk9_Door_Open_1_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
}
sk9_Door_Open_1_container = {
	command = obj_playsound
	randomness = none
}
sk9_Door_Open_2_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
}
sk9_Door_Open_2_container = {
	command = obj_playsound
	randomness = none
}
sk9_Door_Open_3_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
}
sk9_Door_Open_3_container = {
	command = obj_playsound
	randomness = none
}
sk9_Door_Open_4_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
}
sk9_Door_Open_4_container = {
	command = obj_playsound
	randomness = none
}
sk9_Glass_Break_Big_1_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Glass_Break_Big_1_container = {
	command = playsound
	randomness = none
}
sk9_Glass_Break_Big_2_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Glass_Break_Big_2_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_Glass_Break_Big_2
		}
	}
}
photo_saved_sfx_struct = {
	default_priority = 80
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
photo_saved_sfx_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			small_positive_message_01
			vol = 75
		}
	}
}
Sk9_Tesla_Sparks_SFX_struct = {
	default_priority = 85
	default_buss = zonesfx
	norepeatfor = 0.15
	instancemanagement = ignore
	instancelimit = 10
}
Sk9_Tesla_Sparks_SFX_container = {
	command = playsound
	randomness = none
}
VO_m_r1_demo_chk1_pt1_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r1_demo_chk1_pt1_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_demo_inst_01
			vol = 350
		}
	}
}
VO_m_r1_demo_chk1_pt2_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r1_demo_chk1_pt2_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_demo_inst_02
			vol = 350
		}
	}
}
VO_m_r1_demo_chk2_pt1_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r1_demo_chk2_pt1_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_demo_inst_03
			vol = 350
		}
	}
}
VO_m_r1_demo_chk2_pt2_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r1_demo_chk2_pt2_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_demo_inst_04
			vol = 350
		}
	}
}
VO_m_r1_demo_chk3_pt1_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r1_demo_chk3_pt1_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_demo_inst_05
			vol = 350
		}
	}
}
VO_m_r1_demo_chk3_pt2_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r1_demo_chk3_pt2_container = {
	command = playsound
	randomness = none
}
VO_m_r1_demo_chk4_pt2_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r1_demo_chk4_pt2_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_demo_inst_08
			vol = 350
		}
	}
}
VO_m_r1_demo_chk4_pt3_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r1_demo_chk4_pt3_container = {
	command = playsound
	randomness = none
}
VO_m_r1_demo_chk4_pt4_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r1_demo_chk4_pt4_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_demo_inst_10
			vol = 350
		}
	}
}
VO_m_r1_demo_chk4_pt5_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r1_demo_chk4_pt5_container = {
	command = playsound
	randomness = none
}
VO_m_r1_demo_chk4_pt6_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r1_demo_chk4_pt6_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_demo_inst_12
			vol = 350
		}
	}
}
VO_m_r1_demo_chk4_pt7_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r1_demo_chk4_pt7_container = {
	command = playsound
	randomness = none
}
PhotoSFX_page_turn_struct = {
	default_priority = 50
	default_buss = pausemenu
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
PhotoSFX_page_turn_container = {
	command = playsound
	randomness = none
}
Sk9_Mall_Fountain_SFX_struct = {
	default_priority = 90
	default_buss = zonesfx
	norepeatfor = 0.5
	instancemanagement = stop_oldest
	instancelimit = 1
}
Sk9_Mall_Fountain_SFX_container = {
	command = obj_playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_Water_Loop_2
			vol = 400
			num_loops = -1
			emitter = z_love_SFX_SFX_Emitter_Mall_Fountain_01
			dropoff_function = inv_exponential
		}
	}
}
Sk9_Museums_Radio_Transmission_Rocket_SFX_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 5
	instancemanagement = ignore
	instancelimit = 2
}
Sk9_Museums_Radio_Transmission_Rocket_SFX_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			Sk9_Museums_Radio_Static_01
			vol = 200
		}
		sound2 = {
			Sk9_Museums_Radio_Static_02
			vol = 200
		}
		sound3 = {
			Sk9_Museums_Radio_Static_03
			vol = 200
		}
		sound4 = {
			Sk9_Museums_Radio_Static_04
			vol = 200
		}
		sound5 = {
			Sk9_Museums_Radio_Static_05
			vol = 200
		}
	}
}
Sk9_Museums_SolarPanel_Shatter_struct = {
	default_priority = 90
	default_buss = zonesfx
	norepeatfor = 0.5
	instancemanagement = stop_oldest
	instancelimit = 1
}
Sk9_Museums_SolarPanel_Shatter_container = {
	command = obj_playsound
	randomness = none
	sounds = {
		sound1 = {
			Sk9_LightExplo_Philly
			vol = 150
		}
		sound1 = {
			Sk9_LightExplo_Galleria
			vol = 150
		}
	}
}
Sk9_Museums_Radio_Transmission_SatDish_SFX_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 5
	instancemanagement = ignore
	instancelimit = 2
}
Sk9_Museums_Radio_Transmission_SatDish_SFX_container = {
	command = playsound
	randomness = none
}
sk9_Museums_Toilet_Flush_South_struct = {
	default_priority = 85
	default_buss = zonesfx
	norepeatfor = 0.5
	instancemanagement = ignore
	instancelimit = 1
}
sk9_Museums_Toilet_Flush_South_container = {
	command = playsound
	randomness = none
}
sk9_Museums_Toilet_Flush_North_struct = {
	default_priority = 85
	default_buss = zonesfx
	norepeatfor = 0.5
	instancemanagement = ignore
	instancelimit = 1
}
sk9_Museums_Toilet_Flush_North_container = {
	command = playsound
	randomness = none
}
sk9_Museums_ArtGallery_Doors_struct = {
	default_priority = 85
	default_buss = zonesfx
	norepeatfor = 0.5
	instancemanagement = ignore
	instancelimit = 1
}
sk9_Museums_ArtGallery_Doors_container = {
	command = playsound
	randomness = none
}
Sk9_Museums_Cannon_Move_North_struct = {
	default_priority = 85
	default_buss = zonesfx
	norepeatfor = 0.5
	instancemanagement = ignore
	instancelimit = 1
}
Sk9_Museums_Cannon_Move_North_container = {
	command = playsound
	randomness = none
}
Sk9_Museums_Cannon_Move_South_struct = {
	default_priority = 85
	default_buss = zonesfx
	norepeatfor = 0.5
	instancemanagement = ignore
	instancelimit = 1
}
Sk9_Museums_Cannon_Move_South_container = {
	command = playsound
	randomness = none
}
Sk9_Museums_Cannon_Fire_North_struct = {
	default_priority = 85
	default_buss = zonesfx
	norepeatfor = 0.5
	instancemanagement = ignore
	instancelimit = 1
}
Sk9_Museums_Cannon_Fire_North_container = {
	command = playsound
	randomness = none
}
Sk9_Museums_Cannon_Fire_South_struct = {
	default_priority = 85
	default_buss = zonesfx
	norepeatfor = 0.5
	instancemanagement = ignore
	instancelimit = 1
}
Sk9_Museums_Cannon_Fire_South_container = {
	command = playsound
	randomness = none
}
VO_m_c1_Film2_Outro_struct = {
	default_priority = 80
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c1_Film2_Outro_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_film2_tr_02_gp
			vol = 350
		}
	}
}
sk9_Foliage_struct = {
	default_priority = 65
	default_buss = Foliage
	norepeatfor = 0.2
	instancemanagement = stop_oldest
	instancelimit = 4
}
sk9_Foliage_container = {
	command = playsound
	randomness = randomnorepeattype
}
Focus_Out_HighFreq_struct = {
	default_priority = 50
	default_buss = slomo
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Focus_Out_HighFreq_container = {
	command = playsound
	randomness = none
}
sk8_Roof_Scuffs_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk8_Roof_Scuffs_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk8_terr_roof_scuff_02
		}
		sound2 = {
			sk8_terr_roof_scuff_05
		}
	}
}
sk8_BonkChainLink_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk8_BonkChainLink_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			BonkChainlink
		}
	}
}
sk8_Explode_Chain_Link_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk8_Explode_Chain_Link_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			SK8_Explode_Chain_Link
		}
	}
}
sk9_Roof_Scuffs_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Roof_Scuffs_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk8_terr_roof_scuff_06
		}
		sound2 = {
			sk8_terr_roof_scuff_07
		}
	}
}
midgoal_rank_sfx_struct = {
	default_priority = 50
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
midgoal_rank_sfx_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_midgoal_rank
			vol = 110
		}
	}
}
NTM_scrape_SFX_struct = {
	default_priority = 50
	default_buss = SkaterLands
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
NTM_scrape_SFX_container = {
	command = obj_playsound
	randomness = none
}
sk9_Lever_Move_struct = {
	default_priority = 60
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Lever_Move_container = {
	command = playsound
	randomness = none
}
sk9_Cart_Loop_struct = {
	default_priority = 50
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Cart_Loop_container = {
	command = playsound
	randomness = none
}
sk9_Cart_Start_struct = {
	default_priority = 50
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Cart_Start_container = {
	command = playsound
	randomness = none
}
Cash_SFX_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 0.5
	instancemanagement = stop_oldest
	instancelimit = 1
}
Cash_SFX_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			cash
			vol = 150
		}
	}
}
Wood_Shatter_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 0.3
	instancemanagement = stop_oldest
	instancelimit = 1
}
Wood_Shatter_container = {
	command = playsound
	randomness = none
}
WoodBreak_Lansdowne_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 0.3
	instancemanagement = stop_oldest
	instancelimit = 1
}
WoodBreak_Lansdowne_container = {
	command = playsound
	randomness = none
}
Goal_UI_Negative_Text_Loud_struct = {
	default_priority = 50
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Goal_UI_Negative_Text_Loud_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			small_negative_message_01
			vol = 160
		}
	}
}
GoalFail_NoMusicMessing_struct = {
	default_priority = 95
	default_buss = frontend
	norepeatfor = 0.3
	instancemanagement = ignore
	instancelimit = 4
}
GoalFail_NoMusicMessing_container = {
	command = playsound
	randomness = none
}
sk9_Water_Loop_4_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 4
}
sk9_Water_Loop_4_container = {
	command = obj_playsound
	randomness = none
}
sk9_Water_Loop_3_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 4
}
sk9_Water_Loop_3_container = {
	command = obj_playsound
	randomness = none
}
ms_phone_1_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
ms_phone_1_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_1
			vol = 375
		}
	}
}
hawk_find_me_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
hawk_find_me_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			hawk_find_me
			vol = 360
		}
	}
}
m_c3_photo2_intro_1_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c3_photo2_intro_1_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c3_photo2_gp_01
			vol = 350
		}
	}
}
m_c3_Photo2_intro_2_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c3_Photo2_intro_2_container = {
	command = playsound
	randomness = none
}
m_c3_Photo2_intro_3_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c3_Photo2_intro_3_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c3_photo2_gp_05
			vol = 350
		}
	}
}
m_c3_Photo2_Negatives_struct = {
	default_priority = 60
	default_buss = GoalVO_DRY
	norepeatfor = 15
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c3_Photo2_Negatives_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			m_c3_photo2_gp_06
			vol = 350
		}
		sound2 = {
			m_c3_photo2_gp_08
			vol = 350
		}
		sound3 = {
			m_c3_photo2_inc_neg_05
			vol = 350
		}
		sound4 = {
			m_c3_photo2_inc_neg_02
			vol = 350
		}
		sound5 = {
			m_c3_photo2_inc_neg_03
			vol = 350
		}
		sound6 = {
			m_c3_photo2_inc_oops_03
			vol = 350
		}
		sound7 = {
			m_c3_photo2_inc_oops_05
			vol = 350
		}
	}
}
m_c3_photo2_positives_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 15
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c3_photo2_positives_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			m_c3_photo2_gp_09
			vol = 350
		}
		sound2 = {
			m_c3_photo2_gp_11
			vol = 350
		}
		sound3 = {
			m_c3_photo2_inc_pos_01
			vol = 350
		}
		sound4 = {
			m_c3_photo2_inc_pos_02
			vol = 350
		}
		sound5 = {
			m_c3_photo2_inc_pos_03
			vol = 350
		}
		sound6 = {
			m_c3_photo2_inc_pos_04
			vol = 350
		}
		sound7 = {
			m_c3_photo2_inc_pos_05
			vol = 350
		}
	}
}
m_c3_photo2_Negatives_Fall_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 15
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c3_photo2_Negatives_Fall_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			m_c3_photo2_gp_07
			vol = 350
		}
		sound2 = {
			m_c3_photo2_gp_10
			vol = 350
		}
		sound3 = {
			m_c3_photo2_inc_neg_01
			vol = 350
		}
		sound4 = {
			m_c3_photo2_inc_neg_04
			vol = 350
		}
		sound5 = {
			m_c3_photo2_inc_neg_06
			vol = 350
		}
		sound6 = {
			m_c3_photo2_inc_neg_07
			vol = 350
		}
		sound7 = {
			m_c3_photo2_inc_oops_04
			vol = 350
		}
	}
}
Sk9_BW_Bridge_Log_Movement_Up_SFX_struct = {
	default_priority = 60
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 3
}
Sk9_BW_Bridge_Log_Movement_Up_SFX_container = {
	command = playsound
	randomness = none
}
Sk9_BW_Bridge_Log_Movement_Down_SFX_struct = {
	default_priority = 60
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 3
}
Sk9_BW_Bridge_Log_Movement_Down_SFX_container = {
	command = playsound
	randomness = none
}
VO_m_r2_show1_inst_01_struct = {
	default_priority = 70
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_show1_inst_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			r2_show1_inst_01
			vol = 350
		}
	}
}
VO_m_r2_show1_inst_02_struct = {
	default_priority = 70
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_show1_inst_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			r2_show1_inst_02
			vol = 350
		}
	}
}
VO_m_r2_show1_inst_03_struct = {
	default_priority = 70
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_show1_inst_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			r2_show1_inst_03
			vol = 350
		}
	}
}
VO_m_r2_show1_inst_04_struct = {
	default_priority = 70
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_show1_inst_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			r2_show1_inst_04
			vol = 350
		}
	}
}
VO_m_r2_show1_inst_05_struct = {
	default_priority = 70
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_show1_inst_05_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			r2_show1_inst_05
			vol = 350
		}
	}
}
VO_m_r2_show1_inst_06_struct = {
	default_priority = 70
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_show1_inst_06_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			r2_show1_inst_06
			vol = 350
		}
	}
}
VO_m_r2_show1_inst_07_struct = {
	default_priority = 70
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_show1_inst_07_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			r2_show1_inst_07
			vol = 350
		}
	}
}
VO_m_r2_show1_inst_08_struct = {
	default_priority = 70
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_show1_inst_08_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			r2_show1_inst_08
			vol = 350
		}
	}
}
VO_m_r2_show1_inst_09_struct = {
	default_priority = 70
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_show1_inst_09_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			r2_show1_inst_09
			vol = 350
		}
	}
}
VO_m_r2_show1_inst_10_struct = {
	default_priority = 70
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_show1_inst_10_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			r2_show1_inst_10
			vol = 350
		}
	}
}
VO_m_r2_show1_inst_11_struct = {
	default_priority = 70
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_show1_inst_11_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			r2_show1_inst_11
			vol = 350
		}
	}
}
VO_m_r2_show1_inst_12_struct = {
	default_priority = 70
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_show1_inst_12_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			r2_show1_inst_12
			vol = 350
		}
	}
}
VO_m_r2_show1_inst_13_struct = {
	default_priority = 70
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_show1_inst_13_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			r2_show1_inst_13
			vol = 350
		}
	}
}
VO_m_r2_show1_inst_14_struct = {
	default_priority = 70
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_show1_inst_14_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			r2_show1_inst_14
			vol = 350
		}
	}
}
VO_m_r2_show1_inst_15_struct = {
	default_priority = 70
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_show1_inst_15_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			r2_show1_inst_15
			vol = 350
		}
	}
}
VO_m_r2_show1_inst_16_struct = {
	default_priority = 70
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_show1_inst_16_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			r2_show1_inst_16
			vol = 350
		}
	}
}
VO_m_r2_show1_inst_17_struct = {
	default_priority = 70
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_show1_inst_17_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			r2_show1_inst_17
			vol = 350
		}
	}
}
m_r2_show1_Bam_Angry_At_Cart_struct = {
	default_priority = 70
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_show1_Bam_Angry_At_Cart_container = {
	command = obj_playsound
	randomness = randomnorepeattype
}
m_r2_Show1_Bam_Dies_struct = {
	default_priority = 70
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_Show1_Bam_Dies_container = {
	command = obj_playsound
	randomness = randomnorepeattype
}
m_r2_Show1_Bam_Fed_Up_struct = {
	default_priority = 70
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_Show1_Bam_Fed_Up_container = {
	command = obj_playsound
	randomness = none
}
m_r2_Show1_Bam_Sees_Train_struct = {
	default_priority = 70
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_Show1_Bam_Sees_Train_container = {
	command = obj_playsound
	randomness = none
}
m_r2_Show1_Bam_Warning_You_struct = {
	default_priority = 70
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_Show1_Bam_Warning_You_container = {
	command = obj_playsound
	randomness = randomnorepeattype
}
m_r2_Show2_Bam_Shouts_01_struct = {
	default_priority = 70
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_Show2_Bam_Shouts_01_container = {
	command = obj_playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r2_show2_inc_01
			vol = 400
			dropoff = 100
		}
	}
}
m_r2_Show2_Bam_Shouts_02_struct = {
	default_priority = 70
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_Show2_Bam_Shouts_02_container = {
	command = obj_playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r2_show2_inc_02
			vol = 400
			dropoff = 100
		}
	}
}
m_r2_Show2_Bam_Shouts_03_struct = {
	default_priority = 70
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_Show2_Bam_Shouts_03_container = {
	command = obj_playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r2_show2_inc_03
			vol = 400
			dropoff = 100
		}
	}
}
m_r2_Show2_Bam_Shouts_04_struct = {
	default_priority = 70
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_Show2_Bam_Shouts_04_container = {
	command = obj_playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r2_show2_inc_04
			vol = 400
			dropoff = 100
		}
	}
}
m_r2_Show2_Bam_Shouts_05_struct = {
	default_priority = 70
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_Show2_Bam_Shouts_05_container = {
	command = obj_playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r2_show2_inc_05
			vol = 400
			dropoff = 100
		}
	}
}
m_r2_Show2_Bam_Shouts_06_struct = {
	default_priority = 70
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_Show2_Bam_Shouts_06_container = {
	command = obj_playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r2_show2_inc_06
			vol = 400
			dropoff = 100
		}
	}
}
m_r2_Show2_Bam_Shouts_07_struct = {
	default_priority = 70
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_Show2_Bam_Shouts_07_container = {
	command = obj_playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r2_show2_inc_07
			vol = 400
			dropoff = 100
		}
	}
}
m_r2_Show2_Bam_Shouts_08_struct = {
	default_priority = 70
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_Show2_Bam_Shouts_08_container = {
	command = obj_playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r2_show2_inc_08
			vol = 400
			dropoff = 100
		}
	}
}
m_r2_Show2_Bam_Shouts_09_struct = {
	default_priority = 70
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_Show2_Bam_Shouts_09_container = {
	command = obj_playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r2_show2_inc_09
			vol = 400
			dropoff = 100
		}
	}
}
m_r2_Show2_Bam_Shouts_10_struct = {
	default_priority = 70
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_Show2_Bam_Shouts_10_container = {
	command = obj_playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r2_show2_inc_10
			vol = 400
			dropoff = 100
		}
	}
}
m_r2_Show2_Bam_Shouts_11_struct = {
	default_priority = 70
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_Show2_Bam_Shouts_11_container = {
	command = obj_playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r2_show2_inc_11
			vol = 400
			dropoff = 100
		}
	}
}
m_r2_Show2_Bam_Shouts_12_struct = {
	default_priority = 70
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_Show2_Bam_Shouts_12_container = {
	command = obj_playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r2_show2_inc_12
			vol = 400
			dropoff = 100
		}
	}
}
sk9_Z_Slums_Crane_Movement_struct = {
	default_priority = 50
	default_buss = vehicle
	norepeatfor = 0.5
	instancemanagement = stop_oldest
	instancelimit = 2
}
sk9_Z_Slums_Crane_Movement_container = {
	command = obj_playsound
	randomness = randomnorepeattype
}
sk9_Z_Slums_Crane_Movement2_struct = {
	default_priority = 50
	default_buss = vehicle
	norepeatfor = 0.5
	instancemanagement = stop_oldest
	instancelimit = 2
}
sk9_Z_Slums_Crane_Movement2_container = {
	command = obj_playsound
	randomness = randomnorepeattype
}
sk9_Z_Slums_Crane_Loop_struct = {
	default_priority = 50
	default_buss = vehicle
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Z_Slums_Crane_Loop_container = {
	command = obj_playsound
	randomness = none
}
sk9_Z_Slums_Train_Loop_struct = {
	default_priority = 60
	default_buss = Train
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Z_Slums_Train_Loop_container = {
	command = obj_playsound
	randomness = none
}
sk9_Slums_Metal_Break_struct = {
	default_priority = 60
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Slums_Metal_Break_container = {
	command = playsound
	randomness = none
}
sk9_Slums_Gate_Open_struct = {
	default_priority = 60
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Slums_Gate_Open_container = {
	command = playsound
	randomness = none
}
PhotoSFX_Take_Photo__Short_container = {
	command = playsound
	randomness = none
}
Hawk_CheerLand_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 10
	instancemanagement = ignore
	instancelimit = 1
}
Hawk_CheerLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			hawk_cheerland_09
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			hawk_cheerland_10
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			hawk_cheerland_01
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			hawk_cheerland_02
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			hawk_cheerland_03
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			hawk_cheerland_04
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			hawk_cheerland_05
			dropoff = 50
			dropoff_function = linear
		}
		sound8 = {
			hawk_cheerland_06
			dropoff = 50
			dropoff_function = linear
		}
		sound9 = {
			hawk_cheerland_07
			dropoff = 50
			dropoff_function = linear
		}
		sound10 = {
			hawk_cheerland_08
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Hawk_BooLand_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 20
	instancemanagement = ignore
	instancelimit = 1
}
Hawk_BooLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			hawk_booland_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			hawk_booland_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			hawk_booland_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			hawk_booland_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			hawk_booland_05
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Hawk_Attention_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
Hawk_Attention_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			hawk_attn_09
			dropoff = 50
			dropoff_function = linear
			vol = 75
		}
		sound2 = {
			hawk_attn_10
			dropoff = 50
			dropoff_function = linear
			vol = 75
		}
		sound3 = {
			hawk_attn_01
			dropoff = 50
			dropoff_function = linear
			vol = 75
		}
		sound4 = {
			hawk_attn_02
			dropoff = 50
			dropoff_function = linear
			vol = 75
		}
		sound5 = {
			hawk_attn_03
			dropoff = 50
			dropoff_function = linear
			vol = 75
		}
		sound6 = {
			hawk_attn_04
			dropoff = 50
			dropoff_function = linear
			vol = 75
		}
		sound7 = {
			hawk_attn_05
			dropoff = 50
			dropoff_function = linear
			vol = 75
		}
		sound8 = {
			hawk_attn_06
			dropoff = 50
			dropoff_function = linear
			vol = 75
		}
		sound9 = {
			hawk_attn_07
			dropoff = 50
			dropoff_function = linear
			vol = 75
		}
		sound10 = {
			hawk_attn_08
			dropoff = 50
			dropoff_function = linear
			vol = 75
		}
	}
}
Hawk_Impatient_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 20
	instancemanagement = ignore
	instancelimit = 1
}
Hawk_Impatient_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			hawk_impatient_04
			dropoff = 50
			dropoff_function = linear
			vol = 75
		}
		sound2 = {
			hawk_impatient_05
			dropoff = 50
			dropoff_function = linear
			vol = 75
		}
		sound3 = {
			hawk_impatient_01
			dropoff = 50
			dropoff_function = linear
			vol = 75
		}
		sound4 = {
			hawk_impatient_02
			dropoff = 50
			dropoff_function = linear
			vol = 75
		}
		sound5 = {
			hawk_impatient_03
			dropoff = 50
			dropoff_function = linear
			vol = 75
		}
	}
}
Hawk_KeepItUp_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 20
	instancemanagement = stop_oldest
	instancelimit = 1
}
Hawk_KeepItUp_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			hawk_keepitup_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			hawk_keepitup_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			hawk_keepitup_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			hawk_keepitup_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			hawk_keepitup_05
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Saari_Attention_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 10
	instancemanagement = ignore
	instancelimit = 1
}
Saari_Attention_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			saari_attn_05
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			saari_attn_06
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			saari_attn_07
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			saari_attn_08
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			saari_attn_09
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			saari_attn_01
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			saari_attn_02
			dropoff = 50
			dropoff_function = linear
		}
		sound8 = {
			saari_attn_03
			dropoff = 50
			dropoff_function = linear
		}
		sound9 = {
			saari_attn_04
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Saari_BooLand_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 10
	instancemanagement = ignore
	instancelimit = 1
}
Saari_BooLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			saari_booland_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			saari_booland_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			saari_booland_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			saari_booland_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			saari_booland_05
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			saari_booland_06
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			saari_booland_07
			dropoff = 50
			dropoff_function = linear
		}
		sound8 = {
			saari_booland_08
			dropoff = 50
			dropoff_function = linear
		}
		sound9 = {
			saari_booland_09
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Saari_BooLand_Stream_NON_AGENT_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 10
	instancemanagement = ignore
	instancelimit = 1
}
Saari_BooLand_Stream_NON_AGENT_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			saari_booland_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			saari_booland_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			saari_booland_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			saari_booland_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			saari_booland_05
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			saari_booland_06
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			saari_booland_07
			dropoff = 50
			dropoff_function = linear
		}
		sound8 = {
			saari_booland_08
			dropoff = 50
			dropoff_function = linear
		}
		sound9 = {
			saari_booland_09
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Saari_CheerLand_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 15
	instancemanagement = ignore
	instancelimit = 1
}
Saari_CheerLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			saari_cheerland_05
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			saari_cheerland_06
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			saari_cheerland_07
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			saari_cheerland_01
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			saari_cheerland_02
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			saari_cheerland_03
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			saari_cheerland_04
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Saari_CheerLand_Stream_NON_AGENT_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 15
	instancemanagement = ignore
	instancelimit = 1
}
Saari_CheerLand_Stream_NON_AGENT_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			saari_cheerland_05
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			saari_cheerland_06
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			saari_cheerland_07
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			saari_cheerland_01
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			saari_cheerland_02
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			saari_cheerland_03
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			saari_cheerland_04
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Saari_Impatient_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 20
	instancemanagement = ignore
	instancelimit = 1
}
Saari_Impatient_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			saari_impatient_05
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			saari_impatient_01
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			saari_impatient_02
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			saari_impatient_03
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			saari_impatient_04
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Saari_KeepItUp_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 25
	instancemanagement = ignore
	instancelimit = 1
}
Saari_KeepItUp_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			saari_keepitup_03
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			saari_keepitup_04
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			saari_keepitup_01
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			saari_keepitup_02
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Hawk_Avoid_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 20
	instancemanagement = ignore
	instancelimit = 1
}
Hawk_Avoid_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			hawk_avoid_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			hawk_avoid_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			hawk_avoid_03
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Saari_Avoid_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 20
	instancemanagement = ignore
	instancelimit = 1
}
Saari_Avoid_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			saari_avoid_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			saari_avoid_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			saari_avoid_03
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Margera_Attention_Stream_struct = {
	default_priority = 75
	default_buss = ProCallouts_WET
	norepeatfor = 20
	instancemanagement = ignore
	instancelimit = 1
}
Margera_Attention_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			margera_attn_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			margera_attn_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			margera_attn_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			margera_attn_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			margera_attn_05
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			margera_attn_06
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			margera_attn_07
			dropoff = 50
			dropoff_function = linear
		}
		sound8 = {
			margera_attn_08
			dropoff = 50
			dropoff_function = linear
		}
		sound9 = {
			margera_attn_09
			dropoff = 50
			dropoff_function = linear
		}
		sound10 = {
			margera_attn_10
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Margera_Avoid_Stream_struct = {
	default_priority = 75
	default_buss = ProCallouts_WET
	norepeatfor = 20
	instancemanagement = ignore
	instancelimit = 1
}
Margera_Avoid_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			margera_avoid_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			margera_avoid_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			margera_avoid_03
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Margera_BooLand_Stream_struct = {
	default_priority = 75
	default_buss = ProCallouts_WET
	norepeatfor = 15
	instancemanagement = ignore
	instancelimit = 1
}
Margera_BooLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			margera_booland_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			margera_booland_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			margera_booland_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			margera_booland_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			margera_booland_05
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			margera_booland_06
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			margera_booland_07
			dropoff = 50
			dropoff_function = linear
		}
		sound8 = {
			margera_booland_08
			dropoff = 50
			dropoff_function = linear
		}
		sound9 = {
			margera_booland_09
			dropoff = 50
			dropoff_function = linear
		}
		sound10 = {
			margera_booland_10
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Margera_CheerLand_Stream_struct = {
	default_priority = 75
	default_buss = ProCallouts_WET
	norepeatfor = 15
	instancemanagement = ignore
	instancelimit = 1
}
Margera_CheerLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			margera_cheerland_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			margera_cheerland_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			margera_cheerland_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			margera_cheerland_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			margera_cheerland_05
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			margera_cheerland_06
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			margera_cheerland_07
			dropoff = 50
			dropoff_function = linear
		}
		sound8 = {
			margera_cheerland_08
			dropoff = 50
			dropoff_function = linear
		}
		sound9 = {
			margera_cheerland_09
			dropoff = 50
			dropoff_function = linear
		}
		sound10 = {
			margera_cheerland_10
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Margera_Impatient_Stream_struct = {
	default_priority = 75
	default_buss = ProCallouts_WET
	norepeatfor = 20
	instancemanagement = ignore
	instancelimit = 1
}
Margera_Impatient_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			margera_impatient_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			margera_impatient_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			margera_impatient_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			margera_impatient_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			margera_impatient_05
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Margera_KeepItUp_Stream_struct = {
	default_priority = 75
	default_buss = ProCallouts_WET
	norepeatfor = 15
	instancemanagement = ignore
	instancelimit = 1
}
Margera_KeepItUp_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			margera_keepitup_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			margera_keepitup_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			margera_keepitup_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			margera_keepitup_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			margera_keepitup_05
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Mullen_Attention_Stream_struct = {
	default_priority = 80
	default_buss = ProCallouts_WET
	norepeatfor = 10
	instancemanagement = stop_oldest
	instancelimit = 1
}
Mullen_Attention_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			mullen_attn_02
			dropoff = 50
			dropoff_function = linear
			vol = 48
		}
		sound2 = {
			mullen_attn_03
			dropoff = 50
			dropoff_function = linear
			vol = 48
		}
		sound3 = {
			mullen_attn_04
			dropoff = 50
			dropoff_function = linear
			vol = 48
		}
		sound4 = {
			mullen_attn_05
			dropoff = 50
			dropoff_function = linear
			vol = 48
		}
		sound5 = {
			mullen_attn_06
			dropoff = 50
			dropoff_function = linear
			vol = 48
		}
		sound6 = {
			mullen_attn_01
			dropoff = 50
			dropoff_function = linear
			vol = 48
		}
	}
}
Torres_Attention_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 20
	instancemanagement = ignore
	instancelimit = 1
}
Torres_Attention_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			torres_attn_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			torres_attn_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			torres_attn_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			torres_attn_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			torres_attn_05
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Torres_Impatient_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 20
	instancemanagement = ignore
	instancelimit = 1
}
Torres_Impatient_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			torres_impatient_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			torres_impatient_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			torres_impatient_03
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Torres_Avoid_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 20
	instancemanagement = ignore
	instancelimit = 1
}
Torres_Avoid_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			torres_avoid_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			torres_avoid_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			torres_avoid_03
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Torres_BooLand_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 15
	instancemanagement = ignore
	instancelimit = 1
}
Torres_BooLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			torres_booland_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			torres_booland_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			torres_booland_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			torres_booland_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			torres_booland_05
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Torres_CheerLand_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
Torres_CheerLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			torres_cheerland_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			torres_cheerland_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			torres_cheerland_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			torres_cheerland_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			torres_cheerland_05
			dropoff = 50
			dropoff_function = linear
		}
	}
}
King_Attention_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 10
	instancemanagement = stop_oldest
	instancelimit = 1
}
King_Attention_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			king_attn_01
			dropoff = 50
			dropoff_function = linear
			vol = 40
		}
		sound2 = {
			king_attn_02
			dropoff = 50
			dropoff_function = linear
			vol = 40
		}
		sound3 = {
			king_attn_03
			dropoff = 50
			dropoff_function = linear
			vol = 40
		}
		sound4 = {
			king_attn_04
			dropoff = 50
			dropoff_function = linear
			vol = 40
		}
		sound5 = {
			king_attn_05
			dropoff = 50
			dropoff_function = linear
			vol = 40
		}
	}
}
sk9_Goal_Pickup_SFX_struct = {
	default_priority = 50
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 3
}
sk9_Goal_Pickup_SFX_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_goal_pickup
			pitch = 150
			vol = 300
		}
	}
}
Dollin_Attention_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 15
	instancemanagement = ignore
	instancelimit = 1
}
Dollin_Attention_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			dollin_attn_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			dollin_attn_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			dollin_attn_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			dollin_attn_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			dollin_attn_05
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			dollin_attn_06
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			dollin_attn_07
			dropoff = 50
			dropoff_function = linear
		}
		sound8 = {
			dollin_attn_08
			dropoff = 50
			dropoff_function = linear
		}
		sound9 = {
			dollin_attn_09
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Dollin_Avoid_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 20
	instancemanagement = ignore
	instancelimit = 1
}
Dollin_Avoid_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			dollin_avoid_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			dollin_avoid_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			dollin_avoid_03
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Dollin_BooLand_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 20
	instancemanagement = ignore
	instancelimit = 1
}
Dollin_BooLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			dollin_booland_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			dollin_booland_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			dollin_booland_03
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Dollin_CheerLand_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 20
	instancemanagement = ignore
	instancelimit = 1
}
Dollin_CheerLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			dollin_cheerland_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			dollin_cheerland_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			dollin_cheerland_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			dollin_cheerland_04
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Dollin_Impatient_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 20
	instancemanagement = ignore
	instancelimit = 1
}
Dollin_Impatient_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			dollin_impatient_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			dollin_impatient_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			dollin_impatient_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			dollin_impatient_04
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Dollin_KeepItUp_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 20
	instancemanagement = ignore
	instancelimit = 1
}
Dollin_KeepItUp_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			dollin_keepitup_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			dollin_keepitup_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			dollin_keepitup_03
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Kanights_BooLand_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 20
	instancemanagement = ignore
	instancelimit = 1
}
Kanights_BooLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			bryce_booland_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			bryce_booland_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			bryce_booland_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			bryce_booland_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			bryce_booland_05
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Kanights_CheerLand_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 20
	instancemanagement = ignore
	instancelimit = 1
}
Kanights_CheerLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			bryce_cheerland_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			bryce_cheerland_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			bryce_cheerland_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			bryce_cheerland_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			bryce_cheerland_05
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Sheckler_Attention_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 10
	instancemanagement = ignore
	instancelimit = 1
}
Sheckler_Attention_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			sheckler_attn_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			sheckler_attn_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			sheckler_attn_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			sheckler_attn_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			sheckler_attn_05
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			sheckler_attn_06
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			sheckler_attn_07
			dropoff = 50
			dropoff_function = linear
		}
		sound8 = {
			sheckler_attn_08
			dropoff = 50
			dropoff_function = linear
		}
		sound9 = {
			sheckler_attn_09
			dropoff = 50
			dropoff_function = linear
		}
		sound10 = {
			sheckler_attn_10
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Sheckler_Avoid_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 20
	instancemanagement = ignore
	instancelimit = 1
}
Sheckler_Avoid_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			sheckler_avoid_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			sheckler_avoid_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			sheckler_avoid_03
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Sheckler_BooLand_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
Sheckler_BooLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			sheckler_booland_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			sheckler_booland_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			sheckler_booland_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			sheckler_booland_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			sheckler_booland_05
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			sheckler_booland_06
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			sheckler_booland_07
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Sheckler_CheerLand_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 10
	instancemanagement = ignore
	instancelimit = 1
}
Sheckler_CheerLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			sheckler_cheerland_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			sheckler_cheerland_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			sheckler_cheerland_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			sheckler_cheerland_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			sheckler_cheerland_05
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			sheckler_cheerland_06
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			sheckler_cheerland_07
			dropoff = 50
			dropoff_function = linear
		}
		sound8 = {
			sheckler_cheerland_08
			dropoff = 50
			dropoff_function = linear
		}
		sound9 = {
			sheckler_cheerland_09
			dropoff = 50
			dropoff_function = linear
		}
		sound10 = {
			sheckler_cheerland_10
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Sheckler_Impatient_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
Sheckler_Impatient_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			sheckler_impatient_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			sheckler_impatient_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			sheckler_impatient_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			sheckler_impatient_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			sheckler_impatient_05
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Sheckler_KeepItUp_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 20
	instancemanagement = ignore
	instancelimit = 1
}
Sheckler_KeepItUp_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			sheckler_keepitup_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			sheckler_keepitup_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			sheckler_keepitup_03
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Huston_BooLand_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 10
	instancemanagement = ignore
	instancelimit = 1
}
Huston_BooLand_Stream_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			Nyjah_Booland_01
		}
		sound2 = {
			Nyjah_Booland_02
		}
		sound3 = {
			Nyjah_Booland_03
		}
		sound4 = {
			Nyjah_Booland_04
		}
		sound5 = {
			Nyjah_Booland_05
		}
		sound6 = {
			Nyjah_Booland_06
		}
		sound7 = {
			Nyjah_Booland_07
		}
		sound8 = {
			Nyjah_Booland_08
		}
		sound9 = {
			Nyjah_Booland_09
		}
		sound10 = {
			Nyjah_Booland_10
		}
	}
}
Huston_CheerLand_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 10
	instancemanagement = ignore
	instancelimit = 1
}
Huston_CheerLand_Stream_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			Nyjah_Cheerland_01
		}
		sound2 = {
			Nyjah_Cheerland_02
		}
		sound3 = {
			Nyjah_Cheerland_03
		}
		sound4 = {
			Nyjah_Cheerland_04
		}
		sound5 = {
			Nyjah_Cheerland_05
		}
		sound6 = {
			Nyjah_Cheerland_06
		}
		sound7 = {
			Nyjah_Cheerland_07
		}
		sound8 = {
			Nyjah_Cheerland_08
		}
		sound9 = {
			Nyjah_Cheerland_09
		}
		sound10 = {
			Nyjah_Cheerland_10
		}
	}
}
Huston_KeepItUp_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 20
	instancemanagement = ignore
	instancelimit = 1
}
Huston_KeepItUp_Stream_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			Nyjah_Keepitup_01
		}
		sound2 = {
			Nyjah_Keepitup_02
		}
		sound3 = {
			Nyjah_Keepitup_03
		}
		sound4 = {
			Nyjah_Keepitup_04
		}
		sound5 = {
			Nyjah_Keepitup_05
		}
	}
}
sk9_Slums_Gate_Close_struct = {
	default_priority = 60
	default_buss = zonesfx
	norepeatfor = 2
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Slums_Gate_Close_container = {
	command = playsound
	randomness = none
}
sk9_Slums_TrainHit_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Slums_TrainHit_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_Slums_TrainHit
			vol = 200
		}
	}
}
sk9_Slums_Door_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Slums_Door_container = {
	command = obj_playsound
	randomness = none
}
sk9_Slums_Crane_Movement_Loop_struct = {
	default_priority = 50
	default_buss = vehicle
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Slums_Crane_Movement_Loop_container = {
	command = obj_playsound
	randomness = none
}
sk9_Slums_Rumble_struct = {
	default_priority = 50
	default_buss = Train
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Slums_Rumble_container = {
	command = playsound
	randomness = none
}
sk9_Slums_Sliding_Gate_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Slums_Sliding_Gate_container = {
	command = playsound
	randomness = none
}
sk9_Slums_Sliding_Gate_Close_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Slums_Sliding_Gate_Close_container = {
	command = playsound
	randomness = none
}
sk8_Large_Fan_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk8_Large_Fan_container = {
	command = obj_playsound
	randomness = none
}
sk9_Slums_Train_Horn_struct = {
	default_priority = 50
	default_buss = Train
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Slums_Train_Horn_container = {
	command = obj_playsound
	randomness = none
}
sk9_Slums_Train_ArriveStation_struct = {
	default_priority = 60
	default_buss = Train
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Slums_Train_ArriveStation_container = {
	command = obj_playsound
	randomness = none
}
sk9_Slums_Train_LeaveStation_struct = {
	default_priority = 50
	default_buss = Train
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Slums_Train_LeaveStation_container = {
	command = obj_playsound
	randomness = none
}
sk9_Slums_Unlock_Gate_struct = {
	default_priority = 70
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Slums_Unlock_Gate_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_Slums_Unlock_Gate
			vol = 400
		}
	}
}
sk9_Slums_Magnet_struct = {
	default_priority = 50
	default_buss = vehicle
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Slums_Magnet_container = {
	command = playsound
	randomness = none
}
sk9_Slums_Sliding_Gate_Opener_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Slums_Sliding_Gate_Opener_container = {
	command = playsound
	randomness = none
}
VO_m_r1_demo_outro_01_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
VO_m_r1_demo_outro_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_demo_tr_01_king
			vol = 350
		}
	}
}
VO_m_r1_demo_outro_02_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
VO_m_r1_demo_outro_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_demo_tr_05_king
			vol = 350
		}
	}
}
VO_m_r1_demo_outro_03_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
VO_m_r1_demo_outro_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_demo_tr_07_king
			vol = 350
		}
	}
}
VO_m_r1_demo_outro_04_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
VO_m_r1_demo_outro_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_demo_tr_09_king
			vol = 350
		}
	}
}
m_r2_climb_inst_07_a_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_climb_inst_07_a_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			r2_climb_inst_07_a
			vol = 350
		}
	}
}
m_r2_climb_inst_07_b_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_climb_inst_07_b_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			r2_climb_inst_07_b
			vol = 350
		}
	}
}
m_r2_climb_inst_07_c_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_climb_inst_07_c_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			r2_climb_inst_07_c
			vol = 350
		}
	}
}
m_r2_climb_inst_08_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_climb_inst_08_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			r2_climb_inst_08
			vol = 350
		}
	}
}
m_r2_climb_inst_09_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_climb_inst_09_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			r2_climb_inst_09
			vol = 350
		}
	}
}
m_r2_climb_inst_10_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_climb_inst_10_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			r2_climb_inst_10
			vol = 350
		}
	}
}
m_r2_climb_inst_11_a_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_climb_inst_11_a_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			r2_climb_inst_11_a
			vol = 350
		}
	}
}
m_r2_climb_inst_11_b_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_climb_inst_11_b_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			r2_climb_inst_11_b
			vol = 350
		}
	}
}
m_r2_climb_inst_12_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_climb_inst_12_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			r2_climb_inst_12
			vol = 350
		}
	}
}
m_r2_climb_inst_13_a_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_climb_inst_13_a_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			r2_climb_inst_13_a
			vol = 350
		}
	}
}
m_r2_climb_inst_13_b_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_climb_inst_13_b_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			r2_climb_inst_13_b
			vol = 350
		}
	}
}
m_r2_climb_inst_14_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_climb_inst_14_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			r2_climb_inst_14
			vol = 350
		}
	}
}
m_r2_climb_inst_13_a_1_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_climb_inst_13_a_1_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			r2_climb_inst_13_a_1
			vol = 350
		}
	}
}
sk9_Museum_Int_Rocket_Steam_SFX_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 5
	instancemanagement = ignore
	instancelimit = 1
}
sk9_Museum_Int_Rocket_Steam_SFX_container = {
	command = playsound
	randomness = none
}
sk9_Museum_Int_Simulator_Countdown_SFX_struct = {
	default_priority = 85
	default_buss = zonesfx
	norepeatfor = 0.5
	instancemanagement = ignore
	instancelimit = 1
}
sk9_Museum_Int_Simulator_Countdown_SFX_container = {
	command = playsound
	randomness = none
}
sk9_museum_int_Catapult_Flyby_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_museum_int_Catapult_Flyby_container = {
	command = playsound
	randomness = none
}
sk9_museum_int_Catapult_Turbine_struct = {
	default_priority = 85
	default_buss = zonesfx
	norepeatfor = 0.5
	instancemanagement = ignore
	instancelimit = 1
}
sk9_museum_int_Catapult_Turbine_container = {
	command = playsound
	randomness = none
}
sk9_Museum_Int_Slingshot_Steam_struct = {
	default_priority = 85
	default_buss = zonesfx
	norepeatfor = 0.5
	instancemanagement = ignore
	instancelimit = 1
}
sk9_Museum_Int_Slingshot_Steam_container = {
	command = playsound
	randomness = none
}
sk9_Museum_Int_WrightBros_Plane_move_struct = {
	default_priority = 85
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 2
}
sk9_Museum_Int_WrightBros_Plane_move_container = {
	command = playsound
	randomness = none
}
sk9_WPBridge_Train_struct = {
	default_priority = 60
	default_buss = Train
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_WPBridge_Train_container = {
	command = obj_playsound
	randomness = none
}
sk9_WPBridge_Train_Arrive_struct = {
	default_priority = 60
	default_buss = Train
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_WPBridge_Train_Arrive_container = {
	command = obj_playsound
	randomness = none
}
sk9_WPBridge_Train_Horn_struct = {
	default_priority = 60
	default_buss = Train
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_WPBridge_Train_Horn_container = {
	command = obj_playsound
	randomness = none
}
sk9_WPBridge_Train_Leave_struct = {
	default_priority = 60
	default_buss = Train
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_WPBridge_Train_Leave_container = {
	command = obj_playsound
	randomness = none
}
sk9_WPBridge_Glass_Break_struct = {
	default_priority = 60
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
}
sk9_WPBridge_Glass_Break_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			sk8_large_glass_break_01
			vol = 400
		}
		sound2 = {
			sk8_large_glass_break_02
			vol = 400
		}
	}
}
sk9_WPBridge_UndergroundTrain_struct = {
	default_priority = 50
	default_buss = Train
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_WPBridge_UndergroundTrain_container = {
	command = playsound
	randomness = none
}
sk9_Elevator_Close_01_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 1
	instancemanagement = stop_oldest
	instancelimit = 2
}
sk9_Elevator_Close_01_container = {
	command = obj_playsound
	randomness = none
}
sk9_Elevator_Open_01_struct = {
	default_priority = 20
	default_buss = zonesfx
	norepeatfor = 1
	instancemanagement = ignore
	instancelimit = 2
}
sk9_Elevator_Open_01_container = {
	command = playsound
	randomness = none
}
sk9_Elevator_Close_02_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 1
	instancemanagement = stop_oldest
	instancelimit = 2
}
sk9_Elevator_Close_02_container = {
	command = playsound
	randomness = none
}
sk9_Elevator_Open_02_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 1
	instancemanagement = stop_oldest
	instancelimit = 2
}
sk9_Elevator_Open_02_container = {
	command = playsound
	randomness = none
}
WPBridge_Boost_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
WPBridge_Boost_container = {
	command = playsound
	randomness = none
}
sk9_WPBridge_Croc_SFX_struct = {
	default_priority = 50
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_WPBridge_Croc_SFX_container = {
	command = obj_playsound
	randomness = randomnorepeattype
}
sk9_PB_Bridge_Helicopter_Loop_SFX_struct = {
	default_priority = 90
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
sk9_PB_Bridge_Helicopter_Loop_SFX_container = {
	command = playsound
	randomness = none
}
sk9_PB_Bridge_Ship_Door_Open_struct = {
	default_priority = 85
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 5
}
sk9_PB_Bridge_Ship_Door_Open_container = {
	command = playsound
	randomness = none
}
sk9_PB_Toll_Booth_Gate_SFX_struct = {
	default_priority = 85
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 5
}
sk9_PB_Toll_Booth_Gate_SFX_container = {
	command = playsound
	randomness = none
}
sk9_PB_Bridge_Heli_Screen_Flash_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 3
}
sk9_PB_Bridge_Heli_Screen_Flash_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			SK8_Teleport_Back
			vol = 350
		}
	}
}
sk9_PB_Bridge_Seagulls_struct = {
	default_priority = 85
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 5
}
sk9_PB_Bridge_Seagulls_container = {
	command = playsound
	randomness = none
}
sk9_PB_Bridge_Cannery_SFX_01_struct = {
	default_priority = 80
	default_buss = zonesfx
	norepeatfor = 0.5
	instancemanagement = ignore
	instancelimit = 1
}
sk9_PB_Bridge_Cannery_SFX_01_container = {
	command = playsound
	randomness = none
}
sk9_PB_Bridge_Cannery_SFX_02_struct = {
	default_priority = 80
	default_buss = zonesfx
	norepeatfor = 0.5
	instancemanagement = ignore
	instancelimit = 1
}
sk9_PB_Bridge_Cannery_SFX_02_container = {
	command = playsound
	randomness = none
}
m_r3_Museums_chk1_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_Museums_chk1_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_museum_inst_01
			vol = 350
		}
	}
}
m_r3_Museums_chk2p1_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_Museums_chk2p1_container = {
	command = playsound
	randomness = none
}
m_r3_Museums_chk2p2_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_Museums_chk2p2_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_museum_inst_03
			vol = 350
		}
	}
}
m_r3_Museums_chk3p1_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_Museums_chk3p1_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_museum_inst_04
			vol = 350
		}
	}
}
m_r3_Museums_chk3p2_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_Museums_chk3p2_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_museum_inst_05
			vol = 350
		}
	}
}
m_r3_Museums_chk3p3_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_Museums_chk3p3_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_museum_inst_06
			vol = 350
		}
	}
}
sk9_Hammer_Banner_UnFurl_struct = {
	default_priority = 70
	default_buss = rain
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Hammer_Banner_UnFurl_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			Banner_Unfurl
			vol = 400
		}
	}
}
sk9_Landsdowne_Bathroom_struct = {
	default_priority = 35
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Landsdowne_Bathroom_container = {
	command = obj_playsound
	randomness = randomnorepeattype
}
m_hu_chk1p1_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_hu_chk1p1_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_hu_chk1p1_TEMPVO
			vol = 400
		}
	}
}
m_hu_chk2p1_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_hu_chk2p1_container = {
	command = playsound
	randomness = none
}
m_hu_chk2p2_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_hu_chk2p2_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_hu_chk2p2_TEMPVO
			vol = 400
		}
	}
}
m_hu_chk2p3_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_hu_chk2p3_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_hu_chk2p3_TEMPVO
			vol = 400
		}
	}
}
m_hu_chk3p1_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_hu_chk3p1_container = {
	command = playsound
	randomness = none
}
m_hu_chk3p2_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_hu_chk3p2_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_hu_chk3p2_TEMPVO
			vol = 400
		}
	}
}
m_hu_chk3p3_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_hu_chk3p3_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_hu_chk3p3_TEMPVO
			vol = 400
		}
	}
}
m_hu_Director_Action_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 5
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_hu_Director_Action_container = {
	command = playsound
	randomness = none
}
m_hu_Director_DownSet_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 5
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_hu_Director_DownSet_container = {
	command = playsound
	randomness = none
}
m_hu_Director_FasterThanThat_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 5
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_hu_Director_FasterThanThat_container = {
	command = playsound
	randomness = none
}
m_hu_Director_HitTheRest_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 5
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_hu_Director_HitTheRest_container = {
	command = playsound
	randomness = none
}
m_hu_Director_LetsDoitAgain_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 5
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_hu_Director_LetsDoitAgain_container = {
	command = playsound
	randomness = none
}
m_hu_Director_StayOnBoard_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 5
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_hu_Director_StayOnBoard_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h_uber_inc_bail_02
			vol = 350
		}
	}
}
m_hu_Director_StayOnSet_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 5
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_hu_Director_StayOnSet_container = {
	command = playsound
	randomness = none
}
m_hu_Director_TryFaster_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 5
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_hu_Director_TryFaster_container = {
	command = playsound
	randomness = none
}
m_hu_Director_Wrap_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 5
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_hu_Director_Wrap_container = {
	command = playsound
	randomness = none
}
sk9_Film_Clapper_struct = {
	default_priority = 50
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Film_Clapper_container = {
	command = playsound
	randomness = none
}
m_hu_WoodBreak_struct = {
	default_priority = 60
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
}
m_hu_WoodBreak_container = {
	command = obj_playsound
	randomness = none
}
m_r2_climb_inc_neg_01_struct = {
	default_priority = 75
	default_buss = GoalVO_WET
	norepeatfor = 20
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_climb_inc_neg_01_container = {
	command = obj_playsound
	randomness = none
	sounds = {
		sound1 = {
			margera_attn_07
			dropoff = 80
			dropoff_function = linear
		}
	}
}
m_r2_climb_inc_neg_02_struct = {
	default_priority = 75
	default_buss = GoalVO_WET
	norepeatfor = 20
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_climb_inc_neg_02_container = {
	command = obj_playsound
	randomness = none
	sounds = {
		sound1 = {
			r2_climb_inc_neg_02
			dropoff = 80
			dropoff_function = linear
		}
	}
}
m_r2_climb_inc_neg_03_struct = {
	default_priority = 75
	default_buss = GoalVO_WET
	norepeatfor = 20
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_climb_inc_neg_03_container = {
	command = obj_playsound
	randomness = none
	sounds = {
		sound1 = {
			r2_climb_inc_neg_03
			dropoff = 80
			dropoff_function = linear
		}
	}
}
m_r2_climb_inc_neg_04_struct = {
	default_priority = 75
	default_buss = GoalVO_WET
	norepeatfor = 20
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_climb_inc_neg_04_container = {
	command = obj_playsound
	randomness = none
	sounds = {
		sound1 = {
			r2_climb_inc_neg_04
			dropoff = 80
			dropoff_function = linear
		}
	}
}
m_r2_climb_inc_neg_05_struct = {
	default_priority = 75
	default_buss = GoalVO_WET
	norepeatfor = 20
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_climb_inc_neg_05_container = {
	command = obj_playsound
	randomness = none
	sounds = {
		sound1 = {
			r2_climb_inc_neg_05
			dropoff = 80
			dropoff_function = linear
		}
	}
}
m_r2_climb_inc_neg_06_struct = {
	default_priority = 75
	default_buss = GoalVO_WET
	norepeatfor = 20
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_climb_inc_neg_06_container = {
	command = obj_playsound
	randomness = none
	sounds = {
		sound1 = {
			r2_climb_inc_neg_06
			dropoff = 80
			dropoff_function = linear
		}
	}
}
m_r2_climb_inc_neg_07_struct = {
	default_priority = 75
	default_buss = GoalVO_WET
	norepeatfor = 20
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_climb_inc_neg_07_container = {
	command = obj_playsound
	randomness = none
	sounds = {
		sound1 = {
			r2_climb_inc_neg_07
			dropoff = 80
			dropoff_function = linear
		}
	}
}
m_r2_climb_inc_neg_08_struct = {
	default_priority = 75
	default_buss = GoalVO_WET
	norepeatfor = 20
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_climb_inc_neg_08_container = {
	command = obj_playsound
	randomness = none
	sounds = {
		sound1 = {
			r2_climb_inc_neg_08
			dropoff = 80
			dropoff_function = linear
		}
	}
}
m_r2_climb_inc_neg_09_struct = {
	default_priority = 75
	default_buss = GoalVO_WET
	norepeatfor = 20
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_climb_inc_neg_09_container = {
	command = obj_playsound
	randomness = none
	sounds = {
		sound1 = {
			r2_climb_inc_neg_09
			dropoff = 80
			dropoff_function = linear
		}
	}
}
m_r2_climb_inc_neg_10_struct = {
	default_priority = 75
	default_buss = GoalVO_WET
	norepeatfor = 20
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_climb_inc_neg_10_container = {
	command = obj_playsound
	randomness = none
	sounds = {
		sound1 = {
			r2_climb_inc_neg_10
			dropoff = 80
			dropoff_function = linear
		}
	}
}
m_r2_climb_inc_neg_11_struct = {
	default_priority = 75
	default_buss = GoalVO_WET
	norepeatfor = 20
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_climb_inc_neg_11_container = {
	command = obj_playsound
	randomness = none
	sounds = {
		sound1 = {
			margera_attn_05
			dropoff = 80
			dropoff_function = linear
		}
	}
}
m_r2_climb_inc_neg_12_struct = {
	default_priority = 75
	default_buss = GoalVO_WET
	norepeatfor = 20
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_climb_inc_neg_12_container = {
	command = obj_playsound
	randomness = none
	sounds = {
		sound1 = {
			r2_climb_inc_neg_12
			dropoff = 80
			dropoff_function = linear
		}
	}
}
m_r2_climb_inst_01_struct = {
	default_priority = 90
	default_buss = GoalVO_WET
	norepeatfor = 20
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_climb_inst_01_container = {
	command = obj_playsound
	randomness = none
	sounds = {
		sound1 = {
			r2_climb_inst_01
			dropoff = 80
			dropoff_function = linear
		}
	}
}
m_r2_climb_inst_02_struct = {
	default_priority = 90
	default_buss = GoalVO_WET
	norepeatfor = 20
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_climb_inst_02_container = {
	command = obj_playsound
	randomness = none
	sounds = {
		sound1 = {
			r2_climb_inst_02
			dropoff = 80
			dropoff_function = linear
		}
	}
}
m_r2_climb_inst_03_struct = {
	default_priority = 90
	default_buss = GoalVO_WET
	norepeatfor = 20
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_climb_inst_03_container = {
	command = obj_playsound
	randomness = none
	sounds = {
		sound1 = {
			r2_climb_inst_03
			dropoff = 80
			dropoff_function = linear
		}
	}
}
m_r2_climb_inst_04_struct = {
	default_priority = 90
	default_buss = GoalVO_WET
	norepeatfor = 20
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_climb_inst_04_container = {
	command = obj_playsound
	randomness = none
	sounds = {
		sound1 = {
			r2_climb_inst_04
			dropoff = 80
			dropoff_function = linear
		}
	}
}
m_r2_climb_inst_05_struct = {
	default_priority = 90
	default_buss = GoalVO_WET
	norepeatfor = 20
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_climb_inst_05_container = {
	command = obj_playsound
	randomness = none
	sounds = {
		sound1 = {
			r2_climb_inst_05
			dropoff = 80
			dropoff_function = linear
		}
	}
}
m_r2_climb_inst_06_struct = {
	default_priority = 90
	default_buss = GoalVO_WET
	norepeatfor = 20
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_climb_inst_06_container = {
	command = obj_playsound
	randomness = none
	sounds = {
		sound1 = {
			r2_climb_inst_06
			dropoff = 80
			dropoff_function = linear
		}
	}
}
m_r2_skateoff_inst_01_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_skateoff_inst_01_container = {
	command = obj_playsound
	randomness = none
}
m_r2_skateoff_inst_02_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_skateoff_inst_02_container = {
	command = obj_playsound
	randomness = none
}
m_r2_skateoff_inst_03_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_skateoff_inst_03_container = {
	command = obj_playsound
	randomness = none
}
m_r2_skateoff_inst_04_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_skateoff_inst_04_container = {
	command = obj_playsound
	randomness = none
}
m_r2_skateoff_inst_05_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_skateoff_inst_05_container = {
	command = obj_playsound
	randomness = none
}
m_r2_skateoff_inst_06_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_skateoff_inst_06_container = {
	command = obj_playsound
	randomness = none
}
m_r2_skateoff_inst_07_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_skateoff_inst_07_container = {
	command = obj_playsound
	randomness = none
}
m_r2_skateoff_inst_08_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_skateoff_inst_08_container = {
	command = obj_playsound
	randomness = none
}
m_r2_skateoff_inst_09_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_skateoff_inst_09_container = {
	command = obj_playsound
	randomness = none
}
m_r2_skateoff_inst_10_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_skateoff_inst_10_container = {
	command = obj_playsound
	randomness = none
}
m_r2_skateoff_inst_11_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_skateoff_inst_11_container = {
	command = obj_playsound
	randomness = none
}
m_r2_skateoff_inst_12_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_skateoff_inst_12_container = {
	command = obj_playsound
	randomness = none
}
m_r2_skateoff_inst_13_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_skateoff_inst_13_container = {
	command = obj_playsound
	randomness = none
}
m_r2_skateoff_inst_14_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_skateoff_inst_14_container = {
	command = obj_playsound
	randomness = none
}
m_r2_skateoff_scared_01_struct = {
	default_priority = 80
	default_buss = GoalVO_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_skateoff_scared_01_container = {
	command = obj_playsound
	randomness = none
}
m_r2_skateoff_scared_02_struct = {
	default_priority = 80
	default_buss = GoalVO_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_skateoff_scared_02_container = {
	command = obj_playsound
	randomness = none
}
m_r2_skateoff_scared_03_struct = {
	default_priority = 80
	default_buss = GoalVO_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_skateoff_scared_03_container = {
	command = obj_playsound
	randomness = none
}
m_r2_skateoff_scared_04_struct = {
	default_priority = 80
	default_buss = GoalVO_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_skateoff_scared_04_container = {
	command = obj_playsound
	randomness = none
}
m_r2_skateoff_scared_05_struct = {
	default_priority = 80
	default_buss = GoalVO_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_skateoff_scared_05_container = {
	command = obj_playsound
	randomness = none
}
m_h2_takefdr_inst_01_struct = {
	default_priority = 70
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
m_h2_takefdr_inst_01_container = {
	command = obj_playsound
	randomness = none
}
m_h2_takefdr_inst_02_struct = {
	default_priority = 70
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
m_h2_takefdr_inst_02_container = {
	command = obj_playsound
	randomness = none
}
m_h2_takefdr_inc_01_struct = {
	default_priority = 70
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
m_h2_takefdr_inc_01_container = {
	command = obj_playsound
	randomness = none
}
m_h2_takefdr_inc_02_struct = {
	default_priority = 70
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
m_h2_takefdr_inc_02_container = {
	command = obj_playsound
	randomness = none
}
m_h2_takefdr_inc_03_struct = {
	default_priority = 70
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
m_h2_takefdr_inc_03_container = {
	command = obj_playsound
	randomness = none
}
m_h2_takefdr_inc_04_struct = {
	default_priority = 70
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
m_h2_takefdr_inc_04_container = {
	command = obj_playsound
	randomness = none
}
m_h3_wallrides_inst_01_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h3_wallrides_inst_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_wallrides_inst_01
			vol = 350
		}
	}
}
m_h3_wallrides_inst_02_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h3_wallrides_inst_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_wallrides_inst_02
			vol = 350
		}
	}
}
m_h3_wallrides_inst_03_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h3_wallrides_inst_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_wallrides_inst_03
			vol = 350
		}
	}
}
m_h3_wallrides_inst_04_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h3_wallrides_inst_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_wallrides_inst_04
			vol = 350
		}
	}
}
m_h3_wallrides_inst_05_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h3_wallrides_inst_05_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_wallrides_inst_05
			vol = 350
		}
	}
}
m_h3_wallrides_inst_06_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h3_wallrides_inst_06_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_wallrides_inst_06
			vol = 350
		}
	}
}
m_c1_ntt_inst_01_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_ntt_inst_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_ntt_inst_01
			vol = 350
		}
	}
}
m_c1_ntt_inst_02_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_ntt_inst_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_ntt_inst_02
			vol = 350
		}
	}
}
m_c1_ntt_inst_03_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_ntt_inst_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_ntt_inst_03
			vol = 350
		}
	}
}
m_c1_ntt_inst_04_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_ntt_inst_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_ntt_inst_04
			vol = 350
		}
	}
}
m_c1_ntt_inst_05_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_ntt_inst_05_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_ntt_inst_05
			vol = 350
		}
	}
}
m_c1_ntt_inst_06_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_ntt_inst_06_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_ntt_inst_06
			vol = 350
		}
	}
}
m_c1_ntt_inst_07_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_ntt_inst_07_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_ntt_inst_07
			vol = 350
		}
	}
}
m_c1_ntt_inst_08_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_ntt_inst_08_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_ntt_inst_08
			vol = 350
		}
	}
}
m_c1_ntt_inst_09_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_ntt_inst_09_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_ntt_inst_09
			vol = 350
		}
	}
}
m_c1_ntt_inst_10_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_ntt_inst_10_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_ntt_inst_10
			vol = 350
		}
	}
}
m_c1_ntt_inst_11_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
m_c1_ntt_inst_11_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_ntt_inst_11
			vol = 350
		}
	}
}
m_c1_film1_inst_01_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_film1_inst_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_film1_inst_01
			vol = 350
		}
	}
}
m_c1_film1_inst_02_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_film1_inst_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_film1_inst_02
			vol = 350
		}
	}
}
m_c1_film1_inst_03_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_film1_inst_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_film1_inst_03
			vol = 350
		}
	}
}
m_c1_film1_inst_04_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_film1_inst_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_film1_inst_04
			vol = 350
		}
	}
}
m_c1_film1_inst_05_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_film1_inst_05_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_film1_inst_05
			vol = 350
		}
	}
}
m_c1_film1_inst_06_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_film1_inst_06_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_film1_inst_06
			vol = 350
		}
	}
}
m_c1_film1_inst_07_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_film1_inst_07_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_film1_inst_07
			vol = 350
		}
	}
}
m_c1_film1_inst_08_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_film1_inst_08_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_film1_inst_08
			vol = 350
		}
	}
}
m_c1_film1_inst_09_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_film1_inst_09_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_film1_inst_09
			vol = 350
		}
	}
}
m_c1_film1_inst_10_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_film1_inst_10_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_film1_inst_10
			vol = 350
		}
	}
}
m_c1_film1_inst_11_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_film1_inst_11_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_film1_inst_11
			vol = 350
		}
	}
}
m_c1_film1_inst_12_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_film1_inst_12_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_film1_inst_12
			vol = 350
		}
	}
}
m_c1_film1_inst_13_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_film1_inst_13_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_film1_inst_13
			vol = 350
		}
	}
}
m_c1_film2_inst_01_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_film2_inst_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_film2_inst_01
			vol = 350
		}
	}
}
m_c1_film2_inst_02_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_film2_inst_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_film2_inst_02
			vol = 350
		}
	}
}
m_c1_film2_inst_03_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_film2_inst_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_film2_inst_03
			vol = 350
		}
	}
}
m_c1_film2_inst_04_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_film2_inst_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_film2_inst_04
			vol = 350
		}
	}
}
m_c1_film2_inst_05_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_film2_inst_05_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_film2_inst_05
			vol = 350
		}
	}
}
m_c1_film2_inst_06_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_film2_inst_06_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_film2_inst_06
			vol = 350
		}
	}
}
m_c1_film2_inst_07_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_film2_inst_07_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_film2_inst_07
			vol = 350
		}
	}
}
m_c1_film2_inst_08_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_film2_inst_08_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_film2_inst_08
			vol = 350
		}
	}
}
m_c1_film2_inst_09_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_film2_inst_09_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_film2_inst_09
			vol = 350
		}
	}
}
m_c1_film2_inst_10_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_film2_inst_10_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_film2_inst_10
			vol = 350
		}
	}
}
m_c1_film2_inst_11_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_film2_inst_11_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_film2_inst_11
			vol = 350
		}
	}
}
m_c1_film2_inst_12_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_film2_inst_12_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_film2_inst_12
			vol = 350
		}
	}
}
m_c1_film2_inst_13_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_film2_inst_13_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_film2_inst_13
			vol = 350
		}
	}
}
m_c1_film2_inst_14_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_film2_inst_14_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_film2_inst_14
			vol = 350
		}
	}
}
m_c1_film2_inst_15_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
m_c1_film2_inst_15_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_film2_inst_15
			vol = 350
		}
	}
}
m_c1_film3_inst_01_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_film3_inst_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_film3_inst_01
			vol = 350
		}
	}
}
m_c1_film3_inst_02_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_film3_inst_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_film3_inst_02
			vol = 350
		}
	}
}
m_c1_film3_inst_03_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_film3_inst_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_film3_inst_03
			vol = 350
		}
	}
}
m_c1_film3_inst_04_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_film3_inst_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_film3_inst_04
			vol = 350
		}
	}
}
m_c1_film3_inst_05_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_film3_inst_05_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_film3_inst_05
			vol = 350
		}
	}
}
m_c1_film3_inst_06_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_film3_inst_06_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_film3_inst_06
			vol = 350
		}
	}
}
m_c1_film3_inst_07_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_film3_inst_07_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_film3_inst_07
			vol = 350
		}
	}
}
m_c1_film3_inst_08_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_film3_inst_08_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_film3_inst_08
			vol = 350
		}
	}
}
m_c1_film3_inst_09_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_film3_inst_09_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_film3_inst_09
			vol = 350
		}
	}
}
m_c1_demo_inst_01_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_demo_inst_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_demo_inst_01
			vol = 350
		}
	}
}
m_c1_demo_inst_02_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_demo_inst_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_demo_inst_02
			vol = 350
		}
	}
}
m_c1_demo_inst_03_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_demo_inst_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_demo_inst_03
			vol = 350
		}
	}
}
m_c1_demo_inst_04_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_demo_inst_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_demo_inst_04
			vol = 350
		}
	}
}
m_c1_demo_inst_05_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_demo_inst_05_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_demo_inst_05
			vol = 350
		}
	}
}
m_c1_demo_inst_06_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_demo_inst_06_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_demo_inst_06
			vol = 350
		}
	}
}
m_c1_demo_inst_08_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_demo_inst_08_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_demo_inst_08
			vol = 350
		}
	}
}
m_c1_demo_inst_09_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_demo_inst_09_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_demo_inst_09
			vol = 350
		}
	}
}
m_c1_demo_inst_07_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_demo_inst_07_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_demo_inst_07
			vol = 350
		}
	}
}
m_c1_demo_outro_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_demo_outro_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_demo_outro_saari_02
			vol = 400
		}
	}
}
m_c1_practice1_inst_01_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_practice1_inst_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_practice1_inst_01
			vol = 350
		}
	}
}
m_c1_practice1_inst_02_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_practice1_inst_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_practice1_inst_02
			vol = 350
		}
	}
}
m_c1_practice1_inst_03_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_practice1_inst_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_practice1_inst_03
			vol = 350
		}
	}
}
m_c1_practice1_inst_04_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_practice1_inst_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_practice1_inst_04
			vol = 350
		}
	}
}
m_c1_practice1_inst_05_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_practice1_inst_05_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_practice1_inst_05
			vol = 350
		}
	}
}
m_c1_practice1_inst_06_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_practice1_inst_06_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_practice1_inst_06
			vol = 350
		}
	}
}
m_c1_practice1_inst_07_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_practice1_inst_07_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_practice1_inst_07
			vol = 350
		}
	}
}
Bosco_Attention_Stream_struct = {
	default_priority = 75
	default_buss = ProCallouts_WET
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
Bosco_Attention_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			bosco_attn_01
			vol = 50
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			bosco_attn_02
			vol = 50
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			bosco_attn_03
			vol = 50
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			bosco_attn_04
			vol = 50
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			bosco_attn_05
			vol = 50
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			bosco_attn_06
			vol = 50
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			bosco_attn_07
			vol = 50
			dropoff = 50
			dropoff_function = linear
		}
		sound8 = {
			bosco_gap_attn_01
			vol = 50
			dropoff = 50
			dropoff_function = linear
		}
		sound9 = {
			bosco_attn_09
			vol = 50
			dropoff = 50
			dropoff_function = linear
		}
		sound10 = {
			bosco_attn_10
			vol = 50
			dropoff = 50
			dropoff_function = linear
		}
		sound11 = {
			bosco_attn_11
			vol = 50
			dropoff = 50
			dropoff_function = linear
		}
		sound12 = {
			bosco_attn_08
			vol = 50
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Goal_UI_Negative_Less_Delay_struct = {
	default_priority = 50
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 4
}
Goal_UI_Negative_Less_Delay_container = {
	command = playsound
	randomness = none
}
z_BCity_Water_Splash_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 1
	instancemanagement = stop_oldest
	instancelimit = 3
}
z_BCity_Water_Splash_container = {
	command = playsound
	randomness = none
}
z_BCity_Door1_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
z_BCity_Door1_container = {
	command = obj_playsound
	randomness = none
}
z_BCity_Door2_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
z_BCity_Door2_container = {
	command = obj_playsound
	randomness = none
}
z_BCity_Door3_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
z_BCity_Door3_container = {
	command = obj_playsound
	randomness = none
}
sk9_BCity_Tram_struct = {
	default_priority = 60
	default_buss = Train
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_BCity_Tram_container = {
	command = obj_playsound
	randomness = none
}
sk9_Train_Screech_struct = {
	default_priority = 40
	default_buss = Train
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Train_Screech_container = {
	command = obj_playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			sk9_Slums_Train_Screech_01
		}
		sound2 = {
			sk9_Slums_Train_Screech_02
		}
		sound3 = {
			sk9_Slums_Train_Screech_03
		}
		sound4 = {
			sk9_Slums_Train_Screech_04
		}
		sound5 = {
			sk9_Slums_Train_Screech_05
		}
	}
}
sk9_Train_Loop_show1_sfx_struct = {
	default_priority = 60
	default_buss = Train
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
sk9_Train_Loop_show1_sfx_container = {
	command = obj_playsound
	randomness = none
}
sk9_train_show1_hit_sfx_struct = {
	default_priority = 60
	default_buss = Train
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
sk9_train_show1_hit_sfx_container = {
	command = obj_playsound
	randomness = none
}
sk9_TramStart_struct = {
	default_priority = 50
	default_buss = Train
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
}
sk9_TramStart_container = {
	command = obj_playsound
	randomness = none
}
BCity_Fountain_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
BCity_Fountain_container = {
	command = obj_playsound
	randomness = none
}
sk9_PhotoThemed_Text_Sound_struct = {
	default_priority = 70
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_PhotoThemed_Text_Sound_container = {
	command = playsound
	randomness = none
}
sk9_Skater_Stop_SFX_struct = {
	default_priority = 50
	default_buss = GoalFeedback
	norepeatfor = 3
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Skater_Stop_SFX_container = {
	command = playsound
	randomness = none
}
sk9_Skater_Stop_SFX2_struct = {
	default_priority = 50
	default_buss = GoalFeedback
	norepeatfor = 2
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Skater_Stop_SFX2_container = {
	command = playsound
	randomness = none
}
sk9_Bell_Glass_Break_struct = {
	default_priority = 60
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
}
sk9_Bell_Glass_Break_container = {
	command = playsound
	randomness = randomnorepeattype
}
sk9_Liberty_Bell_SFX_struct = {
	default_priority = 60
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 8
}
sk9_Liberty_Bell_SFX_container = {
	command = playsound
	randomness = none
}
sk9_Bell_SecretWoodBreak_struct = {
	default_priority = 70
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Bell_SecretWoodBreak_container = {
	command = playsound
	randomness = none
}
sk9_Slums_Rumble_Start_Slums_struct = {
	default_priority = 50
	default_buss = Train
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Slums_Rumble_Start_Slums_container = {
	command = playsound
	randomness = none
}
sk9_WPBridge_Rumble_Start_struct = {
	default_priority = 50
	default_buss = Train
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_WPBridge_Rumble_Start_container = {
	command = obj_playsound
	randomness = none
}
m_r2_Show1_Train_Loop_struct = {
	default_priority = 50
	default_buss = Train
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_Show1_Train_Loop_container = {
	command = obj_playsound
	randomness = none
}
sk9_m_r2_Show1_Train_Screech_struct = {
	default_priority = 40
	default_buss = Train
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 3
}
sk9_m_r2_Show1_Train_Screech_container = {
	command = obj_playsound
	randomness = randomnorepeatlasttwotype
}
sk9_train_show1_hornsfx_struct = {
	default_priority = 40
	default_buss = Train
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 3
}
sk9_train_show1_hornsfx_container = {
	command = obj_playsound
	randomness = none
}
m_h1_BoostPull_Negatives_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 15
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h1_BoostPull_Negatives_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			m_h1_bigpush_inc_neg_01
			vol = 350
		}
		sound2 = {
			m_h1_bigpush_inc_neg_02
			vol = 350
		}
		sound3 = {
			vallely_booland_08
			vol = 350
		}
		sound4 = {
			vallely_booland_09
			vol = 350
		}
		sound5 = {
			vallely_booland_01
			vol = 350
		}
		sound6 = {
			vallely_booland_02
			vol = 350
		}
		sound7 = {
			vallely_booland_03
			vol = 350
		}
		sound8 = {
			vallely_booland_04
			vol = 350
		}
		sound9 = {
			vallely_booland_05
			vol = 350
		}
		sound10 = {
			vallely_booland_06
			vol = 350
		}
		sound11 = {
			vallely_booland_07
			vol = 350
		}
	}
}
Sk9_Temp_Goal_Chkpt_SFX_Finalepic_struct = {
	default_priority = 65
	default_buss = GoalFeedback
	norepeatfor = 0.3
	instancemanagement = stop_oldest
	instancelimit = 2
}
Sk9_Temp_Goal_Chkpt_SFX_Finalepic_container = {
	command = playsound
	randomness = none
}
TwoPedsLeanTalk_MF_struct = {
	default_priority = 85
	default_buss = AmbScenes
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
TwoPedsLeanTalk_MF_container = {
	command = agent_playvo
	randomness = none
}
Announcer_BooLand_Stream_struct = {
	default_priority = 75
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Announcer_BooLand_Stream_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			announcer_booland_01
		}
		sound2 = {
			announcer_booland_02
		}
		sound3 = {
			announcer_booland_03
		}
		sound4 = {
			announcer_booland_04
		}
		sound5 = {
			announcer_booland_05
		}
		sound6 = {
			announcer_booland_06
		}
		sound7 = {
			announcer_booland_07
		}
		sound8 = {
			announcer_booland_08
		}
		sound9 = {
			announcer_booland_09
		}
		sound10 = {
			announcer_booland_10
		}
		sound11 = {
			announcer_booland_11
		}
		sound12 = {
			announcer_booland_13
		}
		sound13 = {
			announcer_booland_14
		}
		sound14 = {
			announcer_booland_15
		}
	}
}
Announcer_CheerLand_Stream_struct = {
	default_priority = 75
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Announcer_CheerLand_Stream_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			announcer_cheerland_30
		}
		sound2 = {
			announcer_cheerland_01
		}
		sound3 = {
			announcer_cheerland_02
		}
		sound4 = {
			announcer_cheerland_03
		}
		sound5 = {
			announcer_cheerland_04
		}
		sound6 = {
			announcer_cheerland_05
		}
		sound7 = {
			announcer_cheerland_06
		}
		sound8 = {
			announcer_cheerland_07
		}
		sound9 = {
			announcer_cheerland_08
		}
		sound10 = {
			announcer_cheerland_09
		}
		sound11 = {
			announcer_cheerland_10
		}
		sound12 = {
			announcer_cheerland_11
		}
		sound13 = {
			announcer_cheerland_12
		}
		sound14 = {
			announcer_cheerland_13
		}
		sound15 = {
			announcer_cheerland_14
		}
		sound16 = {
			announcer_cheerland_15
		}
		sound17 = {
			announcer_cheerland_16
		}
		sound18 = {
			announcer_cheerland_17
		}
		Sound19 = {
			announcer_cheerland_18
		}
		Sound20 = {
			announcer_cheerland_19
		}
		Sound21 = {
			announcer_cheerland_20
		}
		Sound22 = {
			announcer_cheerland_21
		}
		Sound23 = {
			announcer_cheerland_22
		}
		Sound24 = {
			announcer_cheerland_23
		}
		Sound25 = {
			announcer_cheerland_24
		}
		Sound26 = {
			announcer_cheerland_25
		}
		Sound27 = {
			announcer_cheerland_26
		}
		Sound28 = {
			announcer_cheerland_27
		}
		Sound29 = {
			announcer_cheerland_28
		}
		Sound30 = {
			announcer_cheerland_29
		}
	}
}
Announcer_KeepItUp_Stream_struct = {
	default_priority = 75
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Announcer_KeepItUp_Stream_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			announcer_keepitup_01
		}
		sound2 = {
			announcer_keepitup_02
		}
		sound3 = {
			announcer_keepitup_03
		}
		sound4 = {
			announcer_keepitup_04
		}
		sound5 = {
			announcer_keepitup_06
		}
		sound6 = {
			announcer_keepitup_07
		}
		sound7 = {
			announcer_keepitup_08
		}
		sound8 = {
			announcer_keepitup_09
		}
		sound9 = {
			announcer_keepitup_10
		}
		sound10 = {
			announcer_keepitup_11
		}
		sound11 = {
			announcer_keepitup_12
		}
		sound12 = {
			announcer_keepitup_13
		}
		sound13 = {
			announcer_keepitup_14
		}
		sound14 = {
			announcer_keepitup_15
		}
		sound15 = {
			announcer_keepitup_16
		}
		sound16 = {
			announcer_keepitup_17
		}
		sound17 = {
			announcer_keepitup_18
		}
		sound18 = {
			announcer_keepitup_20
		}
	}
}
Bum1_Avoid_Stream_struct = {
	default_priority = 75
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Bum1_Avoid_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			bum1_avoid_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			bum1_avoid_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			bum1_avoid_03
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Bum1_BooLand_Stream_struct = {
	default_priority = 75
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Bum1_BooLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			bum1_booland_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			bum1_booland_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			bum1_booland_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			bum1_booland_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			bum1_booland_05
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			bum1_booland_06
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			bum1_booland_07
			dropoff = 50
			dropoff_function = linear
		}
		sound8 = {
			bum1_booland_08
			dropoff = 50
			dropoff_function = linear
		}
		sound9 = {
			bum1_booland_09
			dropoff = 50
			dropoff_function = linear
		}
		sound10 = {
			bum1_booland_10
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Bum1_CheerLand_Stream_struct = {
	default_priority = 75
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Bum1_CheerLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			bum1_cheerland_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			bum1_cheerland_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			bum1_cheerland_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			bum1_cheerland_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			bum1_cheerland_05
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			bum1_cheerland_06
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			bum1_cheerland_07
			dropoff = 50
			dropoff_function = linear
		}
		sound8 = {
			bum1_cheerland_08
			dropoff = 50
			dropoff_function = linear
		}
		sound9 = {
			bum1_cheerland_09
			dropoff = 50
			dropoff_function = linear
		}
		sound10 = {
			bum1_cheerland_10
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Bum1_GetAngry_Stream_struct = {
	default_priority = 75
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Bum1_GetAngry_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			bum1_getangry_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			bum1_getangry_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			bum1_getangry_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			bum1_getangry_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			bum1_getangry_05
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Bum1_GetUp_Stream_struct = {
	default_priority = 75
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Bum1_GetUp_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			bum1_getup_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			bum1_getup_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			bum1_getup_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			bum1_getup_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			bum1_getup_05
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Bum1_KeepItUp_Stream_struct = {
	default_priority = 75
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Bum1_KeepItUp_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			bum1_keepitup_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			bum1_keepitup_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			bum1_keepitup_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			bum1_keepitup_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			bum1_keepitup_05
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			bum1_keepitup_06
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			bum1_keepitup_07
			dropoff = 50
			dropoff_function = linear
		}
		sound8 = {
			bum1_keepitup_08
			dropoff = 50
			dropoff_function = linear
		}
		sound9 = {
			bum1_keepitup_09
			dropoff = 50
			dropoff_function = linear
		}
		sound10 = {
			bum1_keepitup_10
			dropoff = 50
			dropoff_function = linear
		}
	}
}
BusinessMan1_Avoid_Stream_struct = {
	default_priority = 75
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
BusinessMan1_Avoid_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			bus_m1_avoid_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			bus_m1_avoid_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			bus_m1_avoid_03
			dropoff = 50
			dropoff_function = linear
		}
	}
}
BusinessMan1_BooLand_Stream_struct = {
	default_priority = 75
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
BusinessMan1_BooLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			bus_m1_booland_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			bus_m1_booland_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			bus_m1_booland_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			bus_m1_booland_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			bus_m1_booland_05
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			bus_m1_booland_06
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			bus_m1_booland_07
			dropoff = 50
			dropoff_function = linear
		}
		sound8 = {
			bus_m1_booland_08
			dropoff = 50
			dropoff_function = linear
		}
		sound9 = {
			bus_m1_booland_09
			dropoff = 50
			dropoff_function = linear
		}
		sound10 = {
			bus_m1_booland_10
			dropoff = 50
			dropoff_function = linear
		}
	}
}
BusinessMan1_CheerLand_Stream_struct = {
	default_priority = 75
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
BusinessMan1_CheerLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			bus_m1_cheerland_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			bus_m1_cheerland_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			bus_m1_cheerland_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			bus_m1_cheerland_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			bus_m1_cheerland_05
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			bus_m1_cheerland_06
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			bus_m1_cheerland_07
			dropoff = 50
			dropoff_function = linear
		}
		sound8 = {
			bus_m1_cheerland_08
			dropoff = 50
			dropoff_function = linear
		}
		sound9 = {
			bus_m1_cheerland_09
			dropoff = 50
			dropoff_function = linear
		}
		sound10 = {
			bus_m1_cheerland_10
			dropoff = 50
			dropoff_function = linear
		}
	}
}
BusinessMan1_GetAngry_Stream_struct = {
	default_priority = 75
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
BusinessMan1_GetAngry_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			bus_m1_getangry_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			bus_m1_getangry_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			bus_m1_getangry_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			bus_m1_getangry_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			bus_m1_getangry_05
			dropoff = 50
			dropoff_function = linear
		}
	}
}
BusinessMan1_GetUp_Stream_struct = {
	default_priority = 75
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
BusinessMan1_GetUp_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			bus_m1_getup_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			bus_m1_getup_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			bus_m1_getup_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			bus_m1_getup_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			bus_m1_getup_05
			dropoff = 50
			dropoff_function = linear
		}
	}
}
BusinessMan1_KeepItUp_Stream_struct = {
	default_priority = 75
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
BusinessMan1_KeepItUp_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			bus_m1_keepitup_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			bus_m1_keepitup_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			bus_m1_keepitup_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			bus_m1_keepitup_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			bus_m1_keepitup_05
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			bus_m1_keepitup_06
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			bus_m1_keepitup_07
			dropoff = 50
			dropoff_function = linear
		}
		sound8 = {
			bus_m1_keepitup_08
			dropoff = 50
			dropoff_function = linear
		}
		sound9 = {
			bus_m1_keepitup_09
			dropoff = 50
			dropoff_function = linear
		}
		sound10 = {
			bus_m1_keepitup_10
			dropoff = 50
			dropoff_function = linear
		}
	}
}
BusinessWoman1_Avoid_Stream_struct = {
	default_priority = 75
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
BusinessWoman1_Avoid_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			bus_f1_avoid_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			bus_f1_avoid_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			bus_f1_avoid_03
			dropoff = 50
			dropoff_function = linear
		}
	}
}
BusinessWoman1_BooLand_Stream_struct = {
	default_priority = 75
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
BusinessWoman1_BooLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			bus_f1_booland_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			bus_f1_booland_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			bus_f1_booland_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			bus_f1_booland_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			bus_f1_booland_05
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			bus_f1_booland_06
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			bus_f1_booland_07
			dropoff = 50
			dropoff_function = linear
		}
		sound8 = {
			bus_f1_booland_08
			dropoff = 50
			dropoff_function = linear
		}
		sound9 = {
			bus_f1_booland_09
			dropoff = 50
			dropoff_function = linear
		}
		sound10 = {
			bus_f1_booland_10
			dropoff = 50
			dropoff_function = linear
		}
	}
}
BusinessWoman1_CheerLand_Stream_struct = {
	default_priority = 75
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
BusinessWoman1_CheerLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			bus_f1_cheerland_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			bus_f1_cheerland_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			bus_f1_cheerland_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			bus_f1_cheerland_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			bus_f1_cheerland_05
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			bus_f1_cheerland_06
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			bus_f1_cheerland_07
			dropoff = 50
			dropoff_function = linear
		}
		sound8 = {
			bus_f1_cheerland_08
			dropoff = 50
			dropoff_function = linear
		}
		sound9 = {
			bus_f1_cheerland_09
			dropoff = 50
			dropoff_function = linear
		}
		sound10 = {
			bus_f1_cheerland_10
			dropoff = 50
			dropoff_function = linear
		}
	}
}
BusinessWoman1_GetAngry_struct = {
	default_priority = 75
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
BusinessWoman1_GetAngry_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			bus_f1_getangry_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			bus_f1_getangry_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			bus_f1_getangry_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			bus_f1_getangry_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			bus_f1_getangry_05
			dropoff = 50
			dropoff_function = linear
		}
	}
}
BusinessWoman1_KeepItUp_Stream_struct = {
	default_priority = 75
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
BusinessWoman1_KeepItUp_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			bus_f1_keepitup_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			bus_f1_keepitup_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			bus_f1_keepitup_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			bus_f1_keepitup_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			bus_f1_keepitup_05
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			bus_f1_keepitup_06
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			bus_f1_keepitup_07
			dropoff = 50
			dropoff_function = linear
		}
		sound8 = {
			bus_f1_keepitup_08
			dropoff = 50
			dropoff_function = linear
		}
		sound9 = {
			bus_f1_keepitup_09
			dropoff = 50
			dropoff_function = linear
		}
		sound10 = {
			bus_f1_keepitup_10
			dropoff = 50
			dropoff_function = linear
		}
	}
}
BusinessWoman1_GetUp_Stream_struct = {
	default_priority = 75
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
BusinessWoman1_GetUp_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			bus_f1_getup_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			bus_f1_getup_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			bus_f1_getup_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			bus_f1_getup_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			bus_f1_getup_05
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Tourists01_TalkA_struct = {
	default_priority = 85
	default_buss = AmbScenes
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Tourists01_TalkA_container = {
	command = agent_playvo
	randomness = none
}
UI_statscreenchange_sfx_struct = {
	default_priority = 50
	default_buss = pausemenu
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
UI_statscreenchange_sfx_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_VE_deselect
			vol = 175
		}
	}
}
NotEnough_sfx_struct = {
	default_priority = 50
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
NotEnough_sfx_container = {
	command = playsound
	randomness = none
}
Sk9_Temp_Goal_Chkpt_SFX_c1_ntt_struct = {
	default_priority = 65
	default_buss = GoalFeedback
	norepeatfor = 0.3
	instancemanagement = stop_oldest
	instancelimit = 2
}
Sk9_Temp_Goal_Chkpt_SFX_c1_ntt_container = {
	command = playsound
	randomness = none
}
GoalFail_NoMusicMessing_ntt_struct = {
	default_priority = 95
	default_buss = frontend
	norepeatfor = 0.3
	instancemanagement = ignore
	instancelimit = 4
}
GoalFail_NoMusicMessing_ntt_container = {
	command = playsound
	randomness = none
}
sk9_m_h1_KickNow_SFX_clearmuseums_struct = {
	default_priority = 80
	default_buss = GoalFeedback
	norepeatfor = 0.5
	instancemanagement = stop_oldest
	instancelimit = 2
}
sk9_m_h1_KickNow_SFX_clearmuseums_container = {
	command = playsound
	randomness = none
}
Sk9_Temp_Goal_Chkpt_SFX_clearMuseums_struct = {
	default_priority = 65
	default_buss = GoalFeedback
	norepeatfor = 0.3
	instancemanagement = stop_oldest
	instancelimit = 2
}
Sk9_Temp_Goal_Chkpt_SFX_clearMuseums_container = {
	command = playsound
	randomness = none
}
m_h1_FinalEpic_Negatives_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 20
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h1_FinalEpic_Negatives_container = {
	command = playsound
	randomness = randomnorepeattype
}
m_h1_Finalepic_Positives_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 30
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h1_Finalepic_Positives_container = {
	command = playsound
	randomness = none
}
Sk9_Temp_Goal_Chkpt_SFX_BigPush_struct = {
	default_priority = 65
	default_buss = GoalFeedback
	norepeatfor = 0.3
	instancemanagement = stop_oldest
	instancelimit = 2
}
Sk9_Temp_Goal_Chkpt_SFX_BigPush_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			Temp_Goal_Chkpt_SFX
			vol = 100
		}
	}
}
sk9_fdr_train_SFX_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
sk9_fdr_train_SFX_container = {
	command = playsound
	randomness = none
}
FDR_Garage_Opening_struct = {
	default_priority = 70
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 2
}
FDR_Garage_Opening_container = {
	command = playsound
	randomness = none
}
FDR_Garage_Closing_struct = {
	default_priority = 70
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 2
}
FDR_Garage_Closing_container = {
	command = playsound
	randomness = none
}
FDR_sliding_gate_open_sfx_struct = {
	default_priority = 70
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 2
}
FDR_sliding_gate_open_sfx_container = {
	command = playsound
	randomness = none
}
FDR_sliding_gate_open_sfx_02_struct = {
	default_priority = 70
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 2
}
FDR_sliding_gate_open_sfx_02_container = {
	command = playsound
	randomness = none
}
FDR_sliding_gate_close_sfx_struct = {
	default_priority = 70
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 2
}
FDR_sliding_gate_close_sfx_container = {
	command = playsound
	randomness = none
}
FDR_sliding_gate_close_sfx_02_struct = {
	default_priority = 70
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 2
}
FDR_sliding_gate_close_sfx_02_container = {
	command = playsound
	randomness = none
}
FDR_Chainlink_Fence_Movement_struct = {
	default_priority = 90
	default_buss = zonesfx
	norepeatfor = 0.01
	instancemanagement = stop_oldest
	instancelimit = 10
}
FDR_Chainlink_Fence_Movement_container = {
	command = playsound
	randomness = none
}
FDR_Crate_Skater_Check_SFX_struct = {
	default_priority = 70
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
FDR_Crate_Skater_Check_SFX_container = {
	command = playsound
	randomness = none
}
SFX_FDR_Warehouse_Window_Shatter_struct = {
	default_priority = 70
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
SFX_FDR_Warehouse_Window_Shatter_container = {
	command = playsound
	randomness = none
}
m_training_grind_inst_01_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_grind_inst_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_grind_inst_01
			vol = 350
		}
	}
}
m_training_grind_inst_02_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_grind_inst_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_grind_inst_02
			vol = 350
		}
	}
}
m_training_grind_inst_03_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_grind_inst_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_grind_inst_03
			vol = 350
		}
	}
}
m_training_grind_inst_04_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_grind_inst_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_grind_inst_04
			vol = 350
		}
	}
}
m_training_grind_inst_05_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_grind_inst_05_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_grind_inst_05
			vol = 350
		}
	}
}
m_training_grind_inst_06_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_grind_inst_06_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_grind_inst_06
			vol = 350
		}
	}
}
m_training_grind_inst_07_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_grind_inst_07_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_grind_inst_07
			vol = 350
		}
	}
}
m_training_grind_inst_08_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_grind_inst_08_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_grind_inst_08
			vol = 350
		}
	}
}
m_training_grind_inst_09_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_grind_inst_09_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_grind_inst_09
			vol = 350
		}
	}
}
m_training_grind_inst_10_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_grind_inst_10_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_grind_inst_10
			vol = 350
		}
	}
}
m_training_manual_inst_01_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_manual_inst_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_manual_inst_01
			vol = 350
		}
	}
}
m_training_manual_inst_02_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_manual_inst_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_manual_inst_02
			vol = 350
		}
	}
}
m_training_manual_inst_03_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_manual_inst_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_manual_inst_03
			vol = 350
		}
	}
}
m_training_manual_inst_04_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_manual_inst_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_manual_inst_04
			vol = 350
		}
	}
}
m_training_manual_inst_05_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_manual_inst_05_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_manual_inst_05
			vol = 350
		}
	}
}
m_training_manual_inst_06_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_manual_inst_06_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_manual_inst_06
			vol = 350
		}
	}
}
m_training_manual_inst_07_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_manual_inst_07_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_manual_inst_07
			vol = 350
		}
	}
}
m_training_manual_inst_08_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_manual_inst_08_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_manual_inst_08
			vol = 350
		}
	}
}
m_training_manual_inst_09_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_manual_inst_09_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_manual_inst_09
			vol = 350
		}
	}
}
m_training_manual_inst_10_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_manual_inst_10_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_manual_inst_10
			vol = 350
		}
	}
}
m_training_qp2rail_inst_01_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_qp2rail_inst_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_qp2rail_inst_01
			vol = 350
		}
	}
}
m_training_qp2rail_inst_02_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_qp2rail_inst_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_qp2rail_inst_02
			vol = 350
		}
	}
}
m_training_qp2rail_inst_03_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_qp2rail_inst_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_qp2rail_inst_03
			vol = 350
		}
	}
}
m_training_qp2rail_inst_04_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_qp2rail_inst_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_qp2rail_inst_04
			vol = 350
		}
	}
}
m_training_qp2rail_inst_05_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_qp2rail_inst_05_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_qp2rail_inst_05
			vol = 350
		}
	}
}
m_training_qp2rail_inst_06_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_qp2rail_inst_06_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_qp2rail_inst_06
			vol = 350
		}
	}
}
m_training_qp2rail_inst_07_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_qp2rail_inst_07_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_qp2rail_inst_07
			vol = 350
		}
	}
}
m_training_qp2rail_inst_08_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_qp2rail_inst_08_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_qp2rail_inst_08
			vol = 350
		}
	}
}
m_training_qp2rail_inst_09_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_qp2rail_inst_09_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_qp2rail_inst_09
			vol = 350
		}
	}
}
m_training_qp2rail_inst_10_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_qp2rail_inst_10_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_qp2rail_inst_10
			vol = 350
		}
	}
}
m_training_qp2rail_inst_11_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_qp2rail_inst_11_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_qp2rail_inst_11
			vol = 350
		}
	}
}
m_training_qp2rail_inst_12_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_qp2rail_inst_12_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_qp2rail_inst_12
			vol = 350
		}
	}
}
m_training_qp2rail_inst_13_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_qp2rail_inst_13_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_qp2rail_inst_13
			vol = 350
		}
	}
}
m_training_qp2rail_inst_14_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_qp2rail_inst_14_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_qp2rail_inst_14
			vol = 350
		}
	}
}
m_training_qp2rail_inst_15_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_qp2rail_inst_15_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_qp2rail_inst_15
			vol = 350
		}
	}
}
m_training_qp2rail_inst_16_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_qp2rail_inst_16_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_qp2rail_inst_16
			vol = 350
		}
	}
}
m_training_qp2rail_inst_17_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_qp2rail_inst_17_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_qp2rail_inst_17
			vol = 350
		}
	}
}
m_training_qp2rail_inst_18_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_qp2rail_inst_18_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_qp2rail_inst_18
			vol = 350
		}
	}
}
m_training_line_inst_01_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_line_inst_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_line_inst_01
			vol = 350
		}
	}
}
m_training_line_inst_02_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_line_inst_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_line_inst_02
			vol = 350
		}
	}
}
m_training_line_inst_03_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_line_inst_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_line_inst_03
			vol = 350
		}
	}
}
m_training_line_inst_04_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_line_inst_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_line_inst_04
			vol = 350
		}
	}
}
m_training_line_inst_05_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_line_inst_05_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_line_inst_05
			vol = 350
		}
	}
}
m_training_line_inst_06_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_line_inst_06_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_line_inst_06
			vol = 350
		}
	}
}
m_training_revman_inst_01_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_revman_inst_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_revman_inst_01
			vol = 350
		}
	}
}
m_training_revman_inst_02_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_revman_inst_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_revman_inst_02
			vol = 350
		}
	}
}
m_training_revman_inst_03_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_revman_inst_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_revman_inst_03
			vol = 350
		}
	}
}
m_training_revman_inst_04_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_revman_inst_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_revman_inst_04
			vol = 350
		}
	}
}
m_training_revman_inst_05_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_revman_inst_05_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_revman_inst_05
			vol = 350
		}
	}
}
m_training_revman_inst_06_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_revman_inst_06_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_revman_inst_06
			vol = 350
		}
	}
}
m_training_revman_inst_07_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_revman_inst_07_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_revman_inst_07
			vol = 350
		}
	}
}
m_training_revman_inst_08_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_revman_inst_08_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_revman_inst_08
			vol = 350
		}
	}
}
m_training_revman_inst_09_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_revman_inst_09_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_revman_inst_09
			vol = 350
		}
	}
}
m_training_revman_inst_10_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_revman_inst_10_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_revman_inst_10
			vol = 350
		}
	}
}
m_training_revman_inst_11_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_revman_inst_11_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_revman_inst_11
			vol = 350
		}
	}
}
m_training_revman_inst_12_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_revman_inst_12_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_revman_inst_12
			vol = 350
		}
	}
}
m_training_revman_inst_13_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_revman_inst_13_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_revman_inst_13
			vol = 350
		}
	}
}
m_training_revman_inst_14_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.3
	instancemanagement = stop_oldest
	instancelimit = 4
}
m_training_revman_inst_14_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_revman_inst_14
			vol = 350
		}
	}
}
m_training_revman_inst_15_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_revman_inst_15_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_revman_inst_15
			vol = 350
		}
	}
}
m_training_revman_inst_16_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_revman_inst_16_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_revman_inst_16
			vol = 350
		}
	}
}
m_training_revman_inst_17_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_revman_inst_17_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_revman_inst_17
			vol = 350
		}
	}
}
m_training_revman_inst_18_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_revman_inst_18_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_revman_inst_18
			vol = 350
		}
	}
}
m_training_revman_inst_19_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_revman_inst_19_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_revman_inst_19
			vol = 350
		}
	}
}
m_training_revman_inst_20_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_revman_inst_20_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_revman_inst_20
			vol = 350
		}
	}
}
m_training_revman_inst_21_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_revman_inst_21_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_revman_inst_21
			vol = 350
		}
	}
}
m_training_revman_inst_22_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_revman_inst_22_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_revman_inst_22
			vol = 350
		}
	}
}
m_training_revman_inst_23_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_revman_inst_23_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_revman_inst_23
			vol = 350
		}
	}
}
m_training_revman_inst_24_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_revman_inst_24_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_revman_inst_24
			vol = 350
		}
	}
}
m_training_revman_inst_25_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_revman_inst_25_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_revman_inst_25
			vol = 350
		}
	}
}
m_training_revman_inst_26_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_revman_inst_26_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_revman_inst_26
			vol = 350
		}
	}
}
m_training_revman_inst_27_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_revman_inst_27_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_revman_inst_27
			vol = 350
		}
	}
}
progress_sfx_end_struct = {
	default_priority = 90
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
progress_sfx_end_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			progress_sfx_end
			vol = 200
		}
	}
}
sk9_progress_tick_struct = {
	default_priority = 50
	default_buss = GoalFeedback
	norepeatfor = 0.05
	instancemanagement = stop_oldest
	instancelimit = 5
}
sk9_progress_tick_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_progress_tick
			vol = 300
		}
	}
}
progress_cash_SFX_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 0.5
	instancemanagement = stop_oldest
	instancelimit = 1
}
progress_cash_SFX_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			cash
			pitch = 150
			vol = 150
		}
	}
}
progress_sfx_start_struct = {
	default_priority = 50
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
progress_sfx_start_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			progress_sfx_start
		}
	}
}
Bryce_Photo_Critique_Positive_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 3
	instancemanagement = stop_oldest
	instancelimit = 1
}
Bryce_Photo_Critique_Positive_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			Bryce_Critique_pos_01
			vol = 350
		}
		sound2 = {
			Bryce_Critique_pos_02
			vol = 350
		}
		sound3 = {
			Bryce_Critique_pos_03
			vol = 350
		}
		sound4 = {
			Bryce_Critique_pos_04
			vol = 350
		}
		sound5 = {
			Bryce_Critique_pos_05
			vol = 350
		}
		sound6 = {
			Bryce_Critique_pos_06
			vol = 350
		}
		sound7 = {
			Bryce_Critique_pos_07
			vol = 350
		}
		sound8 = {
			Bryce_Critique_pos_08
			vol = 350
		}
		sound9 = {
			Bryce_Critique_Pos_09
			vol = 350
		}
		sound10 = {
			Bryce_Critique_Pos_10
			vol = 350
		}
	}
}
Bryce_Photo_Critique_BAD_Neg_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 15
	instancemanagement = stop_oldest
	instancelimit = 1
}
Bryce_Photo_Critique_BAD_Neg_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			Bryce_Critique_BAD_neg_03
			vol = 350
		}
		sound2 = {
			Bryce_Critique_BAD_neg_01
			vol = 350
		}
		sound3 = {
			Bryce_Critique_BAD_neg_02
			vol = 350
		}
		sound4 = {
			Bryce_Critique_BAD_neg_04
			vol = 350
		}
		sound5 = {
			Bryce_Critique_BAD_neg_05
			vol = 350
		}
		sound6 = {
			Bryce_Critique_BAD_neg_06
			vol = 350
		}
		sound7 = {
			Bryce_Critique_BAD_neg_07
			vol = 350
		}
		sound8 = {
			Bryce_Critique_BAD_neg_08
			vol = 350
		}
		sound9 = {
			Bryce_Critique_BAD_neg_09
			vol = 350
		}
	}
}
Bryce_Photo_Critique_OK_Neg_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 15
	instancemanagement = stop_oldest
	instancelimit = 1
}
Bryce_Photo_Critique_OK_Neg_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			Bryce_Critique_OK_neg_01
			vol = 350
		}
		sound2 = {
			Bryce_Critique_OK_neg_02
			vol = 350
		}
		sound3 = {
			Bryce_Critique_OK_neg_03
			vol = 350
		}
		sound4 = {
			Bryce_Critique_OK_neg_04
			vol = 350
		}
		sound5 = {
			Bryce_Critique_OK_neg_05
			vol = 350
		}
		sound6 = {
			Bryce_Critique_OK_neg_06
			vol = 350
		}
		sound7 = {
			Bryce_Critique_OK_neg_07
			vol = 350
		}
		sound8 = {
			Bryce_Critique_OK_neg_08
			vol = 350
		}
		sound9 = {
			Bryce_Critique_OK_neg_09
			vol = 350
		}
		sound10 = {
			Bryce_Critique_OK_neg_10
			vol = 350
		}
		sound11 = {
			Bryce_Critique_OK_neg_11
			vol = 350
		}
		sound12 = {
			Bryce_Critique_OK_neg_12
			vol = 350
		}
		sound13 = {
			Bryce_Critique_OK_neg_13
			vol = 350
		}
		sound14 = {
			Bryce_Critique_OK_neg_14
			vol = 350
		}
		sound15 = {
			Bryce_Critique_OK_neg_15
			vol = 350
		}
		sound16 = {
			Bryce_Critique_OK_neg_16
			vol = 350
		}
		sound17 = {
			Bryce_Critique_OK_neg_17
			vol = 350
		}
		sound18 = {
			Bryce_Critique_OK_neg_18
			vol = 350
		}
	}
}
m_h3_NTB_chk1_pt1_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h3_NTB_chk1_pt1_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_ntb_inst_01
			vol = 350
		}
	}
}
m_h3_NTB_chk1_pt2_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h3_NTB_chk1_pt2_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_ntb_inst_02
			vol = 350
		}
	}
}
m_h3_NTB_chk1_pt3_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h3_NTB_chk1_pt3_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_ntb_inst_03
			vol = 350
		}
	}
}
m_h3_NTB_chk1_pt4_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h3_NTB_chk1_pt4_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_ntb_inst_05
			vol = 350
		}
	}
}
m_h3_NTB_chk2_pt1_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h3_NTB_chk2_pt1_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_ntb_inst_06
			vol = 350
		}
	}
}
m_h3_NTB_chk2_pt2_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h3_NTB_chk2_pt2_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_ntb_inst_07
			vol = 350
		}
	}
}
m_h3_NTB_chk2_pt4_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h3_NTB_chk2_pt4_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_ntb_inst_09
			vol = 350
		}
	}
}
m_h3_NTB_chk3_pt1_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h3_NTB_chk3_pt1_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_ntb_inst_10
			vol = 350
		}
	}
}
m_h3_NTB_chk3_pt2_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h3_NTB_chk3_pt2_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_ntb_inst_11
			vol = 350
		}
	}
}
m_h3_NTB_chk3_pt3_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h3_NTB_chk3_pt3_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_ntb_inst_12
			vol = 350
		}
	}
}
m_h3_NTB_chk3_pt4_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h3_NTB_chk3_pt4_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_ntb_inst_13
			vol = 350
		}
	}
}
m_h3_NTB_chk3_pt5_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h3_NTB_chk3_pt5_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_ntb_inst_14
			vol = 350
		}
	}
}
VO_m_h3_NTB_inst_15_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h3_NTB_inst_15_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_NTB_inst_15
			vol = 350
		}
	}
}
VO_m_h3_NTB_inst_16_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h3_NTB_inst_16_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_NTB_inst_16
			vol = 350
		}
	}
}
m_h3_ntb_Can_Grab_struct = {
	default_priority = 90
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 7
}
m_h3_ntb_Can_Grab_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			SK8_Bouncy_SprayCan_Collide_01
			vol = 250
		}
		sound2 = {
			SK8_Bouncy_SprayCan_Collide_02
			vol = 250
		}
	}
}
m_h3_ntb_sticker_grab_struct = {
	default_priority = 90
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h3_ntb_sticker_grab_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			sk8_Dance_Poster_01
			vol = 175
		}
		sound2 = {
			sk8_Dance_Poster_02
			vol = 175
		}
		sound3 = {
			sk8_Dance_Poster_03
			vol = 175
		}
	}
}
m_h3_ntb_Lance_positive_slash_struct = {
	default_priority = 70
	default_buss = GoalVO_DRY
	norepeatfor = 1.0
	instancemanagement = ignore
	instancelimit = 1
}
m_h3_ntb_Lance_positive_slash_container = {
	command = playsound
	randomness = none
}
m_h3_ntb_Lance_positive_carve_struct = {
	default_priority = 70
	default_buss = GoalVO_DRY
	norepeatfor = 1.0
	instancemanagement = ignore
	instancelimit = 1
}
m_h3_ntb_Lance_positive_carve_container = {
	command = playsound
	randomness = none
}
m_h3_ntb_Lance_negative_struct = {
	default_priority = 70
	default_buss = GoalVO_DRY
	norepeatfor = 1.0
	instancemanagement = ignore
	instancelimit = 1
}
m_h3_ntb_Lance_negative_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			m_h3_NTB_inc_neg_01
		}
		sound2 = {
			m_h3_NTB_inc_neg_02
		}
		sound3 = {
			m_h3_NTB_inc_neg_03
		}
	}
}
Rube_Attention_Stream_struct = {
	default_priority = 75
	default_buss = ProCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Rube_Attention_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			rube_attn_01
			dropoff = 50
			dropoff_function = linear
			vol = 50
		}
		sound2 = {
			rube_attn_02
			dropoff = 50
			dropoff_function = linear
			vol = 50
		}
		sound3 = {
			rube_attn_03
			dropoff = 50
			dropoff_function = linear
			vol = 50
		}
		sound4 = {
			rube_attn_04
			dropoff = 50
			dropoff_function = linear
			vol = 50
		}
		sound5 = {
			rube_attn_05
			dropoff = 50
			dropoff_function = linear
			vol = 50
		}
		sound6 = {
			rube_attn_06
			dropoff = 50
			dropoff_function = linear
			vol = 50
		}
		sound7 = {
			rube_attn_07
			dropoff = 50
			dropoff_function = linear
			vol = 50
		}
		sound8 = {
			rube_attn_08
			dropoff = 50
			dropoff_function = linear
			vol = 50
		}
	}
}
Rube_BooLand_Stream_struct = {
	default_priority = 75
	default_buss = ProCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Rube_BooLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			rube_booland_04
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			rube_booland_05
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			rube_booland_06
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			rube_booland_07
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			rube_booland_08
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			rube_booland_09
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			rube_booland_10
			dropoff = 50
			dropoff_function = linear
		}
		sound8 = {
			rube_booland_01
			dropoff = 50
			dropoff_function = linear
		}
		sound9 = {
			rube_booland_02
			dropoff = 50
			dropoff_function = linear
		}
		sound10 = {
			rube_booland_03
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Rube_CheerLand_Stream_struct = {
	default_priority = 75
	default_buss = ProCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Rube_CheerLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			rube_cheerland_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			rube_cheerland_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			rube_cheerland_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			rube_cheerland_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			rube_cheerland_05
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			rube_cheerland_06
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			rube_cheerland_07
			dropoff = 50
			dropoff_function = linear
		}
		sound8 = {
			rube_cheerland_08
			dropoff = 50
			dropoff_function = linear
		}
		sound9 = {
			rube_cheerland_09
			dropoff = 50
			dropoff_function = linear
		}
		sound10 = {
			rube_cheerland_10
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Mel_Attention_Stream_struct = {
	default_priority = 75
	default_buss = ProCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Mel_Attention_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			mel_attn_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			mel_attn_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			mel_attn_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			mel_attn_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			mel_attn_05
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			mel_attn_06
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Mel_Avoid_Stream_struct = {
	default_priority = 75
	default_buss = ProCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Mel_Avoid_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			mel_avoid_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			mel_avoid_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			mel_avoid_03
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Mel_BooLand_Stream_struct = {
	default_priority = 75
	default_buss = ProCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Mel_BooLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			mel_booland_03
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			mel_booland_04
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			mel_booland_05
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			mel_booland_06
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			mel_booland_07
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			mel_booland_08
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			mel_booland_09
			dropoff = 50
			dropoff_function = linear
		}
		sound8 = {
			mel_booland_10
			dropoff = 50
			dropoff_function = linear
		}
		sound9 = {
			mel_booland_01
			dropoff = 50
			dropoff_function = linear
		}
		sound10 = {
			mel_booland_02
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Mel_CheerLand_Stream_struct = {
	default_priority = 75
	default_buss = ProCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Mel_CheerLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			mel_cheerland_07
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			mel_cheerland_08
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			mel_cheerland_09
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			mel_cheerland_10
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			mel_cheerland_01
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			mel_cheerland_02
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			mel_cheerland_03
			dropoff = 50
			dropoff_function = linear
		}
		sound8 = {
			mel_cheerland_04
			dropoff = 50
			dropoff_function = linear
		}
		sound9 = {
			mel_cheerland_05
			dropoff = 50
			dropoff_function = linear
		}
		sound10 = {
			mel_cheerland_06
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Mel_Impatient_Stream_struct = {
	default_priority = 75
	default_buss = ProCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Mel_Impatient_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			mel_impatient_04
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			mel_impatient_05
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			mel_impatient_01
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			mel_impatient_02
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			mel_impatient_03
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Mel_KeepItUp_Stream_struct = {
	default_priority = 75
	default_buss = ProCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Mel_KeepItUp_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			mel_keepitup_02
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			mel_keepitup_03
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			mel_keepitup_01
			dropoff = 50
			dropoff_function = linear
		}
	}
}
m_c2_compstreet_inc_neg_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_compstreet_inc_neg_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			m_c2_compstreet_inc_neg_01
			vol = 350
		}
		sound2 = {
			m_c2_compstreet_inc_neg_02
			vol = 350
		}
		sound3 = {
			m_c2_compstreet_inc_neg_03
			vol = 350
		}
	}
}
m_c2_compstreet_inc_pos_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_compstreet_inc_pos_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			m_c2_compstreet_inc_pos_01
			vol = 350
		}
		sound2 = {
			m_c2_compstreet_inc_pos_02
			vol = 350
		}
		sound3 = {
			m_c2_compstreet_inc_pos_03
			vol = 350
		}
	}
}
m_c2_compstreet_inst_1_01_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_compstreet_inst_1_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_compstreet_inst_1_01
			vol = 350
		}
	}
}
m_c2_compstreet_inst_1_02_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_compstreet_inst_1_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_compstreet_inst_1_02
			vol = 350
		}
	}
}
m_c2_compstreet_inst_1_03_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_compstreet_inst_1_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_compstreet_inst_1_03
			vol = 350
		}
	}
}
m_c2_compstreet_inst_1_04_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_compstreet_inst_1_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_compstreet_inst_1_04
			vol = 350
		}
	}
}
m_c2_compstreet_inst_2_01_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_compstreet_inst_2_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_compstreet_inst_2_01
			vol = 350
		}
	}
}
m_c2_compstreet_inst_2_02_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_compstreet_inst_2_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_compstreet_inst_2_02
			vol = 350
		}
	}
}
m_c2_compstreet_inst_2_03_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_compstreet_inst_2_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_compstreet_inst_2_03
			vol = 350
		}
	}
}
m_c2_compstreet_inst_2_04_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_compstreet_inst_2_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_compstreet_inst_2_04
			vol = 350
		}
	}
}
m_c2_compstreet_inst_3_01_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_compstreet_inst_3_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_compstreet_inst_3_01
			vol = 350
		}
	}
}
m_c2_compstreet_inst_3_02_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_compstreet_inst_3_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_compstreet_inst_3_02
			vol = 350
		}
	}
}
m_c2_compstreet_inst_3_03_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_compstreet_inst_3_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_compstreet_inst_3_03
			vol = 350
		}
	}
}
sk8_Poster_SFX_struct = {
	default_priority = 70
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk8_Poster_SFX_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			sk8_Dance_Poster_01
			vol = 110
		}
		sound2 = {
			sk8_Dance_Poster_02
			vol = 110
		}
		sound3 = {
			sk8_Dance_Poster_03
			vol = 110
		}
	}
}
sk8_Collect_CD_struct = {
	default_priority = 70
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk8_Collect_CD_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			collect_cd
			vol = 150
		}
	}
}
sk9_Metal_Sign_Punch_struct = {
	default_priority = 70
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Metal_Sign_Punch_container = {
	command = playsound
	randomness = none
}
sk9_Stamp_Rip_struct = {
	default_priority = 70
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Stamp_Rip_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_stamp_rip
			vol = 200
		}
	}
}
m_r3_Monuments_chkp1_VO_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_Monuments_chkp1_VO_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_momeuments_inst_01
			vol = 350
		}
	}
}
m_r3_Monuments_chkp2p1_VO_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_Monuments_chkp2p1_VO_container = {
	command = playsound
	randomness = none
}
m_r3_Monuments_chkp2p2_VO_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_Monuments_chkp2p2_VO_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_momeuments_inst_03
			vol = 350
		}
	}
}
m_r3_Monuments_chkp2p3_VO_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_Monuments_chkp2p3_VO_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_momeuments_inst_04
			vol = 350
		}
	}
}
sk9_Banner_Dirt_SFX_struct = {
	default_priority = 70
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
}
sk9_Banner_Dirt_SFX_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_Banner_Dirt_SFX
			vol = 150
		}
	}
}
midgoal_rank_sfx_Classic_struct = {
	default_priority = 50
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
midgoal_rank_sfx_Classic_container = {
	command = playsound
	randomness = none
}
m_r3_love_chk1p1_VO_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_love_chk1p1_VO_container = {
	command = playsound
	randomness = none
}
m_r3_love_chk1p2_VO_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_love_chk1p2_VO_container = {
	command = playsound
	randomness = none
}
m_r3_love_chk1p3_VO_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_love_chk1p3_VO_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_love_inst_02
			vol = 350
		}
	}
}
m_r3_love_chk2p1_VO_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_love_chk2p1_VO_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_love_inst_02a
			vol = 350
		}
	}
}
m_r3_love_chk2p2_VO_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_love_chk2p2_VO_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_love_inst_03
			vol = 350
		}
	}
}
m_r3_love_chk2p3_VO_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_love_chk2p3_VO_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_love_inst_04
			vol = 350
		}
	}
}
m_r3_love_chk2p4_VO_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_love_chk2p4_VO_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_love_inst_05
			vol = 350
		}
	}
}
m_r3_love_lastp1_VO_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_love_lastp1_VO_container = {
	command = playsound
	randomness = none
}
m_r3_love_lastp2_VO_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_love_lastp2_VO_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_love_inst_08
			vol = 350
		}
	}
}
m_r3_love_lastp3_VO_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_love_lastp3_VO_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_love_inst_09
			vol = 350
		}
	}
}
m_r3_Bell_Chk1p1_VO_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_Bell_Chk1p1_VO_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_bell_inst_01
			vol = 350
		}
	}
}
m_r3_Bell_Chk1p2_VO_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_Bell_Chk1p2_VO_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_bell_inst_02b
			vol = 350
		}
	}
}
m_r3_Bell_Chk2p1_VO_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_Bell_Chk2p1_VO_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_bell_inst_04
			vol = 350
		}
	}
}
m_r3_Bell_Chk2p2_VO_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_Bell_Chk2p2_VO_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_bell_inst_05
			vol = 350
		}
	}
}
m_r3_Bell_Chk2p3_VO_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_Bell_Chk2p3_VO_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_bell_inst_06
			vol = 350
		}
	}
}
m_r3_Bell_Chk2p4_VO_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_Bell_Chk2p4_VO_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_bell_inst_07
			vol = 350
		}
	}
}
m_r3_Bell_Chk3p1_VO_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_Bell_Chk3p1_VO_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_bell_inst_11
			vol = 350
		}
	}
}
m_r3_Bell_Chk3p2_VO_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_Bell_Chk3p2_VO_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_bell_inst_12
			vol = 350
		}
	}
}
m_r3_Bell_Chk3p3_VO_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_Bell_Chk3p3_VO_container = {
	command = playsound
	randomness = none
}
m_r3_Bell_Chk3p4_VO_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_Bell_Chk3p4_VO_container = {
	command = playsound
	randomness = none
}
m_r3_Bell_lastp1_VO_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_Bell_lastp1_VO_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_bell_inst_08
			vol = 350
		}
	}
}
m_r3_Bell_lastp2_VO_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_Bell_lastp2_VO_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_bell_inst_09
			vol = 350
		}
	}
}
m_r3_Bell_lastp3_VO_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_Bell_lastp3_VO_container = {
	command = playsound
	randomness = none
}
m_r3_bell_VO_local_skater_negative_struct = {
	default_priority = 80
	default_buss = GoalVO_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_bell_VO_local_skater_negative_container = {
	command = playsound
	randomness = none
}
m_r3_bell_VO_local_skater_positive_struct = {
	default_priority = 80
	default_buss = GoalVO_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_bell_VO_local_skater_positive_container = {
	command = playsound
	randomness = none
}
m_r3_slums_chk1p1_VO_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_slums_chk1p1_VO_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_slums_inst_01
			vol = 350
		}
	}
}
m_r3_slums_chk1p2_VO_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_slums_chk1p2_VO_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_slums_inst_02
			vol = 350
		}
	}
}
m_r3_slums_chk1p3_VO_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_slums_chk1p3_VO_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_slums_inst_03
			vol = 350
		}
	}
}
m_r3_slums_chk2p1_VO_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_slums_chk2p1_VO_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_slums_inst_04
			vol = 350
		}
	}
}
m_r3_slums_chk2p2_VO_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_slums_chk2p2_VO_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_slums_inst_05
			vol = 350
		}
	}
}
m_r3_slums_chk2p3_VO_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_slums_chk2p3_VO_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_slums_inst_06
			vol = 350
		}
	}
}
m_r3_slums_chk2p4_VO_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_slums_chk2p4_VO_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_slums_inst_07
			vol = 350
		}
	}
}
m_r3_slums_lastp1_VO_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_slums_lastp1_VO_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_slums_inst_08
			vol = 350
		}
	}
}
m_r3_slums_lastp4_VO_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_slums_lastp4_VO_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_slums_inst_10
			vol = 350
		}
	}
}
Vallely_Attention_Stream_struct = {
	default_priority = 75
	default_buss = ProCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Vallely_Attention_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			vallely_attn_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			vallely_attn_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			vallely_attn_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			vallely_attn_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			vallely_attn_05
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			vallely_attn_06
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			vallely_attn_07
			dropoff = 50
			dropoff_function = linear
		}
		sound8 = {
			vallely_attn_08
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Vallely_Avoid_Stream_struct = {
	default_priority = 75
	default_buss = ProCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Vallely_Avoid_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			vallely_avoid_05
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			vallely_avoid_06
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			vallely_avoid_01
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			vallely_avoid_02
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			vallely_avoid_03
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			vallely_avoid_04
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Vallely_BooLand_Stream_struct = {
	default_priority = 75
	default_buss = ProCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Vallely_BooLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			vallely_booland_08
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			vallely_booland_09
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			vallely_booland_01
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			vallely_booland_02
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			vallely_booland_03
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			vallely_booland_04
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			vallely_booland_05
			dropoff = 50
			dropoff_function = linear
		}
		sound8 = {
			vallely_booland_06
			dropoff = 50
			dropoff_function = linear
		}
		sound9 = {
			vallely_booland_07
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Vallely_CheerLand_Stream_struct = {
	default_priority = 75
	default_buss = ProCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Vallely_CheerLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			vallely_cheerland_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			vallely_cheerland_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			vallely_cheerland_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			vallely_cheerland_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			vallely_cheerland_05
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			vallely_cheerland_06
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			vallely_cheerland_07
			dropoff = 50
			dropoff_function = linear
		}
		sound8 = {
			vallely_cheerland_08
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Vallely_Impatient_Stream_struct = {
	default_priority = 75
	default_buss = ProCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Vallely_Impatient_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			vallely_impatient_02
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			vallely_impatient_03
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			vallely_impatient_01
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Vallely_KeepItUp_Stream_struct = {
	default_priority = 75
	default_buss = ProCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Vallely_KeepItUp_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			vallely_keepitup_04
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			vallely_keepitup_01
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			vallely_keepitup_02
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			vallely_keepitup_03
			dropoff = 50
			dropoff_function = linear
		}
	}
}
VO_m_c2_localcomp_DQ_struct = {
	default_priority = 70
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_localcomp_DQ_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			m_c2_localcomp_inc_neg_09
			vol = 400
		}
		sound2 = {
			m_c2_localcomp_inc_neg_10
			vol = 400
		}
	}
}
VO_m_c2_localcomp_1BailsLeft_struct = {
	default_priority = 70
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_localcomp_1BailsLeft_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_localcomp_inc_neg_08
			vol = 60
		}
	}
}
VO_m_c2_localcomp_2BailsLeft_struct = {
	default_priority = 70
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_localcomp_2BailsLeft_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_localcomp_inc_neg_07
			vol = 60
		}
	}
}
VO_m_c2_localcomp_Neg_struct = {
	default_priority = 70
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_localcomp_Neg_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
}
VO_m_c2_localcomp_Positives_struct = {
	default_priority = 70
	default_buss = announcer
	norepeatfor = 3
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_localcomp_Positives_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
}
VO_m_c2_localcomp_Bails_struct = {
	default_priority = 65
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_localcomp_Bails_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
}
VO_m_c2_localcomp_Announc_Start_struct = {
	default_priority = 65
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_localcomp_Announc_Start_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			announcer_comp_04
			vol = 400
		}
		sound2 = {
			announcer_comp_05
			vol = 400
		}
		sound3 = {
			announcer_comp_06
			vol = 400
		}
		sound4 = {
			announcer_comp_01
			vol = 400
		}
		sound5 = {
			announcer_comp_02
			vol = 400
		}
		sound6 = {
			announcer_comp_03
			vol = 400
		}
	}
}
VO_m_c2_localcomp_Annouc_AMLAND_struct = {
	default_priority = 65
	default_buss = announcer
	norepeatfor = 1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_localcomp_Annouc_AMLAND_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
}
VO_m_c2_localcomp_Announc_PROLAND_struct = {
	default_priority = 65
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_localcomp_Announc_PROLAND_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
}
VO_m_c2_localcomp_Announc_SICKLAND_struct = {
	default_priority = 65
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_localcomp_Announc_SICKLAND_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
}
VO_m_c2_localcomp_Announc_OutofBounds_struct = {
	default_priority = 65
	default_buss = announcer
	norepeatfor = 5
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_localcomp_Announc_OutofBounds_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			announcer_outside_area_01
			vol = 400
		}
		sound2 = {
			announcer_outside_area_02
			vol = 400
		}
		sound3 = {
			announcer_outside_area_03
			vol = 400
		}
	}
}
VO_m_c2_localcomp_Annouc_TIME_struct = {
	default_priority = 65
	default_buss = announcer
	norepeatfor = 5
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_localcomp_Annouc_TIME_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
}
VO_m_c2_localcomp_Annouc_CleanLandingAM_struct = {
	default_priority = 65
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_localcomp_Annouc_CleanLandingAM_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			announcer_landed_clean_1a
			vol = 400
		}
		sound2 = {
			announcer_landed_clean_1b
			vol = 400
		}
		sound3 = {
			announcer_landed_clean_1c
			vol = 400
		}
	}
}
VO_m_c2_localcomp_Annouc_CleanLandingPRO_struct = {
	default_priority = 65
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_localcomp_Annouc_CleanLandingPRO_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			announcer_landed_clean_2a
			vol = 400
		}
		sound2 = {
			announcer_landed_clean_2b
			vol = 400
		}
		sound3 = {
			announcer_landed_clean_2c
			vol = 400
		}
	}
}
VO_m_c2_localcomp_Annouc_CleanLandingSICK_struct = {
	default_priority = 65
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_localcomp_Annouc_CleanLandingSICK_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			announcer_landed_clean_3a
			vol = 400
		}
		sound2 = {
			announcer_landed_clean_3b
			vol = 400
		}
		sound3 = {
			announcer_landed_clean_3c
			vol = 400
		}
	}
}
VO_m_c2_localcomp_Annouc_SloppyLanding_struct = {
	default_priority = 65
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_localcomp_Annouc_SloppyLanding_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			announcer_landed_sloppy_ok_01
			vol = 400
		}
		sound2 = {
			announcer_landed_sloppy_ok_02
			vol = 400
		}
		sound3 = {
			announcer_landed_sloppy_ok_03
			vol = 400
		}
	}
}
VO_m_c2_localcomp_Annouc_INCOMBO_struct = {
	default_priority = 65
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_localcomp_Annouc_INCOMBO_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
}
m_c2_compvert_inst_01_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_compvert_inst_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_compvert_inst_01
			vol = 350
		}
	}
}
m_c2_compvert_inst_02_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_compvert_inst_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_compvert_inst_02
			vol = 350
		}
	}
}
m_c2_compvert_inst_02b_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_compvert_inst_02b_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_compvert_inst_02b
			vol = 350
		}
	}
}
m_c2_compvert_inst_03_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_compvert_inst_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_compvert_inst_03
			vol = 350
		}
	}
}
m_c2_compvert_inst_04_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_compvert_inst_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_compvert_inst_04
			vol = 350
		}
	}
}
m_c2_compvert_inst_05_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_compvert_inst_05_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_compvert_inst_05
			vol = 350
		}
	}
}
m_c2_compvert_inst_06_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_compvert_inst_06_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_compvert_inst_06
			vol = 350
		}
	}
}
m_c2_compvert_inst_06b_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_compvert_inst_06b_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_compvert_inst_06b
			vol = 350
		}
	}
}
m_c2_compvert_inst_08_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_compvert_inst_08_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_compvert_inst_08
			vol = 350
		}
	}
}
m_c2_compvert_inst_09_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_compvert_inst_09_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_compvert_inst_09
			vol = 350
		}
	}
}
m_c2_compvert_inst_10_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_compvert_inst_10_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_compvert_inst_10
			vol = 350
		}
	}
}
m_c2_compvert_inst_11_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_compvert_inst_11_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_compvert_inst_11
			vol = 350
		}
	}
}
m_c2_compvert_inst_12_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_compvert_inst_12_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_compvert_inst_12
			vol = 350
		}
	}
}
m_c2_compvert_inst_13b_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_compvert_inst_13b_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_compvert_inst_13b
			vol = 350
		}
	}
}
m_c2_vertcomp_inst_01_struct = {
	default_priority = 65
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_vertcomp_inst_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_vertcomp_inst_01
			vol = 350
		}
	}
}
Aggro_Kick_Bad_SFX_struct = {
	default_priority = 65
	default_buss = BoardPush
	norepeatfor = 1.0
	instancemanagement = ignore
	instancelimit = 1
}
Aggro_Kick_Bad_SFX_container = {
	command = playsound
	randomness = none
}
m_c2_vertcomp_inst_04_struct = {
	default_priority = 65
	default_buss = announcer
	norepeatfor = 120
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_vertcomp_inst_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_vertcomp_inst_04
			vol = 350
		}
	}
}
VO_m_c2_compstreet_inst_01_struct = {
	default_priority = 65
	default_buss = GoalVO_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_compstreet_inst_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_compstreet_inst_01
			vol = 80
		}
	}
}
VO_m_h3_bowlcomp_inst_02_Announcer_struct = {
	default_priority = 70
	default_buss = announcer
	norepeatfor = 120
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h3_bowlcomp_inst_02_Announcer_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_bowlcomp_inst_02_ann
			vol = 400
		}
	}
}
m_h2_learncheck_tr_01_gp_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
m_h2_learncheck_tr_01_gp_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_learncheck_tr_01_gp
			vol = 350
		}
	}
}
m_c2_compstreet_outro_sheckler_01_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
m_c2_compstreet_outro_sheckler_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_compstreet_outro_sheckler_01
			vol = 350
		}
	}
}
m_h2_learncheck_tr_02_skater_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
m_h2_learncheck_tr_02_skater_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_learncheck_tr_02_skater
			vol = 350
		}
	}
}
m_h2_learncheck_tr_03_gp_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
m_h2_learncheck_tr_03_gp_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_learncheck_tr_03_gp
			vol = 350
		}
	}
}
m_h2_learncheck_tr_04_skater_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
m_h2_learncheck_tr_04_skater_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_learncheck_tr_04_skater
			vol = 350
		}
	}
}
m_h2_learncheck_tr_05_gp_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
m_h2_learncheck_tr_05_gp_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_learncheck_tr_05_gp
			vol = 350
		}
	}
}
m_h2_learncheck_tr_05_gp_ALT_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
m_h2_learncheck_tr_05_gp_ALT_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_learncheck_tr_05_gp_ALT
			vol = 350
		}
	}
}
m_h3_wallrides_challenge_spot_hit_SFX_struct = {
	default_priority = 70
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 3
}
m_h3_wallrides_challenge_spot_hit_SFX_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_Lamp_Break
			vol = 350
		}
	}
}
Spencer_Attention_Stream_struct = {
	default_priority = 75
	default_buss = ProCallouts_WET
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
Spencer_Attention_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			spencer_attn_01
			dropoff = 50
			dropoff_function = linear
			vol = 50
		}
		sound2 = {
			spencer_attn_02
			dropoff = 50
			dropoff_function = linear
			vol = 50
		}
		sound3 = {
			spencer_attn_03
			dropoff = 50
			dropoff_function = linear
			vol = 50
		}
		sound4 = {
			spencer_attn_04
			dropoff = 50
			dropoff_function = linear
			vol = 50
		}
		sound5 = {
			spencer_attn_05
			dropoff = 50
			dropoff_function = linear
			vol = 50
		}
		sound6 = {
			spencer_attn_06
			dropoff = 50
			dropoff_function = linear
			vol = 50
		}
	}
}
Spencer_Avoid_Stream_struct = {
	default_priority = 75
	default_buss = ProCallouts_WET
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
Spencer_Avoid_Stream_container = {
	command = agent_playvo
	randomness = none
	sounds = {
		sound1 = {
			spencer_avoid_01
			dropoff = 50
			dropoff_function = linear
			vol = 65
		}
		sound2 = {
			spencer_avoid_02
			dropoff = 50
			dropoff_function = linear
			vol = 65
		}
		sound3 = {
			spencer_avoid_03
			dropoff = 50
			dropoff_function = linear
			vol = 65
		}
	}
}
Close_Call_struct = {
	default_priority = 65
	default_buss = announcer
	norepeatfor = 1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Close_Call_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
}
Jeep_Honk_Stream_struct = {
	default_priority = 75
	default_buss = vehicle
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
Jeep_Honk_Stream_container = {
	command = obj_playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			Jeep_Honk01
			vol = 400
		}
		sound2 = {
			Jeep_Honk02
			vol = 400
		}
		sound3 = {
			Jeep_Honk03
			vol = 400
		}
		sound4 = {
			Jeep_Honk04
			vol = 400
		}
		sound5 = {
			Jeep_Honk05
			vol = 400
		}
	}
}
Jeep_VehicleStoppedForPed_Stream_struct = {
	default_priority = 75
	default_buss = vehicle
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
Jeep_VehicleStoppedForPed_Stream_container = {
	command = obj_playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			Jeep_VehicleStoppedForPed01
			vol = 400
		}
		sound2 = {
			Jeep_VehicleStoppedForPed02
			vol = 400
		}
		sound3 = {
			Jeep_VehicleStoppedForPed03
			vol = 400
		}
	}
}
LargeSedan_Honk0_Stream_container = {
	command = obj_playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			LargeSedan_Horn01
			vol = 400
		}
		sound2 = {
			LargeSedan_Horn02
			vol = 400
		}
		sound3 = {
			LargeSedan_Horn03
			vol = 400
		}
		sound4 = {
			LargeSedan_Horn04
			vol = 400
		}
		sound5 = {
			LargeSedan_Horn05
			vol = 400
		}
	}
}
LargeSedan_VehicleStoppedForPed_Stream_struct = {
	default_priority = 75
	default_buss = vehicle
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
LargeSedan_VehicleStoppedForPed_Stream_container = {
	command = obj_playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			LargeSedan_VehicleStoppedForPed01
			vol = 400
		}
		sound2 = {
			LargeSedan_VehicleStoppedForPed02
			vol = 400
		}
		sound3 = {
			LargeSedan_VehicleStoppedForPed03
			vol = 400
		}
	}
}
Minivan_Honk_Stream_struct = {
	default_priority = 75
	default_buss = vehicle
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
Minivan_Honk_Stream_container = {
	command = obj_playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			Minivan_Honk01
			vol = 400
		}
		sound2 = {
			Minivan_Honk02
			vol = 400
		}
		sound3 = {
			Minivan_Honk03
			vol = 400
		}
		sound4 = {
			Minivan_Honk04
			vol = 400
		}
		sound5 = {
			Minivan_Honk05
			vol = 400
		}
	}
}
Minivan_VehicleStoppedForPed_Stream_struct = {
	default_priority = 75
	default_buss = vehicle
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
Minivan_VehicleStoppedForPed_Stream_container = {
	command = obj_playsound
	randomness = none
	sounds = {
		sound1 = {
			Minivan_VehicleStoppedForPed01
			vol = 400
		}
		sound2 = {
			Minivan_VehicleStoppedForPed02
			vol = 400
		}
		sound3 = {
			Minivan_VehicleStoppedForPed03
			vol = 400
		}
	}
}
OldCar_Honk_Stream_struct = {
	default_priority = 75
	default_buss = vehicle
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
OldCar_Honk_Stream_container = {
	command = obj_playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			OldCar_Horn01
			vol = 400
		}
		sound2 = {
			OldCar_Horn02
			vol = 400
		}
		sound3 = {
			OldCar_Horn03
			vol = 400
		}
		sound4 = {
			OldCar_Horn04
			vol = 400
		}
		sound5 = {
			OldCar_Horn05
			vol = 400
		}
	}
}
OldCar_VehicleStoppedForPed_Stream_struct = {
	default_priority = 75
	default_buss = vehicle
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
OldCar_VehicleStoppedForPed_Stream_container = {
	command = obj_playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			OldCar_VehicleStoppedForPed01
			vol = 400
		}
		sound2 = {
			OldCar_VehicleStoppedForPed02
			vol = 400
		}
		sound3 = {
			OldCar_VehicleStoppedForPed03
			vol = 400
		}
	}
}
SmallSedan_Honk_Stream_struct = {
	default_priority = 75
	default_buss = vehicle
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
SmallSedan_Honk_Stream_container = {
	command = obj_playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			SmallSedan_Honk01
			vol = 400
		}
		sound2 = {
			SmallSedan_Honk02
			vol = 400
		}
		sound3 = {
			SmallSedan_Honk03
			vol = 400
		}
		sound4 = {
			SmallSedan_Honk04
			vol = 400
		}
		sound5 = {
			SmallSedan_Honk05
			vol = 400
		}
	}
}
SmallSedan_VehicleStoppedForPed_Stream_struct = {
	default_priority = 75
	default_buss = vehicle
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
SmallSedan_VehicleStoppedForPed_Stream_container = {
	command = obj_playsound
	randomness = none
	sounds = {
		sound1 = {
			SmallSedan_VehicleStoppedForPed01
			vol = 400
		}
		sound2 = {
			SmallSedan_VehicleStoppedForPed02
			vol = 400
		}
		sound3 = {
			SmallSedan_VehicleStoppedForPed03
			vol = 400
		}
	}
}
Workvan_Honk_Stream_struct = {
	default_priority = 75
	default_buss = vehicle
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
Workvan_Honk_Stream_container = {
	command = obj_playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			Workvan_Honk01
			vol = 400
		}
		sound2 = {
			Workvan_Honk02
			vol = 400
		}
		sound3 = {
			Workvan_Honk03
			vol = 400
		}
		sound4 = {
			Workvan_Honk04
			vol = 400
		}
		sound5 = {
			Workvan_Honk05
			vol = 400
		}
	}
}
Workvan_VehicleStoppedForPed_Stream_struct = {
	default_priority = 75
	default_buss = vehicle
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
Workvan_VehicleStoppedForPed_Stream_container = {
	command = obj_playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			Workvan_VehicleStoppedForPed01
			vol = 400
		}
		sound2 = {
			Workvan_VehicleStoppedForPed02
			vol = 400
		}
		sound3 = {
			Workvan_VehicleStoppedForPed03
			vol = 400
		}
	}
}
VO_m_impress_c1_inst_02_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_impress_c1_inst_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_impress_c1_inst_02
			vol = 350
		}
	}
}
VO_m_impress_c1_inst_01_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_impress_c1_inst_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_impress_c1_inst_01
			vol = 350
		}
	}
}
VO_m_impress_c1_inst_03_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_impress_c1_inst_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_impress_c1_inst_03
			vol = 350
		}
	}
}
VO_m_impress_c1_inst_04_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_impress_c1_inst_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_impress_c1_inst_04
			vol = 350
		}
	}
}
VO_m_impress_c1_inst_05_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_impress_c1_inst_05_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_impress_c1_inst_05
			vol = 350
		}
	}
}
VO_m_impress_c1_inc_pos_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_impress_c1_inc_pos_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
}
Saari_neg_impress_c1_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 15
	instancemanagement = stop_oldest
	instancelimit = 1
}
Saari_neg_impress_c1_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
}
VO_m_c2_localcomp_Annouc_INCOMBO_SICK_struct = {
	default_priority = 65
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_localcomp_Annouc_INCOMBO_SICK_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
}
VO_m_r1_showdown_inst_01_1_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r1_showdown_inst_01_1_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_showdown_inst_01_1
			vol = 350
		}
	}
}
VO_m_r1_showdown_inst_01_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r1_showdown_inst_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_showdown_inst_01
			vol = 350
		}
	}
}
VO_m_r1_showdown_inst_01_2_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r1_showdown_inst_01_2_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_showdown_inst_01_2
			vol = 350
		}
	}
}
VO_m_r1_showdown_inst_01_3_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r1_showdown_inst_01_3_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_showdown_inst_01_3
			vol = 350
		}
	}
}
VO_m_r1_showdown_inst_06_1_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r1_showdown_inst_06_1_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_showdown_inst_06_1
			vol = 350
		}
	}
}
VO_m_r1_showdown_inst_06_2_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r1_showdown_inst_06_2_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_showdown_inst_06_2
			vol = 350
		}
	}
}
VO_m_r1_showdown_inst_11_1_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r1_showdown_inst_11_1_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_showdown_inst_11_1
			vol = 350
		}
	}
}
VO_m_r1_showdown_inst_11_2_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r1_showdown_inst_11_2_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_showdown_inst_11_2
			vol = 350
		}
	}
}
VO_m_r1_showdown_inst_17_1_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r1_showdown_inst_17_1_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_showdown_inst_17_1
			vol = 350
		}
	}
}
VO_m_h3_secret1_inst_04_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h3_secret1_inst_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_secret1_inst_04
			vol = 350
		}
	}
}
VO_m_h3_secret1_inst_05_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h3_secret1_inst_05_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_secret1_inst_05
			vol = 350
		}
	}
}
VO_m_h3_secret1_inst_06_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h3_secret1_inst_06_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_secret1_inst_06
			vol = 350
		}
	}
}
VO_m_h3_secret1_inst_07_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h3_secret1_inst_07_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_secret1_inst_07
			vol = 350
		}
	}
}
VO_m_h3_secret1_inst_08_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h3_secret1_inst_08_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_secret1_inst_08
			vol = 350
		}
	}
}
VO_m_h3_secret1_inst_09_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h3_secret1_inst_09_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_secret1_inst_09
			vol = 350
		}
	}
}
VO_m_h3_secret1_inst_10_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h3_secret1_inst_10_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_secret1_inst_10
			vol = 350
		}
	}
}
VO_m_h3_secret1_inst_11_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h3_secret1_inst_11_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_secret1_inst_11
			vol = 350
		}
	}
}
GoalFail_NoMusicMessing_NoRepeat_struct = {
	default_priority = 95
	default_buss = frontend
	norepeatfor = 2
	instancemanagement = ignore
	instancelimit = 2
}
GoalFail_NoMusicMessing_NoRepeat_container = {
	command = playsound
	randomness = none
}
skate_poster_rip_struct = {
	default_priority = 75
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
skate_poster_rip_container = {
	command = obj_playsound
	randomness = randomnorepeattype
}
street_goal_pos_struct = {
	default_priority = 75
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
street_goal_pos_container = {
	command = playsound
	randomness = randomnorepeattype
}
street_goal_car_struct = {
	default_priority = 75
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
street_goal_car_container = {
	command = playsound
	randomness = randomnorepeattype
}
street_goal_rig_struct = {
	default_priority = 75
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
street_goal_rig_container = {
	command = playsound
	randomness = randomnorepeattype
}
street_goal_hxc_struct = {
	default_priority = 75
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
street_goal_hxc_container = {
	command = playsound
	randomness = randomnorepeattype
}
street_goal_am_struct = {
	default_priority = 75
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
street_goal_am_container = {
	command = playsound
	randomness = randomnorepeattype
}
street_goal_pro_struct = {
	default_priority = 75
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
street_goal_pro_container = {
	command = playsound
	randomness = randomnorepeattype
}
street_goal_team_struct = {
	default_priority = 75
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
street_goal_team_container = {
	command = playsound
	randomness = randomnorepeattype
}
street_goal_neg_struct = {
	default_priority = 75
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
street_goal_neg_container = {
	command = playsound
	randomness = randomnorepeattype
}
natas_squid_sfx_struct = {
	default_priority = 50
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
natas_squid_sfx_container = {
	command = playsound
	randomness = randomnorepeattype
}
jackhammer_sfx_struct = {
	default_priority = 50
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
jackhammer_sfx_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_jackhammer_sfx
			vol = 300
		}
	}
}
shoe_stall_sfx_struct = {
	default_priority = 50
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
shoe_stall_sfx_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			Sk8_CaS_Shoe_On_VelcroTie
			vol = 300
		}
	}
}
VO_m_r1_buildqp_inst_13_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
VO_m_r1_buildqp_inst_13_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_buildqp_inst_13
			vol = 350
		}
	}
}
VO_m_r1_buildqp_inst_14_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
VO_m_r1_buildqp_inst_14_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_buildqp_inst_14
			vol = 350
		}
	}
}
VO_m_r1_buildqp_inst_15_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
VO_m_r1_buildqp_inst_15_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_buildqp_inst_15
			vol = 350
		}
	}
}
VO_m_r1_buildqp_inst_16_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
VO_m_r1_buildqp_inst_16_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_buildqp_inst_16
			vol = 350
		}
	}
}
VO_m_r1_buildqp_inst_17_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
VO_m_r1_buildqp_inst_17_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_buildqp_inst_17
			vol = 350
		}
	}
}
VO_m_r1_buildqp_inst_18_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
VO_m_r1_buildqp_inst_18_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_buildqp_inst_18
			vol = 350
		}
	}
}
VO_m_r1_buildqp_inst_19_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
VO_m_r1_buildqp_inst_19_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_buildqp_inst_19
			vol = 350
		}
	}
}
VO_m_r1_buildqp_neg_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 10.0
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r1_buildqp_neg_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			m_r1_buildqp_inc_neg_03
			vol = 350
		}
		sound2 = {
			m_r1_buildqp_inc_neg_02
			vol = 350
		}
		sound3 = {
			King_booland_02
			vol = 350
		}
		sound4 = {
			King_booland_03
			vol = 350
		}
		sound5 = {
			King_booland_05
			vol = 350
		}
		sound6 = {
			King_booland_06
			vol = 350
		}
		sound7 = {
			King_booland_07
			vol = 350
		}
		sound8 = {
			King_booland_08
			vol = 350
		}
	}
}
VO_m_r1_buildqp_pos_struct = {
	default_priority = 95
	default_buss = MissionSFX
	norepeatfor = 10.0
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r1_buildqp_pos_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			m_r1_buildqp_inc_pos_01
			vol = 350
		}
		sound2 = {
			m_r1_buildqp_inc_pos_03
			vol = 350
		}
		sound3 = {
			m_r1_buildqp_inc_pos_05
			vol = 350
		}
		sound4 = {
			m_r1_buildqp_inc_pos_06
			vol = 350
		}
		sound5 = {
			King_cheerland_01
			vol = 350
		}
		sound6 = {
			King_cheerland_05
			vol = 350
		}
		sound7 = {
			King_cheerland_04
			vol = 350
		}
		sound8 = {
			King_cheerland_06
			vol = 350
		}
		sound9 = {
			King_cheerland_09
			vol = 350
		}
	}
}
Burnquist_Attention_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Burnquist_Attention_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			burnquist_attn_04
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			burnquist_attn_05
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			burnquist_attn_06
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			burnquist_attn_01
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			burnquist_attn_02
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			burnquist_attn_03
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Burnquist_Avoid_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Burnquist_Avoid_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			burnquist_avoid_04
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			burnquist_avoid_05
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			burnquist_avoid_06
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			burnquist_avoid_07
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			burnquist_avoid_01
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			burnquist_avoid_02
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			burnquist_avoid_03
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Burnquist_BooLand_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Burnquist_BooLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			burnquist_booland_06
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			burnquist_booland_07
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			burnquist_booland_08
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			burnquist_booland_09
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			burnquist_booland_01
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			burnquist_booland_02
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			burnquist_booland_03
			dropoff = 50
			dropoff_function = linear
		}
		sound8 = {
			burnquist_booland_04
			dropoff = 50
			dropoff_function = linear
		}
		sound9 = {
			burnquist_booland_05
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Burnquist_CheerLand_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Burnquist_CheerLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			burnquist_cheerland_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			burnquist_cheerland_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			burnquist_cheerland_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			burnquist_cheerland_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			burnquist_cheerland_05
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			burnquist_cheerland_07
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			burnquist_cheerland_08
			dropoff = 50
			dropoff_function = linear
		}
		sound8 = {
			burnquist_cheerland_09
			dropoff = 50
			dropoff_function = linear
		}
		sound9 = {
			burnquist_cheerland_10
			dropoff = 50
			dropoff_function = linear
		}
		sound10 = {
			burnquist_cheerland_11
			dropoff = 50
			dropoff_function = linear
		}
		sound11 = {
			burnquist_cheerland_12
			dropoff = 50
			dropoff_function = linear
		}
		sound12 = {
			burnquist_cheerland_13
			dropoff = 50
			dropoff_function = linear
		}
		sound13 = {
			burnquist_cheerland_14
			dropoff = 50
			dropoff_function = linear
		}
		sound14 = {
			burnquist_cheerland_15
			dropoff = 50
			dropoff_function = linear
		}
		sound15 = {
			burnquist_cheerland_16
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Burnquist_Impatient_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Burnquist_Impatient_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			burnquist_impatient_02
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			burnquist_impatient_03
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			burnquist_impatient_04
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			burnquist_impatient_01
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Burnquist_KeepItUp_Stream_struct = {
	default_priority = 50
	default_buss = ProCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Burnquist_KeepItUp_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			burnquist_keepitup_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			burnquist_keepitup_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			burnquist_keepitup_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			burnquist_keepitup_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			burnquist_keepitup_05
			dropoff = 50
			dropoff_function = linear
		}
	}
}
VO_m_h3_secret2_inst_04_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h3_secret2_inst_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_secret2_inst_04
			vol = 350
		}
	}
}
VO_m_h3_secret2_inst_05_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h3_secret2_inst_05_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_secret2_inst_05
			vol = 350
		}
	}
}
VO_m_h3_secret2_inst_06_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h3_secret2_inst_06_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_secret2_inst_06
			vol = 350
		}
	}
}
VO_m_h3_secret2_inst_07_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h3_secret2_inst_07_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_secret2_inst_07
			vol = 350
		}
	}
}
VO_m_h3_secret2_inst_08_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h3_secret2_inst_08_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_secret2_inst_08
			vol = 350
		}
	}
}
VO_m_h3_secret2_inst_09_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h3_secret2_inst_09_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_secret2_inst_09
			vol = 350
		}
	}
}
VO_m_h3_secret2_inst_10_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h3_secret2_inst_10_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_secret2_inst_10
			vol = 350
		}
	}
}
VO_m_h3_bowlcomp_inst_05_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h3_bowlcomp_inst_05_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_bowlcomp_inst_05
			vol = 350
		}
	}
}
VO_m_h3_bowlcomp_inst_06_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h3_bowlcomp_inst_06_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_bowlcomp_inst_06
			vol = 350
		}
	}
}
VO_m_h3_bowlcomp_inst_07_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h3_bowlcomp_inst_07_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_bowlcomp_inst_07
			vol = 350
		}
	}
}
VO_m_h3_bowlcomp_inst_08_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h3_bowlcomp_inst_08_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_bowlcomp_inst_08
			vol = 350
		}
	}
}
VO_m_h3_bowlcomp_inst_04_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h3_bowlcomp_inst_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_bowlcomp_inst_04
			vol = 350
		}
	}
}
VO_m_h3_secret1_inst_13_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h3_secret1_inst_13_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_secret1_inst_13
			vol = 350
		}
	}
}
VO_m_h3_secret1_inst_14_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h3_secret1_inst_14_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_secret1_inst_14
			vol = 350
		}
	}
}
VO_m_h3_secret1_inst_15_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h3_secret1_inst_15_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_secret1_inst_15
			vol = 350
		}
	}
}
VO_m_h3_secret1_inst_16_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h3_secret1_inst_16_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_secret1_inst_16
			vol = 350
		}
	}
}
VO_m_h3_secret1_inst_17_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h3_secret1_inst_17_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_secret1_inst_17
			vol = 350
		}
	}
}
VO_m_h3_secret1_inst_18_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h3_secret1_inst_18_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_secret1_inst_18
			vol = 350
		}
	}
}
sk9_sticker_Grab_struct = {
	default_priority = 70
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 10
}
sk9_sticker_Grab_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_Sticker_Grab
			vol = 350
		}
	}
}
VO_m_h3_secret1_inst_02_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h3_secret1_inst_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_secret1_inst_02
			vol = 350
		}
	}
}
VO_m_h3_secret1_inst_03_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h3_secret1_inst_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_secret1_inst_03
			vol = 350
		}
	}
}
VO_m_h3_secret2_neg_struct = {
	default_priority = 70
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h3_secret2_neg_container = {
	command = playsound
	randomness = randomnorepeattype
}
VO_m_h3_secret2_pos_struct = {
	default_priority = 70
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h3_secret2_pos_container = {
	command = playsound
	randomness = randomnorepeattype
}
sk9_House_Sliding_Door_Open_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 2
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_House_Sliding_Door_Open_container = {
	command = playsound
	randomness = none
}
sk9_House_Sliding_Door_Close_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 2
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_House_Sliding_Door_Close_container = {
	command = playsound
	randomness = none
}
VO_m_c3_EpicPhoto2_inst_p1_01_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c3_EpicPhoto2_inst_p1_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c3_epicphoto2_inst_p1_01
			vol = 350
		}
	}
}
VO_m_c3_EpicPhoto2_inst_p1_02_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c3_EpicPhoto2_inst_p1_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c3_epicphoto2_inst_p1_02
			vol = 350
		}
	}
}
VO_m_c3_EpicPhoto2_inst_p1_03_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c3_EpicPhoto2_inst_p1_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c3_epicphoto2_inst_p1_03
			vol = 350
		}
	}
}
VO_m_c3_EpicPhoto2_inst_p1_04_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c3_EpicPhoto2_inst_p1_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c3_epicphoto2_inst_p1_04
			vol = 350
		}
	}
}
VO_m_c3_EpicPhoto2_inst_p2_01_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c3_EpicPhoto2_inst_p2_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c3_epicphoto2_inst_p2_01
			vol = 350
		}
	}
}
VO_m_c3_EpicPhoto2_inst_p2_02_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c3_EpicPhoto2_inst_p2_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c3_epicphoto2_inst_p2_02
			vol = 350
		}
	}
}
VO_m_c3_EpicPhoto2_inst_p3_01_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c3_EpicPhoto2_inst_p3_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c3_epicphoto2_inst_p3_01
			vol = 350
		}
	}
}
VO_m_c3_EpicPhoto2_inst_p3_02_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c3_EpicPhoto2_inst_p3_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c3_epicphoto2_inst_p3_02
			vol = 350
		}
	}
}
VO_m_c3_epicphoto4_inst_01_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c3_epicphoto4_inst_01_container = {
	command = obj_playsound
	randomness = none
}
VO_m_c3_epicphoto4_inst_02_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c3_epicphoto4_inst_02_container = {
	command = obj_playsound
	randomness = none
}
GoalFail_NoMusicMessing_ntg_struct = {
	default_priority = 95
	default_buss = frontend
	norepeatfor = 4
	instancemanagement = ignore
	instancelimit = 4
}
GoalFail_NoMusicMessing_ntg_container = {
	command = playsound
	randomness = none
}
m_c2_impress_inst_01_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_impress_inst_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_impress_c2_inst_01
			vol = 350
		}
	}
}
m_c2_impress_inst_02_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_impress_inst_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_impress_c2_inst_02
			vol = 350
		}
	}
}
m_c2_impress_inst_03_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_impress_inst_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_impress_c2_inst_03
			vol = 350
		}
	}
}
m_c2_impress_inst_04_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_impress_inst_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_impress_c2_inst_04
			vol = 350
		}
	}
}
m_c2_impress_inst_outro_01_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_impress_inst_outro_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_impress_c2_outro_01
			vol = 350
		}
	}
}
m_c2_impress_positive_callouts_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_impress_positive_callouts_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			m_impress_c2_inc_pos_01
			vol = 350
		}
		sound2 = {
			m_impress_c2_inc_pos_02
			vol = 350
		}
		sound3 = {
			m_impress_c2_inc_pos_03
			vol = 350
		}
		sound4 = {
			m_impress_c2_inc_pos_04
			vol = 350
		}
	}
}
m_h1_impress_inst_01_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h1_impress_inst_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_impress_h1_inst_02
			vol = 350
		}
	}
}
m_h1_impress_inst_02_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h1_impress_inst_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_impress_h1_inst_01
			vol = 350
		}
	}
}
m_h1_impress_inst_03_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h1_impress_inst_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_impress_h1_inst_03
			vol = 350
		}
	}
}
m_h1_impress_inst_outro_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h1_impress_inst_outro_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_impress_h1_outro_01
			vol = 350
		}
	}
}
m_c3_impress_inst_01_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c3_impress_inst_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_impress_c3_inst_03
			vol = 350
		}
	}
}
m_c3_impress_inst_02_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c3_impress_inst_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_impress_c3_inst_04
			vol = 350
		}
	}
}
m_c3_impress_inst_03_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c3_impress_inst_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_impress_c3_inst_05
			vol = 350
		}
	}
}
m_c3_impress_outro_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c3_impress_outro_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_impress_c3_outro_01
			vol = 350
		}
	}
}
m_h2_impress_inst_01_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h2_impress_inst_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_impress_inst_01
			vol = 350
		}
	}
}
m_h2_impress_inst_02_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h2_impress_inst_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_impress_inst_02
			vol = 350
		}
	}
}
m_h2_impress_inst_03_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h2_impress_inst_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_impress_inst_03
			vol = 350
		}
	}
}
m_h2_impress_outro_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h2_impress_outro_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_impress_success_01
			vol = 350
		}
	}
}
m_h2_impress_positive_callouts_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h2_impress_positive_callouts_container = {
	command = playsound
	randomness = none
}
m_h2_impress_negative_callouts_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h2_impress_negative_callouts_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			m_h2_impress_inc_neg_01
			vol = 350
		}
		sound2 = {
			m_h2_impress_inc_neg_02
			vol = 350
		}
		sound3 = {
			m_h2_impress_inc_neg_03
			vol = 350
		}
	}
}
m_r1_impress_inst_01_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r1_impress_inst_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_impress_r1_inst_01
			vol = 350
		}
	}
}
m_r1_impress_inst_02_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r1_impress_inst_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_impress_r1_inst_02
			vol = 350
		}
	}
}
m_r1_impress_inst_03_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r1_impress_inst_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_impress_r1_inst_03
			vol = 350
		}
	}
}
rage_heart_sfx_struct = {
	default_priority = 75
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
rage_heart_sfx_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			rage_heart_sfx
			num_loops = -1
		}
	}
}
stop_rage_sfx_struct = {
	default_priority = 75
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
stop_rage_sfx_container = {
	command = playsound
	randomness = none
}
rage_sfx_struct = {
	default_priority = 75
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 10
}
rage_sfx_container = {
	command = playsound
	randomness = none
}
Mountain_Attention_Stream_struct = {
	default_priority = 75
	default_buss = ProCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Mountain_Attention_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			mountain_attn_01
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound2 = {
			mountain_attn_02
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound3 = {
			mountain_attn_03
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound4 = {
			mountain_attn_04
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound5 = {
			mountain_attn_05
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound6 = {
			mountain_attn_06
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound7 = {
			mountain_attn_07
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
	}
}
Mountain_Avoid_Stream_struct = {
	default_priority = 75
	default_buss = ProCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Mountain_Avoid_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			mountain_avoid_01
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound2 = {
			mountain_avoid_02
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound3 = {
			mountain_avoid_03
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound4 = {
			mountain_avoid_04
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
	}
}
Mountain_BooLand_Stream_struct = {
	default_priority = 75
	default_buss = ProCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Mountain_BooLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			mountain_booland_01
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound2 = {
			mountain_booland_02
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound3 = {
			mountain_booland_03
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound4 = {
			mountain_booland_04
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound5 = {
			mountain_booland_05
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound6 = {
			mountain_booland_06
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound7 = {
			mountain_booland_07
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound8 = {
			mountain_booland_08
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound9 = {
			mountain_booland_09
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
	}
}
Mountain_CheerLand_Stream_struct = {
	default_priority = 75
	default_buss = ProCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Mountain_CheerLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			mountain_cheerland_01
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound2 = {
			mountain_cheerland_02
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound3 = {
			mountain_cheerland_03
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound4 = {
			mountain_cheerland_04
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound5 = {
			mountain_cheerland_05
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound6 = {
			mountain_cheerland_06
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound7 = {
			mountain_cheerland_07
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound8 = {
			mountain_cheerland_08
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound9 = {
			mountain_cheerland_09
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
	}
}
Mountain_Impatient_Stream_struct = {
	default_priority = 75
	default_buss = ProCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Mountain_Impatient_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			mountain_impatient_01
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound2 = {
			mountain_impatient_02
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound3 = {
			mountain_impatient_03
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound4 = {
			mountain_impatient_04
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
	}
}
Mountain_KeepItUp_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Mountain_KeepItUp_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			mountain_keepitup_01
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound2 = {
			mountain_keepitup_02
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound3 = {
			mountain_keepitup_03
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound4 = {
			mountain_keepitup_04
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
	}
}
Mullen_Avoid_Stream_struct = {
	default_priority = 80
	default_buss = ProCallouts_WET
	norepeatfor = 10
	instancemanagement = stop_oldest
	instancelimit = 1
}
Mullen_Avoid_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			mullen_avoid_02
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound2 = {
			mullen_avoid_03
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound3 = {
			mullen_avoid_01
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
	}
}
Mullen_KeepItUp_Stream_struct = {
	default_priority = 80
	default_buss = ProCallouts_WET
	norepeatfor = 10
	instancemanagement = stop_oldest
	instancelimit = 1
}
Mullen_KeepItUp_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			mullen_keepitup_02
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound2 = {
			mullen_keepitup_03
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound3 = {
			mullen_keepitup_04
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound4 = {
			mullen_keepitup_01
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
	}
}
Song_Attention_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
Song_Attention_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			song_attn_01
			dropoff = 50
			dropoff_function = linear
			vol = 40
		}
		sound2 = {
			song_attn_02
			dropoff = 50
			dropoff_function = linear
			vol = 40
		}
		sound3 = {
			song_attn_03
			dropoff = 50
			dropoff_function = linear
			vol = 40
		}
		sound4 = {
			song_attn_04
			dropoff = 50
			dropoff_function = linear
			vol = 40
		}
		sound5 = {
			song_attn_05
			dropoff = 50
			dropoff_function = linear
			vol = 40
		}
		sound6 = {
			song_attn_06
			dropoff = 50
			dropoff_function = linear
			vol = 40
		}
		sound7 = {
			song_attn_07
			dropoff = 50
			dropoff_function = linear
			vol = 40
		}
		sound8 = {
			song_attn_08
			dropoff = 50
			dropoff_function = linear
			vol = 40
		}
	}
}
Song_Avoid_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
Song_Avoid_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			song_avoid_01
			dropoff = 100
			dropoff_function = linear
			vol = 45
		}
		sound2 = {
			song_avoid_02
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound3 = {
			song_avoid_03
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
	}
}
Song_BooLand_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
Song_BooLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			song_booland_01
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound2 = {
			song_booland_02
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound3 = {
			song_booland_03
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound4 = {
			song_booland_04
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound5 = {
			song_booland_05
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound6 = {
			song_booland_06
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound7 = {
			song_booland_07
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound8 = {
			song_booland_08
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound9 = {
			song_booland_09
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
	}
}
Song_CheerLand_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
Song_CheerLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			song_cheerland_01
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound2 = {
			song_cheerland_02
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound3 = {
			song_cheerland_03
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound4 = {
			song_cheerland_04
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound5 = {
			song_cheerland_05
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
	}
}
Song_Impatient_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
Song_Impatient_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			song_impatinet_01
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound2 = {
			song_impatinet_02
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound3 = {
			song_impatinet_03
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
	}
}
Song_KeepItUp_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
Song_KeepItUp_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			song_keepitup_01
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound2 = {
			song_keepitup_02
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound3 = {
			song_keepitup_03
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound4 = {
			song_keepitup_04
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound5 = {
			song_keepitup_05
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound6 = {
			song_keepitup_06
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
	}
}
Williams_Attention_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 20
	instancemanagement = stop_oldest
	instancelimit = 1
}
Williams_Attention_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			williams_attn_01
			dropoff = 50
			dropoff_function = linear
			vol = 50
			vol = 45
		}
		sound2 = {
			williams_attn_02
			dropoff = 50
			dropoff_function = linear
			vol = 50
			vol = 45
		}
		sound3 = {
			williams_attn_03
			dropoff = 50
			dropoff_function = linear
			vol = 50
			vol = 45
		}
		sound4 = {
			williams_attn_04
			dropoff = 50
			dropoff_function = linear
			vol = 50
			vol = 45
		}
		sound5 = {
			williams_attn_05
			dropoff = 50
			dropoff_function = linear
			vol = 50
			vol = 45
		}
		sound6 = {
			williams_attn_06
			dropoff = 50
			dropoff_function = linear
			vol = 50
			vol = 45
		}
		sound7 = {
			williams_attn_07
			dropoff = 50
			dropoff_function = linear
			vol = 50
			vol = 45
		}
		sound8 = {
			williams_attn_08
			dropoff = 50
			dropoff_function = linear
			vol = 50
			vol = 45
		}
	}
}
Williams_Avoid_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 20
	instancemanagement = stop_oldest
	instancelimit = 1
}
Williams_Avoid_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			williams_avoid_01
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound2 = {
			williams_avoid_02
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound3 = {
			williams_avoid_03
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound4 = {
			williams_avoid_04
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
	}
}
Williams_BooLand_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 20
	instancemanagement = stop_oldest
	instancelimit = 1
}
Williams_BooLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			williams_booland_01
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound2 = {
			williams_booland_02
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound3 = {
			williams_booland_03
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound4 = {
			williams_booland_04
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound5 = {
			williams_booland_05
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound6 = {
			williams_booland_06
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound7 = {
			williams_booland_07
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound8 = {
			williams_booland_08
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound9 = {
			williams_booland_09
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
	}
}
Williams_CheerLand_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 20
	instancemanagement = stop_oldest
	instancelimit = 1
}
Williams_CheerLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			williams_cheerland_01
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound2 = {
			williams_cheerland_02
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound3 = {
			williams_cheerland_03
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound4 = {
			williams_cheerland_04
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound5 = {
			williams_cheerland_05
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound6 = {
			williams_cheerland_06
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
	}
}
Williams_Impatient_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 20
	instancemanagement = stop_oldest
	instancelimit = 1
}
Williams_Impatient_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			williams_impatient_01
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound2 = {
			williams_impatient_02
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound3 = {
			williams_impatient_03
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound4 = {
			williams_impatient_04
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
	}
}
Williams_KeepItUp_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 20
	instancemanagement = stop_oldest
	instancelimit = 1
}
Williams_KeepItUp_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			williams_keepitup_01
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound2 = {
			williams_keepitup_02
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound3 = {
			williams_keepitup_03
			dropoff = 50
			dropoff_function = linear
			vol = 50
		}
	}
}
King_Avoid_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 10
	instancemanagement = stop_oldest
	instancelimit = 1
}
King_Avoid_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			king_avoid_01
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound2 = {
			king_avoid_02
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound3 = {
			king_avoid_03
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound4 = {
			king_avoid_04
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound5 = {
			king_avoid_05
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound6 = {
			king_avoid_06
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound7 = {
			king_avoid_07
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
	}
}
King_BooLand_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 10
	instancemanagement = stop_oldest
	instancelimit = 1
}
King_BooLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			King_booland_01
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound2 = {
			King_booland_02
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound3 = {
			King_booland_03
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound4 = {
			King_booland_04
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound5 = {
			King_booland_05
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound6 = {
			King_booland_06
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound7 = {
			King_booland_07
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound8 = {
			King_booland_08
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
	}
}
King_CheerLand_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 10
	instancemanagement = stop_oldest
	instancelimit = 1
}
King_CheerLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			King_cheerland_01
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound2 = {
			King_cheerland_02
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound3 = {
			King_cheerland_03
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound4 = {
			King_cheerland_04
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound5 = {
			King_cheerland_05
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound6 = {
			King_cheerland_06
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound7 = {
			King_cheerland_07
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound8 = {
			King_cheerland_08
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound9 = {
			King_cheerland_09
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
	}
}
King_Impatient_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 10
	instancemanagement = stop_oldest
	instancelimit = 1
}
King_Impatient_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			king_impatient_01
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound2 = {
			king_impatient_02
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound3 = {
			king_impatient_03
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound4 = {
			king_impatient_04
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound5 = {
			king_impatient_05
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound6 = {
			king_impatient_06
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound7 = {
			king_impatient_07
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
	}
}
King_KeepItUp_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 10
	instancemanagement = stop_oldest
	instancelimit = 1
}
King_KeepItUp_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			King_keepitup_01
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound2 = {
			King_keepitup_02
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound3 = {
			King_keepitup_03
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
		sound4 = {
			King_keepitup_04
			dropoff = 50
			dropoff_function = linear
			vol = 45
		}
	}
}
Mullen_BooLand_Stream_struct = {
	default_priority = 80
	default_buss = ProCallouts_WET
	norepeatfor = 10
	instancemanagement = stop_oldest
	instancelimit = 1
}
Mullen_BooLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			mullen_booland_01
			dropoff = 50
			dropoff_function = linear
			vol = 48
		}
		sound2 = {
			mullen_booland_09
			dropoff = 50
			dropoff_function = linear
			vol = 48
		}
		sound3 = {
			mullen_booland_08
			dropoff = 50
			dropoff_function = linear
			vol = 48
		}
		sound4 = {
			mullen_booland_07
			dropoff = 50
			dropoff_function = linear
			vol = 48
		}
		sound5 = {
			mullen_booland_06
			dropoff = 50
			dropoff_function = linear
			vol = 48
		}
		sound6 = {
			mullen_booland_05
			dropoff = 50
			dropoff_function = linear
			vol = 48
		}
		sound7 = {
			mullen_booland_04
			dropoff = 50
			dropoff_function = linear
			vol = 48
		}
		sound8 = {
			mullen_booland_03
			dropoff = 50
			dropoff_function = linear
			vol = 48
		}
		sound9 = {
			mullen_booland_02
			dropoff = 50
			dropoff_function = linear
			vol = 48
		}
	}
}
Mullen_CheerLand_Stream_struct = {
	default_priority = 80
	default_buss = ProCallouts_WET
	norepeatfor = 10
	instancemanagement = stop_oldest
	instancelimit = 1
}
Mullen_CheerLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			mullen_cheerland_01
			dropoff = 50
			dropoff_function = linear
			vol = 48
		}
		sound2 = {
			mullen_cheerland_07
			dropoff = 50
			dropoff_function = linear
			vol = 48
		}
		sound3 = {
			mullen_cheerland_06
			dropoff = 50
			dropoff_function = linear
			vol = 48
		}
		sound4 = {
			mullen_cheerland_05
			dropoff = 50
			dropoff_function = linear
			vol = 48
		}
		sound5 = {
			mullen_cheerland_04
			dropoff = 50
			dropoff_function = linear
			vol = 48
		}
		sound6 = {
			mullen_cheerland_03
			dropoff = 50
			dropoff_function = linear
			vol = 48
		}
		sound7 = {
			mullen_cheerland_02
			dropoff = 50
			dropoff_function = linear
			vol = 48
		}
	}
}
m_r1_impress_outro_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r1_impress_outro_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_impress_r1_outro
			vol = 350
		}
	}
}
m_impress_r2_inst_01_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_impress_r2_inst_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r2_impress_01
			vol = 350
		}
	}
}
m_impress_r2_inst_02_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_impress_r2_inst_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r2_impress_02
			vol = 350
		}
	}
}
m_impress_r2_inst_03_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_impress_r2_inst_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r2_impress_06
			vol = 350
		}
	}
}
m_impress_r2_outro_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_impress_r2_outro_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r2_impress_08
			vol = 350
		}
	}
}
VO_m_r3_Bell_inc_neg_COMBO_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r3_Bell_inc_neg_COMBO_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_bell_inc_neg_02
			vol = 350
		}
	}
}
VO_m_r3_Bell_inc_neg_COMEON_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r3_Bell_inc_neg_COMEON_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_bell_inc_neg_03
			vol = 350
		}
	}
}
VO_m_r3_Bell_inc_neg_GETPHOTOS_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r3_Bell_inc_neg_GETPHOTOS_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_bell_inc_neg_06
			vol = 350
		}
	}
}
VO_m_r3_Bell_inc_neg_SNAPPICS_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r3_Bell_inc_neg_SNAPPICS_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_bell_inc_neg_07
			vol = 350
		}
	}
}
VO_m_r3_Bell_inc_neg_STAYUP_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r3_Bell_inc_neg_STAYUP_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_bell_inc_neg_01
			vol = 350
		}
	}
}
VO_m_r3_Bell_inc_neg_WAISTINGTIME_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r3_Bell_inc_neg_WAISTINGTIME_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_bell_inc_neg_04
			vol = 350
		}
	}
}
VO_m_r3_Bell_inc_neg_WOULDPERFECT_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r3_Bell_inc_neg_WOULDPERFECT_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_bell_inc_neg_05
			vol = 350
		}
	}
}
VO_m_r3_Bell_inc_pos_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r3_Bell_inc_pos_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			m_r3_bell_inc_pos_01
			vol = 350
		}
		sound2 = {
			m_r3_bell_inc_pos_02
			vol = 350
		}
	}
}
VO_m_r3_Harbor_inc_neg_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r3_Harbor_inc_neg_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
}
VO_m_r3_Harbor_inc_pos_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 15
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r3_Harbor_inc_pos_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			m_r3_harbor_inc_pos_01
			vol = 350
		}
		sound2 = {
			m_r3_harbor_inc_pos_02
			vol = 350
		}
		sound3 = {
			m_r3_harbor_inc_pos_03
			vol = 350
		}
		sound4 = {
			m_r3_harbor_inc_pos_04
			vol = 350
		}
		sound5 = {
			m_r3_harbor_inc_pos_05
			vol = 350
		}
		sound6 = {
			m_r3_harbor_inc_pos_06
			vol = 350
		}
		sound7 = {
			m_r3_harbor_inc_pos_07
			vol = 350
		}
		sound8 = {
			m_r3_harbor_inc_pos_08
			vol = 350
		}
		sound9 = {
			m_r3_harbor_inc_pos_09
			vol = 350
		}
	}
}
VO_m_r3_harbor_inst_01_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r3_harbor_inst_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_harbor_inst_01
			vol = 350
		}
	}
}
VO_m_r3_harbor_inst_02_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r3_harbor_inst_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_harbor_inst_02
			vol = 350
		}
	}
}
VO_m_r3_harbor_inst_03_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r3_harbor_inst_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_harbor_inst_03
			vol = 350
		}
	}
}
VO_m_r3_harbor_inst_04_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r3_harbor_inst_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_harbor_inst_04
			vol = 350
		}
	}
}
VO_m_r3_harbor_inst_05_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r3_harbor_inst_05_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_harbor_inst_05
			vol = 350
		}
	}
}
VO_m_r3_harbor_inst_06_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r3_harbor_inst_06_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_harbor_inst_06
			vol = 350
		}
	}
}
VO_m_r3_harbor_inst_07_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r3_harbor_inst_07_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_harbor_inst_07
			vol = 350
		}
	}
}
VO_m_r3_harbor_inst_08_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r3_harbor_inst_08_container = {
	command = obj_playsound
	randomness = none
}
m_r3_slums_lastp2_VO_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_slums_lastp2_VO_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_slums_inst_08a
			vol = 350
		}
	}
}
m_r3_slums_lastp3_VO_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_slums_lastp3_VO_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_slums_inst_09
			vol = 350
		}
	}
}
m_r3_Monuments_chkp3p1_VO_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_Monuments_chkp3p1_VO_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_momeuments_inst_05
			vol = 350
		}
	}
}
m_r3_Monuments_chkp3p2_VO_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_Monuments_chkp3p2_VO_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_momeuments_inst_06
			vol = 350
		}
	}
}
m_r3_Museums_Positives_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_Museums_Positives_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			m_r3_museum_inc_pos_01
			vol = 350
		}
		sound2 = {
			m_r3_museum_inc_pos_02
			vol = 350
		}
		sound3 = {
			m_r3_museum_inc_pos_03
			vol = 350
		}
		sound4 = {
			m_r3_museum_inc_pos_04
			vol = 350
		}
		sound5 = {
			m_r3_museum_inc_pos_05
			vol = 350
		}
		sound6 = {
			m_r3_museum_inc_pos_06
			vol = 350
		}
		sound7 = {
			m_r3_museum_inc_pos_07
			vol = 350
		}
	}
}
m_r3_Museums_Negatives_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 15
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_Museums_Negatives_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			song_booland_01
			vol = 350
		}
		sound2 = {
			song_booland_06
			vol = 350
		}
		sound3 = {
			m_r3_museum_inc_neg_05_alt1
			vol = 350
		}
		sound4 = {
			m_r3_museum_inc_neg_05_alt3
			vol = 350
		}
	}
}
m_r3_Monuments_BADPHOTO_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_Monuments_BADPHOTO_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			m_r3_museum_inc_neg_05_alt2
			vol = 350
		}
		sound2 = {
			m_r3_museum_inc_neg_05_alt1
			vol = 350
		}
		sound3 = {
			m_r3_museum_inc_neg_05_alt3
			vol = 350
		}
	}
}
m_r3_Monuments_GRIND_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_Monuments_GRIND_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_museum_inc_neg_01
			vol = 350
		}
	}
}
m_r3_Monuments_INFRAME_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_Monuments_INFRAME_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			m_r3_museum_inc_neg_02
			vol = 350
		}
		sound2 = {
			m_r3_museum_inc_neg_02_alt1
			vol = 350
		}
		sound3 = {
			m_r3_museum_inc_neg_02_alt2
			vol = 350
		}
	}
}
m_r3_Monuments_WATCHIT_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_Monuments_WATCHIT_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			m_r3_museum_inc_neg_04
			vol = 350
		}
		sound2 = {
			m_r3_museum_inc_neg_04_alt2
			vol = 350
		}
		sound3 = {
			m_r3_museum_inc_neg_04_alt3
			vol = 350
		}
		sound4 = {
			m_r3_museum_inc_neg_04_alt4
			vol = 350
		}
	}
}
m_r3_Slums_Grinding_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_Slums_Grinding_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_slums_inc_neg_01
			vol = 350
		}
	}
}
m_r3_Slums_INAIR_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_Slums_INAIR_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_slums_inc_neg_02
			vol = 350
		}
	}
}
m_r3_Slums_INFRAME_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_Slums_INFRAME_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_slums_inc_neg_03
			vol = 350
		}
	}
}
m_r3_Slums_OUCH_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_Slums_OUCH_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_slums_inc_neg_06
			vol = 350
		}
	}
}
m_r3_slums_Positives_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_slums_Positives_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_slums_inc_pos_01
			vol = 350
		}
		sound2 = {
			m_r3_slums_inc_pos_02
			vol = 350
		}
		sound3 = {
			m_r3_slums_inc_pos_03
			vol = 350
		}
		sound4 = {
			mullen_cheerland_01
			vol = 350
		}
		sound5 = {
			mullen_cheerland_04
			vol = 350
		}
	}
}
m_r3_Slums_UGLYPHOTOS_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_Slums_UGLYPHOTOS_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_slums_inc_neg_07
			vol = 350
		}
		sound2 = {
			mullen_booland_01
			vol = 350
		}
		sound3 = {
			mullen_booland_02
			vol = 350
		}
		sound4 = {
			mullen_booland_03
			vol = 350
		}
		sound5 = {
			mullen_booland_04
			vol = 350
		}
		sound6 = {
			mullen_booland_09
			vol = 350
		}
	}
}
VO_m_r3_Harbor_WATCHOUT_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r3_Harbor_WATCHOUT_container = {
	command = playsound
	randomness = none
}
VO_m_r3_Harbor_FAILED_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r3_Harbor_FAILED_container = {
	command = playsound
	randomness = none
}
VO_m_r3_Harbor_GRINDING_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r3_Harbor_GRINDING_container = {
	command = playsound
	randomness = none
}
VO_m_r3_Harbor_NOTFRAME_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r3_Harbor_NOTFRAME_container = {
	command = playsound
	randomness = none
}
VO_m_r3_Harbor_NOTINAIR_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r3_Harbor_NOTINAIR_container = {
	command = playsound
	randomness = none
}
vo_m_h2_bossbattle_inc_cam_Block_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 3
	instancemanagement = stop_oldest
	instancelimit = 1
}
vo_m_h2_bossbattle_inc_cam_Block_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
}
vo_m_h2_bossbattle_inc_cam_GOTHIT_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
vo_m_h2_bossbattle_inc_cam_GOTHIT_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
}
vo_m_h2_bossbattle_inc_cam_Beating_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
vo_m_h2_bossbattle_inc_cam_Beating_container = {
	command = playsound
	randomness = none
}
vo_m_h2_bossbattle_inc_cam_CantHide_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
vo_m_h2_bossbattle_inc_cam_CantHide_container = {
	command = playsound
	randomness = none
}
vo_m_h2_bossbattle_inc_cam_CatchMe_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
vo_m_h2_bossbattle_inc_cam_CatchMe_container = {
	command = playsound
	randomness = none
}
vo_m_h2_bossbattle_inc_cam_ITHOUGHT_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
vo_m_h2_bossbattle_inc_cam_ITHOUGHT_container = {
	command = playsound
	randomness = none
}
vo_m_h2_bossbattle_inc_cam_KickAss_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
vo_m_h2_bossbattle_inc_cam_KickAss_container = {
	command = playsound
	randomness = none
}
vo_m_h2_bossbattle_inc_cam_OffBoard_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
vo_m_h2_bossbattle_inc_cam_OffBoard_container = {
	command = playsound
	randomness = none
}
vo_m_h2_bossbattle_inc_cam_RUN_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
vo_m_h2_bossbattle_inc_cam_RUN_container = {
	command = playsound
	randomness = none
}
vo_m_h2_bossbattle_inc_cam_Sucker_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
vo_m_h2_bossbattle_inc_cam_Sucker_container = {
	command = playsound
	randomness = none
}
VO_m_h2_bossbattle_Dollin_AfterCam_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_bossbattle_Dollin_AfterCam_container = {
	command = playsound
	randomness = none
}
VO_m_h2_bossbattle_Dollin_BEOKAY_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_bossbattle_Dollin_BEOKAY_container = {
	command = playsound
	randomness = none
}
VO_m_h2_bossbattle_Dollin_HANDOVERHERE_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 10
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_bossbattle_Dollin_HANDOVERHERE_container = {
	command = playsound
	randomness = none
}
VO_m_h2_bossbattle_Dollin_HEAD_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 10
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_bossbattle_Dollin_HEAD_container = {
	command = playsound
	randomness = none
}
VO_m_h2_bossbattle_Dollin_HELP_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 10
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_bossbattle_Dollin_HELP_container = {
	command = playsound
	randomness = none
}
VO_m_h2_bossbattle_Dollin_ICANHANDLE_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 10
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_bossbattle_Dollin_ICANHANDLE_container = {
	command = playsound
	randomness = none
}
VO_m_h2_bossbattle_Dollin_LittleHelp_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 10
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_bossbattle_Dollin_LittleHelp_container = {
	command = playsound
	randomness = none
}
VO_m_h2_BossBattle_Drollin_MightNeed_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 10
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_BossBattle_Drollin_MightNeed_container = {
	command = playsound
	randomness = none
}
SecurityGuard2_Attack_Stream_struct = {
	default_priority = 40
	default_buss = PedCallouts_WET
	norepeatfor = 0.5
	instancemanagement = stop_oldest
	instancelimit = 4
}
SecurityGuard2_Attack_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			guard2_attack_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			guard2_attack_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			guard2_attack_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			guard2_attack_04
			dropoff = 50
			dropoff_function = linear
		}
	}
}
SecurityGuard2_Avoid_Stream_struct = {
	default_priority = 40
	default_buss = PedCallouts_WET
	norepeatfor = 0.5
	instancemanagement = stop_oldest
	instancelimit = 4
}
SecurityGuard2_Avoid_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			guard2_avoid_10
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			guard2_avoid_01
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			guard2_avoid_02
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			guard2_avoid_03
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			guard2_avoid_04
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			guard2_avoid_05
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			guard2_avoid_06
			dropoff = 50
			dropoff_function = linear
		}
		sound8 = {
			guard2_avoid_07
			dropoff = 50
			dropoff_function = linear
		}
		sound9 = {
			guard2_avoid_08
			dropoff = 50
			dropoff_function = linear
		}
		sound10 = {
			guard2_avoid_09
			dropoff = 50
			dropoff_function = linear
		}
	}
}
SecurityGuard2_Chase_Stream_struct = {
	default_priority = 40
	default_buss = PedCallouts_WET
	norepeatfor = 0.5
	instancemanagement = stop_oldest
	instancelimit = 4
}
SecurityGuard2_Chase_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			guard2_chase_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			guard2_chase_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			guard2_chase_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			guard2_chase_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			guard2_chase_05
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			guard2_chase_06
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			guard2_chase_07
			dropoff = 50
			dropoff_function = linear
		}
		sound8 = {
			guard2_chase_08
			dropoff = 50
			dropoff_function = linear
		}
		sound9 = {
			guard2_chase_09
			dropoff = 50
			dropoff_function = linear
		}
		sound10 = {
			guard2_chase_10
			dropoff = 50
			dropoff_function = linear
		}
		sound11 = {
			guard2_chase_11
			dropoff = 50
			dropoff_function = linear
		}
		sound12 = {
			guard2_chase_12
			dropoff = 50
			dropoff_function = linear
		}
	}
}
SecurityGuard2_Taunt_Stream_struct = {
	default_priority = 40
	default_buss = PedCallouts_WET
	norepeatfor = 0.5
	instancemanagement = stop_oldest
	instancelimit = 4
}
SecurityGuard2_Taunt_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			guard2_taunt_06
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			guard2_taunt_01
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			guard2_taunt_02
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			guard2_taunt_03
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			guard2_taunt_04
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			guard2_taunt_05
			dropoff = 50
			dropoff_function = linear
		}
	}
}
SecurityGuard2_Warning_Stream_struct = {
	default_priority = 40
	default_buss = PedCallouts_WET
	norepeatfor = 0.5
	instancemanagement = stop_oldest
	instancelimit = 4
}
SecurityGuard2_Warning_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			guard2_warning_05
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			guard2_warning_06
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			guard2_warning_07
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			guard2_warning_08
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			guard2_warning_01
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			guard2_warning_02
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			guard2_warning_03
			dropoff = 50
			dropoff_function = linear
		}
		sound8 = {
			guard2_warning_04
			dropoff = 50
			dropoff_function = linear
			vol = 50
		}
	}
}
carjack_sfx_01_struct = {
	default_priority = 80
	default_buss = AmbScenes
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
carjack_sfx_01_container = {
	command = agent_playvo
	randomness = none
	sounds = {
		sound1 = {
			carjack_sfx_01
			vol = 125
			dropoff = 25
			dropoff_function = linear
		}
	}
}
carjack_sfx_02_struct = {
	default_priority = 80
	default_buss = AmbScenes
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
carjack_sfx_02_container = {
	command = agent_playvo
	randomness = none
	sounds = {
		sound1 = {
			carjack_sfx_02
			vol = 125
			dropoff = 25
			dropoff_function = linear
		}
	}
}
cointoss_sfx_struct = {
	default_priority = 50
	default_buss = AmbScenes
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
}
cointoss_sfx_container = {
	command = obj_playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			cointoss_sfx_02
			dropoff = 50
			dropoff_function = linear
			randomvol = {
				type = randomrangetype
				vals = [
					90
					120
				]
			}
			randompitch = {
				type = randomrangetype
				vals = [
					85
					115
				]
			}
		}
		sound2 = {
			cointoss_sfx_03
			dropoff = 50
			dropoff_function = linear
			randomvol = {
				type = randomrangetype
				vals = [
					90
					120
				]
			}
			randompitch = {
				type = randomrangetype
				vals = [
					85
					115
				]
			}
		}
	}
}
SFX_bumharass01_kick1_struct = {
	default_priority = 90
	default_buss = AmbScenes
	norepeatfor = 0.5
	instancemanagement = stop_oldest
	instancelimit = 1
}
SFX_bumharass01_kick1_container = {
	command = obj_playsound
	randomness = none
}
SFX_bumharass01_kick2_struct = {
	default_priority = 50
	default_buss = AmbScenes
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
SFX_bumharass01_kick2_container = {
	command = obj_playsound
	randomness = randomnorepeattype
}
SFX_bumharass01_push_struct = {
	default_priority = 50
	default_buss = AmbScenes
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
SFX_bumharass01_push_container = {
	command = obj_playsound
	randomness = randomnorepeattype
}
VO_bumharass01_c_struct = {
	default_priority = 95
	default_buss = AmbScenes
	norepeatfor = 0.5
	instancemanagement = ignore
	instancelimit = 1
}
VO_bumharass01_c_container = {
	command = agent_playvo
	randomness = randomtype
}
gottapoo_sfx_01_struct = {
	default_priority = 80
	default_buss = AmbScenes
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
gottapoo_sfx_01_container = {
	command = agent_playvo
	randomness = none
	sounds = {
		sound1 = {
			gottapoo_sfx_01
			dropoff = 25
			dropoff_function = linear
		}
	}
}
gottapoo_sfx_02_struct = {
	default_priority = 80
	default_buss = AmbScenes
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
gottapoo_sfx_02_container = {
	command = agent_playvo
	randomness = none
	sounds = {
		sound1 = {
			gottapoo_sfx_02
			dropoff = 25
			dropoff_function = linear
		}
	}
}
MadDog_Attention_Stream_struct = {
	default_priority = 50
	default_buss = ProCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
MadDog_Attention_Stream_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			maddog_attn_01
		}
		sound2 = {
			maddog_attn_02
		}
		sound3 = {
			maddog_attn_03
		}
		sound4 = {
			maddog_attn_04
		}
		sound5 = {
			maddog_attn_05
		}
		sound6 = {
			maddog_attn_06
		}
		sound7 = {
			maddog_attn_07
		}
		sound8 = {
			maddog_attn_08
		}
		sound9 = {
			maddog_attn_09
		}
		sound10 = {
			maddog_attn_10
		}
		sound11 = {
			maddog_attn_11
		}
		sound12 = {
			maddog_attn_12
		}
	}
}
MadDog_Avoid_Stream_struct = {
	default_priority = 50
	default_buss = ProCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
MadDog_Avoid_Stream_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			maddog_avoid_01
		}
		sound2 = {
			maddog_avoid_02
		}
		sound3 = {
			maddog_avoid_03
		}
		sound4 = {
			maddog_avoid_04
		}
		sound5 = {
			maddog_avoid_05
		}
	}
}
MadDog_BooLand_Stream_struct = {
	default_priority = 50
	default_buss = ProCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
MadDog_BooLand_Stream_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			maddog_booland_01
		}
		sound2 = {
			maddog_booland_02
		}
		sound3 = {
			maddog_booland_03
		}
		sound4 = {
			maddog_booland_04
		}
		sound5 = {
			maddog_booland_05
		}
		sound6 = {
			maddog_booland_06
		}
		sound7 = {
			maddog_booland_07
		}
	}
}
MadDog_CheerLand_Stream_struct = {
	default_priority = 50
	default_buss = ProCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
MadDog_CheerLand_Stream_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			maddog_cheerland_01
		}
		sound2 = {
			maddog_cheerland_02
		}
		sound3 = {
			maddog_cheerland_03
		}
		sound4 = {
			maddog_cheerland_04
		}
		sound5 = {
			maddog_cheerland_05
		}
	}
}
MadDog_Impatient_Stream_struct = {
	default_priority = 50
	default_buss = ProCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
MadDog_Impatient_Stream_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			maddog_impatient_01
		}
		sound2 = {
			maddog_impatient_02
		}
		sound3 = {
			maddog_impatient_03
		}
		sound4 = {
			maddog_impatient_04
		}
	}
}
MadDog_KeepItUp_Stream_struct = {
	default_priority = 50
	default_buss = ProCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
MadDog_KeepItUp_Stream_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			maddog_keepitup_01
		}
		sound2 = {
			maddog_keepitup_02
		}
		sound3 = {
			maddog_keepitup_03
		}
	}
}
VO_m_c2_comppark_inst_1_02_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_comppark_inst_1_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_comppark_inst_1_02
			vol = 350
		}
	}
}
VO_m_c2_comppark_inst_1_04_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_comppark_inst_1_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_comppark_inst_1_04
			vol = 350
		}
	}
}
VO_m_c2_comppark_inst_1_05_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 180
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_comppark_inst_1_05_container = {
	command = playsound
	randomness = none
}
VO_m_c2_comppark_inst_2_02_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_comppark_inst_2_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_comppark_inst_2_02
			vol = 350
		}
	}
}
VO_m_c2_comppark_inst_2_03_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_comppark_inst_2_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_comppark_inst_2_03
			vol = 350
		}
	}
}
VO_m_c2_comppark_inst_3_02_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_comppark_inst_3_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_comppark_inst_3_02
			vol = 350
		}
	}
}
VO_m_c2_comppark_inst_3_03_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_comppark_inst_3_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_comppark_inst_3_03
			vol = 350
		}
	}
}
VO_m_c2_comppark_inst_4_03_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_comppark_inst_4_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_comppark_inst_4_03
			vol = 350
		}
	}
}
VO_m_c2_comppark_inst_4_04_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_comppark_inst_4_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_comppark_inst_4_04
			vol = 350
		}
	}
}
VO_m_c2_comppark_inst_4_05_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_comppark_inst_4_05_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_comppark_inst_4_05
			vol = 350
		}
	}
}
VO_m_c2_localcomp_Annouc_INCOMBO_SICK_2_struct = {
	default_priority = 65
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_localcomp_Annouc_INCOMBO_SICK_2_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
}
VO_m_c2_localcomp_Annouc_INCOMBO_PRO_struct = {
	default_priority = 65
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_localcomp_Annouc_INCOMBO_PRO_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
}
VO_m_c2_localcomp_Annouc_INCOMBO_AM_struct = {
	default_priority = 65
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_localcomp_Annouc_INCOMBO_AM_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
}
Goal_Comp_Announcer_Scores_VO_struct = {
	default_priority = 65
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Goal_Comp_Announcer_Scores_VO_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
}
VO_m_c2_localcomp_Annouc_CleanLanding_struct = {
	default_priority = 65
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_localcomp_Annouc_CleanLanding_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
}
VO_m_c2_revman_inc_Neg_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_revman_inc_Neg_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			m_c2_revman_inc_neg_04
			vol = 350
		}
		sound2 = {
			m_c2_revman_inc_neg_05
			vol = 350
		}
		sound3 = {
			m_c2_revman_inc_neg_06
			vol = 350
		}
		sound4 = {
			m_c2_revman_inc_neg_01
			vol = 350
		}
		sound5 = {
			m_c2_revman_inc_neg_02
			vol = 350
		}
		sound6 = {
			m_c2_revman_inc_neg_03
			vol = 350
		}
	}
}
VO_m_c2_revman_inc_pos_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_revman_inc_pos_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			m_c2_revman_inc_pos_01
			vol = 350
		}
		sound2 = {
			m_c2_revman_inc_pos_02
			vol = 350
		}
		sound3 = {
			m_c2_revman_inc_pos_03
			vol = 350
		}
		sound4 = {
			m_c2_revman_inc_pos_04
			vol = 350
		}
		sound5 = {
			m_c2_revman_inc_pos_05
			vol = 350
		}
		sound6 = {
			m_c2_revman_inc_pos_06
			vol = 350
		}
	}
}
VO_m_c2_NTG_inc_GoodFingerflip_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_NTG_inc_GoodFingerflip_container = {
	command = playsound
	randomness = none
}
VO_m_c2_NTG_inc_GreatTweak_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_NTG_inc_GreatTweak_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_NTG_inc_pos_02
			vol = 350
		}
	}
}
VO_m_c2_NTG_inc_Neg_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_NTG_inc_Neg_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			m_c2_NTG_inc_neg_01
			vol = 350
		}
		sound2 = {
			m_c2_NTG_inc_neg_02
			vol = 350
		}
		sound3 = {
			m_c2_NTG_inc_neg_03
			vol = 350
		}
		sound4 = {
			m_c2_NTG_inc_neg_04
			vol = 350
		}
		sound5 = {
			m_c2_NTG_inc_neg_05
			vol = 350
		}
		sound6 = {
			m_c2_NTG_inc_neg_06
			vol = 350
		}
		sound7 = {
			m_c2_NTG_inc_neg_07
			vol = 350
		}
	}
}
VO_m_c2_NTG_inc_NICEGRAB_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_NTG_inc_NICEGRAB_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_NTG_inc_pos_01_1
			vol = 350
		}
	}
}
VO_m_c2_NTG_inc_SweetTransfer_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_NTG_inc_SweetTransfer_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_NTG_inc_pos_04
			vol = 350
		}
	}
}
VO_m_c2_comppark_inst_1_01_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_comppark_inst_1_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_comppark_inst_1_01
			vol = 350
		}
	}
}
VO_m_c2_comppark_inst_1_03_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_comppark_inst_1_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_comppark_inst_1_03
			vol = 350
		}
	}
}
VO_m_c2_comppark_inst_2_01_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_comppark_inst_2_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_comppark_inst_2_01
			vol = 350
		}
	}
}
VO_m_c2_comppark_inst_3_01_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_comppark_inst_3_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_comppark_inst_3_01
			vol = 350
		}
	}
}
VO_m_c2_comppark_inst_4_01_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_comppark_inst_4_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_comppark_inst_4_01
			vol = 350
		}
	}
}
VO_m_c2_localcomp_Announc_Start_Park_struct = {
	default_priority = 65
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c2_localcomp_Announc_Start_Park_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			announcer_comp_04
			vol = 400
		}
		sound2 = {
			announcer_comp_05
			vol = 400
		}
		sound3 = {
			announcer_comp_06
			vol = 400
		}
		sound4 = {
			announcer_comp_01
			vol = 400
		}
		sound5 = {
			announcer_comp_02
			vol = 400
		}
		sound6 = {
			announcer_comp_03
			vol = 400
		}
		sound7 = {
			m_c2_comppark_inc_2_01
			vol = 400
		}
	}
}
VO_m_c3_epicPhoto1_inst_p1_01_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c3_epicPhoto1_inst_p1_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c3_epicphoto1_inst_p1_01
			vol = 350
		}
	}
}
VO_m_c3_epicPhoto1_inst_p1_02_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c3_epicPhoto1_inst_p1_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c3_epicphoto1_inst_p1_02
			vol = 350
		}
	}
}
VO_m_c3_epicPhoto1_inst_p1_03_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c3_epicPhoto1_inst_p1_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c3_epicphoto1_inst_p1_03
			vol = 350
		}
	}
}
VO_m_c3_epicPhoto1_inst_p1_04_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c3_epicPhoto1_inst_p1_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c3_epicphoto1_inst_p1_04
			vol = 350
		}
	}
}
VO_m_c3_epicPhoto1_inst_p1_05_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c3_epicPhoto1_inst_p1_05_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c3_epicphoto1_inst_p1_05
			vol = 350
		}
	}
}
VO_m_c3_epicPhoto1_inst_p2_01_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c3_epicPhoto1_inst_p2_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c3_epicphoto1_inst_p2_01
			vol = 350
		}
	}
}
VO_m_c3_epicPhoto1_inst_p2_02_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c3_epicPhoto1_inst_p2_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c3_epicphoto1_inst_p2_02
			vol = 350
		}
	}
}
VO_m_c3_epicPhoto1_inst_p3_01_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c3_epicPhoto1_inst_p3_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c3_epicphoto1_inst_p3_01
			vol = 350
		}
	}
}
VO_m_c3_epicPhoto1_inst_p3_02_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c3_epicPhoto1_inst_p3_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c3_epicphoto1_inst_p3_02
			vol = 350
		}
	}
}
VO_m_c3_epicPhoto1_inst_p3_03_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c3_epicPhoto1_inst_p3_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c3_epicphoto1_inst_p3_03
			vol = 350
		}
	}
}
VO_m_c3_epicPhoto1_inst_p4_01_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c3_epicPhoto1_inst_p4_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c3_epicphoto1_inst_p4_01
			vol = 350
		}
	}
}
VO_m_c3_epicPhoto1_inst_p4_02_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c3_epicPhoto1_inst_p4_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c3_epicphoto1_inst_p4_02
			vol = 350
		}
	}
}
VO_m_c3_epicPhoto1_inst_p4_03_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c3_epicPhoto1_inst_p4_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c3_epicphoto1_inst_p4_03
			vol = 350
		}
	}
}
VO_m_c3_epicPhoto1_inst_p5_01_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c3_epicPhoto1_inst_p5_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c3_epicphoto1_inst_p5_01
			vol = 350
		}
	}
}
VO_m_c3_epicPhoto1_inst_p5_02_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c3_epicPhoto1_inst_p5_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c3_epicphoto1_inst_p5_02
			vol = 350
		}
	}
}
VO_m_c3_epicPhoto1_inst_p6_01_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c3_epicPhoto1_inst_p6_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c3_epicphoto1_inst_p6_01
			vol = 350
		}
	}
}
VO_m_c3_epicPhoto1_inst_p6_02_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c3_epicPhoto1_inst_p6_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c3_epicphoto1_inst_p6_02
			vol = 350
		}
	}
}
Williams_KeepItUp_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 15
	instancemanagement = stop_oldest
	instancelimit = 1
}
Williams_KeepItUp_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			williams_cheerland_01
			vol = 350
		}
		sound2 = {
			williams_cheerland_02
			vol = 350
		}
		sound3 = {
			williams_cheerland_03
			vol = 350
		}
		sound4 = {
			williams_cheerland_04
			vol = 350
		}
		sound5 = {
			williams_cheerland_05
			vol = 350
		}
		sound6 = {
			williams_cheerland_06
			vol = 350
		}
		sound7 = {
			m_c3_photosession_inc_pos_11
			vol = 350
		}
		sound8 = {
			m_c3_photosession_inc_pos_12
			vol = 350
		}
		sound9 = {
			m_c3_photosession_inc_pos_13
			vol = 350
		}
		sound10 = {
			m_c3_photosession_inc_pos_14
			vol = 350
		}
		sound11 = {
			m_c3_photosession_inc_pos_15
			vol = 350
		}
		sound12 = {
			m_c3_photosession_inc_pos_16
			vol = 350
		}
		sound13 = {
			williams_keepitup_01
			vol = 350
		}
		sound14 = {
			williams_keepitup_02
			vol = 350
		}
		sound15 = {
			williams_keepitup_03
			vol = 350
		}
	}
}
Williams_BooLand_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 15
	instancemanagement = stop_oldest
	instancelimit = 1
}
Williams_BooLand_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			williams_booland_01
			vol = 350
		}
		sound2 = {
			williams_booland_02
			vol = 350
		}
		sound3 = {
			williams_booland_03
			vol = 350
		}
		sound4 = {
			williams_booland_04
			vol = 350
		}
		sound5 = {
			williams_booland_05
			vol = 350
		}
		sound6 = {
			williams_booland_06
			vol = 350
		}
		sound7 = {
			williams_booland_07
			vol = 350
		}
		sound8 = {
			williams_booland_08
			vol = 350
		}
		sound9 = {
			williams_booland_09
			vol = 350
		}
		sound10 = {
			m_c3_photosession_inc_neg_12
			vol = 350
		}
		sound11 = {
			m_c3_photosession_inc_neg_13
			vol = 350
		}
		sound12 = {
			m_c3_photosession_inc_neg_14
			vol = 350
		}
		sound13 = {
			m_c3_photosession_inc_neg_15
			vol = 350
		}
		sound14 = {
			m_c3_photosession_inc_neg_16
			vol = 350
		}
		sound15 = {
			m_c3_photosession_inc_neg_17
			vol = 350
		}
		sound16 = {
			m_c3_photosession_inc_neg_18
			vol = 350
		}
	}
}
Williams_BooLand_2_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 15
	instancemanagement = stop_oldest
	instancelimit = 1
}
Williams_BooLand_2_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			williams_booland_01
			vol = 350
		}
		sound2 = {
			williams_booland_02
			vol = 350
		}
		sound3 = {
			williams_booland_03
			vol = 350
		}
		sound4 = {
			williams_booland_04
			vol = 350
		}
		sound5 = {
			williams_booland_05
			vol = 350
		}
		sound6 = {
			williams_booland_06
			vol = 350
		}
		sound7 = {
			williams_booland_07
			vol = 350
		}
		sound8 = {
			williams_booland_08
			vol = 350
		}
		sound9 = {
			williams_booland_09
			vol = 350
		}
	}
}
Williams_CheerLand_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 15
	instancemanagement = stop_oldest
	instancelimit = 1
}
Williams_CheerLand_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			williams_cheerland_01
			vol = 350
		}
		sound2 = {
			williams_cheerland_02
			vol = 350
		}
		sound3 = {
			williams_cheerland_03
			vol = 350
		}
		sound4 = {
			williams_cheerland_04
			vol = 350
		}
		sound5 = {
			williams_cheerland_05
			vol = 350
		}
		sound6 = {
			williams_cheerland_06
			vol = 350
		}
		sound7 = {
			m_c3_photosession_inc_pos_11
			vol = 350
		}
		sound8 = {
			m_c3_photosession_inc_pos_12
			vol = 350
		}
		sound9 = {
			m_c3_photosession_inc_pos_13
			vol = 350
		}
		sound10 = {
			m_c3_photosession_inc_pos_14
			vol = 350
		}
		sound11 = {
			m_c3_photosession_inc_pos_15
			vol = 350
		}
		sound12 = {
			m_c3_photosession_inc_pos_16
			vol = 350
		}
	}
}
Williams_CheerLand_2_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 15
	instancemanagement = stop_oldest
	instancelimit = 1
}
Williams_CheerLand_2_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			williams_cheerland_01
			vol = 350
		}
		sound2 = {
			williams_cheerland_02
			vol = 350
		}
		sound3 = {
			williams_cheerland_03
			vol = 350
		}
		sound4 = {
			williams_cheerland_04
			vol = 350
		}
		sound5 = {
			williams_cheerland_05
			vol = 350
		}
		sound6 = {
			williams_cheerland_06
			vol = 350
		}
	}
}
m_c3_photothemed_chk1p1_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c3_photothemed_chk1p1_container = {
	command = playsound
	randomness = none
}
m_c3_photothemed_chk1p2_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c3_photothemed_chk1p2_container = {
	command = playsound
	randomness = none
}
m_c3_photothemed_chk1p3_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c3_photothemed_chk1p3_container = {
	command = playsound
	randomness = none
}
m_c3_photothemed_chk1p4_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c3_photothemed_chk1p4_container = {
	command = playsound
	randomness = none
}
m_c3_photothemed_chk1p5_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c3_photothemed_chk1p5_container = {
	command = playsound
	randomness = none
}
m_c3_photothemed_chk1p6_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c3_photothemed_chk1p6_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c3_photothemed_inst_p1_06
			vol = 350
		}
	}
}
m_c3_photothemed_chk2p1_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c3_photothemed_chk2p1_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c3_photothemed_inst_p2_01
			vol = 350
		}
	}
}
m_c3_photothemed_chk2p2_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c3_photothemed_chk2p2_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c3_photothemed_inst_p2_02
			vol = 350
		}
	}
}
m_c3_photothemed_chk2p3_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c3_photothemed_chk2p3_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c3_photothemed_inst_p2_03
			vol = 350
		}
	}
}
m_c3_photothemed_chk3p1_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c3_photothemed_chk3p1_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c3_photothemed_inst_p3_01
			vol = 350
		}
	}
}
VO_m_c3_photosession_inst_09_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c3_photosession_inst_09_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c3_photosession_inst_09
			vol = 350
		}
	}
}
VO_m_c3_photosession_inst_11_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c3_photosession_inst_11_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c3_photosession_inst_11
			vol = 350
		}
	}
}
VO_m_c3_photosession_inst_12_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c3_photosession_inst_12_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c3_photosession_inst_12
			vol = 350
		}
	}
}
VO_m_c3_Photosession_outro_01_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c3_Photosession_outro_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c3_photosession_outro_01
			vol = 350
		}
	}
}
Bryce_Photo_Critique_OK_Neg_session_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 15
	instancemanagement = stop_oldest
	instancelimit = 1
}
Bryce_Photo_Critique_OK_Neg_session_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			Bryce_Critique_OK_neg_01
			vol = 350
		}
		sound2 = {
			Bryce_Critique_OK_neg_09
			vol = 350
		}
		sound3 = {
			Bryce_Critique_OK_neg_10
			vol = 350
		}
		sound4 = {
			Bryce_Critique_OK_neg_11
			vol = 350
		}
		sound5 = {
			Bryce_Critique_OK_neg_12
			vol = 350
		}
		sound6 = {
			Bryce_Critique_OK_neg_13
			vol = 350
		}
		sound7 = {
			Bryce_Critique_OK_neg_14
			vol = 350
		}
		sound8 = {
			Bryce_Critique_OK_neg_15
			vol = 350
		}
		sound9 = {
			Bryce_Critique_OK_neg_16
			vol = 350
		}
		sound10 = {
			Bryce_Critique_OK_neg_17
			vol = 350
		}
		sound11 = {
			Bryce_Critique_OK_neg_18
			vol = 350
		}
	}
}
VO_m_h1_bigpush_inst_01_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h1_bigpush_inst_01_container = {
	command = playsound
	randomness = none
}
VO_m_h1_bigpush_inst_02_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h1_bigpush_inst_02_container = {
	command = playsound
	randomness = none
}
VO_m_h1_bigpush_inst_03_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h1_bigpush_inst_03_container = {
	command = playsound
	randomness = none
}
VO_m_h1_bigpush_inst_04_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h1_bigpush_inst_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h1_bigpush_inst_04_alt
			vol = 350
		}
	}
}
VO_m_h1_bigpush_inst_05_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h1_bigpush_inst_05_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h1_bigpush_inst_05
			vol = 350
		}
	}
}
VO_m_h1_bigpush_inst_06_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h1_bigpush_inst_06_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h1_bigpush_inst_06
			vol = 350
		}
	}
}
VO_m_h1_bigpush_inst_07_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h1_bigpush_inst_07_container = {
	command = playsound
	randomness = none
}
VO_m_h1_bigpush_inst_08_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h1_bigpush_inst_08_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h1_bigpush_inst_08
			vol = 350
		}
	}
}
VO_m_h1_bigpush_inst_09_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h1_bigpush_inst_09_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h1_bigpush_inst_09
			vol = 350
		}
	}
}
VO_m_h1_bigpush_inst_10_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h1_bigpush_inst_10_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h1_bigpush_inst_10
			vol = 350
		}
	}
}
VO_CopHarassSkater_struct = {
	default_priority = 80
	default_buss = AmbScenes
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_CopHarassSkater_container = {
	command = agent_playvo
	randomness = randomtype
}
VO_m_h1_bigpush2_negatives_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 15
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h1_bigpush2_negatives_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			m_h1_bigpush_inc_neg_01
			vol = 350
		}
		sound2 = {
			m_h1_bigpush_inc_neg_02
			vol = 350
		}
		sound3 = {
			vallely_booland_08
			vol = 350
		}
		sound4 = {
			vallely_booland_09
			vol = 350
		}
		sound5 = {
			vallely_booland_01
			vol = 350
		}
		sound6 = {
			vallely_booland_02
			vol = 350
		}
		sound7 = {
			vallely_booland_03
			vol = 350
		}
		sound8 = {
			vallely_booland_04
			vol = 350
		}
		sound9 = {
			vallely_booland_05
			vol = 350
		}
		sound10 = {
			vallely_booland_06
			vol = 350
		}
		sound11 = {
			vallely_booland_07
			vol = 350
		}
	}
}
VO_m_h1_bigpush2_Positives_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 15
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h1_bigpush2_Positives_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			m_h1_bigpush_inc_pos_01
			vol = 350
		}
		sound2 = {
			m_h1_bigpush_inc_pos_02
			vol = 350
		}
		sound3 = {
			vallely_cheerland_01
			vol = 350
		}
		sound4 = {
			vallely_cheerland_02
			vol = 350
		}
		sound5 = {
			vallely_cheerland_03
			vol = 350
		}
		sound6 = {
			vallely_cheerland_05
			vol = 350
		}
		sound7 = {
			vallely_cheerland_06
			vol = 350
		}
		sound8 = {
			vallely_cheerland_07
			vol = 350
		}
		sound9 = {
			vallely_cheerland_08
			vol = 350
		}
	}
}
VO_m_h1_BoostPull_inst_01_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h1_BoostPull_inst_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h1_boostpull_inst_01
			vol = 350
		}
	}
}
VO_m_h1_BoostPull_inst_02_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h1_BoostPull_inst_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h1_boostpull_inst_02
			vol = 350
		}
	}
}
VO_m_h1_BoostPull_inst_03_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h1_BoostPull_inst_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h1_boostpull_inst_03
			vol = 350
		}
	}
}
VO_m_h1_BoostPull_inst_03a_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h1_BoostPull_inst_03a_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h1_boostpull_inst_03_alt
			vol = 350
		}
	}
}
VO_m_h1_BoostPull_inst_04_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h1_BoostPull_inst_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h1_boostpull_inst_04
			vol = 350
		}
	}
}
VO_m_h1_BoostPull_inst_04a_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h1_BoostPull_inst_04a_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h1_boostpull_inst_04_alt
			vol = 350
		}
	}
}
VO_m_h1_BoostPull_inst_05_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h1_BoostPull_inst_05_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h1_boostpull_inst_05
			vol = 350
		}
	}
}
VO_m_h1_boostpull_Positives_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h1_boostpull_Positives_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			m_h1_boostpull_inc_pos_02
			vol = 350
		}
		sound2 = {
			m_h1_bigpush_inc_pos_01
			vol = 350
		}
		sound3 = {
			m_h1_bigpush_inc_pos_02
			vol = 350
		}
		sound4 = {
			vallely_cheerland_01
			vol = 350
		}
		sound5 = {
			vallely_cheerland_02
			vol = 350
		}
		sound6 = {
			vallely_cheerland_03
			vol = 350
		}
		sound7 = {
			vallely_cheerland_04
			vol = 350
		}
		sound8 = {
			vallely_cheerland_05
			vol = 350
		}
		sound9 = {
			vallely_cheerland_06
			vol = 350
		}
		sound10 = {
			vallely_cheerland_07
			vol = 350
		}
		sound11 = {
			vallely_cheerland_08
			vol = 350
		}
	}
}
VO_m_h1_epicdrop_inst_01_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h1_epicdrop_inst_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h1_epicdrop_inst_04
			vol = 350
		}
	}
}
VO_m_h1_epicdrop_inst_02_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h1_epicdrop_inst_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h1_epicdrop_inst_02
			vol = 350
		}
	}
}
VO_m_h1_epicdrop_inst_03_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h1_epicdrop_inst_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h1_epicdrop_inst_03
			vol = 350
		}
	}
}
VO_m_h1_epicdrop_inst_05_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h1_epicdrop_inst_05_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h1_epicdrop_inst_05
			vol = 350
		}
	}
}
VO_m_h1_epicdrop_inst_07_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h1_epicdrop_inst_07_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h1_epicdrop_inst_07_alt
			vol = 350
		}
	}
}
VO_m_h1_epicdrop_inst_08_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h1_epicdrop_inst_08_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h1_epicdrop_inst_08
			vol = 350
		}
	}
}
VO_m_h1_epicdrop_inst_06_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h1_epicdrop_inst_06_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h1_epicdrop_inst_06
			vol = 350
		}
	}
}
VO_m_h1_epicdrop_Positives_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h1_epicdrop_Positives_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			m_h1_epicdrop_inc_pos_01
			vol = 350
		}
		sound2 = {
			m_h1_epicdrop_inc_pos_02
			vol = 350
		}
		sound3 = {
			m_h1_epicdrop_inc_pos_03
			vol = 350
		}
		sound4 = {
			m_h1_boostpull_inc_pos_02
			vol = 400
		}
		sound5 = {
			m_h1_bigpush_inc_pos_01
			vol = 350
		}
		sound6 = {
			m_h1_bigpush_inc_pos_02
			vol = 350
		}
		sound7 = {
			vallely_cheerland_01
			vol = 350
		}
		sound8 = {
			vallely_cheerland_02
			vol = 350
		}
		sound9 = {
			vallely_cheerland_03
			vol = 350
		}
		sound10 = {
			vallely_cheerland_04
			vol = 350
		}
		sound11 = {
			vallely_cheerland_05
			vol = 350
		}
		sound12 = {
			vallely_cheerland_06
			vol = 350
		}
		sound13 = {
			vallely_cheerland_07
			vol = 350
		}
		sound14 = {
			vallely_cheerland_08
			vol = 350
		}
	}
}
VO_m_h1_finalepic_inst_01_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h1_finalepic_inst_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h1_finalepic_inst_01
			vol = 350
		}
	}
}
VO_m_h1_finalepic_inst_02_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h1_finalepic_inst_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h1_finalepic_inst_02
			vol = 350
		}
	}
}
VO_m_h1_finalepic_inst_03_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h1_finalepic_inst_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h1_finalepic_inst_03
			vol = 350
		}
	}
}
VO_m_h1_finalepic_inst_04_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h1_finalepic_inst_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h1_finalepic_inst_04
			vol = 350
		}
	}
}
VO_m_h1_finalepic_inst_05_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h1_finalepic_inst_05_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h1_finalepic_inst_05
			vol = 350
		}
	}
}
VO_m_h1_skitchboost_inst_01_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h1_skitchboost_inst_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h1_skitchboost_inst_01
			vol = 350
		}
	}
}
VO_m_h1_skitchboost_inst_04_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h1_skitchboost_inst_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h1_skitchboost_inst_04
			vol = 350
		}
	}
}
VO_m_h2_boneless_dollin_01_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_boneless_dollin_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_boneless_inst_01
			vol = 350
		}
	}
}
m_h2_boneless_tr_01_gp_alt_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h2_boneless_tr_01_gp_alt_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_boneless_tr_01_gp_alt
			vol = 350
		}
	}
}
VO_m_h2_boneless_inc_neg_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_boneless_inc_neg_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			m_h2_boneless_inc_neg_02
			vol = 350
		}
		sound2 = {
			m_h2_boneless_inc_neg_01
			vol = 350
		}
	}
}
VO_m_h2_boneless_inc_pos_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_boneless_inc_pos_container = {
	command = obj_playsound
	randomness = none
}
VO_m_h2_clearbcity_HopeCanSwim_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearbcity_HopeCanSwim_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			m_h2_clearcity_inc_09
			vol = 350
		}
	}
}
VO_m_h2_clearbcity_AHHAHH_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearbcity_AHHAHH_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			m_h2_clearcity_inc_10
			vol = 350
		}
	}
}
VO_m_h2_clearbcity_inst_01_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearbcity_inst_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_clearcity_inst_01
			vol = 400
		}
	}
}
VO_m_h2_clearbcity_inst_02_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearbcity_inst_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_clearcity_inst_02
			vol = 400
		}
	}
}
VO_m_h2_clearbcity_inst_03_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearbcity_inst_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_clearcity_inst_03
			vol = 400
		}
	}
}
VO_m_h2_clearbcity_inst_04_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearbcity_inst_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_clearcity_inst_04
			vol = 400
		}
	}
}
VO_m_h2_clearbcity_inst_05_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearbcity_inst_05_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_clearcity_inst_05
			vol = 400
		}
	}
}
VO_m_h2_clearbcity_inst_06_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearbcity_inst_06_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_clearcity_inst_06
			vol = 400
		}
	}
}
VO_m_h2_clearbcity_inst_07_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearbcity_inst_07_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_clearcity_inst_07
			vol = 400
		}
	}
}
VO_m_h2_clearbcity_Losers_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearbcity_Losers_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			m_h2_clearcity_inc_02
			vol = 400
		}
	}
}
VO_m_h2_clearbcity_ShockFest_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearbcity_ShockFest_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			m_h2_clearcity_inc_03
			vol = 400
		}
	}
}
VO_m_h2_clearbcity_HeyShockers_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearbcity_HeyShockers_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			m_h2_clearcity_inc_04
			vol400
		}
	}
}
VO_m_h2_clearbcity_HeyKooks_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearbcity_HeyKooks_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			m_h2_clearcity_inc_05
			vol = 400
		}
	}
}
VO_m_h2_clearbcity_HeyOverHere_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearbcity_HeyOverHere_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			m_h2_clearcity_inc_06
			vol = 400
		}
	}
}
VO_m_h2_clearbcity_Stooks_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearbcity_Stooks_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			m_h2_clearcity_inc_07
			vol = 400
		}
	}
}
VO_m_h2_clearbcity_YOUSUCK_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearbcity_YOUSUCK_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_clearcity_inc_11
			vol = 400
		}
	}
}
VO_m_h2_clearmuseums_inst_01_struct = {
	default_priority = 90
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearmuseums_inst_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_clearmuseums_inst_01
			vol = 350
		}
	}
}
VO_m_h2_clearmuseums_inst_02_struct = {
	default_priority = 90
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearmuseums_inst_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_clearmuseums_inst_02
			vol = 350
		}
	}
}
VO_m_h2_clearmuseums_inst_03_struct = {
	default_priority = 90
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearmuseums_inst_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_clearmuseums_inst_03
			vol = 350
		}
	}
}
VO_m_h2_clearmuseums_inst_04_struct = {
	default_priority = 90
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearmuseums_inst_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_clearmuseums_inst_04
			vol = 350
		}
	}
}
VO_m_h2_clearmuseums_inst_05_struct = {
	default_priority = 90
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearmuseums_inst_05_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_clearmuseums_inst_05
			vol = 350
		}
	}
}
VO_m_h2_clearmuseums_inst_06_struct = {
	default_priority = 90
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearmuseums_inst_06_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_clearmuseums_inst_06
			vol = 350
		}
	}
}
VO_m_h2_clearmuseums_inst_07_struct = {
	default_priority = 90
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearmuseums_inst_07_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_clearmuseums_inst_07
			vol = 350
		}
	}
}
VO_m_h2_clearmuseums_inst_08_struct = {
	default_priority = 90
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearmuseums_inst_08_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_clearmuseums_inst_08
			vol = 350
		}
	}
}
VO_m_h2_clearmuseums_fntn_01_struct = {
	default_priority = 90
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearmuseums_fntn_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_clearmuseums_inc_fntn_01
			vol = 350
		}
	}
}
VO_m_h2_clearmuseums_fntn_02_struct = {
	default_priority = 90
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearmuseums_fntn_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_clearmuseums_inc_fntn_02
			vol = 350
		}
	}
}
VO_m_h2_clearmuseums_fntn_03_struct = {
	default_priority = 90
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearmuseums_fntn_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_clearmuseums_inc_fntn_03
			vol = 350
		}
	}
}
VO_m_h2_clearmuseums_fntn_04_struct = {
	default_priority = 90
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearmuseums_fntn_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_clearmuseums_inc_fntn_04
			vol = 350
		}
	}
}
VO_m_h2_clearmuseums_fntn_07_struct = {
	default_priority = 90
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearmuseums_fntn_07_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_clearmuseums_inc_fntn_07
			vol = 350
		}
	}
}
VO_m_h2_clearmuseums_park_01_struct = {
	default_priority = 90
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearmuseums_park_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_clearmuseums_inc_park_01
			vol = 350
		}
	}
}
VO_m_h2_clearmuseums_park_02_struct = {
	default_priority = 90
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearmuseums_park_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_clearmuseums_inc_park_02
			vol = 350
		}
	}
}
VO_m_h2_clearmuseums_park_03_struct = {
	default_priority = 90
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearmuseums_park_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_clearmuseums_inc_park_03
			vol = 350
		}
	}
}
VO_m_h2_clearmuseums_park_04_struct = {
	default_priority = 90
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearmuseums_park_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_clearmuseums_inc_park_04
			vol = 350
		}
	}
}
VO_m_h2_clearmuseums_wtrfl_01_struct = {
	default_priority = 90
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearmuseums_wtrfl_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_clearmuseums_inc_wtrfl_01
			vol = 350
		}
	}
}
VO_m_h2_clearmuseums_wtrfl_02_struct = {
	default_priority = 90
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearmuseums_wtrfl_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_clearmuseums_inc_wtrfl_02
			vol = 350
		}
	}
}
VO_m_h2_clearmuseums_wtrfl_03_struct = {
	default_priority = 90
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearmuseums_wtrfl_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_clearmuseums_inc_wtrfl_03
			vol = 350
		}
	}
}
VO_m_h2_clearmuseums_wtrfl_04_struct = {
	default_priority = 90
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearmuseums_wtrfl_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_clearmuseums_inc_wtrfl_04
			vol = 350
		}
	}
}
VO_m_h2_clearmuseums_fntn_05_struct = {
	default_priority = 90
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearmuseums_fntn_05_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_clearmuseums_inc_fntn_05
			vol = 350
		}
	}
}
VO_m_h2_clearmuseums_Thug_01_struct = {
	default_priority = 90
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearmuseums_Thug_01_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			m_h2_clearmuseums_inc_thug2_01
			vol = 350
		}
		sound2 = {
			m_h2_clearmuseum_inc_thug_01
			vol = 350
		}
	}
}
VO_m_h2_clearmuseums_Thug_02_struct = {
	default_priority = 90
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearmuseums_Thug_02_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			m_h2_clearmuseums_inc_thug2_02
			vol = 350
		}
		sound2 = {
			m_h2_clearmuseum_inc_thug_02
			vol = 350
		}
	}
}
VO_m_h2_clearmuseums_Thug_03_struct = {
	default_priority = 90
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearmuseums_Thug_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_clearmuseums_inc_thug2_03
			vol = 350
		}
	}
}
VO_m_h2_clearmuseums_Thug_04_struct = {
	default_priority = 90
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearmuseums_Thug_04_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			m_h2_clearmuseum_inc_thug_04
			vol = 350
		}
		sound2 = {
			m_h2_clearmuseums_inc_thug2_04
			vol = 350
		}
	}
}
VO_m_h2_clearmuseums_Thug_05_struct = {
	default_priority = 90
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearmuseums_Thug_05_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			m_h2_clearmuseum_inc_thug_05
			vol = 350
		}
		sound2 = {
			m_h2_clearmuseums_inc_thug2_05
			vol = 350
		}
	}
}
VO_m_h2_clearmuseums_Thug_06_struct = {
	default_priority = 90
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearmuseums_Thug_06_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			m_h2_clearmuseum_inc_thug_06
			vol = 350
		}
		sound2 = {
			m_h2_clearmuseums_inc_thug2_06
			vol = 350
		}
	}
}
VO_m_h2_clearmuseums_Thug_07_struct = {
	default_priority = 90
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearmuseums_Thug_07_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			m_h2_clearmuseum_inc_thug_07
			vol = 350
		}
		sound2 = {
			m_h2_clearmuseums_inc_thug2_07
			vol = 350
		}
	}
}
VO_m_h2_clearmuseums_Thug_08_struct = {
	default_priority = 90
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearmuseums_Thug_08_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			m_h2_clearmuseum_inc_thug_08
			vol = 350
		}
		sound2 = {
			m_h2_clearmuseums_inc_thug2_08
			vol = 350
		}
	}
}
VO_m_h2_clearmuseums_Thug_09_struct = {
	default_priority = 90
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearmuseums_Thug_09_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			m_h2_clearmuseum_inc_thug_09
			vol = 350
		}
		sound2 = {
			m_h2_clearmuseums_inc_thug2_09
			vol = 350
		}
	}
}
VO_m_h2_clearmuseums_Thug_10_struct = {
	default_priority = 90
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearmuseums_Thug_10_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			m_h2_clearmuseum_inc_thug_10
			vol = 350
		}
		sound2 = {
			m_h2_clearmuseums_inc_thug2_10
			vol = 350
		}
	}
}
VO_m_h2_clearmuseums_Thug_11_struct = {
	default_priority = 90
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearmuseums_Thug_11_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			m_h2_clearmuseum_inc_thug_11
			vol = 350
		}
		sound2 = {
			m_h2_clearmuseums_inc_thug2_11
			vol = 350
		}
	}
}
VO_m_h2_clearmuseums_Thug_12_struct = {
	default_priority = 90
	default_buss = announcer
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearmuseums_Thug_12_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			m_h2_clearmuseum_inc_thug_12
			vol = 350
		}
		sound2 = {
			m_h2_clearmuseums_inc_thug2_12
			vol = 350
		}
	}
}
VO_m_h2_learncheck_inc_01_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_learncheck_inc_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_learncheck_inc_01
			vol = 350
		}
	}
}
VO_m_h2_learncheck_inc_02_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_learncheck_inc_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_learncheck_inc_02
			vol = 350
		}
	}
}
VO_m_h2_learncheck_inc_03_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_learncheck_inc_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_learncheck_inc_03
			vol = 350
		}
	}
}
VO_m_h2_learncheck_inc_04_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_learncheck_inc_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_learncheck_inc_04
			vol = 350
		}
	}
}
VO_m_h2_learncheck_inc_05_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_learncheck_inc_05_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_learncheck_inc_05
			vol = 350
		}
	}
}
VO_m_h2_learncheck_inc_06_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_learncheck_inc_06_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_learncheck_inc_06
			vol = 350
		}
	}
}
VO_m_h2_learncheck_inc_07_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_learncheck_inc_07_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_learncheck_inc_07
			vol = 350
		}
	}
}
VO_m_h2_learncheck_inc_08_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_learncheck_inc_08_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_learncheck_inc_08
			vol = 350
		}
	}
}
VO_m_h2_learncheck_inc_work_01_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_learncheck_inc_work_01_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			m_h2_learncheck_inc_work2_01
			vol = 350
		}
		sound2 = {
			m_h2_learncheck_inc_work1_01
			vol = 350
		}
	}
}
VO_m_h2_learncheck_inc_work_02_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_learncheck_inc_work_02_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			m_h2_learncheck_inc_work2_02
			vol = 350
		}
		sound2 = {
			m_h2_learncheck_inc_work1_02
			vol = 350
		}
	}
}
VO_m_h2_learncheck_inc_work_03_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_learncheck_inc_work_03_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			m_h2_learncheck_inc_work2_03
			vol = 350
		}
		sound2 = {
			m_h2_learncheck_inc_work1_03
			vol = 350
		}
	}
}
VO_m_h2_learncheck_inc_work_04_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_learncheck_inc_work_04_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			m_h2_learncheck_inc_work2_04
			vol = 350
		}
		sound2 = {
			m_h2_learncheck_inc_work1_04
			vol = 350
		}
	}
}
VO_m_h2_learncheck_inc_work_05_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_learncheck_inc_work_05_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			m_h2_learncheck_inc_work2_05
			vol = 350
		}
		sound2 = {
			m_h2_learncheck_inc_work1_05
			vol = 350
		}
	}
}
VO_m_h2_learncheck_inc_work_06_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_learncheck_inc_work_06_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			m_h2_learncheck_inc_work2_06
			vol = 350
		}
		sound2 = {
			m_h2_learncheck_inc_work1_06
			vol = 350
		}
	}
}
VO_m_h2_learncheck_inc_work_07_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_learncheck_inc_work_07_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_learncheck_inc_work1_07
			vol = 350
		}
	}
}
VO_m_h2_learncheck_inc_work_08_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_learncheck_inc_work_08_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_learncheck_inc_work1_08
			vol = 350
		}
	}
}
VO_m_h2_learncheck_inc_work_09_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_learncheck_inc_work_09_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_learncheck_inc_work1_09
			vol = 350
		}
	}
}
VO_m_h2_learncheck_inc_work_10_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_learncheck_inc_work_10_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_learncheck_inc_work1_10
			vol = 350
		}
	}
}
VO_m_h2_learncheck_inc_work_11_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_learncheck_inc_work_11_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_learncheck_inc_work1_11
			vol = 350
		}
	}
}
VO_m_h2_learncheck_worker_Taunt_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_learncheck_worker_Taunt_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_learncheck_inc_worktaunt1_01
			vol = 350
		}
	}
}
VO_m_h2_learncheck_worker_Taunt_2_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_learncheck_worker_Taunt_2_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_learncheck_inc_worktaunt1_02
			vol = 350
		}
	}
}
VO_m_h3_bowlcomp_outro_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h3_bowlcomp_outro_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_bowlcomp_outro
			vol = 350
		}
	}
}
VO_m_h3_ntb_inst_04_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h3_ntb_inst_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_ntb_inst_04
			vol = 350
		}
	}
}
VO_m_h3_ntb_inst_08_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h3_ntb_inst_08_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_ntb_inst_08
			vol = 350
		}
	}
}
VO_m_r1_buildkick_inst_01_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r1_buildkick_inst_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_buildkick_inst_01
			vol = 350
		}
	}
}
VO_m_r1_buildkick_inst_02_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r1_buildkick_inst_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_buildkick_inst_02
			vol = 350
		}
	}
}
VO_m_r1_buildkick_inst_03_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r1_buildkick_inst_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_buildkick_inst_03
			vol = 350
		}
	}
}
VO_m_r1_buildkick_inst_04_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r1_buildkick_inst_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_buildkick_inst_04
			vol = 350
		}
	}
}
VO_m_r1_buildkick_negatives_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r1_buildkick_negatives_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			m_r1_buildkick_inc_neg_02
			vol = 350
		}
		sound2 = {
			m_r1_buildkick_inc_neg_03
			vol = 350
		}
		sound3 = {
			m_r1_buildkick_inc_neg_04
			vol = 350
		}
		sound4 = {
			m_r1_buildkick_inc_neg_05
			vol = 350
		}
		sound5 = {
			m_r1_buildkick_inc_neg_06
			vol = 350
		}
		sound6 = {
			m_r1_buildkick_inc_neg_07
			vol = 350
		}
		sound7 = {
			m_r1_buildkick_inc_neg_08
			vol = 350
		}
		sound8 = {
			m_r1_buildkick_inc_neg_01
			vol = 350
		}
	}
}
VO_m_r1_buildkick_positives_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r1_buildkick_positives_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			m_r1_buildkick_inc_pos_01
			vol = 350
		}
		sound2 = {
			m_r1_buildkick_inc_pos_02
			vol = 350
		}
		sound3 = {
			m_r1_buildkick_inc_pos_04
			vol = 350
		}
		sound4 = {
			m_r1_buildkick_inc_pos_05
			vol = 350
		}
		sound5 = {
			m_r1_buildkick_inc_pos_06
			vol = 350
		}
		sound6 = {
			m_r1_buildkick_inc_pos_07
			vol = 350
		}
		sound7 = {
			m_r1_buildkick_inc_pos_09
			vol = 350
		}
		sound8 = {
			m_r1_buildkick_inc_pos_10
			vol = 350
		}
		sound9 = {
			m_r1_buildkick_inc_pos_11
			vol = 350
		}
		sound10 = {
			m_r1_buildkick_inc_pos_12
			vol = 350
		}
	}
}
VO_m_r1_buildkick_ready_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r1_buildkick_ready_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			m_r1_buildkick_inc_ready_01
			vol = 350
		}
		sound2 = {
			m_r1_buildkick_inc_ready_02
			vol = 350
		}
		sound3 = {
			m_r1_buildkick_inc_ready_03
			vol = 350
		}
		sound4 = {
			m_r1_buildkick_inc_ready_04
			vol = 350
		}
		sound5 = {
			m_r1_buildkick_inc_ready_05
			vol = 350
		}
	}
}
VO_m_r1_buildspine_FallWater_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r1_buildspine_FallWater_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			m_r1_buildspine_inc_neg_01
			vol = 350
		}
		sound2 = {
			m_r1_buildspine_inc_neg_02
			vol = 350
		}
		sound3 = {
			m_r1_buildspine_inc_neg_03
			vol = 350
		}
		sound4 = {
			m_r1_buildspine_inc_neg_04
			vol = 350
		}
	}
}
VO_m_r1_buildspine_inst_01_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r1_buildspine_inst_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_buildspine_inst_01
			vol = 350
		}
	}
}
VO_m_r1_buildspine_inst_02_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r1_buildspine_inst_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_buildspine_inst_02
			vol = 350
		}
	}
}
VO_m_r1_buildspine_inst_03_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r1_buildspine_inst_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_buildspine_inst_03
			vol = 350
		}
	}
}
VO_m_r1_buildspine_inst_04_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r1_buildspine_inst_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_buildspine_inst_04
			vol = 350
		}
	}
}
VO_m_r1_demo_inc_neg_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r1_demo_inc_neg_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			m_r1_demo_inc_neg_01
			vol = 350
		}
		sound2 = {
			m_r1_demo_inc_neg_02
			vol = 350
		}
		sound3 = {
			m_r1_demo_inc_neg_03
			vol = 350
		}
		sound4 = {
			m_r1_demo_inc_neg_04
			vol = 350
		}
	}
}
VO_m_r1_demo_inc_pos_1_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r1_demo_inc_pos_1_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_demo_inc_pos_01
			vol = 350
		}
	}
}
VO_m_r1_demo_inc_pos_2_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r1_demo_inc_pos_2_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_demo_inc_pos_02
			vol = 350
		}
	}
}
VO_m_r1_demo_inc_pos_3_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r1_demo_inc_pos_3_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_demo_inc_pos_03
			vol = 350
		}
	}
}
VO_PlayingPlanes_struct = {
	default_priority = 80
	default_buss = AmbScenes
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_PlayingPlanes_container = {
	command = agent_playvo
	randomness = none
}
VO_m_h2_clearcity_in_thug_01_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearcity_in_thug_01_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			m_h2_clearcity_inc_thug_annoy_01
			vol = 350
		}
		sound2 = {
			m_h2_clearcity_inc_thug2_annoy_01
			vol = 350
		}
	}
}
VO_m_h2_clearcity_in_thug_02_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearcity_in_thug_02_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			m_h2_clearcity_inc_thug_annoy_02
			vol = 350
		}
		sound2 = {
			m_h2_clearcity_inc_thug2_annoy_02
			vol = 350
		}
	}
}
VO_m_h2_clearcity_in_thug_03_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearcity_in_thug_03_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			m_h2_clearcity_inc_thug_annoy_03
			vol = 350
		}
		sound2 = {
			m_h2_clearcity_inc_thug2_annoy_03
			vol = 350
		}
	}
}
VO_m_h2_clearcity_in_thug_04_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearcity_in_thug_04_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			m_h2_clearcity_inc_thug_annoy_04
			vol = 350
		}
		sound2 = {
			m_h2_clearcity_inc_thug2_annoy_04
			vol = 350
		}
	}
}
VO_m_h2_clearcity_in_thug_05_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearcity_in_thug_05_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			m_h2_clearcity_inc_thug_annoy_05
			vol = 350
		}
		sound2 = {
			m_h2_clearcity_inc_thug2_annoy_05
			vol = 350
		}
	}
}
VO_m_h2_clearcity_in_thug_06_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearcity_in_thug_06_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			m_h2_clearcity_inc_thug_annoy_06
			vol = 350
		}
		sound2 = {
			m_h2_clearcity_inc_thug2_annoy_06
			vol = 350
		}
	}
}
VO_m_h2_clearcity_in_thug_07_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_clearcity_in_thug_07_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			m_h2_clearcity_inc_thug_annoy_07
			vol = 350
		}
		sound2 = {
			m_h2_clearcity_inc_thug2_annoy_07
			vol = 350
		}
	}
}
VO_m_h2_takefdr_inc_05_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_takefdr_inc_05_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_takefdr_inc_05
			vol = 350
		}
	}
}
VO_m_h2_takefdr_inc_06_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_takefdr_inc_06_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_takefdr_inc_06
			vol = 350
		}
	}
}
VO_m_h2_takefdr_inc_07_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_takefdr_inc_07_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_takefdr_inc_07
			vol = 350
		}
	}
}
m_h3_wallrides_inc_neg_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h3_wallrides_inc_neg_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			m_h3_wallrides_inc_neg_01
			vol = 350
		}
		sound2 = {
			m_h3_wallrides_inc_neg_02
			vol = 350
		}
	}
}
vo_m_h3_wallrides_inc_pos_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
vo_m_h3_wallrides_inc_pos_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			m_h3_wallrides_inc_pos_01
			vol = 350
		}
		sound2 = {
			m_h3_wallrides_inc_pos_02
			vol = 350
		}
	}
}
sk9_tram_stop_1_struct = {
	default_priority = 70
	default_buss = Train
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_tram_stop_1_container = {
	command = obj_playsound
	randomness = none
}
sk9_tram_stop_2_struct = {
	default_priority = 70
	default_buss = Train
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_tram_stop_2_container = {
	command = obj_playsound
	randomness = none
}
VO_m_h1_skitchboost_neg_struct = {
	default_priority = 80
	default_buss = GoalVO_WET
	norepeatfor = 15
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h1_skitchboost_neg_container = {
	command = obj_playsound
	randomness = none
}
VO_m_h1_skitchboost_pos_struct = {
	default_priority = 80
	default_buss = GoalVO_WET
	norepeatfor = 15
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h1_skitchboost_pos_container = {
	command = obj_playsound
	randomness = randomnorepeatlasttwotype
}
VO_m_h1_skitchboot_inst_02_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h1_skitchboot_inst_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h1_skitchboot_inst_02
			vol = 350
		}
	}
}
VO_m_h1_skitchboot_inst_03_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h1_skitchboot_inst_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h1_skitchboot_inst_03
			vol = 350
		}
	}
}
sk9_Crane_Fall_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Crane_Fall_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			Crane_Fall
			vol = 400
		}
	}
}
sk9_Crane_Screech_struct = {
	default_priority = 80
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Crane_Screech_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			Crane_Screech_01
			vol = 200
		}
		sound2 = {
			Crane_Screech_02
			vol = 200
		}
		sound3 = {
			Crane_Screech_03
			vol = 200
		}
		sound4 = {
			Crane_Screech_04
			vol = 200
		}
		sound5 = {
			Crane_Screech_05
			vol = 200
		}
	}
}
Break_Wood_Med_slums_SFX_container = {
	command = obj_playsound
	randomness = randomnorepeattype
}
Break_Wood_Large_SFX_slums_struct = {
	default_priority = 65
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 4
}
Break_Wood_Large_SFX_slums_container = {
	command = playsound
	randomness = randomnorepeattype
}
VO_m_h2_takefdr_inc_08_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_takefdr_inc_08_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_takefdr_inc_08
			vol = 350
		}
	}
}
VO_m_h2_takefdr_inc_09_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_takefdr_inc_09_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_takefdr_inc_09
			vol = 350
		}
	}
}
VO_m_h2_takefdr_inc_10_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_takefdr_inc_10_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h2_takefdr_inc_10
			vol = 350
		}
	}
}
VO_m_h2_TakeFDR_Thug_DeadSucker_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_TakeFDR_Thug_DeadSucker_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			thug1_chase_02
			vol = 350
		}
	}
}
VO_m_h2_TakeFDR_Thug_GetYours_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_TakeFDR_Thug_GetYours_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			thug1_chase_06
			vol = 350
		}
	}
}
VO_m_h2_TakeFDR_Thug_BustYouUp_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h2_TakeFDR_Thug_BustYouUp_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			thug1_chase_07
			vol = 350
		}
	}
}
reward_screen_sfx_struct = {
	default_priority = 95
	default_buss = frontend
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
reward_screen_sfx_container = {
	command = playsound
	randomness = none
}
m_r1_demo_ped_Crowds_SFX_01_struct = {
	default_priority = 80
	default_buss = crowd
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r1_demo_ped_Crowds_SFX_01_container = {
	command = playsound
	randomness = none
}
m_r1_demo_ped_Crowds_SFX_02_struct = {
	default_priority = 80
	default_buss = crowd
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r1_demo_ped_Crowds_SFX_02_container = {
	command = playsound
	randomness = none
}
m_r1_demo_ped_Crowds_SFX_03_struct = {
	default_priority = 80
	default_buss = crowd
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r1_demo_ped_Crowds_SFX_03_container = {
	command = playsound
	randomness = none
}
m_r1_showdown_SFX_Crowd_01_struct = {
	default_priority = 80
	default_buss = crowd
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r1_showdown_SFX_Crowd_01_container = {
	command = playsound
	randomness = none
}
m_h3_bowlcomp_crowd_sfx_struct = {
	default_priority = 80
	default_buss = crowd
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h3_bowlcomp_crowd_sfx_container = {
	command = playsound
	randomness = none
}
m_cu_crowd_SFX_01_struct = {
	default_priority = 80
	default_buss = crowd
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_cu_crowd_SFX_01_container = {
	command = playsound
	randomness = none
}
m_cu_crowd_SFX_02_struct = {
	default_priority = 80
	default_buss = crowd
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_cu_crowd_SFX_02_container = {
	command = playsound
	randomness = none
}
m_c2_compstreet_crowd_sfx_01_struct = {
	default_priority = 80
	default_buss = crowd
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_compstreet_crowd_sfx_01_container = {
	command = playsound
	randomness = none
}
m_c2_compstreet_crowd_sfx_02_struct = {
	default_priority = 80
	default_buss = crowd
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_compstreet_crowd_sfx_02_container = {
	command = playsound
	randomness = none
}
m_c2_compstreet_crowd_sfx_03_struct = {
	default_priority = 80
	default_buss = crowd
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_compstreet_crowd_sfx_03_container = {
	command = playsound
	randomness = none
}
m_c1_demo_Crowd_Sfx_01_struct = {
	default_priority = 80
	default_buss = crowd
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_demo_Crowd_Sfx_01_container = {
	command = obj_playsound
	randomness = none
}
m_c1_demo_Crowd_Sfx_02_struct = {
	default_priority = 80
	default_buss = crowd
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_demo_Crowd_Sfx_02_container = {
	command = obj_playsound
	randomness = none
}
m_c1_demo_Crowd_Sfx_03_struct = {
	default_priority = 80
	default_buss = crowd
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_demo_Crowd_Sfx_03_container = {
	command = obj_playsound
	randomness = none
}
m_c2_compvert_Crowd_Sfx_01_struct = {
	default_priority = 80
	default_buss = crowd
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_compvert_Crowd_Sfx_01_container = {
	command = playsound
	randomness = none
}
m_c2_compvert_Crowd_Sfx_02_struct = {
	default_priority = 80
	default_buss = crowd
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_compvert_Crowd_Sfx_02_container = {
	command = playsound
	randomness = none
}
m_c2_comppark_Crowd_Sfx_01_struct = {
	default_priority = 80
	default_buss = crowd
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_comppark_Crowd_Sfx_01_container = {
	command = playsound
	randomness = none
}
m_c2_comppark_Crowd_Sfx_02_struct = {
	default_priority = 80
	default_buss = crowd
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_comppark_Crowd_Sfx_02_container = {
	command = playsound
	randomness = none
}
m_c2_comppark_Crowd_Sfx_03_struct = {
	default_priority = 80
	default_buss = crowd
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c2_comppark_Crowd_Sfx_03_container = {
	command = playsound
	randomness = none
}
sk9_Pyro_struct = {
	default_priority = 75
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Pyro_container = {
	command = playsound
	randomness = none
}
sk9_Pyro_c3_struct = {
	default_priority = 75
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Pyro_c3_container = {
	command = playsound
	randomness = none
}
sk9_Pyro_02_struct = {
	default_priority = 75
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Pyro_02_container = {
	command = playsound
	randomness = none
}
BusinessMan2_Avoid_Stream_struct = {
	default_priority = 50
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
BusinessMan2_Avoid_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			bus_m2_avoid_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			bus_m2_avoid_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			bus_m2_avoid_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			bus_m2_avoid_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			bus_m2_avoid_05
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			bus_m2_avoid_06
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			bus_m2_avoid_07
			dropoff = 50
			dropoff_function = linear
		}
		sound8 = {
			bus_m2_avoid_09
			dropoff = 50
			dropoff_function = linear
		}
		sound9 = {
			bus_m2_avoid_10
			dropoff = 50
			dropoff_function = linear
		}
		sound10 = {
			bus_m2_avoid_11
			dropoff = 50
			dropoff_function = linear
		}
		sound11 = {
			bus_m2_avoid_12
			dropoff = 50
			dropoff_function = linear
		}
		sound12 = {
			bus_m2_avoid_13
			dropoff = 50
			dropoff_function = linear
		}
	}
}
BusinessMan2_BooLand_Stream_struct = {
	default_priority = 50
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
BusinessMan2_BooLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			bus_m2_booland_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			bus_m2_booland_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			bus_m2_booland_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			bus_m2_booland_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			bus_m2_booland_05
			dropoff = 50
			dropoff_function = linear
		}
	}
}
BusinessMan2_CheerLand_Stream_struct = {
	default_priority = 50
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
BusinessMan2_CheerLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			bus_m2_cheerland_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			bus_m2_cheerland_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			bus_m2_cheerland_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			bus_m2_cheerland_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			bus_m2_cheerland_05
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			bus_m2_cheerland_06
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			bus_m2_cheerland_07
			dropoff = 50
			dropoff_function = linear
		}
		sound8 = {
			bus_m2_cheerland_08
			dropoff = 50
			dropoff_function = linear
		}
		sound9 = {
			bus_m2_cheerland_09
			dropoff = 50
			dropoff_function = linear
		}
	}
}
BusinessMan2_KeepItUp_Stream_struct = {
	default_priority = 50
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
BusinessMan2_KeepItUp_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			bus_m2_keepitup_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			bus_m2_keepitup_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			bus_m2_keepitup_03
			dropoff = 50
			dropoff_function = linear
		}
	}
}
sk9_sfx_incomingbeeper_struct = {
	default_priority = 95
	default_buss = frontend
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
sk9_sfx_incomingbeeper_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			motorola_phone1
		}
	}
}
c3_photosessions_tr_01_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
c3_photosessions_tr_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			c3_photosessions_tr_01
			vol = 350
		}
	}
}
m_c2_compvert_inst_14_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
m_c2_compvert_inst_14_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_compvert_inst_14
			vol = 350
		}
	}
}
m_c2_compvert_inst_15_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
m_c2_compvert_inst_15_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_compvert_inst_15
			vol = 350
		}
	}
}
m_c2_compvert_tr_gp_02_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
m_c2_compvert_tr_gp_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_compvert_tr_gp_02
			vol = 350
		}
	}
}
m_c2_localcomp_outro_sheckler_02_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
m_c2_localcomp_outro_sheckler_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_localcomp_outro_sheckler_02
			vol = 350
		}
	}
}
m_c2_NTG_inst_02b_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
m_c2_NTG_inst_02b_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_NTG_inst_02b
			vol = 350
		}
	}
}
m_c2_NTG_tr_01_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
m_c2_NTG_tr_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_NTG_tr_01
			vol = 350
		}
	}
}
m_c2_revman_tr_01_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
m_c2_revman_tr_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_revman_tr_01
			vol = 350
		}
	}
}
m_c3_epicphoto1_tr_01_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
m_c3_epicphoto1_tr_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c3_epicphoto1_tr_01
			vol = 350
		}
	}
}
m_c3_epicphoto2_tr_01_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
m_c3_epicphoto2_tr_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c3_epicphoto2_tr_01
			vol = 350
		}
	}
}
m_c3_epicphoto3_tr_01_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
m_c3_epicphoto3_tr_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c3_epicphoto3_tr_01
			vol = 350
		}
	}
}
m_c3_epicphoto3_tr_02_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
m_c3_epicphoto3_tr_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c3_epicphoto3_tr_02
			vol = 350
		}
	}
}
m_c3_NTM_tr_01_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
m_c3_NTM_tr_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c3_NTM_tr_01
			vol = 350
		}
	}
}
m_r3_museums_tr_o1_gp_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
m_r3_museums_tr_o1_gp_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_museums_tr_o1_gp
			vol = 350
		}
	}
}
m_r3_slums_tr_gp_01a_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
m_r3_slums_tr_gp_01a_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_slums_tr_gp_01a
			vol = 350
		}
	}
}
Eric_Attention_Stream_struct = {
	default_priority = 80
	default_buss = ProCallouts_WET
	norepeatfor = 10
	instancemanagement = ignore
	instancelimit = 1
}
Eric_Attention_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			eric_attn_02
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			eric_attn_03
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			eric_attn_04
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			eric_attn_05
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			eric_attn_06
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			eric_attn_01
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Eric_Avoid_Stream_struct = {
	default_priority = 80
	default_buss = ProCallouts_WET
	norepeatfor = 10
	instancemanagement = ignore
	instancelimit = 1
}
Eric_Avoid_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			eric_avoid_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			eric_avoid_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			eric_avoid_03
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Eric_BooLand_Stream_struct = {
	default_priority = 80
	default_buss = ProCallouts_WET
	norepeatfor = 10
	instancemanagement = ignore
	instancelimit = 1
}
Eric_BooLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			eric_booland_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			eric_booland_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			eric_booland_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			eric_booland_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			eric_booland_05
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			eric_booland_06
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			eric_booland_07
			dropoff = 50
			dropoff_function = linear
		}
		sound8 = {
			eric_booland_08
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Eric_BooLand_Stream_03_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 10
	instancemanagement = ignore
	instancelimit = 1
}
Eric_BooLand_Stream_03_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			eric_booland_01
			vol = 350
		}
		sound2 = {
			eric_booland_02
			vol = 350
		}
		sound3 = {
			eric_booland_03
			vol = 350
		}
		sound4 = {
			eric_booland_04
			vol = 350
		}
		sound5 = {
			eric_booland_05
			vol = 350
		}
		sound6 = {
			eric_booland_06
			vol = 350
		}
		sound7 = {
			eric_booland_07
			vol = 350
		}
		sound8 = {
			eric_booland_08
			vol = 350
		}
	}
}
Eric_BooLand_Stream_02_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 10
	instancemanagement = ignore
	instancelimit = 1
}
Eric_BooLand_Stream_02_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
}
Eric_BooLand_Stream_04_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 10
	instancemanagement = ignore
	instancelimit = 1
}
Eric_BooLand_Stream_04_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
}
Eric_CheerLand_Stream_struct = {
	default_priority = 80
	default_buss = ProCallouts_WET
	norepeatfor = 10
	instancemanagement = ignore
	instancelimit = 1
}
Eric_CheerLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			eric_cheerland_02
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			eric_cheerland_03
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			eric_cheerland_04
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			eric_cheerland_05
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			eric_cheerland_01
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Eric_CheerLand_Stream_03_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 10
	instancemanagement = ignore
	instancelimit = 1
}
Eric_CheerLand_Stream_03_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			eric_cheerland_02
			vol = 350
		}
		sound2 = {
			eric_cheerland_03
			vol = 350
		}
		sound3 = {
			eric_cheerland_04
			vol = 350
		}
		sound4 = {
			eric_cheerland_05
			vol = 350
		}
		sound5 = {
			eric_cheerland_01
			vol = 350
		}
	}
}
Eric_CheerLand_Stream_02_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 10
	instancemanagement = ignore
	instancelimit = 1
}
Eric_CheerLand_Stream_02_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
}
Eric_CheerLand_Stream_04_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 10
	instancemanagement = ignore
	instancelimit = 1
}
Eric_CheerLand_Stream_04_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
}
Eric_Impatient_Stream_struct = {
	default_priority = 80
	default_buss = ProCallouts_WET
	norepeatfor = 10
	instancemanagement = ignore
	instancelimit = 1
}
Eric_Impatient_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			eric_impatient_02
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			eric_impatient_03
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			eric_impatient_01
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Eric_KeepItUp_Stream_struct = {
	default_priority = 80
	default_buss = ProCallouts_WET
	norepeatfor = 10
	instancemanagement = ignore
	instancelimit = 1
}
Eric_KeepItUp_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			eric_keepitup_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			eric_keepitup_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			eric_keepitup_03
			dropoff = 50
			dropoff_function = linear
		}
	}
}
sk9_Ring_Fire_Loop_struct = {
	default_priority = 75
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 4
}
sk9_Ring_Fire_Loop_container = {
	command = playsound
	randomness = none
}
m_c_uber_inst_chpt1_01_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c_uber_inst_chpt1_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c_uber_inst_chpt1_01
			vol = 350
		}
	}
}
m_c_uber_inst_chpt1_02_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c_uber_inst_chpt1_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c_uber_inst_chpt1_02
			vol = 350
		}
	}
}
m_c_uber_inst_chpt1_03_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c_uber_inst_chpt1_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c_uber_inst_chpt1_03
			vol = 350
		}
	}
}
m_c_uber_inst_chpt1_04_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c_uber_inst_chpt1_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c_uber_inst_chpt1_04
			vol = 350
		}
	}
}
m_c_uber_inst_chpt1_05_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c_uber_inst_chpt1_05_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c_uber_inst_chpt1_05
			vol = 350
		}
	}
}
m_c_uber_inst_chpt2_01_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c_uber_inst_chpt2_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c_uber_inst_chpt2_01
			vol = 350
		}
	}
}
m_c_uber_inst_chpt2_02_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c_uber_inst_chpt2_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c_uber_inst_chpt2_02
			vol = 350
		}
	}
}
m_c_uber_inst_chpt2_03_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c_uber_inst_chpt2_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c_uber_inst_chpt2_03
			vol = 350
		}
	}
}
m_c_uber_inst_chpt2_04_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c_uber_inst_chpt2_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c_uber_inst_chpt2_04
			vol = 350
		}
	}
}
m_c_uber_inst_chpt2_05_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c_uber_inst_chpt2_05_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c_uber_inst_chpt2_05
			vol = 350
		}
	}
}
m_c_uber_inst_chpt3_01_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c_uber_inst_chpt3_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c_uber_inst_chpt3_01
			vol = 350
		}
	}
}
m_c_uber_inst_chpt3_02_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c_uber_inst_chpt3_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c_uber_inst_chpt3_02
			vol = 350
		}
	}
}
m_c_uber_inst_chpt3_03_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c_uber_inst_chpt3_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c_uber_inst_chpt3_03
			vol = 350
		}
	}
}
m_c_uber_inst_chpt3_04_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c_uber_inst_chpt3_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c_uber_inst_chpt3_04
			vol = 350
		}
	}
}
m_c_uber_inst_chpt3_05_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c_uber_inst_chpt3_05_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c_uber_inst_chpt3_05
			vol = 350
		}
	}
}
m_c_uber_inst_chpt3_06_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c_uber_inst_chpt3_06_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c_uber_inst_chpt3_06
			vol = 350
		}
	}
}
m_c_uber_inst_chpt4_01_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c_uber_inst_chpt4_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c_uber_inst_chpt4_01
			vol = 350
		}
	}
}
m_c_uber_inst_chpt4_02_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c_uber_inst_chpt4_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c_uber_inst_chpt4_02
			vol = 350
		}
	}
}
m_c_uber_inst_chpt4_03_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c_uber_inst_chpt4_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c_uber_inst_chpt4_03
			vol = 350
		}
	}
}
m_c_uber_inst_chpt4_04_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c_uber_inst_chpt4_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c_uber_inst_chpt4_04
			vol = 350
		}
	}
}
m_c_uber_inst_chpt4_05_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c_uber_inst_chpt4_05_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c_uber_inst_chpt4_05
			vol = 350
		}
	}
}
m_c_uber_inst_chpt5_01_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c_uber_inst_chpt5_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c_uber_inst_chpt5_01
			vol = 350
		}
	}
}
m_c_uber_inst_chpt5_02_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c_uber_inst_chpt5_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c_uber_inst_chpt5_02
			vol = 350
		}
	}
}
m_c_uber_inst_chpt5_03_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c_uber_inst_chpt5_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c_uber_inst_chpt5_03
			vol = 350
		}
	}
}
m_c_uber_inst_chpt5_04_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c_uber_inst_chpt5_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c_uber_inst_chpt5_04
			vol = 350
		}
	}
}
m_c_uber_inst_chpt5_05_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c_uber_inst_chpt5_05_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c_uber_inst_chpt5_05
			vol = 350
		}
	}
}
m_c_uber_inst_chpt5_06_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c_uber_inst_chpt5_06_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c_uber_inst_chpt5_06
			vol = 350
		}
	}
}
m_c_uber_inst_chpt5_07_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c_uber_inst_chpt5_07_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c_uber_inst_chpt5_07
			vol = 350
		}
	}
}
m_c_uber_inst_chpt5_08_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c_uber_inst_chpt5_08_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c_uber_inst_chpt5_08
			vol = 350
		}
	}
}
m_c_uber_inst_chpt5_09_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c_uber_inst_chpt5_09_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c_uber_inst_chpt5_09
			vol = 350
		}
	}
}
VO_m_c_uber_inc_chpt1_01_struct = {
	default_priority = 80
	default_buss = GoalVO_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c_uber_inc_chpt1_01_container = {
	command = playsound
	randomness = none
}
VO_m_c_uber_inc_chpt1_02_struct = {
	default_priority = 80
	default_buss = GoalVO_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c_uber_inc_chpt1_02_container = {
	command = playsound
	randomness = none
}
VO_m_c_uber_inc_neg_chpt5_01_struct = {
	default_priority = 80
	default_buss = GoalVO_WET
	norepeatfor = 20
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c_uber_inc_neg_chpt5_01_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			m_c_uber_inc_neg_chpt5_01
			vol = 200
		}
		sound2 = {
			m_c_uber_inc_neg_chpt5_02
			vol = 200
		}
		sound3 = {
			m_c_uber_inc_neg_chpt5_03
			vol = 200
		}
		sound4 = {
			hawk_booland_01
			vol = 200
		}
	}
}
VO_m_c_uber_inc_pos_chpt5_01_struct = {
	default_priority = 80
	default_buss = GoalVO_WET
	norepeatfor = 15
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c_uber_inc_pos_chpt5_01_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
}
sk9_Pyro_Stream_struct = {
	default_priority = 100
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Pyro_Stream_container = {
	command = obj_playsound
	randomness = none
}
VO_m_cu_Announcer_01_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 30
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_cu_Announcer_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_announcer_dc_area_01
			vol = 400
		}
	}
}
VO_m_r_uber_inst_chpt1_01_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r_uber_inst_chpt1_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r_uber_inst_chpt1_01
			vol = 350
		}
	}
}
VO_m_r_uber_inst_chpt1_02_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r_uber_inst_chpt1_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r_uber_inst_chpt1_02
			vol = 350
		}
	}
}
VO_m_r_uber_inst_chpt1_03_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r_uber_inst_chpt1_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r_uber_inst_chpt1_03
			vol = 350
		}
	}
}
VO_m_r_uber_inst_chpt1_04_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r_uber_inst_chpt1_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r_uber_inst_chpt1_04
			vol = 350
		}
	}
}
VO_m_r_uber_inst_chpt1_05_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r_uber_inst_chpt1_05_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r_uber_inst_chpt1_05
			vol = 350
		}
	}
}
VO_m_r_uber_inst_chpt2_01_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r_uber_inst_chpt2_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r_uber_inst_chpt2_01
			vol = 350
		}
	}
}
VO_m_r_uber_inst_chpt2_02_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r_uber_inst_chpt2_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r_uber_inst_chpt2_02
			vol = 350
		}
	}
}
VO_m_r_uber_inst_chpt2_03_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r_uber_inst_chpt2_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r_uber_inst_chpt2_03
			vol = 350
		}
	}
}
VO_m_r_uber_inst_chpt3_01_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r_uber_inst_chpt3_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r_uber_inst_chpt3_01
			vol = 350
		}
	}
}
VO_m_r_uber_inst_chpt3_02_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r_uber_inst_chpt3_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r_uber_inst_chpt3_02
			vol = 350
		}
	}
}
VO_m_r_uber_inst_chpt3_03_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r_uber_inst_chpt3_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r_uber_inst_chpt3_03
			vol = 350
		}
	}
}
sk9_Explosion_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Explosion_container = {
	command = playsound
	randomness = none
}
sk9_SkateBoard_Flame_struct = {
	default_priority = 80
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_SkateBoard_Flame_container = {
	command = playsound
	randomness = none
}
sk9_Engine_Explosion_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 2
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Engine_Explosion_container = {
	command = playsound
	randomness = none
}
sk9_SkateBoard_Flame_02_struct = {
	default_priority = 80
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_SkateBoard_Flame_02_container = {
	command = playsound
	randomness = none
}
sk9_m_ru_CARRIG_struct = {
	default_priority = 80
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_m_ru_CARRIG_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_m_ru_CARRIG
			vol = 300
		}
	}
}
sk9_m_ru_PROPANERIG_struct = {
	default_priority = 80
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_m_ru_PROPANERIG_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_m_ru_PROPANERIG
			vol = 400
		}
	}
}
sk9_m_ru_PIPESRIG_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_m_ru_PIPESRIG_container = {
	command = playsound
	randomness = none
}
VO_PedM_2PedsTalk_Sit_struct = {
	default_priority = 20
	default_buss = AmbScenes
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_PedM_2PedsTalk_Sit_container = {
	command = agent_playvo
	randomness = randomnorepeattype
}
VO_CellPhoneTalk_struct = {
	default_priority = 50
	default_buss = AmbScenes
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_CellPhoneTalk_container = {
	command = agent_playvo
	randomness = randomnorepeattype
}
VO_CellPhoneTalk02_struct = {
	default_priority = 50
	default_buss = AmbScenes
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_CellPhoneTalk02_container = {
	command = agent_playvo
	randomness = randomnorepeattype
}
VO_CSI_withhorrorlook01_struct = {
	default_priority = 20
	default_buss = AmbScenes
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_CSI_withhorrorlook01_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
}
VO_PedM_2PedsTalk_struct = {
	default_priority = 50
	default_buss = AmbScenes
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_PedM_2PedsTalk_container = {
	command = agent_playvo
	randomness = randomnorepeattype
}
VO_PedM_2PedsTalk_Sit01_struct = {
	default_priority = 50
	default_buss = AmbScenes
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_PedM_2PedsTalk_Sit01_container = {
	command = agent_playvo
	randomness = randomnorepeattype
}
VO_PedM_GuyInPlane_struct = {
	default_priority = 50
	default_buss = AmbScenes
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_PedM_GuyInPlane_container = {
	command = agent_playvo
	randomness = randomnorepeattype
}
VO_PedM_RidingCanon01a_struct = {
	default_priority = 50
	default_buss = AmbScenes
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_PedM_RidingCanon01a_container = {
	command = agent_playvo
	randomness = randomnorepeattype
}
VO_PedM_TourGuide01_struct = {
	default_priority = 50
	default_buss = AmbScenes
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_PedM_TourGuide01_container = {
	command = agent_playvo
	randomness = none
}
VO_PedM_TourGuide02_struct = {
	default_priority = 50
	default_buss = AmbScenes
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_PedM_TourGuide02_container = {
	command = agent_playvo
	randomness = none
}
VO_PedM_TourGuide03_struct = {
	default_priority = 50
	default_buss = AmbScenes
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_PedM_TourGuide03_container = {
	command = agent_playvo
	randomness = none
}
VO_PedM_Tourists01_TalkA_struct = {
	default_priority = 50
	default_buss = AmbScenes
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_PedM_Tourists01_TalkA_container = {
	command = agent_playvo
	randomness = randomnorepeattype
}
VO_PedMsk8r_talk01_struct = {
	default_priority = 50
	default_buss = AmbScenes
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_PedMsk8r_talk01_container = {
	command = agent_playvo
	randomness = randomnorepeattype
}
VO_PedMSk8r_talk02_struct = {
	default_priority = 80
	default_buss = AmbScenes
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_PedMSk8r_talk02_container = {
	command = agent_playvo
	randomness = randomnorepeattype
}
VO_pedmworker_talk_struct = {
	default_priority = 80
	default_buss = AmbScenes
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_pedmworker_talk_container = {
	command = agent_playvo
	randomness = randomnorepeattype
}
Shayne_Attention_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Shayne_Attention_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			shayne_attn_08
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			shayne_attn_01
			dropoff = 20
			dropoff_function = linear
		}
		sound3 = {
			shayne_attn_02
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			shayne_attn_03
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			shayne_attn_04
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			shayne_attn_05
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			shayne_attn_06
			dropoff = 50
			dropoff_function = linear
		}
		sound8 = {
			shayne_attn_07
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Shayne_Avoid_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Shayne_Avoid_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			shayne_avoid_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			shayne_avoid_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			shayne_avoid_03
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Shayne_BooLand_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Shayne_BooLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			shayne_booland_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			shayne_booland_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			shayne_booland_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			shayne_booland_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			shayne_booland_05
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			shayne_booland_06
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Shayne_CheerLand_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Shayne_CheerLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			shayne_cheerland_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			shayne_cheerland_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			shayne_cheerland_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			shayne_cheerland_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			shayne_cheerland_05
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			shayne_cheerland_06
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			shayne_cheerland_07
			dropoff = 50
			dropoff_function = linear
		}
		sound8 = {
			shayne_cheerland_08
			dropoff = 50
			dropoff_function = linear
		}
		sound9 = {
			shayne_cheerland_09
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Shayne_Impatient_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Shayne_Impatient_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			shayne_impatient_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			shayne_impatient_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			shayne_impatient_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			shayne_impatient_04
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Shayne_KeepItUp_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Shayne_KeepItUp_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			shayne_keepitup_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			shayne_keepitup_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			shayne_keepitup_03
			dropoff = 50
			dropoff_function = linear
		}
	}
}
WoodBreak_Slums_Large_struct = {
	default_priority = 65
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 4
}
WoodBreak_Slums_Large_container = {
	command = obj_playsound
	randomness = randomnorepeattype
}
m_training_revman_inst_01b_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_revman_inst_01b_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_revman_inst_01b
			vol = 350
		}
	}
}
m_training_revman_inst_07b_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_revman_inst_07b_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_revman_inst_07b
			vol = 350
		}
	}
}
m_training_revman_inst_08b_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_revman_inst_08b_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_revman_inst_08b
			vol = 350
		}
	}
}
m_training_revman_inst_09b_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_revman_inst_09b_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_revman_inst_09b
			vol = 350
		}
	}
}
m_training_revman_inst_10b_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_revman_inst_10b_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_revman_inst_10b
			vol = 350
		}
	}
}
m_training_revman_inst_11b_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_revman_inst_11b_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_revman_inst_11b
			vol = 350
		}
	}
}
m_training_revman_inst_12b_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_revman_inst_12b_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_revman_inst_12b
			vol = 350
		}
	}
}
m_training_revman_inst_13b_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_revman_inst_13b_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_revman_inst_13b
			vol = 350
		}
	}
}
m_training_revman_inst_14b_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_training_revman_inst_14b_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_training_revman_inst_14b
			vol = 350
		}
	}
}
VP_menu_pad_SFX_struct = {
	default_priority = 75
	default_buss = frontend
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 3
}
VP_menu_pad_SFX_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_motorola_scroll_sfx
		}
	}
}
VP_menu_pad_Select_SFX_struct = {
	default_priority = 75
	default_buss = frontend
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
VP_menu_pad_Select_SFX_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_motorola_choose_sfx
		}
	}
}
sk9_House_Sliding_Door_Open_inside_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 2
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_House_Sliding_Door_Open_inside_container = {
	command = obj_playsound
	randomness = none
}
sk9_House_Sliding_Door_Close_inside_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 2
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_House_Sliding_Door_Close_inside_container = {
	command = obj_playsound
	randomness = none
}
m_h_uber_inc_incomplete_01_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h_uber_inc_incomplete_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h_uber_inc_incomplete_01
			vol = 350
		}
	}
}
m_h_uber_inc_bail_04_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h_uber_inc_bail_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h_uber_inc_bail_04
			vol = 350
		}
	}
}
m_h_uber_inc_bail_05_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h_uber_inc_bail_05_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h_uber_inc_bail_05
			vol = 350
		}
	}
}
m_h_uber_inc_cut_01_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h_uber_inc_cut_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h_uber_inc_cut_01
			vol = 350
		}
	}
}
m_h_uber_inc_cut_02_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h_uber_inc_cut_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h_uber_inc_cut_02
			vol = 350
		}
	}
}
m_h_uber_inc_fail_01_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h_uber_inc_fail_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h_uber_inc_fail_01
			vol = 350
		}
	}
}
m_h_uber_inc_faster_01_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h_uber_inc_faster_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h_uber_inc_faster_01
			vol = 350
		}
	}
}
m_h_uber_inc_faster_02_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h_uber_inc_faster_02_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			m_h_uber_inc_faster_02
			vol = 350
		}
		sound2 = {
			m_h_uber_inc_faster_03
			vol = 350
		}
	}
}
m_h_uber_inc_jumpjump_01_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h_uber_inc_jumpjump_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h_uber_inc_jumpjump_01
			vol = 350
		}
	}
}
m_h_uber_inc_jumpjump_02_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h_uber_inc_jumpjump_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h_uber_inc_jumpjump_02
			vol = 350
		}
	}
}
m_h_uber_inc_jumpjump_03_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h_uber_inc_jumpjump_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h_uber_inc_jumpjump_03
			vol = 350
		}
	}
}
m_h_uber_inc_jumpjump_05_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h_uber_inc_jumpjump_05_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h_uber_inc_jumpjump_05
			vol = 350
		}
	}
}
m_h_uber_inc_jumpjump_06_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h_uber_inc_jumpjump_06_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h_uber_inc_jumpjump_06
			vol = 350
		}
	}
}
m_h_uber_inc_jumpjump_07_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h_uber_inc_jumpjump_07_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h_uber_inc_jumpjump_07
			vol = 350
		}
	}
}
m_h_uber_inc_jumpjump_08_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h_uber_inc_jumpjump_08_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h_uber_inc_jumpjump_08
			vol = 350
		}
	}
}
m_h_uber_inc_jumpjump_09_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h_uber_inc_jumpjump_09_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h_uber_inc_jumpjump_09
			vol = 350
		}
	}
}
m_h_uber_inc_outofbounds_01_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h_uber_inc_outofbounds_01_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			m_h_uber_inc_outofbounds_01
			vol = 350
		}
		sound2 = {
			m_h_uber_inc_outofbounds_02
			vol = 350
		}
	}
}
m_h_uber_inc_pos_01_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h_uber_inc_pos_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h_uber_inc_pos_01
			vol = 350
		}
	}
}
m_h_uber_inc_pos_03_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h_uber_inc_pos_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h_uber_inc_pos_03
			vol = 350
		}
	}
}
m_h_uber_inc_pos_04_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h_uber_inc_pos_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h_uber_inc_pos_04
			vol = 350
		}
	}
}
m_h_uber_inc_pos_05_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h_uber_inc_pos_05_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h_uber_inc_pos_05
			vol = 350
		}
	}
}
m_h_uber_inc_pos_06_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h_uber_inc_pos_06_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h_uber_inc_pos_06
			vol = 350
		}
	}
}
m_h_uber_inc_pos_07_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h_uber_inc_pos_07_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h_uber_inc_pos_07
			vol = 350
		}
	}
}
m_h_uber_inc_pos_08_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h_uber_inc_pos_08_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h_uber_inc_pos_08
			vol = 350
		}
	}
}
m_h_uber_inc_pos_09_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h_uber_inc_pos_09_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h_uber_inc_pos_09
			vol = 350
		}
	}
}
m_h_uber_inc_pos_10_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h_uber_inc_pos_10_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h_uber_inc_pos_10
			vol = 350
		}
	}
}
m_h_uber_inc_pos_11_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h_uber_inc_pos_11_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h_uber_inc_pos_11
			vol = 350
		}
	}
}
m_h_uber_inc_pos_12_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h_uber_inc_pos_12_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h_uber_inc_pos_12
			vol = 350
		}
	}
}
m_h_uber_inst_chpt1_01_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h_uber_inst_chpt1_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h_uber_inst_chpt1_01
			vol = 350
		}
	}
}
m_h_uber_inst_chpt1_02_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h_uber_inst_chpt1_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h_uber_inst_chpt1_02
			vol = 350
		}
	}
}
m_h_uber_inst_chpt1_03_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h_uber_inst_chpt1_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h_uber_inst_chpt1_03
			vol = 350
		}
	}
}
m_h_uber_inst_chpt2_02_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h_uber_inst_chpt2_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h_uber_inst_chpt2_02
			vol = 350
		}
	}
}
m_h_uber_inst_chpt2_03_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h_uber_inst_chpt2_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h_uber_inst_chpt2_03
			vol = 350
		}
	}
}
m_h_uber_inst_chpt2_04_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h_uber_inst_chpt2_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h_uber_inst_chpt2_04
			vol = 350
		}
	}
}
m_h_uber_inst_chpt2_05_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h_uber_inst_chpt2_05_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h_uber_inst_chpt2_05
			vol = 350
		}
	}
}
m_h_uber_inst_chpt2_06_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h_uber_inst_chpt2_06_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h_uber_inst_chpt2_06
			vol = 350
		}
	}
}
m_h_uber_inst_chpt3_00_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h_uber_inst_chpt3_00_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h_uber_inst_chpt3_00
			vol = 350
		}
	}
}
m_h_uber_inst_chpt3_01_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h_uber_inst_chpt3_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h_uber_inst_chpt3_01
			vol = 350
		}
	}
}
m_h_uber_inst_chpt3_02_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h_uber_inst_chpt3_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h_uber_inst_chpt3_02
			vol = 350
		}
	}
}
m_h_uber_inst_chpt3_03_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h_uber_inst_chpt3_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h_uber_inst_chpt3_03
			vol = 350
		}
	}
}
m_h_uber_inst_chpt3_05_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h_uber_inst_chpt3_05_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h_uber_inst_chpt3_05
			vol = 350
		}
	}
}
m_h_uber_inst_chpt3_06_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h_uber_inst_chpt3_06_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h_uber_inst_chpt3_06
			vol = 350
		}
	}
}
m_impress_r3_inst_01_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_impress_r3_inst_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_impress_r3_inst_01
			vol = 350
		}
	}
}
m_impress_r3_inst_02_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_impress_r3_inst_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_impress_r3_inst_02
			vol = 350
		}
	}
}
m_impress_r3_inst_04_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_impress_r3_inst_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_impress_r3_inst_04
			vol = 350
		}
	}
}
VO_caraccident_struct = {
	default_priority = 80
	default_buss = AmbScenes
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_caraccident_container = {
	command = agent_playvo
	randomness = randomnorepeattype
}
VO_gangarrest_struct = {
	default_priority = 80
	default_buss = AmbScenes
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_gangarrest_container = {
	command = agent_playvo
	randomness = randomnorepeattype
}
VO_stealingdeck_struct = {
	default_priority = 80
	default_buss = AmbScenes
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_stealingdeck_container = {
	command = agent_playvo
	randomness = randomnorepeattype
}
VO_touchnose_struct = {
	default_priority = 80
	default_buss = AmbScenes
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_touchnose_container = {
	command = agent_playvo
	randomness = randomnorepeattype
}
VP_menu_pad_back_SFX_struct = {
	default_priority = 75
	default_buss = frontend
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
VP_menu_pad_back_SFX_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			sk9_motorola_back_sfx
		}
	}
}
SecurityGuard1_Attack_Stream_struct = {
	default_priority = 40
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
SecurityGuard1_Attack_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			guard1_attack_02
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			guard1_attack_03
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			guard1_attack_04
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			guard1_attack_05
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			guard1_attack_01
			dropoff = 40
			dropoff_function = linear
		}
	}
}
SecurityGuard1_Avoid_Stream_struct = {
	default_priority = 40
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
SecurityGuard1_Avoid_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			guard1_avoid_07
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			guard1_avoid_08
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			guard1_avoid_09
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			guard1_avoid_10
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			guard1_avoid_11
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			guard1_avoid_12
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			guard1_avoid_01
			dropoff = 50
			dropoff_function = linear
		}
		sound8 = {
			guard1_avoid_02
			dropoff = 50
			dropoff_function = linear
		}
		sound9 = {
			guard1_avoid_03
			dropoff = 50
			dropoff_function = linear
		}
		sound10 = {
			guard1_avoid_04
			dropoff = 50
			dropoff_function = linear
		}
		sound11 = {
			guard1_avoid_05
			dropoff = 50
			dropoff_function = linear
		}
		sound12 = {
			guard1_avoid_06
			dropoff = 50
			dropoff_function = linear
		}
	}
}
SecurityGuard1_BooLand_Stream_struct = {
	default_priority = 40
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
SecurityGuard1_BooLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			guard1_booland_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			guard1_booland_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			guard1_booland_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			guard1_booland_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			guard1_booland_05
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			guard1_booland_06
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			guard1_booland_07
			dropoff = 50
			dropoff_function = linear
		}
		sound8 = {
			guard1_booland_08
			dropoff = 50
			dropoff_function = linear
		}
	}
}
SecurityGuard1_Chase_Stream_struct = {
	default_priority = 40
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
SecurityGuard1_Chase_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			guard1_chase_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			guard1_chase_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			guard1_chase_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			guard1_chase_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			guard1_chase_05
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			guard1_chase_06
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			guard1_chase_07
			dropoff = 50
			dropoff_function = linear
		}
		sound8 = {
			guard1_chase_08
			dropoff = 50
			dropoff_function = linear
		}
	}
}
SecurityGuard1_CheerLand_Stream_struct = {
	default_priority = 40
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
SecurityGuard1_CheerLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			guard1_cheerland_03
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			guard1_cheerland_04
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			guard1_cheerland_05
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			guard1_cheerland_06
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			guard1_cheerland_01
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			guard1_cheerland_02
			dropoff = 50
			dropoff_function = linear
		}
	}
}
SecurityGuard1_Taunt_Stream_struct = {
	default_priority = 40
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
SecurityGuard1_Taunt_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			guard1_taunt_03
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			guard1_taunt_04
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			guard1_taunt_05
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			guard1_taunt_06
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			guard1_taunt_01
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			guard1_taunt_02
			dropoff = 50
			dropoff_function = linear
		}
	}
}
SecurityGuard1_Warning_Stream_struct = {
	default_priority = 40
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
SecurityGuard1_Warning_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			guard1_warning_05
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			guard1_warning_06
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			guard1_warning_07
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			guard1_warning_08
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			guard1_warning_09
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			guard1_warning_01
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			guard1_warning_02
			dropoff = 50
			dropoff_function = linear
		}
		sound8 = {
			guard1_warning_03
			dropoff = 50
			dropoff_function = linear
		}
		sound9 = {
			guard1_warning_04
			dropoff = 50
			dropoff_function = linear
		}
	}
}
SkaterMale1_BooLand_Stream_struct = {
	default_priority = 50
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
SkaterMale1_BooLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			skatermale1_booland_07
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			skatermale1_booland_08
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			skatermale1_booland_09
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			skatermale1_booland_10
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			skatermale1_booland_01
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			skatermale1_booland_02
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			skatermale1_booland_03
			dropoff = 50
			dropoff_function = linear
		}
		sound8 = {
			skatermale1_booland_04
			dropoff = 50
			dropoff_function = linear
		}
		sound9 = {
			skatermale1_booland_05
			dropoff = 50
			dropoff_function = linear
		}
		sound10 = {
			skatermale1_booland_06
			dropoff = 50
			dropoff_function = linear
		}
	}
}
SkaterMale1_CheerLand_Stream_struct = {
	default_priority = 50
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
SkaterMale1_CheerLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			skatermale1_cheerland_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			skatermale1_cheerland_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			skatermale1_cheerland_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			skatermale1_cheerland_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			skatermale1_cheerland_05
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			skatermale1_cheerland_06
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			skatermale1_cheerland_07
			dropoff = 50
			dropoff_function = linear
		}
		sound8 = {
			skatermale1_cheerland_08
			dropoff = 50
			dropoff_function = linear
		}
		sound9 = {
			skatermale1_cheerland_09
			dropoff = 50
			dropoff_function = linear
		}
		sound10 = {
			skatermale1_cheerland_10
			dropoff = 50
			dropoff_function = linear
		}
	}
}
SkaterMale2_Avoid_Stream_struct = {
	default_priority = 50
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
SkaterMale2_Avoid_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			skatermale2_avoid_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			skatermale2_avoid_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			skatermale2_avoid_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			skatermale2_avoid_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			skatermale2_avoid_05
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			skatermale2_avoid_06
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			skatermale2_avoid_07
			dropoff = 50
			dropoff_function = linear
		}
		sound8 = {
			skatermale2_avoid_08
			dropoff = 50
			dropoff_function = linear
		}
		sound9 = {
			skatermale2_avoid_09
			dropoff = 50
			dropoff_function = linear
		}
		sound10 = {
			skatermale2_avoid_10
			dropoff = 50
			dropoff_function = linear
		}
	}
}
SkaterMale2_BooLand_Stream_struct = {
	default_priority = 50
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
SkaterMale2_BooLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			skatermale2_boolead_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			skatermale2_boolead_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			skatermale2_boolead_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			skatermale2_boolead_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			skatermale2_boolead_05
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			skatermale2_boolead_06
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			skatermale2_boolead_07
			dropoff = 50
			dropoff_function = linear
		}
		sound8 = {
			skatermale2_boolead_08
			dropoff = 50
			dropoff_function = linear
		}
		sound9 = {
			skatermale2_boolead_09
			dropoff = 50
			dropoff_function = linear
		}
		sound10 = {
			skatermale2_boolead_10
			dropoff = 50
			dropoff_function = linear
		}
		sound11 = {
			skatermale2_boolead_11
			dropoff = 50
			dropoff_function = linear
		}
	}
}
SkaterMale2_CheerLand_Stream_struct = {
	default_priority = 50
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
SkaterMale2_CheerLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			skatermale2_cheerlead_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			skatermale2_cheerlead_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			skatermale2_cheerlead_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			skatermale2_cheerlead_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			skatermale2_cheerlead_05
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			skatermale2_cheerlead_06
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			skatermale2_cheerlead_07
			dropoff = 50
			dropoff_function = linear
		}
		sound8 = {
			skatermale2_cheerlead_08
			dropoff = 50
			dropoff_function = linear
		}
		sound9 = {
			skatermale2_cheerlead_09
			dropoff = 50
			dropoff_function = linear
		}
		sound10 = {
			skatermale2_cheerlead_10
			dropoff = 50
			dropoff_function = linear
		}
		sound11 = {
			skatermale2_cheerlead_11
			dropoff = 50
			dropoff_function = linear
		}
	}
}
SkaterMale2_KeepItUp_Stream_struct = {
	default_priority = 50
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
SkaterMale2_KeepItUp_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			skatermale2_keepitup_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			skatermale2_keepitup_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			skatermale2_keepitup_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			skatermale2_keepitup_04
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Thug1_Attack_Stream_struct = {
	default_priority = 50
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Thug1_Attack_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			thug1_attack_01
			dropoff = 55
			dropoff_function = linear
		}
		sound2 = {
			thug1_attack_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			thug1_attack_03
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Thug1_Avoid_Stream_struct = {
	default_priority = 50
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Thug1_Avoid_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			thug1_avoid_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			thug1_avoid_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			thug1_avoid_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			thug1_avoid_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			thug1_avoid_05
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Thug1_BooLand_Stream_struct = {
	default_priority = 50
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Thug1_BooLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			thug1_booland_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			thug1_booland_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			thug1_booland_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			thug1_booland_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			thug1_booland_05
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			thug1_booland_06
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			thug1_booland_07
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Thug1_Chase_Stream_struct = {
	default_priority = 50
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Thug1_Chase_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			thug1_chase_06
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			thug1_chase_07
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			thug1_chase_01
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			thug1_chase_02
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			thug1_chase_03
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			thug1_chase_04
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			thug1_chase_05
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Thug1_CheerLand_Stream_struct = {
	default_priority = 50
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Thug1_CheerLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			thug1_cheerland_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			thug1_cheerland_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			thug1_cheerland_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			thug1_cheerland_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			thug1_cheerland_05
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			thug1_cheerland_06
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			thug1_cheerland_07
			dropoff = 50
			dropoff_function = linear
		}
		sound8 = {
			thug1_cheerland_08
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Thug1_KeepItUp_Stream_struct = {
	default_priority = 50
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Thug1_KeepItUp_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			thug1_keepitup_03
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			thug1_keepitup_01
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			thug1_keepitup_02
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Thug1_Taunt_Stream_struct = {
	default_priority = 50
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Thug1_Taunt_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			thug1_taunt_02
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			thug1_taunt_03
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			thug1_taunt_01
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Thug1_Warning_Stream_struct = {
	default_priority = 50
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Thug1_Warning_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			thug1_warning_03
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			thug1_warning_04
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			thug1_warning_05
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			thug1_warning_01
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			thug1_warning_02
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Thug2_Angry_Stream_struct = {
	default_priority = 50
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Thug2_Angry_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			thug2_angry_03
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			thug2_angry_04
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			thug2_angry_05
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			thug2_angry_01
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			thug2_angry_02
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Thug2_Attack_Stream_struct = {
	default_priority = 50
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Thug2_Attack_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			thug2_attack_05
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			thug2_attack_01
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			thug2_attack_02
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			thug2_attack_03
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			thug2_attack_04
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Thug2_Avoid_Stream_struct = {
	default_priority = 50
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Thug2_Avoid_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			thug2_avoid_04
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			thug2_avoid_01
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			thug2_avoid_02
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			thug2_avoid_03
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Thug2_Taunt_Stream_struct = {
	default_priority = 50
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Thug2_Taunt_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			thug2_taunt_03
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			thug2_taunt_04
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			thug2_taunt_01
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			thug2_taunt_02
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Thug2_Warning_Stream_struct = {
	default_priority = 50
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Thug2_Warning_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			thug2_warning_02
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			thug2_warning_03
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			thug2_warning_01
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Worker1_Avoid_Stream_struct = {
	default_priority = 50
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Worker1_Avoid_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			worker1_avoid_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			worker1_avoid_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			worker1_avoid_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			worker1_avoid_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			worker1_avoid_05
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			worker1_avoid_06
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Worker1_BooLand_Stream_struct = {
	default_priority = 50
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Worker1_BooLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			worker1_booland_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			worker1_booland_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			worker1_booland_03
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			worker1_booland_04
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			worker1_booland_05
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			worker1_booland_06
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			worker1_booland_07
			dropoff = 50
			dropoff_function = linear
		}
		sound8 = {
			worker1_booland_08
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Worker1_CheerLand_Stream_struct = {
	default_priority = 50
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Worker1_CheerLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			worker1_cheerland_07
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			worker1_cheerland_08
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			worker1_cheerland_09
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			worker1_cheerland_01
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			worker1_cheerland_02
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			worker1_cheerland_03
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			worker1_cheerland_04
			dropoff = 50
			dropoff_function = linear
		}
		sound8 = {
			worker1_cheerland_05
			dropoff = 50
			dropoff_function = linear
		}
		sound9 = {
			worker1_cheerland_06
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Worker1_KeepItUp_Stream_struct = {
	default_priority = 50
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Worker1_KeepItUp_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			worker1_keepitup_01
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			worker1_keepitup_02
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			worker1_keepitup_03
			dropoff = 50
			dropoff_function = linear
		}
	}
}
GroupieGirl_Avoid_Stream_struct = {
	default_priority = 50
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
GroupieGirl_Avoid_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			groupiegirl_avoid_03
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			groupiegirl_avoid_04
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			groupiegirl_avoid_05
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			groupiegirl_avoid_01
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			groupiegirl_avoid_02
			dropoff = 50
			dropoff_function = linear
		}
	}
}
GroupieGirl_BooLand_Stream_struct = {
	default_priority = 50
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
GroupieGirl_BooLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			groupiegirl_booland_08
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			groupiegirl_booland_09
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			groupiegirl_booland_10
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			groupiegirl_booland_01
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			groupiegirl_booland_02
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			groupiegirl_booland_03
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			groupiegirl_booland_04
			dropoff = 50
			dropoff_function = linear
		}
		sound8 = {
			groupiegirl_booland_05
			dropoff = 50
			dropoff_function = linear
		}
		sound9 = {
			groupiegirl_booland_06
			dropoff = 50
			dropoff_function = linear
		}
		sound10 = {
			groupiegirl_booland_07
			dropoff = 50
			dropoff_function = linear
		}
	}
}
GroupieGirl_CheerLand_Stream_struct = {
	default_priority = 50
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
GroupieGirl_CheerLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			groupiegirl_cheerland_08
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			groupiegirl_cheerland_09
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			groupiegirl_cheerland_10
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			groupiegirl_cheerland_01
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			groupiegirl_cheerland_02
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			groupiegirl_cheerland_03
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			groupiegirl_cheerland_04
			dropoff = 50
			dropoff_function = linear
		}
		sound8 = {
			groupiegirl_cheerland_05
			dropoff = 50
			dropoff_function = linear
		}
		sound9 = {
			groupiegirl_cheerland_06
			dropoff = 50
			dropoff_function = linear
		}
		sound10 = {
			groupiegirl_cheerland_07
			dropoff = 50
			dropoff_function = linear
		}
	}
}
GroupieGirl_KeepItUp_Stream_struct = {
	default_priority = 50
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
GroupieGirl_KeepItUp_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			groupiegirl_keepitup_05
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			groupiegirl_keepitup_01
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			groupiegirl_keepitup_02
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			groupiegirl_keepitup_03
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			groupiegirl_keepitup_04
			dropoff = 50
			dropoff_function = linear
		}
	}
}
SkaterFemale1_Avoid_Stream_struct = {
	default_priority = 50
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
SkaterFemale1_Avoid_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			skaterfemale_avoid_03
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			skaterfemale_avoid_04
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			skaterfemale_avoid_05
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			skaterfemale_avoid_06
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			skaterfemale_avoid_07
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			skaterfemale_avoid_08
			dropoff = 50
			dropoff_function = linear
		}
		sound7 = {
			skaterfemale_avoid_09
			dropoff = 50
			dropoff_function = linear
		}
		sound8 = {
			skaterfemale_avoid_10
			dropoff = 50
			dropoff_function = linear
		}
		sound9 = {
			skaterfemale_avoid_01
			dropoff = 51
			dropoff_function = linear
		}
		sound10 = {
			skaterfemale_avoid_02
			dropoff = 50
			dropoff_function = linear
		}
	}
}
SkaterFemale1_BooLand_Stream_struct = {
	default_priority = 50
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
SkaterFemale1_BooLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			skaterfemale_booland_05
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			skaterfemale_booland_01
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			skaterfemale_booland_02
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			skaterfemale_booland_03
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			skaterfemale_booland_04
			dropoff = 50
			dropoff_function = linear
		}
	}
}
SkaterFemale1_CheerLand_Stream_struct = {
	default_priority = 50
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
SkaterFemale1_CheerLand_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			skaterfemale_cheerland_06
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			skaterfemale_cheerland_07
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			skaterfemale_cheerland_01
			dropoff = 50
			dropoff_function = linear
		}
		sound4 = {
			skaterfemale_cheerland_03
			dropoff = 50
			dropoff_function = linear
		}
		sound5 = {
			skaterfemale_cheerland_04
			dropoff = 50
			dropoff_function = linear
		}
		sound6 = {
			skaterfemale_cheerland_05
			dropoff = 50
			dropoff_function = linear
		}
	}
}
SkaterFemale1_KeepItUp_Stream_struct = {
	default_priority = 50
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
SkaterFemale1_KeepItUp_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			skaterfemale_keepitup_02
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			skaterfemale_keepitup_03
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			skaterfemale_keepitup_01
			dropoff = 50
			dropoff_function = linear
		}
	}
}
m_buildqp_pickup_sand_struct = {
	default_priority = 80
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_buildqp_pickup_sand_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_Buildqp_Pickup_Sand
			vol = 400
		}
	}
}
VO_m_r1_buildqp_inst_01_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r1_buildqp_inst_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_buildqp_inst_01
			vol = 350
		}
	}
}
VO_m_r1_buildqp_inst_02_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r1_buildqp_inst_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_buildqp_inst_02
			vol = 350
		}
	}
}
VO_m_r1_buildqp_inst_03_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r1_buildqp_inst_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_buildqp_inst_03
			vol = 350
		}
	}
}
VO_m_r1_buildqp_inst_04_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r1_buildqp_inst_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_buildqp_inst_04
			vol = 350
		}
	}
}
VO_m_r1_buildqp_inst_05_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r1_buildqp_inst_05_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_buildqp_inst_05
			vol = 350
		}
	}
}
VO_m_r1_buildqp_inst_06_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r1_buildqp_inst_06_container = {
	command = playsound
	randomness = none
}
VO_m_r1_buildqp_inst_07_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r1_buildqp_inst_07_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_buildqp_inst_07
			vol = 350
		}
	}
}
VO_m_r1_buildqp_inst_08_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r1_buildqp_inst_08_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_buildqp_inst_08
			vol = 350
		}
	}
}
VO_m_r1_buildqp_inst_09_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r1_buildqp_inst_09_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_buildqp_inst_09
			vol = 350
		}
	}
}
VO_m_r1_buildqp_inst_10_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r1_buildqp_inst_10_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_buildqp_inst_10
			vol = 350
		}
	}
}
VO_m_r1_buildqp_inst_11_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r1_buildqp_inst_11_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_buildqp_inst_11
			vol = 350
		}
	}
}
VO_m_r1_buildqp_inst_12_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r1_buildqp_inst_12_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_buildqp_inst_12
			vol = 350
		}
	}
}
m_buildqp_pickup_nail_struct = {
	default_priority = 80
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_buildqp_pickup_nail_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_buildqp_pickup_Nail
			vol = 400
			pitch = 130
		}
	}
}
Concrete_Hammer_struct = {
	default_priority = 80
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Concrete_Hammer_container = {
	command = obj_playsound
	randomness = randomnorepeattype
}
Thug1_KnockDown_Sound_struct = {
	default_priority = 50
	default_buss = PedCallouts_WET
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Thug1_KnockDown_Sound_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			Thug_knockdown_4
			dropoff = 30
			dropoff_function = linear
		}
		sound2 = {
			Thug_knockdown_5
			dropoff = 30
			dropoff_function = linear
		}
		sound3 = {
			Thug_knockdown_6
			dropoff = 30
			dropoff_function = linear
		}
		sound4 = {
			Thug_knockdown_7
			dropoff = 30
			dropoff_function = linear
		}
		sound5 = {
			Thug_knockdown_8
			dropoff = 30
			dropoff_function = linear
		}
		sound6 = {
			Thug_knockdown_9
			dropoff = 30
			dropoff_function = linear
		}
		sound7 = {
			Thug_knockdown_1
			dropoff = 30
			dropoff_function = linear
		}
		sound8 = {
			Thug_knockdown_2
			dropoff = 30
			dropoff_function = linear
		}
		sound9 = {
			Thug_knockdown_3
			dropoff = 30
			dropoff_function = linear
		}
	}
}
sk9_Crib_Door_struct = {
	default_priority = 70
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Crib_Door_container = {
	command = obj_playsound
	randomness = none
}
Text_NO_VO_SFX_struct = {
	default_priority = 90
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Text_NO_VO_SFX_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			Temp_Text_No_VO_SFX
			vol = 200
		}
	}
}
sk9_Double_SFX_struct = {
	default_priority = 80
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Double_SFX_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			Double_Sound
			vol = 300
		}
	}
}
sk9_Text_SFX_01_struct = {
	default_priority = 80
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_Text_SFX_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			text
			vol = 200
		}
	}
}
VO_m_r3_love_inst_06_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r3_love_inst_06_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_love_inst_06
			vol = 350
		}
	}
}
VO_m_impress_r1_inst_03b_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_impress_r1_inst_03b_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_impress_r1_inst_03_b
			vol = 350
		}
	}
}
VO_m_impress_r1_inst_03c_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_impress_r1_inst_03c_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_impress_r1_inst_03_c
			vol = 350
		}
	}
}
VO_m_impress_h1_inst_04_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_impress_h1_inst_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_impress_h1_inst_04
			vol = 350
		}
	}
}
VO_goatbum_struct = {
	default_priority = 50
	default_buss = AmbScenes
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_goatbum_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
}
c_tutorial_igc_3_hawk_06_a_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
c_tutorial_igc_3_hawk_06_a_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_post_tutorial_call_a
			vol = 350
		}
	}
}
c_tutorial_igc_3_hawk_06_b_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
c_tutorial_igc_3_hawk_06_b_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_post_tutorial_call_b
			vol = 350
		}
	}
}
c_tutorial_igc_3_hawk_06_c_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
c_tutorial_igc_3_hawk_06_c_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_post_tutorial_call_c
			vol = 350
		}
	}
}
c_tutorial_igc_3_hawk_06_d_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
c_tutorial_igc_3_hawk_06_d_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_post_tutorial_call_d
			vol = 350
		}
	}
}
c_tutorial_igc_3_hawk_06_e_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
c_tutorial_igc_3_hawk_06_e_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_post_tutorial_call_e
			vol = 350
		}
	}
}
c_tutorial_igc_3_hawk_06_f_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
c_tutorial_igc_3_hawk_06_f_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_post_tutorial_call_f
			vol = 350
		}
	}
}
m_r2_skateoff_inst_18_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_skateoff_inst_18_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r2_skateoff_inst_18
			vol = 350
		}
	}
}
m_r2_skateoff_inst_19_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r2_skateoff_inst_19_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r2_skateoff_inst_19
			vol = 350
		}
	}
}
VO_m_team_film_inc_01_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_team_film_inc_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_team_film_inc_01
			vol = 350
		}
		sound2 = {
			m_team_film_inc_03
			vol = 350
		}
		sound3 = {
			hawk_cheerland_01
			vol = 350
		}
		sound4 = {
			hawk_cheerland_10
			vol = 350
		}
		sound5 = {
			hawk_cheerland_03
			vol = 350
		}
		sound6 = {
			hawk_cheerland_04
			vol = 350
		}
		sound7 = {
			hawk_cheerland_05
			vol = 350
		}
		sound8 = {
			hawk_cheerland_06
			vol = 350
		}
		sound9 = {
			hawk_cheerland_07
			vol = 350
		}
		sound10 = {
			hawk_cheerland_09
			vol = 350
		}
	}
}
VO_m_team_film_inc_02_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 20
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_team_film_inc_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_team_film_inc_02
			vol = 350
		}
		sound2 = {
			hawk_booland_04
			vol = 350
		}
		sound3 = {
			hawk_booland_05
			vol = 350
		}
	}
}
VO_m_team_film_inst_01_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_team_film_inst_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_team_film_inst_01
			vol = 350
		}
	}
}
VO_m_team_film_inst_02_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_team_film_inst_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_team_film_inst_02
			vol = 350
		}
	}
}
VO_m_team_film_inst_03_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_team_film_inst_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_team_film_inst_03
			vol = 350
		}
	}
}
VO_m_team_film_inst_04_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_team_film_inst_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_team_film_inst_04
			vol = 350
		}
	}
}
VO_m_team_film_inst_05_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_team_film_inst_05_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_team_film_inst_05
			vol = 350
		}
	}
}
VO_m_team_film_inst_06_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_team_film_inst_06_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_team_film_inst_06
			vol = 350
		}
	}
}
VO_m_team_film_inst_07_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_team_film_inst_07_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_team_film_inst_07
			vol = 350
		}
	}
}
VO_m_team_film_inst_08_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_team_film_inst_08_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_team_film_inst_08
			vol = 350
		}
	}
}
VO_m_team_film_inst_09_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_team_film_inst_09_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_team_film_inst_09
			vol = 350
		}
	}
}
VO_m_team_film_inst_10_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_team_film_inst_10_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_team_film_inst_10
			vol = 350
		}
	}
}
VO_m_team_film_inst_11_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_team_film_inst_11_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_team_film_inst_11
			vol = 350
		}
	}
}
VO_m_team_film_inst_12_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_team_film_inst_12_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_team_film_inst_12
			vol = 350
		}
	}
}
VO_m_team_film_outro_struct = {
	default_priority = 95
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_team_film_outro_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_team_film_outro
			vol = 350
		}
	}
}
m_r1_buildqp_outro_king_01_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
m_r1_buildqp_outro_king_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_buildqp_outro_king_01
			vol = 350
		}
	}
}
m_c1_film1_tr_03_gp_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
m_c1_film1_tr_03_gp_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_film1_tr_03_gp
			vol = 350
		}
	}
}
m_c1_film2_tr_02_gp_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
m_c1_film2_tr_02_gp_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_film2_tr_02_gp
			vol = 350
		}
	}
}
m_c1_practice_1_tr_01_alt_gp_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
m_c1_practice_1_tr_01_alt_gp_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c1_practice_1_tr_01_alt_gp
			vol = 350
		}
	}
}
m_h1_bigpush_inst_03b_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
m_h1_bigpush_inst_03b_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h1_bigpush_inst_03b
			vol = 350
		}
	}
}
m_h3_ntb_tr_06_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
m_h3_ntb_tr_06_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_ntb_tr_06
			vol = 350
		}
	}
}
m_h3_ntb_tr_06_alt_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
m_h3_ntb_tr_06_alt_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_ntb_tr_06_alt
			vol = 350
		}
	}
}
m_r1_demo_tr_02_skater_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
m_r1_demo_tr_02_skater_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_demo_tr_02_skater
			vol = 350
		}
	}
}
m_r1_demo_tr_06_skater_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
m_r1_demo_tr_06_skater_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_demo_tr_06_skater
			vol = 350
		}
	}
}
m_r2_climb_tr_01_skater_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
m_r2_climb_tr_01_skater_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r2_climb_tr_01_skater
			vol = 360
		}
	}
}
m_r2_climb_tr_02_gp_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
m_r2_climb_tr_02_gp_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r2_climb_tr_02_gp
			vol = 360
		}
	}
}
m_r2_climb_tr_03_skater_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
m_r2_climb_tr_03_skater_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r2_climb_tr_03_skater
			vol = 360
		}
	}
}
m_r2_climb_tr_04_gp_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
m_r2_climb_tr_04_gp_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r2_climb_tr_04_gp
			vol = 360
		}
	}
}
m_r2_climb_tr_05_skater_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
m_r2_climb_tr_05_skater_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r2_climb_tr_05_skater
			vol = 360
		}
	}
}
m_r2_skateoff_tr_01_skater_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
m_r2_skateoff_tr_01_skater_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r2_skateoff_tr_01_skater
			vol = 350
		}
	}
}
m_r2_skateoff_tr_02_shayne_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
m_r2_skateoff_tr_02_shayne_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r2_skateoff_tr_02_shayne
			vol = 350
		}
	}
}
m_r2_skateoff_tr_03_shayne_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
m_r2_skateoff_tr_03_shayne_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r2_skateoff_tr_03_shayne
			vol = 350
		}
	}
}
m_c2_compvert_tr_gp_01_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
m_c2_compvert_tr_gp_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c2_compvert_tr_gp_01
			vol = 350
		}
	}
}
m_c3_photosession_outro_02_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
m_c3_photosession_outro_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c3_photosession_outro_02
			vol = 350
		}
	}
}
m_c3_photosession_outro_03_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
m_c3_photosession_outro_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c3_photosession_outro_03
			vol = 350
		}
	}
}
m_impress_c1_inc_pos_01_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
m_impress_c1_inc_pos_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_impress_c1_inc_pos_01
			vol = 350
		}
	}
}
m_h3_wallrides_tr_05_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
m_h3_wallrides_tr_05_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h3_wallrides_tr_05
			vol = 350
		}
	}
}
m_impress_h3_outro_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
m_impress_h3_outro_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_impress_h3_outro
			vol = 350
		}
	}
}
burnquist_film_stream_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
burnquist_film_stream_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			burnquist_film_01
		}
	}
}
dollin_film_stream_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
dollin_film_stream_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			dollin_film_01
		}
	}
}
king_film_stream_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
king_film_stream_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			king_film_01
		}
	}
}
m_impress_r3_outro_01_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
m_impress_r3_outro_01_container = {
	command = playsound
	randomness = none
}
margera_film_stream_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
margera_film_stream_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			margera_film_01
		}
	}
}
mountain_film_stream_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
mountain_film_stream_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			mountain_film_01
		}
	}
}
mullen_film_stream_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
mullen_film_stream_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			mullen_film_01
		}
	}
}
saari_film_stream_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
saari_film_stream_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			saari_film_01
		}
	}
}
vallely_film_stream_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
vallely_film_stream_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			vallely_film_01
		}
	}
}
williams_film_stream_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}
williams_film_stream_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			williams_film_01
		}
	}
}
VO_m_r2_breakin_inc_warn_01_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_breakin_inc_warn_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r2_breakin_inc_warn_01
			vol = 350
		}
	}
}
VO_m_r2_breakin_inc_warn_02_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_breakin_inc_warn_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r2_breakin_inc_warn_02
			vol = 350
		}
	}
}
VO_m_r2_breakin_inc_warn_03_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_breakin_inc_warn_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r2_breakin_inc_warn_03
			vol = 350
		}
	}
}
VO_m_r2_breakin_inc_warn_04_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_breakin_inc_warn_04_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r2_breakin_inc_warn_04
			vol = 350
		}
	}
}
VO_m_r2_breakin_inc_warn_05_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_breakin_inc_warn_05_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r2_breakin_inc_warn_05
			vol = 350
		}
	}
}
VO_m_r2_breakin_inc_warn_06_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_breakin_inc_warn_06_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r2_breakin_inc_warn_06
			vol = 350
		}
	}
}
VO_m_r2_breakin_inc_warn_07_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_breakin_inc_warn_07_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r2_breakin_inc_warn_07
			vol = 350
		}
	}
}
VO_m_r2_breakin_inc_warn_08_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_breakin_inc_warn_08_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r2_breakin_inc_warn_08
			vol = 350
		}
	}
}
VO_m_r2_breakin_inc_warn_09_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_breakin_inc_warn_09_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r2_breakin_inc_warn_09
			vol = 350
		}
	}
}
VO_m_r2_breakin_inc_warn_10_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_breakin_inc_warn_10_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r2_breakin_inc_warn_10
			vol = 350
		}
	}
}
VO_m_r2_breakin_inc_warn_11_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_breakin_inc_warn_11_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r2_breakin_inc_warn_11
			vol = 350
		}
	}
}
VO_m_r2_breakin_inc_warn_12_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_breakin_inc_warn_12_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r2_breakin_inc_warn_12
			vol = 350
		}
	}
}
VO_m_r2_breakin_inc_warn_13_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_r2_breakin_inc_warn_13_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r2_breakin_inc_warn_13
			vol = 350
		}
	}
}
VO_m_h_uber_inc_action_struct = {
	default_priority = 80
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_h_uber_inc_action_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			m_h_uber_inc_action_01
			vol = 350
		}
		sound2 = {
			m_h_uber_inc_action_02
			vol = 350
		}
		sound3 = {
			m_h_uber_inc_action_03
			vol = 350
		}
		sound4 = {
			m_h_uber_inc_action_04
			vol = 350
		}
		sound5 = {
			m_h_uber_inc_action_05
			vol = 350
		}
		sound6 = {
			m_h_uber_inc_action_06
			vol = 350
		}
		sound7 = {
			m_h_uber_inc_action_07
			vol = 350
		}
		sound8 = {
			m_h_uber_inc_action_08
			vol = 350
		}
	}
}
Chevron_Break_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 4
}
Chevron_Break_container = {
	command = playsound
	randomness = randomnorepeattype
}
c_tutorial_igc_3_hawk_06_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
c_tutorial_igc_3_hawk_06_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			c_tutorial_igc_3_hawk_06
			vol = 350
		}
	}
}
ms_phone_am1_c_01_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
ms_phone_am1_c_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_am1_c_01
			vol = 350
		}
	}
}
ms_phone_am1_h_01_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
ms_phone_am1_h_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_am1_h_01
			vol = 350
		}
	}
}
ms_phone_am1_m_01_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
ms_phone_am1_m_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_am1_m_01
			vol = 350
		}
	}
}
ms_phone_am1_r_01_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
ms_phone_am1_r_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_am1_r_01
			vol = 350
		}
	}
}
ms_phone_am2_c_01_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
ms_phone_am2_c_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_am2_c_01
			vol = 350
		}
	}
}
ms_phone_am2_h_01_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
ms_phone_am2_h_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_am2_h_01
			vol = 350
		}
	}
}
ms_phone_am2_m_01_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
ms_phone_am2_m_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_am2_m_01
			vol = 350
		}
	}
}
ms_phone_am2_r_01_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
ms_phone_am2_r_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_am2_r_01
			vol = 350
		}
	}
}
ms_phone_bob_intro_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
ms_phone_bob_intro_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_bob_intro
			vol = 350
		}
	}
}
ms_phone_c_cover_01_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
ms_phone_c_cover_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_c_cover_01
			vol = 350
		}
	}
}
ms_phone_c_demo_01_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
ms_phone_c_demo_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_c_demo_01
			vol = 350
		}
	}
}
ms_phone_c_lansd_01_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
ms_phone_c_lansd_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_c_lansd_01
			vol = 350
		}
	}
}
ms_phone_c_mag_01_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
ms_phone_c_mag_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_c_mag_01
			vol = 350
		}
	}
}
ms_phone_c_tricity_01_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
ms_phone_c_tricity_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_c_tricity_01
			vol = 350
		}
	}
}
ms_phone_c_video_01_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
ms_phone_c_video_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_c_video_01
			vol = 350
		}
	}
}
ms_phone_cu_01_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
ms_phone_cu_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_cu_01
			vol = 350
		}
	}
}
ms_phone_deck_01_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
ms_phone_deck_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_deck_01
			vol = 350
		}
	}
}
ms_phone_end_career_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
ms_phone_end_career_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_end_career
			vol = 350
		}
	}
}
ms_phone_h_bowl_01_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
ms_phone_h_bowl_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_h_bowl_01
			vol = 350
		}
	}
}
ms_phone_h_fdr_01_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
ms_phone_h_fdr_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_h_fdr_01
			vol = 350
		}
	}
}
ms_phone_h_quik_01_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
ms_phone_h_quik_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_h_quik_01
			vol = 350
		}
	}
}
ms_phone_h_thugs_01_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
ms_phone_h_thugs_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_h_thugs_01
			vol = 350
		}
	}
}
ms_phone_h_vidzine_01_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
ms_phone_h_vidzine_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_h_vidzine_01
			vol = 350
		}
	}
}
ms_phone_h_zine_01_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
ms_phone_h_zine_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_h_zine_01
			vol = 350
		}
	}
}
ms_phone_hu_01_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
ms_phone_hu_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_hu_01
			vol = 350
		}
	}
}
ms_phone_pro1_c_01_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
ms_phone_pro1_c_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_pro1_c_01
			vol = 350
		}
	}
}
ms_phone_pro1_h_01_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
ms_phone_pro1_h_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_pro1_h_01
			vol = 350
		}
	}
}
ms_phone_pro1_m_01_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
ms_phone_pro1_m_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_pro1_m_01
			vol = 350
		}
	}
}
ms_phone_pro1_r_01_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
ms_phone_pro1_r_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_pro1_r_01
			vol = 350
		}
	}
}
ms_phone_pro2_c_01_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
ms_phone_pro2_c_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_pro2_c_01
			vol = 350
		}
	}
}
ms_phone_pro2_h_01_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
ms_phone_pro2_h_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_pro2_h_01
			vol = 350
		}
	}
}
ms_phone_pro2_m_01_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
ms_phone_pro2_m_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_pro2_m_01
			vol = 350
		}
	}
}
ms_phone_pro2_r_01_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
ms_phone_pro2_r_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_pro2_r_01
			vol = 350
		}
	}
}
ms_phone_r_cash_01_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
ms_phone_r_cash_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_r_cash_01
			vol = 350
		}
	}
}
ms_phone_r_demo_01_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
ms_phone_r_demo_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_r_demo_01
			vol = 350
		}
	}
}
ms_phone_r_rigall_01_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
ms_phone_r_rigall_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_r_rigall_01
			vol = 350
		}
	}
}
ms_phone_r_righalf_01_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
ms_phone_r_righalf_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_r_righalf_01
			vol = 350
		}
	}
}
ms_phone_r_show_01_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
ms_phone_r_show_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_r_show_01
			vol = 350
		}
	}
}
ms_phone_r_show_01_alt_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
ms_phone_r_show_01_alt_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_r_show_01_alt
			vol = 350
		}
	}
}
ms_phone_r_showdn_01_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
ms_phone_r_showdn_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_r_showdn_01
			vol = 350
		}
	}
}
ms_phone_r_showdn_01_alt_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
ms_phone_r_showdn_01_alt_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_r_showdn_01_alt
			vol = 350
		}
	}
}
ms_Phone_ru_01_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
ms_Phone_ru_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_ru_01
			vol = 350
		}
	}
}
ms_phone_shoe_01_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
ms_phone_shoe_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_shoe_01
			vol = 350
		}
	}
}
ms_phone_start_team_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
ms_phone_start_team_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_start_team
			vol = 350
		}
	}
}
ms_phone_team_cash_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
ms_phone_team_cash_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_team_cash
			vol = 350
		}
	}
}
ms_phone_team_half_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
ms_phone_team_half_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_team_half
			vol = 350
		}
	}
}
ms_phone_team_pros_struct = {
	default_priority = 100
	default_buss = MS_Phonecalls
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
ms_phone_team_pros_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			ms_phone_team_pros
			vol = 350
		}
	}
}
m_h1_skitchboost_inst_02_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h1_skitchboost_inst_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h1_skitchboot_inst_02
			vol = 350
		}
	}
}
m_h1_skitchboost_inst_03_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_h1_skitchboost_inst_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_h1_skitchboot_inst_03
			vol = 350
		}
	}
}
sk9_train_bell_toll_01_struct = {
	default_priority = 70
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
sk9_train_bell_toll_01_container = {
	command = obj_playsound
	randomness = none
}
m_c3_photosession_inst_05_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c3_photosession_inst_05_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c3_photosession_inst_05
			vol = 350
		}
	}
}
m_c3_photo2_inst_01_struct = {
	default_priority = 50
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c3_photo2_inst_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c3_photo2_inst_01
			vol = 350
		}
	}
}
m_c3_epicphoto3_inst_01_struct = {
	default_priority = 75
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c3_epicphoto3_inst_01_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_c3_epicphoto3_inst_01
			vol = 350
		}
	}
}
m_r3_bell_inst_03_struct = {
	default_priority = 75
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r3_bell_inst_03_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r3_bell_inst_03
			vol = 350
		}
	}
}
m_r1_showdown_inst_12_struct = {
	default_priority = 75
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_r1_showdown_inst_12_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			m_r1_showdown_inst_12
			vol = 350
		}
	}
}
Kanights_Avoid_Stream_struct = {
	default_priority = 70
	default_buss = ProCallouts_WET
	norepeatfor = 20
	instancemanagement = ignore
	instancelimit = 1
}
Kanights_Avoid_Stream_container = {
	command = agent_playvo
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			bryce_booland_02
			dropoff = 50
			dropoff_function = linear
		}
		sound2 = {
			bryce_booland_03
			dropoff = 50
			dropoff_function = linear
		}
		sound3 = {
			Bryce_Critique_BAD_neg_02
			dropoff = 50
			dropoff_function = linear
		}
	}
}
Teleport_Back_SFX_02_struct = {
	default_priority = 50
	default_buss = SkaterSpecialFX
	norepeatfor = 0.8
	instancemanagement = ignore
	instancelimit = 1
}
Teleport_Back_SFX_02_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			SK8_Teleport_Back
			vol = 400
		}
	}
}
SK8_Wind_Boost_SFX_comp_struct = {
	default_priority = 50
	default_buss = SkaterSpecialFX
	norepeatfor = 0.5
	instancemanagement = stop_oldest
	instancelimit = 2
}
SK8_Wind_Boost_SFX_comp_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			SK8_Skater_Boost_Sound
			vol = 200
			pitch = 90
		}
	}
}
Crowd_Ped_AI_CheerLand_BIG_demo_struct = {
	default_priority = 50
	default_buss = crowd
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 3
}
Crowd_Ped_AI_CheerLand_BIG_demo_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			Cheer_Big_04
			vol = 300
		}
		sound2 = {
			Cheer_Big_01
			vol = 300
		}
		sound3 = {
			Cheer_Big_05
			vol = 300
		}
	}
}
Crowd_Ped_AI_CheerLand_MEDIUM_demo_struct = {
	default_priority = 50
	default_buss = crowd
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 4
}
Crowd_Ped_AI_CheerLand_MEDIUM_demo_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			Cheer_Med_01
			vol = 300
		}
		sound2 = {
			Cheer_Med_02
			vol = 300
		}
		sound3 = {
			Cheer_Med_03
			vol = 300
		}
		sound4 = {
			Cheer_Med_04
			vol = 300
		}
		sound5 = {
			Cheer_Med_05
			vol = 300
		}
	}
}
Crowd_Ped_AI_Comp_CheerLand_BIG_02_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 3
}
Crowd_Ped_AI_Comp_CheerLand_BIG_02_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			Cheer_Big_01
			vol = 400
		}
		sound2 = {
			Cheer_Big_04
			vol = 400
		}
		sound3 = {
			Cheer_Big_05
			vol = 400
		}
	}
}
Crowd_Ped_AI_Comp_CheerLand_MEDIUM_02_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 4
}
Crowd_Ped_AI_Comp_CheerLand_MEDIUM_02_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			Cheer_Med_01
			vol = 400
		}
		sound2 = {
			Cheer_Med_02
			vol = 400
		}
		sound3 = {
			Cheer_Med_03
			vol = 400
		}
		sound4 = {
			Cheer_Med_04
			vol = 400
		}
		sound5 = {
			Cheer_Med_05
			vol = 400
		}
	}
}
puddle_splash_sfx_struct = {
	default_priority = 50
	default_buss = PuddleLands
	norepeatfor = 1.0
	instancemanagement = stop_oldest
	instancelimit = 1
}
puddle_splash_sfx_container = {
	command = obj_playsound
	randomness = randomnorepeattype
}
m_c1_impress_inst_skater_not_impressed_struct = {
	default_priority = 60
	default_buss = GoalVO_DRY
	norepeatfor = 15
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_impress_inst_skater_not_impressed_container = {
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = {
		sound1 = {
			skatermale2_boolead_01
			vol = 350
		}
		sound2 = {
			skatermale2_boolead_06
			vol = 350
		}
		sound3 = {
			skatermale2_boolead_04
			vol = 350
		}
		sound4 = {
			skatermale2_boolead_05
			vol = 350
		}
		sound5 = {
			skatermale2_boolead_07
			vol = 350
		}
		sound6 = {
			skatermale1_booland_01
			vol = 350
		}
		sound7 = {
			skatermale1_booland_04
			vol = 350
		}
		sound8 = {
			skatermale1_booland_05
			vol = 350
		}
		sound9 = {
			skatermale1_booland_07
			vol = 350
		}
		sound10 = {
			skatermale1_booland_08
			vol = 350
		}
		sound11 = {
			skatermale1_booland_09
			vol = 350
		}
	}
}
m_c1_impress_outro_struct = {
	default_priority = 60
	default_buss = GoalVO_DRY
	norepeatfor = 15
	instancemanagement = stop_oldest
	instancelimit = 1
}
m_c1_impress_outro_container = {
	command = playsound
	randomness = randomnorepeattype
	sounds = {
		sound1 = {
			m_c1_impress_outro_Sk8tr1_01
			vol = 350
		}
		sound2 = {
			m_c1_impress_outro_Sk8tr2_01
			vol = 350
		}
	}
}
Goal_UI_Negative_Text_Loud_demo_struct = {
	default_priority = 50
	default_buss = MissionSFX
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
Goal_UI_Negative_Text_Loud_demo_container = {
	command = playsound
	randomness = none
	sounds = {
		sound1 = {
			small_negative_message_01
			vol = 100
		}
	}
}
VO_m_c3_Photothemed_inst_p1_02b_struct = {
	default_priority = 90
	default_buss = GoalVO_DRY
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}
VO_m_c3_Photothemed_inst_p1_02b_container = {
	command = playsound
	randomness = none
}
sk9_Banner_Dirt_SFX_04_struct = {
	default_priority = 70
	default_buss = GoalFeedback
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
}
sk9_Banner_Dirt_SFX_04_container = {
	command = playsound
	randomness = none
}
WindLoop_SFX_Skater_cu_struct = {
	default_priority = 50
	default_buss = SkaterSpecialFX
	norepeatfor = 0
	instancelimit = 1
	instancemanagement = ignore
}
WindLoop_SFX_Skater_cu_container = {
	command = playsound
	sounds = {
		sound1 = {
			WindLoop3
			vol = 50
			num_loops = -1
		}
	}
}
