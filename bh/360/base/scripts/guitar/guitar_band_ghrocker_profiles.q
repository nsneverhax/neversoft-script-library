FailSafe_CAR_Profile = GH_Rocker_Judy
Preset_Musician_Profiles_GHRockers = [
	{
		name = GH_Rocker_Quinton
		fullname = qs(0x960585a9)
		allowed_parts = [
			bass
			Drum
			guitar
			vocals
		]
		preset_icon = photo_Clive
		blurb = qs(0x7d86a5e5)
		appearance = {
			genre = Pop
			CAS_Full_Body = {
				desc_id = Quinton_1
			}
			CAS_Male_Physique = {
				desc_id = MalePhysiqueUntouched
			}
			CAS_Guitar_Body = {
				desc_id = gtr86_mm_axis
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/mm/gtr86_mm_axis_d`
						material = gtr86_mm_axis_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/MM/gtr86_mm_axis_LD02`
								flags = 4
								Color = yellow_orange_1
							}
							{
								texture = `tex/models/Characters/Layers/CAG/All_Clear3`
								flags = 4
							}
							{
								texture = `tex/models/Characters/Layers/CAG/MM/gtr86_mm_axis_DTL02`
								flags = 4
								Color = Black_1guitar
							}
						]
					}
				]
			}
			CAS_Guitar_Neck = {
				desc_id = CAG_22Fret_MM03
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d3_01`
						material = GTR_Fretboard_03_Primary
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
				desc_id = gtr86_Neckhead_01
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/MM/gtr86_Neckhead_D`
						material = gtr86_Neckhead_01_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/mm/gtr86_Neckhead_LD02`
								flags = 36
								Color = yellow_orange_1
							}
							{
								texture = `tex/models/Characters/Layers/CAG/mm/gtr86_Neckhead_DTL02`
								flags = 36
								Color = Black_1guitar
							}
						]
					}
				]
				chosen_materials = {
					material1 = red_2
				}
			}
			CAS_Guitar_Pickguards = {
				desc_id = None
			}
			CAS_Guitar_Bridges = {
				desc_id = GTR75_bridgeMM
				chosen_materials = {
					material1 = red_2
				}
			}
			CAS_Guitar_Knobs = {
				desc_id = GTR_Knob_01c
				chosen_materials = {
					material1 = red_2
				}
			}
			CAS_Guitar_Pickups = {
				desc_id = GTR86_pickup
			}
			CAS_Guitar_Misc = {
				desc_id = GTR_Misc_Switch4
				chosen_materials = {
					material1 = red_3
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
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass14_esp_AX_LD_11`
								flags = 4
								Color = yellow_orange_1
							}
							{
								texture = `tex/models/Characters/Layers/CAG/All_Clear3`
								flags = 4
							}
							{
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass14_ESP_AX_DTL_02`
								flags = 4
								Color = red_1
							}
						]
					}
				]
			}
			CAS_Bass_Neck = {
				desc_id = Bass_Fretboard_22a
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_02`
						material = Bass_Fretboard_22a_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_Inlay_06`
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
								Color = yellow_orange_1
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
					material1 = red_2
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
					material1 = red_2
				}
			}
			CAS_Bass_Knobs = {
				desc_id = Bass14_ESP_Knob_10_04
				chosen_materials = {
					material1 = red_3
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
								texture = `tex/models/Characters/Layers/CADrm/Drumshell_DS_04`
								flags = 32
								Color = red_3
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
				desc_id = Poptastic
			}
		}
	}
	{
		name = GH_Rocker_Casey
		fullname = qs(0xd88aefc7)
		allowed_parts = [
			bass
			Drum
			guitar
			vocals
		]
		preset_icon = photo_Casey
		blurb = qs(0xa173ef4d)
		appearance = {
			genre = `Heavy	Metal`
			CAS_Full_Body = {
				desc_id = Casey_1
			}
			CAS_Female_Physique = {
				desc_id = FemalePhysiqueUntouched
			}
			CAS_Guitar_Body = {
				desc_id = GTR12_ESP_V_01
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr12_esp_v_series_d`
						material = GTR12_ESP_V_01_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/ESP/GTR12_ESP_V_Series_LD_02`
								flags = 4
								Color = grey_5guitar
							}
							{
								texture = `tex/models/Characters/Layers/CAG/ESP/GTR12_ESP_V_Series_DTL_02`
								flags = 4
								Color = Black_1guitar
							}
							{
								texture = `tex/models/Characters/Layers/CAG/ESP/GTR12_ESP_V_Series_DTL_19`
								flags = 4
								Color = Black_1guitar
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
								texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD87_ESP_Tribal`
								flags = 36
								Color = grey_5guitar
							}
						]
					}
				]
			}
			CAS_Guitar_Head = {
				desc_id = GTR12_Neckhead_07
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_07`
						material = GTR12_Neckhead_07_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/ESP/GTR4_Neckhead_07_LD_01`
								flags = 36
								Color = Black_1guitar
							}
							{
								texture = `tex/models/Characters/Layers/CAG/ESP/GTR4_Neckhead_07_LD_03`
								flags = 36
								Color = grey_5guitar
							}
							{
								texture = `tex/models/Characters/Layers/CAG/ESP/GTR4_Neckhead7_DTL_06`
								flags = 36
								Color = Black_1guitar
							}
						]
					}
				]
				chosen_materials = {
					material1 = red_2
				}
			}
			CAS_Guitar_Pickguards = {
				desc_id = None
			}
			CAS_Guitar_Bridges = {
				desc_id = GTR12_Bridge_3
				chosen_materials = {
					material1 = red_2
				}
			}
			CAS_Guitar_Knobs = {
				desc_id = GTR12_ESP_Knob_02
				chosen_materials = {
					material1 = red_1
				}
			}
			CAS_Guitar_Pickups = {
				desc_id = GTR1_ESP_EMG_Pkup_2
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Guitar_Misc = {
				desc_id = None
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
								Color = grey_5guitar
							}
							{
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass9_ESP_AX_DTL_04`
								flags = 4
								Color = Black_1guitar
							}
							{
								Color = Black_1guitar
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass9_ESP_AX_DTL_19`
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
				desc_id = Bass9_Neckhead_01
				chosen_materials = {
					material1 = red_2
				}
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/ESP/bass9_neckhead_d`
						material = Bass9_Neckhead_01_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass9_Neckhead_LD_01`
								flags = 36
								Color = grey_5guitar
							}
							{
								texture = `tex/models/Characters/Layers/CAG/All_Clear3`
								flags = 36
							}
							{
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass9_Neckhead_DTL_02`
								flags = 36
								Color = red_1
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
				desc_id = Bass9_Bridge_4str_01
				chosen_materials = {
					material1 = red_2
				}
			}
			CAS_Bass_Knobs = {
				desc_id = Bass9_ESP_Knob_10_04
				chosen_materials = {
					material1 = red_3
				}
			}
			CAS_Bass_Misc = {
				desc_id = None
			}
			CAS_Drums = {
				desc_id = newtamaDouble
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
						material = newtamaDouble_Primary1
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CADrm/GH5_Shell_LD49`
								flags = 32
							}
						]
					}
					{
						base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
						material = newtamaDouble_Bassdrum
						diffuse
						layers = [
							{
								texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics053`
								x_scale = 72
								y_scale = 72
								flags = 3
								Color = red_3
							}
						]
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CADrm/bass_skin_DS_13`
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
		name = GH_Rocker_Midori
		fullname = qs(0x4c47fb49)
		allowed_parts = [
			bass
			Drum
			guitar
			vocals
		]
		preset_icon = photo_Midori
		blurb = qs(0x7c8dca20)
		appearance = {
			genre = Pop
			CAS_Full_Body = {
				desc_id = Midori_1
			}
			CAS_Female_Physique = {
				desc_id = MidoriPhysique
			}
			CAS_Guitar_Body = {
				desc_id = gtr86_mm_axis
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/mm/gtr86_mm_axis_d`
						material = gtr86_mm_axis_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/MM/gtr86_mm_axis_LD02`
								flags = 4
								Color = green_3guitar
							}
							{
								texture = `tex/models/Characters/Layers/CAG/MM/gtr86_mm_axis_DTL02`
								flags = 4
								Color = Black_1guitar
							}
						]
					}
				]
			}
			CAS_Guitar_Neck = {
				desc_id = CAG_22Fret_MM04
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
						material = GTR_Fretboard_04_Primary
						diffuse
						pre_layer = [
							{
								Color = grey_5
								texture = `tex/models/Characters/Layers/CAG/MM/GTR84_MMInlayPet22`
								flags = 36
							}
						]
					}
				]
			}
			CAS_Guitar_Head = {
				desc_id = gtr86_Neckhead_01
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/MM/gtr86_Neckhead_D`
						material = gtr86_Neckhead_01_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/mm/gtr86_Neckhead_LD02`
								flags = 36
								Color = green_3guitar
							}
							{
								texture = `tex/models/Characters/Layers/CAG/mm/gtr86_Neckhead_DTL02`
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
				desc_id = GTR75_bridgeBMM
			}
			CAS_Guitar_Knobs = {
				desc_id = GTR_Knob_01c
			}
			CAS_Guitar_Pickups = {
				desc_id = GTR_EMG_pickup2
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Guitar_Misc = {
				desc_id = GTR_Misc_Switch4
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
								Color = green_3guitar
							}
							{
								texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch_Stil_LD05`
								flags = 4
								Color = teal_1
							}
							{
								texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch_Stil_LD02`
								flags = 4
								Color = Black_1guitar
							}
						]
					}
				]
			}
			CAS_Bass_Neck = {
				desc_id = Bass_SCH_Fretboard_24c
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_03`
						material = Bass_Fretboard_24c_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch_INL_LD40`
								flags = 36
								Color = green_3guitar
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
								Color = teal_1
							}
							{
								texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch_STL_HD_DTL05`
								flags = 36
								Color = green_3guitar
							}
							{
								texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch_STL_HD_DTL01`
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
						base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
						material = CAD_Drums_01_Bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CADrm/bass_skin_DS_15`
								flags = 4
							}
						]
					}
					{
						base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
						material = CAD_Drums_01_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CADrm/GH5_Shell_LD53`
								flags = 32
								Color = green_3guitar
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
				desc_id = Mic_Stand_BlackMetal
			}
		}
	}
	{
		name = GH_Rocker_Clive
		fullname = qs(0xccb97235)
		allowed_parts = [
			bass
			Drum
			guitar
			vocals
		]
		preset_icon = photo_Clive
		blurb = qs(0x39b4529d)
		appearance = {
			genre = classic
			CAS_Full_Body = {
				desc_id = Clive_1
			}
			CAS_Male_Physique = {
				desc_id = MalePhysiqueUntouched
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
								Color = blue_3
							}
						]
					}
				]
			}
			CAS_Guitar_Neck = {
				desc_id = CAG_22Fret_ESP02
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d2_01`
						material = GTR_Fretboard_02_Primary
						diffuse
						pre_layer = [
							{
								Color = grey_2
								texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
								flags = 36
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
			}
			CAS_Guitar_Bridges = {
				desc_id = GTR37_Hardware
			}
			CAS_Guitar_Knobs = {
				desc_id = GTR37_Knobs01
			}
			CAS_Guitar_Pickups = {
				desc_id = GTR37_Pickup
			}
			CAS_Guitar_Misc = {
				desc_id = None
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
								Color = red_orange_1
							}
							{
								texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch_MT_LD04`
								flags = 4
								Color = red_orange_3
							}
						]
					}
				]
			}
			CAS_Bass_Neck = {
				desc_id = Bass_SCH_Fretboard_24b
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_02`
						material = Bass_Fretboard_24b_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch_INL_LD42`
								flags = 4
								Color = grey_5guitar
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
				desc_id = Bass_Pickup_EMG01
			}
			CAS_bass_Bridges = {
				desc_id = Bas_Brdg_SCH_T
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
						layers = [
							{
								texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
								Color = orange_2
								x_scale = 118
								flags = 259
								y_scale = 113
							}
							{
								texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
								a = 50
								x_trans = -30
								x_scale = 17
								y_scale = 117
								flags = 259
								Color = yellow_2guitar
							}
							{
								texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
								a = 50
								x_trans = 30
								x_scale = 17
								y_scale = 117
								flags = 259
								Color = yellow_2guitar
							}
							{
								texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
								a = 50
								x_scale = 17
								y_scale = 117
								flags = 259
								Color = yellow_2guitar
							}
						]
					}
					{
						base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
						material = CAD_Drums_01_Primary
						diffuse
						pre_layer = [
							{
								Color = red_orange_4
								texture = `tex/models/Characters/Layers/CADrm/Drumshell_RM_03`
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
				desc_id = rock
			}
			CAS_Mic_Stand = {
				desc_id = rock
			}
		}
	}
	{
		name = GH_Rocker_Pandora
		fullname = qs(0xd26ebef4)
		allowed_parts = [
			bass
			Drum
			guitar
			vocals
		]
		preset_icon = photo_Pandora
		blurb = qs(0xe7fb75f4)
		appearance = {
			genre = Goth
			CAS_Full_Body = {
				desc_id = Pandora_1
			}
			CAS_Female_Physique = {
				desc_id = FemalePhysiqueUntouched
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
								texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR75_IBZ_XPT_LD02`
								flags = 4
								Color = grey_5guitar
							}
							{
								texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR75_IBZ_XPT_DTL03`
								flags = 4
								Color = purple_blue_1
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
				desc_id = CAG_24Fret_Ibanez04
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
						material = GTR_Fretboard24_04_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD69_IBZ_Sharktooth2`
								flags = 36
							}
						]
					}
				]
			}
			CAS_Guitar_Head = {
				desc_id = GTR75_Neckhead_01
				chosen_materials = {
					material1 = grey_5guitar
				}
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR75_Neckhead_d`
						material = GTR75_Neckhead_01_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/Ibanez/GTR75_Neckhead_LD02`
								flags = 36
								Color = Black_1guitar
							}
							{
								texture = `tex/models/Characters/Layers/CAG/All_Clear3`
								flags = 4
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
			}
			CAS_Guitar_Knobs = {
				desc_id = GTR_Knob_08
				chosen_materials = {
					material1 = purple_blue_3
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
					material1 = purple_blue_3
				}
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
								texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch_MT_DTL03`
								flags = 4
								Color = red_2
							}
							{
								texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch_MT_LD05`
								flags = 4
								Color = Black_1guitar
							}
						]
					}
				]
			}
			CAS_Bass_Neck = {
				desc_id = Bass_SCH_Fretboard_22a
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_02`
						material = Bass_Fretboard_22a_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch22_INL_LD30`
								flags = 4
								Color = grey_5guitar
							}
						]
					}
				]
			}
			CAS_Bass_Head = {
				desc_id = BS_SCH_T_NHEAD
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/Schecter/bass_neckhead_mt`
						material = BS_SCH_T_NHEAD_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch_MT_HD_DTL08`
								flags = 36
							}
							{
								Color = Black_1guitar
								texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch_MT_HD_DTL07`
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
				desc_id = BS_Sch_Brdg_A
			}
			CAS_Bass_Knobs = {
				desc_id = Knob_Knurl02
				chosen_materials = {
					material1 = yellow_2guitar
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
								texture = `tex/models/Characters/Layers/CADrm/bass_skin_DS_13`
								flags = 4
								Color = purple_blue_1
							}
						]
					}
					{
						base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
						material = newtamaDouble_Primary1
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
		name = GH_Rocker_Eddie
		fullname = qs(0x91c2e6b5)
		allowed_parts = [
			bass
			Drum
			guitar
			vocals
		]
		preset_icon = photo_Eddie
		blurb = qs(0xbe333f05)
		appearance = {
			genre = classic
			CAS_Full_Body = {
				desc_id = Eddie_1
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
								texture = `tex/models/Characters/Layers/CAG/McSwain/GTR10_McSwain_Flame_LD7`
								flags = 4
							}
							{
								texture = `tex/models/Characters/Layers/CAG/McSwain/GTR10_McSwain_Flame_DTL1`
								flags = 4
							}
						]
					}
				]
			}
			CAS_Guitar_Neck = {
				desc_id = CAG_22Fret_Mcswain01
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d_01`
						material = GTR_Fretboard_01_Primary
						diffuse
						pre_layer = [
							{
								Color = grey_5
								texture = `tex/models/Characters/Layers/CAG/GH5/22_fret_LD70_McSwn_Flame`
								flags = 36
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
								texture = `tex/models/Characters/Layers/CAG/McSwain/GTR10_Nkhd_McSwain_LD3`
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
				desc_id = GTR_Brdg_McSwn_inferno_3
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
				desc_id = GTR_Misc_Switch
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
								texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch_MT_DTL03`
								flags = 4
								Color = red_2
							}
							{
								texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch_MT_LD05`
								flags = 4
								Color = Black_1guitar
							}
						]
					}
				]
			}
			CAS_Bass_Neck = {
				desc_id = Bass_SCH_Fretboard_22a
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_02`
						material = Bass_Fretboard_22a_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch22_INL_LD30`
								flags = 4
								Color = grey_5guitar
							}
						]
					}
				]
			}
			CAS_Bass_Head = {
				desc_id = BS_SCH_T_NHEAD
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/Schecter/bass_neckhead_mt`
						material = BS_SCH_T_NHEAD_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch_MT_HD_DTL08`
								flags = 36
							}
							{
								Color = Black_1guitar
								texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch_MT_HD_DTL07`
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
				desc_id = BS_Sch_Brdg_A
			}
			CAS_Bass_Knobs = {
				desc_id = Knob_Knurl02
				chosen_materials = {
					material1 = yellow_2guitar
				}
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
								Color = Black_1guitar
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
				desc_id = `Steering	Wheel`
			}
		}
	}
	{
		name = GH_Rocker_Axel
		fullname = qs(0x0539af5a)
		allowed_parts = [
			Drum
			vocals
			guitar
			bass
		]
		preset_icon = photo_axel
		blurb = qs(0x98c85f9c)
		appearance = {
			genre = `Classic	Rock`
			CAS_Full_Body = {
				desc_id = Axel_1
			}
			CAS_Male_Physique = {
				desc_id = MalePhysiqueUntouched
			}
			CAS_Guitar_Body = {
				desc_id = GTR63f_ESP_EX
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr63f_esp_ex_d`
						material = GTR63f_ESP_EX_Primary
						diffuse
						pre_layer = [
							{
								Color = Black_1guitar
								texture = `tex/models/Characters/Layers/CAG/ESP/GTR63F_ESP_EX_LD_01`
								flags = 4
							}
						]
						layers = [
							{
								texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics073`
								Color = yellow_orange_1
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
			CAS_Guitar_Neck = {
				desc_id = CAG_22Fret_ESP03
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d3_01`
						material = GTR_Fretboard_03_Primary
						diffuse
						pre_layer = [
							{
								Color = grey_5
								texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
								flags = 36
							}
						]
					}
				]
			}
			CAS_Guitar_Head = {
				desc_id = GTR63f_Neckhead
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr63f_neckhead_d`
						material = GTR63f_Neckhead_primary
						diffuse
						pre_layer = [
							{
								Color = Black_1guitar
								texture = `tex/models/Characters/Layers/CAG/ESP/GTR63f_Neckhead_LD_01`
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
				desc_id = GTR_Hardware63f
			}
			CAS_Guitar_Knobs = {
				desc_id = GTR63_Knob_Type06
			}
			CAS_Guitar_Pickups = {
				desc_id = GTR62_ESP_EMG
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Guitar_Misc = {
				desc_id = None
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
						]
						layers = [
							{
								texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics073`
								Color = yellow_orange_2
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
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_24_inlay_05`
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
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
						material = newtamaTriple_Primary1
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CADrm/GH5_Shell_LD08`
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
								texture = `tex/models/Characters/Layers/CADrm/PopSkin_11`
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
				desc_id = `Classic	Rock`
			}
			CAS_Mic_Stand = {
				desc_id = `Classic	Rock`
			}
		}
	}
	{
		name = GH_Rocker_Judy
		fullname = qs(0xa9028c21)
		allowed_parts = [
			bass
			Drum
			guitar
			vocals
		]
		preset_icon = photo_Judy
		blurb = qs(0xb5a58be6)
		appearance = {
			genre = `Heavy	Metal`
			CAS_Full_Body = {
				desc_id = Judy_1
			}
			CAS_Female_Physique = {
				desc_id = JudyPhysique
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
								texture = `tex/models/Characters/Layers/CAG/All_Clear3`
								flags = 4
							}
							{
								texture = `tex/models/Characters/Layers/CAG/Schecter/GTR73_SCH_S1_DTL02`
								flags = 4
								Color = yellow_1guitar
							}
						]
						layers = [
							{
								texture = `tex/models/Characters/Skater_Male/Decals/CAG_icons055`
								Color = yellow_3guitar
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
			CAS_Guitar_Neck = {
				desc_id = CAG_22Fret_Schecter04
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
						material = GTR_Fretboard_04_Primary
						diffuse
						pre_layer = [
							{
								Color = grey_5
								texture = `tex/models/Characters/Layers/CAG/GH5/22_fret_LD34_Shctr_LadyLuck`
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
								texture = `tex/models/Characters/Layers/CAG/Schecter/GTR73_neckhead_LD01`
								flags = 36
							}
						]
					}
				]
				chosen_materials = {
					material1 = yellow_3guitar
				}
			}
			CAS_Guitar_Pickguards = {
				desc_id = GTR73_PG1
			}
			CAS_Guitar_Bridges = {
				desc_id = GTR72_Bridge
				chosen_materials = {
					material1 = yellow_3guitar
				}
			}
			CAS_Guitar_Knobs = {
				desc_id = GTR_Knob_10c
				chosen_materials = {
					material1 = yellow_3guitar
				}
			}
			CAS_Guitar_Pickups = {
				desc_id = GTR_EMG_pickup2
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
				desc_id = BS_SCH_T_Body
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\Bass\Schecter\bs_sch_modelt`
						material = BS_Sch_ModelT_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch_MT_DTL01`
								Color = Black_1guitar
							}
							{
								texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch_MT_LD09`
								flags = 4
								Color = yellow_2guitar
							}
							{
								texture = `tex/models/Characters/Layers/CAG/All_Clear2`
								flags = 4
							}
						]
					}
				]
			}
			CAS_Bass_Neck = {
				desc_id = Bass_SCH_Fretboard_22d
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_05`
						material = Bass_Fretboard_22d_Primary
						diffuse
						pre_layer = [
							{
								Color = grey_4
								texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch22_INL_LD35`
								flags = 36
							}
						]
					}
				]
			}
			CAS_Bass_Head = {
				desc_id = BS_SCH_T_NHEAD
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/Schecter/bass_neckhead_mt`
						material = BS_SCH_T_NHEAD_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch_MT_HD_DTL06`
								flags = 36
								Color = yellow_2guitar
							}
							{
								texture = `tex/models/Characters/Layers/CAG/All_Clear3`
								flags = 36
							}
							{
								texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch_MT_HD_DTL02`
								flags = 36
								Color = Black_1guitar
							}
						]
					}
				]
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
				desc_id = newtamaDouble
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
						material = newtamaDouble_Primary1
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CADrm/Drumshell_DS_50`
								flags = 32
								Color = violet_3
							}
						]
					}
					{
						base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
						material = newtamaDouble_Bassdrum
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
				desc_id = `Glam	Rock`
			}
			CAS_Mic_Stand = {
				desc_id = Twisted
			}
		}
	}
	{
		name = GH_Rocker_Izzy
		fullname = qs(0x3ba5cbc5)
		allowed_parts = [
			bass
			Drum
			guitar
			vocals
		]
		preset_icon = photo_Izzy
		blurb = qs(0xe43bec4c)
		appearance = {
			genre = classic
			CAS_Full_Body = {
				desc_id = Izzy_1
			}
			CAS_Male_Physique = {
				desc_id = MalePhysiqueUntouched
			}
			CAS_Guitar_Body = {
				desc_id = GTR84_MM_Petrucci
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/MM/gtr84_mm_petrucci`
						material = GTR84_MM_Pet_Primary
						diffuse
						pre_layer = [
							{
								Color = Black_1guitar
								texture = `tex/models/Characters/Layers/CAG/MM/GTR84_MM_DTL01`
								flags = 4
							}
							{
								texture = `tex/models/Characters/Layers/CAG/MM/GTR84_MM_DTL02`
								flags = 4
								Color = green_3guitar
							}
						]
					}
				]
			}
			CAS_Guitar_Neck = {
				desc_id = CAG_24Fret_MM04
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
						material = GTR_Fretboard24_04_Primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
								flags = 36
								Color = green_3guitar
							}
						]
					}
				]
			}
			CAS_Guitar_Head = {
				desc_id = GTR84_Neckhead01
				chosen_materials = {
					material1 = green_3guitar
				}
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/MM/gtr84_neckhead01`
						material = GTR84_Neckhead_01_Primary
						diffuse
						pre_layer = [
							{
								Color = Black_1guitar
								texture = `tex/models/Characters/Layers/CAG/MM/GTR84_Nekhed_DTL04`
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
				desc_id = GTR84_Whammy
			}
			CAS_Guitar_Knobs = {
				desc_id = GTR_Knob_MM01
				chosen_materials = {
					material1 = green_3guitar
				}
			}
			CAS_Guitar_Pickups = {
				desc_id = GTR84_pickup_A
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Guitar_Misc = {
				desc_id = GTR_Misc_Switch4
				chosen_materials = {
					material1 = green_3guitar
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
							{
								texture = `tex/models/Characters/Layers/CAB/IBANEZ/BS_IBZ_SR_DTL01`
								flags = 4
								Color = green_3guitar
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
								texture = `tex/models/Characters/Layers/CAB/Ibanez/Bass_SR24_INLAY001`
								flags = 4
								Color = grey_5guitar
							}
						]
					}
				]
			}
			CAS_Bass_Head = {
				desc_id = BAS_IBZ_SR_Head01
				chosen_materials = {
					material1 = green_3guitar
				}
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
				desc_id = BAS_IBZ_PKUP002
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_bass_Bridges = {
				desc_id = Bas_Brdg_Ibz01
				chosen_materials = {
					material1 = green_3guitar
				}
			}
			CAS_Bass_Knobs = {
				desc_id = Knob_Knurl02
				chosen_materials = {
					material1 = green_3guitar
				}
			}
			CAS_Bass_Misc = {
				desc_id = None
			}
			CAS_Drums = {
				desc_id = newtamaDouble
				CAP = [
					{
						base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
						material = newtamaDouble_Primary1
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CADrm/GH5_TamaShell_LD14`
								flags = 32
								Color = green_3guitar
							}
						]
					}
					{
						base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
						material = newtamaDouble_Bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CADrm/bass_skin_DS_15`
								flags = 4
								Color = Black_1guitar
							}
						]
						layers = [
							{
								texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics094`
								Color = green_3guitar
								x_scale = 72
								y_scale = 72
								flags = 3
								y_trans = -7
							}
							{
								texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon026`
								Color = grey_5guitar
								y_trans = -13
								y_scale = 51
								flags = 259
								x_scale = 51
							}
							{
								texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon026`
								y_trans = -13
								x_scale = 49
								y_scale = 47
								flags = 259
								Color = Black_1guitar
							}
							{
								texture = `tex/models/Characters/Skater_Male/Decals/CAG_Icon026`
								Color = grey_4guitar
								y_trans = -13
								y_scale = 45
								flags = 259
								x_scale = 46
							}
							{
								texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_001`
								x_trans = -1
								y_trans = -17
								x_scale = 17
								y_scale = 19
								flags = 259
								Color = green_3guitar
							}
							{
								texture = `tex/models/Characters/Skater_Male/Decals/CAG_graphics097`
								x_scale = 46
								y_scale = 41
								flags = 3
								y_trans = -7
							}
						]
					}
				]
			}
			CAS_Drums_Sticks = {
				desc_id = Drumsticks1
			}
			CAS_Mic = {
				desc_id = `Glam	Rock`
			}
			CAS_Mic_Stand = {
				desc_id = Glam
			}
		}
	}
	{
		name = GH_Rocker_Johnny
		fullname = qs(0x525fe42c)
		allowed_parts = [
			bass
			Drum
			guitar
			vocals
		]
		preset_icon = photo_Johnny
		blurb = qs(0x94c83b0e)
		appearance = {
			genre = classic
			CAS_Full_Body = {
				desc_id = Johnny_1
			}
			CAS_Male_Physique = {
				desc_id = MalePhysiqueUntouched
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
								texture = `tex/models/Characters/Layers/CAG/All_Clear`
								flags = 4
							}
							{
								texture = `tex/models/Characters/Layers/CAG/esp/gtr33_trash`
								flags = 4
								Color = yellow_orange_1
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
								texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD103_ESP_Skulls2`
								flags = 36
							}
						]
					}
				]
			}
			CAS_Guitar_Head = {
				desc_id = GTR33D_NekHed
				chosen_materials = {
					material1 = grey_5guitar
				}
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed`
						material = GTR33D_NeckHead_Primary
						diffuse
						pre_layer = [
							{
								Color = Black_1guitar
								texture = `tex/models/Characters/Layers/CAG/ESP/GTR33_NHead_solid`
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
				desc_id = GTR33_Hardware01Z
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			CAS_Guitar_Knobs = {
				desc_id = GTR33_Knobs_KH2
			}
			CAS_Guitar_Pickups = {
				desc_id = GTR33_EMG
				chosen_materials = {
					material1 = Black_1guitar
				}
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
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass14_ESP_AX_LD_01`
								Color = Black_1guitar
							}
						]
						layers = [
							{
								texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
								Color = yellow_green_1guitar
								y_trans = -5
								x_scale = 53
								y_scale = 10
								rot = 1573
								flags = 259
								x_trans = 8
							}
							{
								texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
								Color = yellow_green_1guitar
								x_trans = -2
								y_trans = -5
								y_scale = 10
								rot = 1573
								flags = 259
								x_scale = 53
							}
							{
								texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
								Color = yellow_green_1guitar
								x_trans = -12
								y_trans = -6
								y_scale = 10
								rot = 1573
								flags = 259
								x_scale = 44
							}
							{
								texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
								Color = yellow_green_1guitar
								x_trans = -22
								x_scale = 69
								y_scale = 10
								rot = 1573
								flags = 259
								y_trans = -14
							}
							{
								texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
								Color = yellow_green_1guitar
								y_trans = 2
								x_scale = 69
								y_scale = 10
								rot = 1573
								flags = 259
								x_trans = -32
							}
							{
								texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_006`
								Color = yellow_green_1guitar
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
			CAS_Bass_Neck = {
				desc_id = Bass_Fretboard_22d
				CAP = [
					{
						base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_05`
						material = Bass_Fretboard_22d_Primary
						diffuse
						pre_layer = [
							{
								Color = grey_4
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_Inlay_01`
								flags = 4
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
								Color = Black_1guitar
								texture = `tex/models/Characters/Layers/CAB/ESP/Bass9_Neckhead4_LD_01`
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
				desc_id = Bass9_Pkup_Type1_Blk_02
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
								texture = `tex/models/Characters/Layers/CADrm/GH5_Skin_LD09`
								flags = 4
							}
						]
					}
					{
						base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
						material = CAD_Drums_01_Primary
						diffuse
						pre_layer = [
							{
								Color = grey_4guitar
								texture = `tex/models/Characters/Layers/CADrm/Drumshell_DS_23`
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
				desc_id = Twisted
			}
		}
	}
]
