
script ui_init_pausemenu 
	if ($is_network_game)
		enableallinput \{OFF}
	endif
	if ScreenElementExists \{id = celeb_intro_ui_cont}
		celeb_intro_ui_cont :se_setprops \{alpha = 0.0
			time = 0.1}
	endif
endscript

script ui_create_pausemenu \{for_practice = 0
		extra_z = 0}
	if ($is_network_game = 1)
		spawn_player_drop_listeners \{drop_player_script = pause_drop_player
			end_game_script = pause_end_game}
	endif
	enable_pause
	reset_focus_colors
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
	SoundEvent \{pause_menu_sfx}
	vocals_mute_all_mics \{mute = true}
	if ($in_sing_a_long = true)
		Pos = (1152.0, 630.0)
	else
		Pos = (1152.0, 554.0)
	endif
	if ($pause_menu_no_bg = 0)
		if ($g_in_tutorial = 1)
			title_text = <tutorial_pause_title>
		else
			title_text = qs(0x662aaaf7)
		endif
		if NOT isSinglePlayerGame
			if NOT ($game_mode = practice)
				formatText TextName = title_text qs(0x6caaee30) p = <Player>
			endif
		endif
		if ($g_in_tutorial = 1)
			if (<tutorial_failed> = 0)
				<pad_back_script> = tutorial_resume
			else
				<pad_back_script> = nullscript
				<pad_back_sound> = nullscript
			endif
		else
			<pad_back_script> = ui_pausemenu_exit
		endif
		if ($in_tutorial_mode = 1)
			if (<tutorial_failed> = 1)
				title_text = qs(0xdf397aff)
			else
				title_text = qs(0xe588a6c9)
			endif
		endif
		ui_pausemenu_create_bg title_text = <title_text> extra_z = <extra_z>
		if pausemenu_bg :desc_resolvealias \{Name = alias_menu}
			<parent> = <resolved_id>
		endif
		make_generic_barrel_menu {
			title = <title_text>
			pad_back_script = <pad_back_script>
			pad_back_sound = <pad_back_sound>
			pad_back_params = <pad_back_params>
			exclusive_device = <player_device>
			z_priority = (600 + <extra_z>)
			no_highlight_bar
			Pos = <Pos>
		}
	else
		make_generic_barrel_menu {
			title = <title_text>
			pad_back_script = ui_pausemenu_exit
			exclusive_device = <player_device>
			z_priority = (600 + <extra_z>)
			no_highlight_bar
			Pos = <Pos>
		}
	endif
	if ($g_in_tutorial = 1)
		if (<tutorial_failed> = 1)
			add_generic_barrel_menu_text_item \{text = qs(0x5d8b66a0)
				pad_choose_script = tutorial_restart
				text_internal_just = [
					center
					center
				]}
			add_generic_barrel_menu_text_item \{text = qs(0xfceafb8f)
				pad_choose_script = tutorial_skip_lesson
				text_internal_just = [
					center
					center
				]}
		else
			add_generic_barrel_menu_text_item \{text = qs(0x4f636726)
				pad_choose_script = tutorial_resume
				text_internal_just = [
					center
					center
				]}
			add_generic_barrel_menu_text_item \{text = qs(0xb8790f2f)
				pad_choose_script = tutorial_restart_warning
				text_internal_just = [
					center
					center
				]}
			add_generic_barrel_menu_text_item \{text = qs(0xfceafb8f)
				pad_choose_script = tutorial_skip_warning
				text_internal_just = [
					center
					center
				]}
		endif
	else
		add_generic_barrel_menu_text_item \{text = qs(0x4f636726)
			pad_choose_script = ui_pausemenu_exit
			text_internal_just = [
				center
				center
			]}
		if (($is_network_game = 0) && ($in_sing_a_long = FALSE))
			if ($end_credits = 0)
				add_generic_barrel_menu_text_item \{text = qs(0xb8790f2f)
					choose_state = uistate_pausemenu_restart_warning
					text_internal_just = [
						center
						center
					]}
			endif
		endif
	endif
	if (<for_practice> = 1 || $game_mode = practice)
		if NOT playerinfoequals <Player> part = vocals
			add_generic_barrel_menu_text_item \{text = qs(0xcc2da18b)
				choose_state = uistate_pausemenu_quit_warning
				choose_state_data = {
					option2_text = qs(0xcc2da18b)
					option2_func = quit_warning_select_quit
					option2_func_params = {
						callback = generic_event_back
						data = {
							state = uistate_practice_select_speed
						}
					}
				}
				text_internal_just = [
					center
					center
				]}
		endif
		add_generic_barrel_menu_text_item \{text = qs(0x68bd3039)
			choose_state = uistate_pausemenu_quit_warning
			choose_state_data = {
				option2_text = qs(0x68bd3039)
				option2_func = quit_warning_select_quit
				option2_func_params = {
					callback = generic_event_back
					data = {
						state = uistate_select_song_section
					}
				}
			}
			text_internal_just = [
				center
				center
			]}
		if ($came_to_practice_from = main_menu)
			add_generic_barrel_menu_text_item \{text = qs(0x3e482764)
				choose_state = uistate_pausemenu_quit_warning
				choose_state_data = {
					option2_text = qs(0x3e482764)
					option2_func = quit_warning_select_quit
					option2_func_params = {
						callback = song_ended_menu_select_new_song
					}
				}
				text_internal_just = [
					center
					center
				]}
		endif
		add_generic_barrel_menu_text_item {
			text = qs(0x976cf9e7)
			choose_state = uistate_pause_options
			choose_state_data = {player_device = <player_device> Player = <Player>}
			text_internal_just = [center center]
		}
	elseif NOT ($g_in_tutorial = 1)
		if ($is_network_game = 0)
			gamemode_gettype
			if ($current_song = jamsession)
				if NOT ui_event_exists_in_stack \{Name = 'jam'}
					if (<Type> = quickplay)
						if (($num_quickplay_song_list > 1) || ($0xc7e670d7 = 1))
							add_generic_barrel_menu_text_item \{choose_state = uistate_pausemenu_quit_warning
								choose_state_data = {
									0xe0bfc5fc = true
									failed_song
								}
								text = qs(0xef74f7d2)
								text_internal_just = [
									center
									center
								]}
						endif
					endif
				endif
			else
				if NOT (($game_mode = p2_pro_faceoff) || ($in_sing_a_long = true))
					if ($end_credits = 0)
						if ui_event_exists_in_stack \{Name = 'band_difficulty'}
							choose_state = uistate_pausemenu_change_difficulty_warning
							choose_state_data = {player_device = <player_device> Player = <Player> band_mode = 1}
						else
							choose_state = uistate_pausemenu_change_difficulty
							choose_state_data = {player_device = <player_device> Player = <Player>}
						endif
						add_generic_barrel_menu_text_item {
							text = qs(0x9f281c76)
							text_internal_just = [center center]
							choose_state = <choose_state>
							choose_state_data = <choose_state_data>
						}
					endif
				endif
				if (<Type> = quickplay)
					if (($num_quickplay_song_list > 1) || ($0xc7e670d7 = 1))
						add_generic_barrel_menu_text_item \{choose_state = uistate_pausemenu_quit_warning
							choose_state_data = {
								0xe0bfc5fc = true
								failed_song
							}
							text = qs(0xef74f7d2)
							text_internal_just = [
								center
								center
							]}
					endif
				endif
				if 0xf99301bb
					if ($current_num_players = 1)
						if ($end_credits = 0)
							add_generic_barrel_menu_text_item \{text = qs(0x3ea7dec9)
								choose_state = uistate_practice_warning
								text_internal_just = [
									center
									center
								]}
						endif
					endif
				endif
			endif
			if (($in_sing_a_long = FALSE) && ($end_credits = 0))
				add_generic_barrel_menu_text_item {
					text = qs(0x976cf9e7)
					choose_state = uistate_pause_options
					choose_state_data = {player_device = <player_device> Player = <Player>}
					text_internal_just = [center center]
				}
			endif
		endif
	endif
	if ($in_sing_a_long = true)
		add_generic_barrel_menu_text_item \{text = qs(0x3e482764)
			choose_state = uistate_pausemenu_quit_warning
			choose_state_data = {
				option2_text = qs(0x3e482764)
				option2_func = quit_warning_select_quit
				option2_func_params = {
					callback = song_ended_menu_select_new_song
				}
			}
			text_internal_just = [
				center
				center
			]}
	endif
	quit_script = generic_event_choose no_sound = no_sound
	quit_script_params = {state = uistate_pausemenu_quit_warning}
	if (($0xc7e670d7 = 1) || ($in_sing_a_long = true))
		quit_script_params = {
			state = uistate_pausemenu_quit_warning
			data = {
				option2_func = quit_warning_select_quit
				option2_func_params = {
					callback = generic_event_back
					data = {state = uistate_mainmenu}
				}
			}
		}
	elseif ($0x9b2cba3f = 1)
		quit_script_params = {
			state = uistate_pausemenu_quit_warning
			data = {
				option2_func = quit_warning_select_quit
				option2_func_params = {
					callback = generic_event_back
					data = {state = uistate_setlist}
				}
			}
		}
	elseif ($is_in_debug)
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
		add_generic_barrel_menu_text_item {
			text = qs(0x67d9c56d)
			pad_choose_script = <quit_script>
			pad_choose_params = <quit_script_params>
			text_internal_just = [center center]
		}
	endif
	if (($enable_button_cheats = 1) && ($in_sing_a_long = FALSE))
		add_generic_barrel_menu_text_item \{text = qs(0x49a0d144)
			choose_state = uistate_debug
			choose_state_data = {
				from_gameplay = 1
			}
			Scale = (0.4, 0.36)
			text_internal_just = [
				center
				center
			]}
	endif
	if ($g_in_tutorial = 1)
		if (<tutorial_failed> = 0)
			<event_handlers> = [{pad_start tutorial_resume}]
			generic_barrel_vmenu :se_setprops event_handlers = <event_handlers>
		else
			generic_barrel_menu_finish \{no_back_button}
			return
		endif
	endif
	generic_barrel_menu_finish
	if NOT ($g_in_tutorial = 1)
		clean_up_user_control_helpers
		add_user_control_helper controller = <controller> text = qs(0xc18d5e76) button = green z = 100000
		add_user_control_helper controller = <controller> text = qs(0xaf4d5dd2) button = red z = 100000
	endif
	broadcastevent \{Type = pause_menu_created}
	destroy_loading_screen
