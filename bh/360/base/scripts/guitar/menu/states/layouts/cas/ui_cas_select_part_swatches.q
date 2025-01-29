
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
	PushTemporaryCASAppearance
endscript

script ui_create_cas_select_part_swatches 
	ui_event_add_params hist_tex = <hist_tex>
	printstruct <...>
	make_generic_car_menu {
		vmenu_id = create_cas_swatch_select_vmenu
		Title = qs(0x5860135a)
		num_icons = <num_icons>
		show_history
		exclusive_device = <state_device>
	}
	setup_cas_menu_handlers vmenu_id = create_cas_swatch_select_vmenu camera_list = <camera_list> zoom_camera = <zoom_camera>
	if GotParam \{cam_name}
		spawnscriptnow task_menu_default_anim_in params = {base_name = <cam_name>}
	endif
	ResolveBodySpecificPartInAppearance part = <part>
	GetArraySize <part_swatches>
	if (<array_size> = 0)
		ScriptAssert \{'No part_swatches!'}
	endif
	create_swatch_wheel {
		scale = 20
		pad_choose_script = select_part_swatches_exit_accept
		pad_choose_params = {
			part = <part>
			part_swatches = <part_swatches>
		}
		part = <part>
		part_swatches = <part_swatches>
		frontend_desc = <frontend_desc>
		current_swatch_desc_id = <current_swatch_desc_id>
		special_exit_script = select_part_swatches_restore_previous
	}
	swatch_area_desc_id :Obj_SpawnScriptNow load_swatch_textures params = {
		part = <part>
		part_swatches = <part_swatches>
	}
	add_user_control_helper controller = <state_device> text = qs(0xc18d5e76) button = green z = 100000
	add_user_control_helper controller = <state_device> text = qs(0xf7723015) button = red z = 100000
	if ((isguitarcontroller controller = <state_device>) || (isdrumcontroller controller = <state_device>))
		add_user_control_helper controller = <state_device> text = qs(0xe7d2a66e) button = blue z = 100000
		add_user_control_helper controller = <state_device> text = qs(0x26950e02) button = orange z = 100000
	else
		add_user_control_helper controller = <state_device> text = qs(0xe7d2a66e) button = LBRB z = 100000
		add_user_control_helper controller = <state_device> text = qs(0x26950e02) button = RT z = 100000
	endif
	LaunchEvent \{type = focus
		target = create_cas_swatch_select_vmenu
		data = {
			child_index = 0
		}}
	LaunchEvent \{type = pad_choose}
	if ScreenElementExists \{id = swatch_wheel_menu_item}
		setup_cas_menu_handlers vmenu_id = swatch_wheel_menu_item no_zoom = <no_zoom> camera_list = <camera_list> zoom_camera = <zoom_camera>
	endif
endscript

script ui_destroy_cas_select_part_swatches 
	if ScreenElementExists \{id = swatch_wheel_menu_item}
		swatch_area_desc_id :Obj_KillSpawnedScript \{name = load_swatch_textures}
	endif
	destroy_generic_menu
	load_swatch_textures_cleanup
endscript

script ui_deinit_cas_select_part_swatches 
	FlushAllCompositeTexturesFromUI
	PopTemporaryCASAppearance
	if NOT GotParam \{skip_deinit_script}
		if GotParam \{additional_deinit_script}
			<additional_deinit_script>
		endif
		if GetCurrentCASObject
			if GotParam \{return_stance}
				bandmanager_changestance name = <cas_object> stance = <return_stance> no_wait
			else
				bandmanager_changestance name = <cas_object> stance = Stance_FrontEnd no_wait
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
	RestoreTopTemporaryCASAppearance
	generic_event_back
endscript

script select_part_swatches_exit_accept 
	generic_event_back
endscript
