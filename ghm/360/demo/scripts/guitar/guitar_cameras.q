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
		}
	}
	{
		midinote = 4
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_moments'
			changenow
			name = moment02
		}
	}
	{
		midinote = 5
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_moments'
			changenow
			name = moment03
		}
	}
	{
		midinote = 6
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_moments'
			changenow
			name = moment04
		}
	}
	{
		midinote = 8
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_guitarist'
			changenow
			type = guitarist_closeup
		}
	}
	{
		midinote = 9
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_guitarist'
			changenow
			name = guitarist_stage
		}
	}
	{
		midinote = 10
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_guitarist'
			changenow
			name = guitarist_mocap01
		}
	}
	{
		midinote = 11
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_guitarist'
			changenow
			name = guitarist_mocap02
		}
	}
	{
		midinote = 13
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_singer'
			changenow
			type = singer_closeup
		}
	}
	{
		midinote = 14
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_singer'
			changenow
			name = singer_stage
		}
	}
	{
		midinote = 15
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_singer'
			changenow
			name = singer_mocap01
		}
	}
	{
		midinote = 16
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_singer'
			changenow
			name = singer_mocap02
		}
	}
	{
		midinote = 18
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_bassist'
			changenow
			name = bassist_closeup
		}
	}
	{
		midinote = 19
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_bassist'
			changenow
			name = bassist_stage
		}
	}
	{
		midinote = 20
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_bassist'
			changenow
			name = bassist_mocap01
		}
	}
	{
		midinote = 21
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_bassist'
			changenow
			name = bassist_mocap02
		}
	}
	{
		midinote = 23
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_drummer'
			changenow
			type = drummer_closeup
		}
	}
	{
		midinote = 24
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_drummer'
			changenow
			name = drummer_stage
		}
	}
	{
		midinote = 25
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_drummer'
			changenow
			name = drummer_mocap01
		}
	}
	{
		midinote = 26
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_drummer'
			changenow
			name = drummer_mocap02
		}
	}
	{
		midinote = 28
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras'
			changenow
			type = longshot
		}
	}
	{
		midinote = 29
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras'
			changenow
			type = midshot
		}
	}
	{
		midinote = 30
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras'
			changenow
			type = venue_midshot
		}
	}
	{
		midinote = 31
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras'
			changenow
			type = generic_stage_shot
		}
	}
	{
		midinote = 33
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_solo'
			changenow
			type = solo_guitar
		}
	}
	{
		midinote = 34
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_solo'
			changenow
			type = solo_vocal
		}
	}
	{
		midinote = 35
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_solo'
			changenow
			type = solo_drum
		}
	}
	{
		midinote = 36
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_solo'
			changenow
			name = solo_bass
		}
	}
	{
		midinote = 38
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_single'
			changenow
			type = single
		}
	}
	{
		midinote = 40
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_special'
			changenow
			name = special01
		}
	}
	{
		midinote = 41
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_special'
			changenow
			name = special02
		}
	}
	{
		midinote = 43
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_audience'
			changenow
			type = audience
		}
	}
	{
		midinote = 45
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_zoom'
			changenow
			type = zoom_in
		}
	}
	{
		midinote = 46
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_zoom'
			changenow
			type = zoom_out
		}
	}
	{
		midinote = 48
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_spotlight'
			changenow
			name = spotlight
		}
	}
	{
		midinote = 50
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_Side_A'
			changenow
			name = singer_cu
		}
	}
	{
		midinote = 51
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_Side_A'
			changenow
			name = guitarist_cu
		}
	}
	{
		midinote = 52
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_Side_A'
			changenow
			name = bassist_cu
		}
	}
	{
		midinote = 53
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_Side_A'
			changenow
			name = mid
		}
	}
	{
		midinote = 54
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_Side_A'
			changenow
			name = audience
		}
	}
	{
		midinote = 56
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_Side_B'
			changenow
			name = singer_cu
		}
	}
	{
		midinote = 57
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_Side_B'
			changenow
			name = guitarist_cu
		}
	}
	{
		midinote = 58
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_Side_B'
			changenow
			name = bassist_cu
		}
	}
	{
		midinote = 59
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_Side_B'
			changenow
			name = mid
		}
	}
	{
		midinote = 60
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_Side_B'
			changenow
			name = audience
		}
	}
	{
		midinote = 62
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_Side_C'
			changenow
			name = singer_cu
		}
	}
	{
		midinote = 63
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_Side_C'
			changenow
			name = guitarist_cu
		}
	}
	{
		midinote = 64
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_Side_C'
			changenow
			name = bassist_cu
		}
	}
	{
		midinote = 65
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_Side_C'
			changenow
			name = mid
		}
	}
	{
		midinote = 66
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_Side_C'
			changenow
			name = audience
		}
	}
	{
		midinote = 68
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_Side_D'
			changenow
			name = singer_cu
		}
	}
	{
		midinote = 69
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_Side_D'
			changenow
			name = guitarist_cu
		}
	}
	{
		midinote = 70
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_Side_D'
			changenow
			name = bassist_cu
		}
	}
	{
		midinote = 71
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_Side_D'
			changenow
			name = mid
		}
	}
	{
		midinote = 72
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_Side_D'
			changenow
			name = audience
		}
	}
	{
		midinote = 74
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_Orbits'
			changenow
			type = orbit_low
		}
	}
	{
		midinote = 75
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_Orbits'
			changenow
			type = orbit_high
		}
	}
	{
		midinote = 81
		scr = cameracuts_setnextscreenfx
		params = {
			effect = bw_streaks
		}
	}
	{
		midinote = 82
		scr = cameracuts_setnextscreenfx
		params = {
			effect = bw_grainy2
		}
	}
	{
		midinote = 83
		scr = cameracuts_setnextscreenfx
		params = {
			effect = bw_grungy
		}
	}
	{
		midinote = 84
		scr = cameracuts_setnextscreenfx
		params = {
			effect = contrastyvignette
		}
	}
	{
		midinote = 85
		scr = cameracuts_setnextscreenfx
		params = {
			effect = desatsplots_01
		}
	}
	{
		midinote = 86
		scr = cameracuts_setnextscreenfx
		params = {
			effect = bw_splots
		}
	}
	{
		midinote = 87
		scr = cameracuts_setnextscreenfx
		params = {
			effect = warmstreaks
		}
	}
	{
		midinote = 88
		scr = cameracuts_setnextscreenfx
		params = {
			effect = coolstreaks
		}
	}
	{
		midinote = 90
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_moments'
			changenow
			name = moment01
		}
	}
	{
		midinote = 91
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_moments'
			changenow
			name = moment02
		}
	}
	{
		midinote = 92
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_moments'
			changenow
			name = moment03
		}
	}
	{
		midinote = 93
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_moments'
			changenow
			name = moment04
		}
	}
	{
		midinote = 94
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_moments'
			changenow
			name = moment05
		}
	}
	{
		midinote = 95
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_moments'
			changenow
			name = moment06
		}
	}
	{
		midinote = 96
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_moments'
			changenow
			name = moment07
		}
	}
	{
		midinote = 97
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_moments'
			changenow
			name = moment08
		}
	}
	{
		midinote = 98
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_moments'
			changenow
			name = moment09
		}
	}
	{
		midinote = 99
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_moments'
			changenow
			name = moment10
		}
	}
	{
		midinote = 101
		scr = camerablur_fastzoom_inandout
		scrid = cameracuts_scriptstokilloncut
		params = {
		}
	}
	{
		midinote = 102
		scr = camerablur_slowzoom_inandout
		scrid = cameracuts_scriptstokilloncut
		params = {
		}
	}
	{
		midinote = 103
		scr = camerablur_focusin
		scrid = cameracuts_scriptstokilloncut
		params = {
		}
	}
	{
		midinote = 104
		scr = camerablur_focusout
		scrid = cameracuts_scriptstokilloncut
		params = {
		}
	}
	{
		midinote = 106
		scr = cameracuts_setpendingwhiteflash
		params = {
		}
	}
	{
		midinote = 107
		scr = camerafx_blackfadein
		scrid = cameracuts_scriptstokilloncut
		params = {
		}
	}
	{
		midinote = 108
		scr = camerafx_blackfadeout
		scrid = cameracuts_scriptstokilloncut
		params = {
		}
	}
	{
		midinote = 110
		scr = cameracuts_setnextscreenfx
		params = {
			effect = `default`
		}
	}
	{
		midinote = 111
		scr = cameracuts_setnextscreenfx
		params = {
			effect = bw_contrast
		}
	}
	{
		midinote = 112
		scr = cameracuts_setnextscreenfx
		params = {
			effect = bw_grainy
		}
	}
	{
		midinote = 113
		scr = cameracuts_setnextscreenfx
		params = {
			effect = vignette
		}
	}
	{
		midinote = 114
		scr = cameracuts_setnextscreenfx
		params = {
			effect = coolblue
		}
	}
	{
		midinote = 115
		scr = cameracuts_setnextscreenfx
		params = {
			effect = hotblue
		}
	}
	{
		midinote = 116
		scr = cameracuts_setnextscreenfx
		params = {
			effect = sepia
		}
	}
	{
		midinote = 117
		scr = cameracuts_setnextscreenfx
		params = {
			effect = yellow
		}
	}
	{
		midinote = 118
		scr = cameracuts_setnextscreenfx
		params = {
			effect = green
		}
	}
	{
		midinote = 119
		scr = cameracuts_setnextscreenfx
		params = {
			effect = forest
		}
	}
	{
		midinote = 120
		scr = cameracuts_setnextscreenfx
		params = {
			effect = desatred
		}
	}
	{
		midinote = 121
		scr = cameracuts_setnextscreenfx
		params = {
			effect = inkblotch_red
		}
	}
	{
		midinote = 122
		scr = cameracuts_setnextscreenfx
		params = {
			effect = inkblotch_turqpink
		}
	}
	{
		midinote = 123
		scr = cameracuts_setnextscreenfx
		params = {
			effect = bloomsat
		}
	}
	{
		midinote = 124
		scr = cameracuts_setnextscreenfx
		params = {
			effect = inkblotch2
		}
	}
	{
		midinote = 125
		scr = cameracuts_noleafcloverhack
		params = {
		}
	}
	{
		midinote = 126
		scr = cameracuts_setnextscreenfx
		params = {
			effect = noisy
		}
	}
	{
		midinote = 127
		scr = cameracuts_setnextscreenfx
		params = {
			effect = inkblotch3
		}
	}
]
last_camera_array_entry = 0

