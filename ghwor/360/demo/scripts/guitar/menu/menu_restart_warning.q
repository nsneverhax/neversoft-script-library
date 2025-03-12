
script create_restart_warning_menu \{player = 1
		cancel_func = generic_event_back
		cancel_func_params = {
			nosound
		}}
	disable_pause
	if NOT gotparam \{player_device}
		player_device = ($last_start_pressed_device)
	endif
	gamemode_gettype
	if (<type> = tutorial)
		body_text = qs(0x55047b57)
	else
		body_text = qs(0x0be331bb)
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
	if ($unknown_drum_type = 1)
		change \{unknown_drum_type = 0}
		getnumplayersingame \{local}
		if (<num_players> > 0)
			getfirstplayer \{local}
			begin
			if playerinfoequals <player> part = drum
				getplayerinfo <player> controller
				if playerinfoequals <player> four_lane_highway = 0
					if isrbdrum controller = <controller>
						usefourlanehighway player = <player> reset
					endif
				else
					if NOT isrbdrum controller = <controller>
						usefourlanehighway player = <player> reset
					endif
				endif
			endif
			getnextplayer local player = <player>
			repeat <num_players>
		endif
	endif
	gamemode_gettype
	if (<type> != tutorial)
		stoprendering
	endif
	kill_intro_celeb_ui
	if NOT gotparam \{dont_save_song_data}
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
	if (<type> = tutorial)
		tutorial_system_pausemenu_restart_lesson
		return
	endif
	generic_event_back \{nosound
		state = uistate_gameplay}
	resetscoreupdateready
	audio_gameplay_fail_song_stop_sounds
	audio_stopping_sounds_killsong_lite
	gman_sendcallbacktoallgoals \{suffix = 'song_complete'
		callback_data = {
			event = song_retry
		}}
	if ($end_credits > 0)
		spawnscriptnow \{scrolling_list_begin_credits}
	endif
	stopsoundsbybuss \{encore_events}
	if ($game_mode = practice)
		spawnscriptnow \{practice_restart_song}
	else
		xenon_singleplayer_session_init
		spawnscriptnow \{career_restart_song}
	endif
endscript
