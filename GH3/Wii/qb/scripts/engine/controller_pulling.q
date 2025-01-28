controller_unplugged_frame_count = 30
unplugged_controller = -1

script controller_unplugged 

	change unplugged_controller = <device_num>
	if ($playing_song = 1)
		if NOT gameispaused
			ui_flow_manager_respond_to_action \{action = controller_disconnect}
			change \{check_for_unplugged_controllers = 0}
		endif
	else
		if ((isps3) || (isps2) || (isngc))
			create_controller_disconnect_menu
			change \{check_for_unplugged_controllers = 0}
		endif
	endif
	if NOT gameispaused
		gh3_start_pressed \{no_back}
	endif
endscript

script create_controller_unplugged_dialog \{pad_choose_script = controller_refresh}

	if screenelementexists \{id = ui_mainmenu_wait_anchor}
		return
	endif
	if isxenon
		if infrontend
			return
		endif
	endif
	if innetgame
		return
	endif
	if screenelementexists \{id = link_lost_dialog_anchor}
		dialog_box_exit \{anchor_id = link_lost_dialog_anchor}
	endif
	sysnotify_wait_until_safe
	wait \{1
		frame}
	sysnotify_handle_pause
	setscreenelementlock \{id = root_window
		off}
	if NOT infrontend
		if ismovieplaying \{textureslot = 0}
			pausemovie \{textureslot = 0}
		endif
		if ismovieplaying \{textureslot = 1}
			pausemovie \{textureslot = 1}
		endif
	endif
	if gotparam \{leaving_net_game}
		createplatformmessagebox {
			title = 'CONTROLLER DISCONNECTED'
			message = 'Please reconnect the controller.'
			buttons = [
				'GO TO MAIN MENU'
			]
			user = <device_num>
			active_button = 0
		}
		controller_reconnected \{leaving_net_game}
	else
		createplatformmessagebox {
			title = 'CONTROLLER'
			message = 'Please reconnect the controller.'
			buttons = [
				'CONTINUE'
			]
			user = <device_num>
			active_button = 0
		}
		controller_reconnected
	endif
	if NOT infrontend
		if ismovieplaying \{textureslot = 0}
			resumemovie \{textureslot = 0}
		endif
		if ismovieplaying \{textureslot = 1}
			resumemovie \{textureslot = 1}
		endif
	endif
endscript

script controller_refresh 
	if (<original_device_num> = <device_num>)
		controller_reconnected <...>
		if NOT (abortscript = defaultabortscript)
			goto \{reload_anims_then_run_abort_script}
		endif
	endif
endscript

script controller_reconnected 
	if NOT gotparam \{leaving_net_game}
		if NOT infrontend
			if NOT screenelementexists \{id = view_goals_root}
				if NOT screenelementexists \{id = timeline_vmenu}
					restore_skater_camera
				endif
			endif
		endif
	endif
	dialog_box_exit \{anchor_id = link_lost_dialog_anchor
		dont_focus}
	if screenelementexists \{id = controller_unplugged_dialog_anchor}
		destroyscreenelement \{id = controller_unplugged_dialog_anchor}
	endif
	if screenelementexists \{id = keyboard_vmenu}
		launchevent \{type = focus
			target = keyboard_vmenu}
	endif
	if NOT gotparam \{leaving_net_game}
		sysnotify_handle_unpause
	endif
	if screenelementexists \{id = dialog_box_anchor}
		launchevent \{type = focus
			target = dialog_box_vmenu}
		doscreenelementmorph \{id = dialog_box_anchor
			alpha = 1}
	else
		if screenelementexists \{id = current_menu_anchor}
			launchevent \{type = focus
				target = current_menu_anchor}
			if screenelementexists \{id = current_menu}
				launchevent \{type = focus
					target = current_menu}
			endif
		endif
	endif
	if gotparam \{leaving_net_game}

		unpausegame
		quit_network_game
	else
		spawnscriptlater \{wait_and_check_for_unplugged_controllers}
	endif
endscript

script wait_and_check_for_unplugged_controllers \{time = 50}
	wait <time>
	change \{check_for_unplugged_controllers = 1}
endscript
