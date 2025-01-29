debug_revert_from_debug_script = back_to_retail_menu
menu_pos = (675.0, 100.0)

script create_debug_backdrop 
	ScriptAssert \{'create_debug_backdrop: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script destroy_debug_backdrop 
	destroy_menu \{menu_id = debug_backdrop}
endscript

script create_debugging_menu 
	SetMenuAutoRepeatTimes \{(0.3, 0.3)}
	make_generic_menu {
		vmenu_id = debug_vmenu
		Pos = ($menu_pos - (0.0, 80.0))
		dims = (400.0, 500.0)
		title_just = [left top]
		z_priority = 100.0
		pad_back_script = $debug_revert_from_debug_script
		title = qs(0x49a0d144)
		scrolling
		use_all_controllers
	}
	if 0x7a71a15f
		add_generic_menu_text_item {
			text = qs(0x13c88506)
			pad_choose_script = create_freestyle_debug_menu
			pad_choose_params = {from_gameplay = <from_gameplay>}
		}
	endif
	add_generic_menu_text_item {
		text = qs(0x350e7e6b)
		pad_choose_script = create_game_modes_menu
		pad_choose_params = {from_gameplay = <from_gameplay>}
	}
	add_generic_menu_text_item {
		text = qs(0xc98853b2)
		pad_choose_script = create_in_game_menu
		pad_choose_params = {from_gameplay = <from_gameplay>}
	}
	add_generic_menu_text_item {
		text = qs(0x37767de1)
		pad_choose_script = create_hud_ui_menu
		pad_choose_params = {from_gameplay = <from_gameplay>}
	}
	add_generic_menu_text_item {
		text = qs(0xdb4779a7)
		pad_choose_script = create_band_setup_menu
		pad_choose_params = {from_gameplay = <from_gameplay>}
	}
	add_generic_menu_text_item {
		text = qs(0x23a76ddd)
		pad_choose_script = create_tools_menu
		pad_choose_params = {from_gameplay = <from_gameplay>}
	}
	add_generic_menu_text_item {
		text = qs(0x3eee694e)
		pad_choose_script = create_settings_menu
		pad_choose_params = {from_gameplay = <from_gameplay>}
	}
	add_generic_menu_text_item {
		text = qs(0x22f576c5)
		pad_choose_script = create_wii_menu
		pad_choose_params = {from_gameplay = <from_gameplay>}
	}
	add_generic_menu_text_item \{text = qs(0x265776e4)
		pad_choose_script = debug_unlockall}
	LaunchEvent \{Type = focus
		target = debug_vmenu}
endscript

script destroy_debugging_menu 
	generic_ui_destroy
endscript

script back_to_debug_menu 
	destroy_all_debug_menus
	create_debugging_menu
endscript

script destroy_all_debug_menus 
	destroy_replay_menu
	destroy_song_menu
	destroy_settings_menu
	destroy_game_modes_menu
	destroy_in_game_menu
	destroy_changevenue_menu
	destroy_character_viewer_menu
	destroy_changeguitarist_menu
	destroy_hud_ui_menu
	destroy_togglevisibility_menu
	destroy_band_setup_menu
	destroy_tools_menu
	destroy_unlocks_menu
	destroy_wii_menu
	destroy_skipintosong_menu
	destroy_cameracut_menu
	destroy_snapshot_menu
	destroy_difficulty_menu
	destroy_difficulty_analyzer_menu
	destroy_difficulty_analyzer_instrument_menu
	destroy_difficulty_analyzer_difficulty_menu
	destroy_part_menu
	destroy_skipbytime_menu
	destroy_skipbymarker_menu
	destroy_skipbymeasure_menu
	destroy_looppoint_menu
	destroy_autotest_menu
	destroy_photobot_debug_menu
	destroy_dlcflags_debug_menu
	destroy_choose_quickplay_venue_menu
	destroy_debugging_menu
	destroy_bot_menu
	destroy_freestyle_debug_menu
endscript
debug_playcredits_active = 0

script debug_playcredits 
	kill_gem_scroller
	destroy_debugging_menu
	disable_pause
	reset_score \{Player = 1}
	Change \{end_credits = 1}
	Change \{debug_playcredits_active = 1}
	Progression_EndCredits
endscript

script debug_quitcredits 
	generic_event_back \{state = uistate_debug}
	band_unload_anim_paks
endscript

script debug_wii_encore 
	Change \{current_transition = preencore}
	Change \{debug_encore = 1}
	if GotParam \{song}
		SetGlobalTags Progression params = {encore_song = <song>}
	else
		gman_songfunc \{func = get_next_song}
		SetGlobalTags Progression params = {encore_song = <next_song>}
	endif
	broadcastevent \{Type = song_wonp1}
	destroy_all_debug_menus
endscript

script create_difficulty_analyzer_menu 
	ui_menu_select_sfx
	destroy_tools_menu
	x_pos = 500
	make_generic_menu {
		vmenu_id = song_vmenu
		Pos = ($menu_pos - (0.0, 80.0))
		dims = (400.0, 500.0)
		title_pos = ($menu_pos - (0.0, 80.0))
		title_just = [left top]
		pad_back_script = difficulty_analyzer_back
		z_priority = 100.0
		title = qs(0xc540004a)
		scrolling
		use_all_controllers
	}
	array_entry = 0
	getsonglistsize \{include_non_playable = true}
	begin
	getsonglistchecksum index = <array_entry>
	get_song_struct song = <song_checksum>
	get_song_title song = <song_checksum>
	add_generic_menu_text_item {
		text = <song_title>
		additional_focus_script = wait_for_diff_analyzer
		additional_focus_params = {<...>}
		pad_choose_script = create_difficulty_analyzer_instrument_menu
		pad_choose_params = {song_name = <song_checksum>}
	}
	<array_entry> = (<array_entry> + 1)
	repeat <array_Size>
	add_generic_menu_text_item {
		text = qs(0x2c1db66a)
		additional_focus_script = wait_for_diff_analyzer
		additional_focus_params = {<...>}
		pad_choose_script = create_difficulty_analyzer_instrument_menu
		pad_choose_params = {difficulty = all song_name = debug_output}
	}
	LaunchEvent \{Type = focus
		target = song_vmenu}
endscript

script difficulty_analyzer_back 
	KillSpawnedScript \{Name = wait_for_diff_analyzer_spawned}
	destroy_difficulty_analyzer
	generic_menu_pad_back \{callback = back_to_tools_menu}
endscript

script back_to_difficulty_analyzer_menu 
	destroy_all_debug_menus
	create_difficulty_analyzer_menu
endscript

script destroy_difficulty_analyzer_menu 
	generic_ui_destroy
endscript

script wait_for_diff_analyzer 
	KillSpawnedScript \{Name = wait_for_diff_analyzer_spawned}
	SpawnScriptNow wait_for_diff_analyzer_spawned params = {<...>}
endscript

script wait_for_diff_analyzer_spawned 
	Wait \{0.5
		Seconds}
	difficulty_analyzer_show instrument = guitar difficulty = all song_name = <song_checksum>
endscript

script create_difficulty_analyzer_instrument_menu 
	printf \{qs(0x37b7ec8e)}
	destroy_difficulty_analyzer_menu
	destroy_difficulty_menu
	make_generic_menu {
		vmenu_id = difficulty_vmenu
		Pos = ($menu_pos - (0.0, 80.0))
		dims = (400.0, 500.0)
		title_pos = ($menu_pos - (0.0, 80.0))
		title_just = [left top]
		pad_back_script = back_to_difficulty_analyzer_menu
		z_priority = 100.0
		title = qs(0xf1283fc0)
		scrolling
		use_all_controllers
	}
	array_entry = 0
	GetArraySize \{$instrument_checksums}
	begin
	instrument = ($instrument_text [<array_entry>])
	add_generic_menu_text_item {
		text = <instrument>
		pad_choose_script = create_difficulty_analyzer_difficulty_menu
		pad_choose_params = {instrument = ($instrument_checksums [<array_entry>]) song_name = <song_name>}
	}
	<array_entry> = (<array_entry> + 1)
	repeat <array_Size>
	if (<song_name> = debug_output)
		add_generic_menu_text_item {
			text = qs(0x886518a8)
			pad_choose_script = create_difficulty_analyzer_difficulty_menu
			pad_choose_params = {all instrument = all song_name = <song_name>}
		}
	endif
	LaunchEvent \{Type = focus
		target = difficulty_vmenu}
endscript

script back_to_difficulty_analyzer_instrument_menu 
	destroy_all_debug_menus
	create_difficulty_analyzer_instrument_menu difficulty = all song_name = <song_name>
endscript

script destroy_difficulty_analyzer_instrument_menu 
	generic_ui_destroy
endscript

script create_difficulty_analyzer_difficulty_menu 
	destroy_difficulty_analyzer_menu
	destroy_difficulty_menu
	make_generic_menu {
		vmenu_id = difficulty_vmenu
		Pos = ($menu_pos - (0.0, 80.0))
		dims = (400.0, 500.0)
		title_pos = ($menu_pos - (0.0, 80.0))
		title_just = [left top]
		pad_back_script = back_to_difficulty_analyzer_instrument_menu
		z_priority = 100.0
		title = qs(0x7db6b015)
		scrolling
		use_all_controllers
	}
	array_entry = 0
	GetArraySize \{$difficulty_list}
	begin
	difficulty_count = ($difficulty_list [<array_entry>])
	get_difficulty_text difficulty = <difficulty_count>
	diff_script = difficulty_analyzer_show
	diff_params = {instrument = <instrument> difficulty = ($difficulty_list [<array_entry>]) song_name = <song_name>}
	if (<song_name> = debug_output)
		add_generic_menu_text_item {
			text = <difficulty_text>
			pad_choose_script = output_diff_scores
			pad_choose_params = {instrument = <instrument> ($difficulty_list [<array_entry>])}
		}
	else
		add_generic_menu_text_item {
			text = <difficulty_text>
			additional_focus_script = difficulty_analyzer_show
			additional_focus_params = {instrument = <instrument> difficulty = ($difficulty_list [<array_entry>]) song_name = <song_name>}
		}
	endif
	<array_entry> = (<array_entry> + 1)
	repeat <array_Size>
	if (<song_name> = debug_output)
		add_generic_menu_text_item {
			text = qs(0x886518a8)
			pad_choose_script = output_diff_scores
			pad_choose_params = {all instrument = <instrument>}
		}
	endif
	LaunchEvent \{Type = focus
		target = difficulty_vmenu}
endscript

script back_to_difficulty_analyzer_difficulty_menu 
	ScriptAssert \{'back_to_difficulty_analyzer_difficulty_menu: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script destroy_difficulty_analyzer_difficulty_menu 
	generic_ui_destroy
endscript

script back_to_online_menu 
	ScriptAssert \{'back_to_online_menu: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script create_song_menu \{version = gh3}
	ui_menu_select_sfx
	destroy_all_debug_menus
	make_generic_menu {
		vmenu_id = song_vmenu
		Pos = ($menu_pos - (0.0, 80.0))
		dims = (400.0, 500.0)
		z_priority = 100.0
		title_pos = ($menu_pos - (0.0, 80.0))
		title_just = [left top]
		pad_back_script = back_to_debug_menu
		title = qs(0xc9810c6b)
		scrolling
		use_all_controllers
	}
	array_entry = 0
	getsonglistsize \{include_non_playable = true}
	begin
	getsonglistchecksum index = <array_entry>
	get_song_struct song = <song_checksum>
	get_song_title song = <song_checksum>
	add_generic_menu_text_item {
		text = <song_title>
		pad_choose_script = create_part_menu
		pad_choose_params = {song_name = <song_checksum> Player = 1 from_gameplay = <from_gameplay>}
	}
	<array_entry> = (<array_entry> + 1)
	repeat <array_Size>
	LaunchEvent \{Type = focus
		target = song_vmenu}
endscript

script back_to_song_menu 
	destroy_difficulty_menu
	create_song_menu version = <version>
endscript

script back_to_part_menu 
	ScriptAssert \{'back_to_part_menu: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script destroy_song_menu 
	generic_ui_destroy
endscript

script create_difficulty_menu 
	destroy_all_debug_menus
	make_generic_menu {
		vmenu_id = difficulty_vmenu
		Pos = ($menu_pos - (0.0, 80.0))
		dims = (400.0, 500.0)
		z_priority = 100.0
		title_pos = ($menu_pos - (0.0, 80.0))
		title_just = [left top]
		pad_back_script = back_to_song_menu
		title = qs(0x9c844087)
		scrolling
		use_all_controllers
	}
	array_entry = 0
	GetArraySize \{$difficulty_list}
	getnumplayersingame
	begin
	difficulty_count = ($difficulty_list [<array_entry>])
	get_difficulty_text difficulty = <difficulty_count>
	if (<Player> = 2)
		add_generic_menu_text_item {
			text = <difficulty_text>
			pad_choose_script = select_start_song
			pad_choose_params = {song_name = <song_name> difficulty2 = ($difficulty_list [<array_entry>]) difficulty = <difficulty> part = <part> part2 = <part2> from_gameplay = <from_gameplay>}
		}
	else
		if (<num_players> = 2)
			add_generic_menu_text_item {
				text = <difficulty_text>
				pad_choose_script = create_difficulty_menu
				pad_choose_params = {song_name = <song_name> version = <version> difficulty = ($difficulty_list [<array_entry>]) part = <part> part2 = <part2> Player = 2 from_gameplay = <from_gameplay>}
			}
		else
			add_generic_menu_text_item {
				text = <difficulty_text>
				pad_choose_script = select_start_song
				pad_choose_params = {difficulty = ($difficulty_list [<array_entry>]) part = <part> part2 = <part2> song_name = <song_name> from_gameplay = <from_gameplay>}
			}
		endif
	endif
	<array_entry> = (<array_entry> + 1)
	repeat <array_Size>
	LaunchEvent \{Type = focus
		target = difficulty_vmenu}
endscript

script destroy_difficulty_menu 
	generic_ui_destroy
endscript
part_list = [
	guitar
	drum
	bass
	vocals
]
part_list_props = {
	guitar = {
		index = 0
		text_nl = 'guitar'
		text = qs(0x11355666)
		text_upper = qs(0x9504b94a)
	}
	drum = {
		index = 1
		text_nl = 'drum'
		text = qs(0xfd52050f)
		text_upper = qs(0xcf488ba5)
	}
	bass = {
		index = 2
		text_nl = 'bass'
		text = qs(0x4f551cbe)
		text_upper = qs(0x7d4f9214)
	}
	vocals = {
		index = 3
		text_nl = 'vocals'
		text = qs(0x9fae80a8)
		text_upper = qs(0x1b9f6f84)
	}
	Band = {
		index = 3
		text_nl = 'band'
		text = qs(0xe8a5176a)
		text_upper = qs(0xdabf99c0)
	}
}

script get_part_text \{part = guitar}
	return part_text = ($part_list_props.<part>.text)
endscript

script get_part_text_nl 
	return part_text = ($part_list_props.<part>.text_nl)
endscript

script create_part_menu 
	destroy_all_debug_menus
	make_generic_menu {
		vmenu_id = part_vmenu
		Pos = ($menu_pos - (0.0, 80.0))
		dims = (400.0, 500.0)
		z_priority = 100.0
		title_pos = ($menu_pos - (0.0, 80.0))
		title_just = [left top]
		pad_back_script = back_to_song_menu
		title = qs(0x3444b5ef)
		scrolling
		use_all_controllers
	}
	array_entry = 0
	GetArraySize \{$part_list}
	getnumplayersingame
	begin
	part_count = ($part_list [<array_entry>])
	get_part_text part = <part_count>
	if (<Player> = 2)
		add_generic_menu_text_item {
			text = <part_text>
			pad_choose_script = create_difficulty_menu
			pad_choose_params = {song_name = <song_name> version = <version> part = <part> part2 = ($part_list [<array_entry>]) Player = 1 from_gameplay = <from_gameplay>}
		}
	else
		if (<num_players> = 2)
			add_generic_menu_text_item {
				text = <part_text>
				pad_choose_script = create_part_menu
				pad_choose_params = {song_name = <song_name> version = <version> part = ($part_list [<array_entry>]) Player = 2 from_gameplay = <from_gameplay>}
			}
		else
			add_generic_menu_text_item {
				text = <part_text>
				pad_choose_script = create_difficulty_menu
				pad_choose_params = {song_name = <song_name> version = <version> part = ($part_list [<array_entry>]) Player = 1 from_gameplay = <from_gameplay>}
			}
		endif
	endif
	<array_entry> = (<array_entry> + 1)
	repeat <array_Size>
	LaunchEvent \{Type = focus
		target = part_vmenu}
endscript

script destroy_part_menu 
	generic_ui_destroy
endscript
toggle_aspect_ratio_menuitem = 0

script toggle_aspect_ratio 
	ngc_getwide
	if (<widescreen> = true)
		ngc_setstandard
	else
		ngc_setwide
	endif
	toggle_aspect_ratio_setprop
endscript

script toggle_aspect_ratio_setprop 
	ngc_getwide
	if (<widescreen> = FALSE)
		($toggle_aspect_ratio_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x9ab87ae9)
	else
		($toggle_aspect_ratio_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x6c42126a)
	endif
endscript
toggle_progressive_scan_menuitem = 0

script toggle_progressive_scan 
	if ($ps2_progressivescan = 1)
		Change \{ps2_progressivescan = 0}
		setprogressive \{On = 0}
	else
		Change \{ps2_progressivescan = 1}
		setprogressive \{On = 1}
	endif
	toggle_progressive_scan_setprop
endscript

script toggle_progressive_scan_setprop 
	if ($ps2_progressivescan = 1)
		($toggle_progressive_scan_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x7e6fcd6d)
	else
		($toggle_progressive_scan_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0xc3953146)
	endif
endscript
toggle_on_audible_hitnote_menuitem = 0

script toggle_on_audible_hitnote 
	if ($Debug_Audible_HitNote = 1)
		Change \{Debug_Audible_HitNote = 0}
	else
		Change \{Debug_Audible_HitNote = 1}
	endif
	toggle_on_audible_hitnote_setprop
endscript

script toggle_on_audible_hitnote_setprop 
	if ($Debug_Audible_HitNote = 0)
		($toggle_on_audible_hitnote_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x576b2a3b)
	else
		($toggle_on_audible_hitnote_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0xe125f2cc)
	endif
endscript

script playday_unlockall 
	difficulties = [easy medium hard expert]
	GetArraySize <difficulties>
	diff_size = <array_Size>
	menu_music_off \{setflag = 1}
	getsonglistsize
	i = 0
	begin
	getsonglistchecksum index = <i>
	get_song_saved_in_globaltags song = <song_checksum>
	if (<saved_in_globaltags> = 1)
		SetGlobalTags <song_checksum> params = {unlocked = 1}
	endif
	i = (<i> + 1)
	repeat <array_Size>
	i = 0
	GetArraySize ($Bonus_videos)
	begin
	video_checksum = ($Bonus_videos [<i>].id)
	SetGlobalTags <video_checksum> params = {unlocked = 1}
	<i> = (<i> + 1)
	repeat <array_Size>
	get_LevelZoneArray_size
	index = 0
	begin
	get_LevelZoneArray_checksum index = <index>
	formatText checksumName = venue_checksum 'venue_%s' s = ($LevelZones.<level_checksum>.Name)
	if NOT StructureContains structure = ($LevelZones.<level_checksum>) debug_only
		SetGlobalTags <venue_checksum> params = {unlocked = 1} Progression = true
	endif
	index = (<index> + 1)
	repeat <array_Size>
	Change \{cheat_line6unlock = 1}
	get_savegame_from_controller \{controller = $primary_controller}
	unlock_all_profiles savegame = <savegame>
	unlock_purchase_all_cas_parts savegame = <savegame>
endscript

script unlock_everything_for_car 
	get_savegame_from_controller \{controller = $primary_controller}
	unlock_all_profiles savegame = <savegame>
	unlock_purchase_all_cas_parts savegame = <savegame>
endscript

script hide_band_members 
	musician1 :Hide
	musician2 :Hide
	musician3 :Hide
	musician4 :Hide
endscript

script show_band_members 
	musician1 :unhide
	musician2 :unhide
	musician3 :unhide
	musician4 :unhide
endscript

script back_to_settings_menu 
	destroy_changevenue_menu
	destroy_changehighway_menu
	destroy_changeguitar_menu
	destroy_togglevisibility_menu
	destroy_cameracut_group_menu
	destroy_snapshot_menu
	create_settings_menu
endscript

script back_to_cameracut_group_menu 
	destroy_cameracut_menu
	create_cameracut_group_menu
endscript

script destroy_settings_menu 
	if ScreenElementExists \{id = settings_scrolling_menu}
		DestroyScreenElement \{id = settings_scrolling_menu}
	endif
	destroy_menu_backdrop
endscript

script destroy_snapshot_menu 
	if ScreenElementExists \{id = selectsnapshot_scrolling_menu}
		DestroyScreenElement \{id = selectsnapshot_scrolling_menu}
	endif
	destroy_menu_backdrop
endscript

script create_snapshot_menu 
	ui_menu_select_sfx
	destroy_in_game_menu
	make_generic_menu {
		vmenu_id = selectsnapshot_vmenu
		Pos = ($menu_pos - (0.0, 80.0))
		dims = (400.0, 500.0)
		z_priority = 100.0
		title_pos = ($menu_pos - (0.0, 80.0))
		title_just = [left top]
		pad_back_script = back_to_in_game_menu
		title = qs(0x590374a2)
		scrolling
		use_all_controllers
	}
	GetPakManCurrentName \{map = zones}
	printf qs(0xf14d9225) s = <pakname>
	formatText checksumName = snapshot_array '%s_snapshot_names' s = <pakname>
	if GlobalExists Name = <snapshot_array>
		printf \{qs(0x0bd35cfd)}
		GetArraySize $<snapshot_array>
		array_count = 0
		begin
		snapshot_name = ($<snapshot_array> [<array_count>])
		printf qs(0xef4859ab) s = <snapshot_name>
		formatText checksumName = snapshot_checksum '%s' s = <snapshot_name>
		formatText TextName = text_name qs(0x4d4555da) s = <snapshot_name>
		printf qs(0xef4859ab) s = <text_name>
		add_generic_menu_text_item {
			text = <text_name>
			pad_choose_script = lightshow_setsnapshotoverride
			pad_choose_params = {Name = <snapshot_checksum>}
		}
		<array_count> = (<array_count> + 1)
		repeat <array_Size>
		formatText \{checksumName = snapshot_checksum
			'None'}
		add_generic_menu_text_item {
			text = qs(0x3f1bbbb1)
			pad_choose_script = lightshow_unsetsnapshotoverride
			pad_choose_params = {Name = <snapshot_checksum>}
		}
	endif
	LaunchEvent \{Type = focus
		target = selectsnapshot_vmenu}
endscript
CameraCutPrefixArray = [
	'cameras'
	'cameras_guitarist'
	'cameras_singer'
	'cameras_drummer'
	'cameras_bassist'
	'cameras_moments'
	'cameras_headtohead'
	'cameras_single'
	'cameras_solo'
	'cameras_guitar_closeup'
	'cameras_closeup'
	'cameras_closeups'
	'cameras_orbit'
	'cameras_orbits'
	'cameras_pan'
	'cameras_dolly'
	'cameras_zoom_slow'
	'cameras_zoom_fast'
	'cameras_zoom_out'
	'cameras_zoom'
	'cameras_spotlight'
	'cameras_audience'
	'cameras_vert_drummer'
	'cameras_vert_guitarist'
	'cameras_vert_stagerear'
	'cameras_vert_stagefront'
	'cameras_intro'
	'cameras_fastintro'
	'cameras_encore'
	'cameras_walk'
	'cameras_starpower'
	'cameras_special'
	'cameras_stagedive'
	'cameras_win'
	'cameras_lose'
	'cameras_Verts_front'
	'cameras_Verts_rear'
	'cameras_G_across_stage'
	'cameras_S_across_stage'
	'cameras_preencore'
	'cameras_2p'
	'cameras_player_closeup_2p'
	'cameras_solo_2p'
	'cameras_guitar_closeup_2p'
	'cameras_drummer_2p'
	'cameras_singer_2p'
	'cameras_singer_closeup_2p'
	'cameras_bassist_2p'
	'cameras_orbit_2p'
	'cameras_pan_2p'
	'cameras_intro_2p'
	'cameras_fastintro_2p'
	'cameras_starpower_2p'
	'cameras_win_2p'
	'cameras_lose_2p'
	'cameras_band'
	'cameras_guitar'
	'cameras_drums'
	'cameras_bass'
]

script create_cameracut_group_menu 
	ui_menu_select_sfx
	destroy_settings_menu
	make_generic_menu {
		vmenu_id = selectcameracut_group_vmenu
		Pos = ($menu_pos - (0.0, 80.0))
		dims = (400.0, 500.0)
		z_priority = 100.0
		title_pos = ($menu_pos - (0.0, 80.0))
		title_just = [left top]
		pad_back_script = back_to_in_game_menu
		title = qs(0xecd234cc)
		scrolling
		use_all_controllers
	}
	if NOT generic_menu :desc_resolvealias \{Name = 0x92a24386}
		return
	endif
	generic_menu :se_setprops \{generic_menu_title_alpha = 0
		background_alpha = 0
		skull_alpha = 0
		scrollbar_alpha = 0}
	AssignAlias id = <resolved_id> alias = current_menu
	add_generic_menu_text_item \{text = qs(0x1527ff9c)
		pad_choose_script = select_cameracut
		pad_choose_params = {
			Camera_Array_pakname = None
			Camera_Array = None
			array_count = None
		}}
	GetPakManCurrentName \{map = zones}
	camera_count = 0
	GetArraySize \{$CameraCutPrefixArray}
	camera_array_size = <array_Size>
	begin
	formatText checksumName = Camera_Array '%s_%p' s = <pakname> p = ($CameraCutPrefixArray [<camera_count>])
	if GlobalExists Name = <Camera_Array>
		GetArraySize $<Camera_Array>
		if (<array_Size>)
			formatText TextName = camera_group qs(0x581d2af2) p = ($CameraCutPrefixArray [<camera_count>])
			add_generic_menu_text_item {
				text = <camera_group>
				pad_choose_script = create_cameracut_menu
				pad_choose_params = {camera_count = <camera_count>}
				pad_square_script = create_cameracut_menu
				pad_square_params = {camera_count = <camera_count>}
			}
		endif
	endif
	camera_count = (<camera_count> + 1)
	repeat <camera_array_size>
	LaunchEvent \{Type = focus
		target = selectcameracut_group_vmenu}
endscript

script create_cameracut_menu 
	if NOT GotParam \{camera_count}
		create_cameracut_group_menu
		return
	endif
	ui_menu_select_sfx
	destroy_cameracut_group_menu
	make_generic_menu {
		vmenu_id = selectcameracut_vmenu
		Pos = ($menu_pos - (0.0, 80.0))
		dims = (400.0, 500.0)
		z_priority = 100.0
		title_pos = ($menu_pos - (0.0, 80.0))
		title_just = [left top]
		pad_back_script = back_to_cameracut_group_menu
		title = qs(0x474a49b8)
		nobg
		notitlebg
		scrolling
		use_all_controllers
	}
	if NOT generic_menu :desc_resolvealias \{Name = 0x92a24386}
		return
	endif
	generic_menu :se_setprops \{generic_menu_title_alpha = 0
		background_alpha = 0
		skull_alpha = 0
		scrollbar_alpha = 0}
	AssignAlias id = <resolved_id> alias = current_menu
	GetPakManCurrentName \{map = zones}
	formatText checksumName = Camera_Array '%s_%p' s = <pakname> p = ($CameraCutPrefixArray [<camera_count>])
	if GlobalExists Name = <Camera_Array>
		GetArraySize $<Camera_Array>
		array_count = 0
		begin
		cameracut_getname pakname = <pakname> prefixnumber = <camera_count> cameranumber = <array_count>
		add_generic_menu_text_item {
			text = <Camera_Name>
			pad_choose_script = select_cameracut
			pad_choose_params = {Camera_Array_pakname = <pakname> Camera_Array = ($CameraCutPrefixArray [<camera_count>]) array_count = <array_count>}
			pad_square_script = select_cameracut
			pad_square_params = {Camera_Array_pakname = <pakname> Camera_Array = ($CameraCutPrefixArray [<camera_count>]) array_count = <array_count> jumptoviewer}
		}
		<array_count> = (<array_count> + 1)
		repeat <array_Size>
	endif
	LaunchEvent \{Type = focus
		target = selectcameracut_vmenu}
endscript

script back_to_cameracut_menu 
	ScriptAssert \{'back_to_cameracut_menu: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script destroy_cameracut_menu 
	generic_ui_destroy
endscript

script destroy_cameracut_group_menu 
	generic_ui_destroy
endscript
debug_camera_array = None
debug_camera_array_pakname = None
debug_camera_array_count = 0

script select_cameracut 
	ui_menu_select_sfx
	Change debug_camera_array = <Camera_Array>
	Change debug_camera_array_pakname = <Camera_Array_pakname>
	Change debug_camera_array_count = <array_count>
	destroy_cameracuts
	Wait \{3
		gameframes}
	create_cameracuts
	if GotParam \{jumptoviewer}
		destroy_all_debug_menus
		unpausegh3
		enable_pause
		Change \{viewer_buttons_enabled = 1}
		ToggleViewMode
	endif
endscript
cameracut_ingame_menu_on = 0
cameracut_ingame_menu_depth = 0
cameracut_ingame_menu_group = 0
cameracut_ingame_menu_index = 0

script toggle_ingame_cameracut_menu 
	ScriptAssert \{'toggle_ingame_cameracut_menu: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script toggle_ingame_cameracut_menu_setprops 
	if ($cameracut_ingame_menu_on = 1)
		toggle_ingame_cameracut_menuitem :SetProps \{text = qs(0x6da0ecba)}
	else
		toggle_ingame_cameracut_menuitem :SetProps \{text = qs(0xd40145ad)}
	endif
endscript

script create_cameracut_ingame_menu 
	destroy_cameracut_ingame_menu
	make_generic_menu {
		vmenu_id = cameracut_ingame_vmenu
		Pos = ($menu_pos - (0.0, 80.0))
		dims = (400.0, 500.0)
		z_priority = 100.0
		title_pos = ($menu_pos - (0.0, 80.0))
		title_just = [left top]
		pad_back_script = <callback>
		title = qs(0x8a42b08e)
		pad_back_script = cameracut_ingame_menu_press_button
		pad_back_params = {Type = back Dir = -1}
		pad_choose_script = cameracut_ingame_menu_press_button
		pad_choose_params = {Type = choose Dir = 1}
		pad_left_script = cameracut_ingame_menu_press_button
		pad_left_pararms = {Type = hori Dir = -1}
		pad_right_script = cameracut_ingame_menu_press_button
		pad_right_params = {Type = hori Dir = 1}
		pad_up_script = cameracut_ingame_menu_press_button
		pad_up_params = {Type = vert Dir = -1}
		pad_down_script = cameracut_ingame_menu_press_button
		pad_down_params = {Type = vert Dir = 1}
		scrolling
		use_all_controllers
	}
	add_generic_menu_text_item \{text = qs(0x08528b87)}
	Change cameracut_ingame_down_1_menuitem = <item_container_id>
	add_generic_menu_text_item \{text = qs(0x03ac90f0)}
	Change cameracut_ingame_group_menuitem = <item_container_id>
	add_generic_menu_text_item \{text = qs(0x03ac90f0)}
	Change cameracut_ingame_down_2_menuitem = <item_container_id>
	add_generic_menu_text_item \{text = qs(0x03ac90f0)}
	Change cameracut_ingame_camera_menuitem = <item_container_id>
	cameracut_ingame_menu_setprops
	LaunchEvent \{Type = focus
		target = cameracut_ingame_vmenu}
endscript
cameracut_ingame_menu_camera_array_pakname = 0
cameracut_ingame_menu_camera_array = 0
cameracut_ingame_menu_array_count = 0

script cameracut_getname 
	if NOT GotParam \{pakname}
		GetPakManCurrentName \{map = zones}
	endif
	formatText checksumName = cameraarray '%s_%p' s = <pakname> p = ($CameraCutPrefixArray [<prefixnumber>])
	formatText TextName = Camera_Name qs(0x3efec28c) s = <pakname> p = ($CameraCutPrefixArray [<prefixnumber>]) i = <cameranumber>
	if StructureContains structure = ($<cameraarray> [<cameranumber>]) Name
		if StructureContains structure = ($cameracutnamestructure) ($<cameraarray> [<cameranumber>].Name)
			formatText TextName = Camera_Name qs(0x73307931) s = ($cameracutnamestructure.($<cameraarray> [<cameranumber>].Name)) DontAssertForChecksums
		else
			formatText TextName = Camera_Name qs(0x73307931) s = ($<cameraarray> [<cameranumber>].Name) DontAssertForChecksums
		endif
	elseif StructureContains structure = ($<cameraarray> [<cameranumber>]) params
		if StructureContains structure = ($<cameraarray> [<cameranumber>].params) Name
			if StructureContains structure = ($cameracutnamestructure) (($<cameraarray> [<cameranumber>].params).Name)
				formatText TextName = Camera_Name qs(0x73307931) s = ($cameracutnamestructure.(($<cameraarray> [<cameranumber>].params).Name)) DontAssertForChecksums
			else
				formatText TextName = Camera_Name qs(0x73307931) s = ($<cameraarray> [<cameranumber>].params.Name) DontAssertForChecksums
			endif
		endif
	endif
	return Camera_Name = <Camera_Name>
endscript
cameracut_ingame_group_menuitem = 0
cameracut_ingame_down_1_menuitem = 0
cameracut_ingame_down_2_menuitem = 0
cameracut_ingame_camera_menuitem = 0

script cameracut_ingame_menu_setprops 
	DEPTH = ($cameracut_ingame_menu_depth)
	index = ($cameracut_ingame_menu_index)
	($cameracut_ingame_group_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x03ac90f0)
	($cameracut_ingame_down_2_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x03ac90f0)
	($cameracut_ingame_camera_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x03ac90f0)
	if ((<DEPTH>) > 0)
		formatText TextName = camera_group qs(0x581d2af2) p = ($CameraCutPrefixArray [$cameracut_ingame_menu_group])
		($cameracut_ingame_group_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = <camera_group>
		($cameracut_ingame_down_2_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x08528b87)
	endif
	if ((<DEPTH>) > 1)
		GetPakManCurrentName \{map = zones}
		cameracut_getname pakname = <pakname> prefixnumber = ($cameracut_ingame_menu_group) cameranumber = ($cameracut_ingame_menu_index)
		formatText checksumName = cameraarray '%s_%p' s = <pakname> p = ($CameraCutPrefixArray [($cameracut_ingame_menu_group)])
		GetArraySize ($<cameraarray>)
		formatText TextName = camname '%s (%i/%m)' s = <Camera_Name> i = (($cameracut_ingame_menu_index) + 1) m = <array_Size> DontAssertForChecksums
		($cameracut_ingame_camera_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = <camname>
	endif
endscript

script cameracut_ingame_menu_press_button \{Type = vert
		Dir = 1}
	if ((<Type> = choose) && (($cameracut_ingame_menu_depth) = 2))
		select_cameracut_ingame
	elseif ((<Type> = vert) || (<Type> = choose) || (<Type> = back))
		cameracut_ingame_menu_change_depth Dir = <Dir>
	elseif ((<Type> = hori))
		if (($cameracut_ingame_menu_depth) = 1)
			cameracut_ingame_menu_change_group Dir = <Dir>
		elseif (($cameracut_ingame_menu_depth) = 2)
			cameracut_ingame_menu_change_camera Dir = <Dir>
		endif
	endif
endscript

script cameracut_ingame_menu_change_depth \{Dir = 1}
	Change cameracut_ingame_menu_depth = (($cameracut_ingame_menu_depth) + <Dir>)
	if (($cameracut_ingame_menu_depth) < 0)
		Change \{cameracut_ingame_menu_depth = 0}
		return
	endif
	if (($cameracut_ingame_menu_depth) > 2)
		Change \{cameracut_ingame_menu_depth = 2}
		return
	endif
	cameracut_ingame_menu_setprops
endscript

script cameracut_ingame_menu_change_group \{Dir = 1}
	Change cameracut_ingame_menu_group = (($cameracut_ingame_menu_group) + <Dir>)
	GetArraySize \{$CameraCutPrefixArray}
	max_value = (<array_Size> -1)
	if (($cameracut_ingame_menu_group) < 0)
		Change cameracut_ingame_menu_group = <max_value>
	endif
	if (($cameracut_ingame_menu_group) > (<max_value>))
		Change \{cameracut_ingame_menu_group = 0}
	endif
	GetPakManCurrentName \{map = zones}
	formatText checksumName = Camera_Array '%s_%p' s = <pakname> p = ($CameraCutPrefixArray [($cameracut_ingame_menu_group)])
	if GlobalExists Name = <Camera_Array>
		GetArraySize $<Camera_Array>
		if (<array_Size>)
			Change \{cameracut_ingame_menu_index = 0}
			cameracut_ingame_menu_setprops
			return
		endif
	endif
	cameracut_ingame_menu_change_group Dir = <Dir>
endscript

script cameracut_ingame_menu_change_camera \{Dir = 1}
	Change cameracut_ingame_menu_index = (($cameracut_ingame_menu_index) + <Dir>)
	GetPakManCurrentName \{map = zones}
	formatText checksumName = Camera_Array '%s_%p' s = <pakname> p = ($CameraCutPrefixArray [($cameracut_ingame_menu_group)])
	GetArraySize $<Camera_Array>
	max_value = (<array_Size> -1)
	if (($cameracut_ingame_menu_index) < 0)
		Change cameracut_ingame_menu_index = <max_value>
	endif
	if (($cameracut_ingame_menu_index) > (<max_value>))
		Change \{cameracut_ingame_menu_index = 0}
	endif
	cameracut_ingame_menu_setprops
endscript

script select_cameracut_ingame 
	ui_menu_select_sfx
	GetPakManCurrentName \{map = zones}
	Change debug_camera_array = ($CameraCutPrefixArray [($cameracut_ingame_menu_group)])
	Change debug_camera_array_pakname = <pakname>
	Change debug_camera_array_count = ($cameracut_ingame_menu_index)
	destroy_cameracuts
	Wait \{3
		gameframes}
	create_cameracuts
endscript

script destroy_cameracut_ingame_menu 
	if ScreenElementExists \{id = cameracut_ingame_vmenu}
		DestroyScreenElement \{id = cameracut_ingame_vmenu}
	endif
endscript

script select_cameracut_video 
	ScriptAssert \{'select_cameracut_video: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript
select_cameracut_video_end_enable = 0
capture_frame_count = 0

script select_cameracut_video_end 
	printf \{qs(0xaa2f1131)}
	root_window :legacydomorph \{alpha = 1}
	if ($capture_frame_count = 0)
		if ($select_cameracut_video_end_enable = 1)
			pausegh3
			Change \{select_cameracut_video_end_enable = 0}
			show_band_members
			if GlobalExists \{Name = is_video_capture_session}
				if ($is_video_capture_session = 1)
					video_capture_session_end
				endif
			endif
		endif
	endif
endscript

script create_character_viewer_menu 
	ui_menu_select_sfx
	destroy_debugging_menu
	make_generic_menu {
		vmenu_id = character_viewer_vmenu
		Pos = ($menu_pos - (0.0, 80.0))
		dims = (400.0, 500.0)
		z_priority = 100.0
		title_pos = ($menu_pos - (0.0, 80.0))
		title_just = [left top]
		pad_back_script = back_to_in_game_menu
		title = qs(0xd37611a5)
		scrolling
		use_all_controllers
	}
	add_generic_menu_text_item \{text = qs(0x3eaa1c82)
		pad_choose_script = create_changeguitarist_menu}
	LaunchEvent \{Type = focus
		target = character_viewer_vmenu}
endscript

script back_to_character_viewer_menu 
	destroy_changeguitarist_menu
	destroy_changebassist_menu
	destroy_changevocalist_menu
	destroy_changedrummer_menu
	create_character_viewer_menu
endscript

script destroy_character_viewer_menu 
	if ScreenElementExists \{id = character_viewer_scrolling_menu}
		DestroyScreenElement \{id = character_viewer_scrolling_menu}
	endif
	destroy_menu_backdrop
endscript

script create_changeguitarist_menu 
	ui_menu_select_sfx
	destroy_character_viewer_menu
	make_generic_menu {
		vmenu_id = changeguitarist_vmenu
		Pos = ($menu_pos - (0.0, 80.0))
		dims = (400.0, 500.0)
		z_priority = 100.0
		title_pos = ($menu_pos - (0.0, 80.0))
		title_just = [left top]
		pad_back_script = back_to_character_viewer_menu
		title = qs(0x3eaa1c82)
		scrolling
		use_all_controllers
	}
	get_savegame_from_controller controller = ($primary_controller)
	characterprofilegetlist savegame = <savegame>
	GetArraySize <profile_list>
	index = 0
	begin
	characterprofilegetstruct savegame = <savegame> Name = (<profile_list> [<i>])
	add_generic_menu_text_item {
		text = (<profile_struct>.fullname)
		pad_choose_script = debug_menu_choose_guitarist
		pad_choose_params = {profile_struct = <profile_struct> savegame = <savegame>}
	}
	index = (<index> + 1)
	repeat <array_Size>
	LaunchEvent \{Type = focus
		target = changeguitarist_vmenu}
endscript

script destroy_changeguitarist_menu 
	if ScreenElementExists \{id = changeguitarist_scrolling_menu}
		DestroyScreenElement \{id = changeguitarist_scrolling_menu}
	endif
	destroy_menu_backdrop
endscript

script debug_menu_choose_guitarist 
	kill_gem_scroller
	guitarist_id = (<profile_struct>.Name)
	setplayerinfo 1 character_id = <guitarist_id>
	if NOT create_band_member \{UseOldPos
			Player = 1
			savegame = 0
			instrument = guitar}
		DownloadContentLost
	endif
	getplayerinfo \{1
		difficulty
		out = difficulty1}
	getplayerinfo \{2
		difficulty
		out = difficulty2}
	restart_gem_scroller difficulty = <difficulty1> difficulty2 = <difficulty2> starttime = ($current_starttime) device_num = <device_num>
	generic_event_choose \{state = Uistate_gameplay}
endscript

script create_changebassist_menu 
	ScriptAssert \{'create_changebassist_menu: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script destroy_changebassist_menu 
endscript

script create_changevocalist_menu 
	ScriptAssert \{'create_changevocalist_menu: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script destroy_changevocalist_menu 
endscript

script create_changedrummer_menu 
	ScriptAssert \{'create_changedrummer_menu: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script destroy_changedrummer_menu 
endscript

script select_playermode 
	setplayerinfo 1 device = <device_num>
	create_song_menu version = ($current_song_version) from_gameplay = <from_gameplay>
endscript
debug_with_rhythm = 0
force_coop = 0

script toggle_hyperspeed_left 
	ui_menu_select_sfx
	kill_debug_elements
	getplayerinfo <Player> Hyperspeed
	<new_value> = (<Hyperspeed> - 0.01)
	if (<new_value> > $hyperspeed_slowest)
		<new_value> = $hyperspeed_slowest
	endif
	if (<new_value> < $hyperspeed_fastest)
		<new_value> = $hyperspeed_fastest
	endif
	setplayerinfo <Player> Hyperspeed = <new_value>
	toggle_hyperspeed_setprop Player = <Player>
endscript

script toggle_hyperspeed_right 
	ui_menu_select_sfx
	kill_debug_elements
	getplayerinfo <Player> Hyperspeed
	<new_value> = (<Hyperspeed> + 0.01)
	if (<new_value> > $hyperspeed_slowest)
		<new_value> = $hyperspeed_slowest
	endif
	if (<new_value> < $hyperspeed_fastest)
		<new_value> = $hyperspeed_fastest
	endif
	setplayerinfo <Player> Hyperspeed = <new_value>
	toggle_hyperspeed_setprop Player = <Player>
endscript
playermode_menuitem = 0

script toggle_playermode_left 
	switch $game_mode
		case p1_quickplay
		if ($force_coop)
			if ($debug_with_rhythm)
				Change \{debug_with_rhythm = 0}
			else
				Change \{force_coop = 0}
				Change \{debug_with_rhythm = 1}
			endif
		else
			if ($debug_with_rhythm)
				Change \{debug_with_rhythm = 0}
			else
				Change \{game_mode = practice}
			endif
		endif
		case p2_quickplay
		Change \{force_coop = 1}
		Change \{debug_with_rhythm = 1}
		Change \{game_mode = p1_quickplay}
		case p1_career
		Change \{game_mode = p2_quickplay}
		case p2_pro_faceoff
		Change \{game_mode = p1_career}
		case p2_coop
		Change \{game_mode = p2_pro_faceoff}
		case p2_roadie_battle
		Change \{game_mode = p2_coop}
		case p2_career
		Change \{game_mode = p2_roadie_battle}
		case practice
		Change \{game_mode = p2_career}
	endswitch
	toggle_playermode_setprop
endscript

script toggle_playermode_right 
	switch $game_mode
		case p1_quickplay
		if ($force_coop)
			if ($debug_with_rhythm)
				Change \{game_mode = p2_quickplay}
				Change \{force_coop = 0}
			else
				Change \{debug_with_rhythm = 1}
			endif
		else
			if ($debug_with_rhythm)
				Change \{force_coop = 1}
				Change \{debug_with_rhythm = 0}
			else
				Change \{debug_with_rhythm = 1}
			endif
		endif
		case p2_quickplay
		Change \{game_mode = p1_career}
		case p1_career
		Change \{game_mode = p2_pro_faceoff}
		case p2_pro_faceoff
		Change \{game_mode = p2_coop}
		case p2_coop
		Change \{game_mode = p2_roadie_battle}
		case p2_roadie_battle
		Change \{game_mode = p2_career}
		case p2_career
		Change \{game_mode = training}
		case practice
		Change \{game_mode = p1_quickplay}
		Change \{debug_with_rhythm = 0}
	endswitch
	toggle_playermode_setprop
endscript

script toggle_playermode_setprop 
	switch $game_mode
		case p1_quickplay
		if ($force_coop)
			if ($debug_with_rhythm)
				text = qs(0x27cacff9)
			else
				text = qs(0xf406bc1d)
			endif
		else
			if ($debug_with_rhythm)
				text = qs(0xc7bb6a94)
			else
				text = qs(0x2b693e56)
			endif
		endif
		case p2_quickplay
		text = qs(0x12119316)
		case p1_career
		text = qs(0x5ca9e374)
		case p2_pro_faceoff
		text = qs(0x290eb588)
		case p2_coop
		text = qs(0x3aba6b2d)
		case p2_roadie_battle
		toggle_playermode_menuitem :se_setprops \{text = qs(0xb47a5e5a)}
		case p2_career
		text = qs(0x75615786)
		case practice
		text = qs(0x0571286f)
	endswitch
	($playermode_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = <text>
endscript
toggle_rolandkit_menuitem = 0

script toggle_rolandkit 
	if ($roland_drumkit = 1)
		Change \{roland_drumkit = 0}
	else
		Change \{roland_drumkit = 1}
	endif
	toggle_rolandkit_setprop
endscript

script toggle_rolandkit_setprop 
	if ($roland_drumkit = 1)
		($toggle_rolandkit_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x7c5f597d)
	else
		($toggle_rolandkit_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x7e35767a)
	endif
endscript
toggle_guitar_touch_test_menuitem = 0

script toggle_guitar_touch_test 
	if ScriptIsRunning \{touch_sensor_spawned}
		end_touch_sensor_test
	else
		start_touch_sensor_test
	endif
	toggle_guitar_touch_test_setprop
endscript

script toggle_guitar_touch_test_setprop 
	if ScriptIsRunning \{touch_sensor_spawned}
		($toggle_guitar_touch_test_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x9748009f)
	else
		($toggle_guitar_touch_test_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x00cae553)
	endif
endscript
debug_dof_override = FALSE
toggle_dof_override_menuitem = 0

script toggle_dof_override 
	if (($debug_dof_override) = true)
		Change \{debug_dof_override = FALSE}
		setdofoverride \{Enabled = FALSE}
	else
		Change \{debug_dof_override = true}
		setdofoverride \{Enabled = true}
	endif
	toggle_dof_override_setprop
endscript

script toggle_dof_override_setprop 
	switch ($debug_dof_override)
		case true
		($toggle_dof_override_menuitem) :SetProps generic_menu_smenu_textitem_text_text = qs(0xcd786461)
		case FALSE
		($toggle_dof_override_menuitem) :SetProps generic_menu_smenu_textitem_text_text = qs(0xc02ad611)
		default
		($toggle_dof_override_menuitem) :SetProps generic_menu_smenu_textitem_text_text = qs(0xc02ad611)
	endswitch
endscript
debug_dof_strength = 0.5
toggle_dof_strength_menuitem = 0

script toggle_dof_strength 
	Change debug_dof_strength = (($debug_dof_strength) + 0.05)
	if (($debug_dof_strength) >= 1.05)
		Change \{debug_dof_strength = 0.0}
	endif
	toggle_dof_strength_setprop
endscript

script toggle_dof_strength_setprop 
	formatText TextName = strength_text qs(0x067d6802) f = ($debug_dof_strength)
	($toggle_dof_strength_menuitem) :SetProps generic_menu_smenu_textitem_text_text = <strength_text>
endscript
debug_dof_backdist = 0.0
debug_dof_frontdist = 0.0
toggle_dof_backdist_menuitem = 0

script toggle_dof_backdist 
	if (($debug_dof_backdist) < 0.1)
		Change debug_dof_backdist = (($debug_dof_backdist) + 0.0025000002)
	elseif (($debug_dof_backdist) < 0.2)
		Change debug_dof_backdist = (($debug_dof_backdist) + 0.005)
	else
		Change debug_dof_backdist = (($debug_dof_backdist) + 0.01)
	endif
	if (($debug_dof_backdist) > 0.6)
		Change \{debug_dof_backdist = 0.0}
	endif
	toggle_dof_backdist_setprop
endscript

script toggle_dof_backdist_setprop 
	formatText TextName = backdist_text qs(0x1a677dcf) f = ($debug_dof_backdist)
	($toggle_dof_backdist_menuitem) :SetProps generic_menu_smenu_textitem_text_text = <backdist_text>
endscript
toggle_gpu_threshold_menuitem = 0

script toggle_gpu_threshold 
	incgputhreshold
	toggle_gpu_threshold_setprop
endscript

script toggle_gpu_threshold_setprop 
	getgputhreshold
	formatText TextName = gpu_threshold_text qs(0x87d14dda) f = <gpu_threshold>
	($toggle_gpu_threshold_menuitem) :SetProps generic_menu_smenu_textitem_text_text = <gpu_threshold_text>
endscript

script toggle_debug_fsfx_setprop 
	getpostprocessmode
	switch (<mode>)
		case 0
		fsfx_text = qs(0x66888f6f)
		case 1
		fsfx_text = qs(0x2eb67a2f)
		case 2
		fsfx_text = qs(0xd33e77b9)
		case 3
		fsfx_text = qs(0xb4f9d014)
		case 4
		fsfx_text = qs(0x83272026)
		case 5
		fsfx_text = qs(0x4982c9ab)
		case 6
		fsfx_text = qs(0x9e334cb4)
		case 7
		fsfx_text = qs(0xd95baea9)
		case 8
		fsfx_text = qs(0x78e7e519)
		case 9
		fsfx_text = qs(0xcaa46527)
		case 10
		fsfx_text = qs(0x5e7bf6da)
		case 11
		fsfx_text = qs(0x15e2c490)
		case 12
		fsfx_text = qs(0x3f9a2d51)
		case 13
		fsfx_text = qs(0x1d0ebcf9)
		case 14
		fsfx_text = qs(0x35da4771)
		case 15
		fsfx_text = qs(0x6dc0a3bf)
		case 16
		fsfx_text = qs(0x7777a921)
		case 17
		fsfx_text = qs(0x43da169d)
		case 18
		fsfx_text = qs(0x66b14941)
		case 19
		fsfx_text = qs(0x2c67f6f9)
		case 20
		fsfx_text = qs(0xfa93a850)
		case 21
		fsfx_text = qs(0x38399e0c)
		case 22
		fsfx_text = qs(0x37051596)
		case 23
		fsfx_text = qs(0xcdc14cae)
		case 24
		fsfx_text = qs(0x19fca1a7)
		case 25
		fsfx_text = qs(0x7af734e6)
		case 26
		fsfx_text = qs(0x355b9bf9)
		case 27
		fsfx_text = qs(0x2e51e127)
		case 28
		fsfx_text = qs(0x6529baa9)
		case 29
		fsfx_text = qs(0x9837d36e)
		case 30
		fsfx_text = qs(0x62f38a56)
		case 31
		fsfx_text = qs(0xb6ce675f)
		case 32
		fsfx_text = qs(0xd49597e4)
		case 33
		fsfx_text = qs(0x9b3938fb)
		case 34
		fsfx_text = qs(0xd877c658)
		case 35
		fsfx_text = qs(0xbdf629e7)
		case 36
		fsfx_text = qs(0x473270df)
		case 37
		fsfx_text = qs(0x930f9dd6)
		case 38
		fsfx_text = qs(0x63bc8a25)
		case 39
		fsfx_textt = qs(0x2c10253a)
		case 40
		fsfx_text = qs(0xefe08d8e)
		case 41
		fsfx_text = qs(0x0a1c8e91)
		case 42
		fsfx_text = qs(0x8c6cfc2a)
		case 43
		fsfx_text = qs(0x76a8a512)
		case 44
		fsfx_text = qs(0xa295481b)
		case 45
		fsfx_text = qs(0xeb5134e7)
		case 46
		fsfx_text = qs(0xa4fd9bf8)
		case 47
		fsfx_text = qs(0x4f9fb876)
		case 48
		fsfx_text = qs(0x1592e149)
		case 49
		fsfx_text = qs(0xacb50586)
		case 50
		fsfx_text = qs(0xe1762980)
		case 51
		fsfx_text = qs(0xd7bcda1a)
		default
		fsfx_text = qs(0x66888f6f)
	endswitch
	($toggle_debug_fsfx_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = <fsfx_text>
endscript
toggle_debug_fsfx_menuitem = 0

script toggle_debug_fsfx 
	getpostprocessmode
	mode = (<mode> + 1)
	if (<mode> = <max_mode>)
		mode = 0
	endif
	setpostprocessmode mode = <mode>
	toggle_debug_fsfx_setprop
endscript
debug_fsfx_ui_index = 0
toggle_debug_fsfx_ui_menuitem = 0

script toggle_debug_fsfx_ui_setprop 
	switch ($debug_fsfx_ui_index)
		case 0
		($toggle_debug_fsfx_ui_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x046ac5a3)
		case 1
		($toggle_debug_fsfx_ui_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0xac445d4a)
		default
		($toggle_debug_fsfx_ui_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x046ac5a3)
	endswitch
endscript

script toggle_debug_fsfx_ui 
	Change debug_fsfx_ui_index = (($debug_fsfx_ui_index) + 1)
	if (($debug_fsfx_ui_index) = 2)
		Change \{debug_fsfx_ui_index = 0}
	endif
	toggle_debug_fsfx_ui_setprop
endscript

script select_slomo 
	ui_menu_select_sfx
	speedfactor = ($current_speedfactor * 10.0)
	speedfactor = (<speedfactor> + 1.0)
	if (<speedfactor> > 30.0)
		speedfactor = 1.0
	endif
	if (<speedfactor> < 1.0)
		speedfactor = 1.0
	endif
	Change current_speedfactor = (<speedfactor> / 10.0)
	update_slomo
	select_slomo_setprop
endscript

script update_slomo 
	setslomo \{$current_speedfactor}
	setslomo_song \{slomo = $current_speedfactor}
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		setplayerinfo <Player> check_time_early = ($check_time_early * $current_speedfactor)
		setplayerinfo <Player> check_time_late = ($check_time_late * $current_speedfactor)
		getnextplayer Player = <Player>
		repeat <num_players>
	endif
endscript
select_slomo_menuitem = 0

script select_slomo_setprop 
	formatText \{TextName = slomo_text
		qs(0xe4465fdd)
		s = $current_speedfactor}
	($select_slomo_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = <slomo_text>
endscript
debug_showmeasures = OFF

script toggle_showmeasures 
	ui_menu_select_sfx
	if ScreenElementExists \{id = debug_measures_text}
		DestroyScreenElement \{id = debug_measures_text}
	endif
	if ($debug_showmeasures = OFF)
		Change \{debug_showmeasures = On}
		CreateScreenElement \{Type = TextElement
			parent = root_window
			id = debug_measures_text
			font = debug
			text = qs(0xaa4c0def)
			Scale = 0.75
			Pos = (850.0, 250.0)
			rgba = [
				255
				187
				0
				255
			]
			just = [
				left
				top
			]
			Shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [
				0
				0
				0
				255
			]
			z_priority = 1000
			Hide}
		if ($playing_song = 1)
			debug_measures_text :se_setprops \{unhide}
		endif
	else
		Change \{debug_showmeasures = OFF}
	endif
	if NOT GotParam \{for_autolaunch}
		toggle_showmeasures_setprop
	endif
endscript
toggle_showmeasures_menuitem = 0

script toggle_showmeasures_setprop 
	if ($debug_showmeasures = OFF)
		($toggle_showmeasures_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0xd58e405f)
	else
		($toggle_showmeasures_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0xc703846c)
	endif
endscript
debug_showsongstars = OFF

script toggle_showsongstars 
	ui_menu_select_sfx
	if ScreenElementExists \{id = debug_songstars_text}
		DestroyScreenElement \{id = debug_songstars_text}
	endif
	if ($debug_showsongstars = OFF)
		Change \{debug_showsongstars = On}
		CreateScreenElement \{Type = TextElement
			parent = root_window
			id = debug_songstars_text
			font = debug
			text = qs(0xfbf320c8)
			Scale = 1
			Pos = (850.0, 300.0)
			rgba = [
				255
				187
				0
				255
			]
			just = [
				left
				top
			]
			Shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [
				0
				0
				0
				255
			]
			Hide}
		if ($playing_song = 1)
			debug_songstars_text :se_setprops \{unhide}
		endif
	else
		Change \{debug_showsongstars = OFF}
	endif
	toggle_showsongstars_setprop
endscript
toggle_showsongstars_menuitem = 0

script toggle_showsongstars_setprop 
	if ($debug_showsongstars = OFF)
		($toggle_showsongstars_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x90241ad7)
	else
		($toggle_showsongstars_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0xab5d35ae)
	endif
endscript
debug_showsongtime = OFF

script toggle_showsongtime 
	ui_menu_select_sfx
	if ScreenElementExists \{id = debug_songtime_text}
		DestroyScreenElement \{id = debug_songtime_text}
	endif
	if ($debug_showsongtime = OFF)
		Change \{debug_showsongtime = On}
		CreateScreenElement \{Type = TextElement
			parent = root_window
			id = debug_songtime_text
			font = debug
			text = qs(0xecafd78a)
			Scale = 0.75
			Pos = (850.0, 200.0)
			rgba = [
				255
				187
				0
				255
			]
			just = [
				left
				top
			]
			Shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [
				0
				0
				0
				255
			]
			z_priority = 100
			Hide}
		if ($playing_song = 1)
			debug_songtime_text :se_setprops \{unhide}
		endif
	else
		Change \{debug_showsongtime = OFF}
	endif
	toggle_showsongtime_setprop
endscript
toggle_showsongtime_menuitem = 0

script toggle_showsongtime_setprop 
	if ($debug_showsongtime = OFF)
		($toggle_showsongtime_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x3360aae1)
	else
		($toggle_showsongtime_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x79b13e73)
	endif
endscript
debug_showcameraname = OFF

script toggle_showcameraname 
	ui_menu_select_sfx
	if ScreenElementExists \{id = debug_camera_name_text}
		DestroyScreenElement \{id = debug_camera_name_text}
	endif
	if ScreenElementExists \{id = debug_camera_anim_text}
		DestroyScreenElement \{id = debug_camera_anim_text}
	endif
	if ScreenElementExists \{id = debug_camera_name_text2}
		DestroyScreenElement \{id = debug_camera_name_text2}
	endif
	if ScreenElementExists \{id = debug_camera_name_bg}
		DestroyScreenElement \{id = debug_camera_name_bg}
	endif
	if ($debug_showcameraname = OFF)
		Change \{debug_showcameraname = On}
	else
		Change \{debug_showcameraname = OFF}
	endif
	toggle_showcameraname_setprop
	if ($debug_showcameraname = On)
		CameraCuts_UpdateDebugCameraName
	endif
endscript
toggle_newanimdebug_menuitem = 0

script toggle_newanimdebug 
	switch ($anim_debug_target)
		case None
		target = musician1
		case musician1
		target = musician2
		case musician2
		target = musician3
		case musician3
		target = musician4
		case musician4
		target = None
	endswitch
	set_new_anim_debug_target target = <target>
	toggle_newanimdebug_setprop
endscript

script toggle_inputlog 
	ui_menu_select_sfx
	kill_debug_elements
	if ($show_play_log = 0)
		Change \{show_play_log = 1}
	else
		Change \{show_play_log = 0}
	endif
	toggle_inputlog_setprop
	init_play_log
endscript

script toggle_rockmeterdebug 
	ui_menu_select_sfx
	kill_debug_elements
	if ($rock_meter_debug = 0)
		Change \{rock_meter_debug = 1}
	else
		Change \{rock_meter_debug = 0}
	endif
	toggle_rockmeterdebug_setprop
endscript

script toggle_botp1 
	ScriptAssert \{'toggle_botp1: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script toggle_botp2 
	ScriptAssert \{'toggle_botp2: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script toggle_botp3 
	ScriptAssert \{'toggle_botp3: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script toggle_botp4 
	ScriptAssert \{'toggle_botp4: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script toggle_bot \{Player = 1}
	ui_menu_select_sfx
	kill_debug_elements
	getplayerinfo <Player> bot_play
	setplayerinfo <Player> bot_play = (1 - <bot_play>)
	toggle_bot_setprop Player = <Player>
endscript

script toggle_star \{Player = 1}
	ui_menu_select_sfx
	kill_debug_elements
	getplayerinfo <Player> star_power_debug_mode
	<new_value> = (<star_power_debug_mode> + 1)
	if (<new_value> > 3)
		<new_value> = 0
	endif
	if (<new_value> < 0)
		<new_value> = 3
	endif
	setplayerinfo <Player> star_power_debug_mode = <new_value>
	toggle_star_setprop Player = <Player>
endscript
edit_inputlog_lines_menuitem = 0

script edit_inputlog_lines_left 
	ui_menu_select_sfx
	kill_debug_elements
	Change play_log_lines = ($play_log_lines -1)
	if ($play_log_lines < 1)
		Change \{play_log_lines = 1}
	endif
	edit_inputlog_lines_setprop
	init_play_log
endscript

script edit_inputlog_lines_right 
	ScriptAssert \{'edit_inputlog_lines_right: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script toggle_tilt 
	ScriptAssert \{'toggle_tilt: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript
toggle_showcameraname_menuitem = 0

script toggle_showcameraname_setprop 
	if ($debug_showcameraname = OFF)
		($toggle_showcameraname_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0xcf0c92d5)
	else
		($toggle_showcameraname_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0xa9b88151)
	endif
endscript

script toggle_newanimdebug_setprop 
	<text> = qs(0x00000000)
	switch ($anim_debug_target)
		case musician1
		text = qs(0x7c707eaf)
		case musician2
		text = qs(0x575d2d6c)
		case musician3
		text = qs(0x4e461c2d)
		case musicain4
		text = qs(0x01078aea)
		case None
		text = qs(0xa86f0987)
	endswitch
	formatText TextName = text qs(0xb4b5b6c9) s = <text>
	($toggle_newanimdebug_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = <text>
endscript
toggle_inputlog_menuitem = 0

script toggle_inputlog_setprop 
	if ($show_play_log = 0)
		($toggle_inputlog_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x623a021b)
	else
		($toggle_inputlog_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x6f30d160)
	endif
endscript
toggle_rockmeterdebug_menuitem = 0

script toggle_rockmeterdebug_setprop 
	if ($rock_meter_debug = 0)
		($toggle_rockmeterdebug_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x11f39d10)
	else
		($toggle_rockmeterdebug_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x3c951f3d)
	endif
endscript

script toggle_botp1_setprop 
	ScriptAssert \{'toggle_botp1_setprop: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script toggle_botp2_setprop 
	ScriptAssert \{'toggle_botp2_setprop: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script toggle_botp3_setprop 
	ScriptAssert \{'toggle_botp3_setprop: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script toggle_botp4_setprop 
	ScriptAssert \{'toggle_botp4_setprop: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript
toggle_bot_menuitem = [
]

script toggle_bot_setprop 
	array_count = 1
	begin
	if playerinfoequals <array_count> bot_play = 0
		formatText TextName = menutext qs(0x4ced8e4f) d = <array_count>
	else
		formatText TextName = menutext qs(0xe889757d) d = <array_count>
	endif
	($toggle_bot_menuitem [(<array_count> - 1)]) :se_setprops generic_menu_smenu_textitem_text_text = <menutext>
	array_count = (<array_count> + 1)
	repeat 4
endscript
toggle_star_menuitem = [
]

script toggle_star_setprop 
	array_count = 1
	begin
	getplayerinfo <array_count> star_power_debug_mode
	switch (<star_power_debug_mode>)
		case 0
		formatText TextName = menutext qs(0x77b03841) d = <array_count>
		case 1
		formatText TextName = menutext qs(0x319bbd50) d = <array_count>
		case 2
		formatText TextName = menutext qs(0x61b3e268) d = <array_count>
		case 3
		formatText TextName = menutext qs(0x6b7bdf66) d = <array_count>
		default
		formatText TextName = menutext qs(0xa1ee93b5) d = <array_count>
	endswitch
	($toggle_star_menuitem [(<array_count> - 1)]) :se_setprops generic_menu_smenu_textitem_text_text = <menutext>
	array_count = (<array_count> + 1)
	repeat 4
endscript
toggle_hyperspeed_menuitem = [
]

script toggle_hyperspeed_setprop 
	array_count = 1
	begin
	getplayerinfo <array_count> Hyperspeed
	formatText TextName = menutext qs(0x81671d3d) p = <array_count> d = <Hyperspeed>
	($toggle_hyperspeed_menuitem [(<array_count> - 1)]) :se_setprops generic_menu_smenu_textitem_text_text = <menutext>
	array_count = (<array_count> + 1)
	repeat 4
endscript

script edit_inputlog_lines_setprop 
	formatText TextName = text qs(0x45c3b812) l = ($play_log_lines)
	($edit_inputlog_lines_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = <text>
endscript

script toggle_tilt_setprop 
	if ($show_guitar_tilt = 0)
		toggle_tilt_menuitem :se_setprops \{text = qs(0x86f42ef4)}
	else
		toggle_tilt_menuitem :se_setprops \{text = qs(0x36b8f01f)}
	endif
endscript
toggle_leftyflip_menuitem = 0

script toggle_leftyflip 
endscript

script toggle_leftyflip_setprop 
endscript
debug_forcescore = OFF
debug_forcescore_dir = up

script toggle_forcescore 
	ui_menu_select_sfx
	switch $debug_forcescore
		case OFF
		Change \{debug_forcescore = poor}
		case poor
		Change \{debug_forcescore = medium}
		case medium
		Change \{debug_forcescore = good}
		case good
		Change \{debug_forcescore = OFF}
		default
		Change \{debug_forcescore = OFF}
	endswitch
	CrowdIncrease \{Player = 1}
	toggle_forcescore_setprop
endscript
toggle_forcescore_menuitem = 0

script toggle_forcescore_setprop 
	switch $debug_forcescore
		case OFF
		($toggle_forcescore_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0xa66d654f)
		case poor
		($toggle_forcescore_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0xa8ac46c1)
		case medium
		($toggle_forcescore_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x5d0577bf)
		case good
		($toggle_forcescore_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0xc24acb24)
		default
		($toggle_forcescore_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0xa66d654f)
	endswitch
endscript
debug_camanimdebug = 0
toggle_camanimdebug_menuitem = 0

script toggle_camanimdebug 
	ui_menu_select_sfx
	switch $debug_camanimdebug
		case 0
		Change \{debug_camanimdebug = 1}
		Change \{debug_animdebug = 'none'}
		toggle_animdebug_setprop
		case 1
		Change \{debug_camanimdebug = 0}
		default
		Change \{debug_camanimdebug = 0}
	endswitch
	y = 0
	begin
	printdebugtext X = 0 y = <y> str = qs(0x42fe08d6)
	<y> = (<y> + 1)
	repeat 19
	toggle_camanimdebug_setprop
endscript

script toggle_camanimdebug_setprop 
	switch $debug_camanimdebug
		case 0
		($toggle_camanimdebug_menuitem) :SetProps generic_menu_smenu_textitem_text_text = qs(0x052008ac)
		case 1
		($toggle_camanimdebug_menuitem) :SetProps generic_menu_smenu_textitem_text_text = qs(0xf8e3fe1b)
		default
		($toggle_camanimdebug_menuitem) :SetProps generic_menu_smenu_textitem_text_text = qs(0xf8e3fe1b)
	endswitch
endscript
debug_animdebug = 'none'
toggle_animdebug_menuitem = 0

script toggle_animdebug 
	ui_menu_select_sfx
	switch $debug_animdebug
		case 'none'
		Change \{debug_animdebug = 'drummer'}
		case 'drummer'
		Change \{debug_animdebug = 'guitarist'}
		case 'guitarist'
		Change \{debug_animdebug = 'bassist'}
		case 'bassist'
		Change \{debug_animdebug = 'rhythm'}
		case 'rhythm'
		Change \{debug_animdebug = 'vocalist'}
		case 'vocalist'
		Change \{debug_animdebug = 'crowd'}
		case 'crowd'
		Change \{debug_animdebug = 'none'}
		default
		Change \{debug_animdebug = 'none'}
	endswitch
	y = 0
	begin
	printdebugtext X = 0 y = <y> str = qs(0x42fe08d6)
	<y> = (<y> + 1)
	repeat 10
	toggle_animdebug_setprop
endscript

script toggle_animdebug_setprop 
	switch $debug_animdebug
		case 'none'
		($toggle_animdebug_menuitem) :SetProps generic_menu_smenu_textitem_text_text = qs(0x33bf400a)
		case 'drummer'
		($toggle_animdebug_menuitem) :SetProps generic_menu_smenu_textitem_text_text = qs(0xba1c6869)
		case 'guitarist'
		($toggle_animdebug_menuitem) :SetProps generic_menu_smenu_textitem_text_text = qs(0x302ae381)
		case 'bassist'
		($toggle_animdebug_menuitem) :SetProps generic_menu_smenu_textitem_text_text = qs(0xe5cea25e)
		case 'rhythm'
		($toggle_animdebug_menuitem) :SetProps generic_menu_smenu_textitem_text_text = qs(0xc88972a0)
		case 'vocalist'
		($toggle_animdebug_menuitem) :SetProps generic_menu_smenu_textitem_text_text = qs(0xf60767b2)
		case 'crowd'
		($toggle_animdebug_menuitem) :SetProps generic_menu_smenu_textitem_text_text = qs(0xf11106d4)
		default
		($toggle_animdebug_menuitem) :SetProps generic_menu_smenu_textitem_text_text = qs(0x33bf400a)
	endswitch
endscript

script toggle_vocalsfreeform 
	ui_menu_select_sfx
	if ($vocal_enable_freeform_always = 1)
		Change \{vocal_enable_freeform_always = 0}
	else
		Change \{vocal_enable_freeform_always = 1}
	endif
	toggle_vocalsfreeform_setprop
endscript
toggle_vocalsfreeform_menuitem = 0

script toggle_vocalsfreeform_setprop 
	if ($vocal_enable_freeform_always = 1)
		($toggle_vocalsfreeform_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x125927d8)
	else
		($toggle_vocalsfreeform_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x1af80ceb)
	endif
endscript
toggle_rockmeter_prototype_menuitem = 0

script toggle_rockmeter_prototype 
	ScriptAssert \{'toggle_rockmeter_prototype: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script toggle_rockmeter_prototype_setprop 
	if ($use_prototype_rock_meter = 1)
		($toggle_rockmeter_prototype_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x3b71f64a)
	else
		($toggle_rockmeter_prototype_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0xa85b2f19)
	endif
endscript
toggle_rockmeter_prototype_pos_menuitem = 0

script toggle_rockmeter_prototype_pos 
	ScriptAssert \{'toggle_rockmeter_prototype_pos: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script toggle_rockmeter_prototype_position_setprop 
	if (($prototype_rock_meter_position_index) = 2)
		($toggle_rockmeter_prototype_pos) :se_setprops generic_menu_smenu_textitem_text_text = qs(0xd2c9cad3)
	elseif (($prototype_rock_meter_position_index) = 0)
		($toggle_rockmeter_prototype_pos) :se_setprops generic_menu_smenu_textitem_text_text = qs(0xeb0e10ce)
	else
		($toggle_rockmeter_prototype_pos) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x07a8bbe2)
	endif
endscript
toggle_rockmeter_prototype_player_max_menuitem = 0

script toggle_rockmeter_prototype_player_max 
	ScriptAssert \{'toggle_rockmeter_prototype_player_max: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script toggle_rockmeter_prototype_player_max_setprop 
	if (($prototype_blink_when_maxed) = 1)
		($toggle_rockmeter_prototype_player_max_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0xcec08b2b)
	else
		($toggle_rockmeter_prototype_player_max_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0xf520ed88)
	endif
endscript

script toggle_rockmeter_prototype_bar_just 
	ScriptAssert \{'toggle_rockmeter_prototype_bar_just: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script toggle_rockmeter_prototype_bar_just_setprop 
	if (($prototype_center_bars) = 0)
		id_toggle_proto_rockmeter_bar_just :se_setprops \{text = qs(0xfff9ad8a)}
	else
		id_toggle_proto_rockmeter_bar_just :se_setprops \{text = qs(0x3e0e3e08)}
	endif
endscript

script toggle_prototype_sp 
	ui_menu_select_sfx
	if (($use_star_power_prototype) = 1)
		Change \{use_star_power_prototype = 0}
	else
		Change \{use_star_power_prototype = 1}
	endif
	toggle_prototype_sp_setprop
endscript
toggle_prototype_sp_menuitem = 0

script toggle_prototype_sp_setprop 
	if (($use_star_power_prototype) = 0)
		($toggle_prototype_sp_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0xc13799d9)
	else
		($toggle_prototype_sp_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0xff6f975b)
	endif
endscript
toggle_prototype_health_menuitem = 0

script toggle_prototype_health 
	ScriptAssert \{'toggle_prototype_health: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script toggle_prototype_health_setprop 
	if (($use_proto_health_meter) = 0)
		($toggle_prototype_health_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x8805ad4a)
	else
		($toggle_prototype_health_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x521f6cc4)
	endif
endscript
allowcontroller_menuitem = 0

script toggle_allowcontroller 
	if ($allow_controller_for_all_instruments = 1)
		Change \{allow_controller_for_all_instruments = 0}
	else
		Change \{allow_controller_for_all_instruments = 1}
	endif
	toggle_allowcontroller_setprop
endscript
toggle_vocalsdebug_menuitem = 0

script toggle_vocalsdebug 
	ui_menu_select_sfx
	if ($vocal_debug_hud = 1)
		Change \{vocal_debug_hud = 0}
	else
		Change \{vocal_debug_hud = 1}
	endif
	toggle_vocalsdebug_setprop
endscript

script toggle_vocalsdebug_setprop 
	if ($vocal_debug_hud = 1)
		($toggle_vocalsdebug_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0xcd463a87)
	else
		($toggle_vocalsdebug_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x44ddfeb6)
	endif
endscript

script toggle_allowcontroller_setprop 
	if ($allow_controller_for_all_instruments = 1)
		($allowcontroller_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0xcffb5e1a)
	else
		($allowcontroller_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0xcaedad1d)
	endif
endscript

script create_changevenue_menu 
	ui_menu_select_sfx
	destroy_settings_menu
	make_generic_menu {
		vmenu_id = changevenue_vmenu
		Pos = ($menu_pos - (0.0, 80.0))
		dims = (400.0, 500.0)
		z_priority = 100.0
		title_pos = ($menu_pos - (0.0, 80.0))
		title_just = [left top]
		pad_back_script = back_to_in_game_menu
		title = qs(0x0606bdb8)
		scrolling
		use_all_controllers
	}
	get_LevelZoneArray_size
	array_count = 0
	begin
	get_LevelZoneArray_checksum index = <array_count>
	add_generic_menu_text_item {
		text = ($LevelZones.<level_checksum>.title)
		pad_choose_script = select_venue
		pad_choose_params = {level = <level_checksum> norestart}
	}
	<array_count> = (<array_count> + 1)
	repeat <array_Size>
	LaunchEvent \{Type = focus
		target = changevenue_vmenu}
endscript

script back_to_changevenue_menu 
	ScriptAssert \{'back_to_changevenue_menu: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script destroy_changevenue_menu 
	if ScreenElementExists \{id = changevenue_scrolling_menu}
		DestroyScreenElement \{id = changevenue_scrolling_menu}
	endif
	destroy_menu_backdrop
endscript

script select_venue 
	ui_menu_select_sfx
	destroy_crowd_models
	Wait \{10
		gameframes}
	kill_gem_scroller
	if GotParam \{level}
		Change current_level = <level>
	endif
	SetPakManCurrentBlock \{map = zones
		pak = None
		block_scripts = 1}
	ChangeNodeFlag \{LS_3_5_PRE
		1}
	ChangeNodeFlag \{LS_3_5_POST
		0}
	ChangeNodeFlag \{LS_ENCORE_PRE
		1}
	ChangeNodeFlag \{LS_ENCORE_POST
		0}
	MemPushContext \{quota_venue}
	CreatePakManMap \{map = zones
		links = ghzones
		folder = 'zones/'
		uselinkslots}
	MemPopContext
	Load_Venue
	setup_bg_viewport
	restore_dummy_bg_camera
	disable_bg_viewport_properties
	create_movie_viewport
	enable_pause
	if NOT GotParam \{norestart}
		gh3_start_pressed
		getplayerinfo \{1
			difficulty
			out = difficulty1}
		getplayerinfo \{2
			difficulty
			out = difficulty2}
		restart_gem_scroller difficulty = <difficulty1> difficulty2 = <difficulty2> starttime = ($current_starttime) device_num = <device_num>
	else
		ToggleViewMode \{viewerreload}
		ToggleViewMode \{viewerreload}
	endif
	destroy_changevenue_menu
	getnumplayersingame
	if (<num_players> = 0)
		setplayerinfo \{1
			in_game = 1}
	endif
	guitar_support_init_crowd
	if ui_event_exists_in_stack \{Name = 'gameplay'}
		ui_event \{event = menu_back
			data = {
				state = Uistate_gameplay
			}}
	else
		generic_event_choose \{state = Uistate_gameplay}
	endif
endscript

script testlevel_debug 
	begin
	if ControllerMake \{circle
			0}
		next_peds
	endif
	if ControllerMake \{circle
			1}
		next_peds
	endif
	WaitOneGameFrame
	repeat
endscript
debug_ped_row = 0

script next_peds 
	kill \{prefix = Z_TestLevel_Peds_Row0}
	kill \{prefix = Z_TestLevel_Peds_Row1}
	kill \{prefix = Z_TestLevel_Peds_Row2}
	kill \{prefix = Z_TestLevel_Peds_Row3}
	kill \{prefix = Z_TestLevel_Peds_Row4}
	kill \{prefix = Z_TestLevel_Peds_Row5}
	kill \{prefix = Z_TestLevel_Peds_Row6}
	kill \{prefix = Z_TestLevel_Peds_Row7}
	WaitOneGameFrame
	begin
	Change debug_ped_row = ($debug_ped_row + 1)
	formatText checksumName = row 'Z_TestLevel_Peds_row%r' r = ($debug_ped_row)
	create prefix = <row>
	if IsAlive prefix = <row>
		break
	else
		Change \{debug_ped_row = -1}
	endif
	repeat
endscript

script back_to_changehighway_menu 
	ScriptAssert \{'back_to_changehighway_menu: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script destroy_changehighway_menu 
	if ScreenElementExists \{id = changehighway_scrolling_menu}
		DestroyScreenElement \{id = changehighway_scrolling_menu}
	endif
	destroy_menu_backdrop
endscript

script create_changeguitar_menu \{Type = guitar}
	ui_menu_select_sfx
	destroy_in_game_menu
	make_generic_menu {
		vmenu_id = changeguitar_vmenu
		Pos = ($menu_pos - (0.0, 80.0))
		dims = (400.0, 500.0)
		title_pos = ($menu_pos - (0.0, 80.0))
		title_just = [left top]
		z_priority = 100.0
		pad_back_script = back_to_in_game_menu
		title = qs(0x7a2d9b63)
		scrolling
		use_all_controllers
	}
	get_musician_instrument_size
	array_count = 0
	begin
	get_musician_instrument_struct index = <array_count>
	if (<Type> = (<info_struct>.Type))
		printf qs(0xc994f540) i = (<info_struct>.Name)
		add_generic_menu_text_item {
			text = (<info_struct>.Name)
			pad_choose_script = select_guitar
			pad_choose_params = {guitar = <array_count> Type = <Type>}
		}
	endif
	<array_count> = (<array_count> + 1)
	repeat <array_Size>
	LaunchEvent \{Type = focus
		target = changeguitar_vmenu}
endscript

script back_to_changeguitar_menu 
	ScriptAssert \{'back_to_changeguitar_menu: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script destroy_changeguitar_menu 
	if ScreenElementExists \{id = changeguitar_scrolling_menu}
		DestroyScreenElement \{id = changeguitar_scrolling_menu}
	endif
	destroy_menu_backdrop
endscript

script select_guitar \{Type = guitar}
	ui_menu_select_sfx
	kill_gem_scroller
	select_start_song
endscript
HideByType_List = [
	'real_crowd'
	'stage'
	'scene_ped'
]
HideByType_Visible = [
	On
	On
	On
]

script create_togglevisibility_menu 
	ui_menu_select_sfx
	destroy_settings_menu
	make_generic_menu {
		vmenu_id = togglevisibility_vmenu
		Pos = ($menu_pos - (0.0, 80.0))
		dims = (400.0, 500.0)
		title_pos = ($menu_pos - (0.0, 80.0))
		title_just = [left top]
		pad_back_script = back_to_hud_ui_menu
		z_priority = 100.0
		title = qs(0x95998324)
		scrolling
		use_all_controllers
	}
	add_generic_menu_text_item \{text = qs(0xa0a500ba)
		pad_choose_script = toggle_bandvisible}
	Change toggle_bandvisible_menuitem = <item_container_id>
	toggle_bandvisible_setprop
	GetArraySize \{$HideByType_List}
	array_count = 0
	array = []
	begin
	formatText checksumName = type_checksum '%s' s = ($HideByType_List [<array_count>])
	formatText checksumName = menuitem_checksum 'toggle_hidebytype_menuitem_%s' s = ($HideByType_List [<array_count>])
	add_generic_menu_text_item {
		text = qs(0x00000000)
		pad_choose_script = toggle_hidebytype
		pad_choose_params = {Type = type_checksum array_count = <array_count>}
	}
	AddArrayElement array = <array> element = <item_container_id>
	array_count = (<array_count> + 1)
	repeat <array_Size>
	Change toggle_hidebytype_menuitem = <array>
	toggle_hidebytype_setprop
	add_generic_menu_text_item \{text = qs(0xc36d1281)
		pad_choose_script = toggle_highway}
	Change toggle_highway_menuitem = <item_container_id>
	toggle_highway_setprop
	LaunchEvent \{Type = focus
		target = togglevisibility_vmenu}
endscript

script back_to_togglevisibility_menu 
	ScriptAssert \{'back_to_togglevisibility_menu: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script destroy_togglevisibility_menu 
	if ScreenElementExists \{id = togglevisibility_scrolling_menu}
		DestroyScreenElement \{id = togglevisibility_scrolling_menu}
	endif
	destroy_menu_backdrop
endscript
highwayvisible = On

script toggle_highway 
	ui_menu_select_sfx
	if ($highwayvisible = OFF)
		if ScreenElementExists \{id = gem_containerp1}
			legacydoscreenelementmorph \{id = gem_containerp1
				alpha = 1}
		endif
		if ScreenElementExists \{id = gem_containerp2}
			legacydoscreenelementmorph \{id = gem_containerp2
				alpha = 1}
		endif
		if ScreenElementExists \{id = gem_containerp3}
			legacydoscreenelementmorph \{id = gem_containerp3
				alpha = 1}
		endif
		if ScreenElementExists \{id = gem_containerp4}
			legacydoscreenelementmorph \{id = gem_containerp4
				alpha = 1}
		endif
		if ScreenElementExists \{id = vocals_highway_p1}
			legacydoscreenelementmorph \{id = vocals_highway_p1
				alpha = 1}
		endif
		if ScreenElementExists \{id = vocals_highway_p2}
			legacydoscreenelementmorph \{id = vocals_highway_p2
				alpha = 1}
		endif
		enable_highway_prepass
		Change \{highwayvisible = On}
		show_hud
	else
		if ScreenElementExists \{id = gem_containerp1}
			legacydoscreenelementmorph \{id = gem_containerp1
				alpha = 0}
		endif
		if ScreenElementExists \{id = gem_containerp2}
			legacydoscreenelementmorph \{id = gem_containerp2
				alpha = 0}
		endif
		if ScreenElementExists \{id = gem_containerp3}
			legacydoscreenelementmorph \{id = gem_containerp3
				alpha = 0}
		endif
		if ScreenElementExists \{id = gem_containerp4}
			legacydoscreenelementmorph \{id = gem_containerp4
				alpha = 0}
		endif
		if ScreenElementExists \{id = vocals_highway_p1}
			legacydoscreenelementmorph \{id = vocals_highway_p1
				alpha = 0}
		endif
		if ScreenElementExists \{id = vocals_highway_p2}
			legacydoscreenelementmorph \{id = vocals_highway_p2
				alpha = 0}
		endif
		disable_highway_prepass
		Change \{highwayvisible = OFF}
		hide_hud
	endif
	toggle_highway_setprop
endscript
toggle_highway_menuitem = 0

script toggle_highway_setprop 
	if ($highwayvisible = OFF)
		($toggle_highway_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x6f059162)
	else
		($toggle_highway_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0xfe956dd3)
	endif
endscript
bandvisible = On

script toggle_bandvisible 
	ui_menu_select_sfx
	if ($bandvisible = OFF)
		Change \{bandvisible = On}
	else
		Change \{bandvisible = OFF}
	endif
	set_bandvisible
	toggle_bandvisible_setprop
endscript

script set_bandvisible 
	if ($bandvisible = OFF)
		Hide_Band
	else
		Unhide_Band
	endif
endscript
toggle_bandvisible_menuitem = 0

script toggle_bandvisible_setprop 
	if ($bandvisible = OFF)
		($toggle_bandvisible_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x7fd280d2)
	else
		($toggle_bandvisible_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0xf815c959)
	endif
endscript

script toggle_hidebytype 
	ui_menu_select_sfx
	if (($HideByType_Visible [<array_count>]) = OFF)
		SetArrayElement ArrayName = HideByType_Visible globalarray index = <array_count> NewValue = On
	else
		SetArrayElement ArrayName = HideByType_Visible globalarray index = <array_count> NewValue = OFF
	endif
	set_hidebytype
	toggle_hidebytype_setprop
endscript

script set_hidebytype 
	GetArraySize \{$HideByType_List}
	array_count = 0
	begin
	formatText checksumName = type_checksum '%s' s = ($HideByType_List [<array_count>])
	if (($HideByType_Visible [<array_count>]) = OFF)
		HideObjectByType Type = <type_checksum>
	else
		HideObjectByType Type = <type_checksum> unhide
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
endscript
toggle_hidebytype_menuitem = [
]

script toggle_hidebytype_setprop 
	GetArraySize \{$HideByType_List}
	array_count = 0
	begin
	if (($HideByType_Visible [<array_count>]) = OFF)
		formatText TextName = menutext qs(0x15ab9942) s = ($HideByType_List [<array_count>])
	else
		formatText TextName = menutext qs(0xcd575e2a) s = ($HideByType_List [<array_count>])
	endif
	formatText checksumName = menuitem_checksum 'toggle_hidebytype_menuitem_%s' s = ($HideByType_List [<array_count>])
	($toggle_hidebytype_menuitem [<array_count>]) :se_setprops generic_menu_smenu_textitem_text_text = <menutext>
	array_count = (<array_count> + 1)
	repeat <array_Size>
endscript

script create_skipintosong_menu 
	ui_menu_select_sfx
	destroy_debugging_menu
	make_generic_menu {
		vmenu_id = skipintosong_vmenu
		Pos = ($menu_pos - (0.0, 80.0))
		dims = (400.0, 500.0)
		z_priority = 100.0
		title_pos = ($menu_pos - (0.0, 80.0))
		title_just = [left top]
		pad_back_script = back_to_in_game_menu
		title = qs(0xf63b8570)
		scrolling
		use_all_controllers
	}
	add_generic_menu_text_item {
		text = qs(0x0a24a218)
		pad_choose_script = create_skipbytime_menu
		pad_choose_params = {from_gameplay = <from_gameplay>}
	}
	add_generic_menu_text_item {
		text = qs(0x526a37ed)
		pad_choose_script = create_skipbymarker_menu
		pad_choose_params = {from_gameplay = <from_gameplay>}
	}
	add_generic_menu_text_item {
		text = qs(0x28f0ccb7)
		pad_choose_script = create_skipbymeasure_menu
		pad_choose_params = {from_gameplay = <from_gameplay>}
	}
	add_generic_menu_text_item {
		text = qs(0xc4e211c1)
		pad_choose_script = create_looppoint_menu
		pad_choose_params = {from_gameplay = <from_gameplay>}
	}
	LaunchEvent \{Type = focus
		target = skipintosong_vmenu}
endscript

script back_to_skipintosong_menu 
	destroy_skipbytime_menu
	destroy_skipbymarker_menu
	destroy_skipbymeasure_menu
	destroy_looppoint_menu
	create_skipintosong_menu
endscript

script destroy_skipintosong_menu 
	if ScreenElementExists \{id = skipintosong_scrolling_menu}
		DestroyScreenElement \{id = skipintosong_scrolling_menu}
	endif
	destroy_menu_backdrop
endscript

script create_skipbytime_menu 
	ui_menu_select_sfx
	if GotParam \{looppoint}
		destroy_looppoint_menu
		callback = back_to_looppoint_menu
	else
		destroy_skipintosong_menu
		callback = back_to_skipintosong_menu
	endif
	make_generic_menu {
		vmenu_id = skipbytime_vmenu
		Pos = ($menu_pos - (0.0, 80.0))
		dims = (400.0, 500.0)
		z_priority = 100.0
		title_pos = ($menu_pos - (0.0, 80.0))
		title_just = [left top]
		pad_back_script = <callback>
		title = qs(0x0a24a218)
		scrolling
		use_all_controllers
	}
	menu_func = select_start_song
	if GotParam \{looppoint}
		menu_func = set_looppoint
		add_generic_menu_text_item {
			text = qs(0x9888eddd)
			pad_choose_script = <menu_func>
			pad_choose_params = {starttime = -1000000 from_gameplay = <from_gameplay>}
		}
	endif
	gman_songtool_getcurrentsong
	songfilemanager func = get_num_fretbar_notes song_name = <current_song>
	songfilemanager func = get_fretbar_note song_name = <current_song> index = (<num_fretbar_notes> - 1)
	max_time = (<fretbar_time> / 1000)
	current_time = 0
	begin
	formatText TextName = menu_itemname qs(0x3c09de0c) s = <current_time>
	if (<current_time> < <max_time>)
		getplayerinfo \{1
			difficulty
			out = difficulty1}
		getplayerinfo \{2
			difficulty
			out = difficulty2}
		add_generic_menu_text_item {
			text = <menu_itemname>
			pad_choose_script = <menu_func>
			pad_choose_params = {song_name = current_or_last_song difficulty = <difficulty1> difficulty2 = <difficulty2> starttime = (<current_time> * 1000) from_gameplay = <from_gameplay>}
		}
	else
		break
	endif
	current_time = (<current_time> + 5)
	repeat
	LaunchEvent \{Type = focus
		target = skipbytime_vmenu}
endscript

script back_to_skipbytime_menu 
	ScriptAssert \{'back_to_skipbytime_menu: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script destroy_skipbytime_menu 
	if ScreenElementExists \{id = skipbytime_scrolling_menu}
		DestroyScreenElement \{id = skipbytime_scrolling_menu}
	endif
	destroy_menu_backdrop
endscript

script create_skipbymarker_menu 
	gman_songtool_getcurrentsong
	ui_menu_select_sfx
	if GotParam \{looppoint}
		destroy_looppoint_menu
		callback = back_to_looppoint_menu
	else
		destroy_skipintosong_menu
		callback = back_to_skipintosong_menu
	endif
	make_generic_menu {
		vmenu_id = skipbymarker_vmenu
		Pos = ($menu_pos - (0.0, 80.0))
		dims = (400.0, 500.0)
		z_priority = 100.0
		title_pos = ($menu_pos - (0.0, 80.0))
		title_just = [left top]
		pad_back_script = <callback>
		title = qs(0x526a37ed)
		scrolling
		use_all_controllers
	}
	menu_func = select_start_song
	if GotParam \{looppoint}
		menu_func = set_looppoint
		add_generic_menu_text_item {
			text = qs(0x9888eddd)
			pad_choose_script = <menu_func>
			pad_choose_params = {starttime = -1000000 from_gameplay = <from_gameplay>}
		}
	endif
	songfilemanager func = get_marker_array song_name = <current_song> part = guitar
	GetArraySize <marker_array>
	if (<array_Size> = 0)
		getplayerinfo \{1
			difficulty
			out = difficulty1}
		getplayerinfo \{2
			difficulty
			out = difficulty2}
		add_generic_menu_text_item {
			text = qs(0x6a7a8f12)
			pad_choose_script = <menu_func>
			pad_choose_params = {song_name = <current_song> difficulty = <difficulty1> difficulty2 = <difficulty2> starttime = -1000000 from_gameplay = <from_gameplay>}
		}
	else
		marker_count = 0
		begin
		formatText TextName = menu_itemname qs(0x434019c1) m = (<marker_array> [<marker_count>].marker) s = (<marker_array> [<marker_count>].time)
		getplayerinfo \{1
			difficulty
			out = difficulty1}
		getplayerinfo \{2
			difficulty
			out = difficulty2}
		add_generic_menu_text_item {
			text = <menu_itemname>
			pad_choose_script = <menu_func>
			pad_choose_params = {
				song_name = <current_song>
				difficulty = <difficulty1>
				difficulty2 = <difficulty2>
				starttime = (<marker_array> [<marker_count>].time)
				startmarker = <marker_count>
				from_gameplay = <from_gameplay>
			}
		}
		marker_count = (<marker_count> + 1)
		repeat <array_Size>
	endif
	LaunchEvent \{Type = focus
		target = skipbymarker_vmenu}
endscript

script back_to_skipbymarker_menu 
	ScriptAssert \{'back_to_skipbymarker_menu: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script destroy_skipbymarker_menu 
	if ScreenElementExists \{id = skipbymarker_scrolling_menu}
		DestroyScreenElement \{id = skipbymarker_scrolling_menu}
	endif
	destroy_menu_backdrop
endscript

script create_skipbymeasure_menu 
	ui_menu_select_sfx
	if GotParam \{looppoint}
		destroy_looppoint_menu
		callback = back_to_looppoint_menu
	else
		destroy_skipintosong_menu
		callback = back_to_skipintosong_menu
	endif
	make_generic_menu {
		vmenu_id = skipbymeasure_vmenu
		Pos = ($menu_pos - (0.0, 80.0))
		dims = (400.0, 500.0)
		z_priority = 100.0
		title_pos = ($menu_pos - (0.0, 80.0))
		title_just = [left top]
		pad_back_script = <callback>
		title = qs(0x28f0ccb7)
		scrolling
		use_all_controllers
	}
	menu_func = select_start_song
	if GotParam \{looppoint}
		menu_func = set_looppoint
		add_generic_menu_text_item {
			text = qs(0x9888eddd)
			pad_choose_script = <menu_func>
			pad_choose_params = {starttime = -1000000 from_gameplay = <from_gameplay>}
		}
	endif
	gman_songtool_getcurrentsong
	timesig_entry = 0
	songfilemanager func = get_num_timesig_notes song_name = <current_song>
	timesig_num_val = 0
	measure_count = 0
	songfilemanager func = get_num_fretbar_notes song_name = <current_song>
	fretbar_entry = 0
	fretbar_count = 0
	begin
	if (<timesig_entry> < <num_timesig_notes>)
		songfilemanager func = get_timesig_note song_name = <current_song> index = <timesig_entry>
		songfilemanager func = get_fretbar_note song_name = <current_song> index = <fretbar_entry>
		if (<timesig_time> <= <fretbar_time>)
			timesig_num_val = <timesig_num>
			fretbar_count = 0
			timesig_entry = (<timesig_entry> + 1)
		endif
	endif
	fretbar_count = (<fretbar_count> + 1)
	if (<fretbar_count> = <timesig_num_val>)
		measure_count = (<measure_count> + 1)
		fretbar_count = 0
	endif
	fretbar_entry = (<fretbar_entry> + 1)
	repeat <num_fretbar_notes>
	if (<measure_count> > 150)
		measures_per_menuitem = 2
	else
		measures_per_menuitem = 1
	endif
	timesig_entry = 0
	measure_count = 0
	fretbar_entry = 0
	fretbar_count = 0
	measures_per_menuitem_count = 0
	begin
	if (<timesig_entry> < <num_timesig_notes>)
		songfilemanager func = get_timesig_note song_name = <current_song> index = <timesig_entry>
		songfilemanager func = get_fretbar_note song_name = <current_song> index = <fretbar_entry>
		if (<timesig_time> <= <fretbar_time>)
			timesig_num_val = <timesig_num>
			fretbar_count = 0
			timesig_entry = (<timesig_entry> + 1)
		endif
	endif
	if (<fretbar_count> = 0)
		measures_per_menuitem_count = (<measures_per_menuitem_count> + 1)
		if (<measures_per_menuitem_count> = <measures_per_menuitem>)
			songfilemanager func = get_fretbar_note song_name = <current_song> index = <fretbar_entry>
			time = <fretbar_time>
			formatText TextName = menu_itemname qs(0x5fe38f1e) s = (<time> / 1000.0) m = <measure_count>
			printf qs(0xa77146ee) m = <menu_itemname>
			getplayerinfo \{1
				difficulty
				out = difficulty1}
			getplayerinfo \{2
				difficulty
				out = difficulty2}
			add_generic_menu_text_item {
				text = <menu_itemname>
				pad_choose_script = <menu_func>
				pad_choose_params = {song_name = <current_song> difficulty = <difficulty1> difficulty2 = <difficulty2> starttime = <time> from_gameplay = <from_gameplay>}
			}
			measures_per_menuitem_count = 0
		endif
	endif
	fretbar_count = (<fretbar_count> + 1)
	if (<fretbar_count> = <timesig_num_val>)
		measure_count = (<measure_count> + 1)
		fretbar_count = 0
	endif
	fretbar_entry = (<fretbar_entry> + 1)
	repeat <num_fretbar_notes>
	LaunchEvent \{Type = focus
		target = skipbymeasure_vmenu}
endscript

script back_to_skipbymeasure_menu 
	ScriptAssert \{'back_to_skipbymeasure_menu: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script destroy_skipbymeasure_menu 
	if ScreenElementExists \{id = skipbymeasure_scrolling_menu}
		DestroyScreenElement \{id = skipbymeasure_scrolling_menu}
	endif
	destroy_menu_backdrop
endscript

script create_looppoint_menu 
	ui_menu_select_sfx
	destroy_skipintosong_menu
	make_generic_menu {
		vmenu_id = looppoint_vmenu
		Pos = ($menu_pos - (0.0, 80.0))
		dims = (400.0, 500.0)
		z_priority = 100.0
		title_pos = ($menu_pos - (0.0, 80.0))
		title_just = [left top]
		pad_back_script = <callback>
		title = qs(0xc4e211c1)
		scrolling
		use_all_controllers
	}
	add_generic_menu_text_item {
		text = qs(0x4ed8d839)
		pad_choose_script = create_skipbytime_menu
		pad_choose_params = {looppoint from_gameplay = <from_gameplay>}
	}
	add_generic_menu_text_item {
		text = qs(0xda3a3908)
		pad_choose_script = create_skipbymarker_menu
		pad_choose_params = {looppoint from_gameplay = <from_gameplay>}
	}
	add_generic_menu_text_item {
		text = qs(0xec416e49)
		pad_choose_script = create_skipbymeasure_menu
		pad_choose_params = {looppoint from_gameplay = <from_gameplay>}
	}
	LaunchEvent \{Type = focus
		target = looppoint_vmenu}
endscript

script back_to_looppoint_menu 
	destroy_skipbytime_menu
	destroy_skipbymarker_menu
	destroy_skipbymeasure_menu
	create_looppoint_menu
endscript

script destroy_looppoint_menu 
	if ScreenElementExists \{id = looppoint_scrolling_menu}
		DestroyScreenElement \{id = looppoint_scrolling_menu}
	endif
	destroy_menu_backdrop
endscript

script set_looppoint 
	ui_menu_select_sfx
	Change current_looppoint = <starttime>
	gh3_start_pressed
endscript

script create_replay_menu 
	ui_menu_select_sfx
	destroy_debugging_menu
	x_pos = 450
	make_generic_menu {
		vmenu_id = replay_vmenu
		Pos = ($menu_pos - (0.0, 80.0))
		dims = (400.0, 500.0)
		title_pos = ($menu_pos - (0.0, 80.0))
		title_just = [left top]
		pad_back_script = back_to_tools_menu
		z_priority = 100.0
		title = qs(0xc1c448fd)
		scrolling
		use_all_controllers
	}
	StartWildcardSearch \{wildcard = 'buffers\\*.rep'}
	index = 0
	begin
	if NOT GetWildcardFile
		break
	endif
	add_generic_menu_text_item {
		text = <basename>
		pad_choose_script = play_replay
		pad_choose_params = {replay = <FileName> song_name = qs(0xfa9bd01d) difficulty = qs(0xfa9bd01d) difficulty2 = qs(0xfa9bd01d)}
	}
	<index> = (<index> + 1)
	repeat
	EndWildcardSearch
	LaunchEvent \{Type = focus
		target = replay_vmenu}
endscript

script back_to_replay_menu 
	ScriptAssert \{'back_to_replay_menu: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script destroy_replay_menu 
	generic_ui_destroy
endscript

script play_replay 
	destroy_replay_menu
	restart_gem_scroller <...>
endscript

script select_start_song 
	if GotParam \{forceintro}
		Change \{current_transition = forceintro}
	endif
	if GotParam \{song_name}
		gman_songtool_setcurrentsong song = <song_name>
	endif
	if GotParam \{difficulty}
		setplayerinfo 1 difficulty = <difficulty>
	endif
	if GotParam \{difficulty2}
		setplayerinfo 2 difficulty = <difficulty2>
	endif
	if GotParam \{starttime}
		Change current_starttime = <starttime>
	endif
	if GotParam \{part}
		setplayerinfo 1 part = <part>
	endif
	if GotParam \{part2}
		setplayerinfo 2 part = <part2>
	endif
	if GotParam \{from_gameplay}
		restart_warning_select_restart \{dont_save_song_data}
	else
		generic_event_choose data = {state = uistate_play_song starttime = <starttime> uselaststarttime = <uselaststarttime>}
	endif
	vocals_distribute_mics
	destroy_all_debug_menus
endscript

script start_song_with_intro 
	if ($selected_intro = -1)
		printf \{channel = Band
			qs(0x9be9bbab)}
		Change \{game_mode = gh4_p1_career}
		select_start_song uselaststarttime from_gameplay = <from_gameplay>
		return
	endif
	song_name = ($celeb_intro_transitions [$selected_intro].song)
	venue = ($celeb_intro_transitions [$selected_intro].venue)
	Intro = ($celeb_intro_transitions [$selected_intro].Intro)
	printf channel = Band qs(0xbba52acc) a = <song_name> b = <venue>
	printf channel = Band qs(0xbd425a18) a = <Intro>
	formatText checksumName = transition '%s' s = <Intro>
	Change current_transition = <transition>
	Change current_song = <song_name>
	Change current_level = <venue>
	Change \{current_starttime = 0}
	select_venue level = <venue>
endscript
selected_intro = 0

script toggle_intro_select_left 
	Change selected_intro = ($selected_intro - 1)
	if ($selected_intro < 0)
		GetArraySize \{$celeb_intro_transitions}
		Change selected_intro = (<array_Size> - 1)
	endif
	toggle_intro_select_setprop
endscript

script toggle_intro_select_right 
	Change selected_intro = ($selected_intro + 1)
	GetArraySize \{$celeb_intro_transitions}
	if ($selected_intro >= <array_Size>)
		Change \{selected_intro = 0}
	endif
	toggle_intro_select_setprop
endscript
toggle_intro_select_menuitem = 0

script toggle_intro_select_setprop 
	if ($selected_intro = -1)
		($toggle_intro_select_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x04a9d108)
		return
	endif
	intro_name = ($celeb_intro_transitions [$selected_intro].Intro)
	printf qs(0xe73b5f8d) a = <intro_name> b = $selected_intro
	formatText TextName = select_string qs(0xf2a04fcf) a = <intro_name>
	($toggle_intro_select_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = <select_string>
endscript

script ui_menu_scroll_sfx 
	SoundEvent \{event = ui_sfx_scroll}
	SoundEvent \{event = ui_sfx_scroll_add}
endscript

script ui_menu_select_sfx 
	printf \{channel = sfx
		qs(0x1908e25e)}
	SoundEvent \{event = ui_sfx_select}
endscript

script menu_focus 
	Obj_GetID
	<id> = <objID>
	SetScreenElementProps id = <id> rgba = [210 130 0 250]
endscript

script menu_unfocus 
	Obj_GetID
	<id> = <objID>
	SetScreenElementProps id = <id> rgba = [210 210 210 250]
endscript
debug_menu_mode = 1

script switch_to_retail_menu 
	ScriptAssert \{'switch_to_retail_menu: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script switch_to_debug_menu 
	ScriptAssert \{'switch_to_debug_menu: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script back_to_retail_menu 
	generic_event_back
endscript

script toggle_global 
	if GotParam \{global_toggle}
		if ($<global_toggle> = 1)
			Change GlobalName = <global_toggle> NewValue = 0
		else
			Change GlobalName = <global_toggle> NewValue = 1
		endif
	endif
endscript

script debug_checkcasassets 
	verify_cas_budgets \{textures
		profiles}
endscript
toggle_debugencore_menuitem = 0

script toggle_debugencore 
	if ($debug_encore = 0)
		Change \{debug_encore = 1}
	else
		Change \{debug_encore = 0}
	endif
	toggle_debugencore_setprop
endscript

script toggle_debugencore_setprop 
	if (($debug_encore) = 0)
		($toggle_debugencore_menuitem) :SetProps generic_menu_smenu_textitem_text_text = qs(0x7d2d164a)
	else
		($toggle_debugencore_menuitem) :SetProps generic_menu_smenu_textitem_text_text = qs(0x2f099195)
	endif
endscript
celebforce_enabled = 0
toggle_celebforce_menuitem = 0

script toggle_celebforce 
	if ($celebforce_enabled = 0)
		Change \{celebforce_enabled = 1}
	else
		Change \{celebforce_enabled = 0}
	endif
	toggle_celebforce_setprop
endscript

script toggle_celebforce_setprop 
	if (($celebforce_enabled) = 0)
		($toggle_celebforce_menuitem) :SetProps generic_menu_smenu_textitem_text_text = qs(0x60874674)
	else
		($toggle_celebforce_menuitem) :SetProps generic_menu_smenu_textitem_text_text = qs(0xd843e585)
	endif
endscript

script debug_dumpheaps 
	finalbuildmemreport
endscript
toggle_lightshow_menuitem = 0

script toggle_lightshow 
	if ($lightshow_enabled = 0)
		Change \{lightshow_enabled = 1}
		LightShow_SetActive \{Active = true}
	else
		Change \{lightshow_enabled = 0}
		LightShow_SetActive \{Active = FALSE}
	endif
	toggle_lightshow_setprop
endscript

script get_lightshow_state 
	ScriptAssert \{'get_lightshow_state: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script toggle_lightshow_setprop 
	if (($lightshow_enabled) = 0)
		($toggle_lightshow_menuitem) :SetProps generic_menu_smenu_textitem_text_text = qs(0xaf224d9c)
	else
		($toggle_lightshow_menuitem) :SetProps generic_menu_smenu_textitem_text_text = qs(0x9cb1bd56)
	endif
endscript
fsfx_enabled = 1
debug_dof = 0
toggle_fsfx_menuitem = 0

script toggle_fsfx 
	if ($fsfx_enabled = 0)
		Change \{fsfx_enabled = 1}
	else
		Change \{fsfx_enabled = 0}
	endif
	toggle_fsfx_setprop
endscript

script get_fsfx_state 
	ScriptAssert \{'get_fsfx_state: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script toggle_fsfx_setprop 
	if (($fsfx_enabled) = 0)
		($toggle_fsfx_menuitem) :SetProps generic_menu_smenu_textitem_text_text = qs(0xd13d7c3d)
	else
		($toggle_fsfx_menuitem) :SetProps generic_menu_smenu_textitem_text_text = qs(0x00c7fabe)
	endif
endscript
crowd_3d_enabled = 0
toggle_crowd_3d_menuitem = 0

script toggle_crowd_3d 
	if ($crowd_3d_enabled = 0)
		Change \{crowd_3d_enabled = 1}
		force3dcrowd
	else
		Change \{crowd_3d_enabled = 0}
		donotforce3dcrowd
	endif
	toggle_crowd_3d_setprop
endscript

script toggle_crowd_3d_setprop 
	if (($crowd_3d_enabled) = 0)
		($toggle_crowd_3d_menuitem) :SetProps generic_menu_smenu_textitem_text_text = qs(0x29827d93)
	else
		($toggle_crowd_3d_menuitem) :SetProps generic_menu_smenu_textitem_text_text = qs(0xa27ceed1)
	endif
endscript
light_map_debug_enabled = 0
toggle_light_map_debug_menuitem = 0

script toggle_light_map_debug 
	if ($light_map_debug_enabled = 0)
		Change \{light_map_debug_enabled = 1}
	else
		Change \{light_map_debug_enabled = 0}
	endif
	toggle_light_map_debug_setprop
endscript

script toggle_light_map_debug_setprop 
	if (($light_map_debug_enabled) = 0)
		($toggle_light_map_debug_menuitem) :SetProps generic_menu_smenu_textitem_text_text = qs(0x95a73828)
	else
		($toggle_light_map_debug_menuitem) :SetProps generic_menu_smenu_textitem_text_text = qs(0x0d3435b9)
	endif
endscript

script create_dlcflags_debug_menu 
	ui_menu_select_sfx
	destroy_all_debug_menus
	destroy_dlcflags_debug_menu
	make_generic_menu {
		vmenu_id = dlcflags_debug_vmenu
		Pos = ($menu_pos - (0.0, 80.0))
		dims = (400.0, 500.0)
		title_pos = ($menu_pos - (0.0, 80.0))
		title_just = [left top]
		pad_back_script = back_to_debug_menu
		z_priority = 100.0
		title = qs(0x5f787f81)
		scrolling
		use_all_controllers
	}
	add_generic_menu_text_item \{text = 'Hide Content Catalog:'
		pad_choose_script = dlc_toggle_catalog_hidden}
	Change toggle_dlc_catalog_hidden_menuitem = <item_container_id>
	dlc_toggle_catalog_hidden \{toggle = 0}
	<index> = 1
	begin
	cntgetflags song_index = <index>
	formatText TextName = text 'DLC %i ' i = <index>
	if (<flag_owned> = true)
		formatText TextName = text '%tO' t = <text>
	endif
	if (<flag_present> = true)
		formatText TextName = text '%tP' t = <text>
	endif
	if (<flag_corrupt> = true)
		formatText TextName = text '%tC' t = <text>
	endif
	add_generic_menu_text_item {
		text = <text>
		pad_choose_script = create_dlcflags_editor_debug_menu
		pad_choose_params = {index = <index>}
	}
	<index> = (<index> + 1)
	repeat 100
	LaunchEvent \{Type = focus
		target = dlcflags_debug_vmenu}
endscript

script destroy_dlcflags_debug_menu 
	if ScreenElementExists \{id = dlcflags_debug_menu}
		DestroyScreenElement \{id = dlcflags_debug_menu}
	endif
	destroy_generic_backdrop
endscript
toggle_dlc_catalog_hidden_menuitem = 0

script dlc_toggle_catalog_hidden \{toggle = 1}
	if (<toggle> = 1)
		Change dlc_hide_catalog = (1 - ($dlc_hide_catalog))
	endif
	if (($dlc_hide_catalog) = 1)
		($toggle_dlc_catalog_hidden_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x234c31e4)
	else
		($toggle_dlc_catalog_hidden_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x085bd5f2)
	endif
endscript

script create_dlcflags_editor_debug_menu 
	ui_menu_select_sfx
	destroy_all_debug_menus
	destroy_dlcflags_debug_menu
	cntgetflags song_index = <index>
	formatText TextName = header_text qs(0xfc231432) i = <index>
	make_generic_menu {
		vmenu_id = dlcflags_debug_vmenu
		Pos = ($menu_pos - (0.0, 80.0))
		dims = (400.0, 500.0)
		title_pos = ($menu_pos - (0.0, 80.0))
		title_just = [left top]
		z_priority = 100.0
		pad_back_script = create_dlcflags_debug_menu
		title = <header_text>
		scrolling
		use_all_controllers
	}
	if (<flag_owned> = true)
		<owned_text> = qs(0xc5b0e818)
	else
		<owned_text> = qs(0xe4291871)
	endif
	if (<flag_present> = true)
		<present_text> = qs(0xbc361d28)
	else
		<present_text> = qs(0xac620a8f)
	endif
	if (<flag_corrupt> = true)
		<corrupt_text> = qs(0x65a0bc99)
	else
		<corrupt_text> = qs(0x88048565)
	endif
	add_generic_menu_text_item {
		text = <owned_text>
		pad_choose_script = dlcflags_edit
		pad_choose_params = {index = <index> flag = 1}
	}
	add_generic_menu_text_item {
		text = <present_text>
		pad_choose_script = dlcflags_edit
		pad_choose_params = {index = <index> flag = 0}
	}
	add_generic_menu_text_item {
		text = <corrupt_text>
		pad_choose_script = dlcflags_edit
		pad_choose_params = {index = <index> flag = 2}
	}
	add_generic_menu_text_item {
		text = qs(0x5bdb8c73)
		pad_choose_script = dlcflags_reset
		pad_choose_params = {index = <index>}
	}
	LaunchEvent \{Type = focus
		target = dlcflags_debug_vmenu}
endscript

script dlcflags_edit 
	cnttoggleflag song_index = <index> flag = <flag>
	create_dlcflags_editor_debug_menu index = <index>
endscript

script dlcflags_reset 
	updatecontentindex song_index = <index>
	create_dlcflags_editor_debug_menu index = <index>
endscript

script create_photobot_debug_menu 
	ui_menu_select_sfx
	destroy_debugging_menu
	make_generic_menu {
		vmenu_id = photobot_debug_vmenu
		Pos = ($menu_pos - (0.0, 80.0))
		dims = (400.0, 500.0)
		title_pos = ($menu_pos - (0.0, 80.0))
		title_just = [left top]
		pad_back_script = back_to_tools_menu
		z_priority = 100.0
		title = qs(0x23a76ddd)
		scrolling
		use_all_controllers
	}
	array_entry = 0
	array_Size = 6
	begin
	get_LevelZoneArray_checksum index = <array_entry>
	formatText TextName = opt_text1 qs(0xabc52c54) v = ($LevelZones.<level_checksum>.title)
	formatText TextName = opt_text2 qs(0xe48212c3) v = ($LevelZones.<level_checksum>.title)
	add_generic_menu_text_item {
		text = <opt_text1>
		pad_choose_script = photobot_startup
		pad_choose_params = {venue = <array_entry> section = 0}
	}
	add_generic_menu_text_item {
		text = <opt_text2>
		pad_choose_script = photobot_startup
		pad_choose_params = {venue = <array_entry> section = 1}
	}
	<array_entry> = (<array_entry> + 1)
	repeat <array_Size>
	LaunchEvent \{Type = focus
		target = photobot_debug_vmenu}
endscript

script destroy_photobot_debug_menu 
	if ScreenElementExists \{id = photobot_debug_menu}
		DestroyScreenElement \{id = photobot_debug_menu}
	endif
	destroy_generic_backdrop
endscript

script create_choose_quickplay_venue_menu 
	ui_menu_select_sfx
	destroy_debugging_menu
	make_generic_menu {
		vmenu_id = choose_quickplay_venue_vmenu
		Pos = ($menu_pos - (0.0, 80.0))
		dims = (400.0, 500.0)
		title_pos = ($menu_pos - (0.0, 80.0))
		title_just = [left top]
		pad_back_script = back_to_settings_menu
		z_priority = 100.0
		title = qs(0x23a76ddd)
		scrolling
		use_all_controllers
	}
	get_LevelZoneArray_size
	array_count = 0
	begin
	get_LevelZoneArray_checksum index = <array_count>
	add_generic_menu_text_item {
		text = ($LevelZones.<level_checksum>.title)
		pad_choose_script = choose_quickplay_venue
		pad_choose_params = {level = <level_checksum>}
	}
	<array_count> = (<array_count> + 1)
	repeat <array_Size>
	LaunchEvent \{Type = focus
		target = choose_quickplay_venue_vmenu}
endscript

script choose_quickplay_venue 
	Change quickplay_venue = <level>
	generic_menu_pad_choose_sound
endscript

script destroy_choose_quickplay_venue_menu 
	if ScreenElementExists \{id = choose_quickplay_venue_scrolling_menu}
		DestroyScreenElement \{id = choose_quickplay_venue_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript
debug_memory_graphs_enabled = 0
toggle_memory_graphs_menuitem = 0

script debug_toggle_memory_graphs 
	if ($debug_memory_graphs_enabled = 0)
		wii_start_memory_graphing
		Change \{debug_memory_graphs_enabled = 1}
	else
		wii_stop_memory_graphing
		Change \{debug_memory_graphs_enabled = 0}
	endif
endscript

script debug_toggle_memory_graphs_setprop 
	if ($debug_memory_graphs_enabled = 1)
		($toggle_memory_graphs_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x4578ff06)
	else
		($toggle_memory_graphs_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x8d4be9bd)
	endif
endscript
debug_shreddfest_override = 0
toggle_shreddfest_menuitem = 0

script toggle_shreddfest_mode 
	switch $debug_shreddfest_override
		case 0
		Change \{debug_shreddfest_override = 1}
		case 1
		Change \{debug_shreddfest_override = 0}
		default
		Change \{debug_shreddfest_override = 0}
	endswitch
	toggle_shreddfest_setprop
endscript

script toggle_shreddfest_setprop 
	switch $debug_shreddfest_override
		case 0
		($toggle_shreddfest_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x089bf491)
		case 1
		($toggle_shreddfest_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0xb8439cbb)
		default
		($toggle_shreddfest_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x71f1fd39)
	endswitch
endscript

script create_game_modes_menu 
	ui_menu_select_sfx
	destroy_debugging_menu
	make_generic_menu {
		vmenu_id = game_modes_vmenu
		Pos = ($menu_pos - (0.0, 80.0))
		dims = (400.0, 500.0)
		z_priority = 100.0
		title_pos = ($menu_pos - (0.0, 80.0))
		title_just = [left top]
		pad_back_script = back_to_debug_menu
		title = qs(0x350e7e6b)
		scrolling
		use_all_controllers
	}
	add_generic_menu_text_item \{text = qs(0x614c028b)
		pad_choose_script = start_trivia
		pad_choose_params = {
			use_ui
		}
		pad_left_script = toggle_triviamode_left
		pad_right_script = toggle_triviamode_right}
	Change triviamode_menuitem = <item_container_id>
	toggle_triviamode_setprop
	add_generic_menu_text_item \{text = qs(0x0d5665dd)
		pad_choose_script = ui_event
		pad_choose_params = {
			event = menu_change
			data = {
				state = uistate_songlist
			}
		}}
	add_generic_menu_text_item \{text = qs(0xff8a51b9)
		pad_choose_script = start_career_proto}
	LaunchEvent \{Type = focus
		target = game_modes_vmenu}
endscript

script back_to_game_modes_menu 
	ScriptAssert \{'back_to_game_modes_menu: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script destroy_game_modes_menu 
	generic_ui_destroy
endscript

script create_in_game_menu 
	ui_menu_select_sfx
	destroy_debugging_menu
	make_generic_menu {
		vmenu_id = ingame_vmenu
		Pos = ($menu_pos - (0.0, 80.0))
		dims = (400.0, 500.0)
		title_pos = ($menu_pos - (0.0, 80.0))
		title_just = [left top]
		pad_back_script = back_to_debug_menu
		z_priority = 100.0
		title = qs(0xbc3551da)
		scrolling
		use_all_controllers
	}
	add_generic_menu_text_item \{text = qs(0x3a6fcdf2)
		pad_choose_script = toggle_allowcontroller}
	Change allowcontroller_menuitem = <item_container_id>
	toggle_allowcontroller_setprop
	add_generic_menu_text_item {
		text = qs(0x3511e773)
		pad_choose_script = select_playermode
		pad_choose_params = {from_gameplay = <from_gameplay>}
		pad_left_script = toggle_playermode_left
		pad_right_script = toggle_playermode_right
	}
	Change playermode_menuitem = <item_container_id>
	toggle_playermode_setprop
	add_generic_menu_text_item {
		text = qs(0x414faedc)
		pad_choose_script = create_skipintosong_menu
		pad_choose_params = {from_gameplay = <from_gameplay>}
	}
	add_generic_menu_text_item \{text = qs(0x0606bdb8)
		pad_choose_script = create_changevenue_menu}
	add_generic_menu_text_item \{text = qs(0xee9082db)
		pad_choose_script = select_slomo}
	Change select_slomo_menuitem = <item_container_id>
	select_slomo_setprop
	add_generic_menu_text_item \{text = qs(0x474a49b8)
		pad_choose_script = create_cameracut_group_menu}
	add_generic_menu_text_item \{text = qs(0x590374a2)
		pad_choose_script = create_snapshot_menu}
	add_generic_menu_text_item \{text = qs(0x31fe1190)
		pad_choose_script = toggle_forcescore}
	Change toggle_forcescore_menuitem = <item_container_id>
	toggle_forcescore_setprop
	add_generic_menu_text_item \{text = qs(0x27229b60)
		pad_choose_script = toggle_debugencore}
	Change toggle_debugencore_menuitem = <item_container_id>
	toggle_debugencore_setprop
	add_generic_menu_text_item \{text = qs(0x383d3b95)
		pad_choose_script = toggle_celebforce}
	Change toggle_celebforce_menuitem = <item_container_id>
	toggle_celebforce_setprop
	add_generic_menu_text_item \{text = qs(0xac1fbd2e)
		pad_choose_script = toggle_lightshow}
	Change toggle_lightshow_menuitem = <item_container_id>
	toggle_lightshow_setprop
	add_generic_menu_text_item \{text = qs(0x082f839f)
		pad_choose_script = toggle_crowd_3d}
	Change toggle_crowd_3d_menuitem = <item_container_id>
	toggle_crowd_3d_setprop
	add_generic_menu_text_item \{text = qs(0xf9c72116)
		pad_choose_script = toggle_light_map_debug}
	Change toggle_light_map_debug_menuitem = <item_container_id>
	toggle_light_map_debug_setprop
	add_generic_menu_text_item \{text = qs(0x3fefac92)
		pad_choose_script = reloadambientmap}
	add_generic_menu_text_item \{text = qs(0xc0f803cc)
		pad_choose_script = toggle_fsfx}
	Change toggle_fsfx_menuitem = <item_container_id>
	toggle_fsfx_setprop
	add_generic_menu_text_item \{text = qs(0x5f3febe6)
		pad_choose_script = toggle_debug_fsfx}
	Change toggle_debug_fsfx_menuitem = <item_container_id>
	toggle_debug_fsfx_setprop
	add_generic_menu_text_item \{text = qs(0xde8d6a97)
		pad_choose_script = toggle_debug_fsfx_ui}
	Change toggle_debug_fsfx_ui_menuitem = <item_container_id>
	toggle_debug_fsfx_ui_setprop
	add_generic_menu_text_item \{text = qs(0x401b66b2)
		pad_choose_script = toggle_viz}
	Change toggle_viz_menuitem = <item_container_id>
	toggle_viz_setprop
	add_generic_menu_text_item \{text = qs(0xd5165cad)
		pad_choose_script = toggle_vocalsdebug}
	Change toggle_vocalsdebug_menuitem = <item_container_id>
	toggle_vocalsdebug_setprop
	add_generic_menu_text_item \{text = qs(0xaa524fbd)
		pad_choose_script = toggle_vocalsfreeform}
	Change toggle_vocalsfreeform_menuitem = <item_container_id>
	toggle_vocalsfreeform_setprop
	add_generic_menu_text_item {
		text = qs(0xbeef52ab)
		pad_choose_script = select_start_song
		pad_choose_params = {uselaststarttime from_gameplay = <from_gameplay>}
	}
	add_generic_menu_text_item {
		text = qs(0x04a9d108)
		pad_choose_script = select_start_song
		pad_choose_params = {uselaststarttime forceintro from_gameplay = <from_gameplay>}
	}
	add_generic_menu_text_item \{text = qs(0xd37611a5)
		pad_choose_script = create_character_viewer_menu}
	add_generic_menu_text_item \{text = qs(0x0dfc3e9e)
		pad_left_script = toggle_intro_select_left
		pad_right_script = toggle_intro_select_right
		pad_choose_script = start_song_with_intro}
	Change toggle_intro_select_menuitem = <item_container_id>
	toggle_intro_select_setprop
	LaunchEvent \{Type = focus
		target = ingame_vmenu}
endscript

script back_to_in_game_menu 
	destroy_all_debug_menus
	create_in_game_menu
endscript

script destroy_in_game_menu 
	generic_ui_destroy
endscript

script create_hud_ui_menu 
	ui_menu_select_sfx
	destroy_debugging_menu
	make_generic_menu {
		vmenu_id = hud_ui_vmenu
		Pos = ($menu_pos - (0.0, 80.0))
		dims = (400.0, 500.0)
		title_pos = ($menu_pos - (0.0, 80.0))
		title_just = [left top]
		pad_back_script = back_to_debug_menu
		z_priority = 100.0
		title = qs(0x37767de1)
		scrolling
		use_all_controllers
	}
	add_generic_menu_text_item \{text = qs(0x8f65d32f)
		pad_choose_script = create_togglevisibility_menu}
	add_generic_menu_text_item \{text = qs(0x680492d0)
		pad_choose_script = toggle_showmeasures}
	Change toggle_showmeasures_menuitem = <item_container_id>
	toggle_showmeasures_setprop
	add_generic_menu_text_item \{text = qs(0xdae59d1c)
		pad_choose_script = toggle_showsongstars}
	Change toggle_showsongstars_menuitem = <item_container_id>
	toggle_showsongstars_setprop
	add_generic_menu_text_item \{text = qs(0xba249053)
		pad_choose_script = toggle_showsongtime}
	Change toggle_showsongtime_menuitem = <item_container_id>
	toggle_showsongtime_setprop
	add_generic_menu_text_item \{text = qs(0x3630af7e)
		pad_choose_script = toggle_showcameraname}
	Change toggle_showcameraname_menuitem = <item_container_id>
	toggle_showcameraname_setprop
	add_generic_menu_text_item \{text = qs(0x32db050e)
		pad_choose_script = toggle_inputlog}
	Change toggle_inputlog_menuitem = <item_container_id>
	toggle_inputlog_setprop
	add_generic_menu_text_item \{text = qs(0x0979628f)
		pad_choose_script = toggle_rockmeterdebug}
	Change toggle_rockmeterdebug_menuitem = <item_container_id>
	toggle_rockmeterdebug_setprop
	add_generic_menu_text_item \{text = qs(0x9c31fd21)
		pad_choose_script = toggle_prototype_sp}
	Change toggle_prototype_sp_menuitem = <item_container_id>
	toggle_prototype_sp_setprop
	LaunchEvent \{Type = focus
		target = hud_ui_vmenu}
endscript

script back_to_hud_ui_menu 
	destroy_all_debug_menus
	create_hud_ui_menu
endscript

script destroy_hud_ui_menu 
	generic_ui_destroy
endscript

script create_band_setup_menu 
	ui_menu_select_sfx
	destroy_debugging_menu
	make_generic_menu {
		vmenu_id = band_setup_vmenu
		Pos = ($menu_pos - (0.0, 80.0))
		dims = (400.0, 500.0)
		title_pos = ($menu_pos - (0.0, 80.0))
		title_just = [left top]
		pad_back_script = back_to_debug_menu
		z_priority = 100.0
		title = qs(0xdb4779a7)
		scrolling
		use_all_controllers
	}
	array_count = 1
	array = []
	begin
	add_generic_menu_text_item {
		text = qs(0xde83c410)
		pad_choose_script = toggle_bot
		pad_choose_params = {Player = <array_count>}
	}
	AddArrayElement array = <array> element = <item_container_id>
	array_count = (<array_count> + 1)
	repeat 4
	Change toggle_bot_menuitem = <array>
	toggle_bot_setprop
	array_count = 1
	array = []
	begin
	add_generic_menu_text_item {
		text = qs(0x7505b54f)
		pad_choose_script = toggle_star
		pad_choose_params = {Player = <array_count>}
	}
	AddArrayElement array = <array> element = <item_container_id>
	array_count = (<array_count> + 1)
	repeat 4
	Change toggle_star_menuitem = <array>
	toggle_star_setprop
	array_count = 1
	array = []
	begin
	add_generic_menu_text_item {
		text = qs(0x8b8a7f63)
		pad_left_script = toggle_hyperspeed_left
		pad_left_params = {Player = <array_count>}
		pad_right_script = toggle_hyperspeed_right
		pad_right_params = {Player = <array_count>}
	}
	AddArrayElement array = <array> element = <item_container_id>
	array_count = (<array_count> + 1)
	repeat 4
	Change toggle_hyperspeed_menuitem = <array>
	toggle_hyperspeed_setprop
	LaunchEvent \{Type = focus
		target = band_setup_vmenu}
endscript

script back_to_band_setup_menu 
	ScriptAssert \{'back_to_band_setup_menu: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script destroy_band_setup_menu 
	generic_ui_destroy
endscript

script create_tools_menu 
	ui_menu_select_sfx
	destroy_debugging_menu
	make_generic_menu {
		vmenu_id = tools_vmenu
		Pos = ($menu_pos - (0.0, 80.0))
		dims = (400.0, 500.0)
		title_pos = ($menu_pos - (0.0, 80.0))
		title_just = [left top]
		pad_back_script = back_to_debug_menu
		z_priority = 100.0
		title = qs(0x23a76ddd)
		scrolling
		use_all_controllers
	}
	add_generic_menu_text_item \{text = qs(0xb0da850e)
		pad_choose_script = 0x9ac46fe9}
	add_generic_menu_text_item \{text = qs(0x91779a3e)
		pad_choose_script = debug_add_developer_console_friends}
	add_generic_menu_text_item \{text = qs(0xb3a31722)
		pad_choose_script = debug_add_qa_console_friends}
	add_generic_menu_text_item \{text = qs(0x848bd53d)
		pad_choose_script = debug_clear_all_console_friends}
	add_generic_menu_text_item \{text = qs(0x79aee6c5)
		pad_choose_script = debug_checkcasassets}
	add_generic_menu_text_item \{text = qs(0xbc1f222f)
		pad_choose_script = debug_dumpheaps}
	add_generic_menu_text_item \{text = qs(0x6bbf81bd)
		pad_choose_script = toggle_model_viewer}
	add_generic_menu_text_item \{text = qs(0xc540004a)
		pad_choose_script = create_difficulty_analyzer_menu}
	add_generic_menu_text_item \{text = qs(0x7b0ed426)
		pad_choose_script = debug_toggle_changelist}
	add_generic_menu_text_item \{text = qs(0x3fd0ccc7)
		pad_choose_script = lightshow_toggledebuginfo}
	add_generic_menu_text_item \{text = qs(0xc44068b1)
		pad_choose_script = toggle_animdebug}
	Change toggle_animdebug_menuitem = <item_container_id>
	toggle_animdebug_setprop
	add_generic_menu_text_item \{text = qs(0x3105b961)
		pad_choose_script = toggle_camanimdebug}
	Change toggle_camanimdebug_menuitem = <item_container_id>
	toggle_camanimdebug_setprop
	add_generic_menu_text_item \{text = qs(0x1a1da5ce)
		pad_choose_script = toggle_newanimdebug}
	Change toggle_newanimdebug_menuitem = <item_container_id>
	toggle_newanimdebug_setprop
	add_generic_menu_text_item \{text = qs(0xdb091893)
		pad_choose_script = generic_event_choose
		pad_choose_params = {
			state = uistate_debug_color_calibration
		}}
	add_generic_menu_text_item \{text = qs(0xf8c4f04f)
		pad_choose_script = toggle_global
		pad_choose_params = {
			global_toggle = show_gpu_time
		}}
	add_generic_menu_text_item \{text = qs(0x2cf5bcc8)
		pad_choose_script = toggle_global
		pad_choose_params = {
			global_toggle = show_cpu_time
		}}
	add_generic_menu_text_item \{text = qs(0x5ad98d77)
		pad_left_script = edit_inputlog_lines_left
		pad_right_script = edit_inputlong_lines_right}
	Change edit_inputlog_lines_menuitem = <item_container_id>
	edit_inputlog_lines_setprop
	add_generic_menu_text_item \{text = qs(0xb594248a)
		pad_choose_script = debug_toggle_memory_graphs}
	Change toggle_memory_graphs_menuitem = <item_container_id>
	debug_toggle_memory_graphs_setprop
	add_generic_menu_text_item \{text = qs(0xe54e49fe)
		pad_choose_script = create_photobot_debug_menu}
	LaunchEvent \{Type = focus
		target = tools_vmenu}
endscript

script back_to_tools_menu 
	destroy_all_debug_menus
	create_tools_menu
endscript

script destroy_tools_menu 
	generic_ui_destroy
endscript

script back_to_unlocks_menu 
	ScriptAssert \{'back_to_unlocks_menu: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script destroy_unlocks_menu 
	generic_ui_destroy
endscript

script create_wii_menu 
	ui_menu_select_sfx
	destroy_debugging_menu
	make_generic_menu {
		vmenu_id = tools_vmenu
		Pos = ($menu_pos - (0.0, 80.0))
		dims = (400.0, 500.0)
		title_pos = ($menu_pos - (0.0, 80.0))
		title_just = [left top]
		pad_back_script = back_to_debug_menu
		z_priority = 100.0
		title = qs(0x22f576c5)
		scrolling
		use_all_controllers
	}
	add_generic_menu_text_item \{text = qs(0xe408f841)
		pad_choose_script = launch_offline_friends_list}
	add_generic_menu_text_item \{text = qs(0x5f787f81)
		pad_choose_script = create_dlcflags_debug_menu}
	add_generic_menu_text_item \{text = qs(0x90fc09c3)
		pad_choose_script = generic_event_choose
		pad_choose_params = {
			state = uistate_rock_archive
		}}
	add_generic_menu_text_item \{text = qs(0x706dd02c)
		pad_choose_script = toggle_show_only_skinned}
	Change toggle_skinned_menu_item = <item_container_id>
	Change show_only_skinned = (1 - ($show_only_skinned))
	toggle_show_only_skinned
	add_generic_menu_text_item \{text = qs(0x63638989)
		pad_choose_script = toggle_show_skin_count}
	add_generic_menu_text_item \{text = qs(0xeee64107)
		pad_choose_script = wii_screen_logger_clear}
	LaunchEvent \{Type = focus
		target = tools_vmenu}
endscript

script back_to_wii_menu 
	ScriptAssert \{'back_to_wii_menu: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script destroy_wii_menu 
	generic_ui_destroy
endscript

script create_settings_menu 
	ui_menu_select_sfx
	destroy_debugging_menu
	make_generic_menu {
		vmenu_id = settings_vmenu
		Pos = ($menu_pos - (0.0, 80.0))
		dims = (400.0, 500.0)
		title_pos = ($menu_pos - (0.0, 80.0))
		title_just = [left top]
		pad_back_script = back_to_debug_menu
		z_priority = 100.0
		title = qs(0x3eee694e)
		scrolling
		use_all_controllers
	}
	add_generic_menu_text_item \{text = qs(0xc38c9894)
		pad_choose_script = toggle_aspect_ratio}
	Change toggle_aspect_ratio_menuitem = <item_container_id>
	toggle_aspect_ratio_setprop
	add_generic_menu_text_item \{text = qs(0xc84f3f3e)
		pad_choose_script = toggle_progressive_scan}
	Change toggle_progressive_scan_menuitem = <item_container_id>
	toggle_progressive_scan_setprop
	add_generic_menu_text_item \{text = qs(0x3cb6d6b7)
		pad_choose_script = toggle_leftyflip}
	Change toggle_leftyflip_menuitem = <item_container_id>
	toggle_leftyflip_setprop
	add_generic_menu_text_item \{text = qs(0x179a9d9d)
		pad_choose_script = toggle_rolandkit}
	Change toggle_rolandkit_menuitem = <item_container_id>
	toggle_rolandkit_setprop
	add_generic_menu_text_item \{text = qs(0x35ab50de)
		pad_choose_script = toggle_guitar_touch_test}
	Change toggle_guitar_touch_test_menuitem = <item_container_id>
	toggle_guitar_touch_test_setprop
	add_generic_menu_text_item \{text = qs(0x70efad92)
		pad_choose_script = create_dof_menu}
	add_generic_menu_text_item \{text = qs(0xa1474260)
		pad_choose_script = toggle_gpu_threshold}
	Change toggle_gpu_threshold_menuitem = <item_container_id>
	toggle_gpu_threshold_setprop
	add_generic_menu_text_item \{text = qs(0xfc5d33b9)
		pad_choose_script = toggle_on_audible_hitnote}
	Change toggle_on_audible_hitnote_menuitem = <item_container_id>
	toggle_on_audible_hitnote_setprop
	add_generic_menu_text_item \{text = qs(0xc4a7a4c2)
		pad_choose_script = toggle_shreddfest_mode}
	Change toggle_shreddfest_menuitem = <item_container_id>
	toggle_shreddfest_setprop
	if ($quickplay_venue = None)
		<venue_text> = qs(0x91288e96)
	else
		<the_venue> = $quickplay_venue
		formatText TextName = venue_text qs(0xf47dc623) a = ($LevelZones.<the_venue>.title)
	endif
	add_generic_menu_text_item {
		text = <venue_text>
		pad_choose_script = create_choose_quickplay_venue_menu
	}
	LaunchEvent \{Type = focus
		target = settings_vmenu}
endscript

script create_dof_menu 
	ui_menu_select_sfx
	destroy_in_game_menu
	make_generic_menu {
		vmenu_id = dof_vmenu
		Pos = ($menu_pos - (0.0, 80.0))
		dims = (400.0, 500.0)
		title_pos = ($menu_pos - (0.0, 80.0))
		title_just = [left top]
		pad_back_script = back_to_settings_menu
		z_priority = 100.0
		title = qs(0x70efad92)
		scrolling
		use_all_controllers
	}
	add_generic_menu_text_item \{text = qs(0x8eebec3f)
		pad_choose_script = toggle_dof_override}
	Change toggle_dof_override_menuitem = <item_container_id>
	toggle_dof_override_setprop
	add_generic_menu_text_item \{text = qs(0xa3a2589c)
		pad_choose_script = toggle_dof_strength}
	Change toggle_dof_strength_menuitem = <item_container_id>
	toggle_dof_strength_setprop
	add_generic_menu_text_item \{text = qs(0xb02b096e)
		pad_choose_script = toggle_dof_backdist}
	Change toggle_dof_backdist_menuitem = <item_container_id>
	toggle_dof_backdist_setprop
	LaunchEvent \{Type = focus
		target = dof_vmenu}
endscript

script back_to_dof_menu 
	ScriptAssert \{'back_to_dof_menu: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script destroy_dof_menu 
	ScriptAssert \{'destroy_dof_menu: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript
toggle_skinned_menu_item = 0
show_only_skinned = 0

script toggle_show_only_skinned 
	Change show_only_skinned = (1 - ($show_only_skinned))
	if (($show_only_skinned) = 1)
		($toggle_skinned_menu_item) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x630accd6)
	else
		($toggle_skinned_menu_item) :se_setprops generic_menu_smenu_textitem_text_text = qs(0xb3a36bc6)
	endif
endscript
skinned_verts = -1

script toggle_show_skin_count 
	formatText \{TextName = skinned_count_text
		qs(0x48c6d14c)
		d = $skinned_verts}
	if NOT ScreenElementExists \{id = skin_text}
		CreateScreenElement \{id = skin_count_bg
			Type = SpriteElement
			parent = root_window
			dims = (180.0, 40.0)
			Pos = (300.0, 90.0)
			just = [
				left
				left
			]
			rgba = [
				0
				0
				0
				255
			]
			alpha = 1
			z_priority = 6001}
		CreateScreenElement \{id = skin_text
			Type = TextElement
			parent = root_window
			font = text_a1
			text = $skinned_count_text
			Pos = (300.0, 90.0)
			Scale = 1.0
			just = [
				left
				left
			]
			Priority = 6001
			rgba = [
				255
				255
				255
				255
			]
			z_priority = 6002}
	else
		DestroyScreenElement \{id = skin_text}
		DestroyScreenElement \{id = skin_count_bg}
	endif
endscript

script refresh_skin_text 
	if ScreenElementExists \{id = skin_text}
		formatText \{TextName = skinned_count_text
			qs(0x48c6d14c)
			d = $skinned_verts}
		skin_text :se_setprops text = <skinned_count_text>
	endif
endscript

script debug_add_developer_console_friends 
	debugadddeveloperfriends
endscript

script debug_add_qa_console_friends 
	debugaddqafriends
endscript

script debug_clear_all_console_friends 
	debugclearallfriends
endscript

script 0x9ac46fe9 
	if ScriptIsRunning \{qa_debug_overlay_task}
		qa_debug_overlay_destroy
	else
		qa_debug_overlay
	endif
endscript

script create_freestyle_debug_menu 
	ui_menu_select_sfx
	destroy_debugging_menu
	make_generic_menu {
		vmenu_id = tools_vmenu
		Pos = ($menu_pos - (0.0, 80.0))
		dims = (400.0, 500.0)
		title_pos = ($menu_pos - (0.0, 80.0))
		title_just = [left top]
		pad_back_script = back_to_debug_menu
		z_priority = 100.0
		title = qs(0x13c88506)
		scrolling
		use_all_controllers
	}
	add_generic_menu_text_item \{text = qs(0x65d32c36)
		pad_choose_script = generic_event_choose
		pad_choose_script = freestyle_debug_reload_samples}
	add_generic_menu_text_item \{text = qs(0x6a631552)
		pad_choose_script = toggle_freestyle_auto_play_highways}
	Change toggle_freestyle_auto_play_highways_menuitem = <item_container_id>
	toggle_freestyle_auto_play_highways_setprop
	add_generic_menu_text_item \{text = qs(0x8a929a38)
		pad_choose_script = toggle_freestyle_force_ai_tracks}
	Change toggle_freestyle_force_ai_tracks_menuitem = <item_container_id>
	toggle_freestyle_force_ai_tracks_setprop
	add_generic_menu_text_item \{text = qs(0x383b9572)
		pad_choose_script = toggle_freestyle_force_song_progression}
	Change toggle_freestyle_force_song_progression_menuitem = <item_container_id>
	toggle_freestyle_force_song_progression_setprop
	add_generic_menu_text_item \{text = qs(0xe7f344d7)
		pad_choose_script = toggle_freestyle_debug_song_info}
	Change toggle_freestyle_debug_song_info_menuitem = <item_container_id>
	toggle_freestyle_debug_song_info_setprop
	LaunchEvent \{Type = focus
		target = tools_vmenu}
endscript

script destroy_freestyle_debug_menu 
	generic_ui_destroy
endscript
toggle_freestyle_auto_play_highways_status = 0
toggle_freestyle_auto_play_highways_menuitem = 0

script toggle_freestyle_auto_play_highways 
	if ($toggle_freestyle_auto_play_highways_status = 0)
		freestyle_debug_auto_play_highways \{enable = true}
		Change \{toggle_freestyle_auto_play_highways_status = 1}
	else
		freestyle_debug_auto_play_highways \{enable = FALSE}
		Change \{toggle_freestyle_auto_play_highways_status = 0}
	endif
	toggle_freestyle_auto_play_highways_setprop
endscript

script toggle_freestyle_auto_play_highways_setprop 
	if ($toggle_freestyle_auto_play_highways_status = 1)
		($toggle_freestyle_auto_play_highways_menuitem) :SetProps generic_menu_smenu_textitem_text_text = qs(0x2b8d6009)
	else
		($toggle_freestyle_auto_play_highways_menuitem) :SetProps generic_menu_smenu_textitem_text_text = qs(0x6a631552)
	endif
endscript
toggle_freestyle_force_ai_tracks_menuitem = 0

script toggle_freestyle_force_ai_tracks 
	if ($freestyle_debug_force_ai_tracks = 0)
		Change \{freestyle_debug_force_ai_tracks = 1}
	else
		Change \{freestyle_debug_force_ai_tracks = 0}
	endif
	toggle_freestyle_force_ai_tracks_setprop
endscript

script toggle_freestyle_force_ai_tracks_setprop 
	if ($freestyle_debug_force_ai_tracks = 1)
		($toggle_freestyle_force_ai_tracks_menuitem) :SetProps generic_menu_smenu_textitem_text_text = qs(0xf95accfa)
	else
		($toggle_freestyle_force_ai_tracks_menuitem) :SetProps generic_menu_smenu_textitem_text_text = qs(0x8a929a38)
	endif
endscript
toggle_freestyle_force_song_progression_menuitem = 0

script toggle_freestyle_force_song_progression 
	Change freestyle_debug_force_song_progression = ($freestyle_debug_force_song_progression + 1)
	if ($freestyle_debug_force_song_progression > 9)
		Change \{freestyle_debug_force_song_progression = -1}
	endif
	toggle_freestyle_force_song_progression_setprop
endscript

script toggle_freestyle_force_song_progression_setprop 
	if ($freestyle_debug_force_song_progression < 0)
		($toggle_freestyle_force_song_progression_menuitem) :SetProps generic_menu_smenu_textitem_text_text = qs(0x81ba1365)
	else
		formatText TextName = text qs(0x8a15d687) f = ($freestyle_debug_force_song_progression)
		($toggle_freestyle_force_song_progression_menuitem) :SetProps generic_menu_smenu_textitem_text_text = <text>
	endif
endscript
toggle_freestyle_debug_song_info_status = 0
toggle_freestyle_debug_song_info_menuitem = 0

script toggle_freestyle_debug_song_info 
	if ($toggle_freestyle_debug_song_info_status = 0)
		freestyle_debug_show_song_info
		Change \{toggle_freestyle_debug_song_info_status = 1}
	else
		freestyle_debug_hide_song_info
		Change \{toggle_freestyle_debug_song_info_status = 0}
	endif
	toggle_freestyle_debug_song_info_setprop
endscript

script toggle_freestyle_debug_song_info_setprop 
	if ($toggle_freestyle_debug_song_info_status = 0)
		($toggle_freestyle_debug_song_info_menuitem) :SetProps generic_menu_smenu_textitem_text_text = qs(0x49d27135)
	else
		($toggle_freestyle_debug_song_info_menuitem) :SetProps generic_menu_smenu_textitem_text_text = qs(0xf5e66fdb)
	endif
endscript
viz_enabled = 0
toggle_viz_menuitem = 0

script toggle_viz 
	if ($viz_enabled = 0)
		Change \{viz_enabled = 1}
		enablefullscreenvisualizer
	else
		Change \{viz_enabled = 0}
		0xb1970794
	endif
	toggle_viz_setprop
endscript

script toggle_viz_setprop 
	if (($viz_enabled) = 0)
		($toggle_viz_menuitem) :SetProps generic_menu_smenu_textitem_text_text = qs(0xb6baf79d)
	else
		($toggle_viz_menuitem) :SetProps generic_menu_smenu_textitem_text_text = qs(0xc4747a40)
	endif
endscript

script debug_unlockall 
	lockglobaltags \{OFF}
	lockglobaltags \{freeplay_check_off}
	get_savegame_from_controller \{controller = $primary_controller}
	difficulties = [easy medium hard expert]
	GetArraySize <difficulties>
	diff_size = <array_Size>
	getsonglistsize
	if (<array_Size> > 0)
		i = 0
		begin
		getsonglistchecksum index = <i>
		get_song_saved_in_globaltags song = <song_checksum>
		if (<saved_in_globaltags> = 1)
			SetGlobalTags savegame = <savegame> <song_checksum> params = {unlocked = 1}
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	GetArraySize ($bonus_songs.tier1.songs)
	if (<array_Size> > 0)
		i = 0
		begin
		SetGlobalTags savegame = <savegame> ($bonus_songs.tier1.songs [<i>]) params = {unlocked = 1}
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	i = 0
	GetArraySize ($Bonus_videos)
	if (<array_Size> > 0)
		begin
		video_checksum = ($Bonus_videos [<i>].id)
		SetGlobalTags savegame = <savegame> <video_checksum> params = {unlocked = 1}
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	get_LevelZoneArray_size
	if (<array_Size> > 0)
		index = 0
		begin
		get_LevelZoneArray_checksum index = <index>
		formatText checksumName = venue_checksum 'venue_%s' s = ($LevelZones.<level_checksum>.Name)
		if NOT StructureContains structure = ($LevelZones.<level_checksum>) debug_only
			SetGlobalTags savegame = <savegame> <venue_checksum> params = {unlocked = 1} Progression = true
		endif
		index = (<index> + 1)
		repeat <array_Size>
	endif
	GetArraySize \{$progression_gig_list}
	num_zones = <array_Size>
	index = 0
	begin
	gig_list = (($progression_gig_list [<index>]).gig_list)
	GetArraySize ($<gig_list>)
	num_gigs = <array_Size>
	gig_index = 0
	begin
	gig_checksum = ($<gig_list> [<gig_index>])
	SetGlobalTags savegame = <savegame> <gig_checksum> params = {unlocked = 1} Progression = true
	gig_index = (<gig_index> + 1)
	repeat <num_gigs>
	index = (<index> + 1)
	repeat <num_zones>
	0x9a065b1d \{UnlockAll}
	0x29480f35 \{UnlockAll}
	unlock_all_profiles savegame = <savegame>
	unlock_purchase_all_cas_parts savegame = <savegame>
	lockglobaltags \{freeplay_check_on}
	lockglobaltags
endscript
