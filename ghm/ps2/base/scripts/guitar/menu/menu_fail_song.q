is_boss_song = 0
is_guitar_controller = 0

script menu_replace_to_fail_song 
	SpawnScriptNow \{ui_event
		params = {
			event = menu_replace
			data = {
				state = uistate_fail_song
			}
		}}
endscript

script create_fail_song_menu 
	SoundEvent \{event = fail_screen_sfx}
	SoundEvent \{event = menu_warning_sfx_softer}
	Change \{last_start_pressed_device = $primary_controller}
	menu_font = fontgrid_title_a1
	get_song_struct song = ($current_song)
	if StructureContains structure = <song_struct> boss
		Change \{is_boss_song = 1}
	else
		Change \{is_boss_song = 0}
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
	CastToInteger \{completion}
	if (($game_mode = p1_career))
		if ($is_boss_song = 1)
			<menu_pos> = (640.0, 420.0)
		endif
	endif
	<menu_pos> = (<menu_pos> + (0.0, 45.0))
	if ($game_mode = p2_career || $game_mode = p2_coop || $game_mode = p2_quickplay)
		min = ($difficulty_list_props.($player1_status.difficulty).index)
		MathMin a = <min> b = ($difficulty_list_props.($player2_status.difficulty).index)
		CastToInteger \{min}
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
	GetUpperCaseString <song_title>
	formatText TextName = completion_text qs(0x76b3fda7) d = <completion>
	z = 100.0
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = fail_song_static_text_container
		internal_just = [
			center
			center
		]
		Pos = (0.0, 0.0)
		z_priority = 2}
	if ($is_boss_song = 1)
		title = qs(0x6b3bb27e)
	elseif ($special_event_stage != 0)
		title = qs(0x37e6a69e)
	else
		title = qs(0x5c9b76c1)
	endif
	if ($is_network_game = 1)
		if IsHost
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

		if (<final_blow_powerup> > -1)
			<completion_text_pos> = (420.0, 360.0)
			<completion_text_just> = [left center]
			<completion_fit_dims> = (400.0, 400.0)
			CreateScreenElement {
				Type = HMenu
				parent = fail_song_static_text_container
				id = final_blow_stacker
				just = [right center]
				Pos = (840.0, 415.0)
				internal_just = [right center]
				Scale = <completion_text_scale>
			}
			<finalblow_scale> = 0.7
			CreateScreenElement {
				Type = TextElement
				font = <menu_font>
				parent = final_blow_stacker
				just = [center center]
				rgba = [210 130 0 255]
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba = [0 0 0 255]
				z_priority = (<z> + 0.1)
				Scale = <finalblow_scale>
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
			CreateScreenElement \{Type = ContainerElement
				parent = final_blow_stacker
				dims = (64.0, 64.0)}
			final_blow_attack_icon = ($battlemode_powerups [<final_blow_powerup>].card_texture)
			CreateScreenElement {
				Type = SpriteElement
				parent = <id>
				texture = <final_blow_attack_icon>
				rgba = [255 255 255 255]
				just = [left top]
				Pos = (10.0, -5.0)
				dims = (64.0, 64.0)
				z_priority = (<z> + 0.1)
			}
		else
			<completion_text_pos> = (640.0, 383.0)
			<completion_text_just> = [center center]
			<completion_fit_dims> = (425.0, 400.0)
		endif
		CreateScreenElement {
			Type = HMenu
			parent = fail_song_static_text_container
			id = fail_completion_stacker
			just = <completion_text_just>
			Pos = <completion_text_pos>
			internal_just = [center center]
			Scale = <completion_text_scale>
		}
		<completion_text_params> = {
			Type = TextElement
			font = <menu_font>
			parent = fail_completion_stacker
			just = [center center]
			rgba = [210 130 0 255]
			Shadow
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
		CreateScreenElement <completion_text_params> Scale = 2 text = <lost_text> rgba = [223 223 223 255]
		CreateScreenElement <completion_text_params> Scale = 2 text = qs(0x0734a074) rgba = [223 223 223 255]
		CreateScreenElement <completion_text_params> Scale = 1 text = qs(0x713755f7)
		CreateScreenElement <completion_text_params> Scale = 1 text = qs(0x73360a03)
		CreateScreenElement <completion_text_params> Scale = 1 text = qs(0x713755f7)
		CreateScreenElement <completion_text_params> Scale = 1 text = <difficulty_text>
		SetScreenElementLock \{id = fail_completion_stacker
			On}
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
	Change \{menu_unfocus_color = [
			100
			88
			71
			255
		]}
	text_scale = (0.9, 0.95)
	if NOT English
		text_scale = (0.9, 0.85)
	endif
	if NOT GotParam \{exclusive_device}
		exclusive_device = ($primary_controller)
	endif
	demo_mode_disable = {}
	gamemode_gettype
	if (<Type> = quickplay)
		if NOT ui_event_exists_in_stack \{Name = 'jam'}
			if ($num_quickplay_song_list > 1)
				<quickplay_skip_song_option> = {
					func = quickplay_skip_song
					func_params = {failed_song}
					text = qs(0xef74f7d2)
				}
				AddArrayElement array = <popup_options> element = <quickplay_skip_song_option>
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
			AddArrayElement array = <popup_options> element = <change_diff_option>
			<popup_options> = <array>
		endif
	endif
	Change \{is_guitar_controller = 0}
	player_device = ($primary_controller)
	if IsGuitarController controller = <player_device>
		Change \{is_guitar_controller = 1}
	endif
	if NOT ($current_song = jamsession)
		if ((($game_mode = p1_career && $is_boss_song = 0) && $special_event_stage = 0) || $game_mode = p1_quickplay)
			<practice_option> = {
				func = fail_song_menu_select_practice
				text = qs(0x3ea7dec9)
			}
			AddArrayElement array = <popup_options> element = <practice_option>
			<popup_options> = <array>
		endif
	endif
	gamemode_gettype
	if (<Type> = career)
		if ($is_network_game = 1)
			if IsHost
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
	if GotParam \{new_song_option}
		AddArrayElement array = <popup_options> element = <new_song_option>
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
	AddArrayElement array = <popup_options> element = <quit_option>
	<popup_options> = <array>
	if (($is_network_game = 1 && $net_popup_active = 0) || ($is_network_game = 0))
		create_popup_warning_menu {
			title = <title>
			menu_pos = (640.0, 480.0)
			no_background
			options = <popup_options>
			fail_song_props = {
				song_title = <UppercaseString>
				percent_text = <completion_text>
				difficulty_text = <difficulty_text>
			}
		}
	endif
	disable_pause
endscript

script fail_song_menu_select_tutorial 
	player_device = ($primary_controller)
	if IsGuitarController controller = <player_device>
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
	Change \{ps2_gameplay_restart_song = 1}
	GH3_SFX_fail_song_stop_sounds
	if ($special_event_stage != 0)
		reset_current_special_event_percentages
		Change \{special_event_stage = 1}
		get_and_set_special_event_time
		practice_restart_song
		return
	endif
	if ($is_network_game = 1)
		SendStructure \{callback = net_career_retry_song
			data_to_send = {
				None
			}}
		net_career_retry_song
	else
		if NOT ($game_mode = training)
			Change \{gameplay_restart_song = 1}
		else
			practice_restart_song
		endif
		generic_event_back \{state = Uistate_gameplay}
	endif
endscript

script fail_song_menu_select_new_song 
	GH3_SFX_fail_song_stop_sounds
	if NOT CD
		if ($is_in_debug = 1)
			generic_event_back \{state = uistate_debug}
			return
		endif
	endif
	create_loading_screen
	if ($coop_dlc_active = 1)
		Change \{game_mode = p2_faceoff}
	endif
	if ($special_event_stage != 0)
		reset_current_special_event_percentages
		Change \{special_event_stage = 1}
		generic_event_back \{state = uistate_setlist}
	endif
	if ($current_song = jamsession)
		if ui_event_exists_in_stack \{Name = 'jam'}
			if NOT ($jam_view_cam_created = 1)
				destroy_bg_viewport
				setup_bg_viewport
				PlayIGCCam \{Name = jam_view_cam
					viewport = bg_viewport
					controlscript = jam_camera_script
					params = {
						start_camera = jam_song_select
					}
					play_hold = 1}
				Change \{jam_view_cam_created = 1}
				Change \{target_jam_camera_prop = failed_song_cam}
			endif
			generic_event_back state = uistate_jam_select_song Player = <Player> data = {show_popup = 0}
		elseif ui_event_exists_in_stack \{Name = 'setlist'}
			generic_event_back state = uistate_setlist Player = <Player>
		endif
	else
		gamemode_gettype
		if (<Type> = career)
			if ($is_network_game = 1)
				SendStructure \{callback = net_career_goto_band_lobby
					data_to_send = {
						None
					}}
				net_career_goto_band_lobby
			else
				generic_event_back state = uistate_gig_posters Player = <Player>
			endif
		else
			generic_event_back state = uistate_setlist Player = <Player>
		endif
	endif
endscript

script fail_song_menu_select_quit 
	if ($special_event_stage != 0)
		gamemode_gettype
		if (<Type> = career)
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
	GH3_SFX_fail_song_stop_sounds
	if quickplay_set_new_song_in_gig_list
		<current_song> = ($quickplay_song_list [($quickplay_song_list_current) -1])
		if (<current_song> = jamsession)
			jamsession_unload
		endif
		<current_song> = ($quickplay_song_list [($quickplay_song_list_current)])
		if (<current_song> = jamsession)
			jam_quickplay_get_and_start_song
		else
			Change \{gameplay_restart_song = 1}
			generic_event_back \{state = Uistate_gameplay}
		endif
	else
		generic_event_back \{state = uistate_setlist}
	endif
endscript

script net_career_retry_song 
	Change \{gameplay_restart_song = 1}
	Change \{net_ready_to_start = 0}
	($default_loading_screen.create)
	ui_event \{event = menu_back
		data = {
			state = Uistate_gameplay
		}}
endscript
