cas_temp_parts = [
]

script ui_create_customize_character_sub_sections 
	0x9029b767 = FALSE
	switch (<part>)
		case cas_torso_art
		icon = bodyart_chest
		cam_name = 'customize_tat_torso'
		sections = cas_body_art_sections
		scroll_thumb_new_offset = 100
		case cas_right_arm_art
		icon = bodyart_rightarm
		cam_name = 'customize_tat_right_arm'
		sections = cas_body_art_sections
		scroll_thumb_new_offset = 100
		case cas_left_arm_art
		icon = bodyart_leftarm
		cam_name = 'customize_tat_left_arm'
		sections = cas_body_art_sections
		scroll_thumb_new_offset = 100
		case cas_drum_detail
		icon = icon_cadrm_skin
		cam_name = 'cad_select_skin'
		sections = cas_drum_skin_sections
		inclusion_part = cas_drums
		if getcurrentcasobject
			<cas_object> :Anim_Command target = moment_blend Command = partialswitch_setstate params = {On BlendDuration = 0.0}
			<cas_object> :Anim_Command target = moment_blend_inner Command = partialswitch_setstate params = {OFF BlendDuration = 0.0}
		endif
		0x9029b767 = true
		case cas_drum_finish
		icon = icon_cadrm_shell
		cam_name = 'cad_select_shell'
		sections = cas_drum_shell_sections
		inclusion_part = cas_drums
		if getcurrentcasobject
			<cas_object> :Anim_Command target = moment_blend Command = partialswitch_setstate params = {On BlendDuration = 0.0}
			<cas_object> :Anim_Command target = moment_blend_inner Command = partialswitch_setstate params = {OFF BlendDuration = 0.0}
		endif
		0x9029b767 = true
	endswitch
	make_generic_menu {
		vmenu_id = create_customize_character_body_art_vmenu
		title = <text>
		num_icons = 2
		show_history
		0xc1dc518f = <0xc1dc518f>
	}
	if <desc_id> :desc_resolvealias Name = 0x44475582 param = 0x7363d093
		<0x7363d093> :obj_spawnscript 0xa7a510a8 params = {0x4d641ae8 0xe99089a3 = $0x187899ed 0xffd05882 = $0xddccbea4}
	else

	endif
	if <desc_id> :desc_resolvealias Name = 0xf313b252 param = 0x7c09a415
		<0x7c09a415> :obj_spawnscript 0xa7a510a8 params = {0x4d641ae8 0xe99089a3 = $0x52565f88 0xffd05882 = $0xddccbea4}
	else

	endif
	setup_cas_menu_handlers vmenu_id = create_customize_character_body_art_vmenu camera_list = <camera_list> zoom_camera = <zoom_camera> NO_ROTATE = <NO_ROTATE> no_zoom = <no_zoom> pull_back_distance = <pull_back_distance>
	GetArraySize ($<sections>)
	i = 0
	begin
	show_set = 1
	if GotParam \{inclusion_part}
		ui_customize_character_sub_sections_get_included_count part = <part> parts_list = ($<sections> [<i>].parts) inclusion_part = <inclusion_part>
		if (<included_count> < 2)
			show_set = 0
		endif
	endif
	if (<show_set> = 1)
		add_generic_menu_text_item {
			text = ($<sections> [<i>].text)
			pad_choose_script = ui_select_object_subset_and_continue
			pad_choose_params = {<...> parts_list = ($<sections> [<i>].parts) inclusion_part = <inclusion_part>}
		}
	endif
	i = (<i> + 1)
	repeat <array_Size>
	menu_finish \{car_helper_text}
	if (<0x9029b767> = true)
		0x59249cc9
	endif
	if GotParam \{stance}
		getcurrentcasobject
		if (stance_select_drum = <stance>)
			<cas_object> :Anim_Command target = moment_blend Command = partialswitch_setstate params = {On BlendDuration = 0.0}
			<cas_object> :Anim_Command target = moment_blend_inner Command = partialswitch_setstate params = {OFF BlendDuration = 0.0}
			0x8dbdaee4 \{qs(0xf57f774b)}
		endif
	endif
	LaunchEvent Type = focus target = create_customize_character_body_art_vmenu data = {child_index = <selected_index>}
endscript

