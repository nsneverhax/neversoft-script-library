failsafe_car_profile = gh_rocker_johnny
preset_musician_profiles_ghrockers = [
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
		blurb = qs(0x3862608c)
		appearance = {
			genre = `classic rock`
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
						pre_layer = [
							{
								color = black_1guitar
								texture = `tex/models/characters/layers/cag/esp/gtr12_esp_v_series_ld_02`
								flags = 4
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_icon002`
								x_trans = -22
								y_trans = -21
								x_scale = 38
								y_scale = 22
								rot = 2983
								flags = 3
								color = orange_4
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_icon002`
								color = red_orange_3
								x_trans = -15
								y_trans = -17
								x_scale = 37
								rot = 2983
								flags = 3
								y_scale = 24
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_icon002`
								color = red_2
								x_trans = -7
								y_trans = -12
								x_scale = 37
								rot = 3043
								flags = 3
								y_scale = 21
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_icon002`
								color = orange_4
								x_trans = -22
								x_scale = 38
								y_scale = 22
								rot = 3403
								flags = 3
								y_trans = 20
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_icon002`
								color = red_orange_3
								x_trans = -15
								x_scale = 37
								y_scale = 24
								rot = 3343
								flags = 3
								y_trans = 15
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_icon002`
								color = red_2
								x_trans = -7
								x_scale = 37
								y_scale = 21
								rot = 3283
								flags = 3
								y_trans = 9
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gh5/24fret_ld105_esp_updots`
								flags = 36
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = gtr12_neckhead_07
				chosen_materials = {
					material1 = grey_2guitar
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr4_neckhead_d_07`
						pre_layer = [
							{
								color = black_1guitar
								texture = `tex/models/characters/layers/cag/esp/gtr4_neckhead_07_ld_01`
								flags = 36
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
				desc_id = gtr72_bridge
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
				desc_id = none
			}
			cas_bass_body = {
				desc_id = bass63_ex
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\esp\bass63_ex_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/esp/bass63_ex_ld_01`
								color = black_1guitar
								flags = 4
								a = 100
							}
							{
								texture = `tex/models/characters/layers/cag/all_clear3`
								flags = 4
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
				desc_id = bass_fretboard_24d
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
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
				desc_id = bass63_neckhead
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass63_neckhead_d`
						pre_layer = [
							{
								color = black_1guitar
								texture = `tex/models/characters/layers/cab/esp/bass63_neckhead_ld_01`
								flags = 36
							}
							{
								texture = `tex/models/characters/layers/cab/esp/bass63_neckhead_dtl05`
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
				desc_id = bass_emgpickup2b
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bass17_bridge02
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_knobs = {
				desc_id = bass_knob_01
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_misc = {
				desc_id = none
			}
			cas_drums = {
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh6_skins_ld03`
								flags = 4
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_sponsors_tama_01b`
								y_trans = 31
								flags = 3
								x_scale = 36
								y_scale = 36
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld31`
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
			cas_mic = {
				desc_id = `classic rock`
			}
			cas_mic_stand = {
				desc_id = `classic rock`
			}
		}
	}
	{
		name = gh_rocker_axel_2
		fullname = qs(0xd6714ae3)
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		preset_icon = photo_axel
		blurb = qs(0x94a1e397)
		locked
		appearance = {
			genre = `classic rock`
			cas_full_body = {
				desc_id = axel_2
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			cas_full_guitar = {
				desc_id = gtr150_nvsft_axel
			}
			cas_full_bass = {
				desc_id = bass150_nvsft_axel
			}
			cas_drums = {
				desc_id = newtamatriple
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh6_skins_ld01`
								flags = 4
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_sponsors_tama_01`
								y_trans = 31
								flags = 3
								x_scale = 36
								y_scale = 36
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = metal
			}
			cas_mic_stand = {
				desc_id = mic_stand_blackmetal
			}
		}
	}
	{
		name = gh_rocker_axel_2_ghost
		fullname = qs(0x08b73051)
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		preset_icon = photo_axel
		blurb = qs(0x94a1e397)
		locked
		appearance = {
			genre = `classic rock`
			cas_full_body = {
				desc_id = axel_2_ghost
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			cas_full_guitar = {
				desc_id = gtr150_nvsft_axel_ghost
			}
			cas_full_bass = {
				desc_id = bass150_nvsft_axel_ghost
			}
			cas_drums = {
				desc_id = newtamatriple
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh6_skins_ld01`
								flags = 4
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_sponsors_tama_01`
								y_trans = 31
								flags = 3
								x_scale = 36
								y_scale = 36
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = metal
			}
			cas_mic_stand = {
				desc_id = mic_stand_blackmetal
			}
		}
	}
	{
		name = gh_rocker_echo_tesla
		fullname = qs(0xa26ff67a)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_casey
		blurb = qs(0x8a2cdff8)
		appearance = {
			genre = `heavy metal`
			cas_full_body = {
				desc_id = 2009_1
			}
			cas_female_physique = {
				desc_id = femalephysiqueuntouched
			}
			cas_guitar_body = {
				desc_id = gtr75_ibz_xpt
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/ibanez/gtr75_ibz_xpt_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/ibanez/gtr75_ibz_xpt_ld07`
								flags = 4
								color = grey_3guitar
							}
							{
								texture = `tex/models/characters/layers/cag/ibanez/gtr75_ibz_xpt_dtl03`
								a = 55
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
			cas_guitar_neck = {
				desc_id = cag_24fret_ibanez04
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
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
				desc_id = gtr75_neckhead_01
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/ibanez/gtr75_neckhead_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/ibanez/gtr75_neckhead_ld02`
								flags = 36
								color = black_1guitar
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
					material1 = black_1guitar
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
					material1 = black_1guitar
				}
			}
			cas_bass_body = {
				desc_id = bas_sch_stil
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\schecter\bas_sch_stil_bod`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_stil_dtl01`
								color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_stil_ld24`
								flags = 4
								color = grey_2guitar
							}
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_stil_ld23`
								flags = 4
								color = grey_4guitar
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
						pre_layer = [
							{
								color = grey_4
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_inl_ld33`
								flags = 36
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = bas_neckhead_sch_stl
				chosen_materials = {
					material1 = grey_2guitar
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/schecter/bs_sch_head_stil01`
						pre_layer = [
							{
								color = black_1guitar
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_stl_hd_dtl06`
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
				desc_id = bass_emgpickup3
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bas_brdg_capsule
				chosen_materials = {
					material1 = grey_2guitar
				}
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
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh6_skins_ld06`
								flags = 4
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_sponsors_tama_01b`
								y_trans = 31
								flags = 3
								x_scale = 36
								y_scale = 36
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_tamashell_ld07`
								flags = 32
								color = teal_3
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = mic_standard1
			}
			cas_mic_stand = {
				desc_id = rock
			}
		}
	}
	{
		name = gh_rocker_echo_tesla_2
		fullname = qs(0xe26d3d5f)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_casey
		blurb = qs(0x07a3ea6d)
		locked
		appearance = {
			genre = `heavy metal`
			cas_full_body = {
				desc_id = 2009_2
			}
			cas_female_physique = {
				desc_id = femalephysiqueuntouched
			}
			cas_full_body_acc = {
				desc_id = _2009_2_forearmfx_cyl
			}
			cas_guitar_body = {
				desc_id = gtr130_steampunk
			}
			cas_guitar_neck = {
				desc_id = gtr_fretboard_sp
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/heroes/gtr_sp_fretboard_d`
						pre_layer = [
							{
								color = grey_5
								texture = `tex/models/characters/layers/cag/gh5/22_fret_ld26_hero_cogs`
								flags = 36
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = gtr130_neckhead
			}
			cas_guitar_pickguards = {
				desc_id = gtr130_pg
			}
			cas_guitar_bridges = {
				desc_id = gtr130_bridge
			}
			cas_guitar_knobs = {
				desc_id = gtr130_knob
			}
			cas_guitar_pickups = {
				desc_id = gtr130_pickup
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_misc = {
				desc_id = gtr130_misc
			}
			cas_full_bass = {
				desc_id = bass130_steampunk
			}
			cas_drums = {
				desc_id = newtamadouble
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld25`
								flags = 32
								color = green_1guitar
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_15`
								flags = 4
								color = black_1guitar
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_sponsors_tama_01`
								y_trans = 31
								flags = 3
								x_scale = 36
								y_scale = 36
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = mic_standard1
			}
			cas_mic_stand = {
				desc_id = rock
			}
		}
	}
	{
		name = gh_rocker_echo_tesla_2_ghost
		fullname = qs(0x3cab47ed)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_casey
		blurb = qs(0x4f909b57)
		locked
		appearance = {
			genre = `heavy metal`
			cas_full_body = {
				desc_id = 2009_2_ghost
			}
			cas_female_physique = {
				desc_id = femalephysiqueuntouched
			}
			cas_full_body_acc = {
				desc_id = _2009_2_forearmfx_cyl
			}
			cas_guitar_body = {
				desc_id = gtr130_steampunk_ghost
			}
			cas_guitar_neck = {
				desc_id = gtr_fretboard_sp_ghost
			}
			cas_guitar_head = {
				desc_id = gtr130_neckhead_ghost
			}
			cas_guitar_pickguards = {
				desc_id = gtr130_pg_ghost
			}
			cas_guitar_bridges = {
				desc_id = gtr130_bridge_ghost
			}
			cas_guitar_knobs = {
				desc_id = gtr130_knob_ghost
			}
			cas_guitar_pickups = {
				desc_id = gtr130_pickup_ghost
			}
			cas_guitar_misc = {
				desc_id = gtr130_misc_ghost
			}
			cas_full_bass = {
				desc_id = bass130_steampunk_ghost
			}
			cas_drums = {
				desc_id = newtamadouble
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld25`
								flags = 32
								color = green_1guitar
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_15`
								flags = 4
								color = black_1guitar
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_sponsors_tama_01`
								y_trans = 31
								flags = 3
								x_scale = 36
								y_scale = 36
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = mic_standard1
			}
			cas_mic_stand = {
				desc_id = rock
			}
		}
	}
	{
		name = gh_rocker_austin_tejas
		fullname = qs(0xa113847a)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x575a49bc)
		appearance = {
			genre = `heavy metal`
			cas_full_body = {
				desc_id = newmale_1
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			cas_guitar_body = {
				desc_id = gtr71_sch_c1
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/schecter/gtr71_sch_c1_d`
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
				desc_id = cag_22fret_schecter04
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
						pre_layer = [
							{
								color = grey_5
								texture = `tex/models/characters/layers/cag/gh5/22_fret_ld32_shctr_estar`
								flags = 36
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = gtr71_neckhead_01
				chosen_materials = {
					material1 = black_1guitar
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/schecter/gtr71_neckhead_01_d`
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
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_knobs = {
				desc_id = gtr_knob_01c
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
				desc_id = gtr_misc_switch4
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_body = {
				desc_id = bass14_esp_surveyor
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\esp\bass14_esp_surveyor_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/esp/bass14_esp_ax_ld_11`
								flags = 4
								color = orange_1
							}
							{
								texture = `tex/models/characters/layers/cab/esp/bass14_esp_ax_dtl_05`
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
				desc_id = bass_fretboard_22d
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_05`
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/esp/bass9_neckhead4_ld_11`
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
				desc_id = bass_emgpickup2b
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bass17_bridge02
			}
			cas_bass_knobs = {
				desc_id = bass_knob_01
			}
			cas_bass_misc = {
				desc_id = bass13_misc
			}
			cas_drums = {
				desc_id = newtamadouble
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh6_skins_ld02`
								flags = 4
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_sponsors_tama_01b`
								y_trans = 31
								flags = 3
								x_scale = 36
								y_scale = 36
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_04`
								color = red_1
								flags = 32
								a = 30
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
				desc_id = `classic rock`
			}
		}
	}
	{
		name = gh_rocker_austin_tejas_2
		fullname = qs(0xfdac14dc)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x8dd82eab)
		locked
		appearance = {
			genre = `heavy metal`
			cas_full_body = {
				desc_id = newmale_2
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			cas_full_guitar = {
				desc_id = gtr140_pumpkin
			}
			cas_full_bass = {
				desc_id = bass140_pumpkin
			}
			cas_drums = {
				desc_id = newtamadouble
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh6_skins_ld14`
								flags = 4
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_sponsors_tama_01b`
								y_trans = 31
								flags = 3
								x_scale = 36
								y_scale = 36
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
				desc_id = `classic rock`
			}
		}
	}
	{
		name = gh_rocker_austin_tejas_2_ghost
		fullname = qs(0xef7af050)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x8dd82eab)
		locked
		appearance = {
			genre = `heavy metal`
			cas_full_body = {
				desc_id = newmale_2_ghost
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			cas_full_guitar = {
				desc_id = gtr140_pumpkin_ghost
			}
			cas_full_bass = {
				desc_id = bass140_pumpkin_ghost
			}
			cas_drums = {
				desc_id = newtamadouble
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh6_skins_ld14`
								flags = 4
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_sponsors_tama_01b`
								y_trans = 31
								flags = 3
								x_scale = 36
								y_scale = 36
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
				desc_id = `classic rock`
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
		blurb = qs(0x53fad134)
		appearance = {
			genre = `heavy metal`
			cas_full_body = {
				desc_id = casey_1
			}
			cas_female_physique = {
				desc_id = femalephysiqueuntouched
			}
			cas_guitar_body = {
				desc_id = gtr4_esp_eclipse_01
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr4_esp_eclipse_d_01`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr4_esp_eclipse_ld_03`
								flags = 4
							}
							{
								texture = `tex/models/characters/layers/cag/esp/gtr4_esp_eclipse_dtl_05`
								flags = 4
								color = grey_5guitar
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/all_clear4`
								flags = 4
							}
							{
								color = black_1guitar
								texture = `tex/models/characters/layers/cag/esp/gtr4_neckhead_ld_03`
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
				desc_id = gtr_bridge_01d
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_guitar_knobs = {
				desc_id = gtr_knob_02
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_type2_paf1
				chosen_materials = {
					material1 = grey_5guitar
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/all_clear`
								flags = 4
							}
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_stil_ld21`
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
				desc_id = bass_sch_fretboard_24d
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
						pre_layer = [
							{
								color = grey_4
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_inl_ld35`
								flags = 36
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = bas_neckhead_sch_stl
				chosen_materials = {
					material1 = grey_2guitar
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/schecter/bs_sch_head_stil01`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/all_clear`
								flags = 36
							}
							{
								color = black_1guitar
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_stl_hd_dtl07`
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
				desc_id = bass_emgpickup3
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bas_brdg_capsule
				chosen_materials = {
					material1 = grey_2guitar
				}
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh6_skins_ld04`
								flags = 4
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_sponsors_tama_01b`
								y_trans = 31
								flags = 3
								x_scale = 36
								y_scale = 36
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_21`
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
			cas_mic = {
				desc_id = `classic rock`
			}
			cas_mic_stand = {
				desc_id = `classic rock`
			}
		}
	}
	{
		name = gh_rocker_casey_2
		fullname = qs(0xd221485e)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_casey
		blurb = qs(0x1e6aaf30)
		locked
		appearance = {
			genre = `heavy metal`
			cas_full_body = {
				desc_id = casey_2
			}
			cas_female_physique = {
				desc_id = femalephysiqueuntouched
			}
			cas_full_guitar = {
				desc_id = gtr16_mcswain_snake02
			}
			cas_full_bass = {
				desc_id = bass116_mcswain_snake
			}
			cas_drums = {
				desc_id = newtamatriple
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld17`
								flags = 32
								color = red_1
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh6_skins_ld05`
								flags = 4
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_sponsors_tama_01`
								y_trans = 31
								flags = 3
								x_scale = 36
								y_scale = 36
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
		name = gh_rocker_casey_2_ghost
		fullname = qs(0xb402c280)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_casey
		blurb = qs(0x1e6aaf30)
		locked
		appearance = {
			genre = `heavy metal`
			cas_full_body = {
				desc_id = casey_2_ghost
			}
			cas_female_physique = {
				desc_id = femalephysiqueuntouched
			}
			cas_full_guitar = {
				desc_id = gtr16_mcswain_snake_ghost
			}
			cas_full_bass = {
				desc_id = bass116_mcswain_snake_ghost
			}
			cas_drums = {
				desc_id = newtamatriple
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld17`
								flags = 32
								color = red_1
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh6_skins_ld05`
								flags = 4
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_sponsors_tama_01`
								y_trans = 31
								flags = 3
								x_scale = 36
								y_scale = 36
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
		name = gh_rocker_casey_cut_body
		fullname = qs(0x3bbe93fa)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_casey
		blurb = qs(0xeb5811b4)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = `heavy metal`
			cas_full_body = {
				desc_id = casey_cut_body
			}
			cas_female_physique = {
				desc_id = femalephysiqueuntouched
			}
			cas_guitar_body = {
				desc_id = gtr4_esp_eclipse_01
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr4_esp_eclipse_d_01`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr4_esp_eclipse_ld_03`
								flags = 4
							}
							{
								texture = `tex/models/characters/layers/cag/esp/gtr4_esp_eclipse_dtl_05`
								flags = 4
								color = grey_5guitar
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/all_clear4`
								flags = 4
							}
							{
								color = black_1guitar
								texture = `tex/models/characters/layers/cag/esp/gtr4_neckhead_ld_03`
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
				desc_id = gtr_bridge_01d
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_guitar_knobs = {
				desc_id = gtr_knob_02
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_type2_paf1
				chosen_materials = {
					material1 = grey_5guitar
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/all_clear`
								flags = 4
							}
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_stil_ld21`
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
				desc_id = bass_sch_fretboard_24d
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
						pre_layer = [
							{
								color = grey_4
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_inl_ld35`
								flags = 36
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = bas_neckhead_sch_stl
				chosen_materials = {
					material1 = grey_2guitar
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/schecter/bs_sch_head_stil01`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/all_clear`
								flags = 36
							}
							{
								color = black_1guitar
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_stl_hd_dtl07`
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
				desc_id = bass_emgpickup3
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bas_brdg_capsule
				chosen_materials = {
					material1 = grey_2guitar
				}
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh6_skins_ld04`
								flags = 4
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_sponsors_tama_01b`
								y_trans = 31
								flags = 3
								x_scale = 36
								y_scale = 36
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_21`
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
			cas_mic = {
				desc_id = `classic rock`
			}
			cas_mic_stand = {
				desc_id = `classic rock`
			}
		}
	}
	{
		name = gh_rocker_casey_cut_skin
		fullname = qs(0x8cd78803)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_casey
		blurb = qs(0xeb5811b4)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = `heavy metal`
			cas_full_body = {
				desc_id = casey_cut_skin
			}
			cas_female_physique = {
				desc_id = femalephysiqueuntouched
			}
			cas_guitar_body = {
				desc_id = gtr4_esp_eclipse_01
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr4_esp_eclipse_d_01`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr4_esp_eclipse_ld_03`
								flags = 4
							}
							{
								texture = `tex/models/characters/layers/cag/esp/gtr4_esp_eclipse_dtl_05`
								flags = 4
								color = grey_5guitar
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/all_clear4`
								flags = 4
							}
							{
								color = black_1guitar
								texture = `tex/models/characters/layers/cag/esp/gtr4_neckhead_ld_03`
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
				desc_id = gtr_bridge_01d
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_guitar_knobs = {
				desc_id = gtr_knob_02
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_type2_paf1
				chosen_materials = {
					material1 = grey_5guitar
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/all_clear`
								flags = 4
							}
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_stil_ld21`
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
				desc_id = bass_sch_fretboard_24d
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
						pre_layer = [
							{
								color = grey_4
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_inl_ld35`
								flags = 36
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = bas_neckhead_sch_stl
				chosen_materials = {
					material1 = grey_2guitar
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/schecter/bs_sch_head_stil01`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/all_clear`
								flags = 36
							}
							{
								color = black_1guitar
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_stl_hd_dtl07`
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
				desc_id = bass_emgpickup3
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bas_brdg_capsule
				chosen_materials = {
					material1 = grey_2guitar
				}
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh6_skins_ld04`
								flags = 4
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_sponsors_tama_01b`
								y_trans = 31
								flags = 3
								x_scale = 36
								y_scale = 36
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_21`
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
		blurb = qs(0x88b574cf)
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
				desc_id = cag_22fret_schecter03
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d3_01`
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
				desc_id = gtr_bridge_01
			}
			cas_guitar_knobs = {
				desc_id = gtr_knob_01c
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_type2_paf1
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_guitar_misc = {
				desc_id = gtr_misc_switch4
			}
			cas_bass_body = {
				desc_id = bass64_f405
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\esp\bass64_f405_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/esp/bass64_f405_ld_13`
								color = purple_blue_1
							}
							{
								texture = `tex/models/characters/layers/cab/esp/bass64_f405_dtl_02`
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
				desc_id = bass64_neckhead
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass64_neckhead_d`
						pre_layer = [
							{
								color = black_1guitar
								texture = `tex/models/characters/layers/cab/esp/bass64_neckhead_ld_07`
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
				desc_id = bass_emgpickup2b
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bass17_bridge01
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_knobs = {
				desc_id = bass_knob_04
			}
			cas_bass_misc = {
				desc_id = none
			}
			cas_drums = {
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh6_skins_ld10`
								flags = 4
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_sponsors_tama_01`
								y_trans = 31
								flags = 3
								x_scale = 36
								y_scale = 36
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_53`
								color = red_2
								flags = 32
								a = 30
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = mic_standard1
			}
			cas_mic_stand = {
				desc_id = twisted
			}
		}
	}
	{
		name = gh_rocker_judy_2
		fullname = qs(0xb88cc41a)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_judy
		blurb = qs(0x8b4b3ee1)
		locked
		appearance = {
			genre = `heavy metal`
			cas_full_body = {
				desc_id = judy_2
			}
			cas_female_physique = {
				desc_id = judyphysique
			}
			cas_full_guitar = {
				desc_id = gtr138_judy
			}
			cas_full_bass = {
				desc_id = bass138_judy
			}
			cas_drums = {
				desc_id = newtamatriple
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_tamashell_ld01`
								flags = 32
								color = red_2
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh6_skins_ld11`
								flags = 4
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_sponsors_tama_01b`
								y_trans = 31
								flags = 3
								x_scale = 36
								y_scale = 36
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = mic_standard1
			}
			cas_mic_stand = {
				desc_id = twisted
			}
		}
	}
	{
		name = gh_rocker_judy_2_ghost
		fullname = qs(0x664abea8)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_judy
		blurb = qs(0x8b4b3ee1)
		locked
		appearance = {
			genre = `heavy metal`
			cas_full_body = {
				desc_id = judy_2_ghost
			}
			cas_female_physique = {
				desc_id = judyphysique
			}
			cas_full_guitar = {
				desc_id = gtr138_judy_ghost
			}
			cas_full_bass = {
				desc_id = bass138_judy_ghost
			}
			cas_drums = {
				desc_id = newtamatriple
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_tamashell_ld01`
								flags = 32
								color = red_2
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh6_skins_ld11`
								flags = 4
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_sponsors_tama_01b`
								y_trans = 31
								flags = 3
								x_scale = 36
								y_scale = 36
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = mic_standard1
			}
			cas_mic_stand = {
				desc_id = twisted
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
		blurb = qs(0x684ec9c7)
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/ibanez/gtr75_ibz_xpt_ld02`
								flags = 4
								color = grey_4guitar
							}
							{
								texture = `tex/models/characters/layers/cag/ibanez/gtr75_ibz_xpt_dtl03`
								flags = 4
								color = blue_1
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
				desc_id = gtr75_neckhead_01
				chosen_materials = {
					material1 = grey_5guitar
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/ibanez/gtr75_neckhead_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/ibanez/gtr75_neckhead_ld02`
								flags = 36
								color = grey_4guitar
							}
							{
								texture = `tex/models/characters/layers/cag/all_clear3`
								flags = 4
							}
							{
								color = black_1guitar
								texture = `tex/models/characters/layers/cag/ibanez/gtr75_neckhead_01_dtl07`
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
					material1 = grey_5guitar
				}
			}
			cas_guitar_knobs = {
				desc_id = gtr_knob_01
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_guitar_pickups = {
				desc_id = gtr78_pickup
				chosen_materials = {
					material1 = grey_4guitar
				}
			}
			cas_guitar_misc = {
				desc_id = gtr_misc_switch4
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_bass_body = {
				desc_id = bass9_esp_ax_01
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\esp\bass9_esp_ax_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/esp/bass9_esp_ax_ld_13`
								flags = 4
								color = blue_1
							}
							{
								texture = `tex/models/characters/layers/cab/esp/bass9_esp_ax_dtl_04`
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/esp/bass_fretboard_24_inlay_03`
								flags = 4
								color = blue_3
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
				desc_id = bass_emgpickup2b
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bass17_bridge02
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_knobs = {
				desc_id = bass_knob_01
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_misc = {
				desc_id = none
			}
			cas_drums = {
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh6_skins_ld15`
								flags = 4
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_sponsors_tama_01b`
								y_trans = 31
								flags = 3
								x_scale = 36
								y_scale = 36
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = goth
			}
			cas_mic_stand = {
				desc_id = goth
			}
		}
	}
	{
		name = gh_rocker_pandora_2
		fullname = qs(0xdd6fc2f4)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_pandora
		blurb = qs(0x5cebcd36)
		locked
		appearance = {
			genre = goth
			cas_full_body = {
				desc_id = pandora_2
			}
			cas_female_physique = {
				desc_id = femalephysiqueuntouched
			}
			cas_full_guitar = {
				desc_id = gtr_pandora
			}
			cas_full_bass = {
				desc_id = bass142_pandora
			}
			cas_drums = {
				desc_id = newtamatriple
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld28`
								flags = 32
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh6_skins_ld16`
								flags = 4
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_sponsors_tama_01b`
								y_trans = 31
								flags = 3
								x_scale = 36
								y_scale = 36
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = goth
			}
			cas_mic_stand = {
				desc_id = goth
			}
		}
	}
	{
		name = gh_rocker_pandora_2_ghost
		fullname = qs(0xed3e2104)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_pandora
		blurb = qs(0x5cebcd36)
		locked
		appearance = {
			genre = goth
			cas_full_body = {
				desc_id = pandora_2_ghost
			}
			cas_female_physique = {
				desc_id = femalephysiqueuntouched
			}
			cas_full_guitar = {
				desc_id = gtr_pandora_ghost
			}
			cas_full_bass = {
				desc_id = bass142_pandora_ghost
			}
			cas_drums = {
				desc_id = newtamatriple
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld28`
								flags = 32
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh6_skins_ld16`
								flags = 4
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_sponsors_tama_01b`
								y_trans = 31
								flags = 3
								x_scale = 36
								y_scale = 36
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = goth
			}
			cas_mic_stand = {
				desc_id = goth
			}
		}
	}
	{
		name = gh_rocker_lars
		fullname = qs(0x9dd7644f)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_lars
		blurb = qs(0xf11d78e2)
		face_tension = 0
		appearance = {
			genre = `heavy metal`
			cas_full_body = {
				desc_id = lars_1
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			cas_guitar_body = {
				desc_id = gtr22_bc_rich_warlock
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr22_bc_rich_warlock_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/bc_rich/gtr_bc_rich_warlock_ld1`
								flags = 4
								color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cag/all_clear3`
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/all_clear2`
								flags = 4
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = gtr22_neckhead_pointed5
				chosen_materials = {
					material1 = grey_2guitar
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr20_neckhead_pointed3_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/bc_rich/gtr20_neckhead_pointed_ld02`
								flags = 36
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
				desc_id = gtr_pickup_bc01
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_misc = {
				desc_id = gtr_misc_switch
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_bass_body = {
				desc_id = bass64_f405
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\esp\bass64_f405_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/esp/bass64_f405_ld_03`
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
				desc_id = bass64_neckhead
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass64_neckhead_d`
						pre_layer = [
							{
								color = black_1guitar
								texture = `tex/models/characters/layers/cab/esp/bass64_neckhead_ld_07`
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
				desc_id = bass_emgpickup2b
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bass17_bridge01
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_knobs = {
				desc_id = bass_knob_05
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_bass_misc = {
				desc_id = none
			}
			cas_drums = {
				desc_id = newtamatriple
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh6_skins_ld12`
								flags = 4
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_sponsors_tama_01b`
								y_trans = 31
								flags = 3
								x_scale = 36
								y_scale = 36
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_04`
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
			cas_mic = {
				desc_id = `black metal`
			}
			cas_mic_stand = {
				desc_id = `classic rock`
			}
		}
	}
	{
		name = gh_rocker_lars_2
		fullname = qs(0x69396dd9)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_lars
		blurb = qs(0xd09f0010)
		locked
		face_tension = 0
		appearance = {
			genre = `heavy metal`
			cas_full_body = {
				desc_id = lars_2
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			cas_full_guitar = {
				desc_id = gtr139_battleaxe
			}
			cas_full_bass = {
				desc_id = bass139_battleaxe
			}
			cas_drums = {
				desc_id = newtamatriple
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh6_skins_ld13`
								flags = 4
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_sponsors_tama_01b`
								y_trans = 31
								flags = 3
								x_scale = 36
								y_scale = 36
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = `black metal`
			}
			cas_mic_stand = {
				desc_id = `classic rock`
			}
		}
	}
	{
		name = gh_rocker_lars_2_ghost
		fullname = qs(0xb7ff176b)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_lars
		blurb = qs(0xd09f0010)
		locked
		appearance = {
			genre = `heavy metal`
			cas_full_body = {
				desc_id = lars_2_ghost
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			cas_full_guitar = {
				desc_id = gtr139_battleaxe_ghost
			}
			cas_full_bass = {
				desc_id = bass139_battleaxe_ghost
			}
			cas_drums = {
				desc_id = newtamatriple
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh6_skins_ld13`
								flags = 4
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_sponsors_tama_01b`
								y_trans = 31
								flags = 3
								x_scale = 36
								y_scale = 36
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = `black metal`
			}
			cas_mic_stand = {
				desc_id = `classic rock`
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
		blurb = qs(0x6f428603)
		appearance = {
			genre = classic
			cas_full_body = {
				desc_id = johnny_1
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			cas_guitar_body = {
				desc_id = gtr11_mcswain_carved
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/mcswain/gtr11_mcswain_carved_d`
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
				desc_id = bass63_ex
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\esp\bass63_ex_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/esp/bass63_ex_ld_01`
								flags = 4
								color = grey_4guitar
							}
							{
								texture = `tex/models/characters/layers/cag/all_clear3`
								flags = 4
							}
							{
								color = red_2
								texture = `tex/models/characters/layers/cab/esp/bass63_ex_dtl_12`
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
						pre_layer = [
							{
								color = grey_4
								texture = `tex/models/characters/layers/cab/esp/bass_fretboard_24_inlay_02`
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/esp/bass63_neckhead_ld_01`
								flags = 36
								color = grey_4guitar
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = none
			}
			cas_bass_pickups = {
				desc_id = bass_emgpickup2b
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bass17_bridge02
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh6_skins_ld08`
								flags = 4
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_sponsors_tama_01`
								y_trans = 31
								flags = 3
								x_scale = 36
								y_scale = 36
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld16`
								color = yellow_1guitar
								flags = 32
								a = 50
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = mic_standard3
			}
			cas_mic_stand = {
				desc_id = twisted
			}
		}
	}
	{
		name = gh_rocker_johnny_2
		fullname = qs(0xa77a115c)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_johnny
		blurb = qs(0x76c9cffd)
		locked
		appearance = {
			genre = classic
			cas_full_body = {
				desc_id = johnny_2
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			cas_full_guitar = {
				desc_id = gtr135b_johnny
			}
			cas_full_bass = {
				desc_id = bass135b_johnny
			}
			cas_drums = {
				desc_id = newtamadouble
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_04`
								flags = 32
								color = grey_5guitar
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh6_skins_ld09`
								flags = 4
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_sponsors_tama_01`
								y_trans = 31
								flags = 3
								x_scale = 36
								y_scale = 36
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = mic_standard3
			}
			cas_mic_stand = {
				desc_id = twisted
			}
		}
	}
	{
		name = gh_rocker_johnny_2_ghost
		fullname = qs(0xb5acf5d0)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_johnny
		blurb = qs(0x76c9cffd)
		locked
		appearance = {
			genre = classic
			cas_full_body = {
				desc_id = johnny_2_ghost
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			cas_full_guitar = {
				desc_id = gtr135b_johnny_ghost
			}
			cas_full_bass = {
				desc_id = bass135b_johnny_ghost
			}
			cas_drums = {
				desc_id = newtamadouble
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_04`
								flags = 32
								color = grey_5guitar
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh6_skins_ld09`
								flags = 4
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_sponsors_tama_01`
								y_trans = 31
								flags = 3
								x_scale = 36
								y_scale = 36
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = mic_standard3
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
		blurb = qs(0x0c6c753c)
		locked
		appearance = {
			genre = classic
			cas_full_body = {
				desc_id = izzy_1
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			cas_guitar_body = {
				desc_id = gtr12_mcswain_minferno
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/mcswain/gtr12_mcswain_minferno_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/mcswain/gtr12_mcswain_minferno_ld2`
								flags = 4
							}
							{
								color = red_orange_3
								texture = `tex/models/characters/layers/cag/mcswain/gtr12_mcswain_minferno_fd2`
								flags = 4
							}
							{
								texture = `tex/models/characters/layers/cag/mcswain/gtr12_mcswain_minferno_dtl1`
								flags = 4
								color = grey_5guitar
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
				chosen_materials = {
					material1 = yellow_orange_5
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/mcswain/gtr12_neckhead_mcswain_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/mcswain/gtr12_nkhd_mcswain_ld2`
								flags = 4
							}
							{
								texture = `tex/models/characters/layers/cag/all_clear3`
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
				desc_id = none
			}
			cas_guitar_bridges = {
				desc_id = gtr_brdg_mcswn_inferno_3
				chosen_materials = {
					material1 = yellow_orange_5
				}
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
			cas_bass_body = {
				desc_id = bas_ibz_sr505
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\ibanez\bs_ibz_sr_body`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_ld00`
								color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cag/all_clear3`
								flags = 4
							}
							{
								texture = `tex/models/characters/layers/cab/esp/bass63_ex_dtl_19`
								flags = 4
								color = yellow_1guitar
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = bass_ibz_fretboard_24d
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
						pre_layer = [
							{
								color = grey_5guitar
								texture = `tex/models/characters/layers/cab/ibanez/bass_ibz24_inlay_61`
								flags = 4
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = bas_ibz_sr_head01
				chosen_materials = {
					material1 = yellow_2guitar
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/ibanez/bs_ibz_sr_head`
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
					material1 = yellow_2guitar
				}
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
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld48`
								flags = 32
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_skin_ld21`
								flags = 4
								color = grey_3guitar
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_sponsors_tama_01`
								y_trans = 31
								flags = 3
								x_scale = 36
								y_scale = 36
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = mic_frequency
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
		blurb = qs(0x72d1b030)
		locked
		appearance = {
			genre = classic
			cas_full_body = {
				desc_id = eddie_1
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			cas_guitar_body = {
				desc_id = gtr11_mcswain_carved
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/mcswain/gtr11_mcswain_carved_d`
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
				desc_id = cag_22fret_mcswain04
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
						pre_layer = [
							{
								color = grey_5
								texture = `tex/models/characters/layers/cag/gh5/22_fret_ld74_mcswn_bolts`
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
				desc_id = gtr_bridge_mcswain_l_4
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
				desc_id = bass_schect_030
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\schecter\bs_sch_bod04_01`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_bod04_ld02`
								flags = 4
								color = red_1
							}
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_bod04_dtl03`
								flags = 4
								color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_bod04_dtl01`
								flags = 4
								color = red_1
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
						pre_layer = [
							{
								color = grey_4
								texture = `tex/models/characters/layers/cab/schecter/bs_sch22_inl_ld34`
								flags = 36
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = bs_sch_030_nhead01
				chosen_materials = {
					material1 = black_1guitar
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/schecter/bass_neckhead_030`
						pre_layer = [
							{
								color = black_1guitar
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_04_hd_dtl07`
								flags = 36
							}
							{
								texture = `tex/models/characters/layers/cag/all_clear2`
								flags = 36
							}
							{
								texture = `tex/models/characters/layers/cag/all_clear3`
								flags = 36
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = bs_sch_030_pga
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/schecter/bs_sch_04_pga`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_04_pga_ld01`
								flags = 4
								color = black_1guitar
							}
						]
					}
				]
			}
			cas_bass_pickups = {
				desc_id = bass_emgpickup2b
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bs_sch_brdg_a
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_knobs = {
				desc_id = bass_knob_09
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_misc = {
				desc_id = none
			}
			cas_drums = {
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld46`
								flags = 32
								color = orange_2
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_skin_ld16`
								flags = 4
								color = yellow_1guitar
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics037`
								color = black_1guitar
								flags = 3
								y_trans = -5
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics037`
								color = black_1guitar
								flags = 3
								y_trans = 4
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics037`
								flags = 3
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_sponsors_tama_01`
								y_trans = 31
								flags = 3
								x_scale = 36
								y_scale = 36
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
				desc_id = rock
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
		blurb = qs(0xdb56557c)
		locked
		appearance = {
			genre = classic
			cas_full_body = {
				desc_id = clive_1
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			cas_guitar_body = {
				desc_id = gtr4_esp_eclipse_01
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr4_esp_eclipse_d_01`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr4_esp_eclipse_ld_04`
								flags = 4
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
						pre_layer = [
							{
								color = black_1guitar
								texture = `tex/models/characters/layers/cag/esp/gtr4_neckhead_ld_01`
								flags = 36
							}
							{
								texture = `tex/models/characters/layers/cag/esp/gtr4_neckhead_dtl_01`
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
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_knobs = {
				desc_id = gtr_knob_02
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
				desc_id = gtr_misc_switch4
			}
			cas_bass_body = {
				desc_id = bass17_esp_ec_01
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\esp\bass17_esp_ec_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/esp/bass17_esp_ec_ld_11`
								flags = 4
								color = orange_3
							}
							{
								texture = `tex/models/characters/layers/cab/esp/bass17_esp_ax_dtl_04`
								flags = 4
								color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cab/esp/bass17_esp_ax_dtl_01`
								flags = 4
								color = orange_1
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
				desc_id = bass14_neckhead_03
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass9_neckhead_d_03`
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
				desc_id = bass_emgpickup2b
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bass17_bridge01
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_01`
								flags = 4
								color = yellow_orange_3
							}
						]
						layers = [
							{
								font = fontgrid_text_a1
								text = 87
								flags = 3
								x_trans = -31
							}
							{
								font = fontgrid_text_a1
								text = 73
								x_trans = -22
								flags = 3
								y_scale = 125
							}
							{
								font = fontgrid_text_a1
								text = 78
								color = grey_5
								flags = 3
								x_trans = -14
							}
							{
								font = fontgrid_text_a1
								text = 83
								x_trans = 0
								x_scale = 175
								flags = 3
								y_scale = 185
							}
							{
								font = fontgrid_text_a1
								text = 84
								flags = 3
								x_trans = 12
							}
							{
								font = fontgrid_text_a1
								text = 79
								y_scale = 125
								flags = 3
								x_trans = 21
							}
							{
								font = fontgrid_text_a1
								text = 78
								flags = 3
								x_trans = 30
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_sponsors_tama_01`
								y_trans = 31
								flags = 3
								x_scale = 36
								y_scale = 36
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld14`
								flags = 32
								color = yellow_orange_4
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
		name = gh_rocker_minotaur
		fullname = qs(0x1e3c77ae)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_lars
		blurb = qs(0x2f403c2d)
		face_tension = 0
		locked
		appearance = {
			genre = `heavy metal`
			cas_full_body = {
				desc_id = minotaur_1
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			cas_guitar_body = {
				desc_id = gtr9_esp_ax
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr9_esp_ax_d`
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
				desc_id = gtr9_neckhead_01
				chosen_materials = {
					material1 = grey_2guitar
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr9_neckhead_d_01`
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
				desc_id = gtr_emg_pickup6
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
				chosen_materials = {
					material1 = black_1guitar
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass9_neckhead_d`
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
				desc_id = bass_emgpickup2b
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bass17_bridge02
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_knobs = {
				desc_id = bass_knob_01
				chosen_materials = {
					material1 = black_1guitar
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh6_skins_ld18`
								flags = 4
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_sponsors_tama_01b`
								y_trans = 31
								flags = 3
								x_scale = 36
								y_scale = 36
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = `black metal`
			}
			cas_mic_stand = {
				desc_id = mic_stand_blackmetal
			}
		}
	}
	{
		name = gh_rocker_arthas
		fullname = qs(0xd3029abb)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_lars
		blurb = qs(0x6e44a3c6)
		face_tension = 0
		locked
		appearance = {
			genre = `heavy metal`
			cas_full_body = {
				desc_id = arthas_1
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			cas_full_guitar = {
				desc_id = gtr141_frostmourne
			}
			cas_full_bass = {
				desc_id = bass141_frostmourne
			}
			cas_drums = {
				desc_id = newtamadouble
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_15`
								flags = 4
								color = black_1guitar
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_sponsors_tama_01`
								y_trans = 31
								flags = 3
								x_scale = 36
								y_scale = 36
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = `black metal`
			}
			cas_mic_stand = {
				desc_id = mic_stand_metal
			}
		}
	}
	{
		name = gh_rocker_demigod
		fullname = qs(0x8e19f89a)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_lars
		blurb = qs(0x80ec020c)
		face_tension = 0
		locked
		appearance = {
			genre = `heavy metal`
			cas_full_body = {
				desc_id = demigod
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			cas_full_guitar = {
				desc_id = gtr137_demi
			}
			cas_full_bass = {
				desc_id = bass137_demi
			}
			cas_drums = {
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld43`
								flags = 32
								color = grey_3guitar
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_skin_ld35`
								flags = 4
								color = grey_2guitar
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_sponsors_tama_01`
								y_trans = 31
								flags = 3
								x_scale = 36
								y_scale = 36
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
		name = gh_rocker_demigod_spirit
		fullname = qs(0x5a40711f)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_lars
		blurb = qs(0x80ec020c)
		face_tension = 0
		locked
		appearance = {
			genre = `heavy metal`
			cas_full_body = {
				desc_id = `demigod spirit`
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			cas_full_guitar = {
				desc_id = gtr137_demi_ghost
			}
			cas_full_bass = {
				desc_id = bass137_demi_ghost
			}
			cas_drums = {
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld43`
								flags = 32
								color = grey_3guitar
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_skin_ld35`
								flags = 4
								color = grey_2guitar
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_sponsors_tama_01`
								y_trans = 31
								flags = 3
								x_scale = 36
								y_scale = 36
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
]
