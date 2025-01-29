menu_pos = (675.0, 100.0)

script create_debug_backdrop 
	destroy_debug_backdrop
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = debug_backdrop
		Pos = (640.0, 0.0)
		dims = (640.0, 720.0)
		just = [
			left
			top
		]
		rgba = [
			0
			0
			0
			255
		]
		z_priority = 1}
endscript

script destroy_debug_backdrop 
	destroy_menu \{menu_id = debug_backdrop}
endscript

script create_debugging_menu 
	make_generic_menu {
		vmenu_id = debug_vmenu
		Pos = ($menu_pos - (0.0, 80.0))
		dims = (400.0, 500.0)
		title_pos = ($menu_pos - (0.0, 80.0))
		title_just = [left top]
		z_priority = 100.0
		pad_back_script = back_to_retail_menu
		title = qs(0x49a0d144)
		scrolling
		use_all_controllers
	}
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
	add_generic_menu_text_item \{text = qs(0x265776e4)
		pad_choose_script = debug_unlockall}
	LaunchEvent \{Type = focus
		target = debug_vmenu}
endscript

script back_to_debug_menu 
	destroy_all_debug_menus
	create_debugging_menu
endscript

script destroy_debugging_menu 
	generic_ui_destroy
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
	add_generic_menu_text_item \{text = qs(0xb6935f76)
		pad_choose_script = start_4p_vocal_proto}
	add_generic_menu_text_item \{text = qs(0x22522663)
		pad_choose_script = toggle_binkingame}
	Change binkingame_menuitem = <item_container_id>
	toggle_binkingame_setprop
	add_generic_menu_text_item \{text = qs(0xaa9efe73)
		pad_choose_script = toggle_single_stream_enabled}
	Change single_stream_enabled_menuitem = <item_container_id>
	toggle_single_stream_enabled_setprop
	add_generic_menu_text_item \{text = qs(0x0d5665dd)
		pad_choose_script = ui_event
		pad_choose_params = {
			event = menu_change
			data = {
				state = uistate_songlist
			}
		}}
	add_generic_menu_text_item \{text = qs(0x8bcfc148)
		pad_choose_script = generic_event_replace
		pad_choose_params = {
			event = menu_replace
			data = {
				state = uistate_test_medley_mode
			}
		}}
	LaunchEvent \{Type = focus
		target = game_modes_vmenu}
endscript

script back_to_game_modes_menu 
	destroy_all_debug_menus
	create_game_modes_menu
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
	add_generic_menu_text_item \{text = qs(0xa596cd4e)
		pad_choose_script = toggle_lagtestpart1}
	Change toggle_lagtestpart1_menuitem = <item_container_id>
	toggle_lagtestpart1_setprop
	add_generic_menu_text_item \{text = qs(0x8ebb9e8d)
		pad_choose_script = toggle_lagtestpart2}
	Change toggle_lagtestpart2_menuitem = <item_container_id>
	toggle_lagtestpart2_setprop
	add_generic_menu_text_item \{text = qs(0x97a0afcc)
		pad_choose_script = toggle_lagtestpart3}
	Change toggle_lagtestpart3_menuitem = <item_container_id>
	toggle_lagtestpart3_setprop
	add_generic_menu_text_item \{text = qs(0x742b6db0)
		pad_left_script = edit_inputlagvalue_left
		pad_right_script = edit_inputlagvalue_right}
	Change edit_inputlagvalue_menuitem = <item_container_id>
	edit_inputlagvalue_setprop
	add_generic_menu_text_item \{text = qs(0x9164e749)
		pad_left_script = edit_gemlagvalue_left
		pad_right_script = edit_gemlagvalue_right}
	Change edit_gemlagvalue_menuitem = <item_container_id>
	edit_gemlagvalue_setprop
	add_generic_menu_text_item \{text = qs(0xecb004e9)
		pad_left_script = edit_audiolagvalue_left
		pad_right_script = edit_audiolagvalue_right}
	Change edit_audiolagvalue_menuitem = <item_container_id>
	edit_audiolagvalue_setprop
	add_generic_menu_text_item \{text = qs(0x31fe1190)
		pad_choose_script = toggle_forcescore}
	Change toggle_forcescore_menuitem = <item_container_id>
	toggle_forcescore_setprop
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
		pad_choose_params = {uselaststarttime forcelongintro from_gameplay = <from_gameplay>}
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

script create_skipintosong_menu 
	ui_menu_select_sfx
	destroy_in_game_menu
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
	destroy_all_debug_menus
	create_skipintosong_menu
endscript

script destroy_skipintosong_menu 
	generic_ui_destroy
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
			pad_choose_params = {song_name = <current_song> difficulty = <difficulty1> difficulty2 = <difficulty2> starttime = (<current_time> * 1000) from_gameplay = <from_gameplay>}
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
	destroy_all_debug_menus
	create_skipbytime_menu
endscript

script destroy_skipbytime_menu 
	generic_ui_destroy
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
	marker_array_size = <array_Size>
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
		measure_num = 1
		beat_num = 0
		fretbar_index = 0
		begin
		marker_time = (<marker_array> [<marker_count>].time)
		timesig_index = 0
		current_timesig_num = 0
		songfilemanager func = get_num_timesig_notes song_name = <current_song>
		if (<num_timesig_notes> > 0)
			begin
			songfilemanager func = get_timesig_note song_name = <current_song> index = <timesig_index>
			if (<marker_time> > <timesig_time>)
				current_timesig_num = <timesig_num>
				break
			endif
			timesig_index = (<timesig_index> + 1)
			repeat <num_timesig_notes>
		endif
		songfilemanager func = get_num_fretbar_notes song_name = <current_song>
		begin
		songfilemanager func = get_fretbar_note song_name = <current_song> index = <fretbar_index>
		if (<fretbar_time> > <marker_time>)
			break
		endif
		if (<beat_num> >= <timesig_num>)
			measure_num = (<measure_num> + 1)
			beat_num = 0
		endif
		beat_num = (<beat_num> + 1)
		fretbar_index = (<fretbar_index> + 1)
		repeat <num_fretbar_notes>
		formatText {
			TextName = menu_itemname
			qs(0x015c83f3)
			a = (<marker_array> [<marker_count>].marker)
			s = (<marker_time> / 1000)
			m = <measure_num>
			b = <beat_num>
		}
		getplayerinfo \{1
			difficulty
			out = difficulty1}
		getplayerinfo \{2
			difficulty
			out = difficulty2}
		add_generic_menu_text_item {
			text = <menu_itemname>
			pad_choose_script = <menu_func>
			pad_choose_params = {song_name = <current_song> difficulty = <difficulty1> difficulty2 = <difficulty2> starttime = (<marker_array> [<marker_count>].time) startmarker = <marker_count>
				from_gameplay = <from_gameplay>}
		}
		marker_count = (<marker_count> + 1)
		repeat <marker_array_size>
	endif
	LaunchEvent \{Type = focus
		target = skipbymarker_vmenu}
endscript

script back_to_skipbymarker_menu 
	destroy_all_debug_menus
	create_skipbymarker_menu
endscript

script destroy_skipbymarker_menu 
	generic_ui_destroy
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
	destroy_all_debug_menus
	create_skipbymeasure_menu
endscript

script destroy_skipbymeasure_menu 
	generic_ui_destroy
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
	destroy_all_debug_menus
	create_looppoint_menu
endscript

script destroy_looppoint_menu 
	generic_ui_destroy
endscript

script set_looppoint 
	ui_menu_select_sfx
	Change current_looppoint = <starttime>
	gh3_start_pressed
endscript

script create_changevenue_menu 
	ui_menu_select_sfx
	destroy_in_game_menu
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
	formatText TextName = level_name qs(0x5af41da1) t = ($LevelZones.<level_checksum>.title) n = ($LevelZones.<level_checksum>.Name)
	add_generic_menu_text_item {
		text = <level_name>
		pad_choose_script = select_venue
		pad_choose_params = {level = <level_checksum> norestart}
	}
	<array_count> = (<array_count> + 1)
	repeat <array_Size>
	LaunchEvent \{Type = focus
		target = changevenue_vmenu}
endscript

script back_to_changevenue_menu 
	destroy_all_debug_menus
	create_changevenue_menu
endscript

script destroy_changevenue_menu 
	generic_ui_destroy
endscript

script create_changeguitar_menu \{Type = guitar}
	ui_menu_select_sfx
	destroy_in_game_menu
	if (<Type> = guitar)
		changeguitar_menu_header = qs(0x7a2d9b63)
	else
		changeguitar_menu_header = qs(0x4f76321c)
	endif
	make_generic_menu {
		vmenu_id = changeguitar_vmenu
		Pos = ($menu_pos - (0.0, 80.0))
		dims = (400.0, 500.0)
		z_priority = 100.0
		title_pos = ($menu_pos - (0.0, 80.0))
		title_just = [left top]
		pad_back_script = back_to_in_game_menu
		title = <changeguitar_menu_header>
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
	destroy_all_debug_menus
	create_changeguitar_menu
endscript

script destroy_changeguitar_menu 
	generic_ui_destroy
endscript

script select_guitar \{Type = guitar}
	ui_menu_select_sfx
	kill_gem_scroller
	select_start_song
endscript
CameraCutPrefixArray = [
	'cameras'
	'cameras_guitarist'
	'cameras_singer'
	'cameras_drummer'
	'cameras_bassist'
	'cameras_headtohead'
	'cameras_single'
	'cameras_solo'
	'cameras_guitar_closeup'
	'cameras_closeup'
	'cameras_closeups'
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
]

script create_cameracut_group_menu 
	ui_menu_select_sfx
	destroy_in_game_menu
	make_generic_menu {
		vmenu_id = selectcameracut_group_vmenu
		Pos = ($menu_pos - (0.0, 80.0))
		dims = (400.0, 500.0)
		z_priority = 100.0
		title_pos = ($menu_pos - (0.0, 80.0))
		title_just = [left top]
		pad_back_script = back_to_in_game_menu
		title = qs(0xecd234cc)
		nobg
		notitlebg
		scrolling
		use_all_controllers
	}
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

script back_to_cameracut_group_menu 
	destroy_all_debug_menus
	create_cameracut_group_menu
endscript

script destroy_cameracut_group_menu 
	generic_ui_destroy
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
	GetPakManCurrentName \{map = zones}
	formatText checksumName = Camera_Array '%s_%p' s = <pakname> p = ($CameraCutPrefixArray [<camera_count>])
	if GlobalExists Name = <Camera_Array>
		GetArraySize $<Camera_Array>
		array_count = 0
		begin
		formatText TextName = Camera_Name qs(0x3efec28c) s = <pakname> p = ($CameraCutPrefixArray [<camera_count>]) i = <array_count>
		if StructureContains structure = ($<Camera_Array> [<array_count>]) Name
			formatText TextName = Camera_Name qs(0x73307931) s = ($<Camera_Array> [<array_count>].Name) DontAssertForChecksums
		elseif StructureContains structure = ($<Camera_Array> [<array_count>]) params
			if StructureContains structure = ($<Camera_Array> [<array_count>].params) Name
				formatText TextName = Camera_Name qs(0x73307931) s = ($<Camera_Array> [<array_count>].params.Name) DontAssertForChecksums
			endif
		endif
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
	destroy_all_debug_menus
	create_cameracut_menu
endscript

script destroy_cameracut_menu 
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

script select_cameracut_video 
	ui_menu_select_sfx
	printf qs(0x3e1a078e) n = <Name> s = <Camera_Array_pakname> p = <Camera_Array> i = <array_count>
	formatText TextName = file_name qs(0x7ded7b88) a = <Camera_Array> i = <array_count>
	if GlobalExists \{Name = capture_file_name}
		Change capture_file_name = <file_name>
	endif
	Change debug_camera_array = <Camera_Array>
	Change debug_camera_array_pakname = <Camera_Array_pakname>
	Change debug_camera_array_count = <array_count>
	destroy_cameracuts
	Hide_Band
	Wait \{3
		gameframes}
	create_cameracuts
	unpausegh3
	root_window :legacydomorph \{alpha = 0}
	Change \{select_cameracut_video_end_enable = 1}
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
			band_unhide
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
	destroy_in_game_menu
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
		pad_choose_script = create_changemusician_menu
		pad_choose_params = {
			part = guitar
		}}
	add_generic_menu_text_item \{text = qs(0x8745f1a9)
		pad_choose_script = create_changemusician_menu
		pad_choose_params = {
			part = bass
		}}
	add_generic_menu_text_item \{text = qs(0x5f98720d)
		pad_choose_script = create_changemusician_menu
		pad_choose_params = {
			part = vocals
		}}
	add_generic_menu_text_item \{text = qs(0xd8973b9e)
		pad_choose_script = create_changemusician_menu
		pad_choose_params = {
			part = drum
		}}
	LaunchEvent \{Type = focus
		target = character_viewer_vmenu}
