jam_wizard_styles_default_test_pattern = [
	pop_rock
	breakdown
	c
]
jam_wizard_styles_default_visualizer = [
	jow_jam_4p_diamondstar
	jow_jam_4p_rainbowroad
	jow_jam_4p_anarchy
	jow_jam_4p_skulllightning
	jow_jam_4p_musicstaff
	jow_jam_4p_electrictunnel
	jow_jam_4p_pinktunnel
	jow_jam_4p_electrictunnel_b
	jow_jam_4p_chiplines
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
			Sound = pop_rocks
			Volume = 8
			panning = 0
			scales = {
				root = 0
				scaleindex = 0
			}
			bend_set = expressive_set
			default_bot = FALSE
		}
		lead = {
			line6_routing = line6_0
			Sound = pop_delay
			Volume = 8
			panning = 0
			scales = {
				root = 0
				scaleindex = 0
			}
			bend_set = expressive_set
			default_bot = FALSE
		}
		bass = {
			line6_routing = None
			Sound = fingered_bass
			Volume = 8
			panning = 0
			scales = {
				root = 0
				scaleindex = 0
			}
			bend_set = expressive_set
			default_bot = FALSE
		}
		drum = {
			line6_routing = None
			Sound = standardrock
			Volume = 8
			panning = 0
			scales = {
				root = 0
				scaleindex = 0
			}
			bend_set = medium_pitch_bends
			default_bot = FALSE
		}
		melody = {
			line6_routing = None
			Sound = rock_organ
			Volume = 8
			panning = 0
			scales = {
				root = 0
				scaleindex = 0
			}
			bend_set = expressive_set
			default_bot = FALSE
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
				Sound = pop_rocks
				Volume = 8
				panning = 0
				scales = {
					root = 0
					scaleindex = 0
				}
				bend_set = expressive_set
				default_bot = true
			}
			lead = {
				line6_routing = line6_0
				Sound = pop_delay
				Volume = 8
				panning = 0
				scales = {
					root = 0
					scaleindex = 0
				}
				bend_set = expressive_set
				default_bot = FALSE
			}
			bass = {
				line6_routing = None
				Sound = fingered_bass
				Volume = 7
				panning = 0
				scales = {
					root = 0
					scaleindex = 0
				}
				bend_set = expressive_set
				default_bot = true
			}
			drum = {
				line6_routing = None
				Sound = standardrock
				Volume = 9
				panning = 0
				scales = {
					root = 0
					scaleindex = 0
				}
				bend_set = medium_pitch_bends
				default_bot = true
			}
			melody = {
				line6_routing = None
				Sound = rock_organ
				Volume = 8
				panning = 1
				scales = {
					root = 0
					scaleindex = 0
				}
				bend_set = expressive_set
				default_bot = FALSE
			}
		}
		bot_patterns = [
			{
				pattern = [
					pop_rock
					verse
					a
				]
				Loop = 3
			}
			{
				pattern = [
					pop_rock
					fill
					a
				]
				Loop = 1
			}
			{
				pattern = [
					pop_rock
					chorus
					b
				]
				Loop = 3
			}
			{
				pattern = [
					pop_rock
					fill
					b
				]
				Loop = 1
			}
			{
				pattern = [
					pop_rock
					verse
					a
				]
				Loop = 1
			}
			{
				pattern = [
					pop_rock
					fill
					a
				]
				Loop = 1
			}
			{
				pattern = [
					pop_rock
					chorus
					b
				]
				Loop = 3
			}
			{
				pattern = [
					pop_rock
					fill
					b
				]
				Loop = 1
			}
			{
				pattern = [
					pop_rock
					breakdown
					c
				]
				Loop = 4
			}
			{
				pattern = [
					pop_rock
					chorus
					b
				]
				Loop = 3
			}
			{
				pattern = [
					pop_rock
					fill
					b
				]
				Loop = 1
			}
			{
				pattern = [
					pop_rock
					breakdown
					c
				]
				Loop = 4
			}
			{
				pattern = [
					pop_rock
					ending
					d
				]
				Loop = 1
			}
		]
		visualizers = [
			jow_jam_4p_diamondstar
		]
		green_assigned_pattern = [
			pop_rock
			verse
			a
		]
		red_assigned_pattern = [
			pop_rock
			fill
			a
		]
		yellow_assigned_pattern = [
			pop_rock
			chorus
			b
		]
		blue_assigned_pattern = [
			pop_rock
			fill
			b
		]
		orange_assigned_pattern = [
			pop_rock
			breakdown
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
				Sound = funky_flange
				Volume = 8
				panning = 0
				scales = {
					root = 7
					scaleindex = 2
				}
				bend_set = expressive_set
				default_bot = true
			}
			lead = {
				line6_routing = line6_0
				Sound = alt_rocker
				Volume = 8
				panning = 2
				scales = {
					root = 7
					scaleindex = 2
				}
				bend_set = expressive_set
				default_bot = FALSE
			}
			bass = {
				line6_routing = None
				Sound = fingered_bass
				Volume = 7
				panning = 0
				scales = {
					root = 7
					scaleindex = 2
				}
				bend_set = expressive_set
				default_bot = true
			}
			drum = {
				line6_routing = None
				Sound = classicrock
				Volume = 9
				panning = 0
				scales = {
					root = 7
					scaleindex = 2
				}
				bend_set = medium_pitch_bends
				default_bot = true
			}
			melody = {
				line6_routing = None
				Sound = synth_lead_triangle
				Volume = 8
				panning = 1
				scales = {
					root = 7
					scaleindex = 2
				}
				bend_set = expressive_set
				default_bot = true
			}
		}
		bot_patterns = [
			{
				pattern = [
					classic_rock
					verse
					a
				]
				Loop = 3
			}
			{
				pattern = [
					classic_rock
					fill
					a
				]
				Loop = 1
			}
			{
				pattern = [
					classic_rock
					chorus
					b
				]
				Loop = 1
			}
			{
				pattern = [
					classic_rock
					fill
					b
				]
				Loop = 1
			}
			{
				pattern = [
					classic_rock
					verse
					a
				]
				Loop = 1
			}
			{
				pattern = [
					classic_rock
					fill
					a
				]
				Loop = 1
			}
			{
				pattern = [
					classic_rock
					chorus
					b
				]
				Loop = 3
			}
			{
				pattern = [
					classic_rock
					fill
					b
				]
				Loop = 1
			}
			{
				pattern = [
					classic_rock
					breakdown
					c
				]
				Loop = 4
			}
			{
				pattern = [
					classic_rock
					chorus
					b
				]
				Loop = 3
			}
			{
				pattern = [
					classic_rock
					fill
					b
				]
				Loop = 1
			}
			{
				pattern = [
					classic_rock
					ending
					d
				]
				Loop = 1
			}
		]
		visualizers = [
			jow_jam_4p_rainbowroad
		]
		green_assigned_pattern = [
			classic_rock
			verse
			a
		]
		red_assigned_pattern = [
			classic_rock
			fill
			a
		]
		yellow_assigned_pattern = [
			classic_rock
			chorus
			b
		]
		blue_assigned_pattern = [
			classic_rock
			fill
			b
		]
		orange_assigned_pattern = [
			classic_rock
			breakdown
			c
		]
	}
	{
		name_text = qs(0xf5288ef2)
		bpm = 83
		line6_0 = classic_solo
		line6_1 = classic_rock
		line6_0_volume = 9
		line6_1_volume = 8
		line6_0_pan = -1
		line6_1_pan = 0
		track_settings = {
			rhythm = {
				line6_routing = line6_1
				Sound = classic_rock
				Volume = 10
				panning = 0
				scales = {
					root = 5
					scaleindex = 4
				}
				bend_set = expressive_set
				default_bot = true
			}
			lead = {
				line6_routing = line6_0
				Sound = classic_solo
				Volume = 8
				panning = 0
				scales = {
					root = 5
					scaleindex = 4
				}
				bend_set = expressive_set
				default_bot = FALSE
			}
			bass = {
				line6_routing = None
				Sound = picked_bass
				Volume = 5
				panning = 0
				scales = {
					root = 5
					scaleindex = 4
				}
				bend_set = expressive_set
				default_bot = true
			}
			drum = {
				line6_routing = None
				Sound = bigroomrock
				Volume = 9
				panning = 0
				scales = {
					root = 5
					scaleindex = 4
				}
				bend_set = medium_pitch_bends
				default_bot = true
			}
			melody = {
				line6_routing = None
				Sound = dirty_organ
				Volume = 7
				panning = -1
				scales = {
					root = 5
					scaleindex = 4
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
				Loop = 1
			}
			{
				pattern = [
					rock
					fill
					a
				]
				Loop = 1
			}
			{
				pattern = [
					rock
					chorus
					b
				]
				Loop = 1
			}
			{
				pattern = [
					rock
					fill
					b
				]
				Loop = 1
			}
			{
				pattern = [
					rock
					verse
					a
				]
				Loop = 1
			}
			{
				pattern = [
					rock
					fill
					a
				]
				Loop = 1
			}
			{
				pattern = [
					rock
					chorus
					b
				]
				Loop = 1
			}
			{
				pattern = [
					rock
					fill
					b
				]
				Loop = 1
			}
			{
				pattern = [
					rock
					breakdown
					c
				]
				Loop = 4
			}
			{
				pattern = [
					rock
					chorus
					b
				]
				Loop = 1
			}
			{
				pattern = [
					rock
					fill
					b
				]
				Loop = 1
			}
			{
				pattern = [
					rock
					verse
					a
				]
				Loop = 1
			}
			{
				pattern = [
					rock
					fill
					a
				]
				Loop = 1
			}
			{
				pattern = [
					rock
					chorus
					b
				]
				Loop = 1
			}
			{
				pattern = [
					rock
					fill
					b
				]
				Loop = 1
			}
			{
				pattern = [
					rock
					ending
					d
				]
				Loop = 1
			}
		]
		visualizers = [
			jow_jam_4p_rainbowroad
		]
		green_assigned_pattern = [
			rock
			verse
			a
		]
		red_assigned_pattern = [
			rock
			fill
			a
		]
		yellow_assigned_pattern = [
			rock
			chorus
			b
		]
		blue_assigned_pattern = [
			rock
			fill
			b
		]
		orange_assigned_pattern = [
			rock
			breakdown
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
				Sound = blues_chorus
				Volume = 8
				panning = 0
				scales = {
					root = 5
					scaleindex = 0
				}
				bend_set = expressive_set
				default_bot = true
			}
			lead = {
				line6_routing = line6_0
				Sound = alt_rocker
				Volume = 8
				panning = -1
				scales = {
					root = 5
					scaleindex = 0
				}
				bend_set = expressive_set
				default_bot = FALSE
			}
			bass = {
				line6_routing = None
				Sound = fingered_bass
				Volume = 5
				panning = 0
				scales = {
					root = 5
					scaleindex = 0
				}
				bend_set = expressive_set
				default_bot = true
			}
			drum = {
				line6_routing = None
				Sound = modernrock
				Volume = 10
				panning = 0
				scales = {
					root = 5
					scaleindex = 0
				}
				bend_set = medium_pitch_bends
				default_bot = true
			}
			melody = {
				line6_routing = None
				Sound = sine_lead
				Volume = 1
				panning = 1
				scales = {
					root = 5
					scaleindex = 0
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
				Loop = 1
			}
			{
				pattern = [
					alternative
					fill
					a
				]
				Loop = 1
			}
			{
				pattern = [
					alternative
					chorus
					b
				]
				Loop = 1
			}
			{
				pattern = [
					alternative
					fill
					b
				]
				Loop = 1
			}
			{
				pattern = [
					alternative
					verse
					a
				]
				Loop = 1
			}
			{
				pattern = [
					alternative
					fill
					a
				]
				Loop = 1
			}
			{
				pattern = [
					alternative
					chorus
					b
				]
				Loop = 1
			}
			{
				pattern = [
					alternative
					fill
					b
				]
				Loop = 1
			}
			{
				pattern = [
					alternative
					bridge
					c
				]
				Loop = 2
			}
			{
				pattern = [
					alternative
					chorus
					b
				]
				Loop = 1
			}
			{
				pattern = [
					alternative
					fill
					b
				]
				Loop = 1
			}
			{
				pattern = [
					alternative
					ending
					d
				]
				Loop = 1
			}
		]
		visualizers = [
			jow_jam_4p_diamondstar
		]
		green_assigned_pattern = [
			alternative
			verse
			a
		]
		red_assigned_pattern = [
			alternative
			fill
			a
		]
		yellow_assigned_pattern = [
			alternative
			chorus
			b
		]
		blue_assigned_pattern = [
			alternative
			fill
			b
		]
		orange_assigned_pattern = [
			alternative
			bridge
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
				Sound = heavy_drive
				Volume = 10
				panning = 1
				scales = {
					root = 11
					scaleindex = 0
				}
				bend_set = expressive_set
				default_bot = true
			}
			lead = {
				line6_routing = line6_0
				Sound = punk_jam
				Volume = 10
				panning = -1
				scales = {
					root = 11
					scaleindex = 0
				}
				bend_set = expressive_set
				default_bot = FALSE
			}
			bass = {
				line6_routing = None
				Sound = picked_bass
				Volume = 6
				panning = 0
				scales = {
					root = 11
					scaleindex = 0
				}
				bend_set = expressive_set
				default_bot = true
			}
			drum = {
				line6_routing = None
				Sound = standardrock
				Volume = 7
				panning = 0
				scales = {
					root = 11
					scaleindex = 0
				}
				bend_set = medium_pitch_bends
				default_bot = true
			}
			melody = {
				line6_routing = None
				Sound = dirty_organ
				Volume = 6
				panning = 1
				scales = {
					root = 11
					scaleindex = 0
				}
				bend_set = expressive_set
				default_bot = true
			}
		}
		bot_patterns = [
			{
				pattern = [
					punk
					verse
					a
				]
				Loop = 1
			}
			{
				pattern = [
					punk
					fill
					a
				]
				Loop = 1
			}
			{
				pattern = [
					punk
					chorus
					b
				]
				Loop = 3
			}
			{
				pattern = [
					punk
					fill
					b
				]
				Loop = 1
			}
			{
				pattern = [
					punk
					verse
					a
				]
				Loop = 1
			}
			{
				pattern = [
					punk
					fill
					a
				]
				Loop = 1
			}
			{
				pattern = [
					punk
					chorus
					b
				]
				Loop = 3
			}
			{
				pattern = [
					punk
					fill
					b
				]
				Loop = 1
			}
			{
				pattern = [
					punk
					breakdown
					c
				]
				Loop = 4
			}
			{
				pattern = [
					punk
					chorus
					b
				]
				Loop = 3
			}
			{
				pattern = [
					punk
					fill
					b
				]
				Loop = 1
			}
			{
				pattern = [
					punk
					verse
					a
				]
				Loop = 1
			}
			{
				pattern = [
					punk
					fill
					a
				]
				Loop = 1
			}
			{
				pattern = [
					punk
					chorus
					b
				]
				Loop = 3
			}
			{
				pattern = [
					punk
					fill
					b
				]
				Loop = 1
			}
			{
				pattern = [
					punk
					ending
					d
				]
				Loop = 1
			}
		]
		visualizers = [
			jow_jam_4p_anarchy
		]
		green_assigned_pattern = [
			punk
			verse
			a
		]
		red_assigned_pattern = [
			punk
			fill
			a
		]
		yellow_assigned_pattern = [
			punk
			chorus
			b
		]
		blue_assigned_pattern = [
			punk
			fill
			b
		]
		orange_assigned_pattern = [
			punk
			breakdown
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
				Sound = heavy_drive
				Volume = 9
				panning = 0
				scales = {
					root = 5
					scaleindex = 3
				}
				bend_set = expressive_set
				default_bot = true
			}
			lead = {
				line6_routing = line6_0
				Sound = hot_rocker
				Volume = 9
				panning = 1
				scales = {
					root = 5
					scaleindex = 3
				}
				bend_set = expressive_set
				default_bot = FALSE
			}
			bass = {
				line6_routing = None
				Sound = picked_bass
				Volume = 6
				panning = 0
				scales = {
					root = 5
					scaleindex = 3
				}
				bend_set = expressive_set
				default_bot = true
			}
			drum = {
				line6_routing = None
				Sound = heavyrock
				Volume = 7
				panning = 0
				scales = {
					root = 5
					scaleindex = 3
				}
				bend_set = medium_pitch_bends
				default_bot = true
			}
			melody = {
				line6_routing = None
				Sound = rock_organ
				Volume = 6
				panning = -1
				scales = {
					root = 5
					scaleindex = 3
				}
				bend_set = expressive_set
				default_bot = true
			}
		}
		bot_patterns = [
			{
				pattern = [
					hard_rock
					verse
					a
				]
				Loop = 3
			}
			{
				pattern = [
					hard_rock
					fill
					a
				]
				Loop = 1
			}
			{
				pattern = [
					hard_rock
					chorus
					b
				]
				Loop = 1
			}
			{
				pattern = [
					hard_rock
					fill
					b
				]
				Loop = 1
			}
			{
				pattern = [
					hard_rock
					verse
					a
				]
				Loop = 3
			}
			{
				pattern = [
					hard_rock
					fill
					a
				]
				Loop = 1
			}
			{
				pattern = [
					hard_rock
					chorus
					b
				]
				Loop = 3
			}
			{
				pattern = [
					hard_rock
					fill
					b
				]
				Loop = 1
			}
			{
				pattern = [
					hard_rock
					breakdown
					c
				]
				Loop = 4
			}
			{
				pattern = [
					hard_rock
					verse
					a
				]
				Loop = 3
			}
			{
				pattern = [
					hard_rock
					fill
					a
				]
				Loop = 1
			}
			{
				pattern = [
					hard_rock
					chorus
					b
				]
				Loop = 3
			}
			{
				pattern = [
					hard_rock
					fill
					b
				]
				Loop = 1
			}
			{
				pattern = [
					hard_rock
					ending
					d
				]
				Loop = 1
			}
		]
		visualizers = [
			jow_jam_4p_diamondstar
		]
		green_assigned_pattern = [
			hard_rock
			verse
			a
		]
		red_assigned_pattern = [
			hard_rock
			fill
			a
		]
		yellow_assigned_pattern = [
			hard_rock
			chorus
			b
		]
		blue_assigned_pattern = [
			hard_rock
			fill
			b
		]
		orange_assigned_pattern = [
			hard_rock
			breakdown
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
				Sound = heavy_drive
				Volume = 10
				panning = 0
				scales = {
					root = 0
					scaleindex = 5
				}
				bend_set = expressive_set
				default_bot = true
			}
			lead = {
				line6_routing = line6_0
				Sound = metal_swirl
				Volume = 9
				panning = 2
				scales = {
					root = 0
					scaleindex = 5
				}
				bend_set = expressive_set
				default_bot = FALSE
			}
			bass = {
				line6_routing = None
				Sound = picked_bass
				Volume = 5
				panning = 0
				scales = {
					root = 0
					scaleindex = 5
				}
				bend_set = expressive_set
				default_bot = true
			}
			drum = {
				line6_routing = None
				Sound = metal
				Volume = 7
				panning = 0
				scales = {
					root = 0
					scaleindex = 5
				}
				bend_set = medium_pitch_bends
				default_bot = true
			}
			melody = {
				line6_routing = None
				Sound = fat_synth
				Volume = 7
				panning = -1
				scales = {
					root = 0
					scaleindex = 5
				}
				bend_set = expressive_set
				default_bot = true
			}
		}
		bot_patterns = [
			{
				pattern = [
					metal
					verse
					a
				]
				Loop = 3
			}
			{
				pattern = [
					metal
					fill
					a
				]
				Loop = 1
			}
			{
				pattern = [
					metal
					chorus
					b
				]
				Loop = 3
			}
			{
				pattern = [
					metal
					fill
					b
				]
				Loop = 1
			}
			{
				pattern = [
					metal
					breakdown
					c
				]
				Loop = 2
			}
			{
				pattern = [
					metal
					verse
					a
				]
				Loop = 3
			}
			{
				pattern = [
					metal
					fill
					a
				]
				Loop = 1
			}
			{
				pattern = [
					metal
					chorus
					b
				]
				Loop = 3
			}
			{
				pattern = [
					metal
					fill
					b
				]
				Loop = 1
			}
			{
				pattern = [
					metal
					breakdown
					c
				]
				Loop = 2
			}
			{
				pattern = [
					metal
					chorus
					b
				]
				Loop = 3
			}
			{
				pattern = [
					metal
					fill
					b
				]
				Loop = 1
			}
			{
				pattern = [
					metal
					breakdown
					c
				]
				Loop = 2
			}
			{
				pattern = [
					metal
					chorus
					b
				]
				Loop = 3
			}
			{
				pattern = [
					metal
					fill
					b
				]
				Loop = 1
			}
			{
				pattern = [
					metal
					ending
					d
				]
				Loop = 1
			}
		]
		visualizers = [
			jow_jam_4p_skulllightning
		]
		green_assigned_pattern = [
			metal
			verse
			a
		]
		red_assigned_pattern = [
			metal
			fill
			a
		]
		yellow_assigned_pattern = [
			metal
			chorus
			b
		]
		blue_assigned_pattern = [
			metal
			fill
			b
		]
		orange_assigned_pattern = [
			metal
			breakdown
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
				Sound = blues_chorus
				Volume = 8
				panning = 0
				scales = {
					root = 9
					scaleindex = 3
				}
				bend_set = expressive_set
				default_bot = true
			}
			lead = {
				line6_routing = line6_0
				Sound = funky_chorus
				Volume = 8
				panning = -1
				scales = {
					root = 9
					scaleindex = 3
				}
				bend_set = expressive_set
				default_bot = FALSE
			}
			bass = {
				line6_routing = None
				Sound = picked_bass
				Volume = 5
				panning = 0
				scales = {
					root = 9
					scaleindex = 3
				}
				bend_set = expressive_set
				default_bot = true
			}
			drum = {
				line6_routing = None
				Sound = modernrock
				Volume = 8
				panning = 0
				scales = {
					root = 9
					scaleindex = 3
				}
				bend_set = medium_pitch_bends
				default_bot = true
			}
			melody = {
				line6_routing = None
				Sound = rezo_clav
				Volume = 7
				panning = 1
				scales = {
					root = 9
					scaleindex = 3
				}
				bend_set = expressive_set
				default_bot = true
			}
		}
		bot_patterns = [
			{
				pattern = [
					funk
					verse
					a
				]
				Loop = 3
			}
			{
				pattern = [
					funk
					fill
					a
				]
				Loop = 1
			}
			{
				pattern = [
					funk
					chorus
					b
				]
				Loop = 1
			}
			{
				pattern = [
					funk
					fill
					b
				]
				Loop = 1
			}
			{
				pattern = [
					funk
					verse
					a
				]
				Loop = 1
			}
			{
				pattern = [
					funk
					fill
					a
				]
				Loop = 1
			}
			{
				pattern = [
					funk
					chorus
					b
				]
				Loop = 1
			}
			{
				pattern = [
					funk
					fill
					b
				]
				Loop = 1
			}
			{
				pattern = [
					funk
					breakdown
					c
				]
				Loop = 4
			}
			{
				pattern = [
					funk
					verse
					a
				]
				Loop = 1
			}
			{
				pattern = [
					funk
					fill
					a
				]
				Loop = 1
			}
			{
				pattern = [
					funk
					chorus
					b
				]
				Loop = 1
			}
			{
				pattern = [
					funk
					fill
					b
				]
				Loop = 1
			}
			{
				pattern = [
					funk
					chorus
					b
				]
				Loop = 1
			}
			{
				pattern = [
					funk
					fill
					b
				]
				Loop = 1
			}
			{
				pattern = [
					funk
					ending
					d
				]
				Loop = 1
			}
		]
		visualizers = [
			jow_jam_4p_rainbowroad
		]
		green_assigned_pattern = [
			funk
			verse
			a
		]
		red_assigned_pattern = [
			funk
			fill
			a
		]
		yellow_assigned_pattern = [
			funk
			chorus
			b
		]
		blue_assigned_pattern = [
			funk
			fill
			b
		]
		orange_assigned_pattern = [
			funk
			breakdown
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
				Sound = blues_chorus
				Volume = 8
				panning = 0
				scales = {
					root = 3
					scaleindex = 4
				}
				bend_set = expressive_set
				default_bot = true
			}
			lead = {
				line6_routing = line6_0
				Sound = blues_break
				Volume = 9
				panning = -1
				scales = {
					root = 3
					scaleindex = 4
				}
				bend_set = expressive_set
				default_bot = FALSE
			}
			bass = {
				line6_routing = None
				Sound = fingered_bass
				Volume = 7
				panning = 0
				scales = {
					root = 3
					scaleindex = 4
				}
				bend_set = expressive_set
				default_bot = true
			}
			drum = {
				line6_routing = None
				Sound = standardrock
				Volume = 8
				panning = 0
				scales = {
					root = 3
					scaleindex = 4
				}
				bend_set = medium_pitch_bends
				default_bot = true
			}
			melody = {
				line6_routing = None
				Sound = electric_piano
				Volume = 8
				panning = 1
				scales = {
					root = 3
					scaleindex = 4
				}
				bend_set = expressive_set
				default_bot = true
			}
		}
		bot_patterns = [
			{
				pattern = [
					blues
					verse
					a
				]
				Loop = 1
			}
			{
				pattern = [
					blues
					chorus
					e
				]
				Loop = 1
			}
			{
				pattern = [
					blues
					verse
					b
				]
				Loop = 1
			}
			{
				pattern = [
					blues
					chorus
					e
				]
				Loop = 1
			}
			{
				pattern = [
					blues
					verse
					c
				]
				Loop = 1
			}
			{
				pattern = [
					blues
					chorus
					e
				]
				Loop = 1
			}
			{
				pattern = [
					blues
					verse
					d
				]
				Loop = 1
			}
			{
				pattern = [
					blues
					ending
					f
				]
				Loop = 1
			}
		]
		visualizers = [
			jow_jam_4p_musicstaff
		]
		green_assigned_pattern = [
			blues
			verse
			a
		]
		red_assigned_pattern = [
			blues
			verse
			b
		]
		yellow_assigned_pattern = [
			blues
			verse
			c
		]
		blue_assigned_pattern = [
			blues
			verse
			d
		]
		orange_assigned_pattern = [
			blues
			chorus
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
				Sound = jazz_trem
				Volume = 8
				panning = 0
				scales = {
					root = 8
					scaleindex = 0
				}
				bend_set = expressive_set
				default_bot = true
			}
			lead = {
				line6_routing = line6_0
				Sound = jazz_bounce
				Volume = 8
				panning = 1
				scales = {
					root = 8
					scaleindex = 0
				}
				bend_set = expressive_set
				default_bot = FALSE
			}
			bass = {
				line6_routing = None
				Sound = fingered_bass
				Volume = 6
				panning = 0
				scales = {
					root = 8
					scaleindex = 0
				}
				bend_set = expressive_set
				default_bot = true
			}
			drum = {
				line6_routing = None
				Sound = fusion
				Volume = 8
				panning = 0
				scales = {
					root = 8
					scaleindex = 0
				}
				bend_set = medium_pitch_bends
				default_bot = true
			}
			melody = {
				line6_routing = None
				Sound = electric_piano
				Volume = 7
				panning = -1
				scales = {
					root = 8
					scaleindex = 0
				}
				bend_set = expressive_set
				default_bot = true
			}
		}
		bot_patterns = [
			{
				pattern = [
					jazz
					verse
					a
				]
				Loop = 1
			}
			{
				pattern = [
					jazz
					fill
					a
				]
				Loop = 1
			}
			{
				pattern = [
					jazz
					chorus
					b
				]
				Loop = 1
			}
			{
				pattern = [
					jazz
					fill
					b
				]
				Loop = 1
			}
			{
				pattern = [
					jazz
					verse
					a
				]
				Loop = 1
			}
			{
				pattern = [
					jazz
					fill
					a
				]
				Loop = 1
			}
			{
				pattern = [
					jazz
					chorus
					b
				]
				Loop = 1
			}
			{
				pattern = [
					jazz
					fill
					b
				]
				Loop = 1
			}
			{
				pattern = [
					jazz
					breakdown
					c
				]
				Loop = 4
			}
			{
				pattern = [
					jazz
					verse
					a
				]
				Loop = 1
			}
			{
				pattern = [
					jazz
					fill
					a
				]
				Loop = 1
			}
			{
				pattern = [
					jazz
					breakdown
					c
				]
				Loop = 4
			}
			{
				pattern = [
					jazz
					chorus
					b
				]
				Loop = 1
			}
			{
				pattern = [
					jazz
					fill
					b
				]
				Loop = 1
			}
			{
				pattern = [
					jazz
					chorus
					b
				]
				Loop = 1
			}
			{
				pattern = [
					jazz
					fill
					b
				]
				Loop = 1
			}
			{
				pattern = [
					jazz
					ending
					d
				]
				Loop = 1
			}
		]
		visualizers = [
			jow_jam_4p_musicstaff
		]
		green_assigned_pattern = [
			jazz
			verse
			a
		]
		red_assigned_pattern = [
			jazz
			fill
			a
		]
		yellow_assigned_pattern = [
			jazz
			chorus
			b
		]
		blue_assigned_pattern = [
			jazz
			fill
			b
		]
		orange_assigned_pattern = [
			jazz
			breakdown
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
				Sound = pop_rocks
				Volume = 9
				panning = 1
				scales = {
					root = 0
					scaleindex = 2
				}
				bend_set = expressive_set
				default_bot = true
			}
			lead = {
				line6_routing = line6_0
				Sound = pop_delay
				Volume = 8
				panning = -1
				scales = {
					root = 0
					scaleindex = 2
				}
				bend_set = expressive_set
				default_bot = FALSE
			}
			bass = {
				line6_routing = None
				Sound = picked_bass
				Volume = 6
				panning = 0
				scales = {
					root = 0
					scaleindex = 2
				}
				bend_set = expressive_set
				default_bot = true
			}
			drum = {
				line6_routing = None
				Sound = hiphop
				Volume = 8
				panning = 0
				scales = {
					root = 0
					scaleindex = 2
				}
				bend_set = medium_pitch_bends
				default_bot = true
			}
			melody = {
				line6_routing = line6_1
				Sound = saw_lead_thin
				Volume = 4
				panning = 1
				scales = {
					root = 0
					scaleindex = 2
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
				Loop = 1
			}
			{
				pattern = [
					hip_hop
					fill
					a
				]
				Loop = 1
			}
			{
				pattern = [
					hip_hop
					chorus
					b
				]
				Loop = 1
			}
			{
				pattern = [
					hip_hop
					fill
					b
				]
				Loop = 1
			}
			{
				pattern = [
					hip_hop
					verse
					a
				]
				Loop = 1
			}
			{
				pattern = [
					hip_hop
					fill
					a
				]
				Loop = 1
			}
			{
				pattern = [
					hip_hop
					chorus
					b
				]
				Loop = 1
			}
			{
				pattern = [
					hip_hop
					fill
					b
				]
				Loop = 1
			}
			{
				pattern = [
					hip_hop
					breakdown
					c
				]
				Loop = 2
			}
			{
				pattern = [
					hip_hop
					chorus
					b
				]
				Loop = 1
			}
			{
				pattern = [
					hip_hop
					fill
					b
				]
				Loop = 1
			}
		]
		visualizers = [
			jow_jam_4p_electrictunnel
		]
		green_assigned_pattern = [
			hip_hop
			verse
			a
		]
		red_assigned_pattern = [
			hip_hop
			fill
			a
		]
		yellow_assigned_pattern = [
			hip_hop
			chorus
			b
		]
		blue_assigned_pattern = [
			hip_hop
			fill
			b
		]
		orange_assigned_pattern = [
			hip_hop
			breakdown
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
				Sound = funky_flange
				Volume = 8
				panning = 0
				scales = {
					root = 3
					scaleindex = 2
				}
				bend_set = expressive_set
				default_bot = true
			}
			lead = {
				line6_routing = line6_0
				Sound = pop_delay
				Volume = 8
				panning = 0
				scales = {
					root = 3
					scaleindex = 2
				}
				bend_set = expressive_set
				default_bot = FALSE
			}
			bass = {
				line6_routing = None
				Sound = fingered_bass
				Volume = 5
				panning = 0
				scales = {
					root = 3
					scaleindex = 2
				}
				bend_set = expressive_set
				default_bot = true
			}
			drum = {
				line6_routing = None
				Sound = dance
				Volume = 8
				panning = 0
				scales = {
					root = 3
					scaleindex = 2
				}
				bend_set = medium_pitch_bends
				default_bot = true
			}
			melody = {
				line6_routing = line6_0
				Sound = trance_lead
				Volume = 5
				panning = 0
				scales = {
					root = 3
					scaleindex = 2
				}
				bend_set = expressive_set
				default_bot = true
			}
		}
		bot_patterns = [
			{
				pattern = [
					dance
					verse
					a
				]
				Loop = 1
			}
			{
				pattern = [
					dance
					fill
					a
				]
				Loop = 1
			}
			{
				pattern = [
					dance
					chorus
					b
				]
				Loop = 1
			}
			{
				pattern = [
					dance
					fill
					b
				]
				Loop = 1
			}
			{
				pattern = [
					dance
					verse
					a
				]
				Loop = 1
			}
			{
				pattern = [
					dance
					fill
					a
				]
				Loop = 1
			}
			{
				pattern = [
					dance
					chorus
					b
				]
				Loop = 1
			}
			{
				pattern = [
					dance
					fill
					b
				]
				Loop = 1
			}
			{
				pattern = [
					dance
					breakdown
					c
				]
				Loop = 2
			}
			{
				pattern = [
					dance
					chorus
					b
				]
				Loop = 1
			}
			{
				pattern = [
					dance
					fill
					b
				]
				Loop = 1
			}
			{
				pattern = [
					dance
					breakdown
					c
				]
				Loop = 2
			}
			{
				pattern = [
					dance
					chorus
					b
				]
				Loop = 1
			}
			{
				pattern = [
					dance
					fill
					b
				]
				Loop = 1
			}
			{
				pattern = [
					dance
					ending
					d
				]
				Loop = 1
			}
		]
		visualizers = [
			jow_jam_4p_pinktunnel
		]
		green_assigned_pattern = [
			dance
			verse
			a
		]
		red_assigned_pattern = [
			dance
			fill
			a
		]
		yellow_assigned_pattern = [
			dance
			chorus
			b
		]
		blue_assigned_pattern = [
			dance
			fill
			b
		]
		orange_assigned_pattern = [
			dance
			breakdown
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
				Sound = pop_rocks
				Volume = 8
				panning = 0
				scales = {
					root = 3
					scaleindex = 6
				}
				bend_set = expressive_set
				default_bot = true
			}
			lead = {
				line6_routing = line6_0
				Sound = pop_solo
				Volume = 8
				panning = 0
				scales = {
					root = 3
					scaleindex = 6
				}
				bend_set = expressive_set
				default_bot = FALSE
			}
			bass = {
				line6_routing = line6_1
				Sound = fingered_bass
				Volume = 11
				panning = 0
				scales = {
					root = 3
					scaleindex = 6
				}
				bend_set = expressive_set
				default_bot = true
			}
			drum = {
				line6_routing = None
				Sound = electro
				Volume = 10
				panning = 0
				scales = {
					root = 3
					scaleindex = 6
				}
				bend_set = medium_pitch_bends
				default_bot = true
			}
			melody = {
				line6_routing = line6_1
				Sound = synth_bass_saw_2
				Volume = 3
				panning = 0
				scales = {
					root = 3
					scaleindex = 6
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
				Loop = 3
			}
			{
				pattern = [
					electronic
					fill
					a
				]
				Loop = 1
			}
			{
				pattern = [
					electronic
					chorus
					b
				]
				Loop = 3
			}
			{
				pattern = [
					electronic
					fill
					b
				]
				Loop = 1
			}
			{
				pattern = [
					electronic
					verse
					a
				]
				Loop = 3
			}
			{
				pattern = [
					electronic
					fill
					a
				]
				Loop = 1
			}
			{
				pattern = [
					electronic
					chorus
					b
				]
				Loop = 3
			}
			{
				pattern = [
					electronic
					fill
					b
				]
				Loop = 1
			}
			{
				pattern = [
					electronic
					breakdown
					c
				]
				Loop = 2
			}
			{
				pattern = [
					electronic
					verse
					a
				]
				Loop = 3
			}
			{
				pattern = [
					electronic
					fill
					a
				]
				Loop = 1
			}
			{
				pattern = [
					electronic
					breakdown
					c
				]
				Loop = 2
			}
			{
				pattern = [
					electronic
					chorus
					b
				]
				Loop = 3
			}
			{
				pattern = [
					electronic
					fill
					b
				]
				Loop = 1
			}
			{
				pattern = [
					electronic
					ending
					d
				]
				Loop = 1
			}
		]
		visualizers = [
			jow_jam_4p_electrictunnel_b
		]
		green_assigned_pattern = [
			electronic
			verse
			a
		]
		red_assigned_pattern = [
			electronic
			fill
			a
		]
		yellow_assigned_pattern = [
			electronic
			chorus
			b
		]
		blue_assigned_pattern = [
			electronic
			fill
			b
		]
		orange_assigned_pattern = [
			electronic
			breakdown
			c
		]
	}
	{
		name_text = qs(0xe2defefe)
		bpm = 160
		line6_0 = space_dirt
		line6_1 = swirly_drive
		line6_0_volume = 8
		line6_1_volume = 7
		line6_0_pan = -1
		line6_1_pan = 0
		track_settings = {
			rhythm = {
				line6_routing = line6_1
				Sound = swirly_drive
				Volume = 11
				panning = 0
				scales = {
					root = 5
					scaleindex = 0
				}
				bend_set = sweeps
				default_bot = true
			}
			lead = {
				line6_routing = line6_0
				Sound = space_dirt
				Volume = 9
				panning = -1
				scales = {
					root = 5
					scaleindex = 0
				}
				bend_set = sweeps
				default_bot = FALSE
			}
			bass = {
				line6_routing = None
				Sound = picked_bass
				Volume = 3
				panning = 0
				scales = {
					root = 5
					scaleindex = 0
				}
				bend_set = sweeps
				default_bot = true
			}
			drum = {
				line6_routing = None
				Sound = noise
				Volume = 8
				panning = 0
				scales = {
					root = 5
					scaleindex = 0
				}
				bend_set = medium_pitch_bends
				default_bot = true
			}
			melody = {
				line6_routing = None
				Sound = video_game_pulse_2
				Volume = 9
				panning = 1
				scales = {
					root = 5
					scaleindex = 0
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
				Loop = 3
			}
			{
				pattern = [
					other
					fill
					a
				]
				Loop = 1
			}
			{
				pattern = [
					other
					chorus
					b
				]
				Loop = 1
			}
			{
				pattern = [
					other
					fill
					b
				]
				Loop = 1
			}
			{
				pattern = [
					other
					verse
					a
				]
				Loop = 1
			}
			{
				pattern = [
					other
					fill
					a
				]
				Loop = 1
			}
			{
				pattern = [
					other
					chorus
					b
				]
				Loop = 1
			}
			{
				pattern = [
					other
					fill
					b
				]
				Loop = 1
			}
			{
				pattern = [
					other
					breakdown
					c
				]
				Loop = 2
			}
			{
				pattern = [
					other
					verse
					a
				]
				Loop = 1
			}
			{
				pattern = [
					other
					fill
					a
				]
				Loop = 1
			}
			{
				pattern = [
					other
					chorus
					b
				]
				Loop = 1
			}
			{
				pattern = [
					other
					fill
					b
				]
				Loop = 1
			}
			{
				pattern = [
					other
					breakdown
					c
				]
				Loop = 2
			}
			{
				pattern = [
					other
					ending
					d
				]
				Loop = 1
			}
		]
		visualizers = [
			jow_jam_4p_chiplines
		]
		green_assigned_pattern = [
			other
			verse
			a
		]
		red_assigned_pattern = [
			other
			fill
			a
		]
		yellow_assigned_pattern = [
			other
			chorus
			b
		]
		blue_assigned_pattern = [
			other
			fill
			b
		]
		orange_assigned_pattern = [
			other
			breakdown
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
				Sound = pop_rocks
				Volume = 8
				panning = 0
				scales = {
					root = 0
					scaleindex = 0
				}
				bend_set = expressive_set
				default_bot = FALSE
			}
			lead = {
				line6_routing = line6_0
				Sound = pop_delay
				Volume = 8
				panning = 0
				scales = {
					root = 0
					scaleindex = 0
				}
				bend_set = expressive_set
				default_bot = FALSE
			}
			bass = {
				line6_routing = None
				Sound = fingered_bass
				Volume = 8
				panning = 0
				scales = {
					root = 0
					scaleindex = 0
				}
				bend_set = expressive_set
				default_bot = FALSE
			}
			drum = {
				line6_routing = None
				Sound = standardrock
				Volume = 8
				panning = 0
				scales = {
					root = 0
					scaleindex = 0
				}
				bend_set = medium_pitch_bends
				default_bot = FALSE
			}
			melody = {
				line6_routing = None
				Sound = piano
				Volume = 8
				panning = 1
				scales = {
					root = 0
					scaleindex = 0
				}
				bend_set = expressive_set
				default_bot = FALSE
			}
		}
		green_assigned_pattern = [
			pop_rock
			verse
			a
		]
		red_assigned_pattern = [
			pop_rock
			fill
			a
		]
		yellow_assigned_pattern = [
			pop_rock
			chorus
			b
		]
		blue_assigned_pattern = [
			pop_rock
			fill
			b
		]
		orange_assigned_pattern = [
			pop_rock
			breakdown
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
				Sound = pop_rocks
				Volume = 8
				panning = 0
				scales = {
					root = 0
					scaleindex = 0
				}
				bend_set = expressive_set
				default_bot = FALSE
			}
			lead = {
				line6_routing = line6_0
				Sound = pop_delay
				Volume = 8
				panning = 0
				scales = {
					root = 0
					scaleindex = 0
				}
				bend_set = expressive_set
				default_bot = FALSE
			}
			bass = {
				line6_routing = None
				Sound = fingered_bass
				Volume = 8
				panning = 0
				scales = {
					root = 0
					scaleindex = 0
				}
				bend_set = expressive_set
				default_bot = FALSE
			}
			drum = {
				line6_routing = None
				Sound = standardrock
				Volume = 8
				panning = 0
				scales = {
					root = 0
					scaleindex = 0
				}
				bend_set = medium_pitch_bends
				default_bot = FALSE
			}
			melody = {
				line6_routing = None
				Sound = piano
				Volume = 8
				panning = 1
				scales = {
					root = 0
					scaleindex = 0
				}
				bend_set = expressive_set
				default_bot = FALSE
			}
		}
		green_assigned_pattern = [
			pop_rock
			verse
			a
		]
		red_assigned_pattern = [
			pop_rock
			fill
			a
		]
		yellow_assigned_pattern = [
			pop_rock
			chorus
			b
		]
		blue_assigned_pattern = [
			pop_rock
			fill
			b
		]
		orange_assigned_pattern = [
			pop_rock
			breakdown
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
				Sound = pop_rocks
				Volume = 8
				panning = 0
				scales = {
					root = 0
					scaleindex = 0
				}
				bend_set = expressive_set
				default_bot = FALSE
			}
			lead = {
				line6_routing = line6_0
				Sound = pop_delay
				Volume = 8
				panning = 0
				scales = {
					root = 0
					scaleindex = 0
				}
				bend_set = expressive_set
				default_bot = FALSE
			}
			bass = {
				line6_routing = None
				Sound = fingered_bass
				Volume = 8
				panning = 0
				scales = {
					root = 0
					scaleindex = 0
				}
				bend_set = expressive_set
				default_bot = FALSE
			}
			drum = {
				line6_routing = None
				Sound = standardrock
				Volume = 8
				panning = 0
				scales = {
					root = 0
					scaleindex = 0
				}
				bend_set = medium_pitch_bends
				default_bot = FALSE
			}
			melody = {
				line6_routing = None
				Sound = piano
				Volume = 8
				panning = 1
				scales = {
					root = 0
					scaleindex = 0
				}
				bend_set = expressive_set
				default_bot = FALSE
			}
		}
		green_assigned_pattern = [
			pop_rock
			verse
			a
		]
		red_assigned_pattern = [
			pop_rock
			fill
			a
		]
		yellow_assigned_pattern = [
			pop_rock
			chorus
			b
		]
		blue_assigned_pattern = [
			pop_rock
			fill
			b
		]
		orange_assigned_pattern = [
			pop_rock
			breakdown
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
			Sound = pop_rocks
			Volume = 10
			panning = 0
			scales = {
				root = 0
				scaleindex = 0
			}
			bend_set = medium_pitch_bends
		}
		lead = {
			line6_routing = line6_0
			Sound = pop_delay
			Volume = 10
			panning = 0
			scales = {
				root = 0
				scaleindex = 0
			}
			bend_set = medium_pitch_bends
		}
		bass = {
			line6_routing = None
			Sound = fingered_bass
			Volume = 2
			panning = 0
			scales = {
				root = 0
				scaleindex = 0
			}
			bend_set = medium_pitch_bends
		}
		drum = {
			line6_routing = None
			Sound = heavyrock
			Volume = 2
			panning = 0
			scales = {
				root = 0
				scaleindex = 0
			}
			bend_set = medium_pitch_bends
		}
		melody = {
			line6_routing = line6_0
			Sound = vibraphone
			Volume = 6
			panning = 0
			scales = {
				root = 0
				scaleindex = 2
			}
			bend_set = medium_pitch_bends
		}
	}
	visualizers = [
		og_jam_4player_colorhorizon
		og_enerdonut_e
	]
}
