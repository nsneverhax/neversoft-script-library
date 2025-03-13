se_brightness = 5
currenttodsettings = default_tod_manager

script tod_proxim_create_lightfx 
	screenfx_clearfxinstances \{viewport = 0}
	if insplitscreengame
		screenfx_clearfxinstances \{viewport = 0}
	endif
	tod_proxim_update_lightfx \{viewport = bg_viewport
		time = 0}
endscript

script tod_proxim_update_lightfx 
	tod_proxim_update_lightfx_viewport viewport = 0 <...>
	if insplitscreengame
		tod_proxim_update_lightfx_viewport viewport = 0 <...>
	endif
endscript

script toggle_default_sceenfx 
	tod_proxim_update_lightfx_viewport
	toggle_screenfx_instances
endscript

script tod_proxim_update_lightfx_viewport \{fxparam = $default_tod_manager
		viewport = 0
		time = 1}
	printf \{qs(0x449d27d9)}
	screenfx_clearfxinstances viewport = <viewport>
	if structurecontains \{structure = fxparam
			screen_fx}
		begin
		if getnextarrayelement (<fxparam>.screen_fx)
			screenfx_addfxinstance {
				viewport = <viewport>
				<element>
			}
		else
			break
		endif
		repeat
	endif
	getpakmancurrentname \{map = zones}
	if gotparam \{pakname}
		formattext checksumname = zone_screenfx '%s_SetupScreenFX' s = <pakname>
		if scriptexists <zone_screenfx>
			printf \{qs(0x81f59b33)}
			spawnscriptnow <zone_screenfx>
		endif
	endif
endscript

script tod_proxim_reapply_lightfx 
	tod_proxim_update_lightfx \{fxparam = $currenttodsettings
		time = 0.0}
endscript
