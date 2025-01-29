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
			desc_id = gtr_pickup_type2_paf2
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
		Name = gh_rocker_frankenrocker
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
			genre = `heavy	metal`
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
				desc_id = gtr_pickup_type2_paf2
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
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_09`
								flags = 32
								Color = green_3guitar
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_skin_ld96`
								flags = 4
								Color = purple_blue_2
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
				desc_id = `chain	saw`
			}
		}
	}
	{
		Name = gh_rocker_2009_1_001
		fullname = qs(0x0368d757)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x05d6ae51)
		no_random_pick
		selection_not_allowed
		appearance = {
			body_preset_index = 3
			genre = punk
			cag_preset_index = 3
			cas_body = {
				desc_id = gh4_car_male
				bones = {
					mouthposition = 0.0
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
					lipshapeupper = 1.0
					upperlipthickness = 1.0
					lowerlipthickness = 1.0
					noseposition = 0.4
					noselength = 0.2
					eyebrowsize = 0.8
					eyebrowangle = 0.9
					eyebrowdistance = -1.0
					browposition = 0.0
					browdepth = 1.0
					jawprominence = 1.0
					jawshape = 1.0
					chinprominence = 1.0
					chinwidth = 0.0
					chinheight = 0.0
					chinangle = 0.0
					cheekboneprominence = 1.0
					cheekbonedepth = 0.0
					earsize = 0.0
					earshape = 0.9
					earprominence = 0.9
					eartip = 0.2
					facefullness = 0.0
					mouthscale = 0.5
					mouthangle = 0.7
					mouthdepth = 0.0
				}
				chosen_materials = {
					eyebrows = blue_4
					skin = skin_white5
				}
			}
			cas_male_physique = {
				desc_id = malephysique1
			}
			cas_eyes = {
				desc_id = car_blank_eyes
			}
			cas_male_eyebrows = {
				desc_id = car_uni_brow
			}
			cas_male_hair = {
				desc_id = m_rock_hair_braids
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
				desc_id = m_goth_torso_poet
				chosen_materials = {
					material1 = blue_5
				}
			}
			cas_male_legs = {
				desc_id = m_goth_legs_tux
				chosen_materials = {
					material1 = blue_5
				}
			}
			cas_male_shoes = {
				desc_id = m_metl_shoes_stubs
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
			cas_male_acc_ears = {
				desc_id = m_punk_acc_ring_02
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
				desc_id = newtamatriple
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_49`
								flags = 32
								Color = orange_3
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_skin_ld92`
								flags = 4
								Color = yellow_orange_3
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
		Name = gh_rocker_2009_1_002
		fullname = qs(0x28458494)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x317cddc6)
		no_random_pick
		appearance = {
			body_preset_index = 3
			genre = `classic	rock`
			cas_body = {
				desc_id = gh4_car_female
				chosen_materials = {
					skin = skin_black4
				}
				bones = {
					eyedistance = 0.4
					eyeshape = 1.0
					eyecornershape = 0.767
					eyeangle = 0.861
					eyeposition = 1.0
					nosetipheight = 0.9
					nosetipwidth = 1.0
					nosetiplength = 0.1
					nosesize = 0.0
					nosewidth = 0.833
					noseposition = 1.0
					nosenostrilheight = 1.0
					nosenostrilangle = 0.7
					noselength = 0.6
					nosebridge = 0.3
					lipshapeupper = 0.928
					lowerlipthickness = 0.8
					lipshapelower = 1.0
					upperlipthickness = 0.54800004
					mouthposition = 0.7
					mouthscale = 0.0
					eyescale = 0.214
					chinwidth = 1.0
					facefullness = 0.6
				}
				cap = [
					{
						base_tex = `tex/models/characters/global/global_blank_head_dnc`
						post_layer = [
							{
								texture = `tex/models/characters/layers/car/female/makeup/car_female_eyeshadow_a02`
								Color = navy_2
							}
							{
								texture = `tex/models/characters/layers/car/female/makeup/car_female_lipstick_03`
								a = 45
								Color = hairred_orange_3
							}
						]
					}
				]
			}
			cas_female_physique = {
				desc_id = femalephysique1
			}
			cas_eyes = {
				desc_id = car_brown_eyes
			}
			cas_female_eyebrows = {
				desc_id = car_default_thick_brow
			}
			cas_female_hair = {
				desc_id = f_goth_hair_pndrcrow
				chosen_materials = {
					material1 = hairred_1
					material2 = carblack_1
				}
			}
			cas_female_hat_hair = {
				desc_id = f_goth_hathair_pndrcrow
				chosen_materials = {
					material1 = hairred_1
					material2 = carblack_1
				}
			}
			cas_female_hat = {
				desc_id = f_rock_hat_cowboy
				chosen_materials = {
					material1 = blue_5
					material2 = blue_2
				}
			}
			cas_female_facial_hair = {
				desc_id = None
			}
			cas_female_torso = {
				desc_id = f_metl_torso_lacetank
				chosen_materials = {
					material2 = blue_5
					material1 = carblack_1
				}
			}
			cas_female_legs = {
				desc_id = f_punk_legs_judynails2
			}
			cas_female_shoes = {
				desc_id = f_goth_shoe_cyberb
				chosen_materials = {
					material1 = carblack_3
					material2 = blue_5
					material3 = blue_5
				}
			}
			cas_female_acc_left = {
				desc_id = f_clsc_acc_lbeads
			}
			cas_female_acc_right = {
				desc_id = None
			}
			cas_female_acc_face = {
				desc_id = None
			}
			cas_female_acc_ears = {
				desc_id = None
			}
			cas_female_age = {
				desc_id = car_female_teen
			}
			cas_female_teeth = {
				desc_id = car_female_teeth
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
				desc_id = doublebass
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld01`
								flags = 32
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_pork3`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_15`
								flags = 4
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
				desc_id = `classic	rock`
			}
			cas_mic_stand = {
				desc_id = `classic	rock`
			}
		}
	}
	{
		Name = gh_rocker_2009_1_003
		fullname = qs(0x315eb5d5)
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
			body_preset_index = 0
			genre = `black	metal`
			0xfc00902f = 0
			cas_body = {
				desc_id = gh4_car_male
				bones = {
					mouthscale = 0.0
					mouthangle = 0.0
					mouthdepth = 0.5
					mouthposition = 0.0
					eyeshape = 0.0
					eyescale = 0.7
					eyecornershape = 0.5
					eyeangle = 0.5
					eyeposition = 0.0
					eyedistance = 0.0
					nosetiplength = 0.0
					nosetipangle = 1.0
					nosenostrilsize = 0.0
					nosenostrilheight = 1.0
					nosesize = 0.6
					nosewidth = 0.0
					noselength = 0.8
					noseangle = 0.7
					noseposition = 0.3
					nosetipheight = 0.9
					nosetipwidth = 0.3
					eyebrowsize = 1.0
					eyebrowangle = 0.8
					eyebrowdistance = -0.7
					browposition = 0.2
					browdepth = 0.7
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
				desc_id = None
			}
			cas_male_hat_hair = {
				desc_id = None
			}
			cas_male_hat = {
				desc_id = m_fun_hat_ww2helmet
				chosen_materials = {
					material1 = grey_1
				}
			}
			cas_male_facial_hair = {
				desc_id = None
			}
			cas_male_torso = {
				desc_id = m_bmtl_torso_skeletonbelt
				chosen_materials = {
					material2 = blue_5
					material1 = grey_5
				}
			}
			cas_male_legs = {
				desc_id = m_punk_legs_jzip
				chosen_materials = {
					material1 = blue_4
				}
			}
			cas_male_shoes = {
				desc_id = m_goth_shoes_buckleb
			}
			cas_male_acc_left = {
				desc_id = m_bmtl_acc_ltripleband
			}
			cas_male_acc_right = {
				desc_id = m_bmtl_acc_rlongspike
			}
			cas_male_acc_face = {
				desc_id = None
			}
			cas_male_acc_ears = {
				desc_id = None
			}
			cas_male_age = {
				desc_id = car_male_teen
			}
			cas_male_teeth = {
				desc_id = car_male_teeth
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
				desc_id = bass9_esp_ax_01
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\esp\bass9_esp_ax_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/esp/bass9_esp_ax_ld_01`
								Color = grey_2guitar
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
				desc_id = doublebass
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld46`
								flags = 32
								Color = black_1guitar
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_pork3`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_15`
								flags = 4
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
				desc_id = mic_standard
			}
			cas_mic_stand = {
				desc_id = mic_stand_metal
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
				chosen_materials = {
					eyebrows = carblack_2
					skin = skin_black5
				}
				bones = {
					facefullness = 0.4
					jawprominence = 0.7
					jawshape = 0.0
					chinprominence = 0.7
					chinwidth = 1.0
					chinangle = 0.8
					chinheight = 0.7
					mouthposition = 0.7
					noselength = 0.2
					nosewidth = 0.7
					nosesize = 0.4
					noseposition = 1.0
					nosetipwidth = 1.0
					eyescale = 0.514
					eyedistance = -0.8
					eyeangle = 0.7
					eyecornershape = 0.137
					eyeshape = 0.0
					browposition = 0.0
					eyebrowdistance = -0.756
					eyebrowangle = 0.9
					eyebrowsize = 0.0
					browdepth = 0.6
					lipshapelower = 0.6
					mouthscale = 0.467
					upperlipthickness = 0.7
					lowerlipthickness = 0.7
					lipshapeupper = 0.8
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
				desc_id = m_rock_hair_guitarist
				chosen_materials = {
					material1 = carblack_2
				}
			}
			cas_male_hat = {
				desc_id = None
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
				desc_id = m_rock_legs_ozzypants
			}
			cas_male_shoes = {
				desc_id = m_rock_shoe_straps
			}
			cas_male_acc_left = {
				desc_id = m_punk_acc_lmetalskull
			}
			cas_male_acc_right = {
				desc_id = m_punk_acc_rrings
			}
			cas_male_acc_face = {
				desc_id = m_clsc_glasses_avtr
			}
			cas_male_acc_ears = {
				desc_id = m_punk_acc_ring_02
			}
			cas_male_age = {
				desc_id = car_male_teen
			}
			cas_male_teeth = {
				desc_id = car_male_teeth
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
				desc_id = newtamadouble
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								Color = red_3
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_18`
								flags = 32
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_skin_ld09`
								flags = 4
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
				desc_id = mic_stand_metal
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
				bones = {
					facefullness = 0.3
					jawprominence = 0.0
					jawshape = 0.0
					chinprominence = 0.0
					chinwidth = 1.0
					chinheight = 0.0
					chinangle = 0.5
					chincleft = 0.5
					waddle = 1.0
					cheekboneprominence = 0.343
					cheekbonedepth = 0.7
					mouthscale = 0.3
					mouthangle = 0.5
					mouthdepth = 0.6
					mouthposition = 0.51199996
					lipshapeupper = 0.45000002
					lipshapelower = 0.3
					upperlipthickness = 0.54800004
					lowerlipthickness = 0.696
				}
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
				desc_id = m_punk_torso_beater
				chosen_materials = {
					material1 = carblack_3
				}
			}
			cas_male_legs = {
				desc_id = m_rock_legs_ripjeans
				chosen_materials = {
					material1 = carblack_3
				}
			}
			cas_male_shoes = {
				desc_id = m_metl_shoe_axel_1
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
			cas_male_acc_ears = {
				desc_id = m_punk_acc_ring
			}
			cas_male_age = {
				desc_id = car_male_teen
			}
			cas_male_teeth = {
				desc_id = car_male_teeth
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
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld31`
								flags = 32
								Color = orange_3
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_15`
								flags = 4
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
				bones = {
					eyedistance = 0.4
					eyeshape = 1.0
					eyecornershape = 0.767
					eyeangle = 0.861
					eyeposition = 1.0
					nosetipheight = 0.9
					nosetipwidth = 1.0
					nosetiplength = 0.1
					nosesize = 0.0
					nosewidth = 0.833
					noseposition = 1.0
					nosenostrilheight = 1.0
					nosenostrilangle = 0.7
					noselength = 0.6
					nosebridge = 0.3
					lipshapeupper = 0.928
					lowerlipthickness = 0.8
					lipshapelower = 1.0
					upperlipthickness = 0.54800004
					mouthposition = 0.7
					mouthscale = 0.0
					eyescale = 0.214
					chinwidth = 1.0
					facefullness = 0.6
				}
				chosen_materials = {
					skin = skin_white3
				}
				cap = [
					{
						base_tex = `tex/models/characters/global/global_blank_head_dnc`
						post_layer = [
							{
								texture = `tex/models/characters/layers/car/female/makeup/car_female_eyeshadow_a02`
								Color = navy_2
							}
							{
								texture = `tex/models/characters/car/car_shared_none5`
								flags = 4
							}
							{
								texture = `tex/models/characters/layers/car/female/makeup/car_female_lipstick_01`
								Color = hairred_2
							}
						]
					}
				]
			}
			cas_female_physique = {
				desc_id = femalephysique1
				bones = {
					height = 0.25
				}
			}
			cas_eyes = {
				desc_id = car_brown_eyes
			}
			cas_female_eyebrows = {
				desc_id = car_default_thick_brow
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
				desc_id = f_punk_torso_tanktop
				chosen_materials = {
					material2 = yellow_orange_2
				}
			}
			cas_female_legs = {
				desc_id = f_rock_legs_ripjeans
				chosen_materials = {
					material1 = carblack_3
				}
			}
			cas_female_shoes = {
				desc_id = f_goth_shoe_pndr3buckle
				chosen_materials = {
					material1 = grey_1
				}
			}
			cas_female_acc_left = {
				desc_id = f_punk_acc_lbands
			}
			cas_female_acc_right = {
				desc_id = f_clsc_accs_rbracelet
			}
			cas_female_acc_face = {
				desc_id = f_pop_glasses_designer
			}
			cas_female_acc_ears = {
				desc_id = f_punk_acc_ring_02
			}
			cas_female_age = {
				desc_id = car_female_teen
			}
			cas_female_teeth = {
				desc_id = car_female_teeth
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
				desc_id = newtamatriple
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_49`
								flags = 32
								Color = orange_3
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_skin_ld92`
								flags = 4
								Color = yellow_orange_3
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
			genre = black_metal
			cas_body = {
				desc_id = gh4_car_female
				bones = {
					facefullness = 0.7
					jawprominence = 0.8
					nosewidth = 0.8
					noselength = 0.1
					noseangle = 0.4
					noseposition = 0.35000002
					nosetipheight = 0.3
					nosetipwidth = 1.0
					nosetiplength = 0.4
					nosetipangle = 0.5
					nosenostrilsize = 0.7
					lipshapeupper = 1.0
					lipshapelower = 1.0
					mouthposition = 0.4
					mouthdepth = 0.4
					mouthangle = 0.6
					mouthscale = 0.6
					lowerlipthickness = 0.59599996
					upperlipthickness = 0.7
					eyedistance = -0.2
					eyescale = 0.5
					eyeshape = 1.0
					eyecornershape = 0.56700003
					eyeangle = 0.483
					eyeposition = 0.311
				}
				cap = [
					{
						base_tex = `tex/models/characters/global/global_blank_head_dnc`
						post_layer = [
							{
								texture = `tex/models/characters/layers/car/female/makeup/car_female_eyeshadow_a03`
								Color = carblack_1
							}
							{
								texture = `tex/models/characters/layers/car/female/makeup/car_female_eyeliner_06`
								Color = black_1
							}
							{
								texture = `tex/models/characters/layers/car/female/makeup/car_female_lipstick_01`
								Color = carblack_1
							}
						]
					}
				]
				chosen_materials = {
					skin = skin_black1
					eyebrows = carblack_2
					nails = carblack_1
				}
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
			cas_female_acc_ears = {
				desc_id = f_punk_acc_ring
			}
			cas_female_age = {
				desc_id = car_female_teen
			}
			cas_female_teeth = {
				desc_id = car_female_teeth02
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
				desc_id = newtamadouble
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld11`
								flags = 32
								Color = red_3
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_skin_ld34`
								flags = 4
								Color = green_3guitar
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
			genre = black_metal
			cas_body = {
				desc_id = gh4_car_male
				chosen_materials = {
					skin = skin_white4
					nails = carblack_1
					eyebrows = carblack_1
				}
				bones = {
					jawprominence = 0.0
					cheekbonedepth = 0.7
					nosewidth = 0.0
					nosetipwidth = 1.0
					nosenostrilangle = 0.6
					nosenostrilheight = 0.4
					nosenostrilsize = 0.7
					noseangle = 0.66700006
					nosetipheight = 1.0
					lipshapeupper = 0.883
					upperlipthickness = 0.64800006
					lowerlipthickness = 1.0
					noselength = 0.767
					mouthdepth = 0.8
					mouthposition = 0.1
					noseposition = 0.122
					eyeangle = 0.5
					eyecornershape = 0.0
					eyeposition = 1.0
					eyebrowdistance = -0.056
					browposition = 0.0
					eyebrowangle = 0.29
					eyebrowsize = 0.2
					eyescale = 0.5
					eyeshape = 0.8
					eyedistance = -0.614
					mouthscale = 0.767
					nosesize = 1.0
					facefullness = 0.0
					jawshape = 1.0
					chinprominence = 0.6
					waddle = 1.0
					cheekboneprominence = 0.348
				}
				cap = [
					{
						base_tex = `tex/models/characters/global/global_blank_head_dnc`
						post_layer = [
							{
								texture = `tex/models/characters/layers/car/male/makeup/car_male_eyeshadow_b01`
								Color = carblack_1
							}
							{
								texture = `tex/models/characters/layers/car/male/makeup/car_male_eyeshadow_c02`
								Color = carblack_1
							}
							{
								texture = `tex/models/characters/layers/car/male/makeup/car_male_eyeliner_01`
								Color = black_1
							}
							{
								texture = `tex/models/characters/car/car_shared_none6`
								flags = 4
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
								y_trans = 16
								x_scale = 56
								y_scale = 95
								flags = 3
								Color = grey_5guitar
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
								Color = grey_4guitar
								y_trans = 16
								x_scale = 56
								flags = 3
								y_scale = 121
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_icon_veggie004`
								Color = black_1guitar
								x_trans = 0
								x_scale = 30
								y_scale = 67
								flags = 3
								y_trans = -10
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
								Color = black_1guitar
								x_trans = -15
								y_trans = 16
								y_scale = 24
								flags = 3
								x_scale = 32
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_icon_veggie004`
								Color = black_1guitar
								x_trans = 0
								x_scale = 30
								y_scale = 72
								flags = 3
								y_trans = 45
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001`
								Color = black_1guitar
								y_trans = 15
								x_scale = 36
								y_scale = 33
								flags = 3
								x_trans = 18
							}
						]
					}
				]
			}
			cas_male_physique = {
				desc_id = malephysique4
				bones = {
					height = -0.75
				}
			}
			cas_eyes = {
				desc_id = car_blue_eyes
			}
			cas_male_eyebrows = {
				desc_id = car_rounded
			}
			cas_male_hair = {
				desc_id = m_metl_hair_axel_4
				chosen_materials = {
					material1 = carblack_1
				}
			}
			cas_male_facial_hair = {
				desc_id = None
			}
			cas_male_torso = {
				desc_id = m_bmtl_torso_lars4
			}
			cas_male_legs = {
				desc_id = m_bmtl_legs_beltpants
			}
			cas_male_shoes = {
				desc_id = m_bmtl_shoes_combat
			}
			cas_male_acc_left = {
				desc_id = m_bmtl_acc_llars4
			}
			cas_male_acc_right = {
				desc_id = m_bmtl_acc_rwristguard
			}
			cas_male_acc_ears = {
				desc_id = None
			}
			cas_male_age = {
				desc_id = car_male_teen
			}
			cas_male_teeth = {
				desc_id = car_male_teeth02
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
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld49`
								flags = 32
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_15`
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
				cas_male_physique = {
					desc_id = malephysique1
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
					nosewidth = 0.4
					noselength = 0.9
					noseposition = 0.6
					nosenostrilsize = 1.0
					lipshapeupper = 0.783
					eyecornershape = 1.0
					eyebrowsize = 0.0
					eyebrowdistance = -0.8
					eyebrowangle = 1.0
					cheekboneprominence = 0.24800001
					cheekbonedepth = 0.4
					headsize = 0.0
					facefullness = 0.5
					eyeangle = 0.5
					nosebridge = 0.3
					eyedistance = -1.0
					noseangle = 0.0
					eyescale = 0.2
					upperlipthickness = 0.6
					lowerlipthickness = 0.4
					lipshapelower = 0.7
					mouthposition = 0.4
					mouthscale = 0.5
					nosesize = 0.6
				}
				chosen_materials = {
					skin = skin_asian4
					eyebrows = carblack_2
					nails = carblack_1
				}
				cap = [
					{
						base_tex = `tex/models/characters/global/global_blank_head_dnc`
						post_layer = [
							{
								texture = `tex/models/characters/car/car_shared_none5`
								flags = 4
							}
							{
								texture = `tex/models/characters/layers/car/male/makeup/car_male_eyeliner_01`
								Color = black_1
							}
							{
								texture = `tex/models/characters/layers/car/male/makeup/car_male_lipstick_01`
								Color = grey_5
							}
						]
					}
				]
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
			cas_male_acc_ears = {
				desc_id = m_punk_acc_ring_03
			}
			cas_male_age = {
				desc_id = car_male_teen
			}
			cas_male_teeth = {
				desc_id = car_male_teeth01
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
								texture = `tex/models/characters/layers/cadrm/gh5_skin_ld65`
								flags = 4
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
				desc_id = metal
			}
			cas_mic_stand = {
				desc_id = goth
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
				chosen_materials = {
					nails = carblack_1
					skin = skin_white4
					eyebrows = yellow_orange_1
				}
				cap = [
					{
						base_tex = `tex\models\characters\car\female\car_female_armr_tat_o_dnc`
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics018`
								Color = teal_1
								a = 70
								y_trans = 27
								x_skew = 0
								x_scale = 56
								y_scale = 30
								flags = 3
								x_trans = 11
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_banners007`
								Color = teal_1
								x_trans = 7
								y_trans = -20
								x_skew = 21
								x_scale = 41
								y_scale = 36
								rot = 1770
								flags = 3
								a = 75
							}
						]
					}
					{
						base_tex = `tex\models\characters\car\female\car_female_arml_tat_o_dnc`
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics096`
								Color = teal_1
								a = 80
								y_trans = 24
								x_scale = 60
								y_scale = 51
								flags = 3
								x_trans = -8
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_icon023`
								Color = teal_1
								a = 65
								x_trans = -14
								y_trans = -19
								x_scale = 30
								y_scale = 30
								flags = 3
								rot = 5953
							}
						]
					}
					{
						base_tex = `tex\models\characters\car\female\car_female_body_tat_o_dnc`
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics039`
								Color = teal_2
								a = 75
								y_trans = 22
								y_scale = 30
								flags = 3
								x_scale = 47
							}
						]
					}
				]
				bones = {
					nosewidth = 0.0
					noselength = 0.767
					browposition = 0.0
					jawshape = 1.0
					chinprominence = 1.0
					chinheight = 0.4
					chinangle = 0.8
					chincleft = 0.6
					waddle = 1.0
					earlobesize = 0.4
					noseangle = 0.5
					nosetipwidth = 0.7
					nosetipangle = 1.0
					nosenostrilsize = 0.1
					nosenostrilheight = 0.4
					nosenostrilangle = 0.4
					nosebridge = 0.3
					eyebrowdistance = -0.35600004
					nosesize = 0.7
					mouthdepth = 0.0
					lipshapelower = 0.0
					upperlipthickness = 0.7
					lowerlipthickness = 0.2
					lipshapeupper = 0.8
					mouthangle = 0.1
					eyeshape = 0.0
					eyecornershape = 0.7
					eyeposition = 0.2
					facefullness = 0.3
					jawprominence = 0.0
					earsize = 0.5
					earprominence = 0.438
					earshape = 0.0
					eyescale = 0.3
					eyedistance = -0.3
					nosetipheight = 0.1
					nosetiplength = 0.1
					eyeangle = 0.5
					chinwidth = 1.0
					browdepth = 0.6
					eyebrowsize = 0.7
					cheekboneprominence = 0.0
					cheekbonedepth = 0.2
					mouthposition = 0.0
					noseposition = 0.7
					eyebrowangle = 0.39000002
					mouthscale = 0.5
				}
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
				desc_id = m_punk_hair_spike
				chosen_materials = {
					material1 = hairred_3
				}
			}
			cas_male_hat = {
				desc_id = None
			}
			cas_male_facial_hair = {
				desc_id = m_clsc_fhair_soulpatch
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
			cas_male_acc_ears = {
				desc_id = m_punk_acc_ring_03
			}
			cas_male_age = {
				desc_id = car_male_teen
			}
			cas_male_teeth = {
				desc_id = car_male_teeth
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
				desc_id = newtamatriple
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_49`
								flags = 32
								Color = orange_3
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_skin_ld92`
								flags = 4
								Color = yellow_orange_3
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
				cap = [
					{
						base_tex = `tex/models/characters/global/global_blank_head_dnc`
						post_layer = [
							{
								texture = `tex/models/characters/layers/car/male/makeup/car_male_eyeliner_01`
								Color = black_1
							}
						]
					}
				]
				chosen_materials = {
					eyebrows = carblack_2
					skin = skin_white3
				}
				bones = {
					nosesize = 0.7
					noselength = 0.8
					nosetipwidth = 1.0
					nosetipheight = 1.0
					nosetipangle = 1.0
					mouthdepth = 0.0
					mouthscale = 0.6
					lowerlipthickness = 0.8
					mouthangle = 0.0
					lipshapeupper = 1.0
					upperlipthickness = 0.5
					eyeangle = 0.683
					eyebrowsize = 0.688
					eyebrowangle = 0.3
					browdepth = 0.4
					eyecornershape = 0.4
					eyeshape = 0.0
					chinwidth = 0.0
					chinheight = 0.0
					cheekboneprominence = 0.1
					jawshape = 0.5
					jawprominence = 0.0
					facefullness = 0.3
					mouthposition = 0.3
					browposition = 0.0
					eyedistance = -0.343
					eyescale = 0.214
					eyeposition = 0.8
				}
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
				desc_id = m_punk_torso_jstripe
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
			cas_male_acc_ears = {
				desc_id = m_punk_acc_ring_02
			}
			cas_male_age = {
				desc_id = car_male_mature
			}
			cas_male_teeth = {
				desc_id = car_male_teeth
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
				desc_id = newtamatriple
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_49`
								flags = 32
								Color = orange_3
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_skin_ld92`
								flags = 4
								Color = yellow_orange_3
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
		no_random_pick
		selection_not_allowed
		no_random_pick
		selection_not_allowed
		no_random_pick
		selection_not_allowed
		Name = 0x62bd36c6
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
			genre = punk
			cas_body = {
				desc_id = gh4_car_male
				bones = {
					lowerlipthickness = 0.296
					upperlipthickness = 0.148
					browdepth = 0.0
					browposition = 0.0
					eyebrowdistance = 0.333
					mouthscale = 0.4
					nosewidth = 0.9
					noselength = 0.0
				}
			}
			cas_male_physique = {
				desc_id = malephysique1
				bones = {
					height = 1.0
				}
			}
			cas_eyes = {
				desc_id = car_brown_eyes
			}
			cas_male_eyebrows = {
				desc_id = car_angled
			}
			cas_male_hair = {
				desc_id = m_bmtl_hair_lars_3
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
				desc_id = m_rock_torso_ozzycoat
			}
			cas_male_legs = {
				desc_id = m_rock_legs_jeans
				chosen_materials = {
					material1 = carblack_1
					material2 = carblack_1
				}
			}
			cas_male_shoes = {
				desc_id = m_bmtl_shoes_kdboots
				chosen_materials = {
					material1 = carblack_1
				}
			}
			cas_male_acc_left = {
				desc_id = m_punk_acc_bullets
			}
			cas_male_acc_right = {
				desc_id = m_glam_acc_rbaggywarmer
			}
			cas_male_acc_face = {
				desc_id = None
			}
			cas_male_acc_ears = {
				desc_id = None
			}
			cas_male_age = {
				desc_id = car_male_teen
			}
			cas_male_teeth = {
				desc_id = car_male_teeth
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
				desc_id = doublebass
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								Color = grey_4guitar
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_06`
								flags = 32
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_pork3`
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
			body_preset_index = 3
			genre = punk
			cag_preset_index = 3
			cas_body = {
				desc_id = gh4_car_male
				bones = {
					mouthposition = 0.0
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
					lipshapeupper = 1.0
					upperlipthickness = 1.0
					lowerlipthickness = 1.0
					noseposition = 0.4
					noselength = 0.2
					eyebrowsize = 0.8
					eyebrowangle = 0.9
					eyebrowdistance = -1.0
					browposition = 0.0
					browdepth = 1.0
					jawprominence = 1.0
					jawshape = 1.0
					chinprominence = 1.0
					chinwidth = 0.0
					chinheight = 0.0
					chinangle = 0.0
					cheekboneprominence = 1.0
					cheekbonedepth = 0.0
					earsize = 0.0
					earshape = 0.9
					earprominence = 0.9
					eartip = 0.2
					facefullness = 0.0
					mouthscale = 0.5
					mouthangle = 0.7
					mouthdepth = 0.0
				}
				chosen_materials = {
					eyebrows = blue_4
					skin = skin_white5
				}
			}
			cas_male_physique = {
				desc_id = malephysique1
			}
			cas_eyes = {
				desc_id = car_blank_eyes
			}
			cas_male_eyebrows = {
				desc_id = car_uni_brow
			}
			cas_male_hair = {
				desc_id = m_rock_hair_braids
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
				desc_id = m_goth_torso_poet
				chosen_materials = {
					material1 = blue_5
				}
			}
			cas_male_legs = {
				desc_id = m_goth_legs_tux
				chosen_materials = {
					material1 = blue_5
				}
			}
			cas_male_shoes = {
				desc_id = m_metl_shoes_stubs
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
			cas_male_acc_ears = {
				desc_id = m_punk_acc_ring_02
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
				desc_id = newtamatriple
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_49`
								flags = 32
								Color = orange_3
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_skin_ld92`
								flags = 4
								Color = yellow_orange_3
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
		appearance = {
			body_preset_index = 3
			genre = `classic	rock`
			cas_body = {
				desc_id = gh4_car_female
				chosen_materials = {
					skin = skin_black4
				}
				bones = {
					eyedistance = 0.4
					eyeshape = 1.0
					eyecornershape = 0.767
					eyeangle = 0.861
					eyeposition = 1.0
					nosetipheight = 0.9
					nosetipwidth = 1.0
					nosetiplength = 0.1
					nosesize = 0.0
					nosewidth = 0.833
					noseposition = 1.0
					nosenostrilheight = 1.0
					nosenostrilangle = 0.7
					noselength = 0.6
					nosebridge = 0.3
					lipshapeupper = 0.928
					lowerlipthickness = 0.8
					lipshapelower = 1.0
					upperlipthickness = 0.54800004
					mouthposition = 0.7
					mouthscale = 0.0
					eyescale = 0.214
					chinwidth = 1.0
					facefullness = 0.6
				}
				cap = [
					{
						base_tex = `tex/models/characters/global/global_blank_head_dnc`
						post_layer = [
							{
								texture = `tex/models/characters/layers/car/female/makeup/car_female_eyeshadow_a02`
								Color = navy_2
							}
							{
								texture = `tex/models/characters/layers/car/female/makeup/car_female_lipstick_03`
								a = 45
								Color = hairred_orange_3
							}
						]
					}
				]
			}
			cas_female_physique = {
				desc_id = femalephysique1
			}
			cas_eyes = {
				desc_id = car_brown_eyes
			}
			cas_female_eyebrows = {
				desc_id = car_default_thick_brow
			}
			cas_female_hair = {
				desc_id = f_goth_hair_pndrcrow
				chosen_materials = {
					material1 = hairred_1
					material2 = carblack_1
				}
			}
			cas_female_hat_hair = {
				desc_id = f_goth_hathair_pndrcrow
				chosen_materials = {
					material1 = hairred_1
					material2 = carblack_1
				}
			}
			cas_female_hat = {
				desc_id = f_rock_hat_cowboy
				chosen_materials = {
					material1 = blue_5
					material2 = blue_2
				}
			}
			cas_female_facial_hair = {
				desc_id = None
			}
			cas_female_torso = {
				desc_id = f_metl_torso_lacetank
				chosen_materials = {
					material2 = blue_5
					material1 = carblack_1
				}
			}
			cas_female_legs = {
				desc_id = f_punk_legs_judynails2
			}
			cas_female_shoes = {
				desc_id = f_goth_shoe_cyberb
				chosen_materials = {
					material1 = carblack_3
					material2 = blue_5
					material3 = blue_5
				}
			}
			cas_female_acc_left = {
				desc_id = f_clsc_acc_lbeads
			}
			cas_female_acc_right = {
				desc_id = None
			}
			cas_female_acc_face = {
				desc_id = None
			}
			cas_female_acc_ears = {
				desc_id = None
			}
			cas_female_age = {
				desc_id = car_female_teen
			}
			cas_female_teeth = {
				desc_id = car_female_teeth
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
				desc_id = doublebass
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld01`
								flags = 32
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_pork3`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_15`
								flags = 4
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
				desc_id = `classic	rock`
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
			body_preset_index = 0
			genre = `black	metal`
			0xfc00902f = 0
			cas_body = {
				desc_id = gh4_car_male
				bones = {
					mouthscale = 0.0
					mouthangle = 0.0
					mouthdepth = 0.5
					mouthposition = 0.0
					eyeshape = 0.0
					eyescale = 0.7
					eyecornershape = 0.5
					eyeangle = 0.5
					eyeposition = 0.0
					eyedistance = 0.0
					nosetiplength = 0.0
					nosetipangle = 1.0
					nosenostrilsize = 0.0
					nosenostrilheight = 1.0
					nosesize = 0.6
					nosewidth = 0.0
					noselength = 0.8
					noseangle = 0.7
					noseposition = 0.3
					nosetipheight = 0.9
					nosetipwidth = 0.3
					eyebrowsize = 1.0
					eyebrowangle = 0.8
					eyebrowdistance = -0.7
					browposition = 0.2
					browdepth = 0.7
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
				desc_id = None
			}
			cas_male_hat_hair = {
				desc_id = None
			}
			cas_male_hat = {
				desc_id = m_fun_hat_ww2helmet
				chosen_materials = {
					material1 = grey_1
				}
			}
			cas_male_facial_hair = {
				desc_id = None
			}
			cas_male_torso = {
				desc_id = m_bmtl_torso_skeletonbelt
				chosen_materials = {
					material2 = blue_5
					material1 = grey_5
				}
			}
			cas_male_legs = {
				desc_id = m_punk_legs_jzip
				chosen_materials = {
					material1 = blue_4
				}
			}
			cas_male_shoes = {
				desc_id = m_goth_shoes_buckleb
			}
			cas_male_acc_left = {
				desc_id = m_bmtl_acc_ltripleband
			}
			cas_male_acc_right = {
				desc_id = m_bmtl_acc_rlongspike
			}
			cas_male_acc_face = {
				desc_id = None
			}
			cas_male_acc_ears = {
				desc_id = None
			}
			cas_male_age = {
				desc_id = car_male_teen
			}
			cas_male_teeth = {
				desc_id = car_male_teeth
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
				desc_id = bass9_esp_ax_01
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\esp\bass9_esp_ax_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/esp/bass9_esp_ax_ld_01`
								Color = grey_2guitar
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
				desc_id = doublebass
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld46`
								flags = 32
								Color = black_1guitar
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_pork3`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_15`
								flags = 4
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
				desc_id = mic_standard
			}
			cas_mic_stand = {
				desc_id = mic_stand_metal
			}
		}
	}
	{
		Name = Skeleton
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
			genre = `heavy	metal`
			cas_full_body = {
				desc_id = Skeleton
			}
			cas_male_physique = {
				desc_id = skeletonphysique
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
				desc_id = gtr_pickup_type2_paf2
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
				desc_id = rock
			}
			cas_mic_stand = {
				desc_id = rock
			}
		}
	}
	{
		Name = gh_rocker_silhouette_gold
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
						pre_layer = [
							{
								Color = orange_3
								texture = `tex/models/characters/layers/cag/mcswain/gtr10_mcswain_flame_ld1`
								flags = 4
							}
							{
								texture = `tex/models/characters/layers/cag/mcswain/gtr10_mcswain_flame_fd2`
								flags = 4
								Color = yellow_1guitar
							}
							{
								texture = `tex/models/characters/layers/cag/mcswain/gtr10_mcswain_flame_dtl2`
								flags = 4
								Color = yellow_1guitar
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
								texture = `tex/models/characters/layers/cag/gh5/22_fret_ld70_mcswn_flame`
								flags = 36
								Color = yellow_2guitar
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
								Color = yellow_1guitar
							}
						]
					}
				]
				chosen_materials = {
					material1 = yellow_2guitar
				}
			}
			cas_guitar_pickguards = {
				desc_id = None
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
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld18`
								flags = 32
								Color = yellow_2guitar
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_skin_ld59`
								flags = 4
								Color = yellow_2guitar
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
		Name = gh_rocker_blackout
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
						pre_layer = [
							{
								Color = black_1guitar
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
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cag/ibanez/gtr75_neckhead_ld02`
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_ld00`
								Color = black_1guitar
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
								Color = grey_4
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
				desc_id = None
			}
			cas_drums = {
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_15`
								flags = 4
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
				desc_id = mic_d3414s
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
			cas_male_acc_ears = {
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
				desc_id = gtr_pickup_type2_paf2
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
			cas_male_acc_ears = {
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
				desc_id = gtr_pickup_type2_paf2
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
