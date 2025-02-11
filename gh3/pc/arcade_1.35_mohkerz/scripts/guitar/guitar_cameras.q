CameraCuts_Good_Array = Default_Cameras_Good
CameraCuts_Normal_Array = Default_Cameras_Normal
CameraCuts_Poor_Array = Default_Cameras_Poor
CameraCuts_Performance = good
CameraCuts_LastArray = CameraCuts_Good_Array
CameraCuts_LastPerformance = good
CameraCuts_Enabled = FALSE
CameraCuts_LastIndex = 0
CameraCuts_LastType = None
CameraCuts_LastDownbeatIndex = 0
CameraCuts_ChangeTime = 0
CameraCuts_ChangeNow = FALSE
CameraCuts_ForceTime = 0
CameraCuts_NextTime = 0
CameraCuts_ArrayPrefix = 'Cameras'
CameraCuts_ForceType = None
CameraCuts_NextName = None
CameraCuts_ChangeCamEnable = true
CameraCuts_AllowNoteScripts = true
CameraCuts_LastCameraStartTime = 0.0
CameraCuts_ForceChangeTime = 0.0
CameraCuts_ShadowCasters = None
CameraCuts_NextNoteCameraTime = -1
CameraCuts_NoteMapping = [
	{
		MidiNote = 77
		Scr = CameraCuts_EnableChangeCam
		params = {
			enable = true
		}
	}
	{
		MidiNote = 78
		Scr = CameraCuts_EnableChangeCam
		params = {
			enable = FALSE
		}
	}
	{
		MidiNote = 79
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras'
			changenow
		}
	}
	{
		MidiNote = 80
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_intro'
			changenow
		}
	}
	{
		MidiNote = 81
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_solo'
			selectguitartype
			changenow
		}
	}
	{
		MidiNote = 82
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_orbit'
			changenow
			Name = Orbit_Stage
		}
	}
	{
		MidiNote = 83
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_zoom'
			changenow
		}
	}
	{
		MidiNote = 84
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras'
			changenow
			Type = CloseUp
		}
	}
	{
		MidiNote = 85
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras'
			changenow
			Type = Mid
		}
	}
	{
		MidiNote = 86
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras'
			changenow
			Type = CloseUp
		}
	}
	{
		MidiNote = 87
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras'
			changenow
			Type = Stage
		}
	}
	{
		MidiNote = 88
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_singer'
			changenow
		}
	}
	{
		MidiNote = 89
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_drummer'
			changenow
		}
	}
	{
		MidiNote = 90
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_solo'
			selectguitartype
			changenow
		}
	}
	{
		MidiNote = 91
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_orbit'
			changenow
			Name = Orbit_Stage
		}
	}
	{
		MidiNote = 92
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_orbit'
			changenow
			Name = Orbit_Drummer
		}
	}
	{
		MidiNote = 93
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_orbit'
			changenow
			Name = Orbit_CloseUp
		}
	}
	{
		MidiNote = 94
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_orbit'
			changenow
			Name = Orbit_Mid
		}
	}
	{
		MidiNote = 95
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_guitar_closeup'
			changenow
			Name = Guitar_CloseUp
		}
	}
	{
		MidiNote = 96
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_starpower'
			changenow
		}
	}
	{
		MidiNote = 97
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_bassist'
			changenow
		}
	}
	{
		MidiNote = 98
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_walk'
			changenow
		}
	}
	{
		MidiNote = 99
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_vert_guitarist'
			changenow
		}
	}
	{
		MidiNote = 100
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_vert_drummer'
			changenow
		}
	}
	{
		MidiNote = 101
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_vert_stagefront'
			changenow
		}
	}
	{
		MidiNote = 102
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_vert_stagerear'
			changenow
		}
	}
	{
		MidiNote = 103
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_orbit'
			changenow
			Name = Orbit_Singer
		}
	}
	{
		MidiNote = 104
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_singer_closeup'
			changenow
		}
	}
	{
		MidiNote = 105
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_special'
			changenow
		}
	}
	{
		MidiNote = 106
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_special'
			changenow
			Name = Special01
		}
	}
	{
		MidiNote = 107
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_special'
			changenow
			Name = Special02
		}
	}
	{
		MidiNote = 108
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_special'
			changenow
			Name = Special03
		}
	}
	{
		MidiNote = 109
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_special'
			changenow
			Name = Special04
		}
	}
	{
		MidiNote = 110
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras'
			changenow
			Type = Stage
		}
	}
	{
		MidiNote = 111
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_zoom_slow'
			changenow
		}
	}
	{
		MidiNote = 112
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_zoom_fast'
			changenow
		}
	}
	{
		MidiNote = 113
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_zoom_out'
			changenow
		}
	}
	{
		MidiNote = 114
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_pan'
			changenow
		}
	}
	{
		MidiNote = 115
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_boss_closeup'
			changenow
		}
	}
	{
		MidiNote = 116
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_player_closeup'
			changenow
		}
	}
	{
		MidiNote = 117
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_stagedive'
			changenow
		}
	}
]

script cameracuts_iterator 
	printf "Cameras Iterator started with time %d" d = <time_offset>
	Change \{CameraCuts_NextNoteCameraTime = -1}
	get_song_prefix song = <song_name>
	formatText checksumName = event_array '%s_cameras_notes' s = <song_prefix> AddToStringLookup
	if NOT GlobalExists Name = <event_array> Type = array
		return
	endif
	array_entry = 0
	fretbar_count = 0
	GetArraySize $<event_array>
	GetSongTimeMs time_offset = <time_offset>
	if NOT (<array_Size> = 0)
		begin
		if ((<time> - <skipleadin>) < $<event_array> [<array_entry>] [0])
			break
		endif
		<array_entry> = (<array_entry> + 1)
		repeat <array_Size>
		array_Size = (<array_Size> - <array_entry>)
		if NOT (<array_Size> = 0)
			begin
			Change CameraCuts_NextNoteCameraTime = ($<event_array> [<array_entry>] [0] - <time_offset>)
			TimeMarkerReached_SetParams time_offset = <time_offset> array = <event_array> array_entry = <array_entry> ArrayOfArrays
			begin
			if TimeMarkerReached
				GetSongTimeMs time_offset = <time_offset>
				break
			endif
			Wait \{1
				gameframe}
			repeat
			TimeMarkerReached_ClearParams
			note = ($<event_array> [<array_entry>] [1])
			if ($CameraCuts_AllowNoteScripts = true)
				if GetNoteMapping section = cameras note = <note>
					SpawnScriptNow (<note_data>.Scr) params = {(<note_data>.params) length = ($<event_array> [<array_entry>] [2])}
				endif
			endif
			<array_entry> = (<array_entry> + 1)
			repeat <array_Size>
		endif
	endif
	Change \{CameraCuts_NextNoteCameraTime = -1}
endscript

script CameraCuts_GetNextNoteCameraTime 
	return camera_time = ($CameraCuts_NextNoteCameraTime)
endscript

script CameraCuts_SetArray \{Type = good
		array = Default_Cameras_Good}
	if (<Type> = good)
		Change CameraCuts_Good_Array = <array>
	endif
	if (<Type> = medium)
		Change CameraCuts_Normal_Array = <array>
	endif
	if (<Type> = poor)
		Change CameraCuts_Poor_Array = <array>
	endif
endscript

script CameraCuts_SetParams \{performance = medium}
	Change CameraCuts_Performance = <performance>
endscript

