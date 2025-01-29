paused_for_hardware = 0
blade_active = 0
pause_no_render = 0
sysnotify_wait_in_progress = 0
xenon_device_checked = -1
sysnotify_game_already_paused = 0
sysnotify_paused_screen_elements = [
	current_menu_anchor
	signout_warning
	dialog_box_anchor
	link_lost_dialog_anchor
	quit_dialog_anchor
	keyboard_anchor
	controller_unplugged_dialog_anchor
]

script sysnotify_wait_until_safe 
	begin
	<should_wait> = 0
	if systemuidelayed
		<should_wait> = 1

	endif
	if istrue \{$is_changing_levels}
		<should_wait> = 1

	endif
	if istrue \{$igc_playing}
		<should_wait> = 1

	endif
	if NOT cutscenefinished \{name = cutscene}
		<should_wait> = 1

	endif
	if ($ui_pro_success_screen_active = 0)
		if screenelementexists \{id = screenfader}
			<should_wait> = 1

		endif
	endif
	if ($create_band_member_lock = 1)
		<should_wait> = 1

	endif
	if (<should_wait> = 1)
		change \{sysnotify_wait_in_progress = 1}
		wait \{0.1
			seconds}
	else
		change \{sysnotify_wait_in_progress = 0}
		return
	endif
	repeat
endscript

script sysnotify_handle_pause_eject 
	if isps2
		notify_box \{container_id = notify_eject_static_text_container
			line1 = 'Disk Ejected'
			line2 = 'Please reinsert'
			menu_z = 510001}
		if (renderingenabled)
			change \{pause_no_render = 0}
			fade_overlay_on
		else
			change \{pause_no_render = 1}
			startrendering
			fade_overlay_on \{alpha = 1.0}
		endif
	endif
	pausegh3sounds \{no_seek}
	setbuttoneventmappings \{block_menu_input}
	sysnotify_handle_pause <...> seek_on_unpause
endscript

script sysnotify_handle_pause_controller 
	if isps2
		notify_box \{container_id = notify_controller_static_text_container
			line1 = 'YOU ARE ROCKING OUT A BIT TOO HARD'
			line2 = 'Please ensure a controller is connected properly'
			menu_z = 510000}
		if (renderingenabled)
			change \{pause_no_render = 0}
			fade_overlay_on
		else
			change \{pause_no_render = 1}
			startrendering
			fade_overlay_on \{alpha = 1.0}
		endif
		setbuttoneventmappings \{block_menu_input}
	endif
	if isngc
		notify_box \{container_id = notify_controller_static_text_container
			line1 = 'YOU ARE ROCKING OUT A BIT TOO HARD'
			line2 = $wii_controller_unplugged
			menu_z = 510000}
		if (renderingenabled)
			change \{pause_no_render = 0}
			fade_overlay_on
		else
			change \{pause_no_render = 1}
			startrendering
			fade_overlay_on \{alpha = 1.0}
		endif
		setbuttoneventmappings \{block_menu_input}
	endif
	sysnotify_handle_pause <...>
endscript

script sysnotify_handle_pause_console 
	if isps2
		if (renderingenabled)
			change \{pause_no_render = 0}
			fade_overlay_on
		else
			if ($is_changing_levels = 0)
				change \{pause_no_render = 1}
			endif
			startrendering
			fade_overlay_on \{alpha = 1.0}
		endif
	endif
	sysnotify_handle_pause <...>
endscript

script sysnotify_handle_pause 



	if ($paused_for_hardware = 1)
		return
	endif
	if (($is_network_game) || ($g_connection_loss_dialogue))
		return
	endif
	sysnotify_wait_until_safe
	change \{paused_for_hardware = 1}
	change \{blade_active = 1}
	change \{sysnotify_game_already_paused = 1}
	if gameispaused

		return
	endif
	change \{sysnotify_game_already_paused = 0}
	if ($shutdown_game_for_signin_change_flag = 1)
		return
	endif
	if scriptisrunning \{guitarevent_songwon_spawned}
		return
	endif
	if (($game_mode = tutorial) && ($playing_song = 1))
		show_training_pause_screen <...>
	else
		gh3_start_pressed <...>
	endif
