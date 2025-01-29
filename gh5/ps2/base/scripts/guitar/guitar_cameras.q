CameraCuts_Good_Array = $Default_Cameras_Good
CameraCuts_Normal_Array = $Default_Cameras_Normal
CameraCuts_Poor_Array = $Default_Cameras_Poor
CameraCuts_Performance = good
CameraCuts_LastArray = $CameraCuts_Good_Array
CameraCuts_LastPerformance = good
cameracuts_init = FALSE
CameraCuts_Enabled = FALSE
CameraCuts_LastIndex = 0
CameraCuts_LastType = None
cameracuts_lastname = None
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
default_handcam_amplitudeposition = 0.05
default_handcam_amplituderotation = -0.08
handcam_amplitudeposition = 0.05
handcam_amplituderotation = -0.08
CameraCuts_NoteMapping = [
	{
		MidiNote = 0
		Scr = CameraCuts_EnableChangeCam
		params = {
			enable = true
		}
	}
	{
		MidiNote = 1
		Scr = CameraCuts_EnableChangeCam
		params = {
			enable = FALSE
		}
	}
	{
		MidiNote = 3
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_moments'
			changenow
			Name = moment01
		}
	}
	{
		MidiNote = 4
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_moments'
			changenow
			Name = moment02
		}
	}
	{
		MidiNote = 5
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_moments'
			changenow
			Name = moment03
		}
	}
	{
		MidiNote = 6
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_moments'
			changenow
			Name = moment04
		}
	}
	{
		MidiNote = 8
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_guitarist'
			changenow
			Type = guitarist_closeup
		}
	}
	{
		MidiNote = 9
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_guitarist'
			changenow
			Name = guitarist_stage
		}
	}
	{
		MidiNote = 10
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_guitarist'
			changenow
			Name = guitarist_mocap01
		}
	}
	{
		MidiNote = 11
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_guitarist'
			changenow
			Name = guitarist_mocap02
		}
	}
	{
		MidiNote = 13
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_singer'
			changenow
			Type = Singer_CloseUp
		}
	}
	{
		MidiNote = 14
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_singer'
			changenow
			Type = singer_stage
		}
	}
	{
		MidiNote = 15
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_singer'
			changenow
			Name = singer_mocap01
		}
	}
	{
		MidiNote = 16
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_singer'
			changenow
			Name = singer_mocap02
		}
	}
	{
		MidiNote = 18
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_bassist'
			changenow
			Name = bassist_closeup
		}
	}
	{
		MidiNote = 19
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_bassist'
			changenow
			Name = bassist_stage
		}
	}
	{
		MidiNote = 20
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_bassist'
			changenow
			Name = bassist_mocap01
		}
	}
	{
		MidiNote = 21
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_bassist'
			changenow
			Name = bassist_mocap02
		}
	}
	{
		MidiNote = 23
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_drummer'
			changenow
			Type = drummer_closeup
		}
	}
	{
		MidiNote = 24
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_drummer'
			changenow
			Name = drummer_stage
		}
	}
	{
		MidiNote = 25
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_drummer'
			changenow
			Name = drummer_mocap01
		}
	}
	{
		MidiNote = 26
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_drummer'
			changenow
			Name = drummer_mocap02
		}
	}
	{
		MidiNote = 28
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras'
			changenow
			Type = LongShot
		}
	}
	{
		MidiNote = 29
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras'
			changenow
			Type = midshot
		}
	}
	{
		MidiNote = 30
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras'
			changenow
			Type = venue_midshot
		}
	}
	{
		MidiNote = 31
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras'
			changenow
			Type = generic_stage_shot
		}
	}
	{
		MidiNote = 33
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_solo'
			changenow
			Type = solo_guitar
		}
	}
	{
		MidiNote = 34
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_solo'
			changenow
			Name = solo_vocal
		}
	}
	{
		MidiNote = 35
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_solo'
			changenow
			Type = solo_drum
		}
	}
	{
		MidiNote = 36
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_solo'
			changenow
			Name = solo_bass
		}
	}
	{
		MidiNote = 38
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_single'
			changenow
			Type = single
		}
	}
	{
		MidiNote = 40
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_special'
			changenow
			Name = Special01
		}
	}
	{
		MidiNote = 41
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_special'
			changenow
			Name = Special02
		}
	}
	{
		MidiNote = 43
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_audience'
			changenow
			Type = audience
		}
	}
	{
		MidiNote = 45
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_zoom'
			changenow
			Type = zoom_in
		}
	}
	{
		MidiNote = 46
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_zoom'
			changenow
			Type = zoom_out
		}
	}
	{
		MidiNote = 48
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_spotlight'
			changenow
			Name = spotlight
		}
	}
	{
		MidiNote = 50
		Scr = jumbotron_setoverride
		params = {
			focus = None
		}
	}
	{
		MidiNote = 51
		Scr = jumbotron_setoverride
		params = {
			focus = GUITARIST
		}
	}
	{
		MidiNote = 52
		Scr = jumbotron_setoverride
		params = {
			focus = BASSIST
		}
	}
	{
		MidiNote = 53
		Scr = jumbotron_setoverride
		params = {
			focus = vocalist
		}
	}
	{
		MidiNote = 54
		Scr = jumbotron_setoverride
		params = {
			focus = drummer
		}
	}
	{
		MidiNote = 55
		Scr = jumbotron_setoverride
		params = {
			focus = visualizer
		}
	}
	{
		MidiNote = 74
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_Orbits'
			changenow
			Type = orbit_low
		}
	}
	{
		MidiNote = 75
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_Orbits'
			changenow
			Type = orbit_high
		}
	}
	{
		MidiNote = 57
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_Verts_Front'
			changenow
			Type = verts_front
		}
	}
	{
		MidiNote = 58
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_Verts_Rear'
			changenow
			Type = verts_rear
		}
	}
	{
		MidiNote = 60
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_G_across_stage'
			changenow
			Type = g_across_stage
		}
	}
	{
		MidiNote = 61
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_S_across_stage'
			changenow
			Type = s_across_stage
		}
	}
	{
		MidiNote = 90
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_moments'
			changenow
			Name = moment01
		}
	}
	{
		MidiNote = 91
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_moments'
			changenow
			Name = moment02
		}
	}
	{
		MidiNote = 92
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_moments'
			changenow
			Name = moment03
		}
	}
	{
		MidiNote = 93
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_moments'
			changenow
			Name = moment04
		}
	}
	{
		MidiNote = 94
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_moments'
			changenow
			Name = moment05
		}
	}
	{
		MidiNote = 95
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_moments'
			changenow
			Name = moment06
		}
	}
	{
		MidiNote = 96
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_moments'
			changenow
			Name = moment07
		}
	}
	{
		MidiNote = 97
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_moments'
			changenow
			Name = moment08
		}
	}
	{
		MidiNote = 98
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_moments'
			changenow
			Name = moment09
		}
	}
	{
		MidiNote = 99
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_moments'
			changenow
			Name = moment10
		}
	}
]
last_camera_array_entry = 0

script CameraCuts_GetNextNoteCameraTime 
	return camera_time = ($CameraCuts_NextNoteCameraTime)
endscript

script CameraCuts_SetArray \{Type = good
		array = Default_Cameras_Good}
	if (<Type> = good)
		Change CameraCuts_Good_Array = $<array>
	endif
	if (<Type> = medium)
		Change CameraCuts_Normal_Array = $<array>
	endif
	if (<Type> = poor)
		Change CameraCuts_Poor_Array = $<array>
	endif
endscript

script CameraCuts_SetParams \{performance = medium}
	Change CameraCuts_Performance = <performance>
endscript

script setupinitialsonghandcamparams 
	setsonghandcamparams amplitudePosition = ($default_handcam_amplitudeposition) amplitudeRotation = ($default_handcam_amplituderotation)
	GetSongTimeMs time_offset = <time_offset>
	if (<time> < 0)
		get_song_prefix song = <song_name>
		formatText checksumName = event_array '%s_performance' s = <song_prefix>
		index = 0
		GetArraySize $<event_array>
		if (<array_Size> > 0)
			begin
			if ($<event_array> [<index>].time < 100)
				if ($<event_array> [<index>].Scr = setsonghandcamparams)
					setsonghandcamparams ($<event_array> [<index>].params)
					break
				endif
			else
				break
			endif
			index = (<index> + 1)
			repeat <array_Size>
		endif
	endif
endscript

script setsonghandcamparams 
	if GotParam \{amplitudePosition}
		Change handcam_amplitudeposition = <amplitudePosition>
	endif
	if GotParam \{amplitudeRotation}
		Change handcam_amplituderotation = <amplitudeRotation>
	endif
