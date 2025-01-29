empty_appearance = {
	CAS_Body = {
		desc_id = NoBody
	}
}
worst_male_appearance_hack = {
	CAS_Male_Physique = {
		desc_id = MalePhysique7
		bones = {
			height = 1.0
			Physique = 1.0
		}
	}
}
worst_female_appearance_hack = {
	CAS_Female_Physique = {
		desc_id = FemalePhysique6
		bones = {
			height = 1.0
			Physique = 1.0
			Chest = 1.0
		}
	}
}
avatar_profile = {
	name = avatar
	fullname = qs(0xd1b24c56)
	allowed_parts = [
		bass
		Drum
		guitar
		vocals
	]
	preset_icon = photo_avatar
	blurb = qs(0x91f094af)
	appearance = {
		genre = `Heavy	Metal`
		CAS_Full_Body = {
			desc_id = avatar
			avatar_meta_data = [
			]
		}
		CAS_Male_Physique = {
			desc_id = AvatarPhysique
		}
		CAS_Guitar_Body = {
			desc_id = GTR4_ESP_Eclipse_01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr4_esp_eclipse_d_01`
					material = GTR4_ESP_Eclipse_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/gtr4_esp_eclipse_LD_01`
							flags = 4
						}
					]
				}
			]
		}
		CAS_Guitar_Neck = {
			desc_id = GTR_Fretboard_04
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
					material = GTR_Fretboard_04_Primary
					diffuse
					pre_layer = [
						{
							Color = grey_5
							texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD93_ESP_Patriot`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Head = {
			desc_id = GTR4_Neckhead_01
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01`
					material = GTR4_Neckhead_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAG/ESP/GTR4_Neckhead_LD_02`
							flags = 36
						}
					]
				}
			]
		}
		CAS_Guitar_Pickguards = {
			desc_id = None
		}
		CAS_Guitar_Bridges = {
			desc_id = GTR4_ESP_Bridge_02
		}
		CAS_Guitar_Knobs = {
			desc_id = GTR4_ESP_Knob_10_03
		}
		CAS_Guitar_Pickups = {
			desc_id = GTR_Pkup_Type1_Blk_2
			chosen_materials = {
				material1 = Black_1guitar
			}
		}
		CAS_Bass_Body = {
			desc_id = Bass9_ESP_AX_01
			CAP = [
				{
					base_tex = `tex\models\CAR_Instruments\Bass\ESP\bass9_esp_ax_d`
					material = Bass9_ESP_AX_01_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass9_ESP_AX_LD_01`
							flags = 4
							Color = blue_3
						}
					]
				}
			]
		}
		CAS_Bass_Neck = {
			desc_id = Bass_Fretboard_24
			CAP = [
				{
					base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d`
					material = Bass_Fretboard_24_Primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_24_inlay_05`
							flags = 4
							Color = grey_5guitar
						}
					]
				}
			]
		}
		CAS_Bass_Head = {
			desc_id = Bass9_Neckhead_01
		}
		CAS_Bass_Pickguards = {
			desc_id = None
		}
		CAS_Bass_Pickups = {
			desc_id = Bass9_Pkup_Type1_Blk_02
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		CAS_bass_Bridges = {
			desc_id = Bass9_Bridge_4str_01
		}
		CAS_Bass_Knobs = {
			desc_id = Bass9_ESP_Knob_10_04
		}
		CAS_Drums = {
			desc_id = basic
		}
		CAS_Drums_Sticks = {
			desc_id = Drumsticks1
		}
		CAS_Mic = {
			desc_id = `Classic	Rock`
		}
		CAS_Mic_Stand = {
			desc_id = `Classic	Rock`
		}
	}
}
Preset_Musician_Profiles_Modifiable = [
]
Preset_Musician_Profiles_Locked = [
	{
		name = GH_Rocker_AdamLevine
		fullname = qs(0x1198e746)
		allowed_parts = [
			bass
			Drum
			guitar
			vocals
		]
		preset_icon = photo_Eddie
		blurb = qs(0x318ad702)
		no_random_pick
		locked
		appearance = {
			genre = rock
			CAS_Full_Body = {
				desc_id = AdamLevine
			}
			CAS_Male_Physique = {
				desc_id = MalePhysiqueUntouched
			}
			CAS_Guitar_Body = {
				desc_id = GTR81_PRS_MiraMT
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/PRS/prs_81_mt_d`
						material = GTR81_PRS_MT_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/PRS/GTR81_PRS_MT_LD01`
								flags = 4
								Color = teal_5
							}
						]
					}
				]
			}
			CAS_Guitar_Neck = {
				desc_id = CAG_24Fret_PRS04
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
						material = GTR_Fretboard24_04_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/PRS/24fret_LD81_PRS_Dots`
								flags = 36
							}
						]
					}
				]
			}
			CAS_Guitar_Head = {
				desc_id = GTR81_Neckhead01
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/PRS/gtr81_neckhead_01d`
						material = GTR81_Neckhead_01_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/PRS/GTR78_Neckhead_LD02`
								flags = 36
								Color = teal_5
							}
						]
					}
				]
			}
			CAS_Guitar_Pickguards = {
				desc_id = GTR81_PGuard
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/PRS/PRS_81_PGuard`
						material = GTR81_PGuard_Primary
						diffuse
						pre_layer = [
							{
								Color = grey_5
								texture = `tex/models/Characters/Layers/CAG/PRS/PRS_81_PGuard_LD01`
								flags = 4
							}
						]
					}
				]
			}
			CAS_Guitar_Bridges = {
				desc_id = GTR81_Bridge01
			}
			CAS_Guitar_Knobs = {
				desc_id = PRS_Knob_Lampshade
			}
			CAS_Guitar_Pickups = {
				desc_id = GTR_pickup_SD06
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Guitar_Misc = {
				desc_id = GTR_Misc_Switch4
			}
			CAS_Bass_Body = {
				desc_id = BS_SCH_T_Body
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\Bass\Schecter\bs_sch_modelt`
						material = BS_Sch_ModelT_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch_MT_DTL01`
								Color = navy_4
							}
						]
					}
				]
			}
			CAS_Bass_Neck = {
				desc_id = Bass_Fretboard_22b
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_03`
						material = Bass_Fretboard_22b_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_Inlay_06`
								flags = 4
								Color = Black_1guitar
							}
						]
					}
				]
			}
			CAS_Bass_Head = {
				desc_id = BS_SCH_T_NHEAD
			}
			CAS_Bass_Pickguards = {
				desc_id = BS_SCH_T_PGA
			}
			CAS_Bass_Pickups = {
				desc_id = Bass_pickup_SD
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_bass_Bridges = {
				desc_id = BS_Sch_Brdg_A
			}
			CAS_Bass_Knobs = {
				desc_id = Knob_Knurl02
			}
			CAS_Bass_Misc = {
				desc_id = None
			}
			CAS_Drums = {
				desc_id = basic
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
						material = CAD_Drums_01_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CADrm/Drumshell_DS_46`
								flags = 32
								Color = grey_5guitar
							}
						]
					}
					{
						base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
						material = CAD_Drums_01_Bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CADrm/GH5_Skin_LD57`
								flags = 4
								Color = red_1
							}
						]
					}
				]
			}
			CAS_Drums_Sticks = {
				desc_id = Drumsticks1
			}
			CAS_Mic = {
				desc_id = Mic_Standard
			}
			CAS_Mic_Stand = {
				desc_id = rock
			}
		}
	}
	{
		name = GH_Rocker_AdamLevine_CareerOnly
		fullname = qs(0x1198e746)
		allowed_parts = [
			bass
			Drum
			guitar
			vocals
		]
		win_anims = [
			s_jeff_win_waving
		]
		lose_anims = [
			s_jeff_lose_walkoff
		]
		preset_icon = photo_Eddie
		blurb = qs(0x318ad702)
		no_random_pick
		selection_not_allowed
		locked
		appearance = {
			genre = rock
			CAS_Full_Body = {
				desc_id = AdamLevine
			}
			CAS_Male_Physique = {
				desc_id = MalePhysiqueUntouched
			}
			CAS_Guitar_Body = {
				desc_id = GTR81_PRS_MiraMT
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/PRS/prs_81_mt_d`
						material = GTR81_PRS_MT_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/PRS/GTR81_PRS_MT_LD01`
								flags = 4
								Color = teal_5
							}
						]
					}
				]
			}
			CAS_Guitar_Neck = {
				desc_id = CAG_24Fret_PRS04
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
						material = GTR_Fretboard24_04_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/PRS/24fret_LD81_PRS_Dots`
								flags = 36
							}
						]
					}
				]
			}
			CAS_Guitar_Head = {
				desc_id = GTR81_Neckhead01
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/PRS/gtr81_neckhead_01d`
						material = GTR81_Neckhead_01_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/PRS/GTR78_Neckhead_LD02`
								flags = 36
								Color = teal_5
							}
						]
					}
				]
			}
			CAS_Guitar_Pickguards = {
				desc_id = GTR81_PGuard
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/PRS/PRS_81_PGuard`
						material = GTR81_PGuard_Primary
						diffuse
						pre_layer = [
							{
								Color = grey_5
								texture = `tex/models/Characters/Layers/CAG/PRS/PRS_81_PGuard_LD01`
								flags = 4
							}
						]
					}
				]
			}
			CAS_Guitar_Bridges = {
				desc_id = GTR81_Bridge01
			}
			CAS_Guitar_Knobs = {
				desc_id = PRS_Knob_Lampshade
			}
			CAS_Guitar_Pickups = {
				desc_id = GTR_pickup_SD06
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Guitar_Misc = {
				desc_id = GTR_Misc_Switch4
			}
			CAS_Bass_Body = {
				desc_id = BS_SCH_T_Body
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\Bass\Schecter\bs_sch_modelt`
						material = BS_Sch_ModelT_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch_MT_DTL01`
								Color = navy_4
							}
						]
					}
				]
			}
			CAS_Bass_Neck = {
				desc_id = Bass_Fretboard_22b
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_03`
						material = Bass_Fretboard_22b_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_Inlay_06`
								flags = 4
								Color = Black_1guitar
							}
						]
					}
				]
			}
			CAS_Bass_Head = {
				desc_id = BS_SCH_T_NHEAD
			}
			CAS_Bass_Pickguards = {
				desc_id = BS_SCH_T_PGA
			}
			CAS_Bass_Pickups = {
				desc_id = Bass_pickup_SD
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_bass_Bridges = {
				desc_id = BS_Sch_Brdg_A
			}
			CAS_Bass_Knobs = {
				desc_id = Knob_Knurl02
			}
			CAS_Bass_Misc = {
				desc_id = None
			}
			CAS_Drums = {
				desc_id = basic
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
						material = CAD_Drums_01_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CADrm/Drumshell_DS_46`
								flags = 32
								Color = grey_5guitar
							}
						]
					}
					{
						base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
						material = CAD_Drums_01_Bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CADrm/GH5_Skin_LD57`
								flags = 4
								Color = red_1
							}
						]
					}
				]
			}
			CAS_Drums_Sticks = {
				desc_id = Drumsticks1
			}
			CAS_Mic = {
				desc_id = Mic_Standard
			}
			CAS_Mic_Stand = {
				desc_id = rock
			}
		}
	}
	{
		name = GH_Rocker_TaylorSwift
		fullname = qs(0x3a7cbe0e)
		allowed_parts = [
			bass
			Drum
			guitar
			vocals
		]
		preset_icon = photo_Eddie
		blurb = qs(0x0d55e394)
		no_random_pick
		locked
		appearance = {
			genre = rock
			CAS_Full_Body = {
				desc_id = TaylorSwift
			}
			CAS_Female_Physique = {
				desc_id = FemalePhysiqueUntouched
			}
			CAS_Guitar_Body = {
				desc_id = GTR142_G6e_Body
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/Taylor/GTR142_G6e_Body`
						material = GTR142_G6e_Body_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/Taylor/GTR142_Bind001`
							}
						]
					}
				]
			}
			CAS_Guitar_Neck = {
				desc_id = CAG_22Fret_Taylor04
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
						material = GTR_Fretboard_04_Primary
						diffuse
						pre_layer = [
							{
								Color = grey_5
								texture = `tex/models/Characters/Layers/CAG/GH5/22_fret_Taylor_dots`
								flags = 36
							}
						]
					}
				]
			}
			CAS_Guitar_Head = {
				desc_id = GTR142_neckhead
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/Taylor/gtr142_neckhead001`
						material = GTR142_NeckHead_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/Taylor/GTR142_Nkhead_DTL009`
								flags = 36
							}
						]
					}
				]
			}
			CAS_Guitar_Pickguards = {
				desc_id = None
			}
			CAS_Guitar_Bridges = {
				desc_id = GTR142_G6e_Bridg
			}
			CAS_Guitar_Knobs = {
				desc_id = GTR142_Knob001
			}
			CAS_Guitar_Pickups = {
				desc_id = GTR26_Dummy
			}
			CAS_Guitar_Misc = {
				desc_id = None
			}
			CAS_Bass_Body = {
				desc_id = Bass17_ESP_EC_01
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\Bass\ESP\bass17_esp_ec_d`
						material = Bass17_ESP_EC_01_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass17_ESP_AX_LD_01`
								Color = yellow_4guitar
							}
							{
								texture = `tex/models/Characters/Layers/CAB/ESP/bass17_ESP_AX_DTL_04`
								flags = 4
								Color = Black_1guitar
							}
						]
					}
				]
			}
			CAS_Bass_Neck = {
				desc_id = Bass_Fretboard_24d
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_04`
						material = Bass_Fretboard_24d_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_24_inlay_05`
								flags = 4
								Color = grey_5guitar
							}
						]
					}
				]
			}
			CAS_Bass_Head = {
				desc_id = Bass14_Neckhead_03
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/ESP/Bass9_Neckhead_D_03`
						material = Bass14_Neckhead_03_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass9_Neckhead3_LD_01`
								flags = 36
								Color = yellow_4guitar
							}
							{
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass9_Neckhead3_DTL_04`
								flags = 36
								Color = Black_1guitar
							}
						]
					}
				]
			}
			CAS_Bass_Pickguards = {
				desc_id = None
			}
			CAS_Bass_Pickups = {
				desc_id = Bass9_Pkup_Type1_Blk_02
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			CAS_bass_Bridges = {
				desc_id = Bass17_Bridge_4str_04
			}
			CAS_Bass_Knobs = {
				desc_id = Bass17_ESP_Knob_10
			}
			CAS_Bass_Misc = {
				desc_id = None
			}
			CAS_Drums = {
				desc_id = basic
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
						material = CAD_Drums_01_Bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CADrm/GH5_Skin_LD42`
								flags = 4
								Color = grey_5guitar
							}
						]
					}
					{
						base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
						material = CAD_Drums_01_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CADrm/Drumshell_DS_04`
								flags = 32
							}
						]
					}
				]
			}
			CAS_Drums_Sticks = {
				desc_id = Drumsticks1
			}
			CAS_Mic = {
				desc_id = Mic_Standard
			}
			CAS_Mic_Stand = {
				desc_id = rock
			}
		}
	}
	{
		name = GH_Rocker_TaylorSwift2
		fullname = qs(0x5f2add08)
		allowed_parts = [
			bass
			Drum
			guitar
			vocals
		]
		preset_icon = photo_Eddie
		blurb = qs(0x3de61082)
		no_random_pick
		selection_not_allowed
		locked
		appearance = {
			genre = rock
			CAS_Full_Body = {
				desc_id = TaylorSwift2
			}
			CAS_Female_Physique = {
				desc_id = FemalePhysiqueUntouched
			}
			CAS_Guitar_Body = {
				desc_id = GTR142_G6e_BodyT
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/Taylor/GTR142_G6e_Body`
						material = GTR142_G6e_Body_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/Taylor/GTR142_Bind001`
							}
						]
					}
				]
			}
			CAS_Guitar_Neck = {
				desc_id = GTR_Fretboard_Taylor_T
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
						material = GTR_Fretboard_Taylor_Primary
						diffuse
						pre_layer = [
							{
								Color = grey_5
								texture = `tex/models/Characters/Layers/CAG/GH5/22_fret_Taylor_dots`
								flags = 36
							}
						]
					}
				]
			}
			CAS_Guitar_Head = {
				desc_id = GTR142T_NeckHead
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/Taylor/gtr142_neckhead001`
						material = GTR142_NeckHead_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/Taylor/GTR142_Nkhead_DTL009`
								flags = 36
							}
						]
					}
				]
			}
			CAS_Guitar_Pickguards = {
				desc_id = None
			}
			CAS_Guitar_Bridges = {
				desc_id = GTR142_G6e_BridgT
			}
			CAS_Guitar_Knobs = {
				desc_id = GTR142_Knob001
			}
			CAS_Guitar_Pickups = {
				desc_id = GTR26_Dummy
			}
			CAS_Guitar_Misc = {
				desc_id = None
			}
			CAS_Bass_Body = {
				desc_id = BAS_IBZ_SR505
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\Bass\Ibanez\bs_ibz_sr_body`
						material = BS_Ibz_SR_Body_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/IBANEZ/BS_IBZ_SR_LD00`
								Color = grey_4guitar
							}
						]
					}
				]
			}
			CAS_Bass_Neck = {
				desc_id = Bass_Fretboard_SR_24d
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_04`
						material = Bass_Fretboard_SR24d_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/Ibanez/Bass_SR24_INLAY002`
								flags = 4
								Color = teal_5
							}
						]
					}
				]
			}
			CAS_Bass_Head = {
				desc_id = BAS_IBZ_SR_Head02
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/Ibanez/bs_ibz_icb_head`
						material = Bass_Neckhead_ICB_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/Ibanez/BS_IBZ_ICB_HD_DTL07`
								flags = 36
								Color = grey_4guitar
							}
							{
								texture = `tex/models/Characters/Layers/CAB/Ibanez/BS_IBZ_ICB_HD_DTL02`
								flags = 36
								Color = Black_1guitar
							}
						]
					}
				]
			}
			CAS_Bass_Pickguards = {
				desc_id = None
			}
			CAS_Bass_Pickups = {
				desc_id = Bass_EMGpickup1
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_bass_Bridges = {
				desc_id = Bas_Brdg_Ibz01
			}
			CAS_Bass_Knobs = {
				desc_id = Bass_Knob_09
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Bass_Misc = {
				desc_id = None
			}
			CAS_Drums = {
				desc_id = basic
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
						material = CAD_Drums_01_Bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CADrm/GH5_Skin_LD42`
								flags = 4
								Color = grey_5guitar
							}
						]
					}
					{
						base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
						material = CAD_Drums_01_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CADrm/Drumshell_DS_04`
								flags = 32
							}
						]
					}
				]
			}
			CAS_Drums_Sticks = {
				desc_id = Drumsticks1
			}
			CAS_Mic = {
				desc_id = Mic_Standard
			}
			CAS_Mic_Stand = {
				desc_id = rock
			}
		}
	}
	{
		name = GH_Rocker_TaylorSwift3
		fullname = qs(0x4631ec49)
		allowed_parts = [
			bass
			Drum
			guitar
			vocals
		]
		preset_icon = photo_Eddie
		blurb = qs(0x855a77e7)
		intro_anims = [
			g_Taylor_win_waving
		]
		win_anims = [
			g_Taylor_win_waving
		]
		lose_anims = [
			G_Taylor_Lose_Depressed
		]
		no_random_pick
		selection_not_allowed
		locked
		appearance = {
			genre = rock
			CAS_Full_Body = {
				desc_id = TaylorSwift3
			}
			CAS_Female_Physique = {
				desc_id = FemalePhysiqueUntouched
			}
			CAS_Guitar_Body = {
				desc_id = GTR142_G6e_Body
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/Taylor/GTR142_G6e_Body`
						material = GTR142_G6e_Body_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/Taylor/GTR142_Bind001`
								Color = yellow_orange_5
							}
						]
					}
				]
			}
			CAS_Guitar_Neck = {
				desc_id = CAG_22Fret_Taylor04
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
						material = GTR_Fretboard_04_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
								flags = 4
								Color = grey_4guitar
							}
						]
					}
				]
			}
			CAS_Guitar_Head = {
				desc_id = GTR142_neckhead
				chosen_materials = {
					material1 = orange_5
				}
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/Taylor/gtr142_neckhead001`
						material = GTR142_NeckHead_Primary
						diffuse
						pre_layer = [
							{
								Color = Black_1guitar
								texture = `tex/models/Characters/Layers/CAG/Taylor/GTR142_Nkhead_DTL007`
								flags = 36
							}
							{
								texture = `tex/models/Characters/Layers/CAG/Taylor/GTR142_Nkhead_DTL010`
								flags = 36
								Color = grey_5guitar
							}
						]
					}
				]
			}
			CAS_Guitar_Pickguards = {
				desc_id = None
			}
			CAS_Guitar_Bridges = {
				desc_id = GTR142_G6e_Bridg
				chosen_materials = {
					material1 = orange_5
				}
			}
			CAS_Guitar_Knobs = {
				desc_id = GTR142_Knob001
			}
			CAS_Guitar_Pickups = {
				desc_id = GTR26_Dummy
			}
			CAS_Guitar_Misc = {
				desc_id = None
			}
			CAS_Bass_Body = {
				desc_id = BAS_IBZ_SR505
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\Bass\Ibanez\bs_ibz_sr_body`
						material = BS_Ibz_SR_Body_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/IBANEZ/BS_IBZ_SR_LD00`
								Color = grey_4guitar
							}
						]
					}
				]
			}
			CAS_Bass_Neck = {
				desc_id = Bass_Fretboard_SR_24d
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_04`
						material = Bass_Fretboard_SR24d_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/Ibanez/Bass_SR24_INLAY002`
								flags = 4
								Color = teal_5
							}
						]
					}
				]
			}
			CAS_Bass_Head = {
				desc_id = BAS_IBZ_SR_Head02
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/Ibanez/bs_ibz_icb_head`
						material = Bass_Neckhead_ICB_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/Ibanez/BS_IBZ_ICB_HD_DTL07`
								flags = 36
								Color = grey_4guitar
							}
							{
								texture = `tex/models/Characters/Layers/CAB/Ibanez/BS_IBZ_ICB_HD_DTL02`
								flags = 36
								Color = Black_1guitar
							}
						]
					}
				]
			}
			CAS_Bass_Pickguards = {
				desc_id = None
			}
			CAS_Bass_Pickups = {
				desc_id = Bass_EMGpickup1
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_bass_Bridges = {
				desc_id = Bas_Brdg_Ibz01
			}
			CAS_Bass_Knobs = {
				desc_id = Bass_Knob_09
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Bass_Misc = {
				desc_id = None
			}
			CAS_Drums = {
				desc_id = basic
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
						material = CAD_Drums_01_Bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CADrm/GH5_Skin_LD42`
								flags = 4
								Color = grey_5guitar
							}
						]
					}
					{
						base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
						material = CAD_Drums_01_Primary
						diffuse
						pre
						_layer = [
							{
								texture = `tex/models/Characters/Layers/CADrm/Drumshell_DS_04`
								flags = 32
							}
						]
					}
				]
			}
			CAS_Drums_Sticks = {
				desc_id = Drumsticks1
			}
			CAS_Mic = {
				desc_id = mic_Cash
			}
			CAS_Mic_Stand = {
				desc_id = Micstand_Cash
			}
		}
	}
	{
		name = GH_Rocker_GwenStefani
		fullname = qs(0x3cdee9de)
		allowed_parts = [
			bass
			Drum
			guitar
			vocals
		]
		preset_icon = photo_Eddie
		blurb = qs(0x7962e47e)
		no_random_pick
		locked
		appearance = {
			genre = rock
			CAS_Full_Body = {
				desc_id = GwenStefani
			}
			CAS_Female_Physique = {
				desc_id = FemalePhysiqueUntouched
			}
			CAS_Guitar_Body = {
				desc_id = GTR33D_BASE
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr33_kh2_wood_d`
						material = GTR33D_Wood_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/ESP/gtr33_solid`
								flags = 4
								Color = grey_5guitar
							}
						]
					}
				]
			}
			CAS_Guitar_Neck = {
				desc_id = CAG_24Fret_ESP04
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
						material = GTR_Fretboard24_04_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
								flags = 36
							}
						]
					}
				]
			}
			CAS_Guitar_Head = {
				desc_id = GTR33D_NekHed
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed`
						material = GTR33D_NeckHead_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/ESP/GTR33_NHead_solid`
								flags = 36
								Color = grey_5guitar
							}
						]
					}
				]
			}
			CAS_Guitar_Pickguards = {
				desc_id = None
			}
			CAS_Guitar_Bridges = {
				desc_id = GTR33_Hardware01Z
			}
			CAS_Guitar_Knobs = {
				desc_id = GTR33_Knobs_KH2
			}
			CAS_Guitar_Pickups = {
				desc_id = GTR33_EMG
			}
			CAS_Guitar_Misc = {
				desc_id = None
			}
			CAS_Bass_Body = {
				desc_id = BAS_IBZ_SR505
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\Bass\Ibanez\bs_ibz_sr_body`
						material = BS_Ibz_SR_Body_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/IBANEZ/BS_IBZ_SR_LD00`
								Color = grey_4guitar
							}
						]
					}
				]
			}
			CAS_Bass_Neck = {
				desc_id = Bass_Fretboard_SR_24d
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_04`
						material = Bass_Fretboard_SR24d_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/Ibanez/Bass_SR24_INLAY002`
								flags = 4
								Color = teal_5
							}
						]
					}
				]
			}
			CAS_Bass_Head = {
				desc_id = BAS_IBZ_SR_Head02
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/Ibanez/bs_ibz_icb_head`
						material = Bass_Neckhead_ICB_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/Ibanez/BS_IBZ_ICB_HD_DTL07`
								flags = 36
								Color = grey_4guitar
							}
							{
								texture = `tex/models/Characters/Layers/CAB/Ibanez/BS_IBZ_ICB_HD_DTL02`
								flags = 36
								Color = Black_1guitar
							}
						]
					}
				]
			}
			CAS_Bass_Pickguards = {
				desc_id = None
			}
			CAS_Bass_Pickups = {
				desc_id = Bass_EMGpickup1
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_bass_Bridges = {
				desc_id = Bas_Brdg_Ibz01
			}
			CAS_Bass_Knobs = {
				desc_id = Bass_Knob_09
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Bass_Misc = {
				desc_id = None
			}
			CAS_Drums = {
				desc_id = basic
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
						material = CAD_Drums_01_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CADrm/Drumshell_DS_04`
								flags = 32
							}
						]
					}
					{
						base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
						material = CAD_Drums_01_Bassdrum
						diffuse
						layers = [
							{
								texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
								x_scale = 111
								flags = 259
								y_scale = 114
							}
						]
					}
				]
			}
			CAS_Drums_Sticks = {
				desc_id = Drumsticks_Adrian
			}
			CAS_Mic = {
				desc_id = Mic_Standard
			}
			CAS_Mic_Stand = {
				desc_id = rock
			}
		}
	}
	{
		name = GH_Rocker_GwenStefani2
		fullname = qs(0x2b1ddae2)
		allowed_parts = [
			bass
			Drum
			guitar
			vocals
		]
		preset_icon = photo_Eddie
		blurb = qs(0x0713ea70)
		no_random_pick
		selection_not_allowed
		locked
		appearance = {
			genre = rock
			CAS_Full_Body = {
				desc_id = GwenStefani2
			}
			CAS_Female_Physique = {
				desc_id = FemalePhysiqueUntouched
			}
			CAS_Guitar_Body = {
				desc_id = GTR33D_BASE
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr33_kh2_wood_d`
						material = GTR33D_Wood_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/ESP/gtr33_solid`
								flags = 4
								Color = grey_5guitar
							}
						]
					}
				]
			}
			CAS_Guitar_Neck = {
				desc_id = CAG_24Fret_ESP04
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
						material = GTR_Fretboard24_04_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
								flags = 36
							}
						]
					}
				]
			}
			CAS_Guitar_Head = {
				desc_id = GTR33D_NekHed
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed`
						material = GTR33D_NeckHead_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/ESP/GTR33_NHead_solid`
								flags = 36
								Color = grey_5guitar
							}
						]
					}
				]
			}
			CAS_Guitar_Pickguards = {
				desc_id = None
			}
			CAS_Guitar_Bridges = {
				desc_id = GTR33_Hardware01Z
			}
			CAS_Guitar_Knobs = {
				desc_id = GTR33_Knobs_KH2
			}
			CAS_Guitar_Pickups = {
				desc_id = GTR33_EMG
			}
			CAS_Guitar_Misc = {
				desc_id = None
			}
			CAS_Bass_Body = {
				desc_id = BAS_SCH_Stil
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\bass\Schecter\bas_sch_stil_bod`
						material = Bass_Stiletto_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch_Stil_DTL01`
								Color = grey_5guitar
							}
						]
					}
				]
			}
			CAS_Bass_Neck = {
				desc_id = Bass_SCH_Fretboard_24d
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_04`
						material = Bass_Fretboard_24d_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch_INL_LD30`
								flags = 4
								Color = grey_5guitar
							}
						]
					}
				]
			}
			CAS_Bass_Head = {
				desc_id = BAS_Neckhead_SCH_STL
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/Schecter/bs_sch_head_stil01`
						material = Bass_Neckhead_Stil01_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch_STL_HD_DTL06`
								flags = 36
								Color = grey_5guitar
							}
						]
					}
				]
			}
			CAS_Bass_Pickguards = {
				desc_id = None
			}
			CAS_Bass_Pickups = {
				desc_id = Bass_pickup_SD
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_bass_Bridges = {
				desc_id = BS_Sch_Brdg_A
			}
			CAS_Bass_Knobs = {
				desc_id = Bass_Knob_01
			}
			CAS_Bass_Misc = {
				desc_id = None
			}
			CAS_Drums = {
				desc_id = basic
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
						material = CAD_Drums_01_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CADrm/Drumshell_DS_04`
								flags = 32
							}
						]
					}
					{
						base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
						material = CAD_Drums_01_Bassdrum
						diffuse
						layers = [
							{
								texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
								x_scale = 111
								flags = 259
								y_scale = 114
							}
						]
					}
				]
			}
			CAS_Drums_Sticks = {
				desc_id = Drumsticks_Adrian
			}
			CAS_Mic = {
				desc_id = Mic_Standard
			}
			CAS_Mic_Stand = {
				desc_id = rock
			}
		}
	}
	{
		name = GH_Rocker_TomDumont
		fullname = qs(0xe7c54951)
		allowed_parts = [
			bass
			Drum
			guitar
			vocals
		]
		preset_icon = photo_Eddie
		blurb = qs(0x65d18445)
		no_random_pick
		locked
		appearance = {
			genre = rock
			CAS_Full_Body = {
				desc_id = TomDumont
			}
			CAS_Male_Physique = {
				desc_id = MalePhysiqueUntouched
			}
			CAS_Guitar_Body = {
				desc_id = GTR73_SCH_S1
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/Schecter/GTR73_SCH_S1_d`
						material = GTR73_SCH_S1_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/Schecter/GTR73_SCH_S1_LD02`
								flags = 4
								Color = grey_5guitar
							}
						]
					}
				]
			}
			CAS_Guitar_Neck = {
				desc_id = CAG_22Fret_Schecter03
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d3_01`
						material = GTR_Fretboard_03_Primary
						diffuse
						pre_layer = [
							{
								Color = grey_5
								texture = `tex/models/Characters/Layers/CAG/GH5/22_fret_LD49_Shctr_Block`
								flags = 36
							}
						]
					}
				]
			}
			CAS_Guitar_Head = {
				desc_id = gtr73_neckhead_04
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/Schecter/gtr74_neckhead_01_d`
						material = gtr73_neckhead_04_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/Schecter/GTR74_Neckhead_01_LD02`
								flags = 36
								Color = grey_5guitar
							}
						]
					}
				]
			}
			CAS_Guitar_Pickguards = {
				desc_id = GTR73_PG1
			}
			CAS_Guitar_Bridges = {
				desc_id = GTR72_Bridge
			}
			CAS_Guitar_Knobs = {
				desc_id = GTR_Knob_01c
			}
			CAS_Guitar_Pickups = {
				desc_id = GTR_Pickup_Type2_PAF1
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			CAS_Guitar_Misc = {
				desc_id = GTR_Misc_Switch4
			}
			CAS_Bass_Body = {
				desc_id = Bass14_ESP_Surveyor
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\Bass\ESP\bass14_esp_surveyor_d`
						material = Bass14_ESP_Surveyor_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass14_ESP_AX_LD_01`
								Color = grey_5guitar
							}
							{
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass14_ESP_AX_DTL_02`
								flags = 4
								Color = Black_1guitar
							}
						]
					}
				]
			}
			CAS_Bass_Neck = {
				desc_id = Bass_Fretboard_24d
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_04`
						material = Bass_Fretboard_24d_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_24_inlay_05`
								flags = 4
								Color = grey_5guitar
							}
						]
					}
				]
			}
			CAS_Bass_Head = {
				desc_id = Bass14_Neckhead_04
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/ESP/bass9_neckhead_d_04`
						material = Bass14_Neckhead_04_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass9_Neckhead4_LD_01`
								flags = 36
								Color = grey_5guitar
							}
							{
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass9_Neckhead4_DTL_02`
								flags = 36
								Color = Black_1guitar
							}
						]
					}
				]
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Bass_Pickguards = {
				desc_id = None
			}
			CAS_Bass_Pickups = {
				desc_id = Bass9_Pkup_Type1_Blk_02
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			CAS_bass_Bridges = {
				desc_id = Bass14_Bridge_4str_01
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Bass_Knobs = {
				desc_id = Bass14_ESP_Knob_10_04
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Bass_Misc = {
				desc_id = None
			}
			CAS_Drums = {
				desc_id = newtamaDouble
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
						material = newtamaDouble_Bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CADrm/bass_skin_DS_15`
								flags = 4
							}
						]
						layers = [
							{
								texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
								y_scale = 113
								flags = 259
								x_scale = 107
							}
						]
					}
				]
			}
			CAS_Drums_Sticks = {
				desc_id = Drumsticks1
			}
			CAS_Mic = {
				desc_id = Mic_Standard
			}
			CAS_Mic_Stand = {
				desc_id = rock
			}
		}
	}
	{
		name = GH_Rocker_TonyKanal
		fullname = qs(0x5cb56267)
		allowed_parts = [
			bass
			Drum
			guitar
			vocals
		]
		preset_icon = photo_Eddie
		blurb = qs(0xdea1af73)
		no_random_pick
		locked
		appearance = {
			genre = rock
			CAS_Full_Body = {
				desc_id = TonyKanal
			}
			CAS_Male_Physique = {
				desc_id = MalePhysiqueUntouched
			}
			CAS_Guitar_Body = {
				desc_id = GTR82_PRS_SE1
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/PRS/prs_82_prs_se1`
						material = GTR82_PRS_SE1_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/PRS/GTR82_PRS_SE1_LD01`
								flags = 4
								Color = grey_5guitar
							}
							{
								texture = `tex/models/Characters/Layers/CAG/PRS/GTR78_PRS_SC_DTL04`
								flags = 4
								Color = Black_1guitar
							}
							{
								texture = `tex/models/Characters/Layers/CAG/PRS/GTR78_PRS_SC_DTL02`
								flags = 4
								Color = Black_1guitar
							}
						]
					}
				]
			}
			CAS_Guitar_Neck = {
				desc_id = CAG_22Fret_PRS04
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
						material = GTR_Fretboard_04_Primary
						diffuse
						pre_layer = [
							{
								Color = grey_4guitar
								texture = `tex/models/Characters/Layers/CAG/PRS/22fret_LD114_PRS_DOTS`
								flags = 36
							}
						]
					}
				]
			}
			CAS_Guitar_Head = {
				desc_id = GTR82_Neckhead01
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/PRS/gtr82_neckhead_01`
						material = GTR82_Neckhead_01_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/PRS/GTR82_Neckhead_01_LD02`
								flags = 36
								Color = grey_5guitar
							}
							{
								texture = `tex/models/Characters/Layers/CAG/PRS/GTR82_Neckhead_01_DTL04`
								flags = 36
								Color = Black_1guitar
							}
							{
								texture = `tex/models/Characters/Layers/CAG/PRS/GTR78_Neckhead_DTL02`
								flags = 36
								Color = Black_1guitar
							}
						]
					}
				]
			}
			CAS_Guitar_Pickguards = {
				desc_id = GTR82_PGuard
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/PRS/PRS_82_PGuard`
						material = GTR82_PGuard_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/PRS/PRS_82_PGuard_DTL01`
								flags = 4
								Color = Black_1guitar
							}
						]
					}
				]
			}
			CAS_Guitar_Bridges = {
				desc_id = GTR81_Bridge01
			}
			CAS_Guitar_Knobs = {
				desc_id = GTR_Knob_Tophat
			}
			CAS_Guitar_Pickups = {
				desc_id = PRS_Pickup_Hbucker
			}
			CAS_Guitar_Misc = {
				desc_id = None
			}
			CAS_Bass_Body = {
				desc_id = Bass110_Tony1
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\bass\nodoubt\Bass110_Tony1_D`
						material = Bass110_Tony1_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/NoDoubt/Bass111_Tony_LD06`
								flags = 4
							}
						]
					}
				]
			}
			CAS_Bass_Neck = {
				desc_id = CAB_22_Tony1
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_05`
						material = Bass_Fretboard_22d_Primary
						diffuse
						pre_layer = [
							{
								Color = grey_5guitar
								texture = `tex/models/Characters/Layers/CAB/nodoubt/Bass_Fretboard_22_LD110`
								flags = 4
							}
						]
					}
				]
			}
			CAS_Bass_Head = {
				desc_id = Bass110_Neckhead
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/nodoubt/Bass110_Neckhead_D`
						material = Bass110_Neckhead_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/NoDoubt/Bass110_Neckhead_LD02`
								flags = 36
							}
							{
								Color = Black_1guitar
								texture = `tex/models/Characters/Layers/CAB/NoDoubt/Bass110_Neckhead_LD03`
								flags = 36
							}
						]
					}
				]
			}
			CAS_Bass_Pickguards = {
				desc_id = bass111_pg
			}
			CAS_Bass_Pickups = {
				desc_id = Bass110_pickup
			}
			CAS_bass_Bridges = {
				desc_id = Bass110_bridge
			}
			CAS_Bass_Knobs = {
				desc_id = Bass_Knob_01
			}
			CAS_Bass_Misc = {
				desc_id = None
			}
			CAS_Drums = {
				desc_id = basic
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
						material = CAD_Drums_01_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CADrm/Drumshell_DS_04`
								flags = 32
							}
						]
					}
					{
						base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
						material = CAD_Drums_01_Bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CADrm/bass_skin_DS_15`
								flags = 4
								Color = Black_1guitar
							}
						]
					}
				]
			}
			CAS_Drums_Sticks = {
				desc_id = Drumsticks1
			}
			CAS_Mic = {
				desc_id = Mic_Standard
			}
			CAS_Mic_Stand = {
				desc_id = rock
			}
		}
	}
	{
		name = GH_Rocker_AdrianYoung
		fullname = qs(0x34c37d34)
		allowed_parts = [
			bass
			Drum
			guitar
			vocals
		]
		preset_icon = photo_Eddie
		blurb = qs(0x5fd78db6)
		no_random_pick
		locked
		appearance = {
			genre = rock
			CAS_Full_Body = {
				desc_id = AdrianYoung
			}
			CAS_Male_Physique = {
				desc_id = MalePhysiqueUntouched
			}
			CAS_Guitar_Body = {
				desc_id = GTR73_SCH_S1
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/Schecter/GTR73_SCH_S1_d`
						material = GTR73_SCH_S1_Primary
						diffuse
						pre_layer = [
							{
								Color = Black_1guitar
								texture = `tex/models/Characters/Layers/CAG/Schecter/GTR73_SCH_S1_LD02`
								flags = 4
							}
							{
								texture = `tex/models/Characters/Layers/CAG/Schecter/GTR73_SCH_S1_DTL01`
								flags = 4
							}
						]
					}
				]
			}
			CAS_Guitar_Neck = {
				desc_id = CAG_24Fret_Schecter04
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
						material = GTR_Fretboard24_04_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
								flags = 36
							}
						]
					}
				]
			}
			CAS_Guitar_Head = {
				desc_id = GTR73_Neckhead_01
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/Schecter/gtr73_neckhead_d`
						material = GTR73_Neckhead_01_Primary
						diffuse
						pre_layer = [
							{
								Color = Black_1guitar
								texture = `tex/models/Characters/Layers/CAG/Schecter/GTR73_neckhead_LD02`
								flags = 36
							}
							{
								texture = `tex/models/Characters/Layers/CAG/All_Clear3`
								flags = 4
							}
							{
								texture = `tex/models/Characters/Layers/CAG/Schecter/GTR73_neckhead_DTL01`
								flags = 36
							}
						]
					}
				]
			}
			CAS_Guitar_Pickguards = {
				desc_id = GTR73_PG1
			}
			CAS_Guitar_Bridges = {
				desc_id = GTR72_Bridge
			}
			CAS_Guitar_Knobs = {
				desc_id = GTR_Knob_01c
			}
			CAS_Guitar_Pickups = {
				desc_id = GTR70_SCH_Ultra_pickup
			}
			CAS_Guitar_Misc = {
				desc_id = GTR_Misc_Switch4
			}
			CAS_Bass_Body = {
				desc_id = BAS_IBZ_SR505
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\Bass\Ibanez\bs_ibz_sr_body`
						material = BS_Ibz_SR_Body_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/IBANEZ/BS_IBZ_SR_LD00`
								Color = Black_1guitar
							}
							{
								texture = `tex/models/Characters/Layers/CAB/IBANEZ/BS_IBZ_SR_DTL02`
								flags = 4
							}
						]
					}
				]
			}
			CAS_Bass_Neck = {
				desc_id = Bass_Fretboard_SR_24d
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_04`
						material = Bass_Fretboard_SR24d_Primary
						diffuse
						pre_layer = [
							{
								Color = grey_4
								texture = `tex/models/Characters/Layers/CAB/Ibanez/Bass_SR24_INLAY001`
								flags = 4
							}
						]
					}
				]
			}
			CAS_Bass_Head = {
				desc_id = BAS_IBZ_SR_Head01
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/Ibanez/bs_ibz_sr_head`
						material = Bass_Neckhead_IBZ_SR_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/Ibanez/BS_IBZ_SR_HD_DTL07`
								flags = 36
								Color = Black_1guitar
							}
						]
					}
				]
			}
			CAS_Bass_Pickguards = {
				desc_id = None
			}
			CAS_Bass_Pickups = {
				desc_id = BAS_IBZ_PKUP002
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			CAS_bass_Bridges = {
				desc_id = Bas_Brdg_Ibz01
			}
			CAS_Bass_Knobs = {
				desc_id = Knob_Knurl02
			}
			CAS_Bass_Misc = {
				desc_id = None
			}
			CAS_Drums = {
				desc_id = newtamaTriple
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
						material = newtamaTriple_Primary1
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CADrm/Drumshell_DS_04`
								flags = 32
							}
						]
					}
					{
						base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
						material = newtamaTriple_Bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CADrm/bass_skin_DS_15`
								flags = 4
								Color = Black_1guitar
							}
						]
					}
				]
			}
			CAS_Drums_Sticks = {
				desc_id = Drumsticks_Adrian
			}
			CAS_Mic = {
				desc_id = Mic_Standard
			}
			CAS_Mic_Stand = {
				desc_id = rock
			}
		}
	}
	{
		name = GH_Rocker_VBot
		fullname = qs(0x24f300ab)
		allowed_parts = [
			bass
			Drum
			guitar
			vocals
		]
		preset_icon = photo_Eddie
		blurb = qs(0x5c7973e8)
		no_random_pick
		locked
		appearance = {
			genre = rock
			CAS_Full_Body = {
				desc_id = Vbot
			}
			CAS_Female_Physique = {
				desc_id = FemalePhysiqueUntouched
			}
			CAS_Guitar_Body = {
				desc_id = GTR81_PRS_MiraMT
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/PRS/prs_81_mt_d`
						material = GTR81_PRS_MT_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/PRS/GTR81_PRS_MT_LD01`
								flags = 4
								Color = teal_5
							}
						]
					}
				]
			}
			CAS_Guitar_Neck = {
				desc_id = CAG_24Fret_PRS04
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
						material = GTR_Fretboard24_04_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/PRS/24fret_LD81_PRS_Dots`
								flags = 36
							}
						]
					}
				]
			}
			CAS_Guitar_Head = {
				desc_id = GTR81_Neckhead01
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/PRS/gtr81_neckhead_01d`
						material = GTR81_Neckhead_01_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/PRS/GTR78_Neckhead_LD02`
								flags = 36
								Color = teal_5
							}
						]
					}
				]
			}
			CAS_Guitar_Pickguards = {
				desc_id = GTR81_PGuard
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/PRS/PRS_81_PGuard`
						material = GTR81_PGuard_Primary
						diffuse
						pre_layer = [
							{
								Color = grey_5
								texture = `tex/models/Characters/Layers/CAG/PRS/PRS_81_PGuard_LD01`
								flags = 4
							}
						]
					}
				]
			}
			CAS_Guitar_Bridges = {
				desc_id = GTR81_Bridge01
			}
			CAS_Guitar_Knobs = {
				desc_id = PRS_Knob_Lampshade
			}
			CAS_Guitar_Pickups = {
				desc_id = GTR_pickup_SD06
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Guitar_Misc = {
				desc_id = GTR_Misc_Switch4
			}
			CAS_Bass_Body = {
				desc_id = BS_SCH_T_Body
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\Bass\Schecter\bs_sch_modelt`
						material = BS_Sch_ModelT_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch_MT_DTL01`
								Color = navy_4
							}
						]
					}
				]
			}
			CAS_Bass_Neck = {
				desc_id = Bass_Fretboard_22b
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_03`
						material = Bass_Fretboard_22b_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_Inlay_06`
								flags = 4
								Color = Black_1guitar
							}
						]
					}
				]
			}
			CAS_Bass_Head = {
				desc_id = BS_SCH_T_NHEAD
			}
			CAS_Bass_Pickguards = {
				desc_id = BS_SCH_T_PGA
			}
			CAS_Bass_Pickups = {
				desc_id = Bass_pickup_SD
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_bass_Bridges = {
				desc_id = BS_Sch_Brdg_A
			}
			CAS_Bass_Knobs = {
				desc_id = Knob_Knurl02
			}
			CAS_Bass_Misc = {
				desc_id = None
			}
			CAS_Drums = {
				desc_id = basic
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
						material = CAD_Drums_01_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CADrm/Drumshell_DS_46`
								flags = 32
								Color = grey_5guitar
							}
						]
					}
					{
						base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
						material = CAD_Drums_01_Bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CADrm/GH5_Skin_LD57`
								flags = 4
								Color = red_1
							}
						]
					}
				]
			}
			CAS_Drums_Sticks = {
				desc_id = Drumsticks1
			}
			CAS_Mic = {
				desc_id = Mic_Standard
			}
			CAS_Mic_Stand = {
				desc_id = rock
			}
		}
	}
	{
		name = GH_Rocker_FrankenRocker
		fullname = qs(0x1d374fc1)
		allowed_parts = [
			bass
			Drum
			guitar
			vocals
		]
		preset_icon = photo_Eddie
		blurb = qs(0x66d06c99)
		no_random_pick
		locked
		appearance = {
			genre = `Heavy	Metal`
			CAS_Full_Body = {
				desc_id = FrankenRocker
			}
			CAS_Male_Physique = {
				desc_id = MalePhysiqueUntouched
			}
			CAS_Guitar_Body = {
				desc_id = GTR22_BC_Rich_Warlock
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/BC_Rich/gtr22_bc_rich_warlock_d`
						material = GTR22_BC_Rich_Warlock_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/BC_Rich/GTR_BC_Rich_Warlock_LD1`
								flags = 4
								Color = purple_blue_1
							}
							{
								texture = `tex/models/Characters/Layers/CAG/BC_Rich/GTR_BC_Rich_Warlock_FD2`
								Color = Black_1guitar
								flags = 4
								a = 80
							}
							{
								texture = `tex/models/Characters/Layers/CAG/All_Clear2`
								flags = 4
							}
						]
					}
				]
			}
			CAS_Guitar_Neck = {
				desc_id = CAG_24Fret_BCRich04
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
						material = GTR_Fretboard24_04_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/BC_Rich/24fret_LD03_BCR_Trance`
								flags = 36
								Color = purple_blue_1
							}
						]
					}
				]
			}
			CAS_Guitar_Head = {
				desc_id = GTR22_Neckhead_Beast3
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/BC_Rich/gtr20_neckhead_beast1_d`
						material = GTR22_Neckhead_Beast3_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/BC_Rich/GTR20_Neckhead_LD02`
								flags = 36
								Color = purple_blue_1
							}
							{
								texture = `tex/models/Characters/Layers/CAG/BC_Rich/GTR20_Neckhead_FAD03`
								Color = Black_1guitar
								flags = 36
								a = 100
							}
						]
					}
				]
			}
			CAS_Guitar_Pickguards = {
				desc_id = None
			}
			CAS_Guitar_Bridges = {
				desc_id = GTR22_Bridge_Whammy1
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			CAS_Guitar_Knobs = {
				desc_id = GTR_Knob_04
			}
			CAS_Guitar_Pickups = {
				desc_id = GTR_pickup_SD06
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Guitar_Misc = {
				desc_id = GTR_Misc_Switch_blk_3
				chosen_materials = {
					material1 = grey_3guitar
				}
			}
			CAS_Bass_Body = {
				desc_id = Bass63_EX
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\Bass\ESP\bass63_ex_d`
						material = Bass63_EX_Primary
						diffuse
						pre_layer = [
							{
								Color = Black_1guitar
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass63_Ex_LD_01`
								flags = 4
							}
							{
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass63_Ex_DTL_12`
								Color = green_1guitar
								flags = 4
								a = 55
							}
						]
					}
				]
			}
			CAS_Bass_Neck = {
				desc_id = Bass_Fretboard_24d
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_04`
						material = Bass_Fretboard_24d_Primary
						diffuse
						pre_layer = [
							{
								Color = grey_4
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_Clear`
								flags = 4
							}
						]
					}
				]
			}
			CAS_Bass_Head = {
				desc_id = Bass63_Neckhead
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/ESP/bass63_neckhead_d`
						material = Bass63_Neckhead_Primary
						diffuse
						pre_layer = [
							{
								Color = Black_1guitar
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass63_Neckhead_LD_01`
								flags = 36
							}
							{
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass63_Neckhead_DTL_01`
								flags = 36
								Color = green_1guitar
							}
						]
					}
				]
			}
			CAS_Bass_Pickguards = {
				desc_id = None
			}
			CAS_Bass_Pickups = {
				desc_id = Bass9_Pkup_Type1_Blk_02
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			CAS_bass_Bridges = {
				desc_id = Bass17_Bridge_4str_05
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			CAS_Bass_Knobs = {
				desc_id = Bass63_Knob_Type1
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			CAS_Bass_Misc = {
				desc_id = None
			}
			CAS_Drums = {
				desc_id = basic
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
						material = CAD_Drums_01_Bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CADrm/GH5_Skin_LD44`
								flags = 4
								Color = grey_3guitar
							}
						]
					}
					{
						base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
						material = CAD_Drums_01_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CADrm/GH5_TamaShell_LD03`
								flags = 32
							}
						]
					}
				]
			}
			CAS_Drums_Sticks = {
				desc_id = Drumsticks1
			}
			CAS_Mic = {
				desc_id = `Black	Metal`
			}
			CAS_Mic_Stand = {
				desc_id = `Chain	Saw`
			}
		}
	}
	{
		name = Skeleton
		fullname = qs(0x998b2c00)
		allowed_parts = [
			Drum
			vocals
			guitar
			bass
		]
		preset_icon = photo_Skeleton
		blurb = qs(0xf1526867)
		polaroid = M_Fun_Skeleton
		locked
		appearance = {
			genre = `Heavy	Metal`
			CAS_Full_Body = {
				desc_id = Skeleton
			}
			CAS_Male_Physique = {
				desc_id = SkeletonPhysique
			}
			CAS_Guitar_Body = {
				desc_id = GTR21_BC_Rich_Warbeast
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/BC_Rich/gtr21_bc_rich_warbeast_d`
						material = GTR21_BC_Rich_Warbeast_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/BC_Rich/GTR_BC_Rich_Warbeast_LD1`
								flags = 4
								Color = grey_5guitar
							}
							{
								Color = Blue_2
								texture = `tex/models/Characters/Layers/CAG/BC_Rich/GTR_BC_Rich_Warbeast_FD4`
								flags = 4
							}
							{
								texture = `tex/models/Characters/Layers/CAG/BC_Rich/GTR_BC_Rich_Warbeast_DTL1`
								flags = 4
								Color = Blue_2
							}
						]
					}
				]
			}
			CAS_Guitar_Neck = {
				desc_id = CAG_24Fret_BCRich04
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
						material = GTR_Fretboard24_04_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/BC_Rich/24fret_LD03_BCR_Trance`
								flags = 36
							}
						]
					}
				]
			}
			CAS_Guitar_Head = {
				desc_id = GTR21_Neckhead_Beast2
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/BC_Rich/gtr20_neckhead_beast1_d`
						material = GTR21_Neckhead_Beast2_Primary
						diffuse
						pre_layer = [
							{
								Color = Black_1guitar
								texture = `tex/models/Characters/Layers/CAG/BC_Rich/GTR20_Neckhead_LD02`
								flags = 36
							}
							{
								texture = `tex/models/Characters/Layers/CAG/BC_Rich/GTR20_Neckhead_LD03`
								flags = 36
								Color = grey_5guitar
							}
							{
								texture = `tex/models/Characters/Layers/CAG/BC_Rich/GTR20_Neckhead_DTL02`
								flags = 36
								Color = Black_1guitar
							}
						]
					}
				]
			}
			CAS_Guitar_Pickguards = {
				desc_id = None
			}
			CAS_Guitar_Bridges = {
				desc_id = GTR22_Bridge_Whammy1
			}
			CAS_Guitar_Knobs = {
				desc_id = GTR_Knob_01
			}
			CAS_Guitar_Pickups = {
				desc_id = GTR_EMG_pickup2
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Guitar_Misc = {
				desc_id = GTR_Misc_Switch
			}
			CAS_Bass_Body = {
				desc_id = Bass63_EX
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\Bass\ESP\bass63_ex_d`
						material = Bass63_EX_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass63_Ex_LD_01`
								flags = 4
								Color = grey_5guitar
							}
							{
								Color = Black_1guitar
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass63_Ex_DTL_11`
								flags = 4
							}
						]
					}
				]
			}
			CAS_Bass_Neck = {
				desc_id = Bass_Fretboard_24d
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_04`
						material = Bass_Fretboard_24d_Primary
						diffuse
						pre_layer = [
							{
								Color = grey_4
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_Clear`
								flags = 4
							}
						]
					}
				]
			}
			CAS_Bass_Head = {
				desc_id = Bass63_Neckhead
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/ESP/bass63_neckhead_d`
						material = Bass63_Neckhead_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass63_Neckhead_LD_01`
								flags = 36
								Color = grey_5guitar
							}
							{
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass63_Neckhead_DTL_06`
								flags = 36
								Color = Black_1guitar
							}
						]
					}
				]
			}
			CAS_Bass_Pickguards = {
				desc_id = None
			}
			CAS_Bass_Pickups = {
				desc_id = Bass9_Pkup_Type1_Blk_02
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			CAS_bass_Bridges = {
				desc_id = Bass17_Bridge_4str_05
			}
			CAS_Bass_Knobs = {
				desc_id = Bass63_Knob_Type1
			}
			CAS_Bass_Misc = {
				desc_id = None
			}
			CAS_Drums = {
				desc_id = newtamaTriple
			}
			CAS_Drums_Sticks = {
				desc_id = Drumsticks1
			}
			CAS_Mic = {
				desc_id = rock
			}
			CAS_Mic_Stand = {
				desc_id = rock
			}
		}
	}
	{
		name = GH_Rocker_Silhouette_Gold
		fullname = qs(0xa9148e1e)
		allowed_parts = [
			bass
			Drum
			guitar
			vocals
		]
		preset_icon = photo_Eddie
		blurb = qs(0xb0cbd961)
		no_random_pick
		locked
		appearance = {
			genre = Goth
			CAS_Full_Body = {
				desc_id = Silhouette_Gold
			}
			CAS_Male_Physique = {
				desc_id = MalePhysiqueUntouched
			}
			CAS_Guitar_Body = {
				desc_id = GTR10_McSwain_Flame
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/McSwain/gtr10_mcswain_flame_d`
						material = GTR10_McSwain_Flame_Primary
						diffuse
						pre_layer = [
							{
								Color = orange_3
								texture = `tex/models/Characters/Layers/CAG/McSwain/GTR10_McSwain_Flame_LD1`
								flags = 4
							}
							{
								texture = `tex/models/Characters/Layers/CAG/McSwain/GTR10_McSwain_Flame_FD2`
								flags = 4
								Color = yellow_1guitar
							}
							{
								texture = `tex/models/Characters/Layers/CAG/McSwain/GTR10_McSwain_Flame_DTL2`
								flags = 4
								Color = yellow_1guitar
							}
						]
					}
				]
			}
			CAS_Guitar_Neck = {
				desc_id = CAG_22Fret_Mcswain04
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
						material = GTR_Fretboard_04_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/GH5/22_fret_LD70_McSwn_Flame`
								flags = 36
								Color = yellow_2guitar
							}
						]
					}
				]
			}
			CAS_Guitar_Head = {
				desc_id = GTR10_Neckhead_McSwain1
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/McSwain/gtr10_neckhead_mcswain1_d`
						material = GTR10_Neckhead_McSwain_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/McSwain/GTR10_Nkhd_McSwain_LD1`
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
			CAS_Guitar_Pickguards = {
				desc_id = None
			}
			CAS_Guitar_Bridges = {
				desc_id = GTR_Bridge_McSwain_6
				chosen_materials = {
					material1 = yellow_2guitar
				}
			}
			CAS_Guitar_Knobs = {
				desc_id = GTR_Knob_01
				chosen_materials = {
					material1 = yellow_3guitar
				}
			}
			CAS_Guitar_Pickups = {
				desc_id = GTR_EMG_pickup2
				chosen_materials = {
					material1 = yellow_1guitar
				}
			}
			CAS_Guitar_Misc = {
				desc_id = GTR_Misc_Switch
				chosen_materials = {
					material1 = yellow_1guitar
				}
			}
			CAS_Bass_Body = {
				desc_id = Bass14_ESP_Surveyor
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\Bass\ESP\bass14_esp_surveyor_d`
						material = Bass14_ESP_Surveyor_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass14_ESP_AX_LD_01`
								Color = yellow_1guitar
							}
							{
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass14_ESP_AX_DTL_03`
								flags = 4
								Color = yellow_4guitar
							}
						]
					}
				]
			}
			CAS_Bass_Neck = {
				desc_id = Bass_Fretboard_22d
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_05`
						material = Bass_Fretboard_22d_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_Inlay_06`
								flags = 4
								Color = yellow_2guitar
							}
						]
					}
				]
			}
			CAS_Bass_Head = {
				desc_id = Bass14_Neckhead_04
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/ESP/bass9_neckhead_d_04`
						material = Bass14_Neckhead_04_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass9_Neckhead4_LD_01`
								flags = 36
								Color = yellow_1guitar
							}
						]
					}
				]
				chosen_materials = {
					material1 = yellow_1guitar
				}
			}
			CAS_Bass_Pickguards = {
				desc_id = None
			}
			CAS_Bass_Pickups = {
				desc_id = Bass9_Pkup_Type3_Blk_2
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			CAS_bass_Bridges = {
				desc_id = Bass14_Bridge_4str_02
				chosen_materials = {
					material1 = yellow_1guitar
				}
			}
			CAS_Bass_Knobs = {
				desc_id = Bass14_knob_04
				chosen_materials = {
					material1 = yellow_1guitar
				}
			}
			CAS_Drums = {
				desc_id = basic
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
						material = CAD_Drums_01_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CADrm/GH5_Shell_LD18`
								flags = 32
								Color = yellow_2guitar
							}
						]
					}
					{
						base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
						material = CAD_Drums_01_Bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CADrm/GH5_Skin_LD59`
								flags = 4
								Color = yellow_2guitar
							}
						]
					}
				]
			}
			CAS_Drums_Sticks = {
				desc_id = Drumsticks_AHEAD
			}
			CAS_Mic = {
				desc_id = Mic_Frequency
			}
			CAS_Mic_Stand = {
				desc_id = Spirals
			}
		}
	}
	{
		name = GH_Rocker_BlackOut
		fullname = qs(0x12b9e0af)
		allowed_parts = [
			bass
			Drum
			guitar
			vocals
		]
		preset_icon = photo_Eddie
		blurb = qs(0x83231623)
		no_random_pick
		locked
		appearance = {
			genre = Goth
			CAS_Full_Body = {
				desc_id = Silhouette_M
			}
			CAS_Male_Physique = {
				desc_id = MalePhysiqueUntouched
			}
			CAS_Guitar_Body = {
				desc_id = GTR75_IBZ_XPT
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR75_IBZ_XPT_d`
						material = GTR75_IBZ_XPT_Primary
						diffuse
						pre_layer = [
							{
								Color = Black_1guitar
								texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR75_IBZ_XPT_LD02`
								flags = 4
							}
						]
					}
				]
			}
			CAS_Guitar_Neck = {
				desc_id = CAG_24Fret_Ibanez04
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
						material = GTR_Fretboard24_04_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/All_Clear2`
								flags = 4
							}
						]
					}
				]
			}
			CAS_Guitar_Head = {
				desc_id = GTR75_Neckhead_01
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR75_Neckhead_d`
						material = GTR75_Neckhead_01_Primary
						diffuse
						pre_layer = [
							{
								Color = Black_1guitar
								texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR75_Neckhead_LD02`
								flags = 36
							}
						]
					}
				]
			}
			CAS_Guitar_Pickguards = {
				desc_id = None
			}
			CAS_Guitar_Bridges = {
				desc_id = GTR75_bridge2
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			CAS_Guitar_Knobs = {
				desc_id = GTR_Knob_01
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Guitar_Pickups = {
				desc_id = GTR78_pickup
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Guitar_Misc = {
				desc_id = GTR_Misc_Switch4
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			CAS_Bass_Body = {
				desc_id = BAS_IBZ_SR505
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\Bass\Ibanez\bs_ibz_sr_body`
						material = BS_Ibz_SR_Body_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/IBANEZ/BS_IBZ_SR_LD00`
								Color = Black_1guitar
							}
						]
					}
				]
			}
			CAS_Bass_Neck = {
				desc_id = Bass_Fretboard_SR_24d
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_04`
						material = Bass_Fretboard_SR24d_Primary
						diffuse
						pre_layer = [
							{
								Color = grey_4
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_Clear`
								flags = 4
							}
						]
					}
				]
			}
			CAS_Bass_Head = {
				desc_id = BAS_IBZ_SR_Head01
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/Ibanez/bs_ibz_sr_head`
						material = Bass_Neckhead_IBZ_SR_Primary
						diffuse
						pre_layer = [
							{
								Color = Black_1guitar
								texture = `tex/models/Characters/Layers/CAB/Ibanez/BS_IBZ_SR_HD_DTL07`
								flags = 36
							}
						]
					}
				]
			}
			CAS_Bass_Pickguards = {
				desc_id = None
			}
			CAS_Bass_Pickups = {
				desc_id = Bass_pickup_SD
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_bass_Bridges = {
				desc_id = Bas_Brdg_Ibz_Mono
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Bass_Knobs = {
				desc_id = Knob_Knurl02
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Bass_Misc = {
				desc_id = None
			}
			CAS_Drums = {
				desc_id = basic
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
						material = CAD_Drums_01_Bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CADrm/bass_skin_DS_15`
								flags = 4
								Color = Black_1guitar
							}
						]
					}
				]
			}
			CAS_Drums_Sticks = {
				desc_id = Drumsticks1
			}
			CAS_Mic = {
				desc_id = `Classic	Rock`
			}
			CAS_Mic_Stand = {
				desc_id = `Classic	Rock`
			}
		}
	}
	{
		name = GH_Rocker_TomDumont_CareerOnly
		fullname = qs(0xe7c54951)
		allowed_parts = [
			bass
			Drum
			guitar
			vocals
		]
		intro_anims = [
			g_NoDoubt_win_waving
		]
		win_anims = [
			g_NoDoubt_win_waving
		]
		lose_anims = [
			G_NoDoubt_Lose_Depressed
		]
		preset_icon = photo_Eddie
		blurb = qs(0x65d18445)
		no_random_pick
		selection_not_allowed
		locked
		appearance = {
			genre = rock
			CAS_Full_Body = {
				desc_id = TomDumont
			}
			CAS_Male_Physique = {
				desc_id = MalePhysiqueUntouched
			}
			CAS_Guitar_Body = {
				desc_id = GTR73_SCH_S1
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/Schecter/GTR73_SCH_S1_d`
						material = GTR73_SCH_S1_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/Schecter/GTR73_SCH_S1_LD02`
								Color = grey_5guitar
								flags = 4
								a = 65
							}
						]
					}
				]
			}
			CAS_Guitar_Neck = {
				desc_id = CAG_22Fret_Schecter03
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d3_01`
						material = GTR_Fretboard_03_Primary
						diffuse
						pre_layer = [
							{
								Color = grey_5
								texture = `tex/models/Characters/Layers/CAG/GH5/22_fret_LD49_Shctr_Block`
								flags = 36
							}
						]
					}
				]
			}
			CAS_Guitar_Head = {
				desc_id = GTR73_Neckhead_05
			}
			CAS_Guitar_Pickguards = {
				desc_id = GTR73_PG1
			}
			CAS_Guitar_Bridges = {
				desc_id = GTR72_Bridge
			}
			CAS_Guitar_Knobs = {
				desc_id = GTR_Knob_01c
			}
			CAS_Guitar_Pickups = {
				desc_id = GTR_Pickup_Type2_PAF1
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			CAS_Guitar_Misc = {
				desc_id = GTR_Misc_Switch4
			}
			CAS_Bass_Body = {
				desc_id = Bass14_ESP_Surveyor
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\Bass\ESP\bass14_esp_surveyor_d`
						material = Bass14_ESP_Surveyor_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass14_ESP_AX_LD_01`
								Color = grey_5guitar
							}
							{
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass14_ESP_AX_DTL_02`
								flags = 4
								Color = Black_1guitar
							}
						]
					}
				]
			}
			CAS_Bass_Neck = {
				desc_id = Bass_Fretboard_24d
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_04`
						material = Bass_Fretboard_24d_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_24_inlay_05`
								flags = 4
								Color = grey_5guitar
							}
						]
					}
				]
			}
			CAS_Bass_Head = {
				desc_id = Bass14_Neckhead_04
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/ESP/bass9_neckhead_d_04`
						material = Bass14_Neckhead_04_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass9_Neckhead4_LD_01`
								flags = 36
								Color = grey_5guitar
							}
							{
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass9_Neckhead4_DTL_02`
								flags = 36
								Color = Black_1guitar
							}
						]
					}
				]
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Bass_Pickguards = {
				desc_id = None
			}
			CAS_Bass_Pickups = {
				desc_id = Bass9_Pkup_Type1_Blk_02
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			CAS_bass_Bridges = {
				desc_id = Bass14_Bridge_4str_01
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Bass_Knobs = {
				desc_id = Bass14_ESP_Knob_10_04
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Bass_Misc = {
				desc_id = None
			}
			CAS_Drums = {
				desc_id = newtamaDouble
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
						material = newtamaDouble_Bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CADrm/bass_skin_DS_15`
								flags = 4
							}
						]
						layers = [
							{
								texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
								y_scale = 113
								flags = 259
								x_scale = 107
							}
						]
					}
				]
			}
			CAS_Drums_Sticks = {
				desc_id = Drumsticks1
			}
			CAS_Mic = {
				desc_id = Mic_Standard
			}
			CAS_Mic_Stand = {
				desc_id = rock
			}
		}
	}
	{
		name = GH_Rocker_TonyKanal_CareerOnly
		fullname = qs(0x5cb56267)
		allowed_parts = [
			bass
			Drum
			guitar
			vocals
		]
		intro_anims = [
			B_NoDoubt_win_waving
		]
		win_anims = [
			B_NoDoubt_win_waving
		]
		lose_anims = [
			B_NoDoubt_Lose_Depressed
		]
		preset_icon = photo_Eddie
		blurb = qs(0xdea1af73)
		no_random_pick
		selection_not_allowed
		locked
		appearance = {
			genre = rock
			CAS_Full_Body = {
				desc_id = TonyKanal
			}
			CAS_Male_Physique = {
				desc_id = MalePhysiqueUntouched
			}
			CAS_Guitar_Body = {
				desc_id = GTR82_PRS_SE1
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/PRS/prs_82_prs_se1`
						material = GTR82_PRS_SE1_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/PRS/GTR82_PRS_SE1_LD01`
								flags = 4
								Color = grey_5guitar
							}
							{
								texture = `tex/models/Characters/Layers/CAG/PRS/GTR78_PRS_SC_DTL04`
								flags = 4
								Color = Black_1guitar
							}
							{
								texture = `tex/models/Characters/Layers/CAG/PRS/GTR78_PRS_SC_DTL02`
								flags = 4
								Color = Black_1guitar
							}
						]
					}
				]
			}
			CAS_Guitar_Neck = {
				desc_id = CAG_22Fret_PRS04
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
						material = GTR_Fretboard_04_Primary
						diffuse
						pre_layer = [
							{
								Color = grey_4guitar
								texture = `tex/models/Characters/Layers/CAG/PRS/22fret_LD114_PRS_DOTS`
								flags = 36
							}
						]
					}
				]
			}
			CAS_Guitar_Head = {
				desc_id = GTR82_Neckhead01
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/PRS/gtr82_neckhead_01`
						material = GTR82_Neckhead_01_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/PRS/GTR82_Neckhead_01_LD02`
								flags = 36
								Color = grey_5guitar
							}
							{
								texture = `tex/models/Characters/Layers/CAG/PRS/GTR82_Neckhead_01_DTL04`
								flags = 36
								Color = Black_1guitar
							}
							{
								texture = `tex/models/Characters/Layers/CAG/PRS/GTR78_Neckhead_DTL02`
								flags = 36
								Color = Black_1guitar
							}
						]
					}
				]
			}
			CAS_Guitar_Pickguards = {
				desc_id = GTR82_PGuard
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/PRS/PRS_82_PGuard`
						material = GTR82_PGuard_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/PRS/PRS_82_PGuard_DTL01`
								flags = 4
								Color = Black_1guitar
							}
						]
					}
				]
			}
			CAS_Guitar_Bridges = {
				desc_id = GTR81_Bridge01
			}
			CAS_Guitar_Knobs = {
				desc_id = GTR_Knob_Tophat
			}
			CAS_Guitar_Pickups = {
				desc_id = PRS_Pickup_Hbucker
			}
			CAS_Guitar_Misc = {
				desc_id = None
			}
			CAS_Bass_Body = {
				desc_id = Bass110_Tony1
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\bass\nodoubt\Bass110_Tony1_D`
						material = Bass110_Tony1_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/NoDoubt/Bass111_Tony_LD06`
								flags = 4
							}
						]
					}
				]
			}
			CAS_Bass_Neck = {
				desc_id = CAB_22_Tony1
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_05`
						material = Bass_Fretboard_22d_Primary
						diffuse
						pre_layer = [
							{
								Color = grey_5guitar
								texture = `tex/models/Characters/Layers/CAB/nodoubt/Bass_Fretboard_22_LD110`
								flags = 4
							}
						]
					}
				]
			}
			CAS_Bass_Head = {
				desc_id = Bass110_Neckhead
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/nodoubt/Bass110_Neckhead_D`
						material = Bass110_Neckhead_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/NoDoubt/Bass110_Neckhead_LD02b`
								flags = 36
							}
							{
								Color = Black_1guitar
								texture = `tex/models/Characters/Layers/CAB/NoDoubt/Bass110_Neckhead_LD03`
								flags = 36
							}
						]
					}
				]
			}
			CAS_Bass_Pickguards = {
				desc_id = bass111_pg
			}
			CAS_Bass_Pickups = {
				desc_id = Bass110_pickup
			}
			CAS_bass_Bridges = {
				desc_id = Bass110_bridge
			}
			CAS_Bass_Knobs = {
				desc_id = Bass_Knob_01
			}
			CAS_Bass_Misc = {
				desc_id = None
			}
			CAS_Drums = {
				desc_id = basic
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
						material = CAD_Drums_01_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CADrm/Drumshell_DS_04`
								flags = 32
							}
						]
					}
					{
						base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
						material = CAD_Drums_01_Bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CADrm/bass_skin_DS_15`
								flags = 4
								Color = Black_1guitar
							}
						]
					}
				]
			}
			CAS_Drums_Sticks = {
				desc_id = Drumsticks1
			}
			CAS_Mic = {
				desc_id = Mic_Standard
			}
			CAS_Mic_Stand = {
				desc_id = rock
			}
		}
	}
	{
		name = GH_Rocker_TomDumont2
		fullname = qs(0xe7c54951)
		allowed_parts = [
			bass
			Drum
			guitar
			vocals
		]
		intro_anims = [
			g_NoDoubt_win_waving
		]
		win_anims = [
			g_NoDoubt_win_waving
		]
		lose_anims = [
			G_NoDoubt_Lose_Depressed
		]
		preset_icon = photo_Eddie
		blurb = qs(0x65d18445)
		no_random_pick
		selection_not_allowed
		locked
		appearance = {
			genre = rock
			CAS_Full_Body = {
				desc_id = TomDumont
			}
			CAS_Male_Physique = {
				desc_id = MalePhysiqueUntouched
			}
			CAS_Guitar_Body = {
				desc_id = GTR73_SCH_S1
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/Schecter/GTR73_SCH_S1_d`
						material = GTR73_SCH_S1_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/Schecter/GTR73_SCH_S1_LD02`
								Color = grey_5guitar
								flags = 4
								a = 65
							}
						]
					}
				]
			}
			CAS_Guitar_Neck = {
				desc_id = CAG_22Fret_Schecter03
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d3_01`
						material = GTR_Fretboard_03_Primary
						diffuse
						pre_layer = [
							{
								Color = grey_5
								texture = `tex/models/Characters/Layers/CAG/GH5/22_fret_LD49_Shctr_Block`
								flags = 36
							}
						]
					}
				]
			}
			CAS_Guitar_Head = {
				desc_id = GTR73_Neckhead_05
			}
			CAS_Guitar_Pickguards = {
				desc_id = GTR73_PG1
			}
			CAS_Guitar_Bridges = {
				desc_id = GTR72_Bridge
			}
			CAS_Guitar_Knobs = {
				desc_id = GTR_Knob_01c
			}
			CAS_Guitar_Pickups = {
				desc_id = GTR_Pickup_Type2_PAF1
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			CAS_Guitar_Misc = {
				desc_id = GTR_Misc_Switch4
			}
			CAS_Bass_Body = {
				desc_id = Bass14_ESP_Surveyor
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\Bass\ESP\bass14_esp_surveyor_d`
						material = Bass14_ESP_Surveyor_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass14_ESP_AX_LD_01`
								Color = grey_5guitar
							}
							{
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass14_ESP_AX_DTL_02`
								flags = 4
								Color = Black_1guitar
							}
						]
					}
				]
			}
			CAS_Bass_Neck = {
				desc_id = Bass_Fretboard_24d
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_04`
						material = Bass_Fretboard_24d_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_24_inlay_05`
								flags = 4
								Color = grey_5guitar
							}
						]
					}
				]
			}
			CAS_Bass_Head = {
				desc_id = Bass14_Neckhead_04
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/ESP/bass9_neckhead_d_04`
						material = Bass14_Neckhead_04_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass9_Neckhead4_LD_01`
								flags = 36
								Color = grey_5guitar
							}
							{
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass9_Neckhead4_DTL_02`
								flags = 36
								Color = Black_1guitar
							}
						]
					}
				]
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Bass_Pickguards = {
				desc_id = None
			}
			CAS_Bass_Pickups = {
				desc_id = Bass9_Pkup_Type1_Blk_02
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			CAS_bass_Bridges = {
				desc_id = Bass14_Bridge_4str_01
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Bass_Knobs = {
				desc_id = Bass14_ESP_Knob_10_04
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Bass_Misc = {
				desc_id = None
			}
			CAS_Drums = {
				desc_id = newtamaDouble
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
						material = newtamaDouble_Bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CADrm/bass_skin_DS_15`
								flags = 4
							}
						]
						layers = [
							{
								texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
								y_scale = 113
								flags = 259
								x_scale = 107
							}
						]
					}
				]
			}
			CAS_Drums_Sticks = {
				desc_id = Drumsticks1
			}
			CAS_Mic = {
				desc_id = Mic_Standard
			}
			CAS_Mic_Stand = {
				desc_id = rock
			}
		}
	}
	{
		name = GH_Rocker_TonyKanal2
		fullname = qs(0x5cb56267)
		allowed_parts = [
			bass
			Drum
			guitar
			vocals
		]
		intro_anims = [
			B_NoDoubt_win_waving
		]
		win_anims = [
			B_NoDoubt_win_waving
		]
		lose_anims = [
			B_NoDoubt_Lose_Depressed
		]
		preset_icon = photo_Eddie
		blurb = qs(0xdea1af73)
		no_random_pick
		selection_not_allowed
		locked
		appearance = {
			genre = rock
			CAS_Full_Body = {
				desc_id = TonyKanal
			}
			CAS_Male_Physique = {
				desc_id = MalePhysiqueUntouched
			}
			CAS_Guitar_Body = {
				desc_id = GTR81_PRS_MiraMT
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/PRS/prs_81_mt_d`
						material = GTR81_PRS_MT_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/PRS/GTR81_PRS_MT_LD01`
								flags = 4
								Color = teal_5
							}
						]
					}
				]
			}
			CAS_Guitar_Neck = {
				desc_id = CAG_24Fret_PRS04
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
						material = GTR_Fretboard24_04_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/PRS/24fret_LD81_PRS_Dots`
								flags = 36
							}
						]
					}
				]
			}
			CAS_Guitar_Head = {
				desc_id = GTR81_Neckhead01
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/PRS/gtr81_neckhead_01d`
						material = GTR81_Neckhead_01_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/PRS/GTR78_Neckhead_LD02`
								flags = 36
								Color = teal_5
							}
						]
					}
				]
			}
			CAS_Guitar_Pickguards = {
				desc_id = GTR81_PGuard
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/PRS/PRS_81_PGuard`
						material = GTR81_PGuard_Primary
						diffuse
						pre_layer = [
							{
								Color = grey_5
								texture = `tex/models/Characters/Layers/CAG/PRS/PRS_81_PGuard_LD01`
								flags = 4
							}
						]
					}
				]
			}
			CAS_Guitar_Bridges = {
				desc_id = GTR81_Bridge01
			}
			CAS_Guitar_Knobs = {
				desc_id = PRS_Knob_Lampshade
			}
			CAS_Guitar_Pickups = {
				desc_id = GTR_pickup_SD06
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Guitar_Misc = {
				desc_id = GTR_Misc_Switch4
			}
			CAS_Bass_Body = {
				desc_id = Bass110_Tony1
			}
			CAS_Bass_Neck = {
				desc_id = CAB_22_Tony1
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_05`
						material = Bass_Fretboard_22d_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/nodoubt/Bass_Fretboard_22_LD110`
								flags = 4
								Color = grey_5guitar
							}
						]
					}
				]
			}
			CAS_Bass_Head = {
				desc_id = Bass110_Neckhead
			}
			CAS_Bass_Pickguards = {
				desc_id = bass110_pg
			}
			CAS_Bass_Pickups = {
				desc_id = Bass110_pickup
			}
			CAS_bass_Bridges = {
				desc_id = Bass110_bridge
			}
			CAS_Bass_Knobs = {
				desc_id = Bass_Knob_01
			}
			CAS_Bass_Misc = {
				desc_id = None
			}
			CAS_Drums = {
				desc_id = basic
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
						material = CAD_Drums_01_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CADrm/Drumshell_DS_46`
								flags = 32
								Color = grey_5guitar
							}
						]
					}
					{
						base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
						material = CAD_Drums_01_Bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CADrm/GH5_Skin_LD57`
								flags = 4
								Color = red_1
							}
						]
					}
				]
			}
			CAS_Drums_Sticks = {
				desc_id = Drumsticks1
			}
			CAS_Mic = {
				desc_id = Mic_Standard
			}
			CAS_Mic_Stand = {
				desc_id = rock
			}
		}
	}
	{
		name = GH_Rocker_AdrianYoung_Drummer
		fullname = qs(0x7e29918f)
		allowed_parts = [
			Drum
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
		preset_icon = photo_Eddie
		blurb = qs(0x5fd78db6)
		no_random_pick
		selection_not_allowed
		locked
		appearance = {
			genre = rock
			CAS_Full_Body = {
				desc_id = AdrianYoung
			}
			CAS_Male_Physique = {
				desc_id = MalePhysiqueUntouched
			}
			CAS_Guitar_Body = {
				desc_id = GTR81_PRS_MiraMT
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/PRS/prs_81_mt_d`
						material = GTR81_PRS_MT_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/PRS/GTR81_PRS_MT_LD01`
								flags = 4
								Color = teal_5
							}
						]
					}
				]
			}
			CAS_Guitar_Neck = {
				desc_id = CAG_24Fret_PRS04
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
						material = GTR_Fretboard24_04_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/PRS/24fret_LD81_PRS_Dots`
								flags = 36
							}
						]
					}
				]
			}
			CAS_Guitar_Head = {
				desc_id = GTR81_Neckhead01
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/PRS/gtr81_neckhead_01d`
						material = GTR81_Neckhead_01_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/PRS/GTR78_Neckhead_LD02`
								flags = 36
								Color = teal_5
							}
						]
					}
				]
			}
			CAS_Guitar_Pickguards = {
				desc_id = GTR81_PGuard
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/PRS/PRS_81_PGuard`
						material = GTR81_PGuard_Primary
						diffuse
						pre_layer = [
							{
								Color = grey_5
								texture = `tex/models/Characters/Layers/CAG/PRS/PRS_81_PGuard_LD01`
								flags = 4
							}
						]
					}
				]
			}
			CAS_Guitar_Bridges = {
				desc_id = GTR81_Bridge01
			}
			CAS_Guitar_Knobs = {
				desc_id = PRS_Knob_Lampshade
			}
			CAS_Guitar_Pickups = {
				desc_id = GTR_pickup_SD06
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Guitar_Misc = {
				desc_id = GTR_Misc_Switch4
			}
			CAS_Bass_Body = {
				desc_id = BS_SCH_T_Body
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\Bass\Schecter\bs_sch_modelt`
						material = BS_Sch_ModelT_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch_MT_DTL01`
								Color = navy_4
							}
						]
					}
				]
			}
			CAS_Bass_Neck = {
				desc_id = Bass_Fretboard_22b
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_03`
						material = Bass_Fretboard_22b_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_Inlay_06`
								flags = 4
								Color = Black_1guitar
							}
						]
					}
				]
			}
			CAS_Bass_Head = {
				desc_id = BS_SCH_T_NHEAD
			}
			CAS_Bass_Pickguards = {
				desc_id = BS_SCH_T_PGA
			}
			CAS_Bass_Pickups = {
				desc_id = Bass_pickup_SD
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_bass_Bridges = {
				desc_id = BS_Sch_Brdg_A
			}
			CAS_Bass_Knobs = {
				desc_id = Knob_Knurl02
			}
			CAS_Bass_Misc = {
				desc_id = None
			}
			CAS_Drums = {
				desc_id = NoDoubt_Drums
			}
			CAS_Drums_Sticks = {
				desc_id = Drumsticks_Adrian
			}
			CAS_Mic = {
				desc_id = Mic_Standard
			}
			CAS_Mic_Stand = {
				desc_id = rock
			}
		}
	}
	{
		name = GH_Rocker_TaylorSwift_Guitarist
		fullname = qs(0xf4cfe004)
		allowed_parts = [
			guitar
		]
		preset_icon = photo_Eddie
		blurb = qs(0xc747b4cc)
		no_random_pick
		selection_not_allowed
		locked
		appearance = {
			body_preset_index = 0
			genre = Pop
			CAS_Body = {
				desc_id = GH4_CAR_Male
				CAP = [
					{
						base_tex = `tex/models/Characters/Global/Global_Blank_Head_dnc`
						material = CAR_Male_Head
						cas_1
						post_layer = [
							{
								texture = `tex/models/Characters/Layers/CAR/Male/Makeup/CAR_Male_EYELINER_01`
								flags = 4
							}
						]
					}
				]
				bones = {
					EyeShape = 0.0
					EyeCornerShape = 0.1
					EyePosition = -0.43
					EyeDistance = -0.3
					MouthScale = 0.176
					EyebrowSize = 0.625
					EyebrowDistance = -0.9
					BrowPosition = 0.2
					EyebrowAngle = 0.3
					ChinWidth = 0.9
					NoseWidth = 0.23300001
					MouthPosition = 0.237
					EyeScale = 0.614
					EyeAngle = 0.5
					FaceFullness = 0.7
				}
			}
			CAS_Male_Physique = {
				desc_id = MalePhysique1
			}
			CAS_Eyes = {
				desc_id = CAR_Brown_Eyes
			}
			CAS_male_Eyebrows = {
				desc_id = CAR_Rounded
			}
			CAS_Male_Hair = {
				desc_id = M_Glam_Hair_Izzy1
				chosen_materials = {
					material1 = carblack_1
				}
			}
			CAS_Male_Hat = {
				desc_id = None
			}
			CAS_Male_Facial_Hair = {
				desc_id = None
			}
			CAS_Male_Torso = {
				desc_id = M_Pop_Torso_Suit
				chosen_materials = {
					material1 = carblack_1
					material4 = red_2
				}
			}
			CAS_Male_Legs = {
				desc_id = M_Mtl_Legs_Axel5
			}
			CAS_Male_Shoes = {
				desc_id = M_Rock_Shoe_JCashChelsea
			}
			CAS_Male_Acc_Left = {
				desc_id = None
			}
			CAS_Male_Acc_Right = {
				desc_id = None
			}
			CAS_Male_Acc_Face = {
				desc_id = None
			}
			CAS_Male_Acc_Ears = {
				desc_id = None
			}
			CAS_Male_Age = {
				desc_id = CAR_Male_Teen
			}
			CAS_Male_Teeth = {
				desc_id = CAR_male_teeth
			}
			CAS_Guitar_Body = {
				desc_id = GTR79_PRS_CSTM24
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/PRS/prs_ctm24_d`
						material = GTR79_PRS_CST24_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/PRS/GTR79_PRS_Ctm24_DTL06`
								flags = 4
								Color = yellow_2guitar
							}
							{
								texture = `tex/models/Characters/Layers/CAG/PRS/GTR79_PRS_Ctm24_LD03`
								flags = 4
								Color = red_1
							}
							{
								texture = `tex/models/Characters/Layers/CAG/PRS/GTR79_PRS_Ctm24_LD01`
								flags = 4
								Color = orange_5
							}
						]
					}
				]
			}
			CAS_Guitar_Neck = {
				desc_id = CAG_24Fret_PRS04
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
						material = GTR_Fretboard24_04_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/PRS/24fret_LD81_PRS_Dots`
								flags = 36
							}
						]
					}
				]
			}
			CAS_Guitar_Head = {
				desc_id = GTR79_Neckhead_01
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/PRS/gtr79_neckhead_01d`
						material = GTR79_Neckhead_01_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/PRS/GTR78_Neckhead_LD04`
								flags = 36
							}
							{
								texture = `tex/models/Characters/Layers/CAG/PRS/GTR78_Neckhead_DTL03`
								flags = 36
								Color = red_1
							}
							{
								texture = `tex/models/Characters/Layers/CAG/PRS/GTR78_Neckhead_DTL01`
								flags = 36
							}
						]
					}
				]
			}
			CAS_Guitar_Pickguards = {
				desc_id = None
			}
			CAS_Guitar_Bridges = {
				desc_id = GTR79_Whammy
			}
			CAS_Guitar_Knobs = {
				desc_id = PRS_Knob_Lampshade
				chosen_materials = {
					material1 = orange_2
				}
			}
			CAS_Guitar_Pickups = {
				desc_id = GTR_Pickup_Type2_PRS
				chosen_materials = {
					material1 = yellow_4guitar
				}
			}
			CAS_Guitar_Misc = {
				desc_id = GTR_Misc_Switch4
			}
			CAS_Bass_Body = {
				desc_id = Bass14_ESP_Surveyor
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\Bass\ESP\bass14_esp_surveyor_d`
						material = Bass14_ESP_Surveyor_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass14_esp_AX_LD_11`
								flags = 4
								Color = orange_3
							}
							{
								Color = red_3
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass14_ESP_AX_DTL_05`
								flags = 4
							}
						]
					}
				]
			}
			CAS_Bass_Neck = {
				desc_id = Bass_Fretboard_22c
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_04`
						material = Bass_Fretboard_22c_Primary
						diffuse
						pre_layer = [
							{
								Color = grey_4
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_Inlay_06`
								flags = 4
							}
						]
					}
				]
			}
			CAS_Bass_Head = {
				desc_id = Bass14_Neckhead_04
			}
			CAS_Bass_Pickguards = {
				desc_id = None
			}
			CAS_Bass_Pickups = {
				desc_id = Bass9_Pkup_Type3_Blk_2
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			CAS_bass_Bridges = {
				desc_id = Bass14_Bridge_4str_01
			}
			CAS_Bass_Knobs = {
				desc_id = Bass14_ESP_Knob_10_04
			}
			CAS_Drums = {
				desc_id = basic
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
						material = CAD_Drums_01_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CADrm/PopShell_09`
								flags = 32
								Color = grey_5guitar
							}
						]
					}
					{
						base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
						material = CAD_Drums_01_Bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CADrm/PopSkin_01`
								flags = 32
							}
						]
					}
				]
			}
			CAS_Drums_Sticks = {
				desc_id = Drumsticks1
			}
			CAS_Mic = {
				desc_id = Pop
			}
			CAS_Mic_Stand = {
				desc_id = Poptastic
			}
		}
	}
	{
		name = GH_Rocker_TaylorSwift_Bassist
		fullname = qs(0x94725ecc)
		allowed_parts = [
			bass
		]
		preset_icon = photo_Eddie
		blurb = qs(0x8864aa53)
		no_random_pick
		selection_not_allowed
		locked
		appearance = {
			body_preset_index = 0
			genre = Pop
			CAS_Body = {
				desc_id = GH4_CAR_Male
				bones = {
					JawProminence = 0.2
					JawShape = 1.0
					ChinProminence = 0.8
					ChinWidth = 0.9
					LowerLipThickness = 1.0
					MouthScale = 0.37600002
					CheekboneProminence = 0.6
					CheekboneDepth = 0.3
					EarSize = 0.4
					EarProminence = 0.226
					NoseNostrilHeight = 0.7
					NoseBridge = 0.3
					NoseTipWidth = 0.167
					NoseSize = 0.5
					UpperLipThickness = 0.5
					EyeShape = 1.0
					EyeDistance = -1.0
					EyePosition = -0.6
					EyeCornerShape = 0.0
					EyeScale = 0.414
					EyebrowAngle = 1.0
					EyebrowSize = 0.0
					BrowDepth = 0.5
					EyebrowDistance = -0.656
					BrowPosition = 0.0
					NoseAngle = 0.2
					NoseWidth = 0.3
				}
			}
			CAS_Male_Physique = {
				desc_id = MalePhysique4
			}
			CAS_Eyes = {
				desc_id = CAR_Hazel_Eyes
			}
			CAS_male_Eyebrows = {
				desc_id = CAR_Default_Brow
			}
			CAS_Male_Hair = {
				desc_id = M_Metl_Hair_Axel5
			}
			CAS_Male_Hat = {
				desc_id = None
			}
			CAS_Male_Facial_Hair = {
				desc_id = M_Rock_Fhair_Stub
			}
			CAS_Male_Torso = {
				desc_id = M_Rock_Torso_JCashVest
				chosen_materials = {
					material3 = blue_5
				}
			}
			CAS_Male_Legs = {
				desc_id = M_Metl_Legs_TooSkinny
			}
			CAS_Male_Shoes = {
				desc_id = M_Spnr_Shoe_ConverseCS
			}
			CAS_Male_Acc_Left = {
				desc_id = Pop_Acc_LQuinBracelet
			}
			CAS_Male_Acc_Right = {
				desc_id = M_Pop_Acc_Rquin3
			}
			CAS_Male_Acc_Face = {
				desc_id = None
			}
			CAS_Male_Acc_Ears = {
				desc_id = None
			}
			CAS_Male_Age = {
				desc_id = CAR_Male_Teen
			}
			CAS_Male_Teeth = {
				desc_id = CAR_male_teeth
			}
			CAS_Guitar_Body = {
				desc_id = gtr93_DR_Siren
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/DaisyRock/gtr93_DR_Siren_d`
						material = gtr93_DR_Siren_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/DaisyRock/gtr93_DR_Siren_LD08`
								flags = 4
							}
						]
					}
				]
			}
			CAS_Guitar_Neck = {
				desc_id = CAG_22Fret_Daisy01
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d_01`
						material = GTR_Fretboard_01_Primary
						diffuse
						pre_layer = [
							{
								Color = grey_5
								texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD121_DR_Ovals`
								flags = 36
							}
						]
					}
				]
			}
			CAS_Guitar_Head = {
				desc_id = GTR93_DR_Neckhead01
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/DaisyRock/gtr93_neckhead01_d`
						material = GTR93_DR_Neckhead01_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/DaisyRock/GTR93_Neckhead01_LD06`
								flags = 36
							}
						]
					}
				]
			}
			CAS_Guitar_Pickguards = {
				desc_id = None
			}
			CAS_Guitar_Bridges = {
				desc_id = GTR_Bridge_01D
			}
			CAS_Guitar_Knobs = {
				desc_id = GTR_Knob_01
			}
			CAS_Guitar_Pickups = {
				desc_id = GTR_Pickup_Type2_PAF1
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Guitar_Misc = {
				desc_id = GTR_Misc_Switch4
			}
			CAS_Bass_Body = {
				desc_id = BAS_IBZ_SR505
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\Bass\Ibanez\bs_ibz_sr_body`
						material = BS_Ibz_SR_Body_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/IBANEZ/BS_IBZ_SR_LD00`
								Color = grey_4guitar
							}
						]
					}
				]
			}
			CAS_Bass_Neck = {
				desc_id = Bass_Fretboard_SR_24d
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_04`
						material = Bass_Fretboard_SR24d_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/Ibanez/Bass_SR24_INLAY002`
								flags = 4
								Color = teal_5
							}
						]
					}
				]
			}
			CAS_Bass_Head = {
				desc_id = BAS_IBZ_SR_Head02
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/Ibanez/bs_ibz_icb_head`
						material = Bass_Neckhead_ICB_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/Ibanez/BS_IBZ_ICB_HD_DTL07`
								flags = 36
								Color = grey_4guitar
							}
							{
								texture = `tex/models/Characters/Layers/CAB/Ibanez/BS_IBZ_ICB_HD_DTL02`
								flags = 36
								Color = Black_1guitar
							}
						]
					}
				]
			}
			CAS_Bass_Pickguards = {
				desc_id = None
			}
			CAS_Bass_Pickups = {
				desc_id = Bass_EMGpickup1
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_bass_Bridges = {
				desc_id = Bas_Brdg_Ibz01
			}
			CAS_Bass_Knobs = {
				desc_id = Bass_Knob_09
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Bass_Misc = {
				desc_id = None
			}
			CAS_Drums = {
				desc_id = basic
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
						material = CAD_Drums_01_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CADrm/PopShell_09`
								flags = 32
								Color = grey_5guitar
							}
						]
					}
					{
						base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
						material = CAD_Drums_01_Bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CADrm/PopSkin_01`
								flags = 32
							}
						]
					}
				]
			}
			CAS_Drums_Sticks = {
				desc_id = Drumsticks1
			}
			CAS_Mic = {
				desc_id = Pop
			}
			CAS_Mic_Stand = {
				desc_id = Poptastic
			}
		}
	}
	{
		name = GH_Rocker_TaylorSwift_Drummer
		fullname = qs(0xcba094fb)
		allowed_parts = [
			Drum
		]
		preset_icon = photo_Eddie
		blurb = qs(0x63d27e1b)
		no_random_pick
		selection_not_allowed
		locked
		appearance = {
			body_preset_index = 0
			genre = Pop
			CAS_Body = {
				desc_id = GH4_CAR_Male
				bones = {
					JawShape = 0.3
					ChinProminence = 0.7
					NoseAngle = 0.067
					NoseWidth = 0.2
					NoseBridge = 0.5
					LowerLipThickness = 0.0
					UpperLipThickness = 0.1
					MouthPosition = 0.2
					EyeScale = 0.314
					EyeDistance = -0.7
					EyeAngle = 0.7
					EyeCornerShape = 0.137
					EyebrowSize = 0.425
					EyebrowDistance = -0.35600004
					BrowPosition = 0.0
					EyebrowAngle = 0.5
					BrowDepth = 0.1
					FaceFullness = 0.3
					MouthScale = 0.576
				}
			}
			CAS_Male_Physique = {
				desc_id = MalePhysique1
			}
			CAS_Eyes = {
				desc_id = CAR_Blue_Eyes
			}
			CAS_male_Eyebrows = {
				desc_id = CAR_Rounded
			}
			CAS_Male_Hair = {
				desc_id = None
			}
			CAS_Male_Hat = {
				desc_id = None
			}
			CAS_Male_Facial_Hair = {
				desc_id = M_Rock_Fhair_Goatee01
				chosen_materials = {
					material1 = yellow_orange_1
				}
			}
			CAS_Male_Torso = {
				desc_id = M_Metl_Torso_Unbttond
			}
			CAS_Male_Legs = {
				desc_id = M_Punk_Legs_Jny_5
			}
			CAS_Male_Shoes = {
				desc_id = M_Spnr_Shoe_ConverseCS
			}
			CAS_Male_Acc_Left = {
				desc_id = M_Punk_Acc_LRings
			}
			CAS_Male_Acc_Right = {
				desc_id = M_Punk_Acc_RRings
			}
			CAS_Male_Acc_Face = {
				desc_id = None
			}
			CAS_Male_Acc_Ears = {
				desc_id = M_Punk_Acc_Ring
			}
			CAS_Male_Age = {
				desc_id = CAR_Male_Mature
			}
			CAS_Male_Teeth = {
				desc_id = CAR_male_teeth
			}
			CAS_Guitar_Body = {
				desc_id = gtr93_DR_Siren
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/DaisyRock/gtr93_DR_Siren_d`
						material = gtr93_DR_Siren_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/DaisyRock/gtr93_DR_Siren_LD08`
								flags = 4
							}
						]
					}
				]
			}
			CAS_Guitar_Neck = {
				desc_id = CAG_22Fret_Daisy01
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d_01`
						material = GTR_Fretboard_01_Primary
						diffuse
						pre_layer = [
							{
								Color = grey_5
								texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD121_DR_Ovals`
								flags = 36
							}
						]
					}
				]
			}
			CAS_Guitar_Head = {
				desc_id = GTR93_DR_Neckhead01
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/DaisyRock/gtr93_neckhead01_d`
						material = GTR93_DR_Neckhead01_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/DaisyRock/GTR93_Neckhead01_LD06`
								flags = 36
							}
						]
					}
				]
			}
			CAS_Guitar_Pickguards = {
				desc_id = None
			}
			CAS_Guitar_Bridges = {
				desc_id = GTR_Bridge_01D
			}
			CAS_Guitar_Knobs = {
				desc_id = GTR_Knob_01
			}
			CAS_Guitar_Pickups = {
				desc_id = GTR_Pickup_Type2_PAF1
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Guitar_Misc = {
				desc_id = GTR_Misc_Switch4
			}
			CAS_Bass_Body = {
				desc_id = Bass14_ESP_Surveyor
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\Bass\ESP\bass14_esp_surveyor_d`
						material = Bass14_ESP_Surveyor_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass14_esp_AX_LD_11`
								flags = 4
								Color = orange_3
							}
							{
								Color = red_3
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass14_ESP_AX_DTL_05`
								flags = 4
							}
						]
					}
				]
			}
			CAS_Bass_Neck = {
				desc_id = Bass_Fretboard_22c
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_04`
						material = Bass_Fretboard_22c_Primary
						diffuse
						pre_layer = [
							{
								Color = grey_4
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_Inlay_06`
								flags = 4
							}
						]
					}
				]
			}
			CAS_Bass_Head = {
				desc_id = Bass14_Neckhead_04
			}
			CAS_Bass_Pickguards = {
				desc_id = None
			}
			CAS_Bass_Pickups = {
				desc_id = Bass9_Pkup_Type3_Blk_2
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			CAS_bass_Bridges = {
				desc_id = Bass14_Bridge_4str_01
			}
			CAS_Bass_Knobs = {
				desc_id = Bass14_ESP_Knob_10_04
			}
			CAS_Drums = {
				desc_id = SingleBassKit_Swift
			}
			CAS_Drums_Sticks = {
				desc_id = Drumsticks1
			}
			CAS_Mic = {
				desc_id = Pop
			}
			CAS_Mic_Stand = {
				desc_id = Poptastic
			}
		}
	}
	{
		name = GH_Rocker_AdamLevine_Guitarist
		fullname = qs(0xe08151c2)
		allowed_parts = [
			guitar
		]
		preset_icon = photo_Eddie
		blurb = qs(0xcd3f49a2)
		no_random_pick
		selection_not_allowed
		locked
		appearance = {
			body_preset_index = 0
			genre = Pop
			CAS_Body = {
				desc_id = GH4_CAR_Male
				bones = {
					NoseWidth = 0.2
					NoseLength = 0.6
					NoseAngle = 0.367
					NoseSize = 0.8
					NoseNostrilSize = 0.7
					NosePosition = 0.77199996
					MouthPosition = 0.3
					MouthDepth = 0.1
					MouthScale = 0.3
					LipShapeUpper = 1.0
					LowerLipThickness = 0.0
					MouthAngle = 0.6
					EyeCornerShape = 0.6
					EyeShape = 0.9
					EyeScale = 0.514
					EyePosition = -0.13
					EyeDistance = -0.414
					EyeAngle = 0.561
					EyebrowSize = 0.0
					EyebrowDistance = -0.556
					BrowPosition = 0.0
					EyebrowAngle = 0.8
					ChinWidth = 0.0
					ChinProminence = 0.4
					ChinHeight = 0.2
					CheekboneProminence = 0.6
					ChinAngle = 0.5
					CheekboneDepth = 0.1
					BrowDepth = 0.0
				}
			}
			CAS_Male_Physique = {
				desc_id = MalePhysique1
			}
			CAS_Eyes = {
				desc_id = CAR_Green_Eyes
			}
			CAS_male_Eyebrows = {
				desc_id = CAR_Default_Brow
			}
			CAS_Male_Hair = {
				desc_id = M_Metl_Hair_Lars
				chosen_materials = {
					material1 = carblack_1
				}
			}
			CAS_Male_Hat = {
				desc_id = None
			}
			CAS_Male_Facial_Hair = {
				desc_id = None
			}
			CAS_Male_Torso = {
				desc_id = M_Metl_Torso_Unbttond
				chosen_materials = {
					material1 = blue_3
				}
			}
			CAS_Male_Legs = {
				desc_id = M_Metl_Legs_TooSkinny
			}
			CAS_Male_Shoes = {
				desc_id = M_Spnr_Shoe_ConverseCS
			}
			CAS_Male_Acc_Left = {
				desc_id = M_Rock_Acc_LWatch
			}
			CAS_Male_Acc_Right = {
				desc_id = M_Rock_Acc_RStrap
			}
			CAS_Male_Acc_Face = {
				desc_id = None
			}
			CAS_Male_Acc_Ears = {
				desc_id = None
			}
			CAS_Male_Age = {
				desc_id = CAR_Male_Teen
			}
			CAS_Male_Teeth = {
				desc_id = CAR_male_teeth
			}
			CAS_Guitar_Body = {
				desc_id = GTR37_ESP_RW
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr37_rw_d`
						material = GTR37_RW_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/ESP/GTR37_RW_Paint`
								flags = 4
								Color = yellow_orange_3
							}
						]
					}
				]
			}
			CAS_Guitar_Neck = {
				desc_id = CAG_22Fret_ESP01
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d_01`
						material = GTR_Fretboard_01_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
								flags = 36
								Color = Black_1guitar
							}
						]
					}
				]
			}
			CAS_Guitar_Head = {
				desc_id = GTR37_Neckhead
			}
			CAS_Guitar_Pickguards = {
				desc_id = GTR37_PGuard01
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr37_pguard01_d`
						material = GTR37_PGuard_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/ESP/gtr37_PGuard01_DTL01`
								flags = 4
							}
						]
					}
				]
			}
			CAS_Guitar_Bridges = {
				desc_id = GTR37_Bridge
			}
			CAS_Guitar_Knobs = {
				desc_id = GTR37_Knobs01
			}
			CAS_Guitar_Pickups = {
				desc_id = GTR37_Pickup_F
			}
			CAS_Guitar_Misc = {
				desc_id = None
			}
			CAS_Bass_Body = {
				desc_id = Bass14_ESP_Surveyor
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\Bass\ESP\bass14_esp_surveyor_d`
						material = Bass14_ESP_Surveyor_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass14_esp_AX_LD_11`
								flags = 4
								Color = orange_3
							}
							{
								Color = red_3
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass14_ESP_AX_DTL_05`
								flags = 4
							}
						]
					}
				]
			}
			CAS_Bass_Neck = {
				desc_id = Bass_Fretboard_22c
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_04`
						material = Bass_Fretboard_22c_Primary
						diffuse
						pre_layer = [
							{
								Color = grey_4
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_Inlay_06`
								flags = 4
							}
						]
					}
				]
			}
			CAS_Bass_Head = {
				desc_id = Bass14_Neckhead_04
			}
			CAS_Bass_Pickguards = {
				desc_id = None
			}
			CAS_Bass_Pickups = {
				desc_id = Bass9_Pkup_Type3_Blk_2
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			CAS_bass_Bridges = {
				desc_id = Bass14_Bridge_4str_01
			}
			CAS_Bass_Knobs = {
				desc_id = Bass14_ESP_Knob_10_04
			}
			CAS_Drums = {
				desc_id = basic
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
						material = CAD_Drums_01_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CADrm/PopShell_09`
								flags = 32
								Color = grey_5guitar
							}
						]
					}
					{
						base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
						material = CAD_Drums_01_Bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CADrm/PopSkin_01`
								flags = 32
							}
						]
					}
				]
			}
			CAS_Drums_Sticks = {
				desc_id = Drumsticks1
			}
			CAS_Mic = {
				desc_id = Pop
			}
			CAS_Mic_Stand = {
				desc_id = Poptastic
			}
		}
	}
	{
		name = GH_Rocker_AdamLevine_Bassist
		fullname = qs(0x0a3206ae)
		allowed_parts = [
			bass
		]
		preset_icon = photo_Eddie
		blurb = qs(0x2dfc522b)
		no_random_pick
		selection_not_allowed
		locked
		appearance = {
			body_preset_index = 0
			genre = Pop
			CAS_Body = {
				desc_id = GH4_CAR_Male
				chosen_materials = {
					skin = skin_asian3
				}
				bones = {
					NoseWidth = 0.2
					NoseLength = 0.6
					NoseNostrilSize = 0.7
					EyeCornerShape = 0.6
					EyeShape = 0.9
					EyebrowSize = 0.0
					EyebrowDistance = -0.556
					BrowPosition = 0.0
					ChinWidth = 0.0
					ChinProminence = 0.4
					ChinHeight = 0.2
					CheekboneProminence = 0.6
					ChinAngle = 0.5
					CheekboneDepth = 0.1
					BrowDepth = 0.0
					EyeAngle = 0.461
					EyeDistance = 0.186
					EyeScale = 0.7
					NoseSize = 0.6
					NoseBridge = 0.6
					NoseTipLength = 0.167
					NoseTipAngle = 0.6
					NoseAngle = 0.467
					LipShapeUpper = 0.0
					MouthPosition = 0.6
					MouthScale = 0.3
					JawProminence = 0.9
					EarSize = 0.333
					EarProminence = 0.32600003
					EyebrowAngle = 0.4
					MouthAngle = 0.6
					LowerLipThickness = 0.5
					MouthDepth = 0.4
					EyePosition = -0.8
					NosePosition = 1.0
				}
			}
			CAS_Male_Physique = {
				desc_id = MalePhysique1
			}
			CAS_Eyes = {
				desc_id = CAR_Blue_Eyes
			}
			CAS_male_Eyebrows = {
				desc_id = CAR_Default_Brow
			}
			CAS_Male_Hair = {
				desc_id = M_Punk_Hair_Jny_5
				chosen_materials = {
					material1 = yellow_orange_1
				}
			}
			CAS_Male_Hat = {
				desc_id = None
			}
			CAS_Male_Facial_Hair = {
				desc_id = None
			}
			CAS_Male_Torso = {
				desc_id = M_Torso_TShirt
				chosen_materials = {
					material1 = grey_3guitar
				}
			}
			CAS_Male_Legs = {
				desc_id = M_Rock_Legs_Jeans
				chosen_materials = {
					material1 = grey_4
				}
			}
			CAS_Male_Shoes = {
				desc_id = M_Metl_Shoe_ClscRunr
				chosen_materials = {
					material1 = carblack_3
				}
			}
			CAS_Male_Acc_Left = {
				desc_id = M_Rock_Acc_LWatch
			}
			CAS_Male_Acc_Right = {
				desc_id = M_Rock_Acc_RStripe
			}
			CAS_Male_Acc_Face = {
				desc_id = None
			}
			CAS_Male_Acc_Ears = {
				desc_id = None
			}
			CAS_Male_Age = {
				desc_id = CAR_Male_Teen
			}
			CAS_Male_Teeth = {
				desc_id = CAR_male_teeth
			}
			CAS_Guitar_Body = {
				desc_id = gtr93_DR_Siren
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/DaisyRock/gtr93_DR_Siren_d`
						material = gtr93_DR_Siren_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/DaisyRock/gtr93_DR_Siren_LD08`
								flags = 4
							}
						]
					}
				]
			}
			CAS_Guitar_Neck = {
				desc_id = CAG_22Fret_Daisy01
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d_01`
						material = GTR_Fretboard_01_Primary
						diffuse
						pre_layer = [
							{
								Color = grey_5
								texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD121_DR_Ovals`
								flags = 36
							}
						]
					}
				]
			}
			CAS_Guitar_Head = {
				desc_id = GTR93_DR_Neckhead01
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/DaisyRock/gtr93_neckhead01_d`
						material = GTR93_DR_Neckhead01_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/DaisyRock/GTR93_Neckhead01_LD06`
								flags = 36
							}
						]
					}
				]
			}
			CAS_Guitar_Pickguards = {
				desc_id = None
			}
			CAS_Guitar_Bridges = {
				desc_id = GTR_Bridge_01D
			}
			CAS_Guitar_Knobs = {
				desc_id = GTR_Knob_01
			}
			CAS_Guitar_Pickups = {
				desc_id = GTR_Pickup_Type2_PAF1
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Guitar_Misc = {
				desc_id = GTR_Misc_Switch4
			}
			CAS_Bass_Body = {
				desc_id = Bass14_ESP_Surveyor
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\Bass\ESP\bass14_esp_surveyor_d`
						material = Bass14_ESP_Surveyor_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass14_esp_AX_LD_11`
								flags = 4
								Color = orange_3
							}
							{
								Color = red_3
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass14_ESP_AX_DTL_05`
								flags = 4
							}
						]
					}
				]
			}
			CAS_Bass_Neck = {
				desc_id = Bass_Fretboard_22c
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_04`
						material = Bass_Fretboard_22c_Primary
						diffuse
						pre_layer = [
							{
								Color = grey_4
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_Inlay_06`
								flags = 4
							}
						]
					}
				]
			}
			CAS_Bass_Head = {
				desc_id = Bass14_Neckhead_04
			}
			CAS_Bass_Pickguards = {
				desc_id = None
			}
			CAS_Bass_Pickups = {
				desc_id = Bass9_Pkup_Type3_Blk_2
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			CAS_bass_Bridges = {
				desc_id = Bass14_Bridge_4str_01
			}
			CAS_Bass_Knobs = {
				desc_id = Bass14_ESP_Knob_10_04
			}
			CAS_Drums = {
				desc_id = basic
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
						material = CAD_Drums_01_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CADrm/PopShell_09`
								flags = 32
								Color = grey_5guitar
							}
						]
					}
					{
						base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
						material = CAD_Drums_01_Bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CADrm/PopSkin_01`
								flags = 32
							}
						]
					}
				]
			}
			CAS_Drums_Sticks = {
				desc_id = Drumsticks1
			}
			CAS_Mic = {
				desc_id = Pop
			}
			CAS_Mic_Stand = {
				desc_id = Poptastic
			}
		}
	}
	{
		name = GH_Rocker_AdamLevine_Drummer
		fullname = qs(0x55e0cc99)
		allowed_parts = [
			Drum
		]
		preset_icon = photo_Eddie
		blurb = qs(0xc64a8663)
		no_random_pick
		selection_not_allowed
		locked
		appearance = {
			body_preset_index = 0
			genre = Pop
			CAS_Body = {
				desc_id = GH4_CAR_Male
				CAP = [
					{
						base_tex = `tex/models/Characters/Global/Global_Blank_Head_dnc`
						material = CAR_Male_Head
						cas_1
						post_layer = [
							{
								texture = `tex/models/Characters/Layers/CAR/Male/Makeup/CAR_Male_EYELINER_01`
								flags = 4
							}
						]
					}
				]
				bones = {
					NoseWidth = 0.2
					NoseLength = 0.6
					NoseNostrilSize = 0.7
					EyeCornerShape = 0.6
					EyebrowSize = 0.0
					EyebrowDistance = -0.556
					BrowPosition = 0.0
					ChinWidth = 0.0
					ChinHeight = 0.2
					CheekboneProminence = 0.6
					ChinAngle = 0.5
					CheekboneDepth = 0.1
					BrowDepth = 0.0
					EyeDistance = 0.186
					NoseTipLength = 0.167
					NoseTipAngle = 0.6
					NoseAngle = 0.467
					LipShapeUpper = 0.0
					EarSize = 0.333
					EyebrowAngle = 0.4
					MouthAngle = 0.6
					LowerLipThickness = 0.5
					MouthDepth = 0.4
					EyeScale = 0.5
					EyeShape = 0.0
					EyeAngle = 0.661
					EyePosition = 0.0
					NoseSize = 0.4
					NoseBridge = 0.0
					NosePosition = 0.3
					MouthPosition = 0.0
					MouthScale = 0.5
					JawProminence = 0.0
					ChinProminence = 0.9
					EarProminence = 0.126
				}
				chosen_materials = {
					Eyebrows = yellow_4
					skin = skin_asian4
				}
			}
			CAS_Male_Physique = {
				desc_id = MalePhysique1
			}
			CAS_Eyes = {
				desc_id = CAR_Hazel_Eyes
			}
			CAS_male_Eyebrows = {
				desc_id = CAR_Rounded
			}
			CAS_Male_Hair = {
				desc_id = M_Metl_Hair_Axel5
				chosen_materials = {
					material1 = yellow_3
				}
			}
			CAS_Male_Hat = {
				desc_id = None
			}
			CAS_Male_Facial_Hair = {
				desc_id = None
			}
			CAS_Male_Torso = {
				desc_id = M_Torso_LayeredNoStripe
				chosen_materials = {
					material1 = yellow_green_2
					material2 = grey_1
				}
			}
			CAS_Male_Legs = {
				desc_id = M_Pop_Legs_Jeans
				chosen_materials = {
					material1 = carblack_3
				}
			}
			CAS_Male_Shoes = {
				desc_id = M_Spnr_Shoe_VansH_BW
			}
			CAS_Male_Acc_Left = {
				desc_id = Pop_Acc_LQuinBracelet
			}
			CAS_Male_Acc_Right = {
				desc_id = M_Rock_Acc_RStrap
			}
			CAS_Male_Acc_Face = {
				desc_id = None
			}
			CAS_Male_Acc_Ears = {
				desc_id = None
			}
			CAS_Male_Age = {
				desc_id = CAR_Male_Teen
			}
			CAS_Male_Teeth = {
				desc_id = CAR_male_teeth
			}
			CAS_Guitar_Body = {
				desc_id = gtr93_DR_Siren
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/DaisyRock/gtr93_DR_Siren_d`
						material = gtr93_DR_Siren_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/DaisyRock/gtr93_DR_Siren_LD08`
								flags = 4
							}
						]
					}
				]
			}
			CAS_Guitar_Neck = {
				desc_id = CAG_22Fret_Daisy01
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d_01`
						material = GTR_Fretboard_01_Primary
						diffuse
						pre_layer = [
							{
								Color = grey_5
								texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD121_DR_Ovals`
								flags = 36
							}
						]
					}
				]
			}
			CAS_Guitar_Head = {
				desc_id = GTR93_DR_Neckhead01
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/DaisyRock/gtr93_neckhead01_d`
						material = GTR93_DR_Neckhead01_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/DaisyRock/GTR93_Neckhead01_LD06`
								flags = 36
							}
						]
					}
				]
			}
			CAS_Guitar_Pickguards = {
				desc_id = None
			}
			CAS_Guitar_Bridges = {
				desc_id = GTR_Bridge_01D
			}
			CAS_Guitar_Knobs = {
				desc_id = GTR_Knob_01
			}
			CAS_Guitar_Pickups = {
				desc_id = GTR_Pickup_Type2_PAF1
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Guitar_Misc = {
				desc_id = GTR_Misc_Switch4
			}
			CAS_Bass_Body = {
				desc_id = Bass14_ESP_Surveyor
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\Bass\ESP\bass14_esp_surveyor_d`
						material = Bass14_ESP_Surveyor_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass14_esp_AX_LD_11`
								flags = 4
								Color = orange_3
							}
							{
								Color = red_3
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass14_ESP_AX_DTL_05`
								flags = 4
							}
						]
					}
				]
			}
			CAS_Bass_Neck = {
				desc_id = Bass_Fretboard_22c
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_04`
						material = Bass_Fretboard_22c_Primary
						diffuse
						pre_layer = [
							{
								Color = grey_4
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_Inlay_06`
								flags = 4
							}
						]
					}
				]
			}
			CAS_Bass_Head = {
				desc_id = Bass14_Neckhead_04
			}
			CAS_Bass_Pickguards = {
				desc_id = None
			}
			CAS_Bass_Pickups = {
				desc_id = Bass9_Pkup_Type3_Blk_2
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			CAS_bass_Bridges = {
				desc_id = Bass14_Bridge_4str_01
			}
			CAS_Bass_Knobs = {
				desc_id = Bass14_ESP_Knob_10_04
			}
			CAS_Drums = {
				desc_id = basic
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
						material = CAD_Drums_01_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CADrm/GH5_TamaShell_LD03`
								flags = 32
							}
						]
					}
					{
						base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
						material = CAD_Drums_01_Bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CADrm/bass_skin_DS_15`
								flags = 4
								Color = Black_1guitar
							}
						]
					}
				]
			}
			CAS_Drums_Sticks = {
				desc_id = Drumsticks1
			}
			CAS_Mic = {
				desc_id = Pop
			}
			CAS_Mic_Stand = {
				desc_id = Poptastic
			}
		}
	}
	{
		name = Silhouette
		allowed_parts = [
			Drum
			vocals
			guitar
			bass
		]
		selection_not_allowed
		appearance = {
			CAS_Full_Body = {
				desc_id = Silhouette_M
			}
		}
	}
	{
		name = EmptyGuy
		allowed_parts = [
			Drum
			vocals
			guitar
			bass
		]
		selection_not_allowed
		appearance = $empty_appearance
	}
]
Preset_Musician_Profiles_Debug = [
	{
		name = WorstFemaleCharacter
		allowed_parts = [
			Drum
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
		name = WorstMaleCharacter
		allowed_parts = [
			Drum
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
		name = Bloke
		fullname = qs(0x06d716ff)
		allowed_parts = [
			Drum
			vocals
			guitar
			bass
		]
		preset_icon = photo_Skeleton
		blurb = qs(0x03ac90f0)
		appearance = {
			genre = `Classic	Rock`
			CAS_Body = {
				desc_id = GH4_CAR_Male
			}
			CAS_Male_Physique = {
				desc_id = MalePhysique1
			}
			CAS_Eyes = {
				desc_id = CAR_Blue_Eyes
			}
			CAS_male_Eyebrows = {
				desc_id = CAR_Default_Brow
			}
			CAS_Male_Hair = {
				desc_id = M_Clsc_Hair_George
				chosen_materials = {
					material1 = yellow_2
				}
			}
			CAS_Male_Hat = {
				desc_id = None
			}
			CAS_Male_Facial_Hair = {
				desc_id = None
			}
			CAS_Male_Torso = {
				desc_id = M_Clsc_Torso_scarf
			}
			CAS_Male_Legs = {
				desc_id = M_Clsc_Legs_Ltjeans
			}
			CAS_Male_Shoes = {
				desc_id = M_Flipflops
			}
			CAS_Male_Acc_Left = {
				desc_id = M_Clsc_Acc_L3Rings
			}
			CAS_Male_Acc_Right = {
				desc_id = None
			}
			CAS_Male_Acc_Face = {
				desc_id = None
			}
			CAS_Male_Acc_Ears = {
				desc_id = None
			}
			CAS_Male_Age = {
				desc_id = CAR_Male_Teen
			}
			CAS_Male_Teeth = {
				desc_id = CAR_male_teeth
			}
			CAS_Guitar_Body = {
				desc_id = GTR4_ESP_Eclipse_01
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr4_esp_eclipse_d_01`
						material = GTR4_ESP_Eclipse_01_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/ESP/gtr4_esp_eclipse_LD_01`
								flags = 4
							}
							{
								texture = `tex/models/Characters/Layers/CAG/ESP/GTR4_ESP_Eclipse_DTL_05`
								flags = 4
								Color = yellow_green_3guitar
							}
						]
					}
				]
			}
			CAS_Guitar_Neck = {
				desc_id = GTR_Fretboard_01
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d_01`
						material = GTR_Fretboard_01_Primary
						diffuse
						pre_layer = [
							{
								Color = grey_5
								texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD93_ESP_Patriot`
								flags = 36
							}
						]
					}
				]
			}
			CAS_Guitar_Head = {
				desc_id = GTR4_Neckhead_01
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01`
						material = GTR4_Neckhead_01_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/ESP/GTR4_Neckhead_LD_02`
								flags = 36
							}
							{
								texture = `tex/models/Characters/Layers/CAG/ESP/GTR4_Neckhead_DTL_06`
								flags = 36
								Color = yellow_green_3guitar
							}
						]
					}
				]
			}
			CAS_Guitar_Pickguards = {
				desc_id = None
			}
			CAS_Guitar_Bridges = {
				desc_id = GTR4_ESP_Bridge_02
			}
			CAS_Guitar_Knobs = {
				desc_id = GTR4_ESP_Knob_10_03
			}
			CAS_Guitar_Pickups = {
				desc_id = GTR_Pkup_Type1_Blk_2
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			CAS_Bass_Body = {
				desc_id = Bass14_ESP_Surveyor
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\Bass\ESP\bass14_esp_surveyor_d`
						material = Bass14_ESP_Surveyor_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass14_ESP_AX_LD_01`
								flags = 4
							}
							{
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass14_ESP_AX_DTL_13`
								flags = 4
							}
						]
					}
				]
			}
			CAS_Bass_Neck = {
				desc_id = Bass_Fretboard_22b
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_03`
						material = Bass_Fretboard_22b_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_Inlay_01`
								flags = 4
								Color = Black_1guitar
							}
						]
					}
				]
			}
			CAS_Bass_Head = {
				desc_id = Bass14_Neckhead_02
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/ESP/bass9_neckhead_d_02`
						material = Bass14_Neckhead_02_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass9_Neckhead2_LD_11`
								flags = 36
							}
						]
					}
				]
			}
			CAS_Bass_Pickguards = {
				desc_id = None
			}
			CAS_Bass_Pickups = {
				desc_id = Bass9_Pkup_Type3_Blk_2
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			CAS_bass_Bridges = {
				desc_id = Bass14_Bridge_4str_02
			}
			CAS_Bass_Knobs = {
				desc_id = Bass14_knob_05
			}
			CAS_Drums = {
				desc_id = basic
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
						material = CAD_Drums_01_Bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CADrm/bass_skin_DS_48`
								flags = 4
								Color = yellow_3guitar
							}
						]
					}
					{
						base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
						material = CAD_Drums_01_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CADrm/Drumshell_DS_05`
								flags = 32
							}
						]
					}
				]
			}
			CAS_Drums_Sticks = {
				desc_id = Drumsticks1
			}
			CAS_Mic = {
				desc_id = Goth
			}
			CAS_Mic_Stand = {
				desc_id = Goth
			}
		}
	}
	{
		name = drummerBloke
		fullname = qs(0xdde2fb65)
		allowed_parts = [
			Drum
			vocals
			guitar
			bass
		]
		preset_icon = photo_Skeleton
		blurb = qs(0x03ac90f0)
		appearance = {
			genre = `Classic	Rock`
			CAS_Body = {
				desc_id = GH4_CAR_Male
			}
			CAS_Male_Physique = {
				desc_id = MalePhysique1
			}
			CAS_Eyes = {
				desc_id = CAR_Blue_Eyes
			}
			CAS_male_Eyebrows = {
				desc_id = CAR_Default_Brow
			}
			CAS_Male_Hair = {
				desc_id = M_Clsc_Hair_George
				chosen_materials = {
					material1 = yellow_2
				}
			}
			CAS_Male_Hat = {
				desc_id = None
			}
			CAS_Male_Facial_Hair = {
				desc_id = None
			}
			CAS_Male_Torso = {
				desc_id = M_Clsc_Torso_scarf
			}
			CAS_Male_Legs = {
				desc_id = M_Clsc_Legs_Ltjeans
			}
			CAS_Male_Shoes = {
				desc_id = M_Flipflops
			}
			CAS_Male_Acc_Left = {
				desc_id = M_Clsc_Acc_L3Rings
			}
			CAS_Male_Acc_Right = {
				desc_id = None
			}
			CAS_Male_Acc_Face = {
				desc_id = None
			}
			CAS_Male_Acc_Ears = {
				desc_id = None
			}
			CAS_Male_Age = {
				desc_id = CAR_Male_Teen
			}
			CAS_Male_Teeth = {
				desc_id = CAR_male_teeth
			}
			CAS_Guitar_Body = {
				desc_id = GTR4_ESP_Eclipse_01
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr4_esp_eclipse_d_01`
						material = GTR4_ESP_Eclipse_01_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/ESP/gtr4_esp_eclipse_LD_01`
								flags = 4
							}
							{
								texture = `tex/models/Characters/Layers/CAG/ESP/GTR4_ESP_Eclipse_DTL_05`
								flags = 4
								Color = yellow_green_3guitar
							}
						]
					}
				]
			}
			CAS_Guitar_Neck = {
				desc_id = GTR_Fretboard_01
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d_01`
						material = GTR_Fretboard_01_Primary
						diffuse
						pre_layer = [
							{
								Color = grey_5
								texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD93_ESP_Patriot`
								flags = 36
							}
						]
					}
				]
			}
			CAS_Guitar_Head = {
				desc_id = GTR4_Neckhead_01
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01`
						material = GTR4_Neckhead_01_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/ESP/GTR4_Neckhead_LD_02`
								flags = 36
							}
							{
								texture = `tex/models/Characters/Layers/CAG/ESP/GTR4_Neckhead_DTL_06`
								flags = 36
								Color = yellow_green_3guitar
							}
						]
					}
				]
			}
			CAS_Guitar_Pickguards = {
				desc_id = None
			}
			CAS_Guitar_Bridges = {
				desc_id = GTR4_ESP_Bridge_02
			}
			CAS_Guitar_Knobs = {
				desc_id = GTR4_ESP_Knob_10_03
			}
			CAS_Guitar_Pickups = {
				desc_id = GTR_Pkup_Type1_Blk_2
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			CAS_Bass_Body = {
				desc_id = Bass105_pin
			}
			CAS_Bass_Neck = {
				desc_id = CAB_22_Heroes04
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_05`
						material = Bass_Fretboard_22d_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/Musicman/Bass_MM_Fboard_22_Inlay1`
								flags = 4
								Color = grey_5guitar
							}
						]
					}
				]
			}
			CAS_Bass_Head = {
				desc_id = bass105_neckhead
			}
			CAS_Bass_Pickguards = {
				desc_id = None
			}
			CAS_Bass_Pickups = {
				desc_id = Bass_EMGpickup3b
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_bass_Bridges = {
				desc_id = BS_Sch_Brdg_A
			}
			CAS_Bass_Knobs = {
				desc_id = Bass_Knob_01
			}
			CAS_Bass_Misc = {
				desc_id = None
			}
			CAS_Drums = {
				desc_id = newtamaTriple
			}
			CAS_Drums_Sticks = {
				desc_id = Drumsticks1
			}
			CAS_Mic = {
				desc_id = Goth
			}
			CAS_Mic_Stand = {
				desc_id = Goth
			}
		}
	}
]
