preset_musician_instrument_hack = {
	cas_guitar_body = {
		desc_id = guitar_body01
	}
	cas_guitar_neck = {
		desc_id = guitar_neck01
	}
	cas_guitar_head = {
		desc_id = guitar_head01
	}
	cas_guitar_pickguards = {
		desc_id = guitar_pickg01
	}
	cas_guitar_pickups = {
		desc_id = gtr_pickups_style_01a
	}
	cas_guitar_knobs = {
		desc_id = gtr_knobs_style_01a
	}
	cas_guitar_bridges = {
		desc_id = gtr_hardware01a
	}
	cas_bass_body = {
		desc_id = cab_body_b2a
	}
	cas_bass_neck = {
		desc_id = cab_neck_bn1a
	}
	cas_bass_head = {
		desc_id = cab_head_bh6a
	}
	cas_bass_pickguards = {
		desc_id = cab_pickg_e1
	}
	cas_bass_pickups = {
		desc_id = cab_pickup_hack02
	}
	cas_bass_knobs = {
		desc_id = cab_knob_unos04
	}
	cas_bass_bridges = {
		desc_id = cab_bridge_bb3a
	}
	cas_mic = {
		desc_id = rock
	}
	cas_mic_stand = {
		desc_id = rock
	}
	cas_drums = {
		desc_id = basic
	}
}
worst_male_appearance_hack = {
	cas_physique = {
		desc_id = malephysique
		bones = {
			height = 1.0
			physique = 1.0
		}
	}
}
worst_female_appearance_hack = {
	cas_physique = {
		desc_id = femalephysique
		bones = {
			height = 1.0
			physique = 1.0
			chest = 1.0
		}
	}
}
preset_musician_profiles_modifiable = [
	{
		name = axel
		fullname = qs(0x0539af5a)
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		preset_icon = photo_axel
		blurb = qs(0x609985bc)
		appearance = {
			cas_character_name = {
				desc_id = axel
			}
			cas_greatest_outfit = {
				desc_id = false
			}
			genre = `classic rock`
			cas_body = {
				desc_id = gh4_car_male
				random_weight = 1.5
				bones = {
					facefullness = 0.83199996
					jawscale = 0.8
					chinsize = 0.561
					headsize = -0.533
					chinwidth = 0.875
					cheekboneshape = 0.9
					nosetip = 0.852
					nosedepth = 0.265
					noseposition = 0.0
					nosebridge = 0.49400002
					nosebroken = 0.367
					mouthscale = 0.7
					mouthposition = -1.0
					lipshape = 0.2
					upperlipthickness = 0.2
					eyeposition = 0.23300001
					eyedistance = 0.7
					eyeshape = 0.6
					eyescale = 0.56700003
					nosewidth = 0.6
					nosesize = 0.4
					eyebrowangle = 0.9
					eyebrowdistance = 0.9
					browposition = 0.3
				}
			}
			cas_physique = {
				desc_id = malephysique
				additional_bone_transforms = [
					{
						bone = bone_neck
						scaling = {
							value = (0.25, 0.25, 0.25)
							no_propagate
						}
					}
					{
						bone = bone_chest
						scaling = {
							value = (0.1, 0.4, 0.4)
							no_propagate
						}
					}
					{
						bone = bone_stomach_upper
						scaling = {
							value = (0.1, 0.25, 0.25)
							no_propagate
						}
					}
					{
						bone = bone_stomach_lower
						scaling = {
							value = (0.1, 0.25, 0.15)
							no_propagate
						}
					}
					{
						bone = bone_collar_r
						scaling = {
							value = (0.2, 0.2, 0.2)
							no_propagate
						}
						translation = {
							value = (0.0, -0.07, 0.0)
						}
					}
					{
						bone = bone_collar_l
						scaling = {
							value = (0.2, 0.2, 0.2)
							no_propagate
						}
						translation = {
							value = (0.0, -0.07, 0.0)
						}
					}
					{
						bone = bone_twist_bicep_top_r
						scaling = {
							value = (0.0, 0.65000004, 0.5)
							no_propagate
						}
					}
					{
						bone = bone_twist_bicep_mid_r
						scaling = {
							value = (0.0, 0.65000004, 0.5)
							no_propagate
						}
					}
					{
						bone = bone_bicep_r
						scaling = {
							value = (0.0, 0.65000004, 0.5)
							no_propagate
						}
					}
					{
						bone = bone_twist_bicep_top_l
						scaling = {
							value = (0.0, 0.65000004, 0.5)
							no_propagate
						}
					}
					{
						bone = bone_twist_bicep_mid_l
						scaling = {
							value = (0.0, 0.65000004, 0.5)
							no_propagate
						}
					}
					{
						bone = bone_bicep_l
						scaling = {
							value = (0.0, 0.65000004, 0.5)
							no_propagate
						}
					}
					{
						bone = bone_forearm_l
						scaling = {
							value = (0.0, 0.5, 0.35000002)
							no_propagate
						}
					}
					{
						bone = bone_forearm_r
						scaling = {
							value = (0.0, 0.5, 0.35000002)
							no_propagate
						}
					}
					{
						bone = bone_palm_l
						scaling = {
							value = (0.0, 0.3, 0.3)
						}
					}
					{
						bone = bone_palm_r
						scaling = {
							value = (0.0, 0.3, 0.3)
						}
					}
					{
						bone = bone_ankle_r
						scaling = {
							value = (0.13, 0.0, 0.3)
						}
					}
					{
						bone = bone_ankle_l
						scaling = {
							value = (0.13, 0.0, 0.3)
						}
					}
				]
			}
			cas_eyes = {
				desc_id = car_green_eyes
			}
			cas_male_hair = {
				desc_id = m_metl_hair_axel
			}
			cas_male_facial_hair = {
				desc_id = none
			}
			cas_male_torso = {
				desc_id = m_mtl_torso_axel1
			}
			cas_male_legs = {
				desc_id = m_mtl_legs_axel1
			}
			cas_male_shoes = {
				desc_id = m_mtl_shoes_axel1
			}
			cas_male_acc_left = {
				desc_id = m_punk_acc_lleather
			}
			cas_male_acc_right = {
				desc_id = m_punk_acc_rleather
			}
			cas_male_acc_face = {
				desc_id = none
			}
			cas_male_acc_ears = {
				desc_id = none
			}
			cas_male_intro_anim = {
				desc_id = intro_pointing
			}
			cas_male_win_anim = {
				desc_id = win_kick
			}
			cas_male_lose_anim = {
				desc_id = lose_angryatcrowd
			}
			cas_male_age = {
				desc_id = car_male_mature
			}
			cas_guitar_body = {
				desc_id = guitar_body04
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/gtr_body_style4_d_01.dds`
						material = guitar_body_style_04_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style4_ld_01.img`
								color = yellow_1guitar
								flags = 4
								a = 75
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style4_dtl_04.img`
								flags = 4
								color = red_1
							}
						]
					}
				]
			}
			cas_guitar_neck = {
				desc_id = guitar_neck03
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/neck_maple_tb_03.dds`
						material = guitar_neck3_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/neck1_inlay_ornate1_d_05.img`
								flags = 4
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = guitar_head05
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/gtr_headtock05_d_01.dds`
						material = guitar_head_05_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_headtock05_ld_01.img`
								flags = 4
								color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_headtock05_dtl_06.img`
								flags = 4
								color = red_3
							}
						]
					}
				]
				chosen_materials = {
					material1 = orange_4
				}
			}
			cas_guitar_pickguards = {
				desc_id = gtr_body4_pickg01
			}
			cas_guitar_bridges = {
				desc_id = gtr_hardware05
				chosen_materials = {
					material1 = orange_4
				}
			}
			cas_guitar_knobs = {
				desc_id = gtr4_knob_type1_04
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_type1_blktan_3
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_body = {
				desc_id = cab_body_bb3a
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\cab_bodywood_b3a_e_mls.dds`
						material = cab_body_bb3a_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_bachwht_mls.img`
								color = black_1guitar
								a = 100
							}
							{
								texture = `tex/models/characters/layers/cab/cab_body_bach_dtl_pin.img`
								color = yellow_5guitar
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = cab_neck_bn1b
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/cab_neck_01b_rosewood_d_mls.dds`
						material = cab_neck_bn1b_neck
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_nek_wedgehigh.img`
								flags = 4
								color = yellow_4guitar
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = cab_head_bh7a
				chosen_materials = {
					material1 = grey_5guitar
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/cab_head_bh7a.dds`
						material = cab_head_bh7a_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_head_bh7a_wtfinish.img`
								flags = 4
								color = black_1guitar
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_046.img`
								x_trans = -30
								y_trans = -5
								x_scale = 60
								y_scale = 65
								rot = 6033
								flags = 27
								color = yellow_orange_4
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = cab_pickg_f3
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/cab_pickg_f1_d_mls.dds`
						material = cab_pickg_f1_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_pickg_f4w_d_mls.img`
								color = yellow_4
								flags = 4
								a = 90
							}
						]
					}
				]
			}
			cas_bass_pickups = {
				desc_id = cab_pickup_hack02
			}
			cas_bass_bridges = {
				desc_id = cab_bridge_hack
			}
			cas_bass_knobs = {
				desc_id = cab_knob_hack01
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_drums = {
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1.dds`
						material = cad_drums_01_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_06.img`
								flags = 32
								color = yellow_orange_4
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a.dds`
						material = cad_drums_01_bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_64.img`
								flags = 4
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
								color = yellow_orange_1
								x_scale = 120
								y_scale = 115
								flags = 3
								a = 70
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
								color = black_1guitar
								x_trans = -26
								x_scale = 10
								y_scale = 115
								flags = 3
								y_trans = -8
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_007.img`
								x_trans = -30
								flags = 3
								x_scale = 1
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_007.img`
								x_trans = -24
								x_scale = 1
								flags = 3
								y_scale = 110
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_036.img`
								x_trans = -27
								x_scale = 40
								y_scale = 40
								flags = 3
								y_trans = 11
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_036.img`
								color = black_1guitar
								x_trans = -27
								y_trans = 11
								x_scale = 35
								flags = 3
								y_scale = 35
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_033.img`
								x_trans = -27
								x_scale = 25
								y_scale = 10
								flags = 3
								y_trans = 23
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_033.img`
								color = black_1guitar
								x_trans = -27
								x_scale = 20
								y_scale = 15
								flags = 3
								y_trans = 21
							}
							{
								font = fontgrid_bordello
								text = 'A'
								x_trans = -32
								y_trans = 16
								x_scale = 40
								y_scale = 45
								flags = 3
								color = grey_5guitar
							}
							{
								font = fontgrid_bordello
								text = 'S'
								color = grey_5guitar
								x_trans = -24
								x_scale = 45
								y_scale = 45
								flags = 3
								y_trans = 10
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics020.img`
								x_trans = -28
								y_trans = -7
								x_scale = 40
								y_scale = 50
								rot = 1000
								flags = 19
								color = grey_5guitar
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics020.img`
								x_trans = -26
								y_trans = -7
								x_scale = 40
								y_scale = 50
								flags = 19
								rot = 5333
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
			cas_bass_highway = {
				desc_id = axelhighway
			}
			cas_guitar_highway = {
				desc_id = axelhighway
			}
			cas_drums_highway = {
				desc_id = axelhighway
			}
		}
	}
	{
		name = casey
		fullname = qs(0xd88aefc7)
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		preset_icon = photo_casey
		blurb = qs(0x39118fcc)
		appearance = {
			cas_character_name = {
				desc_id = casey
			}
			cas_greatest_outfit = {
				desc_id = false
			}
			genre = rock
			cas_body = {
				desc_id = gh4_car_casey
				cap = [
					{
						base_tex = `tex/models/characters/global/global_blank_head_dnc.dds`
						material = car_female_head
						cas_1
						post_layer = [
							{
								texture = 0x3a8fa7ca
								flags = 4
							}
							{
								texture = 0xd0b325dc
								flags = 4
							}
						]
					}
				]
				bones = {
					upperlipthickness = 0.97499996
					lowerlipthickness = 0.947
					mouthscale = 0.0
					mouthangle = 0.7
					mouthdepth = 0.433
					eyescale = 0.0
					eyedepth = 1.0
					eyeposition = 0.533
					nosebridge = 0.6
					nosewidth = 0.0
					nosedepth = 0.365
				}
			}
			cas_physique = {
				desc_id = femalephysique
			}
			cas_eyes = {
				desc_id = car_deepblue_eyes
			}
			cas_female_hair = {
				desc_id = f_clsc_hair_farah
				chosen_materials = {
					material1 = red_orange_5
				}
			}
			cas_female_hat = {
				desc_id = none
			}
			cas_female_facial_hair = {
				desc_id = none
			}
			cas_female_torso = {
				desc_id = f_fun_torso_bra
				chosen_materials = {
					material1 = grey_1
				}
			}
			cas_female_legs = {
				desc_id = f_clsc_legs_pvc
				chosen_materials = {
					material1 = grey_1
				}
			}
			cas_female_shoes = {
				desc_id = f_glam_shoes_velvetbaggyboots
			}
			cas_female_acc_left = {
				desc_id = f_rock_acc_lstrap
			}
			cas_female_acc_right = {
				desc_id = f_rock_acc_rstrap
			}
			cas_female_acc_face = {
				desc_id = none
			}
			cas_female_acc_ears = {
				desc_id = none
			}
			cas_female_win_anim = {
				desc_id = win_hype
			}
			cas_female_lose_anim = {
				desc_id = lose_angryatcrowd
			}
			cas_female_intro_anim = {
				desc_id = intro_hype
			}
			cas_guitar_body = {
				desc_id = guitar_body04
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/gtr_body_style4_d_01.dds`
						material = guitar_body_style_04_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style4_ld_01.img`
								color = yellow_1guitar
								flags = 4
								a = 75
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style4_dtl_04.img`
								flags = 4
								color = red_1
							}
						]
					}
				]
			}
			cas_guitar_neck = {
				desc_id = guitar_neck03
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/neck_maple_tb_03.dds`
						material = guitar_neck3_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/neck1_inlay_ornate1_d_05.img`
								flags = 4
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = guitar_head05
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/gtr_headtock05_d_01.dds`
						material = guitar_head_05_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_headtock05_ld_01.img`
								flags = 4
								color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_headtock05_dtl_06.img`
								flags = 4
								color = red_3
							}
						]
					}
				]
				chosen_materials = {
					material1 = orange_4
				}
			}
			cas_guitar_pickguards = {
				desc_id = gtr_body4_pickg01
			}
			cas_guitar_bridges = {
				desc_id = gtr_hardware05
				chosen_materials = {
					material1 = orange_4
				}
			}
			cas_guitar_knobs = {
				desc_id = gtr4_knob_type1_04
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_type1_blktan_3
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_body = {
				desc_id = cab_body_bb3a
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\cab_bodywood_b3a_e_mls.dds`
						material = cab_body_bb3a_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_bachwht_mls.img`
								color = black_1guitar
								a = 100
							}
							{
								texture = `tex/models/characters/layers/cab/cab_body_bach_dtl_pin.img`
								color = yellow_5guitar
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = cab_neck_bn1b
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/cab_neck_01b_rosewood_d_mls.dds`
						material = cab_neck_bn1b_neck
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_nek_wedgehigh.img`
								flags = 4
								color = yellow_4guitar
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = cab_head_bh7a
				chosen_materials = {
					material1 = grey_5guitar
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/cab_head_bh7a.dds`
						material = cab_head_bh7a_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_head_bh7a_wtfinish.img`
								flags = 4
								color = black_1guitar
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_046.img`
								x_trans = -30
								y_trans = -5
								x_scale = 60
								y_scale = 65
								rot = 6033
								flags = 27
								color = yellow_orange_4
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = cab_pickg_f3
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/cab_pickg_f1_d_mls.dds`
						material = cab_pickg_f1_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_pickg_f4w_d_mls.img`
								color = yellow_4
								flags = 4
								a = 90
							}
						]
					}
				]
			}
			cas_bass_pickups = {
				desc_id = cab_pickup_hack02
			}
			cas_bass_bridges = {
				desc_id = cab_bridge_hack
			}
			cas_bass_knobs = {
				desc_id = cab_knob_hack01
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_drums = {
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1.dds`
						material = cad_drums_01_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_06.img`
								flags = 32
								color = yellow_orange_4
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a.dds`
						material = cad_drums_01_bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_64.img`
								flags = 4
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
								color = yellow_orange_1
								x_scale = 120
								y_scale = 115
								flags = 3
								a = 70
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
								color = black_1guitar
								x_trans = -26
								x_scale = 10
								y_scale = 115
								flags = 3
								y_trans = -8
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_007.img`
								x_trans = -30
								flags = 3
								x_scale = 1
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_007.img`
								x_trans = -24
								x_scale = 1
								flags = 3
								y_scale = 110
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_036.img`
								x_trans = -27
								x_scale = 40
								y_scale = 40
								flags = 3
								y_trans = 11
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_036.img`
								color = black_1guitar
								x_trans = -27
								y_trans = 11
								x_scale = 35
								flags = 3
								y_scale = 35
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_033.img`
								x_trans = -27
								x_scale = 25
								y_scale = 10
								flags = 3
								y_trans = 23
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_033.img`
								color = black_1guitar
								x_trans = -27
								x_scale = 20
								y_scale = 15
								flags = 3
								y_trans = 21
							}
							{
								font = fontgrid_bordello
								text = 'A'
								x_trans = -32
								y_trans = 16
								x_scale = 40
								y_scale = 45
								flags = 3
								color = grey_5guitar
							}
							{
								font = fontgrid_bordello
								text = 'S'
								color = grey_5guitar
								x_trans = -24
								x_scale = 45
								y_scale = 45
								flags = 3
								y_trans = 10
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics020.img`
								x_trans = -28
								y_trans = -7
								x_scale = 40
								y_scale = 50
								rot = 1000
								flags = 19
								color = grey_5guitar
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics020.img`
								x_trans = -26
								y_trans = -7
								x_scale = 40
								y_scale = 50
								flags = 19
								rot = 5333
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
			cas_bass_highway = {
				desc_id = caseyhighway
			}
			cas_guitar_highway = {
				desc_id = caseyhighway
			}
			cas_drums_highway = {
				desc_id = caseyhighway
			}
		}
	}
	{
		name = izzy
		fullname = qs(0x3ba5cbc5)
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		preset_icon = photo_izzy
		blurb = qs(0xd57a373a)
		appearance = {
			cas_character_name = {
				desc_id = izzy
			}
			cas_greatest_outfit = {
				desc_id = false
			}
			genre = `glam rock`
			cas_body = {
				desc_id = gh4_car_izzy
				bones = {
					nosesize = 0.0
					noseposition = 0.5
					nosetip = 0.5
					nosedepth = 0.765
					nosebridge = 0.49400002
					eyeshape = 0.342
					eyeposition = -0.767
					eyescale = 0.367
					eyedistance = -0.33
					mouthposition = 0.167
					cheekboneshape = 0.2
					eyebrowangle = 0.7
				}
			}
			cas_physique = {
				desc_id = malephysique
			}
			cas_eyes = {
				desc_id = car_brown_eyes
			}
			cas_male_hair = {
				desc_id = m_metl_hair_midhigh
				chosen_materials = {
					material1 = yellow_1
				}
			}
			cas_male_hat = {
				desc_id = none
			}
			cas_male_facial_hair = {
				desc_id = none
			}
			cas_male_torso = {
				desc_id = m_glam_torso_rags
				chosen_materials = {
					material1 = red_2
				}
			}
			cas_male_legs = {
				desc_id = m_glam_legs_stripes
				chosen_materials = {
					material1 = grey_4
					material2 = red_3
				}
			}
			cas_male_shoes = {
				desc_id = m_glam_shoe_eightysixed
			}
			cas_male_acc_left = {
				desc_id = m_goth_acc_lstraps
			}
			cas_male_acc_right = {
				desc_id = m_punk_acc_rleather
			}
			cas_male_acc_face = {
				desc_id = none
			}
			cas_male_acc_ears = {
				desc_id = none
			}
			cas_guitar_body = {
				desc_id = guitar_body04
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/gtr_body_style4_d_01.dds`
						material = guitar_body_style_04_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style4_ld_01.img`
								color = yellow_1guitar
								flags = 4
								a = 75
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style4_dtl_04.img`
								flags = 4
								color = red_1
							}
						]
					}
				]
			}
			cas_guitar_neck = {
				desc_id = guitar_neck03
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/neck_maple_tb_03.dds`
						material = guitar_neck3_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/neck1_inlay_ornate1_d_05.img`
								flags = 4
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = guitar_head05
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/gtr_headtock05_d_01.dds`
						material = guitar_head_05_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_headtock05_ld_01.img`
								flags = 4
								color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_headtock05_dtl_06.img`
								flags = 4
								color = red_3
							}
						]
					}
				]
				chosen_materials = {
					material1 = orange_4
				}
			}
			cas_guitar_pickguards = {
				desc_id = gtr_body4_pickg01
			}
			cas_guitar_bridges = {
				desc_id = gtr_hardware05
				chosen_materials = {
					material1 = orange_4
				}
			}
			cas_guitar_knobs = {
				desc_id = gtr4_knob_type1_04
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_type1_blktan_3
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_body = {
				desc_id = cab_body_bb3a
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\cab_bodywood_b3a_e_mls.dds`
						material = cab_body_bb3a_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_bachwht_mls.img`
								color = black_1guitar
								a = 100
							}
							{
								texture = `tex/models/characters/layers/cab/cab_body_bach_dtl_pin.img`
								color = yellow_5guitar
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = cab_neck_bn1b
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/cab_neck_01b_rosewood_d_mls.dds`
						material = cab_neck_bn1b_neck
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_nek_wedgehigh.img`
								flags = 4
								color = yellow_4guitar
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = cab_head_bh7a
				chosen_materials = {
					material1 = grey_5guitar
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/cab_head_bh7a.dds`
						material = cab_head_bh7a_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_head_bh7a_wtfinish.img`
								flags = 4
								color = black_1guitar
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_046.img`
								x_trans = -30
								y_trans = -5
								x_scale = 60
								y_scale = 65
								rot = 6033
								flags = 27
								color = yellow_orange_4
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = cab_pickg_f3
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/cab_pickg_f1_d_mls.dds`
						material = cab_pickg_f1_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_pickg_f4w_d_mls.img`
								color = yellow_4
								flags = 4
								a = 90
							}
						]
					}
				]
			}
			cas_bass_pickups = {
				desc_id = cab_pickup_hack02
			}
			cas_bass_bridges = {
				desc_id = cab_bridge_hack
			}
			cas_bass_knobs = {
				desc_id = cab_knob_hack01
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_drums = {
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1.dds`
						material = cad_drums_01_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_06.img`
								flags = 32
								color = yellow_orange_4
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a.dds`
						material = cad_drums_01_bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_64.img`
								flags = 4
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
								color = yellow_orange_1
								x_scale = 120
								y_scale = 115
								flags = 3
								a = 70
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
								color = black_1guitar
								x_trans = -26
								x_scale = 10
								y_scale = 115
								flags = 3
								y_trans = -8
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_007.img`
								x_trans = -30
								flags = 3
								x_scale = 1
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_007.img`
								x_trans = -24
								x_scale = 1
								flags = 3
								y_scale = 110
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_036.img`
								x_trans = -27
								x_scale = 40
								y_scale = 40
								flags = 3
								y_trans = 11
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_036.img`
								color = black_1guitar
								x_trans = -27
								y_trans = 11
								x_scale = 35
								flags = 3
								y_scale = 35
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_033.img`
								x_trans = -27
								x_scale = 25
								y_scale = 10
								flags = 3
								y_trans = 23
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_033.img`
								color = black_1guitar
								x_trans = -27
								x_scale = 20
								y_scale = 15
								flags = 3
								y_trans = 21
							}
							{
								font = fontgrid_bordello
								text = 'A'
								x_trans = -32
								y_trans = 16
								x_scale = 40
								y_scale = 45
								flags = 3
								color = grey_5guitar
							}
							{
								font = fontgrid_bordello
								text = 'S'
								color = grey_5guitar
								x_trans = -24
								x_scale = 45
								y_scale = 45
								flags = 3
								y_trans = 10
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics020.img`
								x_trans = -28
								y_trans = -7
								x_scale = 40
								y_scale = 50
								rot = 1000
								flags = 19
								color = grey_5guitar
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics020.img`
								x_trans = -26
								y_trans = -7
								x_scale = 40
								y_scale = 50
								flags = 19
								rot = 5333
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
			cas_male_intro_anim = {
				desc_id = intro_hype
			}
			cas_male_win_anim = {
				desc_id = win_kungfu
			}
			cas_male_lose_anim = {
				desc_id = lose_tantrum
			}
			cas_drums_highway = {
				desc_id = izzyhighway
			}
			cas_bass_highway = {
				desc_id = izzyhighway
			}
			cas_guitar_highway = {
				desc_id = izzyhighway
			}
		}
	}
	{
		name = judy
		fullname = qs(0xa9028c21)
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		preset_icon = photo_judy
		blurb = qs(0x82a83c87)
		appearance = {
			cas_character_name = {
				desc_id = judy
			}
			cas_greatest_outfit = {
				desc_id = false
			}
			genre = punk
			cas_body = {
				desc_id = gh4_car_judy
				bones = {
					facefullness = 0.3
					jawscale = 0.3
					upperlipthickness = 1.0
					lowerlipthickness = 1.0
					mouthscale = 0.0
					mouthposition = 0.0
					noseposition = 0.3
					nosetip = 0.5
					lipshape = 0.2
					eyeangle = 0.39000002
					eyeshape = 0.7
					eyebrowsize = 0.8
					eyebrowangle = 0.1
					browposition = 0.4
					browdepth = 0.0
					eyebrowdistance = -0.59
					nosewidth = 0.2
					nosedepth = 0.465
					noseangle = 0.3
					eyeposition = -0.067
					eyescale = 0.4
				}
			}
			cas_physique = {
				desc_id = femalephysique
				additional_bone_transforms = [
					{
						bone = control_root
						scaling = {
							value = (-0.06, -0.06, -0.06)
						}
					}
					{
						bone = bone_pelvis
						scaling = {
							value = (0.0, 0.015, 0.15)
							no_propagate
						}
					}
					{
						bone = bone_chest
						scaling = {
							value = (0.0, -0.05, 0.1)
							no_propagate
						}
					}
					{
						bone = bone_stomach_lower
						scaling = {
							value = (0.0, 0.1, 0.1)
							no_propagate
						}
					}
					{
						bone = bone_stomach_upper
						scaling = {
							value = (0.0, 0.1, 0.1)
							no_propagate
						}
					}
					{
						bone = bone_collar_l
						scaling = {
							value = (0.0, 0.0, 0.0)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, -0.01)
							no_propagate
						}
					}
					{
						bone = bone_collar_r
						scaling = {
							value = (0.0, 0.0, 0.0)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, 0.01)
							no_propagate
						}
					}
					{
						bone = bone_twist_bicep_top_r
						scaling = {
							value = (0.0, 0.2, 0.2)
							no_propagate
						}
					}
					{
						bone = bone_twist_bicep_top_l
						scaling = {
							value = (0.0, 0.2, 0.2)
							no_propagate
						}
					}
					{
						bone = bone_twist_bicep_mid_l
						scaling = {
							value = (0.0, 0.2, 0.2)
							no_propagate
						}
					}
					{
						bone = bone_twist_bicep_mid_r
						scaling = {
							value = (0.0, 0.2, 0.2)
							no_propagate
						}
					}
					{
						bone = bone_bicep_r
						scaling = {
							value = (0.0, 0.1, 0.1)
							no_propagate
						}
					}
					{
						bone = bone_bicep_l
						scaling = {
							value = (0.0, 0.1, 0.1)
							no_propagate
						}
					}
					{
						bone = bone_head
						scaling = {
							value = (0.11, 0.11, 0.11)
						}
					}
					{
						bone = bone_ankle_l
						scaling = {
							value = (0.2, 0.2, 0.2)
							no_propagate
						}
					}
					{
						bone = bone_ankle_r
						scaling = {
							value = (0.2, 0.2, 0.2)
							no_propagate
						}
					}
					{
						bone = bone_twist_thigh_r
						scaling = {
							value = (0.0, 0.25, 0.25)
							no_propagate
						}
					}
					{
						bone = bone_twist_thigh_l
						scaling = {
							value = (0.0, 0.25, 0.25)
							no_propagate
						}
					}
					{
						bone = bone_thigh_r
						scaling = {
							value = (0.0, 0.2, 0.2)
							no_propagate
						}
					}
					{
						bone = bone_thigh_l
						scaling = {
							value = (0.0, 0.2, 0.2)
							no_propagate
						}
					}
					{
						bone = bone_knee_r
						scaling = {
							value = (0.0, 0.15, 0.15)
							no_propagate
						}
					}
					{
						bone = bone_knee_l
						scaling = {
							value = (0.0, 0.15, 0.15)
							no_propagate
						}
					}
				]
			}
			cas_eyes = {
				desc_id = car_green_eyes
			}
			cas_female_hair = {
				desc_id = f_punk_hair_judynails1
			}
			cas_female_torso = {
				desc_id = f_punk_torso_stripe
				chosen_materials = {
					material2 = grey_4
					material1 = grey_5
				}
			}
			cas_female_legs = {
				desc_id = f_punk_legs_skirt
				chosen_materials = {
					material1 = red_2
					material2 = grey_5
					material3 = grey_1
				}
			}
			cas_female_shoes = {
				desc_id = f_punk_shoe_army
				chosen_materials = {
					material1 = red_1
					material2 = grey_4
				}
			}
			cas_female_acc_left = {
				desc_id = f_punk_acc_lglvwatch
			}
			cas_female_acc_right = {
				desc_id = f_punk_acc_rbands
			}
			cas_female_acc_ears = {
				desc_id = f_punk_acc_ring_02
			}
			cas_guitar_highway = {
				desc_id = judyhighway
			}
			cas_female_win_anim = {
				desc_id = win_hype
			}
			cas_female_lose_anim = {
				desc_id = lose_angryatcrowd
			}
			cas_female_intro_anim = {
				desc_id = intro_hype
			}
			cas_guitar_body = {
				desc_id = guitar_body04
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/gtr_body_style4_d_01.dds`
						material = guitar_body_style_04_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style4_ld_01.img`
								color = yellow_1guitar
								flags = 4
								a = 75
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style4_dtl_04.img`
								flags = 4
								color = red_1
							}
						]
					}
				]
			}
			cas_guitar_neck = {
				desc_id = guitar_neck03
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/neck_maple_tb_03.dds`
						material = guitar_neck3_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/neck1_inlay_ornate1_d_05.img`
								flags = 4
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = guitar_head05
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/gtr_headtock05_d_01.dds`
						material = guitar_head_05_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_headtock05_ld_01.img`
								flags = 4
								color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_headtock05_dtl_06.img`
								flags = 4
								color = red_3
							}
						]
					}
				]
				chosen_materials = {
					material1 = orange_4
				}
			}
			cas_guitar_pickguards = {
				desc_id = gtr_body4_pickg01
			}
			cas_guitar_bridges = {
				desc_id = gtr_hardware05
				chosen_materials = {
					material1 = orange_4
				}
			}
			cas_guitar_knobs = {
				desc_id = gtr4_knob_type1_04
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_type1_blktan_3
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_body = {
				desc_id = cab_body_bb3a
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\cab_bodywood_b3a_e_mls.dds`
						material = cab_body_bb3a_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_bachwht_mls.img`
								color = black_1guitar
								a = 100
							}
							{
								texture = `tex/models/characters/layers/cab/cab_body_bach_dtl_pin.img`
								color = yellow_5guitar
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = cab_neck_bn1b
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/cab_neck_01b_rosewood_d_mls.dds`
						material = cab_neck_bn1b_neck
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_nek_wedgehigh.img`
								flags = 4
								color = yellow_4guitar
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = cab_head_bh7a
				chosen_materials = {
					material1 = grey_5guitar
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/cab_head_bh7a.dds`
						material = cab_head_bh7a_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_head_bh7a_wtfinish.img`
								flags = 4
								color = black_1guitar
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_046.img`
								x_trans = -30
								y_trans = -5
								x_scale = 60
								y_scale = 65
								rot = 6033
								flags = 27
								color = yellow_orange_4
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = cab_pickg_f3
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/cab_pickg_f1_d_mls.dds`
						material = cab_pickg_f1_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_pickg_f4w_d_mls.img`
								color = yellow_4
								flags = 4
								a = 90
							}
						]
					}
				]
			}
			cas_bass_pickups = {
				desc_id = cab_pickup_hack02
			}
			cas_bass_bridges = {
				desc_id = cab_bridge_hack
			}
			cas_bass_knobs = {
				desc_id = cab_knob_hack01
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_drums = {
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1.dds`
						material = cad_drums_01_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_06.img`
								flags = 32
								color = yellow_orange_4
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a.dds`
						material = cad_drums_01_bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_64.img`
								flags = 4
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
								color = yellow_orange_1
								x_scale = 120
								y_scale = 115
								flags = 3
								a = 70
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
								color = black_1guitar
								x_trans = -26
								x_scale = 10
								y_scale = 115
								flags = 3
								y_trans = -8
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_007.img`
								x_trans = -30
								flags = 3
								x_scale = 1
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_007.img`
								x_trans = -24
								x_scale = 1
								flags = 3
								y_scale = 110
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_036.img`
								x_trans = -27
								x_scale = 40
								y_scale = 40
								flags = 3
								y_trans = 11
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_036.img`
								color = black_1guitar
								x_trans = -27
								y_trans = 11
								x_scale = 35
								flags = 3
								y_scale = 35
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_033.img`
								x_trans = -27
								x_scale = 25
								y_scale = 10
								flags = 3
								y_trans = 23
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_033.img`
								color = black_1guitar
								x_trans = -27
								x_scale = 20
								y_scale = 15
								flags = 3
								y_trans = 21
							}
							{
								font = fontgrid_bordello
								text = 'A'
								x_trans = -32
								y_trans = 16
								x_scale = 40
								y_scale = 45
								flags = 3
								color = grey_5guitar
							}
							{
								font = fontgrid_bordello
								text = 'S'
								color = grey_5guitar
								x_trans = -24
								x_scale = 45
								y_scale = 45
								flags = 3
								y_trans = 10
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics020.img`
								x_trans = -28
								y_trans = -7
								x_scale = 40
								y_scale = 50
								rot = 1000
								flags = 19
								color = grey_5guitar
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics020.img`
								x_trans = -26
								y_trans = -7
								x_scale = 40
								y_scale = 50
								flags = 19
								rot = 5333
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
			cas_bass_highway = {
				desc_id = judyhighway
			}
			cas_drums_highway = {
				desc_id = judyhighway
			}
			cas_bass_highway = {
				desc_id = judyhighway
			}
		}
	}
	{
		name = johnny
		fullname = qs(0x525fe42c)
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		preset_icon = photo_johnny
		blurb = qs(0x2015c1bd)
		appearance = {
			cas_character_name = {
				desc_id = johnny
			}
			cas_greatest_outfit = {
				desc_id = false
			}
			genre = punk
			cas_body = {
				desc_id = gh4_car_johnny
				bones = {
					cheekboneshape = 0.0
					earangle = 0.3
					chinwidth = 0.175
					nosebroken = 0.2
					nosewidth = 0.4
					lowerlipthickness = 0.0
					lipshape = 1.0
					upperlipthickness = 0.5
					jawscale = 0.9
					noseposition = 0.105000004
					eyeangle = 0.49
					eyeshape = 0.342
					eyedepth = -0.767
					eyescale = 0.367
					eyedistance = -0.23
					eyebrowangle = 0.8
					nosetip = 0.5
					noseangle = 0.3
					mouthangle = 1.0
					mouthdepth = 0.7
					mouthposition = 0.66700006
					mouthscale = 0.067
					facefullness = 0.0
					chinsize = 0.0
					nosedepth = 0.8
					nosebridge = 0.9
				}
			}
			cas_physique = {
				desc_id = malephysique
				additional_bone_transforms = [
					{
						bone = bone_neck
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = bone_twist_bicep_top_r
						scaling = {
							value = (0.0, -0.2, -0.15)
							no_propagate
						}
					}
					{
						bone = bone_twist_bicep_mid_r
						scaling = {
							value = (0.0, -0.1, -0.1)
							no_propagate
						}
					}
					{
						bone = bone_bicep_r
						scaling = {
							value = (0.0, -0.1, -0.1)
							no_propagate
						}
					}
					{
						bone = bone_forearm_r
						scaling = {
							value = (0.0, -0.1, -0.1)
							no_propagate
						}
					}
					{
						bone = bone_twist_wrist_r
						scaling = {
							value = (0.0, -0.1, -0.1)
							no_propagate
						}
					}
					{
						bone = bone_twist_bicep_top_l
						scaling = {
							value = (0.0, -0.2, -0.15)
							no_propagate
						}
					}
					{
						bone = bone_twist_bicep_mid_l
						scaling = {
							value = (0.0, -0.1, -0.1)
							no_propagate
						}
					}
					{
						bone = bone_bicep_l
						scaling = {
							value = (0.0, -0.1, -0.1)
							no_propagate
						}
					}
					{
						bone = bone_forearm_l
						scaling = {
							value = (0.0, -0.1, -0.1)
							no_propagate
						}
					}
					{
						bone = bone_twist_wrist_l
						scaling = {
							value = (0.0, -0.1, -0.1)
							no_propagate
						}
					}
					{
						bone = bone_ankle_l
						scaling = {
							value = (0.0, 0.1, 0.2)
						}
					}
					{
						bone = bone_ankle_r
						scaling = {
							value = (0.0, 0.1, 0.2)
						}
					}
					{
						bone = bone_twist_thigh_r
						scaling = {
							value = (0.0, -0.3, -0.3)
							no_propagate
						}
					}
					{
						bone = bone_twist_thigh_l
						scaling = {
							value = (0.0, -0.3, -0.3)
							no_propagate
						}
					}
					{
						bone = bone_thigh_r
						scaling = {
							value = (0.0, -0.3, -0.3)
							no_propagate
						}
					}
					{
						bone = bone_thigh_l
						scaling = {
							value = (0.0, -0.3, -0.3)
							no_propagate
						}
					}
					{
						bone = bone_knee_r
						scaling = {
							value = (0.0, -0.03, -0.03)
							no_propagate
						}
					}
					{
						bone = bone_knee_l
						scaling = {
							value = (0.0, -0.03, -0.03)
							no_propagate
						}
					}
				]
			}
			cas_eyes = {
				desc_id = car_green_eyes
			}
			cas_male_hair = {
				desc_id = m_punk_hair_lspike
				chosen_materials = {
					material1 = red_orange_3
				}
			}
			cas_male_hat = {
				desc_id = none
			}
			cas_male_facial_hair = {
				desc_id = none
			}
			cas_male_torso = {
				desc_id = shirtless
			}
			cas_male_legs = {
				desc_id = m_punk_legs_johnny1
			}
			cas_male_shoes = {
				desc_id = m_punk_shoes_johnny1
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
			cas_guitar_body = {
				desc_id = guitar_body04
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/gtr_body_style4_d_01.dds`
						material = guitar_body_style_04_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style4_ld_01.img`
								color = yellow_1guitar
								flags = 4
								a = 75
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style4_dtl_04.img`
								flags = 4
								color = red_1
							}
						]
					}
				]
			}
			cas_guitar_neck = {
				desc_id = guitar_neck03
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/neck_maple_tb_03.dds`
						material = guitar_neck3_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/neck1_inlay_ornate1_d_05.img`
								flags = 4
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = guitar_head05
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/gtr_headtock05_d_01.dds`
						material = guitar_head_05_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_headtock05_ld_01.img`
								flags = 4
								color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_headtock05_dtl_06.img`
								flags = 4
								color = red_3
							}
						]
					}
				]
				chosen_materials = {
					material1 = orange_4
				}
			}
			cas_guitar_pickguards = {
				desc_id = gtr_body4_pickg01
			}
			cas_guitar_bridges = {
				desc_id = gtr_hardware05
				chosen_materials = {
					material1 = orange_4
				}
			}
			cas_guitar_knobs = {
				desc_id = gtr4_knob_type1_04
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_type1_blktan_3
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_body = {
				desc_id = cab_body_bb3a
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\cab_bodywood_b3a_e_mls.dds`
						material = cab_body_bb3a_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_bachwht_mls.img`
								color = black_1guitar
								a = 100
							}
							{
								texture = `tex/models/characters/layers/cab/cab_body_bach_dtl_pin.img`
								color = yellow_5guitar
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = cab_neck_bn1b
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/cab_neck_01b_rosewood_d_mls.dds`
						material = cab_neck_bn1b_neck
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_nek_wedgehigh.img`
								flags = 4
								color = yellow_4guitar
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = cab_head_bh7a
				chosen_materials = {
					material1 = grey_5guitar
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/cab_head_bh7a.dds`
						material = cab_head_bh7a_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_head_bh7a_wtfinish.img`
								flags = 4
								color = black_1guitar
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_046.img`
								x_trans = -30
								y_trans = -5
								x_scale = 60
								y_scale = 65
								rot = 6033
								flags = 27
								color = yellow_orange_4
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = cab_pickg_f3
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/cab_pickg_f1_d_mls.dds`
						material = cab_pickg_f1_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_pickg_f4w_d_mls.img`
								color = yellow_4
								flags = 4
								a = 90
							}
						]
					}
				]
			}
			cas_bass_pickups = {
				desc_id = cab_pickup_hack02
			}
			cas_bass_bridges = {
				desc_id = cab_bridge_hack
			}
			cas_bass_knobs = {
				desc_id = cab_knob_hack01
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_drums = {
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1.dds`
						material = cad_drums_01_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_06.img`
								flags = 32
								color = yellow_orange_4
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a.dds`
						material = cad_drums_01_bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_64.img`
								flags = 4
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
								color = yellow_orange_1
								x_scale = 120
								y_scale = 115
								flags = 3
								a = 70
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
								color = black_1guitar
								x_trans = -26
								x_scale = 10
								y_scale = 115
								flags = 3
								y_trans = -8
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_007.img`
								x_trans = -30
								flags = 3
								x_scale = 1
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_007.img`
								x_trans = -24
								x_scale = 1
								flags = 3
								y_scale = 110
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_036.img`
								x_trans = -27
								x_scale = 40
								y_scale = 40
								flags = 3
								y_trans = 11
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_036.img`
								color = black_1guitar
								x_trans = -27
								y_trans = 11
								x_scale = 35
								flags = 3
								y_scale = 35
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_033.img`
								x_trans = -27
								x_scale = 25
								y_scale = 10
								flags = 3
								y_trans = 23
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_033.img`
								color = black_1guitar
								x_trans = -27
								x_scale = 20
								y_scale = 15
								flags = 3
								y_trans = 21
							}
							{
								font = fontgrid_bordello
								text = 'A'
								x_trans = -32
								y_trans = 16
								x_scale = 40
								y_scale = 45
								flags = 3
								color = grey_5guitar
							}
							{
								font = fontgrid_bordello
								text = 'S'
								color = grey_5guitar
								x_trans = -24
								x_scale = 45
								y_scale = 45
								flags = 3
								y_trans = 10
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics020.img`
								x_trans = -28
								y_trans = -7
								x_scale = 40
								y_scale = 50
								rot = 1000
								flags = 19
								color = grey_5guitar
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics020.img`
								x_trans = -26
								y_trans = -7
								x_scale = 40
								y_scale = 50
								flags = 19
								rot = 5333
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
			cas_bass_highway = {
				desc_id = johnnyhighway
			}
			cas_guitar_highway = {
				desc_id = johnnyhighway
			}
			cas_drums_highway = {
				desc_id = johnnyhighway
			}
			cas_male_intro_anim = {
				desc_id = intro_generic1
			}
			cas_male_win_anim = {
				desc_id = win_kick
			}
			cas_male_lose_anim = {
				desc_id = lose_kick
			}
		}
	}
	{
		name = lars
		fullname = qs(0x9dd7644f)
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		preset_icon = photo_lars
		blurb = qs(0x161eeef7)
		appearance = {
			cas_character_name = {
				desc_id = lars
			}
			cas_greatest_outfit = {
				desc_id = false
			}
			genre = `black metal`
			$preset_musician_instrument_hack
			cas_body = {
				desc_id = gh4_car_lars
				set_materials = {
					skin = {
						diffuse = [
							249
							247
							247
						]
					}
				}
				bones = {
					eyeangle = 0.3
					eyebrowshape = 0.0
					eyebrowangle = 1.0
					eyeshape = 0.7
					nosewidth = 0.92099994
					headsize = -1.0
					nosedepth = 1.0
					mouthdepth = 1.0
					nosebridge = 1.0
					browdepth = 1.0
					eyedepth = 1.0
					lowerlipthickness = 1.0
					lipshape = 0.9
					mouthangle = 0.0
					upperlipthickness = 0.8
					eyeposition = 1.0
					eyescale = 0.267
					eyedistance = 0.05
					cheekboneshape = 0.5
					jawscale = 1.0
					chinwidth = 0.6
					facefullness = 1.0
					browposition = 0.8
					chinsize = 0.7
					eyebrowdistance = 0.7
					eyebrowsize = 0.5
					nosetip = 1.0
					noseangle = 0.8
					mouthposition = 0.4
					nosesize = 0.7
					noseposition = 0.1
				}
			}
			cas_physique = {
				desc_id = malephysique
				additional_bone_transforms = [
					{
						bone = bone_head
						scaling = {
							value = (0.1, 0.1, 0.1)
						}
					}
					{
						bone = bone_neck
						scaling = {
							value = (0.3, 0.3, 0.3)
							no_propagate
						}
					}
					{
						bone = bone_chest
						scaling = {
							value = (0.0, 0.5, 0.35000002)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, 0.0)
							no_propagate
						}
					}
					{
						bone = bone_collar_r
						scaling = {
							value = (0.2, 0.2, 0.2)
							no_propagate
						}
						translation = {
							value = (0.0, -0.05, 0.0)
						}
					}
					{
						bone = bone_collar_l
						scaling = {
							value = (0.2, 0.2, 0.2)
							no_propagate
						}
						translation = {
							value = (0.0, -0.05, 0.0)
						}
					}
					{
						bone = bone_pelvis
						scaling = {
							value = (0.0, 0.5, 0.65000004)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, 0.0)
							no_propagate
						}
					}
					{
						bone = bone_split_ass_l
						scaling = {
							value = (0.0, 0.6, 0.8)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, 0.0)
							no_propagate
						}
					}
					{
						bone = bone_split_ass_r
						scaling = {
							value = (0.0, 0.6, 0.8)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, 0.0)
							no_propagate
						}
					}
					{
						bone = bone_twist_bicep_top_r
						scaling = {
							value = (0.0, 1.0, 0.65000004)
							no_propagate
						}
					}
					{
						bone = bone_twist_bicep_mid_r
						scaling = {
							value = (0.0, 1.0, 0.8)
							no_propagate
						}
					}
					{
						bone = bone_bicep_r
						scaling = {
							value = (0.0, 0.8, 0.5)
							no_propagate
						}
					}
					{
						bone = bone_twist_bicep_top_l
						scaling = {
							value = (0.0, 1.0, 0.65000004)
							no_propagate
						}
					}
					{
						bone = bone_twist_bicep_mid_l
						scaling = {
							value = (0.0, 1.0, 0.8)
							no_propagate
						}
					}
					{
						bone = bone_bicep_l
						scaling = {
							value = (0.0, 0.8, 0.5)
							no_propagate
						}
					}
					{
						bone = bone_forearm_l
						scaling = {
							value = (0.0, 0.7, 0.35000002)
							no_propagate
						}
					}
					{
						bone = bone_forearm_r
						scaling = {
							value = (0.0, 0.7, 0.35000002)
							no_propagate
						}
					}
					{
						bone = bone_palm_l
						scaling = {
							value = (0.1, 0.1, 0.1)
						}
					}
					{
						bone = bone_palm_r
						scaling = {
							value = (0.1, 0.1, 0.1)
						}
					}
					{
						bone = bone_twist_thigh_r
						translation = {
							value = (0.0, 0.0, -0.027499998)
							no_propagate
						}
						scaling = {
							value = (0.0, 0.45000002, 0.35000002)
							no_propagate
						}
					}
					{
						bone = bone_twist_thigh_l
						translation = {
							value = (0.0, 0.0, 0.027499998)
							no_propagate
						}
						scaling = {
							value = (0.0, 0.45000002, 0.35000002)
							no_propagate
						}
					}
					{
						bone = bone_ankle_l
						scaling = {
							value = (-0.1, -0.1, -0.1)
						}
					}
					{
						bone = bone_ankle_r
						scaling = {
							value = (-0.1, -0.1, -0.1)
						}
					}
					{
						bone = bone_stomach_lower
						scaling = {
							value = (0.0, 0.5, 0.65000004)
							no_propagate
						}
						translation = {
							value = (-0.0, 0.0, 0.0)
						}
					}
					{
						bone = bone_stomach_upper
						scaling = {
							value = (0.0, 0.5, 0.65000004)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, 0.0)
							no_propagate
						}
					}
				]
			}
			cas_eyes = {
				desc_id = car_green_eyes
			}
			cas_male_hair = {
				desc_id = m_bmtl_hair_lars
			}
			cas_male_hat = {
				desc_id = none
			}
			cas_male_torso = {
				desc_id = m_bmtl_torso_lars
			}
			cas_male_legs = {
				desc_id = m_bmtl_legs_lars
			}
			cas_male_shoes = {
				desc_id = m_bmtl_shoes_lars
			}
			cas_male_acc_left = {
				desc_id = m_bmtl_acc_llars
			}
			cas_male_acc_right = {
				desc_id = m_bmtl_acc_rlars
			}
			cas_male_acc_face = {
				desc_id = none
			}
			cas_male_acc_ears = {
				desc_id = none
			}
			cas_guitar_body = {
				desc_id = guitar_body04
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/gtr_body_style4_d_01.dds`
						material = guitar_body_style_04_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style4_ld_01.img`
								color = yellow_1guitar
								flags = 4
								a = 75
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style4_dtl_04.img`
								flags = 4
								color = red_1
							}
						]
					}
				]
			}
			cas_guitar_neck = {
				desc_id = guitar_neck03
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/neck_maple_tb_03.dds`
						material = guitar_neck3_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/neck1_inlay_ornate1_d_05.img`
								flags = 4
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = guitar_head05
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/gtr_headtock05_d_01.dds`
						material = guitar_head_05_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_headtock05_ld_01.img`
								flags = 4
								color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_headtock05_dtl_06.img`
								flags = 4
								color = red_3
							}
						]
					}
				]
				chosen_materials = {
					material1 = orange_4
				}
			}
			cas_guitar_pickguards = {
				desc_id = gtr_body4_pickg01
			}
			cas_guitar_bridges = {
				desc_id = gtr_hardware05
				chosen_materials = {
					material1 = orange_4
				}
			}
			cas_guitar_knobs = {
				desc_id = gtr4_knob_type1_04
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_type1_blktan_3
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_body = {
				desc_id = cab_body_bb3a
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\cab_bodywood_b3a_e_mls.dds`
						material = cab_body_bb3a_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_bachwht_mls.img`
								color = black_1guitar
								a = 100
							}
							{
								texture = `tex/models/characters/layers/cab/cab_body_bach_dtl_pin.img`
								color = yellow_5guitar
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = cab_neck_bn1b
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/cab_neck_01b_rosewood_d_mls.dds`
						material = cab_neck_bn1b_neck
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_nek_wedgehigh.img`
								flags = 4
								color = yellow_4guitar
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = cab_head_bh7a
				chosen_materials = {
					material1 = grey_5guitar
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/cab_head_bh7a.dds`
						material = cab_head_bh7a_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_head_bh7a_wtfinish.img`
								flags = 4
								color = black_1guitar
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_046.img`
								x_trans = -30
								y_trans = -5
								x_scale = 60
								y_scale = 65
								rot = 6033
								flags = 27
								color = yellow_orange_4
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = cab_pickg_f3
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/cab_pickg_f1_d_mls.dds`
						material = cab_pickg_f1_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_pickg_f4w_d_mls.img`
								color = yellow_4
								flags = 4
								a = 90
							}
						]
					}
				]
			}
			cas_bass_pickups = {
				desc_id = cab_pickup_hack02
			}
			cas_bass_bridges = {
				desc_id = cab_bridge_hack
			}
			cas_bass_knobs = {
				desc_id = cab_knob_hack01
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_drums = {
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1.dds`
						material = cad_drums_01_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_06.img`
								flags = 32
								color = yellow_orange_4
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a.dds`
						material = cad_drums_01_bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_64.img`
								flags = 4
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
								color = yellow_orange_1
								x_scale = 120
								y_scale = 115
								flags = 3
								a = 70
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
								color = black_1guitar
								x_trans = -26
								x_scale = 10
								y_scale = 115
								flags = 3
								y_trans = -8
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_007.img`
								x_trans = -30
								flags = 3
								x_scale = 1
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_007.img`
								x_trans = -24
								x_scale = 1
								flags = 3
								y_scale = 110
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_036.img`
								x_trans = -27
								x_scale = 40
								y_scale = 40
								flags = 3
								y_trans = 11
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_036.img`
								color = black_1guitar
								x_trans = -27
								y_trans = 11
								x_scale = 35
								flags = 3
								y_scale = 35
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_033.img`
								x_trans = -27
								x_scale = 25
								y_scale = 10
								flags = 3
								y_trans = 23
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_033.img`
								color = black_1guitar
								x_trans = -27
								x_scale = 20
								y_scale = 15
								flags = 3
								y_trans = 21
							}
							{
								font = fontgrid_bordello
								text = 'A'
								x_trans = -32
								y_trans = 16
								x_scale = 40
								y_scale = 45
								flags = 3
								color = grey_5guitar
							}
							{
								font = fontgrid_bordello
								text = 'S'
								color = grey_5guitar
								x_trans = -24
								x_scale = 45
								y_scale = 45
								flags = 3
								y_trans = 10
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics020.img`
								x_trans = -28
								y_trans = -7
								x_scale = 40
								y_scale = 50
								rot = 1000
								flags = 19
								color = grey_5guitar
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics020.img`
								x_trans = -26
								y_trans = -7
								x_scale = 40
								y_scale = 50
								flags = 19
								rot = 5333
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
			cas_bass_highway = {
				desc_id = larshighway
			}
			cas_guitar_highway = {
				desc_id = larshighway
			}
			cas_drums_highway = {
				desc_id = larshighway
			}
			cas_male_intro_anim = {
				desc_id = intro_scary
			}
			cas_male_win_anim = {
				desc_id = win_scary
			}
			cas_male_lose_anim = {
				desc_id = lose_angryatcrowd
			}
		}
	}
	{
		name = midori
		fullname = qs(0x4c47fb49)
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		preset_icon = photo_midori
		blurb = qs(0xb9cf989d)
		appearance = {
			cas_character_name = {
				desc_id = midori
			}
			cas_greatest_outfit = {
				desc_id = false
			}
			genre = pop
			cas_body = {
				desc_id = gh4_car_midori
				bones = {
					noseposition = 0.38200003
					nosebridge = 0.6
					nosesize = 0.3
					mouthposition = 0.1
					mouthscale = 0.120000005
					lipshape = 0.0
					upperlipthickness = 0.875
					lowerlipthickness = 0.447
					mouthangle = 0.56700003
					mouthdepth = 0.4
					cheekboneshape = 0.8
					eyeposition = -0.3
					eyedepth = 1.0
					eyebrowshape = 1.0
					eyebrowsize = 0.5
					eyebrowangle = 0.3
					browposition = 0.3
					browdepth = 0.0
					jawscale = 0.9
					chinsize = 0.0
					facefullness = 0.4
					nosewidth = 0.3
					noseangle = 0.4
					nosetip = 0.9
					nosedepth = 0.265
					eyedistance = 0.2
					eyescale = 0.5
					eyeshape = 0.7
					eyeangle = 0.4
				}
				chosen_materials = {
					skin = yellow_orange_5
				}
			}
			cas_physique = {
				desc_id = femalephysique
				additional_bone_transforms = [
					{
						bone = control_root
						scaling = {
							value = (-0.075, -0.075, -0.075)
						}
					}
					{
						bone = bone_head
						scaling = {
							value = (0.05, 0.05, 0.05)
						}
					}
				]
			}
			cas_eyes = {
				desc_id = car_green_eyes
			}
			cas_female_hair = {
				desc_id = f_pop_hair_midori
			}
			cas_female_torso = {
				desc_id = f_pop_torso_midori
			}
			cas_female_legs = {
				desc_id = f_pop_legs_skirt
			}
			cas_female_shoes = {
				desc_id = f_pop_shoe_platforms
			}
			cas_female_acc_left = {
				desc_id = none
			}
			cas_female_acc_right = {
				desc_id = none
			}
			cas_female_acc_ears = {
				desc_id = none
			}
			cas_guitar_body = {
				desc_id = guitar_body04
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/gtr_body_style4_d_01.dds`
						material = guitar_body_style_04_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style4_ld_01.img`
								color = yellow_1guitar
								flags = 4
								a = 75
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style4_dtl_04.img`
								flags = 4
								color = red_1
							}
						]
					}
				]
			}
			cas_guitar_neck = {
				desc_id = guitar_neck03
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/neck_maple_tb_03.dds`
						material = guitar_neck3_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/neck1_inlay_ornate1_d_05.img`
								flags = 4
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = guitar_head05
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/gtr_headtock05_d_01.dds`
						material = guitar_head_05_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_headtock05_ld_01.img`
								flags = 4
								color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_headtock05_dtl_06.img`
								flags = 4
								color = red_3
							}
						]
					}
				]
				chosen_materials = {
					material1 = orange_4
				}
			}
			cas_guitar_pickguards = {
				desc_id = gtr_body4_pickg01
			}
			cas_guitar_bridges = {
				desc_id = gtr_hardware05
				chosen_materials = {
					material1 = orange_4
				}
			}
			cas_guitar_knobs = {
				desc_id = gtr4_knob_type1_04
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_type1_blktan_3
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_body = {
				desc_id = cab_body_bb3a
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\cab_bodywood_b3a_e_mls.dds`
						material = cab_body_bb3a_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_bachwht_mls.img`
								color = black_1guitar
								a = 100
							}
							{
								texture = `tex/models/characters/layers/cab/cab_body_bach_dtl_pin.img`
								color = yellow_5guitar
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = cab_neck_bn1b
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/cab_neck_01b_rosewood_d_mls.dds`
						material = cab_neck_bn1b_neck
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_nek_wedgehigh.img`
								flags = 4
								color = yellow_4guitar
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = cab_head_bh7a
				chosen_materials = {
					material1 = grey_5guitar
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/cab_head_bh7a.dds`
						material = cab_head_bh7a_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_head_bh7a_wtfinish.img`
								flags = 4
								color = black_1guitar
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_046.img`
								x_trans = -30
								y_trans = -5
								x_scale = 60
								y_scale = 65
								rot = 6033
								flags = 27
								color = yellow_orange_4
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = cab_pickg_f3
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/cab_pickg_f1_d_mls.dds`
						material = cab_pickg_f1_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_pickg_f4w_d_mls.img`
								color = yellow_4
								flags = 4
								a = 90
							}
						]
					}
				]
			}
			cas_bass_pickups = {
				desc_id = cab_pickup_hack02
			}
			cas_bass_bridges = {
				desc_id = cab_bridge_hack
			}
			cas_bass_knobs = {
				desc_id = cab_knob_hack01
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_drums = {
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1.dds`
						material = cad_drums_01_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_06.img`
								flags = 32
								color = yellow_orange_4
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a.dds`
						material = cad_drums_01_bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_64.img`
								flags = 4
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
								color = yellow_orange_1
								x_scale = 120
								y_scale = 115
								flags = 3
								a = 70
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
								color = black_1guitar
								x_trans = -26
								x_scale = 10
								y_scale = 115
								flags = 3
								y_trans = -8
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_007.img`
								x_trans = -30
								flags = 3
								x_scale = 1
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_007.img`
								x_trans = -24
								x_scale = 1
								flags = 3
								y_scale = 110
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_036.img`
								x_trans = -27
								x_scale = 40
								y_scale = 40
								flags = 3
								y_trans = 11
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_036.img`
								color = black_1guitar
								x_trans = -27
								y_trans = 11
								x_scale = 35
								flags = 3
								y_scale = 35
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_033.img`
								x_trans = -27
								x_scale = 25
								y_scale = 10
								flags = 3
								y_trans = 23
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_033.img`
								color = black_1guitar
								x_trans = -27
								x_scale = 20
								y_scale = 15
								flags = 3
								y_trans = 21
							}
							{
								font = fontgrid_bordello
								text = 'A'
								x_trans = -32
								y_trans = 16
								x_scale = 40
								y_scale = 45
								flags = 3
								color = grey_5guitar
							}
							{
								font = fontgrid_bordello
								text = 'S'
								color = grey_5guitar
								x_trans = -24
								x_scale = 45
								y_scale = 45
								flags = 3
								y_trans = 10
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics020.img`
								x_trans = -28
								y_trans = -7
								x_scale = 40
								y_scale = 50
								rot = 1000
								flags = 19
								color = grey_5guitar
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics020.img`
								x_trans = -26
								y_trans = -7
								x_scale = 40
								y_scale = 50
								flags = 19
								rot = 5333
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
			cas_bass_highway = {
				desc_id = midorihighway
			}
			cas_guitar_highway = {
				desc_id = midorihighway
			}
			cas_drums_highway = {
				desc_id = midorihighway
			}
			cas_female_intro_anim = {
				desc_id = intro_hype
			}
			cas_female_win_anim = {
				desc_id = win_hype
			}
			cas_female_lose_anim = {
				desc_id = lose_angryatcrowd
			}
		}
	}
	{
		name = clive
		fullname = qs(0xccb97235)
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		preset_icon = photo_clive
		blurb = qs(0x3fef9d13)
		appearance = {
			cas_character_name = {
				desc_id = clive
			}
			cas_greatest_outfit = {
				desc_id = false
			}
			genre = `classic rock`
			cas_body = {
				desc_id = gh4_car_male
				random_weight = 15.0
				bones = {
					noseangle = 0.9
					nosetip = 0.6
					nosesize = 0.5
					noseposition = 0.405
					facefullness = 0.0
					jawscale = 0.5
					chinwidth = -1.5
					cheekboneshape = 0.0
					mouthscale = 0.2
					eyescale = 0.0
				}
			}
			cas_physique = {
				desc_id = malephysique
				additional_bone_transforms = [
					{
						bone = bone_head
						scaling = {
							value = (0.01, 0.01, 0.01)
							no_propagate
						}
					}
					{
						bone = bone_neck
						scaling = {
							value = (0.0, -0.5, -0.5)
							no_propagate
						}
					}
					{
						bone = bone_chest
						scaling = {
							value = (0.0, -0.2, -0.15)
							no_propagate
						}
					}
					{
						bone = bone_stomach_upper
						scaling = {
							value = (0.0, -0.1, -0.1)
							no_propagate
						}
					}
					{
						bone = bone_stomach_lower
						scaling = {
							value = (0.0, -0.1, -0.1)
							no_propagate
						}
					}
					{
						bone = bone_pelvis
						scaling = {
							value = (0.0, -0.1, -0.1)
							no_propagate
						}
					}
					{
						bone = bone_twist_bicep_top_r
						scaling = {
							value = (0.0, -0.3, -0.25)
							no_propagate
						}
					}
					{
						bone = bone_twist_bicep_mid_r
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = bone_bicep_r
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = bone_forearm_r
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = bone_twist_wrist_r
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = bone_twist_bicep_top_l
						scaling = {
							value = (0.0, -0.3, -0.25)
							no_propagate
						}
					}
					{
						bone = bone_twist_bicep_mid_l
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = bone_bicep_l
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = bone_forearm_l
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = bone_twist_wrist_l
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = bone_collar_r
						translation = {
							value = (0.0, 0.02, 0.0)
						}
					}
					{
						bone = bone_collar_l
						translation = {
							value = (0.0, 0.02, 0.0)
						}
					}
					{
						bone = bone_twist_thigh_r
						scaling = {
							value = (0.0, -0.4, -0.4)
							no_propagate
						}
					}
					{
						bone = bone_twist_thigh_l
						scaling = {
							value = (0.0, -0.4, -0.4)
							no_propagate
						}
					}
					{
						bone = bone_thigh_r
						scaling = {
							value = (0.0, -0.4, -0.4)
							no_propagate
						}
					}
					{
						bone = bone_thigh_l
						scaling = {
							value = (0.0, -0.4, -0.4)
							no_propagate
						}
					}
					{
						bone = bone_knee_r
						scaling = {
							value = (0.0, -0.15, -0.15)
							no_propagate
						}
					}
					{
						bone = bone_knee_l
						scaling = {
							value = (0.0, -0.15, -0.15)
							no_propagate
						}
					}
					{
						bone = bone_ankle_l
						scaling = {
							value = (0.0, 0.1, 0.2)
						}
					}
					{
						bone = bone_ankle_r
						scaling = {
							value = (0.0, 0.1, 0.2)
						}
					}
				]
			}
			cas_male_hair = {
				desc_id = m_clsc_hair_country
			}
			cas_male_hat = {
				desc_id = none
			}
			cas_male_facial_hair = {
				desc_id = m_clsc_fhair_stache04
				set_materials = {
					material1 = {
						diffuse = [
							51
							16
							5
						]
					}
				}
			}
			cas_male_torso = {
				desc_id = m_clsc_torso_clrdjakt
				chosen_materials = {
					material1 = red_orange_3
				}
			}
			cas_male_legs = {
				desc_id = m_clsc_legs_whtbells
				chosen_materials = {
					material1 = grey_1
				}
			}
			cas_male_shoes = {
				desc_id = m_clsc_shoe_whtboot
			}
			cas_male_acc_face = {
				desc_id = m_clsc_glasses_round2
			}
			cas_male_acc_ears = {
				desc_id = none
			}
			cas_male_acc_left = {
				desc_id = none
			}
			cas_male_acc_right = {
				desc_id = none
			}
			cas_guitar_body = {
				desc_id = guitar_body04
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/gtr_body_style4_d_01.dds`
						material = guitar_body_style_04_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style4_ld_01.img`
								color = yellow_1guitar
								flags = 4
								a = 75
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style4_dtl_04.img`
								flags = 4
								color = red_1
							}
						]
					}
				]
			}
			cas_guitar_neck = {
				desc_id = guitar_neck03
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/neck_maple_tb_03.dds`
						material = guitar_neck3_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/neck1_inlay_ornate1_d_05.img`
								flags = 4
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = guitar_head05
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/gtr_headtock05_d_01.dds`
						material = guitar_head_05_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_headtock05_ld_01.img`
								flags = 4
								color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_headtock05_dtl_06.img`
								flags = 4
								color = red_3
							}
						]
					}
				]
				chosen_materials = {
					material1 = orange_4
				}
			}
			cas_guitar_pickguards = {
				desc_id = gtr_body4_pickg01
			}
			cas_guitar_bridges = {
				desc_id = gtr_hardware05
				chosen_materials = {
					material1 = orange_4
				}
			}
			cas_guitar_knobs = {
				desc_id = gtr4_knob_type1_04
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_type1_blktan_3
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_body = {
				desc_id = cab_body_bb3a
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\cab_bodywood_b3a_e_mls.dds`
						material = cab_body_bb3a_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_bachwht_mls.img`
								color = black_1guitar
								a = 100
							}
							{
								texture = `tex/models/characters/layers/cab/cab_body_bach_dtl_pin.img`
								color = yellow_5guitar
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = cab_neck_bn1b
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/cab_neck_01b_rosewood_d_mls.dds`
						material = cab_neck_bn1b_neck
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_nek_wedgehigh.img`
								flags = 4
								color = yellow_4guitar
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = cab_head_bh7a
				chosen_materials = {
					material1 = grey_5guitar
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/cab_head_bh7a.dds`
						material = cab_head_bh7a_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_head_bh7a_wtfinish.img`
								flags = 4
								color = black_1guitar
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_046.img`
								x_trans = -30
								y_trans = -5
								x_scale = 60
								y_scale = 65
								rot = 6033
								flags = 27
								color = yellow_orange_4
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = cab_pickg_f3
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/cab_pickg_f1_d_mls.dds`
						material = cab_pickg_f1_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_pickg_f4w_d_mls.img`
								color = yellow_4
								flags = 4
								a = 90
							}
						]
					}
				]
			}
			cas_bass_pickups = {
				desc_id = cab_pickup_hack02
			}
			cas_bass_bridges = {
				desc_id = cab_bridge_hack
			}
			cas_bass_knobs = {
				desc_id = cab_knob_hack01
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_drums = {
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1.dds`
						material = cad_drums_01_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_06.img`
								flags = 32
								color = yellow_orange_4
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a.dds`
						material = cad_drums_01_bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_64.img`
								flags = 4
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
								color = yellow_orange_1
								x_scale = 120
								y_scale = 115
								flags = 3
								a = 70
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
								color = black_1guitar
								x_trans = -26
								x_scale = 10
								y_scale = 115
								flags = 3
								y_trans = -8
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_007.img`
								x_trans = -30
								flags = 3
								x_scale = 1
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_007.img`
								x_trans = -24
								x_scale = 1
								flags = 3
								y_scale = 110
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_036.img`
								x_trans = -27
								x_scale = 40
								y_scale = 40
								flags = 3
								y_trans = 11
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_036.img`
								color = black_1guitar
								x_trans = -27
								y_trans = 11
								x_scale = 35
								flags = 3
								y_scale = 35
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_033.img`
								x_trans = -27
								x_scale = 25
								y_scale = 10
								flags = 3
								y_trans = 23
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_033.img`
								color = black_1guitar
								x_trans = -27
								x_scale = 20
								y_scale = 15
								flags = 3
								y_trans = 21
							}
							{
								font = fontgrid_bordello
								text = 'A'
								x_trans = -32
								y_trans = 16
								x_scale = 40
								y_scale = 45
								flags = 3
								color = grey_5guitar
							}
							{
								font = fontgrid_bordello
								text = 'S'
								color = grey_5guitar
								x_trans = -24
								x_scale = 45
								y_scale = 45
								flags = 3
								y_trans = 10
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics020.img`
								x_trans = -28
								y_trans = -7
								x_scale = 40
								y_scale = 50
								rot = 1000
								flags = 19
								color = grey_5guitar
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics020.img`
								x_trans = -26
								y_trans = -7
								x_scale = 40
								y_scale = 50
								flags = 19
								rot = 5333
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
			cas_bass_highway = {
				desc_id = winstonhighway
			}
			cas_guitar_highway = {
				desc_id = winstonhighway
			}
			cas_drums_highway = {
				desc_id = winstonhighway
			}
			cas_male_intro_anim = {
				desc_id = intro_generic3
			}
			cas_male_win_anim = {
				desc_id = win_generic2
			}
			cas_male_lose_anim = {
				desc_id = lose_generic
			}
		}
	}
	{
		name = pandora
		fullname = qs(0xd26ebef4)
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		preset_icon = photo_pandora
		blurb = qs(0x45041cfd)
		appearance = {
			cas_character_name = {
				desc_id = pandora
			}
			cas_greatest_outfit = {
				desc_id = false
			}
			genre = goth
			cas_body = {
				desc_id = gh4_car_pandora
				chosen_materials = {
					skin = skin_pandora
				}
				bones = {
					eyeangle = 0.7
					eyeshape = 0.733
					eyescale = 0.0
					nosesize = 0.0
					mouthscale = 0.3
					lowerlipthickness = 0.147
					lipshape = 0.7
					cheekboneshape = 0.3
				}
			}
			cas_physique = {
				desc_id = femalephysique
				bones = {
					physique = -1.0
				}
			}
			cas_female_hair = {
				desc_id = f_goth_hair_updo
			}
			cas_female_hat = {
				desc_id = none
			}
			cas_female_torso = {
				desc_id = f_goth_torso_frillybodice
			}
			cas_female_legs = {
				desc_id = f_goth_legs_frillydress
			}
			cas_female_shoes = {
				desc_id = f_goth_shoes_maryjanes
			}
			cas_female_acc_left = {
				desc_id = none
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
			cas_female_intro_anim = {
				desc_id = intro_hype
			}
			cas_female_win_anim = {
				desc_id = win_hype
			}
			cas_female_lose_anim = {
				desc_id = lose_angryatcrowd
			}
			cas_guitar_body = {
				desc_id = guitar_body04
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/gtr_body_style4_d_01.dds`
						material = guitar_body_style_04_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style4_ld_01.img`
								color = yellow_1guitar
								flags = 4
								a = 75
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style4_dtl_04.img`
								flags = 4
								color = red_1
							}
						]
					}
				]
			}
			cas_guitar_neck = {
				desc_id = guitar_neck03
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/neck_maple_tb_03.dds`
						material = guitar_neck3_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/neck1_inlay_ornate1_d_05.img`
								flags = 4
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = guitar_head05
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/gtr_headtock05_d_01.dds`
						material = guitar_head_05_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_headtock05_ld_01.img`
								flags = 4
								color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_headtock05_dtl_06.img`
								flags = 4
								color = red_3
							}
						]
					}
				]
				chosen_materials = {
					material1 = orange_4
				}
			}
			cas_guitar_pickguards = {
				desc_id = gtr_body4_pickg01
			}
			cas_guitar_bridges = {
				desc_id = gtr_hardware05
				chosen_materials = {
					material1 = orange_4
				}
			}
			cas_guitar_knobs = {
				desc_id = gtr4_knob_type1_04
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_type1_blktan_3
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_body = {
				desc_id = cab_body_bb3a
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\cab_bodywood_b3a_e_mls.dds`
						material = cab_body_bb3a_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_bachwht_mls.img`
								color = black_1guitar
								a = 100
							}
							{
								texture = `tex/models/characters/layers/cab/cab_body_bach_dtl_pin.img`
								color = yellow_5guitar
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = cab_neck_bn1b
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/cab_neck_01b_rosewood_d_mls.dds`
						material = cab_neck_bn1b_neck
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_nek_wedgehigh.img`
								flags = 4
								color = yellow_4guitar
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = cab_head_bh7a
				chosen_materials = {
					material1 = grey_5guitar
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/cab_head_bh7a.dds`
						material = cab_head_bh7a_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_head_bh7a_wtfinish.img`
								flags = 4
								color = black_1guitar
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_046.img`
								x_trans = -30
								y_trans = -5
								x_scale = 60
								y_scale = 65
								rot = 6033
								flags = 27
								color = yellow_orange_4
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = cab_pickg_f3
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/cab_pickg_f1_d_mls.dds`
						material = cab_pickg_f1_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_pickg_f4w_d_mls.img`
								color = yellow_4
								flags = 4
								a = 90
							}
						]
					}
				]
			}
			cas_bass_pickups = {
				desc_id = cab_pickup_hack02
			}
			cas_bass_bridges = {
				desc_id = cab_bridge_hack
			}
			cas_bass_knobs = {
				desc_id = cab_knob_hack01
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_drums = {
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1.dds`
						material = cad_drums_01_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_06.img`
								flags = 32
								color = yellow_orange_4
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a.dds`
						material = cad_drums_01_bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_64.img`
								flags = 4
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
								color = yellow_orange_1
								x_scale = 120
								y_scale = 115
								flags = 3
								a = 70
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
								color = black_1guitar
								x_trans = -26
								x_scale = 10
								y_scale = 115
								flags = 3
								y_trans = -8
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_007.img`
								x_trans = -30
								flags = 3
								x_scale = 1
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_007.img`
								x_trans = -24
								x_scale = 1
								flags = 3
								y_scale = 110
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_036.img`
								x_trans = -27
								x_scale = 40
								y_scale = 40
								flags = 3
								y_trans = 11
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_036.img`
								color = black_1guitar
								x_trans = -27
								y_trans = 11
								x_scale = 35
								flags = 3
								y_scale = 35
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_033.img`
								x_trans = -27
								x_scale = 25
								y_scale = 10
								flags = 3
								y_trans = 23
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_033.img`
								color = black_1guitar
								x_trans = -27
								x_scale = 20
								y_scale = 15
								flags = 3
								y_trans = 21
							}
							{
								font = fontgrid_bordello
								text = 'A'
								x_trans = -32
								y_trans = 16
								x_scale = 40
								y_scale = 45
								flags = 3
								color = grey_5guitar
							}
							{
								font = fontgrid_bordello
								text = 'S'
								color = grey_5guitar
								x_trans = -24
								x_scale = 45
								y_scale = 45
								flags = 3
								y_trans = 10
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics020.img`
								x_trans = -28
								y_trans = -7
								x_scale = 40
								y_scale = 50
								rot = 1000
								flags = 19
								color = grey_5guitar
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics020.img`
								x_trans = -26
								y_trans = -7
								x_scale = 40
								y_scale = 50
								flags = 19
								rot = 5333
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
			cas_bass_highway = {
				desc_id = purplespiderhighway
			}
			cas_guitar_highway = {
				desc_id = purplespiderhighway
			}
			cas_drums_highway = {
				desc_id = purplespiderhighway
			}
		}
	}
	{
		name = eddie
		fullname = qs(0x91c2e6b5)
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		preset_icon = photo_eddie
		blurb = qs(0xfa4a04e8)
		appearance = {
			cas_character_name = {
				desc_id = eddie
			}
			cas_greatest_outfit = {
				desc_id = false
			}
			genre = rock
			cas_body = {
				desc_id = gh4_car_eddie
				bones = {
					facefullness = 0.33200002
					jawscale = 0.5
					chinsize = 1.0
					cheekboneshape = 0.0
					eartip = 0.2
					earangle = 0.44799998
					noseangle = 1.0
					nosewidth = 0.0
					mouthscale = 0.1
					eyedepth = 0.367
					eyescale = 0.1
					eyeshape = 1.0
					headsize = -1.0
				}
			}
			cas_physique = {
				desc_id = malephysique
				bones = {
					height = 1.0
				}
				additional_bone_transforms = [
					{
						bone = bone_chest
						scaling = {
							value = (0.075, 0.075, 0.075)
							no_propagate
						}
					}
					{
						bone = bone_collar_r
						scaling = {
							value = (0.2, 0.1, 0.1)
							no_propagate
						}
						translation = {
							value = (0.0, -0.015, 0.0)
						}
					}
					{
						bone = bone_collar_l
						scaling = {
							value = (0.2, 0.1, 0.1)
							no_propagate
						}
						translation = {
							value = (0.0, -0.015, 0.0)
						}
					}
					{
						bone = bone_pelvis
						scaling = {
							value = (-0.1, -0.1, -0.1)
							no_propagate
						}
					}
					{
						bone = bone_stomach_upper
						scaling = {
							value = (0.0, 0.0, 0.0)
						}
					}
					{
						bone = bone_twist_bicep_top_r
						scaling = {
							value = (0.0, 0.2, 0.15)
							no_propagate
						}
					}
					{
						bone = bone_twist_bicep_mid_r
						scaling = {
							value = (0.0, 0.2, 0.15)
							no_propagate
						}
					}
					{
						bone = bone_bicep_r
						scaling = {
							value = (0.0, 0.2, 0.15)
							no_propagate
						}
					}
					{
						bone = bone_twist_bicep_top_l
						scaling = {
							value = (0.0, 0.2, 0.15)
							no_propagate
						}
					}
					{
						bone = bone_twist_bicep_mid_l
						scaling = {
							value = (0.0, 0.2, 0.15)
							no_propagate
						}
					}
					{
						bone = bone_bicep_l
						scaling = {
							value = (0.0, 0.2, 0.15)
							no_propagate
						}
					}
					{
						bone = bone_twist_thigh_r
						translation = {
							value = (0.0, 0.0, 0.0)
							no_propagate
						}
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = bone_twist_thigh_l
						translation = {
							value = (0.0, 0.0, 0.0)
							no_propagate
						}
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = bone_thigh_r
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = bone_thigh_l
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = bone_knee_r
						scaling = {
							value = (0.0, -0.15, -0.15)
							no_propagate
						}
					}
					{
						bone = bone_knee_l
						scaling = {
							value = (0.0, -0.15, -0.15)
							no_propagate
						}
					}
					{
						bone = bone_stomach_lower
						scaling = {
							value = (-0.2, -0.2, -0.2)
							no_propagate
						}
						translation = {
							value = (-0.01, 0.0, 0.0)
							no_propagate
						}
					}
					{
						bone = bone_stomach_upper
						scaling = {
							value = (-0.1, -0.1, -0.1)
							no_propagate
						}
					}
				]
			}
			cas_male_hair = {
				desc_id = m_pop_hair_eddieknox
			}
			cas_male_hat = {
				desc_id = none
			}
			cas_male_facial_hair = {
				desc_id = none
			}
			cas_male_torso = {
				desc_id = m_punk_torso_bowling
				chosen_materials = {
					material2 = grey_5
				}
			}
			cas_male_legs = {
				desc_id = m_punk_legs_cuff
			}
			cas_male_shoes = {
				desc_id = m_punk_shoes_johnny1
			}
			cas_male_acc_left = {
				desc_id = m_pop_acc_lband
			}
			cas_male_acc_right = {
				desc_id = m_punk_acc_rchain
			}
			cas_male_acc_face = {
				desc_id = none
			}
			cas_male_acc_ears = {
				desc_id = none
			}
			cas_guitar_body = {
				desc_id = guitar_body04
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/gtr_body_style4_d_01.dds`
						material = guitar_body_style_04_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style4_ld_01.img`
								color = yellow_1guitar
								flags = 4
								a = 75
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style4_dtl_04.img`
								flags = 4
								color = red_1
							}
						]
					}
				]
			}
			cas_guitar_neck = {
				desc_id = guitar_neck03
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/neck_maple_tb_03.dds`
						material = guitar_neck3_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/neck1_inlay_ornate1_d_05.img`
								flags = 4
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = guitar_head05
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/gtr_headtock05_d_01.dds`
						material = guitar_head_05_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_headtock05_ld_01.img`
								flags = 4
								color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_headtock05_dtl_06.img`
								flags = 4
								color = red_3
							}
						]
					}
				]
				chosen_materials = {
					material1 = orange_4
				}
			}
			cas_guitar_pickguards = {
				desc_id = gtr_body4_pickg01
			}
			cas_guitar_bridges = {
				desc_id = gtr_hardware05
				chosen_materials = {
					material1 = orange_4
				}
			}
			cas_guitar_knobs = {
				desc_id = gtr4_knob_type1_04
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_type1_blktan_3
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_body = {
				desc_id = cab_body_bb3a
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\cab_bodywood_b3a_e_mls.dds`
						material = cab_body_bb3a_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_bachwht_mls.img`
								color = black_1guitar
								a = 100
							}
							{
								texture = `tex/models/characters/layers/cab/cab_body_bach_dtl_pin.img`
								color = yellow_5guitar
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = cab_neck_bn1b
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/cab_neck_01b_rosewood_d_mls.dds`
						material = cab_neck_bn1b_neck
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_nek_wedgehigh.img`
								flags = 4
								color = yellow_4guitar
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = cab_head_bh7a
				chosen_materials = {
					material1 = grey_5guitar
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/cab_head_bh7a.dds`
						material = cab_head_bh7a_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_head_bh7a_wtfinish.img`
								flags = 4
								color = black_1guitar
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_046.img`
								x_trans = -30
								y_trans = -5
								x_scale = 60
								y_scale = 65
								rot = 6033
								flags = 27
								color = yellow_orange_4
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = cab_pickg_f3
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/cab_pickg_f1_d_mls.dds`
						material = cab_pickg_f1_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_pickg_f4w_d_mls.img`
								color = yellow_4
								flags = 4
								a = 90
							}
						]
					}
				]
			}
			cas_bass_pickups = {
				desc_id = cab_pickup_hack02
			}
			cas_bass_bridges = {
				desc_id = cab_bridge_hack
			}
			cas_bass_knobs = {
				desc_id = cab_knob_hack01
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_drums = {
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1.dds`
						material = cad_drums_01_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_06.img`
								flags = 32
								color = yellow_orange_4
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a.dds`
						material = cad_drums_01_bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_64.img`
								flags = 4
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
								color = yellow_orange_1
								x_scale = 120
								y_scale = 115
								flags = 3
								a = 70
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
								color = black_1guitar
								x_trans = -26
								x_scale = 10
								y_scale = 115
								flags = 3
								y_trans = -8
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_007.img`
								x_trans = -30
								flags = 3
								x_scale = 1
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_007.img`
								x_trans = -24
								x_scale = 1
								flags = 3
								y_scale = 110
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_036.img`
								x_trans = -27
								x_scale = 40
								y_scale = 40
								flags = 3
								y_trans = 11
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_036.img`
								color = black_1guitar
								x_trans = -27
								y_trans = 11
								x_scale = 35
								flags = 3
								y_scale = 35
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_033.img`
								x_trans = -27
								x_scale = 25
								y_scale = 10
								flags = 3
								y_trans = 23
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_033.img`
								color = black_1guitar
								x_trans = -27
								x_scale = 20
								y_scale = 15
								flags = 3
								y_trans = 21
							}
							{
								font = fontgrid_bordello
								text = 'A'
								x_trans = -32
								y_trans = 16
								x_scale = 40
								y_scale = 45
								flags = 3
								color = grey_5guitar
							}
							{
								font = fontgrid_bordello
								text = 'S'
								color = grey_5guitar
								x_trans = -24
								x_scale = 45
								y_scale = 45
								flags = 3
								y_trans = 10
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics020.img`
								x_trans = -28
								y_trans = -7
								x_scale = 40
								y_scale = 50
								rot = 1000
								flags = 19
								color = grey_5guitar
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics020.img`
								x_trans = -26
								y_trans = -7
								x_scale = 40
								y_scale = 50
								flags = 19
								rot = 5333
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
			cas_bass_highway = {
				desc_id = flameshighway
			}
			cas_guitar_highway = {
				desc_id = flameshighway
			}
			cas_drums_highway = {
				desc_id = flameshighway
			}
		}
	}
	{
		name = drummer
		fullname = qs(0x6e92ef31)
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		preset_icon = photo_drummer
		polaroid = matty_cannz
		blurb = qs(0x849eaa76)
		locked
		appearance = {
			cas_character_name = {
				desc_id = matty
			}
			cas_greatest_outfit = {
				desc_id = false
			}
			genre = `classic rock`
			cas_body = {
				desc_id = gh4_car_male
				bones = {
					eyescale = 0.3
					eyeangle = 0.29
					noseposition = 0.0
					nosewidth = 0.7
					eyeposition = -0.0
					eyedepth = 1.0
					mouthposition = 0.004
					mouthscale = 0.9
					mouthangle = 0.5
					upperlipthickness = 0.0
					lowerlipthickness = 0.0
					facefullness = 0.73199993
					eyebrowangle = 0.08
					chinsize = 1.0
					chinwidth = 0.0
					jawscale = 0.2
					cheekboneshape = 1.0
					earangle = 0.44799998
					eartip = 0.3
					eyeshape = 0.24200001
					eyedistance = -0.83
					eyebrowshape = 0.0
					noseangle = 0.9
					nosetip = 0.252
					browposition = 0.004
					eyebrowdistance = 0.6
					browdepth = 0.0
					nosebridge = 0.33900002
					nosedepth = 0.565
				}
				additional_bone_transforms = [
					{
						bone = bone_head
					}
					{
						bone = bone_scale_cheek_r
						translation = {
							value = (-0.001, 0.001, 0.0)
						}
					}
					{
						bone = bone_scale_cheek_l
						translation = {
							value = (0.001, 0.001, 0.0)
						}
					}
					{
						bone = bone_trans_chin
						translation = {
							value = (0.0, 0.005, 0.0)
						}
					}
					{
						bone = bone_trans_mouth
						scaling = {
							value = (0.155, 0.0, 0.0)
						}
					}
					{
						bone = bone_scale_nostrils
						translation = {
							value = (0.0, 0.003, 0.0)
						}
					}
				]
			}
			cas_physique = {
				desc_id = malephysique
				bones = {
					height = 1.0
				}
				additional_bone_transforms = [
					{
						bone = control_root
						scaling = {
							value = (-0.01, -0.01, -0.01)
						}
					}
					{
						bone = bone_pelvis
						scaling = {
							value = (0.0, 0.1, 0.2)
							no_propagate
						}
					}
					{
						bone = bone_stomach_lower
						scaling = {
							value = (0.1, 0.1, 0.3)
							no_propagate
						}
					}
					{
						bone = bone_stomach_upper
						scaling = {
							value = (0.1, 0.2, 0.4)
							no_propagate
						}
					}
					{
						bone = bone_neck
						scaling = {
							value = (0.0, 0.4, 0.4)
							no_propagate
						}
					}
					{
						bone = bone_head
						scaling = {
							value = (0.05, 0.05, 0.05)
						}
					}
					{
						bone = bone_chest
						scaling = {
							value = (0.1, 0.3, 0.4)
							no_propagate
						}
					}
					{
						bone = bone_collar_r
						scaling = {
							value = (0.0, 0.15, 0.3)
							no_propagate
						}
						rotation = {
							value = (0.0, -6.0, 0.0)
							no_propagate
						}
						translation = {
							value = (0.0, -0.05, 0.0)
						}
					}
					{
						bone = bone_collar_l
						scaling = {
							value = (0.0, 0.15, 0.3)
							no_propagate
						}
						rotation = {
							value = (0.0, 6.0, 0.0)
							no_propagate
						}
						translation = {
							value = (0.0, -0.05, 0.0)
						}
					}
					{
						bone = bone_bicep_r
						scaling = {
							value = (0.0, -0.3, -0.3)
							no_propagate
						}
					}
					{
						bone = bone_forearm_r
						scaling = {
							value = (0.0, 0.3, 0.3)
							no_propagate
						}
					}
					{
						bone = bone_twist_wrist_r
						scaling = {
							value = (0.0, 0.5, 0.5)
							no_propagate
						}
					}
					{
						bone = bone_palm_r
						scaling = {
							value = (0.0, 0.25, 0.25)
						}
					}
					{
						bone = bone_hand_thumb_base_r
						scaling = {
							value = (0.0, 0.3, 0.3)
						}
					}
					{
						bone = bone_hand_index_base_r
						scaling = {
							value = (0.0, 0.3, 0.3)
						}
					}
					{
						bone = bone_hand_middle_base_r
						scaling = {
							value = (0.0, 0.3, 0.3)
						}
					}
					{
						bone = bone_hand_ring_base_r
						scaling = {
							value = (0.0, 0.3, 0.3)
						}
					}
					{
						bone = bone_hand_pinkey_base_r
						scaling = {
							value = (0.0, 0.3, 0.3)
						}
					}
					{
						bone = bone_bicep_l
						scaling = {
							value = (0.0, -0.3, -0.3)
							no_propagate
						}
					}
					{
						bone = bone_forearm_l
						scaling = {
							value = (0.0, 0.3, 0.3)
							no_propagate
						}
					}
					{
						bone = bone_twist_wrist_l
						scaling = {
							value = (0.0, 0.5, 0.5)
							no_propagate
						}
					}
					{
						bone = bone_palm_l
						scaling = {
							value = (0.0, 0.25, 0.25)
						}
					}
					{
						bone = bone_hand_thumb_base_l
						scaling = {
							value = (0.0, 0.3, 0.3)
						}
					}
					{
						bone = bone_hand_index_base_l
						scaling = {
							value = (0.0, 0.3, 0.3)
						}
					}
					{
						bone = bone_hand_middle_base_l
						scaling = {
							value = (0.0, 0.3, 0.3)
						}
					}
					{
						bone = bone_hand_ring_base_l
						scaling = {
							value = (0.0, 0.3, 0.3)
						}
					}
					{
						bone = bone_hand_pinkey_base_l
						scaling = {
							value = (0.0, 0.3, 0.3)
						}
					}
					{
						bone = bone_split_ass_r
						translation = {
							value = (0.0, 0.0, 0.05)
							no_propagate
						}
					}
					{
						bone = bone_twist_thigh_r
						translation = {
							value = (0.0, 0.0, -0.025)
							no_propagate
						}
					}
					{
						bone = bone_split_ass_l
						translation = {
							value = (0.0, 0.0, -0.05)
							no_propagate
						}
					}
					{
						bone = bone_twist_thigh_l
						translation = {
							value = (0.0, 0.0, 0.025)
							no_propagate
						}
					}
				]
			}
			cas_male_hair = {
				desc_id = m_rock_hair_drummer
			}
			cas_male_torso = {
				desc_id = m_rock_torso_ripshirt
			}
			cas_male_legs = {
				desc_id = m_clsc_legs_ltjeans
			}
			cas_male_shoes = {
				desc_id = m_punk_shoe_buckleb
			}
			cas_male_acc_left = {
				desc_id = m_metl_acc_lzakk
			}
			cas_male_acc_right = {
				desc_id = m_metl_acc_rzakk
			}
			cas_male_acc_ears = {
				desc_id = none
			}
			cas_guitar_body = {
				desc_id = guitar_body01
			}
			cas_guitar_neck = {
				desc_id = guitar_neck01
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/neck_maple_tb_01.dds`
						material = guitar_neck1_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/neck1_inlay_dots1_d_01.img`
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = guitar_head01
			}
			cas_guitar_pickguards = {
				desc_id = guitar_pickg01
			}
			cas_guitar_bridges = {
				desc_id = gtr_hardware01a
			}
			cas_guitar_knobs = {
				desc_id = gtr_knobs_style_01a
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickups_style_01a
			}
			cas_bass_body = {
				desc_id = cab_body_prediktor
				cap = [
					{
						base_tex = `tex\models\car_instruments\guitars\gtr_predikt_body01_d_mls.dds`
						material = guitar_body_prediktor_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style16_ld_zeb.img`
								flags = 4
								color = red_orange_4
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style16_dtl_01b.img`
								flags = 4
								color = yellow_4guitar
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = cab_neck_bnebony
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/cab_nek_ebony01.dds`
						material = cab_neck_ebony_neck
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_nek_lyrmpl_blk_wht.img`
								flags = 4
								color = blue_4
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = cab_head_bh1a
				chosen_materials = {
					material1 = yellow_4guitar
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/cab_head_01_maple_d_mls.dds`
						material = cab_head_bh2a_headstock
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_head_gedulus_wtfinish.img`
								color = orange_1
								flags = 4
								a = 100
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = none
			}
			cas_bass_pickups = {
				desc_id = cab_pbass_pickup_a
			}
			cas_bass_bridges = {
				desc_id = cab_bridge_bb2a
				chosen_materials = {
					material1 = yellow_4guitar
				}
			}
			cas_bass_knobs = {
				desc_id = cab_knob_phunq05
				chosen_materials = {
					material1 = yellow_4guitar
				}
			}
			cas_drums = {
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1.dds`
						material = cad_drums_01_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_02.img`
								flags = 32
								color = red_orange_4
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a.dds`
						material = cad_drums_01_bassdrum
						diffuse
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_023.img`
								flags = 3
								color = blue_5
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001.img`
								x_trans = 6
								x_scale = 50
								y_scale = 50
								flags = 3
								color = violet_1
							}
						]
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_47.img`
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
			cas_mic = {
				desc_id = `classic rock`
			}
			cas_mic_stand = {
				desc_id = `classic rock`
			}
			cas_bass_highway = {
				desc_id = caseyhighway
			}
			cas_guitar_highway = {
				desc_id = caseyhighway
			}
			cas_drums_highway = {
				desc_id = caseyhighway
			}
			cas_male_intro_anim = {
				desc_id = intro_waving
			}
			cas_male_win_anim = {
				desc_id = win_generic2
			}
			cas_male_lose_anim = {
				desc_id = lose_generic
			}
		}
	}
	{
		name = bassist
		fullname = qs(0x01f96952)
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		preset_icon = photo_bassist
		polaroid = shirley_crowley
		blurb = qs(0xc636fd20)
		locked
		appearance = {
			cas_character_name = {
				desc_id = shirley
			}
			cas_greatest_outfit = {
				desc_id = false
			}
			genre = `classic rock`
			cas_body = {
				desc_id = gh4_car_female
				random_weight = 2.0
				cap = [
					{
						base_tex = `tex/models/characters/global/global_blank_head_dnc.dds`
						material = car_female_head
						cas_1
						post_layer = [
							{
								texture = 0xcf0f010a
								flags = 4
							}
							{
								texture = 0xd0b325dc
								flags = 4
								color = red_3
							}
						]
					}
				]
				chosen_materials = {
					skin = grey_5
				}
				bones = {
					mouthscale = 0.2
					lipshape = 0.1
					upperlipthickness = 0.4
					mouthposition = 0.8
					eyescale = 0.9
					eyeshape = 0.8
					eyeangle = 0.9
					eyeposition = -0.3
					nosesize = 0.2
					noseposition = 0.8
					mouthdepth = 0.0
					facefullness = 0.5
					eyebrowshape = 1.0
					eyebrowangle = 0.0
					headsize = 1.0
				}
			}
			cas_physique = {
				desc_id = femalephysique
				bones = {
					physique = -1.0
					height = -1.0
				}
				additional_bone_transforms = [
					{
						bone = control_root
						scaling = {
							value = (-0.05, -0.05, -0.05)
						}
					}
					{
						bone = bone_head
						scaling = {
							value = (0.025, 0.025, 0.025)
						}
					}
					{
						bone = bone_chest
						scaling = {
							value = (0.02, 0.02, 0.15)
							no_propagate
						}
						translation = {
							value = (-0.015, 0.0, 0.0)
							no_propagate
						}
					}
					{
						bone = bone_stomach_upper
						scaling = {
							value = (0.0, -0.1, -0.1)
							no_propagate
						}
					}
					{
						bone = bone_twist_bicep_top_r
						scaling = {
							value = (0.05, 0.05, 0.05)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, -0.015)
							no_propagate
						}
					}
					{
						bone = bone_twist_bicep_top_l
						scaling = {
							value = (0.05, 0.05, 0.05)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, 0.015)
							no_propagate
						}
					}
					{
						bone = bone_palm_r
						scaling = {
							value = (0.15, 0.15, 0.15)
						}
					}
					{
						bone = bone_palm_l
						scaling = {
							value = (0.15, 0.15, 0.15)
						}
					}
					{
						bone = bone_forearm_r
						scaling = {
							value = (0.0, 0.15, 0.15)
							no_propagate
						}
					}
					{
						bone = bone_forearm_l
						scaling = {
							value = (0.0, 0.15, 0.15)
							no_propagate
						}
					}
					{
						bone = bone_collar_r
						scaling = {
							value = (0.1, 0.1, 0.1)
							no_propagate
						}
					}
					{
						bone = bone_collar_l
						scaling = {
							value = (0.1, 0.1, 0.1)
							no_propagate
						}
					}
					{
						bone = bone_pelvis
						scaling = {
							value = (0.15, 0.25, 0.25)
							no_propagate
						}
						translation = {
							value = (0.015, 0.0, 0.0)
							no_propagate
						}
					}
					{
						bone = bone_split_ass_r
						scaling = {
							value = (0.0, 0.15, 0.15)
							no_propagate
						}
						translation = {
							value = (0.015, 0.0, 0.0)
							no_propagate
						}
					}
					{
						bone = bone_split_ass_l
						scaling = {
							value = (0.0, 0.15, 0.15)
							no_propagate
						}
						translation = {
							value = (0.015, 0.0, 0.0)
							no_propagate
						}
					}
					{
						bone = bone_twist_thigh_r
						scaling = {
							value = (0.0, 0.1, 0.1)
							no_propagate
						}
					}
					{
						bone = bone_twist_thigh_l
						scaling = {
							value = (0.0, 0.1, 0.1)
							no_propagate
						}
					}
					{
						bone = bone_thigh_r
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = bone_thigh_l
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = bone_toe_l
						scaling = {
							value = (0.1, 0.0, 0.2)
							no_propagate
						}
					}
					{
						bone = bone_toe_r
						scaling = {
							value = (0.1, 0.0, 0.2)
							no_propagate
						}
					}
				]
			}
			cas_eyes = {
				desc_id = car_brown_eyes
			}
			cas_female_hair = {
				desc_id = f_rock_hair_bass
			}
			cas_female_hat = {
				desc_id = none
			}
			cas_female_facial_hair = {
				desc_id = none
			}
			cas_female_torso = {
				desc_id = f_rock_torso_bass
			}
			cas_female_legs = {
				desc_id = f_rock_legs_jeans
			}
			cas_female_shoes = {
				desc_id = f_pop_shoes_hayleyshoes
			}
			cas_female_acc_left = {
				desc_id = f_punk_acc_lbands
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
			cas_guitar_body = {
				desc_id = guitar_body06
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/gtr_body_style6_d_01.dds`
						material = guitar_body_style_06_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style6_ld_62.img`
								flags = 4
							}
						]
					}
				]
			}
			cas_guitar_neck = {
				desc_id = guitar_neck02
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/neck_maple_tb_02.dds`
						material = guitar_neck2_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/neck1_inlay_dragons_d_18.img`
								flags = 4
								color = blue_5
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = guitar_head13
				chosen_materials = {
					material1 = orange_4
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/gtr_headtock13_d_01.dds`
						material = guitar_head_13_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_headtock13_ld_01.img`
								color = teal_1
								flags = 4
								a = 55
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_headtock13_dtl_01.img`
								color = teal_2
								flags = 4
								a = 50
							}
						]
					}
				]
			}
			cas_guitar_pickguards = {
				desc_id = none
			}
			cas_guitar_bridges = {
				desc_id = gtr_hardware01a
				chosen_materials = {
					material1 = orange_4
				}
			}
			cas_guitar_knobs = {
				desc_id = gtr6_knob_type1_03
				chosen_materials = {
					material1 = yellow_green_1guitar
				}
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_type2_03
				chosen_materials = {
					material1 = yellow_green_1guitar
				}
			}
			cas_bass_body = {
				desc_id = cab_body_chunder01
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\cab_body_chndra_d_mls.dds`
						material = cab_body_chunder01_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_body_chndr_wht_d_mls.img`
								flags = 4
								color = black_1guitar
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = cab_neck_bn1a
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/cab_neck_01_maple_d_mls.dds`
						material = cab_neck_bn1a_neck
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_nek_lyrmpl_blk_wht.img`
								flags = 4
								color = grey_1
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = cab_head_bh6b
			}
			cas_bass_pickguards = {
				desc_id = cab_pguardchndr04
			}
			cas_bass_pickups = {
				desc_id = cab_jp_pickup_a
			}
			cas_bass_bridges = {
				desc_id = cab_bridge_bb3a
			}
			cas_bass_knobs = {
				desc_id = cab_knob_chndr09
				chosen_materials = {
					material1 = orange_3
				}
			}
			cas_drums = {
				desc_id = basic
				cas_mic = {
					desc_id = `black metal`
				}
				cas_mic_stand = {
					desc_id = `classic rock`
				}
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1.dds`
						material = cad_drums_01_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_28.img`
								flags = 32
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a.dds`
						material = cad_drums_01_bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_81.img`
								flags = 4
								rot = 700
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
			cas_bass_highway = {
				desc_id = judyhighway
			}
			cas_guitar_highway = {
				desc_id = judyhighway
			}
			cas_drums_highway = {
				desc_id = judyhighway
			}
			cas_female_win_anim = {
				desc_id = win_waving
			}
			cas_female_lose_anim = {
				desc_id = lose_generic
			}
			cas_female_intro_anim = {
				desc_id = intro_generic1
			}
		}
	}
	{
		name = guitarist
		fullname = qs(0xf5d4554d)
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		preset_icon = photo_guitarist
		polaroid = marcus_fretshreder
		blurb = qs(0x8fb4fb50)
		locked
		appearance = {
			cas_character_name = {
				desc_id = marcus
			}
			cas_greatest_outfit = {
				desc_id = false
			}
			genre = `classic rock`
			cas_body = {
				desc_id = gh4_car_male
				bones = {
					eyeshape = 1.0
					eyeangle = 0.9
					eyebrowdistance = 0.2
					browposition = 0.2
					eyebrowangle = 0.0
					eyebrowshape = 0.0
					browdepth = 0.0
					cheekboneshape = 0.0
					jawscale = 0.5
					facefullness = 0.4
				}
			}
			cas_physique = {
				desc_id = malephysique
				bones = {
				}
				additional_bone_transforms = [
					{
						bone = control_root
						scaling = {
							value = (0.01, 0.01, 0.01)
						}
					}
					{
						bone = bone_pelvis
						scaling = {
							value = (0.0, 0.1, 0.1)
							no_propagate
						}
					}
					{
						bone = bone_stomach_upper
						scaling = {
							value = (0.0, 0.025, 0.025)
							no_propagate
						}
					}
					{
						bone = bone_neck
						scaling = {
							value = (0.0, 0.25, 0.25)
							no_propagate
						}
					}
					{
						bone = bone_head
						scaling = {
							value = (0.0, 0.0, 0.0)
							no_propagate
						}
					}
					{
						bone = bone_chest
						scaling = {
							value = (0.0, 0.25, 0.25)
							no_propagate
						}
					}
					{
						bone = bone_collar_r
						scaling = {
							value = (0.0, 0.15, 0.3)
							no_propagate
						}
						translation = {
							value = (0.0, -0.02, 0.0)
						}
					}
					{
						bone = bone_collar_l
						scaling = {
							value = (0.0, 0.15, 0.3)
							no_propagate
						}
						translation = {
							value = (0.0, -0.02, 0.0)
						}
					}
					{
						bone = bone_twist_bicep_top_r
						scaling = {
							value = (0.0, 0.05, 0.05)
							no_propagate
						}
					}
					{
						bone = bone_twist_bicep_top_l
						scaling = {
							value = (0.0, 0.05, 0.05)
							no_propagate
						}
					}
					{
						bone = bone_twist_bicep_mid_r
						scaling = {
							value = (0.0, 0.05, 0.05)
							no_propagate
						}
					}
					{
						bone = bone_twist_bicep_mid_l
						scaling = {
							value = (0.0, 0.05, 0.05)
							no_propagate
						}
					}
					{
						bone = bone_bicep_r
						scaling = {
							value = (0.0, -0.3, -0.3)
							no_propagate
						}
					}
					{
						bone = bone_forearm_r
						scaling = {
							value = (0.0, 0.3, 0.3)
							no_propagate
						}
					}
					{
						bone = bone_twist_wrist_r
						scaling = {
							value = (0.0, 0.4, 0.4)
							no_propagate
						}
					}
					{
						bone = bone_palm_r
						scaling = {
							value = (0.0, 0.2, 0.2)
						}
					}
					{
						bone = bone_hand_thumb_base_r
						scaling = {
							value = (0.0, 0.5, 0.5)
						}
					}
					{
						bone = bone_hand_index_base_r
						scaling = {
							value = (0.0, 0.5, 0.5)
						}
					}
					{
						bone = bone_hand_middle_base_r
						scaling = {
							value = (0.0, 0.5, 0.5)
						}
					}
					{
						bone = bone_hand_ring_base_r
						scaling = {
							value = (0.0, 0.5, 0.5)
						}
					}
					{
						bone = bone_hand_pinkey_base_r
						scaling = {
							value = (0.0, 0.5, 0.5)
						}
					}
					{
						bone = bone_bicep_l
						scaling = {
							value = (0.0, -0.3, -0.3)
							no_propagate
						}
					}
					{
						bone = bone_forearm_l
						scaling = {
							value = (0.0, 0.3, 0.3)
							no_propagate
						}
					}
					{
						bone = bone_twist_wrist_l
						scaling = {
							value = (0.0, 0.4, 0.4)
							no_propagate
						}
					}
					{
						bone = bone_palm_l
						scaling = {
							value = (0.0, 0.2, 0.2)
						}
					}
					{
						bone = bone_hand_thumb_base_l
						scaling = {
							value = (0.0, 0.5, 0.5)
						}
					}
					{
						bone = bone_hand_index_base_l
						scaling = {
							value = (0.0, 0.5, 0.5)
						}
					}
					{
						bone = bone_hand_middle_base_l
						scaling = {
							value = (0.0, 0.5, 0.5)
						}
					}
					{
						bone = bone_hand_ring_base_l
						scaling = {
							value = (0.0, 0.5, 0.5)
						}
					}
					{
						bone = bone_hand_pinkey_base_l
						scaling = {
							value = (0.0, 0.5, 0.5)
						}
					}
					{
						bone = bone_split_ass_r
						translation = {
							value = (0.0, 0.0, 0.03)
							no_propagate
						}
					}
					{
						bone = bone_twist_thigh_r
						scaling = {
							value = (0.0, -0.35000002, -0.35000002)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, -0.035)
							no_propagate
						}
					}
					{
						bone = bone_thigh_r
						scaling = {
							value = (0.0, -0.5, -0.5)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, -0.01)
							no_propagate
						}
					}
					{
						bone = bone_toe_r
						scaling = {
							value = (0.4, 0.4, 0.4)
							no_propagate
						}
					}
					{
						bone = bone_split_ass_l
						translation = {
							value = (0.0, 0.0, -0.03)
							no_propagate
						}
					}
					{
						bone = bone_twist_thigh_l
						scaling = {
							value = (0.0, -0.35000002, -0.35000002)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, 0.035)
							no_propagate
						}
					}
					{
						bone = bone_thigh_l
						scaling = {
							value = (0.0, -0.5, -0.5)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, 0.01)
							no_propagate
						}
					}
					{
						bone = bone_toe_l
						scaling = {
							value = (0.4, 0.4, 0.4)
							no_propagate
						}
					}
					{
						bone = bone_stomach_lower
						scaling = {
							value = (0.0, -0.2, 0.01)
							no_propagate
						}
					}
				]
			}
			cas_male_hair = {
				desc_id = m_rock_hair_guitarist
			}
			cas_male_torso = {
				desc_id = m_rock_torso_rolledslvs
			}
			cas_male_legs = {
				desc_id = m_bmtl_legs_plate
			}
			cas_male_shoes = {
				desc_id = m_punk_shoe_buckleb
			}
			cas_male_acc_left = {
				desc_id = m_metl_acc_lzakk
			}
			cas_male_acc_right = {
				desc_id = m_bmtl_acc_rlars
			}
			cas_male_acc_ears = {
				desc_id = none
			}
			cas_guitar_body = {
				desc_id = guitar_body09
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/gtr_body_style9_d_01.dds`
						material = guitar_body_style_09_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style9_ld_01.img`
								flags = 4
								color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style9_dtl_01.img`
							}
						]
					}
				]
			}
			cas_guitar_neck = {
				desc_id = guitar_neck03
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/neck_maple_tb_03.dds`
						material = guitar_neck3_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/neck1_inlay_tribal_d_17.img`
								flags = 4
								color = grey_2guitar
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = guitar_head10
				chosen_materials = {
					material1 = grey_4guitar
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/gtr_headtock10_d_01.dds`
						material = guitar_head_10_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_headtock10_ld_01.img`
								flags = 4
								color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_headtock10_dtl_01.img`
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
				desc_id = gtr_hardware01a
				chosen_materials = {
					material1 = grey_4guitar
				}
			}
			cas_guitar_knobs = {
				desc_id = gtr9_knob_type2_03
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_type1_blk_3
				chosen_materials = {
					material1 = grey_4guitar
				}
			}
			cas_bass_body = {
				desc_id = cab_body_prediktor
				cap = [
					{
						base_tex = `tex\models\car_instruments\guitars\gtr_predikt_body01_d_mls.dds`
						material = guitar_body_prediktor_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style16_ld_11.img`
								flags = 4
								color = purple_blue_2
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style16_dtl_04.img`
								color = blue_3
								flags = 4
								a = 65
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = cab_neck_bnebony
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/cab_nek_ebony01.dds`
						material = cab_neck_ebony_neck
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_nek_lyr_axess.img`
								flags = 4
								color = yellow_4guitar
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = cab_head_guppy
				chosen_materials = {
					material1 = orange_3
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/cab_head_guppy_d.dds`
						material = cab_head_guppy_headstock
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_head_guppy_wt.img`
								flags = 4
								color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cab/cab_head_guppy_dtl_01.img`
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
				desc_id = cab_pickups_bp1a
			}
			cas_bass_bridges = {
				desc_id = cab_bridge_bb1a
				chosen_materials = {
					material1 = orange_3
				}
			}
			cas_bass_knobs = {
				desc_id = cab_knob_phunq08
				chosen_materials = {
					material1 = orange_4
				}
			}
			cas_bass_strings = {
				desc_id = hybrid_slinky
			}
			cas_drums = {
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1.dds`
						material = cad_drums_01_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_40.img`
								flags = 32
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a.dds`
						material = cad_drums_01_bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_56.img`
								flags = 4
								color = navy_4
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
			cas_bass_highway = {
				desc_id = axelhighway
			}
			cas_guitar_highway = {
				desc_id = axelhighway
			}
			cas_drums_highway = {
				desc_id = axelhighway
			}
			cas_male_intro_anim = {
				desc_id = intro_waving
			}
			cas_male_win_anim = {
				desc_id = win_waving
			}
			cas_male_lose_anim = {
				desc_id = lose_fearful
			}
		}
	}
	{
		name = singer
		fullname = qs(0xdc881180)
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		preset_icon = photo_singer
		blurb = qs(0x2b22ca3b)
		polaroid = riki_lee
		locked
		appearance = {
			cas_character_name = {
				desc_id = riki
			}
			cas_greatest_outfit = {
				desc_id = false
			}
			genre = `classic rock`
			cas_body = {
				desc_id = gh4_car_male
				bones = {
					cheekboneshape = 1.0
					nosesize = 0.1
					noseangle = 0.87700003
					lipshape = 0.9
					lowerlipthickness = 0.0
					upperlipthickness = 0.5
					mouthscale = 0.8
					noseposition = 0.7
					mouthposition = 0.7
					facefullness = 0.1
					jawscale = 0.1
					chinsize = 1.0
				}
			}
			cas_physique = {
				desc_id = malephysique
				bones = {
					height = 0.1
					physique = -1.0
				}
				additional_bone_transforms = [
					{
						bone = bone_head
						scaling = {
							value = (0.1, 0.1, 0.1)
						}
					}
					{
						bone = bone_stomach_lower
						scaling = {
							value = (-0.05, -0.05, -0.05)
							stop_propagate
						}
					}
					{
						bone = bone_pelvis
						scaling = {
							value = (-0.25, -0.15, -0.125)
							no_propagate
						}
					}
					{
						bone = bone_split_ass_r
						translation = {
							value = (0.0, 0.0, 0.01)
							no_propagate
						}
					}
					{
						bone = bone_twist_thigh_r
						scaling = {
							value = (0.0, -0.45000002, -0.45000002)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, -0.025)
							no_propagate
						}
					}
					{
						bone = bone_thigh_r
						scaling = {
							value = (0.0, -0.5, -0.5)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, -0.01)
							no_propagate
						}
					}
					{
						bone = bone_knee_r
						scaling = {
							value = (0.0, -0.25, -0.25)
							no_propagate
						}
					}
					{
						bone = bone_toe_r
						scaling = {
							value = (0.4, 0.4, 0.4)
							no_propagate
						}
					}
					{
						bone = bone_split_ass_l
						translation = {
							value = (0.0, 0.0, -0.01)
							no_propagate
						}
					}
					{
						bone = bone_twist_thigh_l
						scaling = {
							value = (0.0, -0.45000002, -0.45000002)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, 0.025)
							no_propagate
						}
					}
					{
						bone = bone_thigh_l
						scaling = {
							value = (0.0, -0.5, -0.5)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, 0.01)
							no_propagate
						}
					}
					{
						bone = bone_knee_l
						scaling = {
							value = (0.0, -0.25, -0.25)
							no_propagate
						}
					}
					{
						bone = bone_toe_l
						scaling = {
							value = (0.4, 0.4, 0.4)
							no_propagate
						}
					}
					{
						bone = bone_palm_r
						scaling = {
							value = (0.01, 0.01, 0.01)
							stop_propagate
						}
					}
					{
						bone = bone_hand_thumb_base_r
						scaling = {
							value = (0.0, 0.5, 0.5)
						}
					}
					{
						bone = bone_hand_index_base_r
						scaling = {
							value = (0.0, 0.5, 0.5)
						}
					}
					{
						bone = bone_hand_middle_base_r
						scaling = {
							value = (0.0, 0.5, 0.5)
						}
					}
					{
						bone = bone_hand_ring_base_r
						scaling = {
							value = (0.0, 0.5, 0.5)
						}
					}
					{
						bone = bone_hand_pinkey_base_r
						scaling = {
							value = (0.0, 0.5, 0.5)
						}
					}
					{
						bone = bone_palm_l
						scaling = {
							value = (0.01, 0.01, 0.01)
							stop_propagate
						}
					}
					{
						bone = bone_hand_thumb_base_l
						scaling = {
							value = (0.0, 0.5, 0.5)
						}
					}
					{
						bone = bone_hand_index_base_l
						scaling = {
							value = (0.0, 0.5, 0.5)
						}
					}
					{
						bone = bone_hand_middle_base_l
						scaling = {
							value = (0.0, 0.5, 0.5)
						}
					}
					{
						bone = bone_hand_ring_base_l
						scaling = {
							value = (0.0, 0.5, 0.5)
						}
					}
					{
						bone = bone_hand_pinkey_base_l
						scaling = {
							value = (0.0, 0.5, 0.5)
						}
					}
					{
						bone = bone_collar_l
						scaling = {
							value = (0.15, 0.15, 0.15)
							no_propagate
						}
					}
					{
						bone = bone_collar_r
						scaling = {
							value = (0.15, 0.15, 0.15)
							no_propagate
						}
					}
					{
						bone = bone_twist_bicep_top_r
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = bone_twist_bicep_top_l
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = bone_twist_bicep_mid_l
						scaling = {
							value = (0.0, -0.3, -0.3)
							no_propagate
						}
					}
					{
						bone = bone_twist_bicep_mid_r
						scaling = {
							value = (0.0, -0.3, -0.3)
							no_propagate
						}
					}
					{
						bone = bone_bicep_l
						scaling = {
							value = (0.0, -0.4, -0.4)
							no_propagate
						}
					}
					{
						bone = bone_bicep_r
						scaling = {
							value = (0.0, -0.4, -0.4)
							no_propagate
						}
					}
					{
						bone = bone_forearm_l
						scaling = {
							value = (0.0, -0.25, -0.25)
							no_propagate
						}
					}
					{
						bone = bone_forearm_r
						scaling = {
							value = (0.0, -0.25, -0.25)
							no_propagate
						}
					}
				]
			}
			cas_male_hair = {
				desc_id = m_glam_hair_seagull
			}
			cas_male_hat = {
				desc_id = none
			}
			cas_male_facial_hair = {
				desc_id = none
			}
			cas_male_torso = {
				desc_id = m_torso_tasselvest
			}
			cas_male_legs = {
				desc_id = m_glam_legs_spandex
			}
			cas_male_shoes = {
				desc_id = m_clsc_shoe_drkboot
			}
			cas_male_acc_left = {
				desc_id = m_pop_acc_lband
			}
			cas_male_acc_right = {
				desc_id = m_rock_acc_rbracelet
			}
			cas_male_acc_face = {
				desc_id = m_clsc_glasses_avtr
			}
			cas_male_acc_ears = {
				desc_id = none
			}
			cas_guitar_body = {
				desc_id = guitar_body11
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/gtr_body_style11_d_01.dds`
						material = guitar_body_style_11_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style11_ld_13.img`
								flags = 4
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style11_dtl_03.img`
								color = red_1
								flags = 4
								a = 40
							}
						]
					}
				]
			}
			cas_guitar_neck = {
				desc_id = guitar_neck04
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/neck_maple_tb_04.dds`
						material = guitar_neck4_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/neck1_inlay_shards_d_12.img`
								flags = 4
								color = blue_5
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = guitar_head12
				chosen_materials = {
					material1 = grey_3guitar
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/gtr_headtock12_d_01.dds`
						material = guitar_head_12_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_headtock12_ld_01.img`
								flags = 4
								color = red_orange_2
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_headtock12_dtl_01.img`
								flags = 4
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
				desc_id = gtr_hardware01a
				chosen_materials = {
					material1 = grey_3guitar
				}
			}
			cas_guitar_knobs = {
				desc_id = gtr11_knob_type4_03
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_type1_blktan_2
				chosen_materials = {
					material1 = orange_2
				}
			}
			cas_bass_body = {
				desc_id = cab_body_b2a
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\cab_body_b1a_d_mls.dds`
						material = cab_body_arcos_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_body_arks_pale.img`
								color = red_1
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = cab_neck_bn1b
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/cab_neck_01b_rosewood_d_mls.dds`
						material = cab_neck_bn1b_neck
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_nek_blocks2.img`
								flags = 4
								color = blue_4
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = cab_head_bh4a
				chosen_materials = {
					material1 = orange_4
				}
			}
			cas_bass_pickguards = {
				desc_id = cab_pickg_bp1
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/cab_pickg_dark001.dds`
						material = cab_pickg_unos03_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_pgard_splatter01.img`
								flags = 4
								color = blue_4
							}
						]
					}
				]
			}
			cas_bass_pickups = {
				desc_id = cab_bumbl_pickup_a2
			}
			cas_bass_bridges = {
				desc_id = cab_bridge_bb1a
				chosen_materials = {
					material1 = orange_4
				}
			}
			cas_bass_knobs = {
				desc_id = cab_knob_unos03
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_drums = {
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1.dds`
						material = cad_drums_01_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_09.img`
								flags = 32
								color = red_1
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a.dds`
						material = cad_drums_01_bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_46.img`
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
			cas_mic = {
				desc_id = `classic rock`
			}
			cas_mic_stand = {
				desc_id = `classic rock`
			}
			cas_bass_highway = {
				desc_id = chainshighway
			}
			cas_guitar_highway = {
				desc_id = chainshighway
			}
			cas_drums_highway = {
				desc_id = chainshighway
			}
			cas_male_intro_anim = {
				desc_id = intro_pretentious
			}
			cas_male_win_anim = {
				desc_id = win_pretentious
			}
			cas_male_lose_anim = {
				desc_id = lose_pretentious
			}
		}
	}
	{
		name = folkspecial
		fullname = qs(0x4165c80e)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_special
		blurb = qs(0x3c64b4ff)
		polaroid = star_billy
		locked
		appearance = {
			genre = rock
			cas_character_name = {
				desc_id = folkspecial
			}
			cas_greatest_outfit = {
				desc_id = false
			}
			cas_full_body = {
				desc_id = folkspecial
			}
			cas_physique = {
				desc_id = malephysique
				bones = {
					height = -0.5
					physique = -0.2
				}
			}
			cas_guitar_body = {
				desc_id = guitar_body03
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/gtr_body_style3_d_01.dds`
						material = guitar_body_style_03_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style3_ld_20.img`
								flags = 4
							}
							{
								texture = `tex/models/characters/layers/cag/all_clear2.img`
								flags = 4
							}
						]
					}
				]
			}
			cas_guitar_neck = {
				desc_id = guitar_neck02
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/neck_maple_tb_02.dds`
						material = guitar_neck2_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/neck1_inlay_vine1_d_03.img`
								flags = 36
								color = black_1guitar
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = guitar_head16
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/gtr_predikt_hstock01_d_mls.dds`
						material = guitar_head_16_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_headtock16_ld_01.img`
								flags = 36
								color = red_orange_1
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_predikt_hstock01_dtl_03.img`
								flags = 36
								color = black_1guitar
							}
						]
					}
				]
			}
			cas_guitar_pickguards = {
				desc_id = gtr_body3_pickg02
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/pickgrd_body3_d_02.dds`
						material = pckgrd_body3_02_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/all_clear.img`
								flags = 4
							}
						]
					}
				]
			}
			cas_guitar_bridges = {
				desc_id = gtr_hardware06
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_knobs = {
				desc_id = gtr3_knob_type10_03
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_type5_03
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_body = {
				desc_id = cab_body_bandera
				cap = [
					{
						base_tex = `tex\models\car_instruments\guitars\gtr_body_style17_d.dds`
						material = guitar_body_bandera_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style17_ld_mplb.img`
								flags = 4
								color = orange_4
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style17_dtl_fin.img`
								flags = 4
								color = black_1guitar
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = cab_neck_bn1b
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/cab_neck_01b_rosewood_d_mls.dds`
						material = cab_neck_bn1b_neck
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_nek_barbwire.img`
								flags = 4
								color = black_1guitar
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = cab_head_bh6b
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/cab_head_trad_delx_d.dds`
						material = cab_head_chunder01_headstock
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_head_trad_delx_wtfinish.img`
								flags = 36
								color = red_orange_1
							}
							{
								texture = `tex/models/characters/layers/cab/cab_head_trad_delx_dtl_03.img`
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
			cas_bass_pickguards = {
				desc_id = none
			}
			cas_bass_pickups = {
				desc_id = cab_jbass_pickup_01
			}
			cas_bass_bridges = {
				desc_id = cab_bridge_mls
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_bass_knobs = {
				desc_id = cab_knob_phunq01
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_drums = {
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1.dds`
						material = cad_drums_01_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_pork7.img`
								flags = 32
								color = yellow_orange_3
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a.dds`
						material = cad_drums_01_bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_77.img`
								flags = 4
								color = violet_5
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
			cas_bass_highway = {
				desc_id = axelhighway
			}
			cas_guitar_highway = {
				desc_id = axelhighway
			}
			cas_drums_highway = {
				desc_id = axelhighway
			}
		}
	}
]
preset_musician_profiles_locked = [
	{
		name = randomappearance0
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		selection_not_allowed
		random_appearance_lookup
		appearance = {
		}
	}
	{
		name = randomappearance1
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		selection_not_allowed
		random_appearance_lookup
		appearance = {
		}
	}
	{
		name = randomappearance2
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		selection_not_allowed
		random_appearance_lookup
		appearance = {
		}
	}
	{
		name = randomappearance3
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		selection_not_allowed
		random_appearance_lookup
		appearance = {
		}
	}
	{
		name = worstfemalevocalist
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		selection_not_allowed
		appearance = {
			$worst_female_vocals_appearance
			$worst_female_appearance_hack
		}
	}
	{
		name = worstfemaledrummer
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		selection_not_allowed
		appearance = {
			$worst_female_drum_appearance
			$worst_female_appearance_hack
		}
	}
	{
		name = worstfemaleguitarist
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		selection_not_allowed
		appearance = {
			$worst_female_guitar_appearance
			$worst_female_appearance_hack
		}
	}
	{
		name = worstfemalebassist
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		selection_not_allowed
		appearance = {
			$worst_female_bass_appearance
			$worst_female_appearance_hack
		}
	}
	{
		name = worstmalevocalist
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		selection_not_allowed
		appearance = {
			$worst_male_vocals_appearance
			$worst_male_appearance_hack
		}
	}
	{
		name = worstmaledrummer
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		selection_not_allowed
		appearance = {
			$worst_male_drum_appearance
			$worst_male_appearance_hack
		}
	}
	{
		name = worstmaleguitarist
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		selection_not_allowed
		appearance = {
			$worst_male_guitar_appearance
			$worst_male_appearance_hack
		}
	}
	{
		name = worstmalebassist
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		selection_not_allowed
		appearance = {
			$worst_male_bass_appearance
			$worst_male_appearance_hack
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
		appearance = {
			cas_body = {
				desc_id = nobody
			}
			cas_bass_highway = {
				desc_id = axelhighway
			}
			cas_guitar_highway = {
				desc_id = axelhighway
			}
			cas_drums_highway = {
				desc_id = axelhighway
			}
			cas_female_win_anim = {
				desc_id = win_hype
			}
			cas_female_lose_anim = {
				desc_id = lose_angryatcrowd
			}
			cas_female_intro_anim = {
				desc_id = intro_hype
			}
		}
	}
]
