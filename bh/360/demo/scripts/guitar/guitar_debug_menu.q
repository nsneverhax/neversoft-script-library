menu_pos = (675.0, 100.0)

script create_debug_backdrop 
	destroy_debug_backdrop
	createscreenelement \{type = spriteelement
		parent = root_window
		id = debug_backdrop
		pos = (640.0, 0.0)
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
		pos = ($menu_pos - (0.0, 80.0))
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
	launchevent \{type = focus
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
		pos = ($menu_pos - (0.0, 80.0))
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
	change binkingame_menuitem = <item_container_id>
	toggle_binkingame_setprop
	add_generic_menu_text_item \{text = qs(0xaa9efe73)
		pad_choose_script = toggle_single_stream_enabled}
	change single_stream_enabled_menuitem = <item_container_id>
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
	launchevent \{type = focus
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
		pos = ($menu_pos - (0.0, 80.0))
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
	change allowcontroller_menuitem = <item_container_id>
	toggle_allowcontroller_setprop
	add_generic_menu_text_item {
		text = qs(0x3511e773)
		pad_choose_script = select_playermode
		pad_choose_params = {from_gameplay = <from_gameplay>}
		pad_left_script = toggle_playermode_left
		pad_right_script = toggle_playermode_right
	}
	change playermode_menuitem = <item_container_id>
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
	change select_slomo_menuitem = <item_container_id>
	select_slomo_setprop
	add_generic_menu_text_item \{text = qs(0x474a49b8)
		pad_choose_script = create_cameracut_group_menu}
	add_generic_menu_text_item \{text = qs(0x1e055569)
		pad_choose_script = 0x11526d59}
	add_generic_menu_text_item \{text = qs(0xa596cd4e)
		pad_choose_script = toggle_lagtestpart1}
	change toggle_lagtestpart1_menuitem = <item_container_id>
	toggle_lagtestpart1_setprop
	add_generic_menu_text_item \{text = qs(0x8ebb9e8d)
		pad_choose_script = toggle_lagtestpart2}
	change toggle_lagtestpart2_menuitem = <item_container_id>
	toggle_lagtestpart2_setprop
	add_generic_menu_text_item \{text = qs(0x97a0afcc)
		pad_choose_script = toggle_lagtestpart3}
	change toggle_lagtestpart3_menuitem = <item_container_id>
	toggle_lagtestpart3_setprop
	add_generic_menu_text_item \{text = qs(0x742b6db0)
		pad_left_script = edit_inputlagvalue_left
		pad_right_script = edit_inputlagvalue_right}
	change edit_inputlagvalue_menuitem = <item_container_id>
	edit_inputlagvalue_setprop
	add_generic_menu_text_item \{text = qs(0x9164e749)
		pad_left_script = edit_gemlagvalue_left
		pad_right_script = edit_gemlagvalue_right}
	change edit_gemlagvalue_menuitem = <item_container_id>
	edit_gemlagvalue_setprop
	add_generic_menu_text_item \{text = qs(0xecb004e9)
		pad_left_script = edit_audiolagvalue_left
		pad_right_script = edit_audiolagvalue_right}
	change edit_audiolagvalue_menuitem = <item_container_id>
	edit_audiolagvalue_setprop
	add_generic_menu_text_item \{text = qs(0x31fe1190)
		pad_choose_script = toggle_forcescore}
	change toggle_forcescore_menuitem = <item_container_id>
	toggle_forcescore_setprop
	add_generic_menu_text_item \{text = qs(0xaa524fbd)
		pad_choose_script = toggle_vocalsfreeform}
	change toggle_vocalsfreeform_menuitem = <item_container_id>
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
	change toggle_intro_select_menuitem = <item_container_id>
	toggle_intro_select_setprop
	launchevent \{type = focus
		target = ingame_vmenu}
endscript

script back_to_in_game_menu 
	destroy_all_debug_menus
	create_in_game_menu
endscript

script destroy_in_game_menu 
	generic_ui_destroy
endscript

script 0x11526d59 
	change 0xfdf40f77 = (1 - ($0xfdf40f77))
	0xab890e53
	printf qs(0xab519778) d = ($0xfdf40f77)
endscript

script create_skipintosong_menu 
	ui_menu_select_sfx
	destroy_in_game_menu
	make_generic_menu {
		vmenu_id = skipintosong_vmenu
		pos = ($menu_pos - (0.0, 80.0))
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
	launchevent \{type = focus
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
	if gotparam \{looppoint}
		destroy_looppoint_menu
		callback = back_to_looppoint_menu
	else
		destroy_skipintosong_menu
		callback = back_to_skipintosong_menu
	endif
	make_generic_menu {
		vmenu_id = skipbytime_vmenu
		pos = ($menu_pos - (0.0, 80.0))
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
	if gotparam \{looppoint}
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
	formattext textname = menu_itemname qs(0x3c09de0c) s = <current_time>
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
	launchevent \{type = focus
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
	if gotparam \{looppoint}
		destroy_looppoint_menu
		callback = back_to_looppoint_menu
	else
		destroy_skipintosong_menu
		callback = back_to_skipintosong_menu
	endif
	make_generic_menu {
		vmenu_id = skipbymarker_vmenu
		pos = ($menu_pos - (0.0, 80.0))
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
	if gotparam \{looppoint}
		menu_func = set_looppoint
		add_generic_menu_text_item {
			text = qs(0x9888eddd)
			pad_choose_script = <menu_func>
			pad_choose_params = {starttime = -1000000 from_gameplay = <from_gameplay>}
		}
	endif
	songfilemanager func = get_marker_array song_name = <current_song> part = guitar
	getarraysize <marker_array>
	marker_array_size = <array_size>
	if (<array_size> = 0)
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
		formattext {
			textname = menu_itemname
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
	launchevent \{type = focus
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
	if gotparam \{looppoint}
		destroy_looppoint_menu
		callback = back_to_looppoint_menu
	else
		destroy_skipintosong_menu
		callback = back_to_skipintosong_menu
	endif
	make_generic_menu {
		vmenu_id = skipbymeasure_vmenu
		pos = ($menu_pos - (0.0, 80.0))
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
	if gotparam \{looppoint}
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
			formattext textname = menu_itemname qs(0x5fe38f1e) s = (<time> / 1000.0) m = <measure_count>
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
	launchevent \{type = focus
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
		pos = ($menu_pos - (0.0, 80.0))
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
	launchevent \{type = focus
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
	change current_looppoint = <starttime>
	gh3_start_pressed
endscript

script create_changevenue_menu 
	ui_menu_select_sfx
	destroy_in_game_menu
	make_generic_menu {
		vmenu_id = changevenue_vmenu
		pos = ($menu_pos - (0.0, 80.0))
		dims = (400.0, 500.0)
		z_priority = 100.0
		title_pos = ($menu_pos - (0.0, 80.0))
		title_just = [left top]
		pad_back_script = back_to_in_game_menu
		title = qs(0x0606bdb8)
		scrolling
		use_all_controllers
	}
	get_levelzonearray_size
	array_count = 0
	begin
	get_levelzonearray_checksum index = <array_count>
	formattext textname = level_name qs(0x5af41da1) t = ($levelzones.<level_checksum>.title) n = ($levelzones.<level_checksum>.name)
	add_generic_menu_text_item {
		text = <level_name>
		pad_choose_script = select_venue
		pad_choose_params = {level = <level_checksum> norestart}
	}
	<array_count> = (<array_count> + 1)
	repeat <array_size>
	launchevent \{type = focus
		target = changevenue_vmenu}
endscript

script back_to_changevenue_menu 
	destroy_all_debug_menus
	create_changevenue_menu
endscript

script destroy_changevenue_menu 
	generic_ui_destroy
endscript

script create_changeguitar_menu \{type = guitar}
	ui_menu_select_sfx
	destroy_in_game_menu
	if (<type> = guitar)
		changeguitar_menu_header = qs(0x7a2d9b63)
	else
		changeguitar_menu_header = qs(0x4f76321c)
	endif
	make_generic_menu {
		vmenu_id = changeguitar_vmenu
		pos = ($menu_pos - (0.0, 80.0))
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
	if (<type> = (<info_struct>.type))
		printf qs(0xc994f540) i = (<info_struct>.name)
		add_generic_menu_text_item {
			text = (<info_struct>.name)
			pad_choose_script = select_guitar
			pad_choose_params = {guitar = <array_count> type = <type>}
		}
	endif
	<array_count> = (<array_count> + 1)
	repeat <array_size>
	launchevent \{type = focus
		target = changeguitar_vmenu}
endscript

script back_to_changeguitar_menu 
	destroy_all_debug_menus
	create_changeguitar_menu
endscript

script destroy_changeguitar_menu 
	generic_ui_destroy
endscript

script select_guitar \{type = guitar}
	ui_menu_select_sfx
	kill_gem_scroller
	select_start_song
endscript
cameracutprefixarray = [
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
	'cameras_No_Band'
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
		pos = ($menu_pos - (0.0, 80.0))
		dims = (400.0, 500.0)
		z_priority = 100.0
		title_pos = ($menu_pos - (0.0, 80.0))
		title_just = [left top]
		pad_back_script = back_to_in_game_menu
		title = qs(0xecd234cc)
		scrolling
		use_all_controllers
	}
	if NOT generic_menu :desc_resolvealias \{name = 0x92a24386}
		return
	endif
	generic_menu :se_setprops \{generic_menu_title_alpha = 0
		background_alpha = 0
		skull_alpha = 0
		scrollbar_alpha = 0}
	assignalias id = <resolved_id> alias = current_menu
	add_generic_menu_text_item \{text = qs(0x1527ff9c)
		pad_choose_script = select_cameracut
		pad_choose_params = {
			camera_array_pakname = none
			camera_array = none
			array_count = none
		}}
	getpakmancurrentname \{map = zones}
	camera_count = 0
	getarraysize \{$cameracutprefixarray}
	camera_array_size = <array_size>
	begin
	formattext checksumname = camera_array '%s_%p' s = <pakname> p = ($cameracutprefixarray [<camera_count>])
	if globalexists name = <camera_array>
		getarraysize $<camera_array>
		if (<array_size>)
			formattext textname = camera_group qs(0x581d2af2) p = ($cameracutprefixarray [<camera_count>])
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
	launchevent \{type = focus
		target = selectcameracut_group_vmenu}
endscript

script 0x02ef6392 
	generic_menu :se_getprops
	generic_menu :se_setprops alpha = (1 - <alpha>)
endscript

script back_to_cameracut_group_menu 
	destroy_all_debug_menus
	create_cameracut_group_menu
endscript

script destroy_cameracut_group_menu 
	generic_ui_destroy
endscript

script create_cameracut_menu 
	if NOT gotparam \{camera_count}
		create_cameracut_group_menu
		return
	endif
	ui_menu_select_sfx
	destroy_cameracut_group_menu
	make_generic_menu {
		vmenu_id = selectcameracut_vmenu
		pos = ($menu_pos - (0.0, 80.0))
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
	if NOT generic_menu :desc_resolvealias \{name = 0x92a24386}
		return
	endif
	generic_menu :se_setprops \{generic_menu_title_alpha = 0
		background_alpha = 0
		skull_alpha = 0
		scrollbar_alpha = 0}
	assignalias id = <resolved_id> alias = current_menu
	getpakmancurrentname \{map = zones}
	formattext checksumname = camera_array '%s_%p' s = <pakname> p = ($cameracutprefixarray [<camera_count>])
	if globalexists name = <camera_array>
		getarraysize $<camera_array>
		array_count = 0
		begin
		formattext textname = camera_name qs(0x3efec28c) s = <pakname> p = ($cameracutprefixarray [<camera_count>]) i = <array_count>
		if structurecontains structure = ($<camera_array> [<array_count>]) name
			formattext textname = camera_name qs(0x73307931) s = ($<camera_array> [<array_count>].name) dontassertforchecksums
		elseif structurecontains structure = ($<camera_array> [<array_count>]) params
			if structurecontains structure = ($<camera_array> [<array_count>].params) name
				formattext textname = camera_name qs(0x73307931) s = ($<camera_array> [<array_count>].params.name) dontassertforchecksums
			endif
		endif
		add_generic_menu_text_item {
			text = <camera_name>
			pad_choose_script = select_cameracut
			pad_choose_params = {camera_array_pakname = <pakname> camera_array = ($cameracutprefixarray [<camera_count>]) array_count = <array_count>}
			pad_square_script = select_cameracut
			pad_square_params = {camera_array_pakname = <pakname> camera_array = ($cameracutprefixarray [<camera_count>]) array_count = <array_count> jumptoviewer}
		}
		<array_count> = (<array_count> + 1)
		repeat <array_size>
	endif
	launchevent \{type = focus
		target = selectcameracut_vmenu}
endscript

script back_to_cameracut_menu 
	destroy_all_debug_menus
	create_cameracut_menu
endscript

script destroy_cameracut_menu 
	generic_ui_destroy
endscript
debug_camera_array = none
debug_camera_array_pakname = none
debug_camera_array_count = 0

script select_cameracut 
	ui_menu_select_sfx
	change debug_camera_array = <camera_array>
	change debug_camera_array_pakname = <camera_array_pakname>
	change debug_camera_array_count = <array_count>
	destroy_cameracuts
	wait \{3
		gameframes}
	create_cameracuts
	if gotparam \{jumptoviewer}
		destroy_all_debug_menus
		unpausegh3
		enable_pause
		change \{viewer_buttons_enabled = 1}
		toggleviewmode
	endif
endscript

script select_cameracut_video 
	ui_menu_select_sfx
	printf qs(0x3e1a078e) n = <name> s = <camera_array_pakname> p = <camera_array> i = <array_count>
	formattext textname = file_name qs(0x7ded7b88) a = <camera_array> i = <array_count>
	if globalexists \{name = capture_file_name}
		change capture_file_name = <file_name>
	endif
	change debug_camera_array = <camera_array>
	change debug_camera_array_pakname = <camera_array_pakname>
	change debug_camera_array_count = <array_count>
	destroy_cameracuts
	hide_band
	wait \{3
		gameframes}
	create_cameracuts
	unpausegh3
	root_window :legacydomorph \{alpha = 0}
	change \{select_cameracut_video_end_enable = 1}
endscript
select_cameracut_video_end_enable = 0
capture_frame_count = 0

script select_cameracut_video_end 
	printf \{qs(0xaa2f1131)}
	root_window :legacydomorph \{alpha = 1}
	if ($capture_frame_count = 0)
		if ($select_cameracut_video_end_enable = 1)
			pausegh3
			change \{select_cameracut_video_end_enable = 0}
			band_unhide
			if globalexists \{name = is_video_capture_session}
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
		pos = ($menu_pos - (0.0, 80.0))
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
	launchevent \{type = focus
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
		pos = ($menu_pos - (0.0, 80.0))
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
	getarraysize <profile_list>
	index = 0
	begin
	characterprofilegetstruct savegame = <savegame> name = (<profile_list> [<index>])
	get_fullname_of_character savegame = <savegame> id = (<profile_list> [<index>])
	add_generic_menu_text_item {
		text = <fullname>
		pad_choose_script = debug_menu_choose_musician
		pad_choose_params = {part = <part> profile_struct = <profile_struct> savegame = <savegame>}
	}
	index = (<index> + 1)
	repeat <array_size>
	launchevent \{type = focus
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
		return true player = <i>
	endif
	i = (<i> + 1)
	repeat 4
	return \{false}
endscript

script debug_menu_choose_musician 
	kill_gem_scroller
	if debug_is_part_in_band part = <part>
		getplayerinfo <player> stored_character_index
		setplayerinfo <player> character_id = (<profile_struct>.name)
		setplayerinfo <player> character_savegame = <savegame>
		globaltag_save_band_member_choice savegame = <savegame> index = <stored_character_index> character_id = (<profile_struct>.name) character_savegame = <savegame>
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
	if ui_event_exists_in_stack \{name = 'gameplay'}
		ui_event \{event = menu_back
			data = {
				state = uistate_gameplay
			}}
	else
		generic_event_choose \{state = uistate_gameplay}
	endif
endscript

script create_hud_ui_menu 
	ui_menu_select_sfx
	destroy_debugging_menu
	make_generic_menu {
		vmenu_id = hud_ui_vmenu
		pos = ($menu_pos - (0.0, 80.0))
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
	change toggle_showmeasures_menuitem = <item_container_id>
	toggle_showmeasures_setprop
	add_generic_menu_text_item \{text = qs(0xdae59d1c)
		pad_choose_script = toggle_showsongstars}
	change toggle_showsongstars_menuitem = <item_container_id>
	toggle_showsongstars_setprop
	add_generic_menu_text_item \{text = qs(0xba249053)
		pad_choose_script = toggle_showsongtime}
	change toggle_showsongtime_menuitem = <item_container_id>
	toggle_showsongtime_setprop
	add_generic_menu_text_item \{text = qs(0x3630af7e)
		pad_choose_script = toggle_showcameraname}
	change toggle_showcameraname_menuitem = <item_container_id>
	toggle_showcameraname_setprop
	add_generic_menu_text_item \{text = qs(0x32db050e)
		pad_choose_script = toggle_inputlog}
	change toggle_inputlog_menuitem = <item_container_id>
	toggle_inputlog_setprop
	add_generic_menu_text_item \{text = qs(0x0979628f)
		pad_choose_script = toggle_rockmeterdebug}
	change toggle_rockmeterdebug_menuitem = <item_container_id>
	toggle_rockmeterdebug_setprop
	add_generic_menu_text_item \{text = qs(0xe280d18b)
		pad_choose_script = toggle_viewvolumesonscreen}
	change toggle_viewvolumesonscreen_menuitem = <item_container_id>
	toggle_viewvolumesonscreen_setprop
	add_generic_menu_text_item \{text = qs(0x9c31fd21)
		pad_choose_script = toggle_prototype_sp}
	change toggle_prototype_sp_menuitem = <item_container_id>
	toggle_prototype_sp_setprop
	add_generic_menu_text_item \{text = qs(0x4f6a8b2d)
		pad_choose_script = toggle_screen_noise}
	change toggle_screen_noise_menuitem = <item_container_id>
	toggle_screen_noise_setprop
	add_generic_menu_text_item \{text = qs(0x58586bd4)
		pad_choose_script = toggle_motion_blur}
	change toggle_motion_blur_menuitem = <item_container_id>
	toggle_motion_blur_setprop
	add_generic_menu_text_item \{text = qs(0xb5c21064)
		pad_choose_script = toggle_ad_overlay}
	change toggle_ad_overlay_menuitem = <item_container_id>
	toggle_ad_overlay_setprop
	if isxenonorwindx
		add_generic_menu_text_item \{text = qs(0x9f7a1c1f)
			pad_choose_script = toggle_ok_for_ad_override}
		change toggle_ok_for_ad_override_menuitem = <item_container_id>
		toggle_ok_for_ad_override_setprop
	endif
	launchevent \{type = focus
		target = hud_ui_vmenu}
endscript

script back_to_hud_ui_menu 
	destroy_all_debug_menus
	create_hud_ui_menu
endscript

script destroy_hud_ui_menu 
	generic_ui_destroy
endscript
hidebytype_list = [
	'crowd'
	'stage'
	'scene_ped'
]
hidebytype_visible = [
	on
	on
	on
]

script create_togglevisibility_menu 
	ui_menu_select_sfx
	destroy_hud_ui_menu
	make_generic_menu {
		vmenu_id = togglevisibility_vmenu
		pos = ($menu_pos - (0.0, 80.0))
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
	change toggle_bandvisible_menuitem = <item_container_id>
	toggle_bandvisible_setprop
	getarraysize \{$hidebytype_list}
	array_count = 0
	array = []
	begin
	formattext checksumname = type_checksum '%s' s = ($hidebytype_list [<array_count>])
	formattext checksumname = menuitem_checksum 'toggle_hidebytype_menuitem_%s' s = ($hidebytype_list [<array_count>])
	add_generic_menu_text_item {
		text = qs(0x00000000)
		pad_choose_script = toggle_hidebytype
		pad_choose_params = {type = <type_checksum> array_count = <array_count>}
	}
	addarrayelement array = <array> element = <item_container_id>
	array_count = (<array_count> + 1)
	repeat <array_size>
	change toggle_hidebytype_menuitem = <array>
	toggle_hidebytype_setprop
	add_generic_menu_text_item \{text = qs(0xc36d1281)
		pad_choose_script = toggle_highway}
	change toggle_highway_menuitem = <item_container_id>
	toggle_highway_setprop
	launchevent \{type = focus
		target = togglevisibility_vmenu}
endscript

script back_to_togglevisibility_menu 
	create_togglevisibility_menu
endscript

script destroy_togglevisibility_menu 
	if screenelementexists \{id = togglevisibility_scrolling_menu}
		destroyscreenelement \{id = togglevisibility_scrolling_menu}
	endif
	destroy_menu_backdrop
endscript

script create_band_setup_menu 
	ui_menu_select_sfx
	destroy_debugging_menu
	make_generic_menu {
		vmenu_id = band_setup_vmenu
		pos = ($menu_pos - (0.0, 80.0))
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
	addarrayelement array = <array> element = <item_container_id>
	array_count = (<array_count> + 1)
	repeat 4
	change toggle_musician_type_menuitem = <array>
	toggle_musician_type_setprop \{no_refresh = 1}
	array_count = 1
	array = []
	begin
	add_generic_menu_text_item {
		text = qs(0xde83c410)
		pad_choose_script = toggle_bot
		pad_choose_params = {player = <array_count>}
	}
	addarrayelement array = <array> element = <item_container_id>
	array_count = (<array_count> + 1)
	repeat 4
	change toggle_bot_menuitem = <array>
	toggle_bot_setprop
	array_count = 1
	array = []
	begin
	add_generic_menu_text_item {
		text = qs(0x7505b54f)
		pad_choose_script = toggle_star
		pad_choose_params = {player = <array_count>}
	}
	addarrayelement array = <array> element = <item_container_id>
	array_count = (<array_count> + 1)
	repeat 4
	change toggle_star_menuitem = <array>
	toggle_star_setprop
	array_count = 1
	array = []
	begin
	add_generic_menu_text_item {
		text = qs(0x8b8a7f63)
		pad_left_script = toggle_hyperspeed_left
		pad_left_params = {player = <array_count>}
		pad_right_script = toggle_hyperspeed_right
		pad_right_params = {player = <array_count>}
	}
	addarrayelement array = <array> element = <item_container_id>
	array_count = (<array_count> + 1)
	repeat 4
	change toggle_hyperspeed_menuitem = <array>
	toggle_hyperspeed_setprop
	launchevent \{type = focus
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
		pos = ($menu_pos - (0.0, 80.0))
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
	change autosave_menuitem = <item_container_id>
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
	add_generic_menu_text_item \{text = qs(0x4e153102)
		pad_choose_script = generic_event_choose
		pad_choose_params = {
			state = uistate_debug_color_histogram
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
	add_generic_menu_text_item \{text = qs(0x9f6d58e8)
		pad_choose_script = 0x9279155a}
	change 0xa14c9d13 = <item_container_id>
	0xbcf49bdc
	launchevent \{type = focus
		target = tools_vmenu}
endscript

script debug_toggle_highway_viewer_visibility 
	change alternate_viewer_hud_behavior = (1 - $alternate_viewer_hud_behavior)
endscript
0xa14c9d13 = null

script 0x9279155a 
	if ($g_include_debug_songs = 0)
		change \{g_include_debug_songs = 1}
	else
		change \{g_include_debug_songs = 0}
	endif
	0xbcf49bdc
endscript

script 0xbcf49bdc 
	if ($g_include_debug_songs = 0)
		($0xa14c9d13) :se_setprops generic_menu_smenu_textitem_text_text = qs(0xed3eb482)
	else
		($0xa14c9d13) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x2ca9debe)
	endif
endscript
autosave_menuitem = 0

script debug_toggle_autosave 
	getglobaltags \{user_options}
	if (<autosave> = 0)
		setglobaltags \{user_options
			params = {
				autosave = 1
			}}
	else
		setglobaltags \{user_options
			params = {
				autosave = 0
			}}
	endif
	toggle_autosave_setprop
endscript

script toggle_autosave_setprop 
	getglobaltags \{user_options}
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
		pos = ($menu_pos - (0.0, 80.0))
		dims = (400.0, 500.0)
		title_pos = ($menu_pos - (0.0, 80.0))
		title_just = [left top]
		pad_back_script = back_to_tools_menu
		z_priority = 100.0
		title = qs(0xc1c448fd)
		scrolling
		use_all_controllers
	}
	startwildcardsearch \{wildcard = 'buffers\\*.rep'}
	index = 0
	begin
	if NOT getwildcardfile
		break
	endif
	add_generic_menu_text_item {
		text = <basename>
		pad_choose_script = play_replay
		pad_choose_params = {replay = <filename> song_name = qs(0xfa9bd01d) difficulty = qs(0xfa9bd01d) difficulty2 = qs(0xfa9bd01d)}
	}
	<index> = (<index> + 1)
	repeat
	endwildcardsearch
	launchevent \{type = focus
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
		pos = ($menu_pos - (0.0, 80.0))
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
	full_size = <array_size>
	getarraysize \{$debug_songlist}
	array_size = (<full_size> + <array_size>)
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
	repeat <array_size>
	add_generic_menu_text_item {
		text = qs(0x2c1db66a)
		additional_focus_script = wait_for_diff_analyzer
		additional_focus_params = {<...>}
		pad_choose_script = create_difficulty_analyzer_instrument_menu
		pad_choose_params = {difficulty = all song_name = debug_output}
	}
	launchevent \{type = focus
		target = song_vmenu}
endscript

script difficulty_analyzer_back 
	killspawnedscript \{name = wait_for_diff_analyzer_spawned}
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
	killspawnedscript \{name = wait_for_diff_analyzer_spawned}
	spawnscriptnow wait_for_diff_analyzer_spawned params = {<...>}
endscript

script wait_for_diff_analyzer_spawned 
	wait \{0.5
		seconds}
	difficulty_analyzer_show instrument = guitar difficulty = all song_name = <song_checksum>
endscript

script create_difficulty_analyzer_instrument_menu 
	ui_menu_select_sfx
	destroy_difficulty_analyzer_menu
	make_generic_menu {
		vmenu_id = instrument_vmenu
		pos = ($menu_pos - (0.0, 80.0))
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
	getarraysize \{$instrument_checksums}
	begin
	instrument = ($instrument_text [<array_entry>])
	add_generic_menu_text_item {
		text = <instrument>
		pad_choose_script = create_difficulty_analyzer_difficulty_menu
		pad_choose_params = {instrument = ($instrument_checksums [<array_entry>]) song_name = <song_name>}
	}
	<array_entry> = (<array_entry> + 1)
	repeat <array_size>
	if (<song_name> = debug_output)
		add_generic_menu_text_item {
			text = qs(0x886518a8)
			pad_choose_script = create_difficulty_analyzer_difficulty_menu
			pad_choose_params = {all instrument = all song_name = <song_name>}
		}
	endif
	launchevent \{type = focus
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
		pos = ($menu_pos - (0.0, 80.0))
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
	getarraysize \{$difficulty_list}
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
	repeat <array_size>
	if (<song_name> = debug_output)
		add_generic_menu_text_item {
			text = qs(0x886518a8)
			pad_choose_script = output_diff_scores
			pad_choose_params = {all instrument = <instrument>}
		}
	endif
	launchevent \{type = focus
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
	reset_score \{player = 1}
	change \{end_credits = 1}
	change \{debug_playcredits_active = 1}
	progression_endcredits
endscript

script debug_quitcredits 
	generic_event_back \{state = uistate_debug}
	band_unload_anim_paks
endscript

script start_4p_vocal_proto 
	change \{game_mode = p4_quickplay}
	setplayerinfo \{player = 1
		bot_play = 0}
	setplayerinfo \{player = 1
		part = vocals}
	setplayerinfo \{player = 2
		bot_play = 0}
	setplayerinfo \{player = 2
		part = vocals}
	setplayerinfo \{player = 3
		bot_play = 0}
	setplayerinfo \{player = 3
		part = vocals}
	setplayerinfo \{player = 4
		bot_play = 0}
	setplayerinfo \{player = 4
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
		pos = ($menu_pos - (0.0, 80.0))
		dims = (400.0, 500.0)
		title_pos = ($menu_pos - (0.0, 80.0))
		title_just = [left top]
		pad_back_script = back_to_in_game_menu
		z_priority = 100.0
		title = qs(0x092c9f43)
		scrolling
		use_all_controllers
	}
	if generic_menu :desc_resolvealias \{name = alias_generic_menu_smenu
			param = smenu}
		setscreenelementlock id = <smenu> on
		setscreenelementlock id = <smenu> off
		<smenu> :scrollingmenu_unsethiddenlocflag
	endif
	array_entry = 0
	getsonglistsize
	full_size = <array_size>
	getarraysize \{$debug_songlist}
	array_size = (<full_size> + <array_size>)
	song_vmenu :settags page = 0 index = 0 array_size = <array_size>
	song_vmenu :se_setprops \{event_handlers = [
			{
				pad_up
				0xa3e37af8
			}
			{
				pad_down
				0x591e27ad
			}
		]}
	song_vmenu :obj_spawnscript \{0x1d954f1c}
endscript

script 0xa3e37af8 
	gettags
	last_page = ((<array_size> / 12) - 1)
	if (<index> = 0)
		if (<page> != 0)
			settags index = 11 page = (<page> - 1)
			obj_spawnscript \{0x1d954f1c}
		else
			settags index = 11 page = <last_page>
			obj_spawnscript \{0x1d954f1c}
		endif
	else
		settags index = (<index> - 1)
	endif
endscript

script 0x591e27ad 
	gettags
	last_page = ((<array_size> / 12) - 1)
	if (<index> = 11)
		if (<page> != <last_page>)
			settags index = 0 page = (<page> + 1)
			obj_spawnscript \{0x1d954f1c}
		endif
	else
		settags index = (<index> + 1)
	endif
endscript

script 0x1d954f1c 
	launchevent \{type = unfocus
		target = song_vmenu}
	se_setprops \{block_events}
	gettags
	destroyscreenelement \{id = song_vmenu
		preserve_parent}
	array_entry = (<page> * 12)
	begin
	if (<array_entry> >= <array_size>)
		break
	endif
	getsonglistchecksum index = <array_entry>
	get_song_struct song = <song_checksum>
	get_song_title song = <song_checksum>
	add_generic_menu_text_item {
		text = <song_title>
		pad_choose_script = create_part_menu
		pad_choose_params = {song_name = <song_checksum> player = 1 from_gameplay = <from_gameplay>}
	}
	<array_entry> = (<array_entry> + 1)
	repeat 12
	se_setprops \{unblock_events}
	launchevent type = focus target = song_vmenu data = {child_index = <index>}
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

script create_difficulty_menu \{player = 1}
	destroy_all_debug_menus
	make_generic_menu {
		vmenu_id = difficulty_vmenu
		pos = ($menu_pos - (0.0, 80.0))
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
	formattext textname = title qs(0x5c5cedaa) p = <player>
	createscreenelement {
		type = textelement
		parent = generic_menu
		pos = (-200.0, 0.0)
		font = fontgrid_text_a1
		text = <title>
	}
	array_entry = 0
	getarraysize \{$difficulty_list}
	num_diffs = <array_size>
	getplayerinfo <player> part
	if (<part> = drum)
		num_diffs = (<array_size> + 1)
	endif
	getnumplayersingame
	begin
	if (<array_entry> = <array_size>)
		difficulty_text = qs(0x7a19b5f7)
		current_difficulty = ($difficulty_list [<array_size> -1])
		double_kick = 1
	else
		difficulty_count = ($difficulty_list [<array_entry>])
		get_difficulty_text difficulty = <difficulty_count>
		current_difficulty = ($difficulty_list [<array_entry>])
		double_kick = 0
	endif
	if (<player> = <num_players>)
		<choose_params> = {callback = create_bot_menu double_kick = <double_kick> player = <player> difficulty = <current_difficulty> callback_params = {song_name = <song_name> player = 1 from_gameplay = <from_gameplay>}}
	else
		<choose_params> = {callback = create_difficulty_menu double_kick = <double_kick> player = <player> difficulty = <current_difficulty> callback_params = {song_name = <song_name> version = <version> player = (<player> + 1) from_gameplay = <from_gameplay>}}
	endif
	add_generic_menu_text_item {
		text = <difficulty_text>
		pad_choose_script = debug_menu_set_double_kick
		pad_choose_params = <choose_params>
	}
	<array_entry> = (<array_entry> + 1)
	repeat <num_diffs>
	if (<player> = 1 && <num_players> = 4)
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
	launchevent \{type = focus
		target = difficulty_vmenu}
endscript

script debug_menu_set_double_kick 
	setplayerinfo <player> difficulty = <difficulty>
	setplayerinfo <player> double_kick_drum = <double_kick>
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
	if screenelementexists \{id = difficulty_menu}
		destroyscreenelement \{id = difficulty_menu}
	endif
	destroy_menu_backdrop
endscript

script create_bot_menu \{player = 1}
	destroy_all_debug_menus
	make_generic_menu {
		vmenu_id = bot_vmenu
		pos = ($menu_pos - (0.0, 80.0))
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
	formattext textname = title qs(0x5c5cedaa) p = <player>
	createscreenelement {
		type = textelement
		parent = generic_menu
		pos = (-200.0, 0.0)
		font = fontgrid_text_a1
		text = <title>
	}
	getnumplayersingame
	if (<player> = <num_players>)
		<choose_params> = {callback = select_start_song double_kick = <double_kick> player = <player> callback_params = {song_name = <song_name> from_gameplay = <from_gameplay>}}
	else
		<choose_params> = {callback = create_bot_menu double_kick = <double_kick> player = <player> callback_params = {song_name = <song_name> version = <version> player = (<player> + 1) from_gameplay = <from_gameplay>}}
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
	launchevent \{type = focus
		target = bot_vmenu}
endscript

script debug_menu_set_bot 
	setplayerinfo <player> bot_play = <bot>
	<callback> <callback_params>
endscript

script destroy_bot_menu 
	if screenelementexists \{id = bot_menu}
		destroyscreenelement \{id = bot_menu}
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
	band = {
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

script create_part_menu \{player = 1}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	getnumplayersingame
	if (<num_players> = 1)
	elseif (<num_players> = 4)
		setplayerinfo 1 part = ($debug_musician1)
		setplayerinfo 2 part = ($debug_musician2)
		setplayerinfo 3 part = ($debug_musician3)
		setplayerinfo 4 part = ($debug_musician4)
		persistent_band_create_band \{refresh = 1}
		create_difficulty_menu {song_name = <song_name> version = <version> player = 1 from_gameplay = <from_gameplay>}
		return
	endif
	destroy_all_debug_menus
	make_generic_menu {
		vmenu_id = part_vmenu
		pos = ($menu_pos - (0.0, 80.0))
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
	formattext textname = title qs(0x5c5cedaa) p = <player>
	createscreenelement {
		type = textelement
		parent = generic_menu
		pos = (-200.0, 0.0)
		font = fontgrid_text_a1
		text = <title>
	}
	array_entry = 0
	getarraysize \{$part_list}
	getnumplayersingame
	begin
	part_count = ($part_list [<array_entry>])
	get_part_text part = <part_count>
	if (<player> = <num_players>)
		add_generic_menu_text_item {
			text = <part_text>
			pad_choose_script = debug_menu_set_part
			pad_choose_params = {callback = create_difficulty_menu player = <player> part = ($part_list [<array_entry>]) callback_params = {song_name = <song_name> version = <version> player = 1 from_gameplay = <from_gameplay>}}
		}
	else
		add_generic_menu_text_item {
			text = <part_text>
			pad_choose_script = debug_menu_set_part
			pad_choose_params = {callback = create_part_menu player = <player> part = ($part_list [<array_entry>]) callback_params = {song_name = <song_name> version = <version> player = (<player> + 1) from_gameplay = <from_gameplay>}}
		}
	endif
	<array_entry> = (<array_entry> + 1)
	repeat <array_size>
	launchevent \{type = focus
		target = part_vmenu}
endscript

script destroy_part_menu 
	generic_ui_destroy
endscript

script debug_menu_set_part 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	setplayerinfo <player> part = <part>
	getnumplayersingame
	if (<num_players> = 1)
		persistent_band_force_traditional_band
	endif
	formattext checksumname = global_name 'debug_musician%a' a = <player>
	change globalname = <global_name> newvalue = <part>
	if checksumequals a = <callback> b = create_difficulty_menu
		persistent_band_create_band \{refresh = 1}
		if screenelementexists \{id = current_menu}
			launchevent \{type = unfocus
				target = current_menu}
			runscriptonscreenelement \{id = current_menu
				pulse_debug_menu}
		endif
		cas_queue_wait
		if screenelementexists \{id = current_menu}
			obj_killspawnedscript \{name = pulse_debug_menu}
			current_menu :se_setprops \{alpha = 1.0}
			launchevent \{type = focus
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
	lockglobaltags \{off}
	lockglobaltags \{freeplay_check_off}
	get_savegame_from_controller \{controller = $primary_controller}
	difficulties = [easy medium hard expert]
	getarraysize <difficulties>
	diff_size = <array_size>
	getsonglistsize
	if (<array_size> > 0)
		i = 0
		begin
		getsonglistchecksum index = <i>
		get_song_saved_in_globaltags song = <song_checksum>
		if (<saved_in_globaltags> = 1)
			setglobaltags savegame = <savegame> <song_checksum> params = {unlocked = 1}
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	getarraysize ($bonus_songs.tier1.songs)
	if (<array_size> > 0)
		i = 0
		begin
		setglobaltags savegame = <savegame> ($bonus_songs.tier1.songs [<i>]) params = {unlocked = 1}
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	i = 0
	getarraysize ($bonus_videos)
	if (<array_size> > 0)
		begin
		video_checksum = ($bonus_videos [<i>].id)
		setglobaltags savegame = <savegame> <video_checksum> params = {unlocked = 1}
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	get_levelzonearray_size
	if (<array_size> > 0)
		index = 0
		begin
		get_levelzonearray_checksum index = <index>
		formattext checksumname = venue_checksum 'venue_%s' s = ($levelzones.<level_checksum>.name)
		if NOT structurecontains structure = ($levelzones.<level_checksum>) debug_only
			setglobaltags savegame = <savegame> <venue_checksum> params = {unlocked = 1} progression = true
		endif
		index = (<index> + 1)
		repeat <array_size>
	endif
	getarraysize \{$progression_gig_list}
	num_zones = <array_size>
	index = 0
	begin
	gig_list = (($progression_gig_list [<index>]).gig_list)
	getarraysize ($<gig_list>)
	num_gigs = <array_size>
	gig_index = 0
	begin
	gig_checksum = ($<gig_list> [<gig_index>])
	setglobaltags savegame = <savegame> <gig_checksum> params = {unlocked = 1} progression = true
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
	if screenelementexists \{id = settings_scrolling_menu}
		destroyscreenelement \{id = settings_scrolling_menu}
	endif
	destroy_menu_backdrop
endscript

script select_playermode 
	setplayerinfo 1 device = <device_num>
	translate_gamemode
	change g_band_lobby_current_level = ($current_level)
	gamemode_gettype
	if (<type> = career)
		gman_startgamemodegoal
		gig = ($0x8896fed6 [0])
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
		create_part_menu song_name = <song_checksum> player = 1 from_gameplay = <from_gameplay>
		break
	endif
	<array_entry> = (<array_entry> + 1)
	repeat <array_size>
endscript
debug_with_rhythm = 0
force_coop = 0

script translate_gamemode 
	getmaxlocalplayers
	player = 1
	begin
	setplayerinfo <player> in_game = 0
	<player> = (<player> + 1)
	repeat <max_players>
	gamemode_getnumplayers
	player = 1
	begin
	setplayerinfo <player> in_game = 1
	<player> = (<player> + 1)
	repeat <num_players>
endscript

script toggle_rolandkit 
	if ($roland_drumkit = 1)
		change \{roland_drumkit = 0}
	else
		change \{roland_drumkit = 1}
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
	if scriptisrunning \{touch_sensor_spawned}
		end_touch_sensor_test
	else
		start_touch_sensor_test
	endif
	toggle_guitar_touch_test_setprop
endscript

script toggle_guitar_touch_test_setprop 
	if scriptisrunning \{touch_sensor_spawned}
		toggle_guitar_touch_test_menuitem :se_setprops \{text = qs(0x9748009f)}
	else
		toggle_guitar_touch_test_menuitem :se_setprops \{text = qs(0x00cae553)}
	endif
endscript

script edit_inputlog_lines_left 
	ui_menu_select_sfx
	kill_debug_elements
	change play_log_lines = ($play_log_lines -1)
	if ($play_log_lines < 1)
		change \{play_log_lines = 1}
	endif
	edit_inputlog_lines_setprop
	init_play_log
endscript

script edit_inputlog_lines_right 
	ui_menu_select_sfx
	kill_debug_elements
	change play_log_lines = ($play_log_lines + 1)
	if ($play_log_lines > 10)
		change \{play_log_lines = 10}
	endif
	edit_inputlog_lines_setprop
	init_play_log
endscript

script toggle_tilt 
	ui_menu_select_sfx
	kill_debug_elements
	if ($show_guitar_tilt = 0)
		change \{show_guitar_tilt = 1}
	else
		change \{show_guitar_tilt = 0}
	endif
	toggle_tilt_setprop
	init_play_log
endscript

script edit_inputlog_lines_setprop 
	formattext textname = text qs(0x45c3b812) l = ($play_log_lines)
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
	getglobaltags \{user_options}
	if (<lefty_flip_p1> = 0)
		setglobaltags \{user_options
			params = {
				lefty_flip_p1 = 1
			}}
	else
		setglobaltags \{user_options
			params = {
				lefty_flip_p1 = 0
			}}
	endif
	getglobaltags \{user_options}
	setplayerinfo <player> lefthanded_gems = <lefty_flip_p1>
	setplayerinfo <player> lefthanded_button_ups = <lefty_flip_p1>
	toggle_leftyflip_setprop
endscript

script toggle_leftyflip_setprop 
	getglobaltags \{user_options}
	if (<lefty_flip_p1> = 0)
		toggle_leftyflip_menuitem :se_setprops \{text = qs(0xc0ad14be)}
	else
		toggle_leftyflip_menuitem :se_setprops \{text = qs(0x0774b6f0)}
	endif
endscript
debug_forcescore = off
debug_forcescore_dir = up

script toggle_rockmeter_prototype_player_max 
	ui_menu_select_sfx
	if (($prototype_blink_when_maxed) = 1)
		change \{prototype_blink_when_maxed = 0}
	else
		change \{prototype_blink_when_maxed = 1}
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
		change \{prototype_center_bars = 0}
	else
		change \{prototype_center_bars = 1}
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
	requireparams \{[
			pakname
		]
		all}
	stringremove text = <pakname> remove = 'songs/' new_string = a
	stringremove text = <a> remove = '_song.pak' new_string = b
	formattext checksumname = c <b>
	printstruct <...>
	return current_song = <c>
endscript

script select_venue 
	ui_menu_select_sfx
	destroy_crowd_models
	wait \{10
		gameframes}
	kill_gem_scroller
	if gotparam \{level}
		change current_level = <level>
	endif
	setpakmancurrentblock \{map = zones
		pak = none
		block_scripts = 1}
	changenodeflag \{ls_3_5_pre
		1}
	changenodeflag \{ls_3_5_post
		0}
	changenodeflag \{ls_encore_pre
		1}
	changenodeflag \{ls_encore_post
		0}
	gman_songtool_getcurrentsong
	if (<current_song> = null)
		if NOT stringequals a = ($song_heap_pakname) b = 'none'
			debug_restore_song_from_pakname pakname = ($song_heap_pakname)
			gman_songtool_setcurrentsong song = <current_song>
		else
			gman_songtool_setcurrentsong song = ($startup_song)
		endif
	endif
	destroypakmanmap \{map = zones}
	create_zone_maps
	load_venue \{block_scripts = 1}
	setup_bg_viewport
	restore_dummy_bg_camera
	disable_bg_viewport_properties
	create_movie_viewport
	if ($current_level = load_z_testlevel_peds)
		spawnscriptnow \{testlevel_debug}
	else
		persistent_band_prepare_for_song async = <async>
		crowd_reset \{player = 1}
	endif
	enable_pause
	if NOT gotparam \{norestart}
		gh3_start_pressed
		getplayerinfo \{1
			difficulty
			out = difficulty1}
		getplayerinfo \{2
			difficulty
			out = difficulty2}
		restart_gem_scroller difficulty = <difficulty1> difficulty2 = <difficulty2> starttime = ($current_starttime) device_num = <device_num>
	else
		toggleviewmode \{viewerreload}
		toggleviewmode \{viewerreload}
	endif
	destroy_changevenue_menu
	getnumplayersingame
	if (<num_players> = 0)
		setplayerinfo \{1
			in_game = 1}
	endif
	guitar_support_init_crowd
	if ui_event_exists_in_stack \{name = 'gameplay'}
		ui_event \{event = menu_back
			data = {
				state = uistate_gameplay
			}}
	else
		generic_event_choose \{state = uistate_gameplay}
	endif
endscript

script testlevel_debug 
	begin
	if controllermake \{circle
			0}
		next_peds
	endif
	if controllermake \{circle
			1}
		next_peds
	endif
	wait \{1
		gameframe}
	repeat
endscript
debug_ped_row = 0

script next_peds 
	kill \{prefix = z_testlevel_peds_row0}
	kill \{prefix = z_testlevel_peds_row1}
	kill \{prefix = z_testlevel_peds_row2}
	kill \{prefix = z_testlevel_peds_row3}
	kill \{prefix = z_testlevel_peds_row4}
	kill \{prefix = z_testlevel_peds_row5}
	kill \{prefix = z_testlevel_peds_row6}
	kill \{prefix = z_testlevel_peds_row7}
	wait \{1
		gameframe}
	begin
	change debug_ped_row = ($debug_ped_row + 1)
	formattext checksumname = row 'Z_TestLevel_Peds_row%r' r = ($debug_ped_row)
	create prefix = <row>
	if isalive prefix = <row>
		break
	else
		change \{debug_ped_row = -1}
	endif
	repeat
endscript

script back_to_changehighway_menu 
	create_changehighway_menu
endscript

script destroy_changehighway_menu 
	if screenelementexists \{id = changehighway_scrolling_menu}
		destroyscreenelement \{id = changehighway_scrolling_menu}
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
	if gotparam \{forceintro}
		change \{current_transition = forceintro}
	endif
	if gotparam \{forcelongintro}
		change \{current_transition = forcelongintro}
	endif
	if gotparam \{song_name}
		gman_songfunc \{func = clear_play_list}
		gman_songtool_setcurrentsong song = <song_name>
	endif
	if gotparam \{starttime}
		change current_starttime = <starttime>
	endif
	change \{song_heap_required = 0}
	i = 1
	begin
	usefourlanehighway player = <i> reset
	i = (<i> + 1)
	repeat 4
	if gotparam \{from_gameplay}
		restart_warning_select_restart \{dont_save_song_data}
	else
		generic_event_choose data = {state = uistate_play_song starttime = <starttime> uselaststarttime = <uselaststarttime>}
	endif
	vocals_distribute_mics
	destroy_all_debug_menus
endscript

script ui_menu_scroll_sfx 
	soundevent \{event = ui_sfx_scroll}
	soundevent \{event = ui_sfx_scroll_add}
endscript

script ui_menu_select_sfx 
	printf \{channel = sfx
		qs(0x1908e25e)}
	soundevent \{event = ui_sfx_select}
endscript

script menu_focus 
	obj_getid
	<id> = <objid>
	printstruct <...>
	setscreenelementprops id = <id> rgba = [210 130 0 250]
endscript

script menu_unfocus 
	obj_getid
	<id> = <objid>
	setscreenelementprops id = <id> rgba = [210 210 210 250]
endscript

script back_to_retail_menu 
	generic_event_back
endscript

script toggle_global 
	printstruct <...>
	if gotparam \{global_toggle}
		if ($<global_toggle> = 1)
			change globalname = <global_toggle> newvalue = 0
		else
			change globalname = <global_toggle> newvalue = 1
		endif
	endif
endscript

script debug_checkcasassets 
	check_cas \{textures
		preset_profiles
		savegames}
endscript

script debug_checkprogression 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	printf \{qs(0xc44c6625)}
	printf \{qs(0xfca909a2)}
	getarraysize \{$gig_progression}
	progression_size = <array_size>
	i = 0
	begin
	progression_struct = ($gig_progression [<i>])
	if structurecontains structure = <progression_struct> gig_to_unlock
		gig = (<progression_struct>.gig_to_unlock)
		venue = none
		songs = []
		if NOT structurecontains structure = ($levelzones) (($<gig>).venue)
			venue = (($<gig>).venue)
			change globalname = <gig> newvalue = {($<gig>) venue = load_z_easterisland}
		endif
		if structurecontains structure = ($<gig>) predefined_playlist
			getarraysize ($<gig>.predefined_playlist)
			j = 0
			current_gig = ($<gig>)
			current_playlist = ($<gig>.predefined_playlist)
			begin
			if NOT structurecontains structure = ($gh_songlist_props) ($<gig>.predefined_playlist [<j>])
				addarrayelement array = <songs> element = ($<gig>.predefined_playlist [<j>])
				songs = <array>
				setarrayelement arrayname = current_playlist index = <j> newvalue = 0xcadbbe3d
			endif
			removeparameter \{array}
			j = (<j> + 1)
			repeat <array_size>
			change globalname = <gig> newvalue = {($<gig>) predefined_playlist = <current_playlist>}
		endif
		getarraysize <songs>
		if ((<venue> != none) || (<array_size> > 0))
			printf qs(0x0bc409e2) a = (<progression_struct>.gig_to_unlock) dontassertforchecksums
			if (<venue> != none)
				printf qs(0x39267541) a = <venue> dontassertforchecksums
			endif
			if (<array_size> > 0)
				j = 0
				begin
				printf qs(0xbbbcc2d8) a = (<songs> [<j>]) dontassertforchecksums
				j = (<j> + 1)
				repeat <array_size>
			endif
		else
			printf qs(0x4982d05c) a = (<progression_struct>.gig_to_unlock) dontassertforchecksums
		endif
	endif
	i = (<i> + 1)
	repeat <progression_size>
	getarraysize \{$progression_gig_list}
	gig_list_size = <array_size>
	i = 0
	gig_list = []
	begin
	if NOT structurecontains structure = ($levelzones) (($progression_gig_list [<i>]).venue)
		addarrayelement array = <gig_list> element = {($progression_gig_list [<i>]) venue = load_z_easterisland}
	else
		addarrayelement array = <gig_list> element = ($progression_gig_list [<i>])
	endif
	gig_list = <array>
	i = (<i> + 1)
	repeat <gig_list_size>
	change progression_gig_list = <gig_list>
	printf \{qs(0xff165ff3)}
	printf \{qs(0xc44c6625)}
endscript

script debug_dumpheaps 
	finaldumpheaps
endscript
toggled_fps_on = 0
framerate_warning = 57.5

script togglefps 
	if screenelementexists \{id = fps_anchor}
		destroyscreenelement \{id = fps_anchor}
	else
		createscreenelement \{type = containerelement
			parent = root_window
			id = fps_anchor
			pos = (30.0, 140.0)
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
		createscreenelement \{local_id = text
			type = textelement
			parent = fps_anchor
			id = fps_text
			pos = (20.0, -15.0)
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
			scale = 0.75
			z_priority = 10000
			tags = {
				hide_from_debugger
			}}
		createscreenelement \{type = spriteelement
			parent = fps_anchor
			pos = (16.0, -34.0)
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
		runscriptonscreenelement \{id = {
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
	formattext textname = fps qs(0xcb9020de) d = ($framerate_value)
	if (($framerate_value) < $framerate_warning)
		change \{fps_display_hold_red = 60}
		rgba = [160 20 20 255]
	elseif ($fps_display_hold_red > 0)
		rgba = [160 20 20 255]
		change fps_display_hold_red = ($fps_display_hold_red - 1)
	else
		rgba = [100 100 100 255]
	endif
	se_setprops text = <fps> rgba = <rgba>
	wait \{1
		gameframe}
	repeat
endscript
medleymode_menuitem = 0

script toggle_medleymode_left 
	switch $game_mode
		case p1_quickplay
		change \{game_mode = practice}
		case p2_quickplay
		change \{game_mode = p1_quickplay}
		case p3_quickplay
		change \{game_mode = p2_quickplay}
		case p4_quickplay
		change \{game_mode = p3_quickplay}
		case gh4_p1_career
		change \{game_mode = p4_quickplay}
		case gh4_p2_career
		change \{game_mode = gh4_p1_career}
		case gh4_p3_career
		change \{game_mode = gh4_p2_career}
		case gh4_p4_career
		change \{game_mode = gh4_p3_career}
		case p2_pro_faceoff
		change \{game_mode = gh4_p4_career}
		case practice
		change \{game_mode = p2_pro_faceoff}
	endswitch
	toggle_medleymode_setprop
endscript

script toggle_medleymode_right 
	switch $game_mode
		case p1_quickplay
		change \{game_mode = p2_quickplay}
		case p2_quickplay
		change \{game_mode = p3_quickplay}
		case p3_quickplay
		change \{game_mode = p4_quickplay}
		case p4_quickplay
		change \{game_mode = gh4_p1_career}
		case gh4_p1_career
		change \{game_mode = gh4_p2_career}
		case gh4_p2_career
		change \{game_mode = gh4_p3_career}
		case gh4_p3_career
		change \{game_mode = gh4_p4_career}
		case gh4_p4_career
		change \{game_mode = p2_pro_faceoff}
		case p2_pro_faceoff
		change \{game_mode = practice}
		case practice
		change \{game_mode = p1_quickplay}
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
		change \{enable_binkingame = 1}
	else
		change \{enable_binkingame = 0}
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
		change \{single_stream_enabled = 1}
	else
		change \{single_stream_enabled = 0}
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
		change \{allow_controller_for_all_instruments = 0}
	else
		change \{allow_controller_for_all_instruments = 1}
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
	extendcrc <gamemode> '_props' out = props
	if (($<props>.type = tutorial) || ($<props>.type = competitive) || ($<props>.type = pro_faceoff))
		return \{false}
	else
		return \{true}
	endif
endscript
playermode_menuitem = 0

script toggle_playermode_left 
	getarraysize \{$gamemode_list}
	<gamemode_count> = <array_size>
	<index> = 0
	<name> = qs(0x03ac90f0)
	begin
	if ($game_mode = ($gamemode_list) [<index>])
		<gamemode> = $game_mode
		extendcrc <gamemode> '_props' out = props
		if is_valid_debug_playermode gamemode = <gamemode>
			<name> = ($<props>.debug_name)
		else
			<name> = qs(0xf8741321)
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
		change game_mode = <gamemode>
		break
	endif
	<new_index> = (<new_index> - 1)
	repeat
	toggle_playermode_setprop
endscript

script toggle_playermode_right 
	getarraysize \{$gamemode_list}
	<gamemode_count> = <array_size>
	<index> = 0
	<name> = qs(0x03ac90f0)
	begin
	if ($game_mode = ($gamemode_list) [<index>])
		<gamemode> = $game_mode
		extendcrc <gamemode> '_props' out = props
		if is_valid_debug_playermode gamemode = <gamemode>
			<name> = ($<props>.debug_name)
		else
			<name> = qs(0xf8741321)
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
		change game_mode = <gamemode>
		break
	endif
	<new_index> = (<new_index> + 1)
	repeat
	toggle_playermode_setprop
endscript

script toggle_playermode_setprop 
	getarraysize \{$gamemode_list}
	<index> = 0
	<name> = qs(0x03ac90f0)
	begin
	if ($game_mode = ($gamemode_list) [<index>])
		<gamemode> = $game_mode
		extendcrc <gamemode> '_props' out = props
		if is_valid_debug_playermode gamemode = <gamemode>
			<name> = ($<props>.debug_name)
		else
			<name> = qs(0xf8741321)
			<index> = 0
		endif
		break
	endif
	<index> = (<index> + 1)
	repeat <array_size>
	formattext textname = text qs(0x43b35b5d) s = <name>
	($playermode_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = <text>
endscript

script select_slomo 
	ui_menu_select_sfx
	speedfactor = ($current_speedfactor * 10.0)
	casttointeger \{speedfactor}
	speedfactor = (<speedfactor> + 1)
	if (<speedfactor> > 10)
		speedfactor = 1
	endif
	if (<speedfactor> < 1)
		speedfactor = 1
	endif
	change current_speedfactor = (<speedfactor> / 10.0)
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
		setplayerinfo <player> check_time_early = ($check_time_early * $current_speedfactor)
		setplayerinfo <player> check_time_late = ($check_time_late * $current_speedfactor)
		getnextplayer player = <player>
		repeat <num_players>
	endif
endscript
select_slomo_menuitem = 0

script select_slomo_setprop 
	formattext \{textname = slomo_text
		qs(0xb6e9c12a)
		s = $current_speedfactor}
	($select_slomo_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = <slomo_text>
endscript

script toggle_lagtestpart1 
	ui_menu_select_sfx
	kill_debug_elements
	if ($lagtestpart1 = 0)
		change \{lagtestpart1 = 1}
		change \{debug_audible_hitnote = 1}
	else
		change \{lagtestpart1 = 0}
		change \{debug_audible_hitnote = 0}
	endif
	toggle_lagtestpart1_setprop
endscript

script toggle_lagtestpart2 
	ui_menu_select_sfx
	kill_debug_elements
	if ($lagtestpart2 = 0)
		change \{lagtestpart2 = 1}
		change \{show_play_log = 1}
	else
		change \{lagtestpart2 = 0}
		change \{show_play_log = 0}
	endif
	toggle_lagtestpart2_setprop
endscript

script toggle_lagtestpart3 
	ui_menu_select_sfx
	kill_debug_elements
	if ($lagtestpart3 = 0)
		change \{lagtestpart3 = 1}
		change \{debug_audible_open = 1}
	else
		change \{lagtestpart3 = 0}
		change \{debug_audible_open = 0}
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
	getplatform
	switch <platform>
		case ps2
		ps2_props = ($default_lag_settings.ps2)
		ps2_props = {<ps2_props> input_lag_ms = (<ps2_props>.input_lag_ms - 1)}
		change default_lag_settings = {($default_lag_settings) ps2 = <ps2_props>}
		case ps3
		ps3_props = ($default_lag_settings.ps3)
		ps3_props = {<ps3_props> input_lag_ms = (<ps3_props>.input_lag_ms - 1)}
		change default_lag_settings = {($default_lag_settings) ps3 = <ps3_props>}
		case windx
		case xenon
		xenon_props = ($default_lag_settings.xenon)
		xenon_props = {<xenon_props> input_lag_ms = (<xenon_props>.input_lag_ms - 1)}
		change default_lag_settings = {($default_lag_settings) xenon = <xenon_props>}
		case wii
		wii_props = ($default_lag_settings.wii)
		wii_props = {<wii_props> input_lag_ms = (<wii_props>.input_lag_ms - 1)}
		change default_lag_settings = {($default_lag_settings) wii = <wii_props>}
		default
		printf \{channel = sfx
			qs(0xbb3931d5)}
	endswitch
	edit_inputlagvalue_setprop
endscript

script edit_inputlagvalue_right 
	ui_menu_select_sfx
	kill_debug_elements
	getplatform
	switch <platform>
		case ps2
		ps2_props = ($default_lag_settings.ps2)
		ps2_props = {<ps2_props> input_lag_ms = (<ps2_props>.input_lag_ms + 1)}
		change default_lag_settings = {($default_lag_settings) ps2 = <ps2_props>}
		case ps3
		ps3_props = ($default_lag_settings.ps3)
		ps3_props = {<ps3_props> input_lag_ms = (<ps3_props>.input_lag_ms + 1)}
		change default_lag_settings = {($default_lag_settings) ps3 = <ps3_props>}
		case windx
		case xenon
		xenon_props = ($default_lag_settings.xenon)
		xenon_props = {<xenon_props> input_lag_ms = (<xenon_props>.input_lag_ms + 1)}
		change default_lag_settings = {($default_lag_settings) xenon = <xenon_props>}
		case wii
		wii_props = ($default_lag_settings.wii)
		wii_props = {<wii_props> input_lag_ms = (<wii_props>.input_lag_ms + 1)}
		change default_lag_settings = {($default_lag_settings) wii = <wii_props>}
		default
		printf \{channel = sfx
			qs(0xbb3931d5)}
	endswitch
	edit_inputlagvalue_setprop
endscript

script edit_gemlagvalue_left 
	ui_menu_select_sfx
	kill_debug_elements
	getplatform
	switch <platform>
		case ps2
		ps2_props = ($default_lag_settings.ps2)
		ps2_props = {<ps2_props> gem_lag_ms = (<ps2_props>.gem_lag_ms - 1)}
		change default_lag_settings = {($default_lag_settings) ps2 = <ps2_props>}
		case ps3
		ps3_props = ($default_lag_settings.ps3)
		ps3_props = {<ps3_props> gem_lag_ms = (<ps3_props>.gem_lag_ms - 1)}
		change default_lag_settings = {($default_lag_settings) ps3 = <ps3_props>}
		case windx
		case xenon
		xenon_props = ($default_lag_settings.xenon)
		xenon_props = {<xenon_props> gem_lag_ms = (<xenon_props>.gem_lag_ms - 1)}
		change default_lag_settings = {($default_lag_settings) xenon = <xenon_props>}
		case wii
		wii_props = ($default_lag_settings.wii)
		wii_props = {<wii_props> gem_lag_ms = (<wii_props>.gem_lag_ms - 1)}
		change default_lag_settings = {($default_lag_settings) wii = <wii_props>}
		default
		printf \{channel = sfx
			qs(0xbb3931d5)}
	endswitch
	edit_gemlagvalue_setprop
endscript

script edit_gemlagvalue_right 
	ui_menu_select_sfx
	kill_debug_elements
	getplatform
	switch <platform>
		case ps2
		ps2_props = ($default_lag_settings.ps2)
		ps2_props = {<ps2_props> gem_lag_ms = (<ps2_props>.gem_lag_ms + 1)}
		change default_lag_settings = {($default_lag_settings) ps2 = <ps2_props>}
		case ps3
		ps3_props = ($default_lag_settings.ps3)
		ps3_props = {<ps3_props> gem_lag_ms = (<ps3_props>.gem_lag_ms + 1)}
		change default_lag_settings = {($default_lag_settings) ps3 = <ps3_props>}
		case windx
		case xenon
		xenon_props = ($default_lag_settings.xenon)
		xenon_props = {<xenon_props> gem_lag_ms = (<xenon_props>.gem_lag_ms + 1)}
		change default_lag_settings = {($default_lag_settings) xenon = <xenon_props>}
		case wii
		wii_props = ($default_lag_settings.wii)
		wii_props = {<wii_props> gem_lag_ms = (<wii_props>.gem_lag_ms + 1)}
		change default_lag_settings = {($default_lag_settings) wii = <wii_props>}
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
	getplatform
	switch <platform>
		case ps2
		ps2_props = ($default_lag_settings.ps2)
		ps2_props = {<ps2_props> audio_lag_ms = (<ps2_props>.audio_lag_ms - 1)}
		change default_lag_settings = {($default_lag_settings) ps2 = <ps2_props>}
		case ps3
		ps3_props = ($default_lag_settings.ps3)
		ps3_props = {<ps3_props> audio_lag_ms = (<ps3_props>.audio_lag_ms - 1)}
		change default_lag_settings = {($default_lag_settings) ps3 = <ps3_props>}
		case windx
		case xenon
		xenon_props = ($default_lag_settings.xenon)
		xenon_props = {<xenon_props> audio_lag_ms = (<xenon_props>.audio_lag_ms - 1)}
		change default_lag_settings = {($default_lag_settings) xenon = <xenon_props>}
		case wii
		wii_props = ($default_lag_settings.wii)
		wii_props = {<wii_props> audio_lag_ms = (<wii_props>.audio_lag_ms - 1)}
		change default_lag_settings = {($default_lag_settings) wii = <wii_props>}
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
	getplatform
	switch <platform>
		case ps2
		ps2_props = ($default_lag_settings.ps2)
		ps2_props = {<ps2_props> audio_lag_ms = (<ps2_props>.audio_lag_ms + 1)}
		change default_lag_settings = {($default_lag_settings) ps2 = <ps2_props>}
		case ps3
		ps3_props = ($default_lag_settings.ps3)
		ps3_props = {<ps3_props> audio_lag_ms = (<ps3_props>.audio_lag_ms + 1)}
		change default_lag_settings = {($default_lag_settings) ps3 = <ps3_props>}
		case windx
		case xenon
		xenon_props = ($default_lag_settings.xenon)
		xenon_props = {<xenon_props> audio_lag_ms = (<xenon_props>.audio_lag_ms + 1)}
		change default_lag_settings = {($default_lag_settings) xenon = <xenon_props>}
		case wii
		wii_props = ($default_lag_settings.wii)
		wii_props = {<wii_props> audio_lag_ms = (<wii_props>.audio_lag_ms + 1)}
		change default_lag_settings = {($default_lag_settings) wii = <wii_props>}
		default
		printf \{channel = sfx
			qs(0xbb3931d5)}
	endswitch
	edit_audiolagvalue_setprop
endscript
edit_inputlagvalue_menuitem = 0

script edit_inputlagvalue_setprop 
	getplatform
	switch <platform>
		case ps2
		formattext textname = text qs(0x519b5d83) l = ($default_lag_settings.ps2.input_lag_ms)
		($edit_inputlagvalue_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = <text>
		case ps3
		formattext textname = text qs(0x503ef435) l = ($default_lag_settings.ps3.input_lag_ms)
		($edit_inputlagvalue_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = <text>
		case windx
		formattext textname = text qs(0xf77e6f13) l = ($default_lag_settings.xenon.input_lag_ms)
		($edit_inputlagvalue_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = <text>
		case xenon
		formattext textname = text qs(0x6bb70bb2) l = ($default_lag_settings.xenon.input_lag_ms)
		($edit_inputlagvalue_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = <text>
		case wii
		formattext textname = text qs(0xd3aec0f4) l = ($default_lag_settings.wii.input_lag_ms)
		($edit_inputlagvalue_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = <text>
		default
		printf \{channel = sfx
			qs(0xbb3931d5)}
	endswitch
endscript
edit_gemlagvalue_menuitem = 0

script edit_gemlagvalue_setprop 
	getplatform
	switch <platform>
		case ps2
		formattext textname = text qs(0x97202262) l = ($default_lag_settings.ps2.gem_lag_ms)
		($edit_gemlagvalue_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = <text>
		case ps3
		formattext textname = text qs(0x1aa8df80) l = ($default_lag_settings.ps3.gem_lag_ms)
		($edit_gemlagvalue_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = <text>
		case windx
		formattext textname = text qs(0x0709b958) l = ($default_lag_settings.xenon.gem_lag_ms)
		($edit_gemlagvalue_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = <text>
		case xenon
		formattext textname = text qs(0x353caad1) l = ($default_lag_settings.xenon.gem_lag_ms)
		($edit_gemlagvalue_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = <text>
		case wii
		formattext textname = text qs(0x8bdedff2) l = ($default_lag_settings.wii.gem_lag_ms)
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
	getplatform
	switch <platform>
		case ps2
		formattext textname = text qs(0xf30d4cd4) l = ($default_lag_settings.ps2.audio_lag_ms)
		($edit_audiolagvalue_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = <text>
		case ps3
		formattext textname = text qs(0x5234c83a) l = ($default_lag_settings.ps3.audio_lag_ms)
		($edit_audiolagvalue_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = <text>
		case windx
		formattext textname = text qs(0x29940faf) l = ($default_lag_settings.xenon.audio_lag_ms)
		($edit_audiolagvalue_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = <text>
		case xenon
		formattext textname = text qs(0xcd437801) l = ($default_lag_settings.xenon.audio_lag_ms)
		($edit_audiolagvalue_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = <text>
		case wii
		formattext textname = text qs(0x6d6fdd8f) l = ($default_lag_settings.wii.audio_lag_ms)
		($edit_audiolagvalue_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = <text>
		default
		printf \{channel = sfx
			qs(0xbb3931d5)}
	endswitch
endscript

script toggle_forcescore 
	ui_menu_select_sfx
	switch $debug_forcescore
		case off
		change \{debug_forcescore = poor}
		case poor
		change \{debug_forcescore = medium}
		case medium
		change \{debug_forcescore = good}
		case good
		change \{debug_forcescore = off}
		default
		change \{debug_forcescore = off}
	endswitch
	crowdincrease \{player = 1}
	toggle_forcescore_setprop
endscript
toggle_forcescore_menuitem = 0

script toggle_forcescore_setprop 
	switch $debug_forcescore
		case off
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
		change \{vocal_enable_freeform_always = 0}
	else
		change \{vocal_enable_freeform_always = 1}
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
		printf \{channel = band
			qs(0x9be9bbab)}
		change \{game_mode = gh4_p1_career}
		select_start_song uselaststarttime from_gameplay = <from_gameplay>
		return
	endif
	c = ($gig_celeb_intros [$selected_intro])
	song_name = (($<c>).predefined_playlist [0])
	venue = (($<c>).venue)
	change \{current_transition = celebintro}
	gman_songtool_setcurrentsong song = <song_name>
	change current_level = <venue>
	change \{current_starttime = 0}
	select_venue level = <venue>
endscript
selected_intro = 0

script toggle_intro_select_left 
	change selected_intro = ($selected_intro - 1)
	if ($selected_intro < 0)
		getarraysize \{$gig_celeb_intros}
		change selected_intro = (<array_size> - 1)
	endif
	toggle_intro_select_setprop
endscript

script toggle_intro_select_right 
	change selected_intro = ($selected_intro + 1)
	getarraysize \{$gig_celeb_intros}
	if ($selected_intro >= <array_size>)
		change \{selected_intro = 0}
	endif
	toggle_intro_select_setprop
endscript
toggle_intro_select_menuitem = 0

script toggle_intro_select_setprop 
	if ($selected_intro = -1)
		($toggle_intro_select_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x04a9d108)
		return
	endif
	c = ($gig_celeb_intros [$selected_intro])
	intro_name = (($<c>).name)
	printf qs(0xe73b5f8d) a = <intro_name> b = $selected_intro
	formattext textname = select_string qs(0xf2a04fcf) a = <intro_name>
	($toggle_intro_select_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = <select_string>
endscript
bandvisible = on

script toggle_bandvisible 
	ui_menu_select_sfx
	if ($bandvisible = off)
		change \{bandvisible = on}
	else
		change \{bandvisible = off}
	endif
	set_bandvisible
	toggle_bandvisible_setprop
endscript

script set_bandvisible 
	if ($bandvisible = off)
		hide_band
	else
		unhide_band
	endif
endscript
toggle_bandvisible_menuitem = 0

script toggle_bandvisible_setprop 
	if ($bandvisible = off)
		($toggle_bandvisible_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x7fd280d2)
	else
		($toggle_bandvisible_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0xf815c959)
	endif
endscript

script toggle_hidebytype 
	ui_menu_select_sfx
	if (($hidebytype_visible [<array_count>]) = off)
		setarrayelement arrayname = hidebytype_visible globalarray index = <array_count> newvalue = on
	else
		setarrayelement arrayname = hidebytype_visible globalarray index = <array_count> newvalue = off
	endif
	set_hidebytype
	toggle_hidebytype_setprop
endscript

script set_hidebytype 
	getarraysize \{$hidebytype_list}
	array_count = 0
	begin
	formattext checksumname = type_checksum '%s' s = ($hidebytype_list [<array_count>])
	if (($hidebytype_visible [<array_count>]) = off)
		hideobjectbytype type = <type_checksum>
	else
		hideobjectbytype type = <type_checksum> unhide
	endif
	array_count = (<array_count> + 1)
	repeat <array_size>
endscript
toggle_hidebytype_menuitem = [
]

script toggle_hidebytype_setprop 
	getarraysize \{$hidebytype_list}
	array_count = 0
	begin
	if (($hidebytype_visible [<array_count>]) = off)
		formattext textname = menutext qs(0x15ab9942) s = ($hidebytype_list [<array_count>])
	else
		formattext textname = menutext qs(0xcd575e2a) s = ($hidebytype_list [<array_count>])
	endif
	formattext checksumname = menuitem_checksum 'toggle_hidebytype_menuitem_%s' s = ($hidebytype_list [<array_count>])
	($toggle_hidebytype_menuitem [<array_count>]) :se_setprops generic_menu_smenu_textitem_text_text = <menutext>
	array_count = (<array_count> + 1)
	repeat <array_size>
endscript
highwayvisible = on

script toggle_highway 
	ui_menu_select_sfx
	if ($highwayvisible = off)
		if screenelementexists \{id = gem_containerp1}
			legacydoscreenelementmorph \{id = gem_containerp1
				alpha = 1}
		endif
		if screenelementexists \{id = gem_containerp2}
			legacydoscreenelementmorph \{id = gem_containerp2
				alpha = 1}
		endif
		if screenelementexists \{id = gem_containerp3}
			legacydoscreenelementmorph \{id = gem_containerp3
				alpha = 1}
		endif
		if screenelementexists \{id = gem_containerp4}
			legacydoscreenelementmorph \{id = gem_containerp4
				alpha = 1}
		endif
		if screenelementexists \{id = highway_containerp1}
			legacydoscreenelementmorph \{id = highway_containerp1
				alpha = 1}
		endif
		if screenelementexists \{id = highway_containerp2}
			legacydoscreenelementmorph \{id = highway_containerp2
				alpha = 1}
		endif
		if screenelementexists \{id = highway_containerp3}
			legacydoscreenelementmorph \{id = highway_containerp3
				alpha = 1}
		endif
		if screenelementexists \{id = highway_containerp4}
			legacydoscreenelementmorph \{id = highway_containerp4
				alpha = 1}
		endif
		if screenelementexists \{id = vocals_highway_p1}
			legacydoscreenelementmorph \{id = vocals_highway_p1
				alpha = 1}
		endif
		if screenelementexists \{id = vocals_highway_p2}
			legacydoscreenelementmorph \{id = vocals_highway_p2
				alpha = 1}
		endif
		enable_highway_prepass
		change \{highwayvisible = on}
		show_hud
	else
		if screenelementexists \{id = gem_containerp1}
			legacydoscreenelementmorph \{id = gem_containerp1
				alpha = 0}
		endif
		if screenelementexists \{id = gem_containerp2}
			legacydoscreenelementmorph \{id = gem_containerp2
				alpha = 0}
		endif
		if screenelementexists \{id = gem_containerp3}
			legacydoscreenelementmorph \{id = gem_containerp3
				alpha = 0}
		endif
		if screenelementexists \{id = gem_containerp4}
			legacydoscreenelementmorph \{id = gem_containerp4
				alpha = 0}
		endif
		if screenelementexists \{id = highway_containerp1}
			legacydoscreenelementmorph \{id = highway_containerp1
				alpha = 0}
		endif
		if screenelementexists \{id = highway_containerp2}
			legacydoscreenelementmorph \{id = highway_containerp2
				alpha = 0}
		endif
		if screenelementexists \{id = highway_containerp3}
			legacydoscreenelementmorph \{id = highway_containerp3
				alpha = 0}
		endif
		if screenelementexists \{id = highway_containerp4}
			legacydoscreenelementmorph \{id = highway_containerp4
				alpha = 0}
		endif
		if screenelementexists \{id = vocals_highway_p1}
			legacydoscreenelementmorph \{id = vocals_highway_p1
				alpha = 0}
		endif
		if screenelementexists \{id = vocals_highway_p2}
			legacydoscreenelementmorph \{id = vocals_highway_p2
				alpha = 0}
		endif
		disable_highway_prepass
		change \{highwayvisible = off}
		hide_hud
	endif
	toggle_highway_setprop
endscript
toggle_highway_menuitem = 0

script toggle_highway_setprop 
	if ($highwayvisible = off)
		($toggle_highway_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x6f059162)
	else
		($toggle_highway_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0xfe956dd3)
	endif
endscript
debug_friends_lb_box = 0

script toggle_friends_lb_hud 
	if ($debug_friends_lb_box = 0)
		change \{debug_friends_lb_box = 1}
	else
		change \{debug_friends_lb_box = 0}
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
debug_showmeasures = off

script toggle_showmeasures 
	ui_menu_select_sfx
	if screenelementexists \{id = debug_measures_text}
		destroyscreenelement \{id = debug_measures_text}
	endif
	if ($debug_showmeasures = off)
		change \{debug_showmeasures = on}
		createscreenelement \{type = textelement
			parent = root_window
			id = debug_measures_text
			font = debug
			text = qs(0xaa4c0def)
			scale = 1
			pos = (850.0, 250.0)
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
			shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [
				0
				0
				0
				255
			]
			z_priority = 1000
			hide}
		if ($playing_song = 1)
			debug_measures_text :se_setprops \{unhide}
		endif
	else
		change \{debug_showmeasures = off}
	endif
	if NOT gotparam \{for_autolaunch}
		toggle_showmeasures_setprop
	endif
endscript
toggle_showmeasures_menuitem = 0

script toggle_showmeasures_setprop 
	if ($debug_showmeasures = off)
		($toggle_showmeasures_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0xd58e405f)
	else
		($toggle_showmeasures_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0xc703846c)
	endif
endscript
debug_showsongstars = off

script toggle_showsongstars 
	ui_menu_select_sfx
	if screenelementexists \{id = debug_songstars_text}
		destroyscreenelement \{id = debug_songstars_text}
	endif
	if ($debug_showsongstars = off)
		change \{debug_showsongstars = on}
		createscreenelement \{type = textelement
			parent = root_window
			id = debug_songstars_text
			font = debug
			text = qs(0xfbf320c8)
			scale = 1
			pos = (850.0, 300.0)
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
			shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [
				0
				0
				0
				255
			]
			z_priority = 1000
			hide}
		if ($playing_song = 1)
			debug_songstars_text :se_setprops \{unhide}
		endif
	else
		change \{debug_showsongstars = off}
	endif
	if NOT gotparam \{for_autolaunch}
		toggle_showsongstars_setprop
	endif
endscript
toggle_showsongstars_menuitem = 0

script toggle_showsongstars_setprop 
	if ($debug_showsongstars = off)
		($toggle_showsongstars_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x90241ad7)
	else
		($toggle_showsongstars_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0xab5d35ae)
	endif
endscript
debug_showsongtime = off

script toggle_showsongtime 
	ui_menu_select_sfx
	if screenelementexists \{id = debug_songtime_text}
		destroyscreenelement \{id = debug_songtime_text}
	endif
	if ($debug_showsongtime = off)
		change \{debug_showsongtime = on}
		createscreenelement \{type = textelement
			parent = root_window
			id = debug_songtime_text
			font = debug
			text = qs(0xecafd78a)
			scale = 1
			pos = (850.0, 200.0)
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
			shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [
				0
				0
				0
				255
			]
			z_priority = 100
			hide}
		if ($playing_song = 1)
			debug_songtime_text :se_setprops \{unhide}
		endif
	else
		change \{debug_showsongtime = off}
	endif
	if NOT gotparam \{for_autolaunch}
		toggle_showsongtime_setprop
	endif
endscript
toggle_showsongtime_menuitem = 0

script toggle_showsongtime_setprop 
	if ($debug_showsongtime = off)
		($toggle_showsongtime_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x3360aae1)
	else
		($toggle_showsongtime_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x79b13e73)
	endif
endscript
debug_showsongname = off

script toggle_showsongname 
	ui_menu_select_sfx
	if screenelementexists \{id = debug_songname_text}
		destroyscreenelement \{id = debug_songname_text}
	endif
	if ($debug_showsongname = off)
		change \{debug_showsongname = on}
		createscreenelement \{type = textelement
			parent = root_window
			id = debug_songname_text
			font = debug
			text = qs(0x13e67977)
			scale = 1
			pos = (850.0, 150.0)
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
			shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [
				0
				0
				0
				255
			]
			z_priority = 100
			hide}
		if ($playing_song = 1)
			debug_songname_text :se_setprops \{unhide}
		endif
	else
		change \{debug_showsongname = off}
	endif
	if NOT gotparam \{for_autolaunch}
		toggle_showsongname_setprop
	endif
endscript
toggle_showsongname_menuitem = 0

script toggle_showsongname_setprop 
	if ($debug_showsongname = off)
		($toggle_showsongname_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x3360aae1)
	else
		($toggle_showsongname_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0x79b13e73)
	endif
endscript
debug_showcameraname = off

script toggle_showcameraname 
	ui_menu_select_sfx
	if screenelementexists \{id = debug_camera_name_text}
		destroyscreenelement \{id = debug_camera_name_text}
	endif
	if screenelementexists \{id = debug_camera_name_text2}
		destroyscreenelement \{id = debug_camera_name_text2}
	endif
	if ($debug_showcameraname = off)
		change \{debug_showcameraname = on}
	else
		change \{debug_showcameraname = off}
	endif
	toggle_showcameraname_setprop
	cameracuts_updatedebugcameraname
endscript
toggle_showcameraname_menuitem = 0

script toggle_showcameraname_setprop 
	if ($debug_showcameraname = off)
		($toggle_showcameraname_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0xcf0c92d5)
	else
		($toggle_showcameraname_menuitem) :se_setprops generic_menu_smenu_textitem_text_text = qs(0xa9b88151)
	endif
endscript

script toggle_inputlog 
	ui_menu_select_sfx
	kill_debug_elements
	if ($show_play_log = 0)
		change \{show_play_log = 1}
	else
		change \{show_play_log = 0}
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
		change \{rock_meter_debug = 1}
	else
		change \{rock_meter_debug = 0}
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
		change \{viewvolumesonscreen = 1}
		change \{debug_song_volume_info = 1}
	else
		change \{viewvolumesonscreen = 0}
		change \{debug_song_volume_info = 0}
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
		change \{use_star_power_prototype = 0}
	else
		change \{use_star_power_prototype = 1}
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
		change \{use_motion_blur = 0}
	else
		change \{use_motion_blur = 1}
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
		change \{use_ad_overlay = 0}
	else
		change \{use_ad_overlay = 1}
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
		change \{use_ok_for_ad_override = 0}
	else
		change \{use_ok_for_ad_override = 1}
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
		change \{use_screen_noise = 0}
	else
		change \{use_screen_noise = 1}
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
	formattext checksumname = global_name 'debug_musician%a' a = <musician>
	switch ($<global_name>)
		case none
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
	change globalname = <global_name> newvalue = <new_type>
	toggle_musician_type_setprop
endscript

script cycle_musician_type_right 
	formattext checksumname = global_name 'debug_musician%a' a = <musician> addtostringlookup = true
	switch ($<global_name>)
		case none
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
	change globalname = <global_name> newvalue = <new_type>
	toggle_musician_type_setprop
endscript
toggle_musician_type_menuitem = [
]

script toggle_musician_type_setprop 
	array_count = 1
	begin
	formattext checksumname = global_name 'debug_musician%a' a = <array_count> addtostringlookup = true
	switch ($<global_name>)
		case none
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
	formattext textname = menutext qs(0xb7fb7aac) a = <array_count> b = <type_string>
	($toggle_musician_type_menuitem [(<array_count> - 1)]) :se_setprops generic_menu_smenu_textitem_text_text = <menutext>
	if NOT gotparam \{no_refresh}
		setplayerinfo <array_count> part = ($<global_name>)
		persistent_band_create_band \{refresh = 1}
	endif
	array_count = (<array_count> + 1)
	repeat 4
endscript

script toggle_bot \{player = 1}
	ui_menu_select_sfx
	kill_debug_elements
	getplayerinfo <player> bot_play
	setplayerinfo <player> bot_play = (1 - <bot_play>)
	toggle_bot_setprop
endscript
toggle_bot_menuitem = [
]

script toggle_bot_setprop 
	array_count = 1
	begin
	if playerinfoequals <array_count> bot_play = 0
		formattext textname = menutext qs(0x4ced8e4f) d = <array_count>
	else
		formattext textname = menutext qs(0xe889757d) d = <array_count>
	endif
	($toggle_bot_menuitem [(<array_count> - 1)]) :se_setprops generic_menu_smenu_textitem_text_text = <menutext>
	array_count = (<array_count> + 1)
	repeat 4
endscript

script toggle_star \{player = 1}
	ui_menu_select_sfx
	kill_debug_elements
	getplayerinfo <player> star_power_debug_mode
	<new_value> = (<star_power_debug_mode> + 1)
	if (<new_value> > 3)
		<new_value> = 0
	endif
	if (<new_value> < 0)
		<new_value> = 3
	endif
	setplayerinfo <player> star_power_debug_mode = <new_value>
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
		formattext textname = menutext qs(0x77b03841) d = <array_count>
		case 1
		formattext textname = menutext qs(0x319bbd50) d = <array_count>
		case 2
		formattext textname = menutext qs(0x61b3e268) d = <array_count>
		case 3
		formattext textname = menutext qs(0x6b7bdf66) d = <array_count>
		default
		formattext textname = menutext qs(0xa1ee93b5) d = <array_count>
	endswitch
	($toggle_star_menuitem [(<array_count> - 1)]) :se_setprops generic_menu_smenu_textitem_text_text = <menutext>
	array_count = (<array_count> + 1)
	repeat 4
endscript

script toggle_hyperspeed_left 
	ui_menu_select_sfx
	kill_debug_elements
	getplayerinfo <player> hyperspeed
	<new_value> = (<hyperspeed> - 0.01)
	if (<new_value> > $hyperspeed_slowest)
		<new_value> = $hyperspeed_slowest
	endif
	if (<new_value> < $hyperspeed_fastest)
		<new_value> = $hyperspeed_fastest
	endif
	setplayerinfo <player> hyperspeed = <new_value>
	toggle_hyperspeed_setprop
endscript

script toggle_hyperspeed_right 
	ui_menu_select_sfx
	kill_debug_elements
	getplayerinfo <player> hyperspeed
	<new_value> = (<hyperspeed> + 0.01)
	if (<new_value> > $hyperspeed_slowest)
		<new_value> = $hyperspeed_slowest
	endif
	if (<new_value> < $hyperspeed_fastest)
		<new_value> = $hyperspeed_fastest
	endif
	setplayerinfo <player> hyperspeed = <new_value>
	toggle_hyperspeed_setprop
endscript
toggle_hyperspeed_menuitem = [
]

script toggle_hyperspeed_setprop 
	array_count = 1
	begin
	getplayerinfo <array_count> hyperspeed
	formattext textname = menutext qs(0x81671d3d) p = <array_count> d = <hyperspeed>
	($toggle_hyperspeed_menuitem [(<array_count> - 1)]) :se_setprops generic_menu_smenu_textitem_text_text = <menutext>
	array_count = (<array_count> + 1)
	repeat 4
endscript

script go_to_rockout_from_debug 
	destroy_tools_menu
	generic_event_choose \{state = uistate_rockout}
endscript

script debug_choose_whiteboard_mode 
	change \{game_mode = whiteboard_team}
	init_whiteboard_table
	generic_event_replace \{state = uistate_whiteboard_mode}
endscript

script test_velocity_strum 
	if screenelementexists \{id = test_velocity_strum_cont}
		killspawnedscript \{name = test_velocity_strum_update}
		destroyscreenelement \{id = test_velocity_strum_cont}
	else
		createscreenelement \{type = containerelement
			parent = root_window
			id = test_velocity_strum_cont
			pos = (100.0, 300.0)}
		createscreenelement \{type = textelement
			parent = test_velocity_strum_cont
			pos = (0.0, 0.0)
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
			scale = 0.5}
		createscreenelement \{type = textelement
			parent = test_velocity_strum_cont
			id = test_velocity_strum_num_text
			pos = (0.0, 50.0)
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
		createscreenelement \{type = textelement
			parent = test_velocity_strum_cont
			pos = (0.0, 100.0)
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
			scale = 0.5}
		createscreenelement \{type = textelement
			parent = test_velocity_strum_cont
			id = test_velocity_strum_average_text
			pos = (0.0, 150.0)
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
		spawnscriptnow \{test_velocity_strum_update}
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
	guitargetanalogueinfo controller = ($primary_controller)
	formattext textname = velocity_text qs(0x73307931) s = <righttrigger>
	if controllermake \{up}
		strum = 1
	endif
	if controllermake \{down}
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
				formattext textname = average_text qs(0x73307931) s = <average>
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
	wait \{1
		gameframe}
	repeat
endscript
