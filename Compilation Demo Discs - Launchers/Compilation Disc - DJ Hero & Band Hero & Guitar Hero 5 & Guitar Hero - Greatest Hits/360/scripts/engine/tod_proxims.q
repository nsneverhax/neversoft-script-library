SE_Brightness = 5
currentTODSettings = Default_tod_manager

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

script TOD_Proxim_Update_LightFX_Viewport \{fxParam = $Default_tod_manager
		viewport = bg_viewport
		time = 1}
	printf \{qs("\LRestore Fullscreen To Default")}
	ScreenFX_ClearFXInstances viewport = <viewport>
	if StructureContains \{Structure = fxParam
			screen_fx}
		begin
		if GetNextArrayElement (<fxParam>.screen_fx)
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
METALLICA_WORSTCASE_SCREENFX = 0
APPLY_GH4_FX = 0

script TOD_Proxim_Reapply_LightFX 
	TOD_Proxim_Update_LightFX \{fxParam = $currentTODSettings
		time = 0.0}
endscript

script TOD_Proxim_Remove_MetallicaFX 
	TOD_Proxim_Update_LightFX \{fxParam = $Remove_MetallicaFX_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script TOD_Proxim_Reapply_MetallicaFX 
	TOD_Proxim_Update_LightFX \{fxParam = $Default_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script TOD_Proxim_Apply_BW_Contrast 
	if ($METALLICA_WORSTCASE_SCREENFX = 1)
		TOD_Proxim_Update_LightFX \{fxParam = $Metal_Vignette_tod_manager
			viewport = bg_viewport
			time = 0.0}
		return
	endif
	if ($APPLY_GH4_FX = 1)
		TOD_Proxim_Update_LightFX \{fxParam = $GH4_OldFX_tod_manager
			viewport = bg_viewport
			time = 0.0}
		return
	endif
	TOD_Proxim_Update_LightFX \{fxParam = $Metal_BW_Contrast_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script TOD_Proxim_Apply_Vignette 
	if ($METALLICA_WORSTCASE_SCREENFX = 1)
		TOD_Proxim_Update_LightFX \{fxParam = $Metal_Vignette_tod_manager
			viewport = bg_viewport
			time = 0.0}
		return
	endif
	if ($APPLY_GH4_FX = 1)
		TOD_Proxim_Update_LightFX \{fxParam = $GH4_OldFX_tod_manager
			viewport = bg_viewport
			time = 0.0}
		return
	endif
	TOD_Proxim_Update_LightFX \{fxParam = $Metal_Vignette_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script TOD_Proxim_Apply_BW_Grainy2 
	TOD_Proxim_Update_LightFX \{fxParam = $Metal_BW_Grainy2_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script TOD_Proxim_Apply_BW_Grainy 
	TOD_Proxim_Update_LightFX \{fxParam = $Metal_BW_Grainy_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script TOD_Proxim_Apply_CoolBlue 
	TOD_Proxim_Update_LightFX \{fxParam = $Metal_BlueTint_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script TOD_Proxim_Apply_HotBlue 
	TOD_Proxim_Update_LightFX \{fxParam = $Metal_HotBlue_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script TOD_Proxim_Apply_Sepia 
	TOD_Proxim_Update_LightFX \{fxParam = $Metal_Sepia_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script TOD_Proxim_Apply_Yellow 
	TOD_Proxim_Update_LightFX \{fxParam = $Metal_Yellow_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script TOD_Proxim_Apply_Green 
	TOD_Proxim_Update_LightFX \{fxParam = $Metal_Green_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script TOD_Proxim_Apply_Forest 
	TOD_Proxim_Update_LightFX \{fxParam = $Metal_Forest_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script TOD_Proxim_Apply_DesatRed 
	TOD_Proxim_Update_LightFX \{fxParam = $Metal_DesatRed_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script TOD_Proxim_Apply_InkBlotch_Red 
	TOD_Proxim_Update_LightFX \{fxParam = $Metal_InkBlotch_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script TOD_Proxim_Apply_InkBlotch_TurqPink 
	TOD_Proxim_Update_LightFX \{fxParam = $Metal_TurqPink_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script TOD_Proxim_Apply_BloomSat 
	TOD_Proxim_Update_LightFX \{fxParam = $Metal_BloomSat_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script TOD_Proxim_Apply_InkBlotch2 
	TOD_Proxim_Update_LightFX \{fxParam = $Metal_BW_InkBlotch_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script TOD_Proxim_Apply_CareerIntroFX 
	TOD_Proxim_Update_LightFX \{fxParam = $Metal_CareerIntro_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script TOD_Proxim_Apply_CareerIntro_02_FX 
	TOD_Proxim_Update_LightFX \{fxParam = $Metal_CareerIntro_02_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script TOD_Proxim_Apply_CareerIntro_Cut1_FX 
	TOD_Proxim_Update_LightFX \{fxParam = $Metal_CareerIntro_Cut1_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script TOD_Proxim_Apply_Noisy 
	TOD_Proxim_Update_LightFX \{fxParam = $Metal_NoisyDefault_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script TOD_Proxim_Apply_Inkblotch3 
	TOD_Proxim_Update_LightFX \{fxParam = $Metal_InkBlotch3_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script TOD_Proxim_Apply_WarmStreaks 
	TOD_Proxim_Update_LightFX \{fxParam = $Metal_SatRedStreaks_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script TOD_Proxim_Apply_CoolStreaks 
	TOD_Proxim_Update_LightFX \{fxParam = $Metal_TurqPinkStreaks_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script TOD_Proxim_Apply_BW_Splots 
	TOD_Proxim_Update_LightFX \{fxParam = $Metal_BW_Splots_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script TOD_Proxim_Apply_DesatSplots_01 
	TOD_Proxim_Update_LightFX \{fxParam = $Metal_DesatSplots_01_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script TOD_Proxim_Apply_ContrastyVignette 
	TOD_Proxim_Update_LightFX \{fxParam = $Metal_ContrastyVignette_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script TOD_Proxim_Apply_BW_Grungy 
	TOD_Proxim_Update_LightFX \{fxParam = $Metal_BW_Grungy_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script TOD_Proxim_Apply_BW_Streaks 
	TOD_Proxim_Update_LightFX \{fxParam = $Metal_BW_Streaks_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript
