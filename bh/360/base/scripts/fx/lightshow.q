lightshow_enabled = 1
lightshow_debug = 0
lightvolume_flarecutoff = 0.3
lightvolume_flarematerialcrc = FlareMaterial_FlareMaterial
lightvolume_flaresaturate = 0.6
lightvolume_followbonename = Bone_Pelvis
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
lightshow_allow_mood_changes = true
lightshow_last_mood_requested = None
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
	fallingAction
]
lightshow_menu_min_time = 1.0
lightshow_menu_max_time = 2.0
lightshow_menu_transition_time = 0.15
lightshow_housingmodels = [
	{
		Model = 'LightHousings\\GO_NoHousing01\\GO_NoHousing01.mdl'
		CloneSrc = LS_GO_NoHousing01
	}
	{
		Model = 'LightHousings\\GO_NoHousing01_Flare01\\GO_NoHousing01_Flare01.mdl'
		CloneSrc = LS_GO_NoHousing01_Flare01
	}
	{
		Model = 'LightHousings\\GO_NoHousing01_SmallFlare01\\GO_NoHousing01_SmallFlare01.mdl'
		CloneSrc = LS_GO_NoHousing01_SmallFlare01
	}
	{
		Model = 'LightHousings\\GO_BarnHousing01\\GO_BarnHousing01.mdl'
		CloneSrc = LS_GO_BarnHousing01
	}
	{
		Model = 'LightHousings\\GO_LightHousing01\\GO_LightHousing01.mdl'
		CloneSrc = LS_GO_LightHousing01
	}
	{
		Model = 'LightHousings\\GO_LightHousing01_SmallFlare01\\GO_LightHousing01_SmallFlare01.mdl'
		CloneSrc = LS_GO_LightHousing01_SmallFlare01
	}
	{
		Model = 'LightHousings\\GO_LightHousing02\\GO_LightHousing02.mdl'
		CloneSrc = LS_GO_LightHousing02
	}
	{
		Model = 'LightHousings\\GO_LightHousing02_SmallFlare01\\GO_LightHousing02_SmallFlare01.mdl'
		CloneSrc = LS_GO_LightHousing02_SmallFlare01
	}
	{
		Model = 'LightHousings\\GO_LightHousing02_Small01\\GO_LightHousing02_Small01.mdl'
		CloneSrc = LS_GO_LightHousing02_Small01
	}
	{
		Model = 'LightHousings\\GO_LH_Bowl\\GO_LH_Bowl.mdl'
		CloneSrc = LS_GO_LH_Bowl
	}
	{
		Model = 'LightHousings\\GO_LH_Tentacle_Big01\\GO_LH_Tentacle_Big01.mdl'
		CloneSrc = LS_GO_LH_Tentacle_Big01
	}
	{
		Model = 'LightHousings\\GO_LH_Tentacle_Med01\\GO_LH_Tentacle_Med01.mdl'
		CloneSrc = LS_GO_LH_Tentacle_Med01
	}
	{
		Model = 'LightHousings\\GO_LH_Tentacle_Small01\\GO_LH_Tentacle_Small01.mdl'
		CloneSrc = LS_GO_LH_Tentacle_Small01
	}
]

script LightShow_CreatePermModels 
	GetArraySize \{$lightshow_housingmodels}
	<i> = 0
	begin
	<desc> = ($lightshow_housingmodels [<i>])
	<Model> = (<desc>.Model)
	<Pos> = ((-100.0, 300.0) + <i> * (0.0, 10.0))
	<src> = (<desc>.CloneSrc)
	CreateCompositeObject {
		components = [
			{
				component = Model
				Model = <Model>
			}
		]
		params = {
			Pos = <Pos>
			name = <src>
		}
	}
	<src> :hide
	<src> :Obj_ForceUpdate
	<src> :Suspend
	<i> = (<i> + 1)
	repeat <array_size>