script CameraCuts_SetArrayPrefix \{prefix = 'cameras'
		Type = None
		Name = None
		length = 0}
	if GotParam \{selectguitartype}
		if ($player1_status.instrument_id = Instrument_Guitar_Demonik)
			Type = demonik
		else
			Type = Normal
		endif
	endif
	Change CameraCuts_ArrayPrefix = <prefix>
	Change CameraCuts_ForceType = <Type>
	Change CameraCuts_NextName = <Name>
	set_defaultcameracuts
	if GotParam \{changetime}
		Change CameraCuts_ForceChangeTime = <changetime>
	endif
	if GotParam \{changenow}
		if (<length> > 200)
			Change CameraCuts_NextTime = <length>
		endif
		CameraCuts_EnableChangeCam \{enable = true}
	endif
endscript

script set_defaultcameracut_perf \{perf = 'good'
		perf_checksum = good}
	GetPakManCurrentName \{map = zones}
	if ($current_num_players = 2)
		formatText checksumName = Cameras_Array '%s_%p_%c_2p' p = $CameraCuts_ArrayPrefix c = <perf> s = <pakname>
		if GlobalExists Name = <Cameras_Array> Type = array
			CameraCuts_SetArray Type = <perf_checksum> array = <Cameras_Array>
			return
		endif
		formatText checksumName = Cameras_Array '%s_%p_2p' p = $CameraCuts_ArrayPrefix s = <pakname>
		if GlobalExists Name = <Cameras_Array> Type = array
			CameraCuts_SetArray Type = <perf_checksum> array = <Cameras_Array>
			return
		endif
	endif
	formatText checksumName = Cameras_Array '%s_%p_%c' p = $CameraCuts_ArrayPrefix c = <perf> s = <pakname>
	if GlobalExists Name = <Cameras_Array> Type = array
		CameraCuts_SetArray Type = <perf_checksum> array = <Cameras_Array>
		return
	endif
	formatText checksumName = Cameras_Array '%s_%p' p = $CameraCuts_ArrayPrefix s = <pakname>
	if GlobalExists Name = <Cameras_Array> Type = array
		CameraCuts_SetArray Type = <perf_checksum> array = <Cameras_Array>
		return
	endif
	formatText checksumName = Cameras_Array '%s_%p_%c' p = $CameraCuts_ArrayPrefix c = <perf> s = 'default'
	if GlobalExists Name = <Cameras_Array> Type = array
		CameraCuts_SetArray Type = <perf_checksum> array = <Cameras_Array>
		return
	endif
	formatText \{checksumName = Cameras_Array
		'%s_%p'
		p = $CameraCuts_ArrayPrefix
		s = 'default'}
	if GlobalExists Name = <Cameras_Array> Type = array
		CameraCuts_SetArray Type = <perf_checksum> array = <Cameras_Array>
		return
	endif
	printstruct <...> prefix = ($CameraCuts_ArrayPrefix)
	ScriptAssert \{"CameraCut Array not found"}
endscript

script set_defaultcameracuts 
	set_defaultcameracut_perf \{perf = 'good'
		perf_checksum = good}
	set_defaultcameracut_perf \{perf = 'normal'
		perf_checksum = medium}
	set_defaultcameracut_perf \{perf = 'poor'
		perf_checksum = poor}
endscript

script create_cameracuts 
	Change \{CameraCuts_ArrayPrefix = 'cameras'}
	set_defaultcameracuts
	SetNoteMappings \{section = cameras
		mapping = $CameraCuts_NoteMapping}
	kill_dummy_bg_camera
	Change \{CameraCuts_LastType = None}
	Change \{CameraCuts_LastDownbeatIndex = 0}
	Change \{CameraCuts_ForceChangeTime = 0.0}
	Change \{CameraCuts_ForceType = None}
	Change \{CameraCuts_NextName = None}
	if ($game_mode = training)
		Change \{CameraCuts_ChangeCamEnable = FALSE}
		Change \{CameraCuts_AllowNoteScripts = FALSE}
	else
		Change \{CameraCuts_ChangeCamEnable = true}
		Change \{CameraCuts_AllowNoteScripts = true}
	endif
	Change \{CameraCuts_Enabled = true}
	CameraCuts_StartCallback
endscript

script CameraCuts_GetNextDownbeat 
	get_song_prefix song = ($current_song)
	formatText checksumName = event_array '%s_lightshow_notes' s = <song_prefix> AddToStringLookup
	if NOT GlobalExists Name = <event_array> Type = array
		return endtime = <endtime>
	endif
	GetArraySize $<event_array>
	array_count = ($CameraCuts_LastDownbeatIndex)
	array_Size = (<array_Size> - <array_count>)
	if (<array_Size> > 0)
		begin
		if ($<event_array> [<array_count>] [1] = 58)
			if ($<event_array> [<array_count>] [0] > <endtime>)
				Change CameraCuts_LastDownbeatIndex = <array_count>
				return endtime = ($<event_array> [<array_count>] [0])
			endif
		endif
		array_count = (<array_count> + 1)
		repeat <array_Size>
	endif
	return endtime = <endtime>
endscript

script CameraCuts_StartCallback 
	Change \{CameraCuts_ChangeNow = FALSE}
	if ($CameraCuts_Enabled = FALSE)
		return
	endif
	if ($CameraCuts_Performance = poor)
		Camera_Array = CameraCuts_Poor_Array
	else
		if ($CameraCuts_Performance = good)
			Camera_Array = CameraCuts_Good_Array
		else
			Camera_Array = CameraCuts_Normal_Array
		endif
	endif
	if CompositeObjectExists \{Name = GUITARIST}
		GUITARIST :get_target_node
	endif
	if NOT ($CameraCuts_NextName = None)
		CameraCut_GetArraySize Camera_Array = <Camera_Array> Name = ($CameraCuts_NextName) target_node = <target_node>
	elseif NOT ($CameraCuts_ForceType = None)
		CameraCut_GetArraySize Camera_Array = <Camera_Array> includetype = $CameraCuts_ForceType target_node = <target_node>
	else
		CameraCut_GetArraySize Camera_Array = <Camera_Array> excludetype = $CameraCuts_LastType target_node = <target_node>
	endif
	if (<array_Size> = 0)
		newindex = 0
	else
		GetRandomValue Name = newindex integer a = 0 b = (<array_Size> - 1)
		CameraCut_GetCameraIndex Camera_Array = <Camera_Array> newindex = <newindex>
	endif
	debug_flags = None
	if NOT ($debug_camera_array = None)
		found = 0
		formatText \{checksumName = New_Camera_Array
			'%s_%p'
			s = $debug_camera_array_pakname
			p = $debug_camera_array}
		if GlobalExists Name = <New_Camera_Array>
			GetArraySize $<New_Camera_Array>
			index = ($debug_camera_array_count)
			if (<index> < <array_Size>)
				Camera_Array = <New_Camera_Array>
				newindex = ($debug_camera_array_count)
				found = 1
				debug_flags = update_when_paused
			endif
		endif
		if (found = 0)
			Change \{debug_camera_array = None}
			Change \{debug_camera_array_pakname = None}
			Change \{debug_camera_array_count = None}
		endif
	endif
	Change CameraCuts_LastArray = <Camera_Array>
	Change \{CameraCuts_LastPerformance = $CameraCuts_Performance}
	Change CameraCuts_LastIndex = <newindex>
	if StructureContains structure = (<Camera_Array> [<newindex>]) Type
		Change CameraCuts_LastType = ($<Camera_Array> [<newindex>].Type)
	elseif StructureContains structure = (<Camera_Array> [<newindex>]) params
		if StructureContains structure = (<Camera_Array> [<newindex>].params) Type
			Change CameraCuts_LastType = ($<Camera_Array> [<newindex>].params.Type)
		else
			Change \{CameraCuts_LastType = None}
		endif
	else
		Change \{CameraCuts_LastType = None}
	endif
	if ($debug_showcameraname = On)
		printf \{"debug_showcameraname is on"}
		CameraCuts_UpdateDebugCameraName
	endif
	if ($output_gpu_log = 1)
		CameraCuts_OutputGPULog
	endif
	if StructureContains structure = (<Camera_Array> [<newindex>]) params
		camStruct = ((<Camera_Array> [<newindex>]).params)
		if NOT StructureContains structure = <camStruct> DOF
			camStruct = (<Camera_Array> [<newindex>])
		endif
	endif
	if StructureContains structure = <camStruct> DOF
		if StructureContains structure = (<camStruct>.DOF) screen_FX
			dofType = (<camStruct>.DOF)
			dofParam = (<dofType>.screen_FX [0])
		endif
	else
		dofParam = ($DOF_Off_TOD_Manager.screen_FX [0])
	endif
	if NOT screenFX_FXInstanceExists \{viewport = bg_viewport
			Name = venue_DOF}
		ScreenFX_AddFXInstance {
			viewport = bg_viewport
			Name = venue_DOF
			<dofParam>
		}
	else
		ScreenFX_UpdateFXInstanceParams {
			viewport = bg_viewport
			Name = venue_DOF
			<dofParam>
		}
	endif
	if StructureContains structure = (<Camera_Array> [<newindex>]) CrowdOff
		enable_crowd_models_cfunc \{Active = FALSE}
	else
		enable_crowd_models_cfunc \{Active = true}
	endif
	if StructureContains structure = (<Camera_Array> [<newindex>]) ShadowCasters
		Change CameraCuts_ShadowCasters = (<Camera_Array> [<newindex>].ShadowCasters)
	else
		Change \{CameraCuts_ShadowCasters = None}
	endif
	Change \{structurename = guitarist_info
		waiting_for_cameracut = FALSE}
	Change \{structurename = bassist_info
		waiting_for_cameracut = FALSE}
	GetSongTimeMs
	Change CameraCuts_LastCameraStartTime = <time>
	CamParams = (<Camera_Array> [<newindex>])
	CameraCut_SwapLookAts
	PlayIGCCam {
		time = <camera_time>
		viewport = bg_viewport
		controlscript = CameraCuts_StaticCamControl
		params = {CamParams = <CamParams>}
		<CamParams>
		exitscript = CameraCuts_StartCallback
		play_hold = 0
		Name = CameraCutCam
		<debug_flags>
	}
