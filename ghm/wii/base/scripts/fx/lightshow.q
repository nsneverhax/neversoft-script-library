lightshow_enabled = 1
lightshow_debug = 0
lightvolume_flarecutoff = 0.3
lightvolume_flarematerialcrc = FlareMaterial_FlareMaterial
lightvolume_flaresaturate = 0.6
lightvolume_follow = {
	allowedRadius = {
		amplitude = 0.2
		center = 1.0
		periodBase = 0.0065
		periodMultiples = [
			1
			3
			4
			7
		]
	}
	driftLerpMap = [
		(0.0, 0.4)
		(0.2, 0.7)
	]
}
lightshow_spotlightoverrides = {
	fade_time = 0.5
	snapshot_names_to_search = [
		Solo01
	]
	default_params = {
		StartRadius = 0.3
		EndRadius = 1.5
		InnerRadius = 0.0
		Range = 7.36
		VolumeDensity = 0.6442
		ProjectorColorRed = 170.0
		ProjectorColorGreen = 170.0
		ProjectorColorBlue = 170.0
		VolumeColorRed = 255.0
		VolumeColorGreen = 255.0
		VolumeColorBlue = 255.0
	}
}
lightshow_defaultblendtime = 0.15
lightshow_coloroverrideblend = 0.4
lightshow_offset_ms = 100
lightshow_projectortargetnames = {
}
lightshow_blobshadowtargetnames = {
	GUITARIST = [
	]
	guitarist01 = [
	]
	vocalist = [
	]
	BASSIST = [
	]
	dancer01 = [
	]
	dancer02 = [
	]
}
lightshow_spotlights = [
]
lightshow_customweights = [
]
lightshow_groupremap = {
	Band = [
		Band
		Alt_Band
		GUITARIST
		BASSIST
		vocalist
		drummer
	]
}
lightshow_debuglightgrouppriorities = 0
0x34abba0e = {
	Default = {
		0x67776396 = 20
		0x40301151 = 1.0
		0xfd227566 = 0.8
		0xd7d33493 = [
			1.0
			0.5
			0.1
			0.04
		]
		0xb1165287 = 1.0
		0xfa9d81ed = [
		]
	}
	z_justice = {
		0x67776396 = 20
		0x40301151 = 0.9
		0xfd227566 = 0.8
		0xd7d33493 = [
			1.0
			0.5
			0.1
			0.04
		]
		0xb1165287 = 1.0
		0xfa9d81ed = [
		]
	}
	z_icecave = {
		0x67776396 = 20
		0x40301151 = 0.9
		0xfd227566 = 0.8
		0xd7d33493 = [
			0.95
			0.5
			0.1
			0.04
		]
		0xb1165287 = 0.8
		0xfa9d81ed = [
		]
	}
	z_soundcheck = {
		0x67776396 = 10
		0x40301151 = 1.0
		0xfd227566 = 0.8
		0xd7d33493 = [
			1.0
			0.5
			0.1
			0.04
		]
		0xb1165287 = 0.1
	}
	z_soundcheck_cas = {
		0x67776396 = 10
		0x40301151 = 1.0
		0xfd227566 = 0.8
		0xd7d33493 = [
			1.0
			0.5
			0.1
			0.04
		]
		0xb1165287 = 0.1
	}
}
lightshow_housingmodels = [
]

script 0x8bfa392d 
	if GotParam \{zone}
		if StructureContains structure = $0x34abba0e <zone>
			printf qs(0x87764a54) s = <zone>
			0xb80b667e ($0x34abba0e.<zone>)
			return
		else
			printf qs(0x395cf574) s = <zone>
		endif
	endif
	printf \{qs(0xc38c4a0e)}
	0xb80b667e ($0x34abba0e.Default)
endscript

script LightShow_CreatePermModels 
endscript

script LS_AllOff 
	KillSpawnedScript \{id = LightShow}
endscript

script LS_SetupVenueLights 
endscript

script LS_ResetVenueLights 
	LS_AllOff
	LS_KillFX
	GetPakManCurrent \{map = zones}
endscript

