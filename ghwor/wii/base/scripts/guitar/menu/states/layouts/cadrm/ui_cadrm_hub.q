
script ui_create_cadrm_hub 
	part = (<instrument_info>.body_part)
	make_generic_car_menu {
		vmenu_id = create_cadrm_hub_vmenu
		title = qs(0x6c7cc659)
		show_history
		exclusive_device = <state_device>
	}
	generic_menu :se_setprops \{skull_alpha = 0}
	generic_menu :se_setprops \{border_elements_alpha = 1}
	setup_cas_menu_handlers vmenu_id = create_cadrm_hub_vmenu zoom_camera = 'cadrm_zoom' camera_list = ['cadrm_main' 'cadrm_main_R' 'cadrm_main_B' 'cadrm_main_L'] controller = <state_device>
	if get_section_index_from_desc_id part = <part> target_desc_id = finishes
		add_car_menu_text_item {
			icon = icon_cadrm_shell
			text = qs(0x66b50fc9)
			choose_state = uistate_cap_artist_layer_popout
			choose_state_data = {
				is_popup
				part = <part>
				text = qs(0x1b1119b4)
				section_index = <section_index>
				cam_name = 'cad_select_shell'
				hist_tex = icon_cadrm_shell
				color_wheel = ($guitar_colorwheel)
				return_stance = stance_select_drum
				zoom_camera = 'cadrm_zoom'
				camera_list = ['cad_select_shell' 'cad_select_shell_R' 'cad_select_shell_B' 'cad_select_shell_L']
			}
		}
		RemoveParameter \{section_index}
	endif
	if get_section_index_from_desc_id part = <part> target_desc_id = details
		add_car_menu_text_item {
			icon = icon_cadrm_skin
			text = qs(0xac0d5b20)
			choose_state = uistate_cap_artist_layer_popout
			choose_state_data = {
				is_popup
				part = <part>
				text = qs(0xf8ab0e44)
				section_index = <section_index>
				cam_name = 'cad_select_skin'
				hist_tex = icon_cadrm_skin
				color_wheel = ($guitar_colorwheel)
				return_stance = stance_select_drum
				zoom_camera = 'cadrm_zoom'
				camera_list = ['cad_select_skin' 'cadrm_skin_R' 'cad_select_skin' 'cadrm_skin_L']
			}
		}
		RemoveParameter \{section_index}
	endif
	if is_part_capable part = <part>
	endif
	add_car_menu_text_item {
		icon = icon_sticks
		text = qs(0x1dade7f1)
		choose_state = uistate_popout_select_part
		choose_state_data = {
			is_popup
			text = qs(0xddcadce2)
			purchase_menu
			cam_name = 'cad_select_drumsticks'
			part = cas_drums_sticks
			choose_script = generic_event_back
			hist_tex = icon_sticks
			color_wheel = ($guitar_colorwheel)
			stance = stance_select_drumsticks
			return_stance = stance_select_drum
			zoom_camera = 'cadrm_zoom'
			camera_list = ['cad_select_drumsticks' 'cad_select_drumsticks_R' 'cad_select_drumsticks_B' 'cad_select_drumsticks_L']
		}
	}
	GetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue param = visit_cadrm
	if (<visit_cadrm> = 0)
		Change \{generic_menu_block_input = 1}
		SetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue params = {visit_cadrm = 1}
		ui_event_wait \{event = menu_change
			data = {
				state = uistate_helper_dialogue
				is_popup
				life = 30
				text = qs(0x509ce41e)
			}}
	endif
	menu_finish car_helper_text controller = <state_device>
endscript

script ui_return_cadrm_hub 
	clean_up_user_control_helpers
	menu_finish car_helper_text controller = <state_device>
endscript

script ui_destroy_cadrm_hub 
	destroy_generic_menu
endscript
