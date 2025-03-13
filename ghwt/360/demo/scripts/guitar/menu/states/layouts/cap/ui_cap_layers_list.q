max_cap_layers = 40

script ui_create_cap_layers_list 
	change \{save_data_dirty = 1}
	if gotparam \{new_layer_selected}
		ui_event_remove_params \{param = new_layer_selected}
		spawnscriptnow continue_to_shape_list params = {part = <part> div_id = <div_id>}
	else
		if NOT checksumequals a = <part> b = cas_band_logo
			show_history = {show_history}
		endif
		make_generic_menu {
			vmenu_id = create_cap_layers_list_vmenu
			title = qs(0xa164fadf)
			<show_history>
		}
		if NOT is_cap_layers_full part = <part> div_id = <div_id>
			add_generic_menu_text_item {
				text = qs(0x23052bb7)
				choose_state = uistate_cap_shape_list
				choose_state_data = {part = <part> div_id = <div_id> camera_list = <camera_list> zoom_camera = <zoom_camera> override_base_name = <override_base_name>}
			}
		endif
		add_current_layers_to_menu part = <part> div_id = <div_id> copy_params = <copy_params> focus_item = <focus_item> paste_item = <paste_item> camera_list = <camera_list> zoom_camera = <zoom_camera> override_base_name = <override_base_name>
		if gotparam \{copy_params}
			add_user_control_helper \{text = qs(0x032d8a5e)
				button = green
				z = 100000}
			add_user_control_helper \{text = qs(0x3fc1c076)
				button = red
				z = 100000}
			if NOT checksumequals a = <part> b = cas_band_logo
				menu_finish \{car_rotate_zoom}
			endif
		elseif gotparam \{re_order_params}
			add_user_control_helper \{text = qs(0x3fc1c076)
				button = green
				z = 100000}
			if NOT checksumequals a = <part> b = cas_band_logo
				menu_finish \{car_rotate_zoom}
			endif
		else
			if checksumequals a = <part> b = cas_band_logo
				menu_finish \{car_helper_text
					no_rotate_zoom_text}
			else
				setup_cas_menu_handlers vmenu_id = create_cap_layers_list_vmenu camera_list = <camera_list> zoom_camera = <zoom_camera>
				menu_finish \{car_helper_text}
			endif
		endif
	endif
endscript

script focus_re_order_element 
	if screenelementexists \{id = create_cap_layers_list_vmenu}
		launchevent \{type = unfocus
			target = create_cap_layers_list_vmenu}
	else
		return
	endif
	if screenelementexists \{id = re_order_element}
		launchevent \{type = focus
			target = re_order_element}
	else
		return
	endif
endscript

script ui_destroy_cap_layers_list 
	if screenelementexists \{id = num_layers}
		destroyscreenelement \{id = num_layers}
	endif
	destroy_generic_menu
endscript

script ui_return_cap_layers_list 
	if NOT ((gotparam re_order_params) || (gotparam copy_params))
		if screenelementexists \{id = layers_list_focus}
			destroyscreenelement \{id = layers_list_focus}
		endif
	elseif gotparam \{re_order_params}
		printf \{qs(0xed8df0f0)}
		cap_re_order_layer_handler_change <re_order_params> camera_list = <camera_list> zoom_camera = <zoom_camera>
		spawnscriptlater \{focus_re_order_element}
	elseif gotparam \{copy_params}
		printf \{qs(0x76d07988)}
		cap_change_copy_handler <copy_params> div_id = <div_id> camera_list = <camera_list> zoom_camera = <zoom_camera>
		spawnscriptlater \{focus_copy_element}
	endif
	if gotparam \{copy_params}
		add_user_control_helper \{text = qs(0x032d8a5e)
			button = green
			z = 100000}
		add_user_control_helper \{text = qs(0x3fc1c076)
			button = red
			z = 100000}
		if NOT checksumequals a = <part> b = cas_band_logo
			menu_finish \{car_rotate_zoom}
		endif
	elseif gotparam \{re_order_params}
		add_user_control_helper \{text = qs(0x3fc1c076)
			button = green
			z = 100000}
		if NOT checksumequals a = <part> b = cas_band_logo
			menu_finish \{car_rotate_zoom}
		endif
	else
		if checksumequals a = <part> b = cas_band_logo
			menu_finish \{car_helper_text
				no_rotate_zoom_text}
		else
			menu_finish \{car_helper_text}
		endif
	endif
endscript

