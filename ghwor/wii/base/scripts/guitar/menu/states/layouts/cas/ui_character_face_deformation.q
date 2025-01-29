
script ui_create_character_face_deformation 
	pushfrontendoverridequota \{quota = quota_misc}
	make_generic_car_menu {
		vmenu_id = face_deformation_vmenu
		title = qs(0x8c4aaf6a)
		num_icons = 2
		show_history
		exclusive_device = <state_device>
	}
	setup_cas_menu_handlers vmenu_id = face_deformation_vmenu camera_list = ['customize_character_head' 'customize_character_head_R' 'customize_character_head_B' 'customize_character_head_L'] zoom_camera = 'customize_character_Zoom' controller = <state_device>
	add_car_menu_text_item {
		text = qs(0x32aea2ab)
		choose_state = uistate_cas_color_edit
		choose_state_data = {
			text = qs(0x32aea2ab)
			part = cas_body
			camera_list = ['customize_character_head' 'customize_character_head_R' 'customize_character_head_B' 'customize_character_head_L']
			zoom_camera = 'customize_character_Zoom'
			part_materials = [{desc_id = skin frontend_desc = qs(0xc2def45c)}]
			num_states = 1
			num_icons = 1
			hist_tex = skintone
			color_wheel = ($skin_colorwheel)
		}
		icon = skintone
	}
	add_car_menu_text_item {
		text = qs(0x36291eb1)
		icon = icon_head_scale
		choose_state = uistate_character_face_deformation_options
		choose_state_data = {text = qs(0x36291eb1) option_array = ($cas_head_bone_options) hist_tex = icon_head_scale}
	}
	add_car_menu_text_item {
		icon = head_nose
		text = qs(0x0c7253fc)
		choose_state = uistate_character_face_deformation_options
		choose_state_data = {text = qs(0x0c7253fc) option_array = ($cas_nose_bone_options) hist_tex = head_nose stance = stance_select_profile}
	}
	add_car_menu_text_item {
		icon = head_mouth
		text = qs(0xa7000f64)
		choose_state = uistate_character_face_deformation_options
		choose_state_data = {text = qs(0xa7000f64) option_array = ($cas_mouth_bone_options) hist_tex = head_mouth}
	}
	add_car_menu_text_item {
		icon = head_eye
		text = qs(0xed7d13b8)
		choose_state = uistate_character_face_deformation_options
		choose_state_data = {text = qs(0xed7d13b8) option_array = ($cas_eye_bone_options) hist_tex = head_eye return_stance = stance_select_head}
	}
	GetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue param = visit_deformation
	if (<visit_deformation> = 0)
		Change \{generic_menu_block_input = 1}
		SetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue params = {visit_deformation = 1}
		ui_event_wait \{event = menu_change
			data = {
				state = uistate_helper_dialogue
				is_popup
				life = 30
				text = qs(0xbd2a1598)
			}}
	endif
	if GotParam \{stance}
		if getcurrentcasobject
			bandmanager_changestance Name = <cas_object> stance = <stance> no_wait
		endif
	endif
	if GotParam \{face_anim}
		if getcurrentcasobject
			band_changefacialanims Name = <cas_object> fa_type = <face_anim>
		endif
	endif
	menu_finish car_helper_text controller = <state_device>
endscript

script ui_return_character_face_deformation 
	clean_up_user_control_helpers
	menu_finish car_helper_text controller = <state_device>
endscript

script ui_destroy_character_face_deformation 
	popfrontendoverridequota
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
	setcasappearancepartinstance \{part = cas_acc_ears
		part_instance = {
			desc_id = None
		}}
	rebuildcurrentcasmodel
endscript

script ui_deinit_character_face_deformation 
	if NOT is_accepting_invite_or_sigining_out
		mergepartintotemporarycasappearance \{part_list = [
				cas_body
				cas_eyes
			]}
	endif
endscript
