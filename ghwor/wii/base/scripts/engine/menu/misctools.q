Thread0SkaterBudget = 30
Thread0RenderBudget = 30
Thread0AIBudget = 30
Thread0AIAgentBudget = 3
Thread0AINavigationBudget = 4
Thread0AIBehaviorSystemBudget = 4
Thread0AISeekBudget = 3
Thread0AIAnimTreeBudget = 10
Thread0AINavCollisionBudget = 1
Thread0BudgetAlwaysOn = 0
profiler_vblanks = -1
poly_count_on = 0
force_nodelistman_metrics = 0
nodelistman_metrics_mode = 0
hi_def_globalscale = 0.6
hi_def_globalscale_gap = 0.4
low_def_globalscale = 0.8
low_def_globalscale_gap = 0.7
globalscale = 0.8
globalscale_gap = 0.7
g_screen_width = 1280
g_screen_height = 720
g_screen_title_safe = 0.8
g_screen_action_safe = 0.9

script screen_outline \{rgba = [
			255
			255
			255
			100
		]}
	if ScreenElementExists \{id = outline_anchor}
		DestroyScreenElement \{id = outline_anchor}
	endif
	if GotParam \{Die}
		return
	endif
	SetScreenElementLock \{id = root_window
		OFF}
	CreateScreenElement \{Type = ContainerElement
		id = outline_anchor
		parent = root_window
		tags = {
			hide_from_debugger
		}
		just = [
			left
			top
		]
		z_priority = 5000}
	<screenwidth> = ($g_screen_width)
	<screenheight> = ($g_screen_height)
	<frames> = 2
	begin
	switch <frames>
		case 2
		<safe> = ($g_screen_title_safe)
		<thick> = 1
		<text> = qs(0x0baa46ef)
		default
		<safe> = ($g_screen_action_safe)
		<thick> = 3
		<text> = qs(0x3b6189d3)
	endswitch
	<width_title> = (<screenwidth> * <safe>)
	<height_title> = (<screenheight> * <safe>)
	<title_top> = {
		Pos = ((<screenwidth> * (0.5, 0.0)) + ((<screenheight> - <height_title>) * (0.0, 0.5)))
		dims = ((<width_title> * (1.0, 0.0)) + (<thick> * (0.0, 1.0)))
	}
	<title_bottom> = {
		Pos = ((<screenwidth> * (0.5, 0.0)) + ((<screenheight> * (0.0, 1.0)) - (<screenheight> - <height_title>) * (0.0, 0.5)))
		dims = ((<width_title> * (1.0, 0.0)) + (<thick> * (0.0, 1.0)))
	}
	<title_left> = {
		Pos = (((<screenwidth> - <width_title>) * (0.5, 0.0)) + (<screenheight> * (0.0, 0.5)))
		dims = ((<height_title> * (0.0, 1.0)) + (<thick> * (1.0, 0.0)))
	}
	<title_right> = {
		Pos = (((<screenwidth> * (1.0, 0.0)) - (<screenwidth> - <width_title>) * (0.5, 0.0)) + (<screenheight> * (0.0, 0.5)))
		dims = ((<height_title> * (0.0, 1.0)) + (<thick> * (1.0, 0.0)))
	}
	CreateScreenElement {
		Type = TextElement
		parent = outline_anchor
		tags = {hide_from_debugger}
		just = [center top]
		rgba = <rgba>
		Pos = ((<screenwidth> * (0.5, 0.0)) + ((<screenheight> - <height_title>) * (0.0, 0.5)))
		font = debug
		Scale = 0.5
		text = <text>
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = outline_anchor
		tags = {hide_from_debugger}
		just = [center top]
		rgba = <rgba>
		<title_top>
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = outline_anchor
		tags = {hide_from_debugger}
		just = [center bottom]
		rgba = <rgba>
		<title_bottom>
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = outline_anchor
		tags = {hide_from_debugger}
		just = [right center]
		rgba = <rgba>
		<title_right>
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = outline_anchor
		tags = {hide_from_debugger}
		just = [left center]
		rgba = <rgba>
		<title_left>
	}
	<frames> = (<frames> - 1)
	repeat 2
	<center_vert> = {
		Pos = ((<screenwidth> * (0.5, 0.0)) + (<screenheight> * (0.0, 0.5)))
		dims = ((<height_title> * (0.0, 0.1)) + (<thick> * (1.0, 0.0)))
	}
	<center_horz> = {
		Pos = ((<screenwidth> * (0.5, 0.0)) + (<screenheight> * (0.0, 0.5)))
		dims = ((<width_title> * (0.1, 0.0)) + (<thick> * (0.0, 1.0)))
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = outline_anchor
		tags = {hide_from_debugger}
		just = [center center]
		rgba = <rgba>
		<center_vert>
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = outline_anchor
		tags = {hide_from_debugger}
		just = [center center]
		rgba = <rgba>
		<center_horz>
	}
endscript
debug_sysnotify_x = [
	360
	640
	920
]
debug_sysnotify_y = [
	55
	374
	620
]

script sysnotify_outline 
	if ScreenElementExists \{id = sysnotify_outline_anchor}
		DestroyScreenElement \{id = sysnotify_outline_anchor}
	endif
	if GotParam \{Die}
		return
	endif
	CreateScreenElement \{Type = ContainerElement
		id = sysnotify_outline_anchor
		parent = root_window
		tags = {
			hide_from_debugger
		}
		just = [
			left
			top
		]
		z_priority = 5000
		Pos = (0.0, 0.0)}
	<box_dims> = (340.0, 78.0)
	<box_x> = $debug_sysnotify_x
	<box_x_rgba> = [[180 100 100 255] [100 180 100 255] [100 100 180 255]]
	<box_y> = $debug_sysnotify_y
	<y_idx> = 0
	begin
	<x_idx> = 0
	begin
	CreateScreenElement {
		parent = sysnotify_outline_anchor
		Type = SpriteElement
		tags = {debug_me}
		just = [center center]
		dims = <box_dims>
		Pos = ((<box_x> [<x_idx>]) * (1.0, 0.0) + (<box_y> [<y_idx>]) * (0.0, 1.0))
		texture = white
		rgba = (<box_x_rgba> [<x_idx>])
		alpha = 0.5
	}
	<x_idx> = (<x_idx> + 1)
	repeat 3
	<y_idx> = (<y_idx> + 1)
	repeat 3
endscript

script sysnotify_outline_current 
	if ScreenElementExists \{id = sysnotify_outline_anchor}
		DestroyScreenElement \{id = sysnotify_outline_anchor}
	endif
	if GotParam \{Die}
		return
	endif
	CreateScreenElement \{Type = ContainerElement
		id = sysnotify_outline_anchor
		parent = root_window
		tags = {
			hide_from_debugger
		}
		just = [
			left
			top
		]
		z_priority = 5000
		Pos = (0.0, 0.0)}
	begin
	<x_idx> = 0
	<y_idx> = 0
	getsystemnotificationposition
	switch <system_notification_position>
		case topleft
		<x_idx> = 0
		<y_idx> = 0
		case topcenter
		<x_idx> = 1
		<y_idx> = 0
		case topright
		<x_idx> = 2
		<y_idx> = 0
		case centerleft
		<x_idx> = 0
		<y_idx> = 1
		case center
		<x_idx> = 1
		<y_idx> = 1
		case centerright
		<x_idx> = 2
		<y_idx> = 1
		case bottomleft
		<x_idx> = 0
		<y_idx> = 2
		case bottomcenter
		<x_idx> = 1
		<y_idx> = 2
		case bottomright
		<x_idx> = 2
		<y_idx> = 2
	endswitch
	<box_dims> = (340.0, 78.0)
	<box_x> = $debug_sysnotify_x
	<box_y> = $debug_sysnotify_y
	DestroyScreenElement \{id = {
			sysnotify_outline_anchor
			child = curr
		}}
	CreateScreenElement {
		local_id = curr
		parent = sysnotify_outline_anchor
		Type = SpriteElement
		tags = {debug_me}
		just = [center center]
		dims = <box_dims>
		Pos = ((<box_x> [<x_idx>]) * (1.0, 0.0) + (<box_y> [<y_idx>]) * (0.0, 1.0))
		texture = white
		rgba = [128 128 128 255]
		alpha = 0.75
	}
	Wait \{30
		gameframes}
	repeat
endscript
