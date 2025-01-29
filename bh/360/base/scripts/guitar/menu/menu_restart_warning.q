
script create_restart_warning_menu \{player = 1
		cancel_func = generic_event_back
		cancel_func_params = {
			nosound
		}}
	disable_pause
	if NOT GotParam \{player_device}
		player_device = ($last_start_pressed_device)
	endif
	GameMode_GetType
	if (<type> = tutorial)
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

script restart_warning_select_restart \{player = 1}
	reset_song_loading_hack_global
	GameMode_GetType
	if (<type> != tutorial)
		StopRendering
	endif
	kill_intro_celeb_ui
	if NOT GotParam \{dont_save_song_data}
		if IsXenonOrWinDX
			if ($playing_song = 1)
				if NOT is_current_song_a_jam_session
					WriteSongDataToFile \{incomplete = 1}
				endif
			endif
		endif
	endif
	if ($medley_mode_on)
		medley_restart \{restarting}
	endif
	restore_player_part_settings
	GameMode_GetType
	if (<type> = tutorial)
		tutorial_system_pausemenu_restart_lesson
		return
	endif
	generic_event_back \{nosound
		state = uistate_gameplay}
	ResetScoreUpdateReady
	GH3_SFX_fail_song_stop_sounds
	GMan_SendCallbackToAllGoals \{suffix = 'song_complete'
		callback_data = {
			event = song_retry
		}}
	if ($end_credits > 0)
		spawnscriptnow \{scrolling_list_begin_credits}
	endif
	StopSoundsByBuss \{Encore_Events}
	if ($game_mode = practice)
		spawnscriptnow \{practice_restart_song}
	else
		xenon_singleplayer_session_init
		spawnscriptnow \{career_restart_song}
	endif
endscript
