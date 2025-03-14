cheat_sim_mode = cheat_on_1
cheat_endless_slash = cheat_on_2
CHEAT_PERFECT_RAIL = cheat_on_3
cheat_stats_13 = cheat_on_4
CHEAT_COOL_SPECIAL_TRICKS = cheat_on_5
cheat_perfect_manual = cheat_on_7
cheat_unlimited_focus = cheat_on_20
CHEAT_PERFECT_NAIL = cheat_on_19
cheat_mini_skater = cheat_on_14
cheat_no_bails = cheat_on_8
CHEAT_INVISIBLE = cheat_on_17
CHEAT_INVISIBLE_BOARD = cheat_on_18
CHEAT_SUPER_CHECK = cheat_on_13

script client_toggle_cheat 
	if gotparam \{on}
		setglobalflag flag = $<cheat_flag>
	else
		unsetglobalflag flag = $<cheat_flag>
	endif
endscript

script toggle_cheat 
	if innetgame
		if OnServer
			if (getglobalflag flag = $<cheat_flag>)
				BroadcastOmnigon <...> off
			else
				BroadcastOmnigon <...> on
			endif
		endif
	endif
	if innetgame
		if NOT OmnigonAllowed <...>
			return
		endif
	endif
	if innetgame
		if NOT LastBroadcastedOmnigonWas <...>
			return
		endif
	endif
	if LastBroadcastedOmnigonWas cheat_flag = CHEAT_MADE_UP
		return
	endif
	gettags
	if (getglobalflag flag = $<cheat_flag>)
		unsetglobalflag flag = $<cheat_flag>
		if gotparam off_callback
			<off_callback> <...>
		endif
	else
		setglobalflag flag = $<cheat_flag>
		if gotparam on_callback
			<on_callback> <...>
		endif
	endif
endscript

script cheat_playsound_good 
	soundevent \{event = menu_cheat_Good_sfx}
endscript

script cheat_playsound_bad 
	soundevent \{event = menu_cheat_bad_sfx}
endscript

script cheat_xxx 
	printf \{"Cheat without a cheatscript"}
endscript

script cheat_select_shift 
	change \{select_shift = 1}
endscript
antileaderboard_cheats = [
	$cheat_unlimited_focus
	$cheat_perfect_manual
	$CHEAT_PERFECT_RAIL
	$CHEAT_PERFECT_NAIL
	$cheat_endless_slash
	$cheat_no_bails
	$CHEAT_SUPER_CHECK
]

script has_active_antileaderboard_cheats 
	getarraysize \{$antileaderboard_cheats}
	<i> = 0
	begin
	if getglobalflag flag = ($antileaderboard_cheats [<i>])
		setglobalflag \{flag = $HAS_ANTILEADERBOARD_CHEAT_ACTIVE}
		return \{true}
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	unsetglobalflag \{flag = $HAS_ANTILEADERBOARD_CHEAT_ACTIVE}
	return \{false}
endscript
antivideoeditor_cheats = [
	$CHEAT_INVISIBLE
	$cheat_mini_skater
	$CHEAT_INVISIBLE_BOARD
]

script has_active_video_editor_cheats 
	getarraysize \{$antivideoeditor_cheats}
	<i> = 0
	begin
	if getglobalflag flag = ($antivideoeditor_cheats [<i>])
		setglobalflag \{flag = $HAS_ANTIVIDEOEDITOR_CHEAT_ACTIVE}
		return \{true}
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	unsetglobalflag \{flag = $HAS_ANTIVIDEOEDITOR_CHEAT_ACTIVE}
	return \{false}
endscript

script kill_singleplayer_gameplay_cheats 
	getarraysize \{$Cheat_Menu_Array}
	<i> = 0
	begin
	unsetglobalflag flag = ($Cheat_Menu_Array [<i>].flag)
	if structurecontains structure = ($Cheat_Menu_Array [<i>]) update
		if scriptexists ($Cheat_Menu_Array [<i>].update)
			($Cheat_Menu_Array [<i>].update)
		endif
	endif
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script cheat_unlock_mca 
	setglobalflag \{flag = $SKATER_UNLOCKED_MCA}
	careerfunc \{func = setspecialtricklocked
		params = {
			trick_id = Trick_MCASpecialManual
			locked = false
		}}
	careerfunc \{func = setspecialtrickpurchased
		params = {
			trick_id = Trick_MCASpecialManual
			purchased = true
		}}
endscript

