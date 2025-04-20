currenttodsettings = {
	tod = none
}

script tod_proxim_create_lightfx 
	screenfx_clearfxinstances \{viewport = 0}
	if insplitscreengame
		screenfx_clearfxinstances \{viewport = 1}
	endif
	tod_proxim_update_lightfx \{time = 0}
endscript

script tod_proxim_update_lightfx 
	tod_proxim_update_lightfx_viewport viewport = 0 <...>
	if insplitscreengame
		tod_proxim_update_lightfx_viewport viewport = 1 <...>
	endif
endscript

script toggle_default_sceenfx 
	printf \{"--- toggle_default_screenfx"}
	tod_proxim_update_lightfx_viewport
	toggle_screenfx_instances
endscript

script tod_proxim_update_lightfx_viewport fxparam = default_tod_manager viewport = 0 time = 1
	if structurecontains structure = $<fxparam> screen_fx
		getarraysize (<fxparam>.screen_fx)
		if NOT (<array_size> = 5)
			printf 'TOD_Proxim_Update_LightFX_Viewport: fxParam has incorrect number of fx'
			return
		endif
	else
		printf 'TOD_Proxim_Update_LightFX_Viewport: fxParam is incorrect'
		return
	endif
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
	if structurecontains structure = $<fxparam> screen_fx
		if NOT screenfx_fxinstanceexists viewport = <viewport> name = todFogFX
			screenfx_addfxinstance {
				viewport = <viewport>
				name = todFogFX
				(<fxparam>.screen_fx [0])
			}
		else
			screenfx_updatefxinstanceparams {
				viewport = <viewport>
				name = todFogFX
				time = <time>
				(<fxparam>.screen_fx [0])
			}
		endif
		if NOT screenfx_fxinstanceexists viewport = <viewport> name = todPMBloomFX
			screenfx_addfxinstance {
				viewport = <viewport>
				name = todPMBloomFX
				(<fxparam>.screen_fx [1])
			}
		else
			screenfx_updatefxinstanceparams {
				viewport = <viewport>
				name = todPMBloomFX
				time = <time>
				(<fxparam>.screen_fx [1])
			}
		endif
		if NOT screenfx_fxinstanceexists viewport = <viewport> name = todIntBloomFX
			screenfx_addfxinstance {
				viewport = <viewport>
				name = todIntBloomFX
				(<fxparam>.screen_fx [2])
			}
		else
			screenfx_updatefxinstanceparams {
				viewport = <viewport>
				name = todIntBloomFX
				time = <time>
				(<fxparam>.screen_fx [2])
			}
		endif
		if NOT screenfx_fxinstanceexists viewport = <viewport> name = todBS1FX
			screenfx_addfxinstance {
				viewport = <viewport>
				name = todBS1FX
				(<fxparam>.screen_fx [3])
			}
		else
			screenfx_updatefxinstanceparams {
				viewport = <viewport>
				name = todBS1FX
				time = <time>
				(<fxparam>.screen_fx [3])
			}
		endif
		if NOT insplitscreengame
			if NOT screenfx_fxinstanceexists viewport = <viewport> name = todVignetteFX
				screenfx_addfxinstance {
					viewport = <viewport>
					name = todVignetteFX
					(<fxparam>.screen_fx [4])
				}
			else
				screenfx_updatefxinstanceparams {
					viewport = <viewport>
					name = todVignetteFX
					time = <time>
					(<fxparam>.screen_fx [4])
				}
			endif
		endif
	endif
	if structurecontains structure = $<fxparam> atmosphere
		updateatmosphere (<fxparam>.atmosphere)
	endif
	if NOT gotparam pause_menu
		if NOT gotparam exit_pause_menu
			manglechecksums a = <fxparam> b = 0
			change currenttodsettings = {tod = <mangled_id>}
		endif
	endif
endscript

script tod_proxim_reapply_lightfx 
	tod_proxim_update_lightfx fxparam = (($currenttodsettings).tod) time = 0.0 <...>
endscript