endscript

script CameraCuts_SetArrayPrefix \{prefix = 'cameras'
		Type = None
		Name = None
		length = 0}
	if NOT ($debug_camera_array = None)
		return
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
	if ($cameracuts_init = true)
		return
	else
		Change \{cameracuts_init = true}
	endif
	kill_dummy_bg_camera
	reset_cameracuts_internal_vars
	CameraCuts_StartCallback
endscript

script reset_cameracuts_internal_vars 
	if ($cameracuts_init = FALSE)

	endif
	Change \{CameraCuts_ArrayPrefix = 'cameras'}
	set_defaultcameracuts
	Change \{CameraCuts_LastType = None}
	Change \{CameraCuts_LastDownbeatIndex = 0}
	Change \{CameraCuts_ForceChangeTime = 0.0}
	Change \{CameraCuts_ForceType = None}
	Change \{CameraCuts_NextName = None}
	if ($game_mode = practice || $game_mode = tutorial || $game_mode = practice)
		Change \{CameraCuts_ChangeCamEnable = FALSE}
		Change \{CameraCuts_AllowNoteScripts = FALSE}
	elseif ($game_mode = p2_pro_faceoff)
		Change \{CameraCuts_ChangeCamEnable = true}
		Change \{CameraCuts_AllowNoteScripts = FALSE}
	elseif ($current_song = jamsession)
		Change \{CameraCuts_ChangeCamEnable = true}
		Change \{CameraCuts_AllowNoteScripts = FALSE}
	else
		Change \{CameraCuts_ChangeCamEnable = true}
		Change \{CameraCuts_AllowNoteScripts = true}
	endif
	Change \{CameraCuts_Enabled = true}
	Change \{next_screenfx = None}
	Change \{current_screenfx = None}
	Change \{cameracuts_pendingwhiteflash = FALSE}
	if ($current_level = load_z_studio)
		z_studio_setup
	endif
endscript

script CameraCuts_GetNextDownbeat 
	get_song_prefix song = ($current_song)
	formatText checksumName = event_array '%s_lightshow_notes' s = <song_prefix> AddToStringLookup
	if NOT GlobalExists Name = <event_array> Type = array
		return FALSE endtime = <endtime>
	endif
	GetArraySize $<event_array>
	array_count = ($CameraCuts_LastDownbeatIndex)
	array_Size = (<array_Size> - <array_count>)
	array_Size = (<array_Size> / 2)
	if (<array_Size> > 0)
		begin
		decompressnotevalue note_value = ($<event_array> [(<array_count> + 1)])
		if (<note> = 58 || <note> = 57)
			if ($<event_array> [<array_count>] > <endtime>)
				Change CameraCuts_LastDownbeatIndex = <array_count>
				return true endtime = ($<event_array> [<array_count>])
			endif
		endif
		array_count = (<array_count> + 2)
		repeat <array_Size>
	endif

	return FALSE endtime = <endtime>
endscript

