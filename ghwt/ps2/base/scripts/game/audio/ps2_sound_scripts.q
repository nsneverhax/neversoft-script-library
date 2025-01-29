
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
0x27707361 = None
0x1d401155 = None
0x417433a6 = [
	'sg_b_pk_a4_s6_f5_01'
	'sg_b_pk_ab3_s1_f16_01'
	'sg_b_pk_ab5_s6_f16_01'
	'sg_b_pk_b4_s4_f16_01'
	'sg_b_pk_c4_s4_f5_01'
	'sg_b_pk_d3_s2_f5_01'
	'sg_b_pk_db4_s2_f16_01'
	'sg_b_pk_e4_s5_f5_01'
	'sg_b_pk_eb5_s5_f16_01'
	'sg_b_pk_g3_s3_f5_01'
	'sg_b_pk_gb4_s3_f16_01'
	'sg_b_pm_a2_s1_f5_01'
	'sg_b_pm_a4_s6_f5_01'
	'sg_b_pm_ab3_s1_f16_01'
	'sg_b_pm_ab5_s6_f16_01'
	'sg_b_pm_b4_s4_f16_01'
	'sg_b_pm_c4_s4_f5_01'
	'sg_b_pm_d3_s2_f5_01'
	'sg_b_pm_db4_s2_f16_01'
	'sg_b_pm_e4_s5_f5_01'
	'sg_b_pm_eb5_s5_f16_01'
	'sg_b_pm_g3_s3_f5_01'
	'sg_b_pm_gb4_s3_f16_01'
]
0x06de2cd8 = [
	'sg_b_chrd_down_c5_s2_f3_01'
	'sg_b_chrd_down_g5_s1_f3_01'
	'sg_b_chrd_down_gb5_s2_f9_01'
	'sg_b_chrd_down_cmaj_s2_f3_01'
	'sg_b_chrd_down_gmaj_s1_f3_01'
	'sg_b_chrd_down_gbmaj_s2_f9_01'
	'sg_b_chrd_down_cmin_s2_f3_01'
	'sg_b_chrd_down_gmin_s1_f3_01'
	'sg_b_chrd_down_gbmin_s2_f9_01'
	'sg_b_divebomb_down'
	'sg_b_divebomb_updown'
	'sg_b_fingerslide'
	'sg_b_hrm_s1_f12'
	'sg_b_hrm_s2_f12'
	'sg_b_hrm_s3_f12'
	'sg_b_hrm_s4_f12'
	'sg_b_hrm_s5_f12'
	'sg_b_hrm_s6_f12'
	'sg_b_pkslidefast'
	'sg_b_pkslideslow'
	'sg_b_stringmute_down'
]

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

script 0x1baed16a 
	GetArraySize \{$0x06de2cd8}
	i = 0
	begin
	formatText checksumName = 0xd33c2fb3 '%p_%s' p = $rhythm_jam_set s = ($0x06de2cd8 [<i>])
	formatText TextName = 0x78427a75 '%p_%s' p = $rhythm_jam_set s = ($0x06de2cd8 [<i>])

	LoadSound <0xd33c2fb3>
	<i> = (<i> + 1)
	repeat <array_Size>
	GetArraySize \{$0x417433a6}
	i = 0
	begin
	formatText checksumName = 0xd33c2fb3 '%p_%s' p = $lead_jam_set s = ($0x417433a6 [<i>])
	LoadSound <0xd33c2fb3>
	<i> = (<i> + 1)
	repeat <array_Size>
	Change 0x355c9929 = ($lead_jam_set)
	Change 0x0c4737fc = ($rhythm_jam_set)
endscript

script 0xeb3a43f7 
	LoadSound \{0x1efc214c}
	LoadSound \{0xd83dfbf5}
	LoadSound \{0xa08637e0}
	LoadSound \{0x105d6717}
	LoadSound \{0xb5742c90}
	LoadSound \{0x8a1390c5}
	LoadSound \{0x8ae14125}
	LoadSound \{0xfb73fc95}
	LoadSound \{0x66616f45}
	LoadSound \{0x989b54b6}
	LoadSound \{0xd922120a}
	LoadSound \{0x68c0291e}
	LoadSound \{0xcde96299}
	LoadSound \{0xcab53f86}
	LoadSound \{0xf27c0f2c}
	LoadSound \{0xbbd553d6}
endscript

