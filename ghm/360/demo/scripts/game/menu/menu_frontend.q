exclusive_mp_controllers = [
	-1
	-1
	-1
	-1
]
num_exclusive_mp_controllers = 0

script make_menu_frontend {
		screen = drummer
		pad_back_script = generic_event_back
		item_scale = 2.0
		exclusive_device = ($primary_controller)
	}
	set_focus_color
	set_unfocus_color
	if gotparam \{use_all_controllers}
		removeparameter \{exclusive_device}
		get_all_exclusive_devices
	else
		add_gamertag_helper exclusive_device = <exclusive_device>
	endif
	update_ingame_controllers controller = <exclusive_device>
	createscreenelement {
		type = descinterface
		parent = root_window
		id = current_menu_anchor
		desc = 'menu_frontend'
		just = [center center]
		exclusive_device = <exclusive_device>
	}
	if <id> :desc_resolvealias name = alias_menu
		assignalias id = <resolved_id> alias = current_menu
		current_menu :se_setprops {
			event_handlers = [
				{pad_up generic_menu_up_or_down_sound params = {up}}
				{pad_down generic_menu_up_or_down_sound params = {down}}
				{pad_back <pad_back_script> params = <pad_back_params>}
			]
			tags = {item_scale = <item_scale>}
		}
		current_menu :obj_spawnscript \{highlight_motion}
	endif
	if gotparam \{title}
		createscreenelement {
			type = textelement
			parent = current_menu
			internal_scale = 1.0
			font = fontgrid_title_a1
			text = <title>
			rgba = [0 0 0 255]
			just = [center center]
			pos = (0.0, 0.0)
			not_focusable
		}
	endif
	return \{window_id = current_menu_anchor
		desc_id = current_menu_anchor}
endscript

script clear_exclusive_devices 
	change \{num_exclusive_mp_controllers = 0}
endscript

script add_exclusive_device \{device = 0}
	if ($num_exclusive_mp_controllers = 0)
		setarrayelement \{arrayname = exclusive_mp_controllers
			globalarray
			index = 0
			newvalue = -1}
		setarrayelement \{arrayname = exclusive_mp_controllers
			globalarray
			index = 1
			newvalue = -1}
		setarrayelement \{arrayname = exclusive_mp_controllers
			globalarray
			index = 2
			newvalue = -1}
		setarrayelement \{arrayname = exclusive_mp_controllers
			globalarray
			index = 3
			newvalue = -1}
	endif
	setarrayelement arrayname = exclusive_mp_controllers globalarray index = ($num_exclusive_mp_controllers) newvalue = <device>
	change num_exclusive_mp_controllers = ($num_exclusive_mp_controllers + 1)
endscript

script get_all_exclusive_devices 
	if ($num_exclusive_mp_controllers = 0)
		return
	else
		return exclusive_device = ($exclusive_mp_controllers)
	endif
endscript

script add_menu_frontend_item \{rgba = [
			0
			0
			0
			255
		]
		item_height = 50
		focus_script = mainmenu_focus
		unfocus_script = mainmenu_unfocus
		font = fontgrid_text_a6
		internal_scale = 0.7
		pad_choose_sound = ui_menu_select_sfx
		parent = current_menu
		single_line = true
		internal_just = [
			left
			top
		]}
	if screenelementexists \{id = current_menu}
		getscreenelementdims \{id = current_menu}
		current_menu :getsingletag \{item_scale}
		if getscreenelementchildren \{id = current_menu}
			getarraysize <children>
		else
			array_size = 0
		endif
		if gotparam \{choose_state}
			pad_choose_script = generic_event_choose
			pad_choose_params = {state = <choose_state> data = {<choose_state_data>}}
		endif
		if gotparam \{not_focusable}
			focus = {not_focusable}
		endif
		createscreenelement {
			type = textelement
			parent = <parent>
			internal_scale = <internal_scale>
			font = <font>
			text = <text>
			rgba = <rgba>
			just = [center center]
			internal_just = <internal_just>
			pos = (0.0, 0.0)
			single_line = <single_line>
			event_handlers = [
				{focus <focus_script> params = <focus_params>}
				{unfocus <unfocus_script>}
			]
			<focus>
			tags = {index = <array_size>}
		}
		if gotparam \{pad_choose_script}
			setscreenelementprops {
				id = <id>
				event_handlers = [
					{pad_choose <pad_choose_sound>}
					{pad_choose generic_blocking_execute_script params = {pad_script = <pad_choose_script> pad_params = {container_id = <id> <pad_choose_params>}}}
				]
			}
		endif
		return item_container_id = <id> item_id = <id>
	endif
endscript

script menu_frontend_focus 
	if desc_resolvealias \{name = alias_text}
		retail_menu_focus id = <resolved_id>
	endif
endscript

script menu_frontend_unfocus 
	gettags
	if gotparam \{rgba}
		set_unfocus_color rgba = <rgba>
	endif
	if desc_resolvealias \{name = alias_text}
		retail_menu_unfocus id = <resolved_id>
	endif
	if gotparam \{rgba}
		set_unfocus_color
	endif
endscript