endscript
lightshow_SpotlightFollowNames = [
	Guitarist
	Vocalist
	Bassist
	Drummer
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
	LS_MOOD_STARPOWER
	LS_MOOD_MENU
	LS_MOOD_BAND_LOBBY
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
		Flare = [
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
		Wash = [
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
		Pyro = [
			{
				LS_MOOD_PYRO
				1
			}
		]
		Silhouette = [
			{
				LS_MOOD_SILHOUETTE
				1
			}
		]
		StarPower = [
			{
				LS_MOOD_STARPOWER
				1
			}
		]
		Menu = [
			{
				LS_MOOD_MENU
				1
			}
		]
		Band_Lobby = [
			{
				LS_MOOD_BAND_LOBBY
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
			Color = red
		}
	}
	{
		MidiNote = 104
		Scr = LightShow_SpotlightColor
		params = {
			Color = orange
		}
	}
	{
		MidiNote = 103
		Scr = LightShow_SpotlightColor
		params = {
			Color = yellow
		}
	}
	{
		MidiNote = 102
		Scr = LightShow_SpotlightColor
		params = {
			Color = green
		}
	}
	{
		MidiNote = 101
		Scr = LightShow_SpotlightColor
		params = {
			Color = blue
		}
	}
	{
		MidiNote = 100
		Scr = LightShow_SpotlightColor
		params = {
			Color = Purple
		}
	}
	{
		MidiNote = 99
		Scr = LightShow_SpotlightColor
		params = {
			Color = Magenta
		}
	}
	{
		MidiNote = 98
		Scr = LightShow_SpotlightColor
		params = {
			Color = white
		}
	}
	{
		MidiNote = 97
		Scr = LightShow_EnableSpotlights
		params = {
			enabled = true
			spots = [
				Vocalist
			]
		}
	}
	{
		MidiNote = 96
		Scr = LightShow_EnableSpotlights
		params = {
			enabled = false
			spots = [
				Vocalist
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
				Bassist
			]
		}
	}
	{
		MidiNote = 92
		Scr = LightShow_EnableSpotlights
		params = {
			enabled = false
			spots = [
				Bassist
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
			mood = Flare
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
			mood = Wash
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
			mood = Pyro
		}
	}
	{
		MidiNote = 71
		Scr = LightShow_SetParams
		params = {
			mood = Silhouette
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
			Default
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
	{
		MidiNote = 19
		Scr = LightShow_PyroEvent
		params = {
			type = pyro_special
		}
	}
]
LightShow_SharedProcessors = [
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
	{
		name = Visualizer_Generic
		ScrEnter = Visualizer_GenericMood_Enter
		ScrEvent = Visualizer_GenericMood_Event
		ScrExit = Visualizer_GenericMood_Exit
	}
]

script lightshow_iterator_set_song_event 
	get_song_prefix song = <song_name>
	FormatText checksumname = event_array '%s_lightshow_notes' s = <song_prefix> AddToStringLookup = true
	if NOT GlobalExists name = <event_array> type = array
		printf \{qs(0x093d0e8a)}
		return \{false}
	endif
	return true event_array = <event_array>
endscript

script lightshow_iterator_init 
	printf qs(0xc9557688) d = <time_offset> channel = events
	LightShow_SetActive \{active = false}
	if NOT CD
		DestroyScreenElement \{id = LightShow_DebugAnchor}
		if ($lightshow_debug = 1)
			LightShow_DisplayDebugInfo
		endif
	endif
	if ($lightshow_enabled = 0)
		printf \{qs(0x46b6ad6b)}
		return \{false}
	endif
	if NOT lightshow_iterator_set_song_event song_name = <song_name>
		return \{false}
	endif
	if NOT LightShow_InitEventMappings
		return \{false}
	endif
	return true event_array = <event_array> parse_notetrack = <parse_notetrack>
endscript

script lightshow_iterator 
	lightshow_iterator_setup
	OnExitRun \{lightshow_iterator_cleanup}
	if ($medley_mode_on)
		lightshow_iterator_medley <...>
		return
	endif
	if NOT lightshow_iterator_init <...>
		return
	endif
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
			array_time_entry = ($<event_array> [<array_entry>])
			TimeMarkerReached_SetParams time_offset = <time_offset> time = <array_time_entry> PerFrame
			begin
			LightShow_Update
			if TimeMarkerReached
				GetSongTimeMs time_offset = <time_offset>
				break
			endif
			wait \{1
				gameframe}
			repeat
			TimeMarkerReached_ClearParams
			if (<array_size> = 0)
				break
			endif
			Process_Lightshow_Note event_array = <event_array> array_entry = <array_entry> parse_notetrack = <parse_notetrack>
			<array_entry> = (<array_entry> + 2)
			repeat <array_size>
		endif
	endif
	if NOT CD
		if ScreenElementExists \{id = LightShow_DebugText}
			LightShow_DebugText :SE_SetProps \{text = qs(0xcbc0eb10)}
		endif
	endif
	begin
	wait \{1
		gameframe}
	LightShow_Update
	repeat
endscript

script lightshow_iterator_setup 
	if NOT GetPakManCurrentName \{map = zones}
		return
	endif
	FormatText checksumname = lut_dict 'zones/%s/%s.tex' s = <pakname> AddToStringLookup = true
	FormatText checksumname = zone_dict 'zones/%s/%s_luts.tex' s = <pakname> AddToStringLookup = true
	FormatText checksumname = context '%s' s = <pakname> AddToStringLookup = true
	LightShow_SetToneMapLookupProps {
		active = true
		lut_dict = <lut_dict>
		zone_dict = <zone_dict>
		global_dict = `pak/luts/global_color_luts.tex`
		asset_context = <context>
	}
endscript

script lightshow_iterator_cleanup 
	LightShow_SetToneMapLookupProps \{active = false}
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
	GetArraySize \{$current_medley_info}
	medley_size = <array_size>
	GetMedleyStartEndTimes medley_index = <medley_index>
	GetArraySize $<event_array>
	array_size = (<array_size> / 2)
	GetSongTimeMs time_offset = <time_offset>
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
		GetSongTimeMs time_offset = <time_offset>
		if (<time> - <medley_time> >= <medley_end_time> - <medley_start_time>)
			GetMedleyEndBeatTimeLength medley_index = <medley_index>
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
				GetArraySize $<event_array>
				array_size = (<array_size> / 2)
				medley_time = (<medley_time> + (<medley_end_time> - <medley_start_time>))
				medley_time = (<medley_time> + <beat_time_length>)
				GetMedleyStartEndTimes medley_index = <medley_index>
				array_entry = 0
				begin
				if (<medley_start_time> <= $<event_array> [<array_entry>])
					break
				endif
				<array_entry> = (<array_entry> + 2)
				repeat <array_size>
				begin
				GetSongTimeMs time_offset = <time_offset>
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
				GetSongTimeMs time_offset = <time_offset>
				break
			endif
		endif
		wait \{1
			gameframe}
		repeat <array_size>
		if (<array_entry> >= <array_size>)
			break
		endif
		Process_Lightshow_Note event_array = <event_array> array_entry = <array_entry> parse_notetrack = <parse_notetrack>
		<array_entry> = (<array_entry> + 2)
		repeat
	endif
	if NOT CD
		if ScreenElementExists \{id = LightShow_DebugText}
			LightShow_DebugText :SE_SetProps \{text = qs(0xcbc0eb10)}
		endif
	endif
	begin
	wait \{1
		gameframe}
	LightShow_Update
	repeat
endscript

script Process_Lightshow_Note 
	DecompressNoteValue note_value = ($<event_array> [(<array_entry> + 1)])
	if (<parse_notetrack> = true)
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
	endif
endscript

script LightShow_ToggleDebugInfo 
	if ($lightshow_debug = 1)
		Change \{lightshow_debug = 0}
		DestroyScreenElement \{id = LightShow_DebugAnchor}
	else
		Change \{lightshow_debug = 1}
		LightShow_DisplayDebugInfo
	endif
endscript

script LightShow_DisplayDebugInfo 
	DestroyScreenElement \{id = LightShow_DebugAnchor}
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = LightShow_DebugAnchor
		Pos = (400.0, 440.0)
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
		Pos = (0.0, 0.0)
		dims = (1000.0, 1000.0)
		font = fontgrid_text_A1
		internal_scale = (0.6, 0.4)
		text = qs(0xcbc0eb10)}
	if NOT LightShow_GetParams
		LightShow_DebugText = qs(0x46e08381)
	endif
endscript

script LightShow_PyroEvent 
	if LightShow_GetPyroScript
		if StructureContains structure = pyro_scripts <type>
			GetPakManCurrent \{map = zones}
			if NOT (<pak> = Z_Visualizer)
				if ScriptIsRunning \{fretbar_update_tempo}
					if NOT ($game_mode = practice)
						if NOT (<pak> = Z_Visualizer)
							printf \{channel = sfx
								qs(0xe9da5b31)}
							SoundEvent \{event = Pyro}
						endif
					endif
				endif
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
		case z_training
		case z_viewer
		LightShow_AppendSnapshotParams \{Intensity = 0.25
			SpecularIntensity = 0.25}
		case Z_AwardShow
		Venue_Awardshow_MoodSignChange \{ioo_mood = blackout}
	endswitch
	LightShow_CycleNextSnapshot \{save = false
		UseSnapshotPositions = true}
endscript

script LightShow_Blackout_Event 
endscript

script LightShow_Blackout_Exit 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_training
		case z_viewer
		LightShow_AppendSnapshotParams \{clear}
		case Z_AwardShow
		Venue_Awardshow_MoodSignChange \{ioo_mood = None}
	endswitch
endscript

script LightShow_Flare_Enter 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_training
		case z_viewer
		LightShow_AppendSnapshotParams \{Intensity = 0.25
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
		case z_training
		case z_viewer
		LightShow_AppendSnapshotParams \{clear}
	endswitch
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
	CreateNodeFlag \{LS_SPOTLIGHT_GUITARIST}
	CreateNodeFlag \{LS_SPOTLIGHT_BASSIST}
	CreateNodeFlag \{LS_BAND_GENERIC}
	CreateNodeFlag \{LS_BAND_NODOUBT}
	CreateNodeFlag \{LS_SONG_DONTSPEAK}
	CreateNodeFlag \{LS_SONG_LOVESTORY}
	CreateNodeFlag \{LS_SONG_PICTURETOBURN}
	CreateNodeFlag \{LS_SONG_YOUBELONGWITHME}
endscript

script LightShow_InitEventMappings 
	killspawnedscript \{name = LightShow_DummyLoop_Spawned}
	LightShow_AppendSnapshotParams \{clear}
	LightShow_OverrideColor \{off}
	LightShow_SetTime \{Default
		enable = true}
	LightShow_SetActive \{active = false}
	LightShow_SetProcessors \{clear}
	LightShow_SetMapping \{clear}
	LightShow_EnableToneMap
	ChangeNodeFlag \{LS_SPOTLIGHT_GUITARIST
		1}
	GetNumPlayersInGame
	if (<num_players> = 1)
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
			return \{false}
		endif
	endif
	FormatText checksumname = event_struct '%s_lightshow_mapping' s = <pakname> AddToStringLookup = true
	FormatText checksumname = snp_filename 'zones/%s/%s_snp.qb' s = <pakname> AddToStringLookup = true
	FormatText checksumname = snapshot_struct '%s_snapshots' s = <pakname> AddToStringLookup = true
	FormatText checksumname = material_snapshot_struct '%s_material_snapshots' s = <pakname> AddToStringLookup = true
	FormatText checksumname = processors_struct '%s_lightshow_processors' s = <pakname> AddToStringLookup = true
	FormatText checksumname = snapshot_names '%s_snapshot_names' s = <pakname> AddToStringLookup = true
	if NOT GlobalExists name = <event_struct> type = structure
		printf \{qs(0xce52f5c2)}
		printstruct <...>
		return \{false}
	endif
	if NOT LightShow_PreProcessSNP SNPFileName = <snp_filename> SnapshotStruct = <snapshot_struct> SnapshotNames = <snapshot_names>
		printf \{qs(0xdc2d0c88)}
		printstruct <...>
		return \{false}
	endif
	if GlobalExists name = <processors_struct> type = array
		printf \{qs(0x23e129d8)}
		LightShow_SetProcessors venue = $<processors_struct>
	endif
	LightShow_SetMapping ($<event_struct>)
	LightShow_SetActive \{active = true}
	LightShow_SetParams {
		performance = medium
		mood = intro
		VenueMaterialSnapshotsName = <material_snapshot_struct>
	}
	LightShow_SpotlightColor \{Color = white}
	if NOT ($debug_forcescore = off)
		CrowdIncrease \{player = 1}
	endif
	FormatText checksumname = venue_setup_scr '%s_SetupLightShow' s = <pakname> AddToStringLookup = true
	if ScriptExists <venue_setup_scr>
		spawnscriptnow <venue_setup_scr> id = LightShow
	endif
	<parse_notetrack> = true
	switch <pakname>
		case 'z_studio2'
		<parse_notetrack> = false
	endswitch
	return true parse_notetrack = <parse_notetrack>
endscript

script LightShow_ClearDebugArrays 
	Change \{lightshow_available_snapshot_names = [
		]}
	Change \{lightshow_snapshot_mood = [
		]}
endscript

script LightShow_DummyLoop 
	LightShow_EnableToneMap
	killspawnedscript \{name = LightShow_DummyLoop_Spawned}
	spawnscriptnow \{LightShow_DummyLoop_Spawned
		id = LightShow}
endscript

script LightShow_DummyLoop_Spawned 
	begin
	LightShow_Update
	wait \{1
		gameframes}
	repeat
endscript

script LightShow_NotInGamePlay_SetMood 
	RequireParams \{[
			mood
		]
		all}
	LightShow_SetActive \{active = true}
	LightShow_DummyLoop
	LightShow_SetParams mood = <mood>
endscript

script LightShow_Shutdown 
	printf \{qs(0x9010c422)}
	killspawnedscript \{name = lightshow_iterator}
	killspawnedscript \{id = LightShow}
	printf \{qs(0x4d49808d)}
endscript

script LightShow_SongFailed 
	killspawnedscript \{name = lightshow_iterator}
	killspawnedscript \{id = LightShow}
	LightShow_EnableSpotlights \{enabled = false
		spots = [
			Vocalist
			Guitarist
			Bassist
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
	if NOT StructureContains structure = $<mapping> spotlight_snapshots
		return \{false}
	endif
	<snps> = ($<mapping>.spotlight_snapshots)
	<checks> = [red orange yellow green blue Purple Magenta white off]
	GetArraySize <checks>
	<i> = 0
	begin
	<check> = (<checks> [<i>])
	<i> = (<i> + 1)
	if StructureContains structure = <snps> <check>
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
	printf \{qs(0x8f4f89bb)}
	if NOT LightShow_DebugCycle_Init
		return
	endif
	if NOT GetPakManCurrentName \{map = zones}
		return
	endif
	GetArraySize \{$lightshow_available_snapshot_names}
	if (<array_size> = 0)
		return
	endif
	killspawnedscript \{name = lightshow_iterator}
	LightShow_DummyLoop
	LightShow_SetTime \{time = 0.0}
	Change \{lightshow_allow_mood_changes = true}
	begin
	if ($LightShow_DebugCycle_Index >= <array_size>)
		Change \{LightShow_DebugCycle_Index = 0}
	endif
	printstruct {
		names = ($lightshow_available_snapshot_names)
		index = ($LightShow_DebugCycle_Index)
	}
	<snapshot_name> = ($lightshow_available_snapshot_names [$LightShow_DebugCycle_Index])
	FormatText checksumname = snapshot_crc <snapshot_name>
	FormatText TextName = debug_text qs(0x3beef43d) s = <snapshot_name>
	mood = ($lightshow_snapshot_mood [$LightShow_DebugCycle_Index])
	Change LightShow_DebugCycle_Index = ($LightShow_DebugCycle_Index + 1)
	if lightshow_is_spotlight_snapshot name = <snapshot_crc>
	else
		break
	endif
	repeat
	printf channel = marcls qs(0xcb754e4d) a = <mood> b = <snapshot_name>
	if (mood != unknown)
		LightShow_SetParams mood = <mood>
	endif
	LightShow_PlaySnapshot name = <snapshot_crc> save = true UseSnapshotPositions = true
	Lightshow_ApplyAppropriateToneMap
	DestroyScreenElement \{id = LightShow_DebugCycleAnchor}
	if NOT RetailBuild
		killspawnedscript \{name = Lightshow_Debug_Dislay_Name}
		spawnscriptnow Lightshow_Debug_Dislay_Name params = {debug_text = <debug_text>}
	endif
	Change \{lightshow_allow_mood_changes = false}
endscript

script Lightshow_Debug_Dislay_Name 
	CreateScreenElement {
		type = TextElement
		parent = root_window
		id = LightShow_DebugCycleAnchor
		just = [left top]
		Pos = (75.0, 530.0)
		font = fontgrid_text_A1
		z_priority = 50
		text = <debug_text>
		use_shadow = true
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
	}
	wait \{2
		seconds}
	DestroyScreenElement \{id = LightShow_DebugCycleAnchor}
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
		wait <delay> seconds
		Obj_ApplyScaling scale = <end_scale>
		wait \{1
			gameframes}
		Obj_MorphScaling target_Scale = <start_scale> blend_duration = <time>
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

script Visualizer_GenericMood_Enter 
	LightShow_CycleNextSnapshot \{UseSnapshotPositions = true
		save = true}
endscript

script Visualizer_GenericMood_Event 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case Z_Visualizer
		viewport = bg_viewport
		default
		viewport = visualizer_viewport
	endswitch
	LightShow_GetParams
	GetArraySize <av_presets>
	i = RandomInteger (-1.0, 1.0)
	begin
	i = (<i> + 1)
	if (<i> >= <array_size>)
		i = 0
	endif
	if IsArray (<av_presets> [<i>])
		Create_AVFX primitives = (<av_presets> [<i>]) viewport = <viewport>
	else
		Create_AVFX Profile = (<av_presets> [<i>]) viewport = <viewport>
	endif
	LightShow_CycleNextSnapshot \{UseSnapshotPositions = true
		save = true}
	LightShow_WaitForNextEvent \{events = [
			snapshotchange
		]}
	repeat
endscript

script Visualizer_GenericMood_Exit 
endscript
menu_last_mood_index = -1
menu_lightshow_active = 0

script menu_lightshow 
	Change \{menu_lightshow_active = 1}
	OnExitRun \{menu_lightshow_cleanup}
	LightShow_SetActive \{active = true}
	LightShow_DummyLoop
	GetArraySize \{$lightshow_menu_moods}
	begin
	GetRandomValue name = mood_index a = 0 b = (<array_size> -2) integer
	if (<mood_index> = $menu_last_mood_index)
		mood_index = (<mood_index> + 1)
	endif
	mood = ($lightshow_menu_moods [<mood_index>])
	GetRandomValue \{name = wait_time
		a = $lightshow_menu_min_time
		b = $lightshow_menu_max_time}
	LightShow_SetTime \{time = $lightshow_menu_transition_time}
	LightShow_SetParams mood = <mood> performance = medium
	wait <wait_time> seconds
	Change menu_last_mood_index = <mood_index>
	repeat
endscript

script menu_lightshow_cleanup 
	Change \{menu_lightshow_active = 0}
endscript
lightshow_usetonemap = 1
lightshow_displaytonemap = 0
lightshow_tonemapenabledforsongandvenue = 1

script LightShow_EnableToneMap 
	Change \{lightshow_tonemapenabledforsongandvenue = 1}
	GetPakManCurrent \{map = zones}
	GMan_SongFunc \{func = get_current_song}
	if ((<pak> = Z_Paris) && (<current_song> = JustaGirl))
		Change \{lightshow_tonemapenabledforsongandvenue = 0}
	endif
endscript

script LightShow_DisableToneMap \{viewport = bg_viewport}
	if NOT ViewportExists id = <viewport>
		return
	endif
	if NOT ScreenFX_FXInstanceExists viewport = <viewport> name = tone_map
		return
	endif
	ScreenFX_UpdateFXInstanceParams {
		viewport = <viewport>
		name = tone_map
		scefName = tone_map
		type = ToneMap
		on = 0
		texture = `tex\LUTs\lut_default_dnc.dds`
	}
endscript

script Lightshow_ApplyAppropriateToneMap 
	if LightShow_GetToneMapName
		LightShow_ApplyToneMap name = <tonemap_name>
	else
		LightShow_ClearToneMap
	endif
endscript

script LightShow_ApplyToneMap \{viewport = bg_viewport}
	if ($lightshow_usetonemap = 0)
		return
	endif
	if ($lightshow_tonemapenabledforsongandvenue = 0)
		LightShow_ClearToneMap
		return
	endif
	LightShow_Tonemap_DisplayName \{name = None}
	RequireParams \{[
			name
		]
		all}
	if ($lightshow_displaytonemap = 1)
		printf qs(0x9ce68262) s = <name>
	endif
	if NOT ViewportExists id = <viewport>
		return
	endif
	if NOT ScreenFX_FXInstanceExists viewport = <viewport> name = tone_map
		return
	endif
	ScreenFX_UpdateFXInstanceParams {
		viewport = <viewport>
		name = tone_map
		scefName = tone_map
		type = ToneMap
		on = 1
		texture = <name>
	}
	LightShow_Tonemap_DisplayName name = <name>
endscript

script LightShow_ClearToneMap \{viewport = bg_viewport}
	if ($lightshow_displaytonemap = 1)
		printf \{qs(0xf2ca6b5a)}
	endif
	LightShow_Tonemap_DisplayName \{name = Default}
	if NOT ViewportExists id = <viewport>
		return
	endif
	Venue_ScreenFX
endscript

script LightShow_Tonemap_DisplayName 
	if RetailBuild
		return
	endif
	DestroyScreenElement \{id = LightShow_DebugLUTAnchor}
	if ($lightshow_displaytonemap = 0)
		return
	endif
	FormatText TextName = debug_text qs(0x665b12ba) s = <name> DontAssertForChecksums
	StringReplaceBackslashes string = <debug_text>
	<debug_text> = <new_string>
	CreateScreenElement {
		type = TextElement
		parent = root_window
		id = LightShow_DebugLUTAnchor
		just = [left top]
		Pos = (75.0, 600.0)
		font = debug
		z_priority = 50
		text = <debug_text>
		scale = 0.75
		use_shadow = true
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
	}
endscript
