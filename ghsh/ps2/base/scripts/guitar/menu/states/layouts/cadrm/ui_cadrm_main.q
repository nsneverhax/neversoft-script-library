
script ui_create_cadrm_main 
	SpawnScriptNow ui_create_cadrm_main_spawned params = {<...>}
endscript

script ui_create_cadrm_main_spawned 
	change_cas_instrument_if_necessary instrument = (<instrument_info>.instrument_name)
	cas_queue_wait
	if NOT GotParam \{old_save_checksum}
		globaltag_getarraychecksum savegame = ($cas_current_savegame) array_name = player_drum_save
		old_save_checksum = <array_checksum>
		ui_event_add_params old_save_checksum = <old_save_checksum>
	endif
	make_generic_menu \{vmenu_id = create_cadrm_main_vmenu
		title = qs(0x388cd3db)
		num_icons = 2
		show_history}
	setup_cas_menu_handlers \{vmenu_id = create_cadrm_main_vmenu
		zoom_camera = 'cadrm_zoom'
		camera_list = [
			'cadrm_main'
			'cadrm_main_L'
			'cadrm_main_R'
		]}
	add_generic_menu_text_item {
		text = qs(0xc23883c4)
		choose_state = uistate_cadrm_hub
		choose_state_data = {instrument_info = <instrument_info>}
	}
	dim_save_option_for_guest <...>
	add_generic_menu_text_item {
		text = qs(0xe618e644)
		choose_state = uistate_cas_save_slots
		choose_state_data = {savegame = ($cas_current_savegame) text = qs(0x6eddf79c) slot_list = player_drum_save instrument_info = <instrument_info> save_guitar loaded_index = <loaded_index> hist_tex = icon_save}
		not_focusable = <not_focusable>
	}
	add_generic_menu_text_item {
		text = qs(0xad5cfad4)
		choose_state = uistate_cas_save_slots
		choose_state_data = {savegame = ($cas_current_savegame) text = qs(0x821cdbd7) slot_list = player_drum_save instrument_info = <instrument_info> load_drum hist_tex = icon_load}
		not_focusable = <not_focusable>
	}
	add_generic_menu_text_item \{text = qs(0x0b6c701b)
		pad_choose_script = generate_random_instrument
		pad_choose_params = {
			Type = drum
			rebuild
		}
		pad_choose_sound = nullscript}
	getcurrentcasobject
	bandmanager_changestance Name = <cas_object> stance = stance_select_drum no_wait
	LaunchEvent \{Type = focus
		target = create_cadrm_main_vmenu}
	menu_finish \{car_helper_text}
endscript

script ui_destroy_cadrm_main 
	KillSpawnedScript \{Name = ui_create_cadrm_main_spawned}
	if is_female_char
		if getcurrentcasobject
			<cas_object> :Anim_Command target = femalediff Command = Modulate_SetStrength params = {Strength = 0.0}
		endif
	endif
	destroy_generic_menu
endscript

script ui_init_cadrm_main 
endscript

script ui_deinit_cadrm_main 
	if getcurrentcasobject
		<cas_object> :Hide
	endif
endscript

script cadrm_exit_save 
	globaltag_getarraychecksum savegame = ($cas_current_savegame) array_name = player_drum_save
	if NOT (<old_save_checksum> = <array_checksum>)
		cas_get_player_status
		if CheckForSignIn local controller_index = ($<player_status>.controller)
			ui_memcard_autosave event = menu_back data = {num_states = 2 savegame = ($cas_current_savegame)}
		else
			generic_event_back
		endif
	else
		generic_event_back
	endif
endscript
