car_show_all_instruments = 0

script ui_create_cag_main 
	getcasappearance
	if ((<instrument_info>.desc_id) = guitar)
		if NOT GotParam \{old_guitar_save_checksum}
			globaltag_getarraychecksum savegame = ($cas_current_savegame) array_name = player_guitar_save
			old_guitar_save_checksum = <array_checksum>
			ui_event_add_params old_guitar_save_checksum = <old_guitar_save_checksum>
		endif
		make_generic_car_menu {
			vmenu_id = create_cag_main_vmenu
			pad_back_script = cag_main_back
			pad_back_params = {old_instrument = guitar}
			title = qs(0x9504b94a)
			num_icons = 2
			show_history
			exclusive_device = <state_device>
		}
		generic_menu :se_setprops \{skull_alpha = 0}
		generic_menu :se_setprops \{border_elements_alpha = 1}
		setup_cas_menu_handlers vmenu_id = create_cag_main_vmenu camera_list = ['cag_main' 'cag_main_R' 'cag_main_B' 'cag_main_L'] zoom_camera = 'customize_cag_Zoom' controller = <state_device>
		if ($car_show_all_instruments = 1)
			add_car_menu_text_item \{icon = icon_customize
				text = qs(0x3afa080c)
				pad_choose_script = cag_choose_pick_a_guitar
				pad_choose_params = {
					old_instrument = guitar
					show_all = true
				}}
		endif
		add_car_menu_text_item \{icon = icon_customize
			text = qs(0xbec94c0a)
			pad_choose_script = cag_choose_pick_a_guitar
			pad_choose_params = {
				old_instrument = guitar
			}}
		add_car_menu_text_item {
			icon = icon_customize
			text = qs(0x57a22b82)
			choose_state = uistate_cag_custom
			choose_state_data = {instrument_info = <instrument_info>}
		}
		dim_save_option_for_guest <...>
		add_car_menu_text_item {
			icon = icon_save
			text = qs(0xe618e644)
			choose_state = uistate_cas_save_slots
			choose_state_data = {savegame = ($cas_current_savegame) text = qs(0xe618e644) slot_list = player_guitar_save instrument_info = <instrument_info> save_guitar loaded_index = <loaded_index> hist_tex = icon_save}
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
				confirm_func_params = {event = menu_replace data = {state = uistate_cas_save_slots savegame = ($cas_current_savegame) text = qs(0xad5cfad4) slot_list = player_guitar_save instrument_info = <instrument_info> load_guitar hist_tex = icon_load}}
				not_focusable = <not_focusable>
			}
		}
	endif
	if ((<instrument_info>.desc_id) = bass)
		if NOT GotParam \{old_bass_save_checksum}
			globaltag_getarraychecksum savegame = ($cas_current_savegame) array_name = player_bass_save
			old_bass_save_checksum = <array_checksum>
			ui_event_add_params old_bass_save_checksum = <old_bass_save_checksum>
		endif
		make_generic_car_menu {
			vmenu_id = create_cag_main_vmenu
			title = qs(0x7d4f9214)
			num_icons = 2
			show_history
			exclusive_device = <state_device>
		}
		generic_menu :se_setprops \{skull_alpha = 0}
		generic_menu :se_setprops \{border_elements_alpha = 1}
		if ($car_show_all_instruments = 1)
			add_car_menu_text_item \{icon = icon_customize
				text = qs(0x54bd03f1)
				pad_choose_script = cag_choose_pick_a_guitar
				pad_choose_params = {
					old_instrument = bass
					show_all = true
				}}
		endif
		setup_cas_menu_handlers vmenu_id = create_cag_main_vmenu camera_list = ['cag_main' 'cag_main_R' 'cag_main_B' 'cag_main_L'] zoom_camera = 'customize_cag_Zoom' controller = <state_device>
		add_car_menu_text_item \{icon = icon_customize
			text = qs(0x13e8282b)
			pad_choose_script = cag_choose_pick_a_guitar
			pad_choose_params = {
				old_instrument = bass
			}}
		add_car_menu_text_item {
			icon = icon_customize
			text = qs(0x57a22b82)
			choose_state = uistate_cag_custom
			choose_state_data = {instrument_info = <instrument_info>}
		}
		dim_save_option_for_guest <...>
		add_car_menu_text_item {
			icon = icon_save
			text = qs(0xe618e644)
			choose_state = uistate_cas_save_slots
			choose_state_data = {savegame = ($cas_current_savegame) text = qs(0xe618e644) slot_list = player_bass_save instrument_info = <instrument_info> save_guitar loaded_index = <loaded_index> hist_tex = icon_save}
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
				confirm_func_params = {event = menu_replace data = {state = uistate_cas_save_slots savegame = ($cas_current_savegame) text = qs(0xad5cfad4) slot_list = player_bass_save instrument_info = <instrument_info> load_guitar hist_tex = icon_load}}
				not_focusable = <not_focusable>
			}
		}
	endif
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
			confirm_func_params = {Type = (<instrument_info>.desc_id) rebuild}
			highlight_no
		}
	}
	printf \{qs(0x85155f19)}
	if getcurrentcasobject
		bandmanager_changestance Name = <cas_object> stance = stance_select_guitar no_wait
	endif
	menu_finish car_helper_text controller = <state_device>
