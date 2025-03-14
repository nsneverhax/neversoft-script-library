screenDims = (1028.0, 700.0)

script create_generic_menu {
		element_params = {}
		element_focus_params = {}
		element_bg_params = {}
		element_bg_focus_params = {}
		scroll_params = {}
		id = main_menu_anchor
		vmenu_id = main_menu
		scroll_vmenu_id = scroll_menu
		pad_back_script = nullscript
		z_priority = 0
	}
	if NOT gotparam parent
		scriptassert "Send in a parent."
	endif
	if screenelementexists id = <id>
		destroyscreenelement id = <id>
	endif
	setscreenelementlock id = <parent> off
	createscreenelement {
		type = containerelement
		parent = <parent>
		id = <id>
		just = [left top]
		pos = (0.0, 0.0)
		dims = (0.0, 0.0)
		z_priority = <z_priority>
		tags = {
			children = 0
			vmenu_id = <vmenu_id>
			element_params = <element_params>
			element_focus_params = <element_focus_params>
			element_bg_params = <element_bg_params>
			element_bg_focus_params = <element_bg_focus_params>
			z_priority = <z_priority>
		}
		event_handlers = [
			{focus launchevent params = {type = focus target = <vmenu_id>}}
			{unfocus launchevent params = {type = unfocus target = <vmenu_id>}}
		]
	}
	set_item_properties id = <id> <...>
	if gotparam no_bg
		<id> :settags no_bg
	endif
	if gotparam scrolling
		createscreenelement {
			type = vscrollingmenu
			parent = <id>
			id = <scroll_vmenu_id>
			just = [left top]
			pos = (0.0, 0.0)
			dims = (400.0, 400.0)
		}
		set_item_properties id = <scroll_vmenu_id> <scroll_params>
		createscreenelement {
			type = vmenu
			parent = <scroll_vmenu_id>
			id = <vmenu_id>
			just = [left top]
			pos = (0.0, 0.0)
			internal_just = [left top]
		}
		if NOT gotparam no_scrollbar
			getscreenelementdims id = <scroll_vmenu_id>
			createscreenelement {
				type = containerelement
				parent = <id>
				local_id = scroll_bar
				dims = (((0.0, 1.0) * <height>) + (20.0, 0.0))
				just = [center top]
				pos = (0.0, 0.0)
				tags = {
					height = <height>
				}
			}
			createscreenelement {
				type = spriteelement
				parent = {<id> child = scroll_bar}
				local_id = vert_bar
				texture = white
				dims = (((0.0, 1.0) * <height>) + (5.0, 0.0))
				just = [center top]
				pos = (0.0, 0.0)
			}
			createscreenelement {
				type = spriteelement
				parent = {<id> child = scroll_bar}
				local_id = horz_bar
				texture = white
				dims = (20.0, 5.0)
				just = [center center]
				pos = (0.0, 0.0)
			}
		endif
	else
		createscreenelement {
			type = vmenu
			parent = <id>
			id = <vmenu_id>
			just = [left top]
			pos = (0.0, 0.0)
			internal_just = [left top]
		}
	endif
	if gotparam vmenu_params
		set_item_properties id = <vmenu_id> <vmenu_params>
	endif
endscript

script set_generic_menu_properties 
	if NOT gotparam \{id}
		scriptassert \{"send in an id."}
	endif
	if screenelementexists id = <id>
		set_item_properties id = <id> <...>
	endif
endscript

script add_vmenu_item {
		pad_choose_script = nullscript
		pad_choose_params = {}
		pad_choose_sound = nullscript
		additional_focus_script = nullscript
		additional_focus_params = {}
		focus_sound = nullscript
		additional_unfocus_script = nullscript
		additional_unfocus_params = {}
		unfocus_sound = nullscript
	}
	if NOT gotparam parent
		scriptassert "Send in the parent."
	endif
	<parent> :getsingletag children
	<parent> :settags children = (<children> + 1)
	<parent> :getsingletag vmenu_id
	if NOT gotparam element_params
		<parent> :getsingletag element_params
	endif
	if NOT gotparam element_focus_params
		<parent> :getsingletag element_focus_params
	endif
	if NOT gotparam heading
		<focus> = focusable
	else
		<focus> = not_focusable
	endif
	<vmenu_id> :gettags internal_just
	if NOT gotparam internal_just
		<internal_just> = [left top]
	endif
	createscreenelement {
		type = containerelement
		parent = <vmenu_id>
		just = [left top]
		internal_just = <internal_just>
		pos = (0.0, 0.0)
		<focus>
		event_handlers = [
			{focus generic_menu_focus}
			{unfocus generic_menu_unfocus}
			{pad_choose <pad_choose_script> params = <pad_choose_params>}
			{pad_choose <pad_choose_sound>}
			{focus <additional_focus_script> params = <additional_focus_params> parent = <parent>}
			{focus <focus_sound>}
			{unfocus <additional_unfocus_script> params = <additional_unfocus_params>}
			{unfocus <unfocus_sound>}
		]
		tags = {
			index = <children>
		}
	}
	createscreenelement {
		type = textelement
		parent = {<vmenu_id> child = <children>}
		local_id = text
		font = text_a1
		just = [left top]
		pos = (0.0, 0.0)
		text = <text>
		event_handlers = [
			{focus focus_script params = {props = <element_focus_params>}}
			{unfocus unfocus_script params = {props = <element_params>}}
		]
	}
	set_item_properties id = {<vmenu_id> child = {<children> child = text}} <element_params>
	getscreenelementdims id = {<vmenu_id> child = {<children> child = text}}
	setscreenelementprops {
		id = {<vmenu_id> child = <children>}
		dims = (((0.0, 1.0) * <height>) + ((1.0, 0.0) * <width>))
	}
	<parent> :getsingletag no_bg
	if NOT (gotparam no_bg)
		if NOT gotparam element_bg_params
			<parent> :getsingletag element_bg_params
		endif
		if NOT gotparam element_bg_focus_params
			<parent> :getsingletag element_bg_focus_params
		endif
		<parent> :getsingletag z_priority
		createscreenelement {
			type = spriteelement
			parent = {<vmenu_id> child = <children>}
			local_id = bg
			texture = white
			just = [left top]
			pos = (0.0, 0.0)
			z_priority = <z_priority>
			event_handlers = [
				{focus focus_script params = {props = <element_bg_focus_params>}}
				{unfocus unfocus_script params = {props = <element_bg_params>}}
			]
		}
		set_item_properties id = {<vmenu_id> child = {<children> child = bg}} <element_bg_params>
		<oldheight> = <height>
		<oldWidth> = <width>
		getscreenelementdims id = {<vmenu_id> child = {<children> child = bg}}
		if (<height> < <oldheight>)
			<height> = <oldheight>
		endif
		if (<width> < <oldWidth>)
			<width> = <oldWidth>
		endif
		setscreenelementprops {
			id = {<vmenu_id> child = <children>}
			dims = (((0.0, 1.0) * <height>) + ((1.0, 0.0) * <width>))
		}
	endif
endscript

script get_element_by_index 
	if NOT gotparam \{parent}
		scriptassert \{"Send in the parent."}
	endif
	<parent> :gettags vmenu_id
	if NOT screenelementexists id = {<vmenu_id> child = <index>}
		scriptassert \{'Sorry, that ScreenElement doesn\'t extst.'}
	endif
	return <child_id> = {<vmenu_id> child = <index>}
endscript

