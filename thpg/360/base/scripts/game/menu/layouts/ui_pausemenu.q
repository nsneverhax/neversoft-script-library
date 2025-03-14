pausemenu_buss_set_active = 0

script ui_create_pausemenu 
	printf "ui_create_pausemenu"
	arcade = {}
	if gman_getactivatedgoalid
		gman_getgoaltype goal = <activated_goal_id>
		if NOT ((<goal_type> = classic) || (<goal_type> = hawkman) || (<goal_type> = high_score_run))
			Do_MenuFx fxparam = ($goal_ui_scheme.screen_fx)
		else
			arcade = {arcade}
		endif
	else
		get_strongest_lifestyle
		goal_ui_update_scheme lifestyle = <strongest_lifestyle>
		Do_MenuFx fxparam = ($goal_ui_scheme.screen_fx)
	endif
	ui_pausemenu_push_buss
	if innetgame
		ui_create_net_pausemenu
		return
	elseif insplitscreengame
		ui_create_splitscreen_pausemenu
		return
	endif
	GetGameMode
	make_cas_menu {
		menu_id = pause_menu_anchor
		vmenu_id = pause_vmenu
		title = "paused"
		pausemenu
		ticker
		ProgressBar
		ZoneText
		icon
		coord_array = pause_menu_coords
		pad_back_script = handle_start_pressed
	}
	if gamemodeequals is_career
		if NOT gman_hasactivegoals
			pause_menu_show_near_goals
			add_cas_menu_item {
				text = "my goals"
				choose_state = UIstate_view_missions
			}
		endif
	endif
	if gman_getactivatedgoalid
		if gman_canretrycurrentgoal
			add_cas_menu_item {
				text = "TRICK CONTROLS"
				choose_state = UIstate_view_tricks
			}
			add_cas_menu_item {
				text = "retry goal"
				pad_choose_script = ui_spawn_script
				pad_choose_params = {script_name = goal_retry_current_goal}
			}
		endif
	elseif NOT gman_hasactivegoals
		if getglobalflag flag = $CAREER_TRAINING_DONE
			if skater :obj_flagnotset $FLAG_SKATER_KILLING
				if gman_canretrylastgoal
					add_cas_menu_item {
						text = "retry last goal"
						pad_choose_script = goal_retry_last_goal
					}
				endif
			endif
		endif
	endif
	if gamemodeequals is_career
		if IsInCrib
			if NOT gman_getactivatedgoalid
				add_cas_menu_item {
					text = "skate lounge"
					choose_state = UIstate_Crib_Main
					<crib_not_focusable>
				}
			endif
		endif
	endif
	if gman_getactivatedgoalid
		if gman_getconstant goal = <activated_goal_id> name = end_run_script
			add_cas_menu_item {
				text = "end run"
				pad_choose_script = ui_prompt_to_end_run
				pad_choose_params = {end_run_script = <end_run_script>}
			}
		else
			add_cas_menu_item {
				text = "quit goal"
				pad_choose_script = ui_prompt_to_quit_goal
			}
		endif
	endif
	if gamemodeequals is_career
		if NOT gman_hasactivegoals
			add_cas_menu_item {
				text = "my skater"
				choose_state = UIstate_view_status
			}
			if isxenon
				if checkforsignin local
					add_cas_menu_item {
						text = "video editor"
						pad_choose_script = ui_attempt_opening_video_editor
					}
				else
					add_cas_menu_item {
						text = "video editor"
						pad_choose_script = ui_attempt_opening_video_editor
						not_focusable
					}
				endif
			else
				add_cas_menu_item {
					text = "video editor"
					pad_choose_script = ui_attempt_opening_video_editor
				}
			endif
			if NOT checkforsignin
				not_focusable = not_focusable
			endif
			if isxenon
				add_cas_menu_item {
					text = "Xbox LIVE"
					pad_choose_script = net_view_goals_check_for_signin
					text_case = none
					<not_focusable>
				}
			else
				add_cas_menu_item {
					text = "online"
					pad_choose_script = net_view_goals_check_for_signin
					text_case = none
					<not_focusable>
				}
			endif
		endif
	endif
	add_cas_menu_item {
		text = "options"
		choose_state = UIstate_pauseoptions
	}
	if istrue $ui_show_debug_menus
		if gamemodeequals is_career
			if NOT gman_hasactivegoals
				add_cas_menu_item {
					text = "change area"
					choose_state = UIstate_pauselevel
				}
			endif
		endif
	endif
	if IsInCrib
		if NOT gman_getactivatedgoalid
			add_cas_menu_item {
				text = "BACK TO GAME"
				pad_back_script = ui_yourlife_back_to_default_zone pad_choose_script = ui_yourlife_back_to_default_zone
			}
		endif
	endif
	if istrue $ui_show_debug_menus
		if gman_getactivatedgoalid
			add_cas_menu_item {
				text = "beat entire goal (am)"
				pad_choose_script = ui_pausemenu_beat_goal
				pad_choose_params = {goal_id = <activated_goal_id> goal_grade = 1}
			}
			add_cas_menu_item {
				text = "beat goal checkpoint"
				pad_choose_script = goal_debug_beat_checkpoint
			}
		endif
	endif
	getlowercasestring <text>
	text = <lowercasestring>
	if NOT gman_getactivatedgoalid
		add_cas_menu_item {
			text = "quit game"
			pad_choose_script = ui_pausemenu_quit_dialog
		}
	endif
	cas_menu_finish {
		helper_text = {
			helper_text_elements = [
				{text = "\\m1 BACK"}
				{text = "\\m0 ACCEPT"}
				{text = "\\mb PLAY NEXT TRACK"}
			]
		}
	}
	if getglobalflag flag = $CHEAT_ALWAYS_COMBO
		createscreenelement {
			parent = current_menu_anchor
			type = textelement
			text = "ALWAYS COMBO ACTIVE"
			font = text_a1
			rgba = [0 128 0 255]
			scale = 0.5
			pos = (40.0, 30.0)
			just = [left top]
			shadow
			shadow_rgba = [0 0 0 255]
			shadow_offs = (2.0, 2.0)
		}
	endif
	if gman_getactivatedgoalid
		goal_generic_view_goal_pausemenu goal = <activated_goal_id> arcade = <arcade>
	endif
	createscreenelement {
		type = containerelement
		parent = current_menu_anchor
		event_handlers = [
			{pad_r1 skip_track}
		]
	}
	launchevent type = focus target = <id>
endscript

script ui_pausemenu_push_buss \{time = 0.5}
	if ($pausemenu_buss_set_active = 0)
		printpushpopdebuginfo \{push
			name = "ui_create_pausemenu"}
		pushsoundbussparams
		setsoundbussparams $Pause_Menu_BussSet time = <time>
		change \{pausemenu_buss_set_active = 1}
	endif
endscript

script ui_pausemenu_beat_goal 
	printf '-- ui_pausemenu_beat_goal goal=%g grade=%s' g = <goal_id> s = <goal_grade>
	gman_deactivategoal goal = <goal_id>
	gman_blockuntilallgoalsdeactivated
	careerfunc func = fakebeatprogressiongoal params = {goal_id = <goal_id> goal_grade = <goal_grade>}
	if GMan_GetTrackInfo goal = <goal_id>
		careerfunc func = updateatoms
		wait 1 second ignoreslomo
		goal_track_ped_recreate track = (<track_info>.track)
		spawnscriptlater goal_track_prompt_for_next_goal params = {track = (<track_info>.track)}
	endif
	handle_start_pressed <...>
endscript

script ui_attempt_opening_video_editor 
	generic_ui_destroy
	if has_active_video_editor_cheats
		create_dialog_box {title = "Video Editor"
			text = "You have some cheats enabled which prevent use of the video editor."
			buttons = [{text = "ok" pad_choose_script = ui_attempt_opening_video_editor_cancelled}
			]
			text_dims = (350.0, 0.0)
		}
	else
		if game_progress_check_valid_save fix_start_key
			ui_change_state state = UIstate_video_editor_Main
		else
			ui_attempt_opening_video_editor_cancelled
		endif
	endif
endscript

script ui_attempt_opening_video_editor_cancelled 
	restore_start_key_binding
	ui_create_pausemenu
endscript

script ui_spawn_script 
	spawnscriptnow <script_name> params = <script_params>
endscript

script ui_pausemenu_quit_dialog 
	if mc_hasvalidatedfolder
		text = "Are you sure you want to quit to the MAIN MENU? Your current progress will be saved."
	else
		text = "Are you sure you want to quit to the MAIN MENU? You will lose your current progress."
	endif
	create_dialog_box {
		title = "QUIT?"
		text = <text>
		pos = (320.0, 240.0)
		just = [center center]
		pad_back_script = ui_pausemenu_quit_dialog_cancel
		buttons = [
			{font = text_a1 text = "QUIT" pad_choose_script = ui_pausemenu_quit_dialog_accept}
			{font = text_a1 text = "CANCEL" pad_choose_script = ui_pausemenu_quit_dialog_cancel id = no_button}
		]
	}
endscript

script ui_pausemenu_quit_dialog_accept 
	ui_destroy_pausemenu
	dialog_box_exit
	career_quit_to_main
endscript

script ui_pausemenu_quit_dialog_cancel 
	generic_menu_pad_back_sound
	dialog_box_exit
	cas_menu_finish
endscript

script career_quit_to_main 
	change \{memcard_menus_active = 0}
	level_select_change_level_quit \{level = load_z_mainmenu
		no_state_change}
endscript

script ui_pausemenu_add_save_menu_item 
	if NOT infrontend
		if ($memcard_using_autosave = 1)
			params = {pad_choose_script = ui_pausemenu_auto_save}
		else
			params = {choose_state = UIstate_savegame}
		endif
		if isxenon
			if checkforsignin local
				add_cas_menu_item {
					text = "save game"
					<params>
				}
			else
				add_cas_menu_item {
					text = "save game"
					<params>
					not_focusable
				}
			endif
		else
			add_cas_menu_item {
				text = "save game"
				<params>
			}
		endif
	endif
endscript

script ui_pausemenu_auto_save 
	spawnscriptnow \{ui_pausemenu_auto_save_spawned}
endscript

script ui_pausemenu_auto_save_spawned 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	killallmovies
	do_autosave \{immediate
		suspend_ui
		allow_new}
	wait \{2
		gameframes}
	restore_start_key_binding
	pause_game_and_create_pause_menu
endscript

script ui_create_splitscreen_pausemenu 
	make_cas_menu {
		menu_id = pause_menu_anchor
		vmenu_id = pause_vmenu
		title = "PAUSED"
		pausemenu
		pad_back_script = handle_start_pressed
	}
	add_cas_menu_item {
		text = "CONTINUE"
		pad_choose_script = handle_start_pressed
	}
	add_cas_menu_item {
		text = "END CURRENT GAME"
		pad_choose_script = confirm_end_mp_game
	}
	add_cas_menu_item {
		text = "OPTIONS"
		choose_state = UIstate_pauseoptions
	}
	cas_menu_finish
endscript

script confirm_end_mp_game 
	create_dialog_box {
		title = "END GAME?"
		text = "If you end the current game, you will not be able to continue it.\\n\\nAre you sure?"
		pad_back_script = confirm_end_mp_game_cancel
		no_bg
		buttons = [
			{text = "END GAME" pad_choose_script = network_end_game_selected}
			{text = "CANCEL" pad_choose_script = confirm_end_mp_game_cancel}
		]
		no_helper_text
	}
endscript

script confirm_end_mp_game_cancel 
	dialog_box_exit
	if screenelementexists id = current_menu_anchor
		if screenelementexists id = pause_menu
			create_helper_text {
				parent = current_menu_anchor
				helper_text_elements = [
					{text = "\\m0 ACCEPT"}
				]
			}
		else
			create_helper_text {
				parent = current_menu_anchor
				helper_text_elements = [
					{text = "\\m1 BACK"}
					{text = "\\m0 ACCEPT"}
				]
			}
		endif
	endif
endscript

script ui_create_net_pausemenu 
	printf "ui_create_net_pausemenu"
	title = "Online Menu"
	if isxenon
		title = "Xbox LIVE Menu"
	endif
	make_cas_menu {
		menu_id = pause_menu_anchor
		vmenu_id = pause_vmenu
		title = <title>
		pausemenu
		preserve_case
		pad_back_script = handle_start_pressed
	}
	if NOT ishost
		create_messy_white_bg {
			parent = current_menu_anchor
			id = pausemenu_white_bg
		}
		create_game_type_net_rounds_list
		spawnscript game_type_net_rounds_wait_and_refresh
		runscriptonscreenelement {
			id = game_type_round_list_cont
			game_type_round_list_menu_update
		}
		setscreenelementprops {
			id = current_menu
			event_handlers = [
				{pad_square game_type_round_list_menu_enter}
			]
		}
	endif
	add_cas_menu_item {
		text = "continue"
		pad_choose_script = handle_start_pressed
	}
	if ishost
		if gamemodeequals is_lobby
			if NOT NetworkGamePending
				if NOT ChangeLevelPending
					if cd
						netsessionfunc func = getnumplayers
						if (<numplayers> = 1)
							<selectable> = not_focusable
						endif
					endif
					if ($enable_net_rounds = 1)
						if NOT NetRoundFunc func = ready_to_play
							<selectable> = not_focusable
						endif
					endif
					add_cas_menu_item {
						text = "start game"
						pad_choose_script = verify_start_game
						<selectable>
					}
					add_cas_menu_item {
						text = "game type"
						choose_state = UIstate_net_gametype
					}
					add_cas_menu_item {
						text = "change area"
						choose_state = UIstate_pauselevel
					}
					add_cas_menu_item {
						text = "host options"
						choose_state = UIstate_net_hostoptions
					}
				endif
			endif
		else
			add_cas_menu_item {
				text = "end current game"
				pad_choose_script = network_end_game_selected
			}
		endif
	endif
	add_cas_menu_item {
		text = "game options"
		choose_state = UIstate_pauseoptions
	}
	add_cas_menu_item {
		text = "current players"
		id = menu_network_live_options_select
		choose_state = Uistate_net_currentplayers
	}
	if getglobalflag flag = $career_started
		add_cas_menu_item {
			text = "return to singleplayer"
			choose_state = UIstate_net_confirmquit_to_singleplayer
		}
	endif
	if isxenon
		add_cas_menu_item {
			text = "quit to Xbox LIVE lobby"
			choose_state = UIState_net_confirmquit
			text_case = none
		}
	else
		add_cas_menu_item {
			text = "quit to online lobby"
			choose_state = UIState_net_confirmquit
		}
	endif
	if ishost
		cas_menu_finish
	else
		cas_menu_finish helper_text = {
			helper_text_elements = [
				{text = "\\m1 BACK"}
				{text = "\\m0 ACCEPT"}
				{text = "\\m5 GO TO ROUND LIST"}
			]
		}
	endif
endscript

script verify_start_game 
	printf "--- verify_start_game"
	can_start = 1
	if cd
		netsessionfunc func = getnumplayers
		if (<numplayers> = 1)
			can_start = 0
		endif
	endif
	if ($enable_net_rounds = 1)
		if NOT NetRoundFunc func = ready_to_play
			can_start = 0
		endif
	endif
	if (<can_start> = 1)
		chosen_host_game
	else
		ui_change_state state = uistate_pausemenu
	endif
endscript

script create_messy_white_bg {
		parent = current_menu_anchor
		id = net_game_info
	}
	cont_id = <id>
	createscreenelement {
		type = containerelement
		parent = <parent>
		id = <cont_id>
		pos = (640.0, 0.0)
		just = [left top]
		dims = (500.0, 720.0)
		z_priority = -5
	}
	extra_z = 0
	createscreenelement {
		type = spriteelement
		parent = <cont_id>
		texture = white
		rgba = [200 200 200 255]
		dims = (2000.0, 2000.0)
	}
	createscreenelement {
		type = spriteelement
		parent = <cont_id>
		texture = cap_whitenoise_2
		dims = (300.0, 180.0)
		pos = (550.0, 50.0)
		just = [center center]
		rgba = ($goal_ui_scheme.main)
		rot_angle = -40
		z_priority = 0
	}
	createscreenelement {
		type = spriteelement
		parent = <cont_id>
		texture = cap_whitenoise
		dims = (-300.0, 164.0)
		pos = (150.0, 650.0)
		just = [center center]
		rgba = ($goal_ui_scheme.main)
		rot_angle = 75
		z_priority = 0
	}
	createscreenelement {
		type = spriteelement
		parent = <cont_id>
		texture = cap_whitenoise_2
		dims = (300.0, 125.0)
		pos = (0.0, 50.0)
		just = [center center]
		rgba = [0 0 0 128]
		rot_angle = 10
		z_priority = 0
	}
	createscreenelement {
		type = spriteelement
		parent = <cont_id>
		texture = cap_whitenoise_2
		dims = (120.0, 100.0)
		pos = (25.0, 300.0)
		just = [center center]
		rgba = [0 0 0 200]
		rot_angle = -160
		z_priority = 0
	}
	createscreenelement {
		type = spriteelement
		parent = <cont_id>
		texture = cap_whitenoise
		dims = (380.0, 154.0)
		pos = (550.0, 400.0)
		just = [center center]
		rgba = [0 0 0 200]
		rot_angle = 100
		z_priority = 0
	}
endscript

script ui_destroy_pausemenu 
	printf \{"ui_destroy_pausemenu"}
	goal_generic_view_goal_pausemenu_kill
	generic_ui_destroy
	debounce \{triangle
		time = 1.5
		clear = 1}
	debounce \{x
		time = 1.5
		clear = 1}
	debounce \{circle
		time = 1.5
		clear = 1}
	debounce \{square
		time = 1.5
		clear = 1}
endscript
pause_fmv_playing = 0
pause_menu_allow_fmv = 1

script pause_menu_fmv_play 
	spawnscriptnow pause_menu_fmv_play_spawned params = {<...>}
endscript

script pause_menu_fmv_play_spawned 
	setspawninstancelimits max = 1 management = ignore_spawn_request
	if ($pause_menu_allow_fmv = 1)
		pause_menu_fmv_kill
	endif
	if ($pause_fmv_playing = 0)
		change pause_fmv_playing = 1
		GetLevelStructureName
		if NOT infrontend
			<pause_movie> = 'CityMapScreen_010'
		else
			<pause_movie> = 'MainMenu'
		endif
		switch <pause_movie>
			case 'MainMenu'
			<loop_start> = 74
			<loop_end> = 384
			default
			<loop_start> = 22
			<loop_end> = 56
		endswitch
		getcurrentlevel
		if (<level> = load_z_bedroom)
			GetCurrentSkaterProfileIndex
			GetSingleSkaterProfileInfo player = <currentskaterprofileindex> character_type
			GetCharacterPauseMovie character_type = <character_type>
			<loop_start> = 82
		endif
		if ismovieplaying textureslot = 0
			killmovie textureslot = 0
		endif
		crib_wait_for_freeing_binks
		if ($pause_fmv_playing = 1)
			playmovie movie = <pause_movie> textureslot = 0 texturepri = -100 loop_start = <loop_start> loop_end = <loop_end> non_blocking_seeking
		endif
	endif
endscript

script pause_menu_fmv_kill 
	if ($pause_fmv_playing = 1)
		killmovie \{textureslot = 0
			nowait}
	endif
	change \{pause_fmv_playing = 0}
endscript
pause_menu_old_volume = 30
debug_city_map_cams = 0

script pause_menu_show_near_goals 
	return
endscript

script PauseMenuCameraControlScript 
	if NOT gotparam city_map_cam_pos
		return
	endif
	skater :obj_getposition
	<skater_pos> = <pos>
	<cam_to_skater> = (<skater_pos> - <city_map_cam_pos>)
	<init_pos> = (<skater_pos> - (<cam_to_skater> / 10.0))
	ccam_domorph {
		pos = <city_map_cam_pos>
		facing = <cam_to_skater>
		time = 0.0
		locktoworldorientation
	}
	obj_getorientationvectors
	normalizevector <cam_to_skater>
	<left_vector> = (<left_vector> * <length> / 4.0)
	<facing> = (<cam_to_skater> - <left_vector>)
	ccam_domorph {
		pos = <init_pos>
		facing = <facing>
		time = 0
		locktoworldorientation
	}
	ccam_domorph {
		pos = <city_map_cam_pos>
		facing = <facing>
		time = 0.5
		motion = ease_in
		locktoworldorientation
	}
endscript

