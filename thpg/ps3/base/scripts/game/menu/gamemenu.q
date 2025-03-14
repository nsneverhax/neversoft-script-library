font_baseline_offset = -3
se_brightness = 5
ALWAYSPLAYMUSIC = 1
hidehud = 0
DEVKIT_LEVELS = 1
ui_text_shadow_offset = (2.0, 2.0)
ui_text_shadow_color = [
	0
	0
	0
	210
]
smallfont_colors = [
	[
		100
		100
		100
		255
	]
	[
		90
		50
		30
		255
	]
	[
		30
		50
		90
		255
	]
	[
		30
		90
		50
		255
	]
	[
		70
		90
		40
		255
	]
	[
		0
		128
		128
		100
	]
	[
		128
		0
		128
		100
	]
	[
		30
		50
		80
		100
	]
	[
		90
		80
		70
		255
	]
]
dialogfont_colors = [
	[
		88
		105
		112
		128
	]
	[
		90
		50
		8
		100
	]
	[
		17
		64
		116
		100
	]
	[
		9
		107
		36
		100
	]
	[
		123
		99
		3
		100
	]
	[
		127
		102
		0
		100
	]
	[
		100
		100
		128
		100
	]
]

script maybe_edit_skater 
	if objectexists id = current_menu_anchor
		destroyscreenelement id = current_menu_anchor
	endif
	wait 2 frames
	create_dialog_box {title = "EDIT CONFIRM?"
		text = "Exit the current level to change options?"
		pos = (320.0, 240.0)
		just = [center center]
		text_rgba = [88 105 112 128]
		text_scale = 1
		pad_back_script = no_edit_skater
		buttons = [{font = text_a1 text = "EDIT" pad_choose_script = <yes_script> pad_choose_params = <yes_params>}
			{font = text_a1 text = "CANCEL" pad_choose_script = no_edit_skater}
		]
	}
endscript

script no_edit_skater 
	dialog_box_exit
	wait \{1
		frame}
	create_your_options_menu
endscript
music_was_paused = 0
inside_pause = 0

script launch_restart_menu 
	generic_menu_animate_out \{force}
	create_restart_menu
endscript

script create_restart_menu 
	hide_current_goal
	if objectexists id = current_menu_anchor
		destroyscreenelement id = current_menu_anchor
	endif
	make_new_themed_scrolling_menu title = "RESTART" dims = (600.0, 237.0) pos = (229.0, 80.0) right_bracket_z = 1
	if cd
		<callback_script> = pause_game_and_create_pause_menu
	else
		<callback_script> = create_debug_options_menu
	endif
	setscreenelementprops {id = sub_menu
		event_handlers = [
			{pad_back generic_menu_pad_back params = {callback = <callback_script>}}
		]
	}
	create_helper_text $generic_helper_text
	AddRestartsToMenu initial_scale = 1.0
	theme_menu_add_item text = "Done" pad_choose_script = create_debug_options_menu no_bg last_item = last_item centered = centered
	finish_themed_scrolling_menu
endscript

script skip_to_selected_restart 
	resetskaters <...>
	spawnscriptlater \{skip_to_selected_restart_extras}
	spawnscriptnow \{unpause_game_and_destroy_pause_menu}
endscript

script skip_to_selected_restart_extras 
	ui_change_state \{state = uistate_gameplay}
	unpausegame
	restore_start_key_binding
endscript

script menu_confirm_quit {
		yes_script = level_select_change_level_quit
		no_script = menu_quit_no
		back_script = menu_quit_no
		title = "QUIT?"
		text = "Are you sure?"
		text_dims = (200.0, 0.0)
		params = {}
	}
	if objectexists id = current_menu_anchor
		destroyscreenelement id = current_menu_anchor
	endif
	killspawnedscript name = pause_menu_map_pulse
	create_error_box {title = <title>
		text = <text>
		pos = (310.0, 240.0)
		just = [center center]
		text_rgba = [88 105 112 128]
		text_dims = <text_dims>
		pad_back_script = <back_script>
		pad_back_params = <params>
		buttons = [{font = text_a1 text = "QUIT" pad_choose_script = <yes_script> pad_choose_params = {level = load_z_mainmenu <params>}}
			{font = text_a1 text = "CANCEL" pad_choose_script = <no_script> pad_choose_params = <params>}
		]
	}
endscript

