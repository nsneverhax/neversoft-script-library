paused_for_hardware = 0
blade_active = 0
sysnotify_wait_in_progress = 0
xenon_device_checked = -1

script sysnotify_wait_until_safe 
	begin
	<should_wait> = 0
	if systemuidelayed
		<should_wait> = 1
		printf \{qs(0xd1fc043b)}
	endif
	if istrue \{$is_changing_levels}
		<should_wait> = 1
		printf \{qs(0x5715648c)}
	endif
	if istrue \{$igc_playing}
		<should_wait> = 1
		printf \{qs(0x3e8990f4)}
	endif
	if NOT cutscenefinished \{name = cutscene}
		<should_wait> = 1
		printf \{qs(0x30949f69)}
	endif
	if ($ui_pro_success_screen_active = 0)
		if screenelementexists \{id = screenfader}
			<should_wait> = 1
			printf \{qs(0xb27f946b)}
		endif
	endif
	if NOT gotparam \{ignore_connection_loss}
		if scriptisrunning \{sysnotify_handle_connection_loss}
			<should_wait> = 1
		endif
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
	pausegh3sounds \{no_seek}
	setbuttoneventmappings \{block_menu_input}
	sysnotify_handle_pause <...> seek_on_unpause
endscript
sysnotify_paused_controllers = [
]

script sysnotify_handle_pause_controller 
	setscriptcannotpause
	printf \{qs(0x86fbe77a)}
	printf \{qs(0x9eceeeee)}
	printf \{qs(0x86fbe77a)}
	if ($allow_console_pause_for_cal_lag = 1)
		setup_calibration_lag_none
		ui_event \{event = menu_refresh}
		return
	endif
	getarraysize \{$sysnotify_paused_controllers}
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
	addarrayelement array = <array> element = <device_num>
	change sysnotify_paused_controllers = <array>
	if (<original_array_size> > 0)
		return
	endif
	if ($g_in_tutorial = 0)
		if NOT ($playing_song)
			return
		endif
	else
		begin
		if NOT scriptisrunning \{training_start_gem_scroller}
			if NOT scriptisrunning \{training_destroy_gem_scroller}
				break
			endif
		endif
		wait \{1
			gameframe}
		repeat
	endif
	if ui_event_exists_in_stack \{above = 'gameplay'
			name = 'pausemenu'}
		return
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			name = 'song_unpause'}
		ui_event_block \{event = menu_back}
		pausegame
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
			name = 'online_quit_warning'}
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
	elseif ui_event_exists_in_stack \{name = 'metallifacts'}
		return
	elseif ($g_tutorial_pause_is_up = 1)
		tutorial_close_pause_window \{dont_unpause}
	elseif scriptisrunning \{guitarevent_songwon_spawned}
		return
	elseif scriptisrunning \{guitarevent_songfailed_spawned}
		return
	elseif NOT ($memcarddonescript = nullscript)
		return
	elseif ($net_popup_active = 1)
		return
	endif
	if ui_event_exists_in_stack \{name = 'play_tutorial'}
		ui_event event = menu_change state = uistate_controller_disconnect data = {device_num = <device_num>}
		return
	endif
	disable_pause
	ui_event event = menu_change state = uistate_controller_disconnect data = {device_num = <device_num> is_popup}
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
	wait_for_careeritnro
	setbuttoneventmappings \{block_menu_input}
	killspawnedscript \{name = ui_song_unpause_done}
	sysnotify_wait_until_safe
	ui_event_wait_for_safe
	change \{paused_for_hardware = 1}
	change \{blade_active = 1}
	if gameispaused
		printf \{qs(0xfb887cbe)}
		if ui_event_exists_in_stack \{above = 'gameplay'
				name = 'song_unpause'}
			ui_song_unpause_repause \{from_system}
		endif
		return
	endif
	if ($shutdown_game_for_signin_change_flag = 1)
		return
	endif
	if scriptisrunning \{guitarevent_songwon_spawned}
		return
	endif
	if ($is_attract_mode = 1)
		return
	endif
	if ($g_in_tutorial = 1)
		if NOT screenelementexists \{id = popup_warning_container}
			begin
			if NOT scriptisrunning \{training_start_gem_scroller}
				if NOT scriptisrunning \{training_destroy_gem_scroller}
					break
				endif
			endif
			wait \{1
				gameframe}
			repeat
			show_training_pause_screen <...>
		endif
	else
		if ($playing_song = 1)
			do_gh3_pause
		endif
	endif
endscript

