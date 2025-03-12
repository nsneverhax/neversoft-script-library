exclusive_mp_controllers = [
	-1
	-1
	-1
	-1
]
num_exclusive_mp_controllers = 0

script make_menu_frontend {
		pad_back_script = generic_event_back
		item_scale = 0.8
		exclusive_device = ($primary_controller)
		spacing_between = -5
		title_scale = 1.0
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
			spacing_between = <spacing_between>
		}
		current_menu :obj_spawnscript \{highlight_motion
			no_flip}
	endif
	if gotparam \{title}
		menu_frontend_add_title title = <title> item_scale = (<item_scale> * <title_scale>)
	endif
	return \{window_id = current_menu_anchor
		desc_id = current_menu_anchor}
endscript

script menu_frontend_add_title \{parent = current_menu
		item_scale = 1.0}
	requireparams \{[
			title
			parent
		]
		all}
	scaling_factor = 1.0
	createscreenelement {
		type = descinterface
		parent = <parent>
		id = title_banner
		desc = 'vh_title_banner'
		title_text = <title>
		title_color = (($g_menu_colors).menu_default_title)
		just = [center center]
		pos = (0.0, 0.0)
		autosizedims = false
		dims = ((150 * <item_scale> * <scaling_factor>) * (0.0, 1.0))
		not_focusable
	}
	menu_frontend_resize_banner banner_id = title_banner scale = (<item_scale> * <scaling_factor>)
endscript

script menu_frontend_resize_banner \{scale = 1.0
		max_title_width = 450
		end_cap_extra_width = 100
		min_title_width = 150}
	requireparams \{[
			banner_id
		]
		all}
	if resolvescreenelementid id = [{id = <banner_id>} {local_id = root} {local_id = title}] param = title_id
		getscreenelementdims id = <title_id>
		<title_id> :se_setprops dims = ((0.0, 1.0) * <height>) fit_width = `expand dims`
		getscreenelementdims id = <title_id>
		text_width = <width>
		text_height = <height>
		printf \{channel = kim
			qs(0x37164e15)}
		max_width = (<max_title_width> + <end_cap_extra_width>)
		if (<text_width> > <max_width>)
			printf channel = kim qs(0x751dc1be) w = <text_width> h = <text_height>
			printf channel = kim qs(0x7b9de82e) w = <max_width>
			<title_id> :se_setprops dims = (((1.0, 0.0) * <max_width>) + ((0.0, 1.0) * <height>)) fit_width = `scale each line if larger`
			text_width = <max_width>
		endif
		if resolvescreenelementid id = [{id = <banner_id>} {local_id = root} {local_id = bannermiddle}] param = banner_mid_id
			getscreenelementdims id = <banner_mid_id>
			mid_width = (<text_width> - <end_cap_extra_width>)
			if (<mid_width> < <min_title_width>)
				printf channel = kim qs(0x94ef9637) w = <mid_width>
				mid_width = <min_title_width>
			endif
			printf channel = kim qs(0x6aa2cd16) w = <mid_width>
			printf channel = kim qs(0x62af903e) h = <height>
			<banner_mid_id> :se_setprops dims = ((<mid_width> * (1.0, 0.0)) + (<height> * (0.0, 1.0)))
		endif
	endif
	if resolvescreenelementid id = [{id = <banner_id>} {local_id = root}]
		<resolved_id> :se_setprops scale = <scale>
	endif
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

