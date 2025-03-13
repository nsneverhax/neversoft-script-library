lightshow_enabled = 1
lightshow_debug = 0
lightvolume_flarecutoff = 0.3
lightvolume_flarematerialcrc = flarematerial_flarematerial
lightvolume_flaresaturate = 0.6
lightvolume_follow = {
	allowedradius = {
		amplitude = 0.2
		center = 1.0
		periodbase = 0.0065
		periodmultiples = [
			1
			3
			4
			7
		]
	}
	driftlerpmap = [
		(0.0, 0.4)
		(0.2, 0.7)
	]
}
lightshow_defaultblendtime = 0.15
lightshow_coloroverrideblend = 0.4
lightshow_offset_ms = 100
lightshow_allow_mood_changes = true
lightshow_last_mood_requested = none
lightshow_available_snapshot_names = [
]
lightshow_snapshot_mood = [
]
lightshow_menu_moods = [
	intro
	prelude
	exposition
	tension
	climax
	resolution
	fallingaction
]
lightshow_menu_min_time = 1.0
lightshow_menu_max_time = 2.0
lightshow_menu_transition_time = 0.15
lightshow_housingmodels = [
	{
		model = 'LightHousings\\GO_NoHousing01\\GO_NoHousing01.mdl'
		clonesrc = ls_go_nohousing01
	}
	{
		model = 'LightHousings\\GO_NoHousing01_Flare01\\GO_NoHousing01_Flare01.mdl'
		clonesrc = ls_go_nohousing01_flare01
	}
	{
		model = 'LightHousings\\GO_NoHousing01_SmallFlare01\\GO_NoHousing01_SmallFlare01.mdl'
		clonesrc = ls_go_nohousing01_smallflare01
	}
	{
		model = 'LightHousings\\GO_BarnHousing01\\GO_BarnHousing01.mdl'
		clonesrc = ls_go_barnhousing01
	}
	{
		model = 'LightHousings\\GO_LightHousing01\\GO_LightHousing01.mdl'
		clonesrc = ls_go_lighthousing01
	}
	{
		model = 'LightHousings\\GO_LightHousing01_SmallFlare01\\GO_LightHousing01_SmallFlare01.mdl'
		clonesrc = ls_go_lighthousing01_smallflare01
	}
	{
		model = 'LightHousings\\GO_LightHousing02\\GO_LightHousing02.mdl'
		clonesrc = ls_go_lighthousing02
	}
	{
		model = 'LightHousings\\GO_LightHousing02_SmallFlare01\\GO_LightHousing02_SmallFlare01.mdl'
		clonesrc = ls_go_lighthousing02_smallflare01
	}
	{
		model = 'LightHousings\\GO_LightHousing02_Small01\\GO_LightHousing02_Small01.mdl'
		clonesrc = ls_go_lighthousing02_small01
	}
	{
		model = 'LightHousings\\GO_LH_Bowl\\GO_LH_Bowl.mdl'
		clonesrc = ls_go_lh_bowl
	}
	{
		model = 'LightHousings\\GO_LH_Tentacle_Big01\\GO_LH_Tentacle_Big01.mdl'
		clonesrc = ls_go_lh_tentacle_big01
	}
	{
		model = 'LightHousings\\GO_LH_Tentacle_Med01\\GO_LH_Tentacle_Med01.mdl'
		clonesrc = ls_go_lh_tentacle_med01
	}
	{
		model = 'LightHousings\\GO_LH_Tentacle_Small01\\GO_LH_Tentacle_Small01.mdl'
		clonesrc = ls_go_lh_tentacle_small01
	}
]

script lightshow_createpermmodels 
	getarraysize \{$lightshow_housingmodels}
	<i> = 0
	begin
	<desc> = ($lightshow_housingmodels [<i>])
	<model> = (<desc>.model)
	<pos> = ((-100.0, 300.0) + <i> * (0.0, 10.0))
	<src> = (<desc>.clonesrc)
	createcompositeobject {
		components = [
			{
				component = model
				model = <model>
			}
		]
		params = {
			pos = <pos>
			name = <src>
		}
	}
	<src> :hide
	<src> :obj_forceupdate
	<src> :suspend
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script ls_alloff 
	killspawnedscript \{id = lightshow}
endscript

script ls_setupvenuelights 
endscript

script ls_resetvenuelights 
	ls_alloff
	ls_killfx
	getpakmancurrent \{map = zones}
endscript