endscript

script CameraCuts_UpdateDebugCameraName 
	if ScreenElementExists \{id = debug_camera_name_text}
		GetArraySize ($CameraCuts_LastArray)
		cameraname = None
		if ($CameraCuts_LastIndex < <array_Size>)
			if StructureContains structure = (($CameraCuts_LastArray) [$CameraCuts_LastIndex]) params
				if StructureContains structure = (($CameraCuts_LastArray) [$CameraCuts_LastIndex].params) Name
					cameraname = ($CameraCuts_LastArray [$CameraCuts_LastIndex].params.Name)
				endif
			endif
			if StructureContains structure = (($CameraCuts_LastArray) [$CameraCuts_LastIndex]) Name
				cameraname = ($CameraCuts_LastArray [$CameraCuts_LastIndex].Name)
			endif
		endif
		<Crowd> = 1
		if StructureContains structure = ($CameraCuts_LastArray [$CameraCuts_LastIndex]) CrowdOff
			<Crowd> = 0
		endif
		formatText TextName = cameraname "%s type=%t crowd=%c" s = <cameraname> t = $CameraCuts_LastType c = <Crowd> DontAssertForChecksums
		debug_camera_name_text :SetProps text = <cameraname>
		printf <cameraname>
	endif
endscript

script CameraCuts_OutputGPULog 
	GetArraySize ($CameraCuts_LastArray)
	cameraname = None
	if ($CameraCuts_LastIndex < <array_Size>)
		if StructureContains structure = (($CameraCuts_LastArray) [$CameraCuts_LastIndex]) params
			if StructureContains structure = (($CameraCuts_LastArray) [$CameraCuts_LastIndex].params) Name
				cameraname = ($CameraCuts_LastArray [$CameraCuts_LastIndex].params.Name)
			endif
		endif
		if StructureContains structure = (($CameraCuts_LastArray) [$CameraCuts_LastIndex]) Name
			cameraname = ($CameraCuts_LastArray [$CameraCuts_LastIndex].Name)
		endif
	endif
	<Crowd> = 1
	if StructureContains structure = ($CameraCuts_LastArray [$CameraCuts_LastIndex]) CrowdOff
		<Crowd> = 0
	endif
	formatText TextName = text "Cam: %s, type: %t, crowd: %c ; ; ; 16.667" s = <cameraname> t = $CameraCuts_LastType c = <Crowd> DontAssertForChecksums
	TextOutput text = <text>
endscript

script destroy_cameracuts 
	Change \{CameraCuts_Enabled = FALSE}
	KillSpawnedScript \{Name = CameraCuts_StartCallback}
	KillCamAnim \{Name = CameraCutCam}
	kill_dummy_bg_camera
	ClearNoteMappings \{section = cameras}
	KillSpawnedScript \{Name = cameracuts_iterator}
endscript
profiling_cameracuts = FALSE

script profile_camera_cuts \{FileName = "ProfileCameras"}
	if ($profiling_cameracuts = true)
		return
	endif
	Change \{profiling_cameracuts = true}
	hide_analog_options
	setslomo \{0.001}
	setslomo_song \{slomo = 0.001}
	dumpprofilestart
	GetPakManCurrentName \{map = zones}
	camera_count = 0
	begin
	switch <camera_count>
		case 0
		suffix = "cameras_good"
		case 1
		suffix = "cameras_normal"
		case 2
		suffix = "cameras_poor"
		case 3
		suffix = "cameras_good_2p"
		case 4
		suffix = "cameras_normal_2p"
		case 5
		suffix = "cameras_poor_2p"
	endswitch
	formatText checksumName = Camera_Array '%s_%p' s = <pakname> p = <suffix>
	if GlobalExists Name = <Camera_Array>
		GetArraySize $<Camera_Array>
		array_count = 0
		begin
		profile_cameracut Camera_Array_pakname = <pakname> Camera_Array = <suffix> array_count = <array_count>
		<array_count> = (<array_count> + 1)
		repeat <array_Size>
	endif
	camera_count = (<camera_count> + 1)
	repeat 6
	Change \{debug_camera_array = None}
	destroy_cameracuts
	Wait \{3
		gameframes}
	create_cameracuts
	dumpprofileend output_text output_file FileName = <FileName>
	setslomo \{$current_speedfactor}
	setslomo_song \{slomo = $current_speedfactor}
	Change \{profiling_cameracuts = FALSE}
endscript

script profile_cameracut 
	Change debug_camera_array = <Camera_Array>
	Change debug_camera_array_pakname = <Camera_Array_pakname>
	Change debug_camera_array_count = <array_count>
	cpu = $current_cpu
	ToggleMetrics \{mode = 2}
	Change \{current_cpu = 6}
	destroy_cameracuts
	Wait \{2
		gameframes}
	create_cameracuts
	Wait \{3
		gameframes}
	profile_camera_gpu
	ToggleMetrics \{mode = 0}
	Change current_cpu = <cpu>
endscript