endscript

script sysnotify_handle_unpause_eject 
	if isps2
		kill_notify_box \{container_id = notify_eject_static_text_container}
		if ($pause_no_render = 1)
			change \{pause_no_render = 0}
			stoprendering
		endif
		fade_overlay_off
	endif
	setbuttoneventmappings \{unblock_menu_input}
	sysnotify_handle_unpause <...> seek_on_unpause
endscript

script sysnotify_handle_unpause_controller 
	if ((isps2) || (isngc))
		kill_notify_box \{container_id = notify_controller_static_text_container}
		if ($pause_no_render = 1)
			change \{pause_no_render = 0}
			stoprendering
		endif
		fade_overlay_off
		setbuttoneventmappings \{unblock_menu_input}
	endif
	sysnotify_handle_unpause <...>
endscript

script sysnotify_handle_unpause_console 
	if isps2
		if ($pause_no_render = 1)
			change \{pause_no_render = 0}
			stoprendering
		endif
		fade_overlay_off
		reacquirecontrollers
	endif
	sysnotify_handle_unpause <...>
endscript

script sysnotify_handle_unpause 



	if shouldgamebepausedduetosysnotification
		return
	endif
	sysnotify_wait_until_safe
	change \{paused_for_hardware = 0}
	change \{blade_active = 0}
	change \{wait_for_sysnotify_unpause_flag = 1}
	if NOT gameispaused
		return
	endif
	if ($sysnotify_game_already_paused = 0)
		if NOT ($playing_song = 1 && $is_attract_mode = 0)
			gh3_start_pressed <...>
		endif
	endif
	change \{sysnotify_game_already_paused = 0}
endscript
fade_overlay_count = 0

script fade_overlay_on \{alpha = 0.9}
	if ((isps2) || (isngc))
		if NOT screenelementexists \{id = pause_fader}
			createscreenelement {
				type = spriteelement
				id = pause_fader
				parent = root_window
				texture = black
				rgba = [0 0 0 255]
				pos = (640.0, 360.0)
				dims = (1280.0, 720.0)
				just = [center center]
				z_priority = 509000
				alpha = <alpha>
			}
		endif
		change fade_overlay_count = ($fade_overlay_count + 1)
	endif
endscript

script fade_overlay_off 
	if ((isps2) || (isngc))
		change fade_overlay_count = ($fade_overlay_count - 1)
		if ($fade_overlay_count = 0)
			if screenelementexists \{id = pause_fader}
				destroyscreenelement \{id = pause_fader}
			endif
		endif
	endif
endscript

script sysnotify_reset_user_progress 
	reset_gamemode
	change \{attempted_xbox_autoload = 0}
	change \{no_load = 0}
	change \{xenon_device_checked = -1}
	change \{ui_cas_skater_selected = 0}
endscript
signin_change_happening = 0

script sysnotify_handle_signin_change 



	change \{invite_controller = -1}
	if ($signin_change_happening = 1)

		return
	endif
	change \{signin_change_happening = 1}
	sysnotify_wait_until_safe
	if ($ui_x360_sign_in_checked = 1)
		change \{ui_x360_sign_in_checked = 0}
		change \{signin_change_happening = 0}
		return
	endif
	switch <message>
		case live_connection_lost
		if infrontend
			if NOT ($is_network_game)
				change \{signin_change_happening = 0}
				return
			else
				sysnotify_handle_connection_loss
			endif
		else
			if NOT ($is_network_game)
				change \{signin_change_happening = 0}
				return
			else
				sysnotify_handle_connection_loss
			endif
		endif
		case live_connection_gained
		if (($playing_song) && ($is_network_game = 0))
			xenon_singleplayer_session_init
			change \{signin_change_happening = 0}
			return
		else
			change \{signin_change_happening = 0}
			return
		endif
		case user_changed

		if ($respond_to_signin_changed = 1)
			handle_signin_changed
		endif
		default

		change \{signin_change_happening = 0}
		return
	endswitch
	change \{signin_change_happening = 0}
