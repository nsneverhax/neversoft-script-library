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
	if SystemUIDelayed
		<should_wait> = 1
		printf \{"WAITING FOR SYSTEM UI"}
	endif
	if ($g_connection_loss_dialogue = 1)
		<should_wait> = 1
		printf \{"WAITING FOR CONNECTION LOSS DIALOGUE"}
	endif
	if IsTrue \{$is_changing_levels}
		<should_wait> = 1
		printf \{"WAITING FOR ISCHANGINGLEVELS"}
	endif
	if IsTrue \{$igc_playing}
		<should_wait> = 1
		printf \{"WAITING FOR IGC"}
	endif
	if NOT CutsceneFinished \{Name = cutscene}
		<should_wait> = 1
		printf \{"WAITING FOR CUTSCENE"}
	endif
	if ($ui_pro_success_screen_active = 0)
		if ScreenElementExists \{id = screenfader}
			<should_wait> = 1
			printf \{"WAITING FOR SCREENFADER"}
		endif
	endif
	if (<should_wait> = 1)
		Change \{sysnotify_wait_in_progress = 1}
		Wait \{0.1
			Seconds}
	else
		Change \{sysnotify_wait_in_progress = 0}
		return
	endif
	repeat
endscript

script sysnotify_handle_pause_eject 
	if isps3
		if (RenderingEnabled)
			Change \{pause_no_render = 0}
			fade_overlay_on
		else
			Change \{pause_no_render = 1}
			StartRendering
			fade_overlay_on \{alpha = 1.0}
		endif
	endif
	PauseGh3Sounds \{no_seek}
	SetButtonEventMappings \{block_menu_input}
	sysnotify_handle_pause <...> seek_on_unpause
endscript

script sysnotify_handle_pause_controller 
	if isps3
		if ($g_top_rockers_setlist = 0)
			notify_box \{container_id = notify_controller_static_text_container
				line1 = "YOU ARE ROCKING OUT A BIT TOO HARD"
				line2 = "Please ensure a controller is connected properly"
				menu_z = 510000}
			if (RenderingEnabled)
				Change \{pause_no_render = 0}
				fade_overlay_on
			else
				Change \{pause_no_render = 1}
				StartRendering
				fade_overlay_on \{alpha = 1.0}
			endif
			SetButtonEventMappings \{block_menu_input}
			sysnotify_handle_pause <...> from_controller
		endif
	else
		sysnotify_handle_pause <...> from_controller
	endif
endscript

script sysnotify_handle_pause_console 
	if isps3
		if (RenderingEnabled)
			Change \{pause_no_render = 0}
			fade_overlay_on
		else
			if ($is_changing_levels = 0)
				Change \{pause_no_render = 1}
			endif
			StartRendering
			fade_overlay_on \{alpha = 1.0}
		endif
	endif
	sysnotify_handle_pause <...>
endscript

script sysnotify_handle_pause 
	printf \{"----------------------"}
	printf \{"sysnotify_handle_pause"}
	printf \{"----------------------"}
	if ($paused_for_hardware = 1)
		return
	endif
	sysnotify_wait_until_safe
	<should_pause_for_hardware> = 0
	if isps3
		<should_pause_for_hardware> = 1
	else
		if NOT GotParam \{from_controller}
			<should_pause_for_hardware> = 1
		endif
	endif
	if (<should_pause_for_hardware> = 1)
		Change \{paused_for_hardware = 1}
		Change \{blade_active = 1}
	endif
	Change \{sysnotify_game_already_paused = 1}
	if (($is_network_game) || ($g_connection_loss_dialogue))
		return
	endif
	if GameIsPaused
		printf \{"Game is already paused"}
		return
	endif
	Change \{sysnotify_game_already_paused = 0}
	if ($shutdown_game_for_signin_change_flag = 1)
		return
	endif
	if ScriptIsRunning \{GuitarEvent_SongWon_Spawned}
		return
	endif
	if (($game_mode = tutorial) && ($playing_song = 1))
		show_training_pause_screen <...>
	else
		gh3_start_pressed <...>
	endif
endscript

script sysnotify_handle_unpause_eject 
	if isps3
		kill_notify_box \{container_id = notify_eject_static_text_container}
		if ($pause_no_render = 1)
			Change \{pause_no_render = 0}
			StopRendering
		endif
		fade_overlay_off
	endif
	if (($is_network_game) || ($g_connection_loss_dialogue))
		UnPauseGh3Sounds \{seek_on_unpause}
	endif
	SetButtonEventMappings \{unblock_menu_input}
	sysnotify_handle_unpause <...> seek_on_unpause
endscript

