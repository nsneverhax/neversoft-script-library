
script ui_create_cap_shape_edit 
	RequireParams \{[
			part
			sections
			section_index
			mask_index
			cap_index
			layer_index
			mask
		]
		all}
	if NOT checksumequals a = <part> b = cas_band_logo
		show_history = {show_history}
	endif
	make_generic_car_menu {
		vmenu_id = create_cap_shape_edit_vmenu
		pad_back_script = ui_event
		pad_back_params = {event = menu_back data = {state = uistate_cap_layers_list}}
		title = qs(0xeeb7a804)
		exclusive_device = <state_device>
		<show_history>
	}
	if checksumequals a = <part> b = cas_band_logo
		no_cas_handlers = {no_cas_handlers}
	endif
	edit_cas_layer part = <part> mask = <mask> layer_index = <layer_index> cap_index = <cap_index> section = (<sections> [<section_index>]) vmenu_id = create_cap_shape_edit_vmenu no_cas_handlers = <no_cas_handlers> camera_list = <camera_list> zoom_camera = <zoom_camera>
	add_car_menu_icon_item {
		icon = widget_delete
		text = qs(0x5bbcb1d5)
		choose_state = uistate_generic_dialog_box
		choose_state_data = {
			is_popup
			player_device = <state_device>
			heading_text = qs(0x2f8ef7b1)
			body_text = qs(0xfc156a94)
			confirm_func = ui_delete_layer
			confirm_func_params = {part = <part> cap_index = <cap_index> layer_index = <layer_index>}
			highlight_no
		}
	}
	if checksumequals a = <part> b = cas_band_logo
		menu_finish car_helper_text no_rotate_zoom_text controller = <state_device>
	else
		setup_cas_menu_handlers vmenu_id = create_cap_shape_edit_vmenu camera_list = <camera_list> zoom_camera = <zoom_camera> find_correct_camera = <override_base_name>
		menu_finish car_helper_text controller = <state_device>
		if ScreenElementExists \{id = color_wheel_menu_item}
			setup_cas_menu_handlers vmenu_id = color_wheel_menu_item camera_list = <camera_list> zoom_camera = <zoom_camera> find_correct_camera = <override_base_name>
		endif
	endif
endscript

script ui_destroy_cap_shape_edit 
	destroy_generic_menu
endscript

script ui_return_cap_shape_edit 
	if checksumequals a = <part> b = cas_band_logo
		menu_finish car_helper_text no_rotate_zoom_text controller = <state_device>
	else
		setup_cas_menu_handlers vmenu_id = create_cap_shape_edit_vmenu camera_list = <camera_list> zoom_camera = <zoom_camera>
		menu_finish car_helper_text controller = <state_device>
		if ScreenElementExists \{id = color_wheel_menu_item}
			setup_cas_menu_handlers vmenu_id = color_wheel_menu_item camera_list = <camera_list> zoom_camera = <zoom_camera>
		endif
	endif
endscript

script cap_new_shape 
	destroy_generic_menu
	delete_layer part = <part> cap_index = <cap_index> layer_index = <layer_index> state = uistate_cap_layers_list
	ui_event_wait \{event = menu_back
		data = {
			state = uistate_cap_layers_list
			new_layer_selected = true
		}}
endscript

script ui_delete_layer 
	destroy_generic_menu
	delete_layer part = <part> cap_index = <cap_index> layer_index = <layer_index>
	ui_event_wait \{event = menu_back
		data = {
			state = uistate_cap_layers_list
		}}
endscript