endscript

script ui_destroy_pausemenu 
	destroy_generic_barrel_menu
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
	SpawnScriptNow \{unpausegh3
		params = {
			from_handler
		}}
	Block
endscript

script ui_pausemenu_create_bg 
	CreateScreenElement {
		parent = root_window
		id = pausemenu_bg
		Type = descinterface
		desc = 'pause_menu'
		title_text = <title_text>
		z_priority = <extra_z>
	}
	if (($in_sing_a_long = true) || GotParam 0x3a74dec3)
		if <id> :desc_resolvealias Name = 0x5a16b198 param = 0xae2a11d7
			SetScreenElementProps {id = <0xae2a11d7> alpha = 0.0}
		endif
		if <id> :desc_resolvealias Name = 0x76fe9286 param = 0x6ef73db8
			SetScreenElementProps {id = <0x6ef73db8> alpha = 0.0}
		endif
	endif
	if ($g_in_tutorial = 1)
		<song_title> = qs(0xcafa41cf)
	else
		get_song_title \{song = $current_song}
	endif
	pausemenu_bg :se_setprops {song_name_text = <song_title>}
	0x87679bf6 \{z_offset = 7000.0}
endscript

script ui_pausemenu_destroy_bg 
	if ScreenElementExists \{id = pausemenu_bg}
		pausemenu_bg :Die
	endif
	0xafd96096
