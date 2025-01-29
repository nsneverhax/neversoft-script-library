
script ui_create_customize_character_head 
	make_generic_menu \{vmenu_id = customize_head_vmenu
		back_state = uistate_cas
		title = qs(0x3193a7ff)
		num_icons = 1
		show_history}
	setup_cas_menu_handlers \{vmenu_id = customize_head_vmenu
		camera_list = [
			'customize_character_head'
			'customize_character_head_R'
			'customize_character_head_B'
			'customize_character_head_L'
		]
		zoom_camera = 'customize_character_Zoom'}
	add_generic_menu_icon_item \{icon = icon_face
		text = qs(0xb5847ea6)
		choose_state = uistate_character_face_deformation}
	if NOT (is_female_char)
		add_generic_menu_icon_item \{icon = icon_facial_hair
			text = qs(0xea973ef8)
			choose_state = uistate_popout_select_part
			choose_state_data = {
				text = qs(0xb8dbc11d)
				part = cas_male_facial_hair
				num_icons = 2
				is_popup
				hist_tex = icon_facial_hair
				return_stance = stance_select_head
				camera_list = [
					'customize_character_head'
					'customize_character_head_R'
					'customize_character_head_B'
					'customize_character_head_L'
				]
				zoom_camera = 'customize_character_Zoom'
			}}
	endif
	get_section_index_from_desc_id \{part = cas_body
		target_desc_id = `eye makeup`}
	if gotparam \{section_index}
		add_generic_menu_icon_item {
			icon = icon_makeup
			text = qs(0xa9884efa)
			choose_state = uistate_cap_artist_layer_popout
			choose_state_data = {
				part = cas_body
				text = qs(0xa9884efa)
				section_index = <section_index>
				num_icons = 2
				hist_tex = icon_makeup
				is_popup
				additional_deinit_script = unhide_car_parts_for_face_paint
				additional_init_script = hide_car_parts_for_face_paint
				return_stance = stance_select_head
				camera_list = ['customize_character_head' 'customize_character_head_R' 'customize_character_head_B' 'customize_character_head_L']
				zoom_camera = 'customize_character_Zoom'
			}
		}
		removeparameter \{section_index}
	endif
	get_section_index_from_desc_id \{part = cas_body
		target_desc_id = `lip makeup`}
	if gotparam \{section_index}
		add_generic_menu_icon_item {
			icon = icon_lips
			text = qs(0xe3e91c9e)
			choose_state = uistate_cap_artist_layer_popout
			choose_state_data = {
				part = cas_body
				text = qs(0xe3e91c9e)
				section_index = <section_index>
				num_icons = 2
				hist_tex = icon_lips
				is_popup
				return_stance = stance_select_head
				additional_deinit_script = unhide_car_parts_for_face_paint
				additional_init_script = hide_car_parts_for_face_paint
				camera_list = ['customize_character_head' 'customize_character_head_R' 'customize_character_head_B' 'customize_character_head_L']
				zoom_camera = 'customize_character_Zoom'
			}
		}
		removeparameter \{section_index}
	endif
	add_generic_menu_icon_item \{icon = icon_graphics
		text = qs(0x1fdb379d)
		choose_state = uistate_cap_main
		choose_state_data = {
			part = cas_body
			text = qs(0x1fdb379d)
			div_id = head
			num_icons = 2
			hist_tex = icon_graphics
			additional_deinit_script = unhide_car_parts_for_face_paint
			additional_init_script = hide_car_parts_for_face_paint
			return_stance = stance_select_head
			camera_list = [
				'customize_character_head'
				'customize_character_head_R'
				'customize_character_head_B'
				'customize_character_head_L'
			]
			zoom_camera = 'customize_character_Zoom'
			cam_name = 'customize_character_head'
		}}
	getcurrentcasobject
	if gotparam \{cas_object}
		bandmanager_changestance name = <cas_object> stance = stance_select_head no_wait
	endif
	menu_finish \{car_helper_text}
endscript

script ui_return_customize_character_head 
	menu_finish \{car_helper_text}
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
			desc_id = none
		}}
	setcasappearancepartinstance \{part = cas_hat_hair
		part_instance = {
			desc_id = none
		}}
	setcasappearancepartinstance \{part = cas_hat
		part_instance = {
			desc_id = none
		}}
	setcasappearancepartinstance \{part = cas_acc_face
		part_instance = {
			desc_id = none
		}}
	rebuildcurrentcasmodel
endscript

script unhide_car_parts_for_face_paint 
	mergepartintotemporarycasappearance \{part_list = [
			cas_body
		]}
endscript
