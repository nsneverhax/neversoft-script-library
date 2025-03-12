
script create_quit_warning_menu \{player = 1
		option1_text = qs(0xf7723015)
		option2_text = qs(0x67d9c56d)
		option1_func = generic_event_back
		option1_func_params = {
			nosound
		}
		option2_func = quit_warning_select_quit
		option2_func_params = {
		}}
	disable_pause
	player_device = ($last_start_pressed_device)
	get_all_exclusive_devices
	player_device = <exclusive_device>
	gamemode_gettype
	if (<type> = tutorial)
		body_text = qs(0x7e72cce4)
	else
		body_text = qs(0xb681c26c)
	endif
	create_dialog_box {
		body_text = <body_text>
		player_device = <player_device>
		dlg_z_priority = <dlg_z_priority>
		no_background
		options = [
			{
				func = <option1_func>
				func_params = <option1_func_params>
				text = <option1_text>
			}
			{
				func = generic_quit_warning_select_quit
				func_params = {func = <option2_func> func_params = <option2_func_params>}
				text = <option2_text>
			}
		]
	}
endscript

script destroy_quit_warning_menu 
	destroy_dialog_box
endscript

script generic_quit_warning_select_quit 
	if scriptexists \{crowd_swells_during_stats_screen}
		killspawnedscript \{name = crowd_swells_during_stats_screen}
	endif
	if issoundeventplaying \{surge_during_stats_screen}
		stopsoundevent \{surge_during_stats_screen
			fade_time = 1.5
			fade_type = linear}
	endif
	spawnscriptnow \{skate8_sfx_backgrounds_new_area
		params = {
			bg_sfx_area = frontend
		}}
	restore_player_part_settings
	<func> <func_params>
endscript

script quit_warning_select_quit \{player = 1
		callback = generic_event_choose
		data = {
			state = uistate_pausemenu_song_ended
		}}
	change \{current_speedfactor = 1.0}
	change \{end_credits = 0}
	set_all_highway_props \{alpha = 0.0}
	hide_entire_hud
	if ($calibrate_lag_enabled = 1)
		calibrate_highway_shutdown
		generic_event_back \{nosound
			state = uistate_mainmenu}
		return
	endif
	gamemode_gettype
	if (<type> = career)
		kill_intro_celeb_ui
		career_pause_quit <...>
		songlist_clear_playlist
		return
	endif
	if (<type> = competitive)
		competitive_pause_quit <...>
		return
	endif
	if (<type> = tutorial)
		tutorial_system_pausemenu_quit <...>
		return
	endif
	if (<type> = quickplay)
		callback = song_ended_menu_select_quit
		data = {}
	endif
	gman_sendcallbacktoallgoals \{suffix = 'song_complete'
		callback_data = {
			event = song_quit
		}}
	if gotparam \{quit_career_confirm}
		if (<type> = career)
			career_song_ended_select_quit
		endif
	endif
	if isxenonorwindx
		if NOT is_current_song_a_jam_session
			writesongdatatofile \{incomplete = 1}
		endif
	endif
	end_singleplayer_game
	xenon_singleplayer_session_begin_uninit
	spawnscriptnow \{xenon_singleplayer_session_complete_uninit
		params = {
			song_failed
		}}
	resetscoreupdateready
	gh3_sfx_fail_song_stop_sounds
	<callback> data = <data> no_sound
endscript
