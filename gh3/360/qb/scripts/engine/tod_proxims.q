se_brightness = 5
currenttodsettings = default_tod_manager

script tod_proxim_create_lightfx 
	screenfx_clearfxinstances \{viewport = 0}
	if insplitscreengame
		screenfx_clearfxinstances \{viewport = 0}
	endif
	tod_proxim_update_global_brightness \{viewport = 0}
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
	printf \{"--- toggle_default_screenfx"}
	tod_proxim_update_lightfx_viewport
	toggle_screenfx_instances
endscript

script tod_proxim_update_lightfx_viewport \{fxparam = $default_tod_manager
		viewport = 0
		time = 1}
	screenfx_clearfxinstances viewport = <viewport>
	if (<viewport> = 0)
		tod_proxim_update_global_brightness <...>
	elseif (<viewport> = bg_viewport)
		if NOT screenfx_fxinstanceexists viewport = <viewport> name = venue_dof
			screenfx_addfxinstance {
				viewport = <viewport>
				name = venue_dof
				($dof_off_tod_manager.screen_fx [0])
			}
		else
			screenfx_updatefxinstanceparams {
				viewport = <viewport>
				name = venue_dof
				($dof_off_tod_manager.screen_fx [0])
			}
		endif
	endif
	if structurecontains \{structure = fxparam
			screen_fx}
		begin
		if getnextarrayelement (<fxparam>.screen_fx)
			getuniquecompositeobjectid \{preferredid = screenfxid}
			screenfx_addfxinstance {
				viewport = <viewport>
				name = <uniqueid>
				<element>
			}
		else
			break
		endif
		repeat
	endif
	if structurecontains \{structure = fxparam
			atmosphere}
		updateatmosphere (<fxparam>.atmosphere)
	endif
endscript

script tod_proxim_reapply_lightfx 
	tod_proxim_update_lightfx \{fxparam = $currenttodsettings
		time = 0.0}
endscript

script tod_proxim_update_global_brightness \{viewport = 0}
	if NOT screenfx_fxinstanceexists viewport = <viewport> name = global_brightness
		screenfx_addfxinstance {
			viewport = <viewport>
			name = global_brightness
			on = 1
			brightness = (0.5 + ($se_brightness) * 0.1)
			type = bright_sat
		}
	else
		screenfx_updatefxinstanceparams {
			viewport = <viewport>
			name = global_brightness
			on = 1
			brightness = (0.5 + ($se_brightness) * 0.1)
			time = 0
		}
	endif
endscript
