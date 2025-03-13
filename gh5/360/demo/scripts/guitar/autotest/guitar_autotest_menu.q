autotest_part_strings = {
	none = qs(0x3f1bbbb1)
	guitar = qs(0x826ca62c)
	bass = qs(0xec55f51b)
	vocals = qs(0x0cf770e2)
	drum = qs(0xf9468e57)
}
autotest_difficulty_strings = {
	beginner = qs(0x66a003c6)
	easy = qs(0x1c7f1488)
	medium = qs(0x79990567)
	hard = qs(0xc0aa0a20)
	expert = qs(0x242117ca)
}
autotest_game_mode_names = {
	gh4_p1_career = qs(0x54549c0f)
	gh4_p2_career = qs(0x7d9c28fd)
	gh4_p3_career = qs(0xd3f4b96c)
	gh4_p4_career = qs(0x2e0d4119)
	p1_quickplay = qs(0xf8741321)
	p2_quickplay = qs(0xc10cbe61)
	p3_quickplay = qs(0xd624daa1)
	p4_quickplay = qs(0xb3fde4e1)
	p2_pro_faceoff = qs(0x0fc5176c)
	p4_pro_faceoff = qs(0x301bcadd)
	p8_pro_faceoff = qs(0x4fa671bf)
	p2_coop = qs(0x28b1029d)
	practice = qs(0x3bee06d2)
}
autotest_hud_on = 0
autotest_restore_globals = 0
autotest_save_bot1 = 0
autotest_save_bot2 = 0
autotest_save_bot3 = 0
autotest_save_bot4 = 0
autotest_save_current_starttime = 0
autotest_save_current_level = 0
autotest_save_current_difficulty1 = 0
autotest_save_current_difficulty2 = 0
autotest_save_current_difficulty3 = 0
autotest_save_current_difficulty4 = 0
autotest_save_game_mode = 0
autotest_save_use_worst_band = 0
autotest_save_speedfactor = 0

script autotest_save_globals 
	getplayerinfo \{1
		bot_play
		out = bot_play1}
	getplayerinfo \{2
		bot_play
		out = bot_play2}
	getplayerinfo \{3
		bot_play
		out = bot_play3}
	getplayerinfo \{4
		bot_play
		out = bot_play4}
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
	change autotest_save_bot1 = <bot_play1>
	change autotest_save_bot2 = <bot_play2>
	change autotest_save_bot3 = <bot_play3>
	change autotest_save_bot4 = <bot_play4>
	change autotest_save_current_starttime = ($current_starttime)
	change autotest_save_current_level = ($current_level)
	change autotest_save_current_difficulty1 = <difficulty1>
	change autotest_save_current_difficulty2 = <difficulty2>
	change autotest_save_current_difficulty3 = <difficulty3>
	change autotest_save_current_difficulty4 = <difficulty4>
	change autotest_save_game_mode = ($game_mode)
	change autotest_save_use_worst_band = ($use_worst_band)
	change autotest_save_speedfactor = ($current_speedfactor)
	change \{autotest_restore_globals = 1}
endscript

script autotest_autotest_restore_globals 
	setplayerinfo 1 bot_play = ($autotest_save_bot1)
	setplayerinfo 2 bot_play = ($autotest_save_bot2)
	setplayerinfo 3 bot_play = ($autotest_save_bot3)
	setplayerinfo 4 bot_play = ($autotest_save_bot4)
	change current_starttime = ($autotest_save_current_starttime)
	change current_level = ($autotest_save_current_level)
	setplayerinfo 1 difficulty = ($autotest_save_current_difficulty1)
	setplayerinfo 2 difficulty = ($autotest_save_current_difficulty2)
	setplayerinfo 3 difficulty = ($autotest_save_current_difficulty3)
	setplayerinfo 4 difficulty = ($autotest_save_current_difficulty4)
	change game_mode = ($autotest_save_game_mode)
	change use_worst_band = ($autotest_save_use_worst_band)
	change current_speedfactor = ($autotest_save_speedfactor)
	change \{autotest_restore_globals = 0}
