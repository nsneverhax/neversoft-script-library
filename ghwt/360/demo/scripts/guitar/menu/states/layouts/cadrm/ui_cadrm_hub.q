
script ui_create_cadrm_hub 
	part = (<instrument_info>.body_part)
	make_generic_menu \{vmenu_id = create_cadrm_hub_vmenu
		title = qs(0x6c7cc659)
		show_history}
	setup_cas_menu_handlers \{vmenu_id = create_cadrm_hub_vmenu
		zoom_camera = 'cadrm_zoom'
		camera_list = [
			'cadrm_main'
			'cad_select_skin'
			'cad_select_shell'
		]}
	add_generic_menu_icon_item {
		icon = icon_cadrm_size
		text = qs(0x409ddb91)
		choose_state = uistate_popout_select_part
		choose_state_data = {
			part = <part>
			text = qs(0x8863a63d)
			cam_name = 'cad_select_size'
			choose_script = nullscript
			hist_tex = icon_cadrm_size is_popup
			color_wheel = ($guitar_colorwheel)
			return_stance = stance_select_drum
			purchase_menu
			camera_list = ['cad_select_size' 'cadrm_main' 'cad_select_skin' 'cad_select_shell']
			zoom_camera = 'cadrm_zoom'
		}
	}
	get_section_index_from_desc_id part = <part> target_desc_id = finishes
	if gotparam \{section_index}
		add_generic_menu_icon_item {
			icon = icon_cadrm_shell
			text = qs(0x66b50fc9)
			choose_state = uistate_cap_artist_layer_popout
			choose_state_data = {part = <part> text = qs(0x3f47b13d) section_index = <section_index> cam_name = 'cad_select_shell' hist_tex = icon_cadrm_shell is_popup color_wheel = ($guitar_colorwheel) return_stance = stance_select_drum zoom_camera = 'cadrm_zoom' camera_list = ['cad_select_shell' 'cad_select_skin']}
		}
		removeparameter \{section_index}
	endif
	get_section_index_from_desc_id part = <part> target_desc_id = details
	if gotparam \{section_index}
		add_generic_menu_icon_item {
			icon = icon_cadrm_skin
			text = qs(0xac0d5b20)
			choose_state = uistate_cap_artist_layer_popout
			choose_state_data = {part = <part> text = qs(0xe35a68c5) section_index = <section_index> cam_name = 'cad_select_skin' hist_tex = icon_cadrm_skin is_popup color_wheel = ($guitar_colorwheel) return_stance = stance_select_drum zoom_camera = 'cadrm_zoom' camera_list = ['cad_select_skin' 'cadrm_skin_L' 'cadrm_skin' 'cadrm_skin_R']}
		}
		removeparameter \{section_index}
	endif
	if is_part_capable part = <part>
		add_generic_menu_icon_item {
			icon = icon_graphics
			text = qs(0xde6cb37a)
			choose_state = uistate_cap_main
			choose_state_data = {savegame = ($cas_current_savegame) part = <part> text = qs(0xde6cb37a) cam_name = 'cadrm_skin' hist_tex = icon_graphics color_wheel = ($guitar_colorwheel) return_stance = stance_select_drum zoom_camera = 'cadrm_zoom' camera_list = ['cadrm_skin' 'cad_select_skin']}
		}
	endif
	add_generic_menu_icon_item {
		icon = icon_highway
		text = qs(0x2e2ac615)
		choose_state = uistate_cag_custom_highway
		choose_state_data = {instrument_info = <instrument_info>}
	}
	add_generic_menu_icon_item {
		icon = icon_sticks
		text = qs(0x1dade7f1)
		choose_state = uistate_popout_select_part
		choose_state_data = {text = qs(0x19e32c14) purchase_menu cam_name = 'cad_select_drumsticks' part = cas_drums_sticks choose_script = generic_event_back is_popup hist_tex = icon_sticks color_wheel = ($guitar_colorwheel) stance = stance_select_drumsticks return_stance = stance_select_drum zoom_camera = 'cadrm_zoom' camera_list = ['cad_select_drumsticks' 'cadrm_back']}
	}
	getglobaltags savegame = ($cas_current_savegame) cas_helper_dialogue param = visit_cadrm
	if (<visit_cadrm> = 0)
		setglobaltags savegame = ($cas_current_savegame) cas_helper_dialogue params = {visit_cadrm = 1}
		ui_event_wait \{event = menu_change
			data = {
				state = uistate_helper_dialogue
				is_popup
				life = 30
				text = qs(0x99dc981c)
			}}
	endif
	menu_finish \{car_helper_text}
endscript

script ui_return_cadrm_hub 
	clean_up_user_control_helpers
	menu_finish \{car_helper_text}
endscript

script ui_destroy_cadrm_hub 
	destroy_generic_menu
endscript