script CameraCuts_StartCallback 
	if 0x2e51d96c
		return
	endif
	if ($cheat_focusmode = 1)
		return
	endif
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
	elseif ($game_mode = p2_pro_faceoff)
		CameraCut_GetArraySize Camera_Array = <Camera_Array> excludename = $cameracuts_lastname target_node = <target_node>
	elseif ($current_song = jamsession)
		CameraCut_GetArraySize Camera_Array = <Camera_Array> excludename = $cameracuts_lastname target_node = <target_node>
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
		select_cameracut_video_end
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
	Change CameraCuts_LastArray = $<Camera_Array>
	Change \{CameraCuts_LastPerformance = $CameraCuts_Performance}
	Change CameraCuts_LastIndex = <newindex>
	cameracut_saveselectedparams
	if ($cameracuts_enablevideovenuecams = 1)
		findvideovenuecam <...>
	endif
	if ($debug_showcameraname = On)
		CameraCuts_UpdateDebugCameraName
	endif
	if ($output_gpu_log = 1)
		CameraCuts_OutputGPULog
	endif
	if StructureContains structure = ($<Camera_Array> [<newindex>]) params
		camStruct = (($<Camera_Array> [<newindex>]).params)
		if NOT StructureContains structure = <camStruct> DOF
			camStruct = ($<Camera_Array> [<newindex>])
		endif
	else
		camStruct = ($<Camera_Array> [<newindex>])
	endif
	if StructureContains structure = ($<Camera_Array> [<newindex>]) ShadowCasters
		Change CameraCuts_ShadowCasters = ($<Camera_Array> [<newindex>].ShadowCasters)
	else
		Change \{CameraCuts_ShadowCasters = None}
	endif
	0x4975a676 = 100.0
	if StructureContains structure = ($<Camera_Array> [<newindex>]) gpu
		0x4975a676 = ((<Camera_Array> [<newindex>]).gpu)
	endif
	if (<0x4975a676> <= 80.0)
		0xbf54cf40
	else
		0x9c117ad4
	endif
	if (<0x4975a676> <= 71.0)
		showstencilshadow
	else
	endif
	Change \{structurename = guitarist_info
		waiting_for_cameracut = FALSE}
	Change \{structurename = bassist_info
		waiting_for_cameracut = FALSE}
	bandmanager_notifyallofcameracut
	GetSongTimeMs
	Change CameraCuts_LastCameraStartTime = <time>
	if ($display_clip_info = true)
		clip_get_time_and_frame

	endif
	CamParams = ($<Camera_Array> [<newindex>])
	CameraCut_SwapLookAts
	if StructureContains structure = <camStruct> Name
		Camera_Name = (<camStruct>.Name)
	else
		Camera_Name = $CameraCuts_NextName
	endif
	prepare_mocap_lock_target Camera = <Camera_Name>
	PlayIGCCam {
		time = <camera_time>
		viewport = bg_viewport
		controlscript = CameraCuts_StaticCamControl
		params = {CamParams = <CamParams>}
		far_clip = 500.0
		<CamParams>
		exitscript = CameraCuts_StartCallback
		play_hold = 0
		Name = CameraCutCam
		<debug_flags>
	}
endscript

script prepare_mocap_lock_target 
	switch <Camera>
		case guitarist_mocap01
		lock_target = guitarist_mocap_lock_target_01
		case guitarist_mocap02
		lock_target = guitarist_mocap_lock_target_02
		case bassist_mocap01
		lock_target = bassist_mocap_lock_target_01
		case bassist_mocap02
		lock_target = bassist_mocap_lock_target_02
		case singer_mocap01
		lock_target = vocalist_mocap_lock_target_01
		case singer_mocap02
		lock_target = vocalist_mocap_lock_target_02
		case drummer_mocap01
		lock_target = drummer_mocap_lock_target_01
		case drummer_mocap02
		lock_target = drummer_mocap_lock_target_02
		case moment01
		lock_target = moment_cam_lock_target_01
		case moment02
		lock_target = moment_cam_lock_target_02
		case moment03
		lock_target = moment_cam_lock_target_03
		case moment04
		lock_target = moment_cam_lock_target_04
		case moment05
		lock_target = moment_cam_lock_target_05
		case moment06
		lock_target = moment_cam_lock_target_06
		case moment07
		lock_target = moment_cam_lock_target_07
		case moment08
		lock_target = moment_cam_lock_target_08
		case moment09
		lock_target = moment_cam_lock_target_09
		case moment10
		lock_target = moment_cam_lock_target_10
		default
		return
	endswitch
	if CompositeObjectExists Name = <lock_target>
		<lock_target> :anim_update active_camera_override = true
	endif
endscript

script findvideovenuecam 
	ExtendCrc <Camera_Array> '_video_venue' out = camera_array_video_venue
	if GlobalExists Name = <camera_array_video_venue>
		if StructureContains structure = ($<Camera_Array> [<newindex>]) Name
			Name = ($<Camera_Array> [<newindex>].Name)
			GetArraySize ($<camera_array_video_venue>)
			index_vv = 0
			begin
			if ($<camera_array_video_venue> [<index_vv>].Name = <Name>)
				return Camera_Array = <camera_array_video_venue> newindex = <index_vv>
			endif
			index_vv = (<index_vv> + 1)
			repeat <array_Size>
		endif
	endif
	return
endscript