script add_menu_title 
	if NOT gotparam parent
		scriptassert "Send in the parent."
	endif
	if NOT gotparam element_params
		<parent> :getsingletag element_params
	endif
	if screenelementexists id = {<parent> child = {vmenu child = title}}
		DestoryScreenElement id = {<parent> child = {vmenu child = title}}
	endif
	<parent> :getsingletag z_priority
	createscreenelement {
		type = containerelement
		parent = <parent>
		local_id = title
		font = text_a1
		just = [left top]
		pos = (-50.0, -50.0)
		internal_just = [left center]
	}
	if gotparam title_params
		set_item_properties id = {<parent> child = title} <title_params>
	endif
	createscreenelement {
		type = textelement
		parent = {<parent> child = title}
		local_id = title_text
		font = text_a1
		just = [left center]
		pos = (0.0, 0.0)
		text = <text>
		z_priority = (<z_priority> + 4)
	}
	set_item_properties id = {<parent> child = {title child = title_text}} <element_params>
	<parent> :getsingletag no_bg
	if NOT gotparam no_bg
		if NOT gotparam element_bg_params
			<parent> :getsingletag element_bg_params
		endif
		createscreenelement {
			type = spriteelement
			parent = {<parent> child = title}
			local_id = title_bg
			texture = white
			just = [left center]
			pos = (0.0, 0.0)
			z_priority = (<z_priority> + 3)
		}
		set_item_properties id = {<parent> child = {title child = title_bg}} <element_bg_params>
	endif
endscript

script set_item_properties 
	if NOT gotparam id
		scriptassert "Send in the id."
	endif
	if gotparam dims
		setscreenelementprops {
			id = <id>
			dims = <dims>
		}
	endif
	if gotparam scale
		doscreenelementmorph {
			id = <id>
			scale = <scale>
		}
	endif
	if gotparam rot_angle
		setscreenelementprops {
			id = <id>
			rot_angle = <rot_angle>
		}
	endif
	if gotparam just
		setscreenelementprops {
			id = <id>
			just = <just>
		}
		setscreenelementprops {
			id = <id>
			pos = (0.0, 0.0)
		}
	endif
	if gotparam pos
		setscreenelementprops {
			id = <id>
			pos = <pos>
		}
	endif
	if gotparam alpha
		doscreenelementmorph {
			id = <id>
			alpha = <alpha>
		}
	endif
	if gotparam z_priority
		setscreenelementprops {
			id = <id>
			z_priority = <z_priority>
		}
	endif
	if gotparam focusable
		setscreenelementprops {
			id = <id>
			focusable
		}
	endif
	if gotparam not_focusable
		setscreenelementprops {
			id = <id>
			not_focusable
		}
	endif
	if gotparam text
		setscreenelementprops {
			id = <id>
			text = <text>
		}
	endif
	if gotparam rgba
		setscreenelementprops {
			id = <id>
			rgba = <rgba>
		}
	endif
	if gotparam internal_just
		setscreenelementprops {
			id = <id>
			internal_just = <internal_just>
		}
		<id> :settags internal_just = <internal_just>
	endif
	if gotparam regular_space_adjust
		setscreenelementprops {
			id = <id>
			regular_space_adjust = <regular_space_adjust>
		}
	endif
	if gotparam padding_scale
		setscreenelementprops {
			id = <id>
			padding_scale = <padding_scale>
		}
	endif
	if gotparam spacing_between
		setscreenelementprops {
			id = <id>
			spacing_between = <spacing_between>
		}
	endif
	if gotparam disable_pad_handling
		setscreenelementprops {
			id = <id>
			disable_pad_handling
		}
	endif
	if gotparam enable_pad_handling
		setscreenelementprops {
			id = <id>
			enable_pad_handling
		}
	endif
	if gotparam allow_wrap
		setscreenelementprops {
			id = <id>
			allow_wrap
		}
	endif
	if gotparam scroll_speed
		setscreenelementprops {
			id = <id>
			scroll_speed = <scroll_speed>
		}
	endif
endscript

script generic_menu_focus 
	gettags
	launchevent type = focus target = {<id> child = text}
	launchevent type = focus target = {<id> child = bg}
	if screenelementexists id = {<parent> child = scroll_bar}
		assignalias name = scroll_bar id = {<parent> child = scroll_bar}
		<parent> :getsingletag children
		scroll_bar :getsingletag height
		<newheight> = (<height> * (<index> / <children>))
		doscreenelementmorph {
			id = scroll_bar
			pos = ((0.0, 1.0) * <newheight>)
			time = 0.1
		}
	endif
