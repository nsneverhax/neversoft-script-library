
script ui_create_cadrm_main 
	if NOT GotParam \{old_save_checksum}
		globaltag_getarraychecksum savegame = ($cas_current_savegame) array_name = player_drum_save
		old_save_checksum = <array_checksum>
		ui_event_add_params old_save_checksum = <old_save_checksum>
	endif
	make_generic_car_menu {
		vmenu_id = create_cadrm_main_vmenu
		title = qs(0x388cd3db)
		num_icons = 2
		show_history
		exclusive_device = <state_device>
	}
	generic_menu :se_setprops \{skull_alpha = 0}
	generic_menu :se_setprops \{border_elements_alpha = 1}
	setup_cas_menu_handlers vmenu_id = create_cadrm_main_vmenu zoom_camera = 'cadrm_zoom' camera_list = ['cadrm_main' 'cadrm_main_R' 'cadrm_main_B' 'cadrm_main_L'] controller = <state_device>
	add_car_menu_text_item {
		icon = icon_customize
		text = qs(0xc23883c4)
		choose_state = uistate_cadrm_hub
		choose_state_data = {instrument_info = <instrument_info>}
	}
	dim_save_option_for_guest <...>
	add_car_menu_text_item {
		icon = icon_save
		text = qs(0xe618e644)
		choose_state = uistate_cas_save_slots
		choose_state_data = {savegame = ($cas_current_savegame) text = qs(0x6eddf79c) slot_list = player_drum_save instrument_info = <instrument_info> save_guitar loaded_index = <loaded_index> hist_tex = icon_save}
		not_focusable = <not_focusable>
	}
	add_car_menu_text_item {
		icon = icon_load
		text = qs(0xad5cfad4)
		choose_state = uistate_generic_dialog_box
		choose_state_data = {
			is_popup
			player_device = <state_device>
			heading_text = qs(0x834b8fcd)
			body_text = qs(0x05569fd6)
			confirm_func = ui_event
			confirm_func_params = {event = menu_replace data = {state = uistate_cas_save_slots savegame = ($cas_current_savegame) text = qs(0xad5cfad4) slot_list = player_drum_save instrument_info = <instrument_info> load_drum hist_tex = icon_load}}
			not_focusable = <not_focusable>
		}
	}
	add_car_menu_text_item {
		icon = icon_random
		text = qs(0x0b6c701b)
		choose_state = uistate_generic_dialog_box
		choose_state_data = {
			is_popup
			player_device = <state_device>
			heading_text = qs(0x49127634)
			body_text = qs(0xcb2b7871)
			confirm_func = ui_cag_generate_random_instrument
			confirm_func_params = {Type = drum rebuild}
			highlight_no
		}
	}
	printf \{qs(0x570a0663)}
	menu_finish car_helper_text controller = <state_device>
endscript

script ui_destroy_cadrm_main 
	if is_female_char
		if getcurrentcasobject
			if <cas_object> :Anim_AnimNodeExists id = femalediff
				<cas_object> :Anim_Command target = femalediff Command = applyfemaledrummerdifference_disable
			endif
		endif
	endif
	destroy_generic_menu
endscript

script ui_return_cadrm_main 
	menu_finish car_helper_text controller = <state_device>
endscript

script ui_init_cadrm_main 
endscript

script ui_deinit_cadrm_main 
endscript

script cadrm_exit_save 
	globaltag_getarraychecksum savegame = ($cas_current_savegame) array_name = player_drum_save
	if NOT (<old_save_checksum> = <array_checksum>)
		cas_get_player
		getplayerinfo <Player> controller
		if CheckForSignIn local controller_index = <controller>
			cag_update_photo
			ui_memcard_autosave event = menu_back data = {num_states = 2 savegame = ($cas_current_savegame)}
		else
			generic_event_back
		endif
	else
		generic_event_back
	endif
endscript