script cheat_unlock_the_luchador 
	setglobalflag \{flag = $SKATER_UNLOCKED_THE_LUCHADOR}
	careerfunc \{func = setspecialtricklocked
		params = {
			trick_id = Trick_LuchadorSpecial
			locked = false
		}}
	careerfunc \{func = setspecialtrickpurchased
		params = {
			trick_id = Trick_LuchadorSpecial
			purchased = true
		}}
endscript

script cheat_unlock_judy_nails 
	setglobalflag \{flag = $SKATER_UNLOCKED_JUDY_NAILS}
	careerfunc \{func = setspecialtricklocked
		params = {
			trick_id = Trick_GuitarHero
			locked = false
		}}
	careerfunc \{func = setspecialtrickpurchased
		params = {
			trick_id = Trick_GuitarHero
			purchased = true
		}}
endscript

script cheat_unlock_rube 
	setglobalflag \{flag = $SKATER_UNLOCKED_RUBE}
endscript

script cheat_unlock_spence 
	setglobalflag \{flag = $SKATER_UNLOCKED_SPENCE}
endscript

script cheat_unlock_cooper 
	setglobalflag \{flag = $SKATER_UNLOCKED_COOPER}
endscript

script cheat_unlock_bosco 
	setglobalflag \{flag = $SKATER_UNLOCKED_BOSCO}
endscript

script cheat_unlock_boneman 
	setglobalflag \{flag = $SKATER_UNLOCKED_BONEMAN}
endscript

script cheat_unlock_cam 
	setglobalflag \{flag = $SKATER_UNLOCKED_CAM}
endscript

script cheat_unlock_eric 
	setglobalflag \{flag = $SKATER_UNLOCKED_ERIC}
endscript

script cheat_unlock_eddie_x 
	setglobalflag \{flag = $SKATER_UNLOCKED_EDDIE_X}
endscript

script cheat_unlock_mad_dog 
	setglobalflag \{flag = $SKATER_UNLOCKED_MAD_DOG}
endscript

script cheat_unlock_mel 
	setglobalflag \{flag = $SKATER_UNLOCKED_MEL}
endscript

script cheat_unlock_shayne 
	setglobalflag \{flag = $SKATER_UNLOCKED_SHAYNE}
endscript

script cheat_unlock_tv_producer 
	setglobalflag \{flag = $SKATER_UNLOCKED_TV_PRODUCER}
endscript

script cheat_unlock_fun_items_script 
	setglobalflag \{flag = $CHEAT_UNLOCK_FUN_ITEMS}
endscript

script cheat_unlock_all_cas 
	setglobalflag \{flag = $CHEAT_UNLOCK_ALL_CAS_ITEMS}
endscript

script cheat_unlock_all_decks_script 
	setglobalflag \{flag = $cheat_unlock_all_decks}
endscript

script cheat_unlock_vans_dd66_chili_script 
	setglobalflag \{flag = $CHEAT_UNLOCK_VANS_DD66_CHILI}
endscript

script CHEAT_UNLOCK_VANS_script 
	setglobalflag \{flag = $CHEAT_UNLOCK_VANS}
endscript

script CHEAT_UNLOCK_NIXON_script 
	setglobalflag \{flag = $CHEAT_UNLOCK_NIXON}
endscript

script CHEAT_UNLOCK_ADIO_script 
	setglobalflag \{flag = $CHEAT_UNLOCK_ADIO}
endscript

script CHEAT_UNLOCK_BIRDHOUSE_script 
	setglobalflag \{flag = $CHEAT_UNLOCK_BIRDHOUSE}
endscript

script CHEAT_UNLOCK_ELEMENT_script 
	setglobalflag \{flag = $CHEAT_UNLOCK_ELEMENT}
endscript

script CHEAT_UNLOCK_QUIKSILVER_script 
	setglobalflag \{flag = $CHEAT_UNLOCK_QUIKSILVER}
endscript

script CHEAT_UNLOCK_VOLCOM_script 
	setglobalflag \{flag = $CHEAT_UNLOCK_VOLCOM}
endscript

script CHEAT_UNLOCK_DVS_script 
	setglobalflag \{flag = $CHEAT_UNLOCK_DVS}
endscript

script CHEAT_UNLOCK_ETNIES_script 
	setglobalflag \{flag = $CHEAT_UNLOCK_ETNIES}
endscript

script CHEAT_UNLOCK_ES_script 
	setglobalflag \{flag = $CHEAT_UNLOCK_ES}
