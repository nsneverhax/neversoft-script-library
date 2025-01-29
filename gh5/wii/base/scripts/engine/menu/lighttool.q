
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
	printf \{qs(0x6edb9260)}
	ScreenFX_ClearFXInstances \{viewport = 0}
	good_saved_screenfx_settings
	if (<is_good> = 0)
		printf \{qs(0xe62089fc)}
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
	printf \{qs(0x00c3b630)}
	if LevelIs \{viewer}
		Wait \{1
			Second}
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
		if checksumequals a = (($screenfx_instances_default_state) [0].Name) b = NULL
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

script 0x73aac343 \{Name = None}
	GetPakManCurrent \{map = zones}
	ExtendCrc <pak> '_NodeArray' out = array_name
	0x6525fd7a = (0.0, 0.0, 0.0)
	GetArraySize $<array_name>
	array_count = 0
	begin
	Obj = (($<array_name>) [<array_count>])
	0xe3741a71 = (<Obj>.Name)
	if checksumequals a = (<0xe3741a71>) b = (<Name>)
		0x6525fd7a = (<Obj>.Pos)
		0xd1bcfb57 = (<Obj>.LightGroup)
		if StructureContains structure = (<Obj>) orientation
			0x746d3c5d = (<Obj>.orientation)
		else
			ScriptAssert \{qs(0x4aa701ba)}
		endif
		break
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
	CreateCompositeObject {
		components = [
			{
				component = SetDisplayMatrix
			}
			{
				component = Model
				LightGroup = <0xd1bcfb57>
			}
			{
				component = motion
			}
		]
		params = {
			Name = (<Name>)
			Class = LevelObject
			offset = ((0.0, 0.0, 0.0) - <0x6525fd7a>)
			rotationoffset = ((0.0, 0.0, 0.0) - <0x746d3c5d>)
		}
	}
	<Name> :Obj_SetPosition position = (<0x6525fd7a>)
	0xcb8b5900 Name = (<Name>)
endscript

script UpdateHousingTransform 
	if IsCreated <HousingChecksum>
		if NOT CompositeObjectExists Name = <HousingChecksum>
			0x73aac343 Name = <HousingChecksum>
		endif
		if <HousingChecksum> :Obj_HasComponent PositionMorph
			<HousingChecksum> :PM_SetParams <...>
		elseif <HousingChecksum> :Obj_HasComponent motion
			<HousingChecksum> :Obj_MoveToPos <Pos>
			<HousingChecksum> :Obj_Rotate Quat = <Quat>
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
