cameracuts_good_array = $default_cameras_good
cameracuts_normal_array = $default_cameras_normal
cameracuts_poor_array = $default_cameras_poor
cameracuts_performance = good
cameracuts_lastarray = $cameracuts_good_array
cameracuts_lastperformance = good
cameracuts_init = false
cameracuts_enabled = false
cameracuts_lastindex = 0
cameracuts_lasttype = none
cameracuts_lastname = none
cameracuts_lastdownbeatindex = 0
cameracuts_preprocess_autocameras = false
cameracuts_nextextraparamsset = 0
cameracuts_nextextraparams = {
}
cameracuts_nextdisablecam = false
cameracuts_changetime = 0
cameracuts_changenow = false
cameracuts_forcetime = 0
cameracuts_nexttime = 0
cameracuts_arrayprefix = 'Cameras'
cameracuts_forcetype = none
cameracuts_nextname = none
cameracuts_changecamenable = true
cameracuts_allownotescripts = true
cameracuts_lastcamerastarttime = 0.0
cameracuts_forcechangetime = 0.0
cameracuts_shadowcasters = none
cameracuts_nextnotecameratime = -1
default_handcam_amplitudeposition = 0.05
default_handcam_amplituderotation = -0.08
handcam_amplitudeposition = 0.05
handcam_amplituderotation = -0.08
cameracuts_notemapping = [
	{
		midinote = 0
		scr = cameracuts_enablechangecam
		params = {
			enable = true
		}
	}
	{
		midinote = 1
		scr = cameracuts_enablechangecam
		params = {
			enable = false
		}
	}
	{
		midinote = 3
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_moments'
			changenow
			name = moment01
			sync
		}
	}
	{
		midinote = 4
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_moments'
			changenow
			name = moment02
			sync
		}
	}
	{
		midinote = 5
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_moments'
			changenow
			name = moment03
			sync
		}
	}
	{
		midinote = 6
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_moments'
			changenow
			name = moment04
			sync
		}
	}
	{
		midinote = 8
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_guitarist'
			changenow
			type = guitarist_closeup
			sync
		}
	}
	{
		midinote = 9
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_guitarist'
			changenow
			type = guitarist_stage
			sync
		}
	}
	{
		midinote = 10
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_guitarist'
			changenow
			name = guitarist_mocap01
			sync
		}
	}
	{
		midinote = 11
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_guitarist'
			changenow
			name = guitarist_mocap02
			sync
		}
	}
	{
		midinote = 13
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_singer'
			changenow
			type = singer_closeup
			sync
		}
	}
	{
		midinote = 14
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_singer'
			changenow
			type = singer_stage
			sync
		}
	}
	{
		midinote = 15
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_singer'
			changenow
			name = singer_mocap01
			sync
		}
	}
	{
		midinote = 16
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_singer'
			changenow
			name = singer_mocap02
			sync
		}
	}
	{
		midinote = 18
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_bassist'
			changenow
			type = bassist_closeup
			sync
		}
	}
	{
		midinote = 19
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_bassist'
			changenow
			name = bassist_stage
			sync
		}
	}
	{
		midinote = 20
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_bassist'
			changenow
			name = bassist_mocap01
			sync
		}
	}
	{
		midinote = 21
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_bassist'
			changenow
			name = bassist_mocap02
			sync
		}
	}
	{
		midinote = 23
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_drummer'
			changenow
			type = drummer_closeup
			sync
		}
	}
	{
		midinote = 24
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_drummer'
			changenow
			type = drummer_stage
			sync
		}
	}
	{
		midinote = 25
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_drummer'
			changenow
			name = drummer_mocap01
			sync
		}
	}
	{
		midinote = 26
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_drummer'
			changenow
			name = drummer_mocap02
			sync
		}
	}
	{
		midinote = 28
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras'
			changenow
			type = longshot
			sync
		}
	}
	{
		midinote = 29
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras'
			changenow
			type = midshot
			sync
		}
	}
	{
		midinote = 30
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras'
			changenow
			type = venue_midshot
			sync
		}
	}
	{
		midinote = 31
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras'
			changenow
			type = generic_stage_shot
			sync
		}
	}
	{
		midinote = 33
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_solo'
			changenow
			type = solo_guitar
			sync
		}
	}
	{
		midinote = 34
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_solo'
			changenow
			name = solo_vocal
			sync
		}
	}
	{
		midinote = 35
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_solo'
			changenow
			type = solo_drum
			sync
		}
	}
	{
		midinote = 36
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_solo'
			changenow
			name = solo_bass
			sync
		}
	}
	{
		midinote = 38
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_single'
			changenow
			type = single
			sync
		}
	}
	{
		midinote = 40
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_special'
			changenow
			name = special01
			sync
		}
	}
	{
		midinote = 41
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_special'
			changenow
			name = special02
			sync
		}
	}
	{
		midinote = 43
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_audience'
			changenow
			type = audience
			in_crowd = 1
			sync
		}
	}
	{
		midinote = 45
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_zoom'
			changenow
			type = zoom_in
			sync
		}
	}
	{
		midinote = 46
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_zoom'
			changenow
			type = zoom_out
			sync
		}
	}
	{
		midinote = 48
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_spotlight'
			changenow
			name = spotlight
			sync
		}
	}
	{
		midinote = 50
		scr = jumbotron_setoverride
		params = {
			focus = none
		}
	}
	{
		midinote = 51
		scr = jumbotron_setoverride
		params = {
			focus = guitarist
		}
	}
	{
		midinote = 52
		scr = jumbotron_setoverride
		params = {
			focus = bassist
		}
	}
	{
		midinote = 53
		scr = jumbotron_setoverride
		params = {
			focus = vocalist
		}
	}
	{
		midinote = 54
		scr = jumbotron_setoverride
		params = {
			focus = drummer
		}
	}
	{
		midinote = 55
		scr = jumbotron_setoverride
		params = {
			focus = visualizer
		}
	}
	{
		midinote = 74
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_Orbits'
			changenow
			type = orbit_low
			in_crowd = 1
			sync
		}
	}
	{
		midinote = 75
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_Orbits'
			changenow
			type = orbit_high
			sync
		}
	}
	{
		midinote = 57
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_Verts_Front'
			changenow
			type = verts_front
			sync
		}
	}
	{
		midinote = 58
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_Verts_Rear'
			changenow
			type = verts_rear
			sync
		}
	}
	{
		midinote = 60
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_G_across_stage'
			changenow
			type = g_across_stage
			sync
		}
	}
	{
		midinote = 61
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_S_across_stage'
			changenow
			type = s_across_stage
			sync
		}
	}
	{
		midinote = 62
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_Singer'
			changenow
			type = singer_vert
			sync
		}
	}
	{
		midinote = 63
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_Guitarist'
			changenow
			type = guitarist_vert
			sync
		}
	}
	{
		midinote = 64
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_Drummer'
			changenow
			type = drummer_vert
			sync
		}
	}
	{
		midinote = 65
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_Bassist'
			changenow
			type = bassist_vert
			sync
		}
	}
	{
		midinote = 66
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_Drummer'
			changenow
			type = d_across_stage_s
			sync
		}
	}
	{
		midinote = 67
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_Drummer'
			changenow
			type = d_across_stage_g
			sync
		}
	}
	{
		midinote = 68
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_Drummer'
			changenow
			type = drummer_motion
			sync
		}
	}
	{
		midinote = 69
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_Guitarist'
			changenow
			name = guitar_face_pan
			sync
		}
	}
	{
		midinote = 90
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_moments'
			changenow
			name = moment01
			sync
		}
	}
	{
		midinote = 91
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_moments'
			changenow
			name = moment02
			sync
		}
	}
	{
		midinote = 92
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_moments'
			changenow
			name = moment03
			sync
		}
	}
	{
		midinote = 93
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_moments'
			changenow
			name = moment04
			sync
		}
	}
	{
		midinote = 94
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_moments'
			changenow
			name = moment05
			sync
		}
	}
	{
		midinote = 95
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_moments'
			changenow
			name = moment06
			sync
		}
	}
	{
		midinote = 96
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_moments'
			changenow
			name = moment07
			sync
		}
	}
	{
		midinote = 97
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_moments'
			changenow
			name = moment08
			sync
		}
	}
	{
		midinote = 98
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_moments'
			changenow
			name = moment09
			sync
		}
	}
	{
		midinote = 99
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_moments'
			changenow
			name = moment10
			sync
		}
	}
	{
		midinote = 110
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_debug_face'
			changenow
			name = debug_face_vocal
		}
	}
	{
		midinote = 111
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_debug_face'
			changenow
			name = debug_face_guitar
		}
	}
	{
		midinote = 112
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_debug_face'
			changenow
			name = debug_face_bass
		}
	}
	{
		midinote = 113
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_debug_face'
			changenow
			name = debug_face_drum
		}
	}
]
autocut_camera_table = [
	{
		camera = 8
		exclusions = [
			8
		]
	}
	{
		camera = 10
		exclusions = [
			10
		]
	}
	{
		camera = 11
		exclusions = [
			11
			16
			21
			26
			31
		]
	}
	{
		camera = 13
		exclusions = [
			13
		]
	}
	{
		camera = 15
		exclusions = [
			15
		]
	}
	{
		camera = 16
		exclusions = [
			16
			11
			21
			26
			31
		]
	}
	{
		camera = 18
		exclusions = [
			18
		]
	}
	{
		camera = 20
		exclusions = [
			20
		]
	}
	{
		camera = 21
		exclusions = [
			21
			11
			16
			26
			31
		]
	}
	{
		camera = 23
		exclusions = [
			23
		]
	}
	{
		camera = 25
		exclusions = [
			25
		]
	}
	{
		camera = 26
		exclusions = [
			26
			11
			16
			21
			31
		]
	}
	{
		camera = 28
		exclusions = [
			28
		]
	}
	{
		camera = 29
		exclusions = [
			29
		]
	}
	{
		camera = 30
		exclusions = [
			30
			43
		]
	}
	{
		camera = 31
		exclusions = [
			31
			11
			16
			21
			26
		]
	}
	{
		camera = 43
		exclusions = [
			43
			30
		]
	}
	{
		camera = 48
		exclusions = [
			48
		]
	}
	{
		camera = 60
		exclusions = [
			60
			61
		]
	}
	{
		camera = 61
		exclusions = [
			61
			60
		]
	}
]
initial_autocut_camera = 31
last_camera_array_entry = 0
debug_use_autocut_array = false
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
	if (($cheat_focusmode = 1 && <type> != career) || $calibrate_lag_enabled = 1)
		return
	endif
	if NOT songfilemanager func = has_perf_file song_name = <song_name>
		if ($enable_button_cheats)
			if (<type> = training || <type> = tutorial || <type> = practice)
			else
				if NOT screenelementexists \{id = debug_no_cameras}
					createscreenelement \{type = textelement
						parent = root_window
						id = debug_no_cameras
						font = debug
						pos = (640.0, 102.0)
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
	<array_size> = <num_cameras>
	printf qs(0x3e5ffa5b) d = <time_offset> channel = events
	change \{cameracuts_nextnotecameratime = -1}
	setupinitialsonghandcamparams <...>
	setnotemappings \{section = cameras
		mapping = $cameracuts_notemapping}
	use_moment_cameras = false
	if should_play_moments
		songfilemanager func = get_num_moment_cams song_name = <song_name>
		if (<num_cameras> > 0)
			moment_array_size = <num_cameras>
			moment_array_entry = 0
			use_moment_cameras = true
		endif
	endif
	array_entry = 0
	change \{last_camera_array_entry = 0}
	getsongtimems time_offset = <time_offset>
	begin
	songfilemanager func = get_autocut_cam_time song_name = <song_name> index = <array_entry>
	if ((<time> - <skipleadin>) < <camera_time>)
		break
	endif
	<array_entry> = (<array_entry> + 1)
	repeat <array_size>
	if (<array_entry> >= <array_size>)
		change \{cameracuts_nextnotecameratime = -1}
		return
	endif
	change last_camera_array_entry = <array_entry>
	if (<use_moment_cameras> = true)
		begin
		songfilemanager func = get_moment_cam_time song_name = <song_name> index = <moment_array_entry>
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
	songfilemanager func = get_autocut_cam_time song_name = <song_name> index = <array_entry>
	next_camera_time = <camera_time>
	next_note_entry = <array_entry>
	next_time = <next_camera_time>
	next_type_call = get_autocut_cam_data
	playing_moment_camera = false
	if (<use_moment_cameras> = true)
		if (<moment_array_entry> >= <moment_array_size>)
			use_moment_cameras = false
		else
			songfilemanager func = get_moment_cam_time song_name = <song_name> index = <moment_array_entry>
			next_moment_camera_time = <camera_time>
			if (<next_moment_camera_time> <= <next_camera_time>)
				songfilemanager func = get_moment_cam_data song_name = <song_name> index = <moment_array_entry>
				<is_moment_cam> = false
				if (((<note_value> >= $g_moment01_camera_midi_note) &&
							(<note_value> < ($g_moment01_camera_midi_note + $g_num_moment_cameras))) ||
						(<note_value> >= 3 && <note_value> <= 6))
					<is_moment_cam> = true
				endif
				if ((<is_moment_cam> = false) && ($g_using_traditional_band_setup = false))
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
	change cameracuts_nextnotecameratime = (<next_time> - <time_offset>)
	begin
	getsongtimems time_offset = <time_offset>
	if (<time> >= <next_time>)
		break
	endif
	wait \{1
		gameframe}
	repeat
	songfilemanager func = <next_type_call> song_name = <song_name> index = <next_note_entry>
	if ($cameracuts_allownotescripts = true)
		if (<note_value> >= 3 && <note_value> <= 6)
			<note_value> = (<note_value> + ($g_moment01_camera_midi_note - 3))
		endif
		if ((<note_value> >= $g_moment01_camera_midi_note) &&
				(<note_value> < ($g_moment01_camera_midi_note + $g_num_moment_cameras)))
			<slot> = (<note_value> - $g_moment01_camera_midi_note)
			if ($g_moment_cameras_valid [<slot>] = 0)
				songfilemanager func = get_autocut_cam_data song_name = <song_name> index = <array_entry>
				<moment_array_entry> = (<moment_array_entry> + 1)
				<playing_moment_camera> = false
			endif
		endif
		<in_crowd> = 0
		if getnotemapping section = cameras note_value = <note_value>
			clip_get_time_and_frame
			spawnscriptnow (<note_data>.scr) params = {(<note_data>.params) length = <length>}
		endif
	endif
	change last_camera_array_entry = <array_entry>
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
		if (<array_entry> >= <array_size>)
			change \{cameracuts_nextnotecameratime = -1}
			return
		endif
		repeat
	else
		<array_entry> = (<array_entry> + 1)
		if (<array_entry> >= <array_size>)
			change \{cameracuts_nextnotecameratime = -1}
			return
		endif
	endif
	repeat
	change \{cameracuts_nextnotecameratime = -1}
endscript

script set_moment_camera_states \{valid = 1}
	getarraysize ($g_moment_cameras_valid)
	if (<array_size> > 0)
		<i> = 0
		begin
		setarrayelement arrayname = g_moment_cameras_valid globalarray index = <i> newvalue = <valid>
		<i> = (<i> + 1)
		repeat <array_size>
	endif
endscript

script autocut_cameracuts_iterator 
	printf \{channel = marccam
		qs(0xb6bce4db)}
	gamemode_gettype
	if (($cheat_focusmode = 1 && <type> != career) || $calibrate_lag_enabled = 1)
		printf \{channel = marccam
			qs(0x5715daba)}
		return
	endif
	getarraysize \{$autocut_cameraarray}
	if (<array_size> = 0)
		scriptassert \{'autocut camera array is empty!'}
		return
	endif
	change \{cameracuts_nextnotecameratime = -1}
	setupinitialsonghandcamparams <...>
	setnotemappings \{section = cameras
		mapping = $cameracuts_notemapping}
	array_entry = 0
	change \{last_camera_array_entry = 0}
	getsongtimems time_offset = <time_offset>
	begin
	camera_time = ($autocut_cameraarray [<array_entry>])
	if ((<time> - <skipleadin>) < <camera_time>)
		break
	endif
	<array_entry> = (<array_entry> + 2)
	repeat (<array_size> / 2)
	printf channel = marccam qs(0x4e3b437d) a = <array_size>
	if (<array_entry> >= <array_size>)
		change \{cameracuts_nextnotecameratime = -1}
		return
	endif
	change last_camera_array_entry = <array_entry>
	begin
	next_camera_time = ($autocut_cameraarray [<array_entry>])
	next_note_value = ($autocut_cameraarray [<array_entry> + 1])
	next_time = <next_camera_time>
	next_type = autocutcameras
	decompressnotevalue note_value = <next_note_value>
	change cameracuts_nextnotecameratime = (<next_time> - <time_offset>)
	begin
	getsongtimems time_offset = <time_offset>
	if (<time> >= <next_time>)
		break
	endif
	wait \{1
		gameframe}
	repeat
	if ($cameracuts_allownotescripts = true)
		if getnotemapping section = cameras note_value = <note_value>
			clip_get_time_and_frame
			spawnscriptnow (<note_data>.scr) params = {(<note_data>.params) length = <length>}
		endif
	endif
	change last_camera_array_entry = <array_entry>
	<array_entry> = (<array_entry> + 2)
	if (<array_entry> >= <array_size>)
		printf \{channel = marccam
			qs(0xc8e34a34)}
		change \{cameracuts_nextnotecameratime = -1}
		return
	endif
	repeat
	change \{cameracuts_nextnotecameratime = -1}
endscript

script cameracuts_getnextnotecameratime 
	return camera_time = ($cameracuts_nextnotecameratime)
endscript

script cameracuts_setarray \{type = good
		array = default_cameras_good}
	if (<type> = good)
		change cameracuts_good_array = $<array>
	endif
	if (<type> = medium)
		change cameracuts_normal_array = $<array>
	endif
	if (<type> = poor)
		change cameracuts_poor_array = $<array>
	endif
endscript

script cameracuts_setparams \{performance = medium}
	change cameracuts_performance = <performance>
endscript

script setupinitialsonghandcamparams 
	setsonghandcamparams amplitudeposition = ($default_handcam_amplitudeposition) amplituderotation = ($default_handcam_amplituderotation)
	getsongtimems time_offset = <time_offset>
	if (<time> < 0)
		get_song_prefix song = <song_name>
		formattext checksumname = event_array '%s_performance' s = <song_prefix>
		if NOT songglobalexists name = <event_array>
			scriptassert '$%e does not exist' e = <event_array>
			return
		endif
		index = 0
		getsongarraysize <event_array>
		if (<array_size> > 0)
			begin
			getsongglobal name = <event_array> index = <index>
			if (<element>.time < 100)
				if (<element>.scr = setsonghandcamparams)
					setsonghandcamparams (<element>.params)
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

script setsonghandcamparams 
	if gotparam \{amplitudeposition}
		change handcam_amplitudeposition = <amplitudeposition>
	endif
	if gotparam \{amplituderotation}
		change handcam_amplituderotation = <amplituderotation>
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
		case guitarist_closeup
		if is_playing_instrument \{position = guitarist
				instrument = drum}
			use_alt_cams = true
		endif
		case bassist_closeup
		if is_playing_instrument \{position = bassist
				instrument = drum}
			use_alt_cams = true
		endif
		case singer_closeup
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
		if is_playing_instrument \{position = guitarist
				instrument = drum}
			use_alt_cams = true
		endif
		if is_playing_instrument \{position = bassist
				instrument = drum}
			use_alt_cams = true
		endif
		if is_playing_instrument \{position = vocalist
				instrument = drum}
			use_alt_cams = true
		endif
		case g_across_stage
		if is_playing_instrument \{position = guitarist
				instrument = drum}
			use_alt_cams = true
		endif
		if is_playing_instrument \{position = bassist
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

script cameracuts_setarrayprefix \{prefix = 'cameras'
		type = none
		name = none
		length = 0
		in_crowd = 0
		disablechangecam = false}
	if NOT ($debug_camera_array = none)
		return
	endif
	if gotparam \{sync}
		wait_for_next_odd_frame
	endif
	if (<in_crowd> = 1)
		if ($g_last_camera_in_crowd = 0)
			spawnscriptnow \{audio_crowd_start_inner_perspective}
			change \{g_last_camera_in_crowd = 1}
		endif
	else
		if ($g_last_camera_in_crowd = 1)
			spawnscriptnow \{audio_crowd_kill_inner_perspective}
			change \{g_last_camera_in_crowd = 0}
		endif
	endif
	adjust_cameras_for_alt_closeups <...>
	change cameracuts_arrayprefix = <prefix>
	change cameracuts_forcetype = <type>
	change cameracuts_nextname = <name>
	set_defaultcameracuts
	if gotparam \{changetime}
		change cameracuts_forcechangetime = <changetime>
	endif
	if gotparam \{changenow}
		if (<length> > 200)
			change cameracuts_nexttime = <length>
		endif
		change cameracuts_nextdisablecam = <disablechangecam>
		cameracuts_enablechangecam \{enable = true}
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
	getpakmancurrent \{map = zones}
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
	return \{false
		special_suffix = ''}
endscript

script set_defaultcameracut_perf_with_special_suffix \{perf = 'good'
		perf_checksum = good
		special_suffix = ''}
	getpakmancurrentname \{map = zones}
	getnumplayersingame
	if (<num_players> = 2)
		formattext checksumname = cameras_array '%s_%p_%c_2p%f' p = $cameracuts_arrayprefix c = <perf> s = <pakname> f = <special_suffix>
		if globalexists name = <cameras_array> type = array
			cameracuts_setarray type = <perf_checksum> array = <cameras_array>
			return
		endif
		formattext checksumname = cameras_array '%s_%p_2p%f' p = $cameracuts_arrayprefix s = <pakname> f = <special_suffix>
		if globalexists name = <cameras_array> type = array
			cameracuts_setarray type = <perf_checksum> array = <cameras_array>
			return
		endif
	endif
	formattext checksumname = cameras_array '%s_%p_%c%f' p = $cameracuts_arrayprefix c = <perf> s = <pakname> f = <special_suffix>
	if globalexists name = <cameras_array> type = array
		cameracuts_setarray type = <perf_checksum> array = <cameras_array>
		return
	endif
	formattext checksumname = cameras_array '%s_%p%f' p = $cameracuts_arrayprefix s = <pakname> f = <special_suffix>
	if globalexists name = <cameras_array> type = array
		cameracuts_setarray type = <perf_checksum> array = <cameras_array>
		return
	endif
	formattext checksumname = cameras_array '%s_%p_%c' p = $cameracuts_arrayprefix c = <perf> s = 'default'
	if globalexists name = <cameras_array> type = array
		cameracuts_setarray type = <perf_checksum> array = <cameras_array>
		return
	endif
	formattext \{checksumname = cameras_array
		'%s_%p'
		p = $cameracuts_arrayprefix
		s = 'default'}
	if globalexists name = <cameras_array> type = array
		cameracuts_setarray type = <perf_checksum> array = <cameras_array>
		return
	endif
	printstruct <...> prefix = ($cameracuts_arrayprefix)
	scriptassert \{qs(0xce687931)}
endscript

script set_defaultcameracut_perf \{perf = 'good'
		perf_checksum = good}
	getpakmancurrentname \{map = zones}
	getnumplayersingame
	if (<num_players> = 2)
		formattext checksumname = cameras_array '%s_%p_%c_2p' p = $cameracuts_arrayprefix c = <perf> s = <pakname>
		if globalexists name = <cameras_array> type = array
			cameracuts_setarray type = <perf_checksum> array = <cameras_array>
			return
		endif
		formattext checksumname = cameras_array '%s_%p_2p' p = $cameracuts_arrayprefix s = <pakname>
		if globalexists name = <cameras_array> type = array
			cameracuts_setarray type = <perf_checksum> array = <cameras_array>
			return
		endif
	endif
	formattext checksumname = cameras_array '%s_%p_%c' p = $cameracuts_arrayprefix c = <perf> s = <pakname>
	if globalexists name = <cameras_array> type = array
		cameracuts_setarray type = <perf_checksum> array = <cameras_array>
		return
	endif
	formattext checksumname = cameras_array '%s_%p' p = $cameracuts_arrayprefix s = <pakname>
	if globalexists name = <cameras_array> type = array
		cameracuts_setarray type = <perf_checksum> array = <cameras_array>
		return
	endif
	formattext checksumname = cameras_array '%s_%p_%c' p = $cameracuts_arrayprefix c = <perf> s = 'default'
	if globalexists name = <cameras_array> type = array
		cameracuts_setarray type = <perf_checksum> array = <cameras_array>
		return
	endif
	formattext \{checksumname = cameras_array
		'%s_%p'
		p = $cameracuts_arrayprefix
		s = 'default'}
	if globalexists name = <cameras_array> type = array
		cameracuts_setarray type = <perf_checksum> array = <cameras_array>
		return
	endif
	printstruct <...> prefix = ($cameracuts_arrayprefix)
	scriptassert \{qs(0xce687931)}
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
	wait \{1
		gameframe}
	repeat
endscript

script play_cameracut \{prefix = 'cameras_no_band'
		transition_time = 5}
	if NOT gotparam \{from_switch_to_no_band_camera}
		killspawnedscript \{name = switch_to_no_band_camera}
	endif
	change \{cameracuts_preprocess_autocameras = false}
	change \{camera_cut_played = 1}
	wait_for_play_camera_to_complete
	spawnscriptnow play_cameracut_spawned params = {<...>}
endscript

script stop_cameracut 
	if ($camera_cut_played = 0)
		return
	endif
	wait_for_play_camera_to_complete
	killcamanim \{name = cameracutcam}
	restore_dummy_bg_camera
	change \{camera_cut_played = 0}
endscript

script play_cameracut_spawned 
	change \{camera_cut_playing = 1}
	finalprintf qs(0xfd72d251) s = <prefix> t = $cameracuts_init d = $debug_camera_array
	killcamanim \{all}
	create_cameracuts initial_params = {prefix = <prefix> length = <transition_time> changenow} extra_params = {force_time = <transition_time>} play_hold = 1
	wait \{4
		gameframes}
	cameracuts_enablechangecam \{enable = false}
	destroy_cameracuts \{leave_camera_playing}
	change \{camera_cut_playing = 0}
endscript

script create_cameracuts \{extra_params = {
		}
		play_hold = 0
		in_game = 0}
	if ($cameracuts_init = true)
		return
	else
		change \{cameracuts_init = true}
	endif
	kill_dummy_bg_camera
	reset_cameracuts_internal_vars in_game = <in_game>
	if ($cameracuts_preprocess_autocameras = true)
		build_autocut_camera_array in_game = <in_game>
	endif
	if gotparam \{initial_params}
		cameracuts_setarrayprefix <initial_params>
	endif
	cameracuts_startcallback extra_params = <extra_params> play_hold = <play_hold>
endscript

script reset_cameracuts_internal_vars 
	if ($cameracuts_init = false)
		scriptassert \{qs(0xa13a9b7f)}
	endif
	change \{cameracuts_arrayprefix = 'cameras'}
	set_defaultcameracuts
	change \{cameracuts_lasttype = none}
	change \{cameracuts_lastdownbeatindex = 0}
	change \{cameracuts_forcechangetime = 0.0}
	change \{cameracuts_forcetype = none}
	change \{cameracuts_nextname = none}
	change \{cameracuts_preprocess_autocameras = false}
	<jam_song> = 0
	if is_current_song_a_jam_session
		ui_event_get_top
		if (<in_game> = 1)
			<jam_song> = 1
		endif
	endif
	if ($game_mode = tutorial || $game_mode = practice)
		change \{cameracuts_changecamenable = false}
		change \{cameracuts_allownotescripts = false}
	elseif (<jam_song> = 1)
		change \{cameracuts_changecamenable = true}
		change \{cameracuts_allownotescripts = true}
		change \{cameracuts_preprocess_autocameras = true}
	else
		change \{cameracuts_changecamenable = true}
		change \{cameracuts_allownotescripts = true}
	endif
	change \{cameracuts_enabled = true}
endscript

script cameracuts_getnextdownbeat 
	playlist_getcurrentsong
	get_song_prefix song = <current_song>
	formattext checksumname = event_array '%s_lightshow_notes' s = <song_prefix> addtostringlookup = true
	if NOT songglobalexists name = <event_array> type = array
		return false endtime = <endtime>
	endif
	getsongarraysize <event_array>
	array_count = ($cameracuts_lastdownbeatindex)
	array_size = (<array_size> - <array_count>)
	array_size = (<array_size> / 2)
	if (<array_size> > 0)
		begin
		getsongglobal name = <event_array> index = (<array_count> + 1)
		decompressnotevalue note_value = <element>
		if (<note_value> = 58 || <note_value> = 57)
			getsongglobal name = <event_array> index = <array_count>
			if (<element> > <endtime>)
				change cameracuts_lastdownbeatindex = <array_count>
				return true endtime = <element>
			endif
		endif
		array_count = (<array_count> + 2)
		repeat <array_size>
	endif
	printf \{channel = clip
		qs(0x29017cad)}
	return false endtime = <endtime>
endscript

script cameracuts_startcallback \{extra_params = {
		}
		play_hold = 0}
	change \{cameracuts_changenow = false}
	if ($cameracuts_enabled = false)
		return
	endif
	if ($cameracuts_performance = poor)
		camera_array = cameracuts_poor_array
	else
		if ($cameracuts_performance = good)
			camera_array = cameracuts_good_array
		else
			camera_array = cameracuts_normal_array
		endif
	endif
	if NOT ($cameracuts_nextname = none)
		cameracut_getarraysize camera_array = <camera_array> name = ($cameracuts_nextname) target_node = <target_node>
	elseif NOT ($cameracuts_forcetype = none)
		cameracut_getarraysize camera_array = <camera_array> includetype = $cameracuts_forcetype target_node = <target_node>
	else
		if is_current_song_a_jam_session
			cameracut_getarraysize camera_array = <camera_array> excludename = $cameracuts_lastname target_node = <target_node>
		else
			cameracut_getarraysize camera_array = <camera_array> excludetype = $cameracuts_lasttype target_node = <target_node>
		endif
	endif
	if (<array_size> = 0)
		newindex = 0
	else
		getrandomvalue name = newindex integer a = 0 b = (<array_size> - 1)
		cameracut_getcameraindex camera_array = <camera_array> newindex = <newindex>
	endif
	debug_flags = none
	if NOT ($debug_camera_array = none)
		get_camera_special_suffix
		found = 0
		formattext checksumname = new_camera_array '%s_%p%b' s = $debug_camera_array_pakname p = $debug_camera_array b = <special_suffix>
		if globalexists name = <new_camera_array>
			getarraysize $<new_camera_array>
			index = ($debug_camera_array_count)
			if (<index> < <array_size>)
				camera_array = <new_camera_array>
				newindex = ($debug_camera_array_count)
				found = 1
				debug_flags = update_when_paused
			endif
		endif
		if (found = 0)
			change \{debug_camera_array = none}
			change \{debug_camera_array_pakname = none}
			change \{debug_camera_array_count = none}
		endif
	endif
	change cameracuts_lastarray = $<camera_array>
	change \{cameracuts_lastperformance = $cameracuts_performance}
	change cameracuts_lastindex = <newindex>
	cameracut_saveselectedparams
	if ($cameracuts_enablevideovenuecams = 1)
		findvideovenuecam <...>
	endif
	if ($debug_show_camera_name = 1)
		cameracuts_updatedebugcameraname
	endif
	if ($output_gpu_log = 1)
		cameracuts_outputgpulog
	endif
	if structurecontains structure = ($<camera_array> [<newindex>]) params
		camstruct = (($<camera_array> [<newindex>]).params)
		if NOT structurecontains structure = <camstruct> dof
			camstruct = ($<camera_array> [<newindex>])
		endif
	else
		camstruct = ($<camera_array> [<newindex>])
	endif
	if structurecontains structure = <camstruct> dof
		if structurecontains structure = (<camstruct>.dof) screen_fx
			doftype = (<camstruct>.dof)
			dofparam = (<doftype>.screen_fx [0])
		endif
	else
		dofparam = ($dof_off_tod_manager.screen_fx [0])
	endif
	spawnscriptnow deferredcameraeffectsproc params = {dofparam = <dofparam>}
	if structurecontains structure = <camstruct> ao
		if structurecontains structure = (<camstruct>.ao) screen_fx
			aotype = (<camstruct>.ao)
		endif
	else
		aotype = $ao_default_tod_manager
	endif
	spawnscriptnow applyao params = {ao = <aotype>}
	if structurecontains structure = ($<camera_array> [<newindex>]) crowdoff
		enable_crowd_models_cfunc \{active = false}
	else
		enable_crowd_models_cfunc \{active = true}
	endif
	if structurecontains structure = ($<camera_array> [<newindex>]) shadowcasters
		change cameracuts_shadowcasters = ($<camera_array> [<newindex>].shadowcasters)
	else
		change \{cameracuts_shadowcasters = none}
	endif
	bandmanager_notifyallofcameracut
	getsongtimems
	change cameracuts_lastcamerastarttime = <time>
	if ($display_clip_info = true)
		clip_get_time_and_frame
		printf channel = clip qs(0xbb73757a) a = <time_string>
	endif
	camparams = ($<camera_array> [<newindex>])
	cameracut_remapbandmemberlookats
	if structurecontains structure = <camstruct> name
		camera_name = (<camstruct>.name)
	else
		camera_name = $cameracuts_nextname
	endif
	prepare_mocap_lock_target camera = <camera_name>
	if ($cameracuts_nextextraparamsset = 1)
		change \{cameracuts_nextextraparamsset = 0}
		extra_params = $cameracuts_nextextraparams
	endif
	if ($cameracuts_nextdisablecam = true)
		change \{cameracuts_nextdisablecam = false}
		cameracuts_enablechangecam \{enable = false}
	endif
	playigccam {
		time = <camera_time>
		viewport = bg_viewport
		controlscript = cameracuts_staticcamcontrol
		params = {camparams = <camparams>}
		far_clip = 500.0
		<camparams>
		exitscript = cameracuts_startcallback
		play_hold = <play_hold>
		name = cameracutcam
		<debug_flags>
		extra_params = <extra_params>
	}
	dynamic_ad_update_camera_ok_for_venue_ad_flag
endscript

script get_musician_mocap_lock_target 
	get_musician_id name = <name>
	formattext textname = suffix '_mocap_lock_target_0%a' a = <camera>
	extendcrc <name> <suffix> out = lock_target
	return lock_target = <lock_target>
endscript

script prepare_mocap_lock_target 
	switch <camera>
		case guitarist_mocap01
		get_musician_mocap_lock_target \{name = guitarist
			camera = 1}
		case guitarist_mocap02
		get_musician_mocap_lock_target \{name = guitarist
			camera = 2}
		case bassist_mocap01
		get_musician_mocap_lock_target \{name = bassist
			camera = 1}
		case bassist_mocap02
		get_musician_mocap_lock_target \{name = bassist
			camera = 2}
		case singer_mocap01
		get_musician_mocap_lock_target \{name = vocalist
			camera = 1}
		case singer_mocap02
		get_musician_mocap_lock_target \{name = vocalist
			camera = 2}
		case drummer_mocap01
		get_musician_mocap_lock_target \{name = drummer
			camera = 1}
		case drummer_mocap02
		get_musician_mocap_lock_target \{name = drummer
			camera = 2}
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
	if compositeobjectexists name = <lock_target>
		<lock_target> :anim_update active_camera_override = true
	endif
endscript

script findvideovenuecam 
	extendcrc <camera_array> '_video_venue' out = camera_array_video_venue
	if globalexists name = <camera_array_video_venue>
		if structurecontains structure = ($<camera_array> [<newindex>]) name
			name = ($<camera_array> [<newindex>].name)
			getarraysize ($<camera_array_video_venue>)
			index_vv = 0
			begin
			if ($<camera_array_video_venue> [<index_vv>].name = <name>)
				return camera_array = <camera_array_video_venue> newindex = <index_vv>
			endif
			index_vv = (<index_vv> + 1)
			repeat <array_size>
		endif
	endif
	return
endscript

script deferredcameraeffectsproc 
	wait_for_next_even_frame
	wait \{1
		gameframe}
	broadcastevent \{type = cameracutevent}
	if ($game_mode = tutorial)
		return
	endif
	if NOT screenfx_fxinstanceexists \{viewport = bg_viewport
			name = depth_of_field__simplified_}
		screenfx_addfxinstance {
			viewport = bg_viewport
			<dofparam>
		}
	else
		screenfx_updatefxinstanceparams {
			viewport = bg_viewport
			<dofparam>
		}
	endif
endscript

script cameracuts_updatedebugcameraname 
	if NOT screenelementexists \{id = debug_camera_name_text}
		createscreenelement \{type = textelement
			parent = root_window
			id = debug_camera_name_text
			font = debug
			pos = (640.0, 32.0)
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
			z_priority = 1.0
			alpha = 1}
	endif
	if NOT screenelementexists \{id = debug_camera_name_text2}
		createscreenelement \{type = textelement
			parent = root_window
			id = debug_camera_name_text2
			font = debug
			pos = (640.0, 70.0)
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
			z_priority = 1.0
			alpha = 1}
	endif
	cameraname_crc = none
	crowd = 1
	if ($cameracuts_init = true)
		getarraysize ($cameracuts_lastarray)
		if ($cameracuts_lastindex < <array_size>)
			if structurecontains structure = (($cameracuts_lastarray) [$cameracuts_lastindex]) params
				if structurecontains structure = (($cameracuts_lastarray) [$cameracuts_lastindex].params) name
					cameraname_crc = ($cameracuts_lastarray [$cameracuts_lastindex].params.name)
				endif
			endif
			if structurecontains structure = (($cameracuts_lastarray) [$cameracuts_lastindex]) name
				cameraname_crc = ($cameracuts_lastarray [$cameracuts_lastindex].name)
			endif
			if structurecontains structure = ($cameracuts_lastarray [$cameracuts_lastindex]) crowdoff
				<crowd> = 0
			endif
			if (<cameraname_crc> = none)
				if structurecontains structure = (($cameracuts_lastarray) [$cameracuts_lastindex]) controlscript
					cameraname_crc = ($cameracuts_lastarray [$cameracuts_lastindex].controlscript)
				endif
			endif
		endif
	endif
	jumbotronname = ''
	if NOT ($current_jumbotron = none)
		current_index = ($jumbotron_camera_index)
		if structurecontains structure = (($jumbotron_camera_params) [<current_index>]) params
			if structurecontains structure = (($jumbotron_camera_params) [<current_index>].params) name
				jumbotronname = (($jumbotron_camera_params) [<current_index>].params.name)
			endif
		endif
		if structurecontains structure = (($jumbotron_camera_params) [<current_index>]) name
			jumbotronname = (($jumbotron_camera_params) [<current_index>].name)
		endif
	endif
	formattext textname = cameraname qs(0x4558200d) s = <cameraname_crc> t = $cameracuts_lasttype c = <crowd> dontassertforchecksums donotresolve
	debug_camera_name_text :se_setprops text = <cameraname>
	printf qs(0x4771a1ab) s = <cameraname>
	cameraname = qs(0x00000000)
	if NOT (<jumbotronname> = '')
		formattext textname = cameraname qs(0x96316117) dontassertforchecksums donotresolve j = <jumbotronname>
	endif
	debug_camera_name_text2 :se_setprops text = <cameraname>
endscript

script cameracuts_outputgpulog 
	getarraysize ($cameracuts_lastarray)
	cameraname = none
	if ($cameracuts_lastindex < <array_size>)
		if structurecontains structure = (($cameracuts_lastarray) [$cameracuts_lastindex]) params
			if structurecontains structure = (($cameracuts_lastarray) [$cameracuts_lastindex].params) name
				cameraname = ($cameracuts_lastarray [$cameracuts_lastindex].params.name)
			endif
		endif
		if structurecontains structure = (($cameracuts_lastarray) [$cameracuts_lastindex]) name
			cameraname = ($cameracuts_lastarray [$cameracuts_lastindex].name)
		endif
	endif
	<crowd> = 1
	if structurecontains structure = ($cameracuts_lastarray [$cameracuts_lastindex]) crowdoff
		<crowd> = 0
	endif
	formattext textname = text qs(0x735757ef) s = <cameraname> t = $cameracuts_lasttype c = <crowd> dontassertforchecksums
	textoutput text = <text>
endscript
autocut_cameraarray = [
]
autocut_tempoarray = [
]

script build_autocut_camera_array \{in_game = 0}
	printf \{channel = marccam
		qs(0x86963ea0)}
	change \{autocut_cameraarray = [
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
	getarraysize \{$autocut_camera_table}
	num_cameras_available = <array_size>
	num_weights = <num_cameras_available>
	slow_med = (($slow_tempo + $med_tempo) * 0.5)
	med_fast = (($med_tempo + $fast_tempo) * 0.5)
	array = []
	begin
	addarrayelement array = <array> element = 1.0
	repeat <num_cameras_available>
	weights = <array>
	array = []
	begin
	addarrayelement array = <array> element = 0.0
	repeat <num_cameras_available>
	percent = <array>
	array = []
	begin
	addarrayelement array = <array> element = 0.0
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
		anim_speed = fast
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
		getrandomvalue a = <min_beats> b = <max_beats> name = num_beats integer
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
			next_cam = ($autocut_camera_table [<i>].camera)
			if (<next_cam> = $initial_autocut_camera)
				selected_camera = <i>
				break
			endif
			i = (<i> + 1)
			if (<i> >= <num_cameras_available>)
				scriptassert \{qs(0xf6892073)}
				selected_camera = 0
			endif
			repeat
			is_first_camera = false
		else
			total = 0
			index = 0
			begin
			weight = ((<temp_weights> [<index>]))
			total = (<total> + <weight>)
			index = (<index> + 1)
			repeat <num_cameras_available>
			if (<total> = 0)
				scriptassert \{'Weight total is zero!'}
				return
			endif
			running_pct = 0
			index = 0
			begin
			normalized = ((<temp_weights> [<index>]) / <total>)
			running_pct = (<running_pct> + <normalized>)
			setarrayelement arrayname = percent index = <index> newvalue = <running_pct>
			setarrayelement arrayname = dbg_percent index = <index> newvalue = (<normalized> * 100)
			index = (<index> + 1)
			repeat <num_cameras_available>
			getrandomvalue \{a = 0
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
		setarrayelement arrayname = weights index = <index> newvalue = <new_weight>
		index = (<index> + 1)
		repeat <num_cameras_available>
		setarrayelement arrayname = weights index = <selected_camera> newvalue = 1
		temp_weights = <weights>
		exclusions = ($autocut_camera_table [<selected_camera>].exclusions)
		getarraysize <exclusions>
		if (<array_size> > 0)
			index = 0
			begin
			next_excluded_camera = (<exclusions> [<index>])
			search_index = 0
			begin
			if (($autocut_camera_table [<search_index>].camera) = <next_excluded_camera>)
				setarrayelement arrayname = temp_weights index = <search_index> newvalue = 0
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
		camera_note = ($autocut_camera_table [<selected_camera>].camera)
		printf qs(0xae6f4584) a = <camera_note> b = <selected_camera> c = <random_pct>
		if (<last_note> != -1)
			camera_velocity = <anim_tempo>
			printf channel = cameratest qs(0xb482ed0e) a = <camera_velocity>
			length = (<time1> - <last_time>)
			casttointeger \{last_velocity}
			compressnotevalue length = <length> note_value = <last_note> velocity = <last_velocity>
			addarrayelement array = <array> element = <last_time>
			addarrayelement array = <array> element = <note_value>
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
	casttointeger \{last_velocity}
	compressnotevalue length = <length> note_value = <last_note> velocity = <last_velocity>
	addarrayelement array = <array> element = <time1>
	addarrayelement array = <array> element = <note_value>
	change autocut_cameraarray = <array>
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
	casttointeger \{tempo}
	addarrayelement array = <array> element = <time1>
	addarrayelement array = <array> element = <tempo>
	array_entry = (<array_entry> + 1)
	repeat (<fretbar_array_size> - 2)
	change autocut_tempoarray = <array>
	dumpautocutarray
endscript

script destroy_cameracuts 
	change \{cameracuts_init = false}
	change \{cameracuts_enabled = false}
	killspawnedscript \{name = cameracuts_startcallback}
	killspawnedscript \{name = deferredcameraeffectsproc}
	if NOT gotparam \{leave_camera_playing}
		killcamanim \{name = cameracutcam}
	endif
	if screenelementexists \{id = debug_no_cameras}
		destroyscreenelement \{id = debug_no_cameras}
	endif
	clearnotemappings \{section = cameras}
	killspawnedscript \{name = cameracuts_iterator}
	killspawnedscript \{name = autocut_cameracuts_iterator}
	if NOT gotparam \{leave_camera_playing}
		restore_dummy_bg_camera
	endif
endscript
profiling_cameracuts = false

script profile_camera_cuts \{filename = qs(0xd8a6b977)}
	if ($profiling_cameracuts = true)
		return
	endif
	change \{profiling_cameracuts = true}
	hide_analog_options
	setslomo \{0.001}
	dumpprofilestart
	getpakmancurrentname \{map = zones}
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
	formattext checksumname = camera_array '%s_%p' s = <pakname> p = <suffix>
	if globalexists name = <camera_array>
		getarraysize $<camera_array>
		array_count = 0
		begin
		profile_cameracut camera_array_pakname = <pakname> camera_array = <suffix> array_count = <array_count>
		<array_count> = (<array_count> + 1)
		repeat <array_size>
	endif
	camera_count = (<camera_count> + 1)
	repeat 6
	change \{debug_camera_array = none}
	destroy_cameracuts
	wait \{3
		gameframes}
	create_cameracuts
	dumpprofileend output_text output_file filename = <filename>
	setslomo \{$current_speedfactor}
	change \{profiling_cameracuts = false}
endscript

script profile_cameracut 
	change debug_camera_array = <camera_array>
	change debug_camera_array_pakname = <camera_array_pakname>
	change debug_camera_array_count = <array_count>
	cpu = $current_cpu
	togglemetrics \{mode = 2}
	change \{current_cpu = 6}
	destroy_cameracuts
	wait \{2
		gameframes}
	create_cameracuts
	wait \{3
		gameframes}
	profile_camera_gpu
	togglemetrics \{mode = 0}
	change current_cpu = <cpu>
endscript

script profile_camera_gpu 
	formattext \{checksumname = new_camera_array
		'%s_%p'
		s = $debug_camera_array_pakname
		p = $debug_camera_array}
	camera_array = $<new_camera_array>
	if structurecontains structure = ($<camera_array> [$debug_camera_array_count]) name
		formattext textname = title qs(0xba1fa8c6) n = (($<camera_array> [$debug_camera_array_count]).name) dontassertforchecksums
	else
		formattext textname = title qs(0xba1fa8c6) n = (($<camera_array> [$debug_camera_array_count]).params.name) dontassertforchecksums
	endif
	dumpprofile cpu = 6 title = <title> current_time_only
endscript

script cameracuts_enablechangecam 
	if NOT ($debug_camera_array = none)
		return
	endif
	change cameracuts_changecamenable = <enable>
	change \{cameracuts_changenow = true}
endscript

script cameracuts_calctime 
	if gotparam \{force_time}
		camera_time = <force_time>
		getsongtimems
		camera_songtime = (<time> + <camera_time> * 1000)
		return camera_time = <camera_time> camera_songtime = <camera_songtime>
	endif
	if ($cameracuts_changenow = true)
		camera_time = 0
		getsongtimems
		camera_songtime = (<time> + <camera_time> * 1000)
		return camera_time = <camera_time> camera_songtime = <camera_songtime>
	endif
	if ($cameracuts_forcetime = 0)
		if ($cameracuts_nexttime = 0)
			if NOT ($debug_camera_array = none)
				camera_time = 5.0
			else
				camera_time = RandomFloat (2.0, 4.0)
				getsongtimems
				endtime = (<time> + <camera_time> * 1000)
				if cameracuts_getnextdownbeat endtime = <endtime>
					<delta> = ((<endtime> - <time>) / 1000.0)
					if ((<delta> < 6.0) && (<delta> > 2.0))
						<camera_time> = <delta>
					endif
				endif
			endif
		else
			camera_time = ($cameracuts_nexttime / 1000.0)
			change \{cameracuts_nexttime = 0}
		endif
	else
		camera_time = ($cameracuts_forcetime)
	endif
	getsongtimems
	camera_songtime = (<time> + <camera_time> * 1000)
	return camera_time = <camera_time> camera_songtime = <camera_songtime>
endscript
forcecamerachangeforfreeplayintroflag = false

script forcecamerachangeforfreeplayintro 
	gamemode_gettype
	if (<type> != freeplay)
		return
	endif
	change \{forcecamerachangeforfreeplayintroflag = true}
	change \{cameracuts_nextextraparamsset = 0}
endscript

script cameracuts_waitscript \{camera_time = 0
		camera_songtime = 0}
	if gotparam \{force_time}
		change \{forcecamerachangeforfreeplayintroflag = false}
		elapsed_time = 0.0
		begin
		if ($forcecamerachangeforfreeplayintroflag = true)
			return \{true}
		endif
		getdeltatime
		<elapsed_time> = (<elapsed_time> + <delta_time>)
		if (<elapsed_time> > <force_time>)
			break
		endif
		wait \{1
			gameframe}
		repeat
		begin
		if ($cameracuts_changecamenable = true)
			return \{true}
		endif
		wait \{1
			gameframe}
		repeat
	endif
	getsongtimems
	change cameracuts_changetime = <camera_songtime>
	begin
	getsongtimems
	if (<time> >= $cameracuts_changetime ||
			$cameracuts_changenow = true)
		if ($cameracuts_changecamenable = true)
			break
		endif
	endif
	if NOT ($cameracuts_forcechangetime = 0.0)
		if ($cameracuts_forcechangetime < (<time> - $cameracuts_lastcamerastarttime))
			change \{cameracuts_forcechangetime = 0.0}
			break
		endif
	endif
	if gotparam \{nowait}
		return \{false}
	endif
	wait \{1
		gameframe}
	repeat
	return \{true}
endscript

script cameracuts_staticcamcontrol 
	cameracuts_calctime force_time = <force_time>
	ccam_domorph {
		<camparams>
	}
	cameracuts_waitscript camera_songtime = <camera_songtime> force_time = <force_time>
endscript

script cameracuts_blockcontrol 
	cameracuts_calctime force_time = <force_time>
	ccam_domorph {
		<...>
	}
	block
endscript

script cameracuts_handcam \{name = none}
	cameracuts_calctime force_time = <force_time>
	ccam_domorph
	zooming = false
	if gotparam \{type}
		if (<type> = longshot)
			getrandomvalue \{name = random_value
				integer
				a = 0
				b = 100}
			if (<random_value> < 25)
				ccam_domorph <...> fov = 62 time = <camera_time>
				zooming = true
			endif
			if (<random_value> > 95)
				ccam_domorph <...> fov = 78 time = <camera_time>
				zooming = true
			endif
		endif
		if (<type> = mid)
			getrandomvalue \{name = random_value
				integer
				a = 0
				b = 100}
			if (<random_value> < 5)
				ccam_domorph <...> fov = 64 time = <camera_time>
				zooming = true
			endif
			if (<random_value> > 85)
				ccam_domorph <...> fov = 82 time = <camera_time>
				zooming = true
			endif
		endif
	endif
	if (<zooming> = true)
		amplitudeposition = 0.01
		amplituderotation = -0.01
	else
		amplitudeposition = ($handcam_amplitudeposition)
		amplituderotation = ($handcam_amplituderotation)
	endif
	cameracuts_sethandcamparams <...>
	cameracuts_waitscript camera_songtime = <camera_songtime> force_time = <force_time>
endscript

script cameracuts_twocam 
	if gotparam \{usehandcam}
		cameracuts_sethandcamparams {
			amplitudeposition = ($handcam_amplitudeposition)
			amplituderotation = ($handcam_amplituderotation)
		}
	endif
	if gotparam \{usehandcamsmooth}
		cameracuts_sethandcamparams \{amplitudeposition = 0.05
			amplituderotation = -0.08}
	endif
	cameracuts_calctime force_time = <force_time>
	ccam_domorph {
		<cam1>
	}
	cameracuts_waitformorphorsongtime camera_songtime = <camera_songtime>
	ccam_domorph {
		<cam2>
		time = <camera_time>
	}
	cameracuts_waitscript camera_songtime = <camera_songtime> force_time = <force_time>
endscript

script cameracuts_waitformorphorsongtime 
	requireparams \{[
			camera_songtime
		]
		all}
	begin
	if ccam_ismorphcomplete
		return
	endif
	if cameracuts_waitscript camera_songtime = <camera_songtime> nowait
		goto \{nullscript}
	endif
	wait \{1
		gameframes}
	repeat
endscript

script cameracuts_waitfortimeorsongtime 
	requireparams \{[
			camera_songtime
			seconds
		]
		all}
	if scriptisrunning \{memcard_wait_for_timer}
		scriptassert \{'Using ResetTimer/TimeGreaterThan here is a problem!'}
	endif
	resettimer
	begin
	if timegreaterthan <seconds>
		return
	endif
	if cameracuts_waitscript camera_songtime = <camera_songtime> nowait
		goto \{nullscript}
	endif
	wait \{1
		gameframes}
	repeat
endscript

script cameracuts_encore 
	cameracuts_calctime force_time = <force_time>
	ccam_domorph {
		<cam1>
	}
	cameracuts_waitfortimeorsongtime camera_songtime = <camera_songtime> seconds = 3
	ccam_domorph {
		<cam2>
	}
	cameracuts_waitfortimeorsongtime camera_songtime = <camera_songtime> seconds = 2.5
	ccam_domorph {
		<cam3>
	}
	cameracuts_waitfortimeorsongtime camera_songtime = <camera_songtime> seconds = 3
	ccam_domorph {
		<cam4>
	}
	cameracuts_waitfortimeorsongtime camera_songtime = <camera_songtime> seconds = 2
	ccam_domorph {
		<cam5>
	}
	cameracuts_waitscript camera_songtime = <camera_songtime> force_time = <force_time>
endscript

script cameracuts_orbit 
	cameracuts_calctime force_time = <force_time>
	ccam_domorph {
		<...>
	}
	orbitangle = (3.1409998 * <orbitangle> / 180.0)
	if (<camera_time> > 0)
		ccam_orbit axis = (0.0, 1.0, 0.0) speed = (<orbitangle> / <camera_time>)
	endif
	cameracuts_sethandcamdriftonly
	cameracuts_waitscript camera_songtime = <camera_songtime> force_time = <force_time>
endscript

script cameracuts_orbitandmorphtwocam 
	cameracuts_calctime force_time = <force_time>
	if (<camera_time> > 0)
		<orbitangle> = (3.1409998 * <orbitangle> / 180.0)
		<orbitparams> = {axis = (0.0, 1.0, 0.0) speed = (<orbitangle> / <camera_time>)}
	endif
	ccam_domorph {
		<cam1>
	}
	if (<camera_time> > 0)
		if gotparam \{disableorbit1}
			ccam_orbit \{off}
		else
			ccam_orbit <orbitparams>
		endif
	endif
	cameracuts_sethandcamdriftonly
	ccam_domorph {
		<cam2>
		time = <camera_time>
	}
	if (<camera_time> > 0)
		if gotparam \{disableorbit2}
			ccam_orbit \{off}
		else
			ccam_orbit <orbitparams>
		endif
	endif
	cameracuts_waitscript camera_songtime = <camera_songtime> force_time = <force_time>
endscript

script cameracuts_splinemorph 
	cameracuts_calctime force_time = <force_time>
	ccam_splinemorph {
		<...>
		total_time = <camera_time>
	}
	cameracuts_waitscript camera_songtime = <camera_songtime> force_time = <force_time>
endscript

script cameracuts_specialstepmove 
	ccam_setsmoothing \{type = all
		on = 1
		slow_lerp_factor = 0.7
		fast_lerp_factor = 0.7
		lerp_dropoff = 2.0}
	cameracuts_calctime force_time = <force_time>
	ccam_domorph {
		<cam1>
	}
	cameracuts_sethandcamparams \{amplitudeposition = 0.0
		amplituderotation = -0.8}
	origpos = (<cam1>.pos)
	diry = <stepdir>
	count = 0.0
	timestep = 0.05
	step = (<timestep> / <steptime>)
	num_jumps = <stepnum>
	dirx = ((<cam2>.pos) - (<cam1>.pos))
	jump_multiplier = (<num_jumps> * 360.0)
	count = (<count> + <step>)
	begin
	if (<count> >= 1.0)
		break
	endif
	sin (<count> * <jump_multiplier>)
	pos = (<origpos> + <dirx> * <count> + <diry> * <sin>)
	ccam_domorph {
		<...>
		time = <timestep>
		motion = linear
	}
	begin
	if cameracuts_waitscript camera_songtime = <camera_songtime> nowait
		return
	endif
	if ccam_ismorphcomplete
		break
	endif
	wait \{1
		gameframes}
	repeat
	count = (<count> + <step>)
	repeat
	ccam_domorph {
		<cam2>
		time = <finalrottime>
		motion = smooth
	}
	cameracuts_waitscript camera_songtime = <camera_songtime> force_time = <force_time>
endscript

script cameracuts_applydof \{dof = $dof_medium02_tod_manager
		time = 0.0}
	doftype = <dof>
	dofparam = (<doftype>.screen_fx [0])
	if NOT screenfx_fxinstanceexists \{viewport = bg_viewport
			name = depth_of_field__simplified_}
		screenfx_addfxinstance {
			viewport = bg_viewport
			name = depth_of_field__simplified_
			<dofparam>
			time = <time>
		}
	else
		screenfx_updatefxinstanceparams {
			viewport = bg_viewport
			name = depth_of_field__simplified_
			<dofparam>
			time = <time>
		}
	endif
endscript

script applyao \{ao = $ao_far_tod_manager}
	aotype = <ao>
	aoparam = (<aotype>.screen_fx [0])
	if NOT screenfx_fxinstanceexists \{viewport = bg_viewport
			name = ambient_occlusion}
		screenfx_addfxinstance {
			viewport = bg_viewport
			name = ambient_occlusion
			<aoparam>
		}
	else
		screenfx_updatefxinstanceparams {
			viewport = bg_viewport
			name = ambient_occlusion
			<aoparam>
		}
	endif
endscript

script cameracuts_sethandcamdriftonly 
	ccam_enablehandcam \{shakeenabled = false
		driftenabled = true}
	driftslerpmap = [
		(0.1, 0.3)
		(0.2, 0.3)
	]
	if gotparam \{driftzoneangles}
		setarrayelement arrayname = driftslerpmap index = 1 newvalue = <driftzoneangles>
	endif
	ccam_sethandcamparams {
		$cinematic_camera_default_handcam_params
		driftslerpmap = <driftslerpmap>
	}
endscript

script cameracuts_sethandcamparams \{amplitudeposition = 0.01
		amplituderotation = -0.01}
	ccam_enablehandcam \{shakeenabled = true
		driftenabled = true}
	if gotparam \{handcamcloseup}
		driftslerpmap = [
			(0.0, 1.0)
			(0.03, 0.2)
		]
	else
		driftslerpmap = [
			(0.0, 0.8)
			(0.05, 1.0)
		]
	endif
	ccam_sethandcamparams {
		motionx = {
			amplitude = 0.033999998
			center = 0.0
			periodbase = 0.012999999
			periodmultiples = [
				1 , 3 , 4
			]
		}
		motiony = {
			amplitude = 0.04
			center = 0.0
			periodbase = 0.016999999
			periodmultiples = [
				1 , 3 , 4
			]
		}
		amplitudeposition = {
			amplitude = <amplitudeposition>
			center = 0.0
			periodbase = 0.0023
			periodmultiples = [
				1 , 16
			]
		}
		amplituderotation = {
			amplitude = <amplituderotation>
			center = 0.0
			periodbase = 0.0023
			periodmultiples = [
				1
			]
		}
		zoomstabilitymap = [
			(1.3, 0.7)
			(30.0, 100.0)
		]
		driftslerpmap = <driftslerpmap>
		zoomdriftmap = [
			(1.2, 0.6)
			(30.0, 100.0)
		]
		driftallowedamplitude = {
			amplitude = 0.4
			center = 1.0
			periodbase = 0.02
			periodmultiples = [
				1
			]
		}
	}
endscript

script cameracuts_handcamzoom2 
	ccam_domorph
	zooming = false
	if (<zooming> = true)
		amplitudeposition = 0.01
		amplituderotation = -0.01
	else
		amplitudeposition = ($handcam_amplitudeposition)
		amplituderotation = ($handcam_amplituderotation)
	endif
	cameracuts_sethandcamparams <...>
	cameracuts_waitfortimeorsongtime camera_songtime = <camera_songtime> seconds = 2
	ccam_domorph <...> fov = 50 time = 0.6 motion = smooth
	cameracuts_waitformorphorsongtime camera_songtime = <camera_songtime>
	cameracuts_waitfortimeorsongtime camera_songtime = <camera_songtime> seconds = 0.1
	ccam_domorph <...> fov = 53 time = 0.25 motion = smooth
	cameracuts_waitformorphorsongtime camera_songtime = <camera_songtime>
	cameracuts_waitfortimeorsongtime camera_songtime = <camera_songtime> seconds = 0.03
	ccam_domorph <...> fov = 51 time = 0.3 motion = smooth
	cameracuts_waitformorphorsongtime camera_songtime = <camera_songtime>
	ccam_domorph <...> fov = 51
	cameracuts_calctime force_time = <force_time>
	cameracuts_waitscript camera_songtime = <camera_songtime> force_time = <force_time>
endscript

script cameracuts_quickzoom 
	ccam_domorph
	zooming = false
	if (<zooming> = true)
		amplitudeposition = 0.01
		amplituderotation = -0.01
	else
		amplitudeposition = ($handcam_amplitudeposition)
		amplituderotation = ($handcam_amplituderotation)
	endif
	cameracuts_sethandcamparams <...>
	ccam_domorph {
		<cam1>
	}
	cameracuts_waitformorphorsongtime camera_songtime = <camera_songtime>
	cameracuts_waitfortimeorsongtime camera_songtime = <camera_songtime> seconds = 2
	ccam_domorph {
		<cam1>
	}
	cameracuts_waitformorphorsongtime camera_songtime = <camera_songtime>
	ccam_domorph {
		<cam2>
		time = 0.75
		motion = smooth
	}
	cameracuts_waitformorphorsongtime camera_songtime = <camera_songtime>
	ccam_domorph {
		<cam2>
	}
	cameracuts_waitformorphorsongtime camera_songtime = <camera_songtime>
	cameracuts_calctime force_time = <force_time>
	cameracuts_waitscript camera_songtime = <camera_songtime> force_time = <force_time>
endscript

script cameracuts_pan 
	cameracuts_sethandcamparams {
		amplitudeposition = ($handcam_amplitudeposition)
		amplituderotation = ($handcam_amplituderotation)
	}
	ccam_domorph {
		<cam1>
		time = 0
	}
	cameracuts_waitfortimeorsongtime camera_songtime = <camera_songtime> seconds = 2
	ccam_domorph {
		<cam2>
		time = 1
		motion = smooth
	}
	cameracuts_waitformorphorsongtime camera_songtime = <camera_songtime>
	cameracuts_calctime force_time = <force_time>
	cameracuts_waitscript camera_songtime = <camera_songtime> force_time = <force_time>
endscript

script cameracuts_threepos 
	cameracuts_calctime force_time = <force_time>
	if (<camera_time> < 0.1)
		camera_time = 0.1
	endif
	ccam_splinemorph {
		keyframes =
		[
			{
				<cam1>
			}
			{
				<cam2>
			}
			{
				<cam3>
			}
		]
		total_time = <camera_time>
	}
	cameracuts_waitscript camera_songtime = <camera_songtime> force_time = <force_time>
endscript

script cameracuts_fourpos 
	cameracuts_calctime force_time = <force_time>
	ccam_splinemorph {
		keyframes =
		[
			{
				<cam1>
			}
			{
				<cam2>
			}
			{
				<cam3>
			}
			{
				<cam4>
			}
		]
		total_time = <camera_time>
	}
	cameracuts_waitscript camera_songtime = <camera_songtime> force_time = <force_time>
endscript
jumbotron_focus = none

script jumbotron_setoverride 
	change jumbotron_focus = <focus>
endscript
default_cameras_good = [
	{
		name = good_from_stage
		play_hold = 1
		lockto = guitarist
		pos = (1.5175159, 4.1361775, -4.089658)
		quat = (0.130047, -0.018706, 0.0024160002)
		fov = 72.0
	}
]
default_cameras_normal = [
	{
		name = normal_crowd_center
		play_hold = 1
		lockto = guitarist
		pos = (5.108431, 1.485993, 13.082112)
		quat = (0.0025400002, -0.9918739, 0.019756)
		fov = 72.0
	}
]
default_cameras_poor = [
	{
		name = poor_crowd_center
		play_hold = 1
		lockto = guitarist
		pos = (-1.573781, 1.4759071, 20.610792)
		quat = (-0.00064900005, 0.998182, 0.010279999)
		fov = 72.0
	}
]
default_cameras_moments = [
	{
		name = moment01
		lockto = moment_cam_lock_target_01
		locktobone = bone_camera
		pos = (0.0, 0.0, 0.0)
		quat = (0.0, 0.0, 0.0)
		fov = 72.0
	}
	{
		name = moment02
		lockto = moment_cam_lock_target_02
		locktobone = bone_camera
		pos = (0.0, 0.0, 0.0)
		quat = (0.0, 0.0, 0.0)
		fov = 72.0
	}
	{
		name = moment03
		lockto = moment_cam_lock_target_03
		locktobone = bone_camera
		pos = (0.0, 0.0, 0.0)
		quat = (0.0, 0.0, 0.0)
		fov = 72.0
	}
	{
		name = moment04
		lockto = moment_cam_lock_target_04
		locktobone = bone_camera
		pos = (0.0, 0.0, 0.0)
		quat = (0.0, 0.0, 0.0)
		fov = 72.0
	}
	{
		name = moment05
		lockto = moment_cam_lock_target_05
		locktobone = bone_camera
		pos = (0.0, 0.0, 0.0)
		quat = (0.0, 0.0, 0.0)
		fov = 72.0
	}
	{
		name = moment06
		lockto = moment_cam_lock_target_06
		locktobone = bone_camera
		pos = (0.0, 0.0, 0.0)
		quat = (0.0, 0.0, 0.0)
		fov = 72.0
	}
	{
		name = moment07
		lockto = moment_cam_lock_target_07
		locktobone = bone_camera
		pos = (0.0, 0.0, 0.0)
		quat = (0.0, 0.0, 0.0)
		fov = 72.0
	}
	{
		name = moment08
		lockto = moment_cam_lock_target_08
		locktobone = bone_camera
		pos = (0.0, 0.0, 0.0)
		quat = (0.0, 0.0, 0.0)
		fov = 72.0
	}
	{
		name = moment09
		lockto = moment_cam_lock_target_09
		locktobone = bone_camera
		pos = (0.0, 0.0, 0.0)
		quat = (0.0, 0.0, 0.0)
		fov = 72.0
	}
	{
		name = moment10
		lockto = moment_cam_lock_target_10
		locktobone = bone_camera
		pos = (0.0, 0.0, 0.0)
		quat = (0.0, 0.0, 0.0)
		fov = 72.0
	}
]
default_cameras_guitarist = [
	{
		name = rrrrrrrrrrrrrrrrrrrrrrrrguitarist_closeup
		type = guitarist_closeup
		lockto = world
		pos = (-6.321385, 0.924312, -2.6622968)
		quat = (-0.026229998, 0.784364, 0.032947995)
		fov = 72.0
	}
	{
		name = guitarist_stage
		lockto = world
		pos = (-6.321385, 0.924312, -2.6622968)
		quat = (-0.026229998, 0.784364, 0.032947995)
		fov = 72.0
	}
	{
		name = guitarist_mocap01
		lockto = musician1_mocap_lock_target_01
		locktobone = bone_camera
		pos = (0.0, 0.0, 0.0)
		quat = (0.0, 0.0, 0.0)
		fov = 72.0
	}
	{
		name = guitarist_mocap02
		lockto = musician1_mocap_lock_target_02
		locktobone = bone_camera
		pos = (0.0, 0.0, 0.0)
		quat = (0.0, 0.0, 0.0)
		fov = 72.0
	}
]
default_cameras_singer = [
	{
		name = singer_closeup
		type = singer_closeup
		lockto = world
		pos = (-6.321385, 0.924312, -2.6622968)
		quat = (-0.026229998, 0.784364, 0.032947995)
		fov = 72.0
	}
	{
		name = singer_stage
		lockto = world
		pos = (-6.321385, 0.924312, -2.6622968)
		quat = (-0.026229998, 0.784364, 0.032947995)
		fov = 72.0
	}
	{
		name = singer_mocap01
		lockto = musician3_mocap_lock_target_01
		locktobone = bone_camera
		pos = (0.0, 0.0, 0.0)
		quat = (0.0, 0.0, 0.0)
		fov = 72.0
	}
	{
		name = singer_mocap02
		lockto = musician3_mocap_lock_target_02
		locktobone = bone_camera
		pos = (0.0, 0.0, 0.0)
		quat = (0.0, 0.0, 0.0)
		fov = 72.0
	}
]
default_cameras_bassist = [
	{
		name = bassist_closeup
		type = bassist_closeup
		lockto = world
		pos = (-6.321385, 0.924312, -2.6622968)
		quat = (-0.026229998, 0.784364, 0.032947995)
		fov = 72.0
	}
	{
		name = bassist_stage
		lockto = world
		pos = (-6.321385, 0.924312, -2.6622968)
		quat = (-0.026229998, 0.784364, 0.032947995)
		fov = 72.0
	}
	{
		name = bassist_mocap01
		lockto = musician2_mocap_lock_target_01
		locktobone = bone_camera
		pos = (0.0, 0.0, 0.0)
		quat = (0.0, 0.0, 0.0)
		fov = 72.0
	}
	{
		name = bassist_mocap02
		lockto = musician2_mocap_lock_target_02
		locktobone = bone_camera
		pos = (0.0, 0.0, 0.0)
		quat = (0.0, 0.0, 0.0)
		fov = 72.0
	}
]
default_cameras_drummer = [
	{
		name = drummer_closeup
		type = drummer_closeup
		lockto = world
		pos = (-6.321385, 0.924312, -2.6622968)
		quat = (-0.026229998, 0.784364, 0.032947995)
		fov = 72.0
	}
	{
		name = drummer_stage
		type = drummer_stage
		lockto = world
		pos = (-6.321385, 0.924312, -2.6622968)
		quat = (-0.026229998, 0.784364, 0.032947995)
		fov = 72.0
	}
	{
		name = drummer_mocap01
		lockto = musician4_mocap_lock_target_01
		locktobone = bone_camera
		pos = (0.0, 0.0, 0.0)
		quat = (0.0, 0.0, 0.0)
		fov = 72.0
	}
	{
		name = drummer_mocap02
		lockto = musician4_mocap_lock_target_02
		locktobone = bone_camera
		pos = (0.0, 0.0, 0.0)
		quat = (0.0, 0.0, 0.0)
		fov = 72.0
	}
]
default_cameras = [
	{
		name = longshot
		type = longshot
		lockto = world
		pos = (-6.321385, 0.924312, -2.6622968)
		quat = (-0.026229998, 0.784364, 0.032947995)
		fov = 72.0
	}
	{
		name = midshot
		type = midshot
		lockto = world
		pos = (-6.321385, 0.924312, -2.6622968)
		quat = (-0.026229998, 0.784364, 0.032947995)
		fov = 72.0
	}
	{
		name = venue_midshot
		type = venue_midshot
		lockto = world
		pos = (-6.321385, 0.924312, -2.6622968)
		quat = (-0.026229998, 0.784364, 0.032947995)
		fov = 72.0
	}
	{
		name = generic_stage_shot
		type = generic_stage_shot
		lockto = world
		pos = (-6.321385, 0.924312, -2.6622968)
		quat = (-0.026229998, 0.784364, 0.032947995)
		fov = 72.0
	}
]
default_cameras_headtohead = [
	{
		name = headtohead_longshot
		controlscript = cameracuts_handcam
		params = {
			lockto = world
			pos = (2.984848, 2.319129, 8.964585)
			quat = (0.013296999, -0.9863979, 0.09915701)
			fov = 72.0
		}
	}
	{
		name = headtohead_midshot
		controlscript = cameracuts_handcam
		params = {
			lockto = world
			pos = (2.286206, 1.399632, -0.8574021)
			quat = (0.013289999, -0.97393197, 0.058316004)
			fov = 72.0
		}
	}
	{
		name = headtohead_venue_midshot
		controlscript = cameracuts_handcam
		params = {
			lockto = world
			pos = (0.48657104, 1.8374078, 4.633928)
			quat = (0.00057300006, -0.99960995, 0.019561999)
			fov = 72.0
		}
	}
	{
		name = headtohead_stage_shot
		controlscript = cameracuts_handcam
		params = {
			lockto = world
			pos = (3.347051, 2.0671618, -7.5946074)
			quat = (0.12163001, -0.398576, 0.053206)
			fov = 72.0
		}
	}
]
default_cameras_jam_mode = [
	{
		name = jammode_longshot
		controlscript = cameracuts_handcam
		params = {
			lockto = world
			pos = (3.9096844, 2.581986, 12.654455)
			quat = (0.026690999, -0.968614, 0.123729)
			fov = 72.0
		}
	}
	{
		name = jammode_midshot
		controlscript = cameracuts_handcam
		params = {
			lockto = world
			pos = (0.055207, 2.071424, 9.734074)
			quat = (0.001375, -0.990425, 0.137294)
			fov = 72.0
		}
	}
	{
		name = jammode_venue_midshot
		controlscript = cameracuts_handcam
		params = {
			lockto = world
			pos = (-4.4341054, 2.250556, 13.4862995)
			quat = (0.020083, 0.97846603, -0.10951801)
			fov = 72.0
		}
	}
	{
		name = jammode_stage_shot
		controlscript = cameracuts_handcam
		params = {
			lockto = world
			pos = (-2.6811976, 0.80954903, 0.235918)
			quat = (0.05509, 0.239629, -0.012985)
			fov = 91.0
		}
	}
]
default_cameras_solo = [
	{
		name = solo_guitar
		type = solo_guitar
		lockto = world
		pos = (-6.321385, 0.924312, -2.6622968)
		quat = (-0.026229998, 0.784364, 0.032947995)
		fov = 72.0
	}
	{
		name = solo_vocal
		type = solo_vocal
		lockto = world
		pos = (-6.321385, 0.924312, -2.6622968)
		quat = (-0.026229998, 0.784364, 0.032947995)
		fov = 72.0
	}
	{
		name = solo_drum
		type = solo_drum
		lockto = world
		pos = (-6.321385, 0.924312, -2.6622968)
		quat = (-0.026229998, 0.784364, 0.032947995)
		fov = 72.0
	}
	{
		name = solo_bass
		type = solo_bass
		lockto = world
		pos = (-6.321385, 0.924312, -2.6622968)
		quat = (-0.026229998, 0.784364, 0.032947995)
		fov = 72.0
	}
]
default_cameras_single = [
	{
		name = single_guitar
		type = single
		lockto = world
		pos = (-6.321385, 0.924312, -2.6622968)
		quat = (-0.026229998, 0.784364, 0.032947995)
		fov = 72.0
	}
	{
		name = single_vocal
		type = single
		lockto = world
		pos = (-4.3443885, 0.950269, -0.84059906)
		quat = (1.9E-05, 0.99112797, -0.001512)
		fov = 72.0
	}
	{
		name = single_drum
		type = single
		lockto = world
		pos = (-6.321385, 0.924312, -2.6622968)
		quat = (-0.026229998, 0.784364, 0.032947995)
		fov = 72.0
	}
	{
		name = single_bass
		type = single
		lockto = world
		pos = (-4.3443885, 0.950269, -0.84059906)
		quat = (1.9E-05, 0.99112797, -0.001512)
		fov = 72.0
	}
]
default_cameras_autocut = [
	{
		name = singer_closeup
		controlscript = cameracuts_handcam
		type = singer_closeup
		params = {
			handcamcloseup
			lockto = vocalist
			pos = (1.5492508, 0.89227194, 3.045015)
			quat = (-0.027715, -0.9707769, -0.09122801)
			fov = 13.0
			lookat = vocalist
			lookatbone = bone_head
			screenoffset = (0.42601603, 0.014149999)
			distfromlookat = 3.695025
		}
		dof = $dof_closeup02_tod_manager
		crowdoff
	}
	{
		name = singer_closeup2
		controlscript = cameracuts_handcam
		type = singer_closeup
		params = {
			handcamcloseup
			lockto = vocalist
			pos = (-2.334458, 1.118762, 1.899987)
			quat = (-0.025109, 0.89701205, 0.067262)
			fov = 11.0
			lookat = vocalist
			lookatbone = bone_head
			screenoffset = (-0.62771505, 0.075389)
			distfromlookat = 3.354081
		}
		dof = $dof_closeup01_tod_manager
		crowdoff
	}
	{
		name = singer_mocap01
		lockto = vocalist_mocap_lock_target_01
		locktobone = bone_camera
		pos = (0.0, 0.0, 0.0)
		quat = (0.0, 0.0, 0.0)
		fov = 65.0
		dof = $dof_closeup02_tod_manager
	}
	{
		name = singer_mocap02
		lockto = vocalist_mocap_lock_target_02
		locktobone = bone_camera
		pos = (0.0, 0.0, 0.0)
		quat = (0.0, 0.0, 0.0)
		fov = 65.0
		dof = $dof_medium02_tod_manager
	}
	{
		name = guitarist_closeup
		type = closeup
		controlscript = cameracuts_handcam
		params = {
			lockto = guitarist
			pos = (3.6475768, 1.0763031, 1.5907401)
			quat = (-0.028113, -0.82460296, -0.029011)
			fov = 25.0
			lookat = guitarist
			lookatbone = bone_chest
			screenoffset = (0.471216, 0.186662)
			distfromlookat = 3.3977568
		}
		dof = $dof_closeup01_tod_manager
		crowdoff
	}
	{
		name = guitarist_closeup02
		type = closeup
		controlscript = cameracuts_handcam
		params = {
			lockto = guitarist
			pos = (0.283945, 0.45201203, 4.4524693)
			quat = (0.0065240003, 0.994423, 0.105216004)
			fov = 18.0
			lookat = guitarist
			lookatbone = bone_chest
			screenoffset = (0.44280702, 0.31687602)
			distfromlookat = 4.4968452
		}
		dof = $dof_closeup01_tod_manager
		crowdoff
	}
	{
		name = guitarist_mocap01
		lockto = guitarist_mocap_lock_target_01
		locktobone = bone_camera
		pos = (0.0, 0.0, 0.0)
		quat = (0.0, 0.0, 0.0)
		fov = 65.0
		dof = $dof_closeup02_tod_manager
	}
	{
		name = guitarist_mocap02
		lockto = guitarist_mocap_lock_target_02
		locktobone = bone_camera
		pos = (0.0, 0.0, 0.0)
		quat = (0.0, 0.0, 0.0)
		fov = 65.0
		dof = $dof_closeup01_tod_manager
	}
	{
		name = bassist_closeup
		controlscript = cameracuts_handcam
		params = {
			lockto = bassist
			pos = (-3.7086382, 1.1985401, 1.8435988)
			quat = (-0.001098, 0.830151, 0.013861)
			fov = 28.0
			lookat = bassist
			lookatbone = bone_chest
			screenoffset = (-0.419754, -0.019663)
			distfromlookat = 3.61233
		}
		dof = $dof_closeup02_tod_manager
		crowdoff
	}
	{
		name = bassist_mocap01
		lockto = bassist_mocap_lock_target_01
		locktobone = bone_camera
		pos = (0.0, 0.0, 0.0)
		quat = (0.0, 0.0, 0.0)
		fov = 65.0
		dof = $dof_closeup01_tod_manager
	}
	{
		name = bassist_mocap02
		lockto = bassist_mocap_lock_target_02
		locktobone = bone_camera
		pos = (0.0, 0.0, 0.0)
		quat = (0.0, 0.0, 0.0)
		fov = 65.0
		dof = $dof_medium02_tod_manager
	}
	{
		name = drummer_closeup
		type = drummer_closeup
		controlscript = cameracuts_twocam
		params = {
			usehandcam
			cam1 = {
				lockto = drummer
				pos = (-0.082587995, 1.004094, 1.6833342)
				quat = (0.0067860004, 0.99438393, 0.000623)
				fov = 32.0
				lookat = drummer
				lookatbone = bone_head
				screenoffset = (-0.251453, -0.21729802)
				distfromlookat = 1.752825
			}
			cam2 = {
				lockto = drummer
				pos = (-0.13792199, 1.0048649, 1.6714461)
				quat = (0.0067760004, 0.9927139, 0.000723)
				fov = 32.0
				lookat = drummer
				lookatbone = bone_head
				screenoffset = (-0.24174, -0.21511501)
				distfromlookat = 1.7497649
			}
			crowdoff
			dof = $dof_closeup02_tod_manager
		}
	}
	{
		name = drummer_closeup02
		type = drummer_closeup
		controlscript = cameracuts_twocam
		params = {
			usehandcam
			cam1 = {
				lockto = drummer
				pos = (1.017448, 0.82566696, 1.235776)
				quat = (-0.02791, -0.93970597, -0.057794)
				fov = 32.0
				lookat = drummer
				lookatbone = bone_head
				screenoffset = (0.33858898, -0.15662)
				distfromlookat = 1.550921
			}
			cam2 = {
				lockto = drummer
				pos = (1.030278, 0.825441, 1.2252411)
				quat = (-0.028205998, -0.93797094, -0.05765)
				fov = 32.0
				lookat = drummer
				lookatbone = bone_head
				screenoffset = (0.33669803, -0.15839502)
				distfromlookat = 1.5494419
			}
			crowdoff
			dof = $dof_closeup02_tod_manager
		}
	}
	{
		name = drummer_mocap01
		lockto = drummer_mocap_lock_target_01
		locktobone = bone_camera
		pos = (0.0, 0.0, 0.0)
		quat = (0.0, 0.0, 0.0)
		fov = 65.0
		dof = $dof_medium02_tod_manager
	}
	{
		name = drummer_mocap02
		lockto = drummer_mocap_lock_target_02
		locktobone = bone_camera
		pos = (0.0, 0.0, 0.0)
		quat = (0.0, 0.0, 0.0)
		fov = 65.0
		dof = $dof_medium02_tod_manager
	}
	{
		name = spotlight
		controlscript = cameracuts_handcam
		params = {
			lockto = vocalist
			pos = (5.2537947, 3.7356453, 5.9229445)
			quat = (0.057692, -0.937805, 0.20332801)
			fov = 59.0
		}
		dof = $dof_medium02_tod_manager
	}
	{
		controlscript = cameracuts_specialstepmove
		params = {
			name = audience_r
			type = audience
			cam1 = {
				lockto = vocalist
				pos = (11.858139, 1.700623, 14.502603)
				quat = (0.012594, -0.93913496, 0.055007)
				fov = 37.0
			}
			cam2 = {
				lockto = vocalist
				pos = (11.858139, 1.700623, 14.502603)
				quat = (0.012594, -0.93913496, 0.055007)
				fov = 37.0
			}
			steptime = 6.0
			finalrottime = 1.0
			stepnum = 6.0
			stepdir = (0.0, 0.07, 0.05)
			dof = $dof_medium01_tod_manager
		}
	}
	{
		controlscript = cameracuts_specialstepmove
		params = {
			name = audience_c
			type = audience
			cam1 = {
				lockto = vocalist
				pos = (-1.8534688, 1.89821, 17.983355)
				quat = (0.011201, 0.995569, -0.062671)
				fov = 41.0
			}
			cam2 = {
				lockto = vocalist
				pos = (-1.8534688, 1.89821, 17.983355)
				quat = (0.011201, 0.995569, -0.062671)
				fov = 41.0
			}
			steptime = 6.0
			finalrottime = 1.0
			stepnum = 6.0
			stepdir = (0.0, 0.07, 0.05)
			dof = $dof_medium01_tod_manager
		}
	}
	{
		controlscript = cameracuts_specialstepmove
		params = {
			name = audience_l
			type = audience
			cam1 = {
				lockto = vocalist
				pos = (-8.00015, 1.797529, 15.347496)
				quat = (0.025906, 0.961762, -0.068592)
				fov = 46.0
			}
			cam2 = {
				lockto = vocalist
				pos = (-8.00015, 1.797529, 15.347496)
				quat = (0.025906, 0.961762, -0.068592)
				fov = 46.0
			}
			steptime = 6.0
			finalrottime = 1.0
			stepnum = 6.0
			stepdir = (0.0, 0.07, 0.05)
			dof = $dof_medium01_tod_manager
		}
	}
]
default_cameras_special = [
	{
		name = special01
		lockto = world
		pos = (-6.321385, 0.924312, -2.6622968)
		quat = (-0.026229998, 0.784364, 0.032947995)
		fov = 72.0
	}
	{
		name = special02
		lockto = world
		pos = (-4.3443885, 0.950269, -0.84059906)
		quat = (1.9E-05, 0.99112797, -0.001512)
		fov = 72.0
	}
]
default_cameras_audience = [
	{
		controlscript = cameracuts_specialstepmove
		params = {
			name = audience_r
			type = audience
			cam1 = {
				lockto = world
				pos = (5.888749, -0.09943501, 5.550212)
				quat = (-0.008041001, -0.97881204, -0.039359003)
				fov = 49.0
				lookat = vocalist
				screenoffset = (-0.32207203, 0.172022)
			}
			cam2 = {
				lockto = world
				pos = (6.091454, -0.099421, 5.463399)
				quat = (-0.0085080005, -0.97635895, -0.039261)
				fov = 49.0
				lookat = vocalist
				screenoffset = (-0.30865702, 0.172709)
			}
			steptime = 6.0
			finalrottime = 1.0
			stepnum = 6.0
			stepdir = (0.0, 0.07, 0.05)
			dof = $dof_medium01_tod_manager
		}
	}
]
default_cameras_zoom = [
	{
		name = zoom_in
		controlscript = cameracuts_twocam
		params = {
			usehandcam
			cam1 = {
				lockto = world
				pos = (7.586032, 0.200963, 15.85076)
				quat = (0.009055, -0.97853, 0.039293)
				fov = 83.0
			}
			cam2 = {
				lockto = world
				pos = (7.586032, 0.200963, 15.85076)
				quat = (0.000763, -0.98286796, -0.000915)
				fov = 29.0
			}
		}
		dof = $dof_medium01_tod_manager
	}
	{
		name = zoom_out
		controlscript = cameracuts_twocam
		params = {
			usehandcam
			cam1 = {
				lockto = world
				pos = (7.586032, 0.200963, 15.85076)
				quat = (0.000763, -0.98286796, -0.000915)
				fov = 29.0
			}
			cam2 = {
				lockto = world
				pos = (7.586032, 0.200963, 15.85076)
				quat = (0.009055, -0.97853, 0.039293)
				fov = 83.0
			}
		}
		dof = $dof_medium01_tod_manager
	}
]
default_cameras_spotlight = [
	{
		name = spotlight
		lockto = drummer
		pos = (-0.59138894, 3.714998, 12.7414465)
		quat = (0.0042340006, 0.97817, -0.204423)
		fov = 72.0
	}
]
default_cameras_intro = [
	{
		name = crowd_center_zoom
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = world
				pos = (0.35540104, 1.766598, 9.495748)
				quat = (0.00019699999, -0.999465, 0.032123)
				fov = 72.0
			}
			cam2 = {
				lockto = world
				pos = (0.30482104, 3.097976, 5.3770776)
				quat = (0.0012020001, -0.98061997, 0.195825)
				fov = 72.0
			}
		}
	}
]
default_cameras_fastintro = [
	{
		name = crowd_center_zoom
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = world
				pos = (0.30482104, 3.097976, 5.3770776)
				quat = (0.0012020001, -0.98061997, 0.195825)
				fov = 72.0
			}
			cam2 = {
				lockto = world
				pos = (0.35540104, 1.766598, 9.495748)
				quat = (0.00019699999, -0.999465, 0.032123)
				fov = 72.0
			}
		}
	}
]
default_cameras_preencore = [
	{
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = drummer
				pos = (-2.4889898, 2.2800958, 9.589442)
				quat = (0.033784002, 0.965961, -0.164262)
				fov = 72.0
				lookat = drummer
				lookatbone = bone_chest
				screenoffset = (-0.225398, -0.579956)
			}
			cam2 = {
				lockto = drummer
				pos = (4.951395, 2.2763019, 9.435161)
				quat = (0.050596002, -0.9369719, 0.15382701)
				fov = 72.0
				lookat = drummer
				lookatbone = bone_chest
				screenoffset = (0.26263002, -0.568209)
			}
		}
	}
]
default_cameras_encore = [
	{
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = world
				pos = (-2.8748507, 2.11633, 3.001765)
				quat = (0.055925, 0.88826996, -0.112448)
				fov = 72.0
			}
			cam2 = {
				lockto = world
				pos = (6.485794, 2.790986, 6.2345123)
				quat = (0.081708, -0.7229049, 0.08677899)
				fov = 72.0
			}
		}
	}
]
default_cameras_win = [
	{
		controlscript = cameracuts_handcam
		params = {
			name = win
			lockto = world
			pos = (0.622013, 0.681226, 1.318936)
			quat = (-0.016913, -0.92676395, -0.041992996)
			fov = 72.0
		}
		dof = $dof_closeup02_tod_manager
	}
]
default_cameras_lose = [
	{
		controlscript = cameracuts_handcam
		params = {
			name = lose
			lockto = world
			pos = (-0.97144395, 0.90905, 0.850675)
			quat = (-0.00064100005, -0.99934596, -0.02286)
			fov = 72.0
		}
		dof = $dof_closeup02_tod_manager
	}
]
default_cameras_loading = [
	{
		name = loading
		controlscript = cameracuts_twocam
		params = {
			usehandcam
			cam1 = {
				lockto = world
				pos = (-6.204663, 2.698264, 10.309547)
				quat = (0.016273, 0.97326, -0.074999005)
				fov = 72.0
			}
			cam2 = {
				lockto = world
				pos = (4.084505, 2.316533, 7.104564)
				quat = (0.020193998, -0.96327096, 0.074039005)
				fov = 72.0
			}
		}
		dof = $dof_medium01_tod_manager
	}
]
default_cameras_finalbandintro = [
	{
		name = finalbandintro
		controlscript = cameracuts_twocam
		params = {
			usehandcam
			cam1 = {
				lockto = world
				pos = (4.084505, 2.316533, 7.104564)
				quat = (0.020193998, -0.96327096, 0.074039005)
				fov = 72.0
			}
			cam2 = {
				lockto = world
				pos = (-6.204663, 2.698264, 10.309547)
				quat = (0.016273, 0.97326, -0.074999005)
				fov = 72.0
			}
		}
		dof = $dof_medium01_tod_manager
	}
]
default_cameras_finalbandoutro = [
	{
		name = finalbandoutro
		controlscript = cameracuts_twocam
		params = {
			usehandcam
			cam1 = {
				lockto = world
				pos = (4.084505, 2.316533, 7.104564)
				quat = (0.020193998, -0.96327096, 0.074039005)
				fov = 72.0
			}
			cam2 = {
				lockto = world
				pos = (-6.204663, 2.698264, 10.309547)
				quat = (0.016273, 0.97326, -0.074999005)
				fov = 72.0
			}
		}
		dof = $dof_medium01_tod_manager
	}
]
default_cameras_no_band = [
	{
		name = noband
		controlscript = cameracuts_handcam
		params = {
			lockto = world
			pos = (8.588713, 5.921629, 8.272691)
			quat = (-0.011485, -0.9662969, -0.048534002)
			fov = 72.0
		}
		dof = $dof_closeup02_tod_manager
	}
]
default_cameras_orbits = [
	{
		controlscript = cameracuts_orbit
		params = {
			name = orbit_low
			type = orbit_low
			lockto = drummer
			pos = (6.3687263, 1.633705, 19.943876)
			quat = (0.007162, -0.984545, 0.053423)
			fov = 45.0
			orbitangle = -40
		}
		dof = $dof_medium02_tod_manager
	}
	{
		controlscript = cameracuts_orbit
		params = {
			name = orbit_low02
			type = orbit_low
			lockto = drummer
			pos = (-11.5815115, 2.4439182, 22.490376)
			quat = (0.017549999, 0.96715605, -0.061473995)
			fov = 35.0
			orbitangle = 40
		}
		dof = $dof_medium02_tod_manager
	}
	{
		controlscript = cameracuts_orbit
		params = {
			name = orbit_high
			type = orbit_high
			lockto = drummer
			pos = (10.116585, 6.30597, 22.762821)
			quat = (0.034197997, -0.963171, 0.16785899)
			fov = 62.0
			orbitangle = -40
		}
		dof = $dof_medium02_tod_manager
	}
	{
		controlscript = cameracuts_orbit
		params = {
			name = orbit_high02
			type = orbit_high
			lockto = drummer
			pos = (-11.202224, 6.3884473, 21.25471)
			quat = (0.043300997, 0.95523196, -0.16217701)
			fov = 56.0
			orbitangle = 40
		}
		dof = $dof_medium02_tod_manager
	}
]
default_cameras_verts_front = [
	{
		name = vert_front01
		type = verts_front
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = world
				pos = (4.093626, 0.367648, 8.18222)
				quat = (-0.005631, -0.932861, -0.0097469995)
				fov = 72.0
			}
			cam2 = {
				lockto = world
				pos = (4.4239135, 4.868402, 9.268306)
				quat = (0.087894, -0.90976995, 0.269179)
				fov = 72.0
			}
		}
		dof = $dof_medium01_tod_manager
	}
]
default_cameras_verts_rear = [
	{
		name = vert_rear01
		type = verts_rear
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = world
				pos = (2.103098, 0.8927869, -2.3562832)
				quat = (0.070226, -0.12539001, 0.01066)
				fov = 73.0
			}
			cam2 = {
				lockto = world
				pos = (1.8227749, 4.8754377, -1.3246669)
				quat = (0.10814801, -0.107700996, 0.013551)
				fov = 73.0
			}
		}
		dof = $dof_medium01_tod_manager
	}
]
default_cameras_g_across_stage = [
	{
		name = g_across_stage
		type = g_across_stage
		controlscript = cameracuts_handcam
		params = {
			handcamcloseup
			lockto = guitarist
			pos = (-10.524325, 1.2712423, 1.0648409)
			quat = (0.0075330003, 0.731524, -0.009516999)
			fov = 17.0
			lookat = guitarist
			lookatbone = bone_head
			screenoffset = (-0.19467999, -0.636386)
			distfromlookat = 10.103118
		}
		dof = $dof_across_stage_1_tod_manager
	}
]
default_cameras_s_across_stage = [
	{
		name = s_across_stage
		type = s_across_stage
		controlscript = cameracuts_handcam
		params = {
			handcamcloseup
			lockto = vocalist
			pos = (8.223535, 0.72865397, 0.79751205)
			quat = (-0.027639, -0.704612, -0.025023999)
			fov = 12.0
			lookat = vocalist
			lookatbone = bone_head
			screenoffset = (0.41745302, -0.52084696)
			distfromlookat = 8.893963
		}
		dof = $dof_across_stage_2_tod_manager
	}
]
default_cameras_nonstandardcloseups = [
	{
		name = guitarist_node_alt_closeup
		type = guitarist_closeup
		controlscript = cameracuts_handcam
		params = {
			handcamcloseup
			lockto = guitarist
			pos = (1.089306, 1.145523, 0.94846904)
			quat = (0.0334, -0.90654695, 0.055017997)
			fov = 59.0
			lookat = guitarist
			lookatbone = bone_head
			screenoffset = (0.29378498, -0.55152303)
			distfromlookat = 1.4995929
		}
		dof = $dof_closeup02_tod_manager
	}
	{
		name = vocalist_node_alt_closeup
		type = vocalist_closeup
		controlscript = cameracuts_handcam
		params = {
			handcamcloseup
			lockto = vocalist
			pos = (-0.013354, 0.983401, 1.1988411)
			quat = (-0.012851, 0.9903829, 0.041066997)
			fov = 49.0
			lookat = vocalist
			lookatbone = bone_head
			screenoffset = (-0.245973, -0.262334)
			distfromlookat = 1.4501979
		}
		dof = $dof_closeup01_tod_manager
	}
	{
		name = bassist_node_alt_closeup
		type = bassist_closeup
		controlscript = cameracuts_handcam
		params = {
			handcamcloseup
			lockto = bassist
			pos = (0.750627, 0.94780207, 0.87759805)
			quat = (-0.014581999, -0.95217395, -0.071487)
			fov = 57.0
			lookat = bassist
			lookatbone = bone_head
			screenoffset = (0.267916, -0.23232801)
			distfromlookat = 1.1711142
		}
		dof = $dof_closeup01_tod_manager
	}
	{
		name = drummer_node_alt_closeup
		type = drummer_closeup
		controlscript = cameracuts_handcam
		params = {
			handcamcloseup
			lockto = drummer
			pos = (1.528101, 1.3878909, 1.5932021)
			quat = (0.027365997, -0.91494495, -0.022584999)
			fov = 51.0
			lookat = drummer
			lookatbone = bone_head
			screenoffset = (0.294515, -0.38926402)
			distfromlookat = 1.553067
		}
		dof = $dof_closeup01_tod_manager
	}
	{
		name = drummer_node_alt_stage
		type = drummer_stage
		controlscript = cameracuts_handcam
		params = {
			lockto = drummer
			pos = (1.2863082, 1.6418641, -1.663195)
			quat = (0.087973, -0.223525, -0.013621)
			fov = 40.0
			lookat = drummer
			lookatbone = bone_head
			screenoffset = (0.297159, -0.34113)
			distfromlookat = 2.594049
		}
		dof = $dof_moment1_1_tod_manager
	}
	{
		name = s_across_stage_alt
		type = s_across_stage
		controlscript = cameracuts_handcam
		params = {
			lockto = vocalist
			pos = (5.7699013, 1.177866, -0.22495198)
			quat = (0.032962997, -0.689329, 0.021283)
			fov = 37.0
			lookat = vocalist
			lookatbone = bone_head
			screenoffset = (0.096578, -0.447606)
			distfromlookat = 5.6147313
		}
		dof = $dof_moment1_1_tod_manager
	}
	{
		name = g_across_stage_alt
		type = g_across_stage
		controlscript = cameracuts_handcam
		params = {
			lockto = guitarist
			pos = (-8.795936, 1.184793, 2.111708)
			quat = (0.0066980002, 0.781129, -0.020125998)
			fov = 17.0
			lookat = guitarist
			lookatbone = bone_head
			screenoffset = (-0.13279, -0.505753)
			distfromlookat = 9.247294
		}
		dof = $dof_moment1_1_tod_manager
	}
	{
		name = drummer_vert_dolly_alt
		type = drummer_vert
		controlscript = cameracuts_handcam
		params = {
			lockto = drummer
			pos = (1.507228, 1.7252821, -2.1122582)
			quat = (0.080031, -0.294578, -0.021869)
			fov = 33.0
			lookat = drummer
			lookatbone = bone_head
			screenoffset = (0.402709, -0.470863)
			distfromlookat = 2.514244
		}
		dof = $dof_moment1_1_tod_manager
	}
]
default_cameras_debug_face = [
	{
		name = debug_face_vocal
		type = debug
		lockto = vocalist
		locktobone = bone_head
		pos = (0.038502, 0.280578, -0.008172)
		quat = (0.483587, 0.490287, -0.51393396)
		fov = 93.0
	}
	{
		name = debug_face_guitar
		type = debug
		lockto = guitarist
		locktobone = bone_head
		pos = (0.038502, 0.280578, -0.008172)
		quat = (0.483587, 0.490287, -0.51393396)
		fov = 93.0
	}
	{
		name = debug_face_bass
		type = debug
		lockto = bassist
		locktobone = bone_head
		pos = (0.038502, 0.280578, -0.008172)
		quat = (0.483587, 0.490287, -0.51393396)
		fov = 93.0
	}
	{
		name = debug_face_drum
		type = debug
		lockto = drummer
		locktobone = bone_head
		pos = (0.038502, 0.280578, -0.008172)
		quat = (0.483587, 0.490287, -0.51393396)
		fov = 93.0
	}
]
default_cameras_debug_drum = [
	{
		name = debug_drum01
		type = debug
		lockto = drummer
		pos = (2.1161907, 2.0488508, -0.7431111)
		quat = (0.20130901, -0.620695, 0.168902)
		fov = 68.0
	}
]
default_cameras_debug_guitar = [
	{
		name = debug_guitar01
		type = debug
		lockto = guitarist
		locktoworldorientation
		pos = (0.32338, 1.014272, 1.5703422)
		quat = (0.073696, 0.9962689, 0.003822)
		fov = 72.0
		lookat = guitarist
		lookatbone = bone_chest
		screenoffset = (0.015315, -0.360708)
		distfromlookat = 1.819742
	}
]
default_cameras_debug_bass = [
	{
		name = debug_bass01
		type = debug
		lockto = bassist
		locktoworldorientation
		pos = (-0.525171, 1.20463, 1.6167321)
		quat = (-0.000577, 0.9669069, -0.0029010002)
		fov = 72.0
		lookat = bassist
		lookatbone = bone_chest
	}
]
default_cameras_debug_ntlightshow = [
	{
		name = debug_ntlightshow01
		type = debug
		lockto = world
		pos = (0.554229, 3.4842181, 21.230099)
		quat = (-0.001134, 0.99959993, -0.027632)
		fov = 72.0
	}
]
default_cameras_no_flyby = [
	{
		name = no_flyby
		lockto = world
		pos = (-1.258026, 1.698497, 5.022158)
		quat = (0.122888, -0.063029, 0.016529998)
		fov = 85.0
	}
]