script ui_destroy_customize_character_sub_sections 
	getcurrentcasobject
	if GotParam \{return_stance}
		bandmanager_changestance Name = <cas_object> stance = <return_stance> no_wait
	else
		bandmanager_changestance Name = <cas_object> stance = stance_frontend no_wait
	endif
	destroy_generic_menu
endscript

script ui_select_object_subset_and_continue 
	Change \{cas_temp_parts = [
		]}
	GetArraySize (<parts_list>)
	i = 0
	begin
	temp_desc = (<parts_list> [<i>])
	getactualcasoptionstruct part = <part> desc_id = <temp_desc>
	temp_struct = {desc_id = <temp_desc> frontend_desc = <frontend_desc>}
	if GotParam \{materials}
		temp_struct = {<temp_struct> materials = <materials>}
	endif
	if GotParam \{hidden}
		temp_struct = {<temp_struct> hidden}
	endif
	if GotParam \{inclusion_part}
		get_inclusion_list body_part = <inclusion_part>
		if cas_in_inclusion_list inclusion = <inclusion> part_name = <part> part_desc_id = <temp_desc>
			AddArrayElement array = ($cas_temp_parts) element = <temp_struct>
			Change cas_temp_parts = <array>
		endif
	else
		AddArrayElement array = ($cas_temp_parts) element = <temp_struct>
		Change cas_temp_parts = <array>
	endif
	i = (<i> + 1)
	repeat (<array_Size>)
	ui_event event = menu_change data = {state = uistate_popout_select_part text = <text> cam_name = <cam_name> part = cas_temp_parts surrogate_part = <part> num_icons = 2 is_popup icon_offset = (0.0, 120.0) list_offset = (0.0, 155.0) color_wheel = ($clothing_colorwheel) stance = <stance> return_stance = <stance> camera_list = <camera_list> zoom_camera = <zoom_camera> NO_ROTATE = <NO_ROTATE> no_zoom = <no_zoom> pull_back_distance = <pull_back_distance> play_current_anim = <play_current_anim>}
endscript

script ui_init_customize_character_sub_sections 
	if GotParam \{additional_init_script}
		<additional_init_script>
	endif
	if GotParam \{stance}
		getcurrentcasobject
		bandmanager_changestance Name = <cas_object> stance = <stance> no_wait
		if (stance_select_drum = <stance>)
			<cas_object> :Anim_Command target = moment_blend Command = partialswitch_setstate params = {On BlendDuration = 0.0}
			<cas_object> :Anim_Command target = moment_blend_inner Command = partialswitch_setstate params = {OFF BlendDuration = 0.0}
		endif
	endif
	if GotParam \{cam_name}
		SpawnScriptNow ui_customize_character_sub_sections_animate_cam_in params = {<...>}
	endif
	if NOT GotParam \{surrogate_part}
		resolvebodyspecificpartinappearance part = <part>
		surrogate_part = <part>
	endif
	if NOT load_part_desc_pak part_type = <surrogate_part>
		ui_event_add_params unload_desc_pak_type = <surrogate_part>
	endif
endscript

script ui_deinit_customize_character_sub_sections 
	if GotParam \{additional_deinit_script}
		<additional_deinit_script>
	endif
	getcurrentcasobject
	if GotParam \{return_stance}
		bandmanager_changestance Name = <cas_object> stance = <return_stance> no_wait
	else
		bandmanager_changestance Name = <cas_object> stance = stance_frontend no_wait
	endif
	if GotParam \{unload_desc_pak_type}
		unload_part_desc_pak part_type = <unload_desc_pak_type>
	endif
endscript

script ui_return_customize_character_sub_sections 
	menu_finish \{car_helper_text}
endscript

script ui_customize_character_sub_sections_get_included_count 
	GetArraySize (<parts_list>)
	included_count = 0
	i = 0
	begin
	temp_desc = (<parts_list> [<i>])
	get_inclusion_list body_part = <inclusion_part>
	if cas_in_inclusion_list inclusion = <inclusion> part_name = <part> part_desc_id = <temp_desc>
		included_count = (<included_count> + 1)
	endif
	i = (<i> + 1)
	repeat (<array_Size>)
	return included_count = <included_count>
endscript

script ui_customize_character_sub_sections_animate_cam_in 
	Change \{generic_menu_block_input = 1}
	task_menu_default_anim_in base_name = <cam_name>
	Change \{generic_menu_block_input = 0}
endscript