script LS_KillFX 
endscript
lightshow_spotlightfollownames = [
	GUITARIST
	vocalist
	BASSIST
	drummer
]
LightShow_ColorOverrides = {
	red = (255.0, 0.0, 0.0)
	blue = (20.0, 132.0, 247.0)
	yellow = (252.0, 227.0, 61.0)
	white = (255.0, 255.0, 255.0)
	Magenta = (240.0, 79.0, 255.0)
	green = (66.0, 228.0, 97.0)
	Purple = (162.0, 80.0, 232.0)
	orange = (248.0, 142.0, 56.0)
}
LightShow_ColorOverrideExcludeLights = [
]
LightShow_StateNodeFlags = [
	LS_PERF_POOR
	LS_PERF_MEDIUM
	LS_PERF_GOOD
	LS_PERF_POOR_MEDIUM
	LS_PERF_MEDIUM_GOOD
	LS_PERF_POOR_MEDIUM_GOOD
	LS_PERF_POOR_NOBLACKOUT
	LS_PERF_MEDIUM_NOBLACKOUT
	LS_PERF_GOOD_NOBLACKOUT
	LS_PERF_POOR_MEDIUM_NOBLACKOUT
	LS_PERF_MEDIUM_GOOD_NOBLACKOUT
	LS_PERF_POOR_MEDIUM_GOOD_NOBLACKOUT
	ls_mood_intro
	LS_MOOD_BLACKOUT
	LS_MOOD_FLARE
	LS_MOOD_STROBE
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
]
LightShow_StateNodeFlagMapping = {
	performance = {
		poor = [
			{
				LS_PERF_POOR
				1
			}
			{
				LS_PERF_POOR_MEDIUM
				1
			}
			{
				LS_PERF_POOR_MEDIUM_GOOD
				1
			}
			{
				LS_PERF_POOR_NOBLACKOUT
				1
			}
			{
				LS_PERF_POOR_MEDIUM_NOBLACKOUT
				1
			}
			{
				LS_PERF_POOR_MEDIUM_GOOD_NOBLACKOUT
				1
			}
		]
		medium = [
			{
				LS_PERF_POOR_MEDIUM
				1
			}
			{
				LS_PERF_MEDIUM
				1
			}
			{
				LS_PERF_MEDIUM_GOOD
				1
			}
			{
				LS_PERF_POOR_MEDIUM_GOOD
				1
			}
			{
				LS_PERF_POOR_MEDIUM_NOBLACKOUT
				1
			}
			{
				LS_PERF_MEDIUM_NOBLACKOUT
				1
			}
			{
				LS_PERF_MEDIUM_GOOD_NOBLACKOUT
				1
			}
			{
				LS_PERF_POOR_MEDIUM_GOOD_NOBLACKOUT
				1
			}
		]
		good = [
			{
				LS_PERF_MEDIUM_GOOD
				1
			}
			{
				LS_PERF_GOOD
				1
			}
			{
				LS_PERF_POOR_MEDIUM_GOOD
				1
			}
			{
				LS_PERF_MEDIUM_GOOD_NOBLACKOUT
				1
			}
			{
				LS_PERF_GOOD_NOBLACKOUT
				1
			}
			{
				LS_PERF_POOR_MEDIUM_GOOD_NOBLACKOUT
				1
			}
		]
	}
	mood = {
		Intro = [
			{
				ls_mood_intro
				1
			}
		]
		blackout = [
			{
				LS_MOOD_BLACKOUT
				1
			}
			{
				LS_PERF_POOR
				0
			}
			{
				LS_PERF_MEDIUM
				0
			}
			{
				LS_PERF_GOOD
				0
			}
			{
				LS_PERF_POOR_MEDIUM
				0
			}
			{
				LS_PERF_MEDIUM_GOOD
				0
			}
			{
				LS_PERF_POOR_MEDIUM_GOOD
				0
			}
		]
		flare = [
			{
				LS_MOOD_FLARE
				1
			}
			{
				LS_PERF_POOR
				0
			}
			{
				LS_PERF_MEDIUM
				0
			}
			{
				LS_PERF_GOOD
				0
			}
			{
				LS_PERF_POOR_MEDIUM
				0
			}
			{
				LS_PERF_MEDIUM_GOOD
				0
			}
			{
				LS_PERF_POOR_MEDIUM_GOOD
				0
			}
		]
		strobe = [
			{
				LS_MOOD_STROBE
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
	}
}
LightShow_NoteMapping = [
	{
		MidiNote = 105
		Scr = lightshow_spotlightcolor
		params = {
			Color = red
		}
	}
	{
		MidiNote = 104
		Scr = lightshow_spotlightcolor
		params = {
			Color = orange
		}
	}
	{
		MidiNote = 103
		Scr = lightshow_spotlightcolor
		params = {
			Color = yellow
		}
	}
	{
		MidiNote = 102
		Scr = lightshow_spotlightcolor
		params = {
			Color = green
		}
	}
	{
		MidiNote = 101
		Scr = lightshow_spotlightcolor
		params = {
			Color = blue
		}
	}
	{
		MidiNote = 100
		Scr = lightshow_spotlightcolor
		params = {
			Color = Purple
		}
	}
	{
		MidiNote = 99
		Scr = lightshow_spotlightcolor
		params = {
			Color = Magenta
		}
	}
	{
		MidiNote = 98
		Scr = lightshow_spotlightcolor
		params = {
			Color = white
		}
	}
	{
		MidiNote = 97
		Scr = LightShow_EnableSpotlights
		params = {
			Enabled = true
			spots = [
				vocalist
			]
		}
	}
	{
		MidiNote = 96
		Scr = LightShow_EnableSpotlights
		params = {
			Enabled = FALSE
			spots = [
				vocalist
			]
		}
	}
	{
		MidiNote = 95
		Scr = LightShow_EnableSpotlights
		params = {
			Enabled = true
			spots = [
				GUITARIST
			]
		}
	}
	{
		MidiNote = 94
		Scr = LightShow_EnableSpotlights
		params = {
			Enabled = FALSE
			spots = [
				GUITARIST
			]
		}
	}
	{
		MidiNote = 93
		Scr = LightShow_EnableSpotlights
		params = {
			Enabled = true
			spots = [
				BASSIST
			]
		}
	}
	{
		MidiNote = 92
		Scr = LightShow_EnableSpotlights
		params = {
			Enabled = FALSE
			spots = [
				BASSIST
			]
		}
	}
	{
		MidiNote = 91
		Scr = LightShow_EnableSpotlights
		params = {
			Enabled = true
			spots = [
				drummer
			]
		}
	}
	{
		MidiNote = 90
		Scr = LightShow_EnableSpotlights
		params = {
			Enabled = FALSE
			spots = [
				drummer
			]
		}
	}
	{
		MidiNote = 88
		Scr = LightShow_SetParams
		params = {
			resetcycleonmoodchange = true
		}
	}
	{
		MidiNote = 87
		Scr = LightShow_SetParams
		params = {
			resetcycleonmoodchange = FALSE
		}
	}
	{
		MidiNote = 84
		Scr = LightShow_SetParams
		params = {
			mood = Intro
		}
	}
	{
		MidiNote = 83
		Scr = LightShow_SetParams
		params = {
			mood = blackout
		}
	}
	{
		MidiNote = 82
		Scr = LightShow_SetParams
		params = {
			mood = flare
		}
	}
	{
		MidiNote = 81
		Scr = LightShow_SetParams
		params = {
			mood = strobe
		}
	}
	{
		MidiNote = 80
		Scr = LightShow_SetParams
		params = {
			mood = wash
		}
	}
	{
		MidiNote = 79
		Scr = LightShow_SetParams
		params = {
			mood = prelude
		}
	}
	{
		MidiNote = 78
		Scr = LightShow_SetParams
		params = {
			mood = exposition
		}
	}
	{
		MidiNote = 77
		Scr = LightShow_SetParams
		params = {
			mood = risingaction
		}
	}
	{
		MidiNote = 76
		Scr = LightShow_SetParams
		params = {
			mood = tension
		}
	}
	{
		MidiNote = 75
		Scr = LightShow_SetParams
		params = {
			mood = climax
		}
	}
	{
		MidiNote = 74
		Scr = LightShow_SetParams
		params = {
			mood = fallingaction
		}
	}
	{
		MidiNote = 73
		Scr = LightShow_SetParams
		params = {
			mood = resolution
		}
	}
	{
		MidiNote = 72
		Scr = LightShow_SetParams
		params = {
			mood = pyro
		}
	}
	{
		MidiNote = 71
		Scr = LightShow_SetParams
		params = {
			mood = silhouette
		}
	}
	{
		MidiNote = 69
		Scr = LightShow_OverrideColor
		params = {
			Color = red
		}
	}
	{
		MidiNote = 68
		Scr = LightShow_OverrideColor
		params = {
			Color = orange
		}
	}
	{
		MidiNote = 67
		Scr = LightShow_OverrideColor
		params = {
			Color = yellow
		}
	}
	{
		MidiNote = 66
		Scr = LightShow_OverrideColor
		params = {
			Color = green
		}
	}
	{
		MidiNote = 65
		Scr = LightShow_OverrideColor
		params = {
			Color = blue
		}
	}
	{
		MidiNote = 64
		Scr = LightShow_OverrideColor
		params = {
			Color = Purple
		}
	}
	{
		MidiNote = 63
		Scr = LightShow_OverrideColor
		params = {
			Color = Magenta
		}
	}
	{
		MidiNote = 62
		Scr = LightShow_OverrideColor
		params = {
			Color = white
		}
	}
	{
		MidiNote = 61
		Scr = LightShow_OverrideColor
		params = {
			OFF
		}
	}
	{
		MidiNote = 60
		event = strobetoggle
		params = {
			UseSnapshotPositions = true
		}
	}
	{
		MidiNote = 58
		event = snapshotchange
		params = {
			UseSnapshotPositions = true
		}
	}
	{
		MidiNote = 57
		event = snapshotchange
		params = {
			UseSnapshotPositions = true
		}
	}
	{
		MidiNote = 53
		Scr = LightShow_SetTime
		params = {
			time = 1.0
		}
	}
	{
		MidiNote = 52
		Scr = LightShow_SetTime
		params = {
			time = 0.9
		}
	}
	{
		MidiNote = 51
		Scr = LightShow_SetTime
		params = {
			time = 0.8
		}
	}
	{
		MidiNote = 50
		Scr = LightShow_SetTime
		params = {
			time = 0.7
		}
	}
	{
		MidiNote = 49
		Scr = LightShow_SetTime
		params = {
			time = 0.6
		}
	}
	{
		MidiNote = 48
		Scr = LightShow_SetTime
		params = {
			time = 0.5
		}
	}
	{
		MidiNote = 47
		Scr = LightShow_SetTime
		params = {
			time = 0.4
		}
	}
	{
		MidiNote = 46
		Scr = LightShow_SetTime
		params = {
			time = 0.3
		}
	}
	{
		MidiNote = 45
		Scr = LightShow_SetTime
		params = {
			time = 0.25
		}
	}
	{
		MidiNote = 44
		Scr = LightShow_SetTime
		params = {
			time = 0.2
		}
	}
	{
		MidiNote = 43
		Scr = LightShow_SetTime
		params = {
			time = 0.15
		}
	}
	{
		MidiNote = 42
		Scr = LightShow_SetTime
		params = {
			time = 0.1
		}
	}
	{
		MidiNote = 41
		Scr = LightShow_SetTime
		params = {
			time = 0.05
		}
	}
	{
		MidiNote = 40
		Scr = LightShow_SetTime
		params = {
			time = 0.0
		}
	}
	{
		MidiNote = 39
		Scr = LightShow_SetTime
		params = {
			Default
		}
	}
	{
		MidiNote = 37
		Scr = LightShow_PyroEvent
		params = {
			Type = Generic
		}
	}
	{
		MidiNote = 35
		Scr = LightShow_PyroEvent
		params = {
			Type = front_1
		}
	}
	{
		MidiNote = 34
		Scr = LightShow_PyroEvent
		params = {
			Type = front_2
		}
	}
	{
		MidiNote = 33
		Scr = LightShow_PyroEvent
		params = {
			Type = front_3
		}
	}
	{
		MidiNote = 32
		Scr = LightShow_PyroEvent
		params = {
			Type = front_4
		}
	}
	{
		MidiNote = 31
		Scr = LightShow_PyroEvent
		params = {
			Type = top_1
		}
	}
	{
		MidiNote = 30
		Scr = LightShow_PyroEvent
		params = {
			Type = top_2
		}
	}
	{
		MidiNote = 29
		Scr = LightShow_PyroEvent
		params = {
			Type = top_3
		}
	}
	{
		MidiNote = 28
		Scr = LightShow_PyroEvent
		params = {
			Type = top_4
		}
	}
	{
		MidiNote = 27
		Scr = LightShow_PyroEvent
		params = {
			Type = mid_1
		}
	}
	{
		MidiNote = 26
		Scr = LightShow_PyroEvent
		params = {
			Type = mid_2
		}
	}
	{
		MidiNote = 25
		Scr = LightShow_PyroEvent
		params = {
			Type = mid_3
		}
	}
	{
		MidiNote = 24
		Scr = LightShow_PyroEvent
		params = {
			Type = mid_4
		}
	}
	{
		MidiNote = 23
		Scr = LightShow_PyroEvent
		params = {
			Type = back_1
		}
	}
	{
		MidiNote = 22
		Scr = LightShow_PyroEvent
		params = {
			Type = back_2
		}
	}
	{
		MidiNote = 21
		Scr = LightShow_PyroEvent
		params = {
			Type = back_3
		}
	}
	{
		MidiNote = 20
		Scr = LightShow_PyroEvent
		params = {
			Type = back_4
		}
	}
]
LightShow_SharedProcessors = [
	{
		Name = default_generic
		ScrEnter = LightShow_GenericMood_Enter
		ScrEvent = LightShow_GenericMood_Event
		ScrExit = LightShow_GenericMood_Exit
	}
	{
		Name = Poor_Generic
		ScrEnter = LightShow_Poor_Enter
		ScrEvent = LightShow_Poor_Event
		ScrExit = LightShow_Poor_Exit
	}
	{
		Name = Blackout_Generic
		ScrEnter = LightShow_Blackout_Enter
		ScrEvent = LightShow_Blackout_Event
		ScrExit = LightShow_Blackout_Exit
	}
	{
		Name = Flare_Generic
		ScrEnter = LightShow_Flare_Enter
		ScrEvent = LightShow_Flare_Event
		ScrExit = LightShow_Flare_Exit
	}
	{
		Name = Strobe_Generic
		ScrEnter = LightShow_GenericMood_Enter
		ScrEvent = LightShow_GenericMood_Event
		ScrExit = LightShow_GenericMood_Exit
	}
]

script lightshow_iterator 
	printf qs(0xc9557688) d = <time_offset>
	LightShow_SetActive \{Active = FALSE}
	if NOT CD
		DestroyScreenElement \{id = lightshow_debuganchor}
		DestroyScreenElement \{id = lightshow_debugcycleanchor}
		Change \{lightshow_debugcycle_index = 0}
		if ($lightshow_debug = 1)
			lightshow_displaydebuginfo
		endif
	endif
	if ($lightshow_enabled = 0)
		printf \{qs(0x46b6ad6b)}
		return
	endif
	get_song_prefix song = <song_name>
	formatText checksumName = event_array '%s_lightshow_notes' s = <song_prefix> AddToStringLookup
	if NOT GlobalExists Name = <event_array> Type = array
		printf \{qs(0x093d0e8a)}
		return
	endif
	if NOT LightShow_InitEventMappings
		return
	endif
	if (<parse_notetrack> = true)
		array_entry = 0
		fretbar_count = 0
		GetArraySize $<event_array>
		array_Size = (<array_Size> / 2)
		GetSongTimeMs time_offset = <time_offset>
		if NOT (<array_Size> = 0)
			begin
			if ((<time> - <skipleadin>) < $<event_array> [<array_entry>])
				break
			endif
			<array_entry> = (<array_entry> + 2)
			repeat <array_Size>
			array_Size = (<array_Size> - (<array_entry> / 2))
			if NOT (<array_Size> = 0)
				begin
				TimeMarkerReached_SetParams time_offset = <time_offset> array = <event_array> array_entry = <array_entry> perframe
				begin
				LightShow_Update
				if TimeMarkerReached
					GetSongTimeMs time_offset = <time_offset>
					break
				endif
				WaitOneGameFrame
				repeat
				TimeMarkerReached_ClearParams
				decompressnotevalue note_value = ($<event_array> [(<array_entry> + 1)])
				if LightShow_BeginProcessBlock {time = ($<event_array> [<array_entry>])
						note = <note>
						length = <length>}
					switch <process_mode>
						case event
						LightShow_PassEvent
						case Scr
						<eventscr> <eventParams>
					endswitch
					LightShow_EndProcessBlock
				endif
				<array_entry> = (<array_entry> + 2)
				repeat <array_Size>
			endif
		endif
	endif
	begin
	Wait \{1
		gameframe}
	LightShow_Update
	repeat
endscript

script lightshow_toggledebuginfo 
	if ($lightshow_debug = 1)
		Change \{lightshow_debug = 0}
		DestroyScreenElement \{id = lightshow_debuganchor}
	else
		Change \{lightshow_debug = 1}
		lightshow_displaydebuginfo
	endif
endscript

script lightshow_displaydebuginfo 
	DestroyScreenElement \{id = lightshow_debuganchor}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = lightshow_debuganchor
		Pos = (400.0, 440.0)
		z_priority = 1000}
	CreateScreenElement \{Type = SpriteElement
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
	CreateScreenElement \{Type = TextBlockElement
		parent = lightshow_debuganchor
		id = lightshow_debugtext
		just = [
			left
			top
		]
		Pos = (0.0, 0.0)
		dims = (1000.0, 1000.0)
		font = fontgrid_text_a11
		internal_scale = (0.6, 0.4)
		text = qs(0xcbc0eb10)}
	if NOT LightShow_GetParams
		lightshow_debugtext = qs(0x46e08381)
	endif
endscript

script LightShow_PyroEvent 
	if LightShow_GetPyroScript
		if StructureContains structure = pyro_scripts <Type>
			GetPakManCurrent \{map = zones}
			if NOT ((<pak> = z_studio) || (<pak> = z_studio2) || (<pak> = z_training) || (<pak> = z_soundcheck) || (<pak> = z_soundcheck2) || (<pak> = z_icecave))
				SoundEvent \{event = pyro}
			endif
			<Scr> = (<pyro_scripts>.<Type>)
			if LightShow_GetParams
				if ScriptExists <Scr>
					SpawnScriptNow <Scr> id = LightShow params = {performance = <performance>}
				endif
			endif
		else
			printf 'lightshow - pyro event skipped due to missing venue type %s' s = <Type>
		endif
	else
		printf \{'lightshow - pyro event skipped due to missing venue definitions'}
	endif
endscript

script LightShow_Poor_Enter 
	LightShow_CycleNextSnapshot \{UseSnapshotPositions = true
		save = true}
endscript

script LightShow_Poor_Exit 
endscript

script LightShow_Poor_Event 
	begin
	LightShow_WaitForNextEvent \{events = [
			snapshotchange
		]}
	repeat
endscript

script LightShow_GenericMood_Enter 
	LightShow_CycleNextSnapshot \{UseSnapshotPositions = true
		save = true}
endscript

script LightShow_GenericMood_Exit 
endscript

script LightShow_GenericMood_Event 
	begin
	LightShow_WaitForNextEvent \{events = [
			snapshotchange
		]}
	LightShow_CycleNextSnapshot UseSnapshotPositions = <UseSnapshotPositions> save = true
	repeat
endscript

script LightShow_Blackout_Enter 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_soundcheck
		case z_soundcheck_practice
		case z_training
		case z_viewer
		LightShow_AppendSnapshotParams \{Intensity = 0.25
			SpecularIntensity = 0.25}
	endswitch
	LightShow_CycleNextSnapshot \{save = FALSE
		UseSnapshotPositions = true}
endscript

script LightShow_Blackout_Event 
endscript

script LightShow_Blackout_Exit 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_soundcheck
		case z_soundcheck_practice
		case z_training
		case z_viewer
		LightShow_AppendSnapshotParams \{CLEAR}
	endswitch
endscript

script LightShow_Flare_Enter 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_soundcheck
		case z_soundcheck_practice
		case z_training
		case z_viewer
		LightShow_AppendSnapshotParams \{Intensity = 0.25
			SpecularIntensity = 0.25}
	endswitch
	LightShow_CycleNextSnapshot \{save = FALSE
		UseSnapshotPositions = true}
endscript

script LightShow_Flare_Event 
endscript

script LightShow_Flare_Exit 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_soundcheck
		case z_soundcheck_practice
		case z_training
		case z_viewer
		LightShow_AppendSnapshotParams \{CLEAR}
	endswitch
endscript

script LightShow_Strobe_Enter 
	LightShow_SetTime \{enable = FALSE}
endscript

script LightShow_Strobe_Event 
	LightShow_GetParams
	<original_snapshot> = <previous_snapshot>
	begin
	LightShow_CycleNextSnapshot \{UseSnapshotPositions = FALSE
		save = FALSE}
	LightShow_WaitForNextEvent \{events = [
			strobetoggle
		]}
	LightShow_AppendSnapshotParams \{Intensity = 0.85}
	if GotParam \{original_snapshot}
		LightShow_PlaySnapshot Name = <original_snapshot> save = FALSE UseSnapshotPositions = FALSE
	else
		LightShow_CycleNextSnapshot \{UseSnapshotPositions = FALSE
			save = true}
	endif
	LightShow_WaitForNextEvent \{events = [
			strobetoggle
		]}
	repeat
endscript

script LightShow_Strobe_Exit 
	LightShow_AppendSnapshotParams \{CLEAR}
	LightShow_SetTime \{enable = true}
endscript

script LightShow_AddNodeFlags 
	GetArraySize \{$LightShow_StateNodeFlags}
	<i> = 0
	begin
	CreateNodeFlag ($LightShow_StateNodeFlags [<i>])
	<i> = (<i> + 1)
	repeat <array_Size>
	CreateNodeFlag \{LS_ALWAYS}
	CreateNodeFlag \{LS_3_5_PRE}
	CreateNodeFlag \{LS_3_5_POST}
	CreateNodeFlag \{LS_ENCORE_PRE}
	CreateNodeFlag \{LS_ENCORE_POST}
	CreateNodeFlag \{ls_encore_post2}
	CreateNodeFlag \{LS_SPOTLIGHT_GUITARIST}
	CreateNodeFlag \{LS_SPOTLIGHT_BASSIST}
	CreateNodeFlag \{ls_perf_round}
	CreateNodeFlag \{ls_perf_standard}
	CreateNodeFlag \{ls_perf_round_m1}
	CreateNodeFlag \{ls_perf_round_m2}
	CreateNodeFlag \{ls_perf_round_m3}
	CreateNodeFlag \{ls_perf_round_m4}
	CreateNodeFlag \{ls_perf_round_m5}
	CreateNodeFlag \{ls_perf_round_m6}
	CreateNodeFlag \{ls_perf_round_m7}
	CreateNodeFlag \{ls_perf_round_m8}
	CreateNodeFlag \{ls_perf_round_v}
	CreateNodeFlag \{ls_perf_openingact}
	CreateNodeFlag \{ls_perf_metallica}
endscript

script LightShow_InitEventMappings 
	LightShow_AppendSnapshotParams \{CLEAR}
	LightShow_OverrideColor \{OFF}
	LightShow_SetTime \{Default
		enable = true}
	LightShow_SetActive \{Active = FALSE}
	ChangeNodeFlag \{LS_SPOTLIGHT_GUITARIST
		1}
	if ($current_num_players = 1)
		ChangeNodeFlag \{LS_SPOTLIGHT_BASSIST
			0}
	else
		ChangeNodeFlag \{LS_SPOTLIGHT_BASSIST
			1}
	endif
	if GotParam \{force_pakname}
		<pakname> = <force_pakname>
	else
		if NOT GetPakManCurrentName \{map = zones}
			printf \{qs(0xe20be0e2)}
			printstruct <...>
			return \{FALSE}
		endif
	endif
	formatText checksumName = event_struct '%s_lightshow_mapping' s = <pakname> AddToStringLookup
	formatText checksumName = snapshot_struct '%s_snapshots' s = <pakname> AddToStringLookup
	formatText checksumName = material_snapshot_struct '%s_material_snapshots' s = <pakname> AddToStringLookup
	formatText checksumName = processors_struct '%s_lightshow_processors' s = <pakname> AddToStringLookup
	if NOT GlobalExists Name = <event_struct> Type = structure
		printf \{qs(0xce52f5c2)}
		printstruct <...>
		return \{FALSE}
	endif
	if NOT GlobalExists Name = <snapshot_struct> Type = structure
		printf \{qs(0xdc2d0c88)}
		printstruct <...>
		return \{FALSE}
	endif
	if GlobalExists Name = <processors_struct> Type = array
		printf \{qs(0x23e129d8)}
		LightShow_SetProcessors venue = $<processors_struct>
	endif
	LightShow_SetMapping ($<event_struct>)
	LightShow_SetActive \{Active = true}
	LightShow_SetParams {
		performance = medium
		mood = Intro
		VenueSnapshots = $<snapshot_struct>
		venuematerialsnapshotsname = <material_snapshot_struct>
	}
	lightshow_spotlightcolor \{Color = white}
	if NOT ($debug_forcescore = OFF)
		CrowdIncrease \{player_status = player1_status}
	endif
	formatText checksumName = venue_setup_scr '%s_SetupLightShow' s = <pakname> AddToStringLookup
	if ScriptExists <venue_setup_scr>
		SpawnScriptNow <venue_setup_scr> id = LightShow
	endif
	<parse_notetrack> = true
	switch <pakname>
		case 'z_studio2'
		<parse_notetrack> = FALSE
		case 'z_meadowlands'
		if GetNodeFlag \{LS_ENCORE_POST}
			<parse_notetrack> = FALSE
			SpawnScriptNow \{z_meadowlands_encore_lightshow
				id = LightShow}
		endif
	endswitch
	return true parse_notetrack = <parse_notetrack>
endscript

script lightshow_dummyloop 
	KillSpawnedScript \{Name = lightshow_dummyloop_spawned}
	SpawnScriptNow \{lightshow_dummyloop_spawned
		id = LightShow}
endscript

script lightshow_dummyloop_spawned 
	begin
	LightShow_Update
	Wait \{1
		gameframes}
	repeat
endscript

script LightShow_Shutdown 
	printf \{qs(0x9010c422)}
	LightShow_SetActive \{Active = FALSE}
	LightShow_SetProcessors \{CLEAR}
	LightShow_SetMapping \{CLEAR}
	KillSpawnedScript \{Name = lightshow_iterator}
	KillSpawnedScript \{id = LightShow}
	printf \{qs(0x4d49808d)}
endscript

script lightshow_songfailed 
	KillSpawnedScript \{Name = lightshow_iterator}
	KillSpawnedScript \{id = LightShow}
	LightShow_EnableSpotlights \{Enabled = FALSE
		spots = [
			vocalist
			GUITARIST
			BASSIST
			drummer
		]}
endscript
lightshow_debugcycle_index = 0

script lightshow_is_spotlight_snapshot 
	if NOT GetPakManCurrentName \{map = zones}
		return \{FALSE}
	endif
	formatText checksumName = mapping '%s_lightshow_mapping' s = <pakname>
	if NOT GlobalExists Name = <mapping>
		return \{FALSE}
	endif
	if NOT StructureContains structure = $<mapping> spotlight_snapshots
		return \{FALSE}
	endif
	<snps> = ($<mapping>.spotlight_snapshots)
	<checks> = [red orange yellow green blue Purple Magenta white OFF]
	GetArraySize <checks>
	<i> = 0
	begin
	<check> = (<checks> [<i>])
	<i> = (<i> + 1)
	if StructureContains structure = <snps> <check>
		<snp> = (<snps>.<check>)
		if (<Name> = <snp>)
			return \{true}
		endif
	endif
	repeat <array_Size>
	return \{FALSE}
endscript

script lightshow_debugcycle_init 
	if NOT LightShow_GetParams
		if NOT LightShow_InitEventMappings
			return \{FALSE}
		endif
	endif
	return \{true}
endscript

script lightshow_debugcycle 
	if NOT lightshow_debugcycle_init
		return
	endif
	if NOT GetPakManCurrentName \{map = zones}
		return
	endif
	formatText checksumName = names_list '%s_snapshot_names' s = <pakname>
	if NOT GlobalExists Name = <names_list>
		return
	endif
	GetArraySize ($<names_list>)
	if ($lightshow_debugcycle_index >= <array_Size>)
		Change \{lightshow_debugcycle_index = 0}
	endif
	KillSpawnedScript \{Name = lightshow_iterator}
	lightshow_dummyloop
	LightShow_SetTime \{time = 0.0}
	begin
	<snapshot_name> = ($<names_list> [$lightshow_debugcycle_index])
	formatText checksumName = snapshot_crc <snapshot_name>
	formatText TextName = debug_text qs(0x3beef43d) s = <snapshot_name>
	Change lightshow_debugcycle_index = ($lightshow_debugcycle_index + 1)
	if lightshow_is_spotlight_snapshot Name = <snapshot_crc>
	else
		break
	endif
	repeat
	LightShow_PlaySnapshot Name = <snapshot_crc> save = true UseSnapshotPositions = true
	DestroyScreenElement \{id = lightshow_debugcycleanchor}
	CreateScreenElement {
		Type = TextElement
		parent = root_window
		id = lightshow_debugcycleanchor
		just = [left top]
		Pos = (75.0, 550.0)
		font = fontgrid_text_a6
		z_priority = 50
		text = <debug_text>
		use_shadow = true
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
	}
endscript

script Venue_PulseOnEvents \{amount = 1.12
		time = 0.1}
	if GotParam \{delay}
		RequireParams \{[
				events
			]
			all}
		Obj_EnableScaling
		Obj_GetScaling
		<start_scale> = <scaling>
		<end_scale> = (<scaling> * <amount>)
		begin
		Block anytypes = <events>
		Wait <delay> Seconds
		Obj_ApplyScaling Scale = <end_scale>
		WaitOneGameFrame
		Obj_MorphScaling target_scale = <start_scale> blend_duration = <time>
		repeat
	else
		AddPulseEvent events = <events> amount = <amount> time = <time>
	endif
endscript

script Venue_PulseGreen 
	SetSpawnInstanceLimits \{Max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Green
		]}
endscript

script Venue_PulseRed 
	SetSpawnInstanceLimits \{Max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Red
		]}
