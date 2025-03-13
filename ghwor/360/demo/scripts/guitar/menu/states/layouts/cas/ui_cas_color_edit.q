
script ui_create_cas_color_edit \{title = qs(0xc420923e)}
	ui_event_add_params hist_tex = <hist_tex>
	resolvebodyspecificpartinappearance part = <part>
	getarraysize <part_materials>
	if (<array_size> = 0)
		scriptassert \{'No part_materials!'}
	endif
	if NOT gotparam \{material_index}
		material_index = 0
	endif
	color_edit_get_current_colors part = <part> part_material = ((<part_materials> [<material_index>]).desc_id)
	make_generic_car_menu {
		vmenu_id = create_cas_color_edit_vmenu
		title = <title>
		num_icons = <num_icons>
		exclusive_device = <state_device>
		show_history
	}
	setup_cas_menu_handlers vmenu_id = create_cas_color_edit_vmenu camera_list = <camera_list> zoom_camera = <zoom_camera>
	if gotparam \{cam_name}
		spawnscriptnow task_menu_default_anim_in params = {base_name = <cam_name>}
	endif
	colorwheel_add_item {
		scale = 0.6
		pad_choose_script = color_edit_exit_accept
		pad_choose_params = {num_states = <num_states> material_index = <material_index> part = <part> part_materials = <part_materials>}
		increment_focus_script = color_edit_focus_change
		increment_focus_params = {part = <part> part_material = ((<part_materials> [<material_index>]).desc_id)}
		initial_rgb = <rgb>
		special_exit_script = color_wheel_reset_exit
		special_exit_params = {hide_parts = <hide_parts>}
		lookup_table = <color_wheel>
		camera_list = <camera_list>
		zoom_camera = <zoom_camera>
	}
	add_user_control_helper controller = <state_device> text = qs(0xc18d5e76) button = green z = 100000
	add_user_control_helper controller = <state_device> text = qs(0xf7723015) button = red z = 100000
	menu_finish car_rotate_zoom controller = <state_device>
	spawnscriptlater \{choose_color_wheel}
	if screenelementexists \{id = color_wheel_menu_item}
		setup_cas_menu_handlers vmenu_id = color_wheel_menu_item no_zoom = <no_zoom> camera_list = <camera_list> zoom_camera = <zoom_camera>
	endif
endscript

script choose_color_wheel 
	launchevent \{type = pad_choose}
endscript

script ui_return_cas_color_edit 
	menu_finish car_helper_text_extra controller = <state_device>
endscript

script ui_destroy_cas_color_edit 
	destroy_generic_menu
endscript

script ui_init_cas_color_edit 
	ui_event_add_params \{hist_tex = menu_history_color_edit}
	pushtemporarycasappearance
	color_edit_hide_parts_enter hide_parts = <hide_parts>
	if gotparam \{stance}
		if getcurrentcasobject
			bandmanager_changestance name = <cas_object> stance = <stance> no_wait
		endif
	endif
endscript

script ui_deinit_cas_color_edit 
	color_edit_hide_parts_exit hide_parts = <hide_parts>
	poptemporarycasappearance
	if NOT gotparam \{skip_deinit_script}
		if gotparam \{additional_deinit_script}
			<additional_deinit_script>
		endif
		if getcurrentcasobject
			if gotparam \{return_stance}
				bandmanager_changestance name = <cas_object> stance = <return_stance> no_wait
			else
				bandmanager_changestance name = <cas_object> stance = stance_frontend no_wait
			endif
		endif
	endif
endscript

script color_edit_focus_change 
	setcasappearancematerial part = <part> material = <part_material> value = <color>
	if ((<part> = cas_female_hair) || (<part> = cas_male_hair))
		if getcasappearancepartdescid part = <part>
			cas_propogate_hair_color
		endif
	endif
	cas_propogate_guitar_color_to part = <part>
	updatecurrentcasmodel \{buildscript = modelbuilder_update_colors}
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
		generic_event_back nosound data = {num_states = <num_states>}
	endif
endscript

script color_edit_restore_default_on_part 
	requireparams \{[
			part
		]
		all}
	resolvebodyspecificpartinappearance part = <part>
	if getcasappearancepartinstance part = <part>
		if gotparam \{part_material}
			if structurecontains structure = <part_instance> chosen_materials
				if structurecontains structure = (<part_instance>.chosen_materials) <part_material>
					chosen_materials = (<part_instance>.chosen_materials)
					removecomponent name = <part_material> structure_name = chosen_materials
					if comparestructs struct1 = <chosen_materials> struct2 = {}
						removecomponent \{name = chosen_materials
							structure_name = part_instance}
					else
						part_instance = {<part_instance> chosen_materials = <chosen_materials>}
					endif
				endif
				setcasappearancepartinstance part = <part> part_instance = <part_instance>
			endif
		else
			removecomponent \{structure_name = part_instance
				name = chosen_materials}
			setcasappearancepartinstance part = <part> part_instance = <part_instance>
		endif
	endif
endscript

script color_edit_restore_default 
	requireparams \{[
			part
		]
		all}
	ui_sfx \{menustate = car
		uitype = select}
	color_edit_restore_default_on_part part = <part> part_material = <part_material>
	if checksumequals a = <part> b = cas_male_hair
		color_edit_restore_default_on_part part = cas_male_hat_hair part_material = <part_material>
	endif
	if checksumequals a = <part> b = cas_female_hair
		color_edit_restore_default_on_part part = cas_female_hat_hair part_material = <part_material>
	endif
	updatecurrentcasmodel \{buildscript = modelbuilder_update_colors}
	generic_event_back
endscript

script color_edit_restore_previous 
	color_edit_hide_parts_exit hide_parts = <hide_parts>
	restoretoptemporarycasappearance \{update_color}
	generic_event_back
endscript

script color_wheel_reset_exit 
	color_wheel_reset
	generic_event_back
endscript

script color_edit_hide_parts_enter 
	if gotparam \{hide_parts}
		getarraysize <hide_parts>
		i = 0
		if (<array_size> > 0)
			begin
			setcasappearancepartinstance part = (<hide_parts> [<i>]) part_instance = {desc_id = none}
			i = (<i> + 1)
			repeat <array_size>
			rebuildcurrentcasmodel
		endif
	endif
endscript

script color_edit_hide_parts_exit 
	if gotparam \{hide_parts}
		if NOT is_accepting_invite_or_sigining_out
			mergepartintotemporarycasappearance \{part_list = [
					cas_body
				]}
		endif
	endif
endscript
