curReviewLighting = 0

script CycleReviewLighting 
	Change curReviewLighting = ($curReviewLighting + 1)
	if ($curReviewLighting = 7)
		Change \{curReviewLighting = 0}
	endif
	GetPakManCurrentName \{map = zones}
	formatText checksumName = lightPrefix '%p_GFX_L' p = <pakname>
	CallScriptOnNode prefix = <lightPrefix> callBack_Script = CB_CycleReviewLighting params = {}
endscript

script CB_CycleReviewLighting 
	GetLightColor Name = <nodeName>
	big = <r>
	if (<big> < <g>)
		big = <g>
	endif
	if (<big> < <b>)
		big = <b>
	endif
	switch $curReviewLighting
		case 0
		SetLightColor Name = <nodeName> r = <big> g = <big> b = <big>
		case 1
		SetLightColor Name = <nodeName> r = <big> g = (<big> / 6.0) b = (<big> / 6.0)
		case 2
		SetLightColor Name = <nodeName> r = (<big> / 6.0) g = <big> b = (<big> / 6.0)
		case 3
		SetLightColor Name = <nodeName> r = (<big> / 6.0) g = (<big> / 6.0) b = <big>
		case 4
		SetLightColor Name = <nodeName> r = (<big> / 6.0) g = <big> b = <big>
		case 5
		SetLightColor Name = <nodeName> r = <big> g = (<big> / 6.0) b = <big>
		case 6
		SetLightColor Name = <nodeName> r = <big> g = <big> b = (<big> / 6.0)
	endswitch
endscript

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

script FadeToBlackAndBack \{fadetime = 0.5
		holdtime = 2.0
		viewport = bg_viewport}
	KillSpawnedScript \{id = ScreenToBlack}
	SpawnScriptLater Call_FadeToBlackAndBack id = ScreenToBlack params = {<...>}
endscript

script Call_FadeToBlackAndBack 
	SpawnScriptLater Do_ScreenToBlack id = ScreenToBlack params = {On time = 0 <...>}
	SpawnScriptLater Do_ScreenToBlack id = ScreenToBlack params = {OFF time = <fadetime> <...>}
	Wait <holdtime> Seconds
	SpawnScriptLater Do_ScreenToBlack id = ScreenToBlack params = {On time = <fadetime> <...>}
	SpawnScriptLater Do_ScreenToBlack id = ScreenToBlack params = {OFF time = 0 <...>}
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
