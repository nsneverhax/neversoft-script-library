cas_preset_guitars = [
	{
		genre = [
			rock
			punk
			`classic rock`
		]
		cas_guitar_body = {
			desc_id = guitar_body01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_body_style1_d_01.dds`
					material = guitar_body_style_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style1_ld_06.img`
							flags = 4
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style1_dtl_22.img`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = guitar_neck05
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/neck_maple_tb_05.dds`
					material = guitar_neck5_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/neck1_inlay_dots1_d_01.img`
							flags = 36
							color = grey_3
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = guitar_head13
			chosen_materials = {
				material1 = grey_5guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_headtock13_d_01.dds`
					material = guitar_head_13_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock13_ld_01.img`
							flags = 36
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock13_dtl_01.img`
							flags = 36
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = guitar_pickg01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/pickgrd1_body1_d_01.dds`
					material = gtr_body1_pickgrd_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/pickgrd1_body1_ld_02.img`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_bridges = {
			desc_id = gtr_hardware01b
			chosen_materials = {
				material1 = grey_5guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr1_knob_type4_04
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_type1_blk_2
			chosen_materials = {
				material1 = black_1guitar
			}
		}
	}
	{
		genre = [
			goth
			`black metal`
			`heavy metal`
		]
		cas_guitar_body = {
			desc_id = guitar_body02
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_body_style2_d_01.dds`
					material = guitar_body_style_02_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style2_ld_13.img`
							flags = 4
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style2_d_04.img`
							flags = 4
							color = yellow_1guitar
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
							texture = `tex/models/characters/layers/cag/neck1_inlay_vine1_d_03.img`
							flags = 36
							color = yellow_orange_1
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = guitar_head02
			chosen_materials = {
				material1 = grey_2guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_headtock02_d_01.dds`
					material = headstock2_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock02_ld_01.img`
							flags = 36
							color = orange_3
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock02_dtl_04.img`
							flags = 36
							color = yellow_orange_1
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
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr2_knob_type4_04
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_type3b_03
			chosen_materials = {
				material1 = black_1guitar
			}
		}
	}
	{
		genre = [
			`classic rock`
			`black metal`
			`heavy metal`
		]
		cas_guitar_body = {
			desc_id = guitar_body03
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_body_style3_d_01.dds`
					material = guitar_body_style_03_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style3_ld_41.img`
							flags = 4
							color = orange_5
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style3_dtl_04.img`
							color = red_3
							flags = 4
							a = 70
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
							flags = 36
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
							color = orange_1
							flags = 36
							a = 55
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock10_dtl_04.img`
							flags = 36
							color = red_2
						}
					]
				}
			]
			chosen_materials = {
				material1 = orange_4
			}
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
			desc_id = gtr3_knob_type10_03
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_type1_blktan_2
			chosen_materials = {
				material1 = black_1guitar
			}
		}
	}
	{
		genre = [
			`classic rock`
			punk
			`heavy metal`
			rock
		]
		cas_guitar_body = {
			desc_id = guitar_body04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_body_style4_d_01.dds`
					material = guitar_body_style_04_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style4_ld_40.img`
							flags = 4
							color = orange_4
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style4_dtl_04.img`
							color = red_1
							flags = 4
							a = 90
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
							flags = 36
							color = grey_2guitar
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = guitar_head99
			chosen_materials = {
				material1 = orange_4
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_headtock099.dds`
					material = guitar_head_99_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock099_wht.img`
							flags = 36
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock99__dtl_01.img`
							flags = 36
							color = red_3
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = gtr_body4_pickg01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/pickgrd_body4_d_01.dds`
					material = pckgrd_body4_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/pickgrd_body4_ld_04.img`
							flags = 4
							color = red_3
						}
					]
				}
			]
		}
		cas_guitar_bridges = {
			desc_id = gtr_hardware05
			chosen_materials = {
				material1 = orange_4
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr4_knob_type10_04
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
	}
	{
		genre = [
			`classic rock`
			punk
			`heavy metal`
			rock
			goth
		]
		cas_guitar_body = {
			desc_id = guitar_body05
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_body_style5_d_01.dds`
					material = guitar_body_style_05_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style5_dtl_03.img`
							flags = 4
							color = red_1
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
							texture = `tex/models/characters/layers/cag/neck1_inlay_dancers_d_22.img`
							flags = 36
							color = red_1
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = guitar_head04
			chosen_materials = {
				material1 = yellow_5guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_headtock04_d_01.dds`
					material = guitar_head_04_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock04_ld_01.img`
							color = red_3
							flags = 36
							a = 45
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock04_dtl_03.img`
							flags = 36
							color = red_1
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = gtr_body5_pickg01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/pickgrd_body5_d_01.dds`
					material = pckgrd_body5_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/pickgrd_body5_ld_04.img`
							flags = 4
							color = grey_1
						}
					]
				}
			]
		}
		cas_guitar_bridges = {
			desc_id = gtr_hardware06
			chosen_materials = {
				material1 = yellow_5guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr4_knob_type7_04
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_type1_blk_2
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
	}
	{
		genre = [
			`classic rock`
			rock
			`glam rock`
		]
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
							color = red_1
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
							texture = `tex/models/characters/layers/cag/neck1_inlay_skulls_d_21.img`
							flags = 36
							color = grey_4guitar
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = guitar_head12
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_headtock12_d_01.dds`
					material = guitar_head_12_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock12_ld_01.img`
							flags = 36
							color = red_1
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock12_dtl_06.img`
							flags = 36
						}
					]
				}
			]
			chosen_materials = {
				material1 = orange_4
			}
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr_hardware01b
			chosen_materials = {
				material1 = orange_4
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr6_knob_type5_03
			chosen_materials = {
				material1 = grey_5guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_type1_blktan_2
			chosen_materials = {
				material1 = red_2
			}
		}
	}
	{
		genre = [
			goth
			`black metal`
			`heavy metal`
		]
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
							texture = `tex/models/characters/layers/cag/gtr_body_style7_dtl_81.img`
							color = red_orange_3
							flags = 4
							a = 85
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
							texture = `tex/models/characters/layers/cag/neck1_inlay_diamonds_d_16.img`
							flags = 36
							color = grey_3guitar
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = guitar_head08
			chosen_materials = {
				material1 = orange_5
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_headtock08_d_01.dds`
					material = guitar_head_08_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock08_ld_01.img`
							flags = 36
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock08_dtl_01.img`
							flags = 36
							color = red_orange_3
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = gtr_body7_pickg01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/pickgrd_body7_d_01.dds`
					material = pckgrd_body7_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/pickgrd_body7_ld_04.img`
							flags = 4
							color = yellow_orange_1
						}
					]
				}
			]
		}
		cas_guitar_bridges = {
			desc_id = gtr_hardware01b
			chosen_materials = {
				material1 = orange_5
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr7_knob_type1_03
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_type1_blk_3
			chosen_materials = {
				material1 = red_orange_1
			}
		}
	}
	{
		genre = [
			goth
			`black metal`
			`heavy metal`
		]
		cas_guitar_body = {
			desc_id = guitar_body08
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_body_style8_d_01.dds`
					material = guitar_body_style_08_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style8_ld_66.img`
							flags = 4
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style8_dtl_82.img`
							color = teal_1
							flags = 4
							a = 60
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
							texture = `tex/models/characters/layers/cag/neck1_inlay_dots1_d_01.img`
							flags = 36
							color = teal_2
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
							texture = `tex/models/characters/layers/cag/gtr_headtock099_wht.img`
							color = red_orange_1
							flags = 36
							a = 90
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock099_dtl_03.img`
							color = teal_1
							flags = 36
							a = 45
						}
					]
				}
			]
			chosen_materials = {
				material1 = orange_5
			}
		}
		cas_guitar_pickguards = {
			desc_id = gtr_body8_pickg03
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/pickgrd_body8_d_03.dds`
					material = pckgrd_body8_03_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/pickgrd_body8_ld_06.img`
							flags = 4
							color = teal_1
						}
					]
				}
			]
		}
		cas_guitar_bridges = {
			desc_id = gtr_hardware01b
			chosen_materials = {
				material1 = orange_5
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr8_knob_type4_03
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_type6_tkd_02
			chosen_materials = {
				material1 = teal_1
			}
		}
	}
	{
		genre = [
			goth
			`black metal`
			`heavy metal`
			rock
			punk
			`glam rock`
			pop
		]
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
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style9_dtl_82.img`
							flags = 4
							color = grey_4guitar
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
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = guitar_head10
			chosen_materials = {
				material1 = grey_5guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_headtock10_d_01.dds`
					material = guitar_head_10_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock10_ld_01.img`
							flags = 36
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock10_dtl_06.img`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = gtr_body9_pickg01
		}
		cas_guitar_bridges = {
			desc_id = gtr_hardware01b
			chosen_materials = {
				material1 = grey_5guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr9_knob_type2_03
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickups_style_01a
			chosen_materials = {
				material1 = black_1guitar
			}
		}
	}
	{
		genre = [
			goth
			`heavy metal`
			rock
			punk
			`glam rock`
			pop
		]
		cas_guitar_body = {
			desc_id = guitar_body10
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_body_style10_d_01.dds`
					material = guitar_body_style_10_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style10_ld_66.img`
							flags = 4
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style10_dtl_80.img`
							color = yellow_1guitar
							flags = 4
							a = 45
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
							texture = `tex/models/characters/layers/cag/neck1_inlay_tribal2_d_20.img`
							flags = 36
							color = grey_3guitar
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = guitar_head12
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_headtock12_d_01.dds`
					material = guitar_head_12_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock12_ld_01.img`
							flags = 36
							color = orange_3
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock12_dtl_01.img`
							flags = 36
							color = orange_2
						}
					]
				}
			]
			chosen_materials = {
				material1 = orange_5
			}
		}
		cas_guitar_pickguards = {
			desc_id = gtr_body10_pickg01
		}
		cas_guitar_bridges = {
			desc_id = gtr_hardware01b
			chosen_materials = {
				material1 = orange_5
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr10_knob_type2_03
			chosen_materials = {
				material1 = red_1
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_type2_04
			chosen_materials = {
				material1 = black_1guitar
			}
		}
	}
	{
		genre = [
			goth
			`black metal`
			`heavy metal`
			rock
			punk
			`glam rock`
			pop
			`classic rock`
		]
		cas_guitar_body = {
			desc_id = guitar_body11
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_body_style11_d_01.dds`
					material = guitar_body_style_11_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style11_ld_11.img`
							flags = 4
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style11_dtl_01.img`
							color = green_3guitar
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = guitar_neck05
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/neck_maple_tb_05.dds`
					material = guitar_neck5_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/neck1_inlay_block2_d_26.img`
							flags = 36
							color = grey_5guitar
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = guitar_head01
			chosen_materials = {
				material1 = yellow_4guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_headtock01_d_01.dds`
					material = guitar_head_headstock
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock01_ld_01.img`
							flags = 36
							color = green_3guitar
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
				material1 = yellow_4guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr11_knob_type1_03
			chosen_materials = {
				material1 = yellow_green_1guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_type1_blktan_2
			chosen_materials = {
				material1 = green_3guitar
			}
		}
	}
	{
		genre = [
			rock
			punk
			`glam rock`
			pop
			`classic rock`
		]
		cas_guitar_body = {
			desc_id = guitar_body12
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_body_style12_d_01.dds`
					material = guitar_body_style_12_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style12_ld_20.img`
							flags = 4
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style12_dtl_01.img`
							color = orange_2
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
							color = grey_1
							texture = `tex/models/characters/layers/cag/neck1_inlay_diamonds_d_16.img`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = guitar_head14
			chosen_materials = {
				material1 = grey_3guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_headtock14_d_01.dds`
					material = guitar_head_14_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock14_ld_01.img`
							flags = 36
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock14_dtl_01.img`
							flags = 36
							color = orange_3
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
			desc_id = gtr12_knob_type6_04
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_type1_blk_3
			chosen_materials = {
				material1 = black_1guitar
			}
		}
	}
	{
		genre = [
			rock
			punk
			`glam rock`
			pop
			`classic rock`
		]
		cas_guitar_body = {
			desc_id = guitar_body13
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_body_style13_d_01.dds`
					material = guitar_body_style_13_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style13_ld_01.img`
							color = yellow_2guitar
							flags = 4
							a = 60
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style13_dtl_04.img`
							flags = 4
							color = red_2
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
							texture = `tex/models/characters/layers/cag/neck1_inlay_dots1_d_01.img`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = guitar_head01
			chosen_materials = {
				material1 = grey_3guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_headtock01_d_01.dds`
					material = guitar_head_headstock
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock01_dtl_06.img`
							flags = 36
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock01_detail_04.img`
							flags = 36
							color = red_3
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = gtr_body13_pickg03
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/pickgrd_body13_d_03.dds`
					material = pckgrd_body13_03_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/pickgrd_body13_ld_06.img`
							flags = 4
							color = red_2
						}
					]
				}
			]
		}
		cas_guitar_bridges = {
			desc_id = gtr_hardware01b
			chosen_materials = {
				material1 = grey_3guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr13_knob_type10_02
			chosen_materials = {
				material1 = grey_4guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_type4_03
			chosen_materials = {
				material1 = black_1guitar
			}
		}
	}
	{
		genre = [
			goth
			rock
			punk
			`glam rock`
			pop
			`classic rock`
		]
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
							color = orange_4
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style14_dtl_03.img`
							flags = 4
							color = red_orange_1
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
							color = grey_1
							texture = `tex/models/characters/layers/cag/neck1_inlay_dots1_d_01.img`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = guitar_head09
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_headtock09_d_01.dds`
					material = guitar_head_09_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock09_ld_01.img`
							color = red_orange_1
							flags = 36
							a = 80
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock09_dtl_01.img`
							flags = 36
							color = red_1
						}
					]
				}
			]
			chosen_materials = {
				material1 = orange_4
			}
		}
		cas_guitar_pickguards = {
			desc_id = gtr_body14_pickg02
		}
		cas_guitar_bridges = {
			desc_id = gtr_hardware05
			chosen_materials = {
				material1 = orange_4
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr14_knob_type10_04
			chosen_materials = {
				material1 = orange_4
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_type3b_03
			chosen_materials = {
				material1 = black_1guitar
			}
		}
	}
	{
		genre = [
			goth
			`heavy metal`
			`glam rock`
			pop
		]
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
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style15_dtl_04.img`
							flags = 4
							color = teal_1
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
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = guitar_head06
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_headtock06_d_01.dds`
					material = guitar_head_06_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock06_ld_01.img`
							flags = 36
							color = teal_4
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock06_dtl_04.img`
							flags = 36
							color = teal_1
						}
					]
				}
			]
			chosen_materials = {
				material1 = teal_5
			}
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr_hardware07
			chosen_materials = {
				material1 = teal_5
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr15_knob_type3_03
			chosen_materials = {
				material1 = grey_3guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickups_style_01c
			chosen_materials = {
				material1 = black_1guitar
			}
		}
	}
	{
		genre = [
			rock
			`glam rock`
			`classic rock`
		]
		cas_guitar_body = {
			desc_id = guitar_body05
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_body_style5_d_01.dds`
					material = guitar_body_style_05_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style5_ld_14.img`
							flags = 4
							color = green_3guitar
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style5_dtl_01.img`
							flags = 4
							color = yellow_green_3guitar
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
							texture = `tex/models/characters/layers/cag/neck1_inlay_shards_d_12.img`
							flags = 36
							color = grey_3guitar
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = guitar_head05
			chosen_materials = {
				material1 = yellow_4guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_headtock05_d_01.dds`
					material = guitar_head_05_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock05_ld_01.img`
							flags = 36
							color = green_1guitar
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock05_dtl_01.img`
							flags = 36
							color = yellow_green_3guitar
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = gtr_body5_pickg01
		}
		cas_guitar_bridges = {
			desc_id = gtr_hardware01a
			chosen_materials = {
				material1 = yellow_4guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr4_knob_type1_04
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_type1_blk_3
			chosen_materials = {
				material1 = green_1guitar
			}
		}
	}
	{
		genre = [
			goth
			`black metal`
			`heavy metal`
		]
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
							texture = `tex/models/characters/layers/cag/gtr_body_style7_dtl_81.img`
							flags = 4
							color = grey_2guitar
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
							flags = 36
							color = grey_2guitar
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = guitar_head02
			chosen_materials = {
				material1 = grey_2guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_headtock02_d_01.dds`
					material = headstock2_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock02_ld_01.img`
							flags = 36
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock02_dtl_01.img`
							flags = 36
							color = grey_2guitar
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
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr7_knob_type5_03
			chosen_materials = {
				material1 = grey_3guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_type6_tkd_03
			chosen_materials = {
				material1 = black_1guitar
			}
		}
	}
	{
		genre = [
			rock
			`classic rock`
		]
		cas_guitar_body = {
			desc_id = guitar_body08
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_body_style8_d_01.dds`
					material = guitar_body_style_08_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style8_ld_69.img`
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
							texture = `tex/models/characters/layers/cag/neck1_inlay_diamonds_d_16.img`
							flags = 36
							color = grey_2guitar
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = guitar_head08
			chosen_materials = {
				material1 = grey_2guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_headtock08_d_01.dds`
					material = guitar_head_08_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock08_ld_01.img`
							color = red_1
							flags = 36
							a = 75
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
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr8_knob_type4_03
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_type6_tkd_03
			chosen_materials = {
				material1 = black_1guitar
			}
		}
	}
	{
		genre = [
			rock
			`classic rock`
			`heavy metal`
		]
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
							flags = 36
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
							flags = 36
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock05_dtl_06.img`
							flags = 36
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
	}
	{
		genre = [
			rock
			`glam rock`
			`heavy metal`
		]
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
							flags = 36
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
							flags = 36
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
							flags = 36
							color = yellow_green_3guitar
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock02_dtl_02.img`
							flags = 36
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
			desc_id = gtr2_knob_type2_04
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
	{
		genre = [
			rock
			`glam rock`
		]
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
							flags = 36
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
							flags = 36
							color = red_2
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock10_dtl_01.img`
							flags = 36
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
			desc_id = gtr_pickup_type1_blk_2
			chosen_materials = {
				material1 = red_1
			}
		}
	}
	{
		genre = [
			pop
			`glam rock`
		]
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
							flags = 36
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
							flags = 36
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
	}
	{
		genre = [
			punk
		]
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
							flags = 36
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
	}
	{
		genre = [
			goth
			`black metal`
			`heavy metal`
		]
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
							flags = 36
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
							flags = 36
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock09_dtl_01.img`
							flags = 36
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
	}
	{
		genre = [
			`black metal`
			metal
		]
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
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style2_d_04.img`
							flags = 4
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = guitar_neck07
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/neck_stone_tb_07.dds`
					material = guitar_neck7_primary
					diffuse
					pre_layer = [
						{
							color = grey_1
							texture = `tex/models/characters/layers/cag/gtr_nek_binding_dtl.img`
							flags = 36
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
							flags = 36
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock02_dtl_01.img`
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
			desc_id = gtr_hardware01b
		}
		cas_guitar_knobs = {
			desc_id = gtr2_knob_type7_04
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickups_style_01c
		}
	}
	{
		genre = [
			pop
		]
		cas_guitar_body = {
			desc_id = guitar_body15
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_body_style15_d_01.dds`
					material = guitar_body_style_15_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style15_ld_41.img`
							flags = 4
							color = violet_4
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style15_dtl_01.img`
							color = teal_1
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
							texture = `tex/models/characters/layers/cag/neck1_inlay_dotbinding_d_76.img`
							flags = 36
							color = blue_2
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = guitar_head04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_headtock04_d_01.dds`
					material = guitar_head_04_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock04_ld_01.img`
							flags = 36
							color = violet_2
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock04_dtl_04.img`
							flags = 36
							color = blue_1
						}
					]
				}
			]
			chosen_materials = {
				material1 = grey_5guitar
			}
		}
		cas_guitar_pickguards = {
			desc_id = gtr_body15_pickg01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/pickgrd_body15_d_01.dds`
					material = pckgrd_body15_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/pickgrd_body15_ld_01.img`
							flags = 4
							color = blue_2
						}
					]
				}
			]
		}
		cas_guitar_bridges = {
			desc_id = gtr_hardware07
			chosen_materials = {
				material1 = grey_5guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr15_knob_type2_03
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_type2_03
			chosen_materials = {
				material1 = blue_5
			}
		}
	}
	{
		genre = [
			pop
			rock
			`classic rock`
		]
		cas_guitar_body = {
			desc_id = guitar_body10
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_body_style10_d_01.dds`
					material = guitar_body_style_10_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style10_ld_01.img`
							flags = 4
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style10_dtl_23.img`
							flags = 4
							color = red_4
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
							texture = `tex/models/characters/layers/cag/neck1_inlay_vine1_d_03.img`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = guitar_head09
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_headtock09_d_01.dds`
					material = guitar_head_09_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock09_ld_01.img`
							flags = 36
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock09_dtl_06.img`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = gtr_body10_pickg02
		}
		cas_guitar_bridges = {
			desc_id = gtr_hardware01a
		}
		cas_guitar_knobs = {
			desc_id = none
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_type2_03
		}
	}
	{
		genre = [
			rock
			`classic rock`
			metal
		]
		cas_guitar_body = {
			desc_id = guitar_body01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_body_style1_d_01.dds`
					material = guitar_body_style_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style1_ld_41.img`
							flags = 4
							color = grey_3guitar
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style1_dtl_22.img`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = guitar_neck05
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/neck_maple_tb_05.dds`
					material = guitar_neck5_primary
					diffuse
					pre_layer = [
						{
							color = grey_1
							texture = `tex/models/characters/layers/cag/all_clear.img`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = guitar_head07
			chosen_materials = {
				material1 = grey_2guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_headtock07_d_01.dds`
					material = guitar_head_07_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock07_ld_01.img`
							flags = 36
							color = yellow_orange_1
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock07_dtl_06.img`
							flags = 36
							color = yellow_1guitar
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = gtr_body1_pickg03
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/pickgrd3_body1_d_01.dds`
					material = gtr_pckgrd3_body1_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/pickgrd3_body1_ld_04.img`
							flags = 4
							color = grey_3guitar
						}
					]
				}
			]
		}
		cas_guitar_bridges = {
			desc_id = gtr_hardware05
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr1_knob_type10_04
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_type6_tkd_01
			chosen_materials = {
				material1 = black_1guitar
			}
		}
	}
	{
		genre = [
			goth
			pop
		]
		cas_guitar_body = {
			desc_id = guitar_body03
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_body_style3_d_01.dds`
					material = guitar_body_style_03_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style3_ld_15.img`
							flags = 4
							color = teal_3
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style3_dtl_81.img`
							flags = 4
							color = purple_blue_2
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = guitar_neck05
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/neck_maple_tb_05.dds`
					material = guitar_neck5_primary
					diffuse
					pre_layer = [
						{
							color = grey_1
							texture = `tex/models/characters/layers/cag/gtr_nek_binding_dtl.img`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = guitar_head20
			chosen_materials = {
				material1 = black_1guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_headtock20_d_01.dds`
					material = guitar_head_20_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock20_ld_01.img`
							flags = 36
							color = teal_3
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock20_dtl_02.img`
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
			desc_id = gtr_hardware01a
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr3_knob_type3_03
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_type5_01
			chosen_materials = {
				material1 = black_1guitar
			}
		}
	}
	{
		genre = [
			`classic rock`
		]
		cas_guitar_body = {
			desc_id = guitar_body12
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_body_style12_d_01.dds`
					material = guitar_body_style_12_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style12_ld_41.img`
							flags = 4
							color = orange_4
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style12_dtl_01.img`
							color = red_1
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
							texture = `tex/models/characters/layers/cag/neck1_inlay_dots1_d_01.img`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = guitar_head06
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_headtock06_d_01.dds`
					material = guitar_head_06_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/all_clear.img`
							flags = 36
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock06_dtl_06.img`
							flags = 36
						}
					]
				}
			]
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
							texture = `tex/models/characters/layers/cag/all_clear.img`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_bridges = {
			desc_id = gtr_hardware07
		}
		cas_guitar_knobs = {
			desc_id = gtr12_knob_type2_04
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_type4_02
		}
	}
	{
		genre = [
			`black metal`
			metal
			rock
		]
		cas_guitar_body = {
			desc_id = guitar_body01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_body_style1_d_01.dds`
					material = guitar_body_style_01_primary
					diffuse
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics010.img`
							x_trans = -33
							y_trans = 24
							x_scale = 21
							y_scale = 35
							rot = 2850
							flags = 27
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics010.img`
							y_trans = 24
							x_scale = 21
							y_scale = 35
							rot = 3100
							flags = 27
							x_trans = -29
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics010.img`
							y_trans = 24
							x_skew = -15
							y_skew = 0
							x_scale = 21
							y_scale = 35
							rot = 3550
							flags = 27
							x_trans = -27
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon007.img`
							color = grey_5guitar
							x_trans = -31
							y_trans = 10
							x_scale = 71
							y_scale = 25
							rot = 5333
							flags = 3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon007.img`
							color = black_1guitar
							x_trans = -31
							x_scale = 71
							y_scale = 25
							rot = 5333
							flags = 3
							y_trans = 9
						}
					]
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style1_ld_23.img`
							flags = 4
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style1_dtl_02.img`
							color = red_1
							flags = 4
							a = 45
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
							flags = 36
							color = red_1
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = guitar_head12
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_headtock12_d_01.dds`
					material = guitar_head_12_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock12_ld_01.img`
							flags = 36
							color = red_1
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock12_dtl_06.img`
							flags = 36
						}
					]
				}
			]
			chosen_materials = {
				material1 = red_1
			}
		}
		cas_guitar_pickguards = {
			desc_id = guitar_pickg01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/pickgrd1_body1_d_01.dds`
					material = gtr_body1_pickgrd_01_primary
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
				material1 = red_1
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr1_knob_type8_04
			chosen_materials = {
				material1 = grey_5guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_type1_blk_3
			chosen_materials = {
				material1 = black_1guitar
			}
		}
	}
	{
		genre = [
			glam
			pop
		]
		cas_guitar_body = {
			desc_id = guitar_body15
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_body_style15_d_01.dds`
					material = guitar_body_style_15_primary
					diffuse
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
							color = grey_5guitar
							y_trans = -1
							x_scale = 116
							y_scale = 6
							rot = 1450
							flags = 3
							x_trans = -29
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
							color = blue_2
							x_trans = -10
							y_trans = 3
							y_scale = 5
							rot = 5133
							flags = 3
							x_scale = 81
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
							color = blue_2
							y_trans = 3
							x_scale = 81
							y_scale = 5
							rot = 450
							flags = 3
							x_trans = -5
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
							color = yellow_2guitar
							x_trans = -5
							y_trans = 3
							x_scale = 91
							y_scale = 1
							flags = 3
							rot = 1250
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
							color = yellow_2guitar
							x_trans = -38
							y_trans = -5
							y_scale = 1
							rot = 1650
							flags = 3
							x_scale = 116
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
							color = yellow_2guitar
							x_trans = -38
							x_scale = 116
							y_scale = 1
							rot = 1450
							flags = 3
							y_trans = -1
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
							color = grey_5guitar
							x_trans = -20
							y_trans = -1
							x_scale = 116
							y_scale = 1
							flags = 3
							rot = 1800
						}
					]
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style15_ld_01.img`
							flags = 4
							color = violet_1
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
			desc_id = guitar_neck03
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/neck_maple_tb_03.dds`
					material = guitar_neck3_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/neck1_inlay_birds_d_08.img`
							flags = 36
							color = yellow_1guitar
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
							flags = 36
							color = violet_1
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock10_dtl_06.img`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = gtr_body15_pickg01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/pickgrd_body15_d_01.dds`
					material = pckgrd_body15_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/pickgrd_body15_ld_01.img`
							flags = 4
							color = violet_5
						}
					]
				}
			]
		}
		cas_guitar_bridges = {
			desc_id = gtr_hardware01b
		}
		cas_guitar_knobs = {
			desc_id = gtr15_knob_type1_03
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_type2_03
		}
	}
	{
		genre = [
			punk
			rock
		]
		cas_guitar_body = {
			desc_id = guitar_body11
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_body_style11_d_01.dds`
					material = guitar_body_style_11_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style11_ld_60.img`
							flags = 4
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style11_dtl_22.img`
							flags = 4
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = guitar_neck05
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/neck_maple_tb_05.dds`
					material = guitar_neck5_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/neck1_inlay_wedge2_d_11.img`
							flags = 36
							color = grey_5guitar
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = guitar_head14
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_headtock14_d_01.dds`
					material = guitar_head_14_primary
					diffuse
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_elemental003.img`
							x_trans = -3
							x_scale = 81
							y_scale = 35
							rot = 1600
							flags = 3
							y_trans = -3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics005.img`
							y_trans = 12
							x_scale = 46
							y_scale = 70
							rot = 2800
							flags = 3
							x_trans = -28
						}
					]
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock14_dtl_01.img`
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
			desc_id = gtr_hardware06
		}
		cas_guitar_knobs = {
			desc_id = gtr11_knob_type4_03
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_type2_03
		}
	}
	{
		genre = [
			`classic rock`
		]
		cas_guitar_body = {
			desc_id = guitar_body13
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_body_style13_d_01.dds`
					material = guitar_body_style_13_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style13_ld_42.img`
							flags = 4
							color = orange_3
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style13_dtl_23.img`
							flags = 4
							color = yellow_orange_2
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
							texture = `tex/models/characters/layers/cag/neck1_inlay_dots1_d_01.img`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = guitar_head07
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_headtock07_d_01.dds`
					material = guitar_head_07_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock07_ld_01.img`
							flags = 36
							color = yellow_orange_1
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock07_dtl_06.img`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = gtr_body13_pickg03
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/pickgrd_body13_d_03.dds`
					material = pckgrd_body13_03_primary
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
			desc_id = gtr_hardware01b
		}
		cas_guitar_knobs = {
			desc_id = gtr13_knob_type7_02
			chosen_materials = {
				material1 = grey_5guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickups_style_01a
			chosen_materials = {
				material1 = black_1guitar
			}
		}
	}
	{
		genre = [
			metal
			`black metal`
			rock
		]
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
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style2_dtl_21.img`
							flags = 4
							color = grey_5guitar
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
							texture = `tex/models/characters/layers/cag/neck1_inlay_tribal2_d_20.img`
							flags = 36
							color = grey_5guitar
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
							flags = 36
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock02_dtl_06.img`
							flags = 36
						}
					]
				}
			]
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_pickguards = {
			desc_id = gtr_body2_pickg02
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/pickgrd1_body2_02.dds`
					material = gtr_body2_pckgrd2_primary
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
			desc_id = gtr_hardware01a
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr2_knob_type3_04
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_type1_blk_3
			chosen_materials = {
				material1 = black_1guitar
			}
		}
	}
	{
		genre = [
			metal
			`black metal`
			rock
			pop
		]
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
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style2_d_04.img`
							flags = 4
						}
					]
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon001.img`
							y_trans = -33
							x_scale = 36
							y_scale = 95
							flags = 3
							x_trans = -34
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon002.img`
							x_trans = -31
							y_trans = 25
							x_scale = 31
							y_scale = 70
							flags = 3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon002.img`
							x_trans = -22
							x_scale = 41
							y_scale = 100
							flags = 19
							y_trans = -6
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
							texture = `tex/models/characters/layers/cag/neck1_inlay_dotbinding_d_76.img`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = guitar_head02
			chosen_materials = {
				material1 = grey_2guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_headtock02_d_01.dds`
					material = headstock2_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock02_ld_01.img`
							flags = 36
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock02_dtl_01.img`
							flags = 36
						}
					]
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon012.img`
							x_trans = -34
							x_scale = 51
							y_scale = 65
							rot = 5383
							flags = 3
							y_trans = -1
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
		}
		cas_guitar_knobs = {
			desc_id = gtr2_knob_type8_04
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickups_style_01b
			chosen_materials = {
				material1 = black_1guitar
			}
		}
	}
	{
		genre = [
			metal
			`black metal`
			rock
			pop
		]
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
							color = yellow_3guitar
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style12_dtl_21.img`
							flags = 4
							color = violet_3
						}
					]
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001.img`
							color = black_1guitar
							x_trans = -39
							y_trans = 21
							x_scale = 21
							y_scale = 45
							flags = 3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001.img`
							color = yellow_1guitar
							x_trans = -39
							y_trans = 21
							x_scale = 16
							flags = 3
							y_scale = 35
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_039.img`
							color = black_1guitar
							y_trans = 28
							x_scale = 6
							y_scale = 5
							flags = 3
							x_trans = -36
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_039.img`
							color = black_1guitar
							x_trans = -43
							x_scale = 6
							y_scale = 5
							flags = 3
							y_trans = 28
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_005.img`
							color = black_1guitar
							y_trans = 14
							x_scale = 11
							y_scale = 20
							flags = 19
							x_trans = -42
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_005.img`
							color = black_1guitar
							x_trans = -36
							y_trans = 14
							x_scale = 11
							y_scale = 20
							flags = 27
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
							color = grey_1
							texture = `tex/models/characters/layers/cag/gtr_nek_binding_dtl.img`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = guitar_head99
			chosen_materials = {
				material1 = violet_2
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_headtock099.dds`
					material = guitar_head_99_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock099_wht.img`
							flags = 36
							color = yellow_3guitar
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock099_dtl_02.img`
							flags = 36
							color = purple_blue_1
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = gtr_body12_pickg02
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/pickgrd_body12_d_02.dds`
					material = pckgrd_body12_02_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/pickgrd_body12_ld_05.img`
							flags = 4
							color = yellow_3guitar
						}
					]
				}
			]
		}
		cas_guitar_bridges = {
			desc_id = gtr_hardware05
			chosen_materials = {
				material1 = violet_2
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr12_knob_type4_04
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickups_style_01c
			chosen_materials = {
				material1 = violet_1
			}
		}
	}
	{
		genre = [
			`classic rock`
			rock
		]
		cas_guitar_body = {
			desc_id = guitar_body05
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_body_style5_d_01.dds`
					material = guitar_body_style_05_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style5_ld_11.img`
							flags = 4
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style5_dtl_22.img`
							flags = 4
						}
					]
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon022.img`
							color = black_1guitar
							x_trans = -19
							x_scale = 51
							y_scale = 105
							flags = 3
							y_trans = 6
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon022.img`
							color = black_1guitar
							x_trans = -19
							x_scale = 51
							y_scale = 105
							flags = 3
							y_trans = 2
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon022.img`
							x_trans = -19
							y_trans = 4
							x_scale = 51
							y_scale = 105
							flags = 3
							color = grey_2guitar
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
							texture = `tex/models/characters/layers/cag/neck1_inlay_skulls_d_21.img`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = guitar_head07
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_headtock07_d_01.dds`
					material = guitar_head_07_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/all_clear.img`
							flags = 36
						}
						{
							texture = `tex/models/characters/layers/cag/all_clear2.img`
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
			desc_id = gtr_hardware01a
		}
		cas_guitar_knobs = {
			desc_id = gtr4_knob_type7_04
			chosen_materials = {
				material1 = grey_3guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickups_style_01b
			chosen_materials = {
				material1 = black_1guitar
			}
		}
	}
	{
		genre = [
			glam
		]
		cas_guitar_body = {
			desc_id = guitar_body04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_body_style4_d_01.dds`
					material = guitar_body_style_04_primary
					diffuse
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
							color = black_1guitar
							x_trans = -23
							x_scale = 71
							y_scale = 10
							rot = 300
							flags = 3
							y_trans = -10
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
							color = black_1guitar
							x_trans = -23
							x_scale = 71
							y_scale = 10
							rot = 5983
							flags = 3
							y_trans = 9
						}
					]
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style4_ld_01.img`
							flags = 4
							color = green_3guitar
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
			desc_id = guitar_neck01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/neck_maple_tb_01.dds`
					material = guitar_neck1_primary
					diffuse
					pre_layer = [
						{
							color = grey_1
							texture = `tex/models/characters/layers/cag/neck1_inlay_dancers_d_22.img`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = guitar_head07
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_headtock07_d_01.dds`
					material = guitar_head_07_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock07_ld_01.img`
							flags = 36
							color = green_3guitar
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock07_dtl_03.img`
							flags = 36
							color = black_1guitar
						}
					]
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
							color = black_1guitar
							x_trans = -16
							y_trans = -5
							x_scale = 86
							flags = 3
							y_scale = 25
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
		}
		cas_guitar_knobs = {
			desc_id = none
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickups_style_01b
		}
	}
	{
		genre = [
			glam
		]
		cas_guitar_body = {
			desc_id = guitar_body11
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_body_style11_d_01.dds`
					material = guitar_body_style_11_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style11_ld_01.img`
							color = red_3
							flags = 4
							a = 70
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style11_dtl_01.img`
							color = black_1guitar
						}
					]
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics077.img`
							color = black_1guitar
							x_trans = -15
							y_trans = -7
							x_scale = 46
							flags = 3
							y_scale = 50
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
							texture = `tex/models/characters/layers/cag/neck1_inlay_hearts_d_13.img`
							flags = 36
							color = red_4
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = guitar_head07
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_headtock07_d_01.dds`
					material = guitar_head_07_primary
					diffuse
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
							color = black_1guitar
							x_trans = -16
							y_trans = -5
							x_scale = 86
							flags = 3
							y_scale = 25
						}
					]
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock07_ld_01.img`
							flags = 36
							color = red_4
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock07_dtl_03.img`
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
			desc_id = gtr_hardware01a
		}
		cas_guitar_knobs = {
			desc_id = none
		}
	}
	{
		genre = [
			`classic rock`
			rock
			glam
		]
		cas_guitar_body = {
			desc_id = guitar_body10
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_body_style10_d_01.dds`
					material = guitar_body_style_10_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style10_ld_66.img`
							flags = 4
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style10_dtl_21.img`
							flags = 4
							color = red_3
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
							color = grey_1
							texture = `tex/models/characters/layers/cag/neck1_inlay_shards_d_12.img`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = guitar_head09
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_headtock09_d_01.dds`
					material = guitar_head_09_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock09_ld_01.img`
							flags = 36
							color = red_2
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock09_dtl_01.img`
							flags = 36
							color = red_3
						}
					]
				}
			]
			chosen_materials = {
				material1 = grey_3guitar
			}
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			container_id = generic_menu
			part = cas_guitar_bridges
			desc_id = gtr_hardware07
			chosen_materials = {
				material1 = grey_3guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr10_knob_type1_03
			chosen_materials = {
				material1 = black_1guitar
			}
		}
		cas_guitar_pickups = {
			container_id = generic_menu
			part = cas_guitar_pickups
			desc_id = gtr_pickup_type6_tkd_03
			chosen_materials = {
				material1 = red_1
			}
		}
	}
	{
		genre = [
			`classic rock`
			rock
		]
		cas_guitar_body = {
			desc_id = guitar_body09
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_body_style9_d_01.dds`
					material = guitar_body_style_09_primary
					diffuse
					pre_layer = [
						{
							color = orange_5
							texture = `tex/models/characters/layers/cag/gtr_body_style9_ld_41.img`
							flags = 4
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style9_dtl_02.img`
							a = 25
							flags = 4
							color = orange_4
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
							texture = `tex/models/characters/layers/cag/neck1_inlay_dotbinding_d_76.img`
							flags = 36
							color = grey_2guitar
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = guitar_head15
			chosen_materials = {
				material1 = grey_3guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_headtock15_d_01.dds`
					material = guitar_head_15_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock15_ld_01.img`
							color = yellow_orange_1
							flags = 36
							a = 75
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock15_dtl_06.img`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = gtr_body9_pickg02
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/pickgrd_body9_d_02.dds`
					material = pckgrd_body9_02_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/pickgrd_body9_ld_05.img`
							flags = 4
							color = teal_1
						}
					]
				}
			]
		}
		cas_guitar_bridges = {
			desc_id = gtr_hardware01b
			chosen_materials = {
				material1 = grey_3guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr9_knob_type4_03
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_type1_blk_2
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
	}
	{
		genre = [
			glam
			pop
			rock
		]
		cas_guitar_body = {
			desc_id = guitar_body10
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_body_style10_d_01.dds`
					material = guitar_body_style_10_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style10_ld_42.img`
							flags = 4
							color = teal_1
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style10_dtl_82.img`
							flags = 4
							color = green_3guitar
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
							texture = `tex/models/characters/layers/cag/neck1_inlay_wedge1_d_10.img`
							flags = 36
							color = green_1guitar
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = guitar_head11
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_headtock11_d_01.dds`
					material = guitar_head_11_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock11_ld_01.img`
							flags = 36
							color = green_3guitar
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock11_dtl_01.img`
							flags = 36
							color = blue_1
						}
					]
				}
			]
			chosen_materials = {
				material1 = grey_3guitar
			}
		}
		cas_guitar_pickguards = {
			desc_id = none
		}
		cas_guitar_bridges = {
			desc_id = gtr_hardware01b
			chosen_materials = {
				material1 = grey_3guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr10_knob_type10_03
			chosen_materials = {
				material1 = green_3guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_type6_tkd_03
			chosen_materials = {
				material1 = green_2guitar
			}
		}
	}
	{
		genre = [
			`classic rock`
			rock
		]
		cas_guitar_body = {
			desc_id = guitar_body05
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_body_style5_d_01.dds`
					material = guitar_body_style_05_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style5_ld_66.img`
							flags = 4
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style5_dtl_81.img`
							a = 35
							flags = 4
							color = teal_1
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
							texture = `tex/models/characters/layers/cag/neck1_inlay_diamonds_d_16.img`
							flags = 36
							color = blue_4
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
							color = red_orange_1
							flags = 36
							a = 100
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock05_dtl_01.img`
							color = black_1guitar
							flags = 36
							a = 35
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = gtr_body5_pickg03
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/pickgrd_body5_d_03.dds`
					material = pckgrd_body5_03_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/pickgrd_body5_ld_06.img`
							flags = 4
							color = yellow_orange_2
						}
					]
				}
			]
		}
		cas_guitar_bridges = {
			desc_id = gtr_hardware01b
		}
		cas_guitar_knobs = {
			desc_id = gtr4_knob_type2_04
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_type6_tkd_02
		}
	}
	{
		genre = [
			glam
			pop
		]
		cas_guitar_body = {
			desc_id = guitar_body08
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_body_style8_d_01.dds`
					material = guitar_body_style_08_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style8_ld_41.img`
							flags = 4
							color = violet_5
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style8_dtl_82.img`
							flags = 4
							color = violet_4
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
							texture = `tex/models/characters/layers/cag/neck1_inlay_hearts_d_13.img`
							flags = 36
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
							flags = 36
							color = orange_3
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock13_dtl_03.img`
							flags = 36
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
		}
		cas_guitar_knobs = {
			desc_id = gtr8_knob_type2_03
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_type1_blktan_3
		}
	}
	{
		genre = [
			punk
			rock
			metal
		]
		cas_guitar_body = {
			desc_id = guitar_body11
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_body_style11_d_01.dds`
					material = guitar_body_style_11_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style11_ld_19.img`
							flags = 4
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style11_dtl_22.img`
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
							texture = `tex/models/characters/layers/cag/neck1_inlay_dots1_d_01.img`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = guitar_head15
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_headtock15_d_01.dds`
					material = guitar_head_15_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock15_ld_01.img`
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
			desc_id = gtr_hardware01b
		}
		cas_guitar_knobs = {
			desc_id = gtr11_knob_type10_03
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_type1_blk_3
		}
	}
	{
		genre = [
			metal
			`black metal`
			goth
		]
		cas_guitar_body = {
			desc_id = guitar_body11
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_body_style11_d_01.dds`
					material = guitar_body_style_11_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style11_ld_01.img`
							flags = 4
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style11_dtl_21.img`
							flags = 4
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = guitar_neck05
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/neck_maple_tb_05.dds`
					material = guitar_neck5_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/neck1_inlay_dancers_d_22.img`
							flags = 36
							color = yellow_orange_5
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = guitar_head15
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_headtock15_d_01.dds`
					material = guitar_head_15_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock15_ld_01.img`
							flags = 36
							color = grey_2guitar
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock15_dtl_01.img`
							flags = 36
							color = black_1guitar
						}
					]
				}
			]
			chosen_materials = {
				material1 = grey_3guitar
			}
		}
		cas_guitar_pickguards = {
			desc_id = gtr_body11_pickg01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/pickgrd_body11_d_01.dds`
					material = pckgrd_body11_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/pickgrd_body11_ld_04.img`
							flags = 4
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_guitar_bridges = {
			desc_id = gtr_hardware01b
			chosen_materials = {
				material1 = grey_3guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr11_knob_type4_03
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_type1_blk_2
			chosen_materials = {
				material1 = black_1guitar
			}
		}
	}
	{
		genre = [
			metal
			`black metal`
			goth
		]
		cas_guitar_body = {
			desc_id = guitar_body08
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_body_style8_d_01.dds`
					material = guitar_body_style_08_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style8_ld_40.img`
							flags = 4
							color = grey_2guitar
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style8_dtl_04.img`
							color = blue_2
							flags = 4
							a = 65
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
							flags = 36
							color = grey_2guitar
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = guitar_head04
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_headtock04_d_01.dds`
					material = guitar_head_04_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock04_ld_01.img`
							color = black_1guitar
							flags = 36
							a = 85
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock04_dtl_04.img`
							flags = 36
							color = navy_1
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
			desc_id = gtr_hardware01b
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr8_knob_type5_03
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_type2_04
			chosen_materials = {
				material1 = black_1guitar
			}
		}
	}
	{
		genre = [
			metal
		]
		cas_guitar_body = {
			desc_id = guitar_body11
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/gtr_body_style11_d_01.dds`
					material = guitar_body_style_11_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style11_ld_20.img`
							flags = 4
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style11_dtl_23.img`
							flags = 4
							color = red_5
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
							color = grey_1
							texture = `tex/models/characters/layers/cag/neck1_inlay_lightning_d_25.img`
							flags = 36
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
							texture = `tex/models/characters/layers/cag/gtr_headtock098.img`
							flags = 36
							color = teal_1
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock099_dtl_04.img`
							flags = 36
							color = red_1
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
			desc_id = gtr_hardware07
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr11_knob_type3_03
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickup_type6_tkd_02
			chosen_materials = {
				material1 = black_1guitar
			}
		}
	}
]
cas_preset_basses = [
	{
		genre = [
			rock
			`classic rock`
		]
		cas_bass_body = {
			desc_id = bass_body_b1b
			cap = [
				{
					base_tex = `tex\models\car_instruments\bass\cab_body_b1f_d_mls.dds`
					material = cab_body_unos_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/cab_body_unos_maplespalt_gk.img`
							flags = 4
							color = blue_1
						}
						{
							texture = `tex/models/characters/layers/cab/cab_body_unos_dtl_fin.img`
							color = red_1
							flags = 4
							a = 55
						}
					]
				}
			]
		}
		cas_bass_neck = {
			desc_id = cab_neck_bfretlss03
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/cab_nekf_maple01.dds`
					material = cab_neck_fretless03_neck
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/cab_nek_vinef_d_ds.img`
							flags = 36
							color = red_1
						}
					]
				}
			]
		}
		cas_bass_head = {
			desc_id = cab_head_flay_rev
			chosen_materials = {
				material1 = yellow_4
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/cab_head_flay001.dds`
					material = cab_head_bh1a_headstock
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/cab_head_flay001_wtfinish.img`
							color = blue_1
							flags = 36
							a = 90
						}
					]
				}
			]
		}
		cas_bass_pickguards = {
			desc_id = none
		}
		cas_bass_pickups = {
			desc_id = cab_pickups_emg02
		}
		cas_bass_bridges = {
			desc_id = cab_bridge_bb2a
			chosen_materials = {
				material1 = yellow_4
			}
		}
		cas_bass_knobs = {
			desc_id = cab_knob_unos04
			chosen_materials = {
				material1 = yellow_2
			}
		}
	}
	{
		genre = [
			rock
			`classic rock`
		]
		cas_bass_body = {
			desc_id = cab_body_bandera
			cap = [
				{
					base_tex = `tex\models\car_instruments\guitars\gtr_body_style17_d.dds`
					material = guitar_body_bandera_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style17_ld_zi.img`
							flags = 4
							color = yellow_green_3
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style17_dtl_fout.img`
							color = yellow_green_1
							flags = 4
							a = 65
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
							texture = `tex/models/characters/layers/cab/cab_nek_wedgelow.img`
							flags = 36
							color = yellow_green_2
						}
					]
				}
			]
		}
		cas_bass_head = {
			desc_id = cab_head_predikt
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/cab_predikt_hstock_d.dds`
					material = cab_head_predikt_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock16_ld_01.img`
							flags = 36
							color = yellow_green_1
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_predikt_hstock01_dtl_03.img`
							flags = 36
							color = yellow_1
						}
					]
				}
			]
			chosen_materials = {
				material1 = yellow_1
			}
		}
		cas_bass_pickguards = {
			desc_id = cab_phnq_pg002
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/cab_phnq_pg001b.dds`
					material = cab_phnq_pg002_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/cab_phnq_pg001_tort.img`
							flags = 36
							color = yellow_green_1
						}
					]
				}
			]
		}
		cas_bass_pickups = {
			desc_id = cab_pickups_bp1a
		}
		cas_bass_bridges = {
			desc_id = cab_bridge_bb1a
			chosen_materials = {
				material1 = yellow_1
			}
		}
		cas_bass_knobs = {
			desc_id = cab_knob_phunq02
			chosen_materials = {
				material1 = yellow_green_2
			}
		}
	}
	{
		genre = [
			`glam rock`
			pop
		]
		cas_bass_body = {
			desc_id = cab_body_phunq01
			cap = [
				{
					base_tex = `tex\models\car_instruments\bass\cab_body_beech01_b1_d_mls.dds`
					material = cab_body_bubinga01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/cab_body_phungwht_d_mls.img`
							flags = 4
							color = yellow_2
						}
						{
							texture = `tex/models/characters/layers/cab/cab_body_phunq_ray02.img`
							flags = 4
							color = purple_blue_1
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
							texture = `tex/models/characters/layers/cab/cab_nek_barbwire.img`
							flags = 36
							color = teal_1
						}
					]
				}
			]
		}
		cas_bass_head = {
			desc_id = cab_head_radex
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/cab_head_radex.dds`
					material = cab_head_radex_headstock
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/cab_head_radex_wt.img`
							flags = 36
							color = red_orange_3
						}
					]
				}
			]
			chosen_materials = {
				material1 = blue_2
			}
		}
		cas_bass_pickguards = {
			desc_id = none
		}
		cas_bass_pickups = {
			desc_id = cab_bumbl_pickup_a2
		}
		cas_bass_bridges = {
			desc_id = cab_bridge_hack
			chosen_materials = {
				material1 = blue_2
			}
		}
		cas_bass_knobs = {
			desc_id = cab_knob_phunq06
			chosen_materials = {
				material1 = yellow_4
			}
		}
	}
	{
		genre = [
			rock
			`classic rock`
		]
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
							a = 60
							color = yellow_3guitar
						}
						{
							texture = `tex/models/characters/layers/cab/cab_bach_ray01.img`
							color = red_1
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
							flags = 36
							color = yellow_3guitar
						}
					]
				}
			]
		}
		cas_bass_head = {
			desc_id = cab_head_guppy
			chosen_materials = {
				material1 = green_2guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/cab_head_guppy_d.dds`
					material = cab_head_guppy_headstock
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/cab_head_guppy_wt.img`
							flags = 36
							color = red_1
						}
						{
							texture = `tex/models/characters/layers/cab/cab_head_guppy_dtl_01.img`
							flags = 36
							color = yellow_2guitar
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
							texture = `tex/models/characters/layers/cab/cab_pickg_f4_d_mls.img`
							flags = 36
						}
					]
				}
			]
		}
		cas_bass_pickups = {
			desc_id = cab_jp_pickup_b
		}
		cas_bass_bridges = {
			desc_id = cab_bridge_hack
			chosen_materials = {
				material1 = green_2guitar
			}
		}
		cas_bass_knobs = {
			desc_id = cab_knob_hack01
			chosen_materials = {
				material1 = green_2guitar
			}
		}
	}
	{
		genre = [
			`glam rock`
			pop
		]
		cas_bass_body = {
			desc_id = cab_body_kelly
			cap = [
				{
					base_tex = `tex\models\car_instruments\bass\cab_body_kelly_d_mls.dds`
					material = cab_kelly_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/cab_body_kelly_ld_16.img`
							flags = 4
							color = blue_5
						}
						{
							texture = `tex/models/characters/layers/cab/cab_body_kelly_dtl_fin.img`
							a = 40
							flags = 4
							color = yellow_1guitar
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
							texture = `tex/models/characters/layers/cab/cab_nek_lyr_scallops.img`
							flags = 36
							color = blue_5
						}
					]
				}
			]
		}
		cas_bass_head = {
			desc_id = cab_head_bh1a
			chosen_materials = {
				material1 = yellow_green_5guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/cab_head_01_maple_d_mls.dds`
					material = cab_head_bh2a_headstock
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/cab_head_gedulus_wtfinish.img`
							flags = 36
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/layers/cab/cab_head_gedulus_dtl_05.img`
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
			desc_id = cab_bumbl_pickup_a2
		}
		cas_bass_bridges = {
			desc_id = cab_bridge_mls
			chosen_materials = {
				material1 = yellow_green_5guitar
			}
		}
		cas_bass_knobs = {
			desc_id = cab_knob_grmbl03
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
	}
	{
		genre = [
			rock
			`classic rock`
		]
		cas_bass_body = {
			desc_id = cab_body_grmbl_a
			cap = [
				{
					base_tex = `tex\models\car_instruments\bass\cab_body_grumbel01_d_mls.dds`
					material = cab_body_grmbl_a_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/cab_body_grumbel10_d_mls.img`
							color = yellow_1guitar
							a = 55
						}
						{
							texture = `tex/models/characters/layers/cab/cab_body_grumbel_dtl_tri.img`
							flags = 4
							color = red_2
						}
					]
				}
			]
		}
		cas_bass_neck = {
			desc_id = cab_stnek_bnst01
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/cab_neck_01b_rosewood_d_mls.dds`
					material = cab_tneck_bnt01_neck
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/cab_nek_lyrmpl_blk_wht.img`
							flags = 36
							color = blue_5
						}
					]
				}
			]
		}
		cas_bass_head = {
			desc_id = cab_head_grumbel01
			chosen_materials = {
				material1 = grey_4guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/cab_head_grumbel01.dds`
					material = cab_head_grumbel01_headstock
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/cab_head_grumbel01_wtfinish.img`
							color = yellow_3guitar
							flags = 36
							a = 5
						}
						{
							texture = `tex/models/characters/layers/cab/cab_head_grumbel01_dtl_04.img`
							flags = 36
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
			desc_id = cab_bumbl_pickup_a3
		}
		cas_bass_bridges = {
			desc_id = cab_bridge_mls
			chosen_materials = {
				material1 = grey_4guitar
			}
		}
		cas_bass_knobs = {
			desc_id = cab_knob_grmbl09
			chosen_materials = {
				material1 = orange_2
			}
		}
	}
	{
		genre = [
			rock
			`classic rock`
			`glam rock`
			pop
		]
		cas_bass_body = {
			desc_id = cab_body_b2a
			cap = [
				{
					base_tex = `tex\models\car_instruments\bass\cab_body_b1a_d_mls.dds`
					material = cab_body_arcos_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/cab_body_arks_ld_zi.img`
							flags = 4
							color = teal_1
						}
						{
							texture = `tex/models/characters/layers/cab/cab_body_arcos_dtl_pin.img`
							flags = 4
							color = red_orange_1
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
							texture = `tex/models/characters/layers/cab/cab_nek_country.img`
							flags = 36
							color = orange_3
						}
					]
				}
			]
		}
		cas_bass_head = {
			desc_id = cab_head_bhphnq01
			chosen_materials = {
				material1 = orange_4
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/cab_head_bh8a.dds`
					material = cab_head_phunquie01_headstock
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/cab_head_bh8a_wtfinish.img`
							flags = 36
							color = green_1guitar
						}
						{
							texture = `tex/models/characters/layers/cab/cab_head_bh8a_dtl_01.img`
							flags = 36
							color = red_orange_1
						}
					]
				}
			]
		}
		cas_bass_pickguards = {
			desc_id = cab_pickg_bp2
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/cab_pickg_dark001.dds`
					material = cab_pickg_unos03_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/cab_pgard_wht001.img`
							flags = 36
							color = orange_5
						}
					]
				}
			]
		}
		cas_bass_pickups = {
			desc_id = cab_pickups_bp1a
		}
		cas_bass_bridges = {
			desc_id = cab_bridge_hack
			chosen_materials = {
				material1 = orange_4
			}
		}
		cas_bass_knobs = {
			desc_id = cab_knob_unos08
			chosen_materials = {
				material1 = orange_4
			}
		}
	}
	{
		genre = [
			`classic rock`
			`glam rock`
			pop
		]
		cas_bass_body = {
			desc_id = cab_body_sixtease
			cap = [
				{
					base_tex = `tex\models\car_instruments\bass\cab_body_sixtease01_d_mls.dds`
					material = cab_body_sixtease_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/cab_body_6tease_ld_13.img`
							flags = 4
							color = yellow_1guitar
						}
						{
							texture = `tex/models/characters/layers/cab/cab_body_6tease_dtl_fin.img`
							flags = 36
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
							texture = `tex/models/characters/layers/cab/cab_nek_butterflies.img`
							flags = 36
							color = red_orange_3
						}
					]
				}
			]
		}
		cas_bass_head = {
			desc_id = cab_head_sixtease
			chosen_materials = {
				material1 = teal_5
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/cab_head_sixtease_d_mls.dds`
					material = cab_head_sixtease_headstock
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/cab_head_sixtease_wtfinish.img`
							flags = 36
							color = purple_blue_1
						}
						{
							texture = `tex/models/characters/layers/cab/cab_head_sixtease_dtl_01.img`
							flags = 36
							color = purple_blue_3
						}
					]
				}
			]
		}
		cas_bass_pickguards = {
			desc_id = none
		}
		cas_bass_pickups = {
			desc_id = cab_bumbl_pickup_a1
		}
		cas_bass_bridges = {
			desc_id = cab_bridge_bb3a
			chosen_materials = {
				material1 = teal_5
			}
		}
		cas_bass_knobs = {
			desc_id = cab_knobs_6tz01
		}
	}
	{
		genre = [
			goth
			`black metal`
			`heavy metal`
		]
		cas_bass_body = {
			desc_id = cab_body_prediktor
			cap = [
				{
					base_tex = `tex\models\car_instruments\guitars\gtr_predikt_body01_d_mls.dds`
					material = guitar_body_prediktor_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style16_ld_10.img`
							color = purple_blue_1
							flags = 4
							a = 85
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style16_dtl_02.img`
							flags = 4
							color = black_1guitar
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
							texture = `tex/models/characters/layers/cab/cab_nek_skulls.img`
							flags = 36
							color = purple_blue_2
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
							flags = 36
							color = purple_blue_1
						}
						{
							texture = `tex/models/characters/layers/cab/cab_head_bh5a_dtl_03.img`
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
			desc_id = cab_bumbl_pickup_a1
		}
		cas_bass_bridges = {
			desc_id = cab_bridge_mls
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_bass_knobs = {
			desc_id = cab_knob_phunq08
			chosen_materials = {
				material1 = purple_blue_3
			}
		}
	}
	{
		genre = [
			`classic rock`
			`glam rock`
			pop
		]
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
							color = yellow_5guitar
							flags = 4
							a = 100
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
							texture = `tex/models/characters/layers/cab/cab_nek_notes.img`
							flags = 36
							color = blue_5
						}
					]
				}
			]
		}
		cas_bass_head = {
			desc_id = cab_head_bh1a
			chosen_materials = {
				material1 = grey_5guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/cab_head_01_maple_d_mls.dds`
					material = cab_head_bh2a_headstock
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/cab_head_gedulus_wtfinish.img`
							flags = 36
							color = grey_4guitar
						}
					]
				}
			]
		}
		cas_bass_pickguards = {
			desc_id = cab_phnq_pg002
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/cab_phnq_pg001b.dds`
					material = cab_phnq_pg002_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/cab_phnq_pg001_tort.img`
							flags = 36
							color = yellow_1
						}
					]
				}
			]
		}
		cas_bass_pickups = {
			desc_id = cab_jbass_pickup_01
		}
		cas_bass_bridges = {
			desc_id = cab_bridge_bb3a
			chosen_materials = {
				material1 = grey_5guitar
			}
		}
		cas_bass_knobs = {
			desc_id = cab_knob_phunq01
			chosen_materials = {
				material1 = grey_4guitar
			}
		}
	}
	{
		genre = [
			goth
		]
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
							texture = `tex/models/characters/layers/cab/cab_nek_lyr_cats.img`
							flags = 36
							color = purple_blue_1
						}
					]
				}
			]
		}
		cas_bass_head = {
			desc_id = cab_head_flay_rev
			chosen_materials = {
				material1 = purple_blue_3
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/cab_head_flay001.dds`
					material = cab_head_bh1a_headstock
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/cab_head_flay001_wtfinish.img`
							flags = 36
							color = black_1guitar
						}
					]
				}
			]
		}
		cas_bass_pickguards = {
			desc_id = cab_pickg_bp2
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/cab_pickg_dark001.dds`
					material = cab_pickg_unos03_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/cab_pgard_wht001.img`
							flags = 36
							color = grey_1
						}
					]
				}
			]
		}
		cas_bass_pickups = {
			desc_id = cab_pbass_pickup_a
		}
		cas_bass_bridges = {
			desc_id = cab_bridge_bb1a
			chosen_materials = {
				material1 = purple_blue_3
			}
		}
		cas_bass_knobs = {
			desc_id = cab_knob_unos06
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
	}
	{
		genre = [
			`classic rock`
			rock
		]
		cas_bass_body = {
			desc_id = bass_body_b1b
			cap = [
				{
					base_tex = `tex\models\car_instruments\bass\cab_body_b1f_d_mls.dds`
					material = cab_body_unos_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/cab_body_unos_cherryswirl_gk.img`
							flags = 4
							color = blue_5
						}
						{
							texture = `tex/models/characters/layers/cab/cab_body_unos_dtl_tri.img`
							color = orange_1
							flags = 4
							a = 60
						}
					]
				}
			]
		}
		cas_bass_neck = {
			desc_id = cab_neck_bn1b
		}
		cas_bass_head = {
			desc_id = cab_head_bh6b
			chosen_materials = {
				material1 = orange_3
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/cab_head_trad_delx_d.dds`
					material = cab_head_chunder01_headstock
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/cab_head_trad_delx_dtl_05.img`
							a = 100
							flags = 36
							color = yellow_orange_1
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
			desc_id = cab_bridge_bb2a
			chosen_materials = {
				material1 = orange_3
			}
		}
		cas_bass_knobs = {
			desc_id = cab_knob_unos08
			chosen_materials = {
				material1 = orange_3
			}
		}
	}
	{
		genre = [
			punk
		]
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
							color = red_1
						}
						{
							texture = `tex/models/characters/layers/cab/cab_body_chndr_dtl_trash.img`
							flags = 4
							color = green_2guitar
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
							texture = `tex/models/characters/layers/cab/cab_nek_tribal.img`
							flags = 36
							color = green_1guitar
						}
					]
				}
			]
		}
		cas_bass_head = {
			desc_id = cab_head_bh6a
			chosen_materials = {
				material1 = grey_5guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/cab_head_bh6a.dds`
					material = cab_head_chunder02_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/cab_head_bh6a_wtfinish.img`
							a = 45
							flags = 36
							color = orange_1
						}
						{
							texture = `tex/models/characters/layers/cab/cab_head_bh6a_dtl_03.img`
							flags = 36
							color = yellow_orange_1
						}
					]
				}
			]
		}
		cas_bass_pickguards = {
			desc_id = cab_pguardchndr01
		}
		cas_bass_pickups = {
			desc_id = cab_pickup_hack01
		}
		cas_bass_bridges = {
			desc_id = cab_bridge_bb3a
			chosen_materials = {
				material1 = grey_5guitar
			}
		}
		cas_bass_knobs = {
			desc_id = cab_knob_chndr10
			chosen_materials = {
				material1 = green_2guitar
			}
		}
	}
	{
		genre = [
			punk
		]
		cas_bass_body = {
			desc_id = cab_body_bandera
			cap = [
				{
					base_tex = `tex\models\car_instruments\guitars\gtr_body_style17_d.dds`
					material = guitar_body_bandera_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style17_ld_15.img`
							color = green_1guitar
							flags = 4
							a = 60
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style17_dtl_trash.img`
							color = red_2
							flags = 4
							a = 55
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
							flags = 36
							color = blue_1
						}
					]
				}
			]
		}
		cas_bass_head = {
			desc_id = cab_head_guppy
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/cab_head_guppy_d.dds`
					material = cab_head_guppy_headstock
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/cab_head_guppy_wt.img`
							flags = 36
							color = black_1guitar
						}
					]
				}
			]
			chosen_materials = {
				material1 = orange_5
			}
		}
		cas_bass_pickguards = {
			desc_id = cab_phnq_pg002
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/cab_phnq_pg001b.dds`
					material = cab_phnq_pg002_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cab/cab_phnq_pg001.img`
							flags = 36
							color = green_3
						}
					]
				}
			]
		}
		cas_bass_pickups = {
			desc_id = cab_jbass_pickup_01
		}
		cas_bass_bridges = {
			desc_id = cab_bridge_mls
			chosen_materials = {
				material1 = orange_5
			}
		}
		cas_bass_knobs = {
			desc_id = cab_knob_phunq09
			chosen_materials = {
				material1 = black_1guitar
			}
		}
	}
	{
		genre = [
			punk
			glam
			rock
			metal
			goth
		]
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
							color = red_orange_3
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_body_style16_dtl_04.img`
							color = red_orange_2
							flags = 4
							a = 75
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
							texture = `tex/models/characters/layers/cab/cab_nek_pumpkinf_d_ds.img`
							flags = 36
							color = red_orange_3
						}
					]
				}
			]
		}
		cas_bass_head = {
			desc_id = cab_head_predikt
			cap = [
				{
					base_tex = `tex/models/car_instruments/bass/cab_predikt_hstock_d.dds`
					material = cab_head_predikt_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/gtr_headtock16_ld_01.img`
							flags = 36
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/layers/cag/gtr_predikt_hstock01_dtl_01.img`
							flags = 36
							color = red_orange_2
						}
					]
				}
			]
			chosen_materials = {
				material1 = red_orange_1
			}
		}
		cas_bass_pickguards = {
			desc_id = none
		}
		cas_bass_pickups = {
			desc_id = cab_pickups_bp1a
		}
		cas_bass_bridges = {
			desc_id = cab_bridge_bb3a
			chosen_materials = {
				material1 = red_orange_1
			}
		}
		cas_bass_knobs = {
			desc_id = cab_knob_phunq09
			chosen_materials = {
				material1 = red_orange_3
			}
		}
	}
]
cas_preset_drums = [
	{
		cas_drums = {
			desc_id = basic
		}
	}
	{
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
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_63.img`
							color = yellow_5guitar
							rot = 2350
							flags = 4
							a = 80
						}
					]
				}
			]
		}
	}
	{
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
							color = yellow_1guitar
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a.dds`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_43.img`
							flags = 4
							color = orange_4
						}
					]
				}
			]
		}
	}
	{
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1.dds`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/drumshell_rm_01.img`
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
							texture = `tex/models/characters/layers/cadrm/bass_skin_gk_05.img`
							color = red_orange_5
						}
					]
				}
			]
		}
	}
	{
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
							color = teal_3
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a.dds`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_73.img`
							flags = 4
							color = red_orange_4
						}
					]
				}
			]
		}
	}
	{
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
							color = teal_3
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a.dds`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_73.img`
							flags = 4
							color = red_orange_4
						}
					]
				}
			]
		}
	}
	{
		genre = [
			glam
		]
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
							color = green_4guitar
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a.dds`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_61.img`
							flags = 4
							color = orange_3
						}
					]
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics035.img`
							y_trans = 53
							x_scale = 125
							y_scale = 80
							flags = 3
							a = 50
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics035.img`
							a = 50
							x_scale = 125
							y_scale = 80
							flags = 3
							y_trans = -60
						}
					]
				}
			]
		}
	}
	{
		genre = [
			glam
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1.dds`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/drumshell_rm_01.img`
							flags = 32
							color = yellow_2guitar
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a.dds`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_79.img`
							flags = 4
							color = green_5guitar
						}
					]
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_034.img`
							color = black_1guitar
							x_trans = -25
							x_scale = 20
							y_scale = 15
							rot = 950
							flags = 3
							y_trans = 35
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_034.img`
							x_trans = -26
							y_trans = 36
							x_scale = 20
							y_scale = 15
							rot = 950
							flags = 3
							color = yellow_1guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_034.img`
							color = black_1guitar
							x_trans = -17
							x_scale = 20
							y_scale = 15
							flags = 3
							y_trans = 21
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_034.img`
							color = red_3
							x_trans = -16
							x_scale = 20
							y_scale = 15
							flags = 3
							y_trans = 22
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_034.img`
							color = black_1guitar
							x_trans = 21
							x_scale = 20
							y_scale = 15
							rot = 350
							flags = 11
							y_trans = 26
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_034.img`
							color = green_2guitar
							x_trans = 20
							y_trans = 27
							x_scale = 20
							y_scale = 15
							rot = 350
							flags = 11
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_034.img`
							color = black_1guitar
							x_trans = 6
							x_scale = 15
							y_scale = 10
							rot = 350
							flags = 11
							y_trans = 32
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_034.img`
							x_trans = 5
							y_trans = 33
							x_scale = 15
							y_scale = 10
							rot = 350
							flags = 11
							color = teal_3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_034.img`
							color = black_1guitar
							y_trans = 9
							x_scale = 15
							y_scale = 10
							rot = 5583
							flags = 11
							x_trans = 32
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_034.img`
							color = yellow_1guitar
							y_trans = 10
							x_scale = 15
							y_scale = 10
							rot = 5583
							flags = 11
							x_trans = 31
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics097.img`
							color = yellow_3guitar
							y_trans = -12
							x_scale = 80
							y_scale = 60
							flags = 3
							a = 100
						}
					]
				}
			]
		}
	}
	{
		genre = [
			punk
			rock
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1.dds`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/drumshell_ds_50.img`
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
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_71.img`
							flags = 4
							color = red_orange_3
						}
					]
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
							color = black_1guitar
							y_trans = -28
							x_scale = 125
							flags = 3
							y_scale = 16
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
							color = black_1guitar
							x_scale = 125
							y_scale = 6
							flags = 3
							y_trans = -9
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
							color = black_1guitar
							x_scale = 125
							y_scale = 45
							flags = 3
							y_trans = 22
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_elemental004.img`
							y_trans = -39
							x_scale = 85
							y_scale = 60
							rot = 3833
							flags = 19
							x_trans = 37
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_elemental004.img`
							x_trans = -36
							x_scale = 85
							y_scale = 60
							rot = 5633
							flags = 3
							y_trans = -39
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon_wing002.img`
							x_trans = -22
							y_trans = 19
							x_scale = 40
							y_scale = 50
							rot = 250
							flags = 11
							color = green_3guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon_wing002.img`
							x_trans = 24
							y_trans = 19
							x_scale = 40
							y_scale = 50
							rot = 5983
							flags = 3
							color = green_3guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics012.img`
							flags = 3
						}
					]
				}
			]
		}
	}
	{
		genre = [
			punk
			rock
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1.dds`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/drumshell_ds_49.img`
							color = yellow_2guitar
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
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_21.img`
							color = green_2guitar
							flags = 4
							rot = 5533
						}
					]
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
							y_trans = 38
							x_scale = 5
							y_scale = 50
							flags = 3
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
							color = black_1guitar
							x_scale = 5
							y_scale = 50
							flags = 3
							y_trans = -37
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
							color = black_1guitar
							x_scale = 55
							y_scale = 5
							flags = 3
							x_trans = 40
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
							color = black_1guitar
							x_scale = 55
							y_scale = 5
							flags = 3
							x_trans = -39
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon_mammal001.img`
							color = black_1guitar
							y_trans = 19
							x_scale = 40
							y_scale = 55
							rot = 5783
							flags = 3
							x_trans = -19
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon_mammal001.img`
							color = yellow_3guitar
							x_trans = -21
							y_trans = 21
							x_scale = 40
							y_scale = 55
							flags = 3
							rot = 5783
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon_insect001.img`
							color = black_1guitar
							x_trans = -19
							x_scale = 40
							y_scale = 50
							flags = 3
							y_trans = -23
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon_insect001.img`
							color = yellow_2guitar
							x_trans = -21
							x_scale = 40
							y_scale = 50
							flags = 3
							y_trans = -22
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon_insect002.img`
							color = black_1guitar
							x_trans = 23
							x_scale = 45
							y_scale = 35
							rot = 4033
							flags = 3
							y_trans = 19
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon_insect002.img`
							color = yellow_2guitar
							x_trans = 21
							x_scale = 45
							y_scale = 35
							rot = 4033
							flags = 3
							y_trans = 21
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon_creature002.img`
							color = black_1guitar
							x_trans = 24
							x_scale = 45
							y_scale = 40
							rot = 700
							flags = 3
							y_trans = -24
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon_creature002.img`
							color = yellow_2guitar
							x_trans = 21
							y_trans = -22
							x_scale = 45
							y_scale = 40
							flags = 3
							rot = 700
						}
					]
				}
			]
		}
	}
	{
		genre = [
			punk
			rock
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1.dds`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/drumshell_ds_23.img`
							flags = 32
							color = blue_3
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
							color = red_orange_3
						}
					]
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
							color = black_1guitar
							x_scale = 20
							y_scale = 20
							flags = 3
							y_trans = -7
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
							color = black_1guitar
							x_scale = 20
							y_scale = 20
							flags = 3
							y_trans = 27
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
							color = black_1guitar
							y_trans = -24
							x_scale = 20
							y_scale = 20
							flags = 3
							x_trans = 17
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
							y_trans = -41
							x_scale = 20
							y_scale = 20
							flags = 3
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
							color = black_1guitar
							y_trans = -24
							x_scale = 20
							y_scale = 20
							flags = 3
							x_trans = -17
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
							color = black_1guitar
							y_trans = 10
							x_scale = 20
							y_scale = 20
							flags = 3
							x_trans = -17
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
							color = black_1guitar
							x_trans = -17
							x_scale = 20
							y_scale = 20
							flags = 3
							y_trans = 44
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
							color = black_1guitar
							x_trans = 17
							x_scale = 20
							y_scale = 20
							flags = 3
							y_trans = 10
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
							color = black_1guitar
							x_trans = 17
							x_scale = 20
							y_scale = 20
							flags = 3
							y_trans = 44
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
							color = black_1guitar
							y_trans = 27
							x_scale = 20
							y_scale = 20
							flags = 3
							x_trans = 34
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
							color = black_1guitar
							x_trans = 34
							x_scale = 20
							y_scale = 20
							flags = 3
							y_trans = -7
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
							color = black_1guitar
							x_trans = 34
							x_scale = 20
							y_scale = 20
							flags = 3
							y_trans = -41
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
							color = black_1guitar
							y_trans = -41
							x_scale = 20
							y_scale = 20
							flags = 3
							x_trans = -34
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
							color = black_1guitar
							x_trans = -34
							x_scale = 20
							y_scale = 20
							flags = 3
							y_trans = 27
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
							color = black_1guitar
							x_trans = -34
							y_trans = -7
							x_scale = 20
							y_scale = 20
							flags = 3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_007.img`
							y_trans = 4
							x_scale = 1
							y_scale = 155
							rot = 800
							flags = 3
							color = red_orange_3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_007.img`
							y_trans = -5
							x_scale = 1
							y_scale = 155
							rot = 800
							flags = 3
							color = red_orange_3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_007.img`
							y_trans = -30
							x_scale = 1
							y_scale = 155
							rot = 800
							flags = 3
							color = red_orange_3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_007.img`
							y_trans = -40
							x_scale = 1
							y_scale = 155
							rot = 800
							flags = 3
							color = red_orange_3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_007.img`
							y_trans = -49
							x_scale = 1
							y_scale = 155
							rot = 800
							flags = 3
							color = red_orange_3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_007.img`
							y_trans = 26
							x_scale = 1
							y_scale = 155
							rot = 800
							flags = 3
							color = red_orange_3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_007.img`
							y_trans = -16
							x_scale = 1
							y_scale = 155
							rot = 800
							flags = 3
							color = red_orange_3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_007.img`
							y_trans = 17
							x_scale = 1
							y_scale = 155
							rot = 800
							flags = 3
							color = red_orange_3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_007.img`
							y_trans = 34
							x_scale = 1
							y_scale = 155
							rot = 800
							flags = 3
							color = red_orange_3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_007.img`
							y_trans = 60
							x_scale = 1
							y_scale = 155
							rot = 800
							flags = 3
							color = red_orange_3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_007.img`
							y_trans = 53
							x_scale = 1
							y_scale = 155
							rot = 800
							flags = 3
							color = red_orange_3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics017.img`
							color = green_2guitar
							x_trans = -4
							x_scale = 85
							y_scale = 90
							flags = 11
							y_trans = 1
						}
					]
				}
			]
		}
	}
	{
		genre = [
			punk
			rock
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1.dds`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/drumshell_ds_04.img`
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
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_15.img`
							flags = 4
						}
					]
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_011.img`
							color = black_1guitar
							a = 60
							x_trans = 0
							x_scale = 20
							y_scale = 135
							rot = 5933
							flags = 19
							y_trans = -2
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_011.img`
							color = black_1guitar
							a = 60
							x_trans = -32
							x_scale = 20
							y_scale = 135
							rot = 5233
							flags = 19
							y_trans = -21
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_011.img`
							color = black_1guitar
							a = 60
							x_trans = -16
							x_scale = 20
							y_scale = 135
							rot = 5633
							flags = 19
							y_trans = -6
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_011.img`
							color = black_1guitar
							a = 60
							y_trans = -2
							x_scale = 20
							y_scale = 135
							rot = 0
							flags = 19
							x_trans = 17
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_011.img`
							color = black_1guitar
							a = 60
							y_trans = -7
							x_scale = 20
							y_scale = 135
							rot = 500
							flags = 19
							x_trans = 40
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_009.img`
							x_trans = 1
							y_trans = -13
							x_scale = 35
							y_scale = 25
							rot = 6133
							flags = 3
							color = grey_5guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_009.img`
							x_trans = -3
							x_scale = 45
							y_scale = 25
							rot = 6133
							flags = 3
							y_trans = 19
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_009.img`
							y_trans = 1
							x_scale = 45
							y_scale = 40
							rot = 6133
							flags = 19
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
							color = black_1guitar
							x_trans = -20
							y_trans = 18
							x_scale = 5
							y_scale = 25
							flags = 3
							rot = 550
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
							color = black_1guitar
							y_trans = 27
							x_scale = 5
							y_scale = 25
							rot = 1450
							flags = 3
							x_trans = -6
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
							color = black_1guitar
							x_trans = 11
							x_scale = 5
							y_scale = 25
							rot = 2300
							flags = 3
							y_trans = 22
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
							color = black_1guitar
							x_trans = 16
							x_scale = 5
							y_scale = 35
							rot = 3400
							flags = 3
							y_trans = 2
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
							color = black_1guitar
							x_trans = -16
							x_scale = 5
							y_scale = 35
							rot = 2450
							flags = 3
							y_trans = 0
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
							color = black_1guitar
							y_trans = -16
							x_scale = 5
							y_scale = 15
							rot = 3450
							flags = 3
							x_trans = -9
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
							color = black_1guitar
							y_trans = -15
							x_scale = 5
							y_scale = 10
							rot = 2650
							flags = 3
							x_trans = 14
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
							color = black_1guitar
							x_trans = 4
							x_scale = 5
							y_scale = 30
							rot = 4550
							flags = 3
							y_trans = -19
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_011.img`
							color = black_1guitar
							x_trans = 1
							y_trans = -3
							y_skew = 27
							x_scale = 10
							y_scale = 10
							flags = 3
							rot = 6183
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon026.img`
							color = black_1guitar
							x_trans = 3
							x_scale = 70
							y_scale = 35
							rot = 6183
							flags = 3
							y_trans = -28
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_011.img`
							color = black_1guitar
							x_trans = -10
							y_trans = 13
							x_scale = 5
							y_scale = 15
							flags = 3
							rot = 5550
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_011.img`
							color = black_1guitar
							x_trans = 8
							y_trans = 13
							x_scale = 5
							y_scale = 15
							rot = 600
							flags = 3
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_011.img`
							color = black_1guitar
							x_trans = 6
							x_scale = 5
							y_scale = 10
							rot = 5983
							flags = 3
							y_trans = -14
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_011.img`
							color = black_1guitar
							x_trans = -2
							x_scale = 5
							y_scale = 10
							rot = 50
							flags = 3
							y_trans = -16
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_plant_002.img`
							color = black_1guitar
							x_trans = -2
							y_trans = 16
							x_scale = 90
							y_scale = 65
							rot = 6233
							flags = 19
							a = 65
						}
					]
				}
			]
		}
	}
	{
		genre = [
			`black metal`
			metal
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a.dds`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_15.img`
							flags = 4
							color = black_1guitar
						}
					]
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics010.img`
							y_trans = -13
							x_scale = 70
							y_scale = 80
							rot = 5733
							flags = 3
							x_trans = -9
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics010.img`
							x_trans = -3
							y_trans = -7
							x_scale = 70
							y_scale = 80
							flags = 3
							rot = 5983
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics010.img`
							x_trans = 7
							x_scale = 70
							y_scale = 80
							rot = 6233
							flags = 3
							y_trans = -4
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics010.img`
							x_trans = 13
							y_trans = -4
							x_scale = 70
							y_scale = 80
							flags = 3
							rot = 250
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics010.img`
							x_trans = 21
							x_scale = 70
							y_scale = 80
							rot = 450
							flags = 3
							y_trans = -13
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
							x_trans = 3
							y_trans = 25
							x_scale = 10
							y_scale = 20
							rot = 250
							flags = 3
							color = grey_5guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
							x_trans = -11
							y_trans = 21
							x_scale = 10
							y_scale = 20
							rot = 6283
							flags = 3
							color = grey_5guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
							x_trans = -26
							y_trans = 13
							x_scale = 10
							y_scale = 20
							rot = 5933
							flags = 3
							color = grey_5guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
							x_trans = -37
							y_trans = 1
							x_scale = 10
							y_scale = 20
							rot = 5683
							flags = 3
							color = grey_5guitar
						}
						{
							font = fontgrid_title_a1
							text = '6'
							color = black_1guitar
							x_trans = 3
							y_trans = 25
							y_scale = 90
							rot = 6183
							flags = 3
							x_scale = 90
						}
						{
							font = fontgrid_title_a1
							text = '6'
							color = black_1guitar
							x_trans = -11
							x_scale = 90
							y_scale = 90
							rot = 200
							flags = 3
							y_trans = 22
						}
						{
							font = fontgrid_title_a1
							text = '6'
							color = black_1guitar
							x_trans = -26
							y_trans = 14
							x_scale = 90
							y_scale = 90
							flags = 3
							rot = 550
						}
						{
							font = fontgrid_title_a1
							text = 'K'
							color = black_1guitar
							y_trans = 2
							x_scale = 75
							y_scale = 75
							rot = 550
							flags = 3
							x_trans = -37
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1.dds`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/drumshell_ds_52.img`
							flags = 32
						}
					]
				}
			]
		}
	}
	{
		genre = [
			`black metal`
			metal
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a.dds`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_31.img`
							flags = 4
						}
					]
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_002.img`
							color = red_1
							y_trans = -22
							x_scale = 130
							y_scale = 170
							flags = 3
							a = 100
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1.dds`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/drumshell_ds_42.img`
							color = red_3
							a = 100
							flags = 32
						}
					]
				}
			]
		}
	}
	{
		genre = [
			`black metal`
			metal
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1.dds`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/drumshell_ds_21.img`
							a = 100
							flags = 32
							color = grey_3guitar
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
							color = grey_2guitar
						}
					]
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img`
							x_scale = 120
							y_scale = 25
							flags = 3
							color = black_1guitar
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics011.img`
							color = red_1
							x_scale = 105
							flags = 3
							y_scale = 95
						}
					]
				}
			]
		}
	}
	{
		genre = [
			goth
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1.dds`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/drumshell_ds_27.img`
							flags = 32
							color = red_3
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
							color = red_1
						}
					]
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001.img`
							color = black_1guitar
							x_scale = 95
							flags = 3
							y_scale = 95
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics047.img`
							flags = 3
							y_trans = -11
						}
					]
				}
			]
		}
	}
	{
		genre = [
			goth
		]
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
							color = violet_2
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a.dds`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_gk_02.img`
							flags = 4
							color = grey_5guitar
						}
					]
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics073.img`
							x_trans = 33
							y_trans = 61
							flags = 3
							color = red_1
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics073.img`
							color = red_1
							x_trans = -48
							y_trans = 36
							flags = 3
						}
					]
				}
			]
		}
	}
	{
		genre = [
			goth
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1.dds`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/drumshell_ds_31.img`
							flags = 32
							color = teal_4
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a.dds`
					material = cad_drums_01_bassdrum
					diffuse
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics058.img`
							x_trans = 3
							y_trans = -23
							x_scale = 95
							y_scale = 120
							flags = 3
							color = teal_3
						}
					]
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_32.img`
							flags = 4
							color = teal_3
						}
					]
				}
			]
		}
	}
	{
		genre = [
			pop
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a.dds`
					material = cad_drums_01_bassdrum
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_81.img`
							flags = 4
							color = violet_3
						}
					]
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon_insect003.img`
							color = black_1guitar
							x_trans = -1
							x_scale = 80
							y_scale = 50
							rot = 6133
							flags = 3
							y_trans = -36
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon_insect003.img`
							color = violet_4
							x_trans = -1
							y_trans = -36
							x_scale = 70
							rot = 6133
							flags = 3
							y_scale = 40
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon_insect003.img`
							color = black_1guitar
							x_trans = 26
							y_trans = 22
							x_scale = 30
							y_scale = 25
							flags = 3
							rot = 200
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon_insect003.img`
							x_trans = 26
							y_trans = 22
							x_scale = 25
							y_scale = 20
							rot = 200
							flags = 3
							color = violet_4
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon_insect003.img`
							color = black_1guitar
							x_trans = -14
							y_trans = 34
							x_scale = 30
							rot = 5583
							flags = 3
							y_scale = 25
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon_insect003.img`
							color = violet_4
							x_trans = -14
							y_trans = 34
							y_scale = 20
							rot = 5583
							flags = 3
							x_scale = 25
						}
					]
				}
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
			]
		}
	}
	{
		genre = [
			pop
		]
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
							color = navy_3
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
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_74.img`
							flags = 4
							color = blue_2
						}
					]
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics104.img`
							x_trans = -4
							x_scale = 250
							y_scale = 195
							flags = 3
							y_trans = 15
						}
					]
				}
			]
		}
	}
	{
		genre = [
			pop
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1.dds`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/drumshell_ds_15.img`
							flags = 0
							color = red_3
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
							flags = 4
							color = violet_3
						}
					]
				}
			]
		}
	}
	{
		genre = [
			`classic rock`
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1.dds`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/drumshell_ds_22.img`
							color = green_1guitar
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
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_61.img`
							flags = 4
							color = red_3
						}
					]
				}
			]
		}
	}
	{
		genre = [
			`classic rock`
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1.dds`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/drumshell_rm_01.img`
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
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_40.img`
							flags = 4
							color = teal_4
						}
					]
				}
			]
		}
	}
	{
		genre = [
			`classic rock`
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1.dds`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/drumshell_rm_03.img`
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
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_11.img`
							flags = 4
							color = red_orange_3
						}
					]
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_graphics076.img`
							flags = 3
							color = yellow_2guitar
						}
					]
				}
			]
		}
	}
	{
		genre = [
			rock
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1.dds`
					material = cad_drums_01_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/drumshell_ds_23.img`
							color = yellow_orange_3
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
							texture = `tex/models/characters/layers/cadrm/bass_skin_gk_05.img`
							flags = 4
							color = grey_5guitar
						}
					]
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon010.img`
							color = black_1guitar
							y_trans = 20
							x_scale = 60
							y_scale = 65
							rot = 1900
							flags = 3
							x_trans = 12
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon010.img`
							x_trans = 13
							y_trans = 20
							x_scale = 60
							y_scale = 65
							rot = 1900
							flags = 3
							color = yellow_orange_1
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon006.img`
							color = black_1guitar
							y_trans = 10
							x_scale = 80
							y_scale = 90
							rot = 1150
							flags = 3
							x_trans = -36
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon005.img`
							color = black_1guitar
							y_trans = 6
							flags = 3
							x_trans = -15
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon005.img`
							x_trans = -14
							y_trans = 6
							flags = 3
							color = yellow_orange_1
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon006.img`
							x_trans = -35
							y_trans = 10
							x_scale = 80
							y_scale = 90
							rot = 1150
							flags = 3
							color = yellow_orange_1
						}
					]
				}
			]
		}
	}
]
cas_preset_female_vocals = [
	{
		genre = [
			glam
			rock
			goth
			pop
			punk
			`black metal`
			`heavy metal`
			`classic rock`
		]
		cas_mic = {
			desc_id = mic_standard
		}
		cas_mic_stand = {
			desc_id = `classic rock`
		}
	}
	{
		cas_mic = {
			desc_id = `black metal`
		}
		cas_mic_stand = {
			desc_id = `classic rock`
		}
	}
	{
		cas_mic = {
			desc_id = `glam rock`
		}
		cas_mic_stand = {
			desc_id = `classic rock`
		}
	}
	{
		cas_mic = {
			desc_id = punk
		}
		cas_mic_stand = {
			desc_id = `classic rock`
		}
	}
	{
		cas_mic = {
			desc_id = `classic rock`
		}
		cas_mic_stand = {
			desc_id = `classic rock`
		}
	}
	{
		genre = [
			glam
			rock
			metal
			goth
			pop
		]
		cas_mic = {
			desc_id = mic_standard
		}
		cas_mic_stand = {
			desc_id = glam
		}
	}
	{
		cas_mic = {
			desc_id = `black metal`
		}
		cas_mic_stand = {
			desc_id = glam
		}
	}
	{
		cas_mic = {
			desc_id = `glam rock`
		}
		cas_mic_stand = {
			desc_id = glam
		}
	}
	{
		cas_mic = {
			desc_id = punk
		}
		cas_mic_stand = {
			desc_id = glam
		}
	}
	{
		cas_mic = {
			desc_id = `classic rock`
		}
		cas_mic_stand = {
			desc_id = glam
		}
	}
	{
		genre = [
			glam
			rock
			pop
			punk
			`classic rock`
		]
		cas_mic = {
			desc_id = mic_standard
		}
		cas_mic_stand = {
			desc_id = poptastic
		}
	}
	{
		cas_mic = {
			desc_id = `black metal`
		}
		cas_mic_stand = {
			desc_id = poptastic
		}
	}
	{
		cas_mic = {
			desc_id = `glam rock`
		}
		cas_mic_stand = {
			desc_id = poptastic
		}
	}
	{
		cas_mic = {
			desc_id = punk
		}
		cas_mic_stand = {
			desc_id = poptastic
		}
	}
	{
		cas_mic = {
			desc_id = `classic rock`
		}
		cas_mic_stand = {
			desc_id = poptastic
		}
	}
	{
		genre = [
			rock
			goth
			`black metal`
			`heavy metal`
		]
		cas_mic = {
			desc_id = mic_standard
		}
		cas_mic_stand = {
			desc_id = rock
		}
	}
	{
		cas_mic = {
			desc_id = `black metal`
		}
		cas_mic_stand = {
			desc_id = rock
		}
	}
	{
		cas_mic = {
			desc_id = `glam rock`
		}
		cas_mic_stand = {
			desc_id = rock
		}
	}
	{
		cas_mic = {
			desc_id = punk
		}
		cas_mic_stand = {
			desc_id = rock
		}
	}
	{
		cas_mic = {
			desc_id = `classic rock`
		}
		cas_mic_stand = {
			desc_id = rock
		}
	}
]
cas_preset_male_vocals = [
	{
		cas_mic = {
			desc_id = rock
		}
		cas_mic_stand = {
			desc_id = rock
		}
		genre = [
			rock
		]
	}
	{
		cas_mic = {
			desc_id = goth
		}
		cas_mic_stand = {
			desc_id = goth
		}
		genre = [
			goth
		]
	}
	{
		cas_mic = {
			desc_id = pop
		}
		cas_mic_stand = {
			desc_id = poptastic
		}
		genre = [
			pop
		]
	}
	{
		cas_mic = {
			desc_id = metal
		}
		cas_mic_stand = {
			desc_id = goth
		}
		genre = [
			`glam rock`
			`classic rock`
			punk
		]
	}
	{
		cas_mic = {
			desc_id = mic_standard
		}
		cas_mic_stand = {
			desc_id = mic_stand_metal
		}
		genre = [
			`heavy metal`
			`black metal`
		]
	}
]
