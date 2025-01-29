
script ui_create_cadrm_hub 
	if getcurrentcasobject
		<cas_object> :Anim_Command target = moment_blend Command = partialswitch_setstate params = {On BlendDuration = 0.0}
		<cas_object> :Anim_Command target = moment_blend_inner Command = partialswitch_setstate params = {OFF BlendDuration = 0.0}
	endif
	part = (<instrument_info>.body_part)
	make_generic_menu \{vmenu_id = create_cadrm_hub_vmenu
		title = qs(0xaba204d3)
		show_history}
	if <desc_id> :desc_resolvealias Name = 0x44475582 param = 0x7363d093
		<0x7363d093> :obj_spawnscript 0xa7a510a8 params = {0x4d641ae8 0xe99089a3 = $0x187899ed 0xffd05882 = $0xddccbea4}
	else

	endif
	if <desc_id> :desc_resolvealias Name = 0xf313b252 param = 0x7c09a415
		<0x7c09a415> :obj_spawnscript 0xa7a510a8 params = {0x4d641ae8 0xe99089a3 = $0x52565f88 0xffd05882 = $0xddccbea4}
	else

	endif
	setup_cas_menu_handlers \{vmenu_id = create_cadrm_hub_vmenu
		zoom_camera = 'cadrm_zoom'
		camera_list = [
			'cadrm_main'
			'cadrm_main_R'
			'cadrm_main'
			'cadrm_main_L'
		]}
	add_generic_menu_text_item {
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
			camera_list = ['cad_select_size' 'cadrm_main_R' 'cadrm_main' 'cadrm_main_L']
			zoom_camera = 'cadrm_zoom'
		}
	}
	add_generic_menu_text_item \{text = qs(0x66b50fc9)
		choose_state = uistate_customize_character_sub_sections
		choose_state_data = {
			text = qs(0x66b50fc9)
			cam_name = 'cad_select_shell'
			part = cas_drum_finish
			choose_script = ui_event
			choose_params = {
				event = menu_back
			}
			num_icons = 2
			stance = stance_select_drum
			return_stance = stance_select_drum
			zoom_camera = 'cadrm_zoom'
			camera_list = [
				'cad_select_shell'
				'cad_select_skin'
			]
		}}
	add_generic_menu_text_item \{text = qs(0xac0d5b20)
		choose_state = uistate_customize_character_sub_sections
		choose_state_data = {
			text = qs(0xac0d5b20)
			cam_name = 'cad_select_skin'
			part = cas_drum_detail
			choose_script = ui_event
			choose_params = {
				event = menu_back
			}
			num_icons = 2
			stance = stance_select_drum
			return_stance = stance_select_drum
			zoom_camera = 'cadrm_zoom'
			camera_list = [
				'cad_select_skin'
				'cadrm_skin_L'
				'cadrm_skin_R'
			]
		}}
	if is_part_capable part = <part>
		add_generic_menu_text_item {
			text = qs(0xde6cb37a)
			choose_state = uistate_cap_main
			choose_state_data = {savegame = ($cas_current_savegame) part = <part> text = qs(0xde6cb37a) cam_name = 'cad_select_skin' hist_tex = icon_graphics color_wheel = ($guitar_colorwheel) return_stance = stance_select_drum zoom_camera = 'cadrm_main' camera_list = ['cad_select_skin' 'cadrm_skin_R' 'cad_select_skin' 'cadrm_skin_L']}
		}
	endif
	add_generic_menu_text_item {
		text = qs(0x1dade7f1)
		choose_state = uistate_popout_select_part
		choose_state_data = {text = qs(0x19e32c14) purchase_menu cam_name = 'cad_select_drumsticks' part = cas_drums_sticks is_popup hist_tex = icon_sticks color_wheel = ($guitar_colorwheel) stance = stance_select_drumsticks return_stance = stance_select_drum zoom_camera = 'cadrm_main' camera_list = ['cad_select_drumsticks' 'cad_select_drumsticks_R' 'cad_select_drumsticks' 'cad_select_drumsticks_L']}
	}
	GetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue param = visit_cadrm
	if (<visit_cadrm> = 0)
		SetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue params = {visit_cadrm = 1}
		ui_event_wait \{event = menu_change
			data = {
				state = uistate_helper_dialogue
				is_popup
				life = 30
				text = qs(0x99dc981c)
			}}
	endif
	menu_finish \{car_helper_text}
	0x59249cc9
endscript

script ui_return_cadrm_hub 
	if getcurrentcasobject
		<cas_object> :Anim_Command target = moment_blend Command = partialswitch_setstate params = {On BlendDuration = 0.0}
		<cas_object> :Anim_Command target = moment_blend_inner Command = partialswitch_setstate params = {OFF BlendDuration = 0.0}
	endif
	clean_up_user_control_helpers
	menu_finish \{car_helper_text}
endscript

script ui_destroy_cadrm_hub 
	destroy_generic_menu
endscript
