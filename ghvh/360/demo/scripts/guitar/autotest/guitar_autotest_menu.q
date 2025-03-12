autotest_part_strings = {
	none = qs(0x3f1bbbb1)
	guitar = qs(0x826ca62c)
	bass = qs(0xec55f51b)
	vocals = qs(0x0cf770e2)
	drum = qs(0xf9468e57)
}
autotest_difficulty_strings = {
	easy_rhythm = qs(0x43448a88)
	easy = qs(0x1c7f1488)
	medium = qs(0x79990567)
	hard = qs(0xc0aa0a20)
	expert = qs(0x242117ca)
}
autotest_game_mode_names = {
	p1_career = qs(0x1690f5c2)
	p2_career = qs(0x3f584130)
	p3_career = qs(0x9130d0a1)
	p4_career = qs(0x1126b7ca)
	p1_quickplay = qs(0xf8741321)
	p2_quickplay = qs(0xc10cbe61)
	p3_quickplay = qs(0xd624daa1)
	p4_quickplay = qs(0xb3fde4e1)
	p2_faceoff = qs(0xdf15d399)
	p2_pro_faceoff = qs(0x0fc5176c)
	p4_pro_faceoff = qs(0x301bcadd)
	p8_pro_faceoff = qs(0x4fa671bf)
	p2_battle = qs(0xd2931efa)
	p2_coop = qs(0x28b1029d)
	training = qs(0xd5da4d20)
}
autotest_hud_on = 0
autotest_restore_globals = 0
autotest_save_bot1 = 0
autotest_save_bot2 = 0
autotest_save_bot3 = 0
autotest_save_bot4 = 0
autotest_save_current_song = 0
autotest_save_current_starttime = 0
autotest_save_current_level = 0
autotest_save_current_num_players = 0
autotest_save_current_difficulty1 = 0
autotest_save_current_difficulty2 = 0
autotest_save_current_difficulty3 = 0
autotest_save_current_difficulty4 = 0
autotest_save_game_mode = 0
autotest_save_use_worst_band = 0
autotest_save_speedfactor = 0

script autotest_save_globals 
	change autotest_save_bot1 = ($player1_status.bot_play)
	change autotest_save_bot2 = ($player2_status.bot_play)
	change autotest_save_bot3 = ($player3_status.bot_play)
	change autotest_save_bot4 = ($player4_status.bot_play)
	change autotest_save_current_song = ($current_song)
	change autotest_save_current_starttime = ($current_starttime)
	change autotest_save_current_level = ($current_level)
	change autotest_save_current_num_players = ($current_num_players)
	change autotest_save_current_difficulty1 = ($player1_status.difficulty)
	change autotest_save_current_difficulty2 = ($player2_status.difficulty)
	change autotest_save_current_difficulty3 = ($player3_status.difficulty)
	change autotest_save_current_difficulty4 = ($player4_status.difficulty)
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
	change current_song = ($autotest_save_current_song)
	change current_starttime = ($autotest_save_current_starttime)
	change current_level = ($autotest_save_current_level)
	change current_num_players = ($autotest_save_current_num_players)
	change structurename = player1_status difficulty = ($autotest_save_current_difficulty1)
	change structurename = player2_status difficulty = ($autotest_save_current_difficulty2)
	change structurename = player3_status difficulty = ($autotest_save_current_difficulty3)
	change structurename = player4_status difficulty = ($autotest_save_current_difficulty4)
	change game_mode = ($autotest_save_game_mode)
	change use_worst_band = ($autotest_save_use_worst_band)
	change current_speedfactor = ($autotest_save_speedfactor)
	change \{autotest_restore_globals = 0}
endscript

