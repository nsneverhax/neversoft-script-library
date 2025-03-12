default_color_scheme = {
	title_color = [
		175
		175
		175
		255
	]
	text_color = [
		100
		88
		71
		255
	]
	text_focus_color = [
		189
		96
		4
		255
	]
}
cas_color_scheme = $default_color_scheme
test_menu_font = fontgrid_text_a6
test_menu_font_title = fontgrid_text_a8
menu_over_ride_exclusive_device = -1

script make_menu {
		menu_id = main_menu_anchor
		vmenu_id = main_menu
		parent = root_window
		pad_back_script = ui_event
		pad_back_params = {event = menu_back}
		pos = (200.0, 175.0)
		dims = (400.0, 450.0)
		rot_angle = 0
		pad_back_sound = ui_menu_select_sfx
		title_scale = 1.0
		title_pos = (410.0, 110.0)
		title_just = [center center]
		title_bg_pos = (385.0, 15.0)
		title_bg_scale = (1.9599999, 1.4)
		extra_z = 0
		scroll_bar_offeset = (375.0, -10.0)
		spacing_between = 0
		internal_just = [left top]
		selection_width = 425
		selection_height = 50
		menu_bg = menu_bg
		bg_pos = (-30.0, 0.0)
		bg_dims = (1280.0, 720.0)
		exclusive_device = ($primary_controller)
		bg_scale = (0.95, 1.0)
		scroll_down_sfx = generic_menu_up_or_down_sound
		scroll_up_sfx = generic_menu_up_or_down_sound
	}
	setscreenelementlock id = <parent> off
	if NOT gotparam \{color_scheme}
		color_scheme = $cas_color_scheme
	endif
	if NOT gotparam \{title_rgba}
		title_rgba = (<color_scheme>.title_color)
	endif
	if NOT gotparam \{scroll_bar_offset}
		scroll_bar_offset = (0.0, 0.0)
	endif
	if NOT gotparam \{keep_current}
		if screenelementexists \{id = current_menu_anchor}
			destroyscreenelement \{id = current_menu_anchor}
		endif
	else
		if gotparam \{fade_out_current}
			legacydoscreenelementmorph \{id = current_menu_anchor
				alpha = 0
				time = 0}
		endif
	endif
	if gotparam \{use_all_controllers}
		removeparameter \{exclusive_device}
		get_all_exclusive_devices
	endif
	if NOT (($menu_over_ride_exclusive_device) = -1)
		exclusive_device = ($menu_over_ride_exclusive_device)
	endif
	if gotparam \{centered}
		if NOT gotparam \{centered_offset}
			centered_offset = (0.0, 0.0)
		endif
		pos = ((((1.0, 0.0) * (640 - (<dims> [0] / 2))) + (0.0, 250.0)) + <centered_offset>)
		title_pos = (640.0, 130.0)
		if (<menu_bg> = menu_bg_2)
			title_rot_angle = -10
			title_pos = (640.0, 155.0)
		endif
	endif
	manglechecksums a = <menu_id> b = menu
	createscreenelement {
		type = containerelement
		parent = <parent>
		id = <menu_id>
		rot_angle = <rot_angle>
		just = [left top]
		pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		alpha = 1
		z_priority = <extra_z>
		focusable_child = <mangled_id>
		exclusive_device = <exclusive_device>
	}
	<highlight_parent_id> = <menu_id>
	createscreenelement {
		type = containerelement
		parent = <menu_id>
		id = <mangled_id>
		just = [left top]
		focusable_child = <vmenu_id>
	}
	if NOT gotparam \{keep_current}
		assignalias id = <menu_id> alias = current_menu_anchor
	endif
	if gotparam \{title}
		createscreenelement {
			type = textblockelement
			parent = <mangled_id>
			local_id = title
			font = ($test_menu_font_title)
			text = <title>
			rgba = <title_rgba>
			scale = <title_scale>
			pos = (<title_pos> - (0.0, 0.0))
			just = <title_just>
			z_priority = (3 + <extra_z>)
			rot_angle = <title_rot_angle>
			dims = (275.0, 75.0)
			fit_height = `scale down if larger`
			fit_width = `scale each line if larger`
			internal_just = [center center]
		}
		if NOT ((gotparam nobg) || (gotparam notitlebg))
			createscreenelement {
				type = spriteelement
				parent = <mangled_id>
				texture = menu_history_background_empty
				scale = <title_bg_scale>
				pos = <title_bg_pos>
				z_priority = (2 + <extra_z>)
				just = [center top]
			}
		endif
	endif
	<menu_id> :settags num_options = 0
	if gotparam \{scrolling}
		<menu_id> :settags scrolling_num_options = 0
		scroll_bar_pos = (<pos> + <scroll_bar_offeset>)
		scroll_bar_len = ((<dims> [1]) + 10)
		createscreenelement {
			type = containerelement
			parent = <mangled_id>
			local_id = scroll_bar
			pos = (<scroll_bar_pos> + <scroll_bar_offset>)
			just = [right top]
			dims = ((20.0, 0.0) + ((0.0, 1.0) * <scroll_bar_len>))
		}
		scroll_bar_id = <id>
		createscreenelement {
			type = spriteelement
			parent = <scroll_bar_id>
			pos = (0.0, -5.0)
			just = [center top]
			texture = arrow
			dims = (20.0, 20.0)
			z_priority = (14 + <extra_z>)
			rgba = [200 200 200 255]
		}
		createscreenelement {
			type = spriteelement
			parent = <scroll_bar_id>
			pos = (0.0, 0.0)
			just = [center top]
			texture = white
			rgba = [64 64 64 255]
			dims = ((20.0, 0.0) + ((0.0, 1.0) * <scroll_bar_len>))
			z_priority = (13 + <extra_z>)
			alpha = 0.0
		}
		createscreenelement {
			type = spriteelement
			parent = <scroll_bar_id>
			pos = ((0.0, 1.0) * <scroll_bar_len>)
			just = [center bottom]
			texture = arrow
			dims = (20.0, 20.0)
			z_priority = (14 + <extra_z>)
			rot_angle = 180
			rgba = [200 200 200 255]
		}
		createscreenelement {
			type = spriteelement
			parent = <scroll_bar_id>
			local_id = zipper
			pos = (0.0, 0.0)
			just = [center top]
			texture = white
			rgba = [200 200 0 255]
			dims = (20.0, 20.0)
			z_priority = (17 + <extra_z>)
			alpha = 0.0
		}
		<menu_id> :settags scroll_bar_id = <scroll_bar_id>
		<menu_id> :settags scroll_bar_len = (<scroll_bar_len> - 20)
		<menu_id> :settags scroll_bar_option = 0
		createscreenelement {
			type = vscrollingmenu
			parent = <mangled_id>
			dims = <dims>
			pos = <pos>
			just = [left top]
		}
		<parent_id> = <id>
		assignalias id = <parent_id> alias = current_scrolling_menu
		<vmenu_pos> = (0.0, 0.0)
	else
		<parent_id> = <mangled_id>
		<vmenu_pos> = <pos>
	endif
	createscreenelement {
		type = vmenu
		parent = <parent_id>
		id = <vmenu_id>
		pos = <vmenu_pos>
		font = ($test_menu_font)
		just = [left top]
		internal_just = <internal_just>
		<dont_allow_wrap>
		regular_space_amount = <regular_space_amount>
		spacing_between = <spacing_between>
	}
	if NOT gotparam \{nobg}
		createscreenelement {
			type = spriteelement
			parent = <menu_id>
			pos = <bg_pos>
			texture = <menu_bg>
			just = [left top]
			dims = <bg_dims>
			scale = <bg_scale>
		}
		assignalias id = <id> alias = current_menu_background
	endif
	if gotparam \{no_event_handlers}
		killeventhandlers
	else
		internal_pad_up_params = {up = 1}
		internal_pad_down_params = {down = 2}
		if gotparam \{scrolling}
			internal_pad_up_params = {<internal_pad_up_params> scrolling}
			internal_pad_down_params = {<internal_pad_down_params> scrolling}
		endif
		if (<pad_back_script> = nullscript)
			<pad_back_sound> = nullscript
		endif
		setscreenelementprops {
			id = <vmenu_id>
			event_handlers = [
				{pad_back <pad_back_sound>}
				{pad_back <pad_back_script> params = <pad_back_params>}
				{pad_up <scroll_up_sfx> params = <internal_pad_up_params>}
				{pad_down <scroll_down_sfx> params = <internal_pad_down_params>}
			]
		}
		if gotparam \{pad_down_script}
			setscreenelementprops {
				id = <vmenu_id>
				event_handlers = [
					{pad_down <pad_down_script> params = <pad_down_params>}
				]
			}
		endif
		if gotparam \{pad_up_script}
			setscreenelementprops {
				id = <vmenu_id>
				event_handlers = [
					{pad_up <pad_up_script> params = <pad_up_params>}
				]
			}
		endif
		if gotparam \{pad_option2_script}
			setscreenelementprops {
				id = <vmenu_id>
				event_handlers = [
					{pad_option2 <pad_option2_script> params = <pad_option2_params>}
				]
			}
		endif
		if gotparam \{pad_option_script}
			setscreenelementprops {
				id = <vmenu_id>
				event_handlers = [
					{pad_option <pad_option_script> params = <pad_option_params>}
				]
			}
		endif
	endif
	if NOT gotparam \{keep_current}
		assignalias id = <vmenu_id> alias = current_menu
	endif
	width = (<dims>.(1.0, 0.0))
	<vmenu_id> :settags color_scheme = <color_scheme>
	<vmenu_id> :settags extra_z = <extra_z>
	<vmenu_id> :settags scroll_bar_offset = <scroll_bar_offset>
	<vmenu_id> :settags menu_pos = <pos>
	if gotparam \{selection_width}
		<vmenu_id> :settags selection_width = <selection_width>
	endif
	if gotparam \{selection_height}
		<vmenu_id> :settags selection_height = <selection_height>
	endif
	if gotparam \{additional_create_script}
		<vmenu_id> :settags additional_create_script = <additional_create_script>
	endif
	if gotparam \{additional_focus_script}
		<vmenu_id> :settags additional_focus_script = <additional_focus_script>
	endif
	if gotparam \{additional_unfocus_script}
		<vmenu_id> :settags additional_unfocus_script = <additional_unfocus_script>
	endif
	if gotparam \{no_highlight_bar}
		<vmenu_id> :settags no_highlight_bar = 1
	else
		if gotparam \{highlight_dims}
			<vmenu_id> :settags highlight_dims = <highlight_dims>
		endif
	endif
	if gotparam \{additional_menu_create_script}
		<additional_menu_create_script> <additional_menu_create_params>
	endif
	if gotparam \{centered}
		<vmenu_id> :settags centered = 1
	endif
