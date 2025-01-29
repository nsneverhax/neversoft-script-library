
script ui_create_cap_layers_options 
	make_layers_options_menu exclusive_device = <state_device>
	add_car_layer_options_menu_text_item {
		parent = layers_options_vmenu
		text = qs(0x65b8a528)
		pad_choose_script = generic_event_replace
		pad_choose_params = {data = {state = uistate_cap_shape_edit part = <part> sections = <sections> section_index = <section_index> mask_index = <mask_index> cap_index = <cap_index> layer_index = <layer_index> mask = <mask> camera_list = <camera_list> zoom_camera = <zoom_camera> override_base_name = <cam_name>}}
		do_not_scroll = 1
	}
	if is_cap_layers_full part = <part> div_id = <div_id>
		focusable = {not_focusable}
	endif
	add_car_layer_options_menu_text_item {
		parent = layers_options_vmenu
		text = qs(0x51af3a34)
		pad_choose_script = layers_options_copy
		pad_choose_params = {part = <part> cap_index = <cap_index> layer_index = <layer_index>}
		<focusable>
		do_not_scroll = 1
	}
	add_car_layer_options_menu_text_item {
		parent = layers_options_vmenu
		text = qs(0xd10df936)
		pad_choose_script = layers_options_re_order
		pad_choose_params = {part = <part> cap_index = <cap_index> layer_current_index = <layer_index>}
		do_not_scroll = 1
	}
	add_car_layer_options_menu_text_item {
		parent = layers_options_vmenu
		text = qs(0xa32bf91f)
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
		choose_state_event = menu_replace
		do_not_scroll = 1
		pad_select_sound_uitype = warningmessage
	}
	menu_finish car_helper_text no_rotate_zoom_text controller = <state_device>
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{Type = unfocus
			target = current_menu}
	endif
	LaunchEvent \{Type = focus
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
		pad_back_sound = ui_sfx
		pad_back_sound_menustate = car
		pad_back_sound_uitype = back
		pad_back_script = generic_event_back
		pad_back_params = nosound
		exclusive_device = ($primary_controller)
	}
	destroy_layers_options_menu
	if GotParam \{use_all_controllers}
		RemoveParameter \{exclusive_device}
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
		z_priority = 100
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
				ui_sfx
				params = {
					menustate = car
					uitype = scrollup
				}
			}
			{
				pad_down
				ui_sfx
				params = {
					menustate = car
					uitype = scrolldown
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
				{pad_back <pad_back_sound> params = {menustate = <pad_back_sound_menustate> uitype = <pad_back_sound_uitype>}}
				{pad_back generic_blocking_execute_script params = {pad_script = <pad_back_script> pad_params = <pad_back_params>}}
			]
			replace_handlers
		}
	endif
	animate_in_layers_options_menu
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
				(-120.0, 0.0)
			}}
		SetScreenElementProps \{id = layers_options_menu
			Pos = {
				relative
				(120.0, 0.0)
			}
			time = 0.1}
	endif
endscript
