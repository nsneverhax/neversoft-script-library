
script ui_create_cag_custom_head 
	make_generic_car_menu {
		vmenu_id = create_cag_custom_head_id
		show_history
		title = qs(0x69a146e9)
		exclusive_device = <state_device>
	}
	generic_menu :se_setprops \{skull_alpha = 0}
	generic_menu :se_setprops \{border_elements_alpha = 1}
	ui_cas_precache part = <part>
	setup_cas_menu_handlers vmenu_id = create_cag_custom_head_id camera_list = ['cag_custom_head' 'cag_custom_head_R' 'cag_custom_head_B' 'cag_custom_head_L'] zoom_camera = 'customize_cag_Zoom' controller = <state_device>
	add_car_menu_text_item {
		icon = icon_cag_head_type
		text = qs(0x709f133c)
		choose_state = uistate_cag_select_part_inclusion
		choose_state_data = {
			part = <part>
			body_part = <body_part>
			text = qs(0x709f133c)
			is_popup
			hist_tex = icon_cag_head_type
			color_wheel = ($guitar_colorwheel)
			cam_name = 'cag_custom_head'
			camera_list = ['cag_custom_head' 'cag_custom_head_R' 'cag_custom_head_B' 'cag_custom_head_L']
			zoom_camera = 'customize_cag_Zoom'
			no_edit
		}
	}
	if get_section_index_from_desc_id part = <part> target_desc_id = finishes
		add_car_menu_text_item {
			icon = icon_cag_head_finishes
			text = qs(0x3f47b13d)
			choose_state = uistate_cap_artist_layer_popout
			choose_state_data = {
				part = <part>
				text = qs(0x3f47b13d)
				section_index = <section_index>
				is_popup
				hist_tex = icon_cag_head_finishes
				color_wheel = ($guitar_colorwheel)
				cam_name = 'cag_custom_head'
				camera_list = ['cag_custom_head' 'cag_custom_head_R' 'cag_custom_head_B' 'cag_custom_head_L']
				zoom_camera = 'customize_cag_Zoom'
			}
		}
		RemoveParameter \{section_index}
	endif
	if get_section_index_from_desc_id part = <part> target_desc_id = fades
		add_car_menu_text_item {
			icon = icon_details
			text = qs(0xc373ccff)
			choose_state = uistate_cap_artist_layer_popout
			choose_state_data = {
				part = <part>
				text = qs(0xc373ccff)
				section_index = <section_index>
				is_popup hist_tex = icon_details
				color_wheel = ($guitar_colorwheel)
				cam_name = 'cag_custom_head'
				camera_list = ['cag_custom_head' 'cag_custom_head_R' 'cag_custom_head_B' 'cag_custom_head_L']
				zoom_camera = 'customize_cag_Zoom'
			}
		}
		RemoveParameter \{section_index}
	endif
	if get_section_index_from_desc_id part = <part> target_desc_id = details
		add_car_menu_text_item {
			icon = icon_details
			text = qs(0xe35a68c5)
			choose_state = uistate_cap_artist_layer_popout
			choose_state_data = {
				part = <part>
				text = qs(0xe35a68c5)
				section_index = <section_index>
				is_popup hist_tex = icon_details
				color_wheel = ($guitar_colorwheel)
				cam_name = 'cag_custom_head'
				camera_list = ['cag_custom_head' 'cag_custom_head_R' 'cag_custom_head_B' 'cag_custom_head_L']
				zoom_camera = 'customize_cag_Zoom'
			}
		}
		RemoveParameter \{section_index}
	endif
	if is_part_capable part = <part>
		add_car_menu_text_item {
			icon = icon_graphics
			text = qs(0xde6cb37a)
			choose_state = uistate_cap_main
			choose_state_data = {
				savegame = ($cas_current_savegame)
				part = <part>
				text = qs(0xde6cb37a)
				hist_tex = icon_graphics
				return_stance = stance_select_guitar
				cam_name = 'cag_custom_head'
				camera_list = ['cag_custom_head' 'cag_custom_head_R' 'cag_custom_head_B' 'cag_custom_head_L']
				zoom_camera = 'customize_cag_Zoom'
			}
		}
	endif
	menu_finish car_helper_text controller = <state_device>
	LaunchEvent Type = focus target = create_cag_custom_head_id data = {child_index = <selected_index>}
endscript

script ui_destroy_cag_custom_head 
	destroy_generic_menu
endscript

script ui_return_cag_custom_head 
	ui_destroy_cag_custom_head <...>
	ui_create_cag_custom_head <...>
endscript