script level_select_change_level_quit 
	printscriptinfo 'level_select_change_level_quit'
	DisablePakManStreaming
	change is_changing_levels = 1
	if NOT gotparam ve_zone_load
		change ve_hard_load_zone = none
	endif
	do_autosave immediate suspend_ui
	setbuttoneventmappings block_menu_input
	killskatercamanim name = pause_menu_camera
	load_level_handle_movie_loading_screen
	pause_menu_fmv_kill
	wait 5 gameframes
	if gamemodeequals is_career
		resetskaters
	else
		resetskaters
	endif
	deinit_goal_manager
	grid_control_deinit_grid_control_manager
	if isxenon
		if NOT innetgame
			xenon_singleplayer_session_complete_uninit
		endif
	endif
	printf "leaving and destroying server"
	chosen_leave_server
	if NOT gamemodeequals is_career
		dont_end_chapter = 1
	endif
	setgametype career
	setcurrentgametype
	SetStatOverride
	setservermode on
	startserver
	setjoinmode $join_mode_play
	printf "attempting to join server"
	joinserver
	printf "waiting"
	begin
	printf "waiting 1 frame"
	if JoinServerComplete
		break
	else
		wait 1
	endif
	printf "still waiting"
	repeat
	printf "attempting to change level"
	level_select_change_level <...> load_screen_already_up
	setbuttoneventmappings unblock_menu_input
endscript

script create_watch_cutscenes_menu \{back_script = create_options_menu}
	if objectexists \{id = current_menu_anchor}
		destroyscreenelement \{id = current_menu_anchor}
	endif
	make_new_themed_sub_menu \{title = "CUTSCENES"}
	setscreenelementprops {id = sub_menu
		event_handlers = [
			{pad_back generic_menu_pad_back params = {callback = <back_script>}}
		]
	}
	add_viewed_cutscenes_to_menu
	theme_menu_add_item text = "Done" pad_choose_script = generic_menu_pad_choose pad_choose_params = {callback = <back_script>} centered last_menu_item = last_menu_item
	finish_themed_sub_menu
endscript

script add_viewed_cutscenes_to_menu 
	getcurrentlevel
	switch <level>
		case load_ny
		<cutscene_list> = cutscene_unlock_list_ny
		case load_fl
		<cutscene_list> = cutscene_unlock_list_fl
		case load_vc
		<cutscene_list> = cutscene_unlock_list_vc
		default
		return
	endswitch
	getarraysize <cutscene_list>
	<index> = 0
	begin
	<skip_me> = 0
	if getglobalflag flag = (((<cutscene_list>) [<index>]).flag)
		if structurecontains structure = (((<cutscene_list>) [<index>])) name2
			if (<skip_me> = 0)
				theme_menu_add_item {
					text = (((<cutscene_list>) [<index>]).text)
					pad_choose_script = watch_cutscene
					pad_choose_params = {name = (((<cutscene_list>) [<index>]).name) name2 = (((<cutscene_list>) [<index>]).name2) tod_action = (((<cutscene_list>) [<index>]).tod_action) tod_action2 = (((<cutscene_list>) [<index>]).tod_action2) tod_action3 = (((<cutscene_list>) [<index>]).tod_action3)}
					centered
				}
			endif
		else
			if (<skip_me> = 0)
				theme_menu_add_item {
					text = (((<cutscene_list>) [<index>]).text)
					pad_choose_script = watch_cutscene
					pad_choose_params = {name = (((<cutscene_list>) [<index>]).name) tod_action = (((<cutscene_list>) [<index>]).tod_action) tod_action2 = (((<cutscene_list>) [<index>]).tod_action2)}
					centered
				}
			endif
		endif
	endif
	<index> = (<index> + 1)
	repeat <array_size>
endscript

script watch_cutscene 
	debounce x 2.5
	pause_menu_gradient off
	if gotparam tod_action
	endif
	if gotparam tod_action2
	endif
	unpausegame
	debounce x 2.5
	pausemusic 0
	if NOT gotparam name2
		playcutscene <...> from_cutscene_menu dont_send_skater_to_hand_brake exitscript = watch_cutscene_done
	else
		playcutscene {
			name = <name>
			from_cutscene_menu
			dont_send_skater_to_hand_brake
			exitscript = spawn_next_cutscene
			exitparams = {name = <name2> from_cutscene_menu dont_send_skater_to_hand_brake tod_action = <tod_action3> unload_anims = 0 reload_anims = 1 unload_goals = 0 reload_goals = 1 exitscript = watch_cutscene_done}
		}
	endif
	runscriptonscreenelement id = current_menu_anchor menu_offscreen
