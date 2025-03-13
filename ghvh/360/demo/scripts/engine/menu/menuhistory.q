
script create_ui_history_header \{dims = (750.0, 128.0)
		z_priority = 20
		text = qs(0x00000000)
		menu_id = menu_history
		scale = (0.7, 0.7)
		num_icons = 3
		alpha = 0.8
		pos = (440.0, 110.0)}
	if screenelementexists \{id = main_menu_anchor}
		parent = main_menu_anchor
	else
		parent = root_window
	endif
	createscreenelement {
		type = containerelement
		parent = <parent>
		id = <menu_id>
		dims = <dims>
		pos = <pos>
		scale = <scale>
		just = [0.0 0.0]
		z_priority = <z_priority>
	}
	if (<num_icons> > 0)
		createscreenelement {
			type = spriteelement
			parent = <menu_id>
			texture = menu_history_background
			dims = (256.0, 128.0)
			scale = (2.8, 2.0)
			pos = (-50.0, -75.0)
			just = [-1.0 -1.0]
			alpha = <alpha>
		}
	else
		createscreenelement {
			type = spriteelement
			parent = <menu_id>
			texture = menu_history_background_empty
			dims = (256.0, 128.0)
			scale = (2.8, 2.0)
			pos = (-50.0, -75.0)
			just = [-1.0 -1.0]
			alpha = <alpha>
		}
	endif
	appendsuffixtochecksum base = <id> suffixstring = '_title_container'
	createscreenelement {
		type = containerelement
		parent = <menu_id>
		id = <appended_id>
		dims = (425.0, 100.0)
		just = [-1.0 -1.0]
		pos = (317.0, 15.0)
		z_priority = (<z_priority> + 3)
	}
	createscreenelement {
		type = textblockelement
		parent = <appended_id>
		font = ($test_menu_font_title)
		text = <text>
		rgba = [250 250 250 255]
		dims = (425.0, 100.0)
		pos = (-100.0, 10.0)
		just = [-1.0 -1.0]
		internal_just = [0.0 0.0]
	}
	appendsuffixtochecksum base = <id> suffixstring = '_icons_container'
	createscreenelement {
		type = containerelement
		parent = <menu_id>
		id = <appended_id>
		dims = ($menu_history_icon_container_dim)
		just = [-1.0 -1.0]
		pos = (175.0, -50.0)
		scale = 0.8
		z_priority = (<z_priority> + 3)
	}
	if (<num_icons> > 2)
		icon_space = ((($menu_history_icon_container_dim).(1.0, 0.0)) / <num_icons>)
	else
		icon_space = ((($menu_history_icon_container_dim).(1.0, 0.0)) / 3)
	endif
	icon_scale = (<icon_space> / ($menu_history_icon_size))
	ui_event_get_stack
	getarraysize <stack>
	if (<array_size> > 0)
		if structurecontains structure = (<stack> [0]) hist_tex
			texture = (<stack> [0].hist_tex)
		else
			texture = menu_history_unknown
		endif
		createscreenelement {
			type = spriteelement
			parent = <appended_id>
			texture = <texture>
			dims = (128.0, 128.0)
			just = [1.0 -1.0]
			pos = (95.0, 80.0)
			scale = 1.1
			z_priority = (<z_priority> + 3)
		}
	endif
	if ((<num_icons> > 0) && (<array_size> > 0))
		i = 1
		begin
		if NOT (<i> > (<array_size> -1))
			if structurecontains structure = (<stack> [<i>]) hist_tex
				texture = (<stack> [<i>].hist_tex)
			else
				texture = menu_history_unknown
			endif
			menu_history_decriment_alpha incr = <num_icons> index = (<i> -1)
			createscreenelement {
				type = spriteelement
				parent = <appended_id>
				texture = <texture>
				dims = (128.0, 128.0)
				scale = ((<icon_scale> * (1.0, 0.0)) + (<icon_scale> * (0.0, 1.0)))
				just = [1.0 -1.0]
				pos = ((((($menu_history_icon_container_dim).(1.0, 0.0)) - ((<i> -1) * <icon_space>)) * (1.0, 0.0)) + (0 * (0.0, 1.0)))
				rgba = <rgba>
			}
		endif
		i = (<i> + 1)
		repeat <num_icons>
	endif
endscript

script menu_history_decriment_alpha \{rgba = [
			255
			255
			255
			255
		]}
	float_incr = (<incr> * 1.0)
	alpha = (255 * (1 - (<index> / <float_incr>)))
	casttointeger \{alpha}
	setarrayelement arrayname = rgba index = 3 newvalue = <alpha>
	return rgba = <rgba>
endscript

script clean_up_menu_history_screen_elements 
	if screenelementexists \{id = menu_history}
		destroyscreenelement \{id = menu_history}
	endif
endscript