script add_current_layers_to_menu 
	requireparams \{[
			part
		]
		all}
	if NOT getcasappearancepart part = <part>
		scriptassert '%s not found' s = <part> donotresolve donotresolve
	endif
	if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
		scriptassert '%s %t not found' s = <part> t = <desc_id>
	endif
	num_layers = 0
	if gotparam \{cap}
		getarraysize (cap)
		cap_array_size = <array_size>
		if (<cap_array_size> > 0)
			i = 0
			begin
			if structurecontains structure = (<cap> [<i>]) layers
				if is_target_in_div target = (<cap> [<i>]) part = <part> div_id = <div_id>
					getarraysize (<cap> [<i>].layers)
					j = 0
					begin
					get_div_info part = <part> div_id = <div_id>
					if NOT gotparam \{target}
						printf \{qs(0x8f2a48f2)}
					endif
					if structurecontains structure = ((<cap> [<i>]).layers [<j>]) texture
						if NOT matchlayers sections = <sections> texture = ((<cap> [<i>]).layers [<j>].texture) target = <target> material = <material>
							printf qs(0x597b6b8a) t = <texture> donotresolve
						endif
					elseif structurecontains structure = ((<cap> [<i>]).layers [<j>]) font
						if NOT matchlayers font = ((<cap> [<i>]).layers [<j>].font) text = ((<cap> [<i>]).layers [<j>].text) sections = <sections> target = <target> material = <material>
							printf qs(0x6a7bb545) f = <font> donotresolve
						endif
					endif
					if gotparam \{mask}
						add_generic_menu_text_item {
							text = (<mask>.frontend_desc)
							pad_choose_script = layers_list_select_layer
							pad_choose_params = {part = <part> section_index = <section_index> mask_index = <mask_index> cap_index = <i> layer_index = <j> mask = <mask> div_id = <div_id> camera_list = <camera_list> zoom_camera = <zoom_camera> cam_name = <override_base_name>}
							additional_focus_script = <additional_focus_script>
							additional_focus_params = <additional_focus_params>
						}
						if gotparam \{focus_item}
							if (<focus_item> = <j>)
								if screenelementexists \{id = generic_menu}
									if generic_menu :desc_resolvealias \{name = alias_generic_menu_smenu
											param = generic_smenu}
										printf qs(0xa36130bf) i = <focus_item>
										if gotparam \{paste_item}
											<generic_smenu> :scrollingmenu_setoverridevisibleindex (<paste_item> + 1)
											ui_event_remove_params \{param = paste_item}
										else
											<generic_smenu> :scrollingmenu_setoverridevisibleindex (<focus_item>)
										endif
									endif
								endif
								layers_list_set_focus mask = <mask> container_id = <item_container_id>
								ui_event_remove_params \{param = focus_item}
							endif
						endif
						num_layers = (<num_layers> + 1)
					endif
					j = (<j> + 1)
					repeat <array_size>
				endif
			endif
			i = (<i> + 1)
			repeat <cap_array_size>
		endif
	endif
	if screenelementexists \{id = num_layers}
		destroyscreenelement \{id = num_layers}
	endif
	formattext textname = text qs(0x1af30f77) i = <num_layers> j = ($max_cap_layers)
	createscreenelement {
		type = textblockelement
		parent = root_window
		id = num_layers
		font = ($test_menu_font)
		text = <text>
		pos = (400.0, 170.0)
		rgba = [175 , 175 , 175 , 255]
		dims = (375.0, 30.0)
		z_priority = 200
		fit_height = `scale down if larger`
		fit_width = `scale each line if larger`
		internal_just = [center , center]
	}
	if gotparam \{focus_item}
		ui_event_remove_params \{param = focus_item}
	endif
	if gotparam \{paste_item}
		ui_event_remove_params \{param = paste_item}
	endif
endscript

