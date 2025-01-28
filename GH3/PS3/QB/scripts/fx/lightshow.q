lightshow_enabled = 1
lightvolume_flarecutoff_low = 0.2
lightvolume_flarecutoff_high = 0.35000002
lightvolume_flarematerialcrc = FlareMaterial_FlareMaterial
lightvolume_flaresaturate = 0.6
lightvolume_follow = {
	allowedRadius = {
		amplitude = 0.2
		Center = 1.0
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
	<I> = 0
	begin
	<desc> = ($lightshow_housingmodels [<I>])
	<Model> = (<desc>.Model)
	<Pos> = ((-100.0, 300.0) + <I> * (0.0, 10.0))
	<src> = (<desc>.CloneSrc)
	CreateCompositeObject {
		Components = [
			{
				Component = Model
				Model = <Model>
			}
		]
		Params = {
			Pos = <Pos>
			Name = <src>
		}
	}
	<src> :Hide
	<src> :Obj_ForceUpdate
	<src> :Suspend
	<I> = (<I> + 1)
	repeat <array_Size>
endscript

script LS_AllOff 
	KillSpawnedScript \{Id = LightShow}
endscript

script LS_SetupVenueLights 
endscript

script LS_ResetVenueLights 
	LS_AllOff
	LS_KillFX
	GetPakManCurrent \{map = Zones}
endscript

script LS_KillFX 
endscript
LightShow_ColorOverrides = {
	RED = (255.0, 0.0, 0.0)
	BLUE = (20.0, 132.0, 247.0)
	Yellow = (252.0, 227.0, 61.0)
	White = (255.0, 255.0, 255.0)
	Magenta = (240.0, 79.0, 255.0)
	Green = (66.0, 228.0, 97.0)
	Purple = (162.0, 80.0, 232.0)
	Orange = (248.0, 142.0, 56.0)
}
LightShow_ColorOverrideExcludeLights = [
	Z_Budokan_GFX_L_Band_Ambient01
	Z_Budokan_GFX_L_Band_Guitarist_Spot01
	Z_Budokan_GFX_L_Band_Up_Direct01
	Z_Budokan_GFX_L_Crowd_Ambient01
	Z_Budokan_GFX_L_NeonSigns_Ambient01
	Z_Budokan_GFX_L_Periph_Ambient01
	Z_Budokan_GFX_L_Periph_Up_Direct01
	Z_Budokan_GFX_L_Stage_Ambient01
	Z_Budokan_GFX_L_Stage_Up_Direct01
	Z_Budokan_GFX_VC_Flames_Omni01
	Z_Budokan_GFX_VC_Flames_Omni02
	Z_Budokan_GFX_VC_Flames_Omni03
	Z_Budokan_GFX_VC_Flames_Omni04
	Z_Dive_GFX_L_Ambient01
	Z_Dive_GFX_L_Band_Ambient01
	Z_Dive_GFX_L_Band_Guitarist_Spot01
	Z_Dive_GFX_L_Band_Up_Direct01
	Z_Dive_GFX_L_Crowd_Ambient01
	Z_Dive_GFX_L_Stage_Dancer_Omni01
	Z_Dive_GFX_L_Stage_Up_Direct01
	Z_Dive_GFX_VC_Arcade_Omni01
	Z_Dive_GFX_VC_Bathroom_Omni01
	Z_Dive_GFX_VC_Bathroom_Omni02
	Z_Dive_GFX_VC_Corner_Omni01
	Z_Dive_GFX_VC_Exit_Omni01
	Z_Dive_GFX_VC_Exit_Omni02
	Z_Dive_GFX_VC_Fill_Omni01
	Z_Dive_GFX_VC_Neon_Omni01
	Z_Dive_GFX_VC_Periph_Back_Direct01
	Z_Dive_GFX_VC_Periph_Back_Direct02
	Z_Hell_GFX_L_Band_Ambient01
	Z_HEll_GFX_L_Band_Fire_Direct01
	Z_Hell_GFX_L_Band_Up_Direct01
	Z_Hell_GFX_L_Crowd_Ambient01
	Z_Hell_GFX_L_Stage_Ambient01
	Z_Hell_GFX_L_Stage_Up_Direct01
	Z_Party_GFX_L_Band_Back_Direct01
	Z_Party_GFX_L_Band_Center_Direct01
	Z_Party_GFX_L_Stage_Back_Direct01
	Z_Party_GFX_L_Stage_Center_Direct01
	Z_Party_GFX_TRG_Flare_Back01
	Z_Party_GFX_TRG_Flare_Center01
	Z_Party_GFX_TRG_Flare_Chimney01
	Z_Party_GFX_TRG_Flare_Chimney02
	Z_Party_GFX_TRG_Flare_Chimney03
	Z_Party_GFX_VC_Viewer_Ambient01
	Z_Party_GFX_VC_Viewer_Center_Direct01
	Z_Party_GFX_VC_Viewer_Left_Direct01
	Z_Party_GFX_VC_Viewer_Left_Direct02
	Z_Party_GFX_VC_Viewer_Right_Direct01
	Z_Party_GFX_VC_Viewer_Right_Direct02
	Z_Party_GFX_VC_Viewer_Up_Direct01
	Z_Prison_GFX_L_Band_Ambient01
	Z_Prison_GFX_L_Band_Guitarist_Spot01
	Z_Prison_GFX_L_Band_Sky_FDirect01
	Z_Prison_GFX_L_Band_Up_Direct01
	Z_Prison_GFX_L_Crowd_Ambient01
	Z_Prison_GFX_L_Crowd_Sky_FDirect01
	Z_Prison_GFX_L_Stage_Ambient01
	Z_Prison_GFX_L_Stage_Sky_FDirect01
	Z_Prison_GFX_L_Stage_Sky_FDirect02
	Z_Prison_GFX_L_Stage_Up_Direct01
	Z_Video_GFX_L_BackDrop_Ambient01
	Z_Video_GFX_L_Band_Ambient01
	Z_Video_GFX_L_Band_Up_Direct01
	Z_Video_GFX_L_Crowd_Ambient01
	Z_Video_GFX_L_Stage_Ambient01
	Z_Video_GFX_L_Stage_Up_Direct01
	Z_Video_GFX_VC_Cola_Omni01
	Z_Video_GFX_VC_Exit_Omni01
	Z_Video_GFX_VC_Exit_Omni02
	Z_Video_GFX_VC_Exit_Omni03
	Z_Video_GFX_VC_Exit_Omni04
	Z_Video_GFX_VC_Periph_Left_Direct01
	Z_Video_GFX_VC_Periph_Right_Direct01
	Z_Wikker_GFX_L_Ambient01
	Z_Wikker_GFX_L_Band_Ambient01
	Z_Wikker_GFX_L_Band_Up_Direct01
	Z_Wikker_GFX_L_Crowd_Ambient01
	Z_Wikker_GFX_L_Stage_Up_Direct01
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
	LS_MOOD_BLACKOUT
	LS_MOOD_FLARE
	LS_MOOD_STROBE
	LS_MOOD_SPECIAL
]
LightShow_StateNodeFlagMapping = {
	performance = {
		POOR = [
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
		MEDIUM = [
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
		GOOD = [
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
		BlackOut = [
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
		Strobe = [
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
		Params = {
			mood = INTRO
		}
	}
	{
		MidiNote = 75
		Scr = LightShow_SetParams
		Params = {
			mood = Verse
		}
	}
	{
		MidiNote = 74
		Scr = LightShow_SetParams
		Params = {
			mood = Chorus
		}
	}
	{
		MidiNote = 73
		Scr = LightShow_SetParams
		Params = {
			mood = Solo
		}
	}
	{
		MidiNote = 72
		Scr = LightShow_SetParams
		Params = {
			mood = BlackOut
		}
	}
	{
		MidiNote = 71
		Scr = LightShow_SetParams
		Params = {
			mood = Flare
		}
	}
	{
		MidiNote = 70
		Scr = LightShow_SetParams
		Params = {
			mood = Strobe
		}
	}
	{
		MidiNote = 69
		Scr = LightShow_OverrideColor
		Params = {
			Color = Green
		}
	}
	{
		MidiNote = 68
		Scr = LightShow_OverrideColor
		Params = {
			Color = RED
		}
	}
	{
		MidiNote = 67
		Scr = LightShow_OverrideColor
		Params = {
			Color = BLUE
		}
	}
	{
		MidiNote = 66
		Scr = LightShow_OverrideColor
		Params = {
			Color = Yellow
		}
	}
	{
		MidiNote = 65
		Scr = LightShow_OverrideColor
		Params = {
			Color = White
		}
	}
	{
		MidiNote = 64
		Scr = LightShow_OverrideColor
		Params = {
			Color = Magenta
		}
	}
	{
		MidiNote = 63
		Scr = LightShow_OverrideColor
		Params = {
			OFF
		}
	}
	{
		MidiNote = 62
		Scr = LightShow_OverrideColor
		Params = {
			Color = Orange
		}
	}
	{
		MidiNote = 61
		Scr = LightShow_OverrideColor
		Params = {
			Color = Purple
		}
	}
	{
		MidiNote = 60
		Event = strobetoggle
		Params = {
			UseSnapshotPositions = FALSE
		}
	}
	{
		MidiNote = 58
		Event = snapshotChange
		Params = {
			UseSnapshotPositions = TRUE
		}
	}
	{
		MidiNote = 57
		Event = snapshotChange
		Params = {
			UseSnapshotPositions = FALSE
		}
	}
	{
		MidiNote = 56
		Scr = LightShow_PyroEvent
		Params = {
		}
	}
	{
		MidiNote = 53
		Scr = LightShow_SetTime
		Params = {
			Time = 1.0
		}
	}
	{
		MidiNote = 52
		Scr = LightShow_SetTime
		Params = {
			Time = 0.9
		}
	}
	{
		MidiNote = 51
		Scr = LightShow_SetTime
		Params = {
			Time = 0.8
		}
	}
	{
		MidiNote = 50
		Scr = LightShow_SetTime
		Params = {
			Time = 0.7
		}
	}
	{
		MidiNote = 49
		Scr = LightShow_SetTime
		Params = {
			Time = 0.6
		}
	}
	{
		MidiNote = 48
		Scr = LightShow_SetTime
		Params = {
			Time = 0.5
		}
	}
	{
		MidiNote = 47
		Scr = LightShow_SetTime
		Params = {
			Time = 0.4
		}
	}
	{
		MidiNote = 46
		Scr = LightShow_SetTime
		Params = {
			Time = 0.3
		}
	}
	{
		MidiNote = 45
		Scr = LightShow_SetTime
		Params = {
			Time = 0.25
		}
	}
	{
		MidiNote = 44
		Scr = LightShow_SetTime
		Params = {
			Time = 0.2
		}
	}
	{
		MidiNote = 43
		Scr = LightShow_SetTime
		Params = {
			Time = 0.15
		}
	}
	{
		MidiNote = 42
		Scr = LightShow_SetTime
		Params = {
			Time = 0.1
		}
	}
	{
		MidiNote = 41
		Scr = LightShow_SetTime
		Params = {
			Time = 0.05
		}
	}
	{
		MidiNote = 40
		Scr = LightShow_SetTime
		Params = {
			Time = 0.0
		}
	}
	{
		MidiNote = 39
		Scr = LightShow_SetTime
		Params = {
			DEFAULT
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
	Printf "LightShow Iterator started with time %d" D = <time_offset>
	LightShow_SetActive \{Active = FALSE}
	if ($lightshow_enabled = 0)
		Printf \{"LIGHTSHOW DISABLED: By script variable"}
		return
	endif
	get_song_prefix Song = <song_name>
	FormatText ChecksumName = event_array '%s_lightshow_notes' S = <song_prefix> AddToStringLookup
	if NOT GlobalExists Name = <event_array> Type = Array
		Printf \{"LIGHTSHOW DISABLED: No midi events found for this song"}
		return
	endif
	if NOT LightShow_InitEventMappings <...>
		return
	endif
	array_entry = 0
	fretbar_count = 0
	GetArraySize $<event_array>
	GetSongTimeMS time_offset = <time_offset>
	if NOT (<array_Size> = 0)
		begin
		if ((<Time> - <skipleadin>) < $<event_array> [<array_entry>] [0])
			break
		endif
		<array_entry> = (<array_entry> + 1)
		repeat <array_Size>
		array_Size = (<array_Size> - <array_entry>)
		if NOT (<array_Size> = 0)
			begin
			TimeMarkerReached_SetParams time_offset = <time_offset> Array = <event_array> array_entry = <array_entry> ArrayOfArrays
			begin
			LightShow_Update
			if TimeMarkerReached
				GetSongTimeMS time_offset = <time_offset>
				break
			endif
			Wait \{1
				GameFrame}
			repeat
			TimeMarkerReached_ClearParams
			if LightShow_BeginProcessBlock {Time = ($<event_array> [<array_entry>] [0])
					note = ($<event_array> [<array_entry>] [1])
					Length = ($<event_array> [<array_entry>] [2])}
				switch <process_mode>
					case Event
					LightShow_PassEvent
					case Scr
					<eventscr> <eventparams>
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
		Printf \{"pyro!"}
	endif
endscript

script LightShow_Poor_Enter 
	LightShow_CycleNextSnapshot \{UseSnapshotPositions = TRUE
		save = TRUE}
endscript

script LightShow_Poor_Exit 
endscript

script LightShow_Poor_Event 
	begin
	LightShow_WaitForNextEvent \{events = [
			snapshotChange
		]}
	repeat
endscript

script LightShow_GenericMood_Enter 
	LightShow_CycleNextSnapshot \{UseSnapshotPositions = TRUE
		save = TRUE}
endscript

script LightShow_GenericMood_Exit 
endscript

script LightShow_GenericMood_Event 
	begin
	LightShow_WaitForNextEvent \{events = [
			snapshotChange
		]}
	LightShow_CycleNextSnapshot UseSnapshotPositions = <UseSnapshotPositions> save = TRUE
	repeat
endscript

script LightShow_Blackout_Enter 
	GetPakManCurrent \{map = Zones}
	switch <pak>
		case Z_Soundcheck
		case z_training
		case Z_Viewer
		LightShow_AppendSnapshotParams \{Intensity = 0.25
			SpecularIntensity = 0.25}
	endswitch
	LightShow_CycleNextSnapshot \{save = FALSE
		UseSnapshotPositions = TRUE}
endscript

script LightShow_Blackout_Event 
endscript

script LightShow_Blackout_Exit 
	GetPakManCurrent \{map = Zones}
	switch <pak>
		case Z_Soundcheck
		case z_training
		case Z_Viewer
		LightShow_AppendSnapshotParams \{CLEAR}
	endswitch
endscript

script LightShow_Flare_Enter 
	GetPakManCurrent \{map = Zones}
	switch <pak>
		case Z_Soundcheck
		case z_training
		case Z_Viewer
		LightShow_AppendSnapshotParams \{Intensity = 0.25
			SpecularIntensity = 0.25}
	endswitch
	LightShow_CycleNextSnapshot \{save = FALSE
		UseSnapshotPositions = TRUE}
endscript

script LightShow_Flare_Event 
endscript

script LightShow_Flare_Exit 
	GetPakManCurrent \{map = Zones}
	switch <pak>
		case Z_Soundcheck
		case z_training
		case Z_Viewer
		LightShow_AppendSnapshotParams \{CLEAR}
	endswitch
endscript

script LightShow_Strobe_Enter 
	LightShow_SetTime \{Enable = FALSE}
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
			save = TRUE}
	endif
	LightShow_WaitForNextEvent \{events = [
			strobetoggle
		]}
	repeat
endscript

script LightShow_Strobe_Exit 
	LightShow_AppendSnapshotParams \{CLEAR}
	LightShow_SetTime \{Enable = TRUE}
endscript

script LightShow_AddNodeFlags 
	GetArraySize \{$LightShow_StateNodeFlags}
	<I> = 0
	begin
	CreateNodeFlag ($LightShow_StateNodeFlags [<I>])
	<I> = (<I> + 1)
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
	LightShow_AppendSnapshotParams \{CLEAR}
	LightShow_OverrideColor \{OFF}
	LightShow_SetTime \{DEFAULT
		Enable = TRUE}
	ChangeNodeFlag \{LS_SPOTLIGHT_GUITARIST
		1}
	if ($current_num_players = 1)
		ChangeNodeFlag \{LS_SPOTLIGHT_BASSIST
			0}
	else
		ChangeNodeFlag \{LS_SPOTLIGHT_BASSIST
			1}
	endif
	GetPakManCurrentName \{map = Zones}
	FormatText ChecksumName = event_struct '%s_lightshow_mapping' S = <pakname> AddToStringLookup
	FormatText ChecksumName = snapshot_struct '%s_snapshots' S = <pakname> AddToStringLookup
	FormatText ChecksumName = processors_struct '%s_lightshow_processors' S = <pakname> AddToStringLookup
	if NOT GlobalExists Name = <event_struct> Type = Structure
		Printf \{"LIGHTSHOW DISABLED: No event mapping found for this venue"}
		PrintStruct <...>
		return \{FALSE}
	endif
	if NOT GlobalExists Name = <snapshot_struct> Type = Structure
		Printf \{"LIGHTSHOW DISABLED: No snapshots found for this venue"}
		PrintStruct <...>
		return \{FALSE}
	endif
	if GlobalExists Name = <processors_struct> Type = Array
		Printf \{"LIGHTSHOW: Adding venue processor definitions"}
		LightShow_SetProcessors Venue = $<processors_struct>
	endif
	LightShow_SetMapping ($<event_struct>)
	LightShow_SetActive \{Active = TRUE}
	LightShow_SetParams {
		performance = MEDIUM
		mood = INTRO
		VenueSnapshots = $<snapshot_struct>
	}
	LightShow_RefreshSpotlightOverrideParams
	if NOT ($debug_forcescore = OFF)
		CrowdIncrease \{player_status = player1_status}
	endif
	return \{TRUE}
endscript

script LightShow_Shutdown 
	Printf \{"LightShow_Shutdown starting"}
	LightShow_SetActive \{Active = FALSE}
	LightShow_SetProcessors \{CLEAR}
	LightShow_SetMapping \{CLEAR}
	KillSpawnedScript \{Name = lightshow_iterator}
	KillSpawnedScript \{Id = LightShow}
	KillSpawnedScript \{Id = ScreenFlash}
	Printf \{"LightShow_Shutdown finished"}
endscript

script Kill_LightShow_FX 
	GetPakManCurrent \{map = Zones}
	switch <pak>
		case Z_Wikker
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
			Enable
			Time
		]
		All}
	Printf "LightShow - spotlight toggle %s" S = <Enable>
	Wait <Time> Seconds
	LightShow_EnableSpotlights <Enable>
endscript

script Venue_PulseOnEvents \{Amount = 1.12
		Time = 0.1}
	if GotParam \{Delay}
		RequireParams \{[
				events
			]
			All}
		Obj_EnableScaling
		Obj_GetScaling
		<start_scale> = <scaling>
		<end_scale> = (<scaling> * <Amount>)
		begin
		Block anytypes = <events>
		Wait <Delay> Seconds
		Obj_ApplyScaling Scale = <end_scale>
		Wait \{1
			GameFrames}
		Obj_MorphScaling target_Scale = <start_scale> Blend_Duration = <Time>
		repeat
	else
		AddPulseEvent events = <events> Amount = <Amount> Time = <Time>
	endif
endscript

script Venue_PulseGreen 
	SetSpawnInstanceLimits \{MAX = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Green
		]}
endscript

script Venue_PulseRed 
	SetSpawnInstanceLimits \{MAX = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Red
		]}
endscript

script Venue_PulseYellow 
	SetSpawnInstanceLimits \{MAX = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Yellow
		]}
endscript

script Venue_PulseBlue 
	SetSpawnInstanceLimits \{MAX = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Blue
		]}
endscript

script Venue_PulseOrange 
	SetSpawnInstanceLimits \{MAX = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Orange
		]}
endscript

script Venue_PulseOpen 
	SetSpawnInstanceLimits \{MAX = 8
		management = ignore_spawn_request}
endscript

script Venue_PulseDrumLeft 
	SetSpawnInstanceLimits \{MAX = 2
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			DrumKick_Left
		]
		Amount = 1.1
		Delay = $drum_kick_anim_delay}
endscript

script Venue_PulseDrumRight 
	SetSpawnInstanceLimits \{MAX = 2
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			DrumKick_Right
		]
		Amount = 1.1
		Delay = $drum_kick_anim_delay}