endscript

script watch_cutscene_done 
	pausegame
	pausemusic \{1}
	debounce \{x
		0.5}
	pause_menu_gradient \{on}
	create_watch_cutscenes_menu
endscript

script choose_boolean_option 
	SetPreferencesFromUI prefs = network <...>
	create_options_menu
endscript

script back_from_boolean_menus 
	if objectexists \{id = current_menu_anchor}
		destroyscreenelement \{id = current_menu_anchor}
	endif
	create_options_menu
endscript

script create_options_score_display_menu 
	if objectexists id = current_menu_anchor
		destroyscreenelement id = current_menu_anchor
	endif
	make_new_themed_sub_menu title = "SCORE DISPLAY MODE" right_bracket_alpha = 0.0
	setscreenelementprops {
		id = current_menu
		event_handlers = [{pad_back generic_menu_pad_back params = {callback = back_from_boolean_menus}}]
		replace_handlers
	}
	theme_menu_add_item text = "Show Players" centered id = menu_players pad_choose_script = choose_boolean_option pad_choose_params = {field = 'score_display' checksum = score_players string = "Show Players"}
	theme_menu_add_item text = "Show Teams" centered id = menu_teams pad_choose_script = choose_boolean_option pad_choose_params = {field = 'score_display' checksum = score_teams string = "Show Teams"}
	theme_menu_add_item text = "Done" pad_choose_script = back_from_boolean_menus last_menu_item = last_menu_item
	finish_themed_sub_menu
endscript

script menu_start_autotest 
	settesterscript \{test_advance}
	unpause_game_and_destroy_pause_menu
endscript

script menu_stop_autotest 
	killtesterscript
	unpause_game_and_destroy_pause_menu
endscript

script fake_button 
	launchevent type = <type> source = system target = system data = {controller = 0 device_num = 0}
endscript

script test_advance 
	begin
	<loops> = 5
	begin
	wait 10 gameframes
	if IsMovieQueued
		printf "AUTOTEST: In Cutscene/Movie/Camanim"
		printf "AUTOTEST: Fake X"
		fake_button type = pad_x
		<loops> = 5
	else
		if NOT screenelementexists id = current_menu_anchor
			printf "AUTOTEST: Menu Gone"
			printf "AUTOTEST: Fake X and start"
			fake_button type = pad_x
			fake_button type = pad_down
			<loops> = (<loops> -1)
		else
			printf "AUTOTEST: Fake Start"
			fake_button type = pad_start
			fake_button type = pad_down
			<loops> = 5
		endif
	endif
	if (<loops> = 0)
		break
	endif
	repeat
	printf "AUTOTEST: Advancing in 3 seconds"
	wait 150 gameframes
	printf "AUTOTEST: Advance"
	cheats_menu_advance_stage
	repeat
endscript
boardshop_deck_price = 50
unlock_sponsor_boards = 0
in_boardshop = 0
entered_skateshop_through_door = 0

script create_end_run_menu 
	dialog_box_exit
	setgametype freeskate2p
	setcurrentgametype
	control_sync_controller_settings
	if gotparam tickover
		skatercam0 :unpause
		skatercam1 :unpause
		skater :unpause
		skater2 :unpause
		wait 60 frames
		skatercam0 :pause
		skatercam1 :pause
		skater :pause
		skater2 :pause
	endif
	hideloadingscreen
	pausemusicandstreams
	pausegame
	kill_start_key_binding
	Do_MenuFx fxparam = ($goal_ui_scheme.screen_fx)
	make_cas_menu {
		title = "2 PLAYERS"
		pausemenu
	}
	create_helper_text $generic_helper_text_no_back
	getpreferencechecksum pref_type = splitscreen game_type
	if ui_net_2p_can_start_game game_type = <checksum> pref_type = splitscreen
		<can_start_game> = 1
	else
		<can_start_game> = 0
	endif
	if istrue <can_start_game>
		add_cas_menu_item {
			text = "START GAME"
			id = menu_end_run_start_game
			pad_choose_script = chosen_host_game
			pad_choose_params = {end_run}
		}
	endif
	add_cas_menu_item {
		text = "GAME TYPE"
		choose_state = UIstate_net_gametype
	}
	add_cas_menu_item {
		text = "CHANGE AREA"
		id = menu_end_run_change_levels pad_choose_script = launch_level_select_menu pad_choose_params = {end_run}
	}
	add_cas_menu_item {
		text = "DISPLAY SETUP"
		id = menu_end_run_split_mode pad_choose_script = create_split_menu pad_choose_params = {callback_script = create_end_run_menu end_run}
	}
	add_cas_menu_item {
		text = "QUIT"
		id = menu_end_run_quit pad_choose_script = menu_confirm_quit pad_choose_params = {no_script = create_end_run_menu back_script = create_end_run_menu}
	}
	goalmanager_hidepoints
	helper_text = {
		helper_text_elements = [{text = "\\m0 ACCEPT"}
		]
	}
	cas_menu_finish helper_text = <helper_text>
