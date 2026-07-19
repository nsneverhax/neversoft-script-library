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
lightshow_defaultblendtime = 0.15
lightshow_coloroverrideblend = 0.4
lightshow_offset_ms = 100
lightshow_housingmodels = [
]

script LightShow_CreatePermModels 
endscript

script LS_AllOff 
endscript

script LS_SetupVenueLights 
endscript

script LS_ResetVenueLights 
endscript

script LS_KillFX 
endscript
lightshow_SpotlightFollowNames = [
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
	LS_MOOD_INTRO
	LS_MOOD_BLACKOUT
	LS_MOOD_FLARE
	LS_MOOD_STROBE
	LS_MOOD_WASH
	LS_MOOD_PRELUDE
	LS_MOOD_EXPOSITION
	LS_MOOD_RISING
	LS_MOOD_TENSION
	LS_MOOD_CLIMAX
	LS_MOOD_FALLING
	LS_MOOD_RESOLUTION
	LS_MOOD_PYRO
	LS_MOOD_SILHOUETTE
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
		intro = [
			{
				LS_MOOD_INTRO
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
				LS_MOOD_WASH
				1
			}
		]
		prelude = [
			{
				LS_MOOD_PRELUDE
				1
			}
		]
		exposition = [
			{
				LS_MOOD_EXPOSITION
				1
			}
		]
		risingAction = [
			{
				LS_MOOD_RISING
				1
			}
		]
		tension = [
			{
				LS_MOOD_TENSION
				1
			}
		]
		climax = [
			{
				LS_MOOD_CLIMAX
				1
			}
		]
		fallingAction = [
			{
				LS_MOOD_FALLING
				1
			}
		]
		resolution = [
			{
				LS_MOOD_RESOLUTION
				1
			}
		]
		pyro = [
			{
				LS_MOOD_PYRO
				1
			}
		]
		silhouette = [
			{
				LS_MOOD_SILHOUETTE
				1
			}
		]
	}
}
LightShow_NoteMapping = [
	{
		MidiNote = 105
		Scr = LightShow_SpotlightColor
		params = {
			color = red
		}
	}
	{
		MidiNote = 104
		Scr = LightShow_SpotlightColor
		params = {
			color = Orange
		}
	}
	{
		MidiNote = 103
		Scr = LightShow_SpotlightColor
		params = {
			color = Yellow
		}
	}
	{
		MidiNote = 102
		Scr = LightShow_SpotlightColor
		params = {
			color = green
		}
	}
	{
		MidiNote = 101
		Scr = LightShow_SpotlightColor
		params = {
			color = Blue
		}
	}
	{
		MidiNote = 100
		Scr = LightShow_SpotlightColor
		params = {
			color = Purple
		}
	}
	{
		MidiNote = 99
		Scr = LightShow_SpotlightColor
		params = {
			color = Magenta
		}
	}
	{
		MidiNote = 98
		Scr = LightShow_SpotlightColor
		params = {
			color = white
		}
	}
	{
		MidiNote = 97
		Scr = LightShow_EnableSpotlights
		params = {
			enabled = true
			spots = [
				vocalist
			]
		}
	}
	{
		MidiNote = 96
		Scr = LightShow_EnableSpotlights
		params = {
			enabled = false
			spots = [
				vocalist
			]
		}
	}
	{
		MidiNote = 95
		Scr = LightShow_EnableSpotlights
		params = {
			enabled = true
			spots = [
				Guitarist
			]
		}
	}
	{
		MidiNote = 94
		Scr = LightShow_EnableSpotlights
		params = {
			enabled = false
			spots = [
				Guitarist
			]
		}
	}
	{
		MidiNote = 93
		Scr = LightShow_EnableSpotlights
		params = {
			enabled = true
			spots = [
				bassist
			]
		}
	}
	{
		MidiNote = 92
		Scr = LightShow_EnableSpotlights
		params = {
			enabled = false
			spots = [
				bassist
			]
		}
	}
	{
		MidiNote = 91
		Scr = LightShow_EnableSpotlights
		params = {
			enabled = true
			spots = [
				Drummer
			]
		}
	}
	{
		MidiNote = 90
		Scr = LightShow_EnableSpotlights
		params = {
			enabled = false
			spots = [
				Drummer
			]
		}
	}
	{
		MidiNote = 88
		Scr = LightShow_SetParams
		params = {
			ResetCycleOnMoodChange = true
		}
	}
	{
		MidiNote = 87
		Scr = LightShow_SetParams
		params = {
			ResetCycleOnMoodChange = false
		}
	}
	{
		MidiNote = 84
		Scr = LightShow_SetParams
		params = {
			mood = intro
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
			mood = risingAction
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
			mood = fallingAction
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
			color = red
		}
	}
	{
		MidiNote = 68
		Scr = LightShow_OverrideColor
		params = {
			color = Orange
		}
	}
	{
		MidiNote = 67
		Scr = LightShow_OverrideColor
		params = {
			color = Yellow
		}
	}
	{
		MidiNote = 66
		Scr = LightShow_OverrideColor
		params = {
			color = green
		}
	}
	{
		MidiNote = 65
		Scr = LightShow_OverrideColor
		params = {
			color = Blue
		}
	}
	{
		MidiNote = 64
		Scr = LightShow_OverrideColor
		params = {
			color = Purple
		}
	}
	{
		MidiNote = 63
		Scr = LightShow_OverrideColor
		params = {
			color = Magenta
		}
	}
	{
		MidiNote = 62
		Scr = LightShow_OverrideColor
		params = {
			color = white
		}
	}
	{
		MidiNote = 61
		Scr = LightShow_OverrideColor
		params = {
			off
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
			`default`
		}
	}
	{
		MidiNote = 37
		Scr = LightShow_PyroEvent
		params = {
			type = generic
		}
	}
	{
		MidiNote = 35
		Scr = LightShow_PyroEvent
		params = {
			type = front_1
		}
	}
	{
		MidiNote = 34
		Scr = LightShow_PyroEvent
		params = {
			type = front_2
		}
	}
	{
		MidiNote = 33
		Scr = LightShow_PyroEvent
		params = {
			type = front_3
		}
	}
	{
		MidiNote = 32
		Scr = LightShow_PyroEvent
		params = {
			type = front_4
		}
	}
	{
		MidiNote = 31
		Scr = LightShow_PyroEvent
		params = {
			type = top_1
		}
	}
	{
		MidiNote = 30
		Scr = LightShow_PyroEvent
		params = {
			type = top_2
		}
	}
	{
		MidiNote = 29
		Scr = LightShow_PyroEvent
		params = {
			type = top_3
		}
	}
	{
		MidiNote = 28
		Scr = LightShow_PyroEvent
		params = {
			type = top_4
		}
	}
	{
		MidiNote = 27
		Scr = LightShow_PyroEvent
		params = {
			type = mid_1
		}
	}
	{
		MidiNote = 26
		Scr = LightShow_PyroEvent
		params = {
			type = mid_2
		}
	}
	{
		MidiNote = 25
		Scr = LightShow_PyroEvent
		params = {
			type = mid_3
		}
	}
	{
		MidiNote = 24
		Scr = LightShow_PyroEvent
		params = {
			type = mid_4
		}
	}
	{
		MidiNote = 23
		Scr = LightShow_PyroEvent
		params = {
			type = back_1
		}
	}
	{
		MidiNote = 22
		Scr = LightShow_PyroEvent
		params = {
			type = back_2
		}
	}
	{
		MidiNote = 21
		Scr = LightShow_PyroEvent
		params = {
			type = back_3
		}
	}
	{
		MidiNote = 20
		Scr = LightShow_PyroEvent
		params = {
			type = back_4
		}
	}
]
LightShow_SharedProcessors = [
	{
		name = Proc_OneIntro01
		ScrEnter = LightShow_GenericMood_Enter
		ScrEvent = nullscript
		ScrExit = nullscript
	}
	{
		name = Proc_OneIntro02
		ScrEnter = LightShow_GenericMood_Enter
		ScrEvent = nullscript
		ScrExit = nullscript
	}
	{
		name = Proc_FFWFIntro01
		ScrEnter = LightShow_GenericMood_Enter
		ScrEvent = nullscript
		ScrExit = nullscript
	}
	{
		name = Proc_FFWFIntro02
		ScrEnter = LightShow_GenericMood_Enter
		ScrEvent = nullscript
		ScrExit = nullscript
	}
	{
		name = Default_Generic
		ScrEnter = LightShow_GenericMood_Enter
		ScrEvent = LightShow_GenericMood_Event
		ScrExit = LightShow_GenericMood_Exit
	}
	{
		name = Poor_Generic
		ScrEnter = LightShow_Poor_Enter
		ScrEvent = LightShow_Poor_Event
		ScrExit = LightShow_Poor_Exit
	}
	{
		name = Blackout_Generic
		ScrEnter = LightShow_Blackout_Enter
		ScrEvent = LightShow_Blackout_Event
		ScrExit = LightShow_Blackout_Exit
	}
	{
		name = Flare_Generic
		ScrEnter = LightShow_Flare_Enter
		ScrEvent = LightShow_Flare_Event
		ScrExit = LightShow_Flare_Exit
	}
	{
		name = Strobe_Generic
		ScrEnter = LightShow_GenericMood_Enter
		ScrEvent = LightShow_GenericMood_Event
		ScrExit = LightShow_GenericMood_Exit
	}
]

