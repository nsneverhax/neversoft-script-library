
script ui_create_customize_character_outfit 
	make_generic_menu \{vmenu_id = create_customize_character_outfit_vmenu
		title = qs(0xa946c7b7)
		num_icons = 1
		show_history}
	if <desc_id> :desc_resolvealias Name = 0x44475582 param = 0x7363d093
		<0x7363d093> :obj_spawnscript 0xa7a510a8 params = {0x4d641ae8 0xe99089a3 = $0x187899ed 0xffd05882 = $0xddccbea4}
	else

	endif
	if <desc_id> :desc_resolvealias Name = 0xf313b252 param = 0x7c09a415
		<0x7c09a415> :obj_spawnscript 0xa7a510a8 params = {0x4d641ae8 0xe99089a3 = $0x52565f88 0xffd05882 = $0xddccbea4}
	else

	endif
	0xce0505af
	cas_set_object_node_pos Player = ($cas_current_player) node = <0xb07e72b1>
	setup_cas_menu_handlers \{vmenu_id = create_customize_character_outfit_vmenu
		camera_list = [
			'customize_character_outfit'
			'customize_character_R'
			'customize_character_B'
			'customize_character_L'
		]
		zoom_camera = 'customize_character_Zoom'}
	add_generic_menu_text_item {
		text = qs(0xb3283b80)
		choose_state = uistate_popout_select_part
		choose_state_data = {
			text = qs(0x782bf118)
			cam_name = 'customize_torso'
			camera_list = ['customize_torso' 'customize_torso_R' 'customize_torso_B' 'customize_torso_L']
			zoom_camera = 'customize_torso_zoom'
			part = cas_torso
			purchase_menu
			num_icons = 2
			hist_tex = outfit_torso
			is_popup
			icon_offset = (0.0, 20.0)
			list_offset = (0.0, 55.0)
			color_wheel = ($clothing_colorwheel)
			stance = stance_select_torso}
	}
	add_generic_menu_text_item {
		text = qs(0xa0fd2ecc)
		choose_state = uistate_popout_select_part
		choose_state_data = {
			text = qs(0xf9412531)
			cam_name = 'customize_pants'
			camera_list = ['customize_pants' 'customize_pants_R' 'customize_pants_B' 'customize_pants_L']
			zoom_camera = 'customize_character_Zoom'
			part = cas_legs
			purchase_menu
			num_icons = 2
			hist_tex = pants
			is_popup
			color_wheel = ($clothing_colorwheel)
			stance = stance_select_pants}
	}
	add_generic_menu_text_item {
		text = qs(0x777c6dbb)
		choose_state = uistate_popout_select_part
		choose_state_data = {
			text = qs(0x2ec06646)
			cam_name = 'customize_shoes'
			camera_list = ['customize_shoes' 'customize_shoes_R' 'customize_shoes_B' 'customize_shoes_L']
			zoom_camera = 'customize_character_Zoom'
			part = cas_shoes
			purchase_menu
			num_icons = 2
			hist_tex = shoes
			is_popup
			color_wheel = ($clothing_colorwheel)
			stance = stance_select_shoes}
	}
	add_generic_menu_text_item \{text = qs(0x69fb513a)
		choose_state = uistate_customize_character_outfit_accessories}
	menu_finish \{car_helper_text}
	GetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue param = visit_outfit
	if (<visit_outfit> = 0)
		SetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue params = {visit_outfit = 1}
		create_customize_character_outfit_vmenu :obj_spawnscript \{0xb434580b}
	endif
endscript

script ui_return_customize_character_outfit 
	create_customize_character_outfit_vmenu :se_setprops \{unblock_events}
	clean_up_user_control_helpers
	menu_finish \{car_helper_text}
endscript

script 0xb434580b 
endscript

script ui_destroy_customize_character_outfit 
	destroy_generic_menu
endscript

script 0xe62c76cf 
	0xbe6e9296 part_list = ($0x44007ccb.0x658a2d2c)
	GetArraySize <0x63cedf49>
	if (<array_Size> > 0)
		ui_event_add_params 0x9ae842e9 = <0x63cedf49>
	endif
endscript

script 0x55c5ee14 
	if GotParam \{0x9ae842e9}
		0x9219fac2 part_list = <0x9ae842e9>
	endif
endscript
