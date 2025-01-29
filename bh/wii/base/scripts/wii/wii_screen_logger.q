wii_screen_logger_max_lines = 5
wii_screen_logger_first_line_pos = (100.0, 10.0)
wii_screen_logger_line_spacing = 5
wii_screen_logger_count = 0

script wii_screen_logger_print 
	if ($enable_debug = 0)
		return
	endif
	RequireParams \{[
			text
		]
		all}
	if NOT ScreenElementExists \{id = wii_screen_logger_root}
		CreateScreenElement \{Type = ContainerElement
			id = wii_screen_logger_root
			parent = root_window
			Pos = (0.0, 0.0)
			dims = (1280.0, 720.0)
			just = [
				left
				top
			]
			internal_just = [
				left
				top
			]
			z_priority = 50000}
	endif
	if ($wii_screen_logger_count >= $wii_screen_logger_max_lines)
		wii_screen_logger_remove \{index = 0}
	endif
	formatText TextName = loc_string qs(0x0bc409e2) a = <text>
	CreateScreenElement {
		Type = TextBlockElement
		parent = wii_screen_logger_root
		text = <loc_string>
		just = [left top]
		internal_just = [left top]
		Pos = $wii_screen_logger_first_line_pos
		font = fontgrid_title_gh3
		rgba = [255 0 0 255]
		Shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (3.0, 3.0)
		fit_width = wrap
		fit_height = `expand	dims`
		scale_mode = proportional
		text_case = Original
		dims = (1180.0, 20.0)
		internal_scale = 0.5
	}
	Change wii_screen_logger_count = ($wii_screen_logger_count + 1)
	wii_screen_logger_reposition
endscript

script wii_screen_logger_clear 
	if ScreenElementExists \{id = wii_screen_logger_root}
		DestroyScreenElement \{id = wii_screen_logger_root}
	endif
	Change \{wii_screen_logger_count = 0}
endscript

script wii_screen_logger_remove 
	RequireParams \{[
			index
		]
		all}
	DestroyScreenElement id = {wii_screen_logger_root child = <index>}
	Change wii_screen_logger_count = ($wii_screen_logger_count - 1)
endscript

script wii_screen_logger_reposition 
	i = 0
	current_pos = ($wii_screen_logger_first_line_pos)
	begin
	SetScreenElementProps id = {wii_screen_logger_root child = <i>} Pos = <current_pos>
	GetScreenElementProps id = {wii_screen_logger_root child = <i>}
	delta_y = (<dims> [1] + $wii_screen_logger_line_spacing)
	setpaircomponents current_pos y = (<current_pos> [1] + <delta_y>)
	<i> = (<i> + 1)
	repeat $wii_screen_logger_count
endscript
