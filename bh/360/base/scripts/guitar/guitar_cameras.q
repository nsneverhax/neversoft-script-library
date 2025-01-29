CameraCuts_Good_Array = $Default_Cameras_Good
CameraCuts_Normal_Array = $Default_Cameras_Normal
CameraCuts_Poor_Array = $Default_Cameras_Poor
CameraCuts_Performance = good
CameraCuts_LastArray = $CameraCuts_Good_Array
CameraCuts_LastPerformance = good
CameraCuts_Init = false
CameraCuts_Enabled = false
CameraCuts_LastIndex = 0
CameraCuts_LastType = None
CameraCuts_LastName = None
CameraCuts_LastDownbeatIndex = 0
CameraCuts_Preprocess_AutoCameras = false
CameraCuts_NextExtraParamsSet = 0
CameraCuts_NextExtraParams = {
}
CameraCuts_ChangeTime = 0
CameraCuts_ChangeNow = false
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
default_handcam_amplitudePosition = 0.05
default_handcam_amplitudeRotation = -0.08
handcam_amplitudePosition = 0.05
handcam_amplitudeRotation = -0.08
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
			enable = false
		}
	}
	{
		MidiNote = 3
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_moments'
			changenow
			name = Moment01
			sync
		}
	}
	{
		MidiNote = 4
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_moments'
			changenow
			name = Moment02
			sync
		}
	}
	{
		MidiNote = 5
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_moments'
			changenow
			name = Moment03
			sync
		}
	}
	{
		MidiNote = 6
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_moments'
			changenow
			name = Moment04
			sync
		}
	}
	{
		MidiNote = 8
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_guitarist'
			changenow
			type = Guitarist_CloseUp
			sync
		}
	}
	{
		MidiNote = 9
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_guitarist'
			changenow
			name = Guitarist_Stage
			sync
		}
	}
	{
		MidiNote = 10
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_guitarist'
			changenow
			name = Guitarist_Mocap01
			sync
		}
	}
	{
		MidiNote = 11
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_guitarist'
			changenow
			name = Guitarist_Mocap02
			sync
		}
	}
	{
		MidiNote = 13
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_singer'
			changenow
			type = Singer_CloseUp
			sync
		}
	}
	{
		MidiNote = 14
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_singer'
			changenow
			type = Singer_Stage
			sync
		}
	}
	{
		MidiNote = 15
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_singer'
			changenow
			name = Singer_Mocap01
			sync
		}
	}
	{
		MidiNote = 16
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_singer'
			changenow
			name = Singer_Mocap02
			sync
		}
	}
	{
		MidiNote = 18
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_bassist'
			changenow
			type = Bassist_CloseUp
			sync
		}
	}
	{
		MidiNote = 19
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_bassist'
			changenow
			name = Bassist_Stage
			sync
		}
	}
	{
		MidiNote = 20
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_bassist'
			changenow
			name = Bassist_Mocap01
			sync
		}
	}
	{
		MidiNote = 21
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_bassist'
			changenow
			name = Bassist_Mocap02
			sync
		}
	}
	{
		MidiNote = 23
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_drummer'
			changenow
			type = Drummer_CloseUp
			sync
		}
	}
	{
		MidiNote = 24
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_drummer'
			changenow
			type = Drummer_Stage
			sync
		}
	}
	{
		MidiNote = 25
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_drummer'
			changenow
			name = Drummer_Mocap01
			sync
		}
	}
	{
		MidiNote = 26
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_drummer'
			changenow
			name = Drummer_Mocap02
			sync
		}
	}
	{
		MidiNote = 28
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras'
			changenow
			type = Longshot
			sync
		}
	}
	{
		MidiNote = 29
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras'
			changenow
			type = Midshot
			sync
		}
	}
	{
		MidiNote = 30
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras'
			changenow
			type = Venue_Midshot
			sync
		}
	}
	{
		MidiNote = 31
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras'
			changenow
			type = Generic_Stage_Shot
			sync
		}
	}
	{
		MidiNote = 33
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_solo'
			changenow
			type = Solo_Guitar
			sync
		}
	}
	{
		MidiNote = 34
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_solo'
			changenow
			name = Solo_Vocal
			sync
		}
	}
	{
		MidiNote = 35
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_solo'
			changenow
			type = Solo_Drum
			sync
		}
	}
	{
		MidiNote = 36
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_solo'
			changenow
			name = Solo_Bass
			sync
		}
	}
	{
		MidiNote = 38
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_single'
			changenow
			type = single
			sync
		}
	}
	{
		MidiNote = 40
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_special'
			changenow
			name = Special01
			sync
		}
	}
	{
		MidiNote = 41
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_special'
			changenow
			name = Special02
			sync
		}
	}
	{
		MidiNote = 43
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_audience'
			changenow
			type = audience
			sync
		}
	}
	{
		MidiNote = 45
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_zoom'
			changenow
			type = ZOOM_In
			sync
		}
	}
	{
		MidiNote = 46
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_zoom'
			changenow
			type = ZOOM_Out
			sync
		}
	}
	{
		MidiNote = 48
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_spotlight'
			changenow
			name = Spotlight
			sync
		}
	}
	{
		MidiNote = 50
		Scr = Jumbotron_SetOverride
		params = {
			focus = None
		}
	}
	{
		MidiNote = 51
		Scr = Jumbotron_SetOverride
		params = {
			focus = Guitarist
		}
	}
	{
		MidiNote = 52
		Scr = Jumbotron_SetOverride
		params = {
			focus = Bassist
		}
	}
	{
		MidiNote = 53
		Scr = Jumbotron_SetOverride
		params = {
			focus = Vocalist
		}
	}
	{
		MidiNote = 54
		Scr = Jumbotron_SetOverride
		params = {
			focus = Drummer
		}
	}
	{
		MidiNote = 55
		Scr = Jumbotron_SetOverride
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
			type = Orbit_Low
			sync
		}
	}
	{
		MidiNote = 75
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_Orbits'
			changenow
			type = Orbit_High
			sync
		}
	}
	{
		MidiNote = 57
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_Verts_Front'
			changenow
			type = verts_front
			sync
		}
	}
	{
		MidiNote = 58
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_Verts_Rear'
			changenow
			type = verts_rear
			sync
		}
	}
	{
		MidiNote = 60
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_G_across_stage'
			changenow
			type = G_across_stage
			sync
		}
	}
	{
		MidiNote = 61
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_S_across_stage'
			changenow
			type = S_across_stage
			sync
		}
	}
	{
		MidiNote = 90
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_moments'
			changenow
			name = Moment01
			sync
		}
	}
	{
		MidiNote = 91
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_moments'
			changenow
			name = Moment02
			sync
		}
	}
	{
		MidiNote = 92
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_moments'
			changenow
			name = Moment03
			sync
		}
	}
	{
		MidiNote = 93
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_moments'
			changenow
			name = Moment04
			sync
		}
	}
	{
		MidiNote = 94
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_moments'
			changenow
			name = Moment05
			sync
		}
	}
	{
		MidiNote = 95
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_moments'
			changenow
			name = Moment06
			sync
		}
	}
	{
		MidiNote = 96
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_moments'
			changenow
			name = Moment07
			sync
		}
	}
	{
		MidiNote = 97
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_moments'
			changenow
			name = Moment08
			sync
		}
	}
	{
		MidiNote = 98
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_moments'
			changenow
			name = Moment09
			sync
		}
	}
	{
		MidiNote = 99
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_moments'
			changenow
			name = Moment10
			sync
		}
	}
]
autocut_camera_table = [
	{
		Camera = 8
		exclusions = [
			8
		]
	}
	{
		Camera = 10
		exclusions = [
			10
		]
	}
	{
		Camera = 11
		exclusions = [
			11
			16
			21
			26
			31
		]
	}
	{
		Camera = 13
		exclusions = [
			13
		]
	}
	{
		Camera = 15
		exclusions = [
			15
		]
	}
	{
		Camera = 16
		exclusions = [
			16
			11
			21
			26
			31
		]
	}
	{
		Camera = 18
		exclusions = [
			18
		]
	}
	{
		Camera = 20
		exclusions = [
			20
		]
	}
	{
		Camera = 21
		exclusions = [
			21
			11
			16
			26
			31
		]
	}
	{
		Camera = 23
		exclusions = [
			23
		]
	}
	{
		Camera = 25
		exclusions = [
			25
		]
	}
	{
		Camera = 26
		exclusions = [
			26
			11
			16
			21
			31
		]
	}
	{
		Camera = 28
		exclusions = [
			28
		]
	}
	{
		Camera = 29
		exclusions = [
			29
		]
	}
	{
		Camera = 30
		exclusions = [
			30
			43
		]
	}
	{
		Camera = 31
		exclusions = [
			31
			11
			16
			21
			26
		]
	}
	{
		Camera = 43
		exclusions = [
			43
			30
		]
	}
	{
		Camera = 48
		exclusions = [
			48
		]
	}
	{
		Camera = 60
		exclusions = [
			60
			61
		]
	}
	{
		Camera = 61
		exclusions = [
			61
			60
		]
	}
]
initial_autocut_camera = 31
last_camera_array_entry = 0
debug_use_autocut_array = false

script cameracuts_iterator 
	if ($Cheat_FocusMode = 1 || $calibrate_lag_enabled = 1 || $medley_mode_on)
		return
	endif
	if NOT SongFileManager func = has_perf_file song_name = <song_name>
		return
	endif
	SongFileManager func = get_num_autocut_cams song_name = <song_name>
	if (<num_cameras> = 0)
		return
	else
		<array_size> = <num_cameras>
	endif
	printf qs(0x3e5ffa5b) d = <time_offset> channel = events
	Change \{CameraCuts_NextNoteCameraTime = -1}
	SetupInitialSongHandCamParams <...>
	SetNoteMappings \{section = Cameras
		mapping = $CameraCuts_NoteMapping}
	use_moment_cameras = false
	if should_play_moments
		SongFileManager func = get_num_moment_cams song_name = <song_name>
		if (<num_cameras> > 0)
			moment_array_size = <num_cameras>
			moment_array_entry = 0
			use_moment_cameras = true
		endif
	endif
	array_entry = 0
	Change \{last_camera_array_entry = 0}
	GetSongTimeMs time_offset = <time_offset>
	begin
	SongFileManager func = get_autocut_cam_time song_name = <song_name> index = <array_entry>
	if ((<time> - <skipleadin>) < <camera_time>)
		break
	endif
	<array_entry> = (<array_entry> + 1)
	repeat <array_size>
	if (<array_entry> >= <array_size>)
		Change \{CameraCuts_NextNoteCameraTime = -1}
		return
	endif
	Change last_camera_array_entry = <array_entry>
	if (<use_moment_cameras> = true)
		begin
		SongFileManager func = get_moment_cam_time song_name = <song_name> index = <moment_array_entry>
		if ((<time> - <skipleadin>) < <camera_time>)
			break
		endif
		<moment_array_entry> = (<moment_array_entry> + 1)
		repeat <moment_array_size>
		if (<moment_array_entry> >= <moment_array_size>)
			use_moment_cameras = false
		endif
	endif
	begin
	SongFileManager func = get_autocut_cam_time song_name = <song_name> index = <array_entry>
	next_camera_time = <camera_time>
	next_note_entry = <array_entry>
	next_time = <next_camera_time>
	next_type_call = get_autocut_cam_data
	playing_moment_camera = false
	if (<use_moment_cameras> = true)
		if (<moment_array_entry> >= <moment_array_size>)
			use_moment_cameras = false
		else
			SongFileManager func = get_moment_cam_time song_name = <song_name> index = <moment_array_entry>
			next_moment_camera_time = <camera_time>
			if (<next_moment_camera_time> <= <next_camera_time>)
				next_type_call = get_moment_cam_data
				next_time = <next_moment_camera_time>
				next_note_entry = <moment_array_entry>
				playing_moment_camera = true
			endif
		endif
	endif
	Change CameraCuts_NextNoteCameraTime = (<next_time> - <time_offset>)
	begin
	GetSongTimeMs time_offset = <time_offset>
	if (<time> >= <next_time>)
		break
	endif
	wait \{1
		gameframe}
	repeat
	SongFileManager func = <next_type_call> song_name = <song_name> index = <next_note_entry>
	if ($CameraCuts_AllowNoteScripts = true)
		if GetNoteMapping section = Cameras note = <note>
			clip_get_time_and_frame
			spawnscriptnow (<note_data>.Scr) params = {(<note_data>.params) length = <length>}
		endif
	endif
	Change last_camera_array_entry = <array_entry>
	if (<playing_moment_camera> = true)
		<moment_array_entry> = (<moment_array_entry> + 1)
		end_moment_camera_time = (<next_time> + <length>)
		allowed_error = 100
		end_moment_camera_time = (<end_moment_camera_time> - <allowed_error>)
		begin
		SongFileManager func = get_autocut_cam_time song_name = <song_name> index = <array_entry>
		if (<camera_time> >= <end_moment_camera_time>)
			break
		endif
		<array_entry> = (<array_entry> + 1)
		if (<array_entry> >= <array_size>)
			Change \{CameraCuts_NextNoteCameraTime = -1}
			return
		endif
		repeat
	else
		<array_entry> = (<array_entry> + 1)
		if (<array_entry> >= <array_size>)
			Change \{CameraCuts_NextNoteCameraTime = -1}
			return
		endif
	endif
	repeat
	Change \{CameraCuts_NextNoteCameraTime = -1}
endscript

script autocut_cameracuts_iterator 
	printf \{channel = marccam
		qs(0xb6bce4db)}
	if ($Cheat_FocusMode = 1 || $calibrate_lag_enabled = 1 || $medley_mode_on)
		printf \{channel = marccam
			qs(0x5715daba)}
		return
	endif
	GetArraySize \{$AutoCut_CameraArray}
	if (<array_size> = 0)
		ScriptAssert \{'autocut camera array is empty!'}
		return
	endif
	Change \{CameraCuts_NextNoteCameraTime = -1}
	SetupInitialSongHandCamParams <...>
	SetNoteMappings \{section = Cameras
		mapping = $CameraCuts_NoteMapping}
	array_entry = 0
	Change \{last_camera_array_entry = 0}
	GetSongTimeMs time_offset = <time_offset>
	begin
	camera_time = ($AutoCut_CameraArray [<array_entry>])
	if ((<time> - <skipleadin>) < <camera_time>)
		break
	endif
	<array_entry> = (<array_entry> + 2)
	repeat (<array_size> / 2)
	printf channel = marccam qs(0x4e3b437d) a = <array_size>
	if (<array_entry> >= <array_size>)
		Change \{CameraCuts_NextNoteCameraTime = -1}
		return
	endif
	Change last_camera_array_entry = <array_entry>
	begin
	next_camera_time = ($AutoCut_CameraArray [<array_entry>])
	next_note_value = ($AutoCut_CameraArray [<array_entry> + 1])
	next_time = <next_camera_time>
	next_type = AutocutCameras
	DecompressNoteValue note_value = <next_note_value>
	Change CameraCuts_NextNoteCameraTime = (<next_time> - <time_offset>)
	begin
	GetSongTimeMs time_offset = <time_offset>
	if (<time> >= <next_time>)
		break
	endif
	wait \{1
		gameframe}
	repeat
	if ($CameraCuts_AllowNoteScripts = true)
		if GetNoteMapping section = Cameras note = <note>
			clip_get_time_and_frame
			spawnscriptnow (<note_data>.Scr) params = {(<note_data>.params) length = <length>}
		endif
	endif
	Change last_camera_array_entry = <array_entry>
	<array_entry> = (<array_entry> + 2)
	if (<array_entry> >= <array_size>)
		printf \{channel = marccam
			qs(0xc8e34a34)}
		Change \{CameraCuts_NextNoteCameraTime = -1}
		return
	endif
	repeat
	Change \{CameraCuts_NextNoteCameraTime = -1}
endscript

script CameraCuts_GetNextNoteCameraTime 
	return camera_time = ($CameraCuts_NextNoteCameraTime)
endscript

script CameraCuts_SetArray \{type = good
		array = Default_Cameras_Good}
	if (<type> = good)
		Change CameraCuts_Good_Array = $<array>
	endif
	if (<type> = medium)
		Change CameraCuts_Normal_Array = $<array>
	endif
	if (<type> = poor)
		Change CameraCuts_Poor_Array = $<array>
	endif
endscript

script CameraCuts_SetParams \{performance = medium}
	Change CameraCuts_Performance = <performance>
endscript

script SetupInitialSongHandCamParams 
	SetSongHandCamParams amplitudePosition = ($default_handcam_amplitudePosition) amplituderotation = ($default_handcam_amplitudeRotation)
	GetSongTimeMs time_offset = <time_offset>
	if (<time> < 0)
		get_song_prefix song = <song_name>
		FormatText checksumname = event_array '%s_performance' s = <song_prefix>
		if NOT GlobalExists name = <event_array>
			ScriptAssert '$%e does not exist' e = <event_array>
			return
		endif
		index = 0
		GetArraySize $<event_array>
		if (<array_size> > 0)
			begin
			if ($<event_array> [<index>].time < 100)
				if ($<event_array> [<index>].Scr = SetSongHandCamParams)
					SetSongHandCamParams ($<event_array> [<index>].params)
					break
				endif
			else
				break
			endif
			index = (<index> + 1)
			repeat <array_size>
		endif
	endif
endscript

script SetSongHandCamParams 
	if GotParam \{amplitudePosition}
		Change handcam_amplitudePosition = <amplitudePosition>
	endif
	if GotParam \{amplituderotation}
		Change handcam_amplitudeRotation = <amplituderotation>
	endif
endscript

script is_playing_instrument 
	i = 0
	begin
	switch <i>
		case 0
		musician_info = musician1_info
		case 1
		musician_info = musician2_info
		case 2
		musician_info = musician3_info
		case 3
		musician_info = musician4_info
	endswitch
	if (($<musician_info>.position) = <position>)
		if (($<musician_info>.part) = <instrument>)
			return \{true}
		endif
		return \{false}
	endif
	i = (<i> + 1)
	repeat 4
	return \{false}
endscript

script adjust_cameras_for_alt_closeups 
	use_alt_cams = false
	switch <type>
		case Guitarist_CloseUp
		if is_playing_instrument \{position = Guitarist
				instrument = Drum}
			use_alt_cams = true
		endif
		case Bassist_CloseUp
		if is_playing_instrument \{position = Bassist
				instrument = Drum}
			use_alt_cams = true
		endif
		case Singer_CloseUp
		if is_playing_instrument \{position = Vocalist
				instrument = Drum}
			use_alt_cams = true
		endif
		case Drummer_CloseUp
		if NOT is_playing_instrument \{position = Drummer
				instrument = Drum}
			use_alt_cams = true
		endif
		case Drummer_Stage
		if NOT is_playing_instrument \{position = Drummer
				instrument = Drum}
			use_alt_cams = true
		endif
		case S_across_stage
		if is_playing_instrument \{position = Guitarist
				instrument = Drum}
			use_alt_cams = true
		endif
		if is_playing_instrument \{position = Bassist
				instrument = Drum}
			use_alt_cams = true
		endif
		if is_playing_instrument \{position = Vocalist
				instrument = Drum}
			use_alt_cams = true
		endif
		case G_across_stage
		if is_playing_instrument \{position = Guitarist
				instrument = Drum}
			use_alt_cams = true
		endif
		if is_playing_instrument \{position = Bassist
				instrument = Drum}
			use_alt_cams = true
		endif
		if is_playing_instrument \{position = Vocalist
				instrument = Drum}
			use_alt_cams = true
		endif
	endswitch
	if (<use_alt_cams> = true)
		prefix = 'Cameras_NonStandardCloseups'
	else
	endif
	return prefix = <prefix>
endscript

script CameraCuts_SetArrayPrefix \{prefix = 'cameras'
		type = None
		name = None
		length = 0}
	if NOT ($debug_camera_array = None)
		return
	endif
	if GotParam \{sync}
		wait_for_next_odd_frame
	endif
	adjust_cameras_for_alt_closeups <...>
	Change CameraCuts_ArrayPrefix = <prefix>
	Change CameraCuts_ForceType = <type>
	Change CameraCuts_NextName = <name>
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
	GetNumPlayersInGame
	if (<num_players> = 2)
		FormatText checksumname = cameras_array '%s_%p_%c_2p' p = $CameraCuts_ArrayPrefix c = <perf> s = <pakname>
		if GlobalExists name = <cameras_array> type = array
			CameraCuts_SetArray type = <perf_checksum> array = <cameras_array>
			return
		endif
		FormatText checksumname = cameras_array '%s_%p_2p' p = $CameraCuts_ArrayPrefix s = <pakname>
		if GlobalExists name = <cameras_array> type = array
			CameraCuts_SetArray type = <perf_checksum> array = <cameras_array>
			return
		endif
	endif
	FormatText checksumname = cameras_array '%s_%p_%c' p = $CameraCuts_ArrayPrefix c = <perf> s = <pakname>
	if GlobalExists name = <cameras_array> type = array
		CameraCuts_SetArray type = <perf_checksum> array = <cameras_array>
		return
	endif
	FormatText checksumname = cameras_array '%s_%p' p = $CameraCuts_ArrayPrefix s = <pakname>
	if GlobalExists name = <cameras_array> type = array
		CameraCuts_SetArray type = <perf_checksum> array = <cameras_array>
		return
	endif
	FormatText checksumname = cameras_array '%s_%p_%c' p = $CameraCuts_ArrayPrefix c = <perf> s = 'default'
	if GlobalExists name = <cameras_array> type = array
		CameraCuts_SetArray type = <perf_checksum> array = <cameras_array>
		return
	endif
	FormatText \{checksumname = cameras_array
		'%s_%p'
		p = $CameraCuts_ArrayPrefix
		s = 'default'}
	if GlobalExists name = <cameras_array> type = array
		CameraCuts_SetArray type = <perf_checksum> array = <cameras_array>
		return
	endif
	printstruct <...> prefix = ($CameraCuts_ArrayPrefix)
	ScriptAssert \{qs(0xce687931)}
endscript

script set_defaultcameracuts 
	set_defaultcameracut_perf \{perf = 'good'
		perf_checksum = good}
	set_defaultcameracut_perf \{perf = 'normal'
		perf_checksum = medium}
	set_defaultcameracut_perf \{perf = 'poor'
		perf_checksum = poor}
endscript
camera_cut_playing = 0
camera_cut_played = 0

script wait_for_play_camera_to_complete 
	begin
	if ($camera_cut_playing = 0)
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script play_cameracut \{prefix = 'cameras_no_band'
		transition_time = 5}
	if NOT GotParam \{from_switch_to_no_band_camera}
		killspawnedscript \{name = switch_to_no_band_camera}
	endif
	Change \{CameraCuts_Preprocess_AutoCameras = false}
	Change \{camera_cut_played = 1}
	wait_for_play_camera_to_complete
	spawnscriptnow play_cameracut_spawned params = {<...>}