script sysnotify_handle_unpause_controller 
	if isps3
		if ($g_top_rockers_setlist = 0)
			kill_notify_box \{container_id = notify_controller_static_text_container}
			if ($pause_no_render = 1)
				Change \{pause_no_render = 0}
				StopRendering
			endif
			fade_overlay_off
			SetButtonEventMappings \{unblock_menu_input}
			sysnotify_handle_unpause <...>
		endif
	else
		sysnotify_handle_unpause <...>
	endif
endscript

script sysnotify_handle_unpause_console 
	if isps3
		if ($pause_no_render = 1)
			Change \{pause_no_render = 0}
			StopRendering
		endif
		fade_overlay_off
		ReAcquireControllers
	endif
	sysnotify_handle_unpause <...>
endscript

script sysnotify_handle_unpause 
	printf \{"------------------------"}
	printf \{"sysnotify_handle_unpause"}
	printf \{"------------------------"}
	Change \{wait_for_sysnotify_unpause_flag = 1}
	if ShouldGameBePausedDueToSysNotification
		return
	endif
	sysnotify_wait_until_safe
	Change \{paused_for_hardware = 0}
	Change \{blade_active = 0}
	if (($is_network_game) || ($g_connection_loss_dialogue))
		return
	endif
	if NOT GameIsPaused
		return
	endif
	if ($sysnotify_game_already_paused = 0)
		if NOT ($playing_song = 1 && $is_attract_mode = 0)
			gh3_start_pressed <...>
		endif
	endif
	Change \{sysnotify_game_already_paused = 0}
endscript
fade_overlay_count = 0

script fade_overlay_on \{alpha = 0.9}
	if isps3
		if NOT ScreenElementExists \{id = pause_fader}
			CreateScreenElement {
				Type = SpriteElement
				id = pause_fader
				parent = root_window
				texture = black
				rgba = [0 0 0 255]
				Pos = (640.0, 360.0)
				dims = (1280.0, 720.0)
				just = [center center]
				z_priority = 509000
				alpha = <alpha>
			}
		endif
		Change fade_overlay_count = ($fade_overlay_count + 1)
	endif
endscript

script fade_overlay_off 
	if isps3
		Change fade_overlay_count = ($fade_overlay_count - 1)
		if ($fade_overlay_count < 0)
			Change \{fade_overlay_count = 0}
		endif
		if ($fade_overlay_count = 0)
			if ScreenElementExists \{id = pause_fader}
				DestroyScreenElement \{id = pause_fader}
			endif
		endif
	endif
endscript

script sysnotify_reset_user_progress 
	reset_gamemode
	Change \{attempted_xbox_autoload = 0}
	Change \{no_load = 0}
	Change \{xenon_device_checked = -1}
	Change \{ui_cas_skater_selected = 0}
endscript
signin_change_happening = 0

script sysnotify_handle_signin_change 
	printf \{"------------------------------"}
	printf \{"sysnotify_handle_signin_change"}
	printf \{"------------------------------"}
	Change \{invite_controller = -1}
	if ($signin_change_happening = 1)
		printf \{"ALREADY BEING PROCESSED"}
		return
	endif
	Change \{signin_change_happening = 1}
	sysnotify_wait_until_safe
	if ($ui_x360_sign_in_checked = 1)
		Change \{ui_x360_sign_in_checked = 0}
		Change \{signin_change_happening = 0}
		return
	endif
	switch <message>
		case live_connection_lost
		if InFrontend
			if NOT ($is_network_game)
				Change \{signin_change_happening = 0}
				return
			else
				sysnotify_handle_connection_loss
			endif
		else
			if NOT ($is_network_game)
				Change \{signin_change_happening = 0}
				return
			else
				sysnotify_handle_connection_loss
			endif
		endif
		case live_connection_gained
		if (($playing_song) && ($is_network_game = 0))
			xenon_singleplayer_session_init
			Change \{signin_change_happening = 0}
			return
		else
			Change \{signin_change_happening = 0}
			return
		endif
		case user_changed
		printf \{"sysnotify_handle_signin_change - user changed"}
		if ($respond_to_signin_changed = 1)
			handle_signin_changed
		endif
		default
		printf \{"- no response required"}
		Change \{signin_change_happening = 0}
		return
	endswitch
	Change \{signin_change_happening = 0}
endscript
sysnotify_allow_invite = 1

script sysnotify_handle_game_invite 
	printf \{"----------------------------"}
	printf \{"sysnotify_handle_game_invite"}
	printf \{"----------------------------"}
	sysnotify_invite_go <...>
endscript

script sysnotify_invite_cancel 
	sysnotify_handle_unpause
	dialog_box_exit
endscript