script cameracuts_iterator 
	printf qs(0x3e5ffa5b) d = <time_offset>
	change \{cameracuts_nextnotecameratime = -1}
	setupinitialsonghandcamparams <...>
	setnotemappings \{section = cameras
		mapping = $cameracuts_notemapping}
	get_song_prefix song = <song_name>
	formattext checksumname = event_array '%s_cameras_notes' s = <song_prefix> addtostringlookup
	if NOT globalexists name = <event_array> type = array
		return
	endif
	array_entry = 0
	fretbar_count = 0
	getarraysize $<event_array>
	array_size = (<array_size> / 2)
	sync_cameras_to_performance song_name = <song_name> camera_array = <event_array>
	change \{last_camera_array_entry = 0}
	getsongtimems time_offset = <time_offset>
	if NOT (<array_size> = 0)
		begin
		if ((<time> - <skipleadin>) < $<event_array> [<array_entry>])
			break
		endif
		<array_entry> = (<array_entry> + 2)
		repeat <array_size>
		array_size = (<array_size> - (<array_entry> / 2))
		change last_camera_array_entry = <array_entry>
		if NOT (<array_size> = 0)
			begin
			change cameracuts_nextnotecameratime = ($<event_array> [<array_entry>] - <time_offset>)
			timemarkerreached_setparams time_offset = <time_offset> array = <event_array> array_entry = <array_entry>
			begin
			if timemarkerreached
				getsongtimems time_offset = <time_offset>
				break
			endif
			wait \{1
				gameframe}
			repeat
			timemarkerreached_clearparams
			decompressnotevalue note_value = ($<event_array> [(<array_entry> + 1)])
			if ($cameracuts_allownotescripts = true)
				if getnotemapping section = cameras note = <note>
					spawnscriptnow (<note_data>.scr) params = {(<note_data>.params) length = <length>} id = cameracuts_scripts id = (<note_data>.scrid)
				endif
			endif
			change last_camera_array_entry = <array_entry>
			<array_entry> = (<array_entry> + 2)
			repeat <array_size>
		endif
	endif
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
		index = 0
		getarraysize $<event_array>
		if (<array_size> > 0)
			begin
			if ($<event_array> [<index>].time < 100)
				if ($<event_array> [<index>].scr = setsonghandcamparams)
					setsonghandcamparams ($<event_array> [<index>].params)
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

