SE_Brightness = 5
currentTODSettings = Default_TOD_Manager

script TOD_Proxim_Create_LightFX 
	ScreenFX_ClearFXInstances \{viewport = 0}
	if InSplitScreenGame
		ScreenFX_ClearFXInstances \{viewport = 0}
	endif
	TOD_Proxim_Update_LightFX \{viewport = bg_viewport
		time = 0}
endscript

script TOD_Proxim_Update_LightFX 
	TOD_Proxim_Update_LightFX_Viewport viewport = bg_viewport <...>
endscript

script toggle_default_sceenfx 
	TOD_Proxim_Update_LightFX_Viewport
endscript

script TOD_Proxim_Update_LightFX_Viewport \{fxParam = $Default_TOD_Manager
		viewport = bg_viewport
		time = 1}
	ScreenFX_ClearFXInstances viewport = <viewport>
	if StructureContains structure = <fxParam> screen_FX
		begin
		if GetNextArrayElement (<fxParam>.screen_FX)
			ScreenFX_AddFXInstance {
				viewport = <viewport>
				<element>
			}
		else
			break
		endif
		repeat
	endif
endscript

script TOD_Proxim_Reapply_LightFX 
	TOD_Proxim_Update_LightFX \{fxParam = $currentTODSettings
		time = 0.0}
endscript

script tod_proxim_apply_default 
	TOD_Proxim_Update_LightFX \{fxParam = $Default_TOD_Manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_bw_01 
	TOD_Proxim_Update_LightFX \{fxParam = $bw_01_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script applyvenuetonemap_default 
	if NOT screenFX_FXInstanceExists viewport = <viewport> Name = tone_map
		ScreenFX_AddFXInstance {
			viewport = <viewport>
			Name = tone_map
			scefName = tone_map
			Type = tonemap
			texture = 'tex\\LUTs\\lut_default_dnc.dds'
		}
	else
		ScreenFX_UpdateFXInstanceParams {
			viewport = <viewport>
			Name = tone_map
			scefName = tone_map
			Type = tonemap
			texture = 'tex\\LUTs\\lut_default_dnc.dds'
		}
	endif
endscript

script venue_screenfx \{viewport = bg_viewport}
	if existspakmanmap \{map = zones}
		GetPakManCurrent \{map = zones}
		switch <pak>
			case z_barbarian
			if screenFX_FXInstanceExists \{viewport = bg_viewport
					Name = godray}
				ScreenFX_UpdateFXInstanceParams \{viewport = bg_viewport
					Name = barbariangodray
					scefName = godray
					Type = godray
					On = 1
					colormodulate = [
						1.0
						0.96078396
						0.870588
						1.0
					]
					depthmodulate = 0.5
					steps = 100.0
					Range = 0.18320002
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
					lightsource = Color}
			endif
			default
			applyvenuetonemap_default {
				viewport = <viewport>
			}
			if screenFX_FXInstanceExists \{viewport = bg_viewport
					Name = godray}
				ScreenFX_UpdateFXInstanceParams \{viewport = bg_viewport
					Name = godray
					scefName = godray
					Type = godray
					On = 1
					colormodulate = [
						1.0
						0.96078396
						0.870588
						2.0
					]
					depthmodulate = 0.5
					steps = 60.0
					Range = 0.125
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
