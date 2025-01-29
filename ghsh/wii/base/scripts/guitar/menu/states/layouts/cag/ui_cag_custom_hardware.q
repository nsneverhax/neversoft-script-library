
script ui_create_cag_custom_hardware 
	SpawnScriptNow 0x0eb698f6 params = {<...>}
endscript

script 0x0eb698f6 
	Wait \{1
		Seconds}
	make_generic_menu \{vmenu_id = create_cag_custom_hardware_vmenu
		title = qs(0xf307bba2)
		show_history}
	setup_cas_menu_handlers \{vmenu_id = create_cag_custom_hardware_vmenu
		camera_list = [
			'cag_custom_hardware'
			'cag_custom_hardware_R'
			'cag_custom_hardware_B'
			'cag_custom_hardware_L'
		]
		zoom_camera = 'cag_custom_hardware_Zoom'}
	image = empty
	if (<is_prs>)
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
				is_prs = <is_prs>
			}
			ui_event_script = ui_event_if_camera_finished
		}
		image = prs_sponsor
	elseif (<is_sch>)
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
				is_sch = <is_sch>
			}
			ui_event_script = ui_event_if_camera_finished
		}
		image = schecter_sponsor
	else
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
			}
			ui_event_script = ui_event_if_camera_finished
		}
		image = empty
	endif
	if NOT ScreenElementExists \{id = guitar_sponsor_container}
		bx_create_guitar_sponsor
		bx_refresh_guitar_sponsor image = <image>
	else
		bx_refresh_guitar_sponsor image = <image>
	endif
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
	if (<is_prs>)
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
				is_prs = <is_prs>
			}
			ui_event_script = ui_event_if_camera_finished
		}
	elseif (<is_sch>)
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
				is_sch = <is_sch>
			}
			ui_event_script = ui_event_if_camera_finished
		}
	else
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
			}
			ui_event_script = ui_event_if_camera_finished
		}
	endif
	if (<is_prs>)
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
				is_prs = <is_prs>
			}
			ui_event_script = ui_event_if_camera_finished
		}
	elseif (<is_sch>)
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
				is_sch = <is_sch>
			}
			ui_event_script = ui_event_if_camera_finished
		}
	else
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
			}
			ui_event_script = ui_event_if_camera_finished
		}
	endif
	if (<is_prs>)
		add_generic_menu_text_item {
			text = qs(0xbeaa0dc6)
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
				is_prs = <is_prs>
			}
			ui_event_script = ui_event_if_camera_finished
		}
	elseif (<is_sch>)
		add_generic_menu_text_item {
			text = qs(0xbeaa0dc6)
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
				is_sch = <is_sch>
			}
			ui_event_script = ui_event_if_camera_finished
		}
	else
		add_generic_menu_text_item {
			text = qs(0xbeaa0dc6)
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
			}
			ui_event_script = ui_event_if_camera_finished
		}
	endif
	add_generic_menu_text_item {
		text = qs(0x636783b1)
		choose_state = uistate_cag_custom_strings
		choose_state_data = {part = (<instrument_info>.string_part) text = qs(0xff67b765) cam_name = 'DrumStart' is_popup}
		ui_event_script = ui_event_if_camera_finished
	}
	Change \{generic_menu_block_input = 0}
	menu_finish \{car_helper_text}
	LaunchEvent Type = focus target = create_cag_custom_hardware_vmenu data = {child_index = <selected_index>}
endscript

script ui_destroy_cag_custom_hardware 
	destroy_generic_menu
	bx_destroy_guitar_sponsor
endscript

script ui_return_cag_custom_hardware 
	Change \{generic_menu_block_input = 1}
	SpawnScriptNow \{ui_event_block
		params = {
			event = menu_refresh
		}}
endscript

script 0x556260c5 
	bx_destroy_guitar_sponsor
endscript
