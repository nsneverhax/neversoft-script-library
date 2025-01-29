0xf7bea20b = None
0x27707361 = None
0x1d401155 = None

script 0x8882d576 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_ballpark
		return \{venuesize = 'Medium_EXT'}
		case z_bayou
		return \{venuesize = 'Small_INT'}
		case z_castle
		return \{venuesize = 'Medium_EXT'}
		case z_cathedral
		return \{venuesize = 'Medium_EXT'}
		case z_fairgrounds
		return \{venuesize = 'Medium_EXT'}
		case z_frathouse
		return \{venuesize = 'Small_INT'}
		case z_goth
		return \{venuesize = 'Medium_EXT'}
		case Z_Harbor
		return \{venuesize = 'Medium_EXT'}
		case z_hotel
		return \{venuesize = 'Small_INT'}
		case z_metalfest
		return \{venuesize = 'Large_EXT'}
		case z_military
		return \{venuesize = 'Medium_EXT'}
		case z_newyork
		return \{venuesize = 'Large_EXT'}
		case z_recordstore
		return \{venuesize = 'Small_INT'}
		case z_tool
		return \{venuesize = 'z_TOOL'}
		default
		return \{venuesize = 'Medium_EXT'}
	endswitch
endscript

script 0xf6523eff \{Sound = 'none'}
	training_get_language_prefix
	formatText TextName = 0xaa5c3627 '_%a' a = <language_prefix>
	ExtendCrc <Sound> <0xaa5c3627> out = sound_id
	LoadSound <sound_id>
endscript

script 0xd53de9cc 
	LoadSound \{heavyrockcrash_lvl_10_01}
	LoadSound \{heavyrockcrash_lvl_8_01}
	LoadSound \{heavyrockfltom_lvl_10_01}
	LoadSound \{heavyrockfltom_lvl_4_01}
	LoadSound \{heavyrockfltom_lvl_6_01}
	LoadSound \{heavyrockfltom_lvl_8_01}
	LoadSound \{heavyrockhhclosed_lvl_4_01}
	LoadSound \{heavyrockhhclosed_lvl_6_01}
	LoadSound \{heavyrockhhclosed_lvl_8_01}
	LoadSound \{heavyrockhhclosed_lvl_10_01}
	LoadSound \{heavyrockhhopen_lvl_10_01}
	LoadSound \{heavyrockhhopen_lvl_9_01}
	LoadSound \{heavyrockhhopen_lvl_6_01}
	LoadSound \{heavyrockhhopen_lvl_2_01}
	LoadSound \{heavyrockhitom_lvl_10_01}
	LoadSound \{heavyrockhitom_lvl_4_01}
	LoadSound \{heavyrockhitom_lvl_6_01}
	LoadSound \{heavyrockhitom_lvl_8_01}
	LoadSound \{heavyrockkick_lvl_10_01}
	LoadSound \{heavyrockride_lvl_10_01}
	LoadSound \{heavyrocksnare_lvl_10_01}
	LoadSound \{heavyrocksnare_lvl_12_03}
	LoadSound \{heavyrocksnare_lvl_2_01}
	LoadSound \{heavyrocksnare_lvl_4_01}
	LoadSound \{heavyrocksnare_lvl_6_01}
	LoadSound \{heavyrocksnare_lvl_8_01}
endscript

script 0xf7b44917 
	<structure> = $metallica_intro_vo_current_struct
	if StructureContains structure = <structure> rhythm_anim_name
		custom_anim_name = (<structure>.rhythm_anim_name)
	else
		return
	endif
	switch <custom_anim_name>
		default

	endswitch
endscript

script 0xf301e1c3 
	randomize
	Change 0xf7bea20b = Random (@ menu_intro_lick_01 @ menu_intro_lick_02 @ menu_intro_lick_03 )
	LoadSound ($0xf7bea20b)
endscript

script 0x3c9b1c07 
	LoadSound \{GH3_Beat_Sound}
	LoadSound \{UI_Sound_05}
	LoadSound \{UI_Sound_09}
	LoadSound \{menu_scroll_down}
	LoadSound \{menu_scroll_up}
	LoadSound \{menu_select_negative}
	LoadSound \{Checkbox_SFX}
	LoadSound \{CheckBox_Check_SFX}
endscript

script 0x8a84d309 
	LoadSound \{outro_one_star}
	LoadSound \{outro_two_stars}
	LoadSound \{outro_three_stars}
	LoadSound \{outro_four_stars}
	LoadSound \{outro_five_stars}
endscript

