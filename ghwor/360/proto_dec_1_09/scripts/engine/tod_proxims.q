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
			default
			applyvenuetonemap_default {
				viewport = <viewport>
			}
		endswitch
	endif
endscript
