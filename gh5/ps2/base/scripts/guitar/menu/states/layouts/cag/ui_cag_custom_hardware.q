
script ui_create_cag_custom_hardware 
	SpawnScriptNow 0x0eb698f6 params = {<...>}
endscript

script 0x0eb698f6 
	Wait \{1
		Seconds}
	make_generic_menu \{vmenu_id = create_cag_custom_hardware_vmenu
		title = qs(0xf307bba2)
		show_history
		0x36ee6bbc}
	if <desc_id> :desc_resolvealias Name = 0x44475582 param = 0x7363d093
		<0x7363d093> :obj_spawnscript 0xa7a510a8 params = {0x4d641ae8 0xe99089a3 = $0x187899ed 0xffd05882 = $0xddccbea4}
	else

	endif
	if <desc_id> :desc_resolvealias Name = 0xf313b252 param = 0x7c09a415
		<0x7c09a415> :obj_spawnscript 0xa7a510a8 params = {0x4d641ae8 0xe99089a3 = $0x52565f88 0xffd05882 = $0xddccbea4}
	else

	endif
	setup_cas_menu_handlers \{vmenu_id = create_cag_custom_hardware_vmenu
		camera_list = [
			'cag_custom_hardware'
			'cag_custom_hardware_R'
			'cag_custom_hardware_B'
			'cag_custom_hardware_L'
		]
		zoom_camera = 'cag_custom_hardware_Zoom'}
	add_generic_menu_text_item {
		text = qs(0xd35350a0)
		choose_state = uistate_cag_select_part_inclusion
		choose_state_data = {
			part = (<instrument_info>.pick_guard_part)
			body_part = (<instrument_info>.body_part)
			text = qs(0x950867d1)
			cam_name = 'cag_custom_hardware'
			camera_list = ['cag_custom_hardware' 'cag_custom_hardware_R' 'cag_custom_hardware_B' 'cag_custom_hardware_L']
			zoom_camera = 'cag_custom_hardware_Zoom'
			is_popup
			hist_tex = icon_cag_pickguard
			no_edit
			is_esp = <is_esp>
		}
		ui_event_script = ui_event_if_camera_finished
	}
	get_part_current_desc_id part = (<instrument_info>.pick_guard_part)
	get_section_index_from_desc_id part = (<instrument_info>.pick_guard_part) target_desc_id = finishes
	if NOT (<current_desc_id> = None)
		add_generic_menu_text_item {
			text = qs(0x1f080e95)
			choose_state = uistate_cag_select_part_inclusion
			choose_state_data = {part = (<instrument_info>.pickgaurd_finish_part) body_part = (<instrument_info>.pick_guard_part) text = qs(0xe5477553) cam_name = 'DrumStart' is_popup hist_tex = icon_pickguard_finishes color_wheel = ($guitar_colorwheel) camera_list = ['cag_custom_hardware' 'cag_custom_hardware_R' 'cag_custom_hardware_B' 'cag_custom_hardware_L']}
			ui_event_script = ui_event_if_camera_finished
		}
		RemoveParameter \{section_index}
	endif
	add_generic_menu_text_item {
		text = qs(0xa3273aad)
		choose_state = uistate_cag_select_part_inclusion
		choose_state_data = {
			part = (<instrument_info>.pickups_part)
			body_part = (<instrument_info>.body_part)
			text = qs(0x3f270e79)
			cam_name = 'cag_custom_hardware'
			camera_list = ['cag_custom_hardware' 'cag_custom_hardware_R' 'cag_custom_hardware_B' 'cag_custom_hardware_L']
			zoom_camera = 'cag_custom_hardware_Zoom'
			is_popup
			hist_tex = icon_cag_pickups
			color_wheel = ($guitar_colorwheel)
			is_esp = <is_esp>
		}
		ui_event_script = ui_event_if_camera_finished
	}
	add_generic_menu_text_item {
		text = qs(0x18bd9d99)
		choose_state = uistate_cag_select_part_inclusion
		choose_state_data = {
			part = (<instrument_info>.knobs_part)
			body_part = (<instrument_info>.body_part)
			text = qs(0xd3d17165)
			cam_name = 'cag_custom_hardware'
			camera_list = ['cag_custom_hardware' 'cag_custom_hardware_R' 'cag_custom_hardware_B' 'cag_custom_hardware_L']
			zoom_camera = 'cag_custom_hardware_Zoom'
			is_popup
			hist_tex = icon_cag_knobs
			color_wheel = ($guitar_colorwheel)
			is_esp = <is_esp>
		}
		ui_event_script = ui_event_if_camera_finished
	}
	add_generic_menu_text_item {
		text = qs(0xe84a22c5)
		choose_state = uistate_cag_select_part_inclusion
		choose_state_data = {
			part = (<instrument_info>.bridge_part)
			body_part = (<instrument_info>.body_part)
			text = qs(0x22aa3912)
			cam_name = 'cag_custom_hardware'
			camera_list = ['cag_custom_hardware' 'cag_custom_hardware_R' 'cag_custom_hardware_B' 'cag_custom_hardware_L']
			zoom_camera = 'cag_custom_hardware_Zoom'
			is_popup
			hist_tex = icon_cag_bridges
			color_wheel = ($guitar_colorwheel)
			is_esp = <is_esp>
		}
		ui_event_script = ui_event_if_camera_finished
	}
	add_generic_menu_text_item {
		text = qs(0x02fe1084)
		choose_state = uistate_cag_select_part_inclusion
		choose_state_data = {
			part = (<instrument_info>.misc_part)
			body_part = (<instrument_info>.body_part)
			text = qs(0x30e49e2e)
			cam_name = 'cag_custom_hardware'
			camera_list = ['cag_custom_hardware' 'cag_custom_hardware_R' 'cag_custom_hardware_B' 'cag_custom_hardware_L']
			zoom_camera = 'cag_custom_hardware_Zoom'
			is_popup
			hist_tex = icon_cag_bridges
			color_wheel = ($guitar_colorwheel)
			is_esp = <is_esp>
		}
		ui_event_script = ui_event_if_camera_finished
	}
	add_generic_menu_text_item {
		text = qs(0x636783b1)
		choose_state = uistate_cag_custom_strings
		choose_state_data = {part = (<instrument_info>.string_part) text = qs(0xff67b765) cam_name = 'DrumStart' is_popup}
		ui_event_script = ui_event_if_camera_finished
	}
	Change \{generic_menu_block_input = 0}
	menu_finish \{car_helper_text}
	0x59249cc9
	LaunchEvent Type = focus target = create_cag_custom_hardware_vmenu data = {child_index = <selected_index>}
endscript

script ui_destroy_cag_custom_hardware 
	destroy_generic_menu
endscript

script ui_return_cag_custom_hardware 
	Change \{generic_menu_block_input = 1}
	SpawnScriptNow \{ui_event_block
		params = {
			event = menu_refresh
		}}
endscript
