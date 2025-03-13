
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
	if countscreenelementchildren id = <objid>
		launchevent type = unfocus target = <objid>
		change \{generic_menu_block_input = 1}
		getscreenelementdims id = <objid>
		if (<isvertical> = true)
			<shift> = ((<height> / <num_children>) * (0.0, 1.0))
		else
			<shift> = ((<width> / <num_children>) * (1.0, 0.0))
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
		wait \{0.05
			seconds}
		change \{generic_menu_block_input = 0}
		launchevent type = focus target = <objid>
	endif
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
