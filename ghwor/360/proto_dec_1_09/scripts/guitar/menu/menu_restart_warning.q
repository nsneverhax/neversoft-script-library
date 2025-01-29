
script create_restart_warning_menu \{Player = 1
		cancel_func = generic_event_back
		cancel_func_params = {
			nosound
		}}
	disable_pause
	if NOT GotParam \{player_device}
		player_device = ($last_start_pressed_device)
	endif
	gamemode_gettype
	if (<Type> = tutorial)
		body_text = qs(0x55047b57)
	else
		body_text = qs(0x9eff4a71)
	endif
	create_dialog_box {
		body_text = <body_text>
		player_device = <player_device>
		no_background
		dlg_z_priority = <dlg_z_priority>
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
	reset_song_loading_hack_global
	gamemode_gettype
	if (<Type> != tutorial)
		StopRendering
	endif
	kill_intro_celeb_ui
	if NOT GotParam \{dont_save_song_data}
		if isxenonorwindx
			if ($playing_song = 1)
				if NOT is_current_song_a_jam_session
					writesongdatatofile \{incomplete = 1}
				endif
			endif
		endif
	endif
	restore_player_part_settings
	gamemode_gettype
	if (<Type> = tutorial)
		tutorial_system_pausemenu_restart_lesson
		return
	endif
	generic_event_back \{nosound
		state = Uistate_gameplay}
	resetscoreupdateready
	audio_gameplay_fail_song_stop_sounds
	gman_sendcallbacktoallgoals \{suffix = 'song_complete'
		callback_data = {
			event = song_retry
		}}
	if ($end_credits > 0)
		SpawnScriptNow \{scrolling_list_begin_credits}
	endif
	StopSoundsByBuss \{Encore_Events}
	if ($game_mode = practice)
		SpawnScriptNow \{practice_restart_song}
	else
		xenon_singleplayer_session_init
		SpawnScriptNow \{career_restart_song}
	endif
endscript
