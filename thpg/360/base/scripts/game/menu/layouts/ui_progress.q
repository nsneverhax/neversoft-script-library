
script ui_load_accolade_pak 
	kill_start_key_binding
	printf "ui_load_accolade_pak: Loading accolade pak." channel = ui
	loadpak 'pak/ui_accolades/ui_accolades.pak' heap = scratch
	printf "ui_load_accolade_pak: Load complete." channel = ui
	spawnscriptnow ui_create_progress
endscript

script ui_unload_accolade_pak 
	printf "ui_unload_accolade_pak: Unloading accolade pak." channel = ui
	unloadpak 'pak/ui_accolades/ui_accolades.pak'
	waitunloadpak
	printf "ui_unload_accolade_pak: Unload complete." channel = ui
	restore_start_key_binding
	startrendering
	spawnscriptnow ui_change_state params = {state = UIstate_view_status}
endscript

script ui_create_progress 
	printf 'UI: ui_create_progress' channel = ui
	setmenuautorepeattimes (0.3, 0.4)
	createscreenelement {
		type = containerelement
		parent = root_window
		id = progress_container
		event_handlers = [
			{pad_back ui_destroy_progress}
		]
		focusable_child = progress_menu_container
	}
	ui_create_messy_background {messy_id = ui_messy_background
		parent = progress_container
		pos = (475.0, 0.0)
		dims = (900.0, 850.0)
		rot_angle = -6
		z_priority = 1
		rgba = [200 200 200 255]
	}
	createscreenelement {
		type = textelement
		parent = progress_container
		id = progress_heading
		text = ""
		font = text_a1
		scale = (1.3, 1.0)
		pos = (610.0, 110.0)
		just = [left top]
		rgba = ($goal_ui_scheme.main)
		z_priority = 10
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (2.0, 2.0)
	}
	createscreenelement {
		type = textelement
		parent = progress_container
		id = progress_subheading
		text = ""
		font = text_a1
		pos = (610.0, 160.0)
		just = [left top]
		scale = (0.95, 0.7)
		rgba = [80 80 80 255]
		z_priority = 10
		shadow
		shadow_rgba = [0 0 0 0]
		shadow_offs = (2.0, 2.0)
	}
	createscreenelement {
		type = spriteelement
		parent = progress_container
		texture = menu_goal_underline
		pos = (600.0, 200.0)
		just = [left top]
		dims = (420.0, 8.0)
		rgba = [80 80 80 255]
		z_priority = 10
	}
	createscreenelement {
		type = textblockelement
		parent = progress_container
		id = progress_description
		text = ""
		font = text_a1
		pos = (610.0, 271.0)
		just = [left top]
		internal_just = [center top]
		dims = (600.0, 300.0)
		scale = (0.8, 0.6)
		rgba = [0 0 0 255]
		z_priority = 10
	}
	createscreenelement {
		type = textblockelement
		parent = progress_container
		text = "status"
		font = text_a1
		pos = (614.0, 485.0)
		just = [left top]
		internal_just = [left top]
		dims = (610.0, 300.0)
		scale = (0.85, 0.65000004)
		rgba = [80 80 80 255]
		z_priority = 10
		shadow
		shadow_rgba = ($goal_ui_scheme.main)
		shadow_offs = (2.0, 3.0)
	}
	createscreenelement {
		type = containerelement
		parent = progress_container
		id = bar_container
		pos = (220.0, 17.0)
		just = [left top]
	}
	createscreenelement {
		parent = bar_container
		type = spriteelement
		pos = (596.0, 518.0)
		dims = (408.0, 40.0)
		just = [center center]
		texture = white
		rgba = [80 80 80 255]
		z_priority = 3
	}
	createscreenelement {
		parent = bar_container
		type = spriteelement
		pos = (596.0, 517.0)
		dims = (398.0, 33.0)
		just = [center center]
		texture = white
		rgba = [240 240 240 255]
		z_priority = 4
	}
	createscreenelement {
		parent = bar_container
		type = spriteelement
		pos = (596.0, 517.0)
		dims = (394.0, 29.0)
		just = [center center]
		texture = white
		rgba = [80 80 80 255]
		z_priority = 5
		flip_v
	}
	createscreenelement {
		parent = bar_container
		type = spriteelement
		id = progress_bar
		pos = (399.0, 517.0)
		dims = (0.0, 29.0)
		just = [left center]
		texture = white
		rgba = ($goal_ui_scheme.main)
		z_priority = 6
		flip_v
	}
	createscreenelement {
		parent = bar_container
		type = spriteelement
		blend = add
		pos = (596.0, 517.0)
		dims = (394.0, 29.0)
		just = [center center]
		texture = vided_clip_grunge
		rgba = [80 110 110 255]
		z_priority = 7
		flip_v
	}
	createscreenelement {
		type = textblockelement
		parent = progress_container
		id = progress_percent
		text = ""
		font = text_a1
		pos = (1130.0, 513.0)
		just = [right top]
		internal_just = [right top]
		dims = (600.0, 300.0)
		scale = (1.2, 0.9)
		rgba = ($goal_ui_scheme.main)
		z_priority = 10
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (2.0, 2.0)
	}
	createscreenelement {
		type = textblockelement
		parent = progress_container
		id = progress_next
		text = ""
		font = text_a1
		pos = (1120.0, 570.0)
		just = [right top]
		internal_just = [right top]
		dims = (600.0, 300.0)
		scale = (0.77, 0.55)
		rgba = [80 80 80 255]
		z_priority = 10
		shadow
		shadow_rgba = [0 0 0 0]
		shadow_offs = (2.0, 2.0)
	}
	runscriptonscreenelement id = root_window ui_pausemenu_play_icon params = {sponsor pos = (600.0, 575.0)}
	createscreenelement {
		type = spriteelement
		parent = progress_container
		texture = cap_whitenoise
		pos = (1205.0, 135.0)
		just = [center center]
		dims = (500.0, 105.0)
		rgba = [0 0 0 255]
		rot_angle = 35
		z_priority = 3
	}
	createscreenelement {
		type = spriteelement
		parent = progress_container
		texture = cap_whitenoise_2
		pos = (1280.0, 510.0)
		just = [center center]
		dims = (200.0, 310.0)
		rgba = [0 0 0 255]
		rot_angle = 15
		z_priority = 3
	}
	createscreenelement {
		type = spriteelement
		parent = progress_container
		texture = cap_whitenoise
		pos = (1200.0, 520.0)
		just = [center center]
		dims = (400.0, -200.0)
		rgba = [0 0 0 255]
		rot_angle = -90
		z_priority = 3
	}
	createscreenelement {
		type = spriteelement
		parent = progress_container
		texture = cap_whitenoise_2
		pos = (1200.0, 100.0)
		just = [center center]
		dims = (-200.0, -200.0)
		rgba = [0 0 0 255]
		rot_angle = 90
		z_priority = 3
	}
	createscreenelement {
		type = spriteelement
		parent = progress_container
		texture = cap_whitenoise_2
		pos = (600.0, -20.0)
		just = [center center]
		dims = (-200.0, 200.0)
		rgba = [0 0 0 255]
		rot_angle = 110
		z_priority = 3
	}
	createscreenelement {
		type = spriteelement
		parent = progress_container
		texture = map_bg_vignette
		pos = (1310.0, -45.0)
		just = [left top]
		rgba = [0 0 0 120]
		dims = (400.0, 1300.0)
		rot_angle = 88
		z_priority = 2
	}
	createscreenelement {
		type = spriteelement
		parent = progress_container
		texture = map_bg_vignette
		pos = (-500.0, 930.0)
		just = [left top]
		rgba = [0 0 0 120]
		dims = (400.0, 1300.0)
		rot_angle = -101
		z_priority = 2
	}
	createscreenelement {
		type = spriteelement
		parent = progress_container
		texture = white
		pos = (0.0, 0.0)
		just = [left top]
		rgba = [0 0 0 255]
		dims = (1280.0, 720.0)
		z_priority = -5
	}
	create_helper_text $generic_helper_text_no_accept
	ui_progress_menu
	launchevent type = focus target = progress_container
endscript

script ui_destroy_progress 
	printf \{'UI: ui_destroy_progress'
		channel = ui}
	soundevent \{event = generic_menu_pad_back_sfx}
	stoprendering
	setmenuautorepeattimes \{(0.3, 0.05)}
	generic_ui_destroy
	if screenelementexists \{id = progress_container}
		destroyscreenelement \{id = progress_container}
	endif
	ui_unload_accolade_pak
endscript

script ui_progress_menu 
	if screenelementexists id = progress_menu_container
		destroyscreenelement id = progress_menu_container
	endif
	GetProgressMasterList
	<list_size> = (<array_size> + 4)
	createscreenelement {
		type = containerelement
		parent = progress_container
		id = progress_menu_container
		just = [left top]
		pos = (72.0, 72.0)
		dims = (475.0, 576.0)
		child_anchor = [left top]
		focusable_child = progress_vmenu
		event_handlers = [
			{pad_up ui_progress_blink_arrow params = {arrow = up}}
			{pad_down ui_progress_blink_arrow params = {arrow = down}}
			{pad_left ui_progress_blink_arrow params = {arrow = left}}
			{pad_right ui_progress_blink_arrow params = {arrow = right}}
		]
		passive_events
	}
	createscreenelement {
		type = windowelement
		parent = progress_menu_container
		id = progress_arrow_container
		dims = ((475.0, 576.0) * 2)
		pos = ((475.0, 576.0) * 0.5)
		just = [center center]
		child_anchor = [center center]
	}
	createscreenelement {
		type = textelement
		parent = progress_arrow_container
		local_id = up
		font = text_a1
		text = "\\b7"
		just = [center center]
		scale = (1.5, 1.3499999)
		pos = {(0.01, -0.23) proportional}
		z_priority = 30
	}
	createscreenelement {
		type = textelement
		parent = progress_arrow_container
		local_id = down
		font = text_a1
		text = "\\b4"
		just = [center center]
		scale = (1.5, 1.3499999)
		pos = {(0.01, 0.23) proportional}
		z_priority = 30
	}
	createscreenelement {
		type = textelement
		parent = progress_arrow_container
		local_id = left
		font = text_a1
		text = "\\b6"
		just = [center center]
		scale = (1.5, 1.3499999)
		pos = {(-0.225, 0.015) proportional}
		z_priority = 30
	}
	createscreenelement {
		type = textelement
		parent = progress_arrow_container
		local_id = right
		font = text_a1
		text = "\\b5"
		just = [center center]
		scale = (1.5, 1.3499999)
		pos = {(0.225, 0.015) proportional}
		z_priority = 30
	}
	createscreenelement {
		type = vmenu
		parent = progress_menu_container
		id = progress_vmenu
		z_priority = -5
		pos = (22.0, -196.0)
		dims = (450.0, 576.0)
		just = [left top]
		tags = {
			array_size = <array_size>
			list_size = <list_size>
			index = 2
		}
	}
	setscreenelementprops {
		id = progress_vmenu
		event_handlers = [
			{pad_up ui_progress_up_v params = {vmenu = <vmenu>}}
			{pad_down ui_progress_down_v params = {vmenu = <vmenu>}}
		]
	}
	if NOT (<array_size> = 0)
		ui_progress_add_v (<master_list> [(<array_size> - 2)]) vmenu = progress_vmenu index = (0) not_focusable
		secondtolast = <hmenu>
		ui_progress_add_v (<master_list> [(<array_size> - 1)]) vmenu = progress_vmenu index = (1) not_focusable
		last = <hmenu>
		<i> = 2
		<j> = 0
		begin
		ui_progress_add_v (<master_list> [(<j>)]) vmenu = progress_vmenu index = <i>
		if (<j> = 0)
			first = <hmenu>
		endif
		if (<j> = 1)
			second = <hmenu>
		endif
		if (<j> = (<array_size> - 1))
			<hmenu> :settags link = <last>
		endif
		if (<j> = (<array_size> - 2))
			<hmenu> :settags link = <secondtolast>
		endif
		<i> = (<i> + 1)
		<j> = (<j> + 1)
		repeat <array_size>
		ui_progress_add_v (<master_list> [0]) vmenu = progress_vmenu index = <i> not_focusable
		<first> :settags link = <hmenu>
		ui_progress_add_v (<master_list> [1]) vmenu = progress_vmenu index = (<i> + 1) not_focusable
		<second> :settags link = <hmenu>
	endif