script profile_camera_gpu 
	formatText \{checksumName = New_Camera_Array
		'%s_%p'
		s = $debug_camera_array_pakname
		p = $debug_camera_array}
	Camera_Array = $<New_Camera_Array>
	if StructureContains structure = (<Camera_Array> [$debug_camera_array_count]) Name
		formatText TextName = title "Camera %n Profile Dump" n = ((<Camera_Array> [$debug_camera_array_count]).Name) DontAssertForChecksums
	else
		formatText TextName = title "Camera %n Profile Dump" n = ((<Camera_Array> [$debug_camera_array_count]).params.Name) DontAssertForChecksums
	endif
	dumpprofile cpu = 6 title = <title> current_time_only
endscript

script CameraCuts_EnableChangeCam 
	printf \{"Enabling camera change"}
	Change CameraCuts_ChangeCamEnable = <enable>
	Change \{CameraCuts_ChangeNow = true}
endscript

script CameraCuts_CalcTime 
	if ($CameraCuts_ChangeNow = true)
		camera_time = 0
		GetSongTimeMs
		camera_songtime = (<time> + <camera_time> * 1000)
		return camera_time = <camera_time> camera_songtime = <camera_songtime>
	endif
	if ($CameraCuts_ForceTime = 0)
		if ($CameraCuts_NextTime = 0)
			camera_time = RandomRange (3.0, 8.0)
			GetSongTimeMs
			endtime = (<time> + <camera_time> * 1000)
			CameraCuts_GetNextDownbeat endtime = <endtime>
			camera_time = ((<endtime> - <time>) / 1000.0)
		else
			camera_time = ($CameraCuts_NextTime / 1000.0)
			Change \{CameraCuts_NextTime = 0}
		endif
	else
		camera_time = ($CameraCuts_ForceTime)
	endif
	GetSongTimeMs
	camera_songtime = (<time> + <camera_time> * 1000)
	return camera_time = <camera_time> camera_songtime = <camera_songtime>
endscript

script CameraCuts_WaitScript \{camera_time = 0
		camera_songtime = 0}
	GetSongTimeMs
	Change CameraCuts_ChangeTime = <camera_songtime>
	begin
	GetSongTimeMs
	if ($gWinportCameraLocked = 0)
		if (<time> >= $CameraCuts_ChangeTime ||
				$CameraCuts_ChangeNow = true)
			if ($CameraCuts_ChangeCamEnable = true)
				break
			endif
		endif
		if NOT ($CameraCuts_ForceChangeTime = 0.0)
			if ($CameraCuts_ForceChangeTime < (<time> - $CameraCuts_LastCameraStartTime))
				Change \{CameraCuts_ForceChangeTime = 0.0}
				break
			endif
		endif
		if GotParam \{noWait}
			return \{FALSE}
		endif
	else
		printf \{"CameraCuts_WaitScript: unable to change, camera locked"}
	endif
	Wait \{1
		gameframe}
	repeat
	return \{true}
endscript

script CameraCuts_StaticCamControl 
	printf \{"CameraCuts_StaticCamControl"}
	CameraCuts_CalcTime
	CCam_DoMorph {
		<CamParams>
	}
	CameraCuts_WaitScript camera_songtime = <camera_songtime>
endscript

script CameraCuts_HandCam \{Name = None}
	printf \{"CameraCuts_HandCam"}
	CameraCuts_CalcTime
	CCam_DoMorph <...>
	zooming = FALSE
	if GotParam \{Type}
		if (<Type> = LongShot)
			GetRandomValue \{Name = random_value
				integer
				a = 0
				b = 100}
			if (<random_value> < 25)
				CCam_DoMorph <...> FOV = 62 time = <camera_time>
				zooming = true
			endif
			if (<random_value> > 95)
				CCam_DoMorph <...> FOV = 78 time = <camera_time>
				zooming = true
			endif
		endif
		if (<Type> = Mid)
			GetRandomValue \{Name = random_value
				integer
				a = 0
				b = 100}
			if (<random_value> < 5)
				CCam_DoMorph <...> FOV = 64 time = <camera_time>
				zooming = true
			endif
			if (<random_value> > 85)
				CCam_DoMorph <...> FOV = 82 time = <camera_time>
				zooming = true
			endif
		endif
	endif
	if (<zooming> = true)
		amplitudePosition = 0.01
		amplitudeRotation = -0.01
	else
		amplitudePosition = 0.05
		amplitudeRotation = -0.08
	endif
	CameraCuts_SetHandCamParams <...>
	CameraCuts_WaitScript camera_songtime = <camera_songtime>
endscript

script CameraCuts_TwoCam 
	printf \{"CameraCuts_TwoCam"}
	if GotParam \{UseHandCam}
		CameraCuts_SetHandCamParams \{amplitudePosition = 0.05
			amplitudeRotation = -0.08}
	endif
	CameraCuts_CalcTime
	CCam_DoMorph {
		<Cam1>
	}
	CCam_WaitMorph
	CCam_DoMorph {
		<Cam2>
		time = <camera_time>
	}
	CameraCuts_WaitScript camera_songtime = <camera_songtime>
endscript

script CameraCuts_Encore 
	printf \{"CameraCuts_Encore"}
	CameraCuts_CalcTime
	CCam_DoMorph {
		<Cam1>
	}
	Wait \{3
		Seconds}
	CCam_DoMorph {
		<Cam2>
	}
	Wait \{2.5
		Seconds}
	CCam_DoMorph {
		<Cam3>
	}
	Wait \{3
		Seconds}
	CCam_DoMorph {
		<Cam4>
	}
	Wait \{2
		Seconds}
	CCam_DoMorph {
		<Cam5>
	}
	CameraCuts_WaitScript camera_songtime = <camera_songtime>
endscript

script CameraCuts_Orbit 
	printf \{"CameraCuts_Orbit"}
	CameraCuts_CalcTime
	CCam_DoMorph {
		<...>
	}
	orbitangle = (3.1409998 * <orbitangle> / 180.0)
	if (<camera_time> > 0)
		CCam_Orbit axis = (0.0, 1.0, 0.0) speed = (<orbitangle> / <camera_time>)
	endif
	CameraCuts_SetHandCamDriftOnly
	CameraCuts_WaitScript camera_songtime = <camera_songtime>
endscript

script CameraCuts_OrbitAndMorphTwoCam 
	printf \{"CameraCuts_OrbitAndMorphTwoCam"}
	CameraCuts_CalcTime
	if (<camera_time> > 0)
		<orbitangle> = (3.1409998 * <orbitangle> / 180.0)
		<orbitparams> = {axis = (0.0, 1.0, 0.0) speed = (<orbitangle> / <camera_time>)}
	endif
	CCam_DoMorph {
		<Cam1>
	}
	if (<camera_time> > 0)
		if GotParam \{DisableOrbit1}
			CCam_Orbit \{OFF}
		else
			CCam_Orbit <orbitparams>
		endif
	endif
	CameraCuts_SetHandCamDriftOnly
	CCam_DoMorph {
		<Cam2>
		time = <camera_time>
	}
	if (<camera_time> > 0)
		if GotParam \{DisableOrbit2}
			CCam_Orbit \{OFF}
		else
			CCam_Orbit <orbitparams>
		endif
	endif
	CameraCuts_WaitScript camera_songtime = <camera_songtime>
endscript

script CameraCuts_SplineMorph 
	printf \{"CameraCuts_SplineMorph"}
	CameraCuts_CalcTime
	CCam_SplineMorph {
		<...>
		total_time = <camera_time>
	}
	CameraCuts_WaitScript camera_songtime = <camera_songtime>
endscript