endscript

script menu_hide_scroll_bar \{menu_anchor = current_menu_anchor}
	if <menu_anchor> :getsingletag scroll_bar_id
		if screenelementexists id = <scroll_bar_id>
			legacydoscreenelementmorph id = <scroll_bar_id> alpha = 0.0
		endif
	endif
endscript

script menu_show_scroll_bar \{time = 0
		menu_anchor = current_menu_anchor}
	if <menu_anchor> :getsingletag scroll_bar_id
		if screenelementexists id = <scroll_bar_id>
			legacydoscreenelementmorph id = <scroll_bar_id> alpha = 1.0
		endif
	endif
endscript

script add_menu_item \{focus_script = menu_item_focus
		unfocus_script = menu_item_unfocus
		pad_choose_sound = ui_menu_select_sfx
		pad_choose_script = nullscript
		pad_choose_params = {
		}
		option_arrows_callback = nullscript
		additional_focus_script = nullscript
		additional_focus_params = {
		}
		additional_unfocus_script = nullscript
		additional_unfocus_params = {
		}
		scale = (0.8, 0.71999997)
		just = [
			left
			top
		]
		text_just = [
			left
			center
		]
		text_internal_just = [
			left
			center
		]
		child_anchor = [
			left
			center
		]
		parent = current_menu
		parent_anchor = current_menu_anchor
		scale_highlight_text = 0
		rot = 0
		text_offset = (36.0, 0.0)
		extras_offset = (16.0, 0.0)
		arrow_offset = (60.0, 0.0)
		cas_offset = (0.0, 0.0)
		alpha = 1
		text_case = upper}
	if globalexists \{name = massive_build}
		if NOT ($massive_build = 0)
			if gotparam \{massive_secret_item}
				return
			endif
		endif
	endif
	<parent> :getsingletag no_highlight_bar
	if NOT gotparam \{dims}
		if NOT gotparam \{selection_width}
			<parent> :getsingletag selection_width
		endif
		if NOT gotparam \{selection_height}
			<parent> :getsingletag selection_height
		endif
		dims = (((0.0, 1.0) * <selection_height>) + ((1.0, 0.0) * <selection_width>))
		if NOT gotparam \{highlight_dims}
			highlight_dims = (<dims> - (0.0, 10.0))
		endif
	else
	endif
	<parent> :getsingletag centered
	if gotparam \{centered}
		child_anchor = [center center]
		text_just = [center center]
		text_offset = (0.0, 0.0)
	endif
	<parent> :getsingletag color_scheme
	<parent> :getsingletag extra_z
	if NOT gotparam \{color_scheme}
		color_scheme = $cas_color_scheme
	endif
	if NOT gotparam \{rgba}
		<rgba> = ($default_color_scheme.text_color)
	endif
	if NOT gotparam \{extra_rgba}
		extra_rgba = ($default_color_scheme.text_color)
	endif
	if gotparam \{id}
		if screenelementexists id = <id>
			removeparameter \{id}
		endif
	endif
	if gotparam \{heading}
		addparams \{not_focusable}
		<rgba> = [200 70 70 255]
	endif
	if gotparam \{not_focusable}
		if gotparam \{heading}
		else
			if isarray <rgba>
				clrval = (<rgba> [0] * 0.5)
				casttointeger \{clrval}
				setarrayelement arrayname = rgba index = 0 newvalue = <clrval>
				clrval = (<rgba> [1] * 0.5)
				casttointeger \{clrval}
				setarrayelement arrayname = rgba index = 1 newvalue = <clrval>
				clrval = (<rgba> [2] * 0.5)
				casttointeger \{clrval}
				setarrayelement arrayname = rgba index = 2 newvalue = <clrval>
			endif
		endif
		createscreenelement {
			type = containerelement
			parent = <parent>
			id = <id>
			local_id = <local_id>
			dims = <dims>
			rot_angle = <rot>
			pos = <cas_offset>
			alpha = <alpha>
			just = <just>
			child_anchor = <child_anchor>
			not_focusable
		}
	else
		createscreenelement {
			type = containerelement
			parent = <parent>
			id = <id>
			local_id = <local_id>
			dims = <dims>
			rot_angle = <rot>
			pos = <cas_offset>
			alpha = <alpha>
			just = <just>
			child_anchor = <child_anchor>
			dims = <dims>
		}
		if gotparam \{tag_grid_x}
			<id> :settags tag_grid_x = <tag_grid_x> tag_length = <length>
		else
			<id> :settags tag_length = <length>
		endif
	endif
	<container_id> = <id>
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
	if NOT gotparam \{no_highlight_bar}
		createscreenelement {
			type = containerelement
			parent = <container_id>
			local_id = highlight
			just = [left center]
			pos = (0.0, 0.0)
			z_priority = (9 + <extra_z>)
			alpha = 0.0
		}
	endif
	if gotparam \{children}
		getarraysize \{children}
		<i> = 0
		begin
		if NOT structurecontains structure = (<children> [<i>]) null
			createscreenelement {
				z_priority = (10 + <extra_z>)
				(<children> [<i>])
				parent = <container_id>
			}
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	if gotparam \{toggle}
		if (<toggle> = on)
			extra_text = qs(0x73360a03)
		else
			extra_text = qs(0xa86f0987)
		endif
		extra_block = {dims = (50.0, 0.0) internal_just = [center center] allow_expansion}
		addparams \{option_arrows}
		if NOT gotparam \{no_toggle}
			<option_arrows_callback> = menu_toggle_item
			<option_arrows_callback_params> = {toggle_script = <toggle_script> id = <container_id> toggle_params = <toggle_params>}
			<container_id> :settags toggle = <toggle>
		endif
	endif
	if ((<additional_focus_script> = nullscript) && (<additional_unfocus_script> = nullscript))
		if (<pad_choose_script> = nullscript)
			setscreenelementprops {
				id = <container_id>
				event_handlers = [
					{focus <focus_script> params = {parent = <parent> parent_anchor = <parent_anchor> id = <container_id> scale_highlight_text = <scale_highlight_text>}}
					{unfocus <unfocus_script> params = {parent = <parent> parent_anchor = <parent_anchor> id = <container_id> scale_highlight_text = <scale_highlight_text>}}
				]
			}
		else
			setscreenelementprops {
				id = <container_id>
				event_handlers = [
					{focus <focus_script> params = {parent = <parent> parent_anchor = <parent_anchor> id = <container_id> scale_highlight_text = <scale_highlight_text>}}
					{unfocus <unfocus_script> params = {parent = <parent> parent_anchor = <parent_anchor> id = <container_id> scale_highlight_text = <scale_highlight_text>}}
					{pad_choose <pad_choose_sound>}
					{pad_choose <pad_choose_script> params = <pad_choose_params>}
				]
			}
		endif
	else
		setscreenelementprops {
			id = <container_id>
			event_handlers = [
				{focus <focus_script> params = {parent = <parent> parent_anchor = <parent_anchor> id = <container_id> scale_highlight_text = <scale_highlight_text>}}
				{unfocus <unfocus_script> params = {parent = <parent> parent_anchor = <parent_anchor> id = <container_id> scale_highlight_text = <scale_highlight_text>}}
				{pad_choose <pad_choose_sound>}
				{pad_choose <pad_choose_script> params = <pad_choose_params>}
				{focus <additional_focus_script> params = {parent = <parent> parent_anchor = <parent_anchor> id = <container_id> <additional_focus_params>}}
				{unfocus <additional_unfocus_script> params = {parent = <parent> parent_anchor = <parent_anchor> id = <container_id> <additional_unfocus_params>}}
			]
		}
	endif
	if gotparam \{pad_square_script}
		setscreenelementprops {
			id = <container_id>
			event_handlers = [
				{pad_square <pad_square_script> params = {id = <container_id> <pad_square_params>}}
			]
		}
	endif
	if gotparam \{pad_start_script}
		setscreenelementprops {
			id = <container_id>
			event_handlers = [
				{pad_start <pad_start_script> params = {id = <container_id> <pad_start_params>}}
			]
		}
	endif
	<container_id> :settags text_offset = <text_offset>
	<container_id> :settags arrow_offset = <arrow_offset>
	<container_id> :settags extras_offset = <extras_offset>
	<container_id> :settags option_arrows_callback = <option_arrows_callback>
	<container_id> :settags cas_offset = <cas_offset>
	<container_id> :settags just = <just>
	<container_id> :settags rgba = <rgba>
	<container_id> :settags extra_rgba = <extra_rgba>
	<parent_anchor> :getsingletag scrolling_num_options
	if gotparam \{scrolling_num_options}
		<container_id> :settags scrolling_option = <scrolling_num_options>
		<scrolling_num_options> = (<scrolling_num_options> + 1)
		<parent_anchor> :settags scrolling_num_options = <scrolling_num_options>
	endif
	<parent_anchor> :getsingletag num_options
	if gotparam \{num_options}
		<num_options> = (<num_options> + 1)
		<parent_anchor> :settags num_options = <num_options>
	endif
	if (<text_case> = lower)
		getlowercasestring <text>
		<text> = <lowercasestring>
	elseif (<text_case> = upper)
		getuppercasestring <text>
		<text> = <uppercasestring>
	endif
	text_scale = <scale>
	createscreenelement {
		type = textblockelement
		parent = <container_id>
		local_id = text
		font = ($test_menu_font)
		text = <text>
		rgba = <rgba>
		scale = <text_scale>
		just = <text_just>
		pos = <text_offset>
		z_priority = (10 + <extra_z>)
		dims = (((1.0, 0.0) * (<dims> [0])) + (0.0, 50.0))
		fit_height = `scale down if larger`
		fit_width = `scale each line if larger`
		internal_just = <text_internal_just>
	}
	if gotparam \{extra_text}
		if NOT gotparam \{extra_just}
			if gotparam \{option_arrows}
				<extra_just> = [center center]
			else
				<extra_just> = [left center]
			endif
		endif
		if NOT gotparam \{extra_block}
			createscreenelement {
				type = textblockelement
				parent = <container_id>
				local_id = extra_text
				font = ($test_menu_font)
				text = <extra_text>
				rgba = <extra_rgba>
				pos = (((1.0, 0.0) * <dims> [0]) + <extras_offset>)
				just = <extra_just>
				scale = <scale>
				z_priority = (10 + <extra_z>)
				dims = (((1.0, 0.0) * (<dims> [0] - (<text_offset> [0] * 2))) + (0.0, 50.0))
				fit_height = `scale down if larger`
				fit_width = `scale each line if larger`
			}
		else
			createscreenelement {
				type = textblockelement
				parent = <container_id>
				local_id = extra_text
				font = ($test_menu_font)
				text = <extra_text>
				rgba = <extra_rgba>
				just = <extra_just>
				internal_scale = <scale>
				internal_just = [left top]
				<extra_block>
				pos = (((1.0, 0.0) * <dims> [0]) + <extras_offset>)
				z_priority = (10 + <extra_z>)
			}
			getscreenelementchildren id = <id>
			getarraysize <children>
			if NOT (<array_size> = 1)
				<container_id> :se_setprops dims = (((1.0, 0.0) * <dims> [0]) + ((0.0, 1.0) * (<dims> [1] * <array_size>)))
			endif
		endif
		if gotparam \{option_arrows}
			setscreenelementprops {
				id = <container_id>
				event_handlers = [
					{pad_left <option_arrows_callback> params = {left <option_arrows_callback_params>}}
					{pad_right <option_arrows_callback> params = {right <option_arrows_callback_params>}}
				]
			}
		endif
	endif
	menu_item_resize id = <container_id>
	if <parent> :getsingletag additional_create_script
		<additional_create_script> <...>
	endif
	setscreenelementlock id = <parent> on
	setscreenelementlock id = <parent> off
	return item_container_id = <container_id>
