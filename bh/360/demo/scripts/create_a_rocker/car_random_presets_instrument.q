cas_preset_guitars = [
	{
		genre = [
			pop
			goth
			punk
			rock
			`heavy metal`
			`classic rock`
		]
		cas_guitar_body = {
			desc_id = gtr37_esp_rw
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr37_rw_d`
					material = gtr37_rw_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/esp/gtr37_rw_paint`
							flags = 4
							color = black_1guitar
						}
					]
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_042`
							color = blue_5
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
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_026`
							x_trans = -31
							y_trans = 25
							x_scale = 11
							y_scale = 17
							rot = 1603
							flags = 259
							color = grey_2guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_026`
							x_trans = -36
							y_trans = 12
							x_scale = 11
							y_scale = 17
							rot = 4753
							flags = 259
							color = grey_2guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_026`
							x_trans = -27
							y_trans = 13
							x_scale = 11
							y_scale = 17
							rot = 1603
							flags = 259
							color = grey_2guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_026`
							x_trans = -4
							y_trans = 17
							x_scale = 11
							y_scale = 14
							rot = 1603
							flags = 259
							color = grey_2guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_026`
							x_trans = -31
							y_trans = 2
							x_scale = 7
							y_scale = 10
							rot = 1603
							flags = 259
							color = grey_2guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_026`
							x_trans = -10
							y_trans = 22
							x_scale = 11
							y_scale = 17
							rot = 1603
							flags = 259
							color = grey_2guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_026`
							x_trans = -20
							y_trans = 8
							x_scale = 11
							y_scale = 17
							rot = 1603
							flags = 259
							color = grey_2guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_026`
							x_trans = -7
							y_trans = 7
							x_scale = 6
							y_scale = 10
							rot = 1603
							flags = 259
							color = grey_2guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_026`
							x_trans = -14
							y_trans = 13
							x_scale = 6
							y_scale = 10
							rot = 1603
							flags = 259
							color = grey_2guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_001`
							x_trans = -25
							y_trans = -26
							x_scale = 107
							y_scale = 31
							rot = 3103
							flags = 3
							color = grey_4guitar
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_esp02
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d2_01`
					material = gtr_fretboard_02_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/22fret_ld84_esp_flagship`
							flags = 36
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr37_neckhead
			chosen_materials = {
				material1 = grey_3guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr37_nekhed`
					material = gtr37_nhead_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/all_clear`
							flags = 4
						}
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/esp/gtr37_nekhed_flat`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = gtr37_pguard01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr37_pguard01_d`
					material = gtr37_pguard_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/esp/gtr37_pguard01_dtl03`
							flags = 4
							color = blue_4
						}
					]
				}
			]
		}
		cas_guitar_bridges = {
			desc_id = gtr37_bridge
			chosen_materials = {
				material1 = grey_3guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr37_knobs01
		}
		cas_guitar_pickups = {
			desc_id = gtr37_pickup_f
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			goth
			punk
			rock
			`heavy metal`
			`classic rock`
		]
		cas_guitar_body = {
			desc_id = gtr32_body
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr32_body`
					material = gtr32_horizon_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/esp/gtr32_quilt`
							flags = 4
							color = green_2guitar
						}
						{
							texture = `tex/models/characters/layers/cag/esp/gtr32_binding01`
							flags = 4
						}
					]
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon009`
							a = 30
							x_trans = -2
							x_scale = 25
							y_scale = 54
							rot = 1530
							flags = 259
							y_trans = -13
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon009`
							a = 30
							x_trans = -2
							x_scale = 25
							y_scale = 54
							rot = 1530
							flags = 267
							y_trans = 28
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon009`
							a = 30
							x_trans = -36
							x_scale = 23
							y_scale = 30
							rot = 1320
							flags = 267
							y_trans = 30
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon009`
							a = 30
							y_trans = -19
							x_scale = 23
							y_scale = 30
							rot = 1770
							flags = 259
							x_trans = -36
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon013`
							a = 30
							x_trans = -37
							y_trans = -15
							x_scale = 34
							y_scale = 43
							flags = 267
							rot = 2443
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon013`
							a = 30
							x_trans = -37
							y_trans = 26
							x_scale = 34
							y_scale = 43
							flags = 259
							rot = 703
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon014`
							x_trans = -31
							y_trans = 6
							x_scale = 66
							y_scale = 81
							rot = 6253
							flags = 259
							a = 30
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_022`
							x_trans = -43
							y_trans = 4
							x_scale = 7
							y_scale = 11
							rot = 1603
							flags = 259
							a = 75
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_022`
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
		cas_guitar_neck = {
			desc_id = cag_24fret_esp01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d1_02`
					material = gtr_fretboard24_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/24fret_ld105_esp_updots`
							flags = 36
							color = green_3guitar
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr32_nekhead01
			chosen_materials = {
				material1 = navy_2
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr32_nekhed`
					material = gtr32_nhed_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/esp/gtr32_nekhed_solid`
							flags = 36
							color = green_1guitar
						}
						{
							texture = `tex/models/characters/layers/cag/esp/gtr32_nekhed_dtl02`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr32_hardware01
			chosen_materials = {
				material1 = navy_2
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr_32_knobs_a
			chosen_materials = {
				material1 = navy_2
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr31_pickup_d
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			goth
			punk
		]
		cas_guitar_body = {
			desc_id = gtr12_esp_v_01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr12_esp_v_series_d`
					material = gtr12_esp_v_01_primary
					diffuse
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon007`
							color = black_1guitar
							x_trans = -16
							y_trans = -1
							x_scale = 44
							y_scale = 60
							rot = 1603
							flags = 267
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon007`
							color = black_1guitar
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
							texture = `tex/models/characters/layers/cag/esp/gtr12_esp_v_series_ld_02`
							flags = 4
							color = violet_4
						}
						{
							texture = `tex/models/characters/layers/cag/esp/gtr12_esp_v_series_dtl_02`
							flags = 4
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_esp04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
					material = gtr_fretboard_04_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/22fret_ld87_esp_tribal`
							flags = 36
							color = violet_4
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr12_neckhead_07
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr4_neckhead_d_07`
					material = gtr12_neckhead_07_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/esp/gtr4_neckhead_07_ld_01`
							flags = 36
							color = violet_4
						}
						{
							texture = `tex/models/characters/layers/cag/esp/gtr4_neckhead7_dtl_03`
							flags = 36
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr12_bridge_3
		}
		cas_guitar_knobs = {
			desc_id = gtr12_esp_knob_01
		}
		cas_guitar_pickups = {
			desc_id = gtr1_esp_emg_pkup_2
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			goth
			punk
			`heavy metal`
		]
		cas_guitar_body = {
			desc_id = gtr12_esp_v_01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr12_esp_v_series_d`
					material = gtr12_esp_v_01_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/esp/gtr12_esp_v_series_ld_02`
							flags = 4
						}
					]
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = orange_3
							x_trans = -50
							x_scale = 4
							y_scale = 45
							rot = 2233
							flags = 259
							y_trans = -28
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = orange_3
							y_trans = -25
							x_scale = 4
							y_scale = 45
							rot = 2233
							flags = 259
							x_trans = -45
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = orange_3
							x_trans = -41
							y_trans = -20
							x_scale = 4
							rot = 2233
							flags = 259
							y_scale = 45
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = orange_3
							y_trans = -17
							x_scale = 4
							y_scale = 51
							rot = 2233
							flags = 259
							x_trans = -36
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = orange_3
							y_trans = -12
							x_scale = 4
							y_scale = 51
							rot = 2233
							flags = 259
							x_trans = -32
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = orange_3
							y_trans = -6
							x_scale = 4
							y_scale = 51
							rot = 2233
							flags = 259
							x_trans = -28
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = orange_3
							x_trans = -27
							y_trans = 8
							x_scale = 4
							rot = 2233
							flags = 259
							y_scale = 85
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = orange_3
							y_trans = 8
							x_scale = 4
							y_scale = 69
							rot = 2233
							flags = 259
							x_trans = -20
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = orange_3
							x_trans = -13
							x_scale = 4
							y_scale = 69
							rot = 2233
							flags = 259
							y_trans = 8
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = orange_3
							y_trans = 8
							x_scale = 4
							y_scale = 69
							rot = 2233
							flags = 259
							x_trans = -6
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = orange_3
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
		cas_guitar_neck = {
			desc_id = cag_24fret_esp04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
					material = gtr_fretboard24_04_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/24fret_ld97_esp_bats`
							flags = 36
							color = orange_3
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr12_neckhead_07
			chosen_materials = {
				material1 = black_1guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr4_neckhead_d_07`
					material = gtr12_neckhead_07_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/esp/gtr4_neckhead_07_ld_01`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr12_bridge_3
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr12_esp_knob_01
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr1_esp_emg_pkup_2
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			punk
			`heavy metal`
		]
		cas_guitar_body = {
			desc_id = gtr63f_esp_ex
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr63f_esp_ex_d`
					material = gtr63f_esp_ex_primary
					diffuse
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics073`
							color = black_1guitar
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
							texture = `tex/models/characters/layers/cag/esp/gtr63f_esp_ex_ld_01`
							flags = 4
							color = red_2
						}
						{
							texture = `tex/models/characters/layers/cag/esp/gtr63f_esp_ex_dtl_02`
							flags = 4
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_esp01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d_01`
					material = gtr_fretboard_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
							flags = 4
							color = grey_4guitar
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr63f_neckhead
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr63f_neckhead_d`
					material = gtr63f_neckhead_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/esp/gtr63f_neckhead_ld_01`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr_hardware63f
		}
		cas_guitar_knobs = {
			desc_id = gtr63_knob_type06
		}
		cas_guitar_pickups = {
			desc_id = gtr62_esp_emg
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			goth
		]
		cas_guitar_body = {
			desc_id = gtr9_esp_ax
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr9_esp_ax_d`
					material = gtr9_esp_ax_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/esp/gtr9_esp_ax_ld_01`
							flags = 4
						}
					]
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = purple_blue_1
							x_trans = -48
							x_scale = 11
							y_scale = 20
							rot = 1603
							flags = 259
							y_trans = -44
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = purple_blue_1
							y_trans = 41
							x_scale = 11
							y_scale = 20
							rot = 1603
							flags = 259
							x_trans = -48
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							x_trans = -38
							y_trans = 41
							x_scale = 11
							y_scale = 20
							rot = 1603
							flags = 259
							color = purple_blue_1
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = purple_blue_1
							y_trans = 24
							x_scale = 11
							y_scale = 20
							rot = 1603
							flags = 259
							x_trans = -38
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = purple_blue_1
							x_trans = -38
							x_scale = 11
							y_scale = 20
							rot = 1603
							flags = 259
							y_trans = -27
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = purple_blue_1
							y_trans = -44
							x_scale = 11
							y_scale = 20
							rot = 1603
							flags = 259
							x_trans = -38
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = purple_blue_1
							x_trans = -28
							y_trans = -44
							x_scale = 11
							y_scale = 20
							rot = 1603
							flags = 259
							a = 70
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = purple_blue_1
							x_trans = -28
							y_trans = -27
							x_scale = 11
							y_scale = 20
							rot = 1603
							flags = 259
							a = 70
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = purple_blue_1
							x_trans = -28
							y_trans = -10
							x_scale = 11
							y_scale = 20
							rot = 1603
							flags = 259
							a = 70
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = purple_blue_1
							x_trans = -28
							y_trans = 7
							x_scale = 11
							y_scale = 20
							rot = 1603
							flags = 259
							a = 70
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = purple_blue_1
							x_trans = -28
							y_trans = 24
							x_scale = 11
							y_scale = 20
							rot = 1603
							flags = 259
							a = 70
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = purple_blue_1
							x_trans = -28
							y_trans = 41
							x_scale = 11
							y_scale = 20
							rot = 1603
							flags = 259
							a = 70
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = purple_blue_1
							a = 55
							x_trans = -18
							y_trans = 41
							x_scale = 11
							y_scale = 20
							rot = 1603
							flags = 259
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = purple_blue_1
							a = 55
							x_trans = -18
							x_scale = 11
							y_scale = 20
							rot = 1603
							flags = 259
							y_trans = 23
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = purple_blue_1
							a = 55
							x_trans = -18
							y_trans = 6
							x_scale = 11
							y_scale = 20
							rot = 1603
							flags = 259
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = purple_blue_1
							a = 55
							x_trans = -18
							y_trans = -10
							x_scale = 11
							y_scale = 20
							rot = 1603
							flags = 259
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = purple_blue_1
							a = 55
							x_trans = -18
							y_trans = -27
							x_scale = 11
							y_scale = 20
							rot = 1603
							flags = 259
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = purple_blue_1
							a = 55
							x_trans = -18
							x_scale = 11
							y_scale = 20
							rot = 1603
							flags = 259
							y_trans = -46
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = purple_blue_1
							x_trans = -8
							y_trans = -27
							x_scale = 11
							y_scale = 20
							rot = 1603
							flags = 259
							a = 35
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = purple_blue_1
							a = 35
							x_trans = -8
							x_scale = 11
							y_scale = 20
							rot = 1603
							flags = 259
							y_trans = -10
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = purple_blue_1
							a = 35
							x_trans = -8
							y_trans = 7
							x_scale = 11
							y_scale = 20
							rot = 1603
							flags = 259
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = purple_blue_1
							a = 35
							x_trans = -8
							x_scale = 11
							y_scale = 20
							rot = 1603
							flags = 259
							y_trans = 24
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = purple_blue_1
							a = 20
							x_trans = 2
							x_scale = 11
							y_scale = 20
							rot = 1603
							flags = 259
							y_trans = 41
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = purple_blue_1
							a = 20
							x_trans = 2
							y_trans = 24
							x_scale = 11
							y_scale = 20
							rot = 1603
							flags = 259
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = purple_blue_1
							a = 20
							x_trans = 2
							x_scale = 11
							y_scale = 20
							rot = 1603
							flags = 259
							y_trans = 7
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = purple_blue_1
							a = 20
							x_trans = 2
							y_trans = -11
							x_scale = 11
							y_scale = 20
							rot = 1603
							flags = 259
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = purple_blue_1
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
		cas_guitar_neck = {
			desc_id = cag_22fret_esp04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
					material = gtr_fretboard_04_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
							flags = 4
							color = grey_4guitar
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr9_neckhead_01
			chosen_materials = {
				material1 = grey_2guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr9_neckhead_d_01`
					material = gtr9_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/esp/gtr9_neckhead_ld_01`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr9_esp_bridge_03
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr9_esp_knob_10_02
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr1_esp_emg_pkup_2
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			punk
			rock
		]
		cas_guitar_body = {
			desc_id = gtr32_body
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr32_body`
					material = gtr32_horizon_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/esp/gtr32_solid`
							flags = 4
						}
						{
							texture = `tex/models/characters/layers/cag/esp/gtr32_binding01`
							flags = 4
							color = green_2guitar
						}
					]
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = green_2guitar
							x_trans = -9
							y_trans = 26
							x_scale = 1
							rot = 2113
							flags = 259
							y_scale = 21
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = green_2guitar
							y_trans = 26
							x_scale = 1
							y_scale = 79
							rot = 2113
							flags = 259
							x_trans = -26
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = green_2guitar
							y_trans = 3
							x_scale = 1
							y_scale = 99
							rot = 2113
							flags = 259
							x_trans = -28
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = green_2guitar
							x_trans = -31
							y_trans = -17
							x_scale = 1
							y_scale = 99
							rot = 2113
							flags = 259
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = green_2guitar
							y_trans = -37
							x_scale = 1
							y_scale = 69
							rot = 2113
							flags = 259
							x_trans = -34
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = green_2guitar
							x_trans = -30
							x_scale = 1
							y_scale = 99
							rot = 1333
							flags = 259
							y_trans = -27
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = green_2guitar
							y_trans = -7
							x_scale = 1
							y_scale = 99
							rot = 1333
							flags = 259
							x_trans = -30
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = green_2guitar
							x_trans = -25
							y_trans = 15
							x_scale = 1
							rot = 1333
							flags = 259
							y_scale = 125
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = green_2guitar
							x_trans = -36
							x_scale = 1
							y_scale = 57
							rot = 1333
							flags = 259
							y_trans = 40
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = green_2guitar
							x_trans = -36
							y_trans = 25
							x_scale = 1
							rot = 1333
							flags = 259
							y_scale = 57
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 100
							y_trans = 34
							x_scale = 3
							y_scale = 19
							rot = 2323
							flags = 259
							x_trans = -43
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 100
							x_trans = -37
							y_trans = 31
							y_scale = 16
							rot = 4093
							flags = 259
							x_scale = 3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 100
							x_trans = -34
							y_trans = 31
							y_scale = 8
							rot = 2953
							flags = 259
							x_scale = 3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 100
							x_trans = -33
							y_trans = 29
							y_scale = 5
							rot = 3733
							flags = 259
							x_scale = 3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 100
							x_trans = -29
							y_trans = 11
							y_scale = 33
							rot = 2623
							flags = 259
							x_scale = 3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 100
							x_trans = -23
							y_trans = 1
							y_scale = 17
							rot = 3583
							flags = 259
							x_scale = 3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 100
							x_trans = -20
							y_trans = -4
							y_scale = 25
							rot = 2833
							flags = 259
							x_scale = 3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 100
							x_trans = -17
							y_trans = -16
							y_scale = 9
							rot = 3583
							flags = 259
							x_scale = 3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
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
		cas_guitar_neck = {
			desc_id = cag_22fret_esp03
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d3_01`
					material = gtr_fretboard_03_primary
					diffuse
					pre_layer = [
						{
							color = grey_5
							texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr32_neckhead_d
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr30_nekhead_h_d`
					material = gtr30_nekhead_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/esp/gtr30_nekhead_solid`
							flags = 36
						}
						{
							texture = `tex/models/characters/layers/cag/esp/gtr30_nekhead_dtl02`
							flags = 36
							color = green_2guitar
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr32_hardware01
		}
		cas_guitar_knobs = {
			desc_id = gtr_32_knobs_a
		}
		cas_guitar_pickups = {
			desc_id = gtr31_pickup_e
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`classic rock`
		]
		cas_guitar_body = {
			desc_id = gtr4_esp_eclipse_01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr4_esp_eclipse_d_01`
					material = gtr4_esp_eclipse_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/esp/gtr4_esp_eclipse_ld_01`
							flags = 4
							color = grey_3guitar
						}
						{
							texture = `tex/models/characters/layers/cag/esp/gtr4_esp_eclipse_dtl_03`
							flags = 4
							color = black_1guitar
						}
					]
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_001`
							color = red_orange_2
							a = 100
							y_trans = 0
							x_scale = 66
							y_scale = 77
							rot = 1603
							flags = 19
							x_trans = -31
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_001`
							x_trans = -7
							y_trans = 0
							x_scale = 67
							y_scale = 84
							rot = 1603
							flags = 3
							color = blue_1
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_001`
							color = yellow_1guitar
							a = 100
							y_trans = 0
							x_scale = 64
							y_scale = 34
							rot = 1603
							flags = 3
							x_trans = -25
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_001`
							color = yellow_1guitar
							a = 100
							y_trans = 0
							x_scale = 51
							y_scale = 23
							rot = 1603
							flags = 19
							x_trans = -11
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = black_1guitar
							y_trans = -36
							x_scale = 1
							y_scale = 48
							rot = 1603
							flags = 259
							x_trans = -37
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = black_1guitar
							y_trans = -25
							x_scale = 1
							y_scale = 48
							rot = 1603
							flags = 259
							x_trans = -44
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = black_1guitar
							x_trans = -37
							y_trans = -17
							x_scale = 1
							rot = 1603
							flags = 259
							y_scale = 48
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = black_1guitar
							y_trans = 11
							x_scale = 1
							y_scale = 30
							rot = 1603
							flags = 259
							x_trans = -48
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = black_1guitar
							y_trans = 19
							x_scale = 1
							y_scale = 30
							rot = 1603
							flags = 259
							x_trans = -45
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = black_1guitar
							y_trans = 41
							x_scale = 1
							y_scale = 42
							rot = 1603
							flags = 259
							x_trans = -41
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = black_1guitar
							x_trans = -38
							x_scale = 1
							y_scale = 42
							rot = 1603
							flags = 259
							y_trans = 34
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = black_1guitar
							x_trans = -35
							y_trans = 28
							x_scale = 1
							rot = 1603
							flags = 259
							y_scale = 42
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = black_1guitar
							y_trans = 2
							x_scale = 1
							y_scale = 30
							rot = 1603
							flags = 259
							x_trans = -42
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = black_1guitar
							y_trans = 40
							x_scale = 3
							y_scale = 5
							rot = 1603
							flags = 259
							x_trans = -30
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = black_1guitar
							y_trans = 33
							x_scale = 3
							y_scale = 5
							rot = 1603
							flags = 259
							x_trans = -27
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = black_1guitar
							x_trans = -24
							x_scale = 3
							y_scale = 5
							rot = 1603
							flags = 259
							y_trans = 27
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = black_1guitar
							x_trans = -37
							x_scale = 3
							y_scale = 5
							rot = 1603
							flags = 259
							y_trans = 18
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = black_1guitar
							y_trans = 10
							x_scale = 3
							y_scale = 5
							rot = 1603
							flags = 259
							x_trans = -40
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = black_1guitar
							x_trans = -34
							y_trans = 1
							x_scale = 3
							rot = 1603
							flags = 259
							y_scale = 5
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = black_1guitar
							y_trans = -18
							x_scale = 3
							y_scale = 5
							rot = 1603
							flags = 259
							x_trans = -25
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = black_1guitar
							x_trans = -31
							x_scale = 3
							y_scale = 5
							rot = 1603
							flags = 259
							y_trans = -26
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = black_1guitar
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
		cas_guitar_neck = {
			desc_id = cag_22fret_esp01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d_01`
					material = gtr_fretboard_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
							flags = 4
							color = grey_4guitar
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr4_neckhead_01
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr4_esp_bridge_02
		}
		cas_guitar_knobs = {
			desc_id = gtr4_esp_knob_10_03
		}
		cas_guitar_pickups = {
			desc_id = gtr1_esp_emg_pkup_2
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`glam rock`
			pop
		]
		cas_guitar_body = {
			desc_id = gtr90_dr_daisy
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/daisyrock/gtr90_dr_daisy_d`
					material = gtr90_dr_daisy_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/daisyrock/gtr90_dr_daisy_ld02`
							flags = 4
							color = navy_2
						}
						{
							texture = `tex/models/characters/layers/cag/daisyrock/gtr90_dr_daisy_dtl07`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_daisy02
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d2_01`
					material = gtr_fretboard_02_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/22fret_ld123_dr_butterfly`
							flags = 36
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr90_dr_neckhead01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/daisyrock/gtr90_neckhead01_d`
					material = gtr90_dr_neckhead01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/daisyrock/gtr90_neckhead01_ld02`
							flags = 36
							color = navy_2
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = gtr90_pg
		}
		cas_guitar_bridges = {
			desc_id = gtr_bridge_mcswain_l_4b
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01c
		}
		cas_guitar_pickups = {
			desc_id = gtr90_pickup1
		}
		cas_guitar_misc = {
			desc_id = gtr_misc_switch4
		}
	}
	{
		genre = [
			rock
			`classic rock`
			goth
			`heavy metal`
		]
		cas_guitar_body = {
			desc_id = gtr37_esp_rw
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr37_rw_d`
					material = gtr37_rw_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/esp/gtr37_rw_paint`
							flags = 4
						}
						{
							texture = `tex/models/characters/layers/cag/esp/gtr37_rw_binding`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_esp04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
					material = gtr_fretboard_04_primary
					diffuse
					pre_layer = [
						{
							color = grey_5
							texture = `tex/models/characters/layers/cag/gh5/22fret_ld103_esp_skulls2`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr37_neckhead
			chosen_materials = {
				material1 = grey_2guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr37_nekhed`
					material = gtr37_nhead_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/esp/gtr37_nekhed_solid`
							flags = 36
						}
						{
							texture = `tex/models/characters/layers/cag/esp/gtr37_nekhed_dtl02`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = gtr37_pguard01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr37_pguard01_d`
					material = gtr37_pguard_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/esp/gtr37_pguard01_dtl02`
							flags = 4
							color = grey_3guitar
						}
					]
				}
			]
		}
		cas_guitar_bridges = {
			desc_id = gtr37_hardware
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr37_knobs01
			chosen_materials = {
				material1 = grey_3guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr37_pickup_f
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			rock
			punk
			`classic rock`
			`heavy metal`
		]
		cas_guitar_body = {
			desc_id = gtr37_esp_rw
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr37_rw_d`
					material = gtr37_rw_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/esp/gtr37_rw_paint`
							flags = 4
							color = yellow_3guitar
						}
						{
							color = red_3
							texture = `tex/models/characters/layers/cag/esp/gtr37_rw_tri`
							flags = 4
						}
						{
							texture = `tex/models/characters/layers/cag/esp/gtr37_rw_trash`
							flags = 4
							color = yellow_orange_5
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_esp02
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d2_01`
					material = gtr_fretboard_02_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/22fret_ld102_esp_logo`
							flags = 36
							color = navy_5
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr37_neckhead
			chosen_materials = {
				material1 = grey_2guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr37_nekhed`
					material = gtr37_nhead_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/all_clear`
							flags = 4
						}
						{
							texture = `tex/models/characters/layers/cag/all_clear2`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = gtr37_pguard01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr37_pguard01_d`
					material = gtr37_pguard_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/esp/gtr37_pguard01_dtl00`
							flags = 4
							color = yellow_orange_5
						}
					]
				}
			]
		}
		cas_guitar_bridges = {
			desc_id = gtr37_bridge
		}
		cas_guitar_knobs = {
			desc_id = gtr37_knobs01
			chosen_materials = {
				material1 = grey_5guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr37_pickup
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`heavy metal`
		]
		cas_guitar_body = {
			desc_id = gtr9_esp_ax
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr9_esp_ax_d`
					material = gtr9_esp_ax_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/esp/gtr9_esp_eclipse_ld_11`
							flags = 4
							color = red_1
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_esp03
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d3_01`
					material = gtr_fretboard_03_primary
					diffuse
					pre_layer = [
						{
							color = grey_5
							texture = `tex/models/characters/layers/cag/gh5/22fret_ld105_esp_updots`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr9_neckhead_01
			chosen_materials = {
				material1 = grey_2guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr9_neckhead_d_01`
					material = gtr9_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/esp/gtr9_neckhead_ld_11`
							flags = 36
							color = red_1
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr9_esp_bridge_03
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr9_esp_knob_10_02
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr1_esp_emg_pkup_2
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`heavy metal`
		]
		cas_guitar_body = {
			desc_id = gtr9_esp_ax
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr9_esp_ax_d`
					material = gtr9_esp_ax_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/esp/gtr9_esp_ax_ld_03`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_esp03
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d3_01`
					material = gtr_fretboard_03_primary
					diffuse
					pre_layer = [
						{
							color = grey_5
							texture = `tex/models/characters/layers/cag/gh5/22fret_ld102_esp_logo`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr9_neckhead_01
			chosen_materials = {
				material1 = grey_2guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr9_neckhead_d_01`
					material = gtr9_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/esp/gtr9_neckhead_ld_11`
							flags = 36
							color = yellow_orange_4
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr9_esp_bridge_03
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr9_esp_knob_10_02
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr1_esp_emg_pkup_2
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`heavy metal`
			`black metal`
		]
		cas_guitar_body = {
			desc_id = gtr9_esp_ax
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr9_esp_ax_d`
					material = gtr9_esp_ax_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/esp/gtr9_esp_ax_ld_01`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_esp04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
					material = gtr_fretboard_04_primary
					diffuse
					pre_layer = [
						{
							color = grey_5
							texture = `tex/models/characters/layers/cag/gh5/22fret_ld105_esp_updots`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr9_neckhead_01
			chosen_materials = {
				material1 = grey_2guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr9_neckhead_d_01`
					material = gtr9_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/esp/gtr9_neckhead_ld_01`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr9_esp_bridge_03
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr9_esp_knob_10_02
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr1_esp_emg_pkup_2
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			rock
			punk
		]
		cas_guitar_body = {
			desc_id = gtr4_esp_eclipse_01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr4_esp_eclipse_d_01`
					material = gtr4_esp_eclipse_01_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/esp/gtr4_esp_eclipse_ld_01`
							flags = 4
						}
						{
							texture = `tex/models/characters/layers/cag/esp/gtr4_esp_eclipse_dtl_05`
							flags = 4
							color = orange_4
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_esp04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
					material = gtr_fretboard_04_primary
					diffuse
					pre_layer = [
						{
							color = grey_5
							texture = `tex/models/characters/layers/cag/gh5/22fret_ld84_esp_flagship`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr4_neckhead_01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr4_neckhead_d_01`
					material = gtr4_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/esp/gtr4_neckhead_ld_01`
							flags = 36
						}
						{
							texture = `tex/models/characters/layers/cag/esp/gtr4_neckhead_dtl_06`
							flags = 36
							color = orange_4
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr4_esp_bridge_02
		}
		cas_guitar_knobs = {
			desc_id = gtr4_esp_knob_10_03
			chosen_materials = {
				material1 = yellow_3guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr1_esp_emg_pkup_2
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`heavy metal`
			goth
			punk
		]
		cas_guitar_body = {
			desc_id = gtr4_esp_eclipse_01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr4_esp_eclipse_d_01`
					material = gtr4_esp_eclipse_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/esp/gtr4_esp_eclipse_ld_01`
							flags = 4
							color = grey_5guitar
						}
						{
							texture = `tex/models/characters/layers/cag/esp/gtr4_esp_eclipse_dtl_05`
							flags = 4
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_esp04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
					material = gtr_fretboard_04_primary
					diffuse
					pre_layer = [
						{
							color = grey_5
							texture = `tex/models/characters/layers/cag/gh5/22fret_ld84_esp_flagship`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr4_neckhead_01
			chosen_materials = {
				material1 = black_1guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr4_neckhead_d_01`
					material = gtr4_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/esp/gtr4_neckhead_ld_01`
							flags = 36
						}
						{
							texture = `tex/models/characters/layers/cag/esp/gtr4_neckhead_dtl_06`
							flags = 36
							color = grey_5guitar
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr4_esp_bridge_02
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr4_knob_02
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr1_esp_emg_pkup_2
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`classic rock`
		]
		cas_guitar_body = {
			desc_id = gtr4_esp_eclipse_01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr4_esp_eclipse_d_01`
					material = gtr4_esp_eclipse_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/esp/gtr4_esp_eclipse_ld_04`
							flags = 4
						}
						{
							texture = `tex/models/characters/layers/cag/esp/gtr4_esp_eclipse_dtl_01`
							flags = 4
							a = 65
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_esp03
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d3_01`
					material = gtr_fretboard_03_primary
					diffuse
					pre_layer = [
						{
							color = grey_5
							texture = `tex/models/characters/layers/cag/gh5/22fret_ld84_esp_flagship`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr4_neckhead_01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr4_neckhead_d_01`
					material = gtr4_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/esp/gtr4_neckhead_ld_01`
							flags = 36
						}
						{
							texture = `tex/models/characters/layers/cag/esp/gtr4_neckhead_dtl_06`
							flags = 36
							color = grey_5guitar
						}
					]
				}
			]
			chosen_materials = {
				material1 = grey_5guitar
			}
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr4_esp_bridge_02
			chosen_materials = {
				material1 = grey_5guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr4_esp_knob_10_03
		}
		cas_guitar_pickups = {
			desc_id = gtr1_esp_emg_pkup_2
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`classic rock`
			pop
		]
		cas_guitar_body = {
			desc_id = gtr4_esp_eclipse_01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr4_esp_eclipse_d_01`
					material = gtr4_esp_eclipse_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/esp/gtr4_esp_eclipse_ld_03`
							flags = 4
						}
						{
							texture = `tex/models/characters/layers/cag/all_clear2`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_esp03
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d3_01`
					material = gtr_fretboard_03_primary
					diffuse
					pre_layer = [
						{
							color = grey_5
							texture = `tex/models/characters/layers/cag/gh5/22fret_ld84_esp_flagship`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr4_neckhead_01
			chosen_materials = {
				material1 = grey_5guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr4_neckhead_d_01`
					material = gtr4_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/esp/gtr4_neckhead_ld_01`
							flags = 36
						}
						{
							texture = `tex/models/characters/layers/cag/esp/gtr4_neckhead_dtl_01`
							flags = 36
							color = orange_4
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr4_esp_bridge_02
			chosen_materials = {
				material1 = grey_5guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr4_knob_02
			chosen_materials = {
				material1 = orange_3
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr1_esp_emg_pkup_2
			chosen_materials = {
				material1 = orange_5
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`heavy metal`
			`black metal`
			goth
			punk
		]
		cas_guitar_body = {
			desc_id = gtr4_esp_eclipse_01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr4_esp_eclipse_d_01`
					material = gtr4_esp_eclipse_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/esp/gtr4_esp_eclipse_bio`
							flags = 4
						}
						{
							texture = `tex/models/characters/layers/cag/all_clear2`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_esp04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
					material = gtr_fretboard_04_primary
					diffuse
					pre_layer = [
						{
							color = grey_5
							texture = `tex/models/characters/layers/cag/gh5/22fret_ld84_esp_flagship`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr4_neckhead_01
			chosen_materials = {
				material1 = black_1guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr4_neckhead_d_01`
					material = gtr4_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/esp/gtr4_neckhead_ld_01`
							flags = 36
						}
						{
							texture = `tex/models/characters/layers/cag/all_clear2`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr4_esp_bridge_02
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr4_esp_knob_10_03
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr1_esp_emg_pkup_2
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`heavy metal`
			`black metal`
			goth
			punk
		]
		cas_guitar_body = {
			desc_id = gtr63f_esp_ex
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr63f_esp_ex_d`
					material = gtr63f_esp_ex_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/esp/gtr63c_esp_biomchn`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_esp04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
					material = gtr_fretboard_04_primary
					diffuse
					pre_layer = [
						{
							color = grey_5
							texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr63f_neckhead
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr63f_neckhead_d`
					material = gtr63f_neckhead_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/esp/gtr63f_neckhead_ld_01`
							flags = 36
						}
					]
				}
			]
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr_hardware63f
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr63_knob_type06
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr62_esp_emg
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`glam rock`
			punk
		]
		cas_guitar_body = {
			desc_id = gtr63f_esp_ex
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr63f_esp_ex_d`
					material = gtr63f_esp_ex_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/esp/gtr63f_esp_ex_ld_01`
							flags = 4
						}
						{
							texture = `tex/models/characters/layers/cag/esp/gtr63c_esp_avtar`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_esp04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
					material = gtr_fretboard_04_primary
					diffuse
					pre_layer = [
						{
							color = grey_5
							texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr63f_neckhead
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr63f_neckhead_d`
					material = gtr63f_neckhead_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/esp/gtr63f_neckhead_ld_01`
							flags = 36
						}
					]
				}
			]
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr_hardware63f
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr63_knob_type06
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr62_esp_emg
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`glam rock`
			punk
		]
		cas_guitar_body = {
			desc_id = gtr63f_esp_ex
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr63f_esp_ex_d`
					material = gtr63f_esp_ex_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/esp/gtr63f_esp_ex_ld_01`
							flags = 4
							color = grey_5guitar
						}
						{
							texture = `tex/models/characters/layers/cag/esp/gtr63c_esp_outlaw`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_esp04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
					material = gtr_fretboard_04_primary
					diffuse
					pre_layer = [
						{
							color = grey_5
							texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr63f_neckhead
			chosen_materials = {
				material1 = grey_2guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr63f_neckhead_d`
					material = gtr63f_neckhead_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/esp/gtr63f_neckhead_ld_01`
							flags = 36
							color = grey_5guitar
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr_hardware63f
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr63_knob_type06
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr62_esp_emg
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`heavy metal`
			punk
		]
		cas_guitar_body = {
			desc_id = gtr63f_esp_ex
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr63f_esp_ex_d`
					material = gtr63f_esp_ex_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/esp/gtr63f_esp_ex_ld_01`
							flags = 4
							color = grey_5guitar
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_24fret_esp04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
					material = gtr_fretboard24_04_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/24fret_ld102_esp_logo`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr63f_neckhead
			chosen_materials = {
				material1 = black_1guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr63f_neckhead_d`
					material = gtr63f_neckhead_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/esp/gtr63f_neckhead_ld_01`
							flags = 36
							color = grey_5guitar
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr_hardware63f
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr63_knob_type06
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr62_esp_emg
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`heavy metal`
		]
		cas_guitar_body = {
			desc_id = gtr9_esp_ax
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr9_esp_ax_d`
					material = gtr9_esp_ax_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/esp/gtr9_esp_ax_ld_01`
							flags = 4
						}
						{
							color = grey_2guitar
							texture = `tex/models/characters/layers/cag/esp/gtr9_esp_ax_dtl_6b`
							flags = 4
						}
						{
							color = grey_4guitar
							texture = `tex/models/characters/layers/cag/esp/gtr9_esp_ax_dtl_6a`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_24fret_esp04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
					material = gtr_fretboard24_04_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/24fret_ld103_esp_skulls2`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr9_neckhead_01
			chosen_materials = {
				material1 = black_1guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr9_neckhead_d_01`
					material = gtr9_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/esp/gtr9_neckhead_ld_01`
							flags = 36
						}
						{
							texture = `tex/models/characters/layers/cag/esp/gtr9_neckhead_dtl_03`
							flags = 36
							color = grey_3guitar
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr9_esp_bridge_03
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr9_esp_knob_10_02
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr_pkup_type1_blk_2
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`heavy metal`
			goth
			`black metal`
		]
		cas_guitar_body = {
			desc_id = gtr12_esp_v_01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr12_esp_v_series_d`
					material = gtr12_esp_v_01_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/esp/gtr12_esp_v_series_ld_02`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_esp04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
					material = gtr_fretboard_04_primary
					diffuse
					pre_layer = [
						{
							color = grey_5
							texture = `tex/models/characters/layers/cag/gh5/22fret_ld89_esp_triangles`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr12_neckhead_07
			chosen_materials = {
				material1 = black_1guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr4_neckhead_d_07`
					material = gtr12_neckhead_07_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/esp/gtr4_neckhead_07_ld_01`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = gtr12_pickguard_01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr12_pickguard_d_01`
					material = gtr12_pickguard_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/esp/gtr12_pickguard_ld_01`
							flags = 4
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_bridges = {
			desc_id = gtr12_bridge_3
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr12_esp_knob_01
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr1_esp_emg_pkup_2
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`heavy metal`
			goth
			`black metal`
		]
		cas_guitar_body = {
			desc_id = gtr62_esp_alexi
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr62_esp_alexi_d`
					material = gtr62_esp_alexi_primary
					diffuse
					pre_layer = [
						{
							texture = `tex\models\characters\layers\cag\esp\gtr62_esp_alexi_ld_04`
							flags = 4
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/layers/cag/all_clear2`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_esp04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
					material = gtr_fretboard_04_primary
					diffuse
					pre_layer = [
						{
							color = grey_5
							texture = `tex/models/characters/layers/cag/gh5/22fret_ld96_esp_razors`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr62_neckhead
			chosen_materials = {
				material1 = grey_2guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr62_d_neckhead`
					material = gtr62_neckhead_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/esp/gtr62_neckhead_ld_04`
							flags = 36
						}
						{
							texture = `tex/models/characters/layers/cag/all_clear2`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr_hardware02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr62_knob_type03
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr62_esp_emg
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`classic rock`
		]
		cas_guitar_body = {
			desc_id = gtr32_body
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr32_body`
					material = gtr32_horizon_primary
					diffuse
					pre_layer = [
						{
							color = red_2
							texture = `tex/models/characters/layers/cag/esp/gtr32_esptrash`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_esp01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d_01`
					material = gtr_fretboard_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
							flags = 4
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr32_neckhead_c
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr32_hardware01
		}
		cas_guitar_knobs = {
			desc_id = gtr_32_knobs_a
		}
		cas_guitar_pickups = {
			desc_id = gtr32_pickup_f
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`classic rock`
			rock
		]
		cas_guitar_body = {
			desc_id = gtr32_body
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr32_body`
					material = gtr32_horizon_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/esp/gtr32_quilt`
							flags = 4
							color = orange_3
						}
						{
							texture = `tex/models/characters/layers/cag/esp/gtr32_triburst`
							color = red_orange_2
							flags = 4
							a = 65
						}
						{
							texture = `tex/models/characters/layers/cag/all_clear2`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_24fret_esp04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
					material = gtr_fretboard24_04_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/24fret_ld82_esp_custom`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr32_nekhead01
			chosen_materials = {
				material1 = grey_5guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr32_nekhed`
					material = gtr32_nhed_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/esp/gtr32_nekhed_dtl01`
							flags = 36
							color = red_orange_1
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr32_hardware01
			chosen_materials = {
				material1 = grey_5guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr_32_knobs_a
		}
		cas_guitar_pickups = {
			desc_id = gtr31_pickup_e
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			pop
		]
		cas_guitar_body = {
			desc_id = gtr32_body
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr32_body`
					material = gtr32_horizon_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/esp/gtr32_solid`
							flags = 4
							color = purple_blue_1
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_esp03
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d3_01`
					material = gtr_fretboard_03_primary
					diffuse
					pre_layer = [
						{
							color = grey_5
							texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr32_neckhead_d
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr30_nekhead_h_d`
					material = gtr30_nekhead_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/esp/gtr30_nekhead_solid`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr32_hardware01
		}
		cas_guitar_knobs = {
			desc_id = gtr_32_knobs_a
		}
		cas_guitar_pickups = {
			desc_id = gtr31_pickup_e
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`classic rock`
			pop
		]
		cas_guitar_body = {
			desc_id = gtr33d_base
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr33_kh2_wood_d`
					material = gtr33d_wood_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/esp/gtr33_solid`
							flags = 4
							color = teal_1
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_esp03
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d3_01`
					material = gtr_fretboard_03_primary
					diffuse
					pre_layer = [
						{
							color = grey_5
							texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr33d_nekhed
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr33_hardware01z
		}
		cas_guitar_knobs = {
			desc_id = gtr33_knobs_kh2
		}
		cas_guitar_pickups = {
			desc_id = gtr33_emg
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`heavy metal`
		]
		cas_guitar_body = {
			desc_id = gtr33d_base
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr33_kh2_wood_d`
					material = gtr33d_wood_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/esp/gtr33_solid`
							flags = 4
						}
						{
							color = grey_2guitar
							texture = `tex/models/characters/layers/cag/esp/gtr33_dtl6b`
							flags = 4
						}
						{
							color = grey_4guitar
							texture = `tex/models/characters/layers/cag/esp/gtr33_dtl6a`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_esp04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
					material = gtr_fretboard_04_primary
					diffuse
					pre_layer = [
						{
							color = grey_5
							texture = `tex/models/characters/layers/cag/gh5/22fret_ld96_esp_razors`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr33d_nekhed
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr33_hardware01z
		}
		cas_guitar_knobs = {
			desc_id = gtr33_knobs_kh2
		}
		cas_guitar_pickups = {
			desc_id = gtr33_emg
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`heavy metal`
		]
		cas_guitar_body = {
			desc_id = gtr33d_base
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr33_kh2_wood_d`
					material = gtr33d_wood_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/esp/gtr33_solid`
							flags = 4
						}
						{
							texture = `tex/models/characters/layers/cag/esp/gtr33_dtl7b`
							flags = 4
							color = grey_5guitar
						}
						{
							texture = `tex/models/characters/layers/cag/esp/gtr33_dtl7a`
							flags = 4
							color = teal_1
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_esp04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
					material = gtr_fretboard_04_primary
					diffuse
					pre_layer = [
						{
							color = grey_5
							texture = `tex/models/characters/layers/cag/gh5/22fret_ld96_esp_razors`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr33d_nekhed
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr33_hardware01z
		}
		cas_guitar_knobs = {
			desc_id = gtr33_knobs_kh2
		}
		cas_guitar_pickups = {
			desc_id = gtr33_emg
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`classic rock`
		]
		cas_guitar_body = {
			desc_id = gtr37_esp_rw
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr37_rw_d`
					material = gtr37_rw_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/esp/gtr37_rw_paint`
							flags = 4
							color = red_3
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_esp02
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d2_01`
					material = gtr_fretboard_02_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
							flags = 4
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr37_neckhead
		}
		cas_guitar_pickguards = {
			desc_id = gtr37_pguard01
		}
		cas_guitar_bridges = {
			desc_id = gtr37_bridge
		}
		cas_guitar_knobs = {
			desc_id = gtr37_knobs01
		}
		cas_guitar_pickups = {
			desc_id = gtr37_pickup
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`classic rock`
		]
		cas_guitar_body = {
			desc_id = gtr37_esp_rw
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr37_rw_d`
					material = gtr37_rw_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/esp/gtr37_rw_paint`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_esp01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d_01`
					material = gtr_fretboard_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
							flags = 4
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr37_neckhead
		}
		cas_guitar_pickguards = {
			desc_id = gtr37_pguard01
		}
		cas_guitar_bridges = {
			desc_id = gtr37_bridge
		}
		cas_guitar_knobs = {
			desc_id = gtr37_knobs01
		}
		cas_guitar_pickups = {
			desc_id = gtr37_pickup
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			punk
			rock
			pop
		]
		cas_guitar_body = {
			desc_id = gtr10_mcswain_flame
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/mcswain/gtr10_mcswain_flame_d`
					material = gtr10_mcswain_flame_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/mcswain/gtr10_mcswain_flame_ld1`
							flags = 4
							color = black_1guitar
						}
						{
							color = red_orange_3
							texture = `tex/models/characters/layers/cag/mcswain/gtr10_mcswain_flame_fd2`
							flags = 4
						}
						{
							texture = `tex/models/characters/layers/cag/mcswain/gtr10_mcswain_flame_dtl1`
							color = red_1
							flags = 4
							a = 85
						}
					]
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = grey_5guitar
							x_trans = -31
							y_trans = 1
							x_scale = 42
							rot = 1603
							flags = 259
							y_scale = 60
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = black_1guitar
							x_trans = -31
							y_trans = 1
							y_scale = 59
							rot = 1603
							flags = 259
							x_scale = 41
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = yellow_1guitar
							y_trans = 1
							x_scale = 39
							y_scale = 57
							rot = 1603
							flags = 259
							x_trans = -31
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_030`
							color = black_1guitar
							x_trans = -25
							x_scale = 21
							y_scale = 30
							rot = 1603
							flags = 259
							y_trans = 12
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_030`
							color = black_1guitar
							y_trans = 13
							x_scale = 21
							y_scale = 30
							rot = 1603
							flags = 259
							x_trans = -38
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_015`
							color = black_1guitar
							x_trans = -33
							x_scale = 32
							y_scale = 40
							rot = 750
							flags = 259
							y_trans = -6
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_041`
							color = black_1guitar
							y_trans = -3
							x_scale = 11
							y_scale = 10
							rot = 1843
							flags = 275
							x_trans = -39
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_041`
							color = black_1guitar
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
		cas_guitar_neck = {
			desc_id = cag_22fret_mcswain01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d_01`
					material = gtr_fretboard_01_primary
					diffuse
					pre_layer = [
						{
							color = grey_5
							texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr10_neckhead_mcswain1
			chosen_materials = {
				material1 = grey_2guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/mcswain/gtr10_neckhead_mcswain1_d`
					material = gtr10_neckhead_mcswain_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/mcswain/gtr10_nkhd_mcswain_ld1`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr_brdg_mcswn_inferno_3
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_type3_blk
		}
		cas_guitar_misc = {
			desc_id = gtr_misc_switch
		}
	}
	{
		genre = [
			pop
			`glam rock`
		]
		cas_guitar_body = {
			desc_id = gtr10_mcswain_flame
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/mcswain/gtr10_mcswain_flame_d`
					material = gtr10_mcswain_flame_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/mcswain/gtr10_mcswain_flame_ld7`
							flags = 4
						}
						{
							color = red_orange_3
							texture = `tex/models/characters/layers/cag/mcswain/gtr10_mcswain_flame_fd1`
							flags = 4
						}
						{
							texture = `tex/models/characters/layers/cag/mcswain/gtr10_mcswain_flame_dtl1`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_mcswain04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
					material = gtr_fretboard_04_primary
					diffuse
					pre_layer = [
						{
							color = grey_5
							texture = `tex/models/characters/layers/cag/gh5/22_fret_ld70_mcswn_flame`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr12_neckhead_mcswain12
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/mcswain/gtr12_neckhead_mcswain_d`
					material = gtr12_neckhead_mcswain12_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/mcswain/gtr12_nkhd_mcswain_ld1`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr_bridge_mcswain_l_4
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01
		}
		cas_guitar_pickups = {
			desc_id = gtr10_pickup_mcswain_1
		}
		cas_guitar_misc = {
			desc_id = gtr_misc_switch
		}
	}
	{
		genre = [
			punk
		]
		cas_guitar_body = {
			desc_id = gtr11_mcswain_carved
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/mcswain/gtr11_mcswain_carved_d`
					material = gtr11_mcswain_carved_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/mcswain/gtr11_mcswain_flame_ld11`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_mcswain04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
					material = gtr_fretboard_04_primary
					diffuse
					pre_layer = [
						{
							color = grey_5
							texture = `tex/models/characters/layers/cag/gh5/22_fret_ld72_mcswn_queen`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr10_neckhead_mcswain1
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/mcswain/gtr10_neckhead_mcswain1_d`
					material = gtr10_neckhead_mcswain_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/mcswain/gtr10_nkhd_mcswain_ld1`
							flags = 36
							color = yellow_5guitar
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr_bridge_mcswain_2
			chosen_materials = {
				material1 = yellow_3guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01
			chosen_materials = {
				material1 = yellow_3guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_sd06
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = gtr_misc_switch
		}
	}
	{
		genre = [
			punk
		]
		cas_guitar_body = {
			desc_id = gtr11_mcswain_carved
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/mcswain/gtr11_mcswain_carved_d`
					material = gtr11_mcswain_carved_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/mcswain/gtr11_mcswain_flame_ld12`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_mcswain04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
					material = gtr_fretboard_04_primary
					diffuse
					pre_layer = [
						{
							color = grey_5
							texture = `tex/models/characters/layers/cag/gh5/22_fret_ld73_mcswn_anarchy`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr10_neckhead_mcswain1
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/mcswain/gtr10_neckhead_mcswain1_d`
					material = gtr10_neckhead_mcswain_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/mcswain/gtr10_nkhd_mcswain_ld1`
							flags = 36
							color = grey_5guitar
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr_bridge_mcswain_l_4
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_sd06
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = gtr_misc_switch
		}
	}
	{
		genre = [
			rock
			`heavy metal`
		]
		cas_guitar_body = {
			desc_id = gtr12_mcswain_minferno
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/mcswain/gtr12_mcswain_minferno_d`
					material = gtr12_mcswain_minferno_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/mcswain/gtr12_mcswain_minferno_ld1`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_mcswain04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
					material = gtr_fretboard_04_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
							flags = 4
							color = grey_5
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr12_neckhead_mcswain12
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/mcswain/gtr12_neckhead_mcswain_d`
					material = gtr12_neckhead_mcswain12_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/mcswain/gtr12_nkhd_mcswain_ld1`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr_brdg_mcswn_inferno_3
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01
		}
		cas_guitar_pickups = {
			desc_id = gtr10_pickup_mcswain_1
		}
		cas_guitar_misc = {
			desc_id = gtr_misc_switch
		}
	}
	{
		genre = [
			`classic rock`
		]
		cas_guitar_body = {
			desc_id = gtr11_mcswain_carved
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/mcswain/gtr11_mcswain_carved_d`
					material = gtr11_mcswain_carved_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/mcswain/gtr11_mcswain_flame_ld10`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_mcswain01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d_01`
					material = gtr_fretboard_01_primary
					diffuse
					pre_layer = [
						{
							color = grey_5
							texture = `tex/models/characters/layers/cag/gh5/22_fret_ld71_mcswn_waves`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr10_neckhead_mcswain1
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/mcswain/gtr10_neckhead_mcswain1_d`
					material = gtr10_neckhead_mcswain_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/mcswain/gtr10_nkhd_mcswain_ld3`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr_bridge_mcswain_2
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_type2_paf1
			chosen_materials = {
				material1 = grey_5guitar
			}
		}
		cas_guitar_misc = {
			desc_id = gtr_misc_switch
		}
	}
	{
		genre = [
			punk
			mixed
			pop
		]
		cas_guitar_body = {
			desc_id = gtr22_bc_rich_warlock
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr22_bc_rich_warlock_d`
					material = gtr22_bc_rich_warlock_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/bc_rich/gtr_bc_rich_warlock_ld1`
							flags = 4
							color = violet_3
						}
						{
							texture = `tex/models/characters/layers/cag/bc_rich/gtr_bc_rich_warlock_fd3`
							flags = 4
							color = violet_2
						}
					]
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_022`
							y_trans = -10
							x_scale = 32
							y_scale = 47
							rot = 1603
							flags = 259
							x_trans = -20
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_022`
							x_trans = -20
							x_scale = 32
							y_scale = 47
							rot = 1603
							flags = 259
							y_trans = -38
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_022`
							x_trans = -40
							x_scale = 32
							y_scale = 47
							rot = 1603
							flags = 259
							y_trans = -36
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_022`
							x_trans = -1
							x_scale = 32
							y_scale = 47
							rot = 1603
							flags = 259
							y_trans = -12
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_022`
							x_trans = -1
							x_scale = 32
							y_scale = 47
							rot = 1603
							flags = 259
							y_trans = 17
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_022`
							y_trans = -41
							x_scale = 32
							y_scale = 47
							rot = 1603
							flags = 259
							x_trans = -1
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_022`
							x_trans = -21
							x_scale = 32
							y_scale = 47
							rot = 1603
							flags = 259
							y_trans = 19
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_022`
							y_trans = 19
							x_scale = 32
							y_scale = 47
							rot = 1603
							flags = 259
							x_trans = -40
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_022`
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
		cas_guitar_neck = {
			desc_id = cag_22fret_bcrich04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
					material = gtr_fretboard_04_primary
					diffuse
					pre_layer = [
						{
							color = grey_5
							texture = `tex/models/characters/layers/cag/bc_rich/22fret_ld04_bcr_diamonds`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr22_neckhead_pointed5
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr20_neckhead_pointed3_d`
					material = gtr22_neckhead_pointed5_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/bc_rich/gtr20_neckhead_pointed_ld02`
							flags = 36
							color = violet_3
						}
						{
							texture = `tex/models/characters/layers/cag/bc_rich/gtr20_neckhead_pointed_fad04`
							flags = 36
							color = violet_1
						}
						{
							texture = `tex/models/characters/layers/cag/bc_rich/gtr20_neckhead_pointed_dtl02`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr22_bridge_whammy1
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01
		}
		cas_guitar_pickups = {
			desc_id = gtr_emg_pickup5
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = gtr_misc_switch
		}
	}
	{
		genre = [
			`black metal`
			`heavy metal`
		]
		cas_guitar_body = {
			desc_id = gtr21_bc_rich_warbeast
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr21_bc_rich_warbeast_d`
					material = gtr21_bc_rich_warbeast_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/bc_rich/gtr_bc_rich_warbeast_ld1`
							flags = 4
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_bcrich01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d_01`
					material = gtr_fretboard_01_primary
					diffuse
					pre_layer = [
						{
							color = grey_5
							texture = `tex/models/characters/layers/cag/all_clear2`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr21_neckhead_beast2
			chosen_materials = {
				material1 = black_1guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr20_neckhead_beast1_d`
					material = gtr21_neckhead_beast2_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/bc_rich/gtr20_neckhead_ld03`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr_bc_rich_bridge_21
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr_emg_pickup2
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = gtr_misc_switch_blk_3
		}
	}
	{
		genre = [
			`black metal`
			`heavy metal`
			goth
		]
		cas_guitar_body = {
			desc_id = gtr21_bc_rich_warbeast
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr21_bc_rich_warbeast_d`
					material = gtr21_bc_rich_warbeast_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/bc_rich/gtr_bc_rich_warbeast_ld1`
							flags = 4
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/layers/cag/bc_rich/gtr_bc_rich_warbeast_dtl1`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_bcrich04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
					material = gtr_fretboard_04_primary
					diffuse
					pre_layer = [
						{
							color = grey_5
							texture = `tex/models/characters/layers/cag/bc_rich/22fret_ld05_bcr_njdlx`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr21_neckhead_beast2
			chosen_materials = {
				material1 = grey_2guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr20_neckhead_beast1_d`
					material = gtr21_neckhead_beast2_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/bc_rich/gtr20_neckhead_ld02`
							flags = 36
						}
						{
							texture = `tex/models/characters/layers/cag/bc_rich/gtr20_neckhead_dtl01`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr22_bridge_whammy1
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr_emg_pickup2
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = gtr_misc_switch_blk_3
		}
	}
	{
		genre = [
			`black metal`
			`heavy metal`
			goth
		]
		cas_guitar_body = {
			desc_id = gtr22_bc_rich_warlock
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr22_bc_rich_warlock_d`
					material = gtr22_bc_rich_warlock_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/bc_rich/gtr_bc_rich_warlock_ld1`
							flags = 4
							color = grey_5guitar
						}
						{
							texture = `tex/models/characters/layers/cag/bc_rich/gtr_bc_rich_warlock_dtl1`
							flags = 4
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_bcrich01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d_01`
					material = gtr_fretboard_01_primary
					diffuse
					pre_layer = [
						{
							color = grey_5
							texture = `tex/models/characters/layers/cag/bc_rich/22fret_ld04_bcr_diamonds`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr22_neckhead_beast3
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr20_neckhead_beast1_d`
					material = gtr22_neckhead_beast3_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/bc_rich/gtr20_neckhead_ld02`
							flags = 36
							color = grey_5guitar
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr_bc_rich_bridge_21
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01
		}
		cas_guitar_pickups = {
			desc_id = gtr_emg_pickup2
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = gtr_misc_switch
		}
	}
	{
		genre = [
			`black metal`
			`heavy metal`
		]
		cas_guitar_body = {
			desc_id = gtr22_bc_rich_warlock
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr22_bc_rich_warlock_d`
					material = gtr22_bc_rich_warlock_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/bc_rich/gtr_bc_rich_warlock_ld1`
							flags = 4
							color = grey_2guitar
						}
						{
							texture = `tex/models/characters/layers/cag/all_clear2`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_bcrich03
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d3_01`
					material = gtr_fretboard_03_primary
					diffuse
					pre_layer = [
						{
							color = grey_5
							texture = `tex/models/characters/layers/cag/bc_rich/22fret_ld04_bcr_diamonds`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr22_neckhead_pointed5
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr20_neckhead_pointed3_d`
					material = gtr22_neckhead_pointed5_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/bc_rich/gtr20_neckhead_pointed_ld02`
							flags = 36
							color = grey_2guitar
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr22_bridge_whammy1
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_sd06
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = gtr_misc_switch
			chosen_materials = {
				material1 = black_1guitar
			}
		}
	}
	{
		genre = [
			`black metal`
			rock
		]
		cas_guitar_body = {
			desc_id = gtr22_bc_rich_warlock
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr22_bc_rich_warlock_d`
					material = gtr22_bc_rich_warlock_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/bc_rich/gtr_bc_rich_warlock_ld6`
							flags = 4
						}
						{
							texture = `tex/models/characters/layers/cag/all_clear2`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_bcrich03
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d3_01`
					material = gtr_fretboard_03_primary
					diffuse
					pre_layer = [
						{
							color = grey_5
							texture = `tex/models/characters/layers/cag/bc_rich/22fret_ld04_bcr_diamonds`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr22_neckhead_warlock4
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr20_neckhead_warlock2_d`
					material = gtr22_neckhead_warlock4_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/bc_rich/gtr20_neckhead_warlock_ld04`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr_bc_rich_bridge_21
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_sd06b
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`black metal`
			`heavy metal`
		]
		cas_guitar_body = {
			desc_id = gtr22_bc_rich_warlock
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr22_bc_rich_warlock_d`
					material = gtr22_bc_rich_warlock_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/bc_rich/gtr_bc_rich_warlock_ld1`
							flags = 4
							color = black_1guitar
						}
					]
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon002`
							color = red_2
							y_trans = -25
							x_scale = 90
							y_scale = 72
							rot = 6253
							flags = 19
							x_trans = -29
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon002`
							color = red_2
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
		cas_guitar_neck = {
			desc_id = cag_22fret_bcrich01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d_01`
					material = gtr_fretboard_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/22_fret_ld01_hero_dots`
							flags = 4
							color = grey_5guitar
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr22_neckhead_beast3
			chosen_materials = {
				material1 = grey_2guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr20_neckhead_beast1_d`
					material = gtr22_neckhead_beast3_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/bc_rich/gtr20_neckhead_ld04`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr_bc_rich_bridge_21
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_sd06
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = gtr_misc_switch_blk_3
		}
	}
	{
		genre = [
			`black metal`
			`heavy metal`
		]
		cas_guitar_body = {
			desc_id = gtr22_bc_rich_warlock
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr22_bc_rich_warlock_d`
					material = gtr22_bc_rich_warlock_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/bc_rich/gtr_bc_rich_warlock_ld1`
							flags = 4
							color = black_1guitar
						}
					]
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon005`
							color = red_2
							y_trans = -23
							x_scale = 49
							y_scale = 62
							rot = 1993
							flags = 11
							x_trans = -20
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon005`
							color = red_2
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
		cas_guitar_neck = {
			desc_id = cag_22fret_bcrich04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
					material = gtr_fretboard_04_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/22_fret_ld01_hero_dots`
							flags = 4
							color = grey_5guitar
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr22_neckhead_beast3
			chosen_materials = {
				material1 = black_1guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr20_neckhead_beast1_d`
					material = gtr22_neckhead_beast3_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/bc_rich/gtr20_neckhead_ld02`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr22_bridge_whammy1
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_sd06
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`black metal`
			`heavy metal`
		]
		cas_guitar_body = {
			desc_id = gtr22_bc_rich_warlock
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr22_bc_rich_warlock_d`
					material = gtr22_bc_rich_warlock_primary
					diffuse
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons047`
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
							texture = `tex/models/characters/layers/cag/bc_rich/gtr_bc_rich_warlock_ld1`
							flags = 4
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/layers/cag/bc_rich/gtr_bc_rich_warlock_dtl2`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_bcrich04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
					material = gtr_fretboard_04_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/22_fret_ld01_hero_dots`
							flags = 4
							color = grey_5guitar
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr22_neckhead_beast3
			chosen_materials = {
				material1 = black_1guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr20_neckhead_beast1_d`
					material = gtr22_neckhead_beast3_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/bc_rich/gtr20_neckhead_ld02`
							flags = 36
						}
						{
							texture = `tex/models/characters/layers/cag/bc_rich/gtr20_neckhead_dtl02`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr22_bridge_whammy1
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_sd06
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			goth
		]
		cas_guitar_body = {
			desc_id = gtr22_bc_rich_warlock
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr22_bc_rich_warlock_d`
					material = gtr22_bc_rich_warlock_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/bc_rich/gtr_bc_rich_warlock_ld2`
							flags = 4
							color = purple_blue_1
						}
						{
							texture = `tex/models/characters/layers/cag/bc_rich/gtr_bc_rich_warlock_fd3`
							flags = 4
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_bcrich04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
					material = gtr_fretboard_04_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/22_fret_ld01_hero_dots`
							flags = 4
							color = grey_5guitar
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr22_neckhead_beast3
			chosen_materials = {
				material1 = grey_2guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr20_neckhead_beast1_d`
					material = gtr22_neckhead_beast3_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/bc_rich/gtr20_neckhead_ld02`
							flags = 36
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr22_bridge_whammy1
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr_emg_pickup2
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = gtr_misc_switch
			chosen_materials = {
				material1 = black_1guitar
			}
		}
	}
	{
		genre = [
			`glam rock`
			pop
		]
		cas_guitar_body = {
			desc_id = gtr90_dr_daisy
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/daisyrock/gtr90_dr_daisy_d`
					material = gtr90_dr_daisy_primary
					diffuse
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_001`
							color = blue_1
							x_trans = -44
							y_trans = 1
							y_scale = 24
							rot = 1603
							flags = 19
							x_scale = 33
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_001`
							color = green_2guitar
							y_trans = 1
							x_scale = 60
							y_scale = 24
							rot = 1603
							flags = 3
							x_trans = -43
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_001`
							color = green_2guitar
							x_trans = -33
							y_trans = 1
							y_scale = 24
							rot = 1603
							flags = 19
							x_scale = 60
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_001`
							color = orange_3
							y_trans = 1
							x_scale = 65
							y_scale = 24
							rot = 1603
							flags = 3
							x_trans = -31
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_001`
							color = orange_3
							x_trans = -21
							x_scale = 65
							y_scale = 24
							rot = 1603
							flags = 19
							y_trans = 1
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_001`
							color = red_2
							x_trans = -18
							x_scale = 62
							y_scale = 24
							rot = 1603
							flags = 3
							y_trans = 4
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_001`
							x_trans = -8
							y_trans = 1
							x_scale = 54
							y_scale = 24
							rot = 1603
							flags = 19
							color = red_2
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_001`
							color = violet_3
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
							texture = `tex/models/characters/layers/cag/daisyrock/gtr90_dr_daisy_ld02`
							flags = 4
							color = red_2
						}
						{
							texture = `tex/models/characters/layers/cag/daisyrock/gtr90_dr_daisy_dtl08b`
							flags = 4
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/layers/cag/daisyrock/gtr90_dr_daisy_dtl08a`
							flags = 4
							color = orange_3
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_daisy04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
					material = gtr_fretboard_04_primary
					diffuse
					pre_layer = [
						{
							color = grey_5
							texture = `tex/models/characters/layers/cag/gh5/22fret_ld122_dr_daisy`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr90_dr_neckhead01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/daisyrock/gtr90_neckhead01_d`
					material = gtr90_dr_neckhead01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/daisyrock/gtr90_neckhead01_ld02`
							flags = 36
							color = red_2
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = gtr90_pg
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/daisyrock/gtr90_pg_d`
					material = gtr90_pg_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/daisyrock/gtr90_pg_ld01`
							flags = 4
							color = green_3guitar
						}
					]
				}
			]
		}
		cas_guitar_bridges = {
			desc_id = gtr_bridge_mcswain_l_4b
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_03
			chosen_materials = {
				material1 = green_3guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr90_pickup3
			chosen_materials = {
				material1 = green_3guitar
			}
		}
		cas_guitar_misc = {
			desc_id = gtr_misc_switch4
			chosen_materials = {
				material1 = green_3guitar
			}
		}
	}
	{
		genre = [
			rock
			goth
			punk
		]
		cas_guitar_body = {
			desc_id = gtr94_dr_tomboy
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/daisyrock/gtr94_dr_tomboy_d`
					material = gtr94_dr_tomboy_primary
					diffuse
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics082`
							color = black_1guitar
							x_trans = 8
							x_scale = 19
							y_scale = 30
							rot = 1603
							flags = 3
							y_trans = 12
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics082`
							color = black_1guitar
							y_trans = 35
							x_scale = 19
							y_scale = 30
							rot = 1603
							flags = 3
							x_trans = 8
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics082`
							color = black_1guitar
							x_trans = -4
							x_scale = 19
							y_scale = 30
							rot = 1603
							flags = 3
							y_trans = 35
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics082`
							color = black_1guitar
							x_trans = -4
							x_scale = 19
							y_scale = 30
							rot = 1603
							flags = 3
							y_trans = 13
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics082`
							color = black_1guitar
							x_trans = -4
							x_scale = 19
							y_scale = 30
							rot = 1603
							flags = 3
							y_trans = -9
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics082`
							color = black_1guitar
							y_trans = -30
							x_scale = 19
							y_scale = 30
							rot = 1603
							flags = 3
							x_trans = -4
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics082`
							x_trans = -16
							y_trans = -30
							x_scale = 19
							y_scale = 30
							rot = 1603
							flags = 3
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics082`
							color = black_1guitar
							x_trans = -16
							x_scale = 19
							y_scale = 30
							rot = 1603
							flags = 3
							y_trans = -8
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics082`
							color = black_1guitar
							x_trans = -16
							x_scale = 19
							y_scale = 30
							rot = 1603
							flags = 3
							y_trans = 14
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics082`
							color = black_1guitar
							y_trans = 36
							x_scale = 19
							y_scale = 30
							rot = 1603
							flags = 3
							x_trans = -16
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics082`
							color = black_1guitar
							x_trans = -28
							x_scale = 19
							y_scale = 30
							rot = 1603
							flags = 3
							y_trans = 36
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics082`
							color = black_1guitar
							x_trans = -28
							x_scale = 19
							y_scale = 30
							rot = 1603
							flags = 3
							y_trans = 14
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics082`
							color = black_1guitar
							x_trans = -28
							x_scale = 19
							y_scale = 30
							rot = 1603
							flags = 3
							y_trans = -8
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics082`
							color = black_1guitar
							x_trans = -28
							x_scale = 19
							y_scale = 30
							rot = 1603
							flags = 3
							y_trans = -29
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics082`
							color = black_1guitar
							x_trans = -40
							x_scale = 19
							y_scale = 30
							rot = 1603
							flags = 3
							y_trans = -29
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics082`
							color = black_1guitar
							x_trans = -40
							x_scale = 19
							y_scale = 30
							rot = 1603
							flags = 3
							y_trans = 37
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics082`
							color = black_1guitar
							x_trans = -40
							y_trans = 15
							x_scale = 19
							y_scale = 30
							rot = 1603
							flags = 3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics082`
							color = black_1guitar
							x_trans = -40
							x_scale = 19
							y_scale = 30
							rot = 1603
							flags = 3
							y_trans = -7
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics082`
							color = black_1guitar
							x_trans = -28
							x_scale = 19
							y_scale = 30
							rot = 1603
							flags = 3
							y_trans = -53
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics082`
							color = black_1guitar
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
							texture = `tex/models/characters/layers/cag/daisyrock/gtr94_dr_tomboy_ld02`
							flags = 4
							color = grey_5guitar
						}
						{
							texture = `tex/models/characters/layers/cag/daisyrock/gtr94_dr_tomboy_dtl03`
							flags = 4
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/layers/cag/all_clear2`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_24fret_daisy04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
					material = gtr_fretboard24_04_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/24fret_ld124_dr_stardust`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr94_dr_neckhead01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/daisyrock/gtr93_neckhead01_d`
					material = gtr94_dr_neckhead01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/daisyrock/gtr93_neckhead01_ld02`
							flags = 36
							color = grey_5guitar
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr94_bridge
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_type2_paf1
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = gtr_misc_switch4
		}
	}
	{
		genre = [
			pop
		]
		cas_guitar_body = {
			desc_id = gtr90_dr_daisy
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/daisyrock/gtr90_dr_daisy_d`
					material = gtr90_dr_daisy_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/daisyrock/gtr90_dr_daisy_ld02`
							flags = 4
							color = yellow_3guitar
						}
						{
							texture = `tex/models/characters/layers/cag/daisyrock/gtr90_dr_daisy_dtl07`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_daisy02
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d2_01`
					material = gtr_fretboard_02_primary
					diffuse
					pre_layer = [
						{
							color = grey_2
							texture = `tex/models/characters/layers/cag/gh5/22fret_ld122_dr_daisy`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr90_dr_neckhead01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/daisyrock/gtr90_neckhead01_d`
					material = gtr90_dr_neckhead01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/daisyrock/gtr90_neckhead01_ld02`
							flags = 36
							color = yellow_3guitar
						}
						{
							texture = `tex/models/characters/layers/cag/all_clear2`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = gtr90_pg
		}
		cas_guitar_bridges = {
			desc_id = gtr_bridge_mcswain_l_4b
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01c
		}
		cas_guitar_pickups = {
			desc_id = gtr90_pickup1
		}
		cas_guitar_misc = {
			desc_id = gtr_misc_switch4
		}
	}
	{
		genre = [
			pop
		]
		cas_guitar_body = {
			desc_id = gtr90_dr_daisy
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/daisyrock/gtr90_dr_daisy_d`
					material = gtr90_dr_daisy_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/daisyrock/gtr90_dr_daisy_ld02`
							flags = 4
							color = navy_2
						}
						{
							texture = `tex/models/characters/layers/cag/daisyrock/gtr90_dr_daisy_dtl07`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_daisy02
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d2_01`
					material = gtr_fretboard_02_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/22fret_ld123_dr_butterfly`
							flags = 36
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr90_dr_neckhead01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/daisyrock/gtr90_neckhead01_d`
					material = gtr90_dr_neckhead01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/daisyrock/gtr90_neckhead01_ld02`
							flags = 36
							color = navy_2
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = gtr90_pg
		}
		cas_guitar_bridges = {
			desc_id = gtr_bridge_mcswain_l_4b
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01c
		}
		cas_guitar_pickups = {
			desc_id = gtr90_pickup1
		}
		cas_guitar_misc = {
			desc_id = gtr_misc_switch4
		}
	}
	{
		genre = [
			pop
		]
		cas_guitar_body = {
			desc_id = gtr91_dr_heart
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/daisyrock/gtr91_dr_heart_d`
					material = gtr91_dr_heart_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/daisyrock/gtr91_dr_heart_ld02`
							flags = 4
							color = red_3
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_daisy01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d_01`
					material = gtr_fretboard_01_primary
					diffuse
					pre_layer = [
						{
							color = grey_5
							texture = `tex/models/characters/layers/cag/gh5/22fret_ld121_dr_ovals`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr91_dr_neckhead01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/daisyrock/gtr90_neckhead01_d`
					material = gtr91_dr_neckhead01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/daisyrock/gtr90_neckhead01_ld02`
							flags = 36
							color = red_3
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = gtr91_pg
		}
		cas_guitar_bridges = {
			desc_id = gtr_bridge_mcswain_l_4b
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01c
		}
		cas_guitar_pickups = {
			desc_id = gtr90_pickup1
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			pop
		]
		cas_guitar_body = {
			desc_id = gtr91_dr_heart
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/daisyrock/gtr91_dr_heart_d`
					material = gtr91_dr_heart_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/daisyrock/gtr91_dr_heart_ld02`
							flags = 4
							color = purple_blue_2
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_daisy01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d_01`
					material = gtr_fretboard_01_primary
					diffuse
					pre_layer = [
						{
							color = grey_5
							texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr91_dr_neckhead01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/daisyrock/gtr90_neckhead01_d`
					material = gtr91_dr_neckhead01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/daisyrock/gtr90_neckhead01_ld02`
							flags = 36
							color = purple_blue_2
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = gtr91_pg
		}
		cas_guitar_bridges = {
			desc_id = gtr_bridge_mcswain_l_4b
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01
		}
		cas_guitar_pickups = {
			desc_id = gtr90_pickup3
		}
		cas_guitar_misc = {
			desc_id = gtr_misc_switch4
		}
	}
	{
		genre = [
			pop
			`glam rock`
		]
		cas_guitar_body = {
			desc_id = gtr93_dr_siren
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/daisyrock/gtr93_dr_siren_d`
					material = gtr93_dr_siren_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/daisyrock/gtr93_dr_siren_ld08`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_daisy01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d_01`
					material = gtr_fretboard_01_primary
					diffuse
					pre_layer = [
						{
							color = grey_5
							texture = `tex/models/characters/layers/cag/gh5/22fret_ld121_dr_ovals`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr93_dr_neckhead01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/daisyrock/gtr93_neckhead01_d`
					material = gtr93_dr_neckhead01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/daisyrock/gtr93_neckhead01_ld06`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr_bridge_01d
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_type2_paf1
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = gtr_misc_switch4
		}
	}
	{
		genre = [
			pop
			`glam rock`
		]
		cas_guitar_body = {
			desc_id = gtr93_dr_siren
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/daisyrock/gtr93_dr_siren_d`
					material = gtr93_dr_siren_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/daisyrock/gtr93_dr_siren_ld07`
							flags = 4
							color = violet_3
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_daisy01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d_01`
					material = gtr_fretboard_01_primary
					diffuse
					pre_layer = [
						{
							color = grey_5
							texture = `tex/models/characters/layers/cag/gh5/22fret_ld121_dr_ovals`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr93_dr_neckhead01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/daisyrock/gtr93_neckhead01_d`
					material = gtr93_dr_neckhead01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/daisyrock/gtr93_neckhead01_ld05`
							flags = 36
							color = violet_3
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr_bridge_01d
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_type2_paf1
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = gtr_misc_switch4
		}
	}
	{
		genre = [
			pop
			`glam rock`
		]
		cas_guitar_body = {
			desc_id = gtr94_dr_tomboy
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/daisyrock/gtr94_dr_tomboy_d`
					material = gtr94_dr_tomboy_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/daisyrock/gtr94_dr_tomboy_ld06`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_daisy01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d_01`
					material = gtr_fretboard_01_primary
					diffuse
					pre_layer = [
						{
							color = grey_5
							texture = `tex/models/characters/layers/cag/gh5/22fret_ld124_dr_stardust`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr94_dr_neckhead01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/daisyrock/gtr93_neckhead01_d`
					material = gtr94_dr_neckhead01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/daisyrock/gtr93_neckhead01_ld07`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = gtr94_pg
		}
		cas_guitar_bridges = {
			desc_id = gtr94_bridge
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01
		}
		cas_guitar_pickups = {
			desc_id = gtr94_pickup
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = gtr_misc_switch4
		}
	}
	{
		genre = [
			pop
			`glam rock`
		]
		cas_guitar_body = {
			desc_id = gtr94_dr_tomboy
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/daisyrock/gtr94_dr_tomboy_d`
					material = gtr94_dr_tomboy_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/daisyrock/gtr94_dr_tomboy_ld07`
							flags = 4
							color = red_3
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_daisy01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d_01`
					material = gtr_fretboard_01_primary
					diffuse
					pre_layer = [
						{
							color = grey_5
							texture = `tex/models/characters/layers/cag/gh5/22fret_ld124_dr_stardust`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr94_dr_neckhead01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/daisyrock/gtr93_neckhead01_d`
					material = gtr94_dr_neckhead01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/daisyrock/gtr93_neckhead01_ld08`
							flags = 36
							color = red_3
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = gtr94_pg
		}
		cas_guitar_bridges = {
			desc_id = gtr94_bridge
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01
		}
		cas_guitar_pickups = {
			desc_id = gtr94_pickup
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = gtr_misc_switch4
		}
	}
	{
		genre = [
			`heavy metal`
		]
		cas_guitar_body = {
			desc_id = gtr77_ibz_rg
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/ibanez/gtr77_ibz_rg_d`
					material = gtr77_ibz_rg_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/ibanez/gtr77_ibz_rg_ld02`
							flags = 4
						}
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr77_ibz_rg_dtl02`
							flags = 4
						}
					]
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons046`
							color = grey_3guitar
							x_trans = -2
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							y_trans = -33
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons046`
							color = grey_3guitar
							y_trans = -26
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = -2
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons046`
							color = grey_3guitar
							y_trans = -26
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = -6
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons046`
							color = grey_3guitar
							y_trans = -26
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = -10
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons046`
							color = grey_3guitar
							x_trans = -14
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							y_trans = -26
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons046`
							color = grey_3guitar
							y_trans = -19
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = -14
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons046`
							color = grey_3guitar
							y_trans = -19
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = -10
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons046`
							color = grey_3guitar
							y_trans = -19
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = -6
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons046`
							color = grey_3guitar
							y_trans = -19
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = -2
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons046`
							color = grey_3guitar
							y_trans = -13
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = -6
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons046`
							color = grey_3guitar
							y_trans = -13
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = -10
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons046`
							color = grey_3guitar
							x_trans = -14
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							y_trans = -13
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons046`
							color = grey_3guitar
							x_trans = -14
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							y_trans = 18
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons046`
							color = grey_3guitar
							y_trans = 12
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = -14
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons046`
							color = grey_3guitar
							y_trans = 12
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = -2
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons046`
							color = grey_3guitar
							y_trans = 12
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = -6
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons046`
							color = grey_3guitar
							x_trans = -10
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							y_trans = 12
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons046`
							color = grey_3guitar
							y_trans = 18
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = -10
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons046`
							color = grey_3guitar
							y_trans = 18
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = -6
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons046`
							color = grey_3guitar
							y_trans = 18
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = -2
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons046`
							color = grey_3guitar
							x_trans = 2
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							y_trans = 18
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons046`
							color = grey_3guitar
							y_trans = 24
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = 2
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons046`
							color = grey_3guitar
							y_trans = 24
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = -2
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons046`
							color = grey_3guitar
							y_trans = 24
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = -6
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons046`
							color = grey_3guitar
							x_trans = -10
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							y_trans = 24
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons046`
							color = grey_3guitar
							y_trans = 30
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = -10
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons046`
							color = grey_3guitar
							y_trans = 30
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = -6
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons046`
							color = grey_3guitar
							y_trans = 30
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = -2
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons046`
							color = grey_3guitar
							y_trans = 30
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = 2
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons046`
							color = grey_3guitar
							y_trans = 33
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = 4
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons046`
							color = grey_3guitar
							y_trans = 33
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = 8
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons046`
							color = grey_3guitar
							y_trans = 33
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = 12
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons046`
							color = grey_3guitar
							y_trans = 39
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = 4
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons046`
							color = grey_3guitar
							y_trans = 39
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							x_trans = 8
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons046`
							color = grey_3guitar
							x_trans = 12
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							y_trans = 39
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons046`
							color = grey_3guitar
							x_trans = 15
							x_scale = 4
							y_scale = 9
							rot = 1603
							flags = 259
							y_trans = 35
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon005`
							color = grey_5guitar
							x_trans = -13
							y_trans = 8
							x_scale = 48
							y_scale = 79
							rot = 4363
							flags = 259
							a = 50
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon005`
							color = grey_5guitar
							x_trans = 3
							y_trans = 34
							x_scale = 48
							y_scale = 79
							rot = 4363
							flags = 259
							a = 55
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon006`
							x_trans = -23
							y_trans = -14
							x_scale = 83
							y_scale = 44
							rot = 43
							flags = 259
							a = 55
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon003`
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
		cas_guitar_neck = {
			desc_id = cag_24fret_ibanez04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
					material = gtr_fretboard24_04_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/24fret_ld01_hero_dots`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr77_neckhead_01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/ibanez/gtr75_neckhead_d`
					material = gtr77_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/ibanez/gtr75_neckhead_ld02`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr75_bridge2
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01
		}
		cas_guitar_pickups = {
			desc_id = gtr76_pickupb
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			pop
			punk
			rock
		]
		cas_guitar_body = {
			desc_id = gtr76_ibz_s5470
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/ibanez/gtr76_ibz_s5470_d`
					material = gtr76_ibz_s5470_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/ibanez/gtr76_ibz_s5470_ld05`
							flags = 4
						}
					]
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = red_4
							a = 40
							y_trans = -46
							x_scale = 1
							y_scale = 96
							rot = 2233
							flags = 259
							x_trans = -33
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = red_4
							a = 40
							x_trans = -28
							y_trans = -34
							x_scale = 2
							rot = 2233
							flags = 259
							y_scale = 103
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 40
							x_trans = -30
							y_trans = -3
							x_scale = 2
							y_scale = 97
							rot = 2233
							flags = 259
							color = red_4
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = red_4
							a = 40
							x_trans = -16
							y_trans = 28
							y_scale = 97
							rot = 2233
							flags = 259
							x_scale = 2
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = red_4
							a = 40
							x_trans = -18
							x_scale = 1
							y_scale = 97
							rot = 2233
							flags = 259
							y_trans = 19
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = red_4
							a = 40
							x_trans = 8
							y_trans = 36
							y_scale = 30
							rot = 2233
							flags = 259
							x_scale = 1
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = red_4
							a = 40
							x_trans = 0
							y_trans = 31
							x_scale = 3
							rot = 2233
							flags = 259
							y_scale = 31
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 40
							x_trans = -24
							y_trans = 0
							x_scale = 1
							y_scale = 97
							rot = 2233
							flags = 259
							color = red_4
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = red_4
							a = 40
							x_trans = -18
							y_trans = 3
							y_scale = 100
							rot = 2233
							flags = 259
							x_scale = 6
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 25
							x_trans = -41
							y_trans = 37
							y_scale = 1
							rot = 2443
							flags = 259
							x_scale = 46
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 25
							x_trans = 5
							y_trans = -31
							x_scale = 22
							rot = 2443
							flags = 259
							y_scale = 1
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 25
							x_trans = 0
							y_trans = -26
							x_scale = 23
							y_scale = 3
							rot = 2443
							flags = 259
							color = grey_4guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 25
							x_trans = -37
							y_trans = 28
							y_scale = 3
							rot = 2443
							flags = 259
							x_scale = 65
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 25
							x_trans = -26
							x_scale = 97
							y_scale = 3
							rot = 2443
							flags = 259
							y_trans = 12
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 25
							y_trans = -4
							x_scale = 97
							y_scale = 3
							rot = 2443
							flags = 259
							x_trans = -6
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 25
							y_trans = -7
							x_scale = 97
							y_scale = 1
							rot = 2443
							flags = 259
							x_trans = -13
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 25
							x_trans = -24
							y_trans = 0
							x_scale = 97
							rot = 2443
							flags = 259
							y_scale = 1
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
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
		cas_guitar_neck = {
			desc_id = cag_24fret_ibanez04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
					material = gtr_fretboard24_04_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/24fret_ld01_hero_dots`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr76_neckhead_01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/ibanez/gtr76_neckhead_d`
					material = gtr76_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/ibanez/gtr76_neckhead_ld02`
							flags = 36
						}
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/ibanez/gtr76_neckhead_ld03`
							flags = 36
						}
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr76_neckhead_dtl01`
							flags = 36
						}
					]
				}
			]
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr77_bridge
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_04
		}
		cas_guitar_pickups = {
			desc_id = gtr_emg_pickup4
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = gtr76_switch
		}
	}
	{
		genre = [
			pop
			punk
			rock
		]
		cas_guitar_body = {
			desc_id = gtr76_ibz_s5470
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/ibanez/gtr76_ibz_s5470_d`
					material = gtr76_ibz_s5470_primary
					diffuse
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = red_4
							a = 40
							y_trans = -46
							x_scale = 1
							y_scale = 96
							rot = 2233
							flags = 259
							x_trans = -33
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = red_4
							a = 40
							x_trans = -28
							y_trans = -34
							x_scale = 2
							rot = 2233
							flags = 259
							y_scale = 103
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 40
							x_trans = -30
							y_trans = -3
							x_scale = 2
							y_scale = 97
							rot = 2233
							flags = 259
							color = red_4
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = red_4
							a = 40
							x_trans = -16
							y_trans = 28
							y_scale = 97
							rot = 2233
							flags = 259
							x_scale = 2
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = red_4
							a = 40
							x_trans = -18
							x_scale = 1
							y_scale = 97
							rot = 2233
							flags = 259
							y_trans = 19
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = red_4
							a = 40
							x_trans = 8
							y_trans = 36
							y_scale = 30
							rot = 2233
							flags = 259
							x_scale = 1
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = red_4
							a = 40
							x_trans = 0
							y_trans = 31
							x_scale = 3
							rot = 2233
							flags = 259
							y_scale = 31
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 40
							x_trans = -24
							y_trans = 0
							x_scale = 1
							y_scale = 97
							rot = 2233
							flags = 259
							color = red_4
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = red_4
							a = 40
							x_trans = -18
							y_trans = 3
							y_scale = 100
							rot = 2233
							flags = 259
							x_scale = 6
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 25
							x_trans = -41
							y_trans = 37
							y_scale = 1
							rot = 2443
							flags = 259
							x_scale = 46
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 25
							x_trans = 5
							y_trans = -31
							x_scale = 22
							rot = 2443
							flags = 259
							y_scale = 1
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 25
							x_trans = 0
							y_trans = -26
							x_scale = 23
							y_scale = 3
							rot = 2443
							flags = 259
							color = grey_4guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 25
							x_trans = -37
							y_trans = 28
							y_scale = 3
							rot = 2443
							flags = 259
							x_scale = 65
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 25
							x_trans = -26
							x_scale = 97
							y_scale = 3
							rot = 2443
							flags = 259
							y_trans = 12
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 25
							y_trans = -4
							x_scale = 97
							y_scale = 3
							rot = 2443
							flags = 259
							x_trans = -6
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 25
							y_trans = -7
							x_scale = 97
							y_scale = 1
							rot = 2443
							flags = 259
							x_trans = -13
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 25
							x_trans = -24
							y_trans = 0
							x_scale = 97
							rot = 2443
							flags = 259
							y_scale = 1
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
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
							texture = `tex/models/characters/layers/cag/ibanez/gtr76_ibz_s5470_ld05`
							flags = 4
							color = teal_1
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_24fret_ibanez04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
					material = gtr_fretboard24_04_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/24fret_ld01_hero_dots`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr76_neckhead_01
			chosen_materials = {
				material1 = grey_2guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/ibanez/gtr76_neckhead_d`
					material = gtr76_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr76_neckhead_ld02`
							flags = 36
							color = teal_1
						}
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/ibanez/gtr76_neckhead_ld03`
							flags = 36
						}
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr76_neckhead_dtl01`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr77_bridge
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_04
		}
		cas_guitar_pickups = {
			desc_id = gtr_emg_pickup4
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = gtr76_switch
		}
	}
	{
		genre = [
			pop
			`glam rock`
		]
		cas_guitar_body = {
			desc_id = gtr77_ibz_rg
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/ibanez/gtr77_ibz_rg_d`
					material = gtr77_ibz_rg_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr77_ibz_rg_ld02`
							flags = 4
							color = navy_1
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_24fret_ibanez02
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d2_02`
					material = gtr_fretboard24_02_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/24fret_ld68_ibz_sharktooth`
							flags = 36
							color = navy_1
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr77_neckhead_01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/ibanez/gtr75_neckhead_d`
					material = gtr77_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr75_neckhead_ld03`
							flags = 36
							color = navy_1
						}
					]
				}
			]
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_pickguards = {
			desc_id = gtr77_ibz_rg_pg
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/ibanez/gtr77_ibz_rg_pg_d`
					material = gtr77_ibz_rg_pg_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr77_ibz_rg_pg_ld01`
							flags = 4
							color = navy_1
						}
					]
				}
			]
		}
		cas_guitar_bridges = {
			desc_id = gtr75_bridge2
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_10
			chosen_materials = {
				material1 = navy_1
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr76_pickupb
			chosen_materials = {
				material1 = navy_1
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			pop
			`glam rock`
		]
		cas_guitar_body = {
			desc_id = gtr77_ibz_rg
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/ibanez/gtr77_ibz_rg_d`
					material = gtr77_ibz_rg_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr77_ibz_rg_ld02`
							flags = 4
							color = red_1
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_24fret_ibanez02
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d2_02`
					material = gtr_fretboard24_02_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/24fret_ld68_ibz_sharktooth`
							flags = 36
							color = red_1
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr77_neckhead_01
			chosen_materials = {
				material1 = grey_2guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/ibanez/gtr75_neckhead_d`
					material = gtr77_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr75_neckhead_ld03`
							flags = 36
							color = red_1
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = gtr77_ibz_rg_pg
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/ibanez/gtr77_ibz_rg_pg_d`
					material = gtr77_ibz_rg_pg_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr77_ibz_rg_pg_ld01`
							flags = 4
							color = red_1
						}
					]
				}
			]
		}
		cas_guitar_bridges = {
			desc_id = gtr75_bridge2
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_10
			chosen_materials = {
				material1 = red_1
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr76_pickupb
			chosen_materials = {
				material1 = red_1
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			pop
			rock
		]
		cas_guitar_body = {
			desc_id = gtr77_ibz_rg
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/ibanez/gtr77_ibz_rg_d`
					material = gtr77_ibz_rg_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr77_ibz_rg_ld02`
							flags = 4
							color = orange_2
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_24fret_ibanez02
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d2_02`
					material = gtr_fretboard24_02_primary
					diffuse
					pre_layer = [
						{
							color = grey_2
							texture = `tex/models/characters/layers/cag/gh5/24fret_ld01_hero_dots`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr77_neckhead_01
			chosen_materials = {
				material1 = grey_2guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/ibanez/gtr75_neckhead_d`
					material = gtr77_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr75_neckhead_ld03`
							flags = 36
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = gtr77_ibz_rg_pg
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/ibanez/gtr77_ibz_rg_pg_d`
					material = gtr77_ibz_rg_pg_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr77_ibz_rg_pg_ld01`
							flags = 4
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_bridges = {
			desc_id = gtr75_bridge2
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr76_pickupb
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			pop
			rock
		]
		cas_guitar_body = {
			desc_id = gtr77_ibz_rg
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/ibanez/gtr77_ibz_rg_d`
					material = gtr77_ibz_rg_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr77_ibz_rg_ld02`
							flags = 4
							color = navy_1
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_24fret_ibanez02
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d2_02`
					material = gtr_fretboard24_02_primary
					diffuse
					pre_layer = [
						{
							color = grey_2
							texture = `tex/models/characters/layers/cag/gh5/24fret_ld01_hero_dots`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr77_neckhead_01
			chosen_materials = {
				material1 = grey_2guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/ibanez/gtr75_neckhead_d`
					material = gtr77_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr75_neckhead_ld03`
							flags = 36
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = gtr77_ibz_rg_pg
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/ibanez/gtr77_ibz_rg_pg_d`
					material = gtr77_ibz_rg_pg_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr77_ibz_rg_pg_ld01`
							flags = 4
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_bridges = {
			desc_id = gtr75_bridge2
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr76_pickupb
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			rock
			goth
		]
		cas_guitar_body = {
			desc_id = gtr77_ibz_rg
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/ibanez/gtr77_ibz_rg_d`
					material = gtr77_ibz_rg_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr77_ibz_rg_ld02`
							flags = 4
							color = grey_3guitar
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_24fret_ibanez02
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d2_02`
					material = gtr_fretboard24_02_primary
					diffuse
					pre_layer = [
						{
							color = grey_2
							texture = `tex/models/characters/layers/cag/gh5/24fret_ld69_ibz_sharktooth2`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr77_neckhead_01
			chosen_materials = {
				material1 = grey_2guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/ibanez/gtr75_neckhead_d`
					material = gtr77_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr75_neckhead_ld03`
							flags = 36
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = gtr77_ibz_rg_pg
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/ibanez/gtr77_ibz_rg_pg_d`
					material = gtr77_ibz_rg_pg_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr77_ibz_rg_pg_ld01`
							flags = 4
							color = grey_2guitar
						}
					]
				}
			]
		}
		cas_guitar_bridges = {
			desc_id = gtr75_bridge2
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01
			chosen_materials = {
				material1 = grey_3guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr76_pickupb
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			rock
			goth
		]
		cas_guitar_body = {
			desc_id = gtr77_ibz_rg
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/ibanez/gtr77_ibz_rg_d`
					material = gtr77_ibz_rg_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr77_ibz_rg_ld03`
							flags = 4
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_24fret_ibanez04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
					material = gtr_fretboard24_04_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/24fret_ld01_hero_dots`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr77_neckhead_01
			chosen_materials = {
				material1 = grey_2guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/ibanez/gtr75_neckhead_d`
					material = gtr77_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr75_neckhead_ld03`
							flags = 36
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr75_bridge2
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_sd06
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			rock
			`heavy metal`
			punk
		]
		cas_guitar_body = {
			desc_id = gtr77_ibz_rg
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/ibanez/gtr77_ibz_rg_d`
					material = gtr77_ibz_rg_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/ibanez/gtr77_ibz_rg_ld02`
							flags = 4
						}
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr77_ibz_rg_dtl8b`
							flags = 4
							color = grey_2guitar
						}
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr77_ibz_rg_dtl8a`
							flags = 4
							color = grey_5guitar
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_24fret_ibanez04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
					material = gtr_fretboard24_04_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/24fret_ld68_ibz_sharktooth`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr77_neckhead_01
			chosen_materials = {
				material1 = grey_2guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/ibanez/gtr75_neckhead_d`
					material = gtr77_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr75_neckhead_ld03`
							flags = 36
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr75_bridge2
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr76_pickupb
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			rock
			`heavy metal`
			punk
		]
		cas_guitar_body = {
			desc_id = gtr77_ibz_rg
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/ibanez/gtr77_ibz_rg_d`
					material = gtr77_ibz_rg_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/ibanez/gtr77_ibz_rg_ld02`
							flags = 4
						}
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr77_ibz_rg_dtl8b`
							flags = 4
							color = green_1guitar
						}
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr77_ibz_rg_dtl8a`
							flags = 4
							color = yellow_green_2guitar
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_24fret_ibanez02
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d2_02`
					material = gtr_fretboard24_02_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/24fret_ld68_ibz_sharktooth`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr77_neckhead_01
			chosen_materials = {
				material1 = grey_2guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/ibanez/gtr75_neckhead_d`
					material = gtr77_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr75_neckhead_ld03`
							flags = 36
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr75_bridge2
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr76_pickupb
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`classic rock`
		]
		cas_guitar_body = {
			desc_id = gtr77_ibz_rg
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/ibanez/gtr77_ibz_rg_d`
					material = gtr77_ibz_rg_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr77_ibz_rg_ld08`
							flags = 4
						}
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr77_ibz_rg_dtl03`
							flags = 4
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_24fret_ibanez02
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d2_02`
					material = gtr_fretboard24_02_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/24fret_ld68_ibz_sharktooth`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr77_neckhead_01
			chosen_materials = {
				material1 = grey_2guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/ibanez/gtr75_neckhead_d`
					material = gtr77_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/ibanez/gtr75_neckhead_ld03`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr75_bridge2
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_sd06
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			goth
			pop
		]
		cas_guitar_body = {
			desc_id = gtr77_ibz_rg
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/ibanez/gtr77_ibz_rg_d`
					material = gtr77_ibz_rg_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr77_ibz_rg_ld02`
							flags = 4
							color = grey_5guitar
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_24fret_ibanez02
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d2_02`
					material = gtr_fretboard24_02_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/24fret_ld68_ibz_sharktooth`
							flags = 36
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr77_neckhead_01
			chosen_materials = {
				material1 = grey_3guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/ibanez/gtr75_neckhead_d`
					material = gtr77_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr75_neckhead_ld02`
							flags = 36
							color = grey_5guitar
						}
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr75_neckhead_dtl01`
							flags = 36
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr75_bridge2
			chosen_materials = {
				material1 = grey_3guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01
			chosen_materials = {
				material1 = grey_3guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_sd05b
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`classic rock`
			punk
			rock
		]
		cas_guitar_body = {
			desc_id = gtr77_ibz_rg
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/ibanez/gtr77_ibz_rg_d`
					material = gtr77_ibz_rg_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr77_ibz_rg_ld03`
							flags = 4
							color = red_1
						}
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr77_ibz_rg_dtl03`
							flags = 4
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_24fret_ibanez04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
					material = gtr_fretboard24_04_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/24fret_ld01_hero_dots`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr77_neckhead_01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/ibanez/gtr75_neckhead_d`
					material = gtr77_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr75_neckhead_ld04`
							flags = 36
							color = red_1
						}
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr75_neckhead_dtl03`
							flags = 36
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr75_neckhead_dtl01`
							flags = 36
							color = black_1guitar
						}
					]
				}
			]
			chosen_materials = {
				material1 = grey_4guitar
			}
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr77_bridge
			chosen_materials = {
				material1 = grey_4guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01
			chosen_materials = {
				material1 = grey_3guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_sd05b
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			pop
			`glam rock`
		]
		cas_guitar_body = {
			desc_id = gtr77_ibz_rg
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/ibanez/gtr77_ibz_rg_d`
					material = gtr77_ibz_rg_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr77_ibz_rg_ld04`
							a = 75
							flags = 4
							color = teal_1
						}
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr77_ibz_rg_dtl03`
							flags = 4
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_24fret_ibanez04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
					material = gtr_fretboard24_04_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/24fret_ld67_ibz_soval`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr77_neckhead_01
			chosen_materials = {
				material1 = grey_4guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/ibanez/gtr75_neckhead_d`
					material = gtr77_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr75_neckhead_ld01`
							a = 85
							flags = 36
							color = teal_1
						}
						{
							texture = `tex/models/characters/layers/cag/all_clear2`
							flags = 4
						}
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr75_neckhead_dtl02`
							flags = 36
						}
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr75_neckhead_dtl01`
							flags = 36
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr77_bridge
			chosen_materials = {
				material1 = grey_4guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01
			chosen_materials = {
				material1 = grey_3guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_sd05b
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`classic rock`
			rock
		]
		cas_guitar_body = {
			desc_id = gtr76_ibz_s5470
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/ibanez/gtr76_ibz_s5470_d`
					material = gtr76_ibz_s5470_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr76_ibz_s5470_ld03`
							flags = 4
							color = red_1
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_24fret_ibanez04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
					material = gtr_fretboard24_04_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/24fret_ld01_hero_dots`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr76_neckhead_01
			chosen_materials = {
				material1 = grey_2guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/ibanez/gtr76_neckhead_d`
					material = gtr76_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr76_neckhead_ld04`
							flags = 36
							color = red_2
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr75_bridge2
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr76_pickupa
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = gtr76_switch
		}
	}
	{
		genre = [
			`classic rock`
			rock
			punk
		]
		cas_guitar_body = {
			desc_id = gtr76_ibz_s5470
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/ibanez/gtr76_ibz_s5470_d`
					material = gtr76_ibz_s5470_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr76_ibz_s5470_ld06`
							flags = 4
							color = grey_4guitar
						}
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr76_ibz_s5470_dtl01`
							flags = 4
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_24fret_ibanez04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
					material = gtr_fretboard24_04_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/24fret_ld67_ibz_soval`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr76_neckhead_01
			chosen_materials = {
				material1 = grey_2guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/ibanez/gtr76_neckhead_d`
					material = gtr76_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr76_neckhead_ld01`
							flags = 36
						}
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/ibanez/gtr76_neckhead_ld03`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr75_bridge2
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr76_pickupa
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = gtr76_switch
		}
	}
	{
		genre = [
			`glam rock`
			rock
			pop
		]
		cas_guitar_body = {
			desc_id = gtr76_ibz_s5470
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/ibanez/gtr76_ibz_s5470_d`
					material = gtr76_ibz_s5470_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr76_ibz_s5470_ld02`
							flags = 4
							color = blue_3
						}
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr76_ibz_s5470_dtl03`
							color = navy_1
							flags = 4
							a = 85
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_24fret_ibanez01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d1_02`
					material = gtr_fretboard24_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/24fret_ld01_hero_dots`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr76_neckhead_01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/ibanez/gtr76_neckhead_d`
					material = gtr76_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr76_neckhead_ld01`
							flags = 36
							color = blue_1
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr75_bridge2
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01
		}
		cas_guitar_pickups = {
			desc_id = gtr76_pickupa
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = gtr76_switch
		}
	}
	{
		genre = [
			`glam rock`
			`classic rock`
			pop
		]
		cas_guitar_body = {
			desc_id = gtr76_ibz_s5470
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/ibanez/gtr76_ibz_s5470_d`
					material = gtr76_ibz_s5470_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr76_ibz_s5470_ld02`
							flags = 4
							color = red_orange_4
						}
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr76_ibz_s5470_dtl03`
							a = 85
							flags = 4
							color = red_1
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_24fret_ibanez04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
					material = gtr_fretboard24_04_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/24fret_ld01_hero_dots`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr76_neckhead_01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/ibanez/gtr76_neckhead_d`
					material = gtr76_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr76_neckhead_ld01`
							flags = 36
							color = red_orange_2
						}
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr76_neckhead_dtl01`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr75_bridge2
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01
		}
		cas_guitar_pickups = {
			desc_id = gtr76_pickupa
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = gtr76_switch
		}
	}
	{
		genre = [
			`heavy metal`
			punk
			goth
		]
		cas_guitar_body = {
			desc_id = gtr76_ibz_s5470
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/ibanez/gtr76_ibz_s5470_d`
					material = gtr76_ibz_s5470_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/ibanez/gtr76_ibz_s5470_ld05`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_24fret_ibanez01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d1_02`
					material = gtr_fretboard24_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/24fret_ld60_ibz_sspecial`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr76_neckhead_01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/ibanez/gtr76_neckhead_d`
					material = gtr76_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/ibanez/gtr76_neckhead_ld02`
							flags = 36
						}
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/ibanez/gtr76_neckhead_ld03`
							flags = 36
						}
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr76_neckhead_dtl01`
							flags = 36
						}
					]
				}
			]
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr75_bridge2
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr_emg_pickup2
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = gtr76_switch
		}
	}
	{
		genre = [
			pop
			rock
		]
		cas_guitar_body = {
			desc_id = gtr76_ibz_s5470
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/ibanez/gtr76_ibz_s5470_d`
					material = gtr76_ibz_s5470_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr76_ibz_s5470_ld05`
							flags = 4
							color = grey_5guitar
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_24fret_ibanez04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
					material = gtr_fretboard24_04_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/24fret_ld01_hero_dots`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr76_neckhead_01
			chosen_materials = {
				material1 = grey_4guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/ibanez/gtr76_neckhead_d`
					material = gtr76_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr76_neckhead_ld01`
							flags = 36
						}
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/ibanez/gtr76_neckhead_ld03`
							flags = 36
						}
						{
							texture = `tex/models/characters/layers/cag/all_clear2`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr75_bridge2
			chosen_materials = {
				material1 = grey_4guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01
			chosen_materials = {
				material1 = grey_4guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr_emg_pickup2
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = gtr76_switch
		}
	}
	{
		genre = [
			`classic rock`
		]
		cas_guitar_body = {
			desc_id = gtr76_ibz_s5470
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/ibanez/gtr76_ibz_s5470_d`
					material = gtr76_ibz_s5470_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr76_ibz_s5470_ld03`
							flags = 4
							color = yellow_orange_1
						}
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr76_ibz_s5470_dtl03`
							flags = 4
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr76_ibz_s5470_dtl02`
							color = grey_4guitar
							flags = 4
							a = 50
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_24fret_ibanez02
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d2_02`
					material = gtr_fretboard24_02_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/24fret_ld61_ibz_sasspecial`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr76_neckhead_01
			chosen_materials = {
				material1 = grey_4guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/ibanez/gtr76_neckhead_d`
					material = gtr76_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr76_neckhead_ld04`
							flags = 36
						}
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/ibanez/gtr76_neckhead_ld03`
							flags = 36
						}
						{
							texture = `tex/models/characters/layers/cag/all_clear2`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr75_bridge2
			chosen_materials = {
				material1 = grey_4guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01
			chosen_materials = {
				material1 = grey_4guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr_emg_pickup2
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = gtr76_switch
		}
	}
	{
		genre = [
			`classic rock`
			rock
		]
		cas_guitar_body = {
			desc_id = gtr76_ibz_s5470
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/ibanez/gtr76_ibz_s5470_d`
					material = gtr76_ibz_s5470_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr76_ibz_s5470_ld03`
							flags = 4
							color = red_1
						}
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr76_ibz_s5470_dtl03`
							flags = 4
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr76_ibz_s5470_dtl02`
							color = grey_4guitar
							flags = 4
							a = 50
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_24fret_ibanez02
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d2_02`
					material = gtr_fretboard24_02_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/24fret_ld01_hero_dots`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr76_neckhead_01
			chosen_materials = {
				material1 = grey_4guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/ibanez/gtr76_neckhead_d`
					material = gtr76_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr76_neckhead_ld01`
							flags = 36
							color = red_1
						}
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr76_neckhead_dtl03`
							flags = 36
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr76_neckhead_dtl01`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr75_bridge2
			chosen_materials = {
				material1 = grey_4guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01
			chosen_materials = {
				material1 = grey_4guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr_emg_pickup2
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = gtr76_switch
		}
	}
	{
		genre = [
			`classic rock`
			rock
		]
		cas_guitar_body = {
			desc_id = gtr76_ibz_s5470
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/ibanez/gtr76_ibz_s5470_d`
					material = gtr76_ibz_s5470_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr76_ibz_s5470_ld03`
							flags = 4
							color = green_1guitar
						}
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr76_ibz_s5470_dtl03`
							flags = 4
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr76_ibz_s5470_dtl02`
							color = grey_4guitar
							flags = 4
							a = 50
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_24fret_ibanez02
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d2_02`
					material = gtr_fretboard24_02_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/24fret_ld01_hero_dots`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr76_neckhead_01
			chosen_materials = {
				material1 = grey_4guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/ibanez/gtr76_neckhead_d`
					material = gtr76_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr76_neckhead_ld01`
							flags = 36
							color = green_1guitar
						}
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr76_neckhead_dtl03`
							flags = 36
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/layers/cag/ibanez/gtr76_neckhead_dtl01`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr75_bridge2
			chosen_materials = {
				material1 = grey_4guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01
			chosen_materials = {
				material1 = grey_4guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr_emg_pickup2
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = gtr76_switch
		}
	}
	{
		genre = [
			rock
			punk
			pop
		]
		cas_guitar_body = {
			desc_id = gtr84_mm_petrucci
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/mm/gtr84_mm_petrucci`
					material = gtr84_mm_pet_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/mm/gtr84_mm_ld06`
							flags = 4
							color = blue_2
						}
					]
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_007`
							x_trans = 2
							y_trans = -53
							x_scale = 57
							y_scale = 61
							rot = 2263
							flags = 259
							color = red_3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_007`
							x_trans = 35
							y_trans = -19
							x_scale = 57
							y_scale = 61
							rot = 2263
							flags = 259
							color = yellow_green_2guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_007`
							color = yellow_3guitar
							x_trans = 7
							y_trans = 31
							x_scale = 57
							y_scale = 61
							rot = 2263
							flags = 259
							a = 100
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_007`
							x_trans = -52
							y_trans = 52
							x_scale = 57
							y_scale = 61
							rot = 2263
							flags = 259
							color = red_2
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_007`
							x_trans = -47
							y_trans = -66
							x_scale = 57
							y_scale = 61
							rot = 2263
							flags = 259
							color = yellow_3guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_007`
							x_trans = -26
							y_trans = -3
							x_scale = 57
							y_scale = 61
							rot = 2263
							flags = 259
							color = red_2
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_007`
							a = 25
							x_trans = -26
							y_trans = -1
							x_scale = 39
							y_scale = 39
							rot = 3073
							flags = 259
							color = red_5
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_007`
							color = red_4
							x_trans = -26
							y_trans = -1
							x_scale = 32
							y_scale = 32
							rot = 3463
							flags = 259
							a = 40
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_007`
							x_trans = -26
							y_trans = 0
							x_scale = 26
							y_scale = 25
							rot = 570
							flags = 259
							color = red_4
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_007`
							color = red_5
							x_trans = -26
							y_trans = 0
							x_scale = 21
							y_scale = 21
							rot = 960
							flags = 259
							a = 30
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_007`
							x_trans = -26
							y_trans = 0
							x_scale = 16
							y_scale = 16
							rot = 1170
							flags = 259
							color = red_5
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_003`
							color = blue_2
							y_trans = -35
							x_scale = 29
							y_scale = 33
							rot = 3853
							flags = 259
							x_trans = -42
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_023`
							x_trans = -39
							y_trans = 26
							x_scale = 49
							y_scale = 18
							rot = 2623
							flags = 259
							color = yellow_3guitar
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_24fret_mm02
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d2_02`
					material = gtr_fretboard24_02_primary
					diffuse
					pre_layer = [
						{
							color = grey_2
							texture = `tex/models/characters/layers/cag/mm/gtr84_mminlaypet24b`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr84_neckhead01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/mm/gtr84_neckhead01`
					material = gtr84_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/mm/gtr84_nekhed_dtl10`
							flags = 36
						}
						{
							texture = `tex/models/characters/layers/cag/mm/gtr84_nekhed_dtl03`
							flags = 36
							color = blue_3
						}
					]
				}
			]
			chosen_materials = {
				material1 = yellow_3guitar
			}
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr86_bridge
			chosen_materials = {
				material1 = yellow_3guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_04
			chosen_materials = {
				material1 = red_1
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr86_pickup
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = gtr_misc_switch4
		}
	}
	{
		genre = [
			pop
			`glam rock`
		]
		cas_guitar_body = {
			desc_id = gtr82_prs_se1
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/prs/prs_82_prs_se1`
					material = gtr82_prs_se1_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/prs/gtr82_prs_se1_ld01`
							flags = 4
						}
						{
							texture = `tex/models/characters/layers/cag/prs/gtr78_prs_sc_dtl12`
							color = teal_1
							flags = 4
							a = 50
						}
					]
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = teal_4
							x_trans = 5
							x_scale = 11
							y_scale = 1
							rot = 1603
							flags = 259
							y_trans = 28
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = teal_4
							y_trans = 8
							x_scale = 28
							y_scale = 1
							rot = 1603
							flags = 259
							x_trans = -3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = teal_4
							x_trans = -9
							x_scale = 23
							y_scale = 1
							rot = 1603
							flags = 259
							y_trans = 20
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = teal_4
							y_trans = 11
							x_scale = 41
							y_scale = 1
							rot = 1603
							flags = 259
							x_trans = -20
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = teal_4
							x_trans = -30
							y_trans = 33
							y_scale = 1
							rot = 1603
							flags = 259
							x_scale = 23
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = teal_4
							x_trans = -42
							x_scale = 41
							y_scale = 1
							rot = 1603
							flags = 259
							y_trans = 11
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							x_trans = -36
							y_trans = 23
							x_scale = 33
							y_scale = 1
							rot = 1603
							flags = 259
							color = teal_4
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = red_3
							x_trans = -39
							x_scale = 33
							y_scale = 1
							rot = 1603
							flags = 259
							y_trans = -17
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = red_3
							x_trans = -32
							x_scale = 15
							y_scale = 1
							rot = 1603
							flags = 259
							y_trans = -37
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = red_3
							y_trans = -27
							x_scale = 27
							y_scale = 1
							rot = 1603
							flags = 259
							x_trans = -28
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = red_3
							x_trans = -25
							x_scale = 51
							y_scale = 1
							rot = 1603
							flags = 259
							y_trans = -8
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = red_3
							x_trans = -14
							x_scale = 46
							y_scale = 1
							rot = 1603
							flags = 259
							y_trans = -11
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = red_3
							x_trans = 0
							x_scale = 34
							y_scale = 1
							rot = 1603
							flags = 259
							y_trans = -13
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = teal_4
							y_trans = 17
							x_scale = 4
							y_scale = 6
							rot = 1603
							flags = 259
							x_trans = 5
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = teal_4
							y_trans = -14
							x_scale = 4
							y_scale = 6
							rot = 1603
							flags = 259
							x_trans = -3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = teal_4
							x_trans = -9
							x_scale = 4
							y_scale = 6
							rot = 1603
							flags = 259
							y_trans = -1
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = teal_4
							x_trans = -20
							x_scale = 4
							y_scale = 6
							rot = 1603
							flags = 259
							y_trans = -21
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = teal_4
							x_trans = -30
							x_scale = 4
							y_scale = 6
							rot = 1603
							flags = 259
							y_trans = 12
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = teal_4
							x_trans = -42
							x_scale = 4
							y_scale = 6
							rot = 1603
							flags = 259
							y_trans = -21
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = teal_4
							y_trans = -5
							x_scale = 4
							y_scale = 6
							rot = 1603
							flags = 259
							x_trans = -36
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = red_3
							x_trans = -39
							x_scale = 4
							y_scale = 6
							rot = 1603
							flags = 259
							y_trans = 9
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = red_3
							x_trans = -32
							y_trans = -24
							x_scale = 4
							y_scale = 6
							rot = 1603
							flags = 259
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = red_3
							y_trans = -7
							x_scale = 4
							y_scale = 6
							rot = 1603
							flags = 259
							x_trans = -28
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = red_3
							y_trans = 30
							x_scale = 4
							y_scale = 6
							rot = 1603
							flags = 259
							x_trans = -24
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = red_3
							x_trans = -14
							y_trans = 25
							x_scale = 4
							y_scale = 6
							rot = 1603
							flags = 259
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = red_3
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
		cas_guitar_neck = {
			desc_id = cag_24fret_prs04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
					material = gtr_fretboard24_04_primary
					diffuse
					pre_layer = [
						{
							color = grey_3guitar
							texture = `tex/models/characters/layers/cag/prs/24fret_ld81_prs_hlnd`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr82_neckhead01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/prs/gtr82_neckhead_01`
					material = gtr82_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/prs/gtr82_neckhead_01_ld02`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr81_bridge01
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_tophat
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_soapbar
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			pop
			`glam rock`
		]
		cas_guitar_body = {
			desc_id = gtr82_prs_se1
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/prs/prs_82_prs_se1`
					material = gtr82_prs_se1_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/prs/gtr82_prs_se1_ld01`
							flags = 4
							color = purple_blue_1
						}
					]
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							x_trans = -18
							y_trans = 0
							x_scale = 60
							y_scale = 124
							rot = 1603
							flags = 259
							color = navy_1
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_002`
							a = 45
							x_trans = 10
							y_trans = 15
							x_scale = 20
							y_scale = 35
							rot = 1603
							flags = 3
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_002`
							a = 45
							x_trans = -7
							y_trans = 15
							x_scale = 20
							y_scale = 35
							rot = 1603
							flags = 3
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_002`
							a = 45
							x_trans = -8
							y_trans = -15
							x_scale = 20
							y_scale = 33
							rot = 1603
							flags = 3
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_002`
							a = 45
							x_trans = -24
							y_trans = -45
							x_scale = 20
							y_scale = 33
							rot = 1603
							flags = 3
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_002`
							a = 45
							x_trans = -40
							y_trans = -42
							x_scale = 20
							y_scale = 33
							rot = 1603
							flags = 3
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_002`
							color = black_1guitar
							x_trans = -40
							y_trans = -12
							x_scale = 20
							y_scale = 33
							rot = 1603
							flags = 3
							a = 55
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_002`
							a = 45
							x_trans = -24
							y_trans = -14
							x_scale = 20
							y_scale = 33
							rot = 1603
							flags = 3
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_002`
							a = 50
							x_trans = -24
							y_trans = 16
							x_scale = 19
							y_scale = 32
							rot = 1603
							flags = 3
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_002`
							a = 50
							x_trans = -40
							y_trans = 18
							x_scale = 19
							y_scale = 32
							rot = 1603
							flags = 3
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_002`
							a = 50
							x_trans = -39
							y_trans = 47
							x_scale = 19
							y_scale = 32
							rot = 1603
							flags = 3
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_002`
							a = 50
							x_trans = -24
							y_trans = 45
							x_scale = 19
							y_scale = 32
							rot = 1603
							flags = 3
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							x_trans = -17
							y_trans = 30
							x_scale = 1
							y_scale = 119
							rot = 1603
							flags = 259
							color = yellow_2guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							x_trans = -19
							y_trans = 1
							x_scale = 1
							y_scale = 119
							rot = 1603
							flags = 259
							color = yellow_2guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							x_trans = -19
							y_trans = -30
							x_scale = 1
							y_scale = 119
							rot = 1603
							flags = 259
							color = yellow_2guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							x_trans = -32
							y_trans = 3
							x_scale = 67
							y_scale = 1
							rot = 1603
							flags = 259
							color = yellow_2guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							x_trans = -16
							y_trans = 3
							x_scale = 67
							y_scale = 1
							rot = 1603
							flags = 259
							color = yellow_2guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							x_trans = 1
							y_trans = 3
							x_scale = 52
							y_scale = 1
							rot = 1603
							flags = 259
							color = yellow_2guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon011`
							x_trans = -28
							y_trans = 32
							x_scale = 84
							y_scale = 80
							rot = 373
							flags = 259
							color = yellow_2guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon004`
							x_trans = -36
							y_trans = -26
							x_scale = 41
							y_scale = 78
							rot = 2353
							flags = 267
							color = yellow_2guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon007`
							x_trans = -47
							y_trans = 4
							x_scale = 57
							y_scale = 57
							rot = 913
							flags = 259
							color = yellow_2guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon004`
							x_trans = 5
							y_trans = 20
							x_scale = 27
							y_scale = 45
							rot = 1603
							flags = 259
							color = yellow_2guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							x_trans = -8
							y_trans = -34
							x_scale = 22
							y_scale = 68
							rot = 1243
							flags = 259
							color = yellow_2guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon010`
							x_trans = -11
							y_trans = 23
							x_scale = 40
							y_scale = 27
							rot = 3343
							flags = 259
							color = yellow_2guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics014`
							a = 60
							x_trans = -34
							y_trans = 7
							x_scale = 3
							rot = 1603
							flags = 3
							y_scale = 4
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics014`
							a = 60
							x_trans = -34
							y_trans = 27
							x_scale = 3
							y_scale = 4
							rot = 1603
							flags = 3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics014`
							a = 60
							x_trans = -34
							y_trans = 36
							x_scale = 3
							y_scale = 4
							rot = 1603
							flags = 3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics014`
							a = 60
							x_trans = -29
							y_trans = 36
							x_scale = 3
							y_scale = 4
							rot = 1603
							flags = 3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics014`
							a = 60
							x_trans = -29
							y_trans = 27
							x_scale = 3
							y_scale = 4
							rot = 1603
							flags = 3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics014`
							a = 60
							x_trans = -29
							y_trans = 7
							x_scale = 3
							y_scale = 4
							rot = 1603
							flags = 3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics014`
							a = 60
							x_trans = -29
							y_trans = -3
							x_scale = 3
							y_scale = 4
							rot = 1603
							flags = 3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics014`
							a = 60
							x_trans = -34
							y_trans = -3
							x_scale = 3
							y_scale = 4
							rot = 1603
							flags = 3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics014`
							a = 60
							x_trans = -34
							x_scale = 3
							y_scale = 4
							rot = 1603
							flags = 3
							y_trans = -24
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics014`
							a = 60
							x_trans = -30
							y_trans = -24
							x_scale = 3
							y_scale = 4
							rot = 1603
							flags = 3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics014`
							a = 60
							x_trans = -30
							y_trans = -33
							x_scale = 3
							y_scale = 4
							rot = 1603
							flags = 3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics014`
							a = 60
							x_trans = -34
							y_trans = -33
							x_scale = 3
							y_scale = 4
							rot = 1603
							flags = 3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics014`
							a = 60
							x_trans = -18
							y_trans = 26
							x_scale = 3
							y_scale = 4
							rot = 1603
							flags = 3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics014`
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
		cas_guitar_neck = {
			desc_id = cag_22fret_prs04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
					material = gtr_fretboard_04_primary
					diffuse
					pre_layer = [
						{
							color = grey_3guitar
							texture = `tex/models/characters/layers/cag/prs/22fret_ld111_prs_bird`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr82_neckhead01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/prs/gtr82_neckhead_01`
					material = gtr82_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/prs/gtr82_neckhead_01_ld02`
							flags = 36
							color = purple_blue_1
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = gtr82_pguard
		}
		cas_guitar_bridges = {
			desc_id = gtr81_bridge01
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_tophat
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_soapbar
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			pop
			`glam rock`
			rock
			punk
		]
		cas_guitar_body = {
			desc_id = gtr79_prs_cstm24
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/prs/prs_ctm24_d`
					material = gtr79_prs_cst24_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/prs/gtr79_prs_ctm24_dtl01`
							flags = 4
							color = grey_5guitar
						}
					]
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon006`
							x_trans = -37
							y_trans = 6
							x_scale = 73
							y_scale = 86
							rot = 1243
							flags = 259
							color = grey_4guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon005`
							a = 100
							x_trans = -47
							y_trans = -4
							x_scale = 64
							y_scale = 68
							rot = 1873
							flags = 259
							color = grey_4guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon005`
							a = 100
							x_trans = -45
							y_trans = -6
							x_scale = 64
							y_scale = 63
							rot = 1873
							flags = 259
							color = red_3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon002`
							color = grey_4guitar
							x_trans = -22
							y_trans = 3
							x_scale = 76
							rot = 1153
							flags = 259
							y_scale = 60
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon006`
							x_trans = -36
							y_trans = 8
							x_scale = 73
							y_scale = 76
							rot = 1243
							flags = 259
							color = red_3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon011`
							x_trans = -9
							y_trans = -1
							x_scale = 63
							y_scale = 150
							rot = 1603
							flags = 259
							color = grey_4guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon011`
							color = blue_1
							y_trans = -1
							x_scale = 63
							y_scale = 140
							rot = 1603
							flags = 259
							x_trans = -8
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon013`
							x_trans = -12
							y_trans = -3
							x_scale = 62
							y_scale = 64
							rot = 1603
							flags = 259
							color = grey_4guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon002`
							color = red_3
							x_trans = -22
							y_trans = 3
							x_scale = 76
							rot = 1153
							flags = 259
							y_scale = 51
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon013`
							color = blue_1
							x_trans = -12
							x_scale = 62
							y_scale = 58
							rot = 1603
							flags = 259
							y_trans = -3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon030`
							x_trans = -7
							y_trans = -5
							x_scale = 50
							y_scale = 35
							rot = 1153
							flags = 259
							color = grey_4guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon030`
							color = red_3
							x_trans = -7
							y_trans = -5
							x_scale = 50
							y_scale = 30
							flags = 259
							rot = 1153
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							y_trans = 4
							x_scale = 3
							y_scale = 6
							rot = 1543
							flags = 3
							x_trans = -12
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							y_trans = 14
							x_scale = 3
							y_scale = 6
							rot = 2053
							flags = 3
							x_trans = -13
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = -3
							y_trans = -21
							x_scale = 6
							y_scale = 8
							flags = 3
							rot = 3043
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							y_trans = 13
							x_scale = 6
							y_scale = 8
							rot = 2053
							flags = 3
							x_trans = -9
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							y_trans = 20
							x_scale = 3
							y_scale = 5
							rot = 2053
							flags = 3
							x_trans = -11
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = 5
							y_trans = 22
							x_scale = 3
							y_scale = 5
							flags = 3
							rot = 2053
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = 8
							y_trans = 24
							y_scale = 5
							rot = 1603
							flags = 3
							x_scale = 3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = 0
							y_trans = 22
							y_scale = 10
							rot = 1603
							flags = 3
							x_scale = 6
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = -1
							x_skew = -27
							x_scale = 3
							y_scale = 7
							rot = 2203
							flags = 3
							y_trans = 6
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = -2
							y_trans = 15
							x_scale = 3
							y_scale = 7
							flags = 3
							rot = 1213
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
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
		cas_guitar_neck = {
			desc_id = cag_22fret_prs04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
					material = gtr_fretboard_04_primary
					diffuse
					pre_layer = [
						{
							color = grey_3guitar
							texture = `tex/models/characters/layers/cag/prs/22fret_ld114_prs_dots`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr79_neckhead_01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/prs/gtr79_neckhead_01d`
					material = gtr79_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/prs/gtr78_neckhead_ld02`
							flags = 36
							color = grey_5guitar
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr79_whammy
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_tophat_2
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_sd03
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = gtr_misc_switch4
			chosen_materials = {
				material1 = black_1guitar
			}
		}
	}
	{
		genre = [
			`classic rock`
			rock
		]
		cas_guitar_body = {
			desc_id = gtr84_mm_petrucci
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/mm/gtr84_mm_petrucci`
					material = gtr84_mm_pet_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/mm/gtr84_mm_ld06`
							flags = 4
							color = red_1
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_24fret_mm04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
					material = gtr_fretboard24_04_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/24fret_ld01_hero_dots`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr84_neckhead01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/mm/gtr84_neckhead01`
					material = gtr84_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/mm/gtr84_nekhed_dtl04`
							flags = 36
							color = red_1
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr84_whammy
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_mm01
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr84_pickup_a
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = gtr_misc_switch4
		}
	}
	{
		genre = [
			rock
			punk
		]
		cas_guitar_body = {
			desc_id = gtr84_mm_petrucci
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/mm/gtr84_mm_petrucci`
					material = gtr84_mm_pet_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/mm/gtr84_mm_ld06`
							flags = 4
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_24fret_mm04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
					material = gtr_fretboard24_04_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/24fret_ld01_hero_dots`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr84_neckhead01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/mm/gtr84_neckhead01`
					material = gtr84_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/mm/gtr84_nekhed_dtl04`
							flags = 36
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr84_whammy
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_mm01
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr_emg_pickup5
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			pop
		]
		cas_guitar_body = {
			desc_id = gtr84_mm_petrucci
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/mm/gtr84_mm_petrucci`
					material = gtr84_mm_pet_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/mm/gtr84_mm_ld06`
							flags = 4
							color = grey_5guitar
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_mm02
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d2_01`
					material = gtr_fretboard_02_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
							flags = 4
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr84_neckhead01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/mm/gtr84_neckhead01`
					material = gtr84_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/mm/gtr84_nekhed_dtl04`
							flags = 36
							color = grey_5guitar
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr84_whammy
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_02
		}
		cas_guitar_pickups = {
			desc_id = gtr_emg_pickup2
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			pop
			`glam rock`
			goth
		]
		cas_guitar_body = {
			desc_id = gtr84_mm_petrucci
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/mm/gtr84_mm_petrucci`
					material = gtr84_mm_pet_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/mm/gtr84_mm_ld04`
							flags = 4
							color = purple_blue_2
						}
						{
							texture = `tex/models/characters/layers/cag/mm/gtr84_mm_dtl03`
							flags = 4
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_mm03
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d3_01`
					material = gtr_fretboard_03_primary
					diffuse
					pre_layer = [
						{
							color = grey_5
							texture = `tex/models/characters/layers/cag/mm/gtr84_mminlaypet22b`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr84_neckhead01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/mm/gtr84_neckhead01`
					material = gtr84_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/mm/gtr84_nekhed_dtl04`
							flags = 36
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr84_whammy
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_mm01
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr84_pickup_a
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`classic rock`
			rock
		]
		cas_guitar_body = {
			desc_id = gtr84_mm_petrucci
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/mm/gtr84_mm_petrucci`
					material = gtr84_mm_pet_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/mm/gtr84_mm_ld06`
							flags = 4
							color = red_1
						}
						{
							texture = `tex/models/characters/layers/cag/mm/gtr84_mm_dtl03`
							flags = 4
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_24fret_mm04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
					material = gtr_fretboard24_04_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/24fret_ld01_hero_dots`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr84_neckhead01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/mm/gtr84_neckhead01`
					material = gtr84_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/mm/gtr84_nekhed_dtl10`
							flags = 36
							color = red_1
						}
						{
							texture = `tex/models/characters/layers/cag/mm/gtr84_nekhed_dtl06`
							flags = 36
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr84_whammy
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_mm01
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr84_pickup_a
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`glam rock`
			pop
		]
		cas_guitar_body = {
			desc_id = gtr84_mm_petrucci
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/mm/gtr84_mm_petrucci`
					material = gtr84_mm_pet_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/mm/gtr84_mm_ld06`
							flags = 4
							color = blue_2
						}
						{
							texture = `tex/models/characters/layers/cag/mm/gtr84_mm_dtl03`
							flags = 4
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_24fret_mm04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
					material = gtr_fretboard24_04_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/24fret_ld01_hero_dots`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr84_neckhead01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/mm/gtr84_neckhead01`
					material = gtr84_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/mm/gtr84_nekhed_dtl04`
							flags = 36
						}
						{
							texture = `tex/models/characters/layers/cag/mm/gtr84_nekhed_dtl07`
							flags = 36
							color = navy_2
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr84_whammy
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_mm01
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr84_pickup_a
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`classic rock`
			rock
		]
		cas_guitar_body = {
			desc_id = gtr84_mm_petrucci
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/mm/gtr84_mm_petrucci`
					material = gtr84_mm_pet_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/mm/gtr84_mm_ld04`
							flags = 4
							color = orange_4
						}
						{
							texture = `tex/models/characters/layers/cag/mm/gtr84_mm_dtl03`
							flags = 4
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_24fret_mm04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
					material = gtr_fretboard24_04_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/mm/gtr84_mminlaypet24b`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr84_neckhead01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/mm/gtr84_neckhead01`
					material = gtr84_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/mm/gtr84_nekhed_dtl04`
							flags = 36
						}
						{
							texture = `tex/models/characters/layers/cag/all_clear2`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr84_whammy
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_mm01
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr84_pickup_a
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`classic rock`
		]
		cas_guitar_body = {
			desc_id = gtr86_mm_axis
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/mm/gtr86_mm_axis_d`
					material = gtr86_mm_axis_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/mm/gtr86_mm_axis_ld04`
							flags = 4
							color = orange_4
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_mm02
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d2_01`
					material = gtr_fretboard_02_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
							flags = 4
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr86_neckhead_01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/mm/gtr86_neckhead_d`
					material = gtr86_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/mm/gtr86_neckhead_ld03`
							flags = 36
							color = orange_3
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr75_bridgemm
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_09c
		}
		cas_guitar_pickups = {
			desc_id = gtr86_pickup
		}
		cas_guitar_misc = {
			desc_id = gtr_misc_switch4
		}
	}
	{
		genre = [
			`classic rock`
		]
		cas_guitar_body = {
			desc_id = gtr86_mm_axis
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/mm/gtr86_mm_axis_d`
					material = gtr86_mm_axis_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/mm/gtr86_mm_axis_ld03`
							flags = 4
							color = navy_2
						}
						{
							texture = `tex/models/characters/layers/cag/mm/gtr86_mm_axis_dtl03`
							flags = 4
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_mm02
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d2_01`
					material = gtr_fretboard_02_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
							flags = 4
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr86_neckhead_01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/mm/gtr86_neckhead_d`
					material = gtr86_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/mm/gtr86_neckhead_ld02`
							flags = 36
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/layers/cag/mm/gtr86_neckhead_dtl04`
							flags = 36
							color = navy_1
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr75_bridgemm
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_09c
		}
		cas_guitar_pickups = {
			desc_id = gtr86_pickup
		}
		cas_guitar_misc = {
			desc_id = gtr_misc_switch4
		}
	}
	{
		genre = [
			`classic rock`
		]
		cas_guitar_body = {
			desc_id = gtr86_mm_axis
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/mm/gtr86_mm_axis_d`
					material = gtr86_mm_axis_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/mm/gtr86_mm_axis_ld04`
							flags = 4
							color = orange_4
						}
						{
							texture = `tex/models/characters/layers/cag/mm/gtr86_mm_axis_dtl03`
							color = red_1
							flags = 4
							a = 60
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_mm03
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d3_01`
					material = gtr_fretboard_03_primary
					diffuse
					pre_layer = [
						{
							color = grey_5
							texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr86_neckhead_01
			chosen_materials = {
				material1 = grey_5guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/mm/gtr86_neckhead_d`
					material = gtr86_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/mm/gtr86_neckhead_ld01`
							flags = 36
							color = orange_3
						}
						{
							texture = `tex/models/characters/layers/cag/mm/gtr86_neckhead_dtl03`
							flags = 36
							color = red_1
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr86_bridge
			chosen_materials = {
				material1 = grey_5guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_10
		}
		cas_guitar_pickups = {
			desc_id = gtr86_pickup
		}
		cas_guitar_misc = {
			desc_id = gtr71_switch
		}
	}
	{
		genre = [
			`glam rock`
			pop
		]
		cas_guitar_body = {
			desc_id = gtr86_mm_axis
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/mm/gtr86_mm_axis_d`
					material = gtr86_mm_axis_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/mm/gtr86_mm_axis_ld02`
							flags = 4
							color = blue_4
						}
						{
							texture = `tex/models/characters/layers/cag/all_clear2`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_mm04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
					material = gtr_fretboard_04_primary
					diffuse
					pre_layer = [
						{
							color = grey_5
							texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr86_neckhead_01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/mm/gtr86_neckhead_d`
					material = gtr86_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/mm/gtr86_neckhead_ld02`
							flags = 36
							color = blue_4
						}
						{
							texture = `tex/models/characters/layers/cag/all_clear2`
							flags = 4
						}
					]
				}
			]
			chosen_materials = {
				material1 = grey_5guitar
			}
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr84_whammy
			chosen_materials = {
				material1 = grey_5guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_10
		}
		cas_guitar_pickups = {
			desc_id = gtr_emg_pickup2
			chosen_materials = {
				material1 = grey_5guitar
			}
		}
		cas_guitar_misc = {
			desc_id = gtr71_switch
		}
	}
	{
		genre = [
			`classic rock`
		]
		cas_guitar_body = {
			desc_id = gtr86_mm_axis
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/mm/gtr86_mm_axis_d`
					material = gtr86_mm_axis_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/mm/gtr86_mm_axis_ld03`
							flags = 4
							color = yellow_orange_2
						}
						{
							texture = `tex/models/characters/layers/cag/all_clear2`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_mm03
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d3_01`
					material = gtr_fretboard_03_primary
					diffuse
					pre_layer = [
						{
							color = grey_5
							texture = `tex/models/characters/layers/cag/mm/gtr84_mminlaypet22b`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr86_neckhead_01
			chosen_materials = {
				material1 = grey_5guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/mm/gtr86_neckhead_d`
					material = gtr86_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/mm/gtr86_neckhead_ld04`
							flags = 36
							color = yellow_orange_4
						}
						{
							texture = `tex/models/characters/layers/cag/all_clear2`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr86_bridge
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_10
		}
		cas_guitar_pickups = {
			desc_id = gtr86_pickup
		}
		cas_guitar_misc = {
			desc_id = gtr71_switch
		}
	}
	{
		genre = [
			`classic rock`
		]
		cas_guitar_body = {
			desc_id = gtr86_mm_axis
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/mm/gtr86_mm_axis_d`
					material = gtr86_mm_axis_primary
					diffuse
					pre_layer = [
						{
							color = yellow_orange_5
							texture = `tex/models/characters/layers/cag/mm/gtr86_mm_axis_ld04`
							flags = 4
						}
						{
							texture = `tex/models/characters/layers/cag/mm/gtr86_mm_axis_dtl03`
							flags = 4
							color = yellow_orange_1
						}
						{
							texture = `tex/models/characters/layers/cag/mm/gtr86_mm_axis_dtl02`
							flags = 4
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_mm02
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d2_01`
					material = gtr_fretboard_02_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
							flags = 4
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr86_neckhead_01
			chosen_materials = {
				material1 = grey_5guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/mm/gtr86_neckhead_d`
					material = gtr86_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/mm/gtr86_neckhead_ld04`
							flags = 36
						}
						{
							texture = `tex/models/characters/layers/cag/all_clear2`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr84_whammy
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_10
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr86_pickup
		}
		cas_guitar_misc = {
			desc_id = gtr71_switch
		}
	}
	{
		genre = [
			`classic rock`
			`glam rock`
			pop
			rock
		]
		cas_guitar_body = {
			desc_id = gtr78_prs_sc
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/prs/gtr78_prs_sc_d`
					material = gtr78_prs_sc_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/prs/gtr78_prs_sc_ld03`
							flags = 4
							color = red_orange_4
						}
						{
							color = red_3
							texture = `tex/models/characters/layers/cag/prs/gtr78_prs_sc_dtl05`
							flags = 4
						}
						{
							texture = `tex/models/characters/layers/cag/prs/gtr78_prs_sc_dtl02`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_prs04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
					material = gtr_fretboard_04_primary
					diffuse
					pre_layer = [
						{
							color = grey_3guitar
							texture = `tex/models/characters/layers/cag/prs/22fret_ld113_prs_moon`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr78_neckhead_01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/prs/gtr78_neckhead_d`
					material = gtr78_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/prs/gtr78_neckhead_ld02`
							flags = 4
						}
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/prs/gtr78_neckhead_ld03`
							flags = 36
						}
					]
				}
			]
			chosen_materials = {
				material1 = grey_5guitar
			}
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr78_bridge01
			chosen_materials = {
				material1 = grey_5guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_04
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_type2_prs
			chosen_materials = {
				material1 = yellow_5guitar
			}
		}
		cas_guitar_misc = {
			desc_id = gtr_misc_switch4
		}
	}
	{
		genre = [
			pop
			`glam rock`
		]
		cas_guitar_body = {
			desc_id = gtr82_prs_se1
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/prs/prs_82_prs_se1`
					material = gtr82_prs_se1_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/prs/gtr82_prs_se1_ld01`
							flags = 4
						}
						{
							texture = `tex/models/characters/layers/cag/prs/gtr78_prs_sc_dtl12`
							color = teal_1
							flags = 4
							a = 50
						}
					]
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = teal_4
							x_trans = 5
							x_scale = 11
							y_scale = 1
							rot = 1603
							flags = 259
							y_trans = 28
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = teal_4
							y_trans = 8
							x_scale = 28
							y_scale = 1
							rot = 1603
							flags = 259
							x_trans = -3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = teal_4
							x_trans = -9
							x_scale = 23
							y_scale = 1
							rot = 1603
							flags = 259
							y_trans = 20
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = teal_4
							y_trans = 11
							x_scale = 41
							y_scale = 1
							rot = 1603
							flags = 259
							x_trans = -20
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = teal_4
							x_trans = -30
							y_trans = 33
							y_scale = 1
							rot = 1603
							flags = 259
							x_scale = 23
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = teal_4
							x_trans = -42
							x_scale = 41
							y_scale = 1
							rot = 1603
							flags = 259
							y_trans = 11
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							x_trans = -36
							y_trans = 23
							x_scale = 33
							y_scale = 1
							rot = 1603
							flags = 259
							color = teal_4
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = red_3
							x_trans = -39
							x_scale = 33
							y_scale = 1
							rot = 1603
							flags = 259
							y_trans = -17
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = red_3
							x_trans = -32
							x_scale = 15
							y_scale = 1
							rot = 1603
							flags = 259
							y_trans = -37
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = red_3
							y_trans = -27
							x_scale = 27
							y_scale = 1
							rot = 1603
							flags = 259
							x_trans = -28
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = red_3
							x_trans = -25
							x_scale = 51
							y_scale = 1
							rot = 1603
							flags = 259
							y_trans = -8
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = red_3
							x_trans = -14
							x_scale = 46
							y_scale = 1
							rot = 1603
							flags = 259
							y_trans = -11
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = red_3
							x_trans = 0
							x_scale = 34
							y_scale = 1
							rot = 1603
							flags = 259
							y_trans = -13
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = teal_4
							y_trans = 17
							x_scale = 4
							y_scale = 6
							rot = 1603
							flags = 259
							x_trans = 5
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = teal_4
							y_trans = -14
							x_scale = 4
							y_scale = 6
							rot = 1603
							flags = 259
							x_trans = -3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = teal_4
							x_trans = -9
							x_scale = 4
							y_scale = 6
							rot = 1603
							flags = 259
							y_trans = -1
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = teal_4
							x_trans = -20
							x_scale = 4
							y_scale = 6
							rot = 1603
							flags = 259
							y_trans = -21
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = teal_4
							x_trans = -30
							x_scale = 4
							y_scale = 6
							rot = 1603
							flags = 259
							y_trans = 12
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = teal_4
							x_trans = -42
							x_scale = 4
							y_scale = 6
							rot = 1603
							flags = 259
							y_trans = -21
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = teal_4
							y_trans = -5
							x_scale = 4
							y_scale = 6
							rot = 1603
							flags = 259
							x_trans = -36
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = red_3
							x_trans = -39
							x_scale = 4
							y_scale = 6
							rot = 1603
							flags = 259
							y_trans = 9
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = red_3
							x_trans = -32
							y_trans = -24
							x_scale = 4
							y_scale = 6
							rot = 1603
							flags = 259
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = red_3
							y_trans = -7
							x_scale = 4
							y_scale = 6
							rot = 1603
							flags = 259
							x_trans = -28
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = red_3
							y_trans = 30
							x_scale = 4
							y_scale = 6
							rot = 1603
							flags = 259
							x_trans = -24
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = red_3
							x_trans = -14
							y_trans = 25
							x_scale = 4
							y_scale = 6
							rot = 1603
							flags = 259
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = red_3
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
		cas_guitar_neck = {
			desc_id = cag_24fret_prs04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
					material = gtr_fretboard24_04_primary
					diffuse
					pre_layer = [
						{
							color = grey_3guitar
							texture = `tex/models/characters/layers/cag/prs/24fret_ld81_prs_hlnd`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr82_neckhead01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/prs/gtr82_neckhead_01`
					material = gtr82_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/prs/gtr82_neckhead_01_ld02`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr81_bridge01
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_tophat
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_soapbar
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			pop
			`glam rock`
		]
		cas_guitar_body = {
			desc_id = gtr82_prs_se1
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/prs/prs_82_prs_se1`
					material = gtr82_prs_se1_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/prs/gtr82_prs_se1_ld01`
							flags = 4
							color = purple_blue_1
						}
					]
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							x_trans = -18
							y_trans = 0
							x_scale = 60
							y_scale = 124
							rot = 1603
							flags = 259
							color = navy_1
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_002`
							a = 45
							x_trans = 10
							y_trans = 15
							x_scale = 20
							y_scale = 35
							rot = 1603
							flags = 3
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_002`
							a = 45
							x_trans = -7
							y_trans = 15
							x_scale = 20
							y_scale = 35
							rot = 1603
							flags = 3
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_002`
							a = 45
							x_trans = -8
							y_trans = -15
							x_scale = 20
							y_scale = 33
							rot = 1603
							flags = 3
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_002`
							a = 45
							x_trans = -24
							y_trans = -45
							x_scale = 20
							y_scale = 33
							rot = 1603
							flags = 3
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_002`
							a = 45
							x_trans = -40
							y_trans = -42
							x_scale = 20
							y_scale = 33
							rot = 1603
							flags = 3
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_002`
							color = black_1guitar
							x_trans = -40
							y_trans = -12
							x_scale = 20
							y_scale = 33
							rot = 1603
							flags = 3
							a = 55
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_002`
							a = 45
							x_trans = -24
							y_trans = -14
							x_scale = 20
							y_scale = 33
							rot = 1603
							flags = 3
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_002`
							a = 50
							x_trans = -24
							y_trans = 16
							x_scale = 19
							y_scale = 32
							rot = 1603
							flags = 3
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_002`
							a = 50
							x_trans = -40
							y_trans = 18
							x_scale = 19
							y_scale = 32
							rot = 1603
							flags = 3
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_002`
							a = 50
							x_trans = -39
							y_trans = 47
							x_scale = 19
							y_scale = 32
							rot = 1603
							flags = 3
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_002`
							a = 50
							x_trans = -24
							y_trans = 45
							x_scale = 19
							y_scale = 32
							rot = 1603
							flags = 3
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							x_trans = -17
							y_trans = 30
							x_scale = 1
							y_scale = 119
							rot = 1603
							flags = 259
							color = yellow_2guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							x_trans = -19
							y_trans = 1
							x_scale = 1
							y_scale = 119
							rot = 1603
							flags = 259
							color = yellow_2guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							x_trans = -19
							y_trans = -30
							x_scale = 1
							y_scale = 119
							rot = 1603
							flags = 259
							color = yellow_2guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							x_trans = -32
							y_trans = 3
							x_scale = 67
							y_scale = 1
							rot = 1603
							flags = 259
							color = yellow_2guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							x_trans = -16
							y_trans = 3
							x_scale = 67
							y_scale = 1
							rot = 1603
							flags = 259
							color = yellow_2guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							x_trans = 1
							y_trans = 3
							x_scale = 52
							y_scale = 1
							rot = 1603
							flags = 259
							color = yellow_2guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon011`
							x_trans = -28
							y_trans = 32
							x_scale = 84
							y_scale = 80
							rot = 373
							flags = 259
							color = yellow_2guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon004`
							x_trans = -36
							y_trans = -26
							x_scale = 41
							y_scale = 78
							rot = 2353
							flags = 267
							color = yellow_2guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon007`
							x_trans = -47
							y_trans = 4
							x_scale = 57
							y_scale = 57
							rot = 913
							flags = 259
							color = yellow_2guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon004`
							x_trans = 5
							y_trans = 20
							x_scale = 27
							y_scale = 45
							rot = 1603
							flags = 259
							color = yellow_2guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							x_trans = -8
							y_trans = -34
							x_scale = 22
							y_scale = 68
							rot = 1243
							flags = 259
							color = yellow_2guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon010`
							x_trans = -11
							y_trans = 23
							x_scale = 40
							y_scale = 27
							rot = 3343
							flags = 259
							color = yellow_2guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics014`
							a = 60
							x_trans = -34
							y_trans = 7
							x_scale = 3
							rot = 1603
							flags = 3
							y_scale = 4
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics014`
							a = 60
							x_trans = -34
							y_trans = 27
							x_scale = 3
							y_scale = 4
							rot = 1603
							flags = 3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics014`
							a = 60
							x_trans = -34
							y_trans = 36
							x_scale = 3
							y_scale = 4
							rot = 1603
							flags = 3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics014`
							a = 60
							x_trans = -29
							y_trans = 36
							x_scale = 3
							y_scale = 4
							rot = 1603
							flags = 3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics014`
							a = 60
							x_trans = -29
							y_trans = 27
							x_scale = 3
							y_scale = 4
							rot = 1603
							flags = 3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics014`
							a = 60
							x_trans = -29
							y_trans = 7
							x_scale = 3
							y_scale = 4
							rot = 1603
							flags = 3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics014`
							a = 60
							x_trans = -29
							y_trans = -3
							x_scale = 3
							y_scale = 4
							rot = 1603
							flags = 3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics014`
							a = 60
							x_trans = -34
							y_trans = -3
							x_scale = 3
							y_scale = 4
							rot = 1603
							flags = 3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics014`
							a = 60
							x_trans = -34
							x_scale = 3
							y_scale = 4
							rot = 1603
							flags = 3
							y_trans = -24
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics014`
							a = 60
							x_trans = -30
							y_trans = -24
							x_scale = 3
							y_scale = 4
							rot = 1603
							flags = 3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics014`
							a = 60
							x_trans = -30
							y_trans = -33
							x_scale = 3
							y_scale = 4
							rot = 1603
							flags = 3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics014`
							a = 60
							x_trans = -34
							y_trans = -33
							x_scale = 3
							y_scale = 4
							rot = 1603
							flags = 3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics014`
							a = 60
							x_trans = -18
							y_trans = 26
							x_scale = 3
							y_scale = 4
							rot = 1603
							flags = 3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics014`
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
		cas_guitar_neck = {
			desc_id = cag_22fret_prs04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
					material = gtr_fretboard_04_primary
					diffuse
					pre_layer = [
						{
							color = grey_3guitar
							texture = `tex/models/characters/layers/cag/prs/22fret_ld111_prs_bird`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr82_neckhead01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/prs/gtr82_neckhead_01`
					material = gtr82_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/prs/gtr82_neckhead_01_ld02`
							flags = 36
							color = purple_blue_1
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = gtr82_pguard
		}
		cas_guitar_bridges = {
			desc_id = gtr81_bridge01
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_tophat
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_soapbar
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			pop
			`glam rock`
			rock
			punk
		]
		cas_guitar_body = {
			desc_id = gtr79_prs_cstm24
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/prs/prs_ctm24_d`
					material = gtr79_prs_cst24_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/prs/gtr79_prs_ctm24_dtl01`
							flags = 4
							color = grey_5guitar
						}
					]
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon006`
							x_trans = -37
							y_trans = 6
							x_scale = 73
							y_scale = 86
							rot = 1243
							flags = 259
							color = grey_4guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon005`
							a = 100
							x_trans = -47
							y_trans = -4
							x_scale = 64
							y_scale = 68
							rot = 1873
							flags = 259
							color = grey_4guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon005`
							a = 100
							x_trans = -45
							y_trans = -6
							x_scale = 64
							y_scale = 63
							rot = 1873
							flags = 259
							color = red_3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon002`
							color = grey_4guitar
							x_trans = -22
							y_trans = 3
							x_scale = 76
							rot = 1153
							flags = 259
							y_scale = 60
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon006`
							x_trans = -36
							y_trans = 8
							x_scale = 73
							y_scale = 76
							rot = 1243
							flags = 259
							color = red_3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon011`
							x_trans = -9
							y_trans = -1
							x_scale = 63
							y_scale = 150
							rot = 1603
							flags = 259
							color = grey_4guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon011`
							color = blue_1
							y_trans = -1
							x_scale = 63
							y_scale = 140
							rot = 1603
							flags = 259
							x_trans = -8
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon013`
							x_trans = -12
							y_trans = -3
							x_scale = 62
							y_scale = 64
							rot = 1603
							flags = 259
							color = grey_4guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon002`
							color = red_3
							x_trans = -22
							y_trans = 3
							x_scale = 76
							rot = 1153
							flags = 259
							y_scale = 51
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon013`
							color = blue_1
							x_trans = -12
							x_scale = 62
							y_scale = 58
							rot = 1603
							flags = 259
							y_trans = -3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon030`
							x_trans = -7
							y_trans = -5
							x_scale = 50
							y_scale = 35
							rot = 1153
							flags = 259
							color = grey_4guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon030`
							color = red_3
							x_trans = -7
							y_trans = -5
							x_scale = 50
							y_scale = 30
							flags = 259
							rot = 1153
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							y_trans = 4
							x_scale = 3
							y_scale = 6
							rot = 1543
							flags = 3
							x_trans = -12
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							y_trans = 14
							x_scale = 3
							y_scale = 6
							rot = 2053
							flags = 3
							x_trans = -13
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = -3
							y_trans = -21
							x_scale = 6
							y_scale = 8
							flags = 3
							rot = 3043
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							y_trans = 13
							x_scale = 6
							y_scale = 8
							rot = 2053
							flags = 3
							x_trans = -9
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							y_trans = 20
							x_scale = 3
							y_scale = 5
							rot = 2053
							flags = 3
							x_trans = -11
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = 5
							y_trans = 22
							x_scale = 3
							y_scale = 5
							flags = 3
							rot = 2053
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = 8
							y_trans = 24
							y_scale = 5
							rot = 1603
							flags = 3
							x_scale = 3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = 0
							y_trans = 22
							y_scale = 10
							rot = 1603
							flags = 3
							x_scale = 6
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = -1
							x_skew = -27
							x_scale = 3
							y_scale = 7
							rot = 2203
							flags = 3
							y_trans = 6
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = -2
							y_trans = 15
							x_scale = 3
							y_scale = 7
							flags = 3
							rot = 1213
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
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
		cas_guitar_neck = {
			desc_id = cag_22fret_prs04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
					material = gtr_fretboard_04_primary
					diffuse
					pre_layer = [
						{
							color = grey_3guitar
							texture = `tex/models/characters/layers/cag/prs/22fret_ld114_prs_dots`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr79_neckhead_01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/prs/gtr79_neckhead_01d`
					material = gtr79_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/prs/gtr78_neckhead_ld02`
							flags = 36
							color = grey_5guitar
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr79_whammy
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_tophat_2
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_sd03
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = gtr_misc_switch4
			chosen_materials = {
				material1 = black_1guitar
			}
		}
	}
	{
		genre = [
			`classic rock`
		]
		cas_guitar_body = {
			desc_id = gtr79_prs_cstm24
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/prs/prs_ctm24_d`
					material = gtr79_prs_cst24_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/prs/gtr79_prs_ctm24_dtl01`
							flags = 4
							color = orange_4
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_24fret_prs04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
					material = gtr_fretboard24_04_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/prs/24fret_ld81_prs_dots`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr79_neckhead_01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/prs/gtr79_neckhead_01d`
					material = gtr79_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/prs/gtr78_neckhead_ld02`
							flags = 36
							color = orange_4
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr79_whammy
		}
		cas_guitar_knobs = {
			desc_id = prs_knob_lampshade
			chosen_materials = {
				material1 = yellow_orange_3
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_type2_prs
			chosen_materials = {
				material1 = yellow_orange_4
			}
		}
		cas_guitar_misc = {
			desc_id = gtr_misc_switch4
		}
	}
	{
		genre = [
			`black metal`
			rock
		]
		cas_guitar_body = {
			desc_id = gtr79_prs_cstm24
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/prs/prs_ctm24_d`
					material = gtr79_prs_cst24_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/prs/gtr79_prs_ctm24_dtl03`
							flags = 4
							color = grey_2guitar
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_24fret_prs04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
					material = gtr_fretboard24_04_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/prs/24fret_ld81_prs_dots`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr79_neckhead_01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/prs/gtr79_neckhead_01d`
					material = gtr79_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/prs/gtr78_neckhead_ld02`
							flags = 36
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr79_whammy
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_tophat_2
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_sd04
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = gtr_misc_switch4
		}
	}
	{
		genre = [
			rock
			goth
		]
		cas_guitar_body = {
			desc_id = gtr79_prs_cstm24
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/prs/prs_ctm24_d`
					material = gtr79_prs_cst24_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/prs/gtr79_prs_ctm24_dtl02`
							flags = 4
							color = navy_2
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_24fret_prs04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
					material = gtr_fretboard24_04_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/prs/24fret_ld81_prs_dots`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr79_neckhead_01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/prs/gtr79_neckhead_01d`
					material = gtr79_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/prs/gtr78_neckhead_ld02`
							flags = 36
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr79_whammy
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_04
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_sd06
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`classic rock`
		]
		cas_guitar_body = {
			desc_id = gtr79_prs_cstm24
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/prs/prs_ctm24_d`
					material = gtr79_prs_cst24_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/prs/gtr79_prs_ctm24_dtl02`
							flags = 4
							color = orange_4
						}
						{
							texture = `tex/models/characters/layers/cag/prs/gtr79_prs_ctm24_ld03`
							color = red_1
							flags = 4
							a = 50
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_24fret_prs03
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d3_02`
					material = gtr_fretboard24_03_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/prs/24fret_ld81_prs_dots`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr79_neckhead_01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/prs/gtr79_neckhead_01d`
					material = gtr79_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/prs/gtr78_neckhead_ld02`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr79_whammy
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_04
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_sd06
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`classic rock`
			punk
		]
		cas_guitar_body = {
			desc_id = gtr79_prs_cstm24
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/prs/prs_ctm24_d`
					material = gtr79_prs_cst24_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/prs/gtr79_prs_ctm24_dtl02`
							flags = 4
							color = green_2guitar
						}
						{
							texture = `tex/models/characters/layers/cag/prs/gtr79_prs_ctm24_ld01`
							flags = 4
							color = yellow_5guitar
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_24fret_prs04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
					material = gtr_fretboard24_04_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/prs/24fret_ld81_prs_dots`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr79_neckhead_01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/prs/gtr79_neckhead_01d`
					material = gtr79_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/prs/gtr78_neckhead_ld02`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr79_whammy
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_04
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_sd06
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`glam rock`
			pop
		]
		cas_guitar_body = {
			desc_id = gtr79_prs_cstm24
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/prs/prs_ctm24_d`
					material = gtr79_prs_cst24_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/prs/gtr79_prs_ctm24_dtl03`
							flags = 4
							color = violet_4
						}
						{
							texture = `tex/models/characters/layers/cag/prs/gtr79_prs_ctm24_ld01`
							flags = 4
							color = yellow_5guitar
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_24fret_prs04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
					material = gtr_fretboard24_04_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/prs/24fret_ld81_prs_dots`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr79_neckhead_01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/prs/gtr79_neckhead_01d`
					material = gtr79_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/prs/gtr78_neckhead_ld02`
							flags = 36
						}
						{
							texture = `tex/models/characters/layers/cag/prs/gtr78_neckhead_ld03`
							flags = 36
							color = violet_4
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr79_whammy
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_04
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_sd06
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			pop
			`glam rock`
			`classic rock`
		]
		cas_guitar_body = {
			desc_id = gtr81_prs_miramt
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/prs/prs_81_mt_d`
					material = gtr81_prs_mt_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/prs/gtr81_prs_mt_ld01`
							flags = 4
							color = teal_5
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_prs04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
					material = gtr_fretboard_04_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/prs/22fret_ld110_prs_hlnd`
							flags = 36
							color = grey_5guitar
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr81_neckhead01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/prs/gtr81_neckhead_01d`
					material = gtr81_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/prs/gtr78_neckhead_ld02`
							flags = 36
							color = teal_5
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = gtr81_pguard
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/prs/prs_81_pguard`
					material = gtr81_pguard_primary
					diffuse
					pre_layer = [
						{
							color = grey_5
							texture = `tex/models/characters/layers/cag/prs/prs_81_pguard_ld01`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_bridges = {
			desc_id = gtr81_bridge01
		}
		cas_guitar_knobs = {
			desc_id = prs_knob_lampshade
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_sd06
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = gtr_misc_switch4
		}
	}
	{
		genre = [
			punk
			`classic rock`
		]
		cas_guitar_body = {
			desc_id = gtr81_prs_miramt
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/prs/prs_81_mt_d`
					material = gtr81_prs_mt_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/prs/gtr81_prs_mt_ld21`
							flags = 4
							color = yellow_orange_2
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_prs04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
					material = gtr_fretboard_04_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/prs/22fret_ld110_prs_hlnd`
							flags = 36
							color = grey_5guitar
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr81_neckhead01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/prs/gtr81_neckhead_01d`
					material = gtr81_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/prs/gtr78_neckhead_ld04`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = gtr81_pguard
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/prs/prs_81_pguard`
					material = gtr81_pguard_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/prs/prs_81_pguard_ld01`
							flags = 4
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_bridges = {
			desc_id = gtr81_bridge01
		}
		cas_guitar_knobs = {
			desc_id = prs_knob_lampshade
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_sd06
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = gtr_misc_switch4
		}
	}
	{
		genre = [
			punk
			`classic rock`
			rock
		]
		cas_guitar_body = {
			desc_id = gtr81_prs_miramt
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/prs/prs_81_mt_d`
					material = gtr81_prs_mt_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/prs/gtr81_prs_mt_ld21`
							flags = 4
							color = orange_4
						}
						{
							texture = `tex/models/characters/layers/cag/prs/gtr81_prs_mt_dtl04`
							flags = 4
							color = orange_1
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_prs04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
					material = gtr_fretboard_04_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/prs/22fret_ld110_prs_hlnd`
							flags = 36
							color = grey_5guitar
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr81_neckhead01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/prs/gtr81_neckhead_01d`
					material = gtr81_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/prs/gtr78_neckhead_ld04`
							flags = 36
						}
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/prs/gtr78_neckhead_ld03`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = gtr81_pguard
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/prs/prs_81_pguard`
					material = gtr81_pguard_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/prs/prs_81_pguard_ld01`
							flags = 4
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_bridges = {
			desc_id = gtr81_bridge01
		}
		cas_guitar_knobs = {
			desc_id = prs_knob_lampshade
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_sd06
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = gtr_misc_switch4
		}
	}
	{
		genre = [
			punk
			`classic rock`
			rock
		]
		cas_guitar_body = {
			desc_id = gtr82_prs_se1
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/prs/prs_82_prs_se1`
					material = gtr82_prs_se1_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/prs/gtr83_prs_wood`
							flags = 4
							color = orange_4
						}
						{
							texture = `tex/models/characters/layers/cag/prs/gtr78_prs_sc_dtl05`
							flags = 4
							color = red_orange_2
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_prs03
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d3_01`
					material = gtr_fretboard_03_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/prs/22fret_ld110_prs_hlnd`
							flags = 36
							color = grey_5guitar
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr82_neckhead01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/prs/gtr82_neckhead_01`
					material = gtr82_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/prs/gtr82_neckhead_01_ld04`
							flags = 36
						}
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/prs/gtr82_neckhead_01_ld03`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = gtr82_pguard
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/prs/prs_82_pguard`
					material = gtr82_pguard_primary
					diffuse
					pre_layer = [
						{
							color = red_3
							texture = `tex/models/characters/layers/cag/prs/prs_82_pguard_dtl02`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_bridges = {
			desc_id = gtr81_bridge01
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_tophat
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_soapbar
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			punk
			`classic rock`
			rock
		]
		cas_guitar_body = {
			desc_id = gtr82_prs_se1
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/prs/prs_82_prs_se1`
					material = gtr82_prs_se1_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/prs/gtr83_prs_wood`
							flags = 4
							color = red_2
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_24fret_prs03
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d3_02`
					material = gtr_fretboard24_03_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/prs/24fret_ld81_prs_dots`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr82_neckhead01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/prs/gtr82_neckhead_01`
					material = gtr82_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/prs/gtr82_neckhead_01_ld04`
							flags = 36
							color = red_2
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = gtr82_pguard
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/prs/prs_82_pguard`
					material = gtr82_pguard_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/prs/prs_82_pguard_dtl01`
							flags = 4
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_bridges = {
			desc_id = gtr81_bridge01
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_tophat
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_soapbar
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`black metal`
			`heavy metal`
			rock
			punk
		]
		cas_guitar_body = {
			desc_id = gtr82_prs_se1
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/prs/prs_82_prs_se1`
					material = gtr82_prs_se1_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/prs/gtr82_prs_se1_ld01`
							flags = 4
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_24fret_prs03
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d3_02`
					material = gtr_fretboard24_03_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/prs/24fret_ld81_prs_dots`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr82_neckhead01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/prs/gtr82_neckhead_01`
					material = gtr82_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/prs/gtr82_neckhead_01_ld02`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = gtr82_pguard
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/prs/prs_82_pguard`
					material = gtr82_pguard_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/prs/prs_82_pguard_dtl01`
							flags = 4
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_bridges = {
			desc_id = gtr81_bridge01
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_tophat
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_soapbar
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`glam rock`
		]
		cas_guitar_body = {
			desc_id = gtr84_mm_petrucci
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/mm/gtr84_mm_petrucci`
					material = gtr84_mm_pet_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/mm/gtr84_mm_dtl01`
							flags = 4
							color = yellow_1guitar
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_mm01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d_01`
					material = gtr_fretboard_01_primary
					diffuse
					pre_layer = [
						{
							color = grey_5
							texture = `tex/models/characters/layers/cag/mm/gtr84_mminlaypet22b`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr84_neckhead01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/mm/gtr84_neckhead01`
					material = gtr84_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/mm/gtr84_nekhed_dtl04`
							flags = 36
							color = yellow_1guitar
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr84_whammy
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_mm01
		}
		cas_guitar_pickups = {
			desc_id = gtr84_pickup_a
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = gtr_misc_switch4
		}
	}
	{
		genre = [
			`classic rock`
		]
		cas_guitar_body = {
			desc_id = gtr70_sch_ultra
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/schecter/gtr70_sch_ultra_d`
					material = gtr70_sch_ultra_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/schecter/gtr70_sch_ultra_ld02`
							flags = 4
							color = navy_1
						}
					]
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							x_trans = -16
							y_trans = -1
							x_skew = 0
							x_scale = 21
							y_scale = 131
							rot = 0
							flags = 259
							color = grey_5guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
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
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
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
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							x_trans = -19
							y_trans = -1
							x_skew = -3
							x_scale = 16
							y_scale = 131
							rot = 1603
							flags = 259
							color = grey_5guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = red_2
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
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 100
							x_trans = -16
							y_trans = -4
							x_skew = 0
							x_scale = 10
							y_scale = 131
							rot = 2023
							flags = 259
							color = red_2
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							x_trans = -19
							y_trans = -1
							x_skew = -3
							x_scale = 16
							y_scale = 59
							rot = 1603
							flags = 259
							color = grey_5guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = grey_5guitar
							x_trans = -16
							x_skew = 0
							x_scale = 21
							y_scale = 25
							rot = 0
							flags = 259
							y_trans = -3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = red_2
							x_trans = -16
							y_trans = -1
							x_skew = 0
							y_scale = 131
							rot = 0
							flags = 259
							x_scale = 13
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = red_2
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
		cas_guitar_neck = {
			desc_id = cag_24fret_schecter02
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d2_02`
					material = gtr_fretboard24_02_primary
					diffuse
					pre_layer = [
						{
							color = grey_2
							texture = `tex/models/characters/layers/cag/gh5/24fret_ld01_hero_dots`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr70_neckhead
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/schecter/gtr70_neckhead_d`
					material = gtr70_neckhead_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/schecter/gtr70_neckhead_ld02`
							flags = 36
							color = navy_1
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr71_bridge
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_type2_paf1
			chosen_materials = {
				material1 = grey_5guitar
			}
		}
		cas_guitar_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`heavy metal`
			punk
			rock
		]
		cas_guitar_body = {
			desc_id = gtr73_sch_s1
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/schecter/gtr73_sch_s1_d`
					material = gtr73_sch_s1_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/schecter/gtr73_sch_s1_ld02`
							flags = 4
						}
						{
							texture = `tex/models/characters/layers/cag/schecter/gtr73_sch_s1_dtl03`
							flags = 4
							color = orange_3
						}
					]
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon021`
							color = orange_3
							x_trans = -3
							x_scale = 8
							y_scale = 12
							rot = 1603
							flags = 259
							y_trans = 28
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon021`
							color = orange_3
							x_trans = -3
							x_scale = 8
							y_scale = 12
							rot = 1603
							flags = 259
							y_trans = 7
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon021`
							color = orange_3
							y_trans = -18
							x_scale = 8
							y_scale = 12
							rot = 1603
							flags = 259
							x_trans = -3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon021`
							color = orange_3
							x_trans = -15
							x_scale = 8
							y_scale = 12
							rot = 1603
							flags = 259
							y_trans = -42
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon021`
							color = orange_3
							x_trans = -15
							x_scale = 8
							y_scale = 12
							rot = 1603
							flags = 259
							y_trans = -18
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon021`
							color = orange_3
							x_trans = -15
							x_scale = 8
							y_scale = 12
							rot = 1603
							flags = 259
							y_trans = 6
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon021`
							color = orange_3
							y_trans = 29
							x_scale = 8
							y_scale = 12
							rot = 1603
							flags = 259
							x_trans = -15
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon021`
							color = orange_3
							x_trans = -29
							x_scale = 8
							y_scale = 12
							rot = 1603
							flags = 259
							y_trans = 29
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon021`
							color = orange_3
							x_trans = -29
							x_scale = 8
							y_scale = 12
							rot = 1603
							flags = 259
							y_trans = 6
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon021`
							color = orange_3
							y_trans = -17
							x_scale = 8
							y_scale = 12
							rot = 1603
							flags = 259
							x_trans = -29
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon021`
							color = orange_3
							y_trans = -41
							x_scale = 8
							y_scale = 12
							rot = 1603
							flags = 259
							x_trans = -29
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon021`
							color = orange_3
							x_trans = -42
							x_scale = 8
							y_scale = 12
							rot = 1603
							flags = 259
							y_trans = -41
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon021`
							color = orange_3
							x_trans = -42
							x_scale = 8
							y_scale = 12
							rot = 1603
							flags = 259
							y_trans = -17
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon021`
							color = orange_3
							x_trans = -42
							x_scale = 8
							y_scale = 12
							rot = 1603
							flags = 259
							y_trans = 7
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon021`
							color = orange_3
							y_trans = 30
							x_scale = 8
							y_scale = 12
							rot = 1603
							flags = 259
							x_trans = -42
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = orange_3
							x_trans = -23
							x_scale = 1
							y_scale = 104
							rot = 1603
							flags = 259
							y_trans = -31
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = orange_3
							x_trans = -23
							x_scale = 1
							y_scale = 104
							rot = 1603
							flags = 259
							y_trans = -7
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = orange_3
							x_trans = -23
							x_scale = 1
							y_scale = 104
							rot = 1603
							flags = 259
							y_trans = 43
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = orange_3
							x_trans = -23
							y_trans = 18
							x_scale = 1
							rot = 1603
							flags = 259
							y_scale = 104
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = orange_3
							x_trans = -9
							y_trans = 1
							y_scale = 1
							rot = 1603
							flags = 259
							x_scale = 64
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = orange_3
							y_trans = 2
							x_scale = 64
							y_scale = 1
							rot = 1603
							flags = 259
							x_trans = -22
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = orange_3
							x_trans = -36
							y_trans = 2
							y_scale = 1
							rot = 1603
							flags = 259
							x_scale = 64
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							x_trans = -9
							y_trans = -8
							x_scale = 4
							y_scale = 7
							rot = 1603
							flags = 259
							color = orange_3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = orange_3
							y_trans = 17
							x_scale = 4
							y_scale = 7
							rot = 1603
							flags = 259
							x_trans = -9
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = orange_3
							x_trans = -22
							x_scale = 4
							y_scale = 7
							rot = 1603
							flags = 259
							y_trans = 18
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = orange_3
							x_trans = -22
							x_scale = 4
							y_scale = 7
							rot = 1603
							flags = 259
							y_trans = -7
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = orange_3
							x_trans = -22
							x_scale = 4
							y_scale = 7
							rot = 1603
							flags = 259
							y_trans = -31
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = orange_3
							x_trans = -36
							x_scale = 4
							y_scale = 7
							rot = 1603
							flags = 259
							y_trans = -30
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = orange_3
							x_trans = -36
							x_scale = 4
							y_scale = 7
							rot = 1603
							flags = 259
							y_trans = -5
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = orange_3
							x_trans = -36
							x_scale = 4
							y_scale = 7
							rot = 1603
							flags = 259
							y_trans = 19
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							x_trans = -9
							y_trans = -8
							x_scale = 2
							y_scale = 3
							rot = 1603
							flags = 259
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = black_1guitar
							x_trans = -9
							x_scale = 2
							y_scale = 3
							rot = 1603
							flags = 259
							y_trans = 17
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = black_1guitar
							x_trans = -22
							x_scale = 2
							y_scale = 3
							rot = 1603
							flags = 259
							y_trans = 18
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = black_1guitar
							x_trans = -36
							x_scale = 2
							y_scale = 3
							rot = 1603
							flags = 259
							y_trans = 19
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = black_1guitar
							x_trans = -36
							x_scale = 2
							y_scale = 3
							rot = 1603
							flags = 259
							y_trans = -5
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = black_1guitar
							x_trans = -36
							x_scale = 2
							y_scale = 3
							rot = 1603
							flags = 259
							y_trans = -30
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = black_1guitar
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
		cas_guitar_neck = {
			desc_id = cag_24fret_schecter04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
					material = gtr_fretboard24_04_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/24fret_ld01_hero_dots`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr73_neckhead_01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/schecter/gtr73_neckhead_d`
					material = gtr73_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/schecter/gtr73_neckhead_ld02`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr72_bridge
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01c
		}
		cas_guitar_pickups = {
			desc_id = gtr_emg_pickup2
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = gtr_misc_switch4
		}
	}
	{
		genre = [
			`black metal`
			`heavy metal`
			rock
			goth
		]
		cas_guitar_body = {
			desc_id = gtr1_sch_tempest
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/schecter/gtr1_sch_tempest_body_d`
					material = gtr1_sch_tempest_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/schecter/gtr1_sch_tempest_body_ld1`
							flags = 4
						}
						{
							texture = `tex/models/characters/layers/cag/schecter/gtr1_sch_tempest_dtl_1`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_schecter03
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d3_01`
					material = gtr_fretboard_03_primary
					diffuse
					pre_layer = [
						{
							color = grey_5
							texture = `tex/models/characters/layers/cag/gh5/22_fret_ld40_shctr_hollywood`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr1_sch_neckhead_1
			chosen_materials = {
				material1 = grey_2guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/schecter/gtr1_sch_neckhead_d_01`
					material = gtr1_sch_neckhead_1_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/schecter/gtr1_sch_neckhead_ld_1`
							flags = 36
						}
						{
							texture = `tex/models/characters/layers/cag/schecter/gtr1_sch_neckhead_dtl_2`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = gtr1_sch_pickguard_01
		}
		cas_guitar_bridges = {
			desc_id = gtr71_bridge
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_sd06
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = gtr_misc_switch4
		}
	}
	{
		genre = [
			rock
		]
		cas_guitar_body = {
			desc_id = gtr1_sch_tempest
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/schecter/gtr1_sch_tempest_body_d`
					material = gtr1_sch_tempest_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/schecter/gtr1_sch_tempest_body_ld2`
							flags = 4
							color = red_1
						}
						{
							texture = `tex/models/characters/layers/cag/schecter/gtr1_sch_tempest_dtl_1`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_schecter04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
					material = gtr_fretboard_04_primary
					diffuse
					pre_layer = [
						{
							color = grey_5
							texture = `tex/models/characters/layers/cag/gh5/22_fret_ld39_shctr_hellraiser`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr1_sch_neckhead_1
			chosen_materials = {
				material1 = grey_2guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/schecter/gtr1_sch_neckhead_d_01`
					material = gtr1_sch_neckhead_1_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/schecter/gtr1_sch_neckhead_ld_3`
							flags = 36
							color = red_1
						}
						{
							texture = `tex/models/characters/layers/cag/schecter/gtr1_sch_neckhead_dtl_2`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = gtr1_sch_pickguard_01
		}
		cas_guitar_bridges = {
			desc_id = gtr71_bridge
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr_emg_pickup2
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = gtr_misc_switch4
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
	}
	{
		genre = [
			rock
		]
		cas_guitar_body = {
			desc_id = gtr70_sch_ultra
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/schecter/gtr70_sch_ultra_d`
					material = gtr70_sch_ultra_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/schecter/gtr70_sch_ultra_ld08`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_schecter04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
					material = gtr_fretboard_04_primary
					diffuse
					pre_layer = [
						{
							color = grey_5
							texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr70_neckhead
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/schecter/gtr70_neckhead_d`
					material = gtr70_neckhead_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/schecter/gtr70_neckhead_ld07`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr70_bridge
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01
		}
		cas_guitar_pickups = {
			desc_id = gtr70_sch_ultra_pickup
		}
		cas_guitar_misc = {
			desc_id = gtr_misc_switch4
		}
	}
	{
		genre = [
			pop
			`classic rock`
		]
		cas_guitar_body = {
			desc_id = gtr70_sch_ultra
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/schecter/gtr70_sch_ultra_d`
					material = gtr70_sch_ultra_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/schecter/gtr70_sch_ultra_ld03`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_schecter04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
					material = gtr_fretboard_04_primary
					diffuse
					pre_layer = [
						{
							color = grey_5
							texture = `tex/models/characters/layers/cag/gh5/22_fret_ld44_shctr_blocks`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr70_neckhead
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/schecter/gtr70_neckhead_d`
					material = gtr70_neckhead_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/schecter/gtr70_neckhead_ld04`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = gtr70_pg
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/schecter/gtr70_pg_d`
					material = gtr70_pg_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/schecter/gtr70_pg_ld02`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_bridges = {
			desc_id = gtr70_bridge
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_02
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr70_sch_ultra_pickup3
		}
		cas_guitar_misc = {
			desc_id = gtr_misc_switch4
		}
	}
	{
		genre = [
			`heavy metal`
			goth
		]
		cas_guitar_body = {
			desc_id = gtr71_sch_c1
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/schecter/gtr71_sch_c1_d`
					material = gtr71_sch_c1_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/schecter/gtr71_sch_c1_ld05`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_24fret_schecter04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
					material = gtr_fretboard24_04_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/24fret_ld46_shctr_cutblock`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr71_neckhead_01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/schecter/gtr71_neckhead_01_d`
					material = gtr71_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/schecter/gtr71_neckhead_01_ld05`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr71_bridge
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01
		}
		cas_guitar_pickups = {
			desc_id = gtr70_sch_ultra_pickup
		}
		cas_guitar_misc = {
			desc_id = gtr_misc_switch4
		}
	}
	{
		genre = [
			`heavy metal`
			goth
			punk
		]
		cas_guitar_body = {
			desc_id = gtr71_sch_c1
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/schecter/gtr71_sch_c1_d`
					material = gtr71_sch_c1_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/schecter/gtr71_sch_c1_ld01`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_24fret_schecter04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
					material = gtr_fretboard24_04_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/24fret_ld42_shctr_ultracure`
							flags = 36
							color = red_1
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr71_neckhead_01
			chosen_materials = {
				material1 = grey_2guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/schecter/gtr71_neckhead_01_d`
					material = gtr71_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/schecter/gtr71_neckhead_01_ld01`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr71_bridge
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01c
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr_emg_pickup2
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = gtr_misc_switch4
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
	}
	{
		genre = [
			`heavy metal`
			goth
			punk
		]
		cas_guitar_body = {
			desc_id = gtr71_sch_c1
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/schecter/gtr71_sch_c1_d`
					material = gtr71_sch_c1_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/schecter/gtr71_sch_c1_ld02`
							flags = 4
						}
						{
							texture = `tex/models/characters/layers/cag/schecter/gtr71_sch_c1_dtl02`
							flags = 4
							color = red_1
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_24fret_schecter04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
					material = gtr_fretboard24_04_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/24fret_ld35_shctr_shedevil`
							flags = 36
							color = red_1
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr71_neckhead_01
			chosen_materials = {
				material1 = grey_2guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/schecter/gtr71_neckhead_01_d`
					material = gtr71_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/schecter/gtr71_neckhead_01_ld02`
							flags = 36
						}
						{
							texture = `tex/models/characters/layers/cag/schecter/gtr71_neckhead_01_dtl02`
							flags = 36
							color = red_1
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr71_bridge
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01c
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr_emg_pickup2
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = gtr_misc_switch4
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
	}
	{
		genre = [
			`glam rock`
			pop
		]
		cas_guitar_body = {
			desc_id = gtr71_sch_c1
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/schecter/gtr71_sch_c1_d`
					material = gtr71_sch_c1_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/schecter/gtr71_sch_c1_ld02`
							flags = 4
							color = red_1
						}
						{
							texture = `tex/models/characters/layers/cag/all_clear2`
							flags = 4
						}
						{
							texture = `tex/models/characters/layers/cag/schecter/gtr71_sch_c1_dtl02`
							flags = 4
							color = red_1
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_24fret_schecter04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
					material = gtr_fretboard24_04_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/24fret_ld34_shctr_ladyluck`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr71_neckhead_01
			chosen_materials = {
				material1 = grey_2guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/schecter/gtr71_neckhead_01_d`
					material = gtr71_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/schecter/gtr71_neckhead_01_ld02`
							flags = 36
							color = red_1
						}
						{
							texture = `tex/models/characters/layers/cag/all_clear2`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr71_bridge
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_01c
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr_emg_pickup5
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = gtr_misc_switch4
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
	}
	{
		genre = [
			punk
			pop
		]
		cas_guitar_body = {
			desc_id = gtr73_sch_s1
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/schecter/gtr73_sch_s1_d`
					material = gtr73_sch_s1_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/schecter/gtr73_sch_s1_ld02`
							flags = 4
							color = grey_5guitar
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_schecter04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
					material = gtr_fretboard_04_primary
					diffuse
					pre_layer = [
						{
							color = grey_5
							texture = `tex/models/characters/layers/cag/gh5/22_fret_ld45_shctr_tempest`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr73_neckhead_01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/schecter/gtr73_neckhead_d`
					material = gtr73_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/schecter/gtr73_neckhead_ld02`
							flags = 36
							color = grey_5guitar
						}
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/schecter/gtr73_neckhead_ld03`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = gtr73_pg1
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/schecter/gtr73_pg1_d`
					material = gtr73_pg1_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/schecter/gtr73_pg1_ld01`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_bridges = {
			desc_id = gtr_bridge_01
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_04c
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_type2_paf1
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = gtr_misc_switch4
		}
	}
	{
		genre = [
			punk
		]
		cas_guitar_body = {
			desc_id = gtr73_sch_s1
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/schecter/gtr73_sch_s1_d`
					material = gtr73_sch_s1_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/schecter/gtr73_sch_s1_ld01`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_schecter04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
					material = gtr_fretboard_04_primary
					diffuse
					pre_layer = [
						{
							color = grey_5
							texture = `tex/models/characters/layers/cag/gh5/22_fret_ld45_shctr_tempest`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr73_neckhead_01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/schecter/gtr73_neckhead_d`
					material = gtr73_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/schecter/gtr73_neckhead_ld01`
							flags = 36
						}
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cag/schecter/gtr73_neckhead_ld03`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = gtr73_pg1
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/schecter/gtr73_pg1_d`
					material = gtr73_pg1_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/schecter/gtr73_pg1_ld01`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_bridges = {
			desc_id = gtr_bridge_01
		}
		cas_guitar_knobs = {
			desc_id = gtr_knob_04c
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_type2_paf1
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_misc = {
			desc_id = gtr_misc_switch4
		}
	}
]
cas_preset_basses = [
	{
		genre = [
			`glam rock`
		]
		cas_bass_body = {
			desc_id = bass14_esp_surveyor
			cap = [
				{
					base_tex = `tex\models\car_instruments\bass\esp\bass14_esp_surveyor_d`
					material = bass14_esp_surveyor_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/esp/bass14_esp_ax_ld_01`
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/layers/cab/esp/bass14_esp_ax_dtl_11`
							flags = 4
							color = yellow_1guitar
						}
					]
				}
			]
		}
		cas_bass_neck = {
			desc_id = bass_fretboard_22a
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_02`
					material = bass_fretboard_22a_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/esp/bass_fretboard_inlay_06`
							flags = 4
							color = grey_5guitar
						}
					]
				}
			]
		}
		cas_bass_head = {
			desc_id = bass14_neckhead_04
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass9_neckhead_d_04`
					material = bass14_neckhead_04_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cab/esp/bass9_neckhead4_ld_01`
							flags = 36
						}
					]
				}
			]
		}
		cas_bass_pickguards = {
			desc_id = none
		}
		cas_bass_pickups = {
			desc_id = bass9_pkup_type1_blk_02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_bass_bridges = {
			desc_id = bass14_bridge_4str_01
		}
		cas_bass_knobs = {
			desc_id = bass14_esp_knob_10_04
		}
		cas_bass_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			goth
			`black metal`
		]
		cas_bass_body = {
			desc_id = bass63_ex
			cap = [
				{
					base_tex = `tex\models\car_instruments\bass\esp\bass63_ex_d`
					material = bass63_ex_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cab/esp/bass63_ex_ld_01`
							flags = 4
						}
						{
							texture = `tex/models/characters/layers/cab/esp/bass63_ex_dtl_11`
							a = 25
							flags = 4
							color = red_1
						}
					]
				}
			]
		}
		cas_bass_neck = {
			desc_id = bass_fretboard_22d
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_05`
					material = bass_fretboard_22d_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/esp/bass_fretboard_inlay_06`
							flags = 4
							color = grey_5guitar
						}
					]
				}
			]
		}
		cas_bass_head = {
			desc_id = bass63_neckhead
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass63_neckhead_d`
					material = bass63_neckhead_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cab/esp/bass63_neckhead_ld_01`
							flags = 36
						}
					]
				}
			]
		}
		cas_bass_pickguards = {
			desc_id = none
		}
		cas_bass_pickups = {
			desc_id = bass9_pkup_type1_blk_02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_bass_bridges = {
			desc_id = bass17_bridge_4str_05
		}
		cas_bass_knobs = {
			desc_id = bass63_knob_type1
		}
		cas_bass_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			pop
			`glam rock`
		]
		cas_bass_body = {
			desc_id = bass63_ex
			cap = [
				{
					base_tex = `tex\models\car_instruments\bass\esp\bass63_ex_d`
					material = bass63_ex_primary
					diffuse
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							color = violet_2
							y_trans = -38
							x_scale = 2
							y_scale = 3
							rot = 5923
							flags = 3
							x_trans = 8
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							color = purple_blue_2
							y_trans = -36
							x_scale = 2
							y_scale = 3
							rot = 5923
							flags = 3
							x_trans = 6
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = 5
							y_trans = -30
							x_scale = 2
							y_scale = 3
							rot = 5923
							flags = 3
							color = purple_blue_2
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							color = navy_3
							y_trans = -31
							x_scale = 2
							y_scale = 3
							rot = 5923
							flags = 3
							x_trans = 3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							color = blue_3
							x_trans = 0
							x_scale = 2
							y_scale = 3
							rot = 5923
							flags = 3
							y_trans = -23
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							color = teal_3
							x_trans = -2
							y_trans = -27
							x_scale = 2
							y_scale = 3
							flags = 3
							rot = 5923
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = -3
							y_trans = -21
							x_scale = 2
							y_scale = 3
							rot = 6193
							flags = 3
							color = teal_3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							color = green_3guitar
							y_trans = -16
							x_scale = 2
							y_scale = 3
							rot = 133
							flags = 3
							x_trans = -6
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							color = green_3guitar
							y_trans = 7
							x_scale = 2
							y_scale = 3
							rot = 133
							flags = 3
							x_trans = -4
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							color = green_3guitar
							x_trans = -5
							y_trans = 11
							x_scale = 2
							y_scale = 3
							flags = 3
							rot = 133
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = -6
							y_trans = 6
							x_scale = 2
							y_scale = 3
							rot = 433
							flags = 3
							color = green_3guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							color = yellow_green_1guitar
							y_trans = -12
							x_scale = 2
							y_scale = 3
							rot = 433
							flags = 3
							x_trans = -8
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							color = yellow_green_1guitar
							y_trans = -17
							x_scale = 2
							y_scale = 3
							rot = 433
							flags = 3
							x_trans = -9
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							color = yellow_green_1guitar
							x_trans = -9
							x_scale = 2
							y_scale = 3
							rot = 433
							flags = 3
							y_trans = -21
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							color = yellow_2guitar
							x_trans = -12
							y_trans = -19
							x_scale = 2
							rot = 433
							flags = 3
							y_scale = 3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							color = yellow_2guitar
							y_trans = -15
							x_scale = 2
							y_scale = 4
							rot = 433
							flags = 3
							x_trans = -10
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = -9
							y_trans = -7
							x_scale = 4
							y_scale = 6
							rot = 433
							flags = 3
							color = yellow_2guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							color = yellow_orange_2
							y_trans = 10
							x_scale = 4
							y_scale = 6
							rot = 433
							flags = 3
							x_trans = -8
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = -8
							y_trans = 1
							x_scale = 4
							y_scale = 6
							rot = 793
							flags = 3
							color = yellow_orange_2
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = -11
							y_trans = 7
							x_scale = 4
							y_scale = 6
							rot = 1093
							flags = 3
							color = orange_3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = -14
							y_trans = -7
							x_scale = 4
							y_scale = 6
							rot = 1633
							flags = 3
							color = red_orange_4
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = -15
							y_trans = -14
							x_scale = 4
							y_scale = 6
							rot = 1633
							flags = 3
							color = red_orange_5
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							color = red_orange_3
							y_trans = -11
							x_scale = 4
							y_scale = 6
							rot = 2263
							flags = 3
							x_trans = -19
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = -15
							y_trans = 2
							x_scale = 4
							y_scale = 6
							rot = 2263
							flags = 3
							color = red_orange_3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							color = red_1
							y_trans = 9
							x_scale = 4
							y_scale = 6
							rot = 2803
							flags = 3
							x_trans = -17
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = -19
							y_trans = 5
							x_scale = 5
							y_scale = 6
							rot = 3193
							flags = 3
							color = red_3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = -18
							y_trans = -4
							x_scale = 5
							y_scale = 6
							rot = 3193
							flags = 3
							color = red_4
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = -24
							y_trans = -9
							x_scale = 5
							y_scale = 6
							rot = 3553
							flags = 3
							color = red_3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = -23
							y_trans = 4
							x_scale = 5
							y_scale = 6
							rot = 4033
							flags = 3
							color = violet_1
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = -20
							y_trans = 11
							x_scale = 5
							y_scale = 6
							rot = 4393
							flags = 3
							color = violet_3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = -25
							y_trans = 20
							x_scale = 7
							y_scale = 8
							rot = 4663
							flags = 3
							color = purple_blue_1
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = -26
							y_trans = 3
							x_scale = 7
							y_scale = 8
							rot = 5143
							flags = 3
							color = purple_blue_4
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = -25
							y_trans = 12
							x_scale = 7
							y_scale = 8
							rot = 5743
							flags = 3
							color = navy_4
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = -35
							y_trans = 3
							x_scale = 7
							y_scale = 8
							rot = 13
							flags = 3
							color = blue_2
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = -32
							y_trans = 10
							x_scale = 7
							y_scale = 12
							rot = 433
							flags = 3
							color = teal_3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = -30
							y_trans = 16
							x_scale = 7
							y_scale = 12
							rot = 943
							flags = 3
							color = green_3guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = -32
							y_trans = 27
							x_scale = 10
							y_scale = 15
							rot = 1393
							flags = 3
							color = green_2guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = -36
							y_trans = 22
							x_scale = 13
							y_scale = 18
							rot = 2173
							flags = 3
							color = yellow_green_2guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
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
							texture = `tex/models/characters/layers/cab/esp/bass63_ex_ld_01`
							flags = 4
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/layers/cag/all_clear2`
							flags = 4
						}
					]
				}
			]
		}
		cas_bass_neck = {
			desc_id = bass_fretboard_24d
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
					material = bass_fretboard_24d_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/esp/bass_fretboard_24_inlay_05`
							flags = 4
							color = grey_5guitar
						}
					]
				}
			]
		}
		cas_bass_head = {
			desc_id = bass63_neckhead
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass63_neckhead_d`
					material = bass63_neckhead_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/esp/bass63_neckhead_ld_01`
							flags = 36
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_bass_pickguards = {
			desc_id = none
		}
		cas_bass_pickups = {
			desc_id = bass9_pkup_type1_blk_02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_bass_bridges = {
			desc_id = bass17_bridge_4str_05
		}
		cas_bass_knobs = {
			desc_id = bass63_knob_type1
		}
		cas_bass_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			pop
			`glam rock`
		]
		cas_bass_body = {
			desc_id = bass63_ex
			cap = [
				{
					base_tex = `tex\models\car_instruments\bass\esp\bass63_ex_d`
					material = bass63_ex_primary
					diffuse
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							color = violet_2
							y_trans = -38
							x_scale = 2
							y_scale = 3
							rot = 5923
							flags = 3
							x_trans = 8
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							color = purple_blue_2
							y_trans = -36
							x_scale = 2
							y_scale = 3
							rot = 5923
							flags = 3
							x_trans = 6
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = 5
							y_trans = -30
							x_scale = 2
							y_scale = 3
							rot = 5923
							flags = 3
							color = purple_blue_2
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							color = navy_3
							y_trans = -31
							x_scale = 2
							y_scale = 3
							rot = 5923
							flags = 3
							x_trans = 3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							color = blue_3
							x_trans = 0
							x_scale = 2
							y_scale = 3
							rot = 5923
							flags = 3
							y_trans = -23
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							color = teal_3
							x_trans = -2
							y_trans = -27
							x_scale = 2
							y_scale = 3
							flags = 3
							rot = 5923
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = -3
							y_trans = -21
							x_scale = 2
							y_scale = 3
							rot = 6193
							flags = 3
							color = teal_3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							color = green_3guitar
							y_trans = -16
							x_scale = 2
							y_scale = 3
							rot = 133
							flags = 3
							x_trans = -6
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							color = green_3guitar
							y_trans = 7
							x_scale = 2
							y_scale = 3
							rot = 133
							flags = 3
							x_trans = -4
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							color = green_3guitar
							x_trans = -5
							y_trans = 11
							x_scale = 2
							y_scale = 3
							flags = 3
							rot = 133
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = -6
							y_trans = 6
							x_scale = 2
							y_scale = 3
							rot = 433
							flags = 3
							color = green_3guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							color = yellow_green_1guitar
							y_trans = -12
							x_scale = 2
							y_scale = 3
							rot = 433
							flags = 3
							x_trans = -8
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							color = yellow_green_1guitar
							y_trans = -17
							x_scale = 2
							y_scale = 3
							rot = 433
							flags = 3
							x_trans = -9
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							color = yellow_green_1guitar
							x_trans = -9
							x_scale = 2
							y_scale = 3
							rot = 433
							flags = 3
							y_trans = -21
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							color = yellow_2guitar
							x_trans = -12
							y_trans = -19
							x_scale = 2
							rot = 433
							flags = 3
							y_scale = 3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							color = yellow_2guitar
							y_trans = -15
							x_scale = 2
							y_scale = 4
							rot = 433
							flags = 3
							x_trans = -10
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = -9
							y_trans = -7
							x_scale = 4
							y_scale = 6
							rot = 433
							flags = 3
							color = yellow_2guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							color = yellow_orange_2
							y_trans = 10
							x_scale = 4
							y_scale = 6
							rot = 433
							flags = 3
							x_trans = -8
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = -8
							y_trans = 1
							x_scale = 4
							y_scale = 6
							rot = 793
							flags = 3
							color = yellow_orange_2
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = -11
							y_trans = 7
							x_scale = 4
							y_scale = 6
							rot = 1093
							flags = 3
							color = orange_3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = -14
							y_trans = -7
							x_scale = 4
							y_scale = 6
							rot = 1633
							flags = 3
							color = red_orange_4
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = -15
							y_trans = -14
							x_scale = 4
							y_scale = 6
							rot = 1633
							flags = 3
							color = red_orange_5
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							color = red_orange_3
							y_trans = -11
							x_scale = 4
							y_scale = 6
							rot = 2263
							flags = 3
							x_trans = -19
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = -15
							y_trans = 2
							x_scale = 4
							y_scale = 6
							rot = 2263
							flags = 3
							color = red_orange_3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							color = red_1
							y_trans = 9
							x_scale = 4
							y_scale = 6
							rot = 2803
							flags = 3
							x_trans = -17
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = -19
							y_trans = 5
							x_scale = 5
							y_scale = 6
							rot = 3193
							flags = 3
							color = red_3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = -18
							y_trans = -4
							x_scale = 5
							y_scale = 6
							rot = 3193
							flags = 3
							color = red_4
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = -24
							y_trans = -9
							x_scale = 5
							y_scale = 6
							rot = 3553
							flags = 3
							color = red_3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = -23
							y_trans = 4
							x_scale = 5
							y_scale = 6
							rot = 4033
							flags = 3
							color = violet_1
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = -20
							y_trans = 11
							x_scale = 5
							y_scale = 6
							rot = 4393
							flags = 3
							color = violet_3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = -25
							y_trans = 20
							x_scale = 7
							y_scale = 8
							rot = 4663
							flags = 3
							color = purple_blue_1
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = -26
							y_trans = 3
							x_scale = 7
							y_scale = 8
							rot = 5143
							flags = 3
							color = purple_blue_4
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = -25
							y_trans = 12
							x_scale = 7
							y_scale = 8
							rot = 5743
							flags = 3
							color = navy_4
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = -35
							y_trans = 3
							x_scale = 7
							y_scale = 8
							rot = 13
							flags = 3
							color = blue_2
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = -32
							y_trans = 10
							x_scale = 7
							y_scale = 12
							rot = 433
							flags = 3
							color = teal_3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = -30
							y_trans = 16
							x_scale = 7
							y_scale = 12
							rot = 943
							flags = 3
							color = green_3guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = -32
							y_trans = 27
							x_scale = 10
							y_scale = 15
							rot = 1393
							flags = 3
							color = green_2guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = -36
							y_trans = 22
							x_scale = 13
							y_scale = 18
							rot = 2173
							flags = 3
							color = yellow_green_2guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
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
							texture = `tex/models/characters/layers/cab/esp/bass63_ex_ld_01`
							flags = 4
							color = grey_5guitar
						}
						{
							texture = `tex/models/characters/layers/cag/all_clear2`
							flags = 4
						}
					]
				}
			]
		}
		cas_bass_neck = {
			desc_id = bass_fretboard_22b
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_03`
					material = bass_fretboard_22b_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/esp/bass_fretboard_inlay_06`
							flags = 4
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_bass_head = {
			desc_id = bass63_neckhead
		}
		cas_bass_pickguards = {
			desc_id = none
		}
		cas_bass_pickups = {
			desc_id = bass9_pkup_type1_blk_02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_bass_bridges = {
			desc_id = bass17_bridge_4str_05
		}
		cas_bass_knobs = {
			desc_id = bass63_knob_type1
		}
		cas_bass_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`glam rock`
		]
		cas_bass_body = {
			desc_id = bass63_ex
			cap = [
				{
					base_tex = `tex\models\car_instruments\bass\esp\bass63_ex_d`
					material = bass63_ex_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cab/esp/bass63_ex_ld_01`
							flags = 4
						}
						{
							texture = `tex/models/characters/layers/cag/esp/gtr63f_esp_ex_dtl_07`
							flags = 4
							color = yellow_2guitar
						}
					]
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = yellow_2guitar
							x_trans = -31
							x_scale = 7
							y_scale = 10
							rot = 390
							flags = 259
							y_trans = 24
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = yellow_2guitar
							x_trans = -25
							x_scale = 7
							y_scale = 10
							rot = 390
							flags = 259
							y_trans = 16
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = yellow_2guitar
							x_trans = -42
							y_trans = 38
							y_scale = 10
							rot = 390
							flags = 259
							x_scale = 26
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = yellow_2guitar
							x_trans = -19
							x_scale = 7
							y_scale = 10
							rot = 390
							flags = 259
							y_trans = 9
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = yellow_2guitar
							x_trans = -13
							x_scale = 7
							y_scale = 10
							rot = 6163
							flags = 259
							y_trans = 6
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = yellow_2guitar
							y_trans = 7
							x_scale = 7
							y_scale = 10
							rot = 6163
							flags = 259
							x_trans = -7
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = yellow_2guitar
							y_trans = 8
							x_scale = 7
							y_scale = 10
							rot = 6163
							flags = 259
							x_trans = -1
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = yellow_2guitar
							x_trans = 5
							x_scale = 7
							y_scale = 10
							rot = 180
							flags = 259
							y_trans = -32
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = yellow_2guitar
							x_trans = -1
							x_scale = 7
							y_scale = 10
							rot = 180
							flags = 259
							y_trans = -27
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = yellow_2guitar
							y_trans = -23
							x_scale = 7
							y_scale = 10
							rot = 180
							flags = 259
							x_trans = -7
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = yellow_2guitar
							x_trans = -13
							x_scale = 7
							y_scale = 10
							rot = 180
							flags = 259
							y_trans = -19
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = yellow_2guitar
							x_trans = -19
							x_scale = 7
							y_scale = 10
							rot = 5773
							flags = 259
							y_trans = -21
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = yellow_2guitar
							y_trans = -27
							x_scale = 7
							y_scale = 10
							rot = 5773
							flags = 259
							x_trans = -25
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = yellow_2guitar
							y_trans = -19
							x_scale = 7
							y_scale = 10
							rot = 1033
							flags = 259
							x_trans = -32
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							x_trans = -35
							y_trans = -1
							x_scale = 7
							y_scale = 10
							rot = 1033
							flags = 259
							color = yellow_2guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = yellow_2guitar
							y_trans = 17
							x_scale = 7
							y_scale = 10
							rot = 1033
							flags = 259
							x_trans = -38
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = yellow_2guitar
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
		cas_bass_neck = {
			desc_id = bass_fretboard_22d
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_05`
					material = bass_fretboard_22d_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/esp/bass_fretboard_inlay_06`
							flags = 4
							color = grey_5guitar
						}
					]
				}
			]
		}
		cas_bass_head = {
			desc_id = bass63_neckhead
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass63_neckhead_d`
					material = bass63_neckhead_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cab/esp/bass63_neckhead_ld_01`
							flags = 36
						}
					]
				}
			]
		}
		cas_bass_pickguards = {
			desc_id = none
		}
		cas_bass_pickups = {
			desc_id = bass9_pkup_type1_blk_02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_bass_bridges = {
			desc_id = bass17_bridge_4str_05
		}
		cas_bass_knobs = {
			desc_id = bass63_knob_type1
		}
		cas_bass_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			pop
			`glam rock`
		]
		cas_bass_body = {
			desc_id = bass17_esp_ec_01
			cap = [
				{
					base_tex = `tex\models\car_instruments\bass\esp\bass17_esp_ec_d`
					material = bass17_esp_ec_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/esp/bass17_esp_ax_ld_01`
							color = violet_4
						}
					]
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 50
							x_trans = 5
							y_trans = 20
							x_scale = 4
							y_scale = 31
							rot = 2353
							flags = 259
							color = green_1guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 50
							x_trans = -4
							y_trans = 20
							x_scale = 2
							y_scale = 57
							rot = 2353
							flags = 259
							color = green_1guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 50
							x_trans = -17
							y_trans = 7
							x_scale = 1
							y_scale = 80
							rot = 2353
							flags = 259
							color = green_1guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 50
							x_trans = -13
							y_trans = 9
							x_scale = 2
							y_scale = 81
							rot = 2353
							flags = 259
							color = green_1guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 50
							x_trans = -28
							y_trans = -2
							x_scale = 2
							y_scale = 80
							rot = 2353
							flags = 259
							color = green_1guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 50
							x_trans = -26
							y_trans = 4
							x_scale = 1
							y_scale = 73
							rot = 2353
							flags = 259
							color = green_1guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 50
							x_trans = -23
							y_trans = 10
							x_scale = 4
							y_scale = 73
							rot = 2353
							flags = 259
							color = green_1guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 50
							x_trans = -34
							y_trans = -8
							x_scale = 2
							y_scale = 73
							rot = 2353
							flags = 259
							color = green_1guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 50
							x_trans = -38
							y_trans = -10
							x_scale = 1
							y_scale = 73
							rot = 2353
							flags = 259
							color = green_1guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 50
							x_trans = -42
							y_trans = -14
							x_scale = 4
							y_scale = 73
							rot = 2353
							flags = 259
							color = green_1guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 50
							x_trans = -47
							y_trans = -15
							x_scale = 1
							y_scale = 73
							rot = 2353
							flags = 259
							color = green_1guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 50
							x_trans = -29
							y_trans = -5
							x_scale = 1
							y_scale = 84
							rot = 913
							flags = 259
							color = navy_2
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 50
							x_trans = -24
							y_trans = -9
							x_scale = 4
							y_scale = 84
							rot = 913
							flags = 259
							color = navy_2
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 50
							x_trans = -17
							y_trans = -8
							x_scale = 1
							y_scale = 94
							rot = 913
							flags = 259
							color = navy_2
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 50
							x_trans = -11
							y_trans = -7
							x_scale = 3
							y_scale = 94
							rot = 913
							flags = 259
							color = navy_2
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 50
							x_trans = 3
							y_trans = -4
							x_scale = 1
							y_scale = 52
							rot = 913
							flags = 259
							color = navy_2
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 50
							x_trans = 1
							y_trans = -24
							x_scale = 3
							y_scale = 18
							rot = 913
							flags = 259
							color = navy_2
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 50
							x_trans = -31
							y_trans = 7
							x_scale = 3
							y_scale = 84
							rot = 913
							flags = 259
							color = navy_2
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 50
							x_trans = -37
							y_trans = 22
							x_scale = 1
							y_scale = 72
							rot = 913
							flags = 259
							color = navy_2
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 50
							x_trans = -37
							y_trans = 35
							x_scale = 3
							y_scale = 72
							rot = 913
							flags = 259
							color = navy_2
						}
					]
				}
			]
		}
		cas_bass_neck = {
			desc_id = bass_fretboard_24d
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
					material = bass_fretboard_24d_primary
					diffuse
					pre_layer = [
						{
							color = grey_4
							texture = `tex/models/characters/layers/cab/esp/bass_fretboard_24_inlay_01`
							flags = 4
						}
					]
				}
			]
		}
		cas_bass_head = {
			desc_id = bass14_neckhead_03
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass9_neckhead_d_03`
					material = bass14_neckhead_03_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/esp/bass9_neckhead3_ld_01`
							flags = 36
							color = violet_4
						}
					]
				}
			]
		}
		cas_bass_pickguards = {
			desc_id = none
		}
		cas_bass_pickups = {
			desc_id = bass9_pkup_type1_blk_02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_bass_bridges = {
			desc_id = bass17_bridge_4str_04
		}
		cas_bass_knobs = {
			desc_id = bass17_esp_knob_10
		}
		cas_bass_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			pop
			punk
			rock
		]
		cas_bass_body = {
			desc_id = bass17_esp_ec_01
			cap = [
				{
					base_tex = `tex\models\car_instruments\bass\esp\bass17_esp_ec_d`
					material = bass17_esp_ec_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/esp/bass17_esp_ax_ld_01`
							color = black_1guitar
						}
					]
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 50
							x_trans = 5
							y_trans = 20
							x_scale = 4
							rot = 2353
							flags = 259
							y_scale = 31
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 50
							y_trans = 20
							x_scale = 1
							y_scale = 57
							rot = 2353
							flags = 259
							x_trans = 0
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 50
							x_trans = -4
							x_scale = 2
							y_scale = 57
							rot = 2353
							flags = 259
							y_trans = 20
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 50
							x_trans = -17
							y_trans = 7
							x_scale = 1
							rot = 2353
							flags = 259
							y_scale = 80
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 50
							x_trans = -13
							y_trans = 9
							x_scale = 2
							rot = 2353
							flags = 259
							y_scale = 81
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 50
							x_trans = -28
							y_trans = -2
							x_scale = 2
							rot = 2353
							flags = 259
							y_scale = 80
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 50
							y_trans = 4
							x_scale = 1
							y_scale = 73
							rot = 2353
							flags = 259
							x_trans = -26
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 50
							x_trans = -23
							y_trans = 10
							x_scale = 4
							rot = 2353
							flags = 259
							y_scale = 73
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 50
							y_trans = -8
							x_scale = 2
							y_scale = 73
							rot = 2353
							flags = 259
							x_trans = -34
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 50
							x_trans = -38
							x_scale = 1
							y_scale = 73
							rot = 2353
							flags = 259
							y_trans = -10
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 50
							y_trans = -14
							x_scale = 4
							y_scale = 73
							rot = 2353
							flags = 259
							x_trans = -42
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 50
							y_trans = -15
							x_scale = 1
							y_scale = 73
							rot = 2353
							flags = 259
							x_trans = -47
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 50
							x_trans = -47
							y_trans = -15
							x_scale = 1
							y_scale = 73
							rot = 2353
							flags = 259
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = violet_4
							a = 50
							x_trans = -29
							y_trans = -5
							x_scale = 1
							rot = 913
							flags = 259
							y_scale = 84
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = violet_4
							a = 50
							x_trans = -24
							x_scale = 4
							y_scale = 84
							rot = 913
							flags = 259
							y_trans = -9
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = violet_4
							a = 50
							x_trans = -17
							y_trans = -8
							x_scale = 1
							rot = 913
							flags = 259
							y_scale = 94
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = violet_4
							a = 50
							y_trans = -7
							x_scale = 3
							y_scale = 94
							rot = 913
							flags = 259
							x_trans = -11
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = violet_4
							a = 50
							y_trans = -4
							x_scale = 1
							y_scale = 52
							rot = 913
							flags = 259
							x_trans = 3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = violet_4
							a = 50
							x_trans = 1
							x_scale = 3
							y_scale = 18
							rot = 913
							flags = 259
							y_trans = -24
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = violet_4
							a = 50
							x_trans = -31
							x_scale = 3
							y_scale = 84
							rot = 913
							flags = 259
							y_trans = 7
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = violet_4
							a = 50
							y_trans = 22
							x_scale = 1
							y_scale = 72
							rot = 913
							flags = 259
							x_trans = -37
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = violet_4
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
		cas_bass_neck = {
			desc_id = bass_fretboard_24d
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
					material = bass_fretboard_24d_primary
					diffuse
					pre_layer = [
						{
							color = grey_4
							texture = `tex/models/characters/layers/cab/esp/bass_fretboard_24_inlay_01`
							flags = 4
						}
					]
				}
			]
		}
		cas_bass_head = {
			desc_id = bass14_neckhead_03
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass9_neckhead_d_03`
					material = bass14_neckhead_03_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cab/esp/bass9_neckhead3_ld_01`
							flags = 36
						}
					]
				}
			]
		}
		cas_bass_pickguards = {
			desc_id = none
		}
		cas_bass_pickups = {
			desc_id = bass9_pkup_type1_blk_02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_bass_bridges = {
			desc_id = bass17_bridge_4str_04
		}
		cas_bass_knobs = {
			desc_id = bass17_esp_knob_10
		}
		cas_bass_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			punk
			rock
		]
		cas_bass_body = {
			desc_id = bass17_esp_ec_01
			cap = [
				{
					base_tex = `tex\models\car_instruments\bass\esp\bass17_esp_ec_d`
					material = bass17_esp_ec_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/esp/bass17_esp_ax_ld_01`
							color = black_1guitar
						}
					]
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 50
							x_trans = 5
							y_trans = 20
							x_scale = 4
							rot = 2353
							flags = 259
							y_scale = 31
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 50
							y_trans = 20
							x_scale = 1
							y_scale = 57
							rot = 2353
							flags = 259
							x_trans = 0
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 50
							x_trans = -4
							x_scale = 2
							y_scale = 57
							rot = 2353
							flags = 259
							y_trans = 20
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 50
							x_trans = -17
							y_trans = 7
							x_scale = 1
							rot = 2353
							flags = 259
							y_scale = 80
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 50
							x_trans = -13
							y_trans = 9
							x_scale = 2
							rot = 2353
							flags = 259
							y_scale = 81
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 50
							x_trans = -28
							y_trans = -2
							x_scale = 2
							rot = 2353
							flags = 259
							y_scale = 80
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 50
							y_trans = 4
							x_scale = 1
							y_scale = 73
							rot = 2353
							flags = 259
							x_trans = -26
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 50
							x_trans = -23
							y_trans = 10
							x_scale = 4
							rot = 2353
							flags = 259
							y_scale = 73
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 50
							y_trans = -8
							x_scale = 2
							y_scale = 73
							rot = 2353
							flags = 259
							x_trans = -34
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 50
							x_trans = -38
							x_scale = 1
							y_scale = 73
							rot = 2353
							flags = 259
							y_trans = -10
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							a = 50
							y_trans = -14
							x_scale = 4
							y_scale = 73
							rot = 2353
							flags = 259
							x_trans = -42
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
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
		cas_bass_neck = {
			desc_id = bass_fretboard_24d
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
					material = bass_fretboard_24d_primary
					diffuse
					pre_layer = [
						{
							color = grey_4
							texture = `tex/models/characters/layers/cab/esp/bass_fretboard_24_inlay_01`
							flags = 4
						}
					]
				}
			]
		}
		cas_bass_head = {
			desc_id = bass14_neckhead_03
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass9_neckhead_d_03`
					material = bass14_neckhead_03_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cab/esp/bass9_neckhead3_ld_01`
							flags = 36
						}
					]
				}
			]
		}
		cas_bass_pickguards = {
			desc_id = none
		}
		cas_bass_pickups = {
			desc_id = bass9_pkup_type1_blk_02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_bass_bridges = {
			desc_id = bass17_bridge_4str_04
		}
		cas_bass_knobs = {
			desc_id = bass17_esp_knob_10
		}
		cas_bass_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`classic rock`
			pop
			rock
		]
		cas_bass_body = {
			desc_id = bass14_esp_surveyor
			cap = [
				{
					base_tex = `tex\models\car_instruments\bass\esp\bass14_esp_surveyor_d`
					material = bass14_esp_surveyor_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/esp/bass14_esp_ax_ld_11`
							flags = 4
							color = orange_3
						}
						{
							color = red_3
							texture = `tex/models/characters/layers/cab/esp/bass14_esp_ax_dtl_05`
							flags = 4
						}
					]
				}
			]
		}
		cas_bass_neck = {
			desc_id = bass_fretboard_22c
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_04`
					material = bass_fretboard_22c_primary
					diffuse
					pre_layer = [
						{
							color = grey_4
							texture = `tex/models/characters/layers/cab/esp/bass_fretboard_inlay_06`
							flags = 4
						}
					]
				}
			]
		}
		cas_bass_head = {
			desc_id = bass14_neckhead_04
		}
		cas_bass_pickguards = {
			desc_id = none
		}
		cas_bass_pickups = {
			desc_id = bass9_pkup_type3_blk_2
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_bass_bridges = {
			desc_id = bass14_bridge_4str_01
		}
		cas_bass_knobs = {
			desc_id = bass14_esp_knob_10_04
		}
	}
	{
		genre = [
			`heavy metal`
			`black metal`
		]
		cas_bass_body = {
			desc_id = bass9_esp_ax_01
			cap = [
				{
					base_tex = `tex\models\car_instruments\bass\esp\bass9_esp_ax_d`
					material = bass9_esp_ax_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/esp/bass9_esp_ax_ld_01`
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_bass_neck = {
			desc_id = bass_fretboard_22d
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_05`
					material = bass_fretboard_22d_primary
					diffuse
					pre_layer = [
						{
							color = grey_4
							texture = `tex/models/characters/layers/cab/esp/bass_fretboard_inlay_05`
							flags = 4
						}
					]
				}
			]
		}
		cas_bass_head = {
			desc_id = bass9_neckhead_01
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass9_neckhead_d`
					material = bass9_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cab/esp/bass9_neckhead_ld_01`
							flags = 36
						}
					]
				}
			]
		}
		cas_bass_pickguards = {
			desc_id = none
		}
		cas_bass_pickups = {
			desc_id = bass9_pkup_type1_blk_02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_bass_bridges = {
			desc_id = bass9_bridge_4str_01
		}
		cas_bass_knobs = {
			desc_id = bass9_esp_knob_10_04
		}
		cas_bass_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`heavy metal`
			goth
		]
		cas_bass_body = {
			desc_id = bass9_esp_ax_01
			cap = [
				{
					base_tex = `tex\models\car_instruments\bass\esp\bass9_esp_ax_d`
					material = bass9_esp_ax_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/esp/bass9_esp_ax_ld_01`
							color = grey_5guitar
						}
						{
							texture = `tex/models/characters/layers/cab/esp/bass9_esp_ax_dtl_04`
							flags = 4
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/layers/cab/esp/bass9_esp_ax_dtl_02`
							flags = 4
						}
					]
				}
			]
		}
		cas_bass_neck = {
			desc_id = bass_fretboard_22d
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_05`
					material = bass_fretboard_22d_primary
					diffuse
					pre_layer = [
						{
							color = grey_4
							texture = `tex/models/characters/layers/cab/esp/bass_fretboard_inlay_05`
							flags = 4
						}
					]
				}
			]
		}
		cas_bass_head = {
			desc_id = bass9_neckhead_01
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass9_neckhead_d`
					material = bass9_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cab/esp/bass9_neckhead_ld_01`
							flags = 36
						}
						{
							texture = `tex/models/characters/layers/cab/esp/bass9_neckhead_ld_02`
							flags = 36
							color = grey_5guitar
						}
						{
							texture = `tex/models/characters/layers/cab/esp/bass9_neckhead_dtl_02`
							flags = 36
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_bass_pickguards = {
			desc_id = none
		}
		cas_bass_pickups = {
			desc_id = bass9_pkup_type1_blk_02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_bass_bridges = {
			desc_id = bass9_bridge_4str_01
		}
		cas_bass_knobs = {
			desc_id = bass9_esp_knob_10_04
		}
		cas_bass_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`heavy metal`
			`black metal`
			punk
		]
		cas_bass_body = {
			desc_id = bass63_ex
			cap = [
				{
					base_tex = `tex\models\car_instruments\bass\esp\bass63_ex_d`
					material = bass63_ex_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/esp/bass63_ex_ld_12`
							flags = 4
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/layers/cab/esp/bass63_ex_dtl_13`
							flags = 4
						}
					]
				}
			]
		}
		cas_bass_neck = {
			desc_id = bass_fretboard_22a
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_02`
					material = bass_fretboard_22a_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/esp/bass_fretboard_inlay_06`
							flags = 4
							color = grey_5guitar
						}
					]
				}
			]
		}
		cas_bass_head = {
			desc_id = bass63_neckhead
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass63_neckhead_d`
					material = bass63_neckhead_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/esp/bass63_neckhead_ld_11`
							flags = 36
						}
					]
				}
			]
		}
		cas_bass_pickguards = {
			desc_id = none
		}
		cas_bass_pickups = {
			desc_id = bass9_pkup_type1_blk_02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_bass_bridges = {
			desc_id = bass17_bridge_4str_05
		}
		cas_bass_knobs = {
			desc_id = bass63_knob_type1
		}
		cas_bass_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			goth
		]
		cas_bass_body = {
			desc_id = bass9_esp_ax_01
			cap = [
				{
					base_tex = `tex\models\car_instruments\bass\esp\bass9_esp_ax_d`
					material = bass9_esp_ax_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/esp/bass9_esp_ax_ld_01`
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/layers/cab/esp/bass9_esp_ax_dtl_01`
							flags = 4
							color = violet_1
						}
					]
				}
			]
		}
		cas_bass_neck = {
			desc_id = bass_fretboard_24d
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
					material = bass_fretboard_24d_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/esp/bass_fretboard_24_inlay_05`
							flags = 4
							color = violet_2
						}
					]
				}
			]
		}
		cas_bass_head = {
			desc_id = bass9_neckhead_01
			chosen_materials = {
				material1 = violet_1
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass9_neckhead_d`
					material = bass9_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cab/esp/bass9_neckhead_ld_01`
							flags = 36
						}
					]
				}
			]
		}
		cas_bass_pickguards = {
			desc_id = none
		}
		cas_bass_pickups = {
			desc_id = bass9_pkup_type1_blk_02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_bass_bridges = {
			desc_id = bass9_bridge_4str_01
			chosen_materials = {
				material1 = violet_1
			}
		}
		cas_bass_knobs = {
			desc_id = bass9_esp_knob_10_04
			chosen_materials = {
				material1 = violet_1
			}
		}
		cas_bass_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			goth
		]
		cas_bass_body = {
			desc_id = bass63_ex
			cap = [
				{
					base_tex = `tex\models\car_instruments\bass\esp\bass63_ex_d`
					material = bass63_ex_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/esp/bass63_ex_ld_01`
							flags = 4
							color = grey_5guitar
						}
						{
							texture = `tex/models/characters/layers/cab/esp/bass63_ex_dtl_02`
							flags = 4
							color = navy_1
						}
					]
				}
			]
		}
		cas_bass_neck = {
			desc_id = bass_fretboard_24d
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
					material = bass_fretboard_24d_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/esp/bass_fretboard_24_inlay_05`
							flags = 4
							color = grey_5guitar
						}
					]
				}
			]
		}
		cas_bass_head = {
			desc_id = bass63_neckhead
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass63_neckhead_d`
					material = bass63_neckhead_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/esp/bass63_neckhead_ld_01`
							flags = 36
							color = grey_5guitar
						}
						{
							texture = `tex/models/characters/layers/cab/esp/bass63_neckhead_dtl_02`
							flags = 36
							color = navy_1
						}
					]
				}
			]
		}
		cas_bass_pickguards = {
			desc_id = none
		}
		cas_bass_pickups = {
			desc_id = bass9_pkup_type1_blk_02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_bass_bridges = {
			desc_id = bass17_bridge_4str_05
			chosen_materials = {
				material1 = navy_1
			}
		}
		cas_bass_knobs = {
			desc_id = bass63_knob_type1
			chosen_materials = {
				material1 = navy_1
			}
		}
		cas_bass_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			goth
		]
		cas_bass_body = {
			desc_id = bass17_esp_ec_01
			cap = [
				{
					base_tex = `tex\models\car_instruments\bass\esp\bass17_esp_ec_d`
					material = bass17_esp_ec_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/esp/bass17_esp_ax_ld_01`
							color = navy_1
						}
						{
							texture = `tex/models/characters/layers/cab/esp/bass17_esp_ax_dtl_04`
							flags = 4
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_bass_neck = {
			desc_id = bass_fretboard_22d
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_05`
					material = bass_fretboard_22d_primary
					diffuse
					pre_layer = [
						{
							color = grey_4
							texture = `tex/models/characters/layers/cab/esp/bass_fretboard_inlay_05`
							flags = 4
						}
					]
				}
			]
		}
		cas_bass_head = {
			desc_id = bass14_neckhead_03
			chosen_materials = {
				material1 = black_1guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass9_neckhead_d_03`
					material = bass14_neckhead_03_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cab/esp/bass9_neckhead3_ld_01`
							flags = 36
						}
						{
							texture = `tex/models/characters/layers/cab/esp/bass9_neckhead3_ld_02`
							flags = 36
							color = navy_1
						}
						{
							texture = `tex/models/characters/layers/cab/esp/bass9_neckhead3_dtl_02`
							flags = 36
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_bass_pickguards = {
			desc_id = none
		}
		cas_bass_pickups = {
			desc_id = bass9_pkup_type1_blk_02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_bass_bridges = {
			desc_id = bass17_bridge_4str_04
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_bass_knobs = {
			desc_id = bass17_esp_knob_10
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_bass_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			punk
		]
		cas_bass_body = {
			desc_id = bass63_ex
			cap = [
				{
					base_tex = `tex\models\car_instruments\bass\esp\bass63_ex_d`
					material = bass63_ex_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/esp/bass63_ex_ld_11`
							flags = 4
							color = red_2
						}
						{
							texture = `tex/models/characters/layers/cab/esp/bass63_ex_dtl_13`
							flags = 4
						}
					]
				}
			]
		}
		cas_bass_neck = {
			desc_id = bass_fretboard_22a
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_02`
					material = bass_fretboard_22a_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/esp/bass_fretboard_inlay_06`
							flags = 4
							color = grey_5guitar
						}
					]
				}
			]
		}
		cas_bass_head = {
			desc_id = bass63_neckhead
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass63_neckhead_d`
					material = bass63_neckhead_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/esp/bass63_neckhead_ld_11`
							flags = 36
						}
						{
							texture = `tex/models/characters/layers/cag/all_clear3`
							flags = 36
						}
						{
							texture = `tex/models/characters/layers/cag/all_clear2`
							flags = 36
						}
					]
				}
			]
		}
		cas_bass_pickguards = {
			desc_id = none
		}
		cas_bass_pickups = {
			desc_id = bass9_pkup_type1_blk_02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_bass_bridges = {
			desc_id = bass17_bridge_4str_05
		}
		cas_bass_knobs = {
			desc_id = bass63_knob_type1
		}
		cas_bass_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			punk
		]
		cas_bass_body = {
			desc_id = bass17_esp_ec_01
			cap = [
				{
					base_tex = `tex\models\car_instruments\bass\esp\bass17_esp_ec_d`
					material = bass17_esp_ec_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/esp/bass17_esp_ec_ld_12`
							flags = 4
							color = navy_1
						}
						{
							texture = `tex/models/characters/layers/cag/all_clear3`
							flags = 4
						}
						{
							texture = `tex/models/characters/layers/cab/esp/bass17_esp_ax_dtl_13`
							flags = 4
						}
					]
				}
			]
		}
		cas_bass_neck = {
			desc_id = bass_fretboard_22a
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_02`
					material = bass_fretboard_22a_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/esp/bass_fretboard_inlay_06`
							flags = 4
							color = grey_5guitar
						}
					]
				}
			]
		}
		cas_bass_head = {
			desc_id = bass14_neckhead_03
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass9_neckhead_d_03`
					material = bass14_neckhead_03_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/esp/bass9_neckhead3_ld_11`
							flags = 36
						}
						{
							texture = `tex/models/characters/layers/cab/esp/bass9_neckhead3_ld_02`
							flags = 36
							color = navy_1
						}
						{
							texture = `tex/models/characters/layers/cag/all_clear2`
							flags = 36
						}
					]
				}
			]
		}
		cas_bass_pickguards = {
			desc_id = none
		}
		cas_bass_pickups = {
			desc_id = bass9_pkup_type1_blk_02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_bass_bridges = {
			desc_id = bass17_bridge_4str_04
		}
		cas_bass_knobs = {
			desc_id = bass17_esp_knob_10
		}
		cas_bass_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			rock
		]
		cas_bass_body = {
			desc_id = bass14_esp_surveyor
			cap = [
				{
					base_tex = `tex\models\car_instruments\bass\esp\bass14_esp_surveyor_d`
					material = bass14_esp_surveyor_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/esp/bass14_esp_ax_ld_12`
							flags = 4
							color = orange_2
						}
						{
							texture = `tex/models/characters/layers/cab/esp/bass14_esp_ax_dtl_04`
							flags = 4
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_bass_neck = {
			desc_id = bass_fretboard_22a
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_02`
					material = bass_fretboard_22a_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/esp/bass_fretboard_inlay_06`
							flags = 4
							color = grey_5guitar
						}
					]
				}
			]
		}
		cas_bass_head = {
			desc_id = bass14_neckhead_04
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass9_neckhead_d_04`
					material = bass14_neckhead_04_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cab/esp/bass9_neckhead4_ld_01`
							flags = 36
						}
					]
				}
			]
		}
		cas_bass_pickguards = {
			desc_id = none
		}
		cas_bass_pickups = {
			desc_id = bass9_pkup_type1_blk_02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_bass_bridges = {
			desc_id = bass14_bridge_4str_01
		}
		cas_bass_knobs = {
			desc_id = bass14_esp_knob_10_04
		}
		cas_bass_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			rock
		]
		cas_bass_body = {
			desc_id = bass14_esp_surveyor
			cap = [
				{
					base_tex = `tex\models\car_instruments\bass\esp\bass14_esp_surveyor_d`
					material = bass14_esp_surveyor_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/esp/bass14_esp_ax_ld_13`
							flags = 4
							color = teal_2
						}
						{
							texture = `tex/models/characters/layers/cab/esp/bass14_esp_ax_dtl_04`
							flags = 4
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_bass_neck = {
			desc_id = bass_fretboard_22a
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_02`
					material = bass_fretboard_22a_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/esp/bass_fretboard_inlay_06`
							flags = 4
							color = grey_5guitar
						}
					]
				}
			]
		}
		cas_bass_head = {
			desc_id = bass14_neckhead_04
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass9_neckhead_d_04`
					material = bass14_neckhead_04_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cab/esp/bass9_neckhead4_ld_01`
							flags = 36
						}
					]
				}
			]
		}
		cas_bass_pickguards = {
			desc_id = none
		}
		cas_bass_pickups = {
			desc_id = bass9_pkup_type1_blk_02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_bass_bridges = {
			desc_id = bass14_bridge_4str_01
		}
		cas_bass_knobs = {
			desc_id = bass14_esp_knob_10_04
		}
		cas_bass_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`heavy metal`
		]
		cas_bass_body = {
			desc_id = bass9_esp_ax_01
			cap = [
				{
					base_tex = `tex\models\car_instruments\bass\esp\bass9_esp_ax_d`
					material = bass9_esp_ax_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/esp/bass9_esp_ax_ld_01`
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/layers/cab/esp/bass9_esp_ax_dtl_7b`
							flags = 4
							color = grey_5guitar
						}
						{
							texture = `tex/models/characters/layers/cab/esp/bass9_esp_ax_dtl_7a`
							flags = 4
							color = grey_2guitar
						}
					]
				}
			]
		}
		cas_bass_neck = {
			desc_id = bass_fretboard_24d
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
					material = bass_fretboard_24d_primary
					diffuse
					pre_layer = [
						{
							color = grey_4
							texture = `tex/models/characters/layers/cab/esp/bass_fretboard_24_inlay_03`
							flags = 4
						}
					]
				}
			]
		}
		cas_bass_head = {
			desc_id = bass9_neckhead_01
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass9_neckhead_d`
					material = bass9_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cab/esp/bass9_neckhead_ld_01`
							flags = 36
						}
						{
							texture = `tex/models/characters/layers/cab/esp/bass9_neckhead_dtl_02`
							flags = 36
						}
					]
				}
			]
		}
		cas_bass_pickguards = {
			desc_id = none
		}
		cas_bass_pickups = {
			desc_id = bass9_pkup_type1_blk_02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_bass_bridges = {
			desc_id = bass9_bridge_4str_01
		}
		cas_bass_knobs = {
			desc_id = bass9_esp_knob_10_04
		}
		cas_bass_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`heavy metal`
		]
		cas_bass_body = {
			desc_id = bass9_esp_ax_01
			cap = [
				{
					base_tex = `tex\models\car_instruments\bass\esp\bass9_esp_ax_d`
					material = bass9_esp_ax_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/esp/bass9_esp_ax_ld_01`
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/layers/cab/esp/bass9_esp_ax_dtl_7b`
							flags = 4
							color = yellow_green_1guitar
						}
						{
							texture = `tex/models/characters/layers/cab/esp/bass9_esp_ax_dtl_7a`
							flags = 4
							color = yellow_green_2guitar
						}
					]
				}
			]
		}
		cas_bass_neck = {
			desc_id = bass_fretboard_24d
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
					material = bass_fretboard_24d_primary
					diffuse
					pre_layer = [
						{
							color = grey_4
							texture = `tex/models/characters/layers/cab/esp/bass_fretboard_24_inlay_03`
							flags = 4
						}
					]
				}
			]
		}
		cas_bass_head = {
			desc_id = bass9_neckhead_01
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass9_neckhead_d`
					material = bass9_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cab/esp/bass9_neckhead_ld_01`
							flags = 36
						}
						{
							texture = `tex/models/characters/layers/cag/all_clear2`
							flags = 36
						}
					]
				}
			]
		}
		cas_bass_pickguards = {
			desc_id = none
		}
		cas_bass_pickups = {
			desc_id = bass9_pkup_type1_blk_02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_bass_bridges = {
			desc_id = bass9_bridge_4str_01
		}
		cas_bass_knobs = {
			desc_id = bass9_esp_knob_10_04
		}
		cas_bass_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`classic rock`
		]
		cas_bass_body = {
			desc_id = bass14_esp_surveyor
			cap = [
				{
					base_tex = `tex\models\car_instruments\bass\esp\bass14_esp_surveyor_d`
					material = bass14_esp_surveyor_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/esp/bass14_esp_ax_ld_12`
							flags = 4
							color = yellow_orange_2
						}
						{
							texture = `tex/models/characters/layers/cab/esp/bass14_esp_ax_dtl_04`
							flags = 4
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_bass_neck = {
			desc_id = bass_fretboard_22a
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_02`
					material = bass_fretboard_22a_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/esp/bass_fretboard_inlay_06`
							flags = 4
							color = grey_5guitar
						}
					]
				}
			]
		}
		cas_bass_head = {
			desc_id = bass14_neckhead_04
		}
		cas_bass_pickguards = {
			desc_id = none
		}
		cas_bass_pickups = {
			desc_id = bass9_pkup_type1_blk_02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_bass_bridges = {
			desc_id = bass14_bridge_4str_01
		}
		cas_bass_knobs = {
			desc_id = bass14_esp_knob_10_04
		}
		cas_bass_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`classic rock`
		]
		cas_bass_body = {
			desc_id = bass14_esp_surveyor
			cap = [
				{
					base_tex = `tex\models\car_instruments\bass\esp\bass14_esp_surveyor_d`
					material = bass14_esp_surveyor_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/esp/bass14_esp_ax_ld_11`
							flags = 4
							color = blue_2
						}
						{
							texture = `tex/models/characters/layers/cab/esp/bass14_esp_ax_dtl_04`
							flags = 4
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_bass_neck = {
			desc_id = bass_fretboard_22a
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_02`
					material = bass_fretboard_22a_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/esp/bass_fretboard_inlay_06`
							flags = 4
							color = grey_5guitar
						}
					]
				}
			]
		}
		cas_bass_head = {
			desc_id = bass14_neckhead_04
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass9_neckhead_d_04`
					material = bass14_neckhead_04_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/esp/bass9_neckhead4_ld_11`
							flags = 36
						}
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cab/esp/bass9_neckhead4_ld_02`
							flags = 36
						}
					]
				}
			]
		}
		cas_bass_pickguards = {
			desc_id = none
		}
		cas_bass_pickups = {
			desc_id = bass9_pkup_type1_blk_02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_bass_bridges = {
			desc_id = bass14_bridge_4str_01
		}
		cas_bass_knobs = {
			desc_id = bass14_esp_knob_10_04
		}
		cas_bass_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`classic rock`
		]
		cas_bass_body = {
			desc_id = bass17_esp_ec_01
			cap = [
				{
					base_tex = `tex\models\car_instruments\bass\esp\bass17_esp_ec_d`
					material = bass17_esp_ec_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/esp/bass17_esp_ec_ld_13`
							flags = 4
							color = red_1
						}
						{
							texture = `tex/models/characters/layers/cab/esp/bass17_esp_ax_dtl_04`
							flags = 4
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_bass_neck = {
			desc_id = bass_fretboard_22a
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_02`
					material = bass_fretboard_22a_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/esp/bass_fretboard_inlay_06`
							flags = 4
							color = grey_5guitar
						}
					]
				}
			]
		}
		cas_bass_head = {
			desc_id = bass14_neckhead_03
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass9_neckhead_d_03`
					material = bass14_neckhead_03_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/esp/bass9_neckhead3_ld_11`
							flags = 36
						}
					]
				}
			]
		}
		cas_bass_pickguards = {
			desc_id = none
		}
		cas_bass_pickups = {
			desc_id = bass9_pkup_type1_blk_02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_bass_bridges = {
			desc_id = bass17_bridge_4str_04
		}
		cas_bass_knobs = {
			desc_id = bass17_esp_knob_10
		}
		cas_bass_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`classic rock`
		]
		cas_bass_body = {
			desc_id = bass17_esp_ec_01
			cap = [
				{
					base_tex = `tex\models\car_instruments\bass\esp\bass17_esp_ec_d`
					material = bass17_esp_ec_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/esp/bass17_esp_ec_ld_12`
							flags = 4
							color = yellow_1guitar
						}
						{
							texture = `tex/models/characters/layers/cab/esp/bass17_esp_ax_dtl_04`
							flags = 4
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_bass_neck = {
			desc_id = bass_fretboard_22a
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_02`
					material = bass_fretboard_22a_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/esp/bass_fretboard_inlay_06`
							flags = 4
							color = grey_5guitar
						}
					]
				}
			]
		}
		cas_bass_head = {
			desc_id = bass14_neckhead_03
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass9_neckhead_d_03`
					material = bass14_neckhead_03_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/esp/bass9_neckhead3_ld_11`
							flags = 36
						}
					]
				}
			]
		}
		cas_bass_pickguards = {
			desc_id = none
		}
		cas_bass_pickups = {
			desc_id = bass9_pkup_type1_blk_02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_bass_bridges = {
			desc_id = bass17_bridge_4str_04
		}
		cas_bass_knobs = {
			desc_id = bass17_esp_knob_10
		}
		cas_bass_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`black metal`
		]
		cas_bass_body = {
			desc_id = bass9_esp_ax_01
			cap = [
				{
					base_tex = `tex\models\car_instruments\bass\esp\bass9_esp_ax_d`
					material = bass9_esp_ax_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/esp/bass9_esp_ax_ld_01`
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_bass_neck = {
			desc_id = bass_fretboard_24d
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
					material = bass_fretboard_24d_primary
					diffuse
					pre_layer = [
						{
							color = grey_4
							texture = `tex/models/characters/layers/cab/esp/bass_fretboard_clear`
							flags = 4
						}
					]
				}
			]
		}
		cas_bass_head = {
			desc_id = bass9_neckhead_01
			chosen_materials = {
				material1 = black_1guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass9_neckhead_d`
					material = bass9_neckhead_01_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cab/esp/bass9_neckhead_ld_01`
							flags = 36
						}
					]
				}
			]
		}
		cas_bass_pickguards = {
			desc_id = none
		}
		cas_bass_pickups = {
			desc_id = bass9_pkup_type1_blk_02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_bass_bridges = {
			desc_id = bass9_bridge_4str_01
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_bass_knobs = {
			desc_id = bass9_esp_knob_10_04
		}
		cas_bass_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`black metal`
		]
		cas_bass_body = {
			desc_id = bass63_ex
			cap = [
				{
					base_tex = `tex\models\car_instruments\bass\esp\bass63_ex_d`
					material = bass63_ex_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cab/esp/bass63_ex_ld_01`
							flags = 4
						}
					]
				}
			]
		}
		cas_bass_neck = {
			desc_id = bass_fretboard_24d
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
					material = bass_fretboard_24d_primary
					diffuse
					pre_layer = [
						{
							color = grey_4
							texture = `tex/models/characters/layers/cab/esp/bass_fretboard_clear`
							flags = 4
						}
					]
				}
			]
		}
		cas_bass_head = {
			desc_id = bass63_neckhead
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass63_neckhead_d`
					material = bass63_neckhead_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cab/esp/bass63_neckhead_ld_01`
							flags = 36
						}
					]
				}
			]
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_bass_pickguards = {
			desc_id = none
		}
		cas_bass_pickups = {
			desc_id = bass9_pkup_type1_blk_02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_bass_bridges = {
			desc_id = bass17_bridge_4str_05
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_bass_knobs = {
			desc_id = bass63_knob_type1
		}
		cas_bass_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`classic rock`
		]
		cas_bass_body = {
			desc_id = bas_ibz_sr505
			cap = [
				{
					base_tex = `tex\models\car_instruments\bass\ibanez\bs_ibz_sr_body`
					material = bs_ibz_sr_body_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_ld02`
							flags = 4
							color = blue_2
						}
						{
							texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_dtl04`
							flags = 4
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_bass_neck = {
			desc_id = bass_fretboard_sr_24a
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d`
					material = bass_fretboard_24_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/ibanez/bass_sr24_inlay001`
							flags = 4
							color = grey_5guitar
						}
					]
				}
			]
		}
		cas_bass_head = {
			desc_id = bas_ibz_sr_head01
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/ibanez/bs_ibz_sr_head`
					material = bass_neckhead_ibz_sr_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_hd_dtl07`
							flags = 36
							color = navy_1
						}
						{
							texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_hd_dtl03`
							flags = 36
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_bass_pickguards = {
			desc_id = none
		}
		cas_bass_pickups = {
			desc_id = bass_pickup_sd
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_bass_bridges = {
			desc_id = bas_brdg_ibz01
		}
		cas_bass_knobs = {
			desc_id = knob_knurl02
		}
		cas_bass_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			pop
		]
		cas_bass_body = {
			desc_id = bas_ibz_sr505
			cap = [
				{
					base_tex = `tex\models\car_instruments\bass\ibanez\bs_ibz_sr_body`
					material = bs_ibz_sr_body_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_ld00`
							color = red_2
						}
						{
							texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_dtl04`
							flags = 4
							color = red_2
						}
						{
							texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_dtl02`
							flags = 4
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_bass_neck = {
			desc_id = bass_fretboard_sr_24a
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d`
					material = bass_fretboard_24_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/ibanez/bass_sr24_inlay001`
							flags = 4
							color = grey_5guitar
						}
					]
				}
			]
		}
		cas_bass_head = {
			desc_id = bas_ibz_sr_head01
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/ibanez/bs_ibz_sr_head`
					material = bass_neckhead_ibz_sr_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_hd_dtl07`
							flags = 36
							color = red_2
						}
						{
							texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_hd_dtl02`
							flags = 36
							color = black_1guitar
						}
					]
				}
			]
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_bass_pickguards = {
			desc_id = none
		}
		cas_bass_pickups = {
			desc_id = bas_ibz_pkup002
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_bass_bridges = {
			desc_id = bas_brdg_ibz01
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_bass_knobs = {
			desc_id = knob_knurl02
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_bass_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`heavy metal`
		]
		cas_bass_body = {
			desc_id = bas_ibz_sr505
			cap = [
				{
					base_tex = `tex\models\car_instruments\bass\ibanez\bs_ibz_sr_body`
					material = bs_ibz_sr_body_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_ld00`
							color = red_1
						}
						{
							texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_dtl04`
							flags = 4
							color = black_1guitar
						}
						{
							color = grey_2guitar
							texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_dtl06`
							flags = 4
						}
					]
				}
			]
		}
		cas_bass_neck = {
			desc_id = bass_fretboard_sr_24d
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
					material = bass_fretboard_sr24d_primary
					diffuse
					pre_layer = [
						{
							color = grey_4
							texture = `tex/models/characters/layers/cab/esp/bass_fretboard_clear`
							flags = 4
						}
					]
				}
			]
		}
		cas_bass_head = {
			desc_id = bas_ibz_sr_head01
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/ibanez/bs_ibz_sr_head`
					material = bass_neckhead_ibz_sr_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_hd_dtl07`
							flags = 36
						}
						{
							texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_hd_dtl06`
							flags = 36
							color = red_1
						}
					]
				}
			]
		}
		cas_bass_pickguards = {
			desc_id = none
		}
		cas_bass_pickups = {
			desc_id = bas_ibz_pkup002
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_bass_bridges = {
			desc_id = bas_brdg_ibz01
		}
		cas_bass_knobs = {
			desc_id = knob_knurl02
		}
		cas_bass_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`classic rock`
		]
		cas_bass_body = {
			desc_id = bas_ibz_sr505
			cap = [
				{
					base_tex = `tex\models\car_instruments\bass\ibanez\bs_ibz_sr_body`
					material = bs_ibz_sr_body_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_ld02`
							flags = 4
							color = red_orange_2
						}
						{
							texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_dtl03`
							flags = 4
							color = orange_2
						}
					]
				}
			]
		}
		cas_bass_neck = {
			desc_id = bass_fretboard_sr_24a
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d`
					material = bass_fretboard_24_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/ibanez/bass_sr24_inlay001`
							flags = 4
							color = grey_5guitar
						}
					]
				}
			]
		}
		cas_bass_head = {
			desc_id = bas_ibz_sr_head01
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/ibanez/bs_ibz_sr_head`
					material = bass_neckhead_ibz_sr_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_hd_dtl08`
							flags = 36
						}
					]
				}
			]
		}
		cas_bass_pickguards = {
			desc_id = none
		}
		cas_bass_pickups = {
			desc_id = bas_ibz_pkup002
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_bass_bridges = {
			desc_id = bas_brdg_ibz01
		}
		cas_bass_knobs = {
			desc_id = knob_knurl02
		}
		cas_bass_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			pop
		]
		cas_bass_body = {
			desc_id = bas_sch_stil
			cap = [
				{
					base_tex = `tex\models\car_instruments\bass\schecter\bas_sch_stil_bod`
					material = bass_stiletto_primary
					diffuse
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics092`
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
							color = red_orange_5
							texture = `tex/models/characters/layers/cab/schecter/bs_sch_stil_dtl04`
							flags = 4
						}
						{
							texture = `tex/models/characters/layers/cag/all_clear2`
							flags = 4
						}
					]
				}
			]
		}
		cas_bass_neck = {
			desc_id = bass_fretboard_24
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d`
					material = bass_fretboard_24_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/esp/bass_fretboard_24_inlay_05`
							flags = 4
							color = grey_5guitar
						}
					]
				}
			]
		}
		cas_bass_head = {
			desc_id = bas_neckhead_sch_stl
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/schecter/bs_sch_head_stil01`
					material = bass_neckhead_stil01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/schecter/bs_sch_stl_hd_dtl08`
							flags = 36
						}
						{
							texture = `tex/models/characters/layers/cab/schecter/bs_sch_stl_hd_dtl02`
							color = grey_5guitar
							flags = 36
							a = 0
						}
					]
				}
			]
		}
		cas_bass_pickguards = {
			desc_id = none
		}
		cas_bass_pickups = {
			desc_id = bass_pickup_sd
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_bass_bridges = {
			desc_id = bs_sch_brdg_a
		}
		cas_bass_knobs = {
			desc_id = bass_knob_01
		}
		cas_bass_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`classic rock`
		]
		cas_bass_body = {
			desc_id = bas_sch_stil
			cap = [
				{
					base_tex = `tex\models\car_instruments\bass\schecter\bas_sch_stil_bod`
					material = bass_stiletto_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/schecter/bs_sch_stil_dtl03`
							flags = 4
							color = orange_3
						}
						{
							texture = `tex/models/characters/layers/cab/schecter/bs_sch_stil_ld05`
							flags = 4
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_bass_neck = {
			desc_id = bass_fretboard_24
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d`
					material = bass_fretboard_24_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/esp/bass_fretboard_24_inlay_05`
							flags = 4
							color = grey_5guitar
						}
					]
				}
			]
		}
		cas_bass_head = {
			desc_id = bas_neckhead_sch_stl
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/schecter/bs_sch_head_stil01`
					material = bass_neckhead_stil01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/schecter/bs_sch_stl_hd_dtl08`
							flags = 36
						}
						{
							texture = `tex/models/characters/layers/cab/schecter/bs_sch_stl_hd_dtl02`
							color = grey_5guitar
							flags = 36
							a = 0
						}
					]
				}
			]
		}
		cas_bass_pickguards = {
			desc_id = none
		}
		cas_bass_pickups = {
			desc_id = bass_pickup_sd
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_bass_bridges = {
			desc_id = bs_sch_brdg_a
		}
		cas_bass_knobs = {
			desc_id = bass_knob_01
		}
		cas_bass_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			punk
			`heavy metal`
			rock
		]
		cas_bass_body = {
			desc_id = bs_sch_t_body
			cap = [
				{
					base_tex = `tex\models\car_instruments\bass\schecter\bs_sch_modelt`
					material = bs_sch_modelt_primary
					diffuse
					pre_layer = [
						{
							color = yellow_orange_5
							texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_dtl02`
							flags = 4
						}
						{
							texture = `tex/models/characters/layers/cag/all_clear2`
							flags = 4
						}
						{
							texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_ld21`
							flags = 4
						}
					]
				}
			]
		}
		cas_bass_neck = {
			desc_id = bass_fretboard_24
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d`
					material = bass_fretboard_24_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/esp/bass_fretboard_24_inlay_05`
							flags = 4
							color = grey_5guitar
						}
					]
				}
			]
		}
		cas_bass_head = {
			desc_id = bs_sch_t_nhead
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/schecter/bass_neckhead_mt`
					material = bs_sch_t_nhead_primary
					diffuse
					pre_layer = [
						{
							color = grey_2guitar
							texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_hd_dtl09`
							flags = 36
						}
					]
				}
			]
		}
		cas_bass_pickguards = {
			desc_id = bs_sch_t_pga
		}
		cas_bass_pickups = {
			desc_id = bass_pickup_sd
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_bass_bridges = {
			desc_id = bs_sch_brdg_a
		}
		cas_bass_knobs = {
			desc_id = knob_knurl02
		}
		cas_bass_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`classic rock`
		]
		cas_bass_body = {
			desc_id = bas_sch_stil
			cap = [
				{
					base_tex = `tex\models\car_instruments\bass\schecter\bas_sch_stil_bod`
					material = bass_stiletto_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/schecter/bs_sch_stil_dtl01`
							color = black_1guitar
						}
					]
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							x_trans = -31
							y_trans = -31
							x_scale = 20
							y_scale = 27
							rot = 1603
							flags = 259
							color = red_1
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = red_1
							x_trans = -39
							y_trans = 28
							x_scale = 25
							y_scale = 31
							rot = 1603
							flags = 259
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = yellow_1guitar
							x_trans = -39
							y_trans = 28
							x_scale = 15
							rot = 1603
							flags = 259
							y_scale = 19
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = yellow_1guitar
							x_trans = -23
							y_trans = -12
							x_scale = 15
							y_scale = 20
							rot = 1603
							flags = 259
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = red_1
							x_trans = -23
							y_trans = -12
							x_scale = 14
							y_scale = 19
							rot = 1603
							flags = 259
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = yellow_1guitar
							x_trans = -23
							y_trans = -12
							x_scale = 7
							rot = 1603
							flags = 259
							y_scale = 9
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = red_1
							x_trans = -7
							y_trans = 16
							x_scale = 15
							y_scale = 20
							rot = 1603
							flags = 259
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = yellow_1guitar
							x_trans = -7
							y_trans = 16
							x_scale = 11
							rot = 1603
							flags = 259
							y_scale = 14
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = black_1guitar
							x_trans = -7
							y_trans = 16
							y_scale = 6
							rot = 1603
							flags = 259
							x_scale = 5
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							x_trans = -43
							y_trans = -28
							x_scale = 19
							y_scale = 24
							rot = 1603
							flags = 259
							color = yellow_1guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = black_1guitar
							x_trans = -43
							y_trans = -28
							x_scale = 11
							y_scale = 14
							rot = 1603
							flags = 259
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = yellow_1guitar
							x_trans = -43
							y_trans = -28
							x_scale = 7
							rot = 1603
							flags = 259
							y_scale = 9
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = red_1
							x_trans = -43
							y_trans = -28
							x_scale = 6
							y_scale = 8
							rot = 1603
							flags = 259
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							x_trans = -18
							y_trans = 11
							x_scale = 20
							y_scale = 25
							rot = 1603
							flags = 259
							color = red_1
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = black_1guitar
							x_trans = -18
							y_trans = 11
							x_scale = 17
							rot = 1603
							flags = 259
							y_scale = 21
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = yellow_1guitar
							x_trans = -18
							y_trans = 11
							y_scale = 14
							rot = 1603
							flags = 259
							x_scale = 11
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = black_1guitar
							x_trans = -18
							y_trans = 11
							x_scale = 4
							rot = 1603
							flags = 259
							y_scale = 6
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							x_trans = -37
							y_trans = 18
							x_scale = 16
							y_scale = 20
							rot = 1603
							flags = 259
							color = yellow_1guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = black_1guitar
							x_trans = -37
							y_trans = 18
							x_scale = 15
							rot = 1603
							flags = 259
							y_scale = 19
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = yellow_1guitar
							x_trans = -37
							y_trans = 18
							x_scale = 14
							rot = 1603
							flags = 259
							y_scale = 18
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = red_1
							x_trans = -37
							y_trans = 18
							x_scale = 8
							rot = 1603
							flags = 259
							y_scale = 10
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = red_1
							y_trans = 8
							x_scale = 8
							y_scale = 10
							rot = 1603
							flags = 259
							x_trans = -28
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = yellow_1guitar
							x_trans = -28
							y_trans = 8
							x_scale = 5
							rot = 1603
							flags = 259
							y_scale = 7
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = yellow_1guitar
							x_trans = -32
							y_trans = -20
							x_scale = 10
							rot = 1603
							flags = 259
							y_scale = 13
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = black_1guitar
							x_trans = -32
							y_trans = -20
							x_scale = 6
							rot = 1603
							flags = 259
							y_scale = 8
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							x_trans = -16
							y_trans = -28
							x_scale = 10
							y_scale = 13
							rot = 1603
							flags = 259
							color = red_1
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = yellow_1guitar
							x_trans = -16
							y_trans = -28
							x_scale = 5
							rot = 1603
							flags = 259
							y_scale = 7
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = black_1guitar
							x_trans = -16
							y_trans = -28
							x_scale = 2
							rot = 1603
							flags = 259
							y_scale = 3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							x_trans = -28
							y_trans = 24
							x_scale = 16
							y_scale = 20
							rot = 1603
							flags = 259
							color = red_1
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = black_1guitar
							x_trans = -28
							y_trans = 24
							x_scale = 12
							rot = 1603
							flags = 259
							y_scale = 15
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = yellow_1guitar
							x_trans = -28
							y_trans = 24
							x_scale = 7
							rot = 1603
							flags = 259
							y_scale = 9
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = red_1
							x_trans = -28
							y_trans = 24
							x_scale = 3
							rot = 1603
							flags = 259
							y_scale = 5
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = red_1
							x_trans = -46
							y_trans = 0
							x_scale = 21
							rot = 1603
							flags = 259
							y_scale = 26
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = yellow_1guitar
							x_trans = -46
							y_trans = 0
							x_scale = 14
							rot = 1603
							flags = 259
							y_scale = 15
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = black_1guitar
							x_trans = -46
							y_trans = 0
							x_scale = 8
							rot = 1603
							flags = 259
							y_scale = 9
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							x_trans = -30
							y_trans = -3
							x_scale = 14
							y_scale = 20
							rot = 1603
							flags = 259
							color = red_1
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = yellow_1guitar
							x_trans = -30
							y_trans = -3
							x_scale = 9
							rot = 1603
							flags = 259
							y_scale = 13
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
							color = black_1guitar
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
		cas_bass_neck = {
			desc_id = bass_fretboard_24
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d`
					material = bass_fretboard_24_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/esp/bass_fretboard_24_inlay_05`
							flags = 4
							color = grey_5guitar
						}
					]
				}
			]
		}
		cas_bass_head = {
			desc_id = bas_neckhead_sch_stl
		}
		cas_bass_pickguards = {
			desc_id = none
		}
		cas_bass_pickups = {
			desc_id = bass_pickup_sd
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_bass_bridges = {
			desc_id = bs_sch_brdg_a
		}
		cas_bass_knobs = {
			desc_id = bass_knob_01
		}
		cas_bass_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			pop
			`glam rock`
		]
		cas_bass_body = {
			desc_id = bs_sch_t_body
			cap = [
				{
					base_tex = `tex\models\car_instruments\bass\schecter\bs_sch_modelt`
					material = bs_sch_modelt_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_dtl01`
							color = grey_3guitar
						}
						{
							texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_ld09`
							flags = 4
							color = yellow_3guitar
						}
						{
							texture = `tex/models/characters/layers/cag/all_clear2`
							flags = 4
						}
					]
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_001`
							color = purple_blue_2
							y_trans = -7
							x_scale = 61
							y_scale = 36
							rot = 1603
							flags = 3
							x_trans = -5
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_001`
							color = red_2
							y_trans = -7
							x_scale = 61
							y_scale = 21
							rot = 1603
							flags = 19
							x_trans = -13
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_001`
							color = red_2
							y_trans = -7
							x_scale = 61
							y_scale = 21
							rot = 1603
							flags = 3
							x_trans = -23
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_001`
							color = orange_3
							y_trans = -7
							x_scale = 61
							y_scale = 21
							rot = 1603
							flags = 19
							x_trans = -26
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_001`
							color = orange_3
							y_trans = -7
							x_scale = 61
							y_scale = 21
							rot = 1603
							flags = 3
							x_trans = -36
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_001`
							x_trans = -44
							y_trans = -7
							x_scale = 61
							y_scale = 32
							rot = 1603
							flags = 19
							color = green_2guitar
						}
					]
				}
			]
		}
		cas_bass_neck = {
			desc_id = bass_fretboard_24
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d`
					material = bass_fretboard_24_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/esp/bass_fretboard_24_inlay_05`
							flags = 4
							color = grey_5guitar
						}
					]
				}
			]
		}
		cas_bass_head = {
			desc_id = bs_sch_t_nhead
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/schecter/bass_neckhead_mt`
					material = bs_sch_t_nhead_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_hd_dtl06`
							flags = 36
							color = red_3
						}
					]
				}
			]
		}
		cas_bass_pickguards = {
			desc_id = none
		}
		cas_bass_pickups = {
			desc_id = bass_pickup_sd
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_bass_bridges = {
			desc_id = bs_sch_brdg_a
		}
		cas_bass_knobs = {
			desc_id = bass_knob_01
		}
		cas_bass_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			goth
		]
		cas_bass_body = {
			desc_id = bas_sch_stil
			cap = [
				{
					base_tex = `tex\models\car_instruments\bass\schecter\bas_sch_stil_bod`
					material = bass_stiletto_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/schecter/bs_sch_stil_dtl01`
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_bass_neck = {
			desc_id = bass_sch_fretboard_24d
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
					material = bass_fretboard_24d_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/schecter/bs_sch_inl_ld30`
							flags = 36
							color = green_2guitar
						}
					]
				}
			]
		}
		cas_bass_head = {
			desc_id = bas_neckhead_sch_stl
			chosen_materials = {
				material1 = green_2guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/schecter/bs_sch_head_stil01`
					material = bass_neckhead_stil01_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cab/schecter/bs_sch_stl_hd_dtl06`
							flags = 36
						}
					]
				}
			]
		}
		cas_bass_pickguards = {
			desc_id = none
		}
		cas_bass_pickups = {
			desc_id = bass_pickup_sd
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_bass_bridges = {
			desc_id = bs_sch_brdg_a
			chosen_materials = {
				material1 = green_2guitar
			}
		}
		cas_bass_knobs = {
			desc_id = bass_knob_02
			chosen_materials = {
				material1 = green_2guitar
			}
		}
		cas_bass_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			goth
		]
		cas_bass_body = {
			desc_id = bas_sch_stil
			cap = [
				{
					base_tex = `tex\models\car_instruments\bass\schecter\bas_sch_stil_bod`
					material = bass_stiletto_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/schecter/bs_sch_stil_dtl01`
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_bass_neck = {
			desc_id = bass_sch_fretboard_24d
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
					material = bass_fretboard_24d_primary
					diffuse
					pre_layer = [
						{
							color = grey_4
							texture = `tex/models/characters/layers/cab/schecter/bs_sch_inl_ld32`
							flags = 36
						}
					]
				}
			]
		}
		cas_bass_head = {
			desc_id = bas_neckhead_sch_stl
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/schecter/bs_sch_head_stil01`
					material = bass_neckhead_stil01_primary
					diffuse
					pre_layer = [
						{
							color = black_1guitar
							texture = `tex/models/characters/layers/cab/schecter/bs_sch_stl_hd_dtl06`
							flags = 36
						}
					]
				}
			]
			chosen_materials = {
				material1 = yellow_2guitar
			}
		}
		cas_bass_pickguards = {
			desc_id = none
		}
		cas_bass_pickups = {
			desc_id = bass_pickup_sd
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_bass_bridges = {
			desc_id = bs_sch_brdg_a
			chosen_materials = {
				material1 = yellow_2guitar
			}
		}
		cas_bass_knobs = {
			desc_id = bass_knob_03
			chosen_materials = {
				material1 = yellow_3guitar
			}
		}
		cas_bass_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`glam rock`
		]
		cas_bass_body = {
			desc_id = bs_sch_t_body
			cap = [
				{
					base_tex = `tex\models\car_instruments\bass\schecter\bs_sch_modelt`
					material = bs_sch_modelt_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_dtl02`
							flags = 4
							color = teal_2
						}
					]
				}
			]
		}
		cas_bass_neck = {
			desc_id = bass_sch_fretboard_24d
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
					material = bass_fretboard_24d_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/schecter/bs_sch_inl_ld30`
							flags = 4
							color = grey_5guitar
						}
					]
				}
			]
		}
		cas_bass_head = {
			desc_id = bs_sch_t_nhead
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/schecter/bass_neckhead_mt`
					material = bs_sch_t_nhead_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_hd_dtl06`
							flags = 36
							color = teal_1
						}
					]
				}
			]
		}
		cas_bass_pickguards = {
			desc_id = none
		}
		cas_bass_pickups = {
			desc_id = bass_pickup_sd
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_bass_bridges = {
			desc_id = bs_sch_brdg_a
		}
		cas_bass_knobs = {
			desc_id = knob_knurl02
		}
		cas_bass_misc = {
			desc_id = none
		}
	}
	{
		genre = [
			`heavy metal`
		]
		cas_bass_body = {
			desc_id = bass15_mcswain_machine
			cap = [
				{
					base_tex = `tex\models\car_instruments\bass\mcswain\bass15_mcswain_machine_d`
					material = bass15_mcswain_machine_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/mcswain/bass15_mcswain_machine_ld4`
							flags = 4
						}
					]
				}
			]
		}
		cas_bass_neck = {
			desc_id = bass_mcswain_fboard22a
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_02`
					material = bass_fretboard_22a_primary
					diffuse
					pre_layer = [
						{
							color = grey_5guitar
							texture = `tex/models/characters/layers/cab/mcswain/22fret_ld06_mcswn_bolts`
							flags = 36
						}
					]
				}
			]
		}
		cas_bass_head = {
			desc_id = bass15_neckhead_mcswain11
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/mcswain/bass15_neckhead_machine_d`
					material = bass15_neckhead_mcswain1_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/mcswain/bass15_nkhd_mcswain_ld4`
							flags = 36
						}
					]
				}
			]
		}
		cas_bass_pickguards = {
			desc_id = none
		}
		cas_bass_pickups = {
			desc_id = bass_pickup_sd
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_bass_bridges = {
			desc_id = bass15_bridge_mcswain1
		}
		cas_bass_knobs = {
			desc_id = bass_knob_01
		}
		cas_bass_misc = {
			desc_id = none
		}
	}
]
cas_preset_drums = [
	{
		genre = [
			punk
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld16`
							flags = 32
							color = blue_1
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld09`
							flags = 4
							color = navy_3
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			punk
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/drumshell_ds_49`
							flags = 32
							color = orange_3
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld92`
							flags = 4
							color = yellow_orange_3
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			punk
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							color = grey_4guitar
							texture = `tex/models/characters/layers/cadrm/drumshell_ds_06`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld94`
							flags = 4
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			goth
		]
		cas_drums = {
			desc_id = newtamadouble
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = newtamadouble_primary1
					diffuse
					pre_layer = [
						{
							texture = 0x32166bde
							flags = 32
							color = red_3
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = newtamadouble_bassdrum
					diffuse
					pre_layer = [
						{
							texture = 0xfa3977da
							flags = 32
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			goth
		]
		cas_drums = {
			desc_id = newtamatriple
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = newtamatriple_primary1
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld11`
							flags = 32
							color = purple_blue_1
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = newtamatriple_bassdrum
					diffuse
					pre_layer = [
						{
							texture = 0xedf9cea9
							flags = 32
							color = grey_5guitar
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			goth
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld03`
							flags = 32
							color = purple_blue_2
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld12`
							flags = 4
							color = navy_1
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			goth
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld06`
							flags = 32
							color = grey_3guitar
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld15`
							color = red_1
							flags = 4
							a = 100
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			goth
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld31`
							flags = 32
							color = teal_2
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld16`
							flags = 4
							color = violet_1
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			goth
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld39`
							flags = 32
							color = grey_2guitar
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld33`
							flags = 4
							color = grey_2guitar
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			goth
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_gk_02`
							flags = 4
							color = purple_blue_1
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld01`
							flags = 32
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`glam rock`
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld11`
							flags = 32
							color = red_3
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld34`
							flags = 4
							color = green_3guitar
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`glam rock`
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld15`
							flags = 32
							color = orange_3
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld45`
							flags = 4
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`glam rock`
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld23`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld46`
							flags = 4
							color = teal_2
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`glam rock`
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld25`
							flags = 32
							color = yellow_2guitar
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld56`
							flags = 4
							color = orange_3
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`glam rock`
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld28`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld65`
							flags = 4
							color = teal_3
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`glam rock`
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld38`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld66`
							flags = 4
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`glam rock`
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld34`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld98`
							flags = 4
							color = red_2
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`glam rock`
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld37`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_22`
							flags = 4
							color = violet_3
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`black metal`
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/drumshell_ds_04`
							flags = 32
							color = black_1guitar
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld01`
							flags = 4
							color = grey_3guitar
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`black metal`
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/drumshell_ds_04`
							flags = 32
							color = black_1guitar
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld11`
							flags = 4
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`black metal`
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld46`
							flags = 32
							color = black_1guitar
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_32`
							flags = 4
							color = grey_2guitar
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`black metal`
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld46`
							flags = 32
							color = black_1guitar
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_13`
							flags = 4
							color = grey_2guitar
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`black metal`
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld46`
							flags = 32
							color = black_1guitar
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_15`
							flags = 4
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`black metal`
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld46`
							flags = 32
							color = black_1guitar
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_15`
							flags = 4
							color = black_1guitar
						}
					]
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics020`
							flags = 3
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			pop
			`glam rock`
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = 0xab1f3a64
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = 0x0d2c27b7
							flags = 32
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			pop
			`glam rock`
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = 0x357bafc7
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = 0xedf9cea9
							flags = 32
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			pop
			`glam rock`
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = 0x32166bde
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = 0x7a2b1721
							flags = 32
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			pop
			`glam rock`
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = 0x45115b48
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = 0x9afefe3f
							flags = 32
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			pop
			`glam rock`
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = 0xdb75ceeb
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = 0x63302660
							flags = 32
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			pop
			`glam rock`
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = 0xac72fe7d
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = 0x0a41e3ae
							flags = 32
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			pop
			`glam rock`
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = 0xa5c4b256
							flags = 32
							color = grey_5guitar
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = 0x9425760d
							flags = 32
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			rock
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = black_1guitar
							y_trans = -41
							x_scale = 3
							flags = 3
							x_trans = -17
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = black_1guitar
							y_trans = -41
							x_scale = 3
							flags = 3
							x_trans = -26
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = black_1guitar
							y_trans = 38
							x_scale = 3
							y_scale = 49
							flags = 3
							x_trans = -18
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							color = black_1guitar
							x_trans = -26
							x_scale = 3
							y_scale = 49
							flags = 3
							y_trans = 38
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = -20
							x_scale = 32
							y_scale = 41
							flags = 3
							y_trans = 7
						}
					]
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_15`
							flags = 4
							color = grey_5guitar
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_tamashell_ld09`
							flags = 32
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			rock
		]
		cas_drums = {
			desc_id = newtamadouble
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = newtamadouble_primary1
					diffuse
					pre_layer = [
						{
							texture = 0xa5c4b256
							flags = 32
							color = orange_4
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = newtamadouble_bassdrum
					diffuse
					pre_layer = [
						{
							texture = 0xfa3977da
							flags = 32
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			rock
			punk
		]
		cas_drums = {
			desc_id = newtamadouble
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = newtamadouble_primary1
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_tamashell_ld14`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = newtamadouble_bassdrum
					diffuse
					pre_layer = [
						{
							texture = 0x8d3e474c
							flags = 32
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			rock
			`glam rock`
		]
		cas_drums = {
			desc_id = newtamadouble
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = newtamadouble_primary1
					diffuse
					pre_layer = [
						{
							texture = 0xa5c4b256
							flags = 32
							color = yellow_3guitar
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = newtamadouble_bassdrum
					diffuse
					pre_layer = [
						{
							texture = 0x143716f6
							flags = 32
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`heavy metal`
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld39`
							flags = 32
							color = yellow_2guitar
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_78`
							flags = 4
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`heavy metal`
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld31`
							flags = 32
							color = red_1
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld68`
							flags = 4
							color = grey_3guitar
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`classic rock`
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld04`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_15`
							flags = 4
							color = grey_4guitar
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`classic rock`
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld14`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_15`
							flags = 4
							color = grey_4guitar
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`classic rock`
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld31`
							flags = 32
							color = orange_3
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_15`
							flags = 4
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`classic rock`
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld49`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_15`
							flags = 4
							color = grey_3guitar
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`classic rock`
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							color = yellow_orange_4
							texture = `tex/models/characters/layers/cadrm/drumshell_ds_07`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld65`
							flags = 4
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`classic rock`
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_tamashell_ld05`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_15`
							flags = 4
							color = grey_5guitar
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`classic rock`
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld01`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_15`
							flags = 4
							color = grey_5guitar
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`heavy metal`
		]
		cas_drums = {
			desc_id = newtamatriple
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = newtamatriple_primary1
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_tamashell_ld03`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = newtamatriple_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_15`
							flags = 4
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`heavy metal`
		]
		cas_drums = {
			desc_id = newtamatriple
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = newtamatriple_primary1
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_tamashell_ld09`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = newtamatriple_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_15`
							flags = 4
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`heavy metal`
		]
		cas_drums = {
			desc_id = newtamatriple
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = newtamatriple_primary1
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld01`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = newtamatriple_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_13`
							flags = 4
							color = grey_3guitar
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`heavy metal`
		]
		cas_drums = {
			desc_id = newtamatriple
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = newtamatriple_primary1
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld06`
							flags = 32
							color = grey_3guitar
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = newtamatriple_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_22`
							flags = 4
							color = red_1
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`heavy metal`
		]
		cas_drums = {
			desc_id = newtamatriple
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = newtamatriple_primary1
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld25`
							flags = 32
							color = grey_3guitar
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = newtamatriple_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_77`
							flags = 4
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`heavy metal`
		]
		cas_drums = {
			desc_id = newtamatriple
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = newtamatriple_primary1
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld27`
							flags = 32
							color = yellow_1guitar
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = newtamatriple_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_78`
							flags = 4
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`heavy metal`
		]
		cas_drums = {
			desc_id = newtamadouble
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = newtamadouble_primary1
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/drumshell_ds_04`
							flags = 32
							color = black_1guitar
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = newtamadouble_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_15`
							flags = 4
							color = grey_4guitar
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`heavy metal`
		]
		cas_drums = {
			desc_id = newtamadouble
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = newtamadouble_primary1
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/drumshell_ds_40`
							flags = 32
							color = red_orange_1
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = newtamadouble_bassdrum
					diffuse
					pre_layer = [
						{
							texture = 0x8d3e474c
							flags = 32
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`heavy metal`
		]
		cas_drums = {
			desc_id = newtamadouble
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = newtamadouble_primary1
					diffuse
					pre_layer = [
						{
							color = grey_4guitar
							texture = `tex/models/characters/layers/cadrm/drumshell_ds_53`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = newtamadouble_bassdrum
					diffuse
					pre_layer = [
						{
							texture = 0x143716f6
							flags = 32
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			punk
		]
		cas_drums = {
			desc_id = newtamadouble
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = newtamadouble_primary1
					diffuse
					pre_layer = [
						{
							color = grey_4guitar
							texture = `tex/models/characters/layers/cadrm/drumshell_ds_53`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = newtamadouble_bassdrum
					diffuse
					pre_layer = [
						{
							texture = 0x8d3e474c
							flags = 32
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			punk
		]
		cas_drums = {
			desc_id = newtamadouble
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = newtamadouble_primary1
					diffuse
					pre_layer = [
						{
							color = grey_4guitar
							texture = `tex/models/characters/layers/cadrm/drumshell_ds_06`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = newtamadouble_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld09`
							flags = 4
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			punk
		]
		cas_drums = {
			desc_id = newtamadouble
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = newtamadouble_primary1
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/drumshell_ds_20`
							flags = 32
							color = violet_1
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = newtamadouble_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld19`
							flags = 4
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			punk
		]
		cas_drums = {
			desc_id = newtamadouble
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = newtamadouble_primary1
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/drumshell_ds_49`
							flags = 32
							color = red_orange_2
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = newtamadouble_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld31`
							flags = 4
							color = blue_1
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			punk
		]
		cas_drums = {
			desc_id = newtamadouble
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = newtamadouble_primary1
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld49`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = newtamadouble_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld57`
							flags = 4
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			punk
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_07`
							flags = 4
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/drumshell_ds_22`
							flags = 32
							color = red_3
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			rock
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_08`
							flags = 4
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/drumshell_ds_38`
							flags = 32
							color = red_3
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			rock
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_gk_04`
							flags = 4
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/drumshell_ds_05`
							flags = 32
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			rock
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_gk_01`
							flags = 4
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld52`
							flags = 32
							color = green_1guitar
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			rock
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_43`
							flags = 4
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld42`
							flags = 32
							color = orange_4
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			rock
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld102`
							flags = 4
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld39`
							flags = 32
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			rock
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld101`
							flags = 4
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld31`
							flags = 32
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`classic rock`
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_15`
							flags = 4
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld13`
							flags = 32
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			pop
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_gk_02`
							flags = 4
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld11`
							flags = 32
							color = red_1
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			pop
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_tamashell_ld13`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_15`
							flags = 4
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			pop
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_tamashell_ld13`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = 0x7a2b1721
							flags = 32
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			goth
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_tamashell_ld13`
							flags = 32
							color = green_2guitar
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = 0xfa3977da
							flags = 32
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			goth
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld01`
							flags = 32
							color = black_1guitar
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld01`
							flags = 4
							color = grey_5guitar
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			goth
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld03`
							flags = 32
							color = purple_blue_1
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld12`
							flags = 4
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`black metal`
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld05`
							flags = 32
							color = grey_2guitar
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld15`
							flags = 4
							color = grey_2guitar
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`black metal`
		]
		cas_drums = {
			desc_id = newtamadouble
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = newtamadouble_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_15`
							flags = 4
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`black metal`
		]
		cas_drums = {
			desc_id = newtamadouble
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = newtamadouble_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_15`
							flags = 4
							color = black_1guitar
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = newtamadouble_primary1
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/drumshell_ds_34`
							flags = 32
							color = grey_2guitar
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`black metal`
		]
		cas_drums = {
			desc_id = newtamadouble
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					material = newtamadouble_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_15`
							flags = 4
							color = black_1guitar
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					material = newtamadouble_primary1
					diffuse
					pre_layer = [
						{
							color = grey_4guitar
							texture = `tex/models/characters/layers/cadrm/drumshell_ds_53`
							flags = 32
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
]
cas_preset_female_vocals = [
	{
		genre = [
			glam
			rock
			goth
			pop
			punk
			`black metal`
			`heavy metal`
			`classic rock`
		]
		cas_mic = {
			desc_id = mic_standard
		}
		cas_mic_stand = {
			desc_id = `classic rock`
		}
	}
	{
		cas_mic = {
			desc_id = `black metal`
		}
		cas_mic_stand = {
			desc_id = `classic rock`
		}
	}
	{
		cas_mic = {
			desc_id = `glam rock`
		}
		cas_mic_stand = {
			desc_id = `classic rock`
		}
	}
	{
		cas_mic = {
			desc_id = punk
		}
		cas_mic_stand = {
			desc_id = `classic rock`
		}
	}
	{
		cas_mic = {
			desc_id = `classic rock`
		}
		cas_mic_stand = {
			desc_id = `classic rock`
		}
	}
	{
		genre = [
			glam
			rock
			metal
			goth
			pop
		]
		cas_mic = {
			desc_id = mic_standard
		}
		cas_mic_stand = {
			desc_id = glam
		}
	}
	{
		cas_mic = {
			desc_id = `black metal`
		}
		cas_mic_stand = {
			desc_id = glam
		}
	}
	{
		cas_mic = {
			desc_id = `glam rock`
		}
		cas_mic_stand = {
			desc_id = glam
		}
	}
	{
		cas_mic = {
			desc_id = punk
		}
		cas_mic_stand = {
			desc_id = glam
		}
	}
	{
		cas_mic = {
			desc_id = `classic rock`
		}
		cas_mic_stand = {
			desc_id = glam
		}
	}
	{
		genre = [
			glam
			rock
			pop
			punk
			`classic rock`
		]
		cas_mic = {
			desc_id = mic_standard
		}
		cas_mic_stand = {
			desc_id = poptastic
		}
	}
	{
		cas_mic = {
			desc_id = `black metal`
		}
		cas_mic_stand = {
			desc_id = poptastic
		}
	}
	{
		cas_mic = {
			desc_id = `glam rock`
		}
		cas_mic_stand = {
			desc_id = poptastic
		}
	}
	{
		cas_mic = {
			desc_id = punk
		}
		cas_mic_stand = {
			desc_id = poptastic
		}
	}
	{
		cas_mic = {
			desc_id = `classic rock`
		}
		cas_mic_stand = {
			desc_id = poptastic
		}
	}
	{
		genre = [
			rock
			goth
			`black metal`
			`heavy metal`
		]
		cas_mic = {
			desc_id = mic_standard
		}
		cas_mic_stand = {
			desc_id = rock
		}
	}
	{
		cas_mic = {
			desc_id = `black metal`
		}
		cas_mic_stand = {
			desc_id = rock
		}
	}
	{
		cas_mic = {
			desc_id = `glam rock`
		}
		cas_mic_stand = {
			desc_id = rock
		}
	}
	{
		cas_mic = {
			desc_id = punk
		}
		cas_mic_stand = {
			desc_id = rock
		}
	}
	{
		cas_mic = {
			desc_id = `classic rock`
		}
		cas_mic_stand = {
			desc_id = rock
		}
	}
]
cas_preset_male_vocals = [
	{
		cas_mic = {
			desc_id = rock
		}
		cas_mic_stand = {
			desc_id = rock
		}
		genre = [
			rock
		]
	}
	{
		cas_mic = {
			desc_id = goth
		}
		cas_mic_stand = {
			desc_id = goth
		}
		genre = [
			goth
		]
	}
	{
		cas_mic = {
			desc_id = pop
		}
		cas_mic_stand = {
			desc_id = poptastic
		}
		genre = [
			pop
		]
	}
	{
		cas_mic = {
			desc_id = goth
		}
		cas_mic_stand = {
			desc_id = goth
		}
		genre = [
			`glam rock`
			`classic rock`
			punk
		]
	}
	{
		cas_mic = {
			desc_id = mic_standard
		}
		cas_mic_stand = {
			desc_id = mic_stand_metal
		}
		genre = [
			`heavy metal`
			`black metal`
		]
	}
]