script pause_menu_hide_near_goals 
	killskatercamanim \{name = pause_menu_camera}
	if screenelementexists \{id = pause_menu_skateboard}
		destroyscreenelement \{id = pause_menu_skateboard}
	endif
	if screenelementexists \{id = city_map_nearest_goals}
		destroyscreenelement \{id = city_map_nearest_goals}
	endif
endscript

script pause_menu_near_goal_icons 
	return
	GMan_GetNearestGoals
	getarraysize <nearest_goals>
	if screenelementexists id = city_map_nearest_goals
		destroyscreenelement id = city_map_nearest_goals
	endif
	createscreenelement {
		id = city_map_nearest_goals
		type = containerelement
		parent = pause_menu_anchor
		scale = 0.2
		no3dscaling
	}
	skater :obj_getposition
	<skater_pos> = <pos>
	<i> = 0
	begin
	<near_goal> = (<nearest_goals> [<i>])
	if pause_menu_should_show_goal_icon goal = <near_goal>
		gman_getgrade goal = <near_goal>
		if gman_haswongoal goal = <near_goal>
			ui_get_grade_icon goal = <near_goal> grade = <grade>
			if checksumequals a = <grade_icon> b = Pause_Classic_Checkmark
				<icon_rgba> = [0 100 0 128]
			else
				<icon_rgba> = [128 128 128 128]
			endif
			goal_get_activate_pos goal = <near_goal>
			createscreenelement {
				parent = city_map_nearest_goals
				type = spriteelement
				texture = <grade_icon>
				pos3d = <activate_pos>
				scale = 0.63
				rgba = <icon_rgba>
				z_priority = -10
				no3dscaling
			}
		endif
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	if screenelementexists id = city_map_nearest_goals
		city_map_nearest_goals :setprops unpause
	endif
endscript

script pause_menu_should_show_goal_icon 
	if ($goals_for_gamemode_loaded = 0)
		return \{false}
	endif
	if checksumequals a = <goal> b = 0
		return \{false}
	endif
	if NOT gman_getconstant goal = <goal> name = trigger_pos
		return \{false}
	endif
	if NOT gamemodeequals \{is_career}
		return \{false}
	endif
	if GMan_GoalIsLocked goal = <goal>
		return \{false}
	endif
	return \{true}
endscript

script ui_create_rank_blurb 
	spawnscriptnow ui_create_ticker params = <...>
endscript

script ui_create_ticker 
	if gotparam ticker
		ticker_items_top = [
			{item = tick_rank item_type = graphic color = [240 240 240 255]}
			{item = song item_type = text color = [240 240 240 255]}
			{item = tick_rank item_type = graphic color = [240 240 240 255]}
			{item = message item_type = text color = [240 240 240 255]}
			{item = tick_rank item_type = graphic color = [240 240 240 255]}
			{item = song item_type = text color = [240 240 240 255]}
			{item = tick_rank item_type = graphic color = [240 240 240 255]}
			{item = message item_type = text color = [240 240 240 255]}
		]
		ticker_items_bottom = [
			{item = tick_rank item_type = graphic color = ($goal_ui_scheme.main)}
			{item = class item_type = text color = ($goal_ui_scheme.main)}
			{item = tick_rank item_type = graphic color = ($goal_ui_scheme.main)}
			{item = points item_type = text color = ($goal_ui_scheme.main)}
			{item = tick_rank item_type = graphic color = ($goal_ui_scheme.main)}
			{item = cash item_type = text color = ($goal_ui_scheme.main)}
			{item = tick_rank item_type = graphic color = ($goal_ui_scheme.main)}
			{item = class item_type = text color = ($goal_ui_scheme.main)}
			{item = tick_rank item_type = graphic color = ($goal_ui_scheme.main)}
			{item = points item_type = text color = ($goal_ui_scheme.main)}
			{item = tick_rank item_type = graphic color = ($goal_ui_scheme.main)}
			{item = cash item_type = text color = ($goal_ui_scheme.main)}
		]
		removeparameter ticker
	else
		ticker_items_top = [
			{item = tick_rank item_type = graphic color = [240 240 240 255]}
			{item = song item_type = text color = [240 240 240 255]}
			{item = tick_rank item_type = graphic color = [240 240 240 255]}
			{item = message item_type = text color = [240 240 240 255]}
			{item = tick_rank item_type = graphic color = [240 240 240 255]}
			{item = song item_type = text color = [240 240 240 255]}
			{item = tick_rank item_type = graphic color = [240 240 240 255]}
			{item = message item_type = text color = [240 240 240 255]}
		]
		ticker_items_bottom = [
			{item = tick_rank item_type = graphic color = ($goal_ui_scheme.main)}
			{item = class item_type = text color = ($goal_ui_scheme.main)}
			{item = tick_rank item_type = graphic color = ($goal_ui_scheme.main)}
			{item = cash item_type = text color = ($goal_ui_scheme.main)}
			{item = tick_rank item_type = graphic color = ($goal_ui_scheme.main)}
			{item = class item_type = text color = ($goal_ui_scheme.main)}
			{item = tick_rank item_type = graphic color = ($goal_ui_scheme.main)}
			{item = cash item_type = text color = ($goal_ui_scheme.main)}
		]
	endif
	getarraysize <ticker_items_top>
	spawnscriptnow ui_ticker_add_item params = {
		total_items = <array_size>
		i = 0
		rate = 120.0
		spacer = 60
		array = <ticker_items_top>
		parent = pause_ticker_container_top
		pos = (-450.0, 0.0)
	}
	getarraysize <ticker_items_bottom>
	spawnscriptnow ui_ticker_add_item params = {
		total_items = <array_size>
		i = 0
		rate = 80
		spacer = 60
		array = <ticker_items_bottom>
		parent = pause_ticker_container_bottom
		pos = (-320.0, 0.0)
	}
endscript

