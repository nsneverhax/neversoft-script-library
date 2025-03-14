
script sliderbar_rescale_to_bar 
	<target1> = ((<value> - <min>) / (<max> - <min>))
	<target2> = (<right> - <left>)
	<target3> = (<target1> * <target2>)
	<rescaled_value> = (<target3> + <left>)
	return x_val = <rescaled_value>
endscript

script sliderbar_add_item \{tab = tab1
		font = fontgrid_text_a3
		icon_rgba = [
			127
			102
			0
			128
		]
		icon_scale = 0
		icon_pos = (22.0, 9.0)
		text_just = [
			center
			center
		]
		text_pos = (0.0, 0.0)
		arrow_pos_up = (0.0, 8.0)
		arrow_pos_down = (0.0, -8.0)
		arrow_rgba = [
			100
			90
			80
			255
		]
		up_arrow_texture = up_arrow
		down_arrow_texture = down_arrow
		dims = (0.0, 20.0)}
	if gotparam \{is_enabled_script}
		<is_enabled_script>
		if (<success> = 0)
			return
		endif
	endif
	switch <tab>
		case tab1
		<bar_scale> = (0.91999996, 1.2)
		case tab2
		<bar_scale> = (0.85, 1.2)
		case tab3
		<bar_scale> = (0.78, 1.2)
		<font> = dialog
	endswitch
	setscreenelementlock \{id = current_menu
		off}
	if NOT gotparam \{pad_choose_params}
		<pad_choose_params> = <...>
	endif
	if gotparam \{index}
		if gotparam \{pad_choose_params}
			<pad_choose_params> = (<pad_choose_params> + {parent_index = <index>})
		else
			<pad_choose_params> = {parent_index = <index>}
		endif
	endif
	<z_priority> = 300
	createscreenelement {
		type = containerelement
		parent = current_menu
		id = <anchor_id>
		dims = <dims>
		event_handlers = [{focus <focus_script> params = <focus_params>}
			{unfocus <unfocus_script> params = <unfocus_params>}
			{pad_choose <pad_choose_script> params = <pad_choose_params>}
		]
		<not_focusable>
		z_priority = <z_priority>
	}
	<parent_id> = <id>
	if gotparam \{index}
		setscreenelementprops {
			id = <parent_id>
			tags = {tag_grid_x = <index>}
		}
	endif
	if gotparam \{not_focusable}
		<rgba> = [60 60 60 100]
	else
		rgba = [128 128 128 240]
	endif
	createscreenelement {
		type = textelement
		parent = <parent_id>
		font = fontgrid_text_a3
		text = <text>
		scale = 0.5
		rgba = [128 , 128 , 128 , 255]
		just = <text_just>
		pos = <text_pos>
		shadow
		shadow_rgba = $ui_text_shadow_color
		shadow_offs = (1.0, 1.0)
		replace_handlers
		<not_focusable>
	}
	highlight_angle = 0
	createscreenelement {
		type = spriteelement
		parent = <parent_id>
		texture = de_highlight_bar
		pos = (-25.0, -7.0)
		rgba = [0 0 0 0]
		just = [center center]
		scale = (1.9, 0.7)
		z_priority = (3 -1)
		rot_angle = <highlight_angle>
	}
	<pos> = (-9.0, 0.0)
	if gotparam \{bar_pos}
		<pos> = <bar_pos>
	endif
	bar_rgba = [100 90 80 255]
	createscreenelement {
		type = spriteelement
		parent = <parent_id>
		z_priority = (<z_priority> - 2)
		pos = (<pos> + (0.0, 2.0))
		scale = (1.2, 1.0)
		texture = menu_highlight
		rgba = [200 200 200 255]
	}
	legacydoscreenelementmorph id = <id> alpha = 0 time = 0
	if NOT gotparam \{arrow_scale}
		arrow_scale = 0.0
	endif
	createscreenelement {
		type = containerelement
		parent = <anchor_id>
		just = [center bottom]
		dims = {200 , 200}
		pos = <arrow_pos_down>
	}
	createscreenelement {
		type = spriteelement
		parent = <id>
		id = <down_arrow_id>
		texture = <down_arrow_texture>
		rgba = <arrow_rgba>
		scale = <arrow_scale>
	}
	createscreenelement {
		type = containerelement
		parent = <anchor_id>
		just = [center top]
		dims = {200 , 200}
		pos = <arrow_pos_up>
	}
	createscreenelement {
		type = spriteelement
		parent = <id>
		id = <up_arrow_id>
		texture = <up_arrow_texture>
		rgba = <arrow_rgba>
		scale = <arrow_scale>
	}
	if gotparam \{child_texture}
		createscreenelement {
			type = spriteelement
			parent = <parent_id>
			texture = <child_texture>
			pos = <icon_pos>
			rgba = <icon_rgba>
			scale = <icon_scale>
			id = <icon_id>
		}
	endif
	setscreenelementlock \{id = current_menu
		on}
