
script ui_create_cag_custom_head 
	make_generic_car_menu {
		vmenu_id = create_cag_custom_head_id
		show_history
		Title = qs(0x888dd748)
		exclusive_device = <state_device>
	}
	generic_menu :SE_SetProps \{abstract_01_alpha = 0}
	generic_menu :SE_SetProps \{generic_menu_title_bg_alpha = 0}
	generic_menu :SE_SetProps \{border_elements_alpha = 1}
	ui_cas_precache part = <part>
	setup_cas_menu_handlers vmenu_id = create_cag_custom_head_id camera_list = ['cag_custom_head' 'cag_custom_head_R' 'cag_custom_head_B' 'cag_custom_head_L'] zoom_camera = 'customize_cag_Zoom' controller = <state_device>
	add_car_menu_text_item {
		icon = icon_cag_head_type
		text = qs(0xe8775204)
		choose_state = UIstate_cag_select_part_inclusion
		choose_state_data = {
			part = <part>
			body_part = <body_part>
			text = qs(0x4e02295c)
			is_popup
			hist_tex = icon_cag_head_type
			color_wheel = ($guitar_colorwheel)
			cam_name = 'cag_custom_head'
			camera_list = ['cag_custom_head' 'cag_custom_head_R' 'cag_custom_head_B' 'cag_custom_head_L']
			zoom_camera = 'customize_cag_Zoom'
			no_edit
		}
	}
	get_section_index_from_desc_id part = <part> target_desc_id = Finishes
	if GotParam \{section_index}
		add_car_menu_text_item {
			icon = icon_cag_head_finishes
			text = qs(0x3f47b13d)
			choose_state = UIstate_cap_artist_layer_popout
			choose_state_data = {
				part = <part>
				text = qs(0x6e23fd31)
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
	get_section_index_from_desc_id part = <part> target_desc_id = Fades
	if GotParam \{section_index}
		add_car_menu_text_item {
			icon = icon_details
			text = qs(0xc373ccff)
			choose_state = UIstate_cap_artist_layer_popout
			choose_state_data = {
				part = <part>
				text = qs(0x081f2003)
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
	get_section_index_from_desc_id part = <part> target_desc_id = Details
	if GotParam \{section_index}
		add_car_menu_text_item {
			icon = icon_details
			text = qs(0xe35a68c5)
			choose_state = UIstate_cap_artist_layer_popout
			choose_state_data = {
				part = <part>
				text = qs(0x7f5a5c11)
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
			choose_state = UIstate_cap_main
			choose_state_data = {
				savegame = ($cas_current_savegame)
				part = <part>
				text = qs(0x8f08ff76)
				hist_tex = icon_graphics
				return_stance = Stance_Select_Guitar
				cam_name = 'cag_custom_head'
				camera_list = ['cag_custom_head' 'cag_custom_head_R' 'cag_custom_head_B' 'cag_custom_head_L']
				zoom_camera = 'customize_cag_Zoom'
			}
		}
	endif
	menu_finish car_helper_text controller = <state_device>
	LaunchEvent type = focus target = create_cag_custom_head_id data = {child_index = <selected_index>}
endscript

script ui_destroy_cag_custom_head 
	destroy_generic_menu
endscript

script ui_return_cag_custom_head 
	spawnscriptnow \{ui_event_block
		params = {
			event = menu_refresh
		}}
endscript
