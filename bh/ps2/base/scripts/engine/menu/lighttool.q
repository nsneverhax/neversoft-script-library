
script run_windows_light_tool_commands 
	GetArraySize <commands>
	i = 0
	if (<array_Size> > 0)
		begin
		(<commands> [<i>].scriptname) (<commands> [<i>].params)
		i = (<i> + 1)
		repeat <array_Size>
	endif
endscript

script global_fx_unlock_and_set_temp_tod 
	tod_manager_apply_perm_light_settings <...>
endscript
screenfx_instances_state = 1
screenfx_instances_default_state = [
	{
		Name = NULL
	}
]

script toggle_screenfx_instances 
	if GotParam \{On}
		Change \{screenfx_instances_state = 1}
	else
		if GotParam \{OFF}
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
		Name = (<curscreenfx> [<i>].Name)
		time = 0
		On = ($screenfx_instances_state)
	}
	i = (<i> + 1)
	repeat <array_Size>
	save_current_screen_fx_setup
endscript

script start_viewer_screen_fx 

	ScreenFX_ClearFXInstances \{viewport = 0}
	good_saved_screenfx_settings
	if (<is_good> = 0)

		return
	endif

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

	if LevelIs \{viewer}
		Wait \{1
			Second}
		ScreenFX_GetActiveScreenFXInstances \{viewport = 0}

		Change screenfx_instances_default_state = (<curscreenfx>)
	endif
endscript

script good_saved_screenfx_settings 

	if NOT IsArray ($screenfx_instances_default_state)

		return \{is_good = 0}
	else
		if checksumequals a = (($screenfx_instances_default_state) [0].Name) b = NULL

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

script ApplyLightSpecularIntensityChange 
	if IsCreated <LightChecksum>
		<LightChecksum> :Light_SetParams <...>
	endif
endscript

script applylightfarattenchange 
	setlightattenuation Name = <LightChecksum> AttenStart = <AttenStart> AttenEnd = <AttenEnd>
endscript

script UpdateLightTransform 
	if IsCreated <LightChecksum>
		SetLightFlag Name = <LightChecksum> flag = DYNAMIC
		if GotParam \{betaplugin}
			setlightpos Name = <LightChecksum> Pos = <Pos>
			if GotParam \{bv_pos}
				setlightboundvol Name = <LightChecksum> bv_pos = <bv_pos> bv_size = <bv_size> bv_rot = <bv_rot> bv_trans = <bv_trans>
			endif
		else
			MoveLight Name = <LightChecksum> Pos = <Pos>
		endif
		ClearLightFlag Name = <LightChecksum> flag = DYNAMIC
		CompactIntervals
	endif
endscript

script ApplyGroupIntensityChange 
	SetLightGroupIntensity Name = <GroupChecksum> i = <Intensity>
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

script applyhousingparams 
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
				volumecoloralpha = <alpha>
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
				projectorcoloralpha = <alpha>
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

script sethousingstaticparams 
	if IsCreated <HousingChecksum>
		<HousingChecksum> :lightvolume_setstaticparams <...>
	endif
endscript