script sysnotify_invite_go 
	printf \{"----sysnotify_invite_go"}
	if GotParam \{cross_game}
		cross_game_invite_accepted <...>
	else
		if (($is_network_game = 1) && ($ui_flow_manager_state [0] = online_character_select_fs))
			LaunchEvent \{Type = unfocus
				target = vmenu_character_select_p1}
		endif
		if ($in_signin_changed_menu = 1)
			destroy_signin_changed_menu
		endif
		sysnotify_wait_until_safe
		start_checking_for_signin_change
		invite_accepted <...>
	endif
endscript

script cross_game_invite_accepted 
endscript
g_connection_loss_dialogue = 0

script sysnotify_handle_connection_loss 
	printf \{"--------------------------------"}
	printf \{"sysnotify_handle_connection_loss"}
	printf \{"--------------------------------"}
	if ($g_connection_loss_dialogue = 1)
		return
	endif
	sysnotify_wait_until_safe
	Change \{g_connection_loss_dialogue = 1}
	wait_for_safe_shutdown
	cleanup_sessionfuncs
	xboxlive_lost_connection_ui_cleanup
	create_link_unplugged_dialog
	Change \{g_connection_loss_dialogue = 0}
endscript

script sysnotify_cleanup_misc 
	if ScreenElementExists \{id = root_window}
		LaunchEvent \{Type = unfocus
			target = root_window}
	endif
	sysnotify_cleanup_ui
	if InFrontend
		KillSpawnedScript \{Name = attract_mode_timer}
		if ScreenElementExists \{id = cas_category_anchor}
			DestroyScreenElement \{id = cas_category_anchor}
		endif
		if ScreenElementExists \{id = progress_anchor}
			DestroyScreenElement \{id = progress_anchor}
		endif
	endif
	destroy_onscreen_keyboard
	if InNetGame
		force_close_rankings \{dont_retry}
		if LocalSkaterExists
			skater :Vibrate \{OFF}
		endif
		if NOT IsObserving
			ExitSurveyorMode
		endif
		dialog_box_exit \{anchor_id = link_lost_dialog_anchor}
		dialog_box_exit \{anchor_id = quit_dialog_anchor}
	endif
	if ScreenElementExists \{id = piece_menu_hmenu}
		DestroyScreenElement \{id = piece_menu_hmenu}
	endif
	dialog_box_exit
	Change \{main_menu_return_to_createamodes = 0}
	Change \{check_for_unplugged_controllers = 0}
	Change \{inside_pause = 0}
	kill_start_key_binding
	KillSpawnedScript \{Name = main_menu_exit}
	GetCurrentLevel
	if (<level> = load_z_bedroom)
		if ViewportExists \{id = z_bedroom_select_viewport}
			z_bedroom_kill_select_bink
		endif
		z_bedroom_exit_unload
	endif
endscript

script sysnotify_cleanup_ui 
	printf \{"--------------------------------"}
	printf \{"sysnotify_cleanup_ui"}
	printf \{"--------------------------------"}
	KillSpawnedScript \{Name = ui_mainmovies_wait_for_movie}
	KillSpawnedScript \{Name = ui_initial_interactive_screen}
	KillSpawnedScript \{Name = ui_attract_wait_for_movie}
	KillSpawnedScript \{Name = ui_mainmenu_wait_for_movie}
	KillSpawnedScript \{Name = attract_timer_wait}
	KillSpawnedScript \{Name = goal_classic_mode_post_cams}
	KillSpawnedScript \{Name = goal_classic_mode_show_cams}
	KillSkaterCamAnim \{Name = goal_classic_mode_cam}
	if ScreenElementExists \{id = ui_mainmovie_wait_anchor}
		DestroyScreenElement \{id = ui_mainmovie_wait_anchor}
	endif
	if IsMoviePlaying \{textureSlot = 0}
		KillMovie \{textureSlot = 0}
	endif
	if IsMoviePlaying \{textureSlot = 1}
		KillMovie \{textureSlot = 1}
	endif
	if ViewportExists \{id = z_mainmenu_bink_viewport}
		PushAssetContext \{context = Z_Mainmenu}
		DestroyViewportTextureOverride \{id = z_mainmenu_bink_viewport}
		DestroyViewport \{id = z_mainmenu_bink_viewport}
		PopAssetContext
	endif
	if ViewportExists \{id = thp8_shop_viewport}
		PushAssetContext \{context = Z_Shops}
		DestroyViewportTextureOverride \{id = thp8_shop_viewport}
		DestroyViewport \{id = thp8_shop_viewport}
		PopAssetContext
	endif
	Change \{pause_fmv_playing = 0}
	KillSpawnedScript \{Name = xenon_handle_first_input}
	if ScreenElementExists \{id = edit_tricks_menu_parts_anchor}
		DestroyScreenElement \{id = edit_tricks_menu_parts_anchor}
	endif
	if ScreenElementExists \{id = edit_tricks_sub_menu_anchor}
		DestroyScreenElement \{id = edit_tricks_sub_menu_anchor}
	endif
	if ScreenElementExists \{id = choose_trick_menu_container}
		DestroyScreenElement \{id = choose_trick_menu_container}
	endif
	if ScreenElementExists \{id = ui_mainmenu_wait_anchor}
		DestroyScreenElement \{id = ui_mainmenu_wait_anchor}
	endif
	if ScreenElementExists \{id = goal_presentation_anchor}
		DestroyScreenElement \{id = goal_presentation_anchor}
	endif
	if ScreenElementExists \{id = select_skater_anchor}
		DestroyScreenElement \{id = select_skater_anchor}
	endif
	KillSpawnedScript \{Name = goal_create_pro_success_screen}
	KillSpawnedScript \{Name = goal_destroy_pro_success_screen}
	KillSpawnedScript \{Name = goal_generic_exit_menu_and_videos}
	if ($ui_pro_success_screen_active = 1)
		if GMan_HasActiveGoals
			GMan_GetActivatedGoalId
			goal_destroy_pro_success_screen do_pause = 0 goal = <activated_goal_id> pass_pro_goal = 0
		endif
	endif
