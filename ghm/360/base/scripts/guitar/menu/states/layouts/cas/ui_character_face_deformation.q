
script ui_create_character_face_deformation 
	make_generic_menu \{vmenu_id = face_deformation_vmenu
		title = qs(0x8c4aaf6a)
		num_icons = 2
		show_history}
	setup_cas_menu_handlers \{vmenu_id = face_deformation_vmenu
		camera_list = [
			'customize_character_head'
			'customize_character_head_R'
			'customize_character_head_B'
			'customize_character_head_L'
		]
		zoom_camera = 'customize_character_Zoom'}
	add_generic_menu_text_item \{text = qs(0x01f45c51)
		choose_state = uistate_popout_select_part
		choose_state_data = {
			text = qs(0x01f45c51)
			part = cas_age
			num_icons = 2
			is_popup
			hist_tex = head_age
			return_stance = stance_select_head
			camera_list = [
				'customize_character_head'
				'customize_character_head_R'
				'customize_character_head_B'
				'customize_character_head_L'
			]
			zoom_camera = 'customize_character_Zoom'
		}}
	add_generic_menu_text_item {
		text = qs(0x36291eb1)
		choose_state = uistate_character_face_deformation_options
		choose_state_data = {text = qs(0x36291eb1) option_array = ($cas_head_bone_options) hist_tex = icon_head_scale}
	}
	add_generic_menu_text_item {
		text = qs(0x0c7253fc)
		choose_state = uistate_character_face_deformation_options
		choose_state_data = {text = qs(0x0c7253fc) option_array = ($cas_nose_bone_options) hist_tex = head_nose stance = stance_select_profile}
	}
	add_generic_menu_text_item {
		text = qs(0xa7000f64)
		choose_state = uistate_character_face_deformation_options
		choose_state_data = {text = qs(0xa7000f64) option_array = ($cas_mouth_bone_options) hist_tex = head_mouth}
	}
	add_generic_menu_text_item {
		text = qs(0xed7d13b8)
		choose_state = uistate_character_face_deformation_options
		choose_state_data = {text = qs(0xed7d13b8) option_array = ($cas_eye_bone_options) hist_tex = head_eye return_stance = stance_select_head}
	}
	add_generic_menu_text_item {
		text = qs(0xd2f0c968)
		choose_state = uistate_character_face_deformation_options
		choose_state_data = {text = qs(0xd2f0c968) option_array = ($cas_brow_bone_options) hist_tex = head_eyebrow}
	}
	GetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue param = visit_deformation
	if (<visit_deformation> = 0)
		SetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue params = {visit_deformation = 1}
		ui_event_wait \{event = menu_change
			data = {
				state = uistate_helper_dialogue
				is_popup
				life = 30
				text = qs(0xbd2a1598)
			}}
	endif
	menu_finish \{car_helper_text}
endscript

script ui_return_character_face_deformation 
	clean_up_user_control_helpers
	menu_finish \{car_helper_text}
endscript

script ui_destroy_character_face_deformation 
	destroy_generic_menu
endscript

script ui_init_character_face_deformation 
	pushtemporarycasappearance
	setcasappearancepartinstance \{part = cas_hair
		part_instance = {
			desc_id = None
		}}
	setcasappearancepartinstance \{part = cas_hat_hair
		part_instance = {
			desc_id = None
		}}
	setcasappearancepartinstance \{part = cas_hat
		part_instance = {
			desc_id = None
		}}
	setcasappearancepartinstance \{part = cas_acc_face
		part_instance = {
			desc_id = None
		}}
	rebuildcurrentcasmodel
endscript

script ui_deinit_character_face_deformation 
	mergepartintotemporarycasappearance \{part_list = [
			cas_body
			cas_age
			cas_eyes
		]}
endscript
