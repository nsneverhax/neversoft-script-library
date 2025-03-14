theme_menu_bg_parts_height = 23

script build_theme_sub_title {parent = current_menu_anchor
		title_scale = 0.7
		pos = (0.0, 0.0)
		real_pos = (60.0, 20.0)
		z_priority = 10
		right_bracket_z = 1
		right_bracket_alpha = 1.0
		rot = 0
		real_just = [left top]
		title_bg_width = 0.7
	}
	if screenelementexists id = submenu_title_anchor
		destroyscreenelement id = submenu_title_anchor
	endif
	if NOT gotparam static
		if infrontend
			pos = (0.0, 0.0)
			right_bracket_alpha = 0
		endif
	endif
	if gotparam from_cas
		make_cas_bg_elements
	endif
	createscreenelement {
		type = containerelement
		parent = <parent>
		id = submenu_title_anchor
		pos = <pos>
		just = [left top]
	}
	if NOT gotparam title
		printf "WARNING: build_theme_sub_title called without a 'title' param"
		return
	endif
	<title_color> = ($cas_color_scheme.title_color)
	createscreenelement {
		type = textelement
		parent = submenu_title_anchor
		id = title_text
		pos = <real_pos>
		just = <real_just>
		font = text_a1
		text = <title>
		scale = <title_scale>
		z_priority = (<z_priority> + 1)
		rgba = <title_color>
		rot_angle = <rot>
	}
	if gotparam max_width
		truncate_string id = title_text max_width = <max_width>
	endif
	if gotparam add_tab
		tab_color = [30 30 30 255]
		getscreenelementdims id = title_text
		<initial_pos> = (((1500 - <width> - 20) * (1.0, 0.0)) + (40 * (0.0, 1.0)))
		createscreenelement {
			type = spriteelement
			parent = submenu_title_anchor
			texture = goal_tab
			rgba = <tab_color>
			scale = (1.0, 1.3499999)
			pos = <initial_pos>
			alpha = 1
			just = [left top]
			z_priority = 1
		}
		doscreenelementmorph id = <id> pos = (<initial_pos> - (900.0, 0.0)) time = 0.3
		createscreenelement {
			type = spriteelement
			parent = submenu_title_anchor
			texture = goal_tab_extra
			rgba = <tab_color>
			scale = ((((<width> + 80) / 32) * (1.0, 0.0)) + (1.3499999 * (0.0, 1.0)))
			pos = (<initial_pos> + (25.0, 0.0))
			alpha = 1
			just = [left top]
			z_priority = 2
		}
		doscreenelementmorph id = <id> pos = (<initial_pos> - (875.0, 0.0)) time = 0.3
	endif
	if gotparam add_bar
		bg_color = [25 25 25 255]
		createscreenelement {
			type = spriteelement
			parent = submenu_title_anchor
			texture = de_highlight_bar
			pos = (0.0, 68.0)
			rgba = <bg_color>
			just = [center center]
			scale = (11.0, 1.1)
			z_priority = -1
			alpha = 0.6
		}
	endif
	if NOT gotparam no_grad_bar
		<title_bg_rgba> = ($cas_color_scheme.title_bg)
		createscreenelement {
			type = containerelement
			parent = submenu_title_anchor
			id = grad_bar
			pos = (55.0, 7.0)
			just = [center center]
			z_priority = 0
		}
		createscreenelement {
			type = spriteelement
			parent = grad_bar
			texture = menu_headerbar
			pos = (0.0, 43.0)
			just = [left bottom]
			scale = ((0.0, 0.9) + (<title_bg_width> * (1.0, 0.0)))
			rgba = <title_bg_rgba>
			z_priority = 0
		}
	endif
endscript

