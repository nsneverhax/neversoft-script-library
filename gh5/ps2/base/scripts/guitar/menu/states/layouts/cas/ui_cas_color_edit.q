
script ui_create_cas_color_edit title = qs(0x1a32079f) controller = ($primary_controller)
	ui_event_add_params hist_tex = <hist_tex>
	make_generic_menu {
		vmenu_id = create_cas_color_edit_vmenu
		pad_option2_script = color_edit_restore_default
		pad_option2_params = {part = <part>}
		title = <title>
		num_icons = <num_icons>
		show_history
	}
	if <desc_id> :desc_resolvealias Name = 0x44475582 param = 0x7363d093
		<0x7363d093> :obj_spawnscript 0xa7a510a8 params = {0x4d641ae8 0xe99089a3 = $0x187899ed 0xffd05882 = $0xddccbea4}
	else

	endif
	if <desc_id> :desc_resolvealias Name = 0xf313b252 param = 0x7c09a415
		<0x7c09a415> :obj_spawnscript 0xa7a510a8 params = {0x4d641ae8 0xe99089a3 = $0x52565f88 0xffd05882 = $0xddccbea4}
	else

	endif
	SpawnScriptNow task_menu_default_anim_in params = {base_name = <cam_name> do_not_hide}
	setup_cas_menu_handlers vmenu_id = create_cas_color_edit_vmenu camera_list = <camera_list> zoom_camera = <zoom_camera>
	if GotParam \{cam_name}
		SpawnScriptNow task_menu_default_anim_in params = {base_name = <cam_name>}
	endif
	resolvebodyspecificpartinappearance part = <part>
	GetArraySize <part_materials>
	if (<array_Size> = 0)

	endif
	if NOT GotParam \{material_index}
		material_index = 0
	endif
	color_edit_get_current_colors part = <part> part_material = (<part_materials> [<material_index>])
	colorwheel_add_item {
		Scale = 0.6
		pad_choose_script = color_edit_exit_accept
		pad_choose_params = {num_states = <num_states> material_index = <material_index> part = <part> part_materials = <part_materials>}
		increment_focus_script = color_edit_focus_change
		increment_focus_params = {part = <part> part_material = (<part_materials> [<material_index>])}
		initial_rgb = <rgb>
		special_exit_script = color_edit_restore_previous
		lookup_table = <color_wheel>
	}
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000
		all_buttons}
	add_user_control_helper \{text = qs(0xf7723015)
		button = red
		z = 100000}
	add_user_control_helper \{text = qs(0x38ee4773)
		button = yellow
		z = 100000}
	menu_finish_rotate_zoom
	LaunchEvent \{Type = focus
		target = create_cas_color_edit_vmenu
		data = {
			child_index = 0
		}}
	LaunchEvent \{Type = pad_choose}
	if ScreenElementExists \{id = color_wheel_menu_item}
		setup_cas_menu_handlers vmenu_id = color_wheel_menu_item no_zoom = <no_zoom> camera_list = <camera_list> zoom_camera = <zoom_camera>
	endif
	if GotParam \{stance}
		getcurrentcasobject
		if (stance_select_drum = <stance>)
			<cas_object> :Anim_Command target = moment_blend Command = partialswitch_setstate params = {On BlendDuration = 0.0}
			<cas_object> :Anim_Command target = moment_blend_inner Command = partialswitch_setstate params = {OFF BlendDuration = 0.0}
		endif
	endif
endscript

script ui_return_cas_color_edit 
	menu_finish \{car_helper_text_extra}
endscript

script ui_destroy_cas_color_edit 
	destroy_generic_menu
endscript

script ui_init_cas_color_edit 
	ui_event_add_params \{hist_tex = menu_history_color_edit}
	pushtemporarycasappearance
endscript

script ui_deinit_cas_color_edit 
	poptemporarycasappearance
	if NOT GotParam \{skip_deinit_script}
		if GotParam \{additional_deinit_script}
			<additional_deinit_script>
		endif
		getcurrentcasobject
		if GotParam \{return_stance}
			bandmanager_changestance Name = <cas_object> stance = <return_stance> no_wait
		else
			bandmanager_changestance Name = <cas_object> stance = stance_frontend no_wait
		endif
	endif
endscript

script color_edit_focus_change 
	SpawnScriptNow 0xaa85391f params = {<...>}
endscript

