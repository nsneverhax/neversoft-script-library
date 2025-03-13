
script ui_create_cap_layers_options 
	make_layers_options_menu
	add_generic_menu_text_item {
		parent = layers_options_vmenu
		text = qs(0x65b8a528)
		pad_choose_script = generic_event_replace
		pad_choose_params = {data = {state = uistate_cap_shape_edit part = <part> sections = <sections> section_index = <section_index> mask_index = <mask_index> cap_index = <cap_index> layer_index = <layer_index> mask = <mask> camera_list = <camera_list> zoom_camera = <zoom_camera> override_base_name = <cam_name>}}
		do_not_scroll = 1
	}
	if is_cap_layers_full part = <part> div_id = <div_id>
		focusable = {not_focusable}
	endif
	add_generic_menu_text_item {
		parent = layers_options_vmenu
		text = qs(0x51af3a34)
		pad_choose_script = layers_options_copy
		pad_choose_params = {part = <part> cap_index = <cap_index> layer_index = <layer_index>}
		<focusable>
		do_not_scroll = 1
	}
	add_generic_menu_text_item {
		parent = layers_options_vmenu
		text = qs(0xd10df936)
		pad_choose_script = layers_options_re_order
		pad_choose_params = {part = <part> cap_index = <cap_index> layer_current_index = <layer_index>}
		do_not_scroll = 1
	}
	add_generic_menu_text_item {
		parent = layers_options_vmenu
		text = qs(0xa32bf91f)
		pad_choose_script = ui_delete_layer
		pad_choose_params = {part = <part> cap_index = <cap_index> layer_index = <layer_index>}
		do_not_scroll = 1
	}
	menu_finish \{car_helper_text
		no_rotate_zoom_text}
	if screenelementexists \{id = current_menu}
		launchevent \{type = unfocus
			target = current_menu}
	endif
	launchevent \{type = focus
		target = layers_options_vmenu}
endscript

script ui_destroy_cap_layers_options 
	destroy_layers_options_menu
endscript

script layers_options_re_order 
	ui_event_block event = menu_back data = {re_order_params = {<...>}}
endscript

script layers_options_copy 
	getlayer <...>
	ui_event_block event = menu_back data = {copy_params = {<...> layer = <layer>}}
endscript

script make_layers_options_menu {
		pad_back_sound = ui_menu_select_sfx
		pad_back_script = generic_event_back
		exclusive_device = ($primary_controller)
	}
	destroy_layers_options_menu
	if gotparam \{use_all_controllers}
		removeparameter \{exclusive_device}
		get_all_exclusive_devices
	endif
	if NOT (($menu_over_ride_exclusive_device) = -1)
		exclusive_device = ($menu_over_ride_exclusive_device)
	endif
	if screenelementexists \{id = current_menu_anchor}
		destroyscreenelement \{id = current_menu_anchor}
	endif
	createscreenelement {
		type = descinterface
		parent = root_window
		desc = 'layer_options_menu'
		id = layers_options_menu
		exclusive_device = <exclusive_device>
		z_priority = -10
	}
	if <id> :desc_resolvealias name = alias_layer_options_vmenu param = generic_smenu
		assignalias id = <generic_smenu> alias = layers_options_vmenu
	else
		scriptassert \{qs(0x5279a4a1)}
	endif
	setscreenelementprops \{id = layers_options_vmenu
		event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up = 1
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down = 2
				}
			}
		]}
	if gotparam \{pad_down_script}
		setscreenelementprops {
			id = layers_options_vmenu
			event_handlers = [
				{pad_down <pad_down_script> params = <pad_down_params>}
			]
		}
	endif
	if gotparam \{pad_up_script}
		setscreenelementprops {
			id = layers_options_vmenu
			event_handlers = [
				{pad_up <pad_up_script> params = <pad_up_params>}
			]
		}
	endif
	if gotparam \{pad_back_script}
		setscreenelementprops {
			id = layers_options_vmenu
			event_handlers = [
				{pad_back <pad_back_sound>}
				{pad_back generic_blocking_execute_script params = {pad_script = <pad_back_script> pad_params = <pad_back_params>}}
			]
			replace_handlers
		}
	endif
	animate_in_layers_options_menu
endscript

script destroy_layers_options_menu 
	if screenelementexists \{id = layers_options_menu}
		destroyscreenelement \{id = layers_options_menu}
	endif
	cleanup_cas_menu_handlers
	clean_up_user_control_helpers
endscript

script animate_in_layers_options_menu 
	if screenelementexists \{id = layers_options_menu}
		setscreenelementprops \{id = layers_options_menu
			pos = {
				relative
				(-120.0, 0.0)
			}}
		setscreenelementprops \{id = layers_options_menu
			pos = {
				relative
				(120.0, 0.0)
			}
			time = 0.1}
	endif
endscript