script CameraCuts_SpecialStepMove 
	printf \{"CameraCuts_SpecialStepMove"}
	CCam_SetSmoothing \{Type = all
		On = 1
		slow_lerp_factor = 0.7
		fast_lerp_factor = 0.7
		lerp_dropoff = 2.0}
	CameraCuts_CalcTime
	CCam_DoMorph {
		<Cam1>
	}
	CameraCuts_SetHandCamParams \{amplitudePosition = 0.0
		amplitudeRotation = -0.8}
	origpos = (<Cam1>.Pos)
	diry = <StepDir>
	count = 0.0
	timestep = 0.05
	step = (<timestep> / <StepTime>)
	num_jumps = <StepNum>
	dirx = ((<Cam2>.Pos) - (<Cam1>.Pos))
	printf "timestep %i" i = <timestep>
	jump_multiplier = (<num_jumps> * 360.0)
	count = (<count> + <step>)
	begin
	if (<count> >= 1.0)
		break
	endif
	sin (<count> * <jump_multiplier>)
	Pos = (<origpos> + <dirx> * <count> + <diry> * <sin>)
	CCam_DoMorph {
		<...>
		time = <timestep>
		motion = linear
	}
	CCam_WaitMorph
	if CameraCuts_WaitScript camera_songtime = <camera_songtime> noWait
		return
	endif
	count = (<count> + <step>)
	repeat
	CCam_DoMorph {
		<Cam2>
		time = <FinalRotTime>
		motion = smooth
	}
	CameraCuts_WaitScript camera_songtime = <camera_songtime>
endscript

script CameraCuts_ApplyDOF \{DOF = $DOF_Medium02_TOD_Manager
		time = 0.0}
	dofType = <DOF>
	dofParam = (<dofType>.screen_FX [0])
	if NOT screenFX_FXInstanceExists \{viewport = bg_viewport
			Name = venue_DOF}
		ScreenFX_AddFXInstance {
			viewport = bg_viewport
			Name = venue_DOF
			<dofParam>
			time = <time>
		}
	else
		ScreenFX_UpdateFXInstanceParams {
			viewport = bg_viewport
			Name = venue_DOF
			<dofParam>
			time = <time>
		}
	endif
endscript

script CameraCuts_SetHandCamDriftOnly 
	CCam_EnableHandcam \{ShakeEnabled = FALSE
		DriftEnabled = true}
	driftSlerpMap = [
		(0.1, 0.3)
		(0.2, 0.3)
	]
	if GotParam \{DriftZoneAngles}
		SetArrayElement ArrayName = driftSlerpMap index = 1 NewValue = <DriftZoneAngles>
	endif
	CCam_SetHandcamParams {
		$cinematic_camera_default_handcam_params
		driftSlerpMap = <driftSlerpMap>
	}
endscript

script CameraCuts_SetHandCamParams \{amplitudePosition = 0.01
		amplitudeRotation = -0.01}
	CCam_EnableHandcam \{ShakeEnabled = true
		DriftEnabled = true}
	CCam_SetHandcamParams {
		motionX = {
			amplitude = 0.033999998
			center = 0.0
			periodBase = 0.012999999
			periodMultiples = [
				1 , 3 , 4
			]
		}
		motionY = {
			amplitude = 0.04
			center = 0.0
			periodBase = 0.016999999
			periodMultiples = [
				1 , 3 , 4
			]
		}
		amplitudePosition = {
			amplitude = <amplitudePosition>
			center = 0.0
			periodBase = 0.0023
			periodMultiples = [
				1 , 16
			]
		}
		amplitudeRotation = {
			amplitude = <amplitudeRotation>
			center = 0.0
			periodBase = 0.0023
			periodMultiples = [
				1
			]
		}
		zoomStabilityMap = [
			(1.3, 0.7)
			(30.0, 100.0)
		]
		driftSlerpMap = [
			(0.0, 0.8)
			(0.05, 1.0)
		]
		zoomDriftMap = [
			(1.2, 0.6)
			(30.0, 100.0)
		]
		driftAllowedAmplitude = {
			amplitude = 0.4
			center = 1.0
			periodBase = 0.02
			periodMultiples = [
				1
			]
		}
	}
endscript

script CameraCuts_HandCamZoom2 
	printf \{"CameraCuts_HandCamZoom2"}
	CCam_DoMorph <...>
	zooming = FALSE
	if (<zooming> = true)
		amplitudePosition = 0.01
		amplitudeRotation = -0.01
	else
		amplitudePosition = 0.05
		amplitudeRotation = -0.08
	endif
	CameraCuts_SetHandCamParams <...>
	Wait \{2
		Seconds}
	CCam_DoMorph <...> FOV = 50 time = 0.6 motion = smooth
	CCam_WaitMorph
	Wait \{0.1
		Seconds}
	CCam_DoMorph <...> FOV = 53 time = 0.25 motion = smooth
	CCam_WaitMorph
	Wait \{0.03
		Seconds}
	CCam_DoMorph <...> FOV = 51 time = 0.3 motion = smooth
	CCam_WaitMorph
	CCam_DoMorph <...> FOV = 51
	CameraCuts_CalcTime
	CameraCuts_WaitScript camera_songtime = <camera_songtime>
endscript

script CameraCuts_QuickZoom 
	printf \{"CameraCuts_QuickZoom"}
	CCam_DoMorph <...>
	zooming = FALSE
	if (<zooming> = true)
		amplitudePosition = 0.01
		amplitudeRotation = -0.01
	else
		amplitudePosition = 0.05
		amplitudeRotation = -0.08
	endif
	CameraCuts_SetHandCamParams <...>
	CCam_DoMorph {
		<Cam1>
	}
	CCam_WaitMorph
	Wait \{2
		Seconds}
	CCam_DoMorph {
		<Cam1>
	}
	CCam_WaitMorph
	CCam_DoMorph {
		<Cam2>
		time = 0.75
		motion = smooth
	}
	CCam_WaitMorph
	CCam_DoMorph {
		<Cam2>
	}
	CCam_WaitMorph
	CameraCuts_CalcTime
	CameraCuts_WaitScript camera_songtime = <camera_songtime>
endscript

script CameraCuts_Pan 
	printf \{"CameraCuts_Pan"}
	CameraCuts_SetHandCamParams \{amplitudePosition = 0.05
		amplitudeRotation = -0.08}
	CCam_DoMorph {
		<Cam1>
		time = 0
	}
	Wait \{2
		Seconds}
	CCam_DoMorph {
		<Cam2>
		time = 1
		motion = smooth
	}
	CCam_WaitMorph
	CameraCuts_CalcTime
	CameraCuts_WaitScript camera_songtime = <camera_songtime>
endscript

script CameraCuts_ThreePos 
	printf \{"CameraCuts_ThreePos"}
	CameraCuts_CalcTime
	CCam_SplineMorph {
		keyframes =
		[
			{
				<Cam1>
			}
			{
				<Cam2>
			}
			{
				<Cam3>
			}
		]
		total_time = <camera_time>
	}
	CameraCuts_WaitScript camera_songtime = <camera_songtime>
endscript

script CameraCuts_FourPos 
	printf \{"CameraCuts_FourPos"}
	CameraCuts_CalcTime
	CCam_SplineMorph {
		keyframes =
		[
			{
				<Cam1>
			}
			{
				<Cam2>
			}
			{
				<Cam3>
			}
			{
				<Cam4>
			}
		]
		total_time = <camera_time>
	}
	CameraCuts_WaitScript camera_songtime = <camera_songtime>
