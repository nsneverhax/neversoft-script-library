
script ui_create_customize_character_makeup 
	make_generic_car_menu {
		vmenu_id = create_customize_character_makeup_vmenu
		title = qs(0x369404b0)
		num_icons = 1
		show_history
		exclusive_device = <state_device>
	}
	cas_set_object_node_pos player = ($cas_current_player) node = $cas_node_name
	setup_cas_menu_handlers vmenu_id = create_customize_character_makeup_vmenu camera_list = ['customize_character_head' 'customize_character_head_R' 'customize_character_head_B' 'customize_character_head_L'] zoom_camera = 'customize_character_Zoom' controller = <state_device>
	if get_section_index_from_desc_id \{part = cas_body
			target_desc_id = `eyeliner makeup`}
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
				stance = stance_select_head
				camera_list = ['customize_character_head' 'customize_character_head_R' 'customize_character_head_B' 'customize_character_head_L']
				zoom_camera = 'customize_character_Zoom'
				color_wheel = ($makeup_colorwheel)
			}
		}
		removeparameter \{section_index}
	endif
	if get_section_index_from_desc_id \{part = cas_body
			target_desc_id = `eyeshadow1 makeup`}
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
				stance = stance_select_head
				camera_list = ['customize_character_head' 'customize_character_head_R' 'customize_character_head_B' 'customize_character_head_L']
				zoom_camera = 'customize_character_Zoom'
				color_wheel = ($makeup_colorwheel)
			}
		}
		removeparameter \{section_index}
	endif
	if get_section_index_from_desc_id \{part = cas_body
			target_desc_id = `eyeshadow2 makeup`}
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
				stance = stance_select_head
				camera_list = ['customize_character_head' 'customize_character_head_R' 'customize_character_head_B' 'customize_character_head_L']
				zoom_camera = 'customize_character_Zoom'
				color_wheel = ($makeup_colorwheel)
			}
		}
		removeparameter \{section_index}
	endif
	if get_section_index_from_desc_id \{part = cas_body
			target_desc_id = `eyeshadow3 makeup`}
		add_car_menu_text_item {
			icon = icon_makeup
			text = qs(0x6e973e4d)
			choose_state = uistate_cap_artist_layer_popout
			choose_state_data = {
				part = cas_body
				text = qs(0x6e973e4d)
				section_index = <section_index>
				num_icons = 2
				hist_tex = icon_makeup
				is_popup
				additional_deinit_script = unhide_car_parts_for_face_paint
				additional_init_script = hide_car_parts_for_face_paint
				return_stance = stance_select_head
				stance = stance_select_head
				camera_list = ['customize_character_head' 'customize_character_head_R' 'customize_character_head_B' 'customize_character_head_L']
				zoom_camera = 'customize_character_Zoom'
				color_wheel = ($makeup_colorwheel)
			}
		}
		removeparameter \{section_index}
	endif
	if get_section_index_from_desc_id \{part = cas_body
			target_desc_id = `blush makeup`}
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
				stance = stance_select_head
				camera_list = ['customize_character_head' 'customize_character_head_R' 'customize_character_head_B' 'customize_character_head_L']
				zoom_camera = 'customize_character_Zoom'
				color_wheel = ($makeup_colorwheel)
			}
		}
		removeparameter \{section_index}
	endif
	if get_section_index_from_desc_id \{part = cas_body
			target_desc_id = `lip makeup`}
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
				stance = stance_select_head
				additional_deinit_script = unhide_car_parts_for_face_paint
				additional_init_script = hide_car_parts_for_face_paint
				camera_list = ['customize_character_head' 'customize_character_head_R' 'customize_character_head_B' 'customize_character_head_L']
				zoom_camera = 'customize_character_Zoom'
				color_wheel = ($makeup_lip_colorwheel)
			}
		}
		removeparameter \{section_index}
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
			stance = stance_select_head
			camera_list = [
				'customize_character_head'
				'customize_character_head_R'
				'customize_character_head_B'
				'customize_character_head_L'
			]
			zoom_camera = 'customize_character_Zoom'
			cam_name = 'customize_character_head'
		}}
	if gotparam \{stance}
		if getcurrentcasobject
			bandmanager_changestance name = <cas_object> stance = <stance> no_wait
		endif
	endif
	if gotparam \{face_anim}
		if getcurrentcasobject
			band_changefacialanims name = <cas_object> fa_type = <face_anim>
		endif
	endif
	menu_finish car_helper_text controller = <state_device>
endscript

script ui_return_customize_character_makeup 
	clean_up_user_control_helpers
	menu_finish car_helper_text controller = <state_device>
endscript

script ui_destroy_customize_character_makeup 
	destroy_generic_menu
	if gotparam \{face_anim}
		if getcurrentcasobject
			band_changefacialanims name = <cas_object> ff_anims = facial_anims_female_rocker mf_anims = facial_anims_male_rocker
		endif
	endif
endscript