script cap_re_order_layer_handler_change 
	printf \{qs(0x3a7ad4ad)}
	requireparams \{[
			part
			cap_index
			layer_current_index
		]
		all}
	if NOT screenelementexists \{id = re_order_element}
		createscreenelement {
			type = containerelement
			id = re_order_element
			parent = root_window
			event_handlers = [
				{pad_up generic_menu_up_or_down_sound params = {up = 1}}
				{pad_down generic_menu_up_or_down_sound params = {down = 2}}
				{pad_up move_layer params = {part = <part> cap_index = <cap_index> layer_target_index = (<layer_current_index> -1) layer_current_index = <layer_current_index>}}
				{pad_down move_layer params = {part = <part> cap_index = <cap_index> layer_target_index = (<layer_current_index> + 1) layer_current_index = <layer_current_index>}}
				{pad_choose generic_menu_pad_choose_sound}
				{pad_choose cap_re_order_layer_handler_change_return params = {part = <part> camera_list = <camera_list> zoom_camera = <zoom_camera>}}
			]
			z_priority = <z_priority>
		}
	endif
	if NOT checksumequals a = <part> b = cas_band_logo
		setup_cas_menu_handlers vmenu_id = re_order_element camera_list = <camera_list> zoom_camera = <zoom_camera>
	endif
endscript

script cap_re_order_layer_handler_change_return 
	launchevent \{type = unfocus
		target = re_order_element}
	if NOT screenelementexists \{id = create_cap_layers_list_vmenu}
		return
	endif
	launchevent \{type = focus
		target = create_cap_layers_list_vmenu}
	if screenelementexists \{id = re_order_element}
		destroyscreenelement \{id = re_order_element}
	endif
	if screenelementexists \{id = layers_list_focus}
		destroyscreenelement \{id = layers_list_focus}
	endif
	ui_event_remove_params \{param = re_order_params}
	ui_event_remove_params \{param = focus_item}
	clean_up_user_control_helpers
	if checksumequals a = <part> b = cas_band_logo
		menu_finish \{car_helper_text
			no_rotate_zoom_text}
	else
		menu_finish \{car_helper_text}
	endif
	if screenelementexists \{id = generic_menu}
		if generic_menu :desc_resolvealias \{name = alias_generic_menu_smenu
				param = generic_smenu}
			<generic_smenu> :scrollingmenu_clearoverridevisibleindex
		endif
	endif
	if NOT checksumequals a = <part> b = cas_band_logo
		setup_cas_menu_handlers vmenu_id = create_cap_layers_list_vmenu camera_list = <camera_list> zoom_camera = <zoom_camera>
	endif
endscript

script move_layer 
	requireparams \{[
			part
			cap_index
			layer_target_index
			layer_current_index
		]
		all}
	if NOT getcasappearancepart part = <part>
		scriptassert '%s not found' s = <part> donotresolve donotresolve
	endif
	if (<layer_target_index> < 0)
		printf \{qs(0x0973b884)}
		return
	endif
	getarraysize (<cap> [<cap_index>].layers)
	if (<layer_target_index> > (<array_size> -1))
		printf \{qs(0xa80d5117)}
		return
	endif
	movearrayelement array = (<cap> [<cap_index>].layers) target = <layer_target_index> current = <layer_current_index>
	setarrayelement arrayname = cap index = <cap_index> newvalue = {
		(<cap> [<cap_index>])
		layers = <array>
	}
	setcasappearancecap part = <part> cap = <cap>
	updatecasmodelcap part = <part>
	ui_event_add_params focus_item = <layer_target_index>
	ui_event \{event = menu_refresh}
	spawnscriptlater set_generic_menu_scrollbar_index params = {vmenu = create_cap_layers_list_vmenu index = <layer_target_index>}
	layer_current_index = <layer_target_index>
	setscreenelementprops {
		id = re_order_element
		event_handlers =
		[
			{pad_up generic_menu_up_or_down_sound params = {up = 1}}
			{pad_down generic_menu_up_or_down_sound params = {down = 2}}
			{pad_up move_layer params = {part = <part> cap_index = <cap_index> layer_target_index = (<layer_current_index> -1) layer_current_index = <layer_current_index>}}
			{pad_down move_layer params = {part = <part> cap_index = <cap_index> layer_target_index = (<layer_current_index> + 1) layer_current_index = <layer_current_index>}}
		]
		replace_handlers
	}
	spawnscriptlater \{focus_re_order_element}
endscript

script is_cap_in_div 
	requireparams \{[
			part
			cap
		]
		all}
	if NOT getcasappearancepart part = <part>
		scriptassert '%s not found' s = <part> donotresolve donotresolve
	endif
	if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
		scriptassert '%s %t not found' s = <part> t = <desc_id>
	endif
	if NOT gotparam \{divisions}
		return \{true}
	elseif NOT gotparam \{div_id}
		return \{true}
	else
		getarraysize \{divisions}
		if (<array_size> > 0)
			i = 0
			begin
			if ((<divisions> [<i>].desc_id) = <div_id>)
				if ((<cap>.material) = (<divisions> [<i>].material))
					if structurecontains structure = <cap> (<divisions> [<i>].target)
						return \{true}
					endif
				endif
			endif
			i = (<i> + 1)
			repeat <array_size>
		endif
	endif
	return \{false}
