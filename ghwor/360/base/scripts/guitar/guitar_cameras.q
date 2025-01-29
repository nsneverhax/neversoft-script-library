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
cameracuts_preprocess_autocameras = FALSE
cameracuts_nextextraparamsset = 0
cameracuts_nextextraparams = {
}
cameracuts_nextdisablecam = FALSE
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
			sync
		}
	}
	{
		MidiNote = 4
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_moments'
			changenow
			Name = moment02
			sync
		}
	}
	{
		MidiNote = 5
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_moments'
			changenow
			Name = moment03
			sync
		}
	}
	{
		MidiNote = 6
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_moments'
			changenow
			Name = moment04
			sync
		}
	}
	{
		MidiNote = 8
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_guitarist'
			changenow
			Type = guitarist_closeup
			sync
		}
	}
	{
		MidiNote = 9
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_guitarist'
			changenow
			Type = guitarist_stage
			sync
		}
	}
	{
		MidiNote = 10
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_guitarist'
			changenow
			Name = guitarist_mocap01
			sync
		}
	}
	{
		MidiNote = 11
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_guitarist'
			changenow
			Name = guitarist_mocap02
			sync
		}
	}
	{
		MidiNote = 13
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_singer'
			changenow
			Type = Singer_CloseUp
			sync
		}
	}
	{
		MidiNote = 14
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_singer'
			changenow
			Type = singer_stage
			sync
		}
	}
	{
		MidiNote = 15
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_singer'
			changenow
			Name = singer_mocap01
			sync
		}
	}
	{
		MidiNote = 16
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_singer'
			changenow
			Name = singer_mocap02
			sync
		}
	}
	{
		MidiNote = 18
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_bassist'
			changenow
			Type = bassist_closeup
			sync
		}
	}
	{
		MidiNote = 19
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_bassist'
			changenow
			Name = bassist_stage
			sync
		}
	}
	{
		MidiNote = 20
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_bassist'
			changenow
			Name = bassist_mocap01
			sync
		}
	}
	{
		MidiNote = 21
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_bassist'
			changenow
			Name = bassist_mocap02
			sync
		}
	}
	{
		MidiNote = 23
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_drummer'
			changenow
			Type = drummer_closeup
			sync
		}
	}
	{
		MidiNote = 24
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_drummer'
			changenow
			Type = drummer_stage
			sync
		}
	}
	{
		MidiNote = 25
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_drummer'
			changenow
			Name = drummer_mocap01
			sync
		}
	}
	{
		MidiNote = 26
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_drummer'
			changenow
			Name = drummer_mocap02
			sync
		}
	}
	{
		MidiNote = 28
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras'
			changenow
			Type = LongShot
			sync
		}
	}
	{
		MidiNote = 29
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras'
			changenow
			Type = midshot
			sync
		}
	}
	{
		MidiNote = 30
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras'
			changenow
			Type = venue_midshot
			sync
		}
	}
	{
		MidiNote = 31
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras'
			changenow
			Type = generic_stage_shot
			sync
		}
	}
	{
		MidiNote = 33
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_solo'
			changenow
			Type = solo_guitar
			sync
		}
	}
	{
		MidiNote = 34
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_solo'
			changenow
			Name = solo_vocal
			sync
		}
	}
	{
		MidiNote = 35
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_solo'
			changenow
			Type = solo_drum
			sync
		}
	}
	{
		MidiNote = 36
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_solo'
			changenow
			Name = solo_bass
			sync
		}
	}
	{
		MidiNote = 38
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_single'
			changenow
			Type = single
			sync
		}
	}
	{
		MidiNote = 40
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_special'
			changenow
			Name = Special01
			sync
		}
	}
	{
		MidiNote = 41
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_special'
			changenow
			Name = Special02
			sync
		}
	}
	{
		MidiNote = 43
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_audience'
			changenow
			Type = audience
			in_crowd = 1
			sync
		}
	}
	{
		MidiNote = 45
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_zoom'
			changenow
			Type = zoom_in
			sync
		}
	}
	{
		MidiNote = 46
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_zoom'
			changenow
			Type = zoom_out
			sync
		}
	}
	{
		MidiNote = 48
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_spotlight'
			changenow
			Name = spotlight
			sync
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
			in_crowd = 1
			sync
		}
	}
	{
		MidiNote = 75
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_Orbits'
			changenow
			Type = orbit_high
			sync
		}
	}
	{
		MidiNote = 57
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_Verts_Front'
			changenow
			Type = verts_front
			sync
		}
	}
	{
		MidiNote = 58
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_Verts_Rear'
			changenow
			Type = verts_rear
			sync
		}
	}
	{
		MidiNote = 60
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_G_across_stage'
			changenow
			Type = g_across_stage
			sync
		}
	}
	{
		MidiNote = 61
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_S_across_stage'
			changenow
			Type = s_across_stage
			sync
		}
	}
	{
		MidiNote = 62
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_Singer'
			changenow
			Type = singer_vert
			sync
		}
	}
	{
		MidiNote = 63
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_Guitarist'
			changenow
			Type = guitarist_vert
			sync
		}
	}
	{
		MidiNote = 64
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_Drummer'
			changenow
			Type = drummer_vert
			sync
		}
	}
	{
		MidiNote = 65
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_Bassist'
			changenow
			Type = bassist_vert
			sync
		}
	}
	{
		MidiNote = 66
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_Drummer'
			changenow
			Type = d_across_stage_s
			sync
		}
	}
	{
		MidiNote = 67
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_Drummer'
			changenow
			Type = d_across_stage_g
			sync
		}
	}
	{
		MidiNote = 68
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_Drummer'
			changenow
			Type = drummer_motion
			sync
		}
	}
	{
		MidiNote = 69
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_Guitarist'
			changenow
			Name = guitar_face_pan
			sync
		}
	}
	{
		MidiNote = 90
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_moments'
			changenow
			Name = moment01
			sync
		}
	}
	{
		MidiNote = 91
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_moments'
			changenow
			Name = moment02
			sync
		}
	}
	{
		MidiNote = 92
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_moments'
			changenow
			Name = moment03
			sync
		}
	}
	{
		MidiNote = 93
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_moments'
			changenow
			Name = moment04
			sync
		}
	}
	{
		MidiNote = 94
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_moments'
			changenow
			Name = moment05
			sync
		}
	}
	{
		MidiNote = 95
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_moments'
			changenow
			Name = moment06
			sync
		}
	}
	{
		MidiNote = 96
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_moments'
			changenow
			Name = moment07
			sync
		}
	}
	{
		MidiNote = 97
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_moments'
			changenow
			Name = moment08
			sync
		}
	}
	{
		MidiNote = 98
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_moments'
			changenow
			Name = moment09
			sync
		}
	}
	{
		MidiNote = 99
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_moments'
			changenow
			Name = moment10
			sync
		}
	}
	{
		MidiNote = 110
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_debug_face'
			changenow
			Name = debug_face_vocal
		}
	}
	{
		MidiNote = 111
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_debug_face'
			changenow
			Name = debug_face_guitar
		}
	}
	{
		MidiNote = 112
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_debug_face'
			changenow
			Name = debug_face_bass
		}
	}
	{
		MidiNote = 113
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_debug_face'
			changenow
			Name = debug_face_drum
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
debug_use_autocut_array = FALSE
g_moment_cameras_valid = [
	1
	1
	1
	1
	1
	1
	1
	1
	1
	1
]
g_moment01_camera_midi_note = 90
g_num_moment_cameras = 10
g_last_camera_in_crowd = 0

script cameracuts_iterator 
	gamemode_gettype
	if (($cheat_focusmode = 1 && <Type> != career) || $calibrate_lag_enabled = 1)
		return
	endif
	if NOT songfilemanager func = has_perf_file song_name = <song_name>
		if ($enable_button_cheats)
			if (<Type> = training || <Type> = tutorial || <Type> = practice)
			else
				if NOT ScreenElementExists \{id = debug_no_cameras}
					CreateScreenElement \{Type = TextElement
						parent = root_window
						id = debug_no_cameras
						font = debug
						Pos = (640.0, 102.0)
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
						text = qs(0x49e179f6)
						z_priority = 1.0
						alpha = 1}
				endif
			endif
		endif
		return
	endif
	songfilemanager func = get_num_autocut_cams song_name = <song_name>
	if (<num_cameras> = 0)
		return
	endif
	<array_Size> = <num_cameras>
	printf qs(0x3e5ffa5b) d = <time_offset> channel = events
	Change \{CameraCuts_NextNoteCameraTime = -1}
	setupinitialsonghandcamparams <...>
	SetNoteMappings \{section = cameras
		mapping = $CameraCuts_NoteMapping}
	use_moment_cameras = FALSE
	if should_play_moments
		songfilemanager func = get_num_moment_cams song_name = <song_name>
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
	songfilemanager func = get_autocut_cam_time song_name = <song_name> index = <array_entry>
	if ((<time> - <skipleadin>) < <camera_time>)
		break
	endif
	<array_entry> = (<array_entry> + 1)
	repeat <array_Size>
	if (<array_entry> >= <array_Size>)
		Change \{CameraCuts_NextNoteCameraTime = -1}
		return
	endif
	Change last_camera_array_entry = <array_entry>
	if (<use_moment_cameras> = true)
		begin
		songfilemanager func = get_moment_cam_time song_name = <song_name> index = <moment_array_entry>
		if ((<time> - <skipleadin>) < <camera_time>)
			break
		endif
		<moment_array_entry> = (<moment_array_entry> + 1)
		repeat <moment_array_size>
		if (<moment_array_entry> >= <moment_array_size>)
			use_moment_cameras = FALSE
		endif
	endif
	begin
	songfilemanager func = get_autocut_cam_time song_name = <song_name> index = <array_entry>
	next_camera_time = <camera_time>
	next_note_entry = <array_entry>
	next_time = <next_camera_time>
	next_type_call = get_autocut_cam_data
	playing_moment_camera = FALSE
	if (<use_moment_cameras> = true)
		if (<moment_array_entry> >= <moment_array_size>)
			use_moment_cameras = FALSE
		else
			songfilemanager func = get_moment_cam_time song_name = <song_name> index = <moment_array_entry>
			next_moment_camera_time = <camera_time>
			if (<next_moment_camera_time> <= <next_camera_time>)
				songfilemanager func = get_moment_cam_data song_name = <song_name> index = <moment_array_entry>
				<is_moment_cam> = FALSE
				if (((<note_value> >= $g_moment01_camera_midi_note) &&
							(<note_value> < ($g_moment01_camera_midi_note + $g_num_moment_cameras))) ||
						(<note_value> >= 3 && <note_value> <= 6))
					<is_moment_cam> = true
				endif
				if ((<is_moment_cam> = FALSE) && ($g_using_traditional_band_setup = FALSE))
					<moment_array_entry> = (<moment_array_entry> + 1)
				else
					next_type_call = get_moment_cam_data
					next_time = <next_moment_camera_time>
					next_note_entry = <moment_array_entry>
					playing_moment_camera = true
				endif
			endif
		endif
	endif
	Change CameraCuts_NextNoteCameraTime = (<next_time> - <time_offset>)
	begin
	GetSongTimeMs time_offset = <time_offset>
	if (<time> >= <next_time>)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	songfilemanager func = <next_type_call> song_name = <song_name> index = <next_note_entry>
	if ($CameraCuts_AllowNoteScripts = true)
		if (<note_value> >= 3 && <note_value> <= 6)
			<note_value> = (<note_value> + ($g_moment01_camera_midi_note - 3))
		endif
		if ((<note_value> >= $g_moment01_camera_midi_note) &&
				(<note_value> < ($g_moment01_camera_midi_note + $g_num_moment_cameras)))
			<slot> = (<note_value> - $g_moment01_camera_midi_note)
			if ($g_moment_cameras_valid [<slot>] = 0)
				songfilemanager func = get_autocut_cam_data song_name = <song_name> index = <array_entry>
				<moment_array_entry> = (<moment_array_entry> + 1)
				<playing_moment_camera> = FALSE
			endif
		endif
		<in_crowd> = 0
		if GetNoteMapping section = cameras note_value = <note_value>
			clip_get_time_and_frame
			SpawnScriptNow (<note_data>.Scr) params = {(<note_data>.params) length = <length>}
		endif
	endif
	Change last_camera_array_entry = <array_entry>
	if (<playing_moment_camera> = true)
		<moment_array_entry> = (<moment_array_entry> + 1)
		end_moment_camera_time = (<next_time> + <length>)
		allowed_error = 100
		end_moment_camera_time = (<end_moment_camera_time> - <allowed_error>)
		begin
		songfilemanager func = get_autocut_cam_time song_name = <song_name> index = <array_entry>
		if (<camera_time> >= <end_moment_camera_time>)
			break
		endif
		<array_entry> = (<array_entry> + 1)
		if (<array_entry> >= <array_Size>)
			Change \{CameraCuts_NextNoteCameraTime = -1}
			return
		endif
		repeat
	else
		<array_entry> = (<array_entry> + 1)
		if (<array_entry> >= <array_Size>)
			Change \{CameraCuts_NextNoteCameraTime = -1}
			return
		endif
	endif
	repeat
	Change \{CameraCuts_NextNoteCameraTime = -1}
endscript

script set_moment_camera_states \{valid = 1}
	GetArraySize ($g_moment_cameras_valid)
	if (<array_Size> > 0)
		<i> = 0
		begin
		SetArrayElement ArrayName = g_moment_cameras_valid globalarray index = <i> NewValue = <valid>
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
endscript

script autocut_cameracuts_iterator 
	printf \{channel = marccam
		qs(0xb6bce4db)}
	gamemode_gettype
	if (($cheat_focusmode = 1 && <Type> != career) || $calibrate_lag_enabled = 1)
		printf \{channel = marccam
			qs(0x5715daba)}
		return
	endif
	GetArraySize \{$autocut_cameraarray}
	if (<array_Size> = 0)
		ScriptAssert \{'autocut camera array is empty!'}
		return
	endif
	Change \{CameraCuts_NextNoteCameraTime = -1}
	setupinitialsonghandcamparams <...>
	SetNoteMappings \{section = cameras
		mapping = $CameraCuts_NoteMapping}
	array_entry = 0
	Change \{last_camera_array_entry = 0}
	GetSongTimeMs time_offset = <time_offset>
	begin
	camera_time = ($autocut_cameraarray [<array_entry>])
	if ((<time> - <skipleadin>) < <camera_time>)
		break
	endif
	<array_entry> = (<array_entry> + 2)
	repeat (<array_Size> / 2)
	printf channel = marccam qs(0x4e3b437d) a = <array_Size>
	if (<array_entry> >= <array_Size>)
		Change \{CameraCuts_NextNoteCameraTime = -1}
		return
	endif
	Change last_camera_array_entry = <array_entry>
	begin
	next_camera_time = ($autocut_cameraarray [<array_entry>])
	next_note_value = ($autocut_cameraarray [<array_entry> + 1])
	next_time = <next_camera_time>
	next_type = autocutcameras
	decompressnotevalue note_value = <next_note_value>
	Change CameraCuts_NextNoteCameraTime = (<next_time> - <time_offset>)
	begin
	GetSongTimeMs time_offset = <time_offset>
	if (<time> >= <next_time>)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	if ($CameraCuts_AllowNoteScripts = true)
		if GetNoteMapping section = cameras note_value = <note_value>
			clip_get_time_and_frame
			SpawnScriptNow (<note_data>.Scr) params = {(<note_data>.params) length = <length>}
		endif
	endif
	Change last_camera_array_entry = <array_entry>
	<array_entry> = (<array_entry> + 2)
	if (<array_entry> >= <array_Size>)
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
		if NOT songglobalexists Name = <event_array>
			ScriptAssert '$%e does not exist' e = <event_array>
			return
		endif
		index = 0
		getsongarraysize <event_array>
		if (<array_Size> > 0)
			begin
			getsongglobal Name = <event_array> index = <index>
			if (<element>.time < 100)
				if (<element>.Scr = setsonghandcamparams)
					setsonghandcamparams (<element>.params)
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
		return \{FALSE}
	endif
	i = (<i> + 1)
	repeat 4
	return \{FALSE}
endscript

script adjust_cameras_for_alt_closeups 
	use_alt_cams = FALSE
	switch <Type>
		case guitarist_closeup
		if is_playing_instrument \{position = GUITARIST
				instrument = drum}
			use_alt_cams = true
		endif
		case bassist_closeup
		if is_playing_instrument \{position = BASSIST
				instrument = drum}
			use_alt_cams = true
		endif
		case Singer_CloseUp
		if is_playing_instrument \{position = vocalist
				instrument = drum}
			use_alt_cams = true
		endif
		case drummer_closeup
		if NOT is_playing_instrument \{position = drummer
				instrument = drum}
			use_alt_cams = true
		endif
		case drummer_stage
		if NOT is_playing_instrument \{position = drummer
				instrument = drum}
			use_alt_cams = true
		endif
		case s_across_stage
		if is_playing_instrument \{position = GUITARIST
				instrument = drum}
			use_alt_cams = true
		endif
		if is_playing_instrument \{position = BASSIST
				instrument = drum}
			use_alt_cams = true
		endif
		if is_playing_instrument \{position = vocalist
				instrument = drum}
			use_alt_cams = true
		endif
		case g_across_stage
		if is_playing_instrument \{position = GUITARIST
				instrument = drum}
			use_alt_cams = true
		endif
		if is_playing_instrument \{position = BASSIST
				instrument = drum}
			use_alt_cams = true
		endif
		if is_playing_instrument \{position = vocalist
				instrument = drum}
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
		Type = None
		Name = None
		length = 0
		in_crowd = 0
		disablechangecam = FALSE}
	if NOT ($debug_camera_array = None)
		return
	endif
	if GotParam \{sync}
		wait_for_next_odd_frame
	endif
	if (<in_crowd> = 1)
		if ($g_last_camera_in_crowd = 0)
			SpawnScriptNow \{audio_crowd_start_inner_perspective}
			Change \{g_last_camera_in_crowd = 1}
		endif
	else
		if ($g_last_camera_in_crowd = 1)
			SpawnScriptNow \{audio_crowd_kill_inner_perspective}
			Change \{g_last_camera_in_crowd = 0}
		endif
	endif
	adjust_cameras_for_alt_closeups <...>
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
		Change cameracuts_nextdisablecam = <disablechangecam>
		CameraCuts_EnableChangeCam \{enable = true}
	endif
