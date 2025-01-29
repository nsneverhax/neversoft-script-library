
script ui_create_cas_color_edit title = qs(0xc420923e) controller = ($primary_controller)
	ui_event_add_params hist_tex = <hist_tex>
	make_generic_menu {
		vmenu_id = create_cas_color_edit_vmenu
		pad_option2_script = color_edit_restore_default
		pad_option2_params = {part = <part>}
		title = <title>
		num_icons = <num_icons>
		show_history
	}
	setup_cas_menu_handlers vmenu_id = create_cas_color_edit_vmenu camera_list = <camera_list> zoom_camera = <zoom_camera>
	if gotparam \{cam_name}
		spawnscriptnow task_menu_default_anim_in params = {base_name = <cam_name>}
	endif
	resolvebodyspecificpartinappearance part = <part>
	getarraysize <part_materials>
	if (<array_size> = 0)
		scriptassert \{'No part_materials!'}
	endif
	if NOT gotparam \{material_index}
		material_index = 0
	endif
	color_edit_get_current_colors part = <part> part_material = (<part_materials> [<material_index>])
	colorwheel_add_item {
		scale = 0.6
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
		z = 100000}
	add_user_control_helper \{text = qs(0xf7723015)
		button = red
		z = 100000}
	add_user_control_helper \{text = qs(0x38ee4773)
		button = yellow
		z = 100000}
	if ((isguitarcontroller controller = <controller>) || (isdrumcontroller controller = <controller>) || (0x1c708d82 controller = <controller>))
		add_user_control_helper \{text = qs(0xe7d2a66e)
			button = blue
			z = 100000}
		add_user_control_helper \{text = qs(0x26950e02)
			button = orange
			z = 100000}
	else
		add_user_control_helper \{text = qs(0xe7d2a66e)
			button = lbrb
			z = 100000}
		add_user_control_helper \{text = qs(0x26950e02)
			button = rt
			z = 100000}
	endif
	launchevent \{type = focus
		target = create_cas_color_edit_vmenu
		data = {
			child_index = 0
		}}
	launchevent \{type = pad_choose}
	if screenelementexists \{id = color_wheel_menu_item}
		setup_cas_menu_handlers vmenu_id = color_wheel_menu_item no_zoom = <no_zoom> camera_list = <camera_list> zoom_camera = <zoom_camera>
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
	if NOT gotparam \{skip_deinit_script}
		if gotparam \{additional_deinit_script}
			<additional_deinit_script>
		endif
		getcurrentcasobject
		if gotparam \{return_stance}
			bandmanager_changestance name = <cas_object> stance = <return_stance> no_wait
		else
			bandmanager_changestance name = <cas_object> stance = stance_frontend no_wait
		endif
	endif
endscript

script color_edit_focus_change 
	setcasappearancematerial part = <part> material = <part_material> value = <color>
	if ((<part> = cas_female_hair) || (<part> = cas_male_hair))
		if getcasappearancepart part = <part>
			cas_propogate_hair_color
		endif
	endif
	cas_propogate_guitar_color_to part = <part>
	updatecurrentcasmodel \{buildscript = color_model_from_appearance}
endscript

script color_edit_get_current_colors 
	requireparams \{[
			part
			part_material
		]
		all}
	if getcasmaterialvalue part = <part> material = <part_material>
		lookup = ($color_lookup_table.<value>)
		if gotparam \{lookup}
			if structurecontains structure = <lookup> diffuse
				diff_r = (<lookup>.diffuse [0])
				diff_g = (<lookup>.diffuse [1])
				diff_b = (<lookup>.diffuse [2])
				if isfloat <diff_r>
					diff_r = (<diff_r> * 255.0)
					diff_g = (<diff_g> * 255.0)
					diff_b = (<diff_b> * 255.0)
					casttointeger \{diff_r}
					casttointeger \{diff_g}
					casttointeger \{diff_b}
				endif
				rgb = [0 0 0]
				setarrayelement arrayname = rgb index = 0 newvalue = <diff_r>
				setarrayelement arrayname = rgb index = 1 newvalue = <diff_g>
				setarrayelement arrayname = rgb index = 2 newvalue = <diff_b>
			endif
		else
			printstruct <...>
		endif
	endif
	if NOT gotparam \{rgb}
		addarrayelement array = [] element = ($default_cas_hue)
		addarrayelement array = <array> element = ($default_cas_sat)
		addarrayelement array = <array> element = ($default_cas_value)
		hsvtorgb hsv = <array>
	endif
	return rgb = <rgb>
endscript

script color_edit_exit_accept \{num_states = 2}
	getarraysize <part_materials>
	material_index = (<material_index> + 1)
	if (<material_index> < <array_size>)
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
	requireparams \{[
			part
		]
		all}
	getcasappearancepart part = <part>
	removeparameter \{chosen_materials}
	setcasappearancepartinstance part = <part> part_instance = {<...>}
	updatecurrentcasmodel \{buildscript = color_model_from_appearance}
	generic_event_back
endscript

script color_edit_restore_previous 
	restoretoptemporarycasappearance \{update_color}
	generic_event_back
endscript
