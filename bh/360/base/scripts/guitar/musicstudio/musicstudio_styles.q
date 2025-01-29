jam_wizard_styles_default_test_pattern = [
	Pop_Rock
	Breakdown
	c
]
jam_wizard_styles_default_visualizer = [
	JOW_Jam_4P_DiamondStar
	JOW_Jam_4P_RainbowRoad
	JOW_Jam_4P_Anarchy
	JOW_Jam_4P_SkullLightning
	JOW_Jam_4P_MusicStaff
	JOW_Jam_4P_ElectricTunnel
	JOW_Jam_4P_PinkTunnel
	JOW_Jam_4P_ElectricTunnel_B
	JOW_Jam_4P_ChipLines
]
musicstudio_default_style_settings = {
	bpm = 120
	line6_0 = pop_delay
	line6_1 = pop_rocks
	line6_0_volume = 8
	line6_1_volume = 8
	line6_0_pan = 0
	line6_1_pan = 0
	bend_set = medium_pitch_bends
	track_settings = {
		rhythm = {
			line6_routing = line6_1
			Sound = Classic_Electric_Guitar
			volume = 8
			panning = 0
			scales = {
				root = 0
				ScaleIndex = 0
			}
			default_bot = false
		}
		lead = {
			line6_routing = line6_0
			Sound = Modern_Electric_Guitar
			volume = 8
			panning = 0
			scales = {
				root = 0
				ScaleIndex = 0
			}
			default_bot = false
		}
		bass = {
			line6_routing = None
			Sound = Fingered_Bass
			volume = 8
			panning = 0
			scales = {
				root = 0
				ScaleIndex = 0
			}
			default_bot = false
		}
		Drum = {
			line6_routing = None
			Sound = standardrock
			volume = 8
			panning = 0
			scales = {
				root = 0
				ScaleIndex = 0
			}
			default_bot = false
		}
		melody = {
			line6_routing = None
			Sound = Rock_Organ
			volume = 8
			panning = 0
			scales = {
				root = 0
				ScaleIndex = 0
			}
			default_bot = false
		}
	}
}
jamroom_wizard_styles = [
	{
		name_text = qs(0x2b786680)
		bpm = 120
		line6_0 = pop_delay
		line6_1 = pop_rocks
		line6_0_volume = 8
		line6_1_volume = 8
		line6_0_pan = -1
		line6_1_pan = 0
		track_settings = {
			rhythm = {
				line6_routing = line6_1
				Sound = Modern_Electric_Guitar
				volume = 8
				panning = 0
				scales = {
					root = 0
					ScaleIndex = 0
				}
				bend_set = expressive_set
				default_bot = true
			}
			lead = {
				line6_routing = line6_0
				Sound = Modern_Electric_Guitar
				volume = 8
				panning = 0
				scales = {
					root = 0
					ScaleIndex = 0
				}
				bend_set = expressive_set
				default_bot = false
			}
			bass = {
				line6_routing = None
				Sound = Fingered_Bass
				volume = 7
				panning = 0
				scales = {
					root = 0
					ScaleIndex = 0
				}
				bend_set = expressive_set
				default_bot = true
			}
			Drum = {
				line6_routing = None
				Sound = standardrock
				volume = 9
				panning = 0
				scales = {
					root = 0
					ScaleIndex = 0
				}
				bend_set = medium_pitch_bends
				default_bot = true
			}
			melody = {
				line6_routing = None
				Sound = Rock_Organ
				volume = 8
				panning = 1
				scales = {
					root = 0
					ScaleIndex = 0
				}
				bend_set = expressive_set
				default_bot = false
			}
		}
		bot_patterns = [
			{
				pattern = [
					Pop_Rock
					verse
					a
				]
				loop = 3
			}
			{
				pattern = [
					Pop_Rock
					Fill
					a
				]
				loop = 1
			}
			{
				pattern = [
					Pop_Rock
					Chorus
					b
				]
				loop = 3
			}
			{
				pattern = [
					Pop_Rock
					Fill
					b
				]
				loop = 1
			}
			{
				pattern = [
					Pop_Rock
					verse
					a
				]
				loop = 1
			}
			{
				pattern = [
					Pop_Rock
					Fill
					a
				]
				loop = 1
			}
			{
				pattern = [
					Pop_Rock
					Chorus
					b
				]
				loop = 3
			}
			{
				pattern = [
					Pop_Rock
					Fill
					b
				]
				loop = 1
			}
			{
				pattern = [
					Pop_Rock
					Breakdown
					c
				]
				loop = 4
			}
			{
				pattern = [
					Pop_Rock
					Chorus
					b
				]
				loop = 3
			}
			{
				pattern = [
					Pop_Rock
					Fill
					b
				]
				loop = 1
			}
			{
				pattern = [
					Pop_Rock
					Breakdown
					c
				]
				loop = 4
			}
			{
				pattern = [
					Pop_Rock
					Ending
					d
				]
				loop = 1
			}
		]
		visualizers = [
			JOW_Jam_4P_DiamondStar
		]
		green_assigned_pattern = [
			Pop_Rock
			verse
			a
		]
		red_assigned_pattern = [
			Pop_Rock
			Fill
			a
		]
		yellow_assigned_pattern = [
			Pop_Rock
			Chorus
			b
		]
		blue_assigned_pattern = [
			Pop_Rock
			Fill
			b
		]
		orange_assigned_pattern = [
			Pop_Rock
			Breakdown
			c
		]
	}
	{
		name_text = qs(0x69cd8928)
		bpm = 80
		line6_0 = alt_rocker
		line6_1 = funky_flange
		line6_0_volume = 9
		line6_1_volume = 10
		line6_0_pan = 2
		line6_1_pan = 0
		track_settings = {
			rhythm = {
				line6_routing = line6_1
				Sound = Classic_Electric_Guitar
				volume = 8
				panning = 0
				scales = {
					root = 7
					ScaleIndex = 2
				}
				bend_set = expressive_set
				default_bot = true
			}
			lead = {
				line6_routing = line6_0
				Sound = Classic_Electric_Guitar
				volume = 8
				panning = 2
				scales = {
					root = 7
					ScaleIndex = 2
				}
				bend_set = expressive_set
				default_bot = false
			}
			bass = {
				line6_routing = None
				Sound = Fingered_Bass
				volume = 7
				panning = 0
				scales = {
					root = 7
					ScaleIndex = 2
				}
				bend_set = expressive_set
				default_bot = true
			}
			Drum = {
				line6_routing = None
				Sound = classicrock
				volume = 9
				panning = 0
				scales = {
					root = 7
					ScaleIndex = 2
				}
				bend_set = medium_pitch_bends
				default_bot = true
			}
			melody = {
				line6_routing = None
				Sound = Synth_Lead_Triangle
				volume = 8
				panning = 1
				scales = {
					root = 7
					ScaleIndex = 2
				}
				bend_set = expressive_set
				default_bot = true
			}
		}
		bot_patterns = [
			{
				pattern = [
					Classic_Rock
					verse
					a
				]
				loop = 3
			}
			{
				pattern = [
					Classic_Rock
					Fill
					a
				]
				loop = 1
			}
			{
				pattern = [
					Classic_Rock
					Chorus
					b
				]
				loop = 1
			}
			{
				pattern = [
					Classic_Rock
					Fill
					b
				]
				loop = 1
			}
			{
				pattern = [
					Classic_Rock
					verse
					a
				]
				loop = 1
			}
			{
				pattern = [
					Classic_Rock
					Fill
					a
				]
				loop = 1
			}
			{
				pattern = [
					Classic_Rock
					Chorus
					b
				]
				loop = 3
			}
			{
				pattern = [
					Classic_Rock
					Fill
					b
				]
				loop = 1
			}
			{
				pattern = [
					Classic_Rock
					Breakdown
					c
				]
				loop = 4
			}
			{
				pattern = [
					Classic_Rock
					Chorus
					b
				]
				loop = 3
			}
			{
				pattern = [
					Classic_Rock
					Fill
					b
				]
				loop = 1
			}
			{
				pattern = [
					Classic_Rock
					Ending
					d
				]
				loop = 1
			}
		]
		visualizers = [
			JOW_Jam_4P_RainbowRoad
		]
		green_assigned_pattern = [
			Classic_Rock
			verse
			a
		]
		red_assigned_pattern = [
			Classic_Rock
			Fill
			a
		]
		yellow_assigned_pattern = [
			Classic_Rock
			Chorus
			b
		]
		blue_assigned_pattern = [
			Classic_Rock
			Fill
			b
		]
		orange_assigned_pattern = [
			Classic_Rock
			Breakdown
			c
		]
	}
	{
		name_text = qs(0xf5288ef2)
		bpm = 83
		line6_0 = classic_solo
		line6_1 = Classic_Rock
		line6_0_volume = 9
		line6_1_volume = 8
		line6_0_pan = -1
		line6_1_pan = 0
		track_settings = {
			rhythm = {
				line6_routing = line6_1
				Sound = Modern_Electric_Guitar
				volume = 10
				panning = 0
				scales = {
					root = 5
					ScaleIndex = 4
				}
				bend_set = expressive_set
				default_bot = true
			}
			lead = {
				line6_routing = line6_0
				Sound = Modern_Electric_Guitar
				volume = 8
				panning = 0
				scales = {
					root = 5
					ScaleIndex = 4
				}
				bend_set = expressive_set
				default_bot = false
			}
			bass = {
				line6_routing = None
				Sound = Picked_Bass
				volume = 5
				panning = 0
				scales = {
					root = 5
					ScaleIndex = 4
				}
				bend_set = expressive_set
				default_bot = true
			}
			Drum = {
				line6_routing = None
				Sound = bigroomrock
				volume = 9
				panning = 0
				scales = {
					root = 5
					ScaleIndex = 4
				}
				bend_set = medium_pitch_bends
				default_bot = true
			}
			melody = {
				line6_routing = None
				Sound = dirty_organ
				volume = 7
				panning = -1
				scales = {
					root = 5
					ScaleIndex = 4
				}
				bend_set = expressive_set
				default_bot = true
			}
		}
		bot_patterns = [
			{
				pattern = [
					rock
					verse
					a
				]
				loop = 1
			}
			{
				pattern = [
					rock
					Fill
					a
				]
				loop = 1
			}
			{
				pattern = [
					rock
					Chorus
					b
				]
				loop = 1
			}
			{
				pattern = [
					rock
					Fill
					b
				]
				loop = 1
			}
			{
				pattern = [
					rock
					verse
					a
				]
				loop = 1
			}
			{
				pattern = [
					rock
					Fill
					a
				]
				loop = 1
			}
			{
				pattern = [
					rock
					Chorus
					b
				]
				loop = 1
			}
			{
				pattern = [
					rock
					Fill
					b
				]
				loop = 1
			}
			{
				pattern = [
					rock
					Breakdown
					c
				]
				loop = 4
			}
			{
				pattern = [
					rock
					Chorus
					b
				]
				loop = 1
			}
			{
				pattern = [
					rock
					Fill
					b
				]
				loop = 1
			}
			{
				pattern = [
					rock
					verse
					a
				]
				loop = 1
			}
			{
				pattern = [
					rock
					Fill
					a
				]
				loop = 1
			}
			{
				pattern = [
					rock
					Chorus
					b
				]
				loop = 1
			}
			{
				pattern = [
					rock
					Fill
					b
				]
				loop = 1
			}
			{
				pattern = [
					rock
					Ending
					d
				]
				loop = 1
			}
		]
		visualizers = [
			JOW_Jam_4P_RainbowRoad
		]
		green_assigned_pattern = [
			rock
			verse
			a
		]
		red_assigned_pattern = [
			rock
			Fill
			a
		]
		yellow_assigned_pattern = [
			rock
			Chorus
			b
		]
		blue_assigned_pattern = [
			rock
			Fill
			b
		]
		orange_assigned_pattern = [
			rock
			Breakdown
			c
		]
	}
	{
		name_text = qs(0xa5f21c14)
		bpm = 125
		line6_0 = alt_rocker
		line6_1 = blues_chorus
		line6_0_volume = 8
		line6_1_volume = 8
		line6_0_pan = -1
		line6_1_pan = 0
		track_settings = {
			rhythm = {
				line6_routing = line6_1
				Sound = Modern_Electric_Guitar
				volume = 8
				panning = 0
				scales = {
					root = 5
					ScaleIndex = 0
				}
				bend_set = expressive_set
				default_bot = true
			}
			lead = {
				line6_routing = line6_0
				Sound = Modern_Electric_Guitar
				volume = 8
				panning = -1
				scales = {
					root = 5
					ScaleIndex = 0
				}
				bend_set = expressive_set
				default_bot = false
			}
			bass = {
				line6_routing = None
				Sound = Fingered_Bass
				volume = 5
				panning = 0
				scales = {
					root = 5
					ScaleIndex = 0
				}
				bend_set = expressive_set
				default_bot = true
			}
			Drum = {
				line6_routing = None
				Sound = modernrock
				volume = 10
				panning = 0
				scales = {
					root = 5
					ScaleIndex = 0
				}
				bend_set = medium_pitch_bends
				default_bot = true
			}
			melody = {
				line6_routing = line6_1
				Sound = sine_lead
				volume = 1
				panning = 1
				scales = {
					root = 5
					ScaleIndex = 0
				}
				bend_set = expressive_set
				default_bot = true
			}
		}
		bot_patterns = [
			{
				pattern = [
					alternative
					verse
					a
				]
				loop = 1
			}
			{
				pattern = [
					alternative
					Fill
					a
				]
				loop = 1
			}
			{
				pattern = [
					alternative
					Chorus
					b
				]
				loop = 1
			}
			{
				pattern = [
					alternative
					Fill
					b
				]
				loop = 1
			}
			{
				pattern = [
					alternative
					verse
					a
				]
				loop = 1
			}
			{
				pattern = [
					alternative
					Fill
					a
				]
				loop = 1
			}
			{
				pattern = [
					alternative
					Chorus
					b
				]
				loop = 1
			}
			{
				pattern = [
					alternative
					Fill
					b
				]
				loop = 1
			}
			{
				pattern = [
					alternative
					BRIDGE
					c
				]
				loop = 2
			}
			{
				pattern = [
					alternative
					Chorus
					b
				]
				loop = 1
			}
			{
				pattern = [
					alternative
					Fill
					b
				]
				loop = 1
			}
			{
				pattern = [
					alternative
					Ending
					d
				]
				loop = 1
			}
		]
		visualizers = [
			JOW_Jam_4P_DiamondStar
		]
		green_assigned_pattern = [
			alternative
			verse
			a
		]
		red_assigned_pattern = [
			alternative
			Fill
			a
		]
		yellow_assigned_pattern = [
			alternative
			Chorus
			b
		]
		blue_assigned_pattern = [
			alternative
			Fill
			b
		]
		orange_assigned_pattern = [
			alternative
			BRIDGE
			c
		]
	}
	{
		name_text = qs(0xb915c00f)
		bpm = 180
		line6_0 = punk_jam
		line6_1 = heavy_drive
		line6_0_volume = 9
		line6_1_volume = 8
		line6_0_pan = -1
		line6_1_pan = 1
		track_settings = {
			rhythm = {
				line6_routing = line6_1
				Sound = Modern_Electric_Guitar
				volume = 10
				panning = 1
				scales = {
					root = 11
					ScaleIndex = 0
				}
				bend_set = expressive_set
				default_bot = true
			}
			lead = {
				line6_routing = line6_0
				Sound = Modern_Electric_Guitar
				volume = 10
				panning = -1
				scales = {
					root = 11
					ScaleIndex = 0
				}
				bend_set = expressive_set
				default_bot = false
			}
			bass = {
				line6_routing = None
				Sound = Picked_Bass
				volume = 6
				panning = 0
				scales = {
					root = 11
					ScaleIndex = 0
				}
				bend_set = expressive_set
				default_bot = true
			}
			Drum = {
				line6_routing = None
				Sound = standardrock
				volume = 7
				panning = 0
				scales = {
					root = 11
					ScaleIndex = 0
				}
				bend_set = medium_pitch_bends
				default_bot = true
			}
			melody = {
				line6_routing = None
				Sound = dirty_organ
				volume = 6
				panning = 1
				scales = {
					root = 11
					ScaleIndex = 0
				}
				bend_set = expressive_set
				default_bot = true
			}
		}
		bot_patterns = [
			{
				pattern = [
					Punk
					verse
					a
				]
				loop = 1
			}
			{
				pattern = [
					Punk
					Fill
					a
				]
				loop = 1
			}
			{
				pattern = [
					Punk
					Chorus
					b
				]
				loop = 3
			}
			{
				pattern = [
					Punk
					Fill
					b
				]
				loop = 1
			}
			{
				pattern = [
					Punk
					verse
					a
				]
				loop = 1
			}
			{
				pattern = [
					Punk
					Fill
					a
				]
				loop = 1
			}
			{
				pattern = [
					Punk
					Chorus
					b
				]
				loop = 3
			}
			{
				pattern = [
					Punk
					Fill
					b
				]
				loop = 1
			}
			{
				pattern = [
					Punk
					Breakdown
					c
				]
				loop = 4
			}
			{
				pattern = [
					Punk
					Chorus
					b
				]
				loop = 3
			}
			{
				pattern = [
					Punk
					Fill
					b
				]
				loop = 1
			}
			{
				pattern = [
					Punk
					verse
					a
				]
				loop = 1
			}
			{
				pattern = [
					Punk
					Fill
					a
				]
				loop = 1
			}
			{
				pattern = [
					Punk
					Chorus
					b
				]
				loop = 3
			}
			{
				pattern = [
					Punk
					Fill
					b
				]
				loop = 1
			}
			{
				pattern = [
					Punk
					Ending
					d
				]
				loop = 1
			}
		]
		visualizers = [
			JOW_Jam_4P_Anarchy
		]
		green_assigned_pattern = [
			Punk
			verse
			a
		]
		red_assigned_pattern = [
			Punk
			Fill
			a
		]
		yellow_assigned_pattern = [
			Punk
			Chorus
			b
		]
		blue_assigned_pattern = [
			Punk
			Fill
			b
		]
		orange_assigned_pattern = [
			Punk
			Breakdown
			c
		]
	}
	{
		name_text = qs(0x8c227232)
		bpm = 124
		line6_0 = hot_rocker
		line6_1 = heavy_drive
		line6_0_volume = 8
		line6_1_volume = 8
		line6_0_pan = 1
		line6_1_pan = 0
		track_settings = {
			rhythm = {
				line6_routing = line6_1
				Sound = Modern_Electric_Guitar
				volume = 9
				panning = 0
				scales = {
					root = 5
					ScaleIndex = 3
				}
				bend_set = expressive_set
				default_bot = true
			}
			lead = {
				line6_routing = line6_0
				Sound = Modern_Electric_Guitar
				volume = 9
				panning = 1
				scales = {
					root = 5
					ScaleIndex = 3
				}
				bend_set = expressive_set
				default_bot = false
			}
			bass = {
				line6_routing = None
				Sound = Picked_Bass
				volume = 6
				panning = 0
				scales = {
					root = 5
					ScaleIndex = 3
				}
				bend_set = expressive_set
				default_bot = true
			}
			Drum = {
				line6_routing = None
				Sound = heavyrock
				volume = 7
				panning = 0
				scales = {
					root = 5
					ScaleIndex = 3
				}
				bend_set = medium_pitch_bends
				default_bot = true
			}
			melody = {
				line6_routing = None
				Sound = Rock_Organ
				volume = 6
				panning = -1
				scales = {
					root = 5
					ScaleIndex = 3
				}
				bend_set = expressive_set
				default_bot = true
			}
		}
		bot_patterns = [
			{
				pattern = [
					Hard_Rock
					verse
					a
				]
				loop = 3
			}
			{
				pattern = [
					Hard_Rock
					Fill
					a
				]
				loop = 1
			}
			{
				pattern = [
					Hard_Rock
					Chorus
					b
				]
				loop = 1
			}
			{
				pattern = [
					Hard_Rock
					Fill
					b
				]
				loop = 1
			}
			{
				pattern = [
					Hard_Rock
					verse
					a
				]
				loop = 3
			}
			{
				pattern = [
					Hard_Rock
					Fill
					a
				]
				loop = 1
			}
			{
				pattern = [
					Hard_Rock
					Chorus
					b
				]
				loop = 3
			}
			{
				pattern = [
					Hard_Rock
					Fill
					b
				]
				loop = 1
			}
			{
				pattern = [
					Hard_Rock
					Breakdown
					c
				]
				loop = 4
			}
			{
				pattern = [
					Hard_Rock
					verse
					a
				]
				loop = 3
			}
			{
				pattern = [
					Hard_Rock
					Fill
					a
				]
				loop = 1
			}
			{
				pattern = [
					Hard_Rock
					Chorus
					b
				]
				loop = 3
			}
			{
				pattern = [
					Hard_Rock
					Fill
					b
				]
				loop = 1
			}
			{
				pattern = [
					Hard_Rock
					Ending
					d
				]
				loop = 1
			}
		]
		visualizers = [
			JOW_Jam_4P_DiamondStar
		]
		green_assigned_pattern = [
			Hard_Rock
			verse
			a
		]
		red_assigned_pattern = [
			Hard_Rock
			Fill
			a
		]
		yellow_assigned_pattern = [
			Hard_Rock
			Chorus
			b
		]
		blue_assigned_pattern = [
			Hard_Rock
			Fill
			b
		]
		orange_assigned_pattern = [
			Hard_Rock
			Breakdown
			c
		]
	}
	{
		name_text = qs(0x355b4e5c)
		bpm = 172
		line6_0 = metal_swirl
		line6_1 = heavy_drive
		line6_0_volume = 9
		line6_1_volume = 8
		line6_0_pan = 2
		line6_1_pan = 0
		track_settings = {
			rhythm = {
				line6_routing = line6_1
				Sound = Modern_Electric_Guitar
				volume = 10
				panning = 0
				scales = {
					root = 0
					ScaleIndex = 5
				}
				bend_set = expressive_set
				default_bot = true
			}
			lead = {
				line6_routing = line6_0
				Sound = Modern_Electric_Guitar
				volume = 9
				panning = 2
				scales = {
					root = 0
					ScaleIndex = 5
				}
				bend_set = expressive_set
				default_bot = false
			}
			bass = {
				line6_routing = None
				Sound = Picked_Bass
				volume = 5
				panning = 0
				scales = {
					root = 0
					ScaleIndex = 5
				}
				bend_set = expressive_set
				default_bot = true
			}
			Drum = {
				line6_routing = None
				Sound = Metal
				volume = 7
				panning = 0
				scales = {
					root = 0
					ScaleIndex = 5
				}
				bend_set = medium_pitch_bends
				default_bot = true
			}
			melody = {
				line6_routing = None
				Sound = fat_synth
				volume = 7
				panning = -1
				scales = {
					root = 0
					ScaleIndex = 5
				}
				bend_set = expressive_set
				default_bot = true
			}
		}
		bot_patterns = [
			{
				pattern = [
					Metal
					verse
					a
				]
				loop = 3
			}
			{
				pattern = [
					Metal
					Fill
					a
				]
				loop = 1
			}
			{
				pattern = [
					Metal
					Chorus
					b
				]
				loop = 3
			}
			{
				pattern = [
					Metal
					Fill
					b
				]
				loop = 1
			}
			{
				pattern = [
					Metal
					Breakdown
					c
				]
				loop = 2
			}
			{
				pattern = [
					Metal
					verse
					a
				]
				loop = 3
			}
			{
				pattern = [
					Metal
					Fill
					a
				]
				loop = 1
			}
			{
				pattern = [
					Metal
					Chorus
					b
				]
				loop = 3
			}
			{
				pattern = [
					Metal
					Fill
					b
				]
				loop = 1
			}
			{
				pattern = [
					Metal
					Breakdown
					c
				]
				loop = 2
			}
			{
				pattern = [
					Metal
					Chorus
					b
				]
				loop = 3
			}
			{
				pattern = [
					Metal
					Fill
					b
				]
				loop = 1
			}
			{
				pattern = [
					Metal
					Breakdown
					c
				]
				loop = 2
			}
			{
				pattern = [
					Metal
					Chorus
					b
				]
				loop = 3
			}
			{
				pattern = [
					Metal
					Fill
					b
				]
				loop = 1
			}
			{
				pattern = [
					Metal
					Ending
					d
				]
				loop = 1
			}
		]
		visualizers = [
			JOW_Jam_4P_SkullLightning
		]
		green_assigned_pattern = [
			Metal
			verse
			a
		]
		red_assigned_pattern = [
			Metal
			Fill
			a
		]
		yellow_assigned_pattern = [
			Metal
			Chorus
			b
		]
		blue_assigned_pattern = [
			Metal
			Fill
			b
		]
		orange_assigned_pattern = [
			Metal
			Breakdown
			c
		]
	}
	{
		name_text = qs(0x733045d2)
		bpm = 98
		line6_0 = funky_chorus
		line6_1 = blues_chorus
		line6_0_volume = 8
		line6_1_volume = 10
		line6_0_pan = -1
		line6_1_pan = 0
		track_settings = {
			rhythm = {
				line6_routing = line6_1
				Sound = Classic_Electric_Guitar
				volume = 8
				panning = 0
				scales = {
					root = 9
					ScaleIndex = 3
				}
				bend_set = expressive_set
				default_bot = true
			}
			lead = {
				line6_routing = line6_0
				Sound = Classic_Electric_Guitar
				volume = 8
				panning = -1
				scales = {
					root = 9
					ScaleIndex = 3
				}
				bend_set = expressive_set
				default_bot = false
			}
			bass = {
				line6_routing = None
				Sound = Picked_Bass
				volume = 5
				panning = 0
				scales = {
					root = 9
					ScaleIndex = 3
				}
				bend_set = expressive_set
				default_bot = true
			}
			Drum = {
				line6_routing = None
				Sound = modernrock
				volume = 8
				panning = 0
				scales = {
					root = 9
					ScaleIndex = 3
				}
				bend_set = medium_pitch_bends
				default_bot = true
			}
			melody = {
				line6_routing = None
				Sound = rezo_clav
				volume = 7
				panning = 1
				scales = {
					root = 9
					ScaleIndex = 3
				}
				bend_set = expressive_set
				default_bot = true
			}
		}
		bot_patterns = [
			{
				pattern = [
					Funk
					verse
					a
				]
				loop = 3
			}
			{
				pattern = [
					Funk
					Fill
					a
				]
				loop = 1
			}
			{
				pattern = [
					Funk
					Chorus
					b
				]
				loop = 1
			}
			{
				pattern = [
					Funk
					Fill
					b
				]
				loop = 1
			}
			{
				pattern = [
					Funk
					verse
					a
				]
				loop = 1
			}
			{
				pattern = [
					Funk
					Fill
					a
				]
				loop = 1
			}
			{
				pattern = [
					Funk
					Chorus
					b
				]
				loop = 1
			}
			{
				pattern = [
					Funk
					Fill
					b
				]
				loop = 1
			}
			{
				pattern = [
					Funk
					Breakdown
					c
				]
				loop = 4
			}
			{
				pattern = [
					Funk
					verse
					a
				]
				loop = 1
			}
			{
				pattern = [
					Funk
					Fill
					a
				]
				loop = 1
			}
			{
				pattern = [
					Funk
					Chorus
					b
				]
				loop = 1
			}
			{
				pattern = [
					Funk
					Fill
					b
				]
				loop = 1
			}
			{
				pattern = [
					Funk
					Chorus
					b
				]
				loop = 1
			}
			{
				pattern = [
					Funk
					Fill
					b
				]
				loop = 1
			}
			{
				pattern = [
					Funk
					Ending
					d
				]
				loop = 1
			}
		]
		visualizers = [
			JOW_Jam_4P_RainbowRoad
		]
		green_assigned_pattern = [
			Funk
			verse
			a
		]
		red_assigned_pattern = [
			Funk
			Fill
			a
		]
		yellow_assigned_pattern = [
			Funk
			Chorus
			b
		]
		blue_assigned_pattern = [
			Funk
			Fill
			b
		]
		orange_assigned_pattern = [
			Funk
			Breakdown
			c
		]
	}
	{
		name_text = qs(0x527b4496)
		bpm = 84
		line6_0 = blues_break
		line6_1 = blues_chorus
		line6_0_volume = 9
		line6_1_volume = 9
		line6_0_pan = -1
		line6_1_pan = 0
		track_settings = {
			rhythm = {
				line6_routing = line6_1
				Sound = Classic_Electric_Guitar
				volume = 8
				panning = 0
				scales = {
					root = 3
					ScaleIndex = 4
				}
				bend_set = expressive_set
				default_bot = true
			}
			lead = {
				line6_routing = line6_0
				Sound = Classic_Electric_Guitar
				volume = 9
				panning = -1
				scales = {
					root = 3
					ScaleIndex = 4
				}
				bend_set = expressive_set
				default_bot = false
			}
			bass = {
				line6_routing = None
				Sound = Fingered_Bass
				volume = 7
				panning = 0
				scales = {
					root = 3
					ScaleIndex = 4
				}
				bend_set = expressive_set
				default_bot = true
			}
			Drum = {
				line6_routing = None
				Sound = standardrock
				volume = 8
				panning = 0
				scales = {
					root = 3
					ScaleIndex = 4
				}
				bend_set = medium_pitch_bends
				default_bot = true
			}
			melody = {
				line6_routing = None
				Sound = Electric_Piano
				volume = 8
				panning = 1
				scales = {
					root = 3
					ScaleIndex = 4
				}
				bend_set = expressive_set
				default_bot = true
			}
		}
		bot_patterns = [
			{
				pattern = [
					Blues
					verse
					a
				]
				loop = 1
			}
			{
				pattern = [
					Blues
					Chorus
					e
				]
				loop = 1
			}
			{
				pattern = [
					Blues
					verse
					b
				]
				loop = 1
			}
			{
				pattern = [
					Blues
					Chorus
					e
				]
				loop = 1
			}
			{
				pattern = [
					Blues
					verse
					c
				]
				loop = 1
			}
			{
				pattern = [
					Blues
					Chorus
					e
				]
				loop = 1
			}
			{
				pattern = [
					Blues
					verse
					d
				]
				loop = 1
			}
			{
				pattern = [
					Blues
					Ending
					f
				]
				loop = 1
			}
		]
		visualizers = [
			JOW_Jam_4P_MusicStaff
		]
		green_assigned_pattern = [
			Blues
			verse
			a
		]
		red_assigned_pattern = [
			Blues
			verse
			b
		]
		yellow_assigned_pattern = [
			Blues
			verse
			c
		]
		blue_assigned_pattern = [
			Blues
			verse
			d
		]
		orange_assigned_pattern = [
			Blues
			Chorus
			e
		]
	}
	{
		name_text = qs(0x307af3c8)
		bpm = 144
		line6_0 = jazz_bounce
		line6_1 = jazz_trem
		line6_0_volume = 8
		line6_1_volume = 9
		line6_0_pan = 1
		line6_1_pan = 0
		track_settings = {
			rhythm = {
				line6_routing = line6_1
				Sound = Classic_Electric_Guitar
				volume = 8
				panning = 0
				scales = {
					root = 8
					ScaleIndex = 0
				}
				bend_set = expressive_set
				default_bot = true
			}
			lead = {
				line6_routing = line6_0
				Sound = Classic_Electric_Guitar
				volume = 8
				panning = 1
				scales = {
					root = 8
					ScaleIndex = 0
				}
				bend_set = expressive_set
				default_bot = false
			}
			bass = {
				line6_routing = None
				Sound = Fingered_Bass
				volume = 6
				panning = 0
				scales = {
					root = 8
					ScaleIndex = 0
				}
				bend_set = expressive_set
				default_bot = true
			}
			Drum = {
				line6_routing = None
				Sound = fusion
				volume = 8
				panning = 0
				scales = {
					root = 8
					ScaleIndex = 0
				}
				bend_set = medium_pitch_bends
				default_bot = true
			}
			melody = {
				line6_routing = None
				Sound = Electric_Piano
				volume = 7
				panning = -1
				scales = {
					root = 8
					ScaleIndex = 0
				}
				bend_set = expressive_set
				default_bot = true
			}
		}
		bot_patterns = [
			{
				pattern = [
					Jazz
					verse
					a
				]
				loop = 1
			}
			{
				pattern = [
					Jazz
					Fill
					a
				]
				loop = 1
			}
			{
				pattern = [
					Jazz
					Chorus
					b
				]
				loop = 1
			}
			{
				pattern = [
					Jazz
					Fill
					b
				]
				loop = 1
			}
			{
				pattern = [
					Jazz
					verse
					a
				]
				loop = 1
			}
			{
				pattern = [
					Jazz
					Fill
					a
				]
				loop = 1
			}
			{
				pattern = [
					Jazz
					Chorus
					b
				]
				loop = 1
			}
			{
				pattern = [
					Jazz
					Fill
					b
				]
				loop = 1
			}
			{
				pattern = [
					Jazz
					Breakdown
					c
				]
				loop = 4
			}
			{
				pattern = [
					Jazz
					verse
					a
				]
				loop = 1
			}
			{
				pattern = [
					Jazz
					Fill
					a
				]
				loop = 1
			}
			{
				pattern = [
					Jazz
					Breakdown
					c
				]
				loop = 4
			}
			{
				pattern = [
					Jazz
					Chorus
					b
				]
				loop = 1
			}
			{
				pattern = [
					Jazz
					Fill
					b
				]
				loop = 1
			}
			{
				pattern = [
					Jazz
					Chorus
					b
				]
				loop = 1
			}
			{
				pattern = [
					Jazz
					Fill
					b
				]
				loop = 1
			}
			{
				pattern = [
					Jazz
					Ending
					d
				]
				loop = 1
			}
		]
		visualizers = [
			JOW_Jam_4P_MusicStaff
		]
		green_assigned_pattern = [
			Jazz
			verse
			a
		]
		red_assigned_pattern = [
			Jazz
			Fill
			a
		]
		yellow_assigned_pattern = [
			Jazz
			Chorus
			b
		]
		blue_assigned_pattern = [
			Jazz
			Fill
			b
		]
		orange_assigned_pattern = [
			Jazz
			Breakdown
			c
		]
	}
	{
		name_text = qs(0x4911c80a)
		bpm = 90
		line6_0 = pop_delay
		line6_1 = pop_rocks
		line6_0_volume = 7
		line6_1_volume = 8
		line6_0_pan = -1
		line6_1_pan = 0
		track_settings = {
			rhythm = {
				line6_routing = line6_1
				Sound = Modern_Electric_Guitar
				volume = 9
				panning = 1
				scales = {
					root = 0
					ScaleIndex = 2
				}
				bend_set = expressive_set
				default_bot = true
			}
			lead = {
				line6_routing = line6_0
				Sound = Modern_Electric_Guitar
				volume = 8
				panning = -1
				scales = {
					root = 0
					ScaleIndex = 2
				}
				bend_set = expressive_set
				default_bot = false
			}
			bass = {
				line6_routing = None
				Sound = Synth_Bass_Smooth
				volume = 6
				panning = 0
				scales = {
					root = 0
					ScaleIndex = 2
				}
				bend_set = expressive_set
				default_bot = true
			}
			Drum = {
				line6_routing = None
				Sound = hiphop
				volume = 8
				panning = 0
				scales = {
					root = 0
					ScaleIndex = 2
				}
				bend_set = medium_pitch_bends
				default_bot = true
			}
			melody = {
				line6_routing = line6_1
				Sound = saw_lead_thin
				volume = 4
				panning = 1
				scales = {
					root = 0
					ScaleIndex = 2
				}
				bend_set = expressive_set
				default_bot = true
			}
		}
		bot_patterns = [
			{
				pattern = [
					hip_hop
					verse
					a
				]
				loop = 1
			}
			{
				pattern = [
					hip_hop
					Fill
					a
				]
				loop = 1
			}
			{
				pattern = [
					hip_hop
					Chorus
					b
				]
				loop = 1
			}
			{
				pattern = [
					hip_hop
					Fill
					b
				]
				loop = 1
			}
			{
				pattern = [
					hip_hop
					verse
					a
				]
				loop = 1
			}
			{
				pattern = [
					hip_hop
					Fill
					a
				]
				loop = 1
			}
			{
				pattern = [
					hip_hop
					Chorus
					b
				]
				loop = 1
			}
			{
				pattern = [
					hip_hop
					Fill
					b
				]
				loop = 1
			}
			{
				pattern = [
					hip_hop
					Breakdown
					c
				]
				loop = 2
			}
			{
				pattern = [
					hip_hop
					Chorus
					b
				]
				loop = 1
			}
			{
				pattern = [
					hip_hop
					Fill
					b
				]
				loop = 1
			}
		]
		visualizers = [
			JOW_Jam_4P_ElectricTunnel
		]
		green_assigned_pattern = [
			hip_hop
			verse
			a
		]
		red_assigned_pattern = [
			hip_hop
			Fill
			a
		]
		yellow_assigned_pattern = [
			hip_hop
			Chorus
			b
		]
		blue_assigned_pattern = [
			hip_hop
			Fill
			b
		]
		orange_assigned_pattern = [
			hip_hop
			Breakdown
			c
		]
	}
	{
		name_text = qs(0x94823953)
		bpm = 135
		line6_0 = pop_delay
		line6_1 = funky_flange
		line6_0_volume = 9
		line6_1_volume = 8
		line6_0_pan = 0
		line6_1_pan = 0
		track_settings = {
			rhythm = {
				line6_routing = line6_1
				Sound = Classic_Electric_Guitar
				volume = 8
				panning = 0
				scales = {
					root = 3
					ScaleIndex = 2
				}
				bend_set = expressive_set
				default_bot = true
			}
			lead = {
				line6_routing = line6_0
				Sound = Classic_Electric_Guitar
				volume = 8
				panning = 0
				scales = {
					root = 3
					ScaleIndex = 2
				}
				bend_set = expressive_set
				default_bot = false
			}
			bass = {
				line6_routing = None
				Sound = Synth_Bass_Saw_1
				volume = 5
				panning = 0
				scales = {
					root = 3
					ScaleIndex = 2
				}
				bend_set = expressive_set
				default_bot = true
			}
			Drum = {
				line6_routing = None
				Sound = Dance
				volume = 8
				panning = 0
				scales = {
					root = 3
					ScaleIndex = 2
				}
				bend_set = medium_pitch_bends
				default_bot = true
			}
			melody = {
				line6_routing = line6_0
				Sound = trance_lead
				volume = 5
				panning = 0
				scales = {
					root = 3
					ScaleIndex = 2
				}
				bend_set = expressive_set
				default_bot = true
			}
		}
		bot_patterns = [
			{
				pattern = [
					Dance
					verse
					a
				]
				loop = 1
			}
			{
				pattern = [
					Dance
					Fill
					a
				]
				loop = 1
			}
			{
				pattern = [
					Dance
					Chorus
					b
				]
				loop = 1
			}
			{
				pattern = [
					Dance
					Fill
					b
				]
				loop = 1
			}
			{
				pattern = [
					Dance
					verse
					a
				]
				loop = 1
			}
			{
				pattern = [
					Dance
					Fill
					a
				]
				loop = 1
			}
			{
				pattern = [
					Dance
					Chorus
					b
				]
				loop = 1
			}
			{
				pattern = [
					Dance
					Fill
					b
				]
				loop = 1
			}
			{
				pattern = [
					Dance
					Breakdown
					c
				]
				loop = 2
			}
			{
				pattern = [
					Dance
					Chorus
					b
				]
				loop = 1
			}
			{
				pattern = [
					Dance
					Fill
					b
				]
				loop = 1
			}
			{
				pattern = [
					Dance
					Breakdown
					c
				]
				loop = 2
			}
			{
				pattern = [
					Dance
					Chorus
					b
				]
				loop = 1
			}
			{
				pattern = [
					Dance
					Fill
					b
				]
				loop = 1
			}
			{
				pattern = [
					Dance
					Ending
					d
				]
				loop = 1
			}
		]
		visualizers = [
			JOW_Jam_4P_PinkTunnel
		]
		green_assigned_pattern = [
			Dance
			verse
			a
		]
		red_assigned_pattern = [
			Dance
			Fill
			a
		]
		yellow_assigned_pattern = [
			Dance
			Chorus
			b
		]
		blue_assigned_pattern = [
			Dance
			Fill
			b
		]
		orange_assigned_pattern = [
			Dance
			Breakdown
			c
		]
	}
	{
		name_text = qs(0x1c4c06e9)
		bpm = 128
		line6_0 = pop_solo
		line6_1 = pop_rocks
		line6_0_volume = 8
		line6_1_volume = 9
		line6_0_pan = 0
		line6_1_pan = 0
		track_settings = {
			rhythm = {
				line6_routing = line6_1
				Sound = Classic_Electric_Guitar
				volume = 8
				panning = 0
				scales = {
					root = 3
					ScaleIndex = 6
				}
				bend_set = expressive_set
				default_bot = true
			}
			lead = {
				line6_routing = line6_0
				Sound = Classic_Electric_Guitar
				volume = 8
				panning = 0
				scales = {
					root = 3
					ScaleIndex = 6
				}
				bend_set = expressive_set
				default_bot = false
			}
			bass = {
				line6_routing = line6_1
				Sound = Synth_Bass_Saw_1
				volume = 11
				panning = 0
				scales = {
					root = 3
					ScaleIndex = 6
				}
				bend_set = expressive_set
				default_bot = true
			}
			Drum = {
				line6_routing = None
				Sound = electro
				volume = 10
				panning = 0
				scales = {
					root = 3
					ScaleIndex = 6
				}
				bend_set = medium_pitch_bends
				default_bot = true
			}
			melody = {
				line6_routing = line6_1
				Sound = synth_bass_saw_2
				volume = 3
				panning = 0
				scales = {
					root = 3
					ScaleIndex = 6
				}
				bend_set = expressive_set
				default_bot = true
			}
		}
		bot_patterns = [
			{
				pattern = [
					electronic
					verse
					a
				]
				loop = 3
			}
			{
				pattern = [
					electronic
					Fill
					a
				]
				loop = 1
			}
			{
				pattern = [
					electronic
					Chorus
					b
				]
				loop = 3
			}
			{
				pattern = [
					electronic
					Fill
					b
				]
				loop = 1
			}
			{
				pattern = [
					electronic
					verse
					a
				]
				loop = 3
			}
			{
				pattern = [
					electronic
					Fill
					a
				]
				loop = 1
			}
			{
				pattern = [
					electronic
					Chorus
					b
				]
				loop = 3
			}
			{
				pattern = [
					electronic
					Fill
					b
				]
				loop = 1
			}
			{
				pattern = [
					electronic
					Breakdown
					c
				]
				loop = 2
			}
			{
				pattern = [
					electronic
					verse
					a
				]
				loop = 3
			}
			{
				pattern = [
					electronic
					Fill
					a
				]
				loop = 1
			}
			{
				pattern = [
					electronic
					Breakdown
					c
				]
				loop = 2
			}
			{
				pattern = [
					electronic
					Chorus
					b
				]
				loop = 3
			}
			{
				pattern = [
					electronic
					Fill
					b
				]
				loop = 1
			}
			{
				pattern = [
					electronic
					Ending
					d
				]
				loop = 1
			}
		]
		visualizers = [
			JOW_Jam_4P_ElectricTunnel_B
		]
		green_assigned_pattern = [
			electronic
			verse
			a
		]
		red_assigned_pattern = [
			electronic
			Fill
			a
		]
		yellow_assigned_pattern = [
			electronic
			Chorus
			b
		]
		blue_assigned_pattern = [
			electronic
			Fill
			b
		]
		orange_assigned_pattern = [
			electronic
			Breakdown
			c
		]
	}
	{
		name_text = qs(0xe2defefe)
		bpm = 160
		line6_0 = space_dirt
		line6_1 = synth_drive
		line6_0_volume = 8
		line6_1_volume = 7
		line6_0_pan = -1
		line6_1_pan = 0
		track_settings = {
			rhythm = {
				line6_routing = line6_1
				Sound = Classic_Electric_Guitar
				volume = 11
				panning = 0
				scales = {
					root = 5
					ScaleIndex = 0
				}
				bend_set = sweeps
				default_bot = true
			}
			lead = {
				line6_routing = line6_0
				Sound = Classic_Electric_Guitar
				volume = 9
				panning = -1
				scales = {
					root = 5
					ScaleIndex = 0
				}
				bend_set = sweeps
				default_bot = false
			}
			bass = {
				line6_routing = None
				Sound = video_game_bass
				volume = 3
				panning = 0
				scales = {
					root = 5
					ScaleIndex = 0
				}
				bend_set = sweeps
				default_bot = true
			}
			Drum = {
				line6_routing = None
				Sound = noise
				volume = 8
				panning = 0
				scales = {
					root = 5
					ScaleIndex = 0
				}
				bend_set = medium_pitch_bends
				default_bot = true
			}
			melody = {
				line6_routing = None
				Sound = video_game_pulse_2
				volume = 9
				panning = 1
				scales = {
					root = 5
					ScaleIndex = 0
				}
				bend_set = sweeps
				default_bot = true
			}
		}
		bot_patterns = [
			{
				pattern = [
					other
					verse
					a
				]
				loop = 3
			}
			{
				pattern = [
					other
					Fill
					a
				]
				loop = 1
			}
			{
				pattern = [
					other
					Chorus
					b
				]
				loop = 1
			}
			{
				pattern = [
					other
					Fill
					b
				]
				loop = 1
			}
			{
				pattern = [
					other
					verse
					a
				]
				loop = 1
			}
			{
				pattern = [
					other
					Fill
					a
				]
				loop = 1
			}
			{
				pattern = [
					other
					Chorus
					b
				]
				loop = 1
			}
			{
				pattern = [
					other
					Fill
					b
				]
				loop = 1
			}
			{
				pattern = [
					other
					Breakdown
					c
				]
				loop = 2
			}
			{
				pattern = [
					other
					verse
					a
				]
				loop = 1
			}
			{
				pattern = [
					other
					Fill
					a
				]
				loop = 1
			}
			{
				pattern = [
					other
					Chorus
					b
				]
				loop = 1
			}
			{
				pattern = [
					other
					Fill
					b
				]
				loop = 1
			}
			{
				pattern = [
					other
					Breakdown
					c
				]
				loop = 2
			}
			{
				pattern = [
					other
					Ending
					d
				]
				loop = 1
			}
		]
		visualizers = [
			JOW_Jam_4P_ChipLines
		]
		green_assigned_pattern = [
			other
			verse
			a
		]
		red_assigned_pattern = [
			other
			Fill
			a
		]
		yellow_assigned_pattern = [
			other
			Chorus
			b
		]
		blue_assigned_pattern = [
			other
			Fill
			b
		]
		orange_assigned_pattern = [
			other
			Breakdown
			c
		]
	}
	{
		name_text = qs(0xb6b31dc9)
		bpm = 160
		line6_0 = pop_delay
		line6_1 = pop_rocks
		line6_0_volume = 8
		line6_1_volume = 8
		line6_0_pan = -1
		line6_1_pan = 0
		track_settings = {
			rhythm = {
				line6_routing = line6_1
				Sound = Modern_Electric_Guitar
				volume = 8
				panning = 0
				scales = {
					root = 0
					ScaleIndex = 0
				}
				bend_set = expressive_set
				default_bot = false
			}
			lead = {
				line6_routing = line6_0
				Sound = Modern_Electric_Guitar
				volume = 8
				panning = 0
				scales = {
					root = 0
					ScaleIndex = 0
				}
				bend_set = expressive_set
				default_bot = false
			}
			bass = {
				line6_routing = None
				Sound = Fingered_Bass
				volume = 8
				panning = 0
				scales = {
					root = 0
					ScaleIndex = 0
				}
				bend_set = expressive_set
				default_bot = false
			}
			Drum = {
				line6_routing = None
				Sound = standardrock
				volume = 8
				panning = 0
				scales = {
					root = 0
					ScaleIndex = 0
				}
				bend_set = medium_pitch_bends
				default_bot = false
			}
			melody = {
				line6_routing = None
				Sound = Piano
				volume = 8
				panning = 1
				scales = {
					root = 0
					ScaleIndex = 0
				}
				bend_set = expressive_set
				default_bot = false
			}
		}
		green_assigned_pattern = [
			Pop_Rock
			verse
			a
		]
		red_assigned_pattern = [
			Pop_Rock
			Fill
			a
		]
		yellow_assigned_pattern = [
			Pop_Rock
			Chorus
			b
		]
		blue_assigned_pattern = [
			Pop_Rock
			Fill
			b
		]
		orange_assigned_pattern = [
			Pop_Rock
			Breakdown
			c
		]
	}
	{
		name_text = qs(0x0f948abc)
		bpm = 80
		line6_0 = pop_delay
		line6_1 = pop_rocks
		line6_0_volume = 8
		line6_1_volume = 8
		line6_0_pan = -1
		line6_1_pan = 0
		track_settings = {
			rhythm = {
				line6_routing = line6_1
				Sound = Modern_Electric_Guitar
				volume = 8
				panning = 0
				scales = {
					root = 0
					ScaleIndex = 0
				}
				bend_set = expressive_set
				default_bot = false
			}
			lead = {
				line6_routing = line6_0
				Sound = Modern_Electric_Guitar
				volume = 8
				panning = 0
				scales = {
					root = 0
					ScaleIndex = 0
				}
				bend_set = expressive_set
				default_bot = false
			}
			bass = {
				line6_routing = None
				Sound = Fingered_Bass
				volume = 8
				panning = 0
				scales = {
					root = 0
					ScaleIndex = 0
				}
				bend_set = expressive_set
				default_bot = false
			}
			Drum = {
				line6_routing = None
				Sound = standardrock
				volume = 8
				panning = 0
				scales = {
					root = 0
					ScaleIndex = 0
				}
				bend_set = medium_pitch_bends
				default_bot = false
			}
			melody = {
				line6_routing = None
				Sound = Piano
				volume = 8
				panning = 1
				scales = {
					root = 0
					ScaleIndex = 0
				}
				bend_set = expressive_set
				default_bot = false
			}
		}
		green_assigned_pattern = [
			Pop_Rock
			verse
			a
		]
		red_assigned_pattern = [
			Pop_Rock
			Fill
			a
		]
		yellow_assigned_pattern = [
			Pop_Rock
			Chorus
			b
		]
		blue_assigned_pattern = [
			Pop_Rock
			Fill
			b
		]
		orange_assigned_pattern = [
			Pop_Rock
			Breakdown
			c
		]
	}
	{
		name_text = qs(0x4835db20)
		bpm = 120
		line6_0 = pop_delay
		line6_1 = pop_rocks
		line6_0_volume = 8
		line6_1_volume = 8
		line6_0_pan = -1
		line6_1_pan = 0
		track_settings = {
			rhythm = {
				line6_routing = line6_1
				Sound = Modern_Electric_Guitar
				volume = 8
				panning = 0
				scales = {
					root = 0
					ScaleIndex = 0
				}
				bend_set = expressive_set
				default_bot = false
			}
			lead = {
				line6_routing = line6_0
				Sound = Modern_Electric_Guitar
				volume = 8
				panning = 0
				scales = {
					root = 0
					ScaleIndex = 0
				}
				bend_set = expressive_set
				default_bot = false
			}
			bass = {
				line6_routing = None
				Sound = Fingered_Bass
				volume = 8
				panning = 0
				scales = {
					root = 0
					ScaleIndex = 0
				}
				bend_set = expressive_set
				default_bot = false
			}
			Drum = {
				line6_routing = None
				Sound = standardrock
				volume = 8
				panning = 0
				scales = {
					root = 0
					ScaleIndex = 0
				}
				bend_set = medium_pitch_bends
				default_bot = false
			}
			melody = {
				line6_routing = None
				Sound = Piano
				volume = 8
				panning = 1
				scales = {
					root = 0
					ScaleIndex = 0
				}
				bend_set = expressive_set
				default_bot = false
			}
		}
		green_assigned_pattern = [
			Pop_Rock
			verse
			a
		]
		red_assigned_pattern = [
			Pop_Rock
			Fill
			a
		]
		yellow_assigned_pattern = [
			Pop_Rock
			Chorus
			b
		]
		blue_assigned_pattern = [
			Pop_Rock
			Fill
			b
		]
		orange_assigned_pattern = [
			Pop_Rock
			Breakdown
			c
		]
	}
]
musicstudio_ambience_style_settings = {
	bpm = 120
	line6_0 = pop_delay
	line6_1 = pop_rocks
	line6_0_volume = 10
	line6_1_volume = 10
	bend_set = medium_pitch_bends
	track_settings = {
		rhythm = {
			line6_routing = line6_1
			Sound = Classic_Electric_Guitar
			volume = 10
			panning = 0
			scales = {
				root = 0
				ScaleIndex = 0
			}
			bend_set = medium_pitch_bends
		}
		lead = {
			line6_routing = line6_0
			Sound = Modern_Electric_Guitar
			volume = 10
			panning = 0
			scales = {
				root = 0
				ScaleIndex = 0
			}
			bend_set = medium_pitch_bends
		}
		bass = {
			line6_routing = None
			Sound = Fingered_Bass
			volume = 2
			panning = 0
			scales = {
				root = 0
				ScaleIndex = 0
			}
			bend_set = medium_pitch_bends
		}
		Drum = {
			line6_routing = None
			Sound = heavyrock
			volume = 2
			panning = 0
			scales = {
				root = 0
				ScaleIndex = 0
			}
			bend_set = medium_pitch_bends
		}
		melody = {
			line6_routing = line6_0
			Sound = Vibraphone
			volume = 6
			panning = 0
			scales = {
				root = 0
				ScaleIndex = 2
			}
			bend_set = medium_pitch_bends
		}
	}
	visualizers = [
		OG_Jam_4Player_ColorHorizon
		OG_Enerdonut_E
	]
}