script 0x4dbda179 
	GetPakManCurrent \{map = zones}
	if (<pak> = z_studio || <pak> = z_studio2 || <pak> = z_tool || <pak> = z_credits || <pak> = z_soundcheck2)
		return
	endif
	0x8882d576
	switch <venuesize>
		case 'z_TOOL'

		return
		case 'Small_INT'

		LoadSound \{0x7b6ab35c}
		LoadSound \{0x52ff2c70}
		LoadSound \{0x29f7db07}
		LoadSound \{0x9f2b0ce3}
		LoadSound \{sm_crowd_neutral_to_good_03}
		LoadSound \{sm_crowd_good_to_neutral_03}
		LoadSound \{sm_crowd_neutral_to_bad_03}
		LoadSound \{sm_crowd_bad_to_neutral_01}
		0x8c8c96bf
		LoadSound \{int_sm_crowd_bad_loop}
		LoadSound \{int_sm_crowd_good_loop}
		LoadSound \{int_sm_crowd_neutral_loop}
		case 'Medium_EXT'

		LoadSound \{0x92adc9ae}
		LoadSound \{0xcc3f6614}
		LoadSound \{0xc030a1f5}
		LoadSound \{0xefe527ab}
		LoadSound \{md_crowd_neutral_to_good_01}
		LoadSound \{md_crowd_good_to_neutral_01}
		LoadSound \{md_crowd_neutral_to_bad_02}
		LoadSound \{md_crowd_bad_to_neutral_01}
		0x8c8c96bf
		LoadSound \{ext_md_crowd_bad_loop}
		LoadSound \{ext_md_crowd_good_loop}
		LoadSound \{ext_md_crowd_neutral_loop}
		case 'Large_EXT'

		LoadSound \{0xcd9525fb}
		LoadSound \{0x0a0edbfb}
		LoadSound \{0x9f084da0}
		LoadSound \{0x29d49a44}
		LoadSound \{lg_crowd_neutral_to_good_01}
		LoadSound \{lg_crowd_good_to_neutral_01}
		LoadSound \{lg_crowd_neutral_to_bad_01}
		LoadSound \{lg_crowd_bad_to_neutral_01}
		0x8c8c96bf
		LoadSound \{ext_lg_crowd_bad_loop}
		LoadSound \{ext_lg_crowd_good_loop}
		LoadSound \{ext_lg_crowd_neutral_loop}
		default

		LoadSound \{0x92adc9ae}
		LoadSound \{0xcc3f6614}
		LoadSound \{0xc030a1f5}
		LoadSound \{0xefe527ab}
		LoadSound \{md_crowd_neutral_to_good_01}
		LoadSound \{md_crowd_good_to_neutral_01}
		LoadSound \{md_crowd_neutral_to_bad_02}
		LoadSound \{md_crowd_bad_to_neutral_01}
		0x8c8c96bf
		LoadSound \{ext_md_crowd_bad_loop}
		LoadSound \{ext_md_crowd_good_loop}
		LoadSound \{ext_md_crowd_neutral_loop}
	endswitch
endscript