endscript

script ui_progress_add_v focus = {focusable}
	formattext checksumname = hmenu '%a' a = <index>
	formattext checksumname = row 'row_%a' a = <index>
	GetProgressSubList type = <type>
	<list_size> = (<array_size> + 4)
	if gotparam not_focusable
		createscreenelement {
			type = containerelement
			parent = <vmenu>
			dims = (1200.0, 192.0)
			focusable_child = <hmenu>
			child_anchor = [center center]
			not_focusable
		}
	else
		createscreenelement {
			type = containerelement
			parent = <vmenu>
			dims = (1200.0, 192.0)
			focusable_child = <hmenu>
			child_anchor = [center center]
			event_handlers = [
				{focus ui_progress_focus_v params = {}}
				{unfocus ui_progress_unfocus_v params = {}}
			]
		}
	endif
	<parent> = <id>
	createscreenelement {
		type = windowelement
		parent = <parent>
		local_id = container
		dims = (1200.0, 1200.0)
		pos = (0.0, 0.0)
		just = [center center]
		child_anchor = [center center]
	}
	<container> = <id>
	createscreenelement {
		type = textelement
		parent = <parent>
		local_id = title
		font = text_a1
		text = <text>
		scale = (1.0, 0.8)
		rgba = [120 120 120 255]
		just = [center center]
		pos = (0.0, -60.0)
		z_priority = 2
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (2.0, 2.0)
	}
	createscreenelement {
		type = spriteelement
		parent = <container>
		local_id = bg
		texture = white
		dims = (1200.0, 179.0)
		pos = (0.0, -22.0)
		rgba = [64 64 64 255]
		z_priority = 1
	}
	createscreenelement {
		parent = <container>
		type = spriteelement
		local_id = bottom
		pos = (-25.0, 127.5)
		dims = (650.0, 60.0)
		just = [center bottom]
		texture = vided_toolbar_top
		rgba = [64 64 64 255]
		z_priority = 1
		Random (@ flip_v @ )
	}
	createscreenelement {
		parent = <container>
		type = spriteelement
		local_id = bottom_shadow
		pos = (-50.0, 82.0)
		dims = (650.0, 60.0)
		just = [center top]
		texture = vided_toolbar_top
		rgba = [0 0 0 80]
		z_priority = 0
		Random (@ flip_v @ )
	}
	createscreenelement {
		type = hmenu
		parent = <parent>
		id = <hmenu>
		local_id = hmenu
		just = [left center]
		spacing_between = 50
		pos = (-300.0, 0.0)
		tags = {
			array_size = <array_size>
			list_size = <list_size>
			index = 2
		}
	}
	setscreenelementprops {
		id = <hmenu>
		event_handlers = [
			{pad_left ui_progress_left_h params = {}}
			{pad_right ui_progress_right_h params = {}}
		]
	}
	if NOT (<array_size> = 0)
		ui_progress_add_h (<sub_list> [(<array_size> - 2)]) hmenu = <hmenu> not_focusable
		ui_progress_add_h (<sub_list> [(<array_size> - 1)]) hmenu = <hmenu> not_focusable
		<i> = 2
		<j> = 0
		begin
		if gotparam not_focusable
			ui_progress_add_h (<sub_list> [<j>]) hmenu = <hmenu> index = <i> title = <text> not_focusable
		else
			ui_progress_add_h (<sub_list> [<j>]) hmenu = <hmenu> index = <i> title = <text>
		endif
		<i> = (<i> + 1)
		<j> = (<j> + 1)
		repeat <array_size>
		ui_progress_add_h (<sub_list> [0]) hmenu = <hmenu> index = <i> not_focusable
		ui_progress_add_h (<sub_list> [1]) hmenu = <hmenu> index = (<i> + 1) not_focusable
	endif
	return hmenu = <hmenu>
endscript

script ui_progress_add_h focus = {focusable}
	if gotparam not_focusable
		createscreenelement {
			type = containerelement
			parent = <hmenu>
			local_
			dims = (100.0, 100.0)
			just = [left center]
			child_anchor = [left center]
			not_focusable
		}
	else
		createscreenelement {
			type = containerelement
			parent = <hmenu>
			local_
			dims = (100.0, 100.0)
			just = [left center]
			child_anchor = [left center]
			event_handlers = [
				{focus ui_progress_focus_h params = {<...>}}
				{unfocus ui_progress_unfocus_h params = {}}
			]
		}
	endif
	<parent> = <id>
	alpha = 1.0
	if NOT (<percentage> = 100.0)
		alpha = 0.25
	endif
	<parent> = <id>
	createscreenelement {
		type = spriteelement
		parent = <parent>
		local_id = element
		texture = <texture>
		pos = (0.0, 20.0)
		rgba = [64 64 64 255]
		alpha = <alpha>
		z_priority = 1.9
	}
	rgba = [64 64 64 255]
	if (<alpha> = 0.25)
		rgba = [32 32 32 255]
	endif
	createscreenelement {
		type = spriteelement
		parent = <parent>
		local_id = element2
		texture = <texture>
		pos = (0.0, 20.0)
		rgba = <rgba>
		alpha = 1.0
		z_priority = 1.8
	}
endscript

script ui_progress_up_v 
	gettags
	soundevent event = VE_category_toggle
	<new_index> = (<index> - 1)
	if (<new_index> < 2)
		<new_index> = (<list_size> - 3)
	endif
	settags index = <new_index>
	stoprendering
	if (<new_index> = (<list_size> - 3))
		domorph {
			pos = (((0.0, 1.0) * (((<new_index> + 1) * -192) + 192)) + (22.0, 0.0))
		}
		resolvescreenelementid id = {<id> child = (<new_index> + 1)}
		setscreenelementprops {
			id = {<resolved_id> child = {container child = bg}}
			rgba = ($goal_ui_scheme.main)
		}
		doscreenelementmorph {
			id = {<resolved_id> child = {container child = bg}}
			alpha = 0.8
		}
		setscreenelementprops {
			id = {<resolved_id> child = {container child = bottom}}
			rgba = ($goal_ui_scheme.main)
		}
		doscreenelementmorph {
			id = {<resolved_id> child = {container child = bottom}}
			alpha = 0.8
		}
		setscreenelementprops {
			id = {<resolved_id> child = title}
			rgba = [240 240 240 255]
		}
		runscriptonscreenelement id = <resolved_id> ui_progress_unfocus_v
		resolvescreenelementid id = {<id> child = (<new_index> + 1)}
		resolvescreenelementid id = {<resolved_id> child = hmenu}
		<resolved_id> :getsingletag index
		resolvescreenelementid id = {<resolved_id> child = <index>}
		setscreenelementprops {
			id = {<resolved_id> child = element}
			rgba = [200 200 200 255]
			scale = 1.7
		}
		setscreenelementprops {
			id = {<resolved_id> child = element2}
			scale = 1.7
		}
		runscriptonscreenelement id = <resolved_id> ui_progress_unfocus_h
	endif
	startrendering
	domorph {
		pos = (((0.0, 1.0) * ((<new_index> * -192) + 192)) + (22.0, 0.0))
		time = 0.4
	}
endscript

script ui_progress_down_v 
	gettags
	soundevent event = VE_category_toggle
	<new_index> = (<index> + 1)
	if (<new_index> > (<list_size> - 3))
		<new_index> = 2
	endif
	settags index = <new_index>
	stoprendering
	if (<new_index> = 2)
		domorph {
			pos = (((0.0, 1.0) * (((<new_index> - 1) * -192) + 192)) + (22.0, 0.0))
		}
		resolvescreenelementid id = {<id> child = (<new_index> - 1)}
		setscreenelementprops {
			id = {<resolved_id> child = {container child = bg}}
			rgba = ($goal_ui_scheme.main)
		}
		doscreenelementmorph {
			id = {<resolved_id> child = {container child = bg}}
			alpha = 0.8
		}
		setscreenelementprops {
			id = {<resolved_id> child = {container child = bottom}}
			rgba = ($goal_ui_scheme.main)
		}
		doscreenelementmorph {
			id = {<resolved_id> child = {container child = bottom}}
			alpha = 0.8
		}
		setscreenelementprops {
			id = {<resolved_id> child = title}
			rgba = [240 240 240 255]
		}
		runscriptonscreenelement id = <resolved_id> ui_progress_unfocus_v
		resolvescreenelementid id = {<id> child = (<new_index> - 1)}
		resolvescreenelementid id = {<resolved_id> child = hmenu}
		<resolved_id> :getsingletag index
		resolvescreenelementid id = {<resolved_id> child = <index>}
		setscreenelementprops {
			id = {<resolved_id> child = element}
			rgba = [200 200 200 255]
			scale = 1.7
		}
		setscreenelementprops {
			id = {<resolved_id> child = element2}
			scale = 1.7
		}
		runscriptonscreenelement id = <resolved_id> ui_progress_unfocus_h
	endif
	startrendering
	domorph {
		pos = (((0.0, 1.0) * ((<new_index> * -192) + 192)) + (22.0, 0.0))
		time = 0.4
	}
endscript

script ui_progress_focus_v time = 0.4
	gettags
	doscreenelementmorph {
		id = {<id> child = title}
		rgba = [240 240 240 255]
		time = <time>
	}
	doscreenelementmorph {
		id = {<id> child = {container child = bg}}
		rgba = ($goal_ui_scheme.main)
		time = <time>
		alpha = 0.8
	}
	doscreenelementmorph {
		id = {<id> child = {container child = bottom}}
		rgba = ($goal_ui_scheme.main)
		time = <time>
		alpha = 0.8
	}
endscript