script ls_killfx 
endscript
lightshow_spotlightfollownames = [
	guitarist
	vocalist
	bassist
	drummer
]
lightshow_statenodeflags = [
	ls_perf_poor
	ls_perf_medium
	ls_perf_good
	ls_perf_poor_medium
	ls_perf_medium_good
	ls_perf_poor_medium_good
	ls_perf_poor_noblackout
	ls_perf_medium_noblackout
	ls_perf_good_noblackout
	ls_perf_poor_medium_noblackout
	ls_perf_medium_good_noblackout
	ls_perf_poor_medium_good_noblackout
	ls_mood_intro
	ls_mood_blackout
	ls_mood_flare
	ls_mood_strobe
	ls_mood_wash
	ls_mood_prelude
	ls_mood_exposition
	ls_mood_rising
	ls_mood_tension
	ls_mood_climax
	ls_mood_falling
	ls_mood_resolution
	ls_mood_pyro
	ls_mood_silhouette
	ls_mood_starpower
	ls_mood_menu
	ls_mood_band_lobby
]
lightshow_statenodeflagmapping = {
	performance = {
		poor = [
			{
				ls_perf_poor
				1
			}
			{
				ls_perf_poor_medium
				1
			}
			{
				ls_perf_poor_medium_good
				1
			}
			{
				ls_perf_poor_noblackout
				1
			}
			{
				ls_perf_poor_medium_noblackout
				1
			}
			{
				ls_perf_poor_medium_good_noblackout
				1
			}
		]
		medium = [
			{
				ls_perf_poor_medium
				1
			}
			{
				ls_perf_medium
				1
			}
			{
				ls_perf_medium_good
				1
			}
			{
				ls_perf_poor_medium_good
				1
			}
			{
				ls_perf_poor_medium_noblackout
				1
			}
			{
				ls_perf_medium_noblackout
				1
			}
			{
				ls_perf_medium_good_noblackout
				1
			}
			{
				ls_perf_poor_medium_good_noblackout
				1
			}
		]
		good = [
			{
				ls_perf_medium_good
				1
			}
			{
				ls_perf_good
				1
			}
			{
				ls_perf_poor_medium_good
				1
			}
			{
				ls_perf_medium_good_noblackout
				1
			}
			{
				ls_perf_good_noblackout
				1
			}
			{
				ls_perf_poor_medium_good_noblackout
				1
			}
		]
	}
	mood = {
		intro = [
			{
				ls_mood_intro
				1
			}
		]
		blackout = [
			{
				ls_mood_blackout
				1
			}
			{
				ls_perf_poor
				0
			}
			{
				ls_perf_medium
				0
			}
			{
				ls_perf_good
				0
			}
			{
				ls_perf_poor_medium
				0
			}
			{
				ls_perf_medium_good
				0
			}
			{
				ls_perf_poor_medium_good
				0
			}
		]
		flare = [
			{
				ls_mood_flare
				1
			}
			{
				ls_perf_poor
				0
			}
			{
				ls_perf_medium
				0
			}
			{
				ls_perf_good
				0
			}
			{
				ls_perf_poor_medium
				0
			}
			{
				ls_perf_medium_good
				0
			}
			{
				ls_perf_poor_medium_good
				0
			}
		]
		strobe = [
			{
				ls_mood_strobe
				1
			}
		]
		wash = [
			{
				ls_mood_wash
				1
			}
		]
		prelude = [
			{
				ls_mood_prelude
				1
			}
		]
		exposition = [
			{
				ls_mood_exposition
				1
			}
		]
		risingaction = [
			{
				ls_mood_rising
				1
			}
		]
		tension = [
			{
				ls_mood_tension
				1
			}
		]
		climax = [
			{
				ls_mood_climax
				1
			}
		]
		fallingaction = [
			{
				ls_mood_falling
				1
			}
		]
		resolution = [
			{
				ls_mood_resolution
				1
			}
		]
		pyro = [
			{
				ls_mood_pyro
				1
			}
		]
		silhouette = [
			{
				ls_mood_silhouette
				1
			}
		]
		starpower = [
			{
				ls_mood_starpower
				1
			}
		]
		menu = [
			{
				ls_mood_menu
				1
			}
		]
		band_lobby = [
			{
				ls_mood_band_lobby
				1
			}
		]
	}
}
lightshow_notemapping = [
	{
		midinote = 105
		scr = lightshow_spotlightcolor
		params = {
			color = red
		}
	}
	{
		midinote = 104
		scr = lightshow_spotlightcolor
		params = {
			color = orange
		}
	}
	{
		midinote = 103
		scr = lightshow_spotlightcolor
		params = {
			color = yellow
		}
	}
	{
		midinote = 102
		scr = lightshow_spotlightcolor
		params = {
			color = green
		}
	}
	{
		midinote = 101
		scr = lightshow_spotlightcolor
		params = {
			color = blue
		}
	}
	{
		midinote = 100
		scr = lightshow_spotlightcolor
		params = {
			color = purple
		}
	}
	{
		midinote = 99
		scr = lightshow_spotlightcolor
		params = {
			color = magenta
		}
	}
	{
		midinote = 98
		scr = lightshow_spotlightcolor
		params = {
			color = white
		}
	}
	{
		midinote = 97
		scr = lightshow_enablespotlights
		params = {
			enabled = true
			spots = [
				vocalist
			]
		}
	}
	{
		midinote = 96
		scr = lightshow_enablespotlights
		params = {
			enabled = false
			spots = [
				vocalist
			]
		}
	}
	{
		midinote = 95
		scr = lightshow_enablespotlights
		params = {
			enabled = true
			spots = [
				guitarist
			]
		}
	}
	{
		midinote = 94
		scr = lightshow_enablespotlights
		params = {
			enabled = false
			spots = [
				guitarist
			]
		}
	}
	{
		midinote = 93
		scr = lightshow_enablespotlights
		params = {
			enabled = true
			spots = [
				bassist
			]
		}
	}
	{
		midinote = 92
		scr = lightshow_enablespotlights
		params = {
			enabled = false
			spots = [
				bassist
			]
		}
	}
	{
		midinote = 91
		scr = lightshow_enablespotlights
		params = {
			enabled = true
			spots = [
				drummer
			]
		}
	}
	{
		midinote = 90
		scr = lightshow_enablespotlights
		params = {
			enabled = false
			spots = [
				drummer
			]
		}
	}
	{
		midinote = 88
		scr = lightshow_setparams
		params = {
			resetcycleonmoodchange = true
		}
	}
	{
		midinote = 87
		scr = lightshow_setparams
		params = {
			resetcycleonmoodchange = false
		}
	}
	{
		midinote = 84
		scr = lightshow_setparams
		params = {
			mood = intro
		}
	}
	{
		midinote = 83
		scr = lightshow_setparams
		params = {
			mood = blackout
		}
	}
	{
		midinote = 82
		scr = lightshow_setparams
		params = {
			mood = flare
		}
	}
	{
		midinote = 81
		scr = lightshow_setparams
		params = {
			mood = strobe
		}
	}
	{
		midinote = 80
		scr = lightshow_setparams
		params = {
			mood = wash
		}
	}
	{
		midinote = 79
		scr = lightshow_setparams
		params = {
			mood = prelude
		}
	}
	{
		midinote = 78
		scr = lightshow_setparams
		params = {
			mood = exposition
		}
	}
	{
		midinote = 77
		scr = lightshow_setparams
		params = {
			mood = risingaction
		}
	}
	{
		midinote = 76
		scr = lightshow_setparams
		params = {
			mood = tension
		}
	}
	{
		midinote = 75
		scr = lightshow_setparams
		params = {
			mood = climax
		}
	}
	{
		midinote = 74
		scr = lightshow_setparams
		params = {
			mood = fallingaction
		}
	}
	{
		midinote = 73
		scr = lightshow_setparams
		params = {
			mood = resolution
		}
	}
	{
		midinote = 72
		scr = lightshow_setparams
		params = {
			mood = pyro
		}
	}
	{
		midinote = 71
		scr = lightshow_setparams
		params = {
			mood = silhouette
		}
	}
	{
		midinote = 69
		scr = lightshow_overridecolor
		params = {
			color = red
		}
	}
	{
		midinote = 68
		scr = lightshow_overridecolor
		params = {
			color = orange
		}
	}
	{
		midinote = 67
		scr = lightshow_overridecolor
		params = {
			color = yellow
		}
	}
	{
		midinote = 66
		scr = lightshow_overridecolor
		params = {
			color = green
		}
	}
	{
		midinote = 65
		scr = lightshow_overridecolor
		params = {
			color = blue
		}
	}
	{
		midinote = 64
		scr = lightshow_overridecolor
		params = {
			color = purple
		}
	}
	{
		midinote = 63
		scr = lightshow_overridecolor
		params = {
			color = magenta
		}
	}
	{
		midinote = 62
		scr = lightshow_overridecolor
		params = {
			color = white
		}
	}
	{
		midinote = 61
		scr = lightshow_overridecolor
		params = {
			off
		}
	}
	{
		midinote = 60
		event = strobetoggle
		params = {
			usesnapshotpositions = true
		}
	}
	{
		midinote = 58
		event = snapshotchange
		params = {
			usesnapshotpositions = true
		}
	}
	{
		midinote = 57
		event = snapshotchange
		params = {
			usesnapshotpositions = true
		}
	}
	{
		midinote = 53
		scr = lightshow_settime
		params = {
			time = 1.0
		}
	}
	{
		midinote = 52
		scr = lightshow_settime
		params = {
			time = 0.9
		}
	}
	{
		midinote = 51
		scr = lightshow_settime
		params = {
			time = 0.8
		}
	}
	{
		midinote = 50
		scr = lightshow_settime
		params = {
			time = 0.7
		}
	}
	{
		midinote = 49
		scr = lightshow_settime
		params = {
			time = 0.6
		}
	}
	{
		midinote = 48
		scr = lightshow_settime
		params = {
			time = 0.5
		}
	}
	{
		midinote = 47
		scr = lightshow_settime
		params = {
			time = 0.4
		}
	}
	{
		midinote = 46
		scr = lightshow_settime
		params = {
			time = 0.3
		}
	}
	{
		midinote = 45
		scr = lightshow_settime
		params = {
			time = 0.25
		}
	}
	{
		midinote = 44
		scr = lightshow_settime
		params = {
			time = 0.2
		}
	}
	{
		midinote = 43
		scr = lightshow_settime
		params = {
			time = 0.15
		}
	}
	{
		midinote = 42
		scr = lightshow_settime
		params = {
			time = 0.1
		}
	}
	{
		midinote = 41
		scr = lightshow_settime
		params = {
			time = 0.05
		}
	}
	{
		midinote = 40
		scr = lightshow_settime
		params = {
			time = 0.0
		}
	}
	{
		midinote = 39
		scr = lightshow_settime
		params = {
			`default`
		}
	}
	{
		midinote = 37
		scr = lightshow_pyroevent
		params = {
			type = generic
		}
	}
	{
		midinote = 35
		scr = lightshow_pyroevent
		params = {
			type = front_1
		}
	}
	{
		midinote = 34
		scr = lightshow_pyroevent
		params = {
			type = front_2
		}
	}
	{
		midinote = 33
		scr = lightshow_pyroevent
		params = {
			type = front_3
		}
	}
	{
		midinote = 32
		scr = lightshow_pyroevent
		params = {
			type = front_4
		}
	}
	{
		midinote = 31
		scr = lightshow_pyroevent
		params = {
			type = top_1
		}
	}
	{
		midinote = 30
		scr = lightshow_pyroevent
		params = {
			type = top_2
		}
	}
	{
		midinote = 29
		scr = lightshow_pyroevent
		params = {
			type = top_3
		}
	}
	{
		midinote = 28
		scr = lightshow_pyroevent
		params = {
			type = top_4
		}
	}
	{
		midinote = 27
		scr = lightshow_pyroevent
		params = {
			type = mid_1
		}
	}
	{
		midinote = 26
		scr = lightshow_pyroevent
		params = {
			type = mid_2
		}
	}
	{
		midinote = 25
		scr = lightshow_pyroevent
		params = {
			type = mid_3
		}
	}
	{
		midinote = 24
		scr = lightshow_pyroevent
		params = {
			type = mid_4
		}
	}
	{
		midinote = 23
		scr = lightshow_pyroevent
		params = {
			type = back_1
		}
	}
	{
		midinote = 22
		scr = lightshow_pyroevent
		params = {
			type = back_2
		}
	}
	{
		midinote = 21
		scr = lightshow_pyroevent
		params = {
			type = back_3
		}
	}
	{
		midinote = 20
		scr = lightshow_pyroevent
		params = {
			type = back_4
		}
	}
	{
		midinote = 19
		scr = lightshow_pyroevent
		params = {
			type = pyro_special
		}
	}
]
lightshow_sharedprocessors = [
	{
		name = default_generic
		screnter = lightshow_genericmood_enter
		screvent = lightshow_genericmood_event
		screxit = lightshow_genericmood_exit
	}
	{
		name = poor_generic
		screnter = lightshow_poor_enter
		screvent = lightshow_poor_event
		screxit = lightshow_poor_exit
	}
	{
		name = blackout_generic
		screnter = lightshow_blackout_enter
		screvent = lightshow_blackout_event
		screxit = lightshow_blackout_exit
	}
	{
		name = flare_generic
		screnter = lightshow_flare_enter
		screvent = lightshow_flare_event
		screxit = lightshow_flare_exit
	}
	{
		name = strobe_generic
		screnter = lightshow_genericmood_enter
		screvent = lightshow_genericmood_event
		screxit = lightshow_genericmood_exit
	}
	{
		name = visualizer_generic
		screnter = visualizer_genericmood_enter
		screvent = visualizer_genericmood_event
		screxit = visualizer_genericmood_exit
	}
]

