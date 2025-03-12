cameracuts_good_array = default_cameras_good
cameracuts_normal_array = default_cameras_normal
cameracuts_poor_array = default_cameras_poor
cameracuts_performance = good
cameracuts_lastarray = cameracuts_good_array
cameracuts_lastperformance = good
cameracuts_enabled = false
cameracuts_lastindex = 0
cameracuts_lasttype = none
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
			prefix = 'cameras_rhythm'
			changenow
			type = rhythm_vert_down
		}
	}
	{
		midinote = 4
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_rhythm'
			changenow
			type = rhythm_vert_up
		}
	}
	{
		midinote = 5
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_rhythm'
			changenow
			type = rhythm_orbit_ccw
		}
	}
	{
		midinote = 6
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_rhythm'
			changenow
			type = rhythm_orbit_cw
		}
	}
	{
		midinote = 7
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_rhythm'
			changenow
			type = rhythm_closeup
		}
	}
	{
		midinote = 8
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_rhythm'
			changenow
			type = rhythm_medium
		}
	}
	{
		midinote = 10
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_bassist'
			changenow
			type = bassist_vert_down
		}
	}
	{
		midinote = 11
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_bassist'
			changenow
			type = bassist_vert_up
		}
	}
	{
		midinote = 12
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_bassist'
			changenow
			type = bassist_orbit_ccw
		}
	}
	{
		midinote = 13
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_bassist'
			changenow
			type = bassist_orbit_cw
		}
	}
	{
		midinote = 14
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_bassist'
			changenow
			type = bassist_closeup
		}
	}
	{
		midinote = 15
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_bassist'
			changenow
			type = bassist_medium
		}
	}
	{
		midinote = 17
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_drummer'
			changenow
			type = drummer_vert_down
		}
	}
	{
		midinote = 18
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_drummer'
			changenow
			type = drummer_vert_up
		}
	}
	{
		midinote = 19
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_drummer'
			changenow
			type = drummer_orbit_ccw
		}
	}
	{
		midinote = 20
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_drummer'
			changenow
			type = drummer_orbit_cw
		}
	}
	{
		midinote = 21
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_drummer'
			changenow
			type = drummer_closeup
		}
	}
	{
		midinote = 22
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_drummer'
			changenow
			type = drummer_medium
		}
	}
	{
		midinote = 24
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_singer'
			changenow
			type = singer_vert_down
		}
	}
	{
		midinote = 25
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_singer'
			changenow
			type = singer_vert_up
		}
	}
	{
		midinote = 26
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_singer'
			changenow
			type = singer_orbit_ccw
		}
	}
	{
		midinote = 27
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_singer'
			changenow
			type = singer_orbit_cw
		}
	}
	{
		midinote = 28
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_singer'
			changenow
			type = singer_closeup
		}
	}
	{
		midinote = 29
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_singer'
			changenow
			type = singer_medium
		}
	}
	{
		midinote = 31
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_guitarist'
			changenow
			type = guitarist_vert_down
		}
	}
	{
		midinote = 32
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_guitarist'
			changenow
			type = guitarist_vert_up
		}
	}
	{
		midinote = 33
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_guitarist'
			changenow
			type = guitarist_orbit_ccw
		}
	}
	{
		midinote = 34
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_guitarist'
			changenow
			type = guitarist_orbit_cw
		}
	}
	{
		midinote = 35
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_guitarist'
			changenow
			type = guitarist_closeup
		}
	}
	{
		midinote = 36
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_guitarist'
			changenow
			type = guitarist_medium
		}
	}
	{
		midinote = 38
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_guitar'
			changenow
			type = guitar_closeup
		}
	}
	{
		midinote = 39
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_guitar'
			changenow
			type = guitar_solo_neck
		}
	}
	{
		midinote = 40
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_guitar'
			changenow
			type = guitar_solo_body
		}
	}
	{
		midinote = 42
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_stage'
			changenow
			type = stage_vert_down
		}
	}
	{
		midinote = 43
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_stage'
			changenow
			type = stage_vert_up
		}
	}
	{
		midinote = 44
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_stage'
			changenow
			type = stage_orbit_ccw
		}
	}
	{
		midinote = 45
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_stage'
			changenow
			type = stage_orbit_cw
		}
	}
	{
		midinote = 46
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_stage'
			changenow
			type = stage_low
		}
	}
	{
		midinote = 47
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_stage'
			changenow
			type = stage_high
		}
	}
	{
		midinote = 49
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_mid'
			changenow
			type = mid_vert_down
		}
	}
	{
		midinote = 50
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_mid'
			changenow
			type = mid_vert_up
		}
	}
	{
		midinote = 51
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_mid'
			changenow
			type = mid_orbit_ccw
		}
	}
	{
		midinote = 52
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_mid'
			changenow
			type = mid_orbit_cw
		}
	}
	{
		midinote = 53
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_mid'
			changenow
			type = mid_low
		}
	}
	{
		midinote = 54
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_mid'
			changenow
			type = mid_high
		}
	}
	{
		midinote = 56
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_longshot'
			changenow
			type = longshot_low
		}
	}
	{
		midinote = 57
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_longshot'
			changenow
			type = longshot_high
		}
	}
	{
		midinote = 59
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_zoom'
			changenow
			type = zoom_in_fast
		}
	}
	{
		midinote = 60
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_zoom'
			changenow
			type = zoom_in_slow
		}
	}
	{
		midinote = 61
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_zoom'
			changenow
			type = zoom_out_fast
		}
	}
	{
		midinote = 62
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_zoom'
			changenow
			type = zoom_out_slow
		}
	}
	{
		midinote = 64
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_pan'
			changenow
			type = pan_singer_guitarist
		}
	}
	{
		midinote = 65
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_pan'
			changenow
			type = pan_guitarist_singer
		}
	}
	{
		midinote = 67
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_dolly'
			changenow
			type = dolly_front_r
		}
	}
	{
		midinote = 68
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_dolly'
			changenow
			type = dolly_front_l
		}
	}
	{
		midinote = 69
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_dolly'
			changenow
			type = dolly_rear_r
		}
	}
	{
		midinote = 70
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_dolly'
			changenow
			type = dolly_rear_l
		}
	}
	{
		midinote = 72
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_special'
			changenow
			type = special_a
		}
	}
	{
		midinote = 73
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_special'
			changenow
			type = special_b
		}
	}
	{
		midinote = 74
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_special'
			changenow
			type = special_c
		}
	}
	{
		midinote = 75
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_special'
			changenow
			type = special_d
		}
	}
	{
		midinote = 77
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_mocap'
			changenow
			name = mocap01
		}
	}
	{
		midinote = 78
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_mocap'
			changenow
			name = mocap02
		}
	}
	{
		midinote = 79
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_mocap'
			changenow
			name = mocap03
		}
	}
	{
		midinote = 80
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_mocap'
			changenow
			name = mocap04
		}
	}
	{
		midinote = 82
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_audience'
			changenow
			type = audience
		}
	}
	{
		midinote = 84
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_boss_battle'
			changenow
			type = player_closeup
		}
	}
	{
		midinote = 85
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_boss_battle'
			changenow
			type = boss_closeup
		}
	}
	{
		midinote = 87
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_singer'
			changenow
			name = singer_closeup01
		}
	}
	{
		midinote = 88
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_singer'
			changenow
			name = singer_closeup02
		}
	}
	{
		midinote = 89
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_singer'
			changenow
			name = singer_closeup03
		}
	}
	{
		midinote = 91
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_stagediver'
			changenow
		}
	}
]

script cameracuts_iterator 
	printf "Cameras Iterator started with time %d" d = <time_offset>
	change \{cameracuts_nextnotecameratime = -1}
	get_song_prefix song = <song_name>
	formattext checksumname = event_array '%s_cameras_notes' s = <song_prefix> addtostringlookup
	if NOT globalexists name = <event_array> type = array
		return
	endif
	array_entry = 0
	fretbar_count = 0
	getarraysize $<event_array>
	getsongtimems time_offset = <time_offset>
	if NOT (<array_size> = 0)
		begin
		if ((<time> - <skipleadin>) < $<event_array> [<array_entry>] [0])
			break
		endif
		<array_entry> = (<array_entry> + 1)
		repeat <array_size>
		array_size = (<array_size> - <array_entry>)
		if NOT (<array_size> = 0)
			begin
			change cameracuts_nextnotecameratime = ($<event_array> [<array_entry>] [0] - <time_offset>)
			timemarkerreached_setparams time_offset = <time_offset> array = <event_array> array_entry = <array_entry> arrayofarrays
			begin
			if timemarkerreached
				getsongtimems time_offset = <time_offset>
				break
			endif
			wait \{1
				gameframe}
			repeat
			timemarkerreached_clearparams
			note = ($<event_array> [<array_entry>] [1])
			if ($cameracuts_allownotescripts = true)
				if getnotemapping section = cameras note = <note>
					spawnscriptnow (<note_data>.scr) params = {(<note_data>.params) length = ($<event_array> [<array_entry>] [2])}
				endif
			endif
			<array_entry> = (<array_entry> + 1)
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
		change cameracuts_good_array = <array>
	endif
	if (<type> = medium)
		change cameracuts_normal_array = <array>
	endif
	if (<type> = poor)
		change cameracuts_poor_array = <array>
	endif
endscript

script cameracuts_setparams \{performance = medium}
	change cameracuts_performance = <performance>
endscript

script cameracuts_setarrayprefix \{prefix = 'cameras'
		type = none
		name = none
		length = 0}
	if gotparam \{selectguitartype}
		if ($player1_status.instrument_id = instrument_guitar_demonik)
			type = demonik
		else
			type = normal
		endif
	endif
	change cameracuts_arrayprefix = <prefix>
	change cameracuts_forcetype = <type>
	change cameracuts_nextname = <name>
	set_defaultcameracuts
	change \{allow_4x_effect = true}
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

script set_defaultcameracut_perf_debug \{perf = 'good'
		perf_checksum = good}
	getpakmancurrentname \{map = zones}
	if ($current_num_players = 2)
		formattext checksumname = cameras_array '%s_%p_%c_2p' p = $cameracuts_arrayprefix c = <perf> s = <pakname>
		if globalexists name = <cameras_array> type = array
			formattext textname = cameras_array2 '%s_%p_%c_2p' p = $cameracuts_arrayprefix c = <perf> s = <pakname>
			printf "set_defaultcameracut_perf_debug %t %i" t = <perf_checksum> i = <cameras_array2>
			return
		endif
		formattext checksumname = cameras_array '%s_%p_2p' p = $cameracuts_arrayprefix s = <pakname>
		if globalexists name = <cameras_array> type = array
			formattext textname = cameras_array2 '%s_%p_2p' p = $cameracuts_arrayprefix s = <pakname>
			printf "set_defaultcameracut_perf_debug %t %i" t = <perf_checksum> i = <cameras_array2>
			return
		endif
	endif
	formattext checksumname = cameras_array '%s_%p_%c' p = $cameracuts_arrayprefix c = <perf> s = <pakname>
	if globalexists name = <cameras_array> type = array
		formattext checksumname = cameras_array2 '%s_%p_%c' p = $cameracuts_arrayprefix c = <perf> s = <pakname>
		printf "set_defaultcameracut_perf_debug %t %i" t = <perf_checksum> i = <cameras_array2>
		return
	endif
	formattext checksumname = cameras_array '%s_%p' p = $cameracuts_arrayprefix s = <pakname>
	if globalexists name = <cameras_array> type = array
		formattext textname = cameras_array2 '%s_%p' p = $cameracuts_arrayprefix s = <pakname>
		printf "set_defaultcameracut_perf_debug %t %i" t = <perf_checksum> i = <cameras_array2>
		return
	endif
	formattext checksumname = cameras_array '%s_%p_%c' p = $cameracuts_arrayprefix c = <perf> s = 'default'
	if globalexists name = <cameras_array> type = array
		formattext textname = cameras_array2 '%s_%p_%c' p = $cameracuts_arrayprefix c = <perf> s = 'default'
		printf "set_defaultcameracut_perf_debug %t %i" t = <perf_checksum> i = <cameras_array2>
		return
	endif
	formattext \{checksumname = cameras_array
		'%s_%p'
		p = $cameracuts_arrayprefix
		s = 'default'}
	if globalexists name = <cameras_array> type = array
		formattext \{textname = cameras_array2
			'%s_%p'
			p = $cameracuts_arrayprefix
			s = 'default'}
		printf "set_defaultcameracut_perf_debug %t %i" t = <perf_checksum> i = <cameras_array2>
		return
	endif
	printstruct <...> prefix = ($cameracuts_arrayprefix)
	scriptassert \{"CameraCut Array not found"}
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
	scriptassert \{"CameraCut Array not found"}
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
	change \{cameracuts_arrayprefix = 'cameras'}
	set_defaultcameracuts
	setnotemappings \{section = cameras
		mapping = $cameracuts_notemapping}
	kill_dummy_bg_camera
	change \{cameracuts_lasttype = none}
	change \{cameracuts_lastdownbeatindex = 0}
	change \{cameracuts_forcechangetime = 0.0}
	change \{cameracuts_forcetype = none}
	change \{cameracuts_nextname = none}
	if ($game_mode = training)
		change \{cameracuts_changecamenable = false}
		change \{cameracuts_allownotescripts = false}
	else
		change \{cameracuts_changecamenable = true}
		change \{cameracuts_allownotescripts = true}
	endif
	change \{cameracuts_enabled = true}
	cameracuts_startcallback
endscript

script cameracuts_getnextdownbeat 
	get_song_prefix song = ($current_song)
	formattext checksumname = event_array '%s_lightshow_notes' s = <song_prefix> addtostringlookup
	if NOT globalexists name = <event_array> type = array
		return endtime = <endtime>
	endif
	getarraysize $<event_array>
	array_count = ($cameracuts_lastdownbeatindex)
	array_size = (<array_size> - <array_count>)
	if (<array_size> > 0)
		begin
		if ($<event_array> [<array_count>] [1] = 58)
			if ($<event_array> [<array_count>] [0] > <endtime>)
				change cameracuts_lastdownbeatindex = <array_count>
				return endtime = ($<event_array> [<array_count>] [0])
			endif
		endif
		array_count = (<array_count> + 1)
		repeat <array_size>
	endif
	return endtime = <endtime>
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
	change cameracuts_lastarray = <camera_array>
	change \{cameracuts_lastperformance = $cameracuts_performance}
	change cameracuts_lastindex = <newindex>
	if structurecontains structure = (<camera_array> [<newindex>]) type
		change cameracuts_lasttype = ($<camera_array> [<newindex>].type)
	elseif structurecontains structure = (<camera_array> [<newindex>]) params
		if structurecontains structure = (<camera_array> [<newindex>].params) type
			change cameracuts_lasttype = ($<camera_array> [<newindex>].params.type)
		else
			change \{cameracuts_lasttype = none}
		endif
	else
		change \{cameracuts_lasttype = none}
	endif
	if ($debug_showcameraname = on)
		cameracuts_updatedebugcameraname
	endif
	if ($output_gpu_log = 1)
		cameracuts_outputgpulog
	endif
	if structurecontains structure = (<camera_array> [<newindex>]) params
		camstruct = ((<camera_array> [<newindex>]).params)
		if NOT structurecontains structure = <camstruct> dof
			camstruct = (<camera_array> [<newindex>])
		endif
	endif
	if structurecontains structure = <camstruct> dof
		if structurecontains structure = (<camstruct>.dof) screen_fx
			doftype = (<camstruct>.dof)
			dofparam = (<doftype>.screen_fx [0])
		endif
	else
		dofparam = ($dof_off_tod_manager.screen_fx [0])
	endif
	if NOT screenfx_fxinstanceexists \{viewport = bg_viewport
			name = venue_dof}
		screenfx_addfxinstance {
			viewport = bg_viewport
			name = venue_dof
			<dofparam>
		}
	else
		screenfx_updatefxinstanceparams {
			viewport = bg_viewport
			name = venue_dof
			<dofparam>
		}
	endif
	if structurecontains structure = (<camera_array> [<newindex>]) crowdoff
		enable_crowd_models_cfunc \{active = false}
	else
		enable_crowd_models_cfunc \{active = true}
	endif
	if structurecontains structure = (<camera_array> [<newindex>]) shadowcasters
		change cameracuts_shadowcasters = (<camera_array> [<newindex>].shadowcasters)
	else
		change \{cameracuts_shadowcasters = none}
	endif
	change \{structurename = guitarist_info
		waiting_for_cameracut = false}
	change \{structurename = bassist_info
		waiting_for_cameracut = false}
	getsongtimems
	change cameracuts_lastcamerastarttime = <time>
	camparams = (<camera_array> [<newindex>])
	cameracut_swaplookats
	playigccam {
		time = <camera_time>
		viewport = bg_viewport
		controlscript = cameracuts_staticcamcontrol
		params = {camparams = <camparams>}
		<camparams>
		exitscript = cameracuts_startcallback
		play_hold = 0
		name = cameracutcam
		<debug_flags>
	}
endscript

script cameracuts_updatedebugcameraname 
	if screenelementexists \{id = debug_camera_name_text}
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
		formattext textname = cameraname "%s type=%t crowd=%c" s = <cameraname> t = $cameracuts_lasttype c = <crowd> dontassertforchecksums
		debug_camera_name_text :setprops text = <cameraname>
	endif
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
	formattext textname = text "Cam: %s, type: %t, crowd: %c ; ; ; 16.667" s = <cameraname> t = $cameracuts_lasttype c = <crowd> dontassertforchecksums
	textoutput text = <text>
endscript

script destroy_cameracuts 
	change \{cameracuts_enabled = false}
	killspawnedscript \{name = cameracuts_startcallback}
	killcamanim \{name = cameracutcam}
	kill_dummy_bg_camera
	clearnotemappings \{section = cameras}
	killspawnedscript \{name = cameracuts_iterator}
endscript
profiling_cameracuts = false

script profile_camera_cuts \{filename = "ProfileCameras"}
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
	if structurecontains structure = (<camera_array> [$debug_camera_array_count]) name
		formattext textname = title "Camera %n Profile Dump" n = ((<camera_array> [$debug_camera_array_count]).name) dontassertforchecksums
	else
		formattext textname = title "Camera %n Profile Dump" n = ((<camera_array> [$debug_camera_array_count]).params.name) dontassertforchecksums
	endif
	dumpprofile cpu = 6 title = <title> current_time_only
endscript

script cameracuts_enablechangecam 
	change cameracuts_changecamenable = <enable>
	change \{cameracuts_changenow = true}
endscript

script cameracuts_calctime 
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
				camera_time = RandomRange (3.0, 8.0)
				getsongtimems
				endtime = (<time> + <camera_time> * 1000)
				cameracuts_getnextdownbeat endtime = <endtime>
				camera_time = ((<endtime> - <time>) / 1000.0)
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
	cameracuts_calctime
	ccam_domorph {
		<camparams>
	}
	cameracuts_waitscript camera_songtime = <camera_songtime>
endscript
allow_4x_effect = true

script cameracuts_handcam \{name = none}
	cameracuts_calctime
	change \{allow_4x_effect = true}
	if gotparam \{locktobone}
		if (<locktobone> = bone_guitar_neck)
			hide_fourx_effect
			change \{allow_4x_effect = false}
		endif
	endif
	ccam_domorph <...>
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
		amplitudeposition = 0.24000001
		amplituderotation = -0.38400003
	endif
	cameracuts_sethandcamparams <...>
	cameracuts_waitscript camera_songtime = <camera_songtime>
	if gotparam \{locktobone}
		if (<locktobone> = bone_guitar_neck)
			show_fourx_effect
			change \{allow_4x_effect = true}
		endif
	endif
endscript

script cameracuts_handcamsmooth \{name = none}
	cameracuts_calctime
	ccam_domorph <...>
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
		amplitudeposition = 0.05
		amplituderotation = -0.08
	endif
	cameracuts_sethandcamparams <...>
	cameracuts_waitscript camera_songtime = <camera_songtime>
endscript

script cameracuts_twocam 
	if gotparam \{usehandcam}
		cameracuts_sethandcamparams \{amplitudeposition = 0.24000001
			amplituderotation = -0.38400003}
	endif
	if gotparam \{usehandcamsmooth}
		cameracuts_sethandcamparams \{amplitudeposition = 0.05
			amplituderotation = -0.08}
	endif
	cameracuts_calctime
	ccam_domorph {
		<cam1>
	}
	ccam_waitmorph
	ccam_domorph {
		<cam2>
		time = <camera_time>
	}
	cameracuts_waitscript camera_songtime = <camera_songtime>
endscript

script cameracuts_encore 
	cameracuts_calctime
	ccam_domorph {
		<cam1>
	}
	wait \{3
		seconds}
	ccam_domorph {
		<cam2>
	}
	wait \{2.5
		seconds}
	ccam_domorph {
		<cam3>
	}
	wait \{3
		seconds}
	ccam_domorph {
		<cam4>
	}
	wait \{2
		seconds}
	ccam_domorph {
		<cam5>
	}
	cameracuts_waitscript camera_songtime = <camera_songtime>
endscript

script cameracuts_orbit 
	cameracuts_calctime
	ccam_domorph {
		<...>
	}
	orbitangle = (3.1409998 * <orbitangle> / 180.0)
	if (<camera_time> > 0)
		ccam_orbit axis = (0.0, 1.0, 0.0) speed = (<orbitangle> / <camera_time>)
	endif
	cameracuts_sethandcamdriftonly
	cameracuts_waitscript camera_songtime = <camera_songtime>
endscript

script cameracuts_orbitandmorphtwocam 
	cameracuts_calctime
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
	cameracuts_waitscript camera_songtime = <camera_songtime>
endscript

script cameracuts_splinemorph 
	cameracuts_calctime
	ccam_splinemorph {
		<...>
		total_time = <camera_time>
	}
	cameracuts_waitscript camera_songtime = <camera_songtime>
endscript

script cameracuts_specialstepmove 
	ccam_setsmoothing \{type = all
		on = 1
		slow_lerp_factor = 0.7
		fast_lerp_factor = 0.7
		lerp_dropoff = 2.0}
	cameracuts_calctime
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
	printf "timestep %i" i = <timestep>
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
	ccam_waitmorph
	if cameracuts_waitscript camera_songtime = <camera_songtime> nowait
		return
	endif
	count = (<count> + <step>)
	repeat
	ccam_domorph {
		<cam2>
		time = <finalrottime>
		motion = smooth
	}
	cameracuts_waitscript camera_songtime = <camera_songtime>
endscript