script sysnotify_handle_unpause_eject 
	if isps3
		kill_notify_box \{container_id = notify_eject_static_text_container}
	endif
	if (($is_network_game) || ($g_connection_loss_dialogue))
		unpausegh3sounds \{seek_on_unpause}
	endif
	setbuttoneventmappings \{unblock_menu_input}
	sysnotify_handle_unpause <...> seek_on_unpause
endscript

script sysnotify_handle_unpause_controller 
	printf \{qs(0x29ceb5b2)}
	printf \{qs(0xbc17ac78)}
	printf \{qs(0x29ceb5b2)}
	getarraysize \{$sysnotify_paused_controllers}
	if (<array_size> > 0)
		i = 0
		begin
		if (($sysnotify_paused_controllers [<i>]) = <device_num>)
			array = $sysnotify_paused_controllers
			removearrayelement array = <array> index = <i>
			change sysnotify_paused_controllers = <array>
			break
		endif
		i = (<i> + 1)
		repeat <array_size>
		if (<i> = <array_size>)
			return
		endif
	endif
	getarraysize \{$sysnotify_paused_controllers}
	if (<array_size> > 0)
		return
	endif
	if NOT ($playing_song)
		return
	endif
	setsystemnotificationposition pos = ($sysnotify_ingame_position)
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
	change \{wait_for_sysnotify_unpause_flag = 1}
	setbuttoneventmappings \{unblock_menu_input}
	sysnotify_wait_until_safe
	if ($end_credits = 1)
		do_gh3_unpause
	endif
	ui_event_wait_for_safe
	change \{paused_for_hardware = 0}
	change \{blade_active = 0}
	if (($is_network_game) || ($g_connection_loss_dialogue))
		return
	endif
	if shouldgamebepausedduetosysnotification
		return
	endif
	if NOT gameispaused
		return
	elseif ($is_attract_mode = 1)
		return
	elseif ($g_in_tutorial = 1)
		return
	elseif ($end_credits = 1)
		do_gh3_unpause
		return
	elseif ($net_popup_active = 1)
		return
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			name = 'pausemenu'}
		return
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			name = 'controller_disconnect'}
		return
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			name = 'online_quit_warning'}
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
	elseif ui_event_exists_in_stack \{name = 'metallifacts'}
		do_gh3_unpause
		return
	endif
	if ($playing_song = 1)
		getglobaltags \{user_options
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
	if NOT screenelementexists \{id = pause_fader}
		if ($rendering_has_been_stopped_explicit = true)
			if ($ps3_fader_started_rendering = 0)
				startrendering \{reason = explicit}
				change \{ps3_fader_started_rendering = 1}
			endif
		endif
		createscreenelement {
			type = spriteelement
			id = pause_fader
			parent = root_window
			texture = black
			rgba = [0 0 0 255]
			pos = (640.0, 360.0)
			dims = (1280.0, 720.0)
			just = [center center]
			z_priority = $ps3_fade_overlay_z
			alpha = <alpha>
		}
	endif
	printscriptinfo \{'sys_fade_overlay_on'}
	change fade_overlay_count = ($fade_overlay_count + 1)
	if ($fade_overlay_count > 16)
		scriptassert \{'sys_fade_overlay_count is suspiciously high'}
	endif
endscript

script sys_fade_overlay_off 
	printscriptinfo \{'sys_fade_overlay_off'}
	if ($fade_overlay_count <= 0)
		return
	endif
	change fade_overlay_count = ($fade_overlay_count - 1)
	if ($fade_overlay_count <= 0)
		if screenelementexists \{id = pause_fader}
			if ($ps3_fader_started_rendering = 1)
				change \{ps3_fader_started_rendering = 0}
				stoprendering \{reason = explicit}
			endif
			destroyscreenelement \{id = pause_fader}
		endif
	endif
endscript
signin_change_happening = 0

script sysnotify_handle_signin_change 
	printf \{qs(0x37164e15)}
	printf qs(0xb6c3d3e1) d = <controller>
	printf \{qs(0x37164e15)}
	return
	if ($invite_controller = <controller>)
		change \{invite_controller = -1}
	endif
	if ($signin_change_happening = 1)
		printf \{qs(0x0638d32c)}
		return
	endif
	if (<message> = live_connection_lost)
		if NOT ($is_network_game)
			printf \{qs(0xf2e2c269)}
			return
		endif
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
		if NOT ($is_network_game)
			softassert \{qs(0x4896c31a)}
			change \{signin_change_happening = 0}
			return
		else
			sysnotify_handle_connection_loss
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
		printf \{qs(0x55e8f027)}
		if ($respond_to_signin_changed = 1)
			if (<controller> = ($primary_controller))
				printf \{qs(0xe2600322)}
				handle_signin_changed
			else
				if ($respond_to_signin_changed_all_players = 1)
					printf \{qs(0x208051b4)}
					if ($is_network_game)
						get_local_players_in_game
					else
						gamemode_getnumplayersshown
						num_local_players = <num_players_shown>
					endif
					index = 1
					if (<num_local_players> > 0)
						begin
						formattext checksumname = player_status 'player%d_status' d = <index>
						printstruct <...>
						if ($<player_status>.controller = <controller>)
							printf qs(0x3c569072) i = <index> c = <controller>
							handle_signin_changed
							change \{signin_change_happening = 0}
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
					printf \{qs(0x6ff28a99)}
					removecontentfiles playerid = <controller>
					reset_globaltags savegame = <controller>
					cheat_turnoffalllocked
				endif
			endif
		else
			printf \{qs(0x229ab93a)}
			if NOT ($respond_to_signin_changed_func = none)
				func = ($respond_to_signin_changed_func)
				<func> <...>
			endif
		endif
		default
		printf \{qs(0x57f6e4e8)}
		change \{signin_change_happening = 0}
		return
	endswitch
	change \{signin_change_happening = 0}
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
	printf \{qs(0x37c2017f)}
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
	printf \{qs(0x37164e15)}
	printf \{qs(0x6d5c96e2)}
	printf \{qs(0x37164e15)}
	printstruct <...>
	change \{g_connection_loss_dialogue = 1}
	destroy_player_drop_events
	change \{net_ready_to_start = 1}
	destroy_net_setup
	sysnotify_wait_until_safe \{ignore_connection_loss}
	wait_for_safe_shutdown
	displaysprite \{parent = root_window
		tex = boot_brick_bg
		pos = (640.0, 360.0)
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
	<id> :die
endscript

script notify_box \{scale1 = 0.75
		scale2 = 0.6
		container_pos = (0.0, 0.0)}
	if screenelementexists id = <container_id>
		return
	endif
	createscreenelement {
		type = containerelement
		parent = root_window
		id = <container_id>
		pos = <container_pos>
	}
	menu_font = fontgrid_title_a1
	if gotparam \{line3}
		displaysprite parent = <container_id> tex = dialog_menu_bg pos = (640.0, 24.0) scale = (3.0, 2.0) z = <menu_z> just = [center top]
		displaysprite parent = <container_id> tex = dialog_menu_bg flip_h pos = (640.0, 120.0) scale = (3.0, 2.0) z = <menu_z> just = [center top]
	else
		displaysprite parent = <container_id> tex = dialog_menu_bg pos = (640.0, 32.0) scale = (3.0, 1.5) z = <menu_z> just = [center top]
		displaysprite parent = <container_id> tex = dialog_menu_bg flip_h pos = (640.0, 112.0) scale = (3.0, 1.5) z = <menu_z> just = [center top]
	endif
	createscreenelement {
		type = textelement
		parent = <container_id>
		font = <menu_font>
		scale = <scale1>
		rgba = [180 50 50 255]
		text = <line1>
		just = [center top]
		z_priority = (<menu_z> + 0.2)
		pos = (640.0, 80.0)
	}
	createscreenelement {
		type = textelement
		parent = <container_id>
		font = <menu_font>
		scale = <scale2>
		rgba = [0 0 0 255]
		text = <line2>
		just = [center top]
		z_priority = (<menu_z> + 0.2)
		pos = (640.0, 124.0)
	}
	if gotparam \{line3}
		createscreenelement {
			type = textelement
			parent = <container_id>
			font = <menu_font>
			scale = <scale2>
			rgba = [0 0 0 255]
			text = <line3>
			just = [center top]
			z_priority = (<menu_z> + 0.2)
			pos = (640.0, 160.0)
		}
	endif
endscript

script kill_notify_box \{container_id = notify_static_text_container}
	if screenelementexists id = <container_id>
		destroyscreenelement id = <container_id>
	endif
endscript
wait_for_sysnotify_unpause_flag = 0

script wait_for_sysnotify_unpause 
	change \{wait_for_sysnotify_unpause_flag = 0}
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
		stoprendering
		shutdown_game_for_signin_change \{unloadcontent = 0}
		startrendering
		wait \{60
			gameframes}
		fadetoblack \{off
			time = 0
			id = invite_screenfader}
		wait \{1
			gameframe}
	endif
endscript