script lightshow_iterator_set_song_event 
	get_song_prefix song = <song_name>
	formattext checksumname = event_array '%s_lightshow_notes' s = <song_prefix> addtostringlookup = true
	if NOT globalexists name = <event_array> type = array
		printf \{qs(0x093d0e8a)}
		return \{false}
	endif
	return true event_array = <event_array>
endscript

script lightshow_iterator_init 
	printf qs(0xc9557688) d = <time_offset> channel = events
	lightshow_setactive \{active = false}
	if NOT cd
		destroyscreenelement \{id = lightshow_debuganchor}
		if ($lightshow_debug = 1)
			lightshow_displaydebuginfo
		endif
	endif
	if ($lightshow_enabled = 0)
		printf \{qs(0x46b6ad6b)}
		return \{false}
	endif
	if NOT lightshow_iterator_set_song_event song_name = <song_name>
		return \{false}
	endif
	if NOT lightshow_initeventmappings
		return \{false}
	endif
	return true event_array = <event_array> parse_notetrack = <parse_notetrack>
endscript

script lightshow_iterator 
	if ($medley_mode_on)
		lightshow_iterator_medley <...>
		return
	endif
	if NOT lightshow_iterator_init <...>
		return
	endif
	array_entry = 0
	fretbar_count = 0
	getarraysize $<event_array>
	array_size = (<array_size> / 2)
	getsongtimems time_offset = <time_offset>
	if NOT (<array_size> = 0)
		begin
		if ((<time> - <skipleadin>) < $<event_array> [<array_entry>])
			break
		endif
		<array_entry> = (<array_entry> + 2)
		repeat <array_size>
		array_size = (<array_size> - (<array_entry> / 2))
		if NOT (<array_size> = 0)
			begin
			array_time_entry = ($<event_array> [<array_entry>])
			timemarkerreached_setparams time_offset = <time_offset> time = <array_time_entry> perframe
			begin
			lightshow_update
			if timemarkerreached
				getsongtimems time_offset = <time_offset>
				break
			endif
			wait \{1
				gameframe}
			repeat
			timemarkerreached_clearparams
			if (<array_size> = 0)
				break
			endif
			process_lightshow_note event_array = <event_array> array_entry = <array_entry> parse_notetrack = <parse_notetrack>
			<array_entry> = (<array_entry> + 2)
			repeat <array_size>
		endif
	endif
	if NOT cd
		if screenelementexists \{id = lightshow_debugtext}
			lightshow_debugtext :se_setprops \{text = qs(0xcbc0eb10)}
		endif
	endif
	begin
	wait \{1
		gameframe}
	lightshow_update
	repeat