endscript

script back_to_character_viewer_menu 
	destroy_all_debug_menus
	create_character_viewer_menu
endscript

script destroy_character_viewer_menu 
	generic_ui_destroy
endscript

script create_changemusician_menu 
	ui_menu_select_sfx
	destroy_character_viewer_menu
	make_generic_menu {
		vmenu_id = changemusician_vmenu
		Pos = ($menu_pos - (0.0, 80.0))
		dims = (400.0, 500.0)
		z_priority = 100.0
		title_pos = ($menu_pos - (0.0, 80.0))
		title_just = [left top]
		pad_back_script = back_to_character_viewer_menu
		title = qs(0xdb335bb2)
		scrolling
		use_all_controllers
	}
	get_savegame_from_controller controller = ($primary_controller)
	characterprofilegetlist savegame = <savegame> categories = [cars ghrockers presetcars modifiable locked debug]
	GetArraySize <profile_list>
	index = 0
	begin
	characterprofilegetstruct savegame = <savegame> Name = (<profile_list> [<index>])
	get_fullname_of_character savegame = <savegame> id = (<profile_list> [<index>])
	add_generic_menu_text_item {
		text = <fullname>
		pad_choose_script = debug_menu_choose_musician
		pad_choose_params = {part = <part> profile_struct = <profile_struct> savegame = <savegame>}
	}
	index = (<index> + 1)
	repeat <array_Size>
	LaunchEvent \{Type = focus
		target = changemusician_vmenu}
endscript

script destroy_changeguitarist_menu 
	generic_ui_destroy
endscript

script debug_is_part_in_band 
	i = 1
	begin
	getplayerinfo <i> part out = player_part
	if (<part> = <player_part>)
		return true Player = <i>
	endif
	i = (<i> + 1)
	repeat 4
	return \{FALSE}
endscript

