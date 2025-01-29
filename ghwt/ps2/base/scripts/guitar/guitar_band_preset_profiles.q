preset_musician_instrument_hack = {
	cas_guitar_body = {
		desc_id = guitar_body01
	}
	cas_guitar_neck = {
		desc_id = 0xaf84f553
	}
	cas_guitar_neck_finish = {
		desc_id = 0x7e88e4b9
	}
	cas_guitar_head = {
		desc_id = 0xeef7835f
	}
	cas_guitar_pickguards = {
		desc_id = 0xba16df3c
	}
	cas_guitar_pickups = {
		desc_id = 0x003befbb
	}
	cas_guitar_knobs = {
		desc_id = 0xe069f532
	}
	cas_guitar_bridges = {
		desc_id = guitar_bridges_01
	}
	cas_bass_body = {
		desc_id = 0x0f3d3223
	}
	cas_bass_neck = {
		desc_id = bass_neck_01
	}
	cas_bass_neck_finish = {
		desc_id = 0xb8fefac6
	}
	cas_bass_head = {
		desc_id = 0x90415f98
	}
	cas_bass_pickguards = {
		desc_id = 0x67f34131
	}
	cas_bass_pickups = {
		desc_id = 0x8f792d32
	}
	cas_bass_knobs = {
		desc_id = cab_knob_unos01
	}
	cas_bass_bridges = {
		desc_id = bass_bridges_01
	}
	cas_mic = {
		desc_id = mic_standard
	}
	cas_mic_stand = {
		desc_id = mic_stand_female
	}
	cas_drums = {
		desc_id = singlebasskit
	}
}
preset_male_base_parts = {
	cas_male_base_torso = {
		desc_id = car_male_torso
	}
}
preset_female_base_parts = {
	cas_female_base_torso = {
		desc_id = car_female_torso
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
	cas_highway = {
		desc_id = highway
	}
	cas_gems = {
		desc_id = gem_set_01
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
	cas_highway = {
		desc_id = axelhighway
	}
	cas_gems = {
		desc_id = gem_set_01
	}
}
preset_musician_profiles_modifiable = [
	{
		Name = Axel
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
			genre = `classic	rock`
			cas_body = {
				desc_id = gh4_car_male
				random_weight = 1.5
			}
			cas_physique = {
				desc_id = malephysique
				additional_bone_transforms = [
					{
						bone = Bone_Neck
						scaling = {
							value = (0.25, 0.25, 0.25)
							no_propagate
						}
					}
					{
						bone = bone_chest
						scaling = {
							value = (0.1, 0.4, 0.55)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Upper
						scaling = {
							value = (0.1, 0.25, 0.25)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Lower
						scaling = {
							value = (0.1, 0.25, 0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Collar_R
						scaling = {
							value = (0.2, 0.2, 0.2)
							no_propagate
						}
						translation = {
							value = (0.0, -0.09, 0.0)
						}
					}
					{
						bone = Bone_Collar_L
						scaling = {
							value = (0.2, 0.2, 0.2)
							no_propagate
						}
						translation = {
							value = (0.0, -0.09, 0.0)
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_R
						scaling = {
							value = (0.0, 0.65000004, 0.5)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_R
						scaling = {
							value = (0.0, 0.65000004, 0.5)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_L
						scaling = {
							value = (0.0, 0.65000004, 0.5)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_L
						scaling = {
							value = (0.0, 0.65000004, 0.5)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_L
						scaling = {
							value = (0.0, 0.5, 0.35000002)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_R
						scaling = {
							value = (0.0, 0.5, 0.35000002)
							no_propagate
						}
					}
					{
						bone = Bone_Palm_L
						scaling = {
							value = (0.0, 0.3, 0.3)
						}
					}
					{
						bone = Bone_Palm_R
						scaling = {
							value = (0.0, 0.3, 0.3)
						}
					}
					{
						bone = Bone_Ankle_R
						scaling = {
							value = (0.13, 0.0, 0.3)
						}
					}
					{
						bone = Bone_Ankle_L
						scaling = {
							value = (0.13, 0.0, 0.3)
						}
					}
				]
			}
			cas_male_hair = {
				desc_id = m_metl_hair_axel
			}
			cas_male_facial_hair = {
				desc_id = None
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
				desc_id = None
			}
			cas_male_acc_ears = {
				desc_id = None
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
			cas_bass_highway = {
				desc_id = axelhighway
			}
			cas_guitar_highway = {
				desc_id = axelhighway
			}
			cas_drums_highway = {
				desc_id = axelhighway
			}
			cas_guitar_body = {
				desc_id = guitar_body04
			}
			cas_guitar_finish = {
				desc_id = custom_color
				chosen_materials = {
					material1 = yellow_1guitar
				}
			}
			cas_guitar_body_detail = {
				desc_id = 0x9b507780
				chosen_materials = {
					material1 = red_1
				}
			}
			cas_guitar_neck = {
				desc_id = guitar_neck_03
			}
			cas_guitar_neck_finish = {
				desc_id = 0x645df2c7
			}
			cas_guitar_head = {
				desc_id = 0xe99a4746
			}
			cas_guitar_head_finish = {
				desc_id = Color
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_head_detail = {
				desc_id = 0x8c88fad4
				chosen_materials = {
					material1 = red_3
				}
			}
			cas_guitar_pickguards = {
				desc_id = 0x8dc82f0e
			}
			cas_guitar_bridges = {
				desc_id = guitar_bridges_05
				chosen_materials = {
					material1 = orange_4
				}
			}
			cas_guitar_knobs = {
				desc_id = 0x7e59207c
			}
			cas_guitar_pickups = {
				desc_id = 0xaa322730
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_body = {
				desc_id = 0xe3d58770
			}
			cas_bass_finish = {
				desc_id = 0x59d0eefc
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_body_detail = {
				desc_id = 0x4d493c3f
				chosen_materials = {
					material1 = yellow_5guitar
				}
			}
			cas_bass_neck = {
				desc_id = bass_neck_01
			}
			cas_bass_neck_finish = {
				desc_id = 0x1684fe10
				chosen_materials = {
					material1 = yellow_4guitar
				}
			}
			cas_bass_head = {
				desc_id = 0x7e4f3eb4
			}
			cas_bass_head_finish = {
				desc_id = 0x7b354312
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_pickguards = {
				desc_id = 0xef4a7d19
			}
			cas_bass_pickguard_finish = {
				desc_id = custom_color
				chosen_materials = {
					material1 = yellow_4
				}
			}
			cas_bass_pickups = {
				desc_id = 0x0f6b4dc9
			}
			cas_bass_bridges = {
				desc_id = bass_bridge_hack
			}
			cas_bass_knobs = {
				desc_id = cab_knob_hack01
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_drums = {
				desc_id = singlebasskit
			}
			cas_drum_finish = {
				desc_id = drumshell_ds_06
				chosen_materials = {
					material1 = yellow_orange_4
				}
			}
			cas_drum_detail = {
				desc_id = 0x9c27c9c3
			}
			cas_mic = {
				desc_id = mic_sixties
			}
			cas_mic_stand = {
				desc_id = mic_stand_sixties
			}
			cas_male_base_face = {
				desc_id = 0xb9868c92
			}
		}
	}
	{
		Name = Casey
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
			}
			cas_physique = {
				desc_id = femalephysique
			}
			cas_female_hair = {
				desc_id = f_metl_hair_ponytail
				chosen_materials = {
					material1 = red_1
				}
			}
			cas_female_hat = {
				desc_id = None
			}
			cas_female_facial_hair = {
				desc_id = None
			}
			cas_female_torso = {
				desc_id = f_rock_torso_jjacket
				chosen_materials = {
					material1 = blue_4
					material2 = grey_1
					material3 = grey_1
				}
			}
			cas_female_legs = {
				desc_id = f_rock_legs_leather
			}
			cas_female_shoes = {
				desc_id = 0x644d9f45
			}
			cas_female_acc_left = {
				desc_id = f_rock_acc_lstrap
			}
			cas_female_acc_right = {
				desc_id = f_punk_acc_rglvwatch
			}
			cas_female_acc_face = {
				desc_id = None
			}
			cas_female_acc_ears = {
				desc_id = None
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
			cas_bass_highway = {
				desc_id = caseyhighway
			}
			cas_guitar_highway = {
				desc_id = caseyhighway
			}
			cas_drums_highway = {
				desc_id = caseyhighway
			}
			cas_female_base_face = {
				desc_id = 0xd84b368c
			}
			cas_guitar_body = {
				desc_id = guitar_body02
			}
			cas_guitar_finish = {
				desc_id = custom_color
				chosen_materials = {
					material1 = yellow_green_3guitar
				}
			}
			cas_guitar_body_detail = {
				desc_id = 0x50354970
			}
			cas_guitar_neck = {
				desc_id = 0xaf84f553
			}
			cas_guitar_neck_finish = {
				desc_id = 0xc4ec4895
				chosen_materials = {
					material1 = blue_5
				}
			}
			cas_guitar_head = {
				desc_id = 0x77fed2e5
			}
			cas_guitar_head_finish = {
				desc_id = Color
				chosen_materials = {
					material1 = yellow_green_3guitar
				}
			}
			cas_guitar_head_detail = {
				desc_id = 0x812037d4
				chosen_materials = {
					material1 = yellow_green_1guitar
				}
			}
			cas_guitar_pickguards = {
				desc_id = None
			}
			cas_guitar_bridges = {
				desc_id = guitar_bridges_10
				chosen_materials = {
					material1 = orange_4
				}
			}
			cas_guitar_knobs = {
				desc_id = 0x633869fb
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_pickups = {
				desc_id = 0x7cc3fa95
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_body = {
				desc_id = 0x104f2585
			}
			cas_bass_finish = {
				desc_id = 0x59d0eefc
				chosen_materials = {
					material1 = purple_blue_1
				}
			}
			cas_bass_body_detail = {
				desc_id = 0x7b3ea62d
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_neck = {
				desc_id = 0x3f3c48b8
			}
			cas_bass_neck_finish = {
				desc_id = 0xd0eaf112
				chosen_materials = {
					material1 = purple_blue_1
				}
			}
			cas_bass_head = {
				desc_id = 0x972c9b81
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_bass_head_finish = {
				desc_id = 0x3910446f
				chosen_materials = {
					material1 = purple_blue_1
				}
			}
			cas_bass_head_detail = {
				desc_id = 0x42c8ec45
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_pickguards = {
				desc_id = None
			}
			cas_bass_pickups = {
				desc_id = 0x8814e92b
			}
			cas_bass_bridges = {
				desc_id = bass_bridges_01
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
				desc_id = singlebasskit
			}
			cas_drum_finish = {
				desc_id = drumshell_ds_30
				chosen_materials = {
					material1 = purple_blue_3
				}
			}
			cas_drum_detail = {
				desc_id = 0x7c7889fe
				chosen_materials = {
					material1 = purple_blue_3
				}
			}
			cas_mic = {
				desc_id = mic_glam
			}
			cas_mic_stand = {
				desc_id = mic_stand_rock
			}
		}
	}
	{
		Name = Izzy
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
			}
			cas_physique = {
				desc_id = malephysique
			}
			cas_male_hair = {
				desc_id = m_metl_hair_midhigh
				chosen_materials = {
					material1 = yellow_orange_3
				}
			}
			cas_male_hat = {
				desc_id = None
			}
			cas_male_facial_hair = {
				desc_id = None
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
				desc_id = None
			}
			cas_male_acc_ears = {
				desc_id = None
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
			}
			cas_guitar_finish = {
				desc_id = custom_color
				chosen_materials = {
					material1 = red_2
				}
			}
			cas_guitar_body_detail = {
				desc_id = 0x18f1ba61
				chosen_materials = {
					material1 = red_orange_2
				}
			}
			cas_guitar_neck = {
				desc_id = 0x368da4e9
			}
			cas_guitar_neck_finish = {
				desc_id = 0x900be094
				chosen_materials = {
					material1 = blue_5
				}
			}
			cas_guitar_head = {
				desc_id = 0x80eb8288
			}
			cas_guitar_head_finish = {
				desc_id = Color
				chosen_materials = {
					material1 = red_2
				}
			}
			cas_guitar_head_detail = {
				desc_id = 0x4a1ab149
				chosen_materials = {
					material1 = orange_2
				}
			}
			cas_guitar_pickguards = {
				desc_id = None
			}
			cas_guitar_bridges = {
				desc_id = guitar_bridges_10
			}
			cas_guitar_knobs = {
				desc_id = 0x385fd313
			}
			cas_guitar_pickups = {
				desc_id = 0x684e1335
			}
			cas_bass_body = {
				desc_id = 0x104f2585
			}
			cas_bass_finish = {
				desc_id = 0x086fe273
				chosen_materials = {
					material1 = orange_4
				}
			}
			cas_bass_body_detail = {
				desc_id = 0xc523cbd0
				chosen_materials = {
					material1 = green_3guitar
				}
			}
			cas_bass_neck = {
				desc_id = 0x483b782e
			}
			cas_bass_neck_finish = {
				desc_id = 0xe0c5f99c
				chosen_materials = {
					material1 = navy_1
				}
			}
			cas_bass_head = {
				desc_id = 0x161b8fca
			}
			cas_bass_head_finish = {
				desc_id = 0x7f176f08
				chosen_materials = {
					material1 = green_3guitar
				}
			}
			cas_bass_head_detail = {
				desc_id = 0x7179d9c1
				chosen_materials = {
					material1 = red_orange_3
				}
			}
			cas_bass_pickguards = {
				desc_id = 0x913415fd
			}
			cas_bass_pickguard_finish = {
				desc_id = shell
				chosen_materials = {
					material1 = green_3guitar
				}
			}
			cas_bass_pickups = {
				desc_id = 0x0f6b4dc9
			}
			cas_bass_bridges = {
				desc_id = bass_bridges_01
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
				desc_id = singlebasskit
			}
			cas_drum_finish = {
				desc_id = drumshell_ds_46
				chosen_materials = {
					material1 = red_4
				}
			}
			cas_drum_detail = {
				desc_id = bass_skin_ds_47
				chosen_materials = {
					material1 = red_1
				}
			}
			cas_mic = {
				desc_id = mic_glam
			}
			cas_mic_stand = {
				desc_id = mic_stand_glam
			}
			cas_male_base_face = {
				desc_id = 0xdf319a66
			}
		}
	}
	{
		Name = Judy
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
						bone = BONE_PELVIS
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
						bone = Bone_Stomach_Lower
						scaling = {
							value = (0.0, 0.1, 0.1)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Upper
						scaling = {
							value = (0.0, 0.1, 0.1)
							no_propagate
						}
					}
					{
						bone = Bone_Collar_L
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
						bone = Bone_Collar_R
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
						bone = Bone_Twist_Bicep_Top_R
						scaling = {
							value = (0.0, 0.2, 0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_L
						scaling = {
							value = (0.0, 0.2, 0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_R
						scaling = {
							value = (0.0, 0.1, 0.1)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_L
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
						bone = Bone_Ankle_L
						scaling = {
							value = (0.2, 0.2, 0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Ankle_R
						scaling = {
							value = (0.2, 0.2, 0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Thigh_R
						scaling = {
							value = (0.0, 0.2, 0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Thigh_L
						scaling = {
							value = (0.0, 0.2, 0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Knee_R
						scaling = {
							value = (0.0, 0.15, 0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Knee_L
						scaling = {
							value = (0.0, 0.15, 0.15)
							no_propagate
						}
					}
				]
			}
			cas_female_hair = {
				desc_id = f_punk_hair_judy01
				chosen_materials = {
					material1 = red_1
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
					material1 = red_1
					material2 = grey_5
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
				desc_id = f_rock_acc_lwatch
			}
			cas_female_acc_right = {
				desc_id = f_punk_acc_rbands
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
			}
			cas_guitar_finish = {
				desc_id = custom_color
				chosen_materials = {
					material1 = violet_3
				}
			}
			cas_guitar_body_detail = {
				desc_id = 0x3854cb93
				chosen_materials = {
					material1 = purple_blue_1
				}
			}
			cas_guitar_neck = {
				desc_id = guitar_neck_03
			}
			cas_guitar_neck_finish = {
				desc_id = 0x2de1689c
				chosen_materials = {
					material1 = blue_4
				}
			}
			cas_guitar_head = {
				desc_id = 0x709316fc
			}
			cas_guitar_head_finish = {
				desc_id = Color
				chosen_materials = {
					material1 = purple_blue_1
				}
			}
			cas_guitar_pickguards = {
				desc_id = 0x29a15704
			}
			cas_guitar_bridges = {
				desc_id = guitar_bridges_10
				chosen_materials = {
					material1 = purple_blue_5
				}
			}
			cas_guitar_knobs = {
				desc_id = 0x5b9085d7
				chosen_materials = {
					material1 = violet_3
				}
			}
			cas_guitar_pickups = {
				desc_id = 0x658970c3
				chosen_materials = {
					material1 = violet_1
				}
			}
			cas_bass_body = {
				desc_id = 0xa9ed8920
			}
			cas_bass_finish = {
				desc_id = 0xe9dd85e1
				chosen_materials = {
					material1 = yellow_1guitar
				}
			}
			cas_bass_body_detail = {
				desc_id = 0xd18b60ac
				chosen_materials = {
					material1 = red_1
				}
			}
			cas_bass_neck = {
				desc_id = 0x483b782e
			}
			cas_bass_neck_finish = {
				desc_id = 0xed9d722f
				chosen_materials = {
					material1 = yellow_1guitar
				}
			}
			cas_bass_head = {
				desc_id = 0x03aaddca
			}
			cas_bass_head_finish = {
				desc_id = 0x98b43539
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_head_detail = {
				desc_id = 0x06bb4f27
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_pickguards = {
				desc_id = None
			}
			cas_bass_pickups = {
				desc_id = 0x96621c73
			}
			cas_bass_bridges = {
				desc_id = bass_bridge_mls
			}
			cas_bass_knobs = {
				desc_id = cab_knob_grmbl03
				chosen_materials = {
					material1 = orange_3
				}
			}
			cas_drums = {
				desc_id = singlebasskit
			}
			cas_drum_finish = {
				desc_id = 0x46a4278f
			}
			cas_drum_detail = {
				desc_id = None
			}
			cas_mic = {
				desc_id = mic_standard
			}
			cas_mic_stand = {
				desc_id = mic_stand_rock
			}
			cas_female_base_face = {
				desc_id = 0x31b8ca2e
			}
		}
	}
	{
		Name = Johnny
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
			}
			cas_physique = {
				desc_id = malephysique
				additional_bone_transforms = [
					{
						bone = Bone_Neck
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_R
						scaling = {
							value = (0.0, -0.2, -0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_R
						scaling = {
							value = (0.0, -0.1, -0.1)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_R
						scaling = {
							value = (0.0, -0.1, -0.1)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_L
						scaling = {
							value = (0.0, -0.2, -0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_L
						scaling = {
							value = (0.0, -0.1, -0.1)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_L
						scaling = {
							value = (0.0, -0.1, -0.1)
							no_propagate
						}
					}
					{
						bone = Bone_Ankle_L
						scaling = {
							value = (0.0, 0.1, 0.2)
						}
					}
					{
						bone = Bone_Ankle_R
						scaling = {
							value = (0.0, 0.1, 0.2)
						}
					}
					{
						bone = Bone_Thigh_R
						scaling = {
							value = (0.0, -0.3, -0.3)
							no_propagate
						}
					}
					{
						bone = Bone_Thigh_L
						scaling = {
							value = (0.0, -0.3, -0.3)
							no_propagate
						}
					}
					{
						bone = Bone_Knee_R
						scaling = {
							value = (0.0, -0.03, -0.03)
							no_propagate
						}
					}
					{
						bone = Bone_Knee_L
						scaling = {
							value = (0.0, -0.03, -0.03)
							no_propagate
						}
					}
				]
			}
			cas_male_hair = {
				desc_id = m_punk_hair_lspike
				chosen_materials = {
					material1 = red_orange_3
				}
			}
			cas_male_facial_hair = {
				desc_id = None
			}
			cas_male_torso = {
				desc_id = m_punk_torso_johnny1
			}
			cas_male_legs = {
				desc_id = m_punk_legs_johnny1
			}
			cas_male_shoes = {
				desc_id = m_punk_shoes_johnny2
				chosen_materials = {
					material1 = grey_1
				}
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
			cas_guitar_body = {
				desc_id = guitar_body12
			}
			cas_guitar_finish = {
				desc_id = custom_color
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_body_detail = {
				desc_id = 0x6d5560c0
			}
			cas_guitar_neck = {
				desc_id = guitar_neck_03
			}
			cas_guitar_neck_finish = {
				desc_id = 0x47015bb2
			}
			cas_guitar_head = {
				desc_id = 0x6ee5e3a4
			}
			cas_guitar_head_finish = {
				desc_id = Color
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_pickguards = {
				desc_id = None
			}
			cas_guitar_bridges = {
				desc_id = guitar_bridges_06
				chosen_materials = {
					material1 = grey_3guitar
				}
			}
			cas_guitar_knobs = {
				desc_id = 0xa624254e
				chosen_materials = {
					material1 = grey_3guitar
				}
			}
			cas_guitar_pickups = {
				desc_id = 0x128e4055
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_bass_body = {
				desc_id = 0x4d25d43a
			}
			cas_bass_finish = {
				desc_id = 0x59d0eefc
				chosen_materials = {
					material1 = orange_1
				}
			}
			cas_bass_body_detail = {
				desc_id = 0x3b6a29fc
				chosen_materials = {
					material1 = green_4guitar
				}
			}
			cas_bass_neck = {
				desc_id = 0x483b782e
			}
			cas_bass_neck_finish = {
				desc_id = 0xed9d722f
				chosen_materials = {
					material1 = green_1guitar
				}
			}
			cas_bass_head = {
				desc_id = 0xb5e1f925
			}
			cas_bass_head_finish = {
				desc_id = 0xa879db6a
				chosen_materials = {
					material1 = green_1guitar
				}
			}
			cas_bass_head_detail = {
				desc_id = 0x22c53bf1
				chosen_materials = {
					material1 = orange_2
				}
			}
			cas_bass_pickguards = {
				desc_id = 0x20aae392
			}
			cas_bass_pickguard_finish = {
				desc_id = shell
				chosen_materials = {
					material1 = blue_4
				}
			}
			cas_bass_pickups = {
				desc_id = 0x0f6b4dc9
			}
			cas_bass_bridges = {
				desc_id = bass_bridge_hack
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
			cas_drums = {
				desc_id = singlebasskit
			}
			cas_drum_finish = {
				desc_id = drumshell_ds_43
				chosen_materials = {
					material1 = green_3guitar
				}
			}
			cas_drum_detail = {
				desc_id = bass_skin_ds_04
				chosen_materials = {
					material1 = yellow_green_1guitar
				}
			}
			cas_mic = {
				desc_id = mic_punk
			}
			cas_mic_stand = {
				desc_id = mic_stand_glam
			}
			cas_male_base_face = {
				desc_id = 0x3c37a646
			}
		}
	}
	{
		Name = Lars
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
			genre = `black	metal`
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
						bone = Bone_Neck
						scaling = {
							value = (0.3, 0.3, 0.3)
							no_propagate
						}
					}
					{
						bone = bone_chest
						scaling = {
							value = (0.0, 0.65000004, 0.4)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, 0.0)
							no_propagate
						}
					}
					{
						bone = Bone_Collar_R
						scaling = {
							value = (0.2, 0.2, 0.2)
							no_propagate
						}
						translation = {
							value = (0.0, -0.07, 0.0)
						}
					}
					{
						bone = Bone_Collar_L
						scaling = {
							value = (0.2, 0.2, 0.2)
							no_propagate
						}
						translation = {
							value = (0.0, -0.07, 0.0)
						}
					}
					{
						bone = BONE_PELVIS
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
						bone = Bone_Twist_Bicep_Top_R
						scaling = {
							value = (0.0, 1.0, 0.65000004)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_R
						scaling = {
							value = (0.0, 0.8, 0.5)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_L
						scaling = {
							value = (0.0, 1.0, 0.65000004)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_L
						scaling = {
							value = (0.0, 0.8, 0.5)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_L
						scaling = {
							value = (0.0, 0.7, 0.35000002)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_R
						scaling = {
							value = (0.0, 0.7, 0.35000002)
							no_propagate
						}
					}
					{
						bone = Bone_Palm_L
						scaling = {
							value = (0.1, 0.1, 0.1)
						}
					}
					{
						bone = Bone_Palm_R
						scaling = {
							value = (0.1, 0.1, 0.1)
						}
					}
					{
						bone = Bone_Thigh_L
						scaling = {
							value = (0.0, 0.45000002, 0.35000002)
							no_propagate
						}
					}
					{
						bone = Bone_Thigh_R
						scaling = {
							value = (0.0, 0.45000002, 0.35000002)
							no_propagate
						}
					}
					{
						bone = Bone_Ankle_L
						scaling = {
							value = (-0.1, -0.1, -0.1)
						}
					}
					{
						bone = Bone_Ankle_R
						scaling = {
							value = (-0.1, -0.1, -0.1)
						}
					}
					{
						bone = Bone_Stomach_Lower
						scaling = {
							value = (0.0, 0.7, 0.75)
							no_propagate
						}
						translation = {
							value = (-0.0, 0.0, 0.0)
						}
					}
					{
						bone = Bone_Stomach_Upper
						scaling = {
							value = (0.0, 0.7, 0.75)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, 0.0)
							no_propagate
						}
					}
				]
			}
			cas_male_hair = {
				desc_id = m_bmtl_hair_lars
			}
			cas_male_hat = {
				desc_id = None
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
				chosen_materials = {
					material1 = carblack_1
				}
			}
			cas_male_acc_right = {
				desc_id = m_bmtl_acc_rlars
				chosen_materials = {
					material1 = carblack_1
				}
			}
			cas_male_acc_face = {
				desc_id = None
			}
			cas_male_acc_ears = {
				desc_id = None
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
			cas_guitar_body = {
				desc_id = guitar_body07
			}
			cas_guitar_finish = {
				desc_id = custom_color
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_body_detail = {
				desc_id = 0xf98f2ce1
				chosen_materials = {
					material1 = teal_4
				}
			}
			cas_guitar_neck = {
				desc_id = guitar_neck_03
			}
			cas_guitar_neck_finish = {
				desc_id = 0xd6b15efe
			}
			cas_guitar_head = {
				desc_id = 0xe02c0b6d
			}
			cas_guitar_head_finish = {
				desc_id = Color
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_head_detail = {
				desc_id = 0x422ebe21
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_guitar_pickguards = {
				desc_id = 0x7173e1cc
			}
			cas_guitar_bridges = {
				desc_id = guitar_bridges_01
				chosen_materials = {
					material1 = grey_3guitar
				}
			}
			cas_guitar_knobs = {
				desc_id = 0xd2660258
			}
			cas_guitar_pickups = {
				desc_id = 0x128e4055
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_bass_body = {
				desc_id = 0x104f2585
			}
			cas_bass_finish = {
				desc_id = 0xda298d54
				chosen_materials = {
					material1 = teal_4
				}
			}
			cas_bass_body_detail = {
				desc_id = 0x925d0318
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_neck = {
				desc_id = 0x3f3c48b8
			}
			cas_bass_neck_finish = {
				desc_id = 0x91d3bc5c
				chosen_materials = {
					material1 = teal_4
				}
			}
			cas_bass_head = {
				desc_id = 0x972c9b81
			}
			cas_bass_head_finish = {
				desc_id = 0x3910446f
				chosen_materials = {
					material1 = teal_3
				}
			}
			cas_bass_head_detail = {
				desc_id = 0x42c8ec45
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_pickguards = {
				desc_id = None
			}
			cas_bass_pickups = {
				desc_id = bass_pickups_emg03
			}
			cas_bass_bridges = {
				desc_id = bass_bridges_01
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
				desc_id = singlebasskit
			}
			cas_drum_finish = {
				desc_id = drumshell_ds_48
				chosen_materials = {
					material1 = teal_3
				}
			}
			cas_drum_detail = {
				desc_id = 0x82513c9b
				chosen_materials = {
					material1 = teal_1
				}
			}
			cas_mic = {
				desc_id = mic_sixties
			}
			cas_mic_stand = {
				desc_id = mic_stand_rock
			}
			cas_male_base_face = {
				desc_id = 0xd09045d3
			}
		}
	}
	{
		Name = Midori
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
			cas_female_hair = {
				desc_id = f_pop_hair_midori
				chosen_materials = {
					material1 = purple_blue_1
					material2 = red_1
				}
			}
			cas_female_torso = {
				desc_id = f_pop_torso_midori
				chosen_materials = {
					material1 = purple_blue_1
					material2 = violet_2
				}
			}
			cas_female_legs = {
				desc_id = f_pop_legs_skirt
				chosen_materials = {
					material1 = green_1
					material2 = purple_blue_1
				}
			}
			cas_female_shoes = {
				desc_id = f_pop_shoe_platforms
				chosen_materials = {
					material1 = purple_blue_1
				}
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
			cas_guitar_body = {
				desc_id = guitar_body15
			}
			cas_guitar_finish = {
				desc_id = custom_color
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_guitar_body_detail = {
				desc_id = 0x80e8acf6
				chosen_materials = {
					material1 = violet_1
				}
			}
			cas_guitar_neck = {
				desc_id = 0x368da4e9
			}
			cas_guitar_neck_finish = {
				desc_id = 0x2de1689c
				chosen_materials = {
					material1 = violet_5
				}
			}
			cas_guitar_head = {
				desc_id = 0x80eb8288
				chosen_materials = {
					material1 = orange_4
				}
			}
			cas_guitar_head_finish = {
				desc_id = Color
			}
			cas_guitar_head_detail = {
				desc_id = 0x4a1ab149
				chosen_materials = {
					material1 = violet_3
				}
			}
			cas_guitar_pickguards = {
				desc_id = None
			}
			cas_guitar_bridges = {
				desc_id = guitar_bridges_01
				chosen_materials = {
					material1 = orange_4
				}
			}
			cas_guitar_knobs = {
				desc_id = 0x1737864c
			}
			cas_guitar_pickups = {
				desc_id = 0xe2a76f36
			}
			cas_bass_body = {
				desc_id = 0x821dda2f
			}
			cas_bass_finish = {
				desc_id = 0x59d0eefc
				chosen_materials = {
					material1 = green_3guitar
				}
			}
			cas_bass_body_detail = {
				desc_id = 0xc4ef0551
				chosen_materials = {
					material1 = green_2guitar
				}
			}
			cas_bass_neck = {
				desc_id = 0x4f56bc37
			}
			cas_bass_neck_finish = {
				desc_id = 0x11a9815a
				chosen_materials = {
					material1 = purple_blue_3
				}
			}
			cas_bass_head = {
				desc_id = 0x7922faad
				chosen_materials = {
					material1 = purple_blue_3
				}
			}
			cas_bass_head_finish = {
				desc_id = 0xba1fe0f9
				chosen_materials = {
					material1 = green_3guitar
				}
			}
			cas_bass_head_detail = {
				desc_id = 0xa8335d54
				chosen_materials = {
					material1 = green_2guitar
				}
			}
			cas_bass_pickguards = {
				desc_id = None
			}
			cas_bass_pickups = {
				desc_id = 0x111db891
			}
			cas_bass_bridges = {
				desc_id = bass_bridges_03
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
			cas_drums = {
				desc_id = singlebasskit
			}
			cas_mic = {
				desc_id = mic_sixties
			}
			cas_mic_stand = {
				desc_id = mic_stand_rock
			}
			cas_female_base_face = {
				desc_id = 0xf96f444b
			}
		}
	}
	{
		Name = clive
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
						bone = Bone_Neck
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
						bone = Bone_Stomach_Upper
						scaling = {
							value = (0.0, -0.1, -0.1)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Lower
						scaling = {
							value = (0.0, -0.1, -0.1)
							no_propagate
						}
					}
					{
						bone = BONE_PELVIS
						scaling = {
							value = (0.0, -0.1, -0.1)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_R
						scaling = {
							value = (0.0, -0.3, -0.25)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_R
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_R
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_L
						scaling = {
							value = (0.0, -0.3, -0.25)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_L
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_L
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Collar_R
						translation = {
							value = (0.0, 0.02, 0.0)
						}
					}
					{
						bone = Bone_Collar_L
						translation = {
							value = (0.0, 0.02, 0.0)
						}
					}
					{
						bone = Bone_Thigh_R
						scaling = {
							value = (0.0, -0.4, -0.4)
							no_propagate
						}
					}
					{
						bone = Bone_Thigh_L
						scaling = {
							value = (0.0, -0.4, -0.4)
							no_propagate
						}
					}
					{
						bone = Bone_Knee_R
						scaling = {
							value = (0.0, -0.15, -0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Knee_L
						scaling = {
							value = (0.0, -0.15, -0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Ankle_L
						scaling = {
							value = (0.0, 0.1, 0.2)
						}
					}
					{
						bone = Bone_Ankle_R
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
				desc_id = None
			}
			cas_male_facial_hair = {
				desc_id = m_clsc_fhair_stache02
			}
			cas_male_torso = {
				desc_id = m_clsc_torso_clrdjakt
				chosen_materials = {
					material1 = red_orange_1
				}
			}
			cas_male_legs = {
				desc_id = m_clsc_legs_whtbells
				chosen_materials = {
					material1 = carblack_1
				}
			}
			cas_male_shoes = {
				desc_id = m_clsc_shoe_whtboot
			}
			cas_male_acc_face = {
				desc_id = m_clsc_glasses_avtr
			}
			cas_male_acc_ears = {
				desc_id = None
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
			cas_guitar_body = {
				desc_id = guitar_body05
			}
			cas_guitar_finish = {
				desc_id = finish_generic_17
				chosen_materials = {
					material1 = yellow_2guitar
				}
			}
			cas_guitar_body_detail = {
				desc_id = 0xbd888546
				chosen_materials = {
					material1 = red_1
				}
			}
			cas_guitar_neck = {
				desc_id = 0x368da4e9
			}
			cas_guitar_head = {
				desc_id = 0x31eeb024
			}
			cas_guitar_pickguards = {
				desc_id = None
			}
			cas_guitar_bridges = {
				desc_id = guitar_bridges_01
				chosen_materials = {
					material1 = grey_4guitar
				}
			}
			cas_guitar_knobs = {
				desc_id = 0x602fd524
				chosen_materials = {
					material1 = grey_4guitar
				}
			}
			cas_guitar_pickups = {
				desc_id = 0x2eaf95df
				chosen_materials = {
					material1 = red_1
				}
			}
			cas_bass_body = {
				desc_id = 0xc68ed178
			}
			cas_bass_finish = {
				desc_id = 0x59d0eefc
				chosen_materials = {
					material1 = yellow_2guitar
				}
			}
			cas_bass_body_detail = {
				desc_id = 0x844ada87
				chosen_materials = {
					material1 = violet_1
				}
			}
			cas_bass_neck = {
				desc_id = 0x4f56bc37
			}
			cas_bass_neck_finish = {
				desc_id = 0xc9b00c70
				chosen_materials = {
					material1 = blue_4
				}
			}
			cas_bass_head = {
				desc_id = 0x62683f0c
				chosen_materials = {
					material1 = orange_3
				}
			}
			cas_bass_head_finish = {
				desc_id = 0xc22c2fe9
				chosen_materials = {
					material1 = orange_2
				}
			}
			cas_bass_head_detail = {
				desc_id = 0x292d3933
				chosen_materials = {
					material1 = violet_2
				}
			}
			cas_bass_pickguards = {
				desc_id = bass_pickg_6tz04
			}
			cas_bass_pickguard_finish = {
				desc_id = custom_color
				chosen_materials = {
					material1 = yellow_1
				}
			}
			cas_bass_pickups = {
				desc_id = 0x053de871
			}
			cas_bass_bridges = {
				desc_id = bass_bridges_03
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
				desc_id = singlebasskit
			}
			cas_drum_finish = {
				desc_id = drumshell_rm_03
				chosen_materials = {
					material1 = yellow_4guitar
				}
			}
			cas_drum_detail = {
				desc_id = bass_skin_ds_01
				chosen_materials = {
					material1 = blue_4
				}
			}
			cas_mic = {
				desc_id = mic_sixties
			}
			cas_mic_stand = {
				desc_id = mic_stand_rock
			}
			cas_male_base_face = {
				desc_id = 0x3fec7124
			}
		}
	}
	{
		Name = pandora
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
			}
			cas_physique = {
				desc_id = femalephysique
				bones = {
					physique = -1.0
				}
			}
			cas_female_hair = {
				desc_id = f_goth_hair_updo
				chosen_materials = {
					material1 = navy_3
					material2 = blue_3
				}
			}
			cas_female_hat = {
				desc_id = None
			}
			cas_female_torso = {
				desc_id = f_goth_torso_frillybodice
				chosen_materials = {
					material1 = purple_blue_3
					material2 = grey_3
					material3 = purple_blue_3
					material4 = grey_2
				}
			}
			cas_female_legs = {
				desc_id = f_goth_legs_frillydress
				chosen_materials = {
					material1 = purple_blue_4
					material2 = purple_blue_4
					material3 = navy_4
				}
			}
			cas_female_shoes = {
				desc_id = f_goth_shoes_maryjanes
			}
			cas_female_acc_left = {
				desc_id = None
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
			}
			cas_guitar_finish = {
				desc_id = 0x7c6e2292
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_guitar_body_detail = {
				desc_id = 0xd186c838
				chosen_materials = {
					material1 = purple_blue_1
				}
			}
			cas_guitar_neck = {
				desc_id = guitar_neck_03
			}
			cas_guitar_neck_finish = {
				desc_id = 0x8cfc37bf
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_guitar_head = {
				desc_id = 0x972b3bfb
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_head_finish = {
				desc_id = Color
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_head_detail = {
				desc_id = 0xf9838e29
				chosen_materials = {
					material1 = purple_blue_1
				}
			}
			cas_guitar_pickguards = {
				desc_id = None
			}
			cas_guitar_bridges = {
				desc_id = guitar_bridges_01
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_knobs = {
				desc_id = 0x5444863e
				chosen_materials = {
					material1 = purple_blue_1
				}
			}
			cas_guitar_pickups = {
				desc_id = guitar_pickups05_03
				chosen_materials = {
					material1 = purple_blue_1
				}
			}
			cas_bass_body = {
				desc_id = 0x821dda2f
			}
			cas_bass_finish = {
				desc_id = 0xa69c1326
				chosen_materials = {
					material1 = violet_5
				}
			}
			cas_bass_neck = {
				desc_id = 0x4f56bc37
			}
			cas_bass_neck_finish = {
				desc_id = 0xd4a86a20
				chosen_materials = {
					material1 = violet_1
				}
			}
			cas_bass_head = {
				desc_id = 0x7922faad
				chosen_materials = {
					material1 = orange_3
				}
			}
			cas_bass_head_finish = {
				desc_id = 0xba1fe0f9
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_head_detail = {
				desc_id = 0x463d3c78
				chosen_materials = {
					material1 = violet_2
				}
			}
			cas_bass_pickguards = {
				desc_id = None
			}
			cas_bass_pickups = {
				desc_id = 0x16707c88
			}
			cas_bass_bridges = {
				desc_id = bass_bridge_hack
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
			cas_drums = {
				desc_id = singlebasskit
			}
			cas_drum_finish = {
				desc_id = drumshell_ds_41
				chosen_materials = {
					material1 = navy_2
				}
			}
			cas_mic = {
				desc_id = mic_blackmetal
			}
			cas_mic_stand = {
				desc_id = mic_stand_rock
			}
			cas_female_base_face = {
				desc_id = 0x1161bde8
			}
		}
	}
	{
		Name = eddie
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
						bone = Bone_Collar_R
						scaling = {
							value = (0.2, 0.1, 0.1)
							no_propagate
						}
						translation = {
							value = (0.0, -0.015, 0.0)
						}
					}
					{
						bone = Bone_Collar_L
						scaling = {
							value = (0.2, 0.1, 0.1)
							no_propagate
						}
						translation = {
							value = (0.0, -0.015, 0.0)
						}
					}
					{
						bone = BONE_PELVIS
						scaling = {
							value = (-0.1, -0.1, -0.1)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Upper
						scaling = {
							value = (0.0, 0.0, 0.0)
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_R
						scaling = {
							value = (0.0, 0.2, 0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_R
						scaling = {
							value = (0.0, 0.2, 0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_L
						scaling = {
							value = (0.0, 0.2, 0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_L
						scaling = {
							value = (0.0, 0.2, 0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Thigh_R
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Thigh_L
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Knee_R
						scaling = {
							value = (0.0, -0.15, -0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Knee_L
						scaling = {
							value = (0.0, -0.15, -0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Lower
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
						bone = Bone_Stomach_Upper
						scaling = {
							value = (-0.1, -0.1, -0.1)
							no_propagate
						}
					}
				]
			}
			cas_male_hair = {
				desc_id = m_pop_hair_pomp
			}
			cas_male_hat = {
				desc_id = None
			}
			cas_male_facial_hair = {
				desc_id = None
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
				desc_id = m_punk_shoes_johnny01
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
			}
			cas_guitar_finish = {
				desc_id = custom_color
				chosen_materials = {
					material1 = red_1
				}
			}
			cas_guitar_body_detail = {
				desc_id = 0xf331f563
				chosen_materials = {
					material1 = yellow_orange_4
				}
			}
			cas_guitar_neck = {
				desc_id = guitar_neck_03
			}
			cas_guitar_neck_finish = {
				desc_id = 0x2de70e3c
				chosen_materials = {
					material1 = blue_5
				}
			}
			cas_guitar_head = {
				desc_id = 0x19e2d332
				chosen_materials = {
					material1 = orange_5
				}
			}
			cas_guitar_head_finish = {
				desc_id = Color
				chosen_materials = {
					material1 = red_2
				}
			}
			cas_guitar_head_detail = {
				desc_id = 0xc495b6aa
				chosen_materials = {
					material1 = yellow_orange_4
				}
			}
			cas_guitar_pickguards = {
				desc_id = 0x95c35962
			}
			cas_guitar_pickguard_finish = {
				desc_id = shell
				chosen_materials = {
					material1 = red_orange_1
				}
			}
			cas_guitar_bridges = {
				desc_id = guitar_bridges_06
				chosen_materials = {
					material1 = orange_5
				}
			}
			cas_guitar_knobs = {
				desc_id = 0x3f2d74f4
				chosen_materials = {
					material1 = grey_4guitar
				}
			}
			cas_guitar_pickups = {
				desc_id = 0x0dfc8c4d
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_body = {
				desc_id = 0xd3414199
			}
			cas_bass_finish = {
				desc_id = 0xa69c1326
				chosen_materials = {
					material1 = red_orange_3
				}
			}
			cas_bass_body_detail = {
				desc_id = 0x1df10539
				chosen_materials = {
					material1 = yellow_3guitar
				}
			}
			cas_bass_neck = {
				desc_id = 0x161c52b3
			}
			cas_bass_neck_finish = {
				desc_id = 0x5ec3c0ad
				chosen_materials = {
					material1 = red_orange_3
				}
			}
			cas_bass_head = {
				desc_id = 0x7e4f3eb4
				chosen_materials = {
					material1 = orange_3
				}
			}
			cas_bass_head_finish = {
				desc_id = 0x7b354312
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_head_detail = {
				desc_id = 0xb05ba3ec
				chosen_materials = {
					material1 = red_orange_2
				}
			}
			cas_bass_pickguards = {
				desc_id = None
			}
			cas_bass_pickups = {
				desc_id = 0xff13d9bd
			}
			cas_bass_bridges = {
				desc_id = bass_bridges_02
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
			cas_drums = {
				desc_id = singlebasskit
			}
			cas_drum_finish = {
				desc_id = drumshell_ds_55
				chosen_materials = {
					material1 = yellow_4guitar
				}
			}
			cas_drum_detail = {
				desc_id = bass_skin_ds_11
				chosen_materials = {
					material1 = yellow_4guitar
				}
			}
			cas_mic = {
				desc_id = mic_standard
			}
			cas_mic_stand = {
				desc_id = mic_stand_rock
			}
			cas_male_base_face = {
				desc_id = 0xb09a31a6
			}
		}
	}
	{
		Name = drummer
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
			genre = `classic	rock`
			cas_body = {
				desc_id = gh4_car_male
				bones = {
					eyescale = 0.3
					nosewidth = 0.7
					eyeposition = -0.0
					eyedepth = 1.0
					upperlipthickness = 0.01
					lowerlipthickness = 0.01
					facefullness = 0.9
					jawscale = 0.2
					eyedistance = -0.83
					noseangle = 0.9
					nosetip = 0.252
					nosebridge = 0.33900002
					nosedepth = 0.565
				}
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
						bone = BONE_PELVIS
						scaling = {
							value = (0.0, 0.1, 0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Lower
						scaling = {
							value = (0.1, 0.1, 0.3)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Upper
						scaling = {
							value = (0.1, 0.2, 0.4)
							no_propagate
						}
					}
					{
						bone = Bone_Neck
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
						bone = Bone_Collar_R
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
						bone = Bone_Collar_L
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
						bone = Bone_Bicep_R
						scaling = {
							value = (0.0, -0.3, -0.3)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_R
						scaling = {
							value = (0.0, 0.3, 0.3)
							no_propagate
						}
					}
					{
						bone = Bone_Palm_R
						scaling = {
							value = (0.0, 0.25, 0.25)
						}
					}
					{
						bone = Bone_Bicep_L
						scaling = {
							value = (0.0, -0.3, -0.3)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_L
						scaling = {
							value = (0.0, 0.3, 0.3)
							no_propagate
						}
					}
					{
						bone = Bone_Palm_L
						scaling = {
							value = (0.0, 0.25, 0.25)
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
				desc_id = m_metl_accl_zakk
			}
			cas_male_acc_right = {
				desc_id = m_metl_accr_zakk
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
			cas_guitar_body = {
				desc_id = guitar_body01
			}
			cas_guitar_neck = {
				desc_id = 0xaf84f553
			}
			cas_guitar_neck_finish = {
				desc_id = 0x7e88e4b9
			}
			cas_guitar_head = {
				desc_id = 0xeef7835f
			}
			cas_guitar_pickguards = {
				desc_id = 0xba16df3c
			}
			cas_guitar_pickups = {
				desc_id = 0x003befbb
			}
			cas_guitar_knobs = {
				desc_id = 0xe069f532
			}
			cas_guitar_bridges = {
				desc_id = guitar_bridges_01
			}
			cas_bass_body = {
				desc_id = 0x104f2585
			}
			cas_bass_finish = {
				desc_id = 0xe9dd85e1
				chosen_materials = {
					material1 = red_orange_4
				}
			}
			cas_bass_body_detail = {
				desc_id = 0x7c536234
				chosen_materials = {
					material1 = yellow_4guitar
				}
			}
			cas_bass_neck = {
				desc_id = 0x3f3c48b8
			}
			cas_bass_neck_finish = {
				desc_id = 0xb8fefac6
				chosen_materials = {
					material1 = blue_4
				}
			}
			cas_bass_head = {
				desc_id = 0x90415f98
				chosen_materials = {
					material1 = orange_3
				}
			}
			cas_bass_head_finish = {
				desc_id = 0xba1fe0f9
				chosen_materials = {
					material1 = orange_1
				}
			}
			cas_bass_pickguards = {
				desc_id = None
			}
			cas_bass_pickups = {
				desc_id = 0x61774c1e
			}
			cas_bass_bridges = {
				desc_id = bass_bridges_03
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
				desc_id = singlebasskit
			}
			cas_drum_finish = {
				desc_id = 0x1a8e44da
				chosen_materials = {
					material1 = red_orange_4
				}
			}
			cas_drum_detail = {
				desc_id = bass_skin_ds_47
				chosen_materials = {
					material1 = violet_1
				}
			}
			cas_mic = {
				desc_id = mic_sixties
			}
			cas_mic_stand = {
				desc_id = mic_stand_rock
			}
			cas_male_base_face = {
				desc_id = 0xa00bb6d2
			}
		}
	}
	{
		Name = BASSIST
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
			genre = `classic	rock`
			cas_body = {
				desc_id = gh4_car_female
				random_weight = 2.0
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
						bone = Bone_Stomach_Upper
						scaling = {
							value = (0.0, -0.1, -0.1)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_R
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
						bone = Bone_Twist_Bicep_Top_L
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
						bone = Bone_Palm_R
						scaling = {
							value = (0.15, 0.15, 0.15)
						}
					}
					{
						bone = Bone_Palm_L
						scaling = {
							value = (0.15, 0.15, 0.15)
						}
					}
					{
						bone = Bone_Forearm_R
						scaling = {
							value = (0.0, 0.15, 0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_L
						scaling = {
							value = (0.0, 0.15, 0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Collar_R
						scaling = {
							value = (0.1, 0.1, 0.1)
							no_propagate
						}
					}
					{
						bone = Bone_Collar_L
						scaling = {
							value = (0.1, 0.1, 0.1)
							no_propagate
						}
					}
					{
						bone = BONE_PELVIS
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
						bone = Bone_Thigh_R
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Thigh_L
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
				]
			}
			cas_female_hair = {
				desc_id = f_rock_hair_bass
			}
			cas_female_hat = {
				desc_id = None
			}
			cas_female_facial_hair = {
				desc_id = None
			}
			cas_female_torso = {
				desc_id = f_rock_torso_bass
			}
			cas_female_legs = {
				desc_id = f_rock_legs_jeans
			}
			cas_female_shoes = {
				desc_id = 0x644d9f45
			}
			cas_female_acc_left = {
				desc_id = f_bmtl_acc_ltripleband
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
				desc_id = win_waving
			}
			cas_female_lose_anim = {
				desc_id = lose_generic
			}
			cas_female_intro_anim = {
				desc_id = intro_generic1
			}
			cas_guitar_body = {
				desc_id = guitar_body06
			}
			cas_guitar_finish = {
				desc_id = 0xb94d107d
			}
			cas_guitar_neck = {
				desc_id = 0x368da4e9
			}
			cas_guitar_neck_finish = {
				desc_id = 0x3e97891d
				chosen_materials = {
					material1 = blue_5
				}
			}
			cas_guitar_head = {
				desc_id = 0x19e2d332
				chosen_materials = {
					material1 = orange_4
				}
			}
			cas_guitar_head_finish = {
				desc_id = Color
				chosen_materials = {
					material1 = red_2
				}
			}
			cas_guitar_head_detail = {
				desc_id = 0xc495b6aa
				chosen_materials = {
					material1 = teal_1
				}
			}
			cas_guitar_pickguards = {
				desc_id = None
			}
			cas_guitar_bridges = {
				desc_id = guitar_bridges_01
				chosen_materials = {
					material1 = orange_4
				}
			}
			cas_guitar_knobs = {
				desc_id = 0x047bfd63
				chosen_materials = {
					material1 = yellow_green_1guitar
				}
			}
			cas_guitar_pickups = {
				desc_id = 0x7cc3fa95
				chosen_materials = {
					material1 = yellow_green_1guitar
				}
			}
			cas_bass_body = {
				desc_id = 0x4d25d43a
			}
			cas_bass_finish = {
				desc_id = 0x59d0eefc
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_neck = {
				desc_id = 0x483b782e
			}
			cas_bass_neck_finish = {
				desc_id = 0x7e88e4b9
				chosen_materials = {
					material1 = grey_1
				}
			}
			cas_bass_head = {
				desc_id = 0x0e25ca3b
			}
			cas_bass_pickguards = {
				desc_id = 0x20aae392
			}
			cas_bass_pickups = {
				desc_id = 0xff13d9bd
			}
			cas_bass_bridges = {
				desc_id = bass_bridges_02
			}
			cas_bass_knobs = {
				desc_id = cab_knob_chndr09
				chosen_materials = {
					material1 = orange_3
				}
			}
			cas_drums = {
				desc_id = singlebasskit
			}
			cas_drum_finish = {
				desc_id = drumshell_ds_28
				chosen_materials = {
					material1 = yellow_4guitar
				}
			}
			cas_drum_detail = {
				desc_id = bass_skin_ds_81
				chosen_materials = {
					material1 = yellow_4guitar
				}
			}
			cas_mic = {
				desc_id = mic_standard
			}
			cas_mic_stand = {
				desc_id = mic_stand_rock
			}
			cas_female_base_face = {
				desc_id = 0xc4d5a502
			}
		}
	}
	{
		Name = GUITARIST
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
			genre = `classic	rock`
			cas_body = {
				desc_id = gh4_car_male
				bones = {
					jawscale = 0.5
					facefullness = 0.4
				}
			}
			cas_physique = {
				desc_id = malephysique
				bones = {
					height = -1.0
				}
				additional_bone_transforms = [
					{
						bone = control_root
						scaling = {
							value = (0.01, 0.01, 0.01)
						}
					}
					{
						bone = BONE_PELVIS
						scaling = {
							value = (0.0, 0.1, 0.1)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Upper
						scaling = {
							value = (0.0, 0.025, 0.025)
							no_propagate
						}
					}
					{
						bone = Bone_Neck
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
						bone = Bone_Collar_R
						scaling = {
							value = (0.0, 0.15, 0.3)
							no_propagate
						}
						translation = {
							value = (0.0, -0.02, 0.0)
						}
					}
					{
						bone = Bone_Collar_L
						scaling = {
							value = (0.0, 0.15, 0.3)
							no_propagate
						}
						translation = {
							value = (0.0, -0.02, 0.0)
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_R
						scaling = {
							value = (0.0, 0.05, 0.05)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_L
						scaling = {
							value = (0.0, 0.05, 0.05)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_R
						scaling = {
							value = (0.0, -0.3, -0.3)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_R
						scaling = {
							value = (0.0, 0.3, 0.3)
							no_propagate
						}
					}
					{
						bone = Bone_Palm_R
						scaling = {
							value = (0.0, 0.2, 0.2)
						}
					}
					{
						bone = Bone_Bicep_L
						scaling = {
							value = (0.0, -0.3, -0.3)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_L
						scaling = {
							value = (0.0, 0.3, 0.3)
							no_propagate
						}
					}
					{
						bone = Bone_Palm_L
						scaling = {
							value = (0.0, 0.2, 0.2)
						}
					}
					{
						bone = Bone_Thigh_R
						scaling = {
							value = (0.0, -0.15, -0.15)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, -0.01)
							no_propagate
						}
					}
					{
						bone = Bone_Thigh_L
						scaling = {
							value = (0.0, -0.15, -0.15)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, 0.01)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Lower
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
				chosen_materials = {
					material1 = carblack_1
				}
			}
			cas_male_shoes = {
				desc_id = m_punk_shoe_buckleb
			}
			cas_male_acc_left = {
				desc_id = m_metl_acc_lhole
			}
			cas_male_acc_right = {
				desc_id = m_metl_acc_rstuds
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
			cas_male_base_torso = {
				desc_id = male_full
			}
			cas_guitar_body = {
				desc_id = guitar_body09
			}
			cas_guitar_finish = {
				desc_id = custom_color
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_body_detail = {
				desc_id = 0x19505bd2
			}
			cas_guitar_neck = {
				desc_id = guitar_neck_03
			}
			cas_guitar_neck_finish = {
				desc_id = 0x6a3e93df
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_guitar_head = {
				desc_id = 0x80eb8288
				chosen_materials = {
					material1 = grey_4guitar
				}
			}
			cas_guitar_head_finish = {
				desc_id = Color
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_head_detail = {
				desc_id = 0x4a1ab149
			}
			cas_guitar_pickguards = {
				desc_id = None
			}
			cas_guitar_bridges = {
				desc_id = guitar_bridges_01
				chosen_materials = {
					material1 = grey_4guitar
				}
			}
			cas_guitar_knobs = {
				desc_id = 0x6b3adc30
			}
			cas_guitar_pickups = {
				desc_id = 0x128e4055
				chosen_materials = {
					material1 = grey_4guitar
				}
			}
			cas_bass_body = {
				desc_id = 0x104f2585
			}
			cas_bass_finish = {
				desc_id = 0xf34260ce
				chosen_materials = {
					material1 = purple_blue_2
				}
			}
			cas_bass_body_detail = {
				desc_id = 0x0c3996bb
				chosen_materials = {
					material1 = blue_3
				}
			}
			cas_bass_neck = {
				desc_id = 0x3f3c48b8
			}
			cas_bass_neck_finish = {
				desc_id = 0xc5909c11
				chosen_materials = {
					material1 = yellow_4guitar
				}
			}
			cas_bass_head = {
				desc_id = 0x03aaddca
				chosen_materials = {
					material1 = orange_3
				}
			}
			cas_bass_head_finish = {
				desc_id = 0x98b43539
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_head_detail = {
				desc_id = 0x06bb4f27
			}
			cas_bass_pickguards = {
				desc_id = None
			}
			cas_bass_pickups = {
				desc_id = 0x8f792d32
			}
			cas_bass_bridges = {
				desc_id = bass_bridges_01
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
			cas_drums = {
				desc_id = singlebasskit
			}
			cas_drum_finish = {
				desc_id = drumshell_ds_40
			}
			cas_drum_detail = {
				desc_id = 0x5904fb2c
				chosen_materials = {
					material1 = navy_4
				}
			}
			cas_mic = {
				desc_id = mic_blackmetal
			}
			cas_mic_stand = {
				desc_id = mic_stand_rock
			}
		}
	}
	{
		Name = singer
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
			genre = `classic	rock`
			cas_body = {
				desc_id = gh4_car_male
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
						bone = Bone_Stomach_Lower
						scaling = {
							value = (-0.05, -0.05, -0.05)
							stop_propagate
						}
					}
					{
						bone = BONE_PELVIS
						scaling = {
							value = (-0.25, -0.15, -0.125)
							no_propagate
						}
					}
					{
						bone = Bone_Thigh_R
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, -0.01)
							no_propagate
						}
					}
					{
						bone = Bone_Knee_R
						scaling = {
							value = (0.0, -0.25, -0.25)
							no_propagate
						}
					}
					{
						bone = Bone_Thigh_L
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, 0.01)
							no_propagate
						}
					}
					{
						bone = Bone_Knee_L
						scaling = {
							value = (0.0, -0.25, -0.25)
							no_propagate
						}
					}
					{
						bone = Bone_Palm_R
						scaling = {
							value = (0.01, 0.01, 0.01)
							stop_propagate
						}
					}
					{
						bone = Bone_Palm_L
						scaling = {
							value = (0.01, 0.01, 0.01)
							stop_propagate
						}
					}
					{
						bone = Bone_Collar_L
						scaling = {
							value = (0.15, 0.15, 0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Collar_R
						scaling = {
							value = (0.15, 0.15, 0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_R
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_L
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_L
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_R
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_L
						scaling = {
							value = (0.0, -0.1, -0.1)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_R
						scaling = {
							value = (0.0, -0.1, -0.1)
							no_propagate
						}
					}
				]
			}
			cas_male_hair = {
				desc_id = m_glam_hair_seagull
			}
			cas_male_hat = {
				desc_id = None
			}
			cas_male_facial_hair = {
				desc_id = None
			}
			cas_male_torso = {
				desc_id = m_torso_tasselvest
			}
			cas_male_legs = {
				desc_id = m_glam_legs_spandex
				chosen_materials = {
					material1 = carblack_1
				}
			}
			cas_male_shoes = {
				desc_id = m_clsc_shoe_drkboot
			}
			cas_male_acc_left = {
				desc_id = m_pop_acc_lband
			}
			cas_male_acc_face = {
				desc_id = m_clsc_glasses_avtr
			}
			cas_male_acc_ears = {
				desc_id = None
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
			cas_male_base_face = {
				desc_id = 0xc93264a5
			}
			cas_guitar_body = {
				desc_id = guitar_body11
			}
			cas_guitar_finish = {
				desc_id = 0x12722345
			}
			cas_guitar_body_detail = {
				desc_id = 0x0f8a3ba1
				chosen_materials = {
					material1 = red_1
				}
			}
			cas_guitar_neck = {
				desc_id = 0xdfee01dc
			}
			cas_guitar_neck_finish = {
				desc_id = 0x900be094
				chosen_materials = {
					material1 = blue_5
				}
			}
			cas_guitar_head = {
				desc_id = 0x6ee5e3a4
				chosen_materials = {
					material1 = grey_3guitar
				}
			}
			cas_guitar_head_finish = {
				desc_id = Color
				chosen_materials = {
					material1 = red_orange_2
				}
			}
			cas_guitar_head_detail = {
				desc_id = 0x083fb634
			}
			cas_guitar_pickguards = {
				desc_id = None
			}
			cas_guitar_bridges = {
				desc_id = guitar_bridges_01
				chosen_materials = {
					material1 = grey_3guitar
				}
			}
			cas_guitar_knobs = {
				desc_id = 0x7d1c37fc
			}
			cas_guitar_pickups = {
				desc_id = 0xdd3517a6
				chosen_materials = {
					material1 = orange_2
				}
			}
			cas_bass_body = {
				desc_id = 0x0f3d3223
			}
			cas_bass_finish = {
				desc_id = 0x59d0eefc
				chosen_materials = {
					material1 = red_1
				}
			}
			cas_bass_neck = {
				desc_id = bass_neck_01
			}
			cas_bass_neck_finish = {
				desc_id = 0x4008d116
				chosen_materials = {
					material1 = blue_4
				}
			}
			cas_bass_head = {
				desc_id = 0xe02bab17
				chosen_materials = {
					material1 = orange_4
				}
			}
			cas_bass_pickguards = {
				desc_id = 0x67f34131
			}
			cas_bass_pickguard_finish = {
				desc_id = shell
				chosen_materials = {
					material1 = blue_4
				}
			}
			cas_bass_pickups = {
				desc_id = 0x111db891
			}
			cas_bass_bridges = {
				desc_id = bass_bridges_01
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
				desc_id = singlebasskit
			}
			cas_drum_finish = {
				desc_id = drumshell_ds_09
				chosen_materials = {
					material1 = red_1
				}
			}
			cas_drum_detail = {
				desc_id = 0x401fca6d
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_mic = {
				desc_id = mic_sixties
			}
			cas_mic_stand = {
				desc_id = mic_stand_rock
			}
		}
	}
	{
		Name = 0x8536baaa
		fullname = qs(0x3256d6c9)
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		preset_icon = 0x3f67bd1d
		blurb = qs(0x219f5824)
		appearance = {
			genre = `classic	rock`
			cas_body = {
				desc_id = gh4_car_winner
				chosen_materials = {
					skin = skin_tan_2
				}
				bones = {
					facefullness = 1.0
				}
			}
			cas_physique = {
				desc_id = malephysique
				bones = {
					height = 0.0
				}
				additional_bone_transforms = [
					{
						bone = bone_head
						scaling = {
							value = (0.15, 0.15, 0.15)
						}
					}
					{
						bone = Bone_Neck
						scaling = {
							value = (0.2, 0.2, 0.2)
							no_propagate
						}
					}
					{
						bone = bone_chest
						scaling = {
							value = (0.0, 0.65000004, 0.4)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, 0.0)
							no_propagate
						}
					}
					{
						bone = Bone_Collar_R
						translation = {
							value = (0.0, -0.07, 0.0)
						}
					}
					{
						bone = Bone_Collar_L
						translation = {
							value = (0.0, -0.07, 0.0)
						}
					}
					{
						bone = BONE_PELVIS
						scaling = {
							value = (0.0, 0.65000004, 0.5)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, 0.0)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_R
						scaling = {
							value = (0.0, 0.45000002, 0.4)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_R
						scaling = {
							value = (0.0, 0.4, 0.3)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_L
						scaling = {
							value = (0.0, 0.45000002, 0.4)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_L
						scaling = {
							value = (0.0, 0.4, 0.3)
							no_propagate
						}
					}
					{
						bone = Bone_Palm_L
						scaling = {
							value = (0.15, 0.15, 0.15)
						}
					}
					{
						bone = Bone_Palm_R
						scaling = {
							value = (0.15, 0.15, 0.15)
						}
					}
					{
						bone = Bone_Thigh_L
						scaling = {
							value = (0.0, 0.45000002, 0.35000002)
							no_propagate
						}
					}
					{
						bone = Bone_Thigh_R
						scaling = {
							value = (0.0, 0.45000002, 0.35000002)
							no_propagate
						}
					}
					{
						bone = Bone_Ankle_L
						scaling = {
							value = (-0.1, -0.1, -0.1)
						}
					}
					{
						bone = Bone_Ankle_R
						scaling = {
							value = (-0.1, -0.1, -0.1)
						}
					}
					{
						bone = Bone_Stomach_Lower
						scaling = {
							value = (0.0, 0.75, 0.75)
							no_propagate
						}
						translation = {
							value = (-0.0, 0.0, 0.0)
						}
					}
					{
						bone = Bone_Stomach_Upper
						scaling = {
							value = (0.0, 0.95, 0.75)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, 0.0)
							no_propagate
						}
					}
				]
			}
			cas_male_hair = {
				desc_id = 0x2b6f4055
				chosen_materials = {
					material1 = yellow_orange_1
					material2 = yellow_orange_1
				}
			}
			cas_male_facial_hair = {
				desc_id = 0xb8a237b4
				chosen_materials = {
					material1 = yellow_orange_1
				}
			}
			cas_male_torso = {
				desc_id = 0xd2dbff9e
			}
			cas_male_legs = {
				desc_id = 0xcc95a8a5
			}
			cas_male_shoes = {
				desc_id = m_clsc_shoe_jimi
				chosen_materials = {
					material1 = carblack_1
					material2 = carblack_1
				}
			}
			cas_male_acc_face = {
				desc_id = 0x5402b7a6
			}
			cas_highway = {
				desc_id = axelhighway
			}
			cas_gems = {
				desc_id = gem_set_01
			}
			cas_male_base_face = {
				desc_id = 0x2fde3d42
			}
			cas_guitar_body = {
				desc_id = guitar_body05
			}
			cas_guitar_finish = {
				desc_id = finish_generic_17
				chosen_materials = {
					material1 = yellow_1guitar
				}
			}
			cas_guitar_body_detail = {
				desc_id = 0x23ec10e5
				chosen_materials = {
					material1 = red_1
				}
			}
			cas_guitar_neck = {
				desc_id = guitar_neck_03
			}
			cas_guitar_neck_finish = {
				desc_id = 0x7e88e4b9
			}
			cas_guitar_head = {
				desc_id = 0x31eeb024
				chosen_materials = {
					material1 = yellow_1guitar
				}
			}
			cas_guitar_head_finish = {
				desc_id = Color
				chosen_materials = {
					material1 = black_1
				}
			}
			cas_guitar_head_detail = {
				desc_id = 0x778459c0
			}
			cas_guitar_pickguards = {
				desc_id = 0x3574486b
			}
			cas_guitar_pickguard_finish = {
				desc_id = shell
			}
			cas_guitar_bridges = {
				desc_id = guitar_bridges_01
			}
			cas_guitar_knobs = {
				desc_id = 0x93e4ec4a
			}
			cas_guitar_pickups = {
				desc_id = 0x003befbb
			}
			cas_bass_body = {
				desc_id = 0x4d25d43a
			}
			cas_bass_finish = {
				desc_id = 0x59d0eefc
				chosen_materials = {
					material1 = orange_1
				}
			}
			cas_bass_body_detail = {
				desc_id = 0xdcc9d5c7
				chosen_materials = {
					material1 = red_1
				}
			}
			cas_bass_neck = {
				desc_id = 0x3f3c48b8
			}
			cas_bass_neck_finish = {
				desc_id = 0x7e88e4b9
			}
			cas_bass_head = {
				desc_id = 0x62683f0c
			}
			cas_bass_head_finish = {
				desc_id = 0xc22c2fe9
				chosen_materials = {
					material1 = black_1
				}
			}
			cas_bass_head_detail = {
				desc_id = 0x5e2a09a5
			}
			cas_bass_pickguards = {
				desc_id = 0x50c0171d
			}
			cas_bass_pickguard_finish = {
				desc_id = shell
			}
			cas_bass_pickups = {
				desc_id = 0xe1652ce5
			}
			cas_bass_bridges = {
				desc_id = bass_bridges_03
			}
			cas_bass_knobs = {
				desc_id = cab_knob_chndr03
			}
			cas_drums = {
				desc_id = singlebasskit
			}
			cas_drum_finish = {
				desc_id = drumshell_ds_11
			}
			cas_drum_detail = {
				desc_id = 0xecaa8561
			}
			cas_mic = {
				desc_id = mic_sixties
			}
			cas_mic_stand = {
				desc_id = mic_stand_rock
			}
		}
	}
]
preset_musician_profiles_locked = [
	{
		Name = nickarnold
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
			genre = `glam	rock`
			cas_body = {
				desc_id = `bestbuy	kid`
				random_weight = 1.5
				bones = {
					headsize = 0.2
					facefullness = 0.0
					jawscale = -0.0
				}
			}
			cas_physique = {
				desc_id = malephysique
				additional_bone_transforms = [
					{
						bone = Bone_Twist_Bicep_Top_L
						scaling = {
							value = (-0.1, -0.1, -0.1)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_R
						scaling = {
							value = (-0.1, -0.1, -0.1)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_L
						scaling = {
							value = (-0.0, -0.1, -0.1)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_R
						scaling = {
							value = (-0.0, -0.1, -0.1)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_R
						scaling = {
							value = (0.0, -0.25, -0.25)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_L
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
			cas_male_hair = {
				desc_id = m_bbkid_hair_beanie
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
				desc_id = m_torso_tshirt
			}
			cas_male_legs = {
				desc_id = m_pop_legs_pants
			}
			cas_male_shoes = {
				desc_id = m_rock_shoe_skulls
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
			cas_male_base_face = {
				desc_id = 0xb58bf29f
			}
			cas_guitar_body = {
				desc_id = guitar_body03
			}
			cas_guitar_finish = {
				desc_id = 0x8c16b6e6
				chosen_materials = {
					material1 = blue_3
				}
			}
			cas_guitar_neck = {
				desc_id = guitar_neck_03
			}
			cas_guitar_neck_finish = {
				desc_id = 0x39d411f7
				chosen_materials = {
					material1 = grey_4guitar
				}
			}
			cas_guitar_head = {
				desc_id = 0x6ee5e3a4
				chosen_materials = {
					material1 = blue_5
				}
			}
			cas_guitar_head_finish = {
				desc_id = Color
				chosen_materials = {
					material1 = navy_1
				}
			}
			cas_guitar_head_detail = {
				desc_id = 0x083fb634
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_pickguards = {
				desc_id = None
			}
			cas_guitar_bridges = {
				desc_id = guitar_bridges_01
				chosen_materials = {
					material1 = blue_5
				}
			}
			cas_guitar_knobs = {
				desc_id = 0xcf4a837e
			}
			cas_guitar_pickups = {
				desc_id = 0xe2a76f36
				chosen_materials = {
					material1 = navy_1
				}
			}
			cas_bass_body = {
				desc_id = 0x4d25d43a
			}
			cas_bass_finish = {
				desc_id = 0xea59518f
				chosen_materials = {
					material1 = blue_3
				}
			}
			cas_bass_body_detail = {
				desc_id = 0xf439fce0
				chosen_materials = {
					material1 = navy_1
				}
			}
			cas_bass_neck = {
				desc_id = bass_neck_01
			}
			cas_bass_neck_finish = {
				desc_id = 0xed9d722f
				chosen_materials = {
					material1 = navy_4
				}
			}
			cas_bass_head = {
				desc_id = 0x09480e22
				chosen_materials = {
					material1 = orange_4
				}
			}
			cas_bass_head_finish = {
				desc_id = 0xb79f438c
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_head_detail = {
				desc_id = 0x7b385bdf
			}
			cas_bass_pickguards = {
				desc_id = None
			}
			cas_bass_pickups = {
				desc_id = 0xff13d9bd
			}
			cas_bass_bridges = {
				desc_id = bass_bridges_01
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
				desc_id = singlebasskit
			}
			cas_drum_finish = {
				desc_id = drumshell_ds_46
				chosen_materials = {
					material1 = yellow_3guitar
				}
			}
			cas_drum_detail = {
				desc_id = 0xb4cc12f8
				chosen_materials = {
					material1 = yellow_2guitar
				}
			}
			cas_mic = {
				desc_id = mic_sixties
			}
			cas_mic_stand = {
				desc_id = mic_stand_rock
			}
		}
	}
	{
		Name = `aaron	steele`
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
					jawscale = -2.0
					facefullness = 0.2
					noseangle = 0.077
					nosebridge = 0.294
					nosetip = 0.9
					eyedepth = 1.0
					eyedistance = -0.7
					lowerlipthickness = 0.5
				}
			}
			cas_physique = {
				desc_id = malephysique
				additional_bone_transforms = [
					{
						bone = control_root
						scaling = {
							value = (-0.08, -0.08, -0.08)
						}
					}
					{
						bone = bone_head
						scaling = {
							value = (0.02, 0.02, 0.02)
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_L
						scaling = {
							value = (-0.1, -0.1, -0.1)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_R
						scaling = {
							value = (-0.1, -0.1, -0.1)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_L
						scaling = {
							value = (-0.0, -0.1, -0.1)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_R
						scaling = {
							value = (-0.0, -0.1, -0.1)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_R
						scaling = {
							value = (0.0, -0.25, -0.25)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_L
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
						bone = Bone_Stomach_Upper
						scaling = {
							value = (0.0, 0.0, 0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Lower
						scaling = {
							value = (0.0, 0.0, 0.0)
							no_propagate
						}
					}
					{
						bone = BONE_PELVIS
						scaling = {
							value = (0.0, 0.0, 0.15)
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
				desc_id = None
			}
			cas_male_facial_hair = {
				desc_id = None
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
					material2 = grey_1
				}
			}
			cas_male_shoes = {
				desc_id = m_punk_shoe_canvas
			}
			cas_highway = {
				desc_id = axelhighway
			}
			cas_male_base_torso = {
				desc_id = male_full
			}
			$preset_musician_instrument_hack
		}
	}
	{
		Name = rina
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
						pre_layer = [
							{
								texture = `tex/models/characters/layers/car/female/makeup/car_female_makeup03.img`
								flags = 4
							}
						]
					}
				]
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
						bone = Bone_Stomach_Upper
						scaling = {
							value = (0.0, 0.0, 0.25)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Lower
						scaling = {
							value = (0.0, 0.0, 0.2)
							no_propagate
						}
					}
				]
			}
			cas_female_hair = {
				desc_id = f_metl_hair_ponytail
				chosen_materials = {
					material1 = orange_1
				}
			}
			cas_female_hat = {
				desc_id = None
			}
			cas_female_torso = {
				desc_id = f_rock_torso_bass
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
				desc_id = f_goth_acc_laceglv_r
				chosen_materials = {
					material1 = grey_1
				}
			}
			cas_highway = {
				desc_id = judyhighway
			}
			cas_female_base_torso = {
				desc_id = female_full
			}
			cas_guitar_body = {
				desc_id = guitar_body01
			}
			cas_guitar_neck = {
				desc_id = 0xaf84f553
			}
			cas_guitar_neck_finish = {
				desc_id = 0x7e88e4b9
			}
			cas_guitar_head = {
				desc_id = 0xeef7835f
			}
			cas_guitar_pickguards = {
				desc_id = 0xba16df3c
			}
			cas_guitar_pickups = {
				desc_id = 0x003befbb
			}
			cas_guitar_knobs = {
				desc_id = 0xe069f532
			}
			cas_guitar_bridges = {
				desc_id = guitar_bridges_01
			}
			cas_bass_body = {
				desc_id = 0x821dda2f
			}
			cas_bass_finish = {
				desc_id = 0x086fe273
				chosen_materials = {
					material1 = red_orange_3
				}
			}
			cas_bass_body_detail = {
				desc_id = 0xb485f1de
				chosen_materials = {
					material1 = teal_1
				}
			}
			cas_bass_neck = {
				desc_id = bass_neck_01
			}
			cas_bass_neck_finish = {
				desc_id = 0x9150dbcb
				chosen_materials = {
					material1 = yellow_green_2guitar
				}
			}
			cas_bass_head = {
				desc_id = 0xe02bab17
				chosen_materials = {
					material1 = orange_4
				}
			}
			cas_bass_head_finish = {
				desc_id = 0x7f176f08
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_pickguards = {
				desc_id = None
			}
			cas_bass_pickups = {
				desc_id = 0x16707c88
			}
			cas_bass_bridges = {
				desc_id = bass_bridges_01
				chosen_materials = {
					material1 = red_orange_5
				}
			}
			cas_bass_knobs = {
				desc_id = cab_knob_phunq02
			}
			cas_drums = {
				desc_id = singlebasskit
			}
			cas_drum_finish = {
				desc_id = 0x31a31719
			}
			cas_drum_detail = {
				desc_id = bass_skin_ds_78
			}
			cas_mic = {
				desc_id = mic_standard
			}
			cas_mic_stand = {
				desc_id = mic_stand_rock
			}
		}
	}
	{
		Name = gh4_car_winner
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
			}
			cas_physique = {
				desc_id = malephysique
				bones = {
					height = 0.2
				}
				additional_bone_transforms = [
				]
			}
			cas_male_hair = {
				desc_id = m_rock_hair_slash
			}
			cas_male_hat = {
				desc_id = None
			}
			cas_male_facial_hair = {
				desc_id = None
			}
			cas_male_torso = {
				desc_id = m_metl_torso_lthrjkt
				chosen_materials = {
					material1 = grey_1
					material2 = grey_1
					material3 = yellow_1
				}
			}
			cas_male_legs = {
				desc_id = m_glam_legs_spandex
				chosen_materials = {
					material1 = carblack_1
				}
			}
			cas_male_shoes = {
				desc_id = m_punk_shoe_buckleb
			}
			cas_male_acc_left = {
				desc_id = m_pop_acc_lband
			}
			cas_male_acc_right = {
				desc_id = m_metl_accr_zakk
			}
			cas_male_acc_face = {
				desc_id = None
			}
			cas_male_acc_ears = {
				desc_id = None
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
			cas_male_base_face = {
				desc_id = 0x1b2d66c5
			}
			cas_guitar_body = {
				desc_id = guitar_body04
			}
			cas_guitar_finish = {
				desc_id = custom_color
				chosen_materials = {
					material1 = orange_3
				}
			}
			cas_guitar_body_detail = {
				desc_id = 0xe5e10b3d
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_neck = {
				desc_id = guitar_neck_03
			}
			cas_guitar_neck_finish = {
				desc_id = 0x07775805
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_guitar_head = {
				desc_id = 0xe99a4746
				chosen_materials = {
					material1 = orange_4
				}
			}
			cas_guitar_head_finish = {
				desc_id = Color
				chosen_materials = {
					material1 = orange_1
				}
			}
			cas_guitar_head_detail = {
				desc_id = 0x1581ab6e
			}
			cas_guitar_pickguards = {
				desc_id = None
			}
			cas_guitar_bridges = {
				desc_id = guitar_bridges_01
				chosen_materials = {
					material1 = orange_4
				}
			}
			cas_guitar_knobs = {
				desc_id = 0xe75071c6
			}
			cas_guitar_pickups = {
				desc_id = 0x003befbb
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_body = {
				desc_id = 0x0f3d3223
			}
			cas_bass_finish = {
				desc_id = 0x59d0eefc
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_body_detail = {
				desc_id = 0x49ab10cd
				chosen_materials = {
					material1 = orange_2
				}
			}
			cas_bass_neck = {
				desc_id = bass_neck_01
			}
			cas_bass_neck_finish = {
				desc_id = 0x1684fe10
				chosen_materials = {
					material1 = orange_3
				}
			}
			cas_bass_head = {
				desc_id = 0x62683f0c
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_bass_head_finish = {
				desc_id = 0xc22c2fe9
				chosen_materials = {
					material1 = orange_2
				}
			}
			cas_bass_head_detail = {
				desc_id = 0x5e2a09a5
			}
			cas_bass_pickguards = {
				desc_id = None
			}
			cas_bass_pickups = {
				desc_id = 0xff13d9bd
			}
			cas_bass_bridges = {
				desc_id = bass_bridges_01
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
				desc_id = singlebasskit
			}
			cas_drum_finish = {
				desc_id = 0xeaf6d0ae
				chosen_materials = {
					material1 = orange_2
				}
			}
			cas_drum_detail = {
				desc_id = 0x4a6f0ebe
				chosen_materials = {
					material1 = orange_2
				}
			}
			cas_mic = {
				desc_id = mic_sixties
			}
			cas_mic_stand = {
				desc_id = mic_stand_rock
			}
		}
	}
	{
		Name = jimi
		fullname = qs(0x57fef50b)
		allowed_parts = [
			guitar
		]
		preset_icon = photo_jimi
		blurb = qs(0xe5e2959b)
		locked
		price = 500000
		appearance = {
			genre = `classic	rock`
			cas_full_body = {
				desc_id = jimi
			}
			cas_physique = {
				desc_id = malephysique
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
			cas_highway = {
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
			cas_guitar_body = {
				desc_id = guitar_body06
			}
			cas_guitar_finish = {
				desc_id = custom_color
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_guitar_body_detail = {
				desc_id = 0xdf57de27
			}
			cas_guitar_neck = {
				desc_id = 0xdfee01dc
			}
			cas_guitar_neck_finish = {
				desc_id = 0x7e88e4b9
				chosen_materials = {
					material1 = yellow_orange_1
				}
			}
			cas_guitar_head = {
				desc_id = 0xeef7835f
			}
			cas_guitar_head_finish = {
				desc_id = Color
				chosen_materials = {
					material1 = orange_3
				}
			}
			cas_guitar_pickguards = {
				desc_id = 0x27c1e785
			}
			cas_guitar_pickguard_finish = {
				desc_id = custom_color
				chosen_materials = {
					material1 = yellow_5
				}
			}
			cas_guitar_bridges = {
				desc_id = guitar_bridge06
			}
			cas_guitar_knobs = {
				desc_id = 0x0aa07551
			}
			cas_guitar_pickups = {
				desc_id = 0x7cc3fa95
			}
			cas_bass_body = {
				desc_id = 0x0f3d3223
			}
			cas_bass_neck = {
				desc_id = bass_neck_01
			}
			cas_bass_head = {
				desc_id = 0x90415f98
			}
			cas_bass_pickguards = {
				desc_id = 0x67f34131
			}
			cas_bass_pickups = {
				desc_id = 0x8f792d32
			}
			cas_bass_knobs = {
				desc_id = cab_knob_unos01
			}
			cas_bass_bridges = {
				desc_id = bass_bridges_01
			}
			cas_mic = {
				desc_id = mic_standard
			}
			cas_mic_stand = {
				desc_id = mic_stand_female
			}
			cas_drums = {
				desc_id = singlebasskit
			}
		}
	}
	{
		Name = hayley
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
			cas_guitar_body = {
				desc_id = guitar_body01
			}
			cas_guitar_neck = {
				desc_id = 0xaf84f553
			}
			cas_guitar_neck_finish = {
				desc_id = 0x7e88e4b9
			}
			cas_guitar_head = {
				desc_id = 0xeef7835f
			}
			cas_guitar_pickguards = {
				desc_id = 0xba16df3c
			}
			cas_guitar_pickups = {
				desc_id = 0x003befbb
			}
			cas_guitar_knobs = {
				desc_id = 0xe069f532
			}
			cas_guitar_bridges = {
				desc_id = guitar_bridges_01
			}
			cas_bass_body = {
				desc_id = 0x0f3d3223
			}
			cas_bass_neck = {
				desc_id = bass_neck_01
			}
			cas_bass_head = {
				desc_id = 0x90415f98
			}
			cas_bass_pickguards = {
				desc_id = 0x67f34131
			}
			cas_bass_pickups = {
				desc_id = 0x8f792d32
			}
			cas_bass_knobs = {
				desc_id = cab_knob_unos01
			}
			cas_bass_bridges = {
				desc_id = bass_bridges_01
			}
			cas_mic = {
				desc_id = 0x5cf420c0
			}
			cas_mic_stand = {
				desc_id = mic_stand_rock
			}
			cas_drums = {
				desc_id = singlebasskit
			}
		}
	}
	{
		Name = tednugent
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
			genre = `heavy	metal`
			cas_full_body = {
				desc_id = tednugent
			}
			cas_physique = {
				desc_id = malephysique
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
			cas_highway = {
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
			cas_guitar_body = {
				desc_id = guitar_body12
			}
			cas_guitar_finish = {
				desc_id = custom_color
				chosen_materials = {
					material1 = black_1
				}
			}
			cas_guitar_neck = {
				desc_id = guitar_neck_nugent
			}
			cas_guitar_head = {
				desc_id = 0xb35ea05b
			}
			cas_guitar_pickguards = {
				desc_id = None
			}
			cas_guitar_bridges = {
				desc_id = guitar_bridges_06
				chosen_materials = {
					material1 = grey_5
				}
			}
			cas_guitar_knobs = {
				desc_id = 0xaf926965
				chosen_materials = {
					material1 = grey_1
				}
			}
			cas_guitar_pickups = {
				desc_id = 0x1f4923a3
				chosen_materials = {
					material1 = grey_1
				}
			}
			cas_bass_body = {
				desc_id = 0x0f3d3223
			}
			cas_bass_neck = {
				desc_id = bass_neck_01
			}
			cas_bass_head = {
				desc_id = 0x90415f98
			}
			cas_bass_pickguards = {
				desc_id = 0x67f34131
			}
			cas_bass_pickups = {
				desc_id = 0x8f792d32
			}
			cas_bass_knobs = {
				desc_id = cab_knob_unos01
			}
			cas_bass_bridges = {
				desc_id = bass_bridges_01
			}
			cas_mic = {
				desc_id = mic_standard
			}
			cas_mic_stand = {
				desc_id = mic_stand_female
			}
			cas_drums = {
				desc_id = singlebasskit
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
		locked
		polaroid = m_fun_skeleton
		price = 6000
		appearance = {
			genre = `heavy	metal`
			cas_full_body = {
				desc_id = Skeleton
			}
			cas_physique = {
				desc_id = malephysique
				additional_bone_transforms = [
					{
						bone = Bone_Palm_L
						scaling = {
							value = (0.5, 0.5, 0.5)
						}
					}
					{
						bone = Bone_Palm_R
						scaling = {
							value = (0.5, 0.5, 0.5)
						}
					}
				]
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
			cas_highway = {
				desc_id = skeletonhighway
			}
			$preset_musician_instrument_hack
		}
	}
	{
		Name = travis
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
			genre = `heavy	metal`
			cas_full_body = {
				desc_id = travis
			}
			cas_physique = {
				desc_id = malephysique
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
			cas_highway = {
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
			cas_guitar_body = {
				desc_id = guitar_body01
			}
			cas_guitar_neck = {
				desc_id = 0xaf84f553
			}
			cas_guitar_neck_finish = {
				desc_id = 0x7e88e4b9
			}
			cas_guitar_head = {
				desc_id = 0xeef7835f
			}
			cas_guitar_pickguards = {
				desc_id = 0xba16df3c
			}
			cas_guitar_pickups = {
				desc_id = 0x003befbb
			}
			cas_guitar_knobs = {
				desc_id = 0xe069f532
			}
			cas_guitar_bridges = {
				desc_id = guitar_bridges_01
			}
			cas_bass_body = {
				desc_id = 0x0f3d3223
			}
			cas_bass_neck = {
				desc_id = bass_neck_01
			}
			cas_bass_head = {
				desc_id = 0x90415f98
			}
			cas_bass_pickguards = {
				desc_id = 0x67f34131
			}
			cas_bass_pickups = {
				desc_id = 0x8f792d32
			}
			cas_bass_knobs = {
				desc_id = cab_knob_unos01
			}
			cas_bass_bridges = {
				desc_id = bass_bridges_01
			}
			cas_mic = {
				desc_id = mic_standard
			}
			cas_mic_stand = {
				desc_id = mic_stand_female
			}
			cas_drums = {
				desc_id = quadbasskit
			}
			cas_drum_finish = {
				desc_id = 0xf382b02c
			}
			cas_drum_detail = {
				desc_id = 0xc5b86a55
			}
		}
	}
	{
		Name = sting
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
			genre = `heavy	metal`
			cas_full_body = {
				desc_id = sting
			}
			cas_physique = {
				desc_id = malephysique
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
			cas_highway = {
				desc_id = stinghighway
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
			cas_guitar_body = {
				desc_id = guitar_body01
			}
			cas_guitar_neck = {
				desc_id = 0xaf84f553
			}
			cas_guitar_neck_finish = {
				desc_id = 0x7e88e4b9
			}
			cas_guitar_head = {
				desc_id = 0xeef7835f
			}
			cas_guitar_pickguards = {
				desc_id = 0xba16df3c
			}
			cas_guitar_pickups = {
				desc_id = 0x003befbb
			}
			cas_guitar_knobs = {
				desc_id = 0xe069f532
			}
			cas_guitar_bridges = {
				desc_id = guitar_bridges_01
			}
			cas_bass_body = {
				desc_id = 0x4d25d43a
			}
			cas_bass_finish = {
				desc_id = 0x05ed9a83
				chosen_materials = {
					material1 = yellow_orange_4
				}
			}
			cas_bass_neck = {
				desc_id = 0x483b782e
			}
			cas_bass_neck_finish = {
				desc_id = 0xb8fefac6
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_bass_head = {
				desc_id = 0x09480e22
			}
			cas_bass_pickguards = {
				desc_id = cab_pguard_sting
			}
			cas_bass_pickups = {
				desc_id = cab_pickup_sting
			}
			cas_bass_bridges = {
				desc_id = bass_bridges_02
			}
			cas_bass_knobs = {
				desc_id = cab_knob_sting
			}
			cas_mic = {
				desc_id = mic_standard
			}
			cas_mic_stand = {
				desc_id = mic_stand_rock
			}
			cas_drums = {
				desc_id = singlebasskit
			}
		}
	}
	{
		Name = zakkwylde
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
			genre = `heavy	metal`
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
						bone = Bone_Collar_R
						scaling = {
							value = (0.0, 0.05, 0.05)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, -0.03)
						}
					}
					{
						bone = Bone_Collar_L
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
						bone = Bone_Stomach_Upper
						scaling = {
							value = (0.0, 0.015, 0.015)
							no_propagate
						}
					}
				]
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
			cas_highway = {
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
			cas_guitar_body = {
				desc_id = guitar_body05
			}
			cas_guitar_finish = {
				desc_id = 0x102dafd3
			}
			cas_guitar_neck = {
				desc_id = guitar_neck_03
			}
			cas_guitar_neck_finish = {
				desc_id = 0xccbd28aa
				chosen_materials = {
					material1 = yellow_orange_5
				}
			}
			cas_guitar_head = {
				desc_id = 0x9d6038ef
				chosen_materials = {
					material1 = orange_4
				}
			}
			cas_guitar_head_finish = {
				desc_id = Color
				chosen_materials = {
					material1 = orange_1
				}
			}
			cas_guitar_pickguards = {
				desc_id = None
			}
			cas_guitar_bridges = {
				desc_id = guitar_bridges_01
				chosen_materials = {
					material1 = orange_4
				}
			}
			cas_guitar_knobs = {
				desc_id = 0x7e59207c
			}
			cas_guitar_pickups = {
				desc_id = 0x84a65d54
			}
			cas_bass_body = {
				desc_id = 0x0f3d3223
			}
			cas_bass_neck = {
				desc_id = bass_neck_01
			}
			cas_bass_head = {
				desc_id = 0x90415f98
			}
			cas_bass_pickguards = {
				desc_id = 0x67f34131
			}
			cas_bass_pickups = {
				desc_id = 0x8f792d32
			}
			cas_bass_knobs = {
				desc_id = cab_knob_unos01
			}
			cas_bass_bridges = {
				desc_id = bass_bridges_01
			}
			cas_mic = {
				desc_id = mic_standard
			}
			cas_mic_stand = {
				desc_id = mic_stand_female
			}
			cas_drums = {
				desc_id = singlebasskit
			}
		}
	}
	{
		Name = ozzy
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
			genre = `heavy	metal`
			cas_full_body = {
				desc_id = ozzy
			}
			cas_physique = {
				desc_id = malephysique
				bones = {
					height = 1
				}
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
			$preset_musician_instrument_hack
		}
	}
	{
		Name = billy
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
			cas_bass_highway = {
				desc_id = corganhighway
			}
			cas_guitar_highway = {
				desc_id = corganhighway
			}
			cas_drums_highway = {
				desc_id = corganhighway
			}
			cas_highway = {
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
			cas_guitar_body = {
				desc_id = guitar_body06
			}
			cas_guitar_finish = {
				desc_id = custom_color
				chosen_materials = {
					material1 = black_1
				}
			}
			cas_guitar_body_detail = {
				desc_id = 0xe5e10b3d
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_neck = {
				desc_id = guitar_neck_corgan
			}
			cas_guitar_head = {
				desc_id = 0xc5dad09c
				chosen_materials = {
					material1 = grey_3
				}
			}
			cas_guitar_head_finish = {
				desc_id = Color
				chosen_materials = {
					material1 = black_1
				}
			}
			cas_guitar_head_detail = {
				desc_id = 0xaf2b5d48
			}
			cas_guitar_pickguards = {
				desc_id = None
			}
			cas_guitar_bridges = {
				desc_id = guitar_bridge06
				chosen_materials = {
					material1 = grey_3
				}
			}
			cas_guitar_knobs = {
				desc_id = 0x741109ec
			}
			cas_guitar_pickups = {
				desc_id = 0x658970c3
				chosen_materials = {
					material1 = black_1
				}
			}
			cas_bass_body = {
				desc_id = 0x0f3d3223
			}
			cas_bass_neck = {
				desc_id = bass_neck_01
			}
			cas_bass_head = {
				desc_id = 0x90415f98
			}
			cas_bass_pickguards = {
				desc_id = 0x67f34131
			}
			cas_bass_pickups = {
				desc_id = 0x8f792d32
			}
			cas_bass_knobs = {
				desc_id = cab_knob_unos01
			}
			cas_bass_bridges = {
				desc_id = bass_bridges_01
			}
			cas_mic = {
				desc_id = mic_standard
			}
			cas_mic_stand = {
				desc_id = mic_stand_female
			}
			cas_drums = {
				desc_id = singlebasskit
			}
		}
	}
	{
		Name = metalhead
		fullname = qs(0x6fae039b)
		allowed_parts = [
			drum
			guitar
			bass
		]
		preset_icon = 0x20d5ee57
		blurb = qs(0x6cec1c19)
		price = 5000
		appearance = {
			genre = `classic	rock`
			cas_full_body = {
				desc_id = metalhead
			}
			cas_physique = {
				desc_id = malephysique
				additional_bone_transforms = [
					{
						bone = control_root
						scaling = {
							value = (0.06, 0.06, 0.06)
						}
					}
					{
						bone = Bone_Neck
						scaling = {
							value = (0.25, 0.25, 0.25)
							no_propagate
						}
					}
					{
						bone = bone_chest
						scaling = {
							value = (0.0, 0.0, 0.45000002)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Upper
						scaling = {
							value = (0.2, 0.25, 0.3)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Lower
						scaling = {
							value = (0.2, 0.25, 0.25)
							no_propagate
						}
					}
					{
						bone = BONE_PELVIS
						scaling = {
							value = (0.0, 0.05, 0.25)
							no_propagate
						}
					}
					{
						bone = Bone_Thigh_R
						translation = {
							value = (0.0, 0.0, -0.1)
						}
					}
					{
						bone = Bone_Thigh_L
						translation = {
							value = (0.0, 0.0, -0.1)
						}
					}
					{
						bone = Bone_Collar_R
						translation = {
							value = (0.0, -0.11, 0.0)
						}
					}
					{
						bone = Bone_Collar_L
						translation = {
							value = (0.0, -0.11, 0.0)
						}
					}
					{
						bone = Bone_Palm_R
						scaling = {
							value = (0.0, 0.3, 0.3)
						}
					}
					{
						bone = Bone_Ankle_R
						scaling = {
							value = (0.13, 0.0, 0.3)
						}
					}
					{
						bone = Bone_Ankle_L
						scaling = {
							value = (0.13, 0.0, 0.3)
						}
					}
				]
			}
			cas_bass_highway = {
				desc_id = 0xddb1b5c2
			}
			cas_guitar_highway = {
				desc_id = 0xddb1b5c2
			}
			cas_drums_highway = {
				desc_id = 0xddb1b5c2
			}
			cas_highway = {
				desc_id = 0xddb1b5c2
			}
			cas_gems = {
				desc_id = gem_set_01
			}
			cas_guitar_body = {
				desc_id = guitar_body15
			}
			cas_guitar_finish = {
				desc_id = 0x7c6e2292
				chosen_materials = {
					material1 = yellow_1guitar
				}
			}
			cas_guitar_body_detail = {
				desc_id = 0x1e8c3955
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_neck = {
				desc_id = guitar_neck_03
			}
			cas_guitar_neck_finish = {
				desc_id = 0x318e4b16
			}
			cas_guitar_head = {
				desc_id = 0x77fed2e5
				chosen_materials = {
					material1 = yellow_1guitar
				}
			}
			cas_guitar_head_finish = {
				desc_id = Color
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_head_detail = {
				desc_id = 0x1f44a277
				chosen_materials = {
					material3 = black_1
				}
			}
			cas_guitar_pickguards = {
				desc_id = None
			}
			cas_guitar_bridges = {
				desc_id = guitar_bridge07
				chosen_materials = {
					material1 = orange_1
				}
			}
			cas_guitar_knobs = {
				desc_id = 0xf7e26f52
				chosen_materials = {
					material1 = orange_1
				}
			}
			cas_guitar_pickups = {
				desc_id = 0xe2a76f36
				chosen_materials = {
					material1 = orange_1
				}
			}
			cas_bass_body = {
				desc_id = 0xa9ed8920
			}
			cas_bass_finish = {
				desc_id = 0xea59518f
				chosen_materials = {
					material1 = red_1
				}
			}
			cas_bass_body_detail = {
				desc_id = 0xd18b60ac
				chosen_materials = {
					material1 = black_1
				}
			}
			cas_bass_neck = {
				desc_id = 0x3f3c48b8
			}
			cas_bass_neck_finish = {
				desc_id = 0x5ed57c9a
			}
			cas_bass_head = {
				desc_id = 0xe02bab17
			}
			cas_bass_head_finish = {
				desc_id = 0x7f176f08
				chosen_materials = {
					material1 = red_1
				}
			}
			cas_bass_head_detail = {
				desc_id = 0xef1d4c62
				chosen_materials = {
					material1 = black_1
				}
			}
			cas_bass_pickguards = {
				desc_id = None
			}
			cas_bass_pickups = {
				desc_id = 0x61774c1e
			}
			cas_bass_bridges = {
				desc_id = bass_bridges_03
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_knobs = {
				desc_id = cab_knob_grmbl10
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_drums = {
				desc_id = singlebasskit
			}
			cas_drum_finish = {
				desc_id = 0x31a31719
			}
			cas_drum_detail = {
				desc_id = None
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_mic = {
				desc_id = mic_sixties
			}
			cas_mic_stand = {
				desc_id = mic_stand_rock
			}
		}
	}
	{
		Name = rockbot
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
			cas_highway = {
				desc_id = rockbothighway
			}
			cas_gems = {
				desc_id = gem_set_01
			}
			$preset_musician_instrument_hack
		}
	}
	{
		Name = randomappearance0
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
		Name = randomappearance1
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
		Name = randomappearance2
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
		Name = randomappearance3
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
		Name = emptyguy
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
