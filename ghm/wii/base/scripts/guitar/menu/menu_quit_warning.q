
script create_quit_warning_menu \{option1_text = qs(0xf7723015)
		option2_text = qs(0x67d9c56d)
		option1_func = generic_event_back
		option2_func = quit_warning_select_quit}
	disable_pause
	player_device = ($last_start_pressed_device)
	create_popup_warning_menu {
		textblock = {
			text = qs(0xb681c26c)
			dims = (600.0, 400.0)
			Scale = 0.6
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

script quit_warning_select_quit \{callback = generic_event_choose
		data = {
			state = uistate_pausemenu_song_ended
		}}
	if GotParam \{quit_career_confirm}
		gamemode_gettype
		if (<Type> = career)
			career_song_ended_select_quit
		endif
	endif
	if isXenon
		if NOT ($current_song = jamsession)
			writesongdatatofile \{incomplete = 1}
		endif
	endif
	KillSpawnedScript \{Name = finish_practice_song}
	SpawnScriptNow \{xenon_singleplayer_session_complete_uninit}
	resetscoreupdateready
	GH3_SFX_fail_song_stop_sounds
	hide_glitch \{num_frames = 3}
	<callback> data = <data> no_sound
endscript