script create_autotest_menu 
	ui_menu_select_sfx
	destroy_debugging_menu
	create_menu_backdrop \{texture = black
		rgba = [
			0
			0
			0
			128
		]
		z_priority = 90}
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
	createscreenelement {
		type = menuelement
		id = autotest_vmenu
		parent = pause_menu
		font = debug
		dims = (400.0, 480.0)
		pos = ($menu_pos - (30.0, 0.0))
		scale = 1
		rgba = [210 210 210 250]
		text = <basename>
		just = [left top]
		z_priority = 100.0
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_back generic_menu_pad_back params = {callback = back_to_debug_menu}}
		]
	}
	formattext \{textname = suite_text
		qs(0x9caa8f36)}
	createscreenelement {
		type = textelement
		id = suite_select
		parent = autotest_vmenu
		font = debug
		scale = 0.75
		rgba = [210 210 210 250]
		text = <suite_text>
		just = [left top]
		z_priority = 100.0
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose create_test_suite_select_menu}
		]
	}
	if ($autotest_hud_on = 0)
		formattext \{textname = hud_text
			qs(0x507fe429)}
	else
		formattext \{textname = hud_text
			qs(0x379652e5)}
	endif
	createscreenelement {
		type = textelement
		id = hud_toggle
		parent = autotest_vmenu
		font = debug
		scale = 0.75
		rgba = [210 210 210 250]
		text = <hud_text>
		just = [left top]
		z_priority = 100.0
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_left autotest_toggle_hud params = {hud_toggle = hud_toggle}}
			{pad_right autotest_toggle_hud params = {hud_toggle = hud_toggle}}
			{pad_choose autotest_toggle_hud params = {hud_toggle = hud_toggle}}
		]
	}
	if ($autotest_turbo_mode = 0)
		formattext \{textname = turbo_mode_text
			qs(0xa6fddccd)}
	else
		formattext \{textname = turbo_mode_text
			qs(0xc83d6361)}
	endif
	createscreenelement {
		type = textelement
		id = turbo_mode_toggle
		parent = autotest_vmenu
		font = debug
		scale = 0.75
		rgba = [210 210 210 250]
		text = <turbo_mode_text>
		just = [left top]
		z_priority = 100.0
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_left autotest_toggle_turbo_mode params = {turbo_mode_toggle = hud_toggle}}
			{pad_right autotest_toggle_turbo_mode params = {turbo_mode_toggle = hud_toggle}}
			{pad_choose autotest_toggle_turbo_mode params = {turbo_mode_toggle = hud_toggle}}
		]
	}
	createscreenelement \{type = textelement
		id = start_autotest_button
		parent = autotest_vmenu
		font = debug
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = qs(0xf6b74bf1)
		just = [
			left
			top
		]
		z_priority = 100.0
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				autotest_start
			}
		]}
	autotest_create_suite_list
	change \{autotest_test_index = 0}
	launchevent \{type = focus
		target = autotest_vmenu}
endscript

script create_test_suite_select_menu 
	ui_menu_select_sfx
	destroy_autotest_menu \{still_testing = 1}
	create_menu_backdrop \{texture = black
		rgba = [
			0
			0
			0
			128
		]
		z_priority = 90}
	createscreenelement {
		type = vscrollingmenu
		parent = pause_menu
		id = test_suite_scrolling_menu
		just = [left top]
		dims = (400.0, 550.0)
		pos = ($menu_pos)
	}
	createscreenelement \{type = vmenu
		parent = test_suite_scrolling_menu
		id = test_suite_vmenu
		pos = (0.0, 0.0)
		just = [
			left
			top
		]
		event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_back
				generic_menu_pad_back
				params = {
					callback = back_to_autotest_menu
				}
			}
		]}
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
		createscreenelement {
			type = textelement
			parent = test_suite_vmenu
			font = debug
			scale = 0.75
			rgba = [210 210 210 250]
			text = (<suite_struct>.name)
			just = [left top]
			z_priority = 100.0
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose autotest_push_test_suite params = {suite_num = <suite_num>}}
				{pad_square autotest_pop_test_suite}
			]
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
		parent = pause_menu
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
	<song_name> = (<test_struct>.song)
	<song_struct> = ($permanent_songlist_props.<song_name>)
	<song_text> = (<song_struct>.title)
	autotest_transition :se_setprops song_text = <song_text>
	<venue_name> = (<test_struct>.venue)
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
