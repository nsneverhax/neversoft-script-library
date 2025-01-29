
script ui_create_customize_character_head 
	make_generic_car_menu {
		vmenu_id = customize_head_vmenu
		back_state = uistate_cas
		title = qs(0x86591933)
		num_icons = 1
		show_history
		exclusive_device = <state_device>
	}
	setup_cas_menu_handlers \{vmenu_id = customize_head_vmenu
		camera_list = [
			'customize_character_head'
			'customize_character_head_R'
			'customize_character_head_B'
			'customize_character_head_L'
		]
		zoom_camera = 'customize_character_Zoom'}
	add_car_menu_text_item \{icon = icon_face
		text = qs(0xb5847ea6)
		choose_state = uistate_character_face_deformation}
	if getcurrentcasobject
		bandmanager_changestance Name = <cas_object> stance = stance_select_head no_wait
	endif
	menu_finish car_helper_text controller = <state_device>
endscript

script ui_return_customize_character_head 
	menu_finish \{car_helper_text
		no_rotate_text
		no_zoom_text}
endscript

script ui_destroy_customize_character_head 
	destroy_generic_menu
endscript

script ui_init_customize_character_head 
	ui_load_cas_rawpak \{part = cas_body}
endscript

script hide_car_parts_for_face_paint 
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

script unhide_car_parts_for_face_paint 
	mergepartintotemporarycasappearance \{part_list = [
			cas_body
			cas_eye_makeup
			cas_lip_makeup
		]}
endscript