script lightshow_iterator 
	printf qs("\LLightShow Iterator started with time %d") d = <time_offset>
	LightShow_SetActive \{active = false}
	if NOT CD
		DestroyScreenElement \{id = LightShow_DebugAnchor}
		DestroyScreenElement \{id = LightShow_DebugCycleAnchor}
		change \{LightShow_DebugCycle_Index = 0}
		if ($lightshow_debug = 1)
			LightShow_DisplayDebugInfo
		endif
	endif
	if ($lightshow_enabled = 0)
		printf \{qs("\LLIGHTSHOW DISABLED: By script variable")}
		return
	endif
	get_song_prefix song = <song_name>
	FormatText checksumname = event_array '%s_lightshow_notes' s = <song_prefix> AddToStringLookup
	if NOT GlobalExists name = <event_array> type = array
		printf \{qs("\LLIGHTSHOW DISABLED: No midi events found for this song")}
		return
	endif
	if NOT LightShow_InitEventMappings
		return
	endif
	if (<parse_notetrack> = true)
		array_entry = 0
		fretbar_count = 0
		GetArraySize $<event_array>
		array_size = (<array_size> / 2)
		GetSongTimeMs time_offset = <time_offset>
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
				TimeMarkerReached_SetParams time_offset = <time_offset> array = <event_array> array_entry = <array_entry> PerFrame
				begin
				LightShow_Update
				if TimeMarkerReached
					GetSongTimeMs time_offset = <time_offset>
					break
				endif
				Wait \{1
					gameframe}
				repeat
				TimeMarkerReached_ClearParams
				DecompressNoteValue note_value = ($<event_array> [(<array_entry> + 1)])
				if LightShow_BeginProcessBlock {time = ($<event_array> [<array_entry>])
						note = <note>
						length = <length>}
					switch <process_mode>
						case event
						LightShow_PassEvent
						case Scr
						<eventscr> <eventparams>
					endswitch
					LightShow_EndProcessBlock
				endif
				<array_entry> = (<array_entry> + 2)
				repeat <array_size>
			endif
		endif
	endif
	if NOT CD
		if ScreenElementExists \{id = LightShow_DebugText}
			LightShow_DebugText :SE_SetProps \{text = qs("End")}
		endif
	endif
	begin
	Wait \{1
		gameframe}
	LightShow_Update
	repeat