script cameracuts_playvenuecam \{length = 1}
	level = ($current_level)
	appendsuffixtochecksum base = (($levelzones.<level>).zone) suffixstring = '_venue_cam_anim'
	if NOT globalexists name = <appended_id> type = checksum
		printf \{'No venue cam specified for %c. Using default.'
			c = $current_level}
		camera_anim = camerapush_sing_camera
	else
		printf 'Playing venue cam anim %c' c = <appended_id>
		camera_anim = <appended_id>
	endif
	momentcamera_playanim {lock_target = venue_cam_lock_target anim = ($<camera_anim>) blendduration = 0.0 start_node = '_TRG_Waypoint_Vocalist_Start'}
	cameracuts_setarrayprefix {prefix = 'cameras_venue' changenow name = venuecam type = <type> length = <length>}
endscript

script cameracuts_setarrayprefix \{prefix = 'cameras'
		type = none
		name = none
		length = 0}
	if NOT ($debug_camera_array = none)
		return
	endif
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
		cameracuts_enablechangecam \{enable = true}
	endif
endscript

script set_defaultcameracut_perf \{perf = 'good'
		perf_checksum = good}
	getpakmancurrentname \{map = zones}
	if ($current_num_players = 2)
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
		change \{cameracuts_init = true}
	endif
	kill_dummy_bg_camera
	reset_cameracuts_internal_vars
	cameracuts_startcallback
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
	if ($game_mode = training || $game_mode = tutorial || $game_mode = practice)
		change \{cameracuts_changecamenable = false}
		change \{cameracuts_allownotescripts = false}
	elseif ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || $game_mode = p2_battle || $boss_battle = 1)
		change \{cameracuts_changecamenable = true}
		change \{cameracuts_allownotescripts = false}
	elseif ($current_song = jamsession)
		change \{cameracuts_changecamenable = true}
		change \{cameracuts_allownotescripts = false}
	else
		change \{cameracuts_changecamenable = true}
		change \{cameracuts_allownotescripts = true}
	endif
	change \{cameracuts_enabled = true}
	change \{next_screenfx = none}
	change \{current_screenfx = none}
	change \{cameracuts_pendingwhiteflash = false}
