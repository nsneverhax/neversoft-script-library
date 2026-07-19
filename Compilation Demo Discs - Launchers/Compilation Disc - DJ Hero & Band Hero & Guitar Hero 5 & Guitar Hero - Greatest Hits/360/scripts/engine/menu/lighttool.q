
script run_windows_light_tool_commands 
	GetArraySize <commands>
	i = 0
	if (<array_size> > 0)
		begin
		(<commands> [<i>].ScriptName) (<commands> [<i>].params)
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
		change \{screenfx_instances_state = 1}
	else
		if GotParam \{off}
			change \{screenfx_instances_state = 0}
		else
			if ($screenfx_instances_state = 1)
				change \{screenfx_instances_state = 0}
			else
				change \{screenfx_instances_state = 1}
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
	printf \{qs("\L--- start_viewer_screen_fx")}
	ScreenFX_ClearFXInstances \{viewport = 0}
	good_saved_screenfx_settings
	if (<is_good> = 0)
		printf \{qs("\Lreturned")}
		return
	endif
	printstruct ($screenfx_instances_default_state)
	temp = ($screenfx_instances_default_state)
	begin
	if GetNextArrayElement <temp>
		ScreenFX_AddFXInstance {
			viewport = 0
			<element>
		}
	else
		break
	endif
	repeat
endscript

script save_current_screen_fx_setup 
	printf \{qs("\L--- save_current_screen_fx_setup")}
	if LevelIs \{viewer}
		Wait \{1
			second}
		ScreenFX_GetActiveScreenFXInstances \{viewport = 0}
		printstruct <...>
		change screenfx_instances_default_state = (<curscreenfx>)
	endif
endscript

script good_saved_screenfx_settings 
	printf \{qs("\L--- good_saved_screenfx_settings")}
	if NOT IsArray ($screenfx_instances_default_state)
		printf \{qs("\Lnot array")}
		return \{is_good = 0}
	else
		if ChecksumEquals a = (($screenfx_instances_default_state) [0].name) b = null
			printf \{qs("\Lnull")}
			return \{is_good = 0}
		endif
	endif
	return \{is_good = 1}
endscript

script ApplyLightColorChange 
	if IsCreated <lightChecksum>
		<lightChecksum> :Light_SetParams <...> r = <red> g = <green> b = <Blue>
	endif
endscript

script ApplyLightIntensityChange 
	if IsCreated <lightChecksum>
		<lightChecksum> :Light_SetParams <...>
	endif
endscript

script ApplyLightSpecularIntensityChange 
	if IsCreated <lightChecksum>
		<lightChecksum> :Light_SetParams <...>
	endif
endscript

script ApplyLightFarAttenChange 
	SetLightAttenuation name = <lightChecksum> attenstart = <attenstart> attenend = <attenend>
endscript

script UpdateLightTransform 
	if IsCreated <lightChecksum>
		SetLightFlag name = <lightChecksum> flag = DYNAMIC
		if GotParam \{betaplugin}
			SetLightPos name = <lightChecksum> pos = <pos>
			if GotParam \{bv_pos}
				SetLightBoundVol name = <lightChecksum> bv_pos = <bv_pos> bv_size = <bv_size> bv_rot = <bv_rot> bv_trans = <bv_trans>
			endif
		else
			MoveLight name = <lightChecksum> pos = <pos>
		endif
		ClearLightFlag name = <lightChecksum> flag = DYNAMIC
		CompactIntervals
	endif
endscript

script ApplyGroupIntensityChange 
	SetLightGroupIntensity name = <GroupChecksum> i = <intensity>
endscript

script ApplySnapshotToLight 
	if GotParam \{lightChecksum}
		if IsCreated <lightChecksum>
			<lightChecksum> :Light_SetParams <...>
		endif
	elseif GotParam \{housingchecksum}
		if IsCreated <housingchecksum>
			if <housingchecksum> :Obj_HasComponent PositionMorph
				<housingchecksum> :PM_SetParams <...>
			endif
			<housingchecksum> :LightVolume_SetParams <...>
		endif
	endif
endscript

script UpdateHousingTransform 
	if IsCreated <housingchecksum>
		if <housingchecksum> :Obj_HasComponent PositionMorph
			<housingchecksum> :PM_SetParams <...>
		endif
	endif
endscript

script ApplyHousingStartRadiusChange 
	if IsCreated <housingchecksum>
		<housingchecksum> :LightVolume_SetParams <...>
	endif
endscript

script ApplyHousingEndRadiusChange 
	if IsCreated <housingchecksum>
		<housingchecksum> :LightVolume_SetParams <...>
	endif
endscript

script ApplyHousingInnerRadiusChange 
	if IsCreated <housingchecksum>
		<housingchecksum> :LightVolume_SetParams <...>
	endif
endscript

script ApplyHousingRangeChange 
	if IsCreated <housingchecksum>
		<housingchecksum> :LightVolume_SetParams <...>
	endif
endscript

script ApplyHousingVolumeDensityChange 
	if IsCreated <housingchecksum>
		<housingchecksum> :LightVolume_SetParams <...>
	endif
endscript

script ApplyHousingParams 
	if IsCreated <housingchecksum>
		<housingchecksum> :LightVolume_SetParams <...>
	endif
endscript

script ApplyVolumeColorChange 
	if IsCreated <housingchecksum>
		if GotParam \{alpha}
			<housingchecksum> :LightVolume_SetParams {
				VolumeColorRed = <red>
				VolumeColorGreen = <green>
				VolumeColorBlue = <Blue>
				VolumeColorAlpha = <alpha>
			}
		else
			<housingchecksum> :LightVolume_SetParams {
				VolumeColorRed = <red>
				VolumeColorGreen = <green>
				VolumeColorBlue = <Blue>
			}
		endif
	endif
endscript

script ApplyProjectorColorChange 
	if IsCreated <housingchecksum>
		if GotParam \{alpha}
			<housingchecksum> :LightVolume_SetParams {
				ProjectorColorRed = <red>
				ProjectorColorGreen = <green>
				ProjectorColorBlue = <Blue>
				ProjectorColorAlpha = <alpha>
			}
		else
			<housingchecksum> :LightVolume_SetParams {
				ProjectorColorRed = <red>
				ProjectorColorGreen = <green>
				ProjectorColorBlue = <Blue>
			}
		endif
	endif
endscript

script SetHousingStaticParams 
	if IsCreated <housingchecksum>
		<housingchecksum> :LightVolume_SetStaticParams <...>
	endif
endscript
