
script create_restart_warning_menu \{player = 1
		cancel_func = generic_event_back
		cancel_func_params = {
		}}
	disable_pause
	player_device = ($last_start_pressed_device)
	create_popup_warning_menu {
		textblock = {
			text = qs(0x87ef01d2)
			dims = (600.0, 400.0)
			scale = 0.6
		}
		player_device = <player_device>
		no_background
		menu_pos = (640.0, 480.0)
		options = [
			{
				func = <cancel_func>
				func_params = <cancel_func_params>
				text = qs(0xf7723015)
			}
			{
				func = restart_warning_select_restart
				text = qs(0xb8790f2f)
			}
		]
	}
endscript

script destroy_restart_warning_menu 
	destroy_popup_warning_menu
endscript

script restart_warning_select_restart \{player = 1}
	kill_intro_celeb_ui
	generic_event_back \{state = uistate_gameplay
		nosound}
	resetscoreupdateready
	gh3_sfx_fail_song_stop_sounds
	stopsoundsbybuss \{encore_events}
	if ($game_mode = training)
		spawnscriptnow \{practice_restart_song}
	else
		xenon_singleplayer_session_init
		spawnscriptnow \{career_restart_song}
	endif
endscript
