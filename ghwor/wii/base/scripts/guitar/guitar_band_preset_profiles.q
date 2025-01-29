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
	Name = avatar
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
		genre = `heavy	metal`
		cas_full_body = {
			desc_id = avatar
			avatar_meta_data = [
			]
		}
		cas_male_physique = {
			desc_id = avatarphysique
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
							Color = black_1guitar
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
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gh5/22_fret_ld01_hero_dots`
							flags = 4
							Color = grey_4guitar
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
					pre_layer = [
						{
							Color = black_1guitar
							texture = `tex/models/characters/layers/cag/bc_rich/gtr20_neckhead_ld02`
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
			desc_id = bs_sch_t_body
			cap = [
				{
					base_tex = `tex\models\car_instruments\bass\schecter\bs_sch_modelt`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_dtl01`
							Color = black_1guitar
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
							texture = `tex/models/characters/layers/cab/schecter/bs_sch_inl_ld30`
							flags = 4
							Color = grey_5guitar
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
					pre_layer = [
						{
							Color = black_1guitar
							texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_hd_dtl06`
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
			desc_id = None
		}
		cas_drums = {
			desc_id = basic
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
preset_musician_profiles_modifiable = [
]
preset_musician_profiles_locked = [
	{
		Name = gh_rocker_2009_1_002
		fullname = qs(0xce834ce7)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x2efbfd92)
		no_random_pick
		selection_not_allowed
		appearance = {
			cas_body = {
				desc_id = gh4_car_female
			}
			cas_eyes = {
				desc_id = car_blue_eyes
			}
			cas_female_eyebrows = {
				desc_id = car_default_thick_brow
			}
			cas_female_hair = {
				desc_id = f_rock_hair_emo
				chosen_materials = {
					material2 = grey_5
				}
			}
			cas_female_hat = {
				desc_id = None
			}
			cas_female_facial_hair = {
				desc_id = None
			}
			cas_female_torso = {
				desc_id = f_goth_torso_cyberstrap
				chosen_materials = {
					material1 = red_2
					material2 = carblack_1
				}
			}
			cas_female_legs = {
				desc_id = f_bmtl_legs_stichpants04
			}
			cas_female_shoes = {
				desc_id = f_metl_shoe_combat
			}
			cas_female_acc_left = {
				desc_id = f_goth_acc_lpndrbuckles
				chosen_materials = {
					material2 = carblack_3
				}
			}
			cas_female_acc_right = {
				desc_id = f_goth_acc_rstrapglove
				chosen_materials = {
					material2 = grey_4
				}
			}
			cas_female_acc_face = {
				desc_id = None
			}
			cas_guitar_body = {
				desc_id = gtr9_esp_ax
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr9_esp_ax_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_esp_eclipse_ld_11`
								flags = 4
								Color = red_1
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
						pre_layer = [
							{
								Color = grey_5
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_neckhead_ld_11`
								flags = 36
								Color = red_1
							}
						]
					}
				]
			}
			cas_guitar_pickguards = {
				desc_id = None
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
				desc_id = None
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
								Color = red_1
							}
							{
								texture = `tex/models/characters/layers/cab/esp/bass17_esp_ax_dtl_04`
								flags = 4
								Color = black_1guitar
							}
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/esp/bass17_esp_ax_dtl_16`
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
								texture = `tex/models/characters/layers/cab/esp/bass_fretboard_24_inlay_05`
								flags = 4
								Color = grey_5guitar
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
								texture = `tex/models/characters/layers/cab/esp/bass9_neckhead3_ld_01`
								flags = 36
								Color = red_1
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = None
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
				desc_id = None
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
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_tamashell_ld07`
								flags = 32
								Color = teal_3
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
		Name = gh_rocker_2009_1_001
		fullname = qs(0xe5ae1f24)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x1a518e05)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = `black	metal`
			cas_body = {
				desc_id = gh4_car_male
			}
			cas_eyes = {
				desc_id = car_brown_eyes
			}
			cas_male_eyebrows = {
				desc_id = car_default_brow
			}
			cas_male_hair = {
				desc_id = m_punk_hair_jny_2
				chosen_materials = {
					material1 = carblack_1
				}
			}
			cas_male_hat = {
				desc_id = None
			}
			cas_male_facial_hair = {
				desc_id = None
			}
			cas_male_torso = {
				desc_id = m_goth_torso_strait
				chosen_materials = {
					material1 = carblack_1
					material2 = carblack_3
				}
			}
			cas_male_legs = {
				desc_id = m_rock_legs_ozzypants
			}
			cas_male_shoes = {
				desc_id = m_spnr_shoe_conversecs
				chosen_materials = {
					material1 = grey_1
				}
			}
			cas_male_acc_left = {
				desc_id = m_punk_accl_jny_2
			}
			cas_male_acc_right = {
				desc_id = m_clsc_acc_rrings
			}
			cas_male_acc_face = {
				desc_id = None
			}
			cas_guitar_body = {
				desc_id = gtr9_esp_ax
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr9_esp_ax_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_esp_eclipse_ld_11`
								flags = 4
								Color = red_1
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
						pre_layer = [
							{
								Color = grey_5
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_neckhead_ld_11`
								flags = 36
								Color = red_1
							}
						]
					}
				]
			}
			cas_guitar_pickguards = {
				desc_id = None
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
				desc_id = None
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
								Color = red_1
							}
							{
								texture = `tex/models/characters/layers/cab/esp/bass17_esp_ax_dtl_04`
								flags = 4
								Color = black_1guitar
							}
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/esp/bass17_esp_ax_dtl_16`
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
								texture = `tex/models/characters/layers/cab/esp/bass_fretboard_24_inlay_05`
								flags = 4
								Color = grey_5guitar
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
								texture = `tex/models/characters/layers/cab/esp/bass9_neckhead3_ld_01`
								flags = 36
								Color = red_1
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = None
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
				desc_id = None
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
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_04`
								Color = red_1
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
				desc_id = mic_stand_metal
			}
		}
	}
	{
		Name = gh_rocker_2009_1_003
		fullname = qs(0xd7987da6)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x37e0ccd3)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = goth
			cas_body = {
				desc_id = gh4_car_female
			}
			cas_eyes = {
				desc_id = car_hazel_eyes
			}
			cas_female_eyebrows = {
				desc_id = car_default_brow
			}
			cas_female_hair = {
				desc_id = f_goth_hair_2tone
			}
			cas_female_hat = {
				desc_id = None
			}
			cas_female_facial_hair = {
				desc_id = None
			}
			cas_female_torso = {
				desc_id = f_metl_torso_acid
				chosen_materials = {
					material1 = grey_1
					material2 = grey_5
					material3 = red_3
					material4 = red_3
				}
			}
			cas_female_legs = {
				desc_id = f_metl_legs_strapped
			}
			cas_female_shoes = {
				desc_id = f_metl_shoe_ltrring
			}
			cas_female_acc_left = {
				desc_id = f_rock_acc_lchainstud
			}
			cas_female_acc_right = {
				desc_id = None
			}
			cas_female_acc_face = {
				desc_id = None
			}
			cas_guitar_body = {
				desc_id = gtr9_esp_ax
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr9_esp_ax_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_esp_eclipse_ld_11`
								flags = 4
								Color = red_1
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
						pre_layer = [
							{
								Color = grey_5
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_neckhead_ld_11`
								flags = 36
								Color = red_1
							}
						]
					}
				]
			}
			cas_guitar_pickguards = {
				desc_id = None
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
				desc_id = None
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
								Color = red_1
							}
							{
								texture = `tex/models/characters/layers/cab/esp/bass17_esp_ax_dtl_04`
								flags = 4
								Color = black_1guitar
							}
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/esp/bass17_esp_ax_dtl_16`
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
								texture = `tex/models/characters/layers/cab/esp/bass_fretboard_24_inlay_05`
								flags = 4
								Color = grey_5guitar
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
								texture = `tex/models/characters/layers/cab/esp/bass9_neckhead3_ld_01`
								flags = 36
								Color = red_1
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = None
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
				desc_id = None
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
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_tamashell_ld07`
								flags = 32
								Color = teal_3
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
		Name = gh_rocker_20092_1_001
		fullname = qs(0x3590a3ea)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x89ddc7af)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = `black	metal`
			cas_body = {
				desc_id = gh4_car_male
			}
			cas_eyes = {
				desc_id = car_brown_eyes
			}
			cas_male_eyebrows = {
				desc_id = car_angled
			}
			cas_male_hair = {
				desc_id = m_bmtl_hair_dread
			}
			cas_male_hat = {
				desc_id = None
			}
			cas_male_facial_hair = {
				desc_id = None
			}
			cas_male_torso = {
				desc_id = m_fun_torso_cyborg
			}
			cas_male_legs = {
				desc_id = m_glam_legs_chaps
				chosen_materials = {
					material2 = teal_4
				}
			}
			cas_male_shoes = {
				desc_id = m_bmtl_shoes_combat
			}
			cas_male_acc_left = {
				desc_id = m_rock_acc_lstrap
			}
			cas_male_acc_right = {
				desc_id = None
			}
			cas_male_acc_face = {
				desc_id = m_goth_glasses_ggls
				chosen_materials = {
					material1 = carblack_1
				}
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
								Color = grey_5
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
			cas_bass_body = {
				desc_id = bass15_mcswain_machine
			}
			cas_bass_neck = {
				desc_id = bass_mcswain_fboard22d
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_05`
						pre_layer = [
							{
								Color = grey_5guitar
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/mcswain/bass15_nkhd_mcswain_ld1`
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
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_04`
								Color = red_1
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
				desc_id = `classic	rock`
			}
			cas_mic_stand = {
				desc_id = rock
			}
		}
	}
	{
		Name = gh_rocker_20092_1_002
		fullname = qs(0x1ebdf029)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x37c7ab39)
		2
		no_random_pick
		selection_not_allowed
		appearance = {
			cas_body = {
				desc_id = gh4_car_female
			}
			cas_eyes = {
				desc_id = car_brown_eyes
			}
			cas_female_eyebrows = {
				desc_id = car_default_thick_brow
			}
			cas_female_hair = {
				desc_id = f_goth_hair_dreads
			}
			cas_female_hat = {
				desc_id = None
			}
			cas_female_facial_hair = {
				desc_id = None
			}
			cas_female_torso = {
				desc_id = f_goth_torso_pndrstraps
				chosen_materials = {
					material1 = carblack_3
					material2 = grey_1
					material3 = teal_4
				}
			}
			cas_female_legs = {
				desc_id = f_metl_legs_strappednoleg
				chosen_materials = {
					material1 = carblack_3
				}
			}
			cas_female_shoes = {
				desc_id = f_punk_shoe_thickboots
			}
			cas_female_acc_left = {
				desc_id = f_goth_acc_lpndrbuckles
				chosen_materials = {
					material2 = teal_4
				}
			}
			cas_female_acc_right = {
				desc_id = f_goth_acc_rglove
			}
			cas_female_acc_face = {
				desc_id = f_fun_glasses_echo2
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
								Color = grey_5
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
			cas_bass_body = {
				desc_id = bass15_mcswain_machine
			}
			cas_bass_neck = {
				desc_id = bass_mcswain_fboard22d
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_05`
						pre_layer = [
							{
								Color = grey_5guitar
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/mcswain/bass15_nkhd_mcswain_ld1`
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
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_04`
								Color = red_1
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
				desc_id = `classic	rock`
			}
			cas_mic_stand = {
				desc_id = rock
			}
		}
	}
	{
		Name = gh_rocker_20092_1_003
		fullname = qs(0x07a6c168)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x384bd05b)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = goth
			cas_body = {
				desc_id = gh4_car_female
			}
			cas_eyes = {
				desc_id = car_brown_eyes
			}
			cas_female_eyebrows = {
				desc_id = car_angled_thin_brow
			}
			cas_female_hair = {
				desc_id = f_metl_hair_pony
				chosen_materials = {
					material1 = carblack_2
					material2 = grey_5
				}
			}
			cas_female_hat = {
				desc_id = None
			}
			cas_female_facial_hair = {
				desc_id = None
			}
			cas_female_torso = {
				desc_id = f_goth_torso_pndrstraps
				chosen_materials = {
					material2 = grey_1
					material1 = teal_3
					material3 = carblack_1
				}
			}
			cas_female_legs = {
				desc_id = f_goth_legs_cyberstrap
				chosen_materials = {
					material2 = teal_4
				}
			}
			cas_female_shoes = {
				desc_id = f_goth_shoe_cyberb
			}
			cas_female_acc_left = {
				desc_id = f_rock_acc_lcloth
			}
			cas_female_acc_right = {
				desc_id = f_goth_acc_rstrapglove
				chosen_materials = {
					material2 = grey_4
				}
			}
			cas_female_acc_face = {
				desc_id = f_fun_glasses_echo2
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
								Color = grey_5
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
			cas_bass_body = {
				desc_id = bass15_mcswain_machine
			}
			cas_bass_neck = {
				desc_id = bass_mcswain_fboard22d
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_05`
						pre_layer = [
							{
								Color = grey_5guitar
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/mcswain/bass15_nkhd_mcswain_ld1`
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
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_04`
								Color = red_1
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
				desc_id = `classic	rock`
			}
			cas_mic_stand = {
				desc_id = rock
			}
		}
	}
	{
		Name = gh_rocker_axelsteel_band_001
		fullname = qs(0x2320ff3d)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0xcc987257)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = `heavy	metal`
			cas_body = {
				desc_id = gh4_car_male
			}
			cas_male_physique = {
				desc_id = malephysique4
			}
			cas_eyes = {
				desc_id = car_brown_eyes
			}
			cas_male_eyebrows = {
				desc_id = car_angled
			}
			cas_male_hair = {
				desc_id = m_clsc_hair_clive2
				chosen_materials = {
					material1 = yellow_orange_1
				}
			}
			cas_male_hat = {
				desc_id = None
			}
			cas_male_facial_hair = {
				desc_id = m_rock_fhair_stub
			}
			cas_male_torso = {
				desc_id = m_rock_torso_ljacket
				chosen_materials = {
					material2 = grey_4
					material1 = grey_1
				}
			}
			cas_male_legs = {
				desc_id = m_rock_legs_jeans
			}
			cas_male_shoes = {
				desc_id = m_metl_shoe_axel_1
				chosen_materials = {
					material1 = grey_1
				}
			}
			cas_male_acc_left = {
				desc_id = m_punk_acc_lrings
			}
			cas_male_acc_right = {
				desc_id = m_punk_acc_rrings
			}
			cas_male_acc_face = {
				desc_id = None
			}
			cas_guitar_body = {
				desc_id = gtr9_esp_ax
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr9_esp_ax_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_esp_eclipse_ld_11`
								flags = 4
								Color = red_1
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
						pre_layer = [
							{
								Color = grey_5
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_neckhead_ld_11`
								flags = 36
								Color = red_1
							}
						]
					}
				]
			}
			cas_guitar_pickguards = {
				desc_id = None
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
				desc_id = None
			}
			cas_bass_body = {
				desc_id = bas_ibz_sr505
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\ibanez\bs_ibz_sr_body`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_ld03`
								flags = 4
								Color = yellow_orange_1
							}
							{
								texture = `tex/models/characters/layers/cag/all_clear3`
								flags = 4
							}
							{
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_dtl06`
								flags = 4
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = bass_ibz_fretboard_24b
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_02`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/ibanez/bass_ibz24_inlay_63`
								flags = 4
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = bas_ibz_sr_head01
				chosen_materials = {
					material1 = grey_3guitar
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/ibanez/bs_ibz_sr_head`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_hd_dtl08`
								flags = 36
								Color = orange_2
							}
							{
								texture = `tex/models/characters/layers/cag/all_clear3`
								flags = 36
							}
							{
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_hd_dtl09`
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
				desc_id = bas_ibz_pkup002
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bas_brdg_ibz01
				chosen_materials = {
					material1 = grey_3guitar
				}
			}
			cas_bass_knobs = {
				desc_id = knob_knurl02
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_misc = {
				desc_id = None
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
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld31`
								flags = 32
								Color = red_1
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
		Name = gh_rocker_axelsteel_band_002
		fullname = qs(0x080dacfe)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0xe7b52194)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = `heavy	metal`
			cas_body = {
				desc_id = gh4_car_male
			}
			cas_eyes = {
				desc_id = car_brown_eyes
			}
			cas_male_eyebrows = {
				desc_id = car_angled
			}
			cas_male_hair = {
				desc_id = m_metl_hair_axel_1
				chosen_materials = {
					material1 = yellow_orange_1
				}
			}
			cas_male_facial_hair = {
				desc_id = m_rock_fhair_stub
			}
			cas_male_torso = {
				desc_id = m_rock_torso_sleeveless
				chosen_materials = {
					material1 = grey_1
				}
			}
			cas_male_legs = {
				desc_id = m_rock_legs_lockpant
				chosen_materials = {
					material1 = yellow_orange_1
				}
			}
			cas_male_shoes = {
				desc_id = m_rock_shoe_straps
			}
			cas_male_acc_left = {
				desc_id = m_punk_accl_jny_3
				chosen_materials = {
					material1 = carblack_3
				}
			}
			cas_male_acc_right = {
				desc_id = m_punk_acc_rrings
			}
			cas_guitar_body = {
				desc_id = gtr9_esp_ax
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr9_esp_ax_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_esp_eclipse_ld_11`
								flags = 4
								Color = red_1
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
						pre_layer = [
							{
								Color = grey_5
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_neckhead_ld_11`
								flags = 36
								Color = red_1
							}
						]
					}
				]
			}
			cas_guitar_pickguards = {
				desc_id = None
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
				desc_id = None
			}
			cas_bass_body = {
				desc_id = bas_ibz_sr505
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\ibanez\bs_ibz_sr_body`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_ld03`
								flags = 4
								Color = yellow_orange_1
							}
							{
								texture = `tex/models/characters/layers/cag/all_clear3`
								flags = 4
							}
							{
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_dtl06`
								flags = 4
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = bass_ibz_fretboard_24b
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_02`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/ibanez/bass_ibz24_inlay_63`
								flags = 4
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = bas_ibz_sr_head01
				chosen_materials = {
					material1 = grey_3guitar
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/ibanez/bs_ibz_sr_head`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_hd_dtl08`
								flags = 36
								Color = orange_2
							}
							{
								texture = `tex/models/characters/layers/cag/all_clear3`
								flags = 36
							}
							{
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_hd_dtl09`
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
				desc_id = bas_ibz_pkup002
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bas_brdg_ibz01
				chosen_materials = {
					material1 = grey_3guitar
				}
			}
			cas_bass_knobs = {
				desc_id = knob_knurl02
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_misc = {
				desc_id = None
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
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld31`
								flags = 32
								Color = red_1
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
		Name = gh_rocker_axelsteel_band_003
		fullname = qs(0x11169dbf)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0xfeae10d5)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = `heavy	metal`
			cas_body = {
				desc_id = gh4_car_female
			}
			cas_eyes = {
				desc_id = car_brown_eyes
			}
			cas_female_eyebrows = {
				desc_id = car_default_thick_brow
			}
			cas_female_hair = {
				desc_id = f_rock_hair_cbob
				chosen_materials = {
					material1 = carblack_1
				}
			}
			cas_female_torso = {
				desc_id = f_rock_torso_ljacket
			}
			cas_female_legs = {
				desc_id = f_rock_legs_ripjeans
				chosen_materials = {
					material1 = grey_4
				}
			}
			cas_female_shoes = {
				desc_id = f_metl_shoe_platform
			}
			cas_female_acc_left = {
				desc_id = f_punk_acc_lbands
			}
			cas_female_acc_right = {
				desc_id = f_clsc_accs_rbracelet
			}
			cas_female_acc_face = {
				desc_id = None
			}
			cas_guitar_body = {
				desc_id = gtr9_esp_ax
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr9_esp_ax_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_esp_eclipse_ld_11`
								flags = 4
								Color = red_1
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
						pre_layer = [
							{
								Color = grey_5
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_neckhead_ld_11`
								flags = 36
								Color = red_1
							}
						]
					}
				]
			}
			cas_guitar_pickguards = {
				desc_id = None
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
				desc_id = None
			}
			cas_bass_body = {
				desc_id = bas_ibz_sr505
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\ibanez\bs_ibz_sr_body`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_ld03`
								flags = 4
								Color = yellow_orange_1
							}
							{
								texture = `tex/models/characters/layers/cag/all_clear3`
								flags = 4
							}
							{
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_dtl06`
								flags = 4
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = bass_ibz_fretboard_24b
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_02`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/ibanez/bass_ibz24_inlay_63`
								flags = 4
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = bas_ibz_sr_head01
				chosen_materials = {
					material1 = grey_3guitar
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/ibanez/bs_ibz_sr_head`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_hd_dtl08`
								flags = 36
								Color = orange_2
							}
							{
								texture = `tex/models/characters/layers/cag/all_clear3`
								flags = 36
							}
							{
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_hd_dtl09`
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
				desc_id = bas_ibz_pkup002
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bas_brdg_ibz01
				chosen_materials = {
					material1 = grey_3guitar
				}
			}
			cas_bass_knobs = {
				desc_id = knob_knurl02
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_misc = {
				desc_id = None
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
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld31`
								flags = 32
								Color = red_1
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = punk
			}
			cas_mic_stand = {
				desc_id = `classic	rock`
			}
		}
	}
	{
		Name = gh_rocker_axelsteel2_band_001
		fullname = qs(0x66dad947)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x6ac14a4f)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = `heavy	metal`
			cas_body = {
				desc_id = gh4_car_male
			}
			cas_eyes = {
				desc_id = car_blank_eyes
			}
			cas_male_eyebrows = {
				desc_id = car_default_brow
			}
			cas_male_hair = {
				desc_id = m_bmtl_hair_dread
				chosen_materials = {
					material1 = grey_3
				}
			}
			cas_male_hat = {
				desc_id = None
			}
			cas_male_facial_hair = {
				desc_id = None
			}
			cas_male_torso = {
				desc_id = m_fun_torso_spike
			}
			cas_male_legs = {
				desc_id = m_goth_legs_skirted
			}
			cas_male_shoes = {
				desc_id = m_goth_shoe_belts
			}
			cas_male_acc_left = {
				desc_id = m_punk_accl_jny_3
			}
			cas_male_acc_right = {
				desc_id = m_clsc_accs_rdrkbnd
			}
			cas_male_acc_face = {
				desc_id = None
			}
			cas_full_guitar = {
				desc_id = gtr150_nvsft_axel
			}
			cas_bass_body = {
				desc_id = bass9_esp_ax_01
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\esp\bass9_esp_ax_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/esp/bass9_esp_ax_ld_01`
								Color = black_1guitar
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
			cas_bass_neck = {
				desc_id = bass_fretboard_22d
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_05`
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
				chosen_materials = {
					material1 = black_1guitar
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass9_neckhead_d`
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
				desc_id = None
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
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld31`
								flags = 32
								Color = red_1
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
				desc_id = mic_stand_metal
			}
		}
	}
	{
		Name = gh_rocker_axelsteel2_band_002
		fullname = qs(0x4df78a84)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x41ec198c)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = `heavy	metal`
			cas_body = {
				desc_id = gh4_car_male
			}
			cas_eyes = {
				desc_id = car_blank_eyes
			}
			cas_male_eyebrows = {
				desc_id = car_default_brow
			}
			cas_male_hair = {
				desc_id = m_bmtl_hair_dread
				chosen_materials = {
					material1 = grey_3
				}
			}
			cas_male_hat = {
				desc_id = None
			}
			cas_male_facial_hair = {
				desc_id = None
			}
			cas_male_torso = {
				desc_id = m_fun_torso_spike
			}
			cas_male_legs = {
				desc_id = m_bmtl_legs_lars_3
			}
			cas_male_shoes = {
				desc_id = m_goth_shoe_belts
			}
			cas_male_acc_left = {
				desc_id = m_punk_accl_jny_3
			}
			cas_male_acc_right = {
				desc_id = m_clsc_accs_rdrkbnd
			}
			cas_male_acc_face = {
				desc_id = None
			}
			cas_full_guitar = {
				desc_id = gtr150_nvsft_axel
			}
			cas_bass_body = {
				desc_id = bass9_esp_ax_01
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\esp\bass9_esp_ax_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/esp/bass9_esp_ax_ld_01`
								Color = black_1guitar
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
			cas_bass_neck = {
				desc_id = bass_fretboard_22d
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_05`
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
				chosen_materials = {
					material1 = black_1guitar
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass9_neckhead_d`
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
				desc_id = None
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
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld31`
								flags = 32
								Color = red_1
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
				desc_id = mic_stand_metal
			}
		}
	}
	{
		Name = gh_rocker_axelsteel2_band_003
		fullname = qs(0x54ecbbc5)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x58f728cd)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = `heavy	metal`
			cas_body = {
				desc_id = gh4_car_female
			}
			cas_eyes = {
				desc_id = car_blank_eyes
			}
			cas_female_eyebrows = {
				desc_id = car_default_thick_brow
			}
			cas_female_hair = {
				desc_id = f_bmtl_hair_straight
				chosen_materials = {
					material1 = grey_2
				}
			}
			cas_female_torso = {
				desc_id = f_fun_torso_band
				chosen_materials = {
					material1 = grey_5
					material2 = carblack_3
				}
			}
			cas_female_legs = {
				desc_id = f_bmtl_legs_stichbelt
			}
			cas_female_shoes = {
				desc_id = f_goth_shoe_witchb
			}
			cas_female_acc_left = {
				desc_id = f_rock_acc_lcloth
				chosen_materials = {
					material1 = grey_4
				}
			}
			cas_female_acc_right = {
				desc_id = f_rock_acc_rstrap
				chosen_materials = {
					material1 = carblack_3
				}
			}
			cas_full_guitar = {
				desc_id = gtr150_nvsft_axel
			}
			cas_bass_body = {
				desc_id = bass9_esp_ax_01
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\esp\bass9_esp_ax_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/esp/bass9_esp_ax_ld_01`
								Color = black_1guitar
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
			cas_bass_neck = {
				desc_id = bass_fretboard_22d
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_05`
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
				chosen_materials = {
					material1 = black_1guitar
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass9_neckhead_d`
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
				desc_id = None
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
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld31`
								flags = 32
								Color = red_1
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
				desc_id = mic_stand_metal
			}
		}
	}
	{
		Name = gh_rocker_larsumlaut_band_001
		fullname = qs(0x6c816cb5)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x609affbd)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = `heavy	metal`
			cas_body = {
				desc_id = gh4_car_female
			}
			cas_eyes = {
				desc_id = car_blue_eyes
			}
			cas_female_eyebrows = {
				desc_id = car_angled_thin_brow
			}
			cas_female_hair = {
				desc_id = f_goth_hair_2tone
				chosen_materials = {
					material1 = carblack_1
					material2 = yellow_4
				}
			}
			cas_female_torso = {
				desc_id = f_bmtl_torso_bikini
				chosen_materials = {
					material1 = grey_1
				}
			}
			cas_female_legs = {
				desc_id = f_bmtl_legs_ringskirt
				chosen_materials = {
					material1 = yellow_orange_4
				}
			}
			cas_female_shoes = {
				desc_id = f_goth_shoe_pndrspike
			}
			cas_female_acc_left = {
				desc_id = None
			}
			cas_female_acc_right = {
				desc_id = None
			}
			cas_guitar_body = {
				desc_id = gtr9_esp_ax
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr9_esp_ax_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_esp_eclipse_ld_11`
								flags = 4
								Color = red_1
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
						pre_layer = [
							{
								Color = grey_5
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_neckhead_ld_11`
								flags = 36
								Color = red_1
							}
						]
					}
				]
			}
			cas_guitar_pickguards = {
				desc_id = None
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
				desc_id = None
			}
			cas_bass_body = {
				desc_id = bass64_f405
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\esp\bass64_f405_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/esp/bass64_f405_ld_03`
								Color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cab/esp/bass64_f405_dtl_12`
								Color = red_2
								flags = 4
								a = 10
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
								Color = grey_4
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
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/esp/bass64_neckhead_ld_07`
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
				desc_id = None
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
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld31`
								flags = 32
								Color = red_1
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = punk
			}
			cas_mic_stand = {
				desc_id = `classic	rock`
			}
		}
	}
	{
		Name = gh_rocker_larsumlaut_band_002
		fullname = qs(0x47ac3f76)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x4bb7ac7e)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = `heavy	metal`
			cas_body = {
				desc_id = gh4_car_male
			}
			cas_eyes = {
				desc_id = car_deepblue_eyes
			}
			cas_male_eyebrows = {
				desc_id = car_default_brow
			}
			cas_male_hair = {
				desc_id = m_bmtl_hair_straight
			}
			cas_male_hat = {
				desc_id = None
			}
			cas_male_facial_hair = {
				desc_id = None
			}
			cas_male_torso = {
				desc_id = m_bmtl_torso_lars_2
			}
			cas_male_legs = {
				desc_id = m_bmtl_legs_netpants
			}
			cas_male_shoes = {
				desc_id = m_bmtl_shoes_combat
			}
			cas_male_acc_left = {
				desc_id = None
			}
			cas_male_acc_right = {
				desc_id = m_bmtl_acc_rwristguard
			}
			cas_male_acc_face = {
				desc_id = None
			}
			cas_guitar_body = {
				desc_id = gtr9_esp_ax
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr9_esp_ax_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_esp_eclipse_ld_11`
								flags = 4
								Color = red_1
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
						pre_layer = [
							{
								Color = grey_5
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_neckhead_ld_11`
								flags = 36
								Color = red_1
							}
						]
					}
				]
			}
			cas_guitar_pickguards = {
				desc_id = None
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
				desc_id = None
			}
			cas_bass_body = {
				desc_id = bass64_f405
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\esp\bass64_f405_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/esp/bass64_f405_ld_03`
								Color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cab/esp/bass64_f405_dtl_12`
								Color = red_2
								flags = 4
								a = 10
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
								Color = grey_4
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
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/esp/bass64_neckhead_ld_07`
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
				desc_id = None
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
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld31`
								flags = 32
								Color = red_1
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
		Name = gh_rocker_larsumlaut_band_003
		fullname = qs(0x5eb70e37)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x52ac9d3f)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = black_metal
			cas_body = {
				desc_id = gh4_car_male
			}
			cas_eyes = {
				desc_id = car_deepblue_eyes
			}
			cas_male_eyebrows = {
				desc_id = car_default_brow
			}
			cas_male_hair = {
				desc_id = m_metl_hair_axel_1
				chosen_materials = {
					material1 = carblack_1
				}
			}
			cas_male_hat = {
				desc_id = None
			}
			cas_male_facial_hair = {
				desc_id = None
			}
			cas_male_torso = {
				desc_id = m_bmtl_torso_lars_3
			}
			cas_male_legs = {
				desc_id = m_bmtl_legs_lars
			}
			cas_male_shoes = {
				desc_id = m_rock_shoe_straps
			}
			cas_male_acc_left = {
				desc_id = m_punk_accl_jny_3
			}
			cas_male_acc_right = {
				desc_id = m_clsc_accs_rdrkbnd
			}
			cas_male_acc_face = {
				desc_id = None
			}
			cas_guitar_body = {
				desc_id = gtr9_esp_ax
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr9_esp_ax_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_esp_eclipse_ld_11`
								flags = 4
								Color = red_1
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
						pre_layer = [
							{
								Color = grey_5
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_neckhead_ld_11`
								flags = 36
								Color = red_1
							}
						]
					}
				]
			}
			cas_guitar_pickguards = {
				desc_id = None
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
				desc_id = None
			}
			cas_bass_body = {
				desc_id = bass64_f405
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\esp\bass64_f405_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/esp/bass64_f405_ld_03`
								Color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cab/esp/bass64_f405_dtl_12`
								Color = red_2
								flags = 4
								a = 10
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
								Color = grey_4
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
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/esp/bass64_neckhead_ld_07`
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
				desc_id = None
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
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_04`
								flags = 32
								Color = black_1guitar
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
		Name = gh_rocker_larsumlaut2_band_001
		fullname = qs(0xfc86465b)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x5d5902b6)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = `heavy	metal`
			cas_body = {
				desc_id = gh4_car_female
			}
			cas_eyes = {
				desc_id = car_brown_eyes
			}
			cas_female_eyebrows = {
				desc_id = car_default_thick_brow
			}
			cas_female_hair = {
				desc_id = f_bmtl_hair_overeyes
			}
			cas_female_hat = {
				desc_id = None
			}
			cas_female_facial_hair = {
				desc_id = None
			}
			cas_female_torso = {
				desc_id = f_bmtl_torso_spikeshirt
				chosen_materials = {
					material1 = carblack_1
					material2 = yellow_orange_2
				}
			}
			cas_female_legs = {
				desc_id = f_goth_legs_halfstrap
				chosen_materials = {
					material1 = yellow_orange_2
				}
			}
			cas_female_shoes = {
				desc_id = f_metl_shoe_mocboot
			}
			cas_female_acc_left = {
				desc_id = f_punk_acc_lspike
			}
			cas_female_acc_right = {
				desc_id = f_bmtl_acc_rwristguard
			}
			cas_female_acc_face = {
				desc_id = None
			}
			cas_full_guitar = {
				desc_id = gtr139_battleaxe
			}
			cas_bass_body = {
				desc_id = bass9_esp_ax_01
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\esp\bass9_esp_ax_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/esp/bass9_esp_ax_ld_01`
								Color = black_1guitar
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
				chosen_materials = {
					material1 = black_1guitar
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass9_neckhead_d`
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
				desc_id = None
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
				desc_id = mic_stand_blackmetal
			}
		}
	}
	{
		Name = gh_rocker_larsumlaut2_band_002
		fullname = qs(0xd7ab1598)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x76745175)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = `heavy	metal`
			cas_body = {
				desc_id = gh4_car_male
			}
			cas_eyes = {
				desc_id = car_deepblue_eyes
			}
			cas_male_eyebrows = {
				desc_id = car_default_brow
			}
			cas_male_hair = {
				desc_id = m_pop_hair_pomp
				chosen_materials = {
					material1 = brown_2
				}
			}
			cas_male_hat_hair = {
				desc_id = None
			}
			cas_male_hat = {
				desc_id = m_fun_hat_xhood
			}
			cas_male_facial_hair = {
				desc_id = None
			}
			cas_male_torso = {
				desc_id = m_bmtl_torso_lars_2
			}
			cas_male_legs = {
				desc_id = m_bmtl_legs_lars_3
				chosen_materials = {
					material1 = yellow_orange_1
				}
			}
			cas_male_shoes = {
				desc_id = m_bmtl_shoes_combat
			}
			cas_male_acc_left = {
				desc_id = m_goth_acc_lstrait
				chosen_materials = {
					material1 = yellow_orange_2
				}
			}
			cas_male_acc_right = {
				desc_id = m_mtl_accr_axel4
			}
			cas_male_acc_face = {
				desc_id = None
			}
			cas_full_guitar = {
				desc_id = gtr139_battleaxe
			}
			cas_bass_body = {
				desc_id = bass9_esp_ax_01
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\esp\bass9_esp_ax_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/esp/bass9_esp_ax_ld_01`
								Color = black_1guitar
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
				chosen_materials = {
					material1 = black_1guitar
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass9_neckhead_d`
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
				desc_id = None
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
				desc_id = mic_stand_blackmetal
			}
		}
	}
	{
		Name = gh_rocker_larsumlaut2_band_003
		fullname = qs(0xceb024d9)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x6f6f6034)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = black_metal
			cas_body = {
				desc_id = gh4_car_male
			}
			cas_eyes = {
				desc_id = car_deepblue_eyes
			}
			cas_male_eyebrows = {
				desc_id = car_default_brow
			}
			cas_male_hair = {
				desc_id = m_pop_hair_pomp
				chosen_materials = {
					material1 = brown_2
				}
			}
			cas_male_hat_hair = {
				desc_id = None
			}
			cas_male_hat = {
				desc_id = m_fun_hat_xhood
			}
			cas_male_facial_hair = {
				desc_id = None
			}
			cas_male_torso = {
				desc_id = m_metl_torso_straps
			}
			cas_male_legs = {
				desc_id = m_bmtl_legs_lars_3
				chosen_materials = {
					material1 = yellow_orange_1
				}
			}
			cas_male_shoes = {
				desc_id = m_bmtl_shoes_combat
			}
			cas_male_acc_left = {
				desc_id = m_goth_acc_lstrait
				chosen_materials = {
					material1 = yellow_orange_2
				}
			}
			cas_male_acc_right = {
				desc_id = m_mtl_accr_axel4
			}
			cas_male_acc_face = {
				desc_id = None
			}
			cas_full_guitar = {
				desc_id = gtr139_battleaxe
			}
			cas_bass_body = {
				desc_id = bass9_esp_ax_01
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\esp\bass9_esp_ax_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/esp/bass9_esp_ax_ld_01`
								Color = black_1guitar
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
				chosen_materials = {
					material1 = black_1guitar
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass9_neckhead_d`
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
				desc_id = None
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
				desc_id = mic_stand_blackmetal
			}
		}
	}
	{
		Name = gh_rocker_johnnynapalm_band_001
		fullname = qs(0x1451da6e)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x8e307399)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = punk
			cas_body = {
				desc_id = gh4_car_male
			}
			cas_male_physique = {
				desc_id = malephysique1
			}
			cas_eyes = {
				desc_id = car_deepblue_eyes
			}
			cas_male_eyebrows = {
				desc_id = car_angled
			}
			cas_male_hair = {
				desc_id = None
			}
			cas_male_hat = {
				desc_id = None
			}
			cas_male_facial_hair = {
				desc_id = None
			}
			cas_male_torso = {
				desc_id = m_punk_torso_beater
				chosen_materials = {
					material1 = grey_1
				}
			}
			cas_male_legs = {
				desc_id = m_punk_legs_johnny1_04
			}
			cas_male_shoes = {
				desc_id = m_punk_shoes_johnny2
			}
			cas_male_acc_left = {
				desc_id = m_punk_acc_lrings
			}
			cas_male_acc_right = {
				desc_id = m_rock_acc_rstripe
			}
			cas_male_acc_face = {
				desc_id = None
			}
			cas_guitar_body = {
				desc_id = gtr9_esp_ax
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr9_esp_ax_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_esp_eclipse_ld_11`
								flags = 4
								Color = red_1
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
						pre_layer = [
							{
								Color = grey_5
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_neckhead_ld_11`
								flags = 36
								Color = red_1
							}
						]
					}
				]
			}
			cas_guitar_pickguards = {
				desc_id = None
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
				desc_id = None
			}
			cas_bass_body = {
				desc_id = bass14_esp_surveyor
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\esp\bass14_esp_surveyor_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/esp/bass14_esp_ax_ld_01`
								Color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cab/esp/bass14_esp_ax_dtl_6b`
								flags = 4
								Color = red_1
							}
							{
								texture = `tex/models/characters/layers/cab/esp/bass14_esp_ax_dtl_6a`
								flags = 4
								Color = red_orange_1
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/esp/bass_fretboard_inlay_05`
								flags = 4
								Color = black_1guitar
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
								texture = `tex/models/characters/layers/cab/esp/bass9_neckhead4_dtl_06`
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
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								Color = yellow_2guitar
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld16`
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
		Name = gh_rocker_johnnynapalm_band_002
		fullname = qs(0x3f7c89ad)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0xa51d205a)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = punk
			cas_body = {
				desc_id = gh4_car_male
			}
			cas_male_physique = {
				desc_id = malephysique1
				bones = {
					height = -1.0
				}
			}
			cas_eyes = {
				desc_id = car_brown_eyes
			}
			cas_male_eyebrows = {
				desc_id = car_angled
			}
			cas_male_hair = {
				desc_id = m_punk_hair_lspike
				chosen_materials = {
					material1 = blue_1
				}
			}
			cas_male_hat = {
				desc_id = None
			}
			cas_male_facial_hair = {
				desc_id = m_rock_fhair_stub
			}
			cas_male_torso = {
				desc_id = shirtless
				chosen_materials = {
					material1 = yellow_4
					material2 = grey_5
				}
			}
			cas_male_legs = {
				desc_id = m_punk_legs_jny_2
				chosen_materials = {
					material1 = grey_1
					material2 = blue_2
				}
			}
			cas_male_shoes = {
				desc_id = m_punk_shoe_buckleb
			}
			cas_male_acc_left = {
				desc_id = m_punk_acc_lleather
			}
			cas_male_acc_right = {
				desc_id = m_punk_acc_rleather
			}
			cas_male_acc_face = {
				desc_id = None
			}
			cas_guitar_body = {
				desc_id = gtr9_esp_ax
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr9_esp_ax_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_esp_eclipse_ld_11`
								flags = 4
								Color = red_1
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
						pre_layer = [
							{
								Color = grey_5
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_neckhead_ld_11`
								flags = 36
								Color = red_1
							}
						]
					}
				]
			}
			cas_guitar_pickguards = {
				desc_id = None
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
				desc_id = None
			}
			cas_bass_body = {
				desc_id = bass14_esp_surveyor
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\esp\bass14_esp_surveyor_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/esp/bass14_esp_ax_ld_01`
								Color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cab/esp/bass14_esp_ax_dtl_6b`
								flags = 4
								Color = red_1
							}
							{
								texture = `tex/models/characters/layers/cab/esp/bass14_esp_ax_dtl_6a`
								flags = 4
								Color = red_orange_1
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/esp/bass_fretboard_inlay_05`
								flags = 4
								Color = black_1guitar
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
								texture = `tex/models/characters/layers/cab/esp/bass9_neckhead4_dtl_06`
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
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								Color = yellow_2guitar
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld16`
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
		Name = gh_rocker_johnnynapalm_band_003
		fullname = qs(0x2667b8ec)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0xbc06111b)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = punk
			cas_body = {
				desc_id = gh4_car_female
			}
			cas_female_physique = {
				desc_id = femalephysique1
			}
			cas_eyes = {
				desc_id = car_deepblue_eyes
			}
			cas_female_eyebrows = {
				desc_id = car_angled_thin_brow
			}
			cas_female_hair = {
				desc_id = f_punk_hair_downhawk
				chosen_materials = {
					material1 = yellow_5
				}
			}
			cas_female_hat = {
				desc_id = None
			}
			cas_female_facial_hair = {
				desc_id = None
			}
			cas_female_torso = {
				desc_id = f_punk_torso_stripe
				chosen_materials = {
					material1 = blue_5
					material2 = red_1
				}
			}
			cas_female_legs = {
				desc_id = f_punk_legs_shorts_03
			}
			cas_female_shoes = {
				desc_id = f_punk_shoes_judy01
				chosen_materials = {
					material1 = red_1
				}
			}
			cas_female_acc_left = {
				desc_id = f_rock_acc_lchainstud
			}
			cas_female_acc_right = {
				desc_id = f_punk_acc_rbands
			}
			cas_female_acc_face = {
				desc_id = None
			}
			cas_guitar_body = {
				desc_id = gtr9_esp_ax
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr9_esp_ax_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_esp_eclipse_ld_11`
								flags = 4
								Color = red_1
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
						pre_layer = [
							{
								Color = grey_5
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_neckhead_ld_11`
								flags = 36
								Color = red_1
							}
						]
					}
				]
			}
			cas_guitar_pickguards = {
				desc_id = None
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
				desc_id = None
			}
			cas_bass_body = {
				desc_id = bass14_esp_surveyor
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\esp\bass14_esp_surveyor_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/esp/bass14_esp_ax_ld_01`
								Color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cab/esp/bass14_esp_ax_dtl_6b`
								flags = 4
								Color = red_1
							}
							{
								texture = `tex/models/characters/layers/cab/esp/bass14_esp_ax_dtl_6a`
								flags = 4
								Color = red_orange_1
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/esp/bass_fretboard_inlay_05`
								flags = 4
								Color = black_1guitar
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
								texture = `tex/models/characters/layers/cab/esp/bass9_neckhead4_dtl_06`
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
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_sponsors_tama_01`
								y_trans = 42
								flags = 3
								x_scale = 36
								y_scale = 36
							}
						]
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh6_skins_ld08`
								flags = 4
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								Color = yellow_2guitar
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld16`
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
				desc_id = punk
			}
			cas_mic_stand = {
				desc_id = twisted
			}
		}
	}
	{
		Name = gh_rocker_johnnynapalm2_band_001
		fullname = qs(0xce4b34b2)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x3abcc2e5)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = punk
			cas_body = {
				desc_id = gh4_car_male
			}
			cas_eyes = {
				desc_id = car_fire_eyes
			}
			cas_male_eyebrows = {
				desc_id = car_vulcan
			}
			cas_male_hair = {
				desc_id = m_punk_hair_lspike
			}
			cas_male_facial_hair = {
				desc_id = m_bmtl_fhair_beard
				chosen_materials = {
					material1 = grey_4guitar
				}
			}
			cas_male_torso = {
				desc_id = m_fun_torso_band
			}
			cas_male_legs = {
				desc_id = m_punk_legs_johnny1_03
			}
			cas_male_shoes = {
				desc_id = m_rock_shoe_straps
			}
			cas_male_acc_left = {
				desc_id = m_glam_accl_glovescarf
			}
			cas_male_acc_right = {
				desc_id = m_glam_accr_glovescarf
			}
			cas_full_guitar = {
				desc_id = gtr135b_johnny
			}
			cas_bass_body = {
				desc_id = bass63_ex
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\esp\bass63_ex_d`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/esp/bass63_ex_ld_01`
								flags = 4
							}
							{
								texture = `tex/models/characters/layers/cab/esp/bass63_ex_dtl_12`
								Color = red_1
								flags = 4
								a = 65
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
								Color = grey_4
								texture = `tex/models/characters/layers/cab/esp/bass_fretboard_inlay_05`
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
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/esp/bass63_neckhead_ld_01`
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
				desc_id = None
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
								Color = grey_5guitar
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
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = punk
			}
			cas_mic_stand = {
				desc_id = twisted
			}
		}
	}
	{
		Name = gh_rocker_johnnynapalm2_band_002
		fullname = qs(0x97656725)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x63929172)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = punk
			cas_body = {
				desc_id = gh4_car_male
			}
			cas_eyes = {
				desc_id = car_fire_eyes
			}
			cas_male_eyebrows = {
				desc_id = car_angled
			}
			cas_male_hair = {
				desc_id = m_punk_hair_j4spike
				chosen_materials = {
					material1 = grey_3
				}
			}
			cas_male_hat = {
				desc_id = None
			}
			cas_male_facial_hair = {
				desc_id = None
			}
			cas_male_torso = {
				desc_id = m_fun_torso_band
			}
			cas_male_legs = {
				desc_id = m_punk_legs_johnny1_03
			}
			cas_male_shoes = {
				desc_id = m_punk_shoe_combat
			}
			cas_male_acc_left = {
				desc_id = m_bmtl_acc_llars
			}
			cas_male_acc_right = {
				desc_id = m_punk_acc_rbands
			}
			cas_male_acc_face = {
				desc_id = None
			}
			cas_full_guitar = {
				desc_id = gtr135b_johnny
			}
			cas_bass_body = {
				desc_id = bass63_ex
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\esp\bass63_ex_d`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/esp/bass63_ex_ld_01`
								flags = 4
							}
							{
								texture = `tex/models/characters/layers/cab/esp/bass63_ex_dtl_12`
								Color = red_1
								flags = 4
								a = 65
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
								Color = grey_4
								texture = `tex/models/characters/layers/cab/esp/bass_fretboard_inlay_05`
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
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/esp/bass63_neckhead_ld_01`
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
				desc_id = None
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
								Color = grey_5guitar
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
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = punk
			}
			cas_mic_stand = {
				desc_id = twisted
			}
		}
	}
	{
		Name = gh_rocker_johnnynapalm2_band_003
		fullname = qs(0x8e7e5664)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x7a89a033)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = punk
			cas_body = {
				desc_id = gh4_car_female
			}
			cas_eyes = {
				desc_id = car_fire_eyes
			}
			cas_female_eyebrows = {
				desc_id = car_default_brow
			}
			cas_female_hair = {
				desc_id = f_punk_hair_hawk
				chosen_materials = {
					material1 = grey_3
				}
			}
			cas_female_hat = {
				desc_id = None
			}
			cas_female_facial_hair = {
				desc_id = None
			}
			cas_female_torso = {
				desc_id = f_punk_torso_leather
			}
			cas_female_legs = {
				desc_id = f_punk_legs_skirt
				chosen_materials = {
					material2 = red_2
					material1 = carblack_1
				}
			}
			cas_female_shoes = {
				desc_id = f_metl_shoe_ltrring
			}
			cas_female_acc_left = {
				desc_id = f_rock_acc_lcloth
			}
			cas_female_acc_right = {
				desc_id = f_punk_acc_rglvwatch
			}
			cas_female_acc_face = {
				desc_id = None
			}
			cas_full_guitar = {
				desc_id = gtr135b_johnny
			}
			cas_bass_body = {
				desc_id = bass63_ex
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\esp\bass63_ex_d`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/esp/bass63_ex_ld_01`
								flags = 4
							}
							{
								texture = `tex/models/characters/layers/cab/esp/bass63_ex_dtl_12`
								Color = red_1
								flags = 4
								a = 65
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
								Color = grey_4
								texture = `tex/models/characters/layers/cab/esp/bass_fretboard_inlay_05`
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
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/esp/bass63_neckhead_ld_01`
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
				desc_id = None
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
								Color = grey_5guitar
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
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = punk
			}
			cas_mic_stand = {
				desc_id = twisted
			}
		}
	}
	{
		Name = gh_rocker_2009_male_band_001
		fullname = qs(0x0b966a52)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0xe42ee738)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = punk
			cas_body = {
				desc_id = gh4_car_female
			}
			cas_female_physique = {
				desc_id = femalephysique1
			}
			cas_eyes = {
				desc_id = car_blue_eyes
			}
			cas_female_eyebrows = {
				desc_id = car_rounded_brow
			}
			cas_female_hair = {
				desc_id = f_bmtl_hair_straight
				chosen_materials = {
					material1 = grey_3
				}
			}
			cas_female_hat_hair = {
				desc_id = f_bmtl_hathair_straight
				chosen_materials = {
					material1 = carblack_2
				}
			}
			cas_female_hat = {
				desc_id = f_rock_hat_cowboy
				chosen_materials = {
					material1 = carblack_1
					material2 = carblack_1
				}
			}
			cas_female_facial_hair = {
				desc_id = None
			}
			cas_female_torso = {
				desc_id = f_metl_torso_vest01
				chosen_materials = {
					material1 = None
				}
			}
			cas_female_legs = {
				desc_id = f_rock_legs_ecchaps
				chosen_materials = {
					material1 = carblack_1
					material2 = carblack_1
				}
			}
			cas_female_shoes = {
				desc_id = f_glam_shoes_velvetbaggyboots
			}
			cas_female_acc_left = {
				desc_id = f_metl_acc_ljewlgnlt
			}
			cas_female_acc_right = {
				desc_id = f_metl_acc_rjewlgnlt
			}
			cas_female_acc_face = {
				desc_id = None
			}
			cas_guitar_body = {
				desc_id = gtr9_esp_ax
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr9_esp_ax_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_esp_eclipse_ld_11`
								flags = 4
								Color = red_1
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
						pre_layer = [
							{
								Color = grey_5
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_neckhead_ld_11`
								flags = 36
								Color = red_1
							}
						]
					}
				]
			}
			cas_guitar_pickguards = {
				desc_id = None
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
				desc_id = None
			}
			cas_bass_body = {
				desc_id = bs_sch_t_body
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\schecter\bs_sch_modelt`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_dtl04`
								flags = 4
								Color = red_1
							}
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_ld05`
								flags = 4
								Color = black_1guitar
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
				desc_id = bass_sch_fretboard_22b
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_03`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch22_inl_ld37`
								flags = 36
								Color = black_1guitar
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = bs_sch_t_nhead
				chosen_materials = {
					material1 = black_1guitar
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/schecter/bass_neckhead_mt`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_hd_dtl06`
								flags = 36
							}
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_hd_dtl09`
								flags = 36
								Color = red_1
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = bs_sch_t_pga
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/schecter/bs_sch_modelt_pga`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_t_pga_ld01`
								flags = 4
							}
						]
					}
				]
			}
			cas_bass_pickups = {
				desc_id = bass_emgpickup3b
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bas_brdg_sch_t
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_knobs = {
				desc_id = knob_knurl02
			}
			cas_bass_misc = {
				desc_id = None
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
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_04`
								Color = red_1
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
				desc_id = `glam	rock`
			}
			cas_mic_stand = {
				desc_id = `classic	rock`
			}
		}
	}
	{
		Name = gh_rocker_2009_male_band_002
		fullname = qs(0x20bb3991)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0xcf03b4fb)
		no_random_pick
		selection_not_allowed
		appearance = {
			cas_body = {
				desc_id = gh4_car_male
			}
			cas_eyes = {
				desc_id = car_brown_eyes
			}
			cas_male_eyebrows = {
				desc_id = car_rounded
			}
			cas_male_hair = {
				desc_id = m_bmtl_hair_dread
			}
			cas_male_hat = {
				desc_id = None
			}
			cas_male_facial_hair = {
				desc_id = None
			}
			cas_male_torso = {
				desc_id = m_rock_torso_ozzycoat
				chosen_materials = {
					material1 = carblack_3
					material2 = carblack_3
				}
			}
			cas_male_legs = {
				desc_id = m_punk_legs_bullet
				chosen_materials = {
					material1 = carblack_3
					material2 = carblack_3
				}
			}
			cas_male_shoes = {
				desc_id = m_rock_shoe_strapboots
			}
			cas_male_acc_left = {
				desc_id = m_punk_acc_bullets
			}
			cas_male_acc_right = {
				desc_id = m_punk_acc_rleather
			}
			cas_male_acc_face = {
				desc_id = None
			}
			cas_guitar_body = {
				desc_id = gtr9_esp_ax
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr9_esp_ax_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_esp_eclipse_ld_11`
								flags = 4
								Color = red_1
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
						pre_layer = [
							{
								Color = grey_5
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_neckhead_ld_11`
								flags = 36
								Color = red_1
							}
						]
					}
				]
			}
			cas_guitar_pickguards = {
				desc_id = None
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
				desc_id = None
			}
			cas_bass_body = {
				desc_id = bs_sch_t_body
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\schecter\bs_sch_modelt`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_dtl04`
								flags = 4
								Color = red_1
							}
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_ld05`
								flags = 4
								Color = black_1guitar
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
				desc_id = bass_sch_fretboard_22b
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_03`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch22_inl_ld37`
								flags = 36
								Color = black_1guitar
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = bs_sch_t_nhead
				chosen_materials = {
					material1 = black_1guitar
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/schecter/bass_neckhead_mt`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_hd_dtl06`
								flags = 36
							}
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_hd_dtl09`
								flags = 36
								Color = red_1
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = bs_sch_t_pga
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/schecter/bs_sch_modelt_pga`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_t_pga_ld01`
								flags = 4
							}
						]
					}
				]
			}
			cas_bass_pickups = {
				desc_id = bass_emgpickup3b
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bas_brdg_sch_t
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_knobs = {
				desc_id = knob_knurl02
			}
			cas_bass_misc = {
				desc_id = None
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
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_04`
								Color = red_1
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
				desc_id = goth
			}
			cas_mic_stand = {
				desc_id = goth
			}
		}
	}
	{
		Name = gh_rocker_2009_male_band_003
		fullname = qs(0x39a008d0)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0xd61885ba)
		no_random_pick
		selection_not_allowed
		appearance = {
			cas_body = {
				desc_id = gh4_car_male
			}
			cas_eyes = {
				desc_id = car_green_eyes
			}
			cas_male_eyebrows = {
				desc_id = car_default_brow
			}
			cas_male_hair = {
				desc_id = m_bmtl_hair_lars_3
				chosen_materials = {
					material1 = yellow_orange_1
				}
			}
			cas_male_hat = {
				desc_id = None
			}
			cas_male_facial_hair = {
				desc_id = None
			}
			cas_male_torso = {
				desc_id = m_punk_torso_beater
				chosen_materials = {
					material1 = grey_1
				}
			}
			cas_male_legs = {
				desc_id = m_bmtl_legs_lars_3
			}
			cas_male_acc_left = {
				desc_id = m_glam_acc_izzy4l
				chosen_materials = {
					material1 = grey_4
				}
			}
			cas_male_acc_right = {
				desc_id = m_punk_acc_rleather
			}
			cas_male_acc_face = {
				desc_id = None
			}
			cas_guitar_body = {
				desc_id = gtr9_esp_ax
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr9_esp_ax_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_esp_eclipse_ld_11`
								flags = 4
								Color = red_1
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
						pre_layer = [
							{
								Color = grey_5
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_neckhead_ld_11`
								flags = 36
								Color = red_1
							}
						]
					}
				]
			}
			cas_guitar_pickguards = {
				desc_id = None
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
				desc_id = None
			}
			cas_bass_body = {
				desc_id = bs_sch_t_body
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\schecter\bs_sch_modelt`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_dtl04`
								flags = 4
								Color = red_1
							}
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_ld05`
								flags = 4
								Color = black_1guitar
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
				desc_id = bass_sch_fretboard_22b
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_03`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch22_inl_ld37`
								flags = 36
								Color = black_1guitar
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = bs_sch_t_nhead
				chosen_materials = {
					material1 = black_1guitar
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/schecter/bass_neckhead_mt`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_hd_dtl06`
								flags = 36
							}
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_hd_dtl09`
								flags = 36
								Color = red_1
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = bs_sch_t_pga
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/schecter/bs_sch_modelt_pga`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_t_pga_ld01`
								flags = 4
							}
						]
					}
				]
			}
			cas_bass_pickups = {
				desc_id = bass_emgpickup3b
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bas_brdg_sch_t
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_knobs = {
				desc_id = knob_knurl02
			}
			cas_bass_misc = {
				desc_id = None
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
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_04`
								Color = red_1
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
				desc_id = metal
			}
			cas_mic_stand = {
				desc_id = goth
			}
		}
	}
	{
		Name = gh_rocker_2009_male2_band_001
		fullname = qs(0x04dae152)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x08c1725a)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = punk
			frontend_desc = qs(0x80fe43d7)
			cas_body = {
				desc_id = gh4_car_female
			}
			cas_eyes = {
				desc_id = car_red_eyes
			}
			cas_female_eyebrows = {
				desc_id = car_default_thick_brow
			}
			cas_female_hair = {
				desc_id = f_bmtl_hair_straight
				chosen_materials = {
					material1 = grey_5
				}
			}
			cas_female_hat = {
				desc_id = None
			}
			cas_female_facial_hair = {
				desc_id = None
			}
			cas_female_torso = {
				desc_id = f_goth_torso_frillybodice
				chosen_materials = {
					material1 = grey_1
					material3 = red_1
					material4 = grey_1
					material2 = grey_4
				}
			}
			cas_female_legs = {
				desc_id = f_goth_legs_strapj
			}
			cas_female_shoes = {
				desc_id = f_rock_shoe_kneehigh
				chosen_materials = {
					material1 = yellow_orange_2
				}
			}
			cas_female_acc_left = {
				desc_id = f_fun_acc_lglow
			}
			cas_female_acc_right = {
				desc_id = f_fun_acc_rglow
			}
			cas_female_acc_face = {
				desc_id = None
			}
			cas_guitar_body = {
				desc_id = gtr9_esp_ax
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr9_esp_ax_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_esp_eclipse_ld_11`
								flags = 4
								Color = red_1
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
						pre_layer = [
							{
								Color = grey_5
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_neckhead_ld_11`
								flags = 36
								Color = red_1
							}
						]
					}
				]
			}
			cas_guitar_pickguards = {
				desc_id = None
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
				desc_id = None
			}
			cas_bass_body = {
				desc_id = bas_ibz_sr505
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\ibanez\bs_ibz_sr_body`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_ld04`
								flags = 4
								Color = violet_1
							}
							{
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_dtl04`
								flags = 4
								Color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_dtl02`
								flags = 4
								Color = purple_blue_1
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
								texture = `tex/models/characters/layers/cab/ibanez/bass_ibz24_inlay_63`
								flags = 4
								Color = violet_2
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = bas_ibz_sr_head01
				chosen_materials = {
					material1 = violet_2
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/ibanez/bs_ibz_sr_head`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_hd_dtl07`
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
				desc_id = bas_ibz_pkup002
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bas_brdg_ibz01
				chosen_materials = {
					material1 = violet_2
				}
			}
			cas_bass_knobs = {
				desc_id = knob_knurl02
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_misc = {
				desc_id = None
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
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_04`
								Color = red_1
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
				desc_id = `glam	rock`
			}
			cas_mic_stand = {
				desc_id = `classic	rock`
			}
		}
	}
	{
		Name = gh_rocker_2009_male2_band_002
		fullname = qs(0x2ff7b291)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x23ec2199)
		no_random_pick
		selection_not_allowed
		appearance = {
			cas_body = {
				desc_id = gh4_car_male
			}
			cas_eyes = {
				desc_id = car_red_eyes
			}
			cas_male_eyebrows = {
				desc_id = car_default_brow
			}
			cas_male_hair = {
				desc_id = m_bmtl_hair_lars_3
				chosen_materials = {
					material1 = carblack_2
				}
			}
			cas_male_hat = {
				desc_id = None
			}
			cas_male_facial_hair = {
				desc_id = None
			}
			cas_male_torso = {
				desc_id = m_goth_torso_poet
				chosen_materials = {
					material1 = grey_5
				}
			}
			cas_male_legs = {
				desc_id = m_bmtl_legs_lars_3
				chosen_materials = {
					material1 = carblack_3
					material2 = red_1
					material3 = grey_5
				}
			}
			cas_male_shoes = {
				desc_id = m_glam_shoes_dartagnan
			}
			cas_male_acc_left = {
				desc_id = m_fun_acc_lglow
			}
			cas_male_acc_right = {
				desc_id = m_fun_acc_rglow
			}
			cas_male_acc_face = {
				desc_id = None
			}
			cas_guitar_body = {
				desc_id = gtr9_esp_ax
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr9_esp_ax_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_esp_eclipse_ld_11`
								flags = 4
								Color = red_1
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
						pre_layer = [
							{
								Color = grey_5
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_neckhead_ld_11`
								flags = 36
								Color = red_1
							}
						]
					}
				]
			}
			cas_guitar_pickguards = {
				desc_id = None
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
				desc_id = None
			}
			cas_bass_body = {
				desc_id = bas_ibz_sr505
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\ibanez\bs_ibz_sr_body`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_ld04`
								flags = 4
								Color = violet_1
							}
							{
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_dtl04`
								flags = 4
								Color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_dtl02`
								flags = 4
								Color = purple_blue_1
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
								texture = `tex/models/characters/layers/cab/ibanez/bass_ibz24_inlay_63`
								flags = 4
								Color = violet_2
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = bas_ibz_sr_head01
				chosen_materials = {
					material1 = violet_2
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/ibanez/bs_ibz_sr_head`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_hd_dtl07`
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
				desc_id = bas_ibz_pkup002
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bas_brdg_ibz01
				chosen_materials = {
					material1 = violet_2
				}
			}
			cas_bass_knobs = {
				desc_id = knob_knurl02
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_misc = {
				desc_id = None
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
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_04`
								Color = red_1
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
				desc_id = goth
			}
			cas_mic_stand = {
				desc_id = goth
			}
		}
	}
	{
		Name = gh_rocker_2009_male2_band_003
		fullname = qs(0x36ec83d0)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x3af710d8)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = punk
			cas_body = {
				desc_id = gh4_car_male
			}
			cas_eyes = {
				desc_id = car_brown_eyes
			}
			cas_male_eyebrows = {
				desc_id = car_default_brow
			}
			cas_male_hair = {
				desc_id = m_goth_hair_devilock
			}
			cas_male_hat = {
				desc_id = None
			}
			cas_male_facial_hair = {
				desc_id = None
			}
			cas_male_torso = {
				desc_id = m_glam_torso_dartagnan
				chosen_materials = {
					material1 = grey_1
					material2 = grey_1
					material3 = grey_1
					material4 = grey_4
				}
			}
			cas_male_legs = {
				desc_id = m_bmtl_legs_lars_3
				chosen_materials = {
					material1 = carblack_3
					material2 = red_1
					material3 = grey_5
				}
			}
			cas_male_shoes = {
				desc_id = m_goth_shoes_spats
			}
			cas_male_acc_left = {
				desc_id = m_fun_acc_lglow
			}
			cas_male_acc_right = {
				desc_id = m_fun_acc_rglow
			}
			cas_male_acc_face = {
				desc_id = None
			}
			cas_guitar_body = {
				desc_id = gtr9_esp_ax
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr9_esp_ax_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_esp_eclipse_ld_11`
								flags = 4
								Color = red_1
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
						pre_layer = [
							{
								Color = grey_5
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_neckhead_ld_11`
								flags = 36
								Color = red_1
							}
						]
					}
				]
			}
			cas_guitar_pickguards = {
				desc_id = None
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
				desc_id = None
			}
			cas_bass_body = {
				desc_id = bas_ibz_sr505
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\ibanez\bs_ibz_sr_body`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_ld04`
								flags = 4
								Color = violet_1
							}
							{
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_dtl04`
								flags = 4
								Color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_dtl02`
								flags = 4
								Color = purple_blue_1
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
								texture = `tex/models/characters/layers/cab/ibanez/bass_ibz24_inlay_63`
								flags = 4
								Color = violet_2
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = bas_ibz_sr_head01
				chosen_materials = {
					material1 = violet_2
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/ibanez/bs_ibz_sr_head`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_hd_dtl07`
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
				desc_id = bas_ibz_pkup002
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bas_brdg_ibz01
				chosen_materials = {
					material1 = violet_2
				}
			}
			cas_bass_knobs = {
				desc_id = knob_knurl02
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_misc = {
				desc_id = None
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
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_04`
								Color = red_1
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
				desc_id = metal
			}
			cas_mic_stand = {
				desc_id = goth
			}
		}
	}
	{
		Name = gh_rocker_pandora_001
		fullname = qs(0xceb67445)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x54d7ddb2)
		no_random_pick
		selection_not_allowed
		appearance = {
			cas_body = {
				desc_id = gh4_car_female
			}
			cas_eyes = {
				desc_id = car_blue_eyes
			}
			cas_female_eyebrows = {
				desc_id = car_default_thick_brow
			}
			cas_female_hair = {
				desc_id = f_rock_hair_c2short
				chosen_materials = {
					material1 = grey_5
				}
			}
			cas_female_hat = {
				desc_id = None
			}
			cas_female_facial_hair = {
				desc_id = None
			}
			cas_female_torso = {
				desc_id = f_goth_torso_halfstrap
				chosen_materials = {
					material1 = blue_4
					material2 = grey_5
				}
			}
			cas_female_legs = {
				desc_id = f_goth_legs_frillydress
				chosen_materials = {
					material1 = blue_4
					material2 = grey_5
					material3 = blue_5
				}
			}
			cas_female_shoes = {
				desc_id = f_goth_shoe_pndrspike
				chosen_materials = {
					material1 = blue_4
				}
			}
			cas_female_acc_left = {
				desc_id = f_metl_acc_ljewlgnlt
			}
			cas_female_acc_right = {
				desc_id = None
			}
			cas_female_acc_face = {
				desc_id = None
			}
			cas_guitar_body = {
				desc_id = gtr9_esp_ax
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr9_esp_ax_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_esp_eclipse_ld_11`
								flags = 4
								Color = red_1
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
						pre_layer = [
							{
								Color = grey_5
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_neckhead_ld_11`
								flags = 36
								Color = red_1
							}
						]
					}
				]
			}
			cas_guitar_pickguards = {
				desc_id = None
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
				desc_id = None
			}
			cas_bass_body = {
				desc_id = bass63_ex
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\esp\bass63_ex_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/esp/bass63_ex_ld_11`
								a = 90
								flags = 4
								Color = blue_1
							}
							{
								texture = `tex/models/characters/layers/cab/esp/bass63_ex_dtl_02`
								flags = 4
								Color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cab/esp/bass63_ex_dtl_11`
								Color = grey_5guitar
								flags = 4
								a = 10
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
								Color = grey_4
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
						pre_layer = [
							{
								Color = black_1guitar
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
				desc_id = None
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
				desc_id = None
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
				desc_id = glam
			}
		}
	}
	{
		Name = gh_rocker_pandora_002
		fullname = qs(0xe59b2786)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x7ffa8e71)
		no_random_pick
		selection_not_allowed
		appearance = {
			cas_body = {
				desc_id = gh4_car_female
			}
			cas_eyes = {
				desc_id = car_blue_eyes
			}
			cas_female_eyebrows = {
				desc_id = car_angled_thin_brow
			}
			cas_female_hair = {
				desc_id = f_rock_hair_wavy
				chosen_materials = {
					material1 = navy_1
				}
			}
			cas_female_hat = {
				desc_id = None
			}
			cas_female_facial_hair = {
				desc_id = None
			}
			cas_female_torso = {
				desc_id = f_bmtl_torso_bikini
				chosen_materials = {
					material1 = navy_2
				}
			}
			cas_female_legs = {
				desc_id = f_goth_legs_pndrrose
				chosen_materials = {
					material3 = navy_1
					material4 = navy_1
					material1 = navy_2
					material2 = navy_3
				}
			}
			cas_female_shoes = {
				desc_id = f_bmtl_shoe_plated
			}
			cas_female_acc_left = {
				desc_id = f_goth_acc_lstrapglove
			}
			cas_female_acc_right = {
				desc_id = f_goth_acc_rpndrbuckles
				chosen_materials = {
					material1 = navy_1
				}
			}
			cas_female_acc_face = {
				desc_id = None
			}
			cas_guitar_body = {
				desc_id = gtr9_esp_ax
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr9_esp_ax_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_esp_eclipse_ld_11`
								flags = 4
								Color = red_1
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
						pre_layer = [
							{
								Color = grey_5
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_neckhead_ld_11`
								flags = 36
								Color = red_1
							}
						]
					}
				]
			}
			cas_guitar_pickguards = {
				desc_id = None
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
				desc_id = None
			}
			cas_bass_body = {
				desc_id = bass63_ex
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\esp\bass63_ex_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/esp/bass63_ex_ld_11`
								a = 90
								flags = 4
								Color = blue_1
							}
							{
								texture = `tex/models/characters/layers/cab/esp/bass63_ex_dtl_02`
								flags = 4
								Color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cab/esp/bass63_ex_dtl_11`
								Color = grey_5guitar
								flags = 4
								a = 10
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
								Color = grey_4
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
						pre_layer = [
							{
								Color = black_1guitar
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
				desc_id = None
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
				desc_id = None
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
				desc_id = `classic	rock`
			}
		}
	}
	{
		Name = gh_rocker_pandora_003
		fullname = qs(0xfc8016c7)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x66e1bf30)
		no_random_pick
		selection_not_allowed
		appearance = {
			cas_body = {
				desc_id = gh4_car_male
			}
			cas_eyes = {
				desc_id = car_brown_eyes
			}
			cas_male_eyebrows = {
				desc_id = car_dash
			}
			cas_male_hair = {
				desc_id = m_glam_hair_izzy2
			}
			cas_male_torso = {
				desc_id = m_bmtl_torso_patternjacket
				chosen_materials = {
					material1 = carblack_3
				}
			}
			cas_male_legs = {
				desc_id = m_bmtl_legs_plate
			}
			cas_male_shoes = {
				desc_id = m_bmtl_shoes_pattern
			}
			cas_male_acc_left = {
				desc_id = m_punk_acc_lbands
			}
			cas_male_acc_right = {
				desc_id = m_punk_acc_rrings
			}
			cas_male_acc_face = {
				desc_id = None
			}
			cas_guitar_body = {
				desc_id = gtr22_bc_rich_warlock
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr22_bc_rich_warlock_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/bc_rich/gtr_bc_rich_warlock_ld1`
								a = 100
								flags = 4
								Color = blue_3
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
								texture = `tex/models/characters/layers/cag/bc_rich/24fret_ld04_bcr_diamonds`
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/bc_rich/gtr20_neckhead_pointed_ld02`
								flags = 36
								Color = grey_2guitar
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
				desc_id = bass63_ex
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\esp\bass63_ex_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/esp/bass63_ex_ld_11`
								a = 90
								flags = 4
								Color = blue_1
							}
							{
								texture = `tex/models/characters/layers/cab/esp/bass63_ex_dtl_02`
								flags = 4
								Color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cab/esp/bass63_ex_dtl_11`
								Color = grey_5guitar
								flags = 4
								a = 10
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
								Color = grey_4
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
						pre_layer = [
							{
								Color = black_1guitar
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
				desc_id = None
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
				desc_id = None
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
		Name = gh_rocker_pandora2_001
		fullname = qs(0x61235c61)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x95d4aa36)
		no_random_pick
		selection_not_allowed
		appearance = {
			cas_body = {
				desc_id = gh4_car_female
			}
			cas_eyes = {
				desc_id = car_blue_eyes
			}
			cas_female_eyebrows = {
				desc_id = car_angled_thin_brow
			}
			cas_female_hair = {
				desc_id = f_rock_hair_c2short
				chosen_materials = {
					material1 = blue_1
				}
			}
			cas_female_hat = {
				desc_id = None
			}
			cas_female_facial_hair = {
				desc_id = None
			}
			cas_female_torso = {
				desc_id = f_pandband02_torso
			}
			cas_female_legs = {
				desc_id = f_pandband01_legs
			}
			cas_female_shoes = {
				desc_id = f_pandband02_shoes
			}
			cas_female_acc_left = {
				desc_id = f_metl_acc_ljewlgnlt
			}
			cas_female_acc_right = {
				desc_id = None
			}
			cas_female_acc_face = {
				desc_id = None
			}
			cas_full_guitar = {
				desc_id = gtr_pandora
			}
			cas_bass_body = {
				desc_id = bas_ibz_sr505
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\ibanez\bs_ibz_sr_body`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_ld02`
								flags = 4
								Color = red_1
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
			cas_bass_neck = {
				desc_id = bass_fretboard_sr_24d
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/ibanez/bass_sr24_inlay001`
								flags = 4
								Color = orange_4
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = bas_ibz_sr_head01
				chosen_materials = {
					material1 = orange_4
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/ibanez/bs_ibz_sr_head`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_hd_dtl08`
								flags = 36
								Color = red_1
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
				desc_id = None
			}
			cas_bass_pickups = {
				desc_id = bas_ibz_pkup002
				chosen_materials = {
					material1 = orange_4
				}
			}
			cas_bass_bridges = {
				desc_id = bas_brdg_ibz_mono
				chosen_materials = {
					material1 = orange_4
				}
			}
			cas_bass_knobs = {
				desc_id = knob_knurl02
				chosen_materials = {
					material1 = orange_4
				}
			}
			cas_bass_misc = {
				desc_id = None
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
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = mic_studio
			}
			cas_mic_stand = {
				desc_id = mic_stand_blackmetal
			}
		}
	}
	{
		Name = gh_rocker_pandora2_002
		fullname = qs(0x4a0e0fa2)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0xbef9f9f5)
		no_random_pick
		selection_not_allowed
		appearance = {
			cas_body = {
				desc_id = gh4_car_female
			}
			cas_eyes = {
				desc_id = car_blue_eyes
			}
			cas_female_eyebrows = {
				desc_id = car_default_brow
			}
			cas_female_hair = {
				desc_id = f_rock_hair_wavy
				chosen_materials = {
					material1 = blue_4
				}
			}
			cas_female_hat = {
				desc_id = None
			}
			cas_female_facial_hair = {
				desc_id = None
			}
			cas_female_torso = {
				desc_id = f_pandband01_torso
			}
			cas_female_legs = {
				desc_id = f_pandband01_legs
			}
			cas_female_shoes = {
				desc_id = f_pandband01_shoes
			}
			cas_female_acc_left = {
				desc_id = f_goth_acc_lstrapglove
			}
			cas_female_acc_right = {
				desc_id = None
			}
			cas_female_acc_face = {
				desc_id = None
			}
			cas_full_guitar = {
				desc_id = gtr_pandora
			}
			cas_bass_body = {
				desc_id = bas_ibz_sr505
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\ibanez\bs_ibz_sr_body`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_ld02`
								flags = 4
								Color = red_1
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
			cas_bass_neck = {
				desc_id = bass_fretboard_sr_24d
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/ibanez/bass_sr24_inlay001`
								flags = 4
								Color = orange_4
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = bas_ibz_sr_head01
				chosen_materials = {
					material1 = orange_4
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/ibanez/bs_ibz_sr_head`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_hd_dtl08`
								flags = 36
								Color = red_1
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = None
			}
			cas_bass_pickups = {
				desc_id = bas_ibz_pkup002
				chosen_materials = {
					material1 = orange_4
				}
			}
			cas_bass_bridges = {
				desc_id = bas_brdg_ibz_mono
				chosen_materials = {
					material1 = orange_4
				}
			}
			cas_bass_knobs = {
				desc_id = knob_knurl02
				chosen_materials = {
					material1 = orange_4
				}
			}
			cas_bass_misc = {
				desc_id = None
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
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = mic_studio
			}
			cas_mic_stand = {
				desc_id = mic_stand_blackmetal
			}
		}
	}
	{
		Name = gh_rocker_pandora2_003
		fullname = qs(0x53153ee3)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x63a59447)
		no_random_pick
		selection_not_allowed
		appearance = {
			cas_body = {
				desc_id = gh4_car_male
			}
			cas_eyes = {
				desc_id = car_blue_eyes
			}
			cas_male_eyebrows = {
				desc_id = car_default_brow
			}
			cas_male_hair = {
				desc_id = m_bmtl_hair_straight
				chosen_materials = {
					material1 = blue_5
				}
			}
			cas_male_hat = {
				desc_id = None
			}
			cas_male_facial_hair = {
				desc_id = None
			}
			cas_male_torso = {
				desc_id = m_pandoraband_torso
			}
			cas_male_legs = {
				desc_id = m_pandoraband_legs
			}
			cas_male_shoes = {
				desc_id = m_pandoraband_shoes
			}
			cas_male_acc_left = {
				desc_id = m_punk_acc_lbands
			}
			cas_male_acc_right = {
				desc_id = m_punk_acc_rrings
			}
			cas_male_acc_face = {
				desc_id = None
			}
			cas_full_guitar = {
				desc_id = gtr_pandora
			}
			cas_bass_body = {
				desc_id = bas_ibz_sr505
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\ibanez\bs_ibz_sr_body`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_ld02`
								flags = 4
								Color = red_1
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
			cas_bass_neck = {
				desc_id = bass_fretboard_sr_24d
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/ibanez/bass_sr24_inlay001`
								flags = 4
								Color = orange_4
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = bas_ibz_sr_head01
				chosen_materials = {
					material1 = orange_4
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/ibanez/bs_ibz_sr_head`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_hd_dtl08`
								flags = 36
								Color = red_1
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
				desc_id = None
			}
			cas_bass_pickups = {
				desc_id = bas_ibz_pkup002
				chosen_materials = {
					material1 = orange_4
				}
			}
			cas_bass_bridges = {
				desc_id = bas_brdg_ibz_mono
				chosen_materials = {
					material1 = orange_4
				}
			}
			cas_bass_knobs = {
				desc_id = knob_knurl02
				chosen_materials = {
					material1 = orange_4
				}
			}
			cas_bass_misc = {
				desc_id = None
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
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = mic_studio
			}
			cas_mic_stand = {
				desc_id = mic_stand_blackmetal
			}
		}
	}
	{
		Name = gh_rocker_casey_band_001
		fullname = qs(0xb2b111a7)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x005dacb8)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = punk
			cas_body = {
				desc_id = gh4_car_female
			}
			cas_eyes = {
				desc_id = car_blue_eyes
			}
			cas_female_eyebrows = {
				desc_id = car_angled_thin_brow
			}
			cas_female_hair = {
				desc_id = f_rock_hair_cbob
				chosen_materials = {
					material1 = yellow_1
				}
			}
			cas_female_torso = {
				desc_id = f_metl_torso_jeanlthr
			}
			cas_female_legs = {
				desc_id = f_rock_legs_jeans
				chosen_materials = {
					material1 = blue_5
				}
			}
			cas_female_shoes = {
				desc_id = f_metl_shoe_flame
			}
			cas_female_acc_left = {
				desc_id = f_metl_acc_ljewlgnlt
			}
			cas_female_acc_right = {
				desc_id = None
			}
			cas_guitar_body = {
				desc_id = gtr9_esp_ax
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr9_esp_ax_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_esp_eclipse_ld_11`
								flags = 4
								Color = red_1
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
						pre_layer = [
							{
								Color = grey_5
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_neckhead_ld_11`
								flags = 36
								Color = red_1
							}
						]
					}
				]
			}
			cas_guitar_pickguards = {
				desc_id = None
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
				desc_id = None
			}
			cas_bass_body = {
				desc_id = bass_schect_030
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\schecter\bs_sch_bod04_01`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_bod04_ld05`
								flags = 4
								Color = red_orange_1
							}
							{
								texture = `tex/models/characters/layers/cag/all_clear3`
								flags = 4
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
				desc_id = bass_sch_fretboard_22b
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_03`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch22_inl_ld30`
								flags = 4
								Color = black_1guitar
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_04_hd_dtl08`
								flags = 36
								Color = orange_3
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
			}
			cas_bass_pickups = {
				desc_id = bass_emgpickup2b
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bas_brdg_sch_c
			}
			cas_bass_knobs = {
				desc_id = bass_knob_09
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_misc = {
				desc_id = None
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
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_21`
								flags = 32
								Color = orange_4
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = `glam	rock`
			}
			cas_mic_stand = {
				desc_id = `classic	rock`
			}
		}
	}
	{
		Name = gh_rocker_casey_band_002
		fullname = qs(0x999c4264)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x2b70ff7b)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = punk
			cas_body = {
				desc_id = gh4_car_male
			}
			cas_eyes = {
				desc_id = car_blue_eyes
			}
			cas_male_eyebrows = {
				desc_id = car_default_brow
			}
			cas_male_hair = {
				desc_id = m_metl_hair_axel_1
			}
			cas_male_hat = {
				desc_id = None
			}
			cas_male_facial_hair = {
				desc_id = m_clsc_fhair_stache04
			}
			cas_male_torso = {
				desc_id = m_mtl_torso_axel1
				chosen_materials = {
					material1 = grey_5
					material2 = grey_5
				}
			}
			cas_male_legs = {
				desc_id = m_metl_legs_axel_1
				chosen_materials = {
					material1 = blue_5
				}
			}
			cas_male_shoes = {
				desc_id = m_rock_shoe_strapboots
			}
			cas_male_acc_left = {
				desc_id = None
			}
			cas_male_acc_right = {
				desc_id = m_pop_acc_rglove
			}
			cas_male_acc_face = {
				desc_id = None
			}
			cas_guitar_body = {
				desc_id = gtr9_esp_ax
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr9_esp_ax_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_esp_eclipse_ld_11`
								flags = 4
								Color = red_1
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
						pre_layer = [
							{
								Color = grey_5
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_neckhead_ld_11`
								flags = 36
								Color = red_1
							}
						]
					}
				]
			}
			cas_guitar_pickguards = {
				desc_id = None
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
				desc_id = None
			}
			cas_bass_body = {
				desc_id = bass_schect_030
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\schecter\bs_sch_bod04_01`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_bod04_ld05`
								flags = 4
								Color = red_orange_1
							}
							{
								texture = `tex/models/characters/layers/cag/all_clear3`
								flags = 4
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
				desc_id = bass_sch_fretboard_22b
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_03`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch22_inl_ld30`
								flags = 4
								Color = black_1guitar
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_04_hd_dtl08`
								flags = 36
								Color = orange_3
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
			}
			cas_bass_pickups = {
				desc_id = bass_emgpickup2b
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bas_brdg_sch_c
			}
			cas_bass_knobs = {
				desc_id = bass_knob_09
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_misc = {
				desc_id = None
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
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_21`
								flags = 32
								Color = orange_4
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
		Name = gh_rocker_casey_band_003
		fullname = qs(0x80877325)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x326bce3a)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = punk
			cas_body = {
				desc_id = gh4_car_male
			}
			cas_eyes = {
				desc_id = car_hazel_eyes
			}
			cas_male_eyebrows = {
				desc_id = car_rounded
			}
			cas_male_hair = {
				desc_id = m_rock_hair_eddie3
				chosen_materials = {
					material1 = yellow_orange_2
					material2 = yellow_orange_1
				}
			}
			cas_male_hat = {
				desc_id = None
			}
			cas_male_facial_hair = {
				desc_id = m_rock_fhair_stub
			}
			cas_male_torso = {
				desc_id = m_metl_torso_jamesalt
			}
			cas_male_legs = {
				desc_id = m_rock_legs_ripjeans
			}
			cas_male_shoes = {
				desc_id = m_clsc_shoe_jimi
			}
			cas_male_acc_left = {
				desc_id = m_clsc_acc_l3rings
			}
			cas_male_acc_right = {
				desc_id = m_pop_acc_rglove
			}
			cas_male_acc_face = {
				desc_id = None
			}
			cas_guitar_body = {
				desc_id = gtr9_esp_ax
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr9_esp_ax_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_esp_eclipse_ld_11`
								flags = 4
								Color = red_1
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
						pre_layer = [
							{
								Color = grey_5
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_neckhead_ld_11`
								flags = 36
								Color = red_1
							}
						]
					}
				]
			}
			cas_guitar_pickguards = {
				desc_id = None
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
				desc_id = None
			}
			cas_bass_body = {
				desc_id = bass_schect_030
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\schecter\bs_sch_bod04_01`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_bod04_ld05`
								flags = 4
								Color = red_orange_1
							}
							{
								texture = `tex/models/characters/layers/cag/all_clear3`
								flags = 4
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
				desc_id = bass_sch_fretboard_22b
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_03`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch22_inl_ld30`
								flags = 4
								Color = black_1guitar
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_04_hd_dtl08`
								flags = 36
								Color = orange_3
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
			}
			cas_bass_pickups = {
				desc_id = bass_emgpickup2b
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bas_brdg_sch_c
			}
			cas_bass_knobs = {
				desc_id = bass_knob_09
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_misc = {
				desc_id = None
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
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_21`
								flags = 32
								Color = orange_4
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
		Name = gh_rocker_casey2_band_001
		fullname = qs(0xaac6e539)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0xd24c967a)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = punk
			cas_body = {
				desc_id = gh4_car_female
			}
			cas_eyes = {
				desc_id = car_red_eyes
			}
			cas_female_eyebrows = {
				desc_id = car_default_brow
			}
			cas_female_hair = {
				desc_id = f_bmtl_hair_straight
			}
			cas_female_hat = {
				desc_id = None
			}
			cas_female_facial_hair = {
				desc_id = None
			}
			cas_female_torso = {
				desc_id = f_rock_torso_ctank
				chosen_materials = {
					material2 = carblack_1
					material1 = yellow_orange_3
				}
			}
			cas_female_legs = {
				desc_id = f_punk_legs_judynails3
				chosen_materials = {
					material1 = yellow_orange_2
				}
			}
			cas_female_shoes = {
				desc_id = f_metl_shoe_mocboot
			}
			cas_female_acc_left = {
				desc_id = f_goth_acc_lstrapglove
				chosen_materials = {
					material2 = grey_5
					material1 = yellow_orange_2
				}
			}
			cas_female_acc_right = {
				desc_id = f_goth_acc_rglove
				chosen_materials = {
					material1 = yellow_orange_1
				}
			}
			cas_female_acc_face = {
				desc_id = None
			}
			cas_full_guitar = {
				desc_id = gtr16_mcswain_snake02
			}
			cas_bass_body = {
				desc_id = bass15_mcswain_machine
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\mcswain\bass15_mcswain_machine_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/mcswain/bass15_mcswain_machine_ld5`
								flags = 4
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = bass_mcswain_fboard24
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d`
						pre_layer = [
							{
								Color = grey_5guitar
								texture = `tex/models/characters/layers/cab/mcswain/24fret_ld07_mcswn_bullets`
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/mcswain/bass15_nkhd_mcswain_ld5`
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
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh6_skins_ld04`
								flags = 4
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_21`
								flags = 32
								Color = orange_4
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
		Name = gh_rocker_casey2_band_002
		fullname = qs(0x81ebb6fa)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0xf961c5b9)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = punk
			cas_body = {
				desc_id = gh4_car_male
			}
			cas_eyes = {
				desc_id = car_red_eyes
			}
			cas_male_eyebrows = {
				desc_id = car_angled
			}
			cas_male_hair = {
				desc_id = m_glam_hair_izzy2
				chosen_materials = {
					material1 = hairorange_4
				}
			}
			cas_male_facial_hair = {
				desc_id = None
			}
			cas_male_torso = {
				desc_id = m_bmtl_torso_lars4
				chosen_materials = {
					material1 = yellow_orange_1
				}
			}
			cas_male_legs = {
				desc_id = m_bmtl_legs_lars_2
				chosen_materials = {
					material1 = yellow_orange_3
				}
			}
			cas_male_shoes = {
				desc_id = m_bmtl_shoe_lars4
				chosen_materials = {
					material1 = yellow_orange_3
					material2 = orange_4
				}
			}
			cas_male_acc_left = {
				desc_id = m_glam_acc_lwristband
				chosen_materials = {
					material1 = yellow_orange_1
				}
			}
			cas_male_acc_right = {
				desc_id = m_mtl_accr_axel4
				chosen_materials = {
					material3 = grey_4
				}
			}
			cas_male_acc_face = {
				desc_id = None
			}
			cas_full_guitar = {
				desc_id = gtr16_mcswain_snake02
			}
			cas_bass_body = {
				desc_id = bass15_mcswain_machine
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\mcswain\bass15_mcswain_machine_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/mcswain/bass15_mcswain_machine_ld5`
								flags = 4
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = bass_mcswain_fboard24
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d`
						pre_layer = [
							{
								Color = grey_5guitar
								texture = `tex/models/characters/layers/cab/mcswain/24fret_ld07_mcswn_bullets`
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/mcswain/bass15_nkhd_mcswain_ld5`
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
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh6_skins_ld04`
								flags = 4
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_21`
								flags = 32
								Color = orange_4
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
		Name = gh_rocker_casey2_band_003
		fullname = qs(0x98f087bb)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0xe07af4f8)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = punk
			cas_body = {
				desc_id = gh4_car_male
			}
			cas_eyes = {
				desc_id = car_brown_eyes
			}
			cas_male_eyebrows = {
				desc_id = car_default_brow
			}
			cas_male_hair = {
				desc_id = m_goth_hair_dreads
				chosen_materials = {
					material1 = hairorange_5
				}
			}
			cas_male_hat = {
				desc_id = None
			}
			cas_male_facial_hair = {
				desc_id = m_mtl_fhair_axel4
			}
			cas_male_torso = {
				desc_id = m_metl_torso_axel4
				chosen_materials = {
					material2 = carblack_3
					material1 = yellow_orange_1
				}
			}
			cas_male_legs = {
				desc_id = m_glam_legs_snke
				chosen_materials = {
					material1 = yellow_orange_5
					material2 = red_orange_3
				}
			}
			cas_male_shoes = {
				desc_id = m_bmtl_shoe_lars4
				chosen_materials = {
					material1 = yellow_orange_2
					material2 = red_orange_2
				}
			}
			cas_male_acc_left = {
				desc_id = m_metl_acc_lbarbracer
			}
			cas_male_acc_right = {
				desc_id = m_metl_acc_rbarbracer
			}
			cas_male_acc_face = {
				desc_id = None
			}
			cas_full_guitar = {
				desc_id = gtr16_mcswain_snake02
			}
			cas_bass_body = {
				desc_id = bass15_mcswain_machine
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\mcswain\bass15_mcswain_machine_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/mcswain/bass15_mcswain_machine_ld5`
								flags = 4
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = bass_mcswain_fboard24
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d`
						pre_layer = [
							{
								Color = grey_5guitar
								texture = `tex/models/characters/layers/cab/mcswain/24fret_ld07_mcswn_bullets`
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/mcswain/bass15_nkhd_mcswain_ld5`
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
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh6_skins_ld04`
								flags = 4
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_21`
								flags = 32
								Color = orange_4
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
		Name = gh_rocker_judy_band_001
		fullname = qs(0xa7e9e050)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0xcfde6361)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = punk
			cas_body = {
				desc_id = gh4_car_female
			}
			cas_eyes = {
				desc_id = car_hazel_eyes
			}
			cas_female_eyebrows = {
				desc_id = car_angled_thin_brow
			}
			cas_female_hair = {
				desc_id = f_rock_hair_c2short
				chosen_materials = {
					material1 = carblack_1
				}
			}
			cas_female_hat = {
				desc_id = None
			}
			cas_female_facial_hair = {
				desc_id = None
			}
			cas_female_torso = {
				desc_id = f_rock_torso_cjean
				chosen_materials = {
					material2 = red_2
				}
			}
			cas_female_legs = {
				desc_id = f_punk_legs_judynails1
			}
			cas_female_shoes = {
				desc_id = f_punk_shoe_army
				chosen_materials = {
					material1 = grey_1
					material2 = red_3
				}
			}
			cas_female_acc_left = {
				desc_id = f_rock_acc_lskullwatch
			}
			cas_female_acc_right = {
				desc_id = f_punk_acc_rglvwatch
			}
			cas_female_acc_face = {
				desc_id = None
			}
			cas_guitar_body = {
				desc_id = gtr9_esp_ax
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr9_esp_ax_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_esp_eclipse_ld_11`
								flags = 4
								Color = red_1
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
						pre_layer = [
							{
								Color = grey_5
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_neckhead_ld_11`
								flags = 36
								Color = red_1
							}
						]
					}
				]
			}
			cas_guitar_pickguards = {
				desc_id = None
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
				desc_id = None
			}
			cas_bass_body = {
				desc_id = bas_ibz_sr505
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\ibanez\bs_ibz_sr_body`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_ld02`
								flags = 4
								Color = grey_3guitar
							}
							{
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_dtl04`
								flags = 4
								Color = black_1guitar
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
				desc_id = bass_ibz_fretboard_24d
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
						pre_layer = [
							{
								Color = grey_5guitar
								texture = `tex/models/characters/layers/cab/ibanez/bass_ibz24_inlay_68`
								flags = 4
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = bas_ibz_sr_head01
				chosen_materials = {
					material1 = yellow_4guitar
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/ibanez/bs_ibz_sr_head`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_hd_dtl07`
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
				desc_id = bas_ibz_pkup002
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bas_brdg_ibz01
				chosen_materials = {
					material1 = yellow_4guitar
				}
			}
			cas_bass_knobs = {
				desc_id = knob_knurl02
				chosen_materials = {
					material1 = yellow_4guitar
				}
			}
			cas_bass_misc = {
				desc_id = None
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
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_53`
								Color = red_2
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
				desc_id = `glam	rock`
			}
			cas_mic_stand = {
				desc_id = `classic	rock`
			}
		}
	}
	{
		Name = gh_rocker_judy_band_002
		fullname = qs(0x8cc4b393)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0xe4f330a2)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = punk
			cas_body = {
				desc_id = gh4_car_male
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
				desc_id = m_punk_hair_spike
				chosen_materials = {
					material1 = carblack_1
				}
			}
			cas_male_hat = {
				desc_id = None
			}
			cas_male_facial_hair = {
				desc_id = None
			}
			cas_male_torso = {
				desc_id = m_rock_torso_bandana
			}
			cas_male_legs = {
				desc_id = m_punk_legs_johnny1
			}
			cas_male_shoes = {
				desc_id = m_mtl_shoes_axel3
			}
			cas_male_acc_left = {
				desc_id = m_mtl_accl_axel3
			}
			cas_male_acc_right = {
				desc_id = m_rock_acc_rspike
			}
			cas_male_acc_face = {
				desc_id = m_pop_glasses_riot
			}
			cas_guitar_body = {
				desc_id = gtr9_esp_ax
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr9_esp_ax_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_esp_eclipse_ld_11`
								flags = 4
								Color = red_1
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
						pre_layer = [
							{
								Color = grey_5
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_neckhead_ld_11`
								flags = 36
								Color = red_1
							}
						]
					}
				]
			}
			cas_guitar_pickguards = {
				desc_id = None
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
				desc_id = None
			}
			cas_bass_body = {
				desc_id = bas_ibz_sr505
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\ibanez\bs_ibz_sr_body`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_ld02`
								flags = 4
								Color = grey_3guitar
							}
							{
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_dtl04`
								flags = 4
								Color = black_1guitar
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
				desc_id = bass_ibz_fretboard_24d
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
						pre_layer = [
							{
								Color = grey_5guitar
								texture = `tex/models/characters/layers/cab/ibanez/bass_ibz24_inlay_68`
								flags = 4
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = bas_ibz_sr_head01
				chosen_materials = {
					material1 = yellow_4guitar
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/ibanez/bs_ibz_sr_head`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_hd_dtl07`
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
				desc_id = bas_ibz_pkup002
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bas_brdg_ibz01
				chosen_materials = {
					material1 = yellow_4guitar
				}
			}
			cas_bass_knobs = {
				desc_id = knob_knurl02
				chosen_materials = {
					material1 = yellow_4guitar
				}
			}
			cas_bass_misc = {
				desc_id = None
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
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_53`
								Color = red_2
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
				desc_id = goth
			}
			cas_mic_stand = {
				desc_id = goth
			}
		}
	}
	{
		Name = gh_rocker_judy_band_003
		fullname = qs(0x95df82d2)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0xfde801e3)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = punk
			cas_body = {
				desc_id = gh4_car_male
			}
			cas_male_physique = {
				desc_id = malephysique1
			}
			cas_eyes = {
				desc_id = car_brown_eyes
			}
			cas_male_eyebrows = {
				desc_id = car_dash
			}
			cas_male_hair = {
				desc_id = m_pop_hair_buzz
			}
			cas_male_hat = {
				desc_id = None
			}
			cas_male_facial_hair = {
				desc_id = m_rock_fhair_goatee03
			}
			cas_male_torso = {
				desc_id = shirtless
			}
			cas_male_legs = {
				desc_id = m_punk_legs_camo
			}
			cas_male_shoes = {
				desc_id = m_rock_shoe_barbwire
			}
			cas_male_acc_left = {
				desc_id = m_punk_accl_jny_3
			}
			cas_male_acc_right = {
				desc_id = m_rock_acc_rspike
			}
			cas_male_acc_face = {
				desc_id = None
			}
			cas_guitar_body = {
				desc_id = gtr9_esp_ax
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr9_esp_ax_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_esp_eclipse_ld_11`
								flags = 4
								Color = red_1
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
						pre_layer = [
							{
								Color = grey_5
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_neckhead_ld_11`
								flags = 36
								Color = red_1
							}
						]
					}
				]
			}
			cas_guitar_pickguards = {
				desc_id = None
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
				desc_id = None
			}
			cas_bass_body = {
				desc_id = bas_ibz_sr505
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\ibanez\bs_ibz_sr_body`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_ld02`
								flags = 4
								Color = grey_3guitar
							}
							{
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_dtl04`
								flags = 4
								Color = black_1guitar
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
				desc_id = bass_ibz_fretboard_24d
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
						pre_layer = [
							{
								Color = grey_5guitar
								texture = `tex/models/characters/layers/cab/ibanez/bass_ibz24_inlay_68`
								flags = 4
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = bas_ibz_sr_head01
				chosen_materials = {
					material1 = yellow_4guitar
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/ibanez/bs_ibz_sr_head`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_hd_dtl07`
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
				desc_id = bas_ibz_pkup002
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bas_brdg_ibz01
				chosen_materials = {
					material1 = yellow_4guitar
				}
			}
			cas_bass_knobs = {
				desc_id = knob_knurl02
				chosen_materials = {
					material1 = yellow_4guitar
				}
			}
			cas_bass_misc = {
				desc_id = None
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
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_53`
								Color = red_2
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
				desc_id = metal
			}
			cas_mic_stand = {
				desc_id = goth
			}
		}
	}
	{
		Name = gh_rocker_judy2_band_001
		fullname = qs(0x3b814591)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x896df88e)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = punk
			cas_body = {
				desc_id = gh4_car_female
			}
			cas_eyes = {
				desc_id = car_blank_eyes
			}
			cas_female_eyebrows = {
				desc_id = car_vulcan_brow
			}
			cas_female_hair = {
				desc_id = f_bmtl_hair_overeyes
			}
			cas_female_hat = {
				desc_id = None
			}
			cas_female_facial_hair = {
				desc_id = None
			}
			cas_female_torso = {
				desc_id = f_punk_torso_judywing
			}
			cas_female_legs = {
				desc_id = f_punk_legs_cheerskirt
				chosen_materials = {
					material1 = red_2
				}
			}
			cas_female_shoes = {
				desc_id = f_goth_shoe_pndr3buckle
				chosen_materials = {
					material1 = carblack_1
				}
			}
			cas_female_acc_left = {
				desc_id = f_punk_acc_ljudyarm
			}
			cas_female_acc_right = {
				desc_id = f_punk_acc_rjudyarm
			}
			cas_female_acc_face = {
				desc_id = None
			}
			cas_full_guitar = {
				desc_id = gtr138_judy
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
								Color = red_1
							}
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_bod04_dtl03`
								flags = 4
								Color = black_1guitar
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch22_inl_ld37`
								flags = 36
								Color = red_1
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_04_hd_dtl01`
								flags = 36
								Color = grey_5guitar
							}
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_04_hd_dtl06`
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
				desc_id = None
			}
			cas_bass_pickups = {
				desc_id = bass_emgpickup2b
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bas_brdg_sch_c
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
				desc_id = None
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
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_53`
								Color = red_2
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
				desc_id = `black	metal`
			}
			cas_mic_stand = {
				desc_id = mic_stand_metal
			}
		}
	}
	{
		Name = gh_rocker_judy2_band_002
		fullname = qs(0x62af1606)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0xa240ab4d)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = punk
			cas_body = {
				desc_id = gh4_car_male
			}
			cas_eyes = {
				desc_id = car_blank_eyes
			}
			cas_male_eyebrows = {
				desc_id = car_dash
			}
			cas_male_hair = {
				desc_id = m_pop_hair_buzz
			}
			cas_male_facial_hair = {
				desc_id = m_rock_fhair_goatee01
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_male_torso = {
				desc_id = m_goth_torso_devilwings
			}
			cas_male_legs = {
				desc_id = m_bmtl_legs_kdpants
			}
			cas_male_shoes = {
				desc_id = m_clsc_shoe_clive
				chosen_materials = {
					material1 = yellow_orange_1
					material2 = carblack_1
				}
			}
			cas_male_acc_left = {
				desc_id = m_punk_acc_ljudyarm
			}
			cas_male_acc_right = {
				desc_id = m_punk_acc_rjudyarm
			}
			cas_male_acc_face = {
				desc_id = None
			}
			cas_full_guitar = {
				desc_id = gtr138_judy
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
								Color = red_1
							}
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_bod04_dtl03`
								flags = 4
								Color = black_1guitar
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch22_inl_ld37`
								flags = 36
								Color = red_1
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_04_hd_dtl01`
								flags = 36
								Color = grey_5guitar
							}
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_04_hd_dtl06`
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
				desc_id = None
			}
			cas_bass_pickups = {
				desc_id = bass_emgpickup2b
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bas_brdg_sch_c
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
				desc_id = None
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
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_53`
								Color = red_2
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
				desc_id = `black	metal`
			}
			cas_mic_stand = {
				desc_id = mic_stand_metal
			}
		}
	}
	{
		Name = gh_rocker_judy2_band_003
		fullname = qs(0x09b72713)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0xbb5b9a0c)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = punk
			cas_body = {
				desc_id = gh4_car_male
			}
			cas_eyes = {
				desc_id = car_blank_eyes
			}
			cas_male_eyebrows = {
				desc_id = car_dash
			}
			cas_male_hair = {
				desc_id = m_punk_hair_jny_1
				chosen_materials = {
					material1 = carblack_1
				}
			}
			cas_male_facial_hair = {
				desc_id = m_rock_fhair_goatee01
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_male_torso = {
				desc_id = m_goth_torso_devilwings
			}
			cas_male_legs = {
				desc_id = m_rock_legs_ozzypants
			}
			cas_male_shoes = {
				desc_id = m_glam_shoe_wrestler
				chosen_materials = {
					material1 = carblack_1
				}
			}
			cas_male_acc_left = {
				desc_id = m_punk_acc_ljudyarm
			}
			cas_male_acc_right = {
				desc_id = m_punk_acc_rjudyarm
			}
			cas_male_acc_face = {
				desc_id = None
			}
			cas_full_guitar = {
				desc_id = gtr138_judy
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
								Color = red_1
							}
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_bod04_dtl03`
								flags = 4
								Color = black_1guitar
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch22_inl_ld37`
								flags = 36
								Color = red_1
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_04_hd_dtl01`
								flags = 36
								Color = grey_5guitar
							}
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_04_hd_dtl06`
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
				desc_id = None
			}
			cas_bass_pickups = {
				desc_id = bass_emgpickup2b
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bas_brdg_sch_c
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
				desc_id = None
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
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_53`
								Color = red_2
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
				desc_id = `black	metal`
			}
			cas_mic_stand = {
				desc_id = mic_stand_metal
			}
		}
	}
	{
		Name = gh_rocker_demigodt_band_001
		fullname = qs(0x0706410d)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x155e05c7)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = black_metal
			cas_body = {
				desc_id = gh4_car_female
			}
			cas_female_physique = {
				desc_id = femalephysique6
				bones = {
					height = 0.5
				}
			}
			cas_eyes = {
				desc_id = car_albino_eyes
			}
			cas_female_eyebrows = {
				desc_id = car_angled_thin_brow
			}
			cas_female_hair = {
				desc_id = f_goth_hair_dreads
				chosen_materials = {
					material2 = grey_5
					material1 = carblack_2
					material3 = yellow_orange_5
				}
			}
			cas_female_hat = {
				desc_id = None
			}
			cas_female_facial_hair = {
				desc_id = None
			}
			cas_female_torso = {
				desc_id = f_bmtl_torso_bikini
			}
			cas_female_legs = {
				desc_id = f_bmtl_legs_stichpants
			}
			cas_female_shoes = {
				desc_id = f_rock_shoe_kneehigh
				chosen_materials = {
					material1 = grey_1
				}
			}
			cas_female_acc_left = {
				desc_id = f_punk_acc_lspike
			}
			cas_female_acc_right = {
				desc_id = f_bmtl_acc_rwristguard
			}
			cas_guitar_body = {
				desc_id = gtr9_esp_ax
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr9_esp_ax_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_esp_eclipse_ld_11`
								flags = 4
								Color = red_1
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
						pre_layer = [
							{
								Color = grey_5
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_neckhead_ld_11`
								flags = 36
								Color = red_1
							}
						]
					}
				]
			}
			cas_guitar_pickguards = {
				desc_id = None
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
				desc_id = None
			}
			cas_bass_body = {
				desc_id = bs_sch_t_body
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\schecter\bs_sch_modelt`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_dtl01`
								Color = black_1guitar
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
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_inl_ld30`
								flags = 4
								Color = grey_5guitar
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
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_hd_dtl06`
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
				desc_id = None
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
								Color = grey_3guitar
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
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
				desc_id = mic_standard
			}
			cas_mic_stand = {
				desc_id = poptastic
			}
		}
	}
	{
		Name = gh_rocker_demigod_band_002
		fullname = qs(0x80668ba8)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x3e735604)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = black_metal
			cas_body = {
				desc_id = gh4_car_male
			}
			cas_male_physique = {
				desc_id = malephysique5
			}
			cas_eyes = {
				desc_id = car_brown_eyes
			}
			cas_male_eyebrows = {
				desc_id = car_angled
			}
			cas_male_hair = {
				desc_id = m_metl_hair_axel_4
				chosen_materials = {
					material1 = yellow_orange_1
				}
			}
			cas_male_hat = {
				desc_id = None
			}
			cas_male_facial_hair = {
				desc_id = m_mtl_fhair_axel4
			}
			cas_male_torso = {
				desc_id = m_bmtl_torso_lars_2
			}
			cas_male_legs = {
				desc_id = m_metl_legs_zakk
			}
			cas_male_shoes = {
				desc_id = m_punk_shoe_buckleb
			}
			cas_male_acc_left = {
				desc_id = m_bmtl_acc_ltripleband
			}
			cas_male_acc_right = {
				desc_id = m_bmtl_acc_rlars
			}
			cas_male_acc_face = {
				desc_id = None
			}
			cas_guitar_body = {
				desc_id = gtr9_esp_ax
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr9_esp_ax_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_esp_eclipse_ld_11`
								flags = 4
								Color = red_1
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
						pre_layer = [
							{
								Color = grey_5
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_neckhead_ld_11`
								flags = 36
								Color = red_1
							}
						]
					}
				]
			}
			cas_guitar_pickguards = {
				desc_id = None
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
				desc_id = None
			}
			cas_bass_body = {
				desc_id = bs_sch_t_body
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\schecter\bs_sch_modelt`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_dtl01`
								Color = black_1guitar
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
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_inl_ld30`
								flags = 4
								Color = grey_5guitar
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
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_hd_dtl06`
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
				desc_id = None
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
								Color = grey_3guitar
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
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
				desc_id = metal
			}
			cas_mic_stand = {
				desc_id = goth
			}
		}
	}
	{
		Name = gh_rocker_demigod_band_003
		fullname = qs(0x3530238f)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x27686745)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = black_metal
			cas_body = {
				desc_id = gh4_car_male
			}
			cas_male_physique = {
				desc_id = malephysique7
			}
			cas_eyes = {
				desc_id = car_dead_eyes
			}
			cas_male_eyebrows = {
				desc_id = car_default_brow
			}
			cas_male_hair = {
				desc_id = m_bmtl_hair_lars4
			}
			cas_male_hat_hair = {
				desc_id = None
			}
			cas_male_hat = {
				desc_id = m_bmtl_hat_skullhelmet
			}
			cas_male_facial_hair = {
				desc_id = None
			}
			cas_male_torso = {
				desc_id = m_bmtl_torso_skeleton
			}
			cas_male_legs = {
				desc_id = m_bmtl_legs_lars_3
			}
			cas_male_shoes = {
				desc_id = m_glam_shoe_wrestler
				chosen_materials = {
					material1 = carblack_1
				}
			}
			cas_male_acc_left = {
				desc_id = m_bmtl_acc_llars
			}
			cas_male_acc_right = {
				desc_id = m_mtl_accr_axel4
				chosen_materials = {
					material2 = grey_5
					material3 = grey_5
					material1 = grey_1
				}
			}
			cas_male_acc_face = {
				desc_id = None
			}
			cas_guitar_body = {
				desc_id = gtr9_esp_ax
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr9_esp_ax_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_esp_eclipse_ld_11`
								flags = 4
								Color = red_1
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
						pre_layer = [
							{
								Color = grey_5
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/esp/gtr9_neckhead_ld_11`
								flags = 36
								Color = red_1
							}
						]
					}
				]
			}
			cas_guitar_pickguards = {
				desc_id = None
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
				desc_id = None
			}
			cas_bass_body = {
				desc_id = bs_sch_t_body
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\schecter\bs_sch_modelt`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_dtl01`
								Color = black_1guitar
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
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_inl_ld30`
								flags = 4
								Color = grey_5guitar
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
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_hd_dtl06`
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
				desc_id = None
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
								Color = grey_3guitar
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
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
				desc_id = metal
			}
			cas_mic_stand = {
				desc_id = goth
			}
		}
	}
	{
		Name = gh_rocker_demigodscaled
		fullname = qs(0xe7b2d009)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_lars
		blurb = qs(0xff57bb33)
		face_tension = 0
		locked
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = `heavy	metal`
			model_scale = 8
			additional_light_group = ampzilla
			cas_full_body = {
				desc_id = demigod_scaled
			}
			cas_full_guitar = {
				desc_id = gtr137_demi_cinematic
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
								Color = grey_3guitar
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
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
		Name = silhouette
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		selection_not_allowed
		no_instruments
		appearance = {
			cas_full_body = {
				desc_id = silhouette_net
			}
		}
	}
	{
		Name = emptyguy
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		selection_not_allowed
		no_instruments
		appearance = $empty_appearance
	}
]
preset_musician_profiles_debug = [
	{
		Name = worstfemalecharacter
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
		Name = worstmalecharacter
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
		Name = bloke
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
			genre = `classic	rock`
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
				desc_id = m_pop_hair_buzz
			}
			cas_male_hat = {
				desc_id = None
			}
			cas_male_facial_hair = {
				desc_id = None
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
				desc_id = None
			}
			cas_male_acc_face = {
				desc_id = None
			}
			cas_male_age = {
				desc_id = car_male_teen
			}
			cas_male_teeth = {
				desc_id = car_male_teeth
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
								Color = black_1guitar
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gh5/22_fret_ld01_hero_dots`
								flags = 4
								Color = grey_4guitar
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
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cag/bc_rich/gtr20_neckhead_ld02`
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
				desc_id = bass_schect_030
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\schecter\bs_sch_bod04_01`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_bod04_ld03`
								flags = 4
								Color = red_orange_3
							}
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_bod04_dtl04`
								flags = 4
								Color = red_2
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
								texture = `tex/models/characters/layers/cab/schecter/bs_sch22_inl_ld30`
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
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_04_hd_dtl07`
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_48`
								flags = 4
								Color = yellow_3guitar
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
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
		Name = drummerbloke
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
			genre = `classic	rock`
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
				desc_id = None
			}
			cas_male_facial_hair = {
				desc_id = None
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
				desc_id = None
			}
			cas_male_acc_face = {
				desc_id = None
			}
			cas_male_age = {
				desc_id = car_male_teen
			}
			cas_male_teeth = {
				desc_id = car_male_teeth
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
								Color = black_1guitar
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gh5/22_fret_ld01_hero_dots`
								flags = 4
								Color = grey_4guitar
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
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cag/bc_rich/gtr20_neckhead_ld02`
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
				desc_id = bass_schect_030
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\schecter\bs_sch_bod04_01`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_bod04_ld03`
								flags = 4
								Color = red_orange_3
							}
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_bod04_dtl04`
								flags = 4
								Color = red_2
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
								texture = `tex/models/characters/layers/cab/schecter/bs_sch22_inl_ld30`
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
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_04_hd_dtl07`
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
				desc_id = knob_knurl02
			}
			cas_bass_misc = {
				desc_id = None
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