script build_top_and_bottom_blocks {top_pos = (0.0, -29.0)
		bot_pos = (0.0, 474.0)
		top_z = 1
		bot_z = 5
		parent = current_menu_anchor
		scale = (1.2, 2.05)
		rgba = [100 100 100 128]
	}
	printf "build_top_and_bottom_blocks is deprecated"
	if NOT gotparam static
		if infrontend
			scale = (1.2, 1.4499999)
		endif
	endif
	setscreenelementlock off id = <parent>
	if NOT gotparam double
		if screenelementexists id = top_block_anchor
			destroyscreenelement id = top_block_anchor
			destroyscreenelement id = bottom_block_anchor
		endif
		top_block_anchor = top_block_anchor
		bottom_block_anchor = bottom_block_anchor
	else
		top_block_anchor = top_block_anchor2
		bottom_block_anchor = bottom_block_anchor2
	endif
	highlight_rgba = [128 123 20 255]
	alt_rgba = [17 67 92 255]
	createscreenelement {
		type = containerelement
		parent = <parent>
		id = <top_block_anchor>
		pos = <top_pos>
	}
	createscreenelement {
		type = spriteelement
		parent = <top_block_anchor>
		texture = strip_1
		rgba = [40 40 40 128]
		just = [left top]
		pos = (0.0, 0.0)
		scale = <scale>
		z_priority = <top_z>
	}
	top_first_id = <id>
	GetStackedScreenElementPos x id = <id>
	createscreenelement {
		type = spriteelement
		parent = <top_block_anchor>
		texture = strip_2
		rgba = [40 40 40 128]
		just = [left top]
		pos = <pos>
		scale = <scale>
		z_priority = <top_z>
	}
	GetStackedScreenElementPos x id = <id>
	createscreenelement {
		type = spriteelement
		parent = <top_block_anchor>
		texture = strip_3
		rgba = [40 40 40 128]
		just = [left top]
		pos = <pos>
		scale = <scale>
		z_priority = <top_z>
	}
	GetStackedScreenElementPos x id = <id>
	createscreenelement {
		type = spriteelement
		parent = <top_block_anchor>
		texture = strip_4
		rgba = [40 40 40 128]
		just = [left top]
		pos = <pos>
		scale = <scale>
		z_priority = <top_z>
	}
	GetStackedScreenElementPos x id = <id>
	createscreenelement {
		type = spriteelement
		parent = <top_block_anchor>
		texture = strip_5
		rgba = [40 40 40 128]
		just = [left top]
		pos = <pos>
		scale = <scale>
		z_priority = <top_z>
	}
	GetStackedScreenElementPos x id = <id>
	createscreenelement {
		type = spriteelement
		parent = <top_block_anchor>
		texture = strip_6
		rgba = [40 40 40 128]
		just = [left top]
		pos = <pos>
		scale = <scale>
		z_priority = <top_z>
	}
	GetStackedScreenElementPos x id = <id>
	createscreenelement {
		type = spriteelement
		parent = <top_block_anchor>
		texture = strip_7
		rgba = [40 40 40 128]
		just = [left top]
		pos = <pos>
		scale = <scale>
		z_priority = <top_z>
	}
	GetStackedScreenElementPos x id = <id>
	createscreenelement {
		type = spriteelement
		parent = <top_block_anchor>
		texture = strip_8
		rgba = [40 40 40 128]
		just = [left top]
		pos = <pos>
		scale = <scale>
		z_priority = <top_z>
	}
	GetStackedScreenElementPos x id = <id>
	createscreenelement {
		type = spriteelement
		parent = <top_block_anchor>
		texture = strip_9
		rgba = [40 40 40 128]
		just = [left top]
		pos = <pos>
		scale = <scale>
		z_priority = <top_z>
	}
	GetStackedScreenElementPos x id = <id>
	createscreenelement {
		type = spriteelement
		parent = <top_block_anchor>
		texture = strip_10
		rgba = [40 40 40 128]
		just = [left top]
		pos = <pos>
		scale = <scale>
		z_priority = <top_z>
	}
	createscreenelement {
		type = containerelement
		parent = <parent>
		id = <bottom_block_anchor>
		internal_just = [center center]
		pos = <bot_pos>
	}
	scale = (1.2, 1.6)
	createscreenelement {
		type = spriteelement
		parent = <bottom_block_anchor>
		texture = strip_10
		rgba = [40 40 40 128]
		just = [left top]
		pos = (0.0, 0.0)
		scale = <scale>
		z_priority = <bot_z>
		rot_angle = 180
	}
	bot_first_id = <id>
	GetStackedScreenElementPos x id = <id>
	createscreenelement {
		type = spriteelement
		parent = <bottom_block_anchor>
		texture = strip_9
		rgba = [40 40 40 128]
		just = [left top]
		pos = <pos>
		scale = <scale>
		z_priority = <bot_z>
		rot_angle = 180
	}
	GetStackedScreenElementPos x id = <id>
	createscreenelement {
		type = spriteelement
		parent = <bottom_block_anchor>
		texture = strip_8
		rgba = [40 40 40 128]
		just = [left top]
		pos = <pos>
		scale = <scale>
		z_priority = <bot_z>
		rot_angle = 180
	}
	GetStackedScreenElementPos x id = <id>
	createscreenelement {
		type = spriteelement
		parent = <bottom_block_anchor>
		texture = strip_7
		rgba = [40 40 40 128]
		just = [left top]
		pos = <pos>
		scale = <scale>
		z_priority = <bot_z>
		rot_angle = 180
	}
	GetStackedScreenElementPos x id = <id>
	createscreenelement {
		type = spriteelement
		parent = <bottom_block_anchor>
		texture = strip_6
		rgba = [40 40 40 128]
		just = [left top]
		pos = <pos>
		scale = <scale>
		z_priority = <bot_z>
		rot_angle = 180
	}
	GetStackedScreenElementPos x id = <id>
	createscreenelement {
		type = spriteelement
		parent = <bottom_block_anchor>
		texture = strip_5
		rgba = [40 40 40 128]
		just = [left top]
		pos = <pos>
		scale = <scale>
		z_priority = <bot_z>
		rot_angle = 180
	}
	GetStackedScreenElementPos x id = <id>
	createscreenelement {
		type = spriteelement
		parent = <bottom_block_anchor>
		texture = strip_4
		rgba = [40 40 40 128]
		just = [left top]
		pos = <pos>
		scale = <scale>
		z_priority = <bot_z>
		rot_angle = 180
	}
	GetStackedScreenElementPos x id = <id>
	createscreenelement {
		type = spriteelement
		parent = <bottom_block_anchor>
		texture = strip_3
		rgba = [40 40 40 128]
		just = [left top]
		pos = <pos>
		scale = <scale>
		z_priority = <bot_z>
		rot_angle = 180
	}
	GetStackedScreenElementPos x id = <id>
	createscreenelement {
		type = spriteelement
		parent = <bottom_block_anchor>
		texture = strip_2
		rgba = [40 40 40 128]
		just = [left top]
		pos = <pos>
		scale = <scale>
		z_priority = <bot_z>
		rot_angle = 180
	}
	GetStackedScreenElementPos x id = <id>
	createscreenelement {
		type = spriteelement
		parent = <bottom_block_anchor>
		texture = strip_1
		rgba = [40 40 40 128]
		just = [left top]
		pos = <pos>
		scale = <scale>
		z_priority = <bot_z>
		rot_angle = 180
	}
	if NOT gotparam no_lines
		GetStackedScreenElementPos y id = <top_first_id> offset = (0.0, -3.0)
		createscreenelement {
			type = spriteelement
			parent = <top_block_anchor>
			texture = streak_2
			rgba = [0 0 0 0]
			just = [left top]
			pos = <pos>
			scale = (12.0, 0.85)
			z_priority = (<top_z> + 1)
			alpha = 0.6
		}
		createscreenelement {
			type = spriteelement
			parent = <bottom_block_anchor>
			texture = streak_2
			rgba = [0 0 0 0]
			just = [left top]
			pos = (0.0, -105.0)
			scale = (12.0, 0.85)
			z_priority = (<bot_z> + 1)
		}
	endif
endscript

script pause_menu_gradient parent = root_window
	if infrontend
		return
	endif
	if screenelementexists id = pause_gradient
		destroyscreenelement id = pause_gradient
	endif
	if gotparam off
		return
	endif
	setscreenelementlock off id = <parent>
	if gotparam right
		createscreenelement {
			type = spriteelement
			parent = <parent>
			id = pause_gradient
			texture = white3
			scale = (12.0, 6.0)
			rgba = [0 0 0 190]
			pos = (262.0, -60.0)
			rot_angle = 0
			just = [left top]
			z_priority = -50
		}
	else
		createscreenelement {
			type = spriteelement
			parent = <parent>
			id = pause_gradient
			texture = white3
			rgba = [0 0 0 230]
			rot_angle = 179.9
			dims = (1300.0, 740.0)
			pos = (1280.0, 720.0)
			just = [top left]
			z_priority = -50
		}
	endif
endscript

script make_new_themed_sub_menu dims = (300.0, 300.0) pos = (215.0, 72.0) menu_id = sub_menu vmenu_id = sub_vmenu right_bracket_z = 1
	if infrontend
		if NOT gotparam skateshop_pos
			pos = (100.0, 70.0)
		else
			pos = <skateshop_pos>
		endif
	endif
	if objectexists id = current_menu_anchor
		generic_menu_animate_out
		destroyscreenelement id = current_menu_anchor
	endif
	goalmanager_hidepoints
	setscreenelementlock id = root_window off
	createscreenelement {
		type = containerelement
		parent = root_window
		id = menu_parts_anchor
		dims = (640.0, 480.0)
		pos = (320.0, 240.0)
	}
	if gotparam scrolling
		type = vscrollingmenu
		scrolling_menu_id = sub_scrolling_menu
	endif
	make_new_menu {
		pos = <pos>
		parent = menu_parts_anchor
		internal_just = [left center]
		menu_id = <menu_id>
		vmenu_id = <vmenu_id>
		scrolling_menu_id = <scrolling_menu_id>
		type = <type>
		dims = <dims>
		dont_allow_wrap = <dont_allow_wrap>
		<no_menu_title>
	}
	if gotparam scale_highlight_text
		<vmenu_id> :settags scale_highlight_text = <scale_highlight_text>
	endif
	assignalias id = menu_parts_anchor alias = current_menu_anchor
	if gotparam from_cas
		make_cas_bg_elements
	endif
	if NOT gotparam helper_text
		create_helper_text {helper_text_elements = [{text = "\\m1 BACK"}
				{text = "\\m0 ACCEPT"}
			]
		}
	else
		create_helper_text <helper_text>
	endif
	if (ui_enable_new_system = 0)
		kill_start_key_binding
	endif
	if NOT gotparam no_grad_bar
		build_theme_sub_title title = <title> right_bracket_z = <right_bracket_z> right_bracket_alpha = <right_bracket_alpha> title_scale = <title_scale>
	else
		build_theme_sub_title title = <title> no_grad_bar right_bracket_z = <right_bracket_z> right_bracket_alpha = <right_bracket_alpha> title_scale = <title_scale>
	endif
