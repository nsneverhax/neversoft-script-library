practice_return_venue = none

script create_practice_warning_menu 
	disable_pause
	player_device = ($last_start_pressed_device)
	get_song_struct song = ($current_song)
	if structurecontains structure = <song_struct> boss
		warning_text = qs(0xf5e04243)
		goto_text = qs(0xbc7838a9)
	else
		warning_text = qs(0xf5e04243)
		goto_text = qs(0x3ea7dec9)
	endif
	disable_pause
	create_popup_warning_menu {
		textblock = {
			text = <warning_text>
			scale = 0.6
		}
		player_device = <player_device>
		no_background
		menu_pos = (640.0, 480.0)
		options = [
			{
				func = generic_event_back
				text = qs(0xf7723015)
			}
			{
				func = practice_warning_menu_select_practice
				text = <goto_text>
			}
		]
	}
endscript

script destroy_practice_warning_menu 
	destroy_popup_warning_menu
endscript

script practice_warning_menu_select_practice 
	kill_intro_celeb_ui
	if ($game_mode = p1_career || $game_mode = p2_career || $band_mode_mode = career)
		career_song_ended_select_quit
	endif
	gh3_sfx_fail_song_stop_sounds
	kill_gem_scroller
	spawnscriptnow \{xenon_singleplayer_session_complete_uninit
		params = {
			song_failed
		}}
	resetscoreupdateready
	if screenelementexists \{id = pu_warning_vmenu}
		pu_warning_vmenu :setprops \{block_events}
	endif
	change practice_return_venue = ($current_level)
	do_training_loading part = ($player1_status.part)
	ui_event \{event = menu_change
		state = uistate_select_song_section
		data = {
			from_in_game = 1
		}}
endscript