script 0xaa85391f 
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	Wait \{1
		Seconds}
	cas_queue_wait
	if getcasappearancepart part = <part>
		if getactualcasoptionstruct part = <part> desc_id = <desc_id>
			if GotParam \{color_all_materials}
				table_entry = ($color_lookup_table.<Color>)
				rgbtohsv rgb = (<table_entry>.diffuse)
				h = (<hsv> [0])
				s = (<hsv> [1])
				v = (<hsv> [2])
				CastToInteger \{h}
				CastToInteger \{s}
				CastToInteger \{v}
				colormenu_set_hsv part = <part> h = <h> s = <s> v = <v>
			endif
		endif
	endif
	setcasappearancematerial part = <part> material = <part_material> value = <Color>
	if ((<part> = cas_female_hair) || (<part> = cas_male_hair))
		if getcasappearancepart part = <part>
			cas_propogate_hair_color
		endif
	endif
	cas_propogate_guitar_color_to part = <part>
	cas_propogate_color_to_other_parts \{part = cas_body
		other_parts = $ps2_fleshy_parts_array}
	rebuildcurrentcasmodel
endscript

script color_edit_get_current_colors 

	if getcasmaterialvalue part = <part> material = <part_material>
		lookup = ($color_lookup_table.<value>)
		if GotParam \{lookup}
			if StructureContains structure = <lookup> diffuse
				diff_r = (<lookup>.diffuse [0])
				diff_g = (<lookup>.diffuse [1])
				diff_b = (<lookup>.diffuse [2])
				if isfloat <diff_r>
					diff_r = (<diff_r> * 255.0)
					diff_g = (<diff_g> * 255.0)
					diff_b = (<diff_b> * 255.0)
					CastToInteger \{diff_r}
					CastToInteger \{diff_g}
					CastToInteger \{diff_b}
				endif
				rgb = [0 0 0]
				SetArrayElement ArrayName = rgb index = 0 NewValue = <diff_r>
				SetArrayElement ArrayName = rgb index = 1 NewValue = <diff_g>
				SetArrayElement ArrayName = rgb index = 2 NewValue = <diff_b>
			endif
		else

		endif
	endif
	if NOT GotParam \{rgb}
		AddArrayElement array = [] element = ($default_cas_hue)
		AddArrayElement array = <array> element = ($default_cas_sat)
		AddArrayElement array = <array> element = ($default_cas_value)
		hsvtorgb hsv = <array>
	endif
	return rgb = <rgb>
endscript

script color_edit_exit_accept \{num_states = 2}
	GetArraySize <part_materials>
	material_index = (<material_index> + 1)
	if (<material_index> < <array_Size>)
		ui_event event = menu_change data = {
			state = uistate_cas_color_edit
			part = <part>
			part_materials = <part_materials>
			material_index = <material_index>
			hist_tex = menu_history_color_edit
			num_states = (<num_states> + 1)
		}
	else
		generic_event_back data = {num_states = <num_states>}
	endif
endscript

script color_edit_restore_default 

	KillSpawnedScript \{Name = 0xaa85391f}
	Wait \{1
		gameframe}
	if (<part> = cas_body)
		str = (($cas_current_appearance).<part>)
		0x96bc3f95 = Random (@ skin_white3 @ skin_black3 @ skin_asian3 @ skin_latin3 )
		appendstruct struct = cas_current_appearance Field = <part> params = {<str> chosen_materials = {skin = <0x96bc3f95>} use_default_diffuse = 0 use_default_hsv = 0} globalstruct
		cas_propogate_color_to_other_parts \{part = cas_body
			other_parts = $ps2_fleshy_parts_array}
	else
		str = (($cas_current_appearance).<part>)
		0x5677ec25 = {}
		if ps2_getactualcasoptionstruct_as_struct part = <part> desc_id = (<str>.desc_id)
			if StructureContains structure = <ps2_part_struct> chosen_materials
				0x5677ec25 = (<ps2_part_struct>.chosen_materials)
			endif
		endif
		appendstruct struct = cas_current_appearance Field = <part> params = {<str> chosen_materials = {<0x5677ec25>} use_default_diffuse = 1 use_default_hsv = 1} globalstruct
	endif
	updatecurrentcasmodel \{buildscript = create_model_from_appearance}
	generic_event_back
	return
endscript

script color_edit_restore_previous 
	restoretoptemporarycasappearance \{update_color}
	generic_event_back
endscript