endscript

script finish_themed_sub_menu \{menu = sub_menu
		end_pos = (320.0, 240.0)
		time = 0.2}
	change \{widest_menu_item_width = 0}
	if NOT gotparam \{no_sound}
	endif
	generic_menu_animate_in force pos = <end_pos> menu = <menu> no_wait
	launchevent type = focus target = <menu>
endscript

script theme_menu_add_item {parent = current_menu
		font = text_a1
		highlight_bar_scale = (2.1, 0.7)
		highlight_bar_pos = (90.0, -7.0)
		text_just = [right center]
		focus_script = main_theme_focus
		unfocus_script = main_theme_unfocus
		text_pos = (95.0, -5.0)
		dims = (200.0, 20.0)
		pad_choose_script = nullscript
		text_alpha = 1.0
		scale = 1.0
		z_priority = 3
	}
	if NOT gotparam text_rgba
		text_rgba = [128 128 128 240]
	endif
	if NOT gotparam line_rgba
		line_rgba = [128 123 20 255]
	endif
	if gotparam first_item
		focus_params = {first_item text_rgba = <text_rgba> text_alpha = <text_alpha> highlighted_text_rgba = <highlighted_text_rgba> <focus_params>}
	else
		if gotparam last_item
			focus_params = {last_item text_rgba = <text_rgba> text_alpha = <text_alpha> highlighted_text_rgba = <highlighted_text_rgba> <focus_params>}
		else
			focus_params = {text_rgba = <text_rgba> text_alpha = <text_alpha> highlighted_text_rgba = <highlighted_text_rgba> <focus_params>}
		endif
	endif
	if gotparam not_focusable
		createscreenelement {
			type = containerelement
			parent = <parent>
			id = <id>
			dims = <dims>
			event_handlers = [{focus <focus_script> params = <focus_params>}
				{unfocus <unfocus_script> params = <focus_params>}
			]
			replace_handlers
			not_focusable
		}
	else
		createscreenelement {
			type = containerelement
			parent = <parent>
			id = <id>
			dims = <dims>
			event_handlers = [{focus <focus_script> params = <focus_params>}
				{unfocus <unfocus_script> params = <focus_params>}
			]
			replace_handlers
		}
	endif
	<anchor_id> = <id>
	if gotparam scale_highlight_text
		<anchor_id> :settags scale_highlight_text = <scale_highlight_text>
	endif
	if NOT gotparam no_sound
		setscreenelementprops id = <anchor_id> event_handlers = [{pad_choose generic_menu_pad_choose_sound}
			{pad_choose <pad_choose_script> params = <pad_choose_params>}
		]
	else
		setscreenelementprops id = <anchor_id> event_handlers = [{pad_choose <pad_choose_script> params = <pad_choose_params>}
		]
	endif
	if gotparam pad_right_script
		setscreenelementprops {id = <anchor_id>
			event_handlers = [
				{pad_left <pad_left_script> params = {<pad_left_params>}}
				{pad_right <pad_right_script> params = {<pad_right_params>}}
			]
			replace_handlers
		}
	endif
	if gotparam mark_first_input
		setscreenelementprops {
			id = <anchor_id>
			event_handlers = [{pad_choose mark_first_input_received}
				{pad_choose generic_menu_pad_choose_sound}
				{pad_choose <pad_choose_script> params = <pad_choose_params>}
			]
			replace_handlers
		}
	endif
	if gotparam centered
		text_just = [center center]
		text_pos = (85.0, -5.0)
	endif
	if gotparam cap_text_length_please
		shortenuistring ui_string = <text> max_len = <cap_text_length_please>
		text = <short_ui_string>
	endif
	if gotparam not_focusable
		<text_rgba> = [60 60 60 75]
		createscreenelement {
			type = textelement
			parent = <anchor_id>
			id = <text_id>
			font = <font>
			text = <text>
			scale = <scale>
			pos = <text_pos>
			just = <text_just>
			rgba = <text_rgba>
			alpha = <text_alpha>
			not_focusable
			z_priority = <z_priority>
		}
	else
		createscreenelement {
			type = textelement
			parent = <anchor_id>
			id = <text_id>
			font = <font>
			text = <text>
			scale = <scale>
			pos = <text_pos>
			just = <text_just>
			rgba = <text_rgba>
			alpha = <text_alpha>
			z_priority = <z_priority>
		}
	endif
	if gotparam max_width
		truncate_string id = <id> max_width = <max_width>
	endif
	highlight_angle = 0
	if gotparam menu
		formattext checksumname = bar_id 'highlight_bar%m_%i' m = <menu> i = $middle_piece_id_num
		formattext checksumname = line_id 'text_line%m_%i' m = <menu> i = $middle_piece_id_num
		formattext checksumname = box_id 'text_box%m_%i' m = <menu> i = $middle_piece_id_num
	else
		formattext checksumname = bar_id 'highlight_bar_%i' i = $middle_piece_id_num
		formattext checksumname = line_id 'text_line_%i' i = $middle_piece_id_num
		formattext checksumname = box_id 'text_box_%i' i = $middle_piece_id_num
	endif
	if NOT gotparam no_highlight_bar
		createscreenelement {
			type = spriteelement
			parent = <anchor_id>
			id = <bar_id>
			texture = de_highlight_bar
			pos = <highlight_bar_pos>
			rgba = [0 0 0 0]
			just = [center center]
			scale = <highlight_bar_scale>
			z_priority = (<z_priority> -1)
			rot_angle = <highlight_angle>
		}
	else
		createscreenelement {
			type = containerelement
			parent = <anchor_id>
			pos = (0.0, 0.0)
		}
	endif
	if NOT gotparam no_bg
		build_theme_menu_middle {parent = <anchor_id>
			last_menu_item = <last_menu_item>
			centered = <centered>
			static_width = <static_width>
			middle_scale = <middle_scale>
			menu = <menu>
			dark_menu = <dark_menu>
			height = <item_bg_height>
		}
	else
		if gotparam first_item
			change widest_menu_item_width = 0
		endif
		createscreenelement {
			type = containerelement
			parent = <anchor_id>
			pos = (0.0, 0.0)
		}
		change middle_piece_id_num = ($middle_piece_id_num + 1)
		getscreenelementdims id = <id>
	endif
	if gotparam extra_text
		if gotparam text_block_height
			createscreenelement {
				type = textblockelement
				parent = <anchor_id>
				id = <extra_text_id>
				font = <font>
				text = <extra_text>
				scale = <scale>
				pos = (<text_pos> + (10.0, 0.0))
				just = [left top]
				internal_just = [left top]
				rgba = <text_rgba>
				z_priority = <z_priority>
				dims = (330.0, 10.0)
				allow_expansion
			}
			<bar_id> :settags text_block_height = <text_block_height>
		else
			createscreenelement {
				type = textelement
				parent = <anchor_id>
				id = <extra_text_id>
				font = <font>
				text = <extra_text>
				scale = <scale>
				pos = (<text_pos> + (10.0, 0.0))
				just = [left center]
				rgba = <text_rgba>
				z_priority = <z_priority>
			}
		endif
		if NOT gotparam ignore_width
			getscreenelementdims id = {<anchor_id> child = 3}
			if (<width> > $widest_menu_item_width)
				change widest_menu_item_width = (<width> + 15)
			endif
		endif
	else
		createscreenelement {
			type = textelement
			parent = <anchor_id>
			font = text_a1
			text = ""
			alpha = 0
		}
	endif
	if gotparam cross_it_out
		createscreenelement {
			type = spriteelement
			parent = <anchor_id>
			id = <line_id>
			texture = streak_2
			pos = <highlight_bar_pos>
			rgba = <line_rgba>
			just = [center center]
			scale = <highlight_bar_scale>
			z_priority = (<z_priority> + 1)
			rot_angle = <highlight_angle>
		}
	endif
	if gotparam box_it_up
		createscreenelement {
			type = spriteelement
			parent = <anchor_id>
			id = <box_id>
			texture = black
			pos = <highlight_bar_pos>
			rgba = [0 0 0 60]
			just = [center center]
			scale = <highlight_bar_scale>
			z_priority = <z_priority>
		}
	endif
	if NOT gotparam ignore_width
		getscreenelementdims id = {<anchor_id> child = 0}
		if (<width> > $widest_menu_item_width)
			change widest_menu_item_width = <width>
		endif
	endif
	if ((gotparam last_menu_item) || (gotparam last_item))
		if NOT gotparam static_width
			if gotparam centered
				runscriptonscreenelement id = <id> set_all_menu_items_width params = {centered menu = <menu> height = <item_bg_height>}
			else
				runscriptonscreenelement id = <id> set_all_menu_items_width params = {menu = <menu> height = <item_bg_height>}
			endif
		endif
	endif
	setscreenelementlock id = <parent> on
	setscreenelementlock id = <parent> off
