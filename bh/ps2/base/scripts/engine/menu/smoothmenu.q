
script createsmoothloopingmenu \{id = smooth_looping_menu_parent
		menu_id = smooth_looping_menu_id
		parent = root_window
		Type = VMenu
		dims = (250.0, 200.0)
		Pos = (0.0, 0.0)
		morph_time = 0.2}
	CreateScreenElement {
		Type = WindowElement
		parent = <parent>
		id = <id>
		Pos = <Pos>
		dims = <dims>
		just = [left top]
		tags = {debug_me}
	}
	if (<Type> = VMenu)
		event_handlers = [
			{pad_up smoothmenuscroll params = {Dir = -1 isvertical = true}}
			{pad_down smoothmenuscroll params = {Dir = 1 isvertical = true}}
		]
	else
		event_handlers = [
			{pad_left smoothmenuscroll params = {Dir = -1 isvertical = FALSE}}
			{pad_right smoothmenuscroll params = {Dir = 1 isvertical = FALSE}}
		]
	endif
	CreateScreenElement {
		Type = <Type>
		parent = <id>
		id = <menu_id>
		Pos = (0.0, 0.0)
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
	GetSingleTag \{smooth_morph_time}
	setspawnedscriptnorepeatfor time = (<smooth_morph_time> + 0.05)
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}

	Obj_GetID
	if countscreenelementchildren id = <objID>
		LaunchEvent Type = unfocus target = <objID>
		Change \{generic_menu_block_input = 1}
		GetScreenElementDims id = <objID>
		if (<isvertical> = true)
			<shift> = ((<height> / <num_children>) * (0.0, 1.0))
		else
			<shift> = ((<width> / <num_children>) * (1.0, 0.0))
		endif
		if (<Dir> = -1)
			se_setprops Pos = {<shift> relative} time = <smooth_morph_time>
			se_waitprops
			menu_changeselection \{up}
			se_setprops Pos = {(<shift> * -1) relative} time = 0.0
			se_waitprops
		else
			se_setprops Pos = {(<shift> * -1) relative} time = <smooth_morph_time>
			se_waitprops
			menu_changeselection \{down}
			se_setprops Pos = {<shift> relative} time = 0.0
			se_waitprops
		endif
		Wait \{0.05
			Seconds
			ignoreslomo}
		Change \{generic_menu_block_input = 0}
		LaunchEvent Type = focus target = <objID>
	endif
endscript