endscript

script get_camera_special_suffix 
	playlist_getcurrentsong
	if (<current_song> = $quest_chapter_finale.songs [2])
		if quest_progression_is_chapter_finale
			return \{true
				special_suffix = '_battle'}
		endif
	endif
	GetPakManCurrent \{map = zones}
	if (<pak> = z_modular)
		get_current_scene_swap
		if (<current_scene_swap> = dream)
			return \{true
				special_suffix = '_dream'}
		elseif (<current_scene_swap> = temple)
			return \{true
				special_suffix = '_temple'}
		endif
	endif
	return \{FALSE
		special_suffix = ''}
endscript

script set_defaultcameracut_perf_with_special_suffix \{perf = 'good'
		perf_checksum = good
		special_suffix = ''}
	GetPakManCurrentName \{map = zones}
	getnumplayersingame
	if (<num_players> = 2)
		formatText checksumName = Cameras_Array '%s_%p_%c_2p%f' p = $CameraCuts_ArrayPrefix c = <perf> s = <pakname> f = <special_suffix>
		if GlobalExists Name = <Cameras_Array> Type = array
			CameraCuts_SetArray Type = <perf_checksum> array = <Cameras_Array>
			return
		endif
		formatText checksumName = Cameras_Array '%s_%p_2p%f' p = $CameraCuts_ArrayPrefix s = <pakname> f = <special_suffix>
		if GlobalExists Name = <Cameras_Array> Type = array
			CameraCuts_SetArray Type = <perf_checksum> array = <Cameras_Array>
			return
		endif
	endif
	formatText checksumName = Cameras_Array '%s_%p_%c%f' p = $CameraCuts_ArrayPrefix c = <perf> s = <pakname> f = <special_suffix>
	if GlobalExists Name = <Cameras_Array> Type = array
		CameraCuts_SetArray Type = <perf_checksum> array = <Cameras_Array>
		return
	endif
	formatText checksumName = Cameras_Array '%s_%p%f' p = $CameraCuts_ArrayPrefix s = <pakname> f = <special_suffix>
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
	ScriptAssert \{qs(0xce687931)}
endscript

script set_defaultcameracut_perf \{perf = 'good'
		perf_checksum = good}
	GetPakManCurrentName \{map = zones}
	getnumplayersingame
	if (<num_players> = 2)
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
	ScriptAssert \{qs(0xce687931)}
endscript

script set_defaultcameracuts 
	if get_camera_special_suffix
		set_defaultcameracut_perf_with_special_suffix perf = 'good' perf_checksum = good special_suffix = <special_suffix>
		set_defaultcameracut_perf_with_special_suffix perf = 'normal' perf_checksum = medium special_suffix = <special_suffix>
		set_defaultcameracut_perf_with_special_suffix perf = 'poor' perf_checksum = poor special_suffix = <special_suffix>
		return
	endif
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
	Wait \{1
		gameframe}
	repeat
endscript

script play_cameracut \{prefix = 'cameras_no_band'
		transition_time = 5}
	if NOT GotParam \{from_switch_to_no_band_camera}
		KillSpawnedScript \{Name = switch_to_no_band_camera}
	endif
	Change \{cameracuts_preprocess_autocameras = FALSE}
	Change \{camera_cut_played = 1}
	wait_for_play_camera_to_complete
	SpawnScriptNow play_cameracut_spawned params = {<...>}
endscript

script stop_cameracut 
	if ($camera_cut_played = 0)
		return
	endif
	wait_for_play_camera_to_complete
	KillCamAnim \{Name = CameraCutCam}
	restore_dummy_bg_camera
	Change \{camera_cut_played = 0}
endscript

script play_cameracut_spawned 
	Change \{camera_cut_playing = 1}
	finalprintf qs(0xfd72d251) s = <prefix> t = $cameracuts_init d = $debug_camera_array
	KillCamAnim \{all}
	create_cameracuts initial_params = {prefix = <prefix> length = <transition_time> changenow} extra_params = {force_time = <transition_time>} play_hold = 1
	Wait \{4
		gameframes}
	CameraCuts_EnableChangeCam \{enable = FALSE}
	destroy_cameracuts \{leave_camera_playing}
	Change \{camera_cut_playing = 0}
endscript

script create_cameracuts \{extra_params = {
		}
		play_hold = 0
		in_game = 0}
	if ($cameracuts_init = true)
		return
	else
		Change \{cameracuts_init = true}
	endif
	kill_dummy_bg_camera
	reset_cameracuts_internal_vars in_game = <in_game>
	if ($cameracuts_preprocess_autocameras = true)
		build_autocut_camera_array in_game = <in_game>
	endif
	if GotParam \{initial_params}
		CameraCuts_SetArrayPrefix <initial_params>
	endif
	CameraCuts_StartCallback extra_params = <extra_params> play_hold = <play_hold>
endscript

script reset_cameracuts_internal_vars 
	if ($cameracuts_init = FALSE)
		ScriptAssert \{qs(0xa13a9b7f)}
	endif
	Change \{CameraCuts_ArrayPrefix = 'cameras'}
	set_defaultcameracuts
	Change \{CameraCuts_LastType = None}
	Change \{CameraCuts_LastDownbeatIndex = 0}
	Change \{CameraCuts_ForceChangeTime = 0.0}
	Change \{CameraCuts_ForceType = None}
	Change \{CameraCuts_NextName = None}
	Change \{cameracuts_preprocess_autocameras = FALSE}
	<jam_song> = 0
	if is_current_song_a_jam_session
		ui_event_get_top
		if (<in_game> = 1)
			<jam_song> = 1
		endif
	endif
	if ($game_mode = tutorial || $game_mode = practice)
		Change \{CameraCuts_ChangeCamEnable = FALSE}
		Change \{CameraCuts_AllowNoteScripts = FALSE}
	elseif (<jam_song> = 1)
		Change \{CameraCuts_ChangeCamEnable = true}
		Change \{CameraCuts_AllowNoteScripts = true}
		Change \{cameracuts_preprocess_autocameras = true}
	else
		Change \{CameraCuts_ChangeCamEnable = true}
		Change \{CameraCuts_AllowNoteScripts = true}
	endif
	Change \{CameraCuts_Enabled = true}
endscript

script CameraCuts_GetNextDownbeat 
	playlist_getcurrentsong
	get_song_prefix song = <current_song>
	formatText checksumName = event_array '%s_lightshow_notes' s = <song_prefix> AddToStringLookup = true
	if NOT songglobalexists Name = <event_array> Type = array
		return FALSE endtime = <endtime>
	endif
	getsongarraysize <event_array>
	array_count = ($CameraCuts_LastDownbeatIndex)
	array_Size = (<array_Size> - <array_count>)
	array_Size = (<array_Size> / 2)
	if (<array_Size> > 0)
		begin
		getsongglobal Name = <event_array> index = (<array_count> + 1)
		decompressnotevalue note_value = <element>
		if (<note_value> = 58 || <note_value> = 57)
			getsongglobal Name = <event_array> index = <array_count>
			if (<element> > <endtime>)
				Change CameraCuts_LastDownbeatIndex = <array_count>
				return true endtime = <element>
			endif
		endif
		array_count = (<array_count> + 2)
		repeat <array_Size>
	endif
	printf \{channel = clip
		qs(0x29017cad)}
	return FALSE endtime = <endtime>
endscript

script CameraCuts_StartCallback \{extra_params = {
		}
		play_hold = 0}
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
	if NOT ($CameraCuts_NextName = None)
		CameraCut_GetArraySize Camera_Array = <Camera_Array> Name = ($CameraCuts_NextName) target_node = <target_node>
	elseif NOT ($CameraCuts_ForceType = None)
		CameraCut_GetArraySize Camera_Array = <Camera_Array> includetype = $CameraCuts_ForceType target_node = <target_node>
	else
		if is_current_song_a_jam_session
			CameraCut_GetArraySize Camera_Array = <Camera_Array> excludename = $cameracuts_lastname target_node = <target_node>
		else
			CameraCut_GetArraySize Camera_Array = <Camera_Array> excludetype = $CameraCuts_LastType target_node = <target_node>
		endif
	endif
	if (<array_Size> = 0)
		newindex = 0
	else
		GetRandomValue Name = newindex integer a = 0 b = (<array_Size> - 1)
		CameraCut_GetCameraIndex Camera_Array = <Camera_Array> newindex = <newindex>
	endif
	debug_flags = None
	if NOT ($debug_camera_array = None)
		get_camera_special_suffix
		found = 0
		formatText checksumName = New_Camera_Array '%s_%p%b' s = $debug_camera_array_pakname p = $debug_camera_array b = <special_suffix>
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
	if ($debug_show_camera_name = 1)
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
	if StructureContains structure = <camStruct> DOF
		if StructureContains structure = (<camStruct>.DOF) screen_FX
			dofType = (<camStruct>.DOF)
			dofParam = (<dofType>.screen_FX [0])
		endif
	else
		dofParam = ($DOF_Off_TOD_Manager.screen_FX [0])
	endif
	SpawnScriptNow deferredcameraeffectsproc params = {dofParam = <dofParam>}
	if StructureContains structure = <camStruct> ao
		if StructureContains structure = (<camStruct>.ao) screen_FX
			aotype = (<camStruct>.ao)
		endif
	else
		aotype = $ao_default_tod_manager
	endif
	SpawnScriptNow applyao params = {ao = <aotype>}
	if StructureContains structure = ($<Camera_Array> [<newindex>]) CrowdOff
		enable_crowd_models_cfunc \{Active = FALSE}
	else
		enable_crowd_models_cfunc \{Active = true}
	endif
	if StructureContains structure = ($<Camera_Array> [<newindex>]) ShadowCasters
		Change CameraCuts_ShadowCasters = ($<Camera_Array> [<newindex>].ShadowCasters)
	else
		Change \{CameraCuts_ShadowCasters = None}
	endif
	bandmanager_notifyallofcameracut
	GetSongTimeMs
	Change CameraCuts_LastCameraStartTime = <time>
	if ($display_clip_info = true)
		clip_get_time_and_frame
		printf channel = clip qs(0xbb73757a) a = <time_string>
	endif
	CamParams = ($<Camera_Array> [<newindex>])
	cameracut_remapbandmemberlookats
	if StructureContains structure = <camStruct> Name
		Camera_Name = (<camStruct>.Name)
	else
		Camera_Name = $CameraCuts_NextName
	endif
	prepare_mocap_lock_target Camera = <Camera_Name>
	if ($cameracuts_nextextraparamsset = 1)
		Change \{cameracuts_nextextraparamsset = 0}
		extra_params = $cameracuts_nextextraparams
	endif
	if ($cameracuts_nextdisablecam = true)
		Change \{cameracuts_nextdisablecam = FALSE}
		CameraCuts_EnableChangeCam \{enable = FALSE}
	endif
	PlayIGCCam {
		time = <camera_time>
		viewport = bg_viewport
		controlscript = CameraCuts_StaticCamControl
		params = {CamParams = <CamParams>}
		far_clip = 500.0
		<CamParams>
		exitscript = CameraCuts_StartCallback
		play_hold = <play_hold>
		Name = CameraCutCam
		<debug_flags>
		extra_params = <extra_params>
	}
	dynamic_ad_update_camera_ok_for_venue_ad_flag
endscript

script get_musician_mocap_lock_target 
	get_musician_id Name = <Name>
	formatText TextName = suffix '_mocap_lock_target_0%a' a = <Camera>
	ExtendCrc <Name> <suffix> out = lock_target
	return lock_target = <lock_target>
endscript

script prepare_mocap_lock_target 
	switch <Camera>
		case guitarist_mocap01
		get_musician_mocap_lock_target \{Name = GUITARIST
			Camera = 1}
		case guitarist_mocap02
		get_musician_mocap_lock_target \{Name = GUITARIST
			Camera = 2}
		case bassist_mocap01
		get_musician_mocap_lock_target \{Name = BASSIST
			Camera = 1}
		case bassist_mocap02
		get_musician_mocap_lock_target \{Name = BASSIST
			Camera = 2}
		case singer_mocap01
		get_musician_mocap_lock_target \{Name = vocalist
			Camera = 1}
		case singer_mocap02
		get_musician_mocap_lock_target \{Name = vocalist
			Camera = 2}
		case drummer_mocap01
		get_musician_mocap_lock_target \{Name = drummer
			Camera = 1}
		case drummer_mocap02
		get_musician_mocap_lock_target \{Name = drummer
			Camera = 2}
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

script deferredcameraeffectsproc 
	wait_for_next_even_frame
	Wait \{1
		gameframe}
	broadcastevent \{Type = cameracutevent}
	if ($game_mode = tutorial)
		return
	endif
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
	jumbotronname = ''
	if NOT ($current_jumbotron = None)
		current_index = ($jumbotron_camera_index)
		if StructureContains structure = (($jumbotron_camera_params) [<current_index>]) params
			if StructureContains structure = (($jumbotron_camera_params) [<current_index>].params) Name
				jumbotronname = (($jumbotron_camera_params) [<current_index>].params.Name)
			endif
		endif
		if StructureContains structure = (($jumbotron_camera_params) [<current_index>]) Name
			jumbotronname = (($jumbotron_camera_params) [<current_index>].Name)
		endif
	endif
	formatText TextName = cameraname qs(0x4558200d) s = <cameraname_crc> t = $CameraCuts_LastType c = <Crowd> DontAssertForChecksums donotresolve
	debug_camera_name_text :se_setprops text = <cameraname>
	printf qs(0x4771a1ab) s = <cameraname>
	cameraname = qs(0x00000000)
	if NOT (<jumbotronname> = '')
		formatText TextName = cameraname qs(0x96316117) DontAssertForChecksums donotresolve j = <jumbotronname>
	endif
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
autocut_cameraarray = [
]
autocut_tempoarray = [
]