endscript

script lightshow_iterator_medley 
	if NOT lightshow_iterator_init <...>
		return
	endif
	array_entry = 0
	medley_index = 0
	medley_time = 0
	medley_start_time = 0
	medley_end_time = 0
	getarraysize \{$current_medley_info}
	medley_size = <array_size>
	getmedleystartendtimes medley_index = <medley_index>
	getarraysize $<event_array>
	array_size = (<array_size> / 2)
	getsongtimems time_offset = <time_offset>
	if NOT (<array_size> = 0)
		begin
		if (<medley_start_time> <= $<event_array> [<array_entry>])
			break
		endif
		<array_entry> = (<array_entry> + 2)
		repeat <array_size>
		medley_over = 0
		begin
		begin
		getsongtimems time_offset = <time_offset>
		if (<time> - <medley_time> >= <medley_end_time> - <medley_start_time>)
			getmedleyendbeattimelength medley_index = <medley_index>
			medley_index = (<medley_index> + 1)
			do_next_song = 0
			if (<medley_index> < <medley_size>)
				do_next_song = 1
			else
				if ($medley_looping = 1)
					do_next_song = 1
					medley_index = 0
				else
					medley_over = 1
				endif
			endif
			if (<do_next_song> = 1)
				song_name = ($current_medley_info [<medley_index>].song)
				lightshow_iterator_set_song_event song_name = <song_name>
				getarraysize $<event_array>
				array_size = (<array_size> / 2)
				medley_time = (<medley_time> + (<medley_end_time> - <medley_start_time>))
				medley_time = (<medley_time> + <beat_time_length>)
				getmedleystartendtimes medley_index = <medley_index>
				array_entry = 0
				begin
				if (<medley_start_time> <= $<event_array> [<array_entry>])
					break
				endif
				<array_entry> = (<array_entry> + 2)
				repeat <array_size>
				begin
				getsongtimems time_offset = <time_offset>
				if (<time> >= <medley_time>)
					break
				endif
				wait \{1
					gameframe}
				repeat
				break
			endif
		endif
		if (<medley_over> = 1)
			break
		endif
		if NOT (<array_size> = 0)
			note_time = ($<event_array> [<array_entry>])
			if (<time> - <medley_time> >= <note_time> - <medley_start_time>)
				getsongtimems time_offset = <time_offset>
				break
			endif
		endif
		wait \{1
			gameframe}
		repeat <array_size>
		if (<array_entry> >= <array_size>)
			break
		endif
		process_lightshow_note event_array = <event_array> array_entry = <array_entry> parse_notetrack = <parse_notetrack>
		<array_entry> = (<array_entry> + 2)
		repeat
	endif
	if NOT cd
		if screenelementexists \{id = lightshow_debugtext}
			lightshow_debugtext :se_setprops \{text = qs(0xcbc0eb10)}
		endif
	endif
	begin
	wait \{1
		gameframe}
	lightshow_update
	repeat
