
script SafeGetUniqueCompositeObjectID \{preferredID = safeFXID01}
	if NOT GotParam \{objID}
		GetUniqueCompositeobjectID preferredID = <preferredID>
		return uniqueID = <uniqueID>
	endif
	i = 0
	formatText TextName = index '%i' i = <i>
	ExtendCrc <preferredID> <index> out = preferredID
	begin
	MangleChecksums a = <preferredID> b = <objID>
	if NOT ObjectExists id = <mangled_ID>
		return uniqueID = <preferredID>
	else
		i = (<i> + 1)
		formatText TextName = index '%i' i = <i>
		ExtendCrc <preferredID> <index> out = preferredID
	endif
	repeat
endscript

script setlightintensityovertime \{i = 1.0
		time = 2.0
		StepTime = 0.05}
	targeti = <i>
	getlightintensity Name = <Name>
	numSteps = (<time> / <StepTime>)
	CastToInteger \{numSteps}
	stepsize = ((<targeti> - <i>) / <numSteps>)
	begin
	i = (<i> + <stepsize>)
	setlightintensity Name = <Name> Intensity = <i>
	Wait <StepTime> Seconds
	repeat (<numSteps> -1)
	setlightintensity Name = <Name> Intensity = <targeti>
endscript

script light_updateposition \{offset = (0.0, 0.0, 0.0)}
	Obj_GetID
	begin
	if NOT IsCreated <attachObjId>
		Die
	endif
	<attachObjId> :Obj_GetPosition
	MoveLight Name = <objID> Pos = (<Pos> + <offset>)
	Wait \{1
		Frame}
	repeat
endscript
obj_scale = 0x24d8810d

script obj_setmaterialcolor_spawner 
	Obj_KillSpawnedScript \{Name = obj_setmaterialcolor}
	Obj_SpawnScriptLater obj_setmaterialcolor params = {<...>}
endscript

script blend_rgba 
	linearmap Result = br from = (<a> [0]) to = (<b> [0]) basedon = <i> lowerbound = 0 upperbound = 1
	linearmap Result = bg from = (<a> [1]) to = (<b> [1]) basedon = <i> lowerbound = 0 upperbound = 1
	linearmap Result = bb from = (<a> [2]) to = (<b> [2]) basedon = <i> lowerbound = 0 upperbound = 1
	linearmap Result = ba from = (<a> [3]) to = (<b> [3]) basedon = <i> lowerbound = 0 upperbound = 1
	rgba = [0.0 0.0 0.0 0.0]
	SetArrayElement ArrayName = rgba index = 0 NewValue = <br>
	SetArrayElement ArrayName = rgba index = 1 NewValue = <bg>
	SetArrayElement ArrayName = rgba index = 2 NewValue = <bb>
	SetArrayElement ArrayName = rgba index = 3 NewValue = <ba>
	return rgba = <rgba>
endscript

script create_avedit_fx \{viewport = bg_viewport
		clearcolor = [
			0
			0
			0
			255
		]
		BlendMode = blend
		alphafromgray = 1}
	ScreenFX_ClearFXInstances viewport = <viewport>
	Change \{visualizer_events_enabled = FALSE}
	if GotParam \{primitives}
		ScreenFX_AddFXInstance {
			viewport = <viewport>
			Name = avfx01
			scefName = avfx01
			Type = audiovisualize
			On = 1
			primitives = <primitives>
			clearcolor = <clearcolor>
			BlendMode = <BlendMode>
			alphafromgrayscale = <alphafromgray>
			audio_params = $default_visualizer_audio_params
		}
		ScreenFX_AddFXInstance {
			viewport = <viewport>
			Name = avfx_bloom01
			scefName = avfx_bloom01
			Type = Bloom2
			On = 1
			MaterialFilter = 0
			fullscreen = 1
			subtract = [0 0 0 0]
			colormodulate = [1.0 1.0 1.0 1.0]
			Saturation = 1.0
			equation = eq2
		}
		ScreenFX_AddFXInstance {
			viewport = <viewport>
			Name = uberscreenfx
			scefName = uberscreenfx
			Type = uberscreenfx
			On = 1
		}
	endif
endscript

script camerablur_fastzoom_inandout 
	if NOT bg_fx_get_start_params \{viewport = bg_viewport
			effectname = depth_of_field__simplified_}
		return
	endif
	bg_fx_set_blur \{appendstrength = 1
		time = 0.1}
	Wait \{0.2
		Seconds}
	bg_fx_set_blur \{appendstrength = 0
		time = 0.3}
	Wait \{0.2
		Seconds}
	bg_fx_set_blur \{appendstrength = 0.5
		time = 0.1}
	Wait \{0.1
		Second}
	bg_fx_set_blur effectparams = <startvalue> time = 0.4
endscript

script camerablur_slowzoom_inandout 
	if NOT bg_fx_get_start_params \{viewport = bg_viewport
			effectname = depth_of_field__simplified_}
		return
	endif
	bg_fx_set_blur \{appendstrength = 1
		time = 0.5}
	Wait \{0.4
		Seconds}
	bg_fx_set_blur \{appendstrength = 0
		time = 0.4}
	Wait \{0.5
		Seconds}
	bg_fx_set_blur \{appendstrength = 1
		time = 0.3}
	Wait \{0.3
		Second}
	bg_fx_set_blur effectparams = <startvalue> time = 0.4
endscript

script camerablur_focusin 
	if NOT bg_fx_get_start_params \{viewport = bg_viewport
			effectname = depth_of_field__simplified_}
		return
	endif
	bg_fx_set_blur \{appendstrength = 1
		time = 0}
	Wait \{0.1
		Second}
	bg_fx_set_blur effectparams = <startvalue> time = 0.5
endscript