endscript

script sliderbar_add_text_item 
	setscreenelementlock \{id = current_menu
		off}
	createscreenelement {
		type = containerelement
		parent = current_menu
		event_handlers = [{focus sliderbar_focus_text_item params = <focus_params>}
			{unfocus sliderbar_unfocus_text_item}
			{pad_choose <pad_choose_script> params = <pad_choose_params>}
		]
		dims = (0.0, 20.0)
	}
	<parent_id> = <id>
	createscreenelement {
		type = textelement
		parent = <parent_id>
		font = fontgrid_text_a3
		text = <text>
		scale = 0.5
		rgba = [128 , 128 , 128 , 255]
		just = [center top]
		pos = (-6.0, -6.0)
		shadow
		shadow_rgba = $ui_text_shadow_color
		shadow_offs = (1.0, 1.0)
	}
	bar_rgba = [100 90 80 255]
	createscreenelement {
		type = spriteelement
		parent = <parent_id>
		z_priority = 1
		scale = (8.0, 0.75)
		pos = (-34.0, 2.0)
		texture = roundbar_middle
		rgba = <bar_rgba>
	}
	legacydoscreenelementmorph id = <id> alpha = 0 time = 0
	setscreenelementlock \{id = current_menu
		on}
endscript

script sliderbar_focus_text_item 
	obj_getid
	id = <objid>
	on_color = [128 123 20 255]
	setscreenelementprops {
		id = {<id> child = 0}
		rgba = [90 80 70 255]
		shadow_rgba = [0 , 0 , 0 , 0]
	}
	legacydoscreenelementmorph id = {<id> child = 1} alpha = 1 time = 0
endscript

script sliderbar_unfocus_text_item 
	obj_getid
	id = <objid>
	setscreenelementprops {
		id = {<id> child = 0}
		rgba = [110 110 110 255]
		shadow_rgba = $ui_text_shadow_color
	}
	legacydoscreenelementmorph id = {<id> child = 1} alpha = 0 time = 0
endscript

script guitar_select_handler_change 
	launchevent \{type = unfocus
		target = current_menu}
	cap_focus_script up_arrow_id = <up_arrow_id> down_arrow_id = <down_arrow_id> color_bar_id = <color_bar_id>
	if NOT screenelementexists \{id = guitar_selection_element}
		createscreenelement {
			type = containerelement
			id = guitar_selection_element
			parent = root_window
			event_handlers = [
				{pad_up <pad_up_handler> params = <handler_params>}
				{pad_down <pad_down_handler> params = <handler_params>}
				{pad_right <pad_up_handler> params = <handler_params>}
				{pad_left <pad_down_handler> params = <handler_params>}
				{pad_choose guitar_select_handler_change_return params = {vmenu_id = <vmenu_id>}}
				{pad_back guitar_select_handler_change_return params = {vmenu_id = <vmenu_id>}}
			]
			z_priority = <z_priority>
		}
		launchevent \{type = focus
			target = guitar_selection_element}
	endif
endscript

script guitar_select_handler_change_return 
	launchevent \{type = unfocus
		target = guitar_selection_element}
	if screenelementexists \{id = guitar_selection_element}
		destroyscreenelement \{id = guitar_selection_element}
	endif
	launchevent \{type = focus
		target = current_menu}
endscript