endscript

script cameracuts_getnextdownbeat 
	get_song_prefix song = ($current_song)
	formattext checksumname = event_array '%s_lightshow_notes' s = <song_prefix> addtostringlookup
	if NOT globalexists name = <event_array> type = array
		return false endtime = <endtime>
	endif
	getarraysize $<event_array>
	array_count = ($cameracuts_lastdownbeatindex)
	array_size = (<array_size> - <array_count>)
	array_size = (<array_size> / 2)
	if (<array_size> > 0)
		begin
		decompressnotevalue note_value = ($<event_array> [(<array_count> + 1)])
		if (<note> = 58 || <note> = 57)
			if ($<event_array> [<array_count>] > <endtime>)
				change cameracuts_lastdownbeatindex = <array_count>
				return true endtime = ($<event_array> [<array_count>])
			endif
		endif
		array_count = (<array_count> + 2)
		repeat <array_size>
	endif
	printf \{qs(0x29017cad)}
	return false endtime = <endtime>
endscript

script cameracuts_startcallback 
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
	if compositeobjectexists \{name = guitarist}
		guitarist :get_target_node
	endif
	if NOT ($cameracuts_nextname = none)
		cameracut_getarraysize camera_array = <camera_array> name = ($cameracuts_nextname) target_node = <target_node>
	elseif NOT ($cameracuts_forcetype = none)
		cameracut_getarraysize camera_array = <camera_array> includetype = $cameracuts_forcetype target_node = <target_node>
	elseif ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || $game_mode = p2_battle || $boss_battle = 1)
		cameracut_getarraysize camera_array = <camera_array> excludename = $cameracuts_lastname target_node = <target_node>
	elseif ($current_song = jamsession)
		cameracut_getarraysize camera_array = <camera_array> excludename = $cameracuts_lastname target_node = <target_node>
	else
		cameracut_getarraysize camera_array = <camera_array> excludetype = $cameracuts_lasttype target_node = <target_node>
	endif
	if (<array_size> = 0)
		newindex = 0
	else
		getrandomvalue name = newindex integer a = 0 b = (<array_size> - 1)
		cameracut_getcameraindex camera_array = <camera_array> newindex = <newindex>
	endif
	debug_flags = none
	if NOT ($debug_camera_array = none)
		select_cameracut_video_end
		found = 0
		formattext \{checksumname = new_camera_array
			'%s_%p'
			s = $debug_camera_array_pakname
			p = $debug_camera_array}
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
	if ($debug_showcameraname = on)
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
		else
			printstruct <...>
			scriptassert \{qs(0x96b79fce)}
		endif
	else
		dofparam = ($dof_off_tod_manager.screen_fx [0])
	endif
	spawnscriptnow applydeferredcameraeffects params = {dofparam = <dofparam>}
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
	change \{structurename = guitarist_info
		waiting_for_cameracut = false}
	change \{structurename = bassist_info
		waiting_for_cameracut = false}
	bandmanager_notifyallofcameracut
	getsongtimems
	change cameracuts_lastcamerastarttime = <time>
	if ($display_clip_info = true)
		clip_get_time_and_frame
		printf channel = clip qs(0xbb73757a) a = <time_string>
	endif
	camparams = ($<camera_array> [<newindex>])
	cameracut_swaplookats
	if structurecontains structure = <camstruct> name
		camera_name = (<camstruct>.name)
	else
		camera_name = $cameracuts_nextname
	endif
	prepare_mocap_lock_target camera = <camera_name>
	playigccam {
		time = <camera_time>
		viewport = bg_viewport
		controlscript = cameracuts_staticcamcontrol
		params = {camparams = <camparams>}
		far_clip = 500.0
		<camparams>
		exitscript = cameracuts_startcallback
		play_hold = 0
		name = cameracutcam
		<debug_flags>
	}
