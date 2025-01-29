paused_for_hardware = 0
blade_active = 0
pause_no_render = 0
sysnotify_wait_in_progress = 0
xenon_device_checked = -1
rocking_out_too_hard = 0

script sysnotify_wait_until_safe 
	begin
	<should_wait> = 0
	if SystemUIDelayed
		<should_wait> = 1

	endif
	if IsTrue \{$is_changing_levels}
		<should_wait> = 1

	endif
	if IsTrue \{$igc_playing}
		<should_wait> = 1

	endif
	if NOT CutsceneFinished \{Name = cutscene}
		<should_wait> = 1

	endif
	if ($ui_pro_success_screen_active = 0)
		if ScreenElementExists \{id = screenfader}
			<should_wait> = 1

		endif
	endif
	if NOT GotParam \{ignore_connection_loss}
		if ScriptIsRunning \{sysnotify_handle_connection_loss}
			<should_wait> = 1
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
	PauseGh3Sounds \{no_seek}
	SetButtonEventMappings \{block_menu_input}
	sysnotify_handle_pause <...> seek_on_unpause
endscript

script sysnotify_handle_disconnect_mic 



endscript

script sysnotify_handle_connect_mic 



endscript

script 0xd140cb78 
	if ui_event_exists_in_stack \{above = 'gameplay'
			Name = 'pausemenu'}
		return \{FALSE}
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			Name = 'song_unpause'}
		return \{FALSE}
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			Name = 'fail_song'}
		return \{FALSE}
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			Name = 'song_breakdown'}
		return \{FALSE}
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			Name = 'options_calibrate_lag_warning'}
		return \{FALSE}
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			Name = 'encore_confirmation'}
		return \{FALSE}
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			Name = 'pausemenu_quit_warning'}
		return \{FALSE}
	elseif ui_event_exists_in_stack \{Name = 'metallifacts'}
		return \{FALSE}
	elseif ScriptIsRunning \{GuitarEvent_SongWon_Spawned}
		return \{FALSE}
	elseif ScriptIsRunning \{GuitarEvent_SongFailed_Spawned}
		return \{FALSE}
	elseif NOT ($MemcardDoneScript = nullscript)
		return \{FALSE}
	endif
	return \{true}
endscript
sysnotify_paused_controllers = [
]

script sysnotify_handle_pause_controller 
	setscriptcannotpause



	if ($allow_console_pause_for_cal_lag = 1)
		setup_calibration_lag_none
		ui_event \{event = menu_refresh}
		return
	endif
	GetArraySize \{$sysnotify_paused_controllers}
	original_array_size = <array_Size>
	if (<array_Size> > 0)
		i = 0
		begin
		if (($sysnotify_paused_controllers [<i>]) = <device_num>)
			return
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	if ($g_in_tutorial = 0)
		if NOT ($playing_song)
			return
		endif
	endif
	if ui_event_exists_in_stack \{above = 'gameplay'
			Name = 'pausemenu'}
		return
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			Name = 'song_unpause'}
		return
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			Name = 'fail_song'}
		return
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			Name = 'song_breakdown'}
		return
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			Name = 'options_calibrate_lag_warning'}
		return
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			Name = 'encore_confirmation'}
		return
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			Name = 'pausemenu_quit_warning'}
		return
	elseif ui_event_exists_in_stack \{Name = 'metallifacts'}
		return
	elseif ($g_tutorial_pause_is_up = 1)
		tutorial_close_pause_window \{dont_unpause}
	elseif ScriptIsRunning \{GuitarEvent_SongWon_Spawned}
		return
	elseif ScriptIsRunning \{GuitarEvent_SongFailed_Spawned}
		return
	elseif NOT ($MemcardDoneScript = nullscript)
		return
	endif
	array = $sysnotify_paused_controllers
	AddArrayElement array = <array> element = <device_num>
	Change sysnotify_paused_controllers = <array>
	if (<original_array_size> > 0)
		return
	endif
	KillSpawnedScript \{Name = sysnotify_handle_pause_controller_spawned}
	SpawnScriptNow sysnotify_handle_pause_controller_spawned params = {<...>}
endscript
0x017f1c77 = 0

script sysnotify_handle_pause_controller_spawned 
	if ($0x017f1c77 = 0)
		0x4902da04 = 1
		begin
		ui_event_wait_for_safe
		wait_for_safe_shutdown
		if NOT ScreenElementExists \{id = loading_screen_container}
			if ui_event_exists_in_stack \{above = 'gameplay'
					Name = 'controller_disconnect'}
				return
			endif
			if NOT 0xd140cb78
				return
			endif
			if (<0x4902da04> = 1)
				Wait \{0.5
					Seconds}
				<0x4902da04> = 0
			else
				break
			endif
		else
			<0x4902da04> = 1
		endif
		WaitOneGameFrame
		repeat
	endif
	ui_event event = menu_change state = uistate_controller_disconnect data = {device_num = <device_num> is_popup}
endscript

