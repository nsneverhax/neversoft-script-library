
script ui_create_cadrm_main 
	SpawnScriptNow ui_create_cadrm_main_spawned params = {<...>}
endscript

script ui_create_cadrm_main_spawned 
	OnExitRun \{0xf00f29a9}
	0x79db87d7
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
	if <desc_id> :desc_resolvealias Name = 0x44475582 param = 0x7363d093
		<0x7363d093> :obj_spawnscript 0xa7a510a8 params = {0x4d641ae8 0xe99089a3 = $0x187899ed 0xffd05882 = $0xddccbea4}
	else

	endif
	if <desc_id> :desc_resolvealias Name = 0xf313b252 param = 0x7c09a415
		<0x7c09a415> :obj_spawnscript 0xa7a510a8 params = {0x4d641ae8 0xe99089a3 = $0x52565f88 0xffd05882 = $0xddccbea4}
	else

	endif
	setup_cas_menu_handlers \{vmenu_id = create_cadrm_main_vmenu
		zoom_camera = 'cadrm_zoom'
		camera_list = [
			'cadrm_main'
			'cad_select_skin'
			'cad_select_shell'
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

	if getcurrentcasobject
		bandmanager_changestance Name = <cas_object> stance = stance_select_drum no_wait
		<cas_object> :Anim_Command target = moment_blend Command = partialswitch_setstate params = {On BlendDuration = 0.0}
		<cas_object> :Anim_Command target = moment_blend_inner Command = partialswitch_setstate params = {OFF BlendDuration = 0.0}
	endif
	LaunchEvent \{Type = focus
		target = create_cadrm_main_vmenu}
	menu_finish \{car_helper_text}
	0x59249cc9
endscript

script ui_destroy_cadrm_main 
	KillSpawnedScript \{Name = ui_create_cadrm_main_spawned}
	if is_female_char
		if getcurrentcasobject
		endif
	endif
	destroy_generic_menu
endscript

script ui_init_cadrm_main 
	change_cas_instrument_if_necessary instrument = (<instrument_info>.instrument_name)
	0xbe6e9296 part_list = ($instrument_part_sets.drum)
	GetArraySize <0x63cedf49>
	if (<array_Size> > 0)
		ui_event_add_params 0x9ae842e9 = <0x63cedf49>
	endif
endscript

script ui_deinit_cadrm_main 
	if GotParam \{0x9ae842e9}
		0x9219fac2 part_list = <0x9ae842e9>
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
