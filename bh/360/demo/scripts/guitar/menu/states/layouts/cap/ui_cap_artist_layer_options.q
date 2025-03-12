
script ui_create_cap_artist_layer_options \{back_steps = 2
		text = qs(0x65b8a528)}
	requireparams \{[
			part
			section
			mask_index
		]
		all}
	make_generic_car_menu {
		vmenu_id = create_cap_artist_layer_options_vmenu
		pad_back_script = ui_event
		pad_back_params = {event = menu_back data = {num_states = <back_steps>}}
		title = <text>
		show_history
		num_icons = <num_icons>
		exclusive_device = <state_device>
	}
	setup_cas_menu_handlers vmenu_id = create_cap_artist_layer_options_vmenu camera_list = <camera_list> zoom_camera = <zoom_camera> no_rotate = <no_rotate> no_zoom = <no_zoom>
	cap_artist_layer_edit part = <part> section = <section> mask_index = <mask_index> vmenu_id = create_cap_artist_layer_options_vmenu color_wheel = <color_wheel> camera_list = <camera_list> zoom_camera = <zoom_camera> no_rotate = <no_rotate> no_zoom = <no_zoom>
	menu_finish car_helper_text_back controller = <state_device>
	if screenelementexists \{id = color_wheel_menu_item}
		setup_cas_menu_handlers vmenu_id = color_wheel_menu_item camera_list = <camera_list> zoom_camera = <zoom_camera> no_rotate = <no_rotate> no_zoom = <no_zoom>
	endif
endscript

script ui_return_cap_artist_layer_options 
	menu_finish car_helper_text_extra controller = <state_device>
endscript

script ui_destroy_cap_artist_layer_options 
	destroy_generic_menu
endscript

script ui_init_cap_artist_layer_options 
	if gotparam \{additional_init_script}
	endif
endscript

script ui_deinit_cap_artist_layer_options \{back_steps = 2}
	if (<back_steps> > 1)
		flushallcompositetexturesfromui
	endif
	ui_event_get_stack
	i = 0
	begin
	if ((<stack> [<i>].base_name) = 'cap_artist_layer')
		from_artist_layer = true
	endif
	i = (<i> + 1)
	repeat <stack_size>
	if NOT gotparam \{from_artist_layer}
		flushallcompositetexturesfromui
	endif
	if gotparam \{additional_deinit_script}
		<additional_deinit_script>
	endif
	poptemporarycasappearance
endscript

script exit_artist_layer_options 
	ui_event event = menu_back data = {num_states = <back_steps>}
endscript

script exit_artist_layer_options_discard 
	killallcompositetextures
	discard_changes_prompt
endscript