script ui_ticker_add_item 
	if NOT screenelementexists id = <parent>
		return
	endif
	if structurecontains structure = (<array> [<i>]) item
		ticker_item = ((<array> [<i>]).item)
		if (<ticker_item> = song)
			ui_ticker_get_song
		elseif (<ticker_item> = cash)
			careerfunc func = GetCash
			formattext textname = text "cash: $%c.00" c = <cash>
		elseif (<ticker_item> = class)
			get_strongest_lifestyle
			switch (<strongest_lifestyle>)
				case generic
				text = "you're pretty generic!"
				case rigger
				text = "you're a rigging machine!"
				case hardcore
				text = "you're totally hardcore!"
				case career
				text = "you've got a career!"
			endswitch
		elseif (<ticker_item> = points)
			GetSkillPoints
			formattext textname = text "skill points: %a" a = (<skill_points>.generic)
		elseif (<ticker_item> = message)
			getarraysize $ui_pausemenu_message_of_the_day
			mod b = <array_size> a = (RandomRange (1.0, 32767.0))
			casttointeger mod
			text = (($ui_pausemenu_message_of_the_day [<mod>]).text)
		endif
	else
		text = "UNDEFINED OR NO TEXT"
	endif
	formattext checksumname = item_id 'item_%n' n = <i>
	manglechecksums a = <item_id> b = <parent>
	item_id = <mangled_id>
	if screenelementexists id = <item_id>
		destroyscreenelement id = <item_id>
	endif
	if structurecontains structure = (<array> [<i>]) item_type
		item_type = ((<array> [<i>]).item_type)
	endif
	color = ((<array> [<i>]).color)
	if (<item_type> = text)
		createscreenelement {
			type = textelement
			id = <item_id>
			parent = <parent>
			font = text_a1
			scale = (1.0, 0.9)
			text = <text>
			just = [right center]
			font_spacing = 2
			rgba = <color>
			alpha = 1
			shadow
			shadow_offs = (2.0, 2.0)
			shadow_rgba = [0 0 0 255]
		}
		nudge = (0.0, 4.0)
	elseif (<item_type> = graphic)
		texture = ((<array> [<i>]).item)
		createscreenelement {
			type = spriteelement
			id = <item_id>
			parent = <parent>
			texture = <texture>
			just = [right center]
			scale = (0.75, 1.0)
			rgba = <color>
			alpha = 1
		}
		nudge = (0.0, 0.0)
	endif
	if NOT gotparam pos
		pos = (200.0, 0.0)
	endif
	getscreenelementdims id = <item_id>
	item_width = (<width> + <spacer>)
	pos_a = (<pos> - (50.0, 0.0))
	item_pos = (<pos_a> + (<item_width> * (1.0, 0.0)))
	setscreenelementprops id = <item_id> pos = <item_pos>
	distance = (4000)
	time = (<distance> / <rate>)
	target_pos = (<item_pos> - (<distance> * (1.0, 0.0)))
	removeparameter pos
	removeparameter item_pos
	removeparameter item_width
	removeparameter pos_a
	removeparameter distance
	removeparameter nudge
	removeparameter color
	removeparameter text
	removeparameter ticker_item
	removeparameter texture
	removeparameter item_type
	if screenelementexists id = <item_id>
		runscriptonscreenelement id = <item_id> ui_ticker_scroll_item params = {<...>}
	endif
endscript

script ui_ticker_scroll_item 
	spawnscriptnow ui_ticker_queue_next_item params = {<...>}
	domorph time = <time> pos = <target_pos>
	die
endscript

script ui_ticker_queue_next_item 
	begin
	if screenelementexists id = <item_id>
		getscreenelementprops id = <item_id>
		pos_x = (<pos>.(1.0, 0.0))
		if ((<pos_x>) < 100)
			<i> = (<i> + 1)
			if ((<i> + 1) > <total_items>)
				<i> = 0
			endif
			ui_ticker_add_item <...>
			return
		endif
		wait \{1
			gameframe}
	else
		return
	endif
	repeat
endscript

script ui_ticker_get_song 
	getarraysize $playlist_tracks
	<t> = 0
	<toggled_on> = 0
	begin
	if NOT IsTrackForbidden ($playlist_tracks [<t>].asset)
		<toggled_on> = (<toggled_on> + 1)
		break
	endif
	<t> = (<t> + 1)
	repeat <array_size>
	if NOT (($current_user_music_vol = 0) || (<toggled_on> = 0))
		GetNowPlayingTrackInfo
		<current_band_text> = <trackartist>
		<current_track_text> = <tracktitle>
		text = "NOW PLAYING:"
		if gotparam current_band_text
			formattext textname = text "%s %a" s = <text> a = <current_band_text>
			if gotparam current_track_text
				formattext textname = text "%s - %t" s = <text> t = <current_track_text>
				if gotparam current_track_genre
					formattext textname = text "%s (%g)" s = <text> g = <current_track_genre>
				endif
			endif
		endif
	else
		<text> = "Soundtrack is OFF. Crank up the tunes and see song info here!"
	endif
	return text = <text>
endscript

script ui_ticker_refresh 
	if screenelementexists \{id = pause_ticker_container_master}
		ui_create_ticker
	endif
endscript

