is_boss_song = 0
is_guitar_controller = 0

script menu_replace_to_fail_song 
	spawnscriptnow \{ui_event
		params = {
			event = menu_replace
			data = {
				state = uistate_fail_song
			}
		}}
endscript

script create_fail_song_menu 
	if NOT gotparam \{old_base_name}
		soundevent \{event = fail_screen_sfx}
		soundevent \{event = menu_warning_sfx_softer}
	endif
	change \{last_start_pressed_device = $primary_controller}
	menu_font = fontgrid_title_a1
	get_song_struct song = ($current_song)
	if structurecontains structure = <song_struct> boss
		change \{is_boss_song = 1}
	else
		change \{is_boss_song = 0}
	endif
	<menu_pos> = (640.0, 420.0)
	completion = 0
	get_song_end_time song = ($current_song)
	if (<total_end_time> > 0)
		completion = (100 * $failed_song_time / <total_end_time>)
		if (<completion> > 99)
			completion = 99
		endif
	endif
	casttointeger \{completion}
	if (($game_mode = p1_career))
		if ($is_boss_song = 1)
			<menu_pos> = (640.0, 420.0)
		endif
	endif
	<menu_pos> = (<menu_pos> + (0.0, 45.0))
	if ($game_mode = p2_career || $game_mode = p2_coop || $game_mode = p2_quickplay)
		min = ($difficulty_list_props.($player1_status.difficulty).index)
		mathmin a = <min> b = ($difficulty_list_props.($player2_status.difficulty).index)
		casttointeger \{min}
		difficulty_index = <min>
		get_difficulty_text_upper difficulty = ($difficulty_list [<difficulty_index>])
	else
		if (($player1_status.double_kick_drum) = 1)
			difficulty_text = qs(0x7a19b5f7)
		else
			get_difficulty_text_upper difficulty = ($player1_status.difficulty)
		endif
	endif
	get_song_title song = ($current_song)
	getuppercasestring <song_title>
	formattext textname = completion_text qs(0x76b3fda7) d = <completion>
	z = 100.0
	createscreenelement \{type = containerelement
		parent = root_window
		id = fail_song_static_text_container
		internal_just = [
			center
			center
		]
		pos = (0.0, 0.0)
		z_priority = 2}
	if ($is_boss_song = 1)
		title = qs(0x6b3bb27e)
	elseif ($special_event_stage != 0)
		title = qs(0x37e6a69e)
	else
		title = qs(0x5c9b76c1)
	endif
	if ($is_network_game = 1)
		if ishost
			popup_options = [
				{
					func = fail_song_menu_select_retry_song
					text = qs(0x647b5a84)
				}
			]
		else
			popup_options = []
		endif
	else
		popup_options = [
			{
				func = fail_song_menu_select_retry_song
				text = qs(0x647b5a84)
			}
		]
	endif
	if ($current_song = bosstom || $current_song = bossslash || $current_song = bossdevil)
		final_blow_powerup = -1
		<final_blow_powerup> = ($player2_status.final_blow_powerup)
		printf channel = trchen qs(0x67427292) s = <final_blow_powerup>
		if (<final_blow_powerup> > -1)
			<completion_text_pos> = (420.0, 360.0)
			<completion_text_just> = [left center]
			<completion_fit_dims> = (400.0, 400.0)
			createscreenelement {
				type = hmenu
				parent = fail_song_static_text_container
				id = final_blow_stacker
				just = [right center]
				pos = (840.0, 415.0)
				internal_just = [right center]
				scale = <completion_text_scale>
			}
			<finalblow_scale> = 0.7
			createscreenelement {
				type = textelement
				font = <menu_font>
				parent = final_blow_stacker
				just = [center center]
				rgba = [210 130 0 255]
				shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba = [0 0 0 255]
				z_priority = (<z> + 0.1)
				scale = <finalblow_scale>
				text = qs(0x1be693f8)
				rgba = [223 223 223 255]
			}
			fit_text_in_rectangle {
				id = <id>
				dims = (320.0, 400.0)
				keep_ar = 1
				only_if_larger_x = 1
				start_x_scale = <finalblow_scale>
				start_y_scale = <finalblow_scale>
			}
			createscreenelement \{type = containerelement
				parent = final_blow_stacker
				dims = (64.0, 64.0)}
			final_blow_attack_icon = ($battlemode_powerups [<final_blow_powerup>].card_texture)
			createscreenelement {
				type = spriteelement
				parent = <id>
				texture = <final_blow_attack_icon>
				rgba = [255 255 255 255]
				just = [left top]
				pos = (10.0, -5.0)
				dims = (64.0, 64.0)
				z_priority = (<z> + 0.1)
			}
		else
			<completion_text_pos> = (640.0, 383.0)
			<completion_text_just> = [center center]
			<completion_fit_dims> = (425.0, 400.0)
		endif
		createscreenelement {
			type = hmenu
			parent = fail_song_static_text_container
			id = fail_completion_stacker
			just = <completion_text_just>
			pos = <completion_text_pos>
			internal_just = [center center]
			scale = <completion_text_scale>
		}
		<completion_text_params> = {
			type = textelement
			font = <menu_font>
			parent = fail_completion_stacker
			just = [center center]
			rgba = [210 130 0 255]
			shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [0 0 0 255]
			z_priority = (<z> + 0.1)
		}
		if ($current_song = bosstom)
			lost_text = qs(0x89ab6e2f)
		elseif ($current_song = bossslash)
			lost_text = qs(0x7c194a52)
		elseif ($current_song = bossdevil)
			lost_text = qs(0xd0b67d1a)
		endif
		createscreenelement <completion_text_params> scale = 2 text = <lost_text> rgba = [223 223 223 255]
		createscreenelement <completion_text_params> scale = 2 text = qs(0x0734a074) rgba = [223 223 223 255]
		createscreenelement <completion_text_params> scale = 1 text = qs(0x713755f7)
		createscreenelement <completion_text_params> scale = 1 text = qs(0x73360a03)
		createscreenelement <completion_text_params> scale = 1 text = qs(0x713755f7)
		createscreenelement <completion_text_params> scale = 1 text = <difficulty_text>
		setscreenelementlock \{id = fail_completion_stacker
			on}
		fit_text_in_rectangle {
			id = fail_completion_stacker
			dims = <completion_fit_dims>
			keep_ar = 1
			only_if_larger_x = 1
			start_x_scale = <completion_text_scale>
			start_y_scale = <completion_text_scale>
		}
	else
		<song_title_scale> = 1.65
	endif
	change \{menu_unfocus_color = [
			100
			88
			71
			255
		]}
	text_scale = (0.9, 0.95)
	if NOT english
		text_scale = (0.9, 0.85)
	endif
	if NOT gotparam \{exclusive_device}
		exclusive_device = ($primary_controller)
	endif
	demo_mode_disable = {}
	gamemode_gettype
	if (<type> = quickplay)
		if NOT ui_event_exists_in_stack \{name = 'jam'}
			if ($num_quickplay_song_list > 1)
				<quickplay_skip_song_option> = {
					func = quickplay_skip_song
					func_params = {failed_song}
					text = qs(0xef74f7d2)
				}
				addarrayelement array = <popup_options> element = <quickplay_skip_song_option>
				<popup_options> = <array>
			endif
		endif
	endif
	if NOT (($current_song = jamsession) || ($is_network_game = 1))
		if NOT gamemode_isbandscoring
			<change_diff_option> = {
				func = fail_song_menu_select_change_diff
				text = qs(0xa717ca5b)
			}
			addarrayelement array = <popup_options> element = <change_diff_option>
			<popup_options> = <array>
		endif
	endif
	change \{is_guitar_controller = 0}
	player_device = ($primary_controller)
	if isguitarcontroller controller = <player_device>
		change \{is_guitar_controller = 1}
	endif
	if NOT ($current_song = jamsession)
		if ((($game_mode = p1_career && $is_boss_song = 0) && $special_event_stage = 0) || $game_mode = p1_quickplay)
		endif
	endif
	gamemode_gettype
	if (<type> = career)
		if ($is_network_game = 1)
			if ishost
				<new_song_option> = {
					func = fail_song_menu_select_new_song
					text = qs(0x2f036f1b)
				}
			else
				<new_song_option> = {
					func = empty_script
					text = qs(0xf40ad470)
					not_focusable
				}
			endif
		else
			if progression_check_intro_complete
				<new_song_option> = {
					func = fail_song_menu_select_new_song
					text = qs(0x3e482764)
				}
			endif
		endif
	else
		<new_song_option> = {
			func = fail_song_menu_select_new_song
			text = qs(0x3e482764)
		}
	endif
	if gotparam \{new_song_option}
		addarrayelement array = <popup_options> element = <new_song_option>
		<popup_options> = <array>
	endif
	if ($is_network_game = 1)
		<quit_option> = {
			func = select_quit_network_game
			func_params = {from_fail_menu = 1}
			text = qs(0x67d9c56d)
		}
	else
		<quit_option> = {
			func = fail_song_menu_select_quit
			text = qs(0x793e4d21)
		}
	endif
	addarrayelement array = <popup_options> element = <quit_option>
	<popup_options> = <array>
	if (($is_network_game = 1 && $net_popup_active = 0) || ($is_network_game = 0))
		force_menu_pos_off_param = {}
		getarraysize <popup_options>
		if (<array_size> > 5)
			<force_menu_pos_off_param> = {force_menu_pos_off = {relative (0.0, -28.0)}}
		endif
		create_popup_warning_menu {
			title = <title>
			menu_pos = (640.0, 480.0)
			no_background
			options = <popup_options>
			fail_song_props = {
				song_title = <uppercasestring>
				percent_text = <completion_text>
				difficulty_text = <difficulty_text>
			}
			<force_menu_pos_off_param>
		}
	endif
	pausegame
	disable_pause