script ui_progress_unfocus_v time = 0.4
	gettags
	doscreenelementmorph {
		id = {<id> child = title}
		rgba = [120 120 120 255]
		time = <time>
	}
	doscreenelementmorph {
		id = {<id> child = {container child = bg}}
		rgba = [64 64 64 255]
		time = <time>
		alpha = 1
	}
	doscreenelementmorph {
		id = {<id> child = {container child = bottom}}
		rgba = [64 64 64 255]
		time = <time>
		alpha = 1
	}
endscript

script ui_progress_left_h 
	gettags
	soundevent event = CAP_SFX_menu_hide
	<new_index> = (<index> - 1)
	if (<new_index> < 2)
		<new_index> = (<list_size> - 3)
	endif
	settags index = <new_index>
	if gotparam link
		launchevent type = pad_left target = <link>
	endif
	if (<new_index> = (<list_size> - 3))
		domorph {
			pos = ((1.0, 0.0) * ((<new_index> + 1) * -150))
		}
		resolvescreenelementid id = {<id> child = (<new_index> + 1)}
		setscreenelementprops {
			id = {<resolved_id> child = element}
			rgba = [200 200 200 255]
			scale = 1.7
		}
		setscreenelementprops {
			id = {<resolved_id> child = element2}
			scale = 1.7
		}
		runscriptonscreenelement id = <resolved_id> ui_progress_unfocus_h
	endif
	domorph {
		pos = ((1.0, 0.0) * (<new_index> * -150))
		time = 0.4
	}
endscript

script ui_progress_right_h 
	gettags
	soundevent event = CAP_SFX_menu_show
	<new_index> = (<index> + 1)
	if (<new_index> > (<list_size> - 3))
		<new_index> = 2
	endif
	settags index = <new_index>
	if gotparam link
		launchevent type = pad_right target = <link>
	endif
	if (<new_index> = 2)
		domorph {
			pos = ((1.0, 0.0) * ((<new_index> - 1) * -150))
		}
		resolvescreenelementid id = {<id> child = (<new_index> - 1)}
		setscreenelementprops {
			id = {<resolved_id> child = element}
			rgba = [200 200 200 255]
			scale = 1.7
		}
		setscreenelementprops {
			id = {<resolved_id> child = element2}
			scale = 1.7
		}
		runscriptonscreenelement id = <resolved_id> ui_progress_unfocus_h
	endif
	domorph {
		pos = ((1.0, 0.0) * (<new_index> * -150))
		time = 0.4
	}
endscript

script ui_progress_focus_h \{time = 0.4}
	gettags
	doscreenelementmorph {
		id = {<id> child = element}
		rgba = [200 200 200 255]
		scale = 1.7
		time = <time>
	}
	doscreenelementmorph {
		id = {<id> child = element2}
		scale = 1.7
		time = <time>
	}
	runscriptonscreenelement id = progress_container ui_progress_update_info params = {<...>}
endscript

script ui_progress_unfocus_h \{time = 0.4}
	gettags
	doscreenelementmorph {
		id = {<id> child = element}
		rgba = [64 64 64 255]
		scale = 1.0
		time = <time>
	}
	doscreenelementmorph {
		id = {<id> child = element2}
		scale = 1.0
		time = <time>
	}
endscript

script ui_progress_blink_arrow time = 0.4
	if screenelementexists id = {progress_arrow_container child = <arrow>}
		doscreenelementmorph {
			id = {progress_arrow_container child = <arrow>}
			rgba = ($goal_ui_scheme.main)
			scale = 1.5
			relative_scale
			time = (<time> / 2.0)
		}
		wait (<time> / 2.0) seconds
		doscreenelementmorph {
			id = {progress_arrow_container child = <arrow>}
			rgba = [255 255 255 255]
			scale = 1.0
			relative_scale
			time = (<time> / 2)
		}
	endif
endscript

script ui_progress_update_info next_text = "accolade locked" percent_text = ""
	<next_text> = "accolade locked"
	if NOT gotparam percentage
		if (<total> > 0)
			<percentage> = (<curr> / <total>)
		else
			<percentage> = 0
		endif
		<percentage_int> = (<percentage> * 100.0)
		if gotparam total
			formattext textname = next_text "%x/%y %n completed" x = <curr> y = <total> n = <next> decimalplaces = 0
		endif
	else
		<percentage_int> = <percentage>
		<percentage> = (<percentage> / 100.0)
		if gotparam total
			formattext textname = next_text "%x/%y %n completed" x = <curr> y = <total> n = <next> decimalplaces = 0
		endif
	endif
	casttointeger percentage_int
	if (<percentage> = 1.0)
		<next_text> = ""
		<percent_text> = ""
	endif
	if NOT gotparam no_percentage
		formattext textname = percent_text "%p\\%" p = <percentage_int>
	endif
	setscreenelementprops {
		id = progress_heading
		text = <title>
	}
	setscreenelementprops {
		id = progress_subheading
		text = <text>
	}
	setscreenelementprops {
		id = progress_description
		text = <desc>
	}
	setscreenelementprops {
		id = progress_bar
		dims = (((394.0, 0.0) * <percentage>) + (0.0, 29.0))
	}
	setscreenelementprops {
		id = progress_percent
		text = <percent_text>
	}
	setscreenelementprops {
		id = progress_next
		text = <next_text>
	}
	doscreenelementmorph {
		id = progress_bar
		time = 0.2
	}
endscript