endscript

script Venue_PulseYellow 
	SetSpawnInstanceLimits \{Max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Yellow
		]}
endscript

script Venue_PulseBlue 
	SetSpawnInstanceLimits \{Max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Blue
		]}
endscript

script Venue_PulseOrange 
	SetSpawnInstanceLimits \{Max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Orange
		]}
endscript

script Venue_PulseOpen 
	SetSpawnInstanceLimits \{Max = 8
		management = ignore_spawn_request}
endscript

script Venue_PulseDrumLeft 
	SetSpawnInstanceLimits \{Max = 2
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			DrumKick_Left
		]
		amount = 1.1
		delay = $drum_kick_anim_delay}
endscript

script Venue_PulseDrumRight 
	SetSpawnInstanceLimits \{Max = 2
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			DrumKick_Right
		]
		amount = 1.1
		delay = $drum_kick_anim_delay}
endscript

script Venue_PulseDrumBoth 
	SetSpawnInstanceLimits \{Max = 4
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			DrumKick_Left
			DrumKick_Right
		]
		amount = 1.1
		delay = $drum_kick_anim_delay}
endscript

script Venue_PulseAny 
	SetSpawnInstanceLimits \{Max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Green
			HitNote_Red
			HitNote_Yellow
			HitNote_Blue
			HitNote_Orange
		]}