script create_pause_back title = "pause" parent = root_window width = 475
	hide_all_hud_items
	destroy_pause_back
	crib_kill_bink_immediate
	if gman_getactivatedgoalid
		gman_getgoaltype goal = <activated_goal_id>
		if ((<goal_type> = classic) || (<goal_type> = hawkman) || (<goal_type> = high_score_run))
			create_classic_pause_back <...>
			return
		endif
	endif
	if NOT gotparam CasMenu
		if NOT infrontend
			if NOT innetgame
				if NOT insplitscreengame
					playigccam {
						name = ui_pausemenu_cam
						controlscript = igc_aim_at_face
						params = {
							dist = 2.0
							y_pos = 0.893478
							screenoffset = (0.3, -0.5)
						}
						update_when_paused
						play_hold
						allow_pause = 1
					}
				endif
			endif
		endif
	endif
	create_pause_map <...>
	if screenelementexists id = pause_map_container
		if NOT gotparam PauseMap
			doscreenelementmorph id = pause_map_container alpha = 0.0
		else
			doscreenelementmorph id = pause_map_container alpha = 1.0
		endif
	endif
	createscreenelement {
		type = containerelement
		parent = <parent>
		id = pause_back_container
	}
	<messy_pos> = (-50.0, 0.0)
	if gotparam MenuOffset
		pause_back_container :domorph pos = {<MenuOffset> relative}
		<messy_pos> = (<messy_pos> + <MenuOffset>)
	endif
	ui_create_messy_background {
		parent = <parent>
		messy_id = pause_back_messy
		dims = ((0.0, 1000.0) + ((1.25, 0.0) * <width>))
		pos = <messy_pos>
		z_priority = -2
		rot_angle = RandomRange (-13.0, -10.0)
	}
	if NOT gotparam noNoise
		createscreenelement {
			type = spriteelement
			parent = pause_back_container
			texture = cap_whitenoise
			pos = (270.0, 150.0)
			just = [center center]
			dims = (400.0, 120.0)
			rgba = [240 240 240 235]
			rot_angle = RandomNoRepeat (@ 6 @ 3 @ 178 @ 185 @ -4 @ -3 @ -179 @ -184 )
			z_priority = 1
		}
		createscreenelement {
			type = spriteelement
			parent = pause_back_container
			texture = cap_whitenoise
			pos = (160.0, 0.0)
			just = [center center]
			dims = (200.0, 150.0)
			rgba = [240 240 240 205]
			rot_angle = RandomNoRepeat (@ 6 @ 3 @ 178 @ 185 @ -4 @ -3 @ -179 @ -184 )
			z_priority = 0
		}
		createscreenelement {
			type = spriteelement
			parent = pause_back_container
			texture = cap_whitenoise
			pos = ((10.0, 520.0) + ((1.0, 0.0) * <width>))
			just = [center center]
			dims = (250.0, 190.0)
			rgba = [220 220 220 150]
			rot_angle = RandomNoRepeat (@ -60 @ -55 @ -90 @ -80 )
			z_priority = 0
		}
		createscreenelement {
			type = spriteelement
			parent = pause_back_container
			texture = cap_whitenoise
			pos = (210.0, 565.0)
			just = [center center]
			dims = (170.0, 130.0)
			rgba = [200 200 200 100]
			rot_angle = RandomNoRepeat (@ 25 @ -25 @ 20 @ -20 @ 200 @ -200 )
			z_priority = 0
			flip_v
		}
	endif
	createscreenelement {
		type = containerelement
		parent = pause_back_container
		id = pause_title_container
		pos = (0.0, 150.0)
		child_anchor = [left center]
	}
	if NOT gotparam notitle
		createscreenelement {
			type = spriteelement
			parent = pause_title_container
			just = [-1 -0.5]
			pos = (0.0, 0.0)
			dims = ((0.0, 96.0) + ((1.0, 0.0) * (<width> + 82)))
			rgba = ($goal_ui_scheme.main)
			texture = menu_headerbar
			z_priority = 0
			flip_v
		}
		createscreenelement {
			type = textelement
			parent = pause_title_container
			id = pause_title_text
			font = text_a1
			text = <title>
			just = [left center]
			pos = (145.0, 5.0)
			rgba = [230 230 230 255]
			shadow
			shadow_rgba = [0 0 0 255]
			shadow_offs = (3.0, 3.0)
			z_priority = 2
			scale = (1.1, 1.0)
		}
	endif
	if gotparam CasMenu
		pause_title_text :domorph pos = {(-50.0, 0.0) relative}
	endif
	if NOT gotparam nobg
		pause_menu_bg_elements parent = pause_back_container
	endif
	if NOT gman_hasactivegoals
		if gotparam icon
			if NOT infrontend
				if gamemodeequals is_career
					runscriptonscreenelement id = root_window ui_pausemenu_play_icon params = {
						sponsor
					}
				endif
			endif
		else
			if screenelementexists id = pausemenu_icon_movie
				destroyscreenelement id = pausemenu_icon_movie
			endif
		endif
		if ((gotparam ticker) || (gotparam net_ticker))
			createscreenelement {
				type = containerelement
				parent = pause_back_container
				pos = (1280.0, 720.0)
				rot_angle = -25
			}
			if gotparam net_ticker
				doscreenelementmorph {
					id = <id>
					pos = {(0.0, 65.0) relative}
				}
			endif
			<parent> = <id>
			createscreenelement {
				parent = <parent>
				type = spriteelement
				texture = menu_headerbar
				pos = (-275.0, -280.0)
				dims = (1000.0, 210.0)
				just = [center top]
				rgba = [0 0 0 255]
				z_priority = 9
			}
			createscreenelement {
				parent = <parent>
				type = spriteelement
				texture = menu_headerbar
				pos = (-275.0, -273.0)
				dims = (1000.0, 128.0)
				just = [center center]
				rgba = ($goal_ui_scheme.main)
				z_priority = 10
			}
			createscreenelement {
				type = containerelement
				parent = <parent>
				id = pause_ticker_container_top
				just = [center center]
				pos = (0.0, -300.0)
				z_priority = 12
			}
			createscreenelement {
				type = containerelement
				parent = <parent>
				id = pause_ticker_container_bottom
				just = [center center]
				pos = (0.0, -240.0)
				z_priority = 12
			}
			param = {}
			if gotparam ticker
				param = {ticker}
			endif
			runscriptonscreenelement id = pause_back_container ui_create_ticker params = <param>
		endif
	endif
	if NOT gman_hasactivegoals
		if gotparam ProgressBar
			runscriptonscreenelement id = pause_back_container ui_pausemenu_show_progress_bar
		endif
	endif
endscript

script pause_back_controlscript 
	ccam_setcollision \{true}
	ccam_domorph \{lockto = skater
		pos = (0.046837, 0.893478, 2.527421)
		quat = (-0.00245, -0.99179494, -0.019227998)
		fov = 72.0}
endscript

script create_classic_pause_back 
	createscreenelement {
		type = containerelement
		parent = <parent>
		id = pause_back_container
	}
	<height> = 580
	<width> = 450
	<pos> = (((1.0, 0.0) * (<width> / 2)) + ((0.0, 1.0) * (<height> / 2)) + (100.0, 100.0))
	createscreenelement {
		type = containerelement
		parent = pause_back_container
		id = arcade_menu_bg_container
		pos = (<pos> + (315.0, -55.0))
		child_anchor = [left center]
		scale = 2.0
	}
	goal_arcade_menu_bg {
		parent = arcade_menu_bg_container
		local_id = arcade_menu_bg
		width = 560
		height = ((<height> + 20) / 2)
		z_priority = -2
		bg_rgba = [60 170 255 100]
	}
	goal_arcade_menu_bg {
		parent = arcade_menu_bg_container
		local_id = arcade_menu_shadow
		pos = (2.0, 2.0)
		width = 560
		height = ((<height> + 20) / 2)
		z_priority = -3
		fg_rgba = [0 0 0 255]
		nobg
	}
	createscreenelement {
		type = containerelement
		parent = pause_back_container
		id = pause_title_container
		pos = (0.0, 150.0)
		child_anchor = [left center]
	}
	createscreenelement {
		type = textelement
		parent = pause_title_container
		id = pause_title_text
		font = text_a1
		text = <title>
		just = [left center]
		pos = (145.0, 5.0)
		rgba = [230 230 230 255]
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (3.0, 3.0)
		z_priority = 2
		scale = (1.1, 1.0)
	}
	getscreenelementdims id = pause_title_text
	<color> = ($goal_ui_scheme.main)
	setarrayelement arrayname = color index = 3 newvalue = 64
	goal_arcade_menu_bg {
		parent = pause_title_container
		local_id = bg
		pos = (((0.5, 0.0) * <width>) + (145.0, 5.0))
		width = (<width> + 40)
		height = (<height> + 20)
		z_priority = 1
		bg_rgba = [60 170 255 100]
	}
	goal_arcade_menu_bg {
		parent = pause_title_container
		local_id = shadow
		width = (<width> + 40)
		height = (<height> + 20)
		z_priority = 0
		pos = (((0.5, 0.0) * <width>) + (147.0, 7.0))
		fg_rgba = [0 0 0 255]
		nobg
	}
endscript