endscript

script LightShow_ToggleDebugInfo 
	if ($lightshow_debug = 1)
		change \{lightshow_debug = 0}
		DestroyScreenElement \{id = LightShow_DebugAnchor}
	else
		change \{lightshow_debug = 1}
		LightShow_DisplayDebugInfo
	endif
endscript

script LightShow_DisplayDebugInfo 
	DestroyScreenElement \{id = LightShow_DebugAnchor}
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = LightShow_DebugAnchor
		pos = (400.0, 440.0)
		z_priority = 1000}
	CreateScreenElement \{type = SpriteElement
		parent = LightShow_DebugAnchor
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
	CreateScreenElement \{type = TextBlockElement
		parent = LightShow_DebugAnchor
		id = LightShow_DebugText
		just = [
			left
			top
		]
		pos = (0.0, 0.0)
		dims = (1000.0, 1000.0)
		font = fontgrid_text_a11
		internal_scale = (0.6, 0.4)
		text = qs("End")}
	if NOT LightShow_GetParams
		LightShow_DebugText = qs("Disabled")
	endif
endscript

script LightShow_PyroEvent 
	if LightShow_GetPyroScript
		if StructureContains Structure = pyro_scripts <type>
			GetPakManCurrent \{map = zones}
			if NOT ((<pak> = z_studio) || (<pak> = z_studio2) || (<pak> = z_training) || (<pak> = z_soundcheck) || (<pak> = z_soundcheck2) || (<pak> = z_IceCave))
				SoundEvent \{event = pyro}
			endif
			<Scr> = (<pyro_scripts>.<type>)
			if LightShow_GetParams
				if ScriptExists <Scr>
					spawnscriptnow <Scr> id = LightShow params = {performance = <performance>}
				endif
			endif
		else
			printf 'lightshow - pyro event skipped due to missing venue type %s' s = <type>
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
		LightShow_AppendSnapshotParams \{intensity = 0.25
			SpecularIntensity = 0.25}
	endswitch
	LightShow_CycleNextSnapshot \{save = false
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
		LightShow_AppendSnapshotParams \{Clear}
	endswitch
endscript

script LightShow_Flare_Enter 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_soundcheck
		case z_soundcheck_practice
		case z_training
		case z_viewer
		LightShow_AppendSnapshotParams \{intensity = 0.25
			SpecularIntensity = 0.25}
	endswitch
	LightShow_CycleNextSnapshot \{save = false
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
		LightShow_AppendSnapshotParams \{Clear}
	endswitch
endscript

script LightShow_Strobe_Enter 
	LightShow_SetTime \{enable = false}
endscript

script LightShow_Strobe_Event 
	LightShow_GetParams
	<original_snapshot> = <previous_snapshot>
	begin
	LightShow_CycleNextSnapshot \{UseSnapshotPositions = false
		save = false}
	LightShow_WaitForNextEvent \{events = [
			strobetoggle
		]}
	LightShow_AppendSnapshotParams \{intensity = 1.0}
	if GotParam \{original_snapshot}
		LightShow_PlaySnapshot name = <original_snapshot> save = false UseSnapshotPositions = false
	else
		LightShow_CycleNextSnapshot \{UseSnapshotPositions = false
			save = true}
	endif
	LightShow_WaitForNextEvent \{events = [
			strobetoggle
		]}
	repeat
endscript

script LightShow_Strobe_Exit 
	LightShow_AppendSnapshotParams \{Clear}
	LightShow_SetTime \{enable = true}
endscript

script LightShow_AddNodeFlags 
	GetArraySize \{$LightShow_StateNodeFlags}
	<i> = 0
	begin
	CreateNodeFlag ($LightShow_StateNodeFlags [<i>])
	<i> = (<i> + 1)
	repeat <array_size>
	CreateNodeFlag \{LS_ALWAYS}
	CreateNodeFlag \{LS_3_5_PRE}
	CreateNodeFlag \{LS_3_5_POST}
	CreateNodeFlag \{LS_ENCORE_PRE}
	CreateNodeFlag \{LS_ENCORE_POST}
	CreateNodeFlag \{LS_ENCORE_POST2}
	CreateNodeFlag \{LS_SPOTLIGHT_GUITARIST}
	CreateNodeFlag \{LS_SPOTLIGHT_BASSIST}
	CreateNodeFlag \{LS_PERF_ROUND}
	CreateNodeFlag \{LS_PERF_STANDARD}
	CreateNodeFlag \{LS_PERF_ROUND_M1}
	CreateNodeFlag \{LS_PERF_ROUND_M2}
	CreateNodeFlag \{LS_PERF_ROUND_M3}
	CreateNodeFlag \{LS_PERF_ROUND_M4}
	CreateNodeFlag \{LS_PERF_ROUND_M5}
	CreateNodeFlag \{LS_PERF_ROUND_M6}
	CreateNodeFlag \{LS_PERF_ROUND_M7}
	CreateNodeFlag \{LS_PERF_ROUND_M8}
	CreateNodeFlag \{LS_PERF_ROUND_V}
	CreateNodeFlag \{ls_perf_openingact}
	CreateNodeFlag \{LS_PERF_METALLICA}
endscript

script LightShow_InitEventMappings 
	LightShow_AppendSnapshotParams \{Clear}
	LightShow_OverrideColor \{off}
	LightShow_SetTime \{`default`
		enable = true}
	LightShow_SetActive \{active = false}
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
			printf \{qs("\LLIGHTSHOW DISABLED: No pakman item is loaded")}
			printstruct <...>
			return \{false}
		endif
	endif
	FormatText checksumname = event_struct '%s_lightshow_mapping' s = <pakname> AddToStringLookup
	FormatText checksumname = snapshot_struct '%s_snapshots' s = <pakname> AddToStringLookup
	FormatText checksumname = material_snapshot_struct '%s_material_snapshots' s = <pakname> AddToStringLookup
	FormatText checksumname = processors_struct '%s_lightshow_processors' s = <pakname> AddToStringLookup
	if NOT GlobalExists name = <event_struct> type = Structure
		printf \{qs("\LLIGHTSHOW DISABLED: No event mapping found for this venue")}
		printstruct <...>
		return \{false}
	endif
	if NOT GlobalExists name = <snapshot_struct> type = Structure
		printf \{qs("\LLIGHTSHOW DISABLED: No snapshots found for this venue")}
		printstruct <...>
		return \{false}
	endif
	if GlobalExists name = <processors_struct> type = array
		printf \{qs("\LLIGHTSHOW: Adding venue processor definitions")}
		LightShow_SetProcessors venue = $<processors_struct>
	endif
	LightShow_SetMapping ($<event_struct>)
	LightShow_SetActive \{active = true}
	LightShow_SetParams {
		performance = medium
		mood = intro
		VenueSnapshots = $<snapshot_struct>
		VenueMaterialSnapshotsName = <material_snapshot_struct>
	}
	LightShow_SpotlightColor \{color = white}
	if NOT ($debug_forcescore = off)
		CrowdIncrease \{player_status = player1_status}
	endif
	FormatText checksumname = venue_setup_scr '%s_SetupLightShow' s = <pakname> AddToStringLookup
	if ScriptExists <venue_setup_scr>
		spawnscriptnow <venue_setup_scr> id = LightShow
	endif
	<parse_notetrack> = true
	switch <pakname>
		case 'z_studio2'
		<parse_notetrack> = false
		case 'z_meadowlands'
		if GetNodeFlag \{LS_ENCORE_POST}
			<parse_notetrack> = false
			spawnscriptnow \{z_meadowlands_encore_lightshow
				id = LightShow}
		endif
	endswitch
	return true parse_notetrack = <parse_notetrack>
endscript

script LightShow_DummyLoop 
	KillSpawnedScript \{name = LightShow_DummyLoop_Spawned}
	spawnscriptnow \{LightShow_DummyLoop_Spawned
		id = LightShow}
endscript

script LightShow_DummyLoop_Spawned 
	begin
	LightShow_Update
	Wait \{1
		gameframes}
	repeat
endscript

script LightShow_Shutdown 
	printf \{qs("\LLightShow_Shutdown starting")}
	LightShow_SetActive \{active = false}
	LightShow_SetProcessors \{Clear}
	LightShow_SetMapping \{Clear}
	KillSpawnedScript \{name = lightshow_iterator}
	KillSpawnedScript \{id = LightShow}
	printf \{qs("\LLightShow_Shutdown finished")}
endscript

script LightShow_SongFailed 
	KillSpawnedScript \{name = lightshow_iterator}
	KillSpawnedScript \{id = LightShow}
	LightShow_EnableSpotlights \{enabled = false
		spots = [
			vocalist
			Guitarist
			bassist
			Drummer
		]}
endscript
LightShow_DebugCycle_Index = 0

script lightshow_is_spotlight_snapshot 
	if NOT GetPakManCurrentName \{map = zones}
		return \{false}
	endif
	FormatText checksumname = mapping '%s_lightshow_mapping' s = <pakname>
	if NOT GlobalExists name = <mapping>
		return \{false}
	endif
	if NOT StructureContains Structure = $<mapping> spotlight_snapshots
		return \{false}
	endif
	<snps> = ($<mapping>.spotlight_snapshots)
	<checks> = [red Orange Yellow green Blue Purple Magenta white off]
	GetArraySize <checks>
	<i> = 0
	begin
	<check> = (<checks> [<i>])
	<i> = (<i> + 1)
	if StructureContains Structure = <snps> <check>
		<snp> = (<snps>.<check>)
		if (<name> = <snp>)
			return \{true}
		endif
	endif
	repeat <array_size>
	return \{false}
endscript

script LightShow_DebugCycle_Init 
	if NOT LightShow_GetParams
		if NOT LightShow_InitEventMappings
			return \{false}
		endif
	endif
	return \{true}
endscript

script LightShow_DebugCycle 
	if NOT LightShow_DebugCycle_Init
		return
	endif
	if NOT GetPakManCurrentName \{map = zones}
		return
	endif
	FormatText checksumname = names_list '%s_snapshot_names' s = <pakname>
	if NOT GlobalExists name = <names_list>
		return
	endif
	GetArraySize ($<names_list>)
	if ($LightShow_DebugCycle_Index >= <array_size>)
		change \{LightShow_DebugCycle_Index = 0}
	endif
	KillSpawnedScript \{name = lightshow_iterator}
	LightShow_DummyLoop
	LightShow_SetTime \{time = 0.0}
	begin
	<snapshot_name> = ($<names_list> [$LightShow_DebugCycle_Index])
	FormatText checksumname = snapshot_crc <snapshot_name>
	FormatText TextName = debug_text qs("Snapshot: %s") s = <snapshot_name>
	change LightShow_DebugCycle_Index = ($LightShow_DebugCycle_Index + 1)
	if lightshow_is_spotlight_snapshot name = <snapshot_crc>
	else
		break
	endif
	repeat
	LightShow_PlaySnapshot name = <snapshot_crc> save = true UseSnapshotPositions = true
	DestroyScreenElement \{id = LightShow_DebugCycleAnchor}
	if NOT CD
		CreateScreenElement \{type = TextElement
			parent = root_window
			id = LightShow_DebugCycleAnchor
			just = [
				left
				top
			]
			pos = (75.0, 550.0)
			font = fontgrid_text_a6
			z_priority = 50
			text = qs("\L")
			use_shadow = true
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [
				0
				0
				0
				255
			]}
	endif
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
		Wait <delay> seconds
		Obj_ApplyScaling scale = <end_scale>
		Wait \{1
			gameframes}
		Obj_MorphScaling target_scale = <start_scale> blend_duration = <time>
		repeat
	else
		AddPulseEvent events = <events> amount = <amount> time = <time>
	endif
endscript

script Venue_PulseGreen 
	SetSpawnInstanceLimits \{max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Green
		]}
endscript

script Venue_PulseRed 
	SetSpawnInstanceLimits \{max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Red
		]}
endscript

script Venue_PulseYellow 
	SetSpawnInstanceLimits \{max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Yellow
		]}
