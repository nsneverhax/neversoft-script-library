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
	if StructureContains \{structure = fxParam
			screen_FX}
		begin
		if GetNextArrayElement (<fxParam>.screen_FX)
			ScreenFX_AddFXInstance {
				0xdc510b7b = ($0xfe9c220d)
				viewport = <viewport>
				<element>
			}
		else
			break
		endif
		repeat
	endif
endscript
metallica_worstcase_screenfx = 0
apply_gh4_fx = 0

script TOD_Proxim_Reapply_LightFX 
	TOD_Proxim_Update_LightFX \{fxParam = $currentTODSettings
		time = 0.0}
endscript

script tod_proxim_remove_metallicafx 
	TOD_Proxim_Update_LightFX \{fxParam = $remove_metallicafx_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_reapply_metallicafx 
	TOD_Proxim_Update_LightFX \{fxParam = $Default_TOD_Manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_bw_contrast 
	if ($metallica_worstcase_screenfx = 1)
		TOD_Proxim_Update_LightFX \{fxParam = $metal_vignette_tod_manager
			viewport = bg_viewport
			time = 0.0}
		return
	endif
	if ($apply_gh4_fx = 1)
		TOD_Proxim_Update_LightFX \{fxParam = $gh4_oldfx_tod_manager
			viewport = bg_viewport
			time = 0.0}
		return
	endif
	TOD_Proxim_Update_LightFX \{fxParam = $metal_bw_contrast_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_vignette 
	if ($metallica_worstcase_screenfx = 1)
		TOD_Proxim_Update_LightFX \{fxParam = $metal_vignette_tod_manager
			viewport = bg_viewport
			time = 0.0}
		return
	endif
	if ($apply_gh4_fx = 1)
		TOD_Proxim_Update_LightFX \{fxParam = $gh4_oldfx_tod_manager
			viewport = bg_viewport
			time = 0.0}
		return
	endif
	TOD_Proxim_Update_LightFX \{fxParam = $metal_vignette_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_bw_grainy2 
	TOD_Proxim_Update_LightFX \{fxParam = $metal_bw_grainy2_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_bw_grainy 
	TOD_Proxim_Update_LightFX \{fxParam = $metal_bw_grainy_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_coolblue 
	TOD_Proxim_Update_LightFX \{fxParam = $metal_bluetint_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_hotblue 
	TOD_Proxim_Update_LightFX \{fxParam = $metal_hotblue_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_sepia 
	TOD_Proxim_Update_LightFX \{fxParam = $metal_sepia_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_yellow 
	TOD_Proxim_Update_LightFX \{fxParam = $metal_yellow_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_green 
	TOD_Proxim_Update_LightFX \{fxParam = $metal_green_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_forest 
	TOD_Proxim_Update_LightFX \{fxParam = $metal_forest_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_desatred 
	TOD_Proxim_Update_LightFX \{fxParam = $metal_desatred_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_inkblotch_red 
	TOD_Proxim_Update_LightFX \{fxParam = $metal_inkblotch_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_inkblotch_turqpink 
	TOD_Proxim_Update_LightFX \{fxParam = $metal_turqpink_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_bloomsat 
	TOD_Proxim_Update_LightFX \{fxParam = $metal_bloomsat_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_inkblotch2 
	TOD_Proxim_Update_LightFX \{fxParam = $metal_bw_inkblotch_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_careerintrofx 
	TOD_Proxim_Update_LightFX \{fxParam = $metal_careerintro_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_careerintro_02_fx 
	TOD_Proxim_Update_LightFX \{fxParam = $metal_careerintro_02_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_careerintro_cut1_fx 
	TOD_Proxim_Update_LightFX \{fxParam = $metal_careerintro_cut1_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_noisy 
	TOD_Proxim_Update_LightFX \{fxParam = $metal_noisydefault_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_inkblotch3 
	TOD_Proxim_Update_LightFX \{fxParam = $metal_inkblotch3_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_warmstreaks 
	TOD_Proxim_Update_LightFX \{fxParam = $metal_satredstreaks_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_coolstreaks 
	TOD_Proxim_Update_LightFX \{fxParam = $metal_turqpinkstreaks_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_bw_splots 
	TOD_Proxim_Update_LightFX \{fxParam = $metal_bw_splots_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_desatsplots_01 
	TOD_Proxim_Update_LightFX \{fxParam = $metal_desatsplots_01_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_contrastyvignette 
	TOD_Proxim_Update_LightFX \{fxParam = $metal_contrastyvignette_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_bw_grungy 
	TOD_Proxim_Update_LightFX \{fxParam = $metal_bw_grungy_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_bw_streaks 
	TOD_Proxim_Update_LightFX \{fxParam = $metal_bw_streaks_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript
