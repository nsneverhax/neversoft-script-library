profiler_vblanks = -1
poly_count_on = 0
hi_def_globalscale = 0.6
hi_def_globalscale_gap = 0.4
low_def_globalscale = 0.8
low_def_globalscale_gap = 0.7
globalscale = 0.8
globalscale_gap = 0.7

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
		<text> = qs(0x0baa46ef)
		default
		<safe> = 0.9
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