endscript

script ui_pausemenu_animate_in 
	if ScreenElementExists \{id = pausemenu_bg}
		pausemenu_bg :se_getprops \{menu_scale}
		<org_menu_scale> = <menu_scale>
		pausemenu_bg :se_setprops \{menu_scale = 0}
		pausemenu_bg :se_getprops \{ninjastar_rot_angle}
		<org_ninjastar_rot_angle> = <ninjastar_rot_angle>
		pausemenu_bg :se_setprops \{ninjastar_rot_angle = 0}
		pausemenu_bg :se_getprops \{bottom_pos}
		<org_bottom_pos> = <bottom_pos>
		pausemenu_bg :se_setprops bottom_pos = (<bottom_pos> + (800.0, 700.0))
		pausemenu_bg :se_getprops \{left_pos}
		<org_left_pos> = <left_pos>
		pausemenu_bg :se_setprops left_pos = (<left_pos> + (-700.0, 800.0))
		pausemenu_bg :se_getprops \{top_pos}
		<org_top_pos> = <top_pos>
		pausemenu_bg :se_setprops top_pos = (<top_pos> + (-800.0, -700.0))
		pausemenu_bg :se_getprops \{right_pos}
		<org_right_pos> = <right_pos>
		pausemenu_bg :se_setprops right_pos = (<right_pos> + (700.0, -800.0))
		pausemenu_bg :se_getprops \{center_scale}
		<org_center_scale> = <center_scale>
		pausemenu_bg :se_setprops \{center_scale = 0}
		<anim_time> = 0.120000005
		pausemenu_bg :se_setprops bottom_pos = <org_bottom_pos> time = <anim_time> motion = linear
		pausemenu_bg :se_setprops left_pos = <org_left_pos> time = <anim_time> motion = linear
		pausemenu_bg :se_setprops top_pos = <org_top_pos> time = <anim_time> motion = linear
		pausemenu_bg :se_setprops right_pos = <org_right_pos> time = <anim_time> motion = linear
		pausemenu_bg :se_setprops center_scale = <org_center_scale> time = <anim_time> motion = linear
		pausemenu_bg :se_setprops menu_scale = <org_menu_scale> time = <anim_time> motion = linear
		pausemenu_bg :se_waitprops
		pausemenu_bg :se_setprops ninjastar_rot_angle = <org_ninjastar_rot_angle> time = 0.05 motion = linear
	endif
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

	SpawnScriptNow unpause_and_drop_player params = <...>
endscript

script unpause_and_drop_player 
	OnExitRun \{0xf00f29a9}
	0x79db87d7
	gameplay_drop_player <...>
endscript

script pause_end_game 

	SpawnScriptNow unpause_and_endgame params = <...>
endscript

script unpause_and_endgame 
	OnExitRun \{0xf00f29a9}
	0x79db87d7
	ui_pausemenu_exit
	gameplay_end_game <...>
endscript