endscript

script create_autotest_menu 
	ui_menu_select_sfx
	destroy_all_debug_menus
	change \{autotest_on = 1}
	autotest_save_globals
	setplayerinfo \{1
		bot_play = 1}
	setplayerinfo \{2
		bot_play = 1}
	setplayerinfo \{3
		bot_play = 1}
	setplayerinfo \{4
		bot_play = 1}
	make_generic_menu {
		vmenu_id = autotest_vmenu
		pos = ($menu_pos - (0.0, 80.0))
		dims = (400.0, 500.0)
		z_priority = 100.0
		title_pos = ($menu_pos - (0.0, 80.0))
		title_just = [left top]
		pad_back_script = back_to_tools_menu
		title = qs(0x385c5e06)
		scrolling
	}
	formattext \{textname = suite_text
		qs(0x9caa8f36)}
	add_generic_menu_text_item {
		text = <suite_text>
		pad_choose_script = create_test_suite_select_menu
	}
	if ($autotest_hud_on = 0)
		formattext \{textname = hud_text
			qs(0x507fe429)}
	else
		formattext \{textname = hud_text
			qs(0x379652e5)}
	endif
	add_generic_menu_text_item {
		text = <hud_text>
		pad_choose_script = autotest_toggle_hud
		pad_choose_params = {hud_toggle = hud_toggle}
		pad_left_script = autotest_toggle_hud
		pad_left_params = {hud_toggle = hud_toggle}
		pad_right_script = autotest_toggle_hud
		pad_right_params = {hud_toggle = hud_toggle}
	}
	change toggle_hud_menuitem = <item_container_id>
	if ($autotest_turbo_mode = 0)
		formattext \{textname = turbo_mode_text
			qs(0xa6fddccd)}
	else
		formattext \{textname = turbo_mode_text
			qs(0xc83d6361)}
	endif
	add_generic_menu_text_item {
		text = <turbo_mode_text>
		pad_choose_script = autotest_toggle_turbo_mode
		pad_choose_params = {turbo_mode_toggle = hud_toggle}
		pad_left_script = autotest_toggle_turbo_mode
		pad_left_params = {turbo_mode_toggle = hud_toggle}
		pad_right_script = autotest_toggle_turbo_mode
		pad_right_params = {turbo_mode_toggle = hud_toggle}
	}
	change toggle_turbo_mode_menuitem = <item_container_id>
	add_generic_menu_text_item \{text = qs(0x54f923a7)
		pad_choose_script = autotest_start}
	autotest_create_suite_list
	change \{autotest_test_index = 0}
	launchevent \{type = focus
		target = autotest_vmenu}
endscript

script create_test_suite_select_menu 
	ui_menu_select_sfx
	destroy_autotest_menu \{still_testing = 1}
	make_generic_menu {
		vmenu_id = test_suite_vmenu
		pos = ($menu_pos - (0.0, 80.0))
		dims = (400.0, 500.0)
		z_priority = 100.0
		title_pos = ($menu_pos - (0.0, 80.0))
		title_just = [left top]
		pad_back_script = back_to_autotest_menu
		title = qs(0x9caa8f36)
		scrolling
	}
	autotest_create_suite_list
	<suite_num> = 0
	begin
	<found_suite> = 0
	formattext checksumname = suite_struct 'autotest_suite%x' x = <suite_num>
	if globalexists name = <suite_struct> type = structure
		<found_suite> = 1
	endif
	if (<found_suite> = 1)
		autotest_get_suite suite_num = <suite_num>
		add_generic_menu_text_item {
			text = (<suite_struct>.name)
			pad_choose_script = autotest_push_test_suite
			pad_choose_params = {suite_num = <suite_num>}
			pad_square_script = autotest_pop_test_suite
		}
	endif
	<suite_num> = (<suite_num> + 1)
	repeat $autotest_max_suites
	launchevent \{type = focus
		target = test_suite_vmenu}
	add_user_control_helper \{text = qs(0x0c828bb9)
		button = green
		z = 1000}
	add_user_control_helper \{text = qs(0xf5af43a1)
		button = blue
		z = 1000}
