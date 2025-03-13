
script ui_create_customize_character_enter \{new_state = uistate_customize_character
		instrument = $cas_default_instrument
		new_data = {
		}
		from_lobby = 0}
	pushunsafeforshutdown \{context = ui_create_customize_character_enter}
	destroy_friend_feed
	if ($shutdown_game_for_signin_change_flag = 1)
		return
	endif
	if (<from_lobby> = 1)
		create_mainmenu_bg
		gettruestarttime
		play_cameracut \{prefix = 'cameras_no_band'}
	endif
	set_cas_loading_setup \{setup = hidden}
	cascancelloading
	if NOT ($cas_override_object = none)
		scriptassert \{'cas_override_object != none'}
	endif
	if ($is_in_cas = 0)
		cas_load_and_setup_resources
	endif
	anim_paks_set_state \{state = frontend
		async = 1}
	hide_glitch \{num_frames = 6}
	cas_get_player
	if (<from_lobby> = 0)
		set_cas_loading_setup \{setup = single}
	endif
	cas_set_object_node_pos player = <player>
	cas_destroy_all_characters
	if gotparam \{force_id}
		new_id = <force_id>
	else
		new_id = ($cas_current_profile)
	endif
	cas_queue_new_character_profile {
		id = <new_id>
		player = <player>
		savegame = ($cas_current_savegame)
		instrument = <instrument>
		hideoldcharacter = 1
		force_update = 1
	}
	if (<from_lobby> = 0)
		wait \{4
			gameframes}
	endif
	popdisablerendering \{context = going_into_car
		type = unchecked}
	cas_queue_wait
	if isps3
		hide_glitch \{num_frames = 4}
	endif
	if (<from_lobby> = 1)
		begin
		gettrueelapsedtime starttime = <starttime>
		if (<elapsedtime> > 2000)
			break
		endif
		wait \{1
			gameframe}
		repeat
		stop_cameracut
		destroy_mainmenu_bg
		hide_glitch \{num_frames = 35}
	endif
	popunsafeforshutdown \{context = ui_create_customize_character_enter}
	set_cas_loading_setup \{setup = single}
	ui_event_wait event = menu_replace data = {state = <new_state> <new_data>}
endscript

script ui_deinit_customize_character_enter 
	popdisablerendering \{context = going_into_car
		type = unchecked}
	if ($shutdown_game_for_signin_change_flag = 1)
		cas_free_resources
		change \{cas_current_savegame = -1}
		change \{cas_current_profile = none}
	endif
endscript