endscript

script add_icon_menu_item \{focus_script = menu_icon_focus
		unfocus_script = menu_icon_unfocus
		pad_choose_sound = ui_menu_select_sfx
		pad_choose_script = nullscript
		pad_choose_params = {
		}
		additional_focus_script = nullscript
		additional_focus_params = {
		}
		additional_unfocus_script = nullscript
		additional_unfocus_params = {
		}
		scale = (0.8, 0.71999997)
		just = [
			left
			top
		]
		text_just = [
			left
			center
		]
		child_anchor = [
			left
			center
		]
		parent = current_menu
		parent_anchor = current_menu_anchor
		scale_highlight_text = 0
		rot = 0
		text_offset = (110.0, 7.0)
		extras_offset = (16.0, 0.0)
		arrow_offset = (60.0, 0.0)
		alpha = 1
		text_case = lower
		icon_scale = 0.5
		icon_offset = (64.0, 0.0)
		icon_dims = (75.0, 75.0)
		icon_padding = (0.0, 16.0)
		text_case = upper
		extra_z = 0
		selection_width = 345
		selection_height = 60}
	if globalexists \{name = massive_build}
		if NOT ($massive_build = 0)
			if gotparam \{massive_secret_item}
				return
			endif
		endif
	endif
	<parent> :getsingletag no_highlight_bar
	if NOT gotparam \{dims}
		if NOT gotparam \{selection_width}
			<parent> :getsingletag selection_width
		endif
		if NOT gotparam \{selection_height}
			<parent> :getsingletag selection_height
		endif
		dims = (((0.0, 1.0) * <selection_height>) + ((1.0, 0.0) * <selection_width>))
		dims = (<dims> + <icon_padding>)
		if NOT gotparam \{highlight_dims}
			highlight_dims = (<dims> - (0.0, 10.0))
		endif
	else
		dims = (<dims> + <icon_padding>)
	endif
	<parent> :getsingletag centered
	if gotparam \{centered}
		child_anchor = [center center]
		text_just = [center center]
		text_offset = (0.0, 0.0)
	endif
	<parent> :getsingletag color_scheme
	<parent> :getsingletag extra_z
	if NOT gotparam \{color_scheme}
		color_scheme = $cas_color_scheme
	endif
	if NOT gotparam \{rgba}
		<rgba> = ($default_color_scheme.text_color)
	endif
	if NOT gotparam \{extra_rgba}
		extra_rgba = ($default_color_scheme.text_color)
	endif
	if gotparam \{id}
		if screenelementexists id = <id>
			removeparameter \{id}
		endif
	endif
	if gotparam \{heading}
		addparams \{not_focusable}
		<rgba> = [200 70 70 255]
	endif
	if gotparam \{not_focusable}
		if gotparam \{heading}
		else
			if isarray <rgba>
				clrval = (<rgba> [0] * 0.5)
				casttointeger \{clrval}
				setarrayelement arrayname = rgba index = 0 newvalue = <clrval>
				clrval = (<rgba> [1] * 0.5)
				casttointeger \{clrval}
				setarrayelement arrayname = rgba index = 1 newvalue = <clrval>
				clrval = (<rgba> [2] * 0.5)
				casttointeger \{clrval}
				setarrayelement arrayname = rgba index = 2 newvalue = <clrval>
			endif
		endif
		createscreenelement {
			type = containerelement
			parent = <parent>
			id = <id>
			local_id = <local_id>
			dims = <dims>
			rot_angle = <rot>
			alpha = <alpha>
			just = <just>
			child_anchor = <child_anchor>
			not_focusable
		}
	else
		createscreenelement {
			type = containerelement
			parent = <parent>
			id = <id>
			local_id = <local_id>
			dims = <dims>
			rot_angle = <rot>
			alpha = <alpha>
			just = <just>
			child_anchor = <child_anchor>
			dims = <dims>
		}
		if gotparam \{tag_grid_x}
			<id> :settags tag_grid_x = <tag_grid_x> tag_length = <length>
		else
			<id> :settags tag_length = <length>
		endif
	endif
	<container_id> = <id>
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
	if NOT gotparam \{no_highlight_bar}
		createscreenelement {
			type = spriteelement
			texture = history_highlight
			parent = <container_id>
			local_id = highlight
			just = [left center]
			pos = (0.0, 0.0)
			z_priority = (9 + <extra_z>)
			alpha = 0.0
			scale = 0.5
		}
	endif
	if gotparam \{children}
		getarraysize \{children}
		<i> = 0
		begin
		if NOT structurecontains structure = (<children> [<i>]) null
			createscreenelement {
				z_priority = (10 + <extra_z>)
				(<children> [<i>])
				parent = <container_id>
			}
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	if ((<additional_focus_script> = nullscript) && (<additional_unfocus_script> = nullscript))
		if (<pad_choose_script> = nullscript)
			setscreenelementprops {
				id = <container_id>
				event_handlers = [
					{focus <focus_script> params = {parent = <parent> parent_anchor = <parent_anchor> id = <container_id> scale_highlight_text = <scale_highlight_text>}}
					{unfocus <unfocus_script> params = {parent = <parent> parent_anchor = <parent_anchor> id = <container_id> scale_highlight_text = <scale_highlight_text>}}
				]
			}
		else
			setscreenelementprops {
				id = <container_id>
				event_handlers = [
					{focus <focus_script> params = {parent = <parent> parent_anchor = <parent_anchor> id = <container_id> scale_highlight_text = <scale_highlight_text>}}
					{unfocus <unfocus_script> params = {parent = <parent> parent_anchor = <parent_anchor> id = <container_id> scale_highlight_text = <scale_highlight_text>}}
					{pad_choose <pad_choose_sound>}
					{pad_choose <pad_choose_script> params = <pad_choose_params>}
				]
			}
		endif
	else
		setscreenelementprops {
			id = <container_id>
			event_handlers = [
				{focus <focus_script> params = {parent = <parent> parent_anchor = <parent_anchor> id = <container_id> scale_highlight_text = <scale_highlight_text>}}
				{unfocus <unfocus_script> params = {parent = <parent> parent_anchor = <parent_anchor> id = <container_id> scale_highlight_text = <scale_highlight_text>}}
				{pad_choose <pad_choose_sound>}
				{pad_choose <pad_choose_script> params = <pad_choose_params>}
				{focus <additional_focus_script> params = {parent = <parent> parent_anchor = <parent_anchor> id = <container_id> <additional_focus_params>}}
				{unfocus <additional_unfocus_script> params = {parent = <parent> parent_anchor = <parent_anchor> id = <container_id> <additional_unfocus_params>}}
			]
		}
	endif
	if gotparam \{pad_square_script}
		setscreenelementprops {
			id = <container_id>
			event_handlers = [
				{pad_square <pad_square_script> params = {id = <container_id> <pad_square_params>}}
			]
		}
	endif
	if gotparam \{pad_start_script}
		setscreenelementprops {
			id = <container_id>
			event_handlers = [
				{pad_start <pad_start_script> params = {id = <container_id> <pad_start_params>}}
			]
		}
	endif
	<container_id> :settags text_offset = <text_offset>
	<container_id> :settags just = <just>
	<container_id> :settags rgba = <rgba>
	<container_id> :settags extra_rgba = <extra_rgba>
	<parent_anchor> :getsingletag scrolling_num_options
	if gotparam \{scrolling_num_options}
		<container_id> :settags scrolling_option = <scrolling_num_options>
		<scrolling_num_options> = (<scrolling_num_options> + 1)
		<parent_anchor> :settags scrolling_num_options = <scrolling_num_options>
	endif
	<parent_anchor> :getsingletag num_options
	if gotparam \{num_options}
		<num_options> = (<num_options> + 1)
		<parent_anchor> :settags num_options = <num_options>
	endif
	text_scale = <scale>
	if NOT gotparam \{icon}
		icon = menu_history_unknown
	endif
	createscreenelement {
		type = spriteelement
		parent = <container_id>
		local_id = icon_texture
		texture = <icon>
		scale = <icon_scale>
		internal_just = [left center]
		pos = <icon_offset>
		rot_angle = <icon_rot>
		z_priority = (10 + <extra_z>)
	}
	if (<text_case> = lower)
		getlowercasestring <text>
		<text> = <lowercasestring>
	elseif (<text_case> = upper)
		getuppercasestring <text>
		<text> = <uppercasestring>
	endif
	createscreenelement {
		type = textblockelement
		parent = <container_id>
		local_id = text
		font = ($test_menu_font)
		text = <text>
		rgba = <rgba>
		scale = <text_scale>
		just = <text_just>
		pos = <text_offset>
		z_priority = (10 + <extra_z>)
		dims = (((1.0, 0.0) * (<dims> [0])) + (0.0, 50.0))
		fit_height = `scale down if larger`
		fit_width = `scale each line if larger`
	}
	menu_item_resize id = <container_id>
	if <parent> :getsingletag additional_create_script
		<additional_create_script> <...>
	endif
	setscreenelementlock id = <parent> on
	setscreenelementlock id = <parent> off
	return item_container_id = <container_id>