endscript

script process_lightshow_note 
	decompressnotevalue note_value = ($<event_array> [(<array_entry> + 1)])
	if (<parse_notetrack> = true)
		if lightshow_beginprocessblock {time = ($<event_array> [<array_entry>])
				note = <note>
				length = <length>}
			switch <process_mode>
				case event
				lightshow_passevent
				case scr
				<eventscr> <eventparams>
			endswitch
			lightshow_endprocessblock
		endif
	endif
endscript

script lightshow_toggledebuginfo 
	if ($lightshow_debug = 1)
		change \{lightshow_debug = 0}
		destroyscreenelement \{id = lightshow_debuganchor}
	else
		change \{lightshow_debug = 1}
		lightshow_displaydebuginfo
	endif
endscript

script lightshow_displaydebuginfo 
	destroyscreenelement \{id = lightshow_debuganchor}
	createscreenelement \{type = containerelement
		parent = root_window
		id = lightshow_debuganchor
		pos = (400.0, 440.0)
		z_priority = 1000}
	createscreenelement \{type = spriteelement
		parent = lightshow_debuganchor
		dims = (500.0, 220.0)
		just = [
			left
			top
		]
		rgba = [
			0
			0
			0
			255
		]
		alpha = 0.7}
	createscreenelement \{type = textblockelement
		parent = lightshow_debuganchor
		id = lightshow_debugtext
		just = [
			left
			top
		]
		pos = (0.0, 0.0)
		dims = (1000.0, 1000.0)
		font = fontgrid_text_a1
		internal_scale = (0.6, 0.4)
		text = qs(0xcbc0eb10)}
	if NOT lightshow_getparams
		lightshow_debugtext = qs(0x46e08381)
	endif
endscript

script lightshow_pyroevent 
	if lightshow_getpyroscript
		if structurecontains structure = pyro_scripts <type>
			getpakmancurrent \{map = zones}
			if NOT (<pak> = z_visualizer)
				if scriptisrunning \{fretbar_update_tempo}
					if NOT ($game_mode = practice)
						printf \{channel = sfx
							qs(0xe9da5b31)}
						soundevent \{event = pyro}
					endif
				endif
			endif
			<scr> = (<pyro_scripts>.<type>)
			if lightshow_getparams
				if scriptexists <scr>
					spawnscriptnow <scr> id = lightshow params = {performance = <performance>}
				endif
			endif
		else
			printf 'lightshow - pyro event skipped due to missing venue type %s' s = <type>
		endif
	else
		printf \{'lightshow - pyro event skipped due to missing venue definitions'}
	endif
endscript

script lightshow_poor_enter 
	lightshow_cyclenextsnapshot \{usesnapshotpositions = true
		save = true}
endscript

script lightshow_poor_exit 
endscript

script lightshow_poor_event 
	begin
	lightshow_waitfornextevent \{events = [
			snapshotchange
		]}
	repeat
endscript

script lightshow_genericmood_enter 
	lightshow_cyclenextsnapshot \{usesnapshotpositions = true
		save = true}
endscript

script lightshow_genericmood_exit 
endscript

script lightshow_genericmood_event 
	begin
	lightshow_waitfornextevent \{events = [
			snapshotchange
		]}
	lightshow_cyclenextsnapshot usesnapshotpositions = <usesnapshotpositions> save = true
	repeat
endscript

script lightshow_blackout_enter 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_training
		case z_viewer
		lightshow_appendsnapshotparams \{intensity = 0.25
			specularintensity = 0.25}
	endswitch
	lightshow_cyclenextsnapshot \{save = false
		usesnapshotpositions = true}
endscript

script lightshow_blackout_event 
endscript

script lightshow_blackout_exit 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_training
		case z_viewer
		lightshow_appendsnapshotparams \{clear}
	endswitch
endscript

script lightshow_flare_enter 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_training
		case z_viewer
		lightshow_appendsnapshotparams \{intensity = 0.25
			specularintensity = 0.25}
	endswitch
	lightshow_cyclenextsnapshot \{save = false
		usesnapshotpositions = true}
