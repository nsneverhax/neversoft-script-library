lightshow_debug = 0
lightvolume_flarecutoff_low = 0.2
lightvolume_flarecutoff_high = 0.35000002
lightvolume_flarematerialcrc = FlareMaterial_FlareMaterial
lightvolume_lightbulbmaterialcrc = lightbulbmaterial_lightbulbmaterial
lightvolume_flaresaturate = 1.0
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
lightshow_allow_mood_changes = true
lightshow_last_mood_requested = None
lightshow_mood_override_debug = FALSE
lightshow_mood_override_starpower = FALSE
lightshow_mood_override_blackout = FALSE
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
lightshow_projectortargetnames = {
	Z_ArtDeco_GFX_TRG_LH_stageHSAccent = z_artdeco_spotlight_stagehsaccent
	Z_ArtDeco_GFX_TRG_LH_GuitaristHotSpot01 = z_artdeco_spotlight_guitaristhotspot01
	Z_ArtDeco_GFX_TRG_LH_BassistHotSpot01 = z_artdeco_spotlight_bassist
	Z_ArtDeco_GFX_TRG_LH_stageHSAccent01 = z_artdeco_spotlight_vocalist
	Z_Budokan_GFX_TRG_LH_HotSpot01 = z_budokan_spotlight_hotspot01
	Z_Budokan_GFX_TRG_LH_HotSpot02 = z_budokan_spotlight_hotspot02
	Z_Budokan_GFX_TRG_LH_HotSpot03 = z_budokan_spotlight_hotspot03
	Z_Budokan_GFX_TRG_LH_Guitarist_HotSpot01 = z_budokan_spotlight_guitaristhotspot01
	Z_Dive_GFX_TRG_LH_HotSpot01 = z_dive_spotlight_hotspot01
	Z_Dive_GFX_TRG_LH_HotSpot02 = z_dive_spotlight_hotspot02
	Z_Dive_GFX_TRG_LH_Dancer_HotSpot01 = z_dive_spotlight_dancer_hotspot01
	Z_Dive_GFX_TRG_LH_Dancer_HotSpot02 = z_dive_spotlight_dancer_hotspot02
	Z_Dive_GFX_TRG_LH_Guitarist_HotSpot01 = z_dive_spotlight_guitarist_hotspot01
	Z_Hell_GFX_TRG_LH_HotSpot01 = z_hell_spotlight_hotspot01
	Z_Hell_GFX_TRG_LH_HotSpot02 = z_hell_spotlight_hotspot02
	Z_Hell_GFX_TRG_LH_Guitarist_HotSpot01 = z_hell_spotlight_guitaristhotspot01
	Z_Party_GFX_TRG_LH_HotSpot01 = z_party_spotlight_hotspot01
	Z_Party_GFX_TRG_LH_HotSpot02 = z_party_spotlight_hotspot02
	Z_Party_GFX_TRG_LH_Guitarist_HotSpot01 = z_party_spotlight_guitarist_hotspot01
	Z_Prison_GFX_TRG_LH_HotSpot01 = z_prison_spotlight_hotspot01
	Z_Prison_GFX_TRG_LH_HotSpot02 = z_prison_spotlight_hotspot02
	Z_Prison_GFX_TRG_LH_Guitarist_HotSpot01 = z_prison_spotlight_guitarist_hotspot01
	Z_Video_GFX_TRG_LH_HotSpot01 = z_video_spotlight_hotspot01
	Z_Wikker_GFX_TRG_LH_Vocalist_HotSpot01 = z_wikker_spotlight_vocalist_hotspot01
	Z_Wikker_GFX_TRG_LH_Bassist_HotSpot01 = z_wikker_spotlight_bassist_hotspot01
	Z_Wikker_GFX_TRG_LH_Bassist_HotSpot01a = z_wikker_spotlight_bassist_hotspot01a
	Z_Wikker_GFX_TRG_LH_Guitarist_HotSpot01 = z_wikker_spotlight_guitarist_hotspot01
	Z_Wikker_GFX_TRG_LH_Guitarist_HotSpot01a = z_wikker_spotlight_guitarist_hotspot01a
}
lightshow_spotlights = [
	Z_ArtDeco_GFX_L_Band_Guitarist_Spot01
	Z_Budokan_GFX_L_Band_Guitarist_Spot01
	Z_Dive_GFX_L_Band_Guitarist_Spot01
	Z_Hell_GFX_L_Band_Guitarist_Spot01
	Z_Party_GFX_L_Band_Guitarist_Spot01
	Z_Prison_GFX_L_Band_Guitarist_Spot01
	Z_Video_GFX_L_Band_Guitarist_Spot01
	Z_Wikker_GFX_L_Band_Guitarist_Spot01
	Z_Dive_GFX_L_Band_Dancer_Spot01
	Z_Dive_GFX_L_Band_Dancer_Spot02
]
lightshow_customweights = [
	{
		Z_ArtDeco_GFX_L_Band_Guitarist_Spot01
		10.0
	}
	{
		Z_Budokan_GFX_L_Band_Guitarist_Spot01
		10.0
	}
	{
		Z_Dive_GFX_L_Band_Guitarist_Spot01
		10.0
	}
	{
		Z_Hell_GFX_L_Band_Guitarist_Spot01
		10.0
	}
	{
		Z_Prison_GFX_L_Band_Guitarist_Spot01
		10.0
	}
	{
		Z_Video_GFX_L_Band_Guitarist_Spot01
		10.0
	}
	{
		Z_Wikker_GFX_L_Band_Guitarist_Spot01
		10.0
	}
	{
		Z_Dive_GFX_L_Band_Dancer_Spot01
		10.0
	}
	{
		Z_Dive_GFX_L_Band_Dancer_Spot02
		10.0
	}
	{
		Z_Party_GFX_L_Stage_Center_Direct01
		0.1
	}
	{
		Z_Video_GFX_VC_Cola_Omni01
		0.1
	}
	{
		Z_Video_GFX_VC_Exit_Omni01
		0.1
	}
	{
		Z_Video_GFX_VC_Exit_Omni02
		0.1
	}
	{
		Z_Video_GFX_VC_Exit_Omni03
		0.1
	}
	{
		Z_Video_GFX_VC_Exit_Omni04
		0.1
	}
	{
		Z_Video_GFX_VC_Periph_Left_Direct01
		0.1
	}
	{
		Z_Video_GFX_VC_Periph_Right_Direct01
		0.1
	}
]
lightshow_groupremap = {
}
lightshow_debuglightgrouppriorities = 0
lightshow_housingmodels = [
]

