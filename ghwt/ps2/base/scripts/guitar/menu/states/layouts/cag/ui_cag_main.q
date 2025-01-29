
script ui_create_cag_main 
	getcasappearance
	if StructureContains structure = <appearance> cas_full_instrument
		make_generic_menu \{vmenu_id = create_cag_main_vmenu
			pad_back_script = generic_event_back
			title = qs(0xb1b4eb63)
			num_icons = 2
			show_history}
		setup_cas_menu_handlers \{vmenu_id = create_cag_main_vmenu}
		add_generic_menu_icon_item \{icon = icon_load
			text = qs(0xdbaa7f89)
			choose_state = uistate_popout_select_part
			choose_state_data = {
				part = cas_full_instrument
				is_popup
				hist_tex = icon_load
			}}
	elseif ((<instrument_info>.desc_id) = guitar)
		if NOT GotParam \{old_guitar_save_checksum}
			globaltag_getarraychecksum savegame = ($cas_current_savegame) array_name = player_guitar_save
			old_guitar_save_checksum = <array_checksum>
			ui_event_add_params old_guitar_save_checksum = <old_guitar_save_checksum>
		endif
		make_generic_menu \{vmenu_id = create_cag_main_vmenu
			title = qs(0x1f790f57)
			num_icons = 2
			show_history}
		setup_cas_menu_handlers \{vmenu_id = create_cag_main_vmenu
			camera_list = [
				'cag_main'
				'cag_main_R'
				'cag_main_B'
				'cag_main_L'
			]
			zoom_camera = 'customize_cag_Zoom'}
		add_generic_menu_icon_item {
			icon = icon_customize
			text = qs(0xc23883c4)
			choose_state = uistate_cag_custom
			choose_state_data = {instrument_info = <instrument_info>}
		}
		dim_save_option_for_guest <...>
		add_generic_menu_icon_item {
			icon = icon_save
			text = qs(0xe618e644)
			choose_state = uistate_cas_save_slots
			choose_state_data = {savegame = ($cas_current_savegame) text = qs(0xe618e644) slot_list = player_guitar_save instrument_info = <instrument_info> save_guitar loaded_index = <loaded_index> hist_tex = icon_save}
			not_focusable = <not_focusable>
		}
		add_generic_menu_icon_item {
			icon = icon_load
			text = qs(0xad5cfad4)
			choose_state = uistate_cas_save_slots
			choose_state_data = {savegame = ($cas_current_savegame) text = qs(0xad5cfad4) slot_list = player_guitar_save instrument_info = <instrument_info> load_guitar hist_tex = icon_load}
			not_focusable = <not_focusable>
		}
	endif
	if ((<instrument_info>.desc_id) = bass)
		if NOT GotParam \{old_bass_save_checksum}
			globaltag_getarraychecksum savegame = ($cas_current_savegame) array_name = player_bass_save
			old_bass_save_checksum = <array_checksum>
			ui_event_add_params old_bass_save_checksum = <old_bass_save_checksum>
		endif
		make_generic_menu \{vmenu_id = create_cag_main_vmenu
			title = qs(0x1f790f57)
			num_icons = 2
			show_history}
		setup_cas_menu_handlers \{vmenu_id = create_cag_main_vmenu
			camera_list = [
				'cag_main'
				'cag_main_R'
				'cag_main_B'
				'cag_main_L'
			]
			zoom_camera = 'customize_cag_Zoom'}
		add_generic_menu_icon_item {
			icon = icon_customize
			text = qs(0xc23883c4)
			choose_state = uistate_cag_custom
			choose_state_data = {instrument_info = <instrument_info>}
		}
		dim_save_option_for_guest <...>
		add_generic_menu_icon_item {
			icon = icon_save
			text = qs(0xe618e644)
			choose_state = uistate_cas_save_slots
			choose_state_data = {savegame = ($cas_current_savegame) text = qs(0xe618e644) slot_list = player_bass_save instrument_info = <instrument_info> save_guitar loaded_index = <loaded_index> hist_tex = icon_save}
			not_focusable = <not_focusable>
		}
		add_generic_menu_icon_item {
			icon = icon_load
			text = qs(0xad5cfad4)
			choose_state = uistate_cas_save_slots
			choose_state_data = {savegame = ($cas_current_savegame) text = qs(0xad5cfad4) slot_list = player_bass_save instrument_info = <instrument_info> load_guitar hist_tex = icon_load}
			not_focusable = <not_focusable>
		}
	endif
	add_generic_menu_icon_item {
		icon = icon_random
		text = qs(0x0b6c701b)
		pad_choose_script = generate_random_instrument
		pad_choose_params = {Type = (<instrument_info>.desc_id) rebuild}
		pad_choose_sound = nullscript
	}
	CreateScreenElement \{parent = root_window
		Type = descinterface
		desc = 'Axesmith_menu_item'
		not_focusable
		autosizedims = true
		id = 0xa7c71d8e
		Pos = (125.0, 480.0)}
	getcurrentcasobject

	bandmanager_changestance Name = <cas_object> stance = stance_select_guitar no_wait
	menu_finish \{car_helper_text}
	SpawnScriptLater \{generic_menu_animate_in}
endscript

script ui_destroy_cag_main 
	destroy_generic_menu
	if ScreenElementExists \{id = 0xa7c71d8e}
		DestroyScreenElement \{id = 0xa7c71d8e}
	endif
endscript

script ui_init_cag_main 
	ui_event_add_params hist_tex = <hist_tex>
	change_cas_instrument_if_necessary instrument = (<instrument_info>.instrument_name)
endscript

script ui_deinit_cag_main 
	change_cas_instrument_if_necessary \{instrument = None}
endscript

script cag_exit_save 
	if GotParam \{old_guitar_save_checksum}
		globaltag_getarraychecksum savegame = ($cas_current_savegame) array_name = player_guitar_save
		if NOT (<old_guitar_save_checksum> = <array_checksum>)
			if CheckForSignIn
				ui_memcard_autosave event = menu_back data = {num_states = 2 savegame = ($cas_current_savegame)}
			else
				generic_event_back
			endif
		else
			generic_event_back
		endif
	elseif GotParam \{old_bass_save_checksum}
		globaltag_getarraychecksum savegame = ($cas_current_savegame) array_name = player_bass_save
		if NOT (<old_bass_save_checksum> = <array_checksum>)
			cas_get_player_status
			if CheckForSignIn local controller_index = ($<player_status>.controller)
				ui_memcard_autosave event = menu_back data = {num_states = 2 savegame = ($cas_current_savegame)}
			else
				generic_event_back
			endif
		else
			generic_event_back
		endif
	endif
endscript

script cag_update_photo 
	destroy_generic_menu
	if ($cas_current_savegame >= 0)
		if is_completely_custom_musician id = ($cas_current_profile) savegame = ($cas_current_savegame)
			if (($cas_editing_new_character) = true)
				cas_save_photo_of_car character_name = ($cas_current_profile) savegame = ($cas_current_savegame)
			endif
		endif
	endif
endscript
