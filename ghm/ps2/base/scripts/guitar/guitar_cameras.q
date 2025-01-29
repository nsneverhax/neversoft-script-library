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
			Name = singer_stage
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
			Type = solo_vocal
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
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_Side_A'
			changenow
			Name = singer_cu
		}
	}
	{
		MidiNote = 51
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_Side_A'
			changenow
			Name = guitarist_cu
		}
	}
	{
		MidiNote = 52
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_Side_A'
			changenow
			Name = bassist_cu
		}
	}
	{
		MidiNote = 53
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_Side_A'
			changenow
			Name = Mid
		}
	}
	{
		MidiNote = 54
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_Side_A'
			changenow
			Name = audience
		}
	}
	{
		MidiNote = 56
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_Side_B'
			changenow
			Name = singer_cu
		}
	}
	{
		MidiNote = 57
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_Side_B'
			changenow
			Name = guitarist_cu
		}
	}
	{
		MidiNote = 58
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_Side_B'
			changenow
			Name = bassist_cu
		}
	}
	{
		MidiNote = 59
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_Side_B'
			changenow
			Name = Mid
		}
	}
	{
		MidiNote = 60
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_Side_B'
			changenow
			Name = audience
		}
	}
	{
		MidiNote = 62
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_Side_C'
			changenow
			Name = singer_cu
		}
	}
	{
		MidiNote = 63
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_Side_C'
			changenow
			Name = guitarist_cu
		}
	}
	{
		MidiNote = 64
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_Side_C'
			changenow
			Name = bassist_cu
		}
	}
	{
		MidiNote = 65
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_Side_C'
			changenow
			Name = Mid
		}
	}
	{
		MidiNote = 66
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_Side_C'
			changenow
			Name = audience
		}
	}
	{
		MidiNote = 68
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_Side_D'
			changenow
			Name = singer_cu
		}
	}
	{
		MidiNote = 69
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_Side_D'
			changenow
			Name = guitarist_cu
		}
	}
	{
		MidiNote = 70
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_Side_D'
			changenow
			Name = bassist_cu
		}
	}
	{
		MidiNote = 71
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_Side_D'
			changenow
			Name = Mid
		}
	}
	{
		MidiNote = 72
		Scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_Side_D'
			changenow
			Name = audience
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
		MidiNote = 81
		Scr = cameracuts_setnextscreenfx
		params = {
			effect = bw_streaks
		}
	}
	{
		MidiNote = 82
		Scr = cameracuts_setnextscreenfx
		params = {
			effect = bw_grainy2
		}
	}
	{
		MidiNote = 83
		Scr = cameracuts_setnextscreenfx
		params = {
			effect = bw_grungy
		}
	}
	{
		MidiNote = 84
		Scr = cameracuts_setnextscreenfx
		params = {
			effect = contrastyvignette
		}
	}
	{
		MidiNote = 85
		Scr = cameracuts_setnextscreenfx
		params = {
			effect = desatsplots_01
		}
	}
	{
		MidiNote = 86
		Scr = cameracuts_setnextscreenfx
		params = {
			effect = bw_splots
		}
	}
	{
		MidiNote = 87
		Scr = cameracuts_setnextscreenfx
		params = {
			effect = warmstreaks
		}
	}
	{
		MidiNote = 88
		Scr = cameracuts_setnextscreenfx
		params = {
			effect = coolstreaks
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
	{
		MidiNote = 101
		Scr = camerablur_fastzoom_inandout
		scrid = cameracuts_scriptstokilloncut
		params = {
		}
	}
	{
		MidiNote = 102
		Scr = camerablur_slowzoom_inandout
		scrid = cameracuts_scriptstokilloncut
		params = {
		}
	}
	{
		MidiNote = 103
		Scr = camerablur_focusin
		scrid = cameracuts_scriptstokilloncut
		params = {
		}
	}
	{
		MidiNote = 104
		Scr = camerablur_focusout
		scrid = cameracuts_scriptstokilloncut
		params = {
		}
	}
	{
		MidiNote = 106
		Scr = cameracuts_setpendingwhiteflash
		params = {
		}
	}
	{
		MidiNote = 107
		Scr = camerafx_blackfadein
		scrid = cameracuts_scriptstokilloncut
		params = {
		}
	}
	{
		MidiNote = 108
		Scr = camerafx_blackfadeout
		scrid = cameracuts_scriptstokilloncut
		params = {
		}
	}
	{
		MidiNote = 110
		Scr = cameracuts_setnextscreenfx
		params = {
			effect = Default
		}
	}
	{
		MidiNote = 111
		Scr = cameracuts_setnextscreenfx
		params = {
			effect = bw_contrast
		}
	}
	{
		MidiNote = 112
		Scr = cameracuts_setnextscreenfx
		params = {
			effect = bw_grainy
		}
	}
	{
		MidiNote = 113
		Scr = cameracuts_setnextscreenfx
		params = {
			effect = Vignette
		}
	}
	{
		MidiNote = 114
		Scr = cameracuts_setnextscreenfx
		params = {
			effect = coolblue
		}
	}
	{
		MidiNote = 115
		Scr = cameracuts_setnextscreenfx
		params = {
			effect = hotblue
		}
	}
	{
		MidiNote = 116
		Scr = cameracuts_setnextscreenfx
		params = {
			effect = sepia
		}
	}
	{
		MidiNote = 117
		Scr = cameracuts_setnextscreenfx
		params = {
			effect = yellow
		}
	}
	{
		MidiNote = 118
		Scr = cameracuts_setnextscreenfx
		params = {
			effect = green
		}
	}
	{
		MidiNote = 119
		Scr = cameracuts_setnextscreenfx
		params = {
			effect = forest
		}
	}
	{
		MidiNote = 120
		Scr = cameracuts_setnextscreenfx
		params = {
			effect = desatred
		}
	}
	{
		MidiNote = 121
		Scr = cameracuts_setnextscreenfx
		params = {
			effect = inkblotch_red
		}
	}
	{
		MidiNote = 122
		Scr = cameracuts_setnextscreenfx
		params = {
			effect = inkblotch_turqpink
		}
	}
	{
		MidiNote = 123
		Scr = cameracuts_setnextscreenfx
		params = {
			effect = bloomsat
		}
	}
	{
		MidiNote = 124
		Scr = cameracuts_setnextscreenfx
		params = {
			effect = inkblotch2
		}
	}
	{
		MidiNote = 125
		Scr = cameracuts_noleafcloverhack
		params = {
		}
	}
	{
		MidiNote = 126
		Scr = cameracuts_setnextscreenfx
		params = {
			effect = noisy
		}
	}
	{
		MidiNote = 127
		Scr = cameracuts_setnextscreenfx
		params = {
			effect = inkblotch3
		}
	}
]
last_camera_array_entry = 0

script cameracuts_iterator 

	Change \{CameraCuts_NextNoteCameraTime = -1}
	setupinitialsonghandcamparams <...>
	SetNoteMappings \{section = cameras
		mapping = $CameraCuts_NoteMapping}
	get_song_prefix song = <song_name>
	formatText checksumName = event_array '%s_cameras_notes' s = <song_prefix> AddToStringLookup
	if NOT GlobalExists Name = <event_array> Type = array
		return
	endif
	array_entry = 0
	fretbar_count = 0
	GetArraySize $<event_array>
	array_Size = (<array_Size> / 2)
	sync_cameras_to_performance song_name = <song_name> Camera_Array = <event_array>
	Change \{last_camera_array_entry = 0}
	GetSongTimeMs time_offset = <time_offset>
	if NOT (<array_Size> = 0)
		begin
		if ((<time> - <skipleadin>) < $<event_array> [<array_entry>])
			break
		endif
		<array_entry> = (<array_entry> + 2)
		repeat <array_Size>
		array_Size = (<array_Size> - (<array_entry> / 2))
		Change last_camera_array_entry = <array_entry>
		if NOT (<array_Size> = 0)
			begin
			Change CameraCuts_NextNoteCameraTime = ($<event_array> [<array_entry>] - <time_offset>)
			TimeMarkerReached_SetParams time_offset = <time_offset> array = <event_array> array_entry = <array_entry>
			begin
			if TimeMarkerReached
				GetSongTimeMs time_offset = <time_offset>
				break
			endif
			Wait \{1
				gameframe}
			repeat
			TimeMarkerReached_ClearParams
			decompressnotevalue note_value = ($<event_array> [(<array_entry> + 1)])
			if ($CameraCuts_AllowNoteScripts = true)
				if GetNoteMapping section = cameras note = <note>
					SpawnScriptNow (<note_data>.Scr) params = {(<note_data>.params) length = <length>} id = cameracuts_scripts id = (<note_data>.scrid)
				endif
			endif
			Change last_camera_array_entry = <array_entry>
			<array_entry> = (<array_entry> + 2)
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

script cameracuts_playvenuecam \{length = 1}
	level = ($current_level)
	AppendSuffixToChecksum Base = (($LevelZones.<level>).zone) SuffixString = '_venue_cam_anim'
	if NOT GlobalExists Name = <appended_id> Type = checksum

		camera_anim = camerapush_sing_camera
	else

		camera_anim = <appended_id>
	endif
	momentcamera_playanim {lock_target = venue_cam_lock_target anim = ($<camera_anim>) BlendDuration = 0.0 start_node = '_TRG_Waypoint_Vocalist_Start'}
	CameraCuts_SetArrayPrefix {prefix = 'cameras_venue' changenow Name = venuecam Type = <Type> length = <length>}
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
	if ($game_mode = training || $game_mode = tutorial || $game_mode = practice)
		Change \{CameraCuts_ChangeCamEnable = FALSE}
		Change \{CameraCuts_AllowNoteScripts = FALSE}
	elseif ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || $game_mode = p2_battle || $boss_battle = 1)
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
	elseif ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || $game_mode = p2_battle || $boss_battle = 1)
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
	if ($game_mode = training || $game_mode = tutorial || $game_mode = practice)
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