endscript

script theme_menu_add_centered_item 
	theme_menu_add_item <...> centered = centered
endscript
widest_menu_item_width = 0
middle_piece_id_num = 0

script build_theme_menu_top parent = current_menu_anchor pos = (90.0, -29.0)
	createscreenelement {
		type = containerelement
		parent = <parent>
		id = <top_id>
		pos = <pos>
	}
	anchor_id = <id>
	if infrontend
		m_texture = MM_T_M
		l_texture = MM_T_L
		r_texture = MM_T_R
	else
		if gotparam dark_menu
			m_texture = spec_T_M
			l_texture = spec_T_L
			r_texture = spec_T_R
		else
			m_texture = DE_T_M
			l_texture = DE_T_L
			r_texture = DE_T_R
		endif
	endif
	createscreenelement {
		type = spriteelement
		parent = <anchor_id>
		id = <mid_id>
		texture = <m_texture>
		pos = (0.0, 0.0)
		just = [center top]
		rgba = <bg_piece_rgba>
		scale = <middle_scale>
		z_priority = 1
	}
	getscreenelementdims id = <id>
	right_pos = ((0.5, 0.0) * <width>)
	left_pos = ((-0.5, 0.0) * <width>)
	createscreenelement {
		type = spriteelement
		parent = <anchor_id>
		id = <left_id>
		texture = <l_texture>
		pos = <left_pos>
		just = [right top]
		rgba = <bg_piece_rgba>
		scale = (1.0, 1.0)
		z_priority = 1
	}
	createscreenelement {
		type = spriteelement
		parent = <anchor_id>
		id = <right_id>
		texture = <r_texture>
		pos = <right_pos>
		just = [left top]
		rgba = <bg_piece_rgba>
		scale = (1.0, 1.0)
		z_priority = 1
	}
	change widest_menu_item_width = 0
endscript

script build_theme_menu_middle pos = (90.0, -20.0) middle_scale = (2.5, 1.0) height = 1
	bg_piece_rgba = [30 30 35 216]
	if NOT gotparam menu
		formattext checksumname = mid_id 'middle_piece_%i' i = $middle_piece_id_num
		formattext checksumname = left_id 'left_piece_%i' i = $middle_piece_id_num
		formattext checksumname = right_id 'right_piece_%i' i = $middle_piece_id_num
		top_id = box_top_anchor
	else
		formattext checksumname = mid_id 'middle_piece%m_%i' i = $middle_piece_id_num m = <menu>
		formattext checksumname = left_id 'left_piece%m_%i' i = $middle_piece_id_num m = <menu>
		formattext checksumname = right_id 'right_piece%m_%i' i = $middle_piece_id_num m = <menu>
		formattext checksumname = top_id 'box_top_anchor%i' i = <menu>
	endif
	change middle_piece_id_num = ($middle_piece_id_num + 1)
	if NOT screenelementexists id = <top_id>
		build_theme_menu_top {parent = <parent>
			top_id = <top_id>
			middle_scale = <middle_scale>
			bg_piece_rgba = <bg_piece_rgba>
			mid_id = <mid_id> left_id = <left_id>
			right_id = <right_id>
			menu = <menu>
			dark_menu = <dark_menu>
		}
		return
	endif
	if gotparam last_menu_item
		build_theme_menu_bottom {parent = <parent>
			pos = <pos>
			middle_scale = <middle_scale>
			bg_piece_rgba = <bg_piece_rgba>
			mid_id = <mid_id>
			left_id = <left_id>
			right_id = <right_id>
			static_width = <static_width>
			centered = <centered>
			menu = <menu>
			dark_menu = <dark_menu>
		}
		return
	endif
	createscreenelement {
		type = containerelement
		parent = <parent>
		pos = <pos>
	}
	anchor_id = <id>
	modded_middle_scale = ((<middle_scale> - (0.0, 1.0)) + ((0.0, 1.0) * <height>))
	left_right_scale = ((1.0, 0.0) + (0.0, 1.0) * <height>)
	if infrontend
		m_texture = MM_M_M
		l_texture = MM_M_L
		r_texture = MM_M_R
	else
		if gotparam dark_menu
			m_texture = spec_M_M
			l_texture = spec_M_L
			r_texture = spec_M_R
		else
			m_texture = DE_M_M
			l_texture = DE_M_L
			r_texture = DE_M_R
		endif
	endif
	createscreenelement {
		type = spriteelement
		parent = <anchor_id>
		id = <mid_id>
		texture = <m_texture>
		pos = (0.0, 0.0)
		just = [center top]
		rgba = <bg_piece_rgba>
		scale = <modded_middle_scale>
		z_priority = 1
	}
	getscreenelementdims id = <id>
	right_pos = ((0.5, 0.0) * <width>)
	left_pos = ((-0.5, 0.0) * <width>)
	createscreenelement {
		type = spriteelement
		parent = <anchor_id>
		id = <left_id>
		texture = <l_texture>
		pos = <left_pos>
		just = [right top]
		rgba = <bg_piece_rgba>
		scale = <left_right_scale>
		z_priority = 1
	}
	createscreenelement {
		type = spriteelement
		parent = <anchor_id>
		id = <right_id>
		texture = <r_texture>
		pos = <right_pos>
		just = [left top]
		rgba = <bg_piece_rgba>
		scale = <left_right_scale>
		z_priority = 1
	}
