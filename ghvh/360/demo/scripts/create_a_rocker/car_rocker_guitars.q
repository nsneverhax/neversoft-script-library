cas_guitar_body = [
	{
		desc_id = guitar_body_vh1
		frontend_desc = qs(0x3d3963cf)
		mesh = 'models/CAR_Instruments/Guitar/VH/GTR_Body_Style_VH1.skin'
		pak_num = 1
		is_van_halen = 1
		price = 1000
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/VH/GTR_Body_Style_VH1_D_01.dds'
				material = guitar_body_style_vh1_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x3f47b13d)
				mask = $guitar_body_vh1
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_pickguard_vh1
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_pickup_style_vh1
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_knob_type_vh1
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_hardware_vh1
				]
			}
			{
				part = cas_guitar_neck
				valid = [
					gtr_neck_vh1
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr_headstock_vh1
				]
			}
		]
	}
	{
		desc_id = guitar_body_vh2
		frontend_desc = qs(0x544d1c97)
		mesh = 'models/CAR_Instruments/Guitar/VH/Guitar_Body_Style_VH2.skin'
		pak_num = 1
		is_van_halen = 1
		price = 2000
		polaroid = gtr_yellowblack
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/VH/GTR_Body_StyleVH2_D_01.dds'
				material = guitar_body_style_vh2_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x3f47b13d)
				mask = $guitar_body_vh2
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					none
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_pickup_style_vh2
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_knob_type_vh2
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_hardware_vh2
				]
			}
			{
				part = cas_guitar_neck
				valid = [
					gtr_neck_vh2
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr_headstock_vh2
				]
			}
		]
		$car_rocker_guitars_factoredglobal_3
	}
	{
		desc_id = guitar_body_vh4
		frontend_desc = qs(0x0f3b15e2)
		mesh = 'models/CAR_Instruments/Guitar/VH/GTR_Body_Style_VH4.skin'
		pak_num = 1
		is_van_halen = 1
		price = 3000
		polaroid = bnd_starguitar
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/VH/GTR_Body_Style_VH4_D_01.dds'
				material = guitar_body_style_vh4_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x3f47b13d)
				mask = $guitar_body_vh4
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					none
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_pickup_style_vh4
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_knob_type_vh4
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_hardware_vh4
				]
			}
			{
				part = cas_guitar_neck
				valid = [
					gtr_neck_vh4
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr_headstock_vh4
				]
			}
		]
		$car_rocker_guitars_factoredglobal_3
	}
	{
		desc_id = guitar_body_vhshark
		frontend_desc = qs(0xb2977378)
		mesh = 'models/CAR_Instruments/Guitar/VH/GTR_Body_Style_VHShark.skin'
		pak_num = 1
		is_van_halen = 1
		price = 5000
		polaroid = bnd_destroyer
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/VH/GTR_Body_Style_VHShark_D_01.dds'
				material = guitar_body_style_vhshark_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x3f47b13d)
				mask = $guitar_body_vhshark
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_pickguard_vhshark
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_pickup_style_vhshark
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_knob_type_vhshark
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_hardware_vhshark
				]
			}
			{
				part = cas_guitar_neck
				valid = [
					gtr_neck_vhshark
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr_headstock_vhshark
				]
			}
		]
		$car_rocker_guitars_factoredglobal_3
	}
	{
		desc_id = guitar_body_vhfstrat
		frontend_desc = qs(0x24286c29)
		mesh = 'models/CAR_Instruments/Guitar/VH/GTR_Body_Style_VHFstrat.skin'
		pak_num = 1
		is_van_halen = 1
		price = 2500
		polaroid = gtr_redblackwhite
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/VH/GTR_Body_Style_VHFstrat_D_01.dds'
				material = guitar_body_style_vhfstrat_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x3f47b13d)
				mask = $guitar_body_vhfstrat
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_pickguard_vhfstrat
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_pickup_style_vhfstrat
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_knob_type_vhfstrat
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_hardware_vhfstrat
				]
			}
			{
				part = cas_guitar_neck
				valid = [
					gtr_neck_vhfstrat
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr_headstock_vhfstrat
				]
			}
		]
		$car_rocker_guitars_factoredglobal_3
	}
	{
		desc_id = guitar_body_vhwolf
		frontend_desc = qs(0xca4c9230)
		mesh = 'models/CAR_Instruments/Guitar/VH/GTR_Body_Style_VHWolf.skin'
		pak_num = 1
		is_van_halen = 1
		price = 3000
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/VH/GTR_Body_Style_VHWolf_D_01.dds'
				material = guitar_body_style_vhwolf_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x3f47b13d)
				mask = $guitar_body_vhwolf
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					none
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_pickup_style_vhwolf
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_knob_type_vhwolf
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_hardware_vhwolf
				]
			}
			{
				part = cas_guitar_neck
				valid = [
					gtr_neck_vhwolf
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr_headstock_vhwolf
				]
			}
		]
	}
	{
		desc_id = guitar_body_vhbwolf
		frontend_desc = qs(0x758c657d)
		mesh = 'models/CAR_Instruments/Guitar/VH/GTR_Body_Style_VHBWolf.skin'
		is_van_halen = 1
		pak_num = 1
		price = 3000
		polaroid = gtr_blackwolfgang
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/VH/GTR_Body_Style_VHBWolf_D_01.dds'
				material = guitar_body_style_vhbwolf_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x3f47b13d)
				mask = $guitar_body_vhbwolf
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					none
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_pickup_style_vhwolf
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_knob_type_vhwolf
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_hardware_vhwolf
				]
			}
			{
				part = cas_guitar_neck
				valid = [
					gtr_neck_vhwolf
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr_headstock_vhbwolf
				]
			}
		]
		$car_rocker_guitars_factoredglobal_3
	}
	{
		desc_id = guitar_body_vhswolf
		frontend_desc = qs(0x1324e125)
		mesh = 'models/CAR_Instruments/Guitar/VH/GTR_Body_Style_VHSWolf.skin'
		is_van_halen = 1
		pak_num = 1
		price = 3000
		polaroid = gtr_sunburstwolfgang
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/VH/GTR_Body_Style_VHSWolf_D_01.dds'
				material = guitar_body_style_vhswolf_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x3f47b13d)
				mask = $guitar_body_vhswolf
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					none
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_pickup_style_vhwolf
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_knob_type_vhwolf
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_hardware_vhwolf
				]
			}
			{
				part = cas_guitar_neck
				valid = [
					gtr_neck_vhwolf
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr_headstock_vhswolf
				]
			}
		]
		$car_rocker_guitars_factoredglobal_3
	}
	{
		desc_id = guitar_body_vhdlr
		frontend_desc = qs(0x1beec08c)
		mesh = 'models/CAR_Instruments/Guitar/VH/GTR_Body_Style_VHDLR.skin'
		is_van_halen = 1
		pak_num = 1
		price = 1000
		polaroid = bnd_acousticdlr
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/VH/GTR_Body_Style_VHDLR_D_01.dds'
				material = guitar_body_style_vhdlr_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x3f47b13d)
				mask = $guitar_body_vhdlr
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_pickguard_vhdlr
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_pickup_style_vhdlr
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_knob_type_vhdlr
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_hardware_vhdlr
				]
			}
			{
				part = cas_guitar_neck
				valid = [
					gtr_neck_vhdlr
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr_headstock_vhdlr
				]
			}
		]
		$car_rocker_guitars_factoredglobal_3
	}
	{
		desc_id = guitar_body01
		frontend_desc = qs(0x8f9d9c4b)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_Body01.skin'
		pak_num = 0
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style1_D_01.dds'
				material = guitar_body_style_01_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_guitar01_body
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style1_D_01.dds'
				material = guitar_body_style_01_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_guitar01_body_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style1_D_01.dds'
				material = guitar_body_style_01_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_15
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style1_D_01.dds'
				material = guitar_body_style_01_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_15
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style1_D_01.dds'
				material = guitar_body_style_01_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_15
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style1_D_01.dds'
				material = guitar_body_style_01_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_15
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style1_D_01.dds'
				material = guitar_body_style_01_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_15
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style1_D_01.dds'
				material = guitar_body_style_01_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_15
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style1_D_01.dds'
				material = guitar_body_style_01_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_15
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style1_D_01.dds'
				material = guitar_body_style_01_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_15
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style1_D_01.dds'
				material = guitar_body_style_01_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_15
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style1_D_01.dds'
				material = guitar_body_style_01_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_15
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					guitar_pickg01
					gtr_body1_pickg02
					gtr_body1_pickg03
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_pickups_style_01c
					gtr_pickups_style_01a
					gtr_pickups_style_01b
					gtr_pickup_type1_blk_1
					gtr_pickup_type1_blk_2
					gtr_pickup_type1_blk_3
					gtr_pickup_type2_03
					gtr_pickup_type2_04
					gtr_pickup_type3_02
					gtr_pickup_type3_03
					gtr_pickup_type3b_02
					gtr_pickup_type3b_03
					gtr_pickup_type4_02
					gtr_pickup_type4_03
					gtr_pickup_type1_blktan_1
					gtr_pickup_type1_blktan_2
					gtr_pickup_type1_blktan_3
					gtr_pickup_type5_01
					gtr_pickup_type5_02
					gtr_pickup_type5_03
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_knobs_style_01a
					gtr_knobs_style_01b
					gtr_knobs_style_01c
					gtr1_knob_type2_02
					gtr1_knob_type2_03
					gtr1_knob_type2_04
					gtr1_knob_type3_04
					gtr1_knob_type3_03
					gtr1_knob_type3_02
					gtr1_knob_type4_04
					gtr1_knob_type5_04
					gtr1_knob_type6_04
					gtr1_knob_type7_04
					gtr1_knob_type8_04
					gtr1_knob_type9_04
					gtr1_knob_type10_04
					none
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_hardware01b
					gtr_hardware01a
					gtr_hardware05
					gtr_hardware06
					gtr_hardware07
				]
			}
		]
	}
	{
		desc_id = guitar_body02
		frontend_desc = qs(0x96eda7f1)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_Body02.skin'
		pak_num = 0
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style2_D_01.dds'
				material = guitar_body_style_02_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x3f47b13d)
				mask = $cag_guitar02_body
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style2_D_01.dds'
				material = guitar_body_style_02_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_guitar02_body_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style2_D_01.dds'
				material = guitar_body_style_02_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_27
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style2_D_01.dds'
				material = guitar_body_style_02_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_27
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style2_D_01.dds'
				material = guitar_body_style_02_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_27
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style2_D_01.dds'
				material = guitar_body_style_02_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_27
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style2_D_01.dds'
				material = guitar_body_style_02_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_27
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style2_D_01.dds'
				material = guitar_body_style_02_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_27
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style2_D_01.dds'
				material = guitar_body_style_02_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_27
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style2_D_01.dds'
				material = guitar_body_style_02_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_27
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style2_D_01.dds'
				material = guitar_body_style_02_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_27
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style2_D_01.dds'
				material = guitar_body_style_02_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_27
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_body2_pickg02
					gtr_body2_pickg01
					gtr_body2_pickg03
					none
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_pickups_style_01a
					gtr_pickups_style_01b
					gtr_pickups_style_01c
					gtr_pickup_type1_blk_1
					gtr_pickup_type1_blk_2
					gtr_pickup_type1_blk_3
					gtr_pickup_type2_03
					gtr_pickup_type2_04
					gtr_pickup_type3_02
					gtr_pickup_type3_03
					gtr_pickup_type3b_02
					gtr_pickup_type3b_03
					gtr_pickup_type4_02
					gtr_pickup_type4_03
					gtr_pickup_type1_blktan_1
					gtr_pickup_type1_blktan_2
					gtr_pickup_type1_blktan_3
					gtr_pickup_type5_01
					gtr_pickup_type5_02
					gtr_pickup_type5_03
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_knobs_style_02a
					gtr2_knob_type2_04
					gtr2_knob_type3_04
					gtr2_knob_type4_04
					gtr2_knob_type5_04
					gtr2_knob_type6_04
					gtr2_knob_type7_04
					gtr2_knob_type8_04
					gtr2_knob_type9_04
					gtr2_knob_type10_04
					none
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_hardware01b
					gtr_hardware01a
					gtr_hardware06
					gtr_hardware07
				]
			}
		]
	}
	{
		desc_id = guitar_body03
		frontend_desc = qs(0x85c9d8a6)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_Body03.skin'
		pak_num = 0
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style3_d_01.dds'
				material = guitar_body_style_03_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_guitar03_body
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style3_D_01.dds'
				material = guitar_body_style_03_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_guitar03_body_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style3_D_01.dds'
				material = guitar_body_style_03_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_30
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style3_D_01.dds'
				material = guitar_body_style_03_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_30
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style3_D_01.dds'
				material = guitar_body_style_03_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_30
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style3_D_01.dds'
				material = guitar_body_style_03_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_30
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style3_D_01.dds'
				material = guitar_body_style_03_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_30
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style3_D_01.dds'
				material = guitar_body_style_03_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_30
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style3_D_01.dds'
				material = guitar_body_style_03_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_30
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style3_D_01.dds'
				material = guitar_body_style_03_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_30
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style3_D_01.dds'
				material = guitar_body_style_03_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_30
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style3_D_01.dds'
				material = guitar_body_style_03_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_30
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_body3_pickg01
					gtr_body3_pickg02
					gtr_body3_pickg03
					none
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_pickups_style_01a
					gtr_pickups_style_01b
					gtr_pickups_style_01c
					gtr_pickup_type1_blk_1
					gtr_pickup_type1_blk_2
					gtr_pickup_type1_blk_3
					gtr_pickup_type2_03
					gtr_pickup_type2_04
					gtr_pickup_type3_02
					gtr_pickup_type3_03
					gtr_pickup_type3b_02
					gtr_pickup_type3b_03
					gtr_pickup_type4_02
					gtr_pickup_type4_03
					gtr_pickup_type1_blktan_1
					gtr_pickup_type1_blktan_2
					gtr_pickup_type1_blktan_3
					gtr_pickup_type5_01
					gtr_pickup_type5_02
					gtr_pickup_type5_03
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr3_knobs_style_03a
					gtr3_knob_type2_03
					gtr3_knob_type3_03
					gtr3_knob_type4_03
					gtr3_knob_type5_03
					gtr3_knob_type6_03
					gtr3_knob_type7_03
					gtr3_knob_type8_03
					gtr3_knob_type9_03
					gtr3_knob_type10_03
					none
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_hardware01b
					gtr_hardware01a
					gtr_hardware06
					gtr_hardware07
				]
			}
		]
	}
	{
		desc_id = guitar_body04
		frontend_desc = qs(0x285773ba)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_Body04.skin'
		pak_num = 0
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style4_d_01.dds'
				material = guitar_body_style_04_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_guitar04_body
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style4_D_01.dds'
				material = guitar_body_style_04_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_guitar04_body_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style4_D_01.dds'
				material = guitar_body_style_04_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_33
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style4_D_01.dds'
				material = guitar_body_style_04_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_33
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style4_D_01.dds'
				material = guitar_body_style_04_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_33
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style4_D_01.dds'
				material = guitar_body_style_04_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_33
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style4_D_01.dds'
				material = guitar_body_style_04_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_33
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style4_D_01.dds'
				material = guitar_body_style_04_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_33
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style4_D_01.dds'
				material = guitar_body_style_04_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_33
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style4_D_01.dds'
				material = guitar_body_style_04_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_33
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style4_D_01.dds'
				material = guitar_body_style_04_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_33
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style4_D_01.dds'
				material = guitar_body_style_04_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_33
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_body4_pickg01
					gtr_body4_pickg02
					gtr_body4_pickg03
					none
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_pickups_style_01a
					gtr_pickups_style_01b
					gtr_pickups_style_01c
					gtr_pickup_type1_blk_1
					gtr_pickup_type1_blk_2
					gtr_pickup_type1_blk_3
					gtr_pickup_type2_03
					gtr_pickup_type2_04
					gtr_pickup_type3_02
					gtr_pickup_type3_03
					gtr_pickup_type3b_02
					gtr_pickup_type3b_03
					gtr_pickup_type4_02
					gtr_pickup_type4_03
					gtr_pickup_type1_blktan_1
					gtr_pickup_type1_blktan_2
					gtr_pickup_type1_blktan_3
					gtr_pickup_type5_01
					gtr_pickup_type5_02
					gtr_pickup_type5_03
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr4_knob_type1_04
					gtr4_knob_type1_03
					gtr4_knob_type2_02
					gtr4_knob_type2_03
					gtr4_knob_type2_04
					gtr4_knob_type3_04
					gtr4_knob_type4_04
					gtr4_knob_type5_04
					gtr4_knob_type6_04
					gtr4_knob_type7_04
					gtr4_knob_type8_04
					gtr4_knob_type9_04
					gtr4_knob_type10_04
					none
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_hardware01b
					gtr_hardware01a
					gtr_hardware05
					gtr_hardware06
					gtr_hardware07
				]
			}
		]
	}
	{
		desc_id = guitar_body05
		frontend_desc = qs(0x8101449c)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_Body05.skin'
		pak_num = 0
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style5_d_01.dds'
				material = guitar_body_style_05_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_guitar05_body
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style5_D_01.dds'
				material = guitar_body_style_05_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_guitar05_body_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style5_D_01.dds'
				material = guitar_body_style_05_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_33
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style5_D_01.dds'
				material = guitar_body_style_05_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_33
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style5_D_01.dds'
				material = guitar_body_style_05_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_33
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style5_D_01.dds'
				material = guitar_body_style_05_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style5_D_01.dds'
				material = guitar_body_style_05_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_33
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style5_D_01.dds'
				material = guitar_body_style_05_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_33
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style5_D_01.dds'
				material = guitar_body_style_05_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_33
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style5_D_01.dds'
				material = guitar_body_style_05_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_33
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style5_D_01.dds'
				material = guitar_body_style_05_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_33
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style5_D_01.dds'
				material = guitar_body_style_05_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_33
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_body5_pickg02
					gtr_body5_pickg03
					gtr_body5_pickg01
					none
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_pickups_style_01a
					gtr_pickups_style_01b
					gtr_pickups_style_01c
					gtr_pickup_type1_blk_1
					gtr_pickup_type1_blk_2
					gtr_pickup_type1_blk_3
					gtr_pickup_type2_03
					gtr_pickup_type2_04
					gtr_pickup_type3_02
					gtr_pickup_type3_03
					gtr_pickup_type3b_02
					gtr_pickup_type3b_03
					gtr_pickup_type4_02
					gtr_pickup_type4_03
					gtr_pickup_type1_blktan_1
					gtr_pickup_type1_blktan_2
					gtr_pickup_type1_blktan_3
					gtr_pickup_type5_01
					gtr_pickup_type5_02
					gtr_pickup_type5_03
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr4_knob_type1_04
					gtr4_knob_type1_03
					gtr4_knob_type2_02
					gtr4_knob_type2_03
					gtr4_knob_type2_04
					gtr4_knob_type3_04
					gtr4_knob_type4_04
					gtr4_knob_type5_04
					gtr4_knob_type6_04
					gtr4_knob_type7_04
					gtr4_knob_type8_04
					gtr4_knob_type9_04
					gtr4_knob_type10_04
					none
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_hardware01b
					gtr_hardware01a
					gtr_hardware05
					gtr_hardware06
					gtr_hardware07
				]
			}
		]
	}
	{
		desc_id = guitar_body06
		frontend_desc = qs(0x067681e4)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_Body06.skin'
		pak_num = 0
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style6_d_01.dds'
				material = guitar_body_style_06_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_guitar06_body
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style6_D_01.dds'
				material = guitar_body_style_06_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_guitar06_body_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style6_D_01.dds'
				material = guitar_body_style_06_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_33
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style6_D_01.dds'
				material = guitar_body_style_06_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_33
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style6_D_01.dds'
				material = guitar_body_style_06_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_33
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style6_D_01.dds'
				material = guitar_body_style_06_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_33
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style6_D_01.dds'
				material = guitar_body_style_06_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_33
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style6_D_01.dds'
				material = guitar_body_style_06_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_33
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style6_D_01.dds'
				material = guitar_body_style_06_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_33
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style6_D_01.dds'
				material = guitar_body_style_06_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_33
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style6_D_01.dds'
				material = guitar_body_style_06_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_33
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style6_D_01.dds'
				material = guitar_body_style_06_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_33
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_body6_pickg01
					gtr_body6_pickg02
					gtr_body6_pickg03
					none
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_pickups_style_01a
					gtr_pickups_style_01b
					gtr_pickups_style_01c
					gtr_pickup_type1_blk_1
					gtr_pickup_type1_blk_2
					gtr_pickup_type1_blk_3
					gtr_pickup_type2_03
					gtr_pickup_type2_04
					gtr_pickup_type3_02
					gtr_pickup_type3_03
					gtr_pickup_type3b_02
					gtr_pickup_type3b_03
					gtr_pickup_type4_02
					gtr_pickup_type4_03
					gtr_pickup_type1_blktan_1
					gtr_pickup_type1_blktan_2
					gtr_pickup_type1_blktan_3
					gtr_pickup_type5_01
					gtr_pickup_type5_02
					gtr_pickup_type5_03
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr6_knob_type1_03
					gtr6_knob_type2_03
					gtr6_knob_type3_03
					gtr6_knob_type4_03
					gtr6_knob_type5_03
					gtr6_knob_type6_03
					gtr6_knob_type7_03
					gtr6_knob_type8_03
					gtr6_knob_type9_03
					gtr6_knob_type10_03
					none
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_hardware01b
					gtr_hardware01a
					gtr_hardware05
					gtr_hardware06
					gtr_hardware07
				]
			}
		]
	}
	{
		desc_id = guitar_body07
		frontend_desc = qs(0xa8464b0c)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_Body07.skin'
		pak_num = 0
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style7_d_01.dds'
				material = guitar_body_style_07_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_guitar07_body
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style7_D_01.dds'
				material = guitar_body_style_07_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_guitar07_body_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style7_D_01.dds'
				material = guitar_body_style_07_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_40
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style7_D_01.dds'
				material = guitar_body_style_07_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_40
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style7_D_01.dds'
				material = guitar_body_style_07_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_40
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style7_D_01.dds'
				material = guitar_body_style_07_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_40
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style7_D_01.dds'
				material = guitar_body_style_07_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_40
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style7_D_01.dds'
				material = guitar_body_style_07_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_40
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style7_D_01.dds'
				material = guitar_body_style_07_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_40
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style7_D_01.dds'
				material = guitar_body_style_07_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_40
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style7_D_01.dds'
				material = guitar_body_style_07_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_40
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style7_D_01.dds'
				material = guitar_body_style_07_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_40
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_body7_pickg01
					gtr_body7_pickg02
					gtr_body7_pickg03
					none
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_pickups_style_01a
					gtr_pickups_style_01b
					gtr_pickups_style_01c
					gtr_pickup_type1_blk_1
					gtr_pickup_type1_blk_2
					gtr_pickup_type1_blk_3
					gtr_pickup_type2_03
					gtr_pickup_type2_04
					gtr_pickup_type3_02
					gtr_pickup_type3_03
					gtr_pickup_type3b_02
					gtr_pickup_type3b_03
					gtr_pickup_type4_02
					gtr_pickup_type4_03
					gtr_pickup_type1_blktan_1
					gtr_pickup_type1_blktan_2
					gtr_pickup_type1_blktan_3
					gtr_pickup_type5_01
					gtr_pickup_type5_02
					gtr_pickup_type5_03
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr7_knob_type1_03
					gtr7_knob_type2_03
					gtr7_knob_type3_03
					gtr7_knob_type4_03
					gtr7_knob_type5_03
					gtr7_knob_type6_03
					gtr7_knob_type7_03
					gtr7_knob_type8_03
					gtr7_knob_type9_03
					gtr7_knob_type10_03
					none
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_hardware01b
					gtr_hardware01a
					gtr_hardware05
					gtr_hardware06
					gtr_hardware07
				]
			}
		]
	}
	{
		desc_id = guitar_body08
		frontend_desc = qs(0xb3c60b30)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_Body08.skin'
		pak_num = 0
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style8_d_01.dds'
				material = guitar_body_style_08_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_guitar08_body
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style8_D_01.dds'
				material = guitar_body_style_08_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_guitar08_body_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style8_D_01.dds'
				material = guitar_body_style_08_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_43
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style8_D_01.dds'
				material = guitar_body_style_08_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_43
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style8_D_01.dds'
				material = guitar_body_style_08_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_43
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style8_D_01.dds'
				material = guitar_body_style_08_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_43
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style8_D_01.dds'
				material = guitar_body_style_08_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_43
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style8_D_01.dds'
				material = guitar_body_style_08_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_43
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style8_D_01.dds'
				material = guitar_body_style_08_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_43
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style8_D_01.dds'
				material = guitar_body_style_08_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_43
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style8_D_01.dds'
				material = guitar_body_style_08_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_43
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style8_D_01.dds'
				material = guitar_body_style_08_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_43
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_body8_pickg01
					gtr_body8_pickg02
					gtr_body8_pickg03
					none
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_pickups_style_01a
					gtr_pickups_style_01b
					gtr_pickups_style_01c
					gtr_pickup_type1_blk_1
					gtr_pickup_type1_blk_2
					gtr_pickup_type1_blk_3
					gtr_pickup_type2_03
					gtr_pickup_type2_04
					gtr_pickup_type3_02
					gtr_pickup_type3_03
					gtr_pickup_type3b_02
					gtr_pickup_type3b_03
					gtr_pickup_type4_02
					gtr_pickup_type4_03
					gtr_pickup_type1_blktan_1
					gtr_pickup_type1_blktan_2
					gtr_pickup_type1_blktan_3
					gtr_pickup_type5_01
					gtr_pickup_type5_02
					gtr_pickup_type5_03
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr8_knob_type1_03
					gtr8_knob_type2_03
					gtr8_knob_type3_03
					gtr8_knob_type4_03
					gtr8_knob_type5_03
					gtr8_knob_type6_03
					gtr8_knob_type7_03
					gtr8_knob_type8_03
					gtr8_knob_type9_03
					gtr8_knob_type10_03
					none
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_hardware01b
					gtr_hardware01a
					gtr_hardware05
					gtr_hardware06
					gtr_hardware07
				]
			}
		]
	}
	{
		desc_id = guitar_body09
		frontend_desc = qs(0xd87efb57)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_Body09.skin'
		pak_num = 0
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style9_d_01.dds'
				material = guitar_body_style_09_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_guitar09_body
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style9_D_01.dds'
				material = guitar_body_style_09_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_guitar09_body_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style9_D_01.dds'
				material = guitar_body_style_09_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_43
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style9_D_01.dds'
				material = guitar_body_style_09_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_43
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style9_D_01.dds'
				material = guitar_body_style_09_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_43
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style9_D_01.dds'
				material = guitar_body_style_09_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_43
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style9_D_01.dds'
				material = guitar_body_style_09_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_43
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style9_D_01.dds'
				material = guitar_body_style_09_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_43
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style9_D_01.dds'
				material = guitar_body_style_09_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_43
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style9_D_01.dds'
				material = guitar_body_style_09_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_43
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style9_D_01.dds'
				material = guitar_body_style_09_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_43
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style9_D_01.dds'
				material = guitar_body_style_09_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_43
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_body9_pickg01
					gtr_body9_pickg02
					gtr_body9_pickg03
					none
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_pickups_style_01a
					gtr_pickups_style_01b
					gtr_pickups_style_01c
					gtr_pickup_type1_blk_1
					gtr_pickup_type1_blk_2
					gtr_pickup_type1_blk_3
					gtr_pickup_type2_03
					gtr_pickup_type2_04
					gtr_pickup_type3_02
					gtr_pickup_type3_03
					gtr_pickup_type3b_02
					gtr_pickup_type3b_03
					gtr_pickup_type4_02
					gtr_pickup_type4_03
					gtr_pickup_type1_blktan_1
					gtr_pickup_type1_blktan_2
					gtr_pickup_type1_blktan_3
					gtr_pickup_type5_01
					gtr_pickup_type5_02
					gtr_pickup_type5_03
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr9_knob_type1_03
					gtr9_knob_type2_03
					gtr9_knob_type3_03
					gtr9_knob_type4_03
					gtr9_knob_type5_03
					gtr9_knob_type6_03
					gtr9_knob_type7_03
					gtr9_knob_type8_03
					gtr9_knob_type9_03
					gtr9_knob_type10_03
					none
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_hardware01b
					gtr_hardware01a
					gtr_hardware06
					gtr_hardware07
				]
			}
		]
	}
	{
		desc_id = guitar_body10
		frontend_desc = qs(0x6938e028)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_Body10.skin'
		pak_num = 1
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style10_d_01.dds'
				material = guitar_body_style_10_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_guitar10_body
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style10_D_01.dds'
				material = guitar_body_style_10_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_guitar10_body_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style10_D_01.dds'
				material = guitar_body_style_10_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_48
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style10_D_01.dds'
				material = guitar_body_style_10_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_48
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style10_D_01.dds'
				material = guitar_body_style_10_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_48
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style10_D_01.dds'
				material = guitar_body_style_10_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_48
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style10_D_01.dds'
				material = guitar_body_style_10_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_48
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style10_D_01.dds'
				material = guitar_body_style_10_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_48
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style10_D_01.dds'
				material = guitar_body_style_10_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_48
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style10_D_01.dds'
				material = guitar_body_style_10_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_48
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style10_D_01.dds'
				material = guitar_body_style_10_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_48
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style10_D_01.dds'
				material = guitar_body_style_10_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_48
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_body10_pickg01
					gtr_body10_pickg02
					gtr_body10_pickg03
					none
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_pickups_style_01a
					gtr_pickups_style_01b
					gtr_pickups_style_01c
					gtr_pickup_type1_blk_1
					gtr_pickup_type1_blk_2
					gtr_pickup_type1_blk_3
					gtr_pickup_type2_03
					gtr_pickup_type2_04
					gtr_pickup_type3_02
					gtr_pickup_type3_03
					gtr_pickup_type3b_02
					gtr_pickup_type3b_03
					gtr_pickup_type4_02
					gtr_pickup_type4_03
					gtr_pickup_type1_blktan_1
					gtr_pickup_type1_blktan_2
					gtr_pickup_type1_blktan_3
					gtr_pickup_type5_01
					gtr_pickup_type5_02
					gtr_pickup_type5_03
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr10_knob_type1_03
					gtr10_knob_type2_03
					gtr10_knob_type3_03
					gtr10_knob_type4_03
					gtr10_knob_type5_03
					gtr10_knob_type6_03
					gtr10_knob_type7_03
					gtr10_knob_type8_03
					gtr10_knob_type9_03
					gtr10_knob_type10_03
					none
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_hardware01b
					gtr_hardware01a
					gtr_hardware05
					gtr_hardware06
					gtr_hardware07
				]
			}
		]
	}
	{
		desc_id = guitar_body11
		frontend_desc = qs(0x66720d27)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_Body11.skin'
		pak_num = 1
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style11_d_01.dds'
				material = guitar_body_style_11_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_guitar11_body
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style11_D_01.dds'
				material = guitar_body_style_11_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_guitar11_body_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style11_D_01.dds'
				material = guitar_body_style_11_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_51
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style11_D_01.dds'
				material = guitar_body_style_11_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_51
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style11_D_01.dds'
				material = guitar_body_style_11_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_51
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style11_D_01.dds'
				material = guitar_body_style_11_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_51
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style11_D_01.dds'
				material = guitar_body_style_11_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_51
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style11_D_01.dds'
				material = guitar_body_style_11_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_51
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style11_D_01.dds'
				material = guitar_body_style_11_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_51
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style11_D_01.dds'
				material = guitar_body_style_11_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_51
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style11_D_01.dds'
				material = guitar_body_style_11_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_51
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style11_D_01.dds'
				material = guitar_body_style_11_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_51
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_body11_pickg01
					gtr_body11_pickg02
					gtr_body11_pickg03
					none
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_pickups_style_01a
					gtr_pickups_style_01b
					gtr_pickups_style_01c
					gtr_pickup_type1_blk_1
					gtr_pickup_type1_blk_2
					gtr_pickup_type1_blk_3
					gtr_pickup_type2_03
					gtr_pickup_type2_04
					gtr_pickup_type3_02
					gtr_pickup_type3_03
					gtr_pickup_type3b_02
					gtr_pickup_type3b_03
					gtr_pickup_type4_02
					gtr_pickup_type4_03
					gtr_pickup_type1_blktan_1
					gtr_pickup_type1_blktan_2
					gtr_pickup_type1_blktan_3
					gtr_pickup_type5_01
					gtr_pickup_type5_02
					gtr_pickup_type5_03
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr11_knob_type1_03
					gtr11_knob_type2_03
					gtr11_knob_type3_03
					gtr11_knob_type4_03
					gtr11_knob_type5_03
					gtr11_knob_type6_03
					gtr11_knob_type7_03
					gtr11_knob_type8_03
					gtr11_knob_type9_03
					gtr11_knob_type10_03
					none
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_hardware01b
					gtr_hardware01a
					gtr_hardware05
					gtr_hardware06
					gtr_hardware07
				]
			}
		]
	}
	{
		desc_id = guitar_body12
		frontend_desc = qs(0x9d989d68)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_Body12.skin'
		pak_num = 1
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style12_d_01.dds'
				material = guitar_body_style_12_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_guitar12_body
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style12_D_01.dds'
				material = guitar_body_style_12_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_guitar12_body_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style12_D_01.dds'
				material = guitar_body_style_12_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_48
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style12_D_01.dds'
				material = guitar_body_style_12_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_48
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style12_D_01.dds'
				material = guitar_body_style_12_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_48
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style12_D_01.dds'
				material = guitar_body_style_12_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_48
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style12_D_01.dds'
				material = guitar_body_style_12_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_48
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style12_D_01.dds'
				material = guitar_body_style_12_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_48
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style12_D_01.dds'
				material = guitar_body_style_12_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_48
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style12_D_01.dds'
				material = guitar_body_style_12_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_48
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style12_D_01.dds'
				material = guitar_body_style_12_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_48
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style12_D_01.dds'
				material = guitar_body_style_12_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_48
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_body12_pickg01
					gtr_body12_pickg02
					gtr_body12_pickg03
					none
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_pickups_style_01a
					gtr_pickups_style_01b
					gtr_pickups_style_01c
					gtr_pickup_type1_blk_1
					gtr_pickup_type1_blk_2
					gtr_pickup_type1_blk_3
					gtr_pickup_type2_03
					gtr_pickup_type2_04
					gtr_pickup_type3_02
					gtr_pickup_type3_03
					gtr_pickup_type3b_02
					gtr_pickup_type3b_03
					gtr_pickup_type4_02
					gtr_pickup_type4_03
					gtr_pickup_type1_blktan_1
					gtr_pickup_type1_blktan_2
					gtr_pickup_type1_blktan_3
					gtr_pickup_type5_01
					gtr_pickup_type5_02
					gtr_pickup_type5_03
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr12_knob_type1_04
					gtr12_knob_type2_04
					gtr12_knob_type3_04
					gtr12_knob_type4_04
					gtr12_knob_type5_04
					gtr12_knob_type6_04
					gtr12_knob_type7_04
					gtr12_knob_type8_04
					gtr12_knob_type9_04
					gtr12_knob_type10_04
					none
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr12_hardware_01
					gtr_hardware05
					gtr_hardware06
					gtr_hardware07
				]
			}
		]
	}
	{
		desc_id = guitar_body13
		frontend_desc = qs(0x56b04095)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_Body13.skin'
		pak_num = 1
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style13_d_01.dds'
				material = guitar_body_style_13_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_guitar13_body
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style13_D_01.dds'
				material = guitar_body_style_13_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_guitar13_body_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style13_D_01.dds'
				material = guitar_body_style_13_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_48
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style13_D_01.dds'
				material = guitar_body_style_13_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_48
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style13_D_01.dds'
				material = guitar_body_style_13_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_48
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style13_D_01.dds'
				material = guitar_body_style_13_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_48
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style13_D_01.dds'
				material = guitar_body_style_13_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_48
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style13_D_01.dds'
				material = guitar_body_style_13_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_48
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style13_D_01.dds'
				material = guitar_body_style_13_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_48
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style13_D_01.dds'
				material = guitar_body_style_13_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_48
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style13_D_01.dds'
				material = guitar_body_style_13_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_48
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style13_D_01.dds'
				material = guitar_body_style_13_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_48
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_body13_pickg01
					gtr_body13_pickg02
					gtr_body13_pickg03
					none
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_pickups_style_01a
					gtr_pickups_style_01b
					gtr_pickups_style_01c
					gtr_pickup_type1_blk_1
					gtr_pickup_type1_blk_2
					gtr_pickup_type1_blk_3
					gtr_pickup_type2_03
					gtr_pickup_type2_04
					gtr_pickup_type3_02
					gtr_pickup_type3_03
					gtr_pickup_type3b_02
					gtr_pickup_type3b_03
					gtr_pickup_type4_02
					gtr_pickup_type4_03
					gtr_pickup_type1_blktan_1
					gtr_pickup_type1_blktan_2
					gtr_pickup_type1_blktan_3
					gtr_pickup_type5_01
					gtr_pickup_type5_02
					gtr_pickup_type5_03
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr13_knob_type1_02
					gtr13_knob_type2_02
					gtr13_knob_type3_02
					gtr13_knob_type4_02
					gtr13_knob_type5_02
					gtr13_knob_type6_02
					gtr13_knob_type7_02
					gtr13_knob_type8_02
					gtr13_knob_type9_02
					gtr13_knob_type10_02
					none
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_hardware01b
					gtr_hardware01a
					gtr_hardware05
					gtr_hardware06
					gtr_hardware07
				]
			}
		]
	}
	{
		desc_id = guitar_body14
		frontend_desc = qs(0x38e64637)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_Body14.skin'
		pak_num = 1
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style14_d_01.dds'
				material = guitar_body_style_14_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_guitar14_body
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style14_D_01.dds'
				material = guitar_body_style_14_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_guitar14_body_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style14_D_01.dds'
				material = guitar_body_style_14_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_48
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style14_D_01.dds'
				material = guitar_body_style_14_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_48
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style14_D_01.dds'
				material = guitar_body_style_14_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_48
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style14_D_01.dds'
				material = guitar_body_style_14_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_48
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style14_D_01.dds'
				material = guitar_body_style_14_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_48
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style14_D_01.dds'
				material = guitar_body_style_14_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_48
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style14_D_01.dds'
				material = guitar_body_style_14_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_48
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style14_D_01.dds'
				material = guitar_body_style_14_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_48
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style14_D_01.dds'
				material = guitar_body_style_14_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_48
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style14_D_01.dds'
				material = guitar_body_style_14_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_48
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_body14_pickg01
					gtr_body14_pickg02
					gtr_body14_pickg03
					none
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_pickups_style_01a
					gtr_pickups_style_01b
					gtr_pickups_style_01c
					gtr_pickup_type1_blk_1
					gtr_pickup_type1_blk_2
					gtr_pickup_type1_blk_3
					gtr_pickup_type2_03
					gtr_pickup_type2_04
					gtr_pickup_type3_02
					gtr_pickup_type3_03
					gtr_pickup_type3b_02
					gtr_pickup_type3b_03
					gtr_pickup_type4_02
					gtr_pickup_type4_03
					gtr_pickup_type1_blktan_1
					gtr_pickup_type1_blktan_2
					gtr_pickup_type1_blktan_3
					gtr_pickup_type5_01
					gtr_pickup_type5_02
					gtr_pickup_type5_03
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr14_knob_type1_04
					gtr14_knob_type2_04
					gtr14_knob_type3_04
					gtr14_knob_type4_04
					gtr14_knob_type5_04
					gtr14_knob_type6_04
					gtr14_knob_type7_04
					gtr14_knob_type8_04
					gtr14_knob_type9_04
					gtr14_knob_type10_04
					none
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_hardware01b
					gtr_hardware01a
					gtr_hardware05
					gtr_hardware06
					gtr_hardware07
				]
			}
		]
	}
	{
		desc_id = guitar_body15
		frontend_desc = qs(0x84798ee7)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_Body15.skin'
		pak_num = 1
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style15_d_01.dds'
				material = guitar_body_style_15_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_guitar15_body
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style15_D_01.dds'
				material = guitar_body_style_15_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_guitar15_body_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style15_D_01.dds'
				material = guitar_body_style_15_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_60
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style15_D_01.dds'
				material = guitar_body_style_15_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_60
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style15_D_01.dds'
				material = guitar_body_style_15_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_60
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style15_D_01.dds'
				material = guitar_body_style_15_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_60
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style15_D_01.dds'
				material = guitar_body_style_15_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_60
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style15_D_01.dds'
				material = guitar_body_style_15_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_60
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style15_D_01.dds'
				material = guitar_body_style_15_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_60
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style15_D_01.dds'
				material = guitar_body_style_15_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_60
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style15_D_01.dds'
				material = guitar_body_style_15_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_60
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style15_D_01.dds'
				material = guitar_body_style_15_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_60
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_body15_pickg01
					gtr_body15_pickg02
					gtr_body15_pickg03
					none
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_pickups_style_01a
					gtr_pickups_style_01b
					gtr_pickups_style_01c
					gtr_pickup_type1_blk_1
					gtr_pickup_type1_blk_2
					gtr_pickup_type1_blk_3
					gtr_pickup_type2_03
					gtr_pickup_type2_04
					gtr_pickup_type3_02
					gtr_pickup_type3_03
					gtr_pickup_type3b_02
					gtr_pickup_type3b_03
					gtr_pickup_type4_02
					gtr_pickup_type4_03
					gtr_pickup_type1_blktan_1
					gtr_pickup_type1_blktan_2
					gtr_pickup_type1_blktan_3
					gtr_pickup_type5_01
					gtr_pickup_type5_02
					gtr_pickup_type5_03
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr15_knob_type1_03
					gtr15_knob_type2_03
					gtr15_knob_type3_03
					gtr15_knob_type4_03
					gtr15_knob_type5_03
					gtr15_knob_type6_03
					gtr15_knob_type7_03
					gtr15_knob_type8_03
					gtr15_knob_type9_03
					gtr15_knob_type10_03
					none
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_hardware01b
					gtr_hardware01a
					gtr_hardware06
					gtr_hardware07
				]
			}
		]
	}
	{
		desc_id = guitar_body16
		frontend_desc = qs(0x960d23f4)
		mesh = 'models/CAR_Instruments/Guitar/CAG_Body_Prediktor.skin'
		price = 500
		pak_num = 1
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_body01_d_mls.dds'
				material = guitar_body_prediktor_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_guitar16_body
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_body01_d_mls.dds'
				material = guitar_body_prediktor_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_guitar16_body_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_body01_d_mls.dds'
				material = guitar_body_prediktor_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_60
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_body01_d_mls.dds'
				material = guitar_body_prediktor_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_60
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_body01_d_mls.dds'
				material = guitar_body_prediktor_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_60
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_body01_d_mls.dds'
				material = guitar_body_prediktor_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_60
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_body01_d_mls.dds'
				material = guitar_body_prediktor_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_60
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_body01_d_mls.dds'
				material = guitar_body_prediktor_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_60
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_body01_d_mls.dds'
				material = guitar_body_prediktor_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_60
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_body01_d_mls.dds'
				material = guitar_body_prediktor_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_60
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_body01_d_mls.dds'
				material = guitar_body_prediktor_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_60
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_body01_d_mls.dds'
				material = guitar_body_prediktor_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_60
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_body16_pickg01
					gtr_body16_pickg02
					gtr_body16_pickg03
					gtr_body16_pickg04
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_pickups_style_01a
					gtr_pickups_style_01b
					gtr_pickups_style_01c
					gtr_pickup_type1_blk_1
					gtr_pickup_type1_blk_2
					gtr_pickup_type1_blk_3
					gtr_pickup_type2_03
					gtr_pickup_type2_04
					gtr_pickup_type3_02
					gtr_pickup_type3_03
					gtr_pickup_type3b_02
					gtr_pickup_type3b_03
					gtr_pickup_type4_02
					gtr_pickup_type4_03
					gtr_pickup_type1_blktan_1
					gtr_pickup_type1_blktan_2
					gtr_pickup_type1_blktan_3
					gtr_pickup_type5_01
					gtr_pickup_type5_02
					gtr_pickup_type5_03
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr4_knob_type1_04
					gtr4_knob_type1_03
					gtr4_knob_type2_02
					gtr4_knob_type2_03
					gtr4_knob_type2_04
					gtr4_knob_type3_04
					gtr4_knob_type4_04
					gtr4_knob_type5_04
					gtr4_knob_type6_04
					gtr4_knob_type7_04
					gtr4_knob_type8_04
					gtr4_knob_type9_04
					gtr4_knob_type10_04
					none
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_hardware01b
					gtr_hardware01a
					gtr_hardware05
					gtr_hardware06
					gtr_hardware07
				]
			}
		]
	}
	{
		desc_id = guitar_body17
		frontend_desc = qs(0x287eb5e2)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_Body17.skin'
		pak_num = 1
		price = 500
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style17_d.dds'
				material = guitar_body_bandera_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_guitar17_body
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style17_d.dds'
				material = guitar_body_bandera_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_guitar17_body_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style17_d.dds'
				material = guitar_body_bandera_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_60
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style17_d.dds'
				material = guitar_body_bandera_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_60
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style17_d.dds'
				material = guitar_body_bandera_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_60
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style17_d.dds'
				material = guitar_body_bandera_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_60
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style17_d.dds'
				material = guitar_body_bandera_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_60
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style17_d.dds'
				material = guitar_body_bandera_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_60
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style17_d.dds'
				material = guitar_body_bandera_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_60
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style17_d.dds'
				material = guitar_body_bandera_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_60
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style17_d.dds'
				material = guitar_body_bandera_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_60
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style17_d.dds'
				material = guitar_body_bandera_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_60
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_body17_pickg01
					gtr_body17_pickg02
					gtr_body17_pickg03
					none
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_pickups_style_01a
					gtr_pickups_style_01b
					gtr_pickups_style_01c
					gtr_pickup_type1_blk_1
					gtr_pickup_type1_blk_2
					gtr_pickup_type1_blk_3
					gtr_pickup_type2_03
					gtr_pickup_type2_04
					gtr_pickup_type3_02
					gtr_pickup_type3_03
					gtr_pickup_type3b_02
					gtr_pickup_type3b_03
					gtr_pickup_type4_02
					gtr_pickup_type4_03
					gtr_pickup_type1_blktan_1
					gtr_pickup_type1_blktan_2
					gtr_pickup_type1_blktan_3
					gtr_pickup_type5_01
					gtr_pickup_type5_02
					gtr_pickup_type5_03
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr13_knob_type1_02
					gtr13_knob_type2_02
					gtr13_knob_type3_02
					gtr13_knob_type4_02
					gtr13_knob_type5_02
					gtr13_knob_type6_02
					gtr13_knob_type7_02
					gtr13_knob_type8_02
					gtr13_knob_type9_02
					gtr13_knob_type10_02
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_hardware01b
					gtr_hardware01a
					gtr_hardware05
					gtr_hardware06
					gtr_hardware07
				]
			}
		]
	}
	{
		desc_id = gtr_body_style_20
		frontend_desc = qs(0xcb9309cb)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Body_Style_20.skin'
		price = 500
		pak_num = 1
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style20_d_01.dds'
				material = guitar_body_style_20_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_guitar20_body
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style20_d_01.dds'
				material = guitar_body_style_20_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_guitar20_body_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style20_d_01.dds'
				material = guitar_body_style_20_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_67
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style20_d_01.dds'
				material = guitar_body_style_20_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_67
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style20_d_01.dds'
				material = guitar_body_style_20_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_67
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style20_d_01.dds'
				material = guitar_body_style_20_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_67
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style20_d_01.dds'
				material = guitar_body_style_20_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_67
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style20_d_01.dds'
				material = guitar_body_style_20_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_67
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style20_d_01.dds'
				material = guitar_body_style_20_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_67
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style20_d_01.dds'
				material = guitar_body_style_20_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_67
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style20_d_01.dds'
				material = guitar_body_style_20_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_67
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style20_d_01.dds'
				material = guitar_body_style_20_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_67
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_body20_pickg02
					gtr_body20_pickg01
					gtr_body20_pickg03
					none
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_pickups_style_01a
					gtr_pickups_style_01b
					gtr_pickups_style_01c
					gtr_pickup_type1_blk_1
					gtr_pickup_type1_blk_2
					gtr_pickup_type1_blk_3
					gtr_pickup_type2_03
					gtr_pickup_type2_04
					gtr_pickup_type3_02
					gtr_pickup_type3_03
					gtr_pickup_type3b_02
					gtr_pickup_type3b_03
					gtr_pickup_type4_02
					gtr_pickup_type4_03
					gtr_pickup_type1_blktan_1
					gtr_pickup_type1_blktan_2
					gtr_pickup_type1_blktan_3
					gtr_pickup_type5_01
					gtr_pickup_type5_02
					gtr_pickup_type5_03
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr20_knob_type1_03
					gtr20_knob_type2_03
					gtr20_knob_type3_03
					gtr20_knob_type4_03
					gtr20_knob_type5_03
					gtr20_knob_type6_03
					gtr20_knob_type7_03
					gtr20_knob_type8_03
					gtr20_knob_type9_03
					gtr20_knob_type10_03
					none
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_hardware01b
					gtr_hardware01a
					gtr_hardware06
					gtr_hardware07
				]
			}
		]
	}
	{
		desc_id = guitar_x_clear_11
		frontend_desc = qs(0xd7169e67)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_X_Clear_11.skin'
		price = 2000
		pak_num = 1
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_clear_d_11.dds'
				material = guitar_x_clear_11_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_68
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_x_clear_pickg01
					none
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_pickups_style_01a
					gtr_pickups_style_01b
					gtr_pickups_style_01c
					gtr_pickup_type1_blk_1
					gtr_pickup_type1_blk_2
					gtr_pickup_type1_blk_3
					gtr_pickup_type2_03
					gtr_pickup_type2_04
					gtr_pickup_type3_02
					gtr_pickup_type3_03
					gtr_pickup_type3b_02
					gtr_pickup_type3b_03
					gtr_pickup_type4_02
					gtr_pickup_type4_03
					gtr_pickup_type1_blktan_1
					gtr_pickup_type1_blktan_2
					gtr_pickup_type1_blktan_3
					gtr_pickup_type5_01
					gtr_pickup_type5_02
					gtr_pickup_type5_03
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr31_knob_type1_03
					gtr31_knob_type2_03
					gtr31_knob_type3_03
					gtr31_knob_type4_03
					gtr31_knob_type5_03
					gtr31_knob_type6_03
					gtr31_knob_type7_03
					gtr31_knob_type8_03
					gtr31_knob_type9_03
					gtr31_knob_type10_03
					none
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_hardware01b
					gtr_hardware01a
					gtr_hardware05
					gtr_hardware06
					gtr_hardware07
				]
			}
		]
	}
	{
		desc_id = guitar_x_clear_12
		frontend_desc = qs(0xe8553ad7)
		price = 5000
		mesh = 'models/CAR_Instruments/Guitar/Guitar_X_Clear_12.skin'
		pak_num = 1
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_clear_d_11.dds'
				material = guitar_x_clear_12_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_68
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_x_clear2_pickg02
					none
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_pickups_style_01a
					gtr_pickups_style_01b
					gtr_pickups_style_01c
					gtr_pickup_type1_blk_1
					gtr_pickup_type1_blk_2
					gtr_pickup_type1_blk_3
					gtr_pickup_type2_03
					gtr_pickup_type2_04
					gtr_pickup_type3_02
					gtr_pickup_type3_03
					gtr_pickup_type3b_02
					gtr_pickup_type3b_03
					gtr_pickup_type4_02
					gtr_pickup_type4_03
					gtr_pickup_type1_blktan_1
					gtr_pickup_type1_blktan_2
					gtr_pickup_type1_blktan_3
					gtr_pickup_type5_01
					gtr_pickup_type5_02
					gtr_pickup_type5_03
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr32_knob_type1_03
					gtr32_knob_type2_03
					gtr32_knob_type3_03
					gtr32_knob_type4_03
					gtr32_knob_type5_03
					gtr32_knob_type6_03
					gtr32_knob_type7_03
					gtr32_knob_type8_03
					gtr32_knob_type9_03
					gtr32_knob_type10_03
					none
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_hardware01b
					gtr_hardware01a
					gtr_hardware05
					gtr_hardware06
					gtr_hardware07
				]
			}
		]
	}
	{
		desc_id = guitar_x_peace_13
		frontend_desc = qs(0x896f5aad)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_X_Peace_13.skin'
		pak_num = 2
		price = 1200
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_peace_d_13.dds'
				material = gtr_body_x_peace_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x3f47b13d)
				mask = $cag_x_guitar_peace
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_peace_d_13.dds'
				material = gtr_body_x_peace_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_x_guitar_peace_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_peace_d_13.dds'
				material = gtr_body_x_peace_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_71
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_peace_d_13.dds'
				material = gtr_body_x_peace_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_71
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_peace_d_13.dds'
				material = gtr_body_x_peace_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_71
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_peace_d_13.dds'
				material = gtr_body_x_peace_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_71
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_peace_d_13.dds'
				material = gtr_body_x_peace_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_71
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_peace_d_13.dds'
				material = gtr_body_x_peace_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_71
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_peace_d_13.dds'
				material = gtr_body_x_peace_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_71
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_peace_d_13.dds'
				material = gtr_body_x_peace_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_71
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_peace_d_13.dds'
				material = gtr_body_x_peace_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_71
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_peace_d_13.dds'
				material = gtr_body_x_peace_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_71
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_x_peace_pickg01
					none
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_pickups_style_01a
					gtr_pickups_style_01b
					gtr_pickups_style_01c
					gtr_pickup_type1_blk_1
					gtr_pickup_type1_blk_2
					gtr_pickup_type1_blk_3
					gtr_pickup_type2_03
					gtr_pickup_type2_04
					gtr_pickup_type3_02
					gtr_pickup_type3_03
					gtr_pickup_type3b_02
					gtr_pickup_type3b_03
					gtr_pickup_type4_02
					gtr_pickup_type4_03
					gtr_pickup_type1_blktan_1
					gtr_pickup_type1_blktan_2
					gtr_pickup_type1_blktan_3
					gtr_pickup_type5_01
					gtr_pickup_type5_02
					gtr_pickup_type5_03
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_x13_knob_type1_02
					gtr_x13_knob_type2_02
					gtr_x13_knob_type3_02
					gtr_x13_knob_type4_02
					gtr_x13_knob_type5_02
					gtr_x13_knob_type6_02
					gtr_x13_knob_type7_02
					gtr_x13_knob_type8_02
					gtr_x13_knob_type9_02
					gtr_x13_knob_type10_02
					none
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_hardware01a
					gtr_hardware01b
					gtr_hardware05
					gtr_hardware06
					gtr_hardware07
				]
			}
		]
	}
	{
		desc_id = guitar_x_anarchy_03
		frontend_desc = qs(0xfe5f4af3)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_X_Anarchy_03.skin'
		price = 1500
		pak_num = 2
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_anarchy_d_03.dds'
				material = gtr_body_x_anarchy_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_x_guitar_anarchy
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_anarchy_d_03.dds'
				material = gtr_body_x_anarchy_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_x_anarchy_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_anarchy_d_03.dds'
				material = gtr_body_x_anarchy_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_71
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_anarchy_d_03.dds'
				material = gtr_body_x_anarchy_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_71
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_anarchy_d_03.dds'
				material = gtr_body_x_anarchy_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_71
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_anarchy_d_03.dds'
				material = gtr_body_x_anarchy_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_71
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_anarchy_d_03.dds'
				material = gtr_body_x_anarchy_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_71
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_anarchy_d_03.dds'
				material = gtr_body_x_anarchy_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_71
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_anarchy_d_03.dds'
				material = gtr_body_x_anarchy_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_71
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_anarchy_d_03.dds'
				material = gtr_body_x_anarchy_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_71
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_anarchy_d_03.dds'
				material = gtr_body_x_anarchy_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_71
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_anarchy_d_03.dds'
				material = gtr_body_x_anarchy_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_71
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_x_anarc_pickg02
					gtr_x_anarc_pickg01
					none
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_pickups_style_01b
					gtr_pickups_style_01a
					gtr_pickups_style_01c
					gtr_pickup_type1_blk_1
					gtr_pickup_type1_blk_2
					gtr_pickup_type1_blk_3
					gtr_pickup_type2_03
					gtr_pickup_type2_04
					gtr_pickup_type3_02
					gtr_pickup_type3_03
					gtr_pickup_type3b_02
					gtr_pickup_type3b_03
					gtr_pickup_type4_02
					gtr_pickup_type4_03
					gtr_pickup_type1_blktan_1
					gtr_pickup_type1_blktan_2
					gtr_pickup_type1_blktan_3
					gtr_pickup_type5_01
					gtr_pickup_type5_02
					gtr_pickup_type5_03
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_x3_knob_type1_03
					gtr_x3_knob_type2_03
					gtr_x3_knob_type3_03
					gtr_x3_knob_type4_03
					gtr_x3_knob_type5_03
					gtr_x3_knob_type6_03
					gtr_x3_knob_type7_03
					gtr_x3_knob_type8_03
					gtr_x3_knob_type9_03
					gtr_x3_knob_type10_03
					none
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_x3_anarc_hardware03
				]
			}
		]
	}
	{
		desc_id = guitar_special_skull_01
		frontend_desc = qs(0x2770ed10)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_Special_Skull_01.skin'
		pak_num = 2
		price = 1500
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/Guitar_Special_Skull_D_01.dds'
				material = gtr_body_x_skull_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_special_guitar_skull
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_skull_d_01.dds'
				material = gtr_body_x_skull_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_x_skull_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/Guitar_Special_Skull_D_01.dds'
				material = gtr_body_x_skull_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_76
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/Guitar_Special_Skull_D_01.dds'
				material = gtr_body_x_skull_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_76
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/Guitar_Special_Skull_D_01.dds'
				material = gtr_body_x_skull_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_76
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/Guitar_Special_Skull_D_01.dds'
				material = gtr_body_x_skull_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_76
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/Guitar_Special_Skull_D_01.dds'
				material = gtr_body_x_skull_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_76
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/Guitar_Special_Skull_D_01.dds'
				material = gtr_body_x_skull_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_76
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/Guitar_Special_Skull_D_01.dds'
				material = gtr_body_x_skull_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_76
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/Guitar_Special_Skull_D_01.dds'
				material = gtr_body_x_skull_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_76
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/Guitar_Special_Skull_D_01.dds'
				material = gtr_body_x_skull_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_76
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/Guitar_Special_Skull_D_01.dds'
				material = gtr_body_x_skull_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_76
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_x_skull_pickg01
					none
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_x1_skull_pickup_01
					gtr_pickup_skul1_blk_01
					gtr_pickup_skul1_blktan_01
					none
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_x1_skull_knob_02
					gtr_x1_skull_knob_01
					gtr_x1_knob_type2_02
					gtr_x1_knob_type2_01
					gtr_x1_knob_type3_02
					gtr_x1_knob_type3_01
					gtr_x1_knob_type4_02
					gtr_x1_knob_type4_01
					gtr_x1_knob_type5_02
					gtr_x1_knob_type5_01
					gtr_x1_knob_type6_02
					gtr_x1_knob_type6_01
					gtr_x1_knob_type7_02
					gtr_x1_knob_type7_01
					gtr_x1_knob_type8_02
					gtr_x1_knob_type8_01
					gtr_x1_knob_type9_02
					gtr_x1_knob_type9_01
					gtr_x1_knob_type10_02
					gtr_x1_knob_type10_01
					none
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_x1_skull_hardware02
				]
			}
		]
	}
	{
		desc_id = guitar_special_spider_02
		frontend_desc = qs(0xe7ef2e27)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_Special_Spider_02.skin'
		price = 1000
		pak_num = 2
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/Guitar_Special_Spider_D_01.dds'
				material = gtr_body_x_spider_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x3f47b13d)
				mask = $cag_special_guitar_spider
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/Guitar_Special_Spider_D_01.dds'
				material = gtr_body_x_spider_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_x_spider_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/Guitar_Special_Spider_D_01.dds'
				material = gtr_body_x_spider_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_79
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/Guitar_Special_Spider_D_01.dds'
				material = gtr_body_x_spider_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_79
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/Guitar_Special_Spider_D_01.dds'
				material = gtr_body_x_spider_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_79
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/Guitar_Special_Spider_D_01.dds'
				material = gtr_body_x_spider_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_79
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/Guitar_Special_Spider_D_01.dds'
				material = gtr_body_x_spider_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_79
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/Guitar_Special_Spider_D_01.dds'
				material = gtr_body_x_spider_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_79
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/Guitar_Special_Spider_D_01.dds'
				material = gtr_body_x_spider_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_79
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/Guitar_Special_Spider_D_01.dds'
				material = gtr_body_x_spider_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_79
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/Guitar_Special_Spider_D_01.dds'
				material = gtr_body_x_spider_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_79
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/Guitar_Special_Spider_D_01.dds'
				material = gtr_body_x_spider_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_79
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_x_spider_pickg01
					none
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_pickups_style_01a
					gtr_pickups_style_01b
					gtr_pickups_style_01c
					gtr_pickup_type1_blk_1
					gtr_pickup_type1_blk_2
					gtr_pickup_type1_blk_3
					gtr_pickup_type2_03
					gtr_pickup_type2_04
					gtr_pickup_type3_02
					gtr_pickup_type3_03
					gtr_pickup_type3b_02
					gtr_pickup_type3b_03
					gtr_pickup_type4_02
					gtr_pickup_type4_03
					gtr_pickup_type1_blktan_1
					gtr_pickup_type1_blktan_2
					gtr_pickup_type1_blktan_3
					gtr_pickup_type5_01
					gtr_pickup_type5_02
					gtr_pickup_type5_03
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_x2_knob_type1_03
					gtr_x2_knob_type2_03
					gtr_x2_knob_type2_03
					gtr_x2_knob_type4_03
					gtr_x2_knob_type5_03
					gtr_x2_knob_type6_03
					gtr_x2_knob_type7_03
					gtr_x2_knob_type8_03
					gtr_x2_knob_type9_03
					gtr_x2_knob_type10_03
					none
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_hardware01b
					gtr_hardware01a
					gtr_hardware05
					gtr_hardware06
					gtr_hardware07
				]
			}
		]
	}
	{
		desc_id = guitar_x_icross_04
		frontend_desc = qs(0xd65fee60)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_X_ICross_04.skin'
		pak_num = 2
		price = 1500
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_icross_d_04.dds'
				material = gtr_body_x_icross_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x3f47b13d)
				mask = $cag_x_guitar_icross
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_icross_d_04.dds'
				material = gtr_body_x_icross_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_x_icross_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_icross_d_04.dds'
				material = gtr_body_x_icross_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_82
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_icross_d_04.dds'
				material = gtr_body_x_icross_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_82
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_icross_d_04.dds'
				material = gtr_body_x_icross_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_82
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_icross_d_04.dds'
				material = gtr_body_x_icross_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_82
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_icross_d_04.dds'
				material = gtr_body_x_icross_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_82
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_icross_d_04.dds'
				material = gtr_body_x_icross_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_82
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_icross_d_04.dds'
				material = gtr_body_x_icross_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_82
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_icross_d_04.dds'
				material = gtr_body_x_icross_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_82
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_icross_d_04.dds'
				material = gtr_body_x_icross_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_82
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_icross_d_04.dds'
				material = gtr_body_x_icross_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_82
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_x_xross_pickg01
					none
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_pickups_style_01a
					gtr_pickups_style_01b
					gtr_pickups_style_01c
					gtr_pickup_type1_blk_1
					gtr_pickup_type1_blk_2
					gtr_pickup_type1_blk_3
					gtr_pickup_type2_03
					gtr_pickup_type2_04
					gtr_pickup_type3_02
					gtr_pickup_type3_03
					gtr_pickup_type3b_02
					gtr_pickup_type3b_03
					gtr_pickup_type4_02
					gtr_pickup_type4_03
					gtr_pickup_type1_blktan_1
					gtr_pickup_type1_blktan_2
					gtr_pickup_type1_blktan_3
					gtr_pickup_type5_01
					gtr_pickup_type5_02
					gtr_pickup_type5_03
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_x4_knob_type1_03
					gtr_x4_knob_type2_03
					gtr_x4_knob_type3_03
					gtr_x4_knob_type4_03
					gtr_x4_knob_type5_03
					gtr_x4_knob_type6_03
					gtr_x4_knob_type7_03
					gtr_x4_knob_type8_03
					gtr_x4_knob_type9_03
					gtr_x4_knob_type10_03
					none
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_hardware01b
					gtr_hardware01a
					gtr_hardware05
					gtr_hardware06
					gtr_hardware07
				]
			}
		]
	}
	{
		desc_id = guitar_x_battleaxe_05
		frontend_desc = qs(0x0ff0ad29)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_X_Battleaxe_05.skin'
		pak_num = 2
		price = 2000
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_battle_axe_d_05.dds'
				material = gtr_body_x_battleaxe_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x3f47b13d)
				mask = $cag_x_guitar_battleaxe
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_battle_axe_d_05.dds'
				material = gtr_body_x_battleaxe_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_x_battleaxe_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_battle_axe_d_05.dds'
				material = gtr_body_x_battleaxe_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_85
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_battle_axe_d_05.dds'
				material = gtr_body_x_battleaxe_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_85
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_battle_axe_d_05.dds'
				material = gtr_body_x_battleaxe_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_85
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_battle_axe_d_05.dds'
				material = gtr_body_x_battleaxe_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_85
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_battle_axe_d_05.dds'
				material = gtr_body_x_battleaxe_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_85
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_battle_axe_d_05.dds'
				material = gtr_body_x_battleaxe_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_85
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_battle_axe_d_05.dds'
				material = gtr_body_x_battleaxe_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_85
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_battle_axe_d_05.dds'
				material = gtr_body_x_battleaxe_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_85
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_battle_axe_d_05.dds'
				material = gtr_body_x_battleaxe_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_85
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_battle_axe_d_05.dds'
				material = gtr_body_x_battleaxe_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_85
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					none
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_pickups_style_01a
					gtr_pickups_style_01b
					gtr_pickups_style_01c
					gtr_pickup_type1_blk_1
					gtr_pickup_type1_blk_2
					gtr_pickup_type1_blk_3
					gtr_pickup_type2_03
					gtr_pickup_type2_04
					gtr_pickup_type3_02
					gtr_pickup_type3_03
					gtr_pickup_type3b_02
					gtr_pickup_type3b_03
					gtr_pickup_type4_02
					gtr_pickup_type4_03
					gtr_pickup_type1_blktan_1
					gtr_pickup_type1_blktan_2
					gtr_pickup_type1_blktan_3
					gtr_pickup_type5_01
					gtr_pickup_type5_02
					gtr_pickup_type5_03
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_x5_knob_type1_03
					gtr_x5_knob_type2_03
					gtr_x5_knob_type3_03
					gtr_x5_knob_type4_03
					gtr_x5_knob_type5_03
					gtr_x5_knob_type6_03
					gtr_x5_knob_type7_03
					gtr_x5_knob_type8_03
					gtr_x5_knob_type9_03
					gtr_x5_knob_type10_03
					none
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_hardware01b
					gtr_hardware01a
					gtr_hardware05
					gtr_hardware06
				]
			}
		]
	}
	{
		desc_id = guitar_x_heart_06
		frontend_desc = qs(0x53b132ed)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_X_Heart_06.skin'
		pak_num = 2
		price = 750
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_heart_d_06.dds'
				material = gtr_body_x_heart_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x3f47b13d)
				mask = $cag_x_guitar_heart
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_heart_d_06.dds'
				material = gtr_body_x_heart_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_x_heart_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_heart_d_06.dds'
				material = gtr_body_x_heart_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_88
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_heart_d_06.dds'
				material = gtr_body_x_heart_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_88
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_heart_d_06.dds'
				material = gtr_body_x_heart_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_88
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_heart_d_06.dds'
				material = gtr_body_x_heart_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_88
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_heart_d_06.dds'
				material = gtr_body_x_heart_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_88
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_heart_d_06.dds'
				material = gtr_body_x_heart_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_88
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_heart_d_06.dds'
				material = gtr_body_x_heart_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_88
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_heart_d_06.dds'
				material = gtr_body_x_heart_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_88
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_heart_d_06.dds'
				material = gtr_body_x_heart_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_88
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_heart_d_06.dds'
				material = gtr_body_x_heart_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_88
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_x_heart_pickg01
					gtr_x_heart_pickg02
					none
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_pickups_style_01a
					gtr_pickups_style_01b
					gtr_pickups_style_01c
					gtr_pickup_type1_blk_1
					gtr_pickup_type1_blk_2
					gtr_pickup_type1_blk_3
					gtr_pickup_type2_03
					gtr_pickup_type2_04
					gtr_pickup_type3_02
					gtr_pickup_type3_03
					gtr_pickup_type3b_02
					gtr_pickup_type3b_03
					gtr_pickup_type4_02
					gtr_pickup_type4_03
					gtr_pickup_type1_blktan_1
					gtr_pickup_type1_blktan_2
					gtr_pickup_type1_blktan_3
					gtr_pickup_type5_01
					gtr_pickup_type5_02
					gtr_pickup_type5_03
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_x6_knob_type1_03
					gtr_x6_knob_type2_03
					gtr_x6_knob_type3_03
					gtr_x6_knob_type4_03
					gtr_x6_knob_type5_03
					gtr_x6_knob_type6_03
					gtr_x6_knob_type7_03
					gtr_x6_knob_type8_03
					gtr_x6_knob_type9_03
					gtr_x6_knob_type10_03
					none
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_hardware01b
					gtr_hardware01a
					gtr_hardware05
					gtr_hardware06
					gtr_hardware07
				]
			}
		]
	}
	{
		desc_id = guitar_x_money_07
		frontend_desc = qs(0x7c97d129)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_X_Money_07.skin'
		price = 1500
		pak_num = 2
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_money_d_07.dds'
				material = gtr_body_x_money_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x3f47b13d)
				mask = $cag_x_guitar_money
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_money_d_07.dds'
				material = gtr_body_x_money_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_x_money_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_money_d_07.dds'
				material = gtr_body_x_money_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_91
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_money_d_07.dds'
				material = gtr_body_x_money_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_91
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_money_d_07.dds'
				material = gtr_body_x_money_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_91
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_money_d_07.dds'
				material = gtr_body_x_money_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_91
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_money_d_07.dds'
				material = gtr_body_x_money_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_91
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_money_d_07.dds'
				material = gtr_body_x_money_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_91
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_money_d_07.dds'
				material = gtr_body_x_money_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_91
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_money_d_07.dds'
				material = gtr_body_x_money_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_91
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_money_d_07.dds'
				material = gtr_body_x_money_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_91
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_money_d_07.dds'
				material = gtr_body_x_money_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_91
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_x_money_pickg01
					none
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_pickups_style_01a
					gtr_pickups_style_01b
					gtr_pickups_style_01c
					gtr_pickup_type1_blk_1
					gtr_pickup_type1_blk_2
					gtr_pickup_type1_blk_3
					gtr_pickup_type2_03
					gtr_pickup_type2_04
					gtr_pickup_type3_02
					gtr_pickup_type3_03
					gtr_pickup_type3b_02
					gtr_pickup_type3b_03
					gtr_pickup_type4_02
					gtr_pickup_type4_03
					gtr_pickup_type1_blktan_1
					gtr_pickup_type1_blktan_2
					gtr_pickup_type1_blktan_3
					gtr_pickup_type5_01
					gtr_pickup_type5_02
					gtr_pickup_type5_03
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_x7_knob_type1_03
					gtr_x7_knob_type2_03
					gtr_x7_knob_type3_03
					gtr_x7_knob_type4_03
					gtr_x7_knob_type5_03
					gtr_x7_knob_type6_03
					gtr_x7_knob_type7_03
					gtr_x7_knob_type8_03
					gtr_x7_knob_type9_03
					gtr_x7_knob_type10_03
					none
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_hardware01b
					gtr8_hardware08a
					gtr_hardware05
					gtr_hardware06
					gtr_hardware07
				]
			}
		]
	}
	{
		desc_id = guitar_x_flames_08
		frontend_desc = qs(0x6f1e674f)
		price = 750
		mesh = 'models/CAR_Instruments/Guitar/Guitar_X_Flames_08.skin'
		pak_num = 2
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_flames_d_08.dds'
				material = gtr_body_x_flames_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x3f47b13d)
				mask = $cag_x_guitar_flames
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_flames_d_08.dds'
				material = gtr_body_x_flames_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_x_flames_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_flames_d_08.dds'
				material = gtr_body_x_flames_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_94
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_flames_d_08.dds'
				material = gtr_body_x_flames_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_94
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_flames_d_08.dds'
				material = gtr_body_x_flames_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_94
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_flames_d_08.dds'
				material = gtr_body_x_flames_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_94
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_flames_d_08.dds'
				material = gtr_body_x_flames_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_94
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_flames_d_08.dds'
				material = gtr_body_x_flames_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_94
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_flames_d_08.dds'
				material = gtr_body_x_flames_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_94
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_flames_d_08.dds'
				material = gtr_body_x_flames_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_94
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_flames_d_08.dds'
				material = gtr_body_x_flames_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_94
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_flames_d_08.dds'
				material = gtr_body_x_flames_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_94
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_x_fire_pickg02
					gtr_x_fire_pickg01
					none
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_pickups_style_01a
					gtr_pickups_style_01b
					gtr_pickups_style_01c
					gtr_pickup_type1_blk_1
					gtr_pickup_type1_blk_2
					gtr_pickup_type1_blk_3
					gtr_pickup_type2_03
					gtr_pickup_type2_04
					gtr_pickup_type3_02
					gtr_pickup_type3_03
					gtr_pickup_type3b_02
					gtr_pickup_type3b_03
					gtr_pickup_type4_02
					gtr_pickup_type4_03
					gtr_pickup_type1_blktan_1
					gtr_pickup_type1_blktan_2
					gtr_pickup_type1_blktan_3
					gtr_pickup_type5_01
					gtr_pickup_type5_02
					gtr_pickup_type5_03
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_x8_knob_type1_03
					gtr_x8_knob_type2_03
					gtr_x8_knob_type3_03
					gtr_x8_knob_type4_03
					gtr_x8_knob_type5_03
					gtr_x8_knob_type6_03
					gtr_x8_knob_type3_07
					gtr_x8_knob_type8_03
					gtr_x8_knob_type9_03
					gtr_x8_knob_type10_03
					none
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_hardware01b
					gtr8_hardware08a
					gtr_hardware05
					gtr_hardware06
					gtr_hardware07
				]
			}
		]
	}
	{
		desc_id = guitar_x_freebird_09
		frontend_desc = qs(0xdc1558fa)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_X_Freebird_09.skin'
		price = 1000
		pak_num = 2
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_bird_d_09.dds'
				material = gtr_body_x_bird_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x3f47b13d)
				mask = $cag_x_guitar_bird
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_bird_d_09.dds'
				material = gtr_body_x_bird_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_x_bird_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_bird_d_09.dds'
				material = gtr_body_x_bird_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_97
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_bird_d_09.dds'
				material = gtr_body_x_bird_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_97
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_bird_d_09.dds'
				material = gtr_body_x_bird_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_97
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_bird_d_09.dds'
				material = gtr_body_x_bird_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_97
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_bird_d_09.dds'
				material = gtr_body_x_bird_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_97
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_bird_d_09.dds'
				material = gtr_body_x_bird_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_97
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_bird_d_09.dds'
				material = gtr_body_x_bird_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_97
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_bird_d_09.dds'
				material = gtr_body_x_bird_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_97
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_bird_d_09.dds'
				material = gtr_body_x_bird_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_97
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_bird_d_09.dds'
				material = gtr_body_x_bird_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_97
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_x_bird_pickg01
					none
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_pickups_style_01a
					gtr_pickups_style_01b
					gtr_pickups_style_01c
					gtr_pickup_type1_blk_1
					gtr_pickup_type1_blk_2
					gtr_pickup_type1_blk_3
					gtr_pickup_type2_03
					gtr_pickup_type2_04
					gtr_pickup_type3_02
					gtr_pickup_type3_03
					gtr_pickup_type3b_02
					gtr_pickup_type3b_03
					gtr_pickup_type4_02
					gtr_pickup_type4_03
					gtr_pickup_type1_blktan_1
					gtr_pickup_type1_blktan_2
					gtr_pickup_type1_blktan_3
					gtr_pickup_type5_01
					gtr_pickup_type5_02
					gtr_pickup_type5_03
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_x9_knob_type1_03
					gtr_x9_knob_type2_03
					gtr_x9_knob_type3_03
					gtr_x9_knob_type4_03
					gtr_x9_knob_type5_03
					gtr_x9_knob_type6_03
					gtr_x9_knob_type7_03
					gtr_x9_knob_type8_03
					gtr_x9_knob_type9_03
					gtr_x9_knob_type10_03
					none
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_hardware01b
					gtr8_hardware08a
					gtr_hardware05
					gtr_hardware06
					gtr_hardware07
				]
			}
		]
	}
	{
		desc_id = guitar_x_trident_10
		frontend_desc = qs(0x65dbef68)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_X_Trident_10.skin'
		pak_num = 2
		price = 1300
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_trident_d_10.dds'
				material = gtr_body_x_trident_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x3f47b13d)
				mask = $cag_x_guitar_trident
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_trident_d_10.dds'
				material = gtr_body_x_trident_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_x_trident_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_trident_d_10.dds'
				material = gtr_body_x_trident_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_100
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_trident_d_10.dds'
				material = gtr_body_x_trident_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_100
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_trident_d_10.dds'
				material = gtr_body_x_trident_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_100
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_trident_d_10.dds'
				material = gtr_body_x_trident_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_100
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_trident_d_10.dds'
				material = gtr_body_x_trident_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_100
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_trident_d_10.dds'
				material = gtr_body_x_trident_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_100
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_trident_d_10.dds'
				material = gtr_body_x_trident_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_100
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_trident_d_10.dds'
				material = gtr_body_x_trident_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_100
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_trident_d_10.dds'
				material = gtr_body_x_trident_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_100
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_trident_d_10.dds'
				material = gtr_body_x_trident_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_100
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_x_trident_pickg01
					none
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_pickups_style_01a
					gtr_pickups_style_01b
					gtr_pickups_style_01c
					gtr_pickup_type1_blk_1
					gtr_pickup_type1_blk_2
					gtr_pickup_type1_blk_3
					gtr_pickup_type2_03
					gtr_pickup_type2_04
					gtr_pickup_type3_02
					gtr_pickup_type3_03
					gtr_pickup_type3b_02
					gtr_pickup_type3b_03
					gtr_pickup_type4_02
					gtr_pickup_type4_03
					gtr_pickup_type1_blktan_1
					gtr_pickup_type1_blktan_2
					gtr_pickup_type1_blktan_3
					gtr_pickup_type5_01
					gtr_pickup_type5_02
					gtr_pickup_type5_03
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_x10_knob_type1_03
					gtr_x10_knob_type2_03
					gtr_x10_knob_type3_03
					gtr_x10_knob_type4_03
					gtr_x10_knob_type5_03
					gtr_x10_knob_type6_03
					gtr_x10_knob_type7_03
					gtr_x10_knob_type8_03
					gtr_x10_knob_type9_03
					gtr_x10_knob_type10_03
					none
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_hardware01b
					gtr8_hardware08a
					gtr_hardware05
					gtr_hardware06
					gtr_hardware07
				]
			}
		]
	}
	{
		desc_id = guitar_x_yinyang_14
		frontend_desc = qs(0x265bc4e8)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_X_YinYang_14.skin'
		polaroid = guitar_rewards_body_ying
		pak_num = 2
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_yinyang_d_14.dds'
				material = gtr_body_x_yinyang_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x3f47b13d)
				mask = $cag_x_guitar_yinyang
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_yinyang_d_14.dds'
				material = gtr_body_x_yinyang_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_x_guitar_yinyang_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_yinyang_d_14.dds'
				material = gtr_body_x_yinyang_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_71
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_yinyang_d_14.dds'
				material = gtr_body_x_yinyang_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_71
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_yinyang_d_14.dds'
				material = gtr_body_x_yinyang_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_71
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_yinyang_d_14.dds'
				material = gtr_body_x_yinyang_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_71
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_yinyang_d_14.dds'
				material = gtr_body_x_yinyang_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_71
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_yinyang_d_14.dds'
				material = gtr_body_x_yinyang_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_71
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_yinyang_d_14.dds'
				material = gtr_body_x_yinyang_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_71
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_yinyang_d_14.dds'
				material = gtr_body_x_yinyang_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_71
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_yinyang_d_14.dds'
				material = gtr_body_x_yinyang_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_71
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_yinyang_d_14.dds'
				material = gtr_body_x_yinyang_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_71
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_x_yinyang_pickg01
					none
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_pickups_style_01a
					gtr_pickups_style_01b
					gtr_pickups_style_01c
					gtr_pickup_type1_blk_1
					gtr_pickup_type1_blk_2
					gtr_pickup_type1_blk_3
					gtr_pickup_type2_03
					gtr_pickup_type2_04
					gtr_pickup_type3_02
					gtr_pickup_type3_03
					gtr_pickup_type3b_02
					gtr_pickup_type3b_03
					gtr_pickup_type4_02
					gtr_pickup_type4_03
					gtr_pickup_type1_blktan_1
					gtr_pickup_type1_blktan_2
					gtr_pickup_type1_blktan_3
					gtr_pickup_type5_01
					gtr_pickup_type5_02
					gtr_pickup_type5_03
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_x14_knob_type1_02
					gtr_x14_knob_type2_02
					gtr_x14_knob_type3_02
					gtr_x14_knob_type4_02
					gtr_x14_knob_type5_02
					gtr_x14_knob_type6_02
					gtr_x14_knob_type7_02
					gtr_x14_knob_type8_02
					gtr_x14_knob_type9_02
					gtr_x14_knob_type10_02
					none
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_hardware01a
					gtr_hardware01b
					gtr_hardware05
					gtr_hardware06
					gtr_hardware07
				]
			}
		]
	}
]
cas_guitar_pickguards = [
	{
		desc_id = gtr_pickguard_vh1
		frontend_desc = qs(0x3ba5f0cb)
		mesh = 'models/CAR_Instruments/Guitar/VH/GTR_Pickguard_VH1.skin'
		random_weight = 0.0
		$car_rocker_guitars_factoredglobal_103
	}
	{
		desc_id = gtr_pickguard_vhfstrat
		frontend_desc = qs(0xfa697798)
		mesh = 'models/CAR_Instruments/Guitar/VH/GTR_Pickguard_VHFstrat.skin'
		random_weight = 0.0
		$car_rocker_guitars_factoredglobal_103
	}
	{
		desc_id = gtr_pickguard_vhshark
		frontend_desc = qs(0x07cdcf2e)
		mesh = 'models/CAR_Instruments/Guitar/VH/GTR_Pickguard_VHShark.skin'
		random_weight = 0.0
		$car_rocker_guitars_factoredglobal_103
	}
	{
		desc_id = gtr_pickguard_vhdlr
		frontend_desc = qs(0x5b27b92d)
		mesh = 'models/CAR_Instruments/Guitar/VH/GTR_Pickguard_VHDLR.skin'
		random_weight = 0.0
		$car_rocker_guitars_factoredglobal_103
	}
	{
		desc_id = guitar_pickg01
		frontend_desc = qs(0xe12cff36)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_PickG01.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/Pickgrd1_Body1_D_01.dds'
				material = gtr_body1_pickgrd_01_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr1_pickgrd01
			}
		]
	}
	{
		desc_id = gtr_body1_pickg02
		frontend_desc = qs(0xca01acf5)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Body1_PickG02.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd2_body1_d_01.dds'
				material = pckgrd2_body1_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr1_pickgrd02
			}
		]
	}
	{
		desc_id = gtr_body1_pickg03
		frontend_desc = qs(0xd31a9db4)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Body1_PickG03.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/Pickgrd3_Body1_D_01.dds'
				material = gtr_pckgrd3_body1_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr1_pickgrd03
			}
		]
	}
	{
		desc_id = gtr_body2_pickg01
		frontend_desc = qs(0xe12cff36)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Body2_PickG01.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd1_body2_d_01.dds'
				material = gtr_body2_pckgrd1_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr2_pickgrd01
			}
		]
	}
	{
		desc_id = gtr_body2_pickg02
		frontend_desc = qs(0xca01acf5)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Body2_PickG02.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd1_body2_02.dds'
				material = gtr_body2_pckgrd2_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr2_pickgrd02
			}
		]
	}
	{
		desc_id = gtr_body2_pickg03
		frontend_desc = qs(0xd31a9db4)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Body2_PickG03.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd1_body2_03.dds'
				material = gtr_body2_pckgrd3_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr2_pickgrd03
			}
		]
	}
	{
		desc_id = gtr_body3_pickg01
		frontend_desc = qs(0xe12cff36)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Body3_PickG01.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body3_d_01.dds'
				material = pckgrd_body3_01_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr3_pickgrd01
			}
		]
	}
	{
		desc_id = gtr_body3_pickg02
		frontend_desc = qs(0xca01acf5)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Body3_PickG02.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body3_d_02.dds'
				material = pckgrd_body3_02_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr3_pickgrd02
			}
		]
	}
	{
		desc_id = gtr_body3_pickg03
		frontend_desc = qs(0xd31a9db4)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Body3_PickG03.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body3_d_03.dds'
				material = pckgrd_body3_03_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr3_pickgrd03
			}
		]
	}
	{
		desc_id = gtr_body4_pickg01
		frontend_desc = qs(0xe12cff36)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Body4_PickG01.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body4_d_01.dds'
				material = pckgrd_body4_01_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr4_pickgrd01
			}
		]
	}
	{
		desc_id = gtr_body4_pickg02
		frontend_desc = qs(0xca01acf5)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Body4_PickG02.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body4_d_02.dds'
				material = pckgrd_body4_02_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr4_pickgrd02
			}
		]
	}
	{
		desc_id = gtr_body4_pickg03
		frontend_desc = qs(0xd31a9db4)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Body4_PickG03.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body4_d_03.dds'
				material = pckgrd_body4_03_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr4_pickgrd03
			}
		]
	}
	{
		desc_id = gtr_body5_pickg02
		frontend_desc = qs(0xe12cff36)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Body5_PickG02.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body5_d_02.dds'
				material = pckgrd_body5_02_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr5_pickgrd02
			}
		]
	}
	{
		desc_id = gtr_body5_pickg01
		frontend_desc = qs(0xca01acf5)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Body5_PickG01.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body5_d_01.dds'
				material = pckgrd_body5_01_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr5_pickgrd01
			}
		]
	}
	{
		desc_id = gtr_body5_pickg03
		frontend_desc = qs(0xd31a9db4)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Body5_PickG03.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body5_d_03.dds'
				material = pckgrd_body5_03_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr5_pickgrd03
			}
		]
	}
	{
		desc_id = gtr_body6_pickg01
		frontend_desc = qs(0xe12cff36)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Body6_PickG01.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body6_d_01.dds'
				material = pckgrd_body6_01_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr6_pickgrd01
			}
		]
	}
	{
		desc_id = gtr_body6_pickg02
		frontend_desc = qs(0xca01acf5)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Body6_PickG02.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body6_d_02.dds'
				material = pckgrd_body6_02_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr6_pickgrd02
			}
		]
	}
	{
		desc_id = gtr_body6_pickg03
		frontend_desc = qs(0xd31a9db4)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Body6_PickG03.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body6_d_03.dds'
				material = pckgrd_body6_03_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr6_pickgrd03
			}
		]
	}
	{
		desc_id = gtr_body7_pickg01
		frontend_desc = qs(0xe12cff36)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Body7_PickG01.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body7_d_01.dds'
				material = pckgrd_body7_01_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr7_pickgrd01
			}
		]
	}
	{
		desc_id = gtr_body7_pickg02
		frontend_desc = qs(0xca01acf5)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Body7_PickG02.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body7_d_02.dds'
				material = pckgrd_body7_02_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr7_pickgrd02
			}
		]
	}
	{
		desc_id = gtr_body7_pickg03
		frontend_desc = qs(0xd31a9db4)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Body7_PickG03.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body7_d_03.dds'
				material = pckgrd_body7_03_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr7_pickgrd03
			}
		]
	}
	{
		desc_id = gtr_body8_pickg01
		frontend_desc = qs(0xe12cff36)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Body8_PickG01.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body8_d_01.dds'
				material = pckgrd_body8_01_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr8_pickgrd01
			}
		]
	}
	{
		desc_id = gtr_body8_pickg02
		frontend_desc = qs(0xca01acf5)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Body8_PickG02.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body8_d_02.dds'
				material = pckgrd_body8_02_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr8_pickgrd02
			}
		]
	}
	{
		desc_id = gtr_body8_pickg03
		frontend_desc = qs(0xd31a9db4)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Body8_PickG03.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body8_d_03.dds'
				material = pckgrd_body8_03_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr8_pickgrd03
			}
		]
	}
	{
		desc_id = gtr_body9_pickg02
		frontend_desc = qs(0xe12cff36)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Body9_PickG02.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body9_d_02.dds'
				material = pckgrd_body9_02_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr9_pickgrd02
			}
		]
	}
	{
		desc_id = gtr_body9_pickg03
		frontend_desc = qs(0xca01acf5)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Body9_PickG03.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body9_d_03.dds'
				material = pckgrd_body9_03_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr9_pickgrd03
			}
		]
	}
	{
		desc_id = gtr_body9_pickg01
		frontend_desc = qs(0xd31a9db4)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Body9_PickG01.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body9_d_01.dds'
				material = pckgrd_body9_01_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr9_pickgrd01
			}
		]
	}
	{
		desc_id = gtr_body10_pickg01
		frontend_desc = qs(0xe12cff36)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Body10_PickG01.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body10_d_01.dds'
				material = pckgrd_body10_01_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr10_pickgrd01
			}
		]
	}
	{
		desc_id = gtr_body10_pickg02
		frontend_desc = qs(0xca01acf5)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Body10_PickG02.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body10_d_02.dds'
				material = pckgrd_body10_02_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr10_pickgrd02
			}
		]
	}
	{
		desc_id = gtr_body10_pickg03
		frontend_desc = qs(0xd31a9db4)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Body10_PickG03.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body10_d_03.dds'
				material = pckgrd_body10_03_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr10_pickgrd03
			}
		]
	}
	{
		desc_id = gtr_body11_pickg01
		frontend_desc = qs(0xe12cff36)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Body11_PickG01.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body11_d_01.dds'
				material = pckgrd_body11_01_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr11_pickgrd01
			}
		]
	}
	{
		desc_id = gtr_body11_pickg02
		frontend_desc = qs(0xca01acf5)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Body11_PickG02.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body11_d_02.dds'
				material = pckgrd_body11_02_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr11_pickgrd02
			}
		]
	}
	{
		desc_id = gtr_body11_pickg03
		frontend_desc = qs(0xd31a9db4)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Body11_PickG03.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body11_d_03.dds'
				material = pckgrd_body11_03_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr11_pickgrd03
			}
		]
	}
	{
		desc_id = gtr_body12_pickg01
		frontend_desc = qs(0xe12cff36)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Body12_PickG01.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body12_d_01.dds'
				material = pckgrd_body12_01_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr12_pickgrd01
			}
		]
	}
	{
		desc_id = gtr_body12_pickg02
		frontend_desc = qs(0xca01acf5)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Body12_PickG02.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body12_d_02.dds'
				material = pckgrd_body12_02_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr12_pickgrd02
			}
		]
	}
	{
		desc_id = gtr_body12_pickg03
		frontend_desc = qs(0xd31a9db4)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Body12_PickG03.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body12_d_03.dds'
				material = pckgrd_body12_03_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr12_pickgrd03
			}
		]
	}
	{
		desc_id = gtr_body13_pickg01
		frontend_desc = qs(0xe12cff36)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Body13_PickG01.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body13_d_01.dds'
				material = pckgrd_body13_01_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr13_pickgrd01
			}
		]
	}
	{
		desc_id = gtr_body13_pickg02
		frontend_desc = qs(0xca01acf5)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Body13_PickG02.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body13_d_02.dds'
				material = pckgrd_body13_02_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr13_pickgrd02
			}
		]
	}
	{
		desc_id = gtr_body13_pickg03
		frontend_desc = qs(0xd31a9db4)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Body13_PickG03.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body13_d_03.dds'
				material = pckgrd_body13_03_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr13_pickgrd03
			}
		]
	}
	{
		desc_id = gtr_body14_pickg01
		frontend_desc = qs(0xe12cff36)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Body14_PickG01.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body14_d_01.dds'
				material = pckgrd_body14_01_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr14_pickgrd01
			}
		]
	}
	{
		desc_id = gtr_body14_pickg02
		frontend_desc = qs(0xca01acf5)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Body14_PickG02.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body14_d_02.dds'
				material = pckgrd_body14_02_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr14_pickgrd02
			}
		]
	}
	{
		desc_id = gtr_body14_pickg03
		frontend_desc = qs(0xd31a9db4)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Body14_PickG03.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body14_d_03.dds'
				material = pckgrd_body14_03_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr14_pickgrd03
			}
		]
	}
	{
		desc_id = gtr_body15_pickg01
		frontend_desc = qs(0xe12cff36)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Body15_PickG01.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body15_d_01.dds'
				material = pckgrd_body15_01_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr15_pickgrd01
			}
		]
	}
	{
		desc_id = gtr_body15_pickg02
		frontend_desc = qs(0xca01acf5)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Body15_PickG02.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body15_d_02.dds'
				material = pckgrd_body15_02_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr15_pickgrd02
			}
		]
	}
	{
		desc_id = gtr_body15_pickg03
		frontend_desc = qs(0xd31a9db4)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Body15_PickG03.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body15_d_03.dds'
				material = pckgrd_body15_03_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr15_pickgrd03
			}
		]
	}
	{
		desc_id = gtr_body16_pickg01
		frontend_desc = qs(0x560739fc)
		mesh = 'models/CAR_Instruments/Guitar/CAG_PGard_Prdiktr01.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_pickg01_d_mls.dds'
				material = gtr_body16_pickgrd_01_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_149
			}
		]
	}
	{
		desc_id = gtr_body16_pickg02
		frontend_desc = qs(0x7d2a6a3f)
		mesh = 'models/CAR_Instruments/Guitar/CAG_PGard_Prdiktr02.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_pickg02_d_mls.dds'
				material = gtr_body16_pickgrd_02_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr16_pickgrd02
			}
		]
	}
	{
		desc_id = gtr_body16_pickg03
		frontend_desc = qs(0x64315b7e)
		mesh = 'models/CAR_Instruments/Guitar/CAG_PGard_Prdiktr03.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_pickg03_d_mls.dds'
				material = gtr_body16_pickgrd_03_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr16_pickgrd03
			}
		]
	}
	{
		desc_id = gtr_body16_pickg04
		frontend_desc = qs(0x3f1bbbb1)
		mesh = 'models/CAR_Instruments/Guitar/CAG_PGard_Prdiktr04.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_pickg01_d_mls.dds'
				material = gtr_body16_pickgrd_01_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_149
			}
		]
	}
	{
		desc_id = gtr_body17_pickg01
		frontend_desc = qs(0xe12cff36)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Body17_PickG01.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body17_pickg01_d.dds'
				material = pckgrd_body17_01_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr17_pickgrd01
			}
		]
	}
	{
		desc_id = gtr_body17_pickg02
		frontend_desc = qs(0xca01acf5)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Body17_PickG02.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body17_pickg02.dds'
				material = pckgrd_body17_02_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr17_pickgrd02
			}
		]
	}
	{
		desc_id = gtr_body17_pickg03
		frontend_desc = qs(0xd31a9db4)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Body17_PickG03.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body17_pickg03_d.dds'
				material = pckgrd_body17_03_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr17_pickgrd03
			}
		]
	}
	{
		desc_id = gtr_body20_pickg01
		frontend_desc = qs(0xe12cff36)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Body20_PickG01.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body20_d_01.dds'
				material = pckgrd_body20_01_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr20_pickgrd01
			}
		]
	}
	{
		desc_id = gtr_body20_pickg02
		frontend_desc = qs(0xca01acf5)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Body20_PickG02.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body20_d_02.dds'
				material = pckgrd_body20_02_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr20_pickgrd02
			}
		]
	}
	{
		desc_id = gtr_body20_pickg03
		frontend_desc = qs(0xd31a9db4)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Body20_PickG03.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body20_d_03.dds'
				material = pckgrd_body20_03_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr20_pickgrd03
			}
		]
	}
	{
		desc_id = gtr_x_peace_pickg01
		frontend_desc = qs(0x5d4484a6)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X_Peace_PickG01.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body_x_peace_d_01.dds'
				material = gtr_x_peace_pckgrd_1_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr_x_peace_pkgrd1
			}
		]
	}
	{
		desc_id = gtr_x_yinyang_pickg01
		frontend_desc = qs(0x5e32be37)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X_YinYang_PickG01.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body_x_yinyang_d_01.dds'
				material = gtr_x_yinyang_pckgrd_1_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr_x_yinyang_pkgrd1
			}
		]
	}
	{
		desc_id = gtr_x_clear_pickg01
		frontend_desc = qs(0xe12cff36)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X_Clear_PickG01.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body_x_clear_01.dds'
				material = gtr_x_clear_pckgrd_1_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr31_pickgrd01
			}
		]
	}
	{
		desc_id = gtr_x_clear2_pickg02
		frontend_desc = qs(0xe12cff36)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X_Clear2_PickG02.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body_x_clear2_02.dds'
				material = gtr_x_clear2_pckgrd_2_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr32_pickgrd02
			}
		]
	}
	{
		desc_id = gtr_x_anarc_pickg02
		frontend_desc = qs(0xe12cff36)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X_Anarc_PickG02.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body_x_anarchy_d_02.dds'
				material = gtr_x_anarc_pckgrd_2_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr_x_anarc_pkgrd2
			}
		]
	}
	{
		desc_id = gtr_x_anarc_pickg01
		frontend_desc = qs(0xca01acf5)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X_Anarc_PickG01.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body_x_anarchy_d_01.dds'
				material = gtr_x_anarc_pckgrd_1_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr_x_anarc_pkgrd1
			}
		]
	}
	{
		desc_id = gtr_x_spider_pickg01
		frontend_desc = qs(0xe12cff36)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X_Spider_PickG01.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body_x_spider_d_01.dds'
				material = gtr_x_spider_pckgrd_1_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr_x_spider_pkgrd1
			}
		]
	}
	{
		desc_id = gtr_x_xross_pickg01
		frontend_desc = qs(0xe12cff36)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X_Xross_PickG01.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body_x_xross_d_01.dds'
				material = gtr_x_xross_pckgrd_1_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr_x_xross_pkgrd1
			}
		]
	}
	{
		desc_id = gtr_x_heart_pickg01
		frontend_desc = qs(0xc1bfcde0)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X_Heart_PickG01.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body_x_heart_01.dds'
				material = gtr_x_heart_pckgrd_1_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr_x_heart_pkgrd1
			}
		]
	}
	{
		desc_id = gtr_x_heart_pickg02
		frontend_desc = qs(0xa6345ecd)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X_Heart_PickG02.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body_x_heart_02.dds'
				material = gtr_x_heart_pckgrd_2_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr_x_heart_pkgrd2
			}
		]
	}
	{
		desc_id = gtr_x_money_pickg01
		frontend_desc = qs(0x307b324b)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X_Money_PickG01.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body_x_money_d_01.dds'
				material = gtr_x_money_pckgrd_1_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr_x_money_pkgrd1
			}
		]
	}
	{
		desc_id = gtr_x_fire_pickg01
		frontend_desc = qs(0x16314aeb)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X_Fire_PickG01.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body_x_firepick_d_01.dds'
				material = gtr_x_fire_pckgrd_1_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr_x_fire_pkgrd1
			}
		]
	}
	{
		desc_id = gtr_x_fire_pickg02
		frontend_desc = qs(0xe12cff36)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X_Fire_PickG02.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body_x_firepick_d_02.dds'
				material = gtr_x_fire_pckgrd_2_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr_x_fire_pkgrd2
			}
		]
	}
	{
		desc_id = gtr_x_bird_pickg01
		frontend_desc = qs(0xe12cff36)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X_Bird_PickG01.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body_x_bird_d_01.dds'
				material = gtr_x_bird_pckgrd_1_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr_x_bird_pkgrd1
			}
		]
	}
	{
		desc_id = gtr_x_trident_pickg01
		frontend_desc = qs(0xe12cff36)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X_Trident_PickG01.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body_x_trident_d_01.dds'
				material = gtr_x_trident_pckgrd_1_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr_x_trident_pkgrd1
			}
		]
	}
	{
		desc_id = gtr_x_skull_pickg01
		frontend_desc = qs(0xa782f601)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X_Skull_PickG01.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_body_x_skull_d_01a.dds'
				material = gtr_x_skull_pickgrd_01_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr_x_skull_pkgrd1
			}
		]
	}
	{
		desc_id = none
		frontend_desc = qs(0x9c1b5214)
		mesh = 'models/CAR_Instruments/Guitar/VH/GTR_Pickguard_VHDummy.skin'
		random_weight = 10.0
	}
]
cas_guitar_pickups = [
	{
		desc_id = gtr_pickup_style_vh1
		frontend_desc = qs(0xa1fb647e)
		mesh = 'models/CAR_Instruments/Guitar/VH/GTR_Pickup_Style_VH1.skin'
		random_weight = 0.0
		$car_rocker_guitars_factoredglobal_103
	}
	{
		desc_id = gtr_pickup_style_vh2
		frontend_desc = qs(0x8833d08c)
		mesh = 'models/CAR_Instruments/Guitar/VH/GTR_Pickup_Style_VH2.skin'
		random_weight = 0.0
		$car_rocker_guitars_factoredglobal_103
	}
	{
		desc_id = gtr_pickup_style_vh4
		frontend_desc = qs(0xdba2b968)
		mesh = 'models/CAR_Instruments/Guitar/VH/GTR_Pickup_Style_VH4.skin'
		random_weight = 0.0
		$car_rocker_guitars_factoredglobal_103
	}
	{
		desc_id = gtr_pickup_style_vhshark
		frontend_desc = qs(0x05017892)
		mesh = 'models/CAR_Instruments/Guitar/VH/GTR_Pickup_Style_VHShark.skin'
		random_weight = 0.0
		$car_rocker_guitars_factoredglobal_103
	}
	{
		desc_id = gtr_pickup_style_vhfstrat
		frontend_desc = qs(0x20944dbb)
		mesh = 'models/CAR_Instruments/Guitar/VH/GTR_Pickup_Style_VHFstrat.skin'
		random_weight = 0.0
		$car_rocker_guitars_factoredglobal_103
	}
	{
		desc_id = gtr_pickup_style_vhwolf
		frontend_desc = qs(0x2523d539)
		mesh = 'models/CAR_Instruments/Guitar/VH/GTR_Pickup_Style_VHWolf.skin'
		random_weight = 0.0
		$car_rocker_guitars_factoredglobal_103
	}
	{
		desc_id = gtr_pickup_style_vhdlr
		frontend_desc = qs(0x26fa0f1e)
		mesh = 'models/CAR_Instruments/Guitar/VH/GTR_Pickup_Style_VHDLR.skin'
		random_weight = 0.0
		$car_rocker_guitars_factoredglobal_103
	}
	{
		desc_id = gtr_pickups_style_01a
		frontend_desc = qs(0x83e3f684)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Pickups_Style_01a.skin'
		materials = [
			gtr_pickup_type1_primary
		]
	}
	{
		desc_id = gtr_pickups_style_01b
		frontend_desc = qs(0xa8cea547)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Pickups_Style_01b.skin'
		materials = [
			gtr_pickup_type1_primary
		]
	}
	{
		desc_id = gtr_pickups_style_01c
		frontend_desc = qs(0x9af8c7c5)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Pickups_Style_01c.skin'
		materials = [
			gtr_pickup_type1_primary
		]
	}
	{
		desc_id = gtr_pickup_type1_blk_3
		frontend_desc = qs(0x98342d18)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Pickup_Type1_Blk_3.skin'
		materials = [
			gtr_pickup_type1_blk_primary
		]
	}
	{
		desc_id = gtr_pickup_type1_blk_2
		frontend_desc = qs(0x812f1c59)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Pickup_Type1_Blk_2.skin'
		materials = [
			gtr_pickup_type1_blk_primary
		]
	}
	{
		desc_id = gtr_pickup_type1_blk_1
		frontend_desc = qs(0xaa024f9a)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Pickup_Type1_Blk_1.skin'
		materials = [
			gtr_pickup_type1_blk_primary
		]
	}
	{
		desc_id = gtr_pickup_type1_blktan_1
		frontend_desc = qs(0xe2a6f0a6)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Pickup_Type1_Blktan_1.skin'
		materials = [
			gtr_pickup_type1_blktan_primary
		]
	}
	{
		desc_id = gtr_pickup_type1_blktan_2
		frontend_desc = qs(0xc98ba365)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Pickup_Type1_Blktan_2.skin'
		materials = [
			gtr_pickup_type1_blktan_primary
		]
	}
	{
		desc_id = gtr_pickup_type1_blktan_3
		frontend_desc = qs(0xd0909224)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Pickup_Type1_Blktan_3.skin'
		materials = [
			gtr_pickup_type1_blktan_primary
		]
	}
	{
		desc_id = gtr_pickup_type2_03
		frontend_desc = qs(0xb14d7f2e)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Pickup_Type2_03.skin'
		materials = [
			gtr_pickup_type2_primary
		]
	}
	{
		desc_id = gtr_pickup_type2_04
		frontend_desc = qs(0x1a79f059)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Pickup_Type2_04.skin'
		materials = [
			gtr_pickup_type2_primary
		]
	}
	{
		desc_id = gtr_pickup_type3_02
		frontend_desc = qs(0x7fb54ffa)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Pickup_Type3_02.skin'
		materials = [
			gtr_pickup_type3_primary
		]
	}
	{
		desc_id = gtr_pickup_type3_03
		frontend_desc = qs(0x66ae7ebb)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Pickup_Type3_03.skin'
		materials = [
			gtr_pickup_type3_primary
		]
	}
	{
		desc_id = gtr_pickup_type3b_02
		frontend_desc = qs(0xe6109cc3)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Pickup_Type3b_02.skin'
		materials = [
			gtr_pickup_type3b_primary
		]
	}
	{
		desc_id = gtr_pickup_type3b_03
		frontend_desc = qs(0xff0bad82)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Pickup_Type3b_03.skin'
		materials = [
			gtr_pickup_type3b_primary
		]
	}
	{
		desc_id = gtr_pickup_type4_02
		frontend_desc = qs(0x6f6fbca5)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Pickup_Type4_02.skin'
		materials = [
			gtr_pickup_type4_primary
		]
	}
	{
		desc_id = gtr_pickup_type4_03
		frontend_desc = qs(0x76748de4)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Pickup_Type4_03.skin'
		materials = [
			gtr_pickup_type4_primary
		]
	}
	{
		desc_id = gtr_pickup_type5_01
		frontend_desc = qs(0x3adca9ab)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Pickup_Type5_01.skin'
		materials = [
			gtr_pickup_type5_primary
		]
	}
	{
		desc_id = gtr_pickup_type5_02
		frontend_desc = qs(0x11f1fa68)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Pickup_Type5_02.skin'
		materials = [
			gtr_pickup_type5_primary
		]
	}
	{
		desc_id = gtr_pickup_type5_03
		frontend_desc = qs(0x08eacb29)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Pickup_Type5_03.skin'
		materials = [
			gtr_pickup_type5_primary
		]
	}
	{
		desc_id = gtr_x1_skull_pickup_01
		frontend_desc = qs(0xa8cea547)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X1_Skull_Pickup_01.skin'
		materials = [
			gtr_pickup_skull_type1_primary
		]
	}
	{
		desc_id = gtr_pickup_skul1_blk_01
		frontend_desc = qs(0xaa024f9a)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Pickup_skul1_Blk_01.skin'
		materials = [
			gtr_pickup_skul1_blk_primary
		]
	}
	{
		desc_id = gtr_pickup_skul1_blktan_01
		frontend_desc = qs(0xe2a6f0a6)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Pickup_Skul1_Blktan_01.skin'
		materials = [
			gtr_pickup_skul1_blktan_primary
		]
	}
	{
		desc_id = none
		frontend_desc = qs(0x9c1b5214)
		random_weight = 10.0
	}
]
cas_guitar_knobs = [
	{
		desc_id = gtr_knob_type_vh1
		frontend_desc = qs(0x72f39521)
		mesh = 'models/CAR_Instruments/Guitar/VH/GTR_Knob_Type_VH1.skin'
		random_weight = 0.0
		$car_rocker_guitars_factoredglobal_103
	}
	{
		desc_id = gtr_knob_type_vh2
		frontend_desc = qs(0x4b8b3861)
		mesh = 'models/CAR_Instruments/Guitar/VH/GTR_Knob_Type_VH2.skin'
		random_weight = 0.0
		$car_rocker_guitars_factoredglobal_103
	}
	{
		desc_id = gtr_knob_type_vh4
		frontend_desc = qs(0x5aa5b74f)
		mesh = 'models/CAR_Instruments/Guitar/VH/GTR_Knob_Type_VH4.skin'
		random_weight = 0.0
		$car_rocker_guitars_factoredglobal_103
	}
	{
		desc_id = gtr_knob_type_vhshark
		frontend_desc = qs(0x46afb884)
		mesh = 'models/CAR_Instruments/Guitar/VH/GTR_Knob_Type_VHShark.skin'
		random_weight = 0.0
		$car_rocker_guitars_factoredglobal_103
	}
	{
		desc_id = gtr_knob_type_vhfstrat
		frontend_desc = qs(0x73ab448b)
		mesh = 'models/CAR_Instruments/Guitar/VH/GTR_Knob_Type_VHFstrat.skin'
		random_weight = 0.0
		$car_rocker_guitars_factoredglobal_103
	}
	{
		desc_id = gtr_knob_type_vhwolf
		frontend_desc = qs(0x3c63418a)
		mesh = 'models/CAR_Instruments/Guitar/VH/GTR_Knob_Type_VHWolf.skin'
		random_weight = 0.0
		$car_rocker_guitars_factoredglobal_103
	}
	{
		desc_id = gtr_knob_type_vhdlr
		frontend_desc = qs(0xb48b630d)
		mesh = 'models/CAR_Instruments/Guitar/VH/GTR_Knob_Type_VHDLR.skin'
		random_weight = 0.0
		$car_rocker_guitars_factoredglobal_103
	}
	{
		desc_id = gtr_knobs_style_01a
		frontend_desc = qs(0xe301e646)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Knobs_Style_01a.skin'
		materials = [
			gtr_knob_type1_01_primary
		]
	}
	{
		desc_id = gtr1_knob_type2_04
		frontend_desc = qs(0x8f2cae0b)
		mesh = 'models/CAR_Instruments/Guitar/GTR1_Knob_Type2_04.skin'
		materials = [
			gtr_knob_type2_01_primary
		]
	}
	{
		desc_id = gtr1_knob_type3_04
		frontend_desc = qs(0x1588993e)
		mesh = 'models/CAR_Instruments/Guitar/GTR1_Knob_Type3_04.skin'
		materials = [
			gtr_knob_type3_01_primary
		]
	}
	{
		desc_id = gtr1_knob_type4_04
		frontend_desc = qs(0xea9acd58)
		mesh = 'models/CAR_Instruments/Guitar/GTR1_Knob_Type4_04.skin'
	}
	{
		desc_id = gtr1_knob_type5_04
		frontend_desc = qs(0xe1c3434e)
		mesh = 'models/CAR_Instruments/Guitar/GTR1_Knob_Type5_04.skin'
		materials = [
			gtr_knob_type5_01_primary
		]
	}
	{
		desc_id = gtr1_knob_type6_04
		frontend_desc = qs(0xa433a9e0)
		mesh = 'models/CAR_Instruments/Guitar/GTR1_Knob_Type6_04.skin'
		materials = [
			gtr_knob_type6_01_primary
		]
	}
	{
		desc_id = gtr1_knob_type7_04
		frontend_desc = qs(0xc99e6543)
		mesh = 'models/CAR_Instruments/Guitar/GTR1_Knob_Type7_04.skin'
		materials = [
			gtr_knob_type7_01_primary
		]
	}
	{
		desc_id = gtr1_knob_type8_04
		frontend_desc = qs(0x4e6b4489)
		mesh = 'models/CAR_Instruments/Guitar/GTR1_Knob_Type8_04.skin'
		materials = [
			gtr_knob_type8_01_primary
		]
	}
	{
		desc_id = gtr1_knob_type9_04
		frontend_desc = qs(0x6d93a914)
		mesh = 'models/CAR_Instruments/Guitar/GTR1_Knob_Type9_04.skin'
		materials = [
			gtr_knob_type9_01_primary
		]
	}
	{
		desc_id = gtr1_knob_type10_04
		frontend_desc = qs(0x2a068a61)
		mesh = 'models/CAR_Instruments/Guitar/GTR1_Knob_Type10_04.skin'
		materials = [
			gtr_knob_type10_01_primary
		]
	}
	{
		desc_id = gtr_knobs_style_02a
		frontend_desc = qs(0xe301e646)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Knobs_Style_02a.skin'
		materials = [
			gtr_knob_type1_01_primary
		]
	}
	{
		desc_id = gtr2_knob_type2_04
		frontend_desc = qs(0x8f2cae0b)
		mesh = 'models/CAR_Instruments/Guitar/GTR2_Knob_Type2_04.skin'
		materials = [
			gtr_knob_type2_01_primary
		]
	}
	{
		desc_id = gtr2_knob_type3_04
		frontend_desc = qs(0xcc040f20)
		mesh = 'models/CAR_Instruments/Guitar/GTR2_Knob_Type3_04.skin'
		materials = [
			gtr_knob_type3_01_primary
		]
	}
	{
		desc_id = gtr2_knob_type4_04
		frontend_desc = qs(0xea9acd58)
		mesh = 'models/CAR_Instruments/Guitar/GTR2_Knob_Type4_04.skin'
	}
	{
		desc_id = gtr2_knob_type5_04
		frontend_desc = qs(0xe1c3434e)
		mesh = 'models/CAR_Instruments/Guitar/GTR2_Knob_Type5_04.skin'
		materials = [
			gtr_knob_type5_01_primary
		]
	}
	{
		desc_id = gtr2_knob_type6_04
		frontend_desc = qs(0xa433a9e0)
		mesh = 'models/CAR_Instruments/Guitar/GTR2_Knob_Type6_04.skin'
		materials = [
			gtr_knob_type6_01_primary
		]
	}
	{
		desc_id = gtr2_knob_type7_04
		frontend_desc = qs(0xc99e6543)
		mesh = 'models/CAR_Instruments/Guitar/GTR2_Knob_Type7_04.skin'
		materials = [
			gtr_knob_type7_01_primary
		]
	}
	{
		desc_id = gtr2_knob_type8_04
		frontend_desc = qs(0x4e6b4489)
		mesh = 'models/CAR_Instruments/Guitar/GTR2_Knob_Type8_04.skin'
		materials = [
			gtr_knob_type8_01_primary
		]
	}
	{
		desc_id = gtr2_knob_type9_04
		frontend_desc = qs(0x6d93a914)
		mesh = 'models/CAR_Instruments/Guitar/GTR2_Knob_Type9_04.skin'
		materials = [
			gtr_knob_type9_01_primary
		]
	}
	{
		desc_id = gtr2_knob_type10_04
		frontend_desc = qs(0x2a068a61)
		mesh = 'models/CAR_Instruments/Guitar/GTR2_Knob_Type10_04.skin'
		materials = [
			gtr_knob_type10_01_primary
		]
	}
	{
		desc_id = gtr3_knobs_style_03a
		frontend_desc = qs(0xe301e646)
		mesh = 'models/CAR_Instruments/Guitar/GTR3_Knobs_Style_03a.skin'
		materials = [
			gtr_knob_type1_01_primary
		]
	}
	{
		desc_id = gtr3_knob_type2_03
		frontend_desc = qs(0x8f2cae0b)
		mesh = 'models/CAR_Instruments/Guitar/GTR3_Knob_Type2_03.skin'
		materials = [
			gtr_knob_type2_01_primary
		]
	}
	{
		desc_id = gtr3_knob_type3_03
		frontend_desc = qs(0xcc040f20)
		mesh = 'models/CAR_Instruments/Guitar/GTR3_Knob_Type3_03.skin'
		materials = [
			gtr_knob_type3_01_primary
		]
	}
	{
		desc_id = gtr3_knob_type4_03
		frontend_desc = qs(0xea9acd58)
		mesh = 'models/CAR_Instruments/Guitar/GTR3_Knob_Type4_03.skin'
	}
	{
		desc_id = gtr3_knob_type5_03
		frontend_desc = qs(0xe1c3434e)
		mesh = 'models/CAR_Instruments/Guitar/GTR3_Knob_Type5_03.skin'
		materials = [
			gtr_knob_type5_01_primary
		]
	}
	{
		desc_id = gtr3_knob_type6_03
		frontend_desc = qs(0xa433a9e0)
		mesh = 'models/CAR_Instruments/Guitar/GTR3_Knob_Type6_03.skin'
		materials = [
			gtr_knob_type6_01_primary
		]
	}
	{
		desc_id = gtr3_knob_type7_03
		frontend_desc = qs(0xc99e6543)
		mesh = 'models/CAR_Instruments/Guitar/GTR3_Knob_Type7_03.skin'
		materials = [
			gtr_knob_type7_01_primary
		]
	}
	{
		desc_id = gtr3_knob_type8_03
		frontend_desc = qs(0x4e6b4489)
		mesh = 'models/CAR_Instruments/Guitar/GTR3_Knob_Type8_03.skin'
		materials = [
			gtr_knob_type8_01_primary
		]
	}
	{
		desc_id = gtr3_knob_type9_03
		frontend_desc = qs(0x497c4191)
		mesh = 'models/CAR_Instruments/Guitar/GTR3_Knob_Type9_03.skin'
		materials = [
			gtr_knob_type9_01_primary
		]
	}
	{
		desc_id = gtr3_knob_type10_03
		frontend_desc = qs(0xa73705e0)
		mesh = 'models/CAR_Instruments/Guitar/GTR3_Knob_Type10_03.skin'
		materials = [
			gtr_knob_type10_01_primary
		]
	}
	{
		desc_id = gtr4_knob_type1_04
		frontend_desc = qs(0xe301e646)
		mesh = 'models/CAR_Instruments/Guitar/GTR4_Knob_Type1_04.skin'
		materials = [
			gtr_knob_type1_01_primary
		]
	}
	{
		desc_id = gtr4_knob_type2_04
		frontend_desc = qs(0x8f2cae0b)
		mesh = 'models/CAR_Instruments/Guitar/GTR4_Knob_Type2_04.skin'
		materials = [
			gtr_knob_type2_01_primary
		]
	}
	{
		desc_id = gtr4_knob_type3_04
		frontend_desc = qs(0xcc040f20)
		mesh = 'models/CAR_Instruments/Guitar/GTR4_Knob_Type3_04.skin'
		materials = [
			gtr_knob_type3_01_primary
		]
	}
	{
		desc_id = gtr4_knob_type4_04
		frontend_desc = qs(0xea9acd58)
		mesh = 'models/CAR_Instruments/Guitar/GTR4_Knob_Type4_04.skin'
	}
	{
		desc_id = gtr4_knob_type5_04
		frontend_desc = qs(0xe1c3434e)
		mesh = 'models/CAR_Instruments/Guitar/GTR4_Knob_Type5_04.skin'
		materials = [
			gtr_knob_type5_01_primary
		]
	}
	{
		desc_id = gtr4_knob_type6_04
		frontend_desc = qs(0xa433a9e0)
		mesh = 'models/CAR_Instruments/Guitar/GTR4_Knob_Type6_04.skin'
		materials = [
			gtr_knob_type6_01_primary
		]
	}
	{
		desc_id = gtr4_knob_type7_04
		frontend_desc = qs(0xc99e6543)
		mesh = 'models/CAR_Instruments/Guitar/GTR4_Knob_Type7_04.skin'
		materials = [
			gtr_knob_type7_01_primary
		]
	}
	{
		desc_id = gtr4_knob_type8_04
		frontend_desc = qs(0x4e6b4489)
		mesh = 'models/CAR_Instruments/Guitar/GTR4_Knob_Type8_04.skin'
		materials = [
			gtr_knob_type8_01_primary
		]
	}
	{
		desc_id = gtr4_knob_type9_04
		frontend_desc = qs(0x497c4191)
		mesh = 'models/CAR_Instruments/Guitar/GTR4_Knob_Type9_04.skin'
		materials = [
			gtr_knob_type9_01_primary
		]
	}
	{
		desc_id = gtr4_knob_type10_04
		frontend_desc = qs(0xa73705e0)
		mesh = 'models/CAR_Instruments/Guitar/GTR4_Knob_Type10_04.skin'
		materials = [
			gtr_knob_type10_01_primary
		]
	}
	{
		desc_id = gtr6_knob_type1_03
		frontend_desc = qs(0xe301e646)
		mesh = 'models/CAR_Instruments/Guitar/GTR6_Knob_Type1_03.skin'
		materials = [
			gtr_knob_type1_01_primary
		]
	}
	{
		desc_id = gtr6_knob_type2_03
		frontend_desc = qs(0x8f2cae0b)
		mesh = 'models/CAR_Instruments/Guitar/GTR6_Knob_Type2_03.skin'
		materials = [
			gtr_knob_type2_01_primary
		]
	}
	{
		desc_id = gtr6_knob_type3_03
		frontend_desc = qs(0xcc040f20)
		mesh = 'models/CAR_Instruments/Guitar/GTR6_Knob_Type3_03.skin'
		materials = [
			gtr_knob_type3_01_primary
		]
	}
	{
		desc_id = gtr6_knob_type4_03
		frontend_desc = qs(0xea9acd58)
		mesh = 'models/CAR_Instruments/Guitar/GTR6_Knob_Type4_03.skin'
	}
	{
		desc_id = gtr6_knob_type5_03
		frontend_desc = qs(0xe1c3434e)
		mesh = 'models/CAR_Instruments/Guitar/GTR6_Knob_Type5_03.skin'
		materials = [
			gtr_knob_type5_01_primary
		]
	}
	{
		desc_id = gtr6_knob_type6_03
		frontend_desc = qs(0xa433a9e0)
		mesh = 'models/CAR_Instruments/Guitar/GTR6_Knob_Type6_03.skin'
		materials = [
			gtr_knob_type6_01_primary
		]
	}
	{
		desc_id = gtr6_knob_type7_03
		frontend_desc = qs(0xc99e6543)
		mesh = 'models/CAR_Instruments/Guitar/GTR6_Knob_Type7_03.skin'
		materials = [
			gtr_knob_type7_01_primary
		]
	}
	{
		desc_id = gtr6_knob_type8_03
		frontend_desc = qs(0x4e6b4489)
		mesh = 'models/CAR_Instruments/Guitar/GTR6_Knob_Type8_03.skin'
		materials = [
			gtr_knob_type8_01_primary
		]
	}
	{
		desc_id = gtr6_knob_type9_03
		frontend_desc = qs(0x497c4191)
		mesh = 'models/CAR_Instruments/Guitar/GTR6_Knob_Type9_03.skin'
		materials = [
			gtr_knob_type9_01_primary
		]
	}
	{
		desc_id = gtr6_knob_type10_03
		frontend_desc = qs(0xa73705e0)
		mesh = 'models/CAR_Instruments/Guitar/GTR6_Knob_Type10_03.skin'
		materials = [
			gtr_knob_type10_01_primary
		]
	}
	{
		desc_id = gtr7_knob_type1_03
		frontend_desc = qs(0xe301e646)
		mesh = 'models/CAR_Instruments/Guitar/GTR7_Knob_Type1_03.skin'
		materials = [
			gtr_knob_type1_01_primary
		]
	}
	{
		desc_id = gtr7_knob_type2_03
		frontend_desc = qs(0x8f2cae0b)
		mesh = 'models/CAR_Instruments/Guitar/GTR7_Knob_Type2_03.skin'
		materials = [
			gtr_knob_type2_01_primary
		]
	}
	{
		desc_id = gtr7_knob_type3_03
		frontend_desc = qs(0xcc040f20)
		mesh = 'models/CAR_Instruments/Guitar/GTR7_Knob_Type3_03.skin'
		materials = [
			gtr_knob_type3_01_primary
		]
	}
	{
		desc_id = gtr7_knob_type4_03
		frontend_desc = qs(0xea9acd58)
		mesh = 'models/CAR_Instruments/Guitar/GTR7_Knob_Type4_03.skin'
	}
	{
		desc_id = gtr7_knob_type5_03
		frontend_desc = qs(0xe1c3434e)
		mesh = 'models/CAR_Instruments/Guitar/GTR7_Knob_Type5_03.skin'
		materials = [
			gtr_knob_type5_01_primary
		]
	}
	{
		desc_id = gtr7_knob_type6_03
		frontend_desc = qs(0xa433a9e0)
		mesh = 'models/CAR_Instruments/Guitar/GTR7_Knob_Type6_03.skin'
		materials = [
			gtr_knob_type6_01_primary
		]
	}
	{
		desc_id = gtr7_knob_type7_03
		frontend_desc = qs(0xc99e6543)
		mesh = 'models/CAR_Instruments/Guitar/GTR7_Knob_Type7_03.skin'
		materials = [
			gtr_knob_type7_01_primary
		]
	}
	{
		desc_id = gtr7_knob_type8_03
		frontend_desc = qs(0x4e6b4489)
		mesh = 'models/CAR_Instruments/Guitar/GTR7_Knob_Type8_03.skin'
		materials = [
			gtr_knob_type8_01_primary
		]
	}
	{
		desc_id = gtr7_knob_type9_03
		frontend_desc = qs(0x6d93a914)
		mesh = 'models/CAR_Instruments/Guitar/GTR7_Knob_Type9_03.skin'
		materials = [
			gtr_knob_type9_01_primary
		]
	}
	{
		desc_id = gtr7_knob_type10_03
		frontend_desc = qs(0x2a068a61)
		mesh = 'models/CAR_Instruments/Guitar/GTR7_Knob_Type10_03.skin'
		materials = [
			gtr_knob_type10_01_primary
		]
	}
	{
		desc_id = gtr8_knob_type1_03
		frontend_desc = qs(0xe301e646)
		mesh = 'models/CAR_Instruments/Guitar/GTR8_Knob_Type1_03.skin'
		materials = [
			gtr_knob_type1_01_primary
		]
	}
	{
		desc_id = gtr8_knob_type2_03
		frontend_desc = qs(0x8f2cae0b)
		mesh = 'models/CAR_Instruments/Guitar/GTR8_Knob_Type2_03.skin'
		materials = [
			gtr_knob_type2_01_primary
		]
	}
	{
		desc_id = gtr8_knob_type3_03
		frontend_desc = qs(0xcc040f20)
		mesh = 'models/CAR_Instruments/Guitar/GTR8_Knob_Type3_03.skin'
		materials = [
			gtr_knob_type3_01_primary
		]
	}
	{
		desc_id = gtr8_knob_type4_03
		frontend_desc = qs(0xea9acd58)
		mesh = 'models/CAR_Instruments/Guitar/GTR8_Knob_Type4_03.skin'
	}
	{
		desc_id = gtr8_knob_type5_03
		frontend_desc = qs(0xe1c3434e)
		mesh = 'models/CAR_Instruments/Guitar/GTR8_Knob_Type5_03.skin'
		materials = [
			gtr_knob_type5_01_primary
		]
	}
	{
		desc_id = gtr8_knob_type6_03
		frontend_desc = qs(0xa433a9e0)
		mesh = 'models/CAR_Instruments/Guitar/GTR8_Knob_Type6_03.skin'
		materials = [
			gtr_knob_type6_01_primary
		]
	}
	{
		desc_id = gtr8_knob_type7_03
		frontend_desc = qs(0xc99e6543)
		mesh = 'models/CAR_Instruments/Guitar/GTR8_Knob_Type7_03.skin'
		materials = [
			gtr_knob_type7_01_primary
		]
	}
	{
		desc_id = gtr8_knob_type8_03
		frontend_desc = qs(0x4e6b4489)
		mesh = 'models/CAR_Instruments/Guitar/GTR8_Knob_Type8_03.skin'
		materials = [
			gtr_knob_type8_01_primary
		]
	}
	{
		desc_id = gtr8_knob_type9_03
		frontend_desc = qs(0x6d93a914)
		mesh = 'models/CAR_Instruments/Guitar/GTR8_Knob_Type9_03.skin'
		materials = [
			gtr_knob_type9_01_primary
		]
	}
	{
		desc_id = gtr8_knob_type10_03
		frontend_desc = qs(0x2a068a61)
		mesh = 'models/CAR_Instruments/Guitar/GTR8_Knob_Type10_03.skin'
		materials = [
			gtr_knob_type10_01_primary
		]
	}
	{
		desc_id = gtr9_knob_type1_03
		frontend_desc = qs(0xe301e646)
		mesh = 'models/CAR_Instruments/Guitar/GTR9_Knob_Type1_03.skin'
		materials = [
			gtr_knob_type1_01_primary
		]
	}
	{
		desc_id = gtr9_knob_type2_03
		frontend_desc = qs(0x8f2cae0b)
		mesh = 'models/CAR_Instruments/Guitar/GTR9_Knob_Type2_03.skin'
		materials = [
			gtr_knob_type2_01_primary
		]
	}
	{
		desc_id = gtr9_knob_type3_03
		frontend_desc = qs(0xcc040f20)
		mesh = 'models/CAR_Instruments/Guitar/GTR9_Knob_Type3_03.skin'
		materials = [
			gtr_knob_type3_01_primary
		]
	}
	{
		desc_id = gtr9_knob_type4_03
		frontend_desc = qs(0xea9acd58)
		mesh = 'models/CAR_Instruments/Guitar/GTR9_Knob_Type4_03.skin'
	}
	{
		desc_id = gtr9_knob_type5_03
		frontend_desc = qs(0xe1c3434e)
		mesh = 'models/CAR_Instruments/Guitar/GTR9_Knob_Type5_03.skin'
		materials = [
			gtr_knob_type5_01_primary
		]
	}
	{
		desc_id = gtr9_knob_type6_03
		frontend_desc = qs(0xa433a9e0)
		mesh = 'models/CAR_Instruments/Guitar/GTR9_Knob_Type6_03.skin'
		materials = [
			gtr_knob_type6_01_primary
		]
	}
	{
		desc_id = gtr9_knob_type7_03
		frontend_desc = qs(0xc99e6543)
		mesh = 'models/CAR_Instruments/Guitar/GTR9_Knob_Type7_03.skin'
		materials = [
			gtr_knob_type7_01_primary
		]
	}
	{
		desc_id = gtr9_knob_type8_03
		frontend_desc = qs(0x4e6b4489)
		mesh = 'models/CAR_Instruments/Guitar/GTR9_Knob_Type8_03.skin'
		materials = [
			gtr_knob_type8_01_primary
		]
	}
	{
		desc_id = gtr9_knob_type9_03
		frontend_desc = qs(0x6d93a914)
		mesh = 'models/CAR_Instruments/Guitar/GTR9_Knob_Type9_03.skin'
		materials = [
			gtr_knob_type9_01_primary
		]
	}
	{
		desc_id = gtr9_knob_type10_03
		frontend_desc = qs(0x2a068a61)
		mesh = 'models/CAR_Instruments/Guitar/GTR9_Knob_Type10_03.skin'
		materials = [
			gtr_knob_type10_01_primary
		]
	}
	{
		desc_id = gtr10_knob_type1_03
		frontend_desc = qs(0xe301e646)
		mesh = 'models/CAR_Instruments/Guitar/GTR10_Knob_Type1_03.skin'
		materials = [
			gtr_knob_type1_01_primary
		]
	}
	{
		desc_id = gtr10_knob_type2_03
		frontend_desc = qs(0x8f2cae0b)
		mesh = 'models/CAR_Instruments/Guitar/GTR10_Knob_Type2_03.skin'
		materials = [
			gtr_knob_type2_01_primary
		]
	}
	{
		desc_id = gtr10_knob_type3_03
		frontend_desc = qs(0xcc040f20)
		mesh = 'models/CAR_Instruments/Guitar/GTR10_Knob_Type3_03.skin'
		materials = [
			gtr_knob_type3_01_primary
		]
	}
	{
		desc_id = gtr10_knob_type4_03
		frontend_desc = qs(0xea9acd58)
		mesh = 'models/CAR_Instruments/Guitar/GTR10_Knob_Type4_03.skin'
	}
	{
		desc_id = gtr10_knob_type5_03
		frontend_desc = qs(0xe1c3434e)
		mesh = 'models/CAR_Instruments/Guitar/GTR10_Knob_Type5_03.skin'
		materials = [
			gtr_knob_type5_01_primary
		]
	}
	{
		desc_id = gtr10_knob_type6_03
		frontend_desc = qs(0xa433a9e0)
		mesh = 'models/CAR_Instruments/Guitar/GTR10_Knob_Type6_03.skin'
		materials = [
			gtr_knob_type6_01_primary
		]
	}
	{
		desc_id = gtr10_knob_type7_03
		frontend_desc = qs(0xc99e6543)
		mesh = 'models/CAR_Instruments/Guitar/GTR10_Knob_Type7_03.skin'
		materials = [
			gtr_knob_type7_01_primary
		]
	}
	{
		desc_id = gtr10_knob_type8_03
		frontend_desc = qs(0x4e6b4489)
		mesh = 'models/CAR_Instruments/Guitar/GTR10_Knob_Type8_03.skin'
		materials = [
			gtr_knob_type8_01_primary
		]
	}
	{
		desc_id = gtr10_knob_type9_03
		frontend_desc = qs(0x6d93a914)
		mesh = 'models/CAR_Instruments/Guitar/GTR10_Knob_Type9_03.skin'
		materials = [
			gtr_knob_type9_01_primary
		]
	}
	{
		desc_id = gtr10_knob_type10_03
		frontend_desc = qs(0x2a068a61)
		mesh = 'models/CAR_Instruments/Guitar/GTR10_Knob_Type10_03.skin'
		materials = [
			gtr_knob_type10_01_primary
		]
	}
	{
		desc_id = gtr11_knob_type1_03
		frontend_desc = qs(0xe301e646)
		mesh = 'models/CAR_Instruments/Guitar/GTR11_Knob_Type1_03.skin'
		materials = [
			gtr_knob_type1_01_primary
		]
	}
	{
		desc_id = gtr11_knob_type2_03
		frontend_desc = qs(0x8f2cae0b)
		mesh = 'models/CAR_Instruments/Guitar/GTR11_Knob_Type2_03.skin'
		materials = [
			gtr_knob_type2_01_primary
		]
	}
	{
		desc_id = gtr11_knob_type3_03
		frontend_desc = qs(0xcc040f20)
		mesh = 'models/CAR_Instruments/Guitar/GTR11_Knob_Type3_03.skin'
		materials = [
			gtr_knob_type3_01_primary
		]
	}
	{
		desc_id = gtr11_knob_type4_03
		frontend_desc = qs(0xea9acd58)
		mesh = 'models/CAR_Instruments/Guitar/GTR11_Knob_Type4_03.skin'
	}
	{
		desc_id = gtr11_knob_type5_03
		frontend_desc = qs(0xe1c3434e)
		mesh = 'models/CAR_Instruments/Guitar/GTR11_Knob_Type5_03.skin'
		materials = [
			gtr_knob_type5_01_primary
		]
	}
	{
		desc_id = gtr11_knob_type6_03
		frontend_desc = qs(0xa433a9e0)
		mesh = 'models/CAR_Instruments/Guitar/GTR11_Knob_Type6_03.skin'
		materials = [
			gtr_knob_type6_01_primary
		]
	}
	{
		desc_id = gtr11_knob_type7_03
		frontend_desc = qs(0xc99e6543)
		mesh = 'models/CAR_Instruments/Guitar/GTR11_Knob_Type7_03.skin'
		materials = [
			gtr_knob_type7_01_primary
		]
	}
	{
		desc_id = gtr11_knob_type8_03
		frontend_desc = qs(0x4e6b4489)
		mesh = 'models/CAR_Instruments/Guitar/GTR11_Knob_Type8_03.skin'
		materials = [
			gtr_knob_type8_01_primary
		]
	}
	{
		desc_id = gtr11_knob_type9_03
		frontend_desc = qs(0x6d93a914)
		mesh = 'models/CAR_Instruments/Guitar/GTR11_Knob_Type9_03.skin'
		materials = [
			gtr_knob_type9_01_primary
		]
	}
	{
		desc_id = gtr11_knob_type10_03
		frontend_desc = qs(0x2a068a61)
		mesh = 'models/CAR_Instruments/Guitar/GTR11_Knob_Type10_03.skin'
		materials = [
			gtr_knob_type10_01_primary
		]
	}
	{
		desc_id = gtr12_knob_type1_04
		frontend_desc = qs(0xe301e646)
		mesh = 'models/CAR_Instruments/Guitar/GTR12_Knob_Type1_04.skin'
		materials = [
			gtr_knob_type1_01_primary
		]
	}
	{
		desc_id = gtr12_knob_type2_04
		frontend_desc = qs(0x8f2cae0b)
		mesh = 'models/CAR_Instruments/Guitar/GTR12_Knob_Type2_04.skin'
		materials = [
			gtr_knob_type2_01_primary
		]
	}
	{
		desc_id = gtr12_knob_type3_04
		frontend_desc = qs(0xcc040f20)
		mesh = 'models/CAR_Instruments/Guitar/GTR12_Knob_Type3_04.skin'
		materials = [
			gtr_knob_type3_01_primary
		]
	}
	{
		desc_id = gtr12_knob_type4_04
		frontend_desc = qs(0xea9acd58)
		mesh = 'models/CAR_Instruments/Guitar/GTR12_Knob_Type4_04.skin'
	}
	{
		desc_id = gtr12_knob_type5_04
		frontend_desc = qs(0xe1c3434e)
		mesh = 'models/CAR_Instruments/Guitar/GTR12_Knob_Type5_04.skin'
		materials = [
			gtr_knob_type5_01_primary
		]
	}
	{
		desc_id = gtr12_knob_type6_04
		frontend_desc = qs(0xa433a9e0)
		mesh = 'models/CAR_Instruments/Guitar/GTR12_Knob_Type6_04.skin'
		materials = [
			gtr_knob_type6_01_primary
		]
	}
	{
		desc_id = gtr12_knob_type7_04
		frontend_desc = qs(0xc99e6543)
		mesh = 'models/CAR_Instruments/Guitar/GTR12_Knob_Type7_04.skin'
		materials = [
			gtr_knob_type7_01_primary
		]
	}
	{
		desc_id = gtr12_knob_type8_04
		frontend_desc = qs(0x4e6b4489)
		mesh = 'models/CAR_Instruments/Guitar/GTR12_Knob_Type8_04.skin'
		materials = [
			gtr_knob_type8_01_primary
		]
	}
	{
		desc_id = gtr12_knob_type9_04
		frontend_desc = qs(0x6d93a914)
		mesh = 'models/CAR_Instruments/Guitar/GTR12_Knob_Type9_04.skin'
		materials = [
			gtr_knob_type9_01_primary
		]
	}
	{
		desc_id = gtr12_knob_type10_04
		frontend_desc = qs(0x2a068a61)
		mesh = 'models/CAR_Instruments/Guitar/GTR12_Knob_Type10_04.skin'
		materials = [
			gtr_knob_type10_01_primary
		]
	}
	{
		desc_id = gtr13_knob_type1_02
		frontend_desc = qs(0xe301e646)
		mesh = 'models/CAR_Instruments/Guitar/GTR13_Knob_Type1_02.skin'
		materials = [
			gtr_knob_type1_01_primary
		]
	}
	{
		desc_id = gtr13_knob_type2_02
		frontend_desc = qs(0x8f2cae0b)
		mesh = 'models/CAR_Instruments/Guitar/GTR13_Knob_Type2_02.skin'
		materials = [
			gtr_knob_type2_01_primary
		]
	}
	{
		desc_id = gtr13_knob_type3_02
		frontend_desc = qs(0xcc040f20)
		mesh = 'models/CAR_Instruments/Guitar/GTR13_Knob_Type3_02.skin'
		materials = [
			gtr_knob_type3_01_primary
		]
	}
	{
		desc_id = gtr13_knob_type4_02
		frontend_desc = qs(0xea9acd58)
		mesh = 'models/CAR_Instruments/Guitar/GTR13_Knob_Type4_02.skin'
	}
	{
		desc_id = gtr13_knob_type5_02
		frontend_desc = qs(0xe1c3434e)
		mesh = 'models/CAR_Instruments/Guitar/GTR13_Knob_Type5_02.skin'
		materials = [
			gtr_knob_type5_01_primary
		]
	}
	{
		desc_id = gtr13_knob_type6_02
		frontend_desc = qs(0xa433a9e0)
		mesh = 'models/CAR_Instruments/Guitar/GTR13_Knob_Type6_02.skin'
		materials = [
			gtr_knob_type6_01_primary
		]
	}
	{
		desc_id = gtr13_knob_type7_02
		frontend_desc = qs(0xc99e6543)
		mesh = 'models/CAR_Instruments/Guitar/GTR13_Knob_Type7_02.skin'
		materials = [
			gtr_knob_type7_01_primary
		]
	}
	{
		desc_id = gtr13_knob_type8_02
		frontend_desc = qs(0x4e6b4489)
		mesh = 'models/CAR_Instruments/Guitar/GTR13_Knob_Type8_02.skin'
		materials = [
			gtr_knob_type8_01_primary
		]
	}
	{
		desc_id = gtr13_knob_type9_02
		frontend_desc = qs(0x6d93a914)
		mesh = 'models/CAR_Instruments/Guitar/GTR13_Knob_Type9_02.skin'
		materials = [
			gtr_knob_type9_01_primary
		]
	}
	{
		desc_id = gtr13_knob_type10_02
		frontend_desc = qs(0x2a068a61)
		mesh = 'models/CAR_Instruments/Guitar/GTR13_Knob_Type10_02.skin'
		materials = [
			gtr_knob_type10_01_primary
		]
	}
	{
		desc_id = gtr14_knob_type1_04
		frontend_desc = qs(0xe301e646)
		mesh = 'models/CAR_Instruments/Guitar/GTR14_Knob_Type1_04.skin'
		materials = [
			gtr_knob_type1_01_primary
		]
	}
	{
		desc_id = gtr14_knob_type2_04
		frontend_desc = qs(0x8f2cae0b)
		mesh = 'models/CAR_Instruments/Guitar/GTR14_Knob_Type2_04.skin'
		materials = [
			gtr_knob_type2_01_primary
		]
	}
	{
		desc_id = gtr14_knob_type3_04
		frontend_desc = qs(0xcc040f20)
		mesh = 'models/CAR_Instruments/Guitar/GTR14_Knob_Type3_04.skin'
		materials = [
			gtr_knob_type3_01_primary
		]
	}
	{
		desc_id = gtr14_knob_type4_04
		frontend_desc = qs(0xea9acd58)
		mesh = 'models/CAR_Instruments/Guitar/GTR14_Knob_Type4_04.skin'
	}
	{
		desc_id = gtr14_knob_type5_04
		frontend_desc = qs(0xe1c3434e)
		mesh = 'models/CAR_Instruments/Guitar/GTR14_Knob_Type5_04.skin'
		materials = [
			gtr_knob_type5_01_primary
		]
	}
	{
		desc_id = gtr14_knob_type6_04
		frontend_desc = qs(0xa433a9e0)
		mesh = 'models/CAR_Instruments/Guitar/GTR14_Knob_Type6_04.skin'
		materials = [
			gtr_knob_type6_01_primary
		]
	}
	{
		desc_id = gtr14_knob_type7_04
		frontend_desc = qs(0xc99e6543)
		mesh = 'models/CAR_Instruments/Guitar/GTR14_Knob_Type7_04.skin'
		materials = [
			gtr_knob_type7_01_primary
		]
	}
	{
		desc_id = gtr14_knob_type8_04
		frontend_desc = qs(0x4e6b4489)
		mesh = 'models/CAR_Instruments/Guitar/GTR14_Knob_Type8_04.skin'
		materials = [
			gtr_knob_type8_01_primary
		]
	}
	{
		desc_id = gtr14_knob_type9_04
		frontend_desc = qs(0x6d93a914)
		mesh = 'models/CAR_Instruments/Guitar/GTR14_Knob_Type9_04.skin'
		materials = [
			gtr_knob_type9_01_primary
		]
	}
	{
		desc_id = gtr14_knob_type10_04
		frontend_desc = qs(0x2a068a61)
		mesh = 'models/CAR_Instruments/Guitar/GTR14_Knob_Type10_04.skin'
		materials = [
			gtr_knob_type10_01_primary
		]
	}
	{
		desc_id = gtr15_knob_type1_03
		frontend_desc = qs(0xe301e646)
		mesh = 'models/CAR_Instruments/Guitar/GTR15_Knob_Type1_03.skin'
		materials = [
			gtr_knob_type1_01_primary
		]
	}
	{
		desc_id = gtr15_knob_type2_03
		frontend_desc = qs(0x8f2cae0b)
		mesh = 'models/CAR_Instruments/Guitar/GTR15_Knob_Type2_03.skin'
		materials = [
			gtr_knob_type2_01_primary
		]
	}
	{
		desc_id = gtr15_knob_type3_03
		frontend_desc = qs(0xcc040f20)
		mesh = 'models/CAR_Instruments/Guitar/GTR15_Knob_Type3_03.skin'
		materials = [
			gtr_knob_type3_01_primary
		]
	}
	{
		desc_id = gtr15_knob_type4_03
		frontend_desc = qs(0xea9acd58)
		mesh = 'models/CAR_Instruments/Guitar/GTR15_Knob_Type4_03.skin'
	}
	{
		desc_id = gtr15_knob_type5_03
		frontend_desc = qs(0xe1c3434e)
		mesh = 'models/CAR_Instruments/Guitar/GTR15_Knob_Type5_03.skin'
		materials = [
			gtr_knob_type5_01_primary
		]
	}
	{
		desc_id = gtr15_knob_type6_03
		frontend_desc = qs(0xa433a9e0)
		mesh = 'models/CAR_Instruments/Guitar/GTR15_Knob_Type6_03.skin'
		materials = [
			gtr_knob_type6_01_primary
		]
	}
	{
		desc_id = gtr15_knob_type7_03
		frontend_desc = qs(0xc99e6543)
		mesh = 'models/CAR_Instruments/Guitar/GTR15_Knob_Type7_03.skin'
		materials = [
			gtr_knob_type7_01_primary
		]
	}
	{
		desc_id = gtr15_knob_type8_03
		frontend_desc = qs(0x4e6b4489)
		mesh = 'models/CAR_Instruments/Guitar/GTR15_Knob_Type8_03.skin'
		materials = [
			gtr_knob_type8_01_primary
		]
	}
	{
		desc_id = gtr15_knob_type9_03
		frontend_desc = qs(0x6d93a914)
		mesh = 'models/CAR_Instruments/Guitar/GTR15_Knob_Type9_03.skin'
		materials = [
			gtr_knob_type9_01_primary
		]
	}
	{
		desc_id = gtr15_knob_type10_03
		frontend_desc = qs(0x2a068a61)
		mesh = 'models/CAR_Instruments/Guitar/GTR15_Knob_Type10_03.skin'
		materials = [
			gtr_knob_type10_01_primary
		]
	}
	{
		desc_id = gtr20_knob_type1_03
		frontend_desc = qs(0xe301e646)
		mesh = 'models/CAR_Instruments/Guitar/GTR20_Knob_Type1_03.skin'
		materials = [
			gtr_knob_type1_01_primary
		]
	}
	{
		desc_id = gtr20_knob_type2_03
		frontend_desc = qs(0x8f2cae0b)
		mesh = 'models/CAR_Instruments/Guitar/GTR20_Knob_Type2_03.skin'
		materials = [
			gtr_knob_type2_01_primary
		]
	}
	{
		desc_id = gtr20_knob_type3_03
		frontend_desc = qs(0xcc040f20)
		mesh = 'models/CAR_Instruments/Guitar/GTR20_Knob_Type3_03.skin'
		materials = [
			gtr_knob_type3_01_primary
		]
	}
	{
		desc_id = gtr20_knob_type4_03
		frontend_desc = qs(0xea9acd58)
		mesh = 'models/CAR_Instruments/Guitar/GTR20_Knob_Type4_03.skin'
	}
	{
		desc_id = gtr20_knob_type5_03
		frontend_desc = qs(0xe1c3434e)
		mesh = 'models/CAR_Instruments/Guitar/GTR20_Knob_Type5_03.skin'
		materials = [
			gtr_knob_type5_01_primary
		]
	}
	{
		desc_id = gtr20_knob_type6_03
		frontend_desc = qs(0xa433a9e0)
		mesh = 'models/CAR_Instruments/Guitar/GTR20_Knob_Type6_03.skin'
		materials = [
			gtr_knob_type6_01_primary
		]
	}
	{
		desc_id = gtr20_knob_type7_03
		frontend_desc = qs(0xc99e6543)
		mesh = 'models/CAR_Instruments/Guitar/GTR20_Knob_Type7_03.skin'
		materials = [
			gtr_knob_type7_01_primary
		]
	}
	{
		desc_id = gtr20_knob_type8_03
		frontend_desc = qs(0x4e6b4489)
		mesh = 'models/CAR_Instruments/Guitar/GTR20_Knob_Type8_03.skin'
		materials = [
			gtr_knob_type8_01_primary
		]
	}
	{
		desc_id = gtr20_knob_type9_03
		frontend_desc = qs(0x6d93a914)
		mesh = 'models/CAR_Instruments/Guitar/GTR20_Knob_Type9_03.skin'
		materials = [
			gtr_knob_type9_01_primary
		]
	}
	{
		desc_id = gtr20_knob_type10_03
		frontend_desc = qs(0x2a068a61)
		mesh = 'models/CAR_Instruments/Guitar/GTR20_Knob_Type10_03.skin'
		materials = [
			gtr_knob_type10_01_primary
		]
	}
	{
		desc_id = gtr31_knob_type1_03
		frontend_desc = qs(0xe301e646)
		mesh = 'models/CAR_Instruments/Guitar/GTR31_Knob_Type1_03.skin'
		materials = [
			gtr_knob_type1_01_primary
		]
	}
	{
		desc_id = gtr31_knob_type2_03
		frontend_desc = qs(0x8f2cae0b)
		mesh = 'models/CAR_Instruments/Guitar/GTR31_Knob_Type2_03.skin'
		materials = [
			gtr_knob_type2_01_primary
		]
	}
	{
		desc_id = gtr31_knob_type3_03
		frontend_desc = qs(0xcc040f20)
		mesh = 'models/CAR_Instruments/Guitar/GTR31_Knob_Type3_03.skin'
		materials = [
			gtr_knob_type3_01_primary
		]
	}
	{
		desc_id = gtr31_knob_type4_03
		frontend_desc = qs(0xea9acd58)
		mesh = 'models/CAR_Instruments/Guitar/GTR31_Knob_Type4_03.skin'
	}
	{
		desc_id = gtr31_knob_type5_03
		frontend_desc = qs(0xe1c3434e)
		mesh = 'models/CAR_Instruments/Guitar/GTR31_Knob_Type5_03.skin'
		materials = [
			gtr_knob_type5_01_primary
		]
	}
	{
		desc_id = gtr31_knob_type6_03
		frontend_desc = qs(0xa433a9e0)
		mesh = 'models/CAR_Instruments/Guitar/GTR31_Knob_Type6_03.skin'
		materials = [
			gtr_knob_type6_01_primary
		]
	}
	{
		desc_id = gtr31_knob_type7_03
		frontend_desc = qs(0xc99e6543)
		mesh = 'models/CAR_Instruments/Guitar/GTR31_Knob_Type7_03.skin'
		materials = [
			gtr_knob_type7_01_primary
		]
	}
	{
		desc_id = gtr31_knob_type8_03
		frontend_desc = qs(0x4e6b4489)
		mesh = 'models/CAR_Instruments/Guitar/GTR31_Knob_Type8_03.skin'
		materials = [
			gtr_knob_type8_01_primary
		]
	}
	{
		desc_id = gtr31_knob_type9_03
		frontend_desc = qs(0x6d93a914)
		mesh = 'models/CAR_Instruments/Guitar/GTR31_Knob_Type9_03.skin'
		materials = [
			gtr_knob_type9_01_primary
		]
	}
	{
		desc_id = gtr31_knob_type10_03
		frontend_desc = qs(0x2a068a61)
		mesh = 'models/CAR_Instruments/Guitar/GTR31_Knob_Type10_03.skin'
		materials = [
			gtr_knob_type10_01_primary
		]
	}
	{
		desc_id = gtr32_knob_type1_03
		frontend_desc = qs(0xe301e646)
		mesh = 'models/CAR_Instruments/Guitar/GTR32_Knob_Type1_03.skin'
		materials = [
			gtr_knob_type1_01_primary
		]
	}
	{
		desc_id = gtr32_knob_type2_03
		frontend_desc = qs(0x8f2cae0b)
		mesh = 'models/CAR_Instruments/Guitar/GTR32_Knob_Type2_03.skin'
		materials = [
			gtr_knob_type2_01_primary
		]
	}
	{
		desc_id = gtr32_knob_type3_03
		frontend_desc = qs(0xcc040f20)
		mesh = 'models/CAR_Instruments/Guitar/GTR32_Knob_Type3_03.skin'
		materials = [
			gtr_knob_type3_01_primary
		]
	}
	{
		desc_id = gtr32_knob_type4_03
		frontend_desc = qs(0xea9acd58)
		mesh = 'models/CAR_Instruments/Guitar/GTR32_Knob_Type4_03.skin'
	}
	{
		desc_id = gtr32_knob_type5_03
		frontend_desc = qs(0xe1c3434e)
		mesh = 'models/CAR_Instruments/Guitar/GTR32_Knob_Type5_03.skin'
		materials = [
			gtr_knob_type5_01_primary
		]
	}
	{
		desc_id = gtr32_knob_type6_03
		frontend_desc = qs(0xa433a9e0)
		mesh = 'models/CAR_Instruments/Guitar/GTR32_Knob_Type6_03.skin'
		materials = [
			gtr_knob_type6_01_primary
		]
	}
	{
		desc_id = gtr32_knob_type7_03
		frontend_desc = qs(0xc99e6543)
		mesh = 'models/CAR_Instruments/Guitar/GTR32_Knob_Type7_03.skin'
		materials = [
			gtr_knob_type7_01_primary
		]
	}
	{
		desc_id = gtr32_knob_type8_03
		frontend_desc = qs(0x4e6b4489)
		mesh = 'models/CAR_Instruments/Guitar/GTR32_Knob_Type8_03.skin'
		materials = [
			gtr_knob_type8_01_primary
		]
	}
	{
		desc_id = gtr32_knob_type9_03
		frontend_desc = qs(0x6d93a914)
		mesh = 'models/CAR_Instruments/Guitar/GTR32_Knob_Type9_03.skin'
		materials = [
			gtr_knob_type9_01_primary
		]
	}
	{
		desc_id = gtr32_knob_type10_03
		frontend_desc = qs(0x2a068a61)
		mesh = 'models/CAR_Instruments/Guitar/GTR32_Knob_Type10_03.skin'
		materials = [
			gtr_knob_type10_01_primary
		]
	}
	{
		desc_id = gtr_x13_knob_type1_02
		frontend_desc = qs(0xe301e646)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X13_Knob_Type1_02.skin'
		materials = [
			gtr_knob_type1_01_primary
		]
	}
	{
		desc_id = gtr_x13_knob_type2_02
		frontend_desc = qs(0x8f2cae0b)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X13_Knob_Type2_02.skin'
		materials = [
			gtr_knob_type2_01_primary
		]
	}
	{
		desc_id = gtr_x13_knob_type3_02
		frontend_desc = qs(0xcc040f20)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X13_Knob_Type3_02.skin'
		materials = [
			gtr_knob_type3_01_primary
		]
	}
	{
		desc_id = gtr_x13_knob_type4_02
		frontend_desc = qs(0xea9acd58)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X13_Knob_Type4_02.skin'
	}
	{
		desc_id = gtr_x13_knob_type5_02
		frontend_desc = qs(0xe1c3434e)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X13_Knob_Type5_02.skin'
		materials = [
			gtr_knob_type5_01_primary
		]
	}
	{
		desc_id = gtr_x13_knob_type6_02
		frontend_desc = qs(0xa433a9e0)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X13_Knob_Type6_02.skin'
		materials = [
			gtr_knob_type6_01_primary
		]
	}
	{
		desc_id = gtr_x13_knob_type7_02
		frontend_desc = qs(0xc99e6543)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X13_Knob_Type7_02.skin'
		materials = [
			gtr_knob_type7_01_primary
		]
	}
	{
		desc_id = gtr_x13_knob_type8_02
		frontend_desc = qs(0x4e6b4489)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X13_Knob_Type8_02.skin'
		materials = [
			gtr_knob_type8_01_primary
		]
	}
	{
		desc_id = gtr_x13_knob_type9_02
		frontend_desc = qs(0x6d93a914)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X13_Knob_Type9_02.skin'
		materials = [
			gtr_knob_type9_01_primary
		]
	}
	{
		desc_id = gtr_x13_knob_type10_02
		frontend_desc = qs(0x2a068a61)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X13_Knob_Type10_02.skin'
		materials = [
			gtr_knob_type10_01_primary
		]
	}
	{
		desc_id = gtr_x14_knob_type1_02
		frontend_desc = qs(0xe301e646)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X14_Knob_Type1_02.skin'
		materials = [
			gtr_knob_type1_01_primary
		]
	}
	{
		desc_id = gtr_x14_knob_type2_02
		frontend_desc = qs(0x8f2cae0b)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X14_Knob_Type2_02.skin'
		materials = [
			gtr_knob_type2_01_primary
		]
	}
	{
		desc_id = gtr_x14_knob_type3_02
		frontend_desc = qs(0xcc040f20)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X14_Knob_Type3_02.skin'
		materials = [
			gtr_knob_type3_01_primary
		]
	}
	{
		desc_id = gtr_x14_knob_type4_02
		frontend_desc = qs(0xea9acd58)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X14_Knob_Type4_02.skin'
	}
	{
		desc_id = gtr_x14_knob_type5_02
		frontend_desc = qs(0xe1c3434e)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X14_Knob_Type5_02.skin'
		materials = [
			gtr_knob_type5_01_primary
		]
	}
	{
		desc_id = gtr_x14_knob_type6_02
		frontend_desc = qs(0xa433a9e0)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X14_Knob_Type6_02.skin'
		materials = [
			gtr_knob_type6_01_primary
		]
	}
	{
		desc_id = gtr_x14_knob_type7_02
		frontend_desc = qs(0xc99e6543)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X14_Knob_Type7_02.skin'
		materials = [
			gtr_knob_type7_01_primary
		]
	}
	{
		desc_id = gtr_x14_knob_type8_02
		frontend_desc = qs(0x4e6b4489)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X14_Knob_Type8_02.skin'
		materials = [
			gtr_knob_type8_01_primary
		]
	}
	{
		desc_id = gtr_x14_knob_type9_02
		frontend_desc = qs(0x6d93a914)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X14_Knob_Type9_02.skin'
		materials = [
			gtr_knob_type9_01_primary
		]
	}
	{
		desc_id = gtr_x14_knob_type10_02
		frontend_desc = qs(0x2a068a61)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X14_Knob_Type10_02.skin'
		materials = [
			gtr_knob_type10_01_primary
		]
	}
	{
		desc_id = gtr_x1_skull_knob_01
		frontend_desc = qs(0x7e4ad23f)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X1_Skull_Knob_01.skin'
		materials = [
			gtr_knob_type1_01_primary
		]
	}
	{
		desc_id = gtr_x1_skull_knob_02
		frontend_desc = qs(0x556781fc)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X1_Skull_Knob_02.skin'
		materials = [
			gtr_knob_type1_01_primary
		]
	}
	{
		desc_id = gtr_x1_knob_type2_02
		frontend_desc = qs(0x0d93f93b)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X1_Knob_Type2_02.skin'
		materials = [
			gtr_knob_type2_01_primary
		]
	}
	{
		desc_id = gtr_x1_knob_type2_01
		frontend_desc = qs(0x26beaaf8)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X1_Knob_Type2_01.skin'
		materials = [
			gtr_knob_type2_01_primary
		]
	}
	{
		desc_id = gtr_x1_knob_type3_02
		frontend_desc = qs(0x109258d3)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X1_Knob_Type3_02.skin'
		materials = [
			gtr_knob_type3_01_primary
		]
	}
	{
		desc_id = gtr_x1_knob_type3_01
		frontend_desc = qs(0x3bbf0b10)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X1_Knob_Type3_01.skin'
		materials = [
			gtr_knob_type3_01_primary
		]
	}
	{
		desc_id = gtr_x1_knob_type4_02
		frontend_desc = qs(0x11fdb0e7)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X1_Knob_Type4_02.skin'
		materials = [
			gtr_knob_type4_01_primary
		]
	}
	{
		desc_id = gtr_x1_knob_type4_01
		frontend_desc = qs(0x3ad0e324)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X1_Knob_Type4_01.skin'
		materials = [
			gtr_knob_type4_01_primary
		]
	}
	{
		desc_id = gtr_x1_knob_type5_02
		frontend_desc = qs(0x738fb1bb)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X1_Knob_Type5_02.skin'
		materials = [
			gtr_knob_type5_01_primary
		]
	}
	{
		desc_id = gtr_x1_knob_type5_01
		frontend_desc = qs(0x58a2e278)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X1_Knob_Type5_01.skin'
		materials = [
			gtr_knob_type5_01_primary
		]
	}
	{
		desc_id = gtr_x1_knob_type6_02
		frontend_desc = qs(0x6844de59)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X1_Knob_Type6_02.skin'
		materials = [
			gtr_knob_type6_01_primary
		]
	}
	{
		desc_id = gtr_x1_knob_type6_01
		frontend_desc = qs(0x43698d9a)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X1_Knob_Type6_01.skin'
		materials = [
			gtr_knob_type6_01_primary
		]
	}
	{
		desc_id = gtr_x1_knob_type7_02
		frontend_desc = qs(0x8785d8d7)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X1_Knob_Type7_02.skin'
		materials = [
			gtr_knob_type7_01_primary
		]
	}
	{
		desc_id = gtr_x1_knob_type7_01
		frontend_desc = qs(0xaca88b14)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X1_Knob_Type7_01.skin'
		materials = [
			gtr_knob_type7_01_primary
		]
	}
	{
		desc_id = gtr_x1_knob_type8_02
		frontend_desc = qs(0xbdedf919)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X1_Knob_Type8_02.skin'
		materials = [
			gtr_knob_type8_01_primary
		]
	}
	{
		desc_id = gtr_x1_knob_type8_01
		frontend_desc = qs(0x96c0aada)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X1_Knob_Type8_01.skin'
		materials = [
			gtr_knob_type8_01_primary
		]
	}
	{
		desc_id = gtr_x1_knob_type9_02
		frontend_desc = qs(0x2dff9954)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X1_Knob_Type9_02.skin'
		materials = [
			gtr_knob_type9_01_primary
		]
	}
	{
		desc_id = gtr_x1_knob_type9_01
		frontend_desc = qs(0x06d2ca97)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X1_Knob_Type9_01.skin'
		materials = [
			gtr_knob_type9_01_primary
		]
	}
	{
		desc_id = gtr_x1_knob_type10_02
		frontend_desc = qs(0xaf9b9b2f)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X1_Knob_Type10_02.skin'
		materials = [
			gtr_knob_type10_01_primary
		]
	}
	{
		desc_id = gtr_x1_knob_type10_01
		frontend_desc = qs(0x84b6c8ec)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X1_Knob_Type10_01.skin'
		materials = [
			gtr_knob_type10_01_primary
		]
	}
	{
		desc_id = gtr_x2_knob_type1_03
		frontend_desc = qs(0xe301e646)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X2_Knob_Type1_03.skin'
		materials = [
			gtr_knob_type1_01_primary
		]
	}
	{
		desc_id = gtr_x2_knob_type2_03
		frontend_desc = qs(0x8f2cae0b)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X2_Knob_Type2_03.skin'
		materials = [
			gtr_knob_type2_01_primary
		]
	}
	{
		desc_id = gtr_x2_knob_type3_03
		frontend_desc = qs(0xcc040f20)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X2_Knob_Type3_03.skin'
		materials = [
			gtr_knob_type3_01_primary
		]
	}
	{
		desc_id = gtr_x2_knob_type4_03
		frontend_desc = qs(0xea9acd58)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X2_Knob_Type4_03.skin'
		materials = [
			gtr_knob_type4_01_primary
		]
	}
	{
		desc_id = gtr_x2_knob_type5_03
		frontend_desc = qs(0xe1c3434e)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X2_Knob_Type5_03.skin'
		materials = [
			gtr_knob_type5_01_primary
		]
	}
	{
		desc_id = gtr_x2_knob_type6_03
		frontend_desc = qs(0xa433a9e0)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X2_Knob_Type6_03.skin'
		materials = [
			gtr_knob_type6_01_primary
		]
	}
	{
		desc_id = gtr_x2_knob_type7_03
		frontend_desc = qs(0xc99e6543)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X2_Knob_Type7_03.skin'
		materials = [
			gtr_knob_type7_01_primary
		]
	}
	{
		desc_id = gtr_x2_knob_type8_03
		frontend_desc = qs(0x4e6b4489)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X2_Knob_Type8_03.skin'
		materials = [
			gtr_knob_type8_01_primary
		]
	}
	{
		desc_id = gtr_x2_knob_type9_03
		frontend_desc = qs(0x6d93a914)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X2_Knob_Type9_03.skin'
		materials = [
			gtr_knob_type9_01_primary
		]
	}
	{
		desc_id = gtr_x2_knob_type10_03
		frontend_desc = qs(0x2a068a61)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X2_Knob_Type10_03.skin'
		materials = [
			gtr_knob_type10_01_primary
		]
	}
	{
		desc_id = gtr_x3_knob_type1_03
		frontend_desc = qs(0xe301e646)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X3_Knob_Type1_03.skin'
		materials = [
			gtr_knob_type1_01_primary
		]
	}
	{
		desc_id = gtr_x3_knob_type2_03
		frontend_desc = qs(0x8f2cae0b)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X3_Knob_Type2_03.skin'
		materials = [
			gtr_knob_type2_01_primary
		]
	}
	{
		desc_id = gtr_x3_knob_type3_03
		frontend_desc = qs(0xcc040f20)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X3_Knob_Type3_03.skin'
		materials = [
			gtr_knob_type3_01_primary
		]
	}
	{
		desc_id = gtr_x3_knob_type4_03
		frontend_desc = qs(0xea9acd58)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X3_Knob_Type4_03.skin'
		materials = [
			gtr_knob_type4_01_primary
		]
	}
	{
		desc_id = gtr_x3_knob_type5_03
		frontend_desc = qs(0xe1c3434e)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X3_Knob_Type5_03.skin'
		materials = [
			gtr_knob_type5_01_primary
		]
	}
	{
		desc_id = gtr_x3_knob_type6_03
		frontend_desc = qs(0xa433a9e0)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X3_Knob_Type6_03.skin'
		materials = [
			gtr_knob_type6_01_primary
		]
	}
	{
		desc_id = gtr_x3_knob_type7_03
		frontend_desc = qs(0xc99e6543)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X3_Knob_Type7_03.skin'
		materials = [
			gtr_knob_type7_01_primary
		]
	}
	{
		desc_id = gtr_x3_knob_type8_03
		frontend_desc = qs(0x4e6b4489)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X3_Knob_Type8_03.skin'
		materials = [
			gtr_knob_type8_01_primary
		]
	}
	{
		desc_id = gtr_x3_knob_type9_03
		frontend_desc = qs(0x6d93a914)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X3_Knob_Type9_03.skin'
		materials = [
			gtr_knob_type9_01_primary
		]
	}
	{
		desc_id = gtr_x3_knob_type10_03
		frontend_desc = qs(0x2a068a61)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X3_Knob_Type10_03.skin'
		materials = [
			gtr_knob_type10_01_primary
		]
	}
	{
		desc_id = gtr_x4_knob_type1_03
		frontend_desc = qs(0xe301e646)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X4_Knob_Type1_03.skin'
		materials = [
			gtr_knob_type1_01_primary
		]
	}
	{
		desc_id = gtr_x4_knob_type2_03
		frontend_desc = qs(0x8f2cae0b)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X4_Knob_Type2_03.skin'
		materials = [
			gtr_knob_type2_01_primary
		]
	}
	{
		desc_id = gtr_x4_knob_type3_03
		frontend_desc = qs(0xcc040f20)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X4_Knob_Type3_03.skin'
		materials = [
			gtr_knob_type3_01_primary
		]
	}
	{
		desc_id = gtr_x4_knob_type4_03
		frontend_desc = qs(0xea9acd58)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X4_Knob_Type4_03.skin'
		materials = [
			gtr_knob_type4_01_primary
		]
	}
	{
		desc_id = gtr_x4_knob_type5_03
		frontend_desc = qs(0xe1c3434e)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X4_Knob_Type5_03.skin'
		materials = [
			gtr_knob_type5_01_primary
		]
	}
	{
		desc_id = gtr_x4_knob_type6_03
		frontend_desc = qs(0xa433a9e0)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X4_Knob_Type6_03.skin'
		materials = [
			gtr_knob_type6_01_primary
		]
	}
	{
		desc_id = gtr_x4_knob_type7_03
		frontend_desc = qs(0xc99e6543)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X4_Knob_Type7_03.skin'
		materials = [
			gtr_knob_type7_01_primary
		]
	}
	{
		desc_id = gtr_x4_knob_type8_03
		frontend_desc = qs(0x4e6b4489)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X4_Knob_Type8_03.skin'
		materials = [
			gtr_knob_type8_01_primary
		]
	}
	{
		desc_id = gtr_x4_knob_type9_03
		frontend_desc = qs(0x6d93a914)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X4_Knob_Type9_03.skin'
		materials = [
			gtr_knob_type9_01_primary
		]
	}
	{
		desc_id = gtr_x4_knob_type10_03
		frontend_desc = qs(0x2a068a61)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X4_Knob_Type10_03.skin'
		materials = [
			gtr_knob_type10_01_primary
		]
	}
	{
		desc_id = gtr_x5_knob_type1_03
		frontend_desc = qs(0xe301e646)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X5_Knob_Type1_03.skin'
		materials = [
			gtr_knob_type1_01_primary
		]
	}
	{
		desc_id = gtr_x5_knob_type2_03
		frontend_desc = qs(0x8f2cae0b)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X5_Knob_Type2_03.skin'
		materials = [
			gtr_knob_type2_01_primary
		]
	}
	{
		desc_id = gtr_x5_knob_type3_03
		frontend_desc = qs(0xcc040f20)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X5_Knob_Type3_03.skin'
		materials = [
			gtr_knob_type3_01_primary
		]
	}
	{
		desc_id = gtr_x5_knob_type4_03
		frontend_desc = qs(0xea9acd58)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X5_Knob_Type4_03.skin'
		materials = [
			gtr_knob_type4_01_primary
		]
	}
	{
		desc_id = gtr_x5_knob_type5_03
		frontend_desc = qs(0xe1c3434e)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X5_Knob_Type5_03.skin'
		materials = [
			gtr_knob_type5_01_primary
		]
	}
	{
		desc_id = gtr_x5_knob_type6_03
		frontend_desc = qs(0xa433a9e0)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X5_Knob_Type6_03.skin'
		materials = [
			gtr_knob_type6_01_primary
		]
	}
	{
		desc_id = gtr_x5_knob_type7_03
		frontend_desc = qs(0xc99e6543)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X5_Knob_Type7_03.skin'
		materials = [
			gtr_knob_type7_01_primary
		]
	}
	{
		desc_id = gtr_x5_knob_type8_03
		frontend_desc = qs(0x4e6b4489)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X5_Knob_Type8_03.skin'
		materials = [
			gtr_knob_type8_01_primary
		]
	}
	{
		desc_id = gtr_x5_knob_type9_03
		frontend_desc = qs(0x6d93a914)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X5_Knob_Type9_03.skin'
		materials = [
			gtr_knob_type9_01_primary
		]
	}
	{
		desc_id = gtr_x5_knob_type10_03
		frontend_desc = qs(0x2a068a61)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X5_Knob_Type10_03.skin'
		materials = [
			gtr_knob_type10_01_primary
		]
	}
	{
		desc_id = gtr_x6_knob_type1_03
		frontend_desc = qs(0xe301e646)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X6_Knob_Type1_03.skin'
		materials = [
			gtr_knob_type1_01_primary
		]
	}
	{
		desc_id = gtr_x6_knob_type2_03
		frontend_desc = qs(0x8f2cae0b)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X6_Knob_Type2_03.skin'
		materials = [
			gtr_knob_type2_01_primary
		]
	}
	{
		desc_id = gtr_x6_knob_type3_03
		frontend_desc = qs(0xcc040f20)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X6_Knob_Type3_03.skin'
		materials = [
			gtr_knob_type3_01_primary
		]
	}
	{
		desc_id = gtr_x6_knob_type4_03
		frontend_desc = qs(0xea9acd58)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X6_Knob_Type4_03.skin'
		materials = [
			gtr_knob_type4_01_primary
		]
	}
	{
		desc_id = gtr_x6_knob_type5_03
		frontend_desc = qs(0xe1c3434e)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X6_Knob_Type5_03.skin'
		materials = [
			gtr_knob_type5_01_primary
		]
	}
	{
		desc_id = gtr_x6_knob_type6_03
		frontend_desc = qs(0xa433a9e0)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X6_Knob_Type6_03.skin'
		materials = [
			gtr_knob_type6_01_primary
		]
	}
	{
		desc_id = gtr_x6_knob_type7_03
		frontend_desc = qs(0xc99e6543)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X6_Knob_Type7_03.skin'
		materials = [
			gtr_knob_type7_01_primary
		]
	}
	{
		desc_id = gtr_x6_knob_type8_03
		frontend_desc = qs(0x4e6b4489)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X6_Knob_Type8_03.skin'
		materials = [
			gtr_knob_type8_01_primary
		]
	}
	{
		desc_id = gtr_x6_knob_type9_03
		frontend_desc = qs(0x6d93a914)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X6_Knob_Type9_03.skin'
		materials = [
			gtr_knob_type9_01_primary
		]
	}
	{
		desc_id = gtr_x6_knob_type10_03
		frontend_desc = qs(0x2a068a61)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X6_Knob_Type10_03.skin'
		materials = [
			gtr_knob_type10_01_primary
		]
	}
	{
		desc_id = gtr_x7_knob_type1_03
		frontend_desc = qs(0xe301e646)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X7_Knob_Type1_03.skin'
		materials = [
			gtr_knob_type1_01_primary
		]
	}
	{
		desc_id = gtr_x7_knob_type2_03
		frontend_desc = qs(0x8f2cae0b)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X7_Knob_Type2_03.skin'
		materials = [
			gtr_knob_type2_01_primary
		]
	}
	{
		desc_id = gtr_x7_knob_type3_03
		frontend_desc = qs(0xcc040f20)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X7_Knob_Type3_03.skin'
		materials = [
			gtr_knob_type3_01_primary
		]
	}
	{
		desc_id = gtr_x7_knob_type4_03
		frontend_desc = qs(0xea9acd58)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X7_Knob_Type4_03.skin'
		materials = [
			gtr_knob_type4_01_primary
		]
	}
	{
		desc_id = gtr_x7_knob_type5_03
		frontend_desc = qs(0xe1c3434e)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X7_Knob_Type5_03.skin'
		materials = [
			gtr_knob_type5_01_primary
		]
	}
	{
		desc_id = gtr_x7_knob_type6_03
		frontend_desc = qs(0xa433a9e0)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X7_Knob_Type6_03.skin'
		materials = [
			gtr_knob_type6_01_primary
		]
	}
	{
		desc_id = gtr_x7_knob_type7_03
		frontend_desc = qs(0xc99e6543)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X7_Knob_Type7_03.skin'
		materials = [
			gtr_knob_type7_01_primary
		]
	}
	{
		desc_id = gtr_x7_knob_type8_03
		frontend_desc = qs(0x4e6b4489)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X7_Knob_Type8_03.skin'
		materials = [
			gtr_knob_type8_01_primary
		]
	}
	{
		desc_id = gtr_x7_knob_type9_03
		frontend_desc = qs(0x6d93a914)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X7_Knob_Type9_03.skin'
		materials = [
			gtr_knob_type9_01_primary
		]
	}
	{
		desc_id = gtr_x7_knob_type10_03
		frontend_desc = qs(0x2a068a61)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X7_Knob_Type10_03.skin'
		materials = [
			gtr_knob_type10_01_primary
		]
	}
	{
		desc_id = gtr_x8_knob_type1_03
		frontend_desc = qs(0xe301e646)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X8_Knob_Type1_03.skin'
		materials = [
			gtr_knob_type1_01_primary
		]
	}
	{
		desc_id = gtr_x8_knob_type2_03
		frontend_desc = qs(0x8f2cae0b)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X8_Knob_Type2_03.skin'
		materials = [
			gtr_knob_type2_01_primary
		]
	}
	{
		desc_id = gtr_x8_knob_type3_03
		frontend_desc = qs(0xcc040f20)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X8_Knob_Type3_03.skin'
		materials = [
			gtr_knob_type3_01_primary
		]
	}
	{
		desc_id = gtr_x8_knob_type4_03
		frontend_desc = qs(0xea9acd58)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X8_Knob_Type4_03.skin'
		materials = [
			gtr_knob_type4_01_primary
		]
	}
	{
		desc_id = gtr_x8_knob_type5_03
		frontend_desc = qs(0xe1c3434e)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X8_Knob_Type5_03.skin'
		materials = [
			gtr_knob_type5_01_primary
		]
	}
	{
		desc_id = gtr_x8_knob_type6_03
		frontend_desc = qs(0xa433a9e0)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X8_Knob_Type6_03.skin'
		materials = [
			gtr_knob_type6_01_primary
		]
	}
	{
		desc_id = gtr_x8_knob_type7_03
		frontend_desc = qs(0xc99e6543)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X8_Knob_Type7_03.skin'
		materials = [
			gtr_knob_type7_01_primary
		]
	}
	{
		desc_id = gtr_x8_knob_type8_03
		frontend_desc = qs(0x4e6b4489)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X8_Knob_Type8_03.skin'
		materials = [
			gtr_knob_type8_01_primary
		]
	}
	{
		desc_id = gtr_x8_knob_type9_03
		frontend_desc = qs(0x6d93a914)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X8_Knob_Type9_03.skin'
		materials = [
			gtr_knob_type9_01_primary
		]
	}
	{
		desc_id = gtr_x8_knob_type10_03
		frontend_desc = qs(0x2a068a61)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X8_Knob_Type10_03.skin'
		materials = [
			gtr_knob_type10_01_primary
		]
	}
	{
		desc_id = gtr_x9_knob_type1_03
		frontend_desc = qs(0xe301e646)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X9_Knob_Type1_03.skin'
		materials = [
			gtr_knob_type1_01_primary
		]
	}
	{
		desc_id = gtr_x9_knob_type2_03
		frontend_desc = qs(0x8f2cae0b)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X9_Knob_Type2_03.skin'
		materials = [
			gtr_knob_type2_01_primary
		]
	}
	{
		desc_id = gtr_x9_knob_type3_03
		frontend_desc = qs(0xcc040f20)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X9_Knob_Type3_03.skin'
		materials = [
			gtr_knob_type3_01_primary
		]
	}
	{
		desc_id = gtr_x9_knob_type4_03
		frontend_desc = qs(0xea9acd58)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X9_Knob_Type4_03.skin'
		materials = [
			gtr_knob_type4_01_primary
		]
	}
	{
		desc_id = gtr_x9_knob_type5_03
		frontend_desc = qs(0xe1c3434e)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X9_Knob_Type5_03.skin'
		materials = [
			gtr_knob_type5_01_primary
		]
	}
	{
		desc_id = gtr_x9_knob_type6_03
		frontend_desc = qs(0xa433a9e0)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X9_Knob_Type6_03.skin'
		materials = [
			gtr_knob_type6_01_primary
		]
	}
	{
		desc_id = gtr_x9_knob_type7_03
		frontend_desc = qs(0xc99e6543)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X9_Knob_Type7_03.skin'
		materials = [
			gtr_knob_type7_01_primary
		]
	}
	{
		desc_id = gtr_x9_knob_type8_03
		frontend_desc = qs(0x4e6b4489)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X9_Knob_Type8_03.skin'
		materials = [
			gtr_knob_type8_01_primary
		]
	}
	{
		desc_id = gtr_x9_knob_type9_03
		frontend_desc = qs(0x6d93a914)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X9_Knob_Type9_03.skin'
		materials = [
			gtr_knob_type9_01_primary
		]
	}
	{
		desc_id = gtr_x9_knob_type10_03
		frontend_desc = qs(0x2a068a61)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X9_Knob_Type10_03.skin'
		materials = [
			gtr_knob_type10_01_primary
		]
	}
	{
		desc_id = gtr_x10_knob_type1_03
		frontend_desc = qs(0xe301e646)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X10_Knob_Type1_03.skin'
		materials = [
			gtr_knob_type1_01_primary
		]
	}
	{
		desc_id = gtr_x10_knob_type2_03
		frontend_desc = qs(0x8f2cae0b)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X10_Knob_Type2_03.skin'
		materials = [
			gtr_knob_type2_01_primary
		]
	}
	{
		desc_id = gtr_x10_knob_type3_03
		frontend_desc = qs(0xcc040f20)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X10_Knob_Type3_03.skin'
		materials = [
			gtr_knob_type3_01_primary
		]
	}
	{
		desc_id = gtr_x10_knob_type4_03
		frontend_desc = qs(0xea9acd58)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X10_Knob_Type4_03.skin'
		materials = [
			gtr_knob_type4_01_primary
		]
	}
	{
		desc_id = gtr_x10_knob_type5_03
		frontend_desc = qs(0xe1c3434e)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X10_Knob_Type5_03.skin'
		materials = [
			gtr_knob_type5_01_primary
		]
	}
	{
		desc_id = gtr_x10_knob_type6_03
		frontend_desc = qs(0xa433a9e0)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X10_Knob_Type6_03.skin'
		materials = [
			gtr_knob_type6_01_primary
		]
	}
	{
		desc_id = gtr_x10_knob_type7_03
		frontend_desc = qs(0xc99e6543)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X10_Knob_Type7_03.skin'
		materials = [
			gtr_knob_type7_01_primary
		]
	}
	{
		desc_id = gtr_x10_knob_type8_03
		frontend_desc = qs(0x4e6b4489)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X10_Knob_Type8_03.skin'
		materials = [
			gtr_knob_type8_01_primary
		]
	}
	{
		desc_id = gtr_x10_knob_type9_03
		frontend_desc = qs(0x6d93a914)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X10_Knob_Type9_03.skin'
		materials = [
			gtr_knob_type9_01_primary
		]
	}
	{
		desc_id = gtr_x10_knob_type10_03
		frontend_desc = qs(0x2a068a61)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X10_Knob_Type10_03.skin'
		materials = [
			gtr_knob_type10_01_primary
		]
	}
	{
		desc_id = none
		frontend_desc = qs(0x9c1b5214)
		random_weight = 10.0
	}
]
cas_guitar_bridges = [
	{
		desc_id = gtr_hardware_vh1
		frontend_desc = qs(0x0ed35159)
		mesh = 'models/CAR_Instruments/Guitar/VH/GTR_Hardware_VH1.skin'
		random_weight = 0.0
		guitar_string_start = gtr_hardware_vh1_string_start_properties
		guitar_string_end = gtr_hardware_vh1_string_end_properties
		$car_rocker_guitars_factoredglobal_103
	}
	{
		desc_id = gtr_hardware_vh2
		frontend_desc = qs(0xe4558c3b)
		mesh = 'models/CAR_Instruments/Guitar/VH/GTR_Hardware_VH2.skin'
		random_weight = 0.0
		guitar_string_start = gtr_hardware_vh2_string_start_properties
		guitar_string_end = gtr_hardware_vh2_string_end_properties
		$car_rocker_guitars_factoredglobal_103
	}
	{
		desc_id = gtr_hardware_vh4
		frontend_desc = qs(0x932563c3)
		mesh = 'models/CAR_Instruments/Guitar/VH/GTR_Hardware_VH4.skin'
		random_weight = 0.0
		guitar_string_start = gtr_hardware_vh4_string_start_properties
		guitar_string_end = gtr_hardware_vh4_string_end_properties
		$car_rocker_guitars_factoredglobal_103
	}
	{
		desc_id = gtr_hardware_vhshark
		frontend_desc = qs(0x975fa6f3)
		mesh = 'models/CAR_Instruments/Guitar/VH/GTR_Hardware_VHShark.skin'
		random_weight = 0.0
		guitar_string_start = gtr_hardware_vhshark_string_start_properties
		guitar_string_end = gtr_hardware_vhshark_string_end_properties
		$car_rocker_guitars_factoredglobal_103
	}
	{
		desc_id = gtr_hardware_vhfstrat
		frontend_desc = qs(0xfaec6b51)
		mesh = 'models/CAR_Instruments/Guitar/VH/GTR_Hardware_VHFstrat.skin'
		random_weight = 0.0
		guitar_string_start = gtr_hardware_vhfstrat_string_start_properties
		guitar_string_end = gtr_hardware_vhfstrat_string_end_properties
		$car_rocker_guitars_factoredglobal_103
	}
	{
		desc_id = gtr_hardware_vhwolf
		frontend_desc = qs(0x0d8d8f59)
		mesh = 'models/CAR_Instruments/Guitar/VH/GTR_Hardware_VHWolf.skin'
		random_weight = 0.0
		guitar_string_start = gtr_hardware_vhwolf_string_start_properties
		guitar_string_end = gtr_hardware_vhwolf_string_end_properties
		$car_rocker_guitars_factoredglobal_103
	}
	{
		desc_id = gtr_hardware_vhdlr
		frontend_desc = qs(0xb4a4d17f)
		mesh = 'models/CAR_Instruments/Guitar/VH/GTR_Hardware_VHDLR.skin'
		random_weight = 0.0
		guitar_string_start = gtr_hardware_vhdlr_string_start_properties
		guitar_string_end = gtr_hardware_vhdlr_string_end_properties
		$car_rocker_guitars_factoredglobal_103
	}
	{
		desc_id = gtr_hardware01a
		frontend_desc = qs(0xfb65592f)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Hardware01a.skin'
		materials = [
			gtr_hardware01a_primary
		]
	}
	{
		desc_id = gtr_hardware01b
		frontend_desc = qs(0x60142d7e)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Hardware01b.skin'
		materials = [
			gtr_hardware01b_primary
		]
		guitar_string_start = gtr_hardware01b_start_properties
		guitar_string_end = gtr_hardware01b_end_properties
	}
	{
		desc_id = gtr_hardware05
		frontend_desc = qs(0xc7aa208c)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Hardware05.skin'
		materials = [
			gtr_hardware05_primary
		]
	}
	{
		desc_id = gtr_hardware06
		frontend_desc = qs(0x1533e5a5)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Hardware06.skin'
		materials = [
			gtr_hardware06_primary
		]
	}
	{
		desc_id = gtr_hardware07
		frontend_desc = qs(0x06c1e8b6)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Hardware07.skin'
		materials = [
			gtr_hardware07_primary
		]
	}
	{
		desc_id = gtr_hardware03a
		frontend_desc = qs(0x118f881d)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Hardware03a.skin'
		materials = [
			gtr_hardware03a_primary
		]
	}
	{
		desc_id = gtr_hardware04a
		frontend_desc = qs(0x6973bba6)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Hardware04a.skin'
		materials = [
			gtr_hardware04a_primary
		]
	}
	{
		desc_id = gtr8_hardware08a
		frontend_desc = qs(0x34d53cf3)
		mesh = 'models/CAR_Instruments/Guitar/GTR8_Hardware08a.skin'
		materials = [
			gtr8_hardware08a_primary
		]
	}
	{
		desc_id = gtr12_hardware_01
		frontend_desc = qs(0x006397d5)
		mesh = 'models/CAR_Instruments/Guitar/GTR12_Hardware_01.skin'
		materials = [
			gtr12_hardware_01_primary
		]
	}
	{
		desc_id = gtr_x3_anarc_hardware03
		frontend_desc = qs(0x886eced7)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X3_Anarc_Hardware03.skin'
		materials = [
			gtr_x3_anarc_hardware03_primary
		]
	}
	{
		desc_id = gtr_x1_skull_hardware02
		frontend_desc = qs(0xfad00e1b)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X1_Skull_Hardware02.skin'
		materials = [
			gtr_x1_skull_hardware02_primary
		]
	}
]
cas_guitar_neck = [
	{
		desc_id = gtr_neck_vh1
		frontend_desc = qs(0xadcc7415)
		mesh = 'models/CAR_Instruments/Guitar/VH/GTR_Neck_VH1.skin'
		random_weight = 0.0
		$car_rocker_guitars_factoredglobal_103
	}
	{
		desc_id = gtr_neck_vh2
		frontend_desc = qs(0x94b4d955)
		mesh = 'models/CAR_Instruments/Guitar/VH/GTR_Neck_VH2.skin'
		random_weight = 0.0
		$car_rocker_guitars_factoredglobal_103
	}
	{
		desc_id = gtr_neck_vh4
		frontend_desc = qs(0xaa3c7ffa)
		mesh = 'models/CAR_Instruments/Guitar/VH/GTR_Neck_VH4.skin'
		random_weight = 0.0
		$car_rocker_guitars_factoredglobal_103
	}
	{
		desc_id = gtr_neck_vhshark
		frontend_desc = qs(0x5ef0d610)
		mesh = 'models/CAR_Instruments/Guitar/VH/GTR_Neck_VHShark.skin'
		random_weight = 0.0
		$car_rocker_guitars_factoredglobal_103
	}
	{
		desc_id = gtr_neck_vhfstrat
		frontend_desc = qs(0x6a55227f)
		mesh = 'models/CAR_Instruments/Guitar/VH/GTR_Neck_VHFstrat.skin'
		random_weight = 0.0
		$car_rocker_guitars_factoredglobal_103
	}
	{
		desc_id = gtr_neck_vhwolf
		frontend_desc = qs(0x97ea4d4f)
		mesh = 'models/CAR_Instruments/Guitar/VH/GTR_Neck_VHWolf.skin'
		random_weight = 0.0
		$car_rocker_guitars_factoredglobal_103
	}
	{
		desc_id = gtr_neck_vhdlr
		frontend_desc = qs(0xfb8943e7)
		mesh = 'models/CAR_Instruments/Guitar/VH/GTR_Neck_VHDLR.skin'
		random_weight = 0.0
		$car_rocker_guitars_factoredglobal_103
	}
	{
		desc_id = guitar_neck01
		frontend_desc = qs(0x038ed054)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_Neck01.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/neck_maple_tb_01.dds'
				material = guitar_neck1_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_174
				$car_rocker_guitars_factoredglobal_175
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/neck_maple_tb_01.dds`
				material = guitar_neck1_primary
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/neck1_inlay_ornate2_d_06.img`
						flags = 4
						color = grey_1
					}
				]
				$car_rocker_guitars_factoredglobal_176
			}
		]
	}
	{
		desc_id = guitar_neck02
		frontend_desc = qs(0x9c1f7dd8)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_Neck02.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/neck_maple_tb_02.dds'
				material = guitar_neck2_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_174
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/neck_maple_tb_02.dds`
				material = guitar_neck2_primary
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/neck1_inlay_vine1_d_03.img`
						flags = 4
					}
				]
				$car_rocker_guitars_factoredglobal_176
			}
		]
	}
	{
		desc_id = guitar_neck03
		frontend_desc = qs(0x2028b2db)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_Neck03.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/neck_maple_tb_03.dds'
				material = guitar_neck3_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_174
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/neck_maple_tb_03.dds`
				material = guitar_neck3_primary
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/neck1_inlay_ornate1_d_05.img`
						flags = 4
					}
				]
				$car_rocker_guitars_factoredglobal_176
			}
		]
	}
	{
		desc_id = guitar_neck04
		frontend_desc = qs(0xa60c246f)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Neck_04.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/neck_maple_tb_04.dds'
				material = guitar_neck4_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_174
				$car_rocker_guitars_factoredglobal_175
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/neck_maple_tb_04.dds`
				material = guitar_neck4_primary
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/neck1_inlay_ornate2_d_06.img`
						flags = 4
						color = grey_1
					}
				]
				$car_rocker_guitars_factoredglobal_176
			}
		]
	}
	{
		desc_id = guitar_neck05
		frontend_desc = qs(0x85aa46e0)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Neck_05.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/neck_maple_tb_05.dds'
				material = guitar_neck5_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_174
				$car_rocker_guitars_factoredglobal_175
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/neck_maple_tb_05.dds`
				material = guitar_neck5_primary
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/neck1_inlay_dots1_d_01.img`
						flags = 4
						color = grey_3
					}
				]
				$car_rocker_guitars_factoredglobal_176
			}
		]
	}
	{
		desc_id = guitar_neck07
		frontend_desc = qs(0x9b525669)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Neck_07.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/neck_stone_tb_07.dds'
				material = guitar_neck7_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_174
				$car_rocker_guitars_factoredglobal_175
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/neck_stone_tb_07.dds`
				material = guitar_neck7_primary
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/neck1_inlay_dots1_d_01.img`
						flags = 4
						color = grey_3
					}
				]
				$car_rocker_guitars_factoredglobal_176
			}
		]
	}
	{
		desc_id = guitar_neck06
		frontend_desc = qs(0xb8cf91fd)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Neck_06.skin'
		random_weight = 0.0
	}
	{
		desc_id = guitar_neck_nugent
		frontend_desc = qs(0xf25755cf)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_Neck_98.skin'
		$car_rocker_guitars_factoredglobal_103
	}
	{
		desc_id = guitar_neck_corgan
		frontend_desc = qs(0x86e5e72b)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_Neck_97.skin'
		$car_rocker_guitars_factoredglobal_103
	}
]
cas_guitar_head = [
	{
		desc_id = gtr_headstock_vh1
		frontend_desc = qs(0x8345ba67)
		mesh = 'models/CAR_Instruments/Guitar/VH/GTR_Headstock_VH1.skin'
		random_weight = 0.0
		$car_rocker_guitars_factoredglobal_103
	}
	{
		desc_id = gtr_headstock_vh2
		frontend_desc = qs(0xa868e9a4)
		mesh = 'models/CAR_Instruments/Guitar/VH/GTR_Headstock_VH2.skin'
		random_weight = 0.0
		$car_rocker_guitars_factoredglobal_103
	}
	{
		desc_id = gtr_headstock_vh4
		frontend_desc = qs(0x5cb7fba1)
		mesh = 'models/CAR_Instruments/Guitar/VH/GTR_Headstock_VH4.skin'
		random_weight = 0.0
		$car_rocker_guitars_factoredglobal_103
	}
	{
		desc_id = gtr_headstock_vhshark
		frontend_desc = qs(0xf53dea7b)
		mesh = 'models/CAR_Instruments/Guitar/VH/GTR_Headstock_VHShark.skin'
		random_weight = 0.0
		$car_rocker_guitars_factoredglobal_103
	}
	{
		desc_id = gtr_headstock_vhfstrat
		frontend_desc = qs(0x08471cee)
		mesh = 'models/CAR_Instruments/Guitar/VH/GTR_Headstock_VHFstrat.skin'
		random_weight = 0.0
		$car_rocker_guitars_factoredglobal_103
	}
	{
		desc_id = gtr_headstock_vhwolf
		frontend_desc = qs(0xce57354f)
		mesh = 'models/CAR_Instruments/Guitar/VH/GTR_Headstock_VHWolf.skin'
		random_weight = 0.0
		$car_rocker_guitars_factoredglobal_103
	}
	{
		desc_id = gtr_headstock_vhbwolf
		frontend_desc = qs(0x2f7b7ca1)
		mesh = 'models/CAR_Instruments/Guitar/VH/GTR_Headstock_VHBWolf.skin'
		random_weight = 0.0
		$car_rocker_guitars_factoredglobal_103
	}
	{
		desc_id = gtr_headstock_vhswolf
		frontend_desc = qs(0x2f7b7ca1)
		mesh = 'models/CAR_Instruments/Guitar/VH/GTR_Headstock_VHSWolf.skin'
		random_weight = 0.0
		$car_rocker_guitars_factoredglobal_103
	}
	{
		desc_id = gtr_headstock_vhdlr
		frontend_desc = qs(0x2b4533bc)
		mesh = 'models/CAR_Instruments/Guitar/VH/GTR_Headstock_VHDLR.skin'
		random_weight = 0.0
		$car_rocker_guitars_factoredglobal_103
	}
	{
		desc_id = guitar_head01
		frontend_desc = qs(0xc3c44704)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_Head01.skin'
		materials = [
			guitar_head_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock01_D_01.dds'
				material = guitar_head_headstock
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_headstk_01
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock01_D_01.dds'
				material = guitar_head_headstock
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_headstk_01_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock01_D_01.dds'
				material = guitar_head_headstock
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_179
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock01_D_01.dds'
				material = guitar_head_headstock
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_179
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock01_D_01.dds'
				material = guitar_head_headstock
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_179
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock01_D_01.dds'
				material = guitar_head_headstock
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_179
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock01_D_01.dds'
				material = guitar_head_headstock
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_179
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock01_D_01.dds'
				material = guitar_head_headstock
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_179
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock01_D_01.dds'
				material = guitar_head_headstock
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_179
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock01_D_01.dds'
				material = guitar_head_headstock
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_179
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock01_D_01.dds'
				material = guitar_head_headstock
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_179
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock01_D_01.dds'
				material = guitar_head_headstock
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_179
			}
		]
	}
	{
		desc_id = guitar_head02
		frontend_desc = qs(0xb2977378)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_Head02.skin'
		materials = [
			headstock2_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock02_d_01.dds'
				material = headstock2_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_headstk_02
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock02_D_01.dds'
				material = headstock2_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_headstk_02_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock02_D_01.dds'
				material = headstock2_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock02_D_01.dds'
				material = headstock2_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock02_D_01.dds'
				material = headstock2_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock02_D_01.dds'
				material = headstock2_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock02_D_01.dds'
				material = headstock2_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock02_D_01.dds'
				material = headstock2_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock02_D_01.dds'
				material = headstock2_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock02_D_01.dds'
				material = headstock2_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock02_D_01.dds'
				material = headstock2_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock02_D_01.dds'
				material = headstock2_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_182
			}
		]
	}
	{
		desc_id = guitar_head03
		frontend_desc = qs(0x1ec2b205)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_Head03.skin'
		materials = [
			guitar_head_03_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock03_d_01.dds'
				material = guitar_head_03_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_headstk_03
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock03_D_01.dds'
				material = guitar_head_03_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_headstk_03_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock03_D_01.dds'
				material = guitar_head_03_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock03_D_01.dds'
				material = guitar_head_03_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock03_D_01.dds'
				material = guitar_head_03_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock03_D_01.dds'
				material = guitar_head_03_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock03_D_01.dds'
				material = guitar_head_03_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock03_D_01.dds'
				material = guitar_head_03_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock03_D_01.dds'
				material = guitar_head_03_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock03_D_01.dds'
				material = guitar_head_03_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock03_D_01.dds'
				material = guitar_head_03_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock03_D_01.dds'
				material = guitar_head_03_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_182
			}
		]
	}
	{
		desc_id = guitar_head04
		frontend_desc = qs(0x1653dd4c)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_Head04.skin'
		materials = [
			guitar_head_04_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock04_d_01.dds'
				material = guitar_head_04_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_headstk_04
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock04_D_01.dds'
				material = guitar_head_04_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_headstk_04_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock04_d_01.dds'
				material = guitar_head_04_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock04_d_01.dds'
				material = guitar_head_04_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock04_d_01.dds'
				material = guitar_head_04_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock04_d_01.dds'
				material = guitar_head_04_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock04_d_01.dds'
				material = guitar_head_04_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock04_d_01.dds'
				material = guitar_head_04_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock04_d_01.dds'
				material = guitar_head_04_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock04_d_01.dds'
				material = guitar_head_04_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock04_d_01.dds'
				material = guitar_head_04_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock04_d_01.dds'
				material = guitar_head_04_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_182
			}
		]
	}
	{
		desc_id = guitar_head05
		frontend_desc = qs(0xfa95e2aa)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_Head05.skin'
		materials = [
			guitar_head_05_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock05_d_01.dds'
				material = guitar_head_05_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_headstk_05
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock05_D_01.dds'
				material = guitar_head_05_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_headstk_05_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock05_d_01.dds'
				material = guitar_head_05_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock05_d_01.dds'
				material = guitar_head_05_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock05_d_01.dds'
				material = guitar_head_05_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock05_d_01.dds'
				material = guitar_head_05_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock05_d_01.dds'
				material = guitar_head_05_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock05_d_01.dds'
				material = guitar_head_05_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock05_d_01.dds'
				material = guitar_head_05_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock05_d_01.dds'
				material = guitar_head_05_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock05_d_01.dds'
				material = guitar_head_05_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock05_d_01.dds'
				material = guitar_head_05_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_182
			}
		]
	}
	{
		desc_id = guitar_head06
		frontend_desc = qs(0x82756d8c)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_Head06.skin'
		materials = [
			guitar_head_06_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock06_d_01.dds'
				material = guitar_head_06_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_headstk_06
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock06_D_01.dds'
				material = guitar_head_06_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_headstk_06_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock06_d_01.dds'
				material = guitar_head_06_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock06_d_01.dds'
				material = guitar_head_06_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock06_d_01.dds'
				material = guitar_head_06_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock06_d_01.dds'
				material = guitar_head_06_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock06_d_01.dds'
				material = guitar_head_06_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock06_d_01.dds'
				material = guitar_head_06_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock06_d_01.dds'
				material = guitar_head_06_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock06_d_01.dds'
				material = guitar_head_06_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock06_d_01.dds'
				material = guitar_head_06_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock06_d_01.dds'
				material = guitar_head_06_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_182
			}
		]
	}
	{
		desc_id = guitar_head07
		frontend_desc = qs(0x348c231b)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_Head07.skin'
		materials = [
			guitar_head_07_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock07_d_01.dds'
				material = guitar_head_07_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_headstk_07
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock07_D_01.dds'
				material = guitar_head_07_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_headstk_07_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock07_D_01.dds'
				material = guitar_head_07_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock07_D_01.dds'
				material = guitar_head_07_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock07_D_01.dds'
				material = guitar_head_07_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock07_D_01.dds'
				material = guitar_head_07_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock07_D_01.dds'
				material = guitar_head_07_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock07_D_01.dds'
				material = guitar_head_07_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock07_D_01.dds'
				material = guitar_head_07_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock07_D_01.dds'
				material = guitar_head_07_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock07_D_01.dds'
				material = guitar_head_07_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock07_D_01.dds'
				material = guitar_head_07_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_182
			}
		]
	}
	{
		desc_id = guitar_head08
		frontend_desc = qs(0x1e63b281)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_Head08.skin'
		materials = [
			guitar_head_08_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock08_d_01.dds'
				material = guitar_head_08_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_headstk_08
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock08_D_01.dds'
				material = guitar_head_08_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_headstk_08_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock08_D_01.dds'
				material = guitar_head_08_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock08_D_01.dds'
				material = guitar_head_08_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock08_D_01.dds'
				material = guitar_head_08_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock08_D_01.dds'
				material = guitar_head_08_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock08_D_01.dds'
				material = guitar_head_08_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock08_D_01.dds'
				material = guitar_head_08_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock08_D_01.dds'
				material = guitar_head_08_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock08_D_01.dds'
				material = guitar_head_08_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock08_D_01.dds'
				material = guitar_head_08_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock08_D_01.dds'
				material = guitar_head_08_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_182
			}
		]
	}
	{
		desc_id = guitar_head09
		frontend_desc = qs(0xb5276264)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_Head09.skin'
		materials = [
			guitar_head_09_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock09_d_01.dds'
				material = guitar_head_09_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_headstk_09
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock09_D_01.dds'
				material = guitar_head_09_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_headstk_09_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock09_D_01.dds'
				material = guitar_head_09_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock09_D_01.dds'
				material = guitar_head_09_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock09_D_01.dds'
				material = guitar_head_09_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock09_D_01.dds'
				material = guitar_head_09_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock09_D_01.dds'
				material = guitar_head_09_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock09_D_01.dds'
				material = guitar_head_09_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock09_D_01.dds'
				material = guitar_head_09_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock09_D_01.dds'
				material = guitar_head_09_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock09_D_01.dds'
				material = guitar_head_09_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock09_D_01.dds'
				material = guitar_head_09_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_182
			}
		]
	}
	{
		desc_id = guitar_head11
		frontend_desc = qs(0x4c54a7e0)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_Head11.skin'
		materials = [
			guitar_head_11_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock11_d_01.dds'
				material = guitar_head_11_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_headstk_11
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock11_D_01.dds'
				material = guitar_head_11_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_headstk_11_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock11_d_01.dds'
				material = guitar_head_11_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock11_d_01.dds'
				material = guitar_head_11_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock11_d_01.dds'
				material = guitar_head_11_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock11_d_01.dds'
				material = guitar_head_11_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock11_d_01.dds'
				material = guitar_head_11_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock11_d_01.dds'
				material = guitar_head_11_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock11_d_01.dds'
				material = guitar_head_11_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock11_d_01.dds'
				material = guitar_head_11_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock11_d_01.dds'
				material = guitar_head_11_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock11_d_01.dds'
				material = guitar_head_11_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_182
			}
		]
	}
	{
		desc_id = guitar_head12
		frontend_desc = qs(0xb06f531a)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_Head12.skin'
		materials = [
			guitar_head_12_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock12_d_01.dds'
				material = guitar_head_12_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_headstk_12
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock12_D_01.dds'
				material = guitar_head_12_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_headstk_12_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock12_d_01.dds'
				material = guitar_head_12_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock12_d_01.dds'
				material = guitar_head_12_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock12_d_01.dds'
				material = guitar_head_12_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock12_d_01.dds'
				material = guitar_head_12_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock12_d_01.dds'
				material = guitar_head_12_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock12_d_01.dds'
				material = guitar_head_12_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock12_d_01.dds'
				material = guitar_head_12_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock12_d_01.dds'
				material = guitar_head_12_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock12_d_01.dds'
				material = guitar_head_12_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock12_d_01.dds'
				material = guitar_head_12_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_182
			}
		]
	}
	{
		desc_id = guitar_head13
		frontend_desc = qs(0xf9e1a069)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_Head13.skin'
		materials = [
			guitar_head_13_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock13_d_01.dds'
				material = guitar_head_13_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_headstk_13
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock13_D_01.dds'
				material = guitar_head_13_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_headstk_13_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock13_D_01.dds'
				material = guitar_head_13_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock13_D_01.dds'
				material = guitar_head_13_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock13_D_01.dds'
				material = guitar_head_13_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock13_D_01.dds'
				material = guitar_head_13_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock13_D_01.dds'
				material = guitar_head_13_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock13_D_01.dds'
				material = guitar_head_13_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock13_D_01.dds'
				material = guitar_head_13_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock13_D_01.dds'
				material = guitar_head_13_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock13_D_01.dds'
				material = guitar_head_13_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock13_D_01.dds'
				material = guitar_head_13_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_182
			}
		]
	}
	{
		desc_id = guitar_head14
		frontend_desc = qs(0x139ee529)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_Head14.skin'
		materials = [
			guitar_head_14_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock14_d_01.dds'
				material = guitar_head_14_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_headstk_14
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock14_D_01.dds'
				material = guitar_head_14_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_headstk_14_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock14_D_01.dds'
				material = guitar_head_14_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock14_D_01.dds'
				material = guitar_head_14_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock14_D_01.dds'
				material = guitar_head_14_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock14_D_01.dds'
				material = guitar_head_14_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock14_D_01.dds'
				material = guitar_head_14_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock14_D_01.dds'
				material = guitar_head_14_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock14_D_01.dds'
				material = guitar_head_14_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock14_D_01.dds'
				material = guitar_head_14_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock14_D_01.dds'
				material = guitar_head_14_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock14_D_01.dds'
				material = guitar_head_14_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_182
			}
		]
	}
	{
		desc_id = guitar_head15
		frontend_desc = qs(0x27c9995e)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_Head15.skin'
		materials = [
			guitar_head_15_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock15_d_01.dds'
				material = guitar_head_15_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_headstk_15
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock15_D_01.dds'
				material = guitar_head_15_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_headstk_15_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock15_D_01.dds'
				material = guitar_head_15_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock15_D_01.dds'
				material = guitar_head_15_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock15_D_01.dds'
				material = guitar_head_15_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock15_D_01.dds'
				material = guitar_head_15_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock15_D_01.dds'
				material = guitar_head_15_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock15_D_01.dds'
				material = guitar_head_15_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock15_D_01.dds'
				material = guitar_head_15_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock15_D_01.dds'
				material = guitar_head_15_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock15_D_01.dds'
				material = guitar_head_15_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock15_D_01.dds'
				material = guitar_head_15_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_182
			}
		]
	}
	{
		desc_id = guitar_head16
		frontend_desc = qs(0xa9624079)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_Head16.skin'
		materials = [
			guitar_head_16_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_hstock01_d_mls.dds'
				material = guitar_head_16_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_headstk_16
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_hstock01_d_mls.dds'
				material = guitar_head_16_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_headstk_16_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_hstock01_d_mls.dds'
				material = guitar_head_16_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_hstock01_d_mls.dds'
				material = guitar_head_16_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_hstock01_d_mls.dds'
				material = guitar_head_16_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_hstock01_d_mls.dds'
				material = guitar_head_16_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_hstock01_d_mls.dds'
				material = guitar_head_16_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_hstock01_d_mls.dds'
				material = guitar_head_16_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_hstock01_d_mls.dds'
				material = guitar_head_16_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_hstock01_d_mls.dds'
				material = guitar_head_16_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_hstock01_d_mls.dds'
				material = guitar_head_16_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_hstock01_d_mls.dds'
				material = guitar_head_16_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_182
			}
		]
	}
	{
		desc_id = guitar_head20
		frontend_desc = qs(0x8836da6a)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_Head20.skin'
		materials = [
			guitar_head_20_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock20_d_01.dds'
				material = guitar_head_20_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_headstk_20
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock20_D_01.dds'
				material = guitar_head_20_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_headstk_20_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock20_d_01.dds'
				material = guitar_head_20_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock20_d_01.dds'
				material = guitar_head_20_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock20_d_01.dds'
				material = guitar_head_20_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock20_d_01.dds'
				material = guitar_head_20_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock20_d_01.dds'
				material = guitar_head_20_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock20_d_01.dds'
				material = guitar_head_20_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock20_d_01.dds'
				material = guitar_head_20_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock20_d_01.dds'
				material = guitar_head_20_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock20_d_01.dds'
				material = guitar_head_20_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock20_d_01.dds'
				material = guitar_head_20_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_182
			}
		]
	}
	{
		desc_id = guitar_head31
		frontend_desc = qs(0x01cd8bf5)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_Head31.skin'
		materials = [
			guitar_head_31_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock_d_31.dds'
				material = guitar_head_31_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_headstk_31
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock_d_31.dds'
				material = guitar_head_31_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_headstk_31_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock_d_31.dds'
				material = guitar_head_31_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock_d_31.dds'
				material = guitar_head_31_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock_d_31.dds'
				material = guitar_head_31_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock_d_31.dds'
				material = guitar_head_31_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock_d_31.dds'
				material = guitar_head_31_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock_d_31.dds'
				material = guitar_head_31_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock_d_31.dds'
				material = guitar_head_31_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock_d_31.dds'
				material = guitar_head_31_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock_d_31.dds'
				material = guitar_head_31_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock_d_31.dds'
				material = guitar_head_31_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_182
			}
		]
	}
	{
		desc_id = guitar_head99
		frontend_desc = qs(0x2a4aac1d)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_Head_99.skin'
		materials = [
			guitar_head_99_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock099.dds'
				material = guitar_head_99_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_headstk_99
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock099.dds'
				material = guitar_head_99_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_headstk_99_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock099.dds'
				material = guitar_head_99_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock099.dds'
				material = guitar_head_99_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock099.dds'
				material = guitar_head_99_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock099.dds'
				material = guitar_head_99_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock099.dds'
				material = guitar_head_99_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock099.dds'
				material = guitar_head_99_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock099.dds'
				material = guitar_head_99_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock099.dds'
				material = guitar_head_99_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock099.dds'
				material = guitar_head_99_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock099.dds'
				material = guitar_head_99_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_182
			}
		]
	}
	{
		desc_id = guitar_head_x_01
		frontend_desc = qs(0x0d947495)
		mesh = 'models/CAR_Instruments/Guitar/Headstock_X_Hand_01.skin'
		materials = [
			headstock_x_hand_01_hardware
		]
		price = 665
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_01.dds'
				material = headstock_x_hand_01_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_x_headstk_01
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_01.dds'
				material = headstock_x_hand_01_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_x_headstk_01_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_01.dds'
				material = headstock_x_hand_01_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_01.dds'
				material = headstock_x_hand_01_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_01.dds'
				material = headstock_x_hand_01_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_01.dds'
				material = headstock_x_hand_01_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_01.dds'
				material = headstock_x_hand_01_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_01.dds'
				material = headstock_x_hand_01_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_01.dds'
				material = headstock_x_hand_01_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_01.dds'
				material = headstock_x_hand_01_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_01.dds'
				material = headstock_x_hand_01_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_01.dds'
				material = headstock_x_hand_01_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_182
			}
		]
	}
	{
		desc_id = headstock_x_arrow_02
		frontend_desc = qs(0xf453ec99)
		price = 500
		mesh = 'models/CAR_Instruments/Guitar/Headstock_X_Arrow_02.skin'
		materials = [
			headstock_x_arrow_02_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock2_d_01.dds'
				material = headstock_x_arrow_02_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_x_headstk_02
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock2_d_01.dds'
				material = headstock_x_arrow_02_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_x_headstk_02_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock2_d_01.dds'
				material = headstock_x_arrow_02_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock2_d_01.dds'
				material = headstock_x_arrow_02_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock2_d_01.dds'
				material = headstock_x_arrow_02_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock2_d_01.dds'
				material = headstock_x_arrow_02_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock2_d_01.dds'
				material = headstock_x_arrow_02_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock2_d_01.dds'
				material = headstock_x_arrow_02_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock2_d_01.dds'
				material = headstock_x_arrow_02_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock2_d_01.dds'
				material = headstock_x_arrow_02_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock2_d_01.dds'
				material = headstock_x_arrow_02_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock2_d_01.dds'
				material = headstock_x_arrow_02_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_182
			}
		]
	}
	{
		desc_id = guitar_head_x_03
		frontend_desc = qs(0x37cd98fc)
		mesh = 'models/CAR_Instruments/Guitar/Headstock_X_bomb_03.skin'
		price = 1000
		materials = [
			headstock_x_bomb_03_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_03.dds'
				material = headstock_x_bomb_03_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_x_headstk_03
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_03.dds'
				material = headstock_x_bomb_03_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_x_headstk_03_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_03.dds'
				material = headstock_x_bomb_03_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_03.dds'
				material = headstock_x_bomb_03_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_03.dds'
				material = headstock_x_bomb_03_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_03.dds'
				material = headstock_x_bomb_03_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_03.dds'
				material = headstock_x_bomb_03_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_03.dds'
				material = headstock_x_bomb_03_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_03.dds'
				material = headstock_x_bomb_03_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_03.dds'
				material = headstock_x_bomb_03_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_03.dds'
				material = headstock_x_bomb_03_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_03.dds'
				material = headstock_x_bomb_03_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_182
			}
		]
	}
	{
		desc_id = headstock_x_handle_05
		frontend_desc = qs(0xa6c08bf0)
		price = 500
		mesh = 'models/CAR_Instruments/Guitar/Headstock_X_Handle_05.skin'
		materials = [
			headstock_x_handle_05_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_05.dds'
				material = headstock_x_handle_05_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_x_headstk_05
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_05.dds'
				material = headstock_x_handle_05_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_x_headstk_05_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_05.dds'
				material = headstock_x_handle_05_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_05.dds'
				material = headstock_x_handle_05_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_05.dds'
				material = headstock_x_handle_05_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_05.dds'
				material = headstock_x_handle_05_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_05.dds'
				material = headstock_x_handle_05_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_05.dds'
				material = headstock_x_handle_05_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_05.dds'
				material = headstock_x_handle_05_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_05.dds'
				material = headstock_x_handle_05_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_05.dds'
				material = headstock_x_handle_05_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_05.dds'
				material = headstock_x_handle_05_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_182
			}
		]
	}
	{
		desc_id = headstock_x_feather_06
		frontend_desc = qs(0x721f3555)
		price = 300
		mesh = 'models/CAR_Instruments/Guitar/Headstock_X_Feather_06.skin'
		materials = [
			headstock_x_feather_06_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_06.dds'
				material = headstock_x_feather_06_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_x_headstk_06
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_06.dds'
				material = headstock_x_feather_06_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_x_headstk_06_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_06.dds'
				material = headstock_x_feather_06_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_06.dds'
				material = headstock_x_feather_06_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_06.dds'
				material = headstock_x_feather_06_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_06.dds'
				material = headstock_x_feather_06_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_06.dds'
				material = headstock_x_feather_06_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_06.dds'
				material = headstock_x_feather_06_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_06.dds'
				material = headstock_x_feather_06_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_06.dds'
				material = headstock_x_feather_06_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_06.dds'
				material = headstock_x_feather_06_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_06.dds'
				material = headstock_x_feather_06_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_182
			}
		]
	}
	{
		desc_id = headstock_x_cents_07
		frontend_desc = qs(0xa3e5da1e)
		mesh = 'models/CAR_Instruments/Guitar/Headstock_X_Cents_07.skin'
		price = 500
		materials = [
			headstock_x_cents_07_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_07.dds'
				material = headstock_x_cents_07_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_x_headstk_07
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_07.dds'
				material = headstock_x_cents_07_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_x_headstk_07_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_07.dds'
				material = headstock_x_cents_07_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_07.dds'
				material = headstock_x_cents_07_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_07.dds'
				material = headstock_x_cents_07_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_07.dds'
				material = headstock_x_cents_07_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_07.dds'
				material = headstock_x_cents_07_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_07.dds'
				material = headstock_x_cents_07_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_07.dds'
				material = headstock_x_cents_07_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_07.dds'
				material = headstock_x_cents_07_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_07.dds'
				material = headstock_x_cents_07_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_07.dds'
				material = headstock_x_cents_07_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_182
			}
		]
	}
	{
		desc_id = headstock_x_flame_08
		frontend_desc = qs(0x6d764c49)
		price = 450
		mesh = 'models/CAR_Instruments/Guitar/Headstock_X_Flame_08.skin'
		materials = [
			headstock_x_flame_08_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_08.dds'
				material = headstock_x_flame_08_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_x_headstk_08
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_08.dds'
				material = headstock_x_flame_08_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_x_headstk_08_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_08.dds'
				material = headstock_x_flame_08_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_08.dds'
				material = headstock_x_flame_08_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_08.dds'
				material = headstock_x_flame_08_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_08.dds'
				material = headstock_x_flame_08_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_08.dds'
				material = headstock_x_flame_08_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_08.dds'
				material = headstock_x_flame_08_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_08.dds'
				material = headstock_x_flame_08_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_08.dds'
				material = headstock_x_flame_08_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_08.dds'
				material = headstock_x_flame_08_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_08.dds'
				material = headstock_x_flame_08_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_182
			}
		]
	}
	{
		desc_id = headstock_x_tip_10
		frontend_desc = qs(0xde36c8bc)
		price = 750
		mesh = 'models/CAR_Instruments/Guitar/Headstock_X_Tip_10.skin'
		materials = [
			headstock_x_tip_10_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_10.dds'
				material = headstock_x_tip_10_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_x_headstk_10
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_10.dds'
				material = headstock_x_tip_10_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_x_headstk_10_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_10.dds'
				material = headstock_x_tip_10_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_10.dds'
				material = headstock_x_tip_10_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_10.dds'
				material = headstock_x_tip_10_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_10.dds'
				material = headstock_x_tip_10_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_18
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_10.dds'
				material = headstock_x_tip_10_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_19
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_10.dds'
				material = headstock_x_tip_10_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_10.dds'
				material = headstock_x_tip_10_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_21
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_10.dds'
				material = headstock_x_tip_10_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_22
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_10.dds'
				material = headstock_x_tip_10_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
				$car_rocker_guitars_factoredglobal_182
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_10.dds'
				material = headstock_x_tip_10_primary
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_24
				$car_rocker_guitars_factoredglobal_182
			}
		]
	}
]
car_rocker_guitars_factoredglobal_0 = {
	diffuse
	pre_userlayer
}
car_rocker_guitars_factoredglobal_3 = {
	locked
}
car_rocker_guitars_factoredglobal_13 = {
	userlayer
	diffuse
}
car_rocker_guitars_factoredglobal_14 = {
	desc_id = car_vanhalen
	frontend_desc = qs(0xc2433b19)
	mask = $car_vanhalen
}
car_rocker_guitars_factoredglobal_15 = {
	initial_values = {
		x_trans = -26
		y_trans = 29
		y_scale = 40
		x_scale = 21
	}
}
car_rocker_guitars_factoredglobal_16 = {
	desc_id = car_primitives
	frontend_desc = qs(0x7dc468d3)
	mask = $car_basic_primitives_1
}
car_rocker_guitars_factoredglobal_17 = {
	desc_id = car_outlines_primitives
	frontend_desc = qs(0x955f1285)
	mask = $car_basic_primitives_2
}
car_rocker_guitars_factoredglobal_18 = {
	desc_id = car_tattoo_decal
	frontend_desc = qs(0x80142024)
	mask = $car_gradiant_shapes
}
car_rocker_guitars_factoredglobal_19 = {
	desc_id = car_icon_decals
	frontend_desc = qs(0xcd9be7cd)
	mask = $car_icons
}
car_rocker_guitars_factoredglobal_20 = {
	desc_id = car_graphics
	frontend_desc = qs(0xde6cb37a)
	mask = $car_graphics
}
car_rocker_guitars_factoredglobal_21 = {
	desc_id = `font a1`
	frontend_desc = qs(0x6afbb555)
	mask = $car_fontgrid_title_a1
}
car_rocker_guitars_factoredglobal_22 = {
	desc_id = `font a3`
	frontend_desc = qs(0x41d6e696)
	mask = $car_fontgrid_text_a3
}
car_rocker_guitars_factoredglobal_23 = {
	desc_id = `font a6`
	frontend_desc = qs(0x58cdd7d7)
	mask = $car_text_a1
}
car_rocker_guitars_factoredglobal_24 = {
	desc_id = `font a8`
	frontend_desc = qs(0x178c4110)
	mask = $car_fontgrid_text_3
}
car_rocker_guitars_factoredglobal_27 = {
	initial_values = {
		x_trans = -24
		x_scale = 21
		y_scale = 40
		y_trans = 25
	}
}
car_rocker_guitars_factoredglobal_30 = {
	initial_values = {
		y_trans = 25
		x_scale = 21
		y_scale = 40
		x_trans = -20
	}
}
car_rocker_guitars_factoredglobal_33 = {
	initial_values = {
		x_trans = -32
		x_scale = 21
		y_scale = 40
		y_trans = 20
	}
}
car_rocker_guitars_factoredglobal_40 = {
	initial_values = {
		x_trans = -28
		x_scale = 21
		y_scale = 40
		y_trans = 21
	}
}
car_rocker_guitars_factoredglobal_43 = {
	initial_values = {
		y_trans = 21
		x_scale = 21
		y_scale = 40
		x_trans = -22
	}
}
car_rocker_guitars_factoredglobal_48 = {
	initial_values = {
		y_trans = 21
		x_scale = 21
		y_scale = 45
		x_trans = -30
	}
}
car_rocker_guitars_factoredglobal_51 = {
	initial_values = {
		x_trans = -34
		x_scale = 16
		y_scale = 40
		y_trans = 11
	}
}
car_rocker_guitars_factoredglobal_60 = {
	initial_values = {
		x_trans = -10
		x_scale = 21
		y_scale = 45
		y_trans = 3
	}
}
car_rocker_guitars_factoredglobal_67 = {
	initial_values = {
		y_trans = 4
		x_scale = 16
		y_scale = 45
		x_trans = -12
	}
}
car_rocker_guitars_factoredglobal_68 = {
	desc_id = finishes
	frontend_desc = qs(0x3f47b13d)
	mask = $cag_x_guitar_clear
}
car_rocker_guitars_factoredglobal_71 = {
	initial_values = {
		x_trans = -17
		y_trans = 22
		x_scale = 31
		y_scale = 55
	}
}
car_rocker_guitars_factoredglobal_76 = {
	initial_values = {
		y_trans = 9
		x_scale = 16
		y_scale = 35
		x_trans = -30
	}
}
car_rocker_guitars_factoredglobal_79 = {
	initial_values = {
		x_trans = -13
		y_trans = 1
		x_scale = 16
		y_scale = 30
	}
}
car_rocker_guitars_factoredglobal_82 = {
	initial_values = {
		y_trans = 29
		x_scale = 16
		y_scale = 30
		x_trans = -14
	}
}
car_rocker_guitars_factoredglobal_85 = {
	initial_values = {
		x_trans = -12
		x_scale = 16
		y_scale = 30
		y_trans = -1
	}
}
car_rocker_guitars_factoredglobal_88 = {
	initial_values = {
		x_trans = -28
		y_trans = 25
		x_scale = 26
		y_scale = 40
	}
}
car_rocker_guitars_factoredglobal_91 = {
	initial_values = {
		y_trans = 2
		x_scale = 15
		y_scale = 30
		flags = 3
		x_trans = -39
	}
}
car_rocker_guitars_factoredglobal_94 = {
	initial_values = {
		x_trans = -5
		x_scale = 15
		y_scale = 35
		y_trans = 20
	}
}
car_rocker_guitars_factoredglobal_97 = {
	initial_values = {
		x_trans = -23
		x_scale = 15
		y_scale = 35
		y_trans = 31
	}
}
car_rocker_guitars_factoredglobal_100 = {
	initial_values = {
		x_trans = -8
		x_scale = 15
		y_scale = 20
		flags = 3
		y_trans = 26
	}
}
car_rocker_guitars_factoredglobal_103 = {
	hidden
}
car_rocker_guitars_factoredglobal_149 = {
	desc_id = finishes
	frontend_desc = qs(0x6e23fd31)
	mask = $cag_gtr16_pickgrd01
}
car_rocker_guitars_factoredglobal_174 = {
	desc_id = finishes
	frontend_desc = qs(0xb0072c1a)
	mask = $cag_neck_01
}
car_rocker_guitars_factoredglobal_175 = {
	initial_values = {
		color = grey_1
	}
}
car_rocker_guitars_factoredglobal_176 = {
	diffuse
}
car_rocker_guitars_factoredglobal_179 = {
	initial_values = {
		x_trans = -25
		y_trans = 6
		x_scale = 21
		y_scale = 55
	}
}
car_rocker_guitars_factoredglobal_182 = {
	initial_values = {
		x_trans = -25
		x_scale = 26
		y_scale = 55
		y_trans = 2
	}
}