endscript

script runscriptonscreenelement_script 
	printf \{'RunScriptOnScreenElement_script - stub'}
endscript

script menu_item_get_cas_origin 
	<id> :getsingletag cas_offset
	<id> :getsingletag length
	<id> :getsingletag just
	cas_origin = <cas_offset>
	if (<just> [0] = center)
		cas_origin = (<cas_origin> - ((<length> / 2) * (1.0, 0.0)))
	else
		if (<just> [0] = right)
			cas_origin = (<cas_origin> + (<length> * (1.0, 0.0)))
		endif
	endif
	return cas_origin = <cas_origin>
endscript

script menu_item_resize_extras 
	<id> :getsingletag extras_offset
	<id> :getsingletag arrow_offset
	if screenelementexists id = {<id> child = extra_text}
		getscreenelementdims id = <id>
		if screenelementexists id = {<id> child = arrow_left}
			setscreenelementprops {
				id = {<id> child = arrow_left}
				pos = (((1.0, 0.0) * <width>) + <extras_offset>)
			}
			setscreenelementprops {
				id = {<id> child = extra_text}
				pos = (((1.0, 0.0) * <width>) + <arrow_offset> + <extras_offset>)
			}
			setscreenelementprops {
				id = {<id> child = arrow_right}
				pos = (((1.0, 0.0) * <width>) + <arrow_offset> + <arrow_offset> + <extras_offset>)
			}
		endif
	endif