script applydeferredcameraeffects 
	WaitOneGameFrame
	KillSpawnedScript \{id = cameracuts_scriptstokilloncut}
	if ($game_mode = practice || $game_mode = tutorial || $game_mode = practice)
		return
	endif
	applyscreenfx effect = ($next_screenfx)
	if NOT screenFX_FXInstanceExists \{viewport = bg_viewport
			Name = depth_of_field__simplified_}
		ScreenFX_AddFXInstance {
			viewport = bg_viewport
			<dofParam>
		}
	else
		ScreenFX_UpdateFXInstanceParams {
			viewport = bg_viewport
			<dofParam>
		}
	endif
	if ($cameracuts_pendingwhiteflash = true)
		Change \{cameracuts_pendingwhiteflash = FALSE}
		SpawnScriptNow \{camerafx_whiteflash}
	endif
endscript
next_screenfx = None
current_screenfx = None
cameracuts_pendingwhiteflash = FALSE

script cameracuts_setnextscreenfx 
	Change next_screenfx = <effect>
endscript

script cameracuts_setpendingwhiteflash 
	Change \{cameracuts_pendingwhiteflash = true}
endscript

script CameraCuts_UpdateDebugCameraName 
	if NOT ScreenElementExists \{id = debug_camera_name_text}
		CreateScreenElement \{Type = TextElement
			parent = root_window
			id = debug_camera_name_text
			font = debug
			Pos = (640.0, 32.0)
			just = [
				center
				top
			]
			Scale = 1.0
			rgba = [
				210
				210
				210
				250
			]
			text = qs(0xeb0e6415)
			z_priority = 100.0
			z_priority = 1.0
			alpha = 1}
	endif
	if NOT ScreenElementExists \{id = debug_camera_name_text2}
		CreateScreenElement \{Type = TextElement
			parent = root_window
			id = debug_camera_name_text2
			font = debug
			Pos = (640.0, 70.0)
			just = [
				center
				top
			]
			Scale = 1.0
			rgba = [
				210
				210
				210
				250
			]
			text = qs(0xeb0e6415)
			z_priority = 100.0
			z_priority = 1.0
			alpha = 1}
	endif
	cameraname_crc = None
	Crowd = 1
	if ($cameracuts_init = true)
		GetArraySize ($CameraCuts_LastArray)
		if ($CameraCuts_LastIndex < <array_Size>)
			if StructureContains structure = (($CameraCuts_LastArray) [$CameraCuts_LastIndex]) params
				if StructureContains structure = (($CameraCuts_LastArray) [$CameraCuts_LastIndex].params) Name
					cameraname_crc = ($CameraCuts_LastArray [$CameraCuts_LastIndex].params.Name)
				endif
			endif
			if StructureContains structure = (($CameraCuts_LastArray) [$CameraCuts_LastIndex]) Name
				cameraname_crc = ($CameraCuts_LastArray [$CameraCuts_LastIndex].Name)
			endif
			if StructureContains structure = ($CameraCuts_LastArray [$CameraCuts_LastIndex]) CrowdOff
				<Crowd> = 0
			endif
			if (<cameraname_crc> = None)
				if StructureContains structure = (($CameraCuts_LastArray) [$CameraCuts_LastIndex]) controlscript
					cameraname_crc = ($CameraCuts_LastArray [$CameraCuts_LastIndex].controlscript)
				endif
			endif
		endif
	endif
	formatText TextName = cameraname qs(0x4558200d) s = <cameraname_crc> t = $CameraCuts_LastType c = <Crowd> DontAssertForChecksums donotresolve
	debug_camera_name_text :se_setprops text = <cameraname>

	debug_camera_name_text2 :se_setprops text = <cameraname>
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
	formatText TextName = text qs(0x735757ef) s = <cameraname> t = $CameraCuts_LastType c = <Crowd> DontAssertForChecksums
	TextOutput text = <text>
endscript

script destroy_cameracuts 
	Change \{cameracuts_init = FALSE}
	Change \{CameraCuts_Enabled = FALSE}
	KillSpawnedScript \{Name = CameraCuts_StartCallback}
	KillSpawnedScript \{Name = applydeferredcameraeffects}
	KillCamAnim \{Name = CameraCutCam}
	kill_dummy_bg_camera
	ClearNoteMappings \{section = cameras}
	KillSpawnedScript \{Name = cameracuts_iterator}
	KillSpawnedScript \{id = cameracuts_scripts}
	KillSpawnedScript \{id = cameracuts_scriptstokilloncut}
endscript
profiling_cameracuts = FALSE

script profile_camera_cuts \{FileName = qs(0xd8a6b977)}
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
		suffix = qs(0xe5bed240)
		case 1
		suffix = qs(0xa8f5d7cc)
		case 2
		suffix = qs(0x8f585fa5)
		case 3
		suffix = qs(0x262cfe49)
		case 4
		suffix = qs(0xb3e96435)
		case 5
		suffix = qs(0x9f875049)
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
	if StructureContains structure = ($<Camera_Array> [$debug_camera_array_count]) Name
		formatText TextName = title qs(0xba1fa8c6) n = (($<Camera_Array> [$debug_camera_array_count]).Name) DontAssertForChecksums
	else
		formatText TextName = title qs(0xba1fa8c6) n = (($<Camera_Array> [$debug_camera_array_count]).params.Name) DontAssertForChecksums
	endif
	dumpprofile cpu = 6 title = <title> current_time_only
endscript

script CameraCuts_EnableChangeCam 
	if NOT ($debug_camera_array = None)
		return
	endif
	Change CameraCuts_ChangeCamEnable = <enable>
	Change \{CameraCuts_ChangeNow = true}
endscript

script CameraCuts_CalcTime 
	if GotParam \{force_time}
		camera_time = <force_time>
		GetSongTimeMs
		camera_songtime = (<time> + <camera_time> * 1000)
		return camera_time = <camera_time> camera_songtime = <camera_songtime>
	endif
	if ($CameraCuts_ChangeNow = true)
		camera_time = 0
		GetSongTimeMs
		camera_songtime = (<time> + <camera_time> * 1000)
		return camera_time = <camera_time> camera_songtime = <camera_songtime>
	endif
	if ($CameraCuts_ForceTime = 0)
		if ($CameraCuts_NextTime = 0)
			if NOT ($debug_camera_array = None)
				camera_time = 5.0
			else
				camera_time = RandomFloat (2.0, 4.0)
				GetSongTimeMs
				endtime = (<time> + <camera_time> * 1000)
				if CameraCuts_GetNextDownbeat endtime = <endtime>
					<delta> = ((<endtime> - <time>) / 1000.0)
					if ((<delta> < 6.0) && (<delta> > 2.0))
						<camera_time> = <delta>
					endif
				endif
			endif
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
	if GotParam \{force_time}
		Wait <force_time> Seconds
		return \{true}
	endif
	GetSongTimeMs
	Change CameraCuts_ChangeTime = <camera_songtime>
	begin
	GetSongTimeMs
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
	WaitOneGameFrame
	repeat
	return \{true}
endscript

script CameraCuts_StaticCamControl 
	CameraCuts_CalcTime force_time = <force_time>
	CCam_DoMorph {
		<CamParams>
	}
	CameraCuts_WaitScript camera_songtime = <camera_songtime> force_time = <force_time>
endscript

script cameracuts_blockcontrol 
	CameraCuts_CalcTime force_time = <force_time>
	CCam_DoMorph {
		<...>
	}
	Block
endscript

script CameraCuts_HandCam \{Name = None}
	CameraCuts_CalcTime force_time = <force_time>
	CCam_DoMorph
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
		amplitudePosition = ($handcam_amplitudeposition)
		amplitudeRotation = ($handcam_amplituderotation)
	endif
	CameraCuts_SetHandCamParams <...>
	CameraCuts_WaitScript camera_songtime = <camera_songtime> force_time = <force_time>
endscript

script CameraCuts_TwoCam 
	if GotParam \{UseHandCam}
		CameraCuts_SetHandCamParams {
			amplitudePosition = ($handcam_amplitudeposition)
			amplitudeRotation = ($handcam_amplituderotation)
		}
	endif
	if GotParam \{usehandcamsmooth}
		CameraCuts_SetHandCamParams \{amplitudePosition = 0.05
			amplitudeRotation = -0.08}
	endif
	CameraCuts_CalcTime force_time = <force_time>
	CCam_DoMorph {
		<Cam1>
	}
	cameracuts_waitformorphorsongtime camera_songtime = <camera_songtime>
	CCam_DoMorph {
		<Cam2>
		time = <camera_time>
	}
	CameraCuts_WaitScript camera_songtime = <camera_songtime> force_time = <force_time>
endscript

script cameracuts_waitformorphorsongtime 

	begin
	if ccam_ismorphcomplete
		return
	endif
	if CameraCuts_WaitScript camera_songtime = <camera_songtime> noWait
		Goto \{nullscript}
	endif
	Wait \{1
		gameframes}
	repeat
