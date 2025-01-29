
script ui_create_customize_character_mic_main 
	make_generic_menu \{vmenu_id = create_customize_character_mic_vmenu
		title = qs(0x3490b188)
		show_history
		hist_tex = icon_customize}
	if <desc_id> :desc_resolvealias Name = 0x44475582 param = 0x7363d093
		<0x7363d093> :obj_spawnscript 0xa7a510a8 params = {0x4d641ae8 0xe99089a3 = $0x187899ed 0xffd05882 = $0xddccbea4}
	else

	endif
	if <desc_id> :desc_resolvealias Name = 0xf313b252 param = 0x7c09a415
		<0x7c09a415> :obj_spawnscript 0xa7a510a8 params = {0x4d641ae8 0xe99089a3 = $0x52565f88 0xffd05882 = $0xddccbea4}
	else

	endif
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

	bandmanager_changestance Name = <cas_object> stance = stance_select_mic no_wait
	LaunchEvent Type = focus target = create_customize_character_mic_vmenu data = {child_index = <selected_index>}
	0x59249cc9
endscript

script ui_destroy_customize_character_mic_main 
	destroy_generic_menu
endscript

script ui_return_customize_character_mic_main 
	menu_finish \{car_helper_text}
endscript