endscript

script lightshow_flare_event 
endscript

script lightshow_flare_exit 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_training
		case z_viewer
		lightshow_appendsnapshotparams \{clear}
	endswitch
endscript

script lightshow_strobe_enter 
	lightshow_settime \{enable = false}
endscript

script lightshow_strobe_event 
	lightshow_getparams
	<original_snapshot> = <previous_snapshot>
	begin
	lightshow_cyclenextsnapshot \{usesnapshotpositions = false
		save = false}
	lightshow_waitfornextevent \{events = [
			strobetoggle
		]}
	lightshow_appendsnapshotparams \{intensity = 1.0}
	if gotparam \{original_snapshot}
		lightshow_playsnapshot name = <original_snapshot> save = false usesnapshotpositions = false
	else
		lightshow_cyclenextsnapshot \{usesnapshotpositions = false
			save = true}
	endif
	lightshow_waitfornextevent \{events = [
			strobetoggle
		]}
	repeat
endscript

script lightshow_strobe_exit 
	lightshow_appendsnapshotparams \{clear}
	lightshow_settime \{enable = true}
endscript

script lightshow_addnodeflags 
	getarraysize \{$lightshow_statenodeflags}
	<i> = 0
	begin
	createnodeflag ($lightshow_statenodeflags [<i>])
	<i> = (<i> + 1)
	repeat <array_size>
	createnodeflag \{ls_always}
	createnodeflag \{ls_3_5_pre}
	createnodeflag \{ls_3_5_post}
	createnodeflag \{ls_encore_pre}
	createnodeflag \{ls_encore_post}
	createnodeflag \{ls_spotlight_guitarist}
	createnodeflag \{ls_spotlight_bassist}
endscript

script lightshow_initeventmappings 
	killspawnedscript \{name = lightshow_dummyloop_spawned}
	lightshow_appendsnapshotparams \{clear}
	lightshow_overridecolor \{off}
	lightshow_settime \{`default`
		enable = true}
	lightshow_setactive \{active = false}
	lightshow_setprocessors \{clear}
	lightshow_setmapping \{clear}
	changenodeflag \{ls_spotlight_guitarist
		1}
	getnumplayersingame
	if (<num_players> = 1)
		changenodeflag \{ls_spotlight_bassist
			0}
	else
		changenodeflag \{ls_spotlight_bassist
			1}
	endif
	if gotparam \{force_pakname}
		<pakname> = <force_pakname>
	else
		if NOT getpakmancurrentname \{map = zones}
			printf \{qs(0xe20be0e2)}
			printstruct <...>
			return \{false}
		endif
	endif
	formattext checksumname = event_struct '%s_lightshow_mapping' s = <pakname> addtostringlookup = true
	formattext checksumname = snp_filename 'zones/%s/%s_snp.qb' s = <pakname> addtostringlookup = true
	formattext checksumname = snapshot_struct '%s_snapshots' s = <pakname> addtostringlookup = true
	formattext checksumname = material_snapshot_struct '%s_material_snapshots' s = <pakname> addtostringlookup = true
	formattext checksumname = processors_struct '%s_lightshow_processors' s = <pakname> addtostringlookup = true
	formattext checksumname = snapshot_names '%s_snapshot_names' s = <pakname> addtostringlookup = true
	if NOT globalexists name = <event_struct> type = structure
		printf \{qs(0xce52f5c2)}
		printstruct <...>
		return \{false}
	endif
	if NOT lightshow_preprocesssnp snpfilename = <snp_filename> snapshotstruct = <snapshot_struct> snapshotnames = <snapshot_names>
		printf \{qs(0xdc2d0c88)}
		printstruct <...>
		return \{false}
	endif
	if globalexists name = <processors_struct> type = array
		printf \{qs(0x23e129d8)}
		lightshow_setprocessors venue = $<processors_struct>
	endif
	lightshow_setmapping ($<event_struct>)
	lightshow_setactive \{active = true}
	lightshow_setparams {
		performance = medium
		mood = intro
		venuematerialsnapshotsname = <material_snapshot_struct>
	}
	lightshow_spotlightcolor \{color = white}
	if NOT ($debug_forcescore = off)
		crowdincrease \{player = 1}
	endif
	formattext checksumname = venue_setup_scr '%s_SetupLightShow' s = <pakname> addtostringlookup = true
	if scriptexists <venue_setup_scr>
		spawnscriptnow <venue_setup_scr> id = lightshow
	endif
	<parse_notetrack> = true
	switch <pakname>
		case 'z_studio2'
		<parse_notetrack> = false
	endswitch
	return true parse_notetrack = <parse_notetrack>
endscript

script lightshow_cleardebugarrays 
	change \{lightshow_available_snapshot_names = [
		]}
	change \{lightshow_snapshot_mood = [
		]}
endscript

script lightshow_dummyloop 
	killspawnedscript \{name = lightshow_dummyloop_spawned}
	spawnscriptnow \{lightshow_dummyloop_spawned
		id = lightshow}
endscript

script lightshow_dummyloop_spawned 
	begin
	lightshow_update
	wait \{1
		gameframes}
	repeat
endscript

script lightshow_notingameplay_setmood 
	requireparams \{[
			mood
		]
		all}
	lightshow_setactive \{active = true}
	lightshow_dummyloop
	lightshow_setparams mood = <mood>
endscript

script lightshow_shutdown 
	printf \{qs(0x9010c422)}
	killspawnedscript \{name = lightshow_iterator}
	killspawnedscript \{id = lightshow}
	printf \{qs(0x4d49808d)}