endscript

script prepare_mocap_lock_target 
	switch <camera>
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

script applydeferredcameraeffects 
	wait \{1
		gameframe}
	killspawnedscript \{id = cameracuts_scriptstokilloncut}
	if ($game_mode = training || $game_mode = tutorial || $game_mode = practice)
		return
	endif
	applyscreenfx effect = ($next_screenfx)
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
	if ($cameracuts_pendingwhiteflash = true)
		change \{cameracuts_pendingwhiteflash = false}
		spawnscriptnow \{camerafx_whiteflash}
	endif
endscript
next_screenfx = none
current_screenfx = none
cameracuts_pendingwhiteflash = false

script cameracuts_setnextscreenfx 
	change next_screenfx = <effect>
endscript

script cameracuts_setpendingwhiteflash 
	change \{cameracuts_pendingwhiteflash = true}
endscript

script applyscreenfx 
	if NOT (<effect> = $current_screenfx)
		switch <effect>
			case bw_contrast
			tod_proxim_apply_bw_contrast
			case bw_grainy
			tod_proxim_apply_bw_grainy
			case vignette
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
		change current_screenfx = <effect>
	else
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
			z_priority = 100.0
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
			z_priority = 100.0
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

script destroy_cameracuts 
	change \{cameracuts_init = false}
	change \{cameracuts_enabled = false}
	killspawnedscript \{name = cameracuts_startcallback}
	killspawnedscript \{name = applydeferredcameraeffects}
	killcamanim \{name = cameracutcam}
	kill_dummy_bg_camera
	clearnotemappings \{section = cameras}
	killspawnedscript \{name = cameracuts_iterator}
	killspawnedscript \{id = cameracuts_scripts}
	killspawnedscript \{id = cameracuts_scriptstokilloncut}
endscript
profiling_cameracuts = false

script profile_camera_cuts \{filename = qs(0xd8a6b977)}
	if ($profiling_cameracuts = true)
		return
	endif
	change \{profiling_cameracuts = true}
	hide_analog_options
	setslomo \{0.001}
	setslomo_song \{slomo = 0.001}
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
	setslomo_song \{slomo = $current_speedfactor}
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

