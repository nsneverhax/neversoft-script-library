houses_colors = {
	title_color = [
		230
		230
		218
		200
	]
	background_color = [
		88
		88
		104
		65
	]
	text_color = [
		210
		54
		54
		230
	]
	bar_color = [
		148
		50
		58
		255
	]
	highlight_color = [
		200
		200
		200
		240
	]
}
next_color_scheme = houses_colors
next_first_focus = 0

script make_next_menu {
		menu_id = main_menu_anchor
		hmenu_id = main_menu
		pad_back_script = nullscript
		pos = (290.0, 80.0)
		dims = (20.0, 480.0)
		parent = root_window
		internal_text_just = center
		internal_text_offset = (0.0, 0.0)
		spacing = 20
		arrow_up = arrow_up
		arrow_down = arrow_down
		arrow_rgba = [220 0 170 128]
		pad_back_sound = generic_pause_exit_sound
		title_scale = (1.0, 0.2)
		title_pos = (45.0, 5.0)
		title_just = [left top]
		add_tab = 1
		title_rotation = 0
		title_rgba = ($next_color_scheme.title_color)
		left_sound_script = soundevent
		left_sound_params = {event = Pause_Menu_Scroll_LEFT_SFX}
		right_sound_script = soundevent
		right_sound_params = {event = Pause_Menu_Scroll_RIGHT_SFX}
	}
	change next_first_focus = 0
	if gotparam back_state
		pad_back_script = ui_change_state
		pad_back_params = {state = <back_state>}
	endif
	change next_menu_coord = next_menu_default_coord
	if gotparam coord_array
		change next_menu_coord = <coord_array>
	endif
	setscreenelementlock id = <parent> off
	if NOT gotparam keep_current
		if objectexists id = current_menu_anchor
			destroyscreenelement id = current_menu_anchor
		endif
	else
		if gotparam fade_out_current
			doscreenelementmorph id = current_menu_anchor alpha = 0 time = 0
		endif
	endif
	createscreenelement {
		type = containerelement
		parent = <parent>
		id = <menu_id>
		exclusive_device = <exclusive_device>
		just = [left center]
		pos = (0.0, 128.0)
		focusable_child = <hmenu_id>
	}
	assignalias id = <menu_id> alias = current_menu_anchor
	if gotparam title
		if NOT gotparam title_rgba
			title_rgba = [240 240 240 240]
		endif
		createscreenelement {
			type = textelement
			parent = current_menu_anchor
			local_id = title
			font = text_a1
			text = <title>
			rgba = <title_rgba>
			scale = <title_scale>
			pos = <title_pos>
			just = <title_just>
			rot_angle = <title_rotation>
			font_spacing = 3
		}
	endif
	if gotparam scrolling
		if NOT gotparam arrow_pos
			<arrow_pos> = (<pos> + ((<dims>.(1.0, 0.0)) / 2) * (1.0, 0.0))
		endif
		createscreenelement {
			type = spriteelement
			parent = current_menu_anchor
			id = <arrow_up>
			texture = up_arrow
			pos = <arrow_pos>
			just = [center bottom]
			z_priority = 8
			scale = 1
			rgba = <arrow_rgba>
		}
		<scroll_menu_pos> = (<pos> + (0.0, 18.0))
		<scroll_menu_dims> = (<dims> + (0.0, -36.0))
		createscreenelement {
			type = vscrollingmenu
			parent = current_menu_anchor
			dims = <scroll_menu_dims>
			pos = <scroll_menu_pos>
			just = [left top]
		}
		<parent_id> = <id>
		assignalias id = <parent_id> alias = current_scrolling_menu
		<arrow_pos> = (<arrow_pos> + ((<scroll_menu_dims>.(0.0, 1.0)) * (0.0, 1.0)))
		createscreenelement {
			type = spriteelement
			parent = current_menu_anchor
			id = <arrow_down>
			texture = down_arrow
			pos = <arrow_pos>
			just = [center top]
			z_priority = 8
			scale = 1
			rgba = <arrow_rgba>
		}
		<hmenu_pos> = (0.0, 0.0)
	else
		<parent_id> = current_menu_anchor
		<hmenu_pos> = <pos>
	endif
	if gotparam dont_allow_wrap
		dont_allow_wrap = dont_allow_wrap
	endif
	createscreenelement {
		type = vmenu
		parent = <parent_id>
		id = <hmenu_id>
		pos = <hmenu_pos>
		font = text_a1
		just = [left top]
		internal_just = [right top]
		alpha = 0
		<dont_allow_wrap>
	}
	if gotparam no_event_handlers
		killeventhandlers
	else
		setscreenelementprops {
			id = <hmenu_id>
			event_handlers = [
				{pad_back <pad_back_sound>}
				{pad_back <pad_back_script> params = <pad_back_params>}
				{pad_up generic_menu_up_or_down_sound params = {up = 1}}
				{pad_down generic_menu_up_or_down_sound params = {down = 2}}
			]
		}
	endif
	setscreenelementprops {
		id = <hmenu_id>
		spacing_between = <spacing>
	}
	if gotparam scrolling
		setscreenelementprops {
			id = <hmenu_id>
			dims = <scroll_menu_dims>
		}
	endif
	assignalias id = <hmenu_id> alias = current_menu
	width = (<dims>.(1.0, 0.0))
	current_menu :settags internal_text_just = <internal_text_just>
	current_menu :settags internal_text_offset = <internal_text_offset>
	current_menu :settags right_edge = (<width> * (1.0, 0.0))
	current_menu :settags menu_pos = <pos>
	if gotparam no_bar_edges
		current_menu :settags no_bar_edges = 1
	endif
	if gotparam use_icons
		current_menu :settags use_icons = 1
	endif
	if NOT gotparam no_animate
		current_menu :settags animate_me = 1
	endif
	if gotparam add_3d_bg
		current_menu :settags add_3d_bg = 1
	endif
	if gotparam additional_create_script
		current_menu :settags additional_create_script = <additional_create_script>
	endif
	if gotparam additional_focus_script
		current_menu :settags additional_focus_script = <additional_focus_script>
	endif
	if gotparam additional_unfocus_script
		current_menu :settags additional_unfocus_script = <additional_unfocus_script>
	endif
	if gotparam additional_menu_create_script
		<additional_menu_create_script> <additional_menu_create_params>
	endif
	change current_next_menu_row = 0
	change current_next_menu_col = 1