endscript

script autotest_create_suite_list 
	createscreenelement {
		type = vmenu
		parent = root_window
		id = test_suite_list
		just = [left top]
		dims = (400.0, 550.0)
		pos = ($menu_pos - (500.0, 0.0))
		rgba = [128 128 128 250]
	}
	autotest_populate_test_suite_list
endscript

script destroy_test_suite_select_menu 
	if screenelementexists \{id = test_suite_scrolling_menu}
		destroyscreenelement \{id = test_suite_scrolling_menu}
	endif
	if screenelementexists \{id = test_suite_list}
		destroyscreenelement \{id = test_suite_list}
	endif
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript

script autotest_suite_transition_set_props 
	gettrueelapsedtime \{starttime = $autotest_initial_time}
	change autotest_total_time = <elapsedtime>
	autotest_format_time \{time = $autotest_total_time
		mode = hours_minutes_seconds}
	autotest_suite_transition :se_setprops test_suite_text = (<suite_struct>.name)
	autotest_suite_transition :se_setprops total_time_text = <formatted_time>
	if ($autotest_total_frames > 0)
		change autotest_average_fps = ($autotest_average_fps / $autotest_total_frames)
	endif
	formattext \{textname = average_fps_text
		qs(0x44859f25)
		f = $autotest_average_fps}
	autotest_format_time \{time = $autotest_highest_fps_time
		mode = minutes_seconds_ms}
	formattext \{textname = highest_fps_text
		qs(0x44859f25)
		f = $autotest_highest_fps}
	formattext textname = highest_fps_info qs(0xb17c4417) s = $autotest_highest_fps_test t = <formatted_time>
	autotest_format_time \{time = $autotest_lowest_fps_time
		mode = minutes_seconds_ms}
	formattext \{textname = lowest_fps_text
		qs(0x44859f25)
		f = $autotest_lowest_fps}
	formattext textname = lowest_fps_info qs(0xb17c4417) s = $autotest_lowest_fps_test t = <formatted_time>
	autotest_suite_transition :se_setprops average_fps_text = <average_fps_text>
	autotest_suite_transition :se_setprops highest_fps_text = <highest_fps_text>
	autotest_suite_transition :se_setprops highest_fps_info_text = <highest_fps_info>
	autotest_suite_transition :se_setprops lowest_fps_text = <lowest_fps_text>
	autotest_suite_transition :se_setprops lowest_fps_info_text = <lowest_fps_info>
endscript