script GetProgressMasterList 
	<master_list> = [
		{
			text = "story progression"
			type = progression
		}
		{
			text = "career class"
			type = career
		}
		{
			text = "hardcore class"
			type = hardcore
		}
		{
			text = "rigger class"
			type = rigger
		}
		{
			text = "photo goals"
			type = photo
		}
		{
			text = "film goals"
			type = film
		}
		{
			text = "line challenges"
			type = line
		}
		{
			text = "skill challenges"
			type = chalk
		}
		{
			text = "hawk-man"
			type = hawkman
		}
		{
			text = "classic goals"
			type = classic
		}
		{
			text = "other"
			type = other
		}
		{
			text = "editor's challenge"
			type = editor
		}
	]
	getarraysize <master_list>
	return {master_list = <master_list> array_size = <array_size>}
endscript

script GetProgressSubList type = `default`
	<sub_list> = []
	switch <type>
		case progression
		get_milestone_progress
		<am_percentage> = 0.0
		<pro_percentage> = 0.0
		<shoe_percentage> = 0.0
		<deck_percentage> = 0.0
		<shoe_sig_percentage> = 0.0
		<start_team_percentage> = 0.0
		<built_team_percentage> = 0.0
		switch <current_milestone>
			case milestone_am
			<am_percentage> = 100.0
			case milestone_pro
			<am_percentage> = 100.0
			<pro_percentage> = 100.0
			case milestone_shoes
			<am_percentage> = 100.0
			<pro_percentage> = 100.0
			<deck_percentage> = 100.0
			case milestone_deck
			<am_percentage> = 100.0
			<pro_percentage> = 100.0
			<shoe_percentage> = 100.0
			<deck_percentage> = 100.0
			case milestone_shoes_sig
			<am_percentage> = 100.0
			<pro_percentage> = 100.0
			<shoe_percentage> = 100.0
			<deck_percentage> = 100.0
			<shoe_sig_percentage> = 100.0
			case milestone_start_team
			<am_percentage> = 100.0
			<pro_percentage> = 100.0
			<shoe_percentage> = 100.0
			<deck_percentage> = 100.0
			<shoe_sig_percentage> = 100.0
			<start_team_percentage> = 100.0
			case milestone_built_team
			case milestone_beat_all
			<am_percentage> = 100.0
			<pro_percentage> = 100.0
			<shoe_percentage> = 100.0
			<deck_percentage> = 100.0
			<shoe_sig_percentage> = 100.0
			<start_team_percentage> = 100.0
			<built_team_percentage> = 100.0
		endswitch
		switch <next_milestone>
			case milestone_am
			<am_percentage> = (<progress_to_next_milestone> * 100.0)
			case milestone_pro
			<pro_percentage> = (<progress_to_next_milestone> * 100.0)
			case milestone_shoes
			<shoe_percentage> = (<progress_to_next_milestone> * 100.0)
			case milestone_deck
			<deck_percentage> = (<progress_to_next_milestone> * 100.0)
			case milestone_shoes_sig
			<shoe_sig_percentage> = (<progress_to_next_milestone> * 100.0)
			case milestone_start_team
			<start_team_percentage> = (<progress_to_next_milestone> * 100.0)
			case milestone_built_team
			<built_team_percentage> = (<progress_to_next_milestone> * 100.0)
		endswitch
		<sub_list> = [
			{
				texture = prog_icon_am
				text = "progression: sponsored"
				desc = "progression toward getting sponsored."
				percentage = <am_percentage>
				no_percentage
			}
			{
				texture = prog_icon_pro
				text = "progression: join team"
				desc = "progression toward joining a team."
				percentage = <pro_percentage>
				no_percentage
			}
			{
				texture = prog_icon_shoe
				text = "progression: shoe sponsor"
				desc = "progression toward getting a shoe sponsor."
				percentage = <shoe_percentage>
				no_percentage
			}
			{
				texture = prog_icon_deck
				text = "progression: signature deck"
				desc = "progression toward getting your own skate deck."
				percentage = <deck_percentage>
				no_percentage
			}
			{
				texture = prog_icon_shoe
				text = "progression: signature shoes"
				desc = "progression toward getting your own skate shoe."
				percentage = <shoe_percentage>
				no_percentage
			}
			{
				texture = prog_icon_flag
				text = "progression: start team"
				desc = "progression toward getting to build your own team."
				percentage = <start_team_percentage>
				no_percentage
			}
			{
				texture = prog_icon_team
				text = "progression: built team"
				desc = "progression toward having built your team."
				percentage = <built_team_percentage>
				no_percentage
			}
		]
		case career
		GMan_GetCompletionInfo lifestyle = career
		if gman_haswongoal goal = m_cu
			<uber_percentage> = 100.0
			gman_getgrade goal = m_cu
			formattext textname = uber_next "Career Epic Grade: %s" s = <grade>
		else
			<uber_percentage> = 0.0
			formattext textname = uber_next "Not Completed"
		endif
		<sub_list> = [
			{
				texture = prog_icon_car_am
				text = "career: am"
				desc = "percentage of career goals completed at the am ranking."
				percentage = <am_percentage>
			}
			{
				texture = prog_icon_car_pro
				text = "career: pro"
				desc = "percentage of career goals completed at the pro ranking."
				percentage = <pro_percentage>
			}
			{
				texture = prog_icon_car_sick
				text = "career: sick"
				desc = "percentage of career goals completed at the sick ranking."
				percentage = <sick_percentage>
			}
			{
				texture = prog_icon_uber_goals
				text = "career: uber"
				desc = "career uber goal completed."
				percentage = <uber_percentage>
				no_percentage
			}
		]
		case hardcore
		GMan_GetCompletionInfo lifestyle = hardcore
		if gman_haswongoal goal = m_hu
			<uber_percentage> = 100.0
			gman_getgrade goal = m_hu
			formattext textname = uber_next "Hardcore Epic Grade: %s" s = <grade>
		else
			<uber_percentage> = 0.0
			formattext textname = uber_next "Not Completed"
		endif
		<sub_list> = [
			{
				texture = prog_icon_hard_am
				text = "hardcore: am"
				desc = "percentage of hardcore goals completed at the am ranking."
				percentage = <am_percentage>
			}
			{
				texture = prog_icon_hard_pro
				text = "hardcore: pro"
				desc = "percentage of hardcore goals completed at the pro ranking."
				percentage = <pro_percentage>
			}
			{
				texture = prog_icon_hard_sick
				text = "hardcore: sick"
				desc = "percentage of hardcore goals completed at the sick ranking."
				percentage = <sick_percentage>
			}
			{
				texture = prog_icon_uber_goals
				text = "hardcore: uber"
				desc = "hardcore uber goal completed."
				percentage = <uber_percentage>
				no_percentage
			}
		]
		case rigger
		GMan_GetCompletionInfo lifestyle = rigger
		if gman_haswongoal goal = m_ru
			<uber_percentage> = 100.0
			gman_getgrade goal = m_ru
			formattext textname = uber_next "Rigger Epic Grade: %s" s = <grade>
		else
			<uber_percentage> = 0.0
			formattext textname = uber_next "Not Completed"
		endif
		<sub_list> = [
			{
				texture = prog_icon_rig_am
				text = "rigger: am"
				desc = "percentage of rigger goals completed at the am ranking."
				percentage = <am_percentage>
			}
			{
				texture = prog_icon_rig_pro
				text = "rigger: pro"
				desc = "percentage of rigger goals completed at the pro ranking."
				percentage = <pro_percentage>
			}
			{
				texture = prog_icon_rig_sick
				text = "rigger: sick"
				desc = "percentage of rigger goals completed at the sick ranking."
				percentage = <sick_percentage>
			}
			{
				texture = prog_icon_uber_goals
				text = "rigger: uber"
				desc = "rigger uber goal completed."
				percentage = <uber_percentage>
				no_percentage
			}
		]
		case photo
		GMan_GetCompletionInfo type = photo
		<sub_list> = [
			{
				texture = prog_icon_gen_am
				text = "photo: am"
				desc = "percentage of photo goals completed at the am ranking."
				percentage = <am_percentage>
			}
			{
				texture = prog_icon_gen_pro
				text = "photo: pro"
				desc = "percentage of photo goals completed at the pro ranking."
				percentage = <pro_percentage>
			}
			{
				texture = prog_icon_gen_sick
				text = "photo: sick"
				desc = "percentage of photo goals completed at the sick ranking."
				percentage = <sick_percentage>
			}
			{
				texture = prog_icon_uber_goals
				text = "photo: total completion"
				desc = "percentage of total photo goals completed."
				percentage = <am_percentage>
			}
		]
		case film
		GMan_GetCompletionInfo type = film
		<sub_list> = [
			{
				texture = prog_icon_gen_am
				text = "film: am"
				desc = "percentage of film goals completed at the am ranking."
				percentage = <am_percentage>
			}
			{
				texture = prog_icon_gen_pro
				text = "film: pro"
				desc = "percentage of film goals completed at the pro ranking."
				percentage = <pro_percentage>
			}
			{
				texture = prog_icon_gen_sick
				text = "film: sick"
				desc = "percentage of film goals completed at the sick ranking."
				percentage = <sick_percentage>
			}
			{
				texture = prog_icon_film
				text = "film: total completion"
				desc = "percentage of total film goals completed."
				percentage = <am_percentage>
			}
		]
		case line
		GMan_GetCompletionInfo type = turf
		<sub_list> = [
			{
				texture = prog_icon_gen_am
				text = "line challenges: am"
				desc = "percentage of line challenges completed at the am ranking."
				percentage = <am_percentage>
			}
			{
				texture = prog_icon_gen_pro
				text = "line challenges: pro"
				desc = "percentage of line challenges completed at the pro ranking."
				percentage = <pro_percentage>
			}
			{
				texture = prog_icon_gen_sick
				text = "line challenges: sick"
				desc = "percentage of line challenges completed at the sick ranking."
				percentage = <sick_percentage>
			}
			{
				texture = prog_icon_skateline
				text = "line challenges: total completion"
				desc = "percentage of total line challenges completed."
				percentage = <am_percentage>
			}
		]
		case chalk
		GMan_GetCompletionInfo type = chalk
		<sub_list> = [
			{
				texture = prog_icon_gen_am
				text = "skill challenges: am"
				desc = "percentage of skill challenges completed at the am ranking."
				percentage = <am_percentage>
			}
			{
				texture = prog_icon_gen_pro
				text = "skill challenges: pro"
				desc = "percentage of skill challenges completed at the pro ranking."
				percentage = <pro_percentage>
			}
			{
				texture = prog_icon_gen_sick
				text = "skill challenges: sick"
				desc = "percentage of skill challenges completed at the sick ranking."
				percentage = <sick_percentage>
			}
			{
				texture = prog_icon_all_skill
				text = "skill challenges: total completion"
				desc = "percentage of total skill challenges completed."
				percentage = <am_percentage>
			}
		]
		case hawkman
		GMan_GetCompletionInfo type = hawkman
		<sub_list> = [
			{
				texture = prog_icon_gen_am
				text = "hawk-man: am"
				desc = "percentage of hawk-man goals completed at the am ranking."
				percentage = <am_percentage>
			}
			{
				texture = prog_icon_gen_pro
				text = "hawk-man: pro"
				desc = "percentage of hawk-man goals completed at the pro ranking."
				percentage = <pro_percentage>
			}
			{
				texture = prog_icon_gen_sick
				text = "hawk-man: sick"
				desc = "percentage of hawk-man goals completed at the sick ranking."
				percentage = <sick_percentage>
			}
			{
				texture = prog_icon_hawkman
				text = "hawk-man: total completion"
				desc = "percentage of total hawk-man goals completed."
				percentage = <am_percentage>
			}
		]
		case classic
		GMan_GetCompletionInfo type = classic
		<sub_list> = [
			{
				texture = prog_icon_gen_am
				text = "classic: am"
				desc = "percentage of classic goals completed at the am ranking."
				percentage = <am_percentage>
			}
			{
				texture = prog_icon_gen_pro
				text = "classic: pro"
				desc = "percentage of classic goals completed at the pro ranking."
				percentage = <pro_percentage>
			}
			{
				texture = prog_icon_gen_sick
				text = "classic: sick"
				desc = "percentage of classic goals completed at the sick ranking."
				percentage = <sick_percentage>
			}
			{
				texture = prog_icon_classic
				text = "classic: total completion"
				desc = "percentage of total classic goals completed."
				percentage = <am_percentage>
			}
		]
		case editor
		if getglobalflag flag = $VIDEO_EDIT_PHILLY_DONE
			<philly_clip> = 100
		else
			<philly_clip> = 0
		endif
		if getglobalflag flag = $VIDEO_EDIT_BALT_DONE
			<balt_clip> = 100
		else
			<balt_clip> = 0
		endif
		if getglobalflag flag = $VIDEO_EDIT_DC_DONE
			<dc_clip> = 100
		else
			<dc_clip> = 0
		endif
		if getglobalflag flag = $VIDEO_EDIT_CRIB_DONE
			<crib_clip> = 100
		else
			<crib_clip> = 0
		endif
		<sub_list> = [
			{
				texture = prog_icon_wash
				text = "editor: washington d.c."
				desc = "completed the volcom Washington D.C. footage submission."
				percentage = <dc_clip>
				no_percentage
			}
			{
				texture = prog_icon_philly
				text = "editor: philadelphia"
				desc = "completed the volcom Philadelphia footage submission."
				percentage = <philly_clip>
				no_percentage
			}
			{
				texture = prog_icon_balt
				text = "editor: baltimore"
				desc = "completed the volcom Baltimore footage submission."
				percentage = <balt_clip>
				no_percentage
			}
			{
				texture = prog_icon_editor
				text = "editor: team"
				desc = "completed team built footage submission."
				percentage = <crib_clip>
				no_percentage
			}
		]
		case other
		SkillTree_NumLearnedWithTrait trait = career_upgrade
		<c_upgrade_pct> = <num_skills_learned_with_trait_percent>
		SkillTree_NumLearnedWithTrait trait = hardcore_upgrade
		<h_upgrade_pct> = <num_skills_learned_with_trait_percent>
		SkillTree_NumLearnedWithTrait trait = rigger_upgrade
		<r_upgrade_pct> = <num_skills_learned_with_trait_percent>
		<total_upgrade_pct> = ((<c_upgrade_pct> + <h_upgrade_pct> + <r_upgrade_pct>) / 3.0)
		SkillTree_NumLearnedWithTrait trait = crib
		<crib_percentage> = <num_skills_learned_with_trait_percent>
		getarraysize $cas_piece_global_flags
		if (<array_size> > 0)
			<i> = 0
			<cas_flags_set> = 0.0
			begin
			if getglobalflag flag = ($cas_piece_global_flags [<i>])
				<cas_flags_set> = (<cas_flags_set> + 1.0)
			endif
			<i> = (<i> + 1)
			repeat <array_size>
			<cas_percentage> = (100.0 * <cas_flags_set> / <array_size>)
		else
			<cas_percentage> = 0
		endif
		careerfunc func = getsecretspotsfound
		if (<num_secret_spots> > 0)
			<cash_spots_percentage> = (100.0 * <secret_spots_found> / <num_secret_spots>)
		else
			<cash_spots_percentage> = 0
		endif
		GetLevelGapTotals
		<gap_percentage> = (((<num_collected_gaps> * 1.0) / (<num_gaps> * 1.0)) * 100.0)
		if CompareValues a = <gap_percentage> b = 100.0 epsilon = 0.5
			if (<num_collected_gaps> < <num_gaps>)
				<gap_percentage> = 99.0
			endif
		endif
		<sub_list> = [
			{
				texture = prog_icon_all_cas
				text = "other: all skater gear"
				desc = "earned all skater gear."
				percentage = <cas_percentage>
			}
			{
				texture = prog_icon_all_crib
				text = "other: all skate lounge"
				desc = "earned all skate lounge pieces."
				percentage = <crib_percentage>
			}
			{
				texture = prog_icon_all_gaps
				text = "other: all gaps"
				desc = "completed all gaps."
				percentage = <gap_percentage>
			}
			{
				texture = prog_icon_cash
				text = "other: all cash spots"
				desc = "found all cash spots."
				percentage = <cash_spots_percentage>
			}
			{
				texture = prog_icon_skill_upgrades
				text = "other: all skill upgrades"
				desc = "upgraded all skater abilities."
				percentage = <total_upgrade_pct>
			}
		]
		default
	endswitch
	getarraysize <sub_list>
	return {sub_list = <sub_list> array_size = <array_size>}
endscript