endscript

script build_theme_menu_bottom pos = (0.0, 23.0)
	if gotparam menu
		formattext textname = con_id 'box_bottom_anchor%i' i = <menu>
	else
		con_id = box_bottom_anchor
	endif
	createscreenelement {
		type = containerelement
		parent = <parent>
		id = <con_id>
		pos = <pos>
	}
	anchor_id = <id>
	if infrontend
		m_texture = MM_B_M
		l_texture = MM_B_L
		r_texture = MM_B_R
	else
		if gotparam dark_menu
			m_texture = spec_b_m
			l_texture = spec_B_L
			r_texture = spec_B_R
		else
			m_texture = DE_B_M
			l_texture = DE_B_L
			r_texture = DE_B_R
		endif
	endif
	createscreenelement {
		type = spriteelement
		parent = <anchor_id>
		id = <mid_id>
		texture = <m_texture>
		pos = (0.0, 0.0)
		just = [center top]
		rgba = <bg_piece_rgba>
		scale = <middle_scale>
		z_priority = 1
	}
	getscreenelementdims id = <id>
	right_pos = ((0.5, 0.0) * <width>)
	left_pos = ((-0.5, 0.0) * <width>)
	createscreenelement {
		type = spriteelement
		parent = <anchor_id>
		id = <left_id>
		texture = <l_texture>
		pos = <left_pos>
		just = [right top]
		rgba = <bg_piece_rgba>
		scale = (1.0, 1.0)
		z_priority = 1
	}
	createscreenelement {
		type = spriteelement
		parent = <anchor_id>
		id = <right_id>
		texture = <r_texture>
		pos = <right_pos>
		just = [left top]
		rgba = <bg_piece_rgba>
		scale = (1.0, 1.0)
		z_priority = 1
	}
	change middle_piece_id_num = 0
endscript

script set_all_menu_items_width 
	change middle_piece_id_num = 0
	if NOT gotparam centered
		new_scale = ($widest_menu_item_width * (0.025, 0.0) + (0.0, 1.0))
		bar_scale = ($widest_menu_item_width * (0.012, 0.0) + (1.0, 0.7))
		line_scale = ($widest_menu_item_width * (0.031999998, 0.0) + (1.0, 0.3))
		box_scale = ($widest_menu_item_width * (0.64000005, 0.0) + (1.0, 6.0))
	else
		new_scale = ($widest_menu_item_width * (0.0125, 0.0) + (0.0, 1.0))
		bar_scale = ($widest_menu_item_width * (0.006, 0.0) + (1.0, 0.7))
		line_scale = ($widest_menu_item_width * (0.015999999, 0.0) + (1.0, 0.3))
		box_scale = (((<bar_scale> * 32).(1.0, 0.0)) * (1.0, 0.0) + (0.0, 6.0))
	endif
	index = 0
	begin
	if NOT gotparam menu
		formattext checksumname = mid_id 'middle_piece_%i' i = <index>
		formattext checksumname = left_id 'left_piece_%i' i = <index>
		formattext checksumname = right_id 'right_piece_%i' i = <index>
		formattext checksumname = bar_id 'highlight_bar_%i' i = <index>
		formattext checksumname = line_id 'text_line_%i' i = <index>
		formattext checksumname = box_id 'text_box_%i' i = <index>
	else
		formattext checksumname = mid_id 'middle_piece%m_%i' m = <menu> i = <index>
		formattext checksumname = left_id 'left_piece%m_%i' m = <menu> i = <index>
		formattext checksumname = right_id 'right_piece%m_%i' m = <menu> i = <index>
		formattext checksumname = bar_id 'highlight_bar%m_%i' m = <menu> i = <index>
		formattext checksumname = line_id 'text_line%m_%i' m = <menu> i = <index>
		formattext checksumname = box_id 'text_box%m_%i' m = <menu> i = <index>
	endif
	if screenelementexists id = <mid_id>
		doscreenelementmorph id = <mid_id> scale = <new_scale>
		getscreenelementdims id = <mid_id>
		right_pos = ((0.5, 0.0) * <width>)
		left_pos = ((-0.5, 0.0) * <width>)
		doscreenelementmorph id = <left_id> pos = <left_pos>
		doscreenelementmorph id = <right_id> pos = <right_pos>
	endif
	if screenelementexists id = <bar_id>
		getscreenelementprops id = <bar_id>
		if NOT ($widest_menu_item_width = 0)
			new_angle = ((<rot_angle> * 5.0) / ($widest_menu_item_width * 0.001))
			if <bar_id> :getsingletag text_block_height
				doscreenelementmorph id = <bar_id> scale = ($widest_menu_item_width * (0.012, 0.0) + (1.0, 0.0) + (<text_block_height> * (0.0, 0.7)))
			else
				doscreenelementmorph id = <bar_id> scale = <bar_scale> rot_angle = <new_angle>
			endif
			if screenelementexists id = <line_id>
				doscreenelementmorph id = <line_id> scale = <line_scale> rot_angle = <new_angle>
			endif
			if screenelementexists id = <box_id>
				doscreenelementmorph id = <box_id> scale = <box_scale>
			endif
		endif
	endif
	index = (<index> + 1)
	repeat 100
endscript
no_focus_sound = 1

