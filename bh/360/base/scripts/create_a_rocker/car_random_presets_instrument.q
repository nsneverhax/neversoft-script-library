cas_preset_guitars = [
	{
		genre = [
			Pop
			Goth
			Punk
			rock
			`Heavy	Metal`
			`Classic	Rock`
		]
		CAS_Guitar_Body = {
			desc_id = GTR37_ESP_RW
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr37_rw_d`
					material = GTR37_RW_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR37_RW_Paint`
							flags = 4
							Color = Black_1guitar
						}
					]
					layers = [
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_042`
							Color = blue_5
							a = 20
							y_trans = 15
							x_skew = -18
							x_scale = 18
							y_scale = 26
							rot = 1993
							flags = 283
							x_trans = -42
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_026`
							x_trans = -31
							y_trans = 25
							x_scale = 11
							y_scale = 17
							rot = 1603
							flags = 259
							Color = grey_2guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_026`
							x_trans = -36
							y_trans = 12
							x_scale = 11
							y_scale = 17
							rot = 4753
							flags = 259
							Color = grey_2guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_026`
							x_trans = -27
							y_trans = 13
							x_scale = 11
							y_scale = 17
							rot = 1603
							flags = 259
							Color = grey_2guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_026`
							x_trans = -4
							y_trans = 17
							x_scale = 11
							y_scale = 14
							rot = 1603
							flags = 259
							Color = grey_2guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_026`
							x_trans = -31
							y_trans = 2
							x_scale = 7
							y_scale = 10
							rot = 1603
							flags = 259
							Color = grey_2guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_026`
							x_trans = -10
							y_trans = 22
							x_scale = 11
							y_scale = 17
							rot = 1603
							flags = 259
							Color = grey_2guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_026`
							x_trans = -20
							y_trans = 8
							x_scale = 11
							y_scale = 17
							rot = 1603
							flags = 259
							Color = grey_2guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_026`
							x_trans = -7
							y_trans = 7
							x_scale = 6
							y_scale = 10
							rot = 1603
							flags = 259
							Color = grey_2guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_026`
							x_trans = -14
							y_trans = 13
							x_scale = 6
							y_scale = 10
							rot = 1603
							flags = 259
							Color = grey_2guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShapeGradient_001`
							x_trans = -25
							y_trans = -26
							x_scale = 107
							y_scale = 31
							rot = 3103
							flags = 3
							Color = grey_4guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_ESP02
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d2_01`
					material = GTR_Fretboard_02_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD84_ESP_Flagship`
							flags = 36
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR37_Neckhead
			chosen_materials = {
				material1 = grey_3guitar
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed`
					material = GTR37_NHEAD_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/All_Clear`
							flags = 4
						}
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR37_Nekhed_Flat`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = GTR37_PGuard01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr37_pguard01_d`
					material = GTR37_PGuard_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/gtr37_PGuard01_DTL03`
							flags = 4
							Color = blue_4
						}
					]
				}
			]
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR37_Bridge
			chosen_materials = {
				material1 = grey_3guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR37_Knobs01
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR37_Pickup_F
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			Goth
			Punk
			rock
			`Heavy	Metal`
			`Classic	Rock`
		]
		CAS_Guitar_Body = {
			desc_id = GTR32_Body
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr32_body`
					material = GTR32_Horizon_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/gtr32_quilt`
							flags = 4
							Color = green_2guitar
						}
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR32_Binding01`
							flags = 4
						}
					]
					layers = [
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon009`
							a = 30
							x_trans = -2
							x_scale = 25
							y_scale = 54
							rot = 1530
							flags = 259
							y_trans = -13
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon009`
							a = 30
							x_trans = -2
							x_scale = 25
							y_scale = 54
							rot = 1530
							flags = 267
							y_trans = 28
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon009`
							a = 30
							x_trans = -36
							x_scale = 23
							y_scale = 30
							rot = 1320
							flags = 267
							y_trans = 30
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon009`
							a = 30
							y_trans = -19
							x_scale = 23
							y_scale = 30
							rot = 1770
							flags = 259
							x_trans = -36
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon013`
							a = 30
							x_trans = -37
							y_trans = -15
							x_scale = 34
							y_scale = 43
							flags = 267
							rot = 2443
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon013`
							a = 30
							x_trans = -37
							y_trans = 26
							x_scale = 34
							y_scale = 43
							flags = 259
							rot = 703
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon014`
							x_trans = -31
							y_trans = 6
							x_scale = 66
							y_scale = 81
							rot = 6253
							flags = 259
							a = 30
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_022`
							x_trans = -43
							y_trans = 4
							x_scale = 7
							y_scale = 11
							rot = 1603
							flags = 259
							a = 75
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_022`
							a = 40
							y_trans = 4
							x_scale = 13
							y_scale = 17
							rot = 1603
							flags = 259
							x_trans = -43
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_24Fret_ESP01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d1_02`
					material = GTR_Fretboard24_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD105_ESP_UpDots`
							flags = 36
							Color = green_3guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR32_Nekhead01
			chosen_materials = {
				material1 = navy_2
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed`
					material = GTR32_NHED_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR32_Nekhed_Solid`
							flags = 36
							Color = green_1guitar
						}
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR32_Nekhed_DTL02`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR32_Hardware01
			chosen_materials = {
				material1 = navy_2
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_32_KNOBS_A
			chosen_materials = {
				material1 = navy_2
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR31_Pickup_D
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			Goth
			Punk
		]
		CAS_Guitar_Body = {
			desc_id = GTR12_ESP_V_01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr12_esp_v_series_d`
					material = GTR12_ESP_V_01_Primary
					diffuse
					layers = [
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon007`
							Color = Black_1guitar
							x_trans = -16
							y_trans = -1
							x_scale = 44
							y_scale = 60
							rot = 1603
							flags = 267
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon007`
							Color = Black_1guitar
							x_trans = -16
							y_trans = -1
							y_scale = 60
							rot = 1603
							flags = 259
							x_scale = 44
						}
					]
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR12_ESP_V_Series_LD_02`
							flags = 4
							Color = violet_4
						}
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR12_ESP_V_Series_DTL_02`
							flags = 4
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_ESP04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
					material = GTR_Fretboard_04_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD87_ESP_Tribal`
							flags = 36
							Color = violet_4
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR12_Neckhead_07
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_07`
					material = GTR12_Neckhead_07_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR4_Neckhead_07_LD_01`
							flags = 36
							Color = violet_4
						}
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR4_Neckhead7_DTL_03`
							flags = 36
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR12_Bridge_3
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR12_ESP_Knob_01
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR1_ESP_EMG_Pkup_2
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			Goth
			Punk
			`Heavy	Metal`
		]
		CAS_Guitar_Body = {
			desc_id = GTR12_ESP_V_01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr12_esp_v_series_d`
					material = GTR12_ESP_V_01_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR12_ESP_V_Series_LD_02`
							flags = 4
						}
					]
					layers = [
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = orange_3
							x_trans = -50
							x_scale = 4
							y_scale = 45
							rot = 2233
							flags = 259
							y_trans = -28
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = orange_3
							y_trans = -25
							x_scale = 4
							y_scale = 45
							rot = 2233
							flags = 259
							x_trans = -45
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = orange_3
							x_trans = -41
							y_trans = -20
							x_scale = 4
							rot = 2233
							flags = 259
							y_scale = 45
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = orange_3
							y_trans = -17
							x_scale = 4
							y_scale = 51
							rot = 2233
							flags = 259
							x_trans = -36
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = orange_3
							y_trans = -12
							x_scale = 4
							y_scale = 51
							rot = 2233
							flags = 259
							x_trans = -32
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = orange_3
							y_trans = -6
							x_scale = 4
							y_scale = 51
							rot = 2233
							flags = 259
							x_trans = -28
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = orange_3
							x_trans = -27
							y_trans = 8
							x_scale = 4
							rot = 2233
							flags = 259
							y_scale = 85
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = orange_3
							y_trans = 8
							x_scale = 4
							y_scale = 69
							rot = 2233
							flags = 259
							x_trans = -20
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = orange_3
							x_trans = -13
							x_scale = 4
							y_scale = 69
							rot = 2233
							flags = 259
							y_trans = 8
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = orange_3
							y_trans = 8
							x_scale = 4
							y_scale = 69
							rot = 2233
							flags = 259
							x_trans = -6
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = orange_3
							y_trans = 8
							x_scale = 4
							y_scale = 69
							rot = 2233
							flags = 259
							x_trans = 1
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_24Fret_ESP04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
					material = GTR_Fretboard24_04_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD97_ESP_Bats`
							flags = 36
							Color = orange_3
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR12_Neckhead_07
			chosen_materials = {
				material1 = Black_1guitar
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_07`
					material = GTR12_Neckhead_07_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR4_Neckhead_07_LD_01`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR12_Bridge_3
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR12_ESP_Knob_01
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR1_ESP_EMG_Pkup_2
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			Punk
			`Heavy	Metal`
		]
		CAS_Guitar_Body = {
			desc_id = GTR63f_ESP_EX
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr63f_esp_ex_d`
					material = GTR63f_ESP_EX_Primary
					diffuse
					layers = [
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics073`
							Color = Black_1guitar
							y_trans = -4
							x_scale = 53
							y_scale = 80
							rot = 1603
							flags = 3
							x_trans = -24
						}
					]
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR63F_ESP_EX_LD_01`
							flags = 4
							Color = red_2
						}
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR63F_ESP_EX_DTL_02`
							flags = 4
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_ESP01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d_01`
					material = GTR_Fretboard_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
							flags = 4
							Color = grey_4guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR63f_Neckhead
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr63f_neckhead_d`
					material = GTR63f_Neckhead_primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR63f_Neckhead_LD_01`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR_Hardware63f
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR63_Knob_Type06
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR62_ESP_EMG
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			Goth
		]
		CAS_Guitar_Body = {
			desc_id = GTR9_ESP_AX
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr9_esp_ax_d`
					material = GTR9_ESP_AX_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/ESP/gtr9_esp_ax_LD_01`
							flags = 4
						}
					]
					layers = [
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = purple_blue_1
							x_trans = -48
							x_scale = 11
							y_scale = 20
							rot = 1603
							flags = 259
							y_trans = -44
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = purple_blue_1
							y_trans = 41
							x_scale = 11
							y_scale = 20
							rot = 1603
							flags = 259
							x_trans = -48
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							x_trans = -38
							y_trans = 41
							x_scale = 11
							y_scale = 20
							rot = 1603
							flags = 259
							Color = purple_blue_1
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = purple_blue_1
							y_trans = 24
							x_scale = 11
							y_scale = 20
							rot = 1603
							flags = 259
							x_trans = -38
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = purple_blue_1
							x_trans = -38
							x_scale = 11
							y_scale = 20
							rot = 1603
							flags = 259
							y_trans = -27
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = purple_blue_1
							y_trans = -44
							x_scale = 11
							y_scale = 20
							rot = 1603
							flags = 259
							x_trans = -38
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = purple_blue_1
							x_trans = -28
							y_trans = -44
							x_scale = 11
							y_scale = 20
							rot = 1603
							flags = 259
							a = 70
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = purple_blue_1
							x_trans = -28
							y_trans = -27
							x_scale = 11
							y_scale = 20
							rot = 1603
							flags = 259
							a = 70
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = purple_blue_1
							x_trans = -28
							y_trans = -10
							x_scale = 11
							y_scale = 20
							rot = 1603
							flags = 259
							a = 70
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = purple_blue_1
							x_trans = -28
							y_trans = 7
							x_scale = 11
							y_scale = 20
							rot = 1603
							flags = 259
							a = 70
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = purple_blue_1
							x_trans = -28
							y_trans = 24
							x_scale = 11
							y_scale = 20
							rot = 1603
							flags = 259
							a = 70
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = purple_blue_1
							x_trans = -28
							y_trans = 41
							x_scale = 11
							y_scale = 20
							rot = 1603
							flags = 259
							a = 70
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = purple_blue_1
							a = 55
							x_trans = -18
							y_trans = 41
							x_scale = 11
							y_scale = 20
							rot = 1603
							flags = 259
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = purple_blue_1
							a = 55
							x_trans = -18
							x_scale = 11
							y_scale = 20
							rot = 1603
							flags = 259
							y_trans = 23
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = purple_blue_1
							a = 55
							x_trans = -18
							y_trans = 6
							x_scale = 11
							y_scale = 20
							rot = 1603
							flags = 259
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = purple_blue_1
							a = 55
							x_trans = -18
							y_trans = -10
							x_scale = 11
							y_scale = 20
							rot = 1603
							flags = 259
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = purple_blue_1
							a = 55
							x_trans = -18
							y_trans = -27
							x_scale = 11
							y_scale = 20
							rot = 1603
							flags = 259
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = purple_blue_1
							a = 55
							x_trans = -18
							x_scale = 11
							y_scale = 20
							rot = 1603
							flags = 259
							y_trans = -46
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = purple_blue_1
							x_trans = -8
							y_trans = -27
							x_scale = 11
							y_scale = 20
							rot = 1603
							flags = 259
							a = 35
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = purple_blue_1
							a = 35
							x_trans = -8
							x_scale = 11
							y_scale = 20
							rot = 1603
							flags = 259
							y_trans = -10
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = purple_blue_1
							a = 35
							x_trans = -8
							y_trans = 7
							x_scale = 11
							y_scale = 20
							rot = 1603
							flags = 259
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = purple_blue_1
							a = 35
							x_trans = -8
							x_scale = 11
							y_scale = 20
							rot = 1603
							flags = 259
							y_trans = 24
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = purple_blue_1
							a = 20
							x_trans = 2
							x_scale = 11
							y_scale = 20
							rot = 1603
							flags = 259
							y_trans = 41
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = purple_blue_1
							a = 20
							x_trans = 2
							y_trans = 24
							x_scale = 11
							y_scale = 20
							rot = 1603
							flags = 259
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = purple_blue_1
							a = 20
							x_trans = 2
							x_scale = 11
							y_scale = 20
							rot = 1603
							flags = 259
							y_trans = 7
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = purple_blue_1
							a = 20
							x_trans = 2
							y_trans = -11
							x_scale = 11
							y_scale = 20
							rot = 1603
							flags = 259
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = purple_blue_1
							a = 20
							x_trans = 2
							x_scale = 11
							y_scale = 20
							rot = 1603
							flags = 259
							y_trans = -27
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_ESP04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
					material = GTR_Fretboard_04_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
							flags = 4
							Color = grey_4guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR9_Neckhead_01
			chosen_materials = {
				material1 = grey_2guitar
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01`
					material = GTR9_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR9_Neckhead_LD_01`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR9_ESP_Bridge_03
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR9_ESP_Knob_10_02
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR1_ESP_EMG_Pkup_2
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			Punk
			rock
		]
		CAS_Guitar_Body = {
			desc_id = GTR32_Body
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr32_body`
					material = GTR32_Horizon_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/ESP/gtr32_solid`
							flags = 4
						}
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR32_Binding01`
							flags = 4
							Color = green_2guitar
						}
					]
					layers = [
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = green_2guitar
							x_trans = -9
							y_trans = 26
							x_scale = 1
							rot = 2113
							flags = 259
							y_scale = 21
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = green_2guitar
							y_trans = 26
							x_scale = 1
							y_scale = 79
							rot = 2113
							flags = 259
							x_trans = -26
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = green_2guitar
							y_trans = 3
							x_scale = 1
							y_scale = 99
							rot = 2113
							flags = 259
							x_trans = -28
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = green_2guitar
							x_trans = -31
							y_trans = -17
							x_scale = 1
							y_scale = 99
							rot = 2113
							flags = 259
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = green_2guitar
							y_trans = -37
							x_scale = 1
							y_scale = 69
							rot = 2113
							flags = 259
							x_trans = -34
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = green_2guitar
							x_trans = -30
							x_scale = 1
							y_scale = 99
							rot = 1333
							flags = 259
							y_trans = -27
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = green_2guitar
							y_trans = -7
							x_scale = 1
							y_scale = 99
							rot = 1333
							flags = 259
							x_trans = -30
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = green_2guitar
							x_trans = -25
							y_trans = 15
							x_scale = 1
							rot = 1333
							flags = 259
							y_scale = 125
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = green_2guitar
							x_trans = -36
							x_scale = 1
							y_scale = 57
							rot = 1333
							flags = 259
							y_trans = 40
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = green_2guitar
							x_trans = -36
							y_trans = 25
							x_scale = 1
							rot = 1333
							flags = 259
							y_scale = 57
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 100
							y_trans = 34
							x_scale = 3
							y_scale = 19
							rot = 2323
							flags = 259
							x_trans = -43
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 100
							x_trans = -37
							y_trans = 31
							y_scale = 16
							rot = 4093
							flags = 259
							x_scale = 3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 100
							x_trans = -34
							y_trans = 31
							y_scale = 8
							rot = 2953
							flags = 259
							x_scale = 3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 100
							x_trans = -33
							y_trans = 29
							y_scale = 5
							rot = 3733
							flags = 259
							x_scale = 3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 100
							x_trans = -29
							y_trans = 11
							y_scale = 33
							rot = 2623
							flags = 259
							x_scale = 3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 100
							x_trans = -23
							y_trans = 1
							y_scale = 17
							rot = 3583
							flags = 259
							x_scale = 3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 100
							x_trans = -20
							y_trans = -4
							y_scale = 25
							rot = 2833
							flags = 259
							x_scale = 3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 100
							x_trans = -17
							y_trans = -16
							y_scale = 9
							rot = 3583
							flags = 259
							x_scale = 3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 100
							x_trans = -12
							y_trans = -21
							y_scale = 24
							rot = 2293
							flags = 259
							x_scale = 3
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_ESP03
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d3_01`
					material = GTR_Fretboard_03_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_5
							texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR32_Neckhead_D
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d`
					material = GTR30_Nekhead_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR30_Nekhead_Solid`
							flags = 36
						}
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR30_nekhead_DTL02`
							flags = 36
							Color = green_2guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR32_Hardware01
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_32_KNOBS_A
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR31_Pickup_E
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Classic	Rock`
		]
		CAS_Guitar_Body = {
			desc_id = GTR4_ESP_Eclipse_01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr4_esp_eclipse_d_01`
					material = GTR4_ESP_Eclipse_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/gtr4_esp_eclipse_LD_01`
							flags = 4
							Color = grey_3guitar
						}
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR4_ESP_Eclipse_DTL_03`
							flags = 4
							Color = Black_1guitar
						}
					]
					layers = [
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShapeGradient_001`
							Color = red_orange_2
							a = 100
							y_trans = 0
							x_scale = 66
							y_scale = 77
							rot = 1603
							flags = 19
							x_trans = -31
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShapeGradient_001`
							x_trans = -7
							y_trans = 0
							x_scale = 67
							y_scale = 84
							rot = 1603
							flags = 3
							Color = blue_1
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShapeGradient_001`
							Color = yellow_1guitar
							a = 100
							y_trans = 0
							x_scale = 64
							y_scale = 34
							rot = 1603
							flags = 3
							x_trans = -25
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShapeGradient_001`
							Color = yellow_1guitar
							a = 100
							y_trans = 0
							x_scale = 51
							y_scale = 23
							rot = 1603
							flags = 19
							x_trans = -11
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = Black_1guitar
							y_trans = -36
							x_scale = 1
							y_scale = 48
							rot = 1603
							flags = 259
							x_trans = -37
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = Black_1guitar
							y_trans = -25
							x_scale = 1
							y_scale = 48
							rot = 1603
							flags = 259
							x_trans = -44
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = Black_1guitar
							x_trans = -37
							y_trans = -17
							x_scale = 1
							rot = 1603
							flags = 259
							y_scale = 48
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = Black_1guitar
							y_trans = 11
							x_scale = 1
							y_scale = 30
							rot = 1603
							flags = 259
							x_trans = -48
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = Black_1guitar
							y_trans = 19
							x_scale = 1
							y_scale = 30
							rot = 1603
							flags = 259
							x_trans = -45
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = Black_1guitar
							y_trans = 41
							x_scale = 1
							y_scale = 42
							rot = 1603
							flags = 259
							x_trans = -41
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = Black_1guitar
							x_trans = -38
							x_scale = 1
							y_scale = 42
							rot = 1603
							flags = 259
							y_trans = 34
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = Black_1guitar
							x_trans = -35
							y_trans = 28
							x_scale = 1
							rot = 1603
							flags = 259
							y_scale = 42
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = Black_1guitar
							y_trans = 2
							x_scale = 1
							y_scale = 30
							rot = 1603
							flags = 259
							x_trans = -42
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = Black_1guitar
							y_trans = 40
							x_scale = 3
							y_scale = 5
							rot = 1603
							flags = 259
							x_trans = -30
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = Black_1guitar
							y_trans = 33
							x_scale = 3
							y_scale = 5
							rot = 1603
							flags = 259
							x_trans = -27
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = Black_1guitar
							x_trans = -24
							x_scale = 3
							y_scale = 5
							rot = 1603
							flags = 259
							y_trans = 27
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = Black_1guitar
							x_trans = -37
							x_scale = 3
							y_scale = 5
							rot = 1603
							flags = 259
							y_trans = 18
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = Black_1guitar
							y_trans = 10
							x_scale = 3
							y_scale = 5
							rot = 1603
							flags = 259
							x_trans = -40
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = Black_1guitar
							x_trans = -34
							y_trans = 1
							x_scale = 3
							rot = 1603
							flags = 259
							y_scale = 5
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = Black_1guitar
							y_trans = -18
							x_scale = 3
							y_scale = 5
							rot = 1603
							flags = 259
							x_trans = -25
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = Black_1guitar
							x_trans = -31
							x_scale = 3
							y_scale = 5
							rot = 1603
							flags = 259
							y_trans = -26
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = Black_1guitar
							x_trans = -24
							x_scale = 3
							y_scale = 5
							rot = 1603
							flags = 259
							y_trans = -37
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_ESP01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d_01`
					material = GTR_Fretboard_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
							flags = 4
							Color = grey_4guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR4_Neckhead_01
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR4_ESP_Bridge_02
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR4_ESP_Knob_10_03
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR1_ESP_EMG_Pkup_2
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Glam	Rock`
			Pop
		]
		CAS_Guitar_Body = {
			desc_id = GTR90_DR_Daisy
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/DaisyRock/gtr90_dr_daisy_d`
					material = GTR90_DR_Daisy_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/DaisyRock/GTR90_DR_Daisy_LD02`
							flags = 4
							Color = navy_2
						}
						{
							texture = `tex/models/Characters/Layers/CAG/DaisyRock/GTR90_DR_Daisy_DTL07`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_Daisy02
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d2_01`
					material = GTR_Fretboard_02_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD123_DR_Butterfly`
							flags = 36
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR90_DR_Neckhead01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/DaisyRock/gtr90_neckhead01_d`
					material = GTR90_DR_Neckhead01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/DaisyRock/GTR90_Neckhead01_LD02`
							flags = 36
							Color = navy_2
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = GTR90_pg
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR_Bridge_McSwain_L_4B
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01c
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR90_pickup1
		}
		CAS_Guitar_Misc = {
			desc_id = GTR_Misc_Switch4
		}
	}
	{
		genre = [
			rock
			`Classic	Rock`
			Goth
			`Heavy	Metal`
		]
		CAS_Guitar_Body = {
			desc_id = GTR37_ESP_RW
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr37_rw_d`
					material = GTR37_RW_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR37_RW_Paint`
							flags = 4
						}
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR37_RW_binding`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_ESP04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
					material = GTR_Fretboard_04_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_5
							texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD103_ESP_Skulls2`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR37_Neckhead
			chosen_materials = {
				material1 = grey_2guitar
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed`
					material = GTR37_NHEAD_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR37_Nekhed_Solid`
							flags = 36
						}
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR37_Nekhed_DTL02`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = GTR37_PGuard01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr37_pguard01_d`
					material = GTR37_PGuard_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/gtr37_PGuard01_DTL02`
							flags = 4
							Color = grey_3guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR37_Hardware
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR37_Knobs01
			chosen_materials = {
				material1 = grey_3guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR37_Pickup_F
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			rock
			Punk
			`Classic	Rock`
			`Heavy	Metal`
		]
		CAS_Guitar_Body = {
			desc_id = GTR37_ESP_RW
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr37_rw_d`
					material = GTR37_RW_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR37_RW_Paint`
							flags = 4
							Color = yellow_3guitar
						}
						{
							Color = red_3
							texture = `tex/models/Characters/Layers/CAG/esp/gtr37_RW_tri`
							flags = 4
						}
						{
							texture = `tex/models/Characters/Layers/CAG/esp/GTR37_RW_trash`
							flags = 4
							Color = yellow_orange_5
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_ESP02
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d2_01`
					material = GTR_Fretboard_02_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD102_ESP_Logo`
							flags = 36
							Color = navy_5
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR37_Neckhead
			chosen_materials = {
				material1 = grey_2guitar
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed`
					material = GTR37_NHEAD_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/All_Clear`
							flags = 4
						}
						{
							texture = `tex/models/Characters/Layers/CAG/All_Clear2`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = GTR37_PGuard01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr37_pguard01_d`
					material = GTR37_PGuard_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/gtr37_PGuard01_DTL00`
							flags = 4
							Color = yellow_orange_5
						}
					]
				}
			]
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR37_Bridge
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR37_Knobs01
			chosen_materials = {
				material1 = grey_5guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR37_Pickup
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Heavy	Metal`
		]
		CAS_Guitar_Body = {
			desc_id = GTR9_ESP_AX
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr9_esp_ax_d`
					material = GTR9_ESP_AX_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/gtr9_esp_eclipse_LD_11`
							flags = 4
							Color = red_1
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_ESP03
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d3_01`
					material = GTR_Fretboard_03_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_5
							texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD105_ESP_UpDots`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR9_Neckhead_01
			chosen_materials = {
				material1 = grey_2guitar
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01`
					material = GTR9_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR9_Neckhead_LD_11`
							flags = 36
							Color = red_1
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR9_ESP_Bridge_03
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR9_ESP_Knob_10_02
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR1_ESP_EMG_Pkup_2
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Heavy	Metal`
		]
		CAS_Guitar_Body = {
			desc_id = GTR9_ESP_AX
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr9_esp_ax_d`
					material = GTR9_ESP_AX_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/gtr9_esp_AX_LD_03`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_ESP03
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d3_01`
					material = GTR_Fretboard_03_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_5
							texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD102_ESP_Logo`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR9_Neckhead_01
			chosen_materials = {
				material1 = grey_2guitar
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01`
					material = GTR9_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR9_Neckhead_LD_11`
							flags = 36
							Color = yellow_orange_4
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR9_ESP_Bridge_03
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR9_ESP_Knob_10_02
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR1_ESP_EMG_Pkup_2
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Heavy	Metal`
			`Black	Metal`
		]
		CAS_Guitar_Body = {
			desc_id = GTR9_ESP_AX
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr9_esp_ax_d`
					material = GTR9_ESP_AX_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/ESP/gtr9_esp_ax_LD_01`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_ESP04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
					material = GTR_Fretboard_04_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_5
							texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD105_ESP_UpDots`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR9_Neckhead_01
			chosen_materials = {
				material1 = grey_2guitar
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01`
					material = GTR9_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR9_Neckhead_LD_01`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR9_ESP_Bridge_03
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR9_ESP_Knob_10_02
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR1_ESP_EMG_Pkup_2
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			rock
			Punk
		]
		CAS_Guitar_Body = {
			desc_id = GTR4_ESP_Eclipse_01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr4_esp_eclipse_d_01`
					material = GTR4_ESP_Eclipse_01_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/ESP/gtr4_esp_eclipse_LD_01`
							flags = 4
						}
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR4_ESP_Eclipse_DTL_05`
							flags = 4
							Color = orange_4
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_ESP04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
					material = GTR_Fretboard_04_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_5
							texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD84_ESP_Flagship`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR4_Neckhead_01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01`
					material = GTR4_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR4_Neckhead_LD_01`
							flags = 36
						}
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR4_Neckhead_DTL_06`
							flags = 36
							Color = orange_4
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR4_ESP_Bridge_02
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR4_ESP_Knob_10_03
			chosen_materials = {
				material1 = yellow_3guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR1_ESP_EMG_Pkup_2
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Heavy	Metal`
			Goth
			Punk
		]
		CAS_Guitar_Body = {
			desc_id = GTR4_ESP_Eclipse_01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr4_esp_eclipse_d_01`
					material = GTR4_ESP_Eclipse_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/gtr4_esp_eclipse_LD_01`
							flags = 4
							Color = grey_5guitar
						}
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR4_ESP_Eclipse_DTL_05`
							flags = 4
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_ESP04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
					material = GTR_Fretboard_04_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_5
							texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD84_ESP_Flagship`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR4_Neckhead_01
			chosen_materials = {
				material1 = Black_1guitar
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01`
					material = GTR4_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR4_Neckhead_LD_01`
							flags = 36
						}
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR4_Neckhead_DTL_06`
							flags = 36
							Color = grey_5guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR4_ESP_Bridge_02
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR4_Knob_02
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR1_ESP_EMG_Pkup_2
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Classic	Rock`
		]
		CAS_Guitar_Body = {
			desc_id = GTR4_ESP_Eclipse_01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr4_esp_eclipse_d_01`
					material = GTR4_ESP_Eclipse_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/gtr4_esp_eclipse_LD_04`
							flags = 4
						}
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR4_ESP_Eclipse_DTL_01`
							flags = 4
							a = 65
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_ESP03
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d3_01`
					material = GTR_Fretboard_03_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_5
							texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD84_ESP_Flagship`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR4_Neckhead_01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01`
					material = GTR4_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR4_Neckhead_LD_01`
							flags = 36
						}
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR4_Neckhead_DTL_06`
							flags = 36
							Color = grey_5guitar
						}
					]
				}
			]
			chosen_materials = {
				material1 = grey_5guitar
			}
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR4_ESP_Bridge_02
			chosen_materials = {
				material1 = grey_5guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR4_ESP_Knob_10_03
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR1_ESP_EMG_Pkup_2
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Classic	Rock`
			Pop
		]
		CAS_Guitar_Body = {
			desc_id = GTR4_ESP_Eclipse_01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr4_esp_eclipse_d_01`
					material = GTR4_ESP_Eclipse_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/gtr4_esp_eclipse_LD_03`
							flags = 4
						}
						{
							texture = `tex/models/Characters/Layers/CAG/All_Clear2`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_ESP03
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d3_01`
					material = GTR_Fretboard_03_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_5
							texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD84_ESP_Flagship`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR4_Neckhead_01
			chosen_materials = {
				material1 = grey_5guitar
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01`
					material = GTR4_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR4_Neckhead_LD_01`
							flags = 36
						}
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR4_Neckhead_DTL_01`
							flags = 36
							Color = orange_4
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR4_ESP_Bridge_02
			chosen_materials = {
				material1 = grey_5guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR4_Knob_02
			chosen_materials = {
				material1 = orange_3
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR1_ESP_EMG_Pkup_2
			chosen_materials = {
				material1 = orange_5
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Heavy	Metal`
			`Black	Metal`
			Goth
			Punk
		]
		CAS_Guitar_Body = {
			desc_id = GTR4_ESP_Eclipse_01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr4_esp_eclipse_d_01`
					material = GTR4_ESP_Eclipse_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR4_ESP_Eclipse_Bio`
							flags = 4
						}
						{
							texture = `tex/models/Characters/Layers/CAG/All_Clear2`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_ESP04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
					material = GTR_Fretboard_04_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_5
							texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD84_ESP_Flagship`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR4_Neckhead_01
			chosen_materials = {
				material1 = Black_1guitar
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01`
					material = GTR4_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR4_Neckhead_LD_01`
							flags = 36
						}
						{
							texture = `tex/models/Characters/Layers/CAG/All_Clear2`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR4_ESP_Bridge_02
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR4_ESP_Knob_10_03
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR1_ESP_EMG_Pkup_2
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Heavy	Metal`
			`Black	Metal`
			Goth
			Punk
		]
		CAS_Guitar_Body = {
			desc_id = GTR63f_ESP_EX
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr63f_esp_ex_d`
					material = GTR63f_ESP_EX_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR63c_ESP_BioMchn`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_ESP04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
					material = GTR_Fretboard_04_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_5
							texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR63f_Neckhead
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr63f_neckhead_d`
					material = GTR63f_Neckhead_primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR63f_Neckhead_LD_01`
							flags = 36
						}
					]
				}
			]
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR_Hardware63f
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR63_Knob_Type06
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR62_ESP_EMG
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Glam	Rock`
			Punk
		]
		CAS_Guitar_Body = {
			desc_id = GTR63f_ESP_EX
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr63f_esp_ex_d`
					material = GTR63f_ESP_EX_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR63F_ESP_EX_LD_01`
							flags = 4
						}
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR63c_ESP_AVTAR`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_ESP04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
					material = GTR_Fretboard_04_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_5
							texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR63f_Neckhead
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr63f_neckhead_d`
					material = GTR63f_Neckhead_primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR63f_Neckhead_LD_01`
							flags = 36
						}
					]
				}
			]
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR_Hardware63f
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR63_Knob_Type06
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR62_ESP_EMG
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Glam	Rock`
			Punk
		]
		CAS_Guitar_Body = {
			desc_id = GTR63f_ESP_EX
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr63f_esp_ex_d`
					material = GTR63f_ESP_EX_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR63F_ESP_EX_LD_01`
							flags = 4
							Color = grey_5guitar
						}
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR63c_ESP_OUTLAW`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_ESP04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
					material = GTR_Fretboard_04_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_5
							texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR63f_Neckhead
			chosen_materials = {
				material1 = grey_2guitar
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr63f_neckhead_d`
					material = GTR63f_Neckhead_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR63f_Neckhead_LD_01`
							flags = 36
							Color = grey_5guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR_Hardware63f
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR63_Knob_Type06
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR62_ESP_EMG
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Heavy	Metal`
			Punk
		]
		CAS_Guitar_Body = {
			desc_id = GTR63f_ESP_EX
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr63f_esp_ex_d`
					material = GTR63f_ESP_EX_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR63F_ESP_EX_LD_01`
							flags = 4
							Color = grey_5guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_24Fret_ESP04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
					material = GTR_Fretboard24_04_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD102_ESP_Logo`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR63f_Neckhead
			chosen_materials = {
				material1 = Black_1guitar
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr63f_neckhead_d`
					material = GTR63f_Neckhead_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR63f_Neckhead_LD_01`
							flags = 36
							Color = grey_5guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR_Hardware63f
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR63_Knob_Type06
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR62_ESP_EMG
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Heavy	Metal`
		]
		CAS_Guitar_Body = {
			desc_id = GTR9_ESP_AX
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr9_esp_ax_d`
					material = GTR9_ESP_AX_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/ESP/gtr9_esp_ax_LD_01`
							flags = 4
						}
						{
							Color = grey_2guitar
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR9_ESP_AX_DTL_6B`
							flags = 4
						}
						{
							Color = grey_4guitar
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR9_ESP_AX_DTL_6A`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_24Fret_ESP04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
					material = GTR_Fretboard24_04_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD103_ESP_Skulls2`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR9_Neckhead_01
			chosen_materials = {
				material1 = Black_1guitar
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01`
					material = GTR9_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR9_Neckhead_LD_01`
							flags = 36
						}
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR9_Neckhead_DTL_03`
							flags = 36
							Color = grey_3guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR9_ESP_Bridge_03
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR9_ESP_Knob_10_02
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_Pkup_Type1_Blk_2
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Heavy	Metal`
			Goth
			`Black	Metal`
		]
		CAS_Guitar_Body = {
			desc_id = GTR12_ESP_V_01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr12_esp_v_series_d`
					material = GTR12_ESP_V_01_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR12_ESP_V_Series_LD_02`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_ESP04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
					material = GTR_Fretboard_04_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_5
							texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD89_ESP_Triangles`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR12_Neckhead_07
			chosen_materials = {
				material1 = Black_1guitar
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_07`
					material = GTR12_Neckhead_07_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR4_Neckhead_07_LD_01`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = GTR12_Pickguard_01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr12_pickguard_d_01`
					material = GTR12_Pickguard_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR12_Pickguard_LD_01`
							flags = 4
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR12_Bridge_3
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR12_ESP_Knob_01
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR1_ESP_EMG_Pkup_2
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Heavy	Metal`
			Goth
			`Black	Metal`
		]
		CAS_Guitar_Body = {
			desc_id = GTR62_ESP_Alexi
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr62_esp_alexi_d`
					material = GTR62_ESP_Alexi_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR62_ESP_Alexi_LD_04`
							flags = 4
							Color = Black_1guitar
						}
						{
							texture = `tex/models/Characters/Layers/CAG/All_Clear2`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_ESP04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
					material = GTR_Fretboard_04_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_5
							texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD96_ESP_Razors`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR62_Neckhead
			chosen_materials = {
				material1 = grey_2guitar
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr62_d_neckhead`
					material = GTR62_Neckhead_primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR62_Neckhead_LD_04`
							flags = 36
						}
						{
							texture = `tex/models/Characters/Layers/CAG/All_Clear2`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR_Hardware02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR62_Knob_Type03
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR62_ESP_EMG
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Classic	Rock`
		]
		CAS_Guitar_Body = {
			desc_id = GTR32_Body
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr32_body`
					material = GTR32_Horizon_Primary
					diffuse
					pre_layer = [
						{
							Color = red_2
							texture = `tex/models/Characters/Layers/CAG/ESP/gtr32_ESPTrash`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_ESP01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d_01`
					material = GTR_Fretboard_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
							flags = 4
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR32_Neckhead_C
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR32_Hardware01
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_32_KNOBS_A
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR32_Pickup_F
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Classic	Rock`
			rock
		]
		CAS_Guitar_Body = {
			desc_id = GTR32_Body
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr32_body`
					material = GTR32_Horizon_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/gtr32_quilt`
							flags = 4
							Color = orange_3
						}
						{
							texture = `tex/models/Characters/Layers/CAG/esp/gtr32_triburst`
							Color = red_orange_2
							flags = 4
							a = 65
						}
						{
							texture = `tex/models/Characters/Layers/CAG/All_Clear2`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_24Fret_ESP04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
					material = GTR_Fretboard24_04_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD82_ESP_Custom`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR32_Nekhead01
			chosen_materials = {
				material1 = grey_5guitar
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed`
					material = GTR32_NHED_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR32_Nekhed_DTL01`
							flags = 36
							Color = red_orange_1
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR32_Hardware01
			chosen_materials = {
				material1 = grey_5guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_32_KNOBS_A
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR31_Pickup_E
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			Pop
		]
		CAS_Guitar_Body = {
			desc_id = GTR32_Body
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr32_body`
					material = GTR32_Horizon_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/gtr32_solid`
							flags = 4
							Color = purple_blue_1
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_ESP03
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d3_01`
					material = GTR_Fretboard_03_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_5
							texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR32_Neckhead_D
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d`
					material = GTR30_Nekhead_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR30_Nekhead_Solid`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR32_Hardware01
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_32_KNOBS_A
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR31_Pickup_E
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Classic	Rock`
			Pop
		]
		CAS_Guitar_Body = {
			desc_id = GTR33D_BASE
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr33_kh2_wood_d`
					material = GTR33D_Wood_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/gtr33_solid`
							flags = 4
							Color = teal_1
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_ESP03
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d3_01`
					material = GTR_Fretboard_03_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_5
							texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR33D_NekHed
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR33_Hardware01Z
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR33_Knobs_KH2
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR33_EMG
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Heavy	Metal`
		]
		CAS_Guitar_Body = {
			desc_id = GTR33D_BASE
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr33_kh2_wood_d`
					material = GTR33D_Wood_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/ESP/gtr33_solid`
							flags = 4
						}
						{
							Color = grey_2guitar
							texture = `tex/models/Characters/Layers/CAG/esp/gtr33_DTL6B`
							flags = 4
						}
						{
							Color = grey_4guitar
							texture = `tex/models/Characters/Layers/CAG/esp/gtr33_DTL6A`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_ESP04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
					material = GTR_Fretboard_04_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_5
							texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD96_ESP_Razors`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR33D_NekHed
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR33_Hardware01Z
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR33_Knobs_KH2
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR33_EMG
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Heavy	Metal`
		]
		CAS_Guitar_Body = {
			desc_id = GTR33D_BASE
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr33_kh2_wood_d`
					material = GTR33D_Wood_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/ESP/gtr33_solid`
							flags = 4
						}
						{
							texture = `tex/models/Characters/Layers/CAG/esp/gtr33_DTL7B`
							flags = 4
							Color = grey_5guitar
						}
						{
							texture = `tex/models/Characters/Layers/CAG/esp/gtr33_DTL7A`
							flags = 4
							Color = teal_1
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_ESP04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
					material = GTR_Fretboard_04_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_5
							texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD96_ESP_Razors`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR33D_NekHed
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR33_Hardware01Z
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR33_Knobs_KH2
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR33_EMG
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Classic	Rock`
		]
		CAS_Guitar_Body = {
			desc_id = GTR37_ESP_RW
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr37_rw_d`
					material = GTR37_RW_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR37_RW_Paint`
							flags = 4
							Color = red_3
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_ESP02
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d2_01`
					material = GTR_Fretboard_02_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
							flags = 4
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR37_Neckhead
		}
		CAS_Guitar_Pickguards = {
			desc_id = GTR37_PGuard01
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR37_Bridge
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR37_Knobs01
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR37_Pickup
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Classic	Rock`
		]
		CAS_Guitar_Body = {
			desc_id = GTR37_ESP_RW
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr37_rw_d`
					material = GTR37_RW_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR37_RW_Paint`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_ESP01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d_01`
					material = GTR_Fretboard_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
							flags = 4
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR37_Neckhead
		}
		CAS_Guitar_Pickguards = {
			desc_id = GTR37_PGuard01
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR37_Bridge
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR37_Knobs01
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR37_Pickup
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			Punk
			rock
			Pop
		]
		CAS_Guitar_Body = {
			desc_id = GTR10_McSwain_Flame
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/McSwain/gtr10_mcswain_flame_d`
					material = GTR10_McSwain_Flame_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/McSwain/GTR10_McSwain_Flame_LD1`
							flags = 4
							Color = Black_1guitar
						}
						{
							Color = red_orange_3
							texture = `tex/models/Characters/Layers/CAG/McSwain/GTR10_McSwain_Flame_FD2`
							flags = 4
						}
						{
							texture = `tex/models/Characters/Layers/CAG/McSwain/GTR10_McSwain_Flame_DTL1`
							Color = red_1
							flags = 4
							a = 85
						}
					]
					layers = [
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = grey_5guitar
							x_trans = -31
							y_trans = 1
							x_scale = 42
							rot = 1603
							flags = 259
							y_scale = 60
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = Black_1guitar
							x_trans = -31
							y_trans = 1
							y_scale = 59
							rot = 1603
							flags = 259
							x_scale = 41
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = yellow_1guitar
							y_trans = 1
							x_scale = 39
							y_scale = 57
							rot = 1603
							flags = 259
							x_trans = -31
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_030`
							Color = Black_1guitar
							x_trans = -25
							x_scale = 21
							y_scale = 30
							rot = 1603
							flags = 259
							y_trans = 12
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_030`
							Color = Black_1guitar
							y_trans = 13
							x_scale = 21
							y_scale = 30
							rot = 1603
							flags = 259
							x_trans = -38
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_015`
							Color = Black_1guitar
							x_trans = -33
							x_scale = 32
							y_scale = 40
							rot = 750
							flags = 259
							y_trans = -6
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_041`
							Color = Black_1guitar
							y_trans = -3
							x_scale = 11
							y_scale = 10
							rot = 1843
							flags = 275
							x_trans = -39
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_041`
							Color = Black_1guitar
							x_trans = -24
							x_scale = 11
							y_scale = 10
							rot = 1603
							flags = 259
							y_trans = -10
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_Mcswain01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d_01`
					material = GTR_Fretboard_01_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_5
							texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR10_Neckhead_McSwain1
			chosen_materials = {
				material1 = grey_2guitar
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/McSwain/gtr10_neckhead_mcswain1_d`
					material = GTR10_Neckhead_McSwain_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/McSwain/GTR10_Nkhd_McSwain_LD1`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR_Brdg_McSwn_inferno_3
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_Pickup_Type3_Blk
		}
		CAS_Guitar_Misc = {
			desc_id = GTR_Misc_Switch
		}
	}
	{
		genre = [
			Pop
			`Glam	Rock`
		]
		CAS_Guitar_Body = {
			desc_id = GTR10_McSwain_Flame
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/McSwain/gtr10_mcswain_flame_d`
					material = GTR10_McSwain_Flame_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/McSwain/GTR10_McSwain_Flame_LD7`
							flags = 4
						}
						{
							Color = red_orange_3
							texture = `tex/models/Characters/Layers/CAG/McSwain/GTR10_McSwain_Flame_FD1`
							flags = 4
						}
						{
							texture = `tex/models/Characters/Layers/CAG/McSwain/GTR10_McSwain_Flame_DTL1`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_Mcswain04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
					material = GTR_Fretboard_04_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_5
							texture = `tex/models/Characters/Layers/CAG/GH5/22_fret_LD70_McSwn_Flame`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR12_Neckhead_McSwain12
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/McSwain/gtr12_neckhead_mcswain_d`
					material = GTR12_Neckhead_McSwain12_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/McSwain/GTR12_Nkhd_McSwain_LD1`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR_Bridge_McSwain_L_4
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01
		}
		CAS_Guitar_Pickups = {
			desc_id = Gtr10_Pickup_McSwain_1
		}
		CAS_Guitar_Misc = {
			desc_id = GTR_Misc_Switch
		}
	}
	{
		genre = [
			Punk
		]
		CAS_Guitar_Body = {
			desc_id = GTR11_McSwain_Carved
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/McSwain/gtr11_mcswain_carved_d`
					material = GTR11_McSwain_Carved_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/McSwain/GTR11_McSwain_Flame_LD11`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_Mcswain04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
					material = GTR_Fretboard_04_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_5
							texture = `tex/models/Characters/Layers/CAG/GH5/22_fret_LD72_McSwn_Queen`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR10_Neckhead_McSwain1
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/McSwain/gtr10_neckhead_mcswain1_d`
					material = GTR10_Neckhead_McSwain_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/McSwain/GTR10_Nkhd_McSwain_LD1`
							flags = 36
							Color = yellow_5guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR_Bridge_McSwain_2
			chosen_materials = {
				material1 = yellow_3guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01
			chosen_materials = {
				material1 = yellow_3guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_pickup_SD06
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = GTR_Misc_Switch
		}
	}
	{
		genre = [
			Punk
		]
		CAS_Guitar_Body = {
			desc_id = GTR11_McSwain_Carved
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/McSwain/gtr11_mcswain_carved_d`
					material = GTR11_McSwain_Carved_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/McSwain/GTR11_McSwain_Flame_LD12`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_Mcswain04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
					material = GTR_Fretboard_04_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_5
							texture = `tex/models/Characters/Layers/CAG/GH5/22_fret_LD73_McSwn_Anarchy`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR10_Neckhead_McSwain1
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/McSwain/gtr10_neckhead_mcswain1_d`
					material = GTR10_Neckhead_McSwain_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/McSwain/GTR10_Nkhd_McSwain_LD1`
							flags = 36
							Color = grey_5guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR_Bridge_McSwain_L_4
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_pickup_SD06
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = GTR_Misc_Switch
		}
	}
	{
		genre = [
			rock
			`Heavy	Metal`
		]
		CAS_Guitar_Body = {
			desc_id = GTR12_McSwain_MInferno
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/McSwain/gtr12_mcswain_minferno_d`
					material = GTR12_McSwain_MInferno_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/McSwain/GTR12_McSwain_MInferno_LD1`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_Mcswain04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
					material = GTR_Fretboard_04_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
							flags = 4
							Color = grey_5
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR12_Neckhead_McSwain12
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/McSwain/gtr12_neckhead_mcswain_d`
					material = GTR12_Neckhead_McSwain12_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/McSwain/GTR12_Nkhd_McSwain_LD1`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR_Brdg_McSwn_inferno_3
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01
		}
		CAS_Guitar_Pickups = {
			desc_id = Gtr10_Pickup_McSwain_1
		}
		CAS_Guitar_Misc = {
			desc_id = GTR_Misc_Switch
		}
	}
	{
		genre = [
			`Classic	Rock`
		]
		CAS_Guitar_Body = {
			desc_id = GTR11_McSwain_Carved
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/McSwain/gtr11_mcswain_carved_d`
					material = GTR11_McSwain_Carved_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/McSwain/GTR11_McSwain_Flame_LD10`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_Mcswain01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d_01`
					material = GTR_Fretboard_01_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_5
							texture = `tex/models/Characters/Layers/CAG/GH5/22_fret_LD71_McSwn_Waves`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR10_Neckhead_McSwain1
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/McSwain/gtr10_neckhead_mcswain1_d`
					material = GTR10_Neckhead_McSwain_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/McSwain/GTR10_Nkhd_McSwain_LD3`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR_Bridge_McSwain_2
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_Pickup_Type2_PAF1
			chosen_materials = {
				material1 = grey_5guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = GTR_Misc_Switch
		}
	}
	{
		genre = [
			Punk
			mixed
			Pop
		]
		CAS_Guitar_Body = {
			desc_id = GTR22_BC_Rich_Warlock
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/BC_Rich/gtr22_bc_rich_warlock_d`
					material = GTR22_BC_Rich_Warlock_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/BC_Rich/GTR_BC_Rich_Warlock_LD1`
							flags = 4
							Color = violet_3
						}
						{
							texture = `tex/models/Characters/Layers/CAG/BC_Rich/GTR_BC_Rich_Warlock_FD3`
							flags = 4
							Color = violet_2
						}
					]
					layers = [
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_022`
							y_trans = -10
							x_scale = 32
							y_scale = 47
							rot = 1603
							flags = 259
							x_trans = -20
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_022`
							x_trans = -20
							x_scale = 32
							y_scale = 47
							rot = 1603
							flags = 259
							y_trans = -38
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_022`
							x_trans = -40
							x_scale = 32
							y_scale = 47
							rot = 1603
							flags = 259
							y_trans = -36
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_022`
							x_trans = -1
							x_scale = 32
							y_scale = 47
							rot = 1603
							flags = 259
							y_trans = -12
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_022`
							x_trans = -1
							x_scale = 32
							y_scale = 47
							rot = 1603
							flags = 259
							y_trans = 17
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_022`
							y_trans = -41
							x_scale = 32
							y_scale = 47
							rot = 1603
							flags = 259
							x_trans = -1
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_022`
							x_trans = -21
							x_scale = 32
							y_scale = 47
							rot = 1603
							flags = 259
							y_trans = 19
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_022`
							y_trans = 19
							x_scale = 32
							y_scale = 47
							rot = 1603
							flags = 259
							x_trans = -40
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_022`
							x_trans = 19
							x_scale = 32
							y_scale = 47
							rot = 1603
							flags = 259
							y_trans = 15
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_BCRich04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
					material = GTR_Fretboard_04_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_5
							texture = `tex/models/Characters/Layers/CAG/BC_Rich/22fret_LD04_BCR_Diamonds`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR22_Neckhead_Pointed5
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/BC_Rich/GTR20_Neckhead_Pointed3_d`
					material = GTR22_Neckhead_Pointed5_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/BC_Rich/GTR20_Neckhead_Pointed_LD02`
							flags = 36
							Color = violet_3
						}
						{
							texture = `tex/models/Characters/Layers/CAG/BC_Rich/GTR20_Neckhead_Pointed_FAD04`
							flags = 36
							Color = violet_1
						}
						{
							texture = `tex/models/Characters/Layers/CAG/BC_Rich/GTR20_Neckhead_Pointed_DTL02`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR22_Bridge_Whammy1
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_EMG_pickup5
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = GTR_Misc_Switch
		}
	}
	{
		genre = [
			`Black	Metal`
			`Heavy	Metal`
		]
		CAS_Guitar_Body = {
			desc_id = GTR21_BC_Rich_Warbeast
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/BC_Rich/gtr21_bc_rich_warbeast_d`
					material = GTR21_BC_Rich_Warbeast_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/BC_Rich/GTR_BC_Rich_Warbeast_LD1`
							flags = 4
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_BCRich01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d_01`
					material = GTR_Fretboard_01_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_5
							texture = `tex/models/Characters/Layers/CAG/All_Clear2`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR21_Neckhead_Beast2
			chosen_materials = {
				material1 = Black_1guitar
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/BC_Rich/gtr20_neckhead_beast1_d`
					material = GTR21_Neckhead_Beast2_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/BC_Rich/GTR20_Neckhead_LD03`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR_BC_Rich_Bridge_21
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_EMG_pickup2
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = GTR_Misc_Switch_blk_3
		}
	}
	{
		genre = [
			`Black	Metal`
			`Heavy	Metal`
			Goth
		]
		CAS_Guitar_Body = {
			desc_id = GTR21_BC_Rich_Warbeast
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/BC_Rich/gtr21_bc_rich_warbeast_d`
					material = GTR21_BC_Rich_Warbeast_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/BC_Rich/GTR_BC_Rich_Warbeast_LD1`
							flags = 4
							Color = Black_1guitar
						}
						{
							texture = `tex/models/Characters/Layers/CAG/BC_Rich/GTR_BC_Rich_Warbeast_DTL1`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_BCRich04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
					material = GTR_Fretboard_04_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_5
							texture = `tex/models/Characters/Layers/CAG/BC_Rich/22fret_LD05_BCR_NJDLX`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR21_Neckhead_Beast2
			chosen_materials = {
				material1 = grey_2guitar
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/BC_Rich/gtr20_neckhead_beast1_d`
					material = GTR21_Neckhead_Beast2_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/BC_Rich/GTR20_Neckhead_LD02`
							flags = 36
						}
						{
							texture = `tex/models/Characters/Layers/CAG/BC_Rich/GTR20_Neckhead_DTL01`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR22_Bridge_Whammy1
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_EMG_pickup2
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = GTR_Misc_Switch_blk_3
		}
	}
	{
		genre = [
			`Black	Metal`
			`Heavy	Metal`
			Goth
		]
		CAS_Guitar_Body = {
			desc_id = GTR22_BC_Rich_Warlock
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/BC_Rich/gtr22_bc_rich_warlock_d`
					material = GTR22_BC_Rich_Warlock_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/BC_Rich/GTR_BC_Rich_Warlock_LD1`
							flags = 4
							Color = grey_5guitar
						}
						{
							texture = `tex/models/Characters/Layers/CAG/BC_Rich/GTR_BC_Rich_Warlock_DTL1`
							flags = 4
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_BCRich01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d_01`
					material = GTR_Fretboard_01_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_5
							texture = `tex/models/Characters/Layers/CAG/BC_Rich/22fret_LD04_BCR_Diamonds`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR22_Neckhead_Beast3
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/BC_Rich/gtr20_neckhead_beast1_d`
					material = GTR22_Neckhead_Beast3_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/BC_Rich/GTR20_Neckhead_LD02`
							flags = 36
							Color = grey_5guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR_BC_Rich_Bridge_21
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_EMG_pickup2
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = GTR_Misc_Switch
		}
	}
	{
		genre = [
			`Black	Metal`
			`Heavy	Metal`
		]
		CAS_Guitar_Body = {
			desc_id = GTR22_BC_Rich_Warlock
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/BC_Rich/gtr22_bc_rich_warlock_d`
					material = GTR22_BC_Rich_Warlock_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/BC_Rich/GTR_BC_Rich_Warlock_LD1`
							flags = 4
							Color = grey_2guitar
						}
						{
							texture = `tex/models/Characters/Layers/CAG/All_Clear2`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_BCRich03
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d3_01`
					material = GTR_Fretboard_03_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_5
							texture = `tex/models/Characters/Layers/CAG/BC_Rich/22fret_LD04_BCR_Diamonds`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR22_Neckhead_Pointed5
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/BC_Rich/GTR20_Neckhead_Pointed3_d`
					material = GTR22_Neckhead_Pointed5_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/BC_Rich/GTR20_Neckhead_Pointed_LD02`
							flags = 36
							Color = grey_2guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR22_Bridge_Whammy1
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_pickup_SD06
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = GTR_Misc_Switch
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
	}
	{
		genre = [
			`Black	Metal`
			rock
		]
		CAS_Guitar_Body = {
			desc_id = GTR22_BC_Rich_Warlock
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/BC_Rich/gtr22_bc_rich_warlock_d`
					material = GTR22_BC_Rich_Warlock_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/BC_Rich/GTR_BC_Rich_Warlock_LD6`
							flags = 4
						}
						{
							texture = `tex/models/Characters/Layers/CAG/All_Clear2`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_BCRich03
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d3_01`
					material = GTR_Fretboard_03_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_5
							texture = `tex/models/Characters/Layers/CAG/BC_Rich/22fret_LD04_BCR_Diamonds`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR22_Neckhead_Warlock4
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/BC_Rich/GTR20_Neckhead_Warlock2_d`
					material = GTR22_Neckhead_Warlock4_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/BC_Rich/GTR20_Neckhead_Warlock_LD04`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR_BC_Rich_Bridge_21
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_pickup_SD06B
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Black	Metal`
			`Heavy	Metal`
		]
		CAS_Guitar_Body = {
			desc_id = GTR22_BC_Rich_Warlock
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/BC_Rich/gtr22_bc_rich_warlock_d`
					material = GTR22_BC_Rich_Warlock_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/BC_Rich/GTR_BC_Rich_Warlock_LD1`
							flags = 4
							Color = Black_1guitar
						}
					]
					layers = [
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon002`
							Color = red_2
							y_trans = -25
							x_scale = 90
							y_scale = 72
							rot = 6253
							flags = 19
							x_trans = -29
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon002`
							Color = red_2
							y_trans = 14
							x_scale = 90
							y_scale = 72
							rot = 6253
							flags = 3
							x_trans = -19
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_BCRich01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d_01`
					material = GTR_Fretboard_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/22_fret_LD01_Hero_Dots`
							flags = 4
							Color = grey_5guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR22_Neckhead_Beast3
			chosen_materials = {
				material1 = grey_2guitar
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/BC_Rich/gtr20_neckhead_beast1_d`
					material = GTR22_Neckhead_Beast3_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/BC_Rich/GTR20_Neckhead_LD04`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR_BC_Rich_Bridge_21
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_pickup_SD06
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = GTR_Misc_Switch_blk_3
		}
	}
	{
		genre = [
			`Black	Metal`
			`Heavy	Metal`
		]
		CAS_Guitar_Body = {
			desc_id = GTR22_BC_Rich_Warlock
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/BC_Rich/gtr22_bc_rich_warlock_d`
					material = GTR22_BC_Rich_Warlock_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/BC_Rich/GTR_BC_Rich_Warlock_LD1`
							flags = 4
							Color = Black_1guitar
						}
					]
					layers = [
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon005`
							Color = red_2
							y_trans = -23
							x_scale = 49
							y_scale = 62
							rot = 1993
							flags = 11
							x_trans = -20
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon005`
							Color = red_2
							x_trans = -15
							x_scale = 49
							y_scale = 62
							rot = 1213
							flags = 3
							y_trans = 15
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_BCRich04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
					material = GTR_Fretboard_04_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/22_fret_LD01_Hero_Dots`
							flags = 4
							Color = grey_5guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR22_Neckhead_Beast3
			chosen_materials = {
				material1 = Black_1guitar
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/BC_Rich/gtr20_neckhead_beast1_d`
					material = GTR22_Neckhead_Beast3_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/BC_Rich/GTR20_Neckhead_LD02`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR22_Bridge_Whammy1
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_pickup_SD06
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Black	Metal`
			`Heavy	Metal`
		]
		CAS_Guitar_Body = {
			desc_id = GTR22_BC_Rich_Warlock
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/BC_Rich/gtr22_bc_rich_warlock_d`
					material = GTR22_BC_Rich_Warlock_Primary
					diffuse
					layers = [
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons047`
							x_trans = -16
							x_scale = 50
							y_scale = 112
							rot = 1603
							flags = 3
							y_trans = -7
						}
					]
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/BC_Rich/GTR_BC_Rich_Warlock_LD1`
							flags = 4
							Color = Black_1guitar
						}
						{
							texture = `tex/models/Characters/Layers/CAG/BC_Rich/GTR_BC_Rich_Warlock_DTL2`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_BCRich04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
					material = GTR_Fretboard_04_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/22_fret_LD01_Hero_Dots`
							flags = 4
							Color = grey_5guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR22_Neckhead_Beast3
			chosen_materials = {
				material1 = Black_1guitar
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/BC_Rich/gtr20_neckhead_beast1_d`
					material = GTR22_Neckhead_Beast3_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/BC_Rich/GTR20_Neckhead_LD02`
							flags = 36
						}
						{
							texture = `tex/models/Characters/Layers/CAG/BC_Rich/GTR20_Neckhead_DTL02`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR22_Bridge_Whammy1
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_pickup_SD06
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			Goth
		]
		CAS_Guitar_Body = {
			desc_id = GTR22_BC_Rich_Warlock
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/BC_Rich/gtr22_bc_rich_warlock_d`
					material = GTR22_BC_Rich_Warlock_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/BC_Rich/GTR_BC_Rich_Warlock_LD2`
							flags = 4
							Color = purple_blue_1
						}
						{
							texture = `tex/models/Characters/Layers/CAG/BC_Rich/GTR_BC_Rich_Warlock_FD3`
							flags = 4
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_BCRich04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
					material = GTR_Fretboard_04_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/22_fret_LD01_Hero_Dots`
							flags = 4
							Color = grey_5guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR22_Neckhead_Beast3
			chosen_materials = {
				material1 = grey_2guitar
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/BC_Rich/gtr20_neckhead_beast1_d`
					material = GTR22_Neckhead_Beast3_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/BC_Rich/GTR20_Neckhead_LD02`
							flags = 36
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR22_Bridge_Whammy1
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_EMG_pickup2
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = GTR_Misc_Switch
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
	}
	{
		genre = [
			`Glam	Rock`
			Pop
		]
		CAS_Guitar_Body = {
			desc_id = GTR90_DR_Daisy
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/DaisyRock/gtr90_dr_daisy_d`
					material = GTR90_DR_Daisy_Primary
					diffuse
					layers = [
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShapeGradient_001`
							Color = blue_1
							x_trans = -44
							y_trans = 1
							y_scale = 24
							rot = 1603
							flags = 19
							x_scale = 33
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShapeGradient_001`
							Color = green_2guitar
							y_trans = 1
							x_scale = 60
							y_scale = 24
							rot = 1603
							flags = 3
							x_trans = -43
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShapeGradient_001`
							Color = green_2guitar
							x_trans = -33
							y_trans = 1
							y_scale = 24
							rot = 1603
							flags = 19
							x_scale = 60
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShapeGradient_001`
							Color = orange_3
							y_trans = 1
							x_scale = 65
							y_scale = 24
							rot = 1603
							flags = 3
							x_trans = -31
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShapeGradient_001`
							Color = orange_3
							x_trans = -21
							x_scale = 65
							y_scale = 24
							rot = 1603
							flags = 19
							y_trans = 1
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShapeGradient_001`
							Color = red_2
							x_trans = -18
							x_scale = 62
							y_scale = 24
							rot = 1603
							flags = 3
							y_trans = 4
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShapeGradient_001`
							x_trans = -8
							y_trans = 1
							x_scale = 54
							y_scale = 24
							rot = 1603
							flags = 19
							Color = red_2
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShapeGradient_001`
							Color = violet_3
							x_trans = -8
							y_trans = 1
							y_scale = 24
							rot = 1603
							flags = 3
							x_scale = 54
						}
					]
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/DaisyRock/GTR90_DR_Daisy_LD02`
							flags = 4
							Color = red_2
						}
						{
							texture = `tex/models/Characters/Layers/CAG/DaisyRock/GTR90_DR_Daisy_DTL08B`
							flags = 4
							Color = Black_1guitar
						}
						{
							texture = `tex/models/Characters/Layers/CAG/DaisyRock/GTR90_DR_Daisy_DTL08A`
							flags = 4
							Color = orange_3
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_Daisy04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
					material = GTR_Fretboard_04_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_5
							texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD122_DR_Daisy`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR90_DR_Neckhead01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/DaisyRock/gtr90_neckhead01_d`
					material = GTR90_DR_Neckhead01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/DaisyRock/GTR90_Neckhead01_LD02`
							flags = 36
							Color = red_2
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = GTR90_pg
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/DaisyRock/GTR90_pg_d`
					material = GTR90_pg_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/DaisyRock/GTR90_pg_LD01`
							flags = 4
							Color = green_3guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR_Bridge_McSwain_L_4B
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_03
			chosen_materials = {
				material1 = green_3guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR90_pickup3
			chosen_materials = {
				material1 = green_3guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = GTR_Misc_Switch4
			chosen_materials = {
				material1 = green_3guitar
			}
		}
	}
	{
		genre = [
			rock
			Goth
			Punk
		]
		CAS_Guitar_Body = {
			desc_id = GTR94_DR_TomBoy
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/DaisyRock/GTR94_DR_TomBoy_d`
					material = GTR94_DR_TomBoy_Primary
					diffuse
					layers = [
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics082`
							Color = Black_1guitar
							x_trans = 8
							x_scale = 19
							y_scale = 30
							rot = 1603
							flags = 3
							y_trans = 12
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics082`
							Color = Black_1guitar
							y_trans = 35
							x_scale = 19
							y_scale = 30
							rot = 1603
							flags = 3
							x_trans = 8
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics082`
							Color = Black_1guitar
							x_trans = -4
							x_scale = 19
							y_scale = 30
							rot = 1603
							flags = 3
							y_trans = 35
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics082`
							Color = Black_1guitar
							x_trans = -4
							x_scale = 19
							y_scale = 30
							rot = 1603
							flags = 3
							y_trans = 13
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics082`
							Color = Black_1guitar
							x_trans = -4
							x_scale = 19
							y_scale = 30
							rot = 1603
							flags = 3
							y_trans = -9
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics082`
							Color = Black_1guitar
							y_trans = -30
							x_scale = 19
							y_scale = 30
							rot = 1603
							flags = 3
							x_trans = -4
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics082`
							x_trans = -16
							y_trans = -30
							x_scale = 19
							y_scale = 30
							rot = 1603
							flags = 3
							Color = Black_1guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics082`
							Color = Black_1guitar
							x_trans = -16
							x_scale = 19
							y_scale = 30
							rot = 1603
							flags = 3
							y_trans = -8
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics082`
							Color = Black_1guitar
							x_trans = -16
							x_scale = 19
							y_scale = 30
							rot = 1603
							flags = 3
							y_trans = 14
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics082`
							Color = Black_1guitar
							y_trans = 36
							x_scale = 19
							y_scale = 30
							rot = 1603
							flags = 3
							x_trans = -16
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics082`
							Color = Black_1guitar
							x_trans = -28
							x_scale = 19
							y_scale = 30
							rot = 1603
							flags = 3
							y_trans = 36
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics082`
							Color = Black_1guitar
							x_trans = -28
							x_scale = 19
							y_scale = 30
							rot = 1603
							flags = 3
							y_trans = 14
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics082`
							Color = Black_1guitar
							x_trans = -28
							x_scale = 19
							y_scale = 30
							rot = 1603
							flags = 3
							y_trans = -8
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics082`
							Color = Black_1guitar
							x_trans = -28
							x_scale = 19
							y_scale = 30
							rot = 1603
							flags = 3
							y_trans = -29
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics082`
							Color = Black_1guitar
							x_trans = -40
							x_scale = 19
							y_scale = 30
							rot = 1603
							flags = 3
							y_trans = -29
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics082`
							Color = Black_1guitar
							x_trans = -40
							x_scale = 19
							y_scale = 30
							rot = 1603
							flags = 3
							y_trans = 37
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics082`
							Color = Black_1guitar
							x_trans = -40
							y_trans = 15
							x_scale = 19
							y_scale = 30
							rot = 1603
							flags = 3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics082`
							Color = Black_1guitar
							x_trans = -40
							x_scale = 19
							y_scale = 30
							rot = 1603
							flags = 3
							y_trans = -7
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics082`
							Color = Black_1guitar
							x_trans = -28
							x_scale = 19
							y_scale = 30
							rot = 1603
							flags = 3
							y_trans = -53
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics082`
							Color = Black_1guitar
							x_trans = -40
							x_scale = 19
							y_scale = 30
							rot = 1603
							flags = 3
							y_trans = -52
						}
					]
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/DaisyRock/GTR94_DR_TomBoy_LD02`
							flags = 4
							Color = grey_5guitar
						}
						{
							texture = `tex/models/Characters/Layers/CAG/DaisyRock/GTR94_DR_TomBoy_DTL03`
							flags = 4
							Color = Black_1guitar
						}
						{
							texture = `tex/models/Characters/Layers/CAG/All_Clear2`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_24Fret_Daisy04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
					material = GTR_Fretboard24_04_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD124_DR_Stardust`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR94_DR_Neckhead01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/DaisyRock/gtr93_neckhead01_d`
					material = GTR94_DR_Neckhead01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/DaisyRock/GTR93_Neckhead01_LD02`
							flags = 36
							Color = grey_5guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR94_Bridge
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_Pickup_Type2_PAF1
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = GTR_Misc_Switch4
		}
	}
	{
		genre = [
			Pop
		]
		CAS_Guitar_Body = {
			desc_id = GTR90_DR_Daisy
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/DaisyRock/gtr90_dr_daisy_d`
					material = GTR90_DR_Daisy_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/DaisyRock/GTR90_DR_Daisy_LD02`
							flags = 4
							Color = yellow_3guitar
						}
						{
							texture = `tex/models/Characters/Layers/CAG/DaisyRock/GTR90_DR_Daisy_DTL07`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_Daisy02
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d2_01`
					material = GTR_Fretboard_02_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_2
							texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD122_DR_Daisy`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR90_DR_Neckhead01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/DaisyRock/gtr90_neckhead01_d`
					material = GTR90_DR_Neckhead01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/DaisyRock/GTR90_Neckhead01_LD02`
							flags = 36
							Color = yellow_3guitar
						}
						{
							texture = `tex/models/Characters/Layers/CAG/All_Clear2`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = GTR90_pg
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR_Bridge_McSwain_L_4B
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01c
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR90_pickup1
		}
		CAS_Guitar_Misc = {
			desc_id = GTR_Misc_Switch4
		}
	}
	{
		genre = [
			Pop
		]
		CAS_Guitar_Body = {
			desc_id = GTR90_DR_Daisy
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/DaisyRock/gtr90_dr_daisy_d`
					material = GTR90_DR_Daisy_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/DaisyRock/GTR90_DR_Daisy_LD02`
							flags = 4
							Color = navy_2
						}
						{
							texture = `tex/models/Characters/Layers/CAG/DaisyRock/GTR90_DR_Daisy_DTL07`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_Daisy02
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d2_01`
					material = GTR_Fretboard_02_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD123_DR_Butterfly`
							flags = 36
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR90_DR_Neckhead01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/DaisyRock/gtr90_neckhead01_d`
					material = GTR90_DR_Neckhead01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/DaisyRock/GTR90_Neckhead01_LD02`
							flags = 36
							Color = navy_2
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = GTR90_pg
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR_Bridge_McSwain_L_4B
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01c
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR90_pickup1
		}
		CAS_Guitar_Misc = {
			desc_id = GTR_Misc_Switch4
		}
	}
	{
		genre = [
			Pop
		]
		CAS_Guitar_Body = {
			desc_id = GTR91_DR_Heart
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/DaisyRock/GTR91_DR_Heart_d`
					material = GTR91_DR_heart_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/DaisyRock/GTR91_DR_Heart_LD02`
							flags = 4
							Color = red_3
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_Daisy01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d_01`
					material = GTR_Fretboard_01_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_5
							texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD121_DR_Ovals`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR91_DR_Neckhead01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/DaisyRock/gtr90_neckhead01_d`
					material = GTR91_DR_Neckhead01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/DaisyRock/GTR90_Neckhead01_LD02`
							flags = 36
							Color = red_3
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = GTR91_pg
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR_Bridge_McSwain_L_4B
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01c
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR90_pickup1
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			Pop
		]
		CAS_Guitar_Body = {
			desc_id = GTR91_DR_Heart
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/DaisyRock/GTR91_DR_Heart_d`
					material = GTR91_DR_heart_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/DaisyRock/GTR91_DR_Heart_LD02`
							flags = 4
							Color = purple_blue_2
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_Daisy01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d_01`
					material = GTR_Fretboard_01_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_5
							texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR91_DR_Neckhead01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/DaisyRock/gtr90_neckhead01_d`
					material = GTR91_DR_Neckhead01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/DaisyRock/GTR90_Neckhead01_LD02`
							flags = 36
							Color = purple_blue_2
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = GTR91_pg
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR_Bridge_McSwain_L_4B
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR90_pickup3
		}
		CAS_Guitar_Misc = {
			desc_id = GTR_Misc_Switch4
		}
	}
	{
		genre = [
			Pop
			`Glam	Rock`
		]
		CAS_Guitar_Body = {
			desc_id = gtr93_DR_Siren
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/DaisyRock/gtr93_DR_Siren_d`
					material = gtr93_DR_Siren_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/DaisyRock/gtr93_DR_Siren_LD08`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_Daisy01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d_01`
					material = GTR_Fretboard_01_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_5
							texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD121_DR_Ovals`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR93_DR_Neckhead01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/DaisyRock/gtr93_neckhead01_d`
					material = GTR93_DR_Neckhead01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/DaisyRock/GTR93_Neckhead01_LD06`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR_Bridge_01D
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_Pickup_Type2_PAF1
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = GTR_Misc_Switch4
		}
	}
	{
		genre = [
			Pop
			`Glam	Rock`
		]
		CAS_Guitar_Body = {
			desc_id = gtr93_DR_Siren
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/DaisyRock/gtr93_DR_Siren_d`
					material = gtr93_DR_Siren_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/DaisyRock/gtr93_DR_Siren_LD07`
							flags = 4
							Color = violet_3
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_Daisy01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d_01`
					material = GTR_Fretboard_01_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_5
							texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD121_DR_Ovals`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR93_DR_Neckhead01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/DaisyRock/gtr93_neckhead01_d`
					material = GTR93_DR_Neckhead01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/DaisyRock/GTR93_Neckhead01_LD05`
							flags = 36
							Color = violet_3
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR_Bridge_01D
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_Pickup_Type2_PAF1
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = GTR_Misc_Switch4
		}
	}
	{
		genre = [
			Pop
			`Glam	Rock`
		]
		CAS_Guitar_Body = {
			desc_id = GTR94_DR_TomBoy
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/DaisyRock/GTR94_DR_TomBoy_d`
					material = GTR94_DR_TomBoy_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/DaisyRock/GTR94_DR_TomBoy_LD06`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_Daisy01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d_01`
					material = GTR_Fretboard_01_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_5
							texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD124_DR_Stardust`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR94_DR_Neckhead01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/DaisyRock/gtr93_neckhead01_d`
					material = GTR94_DR_Neckhead01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/DaisyRock/GTR93_Neckhead01_LD07`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = GTR94_PG
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR94_Bridge
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR94_pickup
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = GTR_Misc_Switch4
		}
	}
	{
		genre = [
			Pop
			`Glam	Rock`
		]
		CAS_Guitar_Body = {
			desc_id = GTR94_DR_TomBoy
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/DaisyRock/GTR94_DR_TomBoy_d`
					material = GTR94_DR_TomBoy_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/DaisyRock/GTR94_DR_TomBoy_LD07`
							flags = 4
							Color = red_3
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_Daisy01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d_01`
					material = GTR_Fretboard_01_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_5
							texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD124_DR_Stardust`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR94_DR_Neckhead01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/DaisyRock/gtr93_neckhead01_d`
					material = GTR94_DR_Neckhead01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/DaisyRock/GTR93_Neckhead01_LD08`
							flags = 36
							Color = red_3
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = GTR94_PG
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR94_Bridge
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR94_pickup
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = GTR_Misc_Switch4
		}
	}
	{
		genre = [
			`Heavy	Metal`
		]
		CAS_Guitar_Body = {
			desc_id = GTR77_IBZ_RG
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR77_IBZ_RG_d`
					material = GTR77_IBZ_RG_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR77_IBZ_RG_LD02`
							flags = 4
						}
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR77_IBZ_RG_DTL02`
							flags = 4
						}
					]
					layers = [
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons046`
							Color = grey_3guitar
							x_trans = -2
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							y_trans = -33
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons046`
							Color = grey_3guitar
							y_trans = -26
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = -2
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons046`
							Color = grey_3guitar
							y_trans = -26
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = -6
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons046`
							Color = grey_3guitar
							y_trans = -26
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = -10
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons046`
							Color = grey_3guitar
							x_trans = -14
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							y_trans = -26
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons046`
							Color = grey_3guitar
							y_trans = -19
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = -14
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons046`
							Color = grey_3guitar
							y_trans = -19
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = -10
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons046`
							Color = grey_3guitar
							y_trans = -19
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = -6
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons046`
							Color = grey_3guitar
							y_trans = -19
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = -2
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons046`
							Color = grey_3guitar
							y_trans = -13
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = -6
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons046`
							Color = grey_3guitar
							y_trans = -13
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = -10
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons046`
							Color = grey_3guitar
							x_trans = -14
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							y_trans = -13
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons046`
							Color = grey_3guitar
							x_trans = -14
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							y_trans = 18
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons046`
							Color = grey_3guitar
							y_trans = 12
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = -14
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons046`
							Color = grey_3guitar
							y_trans = 12
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = -2
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons046`
							Color = grey_3guitar
							y_trans = 12
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = -6
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons046`
							Color = grey_3guitar
							x_trans = -10
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							y_trans = 12
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons046`
							Color = grey_3guitar
							y_trans = 18
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = -10
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons046`
							Color = grey_3guitar
							y_trans = 18
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = -6
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons046`
							Color = grey_3guitar
							y_trans = 18
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = -2
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons046`
							Color = grey_3guitar
							x_trans = 2
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							y_trans = 18
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons046`
							Color = grey_3guitar
							y_trans = 24
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = 2
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons046`
							Color = grey_3guitar
							y_trans = 24
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = -2
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons046`
							Color = grey_3guitar
							y_trans = 24
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = -6
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons046`
							Color = grey_3guitar
							x_trans = -10
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							y_trans = 24
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons046`
							Color = grey_3guitar
							y_trans = 30
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = -10
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons046`
							Color = grey_3guitar
							y_trans = 30
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = -6
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons046`
							Color = grey_3guitar
							y_trans = 30
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = -2
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons046`
							Color = grey_3guitar
							y_trans = 30
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = 2
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons046`
							Color = grey_3guitar
							y_trans = 33
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = 4
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons046`
							Color = grey_3guitar
							y_trans = 33
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = 8
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons046`
							Color = grey_3guitar
							y_trans = 33
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = 12
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons046`
							Color = grey_3guitar
							y_trans = 39
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = 4
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons046`
							Color = grey_3guitar
							y_trans = 39
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = 8
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons046`
							Color = grey_3guitar
							x_trans = 12
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							y_trans = 39
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons046`
							Color = grey_3guitar
							x_trans = 15
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							y_trans = 35
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon005`
							Color = grey_5guitar
							x_trans = -13
							y_trans = 8
							x_scale = 48
							y_scale = 79
							rot = 4363
							flags = 259
							a = 50
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon005`
							Color = grey_5guitar
							x_trans = 3
							y_trans = 34
							x_scale = 48
							y_scale = 79
							rot = 4363
							flags = 259
							a = 55
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon006`
							x_trans = -23
							y_trans = -14
							x_scale = 83
							y_scale = 44
							rot = 43
							flags = 259
							a = 55
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon003`
							x_trans = -8
							y_trans = -31
							x_scale = 74
							y_scale = 33
							rot = 3193
							flags = 259
							a = 55
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_24Fret_Ibanez04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
					material = GTR_Fretboard24_04_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR77_Neckhead_01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR75_Neckhead_d`
					material = GTR77_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR75_Neckhead_LD02`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR75_bridge2
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR76_pickupB
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			Pop
			Punk
			rock
		]
		CAS_Guitar_Body = {
			desc_id = GTR76_IBZ_S5470
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR76_IBZ_S5470_d`
					material = GTR76_IBZ_S5470_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR76_IBZ_S5470_LD05`
							flags = 4
						}
					]
					layers = [
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = red_4
							a = 40
							y_trans = -46
							x_scale = 1
							y_scale = 96
							rot = 2233
							flags = 259
							x_trans = -33
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = red_4
							a = 40
							x_trans = -28
							y_trans = -34
							x_scale = 2
							rot = 2233
							flags = 259
							y_scale = 103
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 40
							x_trans = -30
							y_trans = -3
							x_scale = 2
							y_scale = 97
							rot = 2233
							flags = 259
							Color = red_4
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = red_4
							a = 40
							x_trans = -16
							y_trans = 28
							y_scale = 97
							rot = 2233
							flags = 259
							x_scale = 2
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = red_4
							a = 40
							x_trans = -18
							x_scale = 1
							y_scale = 97
							rot = 2233
							flags = 259
							y_trans = 19
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = red_4
							a = 40
							x_trans = 8
							y_trans = 36
							y_scale = 30
							rot = 2233
							flags = 259
							x_scale = 1
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = red_4
							a = 40
							x_trans = 0
							y_trans = 31
							x_scale = 3
							rot = 2233
							flags = 259
							y_scale = 31
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 40
							x_trans = -24
							y_trans = 0
							x_scale = 1
							y_scale = 97
							rot = 2233
							flags = 259
							Color = red_4
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = red_4
							a = 40
							x_trans = -18
							y_trans = 3
							y_scale = 100
							rot = 2233
							flags = 259
							x_scale = 6
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 25
							x_trans = -41
							y_trans = 37
							y_scale = 1
							rot = 2443
							flags = 259
							x_scale = 46
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 25
							x_trans = 5
							y_trans = -31
							x_scale = 22
							rot = 2443
							flags = 259
							y_scale = 1
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 25
							x_trans = 0
							y_trans = -26
							x_scale = 23
							y_scale = 3
							rot = 2443
							flags = 259
							Color = grey_4guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 25
							x_trans = -37
							y_trans = 28
							y_scale = 3
							rot = 2443
							flags = 259
							x_scale = 65
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 25
							x_trans = -26
							x_scale = 97
							y_scale = 3
							rot = 2443
							flags = 259
							y_trans = 12
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 25
							y_trans = -4
							x_scale = 97
							y_scale = 3
							rot = 2443
							flags = 259
							x_trans = -6
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 25
							y_trans = -7
							x_scale = 97
							y_scale = 1
							rot = 2443
							flags = 259
							x_trans = -13
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 25
							x_trans = -24
							y_trans = 0
							x_scale = 97
							rot = 2443
							flags = 259
							y_scale = 1
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 25
							x_trans = -20
							y_trans = -7
							y_scale = 6
							rot = 2443
							flags = 259
							x_scale = 97
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_24Fret_Ibanez04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
					material = GTR_Fretboard24_04_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR76_Neckhead_01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR76_Neckhead_d`
					material = GTR76_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR76_Neckhead_LD02`
							flags = 36
						}
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR76_Neckhead_LD03`
							flags = 36
						}
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR76_Neckhead_DTL01`
							flags = 36
						}
					]
				}
			]
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR77_bridge
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_04
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_EMG_pickup4
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = GTR76_Switch
		}
	}
	{
		genre = [
			Pop
			Punk
			rock
		]
		CAS_Guitar_Body = {
			desc_id = GTR76_IBZ_S5470
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR76_IBZ_S5470_d`
					material = GTR76_IBZ_S5470_Primary
					diffuse
					layers = [
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = red_4
							a = 40
							y_trans = -46
							x_scale = 1
							y_scale = 96
							rot = 2233
							flags = 259
							x_trans = -33
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = red_4
							a = 40
							x_trans = -28
							y_trans = -34
							x_scale = 2
							rot = 2233
							flags = 259
							y_scale = 103
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 40
							x_trans = -30
							y_trans = -3
							x_scale = 2
							y_scale = 97
							rot = 2233
							flags = 259
							Color = red_4
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = red_4
							a = 40
							x_trans = -16
							y_trans = 28
							y_scale = 97
							rot = 2233
							flags = 259
							x_scale = 2
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = red_4
							a = 40
							x_trans = -18
							x_scale = 1
							y_scale = 97
							rot = 2233
							flags = 259
							y_trans = 19
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = red_4
							a = 40
							x_trans = 8
							y_trans = 36
							y_scale = 30
							rot = 2233
							flags = 259
							x_scale = 1
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = red_4
							a = 40
							x_trans = 0
							y_trans = 31
							x_scale = 3
							rot = 2233
							flags = 259
							y_scale = 31
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 40
							x_trans = -24
							y_trans = 0
							x_scale = 1
							y_scale = 97
							rot = 2233
							flags = 259
							Color = red_4
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = red_4
							a = 40
							x_trans = -18
							y_trans = 3
							y_scale = 100
							rot = 2233
							flags = 259
							x_scale = 6
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 25
							x_trans = -41
							y_trans = 37
							y_scale = 1
							rot = 2443
							flags = 259
							x_scale = 46
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 25
							x_trans = 5
							y_trans = -31
							x_scale = 22
							rot = 2443
							flags = 259
							y_scale = 1
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 25
							x_trans = 0
							y_trans = -26
							x_scale = 23
							y_scale = 3
							rot = 2443
							flags = 259
							Color = grey_4guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 25
							x_trans = -37
							y_trans = 28
							y_scale = 3
							rot = 2443
							flags = 259
							x_scale = 65
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 25
							x_trans = -26
							x_scale = 97
							y_scale = 3
							rot = 2443
							flags = 259
							y_trans = 12
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 25
							y_trans = -4
							x_scale = 97
							y_scale = 3
							rot = 2443
							flags = 259
							x_trans = -6
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 25
							y_trans = -7
							x_scale = 97
							y_scale = 1
							rot = 2443
							flags = 259
							x_trans = -13
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 25
							x_trans = -24
							y_trans = 0
							x_scale = 97
							rot = 2443
							flags = 259
							y_scale = 1
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 25
							x_trans = -20
							y_trans = -7
							y_scale = 6
							rot = 2443
							flags = 259
							x_scale = 97
						}
					]
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR76_IBZ_S5470_LD05`
							flags = 4
							Color = teal_1
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_24Fret_Ibanez04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
					material = GTR_Fretboard24_04_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR76_Neckhead_01
			chosen_materials = {
				material1 = grey_2guitar
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR76_Neckhead_d`
					material = GTR76_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR76_Neckhead_LD02`
							flags = 36
							Color = teal_1
						}
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR76_Neckhead_LD03`
							flags = 36
						}
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR76_Neckhead_DTL01`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR77_bridge
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_04
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_EMG_pickup4
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = GTR76_Switch
		}
	}
	{
		genre = [
			Pop
			`Glam	Rock`
		]
		CAS_Guitar_Body = {
			desc_id = GTR77_IBZ_RG
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR77_IBZ_RG_d`
					material = GTR77_IBZ_RG_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR77_IBZ_RG_LD02`
							flags = 4
							Color = navy_1
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_24Fret_Ibanez02
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d2_02`
					material = GTR_Fretboard24_02_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD68_IBZ_Sharktooth`
							flags = 36
							Color = navy_1
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR77_Neckhead_01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR75_Neckhead_d`
					material = GTR77_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR75_Neckhead_LD03`
							flags = 36
							Color = navy_1
						}
					]
				}
			]
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_Guitar_Pickguards = {
			desc_id = GTR77_IBZ_RG_PG
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR77_IBZ_RG_PG_d`
					material = GTR77_IBZ_RG_PG_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR77_IBZ_RG_PG_LD01`
							flags = 4
							Color = navy_1
						}
					]
				}
			]
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR75_bridge2
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_10
			chosen_materials = {
				material1 = navy_1
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR76_pickupB
			chosen_materials = {
				material1 = navy_1
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			Pop
			`Glam	Rock`
		]
		CAS_Guitar_Body = {
			desc_id = GTR77_IBZ_RG
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR77_IBZ_RG_d`
					material = GTR77_IBZ_RG_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR77_IBZ_RG_LD02`
							flags = 4
							Color = red_1
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_24Fret_Ibanez02
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d2_02`
					material = GTR_Fretboard24_02_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD68_IBZ_Sharktooth`
							flags = 36
							Color = red_1
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR77_Neckhead_01
			chosen_materials = {
				material1 = grey_2guitar
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR75_Neckhead_d`
					material = GTR77_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR75_Neckhead_LD03`
							flags = 36
							Color = red_1
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = GTR77_IBZ_RG_PG
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR77_IBZ_RG_PG_d`
					material = GTR77_IBZ_RG_PG_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR77_IBZ_RG_PG_LD01`
							flags = 4
							Color = red_1
						}
					]
				}
			]
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR75_bridge2
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_10
			chosen_materials = {
				material1 = red_1
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR76_pickupB
			chosen_materials = {
				material1 = red_1
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			Pop
			rock
		]
		CAS_Guitar_Body = {
			desc_id = GTR77_IBZ_RG
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR77_IBZ_RG_d`
					material = GTR77_IBZ_RG_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR77_IBZ_RG_LD02`
							flags = 4
							Color = orange_2
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_24Fret_Ibanez02
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d2_02`
					material = GTR_Fretboard24_02_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_2
							texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR77_Neckhead_01
			chosen_materials = {
				material1 = grey_2guitar
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR75_Neckhead_d`
					material = GTR77_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR75_Neckhead_LD03`
							flags = 36
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = GTR77_IBZ_RG_PG
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR77_IBZ_RG_PG_d`
					material = GTR77_IBZ_RG_PG_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR77_IBZ_RG_PG_LD01`
							flags = 4
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR75_bridge2
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR76_pickupB
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			Pop
			rock
		]
		CAS_Guitar_Body = {
			desc_id = GTR77_IBZ_RG
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR77_IBZ_RG_d`
					material = GTR77_IBZ_RG_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR77_IBZ_RG_LD02`
							flags = 4
							Color = navy_1
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_24Fret_Ibanez02
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d2_02`
					material = GTR_Fretboard24_02_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_2
							texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR77_Neckhead_01
			chosen_materials = {
				material1 = grey_2guitar
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR75_Neckhead_d`
					material = GTR77_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR75_Neckhead_LD03`
							flags = 36
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = GTR77_IBZ_RG_PG
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR77_IBZ_RG_PG_d`
					material = GTR77_IBZ_RG_PG_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR77_IBZ_RG_PG_LD01`
							flags = 4
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR75_bridge2
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR76_pickupB
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			rock
			Goth
		]
		CAS_Guitar_Body = {
			desc_id = GTR77_IBZ_RG
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR77_IBZ_RG_d`
					material = GTR77_IBZ_RG_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR77_IBZ_RG_LD02`
							flags = 4
							Color = grey_3guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_24Fret_Ibanez02
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d2_02`
					material = GTR_Fretboard24_02_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_2
							texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD69_IBZ_Sharktooth2`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR77_Neckhead_01
			chosen_materials = {
				material1 = grey_2guitar
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR75_Neckhead_d`
					material = GTR77_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR75_Neckhead_LD03`
							flags = 36
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = GTR77_IBZ_RG_PG
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR77_IBZ_RG_PG_d`
					material = GTR77_IBZ_RG_PG_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR77_IBZ_RG_PG_LD01`
							flags = 4
							Color = grey_2guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR75_bridge2
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01
			chosen_materials = {
				material1 = grey_3guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR76_pickupB
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			rock
			Goth
		]
		CAS_Guitar_Body = {
			desc_id = GTR77_IBZ_RG
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR77_IBZ_RG_d`
					material = GTR77_IBZ_RG_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR77_IBZ_RG_LD03`
							flags = 4
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_24Fret_Ibanez04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
					material = GTR_Fretboard24_04_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR77_Neckhead_01
			chosen_materials = {
				material1 = grey_2guitar
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR75_Neckhead_d`
					material = GTR77_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR75_Neckhead_LD03`
							flags = 36
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR75_bridge2
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_pickup_SD06
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			rock
			`Heavy	Metal`
			Punk
		]
		CAS_Guitar_Body = {
			desc_id = GTR77_IBZ_RG
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR77_IBZ_RG_d`
					material = GTR77_IBZ_RG_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR77_IBZ_RG_LD02`
							flags = 4
						}
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR77_IBZ_RG_DTL8B`
							flags = 4
							Color = grey_2guitar
						}
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR77_IBZ_RG_DTL8A`
							flags = 4
							Color = grey_5guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_24Fret_Ibanez04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
					material = GTR_Fretboard24_04_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD68_IBZ_Sharktooth`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR77_Neckhead_01
			chosen_materials = {
				material1 = grey_2guitar
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR75_Neckhead_d`
					material = GTR77_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR75_Neckhead_LD03`
							flags = 36
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR75_bridge2
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR76_pickupB
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			rock
			`Heavy	Metal`
			Punk
		]
		CAS_Guitar_Body = {
			desc_id = GTR77_IBZ_RG
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR77_IBZ_RG_d`
					material = GTR77_IBZ_RG_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR77_IBZ_RG_LD02`
							flags = 4
						}
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR77_IBZ_RG_DTL8B`
							flags = 4
							Color = green_1guitar
						}
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR77_IBZ_RG_DTL8A`
							flags = 4
							Color = yellow_green_2guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_24Fret_Ibanez02
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d2_02`
					material = GTR_Fretboard24_02_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD68_IBZ_Sharktooth`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR77_Neckhead_01
			chosen_materials = {
				material1 = grey_2guitar
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR75_Neckhead_d`
					material = GTR77_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR75_Neckhead_LD03`
							flags = 36
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR75_bridge2
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR76_pickupB
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Classic	Rock`
		]
		CAS_Guitar_Body = {
			desc_id = GTR77_IBZ_RG
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR77_IBZ_RG_d`
					material = GTR77_IBZ_RG_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR77_IBZ_RG_LD08`
							flags = 4
						}
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR77_IBZ_RG_DTL03`
							flags = 4
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_24Fret_Ibanez02
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d2_02`
					material = GTR_Fretboard24_02_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD68_IBZ_Sharktooth`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR77_Neckhead_01
			chosen_materials = {
				material1 = grey_2guitar
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR75_Neckhead_d`
					material = GTR77_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR75_Neckhead_LD03`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR75_bridge2
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_pickup_SD06
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			Goth
			Pop
		]
		CAS_Guitar_Body = {
			desc_id = GTR77_IBZ_RG
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR77_IBZ_RG_d`
					material = GTR77_IBZ_RG_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR77_IBZ_RG_LD02`
							flags = 4
							Color = grey_5guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_24Fret_Ibanez02
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d2_02`
					material = GTR_Fretboard24_02_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD68_IBZ_Sharktooth`
							flags = 36
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR77_Neckhead_01
			chosen_materials = {
				material1 = grey_3guitar
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR75_Neckhead_d`
					material = GTR77_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR75_Neckhead_LD02`
							flags = 36
							Color = grey_5guitar
						}
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR75_Neckhead_DTL01`
							flags = 36
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR75_bridge2
			chosen_materials = {
				material1 = grey_3guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01
			chosen_materials = {
				material1 = grey_3guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_pickup_SD05B
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Classic	Rock`
			Punk
			rock
		]
		CAS_Guitar_Body = {
			desc_id = GTR77_IBZ_RG
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR77_IBZ_RG_d`
					material = GTR77_IBZ_RG_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR77_IBZ_RG_LD03`
							flags = 4
							Color = red_1
						}
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR77_IBZ_RG_DTL03`
							flags = 4
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_24Fret_Ibanez04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
					material = GTR_Fretboard24_04_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR77_Neckhead_01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR75_Neckhead_d`
					material = GTR77_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR75_Neckhead_LD04`
							flags = 36
							Color = red_1
						}
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR75_Neckhead_DTL03`
							flags = 36
							Color = Black_1guitar
						}
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR75_Neckhead_DTL01`
							flags = 36
							Color = Black_1guitar
						}
					]
				}
			]
			chosen_materials = {
				material1 = grey_4guitar
			}
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR77_bridge
			chosen_materials = {
				material1 = grey_4guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01
			chosen_materials = {
				material1 = grey_3guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_pickup_SD05B
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			Pop
			`Glam	Rock`
		]
		CAS_Guitar_Body = {
			desc_id = GTR77_IBZ_RG
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR77_IBZ_RG_d`
					material = GTR77_IBZ_RG_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR77_IBZ_RG_LD04`
							a = 75
							flags = 4
							Color = teal_1
						}
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR77_IBZ_RG_DTL03`
							flags = 4
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_24Fret_Ibanez04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
					material = GTR_Fretboard24_04_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD67_IBZ_SOval`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR77_Neckhead_01
			chosen_materials = {
				material1 = grey_4guitar
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR75_Neckhead_d`
					material = GTR77_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR75_Neckhead_LD01`
							a = 85
							flags = 36
							Color = teal_1
						}
						{
							texture = `tex/models/Characters/Layers/CAG/All_Clear2`
							flags = 4
						}
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR75_Neckhead_DTL02`
							flags = 36
						}
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR75_Neckhead_DTL01`
							flags = 36
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR77_bridge
			chosen_materials = {
				material1 = grey_4guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01
			chosen_materials = {
				material1 = grey_3guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_pickup_SD05B
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Classic	Rock`
			rock
		]
		CAS_Guitar_Body = {
			desc_id = GTR76_IBZ_S5470
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR76_IBZ_S5470_d`
					material = GTR76_IBZ_S5470_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR76_IBZ_S5470_LD03`
							flags = 4
							Color = red_1
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_24Fret_Ibanez04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
					material = GTR_Fretboard24_04_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR76_Neckhead_01
			chosen_materials = {
				material1 = grey_2guitar
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR76_Neckhead_d`
					material = GTR76_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR76_Neckhead_LD04`
							flags = 36
							Color = red_2
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR75_bridge2
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR76_pickupA
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = GTR76_Switch
		}
	}
	{
		genre = [
			`Classic	Rock`
			rock
			Punk
		]
		CAS_Guitar_Body = {
			desc_id = GTR76_IBZ_S5470
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR76_IBZ_S5470_d`
					material = GTR76_IBZ_S5470_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR76_IBZ_S5470_LD06`
							flags = 4
							Color = grey_4guitar
						}
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR76_IBZ_S5470_DTL01`
							flags = 4
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_24Fret_Ibanez04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
					material = GTR_Fretboard24_04_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD67_IBZ_SOval`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR76_Neckhead_01
			chosen_materials = {
				material1 = grey_2guitar
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR76_Neckhead_d`
					material = GTR76_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR76_Neckhead_LD01`
							flags = 36
						}
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR76_Neckhead_LD03`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR75_bridge2
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR76_pickupA
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = GTR76_Switch
		}
	}
	{
		genre = [
			`Glam	Rock`
			rock
			Pop
		]
		CAS_Guitar_Body = {
			desc_id = GTR76_IBZ_S5470
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR76_IBZ_S5470_d`
					material = GTR76_IBZ_S5470_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR76_IBZ_S5470_LD02`
							flags = 4
							Color = blue_3
						}
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR76_IBZ_S5470_DTL03`
							Color = navy_1
							flags = 4
							a = 85
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_24Fret_Ibanez01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d1_02`
					material = GTR_Fretboard24_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR76_Neckhead_01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR76_Neckhead_d`
					material = GTR76_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR76_Neckhead_LD01`
							flags = 36
							Color = blue_1
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR75_bridge2
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR76_pickupA
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = GTR76_Switch
		}
	}
	{
		genre = [
			`Glam	Rock`
			`Classic	Rock`
			Pop
		]
		CAS_Guitar_Body = {
			desc_id = GTR76_IBZ_S5470
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR76_IBZ_S5470_d`
					material = GTR76_IBZ_S5470_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR76_IBZ_S5470_LD02`
							flags = 4
							Color = red_orange_4
						}
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR76_IBZ_S5470_DTL03`
							a = 85
							flags = 4
							Color = red_1
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_24Fret_Ibanez04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
					material = GTR_Fretboard24_04_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR76_Neckhead_01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR76_Neckhead_d`
					material = GTR76_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR76_Neckhead_LD01`
							flags = 36
							Color = red_orange_2
						}
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR76_Neckhead_DTL01`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR75_bridge2
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR76_pickupA
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = GTR76_Switch
		}
	}
	{
		genre = [
			`Heavy	Metal`
			Punk
			Goth
		]
		CAS_Guitar_Body = {
			desc_id = GTR76_IBZ_S5470
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR76_IBZ_S5470_d`
					material = GTR76_IBZ_S5470_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR76_IBZ_S5470_LD05`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_24Fret_Ibanez01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d1_02`
					material = GTR_Fretboard24_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD60_IBZ_SSpecial`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR76_Neckhead_01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR76_Neckhead_d`
					material = GTR76_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR76_Neckhead_LD02`
							flags = 36
						}
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR76_Neckhead_LD03`
							flags = 36
						}
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR76_Neckhead_DTL01`
							flags = 36
						}
					]
				}
			]
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR75_bridge2
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_EMG_pickup2
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = GTR76_Switch
		}
	}
	{
		genre = [
			Pop
			rock
		]
		CAS_Guitar_Body = {
			desc_id = GTR76_IBZ_S5470
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR76_IBZ_S5470_d`
					material = GTR76_IBZ_S5470_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR76_IBZ_S5470_LD05`
							flags = 4
							Color = grey_5guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_24Fret_Ibanez04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
					material = GTR_Fretboard24_04_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR76_Neckhead_01
			chosen_materials = {
				material1 = grey_4guitar
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR76_Neckhead_d`
					material = GTR76_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR76_Neckhead_LD01`
							flags = 36
						}
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR76_Neckhead_LD03`
							flags = 36
						}
						{
							texture = `tex/models/Characters/Layers/CAG/All_Clear2`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR75_bridge2
			chosen_materials = {
				material1 = grey_4guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01
			chosen_materials = {
				material1 = grey_4guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_EMG_pickup2
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = GTR76_Switch
		}
	}
	{
		genre = [
			`Classic	Rock`
		]
		CAS_Guitar_Body = {
			desc_id = GTR76_IBZ_S5470
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR76_IBZ_S5470_d`
					material = GTR76_IBZ_S5470_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR76_IBZ_S5470_LD03`
							flags = 4
							Color = yellow_orange_1
						}
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR76_IBZ_S5470_DTL03`
							flags = 4
							Color = Black_1guitar
						}
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR76_IBZ_S5470_DTL02`
							Color = grey_4guitar
							flags = 4
							a = 50
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_24Fret_Ibanez02
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d2_02`
					material = GTR_Fretboard24_02_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD61_IBZ_SASSpecial`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR76_Neckhead_01
			chosen_materials = {
				material1 = grey_4guitar
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR76_Neckhead_d`
					material = GTR76_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR76_Neckhead_LD04`
							flags = 36
						}
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR76_Neckhead_LD03`
							flags = 36
						}
						{
							texture = `tex/models/Characters/Layers/CAG/All_Clear2`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR75_bridge2
			chosen_materials = {
				material1 = grey_4guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01
			chosen_materials = {
				material1 = grey_4guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_EMG_pickup2
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = GTR76_Switch
		}
	}
	{
		genre = [
			`Classic	Rock`
			rock
		]
		CAS_Guitar_Body = {
			desc_id = GTR76_IBZ_S5470
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR76_IBZ_S5470_d`
					material = GTR76_IBZ_S5470_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR76_IBZ_S5470_LD03`
							flags = 4
							Color = red_1
						}
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR76_IBZ_S5470_DTL03`
							flags = 4
							Color = Black_1guitar
						}
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR76_IBZ_S5470_DTL02`
							Color = grey_4guitar
							flags = 4
							a = 50
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_24Fret_Ibanez02
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d2_02`
					material = GTR_Fretboard24_02_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR76_Neckhead_01
			chosen_materials = {
				material1 = grey_4guitar
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR76_Neckhead_d`
					material = GTR76_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR76_Neckhead_LD01`
							flags = 36
							Color = red_1
						}
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR76_Neckhead_DTL03`
							flags = 36
							Color = Black_1guitar
						}
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR76_Neckhead_DTL01`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR75_bridge2
			chosen_materials = {
				material1 = grey_4guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01
			chosen_materials = {
				material1 = grey_4guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_EMG_pickup2
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = GTR76_Switch
		}
	}
	{
		genre = [
			`Classic	Rock`
			rock
		]
		CAS_Guitar_Body = {
			desc_id = GTR76_IBZ_S5470
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR76_IBZ_S5470_d`
					material = GTR76_IBZ_S5470_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR76_IBZ_S5470_LD03`
							flags = 4
							Color = green_1guitar
						}
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR76_IBZ_S5470_DTL03`
							flags = 4
							Color = Black_1guitar
						}
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR76_IBZ_S5470_DTL02`
							Color = grey_4guitar
							flags = 4
							a = 50
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_24Fret_Ibanez02
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d2_02`
					material = GTR_Fretboard24_02_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR76_Neckhead_01
			chosen_materials = {
				material1 = grey_4guitar
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR76_Neckhead_d`
					material = GTR76_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR76_Neckhead_LD01`
							flags = 36
							Color = green_1guitar
						}
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR76_Neckhead_DTL03`
							flags = 36
							Color = Black_1guitar
						}
						{
							texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR76_Neckhead_DTL01`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR75_bridge2
			chosen_materials = {
				material1 = grey_4guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01
			chosen_materials = {
				material1 = grey_4guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_EMG_pickup2
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = GTR76_Switch
		}
	}
	{
		genre = [
			rock
			Punk
			Pop
		]
		CAS_Guitar_Body = {
			desc_id = GTR84_MM_Petrucci
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/MM/gtr84_mm_petrucci`
					material = GTR84_MM_Pet_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/MM/GTR84_MM_LD06`
							flags = 4
							Color = Blue_2
						}
					]
					layers = [
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_007`
							x_trans = 2
							y_trans = -53
							x_scale = 57
							y_scale = 61
							rot = 2263
							flags = 259
							Color = red_3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_007`
							x_trans = 35
							y_trans = -19
							x_scale = 57
							y_scale = 61
							rot = 2263
							flags = 259
							Color = yellow_green_2guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_007`
							Color = yellow_3guitar
							x_trans = 7
							y_trans = 31
							x_scale = 57
							y_scale = 61
							rot = 2263
							flags = 259
							a = 100
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_007`
							x_trans = -52
							y_trans = 52
							x_scale = 57
							y_scale = 61
							rot = 2263
							flags = 259
							Color = red_2
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_007`
							x_trans = -47
							y_trans = -66
							x_scale = 57
							y_scale = 61
							rot = 2263
							flags = 259
							Color = yellow_3guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_007`
							x_trans = -26
							y_trans = -3
							x_scale = 57
							y_scale = 61
							rot = 2263
							flags = 259
							Color = red_2
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_007`
							a = 25
							x_trans = -26
							y_trans = -1
							x_scale = 39
							y_scale = 39
							rot = 3073
							flags = 259
							Color = red_5
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_007`
							Color = red_4
							x_trans = -26
							y_trans = -1
							x_scale = 32
							y_scale = 32
							rot = 3463
							flags = 259
							a = 40
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_007`
							x_trans = -26
							y_trans = 0
							x_scale = 26
							y_scale = 25
							rot = 570
							flags = 259
							Color = red_4
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_007`
							Color = red_5
							x_trans = -26
							y_trans = 0
							x_scale = 21
							y_scale = 21
							rot = 960
							flags = 259
							a = 30
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_007`
							x_trans = -26
							y_trans = 0
							x_scale = 16
							y_scale = 16
							rot = 1170
							flags = 259
							Color = red_5
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_003`
							Color = Blue_2
							y_trans = -35
							x_scale = 29
							y_scale = 33
							rot = 3853
							flags = 259
							x_trans = -42
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_023`
							x_trans = -39
							y_trans = 26
							x_scale = 49
							y_scale = 18
							rot = 2623
							flags = 259
							Color = yellow_3guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_24Fret_MM02
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d2_02`
					material = GTR_Fretboard24_02_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_2
							texture = `tex/models/Characters/Layers/CAG/MM/GTR84_MMInlayPet24B`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR84_Neckhead01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/MM/gtr84_neckhead01`
					material = GTR84_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/MM/GTR84_Nekhed_DTL10`
							flags = 36
						}
						{
							texture = `tex/models/Characters/Layers/CAG/MM/GTR84_Nekhed_DTL03`
							flags = 36
							Color = blue_3
						}
					]
				}
			]
			chosen_materials = {
				material1 = yellow_3guitar
			}
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR86_Bridge
			chosen_materials = {
				material1 = yellow_3guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_04
			chosen_materials = {
				material1 = red_1
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR86_pickup
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = GTR_Misc_Switch4
		}
	}
	{
		genre = [
			Pop
			`Glam	Rock`
		]
		CAS_Guitar_Body = {
			desc_id = GTR82_PRS_SE1
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/PRS/prs_82_prs_se1`
					material = GTR82_PRS_SE1_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/PRS/GTR82_PRS_SE1_LD01`
							flags = 4
						}
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/GTR78_PRS_SC_DTL12`
							Color = teal_1
							flags = 4
							a = 50
						}
					]
					layers = [
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = teal_4
							x_trans = 5
							x_scale = 11
							y_scale = 1
							rot = 1603
							flags = 259
							y_trans = 28
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = teal_4
							y_trans = 8
							x_scale = 28
							y_scale = 1
							rot = 1603
							flags = 259
							x_trans = -3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = teal_4
							x_trans = -9
							x_scale = 23
							y_scale = 1
							rot = 1603
							flags = 259
							y_trans = 20
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = teal_4
							y_trans = 11
							x_scale = 41
							y_scale = 1
							rot = 1603
							flags = 259
							x_trans = -20
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = teal_4
							x_trans = -30
							y_trans = 33
							y_scale = 1
							rot = 1603
							flags = 259
							x_scale = 23
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = teal_4
							x_trans = -42
							x_scale = 41
							y_scale = 1
							rot = 1603
							flags = 259
							y_trans = 11
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							x_trans = -36
							y_trans = 23
							x_scale = 33
							y_scale = 1
							rot = 1603
							flags = 259
							Color = teal_4
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = red_3
							x_trans = -39
							x_scale = 33
							y_scale = 1
							rot = 1603
							flags = 259
							y_trans = -17
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = red_3
							x_trans = -32
							x_scale = 15
							y_scale = 1
							rot = 1603
							flags = 259
							y_trans = -37
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = red_3
							y_trans = -27
							x_scale = 27
							y_scale = 1
							rot = 1603
							flags = 259
							x_trans = -28
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = red_3
							x_trans = -25
							x_scale = 51
							y_scale = 1
							rot = 1603
							flags = 259
							y_trans = -8
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = red_3
							x_trans = -14
							x_scale = 46
							y_scale = 1
							rot = 1603
							flags = 259
							y_trans = -11
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = red_3
							x_trans = 0
							x_scale = 34
							y_scale = 1
							rot = 1603
							flags = 259
							y_trans = -13
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = teal_4
							y_trans = 17
							x_scale = 4
							y_scale = 6
							rot = 1603
							flags = 259
							x_trans = 5
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = teal_4
							y_trans = -14
							x_scale = 4
							y_scale = 6
							rot = 1603
							flags = 259
							x_trans = -3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = teal_4
							x_trans = -9
							x_scale = 4
							y_scale = 6
							rot = 1603
							flags = 259
							y_trans = -1
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = teal_4
							x_trans = -20
							x_scale = 4
							y_scale = 6
							rot = 1603
							flags = 259
							y_trans = -21
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = teal_4
							x_trans = -30
							x_scale = 4
							y_scale = 6
							rot = 1603
							flags = 259
							y_trans = 12
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = teal_4
							x_trans = -42
							x_scale = 4
							y_scale = 6
							rot = 1603
							flags = 259
							y_trans = -21
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = teal_4
							y_trans = -5
							x_scale = 4
							y_scale = 6
							rot = 1603
							flags = 259
							x_trans = -36
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = red_3
							x_trans = -39
							x_scale = 4
							y_scale = 6
							rot = 1603
							flags = 259
							y_trans = 9
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = red_3
							x_trans = -32
							y_trans = -24
							x_scale = 4
							y_scale = 6
							rot = 1603
							flags = 259
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = red_3
							y_trans = -7
							x_scale = 4
							y_scale = 6
							rot = 1603
							flags = 259
							x_trans = -28
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = red_3
							y_trans = 30
							x_scale = 4
							y_scale = 6
							rot = 1603
							flags = 259
							x_trans = -24
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = red_3
							x_trans = -14
							y_trans = 25
							x_scale = 4
							y_scale = 6
							rot = 1603
							flags = 259
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = red_3
							x_trans = 1
							x_scale = 4
							y_scale = 6
							rot = 1603
							flags = 259
							y_trans = 14
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_24Fret_PRS04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
					material = GTR_Fretboard24_04_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_3guitar
							texture = `tex/models/Characters/Layers/CAG/PRS/24fret_LD81_PRS_HLND`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR82_Neckhead01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/PRS/gtr82_neckhead_01`
					material = GTR82_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/PRS/GTR82_Neckhead_01_LD02`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR81_Bridge01
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_Tophat
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_pickup_soapbar
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			Pop
			`Glam	Rock`
		]
		CAS_Guitar_Body = {
			desc_id = GTR82_PRS_SE1
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/PRS/prs_82_prs_se1`
					material = GTR82_PRS_SE1_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/GTR82_PRS_SE1_LD01`
							flags = 4
							Color = purple_blue_1
						}
					]
					layers = [
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							x_trans = -18
							y_trans = 0
							x_scale = 60
							y_scale = 124
							rot = 1603
							flags = 259
							Color = navy_1
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShapeGradient_002`
							a = 45
							x_trans = 10
							y_trans = 15
							x_scale = 20
							y_scale = 35
							rot = 1603
							flags = 3
							Color = Black_1guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShapeGradient_002`
							a = 45
							x_trans = -7
							y_trans = 15
							x_scale = 20
							y_scale = 35
							rot = 1603
							flags = 3
							Color = Black_1guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShapeGradient_002`
							a = 45
							x_trans = -8
							y_trans = -15
							x_scale = 20
							y_scale = 33
							rot = 1603
							flags = 3
							Color = Black_1guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShapeGradient_002`
							a = 45
							x_trans = -24
							y_trans = -45
							x_scale = 20
							y_scale = 33
							rot = 1603
							flags = 3
							Color = Black_1guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShapeGradient_002`
							a = 45
							x_trans = -40
							y_trans = -42
							x_scale = 20
							y_scale = 33
							rot = 1603
							flags = 3
							Color = Black_1guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShapeGradient_002`
							Color = Black_1guitar
							x_trans = -40
							y_trans = -12
							x_scale = 20
							y_scale = 33
							rot = 1603
							flags = 3
							a = 55
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShapeGradient_002`
							a = 45
							x_trans = -24
							y_trans = -14
							x_scale = 20
							y_scale = 33
							rot = 1603
							flags = 3
							Color = Black_1guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShapeGradient_002`
							a = 50
							x_trans = -24
							y_trans = 16
							x_scale = 19
							y_scale = 32
							rot = 1603
							flags = 3
							Color = Black_1guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShapeGradient_002`
							a = 50
							x_trans = -40
							y_trans = 18
							x_scale = 19
							y_scale = 32
							rot = 1603
							flags = 3
							Color = Black_1guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShapeGradient_002`
							a = 50
							x_trans = -39
							y_trans = 47
							x_scale = 19
							y_scale = 32
							rot = 1603
							flags = 3
							Color = Black_1guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShapeGradient_002`
							a = 50
							x_trans = -24
							y_trans = 45
							x_scale = 19
							y_scale = 32
							rot = 1603
							flags = 3
							Color = Black_1guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							x_trans = -17
							y_trans = 30
							x_scale = 1
							y_scale = 119
							rot = 1603
							flags = 259
							Color = yellow_2guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							x_trans = -19
							y_trans = 1
							x_scale = 1
							y_scale = 119
							rot = 1603
							flags = 259
							Color = yellow_2guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							x_trans = -19
							y_trans = -30
							x_scale = 1
							y_scale = 119
							rot = 1603
							flags = 259
							Color = yellow_2guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							x_trans = -32
							y_trans = 3
							x_scale = 67
							y_scale = 1
							rot = 1603
							flags = 259
							Color = yellow_2guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							x_trans = -16
							y_trans = 3
							x_scale = 67
							y_scale = 1
							rot = 1603
							flags = 259
							Color = yellow_2guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							x_trans = 1
							y_trans = 3
							x_scale = 52
							y_scale = 1
							rot = 1603
							flags = 259
							Color = yellow_2guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon011`
							x_trans = -28
							y_trans = 32
							x_scale = 84
							y_scale = 80
							rot = 373
							flags = 259
							Color = yellow_2guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon004`
							x_trans = -36
							y_trans = -26
							x_scale = 41
							y_scale = 78
							rot = 2353
							flags = 267
							Color = yellow_2guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon007`
							x_trans = -47
							y_trans = 4
							x_scale = 57
							y_scale = 57
							rot = 913
							flags = 259
							Color = yellow_2guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon004`
							x_trans = 5
							y_trans = 20
							x_scale = 27
							y_scale = 45
							rot = 1603
							flags = 259
							Color = yellow_2guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							x_trans = -8
							y_trans = -34
							x_scale = 22
							y_scale = 68
							rot = 1243
							flags = 259
							Color = yellow_2guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon010`
							x_trans = -11
							y_trans = 23
							x_scale = 40
							y_scale = 27
							rot = 3343
							flags = 259
							Color = yellow_2guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics014`
							a = 60
							x_trans = -34
							y_trans = 7
							x_scale = 3
							rot = 1603
							flags = 3
							y_scale = 4
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics014`
							a = 60
							x_trans = -34
							y_trans = 27
							x_scale = 3
							y_scale = 4
							rot = 1603
							flags = 3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics014`
							a = 60
							x_trans = -34
							y_trans = 36
							x_scale = 3
							y_scale = 4
							rot = 1603
							flags = 3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics014`
							a = 60
							x_trans = -29
							y_trans = 36
							x_scale = 3
							y_scale = 4
							rot = 1603
							flags = 3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics014`
							a = 60
							x_trans = -29
							y_trans = 27
							x_scale = 3
							y_scale = 4
							rot = 1603
							flags = 3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics014`
							a = 60
							x_trans = -29
							y_trans = 7
							x_scale = 3
							y_scale = 4
							rot = 1603
							flags = 3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics014`
							a = 60
							x_trans = -29
							y_trans = -3
							x_scale = 3
							y_scale = 4
							rot = 1603
							flags = 3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics014`
							a = 60
							x_trans = -34
							y_trans = -3
							x_scale = 3
							y_scale = 4
							rot = 1603
							flags = 3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics014`
							a = 60
							x_trans = -34
							x_scale = 3
							y_scale = 4
							rot = 1603
							flags = 3
							y_trans = -24
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics014`
							a = 60
							x_trans = -30
							y_trans = -24
							x_scale = 3
							y_scale = 4
							rot = 1603
							flags = 3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics014`
							a = 60
							x_trans = -30
							y_trans = -33
							x_scale = 3
							y_scale = 4
							rot = 1603
							flags = 3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics014`
							a = 60
							x_trans = -34
							y_trans = -33
							x_scale = 3
							y_scale = 4
							rot = 1603
							flags = 3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics014`
							a = 60
							x_trans = -18
							y_trans = 26
							x_scale = 3
							y_scale = 4
							rot = 1603
							flags = 3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics014`
							a = 60
							y_trans = 24
							x_scale = 3
							y_scale = 4
							rot = 1603
							flags = 3
							x_trans = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_PRS04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
					material = GTR_Fretboard_04_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_3guitar
							texture = `tex/models/Characters/Layers/CAG/PRS/22fret_LD111_PRS_Bird`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR82_Neckhead01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/PRS/gtr82_neckhead_01`
					material = GTR82_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/GTR82_Neckhead_01_LD02`
							flags = 36
							Color = purple_blue_1
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = GTR82_PGuard
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR81_Bridge01
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_Tophat
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_pickup_soapbar
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			Pop
			`Glam	Rock`
			rock
			Punk
		]
		CAS_Guitar_Body = {
			desc_id = GTR79_PRS_CSTM24
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/PRS/prs_ctm24_d`
					material = GTR79_PRS_CST24_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/GTR79_PRS_Ctm24_DTL01`
							flags = 4
							Color = grey_5guitar
						}
					]
					layers = [
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon006`
							x_trans = -37
							y_trans = 6
							x_scale = 73
							y_scale = 86
							rot = 1243
							flags = 259
							Color = grey_4guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon005`
							a = 100
							x_trans = -47
							y_trans = -4
							x_scale = 64
							y_scale = 68
							rot = 1873
							flags = 259
							Color = grey_4guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon005`
							a = 100
							x_trans = -45
							y_trans = -6
							x_scale = 64
							y_scale = 63
							rot = 1873
							flags = 259
							Color = red_3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon002`
							Color = grey_4guitar
							x_trans = -22
							y_trans = 3
							x_scale = 76
							rot = 1153
							flags = 259
							y_scale = 60
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon006`
							x_trans = -36
							y_trans = 8
							x_scale = 73
							y_scale = 76
							rot = 1243
							flags = 259
							Color = red_3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon011`
							x_trans = -9
							y_trans = -1
							x_scale = 63
							y_scale = 150
							rot = 1603
							flags = 259
							Color = grey_4guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon011`
							Color = blue_1
							y_trans = -1
							x_scale = 63
							y_scale = 140
							rot = 1603
							flags = 259
							x_trans = -8
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon013`
							x_trans = -12
							y_trans = -3
							x_scale = 62
							y_scale = 64
							rot = 1603
							flags = 259
							Color = grey_4guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon002`
							Color = red_3
							x_trans = -22
							y_trans = 3
							x_scale = 76
							rot = 1153
							flags = 259
							y_scale = 51
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon013`
							Color = blue_1
							x_trans = -12
							x_scale = 62
							y_scale = 58
							rot = 1603
							flags = 259
							y_trans = -3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon030`
							x_trans = -7
							y_trans = -5
							x_scale = 50
							y_scale = 35
							rot = 1153
							flags = 259
							Color = grey_4guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon030`
							Color = red_3
							x_trans = -7
							y_trans = -5
							x_scale = 50
							y_scale = 30
							flags = 259
							rot = 1153
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							y_trans = 4
							x_scale = 3
							y_scale = 6
							rot = 1543
							flags = 3
							x_trans = -12
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							y_trans = 14
							x_scale = 3
							y_scale = 6
							rot = 2053
							flags = 3
							x_trans = -13
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = -3
							y_trans = -21
							x_scale = 6
							y_scale = 8
							flags = 3
							rot = 3043
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							y_trans = 13
							x_scale = 6
							y_scale = 8
							rot = 2053
							flags = 3
							x_trans = -9
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							y_trans = 20
							x_scale = 3
							y_scale = 5
							rot = 2053
							flags = 3
							x_trans = -11
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = 5
							y_trans = 22
							x_scale = 3
							y_scale = 5
							flags = 3
							rot = 2053
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = 8
							y_trans = 24
							y_scale = 5
							rot = 1603
							flags = 3
							x_scale = 3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = 0
							y_trans = 22
							y_scale = 10
							rot = 1603
							flags = 3
							x_scale = 6
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = -1
							x_skew = -27
							x_scale = 3
							y_scale = 7
							rot = 2203
							flags = 3
							y_trans = 6
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = -2
							y_trans = 15
							x_scale = 3
							y_scale = 7
							flags = 3
							rot = 1213
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							y_trans = 19
							x_scale = 3
							y_scale = 7
							rot = 1603
							flags = 3
							x_trans = -6
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_PRS04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
					material = GTR_Fretboard_04_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_3guitar
							texture = `tex/models/Characters/Layers/CAG/PRS/22fret_LD114_PRS_DOTS`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR79_Neckhead_01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/PRS/gtr79_neckhead_01d`
					material = GTR79_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/GTR78_Neckhead_LD02`
							flags = 36
							Color = grey_5guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR79_Whammy
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_Tophat_2
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_pickup_SD03
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = GTR_Misc_Switch4
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
	}
	{
		genre = [
			`Classic	Rock`
			rock
		]
		CAS_Guitar_Body = {
			desc_id = GTR84_MM_Petrucci
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/MM/gtr84_mm_petrucci`
					material = GTR84_MM_Pet_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/MM/GTR84_MM_LD06`
							flags = 4
							Color = red_1
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_24Fret_MM04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
					material = GTR_Fretboard24_04_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR84_Neckhead01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/MM/gtr84_neckhead01`
					material = GTR84_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/MM/GTR84_Nekhed_DTL04`
							flags = 36
							Color = red_1
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR84_Whammy
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_MM01
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR84_pickup_A
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = GTR_Misc_Switch4
		}
	}
	{
		genre = [
			rock
			Punk
		]
		CAS_Guitar_Body = {
			desc_id = GTR84_MM_Petrucci
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/MM/gtr84_mm_petrucci`
					material = GTR84_MM_Pet_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/MM/GTR84_MM_LD06`
							flags = 4
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_24Fret_MM04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
					material = GTR_Fretboard24_04_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR84_Neckhead01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/MM/gtr84_neckhead01`
					material = GTR84_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/MM/GTR84_Nekhed_DTL04`
							flags = 36
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR84_Whammy
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_MM01
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_EMG_pickup5
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			Pop
		]
		CAS_Guitar_Body = {
			desc_id = GTR84_MM_Petrucci
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/MM/gtr84_mm_petrucci`
					material = GTR84_MM_Pet_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/MM/GTR84_MM_LD06`
							flags = 4
							Color = grey_5guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_MM02
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d2_01`
					material = GTR_Fretboard_02_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
							flags = 4
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR84_Neckhead01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/MM/gtr84_neckhead01`
					material = GTR84_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/MM/GTR84_Nekhed_DTL04`
							flags = 36
							Color = grey_5guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR84_Whammy
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_02
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_EMG_pickup2
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			Pop
			`Glam	Rock`
			Goth
		]
		CAS_Guitar_Body = {
			desc_id = GTR84_MM_Petrucci
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/MM/gtr84_mm_petrucci`
					material = GTR84_MM_Pet_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/MM/GTR84_MM_LD04`
							flags = 4
							Color = purple_blue_2
						}
						{
							texture = `tex/models/Characters/Layers/CAG/MM/GTR84_MM_DTL03`
							flags = 4
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_MM03
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d3_01`
					material = GTR_Fretboard_03_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_5
							texture = `tex/models/Characters/Layers/CAG/MM/GTR84_MMInlayPet22B`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR84_Neckhead01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/MM/gtr84_neckhead01`
					material = GTR84_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/MM/GTR84_Nekhed_DTL04`
							flags = 36
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR84_Whammy
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_MM01
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR84_pickup_A
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Classic	Rock`
			rock
		]
		CAS_Guitar_Body = {
			desc_id = GTR84_MM_Petrucci
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/MM/gtr84_mm_petrucci`
					material = GTR84_MM_Pet_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/MM/GTR84_MM_LD06`
							flags = 4
							Color = red_1
						}
						{
							texture = `tex/models/Characters/Layers/CAG/MM/GTR84_MM_DTL03`
							flags = 4
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_24Fret_MM04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
					material = GTR_Fretboard24_04_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR84_Neckhead01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/MM/gtr84_neckhead01`
					material = GTR84_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/MM/GTR84_Nekhed_DTL10`
							flags = 36
							Color = red_1
						}
						{
							texture = `tex/models/Characters/Layers/CAG/MM/GTR84_Nekhed_DTL06`
							flags = 36
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR84_Whammy
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_MM01
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR84_pickup_A
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Glam	Rock`
			Pop
		]
		CAS_Guitar_Body = {
			desc_id = GTR84_MM_Petrucci
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/MM/gtr84_mm_petrucci`
					material = GTR84_MM_Pet_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/MM/GTR84_MM_LD06`
							flags = 4
							Color = Blue_2
						}
						{
							texture = `tex/models/Characters/Layers/CAG/MM/GTR84_MM_DTL03`
							flags = 4
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_24Fret_MM04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
					material = GTR_Fretboard24_04_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR84_Neckhead01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/MM/gtr84_neckhead01`
					material = GTR84_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/MM/GTR84_Nekhed_DTL04`
							flags = 36
						}
						{
							texture = `tex/models/Characters/Layers/CAG/MM/GTR84_Nekhed_DTL07`
							flags = 36
							Color = navy_2
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR84_Whammy
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_MM01
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR84_pickup_A
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Classic	Rock`
			rock
		]
		CAS_Guitar_Body = {
			desc_id = GTR84_MM_Petrucci
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/MM/gtr84_mm_petrucci`
					material = GTR84_MM_Pet_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/MM/GTR84_MM_LD04`
							flags = 4
							Color = orange_4
						}
						{
							texture = `tex/models/Characters/Layers/CAG/MM/GTR84_MM_DTL03`
							flags = 4
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_24Fret_MM04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
					material = GTR_Fretboard24_04_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/MM/GTR84_MMInlayPet24B`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR84_Neckhead01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/MM/gtr84_neckhead01`
					material = GTR84_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/MM/GTR84_Nekhed_DTL04`
							flags = 36
						}
						{
							texture = `tex/models/Characters/Layers/CAG/All_Clear2`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR84_Whammy
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_MM01
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR84_pickup_A
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Classic	Rock`
		]
		CAS_Guitar_Body = {
			desc_id = gtr86_mm_axis
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/mm/gtr86_mm_axis_d`
					material = gtr86_mm_axis_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/MM/gtr86_mm_axis_LD04`
							flags = 4
							Color = orange_4
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_MM02
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d2_01`
					material = GTR_Fretboard_02_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
							flags = 4
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = gtr86_Neckhead_01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/MM/gtr86_Neckhead_D`
					material = gtr86_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/mm/gtr86_Neckhead_LD03`
							flags = 36
							Color = orange_3
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR75_bridgeMM
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_09c
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR86_pickup
		}
		CAS_Guitar_Misc = {
			desc_id = GTR_Misc_Switch4
		}
	}
	{
		genre = [
			`Classic	Rock`
		]
		CAS_Guitar_Body = {
			desc_id = gtr86_mm_axis
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/mm/gtr86_mm_axis_d`
					material = gtr86_mm_axis_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/MM/gtr86_mm_axis_LD03`
							flags = 4
							Color = navy_2
						}
						{
							texture = `tex/models/Characters/Layers/CAG/MM/gtr86_mm_axis_DTL03`
							flags = 4
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_MM02
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d2_01`
					material = GTR_Fretboard_02_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
							flags = 4
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = gtr86_Neckhead_01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/MM/gtr86_Neckhead_D`
					material = gtr86_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/mm/gtr86_Neckhead_LD02`
							flags = 36
							Color = Black_1guitar
						}
						{
							texture = `tex/models/Characters/Layers/CAG/mm/gtr86_Neckhead_DTL04`
							flags = 36
							Color = navy_1
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR75_bridgeMM
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_09c
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR86_pickup
		}
		CAS_Guitar_Misc = {
			desc_id = GTR_Misc_Switch4
		}
	}
	{
		genre = [
			`Classic	Rock`
		]
		CAS_Guitar_Body = {
			desc_id = gtr86_mm_axis
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/mm/gtr86_mm_axis_d`
					material = gtr86_mm_axis_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/MM/gtr86_mm_axis_LD04`
							flags = 4
							Color = orange_4
						}
						{
							texture = `tex/models/Characters/Layers/CAG/MM/gtr86_mm_axis_DTL03`
							Color = red_1
							flags = 4
							a = 60
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_MM03
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d3_01`
					material = GTR_Fretboard_03_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_5
							texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = gtr86_Neckhead_01
			chosen_materials = {
				material1 = grey_5guitar
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/MM/gtr86_Neckhead_D`
					material = gtr86_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/mm/gtr86_Neckhead_LD01`
							flags = 36
							Color = orange_3
						}
						{
							texture = `tex/models/Characters/Layers/CAG/mm/gtr86_Neckhead_DTL03`
							flags = 36
							Color = red_1
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR86_Bridge
			chosen_materials = {
				material1 = grey_5guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_10
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR86_pickup
		}
		CAS_Guitar_Misc = {
			desc_id = GTR71_Switch
		}
	}
	{
		genre = [
			`Glam	Rock`
			Pop
		]
		CAS_Guitar_Body = {
			desc_id = gtr86_mm_axis
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/mm/gtr86_mm_axis_d`
					material = gtr86_mm_axis_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/MM/gtr86_mm_axis_LD02`
							flags = 4
							Color = blue_4
						}
						{
							texture = `tex/models/Characters/Layers/CAG/All_Clear2`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_MM04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
					material = GTR_Fretboard_04_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_5
							texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = gtr86_Neckhead_01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/MM/gtr86_Neckhead_D`
					material = gtr86_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/mm/gtr86_Neckhead_LD02`
							flags = 36
							Color = blue_4
						}
						{
							texture = `tex/models/Characters/Layers/CAG/All_Clear2`
							flags = 4
						}
					]
				}
			]
			chosen_materials = {
				material1 = grey_5guitar
			}
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR84_Whammy
			chosen_materials = {
				material1 = grey_5guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_10
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_EMG_pickup2
			chosen_materials = {
				material1 = grey_5guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = GTR71_Switch
		}
	}
	{
		genre = [
			`Classic	Rock`
		]
		CAS_Guitar_Body = {
			desc_id = gtr86_mm_axis
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/mm/gtr86_mm_axis_d`
					material = gtr86_mm_axis_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/MM/gtr86_mm_axis_LD03`
							flags = 4
							Color = yellow_orange_2
						}
						{
							texture = `tex/models/Characters/Layers/CAG/All_Clear2`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_MM03
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d3_01`
					material = GTR_Fretboard_03_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_5
							texture = `tex/models/Characters/Layers/CAG/MM/GTR84_MMInlayPet22B`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = gtr86_Neckhead_01
			chosen_materials = {
				material1 = grey_5guitar
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/MM/gtr86_Neckhead_D`
					material = gtr86_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/mm/gtr86_Neckhead_LD04`
							flags = 36
							Color = yellow_orange_4
						}
						{
							texture = `tex/models/Characters/Layers/CAG/All_Clear2`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR86_Bridge
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_10
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR86_pickup
		}
		CAS_Guitar_Misc = {
			desc_id = GTR71_Switch
		}
	}
	{
		genre = [
			`Classic	Rock`
		]
		CAS_Guitar_Body = {
			desc_id = gtr86_mm_axis
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/mm/gtr86_mm_axis_d`
					material = gtr86_mm_axis_Primary
					diffuse
					pre_layer = [
						{
							Color = yellow_orange_5
							texture = `tex/models/Characters/Layers/CAG/MM/gtr86_mm_axis_LD04`
							flags = 4
						}
						{
							texture = `tex/models/Characters/Layers/CAG/MM/gtr86_mm_axis_DTL03`
							flags = 4
							Color = yellow_orange_1
						}
						{
							texture = `tex/models/Characters/Layers/CAG/MM/gtr86_mm_axis_DTL02`
							flags = 4
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_MM02
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d2_01`
					material = GTR_Fretboard_02_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
							flags = 4
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = gtr86_Neckhead_01
			chosen_materials = {
				material1 = grey_5guitar
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/MM/gtr86_Neckhead_D`
					material = gtr86_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/mm/gtr86_Neckhead_LD04`
							flags = 36
						}
						{
							texture = `tex/models/Characters/Layers/CAG/All_Clear2`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR84_Whammy
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_10
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR86_pickup
		}
		CAS_Guitar_Misc = {
			desc_id = GTR71_Switch
		}
	}
	{
		genre = [
			`Classic	Rock`
			`Glam	Rock`
			Pop
			rock
		]
		CAS_Guitar_Body = {
			desc_id = GTR78_PRS_SC
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/PRS/GTR78_PRS_SC_d`
					material = GTR78_PRS_SC_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/GTR78_PRS_SC_LD03`
							flags = 4
							Color = red_orange_4
						}
						{
							Color = red_3
							texture = `tex/models/Characters/Layers/CAG/PRS/GTR78_PRS_SC_DTL05`
							flags = 4
						}
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/GTR78_PRS_SC_DTL02`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_PRS04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
					material = GTR_Fretboard_04_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_3guitar
							texture = `tex/models/Characters/Layers/CAG/PRS/22fret_LD113_PRS_Moon`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR78_Neckhead_01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/PRS/GTR78_Neckhead_d`
					material = GTR78_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/GTR78_Neckhead_LD02`
							flags = 4
						}
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/PRS/GTR78_Neckhead_LD03`
							flags = 36
						}
					]
				}
			]
			chosen_materials = {
				material1 = grey_5guitar
			}
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR78_Bridge01
			chosen_materials = {
				material1 = grey_5guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_04
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_Pickup_Type2_PRS
			chosen_materials = {
				material1 = yellow_5guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = GTR_Misc_Switch4
		}
	}
	{
		genre = [
			Pop
			`Glam	Rock`
		]
		CAS_Guitar_Body = {
			desc_id = GTR82_PRS_SE1
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/PRS/prs_82_prs_se1`
					material = GTR82_PRS_SE1_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/PRS/GTR82_PRS_SE1_LD01`
							flags = 4
						}
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/GTR78_PRS_SC_DTL12`
							Color = teal_1
							flags = 4
							a = 50
						}
					]
					layers = [
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = teal_4
							x_trans = 5
							x_scale = 11
							y_scale = 1
							rot = 1603
							flags = 259
							y_trans = 28
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = teal_4
							y_trans = 8
							x_scale = 28
							y_scale = 1
							rot = 1603
							flags = 259
							x_trans = -3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = teal_4
							x_trans = -9
							x_scale = 23
							y_scale = 1
							rot = 1603
							flags = 259
							y_trans = 20
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = teal_4
							y_trans = 11
							x_scale = 41
							y_scale = 1
							rot = 1603
							flags = 259
							x_trans = -20
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = teal_4
							x_trans = -30
							y_trans = 33
							y_scale = 1
							rot = 1603
							flags = 259
							x_scale = 23
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = teal_4
							x_trans = -42
							x_scale = 41
							y_scale = 1
							rot = 1603
							flags = 259
							y_trans = 11
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							x_trans = -36
							y_trans = 23
							x_scale = 33
							y_scale = 1
							rot = 1603
							flags = 259
							Color = teal_4
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = red_3
							x_trans = -39
							x_scale = 33
							y_scale = 1
							rot = 1603
							flags = 259
							y_trans = -17
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = red_3
							x_trans = -32
							x_scale = 15
							y_scale = 1
							rot = 1603
							flags = 259
							y_trans = -37
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = red_3
							y_trans = -27
							x_scale = 27
							y_scale = 1
							rot = 1603
							flags = 259
							x_trans = -28
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = red_3
							x_trans = -25
							x_scale = 51
							y_scale = 1
							rot = 1603
							flags = 259
							y_trans = -8
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = red_3
							x_trans = -14
							x_scale = 46
							y_scale = 1
							rot = 1603
							flags = 259
							y_trans = -11
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = red_3
							x_trans = 0
							x_scale = 34
							y_scale = 1
							rot = 1603
							flags = 259
							y_trans = -13
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = teal_4
							y_trans = 17
							x_scale = 4
							y_scale = 6
							rot = 1603
							flags = 259
							x_trans = 5
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = teal_4
							y_trans = -14
							x_scale = 4
							y_scale = 6
							rot = 1603
							flags = 259
							x_trans = -3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = teal_4
							x_trans = -9
							x_scale = 4
							y_scale = 6
							rot = 1603
							flags = 259
							y_trans = -1
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = teal_4
							x_trans = -20
							x_scale = 4
							y_scale = 6
							rot = 1603
							flags = 259
							y_trans = -21
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = teal_4
							x_trans = -30
							x_scale = 4
							y_scale = 6
							rot = 1603
							flags = 259
							y_trans = 12
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = teal_4
							x_trans = -42
							x_scale = 4
							y_scale = 6
							rot = 1603
							flags = 259
							y_trans = -21
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = teal_4
							y_trans = -5
							x_scale = 4
							y_scale = 6
							rot = 1603
							flags = 259
							x_trans = -36
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = red_3
							x_trans = -39
							x_scale = 4
							y_scale = 6
							rot = 1603
							flags = 259
							y_trans = 9
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = red_3
							x_trans = -32
							y_trans = -24
							x_scale = 4
							y_scale = 6
							rot = 1603
							flags = 259
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = red_3
							y_trans = -7
							x_scale = 4
							y_scale = 6
							rot = 1603
							flags = 259
							x_trans = -28
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = red_3
							y_trans = 30
							x_scale = 4
							y_scale = 6
							rot = 1603
							flags = 259
							x_trans = -24
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = red_3
							x_trans = -14
							y_trans = 25
							x_scale = 4
							y_scale = 6
							rot = 1603
							flags = 259
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = red_3
							x_trans = 1
							x_scale = 4
							y_scale = 6
							rot = 1603
							flags = 259
							y_trans = 14
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_24Fret_PRS04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
					material = GTR_Fretboard24_04_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_3guitar
							texture = `tex/models/Characters/Layers/CAG/PRS/24fret_LD81_PRS_HLND`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR82_Neckhead01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/PRS/gtr82_neckhead_01`
					material = GTR82_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/PRS/GTR82_Neckhead_01_LD02`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR81_Bridge01
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_Tophat
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_pickup_soapbar
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			Pop
			`Glam	Rock`
		]
		CAS_Guitar_Body = {
			desc_id = GTR82_PRS_SE1
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/PRS/prs_82_prs_se1`
					material = GTR82_PRS_SE1_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/GTR82_PRS_SE1_LD01`
							flags = 4
							Color = purple_blue_1
						}
					]
					layers = [
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							x_trans = -18
							y_trans = 0
							x_scale = 60
							y_scale = 124
							rot = 1603
							flags = 259
							Color = navy_1
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShapeGradient_002`
							a = 45
							x_trans = 10
							y_trans = 15
							x_scale = 20
							y_scale = 35
							rot = 1603
							flags = 3
							Color = Black_1guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShapeGradient_002`
							a = 45
							x_trans = -7
							y_trans = 15
							x_scale = 20
							y_scale = 35
							rot = 1603
							flags = 3
							Color = Black_1guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShapeGradient_002`
							a = 45
							x_trans = -8
							y_trans = -15
							x_scale = 20
							y_scale = 33
							rot = 1603
							flags = 3
							Color = Black_1guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShapeGradient_002`
							a = 45
							x_trans = -24
							y_trans = -45
							x_scale = 20
							y_scale = 33
							rot = 1603
							flags = 3
							Color = Black_1guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShapeGradient_002`
							a = 45
							x_trans = -40
							y_trans = -42
							x_scale = 20
							y_scale = 33
							rot = 1603
							flags = 3
							Color = Black_1guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShapeGradient_002`
							Color = Black_1guitar
							x_trans = -40
							y_trans = -12
							x_scale = 20
							y_scale = 33
							rot = 1603
							flags = 3
							a = 55
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShapeGradient_002`
							a = 45
							x_trans = -24
							y_trans = -14
							x_scale = 20
							y_scale = 33
							rot = 1603
							flags = 3
							Color = Black_1guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShapeGradient_002`
							a = 50
							x_trans = -24
							y_trans = 16
							x_scale = 19
							y_scale = 32
							rot = 1603
							flags = 3
							Color = Black_1guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShapeGradient_002`
							a = 50
							x_trans = -40
							y_trans = 18
							x_scale = 19
							y_scale = 32
							rot = 1603
							flags = 3
							Color = Black_1guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShapeGradient_002`
							a = 50
							x_trans = -39
							y_trans = 47
							x_scale = 19
							y_scale = 32
							rot = 1603
							flags = 3
							Color = Black_1guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShapeGradient_002`
							a = 50
							x_trans = -24
							y_trans = 45
							x_scale = 19
							y_scale = 32
							rot = 1603
							flags = 3
							Color = Black_1guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							x_trans = -17
							y_trans = 30
							x_scale = 1
							y_scale = 119
							rot = 1603
							flags = 259
							Color = yellow_2guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							x_trans = -19
							y_trans = 1
							x_scale = 1
							y_scale = 119
							rot = 1603
							flags = 259
							Color = yellow_2guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							x_trans = -19
							y_trans = -30
							x_scale = 1
							y_scale = 119
							rot = 1603
							flags = 259
							Color = yellow_2guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							x_trans = -32
							y_trans = 3
							x_scale = 67
							y_scale = 1
							rot = 1603
							flags = 259
							Color = yellow_2guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							x_trans = -16
							y_trans = 3
							x_scale = 67
							y_scale = 1
							rot = 1603
							flags = 259
							Color = yellow_2guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							x_trans = 1
							y_trans = 3
							x_scale = 52
							y_scale = 1
							rot = 1603
							flags = 259
							Color = yellow_2guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon011`
							x_trans = -28
							y_trans = 32
							x_scale = 84
							y_scale = 80
							rot = 373
							flags = 259
							Color = yellow_2guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon004`
							x_trans = -36
							y_trans = -26
							x_scale = 41
							y_scale = 78
							rot = 2353
							flags = 267
							Color = yellow_2guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon007`
							x_trans = -47
							y_trans = 4
							x_scale = 57
							y_scale = 57
							rot = 913
							flags = 259
							Color = yellow_2guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon004`
							x_trans = 5
							y_trans = 20
							x_scale = 27
							y_scale = 45
							rot = 1603
							flags = 259
							Color = yellow_2guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							x_trans = -8
							y_trans = -34
							x_scale = 22
							y_scale = 68
							rot = 1243
							flags = 259
							Color = yellow_2guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon010`
							x_trans = -11
							y_trans = 23
							x_scale = 40
							y_scale = 27
							rot = 3343
							flags = 259
							Color = yellow_2guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics014`
							a = 60
							x_trans = -34
							y_trans = 7
							x_scale = 3
							rot = 1603
							flags = 3
							y_scale = 4
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics014`
							a = 60
							x_trans = -34
							y_trans = 27
							x_scale = 3
							y_scale = 4
							rot = 1603
							flags = 3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics014`
							a = 60
							x_trans = -34
							y_trans = 36
							x_scale = 3
							y_scale = 4
							rot = 1603
							flags = 3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics014`
							a = 60
							x_trans = -29
							y_trans = 36
							x_scale = 3
							y_scale = 4
							rot = 1603
							flags = 3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics014`
							a = 60
							x_trans = -29
							y_trans = 27
							x_scale = 3
							y_scale = 4
							rot = 1603
							flags = 3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics014`
							a = 60
							x_trans = -29
							y_trans = 7
							x_scale = 3
							y_scale = 4
							rot = 1603
							flags = 3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics014`
							a = 60
							x_trans = -29
							y_trans = -3
							x_scale = 3
							y_scale = 4
							rot = 1603
							flags = 3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics014`
							a = 60
							x_trans = -34
							y_trans = -3
							x_scale = 3
							y_scale = 4
							rot = 1603
							flags = 3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics014`
							a = 60
							x_trans = -34
							x_scale = 3
							y_scale = 4
							rot = 1603
							flags = 3
							y_trans = -24
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics014`
							a = 60
							x_trans = -30
							y_trans = -24
							x_scale = 3
							y_scale = 4
							rot = 1603
							flags = 3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics014`
							a = 60
							x_trans = -30
							y_trans = -33
							x_scale = 3
							y_scale = 4
							rot = 1603
							flags = 3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics014`
							a = 60
							x_trans = -34
							y_trans = -33
							x_scale = 3
							y_scale = 4
							rot = 1603
							flags = 3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics014`
							a = 60
							x_trans = -18
							y_trans = 26
							x_scale = 3
							y_scale = 4
							rot = 1603
							flags = 3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics014`
							a = 60
							y_trans = 24
							x_scale = 3
							y_scale = 4
							rot = 1603
							flags = 3
							x_trans = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_PRS04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
					material = GTR_Fretboard_04_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_3guitar
							texture = `tex/models/Characters/Layers/CAG/PRS/22fret_LD111_PRS_Bird`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR82_Neckhead01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/PRS/gtr82_neckhead_01`
					material = GTR82_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/GTR82_Neckhead_01_LD02`
							flags = 36
							Color = purple_blue_1
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = GTR82_PGuard
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR81_Bridge01
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_Tophat
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_pickup_soapbar
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			Pop
			`Glam	Rock`
			rock
			Punk
		]
		CAS_Guitar_Body = {
			desc_id = GTR79_PRS_CSTM24
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/PRS/prs_ctm24_d`
					material = GTR79_PRS_CST24_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/GTR79_PRS_Ctm24_DTL01`
							flags = 4
							Color = grey_5guitar
						}
					]
					layers = [
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon006`
							x_trans = -37
							y_trans = 6
							x_scale = 73
							y_scale = 86
							rot = 1243
							flags = 259
							Color = grey_4guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon005`
							a = 100
							x_trans = -47
							y_trans = -4
							x_scale = 64
							y_scale = 68
							rot = 1873
							flags = 259
							Color = grey_4guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon005`
							a = 100
							x_trans = -45
							y_trans = -6
							x_scale = 64
							y_scale = 63
							rot = 1873
							flags = 259
							Color = red_3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon002`
							Color = grey_4guitar
							x_trans = -22
							y_trans = 3
							x_scale = 76
							rot = 1153
							flags = 259
							y_scale = 60
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon006`
							x_trans = -36
							y_trans = 8
							x_scale = 73
							y_scale = 76
							rot = 1243
							flags = 259
							Color = red_3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon011`
							x_trans = -9
							y_trans = -1
							x_scale = 63
							y_scale = 150
							rot = 1603
							flags = 259
							Color = grey_4guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon011`
							Color = blue_1
							y_trans = -1
							x_scale = 63
							y_scale = 140
							rot = 1603
							flags = 259
							x_trans = -8
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon013`
							x_trans = -12
							y_trans = -3
							x_scale = 62
							y_scale = 64
							rot = 1603
							flags = 259
							Color = grey_4guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon002`
							Color = red_3
							x_trans = -22
							y_trans = 3
							x_scale = 76
							rot = 1153
							flags = 259
							y_scale = 51
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon013`
							Color = blue_1
							x_trans = -12
							x_scale = 62
							y_scale = 58
							rot = 1603
							flags = 259
							y_trans = -3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon030`
							x_trans = -7
							y_trans = -5
							x_scale = 50
							y_scale = 35
							rot = 1153
							flags = 259
							Color = grey_4guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon030`
							Color = red_3
							x_trans = -7
							y_trans = -5
							x_scale = 50
							y_scale = 30
							flags = 259
							rot = 1153
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							y_trans = 4
							x_scale = 3
							y_scale = 6
							rot = 1543
							flags = 3
							x_trans = -12
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							y_trans = 14
							x_scale = 3
							y_scale = 6
							rot = 2053
							flags = 3
							x_trans = -13
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = -3
							y_trans = -21
							x_scale = 6
							y_scale = 8
							flags = 3
							rot = 3043
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							y_trans = 13
							x_scale = 6
							y_scale = 8
							rot = 2053
							flags = 3
							x_trans = -9
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							y_trans = 20
							x_scale = 3
							y_scale = 5
							rot = 2053
							flags = 3
							x_trans = -11
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = 5
							y_trans = 22
							x_scale = 3
							y_scale = 5
							flags = 3
							rot = 2053
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = 8
							y_trans = 24
							y_scale = 5
							rot = 1603
							flags = 3
							x_scale = 3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = 0
							y_trans = 22
							y_scale = 10
							rot = 1603
							flags = 3
							x_scale = 6
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = -1
							x_skew = -27
							x_scale = 3
							y_scale = 7
							rot = 2203
							flags = 3
							y_trans = 6
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = -2
							y_trans = 15
							x_scale = 3
							y_scale = 7
							flags = 3
							rot = 1213
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							y_trans = 19
							x_scale = 3
							y_scale = 7
							rot = 1603
							flags = 3
							x_trans = -6
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_PRS04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
					material = GTR_Fretboard_04_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_3guitar
							texture = `tex/models/Characters/Layers/CAG/PRS/22fret_LD114_PRS_DOTS`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR79_Neckhead_01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/PRS/gtr79_neckhead_01d`
					material = GTR79_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/GTR78_Neckhead_LD02`
							flags = 36
							Color = grey_5guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR79_Whammy
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_Tophat_2
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_pickup_SD03
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = GTR_Misc_Switch4
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
	}
	{
		genre = [
			`Classic	Rock`
		]
		CAS_Guitar_Body = {
			desc_id = GTR79_PRS_CSTM24
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/PRS/prs_ctm24_d`
					material = GTR79_PRS_CST24_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/GTR79_PRS_Ctm24_DTL01`
							flags = 4
							Color = orange_4
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_24Fret_PRS04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
					material = GTR_Fretboard24_04_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/24fret_LD81_PRS_Dots`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR79_Neckhead_01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/PRS/gtr79_neckhead_01d`
					material = GTR79_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/GTR78_Neckhead_LD02`
							flags = 36
							Color = orange_4
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR79_Whammy
		}
		CAS_Guitar_Knobs = {
			desc_id = PRS_Knob_Lampshade
			chosen_materials = {
				material1 = yellow_orange_3
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_Pickup_Type2_PRS
			chosen_materials = {
				material1 = yellow_orange_4
			}
		}
		CAS_Guitar_Misc = {
			desc_id = GTR_Misc_Switch4
		}
	}
	{
		genre = [
			`Black	Metal`
			rock
		]
		CAS_Guitar_Body = {
			desc_id = GTR79_PRS_CSTM24
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/PRS/prs_ctm24_d`
					material = GTR79_PRS_CST24_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/GTR79_PRS_Ctm24_DTL03`
							flags = 4
							Color = grey_2guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_24Fret_PRS04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
					material = GTR_Fretboard24_04_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/24fret_LD81_PRS_Dots`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR79_Neckhead_01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/PRS/gtr79_neckhead_01d`
					material = GTR79_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/GTR78_Neckhead_LD02`
							flags = 36
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR79_Whammy
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_Tophat_2
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_pickup_SD04
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = GTR_Misc_Switch4
		}
	}
	{
		genre = [
			rock
			Goth
		]
		CAS_Guitar_Body = {
			desc_id = GTR79_PRS_CSTM24
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/PRS/prs_ctm24_d`
					material = GTR79_PRS_CST24_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/GTR79_PRS_Ctm24_DTL02`
							flags = 4
							Color = navy_2
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_24Fret_PRS04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
					material = GTR_Fretboard24_04_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/24fret_LD81_PRS_Dots`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR79_Neckhead_01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/PRS/gtr79_neckhead_01d`
					material = GTR79_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/GTR78_Neckhead_LD02`
							flags = 36
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR79_Whammy
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_04
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_pickup_SD06
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Classic	Rock`
		]
		CAS_Guitar_Body = {
			desc_id = GTR79_PRS_CSTM24
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/PRS/prs_ctm24_d`
					material = GTR79_PRS_CST24_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/GTR79_PRS_Ctm24_DTL02`
							flags = 4
							Color = orange_4
						}
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/GTR79_PRS_Ctm24_LD03`
							Color = red_1
							flags = 4
							a = 50
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_24Fret_PRS03
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d3_02`
					material = GTR_Fretboard24_03_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/24fret_LD81_PRS_Dots`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR79_Neckhead_01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/PRS/gtr79_neckhead_01d`
					material = GTR79_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/GTR78_Neckhead_LD02`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR79_Whammy
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_04
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_pickup_SD06
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Classic	Rock`
			Punk
		]
		CAS_Guitar_Body = {
			desc_id = GTR79_PRS_CSTM24
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/PRS/prs_ctm24_d`
					material = GTR79_PRS_CST24_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/GTR79_PRS_Ctm24_DTL02`
							flags = 4
							Color = green_2guitar
						}
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/GTR79_PRS_Ctm24_LD01`
							flags = 4
							Color = yellow_5guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_24Fret_PRS04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
					material = GTR_Fretboard24_04_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/24fret_LD81_PRS_Dots`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR79_Neckhead_01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/PRS/gtr79_neckhead_01d`
					material = GTR79_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/PRS/GTR78_Neckhead_LD02`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR79_Whammy
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_04
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_pickup_SD06
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Glam	Rock`
			Pop
		]
		CAS_Guitar_Body = {
			desc_id = GTR79_PRS_CSTM24
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/PRS/prs_ctm24_d`
					material = GTR79_PRS_CST24_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/GTR79_PRS_Ctm24_DTL03`
							flags = 4
							Color = violet_4
						}
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/GTR79_PRS_Ctm24_LD01`
							flags = 4
							Color = yellow_5guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_24Fret_PRS04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
					material = GTR_Fretboard24_04_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/24fret_LD81_PRS_Dots`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR79_Neckhead_01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/PRS/gtr79_neckhead_01d`
					material = GTR79_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/PRS/GTR78_Neckhead_LD02`
							flags = 36
						}
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/GTR78_Neckhead_LD03`
							flags = 36
							Color = violet_4
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR79_Whammy
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_04
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_pickup_SD06
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			Pop
			`Glam	Rock`
			`Classic	Rock`
		]
		CAS_Guitar_Body = {
			desc_id = GTR81_PRS_MiraMT
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/PRS/prs_81_mt_d`
					material = GTR81_PRS_MT_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/GTR81_PRS_MT_LD01`
							flags = 4
							Color = teal_5
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_PRS04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
					material = GTR_Fretboard_04_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/22fret_LD110_PRS_HLND`
							flags = 36
							Color = grey_5guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR81_Neckhead01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/PRS/gtr81_neckhead_01d`
					material = GTR81_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/GTR78_Neckhead_LD02`
							flags = 36
							Color = teal_5
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = GTR81_PGuard
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/PRS/PRS_81_PGuard`
					material = GTR81_PGuard_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_5
							texture = `tex/models/Characters/Layers/CAG/PRS/PRS_81_PGuard_LD01`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR81_Bridge01
		}
		CAS_Guitar_Knobs = {
			desc_id = PRS_Knob_Lampshade
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_pickup_SD06
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = GTR_Misc_Switch4
		}
	}
	{
		genre = [
			Punk
			`Classic	Rock`
		]
		CAS_Guitar_Body = {
			desc_id = GTR81_PRS_MiraMT
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/PRS/prs_81_mt_d`
					material = GTR81_PRS_MT_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/GTR81_PRS_MT_LD21`
							flags = 4
							Color = yellow_orange_2
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_PRS04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
					material = GTR_Fretboard_04_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/22fret_LD110_PRS_HLND`
							flags = 36
							Color = grey_5guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR81_Neckhead01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/PRS/gtr81_neckhead_01d`
					material = GTR81_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/GTR78_Neckhead_LD04`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = GTR81_PGuard
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/PRS/PRS_81_PGuard`
					material = GTR81_PGuard_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/PRS_81_PGuard_LD01`
							flags = 4
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR81_Bridge01
		}
		CAS_Guitar_Knobs = {
			desc_id = PRS_Knob_Lampshade
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_pickup_SD06
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = GTR_Misc_Switch4
		}
	}
	{
		genre = [
			Punk
			`Classic	Rock`
			rock
		]
		CAS_Guitar_Body = {
			desc_id = GTR81_PRS_MiraMT
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/PRS/prs_81_mt_d`
					material = GTR81_PRS_MT_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/GTR81_PRS_MT_LD21`
							flags = 4
							Color = orange_4
						}
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/GTR81_PRS_MT_DTL04`
							flags = 4
							Color = orange_1
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_PRS04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
					material = GTR_Fretboard_04_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/22fret_LD110_PRS_HLND`
							flags = 36
							Color = grey_5guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR81_Neckhead01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/PRS/gtr81_neckhead_01d`
					material = GTR81_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/GTR78_Neckhead_LD04`
							flags = 36
						}
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/PRS/GTR78_Neckhead_LD03`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = GTR81_PGuard
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/PRS/PRS_81_PGuard`
					material = GTR81_PGuard_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/PRS_81_PGuard_LD01`
							flags = 4
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR81_Bridge01
		}
		CAS_Guitar_Knobs = {
			desc_id = PRS_Knob_Lampshade
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_pickup_SD06
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = GTR_Misc_Switch4
		}
	}
	{
		genre = [
			Punk
			`Classic	Rock`
			rock
		]
		CAS_Guitar_Body = {
			desc_id = GTR82_PRS_SE1
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/PRS/prs_82_prs_se1`
					material = GTR82_PRS_SE1_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/GTR83_PRS_Wood`
							flags = 4
							Color = orange_4
						}
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/GTR78_PRS_SC_DTL05`
							flags = 4
							Color = red_orange_2
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_PRS03
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d3_01`
					material = GTR_Fretboard_03_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/22fret_LD110_PRS_HLND`
							flags = 36
							Color = grey_5guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR82_Neckhead01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/PRS/gtr82_neckhead_01`
					material = GTR82_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/GTR82_Neckhead_01_LD04`
							flags = 36
						}
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/PRS/GTR82_Neckhead_01_LD03`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = GTR82_PGuard
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/PRS/PRS_82_PGuard`
					material = GTR82_PGuard_Primary
					diffuse
					pre_layer = [
						{
							Color = red_3
							texture = `tex/models/Characters/Layers/CAG/PRS/PRS_82_PGuard_DTL02`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR81_Bridge01
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_Tophat
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_pickup_soapbar
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			Punk
			`Classic	Rock`
			rock
		]
		CAS_Guitar_Body = {
			desc_id = GTR82_PRS_SE1
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/PRS/prs_82_prs_se1`
					material = GTR82_PRS_SE1_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/GTR83_PRS_Wood`
							flags = 4
							Color = red_2
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_24Fret_PRS03
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d3_02`
					material = GTR_Fretboard24_03_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/24fret_LD81_PRS_Dots`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR82_Neckhead01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/PRS/gtr82_neckhead_01`
					material = GTR82_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/GTR82_Neckhead_01_LD04`
							flags = 36
							Color = red_2
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = GTR82_PGuard
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/PRS/PRS_82_PGuard`
					material = GTR82_PGuard_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/PRS_82_PGuard_DTL01`
							flags = 4
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR81_Bridge01
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_Tophat
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_pickup_soapbar
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Black	Metal`
			`Heavy	Metal`
			rock
			Punk
		]
		CAS_Guitar_Body = {
			desc_id = GTR82_PRS_SE1
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/PRS/prs_82_prs_se1`
					material = GTR82_PRS_SE1_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/GTR82_PRS_SE1_LD01`
							flags = 4
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_24Fret_PRS03
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d3_02`
					material = GTR_Fretboard24_03_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/24fret_LD81_PRS_Dots`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR82_Neckhead01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/PRS/gtr82_neckhead_01`
					material = GTR82_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/PRS/GTR82_Neckhead_01_LD02`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = GTR82_PGuard
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/PRS/PRS_82_PGuard`
					material = GTR82_PGuard_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/PRS/PRS_82_PGuard_DTL01`
							flags = 4
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR81_Bridge01
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_Tophat
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_pickup_soapbar
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Glam	Rock`
		]
		CAS_Guitar_Body = {
			desc_id = GTR84_MM_Petrucci
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/MM/gtr84_mm_petrucci`
					material = GTR84_MM_Pet_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/MM/GTR84_MM_DTL01`
							flags = 4
							Color = yellow_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_MM01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d_01`
					material = GTR_Fretboard_01_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_5
							texture = `tex/models/Characters/Layers/CAG/MM/GTR84_MMInlayPet22B`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR84_Neckhead01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/MM/gtr84_neckhead01`
					material = GTR84_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/MM/GTR84_Nekhed_DTL04`
							flags = 36
							Color = yellow_1guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR84_Whammy
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_MM01
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR84_pickup_A
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = GTR_Misc_Switch4
		}
	}
	{
		genre = [
			`Classic	Rock`
		]
		CAS_Guitar_Body = {
			desc_id = GTR70_SCH_Ultra
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Schecter/GTR70_SCH_Ultra_d`
					material = GTR70_SCH_Ultra_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Schecter/GTR70_SCH_Ultra_LD02`
							flags = 4
							Color = navy_1
						}
					]
					layers = [
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							x_trans = -16
							y_trans = -1
							x_skew = 0
							x_scale = 21
							y_scale = 131
							rot = 0
							flags = 259
							Color = grey_5guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 100
							x_trans = -16
							x_skew = 0
							x_scale = 16
							y_scale = 131
							rot = 2023
							flags = 259
							y_trans = -4
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 100
							y_trans = -1
							x_skew = 0
							x_scale = 16
							y_scale = 131
							rot = 1183
							flags = 259
							x_trans = -16
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							x_trans = -19
							y_trans = -1
							x_skew = -3
							x_scale = 16
							y_scale = 131
							rot = 1603
							flags = 259
							Color = grey_5guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = red_2
							a = 100
							x_trans = -16
							y_trans = -1
							x_skew = 0
							y_scale = 131
							rot = 1183
							flags = 259
							x_scale = 10
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 100
							x_trans = -16
							y_trans = -4
							x_skew = 0
							x_scale = 10
							y_scale = 131
							rot = 2023
							flags = 259
							Color = red_2
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							x_trans = -19
							y_trans = -1
							x_skew = -3
							x_scale = 16
							y_scale = 59
							rot = 1603
							flags = 259
							Color = grey_5guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = grey_5guitar
							x_trans = -16
							x_skew = 0
							x_scale = 21
							y_scale = 25
							rot = 0
							flags = 259
							y_trans = -3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = red_2
							x_trans = -16
							y_trans = -1
							x_skew = 0
							y_scale = 131
							rot = 0
							flags = 259
							x_scale = 13
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = red_2
							x_trans = -19
							y_trans = -1
							x_skew = -3
							y_scale = 131
							rot = 1603
							flags = 259
							x_scale = 10
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_24Fret_Schecter02
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d2_02`
					material = GTR_Fretboard24_02_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_2
							texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR70_neckhead
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Schecter/gtr70_neckhead_d`
					material = GTR70_neckhead_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Schecter/GTR70_neckhead_LD02`
							flags = 36
							Color = navy_1
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR71_Bridge
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_Pickup_Type2_PAF1
			chosen_materials = {
				material1 = grey_5guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Heavy	Metal`
			Punk
			rock
		]
		CAS_Guitar_Body = {
			desc_id = GTR73_SCH_S1
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Schecter/GTR73_SCH_S1_d`
					material = GTR73_SCH_S1_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/Schecter/GTR73_SCH_S1_LD02`
							flags = 4
						}
						{
							texture = `tex/models/Characters/Layers/CAG/Schecter/GTR73_SCH_S1_DTL03`
							flags = 4
							Color = orange_3
						}
					]
					layers = [
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon021`
							Color = orange_3
							x_trans = -3
							x_scale = 8
							y_scale = 12
							rot = 1603
							flags = 259
							y_trans = 28
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon021`
							Color = orange_3
							x_trans = -3
							x_scale = 8
							y_scale = 12
							rot = 1603
							flags = 259
							y_trans = 7
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon021`
							Color = orange_3
							y_trans = -18
							x_scale = 8
							y_scale = 12
							rot = 1603
							flags = 259
							x_trans = -3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon021`
							Color = orange_3
							x_trans = -15
							x_scale = 8
							y_scale = 12
							rot = 1603
							flags = 259
							y_trans = -42
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon021`
							Color = orange_3
							x_trans = -15
							x_scale = 8
							y_scale = 12
							rot = 1603
							flags = 259
							y_trans = -18
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon021`
							Color = orange_3
							x_trans = -15
							x_scale = 8
							y_scale = 12
							rot = 1603
							flags = 259
							y_trans = 6
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon021`
							Color = orange_3
							y_trans = 29
							x_scale = 8
							y_scale = 12
							rot = 1603
							flags = 259
							x_trans = -15
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon021`
							Color = orange_3
							x_trans = -29
							x_scale = 8
							y_scale = 12
							rot = 1603
							flags = 259
							y_trans = 29
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon021`
							Color = orange_3
							x_trans = -29
							x_scale = 8
							y_scale = 12
							rot = 1603
							flags = 259
							y_trans = 6
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon021`
							Color = orange_3
							y_trans = -17
							x_scale = 8
							y_scale = 12
							rot = 1603
							flags = 259
							x_trans = -29
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon021`
							Color = orange_3
							y_trans = -41
							x_scale = 8
							y_scale = 12
							rot = 1603
							flags = 259
							x_trans = -29
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon021`
							Color = orange_3
							x_trans = -42
							x_scale = 8
							y_scale = 12
							rot = 1603
							flags = 259
							y_trans = -41
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon021`
							Color = orange_3
							x_trans = -42
							x_scale = 8
							y_scale = 12
							rot = 1603
							flags = 259
							y_trans = -17
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon021`
							Color = orange_3
							x_trans = -42
							x_scale = 8
							y_scale = 12
							rot = 1603
							flags = 259
							y_trans = 7
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon021`
							Color = orange_3
							y_trans = 30
							x_scale = 8
							y_scale = 12
							rot = 1603
							flags = 259
							x_trans = -42
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = orange_3
							x_trans = -23
							x_scale = 1
							y_scale = 104
							rot = 1603
							flags = 259
							y_trans = -31
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = orange_3
							x_trans = -23
							x_scale = 1
							y_scale = 104
							rot = 1603
							flags = 259
							y_trans = -7
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = orange_3
							x_trans = -23
							x_scale = 1
							y_scale = 104
							rot = 1603
							flags = 259
							y_trans = 43
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = orange_3
							x_trans = -23
							y_trans = 18
							x_scale = 1
							rot = 1603
							flags = 259
							y_scale = 104
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = orange_3
							x_trans = -9
							y_trans = 1
							y_scale = 1
							rot = 1603
							flags = 259
							x_scale = 64
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = orange_3
							y_trans = 2
							x_scale = 64
							y_scale = 1
							rot = 1603
							flags = 259
							x_trans = -22
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = orange_3
							x_trans = -36
							y_trans = 2
							y_scale = 1
							rot = 1603
							flags = 259
							x_scale = 64
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							x_trans = -9
							y_trans = -8
							x_scale = 4
							y_scale = 7
							rot = 1603
							flags = 259
							Color = orange_3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = orange_3
							y_trans = 17
							x_scale = 4
							y_scale = 7
							rot = 1603
							flags = 259
							x_trans = -9
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = orange_3
							x_trans = -22
							x_scale = 4
							y_scale = 7
							rot = 1603
							flags = 259
							y_trans = 18
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = orange_3
							x_trans = -22
							x_scale = 4
							y_scale = 7
							rot = 1603
							flags = 259
							y_trans = -7
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = orange_3
							x_trans = -22
							x_scale = 4
							y_scale = 7
							rot = 1603
							flags = 259
							y_trans = -31
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = orange_3
							x_trans = -36
							x_scale = 4
							y_scale = 7
							rot = 1603
							flags = 259
							y_trans = -30
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = orange_3
							x_trans = -36
							x_scale = 4
							y_scale = 7
							rot = 1603
							flags = 259
							y_trans = -5
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = orange_3
							x_trans = -36
							x_scale = 4
							y_scale = 7
							rot = 1603
							flags = 259
							y_trans = 19
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							x_trans = -9
							y_trans = -8
							x_scale = 2
							y_scale = 3
							rot = 1603
							flags = 259
							Color = Black_1guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = Black_1guitar
							x_trans = -9
							x_scale = 2
							y_scale = 3
							rot = 1603
							flags = 259
							y_trans = 17
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = Black_1guitar
							x_trans = -22
							x_scale = 2
							y_scale = 3
							rot = 1603
							flags = 259
							y_trans = 18
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = Black_1guitar
							x_trans = -36
							x_scale = 2
							y_scale = 3
							rot = 1603
							flags = 259
							y_trans = 19
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = Black_1guitar
							x_trans = -36
							x_scale = 2
							y_scale = 3
							rot = 1603
							flags = 259
							y_trans = -5
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = Black_1guitar
							x_trans = -36
							x_scale = 2
							y_scale = 3
							rot = 1603
							flags = 259
							y_trans = -30
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = Black_1guitar
							x_trans = -22
							x_scale = 2
							y_scale = 3
							rot = 1603
							flags = 259
							y_trans = -31
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_24Fret_Schecter04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
					material = GTR_Fretboard24_04_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR73_Neckhead_01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Schecter/gtr73_neckhead_d`
					material = GTR73_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/Schecter/GTR73_neckhead_LD02`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR72_Bridge
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01c
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_EMG_pickup2
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = GTR_Misc_Switch4
		}
	}
	{
		genre = [
			`Black	Metal`
			`Heavy	Metal`
			rock
			Goth
		]
		CAS_Guitar_Body = {
			desc_id = gtr1_sch_tempest
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Schecter/gtr1_sch_tempest_body_d`
					material = gtr1_sch_tempest_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/schecter/GTR1_SCH_Tempest_Body_LD1`
							flags = 4
						}
						{
							texture = `tex/models/Characters/Layers/CAG/schecter/GTR1_Sch_Tempest_DTL_1`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_Schecter03
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d3_01`
					material = GTR_Fretboard_03_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_5
							texture = `tex/models/Characters/Layers/CAG/GH5/22_fret_LD40_Shctr_Hollywood`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR1_Sch_Neckhead_1
			chosen_materials = {
				material1 = grey_2guitar
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Schecter/gtr1_sch_neckhead_d_01`
					material = GTR1_Sch_Neckhead_1_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/schecter/GTR1_Sch_Neckhead_LD_1`
							flags = 36
						}
						{
							texture = `tex/models/Characters/Layers/CAG/schecter/GTR1_Sch_Neckhead_DTL_2`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = GTR1_Sch_Pickguard_01
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR71_Bridge
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_pickup_SD06
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = GTR_Misc_Switch4
		}
	}
	{
		genre = [
			rock
		]
		CAS_Guitar_Body = {
			desc_id = gtr1_sch_tempest
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Schecter/gtr1_sch_tempest_body_d`
					material = gtr1_sch_tempest_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/schecter/GTR1_SCH_Tempest_Body_LD2`
							flags = 4
							Color = red_1
						}
						{
							texture = `tex/models/Characters/Layers/CAG/schecter/GTR1_Sch_Tempest_DTL_1`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_Schecter04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
					material = GTR_Fretboard_04_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_5
							texture = `tex/models/Characters/Layers/CAG/GH5/22_fret_LD39_Shctr_Hellraiser`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR1_Sch_Neckhead_1
			chosen_materials = {
				material1 = grey_2guitar
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Schecter/gtr1_sch_neckhead_d_01`
					material = GTR1_Sch_Neckhead_1_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/schecter/GTR1_Sch_Neckhead_LD_3`
							flags = 36
							Color = red_1
						}
						{
							texture = `tex/models/Characters/Layers/CAG/schecter/GTR1_Sch_Neckhead_DTL_2`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = GTR1_Sch_Pickguard_01
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR71_Bridge
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_EMG_pickup2
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = GTR_Misc_Switch4
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
	}
	{
		genre = [
			rock
		]
		CAS_Guitar_Body = {
			desc_id = GTR70_SCH_Ultra
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Schecter/GTR70_SCH_Ultra_d`
					material = GTR70_SCH_Ultra_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Schecter/GTR70_SCH_Ultra_LD08`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_Schecter04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
					material = GTR_Fretboard_04_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_5
							texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR70_neckhead
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Schecter/gtr70_neckhead_d`
					material = GTR70_neckhead_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Schecter/GTR70_neckhead_LD07`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR70_Bridge
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR70_SCH_Ultra_pickup
		}
		CAS_Guitar_Misc = {
			desc_id = GTR_Misc_Switch4
		}
	}
	{
		genre = [
			Pop
			`Classic	Rock`
		]
		CAS_Guitar_Body = {
			desc_id = GTR70_SCH_Ultra
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Schecter/GTR70_SCH_Ultra_d`
					material = GTR70_SCH_Ultra_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Schecter/GTR70_SCH_Ultra_LD03`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_Schecter04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
					material = GTR_Fretboard_04_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_5
							texture = `tex/models/Characters/Layers/CAG/GH5/22_fret_LD44_Shctr_Blocks`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR70_neckhead
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Schecter/gtr70_neckhead_d`
					material = GTR70_neckhead_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Schecter/GTR70_neckhead_LD04`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = GTR70_pg
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Schecter/gtr70_pg_d`
					material = GTR70_pg_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Schecter/GTR70_pg_LD02`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR70_Bridge
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_02
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR70_SCH_Ultra_pickup3
		}
		CAS_Guitar_Misc = {
			desc_id = GTR_Misc_Switch4
		}
	}
	{
		genre = [
			`Heavy	Metal`
			Goth
		]
		CAS_Guitar_Body = {
			desc_id = GTR71_SCH_C1
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Schecter/gtr71_sch_c1_d`
					material = GTR71_SCH_C1_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Schecter/gtr71_sch_c1_LD05`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_24Fret_Schecter04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
					material = GTR_Fretboard24_04_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD46_Shctr_Cutblock`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR71_Neckhead_01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Schecter/gtr71_neckhead_01_d`
					material = GTR71_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Schecter/GTR71_Neckhead_01_LD05`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR71_Bridge
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR70_SCH_Ultra_pickup
		}
		CAS_Guitar_Misc = {
			desc_id = GTR_Misc_Switch4
		}
	}
	{
		genre = [
			`Heavy	Metal`
			Goth
			Punk
		]
		CAS_Guitar_Body = {
			desc_id = GTR71_SCH_C1
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Schecter/gtr71_sch_c1_d`
					material = GTR71_SCH_C1_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Schecter/gtr71_sch_c1_LD01`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_24Fret_Schecter04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
					material = GTR_Fretboard24_04_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD42_Shctr_Ultracure`
							flags = 36
							Color = red_1
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR71_Neckhead_01
			chosen_materials = {
				material1 = grey_2guitar
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Schecter/gtr71_neckhead_01_d`
					material = GTR71_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Schecter/GTR71_Neckhead_01_LD01`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR71_Bridge
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01c
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_EMG_pickup2
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = GTR_Misc_Switch4
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
	}
	{
		genre = [
			`Heavy	Metal`
			Goth
			Punk
		]
		CAS_Guitar_Body = {
			desc_id = GTR71_SCH_C1
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Schecter/gtr71_sch_c1_d`
					material = GTR71_SCH_C1_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/Schecter/gtr71_sch_c1_LD02`
							flags = 4
						}
						{
							texture = `tex/models/Characters/Layers/CAG/Schecter/gtr71_sch_c1_DTL02`
							flags = 4
							Color = red_1
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_24Fret_Schecter04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
					material = GTR_Fretboard24_04_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD35_Shctr_SheDevil`
							flags = 36
							Color = red_1
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR71_Neckhead_01
			chosen_materials = {
				material1 = grey_2guitar
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Schecter/gtr71_neckhead_01_d`
					material = GTR71_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/Schecter/GTR71_Neckhead_01_LD02`
							flags = 36
						}
						{
							texture = `tex/models/Characters/Layers/CAG/Schecter/GTR71_Neckhead_01_DTL02`
							flags = 36
							Color = red_1
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR71_Bridge
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01c
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_EMG_pickup2
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = GTR_Misc_Switch4
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
	}
	{
		genre = [
			`Glam	Rock`
			Pop
		]
		CAS_Guitar_Body = {
			desc_id = GTR71_SCH_C1
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Schecter/gtr71_sch_c1_d`
					material = GTR71_SCH_C1_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Schecter/gtr71_sch_c1_LD02`
							flags = 4
							Color = red_1
						}
						{
							texture = `tex/models/Characters/Layers/CAG/All_Clear2`
							flags = 4
						}
						{
							texture = `tex/models/Characters/Layers/CAG/Schecter/gtr71_sch_c1_DTL02`
							flags = 4
							Color = red_1
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_24Fret_Schecter04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
					material = GTR_Fretboard24_04_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD34_Shctr_LadyLuck`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR71_Neckhead_01
			chosen_materials = {
				material1 = grey_2guitar
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Schecter/gtr71_neckhead_01_d`
					material = GTR71_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Schecter/GTR71_Neckhead_01_LD02`
							flags = 36
							Color = red_1
						}
						{
							texture = `tex/models/Characters/Layers/CAG/All_Clear2`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR71_Bridge
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_01c
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_EMG_pickup5
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = GTR_Misc_Switch4
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
	}
	{
		genre = [
			Punk
			Pop
		]
		CAS_Guitar_Body = {
			desc_id = GTR73_SCH_S1
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Schecter/GTR73_SCH_S1_d`
					material = GTR73_SCH_S1_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Schecter/GTR73_SCH_S1_LD02`
							flags = 4
							Color = grey_5guitar
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_Schecter04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
					material = GTR_Fretboard_04_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_5
							texture = `tex/models/Characters/Layers/CAG/GH5/22_fret_LD45_Shctr_Tempest`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR73_Neckhead_01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Schecter/gtr73_neckhead_d`
					material = GTR73_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Schecter/GTR73_neckhead_LD02`
							flags = 36
							Color = grey_5guitar
						}
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/Schecter/GTR73_neckhead_LD03`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = GTR73_PG1
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Schecter/GTR73_PG1_d`
					material = GTR73_PG1_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Schecter/GTR73_PG1_LD01`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR_Bridge_01
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_04c
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_Pickup_Type2_PAF1
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = GTR_Misc_Switch4
		}
	}
	{
		genre = [
			Punk
		]
		CAS_Guitar_Body = {
			desc_id = GTR73_SCH_S1
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Schecter/GTR73_SCH_S1_d`
					material = GTR73_SCH_S1_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Schecter/GTR73_SCH_S1_LD01`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = CAG_22Fret_Schecter04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
					material = GTR_Fretboard_04_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_5
							texture = `tex/models/Characters/Layers/CAG/GH5/22_fret_LD45_Shctr_Tempest`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR73_Neckhead_01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Schecter/gtr73_neckhead_d`
					material = GTR73_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Schecter/GTR73_neckhead_LD01`
							flags = 36
						}
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAG/Schecter/GTR73_neckhead_LD03`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = GTR73_PG1
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/Schecter/GTR73_PG1_d`
					material = GTR73_PG1_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/Schecter/GTR73_PG1_LD01`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR_Bridge_01
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR_Knob_04c
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_Pickup_Type2_PAF1
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Guitar_Misc = {
			desc_id = GTR_Misc_Switch4
		}
	}
]
cas_preset_basses = [
	{
		genre = [
			`Glam	Rock`
		]
		CAS_Bass_Body = {
			desc_id = Bass14_ESP_Surveyor
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Bass\ESP\bass14_esp_surveyor_d`
					material = Bass14_ESP_Surveyor_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass14_ESP_AX_LD_01`
							Color = Black_1guitar
						}
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass14_ESP_AX_DTL_11`
							flags = 4
							Color = yellow_1guitar
						}
					]
				}
			]
		}
		CAS_Bass_Neck = {
			desc_id = Bass_Fretboard_22a
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_02`
					material = Bass_Fretboard_22a_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_Inlay_06`
							flags = 4
							Color = grey_5guitar
						}
					]
				}
			]
		}
		CAS_Bass_Head = {
			desc_id = Bass14_Neckhead_04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass9_neckhead_d_04`
					material = Bass14_Neckhead_04_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass9_Neckhead4_LD_01`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Bass_Pickguards = {
			desc_id = None
		}
		CAS_Bass_Pickups = {
			desc_id = Bass9_Pkup_Type1_Blk_02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_bass_Bridges = {
			desc_id = Bass14_Bridge_4str_01
		}
		CAS_Bass_Knobs = {
			desc_id = Bass14_ESP_Knob_10_04
		}
		CAS_Bass_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			Goth
			`Black	Metal`
		]
		CAS_Bass_Body = {
			desc_id = Bass63_EX
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Bass\ESP\bass63_ex_d`
					material = Bass63_EX_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass63_Ex_LD_01`
							flags = 4
						}
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass63_Ex_DTL_11`
							a = 25
							flags = 4
							Color = red_1
						}
					]
				}
			]
		}
		CAS_Bass_Neck = {
			desc_id = Bass_Fretboard_22d
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_05`
					material = Bass_Fretboard_22d_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_Inlay_06`
							flags = 4
							Color = grey_5guitar
						}
					]
				}
			]
		}
		CAS_Bass_Head = {
			desc_id = Bass63_Neckhead
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass63_neckhead_d`
					material = Bass63_Neckhead_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass63_Neckhead_LD_01`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Bass_Pickguards = {
			desc_id = None
		}
		CAS_Bass_Pickups = {
			desc_id = Bass9_Pkup_Type1_Blk_02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_bass_Bridges = {
			desc_id = Bass17_Bridge_4str_05
		}
		CAS_Bass_Knobs = {
			desc_id = Bass63_Knob_Type1
		}
		CAS_Bass_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			Pop
			`Glam	Rock`
		]
		CAS_Bass_Body = {
			desc_id = Bass63_EX
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Bass\ESP\bass63_ex_d`
					material = Bass63_EX_Primary
					diffuse
					layers = [
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							Color = violet_2
							y_trans = -38
							x_scale = 2
							y_scale = 3
							rot = 5923
							flags = 3
							x_trans = 8
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							Color = purple_blue_2
							y_trans = -36
							x_scale = 2
							y_scale = 3
							rot = 5923
							flags = 3
							x_trans = 6
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = 5
							y_trans = -30
							x_scale = 2
							y_scale = 3
							rot = 5923
							flags = 3
							Color = purple_blue_2
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							Color = navy_3
							y_trans = -31
							x_scale = 2
							y_scale = 3
							rot = 5923
							flags = 3
							x_trans = 3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							Color = blue_3
							x_trans = 0
							x_scale = 2
							y_scale = 3
							rot = 5923
							flags = 3
							y_trans = -23
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							Color = teal_3
							x_trans = -2
							y_trans = -27
							x_scale = 2
							y_scale = 3
							flags = 3
							rot = 5923
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = -3
							y_trans = -21
							x_scale = 2
							y_scale = 3
							rot = 6193
							flags = 3
							Color = teal_3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							Color = green_3guitar
							y_trans = -16
							x_scale = 2
							y_scale = 3
							rot = 133
							flags = 3
							x_trans = -6
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							Color = green_3guitar
							y_trans = 7
							x_scale = 2
							y_scale = 3
							rot = 133
							flags = 3
							x_trans = -4
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							Color = green_3guitar
							x_trans = -5
							y_trans = 11
							x_scale = 2
							y_scale = 3
							flags = 3
							rot = 133
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = -6
							y_trans = 6
							x_scale = 2
							y_scale = 3
							rot = 433
							flags = 3
							Color = green_3guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							Color = yellow_green_1guitar
							y_trans = -12
							x_scale = 2
							y_scale = 3
							rot = 433
							flags = 3
							x_trans = -8
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							Color = yellow_green_1guitar
							y_trans = -17
							x_scale = 2
							y_scale = 3
							rot = 433
							flags = 3
							x_trans = -9
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							Color = yellow_green_1guitar
							x_trans = -9
							x_scale = 2
							y_scale = 3
							rot = 433
							flags = 3
							y_trans = -21
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							Color = yellow_2guitar
							x_trans = -12
							y_trans = -19
							x_scale = 2
							rot = 433
							flags = 3
							y_scale = 3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							Color = yellow_2guitar
							y_trans = -15
							x_scale = 2
							y_scale = 4
							rot = 433
							flags = 3
							x_trans = -10
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = -9
							y_trans = -7
							x_scale = 4
							y_scale = 6
							rot = 433
							flags = 3
							Color = yellow_2guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							Color = yellow_orange_2
							y_trans = 10
							x_scale = 4
							y_scale = 6
							rot = 433
							flags = 3
							x_trans = -8
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = -8
							y_trans = 1
							x_scale = 4
							y_scale = 6
							rot = 793
							flags = 3
							Color = yellow_orange_2
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = -11
							y_trans = 7
							x_scale = 4
							y_scale = 6
							rot = 1093
							flags = 3
							Color = orange_3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = -14
							y_trans = -7
							x_scale = 4
							y_scale = 6
							rot = 1633
							flags = 3
							Color = red_orange_4
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = -15
							y_trans = -14
							x_scale = 4
							y_scale = 6
							rot = 1633
							flags = 3
							Color = red_orange_5
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							Color = red_orange_3
							y_trans = -11
							x_scale = 4
							y_scale = 6
							rot = 2263
							flags = 3
							x_trans = -19
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = -15
							y_trans = 2
							x_scale = 4
							y_scale = 6
							rot = 2263
							flags = 3
							Color = red_orange_3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							Color = red_1
							y_trans = 9
							x_scale = 4
							y_scale = 6
							rot = 2803
							flags = 3
							x_trans = -17
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = -19
							y_trans = 5
							x_scale = 5
							y_scale = 6
							rot = 3193
							flags = 3
							Color = red_3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = -18
							y_trans = -4
							x_scale = 5
							y_scale = 6
							rot = 3193
							flags = 3
							Color = red_4
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = -24
							y_trans = -9
							x_scale = 5
							y_scale = 6
							rot = 3553
							flags = 3
							Color = red_3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = -23
							y_trans = 4
							x_scale = 5
							y_scale = 6
							rot = 4033
							flags = 3
							Color = violet_1
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = -20
							y_trans = 11
							x_scale = 5
							y_scale = 6
							rot = 4393
							flags = 3
							Color = violet_3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = -25
							y_trans = 20
							x_scale = 7
							y_scale = 8
							rot = 4663
							flags = 3
							Color = purple_blue_1
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = -26
							y_trans = 3
							x_scale = 7
							y_scale = 8
							rot = 5143
							flags = 3
							Color = purple_blue_4
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = -25
							y_trans = 12
							x_scale = 7
							y_scale = 8
							rot = 5743
							flags = 3
							Color = navy_4
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = -35
							y_trans = 3
							x_scale = 7
							y_scale = 8
							rot = 13
							flags = 3
							Color = Blue_2
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = -32
							y_trans = 10
							x_scale = 7
							y_scale = 12
							rot = 433
							flags = 3
							Color = teal_3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = -30
							y_trans = 16
							x_scale = 7
							y_scale = 12
							rot = 943
							flags = 3
							Color = green_3guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = -32
							y_trans = 27
							x_scale = 10
							y_scale = 15
							rot = 1393
							flags = 3
							Color = green_2guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = -36
							y_trans = 22
							x_scale = 13
							y_scale = 18
							rot = 2173
							flags = 3
							Color = yellow_green_2guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							y_trans = 34
							x_scale = 16
							y_scale = 21
							rot = 1603
							flags = 3
							x_trans = -42
						}
					]
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass63_Ex_LD_01`
							flags = 4
							Color = Black_1guitar
						}
						{
							texture = `tex/models/Characters/Layers/CAG/All_Clear2`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Bass_Neck = {
			desc_id = Bass_Fretboard_24d
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_04`
					material = Bass_Fretboard_24d_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_24_inlay_05`
							flags = 4
							Color = grey_5guitar
						}
					]
				}
			]
		}
		CAS_Bass_Head = {
			desc_id = Bass63_Neckhead
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass63_neckhead_d`
					material = Bass63_Neckhead_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass63_Neckhead_LD_01`
							flags = 36
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Bass_Pickguards = {
			desc_id = None
		}
		CAS_Bass_Pickups = {
			desc_id = Bass9_Pkup_Type1_Blk_02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_bass_Bridges = {
			desc_id = Bass17_Bridge_4str_05
		}
		CAS_Bass_Knobs = {
			desc_id = Bass63_Knob_Type1
		}
		CAS_Bass_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			Pop
			`Glam	Rock`
		]
		CAS_Bass_Body = {
			desc_id = Bass63_EX
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Bass\ESP\bass63_ex_d`
					material = Bass63_EX_Primary
					diffuse
					layers = [
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							Color = violet_2
							y_trans = -38
							x_scale = 2
							y_scale = 3
							rot = 5923
							flags = 3
							x_trans = 8
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							Color = purple_blue_2
							y_trans = -36
							x_scale = 2
							y_scale = 3
							rot = 5923
							flags = 3
							x_trans = 6
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = 5
							y_trans = -30
							x_scale = 2
							y_scale = 3
							rot = 5923
							flags = 3
							Color = purple_blue_2
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							Color = navy_3
							y_trans = -31
							x_scale = 2
							y_scale = 3
							rot = 5923
							flags = 3
							x_trans = 3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							Color = blue_3
							x_trans = 0
							x_scale = 2
							y_scale = 3
							rot = 5923
							flags = 3
							y_trans = -23
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							Color = teal_3
							x_trans = -2
							y_trans = -27
							x_scale = 2
							y_scale = 3
							flags = 3
							rot = 5923
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = -3
							y_trans = -21
							x_scale = 2
							y_scale = 3
							rot = 6193
							flags = 3
							Color = teal_3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							Color = green_3guitar
							y_trans = -16
							x_scale = 2
							y_scale = 3
							rot = 133
							flags = 3
							x_trans = -6
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							Color = green_3guitar
							y_trans = 7
							x_scale = 2
							y_scale = 3
							rot = 133
							flags = 3
							x_trans = -4
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							Color = green_3guitar
							x_trans = -5
							y_trans = 11
							x_scale = 2
							y_scale = 3
							flags = 3
							rot = 133
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = -6
							y_trans = 6
							x_scale = 2
							y_scale = 3
							rot = 433
							flags = 3
							Color = green_3guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							Color = yellow_green_1guitar
							y_trans = -12
							x_scale = 2
							y_scale = 3
							rot = 433
							flags = 3
							x_trans = -8
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							Color = yellow_green_1guitar
							y_trans = -17
							x_scale = 2
							y_scale = 3
							rot = 433
							flags = 3
							x_trans = -9
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							Color = yellow_green_1guitar
							x_trans = -9
							x_scale = 2
							y_scale = 3
							rot = 433
							flags = 3
							y_trans = -21
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							Color = yellow_2guitar
							x_trans = -12
							y_trans = -19
							x_scale = 2
							rot = 433
							flags = 3
							y_scale = 3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							Color = yellow_2guitar
							y_trans = -15
							x_scale = 2
							y_scale = 4
							rot = 433
							flags = 3
							x_trans = -10
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = -9
							y_trans = -7
							x_scale = 4
							y_scale = 6
							rot = 433
							flags = 3
							Color = yellow_2guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							Color = yellow_orange_2
							y_trans = 10
							x_scale = 4
							y_scale = 6
							rot = 433
							flags = 3
							x_trans = -8
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = -8
							y_trans = 1
							x_scale = 4
							y_scale = 6
							rot = 793
							flags = 3
							Color = yellow_orange_2
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = -11
							y_trans = 7
							x_scale = 4
							y_scale = 6
							rot = 1093
							flags = 3
							Color = orange_3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = -14
							y_trans = -7
							x_scale = 4
							y_scale = 6
							rot = 1633
							flags = 3
							Color = red_orange_4
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = -15
							y_trans = -14
							x_scale = 4
							y_scale = 6
							rot = 1633
							flags = 3
							Color = red_orange_5
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							Color = red_orange_3
							y_trans = -11
							x_scale = 4
							y_scale = 6
							rot = 2263
							flags = 3
							x_trans = -19
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = -15
							y_trans = 2
							x_scale = 4
							y_scale = 6
							rot = 2263
							flags = 3
							Color = red_orange_3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							Color = red_1
							y_trans = 9
							x_scale = 4
							y_scale = 6
							rot = 2803
							flags = 3
							x_trans = -17
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = -19
							y_trans = 5
							x_scale = 5
							y_scale = 6
							rot = 3193
							flags = 3
							Color = red_3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = -18
							y_trans = -4
							x_scale = 5
							y_scale = 6
							rot = 3193
							flags = 3
							Color = red_4
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = -24
							y_trans = -9
							x_scale = 5
							y_scale = 6
							rot = 3553
							flags = 3
							Color = red_3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = -23
							y_trans = 4
							x_scale = 5
							y_scale = 6
							rot = 4033
							flags = 3
							Color = violet_1
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = -20
							y_trans = 11
							x_scale = 5
							y_scale = 6
							rot = 4393
							flags = 3
							Color = violet_3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = -25
							y_trans = 20
							x_scale = 7
							y_scale = 8
							rot = 4663
							flags = 3
							Color = purple_blue_1
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = -26
							y_trans = 3
							x_scale = 7
							y_scale = 8
							rot = 5143
							flags = 3
							Color = purple_blue_4
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = -25
							y_trans = 12
							x_scale = 7
							y_scale = 8
							rot = 5743
							flags = 3
							Color = navy_4
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = -35
							y_trans = 3
							x_scale = 7
							y_scale = 8
							rot = 13
							flags = 3
							Color = Blue_2
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = -32
							y_trans = 10
							x_scale = 7
							y_scale = 12
							rot = 433
							flags = 3
							Color = teal_3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = -30
							y_trans = 16
							x_scale = 7
							y_scale = 12
							rot = 943
							flags = 3
							Color = green_3guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = -32
							y_trans = 27
							x_scale = 10
							y_scale = 15
							rot = 1393
							flags = 3
							Color = green_2guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = -36
							y_trans = 22
							x_scale = 13
							y_scale = 18
							rot = 2173
							flags = 3
							Color = yellow_green_2guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							y_trans = 34
							x_scale = 16
							y_scale = 21
							rot = 1603
							flags = 3
							x_trans = -42
						}
					]
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass63_Ex_LD_01`
							flags = 4
							Color = grey_5guitar
						}
						{
							texture = `tex/models/Characters/Layers/CAG/All_Clear2`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Bass_Neck = {
			desc_id = Bass_Fretboard_22b
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_03`
					material = Bass_Fretboard_22b_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_Inlay_06`
							flags = 4
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Bass_Head = {
			desc_id = Bass63_Neckhead
		}
		CAS_Bass_Pickguards = {
			desc_id = None
		}
		CAS_Bass_Pickups = {
			desc_id = Bass9_Pkup_Type1_Blk_02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_bass_Bridges = {
			desc_id = Bass17_Bridge_4str_05
		}
		CAS_Bass_Knobs = {
			desc_id = Bass63_Knob_Type1
		}
		CAS_Bass_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Glam	Rock`
		]
		CAS_Bass_Body = {
			desc_id = Bass63_EX
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Bass\ESP\bass63_ex_d`
					material = Bass63_EX_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass63_Ex_LD_01`
							flags = 4
						}
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR63F_ESP_EX_DTL_07`
							flags = 4
							Color = yellow_2guitar
						}
					]
					layers = [
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = yellow_2guitar
							x_trans = -31
							x_scale = 7
							y_scale = 10
							rot = 390
							flags = 259
							y_trans = 24
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = yellow_2guitar
							x_trans = -25
							x_scale = 7
							y_scale = 10
							rot = 390
							flags = 259
							y_trans = 16
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = yellow_2guitar
							x_trans = -42
							y_trans = 38
							y_scale = 10
							rot = 390
							flags = 259
							x_scale = 26
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = yellow_2guitar
							x_trans = -19
							x_scale = 7
							y_scale = 10
							rot = 390
							flags = 259
							y_trans = 9
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = yellow_2guitar
							x_trans = -13
							x_scale = 7
							y_scale = 10
							rot = 6163
							flags = 259
							y_trans = 6
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = yellow_2guitar
							y_trans = 7
							x_scale = 7
							y_scale = 10
							rot = 6163
							flags = 259
							x_trans = -7
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = yellow_2guitar
							y_trans = 8
							x_scale = 7
							y_scale = 10
							rot = 6163
							flags = 259
							x_trans = -1
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = yellow_2guitar
							x_trans = 5
							x_scale = 7
							y_scale = 10
							rot = 180
							flags = 259
							y_trans = -32
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = yellow_2guitar
							x_trans = -1
							x_scale = 7
							y_scale = 10
							rot = 180
							flags = 259
							y_trans = -27
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = yellow_2guitar
							y_trans = -23
							x_scale = 7
							y_scale = 10
							rot = 180
							flags = 259
							x_trans = -7
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = yellow_2guitar
							x_trans = -13
							x_scale = 7
							y_scale = 10
							rot = 180
							flags = 259
							y_trans = -19
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = yellow_2guitar
							x_trans = -19
							x_scale = 7
							y_scale = 10
							rot = 5773
							flags = 259
							y_trans = -21
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = yellow_2guitar
							y_trans = -27
							x_scale = 7
							y_scale = 10
							rot = 5773
							flags = 259
							x_trans = -25
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = yellow_2guitar
							y_trans = -19
							x_scale = 7
							y_scale = 10
							rot = 1033
							flags = 259
							x_trans = -32
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							x_trans = -35
							y_trans = -1
							x_scale = 7
							y_scale = 10
							rot = 1033
							flags = 259
							Color = yellow_2guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = yellow_2guitar
							y_trans = 17
							x_scale = 7
							y_scale = 10
							rot = 1033
							flags = 259
							x_trans = -38
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = yellow_2guitar
							y_trans = 35
							x_scale = 7
							y_scale = 10
							rot = 1033
							flags = 259
							x_trans = -42
						}
					]
				}
			]
		}
		CAS_Bass_Neck = {
			desc_id = Bass_Fretboard_22d
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_05`
					material = Bass_Fretboard_22d_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_Inlay_06`
							flags = 4
							Color = grey_5guitar
						}
					]
				}
			]
		}
		CAS_Bass_Head = {
			desc_id = Bass63_Neckhead
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass63_neckhead_d`
					material = Bass63_Neckhead_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass63_Neckhead_LD_01`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Bass_Pickguards = {
			desc_id = None
		}
		CAS_Bass_Pickups = {
			desc_id = Bass9_Pkup_Type1_Blk_02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_bass_Bridges = {
			desc_id = Bass17_Bridge_4str_05
		}
		CAS_Bass_Knobs = {
			desc_id = Bass63_Knob_Type1
		}
		CAS_Bass_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			Pop
			`Glam	Rock`
		]
		CAS_Bass_Body = {
			desc_id = Bass17_ESP_EC_01
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Bass\ESP\bass17_esp_ec_d`
					material = Bass17_ESP_EC_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass17_ESP_AX_LD_01`
							Color = violet_4
						}
					]
					layers = [
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 50
							x_trans = 5
							y_trans = 20
							x_scale = 4
							y_scale = 31
							rot = 2353
							flags = 259
							Color = green_1guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 50
							x_trans = -4
							y_trans = 20
							x_scale = 2
							y_scale = 57
							rot = 2353
							flags = 259
							Color = green_1guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 50
							x_trans = -17
							y_trans = 7
							x_scale = 1
							y_scale = 80
							rot = 2353
							flags = 259
							Color = green_1guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 50
							x_trans = -13
							y_trans = 9
							x_scale = 2
							y_scale = 81
							rot = 2353
							flags = 259
							Color = green_1guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 50
							x_trans = -28
							y_trans = -2
							x_scale = 2
							y_scale = 80
							rot = 2353
							flags = 259
							Color = green_1guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 50
							x_trans = -26
							y_trans = 4
							x_scale = 1
							y_scale = 73
							rot = 2353
							flags = 259
							Color = green_1guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 50
							x_trans = -23
							y_trans = 10
							x_scale = 4
							y_scale = 73
							rot = 2353
							flags = 259
							Color = green_1guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 50
							x_trans = -34
							y_trans = -8
							x_scale = 2
							y_scale = 73
							rot = 2353
							flags = 259
							Color = green_1guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 50
							x_trans = -38
							y_trans = -10
							x_scale = 1
							y_scale = 73
							rot = 2353
							flags = 259
							Color = green_1guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 50
							x_trans = -42
							y_trans = -14
							x_scale = 4
							y_scale = 73
							rot = 2353
							flags = 259
							Color = green_1guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 50
							x_trans = -47
							y_trans = -15
							x_scale = 1
							y_scale = 73
							rot = 2353
							flags = 259
							Color = green_1guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 50
							x_trans = -29
							y_trans = -5
							x_scale = 1
							y_scale = 84
							rot = 913
							flags = 259
							Color = navy_2
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 50
							x_trans = -24
							y_trans = -9
							x_scale = 4
							y_scale = 84
							rot = 913
							flags = 259
							Color = navy_2
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 50
							x_trans = -17
							y_trans = -8
							x_scale = 1
							y_scale = 94
							rot = 913
							flags = 259
							Color = navy_2
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 50
							x_trans = -11
							y_trans = -7
							x_scale = 3
							y_scale = 94
							rot = 913
							flags = 259
							Color = navy_2
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 50
							x_trans = 3
							y_trans = -4
							x_scale = 1
							y_scale = 52
							rot = 913
							flags = 259
							Color = navy_2
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 50
							x_trans = 1
							y_trans = -24
							x_scale = 3
							y_scale = 18
							rot = 913
							flags = 259
							Color = navy_2
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 50
							x_trans = -31
							y_trans = 7
							x_scale = 3
							y_scale = 84
							rot = 913
							flags = 259
							Color = navy_2
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 50
							x_trans = -37
							y_trans = 22
							x_scale = 1
							y_scale = 72
							rot = 913
							flags = 259
							Color = navy_2
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 50
							x_trans = -37
							y_trans = 35
							x_scale = 3
							y_scale = 72
							rot = 913
							flags = 259
							Color = navy_2
						}
					]
				}
			]
		}
		CAS_Bass_Neck = {
			desc_id = Bass_Fretboard_24d
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_04`
					material = Bass_Fretboard_24d_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_4
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_24_inlay_01`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Bass_Head = {
			desc_id = Bass14_Neckhead_03
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/Bass9_Neckhead_D_03`
					material = Bass14_Neckhead_03_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass9_Neckhead3_LD_01`
							flags = 36
							Color = violet_4
						}
					]
				}
			]
		}
		CAS_Bass_Pickguards = {
			desc_id = None
		}
		CAS_Bass_Pickups = {
			desc_id = Bass9_Pkup_Type1_Blk_02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_bass_Bridges = {
			desc_id = Bass17_Bridge_4str_04
		}
		CAS_Bass_Knobs = {
			desc_id = Bass17_ESP_Knob_10
		}
		CAS_Bass_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			Pop
			Punk
			rock
		]
		CAS_Bass_Body = {
			desc_id = Bass17_ESP_EC_01
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Bass\ESP\bass17_esp_ec_d`
					material = Bass17_ESP_EC_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass17_ESP_AX_LD_01`
							Color = Black_1guitar
						}
					]
					layers = [
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 50
							x_trans = 5
							y_trans = 20
							x_scale = 4
							rot = 2353
							flags = 259
							y_scale = 31
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 50
							y_trans = 20
							x_scale = 1
							y_scale = 57
							rot = 2353
							flags = 259
							x_trans = 0
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 50
							x_trans = -4
							x_scale = 2
							y_scale = 57
							rot = 2353
							flags = 259
							y_trans = 20
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 50
							x_trans = -17
							y_trans = 7
							x_scale = 1
							rot = 2353
							flags = 259
							y_scale = 80
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 50
							x_trans = -13
							y_trans = 9
							x_scale = 2
							rot = 2353
							flags = 259
							y_scale = 81
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 50
							x_trans = -28
							y_trans = -2
							x_scale = 2
							rot = 2353
							flags = 259
							y_scale = 80
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 50
							y_trans = 4
							x_scale = 1
							y_scale = 73
							rot = 2353
							flags = 259
							x_trans = -26
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 50
							x_trans = -23
							y_trans = 10
							x_scale = 4
							rot = 2353
							flags = 259
							y_scale = 73
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 50
							y_trans = -8
							x_scale = 2
							y_scale = 73
							rot = 2353
							flags = 259
							x_trans = -34
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 50
							x_trans = -38
							x_scale = 1
							y_scale = 73
							rot = 2353
							flags = 259
							y_trans = -10
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 50
							y_trans = -14
							x_scale = 4
							y_scale = 73
							rot = 2353
							flags = 259
							x_trans = -42
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 50
							y_trans = -15
							x_scale = 1
							y_scale = 73
							rot = 2353
							flags = 259
							x_trans = -47
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 50
							x_trans = -47
							y_trans = -15
							x_scale = 1
							y_scale = 73
							rot = 2353
							flags = 259
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = violet_4
							a = 50
							x_trans = -29
							y_trans = -5
							x_scale = 1
							rot = 913
							flags = 259
							y_scale = 84
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = violet_4
							a = 50
							x_trans = -24
							x_scale = 4
							y_scale = 84
							rot = 913
							flags = 259
							y_trans = -9
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = violet_4
							a = 50
							x_trans = -17
							y_trans = -8
							x_scale = 1
							rot = 913
							flags = 259
							y_scale = 94
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = violet_4
							a = 50
							y_trans = -7
							x_scale = 3
							y_scale = 94
							rot = 913
							flags = 259
							x_trans = -11
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = violet_4
							a = 50
							y_trans = -4
							x_scale = 1
							y_scale = 52
							rot = 913
							flags = 259
							x_trans = 3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = violet_4
							a = 50
							x_trans = 1
							x_scale = 3
							y_scale = 18
							rot = 913
							flags = 259
							y_trans = -24
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = violet_4
							a = 50
							x_trans = -31
							x_scale = 3
							y_scale = 84
							rot = 913
							flags = 259
							y_trans = 7
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = violet_4
							a = 50
							y_trans = 22
							x_scale = 1
							y_scale = 72
							rot = 913
							flags = 259
							x_trans = -37
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = violet_4
							a = 50
							x_trans = -37
							y_trans = 35
							y_scale = 72
							rot = 913
							flags = 259
							x_scale = 3
						}
					]
				}
			]
		}
		CAS_Bass_Neck = {
			desc_id = Bass_Fretboard_24d
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_04`
					material = Bass_Fretboard_24d_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_4
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_24_inlay_01`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Bass_Head = {
			desc_id = Bass14_Neckhead_03
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/Bass9_Neckhead_D_03`
					material = Bass14_Neckhead_03_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass9_Neckhead3_LD_01`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Bass_Pickguards = {
			desc_id = None
		}
		CAS_Bass_Pickups = {
			desc_id = Bass9_Pkup_Type1_Blk_02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_bass_Bridges = {
			desc_id = Bass17_Bridge_4str_04
		}
		CAS_Bass_Knobs = {
			desc_id = Bass17_ESP_Knob_10
		}
		CAS_Bass_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			Punk
			rock
		]
		CAS_Bass_Body = {
			desc_id = Bass17_ESP_EC_01
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Bass\ESP\bass17_esp_ec_d`
					material = Bass17_ESP_EC_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass17_ESP_AX_LD_01`
							Color = Black_1guitar
						}
					]
					layers = [
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 50
							x_trans = 5
							y_trans = 20
							x_scale = 4
							rot = 2353
							flags = 259
							y_scale = 31
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 50
							y_trans = 20
							x_scale = 1
							y_scale = 57
							rot = 2353
							flags = 259
							x_trans = 0
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 50
							x_trans = -4
							x_scale = 2
							y_scale = 57
							rot = 2353
							flags = 259
							y_trans = 20
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 50
							x_trans = -17
							y_trans = 7
							x_scale = 1
							rot = 2353
							flags = 259
							y_scale = 80
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 50
							x_trans = -13
							y_trans = 9
							x_scale = 2
							rot = 2353
							flags = 259
							y_scale = 81
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 50
							x_trans = -28
							y_trans = -2
							x_scale = 2
							rot = 2353
							flags = 259
							y_scale = 80
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 50
							y_trans = 4
							x_scale = 1
							y_scale = 73
							rot = 2353
							flags = 259
							x_trans = -26
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 50
							x_trans = -23
							y_trans = 10
							x_scale = 4
							rot = 2353
							flags = 259
							y_scale = 73
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 50
							y_trans = -8
							x_scale = 2
							y_scale = 73
							rot = 2353
							flags = 259
							x_trans = -34
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 50
							x_trans = -38
							x_scale = 1
							y_scale = 73
							rot = 2353
							flags = 259
							y_trans = -10
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 50
							y_trans = -14
							x_scale = 4
							y_scale = 73
							rot = 2353
							flags = 259
							x_trans = -42
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							a = 50
							y_trans = -15
							x_scale = 1
							y_scale = 73
							rot = 2353
							flags = 259
							x_trans = -47
						}
					]
				}
			]
		}
		CAS_Bass_Neck = {
			desc_id = Bass_Fretboard_24d
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_04`
					material = Bass_Fretboard_24d_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_4
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_24_inlay_01`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Bass_Head = {
			desc_id = Bass14_Neckhead_03
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/Bass9_Neckhead_D_03`
					material = Bass14_Neckhead_03_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass9_Neckhead3_LD_01`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Bass_Pickguards = {
			desc_id = None
		}
		CAS_Bass_Pickups = {
			desc_id = Bass9_Pkup_Type1_Blk_02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_bass_Bridges = {
			desc_id = Bass17_Bridge_4str_04
		}
		CAS_Bass_Knobs = {
			desc_id = Bass17_ESP_Knob_10
		}
		CAS_Bass_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Classic	Rock`
			Pop
			rock
		]
		CAS_Bass_Body = {
			desc_id = Bass14_ESP_Surveyor
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Bass\ESP\bass14_esp_surveyor_d`
					material = Bass14_ESP_Surveyor_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass14_esp_AX_LD_11`
							flags = 4
							Color = orange_3
						}
						{
							Color = red_3
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass14_ESP_AX_DTL_05`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Bass_Neck = {
			desc_id = Bass_Fretboard_22c
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_04`
					material = Bass_Fretboard_22c_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_4
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_Inlay_06`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Bass_Head = {
			desc_id = Bass14_Neckhead_04
		}
		CAS_Bass_Pickguards = {
			desc_id = None
		}
		CAS_Bass_Pickups = {
			desc_id = Bass9_Pkup_Type3_Blk_2
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_bass_Bridges = {
			desc_id = Bass14_Bridge_4str_01
		}
		CAS_Bass_Knobs = {
			desc_id = Bass14_ESP_Knob_10_04
		}
	}
	{
		genre = [
			`Heavy	Metal`
			`Black	Metal`
		]
		CAS_Bass_Body = {
			desc_id = Bass9_ESP_AX_01
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Bass\ESP\bass9_esp_ax_d`
					material = Bass9_ESP_AX_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass9_ESP_AX_LD_01`
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Bass_Neck = {
			desc_id = Bass_Fretboard_22d
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_05`
					material = Bass_Fretboard_22d_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_4
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_Inlay_05`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Bass_Head = {
			desc_id = Bass9_Neckhead_01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass9_neckhead_d`
					material = Bass9_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass9_Neckhead_LD_01`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Bass_Pickguards = {
			desc_id = None
		}
		CAS_Bass_Pickups = {
			desc_id = Bass9_Pkup_Type1_Blk_02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_bass_Bridges = {
			desc_id = Bass9_Bridge_4str_01
		}
		CAS_Bass_Knobs = {
			desc_id = Bass9_ESP_Knob_10_04
		}
		CAS_Bass_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Heavy	Metal`
			Goth
		]
		CAS_Bass_Body = {
			desc_id = Bass9_ESP_AX_01
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Bass\ESP\bass9_esp_ax_d`
					material = Bass9_ESP_AX_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass9_ESP_AX_LD_01`
							Color = grey_5guitar
						}
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass9_ESP_AX_DTL_04`
							flags = 4
							Color = Black_1guitar
						}
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass9_ESP_AX_DTL_02`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Bass_Neck = {
			desc_id = Bass_Fretboard_22d
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_05`
					material = Bass_Fretboard_22d_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_4
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_Inlay_05`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Bass_Head = {
			desc_id = Bass9_Neckhead_01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass9_neckhead_d`
					material = Bass9_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass9_Neckhead_LD_01`
							flags = 36
						}
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass9_Neckhead_LD_02`
							flags = 36
							Color = grey_5guitar
						}
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass9_Neckhead_DTL_02`
							flags = 36
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Bass_Pickguards = {
			desc_id = None
		}
		CAS_Bass_Pickups = {
			desc_id = Bass9_Pkup_Type1_Blk_02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_bass_Bridges = {
			desc_id = Bass9_Bridge_4str_01
		}
		CAS_Bass_Knobs = {
			desc_id = Bass9_ESP_Knob_10_04
		}
		CAS_Bass_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Heavy	Metal`
			`Black	Metal`
			Punk
		]
		CAS_Bass_Body = {
			desc_id = Bass63_EX
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Bass\ESP\bass63_ex_d`
					material = Bass63_EX_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass63_Ex_LD_12`
							flags = 4
							Color = Black_1guitar
						}
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass63_Ex_DTL_13`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Bass_Neck = {
			desc_id = Bass_Fretboard_22a
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_02`
					material = Bass_Fretboard_22a_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_Inlay_06`
							flags = 4
							Color = grey_5guitar
						}
					]
				}
			]
		}
		CAS_Bass_Head = {
			desc_id = Bass63_Neckhead
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass63_neckhead_d`
					material = Bass63_Neckhead_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass63_Neckhead_LD_11`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Bass_Pickguards = {
			desc_id = None
		}
		CAS_Bass_Pickups = {
			desc_id = Bass9_Pkup_Type1_Blk_02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_bass_Bridges = {
			desc_id = Bass17_Bridge_4str_05
		}
		CAS_Bass_Knobs = {
			desc_id = Bass63_Knob_Type1
		}
		CAS_Bass_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			Goth
		]
		CAS_Bass_Body = {
			desc_id = Bass9_ESP_AX_01
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Bass\ESP\bass9_esp_ax_d`
					material = Bass9_ESP_AX_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass9_ESP_AX_LD_01`
							Color = Black_1guitar
						}
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass9_ESP_AX_DTL_01`
							flags = 4
							Color = violet_1
						}
					]
				}
			]
		}
		CAS_Bass_Neck = {
			desc_id = Bass_Fretboard_24d
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_04`
					material = Bass_Fretboard_24d_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_24_inlay_05`
							flags = 4
							Color = violet_2
						}
					]
				}
			]
		}
		CAS_Bass_Head = {
			desc_id = Bass9_Neckhead_01
			chosen_materials = {
				material1 = violet_1
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass9_neckhead_d`
					material = Bass9_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass9_Neckhead_LD_01`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Bass_Pickguards = {
			desc_id = None
		}
		CAS_Bass_Pickups = {
			desc_id = Bass9_Pkup_Type1_Blk_02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_bass_Bridges = {
			desc_id = Bass9_Bridge_4str_01
			chosen_materials = {
				material1 = violet_1
			}
		}
		CAS_Bass_Knobs = {
			desc_id = Bass9_ESP_Knob_10_04
			chosen_materials = {
				material1 = violet_1
			}
		}
		CAS_Bass_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			Goth
		]
		CAS_Bass_Body = {
			desc_id = Bass63_EX
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Bass\ESP\bass63_ex_d`
					material = Bass63_EX_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass63_Ex_LD_01`
							flags = 4
							Color = grey_5guitar
						}
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass63_Ex_DTL_02`
							flags = 4
							Color = navy_1
						}
					]
				}
			]
		}
		CAS_Bass_Neck = {
			desc_id = Bass_Fretboard_24d
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_04`
					material = Bass_Fretboard_24d_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_24_inlay_05`
							flags = 4
							Color = grey_5guitar
						}
					]
				}
			]
		}
		CAS_Bass_Head = {
			desc_id = Bass63_Neckhead
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass63_neckhead_d`
					material = Bass63_Neckhead_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass63_Neckhead_LD_01`
							flags = 36
							Color = grey_5guitar
						}
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass63_Neckhead_DTL_02`
							flags = 36
							Color = navy_1
						}
					]
				}
			]
		}
		CAS_Bass_Pickguards = {
			desc_id = None
		}
		CAS_Bass_Pickups = {
			desc_id = Bass9_Pkup_Type1_Blk_02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_bass_Bridges = {
			desc_id = Bass17_Bridge_4str_05
			chosen_materials = {
				material1 = navy_1
			}
		}
		CAS_Bass_Knobs = {
			desc_id = Bass63_Knob_Type1
			chosen_materials = {
				material1 = navy_1
			}
		}
		CAS_Bass_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			Goth
		]
		CAS_Bass_Body = {
			desc_id = Bass17_ESP_EC_01
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Bass\ESP\bass17_esp_ec_d`
					material = Bass17_ESP_EC_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass17_ESP_AX_LD_01`
							Color = navy_1
						}
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/bass17_ESP_AX_DTL_04`
							flags = 4
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Bass_Neck = {
			desc_id = Bass_Fretboard_22d
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_05`
					material = Bass_Fretboard_22d_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_4
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_Inlay_05`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Bass_Head = {
			desc_id = Bass14_Neckhead_03
			chosen_materials = {
				material1 = Black_1guitar
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/Bass9_Neckhead_D_03`
					material = Bass14_Neckhead_03_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass9_Neckhead3_LD_01`
							flags = 36
						}
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass9_Neckhead3_LD_02`
							flags = 36
							Color = navy_1
						}
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass9_Neckhead3_DTL_02`
							flags = 36
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Bass_Pickguards = {
			desc_id = None
		}
		CAS_Bass_Pickups = {
			desc_id = Bass9_Pkup_Type1_Blk_02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_bass_Bridges = {
			desc_id = Bass17_Bridge_4str_04
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Bass_Knobs = {
			desc_id = Bass17_ESP_Knob_10
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Bass_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			Punk
		]
		CAS_Bass_Body = {
			desc_id = Bass63_EX
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Bass\ESP\bass63_ex_d`
					material = Bass63_EX_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass63_Ex_LD_11`
							flags = 4
							Color = red_2
						}
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass63_Ex_DTL_13`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Bass_Neck = {
			desc_id = Bass_Fretboard_22a
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_02`
					material = Bass_Fretboard_22a_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_Inlay_06`
							flags = 4
							Color = grey_5guitar
						}
					]
				}
			]
		}
		CAS_Bass_Head = {
			desc_id = Bass63_Neckhead
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass63_neckhead_d`
					material = Bass63_Neckhead_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass63_Neckhead_LD_11`
							flags = 36
						}
						{
							texture = `tex/models/Characters/Layers/CAG/All_Clear3`
							flags = 36
						}
						{
							texture = `tex/models/Characters/Layers/CAG/All_Clear2`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Bass_Pickguards = {
			desc_id = None
		}
		CAS_Bass_Pickups = {
			desc_id = Bass9_Pkup_Type1_Blk_02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_bass_Bridges = {
			desc_id = Bass17_Bridge_4str_05
		}
		CAS_Bass_Knobs = {
			desc_id = Bass63_Knob_Type1
		}
		CAS_Bass_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			Punk
		]
		CAS_Bass_Body = {
			desc_id = Bass17_ESP_EC_01
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Bass\ESP\bass17_esp_ec_d`
					material = Bass17_ESP_EC_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass17_esp_EC_LD_12`
							flags = 4
							Color = navy_1
						}
						{
							texture = `tex/models/Characters/Layers/CAG/All_Clear3`
							flags = 4
						}
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass17_ESP_AX_DTL_13`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Bass_Neck = {
			desc_id = Bass_Fretboard_22a
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_02`
					material = Bass_Fretboard_22a_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_Inlay_06`
							flags = 4
							Color = grey_5guitar
						}
					]
				}
			]
		}
		CAS_Bass_Head = {
			desc_id = Bass14_Neckhead_03
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/Bass9_Neckhead_D_03`
					material = Bass14_Neckhead_03_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass9_Neckhead3_LD_11`
							flags = 36
						}
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass9_Neckhead3_LD_02`
							flags = 36
							Color = navy_1
						}
						{
							texture = `tex/models/Characters/Layers/CAG/All_Clear2`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Bass_Pickguards = {
			desc_id = None
		}
		CAS_Bass_Pickups = {
			desc_id = Bass9_Pkup_Type1_Blk_02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_bass_Bridges = {
			desc_id = Bass17_Bridge_4str_04
		}
		CAS_Bass_Knobs = {
			desc_id = Bass17_ESP_Knob_10
		}
		CAS_Bass_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			rock
		]
		CAS_Bass_Body = {
			desc_id = Bass14_ESP_Surveyor
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Bass\ESP\bass14_esp_surveyor_d`
					material = Bass14_ESP_Surveyor_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass14_esp_AX_LD_12`
							flags = 4
							Color = orange_2
						}
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass14_ESP_AX_DTL_04`
							flags = 4
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Bass_Neck = {
			desc_id = Bass_Fretboard_22a
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_02`
					material = Bass_Fretboard_22a_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_Inlay_06`
							flags = 4
							Color = grey_5guitar
						}
					]
				}
			]
		}
		CAS_Bass_Head = {
			desc_id = Bass14_Neckhead_04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass9_neckhead_d_04`
					material = Bass14_Neckhead_04_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass9_Neckhead4_LD_01`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Bass_Pickguards = {
			desc_id = None
		}
		CAS_Bass_Pickups = {
			desc_id = Bass9_Pkup_Type1_Blk_02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_bass_Bridges = {
			desc_id = Bass14_Bridge_4str_01
		}
		CAS_Bass_Knobs = {
			desc_id = Bass14_ESP_Knob_10_04
		}
		CAS_Bass_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			rock
		]
		CAS_Bass_Body = {
			desc_id = Bass14_ESP_Surveyor
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Bass\ESP\bass14_esp_surveyor_d`
					material = Bass14_ESP_Surveyor_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass14_esp_AX_LD_13`
							flags = 4
							Color = teal_2
						}
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass14_ESP_AX_DTL_04`
							flags = 4
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Bass_Neck = {
			desc_id = Bass_Fretboard_22a
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_02`
					material = Bass_Fretboard_22a_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_Inlay_06`
							flags = 4
							Color = grey_5guitar
						}
					]
				}
			]
		}
		CAS_Bass_Head = {
			desc_id = Bass14_Neckhead_04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass9_neckhead_d_04`
					material = Bass14_Neckhead_04_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass9_Neckhead4_LD_01`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Bass_Pickguards = {
			desc_id = None
		}
		CAS_Bass_Pickups = {
			desc_id = Bass9_Pkup_Type1_Blk_02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_bass_Bridges = {
			desc_id = Bass14_Bridge_4str_01
		}
		CAS_Bass_Knobs = {
			desc_id = Bass14_ESP_Knob_10_04
		}
		CAS_Bass_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Heavy	Metal`
		]
		CAS_Bass_Body = {
			desc_id = Bass9_ESP_AX_01
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Bass\ESP\bass9_esp_ax_d`
					material = Bass9_ESP_AX_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass9_ESP_AX_LD_01`
							Color = Black_1guitar
						}
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass9_ESP_AX_DTL_7B`
							flags = 4
							Color = grey_5guitar
						}
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass9_ESP_AX_DTL_7A`
							flags = 4
							Color = grey_2guitar
						}
					]
				}
			]
		}
		CAS_Bass_Neck = {
			desc_id = Bass_Fretboard_24d
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_04`
					material = Bass_Fretboard_24d_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_4
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_24_inlay_03`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Bass_Head = {
			desc_id = Bass9_Neckhead_01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass9_neckhead_d`
					material = Bass9_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass9_Neckhead_LD_01`
							flags = 36
						}
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass9_Neckhead_DTL_02`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Bass_Pickguards = {
			desc_id = None
		}
		CAS_Bass_Pickups = {
			desc_id = Bass9_Pkup_Type1_Blk_02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_bass_Bridges = {
			desc_id = Bass9_Bridge_4str_01
		}
		CAS_Bass_Knobs = {
			desc_id = Bass9_ESP_Knob_10_04
		}
		CAS_Bass_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Heavy	Metal`
		]
		CAS_Bass_Body = {
			desc_id = Bass9_ESP_AX_01
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Bass\ESP\bass9_esp_ax_d`
					material = Bass9_ESP_AX_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass9_ESP_AX_LD_01`
							Color = Black_1guitar
						}
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass9_ESP_AX_DTL_7B`
							flags = 4
							Color = yellow_green_1guitar
						}
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass9_ESP_AX_DTL_7A`
							flags = 4
							Color = yellow_green_2guitar
						}
					]
				}
			]
		}
		CAS_Bass_Neck = {
			desc_id = Bass_Fretboard_24d
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_04`
					material = Bass_Fretboard_24d_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_4
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_24_inlay_03`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Bass_Head = {
			desc_id = Bass9_Neckhead_01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass9_neckhead_d`
					material = Bass9_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass9_Neckhead_LD_01`
							flags = 36
						}
						{
							texture = `tex/models/Characters/Layers/CAG/All_Clear2`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Bass_Pickguards = {
			desc_id = None
		}
		CAS_Bass_Pickups = {
			desc_id = Bass9_Pkup_Type1_Blk_02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_bass_Bridges = {
			desc_id = Bass9_Bridge_4str_01
		}
		CAS_Bass_Knobs = {
			desc_id = Bass9_ESP_Knob_10_04
		}
		CAS_Bass_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Classic	Rock`
		]
		CAS_Bass_Body = {
			desc_id = Bass14_ESP_Surveyor
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Bass\ESP\bass14_esp_surveyor_d`
					material = Bass14_ESP_Surveyor_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass14_esp_AX_LD_12`
							flags = 4
							Color = yellow_orange_2
						}
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass14_ESP_AX_DTL_04`
							flags = 4
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Bass_Neck = {
			desc_id = Bass_Fretboard_22a
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_02`
					material = Bass_Fretboard_22a_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_Inlay_06`
							flags = 4
							Color = grey_5guitar
						}
					]
				}
			]
		}
		CAS_Bass_Head = {
			desc_id = Bass14_Neckhead_04
		}
		CAS_Bass_Pickguards = {
			desc_id = None
		}
		CAS_Bass_Pickups = {
			desc_id = Bass9_Pkup_Type1_Blk_02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_bass_Bridges = {
			desc_id = Bass14_Bridge_4str_01
		}
		CAS_Bass_Knobs = {
			desc_id = Bass14_ESP_Knob_10_04
		}
		CAS_Bass_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Classic	Rock`
		]
		CAS_Bass_Body = {
			desc_id = Bass14_ESP_Surveyor
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Bass\ESP\bass14_esp_surveyor_d`
					material = Bass14_ESP_Surveyor_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass14_esp_AX_LD_11`
							flags = 4
							Color = Blue_2
						}
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass14_ESP_AX_DTL_04`
							flags = 4
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Bass_Neck = {
			desc_id = Bass_Fretboard_22a
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_02`
					material = Bass_Fretboard_22a_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_Inlay_06`
							flags = 4
							Color = grey_5guitar
						}
					]
				}
			]
		}
		CAS_Bass_Head = {
			desc_id = Bass14_Neckhead_04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass9_neckhead_d_04`
					material = Bass14_Neckhead_04_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass9_Neckhead4_LD_11`
							flags = 36
						}
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass9_Neckhead4_LD_02`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Bass_Pickguards = {
			desc_id = None
		}
		CAS_Bass_Pickups = {
			desc_id = Bass9_Pkup_Type1_Blk_02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_bass_Bridges = {
			desc_id = Bass14_Bridge_4str_01
		}
		CAS_Bass_Knobs = {
			desc_id = Bass14_ESP_Knob_10_04
		}
		CAS_Bass_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Classic	Rock`
		]
		CAS_Bass_Body = {
			desc_id = Bass17_ESP_EC_01
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Bass\ESP\bass17_esp_ec_d`
					material = Bass17_ESP_EC_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass17_esp_EC_LD_13`
							flags = 4
							Color = red_1
						}
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/bass17_ESP_AX_DTL_04`
							flags = 4
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Bass_Neck = {
			desc_id = Bass_Fretboard_22a
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_02`
					material = Bass_Fretboard_22a_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_Inlay_06`
							flags = 4
							Color = grey_5guitar
						}
					]
				}
			]
		}
		CAS_Bass_Head = {
			desc_id = Bass14_Neckhead_03
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/Bass9_Neckhead_D_03`
					material = Bass14_Neckhead_03_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass9_Neckhead3_LD_11`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Bass_Pickguards = {
			desc_id = None
		}
		CAS_Bass_Pickups = {
			desc_id = Bass9_Pkup_Type1_Blk_02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_bass_Bridges = {
			desc_id = Bass17_Bridge_4str_04
		}
		CAS_Bass_Knobs = {
			desc_id = Bass17_ESP_Knob_10
		}
		CAS_Bass_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Classic	Rock`
		]
		CAS_Bass_Body = {
			desc_id = Bass17_ESP_EC_01
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Bass\ESP\bass17_esp_ec_d`
					material = Bass17_ESP_EC_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass17_esp_EC_LD_12`
							flags = 4
							Color = yellow_1guitar
						}
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/bass17_ESP_AX_DTL_04`
							flags = 4
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Bass_Neck = {
			desc_id = Bass_Fretboard_22a
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_02`
					material = Bass_Fretboard_22a_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_Inlay_06`
							flags = 4
							Color = grey_5guitar
						}
					]
				}
			]
		}
		CAS_Bass_Head = {
			desc_id = Bass14_Neckhead_03
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/Bass9_Neckhead_D_03`
					material = Bass14_Neckhead_03_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass9_Neckhead3_LD_11`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Bass_Pickguards = {
			desc_id = None
		}
		CAS_Bass_Pickups = {
			desc_id = Bass9_Pkup_Type1_Blk_02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_bass_Bridges = {
			desc_id = Bass17_Bridge_4str_04
		}
		CAS_Bass_Knobs = {
			desc_id = Bass17_ESP_Knob_10
		}
		CAS_Bass_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Black	Metal`
		]
		CAS_Bass_Body = {
			desc_id = Bass9_ESP_AX_01
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Bass\ESP\bass9_esp_ax_d`
					material = Bass9_ESP_AX_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass9_ESP_AX_LD_01`
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Bass_Neck = {
			desc_id = Bass_Fretboard_24d
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_04`
					material = Bass_Fretboard_24d_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_4
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_Clear`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Bass_Head = {
			desc_id = Bass9_Neckhead_01
			chosen_materials = {
				material1 = Black_1guitar
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass9_neckhead_d`
					material = Bass9_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass9_Neckhead_LD_01`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Bass_Pickguards = {
			desc_id = None
		}
		CAS_Bass_Pickups = {
			desc_id = Bass9_Pkup_Type1_Blk_02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_bass_Bridges = {
			desc_id = Bass9_Bridge_4str_01
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Bass_Knobs = {
			desc_id = Bass9_ESP_Knob_10_04
		}
		CAS_Bass_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Black	Metal`
		]
		CAS_Bass_Body = {
			desc_id = Bass63_EX
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Bass\ESP\bass63_ex_d`
					material = Bass63_EX_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass63_Ex_LD_01`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Bass_Neck = {
			desc_id = Bass_Fretboard_24d
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_04`
					material = Bass_Fretboard_24d_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_4
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_Clear`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Bass_Head = {
			desc_id = Bass63_Neckhead
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass63_neckhead_d`
					material = Bass63_Neckhead_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass63_Neckhead_LD_01`
							flags = 36
						}
					]
				}
			]
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Bass_Pickguards = {
			desc_id = None
		}
		CAS_Bass_Pickups = {
			desc_id = Bass9_Pkup_Type1_Blk_02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_bass_Bridges = {
			desc_id = Bass17_Bridge_4str_05
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Bass_Knobs = {
			desc_id = Bass63_Knob_Type1
		}
		CAS_Bass_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Classic	Rock`
		]
		CAS_Bass_Body = {
			desc_id = BAS_IBZ_SR505
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Bass\Ibanez\bs_ibz_sr_body`
					material = BS_Ibz_SR_Body_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/IBANEZ/BS_IBZ_SR_LD02`
							flags = 4
							Color = Blue_2
						}
						{
							texture = `tex/models/Characters/Layers/CAB/IBANEZ/BS_IBZ_SR_DTL04`
							flags = 4
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Bass_Neck = {
			desc_id = Bass_Fretboard_SR_24A
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d`
					material = Bass_Fretboard_24_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/Ibanez/Bass_SR24_INLAY001`
							flags = 4
							Color = grey_5guitar
						}
					]
				}
			]
		}
		CAS_Bass_Head = {
			desc_id = BAS_IBZ_SR_Head01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/Ibanez/bs_ibz_sr_head`
					material = Bass_Neckhead_IBZ_SR_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/Ibanez/BS_IBZ_SR_HD_DTL07`
							flags = 36
							Color = navy_1
						}
						{
							texture = `tex/models/Characters/Layers/CAB/Ibanez/BS_IBZ_SR_HD_DTL03`
							flags = 36
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Bass_Pickguards = {
			desc_id = None
		}
		CAS_Bass_Pickups = {
			desc_id = Bass_pickup_SD
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_bass_Bridges = {
			desc_id = Bas_Brdg_Ibz01
		}
		CAS_Bass_Knobs = {
			desc_id = Knob_Knurl02
		}
		CAS_Bass_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			Pop
		]
		CAS_Bass_Body = {
			desc_id = BAS_IBZ_SR505
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Bass\Ibanez\bs_ibz_sr_body`
					material = BS_Ibz_SR_Body_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/IBANEZ/BS_IBZ_SR_LD00`
							Color = red_2
						}
						{
							texture = `tex/models/Characters/Layers/CAB/IBANEZ/BS_IBZ_SR_DTL04`
							flags = 4
							Color = red_2
						}
						{
							texture = `tex/models/Characters/Layers/CAB/IBANEZ/BS_IBZ_SR_DTL02`
							flags = 4
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Bass_Neck = {
			desc_id = Bass_Fretboard_SR_24A
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d`
					material = Bass_Fretboard_24_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/Ibanez/Bass_SR24_INLAY001`
							flags = 4
							Color = grey_5guitar
						}
					]
				}
			]
		}
		CAS_Bass_Head = {
			desc_id = BAS_IBZ_SR_Head01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/Ibanez/bs_ibz_sr_head`
					material = Bass_Neckhead_IBZ_SR_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/Ibanez/BS_IBZ_SR_HD_DTL07`
							flags = 36
							Color = red_2
						}
						{
							texture = `tex/models/Characters/Layers/CAB/Ibanez/BS_IBZ_SR_HD_DTL02`
							flags = 36
							Color = Black_1guitar
						}
					]
				}
			]
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Bass_Pickguards = {
			desc_id = None
		}
		CAS_Bass_Pickups = {
			desc_id = BAS_IBZ_PKUP002
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_bass_Bridges = {
			desc_id = Bas_Brdg_Ibz01
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Bass_Knobs = {
			desc_id = Knob_Knurl02
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Bass_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Heavy	Metal`
		]
		CAS_Bass_Body = {
			desc_id = BAS_IBZ_SR505
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Bass\Ibanez\bs_ibz_sr_body`
					material = BS_Ibz_SR_Body_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/IBANEZ/BS_IBZ_SR_LD00`
							Color = red_1
						}
						{
							texture = `tex/models/Characters/Layers/CAB/IBANEZ/BS_IBZ_SR_DTL04`
							flags = 4
							Color = Black_1guitar
						}
						{
							Color = grey_2guitar
							texture = `tex/models/Characters/Layers/CAB/IBANEZ/BS_IBZ_SR_DTL06`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Bass_Neck = {
			desc_id = Bass_Fretboard_SR_24d
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_04`
					material = Bass_Fretboard_SR24d_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_4
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_Clear`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Bass_Head = {
			desc_id = BAS_IBZ_SR_Head01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/Ibanez/bs_ibz_sr_head`
					material = Bass_Neckhead_IBZ_SR_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAB/Ibanez/BS_IBZ_SR_HD_DTL07`
							flags = 36
						}
						{
							texture = `tex/models/Characters/Layers/CAB/Ibanez/BS_IBZ_SR_HD_DTL06`
							flags = 36
							Color = red_1
						}
					]
				}
			]
		}
		CAS_Bass_Pickguards = {
			desc_id = None
		}
		CAS_Bass_Pickups = {
			desc_id = BAS_IBZ_PKUP002
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_bass_Bridges = {
			desc_id = Bas_Brdg_Ibz01
		}
		CAS_Bass_Knobs = {
			desc_id = Knob_Knurl02
		}
		CAS_Bass_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Classic	Rock`
		]
		CAS_Bass_Body = {
			desc_id = BAS_IBZ_SR505
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Bass\Ibanez\bs_ibz_sr_body`
					material = BS_Ibz_SR_Body_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/IBANEZ/BS_IBZ_SR_LD02`
							flags = 4
							Color = red_orange_2
						}
						{
							texture = `tex/models/Characters/Layers/CAB/IBANEZ/BS_IBZ_SR_DTL03`
							flags = 4
							Color = orange_2
						}
					]
				}
			]
		}
		CAS_Bass_Neck = {
			desc_id = Bass_Fretboard_SR_24A
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d`
					material = Bass_Fretboard_24_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/Ibanez/Bass_SR24_INLAY001`
							flags = 4
							Color = grey_5guitar
						}
					]
				}
			]
		}
		CAS_Bass_Head = {
			desc_id = BAS_IBZ_SR_Head01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/Ibanez/bs_ibz_sr_head`
					material = Bass_Neckhead_IBZ_SR_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/Ibanez/BS_IBZ_SR_HD_DTL08`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Bass_Pickguards = {
			desc_id = None
		}
		CAS_Bass_Pickups = {
			desc_id = BAS_IBZ_PKUP002
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_bass_Bridges = {
			desc_id = Bas_Brdg_Ibz01
		}
		CAS_Bass_Knobs = {
			desc_id = Knob_Knurl02
		}
		CAS_Bass_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			Pop
		]
		CAS_Bass_Body = {
			desc_id = BAS_SCH_Stil
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\bass\Schecter\bas_sch_stil_bod`
					material = Bass_Stiletto_Primary
					diffuse
					layers = [
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics092`
							y_trans = -3
							x_scale = 76
							y_scale = 93
							rot = 1603
							flags = 3
							x_trans = -26
						}
					]
					pre_layer = [
						{
							Color = red_orange_5
							texture = `tex/models/Characters/Layers/cab/Schecter/BS_Sch_Stil_DTL04`
							flags = 4
						}
						{
							texture = `tex/models/Characters/Layers/CAG/All_Clear2`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Bass_Neck = {
			desc_id = Bass_Fretboard_24
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d`
					material = Bass_Fretboard_24_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_24_inlay_05`
							flags = 4
							Color = grey_5guitar
						}
					]
				}
			]
		}
		CAS_Bass_Head = {
			desc_id = BAS_Neckhead_SCH_STL
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/Schecter/bs_sch_head_stil01`
					material = Bass_Neckhead_Stil01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch_STL_HD_DTL08`
							flags = 36
						}
						{
							texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch_STL_HD_DTL02`
							Color = grey_5guitar
							flags = 36
							a = 0
						}
					]
				}
			]
		}
		CAS_Bass_Pickguards = {
			desc_id = None
		}
		CAS_Bass_Pickups = {
			desc_id = Bass_pickup_SD
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_bass_Bridges = {
			desc_id = BS_Sch_Brdg_A
		}
		CAS_Bass_Knobs = {
			desc_id = Bass_Knob_01
		}
		CAS_Bass_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Classic	Rock`
		]
		CAS_Bass_Body = {
			desc_id = BAS_SCH_Stil
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\bass\Schecter\bas_sch_stil_bod`
					material = Bass_Stiletto_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch_Stil_DTL03`
							flags = 4
							Color = orange_3
						}
						{
							texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch_Stil_LD05`
							flags = 4
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Bass_Neck = {
			desc_id = Bass_Fretboard_24
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d`
					material = Bass_Fretboard_24_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_24_inlay_05`
							flags = 4
							Color = grey_5guitar
						}
					]
				}
			]
		}
		CAS_Bass_Head = {
			desc_id = BAS_Neckhead_SCH_STL
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/Schecter/bs_sch_head_stil01`
					material = Bass_Neckhead_Stil01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch_STL_HD_DTL08`
							flags = 36
						}
						{
							texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch_STL_HD_DTL02`
							Color = grey_5guitar
							flags = 36
							a = 0
						}
					]
				}
			]
		}
		CAS_Bass_Pickguards = {
			desc_id = None
		}
		CAS_Bass_Pickups = {
			desc_id = Bass_pickup_SD
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_bass_Bridges = {
			desc_id = BS_Sch_Brdg_A
		}
		CAS_Bass_Knobs = {
			desc_id = Bass_Knob_01
		}
		CAS_Bass_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			Punk
			`Heavy	Metal`
			rock
		]
		CAS_Bass_Body = {
			desc_id = BS_SCH_T_Body
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Bass\Schecter\bs_sch_modelt`
					material = BS_Sch_ModelT_Primary
					diffuse
					pre_layer = [
						{
							Color = yellow_orange_5
							texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch_MT_DTL02`
							flags = 4
						}
						{
							texture = `tex/models/Characters/Layers/CAG/All_Clear2`
							flags = 4
						}
						{
							texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch_MT_LD21`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Bass_Neck = {
			desc_id = Bass_Fretboard_24
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d`
					material = Bass_Fretboard_24_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_24_inlay_05`
							flags = 4
							Color = grey_5guitar
						}
					]
				}
			]
		}
		CAS_Bass_Head = {
			desc_id = BS_SCH_T_NHEAD
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/Schecter/bass_neckhead_mt`
					material = BS_SCH_T_NHEAD_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_2guitar
							texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch_MT_HD_DTL09`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Bass_Pickguards = {
			desc_id = BS_SCH_T_PGA
		}
		CAS_Bass_Pickups = {
			desc_id = Bass_pickup_SD
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_bass_Bridges = {
			desc_id = BS_Sch_Brdg_A
		}
		CAS_Bass_Knobs = {
			desc_id = Knob_Knurl02
		}
		CAS_Bass_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Classic	Rock`
		]
		CAS_Bass_Body = {
			desc_id = BAS_SCH_Stil
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\bass\Schecter\bas_sch_stil_bod`
					material = Bass_Stiletto_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch_Stil_DTL01`
							Color = Black_1guitar
						}
					]
					layers = [
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							x_trans = -31
							y_trans = -31
							x_scale = 20
							y_scale = 27
							rot = 1603
							flags = 259
							Color = red_1
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = red_1
							x_trans = -39
							y_trans = 28
							x_scale = 25
							y_scale = 31
							rot = 1603
							flags = 259
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = yellow_1guitar
							x_trans = -39
							y_trans = 28
							x_scale = 15
							rot = 1603
							flags = 259
							y_scale = 19
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = yellow_1guitar
							x_trans = -23
							y_trans = -12
							x_scale = 15
							y_scale = 20
							rot = 1603
							flags = 259
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = red_1
							x_trans = -23
							y_trans = -12
							x_scale = 14
							y_scale = 19
							rot = 1603
							flags = 259
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = yellow_1guitar
							x_trans = -23
							y_trans = -12
							x_scale = 7
							rot = 1603
							flags = 259
							y_scale = 9
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = red_1
							x_trans = -7
							y_trans = 16
							x_scale = 15
							y_scale = 20
							rot = 1603
							flags = 259
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = yellow_1guitar
							x_trans = -7
							y_trans = 16
							x_scale = 11
							rot = 1603
							flags = 259
							y_scale = 14
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = Black_1guitar
							x_trans = -7
							y_trans = 16
							y_scale = 6
							rot = 1603
							flags = 259
							x_scale = 5
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							x_trans = -43
							y_trans = -28
							x_scale = 19
							y_scale = 24
							rot = 1603
							flags = 259
							Color = yellow_1guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = Black_1guitar
							x_trans = -43
							y_trans = -28
							x_scale = 11
							y_scale = 14
							rot = 1603
							flags = 259
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = yellow_1guitar
							x_trans = -43
							y_trans = -28
							x_scale = 7
							rot = 1603
							flags = 259
							y_scale = 9
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = red_1
							x_trans = -43
							y_trans = -28
							x_scale = 6
							y_scale = 8
							rot = 1603
							flags = 259
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							x_trans = -18
							y_trans = 11
							x_scale = 20
							y_scale = 25
							rot = 1603
							flags = 259
							Color = red_1
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = Black_1guitar
							x_trans = -18
							y_trans = 11
							x_scale = 17
							rot = 1603
							flags = 259
							y_scale = 21
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = yellow_1guitar
							x_trans = -18
							y_trans = 11
							y_scale = 14
							rot = 1603
							flags = 259
							x_scale = 11
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = Black_1guitar
							x_trans = -18
							y_trans = 11
							x_scale = 4
							rot = 1603
							flags = 259
							y_scale = 6
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							x_trans = -37
							y_trans = 18
							x_scale = 16
							y_scale = 20
							rot = 1603
							flags = 259
							Color = yellow_1guitar
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = Black_1guitar
							x_trans = -37
							y_trans = 18
							x_scale = 15
							rot = 1603
							flags = 259
							y_scale = 19
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = yellow_1guitar
							x_trans = -37
							y_trans = 18
							x_scale = 14
							rot = 1603
							flags = 259
							y_scale = 18
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = red_1
							x_trans = -37
							y_trans = 18
							x_scale = 8
							rot = 1603
							flags = 259
							y_scale = 10
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = red_1
							y_trans = 8
							x_scale = 8
							y_scale = 10
							rot = 1603
							flags = 259
							x_trans = -28
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = yellow_1guitar
							x_trans = -28
							y_trans = 8
							x_scale = 5
							rot = 1603
							flags = 259
							y_scale = 7
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = yellow_1guitar
							x_trans = -32
							y_trans = -20
							x_scale = 10
							rot = 1603
							flags = 259
							y_scale = 13
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = Black_1guitar
							x_trans = -32
							y_trans = -20
							x_scale = 6
							rot = 1603
							flags = 259
							y_scale = 8
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							x_trans = -16
							y_trans = -28
							x_scale = 10
							y_scale = 13
							rot = 1603
							flags = 259
							Color = red_1
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = yellow_1guitar
							x_trans = -16
							y_trans = -28
							x_scale = 5
							rot = 1603
							flags = 259
							y_scale = 7
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = Black_1guitar
							x_trans = -16
							y_trans = -28
							x_scale = 2
							rot = 1603
							flags = 259
							y_scale = 3
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							x_trans = -28
							y_trans = 24
							x_scale = 16
							y_scale = 20
							rot = 1603
							flags = 259
							Color = red_1
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = Black_1guitar
							x_trans = -28
							y_trans = 24
							x_scale = 12
							rot = 1603
							flags = 259
							y_scale = 15
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = yellow_1guitar
							x_trans = -28
							y_trans = 24
							x_scale = 7
							rot = 1603
							flags = 259
							y_scale = 9
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = red_1
							x_trans = -28
							y_trans = 24
							x_scale = 3
							rot = 1603
							flags = 259
							y_scale = 5
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = red_1
							x_trans = -46
							y_trans = 0
							x_scale = 21
							rot = 1603
							flags = 259
							y_scale = 26
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = yellow_1guitar
							x_trans = -46
							y_trans = 0
							x_scale = 14
							rot = 1603
							flags = 259
							y_scale = 15
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = Black_1guitar
							x_trans = -46
							y_trans = 0
							x_scale = 8
							rot = 1603
							flags = 259
							y_scale = 9
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							x_trans = -30
							y_trans = -3
							x_scale = 14
							y_scale = 20
							rot = 1603
							flags = 259
							Color = red_1
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = yellow_1guitar
							x_trans = -30
							y_trans = -3
							x_scale = 9
							rot = 1603
							flags = 259
							y_scale = 13
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
							Color = Black_1guitar
							x_trans = -30
							y_trans = -3
							x_scale = 6
							rot = 1603
							flags = 259
							y_scale = 9
						}
					]
				}
			]
		}
		CAS_Bass_Neck = {
			desc_id = Bass_Fretboard_24
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d`
					material = Bass_Fretboard_24_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_24_inlay_05`
							flags = 4
							Color = grey_5guitar
						}
					]
				}
			]
		}
		CAS_Bass_Head = {
			desc_id = BAS_Neckhead_SCH_STL
		}
		CAS_Bass_Pickguards = {
			desc_id = None
		}
		CAS_Bass_Pickups = {
			desc_id = Bass_pickup_SD
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_bass_Bridges = {
			desc_id = BS_Sch_Brdg_A
		}
		CAS_Bass_Knobs = {
			desc_id = Bass_Knob_01
		}
		CAS_Bass_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			Pop
			`Glam	Rock`
		]
		CAS_Bass_Body = {
			desc_id = BS_SCH_T_Body
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Bass\Schecter\bs_sch_modelt`
					material = BS_Sch_ModelT_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch_MT_DTL01`
							Color = grey_3guitar
						}
						{
							texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch_MT_LD09`
							flags = 4
							Color = yellow_3guitar
						}
						{
							texture = `tex/models/Characters/Layers/CAG/All_Clear2`
							flags = 4
						}
					]
					layers = [
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShapeGradient_001`
							Color = purple_blue_2
							y_trans = -7
							x_scale = 61
							y_scale = 36
							rot = 1603
							flags = 3
							x_trans = -5
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShapeGradient_001`
							Color = red_2
							y_trans = -7
							x_scale = 61
							y_scale = 21
							rot = 1603
							flags = 19
							x_trans = -13
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShapeGradient_001`
							Color = red_2
							y_trans = -7
							x_scale = 61
							y_scale = 21
							rot = 1603
							flags = 3
							x_trans = -23
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShapeGradient_001`
							Color = orange_3
							y_trans = -7
							x_scale = 61
							y_scale = 21
							rot = 1603
							flags = 19
							x_trans = -26
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShapeGradient_001`
							Color = orange_3
							y_trans = -7
							x_scale = 61
							y_scale = 21
							rot = 1603
							flags = 3
							x_trans = -36
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShapeGradient_001`
							x_trans = -44
							y_trans = -7
							x_scale = 61
							y_scale = 32
							rot = 1603
							flags = 19
							Color = green_2guitar
						}
					]
				}
			]
		}
		CAS_Bass_Neck = {
			desc_id = Bass_Fretboard_24
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d`
					material = Bass_Fretboard_24_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_24_inlay_05`
							flags = 4
							Color = grey_5guitar
						}
					]
				}
			]
		}
		CAS_Bass_Head = {
			desc_id = BS_SCH_T_NHEAD
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/Schecter/bass_neckhead_mt`
					material = BS_SCH_T_NHEAD_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch_MT_HD_DTL06`
							flags = 36
							Color = red_3
						}
					]
				}
			]
		}
		CAS_Bass_Pickguards = {
			desc_id = None
		}
		CAS_Bass_Pickups = {
			desc_id = Bass_pickup_SD
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_bass_Bridges = {
			desc_id = BS_Sch_Brdg_A
		}
		CAS_Bass_Knobs = {
			desc_id = Bass_Knob_01
		}
		CAS_Bass_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			Goth
		]
		CAS_Bass_Body = {
			desc_id = BAS_SCH_Stil
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\bass\Schecter\bas_sch_stil_bod`
					material = Bass_Stiletto_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch_Stil_DTL01`
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Bass_Neck = {
			desc_id = Bass_SCH_Fretboard_24d
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_04`
					material = Bass_Fretboard_24d_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch_INL_LD30`
							flags = 36
							Color = green_2guitar
						}
					]
				}
			]
		}
		CAS_Bass_Head = {
			desc_id = BAS_Neckhead_SCH_STL
			chosen_materials = {
				material1 = green_2guitar
			}
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/Schecter/bs_sch_head_stil01`
					material = Bass_Neckhead_Stil01_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch_STL_HD_DTL06`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Bass_Pickguards = {
			desc_id = None
		}
		CAS_Bass_Pickups = {
			desc_id = Bass_pickup_SD
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_bass_Bridges = {
			desc_id = BS_Sch_Brdg_A
			chosen_materials = {
				material1 = green_2guitar
			}
		}
		CAS_Bass_Knobs = {
			desc_id = Bass_Knob_02
			chosen_materials = {
				material1 = green_2guitar
			}
		}
		CAS_Bass_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			Goth
		]
		CAS_Bass_Body = {
			desc_id = BAS_SCH_Stil
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\bass\Schecter\bas_sch_stil_bod`
					material = Bass_Stiletto_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch_Stil_DTL01`
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Bass_Neck = {
			desc_id = Bass_SCH_Fretboard_24d
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_04`
					material = Bass_Fretboard_24d_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_4
							texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch_INL_LD32`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Bass_Head = {
			desc_id = BAS_Neckhead_SCH_STL
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/Schecter/bs_sch_head_stil01`
					material = Bass_Neckhead_Stil01_Primary
					diffuse
					pre_layer = [
						{
							Color = Black_1guitar
							texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch_STL_HD_DTL06`
							flags = 36
						}
					]
				}
			]
			chosen_materials = {
				material1 = yellow_2guitar
			}
		}
		CAS_Bass_Pickguards = {
			desc_id = None
		}
		CAS_Bass_Pickups = {
			desc_id = Bass_pickup_SD
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_bass_Bridges = {
			desc_id = BS_Sch_Brdg_A
			chosen_materials = {
				material1 = yellow_2guitar
			}
		}
		CAS_Bass_Knobs = {
			desc_id = Bass_Knob_03
			chosen_materials = {
				material1 = yellow_3guitar
			}
		}
		CAS_Bass_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Glam	Rock`
		]
		CAS_Bass_Body = {
			desc_id = BS_SCH_T_Body
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Bass\Schecter\bs_sch_modelt`
					material = BS_Sch_ModelT_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch_MT_DTL02`
							flags = 4
							Color = teal_2
						}
					]
				}
			]
		}
		CAS_Bass_Neck = {
			desc_id = Bass_SCH_Fretboard_24d
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_04`
					material = Bass_Fretboard_24d_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch_INL_LD30`
							flags = 4
							Color = grey_5guitar
						}
					]
				}
			]
		}
		CAS_Bass_Head = {
			desc_id = BS_SCH_T_NHEAD
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/Schecter/bass_neckhead_mt`
					material = BS_SCH_T_NHEAD_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch_MT_HD_DTL06`
							flags = 36
							Color = teal_1
						}
					]
				}
			]
		}
		CAS_Bass_Pickguards = {
			desc_id = None
		}
		CAS_Bass_Pickups = {
			desc_id = Bass_pickup_SD
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_bass_Bridges = {
			desc_id = BS_Sch_Brdg_A
		}
		CAS_Bass_Knobs = {
			desc_id = Knob_Knurl02
		}
		CAS_Bass_Misc = {
			desc_id = None
		}
	}
	{
		genre = [
			`Heavy	Metal`
		]
		CAS_Bass_Body = {
			desc_id = Bass15_McSwain_Machine
			CAP = [
				{
					base_tex = `tex/models/CAR_Instruments/Bass/McSwain/bass15_mcswain_machine_d`
					material = Bass15_McSwain_Machine_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/McSwain/Bass15_McSwain_Machine_LD4`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Bass_Neck = {
			desc_id = Bass_McSwain_Fboard22a
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_02`
					material = Bass_Fretboard_22a_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_5guitar
							texture = `tex/models/Characters/Layers/CAB/McSwain/22fret_LD06_McSwn_Bolts`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Bass_Head = {
			desc_id = Bass15_Neckhead_McSwain11
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/bass/McSwain/bass15_neckhead_machine_d`
					material = Bass15_Neckhead_McSwain1_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/McSwain/Bass15_Nkhd_McSwain_LD4`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Bass_Pickguards = {
			desc_id = None
		}
		CAS_Bass_Pickups = {
			desc_id = Bass_pickup_SD
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_bass_Bridges = {
			desc_id = Bass15_Bridge_McSwain1
		}
		CAS_Bass_Knobs = {
			desc_id = Bass_Knob_01
		}
		CAS_Bass_Misc = {
			desc_id = None
		}
	}
]
cas_preset_drums = [
	{
		genre = [
			Punk
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Shell_LD16`
							flags = 32
							Color = blue_1
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Skin_LD09`
							flags = 4
							Color = navy_3
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			Punk
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/Drumshell_DS_49`
							flags = 32
							Color = orange_3
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Skin_LD92`
							flags = 4
							Color = yellow_orange_3
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			Punk
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_4guitar
							texture = `tex/models/Characters/Layers/CADrm/Drumshell_DS_06`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Skin_LD94`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			Goth
		]
		CAS_Drums = {
			desc_id = newtamaDouble
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = newtamaDouble_Primary1
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/PopShell_02`
							flags = 32
							Color = red_3
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = newtamaDouble_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/PopSkin_10`
							flags = 32
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			Goth
		]
		CAS_Drums = {
			desc_id = newtamaTriple
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = newtamaTriple_Primary1
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Shell_LD11`
							flags = 32
							Color = purple_blue_1
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = newtamaTriple_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/PopSkin_08`
							flags = 32
							Color = grey_5guitar
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			Goth
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Shell_LD03`
							flags = 32
							Color = purple_blue_2
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Skin_LD12`
							flags = 4
							Color = navy_1
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			Goth
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Shell_LD06`
							flags = 32
							Color = grey_3guitar
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Skin_LD15`
							Color = red_1
							flags = 4
							a = 100
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			Goth
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Shell_LD31`
							flags = 32
							Color = teal_2
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Skin_LD16`
							flags = 4
							Color = violet_1
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			Goth
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Shell_LD39`
							flags = 32
							Color = grey_2guitar
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Skin_LD33`
							flags = 4
							Color = grey_2guitar
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			Goth
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/bass_skin_GK_02`
							flags = 4
							Color = purple_blue_1
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Shell_LD01`
							flags = 32
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			`Glam	Rock`
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Shell_LD11`
							flags = 32
							Color = red_3
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Skin_LD34`
							flags = 4
							Color = green_3guitar
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			`Glam	Rock`
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Shell_LD15`
							flags = 32
							Color = orange_3
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Skin_LD45`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			`Glam	Rock`
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Shell_LD23`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Skin_LD46`
							flags = 4
							Color = teal_2
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			`Glam	Rock`
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Shell_LD25`
							flags = 32
							Color = yellow_2guitar
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Skin_LD56`
							flags = 4
							Color = orange_3
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			`Glam	Rock`
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Shell_LD28`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Skin_LD65`
							flags = 4
							Color = teal_3
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			`Glam	Rock`
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Shell_LD38`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Skin_LD66`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			`Glam	Rock`
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Shell_LD34`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Skin_LD98`
							flags = 4
							Color = red_2
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			`Glam	Rock`
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Shell_LD37`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/bass_skin_DS_22`
							flags = 4
							Color = violet_3
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			`Black	Metal`
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/Drumshell_DS_04`
							flags = 32
							Color = Black_1guitar
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Skin_LD01`
							flags = 4
							Color = grey_3guitar
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			`Black	Metal`
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/Drumshell_DS_04`
							flags = 32
							Color = Black_1guitar
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Skin_LD11`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			`Black	Metal`
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Shell_LD46`
							flags = 32
							Color = Black_1guitar
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/bass_skin_DS_32`
							flags = 4
							Color = grey_2guitar
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			`Black	Metal`
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Shell_LD46`
							flags = 32
							Color = Black_1guitar
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/bass_skin_DS_13`
							flags = 4
							Color = grey_2guitar
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			`Black	Metal`
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Shell_LD46`
							flags = 32
							Color = Black_1guitar
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/bass_skin_DS_15`
							flags = 4
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			`Black	Metal`
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Shell_LD46`
							flags = 32
							Color = Black_1guitar
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/bass_skin_DS_15`
							flags = 4
							Color = Black_1guitar
						}
					]
					layers = [
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics020`
							flags = 3
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			Pop
			`Glam	Rock`
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/PopShell_01`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/PopSkin_02`
							flags = 32
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			Pop
			`Glam	Rock`
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/PopShell_06`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/PopSkin_08`
							flags = 32
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			Pop
			`Glam	Rock`
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/PopShell_02`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/PopSkin_03`
							flags = 32
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			Pop
			`Glam	Rock`
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/PopShell_03`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/PopSkin_09`
							flags = 32
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			Pop
			`Glam	Rock`
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/PopShell_04`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/PopSkin_13`
							flags = 32
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			Pop
			`Glam	Rock`
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/PopShell_05`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/PopSkin_06`
							flags = 32
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			Pop
			`Glam	Rock`
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/PopShell_09`
							flags = 32
							Color = grey_5guitar
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/PopSkin_01`
							flags = 32
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			rock
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					layers = [
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = Black_1guitar
							y_trans = -41
							x_scale = 3
							flags = 3
							x_trans = -17
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = Black_1guitar
							y_trans = -41
							x_scale = 3
							flags = 3
							x_trans = -26
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = Black_1guitar
							y_trans = 38
							x_scale = 3
							y_scale = 49
							flags = 3
							x_trans = -18
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
							Color = Black_1guitar
							x_trans = -26
							x_scale = 3
							y_scale = 49
							flags = 3
							y_trans = 38
						}
						{
							texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
							x_trans = -20
							x_scale = 32
							y_scale = 41
							flags = 3
							y_trans = 7
						}
					]
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/bass_skin_DS_15`
							flags = 4
							Color = grey_5guitar
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_TamaShell_LD09`
							flags = 32
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			rock
		]
		CAS_Drums = {
			desc_id = newtamaDouble
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = newtamaDouble_Primary1
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/PopShell_09`
							flags = 32
							Color = orange_4
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = newtamaDouble_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/PopSkin_10`
							flags = 32
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			rock
			Punk
		]
		CAS_Drums = {
			desc_id = newtamaDouble
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = newtamaDouble_Primary1
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_TamaShell_LD14`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = newtamaDouble_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/PopSkin_11`
							flags = 32
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			rock
			`Glam	Rock`
		]
		CAS_Drums = {
			desc_id = newtamaDouble
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = newtamaDouble_Primary1
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/PopShell_09`
							flags = 32
							Color = yellow_3guitar
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = newtamaDouble_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/PopSkin_12`
							flags = 32
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			`Heavy	Metal`
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Shell_LD39`
							flags = 32
							Color = yellow_2guitar
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/bass_skin_DS_78`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			`Heavy	Metal`
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Shell_LD31`
							flags = 32
							Color = red_1
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Skin_LD68`
							flags = 4
							Color = grey_3guitar
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			`Classic	Rock`
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Shell_LD04`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/bass_skin_DS_15`
							flags = 4
							Color = grey_4guitar
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			`Classic	Rock`
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Shell_LD14`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/bass_skin_DS_15`
							flags = 4
							Color = grey_4guitar
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			`Classic	Rock`
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Shell_LD31`
							flags = 32
							Color = orange_3
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/bass_skin_DS_15`
							flags = 4
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			`Classic	Rock`
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Shell_LD49`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/bass_skin_DS_15`
							flags = 4
							Color = grey_3guitar
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			`Classic	Rock`
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							Color = yellow_orange_4
							texture = `tex/models/Characters/Layers/CADrm/Drumshell_DS_07`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Skin_LD65`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			`Classic	Rock`
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_TamaShell_LD05`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/bass_skin_DS_15`
							flags = 4
							Color = grey_5guitar
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			`Classic	Rock`
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Shell_LD01`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/bass_skin_DS_15`
							flags = 4
							Color = grey_5guitar
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			`Heavy	Metal`
		]
		CAS_Drums = {
			desc_id = newtamaTriple
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = newtamaTriple_Primary1
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_TamaShell_LD03`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = newtamaTriple_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/bass_skin_DS_15`
							flags = 4
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			`Heavy	Metal`
		]
		CAS_Drums = {
			desc_id = newtamaTriple
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = newtamaTriple_Primary1
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_TamaShell_LD09`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = newtamaTriple_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/bass_skin_DS_15`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			`Heavy	Metal`
		]
		CAS_Drums = {
			desc_id = newtamaTriple
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = newtamaTriple_Primary1
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Shell_LD01`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = newtamaTriple_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/bass_skin_DS_13`
							flags = 4
							Color = grey_3guitar
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			`Heavy	Metal`
		]
		CAS_Drums = {
			desc_id = newtamaTriple
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = newtamaTriple_Primary1
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Shell_LD06`
							flags = 32
							Color = grey_3guitar
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = newtamaTriple_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/bass_skin_DS_22`
							flags = 4
							Color = red_1
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			`Heavy	Metal`
		]
		CAS_Drums = {
			desc_id = newtamaTriple
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = newtamaTriple_Primary1
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Shell_LD25`
							flags = 32
							Color = grey_3guitar
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = newtamaTriple_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/bass_skin_DS_77`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			`Heavy	Metal`
		]
		CAS_Drums = {
			desc_id = newtamaTriple
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = newtamaTriple_Primary1
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Shell_LD27`
							flags = 32
							Color = yellow_1guitar
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = newtamaTriple_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/bass_skin_DS_78`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			`Heavy	Metal`
		]
		CAS_Drums = {
			desc_id = newtamaDouble
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = newtamaDouble_Primary1
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/Drumshell_DS_04`
							flags = 32
							Color = Black_1guitar
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = newtamaDouble_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/bass_skin_DS_15`
							flags = 4
							Color = grey_4guitar
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			`Heavy	Metal`
		]
		CAS_Drums = {
			desc_id = newtamaDouble
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = newtamaDouble_Primary1
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/Drumshell_DS_40`
							flags = 32
							Color = red_orange_1
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = newtamaDouble_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/PopSkin_11`
							flags = 32
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			`Heavy	Metal`
		]
		CAS_Drums = {
			desc_id = newtamaDouble
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = newtamaDouble_Primary1
					diffuse
					pre_layer = [
						{
							Color = grey_4guitar
							texture = `tex/models/Characters/Layers/CADrm/Drumshell_DS_53`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = newtamaDouble_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/PopSkin_12`
							flags = 32
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			Punk
		]
		CAS_Drums = {
			desc_id = newtamaDouble
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = newtamaDouble_Primary1
					diffuse
					pre_layer = [
						{
							Color = grey_4guitar
							texture = `tex/models/Characters/Layers/CADrm/Drumshell_DS_53`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = newtamaDouble_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/PopSkin_11`
							flags = 32
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			Punk
		]
		CAS_Drums = {
			desc_id = newtamaDouble
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = newtamaDouble_Primary1
					diffuse
					pre_layer = [
						{
							Color = grey_4guitar
							texture = `tex/models/Characters/Layers/CADrm/Drumshell_DS_06`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = newtamaDouble_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Skin_LD09`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			Punk
		]
		CAS_Drums = {
			desc_id = newtamaDouble
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = newtamaDouble_Primary1
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/Drumshell_DS_20`
							flags = 32
							Color = violet_1
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = newtamaDouble_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Skin_LD19`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			Punk
		]
		CAS_Drums = {
			desc_id = newtamaDouble
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = newtamaDouble_Primary1
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/Drumshell_DS_49`
							flags = 32
							Color = red_orange_2
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = newtamaDouble_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Skin_LD31`
							flags = 4
							Color = blue_1
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			Punk
		]
		CAS_Drums = {
			desc_id = newtamaDouble
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = newtamaDouble_Primary1
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Shell_LD49`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = newtamaDouble_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Skin_LD57`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			Punk
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/bass_skin_DS_07`
							flags = 4
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/Drumshell_DS_22`
							flags = 32
							Color = red_3
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			rock
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/bass_skin_DS_08`
							flags = 4
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/Drumshell_DS_38`
							flags = 32
							Color = red_3
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			rock
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/bass_skin_GK_04`
							flags = 4
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/Drumshell_DS_05`
							flags = 32
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			rock
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/bass_skin_GK_01`
							flags = 4
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Shell_LD52`
							flags = 32
							Color = green_1guitar
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			rock
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/bass_skin_DS_43`
							flags = 4
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Shell_LD42`
							flags = 32
							Color = orange_4
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			rock
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Skin_LD102`
							flags = 4
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Shell_LD39`
							flags = 32
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			rock
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Skin_LD101`
							flags = 4
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Shell_LD31`
							flags = 32
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			`Classic	Rock`
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/bass_skin_DS_15`
							flags = 4
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Shell_LD13`
							flags = 32
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			Pop
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/bass_skin_GK_02`
							flags = 4
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Shell_LD11`
							flags = 32
							Color = red_1
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			Pop
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_TamaShell_LD13`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/bass_skin_DS_15`
							flags = 4
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			Pop
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_TamaShell_LD13`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/PopSkin_03`
							flags = 32
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			Goth
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_TamaShell_LD13`
							flags = 32
							Color = green_2guitar
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/PopSkin_10`
							flags = 32
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			Goth
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Shell_LD01`
							flags = 32
							Color = Black_1guitar
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Skin_LD01`
							flags = 4
							Color = grey_5guitar
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			Goth
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Shell_LD03`
							flags = 32
							Color = purple_blue_1
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Skin_LD12`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			`Black	Metal`
		]
		CAS_Drums = {
			desc_id = basic
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = CAD_Drums_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Shell_LD05`
							flags = 32
							Color = grey_2guitar
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = CAD_Drums_01_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/GH5_Skin_LD15`
							flags = 4
							Color = grey_2guitar
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			`Black	Metal`
		]
		CAS_Drums = {
			desc_id = newtamaDouble
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = newtamaDouble_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/bass_skin_DS_15`
							flags = 4
							Color = Black_1guitar
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			`Black	Metal`
		]
		CAS_Drums = {
			desc_id = newtamaDouble
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = newtamaDouble_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/bass_skin_DS_15`
							flags = 4
							Color = Black_1guitar
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = newtamaDouble_Primary1
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/Drumshell_DS_34`
							flags = 32
							Color = grey_2guitar
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
	{
		genre = [
			`Black	Metal`
		]
		CAS_Drums = {
			desc_id = newtamaDouble
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
					material = newtamaDouble_Bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CADrm/bass_skin_DS_15`
							flags = 4
							Color = Black_1guitar
						}
					]
				}
				{
					base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
					material = newtamaDouble_Primary1
					diffuse
					pre_layer = [
						{
							Color = grey_4guitar
							texture = `tex/models/Characters/Layers/CADrm/Drumshell_DS_53`
							flags = 32
						}
					]
				}
			]
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
	}
]
cas_preset_female_vocals = [
	{
		genre = [
			Glam
			rock
			Goth
			Pop
			Punk
			`Black	Metal`
			`Heavy	Metal`
			`Classic	Rock`
		]
		CAS_Mic = {
			desc_id = Mic_Standard
		}
		CAS_Mic_Stand = {
			desc_id = `Classic	Rock`
		}
	}
	{
		CAS_Mic = {
			desc_id = `Black	Metal`
		}
		CAS_Mic_Stand = {
			desc_id = `Classic	Rock`
		}
	}
	{
		CAS_Mic = {
			desc_id = `Glam	Rock`
		}
		CAS_Mic_Stand = {
			desc_id = `Classic	Rock`
		}
	}
	{
		CAS_Mic = {
			desc_id = Punk
		}
		CAS_Mic_Stand = {
			desc_id = `Classic	Rock`
		}
	}
	{
		CAS_Mic = {
			desc_id = `Classic	Rock`
		}
		CAS_Mic_Stand = {
			desc_id = `Classic	Rock`
		}
	}
	{
		genre = [
			Glam
			rock
			Metal
			Goth
			Pop
		]
		CAS_Mic = {
			desc_id = Mic_Standard
		}
		CAS_Mic_Stand = {
			desc_id = Glam
		}
	}
	{
		CAS_Mic = {
			desc_id = `Black	Metal`
		}
		CAS_Mic_Stand = {
			desc_id = Glam
		}
	}
	{
		CAS_Mic = {
			desc_id = `Glam	Rock`
		}
		CAS_Mic_Stand = {
			desc_id = Glam
		}
	}
	{
		CAS_Mic = {
			desc_id = Punk
		}
		CAS_Mic_Stand = {
			desc_id = Glam
		}
	}
	{
		CAS_Mic = {
			desc_id = `Classic	Rock`
		}
		CAS_Mic_Stand = {
			desc_id = Glam
		}
	}
	{
		genre = [
			Glam
			rock
			Pop
			Punk
			`Classic	Rock`
		]
		CAS_Mic = {
			desc_id = Mic_Standard
		}
		CAS_Mic_Stand = {
			desc_id = Poptastic
		}
	}
	{
		CAS_Mic = {
			desc_id = `Black	Metal`
		}
		CAS_Mic_Stand = {
			desc_id = Poptastic
		}
	}
	{
		CAS_Mic = {
			desc_id = `Glam	Rock`
		}
		CAS_Mic_Stand = {
			desc_id = Poptastic
		}
	}
	{
		CAS_Mic = {
			desc_id = Punk
		}
		CAS_Mic_Stand = {
			desc_id = Poptastic
		}
	}
	{
		CAS_Mic = {
			desc_id = `Classic	Rock`
		}
		CAS_Mic_Stand = {
			desc_id = Poptastic
		}
	}
	{
		genre = [
			rock
			Goth
			`Black	Metal`
			`Heavy	Metal`
		]
		CAS_Mic = {
			desc_id = Mic_Standard
		}
		CAS_Mic_Stand = {
			desc_id = rock
		}
	}
	{
		CAS_Mic = {
			desc_id = `Black	Metal`
		}
		CAS_Mic_Stand = {
			desc_id = rock
		}
	}
	{
		CAS_Mic = {
			desc_id = `Glam	Rock`
		}
		CAS_Mic_Stand = {
			desc_id = rock
		}
	}
	{
		CAS_Mic = {
			desc_id = Punk
		}
		CAS_Mic_Stand = {
			desc_id = rock
		}
	}
	{
		CAS_Mic = {
			desc_id = `Classic	Rock`
		}
		CAS_Mic_Stand = {
			desc_id = rock
		}
	}
]
cas_preset_male_vocals = [
	{
		CAS_Mic = {
			desc_id = rock
		}
		CAS_Mic_Stand = {
			desc_id = rock
		}
		genre = [
			rock
		]
	}
	{
		CAS_Mic = {
			desc_id = Goth
		}
		CAS_Mic_Stand = {
			desc_id = Goth
		}
		genre = [
			Goth
		]
	}
	{
		CAS_Mic = {
			desc_id = Pop
		}
		CAS_Mic_Stand = {
			desc_id = Poptastic
		}
		genre = [
			Pop
		]
	}
	{
		CAS_Mic = {
			desc_id = Goth
		}
		CAS_Mic_Stand = {
			desc_id = Goth
		}
		genre = [
			`Glam	Rock`
			`Classic	Rock`
			Punk
		]
	}
	{
		CAS_Mic = {
			desc_id = Mic_Standard
		}
		CAS_Mic_Stand = {
			desc_id = Mic_Stand_Metal
		}
		genre = [
			`Heavy	Metal`
			`Black	Metal`
		]
	}
]
