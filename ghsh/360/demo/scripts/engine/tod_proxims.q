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
endscript
metallica_worstcase_screenfx = 0
apply_gh4_fx = 0

script tod_proxim_reapply_lightfx 
	tod_proxim_update_lightfx \{fxparam = $currenttodsettings
		time = 0.0}
endscript

script tod_proxim_remove_metallicafx 
	tod_proxim_update_lightfx \{fxparam = $remove_metallicafx_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_reapply_metallicafx 
	tod_proxim_update_lightfx \{fxparam = $default_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_bw_contrast 
	if ($metallica_worstcase_screenfx = 1)
		tod_proxim_update_lightfx \{fxparam = $metal_vignette_tod_manager
			viewport = bg_viewport
			time = 0.0}
		return
	endif
	if ($apply_gh4_fx = 1)
		tod_proxim_update_lightfx \{fxparam = $gh4_oldfx_tod_manager
			viewport = bg_viewport
			time = 0.0}
		return
	endif
	tod_proxim_update_lightfx \{fxparam = $metal_bw_contrast_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_vignette 
	if ($metallica_worstcase_screenfx = 1)
		tod_proxim_update_lightfx \{fxparam = $metal_vignette_tod_manager
			viewport = bg_viewport
			time = 0.0}
		return
	endif
	if ($apply_gh4_fx = 1)
		tod_proxim_update_lightfx \{fxparam = $gh4_oldfx_tod_manager
			viewport = bg_viewport
			time = 0.0}
		return
	endif
	tod_proxim_update_lightfx \{fxparam = $metal_vignette_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_bw_grainy2 
	tod_proxim_update_lightfx \{fxparam = $metal_bw_grainy2_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_bw_grainy 
	tod_proxim_update_lightfx \{fxparam = $metal_bw_grainy_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_coolblue 
	tod_proxim_update_lightfx \{fxparam = $metal_bluetint_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_hotblue 
	tod_proxim_update_lightfx \{fxparam = $metal_hotblue_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_sepia 
	tod_proxim_update_lightfx \{fxparam = $metal_sepia_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_yellow 
	tod_proxim_update_lightfx \{fxparam = $metal_yellow_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_green 
	tod_proxim_update_lightfx \{fxparam = $metal_green_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_forest 
	tod_proxim_update_lightfx \{fxparam = $metal_forest_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_desatred 
	tod_proxim_update_lightfx \{fxparam = $metal_desatred_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_inkblotch_red 
	tod_proxim_update_lightfx \{fxparam = $metal_inkblotch_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_inkblotch_turqpink 
	tod_proxim_update_lightfx \{fxparam = $metal_turqpink_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_bloomsat 
	tod_proxim_update_lightfx \{fxparam = $metal_bloomsat_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_inkblotch2 
	tod_proxim_update_lightfx \{fxparam = $metal_bw_inkblotch_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_careerintrofx 
	tod_proxim_update_lightfx \{fxparam = $metal_careerintro_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_careerintro_02_fx 
	tod_proxim_update_lightfx \{fxparam = $metal_careerintro_02_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_careerintro_cut1_fx 
	tod_proxim_update_lightfx \{fxparam = $metal_careerintro_cut1_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_noisy 
	tod_proxim_update_lightfx \{fxparam = $metal_noisydefault_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_inkblotch3 
	tod_proxim_update_lightfx \{fxparam = $metal_inkblotch3_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_warmstreaks 
	tod_proxim_update_lightfx \{fxparam = $metal_satredstreaks_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_coolstreaks 
	tod_proxim_update_lightfx \{fxparam = $metal_turqpinkstreaks_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_bw_splots 
	tod_proxim_update_lightfx \{fxparam = $metal_bw_splots_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_desatsplots_01 
	tod_proxim_update_lightfx \{fxparam = $metal_desatsplots_01_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_contrastyvignette 
	tod_proxim_update_lightfx \{fxparam = $metal_contrastyvignette_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_bw_grungy 
	tod_proxim_update_lightfx \{fxparam = $metal_bw_grungy_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_bw_streaks 
	tod_proxim_update_lightfx \{fxparam = $metal_bw_streaks_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript
