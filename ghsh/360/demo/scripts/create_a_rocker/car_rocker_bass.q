cas_bass_body = [
	{
		desc_id = cab_body_bb3a
		frontend_desc = qs(0x3cc2b304)
		mesh = 'models/CAR_Instruments/Bass/CAB_Body_BB3A.skin'
		pak_num = 1
		sections = [
			{
				material = cab_body_bb3a_primary
				base_tex = 'tex\\models\\CAR_Instruments\\Bass\\cab_bodywood_b3a_e_mls.dds'
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_body_bb3a_finishes
			}
			{
				material = cab_body_bb3a_primary
				base_tex = 'tex\\models\\CAR_Instruments\\Bass\\cab_bodywood_b3a_e_mls.dds'
				$car_rocker_bass_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cab_body_bb3a_details
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Bodywood_b3a_e_mls.dds'
				material = cab_body_bb3a_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_4
				$car_rocker_bass_factoredglobal_5
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Bodywood_b3a_e_mls.dds'
				material = cab_body_bb3a_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_6
				$car_rocker_bass_factoredglobal_5
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Bodywood_b3a_e_mls.dds'
				material = cab_body_bb3a_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_7
				$car_rocker_bass_factoredglobal_5
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Bodywood_b3a_e_mls.dds'
				material = cab_body_bb3a_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_8
				$car_rocker_bass_factoredglobal_5
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Bodywood_b3a_e_mls.dds'
				material = cab_body_bb3a_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_9
				$car_rocker_bass_factoredglobal_5
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Bodywood_b3a_e_mls.dds'
				material = cab_body_bb3a_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_10
				$car_rocker_bass_factoredglobal_5
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Bodywood_b3a_e_mls.dds'
				material = cab_body_bb3a_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_11
				$car_rocker_bass_factoredglobal_5
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Bodywood_b3a_e_mls.dds'
				material = cab_body_bb3a_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_12
				$car_rocker_bass_factoredglobal_5
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Bodywood_b3a_e_mls.dds'
				material = cab_body_bb3a_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_13
				$car_rocker_bass_factoredglobal_5
			}
		]
		inclusion = [
			{
				part = cas_bass_neck
				valid = [
					cab_neck_bn1a
					cab_neck_bn1b
					cab_neck_bnebony
					cab_neck_bfretlss01
					cab_neck_bfretlss02
					cab_neck_bfretlss03
				]
			}
			{
				part = cas_bass_pickguards
				valid = [
					none
					cab_pickg_f1
					cab_pickg_f2
					cab_pickg_f3
					none
				]
			}
			{
				part = cas_bass_pickups
				valid = [
					cab_pickups_emg01
					cab_pickups_emg02
					cab_pickups_emg03
					cab_pickup_hack03
					cab_pickup_hack02
					cab_pickup_hack01
					cab_pickups_bp1a
					cab_pickups_bp1a2
					cab_pickups_bp1a3
					cab_jbass_pickup_01
					cab_jp_pickup_b
					cab_pbass_pickup_a
					cab_jp_pickup_a
					cab_bumbl_pickup_a1
					cab_bumbl_pickup_a2
					cab_bumbl_pickup_a3
					cab_hbuck_pickup_a1
					cab_hbuck_pickup_a2
					cab_hbuck_pickup_a3
				]
			}
			{
				part = cas_bass_knobs
				valid = [
					cab_knob_hack01
					cab_knob_hack02
					cab_knob_hack03
					cab_knob_hack04
					cab_knob_hack05
					cab_knob_hack06
					cab_knob_hack07
					cab_knob_hack08
					cab_knob_hack09
					cab_knob_hack10
				]
			}
			{
				part = cas_bass_bridges
				valid = [
					cab_bridge_bb2a
					cab_bridge_bb1a
					cab_bridge_bb3a
					cab_bridge_mls
					cab_bridge_hack
				]
			}
			{
				part = cas_bass_head
				valid = [
					cab_head_guppy
					cab_head_predikt
					cab_head_skull
					cab_head_radex
					cab_head_flay_rev
					cab_head_mnemonic
					cab_head_foots01
					cab_head_bh5a
					cab_head_bhphnq01
					cab_head_mlsplit
					cab_head_grumbel01
					cab_head_bh4a
					cab_head_bh6a
					cab_head_bh6b
					cab_head_bh7a
					cab_head_bh1a
					cab_head_sixtease
					cab_head_foots01
				]
			}
		]
	}
]
cas_bass_neck = [
	{
		desc_id = cab_neck_bn1b
		frontend_desc = qs(0x0f9d656e)
		mesh = 'models/CAR_Instruments/bass/CAB_Neck_BN1B.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_neck_01b_rosewood_d_mls.dds'
				material = cab_neck_bn1b_neck
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_neck_01_finishes
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/cab_neck_01b_rosewood_d_mls.dds`
				material = cab_neck_bn1b_neck
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/cab_nek_lyrmpl_blk_wht.img`
						flags = 4
					}
				]
				diffuse
			}
		]
	}
]
cas_bass_pickguards = [
	{
		desc_id = cab_pickg_f3
		frontend_desc = qs(0x0786e899)
		mesh = 'models/CAR_Instruments/bass/CAB_PickG_F1.skin'
		random_weight = 5.0
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_pickg_f1_d_mls.dds'
				material = cab_pickg_f1_primary
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_hack_pgrd01
			}
		]
	}
]
cas_bass_pickups = [
	{
		desc_id = cab_pickup_hack02
		frontend_desc = qs(0x98f69ecd)
		mesh = 'models/CAR_Instruments/Bass/CAB_pickup_Hack02.skin'
	}
]
cas_bass_knobs = [
	{
		desc_id = cab_knob_hack01
		frontend_desc = qs(0xaf972615)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Hack01.skin'
		materials = [
			cab_knobs_hack001_primary
		]
	}
]
cas_bass_bridges = [
	{
		desc_id = cab_bridge_hack
		frontend_desc = qs(0x5a1a5daa)
		mesh = 'models/CAR_Instruments/bass/CAB_Bridge_Hack.skin'
		materials = [
			cab_bridge_hack_primary
		]
	}
]
cas_bass_head = [
	{
		desc_id = cab_head_bh7a
		frontend_desc = qs(0x3cc2b304)
		mesh = 'models/CAR_Instruments/bass/CAB_Head_BH7A.skin'
		materials = [
			cab_head_bh7a_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_bh7a.dds'
				material = cab_head_bh7a_primary
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_head_05_finishes
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_bh7a.dds'
				material = cab_head_bh7a_primary
				$car_rocker_bass_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cab_head_05_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_bh7a.dds'
				material = cab_head_bh7a_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_4
				$car_rocker_bass_factoredglobal_19
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_bh7a.dds'
				material = cab_head_bh7a_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_6
				$car_rocker_bass_factoredglobal_19
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_bh7a.dds'
				material = cab_head_bh7a_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_7
				$car_rocker_bass_factoredglobal_19
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_bh7a.dds'
				material = cab_head_bh7a_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_8
				$car_rocker_bass_factoredglobal_19
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_bh7a.dds'
				material = cab_head_bh7a_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_9
				$car_rocker_bass_factoredglobal_19
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_bh7a.dds'
				material = cab_head_bh7a_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_10
				$car_rocker_bass_factoredglobal_19
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_bh7a.dds'
				material = cab_head_bh7a_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_11
				$car_rocker_bass_factoredglobal_19
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_bh7a.dds'
				material = cab_head_bh7a_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_12
				$car_rocker_bass_factoredglobal_19
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_bh7a.dds'
				material = cab_head_bh7a_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_13
				$car_rocker_bass_factoredglobal_19
			}
		]
	}
]
car_rocker_bass_factoredglobal_0 = {
	pre_userlayer
	diffuse
}
car_rocker_bass_factoredglobal_3 = {
	userlayer
	diffuse
}
car_rocker_bass_factoredglobal_4 = {
	desc_id = car_primitives
	frontend_desc = qs(0x7dc468d3)
	mask = $car_basic_primitives_1
}
car_rocker_bass_factoredglobal_5 = {
	initial_values = {
		x_trans = -23
		y_trans = -15
		x_scale = 30
		y_scale = 60
	}
}
car_rocker_bass_factoredglobal_6 = {
	desc_id = car_outlines_primitives
	frontend_desc = qs(0x955f1285)
	mask = $car_basic_primitives_2
}
car_rocker_bass_factoredglobal_7 = {
	desc_id = car_tattoo_decal
	frontend_desc = qs(0x80142024)
	mask = $car_gradiant_shapes
}
car_rocker_bass_factoredglobal_8 = {
	desc_id = car_icon_decals
	frontend_desc = qs(0xcd9be7cd)
	mask = $car_icons
}
car_rocker_bass_factoredglobal_9 = {
	desc_id = car_graphics
	frontend_desc = qs(0xde6cb37a)
	mask = $car_graphics
}
car_rocker_bass_factoredglobal_10 = {
	desc_id = car_sponsors
	frontend_desc = qs(0xc26f9911)
	mask = $car_sponsors
}
car_rocker_bass_factoredglobal_11 = {
	desc_id = `font a1`
	frontend_desc = qs(0x272e6e53)
	mask = $car_fontgrid_text_a10
}
car_rocker_bass_factoredglobal_12 = {
	desc_id = `font a6`
	frontend_desc = qs(0x0c033d90)
	mask = $car_fontgrid_bordello
}
car_rocker_bass_factoredglobal_13 = {
	desc_id = `font a8`
	frontend_desc = qs(0x15180cd1)
	mask = $car_fontgrid_denim_title
}
car_rocker_bass_factoredglobal_19 = {
	initial_values = {
		y_trans = -5
		x_scale = 20
		y_scale = 45
		flags = 3
		x_trans = -28
	}
}
