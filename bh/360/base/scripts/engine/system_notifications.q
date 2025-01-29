paused_for_hardware = 0
blade_active = 0
sysnotify_wait_in_progress = 0
xenon_device_checked = -1
g_boot_sysnotify_wait = true

script sysnotify_wait_until_safe 
	begin
	<should_wait> = 0
	if ($g_boot_sysnotify_wait = true)
		<should_wait> = 1
		printf \{qs(0xfe226340)}
	endif
	if SystemUIDelayed
		<should_wait> = 1
		printf \{qs(0xd1fc043b)}
	endif
	if IsTrue \{$is_changing_levels}
		<should_wait> = 1
		printf \{qs(0x5715648c)}
	endif
	if IsTrue \{$igc_playing}
		<should_wait> = 1
		printf \{qs(0x3e8990f4)}
	endif
	if NOT CutsceneFinished \{name = cutscene}
		<should_wait> = 1
		printf \{qs(0x30949f69)}
	endif
	if ($ui_pro_success_screen_active = 0)
		if ScreenElementExists \{id = screenfader}
			<should_wait> = 1
			printf \{qs(0xb27f946b)}
		endif
	endif
	if NOT GotParam \{ignore_connection_loss}
		if ScriptIsRunning \{sysnotify_handle_connection_loss}
			printf \{qs(0xc82cfa4f)}
			<should_wait> = 1
		endif
	endif
	if (<should_wait> = 1)
		Change \{sysnotify_wait_in_progress = 1}
		wait \{0.1
			seconds}
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
sysnotify_paused_controllers = [
]

script sysnotify_handle_pause_controller 
	SetScriptCannotPause
	printf \{qs(0x86fbe77a)}
	printf \{qs(0x9eceeeee)}
	printf \{qs(0x86fbe77a)}
	if ($allow_console_pause_for_cal_lag = 1)
		setup_calibration_lag_none
		ui_event \{event = menu_refresh}
		return
	endif
	GetArraySize \{$sysnotify_paused_controllers}
	original_array_size = <array_size>
	if (<array_size> > 0)
		i = 0
		begin
		if (($sysnotify_paused_controllers [<i>]) = <device_num>)
			return
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	array = $sysnotify_paused_controllers
	AddArrayElement array = <array> element = <device_num>
	Change sysnotify_paused_controllers = <array>
	if (<original_array_size> > 0)
		return
	endif
	GameMode_GetType
	if (<type> = freeplay)
		return
	endif
	if ($in_band_lobby = 1)
		return
	endif
	if ($g_in_tutorial = 0)
		if NOT ($playing_song)
			return
		endif
	endif
	if ui_event_exists_in_stack \{above = 'gameplay'
			name = 'pausemenu'}
		return
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			name = 'song_unpause'}
		ui_event_block \{event = menu_back}
		if NOT InInternetMode
			PauseGame
		endif
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			name = 'fail_song'}
		return
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			name = 'song_breakdown'}
		return
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			name = 'controller_disconnect'}
		return
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			name = 'options_calibrate_lag_warning'}
		return
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			name = 'encore_confirmation'}
		return
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			name = 'pausemenu_quit_warning'}
		return
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			name = 'pausemenu_restart_warning'}
		return
	elseif ($in_sing_a_long = true)
		return
	elseif ($tutorial_paused = 1)
		tutorial_system_pausemenu_destroy \{dont_unpause}
	elseif NOT ($MemcardDoneScript = nullscript)
		return
	elseif ($net_popup_active = 1)
		return
	endif
	ui_event event = menu_change state = UIstate_controller_disconnect data = {device_num = <device_num> is_popup}
endscript

script sysnotify_handle_pause_console 
	printf \{qs(0x28151c2d)}
	printf \{qs(0xca555308)}
	printf \{qs(0x28151c2d)}
	sysnotify_handle_pause <...>
endscript