endscript
current_next_menu_row = 0
current_next_menu_col = 1
max_next_menu_row = 10
next_menu_vert_padding = (0.0, -50.0)
next_menu_horz_padding = (20.0, 0.0)

script add_next_menu_item {focus_script = next_menu_item_focus
		unfocus_script = next_menu_item_unfocus
		pad_choose_sound = theme_menu_pad_choose_sound
		pad_choose_script = nullscript
		pad_choose_params = {}
		option_arrows_callback = nullscript
		additional_focus_script = nullscript
		additional_focus_params = {}
		additional_unfocus_script = nullscript
		additional_unfocus_params = {}
		scale = 0.45000002
		text_scale = (0.65000004, 0.6)
		rgba = [40 50 140 200]
		just = [right center]
		internal_just = [right center]
		parent = current_menu
		scale_highlight_text = 1
		rot = 0
		text_offset = (0.0, 0.0)
		extras_offset = (10.0, 0.0)
		arrow_offset = (10.0, 0.0)
		label_offset = (0.0, 0.0)
		text_offset = (0.0, 0.0)
		padding = 0
		font_spacing = 3
	}
	current_menu :getsingletag internal_text_just
	current_menu :getsingletag internal_text_offset
	current_menu :getsingletag right_edge
	if gotparam choose_state
		pad_choose_script = ui_change_state
		pad_choose_params = {state = <choose_state>}
	endif
	dims = (<right_edge>)
	if screenelementexists id = <id>
		removeparameter id
	endif
	if gotparam not_focusable
		<rgba> = [140 140 140 240]
		createscreenelement {
			type = containerelement
			parent = <parent>
			id = <id>
			exclusive_device = <exclusive_device>
			rot_angle = <rot>
			just = <just>
			internal_just = <internal_just>
			not_focusable
		}
	else
		createscreenelement {
			type = containerelement
			parent = <parent>
			id = <id>
			exclusive_device = <exclusive_device>
			rot_angle = <rot>
			just = <just>
			internal_just = <internal_just>
		}
		if gotparam tag_grid_x
			<id> :settags tag_grid_x = <tag_grid_x> tag_length = <length>
		else
			<id> :settags tag_length = <length>
		endif
	endif
	<container_id> = <id>
	setscreenelementprops {
		id = <container_id>
		event_handlers = [
			{focus <focus_script> params = {id = <id> scale_highlight_text = <scale_highlight_text> attract = <attract>}}
			{unfocus <unfocus_script> params = {id = <id> scale_highlight_text = <scale_highlight_text>}}
			{pad_start <pad_choose_sound>}
			{pad_choose <pad_choose_sound>}
			{pad_choose <pad_choose_script> params = <pad_choose_params>}
			{pad_start <pad_choose_script> params = <pad_choose_params>}
			{focus <additional_focus_script> params = <additional_focus_params>}
			{unfocus <additional_unfocus_script> params = <additional_unfocus_params>}
		]
	}
	<container_id> :settags my_row = ($current_next_menu_row)
	<container_id> :settags my_col = ($current_next_menu_col)
	change current_next_menu_row = ($current_next_menu_row + 1)
	if ($current_next_menu_row = $max_next_menu_row)
		change current_next_menu_row = 0
		change current_next_menu_col = ($current_next_menu_col + 1)
	endif
	<container_id> :settags text_offset = <text_offset>
	<container_id> :settags arrow_offset = <arrow_offset>
	<container_id> :settags extras_offset = <extras_offset>
	<container_id> :settags option_arrows_callback = <option_arrows_callback>
	<container_id> :settags label_offset = <label_offset>
	<container_id> :settags just = <just>
	createscreenelement {
		type = textelement
		parent = <container_id>
		local_id = text
		exclusive_device = <exclusive_device>
		font = text_a1
		text = <text>
		rgba = ($next_color_scheme.text_color)
		font_spacing = <font_spacing>
		just = [right center]
		scale = <text_scale>
		offset = 5
		z_priority = 6
	}
	if gotparam extra_text
		if gotparam option_arrows
			createscreenelement {
				type = spriteelement
				parent = <container_id>
				local_id = arrow_left
				texture = left_arrow
				rgba = <rgba>
				scale = <scale>
				just = [left center]
				internal_just = <internal_just>
			}
		endif
		createscreenelement {
			type = textelement
			parent = <container_id>
			local_id = extra_text
			shadow
			shadow_rgba = $ui_text_shadow_color
			shadow_offs = $ui_text_shadow_offset
			font = text_a1
			text = <extra_text>
			rgba = <rgba>
			just = [left center]
			internal_just = <internal_just>
		}
		if gotparam option_arrows
			createscreenelement {
				type = spriteelement
				parent = <container_id>
				local_id = arrow_right
				exclusive_device = <exclusive_device>
				texture = right_arrow
				rgba = <rgba>
				scale = <scale>
				just = [left center]
				internal_just = <internal_just>
			}
			setscreenelementprops {
				id = <container_id>
				event_handlers = [
				]
			}
			if NOT (<option_arrows_callback> = nullscript)
				setscreenelementprops {
					id = <container_id>
					event_handlers = [
					]
				}
			endif
		endif
	endif
	getscreenelementdims id = {<container_id> child = text}
	<length> = (<width> + (<padding> * <scale>))
	if gotparam extra_text
		getscreenelementdims id = {<container_id> child = extra_text}
		<length> = (<width> + <length>)
		if gotparam options_arrows
			getscreenelementdims id = {<container_id> child = left_arrow}
			<length> = (<width> + <length>)
		endif
		<length> = (<length> + <padding> * 2)
	endif
	num_segments = (<length> / 31)
	casttointeger num_segments
	if (<num_segments> = 0)
		num_segments = 1
	endif
	length = (31 * (<num_segments> + 2))
	<container_id> :settags length = <length>
	next_menu_item_get_label_origin id = <container_id>
	if checksumequals a = <internal_text_just> b = center
		opp_pos = <label_origin>
		text_just = [center center]
		text_pos = (<label_origin> + ((<length> / 2) * (1.0, 0.0)))
	else
		if checksumequals a = <internal_text_just> b = right
			opp_pos = <label_origin>
			text_just = [right center]
			text_pos = (<label_origin> + (<length> * (1.0, 0.0)))
		else
			opp_pos = (<label_origin> + (<length> * (1.0, 0.0)))
			text_just = [left center]
			text_pos = <label_origin>
		endif
	endif
	center_pos = (<label_origin> + ((<length> / 2) * (1.0, 0.0)) + (0.0, 16.0))
	bar_scale = ((<scale> * (0.0, 1.0)) + (1.0, 0.0))
	getscreenelementdims id = {<container_id> child = text}
	createscreenelement {
		type = spriteelement
		parent = <container_id>
		local_id = highlight_bar
		texture = white
		rgba = ($next_color_scheme.bar_color)
		alpha = 0
		z_priority = 4
		just = [center center]
		internal_just = <internal_just>
		scale = ((2.0, 5.2) + (10.0, 0.0))
	}
	next_item_resize id = <container_id>
	if current_menu :getsingletag use_icons
		if gotparam icon
			createscreenelement {
				type = spriteelement
				parent = <container_id>
				local_id = the_icon
				texture = <icon>
				rgba = [240 240 240 0]
				scale = (<scale> * 0.6)
				z_priority = 6
				just = <just>
			}
		else
			printf "YOU MUST SPECIFY AN ICON TO USE"
		endif
	endif
	if current_menu :getsingletag additional_create_script
		<additional_create_script> <...>
	endif
	setscreenelementlock id = <parent> on
	setscreenelementlock id = <parent> off
endscript

script next_menu_item_get_label_origin 
	<id> :getsingletag label_offset
	<id> :getsingletag length
	<id> :getsingletag just
	label_origin = <label_offset>
	if (<just> [0] = center)
		label_origin = (<label_origin> - ((<length> / 2) * (1.0, 0.0)))
	else
		if (<just> [0] = right)
			label_origin = (<label_origin> + (<length> * (1.0, 0.0)))
		endif
	endif
	return label_origin = <label_origin>
endscript

script next_menu_item_get_text_origin 
	<id> :getparentid
	<parent_id> :getsingletag internal_text_just
	<id> :getsingletag length
	<id> :getsingletag text_offset
	next_menu_item_get_label_origin id = <id>
	getscreenelementdims id = {<id> child = text}
	next_item_get_extras_width id = <id>
	new_width = (<width> + <extras_width>)
	if checksumequals a = <internal_text_just> b = center
		text_origin = (<label_origin> + ((<length> / 2) * (1.0, 0.0)) - ((<new_width> / 2) * (1.0, 0.0)))
	else
		if checksumequals a = <internal_text_just> b = right
			text_origin = (<label_origin> + (<length> * (1.0, 0.0) - (<new_width> * (1.0, 0.0))))
		else
			text_origin = (<label_origin>)
		endif
	endif
	if gotparam for_extras
		text_origin = (<text_origin> + (<width> * (1.0, 0.0)))
	endif
	text_origin = (<text_origin> + <text_offset>)
	return text_origin = <text_origin>
endscript

script next_item_get_extras_width 
	<id> :getsingletag arrow_offset
	<id> :getsingletag extras_offset
	extras_width = 0
	if screenelementexists id = {<id> child = arrow_left}
		getscreenelementdims id = {<id> child = arrow_left}
		extras_width = (<extras_width> + <width>)
		extras_width = (<extras_width> + <arrow_offset>.(1.0, 0.0))
	endif
	if screenelementexists id = {<id> child = extra_text}
		getscreenelementdims id = {<id> child = extra_text}
		extras_width = (<extras_width> + <width>)
		if screenelementexists id = {<id> child = arrow_right}
			extras_width = (<extras_width> + <arrow_offset>.(1.0, 0.0))
		endif
	endif
	if screenelementexists id = {<id> child = arrow_right}
		getscreenelementdims id = {<id> child = arrow_right}
		extras_width = (<extras_width> + <width>)
	endif
	if NOT (<extras_width> = 0)
		extras_width = (<extras_width> + <arrow_offset>.(1.0, 0.0))
	endif
	return extras_width = <extras_width>
endscript

script next_item_resize_extras 
	return
	<id> :getsingletag extras_offset
	<id> :getsingletag arrow_offset
	next_menu_item_get_label_origin id = <id>
	next_menu_item_get_text_origin for_extras id = <id>
	cur_pos = (<text_origin> + <extras_offset>)
	if screenelementexists id = {<id> child = arrow_left}
		setscreenelementprops {
			id = {<id> child = arrow_left}
			pos = <cur_pos>
		}
		getscreenelementdims id = {<id> child = arrow_left}
		cur_pos = (<cur_pos> + (<width> * (1.0, 0.0)) + <arrow_offset>)
	endif
	if screenelementexists id = {<id> child = extra_text}
		setscreenelementprops {
			id = {<id> child = extra_text}
			pos = <cur_pos>
		}
	endif
	if screenelementexists id = {<id> child = arrow_right}
		getscreenelementdims id = {<id> child = extra_text}
		cur_pos = (<cur_pos> + (<width> * (1.0, 0.0)) + <arrow_offset>)
		setscreenelementprops {
			id = {<id> child = arrow_right}
			pos = <cur_pos>
		}
	endif
