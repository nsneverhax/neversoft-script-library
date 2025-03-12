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
	tod_proxim_update_lightfx_viewport viewport = bg_viewport <...>
endscript

script toggle_default_sceenfx 
	tod_proxim_update_lightfx_viewport
endscript

script tod_proxim_update_lightfx_viewport \{fxparam = $default_tod_manager
		viewport = bg_viewport
		time = 1}
	screenfx_clearfxinstances viewport = <viewport>
	if structurecontains structure = <fxparam> screen_fx
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
endscript

script tod_proxim_reapply_lightfx 
	tod_proxim_update_lightfx \{fxparam = $currenttodsettings
		time = 0.0}
endscript

script tod_proxim_apply_default 
	tod_proxim_update_lightfx \{fxparam = $default_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_bw_01 
	tod_proxim_update_lightfx \{fxparam = $bw_01_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script applyvenuetonemap_default 
	if NOT screenfx_fxinstanceexists viewport = <viewport> name = tone_map
		screenfx_addfxinstance {
			viewport = <viewport>
			name = tone_map
			scefname = tone_map
			type = tonemap
			texture = 'tex\\LUTs\\lut_default_dnc.dds'
		}
	else
		screenfx_updatefxinstanceparams {
			viewport = <viewport>
			name = tone_map
			scefname = tone_map
			type = tonemap
			texture = 'tex\\LUTs\\lut_default_dnc.dds'
		}
	endif
endscript

script venue_screenfx \{viewport = bg_viewport}
	if existspakmanmap \{map = zones}
		getpakmancurrent \{map = zones}
		switch <pak>
			case z_barbarian
			if screenfx_fxinstanceexists \{viewport = bg_viewport
					name = godray}
				screenfx_updatefxinstanceparams \{viewport = bg_viewport
					name = barbariangodray
					scefname = godray
					type = godray
					on = 1
					colormodulate = [
						1.0
						0.96078396
						0.870588
						1.0
					]
					depthmodulate = 0.5
					steps = 100.0
					range = 0.18320002
					fadeout_begin = 90.0
					fadeout_end = 120.0
					skycolor = [
						0.45490202
						0.38431403
						0.27451003
						1.0
					]
					lightposition = [
						90.00001
						60.0
						10.0
						1.0
					]
					cliplightposition = 0
					lightsource = color}
			endif
			default
			applyvenuetonemap_default {
				viewport = <viewport>
			}
			if screenfx_fxinstanceexists \{viewport = bg_viewport
					name = godray}
				screenfx_updatefxinstanceparams \{viewport = bg_viewport
					name = godray
					scefname = godray
					type = godray
					on = 1
					colormodulate = [
						1.0
						0.96078396
						0.870588
						2.0
					]
					depthmodulate = 0.5
					steps = 60.0
					range = 0.125
					fadeout_begin = 90.0
					fadeout_end = 150.0
					skycolor = [
						0.078431
						0.062745
						0.05098
						1.0
					]
					lightposition = [
						0.0
						0.0
						-50.0
						1.0
					]
					cliplightposition = 0
					lightsource = object}
			endif
		endswitch
	endif
endscript
