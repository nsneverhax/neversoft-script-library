failsafe_car_profile = gh_rocker_judy
0x04d9015e = [
	preset_musician_profiles_ghrockers
	0x96c4f42f
]
0xd8edf164 = [
	0xdbbe2b30
	0x9877ee7e
	gh_rocker_axel
	gh_rocker_judy
	gh_rocker_casey
	bandlogo
]
0x96c4f42f = [
	{
		name = bandlogo
		appearance = {
			cas_band_logo = {
				desc_id = cas_band_logo_id
			}
		}
	}
]
preset_musician_profiles_ghrockers = [
	{
		name = 0xdbbe2b30
		fullname = qs(0x960585a9)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_clive
		blurb = qs(0x7d86a5e5)
		appearance = {
			genre = pop
			cas_full_body = {
				desc_id = 0x77edc2fe
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
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
								color = yellow_orange_1
							}
							{
								texture = `tex/models/characters/layers/cag/all_clear3`
								flags = 4
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
				desc_id = cag_22fret_mm03
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d3_01`
						material = gtr_fretboard_03_primary
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
								color = yellow_orange_1
							}
							{
								texture = `tex/models/characters/layers/cag/mm/gtr86_neckhead_dtl02`
								flags = 36
								color = black_1guitar
							}
						]
					}
				]
				chosen_materials = {
					material1 = red_2
				}
			}
			cas_guitar_pickguards = {
				desc_id = none
			}
			cas_guitar_bridges = {
				desc_id = gtr75_bridgemm
				chosen_materials = {
					material1 = red_2
				}
			}
			cas_guitar_knobs = {
				desc_id = gtr_knob_01c
				chosen_materials = {
					material1 = red_2
				}
			}
			cas_guitar_pickups = {
				desc_id = gtr86_pickup
			}
			cas_guitar_misc = {
				desc_id = gtr_misc_switch4
				chosen_materials = {
					material1 = red_3
				}
			}
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
								color = yellow_orange_1
							}
							{
								texture = `tex/models/characters/layers/cag/all_clear3`
								flags = 4
							}
							{
								texture = `tex/models/characters/layers/cab/esp/bass14_esp_ax_dtl_02`
								flags = 4
								color = red_1
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
								texture = `tex/models/characters/layers/cab/esp/bass9_neckhead4_ld_01`
								flags = 36
								color = yellow_orange_1
							}
							{
								texture = `tex/models/characters/layers/cab/esp/bass9_neckhead4_dtl_02`
								flags = 36
								color = black_1guitar
							}
						]
					}
				]
				chosen_materials = {
					material1 = red_2
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
				desc_id = bass14_bridge_4str_01
				chosen_materials = {
					material1 = red_2
				}
			}
			cas_bass_knobs = {
				desc_id = bass14_esp_knob_10_04
				chosen_materials = {
					material1 = red_3
				}
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
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_04`
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
			cas_mic = {
				desc_id = mic_standard
			}
			cas_mic_stand = {
				desc_id = poptastic
			}
		}
	}
	{
		name = gh_rocker_casey
		fullname = qs(0xd88aefc7)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_casey
		blurb = qs(0xa173ef4d)
		appearance = {
			genre = `heavy metal`
			cas_full_body = {
				desc_id = casey_1
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
								color = grey_5guitar
							}
							{
								texture = `tex/models/characters/layers/cag/esp/gtr12_esp_v_series_dtl_02`
								flags = 4
								color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cag/esp/gtr12_esp_v_series_dtl_19`
								flags = 4
								color = black_1guitar
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
								color = grey_5guitar
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
								color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cag/esp/gtr4_neckhead_07_ld_03`
								flags = 36
								color = grey_5guitar
							}
							{
								texture = `tex/models/characters/layers/cag/esp/gtr4_neckhead7_dtl_06`
								flags = 36
								color = black_1guitar
							}
						]
					}
				]
				chosen_materials = {
					material1 = red_2
				}
			}
			cas_guitar_pickguards = {
				desc_id = none
			}
			cas_guitar_bridges = {
				desc_id = gtr12_bridge_3
				chosen_materials = {
					material1 = red_2
				}
			}
			cas_guitar_knobs = {
				desc_id = gtr12_esp_knob_02
				chosen_materials = {
					material1 = red_1
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
								color = black_1guitar
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
					material1 = red_2
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass9_neckhead_d`
						material = bass9_neckhead_01_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/esp/bass9_neckhead_ld_01`
								flags = 36
								color = grey_5guitar
							}
							{
								texture = `tex/models/characters/layers/cag/all_clear3`
								flags = 36
							}
							{
								texture = `tex/models/characters/layers/cab/esp/bass9_neckhead_dtl_02`
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
				desc_id = bass9_pkup_type1_blk_02
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bass9_bridge_4str_01
				chosen_materials = {
					material1 = red_2
				}
			}
			cas_bass_knobs = {
				desc_id = bass9_esp_knob_10_04
				chosen_materials = {
					material1 = red_3
				}
			}
			cas_bass_misc = {
				desc_id = none
			}
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
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics053`
								x_scale = 72
								y_scale = 72
								flags = 3
								color = red_3
							}
						]
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_13`
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
			cas_mic = {
				desc_id = `classic rock`
			}
			cas_mic_stand = {
				desc_id = `classic rock`
			}
		}
	}
	{
		name = 0x9877ee7e
		fullname = qs(0x4c47fb49)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_midori
		blurb = qs(0x7c8dca20)
		appearance = {
			genre = pop
			cas_full_body = {
				desc_id = midori_1
			}
			cas_female_physique = {
				desc_id = midoriphysique
			}
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
								color = green_3guitar
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
				desc_id = cag_22fret_mm04
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
						material = gtr_fretboard_04_primary
						diffuse
						pre_layer = [
							{
								color = grey_5
								texture = `tex/models/characters/layers/cag/mm/gtr84_mminlaypet22`
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
								color = green_3guitar
							}
							{
								texture = `tex/models/characters/layers/cag/mm/gtr86_neckhead_dtl02`
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
				desc_id = gtr75_bridgebmm
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
								color = green_3guitar
							}
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_stil_ld05`
								flags = 4
								color = teal_1
							}
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_stil_ld02`
								flags = 4
								color = black_1guitar
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = bass_sch_fretboard_24c
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_03`
						material = bass_fretboard_24c_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_inl_ld40`
								flags = 36
								color = green_3guitar
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
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_stl_hd_dtl06`
								flags = 36
								color = teal_1
							}
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_stl_hd_dtl05`
								flags = 36
								color = green_3guitar
							}
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_stl_hd_dtl01`
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
				desc_id = bs_sch_brdg_a
			}
			cas_bass_knobs = {
				desc_id = bass_knob_01
			}
			cas_bass_misc = {
				desc_id = none
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
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld53`
								flags = 32
								color = green_3guitar
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = `classic rock`
			}
			cas_mic_stand = {
				desc_id = mic_stand_blackmetal
			}
		}
	}
	{
		name = gh_rocker_clive
		fullname = qs(0xccb97235)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_clive
		blurb = qs(0x39b4529d)
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
								color = blue_3
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
								color = grey_2
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
				desc_id = gtr37_hardware
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
								color = red_orange_1
							}
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_ld04`
								flags = 4
								color = red_orange_3
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
								color = grey_5guitar
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
				desc_id = none
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
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_15`
								flags = 4
								color = black_1guitar
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
								color = orange_2
								x_scale = 118
								flags = 259
								y_scale = 113
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
								a = 50
								x_trans = -30
								x_scale = 17
								y_scale = 117
								flags = 259
								color = yellow_2guitar
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
								a = 50
								x_trans = 30
								x_scale = 17
								y_scale = 117
								flags = 259
								color = yellow_2guitar
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
								a = 50
								x_scale = 17
								y_scale = 117
								flags = 259
								color = yellow_2guitar
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						material = cad_drums_01_primary
						diffuse
						pre_layer = [
							{
								color = red_orange_4
								texture = `tex/models/characters/layers/cadrm/drumshell_rm_03`
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
				desc_id = rock
			}
			cas_mic_stand = {
				desc_id = rock
			}
		}
	}
	{
		name = gh_rocker_pandora
		fullname = qs(0xd26ebef4)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_pandora
		blurb = qs(0xe7fb75f4)
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
								color = grey_5guitar
							}
							{
								texture = `tex/models/characters/layers/cag/ibanez/gtr75_ibz_xpt_dtl03`
								flags = 4
								color = purple_blue_1
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
				desc_id = cag_24fret_ibanez04
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
						material = gtr_fretboard24_04_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gh5/24fret_ld69_ibz_sharktooth2`
								flags = 36
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
								color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cag/all_clear3`
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
			}
			cas_guitar_knobs = {
				desc_id = gtr_knob_08
				chosen_materials = {
					material1 = purple_blue_3
				}
			}
			cas_guitar_pickups = {
				desc_id = gtr78_pickup
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_misc = {
				desc_id = gtr_misc_switch4
				chosen_materials = {
					material1 = purple_blue_3
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
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_dtl03`
								flags = 4
								color = red_2
							}
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_ld05`
								flags = 4
								color = black_1guitar
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
								texture = `tex/models/characters/layers/cab/schecter/bs_sch22_inl_ld30`
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
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_hd_dtl08`
								flags = 36
							}
							{
								color = black_1guitar
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_hd_dtl07`
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
			}
			cas_bass_knobs = {
				desc_id = knob_knurl02
				chosen_materials = {
					material1 = yellow_2guitar
				}
			}
			cas_bass_misc = {
				desc_id = none
			}
			cas_drums = {
				desc_id = newtamadouble
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						material = newtamadouble_bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_13`
								flags = 4
								color = purple_blue_1
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						material = newtamadouble_primary1
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_04`
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
				desc_id = mic_standard
			}
			cas_mic_stand = {
				desc_id = rock
			}
		}
	}
	{
		name = gh_rocker_eddie
		fullname = qs(0x91c2e6b5)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0xbe333f05)
		appearance = {
			genre = classic
			cas_full_body = {
				desc_id = eddie_1
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
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
								texture = `tex/models/characters/layers/cag/mcswain/gtr10_mcswain_flame_dtl1`
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
								texture = `tex/models/characters/layers/cag/gh5/22_fret_ld70_mcswn_flame`
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
				desc_id = gtr_brdg_mcswn_inferno_3
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
				desc_id = gtr_misc_switch
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
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_dtl03`
								flags = 4
								color = red_2
							}
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_ld05`
								flags = 4
								color = black_1guitar
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
								texture = `tex/models/characters/layers/cab/schecter/bs_sch22_inl_ld30`
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
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_hd_dtl08`
								flags = 36
							}
							{
								color = black_1guitar
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_hd_dtl07`
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
			}
			cas_bass_knobs = {
				desc_id = knob_knurl02
				chosen_materials = {
					material1 = yellow_2guitar
				}
			}
			cas_bass_misc = {
				desc_id = none
			}
			cas_drums = {
				desc_id = newtamatriple
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						material = newtamatriple_primary1
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
			cas_mic = {
				desc_id = mic_standard
			}
			cas_mic_stand = {
				desc_id = `steering wheel`
			}
		}
	}
	{
		name = gh_rocker_axel
		fullname = qs(0x0539af5a)
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		preset_icon = photo_axel
		blurb = qs(0x98c85f9c)
		appearance = {
			genre = `classic rock`
			cas_full_body = {
				desc_id = axel_1
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
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
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics073`
								color = yellow_orange_1
								x_trans = -42
								y_trans = 35
								y_scale = 50
								rot = 1573
								flags = 3
								x_scale = 35
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
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_misc = {
				desc_id = none
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
								color = black_1guitar
								texture = `tex/models/characters/layers/cab/esp/bass63_ex_ld_01`
								flags = 4
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics073`
								color = yellow_orange_2
								y_trans = -34
								x_scale = 26
								y_scale = 33
								rot = 1573
								flags = 3
								x_trans = 4
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
								texture = `tex/models/characters/layers/cab/esp/bass_fretboard_24_inlay_05`
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
			cas_drums = {
				desc_id = newtamatriple
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						material = newtamatriple_primary1
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld08`
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
			cas_mic = {
				desc_id = `classic rock`
			}
			cas_mic_stand = {
				desc_id = `classic rock`
			}
		}
	}
	{
		name = gh_rocker_judy
		fullname = qs(0xa9028c21)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_judy
		blurb = qs(0xb5a58be6)
		appearance = {
			genre = `heavy metal`
			cas_full_body = {
				desc_id = judy_1
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
								color = black_1guitar
								texture = `tex/models/characters/layers/cag/schecter/gtr73_sch_s1_ld02`
								flags = 4
							}
							{
								texture = `tex/models/characters/layers/cag/all_clear3`
								flags = 4
							}
							{
								texture = `tex/models/characters/layers/cag/schecter/gtr73_sch_s1_dtl02`
								flags = 4
								color = yellow_1guitar
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_icons055`
								color = yellow_3guitar
								x_trans = -38
								x_scale = 19
								y_scale = 26
								rot = 1573
								flags = 3
								y_trans = 23
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
								texture = `tex/models/characters/layers/cag/gh5/22_fret_ld34_shctr_ladyluck`
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
						]
					}
				]
				chosen_materials = {
					material1 = yellow_3guitar
				}
			}
			cas_guitar_pickguards = {
				desc_id = gtr73_pg1
			}
			cas_guitar_bridges = {
				desc_id = gtr72_bridge
				chosen_materials = {
					material1 = yellow_3guitar
				}
			}
			cas_guitar_knobs = {
				desc_id = gtr_knob_10c
				chosen_materials = {
					material1 = yellow_3guitar
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
								color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_ld09`
								flags = 4
								color = yellow_2guitar
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
				desc_id = bass_sch_fretboard_22d
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_05`
						material = bass_fretboard_22d_primary
						diffuse
						pre_layer = [
							{
								color = grey_4
								texture = `tex/models/characters/layers/cab/schecter/bs_sch22_inl_ld35`
								flags = 36
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
								color = yellow_2guitar
							}
							{
								texture = `tex/models/characters/layers/cag/all_clear3`
								flags = 36
							}
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_hd_dtl02`
								flags = 36
								color = black_1guitar
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
			cas_drums = {
				desc_id = newtamadouble
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						material = newtamadouble_primary1
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_50`
								flags = 32
								color = violet_3
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
								color = black_1guitar
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = `glam rock`
			}
			cas_mic_stand = {
				desc_id = twisted
			}
		}
	}
	{
		name = gh_rocker_izzy
		fullname = qs(0x3ba5cbc5)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_izzy
		blurb = qs(0xe43bec4c)
		appearance = {
			genre = classic
			cas_full_body = {
				desc_id = izzy_1
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			cas_guitar_body = {
				desc_id = gtr84_mm_petrucci
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/mm/gtr84_mm_petrucci`
						material = gtr84_mm_pet_primary
						diffuse
						pre_layer = [
							{
								color = black_1guitar
								texture = `tex/models/characters/layers/cag/mm/gtr84_mm_dtl01`
								flags = 4
							}
							{
								texture = `tex/models/characters/layers/cag/mm/gtr84_mm_dtl02`
								flags = 4
								color = green_3guitar
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
								color = green_3guitar
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = gtr84_neckhead01
				chosen_materials = {
					material1 = green_3guitar
				}
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
					material1 = green_3guitar
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
				chosen_materials = {
					material1 = green_3guitar
				}
			}
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
								color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_dtl01`
								flags = 4
								color = green_3guitar
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
				chosen_materials = {
					material1 = green_3guitar
				}
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
				chosen_materials = {
					material1 = green_3guitar
				}
			}
			cas_bass_knobs = {
				desc_id = knob_knurl02
				chosen_materials = {
					material1 = green_3guitar
				}
			}
			cas_bass_misc = {
				desc_id = none
			}
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
								color = green_3guitar
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
								color = black_1guitar
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics094`
								color = green_3guitar
								x_scale = 72
								y_scale = 72
								flags = 3
								y_trans = -7
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_icon026`
								color = grey_5guitar
								y_trans = -13
								y_scale = 51
								flags = 259
								x_scale = 51
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_icon026`
								y_trans = -13
								x_scale = 49
								y_scale = 47
								flags = 259
								color = black_1guitar
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_icon026`
								color = grey_4guitar
								y_trans = -13
								y_scale = 45
								flags = 259
								x_scale = 46
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
								x_trans = -1
								y_trans = -17
								x_scale = 17
								y_scale = 19
								flags = 259
								color = green_3guitar
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics097`
								x_scale = 46
								y_scale = 41
								flags = 3
								y_trans = -7
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = `glam rock`
			}
			cas_mic_stand = {
				desc_id = glam
			}
		}
	}
	{
		name = gh_rocker_johnny
		fullname = qs(0x525fe42c)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_johnny
		blurb = qs(0x94c83b0e)
		appearance = {
			genre = classic
			cas_full_body = {
				desc_id = johnny_1
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
								texture = `tex/models/characters/layers/cag/all_clear`
								flags = 4
							}
							{
								texture = `tex/models/characters/layers/cag/esp/gtr33_trash`
								flags = 4
								color = yellow_orange_1
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
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr33d_nekhed`
						material = gtr33d_neckhead_primary
						diffuse
						pre_layer = [
							{
								color = black_1guitar
								texture = `tex/models/characters/layers/cag/esp/gtr33_nhead_solid`
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
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_misc = {
				desc_id = none
			}
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
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
								color = yellow_green_1guitar
								y_trans = -5
								x_scale = 53
								y_scale = 10
								rot = 1573
								flags = 259
								x_trans = 8
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
								color = yellow_green_1guitar
								x_trans = -2
								y_trans = -5
								y_scale = 10
								rot = 1573
								flags = 259
								x_scale = 53
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
								color = yellow_green_1guitar
								x_trans = -12
								y_trans = -6
								y_scale = 10
								rot = 1573
								flags = 259
								x_scale = 44
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
								color = yellow_green_1guitar
								x_trans = -22
								x_scale = 69
								y_scale = 10
								rot = 1573
								flags = 259
								y_trans = -14
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
								color = yellow_green_1guitar
								y_trans = 2
								x_scale = 69
								y_scale = 10
								rot = 1573
								flags = 259
								x_trans = -32
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
								color = yellow_green_1guitar
								y_trans = 2
								x_scale = 69
								y_scale = 10
								rot = 1573
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
								color = grey_4
								texture = `tex/models/characters/layers/cab/esp/bass_fretboard_inlay_01`
								flags = 4
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
			cas_drums = {
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						material = cad_drums_01_bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_skin_ld09`
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
								color = grey_4guitar
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_23`
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
				desc_id = mic_standard
			}
			cas_mic_stand = {
				desc_id = twisted
			}
		}
	}
]