script ui_pausemenu_play_icon scale_mod = 1.0
	setspawninstancelimits max = 1 management = ignore_spawn_request
	gettags
	if infrontend
		return
	endif
	if isps3
		return
	endif
	if NOT gotparam sponsor
		if NOT gotparam movie
			movie = ($goal_ui_scheme.icon_movie)
		endif
		if NOT gotparam milestone_icon
			get_milestone_icon
		endif
		if (<milestone_icon> = am)
			pos = (<pos> + (0.0, 40.0))
			if gotparam left
				pos = (<pos> + (20.0, 0.0))
				if ((<movie> = 'icons_generic') || (<movie> = 'icons_online'))
					pos = (<pos> + (80.0, 0.0))
				endif
			endif
			if gotparam left2
				if ((<movie> = 'icons_generic') || (<movie> = 'icons_online'))
					pos = (<pos> + (20.0, 0.0))
				endif
			endif
			movie_params = {
				start_frame = 0
				loop_start = 0
				loop_end = 30
			}
		elseif (<milestone_icon> = pro)
			movie_params = {
				start_frame = 33
				loop_start = 33
				loop_end = 62
			}
		else
			movie_params = {
				start_frame = 65
				loop_start = 65
				loop_end = 94
			}
		endif
	else
		<id> = root_window
		if NOT gotparam movie
			movie = 'sponsor_logos'
		endif
		get_milestone_progress
		switch <current_milestone>
			case milestone_am
			careerfunc func = getsponsor params = {type = Clothing_Accessories}
			case milestone_pro
			careerfunc func = getsponsor params = {type = Clothing_Accessories}
			case milestone_deck
			careerfunc func = getsponsor params = {type = deck}
			case milestone_shoes
			careerfunc func = getsponsor params = {type = Clothing_Accessories}
			case milestone_start_team
			case milestone_built_team
			careerfunc func = getsponsor params = {type = Clothing_Accessories}
			default
			return
		endswitch
		movie_params = {
			start_frame = (<sponsor_info>.frame)
			loop_start = (<sponsor_info>.frame)
			loop_end = (<sponsor_info>.frame)
			no_looping
		}
		<scale_mod> = 0.25
		if NOT gotparam pos
			pos = (950.0, 50.0)
		endif
		temp_pos = <pos>
		pos = (10000.0, 10000.0)
	endif
	if screenelementexists id = pausemenu_icon_movie
		destroyscreenelement id = pausemenu_icon_movie
	endif
	if ismovieplaying textureslot = 0
		killallmovies
	endif
	createscreenelement {
		type = movieelement
		id = pausemenu_icon_movie
		parent = <id>
		pos = <pos>
		movie = <movie>
		textureslot = 0
		scale = ((820.0, 461.0) * <scale_mod>)
		z_priority = 500
		<movie_params>
	}
	if gotparam temp_pos
		wait 5 gameframes
		if screenelementexists id = pausemenu_icon_movie
			doscreenelementmorph id = pausemenu_icon_movie pos = <temp_pos>
		endif
	endif
endscript

script ui_pausemenu_show_progress_bar parent = pause_back_container pos = (150.0, 90.0) scale = 0.75
	<bar_max_w> = 290
	<bar_dims> = (0.0, 24.0)
	get_milestone_progress
	if gotparam progress_to_next_milestone
		<bar_dims> = (<bar_dims> + ((1.0, 0.0) * (<bar_max_w> * <progress_to_next_milestone>)))
	else
		<bar_dims> = (<bar_dims> + ((1.0, 0.0) * (<bar_max_w>)))
	endif
	if gotparam next_milestone
		get_milestone_ui_info milestone = <next_milestone>
		formattext textname = title "next up: %s" s = (<milestone_ui_info>.title)
	else
		if gman_haswongoal goal = m_team_film
			title = "story complete!"
		else
			title = "TEAM BUILT"
		endif
	endif
	if gotparam anchor_id
		if screenelementexists id = <anchor_id>
			destroyscreenelement id = <anchor_id>
		endif
	endif
	createscreenelement {
		id = <anchor_id>
		parent = <parent>
		type = containerelement
		pos = <pos>
		scale = <scale>
		dims = (0.0, 50.0)
	}
	<parent> = <id>
	createscreenelement {
		type = textelement
		parent = <parent>
		font = text_a1
		text = <title>
		rgba = ($goal_ui_scheme.main)
		scale = (0.9, 0.75)
		pos = (0.0, 4.0)
		just = [left bottom]
	}
	createscreenelement {
		type = spriteelement
		parent = <parent>
		texture = white
		dims = (300.0, 32.0)
		pos = (0.0, -1.0)
		just = [left top]
		rgba = [160 160 160 255]
	}
	createscreenelement {
		type = spriteelement
		parent = <parent>
		texture = white
		dims = (300.0, 32.0)
		pos = (0.0, -1.0)
		just = [left top]
		rgba = [80 80 80 255]
		z_priority = 8
	}
	createscreenelement {
		type = spriteelement
		parent = <parent>
		texture = white
		dims = (290.0, 26.0)
		pos = (5.0, 2.0)
		just = [left top]
		rgba = [0 0 0 205]
		z_priority = 9
	}
	createscreenelement {
		type = spriteelement
		parent = <parent>
		texture = vided_clip_grunge
		blend = add
		dims = (288.0, 25.0)
		pos = (7.0, 2.0)
		just = [left top]
		rgba = [90 90 90 255]
		z_priority = 10
		Random (@ flip_h @ flip_v @ )
	}
	createscreenelement {
		type = windowelement
		parent = <parent>
		dims = <bar_dims>
		pos = (5.0, 3.0)
		just = [left top]
	}
	<bar_container> = <id>
	createscreenelement {
		type = spriteelement
		parent = <bar_container>
		texture = white
		dims = <bar_dims>
		pos = (0.0, 0.0)
		just = [left top]
		rgba = ($goal_ui_scheme.main)
		z_priority = 10
	}
	if gotparam fake_morph
		if ((-10 + (<bar_dims> [0])) > 0)
			setscreenelementprops {
				id = <bar_container>
				dims = (<bar_dims> + ((1.0, 0.0) * -10))
			}
		else
			setscreenelementprops {
				id = <bar_container>
				dims = ((1.0, 0.0) + ((0.0, 1.0) * (<bar_dims> [1])))
			}
		endif
		wait 0.5 seconds ignoreslomo
		<x> = -10
		begin
		if ((<x> + (<bar_dims> [0])) > 0)
			setscreenelementprops {
				id = <bar_container>
				dims = (<bar_dims> + ((1.0, 0.0) * <x>))
			}
		else
		endif
		<x> = (<x> + 1)
		wait 1 gameframe
		repeat 10
		wait 5 seconds ignoreslomo
	endif
endscript

script change_pause_title 
	if NOT gotparam \{title}
		printf \{"send in the title"}
		return
	endif
	if screenelementexists \{id = pause_title_text}
		setscreenelementprops {
			id = pause_title_text
			text = <title>
		}
	endif
endscript

script destroy_pause_back 
	if screenelementexists \{id = pause_back_container}
		destroyscreenelement \{id = pause_back_container}
	endif
	if screenelementexists \{id = pause_back_messy}
		destroyscreenelement \{id = pause_back_messy}
	endif
endscript

