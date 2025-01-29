
script ui_create_cas_select_part_color_options 
	SpawnScriptNow ui_create_cas_select_part_color_options_worker params = {<...>}
endscript

script ui_create_cas_select_part_color_options_worker 
	make_generic_menu {
		vmenu_id = create_cas_select_part_options_vmenu
		title = qs(0xebc3fb3a)
		pad_back_script = ui_event
		pad_back_params = {event = menu_back data = {num_states = <num_states>}}
		show_history
		num_icons = <num_icons>
	}
	setup_cas_menu_handlers vmenu_id = create_cas_select_part_options_vmenu camera_list = <camera_list> zoom_camera = <zoom_camera>
	resolvebodyspecificpartinappearance part = <part>
	GetArraySize <part_materials>
	if (<array_Size> = 0)
		generic_event_back \{data = {
				num_states = 2
			}}
	endif
	i = 0
	begin
	AddArrayElement array = [] element = (<part_materials> [<i>])
	formatText TextName = text qs(0xdfd513db) d = (<i> + 1)
	add_generic_menu_icon_item {
		text = <text>
		icon = widget_colorwheel
		choose_state = uistate_cas_color_edit
		choose_state_data = {part = <part> part_materials = <array> num_states = <num_states> hist_tex = widget_colorwheel color_wheel = <color_wheel> camera_list = <camera_list> zoom_camera = <zoom_camera> skip_deinit_script = 1}
	}
	i = (<i> + 1)
	repeat <array_Size>
	menu_finish \{car_helper_text_back}
	if GotParam \{cam_name}
		Change \{generic_menu_block_input = 1}
		task_menu_default_anim_in base_name = <cam_name>
		Change \{generic_menu_block_input = 0}
	endif
endscript

script ui_destroy_cas_select_part_color_options 
	destroy_generic_menu
endscript

script ui_deinit_cas_select_part_color_options 
	getcurrentcasobject
	if GotParam \{return_stance}
		bandmanager_changestance Name = <cas_object> stance = <return_stance> no_wait
	else
		bandmanager_changestance Name = <cas_object> stance = stance_frontend no_wait
	endif
	if GotParam \{additional_deinit_script}
		<additional_deinit_script>
	endif
endscript
