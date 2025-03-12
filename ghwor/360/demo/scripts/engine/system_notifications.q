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
	if systemuidelayed
		<should_wait> = 1
		printf \{qs(0xd1fc043b)}
	endif
	if istrue \{$is_changing_levels}
		<should_wait> = 1
		printf \{qs(0x5715648c)}
		if gotparam \{kill_loading_screen_if_for_invite}
			if ($g_loading_screen_is_for_invite = 1)
				if (($invite_controller) != -1)
					if NOT scriptisrunning \{do_join_invite_stuff}
						destroy_loading_screen
						create_mainmenu_bg
					endif
				endif
			endif
		endif
	endif
	if istrue \{$g_in_loading_screen}
		<should_wait> = 1
		printf \{qs(0x6a9dc06b)}
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
			printf \{qs(0xc82cfa4f)}
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
	pauseaudio \{no_seek}
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
	gamemode_gettype
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
		if NOT ininternetmode
			pausegame
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
	elseif scriptisrunning \{guitarevent_songwon_spawned}
		return
	elseif scriptisrunning \{guitarevent_songfailed_spawned}
		return
	elseif NOT ($memcarddonescript = nullscript)
		return
	elseif ($net_popup_active = 1)
		return
	endif
	ui_event_wait_for_safe
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
	if ($paused_for_hardware = 1)
		return
	endif
	if (($is_network_game) || ($g_connection_loss_dialogue))
		return
	endif
	gamemode_gettype
	if (<type> = freeplay)
		i = 1
		begin
		getplayerinfo <i> freeplay_state
		if NOT (<freeplay_state> = dropped)
			break
		endif
		i = (<i> + 1)
		repeat 4
		if (<i> = 5)
			return
		endif
	endif
	setbuttoneventmappings \{block_menu_input}
	sysnotify_wait_until_safe
	ui_event_wait_for_safe
	change \{paused_for_hardware = 1}
	change \{blade_active = 1}
	if gameispaused
		printf \{qs(0xfb887cbe)}
		if ui_event_exists_in_stack \{above = 'gameplay'
				name = 'song_unpause'}
			ui_song_unpause_repause \{from_system}
			return
		endif
		begin
		if NOT gameispaused
			printf \{qs(0x40f55ee4)}
			break
		endif
		wait \{1
			gameframe}
		repeat 60
		if gameispaused
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
	if scriptisrunning \{guitarevent_songwon_spawned}
		return
	endif
	if ($g_in_tutorial = 1)
		if NOT screenelementexists \{id = generic_menu}
			if NOT ui_event_exists_in_stack \{name = 'memcard'}
				if NOT is_ui_event_running
					gh_pause_game \{from_sys = 1}
					spawnscriptnow \{block_input}
				endif
			endif
		endif
	else
		if ($playing_song = 1)
			if NOT ui_event_exists_in_stack \{above = 'gameplay'
					name = 'os_edit_name'}
				gh_pause_game \{from_sys = 1}
				spawnscriptnow \{block_input}
			endif
		endif
	endif
endscript