endscript

script lightshow_songfailed 
	killspawnedscript \{name = lightshow_iterator}
	killspawnedscript \{id = lightshow}
	lightshow_enablespotlights \{enabled = false
		spots = [
			vocalist
			guitarist
			bassist
			drummer
		]}
endscript
lightshow_debugcycle_index = 0

script lightshow_is_spotlight_snapshot 
	if NOT getpakmancurrentname \{map = zones}
		return \{false}
	endif
	formattext checksumname = mapping '%s_lightshow_mapping' s = <pakname>
	if NOT globalexists name = <mapping>
		return \{false}
	endif
	if NOT structurecontains structure = $<mapping> spotlight_snapshots
		return \{false}
	endif
	<snps> = ($<mapping>.spotlight_snapshots)
	<checks> = [red orange yellow green blue purple magenta white off]
	getarraysize <checks>
	<i> = 0
	begin
	<check> = (<checks> [<i>])
	<i> = (<i> + 1)
	if structurecontains structure = <snps> <check>
		<snp> = (<snps>.<check>)
		if (<name> = <snp>)
			return \{true}
		endif
	endif
	repeat <array_size>
	return \{false}
endscript

script lightshow_debugcycle_init 
	if NOT lightshow_getparams
		if NOT lightshow_initeventmappings
			return \{false}
		endif
	endif
	return \{true}
endscript

script lightshow_debugcycle 
	printf \{qs(0x8f4f89bb)}
	if NOT lightshow_debugcycle_init
		return
	endif
	if NOT getpakmancurrentname \{map = zones}
		return
	endif
	getarraysize \{$lightshow_available_snapshot_names}
	if (<array_size> = 0)
		return
	endif
	if ($lightshow_debugcycle_index >= <array_size>)
		change \{lightshow_debugcycle_index = 0}
	endif
	killspawnedscript \{name = lightshow_iterator}
	lightshow_dummyloop
	lightshow_settime \{time = 0.0}
	change \{lightshow_allow_mood_changes = true}
	begin
	<snapshot_name> = ($lightshow_available_snapshot_names [$lightshow_debugcycle_index])
	formattext checksumname = snapshot_crc <snapshot_name>
	formattext textname = debug_text qs(0x3beef43d) s = <snapshot_name>
	mood = ($lightshow_snapshot_mood [$lightshow_debugcycle_index])
	change lightshow_debugcycle_index = ($lightshow_debugcycle_index + 1)
	if lightshow_is_spotlight_snapshot name = <snapshot_crc>
	else
		break
	endif
	repeat
	printf channel = marcls qs(0xcb754e4d) a = <mood> b = <snapshot_name>
	if (mood != unknown)
		lightshow_setparams mood = <mood>
	endif
	lightshow_playsnapshot name = <snapshot_crc> save = true usesnapshotpositions = true
	destroyscreenelement \{id = lightshow_debugcycleanchor}
	if NOT retailbuild
		killspawnedscript \{name = lightshow_debug_dislay_name}
		spawnscriptnow lightshow_debug_dislay_name params = {debug_text = <debug_text>}
	endif
	change \{lightshow_allow_mood_changes = false}
endscript

script lightshow_debug_dislay_name 
	createscreenelement {
		type = textelement
		parent = root_window
		id = lightshow_debugcycleanchor
		just = [left top]
		pos = (75.0, 550.0)
		font = fontgrid_text_a1
		z_priority = 50
		text = <debug_text>
		use_shadow = true
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
	}
	wait \{2
		seconds}
	destroyscreenelement \{id = lightshow_debugcycleanchor}
endscript

script venue_pulseonevents \{amount = 1.12
		time = 0.1}
	if gotparam \{delay}
		requireparams \{[
				events
			]
			all}
		obj_enablescaling
		obj_getscaling
		<start_scale> = <scaling>
		<end_scale> = (<scaling> * <amount>)
		begin
		block anytypes = <events>
		wait <delay> seconds
		obj_applyscaling scale = <end_scale>
		wait \{1
			gameframes}
		obj_morphscaling target_scale = <start_scale> blend_duration = <time>
		repeat
	else
		addpulseevent events = <events> amount = <amount> time = <time>
	endif
endscript

script venue_pulsegreen 
	setspawninstancelimits \{max = 8
		management = ignore_spawn_request}
	venue_pulseonevents \{events = [
			hitnote_green
		]}
endscript

script venue_pulsered 
	setspawninstancelimits \{max = 8
		management = ignore_spawn_request}
	venue_pulseonevents \{events = [
			hitnote_red
		]}
endscript

script venue_pulseyellow 
	setspawninstancelimits \{max = 8
		management = ignore_spawn_request}
	venue_pulseonevents \{events = [
			hitnote_yellow
		]}
endscript

script venue_pulseblue 
	setspawninstancelimits \{max = 8
		management = ignore_spawn_request}
	venue_pulseonevents \{events = [
			hitnote_blue
		]}
endscript

script venue_pulseorange 
	setspawninstancelimits \{max = 8
		management = ignore_spawn_request}
	venue_pulseonevents \{events = [
			hitnote_orange
		]}
endscript

script venue_pulseopen 
	setspawninstancelimits \{max = 8
		management = ignore_spawn_request}
endscript

script venue_pulsedrumleft 
	setspawninstancelimits \{max = 2
		management = ignore_spawn_request}
	venue_pulseonevents \{events = [
			drumkick_left
		]
		amount = 1.1
		delay = $drum_kick_anim_delay}
endscript

