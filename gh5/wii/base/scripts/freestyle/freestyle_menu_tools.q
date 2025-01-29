freestyle_unfocus_scale = (0.7, 0.7)
freestyle_focus_scale = (1.0, 1.0)
freestyle_unfocus_rgba = [
	170
	170
	170
	255
]
freestyle_focus_rgba = [
	255
	255
	255
	255
]
freestyle_focus_rgba_disabled = [
	100
	100
	100
	255
]

script freestyle_menu_option_focus 
	Obj_GetID
	<objID> :se_setprops {
		rgba = ($freestyle_focus_rgba)
		Scale = ($freestyle_focus_scale)
	}
	printf \{qs(0x5c5f1852)}
endscript

script freestyle_menu_option_focus_disabled 
	Obj_GetID
	<objID> :se_setprops {
		rgba = ($freestyle_focus_rgba_disabled)
		Scale = ($freestyle_focus_scale)
	}
	printf \{qs(0x5c5f1852)}
endscript

script freestyle_menu_option_unfocus 
	Obj_GetID
	<objID> :se_setprops {
		rgba = ($freestyle_unfocus_rgba)
		Scale = ($freestyle_unfocus_scale)
	}
	printf \{qs(0xc8782946)}
endscript

script freestyle_option_focus_highlight_bar 
	RequireParams \{[
			desc_id
		]
		all}
	if GotParam \{Pos}
		if GotParam \{Scale}
			Obj_GetID
			<desc_id> :desc_resolvealias Name = highlight_bar
			<resolved_id> :se_setprops {
				Pos = <Pos>
				parent = <objID>
				Scale = <Scale>
			}
		else
			Obj_GetID
			<desc_id> :desc_resolvealias Name = highlight_bar
			<resolved_id> :se_setprops {
				Pos = <Pos>
				parent = <objID>
			}
		endif
	else
		Obj_GetID
		<desc_id> :desc_resolvealias Name = highlight_bar
		<resolved_id> :se_setprops {
			parent = <objID>
		}
	endif
endscript