endscript

script Venue_PulseBlue 
	SetSpawnInstanceLimits \{max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Blue
		]}
endscript

script Venue_PulseOrange 
	SetSpawnInstanceLimits \{max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Orange
		]}
endscript

script Venue_PulseOpen 
	SetSpawnInstanceLimits \{max = 8
		management = ignore_spawn_request}
endscript

script Venue_PulseDrumLeft 
	SetSpawnInstanceLimits \{max = 2
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			DrumKick_Left
		]
		amount = 1.1
		delay = $drum_kick_anim_delay}
endscript

script Venue_PulseDrumRight 
	SetSpawnInstanceLimits \{max = 2
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			DrumKick_Right
		]
		amount = 1.1
		delay = $drum_kick_anim_delay}
endscript

script Venue_PulseDrumBoth 
	SetSpawnInstanceLimits \{max = 4
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			DrumKick_Left
			DrumKick_Right
		]
		amount = 1.1
		delay = $drum_kick_anim_delay}
endscript

script Venue_PulseAny 
	SetSpawnInstanceLimits \{max = 8
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
	SetSpawnInstanceLimits \{max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Green
			HitNote_Red
		]}
endscript

script Venue_PulseGreenYellow 
	SetSpawnInstanceLimits \{max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Green
			HitNote_Yellow
		]}
