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
		Change \{poly_count_on = 1}
		GetCurrentLevel
		refresh_map_data
	else
		Change \{poly_count_on = 0}
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
		printf \{"eh"}
		GetUSGData \{level_default}
	else
		GetUSGData
	endif
	if ScreenElementExists \{id = map_data_anchor}
		DestroyScreenElement \{id = map_data_anchor}
	endif
	formatText TextName = polys "Polys: %a" a = (<usg_data>.polys)
	formatText TextName = instance_polys "Inst Polys: %a" a = (<usg_data>.instance_polys)
	formatText TextName = zone_file_size "File: %a K" a = ((<usg_data>.file_size) / 1024)
	formatText TextName = max_file_size "Max File: %a K" a = ((<usg_data>.max_file_size) / 1024)
	formatText TextName = texture_file_size "Textures: %a K" a = ((<usg_data>.texture_size) / 1024)
	formatText TextName = collision_size "Collision: %a K" a = ((<usg_data>.collision_size) / 1024)
	formatText TextName = geom_size "Geom: %a K" a = ((<usg_data>.geom_size) / 1024)
	SetScreenElementLock \{id = root_window
		OFF}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = map_data_anchor
		Pos = (440.0, 40.0)
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
		Type = TextElement
		parent = map_data_anchor
		Pos = (0.0, 45.0)
		text = (<usg_data>.Name)
		font = text_a1
		rgba = [60 60 100 100]
		just = [left center]
		Scale = 0.8
		z_priority = 100
	}
	CreateScreenElement {
		Type = TextElement
		parent = map_data_anchor
		Pos = (0.0, 60.0)
		text = <polys>
		font = text_a1
		rgba = [58 108 58 100]
		just = [left center]
		Scale = 0.8
		z_priority = 100
	}
	CreateScreenElement {
		Type = TextElement
		parent = map_data_anchor
		Pos = (0.0, 75.0)
		text = <instance_polys>
		font = text_a1
		rgba = [58 108 58 100]
		just = [left center]
		Scale = 0.8
		z_priority = 100
	}
	CreateScreenElement {
		Type = TextElement
		parent = map_data_anchor
		Pos = (0.0, 90.0)
		text = <zone_file_size>
		font = text_a1
		rgba = [58 108 58 100]
		just = [left center]
		Scale = 0.8
		z_priority = 100
	}
	CreateScreenElement {
		Type = TextElement
		parent = map_data_anchor
		Pos = (0.0, 105.0)
		text = <max_file_size>
		font = text_a1
		rgba = [58 108 58 100]
		just = [left center]
		Scale = 0.8
		z_priority = 100
	}
	CreateScreenElement {
		Type = TextElement
		parent = map_data_anchor
		Pos = (0.0, 120.0)
		text = <collision_size>
		font = text_a1
		rgba = [58 108 58 100]
		just = [left center]
		Scale = 0.8
		z_priority = 100
	}
	CreateScreenElement {
		Type = TextElement
		parent = map_data_anchor
		Pos = (0.0, 135.0)
		text = <geom_size>
		font = text_a1
		rgba = [58 108 58 100]
		just = [left center]
		Scale = 0.8
		z_priority = 100
	}
	CreateScreenElement {
		Type = TextElement
		parent = map_data_anchor
		Pos = (0.0, 150.0)
		text = <texture_file_size>
		font = text_a1
		rgba = [58 108 58 100]
		just = [left center]
		Scale = 0.8
		z_priority = 100
	}
	y_coord = 165
	if StructureContains \{structure = usg_data
			artists}
		GetArraySize (<usg_data>.artists)
		index = 0
		begin
		formatText TextName = artist_name "%a: %b K" a = (<usg_data>.artists [<index>].Name) b = ((<usg_data>.artists [<index>].size) / 1024)
		CreateScreenElement {
			Type = TextElement
			parent = map_data_anchor
			Pos = (((0.0, 1.0) * <y_coord>) + (10.0, 0.0))
			text = <artist_name>
			font = text_a1
			rgba = [58 108 58 100]
			just = [left center]
			Scale = 0.8
			z_priority = 100
		}
		y_coord = (<y_coord> + 15)
		index = (<index> + 1)
		repeat <array_Size>
	endif
endscript

script show_render_metrics_toggle 
	ToggleRenderMetrics
	if ScreenElementExists \{id = render_metric_anchor}
		DestroyScreenElement \{id = render_metric_anchor}
		DoScreenElementMorph \{id = the_score_sprite
			Scale = 1}
		DoScreenElementMorph \{id = the_score
			Scale = 1}
		show_compass_anchor
	else
		DoScreenElementMorph \{id = the_score_sprite
			Scale = 0}
		DoScreenElementMorph \{id = the_score
			Scale = 0}
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
	Change \{force_nodelistman_metrics = 1}
	Change \{nodelistman_metrics_mode = 2}
endscript

script NodelistManMonitor 
	Change \{force_nodelistman_metrics = 1}
	Change \{nodelistman_metrics_mode = 0}
endscript

script show_render_metrics \{anchor_id = render_metric_anchor
		Pos = (20.0, 30.0)}
	if ($highdefviewer = 1)
		Change \{globalscale = $hi_def_globalscale}
		Change \{globalscale_gap = $hi_def_globalscale_gap}
	endif
	if ($highdefviewer = 0)
		Change \{globalscale = $low_def_globalscale}
		Change \{globalscale_gap = $low_def_globalscale_gap}
	endif
	MangleChecksums a = <anchor_id> b = VMenu
	<vmenu_id> = <mangled_ID>
	if NOT ScreenElementExists id = <anchor_id>
		SetScreenElementLock \{id = root_window
			OFF}
		CreateScreenElement {
			Type = ContainerElement
			parent = root_window
			id = <anchor_id>
			Pos = <Pos>
			just = [left top]
			internal_just = [left center]
			alpha = 0.55
			z_priority = 10001
			Scale = $globalscale
		}
		CreateScreenElement {
			Type = VMenu
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
		SetScreenElementLock id = <vmenu_id> OFF
		CreateScreenElement {
			Type = TextElement
			parent = <vmenu_id>
			text = ""
			font = text_a1
			just = [left top]
			Scale = $globalscale
		}
		SetScreenElementLock id = <vmenu_id> On
	endif
	formatText TextName = text "%n: %d" n = <Name> d = <value>
	if checksumequals a = <overbudget> b = true
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
	<screenwidth> = 1280
	<screenheight> = 720
	<frames> = 2
	begin
	switch <frames>
		case 2
		<safe> = 0.8
		<thick> = 1
		<text> = "HD TITLE SAFE"
		default
		<safe> = 0.9
		<thick> = 3
		<text> = "HD ACTION SAFE"
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
		font = text_a1
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
	<frames> = 2
	begin
	switch <frames>
		case 2
		<safe> = 0.6
		<thick> = 1
		<text> = "SD TITLE"
		<height_title> = (<screenheight> * 0.8)
		default
		<safe> = 0.675
		<thick> = 3
		<text> = "SD ACTION"
		<height_title> = (<screenheight> * 0.9)
	endswitch
	<width_title> = (<screenwidth> * <safe>)
	<title_left_SD> = {
		Pos = (((<screenwidth> - <width_title>) * (0.5, 0.0)) + (<screenheight> * (0.0, 0.5)))
		dims = ((<height_title> * (0.0, 1.0)) + (<thick> * (1.0, 0.0)))
	}
	<title_right_SD> = {
		Pos = (((<screenwidth> * (1.0, 0.0)) - (<screenwidth> - <width_title>) * (0.5, 0.0)) + (<screenheight> * (0.0, 0.5)))
		dims = ((<height_title> * (0.0, 1.0)) + (<thick> * (1.0, 0.0)))
	}
	CreateScreenElement {
		Type = TextElement
		parent = outline_anchor
		tags = {hide_from_debugger}
		just = [center top]
		rgba = <rgba>
		Pos = ((<screenheight> * (0.0, 0.5)) + ((<screenwidth> - <width_title>) * (0.5, 0.0)))
		font = text_a1
		Scale = 0.5
		rot_angle = 90
		text = <text>
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = outline_anchor
		tags = {hide_from_debugger}
		just = [right center]
		rgba = <rgba>
		<title_right_SD>
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = outline_anchor
		tags = {hide_from_debugger}
		just = [left center]
		rgba = <rgba>
		<title_left_SD>
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
