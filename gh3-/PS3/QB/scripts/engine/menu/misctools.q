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
		if ScreenElementExists \{Id = map_data_anchor}
			DestroyScreenElement \{Id = map_data_anchor}
		endif
		if ScreenElementExists \{Id = texture_list}
			DestroyScreenElement \{Id = texture_list}
		endif
	endif
endscript

script refresh_map_data 
	if NOT ($poly_count_on = 1)
		return
	endif
	BlockPendingPakManLoads \{map = Zones}
	if LevelIs \{load_default}
		Printf \{"eh"}
		GetUSGData \{level_default}
	else
		GetUSGData
	endif
	if ScreenElementExists \{Id = map_data_anchor}
		DestroyScreenElement \{Id = map_data_anchor}
	endif
	FormatText TextName = polys "Polys: %a" A = (<usg_data>.polys)
	FormatText TextName = instance_polys "Inst Polys: %a" A = (<usg_data>.instance_polys)
	FormatText TextName = zone_file_size "File: %a K" A = ((<usg_data>.file_size) / 1024)
	FormatText TextName = max_file_size "Max File: %a K" A = ((<usg_data>.max_file_size) / 1024)
	FormatText TextName = texture_file_size "Textures: %a K" A = ((<usg_data>.texture_size) / 1024)
	FormatText TextName = collision_size "Collision: %a K" A = ((<usg_data>.collision_size) / 1024)
	FormatText TextName = geom_size "Geom: %a K" A = ((<usg_data>.geom_size) / 1024)
	SetScreenElementLock \{Id = root_window
		OFF}
	CreateScreenElement \{Type = ContainerElement
		PARENT = root_window
		Id = map_data_anchor
		Pos = (440.0, 40.0)
		just = [
			Center
			Center
		]
		internal_just = [
			LEFT
			Center
		]
		z_priority = 100}
	CreateScreenElement {
		Type = TextElement
		PARENT = map_data_anchor
		Pos = (0.0, 45.0)
		Text = (<usg_data>.Name)
		font = text_A1
		rgba = [60 60 100 100]
		just = [LEFT Center]
		Scale = 0.8
		z_priority = 100
	}
	CreateScreenElement {
		Type = TextElement
		PARENT = map_data_anchor
		Pos = (0.0, 60.0)
		Text = <polys>
		font = text_A1
		rgba = [58 108 58 100]
		just = [LEFT Center]
		Scale = 0.8
		z_priority = 100
	}
	CreateScreenElement {
		Type = TextElement
		PARENT = map_data_anchor
		Pos = (0.0, 75.0)
		Text = <instance_polys>
		font = text_A1
		rgba = [58 108 58 100]
		just = [LEFT Center]
		Scale = 0.8
		z_priority = 100
	}
	CreateScreenElement {
		Type = TextElement
		PARENT = map_data_anchor
		Pos = (0.0, 90.0)
		Text = <zone_file_size>
		font = text_A1
		rgba = [58 108 58 100]
		just = [LEFT Center]
		Scale = 0.8
		z_priority = 100
	}
	CreateScreenElement {
		Type = TextElement
		PARENT = map_data_anchor
		Pos = (0.0, 105.0)
		Text = <max_file_size>
		font = text_A1
		rgba = [58 108 58 100]
		just = [LEFT Center]
		Scale = 0.8
		z_priority = 100
	}
	CreateScreenElement {
		Type = TextElement
		PARENT = map_data_anchor
		Pos = (0.0, 120.0)
		Text = <collision_size>
		font = text_A1
		rgba = [58 108 58 100]
		just = [LEFT Center]
		Scale = 0.8
		z_priority = 100
	}
	CreateScreenElement {
		Type = TextElement
		PARENT = map_data_anchor
		Pos = (0.0, 135.0)
		Text = <geom_size>
		font = text_A1
		rgba = [58 108 58 100]
		just = [LEFT Center]
		Scale = 0.8
		z_priority = 100
	}
	CreateScreenElement {
		Type = TextElement
		PARENT = map_data_anchor
		Pos = (0.0, 150.0)
		Text = <texture_file_size>
		font = text_A1
		rgba = [58 108 58 100]
		just = [LEFT Center]
		Scale = 0.8
		z_priority = 100
	}
	y_coord = 165
	if StructureContains \{Structure = usg_data
			artists}
		GetArraySize (<usg_data>.artists)
		Index = 0
		begin
		FormatText TextName = artist_name "%a: %b K" A = (<usg_data>.artists [<Index>].Name) B = ((<usg_data>.artists [<Index>].Size) / 1024)
		CreateScreenElement {
			Type = TextElement
			PARENT = map_data_anchor
			Pos = (((0.0, 1.0) * <y_coord>) + (10.0, 0.0))
			Text = <artist_name>
			font = text_A1
			rgba = [58 108 58 100]
			just = [LEFT Center]
			Scale = 0.8
			z_priority = 100
		}
		y_coord = (<y_coord> + 15)
		Index = (<Index> + 1)
		repeat <array_Size>
	endif
endscript

script show_render_metrics_toggle 
	ToggleRenderMetrics
	if ScreenElementExists \{Id = render_metric_anchor}
		DestroyScreenElement \{Id = render_metric_anchor}
		DoScreenElementMorph \{Id = the_score_sprite
			Scale = 1}
		DoScreenElementMorph \{Id = the_score
			Scale = 1}
		show_compass_anchor
	else
		DoScreenElementMorph \{Id = the_score_sprite
			Scale = 0}
		DoScreenElementMorph \{Id = the_score
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
	MangleChecksums A = <anchor_id> B = VMenu
	<vmenu_id> = <mangled_ID>
	if NOT ScreenElementExists Id = <anchor_id>
		SetScreenElementLock \{Id = root_window
			OFF}
		CreateScreenElement {
			Type = ContainerElement
			PARENT = root_window
			Id = <anchor_id>
			Pos = <Pos>
			just = [LEFT Top]
			internal_just = [LEFT Center]
			Alpha = 0.55
			z_priority = 10001
			Scale = $globalscale
		}
		CreateScreenElement {
			Type = VMenu
			PARENT = <anchor_id>
			Id = <vmenu_id>
			just = [LEFT Top]
			internal_just = [LEFT Center]
			spacing_between = 0
			padding_scale = $globalscale_gap
		}
	endif
	ForEachIn <display_values> do = show_render_metrics_add_item pass_index Params = {vmenu_id = <vmenu_id>}
endscript

script show_render_metrics_add_item 
	if NOT ScreenElementExists Id = {<vmenu_id> child = <foreachin_index>}
		SetScreenElementLock Id = <vmenu_id> OFF
		CreateScreenElement {
			Type = TextElement
			PARENT = <vmenu_id>
			Text = ""
			font = text_A1
			just = [LEFT Top]
			Scale = $globalscale
		}
		SetScreenElementLock Id = <vmenu_id> ON
	endif
	FormatText TextName = Text "%n: %d" N = <Name> D = <Value>
	if CheckSumEquals A = <overbudget> B = TRUE
		<rgba> = [128 40 20 255]
	else
		<rgba> = [58 108 58 255]
	endif
	SetScreenElementProps {
		Id = {<vmenu_id> child = <foreachin_index>}
		Text = <Text>
		rgba = <rgba>
	}
endscript

script screen_outline \{rgba = [
			255
			255
			255
			100
		]}
	if ScreenElementExists \{Id = outline_anchor}
		DestroyScreenElement \{Id = outline_anchor}
	endif
	if GotParam \{DIE}
		return
	endif
	SetScreenElementLock \{Id = root_window
		OFF}
	CreateScreenElement \{Type = ContainerElement
		Id = outline_anchor
		PARENT = root_window
		tags = {
			hide_from_debugger
		}
		just = [
			LEFT
			Top
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
		<Text> = "HD TITLE SAFE"
		default
		<safe> = 0.9
		<thick> = 3
		<Text> = "HD ACTION SAFE"
	endswitch
	<width_title> = (<screenwidth> * <safe>)
	<height_title> = (<screenheight> * <safe>)
	<title_top> = {
		Pos = ((<screenwidth> * (0.5, 0.0)) + ((<screenheight> - <height_title>) * (0.0, 0.5)))
		Dims = ((<width_title> * (1.0, 0.0)) + (<thick> * (0.0, 1.0)))
	}
	<title_bottom> = {
		Pos = ((<screenwidth> * (0.5, 0.0)) + ((<screenheight> * (0.0, 1.0)) - (<screenheight> - <height_title>) * (0.0, 0.5)))
		Dims = ((<width_title> * (1.0, 0.0)) + (<thick> * (0.0, 1.0)))
	}
	<title_left> = {
		Pos = (((<screenwidth> - <width_title>) * (0.5, 0.0)) + (<screenheight> * (0.0, 0.5)))
		Dims = ((<height_title> * (0.0, 1.0)) + (<thick> * (1.0, 0.0)))
	}
	<title_right> = {
		Pos = (((<screenwidth> * (1.0, 0.0)) - (<screenwidth> - <width_title>) * (0.5, 0.0)) + (<screenheight> * (0.0, 0.5)))
		Dims = ((<height_title> * (0.0, 1.0)) + (<thick> * (1.0, 0.0)))
	}
	CreateScreenElement {
		Type = TextElement
		PARENT = outline_anchor
		tags = {hide_from_debugger}
		just = [Center Top]
		rgba = <rgba>
		Pos = ((<screenwidth> * (0.5, 0.0)) + ((<screenheight> - <height_title>) * (0.0, 0.5)))
		font = text_A1
		Scale = 0.5
		Text = <Text>
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = outline_anchor
		tags = {hide_from_debugger}
		just = [Center Top]
		rgba = <rgba>
		<title_top>
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = outline_anchor
		tags = {hide_from_debugger}
		just = [Center Bottom]
		rgba = <rgba>
		<title_bottom>
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = outline_anchor
		tags = {hide_from_debugger}
		just = [RIGHT Center]
		rgba = <rgba>
		<title_right>
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = outline_anchor
		tags = {hide_from_debugger}
		just = [LEFT Center]
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
		<Text> = "SD TITLE"
		<height_title> = (<screenheight> * 0.8)
		default
		<safe> = 0.675
		<thick> = 3
		<Text> = "SD ACTION"
		<height_title> = (<screenheight> * 0.9)
	endswitch
	<width_title> = (<screenwidth> * <safe>)
	<title_left_SD> = {
		Pos = (((<screenwidth> - <width_title>) * (0.5, 0.0)) + (<screenheight> * (0.0, 0.5)))
		Dims = ((<height_title> * (0.0, 1.0)) + (<thick> * (1.0, 0.0)))
	}
	<title_right_SD> = {
		Pos = (((<screenwidth> * (1.0, 0.0)) - (<screenwidth> - <width_title>) * (0.5, 0.0)) + (<screenheight> * (0.0, 0.5)))
		Dims = ((<height_title> * (0.0, 1.0)) + (<thick> * (1.0, 0.0)))
	}
	CreateScreenElement {
		Type = TextElement
		PARENT = outline_anchor
		tags = {hide_from_debugger}
		just = [Center Top]
		rgba = <rgba>
		Pos = ((<screenheight> * (0.0, 0.5)) + ((<screenwidth> - <width_title>) * (0.5, 0.0)))
		font = text_A1
		Scale = 0.5
		Rot_Angle = 90
		Text = <Text>
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = outline_anchor
		tags = {hide_from_debugger}
		just = [RIGHT Center]
		rgba = <rgba>
		<title_right_SD>
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = outline_anchor
		tags = {hide_from_debugger}
		just = [LEFT Center]
		rgba = <rgba>
		<title_left_SD>
	}
	<frames> = (<frames> - 1)
	repeat 2
	<center_vert> = {
		Pos = ((<screenwidth> * (0.5, 0.0)) + (<screenheight> * (0.0, 0.5)))
		Dims = ((<height_title> * (0.0, 0.1)) + (<thick> * (1.0, 0.0)))
	}
	<center_horz> = {
		Pos = ((<screenwidth> * (0.5, 0.0)) + (<screenheight> * (0.0, 0.5)))
		Dims = ((<width_title> * (0.1, 0.0)) + (<thick> * (0.0, 1.0)))
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = outline_anchor
		tags = {hide_from_debugger}
		just = [Center Center]
		rgba = <rgba>
		<center_vert>
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = outline_anchor
		tags = {hide_from_debugger}
		just = [Center Center]
		rgba = <rgba>
		<center_horz>
	}
endscript
