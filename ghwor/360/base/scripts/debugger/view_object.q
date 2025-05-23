mousezoomfactor = 0.2
mouseyoffsetupdownfactor = 0.02
mouserotationupdownfactor = -0.013332999
mouserotationleftrightfactor = 0.01
hi_def_object_viewer_globalscale = 0.6
low_def_object_viewer_globalscale = 0.7
object_viewer_yoffset = 34
object_viewer_globalscale = 1.2
object_viewer_num_lines = 12
default_viewer_modules = [
	defaultviewer
	objectviewer
	dynamicadviewer
]

script enablenewobjviewer 
	if ($highdefviewer = 1)
		Change \{object_viewer_globalscale = $hi_def_object_viewer_globalscale}
	endif
	if ($highdefviewer = 0)
		Change \{object_viewer_globalscale = $low_def_object_viewer_globalscale}
	endif
	if NOT ScreenElementExists \{id = view_dot}
		SetScreenElementLock \{id = root_window
			OFF}
		CreateScreenElement \{id = view_dot
			Type = SpriteElement
			texture = white
			rgba = [
				255
				0
				0
				128
			]
			Scale = 1.0
			Pos = (640.0, 360.0)
			parent = root_window}
	endif
	if ScreenElementExists \{id = obj_viewer_anchor}
		DestroyScreenElement \{id = obj_viewer_anchor}
	endif
	SetScreenElementLock \{id = root_window
		OFF}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = obj_viewer_anchor
		Pos = (100.0, 360.0)
		just = [
			center
			center
		]
		internal_just = [
			left
			center
		]}
	Scale = ($object_viewer_yoffset * $object_viewer_globalscale)
	posoffset = ((0.0, 1.0) * <Scale>)
	pos0 = ((0.0, 200.0) - (<posoffset> * ($object_viewer_num_lines + 1)))
	CreateScreenElement \{Type = TextBlockElement
		parent = obj_viewer_anchor
		id = viewer_text_display_block
		Pos = (120.0, -300.0)
		dims = (700.0, 700.0)
		text = qs(0x03ac90f0)
		font = debug
		line_spacing = 1
		rgba = [
			58
			108
			58
			255
		]
		just = [
			left
			left
		]
		Scale = $object_viewer_globalscale}
endscript