endscript

script fail_song_menu_select_tutorial 
	player_device = ($primary_controller)
	if isguitarcontroller controller = <player_device>
		kill_gem_scroller
		generic_event_choose \{state = uistate_select_practice_mode}
	endif
endscript

script destroy_fail_song_menu 
	destroy_menu \{menu_id = fail_song_scrolling_menu}
	destroy_pause_menu_frame
	destroy_menu \{menu_id = fail_song_static_text_container}
	destroy_popup_warning_menu
endscript

script fail_song_menu_select_practice 
	generic_event_choose \{state = uistate_practice_warning}
endscript

script fail_song_menu_select_retry_song 
	gh3_sfx_fail_song_stop_sounds
	if ($game_mode = p1_career ||
			$game_mode = p2_career ||
			$game_mode = p3_career ||
			$game_mode = p4_career)
		if (($current_level) = load_z_amazon)
			safecreate \{nodename = z_amazon_trg_spirit}
		elseif (($current_level) = load_z_canyon)
			safecreate \{nodename = z_canyon_trg_spirit}
		elseif (($current_level) = load_z_icecap)
			safecreate \{nodename = z_icecap_trg_spirit}
		elseif (($current_level) = load_z_london)
			safecreate \{nodename = z_london_trg_spirit}
		elseif (($current_level) = load_z_sphinx)
			safecreate \{nodename = z_sphinx_trg_spirit}
		elseif (($current_level) = load_z_greatwall)
			safecreate \{nodename = z_greatwall_trg_spirit}
		elseif (($current_level) = load_z_atlantis)
			safecreate \{nodename = z_atlantis_trg_spirit}
		endif
	endif
	if ($special_event_stage != 0)
		reset_current_special_event_percentages
		change \{special_event_stage = 1}
		get_and_set_special_event_time
		practice_restart_song
		return
	endif
	if ($is_network_game = 1)
		change agora_failed_attempts = ($agora_failed_attempts + 1)
		sendstructure \{callback = net_career_retry_song
			data_to_send = {
				none
			}}
		net_career_retry_song
	else
		if NOT ($game_mode = training)
			change agora_failed_attempts = ($agora_failed_attempts + 1)
			change \{gameplay_restart_song = 1}
			xenon_singleplayer_session_init
		else
			practice_restart_song
		endif
		generic_event_back \{state = uistate_gameplay}
	endif
