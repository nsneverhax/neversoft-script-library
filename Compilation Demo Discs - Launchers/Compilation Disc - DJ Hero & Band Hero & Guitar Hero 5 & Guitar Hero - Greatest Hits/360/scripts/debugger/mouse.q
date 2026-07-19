
script updatedebuggermouseposition 
	if NOT ScreenElementExists \{id = mouse_cursor}
		SetScreenElementLock \{id = root_window
			off}
		CreateScreenElement \{type = SpriteElement
			parent = root_window
			id = mouse_cursor
			texture = mouse_cursor
			rgba = [
				128
				128
				128
				160
			]
			just = [
				left
				top
			]
			z_priority = 3000003
			tags = {
				hide_from_debugger
			}}
	endif
	LegacyDoScreenElementMorph id = mouse_cursor pos = ((1.0, 0.0) * <x> + (0.0, 1.0) * <y>)
endscript

script destroymousecursor 
	if ScreenElementExists \{id = mouse_cursor}
		DestroyScreenElement \{id = mouse_cursor}
	endif
	destroymousetext
endscript

script destroymousetext 
	if ScreenElementExists \{id = mouse_text}
		DestroyScreenElement \{id = mouse_text}
	endif
endscript

script setmousetext 
	if NOT ScreenElementExists \{id = mouse_text}
		GetDebugFont
		SetScreenElementLock \{id = root_window
			off}
		CreateScreenElement {
			id = mouse_text
			parent = root_window
			type = TextElement
			just = [center top]
			pos = (0.0, 0.0)
			font = <debug_font>
			scale = 0.5
			text = qs("\L")
			rgba = [80 128 128 128]
			z_priority = 3000002
			tags = {hide_from_debugger}
		}
	endif
	SetScreenElementProps id = mouse_text text = <text>
	LegacyDoScreenElementMorph id = mouse_text pos = ((1.0, 0.0) * <x> + (0.0, 1.0) * <y> + (8.0, 16.0))
endscript

script MouseClickEffect 
	LegacyDoMorph \{id = mouse_text
		scale = 1.1
		time = 0}
	Wait \{2
		gameframes}
	LegacyDoMorph \{id = mouse_text
		scale = 1
		time = 0}
endscript

script domouseclickeffect 
	if ScreenElementExists \{id = mouse_text}
		RunScriptOnScreenElement \{id = mouse_text
			MouseClickEffect}
	endif
endscript