script enableobjviewer 
	if ($highdefviewer = 1)
		Change \{object_viewer_globalscale = $hi_def_object_viewer_globalscale}
	endif
	if ($highdefviewer = 0)
		Change \{object_viewer_globalscale = $low_def_object_viewer_globalscale}
	endif
	if NOT ScreenElementExists \{id = view_dot}
		SetScreenElementLock \{id = root_window
			OFF}
		CreateScreenElement \{id = view_dot
			Type = SpriteElement
			texture = white
			rgba = [
				255
				0
				0
				128
			]
			Scale = 1.0
			Pos = (640.0, 360.0)
			parent = root_window}
	endif
	if ScreenElementExists \{id = obj_viewer_anchor}
		DestroyScreenElement \{id = obj_viewer_anchor}
	endif
	SetScreenElementLock \{id = root_window
		OFF}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = obj_viewer_anchor
		Pos = (100.0, 360.0)
		just = [
			center
			center
		]
		internal_just = [
			left
			center
		]}
	Scale = ($object_viewer_yoffset * $object_viewer_globalscale)
	posoffset = ((0.0, 1.0) * <Scale>)
	pos0 = ((0.0, 200.0) - (<posoffset> * ($object_viewer_num_lines + 1)))
	CreateScreenElement {
		Type = TextElement
		parent = obj_viewer_anchor
		id = view_obj_text1
		Pos = <pos0>
		text = qs(0x3f1bbbb1)
		font = debug
		rgba = [60 60 100 255]
		just = [left center]
		Scale = $object_viewer_globalscale
	}
	pos0 = (<pos0> + <posoffset>)
	CreateScreenElement {
		Type = TextElement
		parent = obj_viewer_anchor
		id = view_obj_text2
		Pos = <pos0>
		text = qs(0x3f1bbbb1)
		font = debug
		rgba = [58 108 58 255]
		just = [left center]
		Scale = $object_viewer_globalscale
	}
	pos0 = (<pos0> + <posoffset>)
	CreateScreenElement {
		Type = TextElement
		parent = obj_viewer_anchor
		id = view_obj_text11
		Pos = <pos0>
		text = qs(0x3f1bbbb1)
		font = debug
		rgba = [58 108 58 255]
		just = [left center]
		Scale = $object_viewer_globalscale
	}
	pos0 = (<pos0> + <posoffset>)
	CreateScreenElement {
		Type = TextElement
		parent = obj_viewer_anchor
		id = view_obj_text12
		Pos = <pos0>
		text = qs(0x3f1bbbb1)
		font = debug
		rgba = [58 108 58 255]
		just = [left center]
		Scale = $object_viewer_globalscale
	}
	pos0 = (<pos0> + <posoffset>)
	CreateScreenElement {
		Type = TextElement
		parent = obj_viewer_anchor
		id = view_obj_text3
		Pos = <pos0>
		text = qs(0x3f1bbbb1)
		font = debug
		rgba = [58 108 58 255]
		just = [left center]
		Scale = $object_viewer_globalscale
	}
	pos0 = (<pos0> + <posoffset>)
	CreateScreenElement {
		Type = TextElement
		parent = obj_viewer_anchor
		id = view_obj_text4
		Pos = <pos0>
		text = qs(0x3f1bbbb1)
		font = debug
		rgba = [58 108 58 255]
		just = [left center]
		Scale = $object_viewer_globalscale
	}
	pos0 = (<pos0> + <posoffset>)
	CreateScreenElement {
		Type = TextElement
		parent = obj_viewer_anchor
		id = view_obj_text5
		Pos = <pos0>
		text = qs(0x3f1bbbb1)
		font = debug
		rgba = [58 108 58 255]
		just = [left center]
		Scale = $object_viewer_globalscale
	}
	pos0 = (<pos0> + <posoffset>)
	CreateScreenElement {
		Type = TextElement
		parent = obj_viewer_anchor
		id = view_obj_text6
		Pos = <pos0>
		text = qs(0x3f1bbbb1)
		font = debug
		rgba = [58 108 58 255]
		just = [left center]
		Scale = $object_viewer_globalscale
	}
	pos0 = (<pos0> + <posoffset>)
	CreateScreenElement {
		Type = TextElement
		parent = obj_viewer_anchor
		id = view_obj_text7
		Pos = <pos0>
		text = qs(0x3f1bbbb1)
		font = debug
		rgba = [58 108 58 255]
		just = [left center]
		Scale = $object_viewer_globalscale
	}
	pos0 = (<pos0> + <posoffset>)
	CreateScreenElement {
		Type = TextElement
		parent = obj_viewer_anchor
		id = view_obj_text8
		Pos = <pos0>
		text = qs(0x3f1bbbb1)
		font = debug
		rgba = [58 108 58 255]
		just = [left center]
		Scale = $object_viewer_globalscale
	}
	pos0 = (<pos0> + <posoffset>)
	CreateScreenElement {
		Type = TextElement
		parent = obj_viewer_anchor
		id = view_obj_text9
		Pos = <pos0>
		text = qs(0x3f1bbbb1)
		font = debug
		rgba = [58 108 58 255]
		just = [left center]
		Scale = $object_viewer_globalscale
	}
	pos0 = (<pos0> + <posoffset>)
	CreateScreenElement {
		Type = TextElement
		parent = obj_viewer_anchor
		id = view_obj_text10
		Pos = <pos0>
		text = qs(0x3f1bbbb1)
		font = debug
		rgba = [58 108 58 255]
		just = [left center]
		Scale = $object_viewer_globalscale
	}
endscript
default_obj_viewer_display = 1