endscript

script menu_item_resize 
	menu_item_resize_extras id = <id>
endscript

script menu_item_focus \{parent_anchor = current_menu_anchor
		parent = current_menu}
	on_color = [200 70 70 255]
	<id> :getsingletag scrolling_option
	<parent> :getsingletag color_scheme
	on_color = (<color_scheme>.text_focus_color)
	setscreenelementprops {
		id = {<id> child = text}
		rgba = [255 255 255 255]
		font = fontgrid_text_a6_fire material = sys_fontgrid_text_a6_fire_sys_fontgrid_text_a6_fire
	}
	if screenelementexists id = {<id> child = extra_text}
		setscreenelementprops {
			id = {<id> child = extra_text}
			rgba = <on_color>
		}
	endif
	if gotparam \{scale_highlight_text}
		if (<scale_highlight_text>)
			legacydoscreenelementmorph id = {<id> child = text} time = 0.05 scale = 1.25 relative_scale
		endif
	endif
	if screenelementexists id = <parent>
		if <parent> :getsingletag additional_focus_script
			<additional_focus_script> <...>
		endif
	endif
	if gotparam \{scrolling_option}
		<parent_anchor> :getsingletag scrolling_num_options
		menu_update_scrollbar parent = <parent> parent_anchor = <parent_anchor> option = <scrolling_option> num_options = <scrolling_num_options>
	endif
	if screenelementexists id = {<id> child = highlight}
		legacydoscreenelementmorph id = {<id> child = highlight} alpha = 1.0 time = 0.1
	endif
