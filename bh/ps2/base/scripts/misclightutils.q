
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
			Brightness = 1.5
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