endscript

script get_num_layers 
	num_layers = 0
	requireparams \{[
			part
		]
		all}
	if NOT getcasappearancepart part = <part>
		scriptassert '%s not found' s = <part> donotresolve donotresolve
	endif
	if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
		scriptassert '%s %t not found' s = <part> t = <desc_id>
	endif
	if gotparam \{cap}
		getarraysize (cap)
		cap_array_size = <array_size>
		if (<cap_array_size> > 0)
			i = 0
			begin
			if structurecontains structure = (<cap> [<i>]) layers
				if is_target_in_div target = (<cap> [<i>]) part = <part> div_id = <div_id>
					getarraysize (<cap> [<i>].layers)
					j = 0
					begin
					num_layers = (<num_layers> + 1)
					j = (<j> + 1)
					repeat <array_size>
				endif
			endif
			i = (<i> + 1)
			repeat <cap_array_size>
		endif
	endif
	return num_layers = <num_layers>
endscript

script is_cap_layers_full 
	requireparams \{[
			part
		]
		all}
	get_num_layers part = <part> div_id = <div_id>
	if (<num_layers> > (($max_cap_layers) -1))
		return \{true}
	else
		return \{false}
	endif
endscript

script extract_current_layers 
	requireparams \{[
			part
		]
		all}
	if NOT getcasappearancepart part = <part>
		scriptassert '%s not found' s = <part> donotresolve donotresolve
	endif
	if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
		scriptassert '%s %t not found' s = <part> t = <desc_id>
	endif
	if gotparam \{cap}
		getarraysize (cap)
		cap_array_size = <array_size>
		if (<cap_array_size> > 0)
			i = 0
			begin
			if structurecontains structure = (<cap> [<i>]) layers
				if is_target_in_div target = (<cap> [<i>]) part = <part> div_id = <div_id>
					return layers = ((<cap> [<i>]).layers)
				endif
			endif
			i = (<i> + 1)
			repeat <cap_array_size>
		endif
	endif
endscript

script cap_copy_layer 
	requireparams \{[
			part
			cap_index
			layer
			layer_index
		]}
	if NOT is_cap_layers_full part = <part> div_id = <div_id>
		if NOT getcasappearancepart part = <part>
			scriptassert '%s not found' s = <part> donotresolve
		endif
		insertarrayelement array = ((<cap> [<cap_index>]).layers) element = <layer> index = <layer_index>
		setarrayelement arrayname = cap index = <cap_index> newvalue = {
			(<cap> [<cap_index>])
			layers = <array>
		}
		setcasappearancecap part = <part> cap = <cap>
		updatecasmodelcap part = <part>
	endif
endscript

script continue_to_shape_list 
	printf \{qs(0xa3374ec1)}
	begin
	if is_menu_camera_finished
		destroy_generic_menu
		printf \{qs(0x54841d1d)}
		ui_event_wait event = menu_change data = {state = uistate_cap_shape_list <...>}
		return
	endif
	wait \{1
		gameframe}
	repeat
endscript

script layers_list_set_focus 
	if screenelementexists \{id = layers_list_focus}
		destroyscreenelement \{id = layers_list_focus}
	endif
	createscreenelement {
		parent = <container_id>
		type = descinterface
		desc = 'layers_list_focus'
		id = layers_list_focus
		layers_list_focus_text_text = (<mask>.frontend_desc)
		layers_list_focus_text_rgba = [255 255 255 255]
		layers_list_focus_text_font = fontgrid_text_a6_fire
		layers_list_focus_text_material = sys_fontgrid_text_a6_fire_sys_fontgrid_text_a6_fire
		z_priority = 100
	}
endscript

script layers_list_select_layer 
	if NOT getcasappearancepart part = <part>
		scriptassert '%s not found' s = <part> donotresolve
	endif
	if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
		scriptassert '%s %t not found' s = <part> t = <desc_id> donotresolve
	endif
	layers_list_set_focus <...>
	generic_event_choose data = {is_popup state = uistate_cap_layers_options <...>}
endscript