endscript

script menu_update_scrollbar \{parent_anchor = current_menu_anchor}
	if <parent_anchor> :getsingletag scroll_bar_id
		<parent_anchor> :getsingletag scroll_bar_len
		<parent_anchor> :getsingletag scroll_bar_option
		if (<num_options> > 1)
			pos_fraction = ((<option> * 1.0) / (<num_options> - 1.0))
			pos_length = (<scroll_bar_len> * <pos_fraction>)
			pos = (<pos_length> * (0.0, 1.0))
		endif
		if screenelementexists id = {<scroll_bar_id> child = zipper}
			<parent_anchor> :settags scroll_bar_option = <option>
			legacydoscreenelementmorph id = {<scroll_bar_id> child = zipper} pos = (<pos>)
		endif
	endif
endscript

script menu_item_unfocus \{parent = current_menu}
	<id> :getsingletag rgba
	<id> :getsingletag extra_rgba
	setscreenelementprops {
		id = {<id> child = text}
		rgba = <rgba>
		font = ($test_menu_font)
		material = null
	}
	if screenelementexists id = {<id> child = extra_text}
		setscreenelementprops {
			id = {<id> child = extra_text}
			rgba = <extra_rgba>
		}
	endif
	if gotparam \{scale_highlight_text}
		if (<scale_highlight_text>)
			legacydoscreenelementmorph id = {<id> child = text} time = 0.05 scale = 1.0 relative_scale
		endif
	endif
	if screenelementexists id = {<id> child = highlight}
		legacydoscreenelementmorph id = {<id> child = highlight} alpha = 0.0 time = 0.5
	endif
	if screenelementexists id = <parent>
		if <parent> :getsingletag additional_unfocus_script
			<additional_unfocus_script> <...>
		endif
	endif