script build_autocut_camera_array \{in_game = 0}
	printf \{channel = marccam
		qs(0x86963ea0)}
	Change \{autocut_cameraarray = [
		]}
	printf \{channel = cameratest
		qs(0x2795cf95)}
	playlist_getcurrentsong
	songfilemanager func = get_num_fretbar_notes song_name = <current_song>
	fretbar_array_size = (<num_fretbar_notes> - 1)
	printf channel = marccam qs(0xff841032) a = <fretbar_array_size>
	first_camera_note = 28
	last_camera_note = 31
	num_weights = ((<last_camera_note> - <first_camera_note>) + 1)
	GetArraySize \{$autocut_camera_table}
	num_cameras_available = <array_Size>
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
	songfilemanager func = get_fretbar_note song_name = <current_song> index = <array_entry>
	time1 = <fretbar_time>
	songfilemanager func = get_fretbar_note song_name = <current_song> index = (<array_entry> + 1)
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
	forcecut = FALSE
	if ((<time1> > <max_time>) || (<time1> = 0))
		forcecut = true
		min_delay = 2000
		max_delay = 4000
		min_beats = 4
		max_beats = 8
		GetRandomValue a = <min_beats> b = <max_beats> Name = num_beats integer
		next_index = (<array_entry> + <num_beats>)
		if (<next_index> >= <fretbar_array_size>)
			next_index = (<fretbar_array_size> - 1)
		endif
		songfilemanager func = get_fretbar_note song_name = <current_song> index = <next_index>
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
			is_first_camera = FALSE
		else
			total = 0
			index = 0
			begin
			weight = ((<temp_weights> [<index>]))
			total = (<total> + <weight>)
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
			SetArrayElement ArrayName = percent index = <index> NewValue = <running_pct>
			SetArrayElement ArrayName = dbg_percent index = <index> NewValue = (<normalized> * 100)
			index = (<index> + 1)
			repeat <num_cameras_available>
			GetRandomValue \{a = 0
				b = 1
				Name = random_pct}
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
		SetArrayElement ArrayName = weights index = <index> NewValue = <new_weight>
		index = (<index> + 1)
		repeat <num_cameras_available>
		SetArrayElement ArrayName = weights index = <selected_camera> NewValue = 1
		temp_weights = <weights>
		exclusions = ($autocut_camera_table [<selected_camera>].exclusions)
		GetArraySize <exclusions>
		if (<array_Size> > 0)
			index = 0
			begin
			next_excluded_camera = (<exclusions> [<index>])
			search_index = 0
			begin
			if (($autocut_camera_table [<search_index>].Camera) = <next_excluded_camera>)
				SetArrayElement ArrayName = temp_weights index = <search_index> NewValue = 0
				break
			endif
			search_index = (<search_index> + 1)
			if (<search_index> > <num_cameras_available>)
				break
			endif
			repeat
			index = (<index> + 1)
			repeat <array_Size>
		endif
		camera_note = ($autocut_camera_table [<selected_camera>].Camera)
		printf qs(0xae6f4584) a = <camera_note> b = <selected_camera> c = <random_pct>
		if (<last_note> != -1)
			camera_velocity = <anim_tempo>
			printf channel = cameratest qs(0xb482ed0e) a = <camera_velocity>
			length = (<time1> - <last_time>)
			CastToInteger \{last_velocity}
			compressnotevalue length = <length> note_value = <last_note> velocity = <last_velocity>
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
	compressnotevalue length = <length> note_value = <last_note> velocity = <last_velocity>
	AddArrayElement array = <array> element = <time1>
	AddArrayElement array = <array> element = <note_value>
	Change autocut_cameraarray = <array>
	if (<in_game> = 1)
		return
	endif
	array = []
	array_entry = 0
	begin
	songfilemanager func = get_fretbar_note song_name = <current_song> index = <array_entry>
	time1 = <fretbar_time>
	songfilemanager func = get_fretbar_note song_name = <current_song> index = (<array_entry> + 1)
	time2 = <fretbar_time>
	time_diff = (<time2> - <time1>)
	tempo = ((1000.0 / <time_diff>) * 60.0)
	CastToInteger \{tempo}
	AddArrayElement array = <array> element = <time1>
	AddArrayElement array = <array> element = <tempo>
	array_entry = (<array_entry> + 1)
	repeat (<fretbar_array_size> - 2)
	Change autocut_tempoarray = <array>
	dumpautocutarray
endscript

script destroy_cameracuts 
	Change \{cameracuts_init = FALSE}
	Change \{CameraCuts_Enabled = FALSE}
	KillSpawnedScript \{Name = CameraCuts_StartCallback}
	KillSpawnedScript \{Name = deferredcameraeffectsproc}
	if NOT GotParam \{leave_camera_playing}
		KillCamAnim \{Name = CameraCutCam}
	endif
	if ScreenElementExists \{id = debug_no_cameras}
		DestroyScreenElement \{id = debug_no_cameras}
	endif
	ClearNoteMappings \{section = cameras}
	KillSpawnedScript \{Name = cameracuts_iterator}
	KillSpawnedScript \{Name = autocut_cameracuts_iterator}
	if NOT GotParam \{leave_camera_playing}
		restore_dummy_bg_camera
	endif
endscript
profiling_cameracuts = FALSE

script profile_camera_cuts \{FileName = qs(0xd8a6b977)}
	if ($profiling_cameracuts = true)
		return
	endif
	Change \{profiling_cameracuts = true}
	hide_analog_options
	setslomo \{0.001}
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
forcecamerachangeforfreeplayintroflag = FALSE

script forcecamerachangeforfreeplayintro 
	gamemode_gettype
	if (<Type> != freeplay)
		return
	endif
	Change \{forcecamerachangeforfreeplayintroflag = true}
	Change \{cameracuts_nextextraparamsset = 0}
endscript