script Z_WP_Bridge_LFX_TOD_Proxim01 
	if gotparam inside
		switch <triggerid>
			case object
			case ped
			case skateboard
			applylightgroup id = <proximtriggerid> lightgroup = group1
		endswitch
		<proximtriggerid> :settags WAS_INSIDE_Z_WP_Bridge_LFX_TOD_Proxim01
	else
		<proximtriggerid> :gettags
		if gotparam WAS_INSIDE_Z_WP_Bridge_LFX_TOD_Proxim01
			switch <triggerid>
				case object
				case ped
				case skateboard
				RemoveCurLightGroup id = <proximtriggerid>
			endswitch
			<proximtriggerid> :removetags [WAS_INSIDE_Z_WP_Bridge_LFX_TOD_Proxim01]
		endif
	endif
endscript

script Shadow_Proxim01 
	if gotparam inside
		switch <triggerid>
			case camera
			tod_proxim_update_lightfx fxparam = Default_Shadow_tod_manager
			case object
			case ped
			case skateboard
			applylightgroup id = <proximtriggerid> lightgroup = group3
		endswitch
		<proximtriggerid> :settags WAS_INSIDE_Shadow_Proxim01
	else
		<proximtriggerid> :gettags
		if gotparam WAS_INSIDE_Shadow_Proxim01
			switch <triggerid>
				case camera
				tod_proxim_update_lightfx fxparam = default_tod_manager
				case object
				case ped
				case skateboard
				RemoveCurLightGroup id = <proximtriggerid>
			endswitch
			<proximtriggerid> :removetags [WAS_INSIDE_Shadow_Proxim01]
		endif
	endif
endscript

script Indoor_Proxim01 
	if inside
		switch <triggerid>
			case camera
			tod_proxim_update_lightfx fxparam = Default_Shadow_tod_manager
			case object
			case ped
			case skateboard
			applylightgroup id = <proximtriggerid> lightgroup = group1
		endswitch
		<proximtriggerid> :settags WAS_INSIDE_Indoor_Proxim01
	elseif NOT gotparam created
		<proximtriggerid> :gettags
		if gotparam WAS_INSIDE_Indoor_Proxim01
			switch <triggerid>
				case camera
				tod_proxim_update_lightfx fxparam = default_tod_manager
				case object
				case ped
				case skateboard
				RemoveCurLightGroup id = <proximtriggerid>
			endswitch
			<proximtriggerid> :removetags [WAS_INSIDE_Indoor_Proxim01]
		endif
	endif
endscript
ProximProfile_Z_WP_Bridge_LFX_TOD = {
	object = {
		action = applylightgroup
		params = {
			lightgroup = group1
		}
	}
	ped = {
		action = applylightgroup
		params = {
			lightgroup = group1
		}
	}
	skateboard = {
		action = applylightgroup
		params = {
			lightgroup = group1
		}
	}
}
ProximProfile_Shadow = {
	object = {
		action = applylightgroup
		params = {
			lightgroup = group3
		}
	}
	ped = {
		action = applylightgroup
		params = {
			lightgroup = group3
		}
	}
	skateboard = {
		action = applylightgroup
		params = {
			lightgroup = group3
		}
	}
	camera = {
		action = runscript
		params = {
			proximscript = camera_proxim_script
		}
	}
}
ProximProfile_Indoor = {
	object = {
		action = applylightgroup
		params = {
			lightgroup = group1
		}
	}
	ped = {
		action = applylightgroup
		params = {
			lightgroup = group1
		}
	}
	skateboard = {
		action = applylightgroup
		params = {
			lightgroup = group1
		}
	}
	camera = {
		action = runscript
		params = {
			proximscript = camera_proxim_script
		}
	}
}

script camera_proxim_script 
	if gotparam \{inside}
		tod_proxim_update_lightfx \{fxparam = Default_Shadow_tod_manager}
	elseif NOT gotparam \{created}
		tod_proxim_update_lightfx \{fxparam = default_tod_manager}
	endif
endscript
