curReviewLighting = 0

script SafeCreate 
	if IsInNodeArray <nodeName>
		if NOT IsCreated <nodeName>
			create Name = <nodeName>
		endif
	endif
endscript

script SafeKill 
	if IsCreated <nodeName>
		kill Name = <nodeName>
	endif
endscript

script safedestroy \{ifEmpty = 1}
	if IsCreated <nodeName>
		<nodeName> :Destroy ifEmpty = 1
	endif
endscript

script ScreenFlash \{time = 1}
	KillSpawnedScript \{id = ScreenFlash}
	SpawnScriptLater ScreenFlashOn id = ScreenFlash params = {time = <time>}
endscript

script ScreenFlashOn 
	if NOT screenFX_FXInstanceExists \{viewport = bg_viewport
			Name = FlashBS}
		ScreenFX_AddFXInstance {
			viewport = bg_viewport
			Name = FlashBS
			($ScreenFlash_tod_manager.screen_FX [0])
		}
	else
		ScreenFX_UpdateFXInstanceParams {
			viewport = bg_viewport
			Name = FlashBS
			($ScreenFlash_tod_manager.screen_FX [0])
		}
	endif
	Wait (0.1 * <time>) Seconds
	if screenFX_FXInstanceExists \{viewport = bg_viewport
			Name = FlashBS}
		ScreenFX_UpdateFXInstanceParams {
			viewport = bg_viewport
			Name = FlashBS
			time = <time>
			($ScreenFlash_tod_manager.screen_FX [0])
			Contrast = 1
			Brightness = 1
		}
	endif
	Wait <time> Seconds
	SpawnScriptLater \{ScreenFlashOff
		id = ScreenFlash}
endscript

script ScreenFlashOff 
	if ViewportExists \{id = bg_viewport}
		if screenFX_FXInstanceExists \{viewport = bg_viewport
				Name = FlashBS}
			ScreenFX_RemoveFXInstance \{viewport = bg_viewport
				Name = FlashBS}
		endif
	endif
endscript

script ScreenToBlack \{time = 0.4
		viewport = UI}
	KillSpawnedScript \{id = ScreenToBlack}
	SpawnScriptLater Call_ScreenToBlack id = ScreenToBlack params = {<...>}
endscript

script Call_ScreenToBlack 
	time = (0.5 * <time>)
	SpawnScriptLater Do_ScreenToBlack id = ScreenToBlack params = {On time = <time> <...>}
	Wait <time> Seconds
	SpawnScriptLater Do_ScreenToBlack id = ScreenToBlack params = {OFF time = <time> <...>}
endscript

script Do_ScreenToBlack 
	if NOT (<viewport> = 0)
		if NOT ViewportExists id = <viewport>
			return
		endif
	endif
	if GotParam \{On}
		if NOT screenFX_FXInstanceExists viewport = <viewport> Name = blackFX
			ScreenFX_AddFXInstance {
				viewport = <viewport>
				Name = blackFX
				($ScreenToBlack_tod_manager.screen_FX [0])
			}
		endif
		ScreenFX_UpdateFXInstanceParams {
			viewport = <viewport>
			Name = blackFX
			time = <time>
			($ScreenToBlack_tod_manager.screen_FX [0])
			inner_radius = 0
			Outer_Radius = 0
			alpha = 1
		}
	else
		if screenFX_FXInstanceExists viewport = <viewport> Name = blackFX
			ScreenFX_UpdateFXInstanceParams {
				viewport = <viewport>
				Name = blackFX
				time = <time>
				($ScreenToBlack_tod_manager.screen_FX [0])
				inner_radius = 1
				Outer_Radius = 1.5
				alpha = 0
			}
			if GotParam \{OFF}
				Wait <time> Seconds
				ScreenFX_RemoveFXInstance viewport = <viewport> Name = blackFX
			endif
		endif
	endif
endscript
