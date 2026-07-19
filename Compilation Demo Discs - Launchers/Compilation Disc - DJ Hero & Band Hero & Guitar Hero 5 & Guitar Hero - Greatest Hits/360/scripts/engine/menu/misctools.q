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

script show_poly_count 
	if ($poly_count_on = 0)
		change \{poly_count_on = 1}
		GetCurrentLevel
		refresh_map_data
	else
		change \{poly_count_on = 0}
		if ScreenElementExists \{id = map_data_anchor}
			DestroyScreenElement \{id = map_data_anchor}
		endif
		if ScreenElementExists \{id = texture_list}
			DestroyScreenElement \{id = texture_list}
		endif
	endif
endscript

script refresh_map_data 
	if NOT ($poly_count_on = 1)
		return
	endif
	BlockPendingPakManLoads \{map = zones}
	if LevelIs \{load_default}
		printf \{qs("\Leh")}
		GetUSGData \{level_default}
	else
		GetUSGData
	endif
	if ScreenElementExists \{id = map_data_anchor}
		DestroyScreenElement \{id = map_data_anchor}
	endif
	FormatText TextName = polys qs("\LPolys: %a") a = (<usg_data>.polys)
	FormatText TextName = instance_polys qs("\LInst Polys: %a") a = (<usg_data>.instance_polys)
	FormatText TextName = zone_file_size qs("\LFile: %a K") a = ((<usg_data>.file_size) / 1024)
	FormatText TextName = max_file_size qs("\LMax File: %a K") a = ((<usg_data>.max_file_size) / 1024)
	FormatText TextName = texture_file_size qs("\LTextures: %a K") a = ((<usg_data>.texture_size) / 1024)
	FormatText TextName = collision_size qs("\LCollision: %a K") a = ((<usg_data>.collision_size) / 1024)
	FormatText TextName = geom_size qs("\LGeom: %a K") a = ((<usg_data>.geom_size) / 1024)
	SetScreenElementLock \{id = root_window
		off}
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = map_data_anchor
		pos = (440.0, 40.0)
		just = [
			center
			center
		]
		internal_just = [
			left
			center
		]
		z_priority = 100}
	CreateScreenElement {
		type = TextElement
		parent = map_data_anchor
		pos = (0.0, 45.0)
		text = (<usg_data>.name)
		font = debug
		rgba = [60 60 100 100]
		just = [left center]
		scale = 0.8
		z_priority = 100
	}
	CreateScreenElement {
		type = TextElement
		parent = map_data_anchor
		pos = (0.0, 60.0)
		text = <polys>
		font = debug
		rgba = [58 108 58 100]
		just = [left center]
		scale = 0.8
		z_priority = 100
	}
	CreateScreenElement {
		type = TextElement
		parent = map_data_anchor
		pos = (0.0, 75.0)
		text = <instance_polys>
		font = debug
		rgba = [58 108 58 100]
		just = [left center]
		scale = 0.8
		z_priority = 100
	}
	CreateScreenElement {
		type = TextElement
		parent = map_data_anchor
		pos = (0.0, 90.0)
		text = <zone_file_size>
		font = debug
		rgba = [58 108 58 100]
		just = [left center]
		scale = 0.8
		z_priority = 100
	}
	CreateScreenElement {
		type = TextElement
		parent = map_data_anchor
		pos = (0.0, 105.0)
		text = <max_file_size>
		font = debug
		rgba = [58 108 58 100]
		just = [left center]
		scale = 0.8
		z_priority = 100
	}
	CreateScreenElement {
		type = TextElement
		parent = map_data_anchor
		pos = (0.0, 120.0)
		text = <collision_size>
		font = debug
		rgba = [58 108 58 100]
		just = [left center]
		scale = 0.8
		z_priority = 100
	}
	CreateScreenElement {
		type = TextElement
		parent = map_data_anchor
		pos = (0.0, 135.0)
		text = <geom_size>
		font = debug
		rgba = [58 108 58 100]
		just = [left center]
		scale = 0.8
		z_priority = 100
	}
	CreateScreenElement {
		type = TextElement
		parent = map_data_anchor
		pos = (0.0, 150.0)
		text = <texture_file_size>
		font = debug
		rgba = [58 108 58 100]
		just = [left center]
		scale = 0.8
		z_priority = 100
	}
	y_coord = 165
	if StructureContains \{Structure = usg_data
			artists}
		GetArraySize (<usg_data>.artists)
		index = 0
		begin
		FormatText TextName = artist_name qs("\L%a: %b K") a = (<usg_data>.artists [<index>].name) b = ((<usg_data>.artists [<index>].size) / 1024)
		CreateScreenElement {
			type = TextElement
			parent = map_data_anchor
			pos = (((0.0, 1.0) * <y_coord>) + (10.0, 0.0))
			text = <artist_name>
			font = debug
			rgba = [58 108 58 100]
			just = [left center]
			scale = 0.8
			z_priority = 100
		}
		y_coord = (<y_coord> + 15)
		index = (<index> + 1)
		repeat <array_size>
	endif
endscript

script show_render_metrics_toggle 
	ToggleRenderMetrics
	if ScreenElementExists \{id = render_metric_anchor}
		DestroyScreenElement \{id = render_metric_anchor}
		LegacyDoScreenElementMorph \{id = the_score_sprite
			scale = 1}
		LegacyDoScreenElementMorph \{id = the_score
			scale = 1}
		show_compass_anchor
	else
		LegacyDoScreenElementMorph \{id = the_score_sprite
			scale = 0}
		LegacyDoScreenElementMorph \{id = the_score
			scale = 0}
	endif
endscript
force_nodelistman_metrics = 0
nodelistman_metrics_mode = 0
hi_def_globalscale = 0.6
hi_def_globalscale_gap = 0.4
low_def_globalscale = 0.8
low_def_globalscale_gap = 0.7
globalscale = 0.8
globalscale_gap = 0.7

script NodelistManMonitor_ConsoleOnly 
	change \{force_nodelistman_metrics = 1}
	change \{nodelistman_metrics_mode = 2}
endscript

script NodelistManMonitor 
	change \{force_nodelistman_metrics = 1}
	change \{nodelistman_metrics_mode = 0}
endscript

script show_render_metrics \{anchor_id = render_metric_anchor
		pos = (20.0, 30.0)}
	if ($highdefviewer = 1)
		change \{globalscale = $hi_def_globalscale}
		change \{globalscale_gap = $hi_def_globalscale_gap}
	endif
	if ($highdefviewer = 0)
		change \{globalscale = $low_def_globalscale}
		change \{globalscale_gap = $low_def_globalscale_gap}
	endif
	MangleChecksums a = <anchor_id> b = VMenu
	<vmenu_id> = <mangled_ID>
	if NOT ScreenElementExists id = <anchor_id>
		SetScreenElementLock \{id = root_window
			off}
		CreateScreenElement {
			type = ContainerElement
			parent = root_window
			id = <anchor_id>
			pos = <pos>
			just = [left top]
			internal_just = [left center]
			alpha = 0.55
			z_priority = 10001
			scale = $globalscale
		}
		CreateScreenElement {
			type = VMenu
			parent = <anchor_id>
			id = <vmenu_id>
			just = [left top]
			internal_just = [left center]
			spacing_between = 0
			padding_scale = $globalscale_gap
		}
	endif
	ForEachIn <display_values> do = show_render_metrics_add_item pass_index params = {vmenu_id = <vmenu_id>}
endscript

script show_render_metrics_add_item 
	if NOT ScreenElementExists id = {<vmenu_id> child = <foreachin_index>}
		SetScreenElementLock id = <vmenu_id> off
		CreateScreenElement {
			type = TextElement
			parent = <vmenu_id>
			text = qs("\L")
			font = debug
			just = [left top]
			scale = $globalscale
		}
		SetScreenElementLock id = <vmenu_id> on
	endif
	FormatText TextName = text qs("\L%n: %d") n = <name> d = <value>
	if ChecksumEquals a = <overbudget> b = true
		<rgba> = [128 40 20 255]
	else
		<rgba> = [58 108 58 255]
	endif
	SetScreenElementProps {
		id = {<vmenu_id> child = <foreachin_index>}
		text = <text>
		rgba = <rgba>
	}
endscript

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
		off}
	CreateScreenElement \{type = ContainerElement
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
	<screenwidth> = 1280
	<screenheight> = 720
	<frames> = 2
	begin
	switch <frames>
		case 2
		<safe> = 0.8
		<thick> = 1
		<text> = qs("\LHD TITLE SAFE")
		default
		<safe> = 0.9
		<thick> = 3
		<text> = qs("\LHD ACTION SAFE")
	endswitch
	<width_title> = (<screenwidth> * <safe>)
	<height_title> = (<screenheight> * <safe>)
	<title_top> = {
		pos = ((<screenwidth> * (0.5, 0.0)) + ((<screenheight> - <height_title>) * (0.0, 0.5)))
		dims = ((<width_title> * (1.0, 0.0)) + (<thick> * (0.0, 1.0)))
	}
	<title_bottom> = {
		pos = ((<screenwidth> * (0.5, 0.0)) + ((<screenheight> * (0.0, 1.0)) - (<screenheight> - <height_title>) * (0.0, 0.5)))
		dims = ((<width_title> * (1.0, 0.0)) + (<thick> * (0.0, 1.0)))
	}
	<title_left> = {
		pos = (((<screenwidth> - <width_title>) * (0.5, 0.0)) + (<screenheight> * (0.0, 0.5)))
		dims = ((<height_title> * (0.0, 1.0)) + (<thick> * (1.0, 0.0)))
	}
	<title_right> = {
		pos = (((<screenwidth> * (1.0, 0.0)) - (<screenwidth> - <width_title>) * (0.5, 0.0)) + (<screenheight> * (0.0, 0.5)))
		dims = ((<height_title> * (0.0, 1.0)) + (<thick> * (1.0, 0.0)))
	}
	CreateScreenElement {
		type = TextElement
		parent = outline_anchor
		tags = {hide_from_debugger}
		just = [center top]
		rgba = <rgba>
		pos = ((<screenwidth> * (0.5, 0.0)) + ((<screenheight> - <height_title>) * (0.0, 0.5)))
		font = debug
		scale = 0.5
		text = <text>
	}
	CreateScreenElement {
		type = SpriteElement
		parent = outline_anchor
		tags = {hide_from_debugger}
		just = [center top]
		rgba = <rgba>
		<title_top>
	}
	CreateScreenElement {
		type = SpriteElement
		parent = outline_anchor
		tags = {hide_from_debugger}
		just = [center bottom]
		rgba = <rgba>
		<title_bottom>
	}
	CreateScreenElement {
		type = SpriteElement
		parent = outline_anchor
		tags = {hide_from_debugger}
		just = [right center]
		rgba = <rgba>
		<title_right>
	}
	CreateScreenElement {
		type = SpriteElement
		parent = outline_anchor
		tags = {hide_from_debugger}
		just = [left center]
		rgba = <rgba>
		<title_left>
	}
	<frames> = (<frames> - 1)
	repeat 2
	<center_vert> = {
		pos = ((<screenwidth> * (0.5, 0.0)) + (<screenheight> * (0.0, 0.5)))
		dims = ((<height_title> * (0.0, 0.1)) + (<thick> * (1.0, 0.0)))
	}
	<center_horz> = {
		pos = ((<screenwidth> * (0.5, 0.0)) + (<screenheight> * (0.0, 0.5)))
		dims = ((<width_title> * (0.1, 0.0)) + (<thick> * (0.0, 1.0)))
	}
	CreateScreenElement {
		type = SpriteElement
		parent = outline_anchor
		tags = {hide_from_debugger}
		just = [center center]
		rgba = <rgba>
		<center_vert>
	}
	CreateScreenElement {
		type = SpriteElement
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
	CreateScreenElement \{type = ContainerElement
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
		pos = (0.0, 0.0)}
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
		type = SpriteElement
		tags = {debug_me}
		just = [center center]
		dims = <box_dims>
		pos = ((<box_x> [<x_idx>]) * (1.0, 0.0) + (<box_y> [<y_idx>]) * (0.0, 1.0))
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
	CreateScreenElement \{type = ContainerElement
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
		pos = (0.0, 0.0)}
	begin
	<x_idx> = 0
	<y_idx> = 0
	GetSystemNotificationPosition
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
		type = SpriteElement
		tags = {debug_me}
		just = [center center]
		dims = <box_dims>
		pos = ((<box_x> [<x_idx>]) * (1.0, 0.0) + (<box_y> [<y_idx>]) * (0.0, 1.0))
		texture = white
		rgba = [128 128 128 255]
		alpha = 0.75
	}
	Wait \{30
		gameframes}
	repeat
endscript
