ui_layers_options_hide_highlight = 0

script ui_create_cap_layers_options 
	if screenelementexists \{id = generic_menu}
		generic_menu :se_setprops \{highlight_bars_alpha = 0}
	endif
	change \{ui_layers_options_hide_highlight = 0}
	make_layers_options_menu
	if layers_options_menu :desc_resolvealias \{name = alias_layer_options_vmenu}
		add_menu_frontend_item {
			parent = layers_options_vmenu
			text = qs(0x65b8a528)
			pad_choose_script = animate_out_layers_options_menu
			pad_choose_params = {
				pad_script = generic_event_replace
				pad_params = {data = {state = uistate_cap_shape_edit part = <part> sections = <sections> section_index = <section_index> mask_index = <mask_index> cap_index = <cap_index> layer_index = <layer_index> mask = <mask> camera_list = <camera_list> zoom_camera = <zoom_camera> override_base_name = <cam_name>}}
			}
			focus_script = ui_layers_options_focus
			unfocus_script = ui_layers_options_unfocus
			item_height = 50
		}
		add_menu_frontend_item {
			parent = <resolved_id>
			text = qs(0x51af3a34)
			pad_choose_script = animate_out_layers_options_menu
			pad_choose_params = {
				pad_script = layers_options_copy
				pad_params = {part = <part> cap_index = <cap_index> layer_index = <layer_index>}
			}
			focus_script = ui_layers_options_focus
			unfocus_script = ui_layers_options_unfocus
			item_height = 50
		}
		if is_cap_layers_full part = <part> div_id = <div_id>
			<item_id> :se_setprops not_focusable rgba = [110 100 90 175]
		endif
		add_menu_frontend_item {
			parent = <resolved_id>
			text = qs(0xd10df936)
			pad_choose_script = animate_out_layers_options_menu
			pad_choose_params = {
				pad_script = layers_options_re_order
				pad_params = {part = <part> cap_index = <cap_index> layer_current_index = <layer_index>}
			}
			focus_script = ui_layers_options_focus
			unfocus_script = ui_layers_options_unfocus
			item_height = 50
		}
		add_menu_frontend_item {
			parent = <resolved_id>
			text = qs(0xa32bf91f)
			pad_choose_script = animate_out_layers_options_menu
			pad_choose_params = {
				pad_script = ui_delete_layer
				pad_params = {part = <part> cap_index = <cap_index> layer_index = <layer_index>}
			}
			focus_script = ui_layers_options_focus
			unfocus_script = ui_layers_options_unfocus
			item_height = 50
		}
		layers_options_menu :obj_spawnscript \{highlight_motion
			params = {
				menu_id = layers_options_menu
			}}
	endif
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
	if NOT ($ui_layers_options_hide_highlight)
		if screenelementexists \{id = generic_menu}
			generic_menu :se_setprops \{highlight_bars_alpha = 1}
		endif
	endif
	destroy_layers_options_menu
endscript

script layers_options_re_order 
	change \{ui_layers_options_hide_highlight = 1}
	ui_event_block event = menu_back data = {re_order_params = {<...>}}
endscript

script layers_options_copy 
	change \{ui_layers_options_hide_highlight = 1}
	getlayer <...>
	ui_event_block event = menu_back data = {copy_params = {<...> layer = <layer>}}
endscript

script make_layers_options_menu {
		pad_back_sound = generic_menu_pad_back_sound
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
	bx_createhighlightstars \{parent = layers_options_menu
		focuswaittime = 9}
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
				{pad_back generic_blocking_execute_script params = {pad_script = animate_out_layers_options_menu pad_params = {pad_script = <pad_back_script> pad_params = {<pad_back_params> nosound}}}}
			]
			replace_handlers
		}
	endif
	animate_in_layers_options_menu
	return container_id = <id>
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
				(-110.0, 0.0)
			}}
		generic_menu :se_getprops
		if (<generic_menu_scrollbar_alpha> > 0.9)
			<pos> = (276.0, 0.0)
		else
			<pos> = (220.0, 0.0)
		endif
		setscreenelementprops {
			id = layers_options_menu
			pos = {relative <pos>}
			time = 0.1
		}
	endif
endscript

script animate_out_layers_options_menu 
	highlightstars :se_setprops \{alpha = 0}
	if screenelementexists \{id = layers_options_menu}
		layers_options_menu :se_setprops \{block_events}
		setscreenelementprops \{id = layers_options_menu
			pos = {
				relative
				(-350.0, 0.0)
			}
			time = 0.1}
		wait \{0.120000005
			seconds}
	endif
	if (<pad_script> = generic_event_replace)
		menu_start_transition
	endif
	<pad_script> <pad_params> no_sound
endscript

script ui_layers_options_focus 
	obj_getid
	gettags
	se_setprops rgba = (($g_menu_colors).menu_title)
	bx_focushighlightstarson objid = <objid>
endscript

script ui_layers_options_unfocus 
	se_setprops rgba = (($g_menu_colors).menu_gold)
endscript