script 0xc1c4e84c \{mode = 0xae92eddf
		0xd607e2e6 = 0
		Force = 0
		tutorial = 0}
	if (($game_mode = training) && (<mode> = jammode))
		return
	endif
	if NOT (<0xd607e2e6> = 1)
		0xbea8f580
		GetGlobalTags \{user_options}
		guitar_volume = (<volumes>.guitar.guitar.vol)
		band_volume = (<volumes>.guitar.Band.vol)
		sfx_volume = (<volumes>.guitar.sfx.vol)
	endif
	if NOT (<Force> = 1)
		if ($0x27707361 = <mode>)
			if (<mode> = jammode)
				if (($0x355c9929 != $lead_jam_set) || ($0x0c4737fc != $rhythm_jam_set))
					0x113e29bb
					0x1baed16a
				endif
			endif
			return
		endif
	endif
	Change 0x27707361 = <mode>
	0xc48cfd3c
	Change \{0x355c9929 = 'none'}
	Change \{0x0c4737fc = 'none'}
	if ((<mode> = jammode) || ((<mode> = tutorials) && (<tutorial> = jam)))
		0x41f1a09d
	endif
	Change \{0x1d401155 = 0x1d401155}
	if ($0x27707361 = None)
		return
	endif
	LoadSound \{GH3_Beat_Sound}
	LoadSound \{UI_Sound_05}
	LoadSound \{UI_Sound_09}
	LoadSound \{menu_scroll_down}
	LoadSound \{menu_scroll_up}
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
		LoadSound \{sp_cheer1}
		LoadSound \{sp_cheer2}
		LoadSound \{Notes_Ripple_Up_01}
		LoadSound \{you_rock_explosion}
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
		LoadSound \{CheckBox_Check_SFX}
		LoadSound \{menu_into_pausemenu}
		LoadSound \{menu_outof_pausemenu}
		LoadSound \{soundoptions_menu_reset}
		LoadSound \{menu_options_sound_fader_move}
		LoadSound \{menu_options_sound_select}
		LoadSound \{menu_options_sound_back}
		0xd53de9cc
		case 0x07071941

		LoadSound \{gig_complete_sponsor}
		LoadSound \{gigcomplete_unlock_item_text_appear}
		LoadSound \{gigcomplete_unlock_new_item}
		LoadSound \{gig_complete_magazine_in}
		LoadSound \{gig_complete_magazine_out}
		LoadSound \{CheckBox_Check_SFX}
		LoadSound \{menu_entername_select}
		LoadSound \{menu_entername_scroll_1}
		LoadSound \{0xa676c493}
		LoadSound \{menu_entername_back}
		LoadSound \{menu_entername_caps}
		LoadSound \{cash}
		LoadSound \{purchase_item}
		return
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
		LoadSound \{you_rock_explosion}
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
		LoadSound \{CheckBox_Check_SFX}
		LoadSound \{menu_into_pausemenu}
		LoadSound \{menu_outof_pausemenu}
		LoadSound \{songcomplete_out}
		LoadSound \{songcomplete_in}
		LoadSound \{soundoptions_menu_reset}
		LoadSound \{menu_options_sound_fader_move}
		0xd53de9cc
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
		elseif ((<tutorial> = 5) || (<tutorial> = 6))
			if (<tutorial> = 5)
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
		elseif (<tutorial> = jam)
			LoadSound \{0xb7b4df3d}
			LoadSound \{0x2094ffc9}
			LoadSound \{0x004afb06}
			LoadSound \{0x54edd254}
			LoadSound \{0x4312ea82}
			LoadSound \{0x89e937d2}
			LoadSound \{0xb7788b23}
			LoadSound \{0x5f49d670}
			LoadSound \{0x7462f6bf}
			LoadSound \{rev_bass4}
			LoadSound \{0xc61ec6e1}
			LoadSound \{mk_organ}
			LoadSound \{0x930b8ef9}
			LoadSound \{0xc43fbd6a}
			LoadSound \{0x3eafc325}
			LoadSound \{0x13206e2e}
			LoadSound \{0x9ae4eba3}
			LoadSound \{0x8851444d}
			LoadSound \{0x8e20eca9}
		elseif (<tutorial> = battle)
			LoadSound \{GH3_Battle_DifficultyRampUp}
			LoadSound \{GH3_BattleMode_Attack_Over}
			LoadSound \{GH3_BattleMode_DoubleNoteAttack}
			LoadSound \{GH3_BattleMode_Lightning}
			LoadSound \{GH3_BattleMode_StringBreakAttack}
			LoadSound \{GH3_Battlemode_StringTune_2}
			LoadSound \{sp_awarded1}
		endif
		0x8c8c96bf
		return
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
		LoadSound \{Highway_Rise}
		LoadSound \{GH3_Battlemode_StringTune_2}
		LoadSound \{UI_Song_Intro_Kick}
		LoadSound \{UI_Lose_Multiplier}
		LoadSound \{UI_SFX_100_Note_Streak}
		LoadSound \{UI_SFX_50_Note_Streak}
		LoadSound \{Multiplayer_Win_Screen}
		LoadSound \{StickClickMed}
		LoadSound \{You_Rock}
		LoadSound \{you_rock_explosion}
		LoadSound \{sp_awarded1}
		LoadSound \{CheckBox_Check_SFX}
		LoadSound \{doordie}
		LoadSound \{menu_into_pausemenu}
		LoadSound \{menu_outof_pausemenu}
		LoadSound \{songcomplete_out}
		LoadSound \{songcomplete_in}
		LoadSound \{soundoptions_menu_reset}
		LoadSound \{menu_options_sound_fader_move}
		case 0x64912155

		LoadSound \{CheckBox_Check_SFX}
		LoadSound \{Checkbox_SFX}
		LoadSound \{cash}
		LoadSound \{purchase_item}
		LoadSound \{menu_quickplay_removesong}
		LoadSound \{Menu_Warning_01}
		LoadSound \{menu_intro_lick_02}
		LoadSound \{menu_intro_lick_03}
		LoadSound \{menu_intro_lick_05}
		LoadSound \{menu_intro_lick_06}
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
		LoadSound \{menu_select_negative}
		LoadSound \{menu_entername_select}
		LoadSound \{menu_entername_scroll_1}
		LoadSound \{0xa676c493}
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
		LoadSound \{song_affirmation_04}
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
		Change \{0x27707361 = FrontEnd}
		return
		case FrontEnd

		LoadSound \{CheckBox_Check_SFX}
		LoadSound \{Checkbox_SFX}
		LoadSound \{cash}
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
		LoadSound \{menu_select_negative}
		LoadSound \{menu_entername_select}
		LoadSound \{menu_entername_scroll_1}
		LoadSound \{0xa676c493}
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
		LoadSound \{song_affirmation_04}
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
		if ($menu_music_on_flag = 1)
			0xdaee51ef
			return
		endif
		return
		case jammode
		LoadSound \{you_rock_explosion}
		LoadSound \{You_Rock}
		LoadSound \{Highway_Rise}
		LoadSound \{Notes_Ripple_Up_01}
		LoadSound \{UI_Lose_Multiplier}
		LoadSound \{UI_SFX_100_Note_Streak}
		LoadSound \{UI_SFX_50_Note_Streak}
		LoadSound \{UI_Song_Intro_Kick}
		LoadSound \{star_available}
		LoadSound \{sp_available1}
		LoadSound \{sp_awarded1}
		LoadSound \{songcomplete_out}
		LoadSound \{songcomplete_in}
		LoadSound \{menu_into_pausemenu}
		LoadSound \{menu_outof_pausemenu}
		LoadSound \{menu_entername_select}
		LoadSound \{menu_entername_scroll_1}
		LoadSound \{0xa676c493}
		LoadSound \{menu_entername_back}
		LoadSound \{menu_entername_caps}
		LoadSound \{menu_options_sound_select}
		LoadSound \{menu_options_sound_fader_move}
		LoadSound \{jammode_dpad_play}
		LoadSound \{jammode_dpad_recordingstart}
		LoadSound \{jammode_dpad_recordingstop}
		LoadSound \{jammode_dpad_stop}
		LoadSound \{menu_jammode_fxhud_off}
		LoadSound \{menu_jammode_fxhud_on}
		LoadSound \{ghtunes_menu_scroll}
		LoadSound \{jam_pause_panel_out}
		LoadSound \{jam_pause_panel_in}
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
		LoadSound \{GH3_Sudden_Death}
		0xd53de9cc
		0xeb3a43f7
		LoadSound \{StickClickMed}
		LoadSound \{rev_bass4}
		LoadSound \{0xc61ec6e1}
		LoadSound \{mk_organ}
		LoadSound \{0x930b8ef9}
		LoadSound \{0xc43fbd6a}
		LoadSound \{0x3eafc325}
		LoadSound \{0x13206e2e}
		LoadSound \{0x9ae4eba3}
		LoadSound \{0x8851444d}
		LoadSound \{0x8e20eca9}
		LoadSound \{0xb7b4df3d}
		LoadSound \{0x2094ffc9}
		LoadSound \{0x004afb06}
		LoadSound \{0x54edd254}
		LoadSound \{0x4312ea82}
		LoadSound \{0x89e937d2}
		LoadSound \{0xb7788b23}
		LoadSound \{0x5f49d670}
		LoadSound \{0x7462f6bf}
		0x8c8c96bf
		0x1baed16a
		return
		default







	endswitch
	0x8882d576
	switch <venuesize>
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
		case 'z_TOOL'

		return
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
		case 0xf63b22a3
		0xf6523eff \{Sound = 0x69aad83d}
		0xf6523eff \{Sound = 0x2e0aa2ed}
		0xf6523eff \{Sound = 0x136a8b5d}
		0xf6523eff \{Sound = 0xa14a574d}
		0xf6523eff \{Sound = 0x9c2a7efd}
		0xf6523eff \{Sound = 0xdb8a042d}
		0xf6523eff \{Sound = 0xe6ea2d9d}
		0xf6523eff \{Sound = 0x64baba4c}
		case 0x0c4d5976
		0xf6523eff \{Sound = 0x6efdea71}
		0xf6523eff \{Sound = 0x295d90a1}
		0xf6523eff \{Sound = 0x143db911}
		case 0xbfb45464
		0xf6523eff \{Sound = 0x68c1a710}
		0xf6523eff \{Sound = 0x2f61ddc0}
		0xf6523eff \{Sound = 0x1201f470}
		0xf6523eff \{Sound = 0x3b0471f9}
		case 0x9a13e20f
		0xf6523eff \{Sound = 0x780853ed}
		0xf6523eff \{Sound = 0x3fa8293d}
		0xf6523eff \{Sound = 0x02c8008d}
		0xf6523eff \{Sound = 0xb0e8dc9d}
		0xf6523eff \{Sound = 0x8d88f52d}
		case 0xd7192c28
		0xf6523eff \{Sound = 0x7a3eb37a}
		0xf6523eff \{Sound = 0x3d9ec9aa}
		0xf6523eff \{Sound = 0x00fee01a}
		0xf6523eff \{Sound = 0xb2de3c0a}
		0xf6523eff \{Sound = 0x8fbe15ba}
		case 0x2d9c02d7
		0xf6523eff \{Sound = 0x4573542d}
		0xf6523eff \{Sound = 0x02d32efd}
		0xf6523eff \{Sound = 0x3fb3074d}
		0xf6523eff \{Sound = 0x8d93db5d}
		0xf6523eff \{Sound = 0xb0f3f2ed}
		case 0xd4a54e93
		0xf6523eff \{Sound = 0xdaf24c8a}
		0xf6523eff \{Sound = 0x9d52365a}
		0xf6523eff \{Sound = 0xa0321fea}
		0xf6523eff \{Sound = 0x1212c3fa}
		0xf6523eff \{Sound = 0x2f72ea4a}
		0xf6523eff \{Sound = 0x68d2909a}
		0xf6523eff \{Sound = 0x55b2b92a}
		0xf6523eff \{Sound = 0xff6a9007}
		case 0x569616db
		0xf6523eff \{Sound = 0xec1a41e8}
		0xf6523eff \{Sound = 0xabba3b38}
		0xf6523eff \{Sound = 0x96da1288}
		0xf6523eff \{Sound = 0x24face98}
		0xf6523eff \{Sound = 0x199ae728}
		0xf6523eff \{Sound = 0x5e3a9df8}
		0xf6523eff \{Sound = 0x635ab448}
		0xf6523eff \{Sound = 0xe10a2399}
		0xf6523eff \{Sound = 0xdc6a0a29}
		0xf6523eff \{Sound = 0x1a26bbfd}
		0xf6523eff \{Sound = 0x2746924d}
		0xf6523eff \{Sound = 0x60e6e89d}
		0xf6523eff \{Sound = 0x5d86c12d}
		0xf6523eff \{Sound = 0xefa61d3d}
		0xf6523eff \{Sound = 0xd2c6348d}
		case 0xe6570665
		0xf6523eff \{Sound = 0x5681f87f}
		0xf6523eff \{Sound = 0x112182af}
		0xf6523eff \{Sound = 0x2c41ab1f}
		case 0x332a7f73
		0xf6523eff \{Sound = 0x6e6a6057}
		0xf6523eff \{Sound = 0x29ca1a87}
		0xf6523eff \{Sound = 0xa826d183}
		0xf6523eff \{Sound = 0x98569a42}
		0xf6523eff \{Sound = 0x2a764652}
		0xf6523eff \{Sound = 0xa68aef27}
		0xf6523eff \{Sound = 0x9beac697}
		0xf6523eff \{Sound = 0x9546f833}
		0xf6523eff \{Sound = 0x1ec2e8ec}
		0xf6523eff \{Sound = 0x23a2c15c}
		0xf6523eff \{Sound = 0x6dd63c82}
		0xf6523eff \{Sound = 0xe296c922}
		0xf6523eff \{Sound = 0xe12a95f7}
		0xf6523eff \{Sound = 0x637a0226}
		0xf6523eff \{Sound = 0x5e1a2b96}
		0xf6523eff \{Sound = 0x6402bb8c}
		0xf6523eff \{Sound = 0xa536b3f2}
		0xf6523eff \{Sound = 0xdff6e092}
		0xf6523eff \{Sound = 0x50b61532}
		0xf6523eff \{Sound = 0x17166fe2}
		0xf6523eff \{Sound = 0x0f867562}
		case 0x68081df4
		0xf6523eff \{Sound = 0xc1eaeebd}
		0xf6523eff \{Sound = 0x864a946d}
		0xf6523eff \{Sound = 0xbb2abddd}
		0xf6523eff \{Sound = 0x090a61cd}
		case 0x4052c234
		0xf6523eff \{Sound = 0xf9ba8f77}
		0xf6523eff \{Sound = 0xbe1af5a7}
		0xf6523eff \{Sound = 0x837adc17}
		0xf6523eff \{Sound = 0x315a0007}
		0xf6523eff \{Sound = 0x0c3a29b7}
		0xf6523eff \{Sound = 0x4b9a5367}
		0xf6523eff \{Sound = 0x76fa7ad7}
		0xf6523eff \{Sound = 0xf4aaed06}
		0xf6523eff \{Sound = 0xc9cac4b6}
		0xf6523eff \{Sound = 0x0f867562}
		0xf6523eff \{Sound = 0x32e65cd2}
		0xf6523eff \{Sound = 0x75462602}
		0xf6523eff \{Sound = 0x48260fb2}
		0xf6523eff \{Sound = 0xfa06d3a2}
		0xf6523eff \{Sound = 0xc766fa12}
		case 0x4abe0535
		0xf6523eff \{Sound = 0xd1b96075}
		0xf6523eff \{Sound = 0x96191aa5}
		0xf6523eff \{Sound = 0xab793315}
		0xf6523eff \{Sound = 0x24face98}
		case 0x70420994
		0xf6523eff \{Sound = 0x55f5dd4d}
		0xf6523eff \{Sound = 0x1255a79d}
		0xf6523eff \{Sound = 0x2f358e2d}
		0xf6523eff \{Sound = 0x76fa7ad7}
		0xf6523eff \{Sound = 0x0f867562}
		case 0xcf1935b4
		0xf6523eff \{Sound = 0xe3228311}
		0xf6523eff \{Sound = 0xa482f9c1}
		case 0x8301d424
		0xf6523eff \{Sound = 0x50a006cc}
		0xf6523eff \{Sound = 0x17007c1c}
		0xf6523eff \{Sound = 0x984089bc}
		case 0xed5863b9
		0xf6523eff \{Sound = 0x378a1f77}
		0xf6523eff \{Sound = 0x702a65a7}
		0xf6523eff \{Sound = 0x4d4a4c17}
		0xf6523eff \{Sound = 0xc20ab9b7}
		case 0xdcc2ca89
		0xf6523eff \{Sound = 0x72db5a76}
		0xf6523eff \{Sound = 0x357b20a6}
		0xf6523eff \{Sound = 0x081b0916}
		0xf6523eff \{Sound = 0x984089bc}
		case 0xcb56d0e4
		0xf6523eff \{Sound = 0xd3bfb858}
		0xf6523eff \{Sound = 0x941fc288}
		0xf6523eff \{Sound = 0xa97feb38}
		0xf6523eff \{Sound = 0x1b5f3728}
		case 0x27b37688
		0xf6523eff \{Sound = 0x2c71da15}
		0xf6523eff \{Sound = 0x6bd1a0c5}
		0xf6523eff \{Sound = 0x56b18975}
		case 0x922ea25f
		0xf6523eff \{Sound = 0xc880e4ee}
		0xf6523eff \{Sound = 0x8f209e3e}
	endswitch
	Change 0x1d401155 = <mode>
endscript

script 0xb1ba908a 
	0x113e29bb
	GetPakManCurrent \{map = zones}
	0x8882d576
	switch <venuesize>
		case 'Small_INT'
		LoadSound \{small_int_encore_crowd}
		case 'Medium_EXT'
		LoadSound \{medium_ext_encore_crowd}
		case 'Large_EXT'
		LoadSound \{large_ext_encore_crowd}
	endswitch
endscript
