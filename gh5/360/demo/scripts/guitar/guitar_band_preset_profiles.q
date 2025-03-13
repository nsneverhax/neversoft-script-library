empty_appearance = {
	cas_body = {
		desc_id = nobody
	}
}
worst_male_appearance_hack = {
	cas_male_physique = {
		desc_id = malephysique7
		bones = {
			height = 1.0
			physique = 1.0
		}
	}
}
worst_female_appearance_hack = {
	cas_female_physique = {
		desc_id = femalephysique6
		bones = {
			height = 1.0
			physique = 1.0
			chest = 1.0
		}
	}
}
avatar_profile = {
	name = avatar
	fullname = qs(0xd1b24c56)
	allowed_parts = [
		bass
		drum
		guitar
		vocals
	]
	preset_icon = photo_avatar
	blurb = qs(0x91f094af)
	appearance = {
		genre = `heavy metal`
		cas_full_body = {
			desc_id = avatar
			avatar_meta_data = [
			]
		}
		cas_male_physique = {
			desc_id = avatarphysique
		}
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
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = gtr_fretboard_04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
					material = gtr_fretboard_04_primary
					diffuse
					pre_layer = [
						{
							color = grey_5
							texture = `tex/models/characters/layers/cag/gh5/22fret_ld93_esp_patriot`
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
							texture = `tex/models/characters/layers/cag/esp/gtr4_neckhead_ld_02`
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
			desc_id = gtr4_esp_bridge_02
		}
		cas_guitar_knobs = {
			desc_id = gtr4_esp_knob_10_03
		}
		cas_guitar_pickups = {
			desc_id = gtr_pkup_type1_blk_2
			chosen_materials = {
				material1 = black_1guitar
			}
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
							flags = 4
							color = blue_3
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
			desc_id = bass9_neckhead_01
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
		cas_drums = {
			desc_id = basic
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
preset_musician_profiles_modifiable = [
]
preset_musician_profiles_locked = [
	{
		name = gh_rocker_johnnycash_car
		fullname = qs(0x3a825a9b)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0xa0c0422a)
		no_random_pick
		locked
		appearance = {
			genre = classic
			cas_full_body = {
				desc_id = johnnycash_car
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			cas_guitar_body = {
				desc_id = gtr26_cash_acoustic
			}
			cas_guitar_neck = {
				desc_id = gtr_fretboard_04cash
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
						material = gtr_fretboard_04_primary
						diffuse
						pre_layer = [
							{
								color = grey_5
								texture = `tex/models/characters/layers/cag/gh5/22fret_cash_acoustic`
								flags = 36
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = gtr26_neckhead_cash
			}
			cas_guitar_pickguards = {
				desc_id = none
			}
			cas_guitar_bridges = {
				desc_id = gtr26_bridge_cash
			}
			cas_guitar_knobs = {
				desc_id = none
			}
			cas_guitar_pickups = {
				desc_id = gtr26_dummy
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
								texture = `tex/models/characters/layers/cag/all_clear`
								flags = 4
							}
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_ld04`
								flags = 4
								color = red_orange_2
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
								color = black_1guitar
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_hd_dtl07`
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
				desc_id = bass_pickup_emg01
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
				desc_id = basic
				cap = [
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
				desc_id = rock
			}
			cas_mic_stand = {
				desc_id = `classic rock`
			}
		}
	}
	{
		name = gh_rocker_santana
		fullname = qs(0xdbed6658)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x2c584f50)
		no_random_pick
		locked
		appearance = {
			genre = classic
			cas_full_body = {
				desc_id = santana_1
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			cas_guitar_body = {
				desc_id = gtr80_prs_sant
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/prs/prs_80_snt_d`
						material = gtr80_prs_snt_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/prs/gtr80_prs_snt_ld24`
								flags = 4
								color = red_orange_5
							}
							{
								color = yellow_orange_5
								texture = `tex/models/characters/layers/cag/prs/gtr80_prs_snt_ld22`
								flags = 4
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
								color = grey_4guitar
								texture = `tex/models/characters/layers/cag/prs/24fret_ld80_prs_birds02`
								flags = 36
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = gtr80_neckhead_01
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/prs/gtr80_neckhead_01d`
						material = gtr80_neckhead_01_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/prs/gtr80_neckhead_ld06`
								flags = 36
								color = red_orange_2
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
					material1 = orange_3
				}
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_type2_prs
				chosen_materials = {
					material1 = yellow_4guitar
				}
			}
			cas_guitar_misc = {
				desc_id = double_switches
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
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_bod04_ld02`
								flags = 4
								color = yellow_orange_4
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
				desc_id = bs_sch_030_nhead01
			}
			cas_bass_pickguards = {
				desc_id = bs_sch_030_pga
			}
			cas_bass_pickups = {
				desc_id = bass_emgpickup2b
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bas_brdg_capsule
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
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						material = cad_drums_01_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld46`
								flags = 32
								color = teal_3
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
			cas_mic = {
				desc_id = mic_standard
			}
			cas_mic_stand = {
				desc_id = rock
			}
		}
	}
	{
		name = gh_rocker_mattbellamy
		fullname = qs(0xc1da213f)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		win_anims = [
			g_guitmic_win_waving
		]
		lose_anims = [
			g_guitmic_lose_depressed
		]
		preset_icon = photo_eddie
		blurb = qs(0x12aafb48)
		no_random_pick
		selection_not_allowed
		locked
		appearance = {
			genre = rock
			cas_full_body = {
				desc_id = matt_bellamy
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			cas_guitar_body = {
				desc_id = gtr25_manson_bellamy
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
								texture = `tex/models/characters/layers/cag/all_clear2`
								flags = 4
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = gtr25_neckhead_manson
			}
			cas_guitar_pickguards = {
				desc_id = none
			}
			cas_guitar_bridges = {
				desc_id = gtr_brdg_manson_1
			}
			cas_guitar_knobs = {
				desc_id = gtr_knob_manson_01
			}
			cas_guitar_pickups = {
				desc_id = gtr25_2pickups
			}
			cas_guitar_misc = {
				desc_id = gtr_misc_switch_m
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
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_bod04_ld02`
								flags = 4
								color = orange_2
							}
							{
								color = red_2
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_bod04_dtl04`
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
				desc_id = bs_sch_030_nhead01
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/schecter/bass_neckhead_030`
						material = bass_neckhead_030_primary
						diffuse
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
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_04_hd_dtl06`
								flags = 36
								color = orange_1
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
				desc_id = knob_knurl02
			}
			cas_bass_misc = {
				desc_id = none
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
			cas_mic = {
				desc_id = mic_cash
			}
			cas_mic_stand = {
				desc_id = micstand_cash
			}
		}
	}
	{
		name = gh_rocker_mattbellamy_car
		fullname = qs(0x0ccbf66e)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0xbe076cd1)
		no_random_pick
		locked
		appearance = {
			genre = rock
			cas_full_body = {
				desc_id = matt_bellamy_car
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			cas_guitar_body = {
				desc_id = gtr25_manson_bellamy
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
								texture = `tex/models/characters/layers/cag/all_clear2`
								flags = 4
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = gtr25_neckhead_manson
			}
			cas_guitar_pickguards = {
				desc_id = none
			}
			cas_guitar_bridges = {
				desc_id = gtr_brdg_manson_1
			}
			cas_guitar_knobs = {
				desc_id = gtr_knob_manson_01
			}
			cas_guitar_pickups = {
				desc_id = gtr25_2pickups
			}
			cas_guitar_misc = {
				desc_id = gtr_misc_switch_m
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
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_bod04_ld02`
								flags = 4
								color = orange_2
							}
							{
								color = red_2
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_bod04_dtl04`
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
				desc_id = bs_sch_030_nhead01
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/schecter/bass_neckhead_030`
						material = bass_neckhead_030_primary
						diffuse
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
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_04_hd_dtl06`
								flags = 36
								color = orange_1
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
				desc_id = knob_knurl02
			}
			cas_bass_misc = {
				desc_id = none
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
			cas_mic = {
				desc_id = mic_standard
			}
			cas_mic_stand = {
				desc_id = rock
			}
		}
	}
	{
		name = gh_rocker_frankenrocker
		fullname = qs(0x1d374fc1)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x66d06c99)
		no_random_pick
		locked
		appearance = {
			genre = `heavy metal`
			cas_full_body = {
				desc_id = frankenrocker
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
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
								color = purple_blue_1
							}
							{
								texture = `tex/models/characters/layers/cag/bc_rich/gtr_bc_rich_warlock_fd2`
								color = black_1guitar
								flags = 4
								a = 80
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
								color = purple_blue_1
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
								color = purple_blue_1
							}
							{
								texture = `tex/models/characters/layers/cag/bc_rich/gtr20_neckhead_fad03`
								color = black_1guitar
								flags = 36
								a = 100
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
				desc_id = gtr_knob_04
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_sd06
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_misc = {
				desc_id = gtr_misc_switch_blk_3
				chosen_materials = {
					material1 = grey_3guitar
				}
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
							{
								texture = `tex/models/characters/layers/cab/esp/bass63_ex_dtl_12`
								color = green_1guitar
								flags = 4
								a = 55
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
							{
								texture = `tex/models/characters/layers/cab/esp/bass63_neckhead_dtl_01`
								flags = 36
								color = green_1guitar
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
					material1 = grey_2guitar
				}
			}
			cas_bass_knobs = {
				desc_id = bass63_knob_type1
				chosen_materials = {
					material1 = grey_2guitar
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
						material = cad_drums_01_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_09`
								flags = 32
								color = green_3guitar
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						material = cad_drums_01_bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_skin_ld96`
								flags = 4
								color = purple_blue_2
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
				desc_id = `chain saw`
			}
		}
	}
	{
		name = gh_rocker_gerald
		fullname = qs(0x5c16cb87)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0xa55be2ad)
		no_random_pick
		locked
		appearance = {
			genre = any
			cas_body = {
				desc_id = gh4_car_male
				bones = {
					eyecornershape = 0.137
					eyebrowsize = 1.0
					eyebrowdistance = -0.656
					browposition = 0.7
					eyebrowangle = 0.8
					lipshapeupper = 1.0
					upperlipthickness = 0.8
					mouthangle = 0.2
					mouthscale = 0.367
					facefullness = 0.7
					jawprominence = 0.2
					waddle = 0.5
					chincleft = 1.0
					nosewidth = 0.133
					nosebridge = 0.0
					nosetipangle = 1.0
					noseangle = 0.6
					nosenostrilsize = 0.6
					eyescale = 0.814
					eyedistance = -0.6
					eyeangle = 0.561
					eyeposition = -0.03
				}
				chosen_materials = {
					skin = skin_asian3
				}
			}
			cas_male_physique = {
				desc_id = malephysique4
				bones = {
					height = 0.0
				}
			}
			cas_eyes = {
				desc_id = car_brown_eyes
			}
			cas_male_eyebrows = {
				desc_id = car_default_brow
			}
			cas_male_hair = {
				desc_id = m_pop_hair_emo1
			}
			cas_male_hat = {
				desc_id = none
			}
			cas_male_facial_hair = {
				desc_id = none
			}
			cas_male_torso = {
				desc_id = m_torso_hoodie
				chosen_materials = {
					material2 = carblack_1
				}
			}
			cas_male_legs = {
				desc_id = m_punk_legs_johnny1
			}
			cas_male_shoes = {
				desc_id = m_spnr_shoe_conversecs
				chosen_materials = {
					material1 = carblack_1
					material2 = carblack_1
					material3 = carblack_3
				}
			}
			cas_male_acc_left = {
				desc_id = m_metl_acc_lzakk
			}
			cas_male_acc_right = {
				desc_id = m_rock_acc_rbracelet
			}
			cas_male_acc_face = {
				desc_id = none
			}
			cas_male_acc_ears = {
				desc_id = none
			}
			cas_male_intro_anim = {
				desc_id = intro_elvis
			}
			cas_male_win_anim = {
				desc_id = win_pretentious
			}
			cas_male_lose_anim = {
				desc_id = lose_smash
			}
			cas_male_age = {
				desc_id = car_male_mature
			}
			cas_male_teeth = {
				desc_id = car_male_teeth
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
								texture = `tex/models/characters/layers/cag/mm/gtr84_mm_ld06`
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
								texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
								flags = 4
								color = grey_4guitar
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
			cas_bass_body = {
				desc_id = bas_ibz_sr505
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\ibanez\bs_ibz_sr_body`
						material = bs_ibz_sr_body_primary
						diffuse
						pre_layer = [
							{
								color = red_orange_5
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_ld01`
								flags = 4
							}
							{
								texture = `tex/models/characters/layers/cag/all_clear3`
								flags = 4
							}
							{
								color = black_1guitar
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_dtl15`
								flags = 4
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
								color = grey_4
								texture = `tex/models/characters/layers/cab/ibanez/bass_sr24_inlay001`
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
				desc_id = bass_emgpickup2b
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bas_brdg_ibz_mono
				chosen_materials = {
					material1 = yellow_1guitar
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
			cas_drums = {
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						material = cad_drums_01_bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_skin_ld44`
								flags = 4
								color = grey_3guitar
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						material = cad_drums_01_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_tamashell_ld03`
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
		name = gh_rocker_kurtcobain
		fullname = qs(0xf3647ae9)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0xd3764aad)
		no_random_pick
		locked
		appearance = {
			genre = classic
			cas_full_body = {
				desc_id = kurtcobain
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			cas_guitar_body = {
				desc_id = gtr78_kurt
			}
			cas_guitar_neck = {
				desc_id = cag_22fret_ibanez03
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
				desc_id = gtr78_neckhead
			}
			cas_guitar_pickguards = {
				desc_id = gtr78_pg
			}
			cas_guitar_bridges = {
				desc_id = gtr78_bridge
			}
			cas_guitar_knobs = {
				desc_id = gtr_knob_01kurt
			}
			cas_guitar_pickups = {
				desc_id = gtr78_pickup1
			}
			cas_guitar_misc = {
				desc_id = gtr78_misc
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
								texture = `tex/models/characters/layers/cag/all_clear`
								flags = 4
							}
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_ld04`
								flags = 4
								color = red_1
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
				desc_id = bs_sch_t_nhead
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/schecter/bass_neckhead_mt`
						material = bs_sch_t_nhead_primary
						diffuse
						pre_layer = [
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
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						material = cad_drums_01_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_tamashell_ld06`
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
		name = gh_rocker_kurtcobain_lefty
		fullname = qs(0x7e77e361)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		win_anims = [
			g_lefty_win_waving
		]
		lose_anims = [
			g_lefty_lose_depressed
		]
		preset_icon = photo_eddie
		blurb = qs(0xd3764aad)
		no_random_pick
		selection_not_allowed
		locked
		appearance = {
			genre = classic
			cas_full_body = {
				desc_id = kurtcobainlefty
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			cas_guitar_body = {
				desc_id = gtr78_kurt
			}
			cas_guitar_neck = {
				desc_id = cag_22fret_ibanez03
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
				desc_id = gtr78_neckhead
			}
			cas_guitar_pickguards = {
				desc_id = gtr78_pg
			}
			cas_guitar_bridges = {
				desc_id = gtr78_bridge
			}
			cas_guitar_knobs = {
				desc_id = gtr_knob_01kurt
			}
			cas_guitar_pickups = {
				desc_id = gtr78_pickup1
			}
			cas_guitar_misc = {
				desc_id = gtr78_misc
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
								texture = `tex/models/characters/layers/cag/all_clear`
								flags = 4
							}
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_ld04`
								flags = 4
								color = red_1
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
				desc_id = bs_sch_t_nhead
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/schecter/bass_neckhead_mt`
						material = bs_sch_t_nhead_primary
						diffuse
						pre_layer = [
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
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						material = cad_drums_01_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_tamashell_ld06`
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
		name = gh_rocker_shirleymanson
		fullname = qs(0x99902597)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x6e250c9f)
		no_random_pick
		locked
		appearance = {
			genre = rock
			cas_full_body = {
				desc_id = shirleymanson
			}
			cas_female_physique = {
				desc_id = femalephysiqueuntouched
			}
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
								color = navy_4
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
				desc_id = none
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
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_46`
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
								texture = `tex/models/characters/layers/cadrm/gh5_skin_ld57`
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
			cas_mic = {
				desc_id = mic_standard
			}
			cas_mic_stand = {
				desc_id = rock
			}
		}
	}
	{
		name = gh_rocker_johnnycash
		fullname = qs(0x3a825a9b)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		win_anims = [
			g_guitmic_win_waving
		]
		lose_anims = [
			g_guitmic_lose_depressed
		]
		preset_icon = photo_eddie
		blurb = qs(0xb1a58a24)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = classic
			cas_full_body = {
				desc_id = johnnycash_1
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			cas_guitar_body = {
				desc_id = gtr26_cash_acoustic
			}
			cas_guitar_neck = {
				desc_id = gtr_fretboard_04cash
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
						material = gtr_fretboard_04_primary
						diffuse
						pre_layer = [
							{
								color = grey_5
								texture = `tex/models/characters/layers/cag/gh5/22fret_cash_acoustic`
								flags = 36
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = gtr26_neckhead_cash
			}
			cas_guitar_pickguards = {
				desc_id = none
			}
			cas_guitar_bridges = {
				desc_id = gtr26_bridge_cash
			}
			cas_guitar_knobs = {
				desc_id = none
			}
			cas_guitar_pickups = {
				desc_id = gtr26_dummy
			}
			cas_guitar_misc = {
				desc_id = none
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
								color = teal_2
							}
							{
								texture = `tex/models/characters/layers/cab/esp/bass17_esp_ax_dtl_02`
								flags = 4
								color = black_1guitar
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
				desc_id = bass14_neckhead_03
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass9_neckhead_d_03`
						material = bass14_neckhead_03_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/esp/bass9_neckhead3_ld_02`
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
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						material = cad_drums_01_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_55`
								flags = 32
								color = yellow_4guitar
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						material = cad_drums_01_bassdrum
						diffuse
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics010`
								color = yellow_4guitar
								x_scale = 95
								y_scale = 90
								flags = 3
								rot = 5683
							}
						]
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_11`
								flags = 4
								color = yellow_4guitar
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = mic_cash
			}
			cas_mic_stand = {
				desc_id = micstand_cash
			}
		}
	}
	{
		name = gh_rocker_johnnycash_guitarist
		fullname = qs(0x1cb4a259)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0xbd90ca14)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = `classic rock`
			cas_body = {
				desc_id = gh4_car_male
				bones = {
					facefullness = 0.0
					jawprominence = 0.0
					jawshape = 1.0
					chinprominence = 1.0
					chinwidth = 0.0
					chinheight = 0.9
					chinangle = 1.0
					chincleft = 0.0
					cheekboneprominence = 0.24800001
					cheekbonedepth = 0.0
					earprominence = 0.025999999
					earshape = 0.6
					nosewidth = 0.133
					noselength = 1.0
					noseangle = 0.3
					noseposition = 0.0
					nosetipheight = 0.167
					nosetipwidth = 0.167
					mouthangle = 0.0
					mouthdepth = 0.0
					mouthposition = 0.167
					lipshapelower = 1.0
					lipshapeupper = 1.0
					upperlipthickness = 0.148
					eyebrowdistance = -1.0
					browposition = 0.0
					eyebrowangle = 0.5
					browdepth = 1.0
					eyebrowsize = 1.0
				}
			}
			cas_male_physique = {
				desc_id = malephysique2
			}
			cas_eyes = {
				desc_id = car_green_eyes
			}
			cas_male_eyebrows = {
				desc_id = car_default_brow
			}
			cas_male_hair = {
				desc_id = m_rock_hair_midpart
			}
			cas_male_hat = {
				desc_id = none
			}
			cas_male_facial_hair = {
				desc_id = none
			}
			cas_male_torso = {
				desc_id = m_rock_torso_jcashvest
				chosen_materials = {
					material2 = carblack_1
					material3 = grey_1
				}
			}
			cas_male_legs = {
				desc_id = m_pop_legs_pants
				chosen_materials = {
					material1 = carblack_1
				}
			}
			cas_male_shoes = {
				desc_id = m_clsc_shoe_clive3
				chosen_materials = {
					material1 = carblack_1
					material2 = carblack_1
					material3 = carblack_1
				}
			}
			cas_guitar_body = {
				desc_id = gtr26_cash_acoustic
			}
			cas_guitar_neck = {
				desc_id = gtr_fretboard_04cash
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
						material = gtr_fretboard_04_primary
						diffuse
						pre_layer = [
							{
								color = grey_5
								texture = `tex/models/characters/layers/cag/gh5/22fret_cash_acoustic`
								flags = 36
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = gtr26_neckhead_cash
			}
			cas_guitar_pickguards = {
				desc_id = none
			}
			cas_guitar_bridges = {
				desc_id = gtr26_bridge_cash
			}
			cas_guitar_knobs = {
				desc_id = none
			}
			cas_guitar_pickups = {
				desc_id = gtr26_dummy
			}
			cas_guitar_misc = {
				desc_id = none
			}
		}
	}
	{
		name = gh_rocker_johnnycash_bassist
		fullname = qs(0xc4b1d7f5)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x5ed07e02)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = rock
			cas_body = {
				desc_id = gh4_car_male
				bones = {
					jawprominence = 1.0
					jawshape = 1.0
					chinprominence = 1.0
					chinwidth = 0.0
					chincleft = 0.8
					waddle = 1.0
					earlobesize = 0.7
					facefullness = 1.0
					headsize = -1.0
					chinangle = 1.0
					nosewidth = 1.0
					browposition = 0.0
					eyebrowangle = 0.29
					eyebrowsize = 1.0
					eyecornershape = 0.337
					eyeangle = 0.6
					eyedistance = -0.414
					mouthscale = 0.9
					lipshapelower = 1.0
					lowerlipthickness = 1.0
					noseangle = 0.0
					noseposition = 0.0
				}
			}
			cas_male_physique = {
				desc_id = malephysique5
				bones = {
					height = -1.0
				}
			}
			cas_eyes = {
				desc_id = car_hazel_eyes
			}
			cas_male_eyebrows = {
				desc_id = car_default_brow
			}
			cas_male_hair = {
				desc_id = m_rock_hair_eddie3
				chosen_materials = {
					material2 = carblack_1
				}
			}
			cas_male_hat = {
				desc_id = none
			}
			cas_male_facial_hair = {
				desc_id = m_rock_fhair_goatee01
			}
			cas_male_torso = {
				desc_id = m_pop_torso_suit
				chosen_materials = {
					material1 = grey_1
					material2 = grey_1
				}
			}
			cas_male_legs = {
				desc_id = m_pop_legs_pants
				chosen_materials = {
					material1 = grey_1
				}
			}
			cas_male_shoes = {
				desc_id = m_rock_shoe_dressboot
			}
			cas_male_acc_left = {
				desc_id = m_clsc_acc_l3rings
			}
			cas_male_acc_right = {
				desc_id = m_clsc_acc_r3rings
			}
			cas_male_acc_face = {
				desc_id = none
			}
			cas_male_acc_ears = {
				desc_id = none
			}
			cas_male_age = {
				desc_id = car_male_teen
			}
			cas_male_teeth = {
				desc_id = car_male_teeth03
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
								color = teal_2
							}
							{
								texture = `tex/models/characters/layers/cab/esp/bass17_esp_ax_dtl_02`
								flags = 4
								color = black_1guitar
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
				desc_id = bass14_neckhead_03
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass9_neckhead_d_03`
						material = bass14_neckhead_03_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/esp/bass9_neckhead3_ld_02`
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
		}
	}
	{
		name = gh_rocker_johnnycash_drummer
		fullname = qs(0x9b631dc2)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x0102b435)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = rock
			cas_body = {
				desc_id = gh4_car_male
				chosen_materials = {
					skin = skin_black4
				}
			}
			cas_male_physique = {
				desc_id = malephysique4
				bones = {
					height = -0.9
				}
			}
			cas_eyes = {
				desc_id = car_violet_eyes
			}
			cas_male_eyebrows = {
				desc_id = car_no_brow
			}
			cas_male_hair = {
				desc_id = m_pop_hair_pomp
			}
			cas_male_hat = {
				desc_id = none
			}
			cas_male_facial_hair = {
				desc_id = none
			}
			cas_male_torso = {
				desc_id = m_rock_torso_rolledslvs
				chosen_materials = {
					material1 = carblack_3
				}
			}
			cas_male_legs = {
				desc_id = m_punk_legs_cuff
			}
			cas_male_shoes = {
				desc_id = m_spnr_shoe_converse01
			}
			cas_male_acc_left = {
				desc_id = none
			}
			cas_male_acc_right = {
				desc_id = none
			}
			cas_male_acc_face = {
				desc_id = none
			}
			cas_male_acc_ears = {
				desc_id = none
			}
			cas_male_age = {
				desc_id = car_male_mature
			}
			cas_male_teeth = {
				desc_id = car_male_teeth
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
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_55`
								flags = 32
								color = yellow_4guitar
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						material = cad_drums_01_bassdrum
						diffuse
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics010`
								color = yellow_4guitar
								x_scale = 95
								y_scale = 90
								flags = 3
								rot = 5683
							}
						]
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_11`
								flags = 4
								color = yellow_4guitar
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
		}
	}
	{
		name = gh_rocker_santana_guitarist
		fullname = qs(0x465865c0)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x91d8999f)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = `classic rock`
			cas_body = {
				desc_id = gh4_car_male
				chosen_materials = {
					eyebrows = yellow_orange_4
					skin = skin_latin2
				}
				bones = {
					headsize = 1.0
					chinprominence = 1.0
					chinangle = 1.0
					earshape = 0.167
					earsize = 0.98599994
					eyebrowsize = 1.0
					jawprominence = 0.6
					cheekboneprominence = 0.0
					cheekbonedepth = 0.4
					browdepth = 0.3
					browposition = 0.4
					eyebrowangle = 0.0
					chinheight = 0.2
					mouthposition = 0.1
					nosetipangle = 0.2
					eyecornershape = 0.9
					eyeshape = 1.0
					facefullness = 0.8
					nosetipwidth = 0.86700004
					eyescale = 0.3
					eyedistance = -0.5
					lipshapeupper = 0.5
					mouthdepth = 0.5
					mouthangle = 0.3
					mouthscale = 0.6
					lowerlipthickness = 1.0
					upperlipthickness = 0.948
					eyeangle = 0.8
					eyeposition = 0.1
					nosesize = 0.6
					nosewidth = 0.4
					noseangle = 0.5
					noseposition = 0.0
					nosenostrilheight = 0.93299997
					nosenostrilsize = 0.7
					chinwidth = 1.0
					chincleft = 0.0
					waddle = 0.2
					nosetipheight = 0.2
					noselength = 0.2
				}
			}
			cas_male_physique = {
				desc_id = malephysique1
			}
			cas_eyes = {
				desc_id = car_brown_eyes
			}
			cas_male_eyebrows = {
				desc_id = car_rounded
			}
			cas_male_hair = {
				desc_id = m_clsc_hair_clive4
				chosen_materials = {
					material2 = hairred_3
				}
			}
			cas_male_hat = {
				desc_id = none
			}
			cas_male_facial_hair = {
				desc_id = m_clsc_fhair_country
				chosen_materials = {
					material1 = yellow_orange_2
				}
			}
			cas_male_torso = {
				desc_id = m_clsc_torso_santana_d2
			}
			cas_male_legs = {
				desc_id = m_clsc_legs_clive
				chosen_materials = {
					material1 = red_5
					material2 = teal_3
					material3 = teal_4
				}
			}
			cas_male_shoes = {
				desc_id = m_clsc_shoe_platform
				chosen_materials = {
					material2 = yellow_orange_3
					material1 = orange_3
				}
			}
			cas_male_acc_left = {
				desc_id = m_clsc_acc_lscarf
				chosen_materials = {
					material1 = orange_2
				}
			}
			cas_male_acc_right = {
				desc_id = m_punk_acc_rrings
			}
			cas_male_acc_face = {
				desc_id = m_clsc_glasses_avtr
			}
			cas_male_acc_ears = {
				desc_id = none
			}
			cas_male_age = {
				desc_id = car_male_old
			}
			cas_male_teeth = {
				desc_id = car_male_teeth
			}
			cas_guitar_body = {
				desc_id = gtr93_dr_siren
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/daisyrock/gtr93_dr_siren_d`
						material = gtr93_dr_siren_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/daisyrock/gtr93_dr_siren_ld04`
								a = 90
								flags = 4
								color = orange_2
							}
							{
								texture = `tex/models/characters/layers/cag/daisyrock/gtr93_dr_siren_dtl09`
								a = 100
								flags = 4
								color = grey_3guitar
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
								texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
								flags = 4
								color = grey_4guitar
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = gtr93_dr_neckhead01
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
	}
	{
		name = gh_rocker_santana_bassist
		fullname = qs(0x2db193bf)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0xb9db65e7)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = `glam rock`
			cas_body = {
				desc_id = gh4_car_female
				random_weight = 1.75
				cas_eyes = {
					desc_id = car_blue_eyes
				}
				cap = [
					{
						base_tex = `tex/models/characters/global/global_blank_head_dnc`
						material = car_female_head
						cas_1
						post_layer = [
							{
								texture = `tex/models/characters/layers/car/female/makeup/car_female_eyeshadow_a01`
								color = carblack_2
							}
						]
					}
				]
				chosen_materials = {
					skin = skin_white1
					eyebrows = yellow_orange_2
				}
				bones = {
					mouthposition = 0.2
					eyebrowangle = 0.49
					eyebrowsize = 0.0
					browposition = 1.0
					eyebrowdistance = 1.0
					jawprominence = 0.6
					jawshape = 0.7
					chinprominence = 0.0
					lowerlipthickness = 0.79599994
					mouthdepth = 0.0
					facefullness = 0.5
					upperlipthickness = 0.64800006
					nosebridge = 0.1
					eyecornershape = 1.0
					eyeshape = 0.5
					earsize = 1.0
					earshape = 0.56700003
					eartip = 0.0
					noseposition = 0.72199994
					noseangle = 0.7
					browdepth = 0.0
					eyedistance = -0.4
					nosetipwidth = 1.0
					nosesize = 0.5
					nosetiplength = 0.0
					nosetipheight = 0.4
					nosewidth = 0.133
					noselength = 0.6
					eyescale = 0.414
					eyeangle = 0.3
					eyeposition = 1.0
				}
			}
			cas_female_physique = {
				desc_id = femalephysique4
			}
			cas_eyes = {
				desc_id = car_brown_eyes
			}
			cas_female_eyebrows = {
				desc_id = car_rounded_brow
			}
			cas_female_hair = {
				desc_id = f_rock_hair_wavy
				chosen_materials = {
					material1 = carblack_1
				}
			}
			cas_female_hat = {
				desc_id = none
			}
			cas_female_facial_hair = {
				desc_id = none
			}
			cas_female_torso = {
				desc_id = f_glam_torso_lacebratop
				chosen_materials = {
					material1 = yellow_orange_1
				}
			}
			cas_female_legs = {
				desc_id = f_clsc_legs_skrt
				chosen_materials = {
					material1 = yellow_orange_3
				}
			}
			cas_female_shoes = {
				desc_id = f_metl_shoe_flameb
				chosen_materials = {
					material1 = grey_5
				}
			}
			cas_female_acc_left = {
				desc_id = f_glam_acc_lbaggyclobber
			}
			cas_female_acc_right = {
				desc_id = none
			}
			cas_female_acc_face = {
				desc_id = none
			}
			cas_female_acc_ears = {
				desc_id = none
			}
			cas_female_age = {
				desc_id = car_female_teen
			}
			cas_female_teeth = {
				desc_id = car_female_teeth
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
								color = red_1
							}
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_bod04_dtl20`
								flags = 4
								color = teal_1
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
				desc_id = bs_sch_030_nhead01
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
				desc_id = knob_knurl02
			}
			cas_bass_misc = {
				desc_id = none
			}
		}
	}
	{
		name = gh_rocker_santana_drummer
		fullname = qs(0x72635988)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0xe609afd0)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = `heavy metal`
			cas_body = {
				desc_id = gh4_car_male
				random_weight = 1.0
				cas_male_physique = {
					desc_id = malephysique1
				}
				cas_eyes = {
					desc_id = car_brown_eyes
				}
				cas_male_eyebrows = {
					desc_id = car_default_brow
				}
				chosen_materials = {
					skin = skin_black3
				}
				cap = [
					{
						base_tex = `tex/models/characters/global/global_blank_head_dnc`
						material = car_male_head
						cas_1
						post_layer = [
							{
								texture = `tex/models/characters/car/car_shared_none2`
								flags = 4
							}
						]
					}
					{
						base_tex = `tex\models\characters\car\female\car_female_armr_tat_o_dnc`
						material = car_male_armr
						cas_1
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics076`
								color = grey_3guitar
								a = 100
								x_trans = 10
								y_trans = -22
								x_scale = 45
								y_scale = 40
								flags = 3
								x_skew = 0
							}
						]
					}
				]
				bones = {
					chinheight = 0.1
					chincleft = 1.0
					nosenostrilangle = 0.7
					noseangle = 0.267
					mouthscale = 0.367
					eyebrowdistance = -0.256
					eyebrowangle = 0.98999995
					cheekboneprominence = 0.148
					cheekbonedepth = 0.5
					browdepth = 0.4
					headsize = 0.5
					facefullness = 1.0
					jawprominence = 1.0
					chinwidth = 0.3
					chinprominence = 0.2
					jawshape = 0.0
					noselength = 0.3
					nosesize = 0.4
					upperlipthickness = 0.9
					mouthdepth = 0.0
					mouthangle = 0.3
					mouthposition = 0.5
					lipshapelower = 0.6
					lipshapeupper = 1.0
					noseposition = 0.0
					eyescale = 0.414
					eyedistance = -0.8
					eyeshape = 1.0
					nosewidth = 0.8
					nosebridge = 0.6
					lowerlipthickness = 0.0
				}
			}
			cas_male_physique = {
				desc_id = malephysique7
				bones = {
					height = -1.0
				}
			}
			cas_eyes = {
				desc_id = car_brown_eyes
			}
			cas_male_eyebrows = {
				desc_id = car_no_brow
			}
			cas_male_hair = {
				desc_id = m_bmtl_hair_lars_3
				chosen_materials = {
					material1 = yellow_orange_1
				}
			}
			cas_male_hat_hair = {
				desc_id = m_bmtl_hathair_lars_3
				chosen_materials = {
					material1 = yellow_orange_1
				}
			}
			cas_male_hat = {
				desc_id = m_hat_pimp
				chosen_materials = {
					material1 = yellow_orange_2
					material2 = grey_4
				}
			}
			cas_male_facial_hair = {
				desc_id = m_metl_fhair_zzbeard
			}
			cas_male_torso = {
				desc_id = m_torso_tasselvest
				chosen_materials = {
					material1 = grey_4
					material2 = grey_5
				}
			}
			cas_male_legs = {
				desc_id = m_metl_legs_zippertight
				chosen_materials = {
					material1 = grey_4
				}
			}
			cas_male_shoes = {
				desc_id = m_flipflops
			}
			cas_male_acc_left = {
				desc_id = m_punk_acc_lmetalskull
			}
			cas_male_acc_right = {
				desc_id = m_punk_acc_rchain
			}
			cas_male_acc_face = {
				desc_id = m_pop_glasses_riot
			}
			cas_male_acc_ears = {
				desc_id = m_punk_acc_ring_02
			}
			cas_male_age = {
				desc_id = car_male_old
			}
			cas_male_teeth = {
				desc_id = car_male_teeth
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
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld36`
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
								texture = `tex/models/characters/layers/cadrm/gh5_skin_ld95`
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
				desc_id = mic_stand_metal
			}
		}
	}
	{
		name = gh_rocker_shirleymanson_guitarist
		fullname = qs(0x8e20f18d)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x634edb8d)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = `heavy metal`
			cas_body = {
				desc_id = gh4_car_male
				random_weight = 3.0
				bones = {
					jawprominence = 0.0
					jawshape = 0.0
					chinprominence = 1.0
					cheekboneprominence = 0.348
					cheekbonedepth = 0.7
					facefullness = 0.7
					nosewidth = 0.0
					nosetipwidth = 1.0
					nosenostrilangle = 0.6
					nosenostrilheight = 0.4
					nosenostrilsize = 0.7
					noseangle = 0.66700006
					nosetipheight = 1.0
					mouthscale = 0.167
					lipshapeupper = 0.883
					upperlipthickness = 0.64800006
					lowerlipthickness = 1.0
					noselength = 0.767
					mouthdepth = 0.8
					mouthposition = 0.1
					nosesize = 0.5
					noseposition = 0.122
					eyedistance = -0.514
					eyeangle = 0.5
					eyecornershape = 0.0
					eyescale = 0.614
					eyeposition = 1.0
					eyebrowdistance = -0.056
					browposition = 0.0
					eyebrowangle = 0.29
					eyebrowsize = 0.2
				}
				chosen_materials = {
					skin = skin_white4
				}
				cas_male_physique = {
					desc_id = malephysique1
				}
				cas_eyes = {
					desc_id = car_deepblue_eyes
				}
				cas_male_eyebrows = {
					desc_id = car_default_brow
				}
			}
			cas_male_physique = {
				desc_id = malephysique1
			}
			cas_eyes = {
				desc_id = car_deepblue_eyes
			}
			cas_male_eyebrows = {
				desc_id = car_default_brow
			}
			cas_male_hair = {
				desc_id = m_clsc_hair_clive2
				chosen_materials = {
					material1 = yellow_orange_1
				}
			}
			cas_male_hat = {
				desc_id = none
			}
			cas_male_facial_hair = {
				desc_id = none
			}
			cas_male_torso = {
				desc_id = m_pop_torso_openshirt
				chosen_materials = {
					material1 = carblack_1
					material2 = grey_1
				}
			}
			cas_male_legs = {
				desc_id = m_pop_legs_slacks
				chosen_materials = {
					material1 = grey_1
					material2 = carblack_3
				}
			}
			cas_male_shoes = {
				desc_id = m_metl_shoes_tallplain
			}
			cas_male_acc_left = {
				desc_id = none
			}
			cas_male_acc_right = {
				desc_id = m_metl_acc_rstuds
			}
			cas_male_acc_face = {
				desc_id = m_pop_glasses_riot
				chosen_materials = {
					material1 = carblack_1
				}
			}
			cas_male_acc_ears = {
				desc_id = none
			}
			cas_male_age = {
				desc_id = car_male_teen
			}
			cas_male_teeth = {
				desc_id = car_male_teeth
			}
			cas_guitar_body = {
				desc_id = gtr4_esp_eclipse_01
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr4_esp_eclipse_d_01`
						material = gtr4_esp_eclipse_01_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr4_esp_eclipse_ld_12`
								color = red_2
								flags = 4
								a = 65
							}
							{
								texture = `tex/models/characters/layers/cag/esp/gtr4_esp_eclipse_dtl_03`
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
				desc_id = gtr4_neckhead_01
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr4_neckhead_d_01`
						material = gtr4_neckhead_01_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr4_neckhead_01_ld_11`
								color = red_4
								flags = 36
								a = 80
							}
							{
								texture = `tex/models/characters/layers/cag/esp/gtr4_neckhead_dtl_03`
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
	}
	{
		name = gh_rocker_shirleymanson_bassist
		fullname = qs(0xc01448eb)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0xc6aa31ed)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = `heavy metal`
			cas_body = {
				desc_id = gh4_car_male
				random_weight = 3.0
				cas_male_physique = {
					desc_id = malephysique1
				}
				cas_eyes = {
					desc_id = car_deepblue_eyes
				}
				cas_male_eyebrows = {
					desc_id = car_default_brow
				}
				chosen_materials = {
					skin = skin_asian4
				}
				bones = {
					jawshape = 0.0
					cheekbonedepth = 0.7
					nosenostrilangle = 0.6
					nosenostrilsize = 0.7
					noselength = 0.767
					eyescale = 0.614
					eyebrowangle = 0.29
					eyebrowsize = 0.2
					headsize = -0.2
					facefullness = 0.4
					jawprominence = 0.3
					chinprominence = 0.4
					chinwidth = 0.471
					cheekboneprominence = 0.148
					nosewidth = 0.0
					noseangle = 0.66700006
					noseposition = 0.3
					nosetipheight = 0.3
					nosetipwidth = 0.6
					nosenostrilheight = 1.0
					nosetipangle = 0.3
					nosetiplength = 0.5
					nosesize = 0.6
					mouthscale = 0.367
					mouthangle = 0.0
					mouthdepth = 0.4
					mouthposition = 0.3
					lipshapeupper = 0.4
					lipshapelower = 0.0
					upperlipthickness = 1.0
					lowerlipthickness = 0.7
					eyeshape = 0.405
					eyecornershape = 0.1
					eyeangle = 0.6
					eyeposition = 0.8
					eyedistance = -0.614
					browposition = 0.2
					eyebrowdistance = 0.344
				}
			}
			cas_male_physique = {
				desc_id = malephysique4
				bones = {
					height = 0.5
				}
			}
			cas_eyes = {
				desc_id = car_brown_eyes
			}
			cas_male_eyebrows = {
				desc_id = car_rounded
			}
			cas_male_hair = {
				desc_id = m_pop_hair_buzz
			}
			cas_male_hat = {
				desc_id = none
			}
			cas_male_facial_hair = {
				desc_id = m_rock_fhair_stub
			}
			cas_male_torso = {
				desc_id = m_pop_torso_leather
				chosen_materials = {
					material1 = carblack_1
					material2 = blue_4
				}
			}
			cas_male_legs = {
				desc_id = m_pop_legs_jeans
				chosen_materials = {
					material1 = grey_1
					material2 = carblack_1
				}
			}
			cas_male_shoes = {
				desc_id = m_glam_shoes_mart
			}
			cas_male_acc_left = {
				desc_id = none
			}
			cas_male_acc_right = {
				desc_id = m_metl_acc_rstuds
			}
			cas_male_acc_face = {
				desc_id = m_clsc_glasses_wtnose
			}
			cas_male_acc_ears = {
				desc_id = none
			}
			cas_male_age = {
				desc_id = car_male_mature
			}
			cas_male_teeth = {
				desc_id = car_male_teeth
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
								texture = `tex/models/characters/layers/cab/esp/bass17_esp_ec_ld_12`
								flags = 4
								color = orange_2
							}
							{
								color = red_2
								texture = `tex/models/characters/layers/cab/esp/bass17_esp_ax_dtl_05`
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
				desc_id = bass_fretboard_22d
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_05`
						material = bass_fretboard_22d_primary
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
				desc_id = bass14_neckhead_03
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass9_neckhead_d_03`
						material = bass14_neckhead_03_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/all_clear`
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
				desc_id = bass17_bridge_4str_04
			}
			cas_bass_knobs = {
				desc_id = bass17_esp_knob_10
			}
		}
	}
	{
		name = gh_rocker_shirleymanson_drummer
		fullname = qs(0x9fc682dc)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x9978fbda)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = pop
			cas_body = {
				desc_id = gh4_car_male
				random_weight = 3.0
			}
			cas_male_physique = {
				desc_id = malephysique2
				bones = {
					height = 0.3
				}
			}
			cas_eyes = {
				desc_id = car_hazel_eyes
			}
			cas_male_eyebrows = {
				desc_id = car_rounded
			}
			cas_male_hair = {
				desc_id = m_pop_hair_emo1
			}
			cas_male_hat = {
				desc_id = none
			}
			cas_male_facial_hair = {
				desc_id = m_rock_fhair_goatee03
			}
			cas_male_torso = {
				desc_id = m_rock_torso_tie
				chosen_materials = {
					material2 = grey_1
					material3 = red_2
				}
			}
			cas_male_legs = {
				desc_id = m_pop_legs_pants
				chosen_materials = {
					material1 = grey_1
				}
			}
			cas_male_shoes = {
				desc_id = m_spnr_shoe_conversecs
				chosen_materials = {
					material1 = carblack_1
					material2 = grey_1
					material3 = red_2
				}
			}
			cas_male_acc_left = {
				desc_id = none
			}
			cas_male_acc_right = {
				desc_id = m_pop_acc_rglove
			}
			cas_male_acc_face = {
				desc_id = m_pop_glasses_riot
			}
			cas_male_acc_ears = {
				desc_id = none
			}
			cas_male_age = {
				desc_id = car_male_teen
			}
			cas_male_teeth = {
				desc_id = car_male_teeth
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
								texture = `tex/models/characters/layers/cadrm/gh5_skin_ld28`
								flags = 4
								color = red_orange_1
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
								color = orange_1
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
		}
	}
	{
		name = gh_rocker_kurtcobain_guitarist
		fullname = qs(0x63bce9cd)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0xc2988180)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = rock
			cas_body = {
				desc_id = gh4_car_male
				bones = {
					nosenostrilangle = 0.0
					nosebridge = 0.5
					nosetipwidth = 0.467
					nosetipheight = 1.0
					noselength = 0.4
					noseposition = 0.6
					noseangle = 0.1
					nosetiplength = 0.9
					nosetipangle = 0.0
					nosenostrilsize = 0.9
					eyebrowsize = 1.0
					browdepth = 0.1
					eyebrowdistance = -0.956
					eyebrowangle = 0.8
					lipshapelower = 0.111
					lipshapeupper = 0.083
					mouthdepth = 0.433
					mouthangle = 0.467
					mouthposition = 1.0
					upperlipthickness = 0.5
					lowerlipthickness = 0.39600003
					headsize = 0.0
					jawprominence = 0.0
					jawshape = 1.0
					chinheight = 1.0
					chinangle = 1.0
					chinprominence = 0.6
					facefullness = 0.5
					earlobesize = 0.1
					earlobelength = 1.0
					earshape = 0.067
					chincleft = 1.0
					waddle = 0.7
					chinwidth = 0.0
				}
			}
			cas_male_physique = {
				desc_id = malephysique1
			}
			cas_eyes = {
				desc_id = car_brown_eyes
			}
			cas_male_eyebrows = {
				desc_id = car_rounded
			}
			cas_male_hair = {
				desc_id = m_glam_hair_izzy2
			}
			cas_male_hat = {
				desc_id = none
			}
			cas_male_facial_hair = {
				desc_id = none
			}
			cas_male_torso = {
				desc_id = m_torso_tshirt
			}
			cas_male_legs = {
				desc_id = m_rock_legs_ripjeans
			}
			cas_male_shoes = {
				desc_id = m_spnr_shoe_converse04
			}
			cas_male_acc_left = {
				desc_id = m_rock_acc_lwatch
			}
			cas_male_acc_right = {
				desc_id = none
			}
			cas_male_acc_face = {
				desc_id = none
			}
			cas_male_acc_ears = {
				desc_id = none
			}
			cas_male_age = {
				desc_id = car_male_mature
			}
			cas_male_teeth = {
				desc_id = car_male_teeth
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
								color = black_1guitar
								texture = `tex/models/characters/layers/cag/esp/gtr33_solid`
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
								texture = `tex/models/characters/layers/cag/gh5/22fret_ld102_esp_logo`
								flags = 36
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = gtr33d_nekhed
				chosen_materials = {
					material1 = grey_3guitar
				}
			}
			cas_guitar_pickguards = {
				desc_id = none
			}
			cas_guitar_bridges = {
				desc_id = gtr33_hardware01z
				chosen_materials = {
					material1 = grey_3guitar
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
		}
	}
	{
		name = gh_rocker_kurtcobain_bassist
		fullname = qs(0x269934c0)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0xbcf89d37)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = `glam rock`
			cas_body = {
				desc_id = gh4_car_male
				chosen_materials = {
					eyebrows = carblack_1
					skin = skin_white4
					nails = carblack_1
				}
				bones = {
					eyedistance = -1.0
					eyeposition = -1.0
					eyecornershape = 0.0
					eyeshape = 1.0
					mouthscale = 0.0
					mouthangle = 0.4
					lipshapelower = 1.0
					upperlipthickness = 0.4
					lipshapeupper = 0.8
					nosesize = 0.0
					nosewidth = 0.733
					nosetipheight = 1.0
					nosetipwidth = 0.86700004
					nosenostrilheight = 1.0
					nosenostrilsize = 1.0
					nosetipangle = 1.0
					noseangle = 0.8
					noseposition = 0.5
					noselength = 0.5
					chinwidth = 0.271
					earshape = 0.267
					waddle = 1.0
					chinangle = 0.4
					chincleft = 0.5
					chinheight = 0.0
					chinprominence = 0.0
					jawshape = 0.7
					eyescale = 0.6
					eyeangle = 0.9
					eyebrowsize = 1.0
					eyebrowangle = 0.3
					browdepth = 1.0
					browposition = 0.0
					eyebrowdistance = -0.556
					headsize = 0.6
					facefullness = 0.9
					jawprominence = 0.0
				}
			}
			cas_male_physique = {
				desc_id = malephysique1
			}
			cas_eyes = {
				desc_id = car_brown_eyes
			}
			cas_male_eyebrows = {
				desc_id = car_default_brow
			}
			cas_male_hair = {
				desc_id = m_pop_hair_emo1
				chosen_materials = {
					material1 = carblack_1
				}
			}
			cas_male_hat = {
				desc_id = none
			}
			cas_male_facial_hair = {
				desc_id = none
			}
			cas_male_torso = {
				desc_id = m_torso_layered
				chosen_materials = {
					material2 = grey_5
					material1 = yellow_green_1
				}
			}
			cas_male_legs = {
				desc_id = m_mtl_legs_axel1
			}
			cas_male_shoes = {
				desc_id = m_spnr_shoe_vansh_skull
			}
			cas_male_acc_left = {
				desc_id = none
			}
			cas_male_acc_right = {
				desc_id = none
			}
			cas_male_acc_face = {
				desc_id = none
			}
			cas_male_acc_ears = {
				desc_id = none
			}
			cas_male_age = {
				desc_id = car_male_mature
			}
			cas_male_teeth = {
				desc_id = car_male_teeth01
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
								color = grey_5guitar
								texture = `tex/models/characters/layers/cab/mcswain/22fret_ld07_mcswn_bullets`
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
		}
	}
	{
		name = gh_rocker_kurtcobain_drummer
		fullname = qs(0x794bfef7)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0xe32a5700)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = punk
			cas_body = {
				desc_id = gh4_car_male
				bones = {
					facefullness = 0.4
					chinheight = 0.2
					waddle = 0.0
					cheekbonedepth = 0.6
					cheekboneprominence = 0.0
					chincleft = 0.6
					chinwidth = 0.6
					chinprominence = 1.0
					jawshape = 1.0
					jawprominence = 1.0
					earprominence = 0.1
					earsize = 0.3
					earlobesize = 0.8
					eyescale = 0.9
					eyeshape = 0.6
					eyecornershape = 0.337
					eyeangle = 0.661
					eyeposition = -0.63
					mouthangle = 1.0
					mouthdepth = 0.833
					mouthposition = 0.4
					mouthscale = 0.66700006
					eyebrowsize = 0.72499996
					browposition = 1.0
					eyebrowdistance = -0.856
				}
			}
			cas_male_physique = {
				desc_id = malephysique1
			}
			cas_eyes = {
				desc_id = car_hazel_eyes
			}
			cas_male_eyebrows = {
				desc_id = car_default_brow
			}
			cas_male_hair = {
				desc_id = m_bmtl_hair_straight
			}
			cas_male_hat = {
				desc_id = none
			}
			cas_male_facial_hair = {
				desc_id = m_rock_fhair_goatee03
			}
			cas_male_torso = {
				desc_id = shirtless
			}
			cas_male_legs = {
				desc_id = m_rock_legs_jeans
				chosen_materials = {
					material1 = carblack_3
					material2 = red_2
				}
			}
			cas_male_shoes = {
				desc_id = m_spnr_shoe_vansh_bw
				chosen_materials = {
					material1 = red_3
				}
			}
			cas_male_acc_left = {
				desc_id = m_punk_accl_jny_2
			}
			cas_male_acc_right = {
				desc_id = m_rock_acc_rstrap
			}
			cas_male_acc_face = {
				desc_id = none
			}
			cas_male_acc_ears = {
				desc_id = m_punk_acc_ring_02
			}
			cas_male_age = {
				desc_id = car_male_teen
			}
			cas_male_teeth = {
				desc_id = car_male_teeth01
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
	}
	{
		name = gh_rocker_mattbellamy_guitarist
		fullname = qs(0x59ef5801)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x5f512107)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = rock
			cas_body = {
				desc_id = gh4_car_male
				random_weight = 1.0
				cas_male_physique = {
					desc_id = malephysique1
				}
				cas_eyes = {
					desc_id = car_brown_eyes
				}
				cas_male_eyebrows = {
					desc_id = car_default_brow
				}
				cas_male_hair = {
					desc_id = none
				}
				chosen_materials = {
					skin = skin_asian4
					eyebrows = grey_2
				}
				bones = {
					jawprominence = 0.0
					jawshape = 0.0
					chinprominence = 1.0
					chinwidth = 1.0
					chinheight = 0.5
					chinangle = 1.0
					chincleft = 1.0
					waddle = 0.3
					nosesize = 0.1
					nosewidth = 0.4
					noselength = 0.9
					nosenostrilsize = 1.0
					lipshapeupper = 0.783
					lowerlipthickness = 0.8
					upperlipthickness = 1.0
					mouthscale = 0.0
					mouthposition = 0.9
					eyecornershape = 1.0
					eyebrowsize = 0.0
					eyebrowdistance = -0.8
					eyebrowangle = 1.0
					cheekboneprominence = 0.24800001
					cheekbonedepth = 0.4
					facefullness = 0.5
					eyeangle = 0.5
					nosebridge = 0.3
					noseangle = 0.0
					eyeposition = -1.0
					eyescale = 0.7
					eyedistance = -0.5
					noseposition = 0.4
					headsize = -1.0
				}
			}
			cas_male_physique = {
				desc_id = malephysique3
				bones = {
					height = 1.0
				}
			}
			cas_eyes = {
				desc_id = car_blue_eyes
			}
			cas_male_eyebrows = {
				desc_id = car_rounded
			}
			cas_male_hair = {
				desc_id = m_glam_hair_izzy2
				chosen_materials = {
					material1 = yellow_orange_5
				}
			}
			cas_male_hat = {
				desc_id = none
			}
			cas_male_facial_hair = {
				desc_id = none
			}
			cas_male_torso = {
				desc_id = m_rock_torso_jcashvest
				chosen_materials = {
					material3 = red_3
					material1 = grey_5
				}
			}
			cas_male_legs = {
				desc_id = m_metl_legs_tooskinny
				chosen_materials = {
					material1 = grey_5
				}
			}
			cas_male_shoes = {
				desc_id = m_goth_shoes_spats
				chosen_materials = {
					material1 = red_4
					material2 = carblack_3
				}
			}
			cas_male_acc_left = {
				desc_id = m_punk_acc_lleather
			}
			cas_male_acc_right = {
				desc_id = m_punk_acc_rbands
			}
			cas_male_acc_face = {
				desc_id = none
			}
			cas_male_acc_ears = {
				desc_id = none
			}
			cas_male_age = {
				desc_id = car_male_teen
			}
			cas_male_teeth = {
				desc_id = car_male_teeth
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
								color = black_1guitar
								texture = `tex/models/characters/layers/cag/esp/gtr33_solid`
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
								texture = `tex/models/characters/layers/cag/gh5/22fret_ld102_esp_logo`
								flags = 36
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = gtr33d_nekhed
				chosen_materials = {
					material1 = grey_3guitar
				}
			}
			cas_guitar_pickguards = {
				desc_id = none
			}
			cas_guitar_bridges = {
				desc_id = gtr33_hardware01z
				chosen_materials = {
					material1 = grey_3guitar
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
		}
	}
	{
		name = gh_rocker_mattbellamy_bassist
		fullname = qs(0xcb1cd6df)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x3feb2088)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = pop
			cas_body = {
				desc_id = gh4_car_male
				random_weight = 1.0
				cas_male_physique = {
					desc_id = malephysique1
				}
				cas_eyes = {
					desc_id = car_brown_eyes
				}
				cas_male_eyebrows = {
					desc_id = car_default_brow
				}
				cas_male_hair = {
					desc_id = none
				}
				chosen_materials = {
					skin = skin_black4
					nails = carblack_1
				}
				bones = {
					facefullness = 0.4
					jawprominence = 0.7
					jawshape = 0.0
					chinangle = 0.8
					lowerlipthickness = 1.0
					nosewidth = 0.7
					nosesize = 0.4
					nosetipwidth = 1.0
					eyescale = 0.514
					eyedistance = -0.8
					eyeangle = 0.7
					eyecornershape = 0.137
					eyeshape = 0.0
					eyebrowdistance = -0.756
					eyebrowangle = 0.9
					eyebrowsize = 0.0
					browdepth = 0.6
					mouthscale = 0.467
					upperlipthickness = 1.0
					lipshapelower = 0.6
					lipshapeupper = 0.4
					browposition = 1.0
					noseposition = 0.0
					mouthdepth = 0.0
					mouthposition = 0.7
					nosebridge = 0.5
					chincleft = 1.0
					chinprominence = 0.5
					chinheight = 0.5
					chinwidth = 0.5
					noselength = 0.5
				}
			}
			cas_male_physique = {
				desc_id = malephysique1
			}
			cas_eyes = {
				desc_id = car_brown_eyes
			}
			cas_male_eyebrows = {
				desc_id = car_default_brow
			}
			cas_male_hair = {
				desc_id = m_pop_hair_emo1
			}
			cas_male_hat = {
				desc_id = none
			}
			cas_male_facial_hair = {
				desc_id = none
			}
			cas_male_torso = {
				desc_id = m_clsc_torso_confed
				chosen_materials = {
					material1 = red_3
				}
			}
			cas_male_legs = {
				desc_id = m_pop_legs_pants
				chosen_materials = {
					material1 = grey_1
				}
			}
			cas_male_shoes = {
				desc_id = m_mtl_shoes_axel1
				chosen_materials = {
					material2 = red_3
					material1 = grey_5
					material3 = red_3
				}
			}
			cas_male_acc_left = {
				desc_id = none
			}
			cas_male_acc_right = {
				desc_id = none
			}
			cas_male_acc_face = {
				desc_id = none
			}
			cas_male_acc_ears = {
				desc_id = none
			}
			cas_male_age = {
				desc_id = car_male_teen
			}
			cas_male_teeth = {
				desc_id = car_male_teeth
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
								color = grey_5guitar
								texture = `tex/models/characters/layers/cab/mcswain/22fret_ld07_mcswn_bullets`
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
		}
	}
	{
		name = gh_rocker_mattbellamy_drummer
		fullname = qs(0x94ce1ce8)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x6039eabf)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = `heavy metal`
			cas_body = {
				desc_id = gh4_car_male
				random_weight = 1.0
				cas_male_physique = {
					desc_id = malephysique1
				}
				cas_eyes = {
					desc_id = car_brown_eyes
				}
				cas_male_eyebrows = {
					desc_id = car_default_brow
				}
				chosen_materials = {
					skin = skin_white3
				}
				bones = {
					facefullness = 0.0
					jawshape = 0.0
					jawprominence = 0.3
					mouthposition = 0.0
					chinwidth = 1.0
					chincleft = 1.0
					noseangle = 0.5
					nosetipwidth = 0.66700006
					nosetipangle = 0.1
					nosenostrilsize = 0.2
					nosenostrilheight = 0.5
					nosenostrilangle = 1.0
					nosewidth = 0.7
					eyescale = 0.4
					eyeposition = -0.6
					eyeangle = 0.6
					eyecornershape = 0.0
					eyeshape = 0.105000004
					eyedistance = -1.0
					lowerlipthickness = 1.0
					mouthdepth = 0.0
					noseposition = 0.4
					noselength = 0.2
					eyebrowangle = 1.0
					eyebrowdistance = -0.8
					browposition = 0.0
					lipshapeupper = 0.0
					upperlipthickness = 0.5
					earprominence = 0.42600003
					earsize = 0.0
				}
			}
			cas_male_physique = {
				desc_id = malephysique4
			}
			cas_eyes = {
				desc_id = car_brown_eyes
			}
			cas_male_eyebrows = {
				desc_id = car_default_brow
			}
			cas_male_hair = {
				desc_id = m_metl_hair_lars
				chosen_materials = {
					material1 = carblack_1
				}
			}
			cas_male_hat = {
				desc_id = none
			}
			cas_male_facial_hair = {
				desc_id = none
			}
			cas_male_torso = {
				desc_id = m_punk_torso_beater
			}
			cas_male_legs = {
				desc_id = m_punk_legs_cutoff
				chosen_materials = {
					material1 = red_3
				}
			}
			cas_male_shoes = {
				desc_id = m_metl_shoes_dirtyhightops
			}
			cas_male_acc_left = {
				desc_id = none
			}
			cas_male_acc_right = {
				desc_id = none
			}
			cas_male_acc_face = {
				desc_id = none
			}
			cas_male_acc_ears = {
				desc_id = none
			}
			cas_male_age = {
				desc_id = car_male_mature
			}
			cas_male_teeth = {
				desc_id = car_male_teeth
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
	}
	{
		name = skeleton
		fullname = qs(0x998b2c00)
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		preset_icon = photo_skeleton
		blurb = qs(0xf1526867)
		polaroid = m_fun_skeleton
		locked
		appearance = {
			genre = `heavy metal`
			cas_full_body = {
				desc_id = skeleton
			}
			cas_male_physique = {
				desc_id = skeletonphysique
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
								texture = `tex/models/characters/layers/cag/bc_rich/gtr_bc_rich_warbeast_ld1`
								flags = 4
								color = grey_5guitar
							}
							{
								color = blue_2
								texture = `tex/models/characters/layers/cag/bc_rich/gtr_bc_rich_warbeast_fd4`
								flags = 4
							}
							{
								texture = `tex/models/characters/layers/cag/bc_rich/gtr_bc_rich_warbeast_dtl1`
								flags = 4
								color = blue_2
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
								texture = `tex/models/characters/layers/cag/bc_rich/gtr20_neckhead_ld03`
								flags = 36
								color = grey_5guitar
							}
							{
								texture = `tex/models/characters/layers/cag/bc_rich/gtr20_neckhead_dtl02`
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
			}
			cas_guitar_knobs = {
				desc_id = gtr_knob_01
			}
			cas_guitar_pickups = {
				desc_id = gtr_emg_pickup1
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
						material = bass63_ex_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/esp/bass63_ex_ld_01`
								flags = 4
								color = grey_5guitar
							}
							{
								color = black_1guitar
								texture = `tex/models/characters/layers/cab/esp/bass63_ex_dtl_11`
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
								texture = `tex/models/characters/layers/cab/esp/bass63_neckhead_ld_01`
								flags = 36
								color = grey_5guitar
							}
							{
								texture = `tex/models/characters/layers/cab/esp/bass63_neckhead_dtl_06`
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
			cas_drums = {
				desc_id = newtamatriple
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
		name = gh_rocker_silhouette_gold
		fullname = qs(0xa9148e1e)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0xb0cbd961)
		no_random_pick
		locked
		appearance = {
			genre = goth
			cas_full_body = {
				desc_id = silhouette_gold
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
								color = orange_3
								texture = `tex/models/characters/layers/cag/mcswain/gtr10_mcswain_flame_ld1`
								flags = 4
							}
							{
								texture = `tex/models/characters/layers/cag/mcswain/gtr10_mcswain_flame_fd2`
								flags = 4
								color = yellow_1guitar
							}
							{
								texture = `tex/models/characters/layers/cag/mcswain/gtr10_mcswain_flame_dtl2`
								flags = 4
								color = yellow_1guitar
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
								texture = `tex/models/characters/layers/cag/gh5/22_fret_ld70_mcswn_flame`
								flags = 36
								color = yellow_2guitar
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
								color = yellow_1guitar
							}
						]
					}
				]
				chosen_materials = {
					material1 = yellow_2guitar
				}
			}
			cas_guitar_pickguards = {
				desc_id = none
			}
			cas_guitar_bridges = {
				desc_id = gtr_bridge_mcswain_6
				chosen_materials = {
					material1 = yellow_2guitar
				}
			}
			cas_guitar_knobs = {
				desc_id = gtr_knob_01
				chosen_materials = {
					material1 = yellow_3guitar
				}
			}
			cas_guitar_pickups = {
				desc_id = gtr_emg_pickup2
				chosen_materials = {
					material1 = yellow_1guitar
				}
			}
			cas_guitar_misc = {
				desc_id = gtr_misc_switch
				chosen_materials = {
					material1 = yellow_1guitar
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
								texture = `tex/models/characters/layers/cab/esp/bass14_esp_ax_ld_01`
								color = yellow_1guitar
							}
							{
								texture = `tex/models/characters/layers/cab/esp/bass14_esp_ax_dtl_03`
								flags = 4
								color = yellow_4guitar
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
								color = yellow_2guitar
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
								color = yellow_1guitar
							}
						]
					}
				]
				chosen_materials = {
					material1 = yellow_1guitar
				}
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
				desc_id = bass14_bridge_4str_02
				chosen_materials = {
					material1 = yellow_1guitar
				}
			}
			cas_bass_knobs = {
				desc_id = bass14_knob_04
				chosen_materials = {
					material1 = yellow_1guitar
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
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld18`
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
								texture = `tex/models/characters/layers/cadrm/gh5_skin_ld59`
								flags = 4
								color = yellow_2guitar
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks_ahead
			}
			cas_mic = {
				desc_id = mic_frequency
			}
			cas_mic_stand = {
				desc_id = spirals
			}
		}
	}
	{
		name = gh_rocker_blackout
		fullname = qs(0x12b9e0af)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x83231623)
		no_random_pick
		locked
		appearance = {
			genre = goth
			cas_full_body = {
				desc_id = silhouette_m
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
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
								color = black_1guitar
								texture = `tex/models/characters/layers/cag/ibanez/gtr75_ibz_xpt_ld02`
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
								texture = `tex/models/characters/layers/cag/all_clear2`
								flags = 4
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
						material = gtr75_neckhead_01_primary
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
					material1 = grey_2guitar
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
				desc_id = bas_brdg_ibz_mono
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
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = mic_d3414s
			}
			cas_mic_stand = {
				desc_id = `classic rock`
			}
		}
	}
	{
		name = silhouette
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		selection_not_allowed
		appearance = {
			cas_full_body = {
				desc_id = silhouette_m
			}
		}
	}
	{
		name = emptyguy
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		selection_not_allowed
		appearance = $empty_appearance
	}
]
preset_musician_profiles_debug = [
	{
		name = worstfemalecharacter
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		selection_not_allowed
		appearance = {
			$worst_female_appearance
			$worst_female_appearance_hack
		}
	}
	{
		name = worstmalecharacter
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		selection_not_allowed
		appearance = {
			$worst_male_appearance
			$worst_male_appearance_hack
		}
	}
	{
		name = bloke
		fullname = qs(0x06d716ff)
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		preset_icon = photo_skeleton
		blurb = qs(0x03ac90f0)
		appearance = {
			genre = `classic rock`
			cas_body = {
				desc_id = gh4_car_male
			}
			cas_male_physique = {
				desc_id = malephysique1
			}
			cas_eyes = {
				desc_id = car_blue_eyes
			}
			cas_male_eyebrows = {
				desc_id = car_default_brow
			}
			cas_male_hair = {
				desc_id = m_clsc_hair_george
				chosen_materials = {
					material1 = yellow_2
				}
			}
			cas_male_hat = {
				desc_id = none
			}
			cas_male_facial_hair = {
				desc_id = none
			}
			cas_male_torso = {
				desc_id = m_clsc_torso_scarf
			}
			cas_male_legs = {
				desc_id = m_clsc_legs_ltjeans
			}
			cas_male_shoes = {
				desc_id = m_flipflops
			}
			cas_male_acc_left = {
				desc_id = m_clsc_acc_l3rings
			}
			cas_male_acc_right = {
				desc_id = none
			}
			cas_male_acc_face = {
				desc_id = none
			}
			cas_male_acc_ears = {
				desc_id = none
			}
			cas_male_age = {
				desc_id = car_male_teen
			}
			cas_male_teeth = {
				desc_id = car_male_teeth
			}
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
							}
							{
								texture = `tex/models/characters/layers/cag/esp/gtr4_esp_eclipse_dtl_05`
								flags = 4
								color = yellow_green_3guitar
							}
						]
					}
				]
			}
			cas_guitar_neck = {
				desc_id = gtr_fretboard_01
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d_01`
						material = gtr_fretboard_01_primary
						diffuse
						pre_layer = [
							{
								color = grey_5
								texture = `tex/models/characters/layers/cag/gh5/22fret_ld93_esp_patriot`
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
								texture = `tex/models/characters/layers/cag/esp/gtr4_neckhead_ld_02`
								flags = 36
							}
							{
								texture = `tex/models/characters/layers/cag/esp/gtr4_neckhead_dtl_06`
								flags = 36
								color = yellow_green_3guitar
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
			}
			cas_guitar_pickups = {
				desc_id = gtr_pkup_type1_blk_2
				chosen_materials = {
					material1 = grey_2guitar
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
								texture = `tex/models/characters/layers/cab/esp/bass14_esp_ax_ld_01`
								flags = 4
							}
							{
								texture = `tex/models/characters/layers/cab/esp/bass14_esp_ax_dtl_13`
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
								texture = `tex/models/characters/layers/cab/esp/bass_fretboard_inlay_01`
								flags = 4
								color = black_1guitar
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = bass14_neckhead_02
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass9_neckhead_d_02`
						material = bass14_neckhead_02_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/esp/bass9_neckhead2_ld_11`
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
				desc_id = bass9_pkup_type3_blk_2
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bass14_bridge_4str_02
			}
			cas_bass_knobs = {
				desc_id = bass14_knob_05
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
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_48`
								flags = 4
								color = yellow_3guitar
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
			cas_mic = {
				desc_id = metal
			}
			cas_mic_stand = {
				desc_id = goth
			}
		}
	}
	{
		name = drummerbloke
		fullname = qs(0xdde2fb65)
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		preset_icon = photo_skeleton
		blurb = qs(0x03ac90f0)
		appearance = {
			genre = `classic rock`
			cas_body = {
				desc_id = gh4_car_male
			}
			cas_male_physique = {
				desc_id = malephysique1
			}
			cas_eyes = {
				desc_id = car_blue_eyes
			}
			cas_male_eyebrows = {
				desc_id = car_default_brow
			}
			cas_male_hair = {
				desc_id = m_clsc_hair_george
				chosen_materials = {
					material1 = yellow_2
				}
			}
			cas_male_hat = {
				desc_id = none
			}
			cas_male_facial_hair = {
				desc_id = none
			}
			cas_male_torso = {
				desc_id = m_clsc_torso_scarf
			}
			cas_male_legs = {
				desc_id = m_clsc_legs_ltjeans
			}
			cas_male_shoes = {
				desc_id = m_flipflops
			}
			cas_male_acc_left = {
				desc_id = m_clsc_acc_l3rings
			}
			cas_male_acc_right = {
				desc_id = none
			}
			cas_male_acc_face = {
				desc_id = none
			}
			cas_male_acc_ears = {
				desc_id = none
			}
			cas_male_age = {
				desc_id = car_male_teen
			}
			cas_male_teeth = {
				desc_id = car_male_teeth
			}
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
							}
							{
								texture = `tex/models/characters/layers/cag/esp/gtr4_esp_eclipse_dtl_05`
								flags = 4
								color = yellow_green_3guitar
							}
						]
					}
				]
			}
			cas_guitar_neck = {
				desc_id = gtr_fretboard_01
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d_01`
						material = gtr_fretboard_01_primary
						diffuse
						pre_layer = [
							{
								color = grey_5
								texture = `tex/models/characters/layers/cag/gh5/22fret_ld93_esp_patriot`
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
								texture = `tex/models/characters/layers/cag/esp/gtr4_neckhead_ld_02`
								flags = 36
							}
							{
								texture = `tex/models/characters/layers/cag/esp/gtr4_neckhead_dtl_06`
								flags = 36
								color = yellow_green_3guitar
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
			}
			cas_guitar_pickups = {
				desc_id = gtr_pkup_type1_blk_2
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_bass_body = {
				desc_id = bass105_pin
			}
			cas_bass_neck = {
				desc_id = cab_22_heroes04
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_05`
						material = bass_fretboard_22d_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/musicman/bass_mm_fboard_22_inlay1`
								flags = 4
								color = grey_5guitar
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = bass105_neckhead
			}
			cas_bass_pickguards = {
				desc_id = none
			}
			cas_bass_pickups = {
				desc_id = bass_emgpickup3b
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
				desc_id = newtamatriple
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = metal
			}
			cas_mic_stand = {
				desc_id = goth
			}
		}
	}
]