script 0xc1c4e84c \{mode = 0xae92eddf
		0xd607e2e6 = 0
		Force = 0
		tutorial = 0}
	if NOT (<0xd607e2e6> = 1)
		0xbea8f580
		GetGlobalTags \{user_options}
		guitar_volume = (<volumes>.guitar.guitar.vol)
		band_volume = (<volumes>.guitar.Band.vol)
		sfx_volume = (<volumes>.guitar.sfx.vol)
	endif
	if NOT (<Force> = 1)
		if ($0x27707361 = <mode>)
			return
		endif
	endif
	Change 0x27707361 = <mode>
	0xc48cfd3c
	Change \{0x1d401155 = 0x1d401155}
	if ($0x27707361 = None)
		return
	endif
	0x3c9b1c07
	switch <mode>
		case 0xae92eddf

		LoadSound \{bad_note1}
		LoadSound \{bad_note2}
		LoadSound \{bad_note3}
		LoadSound \{bad_note4}
		LoadSound \{bad_note6}
		LoadSound \{bad_note_bass2}
		LoadSound \{bad_note_bass4}
		LoadSound \{bad_note_bass6}
		LoadSound \{bad_note_tom1}
		LoadSound \{bad_note_hihat1}
		LoadSound \{bad_note_kick1}
		LoadSound \{star_available}
		LoadSound \{sp_available1}
		LoadSound \{sp_awarded1}
		LoadSound \{sp_deployed}
		LoadSound \{sp_cheer1}
		LoadSound \{sp_cheer2}
		LoadSound \{Notes_Ripple_Up_01}
		LoadSound \{You_Rock}
		LoadSound \{Crowd_Fail_Song}
		LoadSound \{Highway_Rise}
		LoadSound \{UI_Song_Intro_Kick}
		LoadSound \{songcomplete_out}
		LoadSound \{songcomplete_in}
		LoadSound \{Crowd_Group_Clap_01}
		LoadSound \{Crowd_Group_Clap_02}
		LoadSound \{Crowd_Group_Clap_03}
		LoadSound \{GH3_Sudden_Death}
		LoadSound \{StickClickLarge}
		LoadSound \{StickClickMed}
		LoadSound \{StickClickSmall}
		LoadSound \{HiHatClosed01}
		LoadSound \{UI_Lose_Multiplier}
		LoadSound \{UI_SFX_100_Note_Streak}
		LoadSound \{UI_SFX_50_Note_Streak}
		LoadSound \{guitar_smash_large_gh4_01}
		LoadSound \{guitar_smash_medium_gh4_01}
		LoadSound \{guitar_smash_small_gh4_01}
		LoadSound \{menu_into_pausemenu}
		LoadSound \{menu_outof_pausemenu}
		LoadSound \{soundoptions_menu_reset}
		LoadSound \{menu_options_sound_fader_move}
		LoadSound \{menu_options_sound_select}
		LoadSound \{menu_options_sound_back}
		0xd53de9cc
		0x4dbda179
		0x8a84d309
		LoadSound \{menu_entername_select}
		LoadSound \{menu_entername_scroll_1}
		LoadSound \{menu_entername_finish_01}
		LoadSound \{menu_entername_back}
		LoadSound \{menu_entername_caps}
		case 0x07071941

		LoadSound \{gig_complete_sponsor}
		LoadSound \{gigcomplete_unlock_item_text_appear}
		LoadSound \{gigcomplete_unlock_new_item}
		LoadSound \{gig_complete_magazine_in}
		LoadSound \{gig_complete_magazine_out}
		LoadSound \{menu_entername_select}
		LoadSound \{menu_entername_scroll_1}
		LoadSound \{menu_entername_finish_01}
		LoadSound \{menu_entername_back}
		LoadSound \{menu_entername_caps}
		LoadSound \{cash}
		LoadSound \{purchase_item}
		LoadSound \{songcomplete_out}
		LoadSound \{songcomplete_in}
		LoadSound \{pre_cutscence_sfx}
		case 0x68721771

		LoadSound \{bad_note1}
		LoadSound \{bad_note2}
		LoadSound \{bad_note3}
		LoadSound \{bad_note4}
		LoadSound \{bad_note6}
		LoadSound \{bad_note_bass2}
		LoadSound \{bad_note_bass4}
		LoadSound \{bad_note_bass6}
		LoadSound \{bad_note_tom1}
		LoadSound \{bad_note_hihat1}
		LoadSound \{bad_note_kick1}
		LoadSound \{star_available}
		LoadSound \{sp_available1}
		LoadSound \{sp_awarded1}
		LoadSound \{sp_deployed}
		LoadSound \{sp_cheer1}
		LoadSound \{sp_cheer2}
		LoadSound \{Notes_Ripple_Up_01}
		LoadSound \{Multiplayer_Win_Screen}
		LoadSound \{Crowd_Fail_Song}
		LoadSound \{Highway_Rise}
		LoadSound \{UI_Song_Intro_Kick}
		LoadSound \{Crowd_Group_Clap_01}
		LoadSound \{Crowd_Group_Clap_02}
		LoadSound \{Crowd_Group_Clap_03}
		LoadSound \{You_Rock}
		LoadSound \{GH3_Sudden_Death}
		LoadSound \{StickClickLarge}
		LoadSound \{StickClickMed}
		LoadSound \{StickClickSmall}
		LoadSound \{HiHatClosed01}
		LoadSound \{UI_Lose_Multiplier}
		LoadSound \{UI_SFX_100_Note_Streak}
		LoadSound \{UI_SFX_50_Note_Streak}
		LoadSound \{guitar_smash_large_gh4_01}
		LoadSound \{guitar_smash_medium_gh4_01}
		LoadSound \{guitar_smash_small_gh4_01}
		LoadSound \{menu_into_pausemenu}
		LoadSound \{menu_outof_pausemenu}
		LoadSound \{songcomplete_out}
		LoadSound \{songcomplete_in}
		LoadSound \{soundoptions_menu_reset}
		LoadSound \{menu_options_sound_fader_move}
		0xd53de9cc
		0x4dbda179
		case tutorials

		LoadSound \{Notes_Ripple_Up_01}
		LoadSound \{Highway_Rise}
		LoadSound \{UI_Song_Intro_Kick}
		LoadSound \{Finish_Chord}
		LoadSound \{star_available}
		LoadSound \{menu_into_pausemenu}
		LoadSound \{menu_outof_pausemenu}
		if (<tutorial> != jam)
			LoadSound \{bad_note1}
			LoadSound \{bad_note2}
			LoadSound \{bad_note3}
			LoadSound \{bad_note4}
			LoadSound \{bad_note6}
			LoadSound \{bad_note_bass2}
			LoadSound \{bad_note_bass4}
			LoadSound \{bad_note_bass6}
		endif
		if (<tutorial> = 1)
			0xf6523eff \{Sound = 0xf99f0cb6}
		endif
		if ((<tutorial> = 1) || (<tutorial> = 4))
			0xf6523eff \{Sound = 0xdd4e9f6b}
			0xf6523eff \{Sound = 0x9aeee5bb}
			0xf6523eff \{Sound = 0xa78ecc0b}
			0xf6523eff \{Sound = 0x15ae101b}
			0xf6523eff \{Sound = 0x28ce39ab}
			0xf6523eff \{Sound = 0x6f6e437b}
			0xf6523eff \{Sound = 0x520e6acb}
			0xf6523eff \{Sound = 0xd05efd1a}
			if (<tutorial> = 4)
				LoadSound \{Tutorial_String_1_Strum_Free}
				LoadSound \{Tutorial_String_3_Strum_Free}
				LoadSound \{Tutorial_String_1_HOPO_Free}
				LoadSound \{Tutorial_String_2_HOPO_Free}
				LoadSound \{Tutorial_String_3_HOPO_Free}
			endif
		elseif ((<tutorial> = 0xbf7e526d) || (<tutorial> = 6))
			if (<tutorial> = 0xbf7e526d)
				0xd53de9cc
			endif
			LoadSound \{bad_note_tom1}
			LoadSound \{bad_note_hihat1}
			LoadSound \{bad_note_kick1}
			0xf6523eff \{Sound = 0x89e2cd26}
			0xf6523eff \{Sound = 0xce42b7f6}
			0xf6523eff \{Sound = 0xf3229e46}
			0xf6523eff \{Sound = 0x41024256}
			0xf6523eff \{Sound = 0x7c626be6}
			0xf6523eff \{Sound = 0x3bc21136}
			0xf6523eff \{Sound = 0x06a23886}
			0xf6523eff \{Sound = 0x84f2af57}
		elseif (<tutorial> = battle)
			LoadSound \{GH3_Battle_DifficultyRampUp}
			LoadSound \{GH3_BattleMode_Attack_Over}
			LoadSound \{GH3_BattleMode_DoubleNoteAttack}
			LoadSound \{GH3_BattleMode_Lightning}
			LoadSound \{GH3_BattleMode_StringBreakAttack}
			LoadSound \{GH3_Battlemode_StringTune_2}
			LoadSound \{sp_awarded1}
			LoadSound \{sp_deployed}
		endif
		0x8c8c96bf
		case battle

		LoadSound \{bad_note1}
		LoadSound \{bad_note2}
		LoadSound \{bad_note3}
		LoadSound \{bad_note4}
		LoadSound \{bad_note6}
		LoadSound \{bad_note_bass2}
		LoadSound \{bad_note_bass4}
		LoadSound \{bad_note_bass6}
		LoadSound \{bad_note_tom1}
		LoadSound \{bad_note_hihat1}
		LoadSound \{bad_note_kick1}
		LoadSound \{Notes_Ripple_Up_01}
		LoadSound \{battle_mineattack_explode}
		LoadSound \{battle_mineattack_release}
		LoadSound \{GH3_Battle_DifficultyRampUp}
		LoadSound \{GH3_BattleMode_Attack_Over}
		LoadSound \{GH3_BattleMode_DoubleNoteAttack}
		LoadSound \{GH3_BattleMode_LeftyAttack}
		LoadSound \{GH3_BattleMode_Lightning}
		LoadSound \{GH3_BattleMode_StealPowerup}
		LoadSound \{GH3_BattleMode_StringBreakAttack}
		LoadSound \{GH3_BattleMode_WhammyAttack}
		LoadSound \{GH3_Sudden_Death}
		LoadSound \{ghm_ridethelightning_release}
		LoadSound \{ghm_hitthelights_release}
		LoadSound \{ghm_damageinc_attack}
		LoadSound \{ghm_trappedunderice_release}
		LoadSound \{ghm_ridethelightning_attack}
		LoadSound \{ghm_hitthelights_attack}
		LoadSound \{ghm_trappedunderice_attack}
		LoadSound \{Highway_Rise}
		LoadSound \{GH3_Battlemode_StringTune_2}
		LoadSound \{UI_Song_Intro_Kick}
		LoadSound \{UI_Lose_Multiplier}
		LoadSound \{UI_SFX_100_Note_Streak}
		LoadSound \{UI_SFX_50_Note_Streak}
		LoadSound \{Multiplayer_Win_Screen}
		LoadSound \{StickClickMed}
		LoadSound \{You_Rock}
		LoadSound \{sp_awarded1}
		LoadSound \{sp_deployed}
		LoadSound \{doordie}
		LoadSound \{menu_into_pausemenu}
		LoadSound \{menu_outof_pausemenu}
		LoadSound \{songcomplete_out}
		LoadSound \{songcomplete_in}
		LoadSound \{soundoptions_menu_reset}
		LoadSound \{menu_options_sound_fader_move}
		0x4dbda179
		case 0x64912155

		LoadSound \{cash}
		LoadSound \{Fly_In_Whoosh}
		LoadSound \{purchase_item}
		LoadSound \{menu_quickplay_removesong}
		LoadSound \{Menu_Warning_01}
		LoadSound \{menu_zoomin_career}
		LoadSound \{menu_zoomout_career}
		LoadSound \{menu_zoomin_options}
		LoadSound \{menu_zoomout_options}
		LoadSound \{menu_zoomin_headtohead}
		LoadSound \{menu_zoomout_headtohead}
		LoadSound \{menu_options_sound_select}
		LoadSound \{menu_options_sound_back}
		LoadSound \{menu_options_sound_fader_move}
		LoadSound \{menu_options_sound_dolbydigitaldisable}
		LoadSound \{menu_options_sound_dolbydigitalenable}
		LoadSound \{menu_entername_select}
		LoadSound \{menu_entername_scroll_1}
		LoadSound \{menu_entername_finish_01}
		LoadSound \{menu_entername_back}
		LoadSound \{menu_entername_caps}
		LoadSound \{menu_colorwheel_gradientselect}
		LoadSound \{menu_colorwheel_rotate}
		LoadSound \{menu_colorwheel_highlight_up_down_3}
		LoadSound \{menu_colorwheel_deselect_piepiece}
		LoadSound \{menu_colorwheel_selectpie}
		LoadSound \{menu_main_intro}
		LoadSound \{guitar_select_affirmation_1}
		LoadSound \{drum_select_affirmation_01}
		LoadSound \{bass_select_affirmation_02}
		LoadSound \{mic_select_affirmation_01}
		LoadSound \{band_leader_affirmation}
		LoadSound \{menu_cheat_red}
		LoadSound \{menu_cheat_yellow}
		LoadSound \{menu_cheat_blue}
		LoadSound \{menu_cheat_green}
		LoadSound \{gig_complete_sponsor}
		LoadSound \{gigcomplete_unlock_item_text_appear}
		LoadSound \{gigcomplete_unlock_new_item}
		LoadSound \{gig_complete_magazine_in}
		LoadSound \{gig_complete_magazine_out}
		LoadSound \{gig_unlock}
		LoadSound \{ui_gigboard_scroll}
		LoadSound \{0x4df25d31}
		LoadSound \{soundoptions_menu_reset}
		LoadSound \{heavyrocksnare_lvl_12_03}
		LoadSound \{menu_gigboard_camerapan_right}
		LoadSound \{menu_gigboard_camerapan_left}
		LoadSound \{menu_restore_defaults}
		LoadSound \{Crowd_Group_Clap_03}
		LoadSound \{bad_note2}
		LoadSound \{pre_cutscence_sfx}
		LoadSound \{checkbox_check_sfx_2}
		0xf301e1c3
		Change \{0x27707361 = FrontEnd}
		case FrontEnd

		LoadSound \{cash}
		LoadSound \{Fly_In_Whoosh}
		LoadSound \{purchase_item}
		LoadSound \{menu_quickplay_removesong}
		LoadSound \{Menu_Warning_01}
		LoadSound \{menu_zoomin_career}
		LoadSound \{menu_zoomout_career}
		LoadSound \{menu_zoomin_options}
		LoadSound \{menu_zoomout_options}
		LoadSound \{menu_zoomin_headtohead}
		LoadSound \{menu_zoomout_headtohead}
		LoadSound \{menu_options_sound_select}
		LoadSound \{menu_options_sound_back}
		LoadSound \{menu_options_sound_fader_move}
		LoadSound \{menu_options_sound_dolbydigitaldisable}
		LoadSound \{menu_options_sound_dolbydigitalenable}
		LoadSound \{menu_entername_select}
		LoadSound \{menu_entername_scroll_1}
		LoadSound \{menu_entername_finish_01}
		LoadSound \{menu_entername_back}
		LoadSound \{menu_entername_caps}
		LoadSound \{menu_colorwheel_gradientselect}
		LoadSound \{menu_colorwheel_rotate}
		LoadSound \{menu_colorwheel_highlight_up_down_3}
		LoadSound \{menu_colorwheel_deselect_piepiece}
		LoadSound \{menu_colorwheel_selectpie}
		LoadSound \{menu_main_intro}
		LoadSound \{guitar_select_affirmation_1}
		LoadSound \{drum_select_affirmation_01}
		LoadSound \{bass_select_affirmation_02}
		LoadSound \{mic_select_affirmation_01}
		LoadSound \{band_leader_affirmation}
		LoadSound \{menu_cheat_red}
		LoadSound \{menu_cheat_yellow}
		LoadSound \{menu_cheat_blue}
		LoadSound \{menu_cheat_green}
		LoadSound \{gig_complete_sponsor}
		LoadSound \{gigcomplete_unlock_item_text_appear}
		LoadSound \{gigcomplete_unlock_new_item}
		LoadSound \{gig_complete_magazine_in}
		LoadSound \{gig_complete_magazine_out}
		LoadSound \{gig_unlock}
		LoadSound \{ui_gigboard_scroll}
		LoadSound \{0x4df25d31}
		LoadSound \{soundoptions_menu_reset}
		LoadSound \{heavyrocksnare_lvl_12_03}
		LoadSound \{menu_gigboard_camerapan_right}
		LoadSound \{menu_gigboard_camerapan_left}
		LoadSound \{menu_restore_defaults}
		LoadSound \{Crowd_Group_Clap_03}
		LoadSound \{bad_note2}
		LoadSound \{pre_cutscence_sfx}
		LoadSound \{checkbox_check_sfx_2}
		if ($menu_music_on_flag = 1)
			0xdaee51ef
		endif
		default

	endswitch
