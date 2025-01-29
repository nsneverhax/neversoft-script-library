
script create_restart_warning_menu \{Player = 1
		cancel_func = generic_event_back
		cancel_func_params = {
		}}
	disable_pause
	player_device = ($last_start_pressed_device)
	create_popup_warning_menu {
		textblock = {
			text = qs(0x9eff4a71)
			dims = (600.0, 400.0)
			Scale = 0.6
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

script restart_warning_select_restart \{Player = 1}
	kill_intro_celeb_ui
	generic_event_back \{state = Uistate_gameplay
		nosound}
	resetscoreupdateready
	GH3_SFX_fail_song_stop_sounds
	StopSoundsByBuss \{Encore_Events}
	if ($game_mode = training)
		SpawnScriptNow \{practice_restart_song}
	else
		xenon_singleplayer_session_init
		SpawnScriptNow \{career_restart_song}
	endif
endscript
