lightshow_enabled = 1
lightshow_debug = 0
lightvolume_flarecutoff = 0.3
lightvolume_flarematerialcrc = FlareMaterial_FlareMaterial
lightvolume_lightbulbmaterialcrc = lightbulbmaterial_lightbulbmaterial
lightvolume_flaresaturate = 0.8
lightvolume_followbonename = BONE_PELVIS
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
lightshow_last_mood_requested = 0x00000000
lightshow_mood_override_starpower = FALSE
lightshow_mood_override_blackout = FALSE
lightshow_mood_override_debug = FALSE
lightshow_available_snapshot_names = [
]
lightshow_snapshot_mood = [
]
lightshow_menu_moods = [
	Intro
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
lightshow_debug_lighting_snapshot = 0x00000000
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
		CloneSrc = ls_go_lh_bowl
	}
	{
		Model = 'LightHousings\\GO_NoHousing01_MomentFlare01\\GO_NoHousing01_MomentFlare01.mdl'
		CloneSrc = go_nohousing01_momentflare01
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
			Name = <src>
		}
	}
	<src> :Hide
	<src> :Obj_ForceUpdate
	<src> :Suspend
	<i> = (<i> + 1)
	repeat <array_Size>
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
	ls_mood_starpower
	ls_mood_menu
	ls_mood_band_lobby
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
LightShow_NoteMapping = [
	{
		MidiNote = 107
		Scr = lightshow_togglenotelengthmode
		params = {
			Color = red
		}
	}
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
		MidiNote = 56
		event = visualizerchange
		params = {
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
	{
		MidiNote = 19
		Scr = LightShow_PyroEvent
		params = {
			Type = pyro_special
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
	{
		Name = visualizer_generic
		ScrEnter = visualizer_genericmood_enter
		ScrEvent = visualizer_genericmood_event
		ScrExit = visualizer_genericmood_exit
	}
]

script lightshow_iterator_set_song_event 
	get_song_prefix song = <song_name>
	formatText checksumName = event_array '%s_lightshow_notes' s = <song_prefix> AddToStringLookup = true
	if NOT songglobalexists Name = <event_array> Type = array
		printf \{qs(0x093d0e8a)}
		return \{FALSE}
	endif
	return true event_array = <event_array>
endscript

script lightshow_iterator_init 
	printf qs(0xc9557688) d = <time_offset> channel = events
	LightShow_SetActive \{Active = FALSE}
	if NOT CD
		DestroyScreenElement \{id = lightshow_debuganchor}
		if ($lightshow_debug = 1)
			lightshow_displaydebuginfo
		endif
	endif
	if ($lightshow_enabled = 0)
		printf \{qs(0x46b6ad6b)}
		return \{FALSE}
	endif
	if NOT lightshow_iterator_set_song_event song_name = <song_name>
		return \{FALSE}
	endif
	if NOT LightShow_InitEventMappings
		return \{FALSE}
	endif
	Change \{g_lightshow_usenotelength_mode = 0}
	return true event_array = <event_array> parse_notetrack = <parse_notetrack>
endscript

script lightshow_iterator 
	if NOT lightshow_iterator_init <...>
		return
	endif
	array_entry = 0
	fretbar_count = 0
	getsongarraysize <event_array>
	array_Size = (<array_Size> / 2)
	GetSongTimeMs time_offset = <time_offset>
	if NOT (<array_Size> = 0)
		begin
		getsongglobal Name = <event_array> index = <array_entry>
		if ((<time> - <skipleadin>) < <element>)
			break
		endif
		getsongglobal Name = <event_array> index = (<array_entry> + 1)
		decompressnotevalue note_value = <element>
		if (<note_value> = 107)
			lightshow_togglenotelengthmode
		endif
		<array_entry> = (<array_entry> + 2)
		repeat <array_Size>
		array_Size = (<array_Size> - (<array_entry> / 2))
		if NOT (<array_Size> = 0)
			begin
			getsongglobal Name = <event_array> index = <array_entry>
			array_time_entry = <element>
			TimeMarkerReached_SetParams time_offset = <time_offset> time = <array_time_entry> perframe
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
			if (<array_Size> = 0)
				break
			endif
			process_lightshow_note event_array = <event_array> array_entry = <array_entry> parse_notetrack = <parse_notetrack>
			<array_entry> = (<array_entry> + 2)
			repeat <array_Size>
		endif
	endif
	if NOT CD
		if ScreenElementExists \{id = lightshow_debugtext}
			lightshow_debugtext :se_setprops \{text = qs(0xcbc0eb10)}
		endif
	endif
	begin
	Wait \{1
		gameframe}
	LightShow_Update
	repeat
endscript

script process_lightshow_note 
	getsongglobal Name = <event_array> index = (<array_entry> + 1)
	decompressnotevalue note_value = <element>
	if (<length> > 150)
		length = (<length> - 50)
	endif
	if (<parse_notetrack> = true)
		if ($lightshow_mood_override_debug = FALSE)
			getsongglobal Name = <event_array> index = <array_entry>
			if LightShow_BeginProcessBlock {time = <element>
					note_value = <note_value>
					length = <length>}
				switch <process_mode>
					case event
					LightShow_PassEvent
					case Scr
					<eventscr> <eventParams>
				endswitch
				LightShow_EndProcessBlock
			endif
		endif
	endif
endscript
g_lightshow_usenotelength_mode = 0

script lightshow_togglenotelengthmode 
	printf \{qs(0x5460a434)}
	Change g_lightshow_usenotelength_mode = (1 - $g_lightshow_usenotelength_mode)
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
		font = fontgrid_text_a1
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
			if NOT (<pak> = z_visualizer)
				if ScriptIsRunning \{fretbar_update_tempo}
					if NOT ($game_mode = practice)
						SoundEvent \{event = pyro}
					endif
				endif
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
	lightshow_processnotelength length = <length>
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
	endswitch
	LightShow_CycleNextSnapshot \{save = FALSE
		UseSnapshotPositions = true}
endscript

script LightShow_Blackout_Event 
endscript

script LightShow_Blackout_Exit 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_training
		case z_viewer
		LightShow_AppendSnapshotParams \{CLEAR}
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
	LightShow_CycleNextSnapshot \{save = FALSE
		UseSnapshotPositions = true}
endscript

script LightShow_Flare_Event 
endscript

script LightShow_Flare_Exit 
	GetPakManCurrent \{map = zones}
	switch <pak>
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
	LightShow_AppendSnapshotParams \{Intensity = 1.0}
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
	CreateNodeFlag \{LS_SPOTLIGHT_GUITARIST}
	CreateNodeFlag \{LS_SPOTLIGHT_BASSIST}
endscript

script LightShow_InitEventMappings 
	printf \{qs(0xa6e31d47)}
	KillSpawnedScript \{Name = lightshow_dummyloop_spawned}
	LightShow_AppendSnapshotParams \{CLEAR}
	LightShow_OverrideColor \{OFF
		length = 0}
	LightShow_SetTime \{Default
		enable = true}
	LightShow_SetActive \{Active = FALSE}
	LightShow_SetProcessors \{CLEAR}
	LightShow_SetMapping \{CLEAR}
	ChangeNodeFlag \{LS_SPOTLIGHT_GUITARIST
		1}
	getnumplayersingame
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
			return \{FALSE}
		endif
	endif
	formatText checksumName = event_struct '%s_lightshow_mapping' s = <pakname> AddToStringLookup = true
	formatText checksumName = snp_filename 'zones/%s/%s_snp.snp' s = <pakname> AddToStringLookup = true
	formatText checksumName = snapshot_struct '%s_snapshots' s = <pakname> AddToStringLookup = true
	formatText checksumName = material_snapshot_struct '%s_material_snapshots' s = <pakname> AddToStringLookup = true
	formatText checksumName = processors_struct '%s_lightshow_processors' s = <pakname> AddToStringLookup = true
	formatText checksumName = snapshot_names '%s_snapshot_names' s = <pakname> AddToStringLookup = true
	if NOT GlobalExists Name = <event_struct> Type = structure
		printf \{qs(0xce52f5c2)}
		printstruct <...>
		return \{FALSE}
	endif
	if NOT lightshow_preprocesssnp snpfilename = <snp_filename> snapshotstruct = <snapshot_struct> snapshotnames = <snapshot_names>
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
		venuematerialsnapshotsname = <material_snapshot_struct>
		length = 0
	}
	lightshow_spotlightcolor \{Color = white
		length = 0}
	formatText checksumName = venue_setup_scr '%s_SetupLightShow' s = <pakname> AddToStringLookup = true
	if ScriptExists <venue_setup_scr>
		SpawnScriptNow <venue_setup_scr> id = LightShow
	endif
	<parse_notetrack> = true
	switch <pakname>
		case 'z_studio2'
		<parse_notetrack> = FALSE
	endswitch
	if NOT ($lightshow_debug_lighting_snapshot = 0x00000000)
		printf qs(0x031aedce) s = ($lightshow_debug_lighting_snapshot)
		LightShow_PlaySnapshot Name = ($lightshow_debug_lighting_snapshot) save = true UseSnapshotPositions = true
		<parse_notetrack> = FALSE
	endif
	return true parse_notetrack = <parse_notetrack>
endscript

script lightshow_zone_init \{zone_string_name = 0x69696969}
	if NOT ($lightshow_debug_lighting_snapshot = 0x00000000)
		printf qs(0x34991d38) s = ($lightshow_debug_lighting_snapshot)
		LightShow_InitEventMappings force_pakname = <zone_string_name>
	endif
endscript

script lightshow_cleardebugarrays 
	Change \{lightshow_available_snapshot_names = [
		]}
	Change \{lightshow_snapshot_mood = [
		]}
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

script lightshow_notingameplay_setmood 
	RequireParams \{[
			mood
		]
		all}
	LightShow_SetActive \{Active = true}
	lightshow_dummyloop
	LightShow_SetParams mood = <mood>
endscript

script LightShow_Shutdown 
	KillSpawnedScript \{Name = lightshow_iterator}
	KillSpawnedScript \{id = LightShow}
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
lightshow_debugcycle_index = -1

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

script lightshow_debugcycle \{Dir = 1
		restore = 1}
	printf \{qs(0x8f4f89bb)}
	if NOT lightshow_debugcycle_init
		return
	endif
	if NOT GetPakManCurrentName \{map = zones}
		return
	endif
	GetArraySize \{$lightshow_available_snapshot_names}
	if (<array_Size> = 0)
		return
	endif
	LightShow_SetTime \{time = 0.0}
	<i> = 0
	begin
	Change lightshow_debugcycle_index = ($lightshow_debugcycle_index + <Dir>)
	if ($lightshow_debugcycle_index >= <array_Size>)
		Change \{lightshow_debugcycle_index = 0}
		if ($lightshow_mood_override_debug = true)
			if (<restore> = 1)
				SpawnScriptNow \{lightshow_debug_dislay_name
					params = {
						debug_text = qs(0x9797f3fc)
					}}
				lightshow_remove_mood_override_reason \{reason = debug}
				return
			endif
		endif
	endif
	if ($lightshow_debugcycle_index < 0)
		Change lightshow_debugcycle_index = (<array_Size> -1)
		if ($lightshow_mood_override_debug = true)
			if (<restore> = 1)
				SpawnScriptNow \{lightshow_debug_dislay_name
					params = {
						debug_text = qs(0x9797f3fc)
					}}
				lightshow_remove_mood_override_reason \{reason = debug}
				return
			endif
		endif
	endif
	<snapshot_name> = ($lightshow_available_snapshot_names [$lightshow_debugcycle_index])
	formatText checksumName = snapshot_crc <snapshot_name>
	formatText TextName = debug_text qs(0x3beef43d) s = <snapshot_name>
	mood = ($lightshow_snapshot_mood [$lightshow_debugcycle_index])
	if lightshow_is_spotlight_snapshot Name = <snapshot_crc>
	else
		break
	endif
	<i> = (<i> + 1)
	if (<i> > <array_Size>)
		return
	endif
	repeat
	LightShow_EnableSpotlights \{Enabled = FALSE
		spots = [
			vocalist
			GUITARIST
			BASSIST
			drummer
		]}
	lightshow_add_mood_override_reason \{reason = debug}
	lightshow_bypass_mood_overrides \{bypass = true}
	if (<mood> != unknown)
		LightShow_SetParams mood = <mood>
	else
		LightShow_SetParams \{mood = Intro}
	endif
	LightShow_PlaySnapshot Name = <snapshot_crc> save = true UseSnapshotPositions = true
	SpawnScriptNow lightshow_debug_dislay_name params = {debug_text = <debug_text>}
	lightshow_bypass_mood_overrides \{bypass = FALSE}
endscript

script lightshow_debug_dislay_name 
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	if retailbuild
		return
	endif
	DestroyScreenElement \{id = lightshow_debugcycleanchor}
	CreateScreenElement {
		Type = TextElement
		parent = root_window
		id = lightshow_debugcycleanchor
		just = [left top]
		Pos = (75.0, 550.0)
		font = fontgrid_text_a1
		z_priority = 50
		text = <debug_text>
		use_shadow = true
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
	}
	Wait \{2
		Seconds}
	DestroyScreenElement \{id = lightshow_debugcycleanchor}
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
		Wait \{1
			gameframes}
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

script visualizer_genericmood_enter 
	LightShow_CycleNextSnapshot \{UseSnapshotPositions = true
		save = true}
endscript

script visualizer_genericmood_event 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_visualizer
		viewport = bg_viewport
		default
		viewport = visualizer_viewport
	endswitch
	LightShow_GetParams
	GetArraySize <av_presets>
	i = RandomInteger (-1.0, 1.0)
	begin
	i = (<i> + 1)
	if (<i> >= <array_Size>)
		i = 0
	endif
	if IsArray (<av_presets> [<i>])
		create_avfx primitives = (<av_presets> [<i>]) viewport = <viewport>
	else
		create_avfx Profile = (<av_presets> [<i>]) viewport = <viewport>
	endif
	LightShow_CycleNextSnapshot \{UseSnapshotPositions = true
		save = true}
	LightShow_WaitForNextEvent \{events = [
			snapshotchange
		]}
	repeat
endscript

script visualizer_genericmood_exit 
endscript
menu_last_mood_index = -1

script menu_lightshow 
	if NOT ($lightshow_debug_lighting_snapshot = 0x00000000)
		return
	endif
	LightShow_SetActive \{Active = true}
	lightshow_dummyloop
	GetArraySize \{$lightshow_menu_moods}
	begin
	GetRandomValue Name = mood_index a = 0 b = (<array_Size> -2) integer
	if (<mood_index> = $menu_last_mood_index)
		mood_index = (<mood_index> + 1)
	endif
	mood = ($lightshow_menu_moods [<mood_index>])
	GetRandomValue \{Name = wait_time
		a = $lightshow_menu_min_time
		b = $lightshow_menu_max_time}
	LightShow_SetTime \{time = $lightshow_menu_transition_time}
	LightShow_SetParams mood = <mood> performance = medium
	Wait <wait_time> Seconds
	Change menu_last_mood_index = <mood_index>
	repeat
endscript

script lightshow_add_mood_override_reason \{reason = !q1768515945}
	if NOT ($lightshow_debug_lighting_snapshot = 0x00000000)
		return
	endif
	switch (<reason>)
		case debug
		Change \{lightshow_mood_override_debug = true}
		case starpower
		Change \{lightshow_mood_override_starpower = true}
		case blackout
		Change \{lightshow_mood_override_blackout = true}
		default
		ScriptAssert qs(0x234bb110) s = <reason>
	endswitch
	if ($lightshow_allow_mood_changes = true)
		if LightShow_GetParams
			Change lightshow_last_mood_requested = <mood>
		else
			Change \{lightshow_last_mood_requested = 0x00000000}
		endif
	endif
	Change \{lightshow_allow_mood_changes = true}
	if ($lightshow_mood_override_debug = true)
	elseif ($lightshow_mood_override_blackout = true)
		LightShow_SetParams \{mood = blackout}
	elseif ($lightshow_mood_override_starpower = true)
		LightShow_SetParams \{mood = starpower}
	endif
	Change \{lightshow_allow_mood_changes = FALSE}
endscript

script lightshow_remove_mood_override_reason \{reason = !q1768515945}
	if NOT ($lightshow_debug_lighting_snapshot = 0x00000000)
		return
	endif
	switch (<reason>)
		case debug
		Change \{lightshow_mood_override_debug = FALSE}
		case starpower
		Change \{lightshow_mood_override_starpower = FALSE}
		case blackout
		Change \{lightshow_mood_override_blackout = FALSE}
		default
		ScriptAssert qs(0x234bb110) s = <reason>
	endswitch
	Change \{lightshow_allow_mood_changes = true}
	if ($lightshow_mood_override_debug = true)
		Change \{lightshow_allow_mood_changes = FALSE}
		return
	endif
	if ($lightshow_mood_override_blackout = true)
		LightShow_SetParams \{mood = blackout}
		Change \{lightshow_allow_mood_changes = FALSE}
		return
	endif
	if ($lightshow_mood_override_starpower = true)
		LightShow_SetParams \{mood = starpower}
		Change \{lightshow_allow_mood_changes = FALSE}
		return
	endif
	if ($lightshow_last_mood_requested != 0x00000000)
		LightShow_SetParams mood = ($lightshow_last_mood_requested)
		Change \{lightshow_last_mood_requested = 0x00000000}
	endif
endscript

script lightshow_clear_mood_override_reasons 
	Change \{lightshow_allow_mood_changes = true}
	Change \{lightshow_last_mood_requested = 0x00000000}
	Change \{lightshow_mood_override_blackout = FALSE}
	Change \{lightshow_mood_override_starpower = FALSE}
endscript

script lightshow_bypass_mood_overrides \{bypass = !q1768515945}
	Change lightshow_allow_mood_changes = <bypass>
endscript

script lightshow_cinematic_blackout_start 
	GetPakManCurrent \{map = zones}
	ExtendCrc <pak> '_GFX_LH_RotLight_01' out = object_id
	if NOT IsCreated <object_id>
		return
	endif
	lightshow_add_mood_override_reason \{reason = blackout}
endscript

script lightshow_cinematic_blackout_end 
	GetPakManCurrent \{map = zones}
	ExtendCrc <pak> '_GFX_LH_RotLight_01' out = object_id
	if NOT IsCreated <object_id>
		return
	endif
	lightshow_remove_mood_override_reason \{reason = blackout}
endscript

script customizedscript 
	printf \{'Customized LightShow animation.'}
endscript