endscript
sysnotify_allow_invite = 1

script sysnotify_handle_game_invite 



	sysnotify_invite_go <...>
endscript

script sysnotify_invite_cancel 
	sysnotify_handle_unpause
	dialog_box_exit
endscript

script sysnotify_invite_go 

	if gotparam \{cross_game}
		cross_game_invite_accepted <...>
	else
		sysnotify_wait_until_safe
		invite_accepted <...>
	endif
endscript

script cross_game_invite_accepted 
endscript
g_connection_loss_dialogue = 0

script sysnotify_handle_connection_loss 



	change \{g_connection_loss_dialogue = 1}
	sysnotify_wait_until_safe
	wait_for_safe_shutdown
	cleanup_sessionfuncs
	xboxlive_lost_connection_ui_cleanup
	create_link_unplugged_dialog
endscript

script sysnotify_cleanup_misc 
	if screenelementexists \{id = root_window}
		launchevent \{type = unfocus
			target = root_window}
	endif
	sysnotify_cleanup_ui
	if infrontend
		killspawnedscript \{name = attract_mode_timer}
		if screenelementexists \{id = cas_category_anchor}
			destroyscreenelement \{id = cas_category_anchor}
		endif
		if screenelementexists \{id = progress_anchor}
			destroyscreenelement \{id = progress_anchor}
		endif
	endif
	destroy_onscreen_keyboard
	if innetgame
		force_close_rankings \{dont_retry}
		if localskaterexists
			skater :vibrate \{off}
		endif
		if NOT isobserving
			exitsurveyormode
		endif
		dialog_box_exit \{anchor_id = link_lost_dialog_anchor}
		dialog_box_exit \{anchor_id = quit_dialog_anchor}
	endif
	if screenelementexists \{id = piece_menu_hmenu}
		destroyscreenelement \{id = piece_menu_hmenu}
	endif
	dialog_box_exit
	change \{main_menu_return_to_createamodes = 0}
	change \{check_for_unplugged_controllers = 0}
	change \{inside_pause = 0}
	kill_start_key_binding
	killspawnedscript \{name = main_menu_exit}
	getcurrentlevel
	if (<level> = load_z_bedroom)
		if viewportexists \{id = z_bedroom_select_viewport}
			z_bedroom_kill_select_bink
		endif
		z_bedroom_exit_unload
	endif
endscript