endscript

script 0x4de05aff \{mode = None}
	if ($0x27707361 = jammode)
		0xc1c4e84c \{mode = tutorials
			tutorial = jam}
	elseif ($0x27707361 = battle)
		0xc1c4e84c \{mode = tutorials
			tutorial = battle
			0xd607e2e6 = 1}
	elseif ($0x27707361 != tutorials)
		0xc1c4e84c \{mode = tutorials
			tutorial = 0}
	endif
	if ($0x1d401155 = <mode>)
		return
	endif
	0x113e29bb
	switch <mode>
		case 0xe1bd391d
		0xf6523eff \{Sound = 0xc5e020e5}
		0xf6523eff \{Sound = 0x82405a35}
		0xf6523eff \{Sound = 0xbf207385}
		0xf6523eff \{Sound = 0xc8f04294}
		0xf6523eff \{Sound = 0xf5906b24}
		0xf6523eff \{Sound = 0x33dcdaf0}
		case 0xc5e57ba5
		0xf6523eff \{Sound = 0xb3d93626}
		0xf6523eff \{Sound = 0xf4794cf6}
		0xf6523eff \{Sound = 0xc9196546}
		0xf6523eff \{Sound = 0x7b39b956}
		0xf6523eff \{Sound = 0x465990e6}
		0xf6523eff \{Sound = 0x45e5cc33}
		LoadSound \{A_Tuning}
		LoadSound \{A_String}
		LoadSound \{B_Tuning}
		LoadSound \{B_String}
		LoadSound \{D_Tuning}
		LoadSound \{D_String}
		LoadSound \{G_Tuning}
		LoadSound \{G_String}
		LoadSound \{E_Tuning}
		LoadSound \{E_String}
		case tut_gtr_playnotes
		0xf6523eff \{Sound = 0x0fa3f6a3}
		0xf6523eff \{Sound = 0x48038c73}
		0xf6523eff \{Sound = 0x7563a5c3}
		0xf6523eff \{Sound = 0xc74379d3}
		0xf6523eff \{Sound = 0xfa235063}
		0xf6523eff \{Sound = 0xbe3f7666}
		case 0xc0729a33
		0xf6523eff \{Sound = 0xf058a25c}
		0xf6523eff \{Sound = 0xb7f8d88c}
		0xf6523eff \{Sound = 0x8a98f13c}
		0xf6523eff \{Sound = 0x38b82d2c}
		0xf6523eff \{Sound = 0x05d8049c}
		0xf6523eff \{Sound = 0x41c42299}
		0xf6523eff \{Sound = 0x3b0471f9}
		case tut_gtr_diffnotes
		0xf6523eff \{Sound = 0xf888e31e}
		0xf6523eff \{Sound = 0xbf2899ce}
		0xf6523eff \{Sound = 0x8248b07e}
		0xf6523eff \{Sound = 0x33d430bb}
		case tut_gtr_longnotes
		0xf6523eff \{Sound = 0x47ae6f10}
		0xf6523eff \{Sound = 0x000e15c0}
		0xf6523eff \{Sound = 0x3d6e3c70}
		0xf6523eff \{Sound = 0xf632efd5}
		0xf6523eff \{Sound = 0x8cf2bcb5}
		case tut_gtr_chords
		0xf6523eff \{Sound = 0xfdba97f4}
		0xf6523eff \{Sound = 0xba1aed24}
		0xf6523eff \{Sound = 0x877ac494}
		0xf6523eff \{Sound = 0x355a1884}
		0xf6523eff \{Sound = 0x71463e81}
		case 0x7d371efd
		0xf6523eff \{Sound = 0x9650513a}
		0xf6523eff \{Sound = 0xd1f02bea}
		0xf6523eff \{Sound = 0xec90025a}
		0xf6523eff \{Sound = 0x5eb0de4a}
		0xf6523eff \{Sound = 0x63d0f7fa}
		0xf6523eff \{Sound = 0x24708d2a}
		0xf6523eff \{Sound = 0x1910a49a}
		0xf6523eff \{Sound = 0x9b40334b}
		0xf6523eff \{Sound = 0xa6201afb}
		case 0x24066473
		0xf6523eff \{Sound = 0x88fd2b45}
		0xf6523eff \{Sound = 0xcf5d5195}
		0xf6523eff \{Sound = 0xf23d7825}
		0xf6523eff \{Sound = 0x401da435}
		0xf6523eff \{Sound = 0x7d7d8d85}
		0xf6523eff \{Sound = 0x3addf755}
		0xf6523eff \{Sound = 0x07bddee5}
		case 0x96b07169
		0xf6523eff \{Sound = 0x30b40048}
		0xf6523eff \{Sound = 0x77147a98}
		0xf6523eff \{Sound = 0x4a745328}
		0xf6523eff \{Sound = 0xf8548f38}
		0xf6523eff \{Sound = 0xc534a688}
		0xf6523eff \{Sound = 0x8294dc58}
		0xf6523eff \{Sound = 0xbff4f5e8}
		0xf6523eff \{Sound = 0x0e68752d}
		case 0xe0cd6a6e
		0xf6523eff \{Sound = 0xd31417a0}
		0xf6523eff \{Sound = 0x94b46d70}
		0xf6523eff \{Sound = 0xa9d444c0}
		0xf6523eff \{Sound = 0x1bf498d0}
		0xf6523eff \{Sound = 0xde0475d1}
		0xf6523eff \{Sound = 0xe3645c61}
		case 0xd86aec42
		0xf6523eff \{Sound = 0xe4782045}
		0xf6523eff \{Sound = 0xa3d85a95}
		0xf6523eff \{Sound = 0x9eb87325}
		0xf6523eff \{Sound = 0x2c98af35}
		0xf6523eff \{Sound = 0x11f88685}
		0xf6523eff \{Sound = 0x5658fc55}
		case 0xb90822e3
		0xf6523eff \{Sound = 0x4e2e3310}
		0xf6523eff \{Sound = 0x098e49c0}
		0xf6523eff \{Sound = 0x34ee6070}
		0xf6523eff \{Sound = 0x86cebc60}
		0xf6523eff \{Sound = 0xbbae95d0}
		0xf6523eff \{Sound = 0xfc0eef00}
		0xf6523eff \{Sound = 0xc16ec6b0}
		0xf6523eff \{Sound = 0x433e5161}
		0xf6523eff \{Sound = 0x70f24675}
		case 0xeb8a725d
		0xf6523eff \{Sound = 0x98c82bc1}
		0xf6523eff \{Sound = 0xdf685111}
		0xf6523eff \{Sound = 0x6ef4d1d4}
		case 0x1656087d
		0xf6523eff \{Sound = 0xc5c560d8}
		0xf6523eff \{Sound = 0x82651a08}
		0xf6523eff \{Sound = 0xbf0533b8}
		0xf6523eff \{Sound = 0x0d25efa8}
		0xf6523eff \{Sound = 0x3045c618}
		0xf6523eff \{Sound = 0x77e5bcc8}
		0xf6523eff \{Sound = 0x4a859578}
		0xf6523eff \{Sound = 0xc8d502a9}
		0xf6523eff \{Sound = 0xfb1915bd}
		case 0x59d709ec
		0xf6523eff \{Sound = 0x08d71fbc}
		0xf6523eff \{Sound = 0x38a7547d}
		case 0x5612d804
		0xf6523eff \{Sound = 0x986c4fbb}
		0xf6523eff \{Sound = 0xdfcc356b}
		0xf6523eff \{Sound = 0xe2ac1cdb}
		0xf6523eff \{Sound = 0x508cc0cb}
		0xf6523eff \{Sound = 0x29f0cf7e}
		0xf6523eff \{Sound = 0x218ae1ee}
		case 0xef6f6ccd
		0xf6523eff \{Sound = 0x662a9b3e}
		0xf6523eff \{Sound = 0x5b4ab28e}
		0xf6523eff \{Sound = 0xe96a6e9e}
		0xf6523eff \{Sound = 0xd40a472e}
		0xf6523eff \{Sound = 0x93aa3dfe}
		0xf6523eff \{Sound = 0xaeca144e}
		0xf6523eff \{Sound = 0x2236bd3b}
		0xf6523eff \{Sound = 0x1f56948b}
		0xf6523eff \{Sound = 0x6596c7eb}
		0xf6523eff \{Sound = 0xe7c6503a}
		case 0x78072e40
		0xf6523eff \{Sound = 0xda1a3000}
		0xf6523eff \{Sound = 0x9dba4ad0}
		0xf6523eff \{Sound = 0xa0da6360}
		case 0x2c406cea
		0xf6523eff \{Sound = 0xd5ed0beb}
		0xf6523eff \{Sound = 0x924d713b}
		0xf6523eff \{Sound = 0xaf2d588b}
		0xf6523eff \{Sound = 0x1d0d849b}
		0xf6523eff \{Sound = 0x206dad2b}
		0xf6523eff \{Sound = 0x67cdd7fb}
		0xf6523eff \{Sound = 0x5aadfe4b}
		0xf6523eff \{Sound = 0xd8fd699a}
		case 0xc215adf7
		0xf6523eff \{Sound = 0xcf034d44}
		0xf6523eff \{Sound = 0x88a33794}
		0xf6523eff \{Sound = 0xb5c31e24}
		0xf6523eff \{Sound = 0x07e3c234}
		0xf6523eff \{Sound = 0x3a83eb84}
		0xf6523eff \{Sound = 0x7d239154}
		0xf6523eff \{Sound = 0x4043b8e4}
		0xf6523eff \{Sound = 0xc2132f35}
		0xf6523eff \{Sound = 0x43ffe431}
		case 0x981b8592
		0xf6523eff \{Sound = 0xe6f2f8fa}
		0xf6523eff \{Sound = 0xa152822a}
		0xf6523eff \{Sound = 0x9c32ab9a}
		0xf6523eff \{Sound = 0x2e12778a}
		0xf6523eff \{Sound = 0x54d224ea}
		0xf6523eff \{Sound = 0x69b20d5a}
		0xf6523eff \{Sound = 0xebe29a8b}
		case 0xf3943b1d
		0xf6523eff \{Sound = 0x67fd47a5}
		0xf6523eff \{Sound = 0x205d3d75}
		0xf6523eff \{Sound = 0x1d3d14c5}
		0xf6523eff \{Sound = 0xaf1dc8d5}
		0xf6523eff \{Sound = 0x927de165}
		0xf6523eff \{Sound = 0xd5dd9bb5}
		case 0x21e432f9
		0xf6523eff \{Sound = 0xc29205b4}
		0xf6523eff \{Sound = 0x85327f64}
		case 0x552293db
		0xf6523eff \{Sound = 0xcaf8c5fa}
		0xf6523eff \{Sound = 0x8d58bf2a}
		0xf6523eff \{Sound = 0xb85256d4}
		0xf6523eff \{Sound = 0x13725e3a}
		case 0xe934a14a
		0xf6523eff \{Sound = 0x72f18dd4}
		0xf6523eff \{Sound = 0x3551f704}
		0xf6523eff \{Sound = 0x0831deb4}
		0xf6523eff \{Sound = 0xba1102a4}
		0xf6523eff \{Sound = 0x87712b14}
		0xf6523eff \{Sound = 0xc0d151c4}
		0xf6523eff \{Sound = 0xfdb17874}
		case 0x6b3cd028
		0xf6523eff \{Sound = 0xd9863b0d}
		0xf6523eff \{Sound = 0x9e2641dd}
		0xf6523eff \{Sound = 0xa346686d}
		0xf6523eff \{Sound = 0x1166b47d}
		0xf6523eff \{Sound = 0x2c069dcd}
		0xf6523eff \{Sound = 0x6ba6e71d}
		case 0x20c93262
		0xf6523eff \{Sound = 0xaeb0aba2}
		0xf6523eff \{Sound = 0xe910d172}
		0xf6523eff \{Sound = 0xd470f8c2}
		0xf6523eff \{Sound = 0x665024d2}
		0xf6523eff \{Sound = 0x5b300d62}
		0xf6523eff \{Sound = 0x1c9077b2}
		0xf6523eff \{Sound = 0x21f05e02}
		case 0x8a8d0dd3
		0xf6523eff \{Sound = 0x523b5d26}
		0xf6523eff \{Sound = 0x159b27f6}
		0xf6523eff \{Sound = 0x28fb0e46}
		0xf6523eff \{Sound = 0x9adbd256}
		case 0x376641f6
		0xf6523eff \{Sound = 0x0738e183}
		0xf6523eff \{Sound = 0x40989b53}
		0xf6523eff \{Sound = 0x7df8b2e3}
		0xf6523eff \{Sound = 0xcfd86ef3}
		0xf6523eff \{Sound = 0xf2b84743}
		0xf6523eff \{Sound = 0xb5183d93}
		case 0x457c8934
		0xf6523eff \{Sound = 0x4a6714cc}
		0xf6523eff \{Sound = 0x0dc76e1c}
		0xf6523eff \{Sound = 0x30a747ac}
		0xf6523eff \{Sound = 0x82879bbc}
		0xf6523eff \{Sound = 0xbfe7b20c}
		0xf6523eff \{Sound = 0xf847c8dc}
		0xf6523eff \{Sound = 0x477776bd}
		0xf6523eff \{Sound = 0x7a175f0d}
		case 0x207d9aa0
		0xf6523eff \{Sound = 0xe53a1857}
		0xf6523eff \{Sound = 0xa29a6287}
		0xf6523eff \{Sound = 0x9ffa4b37}
		0xf6523eff \{Sound = 0x2dda9727}
		0xf6523eff \{Sound = 0x10babe97}
		0xf6523eff \{Sound = 0x571ac447}
		0xf6523eff \{Sound = 0x6a7aedf7}
		0xf6523eff \{Sound = 0xd54a5396}
		case 0x44c1bb24
		0xf6523eff \{Sound = 0xb9f37a8d}
		0xf6523eff \{Sound = 0xfe53005d}
		0xf6523eff \{Sound = 0xc33329ed}
		case 0x49c7cf70
		0xf6523eff \{Sound = 0x83f0d583}
		0xf6523eff \{Sound = 0xc450af53}
		0xf6523eff \{Sound = 0xf93086e3}
		0xf6523eff \{Sound = 0x76707343}
		0xf6523eff \{Sound = 0x31d00993}
		0xf6523eff \{Sound = 0x0cb02023}
		case tut_vox_hitnotes
		0xf6523eff \{Sound = 0xa66dc7b3}
		0xf6523eff \{Sound = 0xe1cdbd63}
		0xf6523eff \{Sound = 0xdcad94d3}
		0xf6523eff \{Sound = 0x6e8d48c3}
		0xf6523eff \{Sound = 0x53ed6173}
		0xf6523eff \{Sound = 0x144d1ba3}
		0xf6523eff \{Sound = 0x292d3213}
		0xf6523eff \{Sound = 0xab7da5c2}
		0xf6523eff \{Sound = 0x961d8c72}
		0xf6523eff \{Sound = 0x50513da6}
		0xf6523eff \{Sound = 0x6d311416}
		case 0x00c572aa
		0xf6523eff \{Sound = 0xb6cbcdf4}
		0xf6523eff \{Sound = 0xf16bb724}
		0xf6523eff \{Sound = 0xcc0b9e94}
		0xf6523eff \{Sound = 0x7e2b4284}
		case 0x2fb96088
		0xf6523eff \{Sound = 0x6484f477}
		0xf6523eff \{Sound = 0x23248ea7}
		0xf6523eff \{Sound = 0x1e44a717}
		0xf6523eff \{Sound = 0xac647b07}
		0xf6523eff \{Sound = 0x910452b7}
		0xf6523eff \{Sound = 0xd6a42867}
		0xf6523eff \{Sound = 0xebc401d7}
		0xf6523eff \{Sound = 0x69949606}
		0xf6523eff \{Sound = 0x54f4bfb6}
		0xf6523eff \{Sound = 0x92b80e62}
		0xf6523eff \{Sound = 0xafd827d2}
		case tut_vox_freeform
		0xf6523eff \{Sound = 0x7f044b2d}
		0xf6523eff \{Sound = 0x38a431fd}
		0xf6523eff \{Sound = 0x05c4184d}
		0xf6523eff \{Sound = 0xb7e4c45d}
		0xf6523eff \{Sound = 0x8a84eded}
		0xf6523eff \{Sound = 0xcd24973d}
		0xf6523eff \{Sound = 0xf044be8d}
		0xf6523eff \{Sound = 0x7214295c}
		0xf6523eff \{Sound = 0x4f7400ec}
		0xf6523eff \{Sound = 0x8938b138}
		case 0xd2b20a5a
		0xf6523eff \{Sound = 0xb5cb4f9c}
		0xf6523eff \{Sound = 0x88ab662c}
		0xf6523eff \{Sound = 0x3a8bba3c}
		0xf6523eff \{Sound = 0x07eb938c}
		0xf6523eff \{Sound = 0x404be95c}
		0xf6523eff \{Sound = 0x7d2bc0ec}
		0xf6523eff \{Sound = 0xff7b573d}
		0xf6523eff \{Sound = 0xc21b7e8d}
		0xf6523eff \{Sound = 0x0457cf59}
		case 0xa882b65d
		0xf6523eff \{Sound = 0xed19df18}
		case 0x257026e0
		0xf6523eff \{Sound = 0x9c1a8ae0}
		0xf6523eff \{Sound = 0xdbbaf030}
		0xf6523eff \{Sound = 0xe6dad980}
		0xf6523eff \{Sound = 0x54fa0590}
		case 0xe66ba6da
		0xf6523eff \{Sound = 0xfd71835f}
		0xf6523eff \{Sound = 0xbad1f98f}
		0xf6523eff \{Sound = 0x87b1d03f}
		0xf6523eff \{Sound = 0x35910c2f}
		case 0x6607dbe4
		0xf6523eff \{Sound = 0x030a6f38}
		0xf6523eff \{Sound = 0x44aa15e8}
		0xf6523eff \{Sound = 0x79ca3c58}
		0xf6523eff \{Sound = 0xcbeae048}
		case 0x83280698
		0xf6523eff \{Sound = 0x2452d349}
		0xf6523eff \{Sound = 0x63f2a999}
		0xf6523eff \{Sound = 0x5e928029}
		0xf6523eff \{Sound = 0xecb25c39}
		case 0xee3694eb
		0xf6523eff \{Sound = 0xbfe0a88a}
		0xf6523eff \{Sound = 0xf840d25a}
		case 0x921f760a
		0xf6523eff \{Sound = 0xac83edf1}
		0xf6523eff \{Sound = 0xeb239721}
		0xf6523eff \{Sound = 0xd643be91}
		case 0xb33bf552
		0xf6523eff \{Sound = 0x08526dc8}
		0xf6523eff \{Sound = 0x4ff21718}
		case 0xd37d8f70
		0xf6523eff \{Sound = 0x165c3130}
		case 0x442f0bde
		0xf6523eff \{Sound = 0xe6ad8a7b}
		0xf6523eff \{Sound = 0xa10df0ab}
		0xf6523eff \{Sound = 0x9c6dd91b}
		0xf6523eff \{Sound = 0x2e4d050b}
		0xf6523eff \{Sound = 0x132d2cbb}
		0xf6523eff \{Sound = 0x548d566b}
		0xf6523eff \{Sound = 0x69ed7fdb}
		0xf6523eff \{Sound = 0xebbde80a}
		0xf6523eff \{Sound = 0xd6ddc1ba}
		0xf6523eff \{Sound = 0x1091706e}
		case 0x71e4ed3d
		0xf6523eff \{Sound = 0x4dc81f37}
		default

	endswitch
	Change 0x1d401155 = <mode>
endscript

script 0xb1ba908a 
	GetPakManCurrent \{map = zones}
	0x8882d576
	switch <venuesize>
		case 'Small_INT'
		LoadSound \{small_int_encore_crowd}
		LoadSound \{0x7b6ab35c}
		LoadSound \{int_sm_crowd_good_loop}
		case 'Medium_EXT'
		LoadSound \{medium_ext_encore_crowd}
		LoadSound \{0x92adc9ae}
		LoadSound \{0xcc3f6614}
		LoadSound \{ext_md_crowd_good_loop}
		case 'Large_EXT'
		LoadSound \{large_ext_encore_crowd}
		LoadSound \{0xcd9525fb}
		LoadSound \{ext_lg_crowd_good_loop}
	endswitch
	LoadSound \{callout_a_5}
	LoadSound \{callout_b_3}
	LoadSound \{callout_c_22}
	LoadSound \{callout_d_17}
	LoadSound \{callout_d_8}
	LoadSound \{callout_e_7}
endscript