endscript

script next_item_resize 
	return
	setscreenelementprops {
		id = {<id> child = text}
		just = [left center]
	}
	next_menu_item_get_text_origin id = <id>
	setscreenelementprops {
		id = {<id> child = text}
		pos = <text_origin>
	}
	next_item_resize_extras id = <id>
endscript
next_menu_coord = next_menu_default_coord

script next_menu_item_focus 
	<bar_color> = [200 180 160 255]
	<on_color> = ($next_color_scheme.highlight_color)
	setscreenelementprops {
		id = {<id> child = text}
		rgba = <on_color>
		shadow_rgba = [240 , 240 , 240 , 0]
	}
	if gotparam attract
		<attract>
	endif
	return
	<id> :getsingletag my_row
	<id> :getsingletag my_col
	<current_row> = (<my_row>)
	<current_col> = (<my_col>)
	<coord_index> = (<current_row> + (<current_col> - 1) * 4)
	getscreenelementchildren id = current_menu
	getarraysize <children>
	if (<array_size> > 10)
		<array_size> = 10
	endif
	if ($next_first_focus = 0)
		change next_first_focus = 1
		<time> = 0
	else
		<time> = 0
	endif
	<i> = 0
	begin
	(<children> [<i>]) :getsingletag my_row
	(<children> [<i>]) :getsingletag my_col
	getscreenelementdims id = {(<children> [<i>]) child = text}
	<i> = (<i> + 1)
	repeat <array_size>
	doscreenelementmorph id = {<id> child = highlight_bar} time = 0.1 alpha = 0.78
	if gotparam scale_highlight_text
		if (<scale_highlight_text>)
			doscreenelementmorph id = <id> scale = 1.5 relative_scale anim = ease_out
		endif
	endif
	if screenelementexists id = current_menu
		if current_menu :getsingletag additional_focus_script
			<additional_focus_script> <...>
		endif
	endif
	next_item_resize id = <id>