script add_menu_frontend_item {
		rgba = ($menu_unfocus_color)
		item_height = 50
		focus_script = mainmenu_focus
		unfocus_script = mainmenu_unfocus
		font = text_a1
		internal_scale = 1.0
		pad_choose_sound = ui_menu_select_sfx
		parent = current_menu
		single_line = true
		internal_just = [left top]
	}
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
		local_int_scale = <internal_scale>
		if gotparam \{item_scale}
			local_int_scale = (<internal_scale> * <item_scale>)
		endif
		if gotparam \{desc}
			createscreenelement {
				type = descinterface
				desc = <desc>
				parent = <parent>
				item_text = <text>
				item_color = <rgba>
				just = [center center]
				pos = (0.0, 0.0)
				autosizedims = true
				scale = <local_int_scale>
				event_handlers = [
					{focus <focus_script> params = <focus_params>}
					{unfocus <unfocus_script>}
				]
				<focus>
				tags = {index = <array_size> isinterface = true}
			}
			<id> :se_setprops scale = <local_int_scale> time = 0.0
			if <id> :desc_resolvealias name = alias_text_item param = text_id
				if <id> :desc_resolvealias name = alias_sprite_item param = sprite_id
					getscreenelementdims id = <text_id>
					text_width = <width>
					total_width = (<text_width> + 30)
					if gotparam \{icon}
						total_width = (<total_width> + 50)
					endif
					getscreenelementdims id = <sprite_id>
					<sprite_id> :se_setprops dims = (<total_width> * (1.0, 0.0) + <height> * (0.0, 1.0))
				endif
			endif
			<id> :desc_refreshcontentdims
		else
			createscreenelement {
				type = textelement
				parent = <parent>
				internal_scale = <local_int_scale>
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
		endif
		if gotparam \{choose_state}
			pad_choose_script = ui_event
			pad_choose_params = {event = menu_change data = {state = <choose_state> <choose_state_data> container_id = <container_id>}}
		else
			pad_choose_params = {<pad_choose_params> container_id = <container_id>}
		endif
		if gotparam \{choose_back}
			pad_choose_script = ui_event
			pad_choose_params = {event = menu_back}
		endif
		if gotparam \{pad_choose_script}
			setscreenelementprops {
				id = <id>
				event_handlers = [
					{pad_choose <pad_choose_sound>}
					{pad_choose generic_blocking_execute_script params = {pad_script = <pad_choose_script> pad_params = {container_id = <id> <pad_choose_params>}}}
				]
			}
		endif
		if gotparam \{heading}
			<id> :se_setprops shadow shadow_rgba = [0 0 0 255] shadow_offs = (2.0, 2.0)
		endif
		return item_container_id = <id> item_id = <id>
	endif
endscript

script add_menu_frontend_spacer \{item_height = 50
		parent = current_menu
		internal_just = [
			left
			top
		]}
	createscreenelement {
		type = containerelement
		parent = <parent>
		rgba = <rgba>
		dims = ((1.0, 1.0) * <item_height>)
		just = [center center]
		pos = (0.0, 0.0)
		single_line = true
		not_focusable
	}
endscript
spinner_vertical_offset = 3

script menu_focus_set_highlight type = spin menu = current_menu_anchor spinner_voffset = ($spinner_vertical_offset)
	obj_getid
	switch <type>
		case spin
		if <menu> :desc_resolvealias name = alias_spinner
			spinner_id = <resolved_id>
			wait \{2
				gameframe}
			spinner_scale = <scale>
			<objid> :getsingletag spinner_offset
			<objid> :getsingletag spinner_voffset
			if resolvescreenelementid id = [{id = <objid>} {local_id = generic_menu_smenu_textitem} {local_id = generic_menu_smenu_textitem_text}]
				objid = <resolved_id>
			endif
			<objid> :se_getprops
			getscreenelementdims id = <objid> summed
			element_width = <width>
			element_height = <height>
			getscreenelementposition id = <objid> summed
			height_offset = 0
			if ((<just> [1]) = -1)
				height_offset = (<height> * 0.5)
			endif
			if <spinner_id> :desc_resolvealias name = alias_left_spinner
				left_spinner_id = <resolved_id>
				<left_spinner_id> :se_setprops scale = 1 time = 0
				getscreenelementdims id = <left_spinner_id>
				if ((<just> [0]) = -1)
					ltspinner_offset = (<width> * 0.4)
				else
					ltspinner_offset = ((<element_width> * 0.5) + (<width> * 0.4))
				endif
				if gotparam \{spinner_offset}
					ltspinner_offset = (<ltspinner_offset> + <spinner_offset>)
				else
					ltspinner_offset = (<ltspinner_offset> + (<element_height> * 0.025))
				endif
				if gotparam \{spinner_scale}
					scale_height = <spinner_scale>
				else
					scale_height = ((<element_height> * 1.1) / <height>)
				endif
				leftposition = (<screenelementpos> + <ltspinner_offset> * (-1.0, 0.0) + <element_height> * (0.0, -0.1) + <height_offset> * (0.0, 1.0) + <spinner_voffset> * (0.0, 1.0))
				<left_spinner_id> :se_setprops pos = {absolute <leftposition>} scale = <scale_height> time = 0
			endif
			if <spinner_id> :desc_resolvealias name = alias_right_spinner
				right_spinner_id = <resolved_id>
				<right_spinner_id> :se_setprops scale = 1 time = 0
				getscreenelementdims id = <right_spinner_id>
				if ((<just> [0]) = -1)
					rtspinner_offset = (<element_width> + (<width> * 0.4))
				else
					rtspinner_offset = ((<element_width> * 0.5) + (<width> * 0.4))
				endif
				if gotparam \{spinner_offset}
					rtspinner_offset = (<rtspinner_offset> + <spinner_offset>)
				else
					rtspinner_offset = (<rtspinner_offset> + (<element_height> * 0.025))
				endif
				if gotparam \{spinner_scale}
					scale_height = <spinner_scale>
				else
					scale_height = ((<element_height> * 1.1) / <height>)
				endif
				rightposition = (<screenelementpos> + <rtspinner_offset> * (1.0, 0.0) + <element_height> * (0.0, -0.1) + <height_offset> * (0.0, 1.0) + <spinner_voffset> * (0.0, 1.0))
				<right_spinner_id> :se_setprops pos = {absolute <rightposition>} scale = <scale_height> time = 0
			endif
			if gotparam \{scale_height}
			endif
		endif
		case highlight
		if <menu> :desc_resolvealias name = alias_highlight
			highlight_id = <resolved_id>
			wait \{1
				gameframe}
			getscreenelementdims id = <objid> summed
			element_width = <width>
			element_height = <height>
			<highlight_id> :se_setprops scale = 1 time = 0
			getscreenelementdims id = <highlight_id>
			desired_width = ((<element_width> + (<element_height> * 0.5)))
			scale_width = (<desired_width> / <width>)
			scale_height = (((<element_height> * 1.2) / <height>))
			getscreenelementposition id = <objid> summed
			<highlight_id> :se_setprops pos = {absolute <screenelementpos>} scale = ((<scale_width> * (1.0, 0.0)) + (<scale_height> * (0.0, 1.0))) time = 0
			<highlight_id> :se_waitprops
		endif
	endswitch
endscript

script menu_reset_highlight 
	requireparams \{[
			anchor
		]}
	if screenelementexists \{id = current_menu}
		current_menu :menu_getselectedindex
		if getscreenelementchildren \{id = current_menu}
			if (<selected_index> >= 0)
				(<children> [<selected_index>]) :focus_set_spinners menu = <anchor>
			endif
		endif
	endif
endscript
object_spin_rate = 15

script spin_object spin_rate = ($object_spin_rate)
	requireparams \{[
			name
		]
		all}
	if desc_resolvealias name = <name>
		setscriptcannotpause
		begin
		if NOT screenelementexists id = <resolved_id>
			break
		endif
		<resolved_id> :se_getprops rot_angle
		<resolved_id> :se_setprops rot_angle = (<rot_angle> + <spin_rate>) time = 0.5
		wait \{5
			gameframes
			ignoreslomo}
		repeat
	endif
endscript
