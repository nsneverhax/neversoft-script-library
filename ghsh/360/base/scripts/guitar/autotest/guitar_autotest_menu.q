autotest_part_strings = {
	None = qs(0x3f1bbbb1)
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
	Change autotest_save_bot1 = ($player1_status.bot_play)
	Change autotest_save_bot2 = ($player2_status.bot_play)
	Change autotest_save_bot3 = ($player3_status.bot_play)
	Change autotest_save_bot4 = ($player4_status.bot_play)
	Change autotest_save_current_song = ($current_song)
	Change autotest_save_current_starttime = ($current_starttime)
	Change autotest_save_current_level = ($current_level)
	Change autotest_save_current_num_players = ($current_num_players)
	Change autotest_save_current_difficulty1 = ($player1_status.difficulty)
	Change autotest_save_current_difficulty2 = ($player2_status.difficulty)
	Change autotest_save_current_difficulty3 = ($player3_status.difficulty)
	Change autotest_save_current_difficulty4 = ($player4_status.difficulty)
	Change autotest_save_game_mode = ($game_mode)
	Change autotest_save_use_worst_band = ($use_worst_band)
	Change autotest_save_speedfactor = ($current_speedfactor)
	Change \{autotest_restore_globals = 1}
endscript

script autotest_autotest_restore_globals 
	setplayerinfo 1 bot_play = ($autotest_save_bot1)
	setplayerinfo 2 bot_play = ($autotest_save_bot2)
	setplayerinfo 3 bot_play = ($autotest_save_bot3)
	setplayerinfo 4 bot_play = ($autotest_save_bot4)
	Change current_song = ($autotest_save_current_song)
	Change current_starttime = ($autotest_save_current_starttime)
	Change current_level = ($autotest_save_current_level)
	Change current_num_players = ($autotest_save_current_num_players)
	Change structurename = player1_status difficulty = ($autotest_save_current_difficulty1)
	Change structurename = player2_status difficulty = ($autotest_save_current_difficulty2)
	Change structurename = player3_status difficulty = ($autotest_save_current_difficulty3)
	Change structurename = player4_status difficulty = ($autotest_save_current_difficulty4)
	Change game_mode = ($autotest_save_game_mode)
	Change use_worst_band = ($autotest_save_use_worst_band)
	Change current_speedfactor = ($autotest_save_speedfactor)
	Change \{autotest_restore_globals = 0}
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
	Change \{autotest_on = 1}
	autotest_save_globals
	setplayerinfo \{1
		bot_play = 1}
	setplayerinfo \{2
		bot_play = 1}
	setplayerinfo \{3
		bot_play = 1}
	setplayerinfo \{4
		bot_play = 1}
	CreateScreenElement {
		Type = menuelement
		id = autotest_vmenu
		parent = pause_menu
		font = debug
		dims = (400.0, 480.0)
		Pos = ($menu_pos - (30.0, 0.0))
		Scale = 1
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
	formatText \{TextName = suite_text
		qs(0x9caa8f36)}
	CreateScreenElement {
		Type = TextElement
		id = suite_select
		parent = autotest_vmenu
		font = debug
		Scale = 0.75
		rgba = [210 210 210 250]
		text = <suite_text>
		just = [left top]
		z_priority = 100.0
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose create_test_suite_select_menu}
		]
	}
	if ($autotest_hud_on = 0)
		formatText \{TextName = hud_text
			qs(0x507fe429)}
	else
		formatText \{TextName = hud_text
			qs(0x379652e5)}
	endif
	CreateScreenElement {
		Type = TextElement
		id = hud_toggle
		parent = autotest_vmenu
		font = debug
		Scale = 0.75
		rgba = [210 210 210 250]
		text = <hud_text>
		just = [left top]
		z_priority = 100.0
		Shadow
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
		formatText \{TextName = turbo_mode_text
			qs(0xa6fddccd)}
	else
		formatText \{TextName = turbo_mode_text
			qs(0xc83d6361)}
	endif
	CreateScreenElement {
		Type = TextElement
		id = turbo_mode_toggle
		parent = autotest_vmenu
		font = debug
		Scale = 0.75
		rgba = [210 210 210 250]
		text = <turbo_mode_text>
		just = [left top]
		z_priority = 100.0
		Shadow
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
	CreateScreenElement \{Type = TextElement
		id = start_autotest_button
		parent = autotest_vmenu
		font = debug
		Scale = 0.75
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
		Shadow
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
	Change \{autotest_test_index = 0}
	LaunchEvent \{Type = focus
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
	CreateScreenElement {
		Type = VScrollingMenu
		parent = pause_menu
		id = test_suite_scrolling_menu
		just = [left top]
		dims = (400.0, 550.0)
		Pos = ($menu_pos)
	}
	CreateScreenElement \{Type = VMenu
		parent = test_suite_scrolling_menu
		id = test_suite_vmenu
		Pos = (0.0, 0.0)
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
	formatText checksumName = suite_struct 'autotest_suite%x' X = <suite_num>
	if GlobalExists Name = <suite_struct> Type = structure
		<found_suite> = 1
	endif
	if (<found_suite> = 1)
		autotest_get_suite suite_num = <suite_num>
		CreateScreenElement {
			Type = TextElement
			parent = test_suite_vmenu
			font = debug
			Scale = 0.75
			rgba = [210 210 210 250]
			text = (<suite_struct>.Name)
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
	LaunchEvent \{Type = focus
		target = test_suite_vmenu}
	add_user_control_helper \{text = qs(0x0c828bb9)
		button = green
		z = 1000}
	add_user_control_helper \{text = qs(0xf5af43a1)
		button = blue
		z = 1000}
endscript

script autotest_create_suite_list 
	CreateScreenElement {
		Type = VMenu
		parent = pause_menu
		id = test_suite_list
		just = [left top]
		dims = (400.0, 550.0)
		Pos = ($menu_pos - (500.0, 0.0))
		rgba = [128 128 128 250]
	}
	autotest_populate_test_suite_list
endscript

script destroy_test_suite_select_menu 
	if ScreenElementExists \{id = test_suite_scrolling_menu}
		DestroyScreenElement \{id = test_suite_scrolling_menu}
	endif
	if ScreenElementExists \{id = test_suite_list}
		DestroyScreenElement \{id = test_suite_list}
	endif
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript

script autotest_suite_transition_set_props 
	GetTrueElapsedTime \{starttime = $autotest_initial_time}
	Change autotest_total_time = <ElapsedTime>
	autotest_format_time \{time = $autotest_total_time
		mode = hours_minutes_seconds}
	autotest_suite_transition :se_setprops test_suite_text = (<suite_struct>.Name)
	autotest_suite_transition :se_setprops total_time_text = <formatted_time>
	if ($autotest_total_frames > 0)
		Change autotest_average_fps = ($autotest_average_fps / $autotest_total_frames)
	endif
	formatText \{TextName = average_fps_text
		qs(0x44859f25)
		f = $autotest_average_fps}
	autotest_format_time \{time = $autotest_highest_fps_time
		mode = minutes_seconds_ms}
	formatText \{TextName = highest_fps_text
		qs(0x44859f25)
		f = $autotest_highest_fps}
	formatText TextName = highest_fps_info qs(0xb17c4417) s = $autotest_highest_fps_test t = <formatted_time>
	autotest_format_time \{time = $autotest_lowest_fps_time
		mode = minutes_seconds_ms}
	formatText \{TextName = lowest_fps_text
		qs(0x44859f25)
		f = $autotest_lowest_fps}
	formatText TextName = lowest_fps_info qs(0xb17c4417) s = $autotest_lowest_fps_test t = <formatted_time>
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
	formatText TextName = suite_and_test_text qs(0x2a2c7f76) s = (<suite_struct>.Name) t = $autotest_test_index
	autotest_transition :se_setprops test_suite_text = <suite_and_test_text>
	<song_name> = (<test_struct>.song)
	<song_struct> = ($permanent_songlist_props.<song_name>)
	<song_text> = (<song_struct>.title)
	autotest_transition :se_setprops song_text = <song_text>
	<venue_name> = (<test_struct>.venue)
	<venue_struct> = ($LevelZones.<venue_name>)
	<venue_text> = (<venue_struct>.title)
	autotest_transition :se_setprops venue_text = <venue_text>
	<game_mode> = (<test_struct>.game_mode)
	autotest_transition :se_setprops game_mode_text = ($autotest_game_mode_names.<game_mode>)
	<starttime_text> = qs(0x431892ee)
	<endtime_text> = qs(0x449293a1)
	if ($autotest_has_starttime = 1)
		autotest_format_time \{mode = minutes_seconds_ms
			time = $current_starttime}
		formatText TextName = starttime_text qs(0x73307931) s = <formatted_time>
	endif
	if ($autotest_has_endtime = 1)
		autotest_format_time \{mode = minutes_seconds_ms
			time = $autotest_endtime}
		formatText TextName = endtime_text qs(0x6fa8cce6) e = <formatted_time>
	endif
	formatText TextName = time_span_text qs(0xcdace2e0) s = <starttime_text> e = <endtime_text>
	autotest_transition :se_setprops time_span_text = <time_span_text>
	formatText TextName = speed_text qs(0x73307931) s = <speed>
	autotest_transition :se_setprops speed_text = <speed_text>
	if (<test_struct>.p1_part != None)
		autotest_transition :se_setprops p1_part_text = ($autotest_part_strings.(<test_struct>.p1_part))
		autotest_transition :se_setprops p1_difficulty_text = ($autotest_difficulty_strings.(<test_struct>.p1_difficulty))
	else
		autotest_transition :se_setprops \{p1_part_text = qs(0x549620e7)}
		autotest_transition :se_setprops \{p1_difficulty_text = qs(0x03ac90f0)}
	endif
	if (<test_struct>.p2_part != None)
		autotest_transition :se_setprops p2_part_text = ($autotest_part_strings.(<test_struct>.p2_part))
		autotest_transition :se_setprops p2_difficulty_text = ($autotest_difficulty_strings.(<test_struct>.p2_difficulty))
	else
		autotest_transition :se_setprops \{p2_part_text = qs(0x549620e7)}
		autotest_transition :se_setprops \{p2_difficulty_text = qs(0x03ac90f0)}
	endif
	if (<test_struct>.p3_part != None)
		autotest_transition :se_setprops p3_part_text = ($autotest_part_strings.(<test_struct>.p3_part))
		autotest_transition :se_setprops p3_difficulty_text = ($autotest_difficulty_strings.(<test_struct>.p3_difficulty))
	else
		autotest_transition :se_setprops \{p3_part_text = qs(0x549620e7)}
		autotest_transition :se_setprops \{p3_difficulty_text = qs(0x03ac90f0)}
	endif
	if (<test_struct>.p4_part != None)
		autotest_transition :se_setprops p4_part_text = ($autotest_part_strings.(<test_struct>.p4_part))
		autotest_transition :se_setprops p4_difficulty_text = ($autotest_difficulty_strings.(<test_struct>.p4_difficulty))
	else
		autotest_transition :se_setprops \{p4_part_text = qs(0x549620e7)}
		autotest_transition :se_setprops \{p4_difficulty_text = qs(0x03ac90f0)}
	endif
endscript

script destroy_autotest_menu 
	if ScreenElementExists \{id = autotest_vmenu}
		DestroyScreenElement \{id = autotest_vmenu}
	endif
	if ScreenElementExists \{id = test_suite_list}
		DestroyScreenElement \{id = test_suite_list}
	endif
	destroy_menu_backdrop
	KillSpawnedScript \{Name = autotest_check_end_time}
	KillSpawnedScript \{Name = autotest_update_gpu_info}
	if NOT GotParam \{still_testing}
		Change \{autotest_on = 0}
		Change \{autotest_suite_index = 0}
		Change \{autotest_test_index = 0}
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
	if ScreenElementExists \{id = autotest_complete}
		DestroyScreenElement \{id = autotest_complete}
	endif
endscript

script autotest_create_hud 
	if ($autotest_hud_on)
		if NOT ScreenElementExists \{id = autotest_hud}
			CreateScreenElement \{parent = root_window
				id = autotest_hud
				Type = descinterface
				desc = 'autotest_hud'}
			SpawnScriptNow \{autotest_update_in_game_hud}
		endif
	endif
endscript

script autotest_destroy_hud 
	KillSpawnedScript \{Name = autotest_update_in_game_hud}
	if ScreenElementExists \{id = autotest_hud}
		DestroyScreenElement \{id = autotest_hud}
	endif
endscript