endscript

script next_menu_item_unfocus 
	<off_color> = ($next_color_scheme.text_color)
	setscreenelementprops {
		id = {<id> child = text}
		rgba = <off_color>
		shadow_rgba = $ui_text_shadow_color
	}
	doscreenelementmorph id = {<id> child = highlight_bar} time = 0.05 alpha = 0
	if gotparam scale_highlight_text
		if (<scale_highlight_text>)
			doscreenelementmorph id = <id> time = 0.05 scale = 1.0 relative_scale anim = ease_out
		endif
	endif
	if screenelementexists id = current_menu
		if current_menu :getsingletag additional_unfocus_script
			<additional_unfocus_script> <...>
		endif
	endif
	wait 0.1 seconds
	next_item_resize id = <id>
endscript

script add_next_menu_flag_item 
	if NOT gotparam id
		printf "add_next_menu_flag_item requires an id param"
		return
	endif
	if NOT gotparam flag
		printf "add_next_menu_flag_item requires a flag param"
		return
	endif
	if getglobalflag flag = <flag>
		if gotparam reverse
			extra_text = "OFF"
			reverse = reverse
		else
			extra_text = "ON"
		endif
	else
		if gotparam reverse
			extra_text = "ON"
			reverse = reverse
		else
			extra_text = "OFF"
		endif
	endif
	add_next_menu_item <...> option_arrows
	if gotparam toggle_callback
		setscreenelementprops {
			id = <id>
			event_handlers = [
				{pad_left <toggle_callback> params = {id = <id> flag = <flag> reverse = <reverse>}}
				{pad_right <toggle_callback> params = {id = <id> flag = <flag> reverse = <reverse>}}
			]
		}
	else
		setscreenelementprops {
			id = <id>
			event_handlers = [
				{pad_left next_menu_toggle_flag params = {id = <id> flag = <flag> reverse = <reverse> left}}
				{pad_right next_menu_toggle_flag params = {id = <id> flag = <flag> reverse = <reverse> right}}
			]
		}
	endif
endscript

script next_menu_toggle_flag 
	if getglobalflag flag = <flag>
		if gotparam reverse
			setscreenelementprops id = {<id> child = extra_text} text = "ON"
		else
			setscreenelementprops id = {<id> child = extra_text} text = "OFF"
		endif
		unsetglobalflag flag = <flag>
	else
		if gotparam reverse
			setscreenelementprops id = {<id> child = extra_text} text = "OFF"
		else
			setscreenelementprops id = {<id> child = extra_text} text = "ON"
		endif
		setglobalflag flag = <flag>
	endif
endscript

script next_menu_finish {
		helper_text = {
			helper_text_elements = [{text = "\\m1 BACK"}
				{text = "\\m0 ACCEPT"}
			]
		}
	}
	setscreenelementlock id = current_menu_anchor off
	create_helper_text {
		parent = root_window
		helper_pos = (640.0, 720.0)
		<helper_text>
	}
	if screenelementexists id = current_scrolling_menu
		setscreenelementprops id = current_scrolling_menu reset_window_top
	endif
	if screenelementexists id = music_track_anchor
		generic_menu_animate_in force menu = music_track_anchor no_wait
	endif
	if NOT gotparam no_display
		if objectexists id = current_menu_anchor
			doscreenelementmorph id = current_menu alpha = 1 time = 0.5
			if objectexists id = current_menu
				generic_menu_animate_in menu = current_menu no_wait
			endif
		endif
	endif
	setscreenelementlock id = current_menu_anchor on
	spawnscriptlater next_menu_refocus
endscript

script next_menu_refocus 
	wait \{1
		gameframe}
	if screenelementexists \{id = current_menu_anchor}
		launchevent \{type = unfocus
			target = current_menu_anchor}
		launchevent \{type = focus
			target = current_menu_anchor}
	endif
endscript
