
script ui_create_customize_character_mic_main 
	make_generic_menu \{vmenu_id = create_customize_character_mic_vmenu
		title = qs(0x3490b188)
		show_history
		hist_tex = icon_customize}
	setup_cas_menu_handlers \{vmenu_id = create_customize_character_mic_vmenu
		camera_list = [
			'customize_character_mic'
			'customize_character_mic_R'
			'customize_character_mic_B'
			'customize_character_mic_L'
		]
		zoom_camera = 'customize_mic_Zoom'}
	add_generic_menu_text_item \{text = qs(0xc0b34c9f)
		choose_state = uistate_popout_select_part
		choose_state_data = {
			text = qs(0xc0b34c9f)
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
	add_generic_menu_text_item \{text = qs(0xafbbc27e)
		choose_state = uistate_popout_select_part
		choose_state_data = {
			text = qs(0xafbbc27e)
			part = cas_mic_stand
			hist_tex = icon_mic_stand
			is_popup
			cam_name = 'customize_character_mic'
			camera_list = [
				'customize_character_mic'
				'customize_character_mic_R'
				'customize_character_mic_B'
				'customize_character_mic_L'
			]
			zoom_camera = 'customize_mic_Zoom'
			stance = stance_select_mic
			return_stance = stance_select_mic
		}}
	menu_finish \{car_helper_text}
	getcurrentcasobject
	printf \{qs(0xcb0dee4f)}
	bandmanager_changestance name = <cas_object> stance = stance_select_mic no_wait
	launchevent type = focus target = create_customize_character_mic_vmenu data = {child_index = <selected_index>}
endscript

script ui_destroy_customize_character_mic_main 
	destroy_generic_menu
endscript

script ui_return_customize_character_mic_main 
	hide_glitch
	menu_finish \{car_helper_text}
endscript
