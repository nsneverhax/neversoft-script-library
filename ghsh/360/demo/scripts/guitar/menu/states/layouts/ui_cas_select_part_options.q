
script ui_create_cas_select_part_options 
	spawnscriptnow ui_create_cas_select_part_options_worker params = {<...>}
endscript

script ui_create_cas_select_part_options_worker \{num_states = 2}
	make_generic_menu {
		vmenu_id = create_cas_select_part_options_vmenu
		title = qs(0xebc3fb3a)
		pad_back_script = ui_event
		pad_back_params = {event = menu_back data = {num_states = <num_states>}}
		show_history
		num_icons = <num_icons>
	}
	setup_cas_menu_handlers vmenu_id = create_cas_select_part_options_vmenu camera_list = <camera_list> zoom_camera = <zoom_camera>
	if getcaspartmaterials part = <part>
		add_generic_menu_icon_item {
			text = qs(0xaa2546c1)
			icon = widget_colorwheel
			choose_state = uistate_cas_color_edit
			choose_state_data = {part = <part> part_materials = <part_materials> num_states = 1 hist_tex = widget_colorwheel camera_list = <camera_list> zoom_camera = <zoom_camera>}
		}
	endif
	design_edit = 1
	if gotparam \{logo_edit}
		<design_edit> = <logo_edit>
	endif
	if (<design_edit> = 1)
		add_generic_menu_icon_item {
			text = qs(0xf68a7704)
			icon = icon_graphics
			choose_state = uistate_cap_main
			choose_state_data = {savegame = ($cas_current_savegame) part = <part> text = qs(0x541bd475) hist_tex = icon_graphics camera_list = <camera_list> zoom_camera = <zoom_camera>}
			text_dims = (260.0, 45.0)
		}
	endif
	if gotparam \{cam_name}
		change \{generic_menu_block_input = 1}
		task_menu_default_anim_in base_name = <cam_name>
		change \{generic_menu_block_input = 0}
	endif
	menu_finish \{car_helper_text}
endscript

script ui_destroy_cas_select_part_options 
	destroy_generic_menu
endscript

script ui_deinit_cas_select_part_options 
	if gotparam \{additional_deinit_script}
		<additional_deinit_script>
	endif
endscript