script LightShow_CreatePermModels 
endscript

script LS_AllOff 
	KillSpawnedScript \{id = LightShow}
endscript

script LS_ResetVenueLights 
	LS_AllOff
	LS_KillFX
	GetPakManCurrent \{map = zones}
endscript

script LS_KillFX 
endscript
lightshow_spotlightfollownames = [
	musician1
	musician2
	musician3
	musician4
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
	Z_Dive_GFX_L_Band_Dancer_Spot01
	Z_Dive_GFX_L_Band_Dancer_Spot02
	Z_Dive_GFX_L_Band_Guitarist_Spot01
	Z_Dive_GFX_L_Band_Up_Direct01
	Z_Dive_GFX_L_Crowd_Ambient01
	Z_Dive_GFX_L_Stage_Dancer_Omni01
	Z_Dive_GFX_L_Stage_Up_Direct01
	Z_Dive_GFX_TRG_LH_Dancer_HotSpot01
	Z_Dive_GFX_TRG_LH_Dancer_HotSpot02
	Z_Dive_GFX_TRG_LH_Guitarist_HotSpot01
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
	Z_Hell_GFX_L_Band_Fire_Direct01
	Z_Hell_GFX_L_Band_Guitarist_Spot01
	Z_Hell_GFX_L_Band_Up_Direct01
	Z_Hell_GFX_L_Crowd_Ambient01
	Z_Hell_GFX_L_Stage_Ambient01
	Z_Hell_GFX_L_Stage_Up_Direct01
	Z_Hell_GFX_TRG_LH_Guitarist_HotSpot01
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
	Z_Video_GFX_L_Band_Guitarist_Spot01
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
	Z_Wikker_GFX_L_Band_Guitarist_Spot01
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
		ScrEnter = LightShow_Strobe_Enter
		ScrEvent = LightShow_Strobe_Event
		ScrExit = LightShow_Strobe_Exit
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
			WaitOneGameFrame
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
endscript

script process_lightshow_note 
	getsongglobal Name = <event_array> index = (<array_entry> + 1)
	decompressnotevalue note_value = <element>
	if (<length> > 150)
		length = (<length> - 50)
	endif
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
endscript

script LightShow_PyroEvent 
	if LightShow_GetPyroScript
		if StructureContains structure = pyro_scripts <Type>
			GetPakManCurrent \{map = zones}
			if NOT (<pak> = z_visualizer)
				if ScriptIsRunning \{fretbar_update_tempo}
					SoundEvent \{event = pyro}
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
endscript

script LightShow_InitEventMappings 
	printf \{qs(0xa6e31d47)}
	LightShow_AppendSnapshotParams \{CLEAR}
	LightShow_OverrideColor \{OFF}
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
	GetPakManCurrentName \{map = zones}
	formatText checksumName = event_struct '%s_lightshow_mapping' s = <pakname> AddToStringLookup
	formatText checksumName = snapshot_struct '%s_snapshots' s = <pakname> AddToStringLookup
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
	}
	lightshow_spotlightcolor \{Color = white}
	formatText checksumName = venue_setup_scr '%s_SetupLightShow' s = <pakname> AddToStringLookup
	if ScriptExists <venue_setup_scr>
		SpawnScriptNow <venue_setup_scr> id = LightShow
	endif
	if NOT ($lightshow_debug_lighting_snapshot = 0x00000000)
		printf qs(0x031aedce) s = ($lightshow_debug_lighting_snapshot)
		LightShow_PlaySnapshot Name = ($lightshow_debug_lighting_snapshot) save = true UseSnapshotPositions = true
		<parse_notetrack> = FALSE
	endif
	return \{true}