script venue_pulsedrumright 
	setspawninstancelimits \{max = 2
		management = ignore_spawn_request}
	venue_pulseonevents \{events = [
			drumkick_right
		]
		amount = 1.1
		delay = $drum_kick_anim_delay}
endscript

script venue_pulsedrumboth 
	setspawninstancelimits \{max = 4
		management = ignore_spawn_request}
	venue_pulseonevents \{events = [
			drumkick_left
			drumkick_right
		]
		amount = 1.1
		delay = $drum_kick_anim_delay}
endscript

script venue_pulseany 
	setspawninstancelimits \{max = 8
		management = ignore_spawn_request}
	venue_pulseonevents \{events = [
			hitnote_green
			hitnote_red
			hitnote_yellow
			hitnote_blue
			hitnote_orange
		]}
endscript

script venue_pulsegreenred 
	setspawninstancelimits \{max = 8
		management = ignore_spawn_request}
	venue_pulseonevents \{events = [
			hitnote_green
			hitnote_red
		]}
endscript

script venue_pulsegreenyellow 
	setspawninstancelimits \{max = 8
		management = ignore_spawn_request}
	venue_pulseonevents \{events = [
			hitnote_green
			hitnote_yellow
		]}
endscript

script venue_pulsegreenblue 
	setspawninstancelimits \{max = 8
		management = ignore_spawn_request}
	venue_pulseonevents \{events = [
			hitnote_green
			hitnote_blue
		]}
endscript

script venue_pulsegreenorange 
	setspawninstancelimits \{max = 8
		management = ignore_spawn_request}
	venue_pulseonevents \{events = [
			hitnote_green
			hitnote_orange
		]}
endscript

script venue_pulsegreenopen 
	setspawninstancelimits \{max = 8
		management = ignore_spawn_request}
	venue_pulseonevents \{events = [
			hitnote_green
		]}
endscript

script venue_pulseredyellow 
	setspawninstancelimits \{max = 8
		management = ignore_spawn_request}
	venue_pulseonevents \{events = [
			hitnote_red
			hitnote_yellow
		]}
endscript

script venue_pulseredblue 
	setspawninstancelimits \{max = 8
		management = ignore_spawn_request}
	venue_pulseonevents \{events = [
			hitnote_red
			hitnote_blue
		]}
endscript

script venue_pulseredorange 
	setspawninstancelimits \{max = 8
		management = ignore_spawn_request}
	venue_pulseonevents \{events = [
			hitnote_red
			hitnote_orange
		]}
endscript

script venue_pulseredopen 
	setspawninstancelimits \{max = 8
		management = ignore_spawn_request}
	venue_pulseonevents \{events = [
			hitnote_red
		]}
endscript

script venue_pulseyellowblue 
	setspawninstancelimits \{max = 8
		management = ignore_spawn_request}
	venue_pulseonevents \{events = [
			hitnote_yellow
			hitnote_blue
		]}
endscript

script venue_pulseyelloworange 
	setspawninstancelimits \{max = 8
		management = ignore_spawn_request}
	venue_pulseonevents \{events = [
			hitnote_yellow
			hitnote_orange
		]}
endscript

script venue_pulseyellowopen 
	setspawninstancelimits \{max = 8
		management = ignore_spawn_request}
	venue_pulseonevents \{events = [
			hitnote_yellow
		]}
endscript

script venue_pulseblueorange 
	setspawninstancelimits \{max = 8
		management = ignore_spawn_request}
	venue_pulseonevents \{events = [
			hitnote_blue
			hitnote_orange
		]}
endscript

script venue_pulseblueopen 
	setspawninstancelimits \{max = 8
		management = ignore_spawn_request}
	venue_pulseonevents \{events = [
			hitnote_blue
		]}
endscript

script venue_pulseorangeopen 
	setspawninstancelimits \{max = 8
		management = ignore_spawn_request}
	venue_pulseonevents \{events = [
			hitnote_orange
		]}
endscript

script visualizer_genericmood_enter 
	lightshow_cyclenextsnapshot \{usesnapshotpositions = true
		save = true}
endscript

script visualizer_genericmood_event 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_visualizer
		viewport = bg_viewport
		default
		viewport = visualizer_viewport
	endswitch
	lightshow_getparams
	getarraysize <av_presets>
	i = RandomInteger (-1.0, 1.0)
	begin
	i = (<i> + 1)
	if (<i> >= <array_size>)
		i = 0
	endif
	if isarray (<av_presets> [<i>])
		create_avfx primitives = (<av_presets> [<i>]) viewport = <viewport>
	else
		create_avfx profile = (<av_presets> [<i>]) viewport = <viewport>
	endif
	lightshow_cyclenextsnapshot \{usesnapshotpositions = true
		save = true}
	lightshow_waitfornextevent \{events = [
			snapshotchange
		]}
	repeat
endscript

script visualizer_genericmood_exit 
endscript
menu_last_mood_index = -1

script menu_lightshow 
	lightshow_setactive \{active = true}
	lightshow_dummyloop
	getarraysize \{$lightshow_menu_moods}
	begin
	getrandomvalue name = mood_index a = 0 b = (<array_size> -2) integer
	if (<mood_index> = $menu_last_mood_index)
		mood_index = (<mood_index> + 1)
	endif
	mood = ($lightshow_menu_moods [<mood_index>])
	getrandomvalue \{name = wait_time
		a = $lightshow_menu_min_time
		b = $lightshow_menu_max_time}
	lightshow_settime \{time = $lightshow_menu_transition_time}
	lightshow_setparams mood = <mood> performance = medium
	wait <wait_time> seconds
	change menu_last_mood_index = <mood_index>
	repeat
endscript
