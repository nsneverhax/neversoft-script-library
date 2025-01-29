
script ui_create_customize_character_enter new_state = UIstate_customize_character instrument = ($cas_default_instrument) new_data = {}
	RequireParams \{[
			new_state
		]
		all}
	spawnscriptnow ui_create_customize_character_enter_spawned params = <...>
endscript

script ui_create_customize_character_enter_spawned 
	if ($shutdown_game_for_signin_change_flag = 1)
		return
	endif
	set_cas_loading_setup \{setup = hidden}
	push_unsafe_for_shutdown \{reason = ui_create_customize_character_enter_spawned}
	CasCancelLoading
	if NOT ($cas_override_object = None)
		ScriptAssert \{'cas_override_object != none'}
	endif
	if ($is_in_cas = 0)
		cas_load_and_setup_resources
	endif
	anim_paks_set_state \{state = FrontEnd
		async = 1}
	hide_glitch \{num_frames = 6}
	cas_get_player
	set_cas_loading_setup \{setup = single}
	cas_set_object_node_pos player = <player>
	cas_destroy_all_characters
	if GotParam \{force_id}
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
	cas_queue_wait
	pop_unsafe_for_shutdown \{reason = ui_create_customize_character_enter_spawned}
	set_cas_loading_setup \{setup = single}
	generic_event_replace no_sound state = <new_state> data = <new_data>
endscript

script ui_deinit_customize_character_enter 
	if ($shutdown_game_for_signin_change_flag = 1)
		cas_free_resources
		Change \{cas_current_savegame = -1}
		Change \{cas_current_profile = None}
	endif
endscript
