
script UpdateDebuggerMousePosition 
	if NOT ScreenElementExists \{Id = mouse_cursor}
		SetScreenElementLock \{Id = root_window
			OFF}
		CreateScreenElement \{Type = SpriteElement
			PARENT = root_window
			Id = mouse_cursor
			texture = mouse_cursor
			rgba = [
				128
				128
				128
				85
			]
			just = [
				LEFT
				Top
			]
			z_priority = 3000003
			tags = {
				hide_from_debugger
			}}
	endif
	DoScreenElementMorph Id = mouse_cursor Pos = ((1.0, 0.0) * <X> + (0.0, 1.0) * <Y>)
endscript

script DestroyMouseCursor 
	if ScreenElementExists \{Id = mouse_cursor}
		DestroyScreenElement \{Id = mouse_cursor}
	endif
	DestroyMouseText
	KillSpriteHighlightEffect
endscript

script DestroyMouseText 
	if ScreenElementExists \{Id = mouse_text}
		DestroyScreenElement \{Id = mouse_text}
	endif
endscript

script SetMouseText 
	if NOT ScreenElementExists \{Id = mouse_text}
		SetScreenElementLock \{Id = root_window
			OFF}
		CreateScreenElement \{Id = mouse_text
			PARENT = root_window
			Type = TextElement
			just = [
				Center
				Top
			]
			Pos = (0.0, 0.0)
			font = text_A1
			Scale = 0.5
			Text = ""
			rgba = [
				80
				128
				128
				128
			]
			z_priority = 3000002
			tags = {
				hide_from_debugger
			}}
	endif
	SetScreenElementProps Id = mouse_text Text = <Text>
	DoScreenElementMorph Id = mouse_text Pos = ((1.0, 0.0) * <X> + (0.0, 1.0) * <Y> + (8.0, 16.0))
endscript

script MouseClickEffect 
	DoMorph \{Id = mouse_text
		Scale = 1.1
		Time = 0}
	Wait \{2
		GameFrames}
	DoMorph \{Id = mouse_text
		Scale = 1
		Time = 0}
endscript

script DoMouseClickEffect 
	if ScreenElementExists \{Id = mouse_text}
		RunScriptOnScreenElement \{Id = mouse_text
			MouseClickEffect}
	endif
endscript