script sysnotify_handle_pause_console 



	sys_fade_overlay_on \{alpha = 1.0}
	sysnotify_handle_pause <...>
endscript

script sysnotify_handle_pause 



	if ($allow_console_pause_for_cal_lag = 1)
		setup_calibration_lag_none
		ui_event \{event = menu_refresh}
	endif
	if ($paused_for_hardware = 1)
		return
	endif
	if (($is_network_game) || ($g_connection_loss_dialogue))
		return
	endif
	wait_for_careeritnro
	SetButtonEventMappings \{block_menu_input}
	sysnotify_wait_until_safe
	ui_event_wait_for_safe
	Change \{paused_for_hardware = 1}
	Change \{blade_active = 1}
	if GameIsPaused

		if ui_event_exists_in_stack \{above = 'gameplay'
				Name = 'song_unpause'}
			ui_song_unpause_repause \{from_system}
		endif
		return
	endif
	if ($shutdown_game_for_signin_change_flag = 1)
		return
	endif
	if ScriptIsRunning \{GuitarEvent_SongWon_Spawned}
		return
	endif
	if ($is_attract_mode = 1)
		return
	endif
	if ($g_in_tutorial = 1)
		if NOT ScreenElementExists \{id = popup_warning_container}
			show_training_pause_screen <...>
		endif
	else
		if ($playing_song = 1)
			do_gh3_pause
		endif
	endif
endscript

script sysnotify_handle_unpause_eject 
	kill_notify_box \{container_id = notify_eject_static_text_container}
	sys_fade_overlay_off
	if (($is_network_game) || ($g_connection_loss_dialogue))
		UnPauseGh3Sounds \{seek_on_unpause}
	endif
	SetButtonEventMappings \{unblock_menu_input}
	sysnotify_handle_unpause <...> seek_on_unpause
endscript

script sysnotify_handle_unpause_controller 



	GetArraySize \{$sysnotify_paused_controllers}
	if (<array_Size> > 0)
		i = 0
		begin
		if (($sysnotify_paused_controllers [<i>]) = <device_num>)
			array = $sysnotify_paused_controllers
			RemoveArrayElement array = <array> index = <i>
			Change sysnotify_paused_controllers = <array>
			break
		endif
		i = (<i> + 1)
		repeat <array_Size>
		if (<i> = <array_Size>)
			return
		endif
	endif
	GetArraySize \{$sysnotify_paused_controllers}
	if (<array_Size> > 0)
		return
	endif
	Change \{rocking_out_too_hard = 0}
	if NOT ($playing_song)
		return
	endif
	setsystemnotificationposition Pos = ($sysnotify_ingame_position)
endscript

script sysnotify_handle_unpause_console 



	sys_fade_overlay_off
	ReAcquireControllers
	sysnotify_handle_unpause <...>
endscript

script sysnotify_handle_unpause 



	Change \{wait_for_sysnotify_unpause_flag = 1}
	SetButtonEventMappings \{unblock_menu_input}
	sysnotify_wait_until_safe
	if ($end_credits = 1)
		do_gh3_unpause
	endif
	ui_event_wait_for_safe
	Change \{paused_for_hardware = 0}
	Change \{blade_active = 0}
	if (($is_network_game) || ($g_connection_loss_dialogue))
		return
	endif
	if ShouldGameBePausedDueToSysNotification
		return
	endif
	if NOT GameIsPaused
		return
	elseif ($is_attract_mode = 1)
		return
	elseif ($g_in_tutorial = 1)
		return
	elseif ($end_credits = 1)
		do_gh3_unpause
		return
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			Name = 'pausemenu'}
		return
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			Name = 'controller_disconnect'}
		return
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			Name = 'pausemenu_quit_warning'}
		return
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			Name = 'song_breakdown'}
		return
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			Name = 'fail_song'}
		return
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			Name = 'options_calibrate_lag'}
		return
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			Name = 'options_calibrate_lag_warning'}
		return
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			Name = 'encore_confirmation'}
		return
	elseif ui_event_exists_in_stack \{Name = 'metallifacts'}
		do_gh3_unpause
		return
	endif
	if ($playing_song = 1)
		GetGlobalTags \{user_options
			param = unpause_count}
		if (<unpause_count> = 0)
			do_gh3_unpause
		else
			disable_pause
			ui_event_block \{event = menu_change
				data = {
					state = uistate_song_unpause
				}}
			enable_pause
		endif
	endif
endscript
fade_overlay_count = 0
ps3_fade_overlay_z = 509000
ps3_fader_started_rendering = 0

script sys_fade_overlay_on \{alpha = 0.8}
	if NOT ScreenElementExists \{id = pause_fader}
		if ($rendering_has_been_stopped_explicit = true)
			if ($ps3_fader_started_rendering = 0)
				StartRendering \{reason = explicit}
				Change \{ps3_fader_started_rendering = 1}
			endif
		endif
		CreateScreenElement {
			Type = SpriteElement
			id = pause_fader
			parent = root_window
			texture = black
			rgba = [0 0 0 255]
			Pos = (640.0, 360.0)
			dims = (1280.0, 720.0)
			just = [center center]
			z_priority = $ps3_fade_overlay_z
			alpha = <alpha>
		}
	endif

	Change fade_overlay_count = ($fade_overlay_count + 1)
	if ($fade_overlay_count > 16)

	endif
