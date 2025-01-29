
script ui_init_pausemenu 
	if ($is_network_game)
		enableallinput \{OFF}
	endif
	if ScreenElementExists \{id = celeb_intro_ui_cont}
		celeb_intro_ui_cont :se_setprops \{alpha = 0.0
			time = 0.1}
	endif
endscript

script ui_create_pausemenu \{for_practice = 0}
	if ($is_network_game = 1)
		spawn_player_drop_listeners \{drop_player_script = pause_drop_player
			end_game_script = pause_end_game}
	endif
	enable_pause
	player_device = ($last_start_pressed_device)
	Player = 1
	i = 1
	begin
	getplayerinfo <i> controller
	if (<controller> = <player_device>)
		Player = <i>
		break
	endif
	i = (<i> + 1)
	repeat ($current_num_players)
	SoundEvent \{event = pause_menu_sfx}
	vocals_mute_all_mics \{mute = true}
	if NOT ($guitar_motion_enable_test = 1)
		if (<controller> >= 4)
			title_text = qs(0xc1230ff4)
		else
			if ($g_in_tutorial = 1)
				title_text = <tutorial_pause_title>
			else
				title_text = qs(0x662aaaf7)
			endif
			if NOT isSinglePlayerGame
				formatText TextName = title_text qs(0x6caaee30) p = <Player>
			endif
		endif
		if ($g_in_tutorial = 1)
			if (<tutorial_failed> = 0)
				<pad_back_script> = tutorial_resume
			else
				<pad_back_script> = nullscript
			endif
		else
			<pad_back_script> = ui_pausemenu_exit
		endif
		ui_pausemenu_create_bg title_text = <title_text>
		if pausemenu_bg :desc_resolvealias \{Name = alias_menu}
			<parent> = <resolved_id>
		endif
		make_menu {
			parent = <parent>
			centered_offset = (-400.0, -275.0)
			pad_back_script = <pad_back_script>
			exclusive_device = <player_device>
			extra_z = 600
			centered
			spacing_between = -10
			nobg
		}
	else
		make_menu {
			pad_back_script = ui_pausemenu_exit
			exclusive_device = <player_device>
			centered
			nobg
			centered_offset = (400.0, 0.0)
			spacing_between = 0
		}
	endif
	if ($special_event_stage != 0)
		if ($current_special_event_num = 1)
			format_time_from_seconds time = ($total_special_event_time)
			total_time = <time_formatted>
			getspecialeventtimer
			format_time_from_seconds time = <time>
			time_left = <time_formatted>
			formatText TextName = timer_text qs(0x3b0d331b) a = <total_time> b = <time_left>
			add_menu_item {
				text = <timer_text>
				not_focusable
			}
			format_time_from_seconds time = ($special_event_total_expense_time / 1000)
			add_menu_item {
				text = (qs(0x7a28420a) + <time_formatted>)
				not_focusable
			}
			add_menu_item \{text = qs(0x4f636726)
				pad_choose_script = ui_pausemenu_exit}
			add_menu_item \{text = qs(0xb4b6d5d4)
				pad_choose_script = paused_special_event_start_again}
			add_menu_item \{text = qs(0x2ebc4f15)
				pad_choose_script = paused_special_event_quit_segment}
			add_menu_item \{text = qs(0x44d65516)
				pad_choose_script = paused_special_event_quit_challenge}
		elseif ($current_special_event_num = 2)
			getspecialeventtimer
			format_time_from_seconds time = <time>
			add_menu_item {
				text = (qs(0x4aea9ebd) + <time_formatted>)
				not_focusable
			}
			continue_practicing_text = qs(0x56f59d0b)
			if ($special_event_stage = 2)
				<continue_practicing_text> = qs(0x50ad601d)
			endif
			add_menu_item {
				text = <continue_practicing_text>
				pad_choose_script = ui_pausemenu_exit
			}
			if ($special_event_stage = 1)
				add_menu_item \{text = qs(0xba34e48f)
					pad_choose_script = special_event_2_ingame_setup}
			endif
			add_menu_item \{text = qs(0x44d65516)
				pad_choose_script = paused_special_event_quit_challenge}
		endif
	else
		if ($g_in_tutorial = 1)
			if (<tutorial_failed> = 1)
				add_menu_item \{text = qs(0x5d8b66a0)
					pad_choose_script = tutorial_restart}
				add_menu_item \{text = qs(0xfceafb8f)
					pad_choose_script = tutorial_skip_lesson}
			else
				add_menu_item \{text = qs(0x4f636726)
					pad_choose_script = tutorial_resume}
				add_menu_item \{text = qs(0xb8790f2f)
					pad_choose_script = tutorial_restart_warning}
				add_menu_item \{text = qs(0xfceafb8f)
					pad_choose_script = tutorial_skip_lesson}
			endif
		else
			add_menu_item \{text = qs(0x4f636726)
				pad_choose_script = ui_pausemenu_exit}
			if ($is_network_game = 0)
				if ($battle_do_or_die = 0)
					if ($end_credits = 0)
						add_menu_item \{text = qs(0xb8790f2f)
							choose_state = uistate_pausemenu_restart_warning}
					endif
				endif
			endif
		endif
		if (<for_practice> = 1 || $game_mode = training)
			if NOT playerinfoequals \{1
					part = vocals}
				add_menu_item \{text = qs(0xcc2da18b)
					choose_state = uistate_pausemenu_quit_warning
					choose_state_data = {
						option2_text = qs(0xcc2da18b)
						option2_func = {
							quit_warning_select_quit
							params = {
								callback = generic_event_back
								data = {
									state = uistate_practice_select_speed
								}
							}
						}
					}}
			endif
			add_menu_item \{text = qs(0x68bd3039)
				choose_state = uistate_pausemenu_quit_warning
				choose_state_data = {
					option2_text = qs(0x68bd3039)
					option2_func = {
						quit_warning_select_quit
						params = {
							callback = generic_event_back
							data = {
								state = uistate_select_song_section
							}
						}
					}
				}}
			if ($came_to_practice_from = main_menu)
				add_menu_item \{text = qs(0x3e482764)
					choose_state = uistate_pausemenu_quit_warning
					choose_state_data = {
						option2_text = qs(0x3e482764)
						option2_func = {
							quit_warning_select_quit
							params = {
								callback = song_ended_menu_select_new_song
							}
						}
					}}
			endif
			add_menu_item {
				text = qs(0x976cf9e7)
				choose_state = uistate_pause_options
				choose_state_data = {player_device = <player_device> Player = <Player>}
			}
		elseif NOT ($g_in_tutorial = 1)
			if ($is_network_game = 0)
				gamemode_gettype
				if ($current_song = jamsession)
					if NOT ui_event_exists_in_stack \{Name = 'jam'}
						if (<Type> = quickplay)
							if ($num_quickplay_song_list > 1)
								add_menu_item \{choose_state = uistate_pausemenu_quit_warning
									choose_state_data = {
										option2_text = qs(0xef74f7d2)
										option2_func = quickplay_skip_song
										failed_song
									}
									text = qs(0xef74f7d2)}
							endif
						endif
					endif
				else
					if NOT ($game_mode = p2_pro_faceoff || $game_mode = p2_faceoff || $game_mode = p2_battle)
						if ($end_credits = 0)
							add_menu_item {
								text = qs(0x9f281c76)
								choose_state = uistate_pausemenu_change_difficulty
								choose_state_data = {player_device = <player_device> Player = <Player>}
							}
						endif
					endif
					if (<Type> = quickplay)
						if ($num_quickplay_song_list > 1)
							add_menu_item \{choose_state = uistate_pausemenu_quit_warning
								choose_state_data = {
									option2_text = qs(0xef74f7d2)
									option2_func = quickplay_skip_song
									failed_song
								}
								text = qs(0xef74f7d2)}
						endif
					endif
					if ($current_num_players = 1)
						if ($end_credits = 0)
							add_menu_item \{text = qs(0x3ea7dec9)
								choose_state = uistate_practice_warning}
						endif
					endif
				endif
				if ($end_credits = 0)
					if ($battle_do_or_die = 0)
						add_menu_item {
							text = qs(0x976cf9e7)
							choose_state = uistate_pause_options
							choose_state_data = {player_device = <player_device> Player = <Player>}
						}
					endif
				endif
			endif
		endif
		quit_script = generic_event_choose no_sound = no_sound
		quit_script_params = {state = uistate_pausemenu_quit_warning}
		if ($is_in_debug)
			if ($end_credits = 1)
				quit_script = debug_quitcredits
				quit_script_params = {}
			else
				quit_script = generic_event_back
				quit_script_params = {state = uistate_debug}
			endif
		elseif ($is_network_game = 1)
			quit_script = select_quit_network_game
			quit_script_params = {}
		elseif ($g_in_tutorial = 1)
			quit_script = tutorial_quit_warning
			quit_script_params = {}
		endif
		if ($end_credits = 0)
			add_menu_item {
				text = qs(0x67d9c56d)
				pad_choose_script = <quit_script>
				pad_choose_params = <quit_script_params>
			}
		endif
	endif
	if NOT CD
		add_menu_item \{text = qs(0x49a0d144)
			choose_state = uistate_debug
			choose_state_data = {
				from_gameplay = 1
			}
			Scale = (0.4, 0.36)}
	endif
	add_gamertag_helper \{exclusive_device = $last_start_pressed_device}
	if ($g_in_tutorial = 1)
		if (<tutorial_failed> = 0)
			<event_handlers> = [{pad_start tutorial_resume}]
			current_menu :se_setprops event_handlers = <event_handlers>
		else
			menu_finish \{no_back_button = 1}
			return
		endif
	endif
	menu_finish