script main_theme_focus 
	gettags
	if NOT gotparam highlighted_text_rgba
		highlighted_text_rgba = [128 123 20 255]
	endif
	bar_rgba = [25 25 25 255]
	if screenelementexists id = current_menu
		current_menu :getsingletag scale_highlight_text
	endif
	if screenelementexists id = current_vmenu
		current_vmenu :getsingletag scale_highlight_text
	endif
	if screenelementexists id = current_menu_anchor
		current_menu_anchor :getsingletag scale_highlight_text
	endif
	if gotparam scale_highlight_text
		doscreenelementmorph {
			id = {<id> child = 0}
			scale = <scale_highlight_text>
			relative_scale
		}
		if screenelementexists id = {<id> child = 3}
			doscreenelementmorph {
				id = {<id> child = 3}
				scale = <scale_highlight_text>
				relative_scale
			}
		endif
	endif
	doscreenelementmorph {
		id = {<id> child = 0}
		rgba = <highlighted_text_rgba>
	}
	if screenelementexists id = {<id> child = 3}
		if getscreenelementchildren id = {<id> child = 3}
			getarraysize <children>
			i = 0
			begin
			doscreenelementmorph {
				id = (<children> [<i>])
				rgba = <highlighted_text_rgba>
			}
			i = (<i> + 1)
			repeat <array_size>
		else
			doscreenelementmorph {
				id = {<id> child = 3}
				rgba = <highlighted_text_rgba>
			}
		endif
	endif
	if screenelementexists id = {<id> child = highlight_bar}
		doscreenelementmorph id = {<id> child = highlight_bar} alpha = 1
	else
		if screenelementexists id = {<id> child = 1}
			setscreenelementprops {
				id = {<id> child = 1}
				rgba = <bar_rgba>
			}
		endif
	endif
	if screenelementexists id = scrolling_menu_up_arrow
		if gotparam first_item
			doscreenelementmorph id = scrolling_menu_up_arrow alpha = 0
		else
			doscreenelementmorph id = scrolling_menu_up_arrow alpha = 1
		endif
	endif
	if screenelementexists id = scrolling_menu_down_arrow
		if gotparam last_item
			doscreenelementmorph id = scrolling_menu_down_arrow alpha = 0
		else
			doscreenelementmorph id = scrolling_menu_down_arrow alpha = 1
		endif
	endif
endscript

script main_theme_unfocus text_alpha = 1.0
	gettags
	if NOT gotparam text_rgba
		text_rgba = [128 128 128 240]
	endif
	kill_theme_highlight_sweep id = <id>
	if gotparam scale_highlight_text
		<local_scale> = {scale = 1}
	else
		<local_scale> = {}
	endif
	doscreenelementmorph {
		id = {<id> child = 0}
		rgba = <text_rgba>
		alpha = <text_alpha>
		<local_scale>
	}
	if screenelementexists id = {<id> child = 3}
		if getscreenelementchildren id = {<id> child = 3}
			getarraysize <children>
			i = 0
			begin
			doscreenelementmorph {
				id = (<children> [<i>])
				rgba = <text_rgba>
				alpha = <text_alpha>
				<local_scale>
			}
			i = (<i> + 1)
			repeat <array_size>
		else
			doscreenelementmorph {
				id = {<id> child = 3}
				rgba = <text_rgba>
				alpha = <text_alpha>
				<local_scale>
			}
		endif
	endif
	if screenelementexists id = {<id> child = highlight_bar}
		doscreenelementmorph id = {<id> child = highlight_bar} alpha = 0
	else
		if screenelementexists id = {<id> child = 1}
			setscreenelementprops {
				id = {<id> child = 1}
				rgba = [100 100 100 0]
			}
		endif
	endif
endscript

script theme_highlight_sweep 
	gettags
	if NOT screenelementexists id = {<id> child = 1}
		return
	endif
	bar_color = [25 25 25 255]
	if NOT screenelementexists id = {<id> child = {1 child = highlight}}
		setscreenelementlock id = {<id> child = 1} off
		createscreenelement {
			type = spriteelement
			parent = {<id> child = 1}
			local_id = highlight
			texture = roundbar_highlight
			pos = (0.0, 1.0)
			rgba = <bar_color>
			just = [top left]
		}
	else
		id = {<id> child = {1 child = highlight}}
	endif
	doscreenelementmorph id = <id> scale = (3.0, 1.3) time = 0
	doscreenelementmorph id = <id> pos = (0.0, 0.0) time = 0
	doscreenelementmorph id = <id> alpha = 0.5 time = 0
	begin
	doscreenelementmorph id = <id> pos = (80.0, 0.0) time = 0.45000002 anim = gentle
	wait 0.5 seconds
	doscreenelementmorph id = <id> pos = (0.0, 0.0) time = 0.45000002 anim = gentle
	wait 0.5 seconds
	repeat
endscript

script kill_theme_highlight_sweep 
	if NOT screenelementexists id = {<id> child = 1}
		return
	endif
	killspawnedscript \{name = theme_highlight_sweep}
	if screenelementexists id = {<id> child = {1 child = highlight}}
		doscreenelementmorph id = {<id> child = {1 child = highlight}} alpha = 0 time = 0
	endif
endscript

script main_theme_focus_noscale 
	gettags
	if NOT gotparam highlighted_text_rgba
		highlighted_text_rgba = [128 123 20 255]
	endif
	bar_rgba = [25 25 25 255]
	doscreenelementmorph {
		id = {<id> child = 0}
		rgba = <highlighted_text_rgba>
		relative_scale
	}
	if screenelementexists id = {<id> child = 3}
		doscreenelementmorph {
			id = {<id> child = 3}
			rgba = <highlighted_text_rgba>
			relative_scale
		}
	endif
	if screenelementexists id = {<id> child = 1}
		setscreenelementprops {
			id = {<id> child = 1}
			rgba = <bar_rgba>
		}
	endif
	if screenelementexists id = scrolling_menu_up_arrow
		if gotparam first_item
			doscreenelementmorph id = scrolling_menu_up_arrow alpha = 0
		else
			doscreenelementmorph id = scrolling_menu_up_arrow alpha = 1
		endif
	endif
	if screenelementexists id = scrolling_menu_down_arrow
		if gotparam last_item
			doscreenelementmorph id = scrolling_menu_down_arrow alpha = 0
		else
			doscreenelementmorph id = scrolling_menu_down_arrow alpha = 1
		endif
	endif
endscript

script main_theme_unfocus_noscale 
	gettags
	if NOT gotparam text_rgba
		text_rgba = [128 128 128 240]
	endif
	killspawnedscript name = text_twitch_effect
	doscreenelementmorph {
		id = {<id> child = 0}
		rgba = <text_rgba>
		alpha = <text_alpha>
	}
	if screenelementexists id = {<id> child = 3}
		doscreenelementmorph {
			id = {<id> child = 3}
			rgba = <text_rgba>
			alpha = <text_alpha>
		}
	endif
	if screenelementexists id = {<id> child = 1}
		setscreenelementprops {
			id = {<id> child = 1}
			rgba = [128 128 128 0]
		}
	endif
endscript

script theme_item_focus 
	gettags
	text_color = [128 123 20 255]
	hbar_color = [25 25 25 255]
	setscreenelementprops id = {<id> child = 0} rgba = <text_color>
	doscreenelementmorph id = {<id> child = 0} time = 0.05 scale = 1.1
	if screenelementexists id = {<id> child = 1}
		setscreenelementprops {
			id = {<id> child = 1}
			rgba = <hbar_color>
		}
	endif
	runscriptonscreenelement id = <id> text_twitch_effect params = {text_scale = <text_scale>}
