
script freestyle_hud_pop_graphic_in \{Scale = 1}
	Obj_GetID
	new_scale = ((1.0, 0.0) * (0.1 * <Scale>) + (0.0, 1.0) * (0.1 * <Scale>))
	if ScreenElementExists id = <objID>
		<objID> :se_setprops {
			Scale = <new_scale>
		}
	endif
	new_scale = ((1.0, 0.0) * (1.5 * <Scale>) + (0.0, 1.0) * (0.1 * <Scale>))
	if ScreenElementExists id = <objID>
		<objID> :se_setprops {
			Scale = <new_scale>
			time = 0.08
		}
		Wait \{0.08
			Seconds}
	endif
	new_scale = ((1.0, 0.0) * (0.1 * <Scale>) + (0.0, 1.0) * (1.5 * <Scale>))
	if ScreenElementExists id = <objID>
		<objID> :se_setprops {
			Scale = <new_scale>
			time = 0.07
		}
		Wait \{0.07
			Seconds}
	endif
	new_scale = ((1.0, 0.0) * (1 * <Scale>) + (0.0, 1.0) * (1 * <Scale>))
	if ScreenElementExists id = <objID>
		<objID> :se_setprops {
			Scale = <new_scale>
			time = 0.07
		}
		Wait \{0.07
			Seconds}
	endif
	new_scale = ((1.0, 0.0) * (0.9 * <Scale>) + (0.0, 1.0) * (1 * <Scale>))
	if ScreenElementExists id = <objID>
		<objID> :se_setprops {
			Scale = <new_scale>
			time = 0.06
		}
		Wait \{0.06
			Seconds}
	endif
	new_scale = ((1.0, 0.0) * (1 * <Scale>) + (0.0, 1.0) * (1 * <Scale>))
	if ScreenElementExists id = <objID>
		<objID> :se_setprops {
			Scale = <new_scale>
			time = 0.06
		}
		Wait \{0.06
			Seconds}
	endif
	new_scale = ((1.0, 0.0) * (0.92999995 * <Scale>) + (0.0, 1.0) * (1 * <Scale>))
	if ScreenElementExists id = <objID>
		<objID> :se_setprops {
			Scale = <new_scale>
			time = 0.05
		}
		Wait \{0.05
			Seconds}
	endif
	new_scale = ((1.0, 0.0) * (1 * <Scale>) + (0.0, 1.0) * (1 * <Scale>))
	if ScreenElementExists id = <objID>
		<objID> :se_setprops {
			Scale = <new_scale>
			time = 0.05
		}
		Wait \{0.05
			Seconds}
	endif
	new_scale = ((1.0, 0.0) * (0.96 * <Scale>) + (0.0, 1.0) * (1 * <Scale>))
	if ScreenElementExists id = <objID>
		<objID> :se_setprops {
			Scale = <new_scale>
			time = 0.04
		}
		Wait \{0.04
			Seconds}
	endif
	new_scale = ((1.0, 0.0) * (1 * <Scale>) + (0.0, 1.0) * (1 * <Scale>))
	if ScreenElementExists id = <objID>
		<objID> :se_setprops {
			Scale = <new_scale>
			time = 0.04
		}
		Wait \{0.04
			Seconds}
	endif
endscript

script freestyle_hud_fall_graphic_in \{rgba = [
			64
			64
			255
			255
		]
		Scale = 3
		time = 0.5}
	Obj_GetID
	<objID> :se_setprops {
		Scale = <Scale>
		alpha = 0
	}
	<objID> :se_setprops {
		Scale = 1
		alpha = 1
		time = <time>
	}
endscript

script freestyle_hud_fall_graphic_out \{rgba = [
			64
			64
			255
			255
		]
		Scale = 3
		time = 0.5}
	Obj_GetID
	<objID> :se_setprops {
		Scale = <Scale>
		alpha = 0
		time = <time>
	}
	if GotParam \{Destroy}
		Wait <time> Seconds
		DestroyScreenElement id = <objID>
	endif
endscript

script factorial 
	RequireParams \{[
			number
		]
		all}
	if (<number> > 1)
		factorial number = (<number> - 1)
	else
		Result = 1
	endif
	printf 'Result: %d' d = (<number> * <Result>)
	return Result = (<number> * <Result>)
endscript