script sysnotify_handle_unpause_eject 
	if (($is_network_game) || ($g_connection_loss_dialogue))
		unpauseaudio \{seek_on_unpause}
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
	ui_event_wait_for_safe
	change \{paused_for_hardware = 0}
	change \{blade_active = 0}
	if (($is_network_game) || ($g_connection_loss_dialogue))
		return
	endif
	if shouldgamebepausedduetosysnotification
		return
	endif
	gamemode_gettype
	if (<type> = freeplay)
		if ui_event_exists_in_stack \{above = 'gameplay'
				name = 'songlist'}
			return
		endif
		i = 1
		begin
		getplayerinfo <i> freeplay_state
		if NOT (<freeplay_state> = dropped)
			break
		endif
		i = (<i> + 1)
		repeat 4
		if (<i> = 5)
			no_countdown = 1
		endif
	elseif (<type> = career)
		if ($control_dis_paused = 0)
			playlist_getcurrentsong
			if quest_progression_is_song_transformation song = <current_song>
				gh_unpause_game
				return
			endif
			if ($current_playing_transition = celebintro)
				gh_unpause_game
				return
			endif
		endif
	endif
	if ui_event_exists_in_stack \{above = 'gameplay'
			name = 'os_edit_name'}
		killspawnedscript \{name = os_keyboard_spawned_script}
		return
	endif
	if NOT gameispaused
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
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			name = 'quest_unlocks'}
		return
	elseif ($calibrate_lag_enabled = 1)
		gh_unpause_game
		return
	elseif ($g_in_tutorial = 1)
		gh_unpause_game
		change \{pause_grace_period = -1.0}
		return
	elseif ($in_sing_a_long = true)
		if screenelementexists \{id = dialog_box_desc_id}
			return
		endif
	elseif ($transition_playing = true)
		if NOT is_pausable_transition \{transition = $current_playing_transition}
			return
		endif
	endif
	if ($playing_song = 1)
		ui_event_wait \{event = menu_change
			data = {
				state = uistate_song_unpause
			}}
		spawnscriptnow \{block_input}
	endif
endscript
sys_fade_overlay_z_priority = 10000001

script sys_fade_showing 
	if screenelementexists \{id = system_fade}
		return \{true}
	endif
	return \{false}
endscript

script sys_fade_ui_add 
	printf 'sys_fade_ui_add alpha=%a' a = <alpha>
	if screenelementexists \{id = system_fade}
		legacydoscreenelementmorph {
			id = system_fade
			alpha = <alpha>
			time = 0
		}
	else
		createscreenelement {
			type = spriteelement
			id = system_fade
			parent = root_window
			texture = black
			rgba = [0 0 0 255]
			pos = (640.0, 360.0)
			dims = (1280.0, 720.0)
			just = [center center]
			z_priority = ($sys_fade_overlay_z_priority)
			alpha = <alpha>
		}
	endif
endscript

script sys_fade_ui_remove 
	printf \{'sys_fade_ui_remove'}
	if screenelementexists \{id = system_fade}
		destroyscreenelement \{id = system_fade}
	endif
endscript
signin_change_happening = 0

