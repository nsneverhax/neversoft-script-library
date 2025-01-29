failsafe_car_profile = gh_rocker_judy
preset_musician_profiles_ghrockers = [
	{
		Name = gh_rocker_axel
		fullname = qs(0x0539af5a)
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		preset_icon = photo_axel
		blurb = qs(0x187e79b7)
		appearance = {
			genre = `classic	rock`
			cas_full_body = {
				desc_id = axel_1
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			cas_guitar_body = {
				desc_id = gtr12_esp_v_01
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr12_esp_v_series_d`
						material = gtr12_esp_v_01_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr12_esp_v_series_ld_02`
								flags = 4
								Color = grey_5guitar
							}
							{
								Color = grey_2guitar
								texture = `tex/models/characters/layers/cag/esp/gtr12_esp_v_series_dtl_7b`
								flags = 4
							}
							{
								texture = `tex/models/characters/layers/cag/esp/gtr12_esp_v_series_dtl_7a`
								flags = 4
								Color = black_1guitar
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
								texture = `tex/models/characters/layers/cag/gh5/24fret_ld87_esp_tribal`
								flags = 36
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
								Color = grey_5guitar
							}
							{
								texture = `tex/models/characters/layers/cag/esp/gtr4_neckhead7_dtl_06`
								flags = 36
								Color = black_1guitar
							}
						]
					}
				]
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_guitar_pickguards = {
				desc_id = None
			}
			cas_guitar_bridges = {
				desc_id = gtr12_bridge_1
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_guitar_knobs = {
				desc_id = gtr12_esp_knob_02
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
				desc_id = None
			}
			cas_bass_body = {
				desc_id = bass_schect_030
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\schecter\bs_sch_bod04_01`
						material = bass_sch001_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_bod04_ld01`
								Color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_bod04_dtl05`
								flags = 4
								Color = orange_5
							}
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_bod04_dtl21`
								flags = 4
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = bass_sch_fretboard_24
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d`
						material = bass_fretboard_24_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_inl_ld44`
								flags = 4
								Color = grey_5guitar
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = bs_sch_030_nhead01
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/schecter/bass_neckhead_030`
						material = bass_neckhead_030_primary
						diffuse
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_04_hd_dtl07`
								flags = 36
							}
							{
								Color = grey_2guitar
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_04_hd_dtl09`
								flags = 36
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = bs_sch_030_pga
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
				desc_id = bass_knob_02
			}
			cas_bass_misc = {
				desc_id = None
			}
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
								Color = yellow_orange_3
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						material = cad_drums_01_bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_skin_ld61`
								flags = 4
								Color = yellow_orange_3
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics020`
								flags = 27
								rot = 5413
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics020`
								flags = 19
								rot = 900
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = `classic	rock`
			}
			cas_mic_stand = {
				desc_id = `classic	rock`
			}
		}
	}
	{
		Name = gh_rocker_casey
		fullname = qs(0xd88aefc7)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_casey
		blurb = qs(0x5a515be2)
		appearance = {
			genre = `heavy	metal`
			cas_full_body = {
				desc_id = casey_4
			}
			cas_female_physique = {
				desc_id = femalephysiqueuntouched
			}
			cas_guitar_body = {
				desc_id = gtr12_esp_v_01
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr12_esp_v_series_d`
						material = gtr12_esp_v_01_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr12_esp_v_series_ld_02`
								flags = 4
								Color = red_1
							}
							{
								texture = `tex/models/characters/layers/cag/esp/gtr12_esp_v_series_dtl_02`
								flags = 4
								Color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cag/esp/gtr12_esp_v_series_dtl_19`
								flags = 4
								Color = black_1guitar
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
								texture = `tex/models/characters/layers/cag/gh5/24fret_ld87_esp_tribal`
								flags = 36
								Color = red_2
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
								Color = black_1guitar
								texture = `tex/models/characters/layers/cag/esp/gtr4_neckhead_07_ld_01`
								flags = 36
							}
							{
								texture = `tex/models/characters/layers/cag/esp/gtr4_neckhead_07_ld_03`
								flags = 36
								Color = red_1
							}
							{
								texture = `tex/models/characters/layers/cag/esp/gtr4_neckhead7_dtl_06`
								flags = 36
								Color = black_1guitar
							}
						]
					}
				]
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_pickguards = {
				desc_id = None
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
				desc_id = None
			}
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
								Color = red_1
							}
							{
								texture = `tex/models/characters/layers/cab/esp/bass9_esp_ax_dtl_04`
								flags = 4
								Color = black_1guitar
							}
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/esp/bass9_esp_ax_dtl_19`
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
								Color = grey_4
								texture = `tex/models/characters/layers/cab/esp/bass_fretboard_clear`
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
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/esp/bass9_neckhead_ld_01`
								flags = 36
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = None
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
				desc_id = None
			}
			cas_drums = {
				desc_id = basic
				cap = [
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
			cas_mic = {
				desc_id = `classic	rock`
			}
			cas_mic_stand = {
				desc_id = `classic	rock`
			}
		}
	}
	{
		Name = gh_rocker_judy
		fullname = qs(0xa9028c21)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_judy
		blurb = qs(0x5b674913)
		appearance = {
			genre = `heavy	metal`
			cas_full_body = {
				desc_id = judy_3
			}
			cas_female_physique = {
				desc_id = judyphysique
			}
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
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
								Color = navy_1
								x_trans = -4
								y_trans = 0
								x_scale = 1
								y_scale = 115
								rot = 0
								flags = 3
								a = 90
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
								Color = navy_1
								x_trans = -19
								y_trans = 0
								x_scale = 1
								y_scale = 115
								rot = 0
								flags = 3
								a = 85
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
								Color = navy_1
								x_trans = -34
								y_trans = 0
								x_scale = 1
								y_scale = 115
								rot = 0
								flags = 3
								a = 85
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
								Color = yellow_1guitar
								a = 30
								y_trans = 0
								x_scale = 1
								y_scale = 115
								rot = 0
								flags = 3
								x_trans = -42
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
								Color = yellow_1guitar
								a = 30
								y_trans = 0
								x_scale = 1
								y_scale = 115
								rot = 0
								flags = 3
								x_trans = -27
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
								Color = yellow_1guitar
								a = 30
								y_trans = 0
								x_scale = 1
								y_scale = 115
								rot = 0
								flags = 3
								x_trans = -12
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
								Color = yellow_1guitar
								a = 30
								x_trans = 4
								y_trans = 0
								y_scale = 115
								rot = 0
								flags = 3
								x_scale = 1
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
								Color = purple_blue_1
								x_trans = 4
								y_trans = 0
								x_scale = 9
								y_scale = 115
								rot = 0
								flags = 3
								a = 35
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
								Color = purple_blue_1
								x_trans = -12
								y_trans = 0
								x_scale = 9
								y_scale = 115
								rot = 0
								flags = 3
								a = 35
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
								Color = purple_blue_1
								x_trans = -27
								y_trans = 0
								x_scale = 9
								y_scale = 115
								rot = 0
								flags = 3
								a = 35
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
								Color = purple_blue_1
								x_trans = -42
								y_trans = -1
								x_scale = 9
								y_scale = 107
								rot = 0
								flags = 3
								a = 35
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
								Color = purple_blue_1
								x_trans = -19
								y_trans = -27
								x_scale = 79
								y_scale = 15
								flags = 3
								a = 35
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
								Color = purple_blue_1
								x_trans = -19
								y_trans = 0
								x_scale = 79
								y_scale = 15
								flags = 3
								a = 35
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
								Color = purple_blue_1
								a = 35
								x_trans = -19
								x_scale = 79
								y_scale = 15
								flags = 3
								y_trans = 27
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
								Color = yellow_1guitar
								a = 35
								x_trans = -19
								y_trans = 27
								y_scale = 1
								flags = 3
								x_scale = 131
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
								Color = yellow_1guitar
								a = 35
								x_trans = -19
								y_trans = 0
								y_scale = 1
								flags = 3
								x_scale = 126
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
								Color = yellow_1guitar
								a = 35
								x_trans = -19
								y_trans = -27
								y_scale = 1
								flags = 3
								x_scale = 123
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
								Color = navy_1
								a = 100
								x_trans = -19
								y_trans = -41
								y_scale = 1
								flags = 3
								x_scale = 94
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
								Color = navy_1
								a = 100
								x_trans = -25
								y_trans = -13
								y_scale = 1
								flags = 3
								x_scale = 108
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
								Color = navy_1
								a = 100
								y_trans = 15
								x_scale = 105
								y_scale = 1
								flags = 3
								x_trans = -24
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
								Color = navy_1
								a = 100
								x_trans = -19
								y_trans = 41
								y_scale = 1
								flags = 3
								x_scale = 97
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
								Color = grey_5
								texture = `tex/models/characters/layers/cag/gh5/22_fret_ld34_shctr_ladyluck`
								flags = 36
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = gtr73_neckhead_01
				chosen_materials = {
					material1 = grey_2guitar
				}
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
						]
					}
				]
			}
			cas_guitar_pickguards = {
				desc_id = gtr73_pg1
			}
			cas_guitar_bridges = {
				desc_id = gtr72_bridge
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_guitar_knobs = {
				desc_id = gtr_knob_04c
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
								Color = grey_5guitar
							}
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_ld09`
								flags = 4
								Color = red_2
							}
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_ld02`
								flags = 4
								Color = red_1
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = bass_sch_fretboard_22b
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_03`
						material = bass_fretboard_22b_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch22_inl_ld32`
								flags = 4
								Color = black_1guitar
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = bs_sch_t_nhead
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
				desc_id = None
			}
			cas_drums = {
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						material = cad_drums_01_bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_skin_ld64`
								a = 70
								flags = 4
								Color = red_4
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						material = cad_drums_01_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld53`
								flags = 32
								Color = red_4
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = `classic	rock`
			}
			cas_mic_stand = {
				desc_id = `classic	rock`
			}
		}
	}
	{
		Name = gh_rocker_clive
		fullname = qs(0xccb97235)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_clive
		blurb = qs(0xac376279)
		appearance = {
			genre = classic
			cas_full_body = {
				desc_id = clive_1
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
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
								Color = blue_3
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
								Color = grey_2
								texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
								flags = 36
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
				desc_id = None
			}
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
								Color = orange_3
							}
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_ld04`
								flags = 4
								Color = red_orange_3
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = bass_sch_fretboard_24b
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_02`
						material = bass_fretboard_24b_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_inl_ld42`
								flags = 4
								Color = grey_5guitar
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = bs_sch_t_nhead
			}
			cas_bass_pickguards = {
				desc_id = bs_sch_t_pga
			}
			cas_bass_pickups = {
				desc_id = bass_pickup_emg01
			}
			cas_bass_bridges = {
				desc_id = bas_brdg_sch_t
			}
			cas_bass_knobs = {
				desc_id = knob_knurl02
			}
			cas_bass_misc = {
				desc_id = None
			}
			cas_drums = {
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						material = cad_drums_01_bassdrum
						diffuse
						layers = [
							{
								font = fontgrid_text_a1
								text = 'W'
								flags = 3
								x_trans = -31
							}
							{
								font = fontgrid_text_a1
								text = 'I'
								x_trans = -22
								flags = 3
								y_scale = 125
							}
							{
								font = fontgrid_text_a1
								text = 'N'
								Color = grey_5
								flags = 3
								x_trans = -14
							}
							{
								font = fontgrid_text_a1
								text = 'S'
								x_trans = 0
								x_scale = 175
								flags = 3
								y_scale = 185
							}
							{
								font = fontgrid_text_a1
								text = 'T'
								flags = 3
								x_trans = 12
							}
							{
								font = fontgrid_text_a1
								text = 'O'
								y_scale = 125
								flags = 3
								x_trans = 21
							}
							{
								font = fontgrid_text_a1
								text = 'N'
								flags = 3
								x_trans = 30
							}
						]
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_01`
								flags = 4
								Color = yellow_orange_3
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						material = cad_drums_01_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld14`
								flags = 32
								Color = yellow_orange_4
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = rock
			}
			cas_mic_stand = {
				desc_id = rock
			}
		}
	}
	{
		Name = gh_rocker_pandora
		fullname = qs(0xd26ebef4)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_pandora
		blurb = qs(0x6b2b1a76)
		appearance = {
			genre = goth
			cas_full_body = {
				desc_id = pandora_1
			}
			cas_female_physique = {
				desc_id = femalephysiqueuntouched
			}
			cas_guitar_body = {
				desc_id = gtr75_ibz_xpt
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/ibanez/gtr75_ibz_xpt_d`
						material = gtr75_ibz_xpt_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/ibanez/gtr75_ibz_xpt_ld02`
								flags = 4
								Color = grey_5guitar
							}
							{
								texture = `tex/models/characters/layers/cag/ibanez/gtr75_ibz_xpt_dtl03`
								flags = 4
								Color = blue_1
							}
							{
								texture = `tex/models/characters/layers/cag/ibanez/gtr75_ibz_xpt_dtl02`
								flags = 4
								Color = grey_5guitar
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
								texture = `tex/models/characters/layers/cag/gh5/24fret_ld63_ibz_diamond`
								flags = 36
								Color = black_1guitar
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = gtr75_neckhead_01
				chosen_materials = {
					material1 = grey_5guitar
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/ibanez/gtr75_neckhead_d`
						material = gtr75_neckhead_01_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/ibanez/gtr75_neckhead_ld02`
								flags = 36
								Color = grey_5guitar
							}
							{
								texture = `tex/models/characters/layers/cag/ibanez/gtr75_neckhead_dtl03`
								flags = 36
								Color = blue_1
							}
						]
					}
				]
			}
			cas_guitar_pickguards = {
				desc_id = None
			}
			cas_guitar_bridges = {
				desc_id = gtr75_bridge2
			}
			cas_guitar_knobs = {
				desc_id = gtr_knob_08
			}
			cas_guitar_pickups = {
				desc_id = gtr78_pickup
				chosen_materials = {
					material1 = blue_2
				}
			}
			cas_guitar_misc = {
				desc_id = gtr_misc_switch4
			}
			cas_bass_body = {
				desc_id = bass17_esp_ec_01
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\esp\bass17_esp_ec_d`
						material = bass17_esp_ec_01_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/esp/bass17_esp_ec_ld_11`
								flags = 4
								Color = blue_2
							}
							{
								texture = `tex/models/characters/layers/cab/esp/bass17_esp_ax_dtl_02`
								flags = 4
								Color = black_1guitar
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
								Color = grey_4
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
								Color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cab/esp/bass9_neckhead3_ld_02`
								flags = 36
								Color = navy_1
							}
							{
								texture = `tex/models/characters/layers/cab/esp/bass9_neckhead3_dtl_01`
								flags = 36
								Color = black_1guitar
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = None
			}
			cas_bass_pickups = {
				desc_id = bass9_pkup_type3_blk_2
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bass17_bridge_4str_05
			}
			cas_bass_knobs = {
				desc_id = bass17_knob_02
			}
			cas_drums = {
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						material = cad_drums_01_bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_skin_ld11`
								flags = 4
								Color = navy_1
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
								Color = navy_4
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = `black	metal`
			}
			cas_mic_stand = {
				desc_id = rock
			}
		}
	}
	{
		Name = gh_rocker_lars
		fullname = qs(0x9dd7644f)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_lars
		blurb = qs(0x3c884eac)
		face_tension = 0
		appearance = {
			genre = `heavy	metal`
			cas_full_body = {
				desc_id = Lars_1
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			cas_guitar_body = {
				desc_id = gtr21_bc_rich_warbeast
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr21_bc_rich_warbeast_d`
						material = gtr21_bc_rich_warbeast_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/bc_rich/gtr_bc_rich_warbeast_ld6`
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
				desc_id = cag_24fret_bcrich04
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
						material = gtr_fretboard24_04_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/bc_rich/24fret_ld03_bcr_trance`
								flags = 36
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
								Color = black_1guitar
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
				desc_id = None
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
				desc_id = gtr_pickup_sd06
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_misc = {
				desc_id = gtr_misc_switch
			}
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
								Color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cab/esp/bass9_esp_ax_dtl_01`
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
								Color = grey_5guitar
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
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/esp/bass9_neckhead_ld_01`
								flags = 36
							}
							{
								texture = `tex/models/characters/layers/cab/esp/bass9_neckhead_dtl_01`
								flags = 36
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = None
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
				desc_id = None
			}
			cas_drums = {
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						material = cad_drums_01_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld43`
								flags = 32
								Color = grey_3guitar
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						material = cad_drums_01_bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_skin_ld35`
								flags = 4
								Color = grey_2guitar
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = `classic	rock`
			}
			cas_mic_stand = {
				desc_id = `classic	rock`
			}
		}
	}
	{
		Name = gh_rocker_eddie
		fullname = qs(0x91c2e6b5)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x0ff20f3f)
		appearance = {
			genre = classic
			cas_full_body = {
				desc_id = eddie_1
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
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
								Color = grey_2guitar
							}
							{
								texture = `tex/models/characters/layers/cag/prs/gtr78_prs_sc_dtl7b`
								flags = 4
								Color = grey_5guitar
							}
							{
								texture = `tex/models/characters/layers/cag/prs/gtr78_prs_sc_dtl7a`
								flags = 4
								Color = black_1guitar
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
								texture = `tex/models/characters/layers/cag/prs/22fret_ld115_prs_bats`
								flags = 36
								Color = teal_4
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = gtr82_neckhead01
				chosen_materials = {
					material1 = grey_2guitar
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/prs/gtr82_neckhead_01`
						material = gtr82_neckhead_01_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/prs/gtr82_neckhead_01_ld02`
								flags = 36
								Color = grey_5guitar
							}
							{
								texture = `tex/models/characters/layers/cag/prs/gtr82_neckhead_01_dtl04`
								flags = 36
								Color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cag/prs/gtr78_neckhead_dtl01`
								flags = 36
								Color = black_1guitar
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
								Color = teal_4
							}
						]
					}
				]
			}
			cas_guitar_bridges = {
				desc_id = gtr81_bridge01
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_guitar_knobs = {
				desc_id = gtr_knob_06b
				chosen_materials = {
					material1 = teal_4
				}
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_soapbar
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_guitar_misc = {
				desc_id = None
			}
			cas_bass_body = {
				desc_id = bass_schect_030
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\schecter\bs_sch_bod04_01`
						material = bass_sch001_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_bod04_ld01`
								Color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_bod04_dtl10`
								flags = 4
								Color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_bod04_dtl11`
								flags = 4
								Color = grey_5guitar
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = bass_sch_fretboard_22a
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_02`
						material = bass_fretboard_22a_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch22_inl_ld46`
								flags = 36
								Color = teal_3
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = bs_sch_030_nhead01
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/schecter/bass_neckhead_030`
						material = bass_neckhead_030_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_04_hd_dtl07`
								flags = 36
								Color = grey_5guitar
							}
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_04_hd_dtl01`
								flags = 36
								Color = black_1guitar
							}
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_04_hd_dtl05`
								flags = 36
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = bs_sch_030_pga
			}
			cas_bass_pickups = {
				desc_id = bass_emgpickup1
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bas_brdg_capsule
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_knobs = {
				desc_id = bass_knob_06
				chosen_materials = {
					material1 = teal_4
				}
			}
			cas_bass_misc = {
				desc_id = None
			}
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
								Color = orange_2
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
								Color = yellow_1guitar
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics037`
								Color = black_1guitar
								flags = 3
								y_trans = -5
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics037`
								Color = black_1guitar
								flags = 3
								y_trans = 4
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics037`
								flags = 3
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = mic_standard
			}
			cas_mic_stand = {
				desc_id = rock
			}
		}
	}
	{
		Name = gh_rocker_izzy
		fullname = qs(0x3ba5cbc5)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_izzy
		blurb = qs(0xf68778fe)
		appearance = {
			genre = classic
			cas_full_body = {
				desc_id = izzy_1
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
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
							{
								texture = `tex/models/characters/layers/cag/daisyrock/gtr94_dr_tomboy_dtl03`
								flags = 4
								Color = purple_blue_1
							}
							{
								texture = `tex/models/characters/layers/cag/daisyrock/gtr94_dr_tomboy_dtl14`
								flags = 4
								Color = purple_blue_1
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
								texture = `tex/models/characters/layers/cag/gh5/24fret_ld125_dr_elite`
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
				desc_id = None
			}
			cas_guitar_bridges = {
				desc_id = gtr94_bridge
			}
			cas_guitar_knobs = {
				desc_id = gtr_knob_03
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_pickups = {
				desc_id = gtr94_pickup
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
			cas_bass_body = {
				desc_id = bass15_mcswain_machine
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\mcswain\bass15_mcswain_machine_d`
						material = bass15_mcswain_machine_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/mcswain/bass15_mcswain_machine_ld2`
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
								Color = grey_5guitar
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
								texture = `tex/models/characters/layers/cab/mcswain/bass15_nkhd_mcswain_ld2`
								flags = 4
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = None
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
				desc_id = None
			}
			cas_drums = {
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						material = cad_drums_01_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld48`
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
								texture = `tex/models/characters/layers/cadrm/gh5_skin_ld21`
								flags = 4
								Color = grey_3guitar
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = mic_standard
			}
			cas_mic_stand = {
				desc_id = rock
			}
		}
	}
	{
		Name = gh_rocker_johnny
		fullname = qs(0x525fe42c)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_johnny
		blurb = qs(0x3292ac81)
		appearance = {
			genre = classic
			cas_full_body = {
				desc_id = Johnny_1
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			cas_guitar_body = {
				desc_id = gtr33d_base
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr33_kh2_wood_d`
						material = gtr33d_wood_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr_33_snakskul`
								flags = 4
							}
							{
								texture = `tex/models/characters/layers/cag/esp/gtr33_trash`
								flags = 4
								Color = yellow_orange_1
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
				desc_id = gtr33d_nekhed
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_guitar_pickguards = {
				desc_id = None
			}
			cas_guitar_bridges = {
				desc_id = gtr33_hardware01z
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_guitar_knobs = {
				desc_id = gtr33_knobs_kh2
			}
			cas_guitar_pickups = {
				desc_id = gtr33_emg
			}
			cas_guitar_misc = {
				desc_id = None
			}
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
								Color = red_1
							}
							{
								Color = grey_2guitar
								texture = `tex/models/characters/layers/cab/esp/bass63_ex_dtl_7b`
								flags = 4
							}
							{
								Color = grey_4guitar
								texture = `tex/models/characters/layers/cab/esp/bass63_ex_dtl_7a`
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
								Color = grey_5guitar
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
								Color = red_1
							}
							{
								texture = `tex/models/characters/layers/cab/esp/bass63_neckhead_dtl_02`
								flags = 36
								Color = grey_3guitar
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
				desc_id = None
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
				desc_id = bass63_knob_type1
			}
			cas_bass_misc = {
				desc_id = None
			}
			cas_drums = {
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						material = cad_drums_01_bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_13`
								flags = 4
								Color = red_1
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						material = cad_drums_01_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld20`
								flags = 32
								Color = grey_5guitar
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = mic_standard
			}
			cas_mic_stand = {
				desc_id = rock
			}
		}
	}
]