script cap_change_copy_handler 
	printf \{qs(0xa5f71727)}
	requireparams \{[
			part
			cap_index
			layer_index
			layer
		]
		all}
	if NOT getcasappearancepart part = <part>
		scriptassert '%s not found' s = <part> donotresolve
	endif
	if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
		scriptassert '%s %t not found' s = <part> t = <desc_id>
	endif
	if NOT gotparam \{cap}
		scriptassert \{qs(0x8db60c15)}
	endif
	getarraysize (<cap> [<cap_index>].layers)
	if NOT screenelementexists \{id = copy_element}
		createscreenelement {
			type = containerelement
			id = copy_element
			parent = root_window
			event_handlers = [
				{pad_up generic_menu_up_or_down_sound params = {up = 1}}
				{pad_down generic_menu_up_or_down_sound params = {down = 2}}
				{pad_up cap_decrement_target}
				{pad_down cap_increment_target}
				{pad_choose generic_menu_pad_choose_sound}
				{pad_choose cap_paste_layer params = {cap_index = <cap_index> part = <part> div_id = <div_id> camera_list = <camera_list> zoom_camera = <zoom_camera>}}
				{pad_back generic_menu_pad_choose_sound}
				{pad_back cap_copy_layer_handler_change_return params = {camera_list = <camera_list> zoom_camera = <zoom_camera> part = <part>}}
			]
			z_priority = <z_priority>
		}
		parent_id = <id>
		if NOT checksumequals a = <part> b = cas_band_logo
			setup_cas_menu_handlers vmenu_id = copy_element camera_list = <camera_list> zoom_camera = <zoom_camera>
		endif
		copy_element :settags {
			curent_index = <layer_index>
			target_index = <layer_index>
			layer = <layer>
			max_layer = <array_size>
		}
		if screenelementexists \{id = copy_indicator}
			destroyscreenelement \{id = copy_indicator}
		endif
		getscreenelementchildren \{id = create_cap_layers_list_vmenu}
		createscreenelement {
			type = descinterface
			desc = 'layers_list_copy'
			parent = (<children> [<layer_index>])
			id = copy_indicator
			dims = (0.0, 0.0)
			just = [center , center]
			pos_anchor = [center , center]
			pos = (0.0, 0.0)
		}
	endif
endscript

script cap_copy_layer_handler_change_return 
	launchevent \{type = unfocus
		target = copy_element}
	launchevent \{type = focus
		target = create_cap_layers_list_vmenu}
	if screenelementexists \{id = copy_element}
		destroyscreenelement \{id = copy_element}
	endif
	if screenelementexists \{id = layers_list_focus}
		destroyscreenelement \{id = layers_list_focus}
	endif
	if screenelementexists \{id = copy_indicator}
		destroyscreenelement \{id = copy_indicator}
	endif
	ui_event_remove_params \{param = copy_params}
	ui_event_remove_params \{param = focus_item}
	ui_event_remove_params \{param = paste_item}
	clean_up_user_control_helpers
	if checksumequals a = <part> b = cas_band_logo
		menu_finish \{car_helper_text
			no_rotate_zoom_text}
	else
		menu_finish \{car_helper_text}
	endif
	if NOT checksumequals a = <part> b = cas_band_logo
		setup_cas_menu_handlers vmenu_id = create_cap_layers_list_vmenu camera_list = <camera_list> zoom_camera = <zoom_camera>
	endif
	if screenelementexists \{id = generic_menu}
		if generic_menu :desc_resolvealias \{name = alias_generic_menu_smenu
				param = generic_smenu}
			<generic_smenu> :scrollingmenu_clearoverridevisibleindex
		endif
	endif
endscript

script cap_decrement_target 
	copy_element :gettags
	if (<target_index> = 0)
		printf \{qs(0x218fbf36)}
		return
	endif
	copy_element :settags target_index = (<target_index> -1)
	printf qs(0x06814f4b) i = (<target_index> -1)
	if screenelementexists \{id = copy_indicator}
		destroyscreenelement \{id = copy_indicator}
	endif
	getscreenelementchildren \{id = create_cap_layers_list_vmenu}
	createscreenelement {
		type = descinterface
		desc = 'layers_list_copy'
		parent = (<children> [(<target_index> -1)])
		id = copy_indicator
		dims = (0.0, 0.0)
		just = [center , center]
		pos_anchor = [center , center]
		pos = (0.0, 0.0)
	}
	set_generic_menu_scrollbar_index vmenu = create_cap_layers_list_vmenu index = (<target_index> -1)
	if screenelementexists \{id = generic_menu}
		if generic_menu :desc_resolvealias \{name = alias_generic_menu_smenu
				param = generic_smenu}
			printf \{qs(0x657fa8ff)}
			<generic_smenu> :scrollingmenu_setoverridevisibleindex (<target_index> -1)
		endif
	endif
