
script create_quit_warning_menu \{player = 1
		option1_text = qs(0xf7723015)
		option2_text = qs(0x67d9c56d)
		option1_func = generic_event_back
		option2_func = quit_warning_select_quit}
	disable_pause
	gamemode_getproperty \{prop = faceoff}
	if (<faceoff> = true)
		player_device = ($last_start_pressed_device)
	else
		player_device = ($primary_controller)
	endif
	get_all_exclusive_devices
	player_device = <exclusive_device>
	create_popup_warning_menu {
		textblock = {
			text = qs(0x67c345ad)
			dims = (600.0, 400.0)
			scale = 0.6
		}
		player_device = <player_device>
		no_background
		menu_pos = (640.0, 480.0)
		options = [
			{
				func = <option1_func>
				text = <option1_text>
			}
			{
				func = <option2_func>
				text = <option2_text>
			}
		]
	}
endscript

script destroy_quit_warning_menu 
	destroy_popup_warning_menu
endscript

script quit_warning_select_quit \{player = 1
		callback = generic_event_choose
		data = {
			state = uistate_pausemenu_song_ended
		}}
	if gotparam \{quit_career_confirm}
		gamemode_gettype
		if (<type> = career)
			career_song_ended_select_quit
		endif
	endif
	if isxenon
		if NOT ($current_song = jamsession)
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
