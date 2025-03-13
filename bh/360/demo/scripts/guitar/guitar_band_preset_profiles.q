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
		name = 0xb1e2942d
		fullname = qs(0x1198e746)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x318ad702)
		no_random_pick
		locked
		appearance = {
			genre = rock
			cas_full_body = {
				desc_id = 0x34ef4e62
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
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
		name = 0x3c17a2c4
		fullname = qs(0x1198e746)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		win_anims = [
			s_jeff_win_waving
		]
		lose_anims = [
			s_jeff_lose_walkoff
		]
		preset_icon = photo_eddie
		blurb = qs(0x318ad702)
		no_random_pick
		selection_not_allowed
		locked
		appearance = {
			genre = rock
			cas_full_body = {
				desc_id = 0x34ef4e62
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
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
		name = 0x89438ada
		fullname = qs(0x3a7cbe0e)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x0d55e394)
		no_random_pick
		locked
		appearance = {
			genre = rock
			cas_full_body = {
				desc_id = 0x6fa5db01
			}
			cas_female_physique = {
				desc_id = femalephysiqueuntouched
			}
			cas_guitar_body = {
				desc_id = 0x07a1f6b0
				cap = [
					{
						base_tex = 0x8980dd3d
						material = 0xb717138d
						diffuse
						pre_layer = [
							{
								texture = 0x77e97135
							}
						]
					}
				]
			}
			cas_guitar_neck = {
				desc_id = 0x74b24c72
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
						material = gtr_fretboard_04_primary
						diffuse
						pre_layer = [
							{
								color = grey_5
								texture = 0x75dc59a4
								flags = 36
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = gtr142_neckhead
				cap = [
					{
						base_tex = 0x6be5c6b8
						material = 0x79b48190
						diffuse
						pre_layer = [
							{
								texture = 0x3e192e3d
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
				desc_id = 0x4d77968c
			}
			cas_guitar_knobs = {
				desc_id = 0xeaa46f70
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
								texture = `tex/models/characters/layers/cab/esp/bass17_esp_ax_ld_01`
								color = yellow_4guitar
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
								color = yellow_4guitar
							}
							{
								texture = `tex/models/characters/layers/cab/esp/bass9_neckhead3_dtl_04`
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
			}
			cas_bass_knobs = {
				desc_id = bass17_esp_knob_10
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
								texture = `tex/models/characters/layers/cadrm/gh5_skin_ld42`
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
		name = 0xae5829c0
		fullname = qs(0x5f2add08)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x3de61082)
		no_random_pick
		selection_not_allowed
		locked
		appearance = {
			genre = rock
			cas_full_body = {
				desc_id = 0xbfbfc4cd
			}
			cas_female_physique = {
				desc_id = femalephysiqueuntouched
			}
			cas_guitar_body = {
				desc_id = 0x9c0ea75f
				cap = [
					{
						base_tex = 0x8980dd3d
						material = 0xb717138d
						diffuse
						pre_layer = [
							{
								texture = 0x77e97135
							}
						]
					}
				]
			}
			cas_guitar_neck = {
				desc_id = 0xcb1502fe
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
						material = 0x3d6b34c5
						diffuse
						pre_layer = [
							{
								color = grey_5
								texture = 0x75dc59a4
								flags = 36
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = 0x4588aad5
				cap = [
					{
						base_tex = 0x6be5c6b8
						material = 0x79b48190
						diffuse
						pre_layer = [
							{
								texture = 0x3e192e3d
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
				desc_id = 0xb32b0db8
			}
			cas_guitar_knobs = {
				desc_id = 0xeaa46f70
			}
			cas_guitar_pickups = {
				desc_id = gtr26_dummy
			}
			cas_guitar_misc = {
				desc_id = none
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
								color = grey_4guitar
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
								texture = `tex/models/characters/layers/cab/ibanez/bass_sr24_inlay002`
								flags = 4
								color = teal_5
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = 0xe5a5fef0
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/ibanez/bs_ibz_icb_head`
						material = bass_neckhead_icb_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_icb_hd_dtl07`
								flags = 36
								color = grey_4guitar
							}
							{
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_icb_hd_dtl02`
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
				desc_id = bass_emgpickup1
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bas_brdg_ibz01
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
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						material = cad_drums_01_bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_skin_ld42`
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
		name = 0xd95f1956
		fullname = qs(0x4631ec49)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x855a77e7)
		intro_anims = [
			0x5d15ec08
		]
		win_anims = [
			0x5d15ec08
		]
		lose_anims = [
			0xf3ed7646
		]
		no_random_pick
		selection_not_allowed
		locked
		appearance = {
			genre = rock
			cas_full_body = {
				desc_id = 0xc8b8f45b
			}
			cas_female_physique = {
				desc_id = femalephysiqueuntouched
			}
			cas_guitar_body = {
				desc_id = 0x07a1f6b0
				cap = [
					{
						base_tex = 0x8980dd3d
						material = 0xb717138d
						diffuse
						pre_layer = [
							{
								texture = 0x77e97135
								color = yellow_orange_5
							}
						]
					}
				]
			}
			cas_guitar_neck = {
				desc_id = 0x74b24c72
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
				desc_id = gtr142_neckhead
				chosen_materials = {
					material1 = orange_5
				}
				cap = [
					{
						base_tex = 0x6be5c6b8
						material = 0x79b48190
						diffuse
						pre_layer = [
							{
								color = black_1guitar
								texture = 0xd9a1033a
								flags = 36
							}
							{
								texture = 0x5edea7d8
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
				desc_id = 0x4d77968c
				chosen_materials = {
					material1 = orange_5
				}
			}
			cas_guitar_knobs = {
				desc_id = 0xeaa46f70
			}
			cas_guitar_pickups = {
				desc_id = gtr26_dummy
			}
			cas_guitar_misc = {
				desc_id = none
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
								color = grey_4guitar
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
								texture = `tex/models/characters/layers/cab/ibanez/bass_sr24_inlay002`
								flags = 4
								color = teal_5
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = 0xe5a5fef0
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/ibanez/bs_ibz_icb_head`
						material = bass_neckhead_icb_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_icb_hd_dtl07`
								flags = 36
								color = grey_4guitar
							}
							{
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_icb_hd_dtl02`
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
				desc_id = bass_emgpickup1
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bas_brdg_ibz01
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
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						material = cad_drums_01_bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_skin_ld42`
								flags = 4
								color = grey_5guitar
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						material = cad_drums_01_primary
						diffuse
						0x749ec01e
						0x911c3279 = [
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
				desc_id = mic_cash
			}
			cas_mic_stand = {
				desc_id = micstand_cash
			}
		}
	}
	{
		name = 0x48d89fb1
		fullname = qs(0x3cdee9de)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x7962e47e)
		no_random_pick
		locked
		appearance = {
			genre = rock
			cas_full_body = {
				desc_id = 0xae3ece6a
			}
			cas_female_physique = {
				desc_id = femalephysiqueuntouched
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
								texture = `tex/models/characters/layers/cag/esp/gtr33_solid`
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
								texture = `tex/models/characters/layers/cag/gh5/24fret_ld01_hero_dots`
								flags = 36
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = gtr33d_nekhed
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr33d_nekhed`
						material = gtr33d_neckhead_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr33_nhead_solid`
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
				desc_id = gtr33_hardware01z
			}
			cas_guitar_knobs = {
				desc_id = gtr33_knobs_kh2
			}
			cas_guitar_pickups = {
				desc_id = gtr33_emg
			}
			cas_guitar_misc = {
				desc_id = none
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
								color = grey_4guitar
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
								texture = `tex/models/characters/layers/cab/ibanez/bass_sr24_inlay002`
								flags = 4
								color = teal_5
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = 0xe5a5fef0
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/ibanez/bs_ibz_icb_head`
						material = bass_neckhead_icb_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_icb_hd_dtl07`
								flags = 36
								color = grey_4guitar
							}
							{
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_icb_hd_dtl02`
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
				desc_id = bass_emgpickup1
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bas_brdg_ibz01
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
						material = cad_drums_01_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_04`
								flags = 32
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						material = cad_drums_01_bassdrum
						diffuse
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
								x_scale = 111
								flags = 259
								y_scale = 114
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks_adrian
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
		name = 0x74f90a05
		fullname = qs(0x2b1ddae2)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x0713ea70)
		no_random_pick
		selection_not_allowed
		locked
		appearance = {
			genre = rock
			cas_full_body = {
				desc_id = 0x651ee708
			}
			cas_female_physique = {
				desc_id = femalephysiqueuntouched
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
								texture = `tex/models/characters/layers/cag/esp/gtr33_solid`
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
								texture = `tex/models/characters/layers/cag/gh5/24fret_ld01_hero_dots`
								flags = 36
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = gtr33d_nekhed
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr33d_nekhed`
						material = gtr33d_neckhead_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr33_nhead_solid`
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
				desc_id = gtr33_hardware01z
			}
			cas_guitar_knobs = {
				desc_id = gtr33_knobs_kh2
			}
			cas_guitar_pickups = {
				desc_id = gtr33_emg
			}
			cas_guitar_misc = {
				desc_id = none
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
								color = grey_5guitar
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
								color = grey_5guitar
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
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						material = cad_drums_01_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_04`
								flags = 32
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						material = cad_drums_01_bassdrum
						diffuse
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
								x_scale = 111
								flags = 259
								y_scale = 114
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks_adrian
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
		name = 0xbb7f03d4
		fullname = qs(0xe7c54951)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x65d18445)
		no_random_pick
		locked
		appearance = {
			genre = rock
			cas_full_body = {
				desc_id = 0xd3959486
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
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
								texture = `tex/models/characters/layers/cag/schecter/gtr73_sch_s1_ld02`
								flags = 4
								color = grey_5guitar
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
								texture = `tex/models/characters/layers/cag/gh5/22_fret_ld49_shctr_block`
								flags = 36
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = gtr73_neckhead_04
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/schecter/gtr74_neckhead_01_d`
						material = gtr73_neckhead_04_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/schecter/gtr74_neckhead_01_ld02`
								flags = 36
								color = grey_5guitar
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
			}
			cas_guitar_knobs = {
				desc_id = gtr_knob_01c
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
				desc_id = bass14_esp_surveyor
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\esp\bass14_esp_surveyor_d`
						material = bass14_esp_surveyor_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/esp/bass14_esp_ax_ld_01`
								color = grey_5guitar
							}
							{
								texture = `tex/models/characters/layers/cab/esp/bass14_esp_ax_dtl_02`
								flags = 4
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
								texture = `tex/models/characters/layers/cab/esp/bass_fretboard_24_inlay_05`
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
								color = grey_5guitar
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
				desc_id = bass14_bridge_4str_01
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_knobs = {
				desc_id = bass14_esp_knob_10_04
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
						material = newtamadouble_bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_15`
								flags = 4
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
								y_scale = 113
								flags = 259
								x_scale = 107
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
		name = 0x35ef70f9
		fullname = qs(0x5cb56267)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0xdea1af73)
		no_random_pick
		locked
		appearance = {
			genre = rock
			cas_full_body = {
				desc_id = 0x5d05e7ab
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
								texture = `tex/models/characters/layers/cag/prs/gtr82_prs_se1_ld01`
								flags = 4
								color = grey_5guitar
							}
							{
								texture = `tex/models/characters/layers/cag/prs/gtr78_prs_sc_dtl04`
								flags = 4
								color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cag/prs/gtr78_prs_sc_dtl02`
								flags = 4
								color = black_1guitar
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
								color = grey_4guitar
								texture = `tex/models/characters/layers/cag/prs/22fret_ld114_prs_dots`
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
								color = grey_5guitar
							}
							{
								texture = `tex/models/characters/layers/cag/prs/gtr82_neckhead_01_dtl04`
								flags = 36
								color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cag/prs/gtr78_neckhead_dtl02`
								flags = 36
								color = black_1guitar
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
				desc_id = prs_pickup_hbucker
			}
			cas_guitar_misc = {
				desc_id = none
			}
			cas_bass_body = {
				desc_id = 0xf086e191
				cap = [
					{
						base_tex = 0x093ad477
						material = 0xc00f6ac6
						diffuse
						pre_layer = [
							{
								texture = 0xc471b168
								flags = 4
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = 0xb5f44bd6
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_05`
						material = bass_fretboard_22d_primary
						diffuse
						pre_layer = [
							{
								color = grey_5guitar
								texture = 0xf9790be5
								flags = 4
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = 0x9efa255a
				cap = [
					{
						base_tex = 0x73ec2af0
						material = 0x85738ea9
						diffuse
						pre_layer = [
							{
								texture = 0x88dd600c
								flags = 36
							}
							{
								color = black_1guitar
								texture = 0xffda509a
								flags = 36
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = 0xfdd9b49c
			}
			cas_bass_pickups = {
				desc_id = 0xbaf1c67b
			}
			cas_bass_bridges = {
				desc_id = 0x9217f019
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
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						material = cad_drums_01_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_04`
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
			cas_mic = {
				desc_id = mic_standard
			}
			cas_mic_stand = {
				desc_id = rock
			}
		}
	}
	{
		name = 0xd813f600
		fullname = qs(0x34c37d34)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x5fd78db6)
		no_random_pick
		locked
		appearance = {
			genre = rock
			cas_full_body = {
				desc_id = 0x3ef5a7db
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
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
								texture = `tex/models/characters/layers/cag/schecter/gtr73_sch_s1_dtl01`
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
							{
								texture = `tex/models/characters/layers/cag/all_clear3`
								flags = 4
							}
							{
								texture = `tex/models/characters/layers/cag/schecter/gtr73_neckhead_dtl01`
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
			}
			cas_guitar_knobs = {
				desc_id = gtr_knob_01c
			}
			cas_guitar_pickups = {
				desc_id = gtr70_sch_ultra_pickup
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
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_ld00`
								color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_dtl02`
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
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_hd_dtl07`
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
				desc_id = bas_ibz_pkup002
				chosen_materials = {
					material1 = grey_5guitar
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
				desc_id = drumsticks_adrian
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
		name = 0x26ab6f0d
		fullname = qs(0x24f300ab)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x5c7973e8)
		no_random_pick
		locked
		appearance = {
			genre = rock
			cas_full_body = {
				desc_id = 0x6eb102a0
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
				desc_id = `black metal`
			}
			cas_mic_stand = {
				desc_id = `chain saw`
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
				desc_id = gtr_emg_pickup2
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
				desc_id = `classic rock`
			}
			cas_mic_stand = {
				desc_id = `classic rock`
			}
		}
	}
	{
		name = 0x47f4d11c
		fullname = qs(0xe7c54951)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		intro_anims = [
			0x38b7f748
		]
		win_anims = [
			0x38b7f748
		]
		lose_anims = [
			0xd9632956
		]
		preset_icon = photo_eddie
		blurb = qs(0x65d18445)
		no_random_pick
		selection_not_allowed
		locked
		appearance = {
			genre = rock
			cas_full_body = {
				desc_id = 0xd3959486
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
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
								texture = `tex/models/characters/layers/cag/schecter/gtr73_sch_s1_ld02`
								color = grey_5guitar
								flags = 4
								a = 65
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
								texture = `tex/models/characters/layers/cag/gh5/22_fret_ld49_shctr_block`
								flags = 36
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = 0x39cd5155
			}
			cas_guitar_pickguards = {
				desc_id = gtr73_pg1
			}
			cas_guitar_bridges = {
				desc_id = gtr72_bridge
			}
			cas_guitar_knobs = {
				desc_id = gtr_knob_01c
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
				desc_id = bass14_esp_surveyor
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\esp\bass14_esp_surveyor_d`
						material = bass14_esp_surveyor_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/esp/bass14_esp_ax_ld_01`
								color = grey_5guitar
							}
							{
								texture = `tex/models/characters/layers/cab/esp/bass14_esp_ax_dtl_02`
								flags = 4
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
								texture = `tex/models/characters/layers/cab/esp/bass_fretboard_24_inlay_05`
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
								color = grey_5guitar
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
				desc_id = bass14_bridge_4str_01
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_knobs = {
				desc_id = bass14_esp_knob_10_04
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
						material = newtamadouble_bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_15`
								flags = 4
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
								y_scale = 113
								flags = 259
								x_scale = 107
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
		name = 0x9ba6f881
		fullname = qs(0x5cb56267)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		intro_anims = [
			0x133d2757
		]
		win_anims = [
			0x133d2757
		]
		lose_anims = [
			0x3140d22e
		]
		preset_icon = photo_eddie
		blurb = qs(0xdea1af73)
		no_random_pick
		selection_not_allowed
		locked
		appearance = {
			genre = rock
			cas_full_body = {
				desc_id = 0x5d05e7ab
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
								texture = `tex/models/characters/layers/cag/prs/gtr82_prs_se1_ld01`
								flags = 4
								color = grey_5guitar
							}
							{
								texture = `tex/models/characters/layers/cag/prs/gtr78_prs_sc_dtl04`
								flags = 4
								color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cag/prs/gtr78_prs_sc_dtl02`
								flags = 4
								color = black_1guitar
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
								color = grey_4guitar
								texture = `tex/models/characters/layers/cag/prs/22fret_ld114_prs_dots`
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
								color = grey_5guitar
							}
							{
								texture = `tex/models/characters/layers/cag/prs/gtr82_neckhead_01_dtl04`
								flags = 36
								color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cag/prs/gtr78_neckhead_dtl02`
								flags = 36
								color = black_1guitar
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
				desc_id = prs_pickup_hbucker
			}
			cas_guitar_misc = {
				desc_id = none
			}
			cas_bass_body = {
				desc_id = 0xf086e191
				cap = [
					{
						base_tex = 0x093ad477
						material = 0xc00f6ac6
						diffuse
						pre_layer = [
							{
								texture = 0xc471b168
								flags = 4
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = 0xb5f44bd6
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_05`
						material = bass_fretboard_22d_primary
						diffuse
						pre_layer = [
							{
								color = grey_5guitar
								texture = 0xf9790be5
								flags = 4
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = 0x9efa255a
				cap = [
					{
						base_tex = 0x73ec2af0
						material = 0x85738ea9
						diffuse
						pre_layer = [
							{
								texture = 0xaa82913f
								flags = 36
							}
							{
								color = black_1guitar
								texture = 0xffda509a
								flags = 36
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = 0xfdd9b49c
			}
			cas_bass_pickups = {
				desc_id = 0xbaf1c67b
			}
			cas_bass_bridges = {
				desc_id = 0x9217f019
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
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						material = cad_drums_01_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_04`
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
			cas_mic = {
				desc_id = mic_standard
			}
			cas_mic_stand = {
				desc_id = rock
			}
		}
	}
	{
		name = 0x49d2384e
		fullname = qs(0xe7c54951)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		intro_anims = [
			0x38b7f748
		]
		win_anims = [
			0x38b7f748
		]
		lose_anims = [
			0xd9632956
		]
		preset_icon = photo_eddie
		blurb = qs(0x65d18445)
		no_random_pick
		selection_not_allowed
		locked
		appearance = {
			genre = rock
			cas_full_body = {
				desc_id = 0xd3959486
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
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
								texture = `tex/models/characters/layers/cag/schecter/gtr73_sch_s1_ld02`
								color = grey_5guitar
								flags = 4
								a = 65
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
								texture = `tex/models/characters/layers/cag/gh5/22_fret_ld49_shctr_block`
								flags = 36
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = 0x39cd5155
			}
			cas_guitar_pickguards = {
				desc_id = gtr73_pg1
			}
			cas_guitar_bridges = {
				desc_id = gtr72_bridge
			}
			cas_guitar_knobs = {
				desc_id = gtr_knob_01c
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
				desc_id = bass14_esp_surveyor
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\esp\bass14_esp_surveyor_d`
						material = bass14_esp_surveyor_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/esp/bass14_esp_ax_ld_01`
								color = grey_5guitar
							}
							{
								texture = `tex/models/characters/layers/cab/esp/bass14_esp_ax_dtl_02`
								flags = 4
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
								texture = `tex/models/characters/layers/cab/esp/bass_fretboard_24_inlay_05`
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
								color = grey_5guitar
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
				desc_id = bass14_bridge_4str_01
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_knobs = {
				desc_id = bass14_esp_knob_10_04
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
						material = newtamadouble_bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_15`
								flags = 4
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
								y_scale = 113
								flags = 259
								x_scale = 107
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
		name = 0x0c83f448
		fullname = qs(0x5cb56267)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		intro_anims = [
			0x133d2757
		]
		win_anims = [
			0x133d2757
		]
		lose_anims = [
			0x3140d22e
		]
		preset_icon = photo_eddie
		blurb = qs(0xdea1af73)
		no_random_pick
		selection_not_allowed
		locked
		appearance = {
			genre = rock
			cas_full_body = {
				desc_id = 0x5d05e7ab
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
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
				desc_id = 0xf086e191
			}
			cas_bass_neck = {
				desc_id = 0xb5f44bd6
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_05`
						material = bass_fretboard_22d_primary
						diffuse
						pre_layer = [
							{
								texture = 0xf9790be5
								flags = 4
								color = grey_5guitar
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = 0x9efa255a
			}
			cas_bass_pickguards = {
				desc_id = 0x4565d3f9
			}
			cas_bass_pickups = {
				desc_id = 0xbaf1c67b
			}
			cas_bass_bridges = {
				desc_id = 0x9217f019
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
		name = 0x908cf9f8
		fullname = qs(0x7e29918f)
		allowed_parts = [
			drum
		]
		intro_anims = [
			d_jeff_win_waving
		]
		win_anims = [
			d_jeff_win_waving
		]
		lose_anims = [
			d_jeff_lose_depressed
		]
		preset_icon = photo_eddie
		blurb = qs(0x5fd78db6)
		no_random_pick
		selection_not_allowed
		locked
		appearance = {
			genre = rock
			cas_full_body = {
				desc_id = 0x3ef5a7db
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
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
				desc_id = 0xb55d6fa6
			}
			cas_drums_sticks = {
				desc_id = drumsticks_adrian
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
		name = 0x6afc4e96
		fullname = qs(0xf4cfe004)
		allowed_parts = [
			guitar
		]
		preset_icon = photo_eddie
		blurb = qs(0xc747b4cc)
		no_random_pick
		selection_not_allowed
		locked
		appearance = {
			body_preset_index = 0
			genre = pop
			cas_body = {
				desc_id = gh4_car_male
				cap = [
					{
						base_tex = `tex/models/characters/global/global_blank_head_dnc`
						material = car_male_head
						cas_1
						post_layer = [
							{
								texture = `tex/models/characters/layers/car/male/makeup/car_male_eyeliner_01`
								flags = 4
							}
						]
					}
				]
				bones = {
					eyeshape = 0.0
					eyecornershape = 0.1
					eyeposition = -0.43
					eyedistance = -0.3
					mouthscale = 0.176
					eyebrowsize = 0.625
					eyebrowdistance = -0.9
					browposition = 0.2
					eyebrowangle = 0.3
					chinwidth = 0.9
					nosewidth = 0.23300001
					mouthposition = 0.237
					eyescale = 0.614
					eyeangle = 0.5
					facefullness = 0.7
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
				desc_id = m_glam_hair_izzy1
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
				desc_id = m_pop_torso_suit
				chosen_materials = {
					material1 = carblack_1
					material4 = red_2
				}
			}
			cas_male_legs = {
				desc_id = 0x824d7b3e
			}
			cas_male_shoes = {
				desc_id = m_rock_shoe_jcashchelsea
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
			cas_guitar_body = {
				desc_id = gtr79_prs_cstm24
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/prs/prs_ctm24_d`
						material = gtr79_prs_cst24_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/prs/gtr79_prs_ctm24_dtl06`
								flags = 4
								color = yellow_2guitar
							}
							{
								texture = `tex/models/characters/layers/cag/prs/gtr79_prs_ctm24_ld03`
								flags = 4
								color = red_1
							}
							{
								texture = `tex/models/characters/layers/cag/prs/gtr79_prs_ctm24_ld01`
								flags = 4
								color = orange_5
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
								texture = `tex/models/characters/layers/cag/prs/gtr78_neckhead_ld04`
								flags = 36
							}
							{
								texture = `tex/models/characters/layers/cag/prs/gtr78_neckhead_dtl03`
								flags = 36
								color = red_1
							}
							{
								texture = `tex/models/characters/layers/cag/prs/gtr78_neckhead_dtl01`
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
				desc_id = prs_knob_lampshade
				chosen_materials = {
					material1 = orange_2
				}
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_type2_prs
				chosen_materials = {
					material1 = yellow_4guitar
				}
			}
			cas_guitar_misc = {
				desc_id = gtr_misc_switch4
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
			cas_mic = {
				desc_id = pop
			}
			cas_mic_stand = {
				desc_id = poptastic
			}
		}
	}
	{
		name = 0x0e82efc2
		fullname = qs(0x94725ecc)
		allowed_parts = [
			bass
		]
		preset_icon = photo_eddie
		blurb = qs(0x8864aa53)
		no_random_pick
		selection_not_allowed
		locked
		appearance = {
			body_preset_index = 0
			genre = pop
			cas_body = {
				desc_id = gh4_car_male
				bones = {
					jawprominence = 0.2
					jawshape = 1.0
					chinprominence = 0.8
					chinwidth = 0.9
					lowerlipthickness = 1.0
					mouthscale = 0.37600002
					cheekboneprominence = 0.6
					cheekbonedepth = 0.3
					earsize = 0.4
					earprominence = 0.226
					nosenostrilheight = 0.7
					nosebridge = 0.3
					nosetipwidth = 0.167
					nosesize = 0.5
					upperlipthickness = 0.5
					eyeshape = 1.0
					eyedistance = -1.0
					eyeposition = -0.6
					eyecornershape = 0.0
					eyescale = 0.414
					eyebrowangle = 1.0
					eyebrowsize = 0.0
					browdepth = 0.5
					eyebrowdistance = -0.656
					browposition = 0.0
					noseangle = 0.2
					nosewidth = 0.3
				}
			}
			cas_male_physique = {
				desc_id = malephysique4
			}
			cas_eyes = {
				desc_id = car_hazel_eyes
			}
			cas_male_eyebrows = {
				desc_id = car_default_brow
			}
			cas_male_hair = {
				desc_id = 0x0078b3cc
			}
			cas_male_hat = {
				desc_id = none
			}
			cas_male_facial_hair = {
				desc_id = m_rock_fhair_stub
			}
			cas_male_torso = {
				desc_id = m_rock_torso_jcashvest
				chosen_materials = {
					material3 = blue_5
				}
			}
			cas_male_legs = {
				desc_id = m_metl_legs_tooskinny
			}
			cas_male_shoes = {
				desc_id = m_spnr_shoe_conversecs
			}
			cas_male_acc_left = {
				desc_id = 0xf2709175
			}
			cas_male_acc_right = {
				desc_id = 0xf89d4641
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
								color = grey_4guitar
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
								texture = `tex/models/characters/layers/cab/ibanez/bass_sr24_inlay002`
								flags = 4
								color = teal_5
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = 0xe5a5fef0
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/ibanez/bs_ibz_icb_head`
						material = bass_neckhead_icb_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_icb_hd_dtl07`
								flags = 36
								color = grey_4guitar
							}
							{
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_icb_hd_dtl02`
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
				desc_id = bass_emgpickup1
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bas_brdg_ibz01
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
			cas_mic = {
				desc_id = pop
			}
			cas_mic_stand = {
				desc_id = poptastic
			}
		}
	}
	{
		name = 0x2564c7ff
		fullname = qs(0xcba094fb)
		allowed_parts = [
			drum
		]
		preset_icon = photo_eddie
		blurb = qs(0x63d27e1b)
		no_random_pick
		selection_not_allowed
		locked
		appearance = {
			body_preset_index = 0
			genre = pop
			cas_body = {
				desc_id = gh4_car_male
				bones = {
					jawshape = 0.3
					chinprominence = 0.7
					noseangle = 0.067
					nosewidth = 0.2
					nosebridge = 0.5
					lowerlipthickness = 0.0
					upperlipthickness = 0.1
					mouthposition = 0.2
					eyescale = 0.314
					eyedistance = -0.7
					eyeangle = 0.7
					eyecornershape = 0.137
					eyebrowsize = 0.425
					eyebrowdistance = -0.35600004
					browposition = 0.0
					eyebrowangle = 0.5
					browdepth = 0.1
					facefullness = 0.3
					mouthscale = 0.576
				}
			}
			cas_male_physique = {
				desc_id = malephysique1
			}
			cas_eyes = {
				desc_id = car_blue_eyes
			}
			cas_male_eyebrows = {
				desc_id = car_rounded
			}
			cas_male_hair = {
				desc_id = none
			}
			cas_male_hat = {
				desc_id = none
			}
			cas_male_facial_hair = {
				desc_id = m_rock_fhair_goatee01
				chosen_materials = {
					material1 = yellow_orange_1
				}
			}
			cas_male_torso = {
				desc_id = m_metl_torso_unbttond
			}
			cas_male_legs = {
				desc_id = 0x2069a516
			}
			cas_male_shoes = {
				desc_id = m_spnr_shoe_conversecs
			}
			cas_male_acc_left = {
				desc_id = m_punk_acc_lrings
			}
			cas_male_acc_right = {
				desc_id = m_punk_acc_rrings
			}
			cas_male_acc_face = {
				desc_id = none
			}
			cas_male_acc_ears = {
				desc_id = m_punk_acc_ring
			}
			cas_male_age = {
				desc_id = car_male_mature
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
			cas_drums = {
				desc_id = 0x20b332e2
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = pop
			}
			cas_mic_stand = {
				desc_id = poptastic
			}
		}
	}
	{
		name = 0x01054cb2
		fullname = qs(0xe08151c2)
		allowed_parts = [
			guitar
		]
		preset_icon = photo_eddie
		blurb = qs(0xcd3f49a2)
		no_random_pick
		selection_not_allowed
		locked
		appearance = {
			body_preset_index = 0
			genre = pop
			cas_body = {
				desc_id = gh4_car_male
				bones = {
					nosewidth = 0.2
					noselength = 0.6
					noseangle = 0.367
					nosesize = 0.8
					nosenostrilsize = 0.7
					noseposition = 0.77199996
					mouthposition = 0.3
					mouthdepth = 0.1
					mouthscale = 0.3
					lipshapeupper = 1.0
					lowerlipthickness = 0.0
					mouthangle = 0.6
					eyecornershape = 0.6
					eyeshape = 0.9
					eyescale = 0.514
					eyeposition = -0.13
					eyedistance = -0.414
					eyeangle = 0.561
					eyebrowsize = 0.0
					eyebrowdistance = -0.556
					browposition = 0.0
					eyebrowangle = 0.8
					chinwidth = 0.0
					chinprominence = 0.4
					chinheight = 0.2
					cheekboneprominence = 0.6
					chinangle = 0.5
					cheekbonedepth = 0.1
					browdepth = 0.0
				}
			}
			cas_male_physique = {
				desc_id = malephysique1
			}
			cas_eyes = {
				desc_id = car_green_eyes
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
				desc_id = m_metl_torso_unbttond
				chosen_materials = {
					material1 = blue_3
				}
			}
			cas_male_legs = {
				desc_id = m_metl_legs_tooskinny
			}
			cas_male_shoes = {
				desc_id = m_spnr_shoe_conversecs
			}
			cas_male_acc_left = {
				desc_id = m_rock_acc_lwatch
			}
			cas_male_acc_right = {
				desc_id = m_rock_acc_rstrap
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
								color = yellow_orange_3
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
								flags = 36
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
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr37_pguard01_d`
						material = gtr37_pguard_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr37_pguard01_dtl01`
								flags = 4
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
			}
			cas_guitar_pickups = {
				desc_id = gtr37_pickup_f
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
			cas_mic = {
				desc_id = pop
			}
			cas_mic_stand = {
				desc_id = poptastic
			}
		}
	}
	{
		name = 0x8fdc240e
		fullname = qs(0x0a3206ae)
		allowed_parts = [
			bass
		]
		preset_icon = photo_eddie
		blurb = qs(0x2dfc522b)
		no_random_pick
		selection_not_allowed
		locked
		appearance = {
			body_preset_index = 0
			genre = pop
			cas_body = {
				desc_id = gh4_car_male
				chosen_materials = {
					skin = skin_asian3
				}
				bones = {
					nosewidth = 0.2
					noselength = 0.6
					nosenostrilsize = 0.7
					eyecornershape = 0.6
					eyeshape = 0.9
					eyebrowsize = 0.0
					eyebrowdistance = -0.556
					browposition = 0.0
					chinwidth = 0.0
					chinprominence = 0.4
					chinheight = 0.2
					cheekboneprominence = 0.6
					chinangle = 0.5
					cheekbonedepth = 0.1
					browdepth = 0.0
					eyeangle = 0.461
					eyedistance = 0.186
					eyescale = 0.7
					nosesize = 0.6
					nosebridge = 0.6
					nosetiplength = 0.167
					nosetipangle = 0.6
					noseangle = 0.467
					lipshapeupper = 0.0
					mouthposition = 0.6
					mouthscale = 0.3
					jawprominence = 0.9
					earsize = 0.333
					earprominence = 0.32600003
					eyebrowangle = 0.4
					mouthangle = 0.6
					lowerlipthickness = 0.5
					mouthdepth = 0.4
					eyeposition = -0.8
					noseposition = 1.0
				}
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
				desc_id = 0xc7934de6
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
				desc_id = m_torso_tshirt
				chosen_materials = {
					material1 = grey_3guitar
				}
			}
			cas_male_legs = {
				desc_id = m_rock_legs_jeans
				chosen_materials = {
					material1 = grey_4
				}
			}
			cas_male_shoes = {
				desc_id = m_metl_shoe_clscrunr
				chosen_materials = {
					material1 = carblack_3
				}
			}
			cas_male_acc_left = {
				desc_id = m_rock_acc_lwatch
			}
			cas_male_acc_right = {
				desc_id = m_rock_acc_rstripe
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
			cas_mic = {
				desc_id = pop
			}
			cas_mic_stand = {
				desc_id = poptastic
			}
		}
	}
	{
		name = 0xa43a0c33
		fullname = qs(0x55e0cc99)
		allowed_parts = [
			drum
		]
		preset_icon = photo_eddie
		blurb = qs(0xc64a8663)
		no_random_pick
		selection_not_allowed
		locked
		appearance = {
			body_preset_index = 0
			genre = pop
			cas_body = {
				desc_id = gh4_car_male
				cap = [
					{
						base_tex = `tex/models/characters/global/global_blank_head_dnc`
						material = car_male_head
						cas_1
						post_layer = [
							{
								texture = `tex/models/characters/layers/car/male/makeup/car_male_eyeliner_01`
								flags = 4
							}
						]
					}
				]
				bones = {
					nosewidth = 0.2
					noselength = 0.6
					nosenostrilsize = 0.7
					eyecornershape = 0.6
					eyebrowsize = 0.0
					eyebrowdistance = -0.556
					browposition = 0.0
					chinwidth = 0.0
					chinheight = 0.2
					cheekboneprominence = 0.6
					chinangle = 0.5
					cheekbonedepth = 0.1
					browdepth = 0.0
					eyedistance = 0.186
					nosetiplength = 0.167
					nosetipangle = 0.6
					noseangle = 0.467
					lipshapeupper = 0.0
					earsize = 0.333
					eyebrowangle = 0.4
					mouthangle = 0.6
					lowerlipthickness = 0.5
					mouthdepth = 0.4
					eyescale = 0.5
					eyeshape = 0.0
					eyeangle = 0.661
					eyeposition = 0.0
					nosesize = 0.4
					nosebridge = 0.0
					noseposition = 0.3
					mouthposition = 0.0
					mouthscale = 0.5
					jawprominence = 0.0
					chinprominence = 0.9
					earprominence = 0.126
				}
				chosen_materials = {
					eyebrows = yellow_4
					skin = skin_asian4
				}
			}
			cas_male_physique = {
				desc_id = malephysique1
			}
			cas_eyes = {
				desc_id = car_hazel_eyes
			}
			cas_male_eyebrows = {
				desc_id = car_rounded
			}
			cas_male_hair = {
				desc_id = 0x0078b3cc
				chosen_materials = {
					material1 = yellow_3
				}
			}
			cas_male_hat = {
				desc_id = none
			}
			cas_male_facial_hair = {
				desc_id = none
			}
			cas_male_torso = {
				desc_id = m_torso_layerednostripe
				chosen_materials = {
					material1 = yellow_green_2
					material2 = grey_1
				}
			}
			cas_male_legs = {
				desc_id = m_pop_legs_jeans
				chosen_materials = {
					material1 = carblack_3
				}
			}
			cas_male_shoes = {
				desc_id = m_spnr_shoe_vansh_bw
			}
			cas_male_acc_left = {
				desc_id = 0xf2709175
			}
			cas_male_acc_right = {
				desc_id = m_rock_acc_rstrap
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
			cas_drums = {
				desc_id = basic
				cap = [
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
				desc_id = pop
			}
			cas_mic_stand = {
				desc_id = poptastic
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
				desc_id = goth
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
				desc_id = goth
			}
			cas_mic_stand = {
				desc_id = goth
			}
		}
	}
]