endscript

script cameracuts_waitfortimeorsongtime 

	ResetTimer
	begin
	if TimeGreaterThan <Seconds>
		return
	endif
	if CameraCuts_WaitScript camera_songtime = <camera_songtime> noWait
		Goto \{nullscript}
	endif
	Wait \{1
		gameframes}
	repeat
endscript

script CameraCuts_Encore 
	CameraCuts_CalcTime force_time = <force_time>
	CCam_DoMorph {
		<Cam1>
	}
	cameracuts_waitfortimeorsongtime camera_songtime = <camera_songtime> Seconds = 3
	CCam_DoMorph {
		<Cam2>
	}
	cameracuts_waitfortimeorsongtime camera_songtime = <camera_songtime> Seconds = 2.5
	CCam_DoMorph {
		<Cam3>
	}
	cameracuts_waitfortimeorsongtime camera_songtime = <camera_songtime> Seconds = 3
	CCam_DoMorph {
		<Cam4>
	}
	cameracuts_waitfortimeorsongtime camera_songtime = <camera_songtime> Seconds = 2
	CCam_DoMorph {
		<Cam5>
	}
	CameraCuts_WaitScript camera_songtime = <camera_songtime> force_time = <force_time>
endscript

script CameraCuts_Orbit 
	CameraCuts_CalcTime force_time = <force_time>
	CCam_DoMorph {
		<...>
	}
	orbitangle = (3.1409998 * <orbitangle> / 180.0)
	if (<camera_time> > 0)
		CCam_Orbit axis = (0.0, 1.0, 0.0) speed = (<orbitangle> / <camera_time>)
	endif
	CameraCuts_SetHandCamDriftOnly
	CameraCuts_WaitScript camera_songtime = <camera_songtime> force_time = <force_time>
endscript

script CameraCuts_OrbitAndMorphTwoCam 
	CameraCuts_CalcTime force_time = <force_time>
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
	CameraCuts_WaitScript camera_songtime = <camera_songtime> force_time = <force_time>
endscript

script CameraCuts_SplineMorph 
	CameraCuts_CalcTime force_time = <force_time>
	CCam_SplineMorph {
		<...>
		total_time = <camera_time>
	}
	CameraCuts_WaitScript camera_songtime = <camera_songtime> force_time = <force_time>
endscript

script CameraCuts_SpecialStepMove 
	CCam_SetSmoothing \{Type = all
		On = 1
		slow_lerp_factor = 0.7
		fast_lerp_factor = 0.7
		lerp_dropoff = 2.0}
	CameraCuts_CalcTime force_time = <force_time>
	CCam_DoMorph {
		<Cam1>
	}
	CameraCuts_SetHandCamParams \{amplitudePosition = 0.0
		amplitudeRotation = -0.8}
	if NOT GotParam \{StepTime}
		StepTime = 6.0
	endif
	if NOT GotParam \{FinalRotTime}
		FinalRotTime = 1.0
	endif
	if NOT GotParam \{StepNum}
		StepNum = 6.0
	endif
	if NOT GotParam \{StepDir}
		StepDir = (0.0, 0.07, 0.05)
	endif
	origpos = (<Cam1>.Pos)
	diry = <StepDir>
	count = 0.0
	timestep = 0.05
	step = (<timestep> / <StepTime>)
	num_jumps = <StepNum>
	dirx = ((<Cam2>.Pos) - (<Cam1>.Pos))
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
	begin
	if CameraCuts_WaitScript camera_songtime = <camera_songtime> noWait
		return
	endif
	if ccam_ismorphcomplete
		break
	endif
	Wait \{1
		gameframes}
	repeat
	count = (<count> + <step>)
	repeat
	CCam_DoMorph {
		<Cam2>
		time = <FinalRotTime>
		motion = smooth
	}
	CameraCuts_WaitScript camera_songtime = <camera_songtime> force_time = <force_time>
endscript