script updateobjviewer 
	if ($default_obj_viewer_display = 1)
		SetScreenElementProps id = view_obj_text2 text = <objname>
		SetScreenElementProps id = view_obj_text1 text = <objtype>
		SetScreenElementProps id = view_obj_text11 text = <polystat8>
		SetScreenElementProps id = view_obj_text12 text = <polystat9>
		SetScreenElementProps id = view_obj_text3 text = <polystat0>
		SetScreenElementProps id = view_obj_text4 text = <polystat1>
		SetScreenElementProps id = view_obj_text5 text = <polystat2>
		SetScreenElementProps id = view_obj_text6 text = <polystat3>
		SetScreenElementProps id = view_obj_text7 text = <polystat4>
		SetScreenElementProps id = view_obj_text8 text = <polystat5>
		SetScreenElementProps id = view_obj_text9 text = <polystat6>
		SetScreenElementProps id = view_obj_text10 text = <polystat7>
		hide_ai_debug
	else
		SetScreenElementProps \{id = view_obj_text2
			text = qs(0x03ac90f0)}
		SetScreenElementProps \{id = view_obj_text1
			text = qs(0x03ac90f0)}
		SetScreenElementProps \{id = view_obj_text11
			text = qs(0x03ac90f0)}
		SetScreenElementProps \{id = view_obj_text12
			text = qs(0x03ac90f0)}
		SetScreenElementProps \{id = view_obj_text3
			text = qs(0x03ac90f0)}
		SetScreenElementProps \{id = view_obj_text4
			text = qs(0x03ac90f0)}
		SetScreenElementProps \{id = view_obj_text5
			text = qs(0x03ac90f0)}
		SetScreenElementProps \{id = view_obj_text6
			text = qs(0x03ac90f0)}
		SetScreenElementProps \{id = view_obj_text7
			text = qs(0x03ac90f0)}
		SetScreenElementProps \{id = view_obj_text8
			text = qs(0x03ac90f0)}
		SetScreenElementProps \{id = view_obj_text9
			text = qs(0x03ac90f0)}
		SetScreenElementProps \{id = view_obj_text10
			text = qs(0x03ac90f0)}
	endif
	if GotParam \{objID}
		if CompositeObjectExists Name = <objID>
			if <objID> :ContainsComponent Name = Agent
				<objID> :Agent_UpdateViewed
			endif
		endif
	endif
endscript

script disablenewobjviewer 
	if ScreenElementExists \{id = view_dot}
		DestroyScreenElement \{id = view_dot}
	endif
	if ScreenElementExists \{id = viewer_text_display_block}
		DestroyScreenElement \{id = viewer_text_display_block}
	endif
endscript

script disableobjviewer 
	if ScreenElementExists \{id = view_dot}
		DestroyScreenElement \{id = view_dot}
	endif
	if ScreenElementExists \{id = view_obj_text1}
		DestroyScreenElement \{id = view_obj_text1}
	endif
	if ScreenElementExists \{id = view_obj_text2}
		DestroyScreenElement \{id = view_obj_text2}
	endif
	if ScreenElementExists \{id = view_obj_text3}
		DestroyScreenElement \{id = view_obj_text3}
	endif
	if ScreenElementExists \{id = view_obj_text4}
		DestroyScreenElement \{id = view_obj_text4}
	endif
	if ScreenElementExists \{id = view_obj_text5}
		DestroyScreenElement \{id = view_obj_text5}
	endif
	if ScreenElementExists \{id = view_obj_text6}
		DestroyScreenElement \{id = view_obj_text6}
	endif
	if ScreenElementExists \{id = view_obj_text7}
		DestroyScreenElement \{id = view_obj_text7}
	endif
	if ScreenElementExists \{id = view_obj_text8}
		DestroyScreenElement \{id = view_obj_text8}
	endif
	if ScreenElementExists \{id = view_obj_text9}
		DestroyScreenElement \{id = view_obj_text9}
	endif
	if ScreenElementExists \{id = view_obj_text10}
		DestroyScreenElement \{id = view_obj_text10}
	endif
	if ScreenElementExists \{id = view_obj_text11}
		DestroyScreenElement \{id = view_obj_text11}
	endif
	if ScreenElementExists \{id = view_obj_text12}
		DestroyScreenElement \{id = view_obj_text12}
	endif
	if ScreenElementExists \{id = view_obj_ai}
		DestroyScreenElement \{id = view_obj_ai}
	endif
endscript
