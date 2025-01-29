
script ui_init_cas_select_part_swatches 
	RequireParams \{[
			part
		]
		all}
	ui_cas_precache part = <part>
	if GotParam \{additional_init_script}
		<additional_init_script>
	endif
	if GotParam \{bonemenu_popup}
		cas_bonemenu_exit part = <bonemenu_popup>
	endif
	pushtemporarycasappearance
endscript

script ui_create_cas_select_part_swatches 
	ui_event_add_params hist_tex = <hist_tex>
	printstruct <...>
	make_generic_car_menu {
		vmenu_id = create_cas_swatch_select_vmenu
		title = qs(0x5860135a)
		num_icons = <num_icons>
		show_history
		exclusive_device = <state_device>
	}
	setup_cas_menu_handlers vmenu_id = create_cas_swatch_select_vmenu camera_list = <camera_list> zoom_camera = <zoom_camera>
	if GotParam \{cam_name}
		SpawnScriptNow task_menu_default_anim_in params = {base_name = <cam_name>}
	endif
	resolvebodyspecificpartinappearance part = <part>
	GetArraySize <part_swatches>
	if (<array_Size> = 0)
		ScriptAssert \{'No part_swatches!'}
	endif
	create_swatch_wheel {
		Scale = 20
		pad_choose_script = select_part_swatches_exit_accept
		pad_choose_params = {
			part = <part>
			part_swatches = <part_swatches>
		}
		part = <part>
		part_swatches = <part_swatches>
		frontend_desc = <frontend_desc>
		current_swatch_desc_id = <current_swatch_desc_id>
		camera_list = <camera_list>
		zoom_camera = <zoom_camera>
		special_exit_script = select_part_swatches_restore_previous
	}
	swatch_area_desc_id :Obj_SpawnScriptNow load_swatch_textures params = {
		part = <part>
		part_swatches = <part_swatches>
	}
	menu_finish car_helper_text controller = <state_device>
	LaunchEvent \{Type = focus
		target = create_cas_swatch_select_vmenu
		data = {
			child_index = 0
		}}
	LaunchEvent \{Type = pad_choose}
endscript

script ui_destroy_cas_select_part_swatches 
	if ScreenElementExists \{id = swatch_wheel_menu_item}
		swatch_area_desc_id :Obj_KillSpawnedScript \{Name = load_swatch_textures}
	endif
	destroy_generic_menu
	load_swatch_textures_cleanup
endscript

script ui_deinit_cas_select_part_swatches 
	flushallcompositetexturesfromui
	poptemporarycasappearance
	if NOT GotParam \{skip_deinit_script}
		if GotParam \{additional_deinit_script}
			<additional_deinit_script>
		endif
		if getcurrentcasobject
			if GotParam \{return_stance}
				bandmanager_changestance Name = <cas_object> stance = <return_stance> no_wait
			else
				bandmanager_changestance Name = <cas_object> stance = stance_frontend no_wait
			endif
		endif
	else
		ui_event_remove_params \{param = skip_deinit_script}
	endif
	cleanup_cas_menu_handlers
	if GotParam \{bonemenu_popup}
		cas_bonemenu_begin part = <bonemenu_popup>
	endif
endscript

script select_part_swatches_restore_previous 
	restoretoptemporarycasappearance
	generic_event_back
endscript

script select_part_swatches_exit_accept 
	ui_sfx \{menustate = car
		uitype = select}
	generic_event_back
endscript