script sysnotify_handle_signin_change 
	netsessionfunc \{obj = live_settings
		func = trace
		params = {
			msg = 'sysnotify_handle_signin_change CALLED'
		}}
	printf \{qs(0xa641e59e)}
	if isps3
		scriptassert \{'Should not be called on PS3!'}
	endif
	if ($g_boot_sysnotify_wait = true)
		if ($respond_to_signin_changed = 0)
			if ($respond_to_signin_changed_func = none)
				printf \{qs(0x5ab429fb)}
				printf \{qs(0x82fe25a8)}
				netsessionfunc \{obj = live_settings
					func = trace
					params = {
						msg = 'sysnotify_handle_signin_change DONE (A)'
					}}
				return
			endif
		endif
	endif
	printf \{qs(0x37164e15)}
	printf qs(0xb6c3d3e1) d = <controller>
	printf \{qs(0x37164e15)}
	if gotparam \{controller}
		facebook_figure_out_can_post controller_index = <controller>
		twitter_figure_out_can_post controller_index = <controller>
	endif
	if (<message> = user_changed)
		if checkforsignin controller_index = <controller> dont_set_primary
			netsessionfunc \{func = live_settings_init}
			netsessionfunc \{obj = live_settings
				func = get_settings}
		else
			webpresence_dump_user controller_index = <controller>
		endif
	endif
	if (<message> = user_changed)
		if (<controller> = $invite_controller)
			change \{invite_controller = -1}
		endif
	else
		change \{invite_controller = -1}
	endif
	if ($signin_change_happening = 1)
		printf \{qs(0x0638d32c)}
		printf \{qs(0x904b8a46)}
		netsessionfunc \{obj = live_settings
			func = trace
			params = {
				msg = 'sysnotify_handle_signin_change DONE (B)'
			}}
		return
	endif
	if demobuild
		printf \{qs(0x28f7ed23)}
		netsessionfunc \{obj = live_settings
			func = trace
			params = {
				msg = 'sysnotify_handle_signin_change DONE (C)'
			}}
		return
	endif
	change \{signin_change_happening = 1}
	if gotparam \{live_connection_lost}
		if istrue \{$is_changing_levels}
			destroy_loading_screen
			change \{is_changing_levels = 0}
		endif
	endif
	sysnotify_wait_until_safe
	if ($ui_x360_sign_in_checked = 1)
		change \{ui_x360_sign_in_checked = 0}
		change \{signin_change_happening = 0}
		printf \{qs(0xb520d59a)}
		netsessionfunc \{obj = live_settings
			func = trace
			params = {
				msg = 'sysnotify_handle_signin_change DONE (D)'
			}}
		return
	endif
	switch <message>
		case live_connection_lost
		if NOT ($is_network_game)
			change \{signin_change_happening = 0}
			printf \{qs(0x0d9cb2ff)}
			netsessionfunc \{obj = live_settings
				func = trace
				params = {
					msg = 'sysnotify_handle_signin_change DONE (E)'
				}}
			return
		else
			sysnotify_handle_connection_loss
		endif
		case live_connection_gained
		if (($playing_song) && ($is_network_game = 0))
			xenon_singleplayer_session_init
			change \{signin_change_happening = 0}
			printf \{qs(0x1f291d11)}
			netsessionfunc \{obj = live_settings
				func = trace
				params = {
					msg = 'sysnotify_handle_signin_change DONE (F)'
				}}
			return
		else
			change \{signin_change_happening = 0}
			printf \{qs(0xa7957a74)}
			netsessionfunc \{obj = live_settings
				func = trace
				params = {
					msg = 'sysnotify_handle_signin_change DONE (G)'
				}}
			return
		endif
		case user_changed
		printf \{qs(0x55e8f027)}
		if NOT netsessionfunc \{obj = party
				func = is_host}
			netsessionfunc {
				obj = party
				func = remove_playr_from_party
				params = {
					controller_index = <controller>
				}
			}
		endif
		get_savegame_from_controller controller = <controller>
		if ($respond_to_signin_changed = 1)
			if (<controller> = ($primary_controller))
				printf \{qs(0xe2600322)}
				handle_signin_changed is_primary_controller = 1 savegame = <savegame>
			else
				if ($respond_to_signin_changed_all_players = 1)
					printf \{qs(0x208051b4)}
					getnumplayersingame \{local}
					if (<num_players> > 0)
						getfirstplayer \{local}
						begin
						dumpplayerinfo player = <player>
						if playerinfoequals <player> controller = <controller>
							printf qs(0x3c569072) i = <player> c = <controller>
							handle_signin_changed savegame = <savegame>
							change \{signin_change_happening = 0}
							printf \{qs(0xfff66a22)}
							netsessionfunc \{obj = live_settings
								func = trace
								params = {
									msg = 'sysnotify_handle_signin_change DONE (H)'
								}}
							return
						endif
						getnextplayer local player = <player>
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
			if NOT ($respond_to_signin_changed_func = none)
				func = ($respond_to_signin_changed_func)
				printf 'Calling respond_to_signin_changed_func: %s' s = <func>
				<func> <...>
			endif
		endif
		news_feed_signin_change_cleanup controller_index = <controller>
		default
		printf \{qs(0x57f6e4e8)}
		change \{signin_change_happening = 0}
		printf \{qs(0x474a0d47)}
		netsessionfunc \{obj = live_settings
			func = trace
			params = {
				msg = 'sysnotify_handle_signin_change DONE (I)'
			}}
		return
	endswitch
	change \{signin_change_happening = 0}
	printf \{qs(0x32232b71)}
	netsessionfunc \{obj = live_settings
		func = trace
		params = {
			msg = 'sysnotify_handle_signin_change DONE'
		}}