endscript

script generic_menu_unfocus 
	gettags
	launchevent type = unfocus target = {<id> child = text}
	launchevent type = unfocus target = {<id> child = bg}
endscript

script focus_script 
	gettags
	set_item_properties id = <id> <props>
endscript

script unfocus_script 
	gettags
	set_item_properties id = <id> <props>
endscript

script ui_create_messy_background {messy_id = ui_messy_background
		parent = current_menu_anchor
		pos = (200.0, 0.0)
		dims = (800.0, 850.0)
		rot_angle = -7
		z_priority = 0
		rgba = [0 0 0 255]
		alpha = 1.0
		just = [left top]
	}
	<width> = ((<dims> [0]) * (1.0, 0.0))
	<height> = ((<dims> [1]) * (0.0, 1.0))
	<L_width> = (125.0, 0.0)
	<R_width> = (125.0, 0.0)
	<C_width> = (<width> - <L_width> - <R_width>)
	if (Random (@ 0 @ 1 )= 0)
		<left> = {texture = menu_sideA}
		if (Random (@ 0 @ 1 )= 0)
			<left> = {<left> flip_h}
		endif
		<right> = {texture = menu_sideB}
		if (Random (@ 0 @ 1 )= 0)
			<right> = {<right> flip_h}
		endif
		<l_pos> = (0.0, 0.0)
	else
		<left> = {texture = menu_sideB flip_v}
		if (Random (@ 0 @ 1 )= 0)
			<left> = {<left> flip_h}
		endif
		<right> = {texture = menu_sideA flip_v}
		if (Random (@ 0 @ 1 )= 0)
			<right> = {<right> flip_h}
		endif
		<l_pos> = (0.0, 0.0)
	endif
	ui_destroy_messy_background id = <messy_id>
	createscreenelement {
		id = <messy_id>
		parent = <parent>
		type = containerelement
		pos = <pos>
		just = <just>
		internal_just = [left top]
		dims = <dims>
		rot_angle = <rot_angle>
		z_priority = <z_priority>
	}
	createscreenelement {
		parent = <messy_id>
		type = spriteelement
		<left>
		dims = (<L_width> + <height>)
		pos = <l_pos>
		just = [left top]
		alpha = <alpha>
		rgba = <rgba>
	}
	createscreenelement {
		parent = <messy_id>
		type = spriteelement
		texture = white
		pos = <L_width>
		dims = (<C_width> + <height>)
		just = [left top]
		alpha = <alpha>
		rgba = <rgba>
	}
	createscreenelement {
		parent = <messy_id>
		type = spriteelement
		<right>
		dims = (<R_width> + <height>)
		pos = (<L_width> + <C_width>)
		just = [left top]
		alpha = <alpha>
		rgba = <rgba>
	}
	if gotparam shadow
		if NOT gotparam shadow_offs
			<shadow_offs> = (0.0, 0.0)
		endif
		createscreenelement {
			parent = <messy_id>
			type = spriteelement
			<left>
			dims = (<L_width> + <height>)
			pos = (<l_pos> + <shadow_offs>)
			just = [left top]
			alpha = <shadow_alpha>
			rgba = <shadow_rgba>
		}
		createscreenelement {
			parent = <messy_id>
			type = spriteelement
			texture = white
			pos = (<L_width> + <shadow_offs>)
			dims = (<C_width> + <height>)
			just = [left top]
			alpha = <shadow_alpha>
			rgba = <shadow_rgba>
		}
		createscreenelement {
			parent = <messy_id>
			type = spriteelement
			<right>
			dims = (<R_width> + <height>)
			pos = (<L_width> + <C_width> + <shadow_offs>)
			just = [left top]
			alpha = <shadow_alpha>
			rgba = <shadow_rgba>
		}
	endif
endscript

script ui_destroy_messy_background 
	if screenelementexists id = <id>
		destroyscreenelement id = <id>
	endif
endscript