endscript

script lightshow_zone_init \{zone_string_name = 0x69696969}
	if NOT ($lightshow_debug_lighting_snapshot = 0x00000000)
		printf qs(0x34991d38) s = ($lightshow_debug_lighting_snapshot)
		LightShow_InitEventMappings force_pakname = <zone_string_name>
	endif
endscript

script lightshow_dummyloop 
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
	KillSpawnedScript \{id = ScreenFlash}
	KillSpawnedScript \{id = lightshow_dummyloop_spawned}
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

script lightshow_debugcycle \{Dir = 1}
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
			SpawnScriptNow \{lightshow_debug_dislay_name
				params = {
					debug_text = qs(0x9797f3fc)
				}}
			lightshow_remove_mood_override_reason \{reason = debug}
			return
		endif
	endif
	if ($lightshow_debugcycle_index < 0)
		Change lightshow_debugcycle_index = (<array_Size> -1)
		if ($lightshow_mood_override_debug = true)
			SpawnScriptNow \{lightshow_debug_dislay_name
				params = {
					debug_text = qs(0x9797f3fc)
				}}
			lightshow_remove_mood_override_reason \{reason = debug}
			return
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
	if (mood != unknown)
		LightShow_SetParams mood = <mood>
	endif
	LightShow_PlaySnapshot Name = <snapshot_crc> save = true UseSnapshotPositions = true
	SpawnScriptNow lightshow_debug_dislay_name params = {debug_text = <debug_text>}
	Change \{lightshow_allow_mood_changes = FALSE}
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
		WaitOneGameFrame
		Obj_MorphScaling target_scale = <start_scale> blend_duration = <time>
		repeat
	else
		AddPulseEvent events = <events> amount = <amount> time = <time>
	endif
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

script visualizer_genericmood_enter 
	LightShow_CycleNextSnapshot \{UseSnapshotPositions = true
		save = true}
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
