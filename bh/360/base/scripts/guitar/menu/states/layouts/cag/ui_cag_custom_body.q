
script ui_create_cag_custom_body 
	part = (<instrument_info>.body_part)
	make_generic_car_menu {
		vmenu_id = create_cag_custom_body_vmenu
		Title = qs(0x706474c8)
		show_history
		exclusive_device = <state_device>
	}
	generic_menu :SE_SetProps \{abstract_01_alpha = 0}
	generic_menu :SE_SetProps \{generic_menu_title_bg_alpha = 0}
	generic_menu :SE_SetProps \{border_elements_alpha = 1}
	setup_cas_menu_handlers vmenu_id = create_cag_custom_body_vmenu camera_list = ['cag_custom_body' 'cag_custom_body_R' 'cag_custom_body_B' 'cag_custom_body_L'] zoom_camera = 'customize_cag_Zoom' controller = <state_device>
	add_car_menu_text_item {
		icon = icon_cag_type
		text = qs(0xefe2e069)
		pad_choose_script = continue_to_type
		pad_choose_params = {
			part = <part>
			is_popup
			cam_name = 'cag_custom_body'
			camera_list = ['cag_custom_body' 'cag_custom_body_R' 'cag_custom_body_B' 'cag_custom_body_L']
			zoom_camera = 'customize_cag_Zoom'
		}
	}
	if get_section_index_from_desc_id part = <part> target_desc_id = Finishes
		add_car_menu_text_item {
			icon = icon_cag_finishes
			text = qs(0xcc83e9d0)
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
	if get_section_index_from_desc_id part = <part> target_desc_id = Fades
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
	if get_section_index_from_desc_id part = <part> target_desc_id = Details
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
		add_car_menu_text_item {
			icon = icon_graphics
			text = qs(0xde6cb37a)
			choose_state = UIstate_cap_main
			choose_state_data = {
				savegame = ($cas_current_savegame)
				part = <part>
				text = qs(0xde6cb37a)
				hist_tex = icon_graphics
				cam_name = 'cag_custom_body'
				camera_list = ['cag_custom_body' 'cag_custom_body_R' 'cag_custom_body_B' 'cag_custom_body_L']
				zoom_camera = 'customize_cag_Zoom'
				return_stance = Stance_Select_Guitar
			}
		}
	endif
	Change \{generic_menu_block_input = 0}
	menu_finish car_helper_text controller = <state_device>
	LaunchEvent type = focus target = create_cag_custom_body_vmenu data = {child_index = <selected_index>}
endscript

script ui_destroy_cag_custom_body 
	destroy_generic_menu
endscript

script ui_return_cag_custom_body 
	Change \{generic_menu_block_input = 1}
	spawnscriptnow \{ui_event_block
		params = {
			event = menu_refresh
		}}
endscript

script continue_to_finishes 
	if Is_ui_event_running
		return \{false}
	endif
	ui_event_block event = menu_change data = {state = UIstate_cap_artist_layer_popout <...>}
endscript

script continue_to_type 
	if Is_ui_event_running
		return \{false}
	endif
	ui_event_block event = menu_change data = {state = UIstate_cag_custom_body_types <...>}
endscript
