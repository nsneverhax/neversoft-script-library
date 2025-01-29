
script ui_create_cag_custom_head 
	make_generic_menu \{vmenu_id = create_cag_custom_head_id
		show_history
		title = qs(0x3193a7ff)}
	if <desc_id> :desc_resolvealias Name = 0x44475582 param = 0x7363d093
		<0x7363d093> :obj_spawnscript 0xa7a510a8 params = {0x4d641ae8 0xe99089a3 = $0x187899ed 0xffd05882 = $0xddccbea4}
	else

	endif
	if <desc_id> :desc_resolvealias Name = 0xf313b252 param = 0x7c09a415
		<0x7c09a415> :obj_spawnscript 0xa7a510a8 params = {0x4d641ae8 0xe99089a3 = $0x52565f88 0xffd05882 = $0xddccbea4}
	else

	endif
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
	if getcasappearancepart part = <part>
		getactualcasoptionstruct part = <part> desc_id = <desc_id>
		if GotParam \{finishable}
			add_generic_menu_text_item {
				text = qs(0x3f47b13d)
				choose_state = uistate_cag_select_part_inclusion
				choose_state_data = {part = (<finishable>) body_part = <part> text = qs(0x6e23fd31) camera_list = ['cag_custom_head' 'cag_custom_head_R' 'cag_custom_head_B' 'cag_custom_head_L'] zoom_camera = 'cag_select_fretboard_Zoom' container_id = <container_id> is_popup hist_tex = icon_cag_head_finishes}
			}
		endif
		if GotParam \{detailable}
			add_generic_menu_text_item {
				text = qs(0xe35a68c5)
				choose_state = uistate_cag_select_part_inclusion
				choose_state_data = {part = (<detailable>) body_part = <part> text = qs(0x7f5a5c11) camera_list = ['cag_custom_head' 'cag_custom_head_R' 'cag_custom_head_B' 'cag_custom_head_L'] zoom_camera = 'cag_select_fretboard_Zoom' container_id = <container_id> is_popup hist_tex = icon_cag_head_finishes}
			}
		endif
		if GotParam \{fadeable}
			add_generic_menu_text_item {
				text = qs(0xc373ccff)
				choose_state = uistate_cag_select_part_inclusion
				choose_state_data = {part = (<fadeable>) body_part = <part> text = qs(0x081f2003) camera_list = ['cag_custom_head' 'cag_custom_head_R' 'cag_custom_head_B' 'cag_custom_head_L'] zoom_camera = 'cag_select_fretboard_Zoom' container_id = <container_id> is_popup hist_tex = icon_cag_head_finishes}
			}
		endif
	endif
	menu_finish \{car_helper_text}
	0x59249cc9
	LaunchEvent Type = focus target = create_cag_custom_head_id data = {child_index = <selected_index>}
endscript

script ui_destroy_cag_custom_head 
	destroy_generic_menu
endscript

script ui_return_cag_custom_head 
	SpawnScriptNow \{ui_event_block
		params = {
			event = menu_refresh
		}}
endscript