endscript

script fail_song_menu_select_new_song 
	gh3_sfx_fail_song_stop_sounds
	if NOT cd
		if ($is_in_debug = 1)
			generic_event_back \{state = uistate_debug}
			return
		endif
	endif
	if ($coop_dlc_active = 1)
		change \{game_mode = p2_faceoff}
	endif
	if ($special_event_stage != 0)
		reset_current_special_event_percentages
		change \{special_event_stage = 1}
		generic_event_back \{state = uistate_setlist}
	endif
	if ($current_song = jamsession)
		if ui_event_exists_in_stack \{name = 'jam'}
			generic_event_back state = uistate_jam_select_song player = <player> data = {show_popup = 0}
		elseif ui_event_exists_in_stack \{name = 'setlist'}
			generic_event_back state = uistate_setlist player = <player>
		endif
	else
		gamemode_gettype
		if (<type> = career)
			if ($is_network_game = 1)
				sendstructure \{callback = net_career_goto_band_lobby
					data_to_send = {
						none
					}}
				net_career_goto_band_lobby
			else
				generic_event_back state = uistate_gig_posters player = <player>
			endif
		else
			generic_event_back state = uistate_setlist player = <player>
		endif
	endif
endscript

script fail_song_menu_select_quit 
	if ($special_event_stage != 0)
		gamemode_gettype
		if (<type> = career)
			career_song_ended_select_quit
		endif
		reset_current_special_event_percentages
		generic_event_back \{state = uistate_gig_posters}
	else
		generic_event_choose \{state = uistate_pausemenu_quit_warning
			data = {
				option2_func = {
					song_ended_menu_select_quit
					quit_career_confirm
				}
			}
			no_sound}
	endif
endscript

script fail_song_menu_select_change_diff 
	generic_event_choose state = uistate_pausemenu_change_difficulty data = {<...> no_warning}
endscript

script quickplay_skip_song 
	gh3_sfx_fail_song_stop_sounds
	if quickplay_set_new_song_in_gig_list
		<current_song> = ($quickplay_song_list [($quickplay_song_list_current)])
		if (<current_song> = jamsession)
			jam_quickplay_get_and_start_song
		else
			change \{gameplay_restart_song = 1}
			change \{agora_failed_attempts = 0}
			xenon_singleplayer_session_init
			generic_event_back \{state = uistate_gameplay}
		endif
	else
		generic_event_back \{state = uistate_setlist}
	endif
endscript

script net_career_retry_song 
	change \{gameplay_restart_song = 1}
	change \{net_ready_to_start = 0}
	($default_loading_screen.create)
	xenon_singleplayer_session_init
	ui_event \{event = menu_back
		data = {
			state = uistate_gameplay
		}}
endscript