endscript

script ui_destroy_pausemenu 
	generic_ui_destroy
	ui_pausemenu_destroy_bg
	if ScreenElementExists \{id = celeb_intro_ui_cont}
		celeb_intro_ui_cont :se_setprops \{alpha = 1.0
			time = 0.1}
	endif
endscript

script ui_deinit_pausemenu 
	if ($is_network_game)
		enableallinput
	endif
endscript

script ui_pausemenu_exit 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if is_ui_event_running
		return
	endif
	if ScreenElementExists \{id = current_menu}
		current_menu :se_setprops \{block_events}
	endif
	Wait \{1
		gameframe}
	handle_pause_event
endscript

script ui_pausemenu_create_bg 
	CreateScreenElement {
		parent = root_window
		id = pausemenu_bg
		Type = descinterface
		desc = 'pause_menu'
		title_text = <title_text>
		alpha = 0
	}
	RunScriptOnScreenElement id = <id> ui_pausemenu_animate_in
endscript

script ui_pausemenu_destroy_bg 
	SoundEvent \{event = pause_menu_exit_sfx}
	if ScreenElementExists \{id = pausemenu_bg}
		pausemenu_bg :Die
	endif
endscript

script ui_pausemenu_animate_in 
	SoundEvent \{event = pause_menu_enter_sfx}
	desc_resolvealias \{Name = alias_pause_fist_container}
	se_setprops \{alpha = 1}
	<resolved_id> :se_setprops Pos = (100.0, 800.0)
	<resolved_id> :se_setprops Pos = (0.0, 0.0) time = 0.2 motion = ease_in
	<resolved_id> :se_waitprops
	<resolved_id> :se_setprops Pos = (20.0, 40.0) time = 0.2 motion = ease_out
	<resolved_id> :se_waitprops
	<resolved_id> :se_setprops Pos = (0.0, 0.0) time = 0.2 motion = ease_in
	<resolved_id> :se_waitprops
	begin
	se_setprops glow_alpha = Random (@ 0.4 @ 0.6 @ 0.8 )time = Random (@ 0.2 @ 0.3 @ 0.4 )motion = Random (@ ease_in @ ease_out )
	se_waitprops
	repeat
endscript

script enableallinput 
	i = 1
	begin
	getplayerinfo <i> controller
	if GotParam \{OFF}
		EnableInput controller = <controller> OFF
	else
		EnableInput controller = <controller>
	endif
	i = (<i> + 1)
	repeat $current_num_players
endscript

script ui_return_pausemenu 
	if ($is_network_game)
		add_gamertag_helper \{exclusive_device = $last_start_pressed_device}
		menu_finish
	endif
endscript

script pause_drop_player 
	printf \{qs(0x83bab1ce)}
	SpawnScriptNow unpause_and_drop_player params = <...>
endscript

script unpause_and_drop_player 
	gameplay_drop_player <...>
endscript

script pause_end_game 
	printf \{qs(0x090e92f1)}
	SpawnScriptNow unpause_and_endgame params = <...>
endscript

script unpause_and_endgame 
	ui_pausemenu_exit
	gameplay_end_game <...>
endscript

script ui_pausemenu_anim_out 
	StartRendering \{reason = menu_transition}
endscript
