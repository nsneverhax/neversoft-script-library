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
				desc_id = m_metl_torso_axel2
			}
			cas_male_legs = {
				desc_id = m_metl_legs_axel2
			}
			cas_male_shoes = {
				desc_id = m_rock_shoe_canvas_d1
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
								font = fontgrid_text_a6
								text = 'A'
								x_trans = -32
								y_trans = 19
								x_scale = 40
								y_scale = 45
								flags = 3
								color = grey_5guitar
							}
							{
								font = fontgrid_text_a6
								text = 'S'
								color = grey_5guitar
								x_trans = -24
								x_scale = 45
								y_scale = 45
								flags = 3
								y_trans = 13
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
				desc_id = f_metl_hair_pony
				chosen_materials = {
					material1 = yellow_4
				}
			}
			cas_female_hat = {
				desc_id = none
			}
			cas_female_facial_hair = {
				desc_id = none
			}
			cas_female_torso = {
				desc_id = f_rock_torso_jjacket
			}
			cas_female_legs = {
				desc_id = f_rock_legs_leather
			}
			cas_female_shoes = {
				desc_id = f_rock_shoe_canvas
			}
			cas_female_acc_left = {
				desc_id = f_rock_acc_lstrap
			}
			cas_female_acc_right = {
				desc_id = f_punk_acc_rglvwatch
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
			cas_bass_body = {
				desc_id = cab_body_prediktor
				cap = [
					{
						base_tex = `tex\models\car_instruments\guitars\gtr_predikt_body01_d_mls.dds`
						material = guitar_body_prediktor_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style16_ld_01.img`
								flags = 4
								color = purple_blue_1
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style16_dtl_04.img`
								color = black_1guitar
								flags = 4
								a = 60
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_icon008.img`
								color = red_1
								x_trans = -23
								x_scale = 60
								y_scale = 130
								rot = 3150
								flags = 3
								a = 30
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_icons056.img`
								x_trans = 30
								x_scale = 30
								y_scale = 80
								rot = 3150
								flags = 19
								y_trans = -6
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_004.img`
								color = purple_blue_3
								x_trans = -36
								y_trans = -23
								x_scale = 45
								y_scale = 60
								flags = 3
								a = 40
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_icon_insect001.img`
								a = 40
								x_trans = -33
								y_trans = 28
								x_scale = 25
								y_scale = 45
								rot = 200
								flags = 3
								color = purple_blue_1
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
								texture = `tex/models/characters/layers/cab/cab_nek_birds.img`
								flags = 4
								color = purple_blue_1
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = cab_head_bh5a
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_bass_pickguards = {
				desc_id = none
			}
			cas_bass_pickups = {
				desc_id = cab_bumbl_pickup_a1
			}
			cas_bass_bridges = {
				desc_id = cab_bridge_bb1a
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_bass_knobs = {
				desc_id = cab_knob_phunq05
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
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_30.img`
								flags = 32
								color = purple_blue_3
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a.dds`
						material = cad_drums_01_bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/bass_skin_rm_02.img`
								flags = 4
								color = purple_blue_3
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001.img`
								a = 75
								y_trans = 29
								x_scale = 15
								y_scale = 15
								flags = 3
								x_trans = 15
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_icon_insect001.img`
								x_trans = -22
								y_trans = -17
								x_scale = 45
								y_scale = 55
								rot = 6083
								flags = 3
								color = blue_1
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_004.img`
								x_trans = 15
								y_trans = 33
								flags = 3
								color = blue_3
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks_zildjian2
			}
			cas_mic = {
				desc_id = `glam rock`
			}
			cas_mic_stand = {
				desc_id = rock
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
			cas_guitar_body = {
				desc_id = guitar_body02
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/gtr_body_style2_d_01.dds`
						material = guitar_body_style_02_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style2_d_05.img`
								flags = 4
								color = yellow_green_3guitar
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style2_dtl_23.img`
								flags = 4
							}
						]
					}
				]
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
								texture = `tex/models/characters/layers/cag/neck1_inlay_vine1_d_03.img`
								flags = 4
								color = blue_5
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = guitar_head02
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/gtr_headtock02_d_01.dds`
						material = headstock2_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_headtock02_ld_01.img`
								flags = 4
								color = yellow_green_3guitar
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_headtock02_dtl_02.img`
								flags = 4
								color = yellow_green_1guitar
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
				desc_id = gtr_hardware01b
				chosen_materials = {
					material1 = grey_4guitar
				}
			}
			cas_guitar_knobs = {
				desc_id = gtr2_knob_type9_04
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_type2_03
				chosen_materials = {
					material1 = black_1guitar
				}
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
			cas_bass_body = {
				desc_id = cab_body_prediktor
				cap = [
					{
						base_tex = `tex\models\car_instruments\guitars\gtr_predikt_body01_d_mls.dds`
						material = guitar_body_prediktor_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style16_ld_mplsb.img`
								flags = 4
								color = orange_4
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style_predikt_ray2.img`
								flags = 4
								color = green_3guitar
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
								texture = `tex/models/characters/layers/cab/cab_nek_lightning.img`
								flags = 4
								color = navy_1
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = cab_head_flay_rev
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/cab_head_flay001.dds`
						material = cab_head_bh1a_headstock
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_head_flay001_wtfinish.img`
								flags = 4
								color = green_3guitar
							}
							{
								texture = `tex/models/characters/layers/cab/cab_head_flay001_dtl_03.img`
								flags = 4
								color = red_orange_3
							}
						]
					}
				]
				chosen_materials = {
					material1 = red_orange_3
				}
			}
			cas_bass_pickguards = {
				desc_id = cab_pg_pred02
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/gtr_predikt_pickg02_d_mls.dds`
						material = gtr_body16_pickgrd_02_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_predikt_pickg02_tort.img`
								flags = 4
								color = green_3guitar
							}
						]
					}
				]
			}
			cas_bass_pickups = {
				desc_id = cab_pickup_hack02
			}
			cas_bass_bridges = {
				desc_id = cab_bridge_bb1a
				chosen_materials = {
					material1 = red_orange_3
				}
			}
			cas_bass_knobs = {
				desc_id = cab_knob_phunq04
				chosen_materials = {
					material1 = red_orange_3
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
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_46.img`
								flags = 32
								color = red_2
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a.dds`
						material = cad_drums_01_bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_47.img`
								flags = 4
								color = red_1
							}
						]
					}
				]
			}
			cas_mic = {
				desc_id = `glam rock`
			}
			cas_mic_stand = {
				desc_id = glam
			}
			cas_bass_highway = {
				desc_id = izzyhighway
			}
			cas_guitar_highway = {
				desc_id = izzyhighway
			}
			cas_drums_highway = {
				desc_id = izzyhighway
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
			cas_guitar_body = {
				desc_id = guitar_body03
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/gtr_body_style3_d_01.dds`
						material = guitar_body_style_03_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style3_ld_01.img`
								flags = 4
								color = red_2
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style3_dtl_82.img`
								flags = 4
								color = red_orange_2
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
								texture = `tex/models/characters/layers/cag/neck1_inlay_shards_d_12.img`
								flags = 4
								color = blue_5
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = guitar_head10
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/gtr_headtock10_d_01.dds`
						material = guitar_head_10_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_headtock10_ld_01.img`
								flags = 4
								color = red_2
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_headtock10_dtl_01.img`
								flags = 4
								color = orange_2
							}
						]
					}
				]
			}
			cas_guitar_pickguards = {
				desc_id = none
			}
			cas_guitar_bridges = {
				desc_id = gtr_hardware01b
			}
			cas_guitar_knobs = {
				desc_id = gtr3_knob_type10_03
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_type3_03
				chosen_materials = {
					material1 = red_1
				}
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
				chosen_materials = {
					material1 = red_3
					material2 = red_1
				}
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
				desc_id = win_hype
			}
			cas_female_lose_anim = {
				desc_id = lose_angryatcrowd
			}
			cas_female_intro_anim = {
				desc_id = intro_hype
			}
			cas_guitar_body = {
				desc_id = guitar_body14
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/gtr_body_style14_d_01.dds`
						material = guitar_body_style_14_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style14_ld_01.img`
								flags = 4
								color = violet_3
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style14_dtl_03.img`
								flags = 4
								color = purple_blue_1
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
								texture = `tex/models/characters/layers/cag/neck1_inlay_stars_d_02.img`
								flags = 4
								color = blue_4
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = guitar_head06
				chosen_materials = {
					material1 = blue_5
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/gtr_headtock06_d_01.dds`
						material = guitar_head_06_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_headtock06_ld_01.img`
								flags = 4
								color = purple_blue_1
							}
						]
					}
				]
			}
			cas_guitar_pickguards = {
				desc_id = gtr_body14_pickg02
			}
			cas_guitar_bridges = {
				desc_id = gtr_hardware01b
				chosen_materials = {
					material1 = blue_5
				}
			}
			cas_guitar_knobs = {
				desc_id = gtr14_knob_type2_04
				chosen_materials = {
					material1 = violet_3
				}
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_type1_blk_2
				chosen_materials = {
					material1 = violet_1
				}
			}
			cas_bass_body = {
				desc_id = cab_body_kelly
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\cab_body_kelly_d_mls.dds`
						material = cab_kelly_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_body_kelly_ld_zeb.img`
								flags = 4
								color = yellow_1guitar
							}
							{
								texture = `tex/models/characters/layers/cab/cab_body_kelly_dtl_tri.img`
								flags = 4
								color = red_1
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_icon005.img`
								color = red_orange_2
								x_trans = -7
								y_trans = 19
								x_scale = 40
								y_scale = 20
								rot = 5983
								flags = 3
								a = 90
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_icon009.img`
								x_trans = -25
								y_trans = -41
								x_scale = 90
								y_scale = 55
								rot = 5033
								flags = 19
								color = red_orange_2
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
								x_trans = -3
								y_trans = -38
								x_scale = 10
								y_scale = 20
								flags = 3
								color = black_1guitar
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_icon_creature007.img`
								x_trans = 32
								y_trans = -13
								x_skew = -30
								x_scale = 30
								y_scale = 60
								rot = 450
								flags = 3
								color = blue_2
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics014.img`
								x_trans = -42
								y_trans = 22
								x_scale = 10
								y_scale = 20
								flags = 3
								color = red_orange_2
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
								texture = `tex/models/characters/layers/cab/cab_nek_lyr_star_mop.img`
								flags = 4
								color = yellow_1guitar
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = cab_head_guppy
				chosen_materials = {
					material1 = grey_4guitar
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/cab_head_guppy_d.dds`
						material = cab_head_guppy_headstock
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_head_guppy_wt.img`
								color = black_1guitar
								flags = 4
								a = 85
							}
							{
								texture = `tex/models/characters/layers/cab/cab_head_guppy_dtl_01.img`
								flags = 4
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
				desc_id = cab_pickup_hack01
			}
			cas_bass_bridges = {
				desc_id = cab_bridge_mls
			}
			cas_bass_knobs = {
				desc_id = cab_knob_grmbl03
				chosen_materials = {
					material1 = orange_3
				}
			}
			cas_bass_highway = {
				desc_id = axelhighway
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
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_33.img`
								flags = 32
								color = blue_2
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a.dds`
						material = cad_drums_01_bassdrum
						diffuse
						layers = [
							{
								font = fontgrid_text_a6
								text = 'A'
								x_trans = -18
								y_trans = 15
								rot = 5333
								flags = 3
								color = navy_2
							}
							{
								font = fontgrid_text_a6
								text = 'X'
								x_trans = -8
								y_trans = 2
								rot = 5283
								flags = 3
								color = navy_2
							}
							{
								font = fontgrid_text_a6
								text = 'E'
								color = navy_2
								x_trans = 0
								y_trans = -11
								flags = 3
								rot = 5283
							}
							{
								font = fontgrid_text_a6
								text = 'L'
								color = navy_2
								y_trans = -24
								rot = 5133
								flags = 3
								x_trans = 8
							}
							{
								font = fontgrid_text_a6
								text = '!'
								color = navy_2
								y_trans = -34
								rot = 5033
								flags = 3
								x_trans = 14
							}
						]
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_35.img`
								rot = 950
								flags = 4
								color = navy_3
							}
						]
					}
				]
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
								color = red_orange_3
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a.dds`
						material = cad_drums_01_bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_15.img`
								flags = 4
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshapeoutline_002.img`
								flags = 3
								color = navy_1
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001.img`
								color = red_2
								x_scale = 45
								flags = 3
								y_scale = 45
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics014.img`
								x_scale = 30
								y_scale = 30
								flags = 3
								color = red_orange_4
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_icon009.img`
								color = red_3
								x_trans = -5
								y_trans = -1
								x_scale = 75
								y_scale = 70
								flags = 3
								rot = 2500
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
				desc_id = m_punk_torso_johnny1_03
			}
			cas_male_legs = {
				desc_id = m_punk_legs_johnny1
			}
			cas_male_shoes = {
				desc_id = m_punk_shoes_johnny2
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
			cas_drums = {
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1.dds`
						material = cad_drums_01_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_43.img`
								flags = 32
								color = green_3guitar
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a.dds`
						material = cad_drums_01_bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_04.img`
								flags = 4
								color = yellow_green_1guitar
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshapeoutline_002.img`
								color = purple_blue_1
								x_scale = 130
								flags = 3
								y_scale = 130
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_002.img`
								color = violet_1
								x_scale = 145
								flags = 3
								y_scale = 175
							}
						]
					}
				]
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
								color = orange_1
								flags = 4
								a = 85
							}
							{
								texture = `tex/models/characters/layers/cab/cab_body_chndr_dtl_trash.img`
								flags = 4
								color = green_4guitar
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_004.img`
								x_trans = -16
								y_trans = 30
								flags = 3
								color = teal_1
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_icon018.img`
								x_trans = -4
								x_scale = 175
								y_scale = 135
								rot = 2050
								flags = 3
								color = navy_1
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_012.img`
								flags = 3
								color = violet_1
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
								texture = `tex/models/characters/layers/cab/cab_nek_skulls.img`
								flags = 4
								color = green_1guitar
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = cab_head_sixtease
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/cab_head_sixtease_d_mls.dds`
						material = cab_head_sixtease_headstock
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_head_sixtease_wtfinish.img`
								color = green_1guitar
								flags = 4
								a = 70
							}
							{
								texture = `tex/models/characters/layers/cab/cab_head_sixtease_dtl_02.img`
								flags = 4
								color = orange_2
							}
						]
					}
				]
				chosen_materials = {
					material1 = green_4guitar
				}
			}
			cas_bass_pickguards = {
				desc_id = cab_pguardchndr04
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/cab_pickgchndr02_d_mls.dds`
						material = cab_pguardchndr05_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_pickgchndr02_tort_mls.img`
								flags = 4
								color = blue_4
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
				chosen_materials = {
					material1 = green_4guitar
				}
			}
			cas_bass_knobs = {
				desc_id = cab_knob_chndr08
				chosen_materials = {
					material1 = green_2guitar
				}
			}
			cas_bass_strings = {
				desc_id = power_slinky
			}
			cas_guitar_body = {
				desc_id = guitar_body12
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/gtr_body_style12_d_01.dds`
						material = guitar_body_style_12_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style12_ld_01.img`
								flags = 4
								color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style12_dtl_22.img`
								flags = 4
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
								texture = `tex/models/characters/layers/cag/neck1_inlay_ironx_d_07.img`
								flags = 4
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
				desc_id = gtr12_hardware_01
				chosen_materials = {
					material1 = grey_3guitar
				}
			}
			cas_guitar_knobs = {
				desc_id = gtr12_knob_type5_04
				chosen_materials = {
					material1 = grey_3guitar
				}
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_type1_blk_3
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_mic = {
				desc_id = punk
			}
			cas_mic_stand = {
				desc_id = glam
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
				desc_id = guitar_body07
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/gtr_body_style7_d_01.dds`
						material = guitar_body_style_07_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style7_ld_01.img`
								flags = 4
								color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style7_dtl_01.img`
								flags = 4
								color = grey_3guitar
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
								texture = `tex/models/characters/layers/cag/neck1_inlay_skulls_d_21.img`
								flags = 4
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = guitar_head09
				chosen_materials = {
					material1 = grey_3guitar
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/gtr_headtock09_d_01.dds`
						material = guitar_head_09_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_headtock09_ld_01.img`
								flags = 4
								color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_headtock09_dtl_01.img`
								flags = 4
								color = grey_2guitar
							}
						]
					}
				]
			}
			cas_guitar_pickguards = {
				desc_id = gtr_body7_pickg03
			}
			cas_guitar_bridges = {
				desc_id = gtr_hardware01a
				chosen_materials = {
					material1 = grey_3guitar
				}
			}
			cas_guitar_knobs = {
				desc_id = gtr7_knob_type4_03
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_type1_blk_3
				chosen_materials = {
					material1 = grey_2guitar
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
								texture = `tex/models/characters/layers/cag/gtr_body_style16_ld_17.img`
								flags = 4
								color = teal_4
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style16_dtl_02.img`
								color = teal_3
								flags = 4
								a = 50
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_icon025.img`
								color = teal_2
								a = 20
								x_trans = 35
								x_scale = 25
								y_scale = 65
								flags = 3
								y_trans = 2
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_icon_mammal001.img`
								color = teal_2
								a = 100
								x_trans = -36
								y_trans = 35
								x_scale = 20
								y_scale = 35
								rot = 33
								flags = 3
								x_skew = 0
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
								texture = `tex/models/characters/layers/cab/cab_nek_barbwire.img`
								flags = 4
								color = teal_4
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = cab_head_bh5a
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/cab_head_bh5a.dds`
						material = cab_head_bh5a_headstock
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_head_bh5a_wtfinish.img`
								flags = 4
								color = teal_3
							}
							{
								texture = `tex/models/characters/layers/cab/cab_head_bh5a_dtl_01.img`
								flags = 4
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
				desc_id = cab_pickups_emg03
			}
			cas_bass_bridges = {
				desc_id = cab_bridge_bb1a
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_bass_knobs = {
				desc_id = cab_knob_phunq05
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_bass_highway = {
				desc_id = larshighway
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
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_48.img`
								flags = 32
								color = teal_3
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a.dds`
						material = cad_drums_01_bassdrum
						diffuse
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_icon_mammal001.img`
								color = black_1guitar
								x_trans = -2
								x_scale = 60
								y_scale = 75
								flags = 3
								y_trans = 16
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_icon_mammal001.img`
								color = black_1guitar
								x_trans = -20
								x_scale = 45
								y_scale = 55
								flags = 3
								y_trans = -10
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_icon_mammal001.img`
								color = black_1guitar
								x_trans = 16
								x_scale = 35
								y_scale = 45
								flags = 3
								y_trans = -7
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_icon_mammal001.img`
								color = black_1guitar
								x_trans = -2
								y_trans = -23
								x_scale = 25
								y_scale = 26
								flags = 3
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_icon_mammal001.img`
								color = black_1guitar
								x_trans = 24
								y_trans = -23
								y_scale = 16
								flags = 3
								x_scale = 15
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_icon_mammal001.img`
								color = black_1guitar
								x_trans = -23
								y_trans = -33
								x_scale = 15
								flags = 3
								y_scale = 16
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_icon_mammal001.img`
								color = black_1guitar
								y_trans = -35
								x_scale = 10
								y_scale = 11
								flags = 3
								x_trans = 4
							}
						]
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_70.img`
								a = 55
								rot = 1750
								flags = 4
								color = teal_2
							}
						]
					}
				]
			}
			cas_mic = {
				desc_id = `classic rock`
			}
			cas_mic_stand = {
				desc_id = rock
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
				desc_id = guitar_body15
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/gtr_body_style15_d_01.dds`
						material = guitar_body_style_15_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style15_ld_01.img`
								flags = 4
								color = grey_5guitar
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style15_dtl_03.img`
								flags = 4
								color = violet_1
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
								texture = `tex/models/characters/layers/cag/neck1_inlay_stars_d_02.img`
								flags = 4
								color = violet_5
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = guitar_head10
				chosen_materials = {
					material1 = orange_4
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
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_headtock10_dtl_01.img`
								flags = 4
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
				desc_id = gtr_hardware01a
				chosen_materials = {
					material1 = orange_4
				}
			}
			cas_guitar_knobs = {
				desc_id = gtr15_knob_type3_03
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_type2_04
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
								texture = `tex/models/characters/layers/cag/gtr_body_style17001_d.img`
								flags = 4
								color = green_2guitar
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style17_dtl_fout.img`
								flags = 4
								color = green_3guitar
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = cab_neck_bfretlss02
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/cab_nekf_ebony01.dds`
						material = cab_neck_fretless02_neck
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_nek_seahorse_f.img`
								flags = 4
								color = purple_blue_3
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = cab_head_bhphnq01
				chosen_materials = {
					material1 = purple_blue_3
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/cab_head_bh8a.dds`
						material = cab_head_phunquie01_headstock
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_head_bh8a_wtfinish.img`
								flags = 4
								color = purple_blue_1
							}
							{
								texture = `tex/models/characters/layers/cab/cab_head_bh8a_dtl_03.img`
								flags = 4
								color = green_3guitar
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = none
			}
			cas_bass_pickups = {
				desc_id = cab_bumbl_pickup_a2
			}
			cas_bass_bridges = {
				desc_id = cab_bridge_bb2a
				chosen_materials = {
					material1 = purple_blue_3
				}
			}
			cas_bass_knobs = {
				desc_id = cab_knob_phunq10
				chosen_materials = {
					material1 = purple_blue_2
				}
			}
			cas_bass_strings = {
				desc_id = power_slinky
			}
			cas_bass_highway = {
				desc_id = axelhighway
			}
			cas_drums = {
				desc_id = basic
			}
			cas_mic = {
				desc_id = rock
			}
			cas_mic_stand = {
				desc_id = rock
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
				desc_id = guitar_body05
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/gtr_body_style5_d_01.dds`
						material = guitar_body_style_05_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style5_ld_41.img`
								flags = 4
								color = orange_4
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style5_dtl_03.img`
								color = red_1
								flags = 4
								a = 65
							}
						]
					}
				]
			}
			cas_guitar_neck = {
				desc_id = guitar_neck02
			}
			cas_guitar_head = {
				desc_id = guitar_head99
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
				desc_id = gtr4_knob_type10_04
				chosen_materials = {
					material1 = grey_4guitar
				}
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_type4_02
				chosen_materials = {
					material1 = red_1
				}
			}
			cas_bass_body = {
				desc_id = cab_body_sixtease
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\cab_body_sixtease01_d_mls.dds`
						material = cab_body_sixtease_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_body_sixteasewht_d_mls.img`
								flags = 4
								color = yellow_2guitar
							}
							{
								texture = `tex/models/characters/layers/cab/cab_body_6tease_dtl_tri.img`
								color = violet_1
								flags = 4
								a = 90
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
								texture = `tex/models/characters/layers/cab/cab_nek_moon.img`
								flags = 4
								color = blue_4
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = cab_head_grumbel01
				chosen_materials = {
					material1 = orange_3
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/cab_head_grumbel01.dds`
						material = cab_head_grumbel01_headstock
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_head_grumbel01_wtfinish.img`
								color = orange_2
								flags = 4
								a = 100
							}
							{
								texture = `tex/models/characters/layers/cab/cab_head_grumbel01_dtl_04.img`
								flags = 4
								color = violet_2
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = cab_pg_6tz004
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/cab_pg_6tz008.dds`
						material = cab_pg_6tz008_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_pg_6tz004c.img`
								flags = 4
								color = yellow_5
							}
						]
					}
				]
			}
			cas_bass_pickups = {
				desc_id = cab_pickups_emg02
			}
			cas_bass_bridges = {
				desc_id = cab_bridge_bb3a
				chosen_materials = {
					material1 = orange_3
				}
			}
			cas_bass_knobs = {
				desc_id = cab_knobs_6tz01
				chosen_materials = {
					material1 = yellow_1guitar
				}
			}
			cas_drums = {
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a.dds`
						material = cad_drums_01_bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_01.img`
								flags = 4
								color = blue_4
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_002.img`
								a = 100
								x_scale = 120
								y_scale = 120
								flags = 3
								color = red_orange_2
							}
							{
								font = fontgrid_text_a8
								text = 'W'
								flags = 3
								x_trans = -31
							}
							{
								font = fontgrid_text_a8
								text = 'I'
								x_trans = -22
								flags = 3
								y_scale = 125
							}
							{
								font = fontgrid_text_a8
								text = 'N'
								color = grey_5
								flags = 3
								x_trans = -14
							}
							{
								font = fontgrid_text_a8
								text = 'S'
								x_trans = 0
								x_scale = 175
								flags = 3
								y_scale = 185
							}
							{
								font = fontgrid_text_a8
								text = 'T'
								flags = 3
								x_trans = 12
							}
							{
								font = fontgrid_text_a8
								text = 'O'
								y_scale = 125
								flags = 3
								x_trans = 21
							}
							{
								font = fontgrid_text_a8
								text = 'N'
								flags = 3
								x_trans = 30
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_elemental006.img`
								flags = 3
								a = 65
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1.dds`
						material = cad_drums_01_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_rm_03.img`
								flags = 32
								color = yellow_4guitar
							}
						]
					}
				]
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
			cas_mic = {
				desc_id = rock
			}
			cas_mic_stand = {
				desc_id = rock
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
			cas_bass_highway = {
				desc_id = judyhighway
			}
			cas_guitar_highway = {
				desc_id = judyhighway
			}
			cas_drums_highway = {
				desc_id = judyhighway
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
				desc_id = guitar_body08
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/gtr_body_style8_d_01.dds`
						material = guitar_body_style_08_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style8_ld_23.img`
								flags = 4
								color = grey_2guitar
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style8_dtl_04.img`
								flags = 4
								color = purple_blue_1
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
								texture = `tex/models/characters/layers/cag/neck1_inlay_diamonds_d_16.img`
								flags = 4
								color = grey_2guitar
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = guitar_head08
				chosen_materials = {
					material1 = black_1guitar
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/gtr_headtock08_d_01.dds`
						material = guitar_head_08_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_headtock08_ld_01.img`
								flags = 4
								color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_headtock08_dtl_04.img`
								flags = 4
								color = purple_blue_1
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
					material1 = black_1guitar
				}
			}
			cas_guitar_knobs = {
				desc_id = gtr8_knob_type1_03
				chosen_materials = {
					material1 = purple_blue_1
				}
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_type5_03
				chosen_materials = {
					material1 = purple_blue_1
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
								texture = `tex/models/characters/layers/cag/gtr_body_style17_ld_walc.img`
								color = violet_5
								flags = 4
								a = 55
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style17_dtl_tri.img`
								color = violet_2
								flags = 4
								a = 95
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshapeoutline_001.img`
								color = violet_3
								x_trans = -32
								y_trans = 22
								x_scale = 40
								y_scale = 200
								flags = 3
								a = 20
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_008.img`
								a = 40
								x_trans = -5
								y_trans = 14
								x_scale = 30
								y_scale = 70
								flags = 3
								color = violet_1
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_014.img`
								color = black_1guitar
								x_trans = -33
								y_trans = -28
								x_scale = 20
								y_scale = 50
								flags = 3
								a = 45
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics102.img`
								x_trans = -32
								x_scale = 15
								y_scale = 35
								flags = 3
								y_trans = 15
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics035.img`
								x_trans = 21
								y_trans = -4
								x_scale = 30
								y_scale = 45
								flags = 3
								color = violet_2
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
								texture = `tex/models/characters/layers/cab/cab_nek_ornate2.img`
								flags = 4
								color = violet_1
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = cab_head_bhphnq01
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/cab_head_bh8a.dds`
						material = cab_head_phunquie01_headstock
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_head_bh8a_wtfinish.img`
								flags = 4
								color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cab/cab_head_bh8a_dtl_01.img`
								flags = 4
								color = violet_2
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
				desc_id = cab_bridge_hack
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_bass_knobs = {
				desc_id = cab_knob_phunq02
				chosen_materials = {
					material1 = violet_1
				}
			}
			cas_bass_strings = {
				desc_id = power_slinky
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
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_41.img`
								flags = 32
								color = navy_2
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a.dds`
						material = cad_drums_01_bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_15.img`
								flags = 4
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_009.img`
								color = violet_1
								x_scale = 150
								flags = 3
								y_scale = 155
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_034.img`
								color = black_1guitar
								flags = 3
								a = 15
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_013.img`
								color = violet_2
								x_trans = -2
								y_trans = 2
								x_scale = 40
								y_scale = 40
								rot = 250
								flags = 3
								a = 25
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_013.img`
								color = violet_2
								a = 25
								x_trans = -20
								x_scale = 40
								y_scale = 40
								rot = 250
								flags = 3
								y_trans = -24
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_013.img`
								color = violet_2
								x_trans = 26
								y_trans = -21
								x_scale = 40
								y_scale = 40
								rot = 250
								flags = 3
								a = 65
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_013.img`
								color = violet_2
								a = 25
								x_trans = -29
								y_trans = 2
								x_scale = 40
								y_scale = 40
								flags = 3
								rot = 5883
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_013.img`
								color = violet_2
								a = 25
								x_trans = -2
								x_scale = 40
								y_scale = 40
								rot = 250
								flags = 3
								y_trans = 21
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics050.img`
								y_trans = -4
								x_scale = 80
								y_scale = 80
								flags = 3
								x_trans = 2
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
				desc_id = rock
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
				chosen_materials = {
					material1 = grey_1
				}
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
				desc_id = intro_elvis
			}
			cas_male_win_anim = {
				desc_id = win_elvis
			}
			cas_male_lose_anim = {
				desc_id = lose_kick
			}
			cas_guitar_body = {
				desc_id = guitar_body12
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/gtr_body_style12_d_01.dds`
						material = guitar_body_style_12_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style12_ld_01.img`
								color = red_1
								flags = 4
								a = 75
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style12_dtl_01.img`
								color = yellow_orange_4
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
								texture = `tex/models/characters/layers/cag/neck1_inlay_notes_d_09.img`
								flags = 4
								color = blue_5
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = guitar_head13
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/gtr_headtock13_d_01.dds`
						material = guitar_head_13_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_headtock13_ld_01.img`
								color = red_2
								flags = 4
								a = 75
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_headtock13_dtl_01.img`
								flags = 4
								color = yellow_orange_4
							}
						]
					}
				]
				chosen_materials = {
					material1 = orange_5
				}
			}
			cas_guitar_pickguards = {
				desc_id = gtr_body12_pickg01
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/pickgrd_body12_d_01.dds`
						material = pckgrd_body12_01_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/pickgrd_body12_ld_04.img`
								flags = 4
								color = red_orange_1
							}
						]
					}
				]
			}
			cas_guitar_bridges = {
				desc_id = gtr12_hardware_01
				chosen_materials = {
					material1 = orange_5
				}
			}
			cas_guitar_knobs = {
				desc_id = gtr12_knob_type6_04
				chosen_materials = {
					material1 = grey_4guitar
				}
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_type3b_02
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_body = {
				desc_id = cab_body_grmbl_a
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\cab_body_grumbel01_d_mls.dds`
						material = cab_body_grmbl_a_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_body_grumbel_walc_gk.img`
								flags = 4
								color = grey_2guitar
							}
							{
								texture = `tex/models/characters/layers/cab/cab_body_grumbel_dtl_pin.img`
								flags = 4
								color = yellow_3guitar
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_elemental003.img`
								x_trans = -23
								y_trans = 2
								y_skew = -9
								x_scale = 125
								y_scale = 70
								rot = 1500
								flags = 3
								x_skew = -36
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = cab_stnek_ebony
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/cab_nek_ebony01.dds`
						material = cab_stnek_ebony_neck
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_nek_tribal.img`
								flags = 4
								color = red_orange_3
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = cab_head_bh7a
				chosen_materials = {
					material1 = orange_3
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
							{
								texture = `tex/models/characters/layers/cab/cab_head_bh7a_dtl_05.img`
								flags = 4
								color = red_orange_2
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = none
			}
			cas_bass_pickups = {
				desc_id = cab_jp_pickup_a
			}
			cas_bass_bridges = {
				desc_id = cab_bridge_bb3a
				chosen_materials = {
					material1 = orange_3
				}
			}
			cas_bass_knobs = {
				desc_id = cab_knob_grmbl09
				chosen_materials = {
					material1 = orange_3
				}
			}
			cas_bass_highway = {
				desc_id = axelhighway
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
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_55.img`
								flags = 32
								color = yellow_4guitar
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a.dds`
						material = cad_drums_01_bassdrum
						diffuse
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics010.img`
								color = yellow_4guitar
								x_scale = 95
								y_scale = 90
								flags = 3
								rot = 5683
							}
						]
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_11.img`
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
				desc_id = mic_standard
			}
			cas_mic_stand = {
				desc_id = rock
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
		blurb = qs(0x849eaa76)
		appearance = {
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
		blurb = qs(0xc636fd20)
		appearance = {
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
				desc_id = f_rock_shoe_canvas
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
		blurb = qs(0x8fb4fb50)
		appearance = {
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
			cas_mic = {
				desc_id = `black metal`
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
		appearance = {
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
				desc_id = izzyhighway
			}
			cas_guitar_highway = {
				desc_id = izzyhighway
			}
			cas_drums_highway = {
				desc_id = izzyhighway
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
]
preset_musician_profiles_locked = [
	{
		name = nickarnold
		fullname = qs(0x85abadff)
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		preset_icon = photo_bestbuykid
		blurb = qs(0x26ab445a)
		locked
		appearance = {
			genre = `glam rock`
			cas_body = {
				desc_id = `bestbuy kid`
				random_weight = 1.5
				bones = {
					chinwidth = 0.0
					chinsize = 0.5
					cheekboneshape = 1.0
					earangle = 0.3
					headsize = 0.2
					nosewidth = 0.621
					noseangle = 0.1
					nosedepth = 0.365
					noseposition = 0.505
					nosebridge = 0.4
					nosebroken = 0.5
					lipshape = 0.2
					upperlipthickness = 0.775
					lowerlipthickness = 0.2
					eyeposition = -0.967
					eyedepth = 1.0
					eyescale = 0.4
					eyebrowshape = 1.0
					eyebrowsize = 0.0
					eyebrowangle = 0.5
					browposition = 0.5
					browdepth = 0.0
					mouthangle = 0.2
					eyeangle = 0.7
					eyeshape = 0.9
					mouthscale = 0.067
					facefullness = 0.0
					jawscale = -0.0
					nosetip = 0.8
				}
			}
			cas_physique = {
				desc_id = malephysique
				additional_bone_transforms = [
					{
						bone = bone_twist_bicep_top_l
						scaling = {
							value = (-0.1, -0.1, -0.1)
							no_propagate
						}
					}
					{
						bone = bone_twist_bicep_top_r
						scaling = {
							value = (-0.1, -0.1, -0.1)
							no_propagate
						}
					}
					{
						bone = bone_bicep_l
						scaling = {
							value = (-0.0, -0.1, -0.1)
							no_propagate
						}
					}
					{
						bone = bone_bicep_r
						scaling = {
							value = (-0.0, -0.1, -0.1)
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
					{
						bone = bone_forearm_l
						scaling = {
							value = (0.0, -0.25, -0.25)
							no_propagate
						}
					}
				]
				bones = {
					height = -1.0
				}
			}
			cas_eyes = {
				desc_id = car_blue_eyes
			}
			cas_male_hair = {
				desc_id = m_bbkid_hair_beanie
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
				desc_id = m_pop_legs_pants
			}
			cas_male_shoes = {
				desc_id = m_rock_shoe_skulls
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
			cas_guitar_body = {
				desc_id = guitar_body03
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/gtr_body_style3_d_01.dds`
						material = guitar_body_style_03_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style3_ld_12.img`
								flags = 4
								color = blue_3
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
								texture = `tex/models/characters/layers/cag/neck1_inlay_block2_d_26.img`
								flags = 4
								color = grey_4guitar
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = guitar_head12
				chosen_materials = {
					material1 = blue_5
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
								color = navy_1
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
					material1 = blue_5
				}
			}
			cas_guitar_knobs = {
				desc_id = gtr3_knob_type2_03
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_type2_04
				chosen_materials = {
					material1 = navy_1
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
								texture = `tex/models/characters/layers/cab/cab_body_chndr_ld_12.img`
								flags = 4
								color = blue_3
							}
							{
								texture = `tex/models/characters/layers/cab/cab_body_chndr_dtl_fin.img`
								flags = 4
								color = navy_1
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
								texture = `tex/models/characters/layers/cab/cab_nek_stars.img`
								flags = 4
								color = navy_4
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = cab_head_bh6a
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/cab_head_bh6a.dds`
						material = cab_head_chunder02_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_head_bh6a_wtfinish.img`
								flags = 4
								color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cab/cab_head_bh6a_dtl_05.img`
								flags = 4
								color = blue_4
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
				desc_id = cab_jp_pickup_b
			}
			cas_bass_bridges = {
				desc_id = cab_bridge_bb1a
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_bass_knobs = {
				desc_id = cab_knob_chndr01
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
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_46.img`
								flags = 32
								color = yellow_3guitar
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a.dds`
						material = cad_drums_01_bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_09.img`
								flags = 4
								color = yellow_2guitar
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
		name = `aaron steele`
		fullname = qs(0x96a09c04)
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		preset_icon = photo_steele
		blurb = qs(0x732e7780)
		locked
		appearance = {
			genre = rock
			cas_body = {
				desc_id = aaronsteele
				chosen_materials = {
					skin = skin_tan_2
				}
				bones = {
					nosesize = 0.3
					nosewidth = 0.621
					eyescale = 0.267
					headsize = 0.2
					chinwidth = 0.2
					jawscale = -2.0
					facefullness = 0.2
					cheekboneshape = -4.0
					earangle = 0.5
					noseangle = 0.077
					nosedepth = 0.5
					noseposition = 0.0
					nosebridge = 0.294
					nosetip = 0.9
					eyeangle = 0.7
					eyeshape = 0.9
					eyedepth = 1.0
					eyedistance = -0.7
					eyebrowshape = 0.6
					eyebrowdistance = 0.0
					browdepth = 0.0
					mouthposition = 0.4
					mouthscale = -0.0
					mouthangle = 0.7
					lowerlipthickness = 0.5
					lipshape = 0.5
					chinsize = 0.0
				}
			}
			cas_physique = {
				desc_id = malephysique
				additional_bone_transforms = [
					{
						bone = control_root
						scaling = {
							value = (-0.07, -0.07, -0.07)
						}
					}
					{
						bone = bone_head
						scaling = {
							value = (0.02, 0.02, 0.02)
							no_propagate
						}
					}
					{
						bone = bone_collar_l
						translation = {
							value = (0.0, 0.02, 0.0)
						}
					}
					{
						bone = bone_collar_r
						translation = {
							value = (0.0, 0.02, 0.0)
						}
					}
					{
						bone = bone_twist_bicep_top_l
						scaling = {
							value = (0.0, -0.1, -0.1)
							no_propagate
						}
					}
					{
						bone = bone_twist_bicep_top_r
						scaling = {
							value = (0.0, -0.1, -0.1)
							no_propagate
						}
					}
					{
						bone = bone_bicep_l
						scaling = {
							value = (-0.0, -0.1, -0.1)
							no_propagate
						}
					}
					{
						bone = bone_bicep_r
						scaling = {
							value = (-0.0, -0.1, -0.1)
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
					{
						bone = bone_forearm_l
						scaling = {
							value = (0.0, -0.25, -0.25)
							no_propagate
						}
					}
					{
						bone = bone_chest
						scaling = {
							value = (0.0, 0.0, 0.0)
							no_propagate
						}
					}
					{
						bone = bone_stomach_upper
						scaling = {
							value = (0.0, 0.0, 0.15)
							no_propagate
						}
					}
					{
						bone = bone_stomach_lower
						scaling = {
							value = (0.0, 0.0, 0.0)
							no_propagate
						}
					}
				]
			}
			cas_male_hair = {
				desc_id = m_clsc_hair_contest
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
				desc_id = m_torso_layered
				chosen_materials = {
					material1 = red_1
					material2 = grey_5
				}
			}
			cas_male_legs = {
				desc_id = m_pop_legs_jeans
				chosen_materials = {
					material1 = grey_3
					material2 = grey_3
				}
			}
			cas_male_shoes = {
				desc_id = m_punk_shoe_canvas
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
			cas_bass_bridges = {
				desc_id = cab_bridge_bb3a
			}
			cas_bass_knobs = {
				desc_id = cab_knob_chndr05
			}
			cas_drums = {
				desc_id = basic
			}
			cas_mic = {
				desc_id = mic_standard
			}
			cas_mic_stand = {
				desc_id = rock
			}
			cas_highway = {
				desc_id = axelhighway
			}
			cas_male_intro_anim = {
				desc_id = intro_hype
			}
			cas_male_win_anim = {
				desc_id = win_kungfu
			}
			cas_male_lose_anim = {
				desc_id = lose_kick
			}
		}
	}
	{
		name = rina
		fullname = qs(0xa63ab9cc)
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		preset_icon = photo_rina
		blurb = qs(0x053a5069)
		locked
		appearance = {
			genre = rock
			cas_body = {
				desc_id = gh4_car_female
				chosen_materials = {
					skin = skin_tan_1
				}
				cap = [
					{
						base_tex = `tex/models/characters/global/global_blank_head_dnc.dds`
						material = car_female_head
						cas_1
						post_layer = [
							{
								texture = 0xf26f28ba
								flags = 4
							}
						]
					}
				]
				bones = {
					eyeposition = -0.433
					headsize = 0.167
					facefullness = 0.5
					nosebridge = 0.7
					nosetip = 0.9
					mouthposition = 0.3
					noseposition = -3.0
					eyeangle = 0.69
					eyescale = 0.0
					eyedistance = 0.48600003
					eyeshape = 0.6
					upperlipthickness = 0.675
					lowerlipthickness = 0.54700005
					noseangle = 0.3
					eyebrowshape = 0.6
					mouthscale = -0.5
					chinsize = 0.2
					chinwidth = 0.8
					nosewidth = -2.0
					mouthdepth = -0.5
					nosesize = 0.4
					nosedepth = 0.25
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
						bone = bone_chest
						scaling = {
							value = (0.0, 0.0, 0.25)
							no_propagate
						}
					}
					{
						bone = bone_stomach_upper
						scaling = {
							value = (0.0, 0.0, 0.25)
							no_propagate
						}
					}
					{
						bone = bone_stomach_lower
						scaling = {
							value = (0.0, 0.0, 0.2)
							no_propagate
						}
					}
				]
			}
			cas_eyes = {
				desc_id = car_brown_eyes
			}
			cas_female_hair = {
				desc_id = f_metl_hair_pony
				chosen_materials = {
					material1 = orange_1
				}
			}
			cas_female_hat = {
				desc_id = none
			}
			cas_female_facial_hair = {
				desc_id = none
			}
			cas_female_torso = {
				desc_id = f_rock_torso_bass_contest
				chosen_materials = {
					material1 = blue_4
				}
			}
			cas_female_legs = {
				desc_id = f_rock_legs_jeans
				chosen_materials = {
					material1 = grey_3
				}
			}
			cas_female_shoes = {
				desc_id = f_pop_shoes_hayleyshoes
			}
			cas_female_acc_left = {
				desc_id = f_rock_acc_lchainstud
			}
			cas_female_acc_right = {
				desc_id = f_goth_acc_rglove
				chosen_materials = {
					material1 = grey_1
				}
			}
			cas_female_acc_face = {
				desc_id = none
			}
			cas_female_acc_ears = {
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
				desc_id = cab_body_bandera
				cap = [
					{
						base_tex = `tex\models\car_instruments\guitars\gtr_body_style17_d.dds`
						material = guitar_body_bandera_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style17_ld_mplsb.img`
								color = red_orange_3
								flags = 4
								a = 50
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style17_dtl_tri.img`
								color = teal_1
								flags = 4
								a = 80
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
								texture = `tex/models/characters/layers/cab/cab_nek_arrows01.img`
								color = yellow_green_2guitar
								flags = 4
								a = 45
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = cab_head_bh4a
				chosen_materials = {
					material1 = red_orange_5
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/cab_head_flay001.dds`
						material = cab_head_bh1a_headstock
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_head_flay001_wtfinish.img`
								flags = 4
								color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cab/all_clear02.img`
								flags = 4
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = cab_phnq_pg002
			}
			cas_bass_pickups = {
				desc_id = cab_jbass_pickup_01
			}
			cas_bass_bridges = {
				desc_id = cab_bridge_bb1a
				chosen_materials = {
					material1 = red_orange_5
				}
			}
			cas_bass_knobs = {
				desc_id = cab_knob_phunq06
			}
			cas_bass_strings = {
				desc_id = regular_slinky
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
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_32.img`
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
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_78.img`
							}
						]
					}
				]
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
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_32.img`
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
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_78.img`
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
			cas_highway = {
				desc_id = judyhighway
			}
		}
	}
	{
		name = gh4_car_winner
		fullname = qs(0xc0182b8b)
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		preset_icon = photo_gh4_car_winner
		blurb = qs(0xcbfc88a0)
		locked
		appearance = {
			genre = rock
			cas_body = {
				desc_id = gh4_car_winner
				chosen_materials = {
					skin = skin_tan_2
				}
				bones = {
					lowerlipthickness = 0.1
					cheekboneshape = 0.7
					nosewidth = 1.0
					facefullness = 0.6
					headsize = -0.2
					eyedistance = 0.07
					eyebrowdistance = 0.61
					eyebrowshape = 0.2
					eyebrowangle = 0.0
					eyeangle = 0.9
					mouthangle = 0.3
					mouthdepth = 0.6
					noseposition = 0.0
					nosetip = 0.9
					nosesize = 0.3
					mouthposition = 0.3
					browposition = 1.0
					noseangle = 0.1
					nosedepth = 0.765
					eyebrowsize = 0.4
					jawscale = 0.2
					chinsize = 0.6
					chinwidth = 0.3
					nosebridge = 0.9
					eyescale = 0.7
					mouthscale = 0.3
					eyeshape = 0.342
				}
			}
			cas_physique = {
				desc_id = malephysique
				bones = {
					height = 0.2
				}
				additional_bone_transforms = [
				]
			}
			cas_eyes = {
				desc_id = car_brown_eyes
			}
			cas_male_hair = {
				desc_id = m_rock_hair_slash
			}
			cas_male_hat = {
				desc_id = none
			}
			cas_male_facial_hair = {
				desc_id = none
			}
			cas_male_torso = {
				desc_id = m_metl_torso_lthrjkt
				chosen_materials = {
					material2 = grey_2
					material1 = grey_2
				}
			}
			cas_male_legs = {
				desc_id = m_glam_legs_spandex
			}
			cas_male_shoes = {
				desc_id = m_punk_shoe_buckleb
			}
			cas_male_acc_left = {
				desc_id = m_pop_acc_lband
			}
			cas_male_acc_right = {
				desc_id = m_metl_acc_rzakk
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
								flags = 4
								color = orange_3
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style4_dtl_81.img`
								flags = 4
								color = black_1guitar
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
								texture = `tex/models/characters/layers/cag/neck1_inlay_wedge2_d_11.img`
								flags = 4
								color = grey_2guitar
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = guitar_head05
				chosen_materials = {
					material1 = orange_4
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/gtr_headtock05_d_01.dds`
						material = guitar_head_05_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_headtock05_ld_01.img`
								flags = 4
								color = orange_1
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_headtock05_dtl_06.img`
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
					material1 = orange_4
				}
			}
			cas_guitar_knobs = {
				desc_id = gtr4_knob_type7_04
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_type1_blk_3
				chosen_materials = {
					material1 = black_1guitar
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
								color = black_1guitar
							}
							{
								texture = `tex/models/characters/layers/cab/cab_body_unos_ray02.img`
								flags = 4
								color = orange_2
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
								color = orange_3
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = cab_head_grumbel01
				chosen_materials = {
					material1 = grey_2guitar
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/cab_head_grumbel01.dds`
						material = cab_head_grumbel01_headstock
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_head_grumbel01_wtfinish.img`
								flags = 4
								color = orange_2
							}
							{
								texture = `tex/models/characters/layers/cab/cab_head_grumbel01_dtl_05.img`
								flags = 4
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
				desc_id = cab_jp_pickup_b
			}
			cas_bass_bridges = {
				desc_id = cab_bridge_bb1a
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_bass_knobs = {
				desc_id = cab_knob_unos05
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
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_14.img`
								flags = 32
								color = orange_2
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a.dds`
						material = cad_drums_01_bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_17.img`
								flags = 4
								color = orange_2
							}
						]
					}
				]
			}
			cas_mic = {
				desc_id = rock
			}
			cas_mic_stand = {
				desc_id = rock
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
				desc_id = intro_generic1
			}
			cas_male_win_anim = {
				desc_id = win_generic3
			}
			cas_male_lose_anim = {
				desc_id = lose_angryatcrowd
			}
		}
	}
	{
		name = jimi
		fullname = qs(0x57fef50b)
		allowed_parts = [
			guitar
		]
		preset_icon = photo_jimi
		blurb = qs(0xe5e2959b)
		locked
		price = 500000
		appearance = {
			genre = `classic rock`
			cas_full_body = {
				desc_id = jimi
			}
			cas_physique = {
				desc_id = malephysique
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
								texture = `tex/models/characters/layers/cag/gtr_body_style6_ld_01.img`
								color = grey_5guitar
								flags = 4
								a = 75
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style6_dtl_22.img`
								flags = 4
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
								texture = `tex/models/characters/layers/cag/neck1_inlay_dots1_d_01.img`
								flags = 4
								color = yellow_orange_1
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = guitar_head01
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/gtr_headtock01_d_01.dds`
						material = guitar_head_headstock
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_headtock01_ld_01.img`
								color = orange_3
								flags = 4
								a = 60
							}
						]
					}
				]
			}
			cas_guitar_pickguards = {
				desc_id = gtr_body6_pickg01
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/pickgrd_body6_d_01.dds`
						material = pckgrd_body6_01_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/pickgrd_body6_ld_01.img`
								flags = 4
								color = yellow_5
							}
						]
					}
				]
			}
			cas_guitar_bridges = {
				desc_id = gtr_hardware06
			}
			cas_guitar_knobs = {
				desc_id = gtr6_knob_type9_03
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_type2_03
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
			cas_bass_bridges = {
				desc_id = cab_bridge_bb3a
			}
			cas_bass_knobs = {
				desc_id = cab_knob_unos05
			}
			cas_drums = {
				desc_id = basic
			}
			cas_mic = {
				desc_id = rock
			}
			cas_mic_stand = {
				desc_id = rock
			}
			cas_bass_highway = {
				desc_id = hendrixhighway
			}
			cas_guitar_highway = {
				desc_id = hendrixhighway
			}
			cas_drums_highway = {
				desc_id = hendrixhighway
			}
			cas_male_intro_anim = {
				desc_id = g_jimi_intro
			}
			cas_male_win_anim = {
				desc_id = g_jimi_win
			}
			cas_male_lose_anim = {
				desc_id = g_jimi_lose
			}
		}
	}
	{
		name = hayley
		fullname = qs(0x9e414de0)
		allowed_parts = [
			vocals
			guitar
			bass
		]
		preset_icon = photo_hayley
		blurb = qs(0xf2737c8a)
		locked
		polaroid = star_hayley
		price = 5000
		appearance = {
			genre = rock
			cas_full_body = {
				desc_id = hayley
			}
			cas_physique = {
				desc_id = femalephysique
				additional_bone_transforms = [
					{
						bone = control_root
						scaling = {
							value = (-0.1, -0.1, -0.1)
						}
					}
					{
						bone = bone_pelvis
						scaling = {
							value = (0.0, 0.125, 0.125)
							no_propagate
						}
					}
				]
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
			cas_bass_bridges = {
				desc_id = cab_bridge_bb3a
			}
			cas_bass_knobs = {
				desc_id = cab_knob_unos05
			}
			cas_drums = {
				desc_id = basic
			}
			cas_mic = {
				desc_id = paramore
			}
			cas_mic_stand = {
				desc_id = rock
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
			cas_female_intro_anim = {
				desc_id = s_haley_intro
			}
			cas_female_win_anim = {
				desc_id = s_haley_win
			}
			cas_female_lose_anim = {
				desc_id = s_haley_lose
			}
		}
	}
	{
		name = tednugent
		fullname = qs(0xf25755cf)
		allowed_parts = [
			guitar
			bass
		]
		preset_icon = photo_tednugent
		blurb = qs(0x8a100b69)
		locked
		polaroid = star_nugent
		price = 10000
		appearance = {
			genre = `heavy metal`
			cas_full_body = {
				desc_id = tednugent
			}
			cas_physique = {
				desc_id = malephysique
			}
			cas_guitar_body = {
				desc_id = guitar_body12
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/gtr_body_style12_d_01.dds`
						material = guitar_body_style_12_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style12_ld_01.img`
								color = black_1
								flags = 4
								a = 100
							}
						]
					}
				]
			}
			cas_guitar_neck = {
				desc_id = guitar_neck_nugent
			}
			cas_guitar_head = {
				desc_id = guitar_head99
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/gtr_headtock099.dds`
						material = guitar_head_99_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_headtock098.img`
								flags = 4
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_headtock99__dtl_01.img`
								flags = 4
							}
						]
					}
				]
				chosen_materials = {
					material1 = grey_5
				}
			}
			cas_guitar_pickguards = {
				desc_id = none
			}
			cas_guitar_bridges = {
				desc_id = gtr12_hardware_01
				chosen_materials = {
					material1 = grey_5
				}
			}
			cas_guitar_knobs = {
				desc_id = gtr12_knob_type9_04
				chosen_materials = {
					material1 = grey_1
				}
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_type3_02
				chosen_materials = {
					material1 = grey_1
				}
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
				desc_id = cab_knob_unos05
			}
			cas_drums = {
				desc_id = basic
			}
			cas_mic = {
				desc_id = rock
			}
			cas_mic_stand = {
				desc_id = rock
			}
			cas_bass_highway = {
				desc_id = nugenthighway
			}
			cas_guitar_highway = {
				desc_id = nugenthighway
			}
			cas_drums_highway = {
				desc_id = nugenthighway
			}
			cas_male_intro_anim = {
				desc_id = g_ted_intro
			}
			cas_male_win_anim = {
				desc_id = g_ted_win
			}
			cas_male_lose_anim = {
				desc_id = g_ted_lose
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
		locked
		polaroid = m_fun_skeleton
		price = 6000
		appearance = {
			genre = `heavy metal`
			cas_full_body = {
				desc_id = skeleton
			}
			cas_physique = {
				desc_id = malephysique
				additional_bone_transforms = [
					{
						bone = bone_palm_l
						scaling = {
							value = (0.5, 0.5, 0.5)
						}
					}
					{
						bone = bone_palm_r
						scaling = {
							value = (0.5, 0.5, 0.5)
						}
					}
				]
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
			cas_bass_bridges = {
				desc_id = cab_bridge_bb3a
			}
			cas_bass_knobs = {
				desc_id = cab_knob_unos05
			}
			cas_drums = {
				desc_id = basic
			}
			cas_mic = {
				desc_id = rock
			}
			cas_mic_stand = {
				desc_id = rock
			}
			cas_bass_highway = {
				desc_id = skeletonhighway
			}
			cas_guitar_highway = {
				desc_id = skeletonhighway
			}
			cas_drums_highway = {
				desc_id = skeletonhighway
			}
		}
	}
	{
		name = travis
		fullname = qs(0x47b25033)
		allowed_parts = [
			drum
		]
		preset_icon = photo_travis
		blurb = qs(0x422b31cf)
		locked
		polaroid = star_travis
		price = 5000
		appearance = {
			genre = `heavy metal`
			cas_full_body = {
				desc_id = travis
			}
			cas_physique = {
				desc_id = malephysique
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
			cas_bass_bridges = {
				desc_id = cab_bridge_bb3a
			}
			cas_bass_knobs = {
				desc_id = cab_knob_unos05
			}
			cas_drums = {
				desc_id = monster
			}
			cas_mic = {
				desc_id = rock
			}
			cas_mic_stand = {
				desc_id = rock
			}
			cas_bass_highway = {
				desc_id = barkerhighway
			}
			cas_guitar_highway = {
				desc_id = barkerhighway
			}
			cas_drums_highway = {
				desc_id = barkerhighway
			}
			cas_male_intro_anim = {
				desc_id = d_travis_intro
			}
			cas_male_win_anim = {
				desc_id = d_travis_win
			}
			cas_male_lose_anim = {
				desc_id = d_travis_lose
			}
		}
	}
	{
		name = sting
		fullname = qs(0xb254a71a)
		allowed_parts = [
			vocals
			bass
			guitar
		]
		preset_icon = photo_sting
		icon_off = character_mug_axel_a
		icon_on = character_mug_axel_b
		blurb = qs(0xa9f3d92c)
		locked
		polaroid = star_sting
		price = 10000
		appearance = {
			genre = `heavy metal`
			cas_full_body = {
				desc_id = sting
			}
			cas_physique = {
				desc_id = malephysique
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
				desc_id = cab_body_chunder01
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\cab_body_chndra_d_mls.dds`
						material = cab_body_chunder01_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/cab_body_sting_d_mls.img`
								flags = 4
								color = yellow_orange_4
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
								texture = `tex/models/characters/layers/cab/cab_nek_lyrmpl_wht_dot.img`
								flags = 4
								color = grey_2guitar
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = cab_head_bh6b
			}
			cas_bass_pickguards = {
				desc_id = cab_pguard_sting
			}
			cas_bass_pickups = {
				desc_id = cab_pickup_sting
			}
			cas_bass_bridges = {
				desc_id = cab_bridge_bb3a
			}
			cas_bass_knobs = {
				desc_id = cab_knob_sting
			}
			cas_mic = {
				desc_id = rock
			}
			cas_mic_stand = {
				desc_id = rock
			}
			cas_bass_highway = {
				desc_id = stinghighway
			}
			cas_guitar_highway = {
				desc_id = stinghighway
			}
			cas_drums_highway = {
				desc_id = stinghighway
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
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_33.img`
								flags = 32
								color = blue_2
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a.dds`
						material = cad_drums_01_bassdrum
						diffuse
						layers = [
							{
								font = fontgrid_text_a6
								text = 'A'
								x_trans = -18
								y_trans = 15
								rot = 5333
								flags = 3
								color = navy_2
							}
							{
								font = fontgrid_text_a6
								text = 'X'
								x_trans = -8
								y_trans = 2
								rot = 5283
								flags = 3
								color = navy_2
							}
							{
								font = fontgrid_text_a6
								text = 'E'
								color = navy_2
								x_trans = 0
								y_trans = -11
								flags = 3
								rot = 5283
							}
							{
								font = fontgrid_text_a6
								text = 'L'
								color = navy_2
								y_trans = -24
								rot = 5133
								flags = 3
								x_trans = 8
							}
							{
								font = fontgrid_text_a6
								text = '!'
								color = navy_2
								y_trans = -34
								rot = 5033
								flags = 3
								x_trans = 14
							}
						]
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_35.img`
								rot = 950
								flags = 4
								color = navy_3
							}
						]
					}
				]
			}
		}
		cas_male_intro_anim = {
			desc_id = s_sting_intro
		}
		cas_male_win_anim = {
			desc_id = s_sting_win
		}
		cas_male_lose_anim = {
			desc_id = s_sting_lose
		}
	}
	{
		name = zakkwylde
		fullname = qs(0x98fdbfd6)
		allowed_parts = [
			vocals
			guitar
			bass
		]
		preset_icon = photo_zakkwylde
		blurb = qs(0x7cbfee96)
		locked
		polaroid = star_zakk
		price = 5000
		appearance = {
			genre = `heavy metal`
			cas_full_body = {
				desc_id = zakkwylde
			}
			cas_physique = {
				desc_id = malephysique
				additional_bone_transforms = [
					{
						bone = control_root
						scaling = {
							value = (0.05, 0.05, 0.05)
						}
					}
					{
						bone = bone_collar_r
						scaling = {
							value = (0.0, 0.05, 0.05)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, -0.03)
						}
					}
					{
						bone = bone_collar_l
						scaling = {
							value = (0.0, 0.05, 0.05)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, 0.03)
						}
					}
					{
						bone = bone_chest
						scaling = {
							value = (0.0, 0.03, 0.03)
							no_propagate
						}
					}
					{
						bone = bone_stomach_upper
						scaling = {
							value = (0.0, 0.015, 0.015)
							no_propagate
						}
					}
				]
			}
			cas_guitar_body = {
				desc_id = guitar_body05
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/gtr_body_style5_d_01.dds`
						material = guitar_body_style_05_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style5_ld_99_wylde.img`
								flags = 4
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
								texture = `tex/models/characters/layers/cag/gtr_nek_binding_dtl.img`
								flags = 4
								color = yellow_orange_5
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = guitar_head99
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/gtr_headtock099.dds`
						material = guitar_head_99_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_headtock099_wylde.img`
								flags = 4
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_headtock99__dtl_01.img`
								flags = 4
								color = yellow_orange_5
							}
						]
					}
				]
				chosen_materials = {
					material1 = yellow_4
				}
			}
			cas_guitar_pickguards = {
				desc_id = none
			}
			cas_guitar_bridges = {
				desc_id = gtr_hardware01a
				chosen_materials = {
					material1 = yellow_4
				}
			}
			cas_guitar_knobs = {
				desc_id = gtr4_knob_type4_04
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_type6_tkd_02
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
				desc_id = cab_knob_unos05
			}
			cas_drums = {
				desc_id = basic
			}
			cas_mic = {
				desc_id = rock
			}
			cas_mic_stand = {
				desc_id = rock
			}
			cas_bass_highway = {
				desc_id = wyldehighway
			}
			cas_guitar_highway = {
				desc_id = wyldehighway
			}
			cas_drums_highway = {
				desc_id = wyldehighway
			}
			cas_male_intro_anim = {
				desc_id = g_zakk_intro
			}
			cas_male_win_anim = {
				desc_id = g_zakk_win
			}
			cas_male_lose_anim = {
				desc_id = g_zakk_lose
			}
		}
	}
	{
		name = ozzy
		fullname = qs(0x7878e4e7)
		allowed_parts = [
			vocals
		]
		preset_icon = photo_ozzy
		blurb = qs(0xc37c049e)
		locked
		polaroid = star_ozzy
		price = 10000
		appearance = {
			genre = `heavy metal`
			cas_full_body = {
				desc_id = ozzy
			}
			cas_physique = {
				desc_id = malephysique
				bones = {
					height = 1
				}
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
			cas_bass_bridges = {
				desc_id = cab_bridge_bb3a
			}
			cas_bass_knobs = {
				desc_id = cab_knob_unos05
			}
			cas_drums = {
				desc_id = basic
			}
			cas_mic = {
				desc_id = rock
			}
			cas_mic_stand = {
				desc_id = rock
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
				desc_id = s_ozzy_intro
			}
			cas_male_win_anim = {
				desc_id = s_ozzy_win
			}
			cas_male_lose_anim = {
				desc_id = s_ozzy_lose
			}
		}
	}
	{
		name = billy
		fullname = qs(0x86e5e72b)
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		preset_icon = photo_billy
		blurb = qs(0xddea7569)
		locked
		polaroid = star_billy
		appearance = {
			genre = rock
			cas_full_body = {
				desc_id = billy
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
							value = (0.05, 0.05, 0.05)
						}
					}
				]
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
								texture = `tex/models/characters/layers/cag/gtr_body_style6_ld_01.img`
								flags = 4
								color = black_1
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_body_style6_dtl_01.img`
								flags = 4
							}
						]
					}
				]
			}
			cas_guitar_neck = {
				desc_id = guitar_neck_corgan
			}
			cas_guitar_head = {
				desc_id = guitar_head31
				chosen_materials = {
					material1 = grey_3
				}
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/gtr_headtock_d_31.dds`
						material = guitar_head_31_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gtr_headtock31_black.img`
								flags = 4
							}
							{
								texture = `tex/models/characters/layers/cag/gtr_headtock31_dtl_01.img`
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
				desc_id = gtr_hardware06
				chosen_materials = {
					material1 = grey_3
				}
			}
			cas_guitar_knobs = {
				desc_id = gtr6_knob_type4_03
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_type1_blk_2
				chosen_materials = {
					material1 = black_1
				}
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
			cas_bass_bridges = {
				desc_id = cab_bridge_bb3a
			}
			cas_bass_knobs = {
				desc_id = cab_knob_unos05
			}
			cas_drums = {
				desc_id = basic
			}
			cas_mic = {
				desc_id = rock
			}
			cas_mic_stand = {
				desc_id = rock
			}
			cas_bass_highway = {
				desc_id = corganhighway
			}
			cas_guitar_highway = {
				desc_id = corganhighway
			}
			cas_drums_highway = {
				desc_id = corganhighway
			}
			cas_male_intro_anim = {
				desc_id = s_billy_intro
			}
			cas_male_win_anim = {
				desc_id = s_billy_win
			}
			cas_male_lose_anim = {
				desc_id = s_billy_lose
			}
		}
	}
	{
		name = rockbot
		fullname = qs(0x3ab7a665)
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		preset_icon = photo_rockbot
		blurb = qs(0x27eda071)
		locked
		polaroid = m_fun_rockbot
		price = 15000
		appearance = {
			genre = rock
			cas_full_body = {
				desc_id = rockbot
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
							value = (0.05, 0.05, 0.05)
						}
					}
				]
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
			cas_bass_bridges = {
				desc_id = cab_bridge_bb3a
			}
			cas_bass_knobs = {
				desc_id = cab_knob_unos05
			}
			cas_drums = {
				desc_id = basic
			}
			cas_mic = {
				desc_id = rock
			}
			cas_mic_stand = {
				desc_id = rock
			}
			cas_bass_highway = {
				desc_id = rockbothighway
			}
			cas_guitar_highway = {
				desc_id = rockbothighway
			}
			cas_drums_highway = {
				desc_id = rockbothighway
			}
			cas_male_intro_anim = {
				desc_id = intro_robot
			}
			cas_male_win_anim = {
				desc_id = win_robot
			}
			cas_male_lose_anim = {
				desc_id = lose_fearful
			}
		}
	}
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