endscript
sysnotify_allow_invite = 1

script sysnotify_handle_game_invite 
	printf \{qs(0x881acbf3)}
	printf \{qs(0xd1557fb9)}
	printf \{qs(0x881acbf3)}
	if demobuild
		return
	endif
	sysnotify_invite_go <...>
endscript

script sysnotify_invite_cancel 
	sysnotify_handle_unpause
	dialog_box_exit
endscript

script sysnotify_invite_go 
	printf \{qs(0xc7289a32)}
	dgsrecorddata_joingameinviteattempt controller = <controllerid>
	if scriptisrunning \{sysnotify_invite_go2}
		printf \{'sysnotify_invite_go: Killing previous sysnotify_invite_go2 script'}
		killspawnedscript \{name = sysnotify_invite_go2}
	endif
	printf \{'sysnotify_invite_go: Spawning sysnotify_invite_go2 script'}
	spawnscriptnow sysnotify_invite_go2 params = {<...>}
	printf \{qs(0xbbb782a7)}
endscript

script sysnotify_invite_go2 
	printf \{qs(0x4553ea63)}
	if gotparam \{cross_game}
		cross_game_invite_accepted <...>
	else
		sysnotify_wait_until_safe
		invite_accepted <...>
	endif
	printf \{qs(0x2c4093a5)}
endscript

script cross_game_invite_accepted 
	printf \{qs(0xa4e10239)}
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
	change \{net_popup_active = 0}
	sysnotify_wait_until_safe \{ignore_connection_loss
		kill_loading_screen_if_for_invite}
	wait_for_safe_shutdown
	change \{respond_to_signin_changed = 1}
	change \{respond_to_signin_changed_func = none}
	disable_pause
	cleanup_sessionfuncs
	ui_event_wait_for_safe
	wait_for_start_gem_scroller_completion
	ui_event_block \{event = menu_back
		data = {
			state = uistate_null
			initing
		}}
	xboxlive_lost_connection_ui_cleanup
	destroy_mainmenu_bg
	ui_event_block event = menu_replace data = {state = uistate_connection_loss clear_previous_stack <...>}
	destroy_loading_screen \{wait_for_unload}
	audio_kill_cutscene_audio
	killallmovies
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
		setscriptcannotpause
		onexitrun \{scriptassert}
		cancel_join_server
		destroy_connection_dialog_scroller
		fadetoblack \{on
			time = 0
			alpha = 1.0
			z_priority = 20000
			id = invite_screenfader}
		wait \{1
			gameframe}
		pushdisablerendering \{context = xboxlive_lost_connection_ui_cleanup}
		shutdown_game_for_signin_change \{unloadcontent = 0}
		popdisablerendering \{context = xboxlive_lost_connection_ui_cleanup}
		onexitrun \{nullscript}
		wait \{60
			gameframes}
		fadetoblack \{off
			time = 0
			id = invite_screenfader}
		wait \{1
			gameframe}
	endif
endscript

script sysnotify_avatar_changed \{playerid = !i1768515945}
	printf \{'sysnotify_avatar_changed'}
	printstruct <...>
	spawnscriptnow sysnotify_avatar_changed_spawned params = {playerid = <playerid>}
endscript

script sysnotify_avatar_changed_spawned \{playerid = !i1768515945}
	begin
	if NOT scriptisrunning \{reset_globaltags}
		if NOT scriptisrunning \{guitar_startup_async_init}
			break
		endif
	endif
	wait \{1
		gameframe}
	repeat
	globaltag_update_avatar_metadata savegame = <playerid>
endscript

script sysnotify_profilesetting_changed \{playerid = !i1768515945}
	broadcastevent type = local_gamerpic_changed data = {playerid = <playerid>}
endscript

script clear_paused_controllers 
	if ui_event_exists_in_stack \{above = 'gameplay'
			name = 'controller_disconnect'}
		return
	endif
	change \{sysnotify_paused_controllers = [
		]}
endscript
