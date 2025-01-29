
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

script 0x420493b3 
	GetScreenElementProps \{id = mainmenu_id
		force_update}
endscript

script 0x9523dc93 
	RequireParams \{[
			array_Size
			i
		]
		all}
	if (<i> < 0)
		return i = (<i> + <array_Size>)
	elseif (<i> < <array_Size>)
		return i = <i>
	else
		return i = (<i> - <array_Size>)
	endif
endscript

script 0xbecf6bba 
	RequireParams \{[
			Dir
			isvertical
		]
		all}
	if NOT ScreenElementExists \{id = mainmenu_id}
		return
	endif
	0x420493b3
	Obj_GetID
	GetScreenElementChildren id = <objID>
	GetArraySize \{children}
	menu_getselectedindex
	0x9523dc93 array_Size = <array_Size> i = (<selected_index> + 1)
	<0xf4db4dee> = <i>
	0x9523dc93 array_Size = <array_Size> i = (<selected_index> + 2)
	<0xc5335773> = <i>
	GetScreenElementPosition id = (<children> [<0xf4db4dee>]) summed
	<0x71797655> = <screenelementpos>
	GetScreenElementPosition id = (<children> [<0xc5335773>]) summed
	<0x36d90c85> = <screenelementpos>
	<0xef59372d> = ((<0x36d90c85> - <0x71797655>).(0.0, 1.0))
	<0x4cc75072> = ((0.0, 1.0) * <0xef59372d> * 1 * <Dir>)
	mainmenu_id :se_setprops 0x17275a79 = <0x4cc75072> time = 0
	mainmenu_id :se_setprops \{0x17275a79 = (0.0, 0.0)
		time = 0.15
		motion = ease_out}
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
	if GotParam \{play_scroll_sound}
		if NOT (<play_scroll_sound> = 0)
			generic_menu_up_or_down_sound
		endif
	endif
	if countscreenelementchildren id = <objID>
		LaunchEvent Type = unfocus target = <objID>
		Change \{generic_menu_block_input = 1}
		<objID> :se_getprops
		GetScreenElementChildren id = <objID>
		0x10edceb4 children = <children>
		<scaled_width> = ((<dims>.(1.0, 0.0) * <Scale>.(1.0, 0.0)))
		<scaled_height> = ((<dims>.(0.0, 1.0) * <Scale>.(0.0, 1.0)))
		GetScreenElementPosition id = (<children> [<0xea93318a>]) summed
		<0x71797655> = <screenelementpos>
		0x9523dc93 array_Size = <num_children> i = (<0xea93318a> + 1)
		GetScreenElementPosition id = (<children> [<i>]) summed
		<0x36d90c85> = <screenelementpos>
		if (<isvertical> = true)
			<shift> = ((<0x36d90c85> - <0x71797655>).(0.0, 1.0) * (0.0, 1.0))
		else
			<shift> = ((<0x36d90c85> - <0x71797655>).(1.0, 0.0) * (1.0, 0.0))
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
		if ScreenElementExists \{id = 0x1fa57cc3}
			DestroyScreenElement \{id = 0x1fa57cc3}
		endif
		if ScreenElementExists \{id = 0x0089ba67}
			DestroyScreenElement \{id = 0x0089ba67}
		endif
		Wait \{2
			gameframes}
		0xeeaaf227 menu_id = <objID>
		Change \{generic_menu_block_input = 0}
		LaunchEvent Type = focus target = <objID>
	endif
endscript

script 0x10edceb4 
	RequireParams \{[
			children
		]
		all}
	GetArraySize \{children}
	if (<array_Size> = 0)
		SoftAssert \{qs(0x3a9f5d58)}
		return
	endif
	<0xea93318a> = 0
	<bottom_index> = 0
	i = 1
	begin
	0xbb7400aa = (<children> [<i>])
	GetScreenElementPosition id = <0xbb7400aa>
	0x40126714 = (<screenelementpos>.(0.0, 1.0))
	0x40af260d = (<children> [<0xea93318a>])
	GetScreenElementPosition id = <0x40af260d>
	0x319bf3ed = (<screenelementpos>.(0.0, 1.0))
	0xbca6dd22 = (<children> [<bottom_index>])
	GetScreenElementPosition id = <0xbca6dd22>
	0x4fa507ec = (<screenelementpos>.(0.0, 1.0))
	if (<0x40126714> < <0x319bf3ed>)
		<0xea93318a> = <i>
	endif
	if (<0x40126714> > <0x4fa507ec>)
		<bottom_index> = <i>
	endif
	<i> = (<i> + 1)
	repeat (<array_Size> - 1)
	return {0xea93318a = <0xea93318a> bottom_index = <bottom_index> 0x485302a2 = (<children> [<0xea93318a>]) 0x2b6198e6 = (<children> [<bottom_index>])}
endscript

script test_smoothringmenu 
	ScriptAssert \{'test_smoothRingMenu: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
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