endscript

script sys_fade_overlay_off 

	if ($fade_overlay_count <= 0)
		return
	endif
	Change fade_overlay_count = ($fade_overlay_count - 1)
	if ($fade_overlay_count <= 0)
		if ScreenElementExists \{id = pause_fader}
			if ($ps3_fader_started_rendering = 1)
				Change \{ps3_fader_started_rendering = 0}
				StopRendering \{reason = explicit}
			endif
			DestroyScreenElement \{id = pause_fader}
		endif
	endif
endscript
signin_change_happening = 0

script sysnotify_handle_signin_change 



	Change \{invite_controller = -1}
	if ($signin_change_happening = 1)

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
		if NOT ($is_network_game)
			Change \{signin_change_happening = 0}
			return
		else
			sysnotify_handle_connection_loss
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

		if ($respond_to_signin_changed = 1)
			if (<controller> = ($primary_controller))

				handle_signin_changed
			else
				if ($respond_to_signin_changed_all_players = 1)

					if ($is_network_game)
						get_local_players_in_game
					else
						gamemode_getnumplayersshown
						num_local_players = <num_players_shown>
					endif
					index = 1
					if (<num_local_players> > 0)
						begin
						<player_status> = ($0x2994109a [<index>])

						if ($<player_status>.controller = <controller>)

							handle_signin_changed
							Change \{signin_change_happening = 0}
							return
						endif
						index = (<index> + 1)
						repeat <num_local_players>
					endif
					if ($playing_song = 1)
						removecontentfiles playerid = <controller>
						mark_globaltags_to_invalidate savegame = <controller>
						cheat_turnoffalllocked
					else
						removecontentfiles playerid = <controller>
						reset_globaltags savegame = <controller>
						cheat_turnoffalllocked
					endif
				else

					removecontentfiles playerid = <controller>
					reset_globaltags savegame = <controller>
					cheat_turnoffalllocked
				endif
			endif
		else

			if NOT ($respond_to_signin_changed_func = None)
				func = ($respond_to_signin_changed_func)
				<func> <...>
			endif
		endif
		default

		Change \{signin_change_happening = 0}
		return
	endswitch
	Change \{signin_change_happening = 0}
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

	if GotParam \{cross_game}
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




	Change \{g_connection_loss_dialogue = 1}
	destroy_player_drop_events
	Change \{net_ready_to_start = 1}
	destroy_net_setup
	sysnotify_wait_until_safe \{ignore_connection_loss}
	wait_for_safe_shutdown
	displaySprite \{parent = root_window
		tex = boot_brick_bg
		Pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		just = [
			center
			center
		]
		z = 95}
	disable_pause
	cleanup_sessionfuncs
	ui_event_wait_for_safe
	ui_event_block \{event = menu_back
		data = {
			state = uistate_null
		}}
	xboxlive_lost_connection_ui_cleanup
	ui_event_block event = menu_replace data = {state = uistate_connection_loss clear_previous_stack <...>}
	destroy_loading_screen
	killallmovies
	<id> :Die
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
	menu_font = fontgrid_title_a1
	if GotParam \{line3}
		displaySprite parent = <container_id> tex = dialog_menu_bg Pos = (640.0, 24.0) Scale = (3.0, 2.0) z = <menu_z> just = [center top]
		displaySprite parent = <container_id> tex = dialog_menu_bg flip_h Pos = (640.0, 120.0) Scale = (3.0, 2.0) z = <menu_z> just = [center top]
	else
		displaySprite parent = <container_id> tex = dialog_menu_bg Pos = (640.0, 32.0) Scale = (3.0, 1.5) z = <menu_z> just = [center top]
		displaySprite parent = <container_id> tex = dialog_menu_bg flip_h Pos = (640.0, 112.0) Scale = (3.0, 1.5) z = <menu_z> just = [center top]
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

	begin

	if (($wait_for_sysnotify_unpause_flag = 1) && ($paused_for_hardware = 0))
		break
	endif
	WaitOneGameFrame
	repeat
endscript

script xboxlive_lost_connection_ui_cleanup 
	if ($is_network_game)
		cancel_join_server
		destroy_connection_dialog_scroller
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

script sysnotify_handle_pause_mic 
	stars


	stars
	if isps2
		if NOT ($playing_song)
			return
		endif
	endif
	ui_event_wait event = menu_change state = uistate_mic_disconnect data = {controller = <device_num>}
endscript

script sysnotify_handle_unpause_mic 
	stars


	stars
	if isps2
		if NOT ($playing_song)
			return
		endif
	endif
endscript
