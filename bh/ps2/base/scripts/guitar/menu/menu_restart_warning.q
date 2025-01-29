
script create_restart_warning_menu \{Player = 1
		cancel_func = generic_event_back
		cancel_func_params = {
		}}
	disable_pause
	if NOT 0xf99301bb
		body_text = qs(0x0be331bb)
	else
		body_text = qs(0x9eff4a71)
	endif
	player_device = ($last_start_pressed_device)
	create_dialog_box {
		body_text = <body_text>
		player_device = <player_device>
		no_background
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
	destroy_dialog_box
endscript

script restart_warning_select_restart \{Player = 1}
	0xe9384b7a \{full}
	if ($0xc7e670d7 = 1)
		Change \{gameplay_restart_song = 1}
		generic_event_back \{state = Uistate_gameplay}
		return
	endif
	Change \{ps2_gameplay_restart_song = 1}
	kill_intro_celeb_ui
	if NOT GotParam \{dont_save_song_data}
		if isXenon
			if ($playing_song = 1)
				if NOT ($current_song = jamsession)
					writesongdatatofile \{incomplete = 1}
				endif
			endif
		endif
	endif
	restore_player_part_settings
	generic_event_back \{state = Uistate_gameplay}
	resetscoreupdateready
	GH3_SFX_fail_song_stop_sounds
	StopSoundsByBuss \{Encore_Events}
	if ($game_mode = practice)
		SpawnScriptNow \{practice_restart_song}
	else
		SpawnScriptNow \{career_restart_song}
	endif
endscript