endscript

script theme_item_unfocus 
	gettags
	generic_menu_pad_up_down_sound
	killspawnedscript name = text_twitch_effect
	text_color = [128 128 128 240]
	setscreenelementprops id = {<id> child = 0} rgba = <text_color>
	setscreenelementprops id = {<id> child = 0} no_blur_effect
	doscreenelementmorph id = {<id> child = 0} time = 0.05 restore_alpha scale = 1
	if screenelementexists id = {<id> child = 1}
		doscreenelementmorph id = {<id> child = 1} rgba = [0 0 0 0]
	endif
endscript

script sprite_unfocus 
	gettags
	main_theme_unfocus <...>
	theme_item_unfocus <...>
endscript

script text_twitch_effect 
	gettags
	text_color = [128 123 20 255]
	twitch_color = [90 8 10 255]
	begin
	getscreenelementdims id = {<id> child = 0}
	ScaleH = ((<width> + 5.0) / (<width>))
	doscreenelementmorph id = {<id> child = 0} time = 0.03 scale = <ScaleH> alpha = 1
	if NOT gotparam no_extra
		if screenelementexists id = {<id> child = 3}
			getscreenelementdims id = {<id> child = 3}
			if NOT (<width> = 0)
				ScaleH = ((<width> + 5.0) / (<width>))
				doscreenelementmorph id = {<id> child = 3} time = 0.03 scale = <ScaleH> alpha = 1
			endif
		endif
	endif
	wait 2 gameframe
	doscreenelementmorph id = {<id> child = 0} time = 0.01 scale = 1 alpha = 0.9
	if NOT gotparam no_extra
		if screenelementexists id = {<id> child = 3}
			doscreenelementmorph id = {<id> child = 3} time = 0.01 scale = 1 alpha = 0.9
		endif
	endif
	wait 0.23 seconds
	repeat
endscript

script text_twitch_effect2 \{scale = 1.075
		scale2 = 1.0}
	gettags
	text_color = [128 123 20 255]
	twitch_color = [90 8 10 255]
	begin
	doscreenelementmorph id = <id> time = 0.03 scale = <scale> relative_scale
	wait \{2
		frames}
	doscreenelementmorph id = <id> time = 0.01 scale = <scale2> relative_scale
	wait \{0.23
		seconds}
	repeat
endscript

script text_twitch_effect3 \{scale = 1.05
		scale2 = 1.075}
	text_twitch_effect2 <...>
endscript

script make_new_themed_scrolling_menu title = "SCROLL" dims = (300.0, 227.0) pos = (229.0, 80.0) right_bracket_z = 1
	if gotparam no_bar
		make_new_themed_sub_menu title = <title> scrolling no_bar dims = <dims> pos = <pos> right_bracket_z = <right_bracket_z>
	else
		make_new_themed_sub_menu title = <title> scrolling dims = <dims> pos = <pos> right_bracket_z = <right_bracket_z>
	endif
	arrow_rgba = [30 30 35 216]
	setscreenelementprops {
		id = sub_vmenu
		event_handlers = [{pad_up menu_vert_blink_arrow params = {id = scrolling_menu_up_arrow rgba = <arrow_rgba>}}
			{pad_down menu_vert_blink_arrow params = {id = scrolling_menu_down_arrow rgba = <arrow_rgba>}}
		]
	}
endscript

script finish_themed_scrolling_menu pos = (320.0, 85.0) time = 0.2
	getscreenelementdims id = sub_scrolling_menu
	parts = (<height> / $theme_menu_bg_parts_height)
	if NOT gotparam force_end_pos
		if infrontend
			pos = (188.0, 60.0)
		endif
	endif
	if NOT gotparam bg_width
		if NOT gotparam wide_menu
			bg_width = ($widest_menu_item_width * 0.0125)
		else
			bg_width = ($widest_menu_item_width * 0.025)
		endif
	endif
	theme_background width = <bg_width> pos = <pos> num_parts = <parts> z_priority = <z_priority> parent = sub_menu
	if screenelementexists id = bg_box_top
		createscreenelement {
			type = spriteelement
			parent = bg_box_top
			id = scrolling_menu_up_arrow
			texture = up_arrow
			pos = (0.0, 13.0)
			just = [center center]
			rgba = <bg_piece_rgba>
			scale = (0.8, 1.0)
			z_priority = 3
		}
		getscreenelementposition id = sub_scrolling_menu
		doscreenelementmorph id = sub_scrolling_menu pos = (<screenelementpos> + (0.0, 30.0))
	endif
	if screenelementexists id = bg_box_bottom
		createscreenelement {
			type = spriteelement
			parent = bg_box_bottom
			id = scrolling_menu_down_arrow
			texture = down_arrow
			pos = (0.0, -5.0)
			just = [center center]
			rgba = <bg_piece_rgba>
			scale = (0.8, 1.0)
			z_priority = 3
		}
	endif
	finish_themed_sub_menu time = <time>
endscript

script theme_background parent = current_menu_anchor id = bg_box_vmenu width = 5 pos = (320.0, 85.0) num_parts = 5 z_priority = 1 rot = 0
	build_theme_bg_thp8 parent = <parent>
	return
	num_parts = (<num_parts> + 0.3)
	if NOT gotparam bg_rgba
		<bg_rgba> = ($cas_color_scheme.item_bg_color)
	endif
	createscreenelement {
		type = vmenu
		parent = <parent>
		id = <id>
		font = text_a1
		just = [left top]
		pos = <pos>
		padding_scale = 1
		internal_scale = 1
		internal_just = [center center]
		rot_angle = <rot>
	}
	anchor_id = <id>
	middle_parts = <num_parts>
	casttointeger middle_parts
	partial_scale = (<num_parts> - <middle_parts>)
	printf "num_parts=%n partial_scale=%p" n = <num_parts> p = <partial_scale>
	build_theme_bg_top {
		parent = <anchor_id>
		width = <width>
		bg_rgba = <bg_rgba>
		z_priority = <z_priority>
		dark_menu = <dark_menu>
		static = <static>
		use_mm_parts = <use_mm_parts>
	}
	if NOT gotparam scale_part_only
		begin
		build_theme_bg_middle {
			parent = <anchor_id>
			width = <width>
			bg_rgba = <bg_rgba>
			z_priority = <z_priority>
			dark_menu = <dark_menu>
			static = <static>
			use_mm_parts = <use_mm_parts>
		}
		repeat <middle_parts>
	endif
	build_theme_bg_middle {
		parent = <anchor_id>
		width = <width>
		bg_rgba = <bg_rgba>
		scale_height = <partial_scale>
		z_priority = <z_priority>
		dark_menu = <dark_menu>
		static = <static>
		use_mm_parts = <use_mm_parts>
	}
	build_theme_bg_bottom {
		parent = <anchor_id>
		width = <width>
		bg_rgba = <bg_rgba>
		scale_height = <partial_scale>
		z_priority = <z_priority>
		dark_menu = <dark_menu>
		static = <static>
		use_mm_parts = <use_mm_parts>
	}