endscript

script Venue_PulseDrumBoth 
	SetSpawnInstanceLimits \{MAX = 4
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			DrumKick_Left
			DrumKick_Right
		]
		Amount = 1.1
		Delay = $drum_kick_anim_delay}
endscript

script Venue_PulseAny 
	SetSpawnInstanceLimits \{MAX = 8
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
	SetSpawnInstanceLimits \{MAX = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Green
			HitNote_Red
		]}
endscript

script Venue_PulseGreenYellow 
	SetSpawnInstanceLimits \{MAX = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Green
			HitNote_Yellow
		]}
endscript

script Venue_PulseGreenBlue 
	SetSpawnInstanceLimits \{MAX = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Green
			HitNote_Blue
		]}
endscript

script Venue_PulseGreenOrange 
	SetSpawnInstanceLimits \{MAX = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Green
			HitNote_Orange
		]}
endscript

script Venue_PulseGreenOpen 
	SetSpawnInstanceLimits \{MAX = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Green
		]}
endscript

script Venue_PulseRedYellow 
	SetSpawnInstanceLimits \{MAX = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Red
			HitNote_Yellow
		]}
endscript

script Venue_PulseRedBlue 
	SetSpawnInstanceLimits \{MAX = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Red
			HitNote_Blue
		]}
endscript

script Venue_PulseRedOrange 
	SetSpawnInstanceLimits \{MAX = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Red
			HitNote_Orange
		]}
endscript

script Venue_PulseRedOpen 
	SetSpawnInstanceLimits \{MAX = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Red
		]}
endscript

script Venue_PulseYellowBlue 
	SetSpawnInstanceLimits \{MAX = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Yellow
			HitNote_Blue
		]}
endscript

script Venue_PulseYellowOrange 
	SetSpawnInstanceLimits \{MAX = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Yellow
			HitNote_Orange
		]}
endscript

script Venue_PulseYellowOpen 
	SetSpawnInstanceLimits \{MAX = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Yellow
		]}
endscript

script Venue_PulseBlueOrange 
	SetSpawnInstanceLimits \{MAX = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Blue
			HitNote_Orange
		]}
endscript

script Venue_PulseBlueOpen 
	SetSpawnInstanceLimits \{MAX = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Blue
		]}
endscript

script Venue_PulseOrangeOpen 
	SetSpawnInstanceLimits \{MAX = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Orange
		]}
endscript