script cameracuts_applydof \{dof = $dof_medium02_tod_manager
		time = 0.0}
	doftype = <dof>
	dofparam = (<doftype>.screen_fx [0])
	if NOT screenfx_fxinstanceexists \{viewport = bg_viewport
			name = venue_dof}
		screenfx_addfxinstance {
			viewport = bg_viewport
			name = venue_dof
			<dofparam>
			time = <time>
		}
	else
		screenfx_updatefxinstanceparams {
			viewport = bg_viewport
			name = venue_dof
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
		driftslerpmap = [
			(0.0, 0.8)
			(0.05, 1.0)
		]
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
	ccam_domorph <...>
	zooming = false
	if (<zooming> = true)
		amplitudeposition = 0.01
		amplituderotation = -0.01
	else
		amplitudeposition = 0.05
		amplituderotation = -0.08
	endif
	cameracuts_sethandcamparams <...>
	wait \{2
		seconds}
	ccam_domorph <...> fov = 50 time = 0.6 motion = smooth
	ccam_waitmorph
	wait \{0.1
		seconds}
	ccam_domorph <...> fov = 53 time = 0.25 motion = smooth
	ccam_waitmorph
	wait \{0.03
		seconds}
	ccam_domorph <...> fov = 51 time = 0.3 motion = smooth
	ccam_waitmorph
	ccam_domorph <...> fov = 51
	cameracuts_calctime
	cameracuts_waitscript camera_songtime = <camera_songtime>
endscript

script cameracuts_quickzoom 
	ccam_domorph <...>
	zooming = false
	if (<zooming> = true)
		amplitudeposition = 0.01
		amplituderotation = -0.01
	else
		amplitudeposition = 0.05
		amplituderotation = -0.08
	endif
	cameracuts_sethandcamparams <...>
	ccam_domorph {
		<cam1>
	}
	ccam_waitmorph
	wait \{2
		seconds}
	ccam_domorph {
		<cam1>
	}
	ccam_waitmorph
	ccam_domorph {
		<cam2>
		time = 0.75
		motion = smooth
	}
	ccam_waitmorph
	ccam_domorph {
		<cam2>
	}
	ccam_waitmorph
	cameracuts_calctime
	cameracuts_waitscript camera_songtime = <camera_songtime>
endscript

script cameracuts_pan 
	cameracuts_sethandcamparams \{amplitudeposition = 0.05
		amplituderotation = -0.08}
	ccam_domorph {
		<cam1>
		time = 0
	}
	wait \{2
		seconds}
	ccam_domorph {
		<cam2>
		time = 1
		motion = smooth
	}
	ccam_waitmorph
	cameracuts_calctime
	cameracuts_waitscript camera_songtime = <camera_songtime>
endscript

script cameracuts_threepos 
	cameracuts_calctime
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
	cameracuts_waitscript camera_songtime = <camera_songtime>
endscript

script cameracuts_fourpos 
	cameracuts_calctime
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
	cameracuts_waitscript camera_songtime = <camera_songtime>
endscript

script cameracuts_fastintrohold 
	cameracuts_sethandcamparams \{amplitudeposition = 0.05
		amplituderotation = -0.08}
	ccam_domorph {
		<cam1>
	}
	ccam_waitmorph
	ccam_domorph {
		<cam2>
		time = 1.5
		motion = smooth
	}
	ccam_waitmorph
	cameracuts_calctime
	cameracuts_waitscript camera_songtime = <camera_songtime>
endscript

script default_camera_aerosmith_entrance 
	ccam_domorph \{lockto = world
		pos = (0.67134696, 1.0173221, 8.3327055)
		quat = (-0.011763, -0.9972829, -0.071651004)
		fov = 82.0}
	ccam_waitmorph
	ccam_domorph \{lockto = world
		pos = (0.71067595, 1.138438, 9.816325)
		quat = (-0.011763, -0.9972829, -0.071651004)
		fov = 82.0
		time = 4}
	ccam_waitmorph
	ccam_domorph \{lockto = bassist
		pos = (2.9936182, 1.3600678, 2.0988438)
		quat = (0.096046, -0.85081804, -0.083159)
		fov = 28.0}
	ccam_waitmorph
	ccam_domorph \{lockto = bassist
		pos = (2.9936182, 1.3600678, 2.0988438)
		quat = (0.096046, -0.85081804, -0.083159)
		fov = 28.0
		time = 1.5}
	ccam_waitmorph
	ccam_domorph \{lockto = drummer
		pos = (0.156794, 1.697572, 1.8627019)
		quat = (0.002087, 0.98201394, -0.18847503)
		fov = 72.0}
	ccam_waitmorph
	ccam_domorph \{lockto = drummer
		pos = (0.156794, 1.697572, 1.8627019)
		quat = (0.002087, 0.98201394, -0.18847503)
		fov = 72.0
		time = 1.5}
	ccam_waitmorph
	ccam_domorph \{lockto = guitarist
		pos = (0.369664, 0.93793094, 1.2052851)
		quat = (0.116242, -0.97601897, -0.173646)
		fov = 63.0
		lookat = guitarist
		lookatbone = bone_chest
		screenoffset = (-0.35383105, 0.278159)}
	ccam_waitmorph
	ccam_domorph \{lockto = guitarist
		pos = (0.369664, 0.93793094, 1.2052851)
		quat = (0.116242, -0.97601897, -0.173646)
		fov = 63.0
		lookat = guitarist
		lookatbone = bone_chest
		screenoffset = (-0.35383105, 0.278159)
		time = 2}
	ccam_waitmorph
	ccam_domorph \{lockto = vocalist
		pos = (-0.013245, 1.287552, 2.5607681)
		quat = (0.100522, 0.994561, 0.019)
		fov = 48.0
		lookat = vocalist
		lookatbone = bone_chest
		screenoffset = (0.255681, 0.201958)}
	ccam_waitmorph
	ccam_domorph \{lockto = vocalist
		pos = (-0.013245, 1.287552, 2.5607681)
		quat = (0.100522, 0.994561, 0.019)
		fov = 48.0
		lookat = vocalist
		lookatbone = bone_chest
		screenoffset = (0.255681, 0.201958)
		time = 2}
	ccam_waitmorph
	ccam_domorph \{lockto = world
		pos = (0.71067595, 1.138438, 9.816325)
		quat = (-0.011763, -0.9972829, -0.071651004)
		fov = 82.0}
	ccam_waitmorph
	cameracuts_waitscript camera_songtime = <camera_songtime>
endscript

script default_camera_boss 
	ccam_domorph \{lockto = bassist
		pos = (0.415953, 0.67239296, 0.951549)
		quat = (0.060255, -0.9329389, 0.29930598)
		fov = 72.0}
	cameracuts_sethandcamparams \{amplitudeposition = 0.2
		amplituderotation = -0.32000002}
	ccam_waitmorph
	wait \{0.65000004
		seconds}
	ccam_domorph \{lockto = bassist
		pos = (0.415953, 0.67239296, 0.951549)
		quat = (0.060255, -0.9329389, 0.29930598)
		fov = 72.0}
	ccam_waitmorph
	ccam_domorph \{lockto = bassist
		pos = (0.49457502, 1.167327, 1.1275209)
		quat = (-0.01335, -0.977757, -0.060676996)
		fov = 72.0
		time = 3}
	ccam_waitmorph
	ccam_domorph \{lockto = bassist
		pos = (0.49457502, 1.167327, 1.1275209)
		quat = (-0.01335, -0.977757, -0.060676996)
		fov = 72.0}
	ccam_waitmorph
	ccam_domorph \{lockto = bassist
		pos = (0.495756, 1.1663411, 1.12688)
		quat = (-0.013029, -0.97811204, -0.058653)
		fov = 80.0
		time = 3}
	ccam_waitmorph
	ccam_domorph \{lockto = bassist
		pos = (0.495756, 1.1663411, 1.12688)
		quat = (-0.013029, -0.97811204, -0.058653)
		fov = 80.0}
	ccam_waitmorph
	cameracuts_waitscript camera_songtime = <camera_songtime>
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
default_cameras = [
	{
		name = closeup_01
		type = closeup
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = world
				pos = (-0.17172, 1.7125509, 3.530145)
				quat = (0.030365998, 0.969155, -0.15807201)
				fov = 72.0
			}
			cam2 = {
				lockto = world
				pos = (-0.192414, 0.92213994, 3.5821917)
				quat = (-0.0016310001, 0.98192793, 0.008088)
				fov = 72.0
			}
		}
		dof = $dof_closeup02_tod_manager
	}
]
default_cameras_longshot = [
	{
		name = longshot_high01
		type = longshot_high
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = drummer
				pos = (-0.57198894, 3.954246, 25.20223)
				quat = (-0.000391, -0.9862749, 0.165061)
				fov = 72.0
			}
			cam2 = {
				lockto = drummer
				pos = (-0.45701203, 3.954003, 25.201323)
				quat = (-0.000391, -0.9862749, 0.165061)
				fov = 72.0
			}
		}
		dof = $dof_medium01_tod_manager
	}
	{
		name = longshot_low01
		type = longshot_low
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = drummer
				pos = (-1.2919222, -0.24732801, 26.979486)
				quat = (0.002151, 0.99731797, -0.07157)
				fov = 72.0
			}
			cam2 = {
				lockto = drummer
				pos = (-1.5034659, -0.24687901, 26.973026)
				quat = (0.002151, 0.99731797, -0.07157)
				fov = 72.0
			}
		}
		dof = $dof_medium01_tod_manager
	}
]
default_cameras_mid = [
	{
		name = mid_high01
		type = mid_high
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = drummer
				pos = (-0.49241504, 5.681637, 15.161047)
				quat = (0.003945, 0.96217096, -0.27223304)
				fov = 72.0
			}
			cam2 = {
				lockto = drummer
				pos = (-0.358149, 5.6813536, 15.163934)
				quat = (0.003945, 0.96217096, -0.27223304)
				fov = 72.0
			}
		}
		dof = $dof_medium01_tod_manager
	}
	{
		name = mid_high02
		type = mid_high
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = drummer
				pos = (-0.49241504, 5.681637, 15.161047)
				quat = (0.003945, 0.96217096, -0.27223304)
				fov = 72.0
			}
			cam2 = {
				lockto = drummer
				pos = (-0.358149, 5.6813536, 15.163934)
				quat = (0.003945, 0.96217096, -0.27223304)
				fov = 72.0
			}
		}
		dof = $dof_medium01_tod_manager
	}
	{
		name = mid_low01
		type = mid_low
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = drummer
				pos = (-0.238645, 1.380729, 16.519836)
				quat = (0.002289, 0.993116, -0.116648)
				fov = 72.0
			}
			cam2 = {
				lockto = drummer
				pos = (-0.395918, 1.381063, 16.516504)
				quat = (0.002289, 0.993116, -0.116648)
				fov = 72.0
			}
		}
		dof = $dof_medium01_tod_manager
	}
	{
		controlscript = cameracuts_orbit
		params = {
			name = mid_orbit_ccw01
			type = mid_orbit_ccw
			lockto = drummer
			pos = (5.8004093, 2.342972, 15.428842)
			quat = (0.030534998, -0.968155, 0.16403799)
			fov = 72.0
			orbitangle = -50
		}
		dof = $dof_medium01_tod_manager
	}
	{
		controlscript = cameracuts_orbit
		params = {
			name = mid_orbit_cw01
			type = mid_orbit_cw
			lockto = drummer
			pos = (-3.629889, 2.363242, 15.843865)
			quat = (0.01824, 0.9812179, -0.16114299)
			fov = 72.0
			orbitangle = 50
		}
		dof = $dof_medium01_tod_manager
	}
	{
		name = mid_vert_up01
		type = mid_vert_up
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = drummer
				pos = (3.229095, 1.135073, 16.748884)
				quat = (0.010959, -0.98798496, 0.109562)
				fov = 72.0
			}
			cam2 = {
				lockto = drummer
				pos = (3.107956, 3.7773118, 16.177395)
				quat = (0.020343998, -0.97472, 0.195036)
				fov = 72.0
			}
		}
		dof = $dof_medium01_tod_manager
	}
	{
		name = mid_vert_down01
		type = mid_vert_down
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = drummer
				pos = (3.107956, 3.7773118, 16.177395)
				quat = (0.020343998, -0.97472, 0.195036)
				fov = 72.0
			}
			cam2 = {
				lockto = drummer
				pos = (3.229095, 1.135073, 16.748884)
				quat = (0.010959, -0.98798496, 0.109562)
				fov = 72.0
			}
		}
		dof = $dof_medium01_tod_manager
	}
]
default_cameras_stage = [
	{
		controlscript = cameracuts_handcam
		params = {
			name = stage_high01
			type = stage_high
			lockto = guitarist
			pos = (-0.331379, 2.1398208, -2.9350684)
			quat = (0.21009701, -0.053707, 0.011462)
			fov = 72.0
			lookat = guitarist
			lookatbone = bone_chest
			screenoffset = (-0.283846, -0.06725301)
		}
		dof = $dof_medium01_tod_manager
	}
	{
		controlscript = cameracuts_handcam
		params = {
			name = stage_low01
			type = stage_low
			lockto = guitarist
			pos = (-0.381286, 0.425256, -2.519796)
			quat = (-0.10694, -0.058470998, -0.0063960003)
			fov = 72.0
			lookat = guitarist
			lookatbone = bone_chest
			screenoffset = (-0.365109, -0.27589303)
		}
		dof = $dof_medium01_tod_manager
	}
	{
		controlscript = cameracuts_orbit
		params = {
			name = stage_orbit_ccw01
			type = stage_orbit_ccw
			lockto = guitarist
			pos = (-1.390305, 1.247357, -2.320251)
			quat = (0.043256998, 0.222721, -0.009962)
			fov = 72.0
			lookat = guitarist
			lookatbone = bone_chest
			screenoffset = (-0.22146101, -0.058813)
			orbitangle = -50
		}
		dof = $dof_medium01_tod_manager
	}
	{
		controlscript = cameracuts_orbit
		params = {
			name = stage_orbit_cw01
			type = stage_orbit_cw
			lockto = guitarist
			pos = (1.1497709, 1.5669589, -2.5368068)
			quat = (0.093412, -0.302062, 0.029615)
			fov = 72.0
			lookat = guitarist
			lookatbone = bone_chest
			screenoffset = (-0.118136, -0.017852)
			orbitangle = 50
		}
		dof = $dof_medium01_tod_manager
	}
	{
		name = stage_vert_up01
		type = stage_vert_up
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = guitarist
				pos = (-0.89921296, 0.622014, -2.6956532)
				quat = (-0.072645, 0.017495997, 0.001188)
				fov = 72.0
			}
			cam2 = {
				lockto = guitarist
				pos = (-0.9092429, 2.642869, -2.9914842)
				quat = (0.27269104, 0.016848, -0.0048660003)
				fov = 72.0
			}
		}
		dof = $dof_medium01_tod_manager
	}
	{
		name = stage_vert_down01
		type = stage_vert_down
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = guitarist
				pos = (-0.9092429, 2.642869, -2.9914842)
				quat = (0.27269104, 0.016848, -0.0048660003)
				fov = 72.0
			}
			cam2 = {
				lockto = guitarist
				pos = (-0.89921296, 0.622014, -2.6956532)
				quat = (-0.072645, 0.017495997, 0.001188)
				fov = 72.0
			}
		}
		dof = $dof_medium01_tod_manager
	}
]
default_cameras_guitar = [
	{
		controlscript = cameracuts_handcam
		params = {
			name = guitar_solo_body01
			type = guitar_solo_body
			lockto = guitarist
			locktobone = bone_guitar_body
			pos = (-0.411937, 0.25536898, 0.113419)
			quat = (0.035701, 0.765104, -0.314193)
			fov = 69.0
		}
		dof = $dof_medium01_tod_manager
		crowdoff
	}
	{
		controlscript = cameracuts_handcam
		params = {
			name = guitar_solo_neck01
			type = guitar_solo_neck
			lockto = guitarist
			locktobone = bone_guitar_neck
			pos = (0.6295221, 0.141155, 0.036870994)
			quat = (-0.515311, -0.48547202, 0.643777)
			fov = 59.0
		}
		dof = $dof_medium01_tod_manager
		crowdoff
	}
	{
		controlscript = cameracuts_handcam
		params = {
			name = guitar_closeup01
			type = guitar_closeup
			lockto = guitarist
			pos = (1.2061551, 1.830135, 2.4996212)
			quat = (0.032743998, -0.969021, 0.16408199)
			fov = 23.0
			lookat = guitarist
			lookatbone = bone_guitar_body
			screenoffset = (-0.308609, -0.110810995)
		}
		dof = $dof_medium01_tod_manager
		crowdoff
	}
]
default_cameras_guitarist = [
	{
		controlscript = cameracuts_handcam
		params = {
			name = guitarist_medium01
			type = guitarist_medium
			lockto = guitarist
			pos = (0.568493, 1.413887, 2.069787)
			quat = (0.023573, -0.96751004, 0.103691004)
			fov = 72.0
			lookat = guitarist
			lookatbone = bone_chest
			screenoffset = (0.338886, -0.30280703)
		}
		dof = $dof_closeup01_tod_manager
		crowdoff
	}
	{
		controlscript = cameracuts_handcam
		params = {
			name = guitarist_closeup01
			type = guitarist_closeup
			lockto = guitarist
			pos = (0.61056405, 1.2063072, 0.73351)
			quat = (-0.011779, -0.937494, -0.029049)
			fov = 72.0
			lookat = guitarist
			lookatbone = bone_head
			screenoffset = (0.19106, -0.425305)
		}
		dof = $dof_closeup01_tod_manager
		crowdoff
	}
	{
		controlscript = cameracuts_orbit
		params = {
			name = guitarist_orbit_ccw01
			type = guitarist_orbit_ccw
			lockto = guitarist
			pos = (0.568493, 1.413887, 2.069787)
			quat = (0.017220998, -0.98019695, 0.108353004)
			fov = 72.0
			lookat = guitarist
			lookatbone = bone_chest
			screenoffset = (0.12937102, -0.33291003)
			orbitangle = -50
		}
		dof = $dof_closeup01_tod_manager
		crowdoff
	}
	{
		controlscript = cameracuts_orbit
		params = {
			name = guitarist_orbit_cw01
			type = guitarist_orbit_cw
			lockto = guitarist
			pos = (-1.046432, 1.384884, 1.9220159)
			quat = (0.029545998, 0.958008, -0.102428995)
			fov = 72.0
			lookat = guitarist
			lookatbone = bone_chest
			screenoffset = (-0.24229202, -0.33644602)
			orbitangle = 50
		}
		dof = $dof_closeup01_tod_manager
		crowdoff
	}
	{
		name = guitarist_vert_up01
		type = guitarist_vert_up
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = guitarist
				pos = (0.488286, 0.30742103, 2.617984)
				quat = (-0.016588999, -0.98285997, -0.09915401)
				fov = 72.0
			}
			cam2 = {
				lockto = guitarist
				pos = (0.59022295, 2.1093469, 2.9224093)
				quat = (0.040925, -0.95809203, 0.201243)
				fov = 72.0
			}
		}
		dof = $dof_closeup02_tod_manager
		crowdoff
	}
	{
		name = guitarist_vert_down01
		type = guitarist_vert_down
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = guitarist
				pos = (0.59022295, 2.1093469, 2.9224093)
				quat = (0.040925, -0.95809203, 0.201243)
				fov = 72.0
			}
			cam2 = {
				lockto = guitarist
				pos = (0.488286, 0.30742103, 2.617984)
				quat = (-0.016588999, -0.98285997, -0.09915401)
				fov = 72.0
			}
		}
		dof = $dof_closeup02_tod_manager
		crowdoff
	}
]
default_cameras_singer = [
	{
		controlscript = cameracuts_handcam
		params = {
			name = singer_medium01
			type = singer_medium
			lockto = vocalist
			pos = (0.76937497, 1.058248, 2.108929)
			quat = (0.0024680002, -0.975066, 0.015652)
			fov = 72.0
			lookat = vocalist
			lookatbone = bone_chest
			screenoffset = (0.38290703, -0.371808)
		}
		dof = $dof_closeup01_tod_manager
		crowdoff
	}
	{
		controlscript = cameracuts_handcam
		params = {
			name = singer_closeup01
			type = singer_closeup
			lockto = vocalist
			pos = (0.51758003, 1.618211, 0.616831)
			quat = (0.012169001, -0.9712839, 0.055753)
			fov = 72.0
			lookat = vocalist
			lookatbone = bone_head
			screenoffset = (0.417869, -0.345862)
		}
		dof = $dof_closeup01_tod_manager
		crowdoff
	}
	{
		controlscript = cameracuts_orbit
		params = {
			name = singer_orbit_ccw01
			type = singer_orbit_ccw
			lockto = vocalist
			pos = (1.064897, 1.4607079, 1.941088)
			quat = (0.02007, -0.96802, 0.087443)
			fov = 72.0
			lookat = vocalist
			lookatbone = bone_chest
			screenoffset = (0.230507, -0.35726503)
			orbitangle = -50
		}
		dof = $dof_closeup01_tod_manager
		crowdoff
	}
	{
		controlscript = cameracuts_orbit
		params = {
			name = singer_orbit_cw01
			type = singer_orbit_cw
			lockto = vocalist
			pos = (-0.99324894, 1.5038509, 1.7319051)
			quat = (0.032038998, 0.937449, -0.086307)
			fov = 72.0
			lookat = vocalist
			lookatbone = bone_chest
			screenoffset = (-0.298856, -0.31489903)
			orbitangle = 50
		}
		dof = $dof_closeup01_tod_manager
		crowdoff
	}
	{
		name = singer_vert_up01
		type = singer_vert_up
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = vocalist
				pos = (0.20753399, 0.27587602, 2.459351)
				quat = (-0.017328998, -0.9836369, -0.119853005)
				fov = 72.0
			}
			cam2 = {
				lockto = vocalist
				pos = (0.264459, 2.7206302, 2.661429)
				quat = (0.038757, -0.95208496, 0.26838097)
				fov = 72.0
			}
		}
		dof = $dof_closeup02_tod_manager
		crowdoff
	}
	{
		name = singer_vert_down01
		type = singer_vert_down
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = vocalist
				pos = (0.264459, 2.7206302, 2.661429)
				quat = (0.038757, -0.95208496, 0.26838097)
				fov = 72.0
			}
			cam2 = {
				lockto = vocalist
				pos = (0.20753399, 0.27587602, 2.459351)
				quat = (-0.017328998, -0.9836369, -0.119853005)
				fov = 72.0
			}
		}
		dof = $dof_closeup02_tod_manager
		crowdoff
	}
]
default_cameras_drummer = [
	{
		controlscript = cameracuts_handcam
		params = {
			name = drummer_medium01
			type = drummer_medium
			lockto = drummer
			pos = (0.222421, 1.513564, 2.327249)
			quat = (0.013893999, -0.983884, 0.147923)
			fov = 72.0
			lookat = drummer
			lookatbone = bone_chest
			screenoffset = (0.224311, -0.229782)
		}
		dof = $dof_closeup01_tod_manager
		crowdoff
	}
	{
		controlscript = cameracuts_handcam
		params = {
			name = drummer_closeup01
			type = drummer_closeup
			lockto = drummer
			pos = (-0.20566, 1.3390739, 1.4644548)
			quat = (0.012424001, 0.98862296, -0.102515)
			fov = 72.0
			lookat = drummer
			lookatbone = bone_chest
			screenoffset = (-0.061589997, 0.036165)
		}
		dof = $dof_closeup01_tod_manager
		crowdoff
	}
	{
		controlscript = cameracuts_orbit
		params = {
			name = drummer_orbit_ccw01
			type = drummer_orbit_ccw
			lockto = drummer
			pos = (1.1982142, 2.287699, 2.516386)
			quat = (0.071181, -0.927455, 0.27218598)
			fov = 72.0
			lookat = drummer
			lookatbone = bone_chest
			screenoffset = (0.17088601, -0.39122102)
			orbitangle = -50
		}
		dof = $dof_closeup01_tod_manager
		crowdoff
	}
	{
		controlscript = cameracuts_orbit
		params = {
			name = drummer_orbit_cw01
			type = drummer_orbit_cw
			lockto = drummer
			pos = (-1.033128, 2.2700999, 2.4955552)
			quat = (0.067911, 0.93188894, -0.276048)
			fov = 72.0
			lookat = drummer
			lookatbone = bone_chest
			screenoffset = (-0.10158, -0.42090502)
			orbitangle = 50
		}
		dof = $dof_closeup01_tod_manager
		crowdoff
	}
	{
		name = drummer_vert_up01
		type = drummer_vert_up
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = drummer
				pos = (-0.200713, 0.22366, 2.602559)
				quat = (-0.019181, 0.97748697, 0.11121701)
				fov = 72.0
			}
			cam2 = {
				lockto = drummer
				pos = (-0.24826102, 1.752702, 2.738014)
				quat = (0.038087, 0.9626029, -0.20308802)
				fov = 72.0
			}
		}
		dof = $dof_closeup02_tod_manager
		crowdoff
	}
	{
		name = drummer_vert_down01
		type = drummer_vert_down
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = drummer
				pos = (-0.24826102, 1.752702, 2.738014)
				quat = (0.038087, 0.9626029, -0.20308802)
				fov = 72.0
			}
			cam2 = {
				lockto = drummer
				pos = (-0.200713, 0.22366, 2.602559)
				quat = (-0.019181, 0.97748697, 0.11121701)
				fov = 72.0
			}
		}
		dof = $dof_closeup02_tod_manager
		crowdoff
	}
]
default_cameras_bassist = [
	{
		controlscript = cameracuts_handcam
		params = {
			name = bassist_medium01
			type = bassist_medium
			lockto = bassist
			pos = (-0.44130397, 1.5022471, 2.1888866)
			quat = (0.015552999, 0.97714204, -0.070612)
			fov = 72.0
			lookat = bassist
			lookatbone = bone_chest
			screenoffset = (-0.35030103, -0.33996502)
		}
		dof = $dof_closeup01_tod_manager
		crowdoff
	}
	{
		controlscript = cameracuts_handcam
		params = {
			name = bassist_closeup01
			type = bassist_closeup
			lockto = bassist
			pos = (-0.0051089996, 1.621796, 1.1483951)
			quat = (0.0064429995, 0.9916849, -0.044035)
			fov = 72.0
			lookat = bassist
			lookatbone = bone_chest
			screenoffset = (-0.40118998, 0.14046001)
		}
		dof = $dof_closeup01_tod_manager
		crowdoff
	}
	{
		controlscript = cameracuts_orbit
		params = {
			name = bassist_orbit_ccw01
			type = bassist_orbit_ccw
			lockto = bassist
			pos = (0.474889, 1.3453529, 2.0212908)
			quat = (0.003438, -0.97328895, 0.019135999)
			fov = 72.0
			lookat = bassist
			lookatbone = bone_chest
			screenoffset = (0.36560303, -0.251627)
			orbitangle = -50
		}
		dof = $dof_closeup01_tod_manager
		crowdoff
	}
	{
		controlscript = cameracuts_orbit
		params = {
			name = bassist_orbit_cw01
			type = bassist_orbit_cw
			lockto = bassist
			pos = (-1.410602, 1.3496668, 1.465308)
			quat = (0.0070640002, 0.950463, -0.018121999)
			fov = 72.0
			lookat = bassist
			lookatbone = bone_chest
			screenoffset = (0.161898, -0.25292102)
			orbitangle = 50
		}
		dof = $dof_closeup01_tod_manager
		crowdoff
	}
	{
		name = bassist_vert_up01
		type = bassist_vert_up
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = bassist
				pos = (0.858407, 0.2837, 2.433893)
				quat = (-0.0040740003, -0.99326897, -0.11267199)
				fov = 72.0
			}
			cam2 = {
				lockto = bassist
				pos = (0.883989, 3.015893, 2.6785629)
				quat = (0.00117, -0.95310104, 0.302564)
				fov = 72.0
			}
		}
		dof = $dof_closeup02_tod_manager
		crowdoff
	}
	{
		name = bassist_vert_down01
		type = bassist_vert_down
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = bassist
				pos = (0.883989, 3.015893, 2.6785629)
				quat = (0.00117, -0.95310104, 0.302564)
				fov = 72.0
			}
			cam2 = {
				lockto = bassist
				pos = (0.858407, 0.2837, 2.433893)
				quat = (-0.0040740003, -0.99326897, -0.11267199)
				fov = 72.0
			}
		}
		dof = $dof_closeup02_tod_manager
		crowdoff
	}
]
default_cameras_rhythm = [
	{
		controlscript = cameracuts_handcam
		params = {
			name = rhythm_medium01
			type = rhythm_medium
			lockto = world
			pos = (-2.303154, 0.764982, 4.8603663)
			quat = (-0.012736999, 0.9809339, 0.112639)
			fov = 72.0
			lookat = rhythm
			lookatbone = bone_chest
			screenoffset = (-0.40689602, -0.21984601)
		}
		dof = $dof_closeup01_tod_manager
		crowdoff
	}
	{
		controlscript = cameracuts_handcam
		params = {
			name = rhythm_closeup01
			type = rhythm_closeup
			lockto = world
			pos = (-1.700512, 0.235937, 4.5619025)
			quat = (-0.074879, -0.929315, -0.231359)
			fov = 72.0
			lookat = rhythm
			lookatbone = bone_chest
			screenoffset = (0.39920303, -0.28451303)
		}
		dof = $dof_closeup01_tod_manager
		crowdoff
	}
	{
		controlscript = cameracuts_orbit
		params = {
			name = rhythm_orbit_ccw01
			type = rhythm_orbit_ccw
			lockto = bassist
			pos = (-0.8169869, 1.8065109, 1.984302)
			quat = (0.049500998, 0.95019, -0.207611)
			fov = 72.0
			lookat = rhythm
			lookatbone = bone_chest
			screenoffset = (-0.087603, -0.23554099)
			orbitangle = -50
		}
		dof = $dof_closeup01_tod_manager
		crowdoff
	}
	{
		controlscript = cameracuts_orbit
		params = {
			name = rhythm_orbit_cw01
			type = rhythm_orbit_cw
			lockto = bassist
			pos = (-0.8169869, 1.8065109, 1.984302)
			quat = (0.049500998, 0.95019, -0.207611)
			fov = 72.0
			lookat = rhythm
			lookatbone = bone_chest
			screenoffset = (-0.087603, -0.23554099)
			orbitangle = 50
		}
		dof = $dof_closeup01_tod_manager
		crowdoff
	}
	{
		name = rhythm_vert_up01
		type = rhythm_vert_up
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = world
				pos = (-0.17172, 1.7125509, 3.530145)
				quat = (0.030365998, 0.969155, -0.15807201)
				fov = 72.0
			}
			cam2 = {
				lockto = world
				pos = (-0.192414, 0.92213994, 3.5821917)
				quat = (-0.0016310001, 0.98192793, 0.008088)
				fov = 72.0
			}
		}
		dof = $dof_closeup02_tod_manager
		crowdoff
	}
	{
		name = rhythm_vert_down01
		type = rhythm_vert_down
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = world
				pos = (-0.17172, 1.7125509, 3.530145)
				quat = (0.030365998, 0.969155, -0.15807201)
				fov = 72.0
			}
			cam2 = {
				lockto = world
				pos = (-0.192414, 0.92213994, 3.5821917)
				quat = (-0.0016310001, 0.98192793, 0.008088)
				fov = 72.0
			}
		}
		dof = $dof_closeup02_tod_manager
		crowdoff
	}
]
default_cameras_dolly = [
	{
		name = dolly_rear_l01
		type = dolly_rear_l
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = guitarist
				pos = (-4.226099, 2.76196, -2.4963582)
				quat = (0.216053, 0.382162, -0.092458)
				fov = 72.0
			}
			cam2 = {
				lockto = guitarist
				pos = (0.834532, 2.6632998, -3.10608)
				quat = (0.19763198, -0.258669, 0.054020002)
				fov = 72.0
			}
		}
		dof = $dof_medium01_tod_manager
	}
	{
		name = dolly_rear_r01
		type = dolly_rear_r
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = guitarist
				pos = (0.834532, 2.6632998, -3.10608)
				quat = (0.19763198, -0.258669, 0.054020002)
				fov = 72.0
			}
			cam2 = {
				lockto = guitarist
				pos = (-4.226099, 2.76196, -2.4963582)
				quat = (0.216053, 0.382162, -0.092458)
				fov = 72.0
			}
		}
		dof = $dof_medium01_tod_manager
	}
	{
		name = dolly_front_l01
		type = dolly_front_l
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = guitarist
				pos = (1.881293, 2.3065019, 4.1567903)
				quat = (0.054615, -0.940841, 0.18255)
				fov = 72.0
			}
			cam2 = {
				lockto = guitarist
				pos = (-3.5599792, 2.2152371, 4.445907)
				quat = (0.034560997, 0.964024, -0.15983601)
				fov = 72.0
			}
		}
		dof = $dof_medium01_tod_manager
	}
	{
		name = dolly_front_r01
		type = dolly_front_r
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = guitarist
				pos = (-3.5599792, 2.2152371, 4.445907)
				quat = (0.034560997, 0.964024, -0.15983601)
				fov = 72.0
			}
			cam2 = {
				lockto = guitarist
				pos = (1.881293, 2.3065019, 4.1567903)
				quat = (0.054615, -0.940841, 0.18255)
				fov = 72.0
			}
		}
		dof = $dof_medium01_tod_manager
	}
]
default_cameras_pan = [
	{
		name = pan_guitarist_singer01
		type = pan_guitarist_singer
		controlscript = cameracuts_pan
		params = {
			cam1 = {
				lockto = guitarist
				pos = (0.221304, 1.2147759, 1.6710881)
				quat = (-1E-06, 0.99944097, -0.006206)
				fov = 62.0
				lookat = guitarist
				lookatbone = bone_chest
				screenoffset = (-0.42091504, 0.147356)
			}
			cam2 = {
				lockto = vocalist
				pos = (2.1242719, 1.214955, 1.3240658)
				quat = (0.0031050001, -0.880311, 0.0054469993)
				fov = 62.0
				lookat = vocalist
				lookatbone = bone_chest
				screenoffset = (0.358489, -0.170862)
			}
		}
		dof = $dof_closeup01_tod_manager
	}
	{
		name = pan_singer_guitarist01
		type = pan_singer_guitarist
		controlscript = cameracuts_pan
		params = {
			cam1 = {
				lockto = vocalist
				pos = (2.1242719, 1.214955, 1.3240658)
				quat = (0.0031050001, -0.880311, 0.0054469993)
				fov = 62.0
				lookat = vocalist
				lookatbone = bone_chest
				screenoffset = (0.358489, -0.170862)
			}
			cam2 = {
				lockto = guitarist
				pos = (0.221304, 1.2147759, 1.6710881)
				quat = (-1E-06, 0.99944097, -0.006206)
				fov = 62.0
				lookat = guitarist
				lookatbone = bone_chest
				screenoffset = (-0.42091504, 0.147356)
			}
		}
		dof = $dof_closeup01_tod_manager
	}
]
default_cameras_zoom = [
	{
		name = zoom_out_slow01
		type = zoom_out_slow
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = guitarist
				pos = (-0.608687, 4.565676, 12.706401)
				quat = (-0.0014460001, 0.99146694, -0.13027)
				fov = 7.0
				lookat = guitarist
				lookatbone = bone_chest
				screenoffset = (0.37269202, 0.11745)
			}
			cam2 = {
				lockto = guitarist
				pos = (-0.608687, 4.565676, 12.706401)
				quat = (0.012666, -0.979612, 0.193192)
				fov = 52.0
				lookat = guitarist
				lookatbone = bone_chest
				screenoffset = (0.303226, -0.470842)
			}
		}
		dof = $dof_medium01_tod_manager
	}
	{
		name = zoom_out_fast01
		type = zoom_out_fast
		controlscript = cameracuts_quickzoom
		params = {
			cam1 = {
				lockto = guitarist
				pos = (-0.608687, 4.565676, 12.706401)
				quat = (-0.0014460001, 0.99146694, -0.13027)
				fov = 7.0
				lookat = guitarist
				lookatbone = bone_chest
				screenoffset = (0.37269202, 0.11745)
			}
			cam2 = {
				lockto = guitarist
				pos = (-0.608687, 4.565676, 12.706401)
				quat = (0.012666, -0.979612, 0.193192)
				fov = 52.0
				lookat = guitarist
				lookatbone = bone_chest
				screenoffset = (0.303226, -0.470842)
			}
		}
		dof = $dof_medium02_tod_manager
	}
	{
		name = zoom_in_slow01
		type = zoom_in_slow
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = guitarist
				pos = (-0.608687, 4.565676, 12.706401)
				quat = (0.012666, -0.979612, 0.193192)
				fov = 52.0
				lookat = guitarist
				lookatbone = bone_chest
				screenoffset = (0.303226, -0.470842)
			}
			cam2 = {
				lockto = guitarist
				pos = (-0.608687, 4.565676, 12.706401)
				quat = (-0.0014460001, 0.99146694, -0.13027)
				fov = 7.0
				lookat = guitarist
				lookatbone = bone_chest
				screenoffset = (0.37269202, 0.11745)
			}
		}
		dof = $dof_medium01_tod_manager
	}
	{
		name = zoom_in_fast01
		type = zoom_in_fast
		controlscript = cameracuts_quickzoom
		params = {
			cam1 = {
				lockto = guitarist
				pos = (-0.608687, 4.565676, 12.706401)
				quat = (0.012666, -0.979612, 0.193192)
				fov = 52.0
				lookat = guitarist
				lookatbone = bone_chest
				screenoffset = (0.303226, -0.470842)
			}
			cam2 = {
				lockto = guitarist
				pos = (-0.608687, 4.565676, 12.706401)
				quat = (-0.0014460001, 0.99146694, -0.13027)
				fov = 7.0
				lookat = guitarist
				lookatbone = bone_chest
				screenoffset = (0.37269202, 0.11745)
			}
		}
		dof = $dof_medium02_tod_manager
	}
]
default_cameras_special = [
	{
		name = special01
		type = special_a
		controlscript = cameracuts_threepos
		params = {
			cam1 = {
				lockto = guitarist
				pos = (7.91994, 4.0722446, 15.780664)
				quat = (0.043356, -0.954315, 0.156901)
				fov = 52.0
			}
			cam2 = {
				lockto = guitarist
				pos = (4.605281, 1.9775009, 9.89547)
				quat = (0.037202, -0.957874, 0.13346401)
				fov = 52.0
			}
			cam3 = {
				lockto = guitarist
				pos = (1.5902342, 1.2208471, 4.5518465)
				quat = (0.016259, -0.9656329, 0.053746)
				fov = 52.0
			}
		}
	}
	{
		controlscript = cameracuts_orbitandmorphtwocam
		params = {
			name = special02
			type = special_b
			orbitangle = 90
			cam1 = {
				lockto = guitarist
				pos = (-3.7134671, 1.561098, 5.2489767)
				quat = (0.022261, 0.94396603, -0.111006)
				fov = 72.0
			}
			cam2 = {
				lockto = guitarist
				pos = (-1.6345519, 0.98434895, 2.433505)
				quat = (-0.013397, 0.950469, -0.0021470003)
				fov = 72.0
			}
		}
	}
	{
		controlscript = cameracuts_orbitandmorphtwocam
		params = {
			name = special03
			type = special_c
			orbitangle = -40
			cam1 = {
				lockto = guitarist
				pos = (2.1238008, 3.287695, 5.0177402)
				quat = (0.076614, -0.92003894, 0.22002399)
				fov = 72.0
			}
			cam2 = {
				lockto = guitarist
				pos = (0.615803, 1.9095379, 2.403839)
				quat = (0.043414995, -0.957317, 0.186884)
				fov = 72.0
			}
		}
	}
	{
		controlscript = cameracuts_specialstepmove
		params = {
			name = special04
			type = special_d
			cam1 = {
				lockto = guitarist
				pos = (3.3718438, 1.241465, 7.8585925)
				quat = (0.017955, -0.950063, 0.048733)
				fov = 52.0
			}
			cam2 = {
				lockto = guitarist
				pos = (3.3718438, 1.241465, 7.8585925)
				quat = (0.017955, -0.950063, 0.048733)
				fov = 52.0
			}
			steptime = 6.0
			finalrottime = 1.0
			stepnum = 6.0
			stepdir = (0.0, 0.07, 0.05)
			dof = $dof_off_tod_manager
		}
	}
]
default_cameras_mocap = [
	{
		controlscript = cameracuts_handcam
		params = {
			name = mocap01
			type = mocap
			lockto = guitarist
			pos = (-0.24607702, 3.316178, 0.92423993)
			quat = (0.021933999, 0.868847, -0.49323303)
			fov = 72.0
		}
		dof = $dof_medium01_tod_manager
	}
	{
		controlscript = cameracuts_handcam
		params = {
			name = mocap02
			type = mocap
			lockto = vocalist
			pos = (0.0024010001, 3.3782017, 1.199096)
			quat = (0.009012999, 0.84305805, -0.53760797)
			fov = 72.0
		}
		dof = $dof_medium01_tod_manager
	}
	{
		controlscript = cameracuts_handcam
		params = {
			name = mocap03
			type = mocap
			lockto = bassist
			pos = (-0.0057200002, 3.355163, 2.1156142)
			quat = (0.008965001, 0.8438061, -0.53643596)
			fov = 72.0
		}
		dof = $dof_medium01_tod_manager
	}
	{
		controlscript = cameracuts_handcam
		params = {
			name = mocap04
			type = mocap
			lockto = drummer
			pos = (0.107346, 3.4477382, 1.783761)
			quat = (0.008895, 0.84684604, -0.53162295)
			fov = 72.0
		}
		dof = $dof_medium01_tod_manager
	}
]
default_cameras_stagedive = [
	{
		controlscript = cameracuts_handcam
		params = {
			name = stagediver01
			type = stagediver
			lockto = world
			pos = (0.161384, -0.255694, 7.6203847)
			quat = (-0.019520998, 0.9806339, 0.12749502)
			fov = 72.0
		}
		dof = $dof_medium01_tod_manager
		crowdoff
	}
]
default_cameras_audience = [
	{
		controlscript = cameracuts_handcam
		params = {
			name = audience01
			type = audience
			lockto = guitarist
			pos = (-2.8780198, 1.042694, -0.18393801)
			quat = (0.074025996, 0.014415, -0.0029910002)
			fov = 52.0
		}
		dof = $dof_medium01_tod_manager
	}
]
default_cameras_starpower = [
	{
		name = starpower
		type = starpower
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = world
				pos = (2.58572, 1.1694639, 6.018505)
				quat = (-0.001818, -0.97748, 0.008785)
				fov = 72.0
				lookat = guitarist
				lookatbone = bone_chest
				screenoffset = (0.33652902, -0.198419)
			}
			cam2 = {
				lockto = world
				pos = (2.126417, 1.151183, 5.003499)
				quat = (-0.003998, -0.97537994, -0.0012250001)
				fov = 104.0
				lookat = guitarist
				lookatbone = bone_chest
				screenoffset = (0.43471202, -0.20290701)
			}
			dof = $dof_closeup02_tod_manager
			crowdoff
		}
	}
]
default_cameras_intro = [
	{
		name = intro
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = guitarist
				pos = (2.027228, 3.356204, 10.107616)
				quat = (0.034807995, -0.963447, 0.206313)
				fov = 72.0
			}
			cam2 = {
				lockto = guitarist
				pos = (0.310654, 1.548265, 5.166498)
				quat = (0.018204998, -0.979563, 0.114463)
				fov = 72.0
			}
		}
		dof = $dof_medium01_tod_manager
	}
]
default_cameras_fastintro = [
	{
		name = fastintro
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = guitarist
				pos = (2.027228, 3.356204, 10.107616)
				quat = (0.034807995, -0.963447, 0.206313)
				fov = 72.0
			}
			cam2 = {
				lockto = guitarist
				pos = (0.310654, 1.548265, 5.166498)
				quat = (0.018204998, -0.979563, 0.114463)
				fov = 72.0
			}
		}
		dof = $dof_medium01_tod_manager
		crowdoff
	}
]
default_cameras_preboss = [
	{
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = guitarist
				pos = (2.027228, 3.356204, 10.107616)
				quat = (0.034807995, -0.963447, 0.206313)
				fov = 72.0
			}
			cam2 = {
				lockto = guitarist
				pos = (0.310654, 1.548265, 5.166498)
				quat = (0.018204998, -0.979563, 0.114463)
				fov = 72.0
			}
		}
		dof = $dof_medium01_tod_manager
		crowdoff
	}
]
default_cameras_boss = [
	{
		controlscript = default_camera_boss
		dof = $dof_medium02_tod_manager
	}
]
default_cameras_preencore = [
	{
		name = preencore
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = guitarist
				pos = (0.310654, 1.548265, 5.166498)
				quat = (0.018204998, -0.979563, 0.114463)
				fov = 72.0
			}
			cam2 = {
				lockto = guitarist
				pos = (2.027228, 3.356204, 10.107616)
				quat = (0.034807995, -0.963447, 0.206313)
				fov = 72.0
			}
		}
		dof = $dof_medium01_tod_manager
	}
]
default_cameras_preaerosmith = [
	{
		name = preaerosmith
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = guitarist
				pos = (0.310654, 1.548265, 5.166498)
				quat = (0.018204998, -0.979563, 0.114463)
				fov = 72.0
			}
			cam2 = {
				lockto = guitarist
				pos = (2.027228, 3.356204, 10.107616)
				quat = (0.034807995, -0.963447, 0.206313)
				fov = 72.0
			}
		}
		dof = $dof_medium01_tod_manager
	}
]
default_cameras_encore = [
	{
		name = encore
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = guitarist
				pos = (0.310654, 1.548265, 5.166498)
				quat = (0.018204998, -0.979563, 0.114463)
				fov = 72.0
			}
			cam2 = {
				lockto = guitarist
				pos = (2.027228, 3.356204, 10.107616)
				quat = (0.034807995, -0.963447, 0.206313)
				fov = 72.0
			}
		}
		dof = $dof_medium01_tod_manager
	}
]
default_cameras_aerosmith_entrance = [
	{
		controlscript = default_camera_aerosmith_entrance
		dof = $dof_medium02_tod_manager
	}
]
default_cameras_walk = [
	{
		controlscript = cameracuts_handcam
		params = {
			name = walk01
			type = walk
			lockto = world
			pos = (-4.908679, -0.015424, 6.3657885)
			quat = (-0.06930599, 0.891852, 0.112707995)
			fov = 71.0
		}
		dof = $dof_medium01_tod_manager
		crowdoff
	}
]
default_cameras_win = [
	{
		controlscript = cameracuts_orbitandmorphtwocam
		params = {
			name = win
			orbitangle = 10
			cam1 = {
				lockto = guitarist
				pos = (0.206255, 0.082557, 3.0024462)
				quat = (-0.030819999, -0.96920395, -0.1256)
				fov = 72.0
			}
			cam2 = {
				lockto = guitarist
				pos = (0.96568394, -0.40605003, 4.6806836)
				quat = (-0.030819999, -0.96920395, -0.1256)
				fov = 72.0
			}
		}
		dof = $dof_medium02_tod_manager
		crowdoff
	}
]
default_cameras_lose = [
	{
		controlscript = cameracuts_twocam
		params = {
			name = lose
			cam1 = {
				lockto = world
				pos = (-1.7738701, 2.2631419, 2.070564)
				quat = (0.19757299, 0.477018, -0.111905)
				fov = 72.0
			}
			cam2 = {
				lockto = world
				pos = (-4.2446136, 4.020077, 0.17742501)
				quat = (0.214849, 0.45659703, -0.11555701)
				fov = 72.0
			}
		}
		dof = $dof_medium01_tod_manager
	}
]
default_cameras_stagediver = [
	{
		controlscript = cameracuts_handcam
		params = {
			name = stagediver01
			type = stagediver
			lockto = world
			pos = (-4.908679, -0.015424, 6.3657885)
			quat = (-0.06930599, 0.891852, 0.112707995)
			fov = 71.0
		}
		dof = $dof_medium01_tod_manager
		crowdoff
	}
]
default_cameras_boss_closeup_2p = [
	{
		controlscript = cameracuts_handcam
		params = {
			name = boss_closeup_center
			type = boss_closeup
			lockto = world
			pos = (1.9525208, 1.3101209, 5.1531973)
			quat = (0.000106, 0.9994329, -0.033504)
			fov = 72.0
			lookat = bassist
			lookatbone = bone_chest
			screenoffset = (-0.18728602, -0.056658)
		}
		dof = $dof_closeup01_tod_manager
		crowdoff
	}
]
default_cameras_player_closeup_2p = [
	{
		controlscript = cameracuts_handcam
		params = {
			name = player_closeup_center
			type = player_closeup
			lockto = world
			pos = (-1.4694958, 1.3221949, 5.2663136)
			quat = (0.000139, 0.99899393, -0.044736)
			fov = 72.0
			lookat = guitarist
			lookatbone = bone_chest
			screenoffset = (0.132887, 0.027633999)
		}
		dof = $dof_closeup01_tod_manager
		crowdoff
	}
]
default_cameras_2p = [
	{
		name = closeup_01
		type = closeup
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = world
				pos = (-0.17172, 1.7125509, 3.530145)
				quat = (0.030365998, 0.969155, -0.15807201)
				fov = 72.0
			}
			cam2 = {
				lockto = world
				pos = (-0.192414, 0.92213994, 3.5821917)
				quat = (-0.0016310001, 0.98192793, 0.008088)
				fov = 72.0
			}
		}
		dof = $dof_closeup02_tod_manager
	}
]
default_cameras_mid_2p = [
	{
		name = mid_high01
		type = mid_high
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = drummer
				pos = (-0.49241504, 5.681637, 15.161047)
				quat = (0.003945, 0.96217096, -0.27223304)
				fov = 72.0
			}
			cam2 = {
				lockto = drummer
				pos = (-0.358149, 5.6813536, 15.163934)
				quat = (0.003945, 0.96217096, -0.27223304)
				fov = 72.0
			}
		}
		dof = $dof_medium01_tod_manager
	}
	{
		name = mid_low01
		type = mid_low
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = drummer
				pos = (-0.238645, 1.380729, 16.519836)
				quat = (0.002289, 0.993116, -0.116648)
				fov = 72.0
			}
			cam2 = {
				lockto = drummer
				pos = (-0.395918, 1.381063, 16.516504)
				quat = (0.002289, 0.993116, -0.116648)
				fov = 72.0
			}
		}
		dof = $dof_medium01_tod_manager
	}
	{
		controlscript = cameracuts_orbit
		params = {
			name = mid_orbit_ccw01
			type = mid_orbit_ccw
			lockto = drummer
			pos = (5.8004093, 2.342972, 15.428842)
			quat = (0.030534998, -0.968155, 0.16403799)
			fov = 72.0
			orbitangle = -50
		}
		dof = $dof_medium01_tod_manager
	}
	{
		controlscript = cameracuts_orbit
		params = {
			name = mid_orbit_cw01
			type = mid_orbit_cw
			lockto = drummer
			pos = (-3.629889, 2.363242, 15.843865)
			quat = (0.01824, 0.9812179, -0.16114299)
			fov = 72.0
			orbitangle = 50
		}
		dof = $dof_medium01_tod_manager
	}
	{
		name = mid_vert_up01
		type = mid_vert_up
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = drummer
				pos = (3.229095, 1.135073, 16.748884)
				quat = (0.010959, -0.98798496, 0.109562)
				fov = 72.0
			}
			cam2 = {
				lockto = drummer
				pos = (3.107956, 3.7773118, 16.177395)
				quat = (0.020343998, -0.97472, 0.195036)
				fov = 72.0
			}
		}
		dof = $dof_medium01_tod_manager
	}
	{
		name = mid_vert_down01
		type = mid_vert_down
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = drummer
				pos = (3.107956, 3.7773118, 16.177395)
				quat = (0.020343998, -0.97472, 0.195036)
				fov = 72.0
			}
			cam2 = {
				lockto = drummer
				pos = (3.229095, 1.135073, 16.748884)
				quat = (0.010959, -0.98798496, 0.109562)
				fov = 72.0
			}
		}
		dof = $dof_medium01_tod_manager
	}
]
default_cameras_stage_2p = [
	{
		controlscript = cameracuts_handcam
		params = {
			name = stage_high01
			type = stage_high
			lockto = guitarist
			pos = (-0.331379, 2.1398208, -2.9350684)
			quat = (0.21009701, -0.053707, 0.011462)
			fov = 72.0
			lookat = guitarist
			lookatbone = bone_chest
			screenoffset = (-0.283846, -0.06725301)
		}
		dof = $dof_medium01_tod_manager
	}
	{
		controlscript = cameracuts_handcam
		params = {
			name = stage_low01
			type = stage_low
			lockto = guitarist
			pos = (-0.381286, 0.425256, -2.519796)
			quat = (-0.10694, -0.058470998, -0.0063960003)
			fov = 72.0
			lookat = guitarist
			lookatbone = bone_chest
			screenoffset = (-0.365109, -0.27589303)
		}
		dof = $dof_medium01_tod_manager
	}
	{
		controlscript = cameracuts_orbit
		params = {
			name = stage_orbit_ccw01
			type = stage_orbit_ccw
			lockto = guitarist
			pos = (-1.390305, 1.247357, -2.320251)
			quat = (0.043256998, 0.222721, -0.009962)
			fov = 72.0
			lookat = guitarist
			lookatbone = bone_chest
			screenoffset = (-0.22146101, -0.058813)
			orbitangle = -50
		}
		dof = $dof_medium01_tod_manager
	}
	{
		controlscript = cameracuts_orbit
		params = {
			name = stage_orbit_cw01
			type = stage_orbit_cw
			lockto = guitarist
			pos = (1.1497709, 1.5669589, -2.5368068)
			quat = (0.093412, -0.302062, 0.029615)
			fov = 72.0
			lookat = guitarist
			lookatbone = bone_chest
			screenoffset = (-0.118136, -0.017852)
			orbitangle = 50
		}
		dof = $dof_medium01_tod_manager
	}
	{
		name = stage_vert_up01
		type = stage_vert_up
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = guitarist
				pos = (-0.89921296, 0.622014, -2.6956532)
				quat = (-0.072645, 0.017495997, 0.001188)
				fov = 72.0
			}
			cam2 = {
				lockto = guitarist
				pos = (-0.9092429, 2.642869, -2.9914842)
				quat = (0.27269104, 0.016848, -0.0048660003)
				fov = 72.0
			}
		}
		dof = $dof_medium01_tod_manager
	}
	{
		name = stage_vert_down01
		type = stage_vert_down
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = guitarist
				pos = (-0.9092429, 2.642869, -2.9914842)
				quat = (0.27269104, 0.016848, -0.0048660003)
				fov = 72.0
			}
			cam2 = {
				lockto = guitarist
				pos = (-0.89921296, 0.622014, -2.6956532)
				quat = (-0.072645, 0.017495997, 0.001188)
				fov = 72.0
			}
		}
		dof = $dof_medium01_tod_manager
	}
]
default_cameras_guitar_2p = [
	{
		controlscript = cameracuts_handcam
		params = {
			name = guitar_solo_body01
			type = guitar_solo_body
			lockto = guitarist
			locktobone = bone_guitar_body
			pos = (-0.411937, 0.25536898, 0.113419)
			quat = (0.035701, 0.765104, -0.314193)
			fov = 69.0
		}
		dof = $dof_medium01_tod_manager
		crowdoff
	}
	{
		controlscript = cameracuts_handcam
		params = {
			name = guitar_solo_neck01
			type = guitar_solo_neck
			lockto = guitarist
			locktobone = bone_guitar_neck
			pos = (0.6295221, 0.141155, 0.036870994)
			quat = (-0.515311, -0.48547202, 0.643777)
			fov = 59.0
		}
		dof = $dof_medium01_tod_manager
		crowdoff
	}
	{
		controlscript = cameracuts_handcam
		params = {
			name = guitar_closeup01
			type = guitar_closeup
			lockto = guitarist
			pos = (1.2061551, 1.830135, 2.4996212)
			quat = (0.032743998, -0.969021, 0.16408199)
			fov = 23.0
			lookat = guitarist
			lookatbone = bone_guitar_body
			screenoffset = (-0.308609, -0.110810995)
		}
		dof = $dof_medium01_tod_manager
		crowdoff
	}
]
default_cameras_guitarist_2p = [
	{
		controlscript = cameracuts_handcam
		params = {
			name = guitarist_medium01
			type = guitarist_medium
			player = 1
			lockto = guitarist
			pos = (0.568493, 1.413887, 2.069787)
			quat = (0.023573, -0.96751004, 0.103691004)
			fov = 72.0
			lookat = guitarist
			lookatbone = bone_chest
			screenoffset = (0.338886, -0.30280703)
		}
		dof = $dof_closeup01_tod_manager
		crowdoff
	}
	{
		controlscript = cameracuts_handcam
		params = {
			name = guitarist_medium01
			type = guitarist_medium
			player = 2
			lockto = bassist
			pos = (-0.44130397, 1.5022471, 2.1888866)
			quat = (0.015552999, 0.97714204, -0.070612)
			fov = 72.0
			lookat = bassist
			lookatbone = bone_chest
			screenoffset = (-0.35030103, -0.33996502)
		}
		dof = $dof_closeup01_tod_manager
		crowdoff
	}
	{
		controlscript = cameracuts_handcam
		params = {
			name = guitarist_closeup01
			type = guitarist_closeup
			player = 1
			lockto = guitarist
			pos = (0.61056405, 1.2063072, 0.73351)
			quat = (-0.011779, -0.937494, -0.029049)
			fov = 72.0
			lookat = guitarist
			lookatbone = bone_head
			screenoffset = (0.19106, -0.425305)
		}
		dof = $dof_closeup01_tod_manager
		crowdoff
	}
	{
		controlscript = cameracuts_handcam
		params = {
			name = guitarist_closeup01
			type = guitarist_closeup
			player = 2
			lockto = bassist
			pos = (-0.0051089996, 1.621796, 1.1483951)
			quat = (0.0064429995, 0.9916849, -0.044035)
			fov = 72.0
			lookat = bassist
			lookatbone = bone_chest
			screenoffset = (-0.40118998, 0.14046001)
		}
		dof = $dof_closeup01_tod_manager
		crowdoff
	}
	{
		controlscript = cameracuts_orbit
		params = {
			name = guitarist_orbit_ccw01
			type = guitarist_orbit_ccw
			player = 1
			lockto = guitarist
			pos = (0.568493, 1.413887, 2.069787)
			quat = (0.017220998, -0.98019695, 0.108353004)
			fov = 72.0
			lookat = guitarist
			lookatbone = bone_chest
			screenoffset = (0.12937102, -0.33291003)
			orbitangle = -50
		}
		dof = $dof_closeup01_tod_manager
		crowdoff
	}
	{
		controlscript = cameracuts_orbit
		params = {
			name = guitarist_orbit_ccw01
			type = guitarist_orbit_ccw
			player = 2
			lockto = bassist
			pos = (0.474889, 1.3453529, 2.0212908)
			quat = (0.003438, -0.97328895, 0.019135999)
			fov = 72.0
			lookat = bassist
			lookatbone = bone_chest
			screenoffset = (0.36560303, -0.251627)
			orbitangle = -50
		}
		dof = $dof_closeup01_tod_manager
		crowdoff
	}
	{
		controlscript = cameracuts_orbit
		params = {
			name = guitarist_orbit_cw01
			type = guitarist_orbit_cw
			player = 1
			lockto = guitarist
			pos = (-1.046432, 1.384884, 1.9220159)
			quat = (0.029545998, 0.958008, -0.102428995)
			fov = 72.0
			lookat = guitarist
			lookatbone = bone_chest
			screenoffset = (-0.24229202, -0.33644602)
			orbitangle = 50
		}
		dof = $dof_closeup01_tod_manager
		crowdoff
	}
	{
		controlscript = cameracuts_orbit
		params = {
			name = guitarist_orbit_cw01
			type = guitarist_orbit_cw
			player = 2
			lockto = bassist
			pos = (-1.410602, 1.3496668, 1.465308)
			quat = (0.0070640002, 0.950463, -0.018121999)
			fov = 72.0
			lookat = bassist
			lookatbone = bone_chest
			screenoffset = (0.161898, -0.25292102)
			orbitangle = 50
		}
		dof = $dof_closeup01_tod_manager
		crowdoff
	}
	{
		name = guitarist_vert_up01
		type = guitarist_vert_up
		player = 1
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = guitarist
				pos = (0.488286, 0.30742103, 2.617984)
				quat = (-0.016588999, -0.98285997, -0.09915401)
				fov = 72.0
			}
			cam2 = {
				lockto = guitarist
				pos = (0.59022295, 2.1093469, 2.9224093)
				quat = (0.040925, -0.95809203, 0.201243)
				fov = 72.0
			}
		}
		dof = $dof_closeup02_tod_manager
		crowdoff
	}
	{
		name = guitarist_vert_up01
		type = guitarist_vert_up
		player = 2
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = bassist
				pos = (0.858407, 0.2837, 2.433893)
				quat = (-0.0040740003, -0.99326897, -0.11267199)
				fov = 72.0
			}
			cam2 = {
				lockto = bassist
				pos = (0.883989, 3.015893, 2.6785629)
				quat = (0.00117, -0.95310104, 0.302564)
				fov = 72.0
			}
		}
		dof = $dof_closeup02_tod_manager
		crowdoff
	}
	{
		name = guitarist_vert_down01
		type = guitarist_vert_down
		player = 1
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = guitarist
				pos = (0.59022295, 2.1093469, 2.9224093)
				quat = (0.040925, -0.95809203, 0.201243)
				fov = 72.0
			}
			cam2 = {
				lockto = guitarist
				pos = (0.488286, 0.30742103, 2.617984)
				quat = (-0.016588999, -0.98285997, -0.09915401)
				fov = 72.0
			}
		}
		dof = $dof_closeup02_tod_manager
		crowdoff
	}
	{
		name = guitarist_vert_down01
		type = guitarist_vert_down
		player = 2
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = bassist
				pos = (0.883989, 3.015893, 2.6785629)
				quat = (0.00117, -0.95310104, 0.302564)
				fov = 72.0
			}
			cam2 = {
				lockto = bassist
				pos = (0.858407, 0.2837, 2.433893)
				quat = (-0.0040740003, -0.99326897, -0.11267199)
				fov = 72.0
			}
		}
		dof = $dof_closeup02_tod_manager
		crowdoff
	}
]
default_cameras_singer_2p = [
	{
		controlscript = cameracuts_handcam
		params = {
			name = singer_medium01
			type = singer_medium
			lockto = vocalist
			pos = (0.76937497, 1.058248, 2.108929)
			quat = (0.0024680002, -0.975066, 0.015652)
			fov = 72.0
			lookat = vocalist
			lookatbone = bone_chest
			screenoffset = (0.38290703, -0.371808)
		}
		dof = $dof_closeup01_tod_manager
		crowdoff
	}
	{
		controlscript = cameracuts_handcam
		params = {
			name = singer_closeup01
			type = singer_closeup
			lockto = vocalist
			pos = (0.51758003, 1.618211, 0.616831)
			quat = (0.012169001, -0.9712839, 0.055753)
			fov = 72.0
			lookat = vocalist
			lookatbone = bone_head
			screenoffset = (0.417869, -0.345862)
		}
		dof = $dof_closeup01_tod_manager
		crowdoff
	}
	{
		controlscript = cameracuts_orbit
		params = {
			name = singer_orbit_ccw01
			type = singer_orbit_ccw
			lockto = vocalist
			pos = (1.064897, 1.4607079, 1.941088)
			quat = (0.02007, -0.96802, 0.087443)
			fov = 72.0
			lookat = vocalist
			lookatbone = bone_chest
			screenoffset = (0.230507, -0.35726503)
			orbitangle = -50
		}
		dof = $dof_closeup01_tod_manager
		crowdoff
	}
	{
		controlscript = cameracuts_orbit
		params = {
			name = singer_orbit_cw01
			type = singer_orbit_cw
			lockto = vocalist
			pos = (-0.99324894, 1.5038509, 1.7319051)
			quat = (0.032038998, 0.937449, -0.086307)
			fov = 72.0
			lookat = vocalist
			lookatbone = bone_chest
			screenoffset = (-0.298856, -0.31489903)
			orbitangle = 50
		}
		dof = $dof_closeup01_tod_manager
		crowdoff
	}
	{
		name = singer_vert_up01
		type = singer_vert_up
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = vocalist
				pos = (0.20753399, 0.27587602, 2.459351)
				quat = (-0.017328998, -0.9836369, -0.119853005)
				fov = 72.0
			}
			cam2 = {
				lockto = vocalist
				pos = (0.264459, 2.7206302, 2.661429)
				quat = (0.038757, -0.95208496, 0.26838097)
				fov = 72.0
			}
		}
		dof = $dof_closeup02_tod_manager
		crowdoff
	}
	{
		name = singer_vert_down01
		type = singer_vert_down
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = vocalist
				pos = (0.264459, 2.7206302, 2.661429)
				quat = (0.038757, -0.95208496, 0.26838097)
				fov = 72.0
			}
			cam2 = {
				lockto = vocalist
				pos = (0.20753399, 0.27587602, 2.459351)
				quat = (-0.017328998, -0.9836369, -0.119853005)
				fov = 72.0
			}
		}
		dof = $dof_closeup02_tod_manager
		crowdoff
	}
]
default_cameras_bassist_2p = [
	{
		controlscript = cameracuts_handcam
		params = {
			name = bassist_medium01
			type = bassist_medium
			lockto = bassist
			pos = (-0.44130397, 1.5022471, 2.1888866)
			quat = (0.015552999, 0.97714204, -0.070612)
			fov = 72.0
			lookat = bassist
			lookatbone = bone_chest
			screenoffset = (-0.35030103, -0.33996502)
		}
		dof = $dof_closeup01_tod_manager
		crowdoff
	}
	{
		controlscript = cameracuts_handcam
		params = {
			name = bassist_closeup01
			type = bassist_closeup
			lockto = bassist
			pos = (-0.0051089996, 1.621796, 1.1483951)
			quat = (0.0064429995, 0.9916849, -0.044035)
			fov = 72.0
			lookat = bassist
			lookatbone = bone_chest
			screenoffset = (-0.40118998, 0.14046001)
		}
		dof = $dof_closeup01_tod_manager
		crowdoff
	}
	{
		controlscript = cameracuts_orbit
		params = {
			name = bassist_orbit_ccw01
			type = bassist_orbit_ccw
			lockto = bassist
			pos = (0.474889, 1.3453529, 2.0212908)
			quat = (0.003438, -0.97328895, 0.019135999)
			fov = 72.0
			lookat = bassist
			lookatbone = bone_chest
			screenoffset = (0.36560303, -0.251627)
			orbitangle = -50
		}
		dof = $dof_closeup01_tod_manager
		crowdoff
	}
	{
		controlscript = cameracuts_orbit
		params = {
			name = bassist_orbit_cw01
			type = bassist_orbit_cw
			lockto = bassist
			pos = (-1.410602, 1.3496668, 1.465308)
			quat = (0.0070640002, 0.950463, -0.018121999)
			fov = 72.0
			lookat = bassist
			lookatbone = bone_chest
			screenoffset = (0.161898, -0.25292102)
			orbitangle = 50
		}
		dof = $dof_closeup01_tod_manager
		crowdoff
	}
	{
		name = bassist_vert_up01
		type = bassist_vert_up
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = bassist
				pos = (0.858407, 0.2837, 2.433893)
				quat = (-0.0040740003, -0.99326897, -0.11267199)
				fov = 72.0
			}
			cam2 = {
				lockto = bassist
				pos = (0.883989, 3.015893, 2.6785629)
				quat = (0.00117, -0.95310104, 0.302564)
				fov = 72.0
			}
		}
		dof = $dof_closeup02_tod_manager
		crowdoff
	}
	{
		name = bassist_vert_down01
		type = bassist_vert_down
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = bassist
				pos = (0.883989, 3.015893, 2.6785629)
				quat = (0.00117, -0.95310104, 0.302564)
				fov = 72.0
			}
			cam2 = {
				lockto = bassist
				pos = (0.858407, 0.2837, 2.433893)
				quat = (-0.0040740003, -0.99326897, -0.11267199)
				fov = 72.0
			}
		}
		dof = $dof_closeup02_tod_manager
		crowdoff
	}
]
default_cameras_rhythm_2p = [
	{
		controlscript = cameracuts_handcam
		params = {
			name = rhythm_medium01
			type = rhythm_medium
			lockto = world
			pos = (-2.303154, 0.764982, 4.8603663)
			quat = (-0.012736999, 0.9809339, 0.112639)
			fov = 72.0
			lookat = rhythm
			lookatbone = bone_chest
			screenoffset = (-0.40689602, -0.21984601)
		}
		dof = $dof_closeup01_tod_manager
		crowdoff
	}
	{
		controlscript = cameracuts_handcam
		params = {
			name = rhythm_closeup01
			type = rhythm_closeup
			lockto = world
			pos = (-1.700512, 0.235937, 4.5619025)
			quat = (-0.074879, -0.929315, -0.231359)
			fov = 72.0
			lookat = rhythm
			lookatbone = bone_chest
			screenoffset = (0.39920303, -0.28451303)
		}
		dof = $dof_closeup01_tod_manager
		crowdoff
	}
	{
		controlscript = cameracuts_orbit
		params = {
			name = rhythm_orbit_ccw01
			type = rhythm_orbit_ccw
			lockto = bassist
			pos = (-0.8169869, 1.8065109, 1.984302)
			quat = (0.049500998, 0.95019, -0.207611)
			fov = 72.0
			lookat = rhythm
			lookatbone = bone_chest
			screenoffset = (-0.087603, -0.23554099)
			orbitangle = -50
		}
		dof = $dof_closeup01_tod_manager
		crowdoff
	}
	{
		controlscript = cameracuts_orbit
		params = {
			name = rhythm_orbit_cw01
			type = rhythm_orbit_cw
			lockto = bassist
			pos = (-0.8169869, 1.8065109, 1.984302)
			quat = (0.049500998, 0.95019, -0.207611)
			fov = 72.0
			lookat = rhythm
			lookatbone = bone_chest
			screenoffset = (-0.087603, -0.23554099)
			orbitangle = 50
		}
		dof = $dof_closeup01_tod_manager
		crowdoff
	}
	{
		name = rhythm_vert_up01
		type = rhythm_vert_up
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = world
				pos = (-0.17172, 1.7125509, 3.530145)
				quat = (0.030365998, 0.969155, -0.15807201)
				fov = 72.0
			}
			cam2 = {
				lockto = world
				pos = (-0.192414, 0.92213994, 3.5821917)
				quat = (-0.0016310001, 0.98192793, 0.008088)
				fov = 72.0
			}
		}
		dof = $dof_closeup02_tod_manager
		crowdoff
	}
	{
		name = rhythm_vert_down01
		type = rhythm_vert_down
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = world
				pos = (-0.17172, 1.7125509, 3.530145)
				quat = (0.030365998, 0.969155, -0.15807201)
				fov = 72.0
			}
			cam2 = {
				lockto = world
				pos = (-0.192414, 0.92213994, 3.5821917)
				quat = (-0.0016310001, 0.98192793, 0.008088)
				fov = 72.0
			}
		}
		dof = $dof_closeup02_tod_manager
		crowdoff
	}
]
default_cameras_dolly_2p = [
	{
		name = dolly_rear_l01
		type = dolly_rear_l
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = guitarist
				pos = (-4.226099, 2.76196, -2.4963582)
				quat = (0.216053, 0.382162, -0.092458)
				fov = 72.0
			}
			cam2 = {
				lockto = guitarist
				pos = (0.834532, 2.6632998, -3.10608)
				quat = (0.19763198, -0.258669, 0.054020002)
				fov = 72.0
			}
		}
		dof = $dof_medium01_tod_manager
	}
	{
		name = dolly_rear_r01
		type = dolly_rear_r
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = guitarist
				pos = (0.834532, 2.6632998, -3.10608)
				quat = (0.19763198, -0.258669, 0.054020002)
				fov = 72.0
			}
			cam2 = {
				lockto = guitarist
				pos = (-4.226099, 2.76196, -2.4963582)
				quat = (0.216053, 0.382162, -0.092458)
				fov = 72.0
			}
		}
		dof = $dof_medium01_tod_manager
	}
	{
		name = dolly_front_l01
		type = dolly_front_l
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = guitarist
				pos = (1.881293, 2.3065019, 4.1567903)
				quat = (0.054615, -0.940841, 0.18255)
				fov = 72.0
			}
			cam2 = {
				lockto = guitarist
				pos = (-3.5599792, 2.2152371, 4.445907)
				quat = (0.034560997, 0.964024, -0.15983601)
				fov = 72.0
			}
		}
		dof = $dof_medium01_tod_manager
	}
	{
		name = dolly_front_r01
		type = dolly_front_r
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = guitarist
				pos = (-3.5599792, 2.2152371, 4.445907)
				quat = (0.034560997, 0.964024, -0.15983601)
				fov = 72.0
			}
			cam2 = {
				lockto = guitarist
				pos = (1.881293, 2.3065019, 4.1567903)
				quat = (0.054615, -0.940841, 0.18255)
				fov = 72.0
			}
		}
		dof = $dof_medium01_tod_manager
	}
]
default_cameras_pan_2p = [
	{
		name = pan_guitarist_singer01
		type = pan_guitarist_singer
		controlscript = cameracuts_pan
		params = {
			cam1 = {
				lockto = guitarist
				pos = (0.221304, 1.2147759, 1.6710881)
				quat = (-1E-06, 0.99944097, -0.006206)
				fov = 62.0
				lookat = guitarist
				lookatbone = bone_chest
				screenoffset = (-0.42091504, 0.147356)
			}
			cam2 = {
				lockto = vocalist
				pos = (2.1242719, 1.214955, 1.3240658)
				quat = (0.0031050001, -0.880311, 0.0054469993)
				fov = 62.0
				lookat = vocalist
				lookatbone = bone_chest
				screenoffset = (0.358489, -0.170862)
			}
		}
		dof = $dof_closeup01_tod_manager
	}
	{
		name = pan_singer_guitarist01
		type = pan_singer_guitarist
		controlscript = cameracuts_pan
		params = {
			cam1 = {
				lockto = vocalist
				pos = (2.1242719, 1.214955, 1.3240658)
				quat = (0.0031050001, -0.880311, 0.0054469993)
				fov = 62.0
				lookat = vocalist
				lookatbone = bone_chest
				screenoffset = (0.358489, -0.170862)
			}
			cam2 = {
				lockto = guitarist
				pos = (0.221304, 1.2147759, 1.6710881)
				quat = (-1E-06, 0.99944097, -0.006206)
				fov = 62.0
				lookat = guitarist
				lookatbone = bone_chest
				screenoffset = (-0.42091504, 0.147356)
			}
		}
		dof = $dof_closeup01_tod_manager
	}
]
default_cameras_zoom_2p = [
	{
		name = zoom_out_slow01
		type = zoom_out_slow
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = guitarist
				pos = (-0.608687, 4.565676, 12.706401)
				quat = (-0.0014460001, 0.99146694, -0.13027)
				fov = 7.0
				lookat = guitarist
				lookatbone = bone_chest
				screenoffset = (0.37269202, 0.11745)
			}
			cam2 = {
				lockto = guitarist
				pos = (-0.608687, 4.565676, 12.706401)
				quat = (0.012666, -0.979612, 0.193192)
				fov = 52.0
				lookat = guitarist
				lookatbone = bone_chest
				screenoffset = (0.303226, -0.470842)
			}
		}
		dof = $dof_medium01_tod_manager
	}
	{
		name = zoom_out_fast01
		type = zoom_out_fast
		controlscript = cameracuts_quickzoom
		params = {
			cam1 = {
				lockto = guitarist
				pos = (-0.608687, 4.565676, 12.706401)
				quat = (-0.0014460001, 0.99146694, -0.13027)
				fov = 7.0
				lookat = guitarist
				lookatbone = bone_chest
				screenoffset = (0.37269202, 0.11745)
			}
			cam2 = {
				lockto = guitarist
				pos = (-0.608687, 4.565676, 12.706401)
				quat = (0.012666, -0.979612, 0.193192)
				fov = 52.0
				lookat = guitarist
				lookatbone = bone_chest
				screenoffset = (0.303226, -0.470842)
			}
		}
		dof = $dof_medium02_tod_manager
	}
	{
		name = zoom_in_slow01
		type = zoom_in_slow
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = guitarist
				pos = (-0.608687, 4.565676, 12.706401)
				quat = (0.012666, -0.979612, 0.193192)
				fov = 52.0
				lookat = guitarist
				lookatbone = bone_chest
				screenoffset = (0.303226, -0.470842)
			}
			cam2 = {
				lockto = guitarist
				pos = (-0.608687, 4.565676, 12.706401)
				quat = (-0.0014460001, 0.99146694, -0.13027)
				fov = 7.0
				lookat = guitarist
				lookatbone = bone_chest
				screenoffset = (0.37269202, 0.11745)
			}
		}
		dof = $dof_medium01_tod_manager
	}
	{
		name = zoom_in_fast01
		type = zoom_in_fast
		controlscript = cameracuts_quickzoom
		params = {
			cam1 = {
				lockto = guitarist
				pos = (-0.608687, 4.565676, 12.706401)
				quat = (0.012666, -0.979612, 0.193192)
				fov = 52.0
				lookat = guitarist
				lookatbone = bone_chest
				screenoffset = (0.303226, -0.470842)
			}
			cam2 = {
				lockto = guitarist
				pos = (-0.608687, 4.565676, 12.706401)
				quat = (-0.0014460001, 0.99146694, -0.13027)
				fov = 7.0
				lookat = guitarist
				lookatbone = bone_chest
				screenoffset = (0.37269202, 0.11745)
			}
		}
		dof = $dof_medium02_tod_manager
	}
]
default_cameras_special_2p = [
	{
		name = special01
		type = special_a
		controlscript = cameracuts_threepos
		params = {
			cam1 = {
				lockto = guitarist
				pos = (7.91994, 4.0722446, 15.780664)
				quat = (0.043356, -0.954315, 0.156901)
				fov = 52.0
			}
			cam2 = {
				lockto = guitarist
				pos = (4.605281, 1.9775009, 9.89547)
				quat = (0.037202, -0.957874, 0.13346401)
				fov = 52.0
			}
			cam3 = {
				lockto = guitarist
				pos = (1.5902342, 1.2208471, 4.5518465)
				quat = (0.016259, -0.9656329, 0.053746)
				fov = 52.0
			}
		}
	}
	{
		controlscript = cameracuts_orbitandmorphtwocam
		params = {
			name = special02
			type = special_b
			orbitangle = 90
			cam1 = {
				lockto = guitarist
				pos = (-3.7134671, 1.561098, 5.2489767)
				quat = (0.022261, 0.94396603, -0.111006)
				fov = 72.0
			}
			cam2 = {
				lockto = guitarist
				pos = (-1.6345519, 0.98434895, 2.433505)
				quat = (-0.013397, 0.950469, -0.0021470003)
				fov = 72.0
			}
		}
	}
	{
		controlscript = cameracuts_orbitandmorphtwocam
		params = {
			name = special03
			type = special_c
			orbitangle = -40
			cam1 = {
				lockto = guitarist
				pos = (2.1238008, 3.287695, 5.0177402)
				quat = (0.076614, -0.92003894, 0.22002399)
				fov = 72.0
			}
			cam2 = {
				lockto = guitarist
				pos = (0.615803, 1.9095379, 2.403839)
				quat = (0.043414995, -0.957317, 0.186884)
				fov = 72.0
			}
		}
	}
	{
		controlscript = cameracuts_specialstepmove
		params = {
			name = special04
			type = special_d
			cam1 = {
				lockto = guitarist
				pos = (3.3718438, 1.241465, 7.8585925)
				quat = (0.017955, -0.950063, 0.048733)
				fov = 52.0
			}
			cam2 = {
				lockto = guitarist
				pos = (3.3718438, 1.241465, 7.8585925)
				quat = (0.017955, -0.950063, 0.048733)
				fov = 52.0
			}
			steptime = 6.0
			finalrottime = 1.0
			stepnum = 6.0
			stepdir = (0.0, 0.07, 0.05)
			dof = $dof_off_tod_manager
		}
	}
]
default_cameras_mocap_2p = [
	{
		controlscript = cameracuts_handcam
		params = {
			name = mocap01
			type = mocap
			lockto = guitarist
			pos = (-0.24607702, 3.316178, 0.92423993)
			quat = (0.021933999, 0.868847, -0.49323303)
			fov = 72.0
		}
		dof = $dof_medium01_tod_manager
	}
	{
		controlscript = cameracuts_handcam
		params = {
			name = mocap02
			type = mocap
			lockto = vocalist
			pos = (0.0024010001, 3.3782017, 1.199096)
			quat = (0.009012999, 0.84305805, -0.53760797)
			fov = 72.0
		}
		dof = $dof_medium01_tod_manager
	}
	{
		controlscript = cameracuts_handcam
		params = {
			name = mocap03
			type = mocap
			lockto = bassist
			pos = (-0.0057200002, 3.355163, 2.1156142)
			quat = (0.008965001, 0.8438061, -0.53643596)
			fov = 72.0
		}
		dof = $dof_medium01_tod_manager
	}
	{
		controlscript = cameracuts_handcam
		params = {
			name = mocap04
			type = mocap
			lockto = drummer
			pos = (0.107346, 3.4477382, 1.783761)
			quat = (0.008895, 0.84684604, -0.53162295)
			fov = 72.0
		}
		dof = $dof_medium01_tod_manager
	}
]
default_cameras_stagedive_2p = [
	{
		controlscript = cameracuts_handcam
		params = {
			name = stagediver01
			type = stagediver
			lockto = world
			pos = (0.161384, -0.255694, 7.6203847)
			quat = (-0.019520998, 0.9806339, 0.12749502)
			fov = 72.0
		}
		dof = $dof_medium01_tod_manager
		crowdoff
	}
]
default_cameras_starpower_2p = [
	{
		name = starpower
		type = starpower
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = world
				pos = (2.58572, 1.1694639, 6.018505)
				quat = (-0.001818, -0.97748, 0.008785)
				fov = 72.0
				lookat = guitarist
				lookatbone = bone_chest
				screenoffset = (0.33652902, -0.198419)
			}
			cam2 = {
				lockto = world
				pos = (2.126417, 1.151183, 5.003499)
				quat = (-0.003998, -0.97537994, -0.0012250001)
				fov = 104.0
				lookat = guitarist
				lookatbone = bone_chest
				screenoffset = (0.43471202, -0.20290701)
			}
			dof = $dof_closeup02_tod_manager
			crowdoff
		}
	}
]
default_cameras_intro_2p = [
	{
		name = intro
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = guitarist
				pos = (2.027228, 3.356204, 10.107616)
				quat = (0.034807995, -0.963447, 0.206313)
				fov = 72.0
			}
			cam2 = {
				lockto = guitarist
				pos = (0.310654, 1.548265, 5.166498)
				quat = (0.018204998, -0.979563, 0.114463)
				fov = 72.0
			}
		}
		dof = $dof_medium01_tod_manager
	}
]
default_cameras_fastintro_2p = [
	{
		name = fastintro
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = guitarist
				pos = (2.027228, 3.356204, 10.107616)
				quat = (0.034807995, -0.963447, 0.206313)
				fov = 72.0
			}
			cam2 = {
				lockto = guitarist
				pos = (0.310654, 1.548265, 5.166498)
				quat = (0.018204998, -0.979563, 0.114463)
				fov = 72.0
			}
		}
		dof = $dof_medium01_tod_manager
		crowdoff
	}
]
default_cameras_boss_2p = [
	{
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = guitarist
				pos = (2.027228, 3.356204, 10.107616)
				quat = (0.034807995, -0.963447, 0.206313)
				fov = 72.0
			}
			cam2 = {
				lockto = guitarist
				pos = (0.310654, 1.548265, 5.166498)
				quat = (0.018204998, -0.979563, 0.114463)
				fov = 72.0
			}
		}
		dof = $dof_medium01_tod_manager
		crowdoff
	}
]
default_cameras_encore_2p = [
	{
		name = encore
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = guitarist
				pos = (0.310654, 1.548265, 5.166498)
				quat = (0.018204998, -0.979563, 0.114463)
				fov = 72.0
			}
			cam2 = {
				lockto = guitarist
				pos = (2.027228, 3.356204, 10.107616)
				quat = (0.034807995, -0.963447, 0.206313)
				fov = 72.0
			}
		}
		dof = $dof_medium01_tod_manager
	}
]
default_cameras_walk_2p = [
	{
		controlscript = cameracuts_handcam
		params = {
			name = walk01
			type = walk
			lockto = world
			pos = (-4.908679, -0.015424, 6.3657885)
			quat = (-0.06930599, 0.891852, 0.112707995)
			fov = 71.0
		}
		dof = $dof_medium01_tod_manager
		crowdoff
	}
]
default_cameras_win_2p = [
	{
		controlscript = cameracuts_orbitandmorphtwocam
		params = {
			name = win
			orbitangle = 10
			cam1 = {
				lockto = guitarist
				pos = (0.206255, 0.082557, 3.0024462)
				quat = (-0.030819999, -0.96920395, -0.1256)
				fov = 72.0
			}
			cam2 = {
				lockto = guitarist
				pos = (0.96568394, -0.40605003, 4.6806836)
				quat = (-0.030819999, -0.96920395, -0.1256)
				fov = 72.0
			}
		}
		dof = $dof_medium02_tod_manager
		crowdoff
	}
]
default_cameras_lose_2p = [
	{
		controlscript = cameracuts_twocam
		params = {
			name = lose
			cam1 = {
				lockto = world
				pos = (-1.7738701, 2.2631419, 2.070564)
				quat = (0.19757299, 0.477018, -0.111905)
				fov = 72.0
			}
			cam2 = {
				lockto = world
				pos = (-4.2446136, 4.020077, 0.17742501)
				quat = (0.214849, 0.45659703, -0.11555701)
				fov = 72.0
			}
		}
		dof = $dof_medium01_tod_manager
	}
]
default_cameras_boss_battle_2p = [
	{
		controlscript = cameracuts_handcam
		params = {
			name = player_closeup01
			type = player_closeup
			lockto = guitarist
			pos = (0.61056405, 1.2063072, 0.73351)
			quat = (-0.011779, -0.937494, -0.029049)
			fov = 72.0
			lookat = guitarist
			lookatbone = bone_head
			screenoffset = (0.19106, -0.425305)
		}
		dof = $dof_closeup01_tod_manager
		crowdoff
	}
	{
		controlscript = cameracuts_handcam
		params = {
			name = boss_closeup01
			type = boss_closeup
			lockto = bassist
			pos = (-0.145081, 1.3932941, 1.119517)
			quat = (-0.0023100001, 0.9869389, 0.020386)
			fov = 72.0
			lookat = bassist
			lookatbone = bone_head
			screenoffset = (-0.36468503, -0.38086903)
		}
		dof = $dof_closeup01_tod_manager
		crowdoff
	}
]
