
script ui_create_cag_custom_head 
	make_generic_menu \{vmenu_id = create_cag_custom_head_id
		show_history
		title = qs(0x3193a7ff)}
	setup_cas_menu_handlers \{vmenu_id = create_cag_custom_head_id
		camera_list = [
			'cag_custom_head'
			'cag_custom_head_R'
			'cag_custom_head_B'
			'cag_custom_head_L'
		]
		zoom_camera = 'cag_custom_head_Zoom'}
	add_generic_menu_text_item {
		text = qs(0xe8775204)
		choose_state = uistate_cag_select_part_inclusion
		choose_state_data = {
			part = <part>
			body_part = <body_part>
			text = qs(0x4e02295c)
			is_popup
			hist_tex = icon_cag_head_type
			color_wheel = ($guitar_colorwheel)
			camera_list = ['cag_custom_head' 'cag_custom_head_R' 'cag_custom_head_B' 'cag_custom_head_L']
			zoom_camera = 'cag_custom_head_Zoom'
			is_esp = <is_esp>
			no_edit
		}
	}
	get_section_index_from_desc_id part = <part> target_desc_id = finishes
	if gotparam \{section_index}
		add_generic_menu_text_item {
			text = qs(0x3f47b13d)
			choose_state = uistate_cap_artist_layer_popout
			choose_state_data = {
				part = <part>
				text = qs(0x6e23fd31)
				section_index = <section_index>
				is_popup
				hist_tex = icon_cag_head_finishes
				color_wheel = ($guitar_colorwheel)
				camera_list = ['cag_custom_head' 'cag_custom_head_R' 'cag_custom_head_B' 'cag_custom_head_L']
				zoom_camera = 'cag_custom_head_Zoom'
				is_esp = <is_esp>
			}
		}
		removeparameter \{section_index}
	endif
	get_section_index_from_desc_id part = <part> target_desc_id = details
	if gotparam \{section_index}
		add_generic_menu_text_item {
			text = qs(0xe35a68c5)
			choose_state = uistate_cap_artist_layer_popout
			choose_state_data = {
				part = <part>
				text = qs(0x7f5a5c11)
				section_index = <section_index>
				is_popup hist_tex = icon_details
				color_wheel = ($guitar_colorwheel)
				camera_list = ['cag_custom_head' 'cag_custom_head_R' 'cag_custom_head_B' 'cag_custom_head_L']
				zoom_camera = 'cag_custom_head_Zoom'
				is_esp = <is_esp>
			}
		}
		removeparameter \{section_index}
	endif
	if is_part_capable part = <part>
		add_generic_menu_text_item {
			text = qs(0xde6cb37a)
			choose_state = uistate_cap_main
			choose_state_data = {
				savegame = ($cas_current_savegame)
				part = <part>
				text = qs(0x8f08ff76)
				hist_tex = icon_graphics
				return_stance = stance_select_guitar
				camera_list = ['cag_custom_head' 'cag_custom_head_R' 'cag_custom_head_B' 'cag_custom_head_L']
				zoom_camera = 'cag_custom_head_Zoom'
			}
		}
	endif
	menu_finish \{car_helper_text}
	launchevent type = focus target = create_cag_custom_head_id data = {child_index = <selected_index>}
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