endscript

script create_debug_options_menu pad_back_script = pause_game_and_create_pause_menu pad_back_params = {}
	hide_current_goal
	make_cas_menu {
		title = "DEBUG OPTIONS"
		pausemenu
		pad_back_script = generic_menu_pad_back pad_back_params = {callback = <pad_back_script> <pad_back_params>}
	}
	goalmanager_hidepoints
	unhide_root_window
	add_cas_menu_item {
		text = "CHEATS: DEBUG"
		id = menu_cheats pad_choose_script = launch_cheats_menu
	}
	add_cas_menu_item {
		text = "GOTO RESTART"
		id = menu_skip_to_restart pad_choose_script = launch_restart_menu
	}
	add_cas_menu_item {
		text = "DEBUG MENU"
		id = debug_menu pad_choose_script = create_debug_menu
	}
	if NOT infrontend
		add_cas_menu_item {
			text = "GOALS MENU"
			id = goals_menu pad_choose_script = create_goals_menu
		}
	endif
	add_cas_menu_item text = "CUTSCENES MENU" pad_choose_script = launch_view_cutscenes_menu
	add_cas_menu_item text = "BINK MENU" pad_choose_script = bink_debug_menu_create
	add_cas_menu_item text = "ZONE UNLOCK MENU" pad_choose_script = zone_unlock_menu_create
	add_cas_menu_item text = "ASIAN FONT TEST MENU" pad_choose_script = asian_font_test_menu_create
	cas_menu_finish
endscript

script focus_stats_display 
	gettags
	setscreenelementlock id = <id> off
	createscreenelement {
		type = containerelement
		parent = <id>
		id = stats_block
		pos = (150.0, 20.0)
	}
	createscreenelement {
		type = spriteelement
		parent = stats_block
		id = stat_bg
		texture = white2
		z_priority = -4
		scale = (31.0, 27.0)
		pos = (50.0, -10.0)
		just = [left top]
		rgba = [0 0 0 80]
	}
	createscreenelement {
		type = spriteelement
		parent = stats_block
		texture = white2
		pos = (50.0, -10.0)
		rgba = [101 , 71 , 26 , 128]
		just = [left center]
		scale = (31.0, 0.4)
		z_priority = -3
	}
	stats_menu_create_stats_block {
		parent = stats_block
		id = stats_block_anchor
		not_focusable
		on = on
		scale = 0.85
		pos = (0.0, 20.0)
		pro_name = <name>
	}
endscript

script unfocus_stats_display 
	if screenelementexists \{id = stats_block}
		destroyscreenelement \{id = stats_block}
	endif
endscript

