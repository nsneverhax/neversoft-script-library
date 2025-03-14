DrumPartialNumber = 1

script set_skater_anim_handlers 
	reseteventhandlersfromtable \{ActualSkaterAnimHandlerExceptionTable
		group = anim}
endscript

script set_ped_anim_handlers 
	reseteventhandlersfromtable \{ActualPedAnimHandlerExceptionTable
		group = anim}
endscript

script set_viewerobj_anim_handlers 
	set_skater_anim_handlers
	set_ped_anim_handlers
endscript

script HandleAnimSoundEvent 
	if NOT gotparam \{object}
		obj_getid
		object = <objid>
	endif
	soundevent event = <event> <...>
endscript

script HandlePrintEvent 
endscript

script HandleSkaterSprayPaint 
	if gotparam \{on}
		if flipped
			SprayPaintOn \{bone = bone_palm_l}
		else
			SprayPaintOn \{bone = bone_palm_r}
		endif
	endif
	if gotparam \{off}
		SprayPaintOff
	endif
	if gotparam \{splat}
		TagNow
	endif
endscript

script HandlePedSprayPaint 
	if gotparam \{on}
		SprayPaintOn \{bone = bone_palm_r}
	endif
	if gotparam \{off}
		SprayPaintOff
	endif
endscript
