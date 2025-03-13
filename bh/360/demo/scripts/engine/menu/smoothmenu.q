
script createsmoothloopingmenu \{id = smooth_looping_menu_parent
		menu_id = smooth_looping_menu_id
		parent = root_window
		type = vmenu
		dims = (250.0, 200.0)
		pos = (0.0, 0.0)
		morph_time = 0.2}
	createscreenelement {
		type = windowelement
		parent = <parent>
		id = <id>
		pos = <pos>
		dims = <dims>
		just = [left top]
		tags = {debug_me}
	}
	if (<type> = vmenu)
		event_handlers = [
			{pad_up smoothmenuscroll params = {dir = -1 isvertical = true}}
			{pad_down smoothmenuscroll params = {dir = 1 isvertical = true}}
		]
	else
		event_handlers = [
			{pad_left smoothmenuscroll params = {dir = -1 isvertical = false}}
			{pad_right smoothmenuscroll params = {dir = 1 isvertical = false}}
		]
	endif
	createscreenelement {
		type = <type>
		parent = <id>
		id = <menu_id>
		pos = (0.0, 0.0)
		pos_anchor = [center center]
		just = [center center]
		internal_just = [center center]
		loop_view = true
		loop_center = true
		dims = <dims>
		disable_pad_handling
		event_handlers = <event_handlers>
		tags = {smooth_morph_time = <morph_time>}
	}
endscript

script 0x420493b3 
	getscreenelementprops \{id = mainmenu_id
		force_update}
endscript

script 0x9523dc93 
	requireparams \{[
			array_size
			i
		]
		all}
	if (<i> < 0)
		return i = (<i> + <array_size>)
	elseif (<i> < <array_size>)
		return i = <i>
	else
		return i = (<i> - <array_size>)
	endif
endscript

script 0xbecf6bba 
	requireparams \{[
			dir
			isvertical
		]
		all}
	if NOT screenelementexists \{id = mainmenu_id}
		return
	endif
	0x420493b3
	obj_getid
	getscreenelementchildren id = <objid>
	getarraysize \{children}
	menu_getselectedindex
	0x9523dc93 array_size = <array_size> i = (<selected_index> + 1)
	<0xf4db4dee> = <i>
	0x9523dc93 array_size = <array_size> i = (<selected_index> + 2)
	<0xc5335773> = <i>
	getscreenelementposition id = (<children> [<0xf4db4dee>]) summed
	<0x71797655> = <screenelementpos>
	getscreenelementposition id = (<children> [<0xc5335773>]) summed
	<0x36d90c85> = <screenelementpos>
	<0xef59372d> = ((<0x36d90c85> - <0x71797655>).(0.0, 1.0))
	<0x4cc75072> = ((0.0, 1.0) * <0xef59372d> * 1 * <dir>)
	mainmenu_id :se_setprops 0x17275a79 = <0x4cc75072> time = 0
	mainmenu_id :se_setprops \{0x17275a79 = (0.0, 0.0)
		time = 0.15
		motion = ease_out}
endscript

script smoothmenuscroll 
	getsingletag \{smooth_morph_time}
	setspawnedscriptnorepeatfor time = (<smooth_morph_time> + 0.05)
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	requireparams \{[
			dir
			isvertical
		]
		all}
	obj_getid
	if gotparam \{play_scroll_sound}
		if NOT (<play_scroll_sound> = 0)
			generic_menu_up_or_down_sound
		endif
	endif
	if countscreenelementchildren id = <objid>
		launchevent type = unfocus target = <objid>
		change \{generic_menu_block_input = 1}
		<objid> :se_getprops
		getscreenelementchildren id = <objid>
		0x10edceb4 children = <children>
		<scaled_width> = ((<dims>.(1.0, 0.0) * <scale>.(1.0, 0.0)))
		<scaled_height> = ((<dims>.(0.0, 1.0) * <scale>.(0.0, 1.0)))
		getscreenelementposition id = (<children> [<0xea93318a>]) summed
		<0x71797655> = <screenelementpos>
		0x9523dc93 array_size = <num_children> i = (<0xea93318a> + 1)
		getscreenelementposition id = (<children> [<i>]) summed
		<0x36d90c85> = <screenelementpos>
		if (<isvertical> = true)
			<shift> = ((<0x36d90c85> - <0x71797655>).(0.0, 1.0) * (0.0, 1.0))
		else
			<shift> = ((<0x36d90c85> - <0x71797655>).(1.0, 0.0) * (1.0, 0.0))
		endif
		if (<dir> = -1)
			se_setprops pos = {<shift> relative} time = <smooth_morph_time>
			se_waitprops
			menu_changeselection \{up}
			se_setprops pos = {(<shift> * -1) relative} time = 0.0
			se_waitprops
		else
			se_setprops pos = {(<shift> * -1) relative} time = <smooth_morph_time>
			se_waitprops
			menu_changeselection \{down}
			se_setprops pos = {<shift> relative} time = 0.0
			se_waitprops
		endif
		if screenelementexists \{id = 0x1fa57cc3}
			destroyscreenelement \{id = 0x1fa57cc3}
		endif
		if screenelementexists \{id = 0x0089ba67}
			destroyscreenelement \{id = 0x0089ba67}
		endif
		wait \{2
			gameframes}
		0xeeaaf227 menu_id = <objid>
		change \{generic_menu_block_input = 0}
		launchevent type = focus target = <objid>
	endif