endscript

script Venue_PulseGreenBlue 
	SetSpawnInstanceLimits \{max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Green
			HitNote_Blue
		]}
endscript

script Venue_PulseGreenOrange 
	SetSpawnInstanceLimits \{max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Green
			HitNote_Orange
		]}
endscript

script Venue_PulseGreenOpen 
	SetSpawnInstanceLimits \{max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Green
		]}
endscript

script Venue_PulseRedYellow 
	SetSpawnInstanceLimits \{max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Red
			HitNote_Yellow
		]}
endscript

script Venue_PulseRedBlue 
	SetSpawnInstanceLimits \{max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Red
			HitNote_Blue
		]}
endscript

script Venue_PulseRedOrange 
	SetSpawnInstanceLimits \{max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Red
			HitNote_Orange
		]}
endscript

script Venue_PulseRedOpen 
	SetSpawnInstanceLimits \{max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Red
		]}
endscript

script Venue_PulseYellowBlue 
	SetSpawnInstanceLimits \{max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Yellow
			HitNote_Blue
		]}
endscript

script Venue_PulseYellowOrange 
	SetSpawnInstanceLimits \{max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Yellow
			HitNote_Orange
		]}
endscript

script Venue_PulseYellowOpen 
	SetSpawnInstanceLimits \{max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Yellow
		]}
endscript

script Venue_PulseBlueOrange 
	SetSpawnInstanceLimits \{max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Blue
			HitNote_Orange
		]}
endscript

script Venue_PulseBlueOpen 
	SetSpawnInstanceLimits \{max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Blue
		]}
endscript

script Venue_PulseOrangeOpen 
	SetSpawnInstanceLimits \{max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Orange
		]}
endscript