script applyscreenfx 
	if NOT (<effect> = $current_screenfx)
		switch <effect>
			case bw_contrast
			tod_proxim_apply_bw_contrast
			case bw_grainy
			tod_proxim_apply_bw_grainy
			case Vignette
			tod_proxim_apply_vignette
			case coolblue
			tod_proxim_apply_coolblue
			case hotblue
			tod_proxim_apply_hotblue
			case sepia
			tod_proxim_apply_sepia
			case yellow
			tod_proxim_apply_yellow
			case green
			tod_proxim_apply_green
			case forest
			tod_proxim_apply_forest
			case desatred
			tod_proxim_apply_desatred
			case inkblotch_red
			tod_proxim_apply_inkblotch_red
			case inkblotch_turqpink
			tod_proxim_apply_inkblotch_turqpink
			case bloomsat
			tod_proxim_apply_bloomsat
			case inkblotch2
			tod_proxim_apply_inkblotch2
			case noisy
			tod_proxim_apply_noisy
			case inkblotch3
			tod_proxim_apply_inkblotch3
			case warmstreaks
			tod_proxim_apply_warmstreaks
			case coolstreaks
			tod_proxim_apply_coolstreaks
			case bw_splots
			tod_proxim_apply_bw_splots
			case bw_streaks
			tod_proxim_apply_bw_streaks
			case desatsplots_01
			tod_proxim_apply_desatsplots_01
			case contrastyvignette
			tod_proxim_apply_contrastyvignette
			case bw_grungy
			tod_proxim_apply_bw_grungy
			case bw_grainy2
			tod_proxim_apply_bw_grainy2
			default
			tod_proxim_reapply_metallicafx
		endswitch
		Change current_screenfx = <effect>
	else
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
		Name = guitarist_closeup
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
		LockTo = guitarist_mocap_lock_target_01
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 72.0
	}
	{
		Name = guitarist_mocap02
		LockTo = guitarist_mocap_lock_target_02
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 72.0
	}
]
default_cameras_singer = [
	{
		Name = Singer_CloseUp
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
		LockTo = vocalist_mocap_lock_target_01
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 72.0
	}
	{
		Name = singer_mocap02
		LockTo = vocalist_mocap_lock_target_02
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 72.0
	}
]
default_cameras_bassist = [
	{
		Name = bassist_closeup
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
		LockTo = bassist_mocap_lock_target_01
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 72.0
	}
	{
		Name = bassist_mocap02
		LockTo = bassist_mocap_lock_target_02
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 72.0
	}
]
default_cameras_drummer = [
	{
		Name = drummer_closeup
		LockTo = World
		Pos = (-6.321385, 0.924312, -2.6622968)
		Quat = (-0.026229998, 0.784364, 0.032947995)
		FOV = 72.0
	}
	{
		Name = drummer_stage
		LockTo = World
		Pos = (-6.321385, 0.924312, -2.6622968)
		Quat = (-0.026229998, 0.784364, 0.032947995)
		FOV = 72.0
	}
	{
		Name = drummer_mocap01
		LockTo = drummer_mocap_lock_target_01
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 72.0
	}
	{
		Name = drummer_mocap02
		LockTo = drummer_mocap_lock_target_02
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 72.0
	}
]
default_cameras_venue = [
	{
		Name = venuecam
		LockTo = venue_cam_lock_target
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
			Pos = (2.984848, 2.319129, 8.964585)
			Quat = (0.013296999, -0.9863979, 0.09915701)
			FOV = 72.0
		}
	}
	{
		Name = jammode_midshot
		controlscript = CameraCuts_HandCam
		params = {
			LockTo = World
			Pos = (2.286206, 1.399632, -0.8574021)
			Quat = (0.013289999, -0.97393197, 0.058316004)
			FOV = 72.0
		}
	}
	{
		Name = jammode_venue_midshot
		controlscript = CameraCuts_HandCam
		params = {
			LockTo = World
			Pos = (0.48657104, 1.8374078, 4.633928)
			Quat = (0.00057300006, -0.99960995, 0.019561999)
			FOV = 72.0
		}
	}
	{
		Name = jammode_stage_shot
		controlscript = CameraCuts_HandCam
		params = {
			LockTo = World
			Pos = (3.347051, 2.0671618, -7.5946074)
			Quat = (0.12163001, -0.398576, 0.053206)
			FOV = 72.0
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
default_cameras_intro_lemmy = [
	{
		controlscript = default_camera_intro_lemmy
	}
]
default_cameras_intro_kingdiamond = [
	{
		controlscript = default_camera_intro_kingdiamond
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

script cameracuts_noleafcloverhack 
	if ($current_song = noleafclover)
		if (($current_level = load_z_soundcheck2)
				|| ($current_level = load_z_studio2))
			CameraCuts_SetArrayPrefix prefix = 'cameras' changenow Type = venue_midshot length = <length>
			return
		endif
	endif
	CameraCuts_SetArrayPrefix prefix = 'cameras_moments' changenow Name = moment02 length = <length>
endscript
