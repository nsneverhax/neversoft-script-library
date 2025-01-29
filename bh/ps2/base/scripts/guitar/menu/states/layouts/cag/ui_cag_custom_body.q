
script ui_create_cag_custom_body 
	part = (<instrument_info>.body_part)
	make_generic_menu \{vmenu_id = create_cag_custom_body_vmenu
		title = qs(0x706474c8)
		show_history
		0xc1dc518f = 1}
	if <desc_id> :desc_resolvealias Name = 0x44475582 param = 0x7363d093
		<0x7363d093> :obj_spawnscript 0xa7a510a8 params = {0x4d641ae8 0xe99089a3 = $0x187899ed 0xffd05882 = $0xddccbea4}
	else

	endif
	if <desc_id> :desc_resolvealias Name = 0xf313b252 param = 0x7c09a415
		<0x7c09a415> :obj_spawnscript 0xa7a510a8 params = {0x4d641ae8 0xe99089a3 = $0x52565f88 0xffd05882 = $0xddccbea4}
	else

	endif
	setup_cas_menu_handlers \{vmenu_id = create_cag_custom_body_vmenu
		camera_list = [
			'cag_custom_body'
			'cag_custom_body_R'
			'cag_custom_body_B'
			'cag_custom_body_L'
		]
		zoom_camera = 'cag_custom_body_zoom'}
	add_generic_menu_text_item {
		text = qs(0xe8775204)
		pad_choose_script = continue_to_type
		pad_choose_params = {
			part = <part>
			is_popup
			cam_name = 'cag_custom_body'
			camera_list = ['cag_custom_body' 'cag_custom_body_R' 'cag_custom_body_B' 'cag_custom_body_L']
			zoom_camera = 'cag_custom_body_zoom'
			is_esp = <is_esp>
		}
	}
	if getcasappearancepart part = <part>
		getactualcasoptionstruct part = <part> desc_id = <desc_id>
		if GotParam \{finishable}
			add_generic_menu_text_item {
				text = qs(0x3f47b13d)
				choose_state = uistate_cag_select_part_inclusion
				choose_state_data = {part = (<finishable>) body_part = <part> text = qs(0x6e23fd31) cam_name = 'cag_custom_body' container_id = <container_id> is_popup hist_tex = icon_cag_finishes camera_list = ['cag_custom_body' 'cag_custom_body_R' 'cag_custom_body_B' 'cag_custom_body_L'] zoom_camera = 'cag_custom_body_zoom'}
			}
		endif
		if GotParam \{detailable}
			add_generic_menu_text_item {
				text = qs(0xe35a68c5)
				choose_state = uistate_cag_select_part_inclusion
				choose_state_data = {part = (<detailable>) body_part = <part> text = qs(0x7f5a5c11) cam_name = 'cag_custom_body' container_id = <container_id> is_popup hist_tex = icon_details camera_list = ['cag_custom_body' 'cag_custom_body_R' 'cag_custom_body_B' 'cag_custom_body_L'] zoom_camera = 'cag_custom_body_zoom'}
			}
		endif
		if GotParam \{fadeable}
			add_generic_menu_text_item {
				text = qs(0xc373ccff)
				choose_state = uistate_cag_select_part_inclusion
				choose_state_data = {part = (<fadeable>) body_part = <part> text = qs(0x081f2003) cam_name = 'cag_custom_body' container_id = <container_id> is_popup hist_tex = icon_details camera_list = ['cag_custom_body' 'cag_custom_body_R' 'cag_custom_body_B' 'cag_custom_body_L'] zoom_camera = 'cag_custom_body_zoom'}
			}
		endif
		if GotParam \{logoable}
			add_generic_menu_text_item {
				text = qs(0xa0af3d41)
				choose_state = uistate_cag_select_part_inclusion
				choose_state_data = {part = (<logoable>) body_part = <part> text = qs(0x50df6bb6) cam_name = 'cag_custom_body' container_id = <container_id> is_popup hist_tex = icon_graphics camera_list = ['cag_custom_body' 'cag_custom_body_R' 'cag_custom_body_B' 'cag_custom_body_L'] zoom_camera = 'cag_custom_body_zoom'}
			}
		endif
	endif
	Change \{generic_menu_block_input = 0}
	menu_finish \{car_helper_text}
	0x59249cc9
	LaunchEvent Type = focus target = create_cag_custom_body_vmenu data = {child_index = <selected_index>}
endscript

script ui_destroy_cag_custom_body 
	destroy_generic_menu
endscript

script ui_return_cag_custom_body 
	Change \{generic_menu_block_input = 1}
	SpawnScriptNow \{ui_event_block
		params = {
			event = menu_refresh
		}}
endscript

script continue_to_finishes 
	if is_ui_event_running
		return \{FALSE}
	endif
	ui_event_block event = menu_change data = {state = uistate_cap_artist_layer_popout <...>}
endscript

script continue_to_type 
	if is_ui_event_running
		return \{FALSE}
	endif
	ui_event_block event = menu_change data = {state = uistate_cag_custom_body_types <...>}
endscript