script pause_menu_bg_elements 
	createscreenelement {
		type = containerelement
		parent = <parent>
		id = map_vignette_container
		just = [left top]
		pos = (400.0, 0.0)
		dims = (1280.0, 720.0)
		scale = (2.0, 1.25)
		alpha = 1
		z_priority = -5.1
	}
	createscreenelement {
		type = spriteelement
		parent = map_vignette_container
		texture = map_bg_vignette
		dims = (256.0, 256.0)
		just = [right bottom]
		rgba = [0 0 0 125]
		pos = (256.0, 256.0)
	}
	createscreenelement {
		type = spriteelement
		parent = map_vignette_container
		texture = map_bg_vignette
		dims = (256.0, 256.0)
		just = [left bottom]
		rgba = [0 0 0 125]
		pos = (256.0, 256.0)
		flip_v
	}
	createscreenelement {
		type = spriteelement
		parent = map_vignette_container
		texture = map_bg_vignette
		dims = (256.0, 256.0)
		just = [right top]
		rgba = [0 0 0 125]
		pos = (256.0, 256.0)
		flip_h
	}
	createscreenelement {
		type = spriteelement
		parent = map_vignette_container
		texture = map_bg_vignette
		dims = (256.0, 256.0)
		just = [left top]
		rgba = [0 0 0 125]
		pos = (256.0, 256.0)
		flip_h
		flip_v
	}
	createscreenelement {
		type = spriteelement
		parent = map_vignette_container
		texture = white
		dims = (1280.0, 180.0)
		just = [left bot]
		rgba = [0 0 0 255]
		pos = (-600.0, -85.0)
	}
	createscreenelement {
		type = spriteelement
		parent = map_vignette_container
		texture = white
		dims = (1280.0, 250.0)
		just = [left top]
		rgba = [0 0 0 255]
		pos = (-600.0, 510.0)
	}
	createscreenelement {
		type = spriteelement
		parent = map_vignette_container
		texture = white
		dims = (605.0, 610.0)
		just = [left top]
		rgba = [0 0 0 255]
		pos = (-600.0, -45.0)
		z_priority = -4.0
	}
endscript

script create_pause_map 
	if NOT screenelementexists id = pause_map_container
		createscreenelement {
			type = containerelement
			parent = root_window
			id = pause_map_container
			dims = (1280.0, 720.0)
			pos = (0.0, 0.0)
			just = [left top]
			alpha = 0.0
		}
		createMap {
			parent = pause_map_container
			container_id = pause_map
			container_type = containerelement
			texture = pause_map
			container_dims = (512.0, 512.0)
			container_just = [center center]
			container_pos = (900.0, 360.0)
			z_priority = -10
			movespeed = 32 left = -0.75 right = 0.75 top = -1.15 bottom = 0.75
			start_scale = 0.75 min_scale = 0.75 max_scale = 1.5 zoomspeed = 0.01
		}
		createscreenelement {
			type = spriteelement
			parent = pause_map_container
			texture = white
			rgba = [0 0 0 255]
			pos = {(0.5, 0.5) proportional}
			dims = (1280.0, 720.0)
			z_priority = -20
		}
	else
		if NOT gotparam PauseMap
			destroyscreenelement id = pause_map_container
		endif
	endif
endscript

script ui_prompt_to_quit_goal 
	if ($goal_disable_quit_box = 1)
		goal_quit_current_goal
	else
		create_dialog_box {
			title = "quit goal"
			text = "Do you want to quit the goal? You will lose any goal progress."
			pad_back_script = ui_prompt_to_quit_goal_response
			pad_back_params = {quit = false}
			buttons = [
				{
					text = "quit"
					pad_choose_script = ui_prompt_to_quit_goal_response
					pad_choose_params = {quit = true}
				}
				{
					text = "cancel"
					pad_choose_script = ui_prompt_to_quit_goal_response
					pad_choose_params = {quit = false}
				}
			]
			no_helper_text
		}
	endif
endscript

script ui_prompt_to_quit_goal_response 
	dialog_box_exit
	if (<quit> = true)
		goal_quit_current_goal
	endif
endscript

script ui_prompt_to_end_run 
	if ($goal_disable_quit_box = 1)
		goal_end_run_script_launcher end_run_script = <end_run_script>
	else
		create_dialog_box {
			title = "end run"
			text = "Do you want to end your current attempt?"
			pad_back_script = ui_prompt_to_end_run_response
			pad_back_params = {quit = false end_run_script = <end_run_script>}
			buttons = [
				{
					text = "end run"
					pad_choose_script = ui_prompt_to_end_run_response
					pad_choose_params = {quit = true end_run_script = <end_run_script>}
				}
				{
					text = "cancel"
					pad_choose_script = ui_prompt_to_end_run_response
					pad_choose_params = {quit = false end_run_script = <end_run_script>}
				}
			]
			no_helper_text
		}
	endif
endscript

script ui_prompt_to_end_run_response 
	requireparams \{[
			end_run_script
		]
		all}
	dialog_box_exit
	if (<quit> = true)
		goal_end_run_script_launcher end_run_script = <end_run_script>
	endif
endscript
ui_pausemenu_message_of_the_day = [
	{
		text = "PRO TIP: You can upgrade your skills in the My Skater menu."
	}
	{
		text = "PRO TIP: Practice makes perfect!"
	}
	{
		text = "PRO TIP: Keep bailing during grinds? Increase your total grind distance to balance easier"
	}
	{
		text = "PRO TIP: Revert to manuals are the best way to string together sick combos on verts"
	}
	{
		text = "PRO TIP: Doing a boneless instead of a regular ollie will drastically increase your airtime"
	}
	{
		text = "PRO TIP: High lines can be hard to find, but they're awesome to skate"
	}
	{
		text = "PRO TIP: Completing street goals is a good way to win some extra cash and skill points"
	}
	{
		text = "PRO TIP: Nail the X too fancy for you? Play arcade machines and shred it up oldschool style"
	}
	{
		text = "PRO TIP: The Aggro Kick is an awesome way to build up a lot of speed"
	}
	{
		text = "PRO TIP: Complete goals to win new clothes"
	}
	{
		text = "PRO TIP: Complete goals to win new bling for the Skate Lounge"
	}
	{
		text = "PRO TIP: Complete goals to win new rigging items"
	}
	{
		text = "PRO TIP: Need more cash? Try competing against your friends online"
	}
	{
		text = "PRO TIP: Enter Nail The Trick mode by pressing down both thumbsticks at the same time"
	}
	{
		text = "PRO TIP: Focus mode increases your concentration and makes it seem like time slows down"
	}
	{
		text = "PRO TIP: Press \\b0 to grind"
	}
	{
		text = "PRO TIP: Press \\m2 to enter rigger mode"
	}
	{
		text = "PRO TIP: Bored of your look? Class yourself in the create-a-skater in the Skate Lounge"
	}
	{
		text = "PRO TIP: Does video editing seem daunting? Watch the Video Editor's tutorial vids"
	}
	{
		text = "PRO TIP: If you get stuck on a harder goal, try to beat some easier goals of a different class"
	}
	{
		text = "PRO TIP: Skate like you mean it!"
	}
]