endscript

script CHEAT_UNLOCK_VON_ZIPPER_script 
	setglobalflag \{flag = $CHEAT_UNLOCK_VON_ZIPPER}
endscript

script CHEAT_UNLOCK_ELECTRIC_script 
	setglobalflag \{flag = $CHEAT_UNLOCK_ELECTRIC}
endscript

script CHEAT_UNLOCK_DGK_script 
	setglobalflag \{flag = $CHEAT_UNLOCK_DGK}
endscript

script CHEAT_UNLOCK_INDEPENDENT_script 
	setglobalflag \{flag = $CHEAT_UNLOCK_INDEPENDENT}
endscript

script CHEAT_UNLOCK_ALMOST_script 
	setglobalflag \{flag = $CHEAT_UNLOCK_ALMOST}
endscript

script CHEAT_UNLOCK_MATIX_script 
	setglobalflag \{flag = $CHEAT_UNLOCK_MATIX}
endscript

script CHEAT_UNLOCK_FLIP_script 
	setglobalflag \{flag = $CHEAT_UNLOCK_FLIP}
endscript

script CHEAT_UNLOCK_HURLEY_script 
	setglobalflag \{flag = $CHEAT_UNLOCK_HURLEY}
endscript

script CHEAT_UNLOCK_BILLABONG_script 
	setglobalflag \{flag = $CHEAT_UNLOCK_BILLABONG}
endscript

script CHEAT_UNLOCK_EMERICA_script 
	setglobalflag \{flag = $CHEAT_UNLOCK_EMERICA}
endscript

script CHEAT_UNLOCK_ALL_MOVIES_script 
	setglobalflag \{flag = $CHEAT_UNLOCK_ALL_MOVIES}
endscript

script cheat_unlock_all_crib_themes_script 
	setglobalflag \{flag = $CHEAT_UNLOCKED_ALL_CRIB_THEMES}
endscript

script cheat_unlock_all_crib_pieces_script 
	setglobalflag \{flag = $CHEAT_UNLOCKED_ALL_CRIB_PIECES}
endscript

script cheat_unlock_wrigleys_vending_machine_script 
	setglobalflag \{flag = $CHEAT_UNLOCKED_WRIGLEYS_VENDING_MACHINE}
endscript

script cheat_unlock_all_rig_pieces_script 
	setglobalflag \{flag = $CHEAT_UNLOCKED_ALL_RIG_PIECES}
endscript

script cheat_unlock_super_check_script 
	setglobalflag \{flag = $CHEAT_UNLOCK_SUPER_CHECK}
endscript

script cheat_unlock_all_ve_overlays 
	getarraysize \{$video_editor_bink_list}
	i = 0
	begin
	careerfunc func = setvideooverlaystate params = {name = ($video_editor_bink_list [<i>]) state = unlocked}
	i = (<i> + 1)
	repeat <array_size>
endscript

script cheat_unlock_all_ve_effects 
	getarraysize \{$ve_effects_list}
	i = 0
	begin
	careerfunc func = setvideoeffectstate params = {name = ($ve_effects_list [<i>]) state = unlocked}
	i = (<i> + 1)
	repeat <array_size>
endscript

script cheat_unlock_fdr 
	set_game_area_locked_state \{game_area = philly_fdr
		state = unlock}
endscript

script cheat_unlock_lansdowne 
	set_game_area_locked_state \{game_area = balt_lansdowne
		state = unlock}
endscript

script cheat_unlock_air_and_space 
	set_game_area_locked_state \{game_area = dc_nasm
		state = unlock}
endscript

script cheat_unlock_endless_slash_grind 
	setglobalflag \{flag = $CHEAT_UNLOCK_ENDLESS_SLASH}
endscript

script cheat_unlock_perfect_rail_script 
	setglobalflag \{flag = $cheat_unlock_perfect_rail}
endscript

script cheat_unlock_perfect_manual_script 
	setglobalflag \{flag = $cheat_unlock_perfect_manual}
endscript

script cheat_unlock_unlimited_focus_script 
	setglobalflag \{flag = $cheat_unlock_unlimited_focus}
endscript

script cheat_perfect_ntt 
	setglobalflag \{flag = $CHEAT_UNLOCK_PERFECT_NAIL}
endscript