endscript

script notify_box \{scale1 = 0.75
		scale2 = 0.6
		container_pos = (0.0, 0.0)}
	if ScreenElementExists id = <container_id>
		return
	endif
	CreateScreenElement {
		Type = ContainerElement
		parent = root_window
		id = <container_id>
		Pos = <container_pos>
	}
	menu_font = fontgrid_title_gh3
	if GotParam \{line3}
		displaySprite parent = <container_id> tex = Dialog_BG Pos = (640.0, 24.0) Scale = (3.0, 2.0) z = <menu_z> just = [center top]
		displaySprite parent = <container_id> tex = Dialog_BG flip_h Pos = (640.0, 120.0) Scale = (3.0, 2.0) z = <menu_z> just = [center top]
	else
		displaySprite parent = <container_id> tex = Dialog_BG Pos = (640.0, 32.0) Scale = (3.0, 1.5) z = <menu_z> just = [center top]
		displaySprite parent = <container_id> tex = Dialog_BG flip_h Pos = (640.0, 112.0) Scale = (3.0, 1.5) z = <menu_z> just = [center top]
	endif
	CreateScreenElement {
		Type = TextElement
		parent = <container_id>
		font = <menu_font>
		Scale = <scale1>
		rgba = [180 50 50 255]
		text = <line1>
		just = [center top]
		z_priority = (<menu_z> + 0.2)
		Pos = (640.0, 80.0)
	}
	CreateScreenElement {
		Type = TextElement
		parent = <container_id>
		font = <menu_font>
		Scale = <scale2>
		rgba = [0 0 0 255]
		text = <line2>
		just = [center top]
		z_priority = (<menu_z> + 0.2)
		Pos = (640.0, 124.0)
	}
	if GotParam \{line3}
		CreateScreenElement {
			Type = TextElement
			parent = <container_id>
			font = <menu_font>
			Scale = <scale2>
			rgba = [0 0 0 255]
			text = <line3>
			just = [center top]
			z_priority = (<menu_z> + 0.2)
			Pos = (640.0, 160.0)
		}
	endif
endscript

script kill_notify_box \{container_id = notify_static_text_container}
	if ScreenElementExists id = <container_id>
		DestroyScreenElement id = <container_id>
	endif
endscript
wait_for_sysnotify_unpause_flag = 0

script wait_for_sysnotify_unpause 
	Change \{wait_for_sysnotify_unpause_flag = 0}
	printf \{"Waiting for sysnotify Pause Off"}
	begin
	printf "Waiting for sysnotify paused_for_hardware = %i" i = ($paused_for_hardware)
	if ($wait_for_sysnotify_unpause_flag = 1)
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script xboxlive_lost_connection_ui_cleanup 
	if ($is_network_game)
		cancel_join_server
		destroy_connection_dialog_scroller
		KillSpawnedScript \{id = client_lobby_setup}
		fadetoblack \{On
			time = 0
			alpha = 1.0
			z_priority = 20000
			id = invite_screenfader}
		Wait \{1
			gameframe}
		StopRendering
		shutdown_game_for_signin_change \{unloadcontent = 0}
		StartRendering
		Wait \{60
			gameframes}
		fadetoblack \{OFF
			time = 0
			id = invite_screenfader}
		Wait \{1
			gameframe}
	endif
endscript