endscript

script 0x10edceb4 
	requireparams \{[
			children
		]
		all}
	getarraysize \{children}
	if (<array_size> = 0)
		softassert \{qs(0x3a9f5d58)}
		return
	endif
	<0xea93318a> = 0
	<bottom_index> = 0
	i = 1
	begin
	0xbb7400aa = (<children> [<i>])
	getscreenelementposition id = <0xbb7400aa>
	0x40126714 = (<screenelementpos>.(0.0, 1.0))
	0x40af260d = (<children> [<0xea93318a>])
	getscreenelementposition id = <0x40af260d>
	0x319bf3ed = (<screenelementpos>.(0.0, 1.0))
	0xbca6dd22 = (<children> [<bottom_index>])
	getscreenelementposition id = <0xbca6dd22>
	0x4fa507ec = (<screenelementpos>.(0.0, 1.0))
	if (<0x40126714> < <0x319bf3ed>)
		<0xea93318a> = <i>
	endif
	if (<0x40126714> > <0x4fa507ec>)
		<bottom_index> = <i>
	endif
	<i> = (<i> + 1)
	repeat (<array_size> - 1)
	return {0xea93318a = <0xea93318a> bottom_index = <bottom_index> 0x485302a2 = (<children> [<0xea93318a>]) 0x2b6198e6 = (<children> [<bottom_index>])}
endscript

script test_smoothringmenu 
	<menu_id> = test_markw
	destroyscreenelement \{id = current_menu}
	destroyscreenelement \{id = test_markw_window}
	createsmoothloopingmenu {
		id = test_markw_window
		parent = root_window
		menu_id = <menu_id>
		dims = (800.0, 150.0)
		pos = (150.0, 450.0)
		type = hmenu
		morph_time = 0.5
	}
	<i> = 1
	begin
	createscreenelement {
		type = containerelement
		parent = <menu_id>
		dims = (175.0, 45.0)
		just = [center center]
		internal_just = [center center]
		pos_anchor = [center center]
		event_handlers = [
			{focus test_smoothfocus params = {focus = 1}}
			{unfocus test_smoothfocus params = {focus = 0}}
		]
	}
	formattext textname = itemname qs(0xa789b83c) i = <i>
	createscreenelement {
		local_id = text
		type = textblockelement
		parent = <id>
		pos = (0.0, 0.0)
		dims = (200.0, 50.0)
		font = fontgrid_text_a1
		rgba = [192 192 192 255]
		internal_scale = 0.5
		text = <itemname>
		just = [center center]
		internal_just = [center center]
		pos_anchor = [center center]
	}
	<i> = (<i> + 1)
	repeat 5
	launchevent type = focus target = <menu_id>
endscript

script test_smoothfocus 
	obj_getid
	resolvescreenelementid id = {<objid> child = text}
	if (<focus> = 1)
		<resolved_id> :se_setprops rgba = [192 255 255 255] relative_scale scale = 1.5 time = 0.2
	else
		wait \{0.1
			second}
		<resolved_id> :se_setprops rgba = [192 192 192 255] relative_scale scale = 1.0 time = 0.2
	endif
endscript
