
script run_windows_light_tool_commands 
	GetArraySize <commands>
	i = 0
	if (<array_size> > 0)
		begin
		(<commands> [<i>].scriptname) (<commands> [<i>].params)
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script global_fx_unlock_and_set_temp_tod 
	tod_manager_apply_perm_light_settings <...>
endscript
screenfx_instances_state = 1
screenfx_instances_default_state = [
	{
		name = null
	}
]

script toggle_screenfx_instances 
	if GotParam \{on}
		Change \{screenfx_instances_state = 1}
	else
		if GotParam \{off}
			Change \{screenfx_instances_state = 0}
		else
			if ($screenfx_instances_state = 1)
				Change \{screenfx_instances_state = 0}
			else
				Change \{screenfx_instances_state = 1}
			endif
		endif
	endif
	ScreenFX_GetActiveScreenFXInstances \{viewport = 0}
	if NOT IsArray <curscreenfx>
		return
	endif
	GetArraySize <curscreenfx>
	i = 0
	begin
	ScreenFX_UpdateFXInstanceParams {
		viewport = 0
		name = (<curscreenfx> [<i>].name)
		time = 0
		on = ($screenfx_instances_state)
	}
	i = (<i> + 1)
	repeat <array_size>
	save_current_screen_fx_setup
endscript

script start_viewer_screen_fx 
	printf \{qs(0x6edb9260)}
	TOD_Proxim_Create_LightFX
endscript

script save_current_screen_fx_setup 
	printf \{qs(0x00c3b630)}
	if LevelIs \{viewer}
		wait \{1
			second}
		ScreenFX_GetActiveScreenFXInstances \{viewport = 0}
		printstruct <...>
		Change screenfx_instances_default_state = (<curscreenfx>)
	endif
endscript

script good_saved_screenfx_settings 
	printf \{qs(0x86e2db29)}
	if NOT IsArray ($screenfx_instances_default_state)
		printf \{qs(0x7e21df16)}
		return \{is_good = 0}
	else
		if checksumequals a = (($screenfx_instances_default_state) [0].name) b = null
			printf \{qs(0x1feb8bd8)}
			return \{is_good = 0}
		endif
	endif
	return \{is_good = 1}
endscript

script ApplyLightColorChange 
	if IsCreated <LightChecksum>
		<LightChecksum> :Light_SetParams <...> r = <red> g = <green> b = <blue>
	endif
endscript

script ApplyLightIntensityChange 
	if IsCreated <LightChecksum>
		<LightChecksum> :Light_SetParams <...>
	endif
endscript

script ApplyLightSpecularIntensityChange 
	if IsCreated <LightChecksum>
		<LightChecksum> :Light_SetParams <...>
	endif
endscript

script ApplyLightFarAttenChange 
	SetLightAttenuation name = <LightChecksum> AttenStart = <AttenStart> AttenEnd = <AttenEnd>
endscript

script UpdateLightTransform 
	if IsCreated <LightChecksum>
		SetLightFlag name = <LightChecksum> flag = Dynamic
		if GotParam \{betaplugin}
			SetLightPos name = <LightChecksum> Pos = <Pos>
			if GotParam \{bv_pos}
				SetLightBoundVol name = <LightChecksum> bv_pos = <bv_pos> bv_size = <bv_size> bv_rot = <bv_rot> bv_trans = <bv_trans>
			endif
		else
			MoveLight name = <LightChecksum> Pos = <Pos>
		endif
		ClearLightFlag name = <LightChecksum> flag = Dynamic
		CompactIntervals
	endif
endscript

script ApplyGroupIntensityChange 
	SetLightGroupIntensity name = <GroupChecksum> i = <Intensity>
endscript

script ApplySnapshotToLight 
	if GotParam \{LightChecksum}
		if IsCreated <LightChecksum>
			<LightChecksum> :Light_SetParams <...>
		endif
	elseif GotParam \{HousingChecksum}
		if IsCreated <HousingChecksum>
			if <HousingChecksum> :Obj_HasComponent PositionMorph
				<HousingChecksum> :PM_SetParams <...>
			endif
			<HousingChecksum> :LightVolume_SetParams <...>
			<HousingChecksum> :LightVolume_SetStaticParams <...>
		endif
	endif
endscript

script UpdateHousingTransform 
	if IsCreated <HousingChecksum>
		if <HousingChecksum> :Obj_HasComponent PositionMorph
			<HousingChecksum> :PM_SetParams <...>
		endif
	endif
endscript

script ApplyHousingStartRadiusChange 
	if IsCreated <HousingChecksum>
		<HousingChecksum> :LightVolume_SetParams <...>
	endif
endscript

script ApplyHousingEndRadiusChange 
	if IsCreated <HousingChecksum>
		<HousingChecksum> :LightVolume_SetParams <...>
	endif
endscript

script ApplyHousingInnerRadiusChange 
	if IsCreated <HousingChecksum>
		<HousingChecksum> :LightVolume_SetParams <...>
	endif
endscript

script ApplyHousingRangeChange 
	if IsCreated <HousingChecksum>
		<HousingChecksum> :LightVolume_SetParams <...>
	endif
endscript

script ApplyHousingVolumeDensityChange 
	if IsCreated <HousingChecksum>
		<HousingChecksum> :LightVolume_SetParams <...>
	endif
endscript

script ApplyHousingParams 
	if IsCreated <HousingChecksum>
		<HousingChecksum> :LightVolume_SetParams <...>
	endif
endscript

script ApplyVolumeColorChange 
	if IsCreated <HousingChecksum>
		if GotParam \{alpha}
			<HousingChecksum> :LightVolume_SetParams {
				VolumeColorRed = <red>
				VolumeColorGreen = <green>
				VolumeColorBlue = <blue>
				VolumeColorAlpha = <alpha>
			}
		else
			<HousingChecksum> :LightVolume_SetParams {
				VolumeColorRed = <red>
				VolumeColorGreen = <green>
				VolumeColorBlue = <blue>
			}
		endif
	endif
endscript

script ApplyProjectorColorChange 
	if IsCreated <HousingChecksum>
		if GotParam \{alpha}
			<HousingChecksum> :LightVolume_SetParams {
				ProjectorColorRed = <red>
				ProjectorColorGreen = <green>
				ProjectorColorBlue = <blue>
				ProjectorColorAlpha = <alpha>
			}
		else
			<HousingChecksum> :LightVolume_SetParams {
				ProjectorColorRed = <red>
				ProjectorColorGreen = <green>
				ProjectorColorBlue = <blue>
			}
		endif
	endif
endscript

script SetHousingStaticParams 
	if IsCreated <HousingChecksum>
		<HousingChecksum> :LightVolume_SetStaticParams <...>
	endif
endscript