script autotest_transition_set_props 
	autotest_get_suite \{suite_num = $autotest_suite_index
		fromsuitelist}
	autotest_get_test \{suite_num = $autotest_suite_index
		test_num = $autotest_test_index}
	formattext textname = suite_and_test_text qs(0x2a2c7f76) s = (<suite_struct>.name) t = $autotest_test_index
	autotest_transition :se_setprops test_suite_text = <suite_and_test_text>
	props_struct = ($on_disc_props)
	<song_name> = (<test_struct>.song)
	<song_struct> = (($<props_struct>).<song_name>)
	<song_text> = (<song_struct>.title)
	autotest_transition :se_setprops song_text = <song_text>
	<venue_name> = (<test_struct>.level)
	<venue_struct> = ($levelzones.<venue_name>)
	<venue_text> = (<venue_struct>.title)
	autotest_transition :se_setprops venue_text = <venue_text>
	<game_mode> = (<test_struct>.game_mode)
	autotest_transition :se_setprops game_mode_text = ($autotest_game_mode_names.<game_mode>)
	<starttime_text> = qs(0x431892ee)
	<endtime_text> = qs(0x449293a1)
	if ($autotest_has_starttime = 1)
		autotest_format_time \{mode = minutes_seconds_ms
			time = $current_starttime}
		formattext textname = starttime_text qs(0x73307931) s = <formatted_time>
	endif
	if ($autotest_has_endtime = 1)
		autotest_format_time \{mode = minutes_seconds_ms
			time = $autotest_endtime}
		formattext textname = endtime_text qs(0x6fa8cce6) e = <formatted_time>
	endif
	formattext textname = time_span_text qs(0xcdace2e0) s = <starttime_text> e = <endtime_text>
	autotest_transition :se_setprops time_span_text = <time_span_text>
	formattext textname = speed_text qs(0x73307931) s = <speed>
	autotest_transition :se_setprops speed_text = <speed_text>
	if (<test_struct>.p1_part != none)
		autotest_transition :se_setprops p1_part_text = ($autotest_part_strings.(<test_struct>.p1_part))
		autotest_transition :se_setprops p1_difficulty_text = ($autotest_difficulty_strings.(<test_struct>.p1_difficulty))
	else
		autotest_transition :se_setprops \{p1_part_text = qs(0x549620e7)}
		autotest_transition :se_setprops \{p1_difficulty_text = qs(0x03ac90f0)}
	endif
	if (<test_struct>.p2_part != none)
		autotest_transition :se_setprops p2_part_text = ($autotest_part_strings.(<test_struct>.p2_part))
		autotest_transition :se_setprops p2_difficulty_text = ($autotest_difficulty_strings.(<test_struct>.p2_difficulty))
	else
		autotest_transition :se_setprops \{p2_part_text = qs(0x549620e7)}
		autotest_transition :se_setprops \{p2_difficulty_text = qs(0x03ac90f0)}
	endif
	if (<test_struct>.p3_part != none)
		autotest_transition :se_setprops p3_part_text = ($autotest_part_strings.(<test_struct>.p3_part))
		autotest_transition :se_setprops p3_difficulty_text = ($autotest_difficulty_strings.(<test_struct>.p3_difficulty))
	else
		autotest_transition :se_setprops \{p3_part_text = qs(0x549620e7)}
		autotest_transition :se_setprops \{p3_difficulty_text = qs(0x03ac90f0)}
	endif
	if (<test_struct>.p4_part != none)
		autotest_transition :se_setprops p4_part_text = ($autotest_part_strings.(<test_struct>.p4_part))
		autotest_transition :se_setprops p4_difficulty_text = ($autotest_difficulty_strings.(<test_struct>.p4_difficulty))
	else
		autotest_transition :se_setprops \{p4_part_text = qs(0x549620e7)}
		autotest_transition :se_setprops \{p4_difficulty_text = qs(0x03ac90f0)}
	endif
endscript

script destroy_autotest_menu 
	if screenelementexists \{id = autotest_vmenu}
		destroyscreenelement \{id = autotest_vmenu}
	endif
	if screenelementexists \{id = test_suite_list}
		destroyscreenelement \{id = test_suite_list}
	endif
	destroy_menu_backdrop
	killspawnedscript \{name = autotest_check_end_time}
	killspawnedscript \{name = autotest_update_gpu_info}
	if NOT gotparam \{still_testing}
		change \{autotest_on = 0}
		change \{autotest_suite_index = 0}
		change \{autotest_test_index = 0}
		if ($autotest_restore_globals = 1)
			autotest_autotest_restore_globals
		endif
	endif
endscript

script back_to_autotest_menu 
	destroy_test_suite_select_menu
	destroy_autotest_complete
	create_autotest_menu
endscript

script destroy_autotest_complete 
	if screenelementexists \{id = autotest_complete}
		destroyscreenelement \{id = autotest_complete}
	endif
endscript

script autotest_create_hud 
	if ($autotest_hud_on)
		if NOT screenelementexists \{id = autotest_hud}
			begin
			if screenelementexists \{id = hud_root}
				break
			endif
			wait \{1
				gameframe}
			repeat
			createscreenelement \{parent = root_window
				id = autotest_hud
				type = descinterface
				desc = 'autotest_hud'}
			spawnscriptnow \{autotest_update_in_game_hud}
		endif
	endif
endscript

script autotest_destroy_hud 
	killspawnedscript \{name = autotest_update_in_game_hud}
	if screenelementexists \{id = autotest_hud}
		destroyscreenelement \{id = autotest_hud}
	endif
endscript