endscript

script cap_increment_target 
	copy_element :gettags
	if (<target_index> > (<max_layer> -1))
		printf \{qs(0x4d5b9d6b)}
		return
	endif
	copy_element :settags target_index = (<target_index> + 1)
	printf qs(0x06814f4b) i = (<target_index> + 1)
	if screenelementexists \{id = copy_indicator}
		destroyscreenelement \{id = copy_indicator}
	endif
	getscreenelementchildren \{id = create_cap_layers_list_vmenu}
	createscreenelement {
		type = descinterface
		desc = 'layers_list_copy'
		parent = (<children> [(<target_index> + 1)])
		id = copy_indicator
		dims = (0.0, 0.0)
		just = [center , center]
		pos_anchor = [center , center]
		pos = (0.0, 0.0)
	}
	set_generic_menu_scrollbar_index vmenu = create_cap_layers_list_vmenu index = (<target_index> + 1)
	if screenelementexists \{id = generic_menu}
		if generic_menu :desc_resolvealias \{name = alias_generic_menu_smenu
				param = generic_smenu}
			<generic_smenu> :scrollingmenu_setoverridevisibleindex (<target_index> + 1)
		endif
	endif
endscript

script focus_copy_element 
	if screenelementexists \{id = create_cap_layers_list_vmenu}
		launchevent \{type = unfocus
			target = create_cap_layers_list_vmenu}
	else
		return
	endif
	if screenelementexists \{id = copy_element}
		launchevent \{type = focus
			target = copy_element}
		copy_element :gettags
	else
		return
	endif
	if screenelementexists \{id = copy_indicator}
		destroyscreenelement \{id = copy_indicator}
	endif
	if screenelementexists \{id = create_cap_layers_list_vmenu}
		getscreenelementchildren \{id = create_cap_layers_list_vmenu}
		createscreenelement {
			type = descinterface
			desc = 'layers_list_copy'
			parent = (<children> [<target_index>])
			id = copy_indicator
			dims = (0.0, 0.0)
			just = [center , center]
			pos_anchor = [center , center]
			pos = (0.0, 0.0)
		}
	endif
endscript

script cap_paste_layer 
	printf \{qs(0x68c6b732)}
	copy_element :gettags
	if (<target_index> < (<curent_index> + 1))
		curent_index = (<curent_index> + 1)
	endif
	ui_event_add_params focus_item = <curent_index>
	ui_event_add_params paste_item = <target_index>
	layer_index = <target_index>
	cap_copy_layer <...>
	copy_element :settags max_layer = (<max_layer> + 1) curent_index = <curent_index>
	if NOT is_cap_layers_full part = <part> div_id = <div_id>
		ui_event \{event = menu_refresh}
		spawnscriptlater \{focus_copy_element}
		cap_paste_layer_animate
	else
		printf \{qs(0xa1033b7c)}
		launchevent \{type = unfocus
			target = copy_element}
		cap_copy_layer_handler_change_return camera_list = <camera_list> zoom_camera = <zoom_camera> part = <part>
		generic_event_choose \{data = {
				state = uistate_generic_alert_popup
				is_popup
				pad_choose_script = cap_layers_full_alert_return
				title = qs(0x5b47d383)
				text = qs(0x300fda36)
			}}
	endif
endscript

script cap_layers_full_alert_return 
	generic_event_back
	ui_event_wait \{event = menu_refresh}
endscript

script cap_paste_layer_animate 
	spawnscriptnow \{cap_paste_layer_animate_worker}
endscript

script cap_paste_layer_animate_worker 
	wait \{0.1
		seconds}
	if screenelementexists \{id = copy_indicator}
		copy_indicator :se_setprops \{layer_copy_indicator_left_flash_alpha = 1.0
			layer_copy_indicator_right_flash_alpha = 1.0
			time = 0.1}
	else
		return
	endif
	wait \{0.15
		seconds}
	if screenelementexists \{id = copy_indicator}
		copy_indicator :se_setprops \{layer_copy_indicator_left_flash_alpha = 0.0
			layer_copy_indicator_right_flash_alpha = 0.0
			time = 0.1}
	else
		return
	endif
endscript