endscript

script add_menu_flag_item \{toggle_script = menu_toggle_flag}
	if NOT gotparam \{flag}
		printf \{qs(0xaf3766ab)}
		return
	endif
	if NOT gotparam \{toggle_params}
		toggle_params = {flag = <flag>}
	endif
	if getglobalflag flag = <flag>
		if gotparam \{reverse}
			toggle = off
			reverse = reverse
		else
			toggle = on
		endif
	else
		if gotparam \{reverse}
			toggle = on
			reverse = reverse
		else
			toggle = off
		endif
	endif
	add_menu_item <...> toggle_script = <toggle_script> toggle_params = <toggle_params>
endscript

script menu_toggle_flag 
	if getglobalflag flag = <flag>
		unsetglobalflag flag = <flag>
	else
		setglobalflag flag = <flag>
	endif
endscript

script menu_finish controller = ($primary_controller)
	if NOT (($menu_over_ride_exclusive_device) = -1)
		controller = ($menu_over_ride_exclusive_device)
	endif
	if NOT gotparam \{no_helper_text}
		if gotparam \{no_back_button}
			add_user_control_helper \{text = qs(0xc18d5e76)
				button = green
				z = 100000}
		elseif gotparam \{car_helper_text}
			add_user_control_helper \{text = qs(0xc18d5e76)
				button = green
				z = 100000}
			add_user_control_helper \{text = qs(0xaf4d5dd2)
				button = red
				z = 100000}
			menu_finish_rotate_zoom <...>
		elseif gotparam \{car_helper_text_back}
			add_user_control_helper \{text = qs(0xc18d5e76)
				button = green
				z = 100000}
			add_user_control_helper \{text = qs(0xaf4d5dd2)
				button = red
				z = 100000}
			menu_finish_rotate_zoom <...>
		elseif gotparam \{car_helper_text_cancel}
			add_user_control_helper \{text = qs(0xc18d5e76)
				button = green
				z = 100000}
			add_user_control_helper \{text = qs(0xf7723015)
				button = red
				z = 100000}
			menu_finish_rotate_zoom <...>
		elseif gotparam \{car_helper_text_extra}
			add_user_control_helper \{text = qs(0xc18d5e76)
				button = green
				z = 100000}
			add_user_control_helper \{text = qs(0x3fc1c076)
				button = red
				z = 100000}
			add_user_control_helper \{text = qs(0xf7723015)
				button = yellow
				z = 100000}
			menu_finish_rotate_zoom <...>
		elseif gotparam \{car_helper_text_alt}
			add_user_control_helper \{text = qs(0xc18d5e76)
				button = green
				z = 100000}
			add_user_control_helper \{text = qs(0xf7723015)
				button = red
				z = 100000}
			add_user_control_helper \{text = qs(0xaa2546c1)
				button = yellow
				z = 100000}
			menu_finish_rotate_zoom <...>
		elseif gotparam \{car_helper_text_purchase}
			add_user_control_helper \{text = qs(0x9b07ecb6)
				button = green
				z = 100000}
			add_user_control_helper \{text = qs(0xf7723015)
				button = red
				z = 100000}
			menu_finish_rotate_zoom <...>
		elseif gotparam \{car_rotate_zoom}
			menu_finish_rotate_zoom <...>
		else
			add_user_control_helper \{text = qs(0xc18d5e76)
				button = green
				z = 100000}
			add_user_control_helper \{text = qs(0xaf4d5dd2)
				button = red
				z = 100000}
		endif
	endif
endscript

script menu_finish_rotate_zoom 
	if NOT gotparam \{no_rotate_zoom_text}
		if ((isguitarcontroller controller = <controller>) || (isdrumcontroller controller = <controller>))
			if NOT gotparam \{no_rotate_text}
				add_user_control_helper \{text = qs(0xe7d2a66e)
					button = blue
					z = 100000}
			endif
			if NOT gotparam \{no_zoom_text}
				add_user_control_helper \{text = qs(0x26950e02)
					button = orange
					z = 100000}
			endif
		else
			if NOT gotparam \{no_rotate_text}
				add_user_control_helper \{text = qs(0xe7d2a66e)
					button = lbrb
					z = 100000}
			endif
			if NOT gotparam \{no_zoom_text}
				add_user_control_helper \{text = qs(0x26950e02)
					button = rt
					z = 100000}
			endif
		endif
	endif
endscript

script menu_toggle_item 
	<id> :getsingletag toggle
	if (<toggle> = on)
		<toggle> = off
		if screenelementexists id = {<id> child = extra_text}
			setscreenelementprops id = {<id> child = extra_text} text = qs(0xa86f0987)
		endif
	else
		<toggle> = on
		if screenelementexists id = {<id> child = extra_text}
			setscreenelementprops id = {<id> child = extra_text} text = qs(0x73360a03)
		endif
	endif
	<id> :settags toggle = <toggle>
	if gotparam \{toggle_script}
		<toggle_script> <toggle_params>
	endif
endscript

script menu_checkbox_sound 
	soundevent \{event = ui_toggle_checkbox_sfx}
endscript

