
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
	setup_cas_menu_handlers \{vmenu_id = create_cag_custom_body_vmenu
		camera_list = [
			'cag_custom_body'
			'cag_custom_body_R'
			'cag_custom_body_B'
			'cag_custom_body_L'
		]
		zoom_camera = 'customize_cag_Zoom'}
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
	if getcasappearancepart part = <part>
		getactualcasoptionstruct part = <part> desc_id = <desc_id>
		if GotParam \{finishable}
			add_car_menu_text_item {
				text = qs(0xcc83e9d0)
				choose_state = uistate_cag_select_part_inclusion
				choose_state_data = {part = (<finishable>) body_part = <part> text = qs(0x6e23fd31) cam_anim = guitarbody container_id = <container_id> is_popup hist_tex = icon_cag_head_finishes
					camera_list = ['cag_custom_body' 'cag_custom_body_R' 'cag_custom_body_B' 'cag_custom_body_L']
					zoom_camera = 'customize_cag_Zoom'
				}
			}
		endif
		if GotParam \{detailable}
			add_car_menu_text_item {
				text = $wii_detail
				choose_state = uistate_cag_select_part_inclusion
				choose_state_data = {part = (<detailable>) body_part = <part> text = qs(0x7f5a5c11) cam_anim = guitarbody container_id = <container_id> is_popup hist_tex = icon_cag_head_finishes
					camera_list = ['cag_custom_body' 'cag_custom_body_R' 'cag_custom_body_B' 'cag_custom_body_L']
					zoom_camera = 'customize_cag_Zoom'
				}
			}
		endif
	endif
	Change \{generic_menu_block_input = 0}
	menu_finish car_helper_text controller = <state_device>
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
	ScriptAssert \{'continue_to_finishes: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script continue_to_type 
	if is_ui_event_running
		return \{FALSE}
	endif
	cascancelloading
	casblockforcomposite
	casblockforloading
	ui_event_block event = menu_change data = {state = uistate_cag_custom_body_types <...>}
endscript