endscript

script stop_cameracut 
	if ($camera_cut_played = 0)
		return
	endif
	wait_for_play_camera_to_complete
	KillCamAnim \{name = CameraCutCam}
	restore_dummy_bg_camera
	Change \{camera_cut_played = 0}
endscript

script play_cameracut_spawned 
	Change \{camera_cut_playing = 1}
	FinalPrintf qs(0xef2a969b) s = <prefix> t = $CameraCuts_Init d = $debug_camera_array
	KillCamAnim \{all}
	create_cameracuts initial_params = {prefix = <prefix> length = <transition_time> changenow} extra_params = {force_time = <transition_time>} Play_hold = 1
	wait \{4
		gameframes}
	CameraCuts_EnableChangeCam \{enable = false}
	destroy_cameracuts \{leave_camera_playing}
	Change \{camera_cut_playing = 0}
endscript

script create_cameracuts \{extra_params = {
		}
		Play_hold = 0
		in_game = 0}
	if ($CameraCuts_Init = true)
		return
	else
		Change \{CameraCuts_Init = true}
	endif
	kill_dummy_bg_camera
	reset_cameracuts_internal_vars in_game = <in_game>
	if ($CameraCuts_Preprocess_AutoCameras = true)
		build_autocut_camera_array in_game = <in_game>
	endif
	if GotParam \{initial_params}
		CameraCuts_SetArrayPrefix <initial_params>
	endif
	CameraCuts_StartCallback extra_params = <extra_params> Play_hold = <Play_hold>
endscript

script reset_cameracuts_internal_vars 
	if ($CameraCuts_Init = false)
		ScriptAssert \{qs(0xa13a9b7f)}
	endif
	Change \{CameraCuts_ArrayPrefix = 'cameras'}
	set_defaultcameracuts
	Change \{CameraCuts_LastType = None}
	Change \{CameraCuts_LastDownbeatIndex = 0}
	Change \{CameraCuts_ForceChangeTime = 0.0}
	Change \{CameraCuts_ForceType = None}
	Change \{CameraCuts_NextName = None}
	Change \{CameraCuts_Preprocess_AutoCameras = false}
	<jam_song> = 0
	if is_current_song_a_jam_session
		ui_event_get_top
		if (<in_game> = 1)
			<jam_song> = 1
		endif
	endif
	if ($game_mode = tutorial || $game_mode = practice)
		Change \{CameraCuts_ChangeCamEnable = false}
		Change \{CameraCuts_AllowNoteScripts = false}
	elseif ($game_mode = p2_pro_faceoff)
		Change \{CameraCuts_ChangeCamEnable = true}
		Change \{CameraCuts_AllowNoteScripts = false}
	elseif (<jam_song> = 1)
		Change \{CameraCuts_ChangeCamEnable = true}
		Change \{CameraCuts_AllowNoteScripts = true}
		Change \{CameraCuts_Preprocess_AutoCameras = true}
	else
		Change \{CameraCuts_ChangeCamEnable = true}
		Change \{CameraCuts_AllowNoteScripts = true}
	endif
	Change \{CameraCuts_Enabled = true}
endscript

script CameraCuts_GetNextDownbeat 
	GMan_SongTool_GetCurrentSong
	get_song_prefix song = <current_song>
	FormatText checksumname = event_array '%s_lightshow_notes' s = <song_prefix> AddToStringLookup = true
	if NOT GlobalExists name = <event_array> type = array
		return false endtime = <endtime>
	endif
	GetArraySize $<event_array>
	array_count = ($CameraCuts_LastDownbeatIndex)
	array_size = (<array_size> - <array_count>)
	array_size = (<array_size> / 2)
	if (<array_size> > 0)
		begin
		DecompressNoteValue note_value = ($<event_array> [(<array_count> + 1)])
		if (<note> = 58 || <note> = 57)
			if ($<event_array> [<array_count>] > <endtime>)
				Change CameraCuts_LastDownbeatIndex = <array_count>
				return true endtime = ($<event_array> [<array_count>])
			endif
		endif
		array_count = (<array_count> + 2)
		repeat <array_size>
	endif
	printf \{channel = clip
		qs(0x29017cad)}
	return false endtime = <endtime>
endscript

script CameraCuts_StartCallback \{extra_params = {
		}
		Play_hold = 0}
	Change \{CameraCuts_ChangeNow = false}
	if ($CameraCuts_Enabled = false)
		return
	endif
	if ($CameraCuts_Performance = poor)
		camera_array = CameraCuts_Poor_Array
	else
		if ($CameraCuts_Performance = good)
			camera_array = CameraCuts_Good_Array
		else
			camera_array = CameraCuts_Normal_Array
		endif
	endif
	if NOT ($CameraCuts_NextName = None)
		CameraCut_GetArraySize camera_array = <camera_array> name = ($CameraCuts_NextName) target_node = <target_node>
	elseif NOT ($CameraCuts_ForceType = None)
		CameraCut_GetArraySize camera_array = <camera_array> includetype = $CameraCuts_ForceType target_node = <target_node>
	elseif ($game_mode = p2_pro_faceoff)
		CameraCut_GetArraySize camera_array = <camera_array> excludename = $CameraCuts_LastName target_node = <target_node>
	else
		if is_current_song_a_jam_session
			CameraCut_GetArraySize camera_array = <camera_array> excludename = $CameraCuts_LastName target_node = <target_node>
		else
			CameraCut_GetArraySize camera_array = <camera_array> excludetype = $CameraCuts_LastType target_node = <target_node>
		endif
	endif
	if (<array_size> = 0)
		newIndex = 0
	else
		GetRandomValue name = newIndex integer a = 0 b = (<array_size> - 1)
		CameraCut_GetCameraIndex camera_array = <camera_array> newIndex = <newIndex>
	endif
	debug_flags = None
	if NOT ($debug_camera_array = None)
		select_cameracut_video_end
		found = 0
		FormatText \{checksumname = New_Camera_Array
			'%s_%p'
			s = $debug_camera_array_pakname
			p = $debug_camera_array}
		if GlobalExists name = <New_Camera_Array>
			GetArraySize $<New_Camera_Array>
			index = ($debug_camera_array_count)
			if (<index> < <array_size>)
				camera_array = <New_Camera_Array>
				newIndex = ($debug_camera_array_count)
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
	Change CameraCuts_LastArray = $<camera_array>
	Change \{CameraCuts_LastPerformance = $CameraCuts_Performance}
	Change CameraCuts_LastIndex = <newIndex>
	CameraCut_SaveSelectedParams
	if ($CameraCuts_EnableVideoVenueCams = 1)
		FindVideoVenueCam <...>
	endif
	if ($debug_showcameraname = on)
		CameraCuts_UpdateDebugCameraName
	endif
	if ($output_gpu_log = 1)
		CameraCuts_OutputGPULog
	endif
	if StructureContains structure = ($<camera_array> [<newIndex>]) params
		camStruct = (($<camera_array> [<newIndex>]).params)
		if NOT StructureContains structure = <camStruct> DOF
			camStruct = ($<camera_array> [<newIndex>])
		endif
	else
		camStruct = ($<camera_array> [<newIndex>])
	endif
	if StructureContains structure = <camStruct> DOF
		if StructureContains structure = (<camStruct>.DOF) screen_fx
			dofType = (<camStruct>.DOF)
			dofParam = (<dofType>.screen_fx [0])
		endif
	else
		dofParam = ($DOF_Off_TOD_Manager.screen_fx [0])
	endif
	spawnscriptnow ApplyDeferredDOF params = {dofParam = <dofParam>}
	if StructureContains structure = ($<camera_array> [<newIndex>]) crowdoff
		enable_crowd_models_cfunc \{active = false}
	else
		enable_crowd_models_cfunc \{active = true}
	endif
	if StructureContains structure = ($<camera_array> [<newIndex>]) ShadowCasters
		Change CameraCuts_ShadowCasters = ($<camera_array> [<newIndex>].ShadowCasters)
	else
		Change \{CameraCuts_ShadowCasters = None}
	endif
	BandManager_NotifyAllOfCameraCut
	GetSongTimeMs
	Change CameraCuts_LastCameraStartTime = <time>
	if ($display_clip_info = true)
		clip_get_time_and_frame
		printf channel = clip qs(0xbb73757a) a = <time_string>
	endif
	CamParams = ($<camera_array> [<newIndex>])
	CameraCut_RemapBandMemberLookAts
	if StructureContains structure = <camStruct> name
		camera_name = (<camStruct>.name)
	else
		camera_name = $CameraCuts_NextName
	endif
	prepare_mocap_lock_target Camera = <camera_name>
	if ($CameraCuts_NextExtraParamsSet = 1)
		Change \{CameraCuts_NextExtraParamsSet = 0}
		extra_params = $CameraCuts_NextExtraParams
	endif
	PlayIGCCam {
		time = <camera_time>
		viewport = bg_viewport
		controlscript = CameraCuts_StaticCamControl
		params = {CamParams = <CamParams>}
		far_clip = 500.0
		<CamParams>
		exitscript = CameraCuts_StartCallback
		Play_hold = <Play_hold>
		name = CameraCutCam
		<debug_flags>
		extra_params = <extra_params>
	}
	dynamic_ad_update_camera_ok_for_ad_flag
endscript

script get_musician_mocap_lock_target 
	get_musician_id name = <name>
	FormatText TextName = suffix '_mocap_lock_target_0%a' a = <Camera>
	ExtendCrc <name> <suffix> out = lock_target
	return lock_target = <lock_target>
endscript

script prepare_mocap_lock_target 
	switch <Camera>
		case Guitarist_Mocap01
		get_musician_mocap_lock_target \{name = Guitarist
			Camera = 1}
		case Guitarist_Mocap02
		get_musician_mocap_lock_target \{name = Guitarist
			Camera = 2}
		case Bassist_Mocap01
		get_musician_mocap_lock_target \{name = Bassist
			Camera = 1}
		case Bassist_Mocap02
		get_musician_mocap_lock_target \{name = Bassist
			Camera = 2}
		case Singer_Mocap01
		get_musician_mocap_lock_target \{name = Vocalist
			Camera = 1}
		case Singer_Mocap02
		get_musician_mocap_lock_target \{name = Vocalist
			Camera = 2}
		case Drummer_Mocap01
		get_musician_mocap_lock_target \{name = Drummer
			Camera = 1}
		case Drummer_Mocap02
		get_musician_mocap_lock_target \{name = Drummer
			Camera = 2}
		case Moment01
		lock_target = moment_cam_lock_target_01
		case Moment02
		lock_target = moment_cam_lock_target_02
		case Moment03
		lock_target = moment_cam_lock_target_03
		case Moment04
		lock_target = moment_cam_lock_target_04
		case Moment05
		lock_target = moment_cam_lock_target_05
		case Moment06
		lock_target = moment_cam_lock_target_06
		case Moment07
		lock_target = moment_cam_lock_target_07
		case Moment08
		lock_target = moment_cam_lock_target_08
		case Moment09
		lock_target = moment_cam_lock_target_09
		case Moment10
		lock_target = moment_cam_lock_target_10
		default
		return
	endswitch
	if CompositeObjectExists name = <lock_target>
		<lock_target> :anim_update active_camera_override = true
	endif
endscript

