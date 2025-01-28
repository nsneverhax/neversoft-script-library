curReviewLighting = 0

script CycleReviewLighting 
	Change curReviewLighting = ($curReviewLighting + 1)
	if ($curReviewLighting = 7)
		Change \{curReviewLighting = 0}
	endif
	GetPakManCurrentName \{map = Zones}
	FormatText ChecksumName = lightPrefix '%p_GFX_L' P = <pakname>
	CallScriptOnNode prefix = <lightPrefix> callBack_Script = CB_CycleReviewLighting Params = {}
endscript

script CB_CycleReviewLighting 
	GetLightColor Name = <NodeName>
	big = <R>
	if (<big> < <G>)
		big = <G>
	endif
	if (<big> < <B>)
		big = <B>
	endif
	switch $curReviewLighting
		case 0
		SetLightColor Name = <NodeName> R = <big> G = <big> B = <big>
		case 1
		SetLightColor Name = <NodeName> R = <big> G = (<big> / 6.0) B = (<big> / 6.0)
		case 2
		SetLightColor Name = <NodeName> R = (<big> / 6.0) G = <big> B = (<big> / 6.0)
		case 3
		SetLightColor Name = <NodeName> R = (<big> / 6.0) G = (<big> / 6.0) B = <big>
		case 4
		SetLightColor Name = <NodeName> R = (<big> / 6.0) G = <big> B = <big>
		case 5
		SetLightColor Name = <NodeName> R = <big> G = (<big> / 6.0) B = <big>
		case 6
		SetLightColor Name = <NodeName> R = <big> G = <big> B = (<big> / 6.0)
	endswitch
endscript

script SafeCreate 
	if IsInNodeArray <NodeName>
		if NOT IsCreated <NodeName>
			Create Name = <NodeName>
		endif
	endif
endscript

script SafeKill 
	if IsCreated <NodeName>
		Kill Name = <NodeName>
	endif
endscript

script ScreenFlash \{Time = 1}
	KillSpawnedScript \{Id = ScreenFlash}
	SpawnScriptLater ScreenFlashOn Id = ScreenFlash Params = {Time = <Time>}
endscript

script ScreenFlashOn 
	if NOT ScreenFX_FXInstanceExists \{viewport = Bg_Viewport
			Name = FlashBS}
		ScreenFX_AddFXInstance {
			viewport = Bg_Viewport
			Name = FlashBS
			($ScreenFlash_TOD_Manager.screen_FX [0])
		}
	else
		ScreenFX_UpdateFXInstanceParams {
			viewport = Bg_Viewport
			Name = FlashBS
			($ScreenFlash_TOD_Manager.screen_FX [0])
		}
	endif
	Wait (0.1 * <Time>) Seconds
	if ScreenFX_FXInstanceExists \{viewport = Bg_Viewport
			Name = FlashBS}
		ScreenFX_UpdateFXInstanceParams {
			viewport = Bg_Viewport
			Name = FlashBS
			Time = <Time>
			($ScreenFlash_TOD_Manager.screen_FX [0])
			Contrast = 1
			Brightness = 1
		}
	endif
	Wait <Time> Seconds
	SpawnScriptLater \{ScreenFlashOff
		Id = ScreenFlash}
endscript

script ScreenFlashOff 
	if ViewportExists \{Id = Bg_Viewport}
		if ScreenFX_FXInstanceExists \{viewport = Bg_Viewport
				Name = FlashBS}
			ScreenFX_RemoveFXInstance \{viewport = Bg_Viewport
				Name = FlashBS}
		endif
	endif
endscript

script ScreenToBlack \{Time = 0.4
		viewport = UI}
	KillSpawnedScript \{Id = ScreenToBlack}
	SpawnScriptLater Call_ScreenToBlack Id = ScreenToBlack Params = {<...>}
endscript

script Call_ScreenToBlack 
	Time = (0.5 * <Time>)
	SpawnScriptLater Do_ScreenToBlack Id = ScreenToBlack Params = {ON Time = <Time> <...>}
	Wait <Time> Seconds
	SpawnScriptLater Do_ScreenToBlack Id = ScreenToBlack Params = {OFF Time = <Time> <...>}
endscript

script Do_ScreenToBlack 
	if NOT (<viewport> = 0)
		if NOT ViewportExists Id = <viewport>
			return
		endif
	endif
	if GotParam \{ON}
		if NOT ScreenFX_FXInstanceExists viewport = <viewport> Name = blackFX
			ScreenFX_AddFXInstance {
				viewport = <viewport>
				Name = blackFX
				($ScreenToBlack_TOD_Manager.screen_FX [0])
			}
		endif
		ScreenFX_UpdateFXInstanceParams {
			viewport = <viewport>
			Name = blackFX
			Time = <Time>
			($ScreenToBlack_TOD_Manager.screen_FX [0])
			Inner_Radius = 0
			Outer_Radius = 0
			Alpha = 1
		}
	else
		if ScreenFX_FXInstanceExists viewport = <viewport> Name = blackFX
			ScreenFX_UpdateFXInstanceParams {
				viewport = <viewport>
				Name = blackFX
				Time = <Time>
				($ScreenToBlack_TOD_Manager.screen_FX [0])
				Inner_Radius = 1
				Outer_Radius = 1.5
				Alpha = 0
			}
			if GotParam \{OFF}
				Wait <Time> Seconds
				ScreenFX_RemoveFXInstance viewport = <viewport> Name = blackFX
			endif
		endif
	endif
endscript
