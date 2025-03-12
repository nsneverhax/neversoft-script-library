
script ui_create_cadrm_main 
	if NOT gotparam \{old_save_checksum}
		globaltag_getarraychecksum savegame = ($cas_current_savegame) array_name = player_drum_save
		old_save_checksum = <array_checksum>
		ui_event_add_params old_save_checksum = <old_save_checksum>
	endif
	make_generic_car_menu {
		vmenu_id = create_cadrm_main_vmenu
		pad_back_script = cadrm_main_back
		title = qs(0x388cd3db)
		num_icons = 2
		show_history
		exclusive_device = <state_device>
	}
	generic_menu :se_setprops \{skull_alpha = 0}
	generic_menu :se_setprops \{border_elements_alpha = 1}
	setup_cas_menu_handlers vmenu_id = create_cadrm_main_vmenu zoom_camera = 'cadrm_zoom' camera_list = ['cadrm_main' 'cadrm_main_R' 'cadrm_main_B' 'cadrm_main_L'] controller = <state_device>
	add_car_menu_text_item \{icon = icon_customize
		text = qs(0xf95bc3ec)
		pad_choose_script = cag_choose_pick_a_drum}
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
		pad_select_sound_uitype = warningmessage
	}
	printf \{qs(0x570a0663)}
	menu_finish car_helper_text controller = <state_device>
endscript

script ui_destroy_cadrm_main 
	if is_female_char
		if getcurrentcasobject
			if <cas_object> :anim_animnodeexists id = femalediff
				<cas_object> :anim_command target = femalediff command = applyfemaledrummerdifference_disable
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
		getplayerinfo <player> controller
		if checkforsignin local controller_index = <controller>
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
endscript

script cadrm_main_back 
	soundevent \{event = audio_ui_band_lobby_complete}
	change \{in_cai = 1}
	restoretoptemporarycasappearance
	generic_event_back
endscript

script cag_choose_pick_a_drum \{show_all = false}
	change \{in_cai = 0}
	ui_event_wait event = menu_change data = {
		state = uistate_popout_select_part
		part = (($cag_instruments [$cag_instrument_idxs.drum]).body_part)
		cam_name = 'cadrm_main'
		camera_list = ['cadrm_main' 'cadrm_main_R' 'cadrm_main_B' 'cadrm_main_L']
		zoom_camera = 'cadrm_zoom'
		instrument = drum
		return_stance = stance_select_drum
		create_bg_menu = 1
		color_wheel = ($guitar_colorwheel)
		menu_title = qs(0xa4804d98)
		text = qs(0xa4804d98)
		show_all = <show_all>
		disallow_edit
	}
endscript