script generic_ui_destroy \{parent_anchor = current_menu_anchor}
	cleanup_cas_menu_handlers
	if screenelementexists id = <parent_anchor>
		destroyscreenelement id = <parent_anchor>
	endif
	if screenelementexists \{id = helper_text_anchor}
		destroyscreenelement \{id = helper_text_anchor}
	endif
	destroy_viewport_ui
	clean_up_user_control_helpers
	destroy_generic_menu
endscript

script animate_in 
	setbuttoneventmappings \{block_menu_input}
	setscreenelementprops \{id = root_window
		tags = {
			menu_state = entering
		}}
	launchevent type = focus target = <menu_id>
	legacydomorph \{time = 0.05
		rot_angle = 3
		pos = (40.0, 0.0)
		alpha = 1}
	legacydomorph \{time = 0.01
		rot_angle = 0
		pos = (10.0, 0.0)}
	setscreenelementprops \{id = root_window
		tags = {
			menu_state = on
		}}
	if NOT gotparam \{dont_unblock}
		setbuttoneventmappings \{unblock_menu_input}
	endif
endscript

script menu_onscreen \{menu_id = current_menu_anchor}
	legacydomorph \{scale = 2
		time = 0}
	if gotparam \{pos}
		legacydomorph pos = <pos>
	endif
	se_setprops \{just = [
			center
			center
		]}
	gettags
	obj_getid
	<id> = <objid>
	if gotparam \{focus_child}
		launchevent type = focus target = <menu_id> data = {child_id = <focus_child>}
	else
		launchevent type = focus target = <id>
	endif
	if NOT gotparam \{preserve_menu_state}
		setscreenelementprops \{id = root_window
			tags = {
				menu_state = on
			}}
	endif
endscript

script animate_out \{menu_id = current_menu_anchor}
	setbuttoneventmappings \{block_menu_input}
	setscreenelementprops \{id = root_window
		tags = {
			menu_state = leaving
		}}
	gettags
	obj_getid
	<id> = <objid>
	se_setprops \{just = [
			center
			center
		]}
	legacydomorph \{time = 0
		scale = 1.0}
	legacydomorph \{time = 0.3
		alpha = 0}
	setscreenelementprops \{id = root_window
		tags = {
			menu_state = off
		}}
	setscreenelementlock \{id = root_window
		off}
	destroyscreenelement id = <menu_id>
	setbuttoneventmappings \{unblock_menu_input}
endscript

script menu_offscreen 
	setscreenelementprops \{id = root_window
		tags = {
			menu_state = off
		}}
	setscreenelementlock \{id = root_window
		off}
	obj_getid
	<id> = <objid>
	launchevent type = unfocus target = <id>
	destroyscreenelement id = <id> recurse
endscript

script hide_root_window 
	setscreenelementprops \{id = root_window
		hide}
endscript

script unhide_root_window 
	setscreenelementprops \{id = root_window
		unhide}
endscript

script menu_icon_focus \{parent = current_menu}
	on_color = [200 70 70 255]
	<id> :getsingletag scrolling_option
	<parent> :getsingletag color_scheme
	on_color = (<color_scheme>.text_focus_color)
	setscreenelementprops {
		id = {<id> child = text}
		rgba = <on_color>
		font = fontgrid_text_a6_fire material = sys_fontgrid_text_a6_fire_sys_fontgrid_text_a6_fire
		alpha = 1
	}
	if screenelementexists id = {<id> child = extra_text}
		setscreenelementprops {
			id = {<id> child = extra_text}
			rgba = <on_color>
		}
	endif
	if gotparam \{scale_highlight_text}
		if (<scale_highlight_text>)
			legacydoscreenelementmorph id = {<id> child = text} time = 0.05 scale = 1.25 relative_scale
		endif
	endif
	if screenelementexists id = <parent>
		if <parent> :getsingletag additional_focus_script
			<additional_focus_script> <...>
		endif
	endif
	if gotparam \{scrolling_option}
		<parent_anchor> :getsingletag scrolling_num_options
		menu_update_scrollbar parent = <parent> parent_anchor = <parent_anchor> option = <scrolling_option> num_options = <scrolling_num_options>
	endif
	if screenelementexists id = {<id> child = highlight}
		legacydoscreenelementmorph id = {<id> child = highlight} alpha = 1.0 time = 0.1
	endif
endscript

script menu_icon_unfocus \{parent = current_menu}
	<id> :getsingletag rgba
	<id> :getsingletag extra_rgba
	setscreenelementprops {
		id = {<id> child = text}
		rgba = <rgba>
		font = ($test_menu_font)
		material = null
	}
	if screenelementexists id = {<id> child = extra_text}
		setscreenelementprops {
			id = {<id> child = extra_text}
			rgba = <extra_rgba>
		}
	endif
	if gotparam \{scale_highlight_text}
		if (<scale_highlight_text>)
			legacydoscreenelementmorph id = {<id> child = text} time = 0.05 scale = 1.0 relative_scale
		endif
	endif
	if screenelementexists id = {<id> child = highlight}
		legacydoscreenelementmorph id = {<id> child = highlight} alpha = 0.0 time = 0.5
	endif
	if screenelementexists \{id = current_menu}
		if <parent> :getsingletag additional_unfocus_script
			<additional_unfocus_script> <...>
		endif
	endif
endscript

script split_text_into_menu 
	requireparams \{[
			parent
			text
		]
		all}
	createscreenelement {
		type = hmenu
		parent = <parent>
		<...>
	}
	menu_id = <id>
	stringtochararray string = <text>
	getarraysize <char_array>
	if (<array_size>)
		i = 0
		begin
		createscreenelement {
			type = textelement
			font = fontgrid_text_a3
			<text_params>
			parent = <menu_id>
			text = (<char_array> [<i>])
		}
		i = (<i> + 1)
		repeat <array_size>
	endif
	getscreenelementchildren id = <menu_id>
	return {menu_id = <menu_id> text_element_array = <children> text_element_array_size = <array_size>}
endscript
