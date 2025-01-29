0xf7bea20b = None

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

script 0xa755e7bd \{venuesize = 'Medium_EXT'}
	switch <venuesize>
		case 'Large_EXT'
		return \{0x191b609a = 'EXT_LG'}
		case 'Large_INT'
		return \{0x191b609a = 'EXT_LG'}
		case 'Medium_EXT'
		return \{0x191b609a = 'EXT_MD'}
		case 'Small_INT'
		return \{0x191b609a = 'INT_SM'}
		default
		return \{0x191b609a = 'EXT_MD'}
	endswitch
endscript

script 0xf6523eff \{Sound = 'none'}
	training_get_language_prefix
	formatText TextName = sound_id '%a_%b' a = <Sound> b = <language_prefix>
	LoadSound <sound_id> Heap = <Heap>
endscript
0x27707361 = None
0xae697c1f = 0
0x417433a6 = [
	'sg_b_pk_a2_s1_f5_01'
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
0x055c17e2 = 0
0x267fcbe7 = None
0x33f63f27 = [
]
0x3f1e5881 = [
]

script 0x0d6cc2e7 
	GetArraySize <0x070125aa>
	if (<array_Size> > 0)
		<i> = 0
		begin
		0xe7b77a42 (<0x070125aa> [<i>])
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
endscript

script 0x1d252f54 \{Heap = 0xb5d472b2}
	if ($0x0c4737fc = $rhythm_jam_set)
		printf \{'Rhythm effect sample set already loaded. Skip.'}
		return
	endif
	printf \{qs(0x7c437490)
		a = $rhythm_jam_set}
	0x0d6cc2e7 \{0x070125aa = $0x3f1e5881}
	GetArraySize \{$0x06de2cd8}
	0x51470282 = <array_Size>
	<i> = 0
	<array> = []
	begin
	formatText TextName = 0x78427a75 '%p_%s' p = $rhythm_jam_set s = ($0x06de2cd8 [<i>])
	LoadSound <0x78427a75> Heap = <Heap>
	AddArrayElement array = <array> element = <0x78427a75>
	<i> = (<i> + 1)
	repeat <0x51470282>
	Change 0x3f1e5881 = <array>
	Change 0x0c4737fc = ($rhythm_jam_set)
endscript

script 0x4bb67432 \{Heap = 0xb5d472b2}
	if ($0x355c9929 = $lead_jam_set)
		printf \{'Lead effect sample set already loaded. Skip.'}
		return
	endif
	printf \{qs(0x6ab968d9)
		b = $lead_jam_set}
	0x0d6cc2e7 \{0x070125aa = $0x33f63f27}
	GetArraySize \{$0x417433a6}
	0xd4520644 = <array_Size>
	<i> = 0
	<array> = []
	begin
	formatText TextName = 0x78427a75 '%p_%s' p = $lead_jam_set s = ($0x417433a6 [<i>])
	LoadSound <0x78427a75> Heap = <Heap>
	AddArrayElement array = <array> element = <0x78427a75>
	<i> = (<i> + 1)
	repeat <0xd4520644>
	Change 0x33f63f27 = <array>
	Change 0x355c9929 = ($lead_jam_set)
endscript

script 0x0ec8e62e \{Heap = 0xb5d472b2}
	printf \{'Load music studio effects previews'}
	effects_array = $jam_lead_effects
	GetArraySize <effects_array>
	i = 0
	begin
	formatText TextName = preview_sample '%a_preview' a = (<effects_array> [<i>].ps2_prefix)
	LoadSound <preview_sample> Heap = <Heap>
	<i> = (<i> + 1)
	repeat <array_Size>
endscript

script 0x388acbb7 
	if ($0xe736fc0c = $0x8931f588)
		printf \{qs(0xb6b0a523)
			a = $0xe736fc0c}
		return
	endif
	if NOT ($0x8931f588 = '')
		if NOT ($0x8eb83d8c = $0x8931f588)
			printf \{qs(0x5fe902a8)
				a = $0x8931f588}
			0xe7b77a42 \{$0x8931f588}
		endif
	endif
	printf \{qs(0xebcded6e)
		a = $0xe736fc0c}
	LoadSound \{$0xe736fc0c}
	Change 0x8931f588 = ($0xe736fc0c)
endscript

script 0x763b2917 
	if (($0x8eb83d8c = $0x874e47d8) || ($0xe736fc0c = $0x8eb83d8c))
		printf \{qs(0x3bca7278)
			a = $0x8eb83d8c}
		return
	endif
	if NOT ($0x874e47d8 = '')
		if NOT ($0x874e47d8 = $0xe736fc0c)
			printf \{qs(0x83c1bcf8)
				a = $0x874e47d8}
			0xe7b77a42 \{$0x874e47d8}
		endif
	endif
	printf \{qs(0xc942b6f5)
		a = $0x8eb83d8c}
	LoadSound \{$0x8eb83d8c
		Heap = heap_cas}
	Change 0x874e47d8 = ($0x8eb83d8c)
endscript

script 0xf7b44917 
	<structure> = $metallica_intro_vo_current_struct
	if StructureContains structure = <structure> rhythm_anim_name
		custom_anim_name = (<structure>.rhythm_anim_name)
	else
		return
	endif
	switch <custom_anim_name>
		case vo_james_generic_03
		LoadSound \{'James_VO_Generic_3'}
		case vo_james_generic_05
		LoadSound \{'James_VO_Generic_5'}
		case vo_james_generic_06
		LoadSound \{'James_VO_Generic_6'}
		case vo_james_generic_07
		LoadSound \{'James_VO_Generic_7'}
		case vo_james_generic_08
		LoadSound \{'James_VO_Generic_8'}
		case vo_james_generic_13
		LoadSound \{'James_VO_Generic_13'}
		case vo_james_generic_09
		LoadSound \{'James_VO_Generic_9'}
		case vo_james_generic_04
		LoadSound \{'James_VO_Generic_4'}
		case vo_james_generic_16
		LoadSound \{'James_VO_Generic_16'}
		case vo_james_generic_02
		LoadSound \{'James_VO_Generic_2'}
		case vo_james_generic_10
		LoadSound \{'James_VO_Generic_10'}
		case vo_james_generic_11
		LoadSound \{'James_VO_Generic_11'}
		case vo_james_generic_12
		LoadSound \{'James_VO_Generic_12'}
		case vo_james_generic_14
		LoadSound \{'James_VO_Generic_14'}
		case vo_james_generic_15
		LoadSound \{'James_VO_Generic_15'}
		case vo_james_generic_17
		LoadSound \{'James_VO_Generic_17'}
		case vo_james_generic_19
		LoadSound \{'James_VO_Generic_19'}
		case vo_james_generic_18
		LoadSound \{'James_VO_Generic_18'}
		case vo_james_generic_20
		LoadSound \{'James_VO_Generic_20'}
		case vo_james_encore_02
		LoadSound \{'James_VO_Encore_2'}
		case vo_james_song_01
		LoadSound \{'James_VO_Song_1'}
		case vo_james_song_02
		LoadSound \{'James_VO_Song_2'}
		case vo_james_song_05
		LoadSound \{'James_VO_Song_5'}
		case vo_james_song_06
		LoadSound \{'James_VO_Song_6'}
	endswitch
endscript

script 0xf301e1c3 
	randomize
	Random (
		@ LoadSound \{'Menu_Intro_Lick_02'}
		Change \{0xf7bea20b = menu_intro_lick_02}
		@ LoadSound \{'Menu_Intro_Lick_03'}
		Change \{0xf7bea20b = menu_intro_lick_03}
		@ LoadSound \{'Menu_Intro_Lick_05'}
		Change \{0xf7bea20b = menu_intro_lick_05}
		@ LoadSound \{'Menu_Intro_Lick_06'}
		Change \{0xf7bea20b = menu_intro_lick_06}
		@ LoadSound \{'Menu_Intro_Lick_07'}
		Change \{0xf7bea20b = menu_intro_lick_07}
		@ LoadSound \{'Menu_Intro_Lick_09'}
		Change \{0xf7bea20b = menu_intro_lick_09}
		@ LoadSound \{'Menu_Intro_Lick_11'}
		Change \{0xf7bea20b = menu_intro_lick_11}
		@ LoadSound \{'Menu_Intro_Lick_13'}
		Change \{0xf7bea20b = menu_intro_lick_13}
		)
endscript

script 0xc1c4e84c \{mode = 0xae92eddf
		0xd607e2e6 = 0
		Force = 0
		0x044dc3cd = 0}
	PushMemProfile \{'ReloadSFX'}
	if NOT (<0xd607e2e6> = 1)
		StopAllSounds
	endif
	printf \{'-- LOADING SOUNDS --'}
	printf '-- mode = %d --' d = <mode>
	<0x2ec5c7a0> = 0
	if NOT (<Force> = 1)
		if ($0x27707361 = <mode>)
			if ((<mode> != jammode) && (<mode> != tutorials))
				<0x2ec5c7a0> = 1
			elseif ((<mode> = jammode) && ($0x055c17e2 = 1) && (<0x044dc3cd> = 1) && ($0xe736fc0c = $0x8931f588) && ($0x8eb83d8c = $0x874e47d8))
				loaddrumkitall drum_kit = ($0x11afd57c) percussion_kit = ($0x5c345721)
				0xf2760840 0x044dc3cd = <0x044dc3cd>
				<0x2ec5c7a0> = 1
			endif
		endif
	endif
	if (<0x2ec5c7a0> = 1)
		printf \{'Already in sound mode! Exit load.'}
		PopMemProfile
		return
	endif
	if ($g_in_tutorial = 1)
		if NOT (<mode> = tutorials)
			printf \{'In tutorial.  Reload aborted.'}
			PopMemProfile
			return
		endif
	endif
	Change 0x27707361 = <mode>
	if (<mode> = FrontEnd)
		unloaddrumkitall
	endif
	printf \{'== UnloadAllSFX =='}
	0xc48cfd3c
	if NOT (<mode> = FrontEnd)
		printf \{'Load drums onto fmod heap'}
		<0x66557c7f> = 0xa47d93f4
		if NOT ($loadeddrumkitpaks_cymbal = 'none')
			printf \{'Load cymbals'}
			($loadeddrumkitpaks_cymbal) 0xcd98d3f6 = <0x66557c7f>
		endif
		if NOT ($loadeddrumkitpaks_floortom = 'none')
			printf \{'Load floortom'}
			($loadeddrumkitpaks_floortom) 0xcd98d3f6 = <0x66557c7f>
		endif
		if NOT ($loadeddrumkitpaks_hihat = 'none')
			printf \{'Load hihat'}
			($loadeddrumkitpaks_hihat) 0xcd98d3f6 = <0x66557c7f>
		endif
		if NOT ($loadeddrumkitpaks_hitom = 'none')
			printf \{'Load hitom'}
			($loadeddrumkitpaks_hitom) 0xcd98d3f6 = <0x66557c7f>
		endif
		if NOT ($loadeddrumkitpaks_kick = 'none')
			printf \{'Load kick'}
			($loadeddrumkitpaks_kick) 0xcd98d3f6 = <0x66557c7f>
		endif
		if NOT ($loadeddrumkitpaks_snare = 'none')
			printf \{'Load snare'}
			($loadeddrumkitpaks_snare) 0xcd98d3f6 = <0x66557c7f>
		endif
		if NOT ($loadeddrumkitpaks_cymbal_percussion = 'none')
			printf \{'Load cymbal_percussion'}
			($loadeddrumkitpaks_cymbal_percussion) 0xcd98d3f6 = <0x66557c7f>
		endif
		if NOT ($loadeddrumkitpaks_floortom_percussion = 'none')
			printf \{'Load floortom_percussion'}
			($loadeddrumkitpaks_floortom_percussion) 0xcd98d3f6 = <0x66557c7f>
		endif
		if NOT ($loadeddrumkitpaks_hihat_percussion = 'none')
			printf \{'Load hihat_percussion'}
			($loadeddrumkitpaks_hihat_percussion) 0xcd98d3f6 = <0x66557c7f>
		endif
		if NOT ($loadeddrumkitpaks_hitom_percussion = 'none')
			printf \{'Load hitom_percussion'}
			($loadeddrumkitpaks_hitom_percussion) 0xcd98d3f6 = <0x66557c7f>
		endif
		if NOT ($loadeddrumkitpaks_kick_percussion = 'none')
			printf \{'Load kick_percussion'}
			($loadeddrumkitpaks_kick_percussion) 0xcd98d3f6 = <0x66557c7f>
		endif
		if NOT ($loadeddrumkitpaks_snare_percussion = 'none')
			printf \{'Load snare_percussion'}
			($loadeddrumkitpaks_snare_percussion) 0xcd98d3f6 = <0x66557c7f>
		endif
		printf \{'Drums loaded'}
	endif
	Change \{0x355c9929 = None}
	Change \{0x0c4737fc = None}
	Change \{0x33f63f27 = [
		]}
	Change \{0x3f1e5881 = [
		]}
	Change \{0x8931f588 = ''}
	Change \{0x874e47d8 = ''}
	Change \{0xae697c1f = 0}
	if ($0x27707361 = None)
		PopMemProfile
		return
	endif
	0x6dbf77b0 = 0xb5d472b2
	LoadSound \{'GH3_Beat_Sound'}
	LoadSound \{'UI_Sound_05'}
	LoadSound \{'UI_Sound_09'}
	LoadSound \{'Menu_Scroll_Down'}
	LoadSound \{'Menu_Scroll_Up'}
	LoadSound \{'Menu_Into_PauseMenu'}
	LoadSound \{'Menu_Select_Negative'}
	LoadSound \{'Menu_QuickPlay_RemoveSong'}
	LoadSound \{'Select_Sound_Big'}
	LoadSound \{'Select_Sound_Small'}
	switch <mode>
		case 0xae92eddf
		printf \{'Reloading SFX for oogame'}
		LoadSound \{'bad_note1'}
		LoadSound \{'bad_note2'}
		LoadSound \{'bad_note3'}
		LoadSound \{'bad_note4'}
		LoadSound \{'bad_note6'}
		LoadSound \{'bad_note_bass1'}
		LoadSound \{'bad_note_bass2'}
		LoadSound \{'bad_note_bass4'}
		LoadSound \{'bad_note_bass6'}
		LoadSound \{'Highway_Rise'}
		LoadSound \{'UI_Song_Intro_Kick'}
		LoadSound \{'notes_ripple_up_01'}
		LoadSound \{'StickClickLarge'}
		LoadSound \{'StickClickMed'}
		LoadSound \{'StickClickSmall'}
		LoadSound \{'HiHatClosed01'}
		LoadSound \{'Guitar_Smash_Large_GH4_01'}
		LoadSound \{'Guitar_Smash_Medium_GH4_01'}
		LoadSound \{'Guitar_Smash_Small_GH4_01'}
		LoadSound \{'Menu_Options_Sound_Select'}
		LoadSound \{'Menu_Options_Sound_Back'}
		LoadSound \{'Menu_Options_Sound_Fader_Move'}
		LoadSound \{'Pyro_1'}
		LoadSound \{'Pyro_2'}
		LoadSound \{'Pyro_3'}
		LoadSound \{'UI_SFX_50_Note_Streak'
			Heap = 0xc39f2ba1}
		if NOT ($game_mode = training)
			LoadSound \{'UI_Lose_Multiplier'}
			LoadSound \{'Crowd_Group_Clap_01'}
			LoadSound \{'Crowd_Group_Clap_02'}
			LoadSound \{'Crowd_Group_Clap_03'}
			LoadSound \{'Crowd_Group_Clap_04'}
			LoadSound \{'Crowd_Group_Clap_05'}
			LoadSound \{'Crowd_Group_Clap_06'}
			LoadSound \{'sp_awarded1'}
			LoadSound \{'sp_awarded2'
				Heap = 0xc39f2ba1}
			LoadSound \{'sp_available1'
				Heap = 0xc39f2ba1}
			LoadSound \{'sp_cheer1'
				Heap = 0xc39f2ba1}
			LoadSound \{'You_Rock'
				Heap = 0xc39f2ba1}
			LoadSound \{'Crowd_Fail_Song'
				Heap = 0xc39f2ba1}
			LoadSound \{'sp_deployed'
				Heap = 0xc39f2ba1}
			LoadSound \{'Star_Available'
				Heap = 0xc39f2ba1}
			LoadSound \{'Star_Deployed_LFE'
				Heap = 0xc39f2ba1}
			LoadSound \{'Star_Release_Center'
				Heap = 0xc39f2ba1}
			LoadSound \{'Star_Release_Front'
				Heap = 0xc39f2ba1}
		endif
		LoadSound \{'Bad_Note_Tom1'
			Heap = 0xc39f2ba1}
		LoadSound \{'Bad_Note_HiHat1'
			Heap = 0xc39f2ba1}
		LoadSound \{'Bad_Note_Kick1'
			Heap = 0xc39f2ba1}
		case 0x07071941
		printf \{qs(0xbb8fd230)}
		LoadSound \{'Gig_Complete_Sponsor'}
		LoadSound \{'GigComplete_Unlock_Item_Text_Appear'}
		LoadSound \{'GigComplete_Unlock_New_Item'}
		LoadSound \{'checkbox_check_sfx'}
		LoadSound \{'Menu_EnterName_Select'}
		LoadSound \{'Menu_EnterName_Scroll_1'}
		LoadSound \{'Menu_EnterName_Finish'}
		LoadSound \{'Menu_EnterName_Back'}
		LoadSound \{'Menu_EnterName_Caps'}
		LoadSound \{'Cash'}
		LoadSound \{'Purchase_Item'}
		LoadSound \{'Pre_Cutscence_SFX'}
		return
		case 0x68721771
		printf \{'Reloading SFX for oogame'}
		LoadSound \{'bad_note1'}
		LoadSound \{'bad_note2'}
		LoadSound \{'bad_note3'}
		LoadSound \{'bad_note4'}
		LoadSound \{'bad_note6'}
		LoadSound \{'bad_note_bass1'}
		LoadSound \{'bad_note_bass2'}
		LoadSound \{'bad_note_bass4'}
		LoadSound \{'bad_note_bass6'}
		LoadSound \{'notes_ripple_up_01'}
		LoadSound \{'Multiplayer_Win_Screen'}
		LoadSound \{'Highway_Rise'}
		LoadSound \{'UI_Song_Intro_Kick'}
		LoadSound \{'Crowd_Group_Clap_01'}
		LoadSound \{'Crowd_Group_Clap_02'}
		LoadSound \{'Crowd_Group_Clap_03'}
		LoadSound \{'Crowd_Group_Clap_04'}
		LoadSound \{'Crowd_Group_Clap_05'}
		LoadSound \{'Crowd_Group_Clap_06'}
		LoadSound \{'StickClickLarge'}
		LoadSound \{'StickClickMed'}
		LoadSound \{'StickClickSmall'}
		LoadSound \{'HiHatClosed01'}
		LoadSound \{'UI_Lose_Multiplier'}
		LoadSound \{'Guitar_Smash_Large_GH4_01'}
		LoadSound \{'Guitar_Smash_Medium_GH4_01'}
		LoadSound \{'Guitar_Smash_Small_GH4_01'}
		LoadSound \{'sp_available1'
			Heap = 0xc39f2ba1}
		LoadSound \{'sp_awarded1'
			Heap = 0xc39f2ba1}
		LoadSound \{'sp_awarded2'
			Heap = 0xc39f2ba1}
		LoadSound \{'UI_SFX_50_Note_Streak'
			Heap = 0xc39f2ba1}
		LoadSound \{'sp_deployed'
			Heap = 0xc39f2ba1}
		LoadSound \{'Star_Available'
			Heap = 0xc39f2ba1}
		LoadSound \{'Star_Deployed_LFE'
			Heap = 0xc39f2ba1}
		LoadSound \{'Star_Release_Center'
			Heap = 0xc39f2ba1}
		LoadSound \{'Star_Release_Front'
			Heap = 0xc39f2ba1}
		LoadSound \{'Crowd_Fail_Song'
			Heap = 0xc39f2ba1}
		LoadSound \{'sp_cheer1'
			Heap = 0xc39f2ba1}
		LoadSound \{'Menu_Options_Sound_Fader_Move'}
		LoadSound \{'Menu_Options_Sound_Select'}
		LoadSound \{'Menu_Options_Sound_Back'}
		LoadSound \{'You_Rock'
			Heap = 0xc39f2ba1}
		LoadSound \{'Bad_Note_Tom1'
			Heap = 0xc39f2ba1}
		LoadSound \{'Bad_Note_HiHat1'
			Heap = 0xc39f2ba1}
		LoadSound \{'Bad_Note_Kick1'
			Heap = 0xc39f2ba1}
		case battle
		printf \{'Reloading SFX for battle'}
		LoadSound \{'bad_note1'}
		LoadSound \{'bad_note2'}
		LoadSound \{'bad_note3'}
		LoadSound \{'bad_note4'}
		LoadSound \{'bad_note6'}
		LoadSound \{'notes_ripple_up_01'}
		LoadSound \{'GH3_Battle_DifficultyRampUp'}
		LoadSound \{'GH3_BattleMode_Attack_Over'}
		LoadSound \{'GH3_BattleMode_DoubleNoteAttack'}
		LoadSound \{'GH3_BattleMode_LeftyAttack'}
		LoadSound \{'GH3_BattleMode_Lightning'}
		LoadSound \{'GH3_BattleMode_StealPowerup'}
		LoadSound \{'GH3_BattleMode_StringBreakAttack'}
		LoadSound \{'GH3_BattleMode_WhammyAttack'}
		LoadSound \{'GH3_BattleMode_WhammyAttack_Received'}
		LoadSound \{'GHM_RideTheLightning_Release'}
		LoadSound \{'GHM_HitTheLights_Release'}
		LoadSound \{'GHM_DamageInc_Attack'}
		LoadSound \{'GHM_TrappedUnderIce_Release'}
		LoadSound \{'GHM_RideTheLightning_Attack'}
		LoadSound \{'GHM_HitTheLights_Attack'}
		LoadSound \{'GHM_TrappedUnderIce_Attack'}
		LoadSound \{'Highway_Rise'}
		LoadSound \{'GH3_BattleMode_StringTune_2'}
		LoadSound \{'UI_Song_Intro_Kick'}
		LoadSound \{'UI_Lose_Multiplier'}
		LoadSound \{'UI_SFX_50_Note_Streak'}
		LoadSound \{'Multiplayer_Win_Screen'}
		LoadSound \{'bad_note_bass4'}
		LoadSound \{'StickClickMed'}
		LoadSound \{'sp_awarded1'
			Heap = 0xc39f2ba1}
		LoadSound \{'You_Rock'
			Heap = 0xc39f2ba1}
		LoadSound \{'GH3_Sudden_Death'
			Heap = 0xc39f2ba1}
		LoadSound \{'Menu_Options_Sound_Fader_Move'}
		LoadSound \{'Menu_Options_Sound_Select'}
		LoadSound \{'Menu_Options_Sound_Back'}
		LoadSound \{'Bad_Note_Tom1'
			Heap = 0xc39f2ba1}
		LoadSound \{'Bad_Note_HiHat1'
			Heap = 0xc39f2ba1}
		LoadSound \{'Bad_Note_Kick1'
			Heap = 0xc39f2ba1}
		case tutorials
		printf 'Reloading SFX for tutorial %s' s = <tutorial>
		<0x8d17cebe> = 0
		<0x9bcc0bca> = 0
		switch <tutorial>
			case Band
			0xf6523eff \{Sound = 'Tut_Band_Intro_01_BAS'}
			0xf6523eff \{Sound = 'Tut_Band_Intro_02_BAS'}
			0xf6523eff \{Sound = 'Tut_Band_Play_01_BAS'}
			0xf6523eff \{Sound = 'Tut_Band_Star_01_BAS'}
			0xf6523eff \{Sound = 'Tut_Band_Star_02_BAS'}
			0xf6523eff \{Sound = 'Tut_Band_Star_03_BAS'}
			0xf6523eff \{Sound = 'Tut_Band_Star_04_BAS'}
			0xf6523eff \{Sound = 'Tut_Band_Star_05_BAS'}
			0xf6523eff \{Sound = 'Tut_Band_Star_06_BAS'}
			0xf6523eff \{Sound = 'Tut_Band_Star_07_BAS'}
			0xf6523eff \{Sound = 'Tut_Band_Star_08_BAS'}
			0xf6523eff \{Sound = 'Tut_Band_Star_09_BAS'}
			0xf6523eff \{Sound = 'Tut_Band_Star_10_BAS'}
			0xf6523eff \{Sound = 'Tut_Band_Vs_01_BAS'}
			case 0xbf7e526d
			0xf6523eff \{Sound = 'Tut_Dru_Accents_01_DRM'}
			0xf6523eff \{Sound = 'Tut_Dru_Accents_02_DRM'}
			0xf6523eff \{Sound = 'Tut_Dru_Accents_03_DRM'}
			0xf6523eff \{Sound = 'Tut_Dru_Accents_04_DRM'}
			0xf6523eff \{Sound = 'Tut_Dru_Accents_05_DRM'}
			0xf6523eff \{Sound = 'Tut_Dru_Accents_06_DRM'}
			0xf6523eff \{Sound = 'Tut_Dru_Accents_10_DRM'}
			0xf6523eff \{Sound = 'Tut_Dru_AddKick_01_DRM'}
			0xf6523eff \{Sound = 'Tut_Dru_AddKick_02_DRM'}
			0xf6523eff \{Sound = 'Tut_Dru_AddKick_03_DRM'}
			0xf6523eff \{Sound = 'Tut_Dru_AddKick_04_DRM'}
			0xf6523eff \{Sound = 'Tut_Dru_AddKick_05_DRM'}
			0xf6523eff \{Sound = 'Tut_Dru_AddKick_06_DRM'}
			0xf6523eff \{Sound = 'Tut_Dru_AddKick_10_DRM'}
			0xf6523eff \{Sound = 'Tut_Dru_DrumTest_01_DRM'}
			0xf6523eff \{Sound = 'Tut_Dru_DrumTest_02_DRM'}
			0xf6523eff \{Sound = 'Tut_Dru_DrumTest_03_DRM'}
			0xf6523eff \{Sound = 'Tut_Dru_DrumTest_04_DRM'}
			0xf6523eff \{Sound = 'Tut_Dru_DrumTest_05_DRM'}
			0xf6523eff \{Sound = 'Tut_Dru_DrumTest_06_DRM'}
			0xf6523eff \{Sound = 'Tut_Dru_DrumTest_07_DRM'}
			0xf6523eff \{Sound = 'Tut_Dru_DrumTest_08_DRM'}
			0xf6523eff \{Sound = 'Tut_Dru_HoldSticks_01_DRM'}
			0xf6523eff \{Sound = 'Tut_Dru_HoldSticks_02_DRM'}
			0xf6523eff \{Sound = 'Tut_Dru_HoldSticks_03_DRM'}
			0xf6523eff \{Sound = 'Tut_Dru_Impro_01_DRM'}
			0xf6523eff \{Sound = 'Tut_Dru_Impro_02_DRM'}
			0xf6523eff \{Sound = 'Tut_Dru_KickPedal_01_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_KickPedal_02_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_KickPedal_03_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_KickPedal_04_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_KickPedal_05_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_KickPedal_06_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_KickSong_01_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_KickSong_02_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_KickSong_03_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_KickSong_04_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_KickSong_05_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_KickSong_09_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_OneHand_01_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_OneHand_02_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_OneHand_03_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_OneHand_04_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_OneHand_05_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_OneHand_06_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_OneHand_07_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_OneHand_08_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_OneHand_12_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_Positive_01_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_Positive_02_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_Positive_03_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_Positive_04_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_Positive_05_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_Positive_06_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_Positive_07_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_Positive_08_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_Twohands_01_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_Twohands_02_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_Twohands_03_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_Twohands_04_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_Twohands_05_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_Twohands_06_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_Twohands_07_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_Twohands_08_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_Twohands_10_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_UI_01_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_UI_02_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_UI_03_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_UI_04_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_UI_05_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_UI_06_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_UI_07_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_UI_08_DRM'
				Heap = 0xc39f2ba1}
			0x04a6251d
			case 0xf7b87c0c
			0xf6523eff \{Sound = 'Tut_Dru_ActStarPow_01_DRM'}
			0xf6523eff \{Sound = 'Tut_Dru_ActStarPow_02_DRM'}
			0xf6523eff \{Sound = 'Tut_Dru_ActStarPow_03_DRM'}
			0xf6523eff \{Sound = 'Tut_Dru_ActStarPow_04_DRM'}
			0xf6523eff \{Sound = 'Tut_Dru_ActStarPow_05_DRM'}
			0xf6523eff \{Sound = 'Tut_Dru_ActStarPow_06_DRM'}
			0xf6523eff \{Sound = 'Tut_Dru_ActStarPow_07_DRM'}
			0xf6523eff \{Sound = 'Tut_Dru_ActStarPow_08_DRM'}
			0xf6523eff \{Sound = 'Tut_Dru_ActStarPow_09_DRM'}
			0xf6523eff \{Sound = 'Tut_Dru_ActStarPow_10_DRM'}
			0xf6523eff \{Sound = 'Tut_Dru_AddDrum_01_DRM'}
			0xf6523eff \{Sound = 'Tut_Dru_AddDrum_02_DRM'}
			0xf6523eff \{Sound = 'Tut_Dru_AddDrum_03_DRM'}
			0xf6523eff \{Sound = 'Tut_Dru_AddDrum_04_DRM'}
			0xf6523eff \{Sound = 'Tut_Dru_AddDrum_08_DRM'}
			0xf6523eff \{Sound = 'Tut_Dru_AddKick_01_DRM'}
			0xf6523eff \{Sound = 'Tut_Dru_AddKick_02_DRM'}
			0xf6523eff \{Sound = 'Tut_Dru_AddKick_03_DRM'}
			0xf6523eff \{Sound = 'Tut_Dru_AddKick_04_DRM'}
			0xf6523eff \{Sound = 'Tut_Dru_AddKick_05_DRM'}
			0xf6523eff \{Sound = 'Tut_Dru_AddKick_06_DRM'}
			0xf6523eff \{Sound = 'Tut_Dru_AddKick_10_DRM'}
			0xf6523eff \{Sound = 'Tut_Dru_FirstDrum_01_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_FirstDrum_02_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_FirstDrum_03_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_FirstDrum_04_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_FirstDrum_05_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_FirstDrum_06_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_FirstDrum_07_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_FirstDrum_11_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_Positive_01_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_Positive_02_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_Positive_03_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_Positive_04_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_Positive_05_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_Positive_06_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_Positive_07_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_Positive_08_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_StarCombo_01_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_StarCombo_02_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_StarCombo_03_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_StarCombo_04_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_StarCombo_05_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_StarCombo_06_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_StarCombo_08_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_StarCombo_09_DRM'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Dru_StarCombo_10_DRM'
				Heap = 0xc39f2ba1}
			0x04a6251d
			case 0x26542416
			0xf6523eff \{Sound = 'Tut_GTR_HamOns_01_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_HamOns_02_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_HamOns_03_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_HamOns_04_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_HamOns_09_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_HamOns_10_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_HOfinger_01_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_HOfinger_02_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_HOfinger_03_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_HOfinger_04_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_HOfinger_05_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_HOfinger_06_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_HOfinger_07_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_HOfinger_08_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_HOfinger_13_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_HOfinger_14_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_HOfinger_15_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_POFinger_01_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_POFinger_02_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_POFinger_03_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_POFinger_04_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_POFinger_05_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_POFinger_06_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_POFinger_07_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_POFinger_08_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_POFinger_09_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_POFinger_10_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_POFinger_15_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_Positive_01_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_Positive_02_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_Positive_03_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_Positive_04_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_Positive_05_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_Positive_06_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_Positive_07_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_Positive_08_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_PullOffs_01_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_PullOffs_02_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_PullOffs_03_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_PullOffs_08_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_PullOffs_09_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_StringBasics_01_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_StringBasics_02_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_StringBasics_03_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_StringBasics_04_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_StringBasics_05_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_StringBasics_06_GTR'}
			LoadSound \{'Tutorial_Missed_HOPO_Free'}
			LoadSound \{'Tutorial_String_1_HOPO_Free'}
			LoadSound \{'Tutorial_String_1_Strum_Free'}
			LoadSound \{'Tutorial_String_2_HOPO_Free'}
			LoadSound \{'Tutorial_String_2_Strum_Free'}
			LoadSound \{'Tutorial_String_3_HOPO_Free'}
			LoadSound \{'Tutorial_String_3_Strum_Free'}
			case 0x1b1da68e
			0xf6523eff \{Sound = 'Tut_Gtr_HoldGuitar_01_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_HoldGuitar_02_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_HoldGuitar_03_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_HoldGuitar_04_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_HoldGuitar_05_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_HoldGuitar_06_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_HoldGuitar_07_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_HoldGuitar_08_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_HoldGuitar_09_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_HoldGuitar_10_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_GuitarTune_01_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_GuitarTune_02_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_GuitarTune_03_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_GuitarTune_04_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_GuitarTune_05_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_GuitarTune_10_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_PlayNotes_01_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_PlayNotes_02_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_PlayNotes_03_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_PlayNotes_04_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_PlayNotes_05_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_PlayNotes_10_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_PlayNotes_11_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_PlayNotes_12_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_PlayNotes_13_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_Positive_01_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_Positive_02_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_Positive_03_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_Positive_04_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_Positive_05_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_Positive_06_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_Positive_07_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_Positive_08_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_OpenNotes_01_BAS'}
			0xf6523eff \{Sound = 'Tut_Gtr_OpenNotes_02_BAS'}
			0xf6523eff \{Sound = 'Tut_Gtr_OpenNotes_03_BAS'}
			0xf6523eff \{Sound = 'Tut_Gtr_OpenNotes_04_BAS'}
			0xf6523eff \{Sound = 'Tut_Gtr_OpenNotes_05_BAS'}
			0xf6523eff \{Sound = 'Tut_Gtr_OpenNotes_06_BAS'}
			0xf6523eff \{Sound = 'Tut_Gtr_OpenNotes_07_BAS'}
			0xf6523eff \{Sound = 'Tut_Gtr_OpenNotes_08_BAS'}
			0xf6523eff \{Sound = 'Tut_Gtr_OpenNotes_09_BAS'}
			0xf6523eff \{Sound = 'Tut_Gtr_OpenNotes_10_BAS'}
			0xf6523eff \{Sound = 'Tut_Gtr_OpenNotes_11_BAS'}
			0xf6523eff \{Sound = 'Tut_Gtr_OpenNotes_12_BAS'}
			0xf6523eff \{Sound = 'Tut_Gtr_OpenNotes_13_BAS'}
			0xf6523eff \{Sound = 'Tut_Gtr_LongNotes_01_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_LongNotes_02_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_LongNotes_03_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_LongNotes_08_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_LongNotes_09_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_LongNotes_10_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_LongNotes_11_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_LongNotes_12_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_LongNotes_13_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_Chords_01_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_Chords_02_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_Chords_03_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_Chords_04_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_Chords_09_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_Chords_10_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_Chords_11_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_Chords_12_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_DiffNotes_01_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_DiffNotes_02_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_DiffNotes_03_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_DiffNotes_08_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_DiffNotes_09_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_DiffNotes_10_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_DiffNotes_11_GTR'}
			0xf6523eff \{Sound = 'Tut_Gtr_UI_01_BAS'}
			0xf6523eff \{Sound = 'Tut_Gtr_UI_02_BAS'}
			0xf6523eff \{Sound = 'Tut_Gtr_UI_03_BAS'}
			0xf6523eff \{Sound = 'Tut_Gtr_UI_04_BAS'}
			0xf6523eff \{Sound = 'Tut_Gtr_UI_05_BAS'}
			0xf6523eff \{Sound = 'Tut_Gtr_UI_06_BAS'}
			0xf6523eff \{Sound = 'Tut_Gtr_UI_07_BAS'}
			0xf6523eff \{Sound = 'Tut_Gtr_UI_08_BAS'}
			0xf6523eff \{Sound = 'Tut_Gtr_UI_09_BAS'}
			LoadSound \{'A_String'}
			LoadSound \{'A_Tuning'}
			LoadSound \{'B_String'}
			LoadSound \{'B_Tuning'}
			LoadSound \{'D_String'}
			LoadSound \{'D_Tuning'}
			LoadSound \{'E_String'}
			LoadSound \{'E_Tuning'}
			LoadSound \{'G_String'}
			LoadSound \{'G_Tuning'}
			case 0x058fac41
			0xf6523eff \{Sound = 'Tut_GTR_SliderTap_01_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_SliderTap_02_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_SliderTap_03_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_SliderTap_04_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_SliderTap_05_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_SliderTap_06_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_SliderTap_07_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_SliderTap_08_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_SliderTap_09_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_SliderTap_14_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_SliderTap_15_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_SliderTap_17_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_SliderTap_18_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_Sustains_01_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_Sustains_02_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_Sustains_03_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_Sustains_04_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_Sustains_05_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_Sustains_06_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_Sustains_07_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_Sustains_08_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_Sustains_09_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_Sustains_10_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_Sustains_11_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_Sustains_12_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_Sustains_13_GTR'}
			case 0x00f0a8c8
			0xf6523eff \{Sound = 'Tut_GTR_ActivatingSP_01_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_ActivatingSP_02_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_ActivatingSP_03_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_ActivatingSP_04_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_ActivatingSP_05_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_ActivatingSP_06_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_ActivatingSP_07_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_ActivatingSP_08_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_ActivatingSP_09_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_StarPower_01_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_StarPower_02_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_StarPower_03_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_StarPower_04_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_StarPower_05_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_StarPower_06_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_StarPower_07_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_StarPower_12_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_StarPower_13_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_StarPower_14_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_Whammy_01_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_Whammy_02_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_Whammy_03_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_Whammy_04_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_Whammy_05_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_Whammy_06_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_Whammy_07_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_Whammy_12_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_Whammy_13_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_Whammy_14_GTR'}
			0xf6523eff \{Sound = 'Tut_GTR_Whammy_15_GTR'}
			case versus
			0xf6523eff \{Sound = 'Tut_Vs_Battle_01_BAS'}
			0xf6523eff \{Sound = 'Tut_Vs_Battle_02_BAS'}
			0xf6523eff \{Sound = 'Tut_Vs_Battle_03_BAS'}
			0xf6523eff \{Sound = 'Tut_Vs_Battle_04_BAS'}
			0xf6523eff \{Sound = 'Tut_Vs_BattleTilt_01_BAS'}
			0xf6523eff \{Sound = 'Tut_Vs_BattleTilt_02_BAS'}
			0xf6523eff \{Sound = 'Tut_Vs_BattleTilt_03_BAS'}
			0xf6523eff \{Sound = 'Tut_Vs_BattleTilt_04_BAS'}
			0xf6523eff \{Sound = 'Tut_Vs_DiffAttacks_01_BAS'}
			0xf6523eff \{Sound = 'Tut_Vs_DiffAttacks_02_BAS'}
			0xf6523eff \{Sound = 'Tut_Vs_DiffAttacks_03_BAS'}
			0xf6523eff \{Sound = 'Tut_Vs_DiffAttacks_04_BAS'}
			0xf6523eff \{Sound = 'Tut_Vs_DoOrDie_01_BAS'}
			0xf6523eff \{Sound = 'Tut_Vs_DoOrDie_02_BAS'}
			0xf6523eff \{Sound = 'Tut_Vs_DoOrDie_03_BAS'}
			0xf6523eff \{Sound = 'Tut_Vs_FaceOff_01_BAS'}
			0xf6523eff \{Sound = 'Tut_Vs_FaceOff_02_BAS'}
			0xf6523eff \{Sound = 'Tut_Vs_FaceOff_03_BAS'}
			0xf6523eff \{Sound = 'Tut_Vs_FaceOff_04_BAS'}
			0xf6523eff \{Sound = 'Tut_Vs_Modes_01_BAS'}
			0xf6523eff \{Sound = 'Tut_Vs_Multiples_01_BAS'}
			0xf6523eff \{Sound = 'Tut_Vs_Multiples_02_BAS'}
			case vocals
			0xf6523eff \{Sound = 'Tut_Vox_Freeform_01_VOX'}
			0xf6523eff \{Sound = 'Tut_Vox_Freeform_02_VOX'}
			0xf6523eff \{Sound = 'Tut_Vox_Freeform_03_VOX'}
			0xf6523eff \{Sound = 'Tut_Vox_Freeform_04_VOX'}
			0xf6523eff \{Sound = 'Tut_Vox_Freeform_05_VOX'}
			0xf6523eff \{Sound = 'Tut_Vox_Freeform_06_VOX'}
			0xf6523eff \{Sound = 'Tut_Vox_Freeform_07_VOX'}
			0xf6523eff \{Sound = 'Tut_Vox_Freeform_08_VOX'}
			0xf6523eff \{Sound = 'Tut_Vox_Freeform_09_VOX'}
			0xf6523eff \{Sound = 'Tut_Vox_Freeform_10_VOX'}
			0xf6523eff \{Sound = 'Tut_Vox_Highway_01_VOX'}
			0xf6523eff \{Sound = 'Tut_Vox_Highway_02_VOX'}
			0xf6523eff \{Sound = 'Tut_Vox_Highway_03_VOX'}
			0xf6523eff \{Sound = 'Tut_Vox_Highway_04_VOX'}
			0xf6523eff \{Sound = 'Tut_Vox_Highway_05_VOX'}
			0xf6523eff \{Sound = 'Tut_Vox_Highway_06_VOX'}
			0xf6523eff \{Sound = 'Tut_Vox_Highway_07_VOX'}
			0xf6523eff \{Sound = 'Tut_Vox_HitNotes_01_VOX'}
			0xf6523eff \{Sound = 'Tut_Vox_HitNotes_02_VOX'}
			0xf6523eff \{Sound = 'Tut_Vox_HitNotes_03_VOX'}
			0xf6523eff \{Sound = 'Tut_Vox_HitNotes_04_VOX'}
			0xf6523eff \{Sound = 'Tut_Vox_HitNotes_05_VOX'}
			0xf6523eff \{Sound = 'Tut_Vox_HitNotes_06_VOX'}
			0xf6523eff \{Sound = 'Tut_Vox_HitNotes_07_VOX'}
			0xf6523eff \{Sound = 'Tut_Vox_HitNotes_08_VOX'}
			0xf6523eff \{Sound = 'Tut_Vox_HitNotes_09_VOX'}
			0xf6523eff \{Sound = 'Tut_Vox_HitNotes_10_VOX'}
			0xf6523eff \{Sound = 'Tut_Vox_HitNotes_11_VOX'}
			0xf6523eff \{Sound = 'Tut_Vox_Intro_01_VOX'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Vox_Intro_02_VOX'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Vox_Intro_03_VOX'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Vox_Meter_01_VOX'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Vox_Meter_02_VOX'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Vox_Meter_03_VOX'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Vox_Meter_04_VOX'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Vox_Starpower_01_VOX'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Vox_Starpower_02_VOX'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Vox_Starpower_03_VOX'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Vox_Starpower_04_VOX'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Vox_Starpower_05_VOX'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Vox_Starpower_06_VOX'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Vox_Starpower_07_VOX'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Vox_Starpower_08_VOX'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Vox_Starpower_09_VOX'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Vox_Starpower_10_VOX'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Vox_Words_01_VOX'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Vox_Words_02_VOX'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Vox_Words_03_VOX'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Vox_Words_04_VOX'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Vox_Words_05_VOX'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Vox_Words_06_VOX'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Vox_Words_07_VOX'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Vox_Words_08_VOX'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Vox_Words_09_VOX'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Vox_Words_10_VOX'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Vox_Words_11_VOX'
				Heap = 0xc39f2ba1}
			case rs_introduction_lesson
			0xf6523eff \{Sound = 'Tut_RS_QuickStart_01_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_QuickStart_02_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_QuickStart_03_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_QuickStart_04_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_QuickStart_05_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_QuickStart_06_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_QuickStart_07_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_QuickStart_08_BAS'
				Heap = 0xc39f2ba1}
			<0x8d17cebe> = 1
			<0x9bcc0bca> = 1
			case rs_lead_and_bass_lesson
			0xf6523eff \{Sound = 'Tut_RS_LeadBass_01_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_LeadBass_02_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_LeadBass_03_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_OpenStrum_01_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_OpenStrum_02_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_OpenStrum_03_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Gtr_OpenNotes_11_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Scale_01_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Scale_02_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Scale_03_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Scale_04_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Scale_05_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Octave_01_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Octave_02_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Octave_03_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Octave_04_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Octave_05_BAS'
				Heap = 0xc39f2ba1}
			<0x8d17cebe> = 1
			<0x9bcc0bca> = 1
			case rs_rhythm_lesson
			0xf6523eff \{Sound = 'Tut_RS_Rhythm_01_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Rhythm_02_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Rhythm_03_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Rhythm_04_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Rhythm_05_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Effects_01_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Effects_02_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Effects_03_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Effects_04_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Effects_05_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Effects_06_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Effects_07_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_StepRec_04_BAS'
				Heap = 0xc39f2ba1}
			<0x8d17cebe> = 1
			<0x9bcc0bca> = 1
			case rs_drums_lesson
			0xf6523eff \{Sound = 'Tut_RS_Drums_01_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Drums_02_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Drums_03_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Drums_04_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Drums_05_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Drums_06_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Drums_07_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Drums_08_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Drums_09_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Drums_10_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Drums_11_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Drums_12_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Drums_13_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Drums_14_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Drums_15_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_Vs_BattleTilt_04_BAS'
				Heap = 0xc39f2ba1}
			<0x8d17cebe> = 1
			<0x9bcc0bca> = 1
			case rs_melody_lesson
			0xf6523eff \{Sound = 'Tut_RS_Melody_01_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Melody_02_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Melody_03_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Melody_04_BAS'
				Heap = 0xc39f2ba1}
			<0x8d17cebe> = 1
			<0x9bcc0bca> = 1
			case rs_recording_lesson
			0xf6523eff \{Sound = 'Tut_RS_Record_01_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Record_02_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Record_18_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Record_10_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Record_17_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Record_04_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Record_05_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Record_19_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Record_20_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Record_21_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Record_14_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Record_12_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Record_07_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Record_08_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Record_09_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Record_22_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Record_11_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Record_13_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Record_15_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Record_16_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_AdvGtr_10_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_GHTunes_01_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_GHTunes_02_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_GHTunes_03_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_GHTunes_04_BAS'
				Heap = 0xc39f2ba1}
			<0x8d17cebe> = 1
			<0x9bcc0bca> = 1
			case rs_pro_guitar_lesson
			0xf6523eff \{Sound = 'Tut_RS_AdvGtr_01_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_AdvGtr_02_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_AdvGtr_03_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_AdvGtr_04_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_AdvGtr_05_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_AdvGtr_06_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_AdvGtr_07_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_AdvGtr_08_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_AdvGtr_09_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_AdvGtr_10_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_AdvGtr_11_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_AdvGtr_12_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_AdvGtr_13_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_AdvGtr_14_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_AdvGtr_15_BAS'
				Heap = 0xc39f2ba1}
			<0x8d17cebe> = 1
			<0x9bcc0bca> = 1
			case rs_advanced_tools_lesson
			0xf6523eff \{Sound = 'Tut_RS_Arpeg_01_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Arpeg_02_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Arpeg_03_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Drums_04_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_DrumMach_01_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_DrumMach_02_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_DrumMach_03_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_AdvGtr_07_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_AdvGtr_10_BAS'
				Heap = 0xc39f2ba1}
			<0x8d17cebe> = 1
			<0x9bcc0bca> = 1
			case rs_ghmix_editing_lesson
			0xf6523eff \{Sound = 'Tut_RS_GHMix_01_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_GHMix_02_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_LiveRec_01_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_LiveRec_02_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_LiveRec_03_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_LiveRec_04_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_LiveRec_05_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_StepRec_01_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_StepRec_02_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_StepRec_03_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_StepRec_04_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_StepRec_05_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_StepRec_06_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Del_01_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Del_02_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Del_03_BAS'
				Heap = 0xc39f2ba1}
			<0x8d17cebe> = 1
			<0x9bcc0bca> = 1
			case rs_ghmix_pro_techniques_tools_lesson
			0xf6523eff \{Sound = 'Tut_RS_Copy_01_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Copy_02_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Copy_03_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Copy_04_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Loop_01_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Loop_02_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Loop_03_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Nudge_01_BAS'
				Heap = 0xc39f2ba1}
			0xf6523eff \{Sound = 'Tut_RS_Nudge_02_BAS'
				Heap = 0xc39f2ba1}
			<0x8d17cebe> = 1
			<0x9bcc0bca> = 1
		endswitch
		if (<0x8d17cebe> = 1)
			0x6057a46c \{0x044dc3cd = 0}
		else
			0x28919004
		endif
		if (<0x9bcc0bca> = 1)
			0xf2760840
		endif
		Change 0x267fcbe7 = <tutorial>
		PopMemProfile
		return
		case 0x64912155
		printf \{'Reloading SFX for firstboot'}
		LoadSound \{'checkbox_check_sfx'}
		LoadSound \{'CheckBox_Check_SFX_2'}
		LoadSound \{'checkbox_sfx'}
		LoadSound \{'Cash'}
		LoadSound \{'Purchase_Item'}
		LoadSound \{'Menu_Warning_01'}
		LoadSound \{'Menu_ZoomIn_Career'}
		LoadSound \{'Menu_ZoomOut_Career'}
		LoadSound \{'Menu_ZoomIn_Options'}
		LoadSound \{'Menu_ZoomOut_Options'}
		LoadSound \{'Menu_ZoomIn_HeadToHead'}
		LoadSound \{'Menu_ZoomOut_HeadToHead'}
		LoadSound \{'Menu_Options_Sound_Select'}
		LoadSound \{'Menu_Options_Sound_Back'}
		LoadSound \{'Menu_Options_Sound_Fader_Move'}
		LoadSound \{'Menu_Options_Sound_EQKnob_Move'}
		LoadSound \{'Menu_Options_Sound_DolbyDigitalDisable'}
		LoadSound \{'Menu_Options_Sound_DolbyDigitalEnable'}
		LoadSound \{'Menu_EnterName_Select'}
		LoadSound \{'Menu_EnterName_Scroll_1'}
		LoadSound \{'Menu_EnterName_Scroll_3'}
		LoadSound \{'Menu_EnterName_Finish'}
		LoadSound \{'Menu_EnterName_Back'}
		LoadSound \{'Menu_ColorWheel_GradientSelect'}
		LoadSound \{'Menu_ColorWheel_Rotate'}
		LoadSound \{'Menu_ColorWheel_HighLight_Up_Down_3'}
		LoadSound \{'Menu_ColorWheel_Deselect_PiePiece'}
		LoadSound \{'Menu_Cheat_Red'}
		LoadSound \{'Menu_Cheat_Yellow'}
		LoadSound \{'Menu_Cheat_Blue'}
		LoadSound \{'Menu_Cheat_Green'}
		LoadSound \{'Menu_Main_Intro'}
		LoadSound \{'Guitar_Select_Affirmation_1'}
		LoadSound \{'EXT_MD_Crowd_Good_Loop'}
		LoadSound \{'Menu_QuickPlay_SelectSong'}
		LoadSound \{'Menu_QuickPlay_RemoveAllSongs'}
		LoadSound \{'Song_Affirmation_01'}
		LoadSound \{'Song_Affirmation_02'}
		LoadSound \{'Song_Affirmation_03'}
		LoadSound \{'Song_Affirmation_04'}
		LoadSound \{'Song_Affirmation_05'}
		LoadSound \{'Song_Affirmation_06'}
		LoadSound \{'Mic_Select_Affirmation_01'}
		LoadSound \{'Drum_Select_Affirmation_01'}
		LoadSound \{'Bass_Select_Affirmation_02'}
		LoadSound \{'Silence_Front_End_Crowd_Loop'}
		LoadSound \{'Pre_Cutscence_SFX'}
		LoadSound \{'Menu_EnterName_Caps'}
		LoadSound \{'Fly_In_Whoosh'}
		LoadSound \{'Band_leader_affirmation'}
		0xf301e1c3
		Change \{0x27707361 = FrontEnd}
		PopMemProfile
		return
		case FrontEnd
		printf \{'Reloading SFX for frontend'}
		LoadSound \{'checkbox_check_sfx'}
		LoadSound \{'CheckBox_Check_SFX_2'}
		LoadSound \{'checkbox_sfx'}
		LoadSound \{'Cash'}
		LoadSound \{'Purchase_Item'}
		LoadSound \{'Menu_Warning_01'}
		LoadSound \{'Menu_ZoomIn_Career'}
		LoadSound \{'Menu_ZoomOut_Career'}
		LoadSound \{'Menu_ZoomIn_Options'}
		LoadSound \{'Menu_ZoomOut_Options'}
		LoadSound \{'Menu_ZoomIn_HeadToHead'}
		LoadSound \{'Menu_ZoomOut_HeadToHead'}
		LoadSound \{'Menu_Options_Sound_Select'}
		LoadSound \{'Menu_Options_Sound_Back'}
		LoadSound \{'Menu_Options_Sound_Fader_Move'}
		LoadSound \{'Menu_Options_Sound_EQKnob_Move'}
		LoadSound \{'Menu_Options_Sound_DolbyDigitalDisable'}
		LoadSound \{'Menu_Options_Sound_DolbyDigitalEnable'}
		LoadSound \{'Menu_EnterName_Select'}
		LoadSound \{'Menu_EnterName_Scroll_1'}
		LoadSound \{'Menu_EnterName_Scroll_3'}
		LoadSound \{'Menu_EnterName_Finish'}
		LoadSound \{'Menu_EnterName_Back'}
		LoadSound \{'Menu_ColorWheel_GradientSelect'}
		LoadSound \{'Menu_ColorWheel_Rotate'}
		LoadSound \{'Menu_ColorWheel_HighLight_Up_Down_3'}
		LoadSound \{'Menu_ColorWheel_Deselect_PiePiece'}
		LoadSound \{'Menu_Cheat_Red'}
		LoadSound \{'Menu_Cheat_Yellow'}
		LoadSound \{'Menu_Cheat_Blue'}
		LoadSound \{'Menu_Cheat_Green'}
		LoadSound \{'Menu_Main_Intro'}
		LoadSound \{'EXT_MD_Crowd_Good_Loop'}
		LoadSound \{'Guitar_Select_Affirmation_1'}
		LoadSound \{'Menu_QuickPlay_SelectSong'}
		LoadSound \{'Menu_QuickPlay_RemoveAllSongs'}
		LoadSound \{'Song_Affirmation_01'}
		LoadSound \{'Song_Affirmation_02'}
		LoadSound \{'Song_Affirmation_03'}
		LoadSound \{'Song_Affirmation_04'}
		LoadSound \{'Song_Affirmation_05'}
		LoadSound \{'Song_Affirmation_06'}
		LoadSound \{'Mic_Select_Affirmation_01'}
		LoadSound \{'Drum_Select_Affirmation_01'}
		LoadSound \{'Bass_Select_Affirmation_02'}
		LoadSound \{'Pre_Cutscence_SFX'}
		LoadSound \{'Menu_EnterName_Caps'}
		LoadSound \{'Fly_In_Whoosh'}
		LoadSound \{'Band_leader_affirmation'}
		PopMemProfile
		return
		case soundboard
		printf \{'Reloading SFX for soundboard'}
		LoadSound \{'SB_hello'}
		LoadSound \{'SB_hey'}
		LoadSound \{'SB_metallica'}
		LoadSound \{'SB_question'}
		LoadSound \{'SB_killemall'}
		LoadSound \{'SB_feelinggood'}
		LoadSound \{'SB_havingfun'}
		LoadSound \{'SB_youfeelit'}
		LoadSound \{'SB_more1'}
		LoadSound \{'SB_more2'}
		LoadSound \{'SB_more3'}
		LoadSound \{'SB_outthere'}
		LoadSound \{'SB_whatdyousay'}
		LoadSound \{'SB_areyousure1'}
		LoadSound \{'SB_areyousure2'}
		LoadSound \{'SB_ohyeah1'}
		LoadSound \{'SB_ohyeah2'}
		LoadSound \{'SB_ohyeah3'}
		LoadSound \{'SB_yeah1'}
		LoadSound \{'SB_yeah2'}
		LoadSound \{'SB_yeah3'}
		LoadSound \{'SB_yeah4'}
		LoadSound \{'SB_no1'}
		LoadSound \{'SB_no2'}
		LoadSound \{'SB_no3'}
		LoadSound \{'SB_no4'}
		LoadSound \{'SB_goodtohear'}
		LoadSound \{'SB_thatsright'}
		PopMemProfile
		return
		case jammode
		printf \{'Reloading SFX for Music Studio'}
		LoadSound \{'Menu_EnterName_Select'}
		LoadSound \{'Menu_EnterName_Scroll_1'}
		LoadSound \{'Menu_EnterName_Finish'}
		LoadSound \{'Menu_EnterName_Back'}
		LoadSound \{'Menu_EnterName_Caps'}
		0x6057a46c 0x044dc3cd = <0x044dc3cd>
		0xf2760840
		Change 0x055c17e2 = <0x044dc3cd>
		if (<0x044dc3cd> = 0)
			PopMemProfile
			printf \{'Do not load crowd sounds'}
			return
		endif
		default
		printf \{'**************************************'}
		printf \{'**************************************'}
		printf \{'**************************************'}
		printf \{'*** Reloading SFX for unknown mode ***'}
		printf \{'**************************************'}
		printf \{'**************************************'}
		printf \{'**************************************'}
	endswitch
	GetPakManCurrent \{map = zones}
	if (<pak> != z_studio && <pak> != z_studio2 && <pak> != z_tool && <pak> != z_credits && <pak> != z_icecave && <pak> != z_soundcheck2)
		0x8882d576
		0xa755e7bd venuesize = <venuesize>
		0x2c42c3a8 parts = [{val = 'Crowd_Clap'} , {val = <venuesize>}] 0x329413dd = 6 Heap = 0xc39f2ba1
		0x2c42c3a8 parts = [{val = <0x191b609a>} , {val = 'Crowd_Whistle'}] 0x329413dd = 20 Heap = 0xc39f2ba1
		0x2c42c3a8 parts = [{val = 'Crowd_Cheer'} , {val = <0x191b609a>} , {val = 'SG'}] 0x329413dd = 10 Heap = 0xc39f2ba1
		0x2c42c3a8 parts = [{val = 'Crowd_Cheer'} , {val = <0x191b609a>} , {val = 'GR'}] 0x329413dd = 10 Heap = 0xc39f2ba1
		switch <venuesize>
			case 'Small_INT'
			printf \{'Gathering a small group'}
			LoadSound 'INT_SM_Crowd_Applause_01' Heap = <0x6dbf77b0>
			LoadSound 'INT_SM_Crowd_Swell_SH_03' Heap = <0x6dbf77b0>
			LoadSound 'INT_SM_Crowd_Swell_MD_01' Heap = <0x6dbf77b0>
			LoadSound 'INT_SM_Crowd_Swell_LG_02' Heap = <0x6dbf77b0>
			LoadSound 'SM_Crowd_Neutral_To_Good_03' Heap = <0x6dbf77b0>
			LoadSound 'SM_Crowd_Good_To_Neutral_03' Heap = <0x6dbf77b0>
			LoadSound 'SM_Crowd_Bad_To_Neutral_01' Heap = <0x6dbf77b0>
			LoadSound 'INT_SM_Crowd_Bad_Loop' Heap = <0x6dbf77b0>
			LoadSound 'INT_SM_Crowd_Good_Loop' Heap = <0x6dbf77b0>
			LoadSound 'INT_SM_Crowd_Neutral_Loop' Heap = <0x6dbf77b0>
			LoadSound \{'SM_Crowd_Neutral_To_Bad_03'
				Heap = 0xc39f2ba1}
			case 'Medium_EXT'
			printf \{'Filling the area with a crowd'}
			LoadSound 'EXT_MD_Crowd_Applause_02' Heap = <0x6dbf77b0>
			LoadSound 'EXT_MD_Crowd_Swell_SH_01' Heap = <0x6dbf77b0>
			LoadSound 'EXT_MD_Crowd_Swell_MD_02' Heap = <0x6dbf77b0>
			LoadSound 'EXT_MD_Crowd_Swell_LG_02' Heap = <0x6dbf77b0>
			LoadSound 'MD_Crowd_Neutral_To_Good_01' Heap = <0x6dbf77b0>
			LoadSound 'MD_Crowd_Good_To_Neutral_01' Heap = <0x6dbf77b0>
			LoadSound 'MD_Crowd_Bad_To_Neutral_01' Heap = <0x6dbf77b0>
			LoadSound 'EXT_MD_Crowd_Bad_Loop' Heap = <0x6dbf77b0>
			LoadSound 'EXT_MD_Crowd_Good_Loop' Heap = <0x6dbf77b0>
			LoadSound 'EXT_MD_Crowd_Neutral_Loop' Heap = <0x6dbf77b0>
			LoadSound \{'MD_Crowd_Neutral_To_Bad_02'
				Heap = 0xc39f2ba1}
			case 'Large_EXT'
			printf \{'Gathering the masses'}
			LoadSound 'EXT_LG_Crowd_Applause_01' Heap = <0x6dbf77b0>
			LoadSound 'EXT_LG_Crowd_Swell_SH_01' Heap = <0x6dbf77b0>
			LoadSound 'EXT_LG_Crowd_Swell_MD_01' Heap = <0x6dbf77b0>
			LoadSound 'EXT_LG_Crowd_Swell_LG_02' Heap = <0x6dbf77b0>
			LoadSound 'LG_Crowd_Neutral_To_Good_01' Heap = <0x6dbf77b0>
			LoadSound 'LG_Crowd_Good_To_Neutral_01' Heap = <0x6dbf77b0>
			LoadSound 'LG_Crowd_Bad_To_Neutral_01' Heap = <0x6dbf77b0>
			LoadSound 'EXT_LG_Crowd_Bad_Loop' Heap = <0x6dbf77b0>
			LoadSound 'EXT_LG_Crowd_Good_Loop' Heap = <0x6dbf77b0>
			LoadSound 'EXT_LG_Crowd_Neutral_Loop' Heap = <0x6dbf77b0>
			LoadSound \{'LG_Crowd_Neutral_To_Bad_01'
				Heap = 0xc39f2ba1}
			default
			printf 'Waiting for anyone to gather' Heap = <0x6dbf77b0>
			LoadSound 'EXT_MD_Crowd_Applause_02' Heap = <0x6dbf77b0>
			LoadSound 'EXT_MD_Crowd_Swell_SH_01' Heap = <0x6dbf77b0>
			LoadSound 'EXT_MD_Crowd_Swell_MD_02' Heap = <0x6dbf77b0>
			LoadSound 'EXT_MD_Crowd_Swell_LG_02' Heap = <0x6dbf77b0>
			LoadSound 'MD_Crowd_Neutral_To_Good_01' Heap = <0x6dbf77b0>
			LoadSound 'MD_Crowd_Good_To_Neutral_01' Heap = <0x6dbf77b0>
			LoadSound 'MD_Crowd_Bad_To_Neutral_01' Heap = <0x6dbf77b0>
			LoadSound 'EXT_MD_Crowd_Bad_Loop' Heap = <0x6dbf77b0>
			LoadSound 'EXT_MD_Crowd_Good_Loop' Heap = <0x6dbf77b0>
			LoadSound 'EXT_MD_Crowd_Neutral_Loop' Heap = <0x6dbf77b0>
			LoadSound \{'MD_Crowd_Neutral_To_Bad_02'
				Heap = 0xc39f2ba1}
		endswitch
	endif
	PopMemProfile
endscript

script 0x28919004 
	LoadSound \{'bad_note1'}
	LoadSound \{'bad_note2'}
	LoadSound \{'bad_note3'}
	LoadSound \{'bad_note4'}
	LoadSound \{'bad_note6'}
	LoadSound \{'notes_ripple_up_01'}
	LoadSound \{'Highway_Rise'}
	LoadSound \{'UI_Song_Intro_Kick'}
	LoadSound \{'You_Rock'}
	LoadSound \{'sp_awarded1'}
	LoadSound \{'sp_awarded2'}
	LoadSound \{'Finish_Chord'}
endscript

script 0x04a6251d 
	LoadSound \{'heavyrockcrash_lvl_10_01'}
	LoadSound \{'heavyrockcrash_lvl_6_01'}
	LoadSound \{'heavyrockcrash_lvl_8_01'}
	LoadSound \{'heavyrockfltom_lvl_10_01'}
	LoadSound \{'heavyrockfltom_lvl_4_01'}
	LoadSound \{'heavyrockfltom_lvl_6_01'}
	LoadSound \{'heavyrockfltom_lvl_8_01'}
	LoadSound \{'heavyrockhhclosed_lvl_4_01'}
	LoadSound \{'heavyrockhhclosed_lvl_6_01'}
	LoadSound \{'heavyrockhhclosed_lvl_8_01'}
	LoadSound \{'heavyrockhhopen_lvl_10_01'}
	LoadSound \{'heavyrockhhopen_lvl_9_01'}
	LoadSound \{'heavyrockhitom_lvl_10_01'}
	LoadSound \{'heavyrockhitom_lvl_4_01'}
	LoadSound \{'heavyrockhitom_lvl_6_01'}
	LoadSound \{'heavyrockhitom_lvl_8_01'}
	LoadSound \{'heavyrockkick_lvl_10_01'}
	LoadSound \{'heavyrockride_lvl_10_01'}
	LoadSound \{'heavyrockride_lvl_6_01'}
	LoadSound \{'heavyrockride_lvl_8_01'}
	LoadSound \{'heavyrocksnare_lvl_10_01'}
	LoadSound \{'heavyrocksnare_lvl_12_03'}
	LoadSound \{'heavyrocksnare_lvl_2_01'}
	LoadSound \{'heavyrocksnare_lvl_4_01'}
	LoadSound \{'heavyrocksnare_lvl_6_01'}
	LoadSound \{'heavyrocksnare_lvl_8_01'}
endscript

script 0x6057a46c 
	printf \{'Loading general gameplay sfx'}
	LoadSound \{'Menu_Options_Sound_Select'}
	LoadSound \{'Menu_Options_Sound_Fader_Move'}
	LoadSound \{'JamMode_DPad_Play'}
	LoadSound \{'JamMode_DPad_RecordingStart'}
	LoadSound \{'JamMode_DPad_RecordingStop'}
	LoadSound \{'JamMode_DPad_Stop'}
	LoadSound \{'bad_note1'}
	LoadSound \{'bad_note2'}
	LoadSound \{'bad_note3'}
	LoadSound \{'bad_note4'}
	LoadSound \{'bad_note6'}
	LoadSound \{'bad_note_bass1'}
	LoadSound \{'bad_note_bass2'}
	LoadSound \{'bad_note_bass4'}
	LoadSound \{'bad_note_bass6'}
	LoadSound \{'Bad_Note_Tom1'}
	LoadSound \{'Bad_Note_HiHat1'}
	LoadSound \{'Bad_Note_Kick1'}
	LoadSound \{'Jam_Pause_Panel_Out'}
	LoadSound \{'Jam_Pause_Panel_In'}
	LoadSound \{'Menu_Warning_01'}
	LoadSound \{'GHTunes_Back'
		Heap = 0xc39f2ba1}
	LoadSound \{'GHTunes_Menu_Scroll'
		Heap = 0xc39f2ba1}
	LoadSound \{'GHTunes_Select'
		Heap = 0xc39f2ba1}
	LoadSound \{'Menu_JamMode_FXHUD_Off'
		Heap = 0xc39f2ba1}
	LoadSound \{'Menu_JamMode_FXHUD_On'
		Heap = 0xc39f2ba1}
	LoadSound \{'Menu_JamMode_SongWizard_OFF'
		Heap = 0xc39f2ba1}
	LoadSound \{'Menu_JamMode_SongWizard_ON'
		Heap = 0xc39f2ba1}
	LoadSound \{'Highway_Rise'}
	LoadSound \{'UI_Song_Intro_Kick'}
	LoadSound \{'notes_ripple_up_01'}
	LoadSound \{'StickClickLarge'}
	LoadSound \{'StickClickMed'}
	LoadSound \{'StickClickSmall'}
	LoadSound \{'HiHatClosed01'}
	LoadSound \{'UI_SFX_50_Note_Streak'}
	LoadSound \{'You_Rock'
		Heap = 0xc39f2ba1}
	LoadSound \{'Crowd_Fail_Song'
		Heap = 0xc39f2ba1}
	LoadSound \{'sp_awarded1'
		Heap = 0xc39f2ba1}
	LoadSound \{'sp_awarded2'
		Heap = 0xc39f2ba1}
	LoadSound \{'Finish_Chord'
		Heap = 0xc39f2ba1}
	printf \{'Loading bass guitar sounds'}
	LoadSound \{'fb_b_fingered_A1_s1_f5_01'}
	LoadSound \{'fb_b_fingered_Ab2_s1_f16_01'}
	LoadSound \{'fb_b_fingered_B3_s4_f16_01'}
	LoadSound \{'fb_b_fingered_C3_s4_f5_01'}
	LoadSound \{'fb_b_fingered_D2_s2_f5_01'}
	LoadSound \{'fb_b_fingered_Db3_s2_f16_01'}
	LoadSound \{'fb_b_fingered_G2_s3_f5_01'}
	LoadSound \{'fb_b_fingered_Gb3_s3_f16_01'}
	LoadSound \{'fj_b_slap_A1_s1_f5_01'}
	LoadSound \{'fj_b_slap_Ab2_s1_f16_01'}
	LoadSound \{'fj_b_slap_B3_s4_f16_01'}
	LoadSound \{'fj_b_slap_C3_s4_f5_01'}
	LoadSound \{'fj_b_slap_D2_s2_f5_01'}
	LoadSound \{'fj_b_slap_Db3_s2_f16_01'}
	LoadSound \{'fj_b_slap_G2_s3_f5_01'}
	LoadSound \{'fj_b_slap_Gb3_s3_f16_01'}
	if (<0x044dc3cd> = 0)
		0x0ec8e62e
	endif
endscript

script 0xf2760840 
	printf \{'Music Studio - do selective loading'}
	PushMemProfile \{'LoadJamDynamicSounds'}
	0x4bb67432 \{Heap = 0xc39f2ba1}
	0x1d252f54 \{Heap = 0xc39f2ba1}
	0x388acbb7
	0x763b2917
	PopMemProfile
endscript

script 0x90317422 
	printf \{'Loading remaining cheat SFX'}
	if ($0xae697c1f = 1)
		printf \{'Cheat SFX already loaded, aborting'}
		return
	endif
	Change \{0xae697c1f = 1}
	LoadSound \{'Cheat_Guitar_Note_01'}
	LoadSound \{'Cheat_Guitar_Note_02'}
	LoadSound \{'Cheat_Guitar_Note_03'}
	LoadSound \{'Cheat_Guitar_Note_04'}
	LoadSound \{'Cheat_Guitar_Note_05'}
	LoadSound \{'Cheat_Guitar_Chord_01'}
	LoadSound \{'Cheat_Guitar_Chord_02'}
	LoadSound \{'Cheat_Guitar_Chord_03'}
	LoadSound \{'Cheat_Guitar_Chord_04'}
	LoadSound \{'Cheat_Guitar_Chord_05'}
	LoadSound \{'Cheat_Guitar_Chord_06'}
	LoadSound \{'Cheat_Guitar_Chord_07'}
	LoadSound \{'Cheat_Guitar_Chord_08'}
	LoadSound \{'Cheat_Guitar_Chord_09'}
	LoadSound \{'Cheat_Guitar_Chord_10'}
	LoadSound \{'Cheat_Guitar_Chord_11'}
	LoadSound \{'Cheat_Guitar_Chord_12'}
endscript

script 0x2c42c3a8 \{0x329413dd = 0
		Heap = 0xb5d472b2}
	PushMemProfile \{'LoadCrowdSounds'}
	<0x69153c11> = '%a0%b'
	<0x07093dc6> = '%a%b'
	GetArraySize <parts>
	i = 1
	begin
	<0x3a649032> = <0x69153c11>
	if (<i> >= 10)
		<0x3a649032> = <0x07093dc6>
	endif
	formatText TextName = sound_id '%a_' a = (<parts> [0].val)
	<0xe198751a> = 1
	begin
	formatText TextName = sound_id '%a%b_' a = <sound_id> b = (<parts> [<0xe198751a>].val)
	<0xe198751a> = (<0xe198751a> + 1)
	repeat (<array_Size> -1)
	formatText TextName = sound_id <0x3a649032> a = <sound_id> b = <i>
	LoadSound <sound_id> Heap = <Heap>
	i = (<i> + 1)
	repeat <0x329413dd>
	PopMemProfile
endscript
