SE_Brightness = 5
currentTODSettings = Default_TOD_Manager

script TOD_Proxim_Create_LightFX 
	ScreenFX_ClearFXInstances \{viewport = 0}
	if InSplitScreenGame
		ScreenFX_ClearFXInstances \{viewport = 0}
	endif
	TOD_Proxim_Update_Global_Brightness \{viewport = 0}
	TOD_Proxim_Update_LightFX \{viewport = bg_viewport
		time = 0}
endscript

script TOD_Proxim_Update_LightFX 
	TOD_Proxim_Update_LightFX_Viewport viewport = 0 <...>
	if InSplitScreenGame
		TOD_Proxim_Update_LightFX_Viewport viewport = 0 <...>
	endif
endscript

script toggle_default_sceenfx 
	printf \{"--- toggle_default_screenfx"}
	TOD_Proxim_Update_LightFX_Viewport
	toggle_screenfx_instances
endscript

script TOD_Proxim_Update_LightFX_Viewport \{fxParam = $Default_TOD_Manager
		viewport = 0
		time = 1}
	ScreenFX_ClearFXInstances viewport = <viewport>
	if (<viewport> = 0)
		TOD_Proxim_Update_Global_Brightness <...>
	elseif (<viewport> = bg_viewport)
		if NOT screenFX_FXInstanceExists viewport = <viewport> Name = venue_DOF
			ScreenFX_AddFXInstance {
				viewport = <viewport>
				Name = venue_DOF
				($DOF_Off_TOD_Manager.screen_FX [0])
			}
		else
			ScreenFX_UpdateFXInstanceParams {
				viewport = <viewport>
				Name = venue_DOF
				($DOF_Off_TOD_Manager.screen_FX [0])
			}
		endif
	endif
	if StructureContains \{structure = fxParam
			screen_FX}
		begin
		if GetNextArrayElement (<fxParam>.screen_FX)
			GetUniqueCompositeobjectID \{preferredID = screenFXID}
			ScreenFX_AddFXInstance {
				viewport = <viewport>
				Name = <uniqueID>
				<element>
			}
		else
			break
		endif
		repeat
	endif
	if StructureContains \{structure = fxParam
			atmosphere}
		UpdateAtmosphere (<fxParam>.atmosphere)
	endif
endscript

script TOD_Proxim_Reapply_LightFX 
	TOD_Proxim_Update_LightFX \{fxParam = $currentTODSettings
		time = 0.0}
endscript

script TOD_Proxim_Update_Global_Brightness \{viewport = 0}
	if NOT screenFX_FXInstanceExists viewport = <viewport> Name = global_brightness
		ScreenFX_AddFXInstance {
			viewport = <viewport>
			Name = global_brightness
			On = 1
			Brightness = (0.5 + ($SE_Brightness) * 0.1)
			Type = Bright_Sat
		}
	else
		ScreenFX_UpdateFXInstanceParams {
			viewport = <viewport>
			Name = global_brightness
			On = 1
			Brightness = (0.5 + ($SE_Brightness) * 0.1)
			time = 0
		}
	endif
endscript
