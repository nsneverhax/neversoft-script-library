practice_return_venue = None
practice_return_state = None

script create_practice_warning_menu \{warning_text = qs(0xf5e04243)}
	disable_pause
	player_device = ($last_start_pressed_device)
	get_current_songs_struct
	disable_pause
	create_dialog_box {
		body_text = <warning_text>
		player_device = <player_device>
		no_background
		options = [
			{
				func = generic_event_back
				func_params = {nosound}
				text = qs(0xf7723015)
			}
			{
				func = practice_warning_menu_select_practice_mode
				text = qs(0x9a089725)
			}
		]
	}
endscript

script destroy_practice_warning_menu 
	destroy_dialog_box
endscript

script practice_warning_menu_select_practice 
	kill_intro_celeb_ui
	GH3_SFX_fail_song_stop_sounds
	SpawnScriptNow \{xenon_singleplayer_session_complete_uninit
		params = {
			song_failed
		}}
	resetscoreupdateready
	if ScreenElementExists \{id = dialog_box_vmenu}
		dialog_box_vmenu :SetProps \{block_events}
	endif
	Change practice_return_venue = ($current_level)
endscript

script practice_warning_menu_select_practice_mode 
	reset_song_loading_hack_global
	practice_warning_menu_select_practice
	Change came_to_practice_from = ($game_mode)
	Change \{practice_return_state = uistate_select_song_section}
	GMan_DeactivateAllGoals
	gman_blockuntilallgoalsdeactivated
	ui_event \{event = menu_replace
		state = uistate_select_song_section
		data = {
			from_in_game = 1
		}}
endscript

script practice_warning_menu_select_practice_current_section 
	practice_warning_menu_select_practice
	GMan_DeactivateAllGoals
	gman_blockuntilallgoalsdeactivated
	setup_practice_mode
	gman_songtool_getcurrentsong
	time_offset = 0
	time_offset = ($Default_SongLost_Transition.time * -1)
	initpracticecurrentsection songname = <current_song> time_offset = <time_offset>
	Change came_to_practice_from = ($game_mode)
	Change \{practice_return_state = Uistate_gameplay}
	practice_restart_song
endscript
