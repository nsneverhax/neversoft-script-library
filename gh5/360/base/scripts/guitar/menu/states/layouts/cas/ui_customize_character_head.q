
script ui_create_customize_character_head 
	make_generic_car_menu {
		vmenu_id = customize_head_vmenu
		back_state = uistate_cas
		title = qs(0x86591933)
		num_icons = 1
		show_history
		exclusive_device = <state_device>
	}
	setup_cas_menu_handlers vmenu_id = customize_head_vmenu camera_list = ['customize_character_head' 'customize_character_head_R' 'customize_character_head_B' 'customize_character_head_L'] zoom_camera = 'customize_character_Zoom' controller = <state_device>
	add_car_menu_text_item \{icon = icon_face
		text = qs(0xb5847ea6)
		choose_state = uistate_character_face_deformation}
	if NOT (is_female_char)
		add_car_menu_text_item \{icon = icon_facial_hair
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
		target_desc_id = `eyeliner	makeup`}
	if GotParam \{section_index}
		add_car_menu_text_item {
			icon = icon_makeup
			text = qs(0xe216e77e)
			choose_state = uistate_cap_artist_layer_popout
			choose_state_data = {
				part = cas_body
				text = qs(0xe216e77e)
				section_index = <section_index>
				num_icons = 2
				hist_tex = icon_makeup
				is_popup
				additional_deinit_script = unhide_car_parts_for_face_paint
				additional_init_script = hide_car_parts_for_face_paint
				return_stance = stance_select_head
				camera_list = ['customize_character_head' 'customize_character_head_R' 'customize_character_head_B' 'customize_character_head_L']
				zoom_camera = 'customize_character_Zoom'
				color_wheel = ($makeup_colorwheel)
			}
		}
		RemoveParameter \{section_index}
	endif
	get_section_index_from_desc_id \{part = cas_body
		target_desc_id = `eyeshadow1	makeup`}
	if GotParam \{section_index}
		add_car_menu_text_item {
			icon = icon_makeup
			text = qs(0xe9371b2e)
			choose_state = uistate_cap_artist_layer_popout
			choose_state_data = {
				part = cas_body
				text = qs(0xe9371b2e)
				section_index = <section_index>
				num_icons = 2
				hist_tex = icon_makeup
				is_popup
				additional_deinit_script = unhide_car_parts_for_face_paint
				additional_init_script = hide_car_parts_for_face_paint
				return_stance = stance_select_head
				camera_list = ['customize_character_head' 'customize_character_head_R' 'customize_character_head_B' 'customize_character_head_L']
				zoom_camera = 'customize_character_Zoom'
				color_wheel = ($makeup_colorwheel)
			}
		}
		RemoveParameter \{section_index}
	endif
	get_section_index_from_desc_id \{part = cas_body
		target_desc_id = `eyeshadow2	makeup`}
	if GotParam \{section_index}
		add_car_menu_text_item {
			icon = icon_makeup
			text = qs(0xc0ffafdc)
			choose_state = uistate_cap_artist_layer_popout
			choose_state_data = {
				part = cas_body
				text = qs(0xc0ffafdc)
				section_index = <section_index>
				num_icons = 2
				hist_tex = icon_makeup
				is_popup
				additional_deinit_script = unhide_car_parts_for_face_paint
				additional_init_script = hide_car_parts_for_face_paint
				return_stance = stance_select_head
				camera_list = ['customize_character_head' 'customize_character_head_R' 'customize_character_head_B' 'customize_character_head_L']
				zoom_camera = 'customize_character_Zoom'
				color_wheel = ($makeup_colorwheel)
			}
		}
		RemoveParameter \{section_index}
	endif
	get_section_index_from_desc_id \{part = cas_body
		target_desc_id = `blush	makeup`}
	if GotParam \{section_index}
		add_car_menu_text_item {
			icon = icon_makeup
			text = qs(0x2ede93d9)
			choose_state = uistate_cap_artist_layer_popout
			choose_state_data = {
				part = cas_body
				text = qs(0x2ede93d9)
				section_index = <section_index>
				num_icons = 2
				hist_tex = icon_makeup
				is_popup
				additional_deinit_script = unhide_car_parts_for_face_paint
				additional_init_script = hide_car_parts_for_face_paint
				return_stance = stance_select_head
				camera_list = ['customize_character_head' 'customize_character_head_R' 'customize_character_head_B' 'customize_character_head_L']
				zoom_camera = 'customize_character_Zoom'
				color_wheel = ($makeup_colorwheel)
			}
		}
		RemoveParameter \{section_index}
	endif
	get_section_index_from_desc_id \{part = cas_body
		target_desc_id = `lip	makeup`}
	if GotParam \{section_index}
		add_car_menu_text_item {
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
				color_wheel = ($makeup_lip_colorwheel)
			}
		}
		RemoveParameter \{section_index}
	endif
	add_car_menu_text_item \{icon = icon_graphics
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
	if getcurrentcasobject
		bandmanager_changestance Name = <cas_object> stance = stance_select_head no_wait
	endif
	menu_finish car_helper_text controller = <state_device>
endscript

script ui_return_customize_character_head 
	menu_finish car_helper_text controller = <state_device>
endscript

script ui_destroy_customize_character_head 
	destroy_generic_menu
endscript

script ui_init_customize_character_head 
	ui_cas_precache \{part = cas_body}
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
	if NOT is_accepting_invite_or_sigining_out
		mergepartintotemporarycasappearance \{part_list = [
				cas_body
			]}
	endif
endscript
