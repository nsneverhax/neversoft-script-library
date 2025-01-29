
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
	RequireParams \{[
			Dir
			isvertical
		]
		all}
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
			Seconds}
		Change \{generic_menu_block_input = 0}
		LaunchEvent Type = focus target = <objID>
	endif
endscript

script test_smoothringmenu 
	<menu_id> = test_markw
	DestroyScreenElement \{id = current_menu}
	DestroyScreenElement \{id = test_markw_window}
	createsmoothloopingmenu {
		id = test_markw_window
		parent = root_window
		menu_id = <menu_id>
		dims = (800.0, 150.0)
		Pos = (150.0, 450.0)
		Type = HMenu
		morph_time = 0.5
	}
	<i> = 1
	begin
	CreateScreenElement {
		Type = ContainerElement
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
	formatText TextName = itemname qs(0xa789b83c) i = <i>
	CreateScreenElement {
		local_id = text
		Type = TextBlockElement
		parent = <id>
		Pos = (0.0, 0.0)
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
	LaunchEvent Type = focus target = <menu_id>
endscript

script test_smoothfocus 
	Obj_GetID
	ResolveScreenElementID id = {<objID> child = text}
	if (<focus> = 1)
		<resolved_id> :se_setprops rgba = [192 255 255 255] relative_scale Scale = 1.5 time = 0.2
	else
		Wait \{0.1
			Second}
		<resolved_id> :se_setprops rgba = [192 192 192 255] relative_scale Scale = 1.0 time = 0.2
	endif
endscript
