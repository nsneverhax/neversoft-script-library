lightshow_enabled = 1
lightvolume_flarecutoff_low = 0.2
lightvolume_flarecutoff_high = 0.35000002
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
		Model = 'LightHousings\\GO_TankHousing01\\GO_TankHousing01.mdl'
		CloneSrc = LS_GO_TankHousing01
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
	z_hof_gfx_l_band_ambient01
	z_hof_gfx_l_band_guitarist_spot01
	z_hof_gfx_l_band_up_direct01
	z_hof_gfx_l_crowd_ambient01
	z_hof_gfx_l_stage_ambient01
	z_hof_gfx_l_stage_up_direct01
	z_maxskc_gfx_l_ambient01
	z_maxskc_gfx_l_band_ambient01
	z_maxskc_gfx_l_band_guitarist_spot01
	z_maxskc_gfx_l_band_up_direct01
	z_maxskc_gfx_l_crowd_ambient01
	z_maxskc_gfx_l_stage_dancer_omni01
	z_maxskc_gfx_l_stage_up_direct01
	z_maxskc_gfx_vc_arcade_omni01
	z_maxskc_gfx_vc_bathroom_omni01
	z_maxskc_gfx_vc_bathroom_omni02
	z_maxskc_gfx_vc_corner_omni01
	z_maxskc_gfx_vc_exit_omni01
	z_maxskc_gfx_vc_exit_omni02
	z_maxskc_gfx_vc_fill_omni01
	z_maxskc_gfx_vc_neon_omni01
	z_maxskc_gfx_vc_periph_back_direct01
	z_maxskc_gfx_vc_periph_back_direct02
	z_nine_lives_gfx_l_band_ambient01
	z_nine_lives_gfx_l_band_guitarist_spot01
	z_nine_lives_gfx_l_band_up_direct01
	z_nine_lives_gfx_l_crowd_ambient01
	z_nine_lives_gfx_l_neonsigns_ambient01
	z_nine_lives_gfx_l_periph_ambient01
	z_nine_lives_gfx_l_periph_up_direct01
	z_nine_lives_gfx_l_stage_ambient01
	z_nine_lives_gfx_l_stage_up_direct01
	z_nine_lives_gfx_vc_flames_omni01
	z_nine_lives_gfx_vc_flames_omni02
	z_nine_lives_gfx_vc_flames_omni03
	z_nine_lives_gfx_vc_flames_omni04
	z_nipmuc_gfx_l_band_back_direct01
	z_nipmuc_gfx_l_band_center_direct01
	z_nipmuc_gfx_l_stage_back_direct01
	z_nipmuc_gfx_l_stage_center_direct01
	z_nipmuc_gfx_trg_flare_back01
	z_nipmuc_gfx_trg_flare_center01
	z_nipmuc_gfx_trg_flare_chimney01
	z_nipmuc_gfx_trg_flare_chimney02
	z_nipmuc_gfx_trg_flare_chimney03
	z_nipmuc_gfx_vc_viewer_ambient01
	z_nipmuc_gfx_vc_viewer_center_direct01
	z_nipmuc_gfx_vc_viewer_left_direct01
	z_nipmuc_gfx_vc_viewer_left_direct02
	z_nipmuc_gfx_vc_viewer_right_direct01
	z_nipmuc_gfx_vc_viewer_right_direct02
	z_nipmuc_gfx_vc_viewer_up_direct01
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
	ls_perf_poor_blackout
	ls_perf_medium_blackout
	ls_perf_good_blackout
	ls_perf_poor_medium_blackout
	ls_perf_medium_good_blackout
	ls_perf_poor_medium_good_blackout
	LS_MOOD_BLACKOUT
	LS_MOOD_FLARE
	LS_MOOD_STROBE
	LS_MOOD_SPECIAL
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
			{
				ls_perf_poor_blackout
				1
			}
			{
				ls_perf_poor_medium_blackout
				1
			}
			{
				ls_perf_poor_medium_good_blackout
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
			{
				ls_perf_poor_medium_blackout
				1
			}
			{
				ls_perf_medium_blackout
				1
			}
			{
				ls_perf_medium_good_blackout
				1
			}
			{
				ls_perf_poor_medium_good_blackout
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
			{
				ls_perf_medium_good_blackout
				1
			}
			{
				ls_perf_good_blackout
				1
			}
			{
				ls_perf_poor_medium_good_blackout
				1
			}
		]
	}
	mood = {
		blackout = [
			{
				LS_MOOD_BLACKOUT
				1
			}
			{
				ls_perf_poor_blackout
				0
			}
			{
				ls_perf_medium_blackout
				0
			}
			{
				ls_perf_good_blackout
				0
			}
			{
				ls_perf_poor_medium_blackout
				0
			}
			{
				ls_perf_medium_good_blackout
				0
			}
			{
				ls_perf_poor_medium_good_blackout
				0
			}
		]
		flare = [
			{
				LS_MOOD_FLARE
				1
			}
			{
				ls_perf_poor_blackout
				0
			}
			{
				ls_perf_medium_blackout
				0
			}
			{
				ls_perf_good_blackout
				0
			}
			{
				ls_perf_poor_medium_blackout
				0
			}
			{
				ls_perf_medium_good_blackout
				0
			}
			{
				ls_perf_poor_medium_good_blackout
				0
			}
		]
		strobe = [
			{
				LS_MOOD_STROBE
				1
			}
		]
	}
}
LightShow_NoteMapping = [
	{
		MidiNote = 76
		Scr = LightShow_SetParams
		params = {
			mood = Intro
		}
	}
	{
		MidiNote = 75
		Scr = LightShow_SetParams
		params = {
			mood = verse
		}
	}
	{
		MidiNote = 74
		Scr = LightShow_SetParams
		params = {
			mood = chorus
		}
	}
	{
		MidiNote = 73
		Scr = LightShow_SetParams
		params = {
			mood = solo
		}
	}
	{
		MidiNote = 72
		Scr = LightShow_SetParams
		params = {
			mood = blackout
		}
	}
	{
		MidiNote = 71
		Scr = LightShow_SetParams
		params = {
			mood = flare
		}
	}
	{
		MidiNote = 70
		Scr = LightShow_SetParams
		params = {
			mood = strobe
		}
	}
	{
		MidiNote = 69
		Scr = LightShow_OverrideColor
		params = {
			Color = green
		}
	}
	{
		MidiNote = 68
		Scr = LightShow_OverrideColor
		params = {
			Color = red
		}
	}
	{
		MidiNote = 67
		Scr = LightShow_OverrideColor
		params = {
			Color = blue
		}
	}
	{
		MidiNote = 66
		Scr = LightShow_OverrideColor
		params = {
			Color = yellow
		}
	}
	{
		MidiNote = 65
		Scr = LightShow_OverrideColor
		params = {
			Color = white
		}
	}
	{
		MidiNote = 64
		Scr = LightShow_OverrideColor
		params = {
			Color = Magenta
		}
	}
	{
		MidiNote = 63
		Scr = LightShow_OverrideColor
		params = {
			OFF
		}
	}
	{
		MidiNote = 62
		Scr = LightShow_OverrideColor
		params = {
			Color = orange
		}
	}
	{
		MidiNote = 61
		Scr = LightShow_OverrideColor
		params = {
			Color = Purple
		}
	}
	{
		MidiNote = 60
		event = strobetoggle
		params = {
			UseSnapshotPositions = FALSE
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
			UseSnapshotPositions = FALSE
		}
	}
	{
		MidiNote = 56
		Scr = LightShow_PyroEvent
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
]
LightShow_SharedProcessors = [
	{
		Name = Poor_Generic
		ScrEnter = LightShow_Poor_Enter
		ScrEvent = LightShow_Poor_Event
		ScrExit = LightShow_Poor_Exit
	}
	{
		Name = Intro_Generic
		ScrEnter = LightShow_GenericMood_Enter
		ScrEvent = LightShow_GenericMood_Event
		ScrExit = LightShow_GenericMood_Exit
	}
	{
		Name = Verse_Generic
		ScrEnter = LightShow_GenericMood_Enter
		ScrEvent = LightShow_GenericMood_Event
		ScrExit = LightShow_GenericMood_Exit
	}
	{
		Name = Chorus_Generic
		ScrEnter = LightShow_GenericMood_Enter
		ScrEvent = LightShow_GenericMood_Event
		ScrExit = LightShow_GenericMood_Exit
	}
	{
		Name = Solo_Generic
		ScrEnter = LightShow_GenericMood_Enter
		ScrEvent = LightShow_GenericMood_Event
		ScrExit = LightShow_GenericMood_Exit
	}
	{
		Name = Fail_Generic
		ScrEnter = LightShow_GenericMood_Enter
		ScrEvent = LightShow_GenericMood_Event
		ScrExit = LightShow_GenericMood_Exit
	}
	{
		Name = Win_Generic
		ScrEnter = LightShow_GenericMood_Enter
		ScrEvent = LightShow_GenericMood_Event
		ScrExit = LightShow_GenericMood_Exit
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
		ScrEnter = LightShow_Strobe_Enter
		ScrEvent = LightShow_Strobe_Event
		ScrExit = LightShow_Strobe_Exit
	}
]

script lightshow_iterator 
	printf "LightShow Iterator started with time %d" d = <time_offset>
	LightShow_SetActive \{Active = FALSE}
	if ($lightshow_enabled = 0)
		printf \{"LIGHTSHOW DISABLED: By script variable"}
		return
	endif
	get_song_prefix song = <song_name>
	formatText checksumName = event_array '%s_lightshow_notes' s = <song_prefix> AddToStringLookup
	if NOT GlobalExists Name = <event_array> Type = array
		printf \{"LIGHTSHOW DISABLED: No midi events found for this song"}
		return
	endif
	if NOT LightShow_InitEventMappings <...>
		return
	endif
	array_entry = 0
	fretbar_count = 0
	GetArraySize $<event_array>
	GetSongTimeMs time_offset = <time_offset>
	if NOT (<array_Size> = 0)
		begin
		if ((<time> - <skipleadin>) < $<event_array> [<array_entry>] [0])
			break
		endif
		<array_entry> = (<array_entry> + 1)
		repeat <array_Size>
		array_Size = (<array_Size> - <array_entry>)
		if NOT (<array_Size> = 0)
			begin
			TimeMarkerReached_SetParams time_offset = <time_offset> array = <event_array> array_entry = <array_entry> ArrayOfArrays
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
			if LightShow_BeginProcessBlock {time = ($<event_array> [<array_entry>] [0])
					note = ($<event_array> [<array_entry>] [1])
					length = ($<event_array> [<array_entry>] [2])}
				switch <process_mode>
					case event
					LightShow_PassEvent
					case Scr
					<eventscr> <eventParams>
				endswitch
				LightShow_EndProcessBlock
			endif
			<array_entry> = (<array_entry> + 1)
			repeat <array_Size>
		endif
	endif
endscript

script LightShow_PyroEvent 
	if LightShow_GetPyroScript
		LightShow_GetParams
		<Pyro_Script> performance = <performance>
	else
		printf \{"pyro!"}
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
		case z_training
		case z_viewer
		LightShow_AppendSnapshotParams \{CLEAR}
	endswitch
endscript

script LightShow_Flare_Enter 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_soundcheck
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
	CreateNodeFlag \{ls_perry_mic}
endscript

script LightShow_InitEventMappings 
	LightShow_AppendSnapshotParams \{CLEAR}
	LightShow_OverrideColor \{OFF}
	LightShow_SetTime \{Default
		enable = true}
	ChangeNodeFlag \{LS_SPOTLIGHT_GUITARIST
		1}
	if ($current_num_players = 1)
		ChangeNodeFlag \{LS_SPOTLIGHT_BASSIST
			0}
	else
		ChangeNodeFlag \{LS_SPOTLIGHT_BASSIST
			1}
	endif
	GetPakManCurrentName \{map = zones}
	formatText checksumName = event_struct '%s_lightshow_mapping' s = <pakname> AddToStringLookup
	formatText checksumName = snapshot_struct '%s_snapshots' s = <pakname> AddToStringLookup
	formatText checksumName = processors_struct '%s_lightshow_processors' s = <pakname> AddToStringLookup
	if NOT GlobalExists Name = <event_struct> Type = structure
		printf \{"LIGHTSHOW DISABLED: No event mapping found for this venue"}
		printstruct <...>
		return \{FALSE}
	endif
	if NOT GlobalExists Name = <snapshot_struct> Type = structure
		printf \{"LIGHTSHOW DISABLED: No snapshots found for this venue"}
		printstruct <...>
		return \{FALSE}
	endif
	if GlobalExists Name = <processors_struct> Type = array
		printf \{"LIGHTSHOW: Adding venue processor definitions"}
		LightShow_SetProcessors venue = $<processors_struct>
	endif
	LightShow_SetMapping ($<event_struct>)
	LightShow_SetActive \{Active = true}
	LightShow_SetParams {
		performance = medium
		mood = Intro
		VenueSnapshots = $<snapshot_struct>
	}
	LightShow_RefreshSpotlightOverrideParams
	if NOT ($debug_forcescore = OFF)
		CrowdIncrease \{player_status = player1_status}
	endif
	return \{true}
endscript

script LightShow_Shutdown 
	printf \{"LightShow_Shutdown starting"}
	LightShow_SetActive \{Active = FALSE}
	LightShow_SetProcessors \{CLEAR}
	LightShow_SetMapping \{CLEAR}
	KillSpawnedScript \{Name = lightshow_iterator}
	KillSpawnedScript \{id = LightShow}
	KillSpawnedScript \{id = ScreenFlash}
	printf \{"LightShow_Shutdown finished"}
endscript

script Kill_LightShow_FX 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_wikker
		DestroyParticlesByGroupID \{groupID = Z_Wikker_FX}
		DeleteTeslaEffectObject \{Name = Z_Wikker_TeslaFX11}
		DeleteTeslaEffectObject \{Name = Z_Wikker_TeslaFX12}
		DeleteTeslaEffectObject \{Name = Z_Wikker_TeslaFX13}
		DeleteTeslaEffectObject \{Name = Z_Wikker_TeslaFX21}
		DeleteTeslaEffectObject \{Name = Z_Wikker_TeslaFX22}
		DeleteTeslaEffectObject \{Name = Z_Wikker_TeslaFX23}
		DeleteTeslaEffectObject \{Name = Z_Wikker_Encore_TeslaFX1}
		DeleteTeslaEffectObject \{Name = Z_Wikker_Encore_TeslaFX2}
		DeleteTeslaEffectObject \{Name = Z_Wikker_Encore_TeslaFX3}
	endswitch
endscript

script LightShow_WaitAndEnableSpotlights 
	RequireParams \{[
			enable
			time
		]
		all}
	printf "LightShow - spotlight toggle %s" s = <enable>
	Wait <time> Seconds
	LightShow_EnableSpotlights <enable>
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
