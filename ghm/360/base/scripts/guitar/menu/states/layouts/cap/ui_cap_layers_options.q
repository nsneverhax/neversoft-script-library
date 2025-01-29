ui_layers_options_hide_highlight = 0

script ui_create_cap_layers_options 
	if ScreenElementExists \{id = generic_menu}
		generic_menu :se_setprops \{highlight_bars_alpha = 0}
	endif
	Change \{ui_layers_options_hide_highlight = 0}
	make_layers_options_menu
	if layers_options_menu :desc_resolvealias \{Name = alias_layer_options_vmenu}
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
		}
		layers_options_menu :obj_spawnscript \{highlight_motion
			params = {
				menu_id = layers_options_menu
			}}
	endif
	menu_finish \{car_helper_text
		no_rotate_zoom_text}
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{Type = unfocus
			target = current_menu}
	endif
	LaunchEvent \{Type = focus
		target = layers_options_vmenu}
endscript

script ui_destroy_cap_layers_options 
	if NOT ($ui_layers_options_hide_highlight)
		if ScreenElementExists \{id = generic_menu}
			generic_menu :se_setprops \{highlight_bars_alpha = 1}
		endif
	endif
	destroy_layers_options_menu
endscript

script layers_options_re_order 
	Change \{ui_layers_options_hide_highlight = 1}
	ui_event_block event = menu_back data = {re_order_params = {<...>}}
endscript

script layers_options_copy 
	Change \{ui_layers_options_hide_highlight = 1}
	getlayer <...>
	ui_event_block event = menu_back data = {copy_params = {<...> layer = <layer>}}
endscript

script make_layers_options_menu {
		pad_back_sound = ui_menu_select_sfx
		pad_back_script = generic_event_back
		exclusive_device = ($primary_controller)
	}
	destroy_layers_options_menu
	if GotParam \{use_all_controllers}
		RemoveParameter \{exclusive_device}
		get_all_exclusive_devices
	endif
	if NOT (($menu_over_ride_exclusive_device) = -1)
		exclusive_device = ($menu_over_ride_exclusive_device)
	endif
	if ScreenElementExists \{id = current_menu_anchor}
		DestroyScreenElement \{id = current_menu_anchor}
	endif
	CreateScreenElement {
		Type = descinterface
		parent = root_window
		desc = 'layer_options_menu'
		id = layers_options_menu
		exclusive_device = <exclusive_device>
		z_priority = -10
	}
	if <id> :desc_resolvealias Name = alias_layer_options_vmenu param = generic_smenu
		AssignAlias id = <generic_smenu> alias = layers_options_vmenu
	else
		ScriptAssert \{qs(0x5279a4a1)}
	endif
	SetScreenElementProps \{id = layers_options_vmenu
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
	if GotParam \{pad_down_script}
		SetScreenElementProps {
			id = layers_options_vmenu
			event_handlers = [
				{pad_down <pad_down_script> params = <pad_down_params>}
			]
		}
	endif
	if GotParam \{pad_up_script}
		SetScreenElementProps {
			id = layers_options_vmenu
			event_handlers = [
				{pad_up <pad_up_script> params = <pad_up_params>}
			]
		}
	endif
	if GotParam \{pad_back_script}
		SetScreenElementProps {
			id = layers_options_vmenu
			event_handlers = [
				{pad_back <pad_back_sound>}
				{pad_back generic_blocking_execute_script params = {pad_script = animate_out_layers_options_menu pad_params = {pad_script = <pad_back_script> pad_params = <pad_back_params>}}}
			]
			replace_handlers
		}
	endif
	animate_in_layers_options_menu
	return container_id = <id>
endscript

script destroy_layers_options_menu 
	if ScreenElementExists \{id = layers_options_menu}
		DestroyScreenElement \{id = layers_options_menu}
	endif
	cleanup_cas_menu_handlers
	clean_up_user_control_helpers
endscript

script animate_in_layers_options_menu 
	if ScreenElementExists \{id = layers_options_menu}
		SetScreenElementProps \{id = layers_options_menu
			Pos = {
				relative
				(-110.0, 0.0)
			}}
		SetScreenElementProps \{id = layers_options_menu
			Pos = {
				relative
				(220.0, 0.0)
			}
			time = 0.1}
	endif
endscript

script animate_out_layers_options_menu 
	if ScreenElementExists \{id = layers_options_menu}
		layers_options_menu :se_setprops \{block_events}
		SetScreenElementProps \{id = layers_options_menu
			Pos = {
				relative
				(-250.0, 0.0)
			}
			time = 0.1}
		Wait \{0.120000005
			Seconds}
	endif
	if (<pad_script> = generic_event_replace)
		menu_start_transition
	endif
	<pad_script> <pad_params>
endscript

script ui_layers_options_focus 
	Obj_GetID
	GetTags
	if layers_options_menu :desc_resolvealias \{Name = alias_highlight}
		Wait \{2
			gameframe}
		GetScreenElementDims id = <objID>
		Scale = (((1.0, 0.0) * (((<width> + 50.0) / 256.0))) + (0.0, 1.3))
		GetScreenElementPosition id = <objID> summed
		<resolved_id> :se_setprops Pos = {absolute <screenelementpos>} Scale = <Scale>
		<resolved_id> :se_waitprops
		GetScreenElementPosition id = <objID> summed
		<resolved_id> :se_setprops Pos = {absolute (<screenelementpos> + (0.0, -10.0))} time = 0.05
		<resolved_id> :se_waitprops
		GetScreenElementPosition id = <objID> summed
		<resolved_id> :se_setprops Pos = {absolute <screenelementpos>} Scale = <Scale> time = 0.05
		<resolved_id> :se_waitprops
	endif
endscript

script ui_layers_options_unfocus 
endscript