script cheat_unlock_and_own_all_specials_script 
	setglobalflag \{flag = $CHEAT_UNLOCK_AND_OWN_ALL_SPECIALS}
	GetConfigurableTricksFromType \{special}
	getarraysize <configurabletricks>
	<i> = 0
	begin
	<trick> = (<configurabletricks> [<i>])
	careerfunc func = setspecialtricklocked params = {trick_id = <trick> locked = false}
	careerfunc func = setspecialtrickpurchased params = {trick_id = <trick> purchased = true}
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script cheat_update_mini_skater 
	if getglobalflag \{flag = $cheat_mini_skater}
		printf \{'mini skater'}
		skater :obj_applyscaling \{x = 0.33
			y = 0.33
			z = 0.33}
	else
		printf \{'normal skater'}
		skater :obj_applyscaling \{x = 1
			y = 1
			z = 1}
	endif
endscript

script cheat_mini_skater_script 
	setglobalflag \{flag = $CHEAT_UNLOCK_MINI_SKATER}
endscript

script cheat_no_bails_script 
	setglobalflag \{flag = $CHEAT_UNLOCK_NO_BAILS}
endscript

script cheat_update_no_bails 
	if getglobalflag \{flag = $cheat_no_bails}
		change \{Bails_Disabled = 1}
		change \{ntt_ragdoll_bails = 0}
	else
		change \{Bails_Disabled = 0}
		change \{ntt_ragdoll_bails = 1}
	endif
endscript

script cheat_invisible_skater 
	setglobalflag \{flag = $CHEAT_UNLOCK_INVISIBLE}
endscript

script cheat_update_invisible_skater 
	if getglobalflag \{flag = $CHEAT_INVISIBLE}
		printf \{'skater invisible'}
		unsetglobalflag \{flag = $CHEAT_INVISIBLE_BOARD}
		skater :switchoffatomic \{all}
		skater :switchonatomic \{cas_board}
	else
		printf \{'skater visible'}
		skater :switchonatomic \{all}
	endif
endscript

script cheat_no_board 
	setglobalflag \{flag = $CHEAT_UNLOCK_INVISIBLE_BOARD}
endscript

script cheat_update_no_board 
	if getglobalflag \{flag = $CHEAT_INVISIBLE_BOARD}
		unsetglobalflag \{flag = $CHEAT_INVISIBLE}
		skater :switchonatomic \{all}
		skater :switchoffatomic \{cas_board}
	else
		skater :switchonatomic \{cas_board}
	endif
endscript

script cheat_full_stats_script 
	setglobalflag \{flag = $CHEAT_FULL_STATS}
	skater :recordcomponent_maxstats \{stat_type = all}
endscript

script cheat_give_skill_points 
	AwardSkillPoints \{skill_points = 50}
endscript

script cheat_give_skaters 
	setglobalflag \{flag = $CHEAT_UNLOCK_ALL_SKATERS}
endscript

script cheat_unlock_ingame_cheats 
	foreachin \{$Cheat_Menu_Array
		do = cheat_unlock_ingame_cheat}
endscript

script cheat_unlock_ingame_cheat 
	setglobalflag flag = <unlock_flag>
endscript

script unlock_all_cheats 
	cheat_unlock_ingame_cheats
	cheat_give_skaters
endscript

script cheat_always_combo_script 
	if NOT cd
		setglobalflag \{flag = $CHEAT_ALWAYS_COMBO}
	endif
endscript

script cheat_unlock_debug_menus 
	change \{ui_show_debug_menus = 1}
endscript

script check_cheat_from_keyboard 
	if NOT gotparam \{cancel}
		keyboard_current_string :text_getstring
		TryCheatString string = <string>
	endif
	destroy_onscreen_keyboard
	ui_create_mainoptions