script make_new_menu {menu_title = ""
		padding_scale = 1.15
		internal_scale = 1
		pos = (230.0, 109.0)
		dims = (200.0, 100.0)
		internal_just = [left top]
		parent = root_window
		just = [center center]
		scrolling_menu_offset = (0.0, 10.0)
	}
	<pos> = (<pos> + (0.0, 12.0))
	setscreenelementlock id = <parent> off
	createscreenelement {
		type = containerelement
		parent = <parent>
		id = <menu_id>
		font = text_a1
		pos = (320.0, 240.0)
		scale = 1
		dims = (640.0, 480.0)
		focusable_child = <vmenu_id>
	}
	switch <type>
		case vscrollingmenu
		if gotparam scrolling_menu_title_id
			createscreenelement {
				type = containerelement
				parent = <menu_id>
				just = [left bottom]
				z_priority = -1
				pos = (55.0, 51.0)
				dims = (0.0, 0.0)
				allow_expansion
			}
			createscreenelement {
				type = textelement
				parent = <menu_id>
				id = <scrolling_menu_title_id>
				font = text_a1
				text = <menu_title>
				scale = 0.7
				pos = <pos>
				just = [left top]
				rgba = ($cas_color_scheme.title_color)
				not_focusable
			}
			GetStackedScreenElementPos y id = <id> offset = <scrolling_menu_offset>
		endif
		createscreenelement {
			type = vscrollingmenu
			parent = <menu_id>
			id = <scrolling_menu_id>
			pos = <pos>
			just = [left top]
			dims = <dims>
			scale = <scale>
			internal_just = [left top]
			num_items_to_show = <num_items_to_show>
		}
		<vscrolling_menu_id> = <id>
		createscreenelement {
			type = vmenu
			parent = <vscrolling_menu_id>
			id = <vmenu_id>
			dims = <dims>
			font = text_a1
			just = [left top]
			pos = (0.0, 0.0)
			scale = <scale>
			regular_space_amount = <regular_space_amount>
			padding_scale = <padding_scale>
			internal_scale = <internal_scale>
			internal_just = <internal_just>
			<dont_allow_wrap>
			event_handlers = [{pad_up generic_menu_up_or_down_sound params = {up}}
				{pad_down generic_menu_up_or_down_sound params = {down}}
			]
		}
		default
		createscreenelement {
			type = vmenu
			parent = <menu_id>
			id = <vmenu_id>
			font = text_a1
			just = [left top]
			pos = <pos>
			padding_scale = <padding_scale>
			internal_scale = <internal_scale>
			internal_just = <internal_just>
			<dont_allow_wrap>
			event_handlers = [{pad_up generic_menu_up_or_down_sound params = {up}}
				{pad_down generic_menu_up_or_down_sound params = {down}}
			]
		}
		if NOT gotparam no_menu_title
			createscreenelement {
				type = containerelement
				parent = <vmenu_id>
				just = [left bottom]
				z_priority = -1
				pos = (55.0, 51.0)
				dims = (0.0, 0.0)
				allow_expansion
			}
			createscreenelement {
				type = textelement
				parent = <vmenu_id>
				font = text_a1
				text = <menu_title>
				scale = 0.7
				rgba = ($cas_color_scheme.title_color)
				not_focusable
			}
		endif
	endswitch
	if NOT gotparam no_alias
		assignalias id = <menu_id> alias = current_menu_anchor
	endif
	assignalias id = <vmenu_id> alias = current_menu
	if gotparam helper_text
		create_helper_text <helper_text>
	endif
endscript

script make_text_sub_menu_item {focus_script = do_scale_up
		unfocus_script = do_scale_down
		pad_choose_script = nullscript
		font_face = small
		parent_menu_id = current_menu
		scale = 1
		rgba = [88 105 112 255]
	}
	if gotparam not_focusable
		createscreenelement {
			type = textelement
			parent = <parent_menu_id>
			id = <id>
			text = <text>
			font = <font_face>
			rgba = <rgba>
			scale = <scale>
			event_handlers = [
				{focus <focus_script> params = <focus_params>}
				{unfocus <unfocus_script> params = <unfocus_params>}
				{pad_choose <pad_choose_script> params = <pad_choose_params>}
				{pad_start <pad_choose_script> params = <pad_choose_params>}
			]
			not_focusable
		}
	else
		if gotparam no_choose_sound
			createscreenelement {
				type = textelement
				parent = <parent_menu_id>
				id = <id>
				text = <text>
				font = <font_face>
				rgba = <rgba>
				scale = <scale>
				event_handlers = [
					{focus <focus_script> params = <focus_params>}
					{unfocus <unfocus_script> params = <unfocus_params>}
					{pad_choose <pad_choose_script> params = <pad_choose_params>}
					{pad_start <pad_choose_script> params = <pad_choose_params>}
				]
			}
		else
			createscreenelement {
				type = textelement
				parent = <parent_menu_id>
				id = <id>
				text = <text>
				font = <font_face>
				rgba = <rgba>
				scale = <scale>
				event_handlers = [
					{focus <focus_script> params = <focus_params>}
					{unfocus <unfocus_script> params = <unfocus_params>}
					{pad_choose generic_menu_pad_choose_sound}
					{pad_start generic_menu_pad_choose_sound}
					{pad_choose <pad_choose_script> params = <pad_choose_params>}
					{pad_start <pad_choose_script> params = <pad_choose_params>}
				]
			}
		endif
	endif
	if gotparam pad_circle_script
		setscreenelementprops {id = <id>
			event_handlers = [
				{pad_circle <pad_circle_script> params = <pad_circle_params>}
			]
		}
	endif
endscript