script sysnotify_handle_pause 
	printf \{qs(0xab786eba)}
	printf \{qs(0xea2c5792)}
	printf \{qs(0xab786eba)}
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
	GameMode_GetType
	if (<type> = freeplay)
		i = 1
		begin
		GetPlayerInfo <i> freeplay_state
		if NOT (<freeplay_state> = dropped)
			break
		endif
		i = (<i> + 1)
		repeat 4
		if (<i> = 5)
			return
		endif
	endif
	SetButtonEventMappings \{block_menu_input}
	sysnotify_wait_until_safe
	ui_event_wait_for_safe
	Change \{paused_for_hardware = 1}
	Change \{blade_active = 1}
	if GameIsPaused
		printf \{qs(0xfb887cbe)}
		if ui_event_exists_in_stack \{above = 'gameplay'
				name = 'song_unpause'}
			ui_song_unpause_repause \{from_system}
			return
		endif
		begin
		if NOT GameIsPaused
			printf \{qs(0x40f55ee4)}
			break
		endif
		wait \{1
			gameframe}
		repeat 60
		if GameIsPaused
			return
		endif
	endif
	if ($shutdown_game_for_signin_change_flag = 1)
		return
	endif
	if ($g_in_tutorial = 0)
		if ($transition_playing = true)
			if NOT is_pausable_transition \{transition = $current_playing_transition}
				return
			endif
		endif
	endif
	if ScriptIsRunning \{GuitarEvent_SongWon_Spawned}
		return
	endif
	if ($g_in_tutorial = 1)
		if NOT ScreenElementExists \{id = generic_menu}
			if NOT ui_event_exists_in_stack \{name = 'memcard'}
				do_gh3_pause
			endif
		endif
	else
		if ($playing_song = 1)
			do_gh3_pause
		endif
	endif
endscript

script sysnotify_handle_unpause_eject 
	if IsPS3
		kill_notify_box \{container_id = notify_eject_static_text_container}
	endif
	if (($is_network_game) || ($g_connection_loss_dialogue))
		UnpauseGh3Sounds \{seek_on_unpause}
	endif
	SetButtonEventMappings \{unblock_menu_input}
	sysnotify_handle_unpause <...> seek_on_unpause
endscript

script sysnotify_handle_unpause_controller 
	printf \{qs(0x29ceb5b2)}
	printf \{qs(0xbc17ac78)}
	printf \{qs(0x29ceb5b2)}
	GetArraySize \{$sysnotify_paused_controllers}
	if (<array_size> > 0)
		i = 0
		begin
		if (($sysnotify_paused_controllers [<i>]) = <device_num>)
			array = $sysnotify_paused_controllers
			RemoveArrayElement array = <array> index = <i>
			Change sysnotify_paused_controllers = <array>
			break
		endif
		i = (<i> + 1)
		repeat <array_size>
		if (<i> = <array_size>)
			return
		endif
	endif
	GetArraySize \{$sysnotify_paused_controllers}
	if (<array_size> > 0)
		return
	endif
	if NOT ($playing_song)
		return
	endif
	SetSystemNotificationPosition Pos = ($sysnotify_ingame_position)
endscript

script sysnotify_handle_unpause_console 
	printf \{qs(0x37164e15)}
	printf \{qs(0x1ba67f36)}
	printf \{qs(0x37164e15)}
	sysnotify_handle_unpause <...>
endscript

script sysnotify_handle_unpause 
	printf \{qs(0xe416ec46)}
	printf \{qs(0x4b02efd7)}
	printf \{qs(0xe416ec46)}
	Change \{wait_for_sysnotify_unpause_flag = 1}
	SetButtonEventMappings \{unblock_menu_input}
	sysnotify_wait_until_safe
	ui_event_wait_for_safe
	Change \{paused_for_hardware = 0}
	Change \{blade_active = 0}
	if (($is_network_game) || ($g_connection_loss_dialogue))
		return
	endif
	if ShouldGameBePausedDueToSysNotification
		return
	endif
	GameMode_GetType
	if (<type> = freeplay)
		if ui_event_exists_in_stack \{above = 'gameplay'
				name = 'songlist'}
			return
		endif
		i = 1
		begin
		GetPlayerInfo <i> freeplay_state
		if NOT (<freeplay_state> = dropped)
			break
		endif
		i = (<i> + 1)
		repeat 4
		if (<i> = 5)
			no_countdown = 1
		endif
	endif
	if NOT GameIsPaused
		return
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			name = 'pausemenu'}
		return
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			name = 'controller_disconnect'}
		return
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			name = 'pausemenu_quit_warning'}
		return
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			name = 'song_breakdown'}
		return
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			name = 'fail_song'}
		return
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			name = 'options_calibrate_lag'}
		return
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			name = 'options_calibrate_lag_warning'}
		return
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			name = 'encore_confirmation'}
		return
	elseif ($g_in_tutorial = 1)
		do_gh3_unpause
		return
	elseif (($in_sing_a_long) = true)
		if ScreenElementExists \{id = dialog_box_desc_id}
			return
		endif
	elseif ($transition_playing = true)
		if NOT is_pausable_transition \{transition = $current_playing_transition}
			return
		endif
	endif
	if ($playing_song = 1)
		GetGlobalTags \{user_options
			param = unpause_count}
		if GotParam \{no_countdown}
			unpause_count = 0
		endif
		if (<unpause_count> = 0 || $transition_playing = true || $in_sing_a_long = true)
			do_gh3_unpause
			if (<type> = freeplay)
				freeplay_enable_menus
			endif
		else
			ui_event_wait \{event = menu_change
				data = {
					state = UIstate_song_unpause
				}}
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
			type = SpriteElement
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
	printscriptinfo \{'sys_fade_overlay_on'}
	Change fade_overlay_count = ($fade_overlay_count + 1)
	if ($fade_overlay_count > 16)
		ScriptAssert \{'sys_fade_overlay_count is suspiciously high'}
	endif
endscript

script sys_fade_overlay_off 
	printscriptinfo \{'sys_fade_overlay_off'}
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
	if ($g_boot_sysnotify_wait = true)
		if ($respond_to_signin_changed = 0)
			if ($respond_to_signin_changed_func = None)
				printf \{qs(0x5ab429fb)}
				return
			endif
		endif
	endif
	printf \{qs(0x37164e15)}
	printf qs(0xb6c3d3e1) d = <controller>
	printf \{qs(0x37164e15)}
	if (<message> = user_changed)
		if (<controller> = $invite_controller)
			Change \{invite_controller = -1}
		endif
	else
		Change \{invite_controller = -1}
	endif
	if ($signin_change_happening = 1)
		printf \{qs(0x0638d32c)}
		return
	endif
	Change \{signin_change_happening = 1}
	if GotParam \{live_connection_lost}
		if IsTrue \{$is_changing_levels}
			destroy_loading_screen
			Change \{is_changing_levels = 0}
		endif
	endif
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
		printf \{qs(0x55e8f027)}
		if NOT NetSessionFunc \{Obj = party
				func = is_host}
			NetSessionFunc {
				Obj = party
				func = remove_playr_from_party
				params = {
					controller_index = <controller>
				}
			}
		endif
		if ($respond_to_signin_changed = 1)
			if (<controller> = ($primary_controller))
				printf \{qs(0xe2600322)}
				handle_signin_changed \{is_primary_controller = 1}
			else
				if ($respond_to_signin_changed_all_players = 1)
					printf \{qs(0x208051b4)}
					GetNumPlayersInGame \{local}
					if (<num_players> > 0)
						GetFirstPlayer \{local}
						begin
						DumpPlayerInfo player = <player>
						if PlayerInfoEquals <player> controller = <controller>
							printf qs(0x3c569072) i = <player> c = <controller>
							handle_signin_changed
							Change \{signin_change_happening = 0}
							return
						endif
						GetNextPlayer local player = <player>
						repeat <num_players>
					endif
					if ($playing_song = 1)
						reset_dlc_signin_state
						mark_globaltags_to_invalidate savegame = <controller>
						cheat_turnoffalllocked
					else
						reset_dlc_signin_state
						reset_savegame savegame = <controller>
					endif
				else
					printf \{qs(0x6ff28a99)}
					reset_dlc_signin_state
					reset_savegame savegame = <controller>
				endif
			endif
		else
			printf \{qs(0x229ab93a)}
			if NOT ($respond_to_signin_changed_func = None)
				func = ($respond_to_signin_changed_func)
				printf 'Calling respond_to_signin_changed_func: %s' s = <func>
				<func> <...>
			endif
		endif
		default
		printf \{qs(0x57f6e4e8)}
		Change \{signin_change_happening = 0}
		return
	endswitch
	Change \{signin_change_happening = 0}
endscript
sysnotify_allow_invite = 1

script sysnotify_handle_game_invite 
	printf \{qs(0x881acbf3)}
	printf \{qs(0xd1557fb9)}
	printf \{qs(0x881acbf3)}
	sysnotify_invite_go <...>
endscript

script sysnotify_invite_cancel 
	sysnotify_handle_unpause
	dialog_box_exit
endscript

script sysnotify_invite_go 
	printf \{qs(0xc7289a32)}
	if ScriptIsRunning \{sysnotify_invite_go2}
		printf \{'sysnotify_invite_go: Killing previous sysnotify_invite_go2 script'}
		killspawnedscript \{name = sysnotify_invite_go2}
	endif
	printf \{'sysnotify_invite_go: Spawning sysnotify_invite_go2 script'}
	spawnscriptnow sysnotify_invite_go2 params = {<...>}
	printf \{qs(0xbbb782a7)}
endscript

script sysnotify_invite_go2 
	printf \{qs(0x4553ea63)}
	if GotParam \{cross_game}
		cross_game_invite_accepted <...>
	else
		sysnotify_wait_until_safe
		invite_accepted <...>
	endif
	printf \{qs(0x2c4093a5)}
endscript

script cross_game_invite_accepted 
endscript
g_connection_loss_dialogue = 0

script sysnotify_handle_connection_loss 
	printf \{qs(0x37164e15)}
	printf \{qs(0x6d5c96e2)}
	printf \{qs(0x37164e15)}
	printstruct <...>
	Change \{g_connection_loss_dialogue = 1}
	destroy_player_drop_events
	Change \{net_ready_to_start = 1}
	destroy_net_setup
	sysnotify_wait_until_safe \{ignore_connection_loss}
	wait_for_safe_shutdown
	Change \{respond_to_signin_changed = 1}
	Change \{respond_to_signin_changed_func = None}
	disable_pause
	cleanup_sessionfuncs
	ui_event_wait_for_safe
	ui_event_block \{event = menu_back
		data = {
			state = UIstate_null
		}}
	xboxlive_lost_connection_ui_cleanup
	ui_event_block event = menu_replace data = {state = UIstate_connection_loss clear_previous_stack <...>}
	destroy_loading_screen
	KillAllMovies
endscript

script notify_box \{scale1 = 0.75
		scale2 = 0.6
		container_pos = (0.0, 0.0)}
	if ScreenElementExists id = <container_id>
		return
	endif
	CreateScreenElement {
		type = ContainerElement
		parent = root_window
		id = <container_id>
		Pos = <container_pos>
	}
	menu_font = fontgrid_title_a1
	if GotParam \{line3}
		displaySprite parent = <container_id> tex = dialog_menu_bg Pos = (640.0, 24.0) scale = (3.0, 2.0) z = <menu_z> just = [center top]
		displaySprite parent = <container_id> tex = dialog_menu_bg flip_h Pos = (640.0, 120.0) scale = (3.0, 2.0) z = <menu_z> just = [center top]
	else
		displaySprite parent = <container_id> tex = dialog_menu_bg Pos = (640.0, 32.0) scale = (3.0, 1.5) z = <menu_z> just = [center top]
		displaySprite parent = <container_id> tex = dialog_menu_bg flip_h Pos = (640.0, 112.0) scale = (3.0, 1.5) z = <menu_z> just = [center top]
	endif
	CreateScreenElement {
		type = TextElement
		parent = <container_id>
		font = <menu_font>
		scale = <scale1>
		rgba = [180 50 50 255]
		text = <line1>
		just = [center top]
		z_priority = (<menu_z> + 0.2)
		Pos = (640.0, 80.0)
	}
	CreateScreenElement {
		type = TextElement
		parent = <container_id>
		font = <menu_font>
		scale = <scale2>
		rgba = [0 0 0 255]
		text = <line2>
		just = [center top]
		z_priority = (<menu_z> + 0.2)
		Pos = (640.0, 124.0)
	}
	if GotParam \{line3}
		CreateScreenElement {
			type = TextElement
			parent = <container_id>
			font = <menu_font>
			scale = <scale2>
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
	printf \{qs(0x7e1c2c48)
		channel = sysnotify}
	begin
	printf qs(0xf5e8c2d0) i = ($paused_for_hardware) channel = sysnotify
	if (($wait_for_sysnotify_unpause_flag = 1) && ($paused_for_hardware = 0))
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script xboxlive_lost_connection_ui_cleanup 
	if ($is_network_game)
		cancel_join_server
		destroy_connection_dialog_scroller
		fadetoblack \{on
			time = 0
			alpha = 1.0
			z_priority = 20000
			id = invite_screenfader}
		wait \{1
			gameframe}
		StopRendering
		shutdown_game_for_signin_change \{unloadcontent = 0}
		StartRendering
		wait \{60
			gameframes}
		fadetoblack \{off
			time = 0
			id = invite_screenfader}
		wait \{1
			gameframe}
	endif
endscript

script sysnotify_avatar_changed 
	printf \{'sysnotify_avatar_changed'}
	printstruct <...>
	globaltag_update_avatar_metadata savegame = <playerid>
endscript

script clear_paused_controllers 
	if ui_event_exists_in_stack \{above = 'gameplay'
			name = 'controller_disconnect'}
		return
	endif
	Change \{sysnotify_paused_controllers = [
		]}
endscript
