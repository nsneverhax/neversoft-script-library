
script ui_create_cag_custom_body 
	part = (<instrument_info>.body_part)
	make_generic_car_menu {
		vmenu_id = create_cag_custom_body_vmenu
		title = qs(0x706474c8)
		show_history
		exclusive_device = <state_device>
	}
	generic_menu :se_setprops \{skull_alpha = 0}
	generic_menu :se_setprops \{border_elements_alpha = 1}
	setup_cas_menu_handlers vmenu_id = create_cag_custom_body_vmenu camera_list = ['cag_custom_body' 'cag_custom_body_R' 'cag_custom_body_B' 'cag_custom_body_L'] zoom_camera = 'customize_cag_Zoom' controller = <state_device>
	if get_section_index_from_desc_id part = <part> target_desc_id = finishes
		add_car_menu_text_item {
			icon = icon_cag_finishes
			text = qs(0x3f47b13d)
			pad_choose_script = continue_to_finishes
			pad_choose_params = {
				part = <part>
				text = qs(0x6e23fd31)
				section_index = <section_index>
				is_popup
				hist_tex = icon_cag_finishes
				color_wheel = ($guitar_colorwheel)
				cam_name = 'cag_custom_body'
				camera_list = ['cag_custom_body' 'cag_custom_body_R' 'cag_custom_body_B' 'cag_custom_body_L']
				zoom_camera = 'customize_cag_Zoom'
			}
		}
		RemoveParameter \{section_index}
	endif
	if get_section_index_from_desc_id part = <part> target_desc_id = fades
		add_car_menu_text_item {
			icon = icon_details
			text = qs(0xc373ccff)
			pad_choose_script = continue_to_finishes
			pad_choose_params = {
				part = <part>
				text = qs(0xc373ccff)
				section_index = <section_index>
				is_popup
				hist_tex = icon_details
				color_wheel = ($guitar_colorwheel)
				cam_name = 'cag_custom_body'
				camera_list = ['cag_custom_body' 'cag_custom_body_R' 'cag_custom_body_B' 'cag_custom_body_L']
				zoom_camera = 'customize_cag_Zoom'
			}
		}
		RemoveParameter \{section_index}
	endif
	if get_section_index_from_desc_id part = <part> target_desc_id = details
		add_car_menu_text_item {
			icon = icon_details
			text = qs(0xe35a68c5)
			pad_choose_script = continue_to_finishes
			pad_choose_params = {
				part = <part>
				text = qs(0x7f5a5c11)
				section_index = <section_index>
				is_popup
				hist_tex = icon_details
				color_wheel = ($guitar_colorwheel)
				cam_name = 'cag_custom_body'
				camera_list = ['cag_custom_body' 'cag_custom_body_R' 'cag_custom_body_B' 'cag_custom_body_L']
				zoom_camera = 'customize_cag_Zoom'
			}
		}
		RemoveParameter \{section_index}
	endif
	if is_part_capable part = <part>
	endif
	Change \{generic_menu_block_input = 0}
	menu_finish car_helper_text controller = <state_device>
	LaunchEvent Type = focus target = create_cag_custom_body_vmenu data = {child_index = <selected_index>}
endscript

script ui_destroy_cag_custom_body 
	destroy_generic_menu
endscript

script ui_return_cag_custom_body 
	clean_up_user_control_helpers
	menu_finish car_helper_text controller = <state_device>
endscript

script continue_to_finishes 
	if is_ui_event_running
		return \{FALSE}
	endif
	ui_event_block event = menu_change data = {state = uistate_cap_artist_layer_popout <...>}
endscript