script cameracuts_waitscript \{camera_time = 0
		camera_songtime = 0}
	if gotparam \{force_time}
		wait <force_time> seconds
		return \{true}
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
	printf qs(0xe5154443) i = <timestep>
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
		name = guitarist_closeup
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
		lockto = guitarist_mocap_lock_target_01
		locktobone = bone_camera
		pos = (0.0, 0.0, 0.0)
		quat = (0.0, 0.0, 0.0)
		fov = 72.0
	}
	{
		name = guitarist_mocap02
		lockto = guitarist_mocap_lock_target_02
		locktobone = bone_camera
		pos = (0.0, 0.0, 0.0)
		quat = (0.0, 0.0, 0.0)
		fov = 72.0
	}
]
default_cameras_singer = [
	{
		name = singer_closeup
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
		lockto = vocalist_mocap_lock_target_01
		locktobone = bone_camera
		pos = (0.0, 0.0, 0.0)
		quat = (0.0, 0.0, 0.0)
		fov = 72.0
	}
	{
		name = singer_mocap02
		lockto = vocalist_mocap_lock_target_02
		locktobone = bone_camera
		pos = (0.0, 0.0, 0.0)
		quat = (0.0, 0.0, 0.0)
		fov = 72.0
	}
]
default_cameras_bassist = [
	{
		name = bassist_closeup
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
		lockto = bassist_mocap_lock_target_01
		locktobone = bone_camera
		pos = (0.0, 0.0, 0.0)
		quat = (0.0, 0.0, 0.0)
		fov = 72.0
	}
	{
		name = bassist_mocap02
		lockto = bassist_mocap_lock_target_02
		locktobone = bone_camera
		pos = (0.0, 0.0, 0.0)
		quat = (0.0, 0.0, 0.0)
		fov = 72.0
	}
]
default_cameras_drummer = [
	{
		name = drummer_closeup
		lockto = world
		pos = (-6.321385, 0.924312, -2.6622968)
		quat = (-0.026229998, 0.784364, 0.032947995)
		fov = 72.0
	}
	{
		name = drummer_stage
		lockto = world
		pos = (-6.321385, 0.924312, -2.6622968)
		quat = (-0.026229998, 0.784364, 0.032947995)
		fov = 72.0
	}
	{
		name = drummer_mocap01
		lockto = drummer_mocap_lock_target_01
		locktobone = bone_camera
		pos = (0.0, 0.0, 0.0)
		quat = (0.0, 0.0, 0.0)
		fov = 72.0
	}
	{
		name = drummer_mocap02
		lockto = drummer_mocap_lock_target_02
		locktobone = bone_camera
		pos = (0.0, 0.0, 0.0)
		quat = (0.0, 0.0, 0.0)
		fov = 72.0
	}
]
default_cameras_venue = [
	{
		name = venuecam
		lockto = venue_cam_lock_target
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
			pos = (2.984848, 2.319129, 8.964585)
			quat = (0.013296999, -0.9863979, 0.09915701)
			fov = 72.0
		}
	}
	{
		name = jammode_midshot
		controlscript = cameracuts_handcam
		params = {
			lockto = world
			pos = (2.286206, 1.399632, -0.8574021)
			quat = (0.013289999, -0.97393197, 0.058316004)
			fov = 72.0
		}
	}
	{
		name = jammode_venue_midshot
		controlscript = cameracuts_handcam
		params = {
			lockto = world
			pos = (0.48657104, 1.8374078, 4.633928)
			quat = (0.00057300006, -0.99960995, 0.019561999)
			fov = 72.0
		}
	}
	{
		name = jammode_stage_shot
		controlscript = cameracuts_handcam
		params = {
			lockto = world
			pos = (3.347051, 2.0671618, -7.5946074)
			quat = (0.12163001, -0.398576, 0.053206)
			fov = 72.0
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
default_cameras_preboss = [
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
default_cameras_boss = [
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
default_cameras_boss_closeup_2p = [
	{
		controlscript = cameracuts_handcam
		params = {
			name = boss_closeup
			lockto = world
			pos = (-6.321385, 0.924312, -2.6622968)
			quat = (-0.026229998, 0.784364, 0.032947995)
			fov = 72.0
		}
		dof = $dof_closeup01_tod_manager
	}
]
default_cameras_player_closeup_2p = [
	{
		controlscript = cameracuts_handcam
		params = {
			name = player_closeup
			lockto = world
			pos = (-6.321385, 0.924312, -2.6622968)
			quat = (-0.026229998, 0.784364, 0.032947995)
			fov = 72.0
		}
		dof = $dof_closeup01_tod_manager
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

script cameracuts_noleafcloverhack 
	if ($current_song = noleafclover)
		if (($current_level = load_z_soundcheck2)
				|| ($current_level = load_z_studio2))
			cameracuts_setarrayprefix prefix = 'cameras' changenow type = venue_midshot length = <length>
			return
		endif
	endif
	cameracuts_setarrayprefix prefix = 'cameras_moments' changenow name = moment02 length = <length>
endscript
