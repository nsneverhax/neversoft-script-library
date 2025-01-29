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
		midinote = 77
		scr = cameracuts_enablechangecam
		params = {
			enable = true
		}
	}
	{
		midinote = 78
		scr = cameracuts_enablechangecam
		params = {
			enable = false
		}
	}
	{
		midinote = 79
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras'
			changenow
		}
	}
	{
		midinote = 80
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_intro'
			changenow
		}
	}
	{
		midinote = 81
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_solo'
			selectguitartype
			changenow
		}
	}
	{
		midinote = 82
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_dolly'
			changenow
			name = dolly_stagefront
		}
	}
	{
		midinote = 83
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_zoom'
			changenow
		}
	}
	{
		midinote = 84
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras'
			changenow
			type = closeup
		}
	}
	{
		midinote = 85
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras'
			changenow
			type = mid
		}
	}
	{
		midinote = 86
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras'
			changenow
			type = longshot
		}
	}
	{
		midinote = 87
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras'
			changenow
			type = stage
		}
	}
	{
		midinote = 88
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_singer'
			changenow
		}
	}
	{
		midinote = 89
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_drummer'
			changenow
		}
	}
	{
		midinote = 90
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_solo'
			selectguitartype
			changenow
		}
	}
	{
		midinote = 91
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_orbit'
			changenow
			name = orbit_stage
		}
	}
	{
		midinote = 92
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_orbit'
			changenow
			name = orbit_drummer
		}
	}
	{
		midinote = 93
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_orbit'
			changenow
			name = orbit_closeup
		}
	}
	{
		midinote = 94
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_orbit'
			changenow
			name = orbit_mid
		}
	}
	{
		midinote = 95
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_guitar_closeup'
			changenow
			name = guitar_closeup
		}
	}
	{
		midinote = 96
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_starpower'
			changenow
		}
	}
	{
		midinote = 97
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_bassist'
			changenow
		}
	}
	{
		midinote = 98
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_walk'
			changenow
		}
	}
	{
		midinote = 99
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_vert_guitarist'
			changenow
		}
	}
	{
		midinote = 100
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_vert_drummer'
			changenow
		}
	}
	{
		midinote = 101
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_vert_stagefront'
			changenow
		}
	}
	{
		midinote = 102
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_vert_stagerear'
			changenow
		}
	}
	{
		midinote = 103
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_orbit'
			changenow
			name = orbit_singer
		}
	}
	{
		midinote = 104
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_singer_closeup'
			changenow
		}
	}
	{
		midinote = 105
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_special'
			changenow
		}
	}
	{
		midinote = 106
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_special'
			changenow
			name = special01
		}
	}
	{
		midinote = 107
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_special'
			changenow
			name = special02
		}
	}
	{
		midinote = 108
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_special'
			changenow
			name = special03
		}
	}
	{
		midinote = 109
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_special'
			changenow
			name = special04
		}
	}
	{
		midinote = 110
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_dolly'
			changenow
			name = dolly_stagerear
		}
	}
	{
		midinote = 111
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_zoom_slow'
			changenow
		}
	}
	{
		midinote = 112
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_zoom_fast'
			changenow
		}
	}
	{
		midinote = 113
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_zoom_out'
			changenow
		}
	}
	{
		midinote = 114
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_pan'
			changenow
		}
	}
	{
		midinote = 115
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_boss_closeup'
			changenow
		}
	}
	{
		midinote = 116
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_player_closeup'
			changenow
		}
	}
	{
		midinote = 117
		scr = cameracuts_setarrayprefix
		params = {
			prefix = 'cameras_stagedive'
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
			camera_time = RandomRange (3.0, 8.0)
			getsongtimems
			endtime = (<time> + <camera_time> * 1000)
			cameracuts_getnextdownbeat endtime = <endtime>
			camera_time = ((<endtime> - <time>) / 1000.0)
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

script cameracuts_handcam \{name = none}
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
default_cameras_good = [
	{
		name = good_from_stage
		play_hold = 1
		lockto = guitarist
		pos = (1.5175159, 4.1361775, -4.089658)
		quat = (0.130047, -0.018706, 0.0024160002)
		fov = 72.0
	}
	{
		name = good_center_stage
		play_hold = 1
		lockto = guitarist
		pos = (2.102435, 1.999219, 7.695495)
		quat = (-2.6E-05, 0.9999869, -0.0043200003)
		fov = 72.0
	}
	{
		name = good_stage_left
		play_hold = 1
		lockto = guitarist
		pos = (8.62121, 4.4717703, 6.8967915)
		quat = (0.093209006, -0.903863, 0.254238)
		fov = 72.0
	}
	{
		name = good_stage_right
		play_hold = 1
		lockto = guitarist
		pos = (-7.182758, 2.553803, 8.634896)
		quat = (0.048714, 0.90134895, -0.105318)
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
	{
		name = normal_crowd_right
		play_hold = 1
		lockto = guitarist
		pos = (10.656881, 1.486412, 12.041036)
		quat = (0.00589, -0.95563596, 0.019026998)
		fov = 72.0
	}
	{
		name = normal_crowd_left
		play_hold = 1
		lockto = guitarist
		pos = (-4.8624063, 1.3204769, 14.310162)
		quat = (0.001153, 0.98261094, -0.006309)
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
	{
		name = poor_crowd_right
		play_hold = 1
		lockto = guitarist
		pos = (10.420851, 1.5101589, 18.768383)
		quat = (-0.0024040001, -0.97147197, -0.010015999)
		fov = 72.0
	}
	{
		name = poor_crowd_left
		play_hold = 1
		lockto = guitarist
		pos = (-9.160233, 1.604391, 20.10081)
		quat = (-0.0018660001, 0.984061, 0.010129999)
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
default_cameras_dolly = [
	{
		name = dolly_stagefront
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = world
				pos = (-2.467382, 1.2211041, 2.731025)
				quat = (0.027345998, 0.774946, -0.033513)
				fov = 72.0
			}
			cam2 = {
				lockto = world
				pos = (5.1025147, 1.024014, 1.060797)
				quat = (-0.021949, -0.780419, -0.026007999)
				fov = 72.0
			}
		}
	}
	{
		name = dolly_stagerear
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = world
				pos = (-2.467382, 1.2211041, 2.731025)
				quat = (0.027345998, 0.774946, -0.033513)
				fov = 72.0
			}
			cam2 = {
				lockto = world
				pos = (5.1025147, 1.024014, 1.060797)
				quat = (-0.021949, -0.780419, -0.026007999)
				fov = 72.0
			}
		}
	}
]
default_cameras_zoom = [
	{
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = world
				pos = (-2.467382, 1.2211041, 2.731025)
				quat = (0.027345998, 0.774946, -0.033513)
				fov = 72.0
			}
			cam2 = {
				lockto = world
				pos = (5.1025147, 1.024014, 1.060797)
				quat = (-0.021949, -0.780419, -0.026007999)
				fov = 72.0
			}
		}
	}
]
default_cameras_zoom_fast = [
	{
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = world
				pos = (-2.467382, 1.2211041, 2.731025)
				quat = (0.027345998, 0.774946, -0.033513)
				fov = 72.0
			}
			cam2 = {
				lockto = world
				pos = (5.1025147, 1.024014, 1.060797)
				quat = (-0.021949, -0.780419, -0.026007999)
				fov = 72.0
			}
		}
	}
]
default_cameras_zoom_slow = [
	{
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = world
				pos = (-2.467382, 1.2211041, 2.731025)
				quat = (0.027345998, 0.774946, -0.033513)
				fov = 72.0
			}
			cam2 = {
				lockto = world
				pos = (5.1025147, 1.024014, 1.060797)
				quat = (-0.021949, -0.780419, -0.026007999)
				fov = 72.0
			}
		}
	}
]
default_cameras_zoom_out = [
	{
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = world
				pos = (-2.467382, 1.2211041, 2.731025)
				quat = (0.027345998, 0.774946, -0.033513)
				fov = 72.0
			}
			cam2 = {
				lockto = world
				pos = (5.1025147, 1.024014, 1.060797)
				quat = (-0.021949, -0.780419, -0.026007999)
				fov = 72.0
			}
		}
	}
]
default_cameras_pan = [
	{
		controlscript = cameracuts_pan
		params = {
			cam1 = {
				lockto = world
				pos = (-2.467382, 1.2211041, 2.731025)
				quat = (0.027345998, 0.774946, -0.033513)
				fov = 72.0
			}
			cam2 = {
				lockto = world
				pos = (5.1025147, 1.024014, 1.060797)
				quat = (-0.021949, -0.780419, -0.026007999)
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
default_cameras_guitar_closeup = [
	{
		controlscript = cameracuts_handcam
		params = {
			lockto = world
			lookat = guitarist
			lookatbone = bone_guitar_body
			pos = (-0.073745, 0.7753869, 0.023635)
			quat = (0.047147997, -0.9942729, -0.005626)
			fov = 72.0
		}
		dof = $dof_closeup01_tod_manager
	}
]
default_cameras_drummer = [
	{
		controlscript = cameracuts_handcam
		params = {
			name = drummer_center
			lockto = world
			pos = (-3.3800898, 1.184646, -5.141132)
			quat = (0.00305, -0.97887796, 0.013742999)
			fov = 85.0
		}
		dof = $dof_closeup02_tod_manager
	}
]
default_cameras_singer = [
	{
		controlscript = cameracuts_handcam
		params = {
			name = singer_left
			lockto = world
			pos = (-6.321385, 0.924312, -2.6622968)
			quat = (-0.026229998, 0.784364, 0.032947995)
			fov = 72.0
		}
		dof = $dof_closeup01_tod_manager
	}
	{
		controlscript = cameracuts_handcam
		params = {
			name = singer_center
			lockto = world
			pos = (-4.3443885, 0.950269, -0.84059906)
			quat = (1.9E-05, 0.99112797, -0.001512)
			fov = 72.0
		}
		dof = $dof_closeup01_tod_manager
	}
	{
		controlscript = cameracuts_handcam
		params = {
			name = singer_right
			lockto = world
			pos = (-1.543603, 0.87668294, -1.361017)
			quat = (-0.008355001, -0.953027, -0.027003)
			fov = 72.0
		}
		dof = $dof_closeup01_tod_manager
	}
]
default_cameras_singer_closeup = [
	{
		controlscript = cameracuts_handcam
		params = {
			name = singer_closeup
			lockto = world
			pos = (-1.543603, 0.87668294, -1.361017)
			quat = (-0.008355001, -0.953027, -0.027003)
			fov = 72.0
		}
		dof = $dof_closeup01_tod_manager
	}
]
default_cameras_bassist = [
	{
		controlscript = cameracuts_handcam
		params = {
			name = bassist_center
			lockto = world
			pos = (-3.3800898, 1.184646, -5.141132)
			quat = (0.00305, -0.97887796, 0.013742999)
			fov = 85.0
		}
		dof = $dof_closeup02_tod_manager
	}
]
default_cameras_solo = [
	{
		controlscript = cameracuts_handcam
		params = {
			name = guitar_neck_normal
			type = normal
			lockto = guitarist
			locktobone = bone_guitar_neck
			pos = (0.742165, 0.095542006, 0.027762)
			quat = (-0.31134596, -0.632061, 0.42270902)
			fov = 57.0
		}
		dof = $dof_closeup03_tod_manager
		crowdoff
	}
	{
		controlscript = cameracuts_handcam
		params = {
			name = guitar_body_normal
			type = normal
			lockto = guitarist
			locktobone = bone_guitar_neck
			pos = (-0.52196294, 0.206606, 0.228494)
			quat = (0.066760994, 0.80269796, -0.260841)
			fov = 76.0
		}
		dof = $dof_closeup03_tod_manager
		crowdoff
	}
	{
		controlscript = cameracuts_handcam
		params = {
			name = guitar_neck_demonik
			type = demonik
			lockto = guitarist
			locktobone = bone_guitar_body
			pos = (1.305142, 0.289514, 0.028687)
			quat = (-0.260674, -0.64566904, 0.48475105)
			fov = 72.0
		}
		dof = $dof_closeup03_tod_manager
		crowdoff
	}
	{
		controlscript = cameracuts_handcam
		params = {
			name = guitar_body_demonik
			type = demonik
			lockto = guitarist
			locktobone = bone_guitar_body
			pos = (-0.35794002, 0.470057, 0.060370997)
			quat = (-0.086646, 0.686242, -0.476262)
			fov = 72.0
		}
		dof = $dof_closeup03_tod_manager
		crowdoff
	}
]
default_cameras_orbit = [
	{
		controlscript = cameracuts_orbit
		params = {
			name = orbit_stage
			lockto = guitarist
			pos = (0.61307204, 0.85457504, -1.556369)
			quat = (-0.055081, -0.325498, -0.019047)
			fov = 72.0
			orbitangle = 80
		}
		dof = $dof_closeup01_tod_manager
	}
	{
		controlscript = cameracuts_orbit
		params = {
			name = orbit_closeup
			lockto = guitarist
			pos = (-0.623458, 1.762923, 1.452922)
			quat = (0.058131002, 0.9316849, -0.172848)
			fov = 72.0
			orbitangle = 40
		}
		dof = $dof_closeup01_tod_manager
	}
	{
		controlscript = cameracuts_orbit
		params = {
			name = orbit_mid
			lockto = guitarist
			pos = (1.8531569, 1.402983, 2.3796542)
			quat = (0.047396, -0.89235497, 0.096345)
			fov = 72.0
			orbitangle = 70
		}
		dof = $dof_closeup01_tod_manager
	}
	{
		controlscript = cameracuts_orbit
		params = {
			name = orbit_drummer
			lockto = drummer
			pos = (-1.155043, 2.428414, 3.3713057)
			quat = (0.039694, 0.95921797, -0.21765)
			fov = 72.0
			orbitangle = 50
		}
		dof = $dof_closeup01_tod_manager
	}
	{
		controlscript = cameracuts_orbit
		params = {
			name = orbit_singer
			lockto = vocalist
			pos = (-1.155043, 2.428414, 3.3713057)
			quat = (0.039694, 0.95921797, -0.21765)
			fov = 72.0
			orbitangle = 50
		}
		dof = $dof_closeup01_tod_manager
	}
]
default_cameras_starpower = [
	{
		controlscript = cameracuts_handcam
		params = {
			name = star_power
			lockto = world
			pos = (0.622013, 0.681226, 1.318936)
			quat = (-0.016913, -0.92676395, -0.041992996)
			fov = 72.0
		}
		dof = $dof_closeup02_tod_manager
	}
]
default_cameras_boss_finish = [
	{
		name = boss_devil_finish
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = world
				pos = (0.962169, 0.53960097, 3.2702482)
				quat = (-0.023288, 0.977894, 0.18821001)
				fov = 72.0
			}
			cam2 = {
				lockto = world
				pos = (0.87311107, 1.4404389, 2.421501)
				quat = (-0.06923701, 0.920361, 0.168251)
				fov = 72.0
			}
		}
	}
]
default_cameras_boss_dead = [
	{
		controlscript = cameracuts_handcam
		params = {
			lockto = world
			pos = (3.557984, 1.241251, 3.824588)
			quat = (-0.024045, -0.90200096, 0.010152999)
			fov = 72.0
		}
	}
]
default_cameras_walk = [
	{
		controlscript = cameracuts_handcam
		params = {
			name = walk01
			lockto = world
			pos = (0.373905, 0.631563, 4.8783784)
			quat = (-0.016905999, 0.9827779, 0.14206801)
			fov = 72.0
		}
		dof = $dof_closeup02_tod_manager
	}
]
default_cameras_stagedive = [
	{
		controlscript = cameracuts_handcam
		params = {
			name = stagedive
			lockto = world
			pos = (0.373905, 0.631563, 4.8783784)
			quat = (-0.016905999, 0.9827779, 0.14206801)
			fov = 72.0
		}
		dof = $dof_closeup02_tod_manager
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
default_cameras_vert_drummer = [
	{
		name = vertdrummer01
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = world
				pos = (3.039751, 1.553329, 2.9490602)
				quat = (0.024109, -0.89691794, 0.049145)
				fov = 71.0
			}
			cam2 = {
				lockto = world
				pos = (-7.7150383, 1.4195828, 2.9341018)
				quat = (0.00736, 0.93007594, -0.018824998)
				fov = 71.0
			}
		}
	}
]
default_cameras_vert_guitarist = [
	{
		name = vertguitarist01
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = world
				pos = (3.039751, 1.553329, 2.9490602)
				quat = (0.024109, -0.89691794, 0.049145)
				fov = 71.0
			}
			cam2 = {
				lockto = world
				pos = (-7.7150383, 1.4195828, 2.9341018)
				quat = (0.00736, 0.93007594, -0.018824998)
				fov = 71.0
			}
		}
	}
]
default_cameras_vert_stagerear = [
	{
		name = vertstagerear
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = world
				pos = (3.039751, 1.553329, 2.9490602)
				quat = (0.024109, -0.89691794, 0.049145)
				fov = 71.0
			}
			cam2 = {
				lockto = world
				pos = (-7.7150383, 1.4195828, 2.9341018)
				quat = (0.00736, 0.93007594, -0.018824998)
				fov = 71.0
			}
		}
	}
]
default_cameras_vert_stagefront = [
	{
		name = vertstagefront
		controlscript = cameracuts_twocam
		params = {
			cam1 = {
				lockto = world
				pos = (3.039751, 1.553329, 2.9490602)
				quat = (0.024109, -0.89691794, 0.049145)
				fov = 71.0
			}
			cam2 = {
				lockto = world
				pos = (-7.7150383, 1.4195828, 2.9341018)
				quat = (0.00736, 0.93007594, -0.018824998)
				fov = 71.0
			}
		}
	}
]
default_cameras_special = [
	{
		controlscript = cameracuts_handcam
		params = {
			name = special01
			lockto = world
			pos = (-6.321385, 0.924312, -2.6622968)
			quat = (-0.026229998, 0.784364, 0.032947995)
			fov = 72.0
		}
		dof = $dof_closeup01_tod_manager
	}
	{
		controlscript = cameracuts_handcam
		params = {
			name = special02
			lockto = world
			pos = (-4.3443885, 0.950269, -0.84059906)
			quat = (1.9E-05, 0.99112797, -0.001512)
			fov = 72.0
		}
		dof = $dof_closeup01_tod_manager
	}
	{
		controlscript = cameracuts_handcam
		params = {
			name = special03
			lockto = world
			pos = (-1.543603, 0.87668294, -1.361017)
			quat = (-0.008355001, -0.953027, -0.027003)
			fov = 72.0
		}
		dof = $dof_closeup01_tod_manager
	}
	{
		controlscript = cameracuts_handcam
		params = {
			name = special04
			lockto = world
			pos = (-1.543603, 0.87668294, -1.361017)
			quat = (-0.008355001, -0.953027, -0.027003)
			fov = 72.0
		}
		dof = $dof_closeup01_tod_manager
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
