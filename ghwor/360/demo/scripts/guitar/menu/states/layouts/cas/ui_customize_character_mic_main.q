
script ui_create_customize_character_mic_main 
	make_generic_car_menu {
		vmenu_id = create_customize_character_mic_vmenu
		pad_back_script = customize_mic_main_back
		title = qs(0xc0b34c9f)
		show_history
		hist_tex = icon_customize
		exclusive_device = <state_device>
	}
	setup_cas_menu_handlers vmenu_id = create_customize_character_mic_vmenu camera_list = ['customize_character_mic' 'customize_character_mic_R' 'customize_character_mic_B' 'customize_character_mic_L'] zoom_camera = 'customize_mic_Zoom' controller = <state_device>
	add_car_menu_text_item \{icon = icon_mic
		text = qs(0x1876bc05)
		choose_state = uistate_popout_select_part
		choose_state_data = {
			text = qs(0x1876bc05)
			part = cas_mic
			hist_tex = icon_mic
			is_popup
			cam_name = 'customize_microphone'
			camera_list = [
				'customize_microphone_F'
				'customize_microphone_R'
				'customize_microphone_B'
				'customize_microphone_L'
			]
			zoom_camera = 'customize_mic_Zoom'
			stance = stance_select_microphone
			return_stance = stance_select_mic
		}}
	generic_menu :se_setprops \{skull_alpha = 0}
	generic_menu :se_setprops \{border_elements_alpha = 1}
	mic_stand_props = {
		text = qs(0x91d9e9ab)
		part = cas_mic_stand
		hist_tex = icon_mic_stand
		is_popup
		cam_name = 'customize_character_mic'
		camera_list = ['customize_character_mic' 'customize_character_mic_R' 'customize_character_mic_B' 'customize_character_mic_L']
		zoom_camera = 'customize_mic_Zoom'
		stance = stance_select_mic
		return_stance = stance_select_mic
	}
	add_car_menu_text_item {
		icon = icon_mic_stand
		text = qs(0x91d9e9ab)
		choose_state = uistate_popout_select_part
		choose_state_data = {
			<mic_stand_props>
		}
	}
	dim_save_option_for_guest <...>
	add_car_menu_text_item {
		icon = icon_save
		text = qs(0xe618e644)
		choose_state = uistate_cas_save_slots
		choose_state_data = {savegame = ($cas_current_savegame) text = qs(0xe618e644) slot_list = player_mic_save instrument_info = <instrument_info> save_guitar loaded_index = <loaded_index> hist_tex = icon_save}
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
			confirm_func_params = {event = menu_replace data = {state = uistate_cas_save_slots savegame = ($cas_current_savegame) text = qs(0xad5cfad4) slot_list = player_mic_save instrument_info = <instrument_info> load_guitar hist_tex = icon_load}}
			not_focusable = <not_focusable>
		}
		pad_select_sound_uitype = warningmessage
	}
	menu_finish car_helper_text controller = <state_device>
	printf \{qs(0xcb0dee4f)}
	if getcurrentcasobject
		bandmanager_changestance name = <cas_object> stance = stance_select_mic no_wait
	endif
	launchevent type = focus target = create_customize_character_mic_vmenu data = {child_index = <selected_index>}
endscript

script ui_destroy_customize_character_mic_main 
	destroy_generic_menu
endscript

script ui_return_customize_character_mic_main 
	menu_finish car_helper_text controller = <state_device>
endscript

script customize_mic_main_back 
	soundevent \{event = audio_ui_band_lobby_complete}
	change \{in_cai = 1}
	restoretoptemporarycasappearance
	generic_event_back
endscript