script CameraCuts_ApplyDOF \{DOF = $DOF_Medium02_TOD_Manager
		time = 0.0}
	dofType = <DOF>
	dofParam = (<dofType>.screen_FX [0])
	if NOT screenFX_FXInstanceExists \{viewport = bg_viewport
			Name = depth_of_field__simplified_}
		ScreenFX_AddFXInstance {
			viewport = bg_viewport
			Name = depth_of_field__simplified_
			<dofParam>
			time = <time>
		}
	else
		ScreenFX_UpdateFXInstanceParams {
			viewport = bg_viewport
			Name = depth_of_field__simplified_
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
	if GotParam \{handcamcloseup}
		driftSlerpMap = [
			(0.0, 1.0)
			(0.03, 0.2)
		]
	else
		driftSlerpMap = [
			(0.0, 0.8)
			(0.05, 1.0)
		]
	endif
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
		driftSlerpMap = <driftSlerpMap>
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
	CCam_DoMorph
	zooming = FALSE
	if (<zooming> = true)
		amplitudePosition = 0.01
		amplitudeRotation = -0.01
	else
		amplitudePosition = ($handcam_amplitudeposition)
		amplitudeRotation = ($handcam_amplituderotation)
	endif
	CameraCuts_SetHandCamParams <...>
	cameracuts_waitfortimeorsongtime camera_songtime = <camera_songtime> Seconds = 2
	CCam_DoMorph <...> FOV = 50 time = 0.6 motion = smooth
	cameracuts_waitformorphorsongtime camera_songtime = <camera_songtime>
	cameracuts_waitfortimeorsongtime camera_songtime = <camera_songtime> Seconds = 0.1
	CCam_DoMorph <...> FOV = 53 time = 0.25 motion = smooth
	cameracuts_waitformorphorsongtime camera_songtime = <camera_songtime>
	cameracuts_waitfortimeorsongtime camera_songtime = <camera_songtime> Seconds = 0.03
	CCam_DoMorph <...> FOV = 51 time = 0.3 motion = smooth
	cameracuts_waitformorphorsongtime camera_songtime = <camera_songtime>
	CCam_DoMorph <...> FOV = 51
	CameraCuts_CalcTime force_time = <force_time>
	CameraCuts_WaitScript camera_songtime = <camera_songtime> force_time = <force_time>
endscript

script CameraCuts_QuickZoom 
	CCam_DoMorph
	zooming = FALSE
	if (<zooming> = true)
		amplitudePosition = 0.01
		amplitudeRotation = -0.01
	else
		amplitudePosition = ($handcam_amplitudeposition)
		amplitudeRotation = ($handcam_amplituderotation)
	endif
	CameraCuts_SetHandCamParams <...>
	CCam_DoMorph {
		<Cam1>
	}
	cameracuts_waitformorphorsongtime camera_songtime = <camera_songtime>
	cameracuts_waitfortimeorsongtime camera_songtime = <camera_songtime> Seconds = 2
	CCam_DoMorph {
		<Cam1>
	}
	cameracuts_waitformorphorsongtime camera_songtime = <camera_songtime>
	CCam_DoMorph {
		<Cam2>
		time = 0.75
		motion = smooth
	}
	cameracuts_waitformorphorsongtime camera_songtime = <camera_songtime>
	CCam_DoMorph {
		<Cam2>
	}
	cameracuts_waitformorphorsongtime camera_songtime = <camera_songtime>
	CameraCuts_CalcTime force_time = <force_time>
	CameraCuts_WaitScript camera_songtime = <camera_songtime> force_time = <force_time>
endscript

script CameraCuts_Pan 
	CameraCuts_SetHandCamParams {
		amplitudePosition = ($handcam_amplitudeposition)
		amplitudeRotation = ($handcam_amplituderotation)
	}
	CCam_DoMorph {
		<Cam1>
		time = 0
	}
	cameracuts_waitfortimeorsongtime camera_songtime = <camera_songtime> Seconds = 2
	CCam_DoMorph {
		<Cam2>
		time = 1
		motion = smooth
	}
	cameracuts_waitformorphorsongtime camera_songtime = <camera_songtime>
	CameraCuts_CalcTime force_time = <force_time>
	CameraCuts_WaitScript camera_songtime = <camera_songtime> force_time = <force_time>
endscript

script CameraCuts_ThreePos 
	CameraCuts_CalcTime force_time = <force_time>
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
	CameraCuts_WaitScript camera_songtime = <camera_songtime> force_time = <force_time>
endscript

script CameraCuts_FourPos 
	CameraCuts_CalcTime force_time = <force_time>
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
	CameraCuts_WaitScript camera_songtime = <camera_songtime> force_time = <force_time>
endscript
jumbotron_focus = None

script jumbotron_setoverride 
	Change jumbotron_focus = <focus>
endscript