script FindVideoVenueCam 
	ExtendCrc <camera_array> '_video_venue' out = Camera_Array_Video_Venue
	if GlobalExists name = <Camera_Array_Video_Venue>
		if StructureContains structure = ($<camera_array> [<newIndex>]) name
			name = ($<camera_array> [<newIndex>].name)
			GetArraySize ($<Camera_Array_Video_Venue>)
			index_vv = 0
			begin
			if ($<Camera_Array_Video_Venue> [<index_vv>].name = <name>)
				return camera_array = <Camera_Array_Video_Venue> newIndex = <index_vv>
			endif
			index_vv = (<index_vv> + 1)
			repeat <array_size>
		endif
	endif
	return
endscript

script ApplyDeferredDOF 
	wait_for_next_even_frame
	wait \{1
		gameframe}
	if ($game_mode = tutorial || $game_mode = practice)
		return
	endif
	if NOT ScreenFX_FXInstanceExists \{viewport = bg_viewport
			name = Depth_of_Field__simplified_}
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
	Lightshow_ApplyAppropriateToneMap
endscript

script CameraCuts_UpdateDebugCameraName 
	if NOT ScreenElementExists \{id = debug_camera_name_text}
		CreateScreenElement \{type = TextElement
			parent = root_window
			id = debug_camera_name_text
			font = debug
			Pos = (640.0, 32.0)
			just = [
				center
				top
			]
			scale = 1.0
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
		CreateScreenElement \{type = TextElement
			parent = root_window
			id = debug_camera_name_text2
			font = debug
			Pos = (640.0, 70.0)
			just = [
				center
				top
			]
			scale = 1.0
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
	if ($CameraCuts_Init = true)
		GetArraySize ($CameraCuts_LastArray)
		if ($CameraCuts_LastIndex < <array_size>)
			if StructureContains structure = (($CameraCuts_LastArray) [$CameraCuts_LastIndex]) params
				if StructureContains structure = (($CameraCuts_LastArray) [$CameraCuts_LastIndex].params) name
					cameraname_crc = ($CameraCuts_LastArray [$CameraCuts_LastIndex].params.name)
				endif
			endif
			if StructureContains structure = (($CameraCuts_LastArray) [$CameraCuts_LastIndex]) name
				cameraname_crc = ($CameraCuts_LastArray [$CameraCuts_LastIndex].name)
			endif
			if StructureContains structure = ($CameraCuts_LastArray [$CameraCuts_LastIndex]) crowdoff
				<Crowd> = 0
			endif
			if (<cameraname_crc> = None)
				if StructureContains structure = (($CameraCuts_LastArray) [$CameraCuts_LastIndex]) controlscript
					cameraname_crc = ($CameraCuts_LastArray [$CameraCuts_LastIndex].controlscript)
				endif
			endif
		endif
	endif
	jumbotronname = ''
	if NOT ($current_jumbotron = None)
		current_index = ($jumbotron_camera_index)
		if StructureContains structure = (($jumbotron_camera_params) [<current_index>]) params
			if StructureContains structure = (($jumbotron_camera_params) [<current_index>].params) name
				jumbotronname = (($jumbotron_camera_params) [<current_index>].params.name)
			endif
		endif
		if StructureContains structure = (($jumbotron_camera_params) [<current_index>]) name
			jumbotronname = (($jumbotron_camera_params) [<current_index>].name)
		endif
	endif
	FormatText TextName = cameraname qs(0x4558200d) s = <cameraname_crc> t = $CameraCuts_LastType c = <Crowd> DontAssertForChecksums DoNotResolve
	debug_camera_name_text :SE_SetProps text = <cameraname>
	printf qs(0x4771a1ab) s = <cameraname>
	cameraname = qs(0x00000000)
	if NOT (<jumbotronname> = '')
		FormatText TextName = cameraname qs(0x96316117) DontAssertForChecksums DoNotResolve j = <jumbotronname>
	endif
	debug_camera_name_text2 :SE_SetProps text = <cameraname>
endscript

script CameraCuts_OutputGPULog 
	GetArraySize ($CameraCuts_LastArray)
	cameraname = None
	if ($CameraCuts_LastIndex < <array_size>)
		if StructureContains structure = (($CameraCuts_LastArray) [$CameraCuts_LastIndex]) params
			if StructureContains structure = (($CameraCuts_LastArray) [$CameraCuts_LastIndex].params) name
				cameraname = ($CameraCuts_LastArray [$CameraCuts_LastIndex].params.name)
			endif
		endif
		if StructureContains structure = (($CameraCuts_LastArray) [$CameraCuts_LastIndex]) name
			cameraname = ($CameraCuts_LastArray [$CameraCuts_LastIndex].name)
		endif
	endif
	<Crowd> = 1
	if StructureContains structure = ($CameraCuts_LastArray [$CameraCuts_LastIndex]) crowdoff
		<Crowd> = 0
	endif
	FormatText TextName = text qs(0x735757ef) s = <cameraname> t = $CameraCuts_LastType c = <Crowd> DontAssertForChecksums
	TextOutput text = <text>
endscript
AutoCut_CameraArray = [
]
AutoCut_TempoArray = [
]

script build_autocut_camera_array \{in_game = 0}
	printf \{channel = marccam
		qs(0x86963ea0)}
	Change \{AutoCut_CameraArray = [
		]}
	printf \{channel = cameratest
		qs(0x2795cf95)}
	GMan_SongTool_GetCurrentSong
	SongFileManager func = get_num_fretbar_notes song_name = <current_song>
	fretbar_array_size = (<num_fretbar_notes> - 1)
	printf channel = marccam qs(0xff841032) a = <fretbar_array_size>
	first_camera_note = 28
	last_camera_note = 31
	num_weights = ((<last_camera_note> - <first_camera_note>) + 1)
	GetArraySize \{$autocut_camera_table}
	num_cameras_available = <array_size>
	num_weights = <num_cameras_available>
	slow_med = (($slow_tempo + $med_tempo) * 0.5)
	med_fast = (($med_tempo + $fast_tempo) * 0.5)
	array = []
	begin
	AddArrayElement array = <array> element = 1.0
	repeat <num_cameras_available>
	weights = <array>
	array = []
	begin
	AddArrayElement array = <array> element = 0.0
	repeat <num_cameras_available>
	percent = <array>
	array = []
	begin
	AddArrayElement array = <array> element = 0.0
	repeat <num_cameras_available>
	dbg_percent = <array>
	array = []
	old_anim_speed = undefined
	array_entry = 0
	last_cut_time = 0
	max_time = 0
	last_note = -1
	last_length = -1
	last_velocity = 100
	temp_weights = <weights>
	is_first_camera = true
	begin
	SongFileManager func = get_fretbar_note song_name = <current_song> index = <array_entry>
	time1 = <fretbar_time>
	SongFileManager func = get_fretbar_note song_name = <current_song> index = (<array_entry> + 1)
	time2 = <fretbar_time>
	time_diff = (<time2> - <time1>)
	new_tempo = ((1000.0 / <time_diff>) * 60.0)
	if (<new_tempo> > <med_fast>)
		anim_speed = FAST
		anim_tempo = $fast_tempo
	elseif (<new_tempo> > <slow_med>)
		anim_speed = med
		anim_tempo = $med_tempo
	else
		anim_speed = slow
		anim_tempo = $slow_tempo
	endif
	forcecut = false
	if ((<time1> > <max_time>) || (<time1> = 0))
		forcecut = true
		min_delay = 2000
		max_delay = 4000
		min_beats = 4
		max_beats = 8
		GetRandomValue a = <min_beats> b = <max_beats> name = num_beats integer
		next_index = (<array_entry> + <num_beats>)
		if (<next_index> >= <fretbar_array_size>)
			next_index = (<fretbar_array_size> - 1)
		endif
		SongFileManager func = get_fretbar_note song_name = <current_song> index = <next_index>
		beat_time = <fretbar_time>
		max_time = <beat_time>
	endif
	if (<forcecut> = true)
		printf channel = cameratest qs(0x6e35572d) a = <time1>
		if (<is_first_camera> = true)
			i = 0
			begin
			next_cam = ($autocut_camera_table [<i>].Camera)
			if (<next_cam> = $initial_autocut_camera)
				selected_camera = <i>
				break
			endif
			i = (<i> + 1)
			if (<i> >= <num_cameras_available>)
				ScriptAssert \{qs(0xf6892073)}
				selected_camera = 0
			endif
			repeat
			is_first_camera = false
		else
			total = 0
			index = 0
			begin
			Weight = ((<temp_weights> [<index>]))
			total = (<total> + <Weight>)
			index = (<index> + 1)
			repeat <num_cameras_available>
			if (<total> = 0)
				ScriptAssert \{'Weight total is zero!'}
				return
			endif
			running_pct = 0
			index = 0
			begin
			normalized = ((<temp_weights> [<index>]) / <total>)
			running_pct = (<running_pct> + <normalized>)
			SetArrayElement arrayName = percent index = <index> newValue = <running_pct>
			SetArrayElement arrayName = dbg_percent index = <index> newValue = (<normalized> * 100)
			index = (<index> + 1)
			repeat <num_cameras_available>
			GetRandomValue \{a = 0
				b = 1
				name = random_pct}
			index = 0
			begin
			if (<random_pct> <= <percent> [<index>])
				break
			endif
			index = (<index> + 1)
			if (<index> >= (<num_cameras_available> -1))
				break
			endif
			repeat
			selected_camera = <index>
		endif
		index = 0
		begin
		max_weight_multiplier = 65536
		old_weight = (<weights> [<index>])
		if (<old_weight> = 0)
			new_weight = 1
		elseif (<old_weight> < <max_weight_multiplier>)
			new_weight = (<old_weight> * 2)
		endif
		SetArrayElement arrayName = weights index = <index> newValue = <new_weight>
		index = (<index> + 1)
		repeat <num_cameras_available>
		SetArrayElement arrayName = weights index = <selected_camera> newValue = 1
		temp_weights = <weights>
		exclusions = ($autocut_camera_table [<selected_camera>].exclusions)
		GetArraySize <exclusions>
		if (<array_size> > 0)
			index = 0
			begin
			next_excluded_camera = (<exclusions> [<index>])
			search_index = 0
			begin
			if (($autocut_camera_table [<search_index>].Camera) = <next_excluded_camera>)
				SetArrayElement arrayName = temp_weights index = <search_index> newValue = 0
				break
			endif
			search_index = (<search_index> + 1)
			if (<search_index> > <num_cameras_available>)
				break
			endif
			repeat
			index = (<index> + 1)
			repeat <array_size>
		endif
		camera_note = ($autocut_camera_table [<selected_camera>].Camera)
		printf qs(0xae6f4584) a = <camera_note> b = <selected_camera> c = <random_pct>
		if (<last_note> != -1)
			camera_velocity = <anim_tempo>
			printf channel = cameratest qs(0xb482ed0e) a = <camera_velocity>
			length = (<time1> - <last_time>)
			CastToInteger \{last_velocity}
			CompressNoteValue length = <length> note = <last_note> velocity = <last_velocity>
			AddArrayElement array = <array> element = <last_time>
			AddArrayElement array = <array> element = <note_value>
			old_anim_speed = <anim_speed>
			last_cut_time = <time1>
		endif
		last_time = <time1>
		last_note = <camera_note>
		last_velocity = <camera_velocity>
	endif
	array_entry = (<array_entry> + 1)
	if (<array_entry> > (<fretbar_array_size> - 2))
		break
	endif
	repeat <fretbar_array_size>
	length = 100
	CastToInteger \{last_velocity}
	CompressNoteValue length = <length> note = <last_note> velocity = <last_velocity>
	AddArrayElement array = <array> element = <time1>
	AddArrayElement array = <array> element = <note_value>
	Change AutoCut_CameraArray = <array>
	if (<in_game> = 1)
		return
	endif
	array = []
	array_entry = 0
	begin
	SongFileManager func = get_fretbar_note song_name = <current_song> index = <array_entry>
	time1 = <fretbar_time>
	SongFileManager func = get_fretbar_note song_name = <current_song> index = (<array_entry> + 1)
	time2 = <fretbar_time>
	time_diff = (<time2> - <time1>)
	tempo = ((1000.0 / <time_diff>) * 60.0)
	CastToInteger \{tempo}
	AddArrayElement array = <array> element = <time1>
	AddArrayElement array = <array> element = <tempo>
	array_entry = (<array_entry> + 1)
	repeat (<fretbar_array_size> - 2)
	Change AutoCut_TempoArray = <array>
	DumpAutocutArray
endscript

script destroy_cameracuts 
	Change \{CameraCuts_Init = false}
	Change \{CameraCuts_Enabled = false}
	killspawnedscript \{name = CameraCuts_StartCallback}
	killspawnedscript \{name = ApplyDeferredDOF}
	if NOT GotParam \{leave_camera_playing}
		KillCamAnim \{name = CameraCutCam}
	endif
	ClearNoteMappings \{section = Cameras}
	killspawnedscript \{name = cameracuts_iterator}
	killspawnedscript \{name = autocut_cameracuts_iterator}
	if NOT GotParam \{leave_camera_playing}
		restore_dummy_bg_camera
	endif
endscript
profiling_cameracuts = false

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
	FormatText checksumname = camera_array '%s_%p' s = <pakname> p = <suffix>
	if GlobalExists name = <camera_array>
		GetArraySize $<camera_array>
		array_count = 0
		begin
		profile_cameracut Camera_Array_pakname = <pakname> camera_array = <suffix> array_count = <array_count>
		<array_count> = (<array_count> + 1)
		repeat <array_size>
	endif
	camera_count = (<camera_count> + 1)
	repeat 6
	Change \{debug_camera_array = None}
	destroy_cameracuts
	wait \{3
		gameframes}
	create_cameracuts
	dumpprofileend output_text output_file FileName = <FileName>
	setslomo \{$current_speedfactor}
	setslomo_song \{slomo = $current_speedfactor}
	Change \{profiling_cameracuts = false}
endscript

script profile_cameracut 
	Change debug_camera_array = <camera_array>
	Change debug_camera_array_pakname = <Camera_Array_pakname>
	Change debug_camera_array_count = <array_count>
	cpu = $current_cpu
	ToggleMetrics \{mode = 2}
	Change \{current_cpu = 6}
	destroy_cameracuts
	wait \{2
		gameframes}
	create_cameracuts
	wait \{3
		gameframes}
	profile_camera_gpu
	ToggleMetrics \{mode = 0}
	Change current_cpu = <cpu>
endscript

script profile_camera_gpu 
	FormatText \{checksumname = New_Camera_Array
		'%s_%p'
		s = $debug_camera_array_pakname
		p = $debug_camera_array}
	camera_array = $<New_Camera_Array>
	if StructureContains structure = ($<camera_array> [$debug_camera_array_count]) name
		FormatText TextName = Title qs(0xba1fa8c6) n = (($<camera_array> [$debug_camera_array_count]).name) DontAssertForChecksums
	else
		FormatText TextName = Title qs(0xba1fa8c6) n = (($<camera_array> [$debug_camera_array_count]).params.name) DontAssertForChecksums
	endif
	dumpprofile cpu = 6 Title = <Title> current_time_only
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
ForceCameraChangeForFreeplayIntroFlag = false

script ForceCameraChangeForFreeplayIntro 
	GameMode_GetType
	if (<type> != freeplay)
		return
	endif
	Change \{ForceCameraChangeForFreeplayIntroFlag = true}
	Change \{CameraCuts_NextExtraParamsSet = 0}
endscript

script CameraCuts_WaitScript \{camera_time = 0
		camera_songtime = 0}
	if GotParam \{force_time}
		Change \{ForceCameraChangeForFreeplayIntroFlag = false}
		elapsed_time = 0.0
		begin
		if ($ForceCameraChangeForFreeplayIntroFlag = true)
			return \{true}
		endif
		GetDeltaTime
		<elapsed_time> = (<elapsed_time> + <delta_time>)
		if (<elapsed_time> > <force_time>)
			break
		endif
		wait \{1
			gameframe}
		repeat
		begin
		if ($CameraCuts_ChangeCamEnable = true)
			return \{true}
		endif
		wait \{1
			gameframe}
		repeat
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
	if GotParam \{nowait}
		return \{false}
	endif
	wait \{1
		gameframe}
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

script CameraCuts_BlockControl 
	CameraCuts_CalcTime force_time = <force_time>
	CCam_DoMorph {
		<...>
	}
	Block
endscript

script CameraCuts_HandCam \{name = None}
	CameraCuts_CalcTime force_time = <force_time>
	CCam_DoMorph
	zooming = false
	if GotParam \{type}
		if (<type> = Longshot)
			GetRandomValue \{name = random_value
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
		if (<type> = mid)
			GetRandomValue \{name = random_value
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
		amplituderotation = -0.01
	else
		amplitudePosition = ($handcam_amplitudePosition)
		amplituderotation = ($handcam_amplitudeRotation)
	endif
	CameraCuts_SetHandCamParams <...>
	CameraCuts_WaitScript camera_songtime = <camera_songtime> force_time = <force_time>
endscript

script CameraCuts_TwoCam 
	if GotParam \{UseHandCam}
		CameraCuts_SetHandCamParams {
			amplitudePosition = ($handcam_amplitudePosition)
			amplituderotation = ($handcam_amplitudeRotation)
		}
	endif
	if GotParam \{UseHandCamSmooth}
		CameraCuts_SetHandCamParams \{amplitudePosition = 0.05
			amplituderotation = -0.08}
	endif
	CameraCuts_CalcTime force_time = <force_time>
	CCam_DoMorph {
		<Cam1>
	}
	CameraCuts_WaitForMorphOrSongTime camera_songtime = <camera_songtime>
	CCam_DoMorph {
		<Cam2>
		time = <camera_time>
	}
	CameraCuts_WaitScript camera_songtime = <camera_songtime> force_time = <force_time>
endscript

script CameraCuts_WaitForMorphOrSongTime 
	RequireParams \{[
			camera_songtime
		]
		all}
	begin
	if CCam_IsMorphComplete
		return
	endif
	if CameraCuts_WaitScript camera_songtime = <camera_songtime> nowait
		Goto \{nullscript}
	endif
	wait \{1
		gameframes}
	repeat
endscript

script CameraCuts_WaitForTimeOrSongTime 
	RequireParams \{[
			camera_songtime
			seconds
		]
		all}
	ResetTimer
	begin
	if TimeGreaterThan <seconds>
		return
	endif
	if CameraCuts_WaitScript camera_songtime = <camera_songtime> nowait
		Goto \{nullscript}
	endif
	wait \{1
		gameframes}
	repeat
endscript

script CameraCuts_Encore 
	CameraCuts_CalcTime force_time = <force_time>
	CCam_DoMorph {
		<Cam1>
	}
	CameraCuts_WaitForTimeOrSongTime camera_songtime = <camera_songtime> seconds = 3
	CCam_DoMorph {
		<Cam2>
	}
	CameraCuts_WaitForTimeOrSongTime camera_songtime = <camera_songtime> seconds = 2.5
	CCam_DoMorph {
		<Cam3>
	}
	CameraCuts_WaitForTimeOrSongTime camera_songtime = <camera_songtime> seconds = 3
	CCam_DoMorph {
		<Cam4>
	}
	CameraCuts_WaitForTimeOrSongTime camera_songtime = <camera_songtime> seconds = 2
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
			CCam_Orbit \{off}
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
			CCam_Orbit \{off}
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
	CCam_SetSmoothing \{type = all
		on = 1
		slow_lerp_factor = 0.7
		fast_lerp_factor = 0.7
		lerp_dropoff = 2.0}
	CameraCuts_CalcTime force_time = <force_time>
	CCam_DoMorph {
		<Cam1>
	}
	CameraCuts_SetHandCamParams \{amplitudePosition = 0.0
		amplituderotation = -0.8}
	origpos = (<Cam1>.Pos)
	diry = <StepDir>
	count = 0.0
	timestep = 0.05
	step = (<timestep> / <StepTime>)
	num_jumps = <StepNum>
	dirx = ((<Cam2>.Pos) - (<Cam1>.Pos))
	printf qs(0xe5154443) i = <timestep> channel = igc
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
	if CameraCuts_WaitScript camera_songtime = <camera_songtime> nowait
		return
	endif
	if CCam_IsMorphComplete
		break
	endif
	wait \{1
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
	dofParam = (<dofType>.screen_fx [0])
	if NOT ScreenFX_FXInstanceExists \{viewport = bg_viewport
			name = Depth_of_Field__simplified_}
		ScreenFX_AddFXInstance {
			viewport = bg_viewport
			name = Depth_of_Field__simplified_
			<dofParam>
			time = <time>
		}
	else
		ScreenFX_UpdateFXInstanceParams {
			viewport = bg_viewport
			name = Depth_of_Field__simplified_
			<dofParam>
			time = <time>
		}
	endif
endscript

script CameraCuts_SetHandCamDriftOnly 
	CCam_EnableHandcam \{ShakeEnabled = false
		DriftEnabled = true}
	driftSlerpMap = [
		(0.1, 0.3)
		(0.2, 0.3)
	]
	if GotParam \{DriftZoneAngles}
		SetArrayElement arrayName = driftSlerpMap index = 1 newValue = <DriftZoneAngles>
	endif
	CCam_SetHandcamParams {
		$cinematic_camera_default_handcam_params
		driftSlerpMap = <driftSlerpMap>
	}
endscript

script CameraCuts_SetHandCamParams \{amplitudePosition = 0.01
		amplituderotation = -0.01}
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
		amplituderotation = {
			amplitude = <amplituderotation>
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
	zooming = false
	if (<zooming> = true)
		amplitudePosition = 0.01
		amplituderotation = -0.01
	else
		amplitudePosition = ($handcam_amplitudePosition)
		amplituderotation = ($handcam_amplitudeRotation)
	endif
	CameraCuts_SetHandCamParams <...>
	CameraCuts_WaitForTimeOrSongTime camera_songtime = <camera_songtime> seconds = 2
	CCam_DoMorph <...> FOV = 50 time = 0.6 motion = smooth
	CameraCuts_WaitForMorphOrSongTime camera_songtime = <camera_songtime>
	CameraCuts_WaitForTimeOrSongTime camera_songtime = <camera_songtime> seconds = 0.1
	CCam_DoMorph <...> FOV = 53 time = 0.25 motion = smooth
	CameraCuts_WaitForMorphOrSongTime camera_songtime = <camera_songtime>
	CameraCuts_WaitForTimeOrSongTime camera_songtime = <camera_songtime> seconds = 0.03
	CCam_DoMorph <...> FOV = 51 time = 0.3 motion = smooth
	CameraCuts_WaitForMorphOrSongTime camera_songtime = <camera_songtime>
	CCam_DoMorph <...> FOV = 51
	CameraCuts_CalcTime force_time = <force_time>
	CameraCuts_WaitScript camera_songtime = <camera_songtime> force_time = <force_time>
endscript

script CameraCuts_QuickZoom 
	CCam_DoMorph
	zooming = false
	if (<zooming> = true)
		amplitudePosition = 0.01
		amplituderotation = -0.01
	else
		amplitudePosition = ($handcam_amplitudePosition)
		amplituderotation = ($handcam_amplitudeRotation)
	endif
	CameraCuts_SetHandCamParams <...>
	CCam_DoMorph {
		<Cam1>
	}
	CameraCuts_WaitForMorphOrSongTime camera_songtime = <camera_songtime>
	CameraCuts_WaitForTimeOrSongTime camera_songtime = <camera_songtime> seconds = 2
	CCam_DoMorph {
		<Cam1>
	}
	CameraCuts_WaitForMorphOrSongTime camera_songtime = <camera_songtime>
	CCam_DoMorph {
		<Cam2>
		time = 0.75
		motion = smooth
	}
	CameraCuts_WaitForMorphOrSongTime camera_songtime = <camera_songtime>
	CCam_DoMorph {
		<Cam2>
	}
	CameraCuts_WaitForMorphOrSongTime camera_songtime = <camera_songtime>
	CameraCuts_CalcTime force_time = <force_time>
	CameraCuts_WaitScript camera_songtime = <camera_songtime> force_time = <force_time>
endscript

script CameraCuts_Pan 
	CameraCuts_SetHandCamParams {
		amplitudePosition = ($handcam_amplitudePosition)
		amplituderotation = ($handcam_amplitudeRotation)
	}
	CCam_DoMorph {
		<Cam1>
		time = 0
	}
	CameraCuts_WaitForTimeOrSongTime camera_songtime = <camera_songtime> seconds = 2
	CCam_DoMorph {
		<Cam2>
		time = 1
		motion = smooth
	}
	CameraCuts_WaitForMorphOrSongTime camera_songtime = <camera_songtime>
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

script Jumbotron_SetOverride 
	Change jumbotron_focus = <focus>
endscript
Default_Cameras_Good = [
	{
		name = good_from_stage
		Play_hold = 1
		LockTo = Guitarist
		Pos = (1.5175159, 4.1361775, -4.089658)
		Quat = (0.130047, -0.018706, 0.0024160002)
		FOV = 72.0
	}
]
Default_Cameras_Normal = [
	{
		name = normal_crowd_center
		Play_hold = 1
		LockTo = Guitarist
		Pos = (5.108431, 1.485993, 13.082112)
		Quat = (0.0025400002, -0.9918739, 0.019756)
		FOV = 72.0
	}
]
Default_Cameras_Poor = [
	{
		name = poor_crowd_center
		Play_hold = 1
		LockTo = Guitarist
		Pos = (-1.573781, 1.4759071, 20.610792)
		Quat = (-0.00064900005, 0.998182, 0.010279999)
		FOV = 72.0
	}
]
default_cameras_moments = [
	{
		name = Moment01
		LockTo = moment_cam_lock_target_01
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 72.0
	}
	{
		name = Moment02
		LockTo = moment_cam_lock_target_02
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 72.0
	}
	{
		name = Moment03
		LockTo = moment_cam_lock_target_03
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 72.0
	}
	{
		name = Moment04
		LockTo = moment_cam_lock_target_04
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 72.0
	}
	{
		name = Moment05
		LockTo = moment_cam_lock_target_05
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 72.0
	}
	{
		name = Moment06
		LockTo = moment_cam_lock_target_06
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 72.0
	}
	{
		name = Moment07
		LockTo = moment_cam_lock_target_07
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 72.0
	}
	{
		name = Moment08
		LockTo = moment_cam_lock_target_08
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 72.0
	}
	{
		name = Moment09
		LockTo = moment_cam_lock_target_09
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 72.0
	}
	{
		name = Moment10
		LockTo = moment_cam_lock_target_10
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 72.0
	}
]
default_cameras_guitarist = [
	{
		name = Guitarist_CloseUp
		type = Guitarist_CloseUp
		LockTo = World
		Pos = (-6.321385, 0.924312, -2.6622968)
		Quat = (-0.026229998, 0.784364, 0.032947995)
		FOV = 72.0
	}
	{
		name = Guitarist_Stage
		LockTo = World
		Pos = (-6.321385, 0.924312, -2.6622968)
		Quat = (-0.026229998, 0.784364, 0.032947995)
		FOV = 72.0
	}
	{
		name = Guitarist_Mocap01
		LockTo = musician1_mocap_lock_target_01
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 72.0
	}
	{
		name = Guitarist_Mocap02
		LockTo = musician1_mocap_lock_target_02
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 72.0
	}
]
default_cameras_singer = [
	{
		name = Singer_CloseUp
		type = Singer_CloseUp
		LockTo = World
		Pos = (-6.321385, 0.924312, -2.6622968)
		Quat = (-0.026229998, 0.784364, 0.032947995)
		FOV = 72.0
	}
	{
		name = Singer_Stage
		LockTo = World
		Pos = (-6.321385, 0.924312, -2.6622968)
		Quat = (-0.026229998, 0.784364, 0.032947995)
		FOV = 72.0
	}
	{
		name = Singer_Mocap01
		LockTo = musician3_mocap_lock_target_01
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 72.0
	}
	{
		name = Singer_Mocap02
		LockTo = musician3_mocap_lock_target_02
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 72.0
	}
]
default_cameras_bassist = [
	{
		name = Bassist_CloseUp
		type = Bassist_CloseUp
		LockTo = World
		Pos = (-6.321385, 0.924312, -2.6622968)
		Quat = (-0.026229998, 0.784364, 0.032947995)
		FOV = 72.0
	}
	{
		name = Bassist_Stage
		LockTo = World
		Pos = (-6.321385, 0.924312, -2.6622968)
		Quat = (-0.026229998, 0.784364, 0.032947995)
		FOV = 72.0
	}
	{
		name = Bassist_Mocap01
		LockTo = musician2_mocap_lock_target_01
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 72.0
	}
	{
		name = Bassist_Mocap02
		LockTo = musician2_mocap_lock_target_02
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 72.0
	}
]
default_cameras_drummer = [
	{
		name = Drummer_CloseUp
		type = Drummer_CloseUp
		LockTo = World
		Pos = (-6.321385, 0.924312, -2.6622968)
		Quat = (-0.026229998, 0.784364, 0.032947995)
		FOV = 72.0
	}
	{
		name = Drummer_Stage
		type = Drummer_Stage
		LockTo = World
		Pos = (-6.321385, 0.924312, -2.6622968)
		Quat = (-0.026229998, 0.784364, 0.032947995)
		FOV = 72.0
	}
	{
		name = Drummer_Mocap01
		LockTo = musician4_mocap_lock_target_01
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 72.0
	}
	{
		name = Drummer_Mocap02
		LockTo = musician4_mocap_lock_target_02
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 72.0
	}
]
default_cameras = [
	{
		name = Longshot
		type = Longshot
		LockTo = World
		Pos = (-6.321385, 0.924312, -2.6622968)
		Quat = (-0.026229998, 0.784364, 0.032947995)
		FOV = 72.0
	}
	{
		name = Midshot
		type = Midshot
		LockTo = World
		Pos = (-6.321385, 0.924312, -2.6622968)
		Quat = (-0.026229998, 0.784364, 0.032947995)
		FOV = 72.0
	}
	{
		name = Venue_Midshot
		type = Venue_Midshot
		LockTo = World
		Pos = (-6.321385, 0.924312, -2.6622968)
		Quat = (-0.026229998, 0.784364, 0.032947995)
		FOV = 72.0
	}
	{
		name = Generic_Stage_Shot
		type = Generic_Stage_Shot
		LockTo = World
		Pos = (-6.321385, 0.924312, -2.6622968)
		Quat = (-0.026229998, 0.784364, 0.032947995)
		FOV = 72.0
	}
]
default_cameras_headtohead = [
	{
		name = HeadToHead_Longshot
		controlscript = CameraCuts_HandCam
		params = {
			LockTo = World
			Pos = (2.984848, 2.319129, 8.964585)
			Quat = (0.013296999, -0.9863979, 0.09915701)
			FOV = 72.0
		}
	}
	{
		name = HeadToHead_Midshot
		controlscript = CameraCuts_HandCam
		params = {
			LockTo = World
			Pos = (2.286206, 1.399632, -0.8574021)
			Quat = (0.013289999, -0.97393197, 0.058316004)
			FOV = 72.0
		}
	}
	{
		name = HeadToHead_Venue_Midshot
		controlscript = CameraCuts_HandCam
		params = {
			LockTo = World
			Pos = (0.48657104, 1.8374078, 4.633928)
			Quat = (0.00057300006, -0.99960995, 0.019561999)
			FOV = 72.0
		}
	}
	{
		name = HeadToHead_Stage_Shot
		controlscript = CameraCuts_HandCam
		params = {
			LockTo = World
			Pos = (3.347051, 2.0671618, -7.5946074)
			Quat = (0.12163001, -0.398576, 0.053206)
			FOV = 72.0
		}
	}
]
default_cameras_jam_mode = [
	{
		name = JamMode_Longshot
		controlscript = CameraCuts_HandCam
		params = {
			LockTo = World
			Pos = (3.9096844, 2.581986, 12.654455)
			Quat = (0.026690999, -0.968614, 0.123729)
			FOV = 72.0
		}
	}
	{
		name = JamMode_Midshot
		controlscript = CameraCuts_HandCam
		params = {
			LockTo = World
			Pos = (0.055207, 2.071424, 9.734074)
			Quat = (0.001375, -0.990425, 0.137294)
			FOV = 72.0
		}
	}
	{
		name = JamMode_Venue_Midshot
		controlscript = CameraCuts_HandCam
		params = {
			LockTo = World
			Pos = (-4.4341054, 2.250556, 13.4862995)
			Quat = (0.020083, 0.97846603, -0.10951801)
			FOV = 72.0
		}
	}
	{
		name = JamMode_Stage_Shot
		controlscript = CameraCuts_HandCam
		params = {
			LockTo = World
			Pos = (-2.6811976, 0.80954903, 0.235918)
			Quat = (0.05509, 0.239629, -0.012985)
			FOV = 91.0
		}
	}
]
default_cameras_solo = [
	{
		name = Solo_Guitar
		type = Solo_Guitar
		LockTo = World
		Pos = (-6.321385, 0.924312, -2.6622968)
		Quat = (-0.026229998, 0.784364, 0.032947995)
		FOV = 72.0
	}
	{
		name = Solo_Vocal
		type = Solo_Vocal
		LockTo = World
		Pos = (-6.321385, 0.924312, -2.6622968)
		Quat = (-0.026229998, 0.784364, 0.032947995)
		FOV = 72.0
	}
	{
		name = Solo_Drum
		type = Solo_Drum
		LockTo = World
		Pos = (-6.321385, 0.924312, -2.6622968)
		Quat = (-0.026229998, 0.784364, 0.032947995)
		FOV = 72.0
	}
	{
		name = Solo_Bass
		type = Solo_Bass
		LockTo = World
		Pos = (-6.321385, 0.924312, -2.6622968)
		Quat = (-0.026229998, 0.784364, 0.032947995)
		FOV = 72.0
	}
]
default_cameras_single = [
	{
		name = single_guitar
		type = single
		LockTo = World
		Pos = (-6.321385, 0.924312, -2.6622968)
		Quat = (-0.026229998, 0.784364, 0.032947995)
		FOV = 72.0
	}
	{
		name = single_vocal
		type = single
		LockTo = World
		Pos = (-4.3443885, 0.950269, -0.84059906)
		Quat = (1.9E-05, 0.99112797, -0.001512)
		FOV = 72.0
	}
	{
		name = single_drum
		type = single
		LockTo = World
		Pos = (-6.321385, 0.924312, -2.6622968)
		Quat = (-0.026229998, 0.784364, 0.032947995)
		FOV = 72.0
	}
	{
		name = single_bass
		type = single
		LockTo = World
		Pos = (-4.3443885, 0.950269, -0.84059906)
		Quat = (1.9E-05, 0.99112797, -0.001512)
		FOV = 72.0
	}
]
default_cameras_autocut = [
	{
		name = Singer_CloseUp
		controlscript = CameraCuts_HandCam
		type = Singer_CloseUp
		params = {
			handcamcloseup
			LockTo = Vocalist
			Pos = (1.5492508, 0.89227194, 3.045015)
			Quat = (-0.027715, -0.9707769, -0.09122801)
			FOV = 13.0
			LookAt = Vocalist
			LookAtBone = Bone_Head
			ScreenOffset = (0.42601603, 0.014149999)
			DistFromLookAt = 3.695025
		}
		DOF = $DOF_CloseUp02_TOD_Manager
		crowdoff
	}
	{
		name = Singer_CloseUp2
		controlscript = CameraCuts_HandCam
		type = Singer_CloseUp
		params = {
			handcamcloseup
			LockTo = Vocalist
			Pos = (-2.334458, 1.118762, 1.899987)
			Quat = (-0.025109, 0.89701205, 0.067262)
			FOV = 11.0
			LookAt = Vocalist
			LookAtBone = Bone_Head
			ScreenOffset = (-0.62771505, 0.075389)
			DistFromLookAt = 3.354081
		}
		DOF = $DOF_closeup01_TOD_Manager
		crowdoff
	}
	{
		name = Singer_Mocap01
		LockTo = vocalist_mocap_lock_target_01
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 65.0
		DOF = $DOF_CloseUp02_TOD_Manager
	}
	{
		name = Singer_Mocap02
		LockTo = vocalist_mocap_lock_target_02
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 65.0
		DOF = $DOF_Medium02_TOD_Manager
	}
	{
		name = Guitarist_CloseUp
		type = CloseUp
		controlscript = CameraCuts_HandCam
		params = {
			LockTo = Guitarist
			Pos = (3.6475768, 1.0763031, 1.5907401)
			Quat = (-0.028113, -0.82460296, -0.029011)
			FOV = 25.0
			LookAt = Guitarist
			LookAtBone = Bone_Chest
			ScreenOffset = (0.471216, 0.186662)
			DistFromLookAt = 3.3977568
		}
		DOF = $DOF_closeup01_TOD_Manager
		crowdoff
	}
	{
		name = Guitarist_CloseUp02
		type = CloseUp
		controlscript = CameraCuts_HandCam
		params = {
			LockTo = Guitarist
			Pos = (0.283945, 0.45201203, 4.4524693)
			Quat = (0.0065240003, 0.994423, 0.105216004)
			FOV = 18.0
			LookAt = Guitarist
			LookAtBone = Bone_Chest
			ScreenOffset = (0.44280702, 0.31687602)
			DistFromLookAt = 4.4968452
		}
		DOF = $DOF_closeup01_TOD_Manager
		crowdoff
	}
	{
		name = Guitarist_Mocap01
		LockTo = guitarist_mocap_lock_target_01
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 65.0
		DOF = $DOF_CloseUp02_TOD_Manager
	}
	{
		name = Guitarist_Mocap02
		LockTo = guitarist_mocap_lock_target_02
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 65.0
		DOF = $DOF_closeup01_TOD_Manager
	}
	{
		name = Bassist_CloseUp
		controlscript = CameraCuts_HandCam
		params = {
			LockTo = Bassist
			Pos = (-3.7086382, 1.1985401, 1.8435988)
			Quat = (-0.001098, 0.830151, 0.013861)
			FOV = 28.0
			LookAt = Bassist
			LookAtBone = Bone_Chest
			ScreenOffset = (-0.419754, -0.019663)
			DistFromLookAt = 3.61233
		}
		DOF = $DOF_CloseUp02_TOD_Manager
		crowdoff
	}
	{
		name = Bassist_Mocap01
		LockTo = bassist_mocap_lock_target_01
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 65.0
		DOF = $DOF_closeup01_TOD_Manager
	}
	{
		name = Bassist_Mocap02
		LockTo = bassist_mocap_lock_target_02
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 65.0
		DOF = $DOF_Medium02_TOD_Manager
	}
	{
		name = Drummer_CloseUp
		type = Drummer_CloseUp
		controlscript = CameraCuts_TwoCam
		params = {
			UseHandCam
			Cam1 = {
				LockTo = Drummer
				Pos = (-0.082587995, 1.004094, 1.6833342)
				Quat = (0.0067860004, 0.99438393, 0.000623)
				FOV = 32.0
				LookAt = Drummer
				LookAtBone = Bone_Head
				ScreenOffset = (-0.251453, -0.21729802)
				DistFromLookAt = 1.752825
			}
			Cam2 = {
				LockTo = Drummer
				Pos = (-0.13792199, 1.0048649, 1.6714461)
				Quat = (0.0067760004, 0.9927139, 0.000723)
				FOV = 32.0
				LookAt = Drummer
				LookAtBone = Bone_Head
				ScreenOffset = (-0.24174, -0.21511501)
				DistFromLookAt = 1.7497649
			}
			crowdoff
			DOF = $DOF_CloseUp02_TOD_Manager
		}
	}
	{
		name = Drummer_CloseUp02
		type = Drummer_CloseUp
		controlscript = CameraCuts_TwoCam
		params = {
			UseHandCam
			Cam1 = {
				LockTo = Drummer
				Pos = (1.017448, 0.82566696, 1.235776)
				Quat = (-0.02791, -0.93970597, -0.057794)
				FOV = 32.0
				LookAt = Drummer
				LookAtBone = Bone_Head
				ScreenOffset = (0.33858898, -0.15662)
				DistFromLookAt = 1.550921
			}
			Cam2 = {
				LockTo = Drummer
				Pos = (1.030278, 0.825441, 1.2252411)
				Quat = (-0.028205998, -0.93797094, -0.05765)
				FOV = 32.0
				LookAt = Drummer
				LookAtBone = Bone_Head
				ScreenOffset = (0.33669803, -0.15839502)
				DistFromLookAt = 1.5494419
			}
			crowdoff
			DOF = $DOF_CloseUp02_TOD_Manager
		}
	}
	{
		name = Drummer_Mocap01
		LockTo = drummer_mocap_lock_target_01
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 65.0
		DOF = $DOF_Medium02_TOD_Manager
	}
	{
		name = Drummer_Mocap02
		LockTo = drummer_mocap_lock_target_02
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 65.0
		DOF = $DOF_Medium02_TOD_Manager
	}
	{
		name = Spotlight
		controlscript = CameraCuts_HandCam
		params = {
			LockTo = Vocalist
			Pos = (5.2537947, 3.7356453, 5.9229445)
			Quat = (0.057692, -0.937805, 0.20332801)
			FOV = 59.0
		}
		DOF = $DOF_Medium02_TOD_Manager
	}
	{
		controlscript = CameraCuts_SpecialStepMove
		params = {
			name = AUDIENCE_R
			type = audience
			Cam1 = {
				LockTo = Vocalist
				Pos = (11.858139, 1.700623, 14.502603)
				Quat = (0.012594, -0.93913496, 0.055007)
				FOV = 37.0
			}
			Cam2 = {
				LockTo = Vocalist
				Pos = (11.858139, 1.700623, 14.502603)
				Quat = (0.012594, -0.93913496, 0.055007)
				FOV = 37.0
			}
			StepTime = 6.0
			FinalRotTime = 1.0
			StepNum = 6.0
			StepDir = (0.0, 0.07, 0.05)
			DOF = $DOF_medium01_tod_manager
		}
	}
	{
		controlscript = CameraCuts_SpecialStepMove
		params = {
			name = AUDIENCE_C
			type = audience
			Cam1 = {
				LockTo = Vocalist
				Pos = (-1.8534688, 1.89821, 17.983355)
				Quat = (0.011201, 0.995569, -0.062671)
				FOV = 41.0
			}
			Cam2 = {
				LockTo = Vocalist
				Pos = (-1.8534688, 1.89821, 17.983355)
				Quat = (0.011201, 0.995569, -0.062671)
				FOV = 41.0
			}
			StepTime = 6.0
			FinalRotTime = 1.0
			StepNum = 6.0
			StepDir = (0.0, 0.07, 0.05)
			DOF = $DOF_medium01_tod_manager
		}
	}
	{
		controlscript = CameraCuts_SpecialStepMove
		params = {
			name = AUDIENCE_L
			type = audience
			Cam1 = {
				LockTo = Vocalist
				Pos = (-8.00015, 1.797529, 15.347496)
				Quat = (0.025906, 0.961762, -0.068592)
				FOV = 46.0
			}
			Cam2 = {
				LockTo = Vocalist
				Pos = (-8.00015, 1.797529, 15.347496)
				Quat = (0.025906, 0.961762, -0.068592)
				FOV = 46.0
			}
			StepTime = 6.0
			FinalRotTime = 1.0
			StepNum = 6.0
			StepDir = (0.0, 0.07, 0.05)
			DOF = $DOF_medium01_tod_manager
		}
	}
]
default_cameras_special = [
	{
		name = Special01
		LockTo = World
		Pos = (-6.321385, 0.924312, -2.6622968)
		Quat = (-0.026229998, 0.784364, 0.032947995)
		FOV = 72.0
	}
	{
		name = Special02
		LockTo = World
		Pos = (-4.3443885, 0.950269, -0.84059906)
		Quat = (1.9E-05, 0.99112797, -0.001512)
		FOV = 72.0
	}
]
default_cameras_audience = [
	{
		controlscript = CameraCuts_SpecialStepMove
		params = {
			name = AUDIENCE_R
			type = audience
			Cam1 = {
				LockTo = World
				Pos = (5.888749, -0.09943501, 5.550212)
				Quat = (-0.008041001, -0.97881204, -0.039359003)
				FOV = 49.0
				LookAt = Vocalist
				ScreenOffset = (-0.32207203, 0.172022)
			}
			Cam2 = {
				LockTo = World
				Pos = (6.091454, -0.099421, 5.463399)
				Quat = (-0.0085080005, -0.97635895, -0.039261)
				FOV = 49.0
				LookAt = Vocalist
				ScreenOffset = (-0.30865702, 0.172709)
			}
			StepTime = 6.0
			FinalRotTime = 1.0
			StepNum = 6.0
			StepDir = (0.0, 0.07, 0.05)
			DOF = $DOF_medium01_tod_manager
		}
	}
]
default_cameras_zoom = [
	{
		name = ZOOM_In
		controlscript = CameraCuts_TwoCam
		params = {
			UseHandCam
			Cam1 = {
				LockTo = World
				Pos = (7.586032, 0.200963, 15.85076)
				Quat = (0.009055, -0.97853, 0.039293)
				FOV = 83.0
			}
			Cam2 = {
				LockTo = World
				Pos = (7.586032, 0.200963, 15.85076)
				Quat = (0.000763, -0.98286796, -0.000915)
				FOV = 29.0
			}
		}
		DOF = $DOF_medium01_tod_manager
	}
	{
		name = ZOOM_Out
		controlscript = CameraCuts_TwoCam
		params = {
			UseHandCam
			Cam1 = {
				LockTo = World
				Pos = (7.586032, 0.200963, 15.85076)
				Quat = (0.000763, -0.98286796, -0.000915)
				FOV = 29.0
			}
			Cam2 = {
				LockTo = World
				Pos = (7.586032, 0.200963, 15.85076)
				Quat = (0.009055, -0.97853, 0.039293)
				FOV = 83.0
			}
		}
		DOF = $DOF_medium01_tod_manager
	}
]
default_cameras_spotlight = [
	{
		name = Spotlight
		LockTo = Drummer
		Pos = (-0.59138894, 3.714998, 12.7414465)
		Quat = (0.0042340006, 0.97817, -0.204423)
		FOV = 72.0
	}
]
default_cameras_intro = [
	{
		name = crowd_center_zoom
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
		name = crowd_center_zoom
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
default_cameras_preencore = [
	{
		controlscript = CameraCuts_TwoCam
		params = {
			Cam1 = {
				LockTo = Drummer
				Pos = (-2.4889898, 2.2800958, 9.589442)
				Quat = (0.033784002, 0.965961, -0.164262)
				FOV = 72.0
				LookAt = Drummer
				LookAtBone = Bone_Chest
				ScreenOffset = (-0.225398, -0.579956)
			}
			Cam2 = {
				LockTo = Drummer
				Pos = (4.951395, 2.2763019, 9.435161)
				Quat = (0.050596002, -0.9369719, 0.15382701)
				FOV = 72.0
				LookAt = Drummer
				LookAtBone = Bone_Chest
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
default_cameras_win = [
	{
		controlscript = CameraCuts_HandCam
		params = {
			name = Win
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
			name = lose
			LockTo = World
			Pos = (-0.97144395, 0.90905, 0.850675)
			Quat = (-0.00064100005, -0.99934596, -0.02286)
			FOV = 72.0
		}
		DOF = $DOF_CloseUp02_TOD_Manager
	}
]
default_cameras_loading = [
	{
		name = loading
		controlscript = CameraCuts_TwoCam
		params = {
			UseHandCam
			Cam1 = {
				LockTo = World
				Pos = (-6.204663, 2.698264, 10.309547)
				Quat = (0.016273, 0.97326, -0.074999005)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = World
				Pos = (4.084505, 2.316533, 7.104564)
				Quat = (0.020193998, -0.96327096, 0.074039005)
				FOV = 72.0
			}
		}
		DOF = $DOF_medium01_tod_manager
	}
]
default_cameras_finalbandintro = [
	{
		name = finalbandintro
		controlscript = CameraCuts_TwoCam
		params = {
			UseHandCam
			Cam1 = {
				LockTo = World
				Pos = (4.084505, 2.316533, 7.104564)
				Quat = (0.020193998, -0.96327096, 0.074039005)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = World
				Pos = (-6.204663, 2.698264, 10.309547)
				Quat = (0.016273, 0.97326, -0.074999005)
				FOV = 72.0
			}
		}
		DOF = $DOF_medium01_tod_manager
	}
]
default_cameras_finalbandoutro = [
	{
		name = finalbandoutro
		controlscript = CameraCuts_TwoCam
		params = {
			UseHandCam
			Cam1 = {
				LockTo = World
				Pos = (4.084505, 2.316533, 7.104564)
				Quat = (0.020193998, -0.96327096, 0.074039005)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = World
				Pos = (-6.204663, 2.698264, 10.309547)
				Quat = (0.016273, 0.97326, -0.074999005)
				FOV = 72.0
			}
		}
		DOF = $DOF_medium01_tod_manager
	}
]
default_cameras_no_band = [
	{
		name = NoBand
		controlscript = CameraCuts_HandCam
		params = {
			LockTo = World
			Pos = (8.588713, 5.921629, 8.272691)
			Quat = (-0.011485, -0.9662969, -0.048534002)
			FOV = 72.0
		}
		DOF = $DOF_CloseUp02_TOD_Manager
	}
]
default_cameras_Orbits = [
	{
		controlscript = CameraCuts_Orbit
		params = {
			name = Orbit_Low
			type = Orbit_Low
			LockTo = Drummer
			Pos = (6.3687263, 1.633705, 19.943876)
			Quat = (0.007162, -0.984545, 0.053423)
			FOV = 45.0
			orbitangle = -40
		}
		DOF = $DOF_Medium02_TOD_Manager
	}
	{
		controlscript = CameraCuts_Orbit
		params = {
			name = Orbit_Low02
			type = Orbit_Low
			LockTo = Drummer
			Pos = (-11.5815115, 2.4439182, 22.490376)
			Quat = (0.017549999, 0.96715605, -0.061473995)
			FOV = 35.0
			orbitangle = 40
		}
		DOF = $DOF_Medium02_TOD_Manager
	}
	{
		controlscript = CameraCuts_Orbit
		params = {
			name = Orbit_High
			type = Orbit_High
			LockTo = Drummer
			Pos = (10.116585, 6.30597, 22.762821)
			Quat = (0.034197997, -0.963171, 0.16785899)
			FOV = 62.0
			orbitangle = -40
		}
		DOF = $DOF_Medium02_TOD_Manager
	}
	{
		controlscript = CameraCuts_Orbit
		params = {
			name = Orbit_High02
			type = Orbit_High
			LockTo = Drummer
			Pos = (-11.202224, 6.3884473, 21.25471)
			Quat = (0.043300997, 0.95523196, -0.16217701)
			FOV = 56.0
			orbitangle = 40
		}
		DOF = $DOF_Medium02_TOD_Manager
	}
]
default_cameras_verts_front = [
	{
		name = vert_front01
		type = verts_front
		controlscript = CameraCuts_TwoCam
		params = {
			Cam1 = {
				LockTo = World
				Pos = (4.093626, 0.367648, 8.18222)
				Quat = (-0.005631, -0.932861, -0.0097469995)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = World
				Pos = (4.4239135, 4.868402, 9.268306)
				Quat = (0.087894, -0.90976995, 0.269179)
				FOV = 72.0
			}
		}
		DOF = $DOF_medium01_tod_manager
	}
]
default_cameras_verts_rear = [
	{
		name = vert_rear01
		type = verts_rear
		controlscript = CameraCuts_TwoCam
		params = {
			Cam1 = {
				LockTo = World
				Pos = (2.103098, 0.8927869, -2.3562832)
				Quat = (0.070226, -0.12539001, 0.01066)
				FOV = 73.0
			}
			Cam2 = {
				LockTo = World
				Pos = (1.8227749, 4.8754377, -1.3246669)
				Quat = (0.10814801, -0.107700996, 0.013551)
				FOV = 73.0
			}
		}
		DOF = $DOF_medium01_tod_manager
	}
]
default_cameras_G_across_stage = [
	{
		name = G_across_stage
		type = G_across_stage
		controlscript = CameraCuts_HandCam
		params = {
			handcamcloseup
			LockTo = Guitarist
			Pos = (-10.524325, 1.2712423, 1.0648409)
			Quat = (0.0075330003, 0.731524, -0.009516999)
			FOV = 17.0
			LookAt = Guitarist
			LookAtBone = Bone_Head
			ScreenOffset = (-0.19467999, -0.636386)
			DistFromLookAt = 10.103118
		}
		DOF = $DOF_across_stage_1_tod_manager
	}
]
default_cameras_S_across_stage = [
	{
		name = S_across_stage
		type = S_across_stage
		controlscript = CameraCuts_HandCam
		params = {
			handcamcloseup
			LockTo = Vocalist
			Pos = (8.223535, 0.72865397, 0.79751205)
			Quat = (-0.027639, -0.704612, -0.025023999)
			FOV = 12.0
			LookAt = Vocalist
			LookAtBone = Bone_Head
			ScreenOffset = (0.41745302, -0.52084696)
			DistFromLookAt = 8.893963
		}
		DOF = $DOF_across_stage_2_tod_manager
	}
]
default_cameras_NonStandardCloseups = [
	{
		name = Guitarist_node_ALT_closeup
		type = Guitarist_CloseUp
		controlscript = CameraCuts_HandCam
		params = {
			handcamcloseup
			LockTo = Guitarist
			Pos = (1.7382451, 1.0956321, 0.37818998)
			Quat = (0.022186, -0.743775, 0.032082)
			FOV = 50.0
			LookAt = Guitarist
			LookAtBone = Bone_Head
			ScreenOffset = (0.38946402, -0.343904)
			DistFromLookAt = 1.697267
		}
		DOF = $DOF_CloseUp02_TOD_Manager
	}
	{
		name = Vocalist_node_ALT_closeup
		type = vocalist_closeup
		controlscript = CameraCuts_HandCam
		params = {
			handcamcloseup
			LockTo = Vocalist
			Pos = (1.723376, 1.3431189, 0.215183)
			Quat = (0.06596, -0.694328, 0.071105)
			FOV = 50.0
			LookAt = Vocalist
			LookAtBone = Bone_Head
			ScreenOffset = (0.31962302, -0.36965203)
			DistFromLookAt = 1.5752971
		}
		DOF = $DOF_closeup01_TOD_Manager
	}
	{
		name = Bassist_node_ALT_closeup
		type = Bassist_CloseUp
		controlscript = CameraCuts_HandCam
		params = {
			handcamcloseup
			LockTo = Bassist
			Pos = (1.901762, 1.411353, 0.20627001)
			Quat = (0.06892099, -0.72685295, 0.081065)
			FOV = 50.0
			LookAt = Bassist
			LookAtBone = Bone_Head
			ScreenOffset = (0.291735, -0.38748303)
			DistFromLookAt = 1.773569
		}
		DOF = $DOF_closeup01_TOD_Manager
	}
	{
		name = Drummer_node_ALT_closeup
		type = Drummer_CloseUp
		controlscript = CameraCuts_HandCam
		params = {
			handcamcloseup
			LockTo = Drummer
			Pos = (1.528101, 1.3878909, 1.5932021)
			Quat = (0.027365997, -0.91494495, -0.022584999)
			FOV = 51.0
			LookAt = Drummer
			LookAtBone = Bone_Head
			ScreenOffset = (0.294515, -0.38926402)
			DistFromLookAt = 1.553067
		}
		DOF = $DOF_closeup01_TOD_Manager
	}
	{
		name = Drummer_node_ALT_stage
		type = Drummer_Stage
		controlscript = CameraCuts_HandCam
		params = {
			LockTo = Drummer
			Pos = (1.507228, 1.7252821, -2.1122582)
			Quat = (0.080031, -0.294578, -0.021869)
			FOV = 33.0
			LookAt = Drummer
			LookAtBone = Bone_Head
			ScreenOffset = (0.402709, -0.470863)
			DistFromLookAt = 2.514244
		}
		DOF = $DOF_moment1_1_tod_manager
	}
	{
		name = S_across_stage_ALT
		type = S_across_stage
		controlscript = CameraCuts_HandCam
		params = {
			LockTo = Vocalist
			Pos = (5.7699013, 1.177866, -0.22495198)
			Quat = (0.032962997, -0.689329, 0.021283)
			FOV = 37.0
			LookAt = Vocalist
			LookAtBone = Bone_Head
			ScreenOffset = (0.096578, -0.447606)
			DistFromLookAt = 5.6147313
		}
		DOF = $DOF_moment1_1_tod_manager
	}
	{
		name = G_across_stage_ALT
		type = G_across_stage
		controlscript = CameraCuts_HandCam
		params = {
			LockTo = Guitarist
			Pos = (-8.795936, 1.184793, 2.111708)
			Quat = (0.0066980002, 0.781129, -0.020125998)
			FOV = 17.0
			LookAt = Guitarist
			LookAtBone = Bone_Head
			ScreenOffset = (-0.13279, -0.505753)
			DistFromLookAt = 9.247294
		}
		DOF = $DOF_moment1_1_tod_manager
	}
]
