
script ui_create_cap_color_wheel 
	requireparams \{[
			part
			cap_index
			layer_index
		]
		all}
	ui_event_add_params \{hist_tex = menu_history_color_edit}
	make_generic_menu \{vmenu_id = create_cap_color_wheel_vmenu
		title = qs(0x009c1da1)
		show_history}
	cap_current_colors part = <part> cap_index = <cap_index> layer_index = <layer_index>
	colorwheel_add_item {
		scale = 0.6
		pad_choose_script = generic_event_back
		increment_focus_script = cap_color_wheel_focus_change_color
		increment_focus_params = {part = <part> cap_index = <cap_index> layer_index = <layer_index>}
		lookup_table = <color_wheel>
		initial_rgb = <rgb>
		special_exit_script = restore_color_initial_exit
		special_exit_params = {add_script = cap_color_wheel_focus_change_color add_params = {part = <part> cap_index = <cap_index> layer_index = <layer_index> color = <rgb>}}
		special_choose_script = widget_init_cap
		special_choose_params = {part = <part>}
	}
	if checksumequals a = <part> b = cas_band_logo
		menu_finish \{car_helper_text
			no_rotate_zoom_text}
	else
		setup_cas_menu_handlers vmenu_id = create_cap_color_wheel_vmenu camera_list = <camera_list> zoom_camera = <zoom_camera>
		menu_finish \{car_helper_text}
	endif
	launchevent \{type = focus
		target = create_cap_color_wheel_vmenu
		data = {
			child_index = 0
		}}
	launchevent \{type = pad_choose}
endscript

script ui_destroy_cap_color_wheel 
	destroy_generic_menu
endscript

script restore_color_initial_exit 
	restore_color_initial <...>
	generic_event_back
endscript

script cap_current_colors 
	requireparams \{[
			part
			cap_index
			layer_index
		]
		all}
	getlayer part = <part> cap_index = <cap_index> layer_index = <layer_index>
	if structurecontains structure = <layer> color
		color = (<layer>.color)
		lookup = ($color_lookup_table.<color>)
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
				return rgb = <rgb>
			endif
		else
			printstruct <...>
		endif
	endif
endscript
