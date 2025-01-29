
script CreateSmoothLoopingMenu \{id = smooth_looping_menu_parent
		menu_id = smooth_looping_menu_id
		parent = root_window
		type = vmenu
		dims = (250.0, 200.0)
		Pos = (0.0, 0.0)
		morph_time = 0.2}
	CreateScreenElement {
		type = WindowElement
		parent = <parent>
		id = <id>
		Pos = <Pos>
		dims = <dims>
		just = [left top]
		tags = {debug_me}
	}
	if (<type> = vmenu)
		event_handlers = [
			{pad_up SmoothMenuScroll params = {Dir = -1 isVertical = true}}
			{pad_down SmoothMenuScroll params = {Dir = 1 isVertical = true}}
		]
	else
		event_handlers = [
			{pad_left SmoothMenuScroll params = {Dir = -1 isVertical = false}}
			{pad_right SmoothMenuScroll params = {Dir = 1 isVertical = false}}
		]
	endif
	CreateScreenElement {
		type = <type>
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

script SmoothMenuScrollMainMenu_ForceUpdate 
	GetScreenElementProps \{id = mainmenu_id
		force_update}
endscript

script SmoothMenuScrollMainMenu_ArrayIndexWrap 
	RequireParams \{[
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

script SmoothMenuScrollMainMenu 
	RequireParams \{[
			Dir
			isVertical
		]
		all}
	if NOT ScreenElementExists \{id = mainmenu_id}
		return
	endif
	SmoothMenuScrollMainMenu_ForceUpdate
	Obj_GetID
	GetScreenElementChildren id = <objID>
	GetArraySize \{children}
	Menu_GetSelectedIndex
	SmoothMenuScrollMainMenu_ArrayIndexWrap array_size = <array_size> i = (<selected_index> + 1)
	<a_index> = <i>
	SmoothMenuScrollMainMenu_ArrayIndexWrap array_size = <array_size> i = (<selected_index> + 2)
	<b_index> = <i>
	GetScreenElementPosition id = (<children> [<a_index>]) summed
	<a_pos> = <ScreenElementPos>
	GetScreenElementPosition id = (<children> [<b_index>]) summed
	<b_pos> = <ScreenElementPos>
	<diff_pos_y> = ((<b_pos> - <a_pos>).(0.0, 1.0))
	<adjustment_pos> = ((0.0, 1.0) * <diff_pos_y> * 1 * <Dir>)
	mainmenu_id :SE_SetProps mainmenu_scroll_adjustment_pos = <adjustment_pos> time = 0
	mainmenu_id :SE_SetProps \{mainmenu_scroll_adjustment_pos = (0.0, 0.0)
		time = 0.15
		motion = ease_out}
endscript

script SmoothMenuScroll 
	GetSingleTag \{smooth_morph_time}
	SetSpawnedScriptNoRepeatFor time = (<smooth_morph_time> + 0.05)
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	RequireParams \{[
			Dir
			isVertical
		]
		all}
	Obj_GetID
	if GotParam \{play_scroll_sound}
		if NOT (<play_scroll_sound> = 0)
			generic_menu_up_or_down_sound
		endif
	endif
	if CountScreenElementChildren id = <objID>
		LaunchEvent type = unfocus target = <objID>
		Change \{generic_menu_block_input = 1}
		<objID> :SE_GetProps
		GetScreenElementChildren id = <objID>
		smoothmenu_get_end_children children = <children>
		<scaled_width> = ((<dims>.(1.0, 0.0) * <scale>.(1.0, 0.0)))
		<scaled_height> = ((<dims>.(0.0, 1.0) * <scale>.(0.0, 1.0)))
		GetScreenElementPosition id = (<children> [<top_index>]) summed
		<a_pos> = <ScreenElementPos>
		SmoothMenuScrollMainMenu_ArrayIndexWrap array_size = <num_children> i = (<top_index> + 1)
		GetScreenElementPosition id = (<children> [<i>]) summed
		<b_pos> = <ScreenElementPos>
		if (<isVertical> = true)
			<shift> = ((<b_pos> - <a_pos>).(0.0, 1.0) * (0.0, 1.0))
		else
			<shift> = ((<b_pos> - <a_pos>).(1.0, 0.0) * (1.0, 0.0))
		endif
		if (<Dir> = -1)
			SE_SetProps Pos = {<shift> relative} time = <smooth_morph_time>
			SE_WaitProps
			Menu_ChangeSelection \{up}
			SE_SetProps Pos = {(<shift> * -1) relative} time = 0.0
			SE_WaitProps
		else
			SE_SetProps Pos = {(<shift> * -1) relative} time = <smooth_morph_time>
			SE_WaitProps
			Menu_ChangeSelection \{down}
			SE_SetProps Pos = {<shift> relative} time = 0.0
			SE_WaitProps
		endif
		if ScreenElementExists \{id = dummy_menu_item_bottom}
			DestroyScreenElement \{id = dummy_menu_item_bottom}
		endif
		if ScreenElementExists \{id = dummy_menu_item_top}
			DestroyScreenElement \{id = dummy_menu_item_top}
		endif
		wait \{2
			gameframes}
		create_dummy_menu_items_worker menu_id = <objID>
		Change \{generic_menu_block_input = 0}
		LaunchEvent type = focus target = <objID>
	endif
endscript

script smoothmenu_get_end_children 
	RequireParams \{[
			children
		]
		all}
	GetArraySize \{children}
	if (<array_size> = 0)
		softassert \{qs(0x3a9f5d58)}
		return
	endif
	<top_index> = 0
	<bottom_index> = 0
	i = 1
	begin
	next_child = (<children> [<i>])
	GetScreenElementPosition id = <next_child>
	next_child_y = (<ScreenElementPos>.(0.0, 1.0))
	cur_top_child = (<children> [<top_index>])
	GetScreenElementPosition id = <cur_top_child>
	cur_top_y = (<ScreenElementPos>.(0.0, 1.0))
	cur_bottom_child = (<children> [<bottom_index>])
	GetScreenElementPosition id = <cur_bottom_child>
	cur_bottom_y = (<ScreenElementPos>.(0.0, 1.0))
	if (<next_child_y> < <cur_top_y>)
		<top_index> = <i>
	endif
	if (<next_child_y> > <cur_bottom_y>)
		<bottom_index> = <i>
	endif
	<i> = (<i> + 1)
	repeat (<array_size> - 1)
	return {top_index = <top_index> bottom_index = <bottom_index> top_child = (<children> [<top_index>]) bottom_child = (<children> [<bottom_index>])}
endscript

script test_smoothRingMenu 
	<menu_id> = test_MARKW
	DestroyScreenElement \{id = current_menu}
	DestroyScreenElement \{id = test_MARKW_Window}
	CreateSmoothLoopingMenu {
		id = test_MARKW_Window
		parent = root_window
		menu_id = <menu_id>
		dims = (800.0, 150.0)
		Pos = (150.0, 450.0)
		type = HMenu
		morph_time = 0.5
	}
	<i> = 1
	begin
	CreateScreenElement {
		type = ContainerElement
		parent = <menu_id>
		dims = (175.0, 45.0)
		just = [center center]
		internal_just = [center center]
		pos_anchor = [center center]
		event_handlers = [
			{focus test_smoothFocus params = {focus = 1}}
			{unfocus test_smoothFocus params = {focus = 0}}
		]
	}
	FormatText TextName = itemName qs(0xa789b83c) i = <i>
	CreateScreenElement {
		local_id = text
		type = TextBlockElement
		parent = <id>
		Pos = (0.0, 0.0)
		dims = (200.0, 50.0)
		font = fontgrid_text_A1
		rgba = [192 192 192 255]
		internal_scale = 0.5
		text = <itemName>
		just = [center center]
		internal_just = [center center]
		pos_anchor = [center center]
	}
	<i> = (<i> + 1)
	repeat 5
	LaunchEvent type = focus target = <menu_id>
endscript

script test_smoothFocus 
	Obj_GetID
	ResolveScreenElementID id = {<objID> child = text}
	if (<focus> = 1)
		<resolved_id> :SE_SetProps rgba = [192 255 255 255] relative_scale scale = 1.5 time = 0.2
	else
		wait \{0.1
			second}
		<resolved_id> :SE_SetProps rgba = [192 192 192 255] relative_scale scale = 1.0 time = 0.2
	endif
endscript