endscript

script Venue_PulseGreenRed 
	SetSpawnInstanceLimits \{Max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Green
			HitNote_Red
		]}
endscript

script Venue_PulseGreenYellow 
	SetSpawnInstanceLimits \{Max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Green
			HitNote_Yellow
		]}
endscript

script Venue_PulseGreenBlue 
	SetSpawnInstanceLimits \{Max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Green
			HitNote_Blue
		]}
endscript

script Venue_PulseGreenOrange 
	SetSpawnInstanceLimits \{Max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Green
			HitNote_Orange
		]}
endscript

script Venue_PulseGreenOpen 
	SetSpawnInstanceLimits \{Max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Green
		]}
endscript

script Venue_PulseRedYellow 
	SetSpawnInstanceLimits \{Max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Red
			HitNote_Yellow
		]}
endscript

script Venue_PulseRedBlue 
	SetSpawnInstanceLimits \{Max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Red
			HitNote_Blue
		]}
endscript

script Venue_PulseRedOrange 
	SetSpawnInstanceLimits \{Max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Red
			HitNote_Orange
		]}
endscript

script Venue_PulseRedOpen 
	SetSpawnInstanceLimits \{Max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Red
		]}
endscript

script Venue_PulseYellowBlue 
	SetSpawnInstanceLimits \{Max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Yellow
			HitNote_Blue
		]}
endscript

script Venue_PulseYellowOrange 
	SetSpawnInstanceLimits \{Max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Yellow
			HitNote_Orange
		]}
endscript

script Venue_PulseYellowOpen 
	SetSpawnInstanceLimits \{Max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Yellow
		]}
endscript

script Venue_PulseBlueOrange 
	SetSpawnInstanceLimits \{Max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Blue
			HitNote_Orange
		]}
endscript

script Venue_PulseBlueOpen 
	SetSpawnInstanceLimits \{Max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Blue
		]}
endscript

script Venue_PulseOrangeOpen 
	SetSpawnInstanceLimits \{Max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Orange
		]}
endscript

script lightshow_spotlightcolor 
endscript
