controller_unplugged_frame_count = 30
unplugged_controller = -1

script controller_unplugged 
	Printf \{"--- controller_unplugged"}
	Change unplugged_controller = <device_num>
	if ($playing_song = 1)
		if NOT GameIsPaused
			ui_flow_manager_respond_to_action \{action = controller_disconnect}
			Change \{check_for_unplugged_controllers = 0}
		endif
	else
		if ISPS3
			create_controller_disconnect_menu
			Change \{check_for_unplugged_controllers = 0}
		endif
	endif
	if NOT GameIsPaused
		gh3_start_pressed \{no_back}
	endif
endscript

script create_controller_unplugged_dialog \{pad_choose_script = controller_refresh}
	Printf \{"--- create_controller_unplugged_dialog"}
	if ScreenElementExists \{Id = ui_mainmenu_wait_anchor}
		return
	endif
	if IsXENON
		if InFrontEnd
			return
		endif
	endif
	if InNetGame
		return
	endif
	if ScreenElementExists \{Id = link_lost_dialog_anchor}
		dialog_box_exit \{anchor_id = link_lost_dialog_anchor}
	endif
	sysnotify_wait_until_safe
	Wait \{1
		Frame}
	sysnotify_handle_pause
	SetScreenElementLock \{Id = root_window
		OFF}
	if NOT InFrontEnd
		if IsMoviePlaying \{TextureSlot = 0}
			PauseMovie \{TextureSlot = 0}
		endif
		if IsMoviePlaying \{TextureSlot = 1}
			PauseMovie \{TextureSlot = 1}
		endif
	endif
	if GotParam \{leaving_net_game}
		CreatePlatformMessageBox {
			Title = "CONTROLLER DISCONNECTED"
			message = "Please reconnect the controller."
			buttons = [
				"GO TO MAIN MENU"
			]
			user = <device_num>
			active_button = 0
		}
		controller_reconnected \{leaving_net_game}
	else
		CreatePlatformMessageBox {
			Title = "CONTROLLER"
			message = "Please reconnect the controller."
			buttons = [
				"CONTINUE"
			]
			user = <device_num>
			active_button = 0
		}
		controller_reconnected
	endif
	if NOT InFrontEnd
		if IsMoviePlaying \{TextureSlot = 0}
			ResumeMovie \{TextureSlot = 0}
		endif
		if IsMoviePlaying \{TextureSlot = 1}
			ResumeMovie \{TextureSlot = 1}
		endif
	endif
endscript

script controller_refresh 
	if (<original_device_num> = <device_num>)
		controller_reconnected <...>
		if NOT (AbortScript = DefaultAbortScript)
			Goto \{reload_anims_then_run_abort_script}
		endif
	endif
endscript

script controller_reconnected 
	if NOT GotParam \{leaving_net_game}
		if NOT InFrontEnd
			if NOT ScreenElementExists \{Id = view_goals_root}
				if NOT ScreenElementExists \{Id = timeline_vmenu}
					Restore_skater_camera
				endif
			endif
		endif
	endif
	dialog_box_exit \{anchor_id = link_lost_dialog_anchor
		dont_focus}
	if ScreenElementExists \{Id = controller_unplugged_dialog_anchor}
		DestroyScreenElement \{Id = controller_unplugged_dialog_anchor}
	endif
	if ScreenElementExists \{Id = keyboard_vmenu}
		LaunchEvent \{Type = Focus
			Target = keyboard_vmenu}
	endif
	if NOT GotParam \{leaving_net_game}
		sysnotify_handle_unpause
	endif
	if ScreenElementExists \{Id = dialog_box_anchor}
		LaunchEvent \{Type = Focus
			Target = dialog_box_vmenu}
		DoScreenElementMorph \{Id = dialog_box_anchor
			Alpha = 1}
	else
		if ScreenElementExists \{Id = current_menu_anchor}
			LaunchEvent \{Type = Focus
				Target = current_menu_anchor}
			if ScreenElementExists \{Id = current_menu}
				LaunchEvent \{Type = Focus
					Target = current_menu}
			endif
		endif
	endif
	if GotParam \{leaving_net_game}
		Printf \{"quitting network game!!!!!!!!!!!!!!!!!!!"}
		UnPauseGame
		quit_network_game
	else
		SpawnScriptLater \{wait_and_check_for_unplugged_controllers}
	endif
endscript

script wait_and_check_for_unplugged_controllers \{Time = 50}
	Wait <Time>
	Change \{check_for_unplugged_controllers = 1}
endscript