script debug_menu_choose_musician 
	kill_gem_scroller
	if debug_is_part_in_band part = <part>
		getplayerinfo <Player> stored_character_index
		setplayerinfo <Player> character_id = (<profile_struct>.Name)
		setplayerinfo <Player> character_savegame = <savegame>
		globaltag_save_band_member_choice savegame = <savegame> index = <stored_character_index> character_id = (<profile_struct>.Name) character_savegame = <savegame>
	endif
	getplayerinfo \{1
		difficulty
		out = difficulty1}
	getplayerinfo \{2
		difficulty
		out = difficulty2}
	getplayerinfo \{3
		difficulty
		out = difficulty3}
	getplayerinfo \{4
		difficulty
		out = difficulty4}
	restart_gem_scroller {
		difficulty = <difficulty1>
		difficulty2 = <difficulty2>
		difficulty3 = <difficulty3>
		difficulty4 = <difficulty4>
		starttime = ($current_starttime)
		device_num = <device_num>
	}
	getnumplayersingame
	if (<num_players> = 0)
		setplayerinfo \{1
			in_game = 1}
	endif
	if ui_event_exists_in_stack \{Name = 'gameplay'}
		ui_event \{event = menu_back
			data = {
				state = Uistate_gameplay
			}}
	else
		generic_event_choose \{state = Uistate_gameplay}
	endif
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
	add_generic_menu_text_item \{text = qs(0xe280d18b)
		pad_choose_script = toggle_viewvolumesonscreen}
	Change toggle_viewvolumesonscreen_menuitem = <item_container_id>
	toggle_viewvolumesonscreen_setprop
	add_generic_menu_text_item \{text = qs(0x9c31fd21)
		pad_choose_script = toggle_prototype_sp}
	Change toggle_prototype_sp_menuitem = <item_container_id>
	toggle_prototype_sp_setprop
	add_generic_menu_text_item \{text = qs(0x4f6a8b2d)
		pad_choose_script = toggle_screen_noise}
	Change toggle_screen_noise_menuitem = <item_container_id>
	toggle_screen_noise_setprop
	add_generic_menu_text_item \{text = qs(0x58586bd4)
		pad_choose_script = toggle_motion_blur}
	Change toggle_motion_blur_menuitem = <item_container_id>
	toggle_motion_blur_setprop
	add_generic_menu_text_item \{text = qs(0xb5c21064)
		pad_choose_script = toggle_ad_overlay}
	Change toggle_ad_overlay_menuitem = <item_container_id>
	toggle_ad_overlay_setprop
	add_generic_menu_text_item \{text = qs(0x9f7a1c1f)
		pad_choose_script = toggle_ok_for_ad_override}
	Change toggle_ok_for_ad_override_menuitem = <item_container_id>
	toggle_ok_for_ad_override_setprop
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
HideByType_List = [
	'crowd'
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
	destroy_hud_ui_menu
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
		pad_choose_params = {Type = <type_checksum> array_count = <array_count>}
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
	create_togglevisibility_menu
endscript

script destroy_togglevisibility_menu 
	if ScreenElementExists \{id = togglevisibility_scrolling_menu}
		DestroyScreenElement \{id = togglevisibility_scrolling_menu}
	endif
	destroy_menu_backdrop
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
	add_generic_menu_text_item \{text = qs(0xce37488d)
		pad_choose_script = debug_add_worst_case_cas_chars}
	array_count = 1
	array = []
	begin
	add_generic_menu_text_item {
		text = qs(0x2de18e1a)
		pad_left_script = cycle_musician_type_left
		pad_left_params = {musician = <array_count>}
		pad_right_script = cycle_musician_type_right
		pad_right_params = {musician = <array_count>}
	}
	AddArrayElement array = <array> element = <item_container_id>
	array_count = (<array_count> + 1)
	repeat 4
	Change toggle_musician_type_menuitem = <array>
	toggle_musician_type_setprop \{no_refresh = 1}
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
	destroy_all_debug_menus
	create_band_setup_menu
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
	add_generic_menu_text_item \{text = qs(0x79aee6c5)
		pad_choose_script = debug_checkcasassets}
	add_generic_menu_text_item \{text = qs(0x56dc7134)
		pad_choose_script = debug_checkprogression}
	add_generic_menu_text_item \{text = qs(0xbc1f222f)
		pad_choose_script = debug_dumpheaps}
	add_generic_menu_text_item \{text = qs(0x964f7d18)
		pad_choose_script = debug_toggle_autosave}
	Change autosave_menuitem = <item_container_id>
	toggle_autosave_setprop
	add_generic_menu_text_item \{text = qs(0xa2fa3e9a)
		pad_choose_script = save_replay}
	add_generic_menu_text_item \{text = qs(0xc1c448fd)
		pad_choose_script = create_replay_menu}
	add_generic_menu_text_item \{text = qs(0x72718c0c)
		pad_choose_script = debug_playcredits}
	add_generic_menu_text_item \{text = qs(0x6bbf81bd)
		pad_choose_script = toggle_model_viewer}
	add_generic_menu_text_item \{text = qs(0xc540004a)
		pad_choose_script = create_difficulty_analyzer_menu}
	add_generic_menu_text_item \{text = qs(0x7b0ed426)
		pad_choose_script = debug_toggle_changelist}
	add_generic_menu_text_item \{text = qs(0x3fd0ccc7)
		pad_choose_script = lightshow_toggledebuginfo}
	add_generic_menu_text_item \{text = qs(0xdb091893)
		pad_choose_script = generic_event_choose
		pad_choose_params = {
			state = uistate_debug_color_calibration
		}}
	if ($g_rockout_show_in_debug_menu = 1)
		add_generic_menu_text_item \{text = qs(0xd3f1185b)
			pad_choose_script = go_to_rockout_from_debug}
	endif
	add_generic_menu_text_item \{text = qs(0xc939b12e)
		pad_choose_script = generic_event_choose
		pad_choose_params = {
			state = uistate_physics
			data = {
				debug
			}
		}}
	add_generic_menu_text_item \{text = qs(0x385c5e06)
		pad_choose_script = create_autotest_menu}
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
	add_generic_menu_text_item \{text = qs(0x9e201e57)
		pad_choose_script = test_velocity_strum}
	add_generic_menu_text_item \{text = qs(0x6c05787c)
		pad_choose_script = generic_event_replace
		pad_choose_params = {
			event = menu_replace
			data = {
				state = uistate_mic_debug
			}
		}}
	add_generic_menu_text_item \{text = qs(0x0b2c900f)
		pad_choose_script = debug_toggle_highway_viewer_visibility}
	LaunchEvent \{Type = focus
		target = tools_vmenu}
endscript

script debug_toggle_highway_viewer_visibility 
	Change alternate_viewer_hud_behavior = (1 - $alternate_viewer_hud_behavior)
endscript
autosave_menuitem = 0

script debug_toggle_autosave 
	GetGlobalTags \{user_options}
	if (<autosave> = 0)
		SetGlobalTags \{user_options
			params = {
				autosave = 1
			}}
	else
		SetGlobalTags \{user_options
			params = {
				autosave = 0
			}}
	endif
	toggle_autosave_setprop
endscript

script toggle_autosave_setprop 
	GetGlobalTags \{user_options}
	if (<autosave> = 1)
		($autosave_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0xa901b5bd)
	else
		($autosave_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x1c73da39)
	endif
endscript

script back_to_tools_menu 
	destroy_all_debug_menus
	create_tools_menu
endscript

script destroy_tools_menu 
	generic_ui_destroy
endscript

script create_replay_menu 
	ui_menu_select_sfx
	destroy_tools_menu
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
	destroy_all_debug_menus
	create_replay_menu
endscript

script destroy_replay_menu 
	generic_ui_destroy
endscript

script play_replay 
	destroy_replay_menu
	restart_gem_scroller <...>
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
	getsonglistsize
	full_size = <array_Size>
	GetArraySize \{$debug_songlist}
	array_Size = (<full_size> + <array_Size>)
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
	ui_menu_select_sfx
	destroy_difficulty_analyzer_menu
	make_generic_menu {
		vmenu_id = instrument_vmenu
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
		target = instrument_vmenu}
endscript

script back_to_difficulty_analyzer_instrument_menu 
	destroy_all_debug_menus
	create_difficulty_analyzer_instrument_menu difficulty = all song_name = <song_name>
endscript

script destroy_difficulty_analyzer_instrument_menu 
	generic_ui_destroy
endscript

script create_difficulty_analyzer_difficulty_menu 
	ui_menu_select_sfx
	destroy_difficulty_analyzer_instrument_menu
	make_generic_menu {
		vmenu_id = difficulty_vmenu
		Pos = ($menu_pos - (0.0, 80.0))
		dims = (400.0, 500.0)
		title_pos = ($menu_pos - (0.0, 80.0))
		title_just = [left top]
		pad_back_script = back_to_difficulty_analyzer_instrument_menu
		pad_back_params = {song_name = <song_name>}
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
	destroy_all_debug_menus
	create_difficulty_analyzer_difficulty_menu
endscript

script destroy_difficulty_analyzer_difficulty_menu 
	generic_ui_destroy
endscript

script destroy_all_debug_menus 
	destroy_cameracut_menu
	destroy_cameracut_group_menu
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
	destroy_skipintosong_menu
	destroy_cameracut_menu
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
	destroy_debugging_menu
	destroy_bot_menu
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

script start_4p_vocal_proto 
	Change \{game_mode = p4_quickplay}
	setplayerinfo \{Player = 1
		bot_play = 0}
	setplayerinfo \{Player = 1
		part = vocals}
	setplayerinfo \{Player = 2
		bot_play = 0}
	setplayerinfo \{Player = 2
		part = vocals}
	setplayerinfo \{Player = 3
		bot_play = 0}
	setplayerinfo \{Player = 3
		part = vocals}
	setplayerinfo \{Player = 4
		bot_play = 0}
	setplayerinfo \{Player = 4
		part = vocals}
	select_start_song \{uselaststarttime}
endscript

script back_to_online_menu 
	printf \{qs(0x79d75a60)}
	quit_network_game
	destroy_create_session_menu
	create_online_menu
endscript

script create_song_menu \{version = gh3}
	ui_menu_select_sfx
	destroy_all_debug_menus
	make_generic_menu {
		vmenu_id = song_vmenu
		Pos = ($menu_pos - (0.0, 80.0))
		dims = (400.0, 500.0)
		title_pos = ($menu_pos - (0.0, 80.0))
		title_just = [left top]
		pad_back_script = back_to_in_game_menu
		z_priority = 100.0
		title = qs(0x092c9f43)
		scrolling
		use_all_controllers
	}
	if generic_menu :desc_resolvealias \{Name = alias_generic_menu_smenu
			param = smenu}
		SetScreenElementLock id = <smenu> On
		SetScreenElementLock id = <smenu> OFF
		<smenu> :scrollingmenu_unsethiddenlocflag
	endif
	array_entry = 0
	getsonglistsize
	if (<array_Size> < 250)
		full_size = <array_Size>
		GetArraySize \{$debug_songlist}
		array_Size = (<full_size> + <array_Size>)
	endif
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
	destroy_all_debug_menus
	create_song_menu version = ($current_song_version) from_gameplay = <from_gameplay>
endscript

script destroy_song_menu 
	generic_ui_destroy
endscript

script back_to_part_menu 
	destroy_difficulty_menu
	getnumplayersingame
	if (<num_players> = 4)
		back_to_song_menu
	else
		create_part_menu version = <version>
	endif
endscript

script create_difficulty_menu \{Player = 1}
	destroy_all_debug_menus
	make_generic_menu {
		vmenu_id = difficulty_vmenu
		Pos = ($menu_pos - (0.0, 80.0))
		dims = (400.0, 500.0)
		title_pos = ($menu_pos - (0.0, 80.0))
		title_just = [left top]
		pad_back_script = back_to_part_menu
		pad_back_params = {version = <version>}
		z_priority = 100.0
		title = qs(0xcdf1d3a0)
		scrolling
		use_all_controllers
	}
	formatText TextName = title qs(0x5c5cedaa) p = <Player>
	CreateScreenElement {
		Type = TextElement
		parent = generic_menu
		Pos = (-200.0, 0.0)
		font = fontgrid_text_a1
		text = <title>
	}
	array_entry = 0
	GetArraySize \{$difficulty_list}
	num_diffs = <array_Size>
	getplayerinfo <Player> part
	if (<part> = drum)
		num_diffs = (<array_Size> + 1)
	endif
	getnumplayersingame
	begin
	if (<array_entry> = <array_Size>)
		difficulty_text = qs(0x7a19b5f7)
		current_difficulty = ($difficulty_list [<array_Size> -1])
		double_kick = 1
	else
		difficulty_count = ($difficulty_list [<array_entry>])
		get_difficulty_text difficulty = <difficulty_count>
		current_difficulty = ($difficulty_list [<array_entry>])
		double_kick = 0
	endif
	if (<Player> = <num_players>)
		<choose_params> = {callback = create_bot_menu double_kick = <double_kick> Player = <Player> difficulty = <current_difficulty> callback_params = {song_name = <song_name> Player = 1 from_gameplay = <from_gameplay>}}
	else
		<choose_params> = {callback = create_difficulty_menu double_kick = <double_kick> Player = <Player> difficulty = <current_difficulty> callback_params = {song_name = <song_name> version = <version> Player = (<Player> + 1) from_gameplay = <from_gameplay>}}
	endif
	add_generic_menu_text_item {
		text = <difficulty_text>
		pad_choose_script = debug_menu_set_double_kick
		pad_choose_params = <choose_params>
	}
	<array_entry> = (<array_entry> + 1)
	repeat <num_diffs>
	if (<Player> = 1 && <num_players> = 4)
		add_generic_menu_text_item {
			text = qs(0x97831a78)
			pad_choose_script = debug_quick_bot_band
			pad_choose_params = {difficulty = easy callback = select_start_song callback_params = {song_name = <song_name> from_gameplay = <from_gameplay>}}
		}
		add_generic_menu_text_item {
			text = qs(0xcdf56746)
			pad_choose_script = debug_quick_bot_band
			pad_choose_params = {difficulty = expert callback = select_start_song callback_params = {song_name = <song_name> from_gameplay = <from_gameplay>}}
		}
		add_generic_menu_text_item {
			text = qs(0x24938f1c)
			pad_choose_script = debug_quick_bot_band
			pad_choose_params = {difficulty = expert callback = select_start_song_guitar callback_params = {song_name = <song_name> from_gameplay = <from_gameplay>}}
		}
	endif
	LaunchEvent \{Type = focus
		target = difficulty_vmenu}
endscript

script debug_menu_set_double_kick 
	setplayerinfo <Player> difficulty = <difficulty>
	setplayerinfo <Player> double_kick_drum = <double_kick>
	<callback> <callback_params>
endscript

script debug_quick_bot_band \{difficulty = expert}
	setplayerinfo 1 difficulty = <difficulty>
	setplayerinfo 2 difficulty = <difficulty>
	setplayerinfo 3 difficulty = <difficulty>
	setplayerinfo 4 difficulty = <difficulty>
	setplayerinfo \{1
		bot_play = 1}
	setplayerinfo \{2
		bot_play = 1}
	setplayerinfo \{3
		bot_play = 1}
	setplayerinfo \{4
		bot_play = 1}
	<callback> <callback_params>
endscript

script destroy_difficulty_menu 
	if ScreenElementExists \{id = difficulty_menu}
		DestroyScreenElement \{id = difficulty_menu}
	endif
	destroy_menu_backdrop
endscript

script create_bot_menu \{Player = 1}
	destroy_all_debug_menus
	make_generic_menu {
		vmenu_id = bot_vmenu
		Pos = ($menu_pos - (0.0, 80.0))
		dims = (400.0, 500.0)
		title_pos = ($menu_pos - (0.0, 80.0))
		title_just = [left top]
		pad_back_script = back_to_difficulty_menu
		pad_back_params = {version = <version>}
		z_priority = 100.0
		title = qs(0xfa3348de)
		scrolling
		use_all_controllers
	}
	formatText TextName = title qs(0x5c5cedaa) p = <Player>
	CreateScreenElement {
		Type = TextElement
		parent = generic_menu
		Pos = (-200.0, 0.0)
		font = fontgrid_text_a1
		text = <title>
	}
	getnumplayersingame
	if (<Player> = <num_players>)
		<choose_params> = {callback = select_start_song double_kick = <double_kick> Player = <Player> callback_params = {song_name = <song_name> from_gameplay = <from_gameplay>}}
	else
		<choose_params> = {callback = create_bot_menu double_kick = <double_kick> Player = <Player> callback_params = {song_name = <song_name> version = <version> Player = (<Player> + 1) from_gameplay = <from_gameplay>}}
	endif
	add_generic_menu_text_item {
		text = qs(0xc14e9741)
		pad_choose_script = debug_menu_set_bot
		pad_choose_params = {<choose_params> bot = 0}
	}
	add_generic_menu_text_item {
		text = qs(0xabe9d62d)
		pad_choose_script = debug_menu_set_bot
		pad_choose_params = {<choose_params> bot = 1}
	}
	LaunchEvent \{Type = focus
		target = bot_vmenu}
endscript

script debug_menu_set_bot 
	setplayerinfo <Player> bot_play = <bot>
	<callback> <callback_params>
endscript

script destroy_bot_menu 
	if ScreenElementExists \{id = bot_menu}
		DestroyScreenElement \{id = bot_menu}
	endif
	destroy_menu_backdrop
endscript

script back_to_difficulty_menu 
	destroy_bot_menu
	create_difficulty_menu version = <version>
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
debug_musician1 = guitar
debug_musician2 = bass
debug_musician3 = drum
debug_musician4 = vocals

script create_part_menu \{Player = 1}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	getnumplayersingame
	if (<num_players> = 4)
		setplayerinfo 1 part = ($debug_musician1)
		setplayerinfo 2 part = ($debug_musician2)
		setplayerinfo 3 part = ($debug_musician3)
		setplayerinfo 4 part = ($debug_musician4)
		persistent_band_create_band \{refresh = 1}
		create_difficulty_menu {song_name = <song_name> version = <version> Player = 1 from_gameplay = <from_gameplay>}
		return
	endif
	destroy_all_debug_menus
	make_generic_menu {
		vmenu_id = part_vmenu
		Pos = ($menu_pos - (0.0, 80.0))
		dims = (400.0, 500.0)
		title_pos = ($menu_pos - (0.0, 80.0))
		title_just = [left top]
		pad_back_script = back_to_song_menu
		pad_back_params = {version = <version>}
		z_priority = 100.0
		title = qs(0xb67ab3e1)
		scrolling
		use_all_controllers
	}
	formatText TextName = title qs(0x5c5cedaa) p = <Player>
	CreateScreenElement {
		Type = TextElement
		parent = generic_menu
		Pos = (-200.0, 0.0)
		font = fontgrid_text_a1
		text = <title>
	}
	array_entry = 0
	GetArraySize \{$part_list}
	getnumplayersingame
	begin
	part_count = ($part_list [<array_entry>])
	get_part_text part = <part_count>
	if (<Player> = <num_players>)
		add_generic_menu_text_item {
			text = <part_text>
			pad_choose_script = debug_menu_set_part
			pad_choose_params = {callback = create_difficulty_menu Player = <Player> part = ($part_list [<array_entry>]) callback_params = {song_name = <song_name> version = <version> Player = 1 from_gameplay = <from_gameplay>}}
		}
	else
		add_generic_menu_text_item {
			text = <part_text>
			pad_choose_script = debug_menu_set_part
			pad_choose_params = {callback = create_part_menu Player = <Player> part = ($part_list [<array_entry>]) callback_params = {song_name = <song_name> version = <version> Player = (<Player> + 1) from_gameplay = <from_gameplay>}}
		}
	endif
	<array_entry> = (<array_entry> + 1)
	repeat <array_Size>
	LaunchEvent \{Type = focus
		target = part_vmenu}
endscript

script destroy_part_menu 
	generic_ui_destroy
endscript

script debug_menu_set_part 
	setplayerinfo <Player> part = <part>
	formatText checksumName = global_name 'debug_musician%a' a = <Player>
	Change GlobalName = <global_name> NewValue = <part>
	if checksumequals a = <callback> b = create_difficulty_menu
		persistent_band_create_band \{refresh = 1}
		if ScreenElementExists \{id = current_menu}
			LaunchEvent \{Type = unfocus
				target = current_menu}
			RunScriptOnScreenElement \{id = current_menu
				pulse_debug_menu}
		endif
		cas_queue_wait
		if ScreenElementExists \{id = current_menu}
			Obj_KillSpawnedScript \{Name = pulse_debug_menu}
			current_menu :se_setprops \{alpha = 1.0}
			LaunchEvent \{Type = focus
				target = current_menu}
		endif
	endif
	<callback> <callback_params>
endscript

script pulse_debug_menu 
	se_setprops \{alpha = 0.1
		time = 0}
	begin
	se_setprops \{alpha = 0.3
		time = 0.2}
	se_waitprops
	se_setprops \{alpha = 0.1
		time = 0.2}
	se_waitprops
	repeat
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
	unlock_all_profiles savegame = <savegame>
	unlock_purchase_all_cas_parts savegame = <savegame>
	debug_unlock_all_cheats \{controller = $primary_controller}
	lockglobaltags \{freeplay_check_on}
	lockglobaltags
endscript

script back_to_settings_menu 
	destroy_changevenue_menu
	destroy_changehighway_menu
	destroy_changeguitar_menu
	destroy_togglevisibility_menu
	destroy_cameracut_group_menu
	create_settings_menu
endscript

script destroy_settings_menu 
	if ScreenElementExists \{id = settings_scrolling_menu}
		DestroyScreenElement \{id = settings_scrolling_menu}
	endif
	destroy_menu_backdrop
endscript

script select_playermode 
	setplayerinfo 1 device = <device_num>
	translate_gamemode
	gamemode_gettype
	if (<Type> = career)
		gman_startgamemodegoal
		gig = ($gig_list_neworleans [0])
		gman_challengemanagerfunc goal = career tool = challenges func = set_current_challenge params = {challenge_id = <gig>}
	endif
	create_song_menu version = ($current_song_version) from_gameplay = <from_gameplay>
endscript

script select_medleymode 
	setplayerinfo 1 device = <device_num>
	translate_gamemode
	create_song_menu version = ($current_song_version) from_gameplay = <from_gameplay>
	array_entry = 0
	getsonglistsize
	begin
	getsonglistchecksum index = <array_entry>
	get_song_struct song = <song_checksum>
	get_song_name song = <song_checksum>
	if (<song_name> = 'Medley')
		create_part_menu song_name = <song_checksum> Player = 1 from_gameplay = <from_gameplay>
		break
	endif
	<array_entry> = (<array_entry> + 1)
	repeat <array_Size>
endscript
debug_with_rhythm = 0
force_coop = 0

script translate_gamemode 
	getmaxlocalplayers
	Player = 1
	begin
	setplayerinfo <Player> in_game = 0
	<Player> = (<Player> + 1)
	repeat <max_players>
	gamemode_getnumplayers
	Player = 1
	begin
	setplayerinfo <Player> in_game = 1
	<Player> = (<Player> + 1)
	repeat <num_players>
endscript

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
		toggle_rolandkit_menuitem :se_setprops \{text = qs(0x7c5f597d)}
	else
		toggle_rolandkit_menuitem :se_setprops \{text = qs(0x7e35767a)}
	endif
endscript

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
		toggle_guitar_touch_test_menuitem :se_setprops \{text = qs(0x9748009f)}
	else
		toggle_guitar_touch_test_menuitem :se_setprops \{text = qs(0x00cae553)}
	endif
endscript

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
	ui_menu_select_sfx
	kill_debug_elements
	Change play_log_lines = ($play_log_lines + 1)
	if ($play_log_lines > 10)
		Change \{play_log_lines = 10}
	endif
	edit_inputlog_lines_setprop
	init_play_log
endscript

script toggle_tilt 
	ui_menu_select_sfx
	kill_debug_elements
	if ($show_guitar_tilt = 0)
		Change \{show_guitar_tilt = 1}
	else
		Change \{show_guitar_tilt = 0}
	endif
	toggle_tilt_setprop
	init_play_log
endscript

script edit_inputlog_lines_setprop 
	formatText TextName = text qs(0x45c3b812) l = ($play_log_lines)
	edit_inputlog_lines_menuitem :se_setprops text = <text>
endscript

script toggle_tilt_setprop 
	if ($show_guitar_tilt = 0)
		toggle_tilt_menuitem :se_setprops \{text = qs(0x86f42ef4)}
	else
		toggle_tilt_menuitem :se_setprops \{text = qs(0x36b8f01f)}
	endif
endscript

script toggle_leftyflip 
	ui_menu_select_sfx
	GetGlobalTags \{user_options}
	if (<lefty_flip_p1> = 0)
		SetGlobalTags \{user_options
			params = {
				lefty_flip_p1 = 1
			}}
	else
		SetGlobalTags \{user_options
			params = {
				lefty_flip_p1 = 0
			}}
	endif
	GetGlobalTags \{user_options}
	setplayerinfo <Player> lefthanded_gems = <lefty_flip_p1>
	setplayerinfo <Player> lefthanded_button_ups = <lefty_flip_p1>
	toggle_leftyflip_setprop
endscript

script toggle_leftyflip_setprop 
	GetGlobalTags \{user_options}
	if (<lefty_flip_p1> = 0)
		toggle_leftyflip_menuitem :se_setprops \{text = qs(0xc0ad14be)}
	else
		toggle_leftyflip_menuitem :se_setprops \{text = qs(0x0774b6f0)}
	endif
endscript
debug_forcescore = OFF
debug_forcescore_dir = up

script toggle_rockmeter_prototype_player_max 
	ui_menu_select_sfx
	if (($prototype_blink_when_maxed) = 1)
		Change \{prototype_blink_when_maxed = 0}
	else
		Change \{prototype_blink_when_maxed = 1}
	endif
	toggle_rockmeter_prototype_player_max_setprop
endscript

script toggle_rockmeter_prototype_player_max_setprop 
	if (($prototype_blink_when_maxed) = 1)
		id_toggle_proto_rockmeter_player_max :se_setprops \{text = qs(0xcec08b2b)}
	else
		id_toggle_proto_rockmeter_player_max :se_setprops \{text = qs(0xf520ed88)}
	endif
endscript

script toggle_rockmeter_prototype_bar_just 
	ui_menu_select_sfx
	if (($prototype_center_bars) = 1)
		Change \{prototype_center_bars = 0}
	else
		Change \{prototype_center_bars = 1}
	endif
	toggle_rockmeter_prototype_bar_just_setprop
endscript

script toggle_rockmeter_prototype_bar_just_setprop 
	if (($prototype_center_bars) = 0)
		id_toggle_proto_rockmeter_bar_just :se_setprops \{text = qs(0xfff9ad8a)}
	else
		id_toggle_proto_rockmeter_bar_just :se_setprops \{text = qs(0x3e0e3e08)}
	endif
endscript

script debug_restore_song_from_pakname 
	RequireParams \{[
			pakname
		]
		all}
	stringremove text = <pakname> remove = 'songs/' new_string = a
	stringremove text = <a> remove = '_song.pak' new_string = b
	formatText checksumName = c <b>
	printstruct <...>
	return current_song = <c>
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
	gman_songtool_getcurrentsong
	if (<current_song> = NULL)
		if NOT stringequals a = ($song_heap_pakname) b = 'none'
			debug_restore_song_from_pakname pakname = ($song_heap_pakname)
			gman_songtool_setcurrentsong song = <current_song>
		else
			gman_songtool_setcurrentsong song = ($startup_song)
		endif
	endif
	DestroyPakManMap \{map = zones}
	create_zone_maps
	Load_Venue \{block_scripts = 1}
	setup_bg_viewport
	restore_dummy_bg_camera
	disable_bg_viewport_properties
	create_movie_viewport
	if ($current_level = load_z_testlevel_peds)
		SpawnScriptNow \{testlevel_debug}
	else
		persistent_band_prepare_for_song async = <async>
		crowd_reset \{Player = 1}
	endif
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
	Wait \{1
		gameframe}
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
	Wait \{1
		gameframe}
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
	create_changehighway_menu
endscript

script destroy_changehighway_menu 
	if ScreenElementExists \{id = changehighway_scrolling_menu}
		DestroyScreenElement \{id = changehighway_scrolling_menu}
	endif
	destroy_menu_backdrop
endscript

script select_start_song_guitar 
	setplayerinfo \{1
		part = guitar}
	setplayerinfo \{2
		part = guitar}
	setplayerinfo \{3
		part = guitar}
	setplayerinfo \{4
		part = guitar}
	select_start_song <...>
endscript

script select_start_song 
	if GotParam \{forceintro}
		Change \{current_transition = forceintro}
	endif
	if GotParam \{forcelongintro}
		Change \{current_transition = forcelongintro}
	endif
	if GotParam \{song_name}
		gman_songfunc \{func = clear_play_list}
		gman_songtool_setcurrentsong song = <song_name>
	endif
	if GotParam \{starttime}
		Change current_starttime = <starttime>
	endif
	Change \{song_heap_required = 0}
	if GotParam \{from_gameplay}
		restart_warning_select_restart \{dont_save_song_data}
	else
		generic_event_choose data = {state = uistate_play_song starttime = <starttime> uselaststarttime = <uselaststarttime>}
	endif
	vocals_distribute_mics
	destroy_all_debug_menus
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
	printstruct <...>
	SetScreenElementProps id = <id> rgba = [210 130 0 250]
endscript

script menu_unfocus 
	Obj_GetID
	<id> = <objID>
	SetScreenElementProps id = <id> rgba = [210 210 210 250]
endscript

script back_to_retail_menu 
	generic_event_back
endscript

script toggle_global 
	printstruct <...>
	if GotParam \{global_toggle}
		if ($<global_toggle> = 1)
			Change GlobalName = <global_toggle> NewValue = 0
		else
			Change GlobalName = <global_toggle> NewValue = 1
		endif
	endif
endscript

script debug_checkcasassets 
	check_cas \{textures
		preset_profiles
		savegames}
endscript

script debug_checkprogression 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	printf \{qs(0xc44c6625)}
	printf \{qs(0xfca909a2)}
	GetArraySize \{$gig_progression}
	progression_size = <array_Size>
	i = 0
	begin
	progression_struct = ($gig_progression [<i>])
	if StructureContains structure = <progression_struct> gig_to_unlock
		gig = (<progression_struct>.gig_to_unlock)
		venue = None
		songs = []
		if NOT StructureContains structure = ($LevelZones) (($<gig>).venue)
			venue = (($<gig>).venue)
			Change GlobalName = <gig> NewValue = {($<gig>) venue = load_z_cairo}
		endif
		if StructureContains structure = ($<gig>) predefined_playlist
			GetArraySize ($<gig>.predefined_playlist)
			j = 0
			current_gig = ($<gig>)
			current_playlist = ($<gig>.predefined_playlist)
			begin
			if NOT StructureContains structure = ($gh_songlist_props) ($<gig>.predefined_playlist [<j>])
				AddArrayElement array = <songs> element = ($<gig>.predefined_playlist [<j>])
				songs = <array>
				SetArrayElement ArrayName = current_playlist index = <j> NewValue = song2
			endif
			RemoveParameter \{array}
			j = (<j> + 1)
			repeat <array_Size>
			Change GlobalName = <gig> NewValue = {($<gig>) predefined_playlist = <current_playlist>}
		endif
		GetArraySize <songs>
		if ((<venue> != None) || (<array_Size> > 0))
			printf qs(0x0bc409e2) a = (<progression_struct>.gig_to_unlock) DontAssertForChecksums
			if (<venue> != None)
				printf qs(0x39267541) a = <venue> DontAssertForChecksums
			endif
			if (<array_Size> > 0)
				j = 0
				begin
				printf qs(0xbbbcc2d8) a = (<songs> [<j>]) DontAssertForChecksums
				j = (<j> + 1)
				repeat <array_Size>
			endif
		else
			printf qs(0x4982d05c) a = (<progression_struct>.gig_to_unlock) DontAssertForChecksums
		endif
	endif
	i = (<i> + 1)
	repeat <progression_size>
	printf \{qs(0xff165ff3)}
	printf \{qs(0xc44c6625)}
endscript

script debug_dumpheaps 
	finaldumpheaps
endscript
toggled_fps_on = 0
framerate_warning = 57.5

script togglefps 
	if ScreenElementExists \{id = fps_anchor}
		DestroyScreenElement \{id = fps_anchor}
	else
		CreateScreenElement \{Type = ContainerElement
			parent = root_window
			id = fps_anchor
			Pos = (30.0, 140.0)
			just = [
				center
				center
			]
			internal_just = [
				left
				center
			]
			tags = {
				hide_from_debugger
			}}
		CreateScreenElement \{local_id = text
			Type = TextElement
			parent = fps_anchor
			id = fps_text
			Pos = (20.0, -15.0)
			text = qs(0x5059e4e6)
			font = debug
			rgba = [
				120
				120
				200
				200
			]
			just = [
				left
				center
			]
			Scale = 0.75
			z_priority = 10000
			tags = {
				hide_from_debugger
			}}
		CreateScreenElement \{Type = SpriteElement
			parent = fps_anchor
			Pos = (16.0, -34.0)
			texture = white
			rgba = [
				10
				10
				10
				180
			]
			just = [
				left
				top
			]
			dims = (140.0, 38.0)
			z_priority = 9999
			tags = {
				hide_from_debugger
			}}
		RunScriptOnScreenElement \{id = {
				fps_anchor
				child = text
			}
			refreshfpsdisplay}
	endif
endscript
fps_display_hold_red = 0

script refreshfpsdisplay 
	setscriptcannotpause
	begin
	formatText TextName = fps qs(0xcb9020de) d = ($framerate_value)
	if (($framerate_value) < $framerate_warning)
		Change \{fps_display_hold_red = 60}
		rgba = [160 20 20 255]
	elseif ($fps_display_hold_red > 0)
		rgba = [160 20 20 255]
		Change fps_display_hold_red = ($fps_display_hold_red - 1)
	else
		rgba = [100 100 100 255]
	endif
	se_setprops text = <fps> rgba = <rgba>
	Wait \{1
		gameframe}
	repeat
endscript
medleymode_menuitem = 0

script toggle_medleymode_left 
	switch $game_mode
		case p1_quickplay
		Change \{game_mode = practice}
		case p2_quickplay
		Change \{game_mode = p1_quickplay}
		case p3_quickplay
		Change \{game_mode = p2_quickplay}
		case p4_quickplay
		Change \{game_mode = p3_quickplay}
		case gh4_p1_career
		Change \{game_mode = p4_quickplay}
		case gh4_p2_career
		Change \{game_mode = gh4_p1_career}
		case gh4_p3_career
		Change \{game_mode = gh4_p2_career}
		case gh4_p4_career
		Change \{game_mode = gh4_p3_career}
		case p2_pro_faceoff
		Change \{game_mode = gh4_p4_career}
		case practice
		Change \{game_mode = p2_pro_faceoff}
	endswitch
	toggle_medleymode_setprop
endscript

script toggle_medleymode_right 
	switch $game_mode
		case p1_quickplay
		Change \{game_mode = p2_quickplay}
		case p2_quickplay
		Change \{game_mode = p3_quickplay}
		case p3_quickplay
		Change \{game_mode = p4_quickplay}
		case p4_quickplay
		Change \{game_mode = gh4_p1_career}
		case gh4_p1_career
		Change \{game_mode = gh4_p2_career}
		case gh4_p2_career
		Change \{game_mode = gh4_p3_career}
		case gh4_p3_career
		Change \{game_mode = gh4_p4_career}
		case gh4_p4_career
		Change \{game_mode = p2_pro_faceoff}
		case p2_pro_faceoff
		Change \{game_mode = practice}
		case practice
		Change \{game_mode = p1_quickplay}
	endswitch
	toggle_medleymode_setprop
endscript

script toggle_medleymode_setprop 
	switch $game_mode
		case p1_quickplay
		text = qs(0x70c5bf17)
		case p2_quickplay
		text = qs(0x49bd1257)
		case p3_quickplay
		text = qs(0x5e957697)
		case p4_quickplay
		text = qs(0x3b4c48d7)
		case gh4_p1_career
		text = qs(0x02286a08)
		case gh4_p2_career
		text = qs(0x2be0defa)
		case gh4_p3_career
		text = qs(0x85884f6b)
		case gh4_p4_career
		text = qs(0x7871b71e)
		case p2_pro_faceoff
		text = qs(0x145a80fe)
		case practice
		text = qs(0xde9691cd)
	endswitch
	($medleymode_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = <text>
endscript
enable_binkingame = 0
binkingame_menuitem = 0

script toggle_binkingame 
	if ($enable_binkingame = 0)
		Change \{enable_binkingame = 1}
	else
		Change \{enable_binkingame = 0}
	endif
	toggle_binkingame_setprop
endscript

script toggle_binkingame_setprop 
	if ($enable_binkingame = 0)
		($binkingame_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x49c82eb0)
	else
		($binkingame_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x70b712cf)
	endif
endscript
single_stream_enabled_menuitem = 0

script toggle_single_stream_enabled 
	if ($single_stream_enabled = 0)
		Change \{single_stream_enabled = 1}
	else
		Change \{single_stream_enabled = 0}
	endif
	toggle_single_stream_enabled_setprop
endscript

script toggle_single_stream_enabled_setprop 
	if ($single_stream_enabled = 0)
		($single_stream_enabled_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x20260335)
	else
		($single_stream_enabled_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x2718b288)
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

script toggle_allowcontroller_setprop 
	if ($allow_controller_for_all_instruments = 1)
		($allowcontroller_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0xcffb5e1a)
	else
		($allowcontroller_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0xcaedad1d)
	endif
endscript

script is_valid_debug_playermode 
	ExtendCrc <gamemode> '_props' out = props
	if (($<props>.Type = tutorial) || ($<props>.Type = competitive) || ($<props>.Type = pro_faceoff))
		return \{FALSE}
	else
		return \{true}
	endif
endscript
playermode_menuitem = 0

script toggle_playermode_left 
	GetArraySize \{$gamemode_list}
	<gamemode_count> = <array_Size>
	<index> = 0
	<Name> = qs(0x03ac90f0)
	begin
	if ($game_mode = ($gamemode_list) [<index>])
		<gamemode> = $game_mode
		ExtendCrc <gamemode> '_props' out = props
		if is_valid_debug_playermode gamemode = <gamemode>
			<Name> = ($<props>.debug_name)
		else
			<Name> = qs(0xf8741321)
			<index> = 0
		endif
		break
	endif
	<index> = (<index> + 1)
	repeat <gamemode_count>
	<new_index> = (<index> - 1)
	begin
	if (<new_index> < 0)
		<new_index> = (<gamemode_count> - 1)
	endif
	<gamemode> = (($gamemode_list) [<new_index>])
	if is_valid_debug_playermode gamemode = <gamemode>
		Change game_mode = <gamemode>
		break
	endif
	<new_index> = (<new_index> - 1)
	repeat
	toggle_playermode_setprop
endscript

script toggle_playermode_right 
	GetArraySize \{$gamemode_list}
	<gamemode_count> = <array_Size>
	<index> = 0
	<Name> = qs(0x03ac90f0)
	begin
	if ($game_mode = ($gamemode_list) [<index>])
		<gamemode> = $game_mode
		ExtendCrc <gamemode> '_props' out = props
		if is_valid_debug_playermode gamemode = <gamemode>
			<Name> = ($<props>.debug_name)
		else
			<Name> = qs(0xf8741321)
			<index> = 0
		endif
		break
	endif
	<index> = (<index> + 1)
	repeat <gamemode_count>
	<new_index> = (<index> + 1)
	begin
	if (<new_index> > (<gamemode_count> - 1))
		<new_index> = 0
	endif
	<gamemode> = (($gamemode_list) [<new_index>])
	if is_valid_debug_playermode gamemode = <gamemode>
		Change game_mode = <gamemode>
		break
	endif
	<new_index> = (<new_index> + 1)
	repeat
	toggle_playermode_setprop
endscript

script toggle_playermode_setprop 
	GetArraySize \{$gamemode_list}
	<index> = 0
	<Name> = qs(0x03ac90f0)
	begin
	if ($game_mode = ($gamemode_list) [<index>])
		<gamemode> = $game_mode
		ExtendCrc <gamemode> '_props' out = props
		if is_valid_debug_playermode gamemode = <gamemode>
			<Name> = ($<props>.debug_name)
		else
			<Name> = qs(0xf8741321)
			<index> = 0
		endif
		break
	endif
	<index> = (<index> + 1)
	repeat <array_Size>
	formatText TextName = text qs(0x43b35b5d) s = <Name>
	($playermode_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = <text>
endscript

script select_slomo 
	ui_menu_select_sfx
	speedfactor = ($current_speedfactor * 10.0)
	CastToInteger \{speedfactor}
	speedfactor = (<speedfactor> + 1)
	if (<speedfactor> > 10)
		speedfactor = 1
	endif
	if (<speedfactor> < 1)
		speedfactor = 1
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
		qs(0xb6e9c12a)
		s = $current_speedfactor}
	($select_slomo_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = <slomo_text>
endscript

script toggle_lagtestpart1 
	ui_menu_select_sfx
	kill_debug_elements
	if ($lagtestpart1 = 0)
		Change \{lagtestpart1 = 1}
		Change \{Debug_Audible_HitNote = 1}
	else
		Change \{lagtestpart1 = 0}
		Change \{Debug_Audible_HitNote = 0}
	endif
	toggle_lagtestpart1_setprop
endscript

script toggle_lagtestpart2 
	ui_menu_select_sfx
	kill_debug_elements
	if ($lagtestpart2 = 0)
		Change \{lagtestpart2 = 1}
		Change \{show_play_log = 1}
	else
		Change \{lagtestpart2 = 0}
		Change \{show_play_log = 0}
	endif
	toggle_lagtestpart2_setprop
endscript

script toggle_lagtestpart3 
	ui_menu_select_sfx
	kill_debug_elements
	if ($lagtestpart3 = 0)
		Change \{lagtestpart3 = 1}
		Change \{Debug_Audible_Open = 1}
	else
		Change \{lagtestpart3 = 0}
		Change \{Debug_Audible_Open = 0}
	endif
	toggle_lagtestpart3_setprop
endscript
toggle_lagtestpart1_menuitem = 0

script toggle_lagtestpart1_setprop 
	if ($lagtestpart1 = 0)
		($toggle_lagtestpart1_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x67683b65)
	else
		($toggle_lagtestpart1_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x69bf20d3)
	endif
endscript
toggle_lagtestpart2_menuitem = 0

script toggle_lagtestpart2_setprop 
	if ($lagtestpart2 = 0)
		($toggle_lagtestpart2_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x10f6e995)
	else
		($toggle_lagtestpart2_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x82889bd0)
	endif
endscript
toggle_lagtestpart3_menuitem = 0

script toggle_lagtestpart3_setprop 
	if ($lagtestpart3 = 0)
		($toggle_lagtestpart3_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x8b53a5fa)
	else
		($toggle_lagtestpart3_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x6d4af0ee)
	endif
endscript

script edit_inputlagvalue_left 
	ui_menu_select_sfx
	kill_debug_elements
	GetPlatform
	switch <Platform>
		case PS2
		ps2_props = ($default_lag_settings.PS2)
		ps2_props = {<ps2_props> input_lag_ms = (<ps2_props>.input_lag_ms - 1)}
		Change default_lag_settings = {($default_lag_settings) PS2 = <ps2_props>}
		case PS3
		ps3_props = ($default_lag_settings.PS3)
		ps3_props = {<ps3_props> input_lag_ms = (<ps3_props>.input_lag_ms - 1)}
		Change default_lag_settings = {($default_lag_settings) PS3 = <ps3_props>}
		case windx
		case Xenon
		xenon_props = ($default_lag_settings.Xenon)
		xenon_props = {<xenon_props> input_lag_ms = (<xenon_props>.input_lag_ms - 1)}
		Change default_lag_settings = {($default_lag_settings) Xenon = <xenon_props>}
		case wii
		wii_props = ($default_lag_settings.wii)
		wii_props = {<wii_props> input_lag_ms = (<wii_props>.input_lag_ms - 1)}
		Change default_lag_settings = {($default_lag_settings) wii = <wii_props>}
		default
		printf \{channel = sfx
			qs(0xbb3931d5)}
	endswitch
	edit_inputlagvalue_setprop
endscript

script edit_inputlagvalue_right 
	ui_menu_select_sfx
	kill_debug_elements
	GetPlatform
	switch <Platform>
		case PS2
		ps2_props = ($default_lag_settings.PS2)
		ps2_props = {<ps2_props> input_lag_ms = (<ps2_props>.input_lag_ms + 1)}
		Change default_lag_settings = {($default_lag_settings) PS2 = <ps2_props>}
		case PS3
		ps3_props = ($default_lag_settings.PS3)
		ps3_props = {<ps3_props> input_lag_ms = (<ps3_props>.input_lag_ms + 1)}
		Change default_lag_settings = {($default_lag_settings) PS3 = <ps3_props>}
		case windx
		case Xenon
		xenon_props = ($default_lag_settings.Xenon)
		xenon_props = {<xenon_props> input_lag_ms = (<xenon_props>.input_lag_ms + 1)}
		Change default_lag_settings = {($default_lag_settings) Xenon = <xenon_props>}
		case wii
		wii_props = ($default_lag_settings.wii)
		wii_props = {<wii_props> input_lag_ms = (<wii_props>.input_lag_ms + 1)}
		Change default_lag_settings = {($default_lag_settings) wii = <wii_props>}
		default
		printf \{channel = sfx
			qs(0xbb3931d5)}
	endswitch
	edit_inputlagvalue_setprop
endscript

script edit_gemlagvalue_left 
	ui_menu_select_sfx
	kill_debug_elements
	GetPlatform
	switch <Platform>
		case PS2
		ps2_props = ($default_lag_settings.PS2)
		ps2_props = {<ps2_props> gem_lag_ms = (<ps2_props>.gem_lag_ms - 1)}
		Change default_lag_settings = {($default_lag_settings) PS2 = <ps2_props>}
		case PS3
		ps3_props = ($default_lag_settings.PS3)
		ps3_props = {<ps3_props> gem_lag_ms = (<ps3_props>.gem_lag_ms - 1)}
		Change default_lag_settings = {($default_lag_settings) PS3 = <ps3_props>}
		case windx
		case Xenon
		xenon_props = ($default_lag_settings.Xenon)
		xenon_props = {<xenon_props> gem_lag_ms = (<xenon_props>.gem_lag_ms - 1)}
		Change default_lag_settings = {($default_lag_settings) Xenon = <xenon_props>}
		case wii
		wii_props = ($default_lag_settings.wii)
		wii_props = {<wii_props> gem_lag_ms = (<wii_props>.gem_lag_ms - 1)}
		Change default_lag_settings = {($default_lag_settings) wii = <wii_props>}
		default
		printf \{channel = sfx
			qs(0xbb3931d5)}
	endswitch
	edit_gemlagvalue_setprop
endscript

script edit_gemlagvalue_right 
	ui_menu_select_sfx
	kill_debug_elements
	GetPlatform
	switch <Platform>
		case PS2
		ps2_props = ($default_lag_settings.PS2)
		ps2_props = {<ps2_props> gem_lag_ms = (<ps2_props>.gem_lag_ms + 1)}
		Change default_lag_settings = {($default_lag_settings) PS2 = <ps2_props>}
		case PS3
		ps3_props = ($default_lag_settings.PS3)
		ps3_props = {<ps3_props> gem_lag_ms = (<ps3_props>.gem_lag_ms + 1)}
		Change default_lag_settings = {($default_lag_settings) PS3 = <ps3_props>}
		case windx
		case Xenon
		xenon_props = ($default_lag_settings.Xenon)
		xenon_props = {<xenon_props> gem_lag_ms = (<xenon_props>.gem_lag_ms + 1)}
		Change default_lag_settings = {($default_lag_settings) Xenon = <xenon_props>}
		case wii
		wii_props = ($default_lag_settings.wii)
		wii_props = {<wii_props> gem_lag_ms = (<wii_props>.gem_lag_ms + 1)}
		Change default_lag_settings = {($default_lag_settings) wii = <wii_props>}
		default
		printf \{channel = sfx
			qs(0xbb3931d5)}
	endswitch
	edit_gemlagvalue_setprop
endscript

script edit_audiolagvalue_left 
	printf \{channel = sfx
		qs(0x78348f8f)}
	ui_menu_select_sfx
	kill_debug_elements
	GetPlatform
	switch <Platform>
		case PS2
		ps2_props = ($default_lag_settings.PS2)
		ps2_props = {<ps2_props> audio_lag_ms = (<ps2_props>.audio_lag_ms - 1)}
		Change default_lag_settings = {($default_lag_settings) PS2 = <ps2_props>}
		case PS3
		ps3_props = ($default_lag_settings.PS3)
		ps3_props = {<ps3_props> audio_lag_ms = (<ps3_props>.audio_lag_ms - 1)}
		Change default_lag_settings = {($default_lag_settings) PS3 = <ps3_props>}
		case windx
		case Xenon
		xenon_props = ($default_lag_settings.Xenon)
		xenon_props = {<xenon_props> audio_lag_ms = (<xenon_props>.audio_lag_ms - 1)}
		Change default_lag_settings = {($default_lag_settings) Xenon = <xenon_props>}
		case wii
		wii_props = ($default_lag_settings.wii)
		wii_props = {<wii_props> audio_lag_ms = (<wii_props>.audio_lag_ms - 1)}
		Change default_lag_settings = {($default_lag_settings) wii = <wii_props>}
		default
		printf \{channel = sfx
			qs(0xbb3931d5)}
	endswitch
	edit_audiolagvalue_setprop
endscript

script edit_audiolagvalue_right 
	printf \{channel = sfx
		qs(0xd8d58f64)}
	ui_menu_select_sfx
	kill_debug_elements
	GetPlatform
	switch <Platform>
		case PS2
		ps2_props = ($default_lag_settings.PS2)
		ps2_props = {<ps2_props> audio_lag_ms = (<ps2_props>.audio_lag_ms + 1)}
		Change default_lag_settings = {($default_lag_settings) PS2 = <ps2_props>}
		case PS3
		ps3_props = ($default_lag_settings.PS3)
		ps3_props = {<ps3_props> audio_lag_ms = (<ps3_props>.audio_lag_ms + 1)}
		Change default_lag_settings = {($default_lag_settings) PS3 = <ps3_props>}
		case windx
		case Xenon
		xenon_props = ($default_lag_settings.Xenon)
		xenon_props = {<xenon_props> audio_lag_ms = (<xenon_props>.audio_lag_ms + 1)}
		Change default_lag_settings = {($default_lag_settings) Xenon = <xenon_props>}
		case wii
		wii_props = ($default_lag_settings.wii)
		wii_props = {<wii_props> audio_lag_ms = (<wii_props>.audio_lag_ms + 1)}
		Change default_lag_settings = {($default_lag_settings) wii = <wii_props>}
		default
		printf \{channel = sfx
			qs(0xbb3931d5)}
	endswitch
	edit_audiolagvalue_setprop
endscript
edit_inputlagvalue_menuitem = 0

script edit_inputlagvalue_setprop 
	GetPlatform
	switch <Platform>
		case PS2
		formatText TextName = text qs(0x519b5d83) l = ($default_lag_settings.PS2.input_lag_ms)
		($edit_inputlagvalue_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = <text>
		case PS3
		formatText TextName = text qs(0x503ef435) l = ($default_lag_settings.PS3.input_lag_ms)
		($edit_inputlagvalue_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = <text>
		case windx
		formatText TextName = text qs(0xf77e6f13) l = ($default_lag_settings.Xenon.input_lag_ms)
		($edit_inputlagvalue_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = <text>
		case Xenon
		formatText TextName = text qs(0x6bb70bb2) l = ($default_lag_settings.Xenon.input_lag_ms)
		($edit_inputlagvalue_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = <text>
		case wii
		formatText TextName = text qs(0xd3aec0f4) l = ($default_lag_settings.wii.input_lag_ms)
		($edit_inputlagvalue_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = <text>
		default
		printf \{channel = sfx
			qs(0xbb3931d5)}
	endswitch
endscript
edit_gemlagvalue_menuitem = 0

script edit_gemlagvalue_setprop 
	GetPlatform
	switch <Platform>
		case PS2
		formatText TextName = text qs(0x97202262) l = ($default_lag_settings.PS2.gem_lag_ms)
		($edit_gemlagvalue_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = <text>
		case PS3
		formatText TextName = text qs(0x1aa8df80) l = ($default_lag_settings.PS3.gem_lag_ms)
		($edit_gemlagvalue_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = <text>
		case windx
		formatText TextName = text qs(0x0709b958) l = ($default_lag_settings.Xenon.gem_lag_ms)
		($edit_gemlagvalue_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = <text>
		case Xenon
		formatText TextName = text qs(0x353caad1) l = ($default_lag_settings.Xenon.gem_lag_ms)
		($edit_gemlagvalue_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = <text>
		case wii
		formatText TextName = text qs(0x8bdedff2) l = ($default_lag_settings.wii.gem_lag_ms)
		($edit_gemlagvalue_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = <text>
		default
		printf \{channel = sfx
			qs(0xbb3931d5)}
	endswitch
endscript
edit_audiolagvalue_menuitem = 0

script edit_audiolagvalue_setprop 
	printf \{channel = sfx
		qs(0x35b247df)}
	GetPlatform
	switch <Platform>
		case PS2
		formatText TextName = text qs(0xf30d4cd4) l = ($default_lag_settings.PS2.audio_lag_ms)
		($edit_audiolagvalue_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = <text>
		case PS3
		formatText TextName = text qs(0x5234c83a) l = ($default_lag_settings.PS3.audio_lag_ms)
		($edit_audiolagvalue_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = <text>
		case windx
		formatText TextName = text qs(0x29940faf) l = ($default_lag_settings.Xenon.audio_lag_ms)
		($edit_audiolagvalue_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = <text>
		case Xenon
		formatText TextName = text qs(0xcd437801) l = ($default_lag_settings.Xenon.audio_lag_ms)
		($edit_audiolagvalue_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = <text>
		case wii
		formatText TextName = text qs(0x6d6fdd8f) l = ($default_lag_settings.wii.audio_lag_ms)
		($edit_audiolagvalue_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = <text>
		default
		printf \{channel = sfx
			qs(0xbb3931d5)}
	endswitch
endscript

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
	gman_songtool_setcurrentsong song = <song_name>
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
		if ScreenElementExists \{id = highway_containerp1}
			legacydoscreenelementmorph \{id = highway_containerp1
				alpha = 1}
		endif
		if ScreenElementExists \{id = highway_containerp2}
			legacydoscreenelementmorph \{id = highway_containerp2
				alpha = 1}
		endif
		if ScreenElementExists \{id = highway_containerp3}
			legacydoscreenelementmorph \{id = highway_containerp3
				alpha = 1}
		endif
		if ScreenElementExists \{id = highway_containerp4}
			legacydoscreenelementmorph \{id = highway_containerp4
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
		if ScreenElementExists \{id = highway_containerp1}
			legacydoscreenelementmorph \{id = highway_containerp1
				alpha = 0}
		endif
		if ScreenElementExists \{id = highway_containerp2}
			legacydoscreenelementmorph \{id = highway_containerp2
				alpha = 0}
		endif
		if ScreenElementExists \{id = highway_containerp3}
			legacydoscreenelementmorph \{id = highway_containerp3
				alpha = 0}
		endif
		if ScreenElementExists \{id = highway_containerp4}
			legacydoscreenelementmorph \{id = highway_containerp4
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
debug_friends_lb_box = 0

script toggle_friends_lb_hud 
	if ($debug_friends_lb_box = 0)
		Change \{debug_friends_lb_box = 1}
	else
		Change \{debug_friends_lb_box = 0}
	endif
	toggle_friends_lb_hud_setprop
endscript
toggle_friends_lb_hud_menuitem = 0

script toggle_friends_lb_hud_setprop 
	if ($debug_friends_lb_box = 0)
		($toggle_friends_lb_hud_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0xe04dc34b)
	else
		($toggle_friends_lb_hud_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x30ac3c2c)
	endif
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
			Scale = 1
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
			z_priority = 1000
			Hide}
		if ($playing_song = 1)
			debug_songstars_text :se_setprops \{unhide}
		endif
	else
		Change \{debug_showsongstars = OFF}
	endif
	if NOT GotParam \{for_autolaunch}
		toggle_showsongstars_setprop
	endif
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
			Scale = 1
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
	if NOT GotParam \{for_autolaunch}
		toggle_showsongtime_setprop
	endif
endscript
toggle_showsongtime_menuitem = 0

script toggle_showsongtime_setprop 
	if ($debug_showsongtime = OFF)
		($toggle_showsongtime_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x3360aae1)
	else
		($toggle_showsongtime_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x79b13e73)
	endif
endscript
debug_showsongname = OFF

script toggle_showsongname 
	ui_menu_select_sfx
	if ScreenElementExists \{id = debug_songname_text}
		DestroyScreenElement \{id = debug_songname_text}
	endif
	if ($debug_showsongname = OFF)
		Change \{debug_showsongname = On}
		CreateScreenElement \{Type = TextElement
			parent = root_window
			id = debug_songname_text
			font = debug
			text = qs(0x13e67977)
			Scale = 1
			Pos = (850.0, 150.0)
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
			debug_songname_text :se_setprops \{unhide}
		endif
	else
		Change \{debug_showsongname = OFF}
	endif
	if NOT GotParam \{for_autolaunch}
		toggle_showsongname_setprop
	endif
endscript
toggle_showsongname_menuitem = 0

script toggle_showsongname_setprop 
	if ($debug_showsongname = OFF)
		($toggle_showsongname_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x3360aae1)
	else
		($toggle_showsongname_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x79b13e73)
	endif
endscript
debug_showcameraname = OFF

script toggle_showcameraname 
	ui_menu_select_sfx
	if ScreenElementExists \{id = debug_camera_name_text}
		DestroyScreenElement \{id = debug_camera_name_text}
	endif
	if ScreenElementExists \{id = debug_camera_name_text2}
		DestroyScreenElement \{id = debug_camera_name_text2}
	endif
	if ($debug_showcameraname = OFF)
		Change \{debug_showcameraname = On}
	else
		Change \{debug_showcameraname = OFF}
	endif
	toggle_showcameraname_setprop
	CameraCuts_UpdateDebugCameraName
endscript
toggle_showcameraname_menuitem = 0

script toggle_showcameraname_setprop 
	if ($debug_showcameraname = OFF)
		($toggle_showcameraname_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0xcf0c92d5)
	else
		($toggle_showcameraname_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0xa9b88151)
	endif
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
toggle_inputlog_menuitem = 0

script toggle_inputlog_setprop 
	if ($show_play_log = 0)
		($toggle_inputlog_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x623a021b)
	else
		($toggle_inputlog_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x6f30d160)
	endif
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
toggle_rockmeterdebug_menuitem = 0

script toggle_rockmeterdebug_setprop 
	if ($rock_meter_debug = 0)
		($toggle_rockmeterdebug_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x11f39d10)
	else
		($toggle_rockmeterdebug_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x3c951f3d)
	endif
endscript
debug_song_volume_info = 0

script toggle_viewvolumesonscreen 
	ui_menu_select_sfx
	kill_debug_elements
	if ($viewvolumesonscreen = 0)
		Change \{viewvolumesonscreen = 1}
		Change \{debug_song_volume_info = 1}
	else
		Change \{viewvolumesonscreen = 0}
		Change \{debug_song_volume_info = 0}
	endif
	toggle_viewvolumesonscreen_setprop
endscript
toggle_viewvolumesonscreen_menuitem = 0

script toggle_viewvolumesonscreen_setprop 
	if ($viewvolumesonscreen = 0)
		($toggle_viewvolumesonscreen_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x85d66ef7)
	else
		($toggle_viewvolumesonscreen_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0xf08cf696)
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
use_motion_blur = 1

script toggle_motion_blur 
	ui_menu_select_sfx
	if (($use_motion_blur) = 1)
		Change \{use_motion_blur = 0}
	else
		Change \{use_motion_blur = 1}
	endif
	toggle_motion_blur_setprop
endscript
toggle_motion_blur_menuitem = 0

script toggle_motion_blur_setprop 
	if ($use_motion_blur = 0)
		($toggle_motion_blur_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0xce66d54e)
		engineconfig \{disablescreenfx = motionblur}
	else
		($toggle_motion_blur_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x94cce46a)
		engineconfig \{enablescreenfx = motionblur}
	endif
endscript
use_ad_overlay = 0

script toggle_ad_overlay 
	ui_menu_select_sfx
	if (($use_ad_overlay) = 1)
		Change \{use_ad_overlay = 0}
	else
		Change \{use_ad_overlay = 1}
	endif
	toggle_ad_overlay_setprop
endscript
toggle_ad_overlay_menuitem = 0

script toggle_ad_overlay_setprop 
	if ($use_ad_overlay = 0)
		($toggle_ad_overlay_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x64904f09)
		dynamicaddebugoverlay_destroy
	else
		($toggle_ad_overlay_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0xfb5cf631)
		spawnscript \{dynamicaddebugoverlay}
	endif
endscript
use_ok_for_ad_override = 0

script toggle_ok_for_ad_override 
	ui_menu_select_sfx
	if (($use_ok_for_ad_override) = 1)
		Change \{use_ok_for_ad_override = 0}
	else
		Change \{use_ok_for_ad_override = 1}
	endif
	toggle_ok_for_ad_override_setprop
endscript
toggle_ok_for_ad_override_menuitem = 0

script toggle_ok_for_ad_override_setprop 
	if ($use_ok_for_ad_override = 0)
		($toggle_ok_for_ad_override_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x5ee140cd)
		ok_for_ad_off
	else
		($toggle_ok_for_ad_override_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0xc41c2fc8)
		ok_for_ad_on
	endif
endscript
use_screen_noise = 1

script toggle_screen_noise 
	ui_menu_select_sfx
	if (($use_screen_noise) = 1)
		Change \{use_screen_noise = 0}
	else
		Change \{use_screen_noise = 1}
	endif
	toggle_screen_noise_setprop
endscript
toggle_screen_noise_menuitem = 0

script toggle_screen_noise_setprop 
	if ($use_screen_noise = 0)
		($toggle_screen_noise_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0xb690910c)
		engineconfig \{disablescreenfx = noise2}
	else
		($toggle_screen_noise_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0xcdceeebb)
		engineconfig \{enablescreenfx = noise2}
	endif
endscript

script cycle_musician_type_left 
	formatText checksumName = global_name 'debug_musician%a' a = <musician>
	switch ($<global_name>)
		case None
		new_type = drum
		case guitar
		new_type = drum
		case bass
		new_type = guitar
		case vocals
		new_type = bass
		case drum
		new_type = vocals
	endswitch
	Change GlobalName = <global_name> NewValue = <new_type>
	toggle_musician_type_setprop
endscript

script cycle_musician_type_right 
	formatText checksumName = global_name 'debug_musician%a' a = <musician> AddToStringLookup = true
	switch ($<global_name>)
		case None
		new_type = guitar
		case guitar
		new_type = bass
		case bass
		new_type = vocals
		case vocals
		new_type = drum
		case drum
		new_type = guitar
	endswitch
	Change GlobalName = <global_name> NewValue = <new_type>
	toggle_musician_type_setprop
endscript
toggle_musician_type_menuitem = [
]

script toggle_musician_type_setprop 
	array_count = 1
	begin
	formatText checksumName = global_name 'debug_musician%a' a = <array_count> AddToStringLookup = true
	switch ($<global_name>)
		case None
		type_string = qs(0x9c1b5214)
		case guitar
		type_string = qs(0x11355666)
		case bass
		type_string = qs(0x4f551cbe)
		case vocals
		type_string = qs(0x9fae80a8)
		case drum
		type_string = qs(0xf3e03f27)
	endswitch
	formatText TextName = menutext qs(0xb7fb7aac) a = <array_count> b = <type_string>
	($toggle_musician_type_menuitem [(<array_count> - 1)]) :se_setprops generic_menu_smenu_textitem_text_text = <menutext>
	if NOT GotParam \{no_refresh}
		setplayerinfo <array_count> part = ($<global_name>)
		persistent_band_create_band \{refresh = 1}
	endif
	array_count = (<array_count> + 1)
	repeat 4
endscript

script toggle_bot \{Player = 1}
	ui_menu_select_sfx
	kill_debug_elements
	getplayerinfo <Player> bot_play
	setplayerinfo <Player> bot_play = (1 - <bot_play>)
	toggle_bot_setprop
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
	toggle_star_setprop
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
	toggle_hyperspeed_setprop
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
	toggle_hyperspeed_setprop
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

script go_to_rockout_from_debug 
	destroy_tools_menu
	generic_event_choose \{state = uistate_rockout}
endscript

script debug_choose_whiteboard_mode 
	Change \{game_mode = whiteboard_team}
	init_whiteboard_table
	generic_event_replace \{state = uistate_whiteboard_mode}
endscript

script test_velocity_strum 
	if ScreenElementExists \{id = test_velocity_strum_cont}
		KillSpawnedScript \{Name = test_velocity_strum_update}
		DestroyScreenElement \{id = test_velocity_strum_cont}
	else
		CreateScreenElement \{Type = ContainerElement
			parent = root_window
			id = test_velocity_strum_cont
			Pos = (100.0, 300.0)}
		CreateScreenElement \{Type = TextElement
			parent = test_velocity_strum_cont
			Pos = (0.0, 0.0)
			text = qs(0x2f63c463)
			font = fontgrid_text_a1
			rgba = [
				200
				200
				200
				255
			]
			just = [
				left
				center
			]
			Scale = 0.5}
		CreateScreenElement \{Type = TextElement
			parent = test_velocity_strum_cont
			id = test_velocity_strum_num_text
			Pos = (0.0, 50.0)
			text = qs(0x9e0cb7ef)
			font = fontgrid_text_a1
			rgba = [
				200
				200
				200
				255
			]
			just = [
				left
				center
			]}
		CreateScreenElement \{Type = TextElement
			parent = test_velocity_strum_cont
			Pos = (0.0, 100.0)
			text = qs(0x189a82bf)
			font = fontgrid_text_a1
			rgba = [
				200
				200
				200
				255
			]
			just = [
				left
				center
			]
			Scale = 0.5}
		CreateScreenElement \{Type = TextElement
			parent = test_velocity_strum_cont
			id = test_velocity_strum_average_text
			Pos = (0.0, 150.0)
			text = qs(0x9e0cb7ef)
			font = fontgrid_text_a1
			rgba = [
				200
				200
				200
				255
			]
			just = [
				left
				center
			]}
		SpawnScriptNow \{test_velocity_strum_update}
	endif
endscript

script test_velocity_strum_update 
	avg_count = 0
	lefty_sum = 0
	trigger_sum = 0
	strum = 0
	max_velocity = -999
	first_frame_hit = 0
	begin
	GuitarGetAnalogueInfo controller = ($primary_controller)
	formatText TextName = velocity_text qs(0x73307931) s = <righttrigger>
	if ControllerMake \{up}
		strum = 1
	endif
	if ControllerMake \{down}
		strum = 1
	endif
	if (<strum> = 1)
		if (<avg_count> = 0)
			printf \{channel = velocity_test
				qs(0x03ac90f0)}
			printf \{channel = velocity_test
				qs(0x01569320)}
			printf \{channel = velocity_test
				qs(0x670ca128)}
			<first_frame_hit> = <righttrigger>
		endif
		printf channel = velocity_test qs(0x4354a1e3) a = <avg_count> s = <righttrigger>
		if (<righttrigger> > <max_velocity>)
			<max_velocity> = <righttrigger>
		endif
		test_velocity_strum_num_text :se_setprops text = <velocity_text>
		if (<righttrigger> != -128)
			<trigger_sum> = (<trigger_sum> + <righttrigger>)
			<avg_count> = (<avg_count> + 1)
		else
			printf \{channel = velocity_test
				qs(0x03ac90f0)}
			printf channel = velocity_test qs(0x59a6dff9) s = <first_frame_hit>
			if (<avg_count> > 0)
				average = (<trigger_sum> / <avg_count>)
				formatText TextName = average_text qs(0x73307931) s = <average>
				printf channel = velocity_test qs(0x21850867) s = <average>
				test_velocity_strum_average_text :se_setprops text = <average_text>
			endif
			printf channel = velocity_test qs(0xee76c5c1) s = <max_velocity>
			printf channel = velocity_test qs(0xbde6dc99) s = <avg_count>
			if (<first_frame_hit> > ($guitar_accent_note_threshold_value))
				printf \{channel = velocity_test
					qs(0x03ac90f0)}
				printf \{channel = velocity_test
					qs(0xa6e09a1d)}
				printf \{channel = velocity_test
					qs(0x03ac90f0)}
			endif
			printf \{channel = velocity_test
				qs(0x01569320)}
			printf \{channel = velocity_test
				qs(0x03ac90f0)}
			<trigger_sum> = 0
			<avg_count> = 0
			<strum> = 0
			<max_velocity> = -999
			<strum> = 0
			<first_frame_hit> = 0
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript
