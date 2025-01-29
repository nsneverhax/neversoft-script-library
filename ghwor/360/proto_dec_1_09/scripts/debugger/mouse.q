
script UpdateDebuggerMousePosition 
	if NOT ScreenElementExists \{id = mouse_cursor}
		CreateScreenElement \{Type = SpriteElement
			parent = root_window
			id = mouse_cursor
			texture = white
			rgba = [
				255
				255
				255
				255
			]
			just = [
				left
				top
			]
			z_priority = 3000003
			dims = (24.0, 24.0)
			tags = {
				hide_from_debugger
			}}
	endif
	SetScreenElementProps id = mouse_cursor Pos = ((1.0, 0.0) * <X> + (0.0, 1.0) * <y>)
endscript

script DestroyMouseCursor 
	if ScreenElementExists \{id = mouse_cursor}
		DestroyScreenElement \{id = mouse_cursor}
	endif
	DestroyMouseText
endscript

script DestroyMouseText 
	if ScreenElementExists \{id = mouse_text}
		DestroyScreenElement \{id = mouse_text}
	endif
endscript

script SetMouseText 
	if NOT ScreenElementExists \{id = mouse_text}
		getdebugfont
		CreateScreenElement {
			id = mouse_text
			parent = root_window
			Type = TextElement
			just = [center top]
			Pos = (0.0, 0.0)
			font = <debug_font>
			Scale = 0.5
			text = qs(0x03ac90f0)
			rgba = [80 128 128 128]
			z_priority = 3000002
			tags = {hide_from_debugger}
		}
	endif
	SetScreenElementProps id = mouse_text text = <text>
	SetScreenElementProps id = mouse_text Pos = ((1.0, 0.0) * <X> + (0.0, 1.0) * <y> + (8.0, 16.0))
endscript

script MouseClickEffect 
	se_setprops \{Scale = 1.1
		time = 0}
	Wait \{2
		gameframes}
	se_setprops \{Scale = 1
		time = 0}
endscript

script DoMouseClickEffect 
	if ScreenElementExists \{id = mouse_text}
		RunScriptOnScreenElement \{id = mouse_text
			MouseClickEffect}
	endif
endscript