endscript

script build_theme_bg_top 
	<m_texture> = white
	<l_texture> = white
	<r_texture> = white
	if (<parent> = bg_box_vmenu)
		top_id = bg_box_top
	endif
	createscreenelement {
		type = containerelement
		id = <top_id>
		dims = (0.0, 32.0)
		parent = <parent>
	}
	anchor_id = <id>
	createscreenelement {
		type = spriteelement
		parent = <anchor_id>
		texture = <m_texture>
		pos = (0.0, 0.0)
		just = [center top]
		rgba = <bg_rgba>
		scale = ((1.0, 0.0) * <width> + (0.0, 1.0))
		z_priority = <z_priority>
	}
	getscreenelementdims id = <id>
	right_pos = ((0.5, 0.0) * <width>)
	left_pos = ((-0.5, 0.0) * <width>)
	createscreenelement {
		type = spriteelement
		parent = <anchor_id>
		texture = <l_texture>
		pos = <left_pos>
		just = [right top]
		rgba = <bg_rgba>
		scale = (1.0, 1.0)
		z_priority = <z_priority>
	}
	createscreenelement {
		type = spriteelement
		parent = <anchor_id>
		texture = <r_texture>
		pos = <right_pos>
		just = [left top]
		rgba = <bg_rgba>
		scale = (1.0, 1.0)
		z_priority = <z_priority>
	}
endscript

script build_theme_bg_thp8 {menu_bg_scale = (2.5, 1.0)
		menu_bg_pos = (-90.0, 0.0)
	}
	<bg_color> = ($cas_color_scheme.bg_color)
	<bg_color_glow> = ($cas_color_scheme.bg_color_glow)
	createscreenelement {
		type = containerelement
		parent = <parent>
		local_id = menu_bg_container
		just = [left top]
		pos = <menu_bg_pos>
		scale = <menu_bg_scale>
		rot_angle = RandomNoRepeat (@ 2 @ 1 @ 1.5 @ -2 @ -1 @ -1.5 )
	}
	<menu_bg_container> = <id>
	createscreenelement {
		parent = <menu_bg_container>
		type = spriteelement
		texture = CAS_list_BG_R
		pos = (65.0, 100.0)
		just = [right top]
		z_priority = (-2)
		scale = (0.5, 0.7)
		rgba = <bg_color>
		flip_h
		flip_v
	}
	createscreenelement {
		parent = <menu_bg_container>
		type = spriteelement
		texture = menu_bg
		pos = (65.0, 100.0)
		just = [left top]
		z_priority = (-2)
		scale = (1.49, 5.6)
		rgba = <bg_color>
	}
	createscreenelement {
		parent = <menu_bg_container>
		type = spriteelement
		texture = CAS_list_BG_R
		pos = (256.0, 100.0)
		just = [left top]
		z_priority = (-2)
		scale = (0.5, 0.7)
		rgba = <bg_color>
	}
	createscreenelement {
		parent = <menu_bg_container>
		type = spriteelement
		texture = menu_BG_bottom
		pos = (50.0, 279.0)
		just = [left top]
		z_priority = (-2)
		scale = (0.87, 0.75)
		rgba = <bg_color>
	}
	createscreenelement {
		type = containerelement
		local_id = glow_container
		parent = <parent>
		just = [center center]
		pos = (0.0, 0.0)
		scale = (1.0, 2.0)
	}
	<glow_container> = <id>
	createscreenelement {
		parent = <glow_container>
		type = spriteelement
		texture = menu_bg_glow
		pos = (155.0, 0.0)
		just = [right top]
		z_priority = (-1000)
		scale = (0.9, 15.0)
		flip_v
		rgba = <bg_color_glow>
	}
	createscreenelement {
		parent = <glow_container>
		type = spriteelement
		texture = menu_bg_glow
		pos = (155.0, 0.0)
		just = [left top]
		z_priority = (-1000)
		scale = (0.9, 15.0)
		rgba = <bg_color_glow>
	}
endscript

script build_theme_bg_middle scale_height = 1
	<m_texture> = white
	<l_texture> = white
	<r_texture> = white
	createscreenelement {
		type = containerelement
		parent = <parent>
		dims = ((0.0, 1.0) * ($theme_menu_bg_parts_height - 1))
	}
	anchor_id = <id>
	createscreenelement {
		type = spriteelement
		parent = <anchor_id>
		texture = <m_texture>
		pos = (0.0, 0.0)
		just = [center top]
		rgba = <bg_rgba>
		scale = ((20.0, 0.0) * <width> + <scale_height> * (0.0, 5.0))
		z_priority = <z_priority>
	}
	getscreenelementdims id = <id>
	right_pos = ((0.5, 0.0) * <width>)
	left_pos = ((-0.5, 0.0) * <width>)
	side_scale = ((1.0, 0.0) * 1 + <scale_height> * (0.0, 2.0))
	createscreenelement {
		type = spriteelement
		parent = <anchor_id>
		texture = <l_texture>
		pos = <left_pos>
		just = [right top]
		rgba = <bg_rgba>
		scale = <side_scale>
		z_priority = <z_priority>
	}
	createscreenelement {
		type = spriteelement
		parent = <anchor_id>
		texture = <r_texture>
		pos = <right_pos>
		just = [left top]
		rgba = <bg_rgba>
		scale = <side_scale>
		z_priority = <z_priority>
	}
endscript

script build_theme_bg_bottom 
	<m_texture> = white
	<l_texture> = white
	<r_texture> = white
	if (<parent> = bg_box_vmenu)
		bot_id = bg_box_bottom
	endif
	createscreenelement {
		type = containerelement
		parent = <parent>
		id = <bot_id>
		dims = (0.0, 32.0)
	}
	anchor_id = <id>
	pos = ((0.0, -1.0) * ($theme_menu_bg_parts_height - (<scale_height> * $theme_menu_bg_parts_height)))
	createscreenelement {
		type = spriteelement
		parent = <anchor_id>
		texture = <m_texture>
		pos = <pos>
		just = [center top]
		rgba = <bg_rgba>
		scale = ((1.0, 0.0) * <width> + (0.0, 1.0))
		z_priority = <z_priority>
	}
	getscreenelementdims id = <id>
	right_pos = ((0.5, 0.0) * <width> + <pos>)
	left_pos = ((-0.5, 0.0) * <width> + <pos>)
	createscreenelement {
		type = spriteelement
		parent = <anchor_id>
		texture = <l_texture>
		pos = <left_pos>
		just = [right top]
		rgba = <bg_rgba>
		scale = (1.0, 1.0)
		z_priority = <z_priority>
	}
	createscreenelement {
		type = spriteelement
		parent = <anchor_id>
		texture = <r_texture>
		pos = <right_pos>
		just = [left top]
		rgba = <bg_rgba>
		scale = (1.0, 1.0)
		z_priority = <z_priority>
	}
endscript