endscript
Default_Cameras_Good = [
	{
		Name = good_from_stage
		play_hold = 1
		LockTo = GUITARIST
		Pos = (1.5175159, 4.1361775, -4.089658)
		Quat = (0.130047, -0.018706, 0.0024160002)
		FOV = 72.0
	}
	{
		Name = good_center_stage
		play_hold = 1
		LockTo = GUITARIST
		Pos = (2.102435, 1.999219, 7.695495)
		Quat = (-2.6E-05, 0.9999869, -0.0043200003)
		FOV = 72.0
	}
	{
		Name = good_stage_left
		play_hold = 1
		LockTo = GUITARIST
		Pos = (8.62121, 4.4717703, 6.8967915)
		Quat = (0.093209006, -0.903863, 0.254238)
		FOV = 72.0
	}
	{
		Name = good_stage_right
		play_hold = 1
		LockTo = GUITARIST
		Pos = (-7.182758, 2.553803, 8.634896)
		Quat = (0.048714, 0.90134895, -0.105318)
		FOV = 72.0
	}
]
Default_Cameras_Normal = [
	{
		Name = normal_crowd_center
		play_hold = 1
		LockTo = GUITARIST
		Pos = (5.108431, 1.485993, 13.082112)
		Quat = (0.0025400002, -0.9918739, 0.019756)
		FOV = 72.0
	}
	{
		Name = normal_crowd_right
		play_hold = 1
		LockTo = GUITARIST
		Pos = (10.656881, 1.486412, 12.041036)
		Quat = (0.00589, -0.95563596, 0.019026998)
		FOV = 72.0
	}
	{
		Name = normal_crowd_left
		play_hold = 1
		LockTo = GUITARIST
		Pos = (-4.8624063, 1.3204769, 14.310162)
		Quat = (0.001153, 0.98261094, -0.006309)
		FOV = 72.0
	}
]
Default_Cameras_Poor = [
	{
		Name = poor_crowd_center
		play_hold = 1
		LockTo = GUITARIST
		Pos = (-1.573781, 1.4759071, 20.610792)
		Quat = (-0.00064900005, 0.998182, 0.010279999)
		FOV = 72.0
	}
	{
		Name = poor_crowd_right
		play_hold = 1
		LockTo = GUITARIST
		Pos = (10.420851, 1.5101589, 18.768383)
		Quat = (-0.0024040001, -0.97147197, -0.010015999)
		FOV = 72.0
	}
	{
		Name = poor_crowd_left
		play_hold = 1
		LockTo = GUITARIST
		Pos = (-9.160233, 1.604391, 20.10081)
		Quat = (-0.0018660001, 0.984061, 0.010129999)
		FOV = 72.0
	}
]
default_cameras_intro = [
	{
		Name = crowd_center_zoom
		controlscript = CameraCuts_TwoCam
		params = {
			Cam1 = {
				LockTo = World
				Pos = (0.35540104, 1.766598, 9.495748)
				Quat = (0.00019699999, -0.999465, 0.032123)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = World
				Pos = (0.30482104, 3.097976, 5.3770776)
				Quat = (0.0012020001, -0.98061997, 0.195825)
				FOV = 72.0
			}
		}
	}
]
default_cameras_fastintro = [
	{
		Name = crowd_center_zoom
		controlscript = CameraCuts_TwoCam
		params = {
			Cam1 = {
				LockTo = World
				Pos = (0.30482104, 3.097976, 5.3770776)
				Quat = (0.0012020001, -0.98061997, 0.195825)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = World
				Pos = (0.35540104, 1.766598, 9.495748)
				Quat = (0.00019699999, -0.999465, 0.032123)
				FOV = 72.0
			}
		}
	}
]
default_cameras_dolly = [
	{
		Name = Dolly_StageFront
		controlscript = CameraCuts_TwoCam
		params = {
			Cam1 = {
				LockTo = World
				Pos = (-2.467382, 1.2211041, 2.731025)
				Quat = (0.027345998, 0.774946, -0.033513)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = World
				Pos = (5.1025147, 1.024014, 1.060797)
				Quat = (-0.021949, -0.780419, -0.026007999)
				FOV = 72.0
			}
		}
	}
	{
		Name = Dolly_StageRear
		controlscript = CameraCuts_TwoCam
		params = {
			Cam1 = {
				LockTo = World
				Pos = (-2.467382, 1.2211041, 2.731025)
				Quat = (0.027345998, 0.774946, -0.033513)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = World
				Pos = (5.1025147, 1.024014, 1.060797)
				Quat = (-0.021949, -0.780419, -0.026007999)
				FOV = 72.0
			}
		}
	}
]
default_cameras_zoom = [
	{
		controlscript = CameraCuts_TwoCam
		params = {
			Cam1 = {
				LockTo = World
				Pos = (-2.467382, 1.2211041, 2.731025)
				Quat = (0.027345998, 0.774946, -0.033513)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = World
				Pos = (5.1025147, 1.024014, 1.060797)
				Quat = (-0.021949, -0.780419, -0.026007999)
				FOV = 72.0
			}
		}
	}
]
default_cameras_zoom_fast = [
	{
		controlscript = CameraCuts_TwoCam
		params = {
			Cam1 = {
				LockTo = World
				Pos = (-2.467382, 1.2211041, 2.731025)
				Quat = (0.027345998, 0.774946, -0.033513)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = World
				Pos = (5.1025147, 1.024014, 1.060797)
				Quat = (-0.021949, -0.780419, -0.026007999)
				FOV = 72.0
			}
		}
	}
]
default_cameras_zoom_slow = [
	{
		controlscript = CameraCuts_TwoCam
		params = {
			Cam1 = {
				LockTo = World
				Pos = (-2.467382, 1.2211041, 2.731025)
				Quat = (0.027345998, 0.774946, -0.033513)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = World
				Pos = (5.1025147, 1.024014, 1.060797)
				Quat = (-0.021949, -0.780419, -0.026007999)
				FOV = 72.0
			}
		}
	}
]
default_cameras_zoom_out = [
	{
		controlscript = CameraCuts_TwoCam
		params = {
			Cam1 = {
				LockTo = World
				Pos = (-2.467382, 1.2211041, 2.731025)
				Quat = (0.027345998, 0.774946, -0.033513)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = World
				Pos = (5.1025147, 1.024014, 1.060797)
				Quat = (-0.021949, -0.780419, -0.026007999)
				FOV = 72.0
			}
		}
	}
]
default_cameras_pan = [
	{
		controlscript = CameraCuts_Pan
		params = {
			Cam1 = {
				LockTo = World
				Pos = (-2.467382, 1.2211041, 2.731025)
				Quat = (0.027345998, 0.774946, -0.033513)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = World
				Pos = (5.1025147, 1.024014, 1.060797)
				Quat = (-0.021949, -0.780419, -0.026007999)
				FOV = 72.0
			}
		}
	}
]
default_cameras_preencore = [
	{
		controlscript = CameraCuts_TwoCam
		params = {
			Cam1 = {
				LockTo = drummer
				Pos = (-2.4889898, 2.2800958, 9.589442)
				Quat = (0.033784002, 0.965961, -0.164262)
				FOV = 72.0
				LookAt = drummer
				LookAtBone = bone_chest
				ScreenOffset = (-0.225398, -0.579956)
			}
			Cam2 = {
				LockTo = drummer
				Pos = (4.951395, 2.2763019, 9.435161)
				Quat = (0.050596002, -0.9369719, 0.15382701)
				FOV = 72.0
				LookAt = drummer
				LookAtBone = bone_chest
				ScreenOffset = (0.26263002, -0.568209)
			}
		}
	}
]
default_cameras_encore = [
	{
		controlscript = CameraCuts_TwoCam
		params = {
			Cam1 = {
				LockTo = World
				Pos = (-2.8748507, 2.11633, 3.001765)
				Quat = (0.055925, 0.88826996, -0.112448)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = World
				Pos = (6.485794, 2.790986, 6.2345123)
				Quat = (0.081708, -0.7229049, 0.08677899)
				FOV = 72.0
			}
		}
	}
]
default_cameras_preboss = [
	{
		controlscript = CameraCuts_TwoCam
		params = {
			Cam1 = {
				LockTo = drummer
				Pos = (-2.4889898, 2.2800958, 9.589442)
				Quat = (0.033784002, 0.965961, -0.164262)
				FOV = 72.0
				LookAt = drummer
				LookAtBone = bone_chest
				ScreenOffset = (-0.225398, -0.579956)
			}
			Cam2 = {
				LockTo = drummer
				Pos = (4.951395, 2.2763019, 9.435161)
				Quat = (0.050596002, -0.9369719, 0.15382701)
				FOV = 72.0
				LookAt = drummer
				LookAtBone = bone_chest
				ScreenOffset = (0.26263002, -0.568209)
			}
		}
	}
]
default_cameras_boss = [
	{
		controlscript = CameraCuts_TwoCam
		params = {
			Cam1 = {
				LockTo = World
				Pos = (-2.8748507, 2.11633, 3.001765)
				Quat = (0.055925, 0.88826996, -0.112448)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = World
				Pos = (6.485794, 2.790986, 6.2345123)
				Quat = (0.081708, -0.7229049, 0.08677899)
				FOV = 72.0
			}
		}
	}
]
default_cameras_guitar_closeup = [
	{
		controlscript = CameraCuts_HandCam
		params = {
			LockTo = World
			LookAt = GUITARIST
			LookAtBone = bone_guitar_body
			Pos = (-0.073745, 0.7753869, 0.023635)
			Quat = (0.047147997, -0.9942729, -0.005626)
			FOV = 72.0
		}
		DOF = $DOF_CloseUp01_TOD_Manager
	}
]
default_cameras_drummer = [
	{
		controlscript = CameraCuts_HandCam
		params = {
			Name = Drummer_Center
			LockTo = World
			Pos = (-3.3800898, 1.184646, -5.141132)
			Quat = (0.00305, -0.97887796, 0.013742999)
			FOV = 85.0
		}
		DOF = $DOF_CloseUp02_TOD_Manager
	}
]
default_cameras_singer = [
	{
		controlscript = CameraCuts_HandCam
		params = {
			Name = Singer_Left
			LockTo = World
			Pos = (-6.321385, 0.924312, -2.6622968)
			Quat = (-0.026229998, 0.784364, 0.032947995)
			FOV = 72.0
		}
		DOF = $DOF_CloseUp01_TOD_Manager
	}
	{
		controlscript = CameraCuts_HandCam
		params = {
			Name = Singer_Center
			LockTo = World
			Pos = (-4.3443885, 0.950269, -0.84059906)
			Quat = (1.9E-05, 0.99112797, -0.001512)
			FOV = 72.0
		}
		DOF = $DOF_CloseUp01_TOD_Manager
	}
	{
		controlscript = CameraCuts_HandCam
		params = {
			Name = Singer_Right
			LockTo = World
			Pos = (-1.543603, 0.87668294, -1.361017)
			Quat = (-0.008355001, -0.953027, -0.027003)
			FOV = 72.0
		}
		DOF = $DOF_CloseUp01_TOD_Manager
	}
]
default_cameras_singer_closeup = [
	{
		controlscript = CameraCuts_HandCam
		params = {
			Name = Singer_CloseUp
			LockTo = World
			Pos = (-1.543603, 0.87668294, -1.361017)
			Quat = (-0.008355001, -0.953027, -0.027003)
			FOV = 72.0
		}
		DOF = $DOF_CloseUp01_TOD_Manager
	}
]
default_cameras_bassist = [
	{
		controlscript = CameraCuts_HandCam
		params = {
			Name = Bassist_Center
			LockTo = World
			Pos = (-3.3800898, 1.184646, -5.141132)
			Quat = (0.00305, -0.97887796, 0.013742999)
			FOV = 85.0
		}
		DOF = $DOF_CloseUp02_TOD_Manager
	}
]
default_cameras_solo = [
	{
		controlscript = CameraCuts_HandCam
		params = {
			Name = Guitar_Neck_Normal
			Type = Normal
			LockTo = GUITARIST
			LockToBone = bone_guitar_neck
			Pos = (0.742165, 0.095542006, 0.027762)
			Quat = (-0.31134596, -0.632061, 0.42270902)
			FOV = 57.0
		}
		DOF = $DOF_CloseUp03_TOD_Manager
		CrowdOff
	}
	{
		controlscript = CameraCuts_HandCam
		params = {
			Name = Guitar_Body_Normal
			Type = Normal
			LockTo = GUITARIST
			LockToBone = bone_guitar_neck
			Pos = (-0.52196294, 0.206606, 0.228494)
			Quat = (0.066760994, 0.80269796, -0.260841)
			FOV = 76.0
		}
		DOF = $DOF_CloseUp03_TOD_Manager
		CrowdOff
	}
	{
		controlscript = CameraCuts_HandCam
		params = {
			Name = Guitar_Neck_Demonik
			Type = demonik
			LockTo = GUITARIST
			LockToBone = bone_guitar_body
			Pos = (1.305142, 0.289514, 0.028687)
			Quat = (-0.260674, -0.64566904, 0.48475105)
			FOV = 72.0
		}
		DOF = $DOF_CloseUp03_TOD_Manager
		CrowdOff
	}
	{
		controlscript = CameraCuts_HandCam
		params = {
			Name = Guitar_Body_Demonik
			Type = demonik
			LockTo = GUITARIST
			LockToBone = bone_guitar_body
			Pos = (-0.35794002, 0.470057, 0.060370997)
			Quat = (-0.086646, 0.686242, -0.476262)
			FOV = 72.0
		}
		DOF = $DOF_CloseUp03_TOD_Manager
		CrowdOff
	}
]
default_cameras_orbit = [
	{
		controlscript = CameraCuts_Orbit
		params = {
			Name = Orbit_Stage
			LockTo = GUITARIST
			Pos = (0.61307204, 0.85457504, -1.556369)
			Quat = (-0.055081, -0.325498, -0.019047)
			FOV = 72.0
			orbitangle = 80
		}
		DOF = $DOF_CloseUp01_TOD_Manager
	}
	{
		controlscript = CameraCuts_Orbit
		params = {
			Name = Orbit_CloseUp
			LockTo = GUITARIST
			Pos = (-0.623458, 1.762923, 1.452922)
			Quat = (0.058131002, 0.9316849, -0.172848)
			FOV = 72.0
			orbitangle = 40
		}
		DOF = $DOF_CloseUp01_TOD_Manager
	}
	{
		controlscript = CameraCuts_Orbit
		params = {
			Name = Orbit_Mid
			LockTo = GUITARIST
			Pos = (1.8531569, 1.402983, 2.3796542)
			Quat = (0.047396, -0.89235497, 0.096345)
			FOV = 72.0
			orbitangle = 70
		}
		DOF = $DOF_CloseUp01_TOD_Manager
	}
	{
		controlscript = CameraCuts_Orbit
		params = {
			Name = Orbit_Drummer
			LockTo = drummer
			Pos = (-1.155043, 2.428414, 3.3713057)
			Quat = (0.039694, 0.95921797, -0.21765)
			FOV = 72.0
			orbitangle = 50
		}
		DOF = $DOF_CloseUp01_TOD_Manager
	}
	{
		controlscript = CameraCuts_Orbit
		params = {
			Name = Orbit_Singer
			LockTo = vocalist
			Pos = (-1.155043, 2.428414, 3.3713057)
			Quat = (0.039694, 0.95921797, -0.21765)
			FOV = 72.0
			orbitangle = 50
		}
		DOF = $DOF_CloseUp01_TOD_Manager
	}
]
default_cameras_starpower = [
	{
		controlscript = CameraCuts_HandCam
		params = {
			Name = star_Power
			LockTo = World
			Pos = (0.622013, 0.681226, 1.318936)
			Quat = (-0.016913, -0.92676395, -0.041992996)
			FOV = 72.0
		}
		DOF = $DOF_CloseUp02_TOD_Manager
	}
]
default_cameras_boss_finish = [
	{
		Name = boss_devil_finish
		controlscript = CameraCuts_TwoCam
		params = {
			Cam1 = {
				LockTo = World
				Pos = (0.962169, 0.53960097, 3.2702482)
				Quat = (-0.023288, 0.977894, 0.18821001)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = World
				Pos = (0.87311107, 1.4404389, 2.421501)
				Quat = (-0.06923701, 0.920361, 0.168251)
				FOV = 72.0
			}
		}
	}
]
default_cameras_boss_dead = [
	{
		controlscript = CameraCuts_HandCam
		params = {
			LockTo = World
			Pos = (3.557984, 1.241251, 3.824588)
			Quat = (-0.024045, -0.90200096, 0.010152999)
			FOV = 72.0
		}
	}
]
default_cameras_walk = [
	{
		controlscript = CameraCuts_HandCam
		params = {
			Name = Walk01
			LockTo = World
			Pos = (0.373905, 0.631563, 4.8783784)
			Quat = (-0.016905999, 0.9827779, 0.14206801)
			FOV = 72.0
		}
		DOF = $DOF_CloseUp02_TOD_Manager
	}
]
default_cameras_stagedive = [
	{
		controlscript = CameraCuts_HandCam
		params = {
			Name = StageDive
			LockTo = World
			Pos = (0.373905, 0.631563, 4.8783784)
			Quat = (-0.016905999, 0.9827779, 0.14206801)
			FOV = 72.0
		}
		DOF = $DOF_CloseUp02_TOD_Manager
	}
]
default_cameras_win = [
	{
		controlscript = CameraCuts_HandCam
		params = {
			Name = win
			LockTo = World
			Pos = (0.622013, 0.681226, 1.318936)
			Quat = (-0.016913, -0.92676395, -0.041992996)
			FOV = 72.0
		}
		DOF = $DOF_CloseUp02_TOD_Manager
	}
]
default_cameras_lose = [
	{
		controlscript = CameraCuts_HandCam
		params = {
			Name = lose
			LockTo = World
			Pos = (-0.97144395, 0.90905, 0.850675)
			Quat = (-0.00064100005, -0.99934596, -0.02286)
			FOV = 72.0
		}
		DOF = $DOF_CloseUp02_TOD_Manager
	}
]
default_cameras_vert_drummer = [
	{
		Name = VertDrummer01
		controlscript = CameraCuts_TwoCam
		params = {
			Cam1 = {
				LockTo = World
				Pos = (3.039751, 1.553329, 2.9490602)
				Quat = (0.024109, -0.89691794, 0.049145)
				FOV = 71.0
			}
			Cam2 = {
				LockTo = World
				Pos = (-7.7150383, 1.4195828, 2.9341018)
				Quat = (0.00736, 0.93007594, -0.018824998)
				FOV = 71.0
			}
		}
	}
]
default_cameras_vert_guitarist = [
	{
		Name = VertGuitarist01
		controlscript = CameraCuts_TwoCam
		params = {
			Cam1 = {
				LockTo = World
				Pos = (3.039751, 1.553329, 2.9490602)
				Quat = (0.024109, -0.89691794, 0.049145)
				FOV = 71.0
			}
			Cam2 = {
				LockTo = World
				Pos = (-7.7150383, 1.4195828, 2.9341018)
				Quat = (0.00736, 0.93007594, -0.018824998)
				FOV = 71.0
			}
		}
	}
]
default_cameras_vert_stagerear = [
	{
		Name = VertStageRear
		controlscript = CameraCuts_TwoCam
		params = {
			Cam1 = {
				LockTo = World
				Pos = (3.039751, 1.553329, 2.9490602)
				Quat = (0.024109, -0.89691794, 0.049145)
				FOV = 45.0
			}
			Cam2 = {
				LockTo = World
				Pos = (-7.7150383, 1.4195828, 2.9341018)
				Quat = (0.00736, 0.93007594, -0.018824998)
				FOV = 45.0
			}
		}
	}
]
default_cameras_vert_stagefront = [
	{
		Name = VertStageFront
		controlscript = CameraCuts_TwoCam
		params = {
			Cam1 = {
				LockTo = World
				Pos = (3.039751, 1.553329, 2.9490602)
				Quat = (0.024109, -0.89691794, 0.049145)
				FOV = 71.0
			}
			Cam2 = {
				LockTo = World
				Pos = (-7.7150383, 1.4195828, 2.9341018)
				Quat = (0.00736, 0.93007594, -0.018824998)
				FOV = 71.0
			}
		}
	}
]
default_cameras_special = [
	{
		controlscript = CameraCuts_HandCam
		params = {
			Name = Special01
			LockTo = World
			Pos = (-6.321385, 0.924312, -2.6622968)
			Quat = (-0.026229998, 0.784364, 0.032947995)
			FOV = 72.0
		}
		DOF = $DOF_CloseUp01_TOD_Manager
	}
	{
		controlscript = CameraCuts_HandCam
		params = {
			Name = Special02
			LockTo = World
			Pos = (-4.3443885, 0.950269, -0.84059906)
			Quat = (1.9E-05, 0.99112797, -0.001512)
			FOV = 72.0
		}
		DOF = $DOF_CloseUp01_TOD_Manager
	}
	{
		controlscript = CameraCuts_HandCam
		params = {
			Name = Special03
			LockTo = World
			Pos = (-1.543603, 0.87668294, -1.361017)
			Quat = (-0.008355001, -0.953027, -0.027003)
			FOV = 72.0
		}
		DOF = $DOF_CloseUp01_TOD_Manager
	}
	{
		controlscript = CameraCuts_HandCam
		params = {
			Name = Special04
			LockTo = World
			Pos = (-1.543603, 0.87668294, -1.361017)
			Quat = (-0.008355001, -0.953027, -0.027003)
			FOV = 72.0
		}
		DOF = $DOF_CloseUp01_TOD_Manager
	}
]
default_cameras_boss_closeup_2p = [
	{
		controlscript = CameraCuts_HandCam
		params = {
			Name = Boss_CloseUp
			LockTo = World
			Pos = (-6.321385, 0.924312, -2.6622968)
			Quat = (-0.026229998, 0.784364, 0.032947995)
			FOV = 72.0
		}
		DOF = $DOF_CloseUp01_TOD_Manager
	}
]
default_cameras_player_closeup_2p = [
	{
		controlscript = CameraCuts_HandCam
		params = {
			Name = Player_CloseUp
			LockTo = World
			Pos = (-6.321385, 0.924312, -2.6622968)
			Quat = (-0.026229998, 0.784364, 0.032947995)
			FOV = 72.0
		}
		DOF = $DOF_CloseUp01_TOD_Manager
	}
]
gWinportCameraLocked = 0

script winportLockCamera 
	Change \{gWinportCameraLocked = 1}
endscript

script winportUnlockCamera 
	Change \{gWinportCameraLocked = 0}
endscript
