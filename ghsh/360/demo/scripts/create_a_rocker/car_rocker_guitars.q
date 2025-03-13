cas_guitar_body = [
	{
		desc_id = guitar_body04
		frontend_desc = qs(0x285773ba)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_Body04.skin'
		pak_num = 0
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_Body_style4_d_01.dds'
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
				$car_rocker_guitars_factoredglobal_3
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style4_D_01.dds'
				material = guitar_body_style_04_primary
				$car_rocker_guitars_factoredglobal_3
				$car_rocker_guitars_factoredglobal_6
				$car_rocker_guitars_factoredglobal_5
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style4_D_01.dds'
				material = guitar_body_style_04_primary
				$car_rocker_guitars_factoredglobal_3
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_5
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style4_D_01.dds'
				material = guitar_body_style_04_primary
				$car_rocker_guitars_factoredglobal_3
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_5
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style4_D_01.dds'
				material = guitar_body_style_04_primary
				$car_rocker_guitars_factoredglobal_3
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_5
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style4_D_01.dds'
				material = guitar_body_style_04_primary
				$car_rocker_guitars_factoredglobal_3
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_5
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style4_D_01.dds'
				material = guitar_body_style_04_primary
				$car_rocker_guitars_factoredglobal_3
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_5
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style4_D_01.dds'
				material = guitar_body_style_04_primary
				$car_rocker_guitars_factoredglobal_3
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_5
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style4_D_01.dds'
				material = guitar_body_style_04_primary
				$car_rocker_guitars_factoredglobal_3
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_5
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
					gtr_pickup_type6_tkd_03
					gtr_pickup_type6_tkd_02
					gtr_pickup_type6_tkd_01
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
]
cas_guitar_pickguards = [
	{
		desc_id = gtr_body4_pickg01
		frontend_desc = qs(0x560739fc)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Body4_PickG01.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/pickgrd_Body4_d_01.dds'
				material = pckgrd_body4_01_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr4_pickgrd01
			}
		]
	}
]
cas_guitar_pickups = [
	{
		desc_id = gtr_pickup_type1_blktan_3
		frontend_desc = qs(0xd0909224)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Pickup_Type1_Blktan_3.skin'
		materials = [
			gtr_pickup_type1_blktan_primary
		]
	}
]
cas_guitar_knobs = [
	{
		desc_id = gtr4_knob_type1_04
		frontend_desc = qs(0xe301e646)
		mesh = 'models/CAR_Instruments/Guitar/GTR4_Knob_Type1_04.skin'
		materials = [
			gtr_knob_type1_01_primary
		]
	}
]
cas_guitar_bridges = [
	{
		desc_id = gtr_hardware05
		frontend_desc = qs(0xc7aa208c)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Hardware05.skin'
		materials = [
			gtr_hardware05_primary
		]
	}
]
cas_guitar_head = [
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
				$car_rocker_guitars_factoredglobal_3
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_17
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock05_d_01.dds'
				material = guitar_head_05_primary
				$car_rocker_guitars_factoredglobal_3
				$car_rocker_guitars_factoredglobal_6
				$car_rocker_guitars_factoredglobal_17
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock05_d_01.dds'
				material = guitar_head_05_primary
				$car_rocker_guitars_factoredglobal_3
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_17
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock05_d_01.dds'
				material = guitar_head_05_primary
				$car_rocker_guitars_factoredglobal_3
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_17
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock05_d_01.dds'
				material = guitar_head_05_primary
				$car_rocker_guitars_factoredglobal_3
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_17
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock05_d_01.dds'
				material = guitar_head_05_primary
				$car_rocker_guitars_factoredglobal_3
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_17
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock05_d_01.dds'
				material = guitar_head_05_primary
				$car_rocker_guitars_factoredglobal_3
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_17
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock05_d_01.dds'
				material = guitar_head_05_primary
				$car_rocker_guitars_factoredglobal_3
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_17
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock05_d_01.dds'
				material = guitar_head_05_primary
				$car_rocker_guitars_factoredglobal_3
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_17
			}
		]
	}
]
cas_guitar_neck = [
	{
		desc_id = guitar_neck03
		frontend_desc = qs(0x2028b2db)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_Neck03.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/neck_maple_tb_03.dds'
				material = guitar_neck3_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0xb0072c1a)
				mask = $cag_neck_01
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
				diffuse
			}
		]
	}
]
car_rocker_guitars_factoredglobal_0 = {
	diffuse
	pre_userlayer
}
car_rocker_guitars_factoredglobal_3 = {
	userlayer
	diffuse
}
car_rocker_guitars_factoredglobal_4 = {
	desc_id = car_primitives
	frontend_desc = qs(0x7dc468d3)
	mask = $car_basic_primitives_1
}
car_rocker_guitars_factoredglobal_5 = {
	initial_values = {
		x_trans = -32
		x_scale = 30
		y_scale = 60
		y_trans = 20
	}
}
car_rocker_guitars_factoredglobal_6 = {
	desc_id = car_outlines_primitives
	frontend_desc = qs(0x955f1285)
	mask = $car_basic_primitives_2
}
car_rocker_guitars_factoredglobal_7 = {
	desc_id = car_tattoo_decal
	frontend_desc = qs(0x80142024)
	mask = $car_gradiant_shapes
}
car_rocker_guitars_factoredglobal_8 = {
	desc_id = car_icon_decals
	frontend_desc = qs(0xcd9be7cd)
	mask = $car_icons
}
car_rocker_guitars_factoredglobal_9 = {
	desc_id = car_graphics
	frontend_desc = qs(0xde6cb37a)
	mask = $car_graphics
}
car_rocker_guitars_factoredglobal_10 = {
	desc_id = car_sponsors
	frontend_desc = qs(0xc26f9911)
	mask = $car_sponsors
}
car_rocker_guitars_factoredglobal_11 = {
	desc_id = `font a1`
	frontend_desc = qs(0x272e6e53)
	mask = $car_fontgrid_text_a10
}
car_rocker_guitars_factoredglobal_12 = {
	desc_id = `font a6`
	frontend_desc = qs(0x0c033d90)
	mask = $car_fontgrid_bordello
}
car_rocker_guitars_factoredglobal_13 = {
	desc_id = `font a8`
	frontend_desc = qs(0x15180cd1)
	mask = $car_fontgrid_denim_title
}
car_rocker_guitars_factoredglobal_17 = {
	initial_values = {
		x_trans = -25
		x_scale = 26
		y_scale = 55
		y_trans = 2
	}
}