endscript

script ui_destroy_cag_main 
	destroy_generic_menu
endscript

script ui_return_cag_main 
	menu_finish car_helper_text controller = <state_device>
endscript

script ui_init_cag_main 
endscript

script ui_deinit_cag_main 
endscript

script cag_exit_save 
	if GotParam \{old_guitar_save_checksum}
		globaltag_getarraychecksum savegame = ($cas_current_savegame) array_name = player_guitar_save
		if NOT (<old_guitar_save_checksum> = <array_checksum>)
			if CheckForSignIn
				cag_update_photo
				ui_memcard_autosave event = menu_back data = {num_states = 2 savegame = ($cas_current_savegame)}
			else
				ui_sfx \{menustate = car
					uitype = back}
				generic_event_back
			endif
		else
			ui_sfx \{menustate = car
				uitype = back}
			generic_event_back
		endif
	elseif GotParam \{old_bass_save_checksum}
		globaltag_getarraychecksum savegame = ($cas_current_savegame) array_name = player_bass_save
		if NOT (<old_bass_save_checksum> = <array_checksum>)
			cas_get_player
			getplayerinfo <Player> controller
			if CheckForSignIn local controller_index = <controller>
				cag_update_photo
				ui_memcard_autosave event = menu_back data = {num_states = 2 savegame = ($cas_current_savegame)}
			else
				ui_sfx \{menustate = car
					uitype = back}
				generic_event_back
			endif
		else
			ui_sfx \{menustate = car
				uitype = back}
			generic_event_back
		endif
	endif
endscript

script cag_update_photo 
	destroy_generic_menu
	if ($cas_current_savegame >= 0)
		if is_completely_custom_musician id = ($cas_current_profile)
			if (($cas_editing_new_character) = true)
				cas_save_photo_of_car character_name = ($cas_current_profile) savegame = ($cas_current_savegame)
			endif
		endif
	endif
endscript

script ui_cag_generate_random_instrument 
	cas_generate_new_random_instrument Type = <Type>
	if GotParam \{rebuild}
		rebuildcurrentcasmodel
	endif
	ui_event \{event = menu_back}
endscript

script cag_main_back \{old_instrument = guitar}
	ui_sfx \{menustate = car
		uitype = back}
	Change \{in_cai = 1}
	restoretoptemporarycasappearance
	generic_event_back
endscript

script cag_choose_pick_a_guitar \{old_instrument = guitar
		show_all = FALSE}
	Change \{in_cai = 0}
	ui_event_wait event = menu_change data = {
		state = uistate_cag_custom_body_types
		part = ($cag_instruments [$cag_instrument_idxs.<old_instrument>].body_part)
		old_instrument = <old_instrument>
		cam_name = 'cag_custom_body'
		camera_list = ['cag_custom_body' 'cag_custom_body_R' 'cag_custom_body_B' 'cag_custom_body_L']
		zoom_camera = 'customize_cag_Zoom'
		show_all = <show_all>
	}
endscript