endscript
cheat_array_ps3 = [
	{
		c1 = -489648156
		c2 = 1489099720
		cheatscript = cheat_unlock_mca
	}
	{
		c1 = -1149615573
		c2 = 1501800163
		cheatscript = cheat_unlock_the_luchador
	}
	{
		c1 = 1953569343
		c2 = -475922044
		cheatscript = cheat_unlock_judy_nails
	}
	{
		c1 = 732589541
		c2 = 818252412
		cheatscript = cheat_unlock_rube
	}
	{
		c1 = -425482159
		c2 = 1985988629
		cheatscript = cheat_unlock_spence
	}
	{
		c1 = 801186401
		c2 = 1328591045
		cheatscript = cheat_unlock_cooper
	}
	{
		c1 = 1543378661
		c2 = 107714278
		cheatscript = cheat_unlock_bosco
	}
	{
		c1 = 180524484
		c2 = -508849906
		cheatscript = cheat_unlock_boneman
	}
	{
		c1 = 1695842048
		c2 = 1382654759
		cheatscript = cheat_unlock_cam
	}
	{
		c1 = -368034832
		c2 = 975340527
		cheatscript = cheat_unlock_eric
	}
	{
		c1 = -503279531
		c2 = -1545313598
		cheatscript = cheat_unlock_eddie_x
	}
	{
		c1 = 2107283053
		c2 = -2079621121
		cheatscript = cheat_unlock_mad_dog
	}
	{
		c1 = 1064778902
		c2 = -280673964
		cheatscript = cheat_unlock_mel
	}
	{
		c1 = -1437918314
		c2 = 1884999468
		cheatscript = cheat_unlock_shayne
	}
	{
		c1 = 542618498
		c2 = -1211450237
		cheatscript = cheat_unlock_tv_producer
	}
	{
		c1 = 1384526839
		c2 = 1393302595
		cheatscript = cheat_unlock_fun_items_script
	}
	{
		c1 = -1907023405
		c2 = 1941805477
		cheatscript = cheat_unlock_all_cas
	}
	{
		c1 = -1037401532
		c2 = -888031969
		cheatscript = cheat_unlock_all_decks_script
	}
	{
		c1 = 1563003064
		c2 = 1629557679
		cheatscript = cheat_unlock_vans_dd66_chili_script
	}
	{
		c1 = 1652717957
		c2 = -147838550
		cheatscript = CHEAT_UNLOCK_VANS_script
	}
	{
		c1 = 1986268705
		c2 = -1796960720
		cheatscript = CHEAT_UNLOCK_NIXON_script
	}
	{
		c1 = 683290960
		c2 = -1942759276
		cheatscript = CHEAT_UNLOCK_ADIO_script
	}
	{
		c1 = -1096869971
		c2 = 427616538
		cheatscript = CHEAT_UNLOCK_BIRDHOUSE_script
	}
	{
		c1 = 2113974659
		c2 = 649203836
		cheatscript = CHEAT_UNLOCK_ELEMENT_script
	}
	{
		c1 = 588404545
		c2 = -1221156196
		cheatscript = CHEAT_UNLOCK_QUIKSILVER_script
	}
	{
		c1 = -278653963
		c2 = -366501441
		cheatscript = CHEAT_UNLOCK_VOLCOM_script
	}
	{
		c1 = 257727015
		c2 = 1961550715
		cheatscript = CHEAT_UNLOCK_DVS_script
	}
	{
		c1 = 1307153604
		c2 = 1984011740
		cheatscript = CHEAT_UNLOCK_ETNIES_script
	}
	{
		c1 = 1418454078
		c2 = -1153167095
		cheatscript = CHEAT_UNLOCK_ES_script
	}
	{
		c1 = -573527438
		c2 = -1202168062
		cheatscript = CHEAT_UNLOCK_VON_ZIPPER_script
	}
	{
		c1 = -501839764
		c2 = -1212233995
		cheatscript = CHEAT_UNLOCK_ELECTRIC_script
	}
	{
		c1 = -381637112
		c2 = -315697773
		cheatscript = CHEAT_UNLOCK_DGK_script
	}
	{
		c1 = 1229259798
		c2 = 1912558110
		cheatscript = CHEAT_UNLOCK_INDEPENDENT_script
	}
	{
		c1 = 1460514363
		c2 = 437668583
		cheatscript = CHEAT_UNLOCK_ALMOST_script
	}
	{
		c1 = -103867557
		c2 = -852954697
		cheatscript = CHEAT_UNLOCK_MATIX_script
	}
	{
		c1 = -1427717545
		c2 = 548609881
		cheatscript = CHEAT_UNLOCK_FLIP_script
	}
	{
		c1 = 424282440
		c2 = -94944570
		cheatscript = CHEAT_UNLOCK_HURLEY_script
	}
	{
		c1 = -326732821
		c2 = 1149667704
		cheatscript = CHEAT_UNLOCK_BILLABONG_script
	}
	{
		c1 = 1133060044
		c2 = 46759669
		cheatscript = CHEAT_UNLOCK_EMERICA_script
	}
	{
		c1 = 369406737
		c2 = 238256651
		cheatscript = CHEAT_UNLOCK_ALL_MOVIES_script
	}
	{
		c1 = -399516748
		c2 = -1863539493
		cheatscript = cheat_unlock_all_crib_themes_script
	}
	{
		c1 = 346094904
		c2 = 1744824416
		cheatscript = cheat_unlock_all_crib_pieces_script
	}
	{
		c1 = 849279700
		c2 = -1822181091
		cheatscript = cheat_unlock_wrigleys_vending_machine_script
	}
	{
		c1 = 1187136604
		c2 = -1804465349
		cheatscript = cheat_unlock_all_rig_pieces_script
	}
	{
		c1 = 2037590773
		c2 = 1575183320
		cheatscript = cheat_unlock_super_check_script
	}
	{
		c1 = -1880009439
		c2 = 1466796258
		cheatscript = cheat_unlock_all_ve_overlays
	}
	{
		c1 = 1788262402
		c2 = -16184795
		cheatscript = cheat_unlock_all_ve_effects
	}
	{
		c1 = -471291996
		c2 = 1963508010
		cheatscript = cheat_unlock_fdr
	}
	{
		c1 = 685597844
		c2 = -103717702
		cheatscript = cheat_unlock_lansdowne
	}
	{
		c1 = 2014284115
		c2 = -704465413
		cheatscript = cheat_unlock_air_and_space
	}
	{
		c1 = 699831282
		c2 = -83851431
		cheatscript = cheat_unlock_endless_slash_grind
	}
	{
		c1 = -1898278134
		c2 = -968910746
		cheatscript = cheat_unlock_perfect_rail_script
	}
	{
		c1 = -1185984349
		c2 = -770238199
		cheatscript = cheat_unlock_perfect_manual_script
	}
	{
		c1 = 685147623
		c2 = -671941328
		cheatscript = cheat_unlock_unlimited_focus_script
	}
	{
		c1 = -1555406008
		c2 = 522807610
		cheatscript = cheat_perfect_ntt
	}
	{
		c1 = 1374650164
		c2 = -1605556519
		cheatscript = cheat_unlock_and_own_all_specials_script
	}
	{
		c1 = -1179363501
		c2 = 1909433213
		cheatscript = cheat_mini_skater_script
	}
	{
		c1 = 908488463
		c2 = 1690334462
		cheatscript = cheat_no_bails_script
	}
	{
		c1 = -1352952649
		c2 = 371453718
		cheatscript = cheat_invisible_skater
	}
	{
		c1 = -789348173
		c2 = -1732715006
		cheatscript = cheat_no_board
	}
	{
		c1 = -561028364
		c2 = 1542022163
		cheatscript = cheat_full_stats_script
	}
	{
		c1 = -717228697
		c2 = -693092641
		cheatscript = cheat_give_skill_points
	}
	{
		c1 = -912105599
		c2 = -77871691
		cheatscript = cheat_give_skaters
	}
	{
		c1 = 726791803
		c2 = -1435376370
		cheatscript = cheat_unlock_ingame_cheats
	}
	{
		c1 = 893827855
		c2 = -1445424987
		cheatscript = unlock_all_cheats
	}
]
cheat_array_xenon = [
	{
		c1 = -489648156
		c2 = 1489099720
		cheatscript = cheat_unlock_mca
	}
	{
		c1 = -1149615573
		c2 = 1501800163
		cheatscript = cheat_unlock_the_luchador
	}
	{
		c1 = 1953569343
		c2 = -475922044
		cheatscript = cheat_unlock_judy_nails
	}
	{
		c1 = 732589541
		c2 = 818252412
		cheatscript = cheat_unlock_rube
	}
	{
		c1 = -425482159
		c2 = 1985988629
		cheatscript = cheat_unlock_spence
	}
	{
		c1 = 801186401
		c2 = 1328591045
		cheatscript = cheat_unlock_cooper
	}
	{
		c1 = 1543378661
		c2 = 107714278
		cheatscript = cheat_unlock_bosco
	}
	{
		c1 = 180524484
		c2 = -508849906
		cheatscript = cheat_unlock_boneman
	}
	{
		c1 = 1695842048
		c2 = 1382654759
		cheatscript = cheat_unlock_cam
	}
	{
		c1 = -368034832
		c2 = 975340527
		cheatscript = cheat_unlock_eric
	}
	{
		c1 = -503279531
		c2 = -1545313598
		cheatscript = cheat_unlock_eddie_x
	}
	{
		c1 = 2107283053
		c2 = -2079621121
		cheatscript = cheat_unlock_mad_dog
	}
	{
		c1 = 1064778902
		c2 = -280673964
		cheatscript = cheat_unlock_mel
	}
	{
		c1 = -1437918314
		c2 = 1884999468
		cheatscript = cheat_unlock_shayne
	}
	{
		c1 = 542618498
		c2 = -1211450237
		cheatscript = cheat_unlock_tv_producer
	}
	{
		c1 = 1384526839
		c2 = 1393302595
		cheatscript = cheat_unlock_fun_items_script
	}
	{
		c1 = -1907023405
		c2 = 1941805477
		cheatscript = cheat_unlock_all_cas
	}
	{
		c1 = -1037401532
		c2 = -888031969
		cheatscript = cheat_unlock_all_decks_script
	}
	{
		c1 = 1563003064
		c2 = 1629557679
		cheatscript = cheat_unlock_vans_dd66_chili_script
	}
	{
		c1 = 1652717957
		c2 = -147838550
		cheatscript = CHEAT_UNLOCK_VANS_script
	}
	{
		c1 = 1986268705
		c2 = -1796960720
		cheatscript = CHEAT_UNLOCK_NIXON_script
	}
	{
		c1 = 683290960
		c2 = -1942759276
		cheatscript = CHEAT_UNLOCK_ADIO_script
	}
	{
		c1 = -1096869971
		c2 = 427616538
		cheatscript = CHEAT_UNLOCK_BIRDHOUSE_script
	}
	{
		c1 = 2113974659
		c2 = 649203836
		cheatscript = CHEAT_UNLOCK_ELEMENT_script
	}
	{
		c1 = 588404545
		c2 = -1221156196
		cheatscript = CHEAT_UNLOCK_QUIKSILVER_script
	}
	{
		c1 = -278653963
		c2 = -366501441
		cheatscript = CHEAT_UNLOCK_VOLCOM_script
	}
	{
		c1 = 257727015
		c2 = 1961550715
		cheatscript = CHEAT_UNLOCK_DVS_script
	}
	{
		c1 = 1307153604
		c2 = 1984011740
		cheatscript = CHEAT_UNLOCK_ETNIES_script
	}
	{
		c1 = 1418454078
		c2 = -1153167095
		cheatscript = CHEAT_UNLOCK_ES_script
	}
	{
		c1 = -573527438
		c2 = -1202168062
		cheatscript = CHEAT_UNLOCK_VON_ZIPPER_script
	}
	{
		c1 = -501839764
		c2 = -1212233995
		cheatscript = CHEAT_UNLOCK_ELECTRIC_script
	}
	{
		c1 = -381637112
		c2 = -315697773
		cheatscript = CHEAT_UNLOCK_DGK_script
	}
	{
		c1 = 1229259798
		c2 = 1912558110
		cheatscript = CHEAT_UNLOCK_INDEPENDENT_script
	}
	{
		c1 = 1460514363
		c2 = 437668583
		cheatscript = CHEAT_UNLOCK_ALMOST_script
	}
	{
		c1 = -103867557
		c2 = -852954697
		cheatscript = CHEAT_UNLOCK_MATIX_script
	}
	{
		c1 = -1427717545
		c2 = 548609881
		cheatscript = CHEAT_UNLOCK_FLIP_script
	}
	{
		c1 = 424282440
		c2 = -94944570
		cheatscript = CHEAT_UNLOCK_HURLEY_script
	}
	{
		c1 = -326732821
		c2 = 1149667704
		cheatscript = CHEAT_UNLOCK_BILLABONG_script
	}
	{
		c1 = 1133060044
		c2 = 46759669
		cheatscript = CHEAT_UNLOCK_EMERICA_script
	}
	{
		c1 = 369406737
		c2 = 238256651
		cheatscript = CHEAT_UNLOCK_ALL_MOVIES_script
	}
	{
		c1 = -399516748
		c2 = -1863539493
		cheatscript = cheat_unlock_all_crib_themes_script
	}
	{
		c1 = 346094904
		c2 = 1744824416
		cheatscript = cheat_unlock_all_crib_pieces_script
	}
	{
		c1 = 849279700
		c2 = -1822181091
		cheatscript = cheat_unlock_wrigleys_vending_machine_script
	}
	{
		c1 = 1187136604
		c2 = -1804465349
		cheatscript = cheat_unlock_all_rig_pieces_script
	}
	{
		c1 = 2037590773
		c2 = 1575183320
		cheatscript = cheat_unlock_super_check_script
	}
	{
		c1 = -1880009439
		c2 = 1466796258
		cheatscript = cheat_unlock_all_ve_overlays
	}
	{
		c1 = 1788262402
		c2 = -16184795
		cheatscript = cheat_unlock_all_ve_effects
	}
	{
		c1 = -471291996
		c2 = 1963508010
		cheatscript = cheat_unlock_fdr
	}
	{
		c1 = 685597844
		c2 = -103717702
		cheatscript = cheat_unlock_lansdowne
	}
	{
		c1 = 2014284115
		c2 = -704465413
		cheatscript = cheat_unlock_air_and_space
	}
	{
		c1 = 699831282
		c2 = -83851431
		cheatscript = cheat_unlock_endless_slash_grind
	}
	{
		c1 = -1898278134
		c2 = -968910746
		cheatscript = cheat_unlock_perfect_rail_script
	}
	{
		c1 = -1185984349
		c2 = -770238199
		cheatscript = cheat_unlock_perfect_manual_script
	}
	{
		c1 = 685147623
		c2 = -671941328
		cheatscript = cheat_unlock_unlimited_focus_script
	}
	{
		c1 = -1555406008
		c2 = 522807610
		cheatscript = cheat_perfect_ntt
	}
	{
		c1 = 1374650164
		c2 = -1605556519
		cheatscript = cheat_unlock_and_own_all_specials_script
	}
	{
		c1 = -1179363501
		c2 = 1909433213
		cheatscript = cheat_mini_skater_script
	}
	{
		c1 = 908488463
		c2 = 1690334462
		cheatscript = cheat_no_bails_script
	}
	{
		c1 = -1352952649
		c2 = 371453718
		cheatscript = cheat_invisible_skater
	}
	{
		c1 = -789348173
		c2 = -1732715006
		cheatscript = cheat_no_board
	}
	{
		c1 = -561028364
		c2 = 1542022163
		cheatscript = cheat_full_stats_script
	}
	{
		c1 = -717228697
		c2 = -693092641
		cheatscript = cheat_give_skill_points
	}
	{
		c1 = -912105599
		c2 = -77871691
		cheatscript = cheat_give_skaters
	}
	{
		c1 = 726791803
		c2 = -1435376370
		cheatscript = cheat_unlock_ingame_cheats
	}
	{
		c1 = 893827855
		c2 = -1445424987
		cheatscript = unlock_all_cheats
	}
]
Cheat_Menu_Array = [
	{
		text = "PERFECT RAIL"
		flag = $CHEAT_PERFECT_RAIL
		unlock_flag = $cheat_unlock_perfect_rail
	}
	{
		text = "PERFECT MANUAL"
		flag = $cheat_perfect_manual
		unlock_flag = $cheat_unlock_perfect_manual
	}
	{
		text = "UNLIMITED FOCUS"
		flag = $cheat_unlimited_focus
		unlock_flag = $cheat_unlock_unlimited_focus
	}
	{
		text = "PERFECT NAIL"
		flag = $CHEAT_PERFECT_NAIL
		unlock_flag = $CHEAT_UNLOCK_PERFECT_NAIL
	}
	{
		text = "ENDLESS SLASH"
		flag = $cheat_endless_slash
		unlock_flag = $CHEAT_UNLOCK_ENDLESS_SLASH
	}
	{
		text = "MINI SKATER"
		flag = $cheat_mini_skater
		unlock_flag = $CHEAT_UNLOCK_MINI_SKATER
		update = cheat_update_mini_skater
	}
	{
		text = "NO BAILS"
		flag = $cheat_no_bails
		unlock_flag = $CHEAT_UNLOCK_NO_BAILS
		update = cheat_update_no_bails
	}
	{
		text = "SUPER CHECK"
		flag = $CHEAT_SUPER_CHECK
		unlock_flag = $CHEAT_UNLOCK_SUPER_CHECK
	}
	{
		text = "INVISIBLE SKATER"
		flag = $CHEAT_INVISIBLE
		unlock_flag = $CHEAT_UNLOCK_INVISIBLE
		update = cheat_update_invisible_skater
	}
	{
		text = "NO BOARD"
		flag = $CHEAT_INVISIBLE_BOARD
		unlock_flag = $CHEAT_UNLOCK_INVISIBLE_BOARD
		update = cheat_update_no_board
	}
]