script CameraCuts_WaitScript \{camera_time = 0
		camera_songtime = 0}
	if GotParam \{force_time}
		Change \{forcecamerachangeforfreeplayintroflag = FALSE}
		elapsed_time = 0.0
		begin
		if ($forcecamerachangeforfreeplayintroflag = true)
			return \{true}
		endif
		GetDeltaTime
		<elapsed_time> = (<elapsed_time> + <delta_time>)
		if (<elapsed_time> > <force_time>)
			break
		endif
		Wait \{1
			gameframe}
		repeat
		begin
		if ($CameraCuts_ChangeCamEnable = true)
			return \{true}
		endif
		Wait \{1
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
	if GotParam \{noWait}
		return \{FALSE}
	endif
	Wait \{1
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
	RequireParams \{[
			camera_songtime
		]
		all}
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
	RequireParams \{[
			camera_songtime
			Seconds
		]
		all}
	if ScriptIsRunning \{memcard_wait_for_timer}
		ScriptAssert \{'Using ResetTimer/TimeGreaterThan here is a problem!'}
	endif
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

script applyao \{ao = $ao_far_tod_manager}
	aotype = <ao>
	aoparam = (<aotype>.screen_FX [0])
	if NOT screenFX_FXInstanceExists \{viewport = bg_viewport
			Name = ambient_occlusion}
		ScreenFX_AddFXInstance {
			viewport = bg_viewport
			Name = ambient_occlusion
			<aoparam>
		}
	else
		ScreenFX_UpdateFXInstanceParams {
			viewport = bg_viewport
			Name = ambient_occlusion
			<aoparam>
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
	if (<camera_time> < 0.1)
		camera_time = 0.1
	endif
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
Default_Cameras_Good = [
	{
		Name = good_from_stage
		play_hold = 1
		LockTo = GUITARIST
		Pos = (1.5175159, 4.1361775, -4.089658)
		Quat = (0.130047, -0.018706, 0.0024160002)
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
]
default_cameras_moments = [
	{
		Name = moment01
		LockTo = moment_cam_lock_target_01
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 72.0
	}
	{
		Name = moment02
		LockTo = moment_cam_lock_target_02
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 72.0
	}
	{
		Name = moment03
		LockTo = moment_cam_lock_target_03
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 72.0
	}
	{
		Name = moment04
		LockTo = moment_cam_lock_target_04
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 72.0
	}
	{
		Name = moment05
		LockTo = moment_cam_lock_target_05
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 72.0
	}
	{
		Name = moment06
		LockTo = moment_cam_lock_target_06
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 72.0
	}
	{
		Name = moment07
		LockTo = moment_cam_lock_target_07
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 72.0
	}
	{
		Name = moment08
		LockTo = moment_cam_lock_target_08
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 72.0
	}
	{
		Name = moment09
		LockTo = moment_cam_lock_target_09
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 72.0
	}
	{
		Name = moment10
		LockTo = moment_cam_lock_target_10
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 72.0
	}
]
default_cameras_guitarist = [
	{
		Name = rrrrrrrrrrrrrrrrrrrrrrrrguitarist_closeup
		Type = guitarist_closeup
		LockTo = World
		Pos = (-6.321385, 0.924312, -2.6622968)
		Quat = (-0.026229998, 0.784364, 0.032947995)
		FOV = 72.0
	}
	{
		Name = guitarist_stage
		LockTo = World
		Pos = (-6.321385, 0.924312, -2.6622968)
		Quat = (-0.026229998, 0.784364, 0.032947995)
		FOV = 72.0
	}
	{
		Name = guitarist_mocap01
		LockTo = musician1_mocap_lock_target_01
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 72.0
	}
	{
		Name = guitarist_mocap02
		LockTo = musician1_mocap_lock_target_02
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 72.0
	}
]
default_cameras_singer = [
	{
		Name = Singer_CloseUp
		Type = Singer_CloseUp
		LockTo = World
		Pos = (-6.321385, 0.924312, -2.6622968)
		Quat = (-0.026229998, 0.784364, 0.032947995)
		FOV = 72.0
	}
	{
		Name = singer_stage
		LockTo = World
		Pos = (-6.321385, 0.924312, -2.6622968)
		Quat = (-0.026229998, 0.784364, 0.032947995)
		FOV = 72.0
	}
	{
		Name = singer_mocap01
		LockTo = musician3_mocap_lock_target_01
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 72.0
	}
	{
		Name = singer_mocap02
		LockTo = musician3_mocap_lock_target_02
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 72.0
	}
]
default_cameras_bassist = [
	{
		Name = bassist_closeup
		Type = bassist_closeup
		LockTo = World
		Pos = (-6.321385, 0.924312, -2.6622968)
		Quat = (-0.026229998, 0.784364, 0.032947995)
		FOV = 72.0
	}
	{
		Name = bassist_stage
		LockTo = World
		Pos = (-6.321385, 0.924312, -2.6622968)
		Quat = (-0.026229998, 0.784364, 0.032947995)
		FOV = 72.0
	}
	{
		Name = bassist_mocap01
		LockTo = musician2_mocap_lock_target_01
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 72.0
	}
	{
		Name = bassist_mocap02
		LockTo = musician2_mocap_lock_target_02
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 72.0
	}
]
default_cameras_drummer = [
	{
		Name = drummer_closeup
		Type = drummer_closeup
		LockTo = World
		Pos = (-6.321385, 0.924312, -2.6622968)
		Quat = (-0.026229998, 0.784364, 0.032947995)
		FOV = 72.0
	}
	{
		Name = drummer_stage
		Type = drummer_stage
		LockTo = World
		Pos = (-6.321385, 0.924312, -2.6622968)
		Quat = (-0.026229998, 0.784364, 0.032947995)
		FOV = 72.0
	}
	{
		Name = drummer_mocap01
		LockTo = musician4_mocap_lock_target_01
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 72.0
	}
	{
		Name = drummer_mocap02
		LockTo = musician4_mocap_lock_target_02
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 72.0
	}
]
default_cameras = [
	{
		Name = LongShot
		Type = LongShot
		LockTo = World
		Pos = (-6.321385, 0.924312, -2.6622968)
		Quat = (-0.026229998, 0.784364, 0.032947995)
		FOV = 72.0
	}
	{
		Name = midshot
		Type = midshot
		LockTo = World
		Pos = (-6.321385, 0.924312, -2.6622968)
		Quat = (-0.026229998, 0.784364, 0.032947995)
		FOV = 72.0
	}
	{
		Name = venue_midshot
		Type = venue_midshot
		LockTo = World
		Pos = (-6.321385, 0.924312, -2.6622968)
		Quat = (-0.026229998, 0.784364, 0.032947995)
		FOV = 72.0
	}
	{
		Name = generic_stage_shot
		Type = generic_stage_shot
		LockTo = World
		Pos = (-6.321385, 0.924312, -2.6622968)
		Quat = (-0.026229998, 0.784364, 0.032947995)
		FOV = 72.0
	}
]
default_cameras_headtohead = [
	{
		Name = headtohead_longshot
		controlscript = CameraCuts_HandCam
		params = {
			LockTo = World
			Pos = (2.984848, 2.319129, 8.964585)
			Quat = (0.013296999, -0.9863979, 0.09915701)
			FOV = 72.0
		}
	}
	{
		Name = headtohead_midshot
		controlscript = CameraCuts_HandCam
		params = {
			LockTo = World
			Pos = (2.286206, 1.399632, -0.8574021)
			Quat = (0.013289999, -0.97393197, 0.058316004)
			FOV = 72.0
		}
	}
	{
		Name = headtohead_venue_midshot
		controlscript = CameraCuts_HandCam
		params = {
			LockTo = World
			Pos = (0.48657104, 1.8374078, 4.633928)
			Quat = (0.00057300006, -0.99960995, 0.019561999)
			FOV = 72.0
		}
	}
	{
		Name = headtohead_stage_shot
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
		Name = jammode_longshot
		controlscript = CameraCuts_HandCam
		params = {
			LockTo = World
			Pos = (3.9096844, 2.581986, 12.654455)
			Quat = (0.026690999, -0.968614, 0.123729)
			FOV = 72.0
		}
	}
	{
		Name = jammode_midshot
		controlscript = CameraCuts_HandCam
		params = {
			LockTo = World
			Pos = (0.055207, 2.071424, 9.734074)
			Quat = (0.001375, -0.990425, 0.137294)
			FOV = 72.0
		}
	}
	{
		Name = jammode_venue_midshot
		controlscript = CameraCuts_HandCam
		params = {
			LockTo = World
			Pos = (-4.4341054, 2.250556, 13.4862995)
			Quat = (0.020083, 0.97846603, -0.10951801)
			FOV = 72.0
		}
	}
	{
		Name = jammode_stage_shot
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
		Name = solo_guitar
		Type = solo_guitar
		LockTo = World
		Pos = (-6.321385, 0.924312, -2.6622968)
		Quat = (-0.026229998, 0.784364, 0.032947995)
		FOV = 72.0
	}
	{
		Name = solo_vocal
		Type = solo_vocal
		LockTo = World
		Pos = (-6.321385, 0.924312, -2.6622968)
		Quat = (-0.026229998, 0.784364, 0.032947995)
		FOV = 72.0
	}
	{
		Name = solo_drum
		Type = solo_drum
		LockTo = World
		Pos = (-6.321385, 0.924312, -2.6622968)
		Quat = (-0.026229998, 0.784364, 0.032947995)
		FOV = 72.0
	}
	{
		Name = solo_bass
		Type = solo_bass
		LockTo = World
		Pos = (-6.321385, 0.924312, -2.6622968)
		Quat = (-0.026229998, 0.784364, 0.032947995)
		FOV = 72.0
	}
]
default_cameras_single = [
	{
		Name = single_guitar
		Type = single
		LockTo = World
		Pos = (-6.321385, 0.924312, -2.6622968)
		Quat = (-0.026229998, 0.784364, 0.032947995)
		FOV = 72.0
	}
	{
		Name = single_vocal
		Type = single
		LockTo = World
		Pos = (-4.3443885, 0.950269, -0.84059906)
		Quat = (1.9E-05, 0.99112797, -0.001512)
		FOV = 72.0
	}
	{
		Name = single_drum
		Type = single
		LockTo = World
		Pos = (-6.321385, 0.924312, -2.6622968)
		Quat = (-0.026229998, 0.784364, 0.032947995)
		FOV = 72.0
	}
	{
		Name = single_bass
		Type = single
		LockTo = World
		Pos = (-4.3443885, 0.950269, -0.84059906)
		Quat = (1.9E-05, 0.99112797, -0.001512)
		FOV = 72.0
	}
]
default_cameras_autocut = [
	{
		Name = Singer_CloseUp
		controlscript = CameraCuts_HandCam
		Type = Singer_CloseUp
		params = {
			handcamcloseup
			LockTo = vocalist
			Pos = (1.5492508, 0.89227194, 3.045015)
			Quat = (-0.027715, -0.9707769, -0.09122801)
			FOV = 13.0
			LookAt = vocalist
			LookAtBone = bone_head
			ScreenOffset = (0.42601603, 0.014149999)
			distfromlookat = 3.695025
		}
		DOF = $DOF_CloseUp02_TOD_Manager
		CrowdOff
	}
	{
		Name = singer_closeup2
		controlscript = CameraCuts_HandCam
		Type = Singer_CloseUp
		params = {
			handcamcloseup
			LockTo = vocalist
			Pos = (-2.334458, 1.118762, 1.899987)
			Quat = (-0.025109, 0.89701205, 0.067262)
			FOV = 11.0
			LookAt = vocalist
			LookAtBone = bone_head
			ScreenOffset = (-0.62771505, 0.075389)
			distfromlookat = 3.354081
		}
		DOF = $DOF_CloseUp01_TOD_Manager
		CrowdOff
	}
	{
		Name = singer_mocap01
		LockTo = vocalist_mocap_lock_target_01
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 65.0
		DOF = $DOF_CloseUp02_TOD_Manager
	}
	{
		Name = singer_mocap02
		LockTo = vocalist_mocap_lock_target_02
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 65.0
		DOF = $DOF_Medium02_TOD_Manager
	}
	{
		Name = guitarist_closeup
		Type = CloseUp
		controlscript = CameraCuts_HandCam
		params = {
			LockTo = GUITARIST
			Pos = (3.6475768, 1.0763031, 1.5907401)
			Quat = (-0.028113, -0.82460296, -0.029011)
			FOV = 25.0
			LookAt = GUITARIST
			LookAtBone = bone_chest
			ScreenOffset = (0.471216, 0.186662)
			distfromlookat = 3.3977568
		}
		DOF = $DOF_CloseUp01_TOD_Manager
		CrowdOff
	}
	{
		Name = guitarist_closeup02
		Type = CloseUp
		controlscript = CameraCuts_HandCam
		params = {
			LockTo = GUITARIST
			Pos = (0.283945, 0.45201203, 4.4524693)
			Quat = (0.0065240003, 0.994423, 0.105216004)
			FOV = 18.0
			LookAt = GUITARIST
			LookAtBone = bone_chest
			ScreenOffset = (0.44280702, 0.31687602)
			distfromlookat = 4.4968452
		}
		DOF = $DOF_CloseUp01_TOD_Manager
		CrowdOff
	}
	{
		Name = guitarist_mocap01
		LockTo = guitarist_mocap_lock_target_01
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 65.0
		DOF = $DOF_CloseUp02_TOD_Manager
	}
	{
		Name = guitarist_mocap02
		LockTo = guitarist_mocap_lock_target_02
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 65.0
		DOF = $DOF_CloseUp01_TOD_Manager
	}
	{
		Name = bassist_closeup
		controlscript = CameraCuts_HandCam
		params = {
			LockTo = BASSIST
			Pos = (-3.7086382, 1.1985401, 1.8435988)
			Quat = (-0.001098, 0.830151, 0.013861)
			FOV = 28.0
			LookAt = BASSIST
			LookAtBone = bone_chest
			ScreenOffset = (-0.419754, -0.019663)
			distfromlookat = 3.61233
		}
		DOF = $DOF_CloseUp02_TOD_Manager
		CrowdOff
	}
	{
		Name = bassist_mocap01
		LockTo = bassist_mocap_lock_target_01
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 65.0
		DOF = $DOF_CloseUp01_TOD_Manager
	}
	{
		Name = bassist_mocap02
		LockTo = bassist_mocap_lock_target_02
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 65.0
		DOF = $DOF_Medium02_TOD_Manager
	}
	{
		Name = drummer_closeup
		Type = drummer_closeup
		controlscript = CameraCuts_TwoCam
		params = {
			UseHandCam
			Cam1 = {
				LockTo = drummer
				Pos = (-0.082587995, 1.004094, 1.6833342)
				Quat = (0.0067860004, 0.99438393, 0.000623)
				FOV = 32.0
				LookAt = drummer
				LookAtBone = bone_head
				ScreenOffset = (-0.251453, -0.21729802)
				distfromlookat = 1.752825
			}
			Cam2 = {
				LockTo = drummer
				Pos = (-0.13792199, 1.0048649, 1.6714461)
				Quat = (0.0067760004, 0.9927139, 0.000723)
				FOV = 32.0
				LookAt = drummer
				LookAtBone = bone_head
				ScreenOffset = (-0.24174, -0.21511501)
				distfromlookat = 1.7497649
			}
			CrowdOff
			DOF = $DOF_CloseUp02_TOD_Manager
		}
	}
	{
		Name = drummer_closeup02
		Type = drummer_closeup
		controlscript = CameraCuts_TwoCam
		params = {
			UseHandCam
			Cam1 = {
				LockTo = drummer
				Pos = (1.017448, 0.82566696, 1.235776)
				Quat = (-0.02791, -0.93970597, -0.057794)
				FOV = 32.0
				LookAt = drummer
				LookAtBone = bone_head
				ScreenOffset = (0.33858898, -0.15662)
				distfromlookat = 1.550921
			}
			Cam2 = {
				LockTo = drummer
				Pos = (1.030278, 0.825441, 1.2252411)
				Quat = (-0.028205998, -0.93797094, -0.05765)
				FOV = 32.0
				LookAt = drummer
				LookAtBone = bone_head
				ScreenOffset = (0.33669803, -0.15839502)
				distfromlookat = 1.5494419
			}
			CrowdOff
			DOF = $DOF_CloseUp02_TOD_Manager
		}
	}
	{
		Name = drummer_mocap01
		LockTo = drummer_mocap_lock_target_01
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 65.0
		DOF = $DOF_Medium02_TOD_Manager
	}
	{
		Name = drummer_mocap02
		LockTo = drummer_mocap_lock_target_02
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 65.0
		DOF = $DOF_Medium02_TOD_Manager
	}
	{
		Name = spotlight
		controlscript = CameraCuts_HandCam
		params = {
			LockTo = vocalist
			Pos = (5.2537947, 3.7356453, 5.9229445)
			Quat = (0.057692, -0.937805, 0.20332801)
			FOV = 59.0
		}
		DOF = $DOF_Medium02_TOD_Manager
	}
	{
		controlscript = CameraCuts_SpecialStepMove
		params = {
			Name = audience_r
			Type = audience
			Cam1 = {
				LockTo = vocalist
				Pos = (11.858139, 1.700623, 14.502603)
				Quat = (0.012594, -0.93913496, 0.055007)
				FOV = 37.0
			}
			Cam2 = {
				LockTo = vocalist
				Pos = (11.858139, 1.700623, 14.502603)
				Quat = (0.012594, -0.93913496, 0.055007)
				FOV = 37.0
			}
			StepTime = 6.0
			FinalRotTime = 1.0
			StepNum = 6.0
			StepDir = (0.0, 0.07, 0.05)
			DOF = $DOF_Medium01_TOD_Manager
		}
	}
	{
		controlscript = CameraCuts_SpecialStepMove
		params = {
			Name = audience_c
			Type = audience
			Cam1 = {
				LockTo = vocalist
				Pos = (-1.8534688, 1.89821, 17.983355)
				Quat = (0.011201, 0.995569, -0.062671)
				FOV = 41.0
			}
			Cam2 = {
				LockTo = vocalist
				Pos = (-1.8534688, 1.89821, 17.983355)
				Quat = (0.011201, 0.995569, -0.062671)
				FOV = 41.0
			}
			StepTime = 6.0
			FinalRotTime = 1.0
			StepNum = 6.0
			StepDir = (0.0, 0.07, 0.05)
			DOF = $DOF_Medium01_TOD_Manager
		}
	}
	{
		controlscript = CameraCuts_SpecialStepMove
		params = {
			Name = audience_l
			Type = audience
			Cam1 = {
				LockTo = vocalist
				Pos = (-8.00015, 1.797529, 15.347496)
				Quat = (0.025906, 0.961762, -0.068592)
				FOV = 46.0
			}
			Cam2 = {
				LockTo = vocalist
				Pos = (-8.00015, 1.797529, 15.347496)
				Quat = (0.025906, 0.961762, -0.068592)
				FOV = 46.0
			}
			StepTime = 6.0
			FinalRotTime = 1.0
			StepNum = 6.0
			StepDir = (0.0, 0.07, 0.05)
			DOF = $DOF_Medium01_TOD_Manager
		}
	}
]
default_cameras_special = [
	{
		Name = Special01
		LockTo = World
		Pos = (-6.321385, 0.924312, -2.6622968)
		Quat = (-0.026229998, 0.784364, 0.032947995)
		FOV = 72.0
	}
	{
		Name = Special02
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
			Name = audience_r
			Type = audience
			Cam1 = {
				LockTo = World
				Pos = (5.888749, -0.09943501, 5.550212)
				Quat = (-0.008041001, -0.97881204, -0.039359003)
				FOV = 49.0
				LookAt = vocalist
				ScreenOffset = (-0.32207203, 0.172022)
			}
			Cam2 = {
				LockTo = World
				Pos = (6.091454, -0.099421, 5.463399)
				Quat = (-0.0085080005, -0.97635895, -0.039261)
				FOV = 49.0
				LookAt = vocalist
				ScreenOffset = (-0.30865702, 0.172709)
			}
			StepTime = 6.0
			FinalRotTime = 1.0
			StepNum = 6.0
			StepDir = (0.0, 0.07, 0.05)
			DOF = $DOF_Medium01_TOD_Manager
		}
	}
]
default_cameras_zoom = [
	{
		Name = zoom_in
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
		DOF = $DOF_Medium01_TOD_Manager
	}
	{
		Name = zoom_out
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
		DOF = $DOF_Medium01_TOD_Manager
	}
]
default_cameras_spotlight = [
	{
		Name = spotlight
		LockTo = drummer
		Pos = (-0.59138894, 3.714998, 12.7414465)
		Quat = (0.0042340006, 0.97817, -0.204423)
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
default_cameras_loading = [
	{
		Name = loading
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
		DOF = $DOF_Medium01_TOD_Manager
	}
]
default_cameras_finalbandintro = [
	{
		Name = finalbandintro
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
		DOF = $DOF_Medium01_TOD_Manager
	}
]
default_cameras_finalbandoutro = [
	{
		Name = finalbandoutro
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
		DOF = $DOF_Medium01_TOD_Manager
	}
]
default_cameras_no_band = [
	{
		Name = noband
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
default_cameras_orbits = [
	{
		controlscript = CameraCuts_Orbit
		params = {
			Name = orbit_low
			Type = orbit_low
			LockTo = drummer
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
			Name = orbit_low02
			Type = orbit_low
			LockTo = drummer
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
			Name = orbit_high
			Type = orbit_high
			LockTo = drummer
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
			Name = orbit_high02
			Type = orbit_high
			LockTo = drummer
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
		Name = vert_front01
		Type = verts_front
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
		DOF = $DOF_Medium01_TOD_Manager
	}
]
default_cameras_verts_rear = [
	{
		Name = vert_rear01
		Type = verts_rear
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
		DOF = $DOF_Medium01_TOD_Manager
	}
]
default_cameras_g_across_stage = [
	{
		Name = g_across_stage
		Type = g_across_stage
		controlscript = CameraCuts_HandCam
		params = {
			handcamcloseup
			LockTo = GUITARIST
			Pos = (-10.524325, 1.2712423, 1.0648409)
			Quat = (0.0075330003, 0.731524, -0.009516999)
			FOV = 17.0
			LookAt = GUITARIST
			LookAtBone = bone_head
			ScreenOffset = (-0.19467999, -0.636386)
			distfromlookat = 10.103118
		}
		DOF = $dof_across_stage_1_tod_manager
	}
]
default_cameras_s_across_stage = [
	{
		Name = s_across_stage
		Type = s_across_stage
		controlscript = CameraCuts_HandCam
		params = {
			handcamcloseup
			LockTo = vocalist
			Pos = (8.223535, 0.72865397, 0.79751205)
			Quat = (-0.027639, -0.704612, -0.025023999)
			FOV = 12.0
			LookAt = vocalist
			LookAtBone = bone_head
			ScreenOffset = (0.41745302, -0.52084696)
			distfromlookat = 8.893963
		}
		DOF = $dof_across_stage_2_tod_manager
	}
]
default_cameras_nonstandardcloseups = [
	{
		Name = guitarist_node_alt_closeup
		Type = guitarist_closeup
		controlscript = CameraCuts_HandCam
		params = {
			handcamcloseup
			LockTo = GUITARIST
			Pos = (1.089306, 1.145523, 0.94846904)
			Quat = (0.0334, -0.90654695, 0.055017997)
			FOV = 59.0
			LookAt = GUITARIST
			LookAtBone = bone_head
			ScreenOffset = (0.29378498, -0.55152303)
			distfromlookat = 1.4995929
		}
		DOF = $DOF_CloseUp02_TOD_Manager
	}
	{
		Name = vocalist_node_alt_closeup
		Type = vocalist_closeup
		controlscript = CameraCuts_HandCam
		params = {
			handcamcloseup
			LockTo = vocalist
			Pos = (-0.013354, 0.983401, 1.1988411)
			Quat = (-0.012851, 0.9903829, 0.041066997)
			FOV = 49.0
			LookAt = vocalist
			LookAtBone = bone_head
			ScreenOffset = (-0.245973, -0.262334)
			distfromlookat = 1.4501979
		}
		DOF = $DOF_CloseUp01_TOD_Manager
	}
	{
		Name = bassist_node_alt_closeup
		Type = bassist_closeup
		controlscript = CameraCuts_HandCam
		params = {
			handcamcloseup
			LockTo = BASSIST
			Pos = (0.750627, 0.94780207, 0.87759805)
			Quat = (-0.014581999, -0.95217395, -0.071487)
			FOV = 57.0
			LookAt = BASSIST
			LookAtBone = bone_head
			ScreenOffset = (0.267916, -0.23232801)
			distfromlookat = 1.1711142
		}
		DOF = $DOF_CloseUp01_TOD_Manager
	}
	{
		Name = drummer_node_alt_closeup
		Type = drummer_closeup
		controlscript = CameraCuts_HandCam
		params = {
			handcamcloseup
			LockTo = drummer
			Pos = (1.528101, 1.3878909, 1.5932021)
			Quat = (0.027365997, -0.91494495, -0.022584999)
			FOV = 51.0
			LookAt = drummer
			LookAtBone = bone_head
			ScreenOffset = (0.294515, -0.38926402)
			distfromlookat = 1.553067
		}
		DOF = $DOF_CloseUp01_TOD_Manager
	}
	{
		Name = drummer_node_alt_stage
		Type = drummer_stage
		controlscript = CameraCuts_HandCam
		params = {
			LockTo = drummer
			Pos = (1.2863082, 1.6418641, -1.663195)
			Quat = (0.087973, -0.223525, -0.013621)
			FOV = 40.0
			LookAt = drummer
			LookAtBone = bone_head
			ScreenOffset = (0.297159, -0.34113)
			distfromlookat = 2.594049
		}
		DOF = $dof_moment1_1_tod_manager
	}
	{
		Name = s_across_stage_alt
		Type = s_across_stage
		controlscript = CameraCuts_HandCam
		params = {
			LockTo = vocalist
			Pos = (5.7699013, 1.177866, -0.22495198)
			Quat = (0.032962997, -0.689329, 0.021283)
			FOV = 37.0
			LookAt = vocalist
			LookAtBone = bone_head
			ScreenOffset = (0.096578, -0.447606)
			distfromlookat = 5.6147313
		}
		DOF = $dof_moment1_1_tod_manager
	}
	{
		Name = g_across_stage_alt
		Type = g_across_stage
		controlscript = CameraCuts_HandCam
		params = {
			LockTo = GUITARIST
			Pos = (-8.795936, 1.184793, 2.111708)
			Quat = (0.0066980002, 0.781129, -0.020125998)
			FOV = 17.0
			LookAt = GUITARIST
			LookAtBone = bone_head
			ScreenOffset = (-0.13279, -0.505753)
			distfromlookat = 9.247294
		}
		DOF = $dof_moment1_1_tod_manager
	}
	{
		Name = drummer_vert_dolly_alt
		Type = drummer_vert
		controlscript = CameraCuts_HandCam
		params = {
			LockTo = drummer
			Pos = (1.507228, 1.7252821, -2.1122582)
			Quat = (0.080031, -0.294578, -0.021869)
			FOV = 33.0
			LookAt = drummer
			LookAtBone = bone_head
			ScreenOffset = (0.402709, -0.470863)
			distfromlookat = 2.514244
		}
		DOF = $dof_moment1_1_tod_manager
	}
]
default_cameras_debug_face = [
	{
		Name = debug_face_vocal
		Type = debug
		LockTo = vocalist
		LockToBone = bone_head
		Pos = (0.038502, 0.280578, -0.008172)
		Quat = (0.483587, 0.490287, -0.51393396)
		FOV = 93.0
	}
	{
		Name = debug_face_guitar
		Type = debug
		LockTo = GUITARIST
		LockToBone = bone_head
		Pos = (0.038502, 0.280578, -0.008172)
		Quat = (0.483587, 0.490287, -0.51393396)
		FOV = 93.0
	}
	{
		Name = debug_face_bass
		Type = debug
		LockTo = BASSIST
		LockToBone = bone_head
		Pos = (0.038502, 0.280578, -0.008172)
		Quat = (0.483587, 0.490287, -0.51393396)
		FOV = 93.0
	}
	{
		Name = debug_face_drum
		Type = debug
		LockTo = drummer
		LockToBone = bone_head
		Pos = (0.038502, 0.280578, -0.008172)
		Quat = (0.483587, 0.490287, -0.51393396)
		FOV = 93.0
	}
]
default_cameras_debug_drum = [
	{
		Name = debug_drum01
		Type = debug
		LockTo = drummer
		Pos = (2.1161907, 2.0488508, -0.7431111)
		Quat = (0.20130901, -0.620695, 0.168902)
		FOV = 68.0
	}
]
default_cameras_debug_guitar = [
	{
		Name = debug_guitar01
		Type = debug
		LockTo = GUITARIST
		locktoworldorientation
		Pos = (0.32338, 1.014272, 1.5703422)
		Quat = (0.073696, 0.9962689, 0.003822)
		FOV = 72.0
		LookAt = GUITARIST
		LookAtBone = bone_chest
		ScreenOffset = (0.015315, -0.360708)
		distfromlookat = 1.819742
	}
]
default_cameras_debug_bass = [
	{
		Name = debug_bass01
		Type = debug
		LockTo = BASSIST
		locktoworldorientation
		Pos = (-0.525171, 1.20463, 1.6167321)
		Quat = (-0.000577, 0.9669069, -0.0029010002)
		FOV = 72.0
		LookAt = BASSIST
		LookAtBone = bone_chest
	}
]
default_cameras_debug_ntlightshow = [
	{
		Name = debug_ntlightshow01
		Type = debug
		LockTo = World
		Pos = (0.554229, 3.4842181, 21.230099)
		Quat = (-0.001134, 0.99959993, -0.027632)
		FOV = 72.0
	}
]
default_cameras_no_flyby = [
	{
		Name = no_flyby
		LockTo = World
		Pos = (-1.258026, 1.698497, 5.022158)
		Quat = (0.122888, -0.063029, 0.016529998)
		FOV = 85.0
	}
]