script sysnotify_cleanup_ui 



	killspawnedscript \{name = ui_mainmovies_wait_for_movie}
	killspawnedscript \{name = ui_initial_interactive_screen}
	killspawnedscript \{name = ui_attract_wait_for_movie}
	killspawnedscript \{name = ui_mainmenu_wait_for_movie}
	killspawnedscript \{name = attract_timer_wait}
	killspawnedscript \{name = goal_classic_mode_post_cams}
	killspawnedscript \{name = goal_classic_mode_show_cams}
	killskatercamanim \{name = goal_classic_mode_cam}
	if screenelementexists \{id = ui_mainmovie_wait_anchor}
		destroyscreenelement \{id = ui_mainmovie_wait_anchor}
	endif
	if ismovieplaying \{textureslot = 0}
		killmovie \{textureslot = 0}
	endif
	if ismovieplaying \{textureslot = 1}
		killmovie \{textureslot = 1}
	endif
	if viewportexists \{id = z_mainmenu_bink_viewport}
		pushassetcontext \{context = z_mainmenu}
		destroyviewporttextureoverride \{id = z_mainmenu_bink_viewport}
		destroyviewport \{id = z_mainmenu_bink_viewport}
		popassetcontext
	endif
	if viewportexists \{id = thp8_shop_viewport}
		pushassetcontext \{context = z_shops}
		destroyviewporttextureoverride \{id = thp8_shop_viewport}
		destroyviewport \{id = thp8_shop_viewport}
		popassetcontext
	endif
	change \{pause_fmv_playing = 0}
	killspawnedscript \{name = xenon_handle_first_input}
	if screenelementexists \{id = edit_tricks_menu_parts_anchor}
		destroyscreenelement \{id = edit_tricks_menu_parts_anchor}
	endif
	if screenelementexists \{id = edit_tricks_sub_menu_anchor}
		destroyscreenelement \{id = edit_tricks_sub_menu_anchor}
	endif
	if screenelementexists \{id = choose_trick_menu_container}
		destroyscreenelement \{id = choose_trick_menu_container}
	endif
	if screenelementexists \{id = ui_mainmenu_wait_anchor}
		destroyscreenelement \{id = ui_mainmenu_wait_anchor}
	endif
	if screenelementexists \{id = goal_presentation_anchor}
		destroyscreenelement \{id = goal_presentation_anchor}
	endif
	if screenelementexists \{id = select_skater_anchor}
		destroyscreenelement \{id = select_skater_anchor}
	endif
	killspawnedscript \{name = goal_create_pro_success_screen}
	killspawnedscript \{name = goal_destroy_pro_success_screen}
	killspawnedscript \{name = goal_generic_exit_menu_and_videos}
	if ($ui_pro_success_screen_active = 1)
		if gman_hasactivegoals
			gman_getactivatedgoalid
			goal_destroy_pro_success_screen do_pause = 0 goal = <activated_goal_id> pass_pro_goal = 0
		endif
	endif
endscript

script notify_box 
	if screenelementexists id = <container_id>
		return
	endif
	createscreenelement {
		type = containerelement
		parent = root_window
		id = <container_id>
		pos = (0.0, 0.0)
	}
	menu_font = fontgrid_title_gh3
	createscreenelement {
		type = textelement
		id = 0x247bb927
		parent = <container_id>
		font = <menu_font>
		scale = 0.85
		rgba = [180 50 50 255]
		text = <line1>
		just = [center top]
		z_priority = (<menu_z> + 0.2)
		pos = (640.0, 80.0)
	}
	createscreenelement {
		type = textelement
		id = 0xbd72e89d
		parent = <container_id>
		font = <menu_font>
		scale = 0.6
		rgba = [0 0 0 255]
		text = <line2>
		just = [center top]
		z_priority = (<menu_z> + 0.2)
		pos = (640.0, 124.0)
	}
	getscreenelementdims \{id = 0x247bb927}
	0x561a3749 = <width>
	getscreenelementdims \{id = 0xbd72e89d}
	0x67f22dd4 = <width>
	if (<0x561a3749> > <0x67f22dd4>)
		text_width = <0x561a3749>
	else
		text_width = <0x67f22dd4>
	endif
	0xf1e2fd2b = (<text_width> + 85)
	bg_dims = ((<0xf1e2fd2b> * (1.0, 0.0)) + (0.0, 96.0))
	displaysprite parent = <container_id> tex = dialog_bg pos = (640.0, 32.0) dims = <bg_dims> z = <menu_z> just = [center top]
	displaysprite parent = <container_id> tex = dialog_bg flip_h pos = (640.0, 112.0) dims = <bg_dims> z = <menu_z> just = [center top]
endscript

script kill_notify_box \{container_id = notify_static_text_container}
	if screenelementexists id = <container_id>
		destroyscreenelement id = <container_id>
	endif
endscript
wait_for_sysnotify_unpause_flag = 0

script wait_for_sysnotify_unpause 
	change \{wait_for_sysnotify_unpause_flag = 0}

	begin

	if ($wait_for_sysnotify_unpause_flag = 1)
		break
	endif
	waitonegameframe
	repeat
endscript

script xboxlive_lost_connection_ui_cleanup 
	if ($is_network_game)
		stoprendering
		shutdown_game_for_signin_change \{unloadcontent = 0}
		startrendering
	endif
endscript
