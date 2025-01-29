cas_bass_body = [
	{
		desc_id = cab_body_b2a
		frontend_desc = qs(0x482450b9)
		mesh = 'models/CAR_Instruments/Bass/CAB_Body_B2A.skin'
		pak_num = 0
		sections = [
			{
				material = cab_body_arcos_primary
				base_tex = 'tex\\models\\CAR_Instruments\\Bass\\cab_body_b1a_d_mls.dds'
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_body_b2a_finishes
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\Bass\\cab_body_b1a_d_mls.dds'
				material = cab_body_arcos_primary
				$car_rocker_bass_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cab_body_b2a_details
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\Bass\\cab_body_b1a_d_mls.dds'
				material = cab_body_arcos_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_4
				$car_rocker_bass_factoredglobal_5
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\Bass\\cab_body_b1a_d_mls.dds'
				material = cab_body_arcos_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_6
				$car_rocker_bass_factoredglobal_5
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\Bass\\cab_body_b1a_d_mls.dds'
				material = cab_body_arcos_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_7
				$car_rocker_bass_factoredglobal_5
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\Bass\\cab_body_b1a_d_mls.dds'
				material = cab_body_arcos_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_8
				$car_rocker_bass_factoredglobal_5
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\Bass\\cab_body_b1a_d_mls.dds'
				material = cab_body_arcos_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_9
				$car_rocker_bass_factoredglobal_5
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\Bass\\cab_body_b1a_d_mls.dds'
				material = cab_body_arcos_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_10
				$car_rocker_bass_factoredglobal_5
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\Bass\\cab_body_b1a_d_mls.dds'
				material = cab_body_arcos_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_11
				$car_rocker_bass_factoredglobal_5
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\Bass\\cab_body_b1a_d_mls.dds'
				material = cab_body_arcos_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_12
				$car_rocker_bass_factoredglobal_5
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\Bass\\cab_body_b1a_d_mls.dds'
				material = cab_body_arcos_primary
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
					None
					cab_pickg_bp1
					cab_pickg_bp2
					cab_pickg_bp3
					cab_pickg_e1
				]
			}
			{
				part = cas_bass_pickups
				valid = [
					cab_pickups_emg01
					cab_pickups_emg02
					cab_pickups_emg03
					cab_pickup_hack01
					cab_pickup_hack02
					cab_pickup_hack03
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
					cab_knob_unos01
					cab_knob_unos02
					cab_knob_unos03
					cab_knob_unos04
					cab_knob_unos05
					cab_knob_unos06
					cab_knob_unos07
					cab_knob_unos08
					cab_knob_unos09
					cab_knob_unos10
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
	{
		desc_id = bass_body_b1b
		frontend_desc = qs(0x4f1e36ed)
		mesh = 'models/CAR_Instruments/Bass/CAB_Body_B1B.skin'
		pak_num = 0
		sections = [
			{
				material = cab_body_unos_primary
				base_tex = 'tex\\models\\CAR_Instruments\\Bass\\cab_body_b1f_d_mls.dds'
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_body_unos_finishes
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\Bass\\cab_body_b1f_d_mls.dds'
				material = cab_body_unos_primary
				$car_rocker_bass_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cab_body_unos_details
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\Bass\\cab_body_b1f_d_mls.dds'
				material = cab_body_unos_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_4
				$car_rocker_bass_factoredglobal_16
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\Bass\\cab_body_b1f_d_mls.dds'
				material = cab_body_unos_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_6
				$car_rocker_bass_factoredglobal_16
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\Bass\\cab_body_b1f_d_mls.dds'
				material = cab_body_unos_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_7
				$car_rocker_bass_factoredglobal_16
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\Bass\\cab_body_b1f_d_mls.dds'
				material = cab_body_unos_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_8
				$car_rocker_bass_factoredglobal_16
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\Bass\\cab_body_b1f_d_mls.dds'
				material = cab_body_unos_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_9
				$car_rocker_bass_factoredglobal_16
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\Bass\\cab_body_b1f_d_mls.dds'
				material = cab_body_unos_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_10
				$car_rocker_bass_factoredglobal_16
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\Bass\\cab_body_b1f_d_mls.dds'
				material = cab_body_unos_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_11
				$car_rocker_bass_factoredglobal_16
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\Bass\\cab_body_b1f_d_mls.dds'
				material = cab_body_unos_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_12
				$car_rocker_bass_factoredglobal_16
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\Bass\\cab_body_b1f_d_mls.dds'
				material = cab_body_unos_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_13
				$car_rocker_bass_factoredglobal_16
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
					None
					cab_pickg_b_unos02
					cab_pickg_b_unos01
					cab_pickg_b_unos03
					cab_pickg_e1
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
					cab_knob_unos01
					cab_knob_unos02
					cab_knob_unos03
					cab_knob_unos04
					cab_knob_unos05
					cab_knob_unos06
					cab_knob_unos07
					cab_knob_unos08
					cab_knob_unos09
					cab_knob_unos10
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
	{
		desc_id = cab_body_chunder01
		frontend_desc = qs(0xb70b0351)
		mesh = 'models/CAR_Instruments/Bass/CAB_Body_Chunder01.skin'
		pak_num = 0
		sections = [
			{
				material = cab_body_chunder01_primary
				base_tex = 'tex\\models\\CAR_Instruments\\Bass\\cab_body_chndra_d_mls.dds'
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_body_chunder01_finishes
			}
			{
				material = cab_body_chunder01_primary
				base_tex = 'tex\\models\\CAR_Instruments\\Bass\\cab_body_chndra_d_mls.dds'
				$car_rocker_bass_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cab_body_chunder01_details
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\Bass\\CAB_Body_chndra_d_mls.dds'
				material = cab_body_chunder01_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_4
				$car_rocker_bass_factoredglobal_19
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\Bass\\CAB_Body_chndra_d_mls.dds'
				material = cab_body_chunder01_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_6
				$car_rocker_bass_factoredglobal_19
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\Bass\\CAB_Body_chndra_d_mls.dds'
				material = cab_body_chunder01_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_7
				$car_rocker_bass_factoredglobal_19
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\Bass\\CAB_Body_chndra_d_mls.dds'
				material = cab_body_chunder01_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_8
				$car_rocker_bass_factoredglobal_19
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\Bass\\CAB_Body_chndra_d_mls.dds'
				material = cab_body_chunder01_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_9
				$car_rocker_bass_factoredglobal_19
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\Bass\\CAB_Body_chndra_d_mls.dds'
				material = cab_body_chunder01_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_10
				$car_rocker_bass_factoredglobal_19
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\Bass\\CAB_Body_chndra_d_mls.dds'
				material = cab_body_chunder01_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_11
				$car_rocker_bass_factoredglobal_19
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\Bass\\CAB_Body_chndra_d_mls.dds'
				material = cab_body_chunder01_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_12
				$car_rocker_bass_factoredglobal_19
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\Bass\\CAB_Body_chndra_d_mls.dds'
				material = cab_body_chunder01_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_13
				$car_rocker_bass_factoredglobal_19
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
					None
					cab_pguardchndr07
					cab_pguardchndr06
					cab_pguardchndr04
					cab_pguardchndr01
					cab_pguard_sting
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
					cab_pickup_sting
				]
			}
			{
				part = cas_bass_knobs
				valid = [
					cab_knob_chndr01
					cab_knob_chndr02
					cab_knob_chndr03
					cab_knob_chndr04
					cab_knob_chndr05
					cab_knob_chndr06
					cab_knob_chndr07
					cab_knob_chndr08
					cab_knob_chndr09
					cab_knob_chndr10
					cab_knob_sting
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
	{
		desc_id = cab_body_prediktor
		frontend_desc = qs(0x960d23f4)
		mesh = 'models/CAR_Instruments/Bass/CAB_Body_Prediktor.skin'
		pak_num = 0
		sections = [
			{
				material = guitar_body_prediktor_primary
				base_tex = 'tex\\models\\CAR_Instruments\\guitars\\gtr_predikt_body01_d_mls.dds'
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_body_prediktor_finishes
			}
			{
				material = guitar_body_prediktor_primary
				base_tex = 'tex\\models\\CAR_Instruments\\guitars\\gtr_predikt_body01_d_mls.dds'
				$car_rocker_bass_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cab_body_prediktor_details
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\guitars\\gtr_predikt_body01_D_MLS.dds'
				material = guitar_body_prediktor_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_4
				$car_rocker_bass_factoredglobal_22
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\guitars\\gtr_predikt_body01_D_MLS.dds'
				material = guitar_body_prediktor_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_6
				$car_rocker_bass_factoredglobal_22
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\guitars\\gtr_predikt_body01_D_MLS.dds'
				material = guitar_body_prediktor_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_7
				$car_rocker_bass_factoredglobal_22
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\guitars\\gtr_predikt_body01_D_MLS.dds'
				material = guitar_body_prediktor_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_8
				$car_rocker_bass_factoredglobal_22
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\guitars\\gtr_predikt_body01_D_MLS.dds'
				material = guitar_body_prediktor_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_9
				$car_rocker_bass_factoredglobal_22
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\guitars\\gtr_predikt_body01_D_MLS.dds'
				material = guitar_body_prediktor_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_10
				$car_rocker_bass_factoredglobal_22
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\guitars\\gtr_predikt_body01_D_MLS.dds'
				material = guitar_body_prediktor_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_11
				$car_rocker_bass_factoredglobal_22
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\guitars\\gtr_predikt_body01_D_MLS.dds'
				material = guitar_body_prediktor_primary
				$car_rocker_bass_factoredglobal_3
				desc_id = `font	a3`
				frontend_desc = qs(0x5c8b3f2b)
				mask = $car_fontgrid_text_a3
				$car_rocker_bass_factoredglobal_22
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\guitars\\gtr_predikt_body01_D_MLS.dds'
				material = guitar_body_prediktor_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_12
				$car_rocker_bass_factoredglobal_22
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\guitars\\gtr_predikt_body01_D_MLS.dds'
				material = guitar_body_prediktor_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_13
				$car_rocker_bass_factoredglobal_22
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
					None
					cab_pg_pred01
					cab_pg_pred02
					cab_pg_pred03
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
					cab_knob_phunq01
					cab_knob_phunq02
					cab_knob_phunq03
					cab_knob_phunq04
					cab_knob_phunq05
					cab_knob_phunq06
					cab_knob_phunq07
					cab_knob_phunq08
					cab_knob_phunq09
					cab_knob_phunq10
				]
			}
			{
				part = cas_bass_bridges
				valid = [
					cab_bridge_bb2a
					cab_bridge_bb1a
					cab_bridge_bb3a
					cab_bridge_mls
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
	{
		desc_id = cab_body_kelly
		frontend_desc = qs(0x18c18d5f)
		mesh = 'models/CAR_Instruments/Bass/CAB_Body_Kelly.skin'
		pak_num = 0
		sections = [
			{
				material = cab_kelly_primary
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\cab_body_kelly_d_mls.dds'
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_body_kelly_finishes
			}
			{
				material = cab_kelly_primary
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\cab_body_kelly_d_mls.dds'
				$car_rocker_bass_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cab_body_kelly_details
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_Kelly_D_MLS.dds'
				material = cab_kelly_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_4
				$car_rocker_bass_factoredglobal_26
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_Kelly_D_MLS.dds'
				material = cab_kelly_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_6
				$car_rocker_bass_factoredglobal_26
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_Kelly_D_MLS.dds'
				material = cab_kelly_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_7
				$car_rocker_bass_factoredglobal_26
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_Kelly_D_MLS.dds'
				material = cab_kelly_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_8
				$car_rocker_bass_factoredglobal_26
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_Kelly_D_MLS.dds'
				material = cab_kelly_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_9
				$car_rocker_bass_factoredglobal_26
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_Kelly_D_MLS.dds'
				material = cab_kelly_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_10
				$car_rocker_bass_factoredglobal_26
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_Kelly_D_MLS.dds'
				material = cab_kelly_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_11
				$car_rocker_bass_factoredglobal_26
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_Kelly_D_MLS.dds'
				material = cab_kelly_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_12
				$car_rocker_bass_factoredglobal_26
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_Kelly_D_MLS.dds'
				material = cab_kelly_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_13
				$car_rocker_bass_factoredglobal_26
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
					None
					cab_phnq_pg001
					cab_phnq_pg002
					cab_pguardchndr06
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
					cab_knob_grmbl01
					cab_knob_grmbl02
					cab_knob_grmbl03
					cab_knob_grmbl04
					cab_knob_grmbl05
					cab_knob_grmbl06
					cab_knob_grmbl07
					cab_knob_grmbl08
					cab_knob_grmbl09
					cab_knob_grmbl10
				]
			}
			{
				part = cas_bass_bridges
				valid = [
					cab_bridge_bb2a
					cab_bridge_bb1a
					cab_bridge_bb3a
					cab_bridge_mls
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
	{
		desc_id = cab_body_rubyat
		frontend_desc = qs(0xdb62ac41)
		price = 5000
		mesh = 'models/CAR_Instruments/Bass/CAB_Body_Rubyat.skin'
		pak_num = 0
		sections = [
			{
				material = cab_rubyat_primary
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\cab_body_rubyat_d_mls.dds'
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_body_rubaiyat_finishes
			}
			{
				material = cab_rubyat_primary
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\cab_body_rubyat_d_mls.dds'
				$car_rocker_bass_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cab_body_rubaiyat_details
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_Rubyat_D_MLS.dds'
				material = cab_rubyat_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_4
				$car_rocker_bass_factoredglobal_29
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_Rubyat_D_MLS.dds'
				material = cab_rubyat_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_6
				$car_rocker_bass_factoredglobal_29
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_Rubyat_D_MLS.dds'
				material = cab_rubyat_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_7
				$car_rocker_bass_factoredglobal_29
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_Rubyat_D_MLS.dds'
				material = cab_rubyat_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_8
				$car_rocker_bass_factoredglobal_29
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_Rubyat_D_MLS.dds'
				material = cab_rubyat_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_9
				$car_rocker_bass_factoredglobal_29
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_Rubyat_D_MLS.dds'
				material = cab_rubyat_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_10
				$car_rocker_bass_factoredglobal_29
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_Rubyat_D_MLS.dds'
				material = cab_rubyat_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_11
				$car_rocker_bass_factoredglobal_29
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_Rubyat_D_MLS.dds'
				material = cab_rubyat_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_12
				$car_rocker_bass_factoredglobal_29
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_Rubyat_D_MLS.dds'
				material = cab_rubyat_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_13
				$car_rocker_bass_factoredglobal_29
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
					None
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
					cab_knob_rubyat01
					cab_knob_rubyat02
					cab_knob_rubyat03
					cab_knob_rubyat04
					cab_knob_rubyat05
					cab_knob_rubyat06
					cab_knob_rubyat07
					cab_knob_rubyat08
					cab_knob_rubyat09
					cab_knob_rubyat10
				]
			}
			{
				part = cas_bass_bridges
				valid = [
					cab_bridge_bb2a
					cab_bridge_bb1a
					cab_bridge_bb3a
					cab_bridge_mls
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
					cab_head_rubyat
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
					cab_head_foots01
				]
			}
		]
	}
	{
		desc_id = cab_body_bandera
		frontend_desc = qs(0x066a5e9c)
		mesh = 'models/CAR_Instruments/Bass/CAB_Body_Bandera.skin'
		pak_num = 0
		sections = [
			{
				material = guitar_body_bandera_primary
				base_tex = 'tex\\models\\CAR_Instruments\\guitars\\gtr_body_style17_d.dds'
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_body_bandera_finishes
			}
			{
				material = guitar_body_bandera_primary
				base_tex = 'tex\\models\\CAR_Instruments\\guitars\\gtr_body_style17_d.dds'
				$car_rocker_bass_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cab_body_bandera_details
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\guitars\\gtr_body_style17_d.dds'
				material = guitar_body_bandera_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_4
				$car_rocker_bass_factoredglobal_32
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\guitars\\gtr_body_style17_d.dds'
				material = guitar_body_bandera_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_6
				$car_rocker_bass_factoredglobal_32
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\guitars\\gtr_body_style17_d.dds'
				material = guitar_body_bandera_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_7
				$car_rocker_bass_factoredglobal_32
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\guitars\\gtr_body_style17_d.dds'
				material = guitar_body_bandera_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_8
				$car_rocker_bass_factoredglobal_32
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\guitars\\gtr_body_style17_d.dds'
				material = guitar_body_bandera_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_9
				$car_rocker_bass_factoredglobal_32
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\guitars\\gtr_body_style17_d.dds'
				material = guitar_body_bandera_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_10
				$car_rocker_bass_factoredglobal_32
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\guitars\\gtr_body_style17_d.dds'
				material = guitar_body_bandera_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_11
				$car_rocker_bass_factoredglobal_32
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\guitars\\gtr_body_style17_d.dds'
				material = guitar_body_bandera_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_12
				$car_rocker_bass_factoredglobal_32
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\guitars\\gtr_body_style17_d.dds'
				material = guitar_body_bandera_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_13
				$car_rocker_bass_factoredglobal_32
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
					None
					cab_phnq_pg003
					cab_pickg_e1
					cab_phnq_pg002
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
					cab_knob_phunq01
					cab_knob_phunq02
					cab_knob_phunq03
					cab_knob_phunq04
					cab_knob_phunq05
					cab_knob_phunq06
					cab_knob_phunq07
					cab_knob_phunq08
					cab_knob_phunq09
					cab_knob_phunq10
				]
			}
			{
				part = cas_bass_head
				valid = [
					cab_head_guppy
					cab_head_predikt
					cab_head_skull
					cab_head_flay_rev
					cab_head_radex
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
			{
				part = cas_bass_bridges
				valid = [
					cab_bridge_hack
					cab_bridge_bb2a
					cab_bridge_bb1a
					cab_bridge_bb3a
					cab_bridge_mls
				]
			}
		]
	}
	{
		desc_id = cab_body_grmbl_a
		frontend_desc = qs(0xfb105a09)
		mesh = 'models/CAR_Instruments/Bass/CAB_Body_Grmbl_A.skin'
		pak_num = 1
		sections = [
			{
				material = cab_body_grmbl_a_primary
				base_tex = 'tex\\models\\CAR_Instruments\\Bass\\cab_body_grumbel01_d_mls.dds'
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_body_grmbl_a_finishes
			}
			{
				material = cab_body_grmbl_a_primary
				base_tex = 'tex\\models\\CAR_Instruments\\Bass\\cab_body_grumbel01_d_mls.dds'
				$car_rocker_bass_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cab_body_grmbl_details
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_grumbel01_D_MLS.dds'
				material = cab_body_grmbl_a_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_4
				$car_rocker_bass_factoredglobal_35
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_grumbel01_D_MLS.dds'
				material = cab_body_grmbl_a_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_6
				$car_rocker_bass_factoredglobal_35
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_grumbel01_D_MLS.dds'
				material = cab_body_grmbl_a_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_7
				$car_rocker_bass_factoredglobal_35
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_grumbel01_D_MLS.dds'
				material = cab_body_grmbl_a_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_8
				$car_rocker_bass_factoredglobal_35
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_grumbel01_D_MLS.dds'
				material = cab_body_grmbl_a_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_9
				$car_rocker_bass_factoredglobal_35
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_grumbel01_D_MLS.dds'
				material = cab_body_grmbl_a_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_10
				$car_rocker_bass_factoredglobal_35
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_grumbel01_D_MLS.dds'
				material = cab_body_grmbl_a_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_11
				$car_rocker_bass_factoredglobal_35
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_grumbel01_D_MLS.dds'
				material = cab_body_grmbl_a_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_12
				$car_rocker_bass_factoredglobal_35
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_grumbel01_D_MLS.dds'
				material = cab_body_grmbl_a_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_13
				$car_rocker_bass_factoredglobal_35
			}
		]
		inclusion = [
			{
				part = cas_bass_neck
				valid = [
					cab_stnek_bnst01
					cab_stnek_maple
					cab_stnek_ebony
					cab_stnekf_rosewood
					cab_stnekf_maple
					cab_stnekf_ebony
				]
			}
			{
				part = cas_bass_pickguards
				valid = [
					cab_pgard_grmbl01
					cab_pgard_grmbl02
					cab_pgard_grmbl03
					None
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
					cab_knob_grmbl01
					cab_knob_grmbl02
					cab_knob_grmbl03
					cab_knob_grmbl04
					cab_knob_grmbl05
					cab_knob_grmbl06
					cab_knob_grmbl07
					cab_knob_grmbl08
					cab_knob_grmbl09
					cab_knob_grmbl10
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
	{
		desc_id = cab_body_phunq01
		frontend_desc = qs(0x4deedd41)
		mesh = 'models/CAR_Instruments/Bass/CAB_Body_Phunq01.skin'
		pak_num = 1
		sections = [
			{
				material = cab_body_bubinga01_primary
				base_tex = 'tex\\models\\CAR_Instruments\\Bass\\cab_body_beech01_b1_d_mls.dds'
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_body_phunq01_finishes
			}
			{
				material = cab_body_bubinga01_primary
				base_tex = 'tex\\models\\CAR_Instruments\\Bass\\cab_body_beech01_b1_d_mls.dds'
				$car_rocker_bass_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cab_body_phunq01_details
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\cab_body_beech01_b1_d_mls.dds'
				material = cab_body_bubinga01_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_4
				$car_rocker_bass_factoredglobal_38
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\cab_body_beech01_b1_d_mls.dds'
				material = cab_body_bubinga01_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_6
				$car_rocker_bass_factoredglobal_38
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\cab_body_beech01_b1_d_mls.dds'
				material = cab_body_bubinga01_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_7
				$car_rocker_bass_factoredglobal_38
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\cab_body_beech01_b1_d_mls.dds'
				material = cab_body_bubinga01_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_8
				$car_rocker_bass_factoredglobal_38
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\cab_body_beech01_b1_d_mls.dds'
				material = cab_body_bubinga01_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_9
				$car_rocker_bass_factoredglobal_38
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\cab_body_beech01_b1_d_mls.dds'
				material = cab_body_bubinga01_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_10
				$car_rocker_bass_factoredglobal_38
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\cab_body_beech01_b1_d_mls.dds'
				material = cab_body_bubinga01_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_11
				$car_rocker_bass_factoredglobal_38
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\cab_body_beech01_b1_d_mls.dds'
				material = cab_body_bubinga01_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_12
				$car_rocker_bass_factoredglobal_38
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\cab_body_beech01_b1_d_mls.dds'
				material = cab_body_bubinga01_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_13
				$car_rocker_bass_factoredglobal_38
			}
		]
		inclusion = [
			{
				part = cas_bass_neck
				valid = [
					cab_stnek_bnst01
					cab_stnek_maple
					cab_stnek_ebony
					cab_stnekf_rosewood
					cab_stnekf_maple
					cab_stnekf_ebony
				]
			}
			{
				part = cas_bass_pickguards
				valid = [
					None
					cab_phnq_pg001
					cab_phnq_pg002
					cab_phnq_pg003
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
					cab_knob_phunq01
					cab_knob_phunq02
					cab_knob_phunq03
					cab_knob_phunq04
					cab_knob_phunq05
					cab_knob_phunq06
					cab_knob_phunq07
					cab_knob_phunq08
					cab_knob_phunq09
					cab_knob_phunq10
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
				$car_rocker_bass_factoredglobal_41
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Bodywood_b3a_e_mls.dds'
				material = cab_body_bb3a_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_6
				$car_rocker_bass_factoredglobal_41
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Bodywood_b3a_e_mls.dds'
				material = cab_body_bb3a_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_7
				$car_rocker_bass_factoredglobal_41
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Bodywood_b3a_e_mls.dds'
				material = cab_body_bb3a_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_8
				$car_rocker_bass_factoredglobal_41
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Bodywood_b3a_e_mls.dds'
				material = cab_body_bb3a_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_9
				$car_rocker_bass_factoredglobal_41
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Bodywood_b3a_e_mls.dds'
				material = cab_body_bb3a_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_10
				$car_rocker_bass_factoredglobal_41
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Bodywood_b3a_e_mls.dds'
				material = cab_body_bb3a_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_11
				$car_rocker_bass_factoredglobal_41
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Bodywood_b3a_e_mls.dds'
				material = cab_body_bb3a_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_12
				$car_rocker_bass_factoredglobal_41
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Bodywood_b3a_e_mls.dds'
				material = cab_body_bb3a_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_13
				$car_rocker_bass_factoredglobal_41
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
					None
					cab_pickg_f1
					cab_pickg_f2
					cab_pickg_f3
					None
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
	{
		desc_id = cab_bodyfoots01
		frontend_desc = qs(0xa4da62d3)
		price = 2000
		mesh = 'models/CAR_Instruments/Bass/CAB_BodyFoots01.skin'
		pak_num = 1
		sections = [
			{
				material = cab_bodyfoots01_primary
				base_tex = 'tex\\models\\CAR_Instruments\\Bass\\cab_body_footsy01_d_mls.dds'
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_bodyfoots01_finishes
			}
			{
				material = cab_bodyfoots01_primary
				base_tex = 'tex\\models\\CAR_Instruments\\Bass\\cab_body_footsy01_d_mls.dds'
				$car_rocker_bass_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cab_bodyfoots01_details
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_footsy01_d_mls.dds'
				material = cab_bodyfoots01_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_4
				$car_rocker_bass_factoredglobal_44
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_footsy01_d_mls.dds'
				material = cab_bodyfoots01_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_6
				$car_rocker_bass_factoredglobal_44
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_footsy01_d_mls.dds'
				material = cab_bodyfoots01_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_7
				$car_rocker_bass_factoredglobal_44
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_footsy01_d_mls.dds'
				material = cab_bodyfoots01_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_8
				$car_rocker_bass_factoredglobal_44
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_footsy01_d_mls.dds'
				material = cab_bodyfoots01_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_9
				$car_rocker_bass_factoredglobal_44
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_footsy01_d_mls.dds'
				material = cab_bodyfoots01_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_10
				$car_rocker_bass_factoredglobal_44
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_footsy01_d_mls.dds'
				material = cab_bodyfoots01_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_11
				$car_rocker_bass_factoredglobal_44
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_footsy01_d_mls.dds'
				material = cab_bodyfoots01_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_12
				$car_rocker_bass_factoredglobal_44
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_footsy01_d_mls.dds'
				material = cab_bodyfoots01_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_13
				$car_rocker_bass_factoredglobal_44
			}
		]
		inclusion = [
			{
				part = cas_bass_neck
				valid = [
					cab_stnek_bnst01
					cab_stnek_maple
					cab_stnek_ebony
					cab_stnekf_rosewood
					cab_stnekf_maple
					cab_stnekf_ebony
				]
			}
			{
				part = cas_bass_pickguards
				valid = [
					None
					cab_pgrdfts001
					cab_pgrdftsb
					cab_pgrdftsc
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
					cab_knob_foots01
					cab_knob_foots02
					cab_knob_foots03
					cab_knob_foots04
					cab_knob_foots05
					cab_knob_foots06
					cab_knob_foots07
					cab_knob_foots08
					cab_knob_foots09
					cab_knob_foots10
				]
			}
			{
				part = cas_bass_head
				valid = [
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
		]
	}
	{
		desc_id = cab_body_laurenz_bba
		frontend_desc = qs(0xde190591)
		mesh = 'models/CAR_Instruments/Bass/CAB_Body_Laurenz_BBA.skin'
		price = 3000
		pak_num = 1
		sections = [
			{
				material = cab_body_laurenz_bba_primary
				base_tex = 'tex\\models\\CAR_Instruments\\Bass\\cab_body_spyter02_d_mls.dds'
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_body_laurenz_bba_finishes
			}
			{
				material = cab_body_laurenz_bba_primary
				base_tex = 'tex\\models\\CAR_Instruments\\Bass\\cab_body_spyter02_d_mls.dds'
				$car_rocker_bass_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cab_body_laurenz_bba_details
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_spyter02_D_mls.dds'
				material = cab_body_laurenz_bba_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_4
				$car_rocker_bass_factoredglobal_47
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_spyter02_D_mls.dds'
				material = cab_body_laurenz_bba_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_6
				$car_rocker_bass_factoredglobal_47
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_spyter02_D_mls.dds'
				material = cab_body_laurenz_bba_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_7
				$car_rocker_bass_factoredglobal_47
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_spyter02_D_mls.dds'
				material = cab_body_laurenz_bba_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_8
				$car_rocker_bass_factoredglobal_47
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_spyter02_D_mls.dds'
				material = cab_body_laurenz_bba_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_9
				$car_rocker_bass_factoredglobal_47
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_spyter02_D_mls.dds'
				material = cab_body_laurenz_bba_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_10
				$car_rocker_bass_factoredglobal_47
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_spyter02_D_mls.dds'
				material = cab_body_laurenz_bba_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_11
				$car_rocker_bass_factoredglobal_47
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_spyter02_D_mls.dds'
				material = cab_body_laurenz_bba_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_12
				$car_rocker_bass_factoredglobal_47
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_spyter02_D_mls.dds'
				material = cab_body_laurenz_bba_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_13
				$car_rocker_bass_factoredglobal_47
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
					None
					cab_pg_spyt001
					cab_pg_spyt002
					cab_pg_spyt003
					cab_pg_spyt004
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
					cab_knob_spyt01
					cab_knob_spyt02
					cab_knob_spyt03
					cab_knob_spyt04
					cab_knob_spyt05
					cab_knob_spyt06
					cab_knob_spyt07
					cab_knob_spyt08
					cab_knob_spyt09
					cab_knob_spyt10
				]
			}
			{
				part = cas_bass_head
				valid = [
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
			{
				part = cas_bass_bridges
				valid = [
					cab_bridge_bb2a
					cab_bridge_bb1a
					cab_bridge_bb3a
					cab_bridge_mls
				]
			}
		]
	}
	{
		desc_id = cab_skull
		frontend_desc = qs(0x2a26573d)
		mesh = 'models/CAR_Instruments/Bass/CAB_Skull.skin'
		price = 1500
		pak_num = 2
		sections = [
			{
				material = cab_skull_primary
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\cab_special_skull_01.dds'
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_skull_finishes
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\cab_special_skull_01.dds'
				material = cab_skull_primary
				$car_rocker_bass_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cab_skull_details
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_special_skull_01.dds'
				material = cab_skull_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_4
				$car_rocker_bass_factoredglobal_50
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_special_skull_01.dds'
				material = cab_skull_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_6
				$car_rocker_bass_factoredglobal_50
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_special_skull_01.dds'
				material = cab_skull_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_7
				$car_rocker_bass_factoredglobal_50
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_special_skull_01.dds'
				material = cab_skull_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_8
				$car_rocker_bass_factoredglobal_50
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_special_skull_01.dds'
				material = cab_skull_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_9
				$car_rocker_bass_factoredglobal_50
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_special_skull_01.dds'
				material = cab_skull_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_10
				$car_rocker_bass_factoredglobal_50
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_special_skull_01.dds'
				material = cab_skull_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_11
				$car_rocker_bass_factoredglobal_50
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_special_skull_01.dds'
				material = cab_skull_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_12
				$car_rocker_bass_factoredglobal_50
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_special_skull_01.dds'
				material = cab_skull_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_13
				$car_rocker_bass_factoredglobal_50
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
					None
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
					cab_knob_skull01
					cab_knob_skull02
					cab_knob_skull03
					cab_knob_skull04
					cab_knob_skull05
					cab_knob_skull06
					cab_knob_skull07
					cab_knob_skull08
					cab_knob_skull09
					cab_knob_skull10
				]
			}
			{
				part = cas_bass_head
				valid = [
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
		]
	}
	{
		desc_id = cab_body_sixtease
		frontend_desc = qs(0x687db4f9)
		mesh = 'models/CAR_Instruments/Bass/CAB_Body_SixTease.skin'
		pak_num = 2
		sections = [
			{
				material = cab_body_sixtease_primary
				base_tex = 'tex\\models\\CAR_Instruments\\Bass\\cab_body_sixtease01_d_mls.dds'
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_body_sixtease_finishes
			}
			{
				material = cab_body_sixtease_primary
				base_tex = 'tex\\models\\CAR_Instruments\\Bass\\cab_body_sixtease01_d_mls.dds'
				$car_rocker_bass_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cab_body_sixtease_details
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_SixTease01_D_mls.dds'
				material = cab_body_sixtease_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_4
				$car_rocker_bass_factoredglobal_53
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_SixTease01_D_mls.dds'
				material = cab_body_sixtease_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_6
				$car_rocker_bass_factoredglobal_53
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_SixTease01_D_mls.dds'
				material = cab_body_sixtease_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_7
				$car_rocker_bass_factoredglobal_53
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_SixTease01_D_mls.dds'
				material = cab_body_sixtease_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_8
				$car_rocker_bass_factoredglobal_53
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_SixTease01_D_mls.dds'
				material = cab_body_sixtease_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_9
				$car_rocker_bass_factoredglobal_53
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_SixTease01_D_mls.dds'
				material = cab_body_sixtease_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_10
				$car_rocker_bass_factoredglobal_53
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_SixTease01_D_mls.dds'
				material = cab_body_sixtease_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_11
				$car_rocker_bass_factoredglobal_53
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_SixTease01_D_mls.dds'
				material = cab_body_sixtease_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_12
				$car_rocker_bass_factoredglobal_53
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_SixTease01_D_mls.dds'
				material = cab_body_sixtease_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_13
				$car_rocker_bass_factoredglobal_53
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
					None
					cab_pg_6tz001
					cab_pg_6tz002
					cab_pg_6tz004
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
					cab_knobs_6tz01
					cab_knobs_6tz02
					cab_knobs_6tz03
					cab_knobs_6tz04
					cab_knobs_6tz05
					cab_knobs_6tz06
					cab_knobs_6tz07
					cab_knobs_6tz08
					cab_knobs_6tz09
					cab_knobs_6tz10
				]
			}
			{
				part = cas_bass_head
				valid = [
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
		]
	}
	{
		desc_id = cab_body_xrend01
		frontend_desc = qs(0x841dc6fa)
		mesh = 'models/CAR_Instruments/Bass/CAB_Body_XRend01.skin'
		price = 2000
		pak_num = 2
		sections = [
			{
				material = cab_body_xrend01_primary
				base_tex = 'tex\\models\\CAR_Instruments\\Bass\\cab_body_xrend01_d_mls.dds'
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_body_xrend01_finishes
			}
			{
				material = cab_body_xrend01_primary
				base_tex = 'tex\\models\\CAR_Instruments\\Bass\\cab_body_xrend01_d_mls.dds'
				$car_rocker_bass_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cab_body_xrend01_details
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_xrend01_d_mls.dds'
				material = cab_body_xrend01_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_4
				$car_rocker_bass_factoredglobal_56
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_xrend01_d_mls.dds'
				material = cab_body_xrend01_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_6
				$car_rocker_bass_factoredglobal_56
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_xrend01_d_mls.dds'
				material = cab_body_xrend01_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_7
				$car_rocker_bass_factoredglobal_56
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_xrend01_d_mls.dds'
				material = cab_body_xrend01_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_8
				$car_rocker_bass_factoredglobal_56
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_xrend01_d_mls.dds'
				material = cab_body_xrend01_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_9
				$car_rocker_bass_factoredglobal_56
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_xrend01_d_mls.dds'
				material = cab_body_xrend01_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_10
				$car_rocker_bass_factoredglobal_56
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_xrend01_d_mls.dds'
				material = cab_body_xrend01_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_11
				$car_rocker_bass_factoredglobal_56
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_xrend01_d_mls.dds'
				material = cab_body_xrend01_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_12
				$car_rocker_bass_factoredglobal_56
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\bass\\Cab_Body_xrend01_d_mls.dds'
				material = cab_body_xrend01_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_13
				$car_rocker_bass_factoredglobal_56
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
					None
					cab_pg_xrend003
					cab_pg_xrend002
					cab_pg_xrend001
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
					cab_knob_xrend01
					cab_knob_xrend02
					cab_knob_xrend03
					cab_knob_xrend04
					cab_knob_xrend05
					cab_knob_xrend06
					cab_knob_xrend07
					cab_knob_xrend08
					cab_knob_xrend09
					cab_knob_xrend10
				]
			}
			{
				part = cas_bass_head
				valid = [
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
			{
				part = cas_bass_bridges
				valid = [
					cab_bridge_bb2a
					cab_bridge_bb1a
					cab_bridge_bb3a
					cab_bridge_mls
				]
			}
		]
	}
	{
		desc_id = cab_body_x_battleaxe
		frontend_desc = qs(0x37173988)
		mesh = 'models/CAR_Instruments/Bass/CAB_X_Battleaxe.skin'
		price = 2000
		pak_num = 2
		sections = [
			{
				material = gtr_body_x_battleaxe_primary
				base_tex = 'tex\\models\\CAR_Instruments\\guitars\\guitar_special_battle_axe_d_05.dds'
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_body_battleaxe_finishes
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\guitars\\guitar_special_battle_axe_d_05.dds'
				material = gtr_body_x_battleaxe_primary
				$car_rocker_bass_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cab_body_battleaxe_details
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\guitars\\guitar_special_battle_axe_d_05.dds'
				material = gtr_body_x_battleaxe_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_4
				$car_rocker_bass_factoredglobal_59
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\guitars\\guitar_special_battle_axe_d_05.dds'
				material = gtr_body_x_battleaxe_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_6
				$car_rocker_bass_factoredglobal_59
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\guitars\\guitar_special_battle_axe_d_05.dds'
				material = gtr_body_x_battleaxe_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_7
				$car_rocker_bass_factoredglobal_59
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\guitars\\guitar_special_battle_axe_d_05.dds'
				material = gtr_body_x_battleaxe_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_8
				$car_rocker_bass_factoredglobal_59
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\guitars\\guitar_special_battle_axe_d_05.dds'
				material = gtr_body_x_battleaxe_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_9
				$car_rocker_bass_factoredglobal_59
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\guitars\\guitar_special_battle_axe_d_05.dds'
				material = gtr_body_x_battleaxe_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_10
				$car_rocker_bass_factoredglobal_59
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\guitars\\guitar_special_battle_axe_d_05.dds'
				material = gtr_body_x_battleaxe_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_11
				$car_rocker_bass_factoredglobal_59
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\guitars\\guitar_special_battle_axe_d_05.dds'
				material = gtr_body_x_battleaxe_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_12
				$car_rocker_bass_factoredglobal_59
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\guitars\\guitar_special_battle_axe_d_05.dds'
				material = gtr_body_x_battleaxe_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_13
				$car_rocker_bass_factoredglobal_59
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
					None
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
					cab_knob_icross01
					cab_knob_icross02
					cab_knob_icross03
					cab_knob_icross04
					cab_knob_icross05
					cab_knob_icross06
					cab_knob_icross07
					cab_knob_icross08
					cab_knob_icross09
					cab_knob_icross10
				]
			}
			{
				part = cas_bass_head
				valid = [
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
		]
	}
	{
		desc_id = cab_body_x_icross
		frontend_desc = qs(0xa57bf63d)
		mesh = 'models/CAR_Instruments/Bass/CAB_Body_X_ICross.skin'
		price = 1500
		pak_num = 2
		sections = [
			{
				material = gtr_body_x_icross_primary
				base_tex = 'tex\\models\\CAR_Instruments\\guitars\\guitar_special_icross_d_04.dds'
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_body_icross_finishes
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\guitars\\guitar_special_icross_d_04.dds'
				material = gtr_body_x_icross_primary
				$car_rocker_bass_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cab_body_icross_details
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\guitars\\guitar_special_icross_d_04.dds'
				material = gtr_body_x_icross_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_4
				$car_rocker_bass_factoredglobal_62
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\guitars\\guitar_special_icross_d_04.dds'
				material = gtr_body_x_icross_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_6
				$car_rocker_bass_factoredglobal_62
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\guitars\\guitar_special_icross_d_04.dds'
				material = gtr_body_x_icross_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_7
				$car_rocker_bass_factoredglobal_62
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\guitars\\guitar_special_icross_d_04.dds'
				material = gtr_body_x_icross_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_8
				$car_rocker_bass_factoredglobal_62
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\guitars\\guitar_special_icross_d_04.dds'
				material = gtr_body_x_icross_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_9
				$car_rocker_bass_factoredglobal_62
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\guitars\\guitar_special_icross_d_04.dds'
				material = gtr_body_x_icross_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_10
				$car_rocker_bass_factoredglobal_62
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\guitars\\guitar_special_icross_d_04.dds'
				material = gtr_body_x_icross_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_11
				$car_rocker_bass_factoredglobal_62
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\guitars\\guitar_special_icross_d_04.dds'
				material = gtr_body_x_icross_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_12
				$car_rocker_bass_factoredglobal_62
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\guitars\\guitar_special_icross_d_04.dds'
				material = gtr_body_x_icross_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_13
				$car_rocker_bass_factoredglobal_62
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
					None
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
					cab_knob_icross01
					cab_knob_icross02
					cab_knob_icross03
					cab_knob_icross04
					cab_knob_icross05
					cab_knob_icross06
					cab_knob_icross07
					cab_knob_icross08
					cab_knob_icross09
					cab_knob_icross10
				]
			}
			{
				part = cas_bass_head
				valid = [
					cab_head_predikt
					cab_head_skull
					cab_head_radex
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
		]
	}
]
cas_bass_neck = [
	{
		desc_id = cab_neck_bn1a
		frontend_desc = qs(0x639f49db)
		mesh = 'models/CAR_Instruments/bass/CAB_Neck_BN1A.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_neck_01_maple_d_mls.dds'
				material = cab_neck_bn1a_neck
				$car_rocker_bass_factoredglobal_0
				$car_rocker_bass_factoredglobal_63
				$car_rocker_bass_factoredglobal_64
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/cab_neck_01_maple_d_mls.dds`
				material = cab_neck_bn1a_neck
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/cab_nek_lyrmpl_blk_wht.img`
						flags = 4
						Color = grey_1
					}
				]
				$car_rocker_bass_factoredglobal_65
			}
		]
	}
	{
		desc_id = cab_neck_bn1b
		frontend_desc = qs(0x0f9d656e)
		mesh = 'models/CAR_Instruments/bass/CAB_Neck_BN1B.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_neck_01b_rosewood_d_mls.dds'
				material = cab_neck_bn1b_neck
				$car_rocker_bass_factoredglobal_0
				$car_rocker_bass_factoredglobal_63
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
				$car_rocker_bass_factoredglobal_65
			}
		]
	}
	{
		desc_id = cab_neck_bnebony
		frontend_desc = qs(0x40392b54)
		mesh = 'models/CAR_Instruments/bass/CAB_Neck_BNEbony.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_nek_ebony01.dds'
				material = cab_neck_ebony_neck
				$car_rocker_bass_factoredglobal_0
				$car_rocker_bass_factoredglobal_63
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/cab_nek_ebony01.dds`
				material = cab_neck_ebony_neck
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/cab_nek_lyrmpl_wht_dot.img`
						flags = 4
					}
				]
				$car_rocker_bass_factoredglobal_65
			}
		]
	}
	{
		desc_id = cab_stnek_maple
		frontend_desc = qs(0x88d2d629)
		mesh = 'models/CAR_Instruments/Bass/CAB_StNek_Maple.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_neck_01_maple_d_mls.dds'
				material = cab_stnek_maple_neck
				$car_rocker_bass_factoredglobal_0
				$car_rocker_bass_factoredglobal_63
				$car_rocker_bass_factoredglobal_64
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/cab_neck_01_maple_d_mls.dds`
				material = cab_stnek_maple_neck
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/cab_nek_lyrmpl_wht_dot.img`
						flags = 4
						Color = grey_1
					}
				]
				$car_rocker_bass_factoredglobal_65
			}
		]
	}
	{
		desc_id = cab_stnek_bnst01
		frontend_desc = qs(0xc858d21c)
		mesh = 'models/CAR_Instruments/Bass/CAB_StNek_BNSt01.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_neck_01b_rosewood_d_mls.dds'
				material = cab_tneck_bnt01_neck
				$car_rocker_bass_factoredglobal_0
				$car_rocker_bass_factoredglobal_63
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/cab_neck_01b_rosewood_d_mls.dds`
				material = cab_tneck_bnt01_neck
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/cab_nek_lyrmpl_wht_dot.img`
						flags = 4
					}
				]
				$car_rocker_bass_factoredglobal_65
			}
		]
	}
	{
		desc_id = cab_stnek_ebony
		frontend_desc = qs(0xab74b4a6)
		mesh = 'models/CAR_Instruments/Bass/CAB_StNek_Ebony.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_nek_ebony01.dds'
				material = cab_stnek_ebony_neck
				$car_rocker_bass_factoredglobal_0
				$car_rocker_bass_factoredglobal_63
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/cab_nek_ebony01.dds`
				material = cab_stnek_ebony_neck
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/cab_nek_lyrmpl_wht_dot.img`
						flags = 4
					}
				]
				$car_rocker_bass_factoredglobal_65
			}
		]
	}
	{
		desc_id = cab_stnekf_maple
		frontend_desc = qs(0x61bef1d7)
		mesh = 'models/CAR_Instruments/Bass/CAB_StNekF_Mpale.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_nekf_maple01.dds'
				material = cab_stnekf_maple_neck
				$car_rocker_bass_factoredglobal_0
				$car_rocker_bass_factoredglobal_66
				$car_rocker_bass_factoredglobal_64
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/cab_nekf_maple01.dds`
				material = cab_stnekf_maple_neck
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/cab_nek_tribal2_f.img`
						flags = 4
						Color = grey_1
					}
				]
				$car_rocker_bass_factoredglobal_65
			}
		]
	}
	{
		desc_id = cab_stnekf_rosewood
		frontend_desc = qs(0x43e2faf5)
		mesh = 'models/CAR_Instruments/Bass/CAB_StNekF_Rosewood.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_neck_fretlss01_d.dds'
				material = cab_stnekf_rosewood_neck
				$car_rocker_bass_factoredglobal_0
				$car_rocker_bass_factoredglobal_66
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/cab_neck_fretlss01_d.dds`
				material = cab_stnekf_rosewood_neck
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/cab_nek_pumpkins.img`
						flags = 4
					}
				]
				$car_rocker_bass_factoredglobal_65
			}
		]
	}
	{
		desc_id = cab_stnekf_ebony
		frontend_desc = qs(0x42189358)
		mesh = 'models/CAR_Instruments/Bass/CAB_StNekF_Ebony.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_nekf_ebony01.dds'
				material = cab_stnekf_ebony_neck
				$car_rocker_bass_factoredglobal_0
				$car_rocker_bass_factoredglobal_66
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/cab_nekf_ebony01.dds`
				material = cab_stnekf_ebony_neck
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/cab_nek_tribal_f.img`
						flags = 4
					}
				]
				$car_rocker_bass_factoredglobal_65
			}
		]
	}
	{
		desc_id = cab_neck_bfretlss03
		frontend_desc = qs(0x44d6f411)
		mesh = 'models/CAR_Instruments/Bass/CAB_Neck_BFretlss03.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_nekf_maple01.dds'
				material = cab_neck_fretless03_neck
				$car_rocker_bass_factoredglobal_0
				$car_rocker_bass_factoredglobal_66
				$car_rocker_bass_factoredglobal_64
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/cab_nekf_maple01.dds`
				material = cab_neck_fretless03_neck
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/cab_nek_tribal_f.img`
						flags = 4
						Color = grey_1
					}
				]
				$car_rocker_bass_factoredglobal_65
			}
		]
	}
	{
		desc_id = cab_neck_bfretlss01
		frontend_desc = qs(0x8ca7d3cb)
		mesh = 'models/CAR_Instruments/Bass/CAB_Neck_BFretlss01.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_neck_fretlss01_d.dds'
				material = cab_neck_fretless01_neck
				$car_rocker_bass_factoredglobal_0
				$car_rocker_bass_factoredglobal_66
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/cab_neck_fretlss01_d.dds`
				material = cab_neck_fretless01_neck
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/cab_nek_tribal2_f.img`
						flags = 4
					}
				]
				$car_rocker_bass_factoredglobal_65
			}
		]
	}
	{
		desc_id = cab_neck_bfretlss02
		frontend_desc = qs(0x6770969e)
		mesh = 'models/CAR_Instruments/Bass/CAB_Neck_BFretlss02.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_nekf_ebony01.dds'
				material = cab_neck_fretless02_neck
				$car_rocker_bass_factoredglobal_0
				$car_rocker_bass_factoredglobal_66
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/cab_nekf_ebony01.dds`
				material = cab_neck_fretless02_neck
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/cab_nek_vinef_d_ds.img`
						flags = 4
					}
				]
				$car_rocker_bass_factoredglobal_65
			}
		]
	}
]
cas_bass_pickguards = [
	{
		desc_id = cab_pickg_bp1
		frontend_desc = qs(0x47d8ebde)
		mesh = 'models/CAR_Instruments/bass/CAB_PickG_BP1.skin'
		random_weight = 4.0
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_pickg_dark001.dds'
				material = cab_pickg_unos03_primary
				$car_rocker_bass_factoredglobal_0
				$car_rocker_bass_factoredglobal_67
			}
		]
	}
	{
		desc_id = cab_pickg_bp2
		frontend_desc = qs(0x4b734591)
		mesh = 'models/CAR_Instruments/bass/CAB_PickG_BP2.skin'
		random_weight = 4.0
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_pickg_dark001.dds'
				material = cab_pickg_unos03_primary
				$car_rocker_bass_factoredglobal_0
				$car_rocker_bass_factoredglobal_67
			}
		]
	}
	{
		desc_id = cab_pickg_bp3
		frontend_desc = qs(0xb0d455bb)
		mesh = 'models/CAR_Instruments/bass/CAB_PickG_BP3.skin'
		random_weight = 2.0
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_pickg02_bp1b.dds'
				material = cab_pickg_bp3_primary
				$car_rocker_bass_factoredglobal_0
				$car_rocker_bass_factoredglobal_67
			}
		]
	}
	{
		desc_id = cab_pguard_sting
		frontend_desc = qs(0x3456e0d6)
		mesh = 'models/CAR_Instruments/bass/Cab_PGuard_Sting.skin'
		random_weight = 4.0
		$car_rocker_bass_factoredglobal_68
	}
	{
		desc_id = cab_pickg_e1
		frontend_desc = qs(0xb54cc0ea)
		mesh = 'models/CAR_Instruments/bass/CAB_PickG_E1.skin'
		random_weight = 10.0
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_pickg02_bp1b.dds'
				material = cab_pickg_bp3_primary
				$car_rocker_bass_factoredglobal_0
				$car_rocker_bass_factoredglobal_67
			}
		]
	}
	{
		desc_id = cab_phnq_pg001
		frontend_desc = qs(0x3996c51e)
		mesh = 'models/CAR_Instruments/bass/CAB_Phnq_PG001.skin'
		random_weight = 3.0
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_phnq_pg002.dds'
				material = cab_phnq_pg001_primary
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_pg_phunq01
			}
		]
	}
	{
		desc_id = cab_phnq_pg002
		frontend_desc = qs(0xc7e308c6)
		mesh = 'models/CAR_Instruments/bass/CAB_Phnq_PG002.skin'
		random_weight = 5.0
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_phnq_pg001b.dds'
				material = cab_phnq_pg002_primary
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_pg_phunq02
			}
		]
	}
	{
		desc_id = cab_phnq_pg003
		frontend_desc = qs(0x609a910e)
		mesh = 'models/CAR_Instruments/bass/CAB_Phnq_PG003.skin'
		random_weight = 7.0
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_phnq_pg003.dds'
				material = cab_phnq_pg003_primary
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_pg_phunq03
			}
		]
	}
	{
		desc_id = cab_pgard_grmbl01
		frontend_desc = qs(0xfd07865b)
		mesh = 'models/CAR_Instruments/bass/CAB_PGard_Grmbl01.skin'
		random_weight = 4.0
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_pickg_grmbl01.dds'
				material = cab_pgard_grmbl01_primary
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_pgrd_grumbel01
			}
		]
	}
	{
		desc_id = cab_pgard_grmbl02
		frontend_desc = qs(0x7c2fabc1)
		mesh = 'models/CAR_Instruments/bass/CAB_PGard_Grmbl04.skin'
		random_weight = 7.0
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_pickg_grmbl04.dds'
				material = cab_pgard_grmbl04_primary
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_pgrd_grumbel02
			}
		]
	}
	{
		desc_id = cab_pgard_grmbl03
		frontend_desc = qs(0xb25e140c)
		mesh = 'models/CAR_Instruments/bass/CAB_PGard_Grmbl05.skin'
		random_weight = 2.0
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_pickg_grmbl05.dds'
				material = cab_pgard_grmbl05_primary
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_pgrd_grumbel03
			}
		]
	}
	{
		desc_id = cab_pickg_f1
		frontend_desc = qs(0xde96e992)
		mesh = 'models/CAR_Instruments/bass/CAB_PickG_F3.skin'
		random_weight = 5.0
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_pickg_f3_d_mls.dds'
				material = cab_pickg_f3_primary
				$car_rocker_bass_factoredglobal_0
				$car_rocker_bass_factoredglobal_75
			}
		]
	}
	{
		desc_id = cab_pickg_f2
		frontend_desc = qs(0xcf3fb507)
		mesh = 'models/CAR_Instruments/bass/CAB_PickG_F2.skin'
		random_weight = 5.0
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_pickg_f1_d_mls.dds'
				material = cab_pickg_f1_primary
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_hack_pgrd02
			}
		]
	}
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
				$car_rocker_bass_factoredglobal_75
			}
		]
	}
	{
		desc_id = cab_pg_pred01
		frontend_desc = qs(0x1572e7a0)
		mesh = 'models/CAR_Instruments/bass/CAB_PG_Pred01.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_pickg01_d_mls.dds'
				material = gtr_body16_pickgrd_01_primary
				$car_rocker_bass_factoredglobal_0
				$car_rocker_bass_factoredglobal_77
			}
		]
	}
	{
		desc_id = cab_pg_pred02
		frontend_desc = qs(0x4f69a6d4)
		mesh = 'models/CAR_Instruments/Bass/CAB_PG_Pred02.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_pickg02_d_mls.dds'
				material = gtr_body16_pickgrd_02_primary
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr16_pickgrd02
			}
		]
	}
	{
		desc_id = cab_pg_pred03
		frontend_desc = qs(0xcc7fc4ba)
		mesh = 'models/CAR_Instruments/Bass/CAB_PG_Pred03.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_pickg03_d_mls.dds'
				material = gtr_body16_pickgrd_03_primary
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_gtr16_pickgrd03
			}
		]
	}
	{
		desc_id = gtr_body16_pickg04
		frontend_desc = qs(0x9c1b5214)
		mesh = 'models/CAR_Instruments/Guitar/CAG_PGard_Prdiktr04.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_pickg01_d_mls.dds'
				material = gtr_body16_pickgrd_01_primary
				$car_rocker_bass_factoredglobal_0
				$car_rocker_bass_factoredglobal_77
			}
		]
	}
	{
		desc_id = cab_pguardchndr01
		frontend_desc = qs(0xd17772f8)
		mesh = 'models/CAR_Instruments/bass/CAB_PGuardChndr01.skin'
		random_weight = 5.0
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_pickg_grmbl02.dds'
				material = cab_pickg_chndblk_primary
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_pguardchndr01
			}
		]
	}
	{
		desc_id = cab_pguardchndr04
		frontend_desc = qs(0x51e118f0)
		mesh = 'models/CAR_Instruments/bass/CAB_PGuardChndr04.skin'
		random_weight = 5.0
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_pickgchndr02_d_mls.dds'
				material = cab_pguardchndr05_primary
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_pguardchndr05
			}
		]
	}
	{
		desc_id = cab_pguardchndr06
		frontend_desc = qs(0xded717ce)
		mesh = 'models/CAR_Instruments/bass/CAB_PGARD_Chnder06.skin'
		random_weight = 5.0
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_pguardchndr06.dds'
				material = cab_pguardchndr06_primary
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_pguardchndr06
			}
		]
	}
	{
		desc_id = cab_pguardchndr07
		frontend_desc = qs(0xa617e9c4)
		mesh = 'models/CAR_Instruments/bass/CAB_PGARD_Chnder07.skin'
		random_weight = 5.0
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_pguardchndr07.dds'
				material = cab_pgard_chundr_07_primary
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_pguardchndr07
			}
		]
	}
	{
		desc_id = cab_pickg_b_unos01
		frontend_desc = qs(0x69436617)
		mesh = 'models/CAR_Instruments/bass/CAB_PickG_B_Unos01.skin'
		random_weight = 5.0
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_pickg_dark001.dds'
				material = cab_pickg_unos02_primary
				$car_rocker_bass_factoredglobal_0
				$car_rocker_bass_factoredglobal_84
			}
		]
	}
	{
		desc_id = cab_pickg_b_unos02
		frontend_desc = qs(0x39e71cf0)
		mesh = 'models/CAR_Instruments/bass/CAB_PickG_B_Unos02.skin'
		random_weight = 5.0
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_pickg_dark001.dds'
				material = cab_pickg_unos02_primary
				$car_rocker_bass_factoredglobal_0
				$car_rocker_bass_factoredglobal_84
			}
		]
	}
	{
		desc_id = cab_pickg_b_unos03
		frontend_desc = qs(0x9915e856)
		mesh = 'models/CAR_Instruments/bass/CAB_PickG_B_Unos03.skin'
		random_weight = 5.0
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_pickg_dark001.dds'
				material = cab_pickg_unos02_primary
				$car_rocker_bass_factoredglobal_0
				$car_rocker_bass_factoredglobal_84
			}
		]
	}
	{
		desc_id = cab_pickg_b_unos05
		frontend_desc = qs(0xa1890d48)
		mesh = 'models/CAR_Instruments/bass/CAB_PickG_B_Unos05.skin'
		random_weight = 5.0
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_pickg_dark001.dds'
				material = cab_pickg_unos02_primary
				$car_rocker_bass_factoredglobal_0
				$car_rocker_bass_factoredglobal_84
			}
		]
	}
	{
		desc_id = cab_pgrdfts001
		frontend_desc = qs(0x50fb590b)
		mesh = 'models/CAR_Instruments/bass/CAB_PGrdFts001.skin'
		random_weight = 3.0
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_pgrdfts005b.dds'
				material = cab_pgrdfts001b_primary
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_fts_pickguard01
			}
		]
	}
	{
		desc_id = cab_pgrdftsb
		frontend_desc = qs(0x7bd60ac8)
		mesh = 'models/CAR_Instruments/bass/CAB_PGrdFtsB.skin'
		random_weight = 5.0
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_pgrdftsb001b.dds'
				material = cab_pgrdftsb002b_primary
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_fts_pickguard02
			}
		]
	}
	{
		desc_id = cab_pgrdftsc
		frontend_desc = qs(0x62cd3b89)
		mesh = 'models/CAR_Instruments/bass/CAB_PGrdFtsC.skin'
		random_weight = 2.0
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_pgrdftsc001b.dds'
				material = cab_pgrdftsb001b_primary
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_fts_pickguard03
			}
		]
	}
	{
		desc_id = cab_pg_spyt001
		frontend_desc = qs(0x6a75bd8d)
		mesh = 'models/CAR_Instruments/bass/CAB_PG_Spyt001.skin'
		random_weight = 5.0
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_pg_spyt001c.dds'
				material = cab_pg_spyt001c_primary
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_pg_spyt01
			}
		]
	}
	{
		desc_id = cab_pg_spyt002
		frontend_desc = qs(0x5d63ae7f)
		mesh = 'models/CAR_Instruments/bass/CAB_PG_Spyt002.skin'
		random_weight = 5.0
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_pg_spyt002b.dds'
				material = cab_pg_spyt002b_primary
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_pg_spyt02
			}
		]
	}
	{
		desc_id = cab_pg_spyt003
		frontend_desc = qs(0x5e220d48)
		mesh = 'models/CAR_Instruments/bass/CAB_PG_Spyt003.skin'
		random_weight = 5.0
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_pg_spyt003.dds'
				material = cab_pg_spyt003_primary
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_pg_spyt03
			}
		]
	}
	{
		desc_id = cab_pg_spyt004
		frontend_desc = qs(0xb2f9833f)
		mesh = 'models/CAR_Instruments/bass/CAB_PG_Spyt004.skin'
		random_weight = 5.0
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_pg_spyt004.dds'
				material = cab_pg_spyt004_primary
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_pg_spyt04
			}
		]
	}
	{
		desc_id = cab_pg_6tz001
		frontend_desc = qs(0xe7bea1ac)
		mesh = 'models/CAR_Instruments/bass/CAB_PG_6TZ001.skin'
		random_weight = 5.0
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_pg_6tz005.dds'
				material = cab_pickg_6tz005_primary
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_pg_6tz001
			}
		]
	}
	{
		desc_id = cab_pg_6tz002
		frontend_desc = qs(0x90bd7d30)
		mesh = 'models/CAR_Instruments/bass/CAB_PG_6TZ002.skin'
		random_weight = 5.0
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_pg_6tz006.dds'
				material = cab_pg_6tz006_primary
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_pg_6tz002
			}
		]
	}
	{
		desc_id = cab_pg_6tz004
		frontend_desc = qs(0x308171a6)
		mesh = 'models/CAR_Instruments/bass/CAB_PG_6TZ004.skin'
		random_weight = 5.0
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_pg_6tz008.dds'
				material = cab_pg_6tz008_primary
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_pg_6tz003
			}
		]
	}
	{
		desc_id = cab_pg_xrend001
		frontend_desc = qs(0x47dd37dc)
		mesh = 'models/CAR_Instruments/bass/CAB_PG_Xrend001.skin'
		random_weight = 5.0
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_pg_xrend004.dds'
				material = cab_pg_xrend004_primary
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_pg_xrend01
			}
		]
	}
	{
		desc_id = cab_pg_xrend002
		frontend_desc = qs(0x3af7e76a)
		mesh = 'models/CAR_Instruments/bass/CAB_PG_Xrend002.skin'
		random_weight = 5.0
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_pg_xrend005.dds'
				material = cab_pg_xrend005_primary
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_pg_xrend02
			}
		]
	}
	{
		desc_id = cab_pg_xrend003
		frontend_desc = qs(0x90c5f15f)
		mesh = 'models/CAR_Instruments/bass/CAB_PG_Xrend003.skin'
		random_weight = 5.0
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_pg_xrend006.dds'
				material = cab_pg_xrend006_primary
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_pg_xrend03
			}
		]
	}
	{
		desc_id = None
		frontend_desc = qs(0x9c1b5214)
		random_weight = 10.0
	}
]
cas_bass_pickups = [
	{
		desc_id = cab_pickups_bp1a
		frontend_desc = qs(0x56a34bc3)
		mesh = 'models/CAR_Instruments/Bass/CAB_Pickups_BP1A2.skin'
	}
	{
		desc_id = cab_pickups_bp1a2
		frontend_desc = qs(0x7d8e1800)
		mesh = 'models/CAR_Instruments/Bass/CAB_Pickups_BP1A.skin'
	}
	{
		desc_id = cab_pickups_bp1a3
		frontend_desc = qs(0x4fb87a82)
		mesh = 'models/CAR_Instruments/Bass/CAB_Pickups_BP1A3.skin'
	}
	{
		desc_id = cab_jbass_pickup_01
		frontend_desc = qs(0x00530560)
		mesh = 'models/CAR_Instruments/Bass/CAB_Jbass_pickup_01.skin'
	}
	{
		desc_id = cab_pbass_pickup_a
		frontend_desc = qs(0xadaf92c1)
		mesh = 'models/CAR_Instruments/Bass/CAB_PBass_Pickup_A.skin'
	}
	{
		desc_id = cab_jp_pickup_a
		frontend_desc = qs(0xfe1af80f)
		mesh = 'models/CAR_Instruments/Bass/CAB_JP_Pickup_A.skin'
	}
	{
		desc_id = cab_jp_pickup_b
		frontend_desc = qs(0xc58df42c)
		mesh = 'models/CAR_Instruments/Bass/CAB_JP_Pickup_B.skin'
	}
	{
		desc_id = cab_bumbl_pickup_a1
		frontend_desc = qs(0xd5c68f57)
		mesh = 'models/CAR_Instruments/Bass/CAB_Bumbl_pickup_A1.skin'
	}
	{
		desc_id = cab_bumbl_pickup_a2
		frontend_desc = qs(0x735492b8)
		mesh = 'models/CAR_Instruments/Bass/CAB_Bumbl_pickup_A2.skin'
	}
	{
		desc_id = cab_bumbl_pickup_a3
		frontend_desc = qs(0x94ad8cab)
		mesh = 'models/CAR_Instruments/Bass/CAB_Bumbl_pickup_A3.skin'
	}
	{
		desc_id = cab_pickups_emg01
		frontend_desc = qs(0x87a3a2db)
		mesh = 'models/CAR_Instruments/Bass/CAB_pickups_EMG01.skin'
	}
	{
		desc_id = cab_pickups_emg02
		frontend_desc = qs(0x83216a21)
		mesh = 'models/CAR_Instruments/Bass/CAB_pickups_EMG02.skin'
	}
	{
		desc_id = cab_pickups_emg03
		frontend_desc = qs(0x38630a71)
		mesh = 'models/CAR_Instruments/Bass/CAB_pickups_EMG03.skin'
	}
	{
		desc_id = cab_hbuck_pickup_a1
		frontend_desc = qs(0x16ec1303)
		mesh = 'models/CAR_Instruments/Bass/CAB_HBuck_pickup_A1.skin'
	}
	{
		desc_id = cab_hbuck_pickup_a2
		frontend_desc = qs(0x1843bc21)
		mesh = 'models/CAR_Instruments/Bass/CAB_HBuck_pickup_A2.skin'
	}
	{
		desc_id = cab_hbuck_pickup_a3
		frontend_desc = qs(0x21117e0a)
		mesh = 'models/CAR_Instruments/Bass/CAB_HBuck_pickup_A3.skin'
	}
	{
		desc_id = cab_pickup_hack01
		frontend_desc = qs(0x6b38cdfd)
		mesh = 'models/CAR_Instruments/Bass/CAB_pickup_Hack01.skin'
	}
	{
		desc_id = cab_pickup_hack02
		frontend_desc = qs(0x98f69ecd)
		mesh = 'models/CAR_Instruments/Bass/CAB_pickup_Hack02.skin'
	}
	{
		desc_id = cab_pickup_hack03
		frontend_desc = qs(0x71042d73)
		mesh = 'models/CAR_Instruments/Bass/CAB_pickup_Hack03.skin'
	}
	{
		desc_id = cab_pickup_sting
		frontend_desc = qs(0x692d8f73)
		mesh = 'models/CAR_Instruments/Bass/CAB_pickup_Sting.skin'
		$car_rocker_bass_factoredglobal_68
	}
]
cas_bass_knobs = [
	{
		desc_id = cab_knobs_6tz01
		frontend_desc = qs(0x43e25eb2)
		mesh = 'models/CAR_Instruments/bass/CAB_Knobs_6TZ01.skin'
		materials = [
			cab_knobs_6tz01_primary
		]
	}
	{
		desc_id = cab_knobs_6tz02
		frontend_desc = qs(0x68cf0d71)
		mesh = 'models/CAR_Instruments/bass/CAB_Knobs_6TZ02.skin'
		materials = [
			cab_knob_star01_primary
		]
	}
	{
		desc_id = cab_knobs_6tz03
		frontend_desc = qs(0x71d43c30)
		mesh = 'models/CAR_Instruments/bass/CAB_Knobs_6TZ03.skin'
		materials = [
			cab_knobs_spd_blak_primary
		]
	}
	{
		desc_id = cab_knobs_6tz04
		frontend_desc = qs(0x3e95aaf7)
		mesh = 'models/CAR_Instruments/bass/CAB_Knobs_6TZ04.skin'
		materials = [
			cab_knobs_knurl01_primary
		]
	}
	{
		desc_id = cab_knobs_6tz05
		frontend_desc = qs(0x278e9bb6)
		mesh = 'models/CAR_Instruments/bass/CAB_Knobs_6TZ05.skin'
		materials = [
			cab_knobs_jbass01_primary
		]
	}
	{
		desc_id = cab_knobs_6tz06
		frontend_desc = qs(0x0ca3c875)
		mesh = 'models/CAR_Instruments/bass/CAB_Knobs_6TZ06.skin'
		materials = [
			cab_knobs_hack001_primary
		]
	}
	{
		desc_id = cab_knobs_6tz07
		frontend_desc = qs(0x15b8f934)
		mesh = 'models/CAR_Instruments/bass/CAB_Knobs_6TZ07.skin'
		materials = [
			gtr_knob_type6_01_primary
		]
	}
	{
		desc_id = cab_knobs_6tz08
		frontend_desc = qs(0x9220e5fb)
		mesh = 'models/CAR_Instruments/bass/CAB_Knobs_6TZ08.skin'
		materials = [
			gtr_knob_type1_01_primary
		]
	}
	{
		desc_id = cab_knobs_6tz09
		frontend_desc = qs(0xa0168779)
		mesh = 'models/CAR_Instruments/bass/CAB_Knobs_6TZ09.skin'
		materials = [
			gtr_knob_type10_01_primary
		]
	}
	{
		desc_id = cab_knobs_6tz10
		frontend_desc = qs(0xb90db638)
		mesh = 'models/CAR_Instruments/bass/CAB_Knobs_6TZ10.skin'
		materials = [
			gtr_knob_type2_01_primary
		]
	}
	{
		desc_id = cab_knob_spyt01
		frontend_desc = qs(0x15d5ae59)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Spyt01.skin'
		materials = [
			cab_knob_star01_primary
		]
	}
	{
		desc_id = cab_knob_spyt02
		frontend_desc = qs(0xfb65ed9e)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Spyt02.skin'
		materials = [
			cab_knobs_spd_blak_primary
		]
	}
	{
		desc_id = cab_knob_spyt03
		frontend_desc = qs(0xc9dd4fa1)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Spyt03.skin'
		materials = [
			cab_knobs_hack001_primary
		]
	}
	{
		desc_id = cab_knob_spyt04
		frontend_desc = qs(0xdcfc89d2)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Spyt04.skin'
		materials = [
			cab_knobs_knurl01_primary
		]
	}
	{
		desc_id = cab_knob_spyt05
		frontend_desc = qs(0xe2ffc82e)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Spyt05.skin'
		materials = [
			cab_knobs_6tz01_primary
		]
	}
	{
		desc_id = cab_knob_spyt06
		frontend_desc = qs(0xa433a9e0)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Spyt06.skin'
		materials = [
			gtr_knob_type6_01_primary
		]
	}
	{
		desc_id = cab_knob_spyt07
		frontend_desc = qs(0xf7d1da11)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Spyt07.skin'
		materials = [
			gtr_knob_type10_01_primary
		]
	}
	{
		desc_id = cab_knob_spyt08
		frontend_desc = qs(0x33b69b11)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Spyt08.skin'
		materials = [
			cab_knobs_jbass01_primary
		]
	}
	{
		desc_id = cab_knob_spyt09
		frontend_desc = qs(0x4938994c)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Spyt09.skin'
		materials = [
			gtr_knob_type1_01_primary
		]
	}
	{
		desc_id = cab_knob_spyt10
		frontend_desc = qs(0xd7a6d9b7)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Spyt10.skin'
		materials = [
			gtr_knob_type2_01_primary
		]
	}
	{
		desc_id = cab_knob_xrend01
		frontend_desc = qs(0xaf972615)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_XRend01.skin'
		materials = [
			cab_knobs_hack001_primary
		]
	}
	{
		desc_id = cab_knob_xrend02
		frontend_desc = qs(0xec54f9d3)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_XRend02.skin'
		materials = [
			cab_knob_star01_primary
		]
	}
	{
		desc_id = cab_knob_xrend03
		frontend_desc = qs(0xbdf0bd59)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_XRend03.skin'
		materials = [
			cab_knobs_spd_blak_primary
		]
	}
	{
		desc_id = cab_knob_xrend04
		frontend_desc = qs(0xd3ccbd55)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_XRend04.skin'
		materials = [
			cab_knobs_jbass01_primary
		]
	}
	{
		desc_id = cab_knob_xrend05
		frontend_desc = qs(0x9efef592)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_XRend05.skin'
		materials = [
			cab_knobs_knurl01_primary
		]
	}
	{
		desc_id = cab_knob_xrend06
		frontend_desc = qs(0x9d6bd1bd)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_XRend06.skin'
		materials = [
			cab_knobs_6tz01_primary
		]
	}
	{
		desc_id = cab_knob_xrend07
		frontend_desc = qs(0xa433a9e0)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_XRend07.skin'
		materials = [
			gtr_knob_type6_01_primary
		]
	}
	{
		desc_id = cab_knob_xrend08
		frontend_desc = qs(0xb5d3a651)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_XRend08.skin'
		materials = [
			gtr_knob_type10_01_primary
		]
	}
	{
		desc_id = cab_knob_xrend09
		frontend_desc = qs(0x69bab14e)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_XRend09.skin'
		materials = [
			gtr_knob_type1_01_primary
		]
	}
	{
		desc_id = cab_knob_xrend10
		frontend_desc = qs(0x8f2cae0b)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_XRend10.skin'
		materials = [
			gtr_knob_type2_01_primary
		]
	}
	{
		desc_id = cab_knob_unos01
		frontend_desc = qs(0xaf972615)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Unos01.skin'
		materials = [
			cab_knobs_hack001_primary
		]
	}
	{
		desc_id = cab_knob_unos02
		frontend_desc = qs(0xec54f9d3)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Unos02.skin'
		materials = [
			cab_knob_star01_primary
		]
	}
	{
		desc_id = cab_knob_unos03
		frontend_desc = qs(0xbdf0bd59)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Unos03.skin'
		materials = [
			cab_knobs_spd_blak_primary
		]
	}
	{
		desc_id = cab_knob_unos04
		frontend_desc = qs(0xd3ccbd55)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Unos04.skin'
		materials = [
			cab_knobs_jbass01_primary
		]
	}
	{
		desc_id = cab_knob_unos05
		frontend_desc = qs(0x9efef592)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Unos05.skin'
		materials = [
			cab_knobs_knurl01_primary
		]
	}
	{
		desc_id = cab_knob_unos06
		frontend_desc = qs(0x9d6bd1bd)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Unos06.skin'
		materials = [
			cab_knobs_6tz01_primary
		]
	}
	{
		desc_id = cab_knob_unos07
		frontend_desc = qs(0xa433a9e0)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Unos07.skin'
		materials = [
			gtr_knob_type6_01_primary
		]
	}
	{
		desc_id = cab_knob_unos08
		frontend_desc = qs(0xb5d3a651)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Unos08.skin'
		materials = [
			gtr_knob_type10_01_primary
		]
	}
	{
		desc_id = cab_knob_unos09
		frontend_desc = qs(0x69bab14e)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Unos09.skin'
		materials = [
			gtr_knob_type1_01_primary
		]
	}
	{
		desc_id = cab_knob_unos10
		frontend_desc = qs(0x8f2cae0b)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Unos10.skin'
		materials = [
			gtr_knob_type2_01_primary
		]
	}
	{
		desc_id = cab_knob_hack01
		frontend_desc = qs(0xaf972615)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Hack01.skin'
		materials = [
			cab_knobs_hack001_primary
		]
	}
	{
		desc_id = cab_knob_hack02
		frontend_desc = qs(0xec54f9d3)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Hack02.skin'
		materials = [
			cab_knob_star01_primary
		]
	}
	{
		desc_id = cab_knob_hack03
		frontend_desc = qs(0x20545663)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Hack03.skin'
		materials = [
			cab_knobs_spd_blak_primary
		]
	}
	{
		desc_id = cab_knob_hack04
		frontend_desc = qs(0xd3ccbd55)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Hack04.skin'
		materials = [
			cab_knobs_jbass01_primary
		]
	}
	{
		desc_id = cab_knob_hack05
		frontend_desc = qs(0x9efef592)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Hack05.skin'
		materials = [
			cab_knobs_knurl01_primary
		]
	}
	{
		desc_id = cab_knob_hack06
		frontend_desc = qs(0x9d6bd1bd)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Hack06.skin'
		materials = [
			cab_knobs_6tz01_primary
		]
	}
	{
		desc_id = cab_knob_hack07
		frontend_desc = qs(0xa433a9e0)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Hack07.skin'
		materials = [
			gtr_knob_type6_01_primary
		]
	}
	{
		desc_id = cab_knob_hack08
		frontend_desc = qs(0xb5d3a651)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Hack08.skin'
		materials = [
			gtr_knob_type10_01_primary
		]
	}
	{
		desc_id = cab_knob_hack09
		frontend_desc = qs(0x69bab14e)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Hack09.skin'
		materials = [
			gtr_knob_type1_01_primary
		]
	}
	{
		desc_id = cab_knob_hack10
		frontend_desc = qs(0x8f2cae0b)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Hack10.skin'
		materials = [
			gtr_knob_type2_01_primary
		]
	}
	{
		desc_id = cab_knob_chndr01
		frontend_desc = qs(0xaf972615)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Chndr01.skin'
		materials = [
			cab_knobs_hack001_primary
		]
	}
	{
		desc_id = cab_knob_chndr02
		frontend_desc = qs(0xec54f9d3)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Chndr02.skin'
		materials = [
			cab_knob_star01_primary
		]
	}
	{
		desc_id = cab_knob_chndr03
		frontend_desc = qs(0x20545663)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Chndr03.skin'
		materials = [
			cab_knobs_spd_blak_primary
		]
	}
	{
		desc_id = cab_knob_chndr04
		frontend_desc = qs(0xd3ccbd55)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Chndr04.skin'
		materials = [
			cab_knobs_jbass01_primary
		]
	}
	{
		desc_id = cab_knob_chndr05
		frontend_desc = qs(0x9efef592)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Chndr05.skin'
		materials = [
			cab_knobs_knurl01_primary
		]
	}
	{
		desc_id = cab_knob_chndr06
		frontend_desc = qs(0x9d6bd1bd)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Chndr06.skin'
		materials = [
			cab_knobs_6tz01_primary
		]
	}
	{
		desc_id = cab_knob_chndr07
		frontend_desc = qs(0xa433a9e0)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Chndr07.skin'
		materials = [
			gtr_knob_type6_01_primary
		]
	}
	{
		desc_id = cab_knob_chndr08
		frontend_desc = qs(0xb5d3a651)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Chndr08.skin'
		materials = [
			gtr_knob_type10_01_primary
		]
	}
	{
		desc_id = cab_knob_chndr09
		frontend_desc = qs(0x69bab14e)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Chndr09.skin'
		materials = [
			gtr_knob_type1_01_primary
		]
	}
	{
		desc_id = cab_knob_chndr10
		frontend_desc = qs(0x8f2cae0b)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Chndr10.skin'
		materials = [
			gtr_knob_type2_01_primary
		]
	}
	{
		desc_id = cab_knob_foots01
		frontend_desc = qs(0xaf972615)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Foots01.skin'
		materials = [
			cab_knobs_hack001_primary
		]
	}
	{
		desc_id = cab_knob_foots02
		frontend_desc = qs(0xec54f9d3)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Foots02.skin'
		materials = [
			cab_knob_star01_primary
		]
	}
	{
		desc_id = cab_knob_foots03
		frontend_desc = qs(0x20545663)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Foots03.skin'
		materials = [
			cab_knobs_spd_blak_primary
		]
	}
	{
		desc_id = cab_knob_foots04
		frontend_desc = qs(0xd3ccbd55)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Foots04.skin'
		materials = [
			cab_knobs_jbass01_primary
		]
	}
	{
		desc_id = cab_knob_foots05
		frontend_desc = qs(0x9efef592)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Foots05.skin'
		materials = [
			cab_knobs_knurl01_primary
		]
	}
	{
		desc_id = cab_knob_foots06
		frontend_desc = qs(0x9d6bd1bd)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Foots06.skin'
		materials = [
			cab_knobs_6tz01_primary
		]
	}
	{
		desc_id = cab_knob_foots07
		frontend_desc = qs(0xa433a9e0)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Foots07.skin'
		materials = [
			gtr_knob_type6_01_primary
		]
	}
	{
		desc_id = cab_knob_foots08
		frontend_desc = qs(0xb5d3a651)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Foots08.skin'
		materials = [
			gtr_knob_type10_01_primary
		]
	}
	{
		desc_id = cab_knob_foots09
		frontend_desc = qs(0x69bab14e)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Foots09.skin'
		materials = [
			gtr_knob_type1_01_primary
		]
	}
	{
		desc_id = cab_knob_foots10
		frontend_desc = qs(0x8f2cae0b)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Foots10.skin'
		materials = [
			gtr_knob_type2_01_primary
		]
	}
	{
		desc_id = cab_knob_grmbl01
		frontend_desc = qs(0xaf972615)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Grmbl01.skin'
		materials = [
			cab_knobs_hack001_primary
		]
	}
	{
		desc_id = cab_knob_grmbl02
		frontend_desc = qs(0xec54f9d3)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Grmbl02.skin'
		materials = [
			cab_knob_star01_primary
		]
	}
	{
		desc_id = cab_knob_grmbl03
		frontend_desc = qs(0x20545663)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Grmbl03.skin'
		materials = [
			cab_knobs_spd_blak_primary
		]
	}
	{
		desc_id = cab_knob_grmbl04
		frontend_desc = qs(0xd3ccbd55)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Grmbl04.skin'
		materials = [
			cab_knobs_jbass01_primary
		]
	}
	{
		desc_id = cab_knob_grmbl05
		frontend_desc = qs(0x9efef592)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Grmbl05.skin'
		materials = [
			cab_knobs_knurl01_primary
		]
	}
	{
		desc_id = cab_knob_grmbl06
		frontend_desc = qs(0x9d6bd1bd)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Grmbl06.skin'
		materials = [
			cab_knobs_6tz01_primary
		]
	}
	{
		desc_id = cab_knob_grmbl07
		frontend_desc = qs(0xa433a9e0)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Grmbl07.skin'
		materials = [
			gtr_knob_type6_01_primary
		]
	}
	{
		desc_id = cab_knob_grmbl08
		frontend_desc = qs(0xb5d3a651)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Grmbl08.skin'
		materials = [
			gtr_knob_type10_01_primary
		]
	}
	{
		desc_id = cab_knob_grmbl09
		frontend_desc = qs(0x69bab14e)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Grmbl09.skin'
		materials = [
			gtr_knob_type1_01_primary
		]
	}
	{
		desc_id = cab_knob_grmbl10
		frontend_desc = qs(0x8f2cae0b)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Grmbl10.skin'
		materials = [
			gtr_knob_type2_01_primary
		]
	}
	{
		desc_id = cab_knob_phunq01
		frontend_desc = qs(0xaf972615)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Phunq01.skin'
		materials = [
			cab_knobs_hack001_primary
		]
	}
	{
		desc_id = cab_knob_phunq02
		frontend_desc = qs(0xec54f9d3)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_phunq02.skin'
		materials = [
			cab_knob_star01_primary
		]
	}
	{
		desc_id = cab_knob_phunq03
		frontend_desc = qs(0x20545663)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_phunq03.skin'
		materials = [
			cab_knobs_spd_blak_primary
		]
	}
	{
		desc_id = cab_knob_phunq04
		frontend_desc = qs(0xd3ccbd55)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_phunq04.skin'
		materials = [
			cab_knobs_jbass01_primary
		]
	}
	{
		desc_id = cab_knob_phunq05
		frontend_desc = qs(0x9efef592)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_phunq05.skin'
		materials = [
			cab_knobs_knurl01_primary
		]
	}
	{
		desc_id = cab_knob_phunq06
		frontend_desc = qs(0x9d6bd1bd)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_phunq06.skin'
		materials = [
			cab_knobs_6tz01_primary
		]
	}
	{
		desc_id = cab_knob_phunq07
		frontend_desc = qs(0xa433a9e0)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_phunq07.skin'
		materials = [
			gtr_knob_type6_01_primary
		]
	}
	{
		desc_id = cab_knob_phunq08
		frontend_desc = qs(0xb5d3a651)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_phunq08.skin'
		materials = [
			gtr_knob_type10_01_primary
		]
	}
	{
		desc_id = cab_knob_phunq09
		frontend_desc = qs(0x69bab14e)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_phunq09.skin'
		materials = [
			gtr_knob_type1_01_primary
		]
	}
	{
		desc_id = cab_knob_phunq10
		frontend_desc = qs(0x8f2cae0b)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_phunq10.skin'
		materials = [
			gtr_knob_type2_01_primary
		]
	}
	{
		desc_id = cab_knob_skull01
		frontend_desc = qs(0xaf972615)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_skull01.skin'
		materials = [
			cab_knobs_hack001_primary
		]
	}
	{
		desc_id = cab_knob_skull02
		frontend_desc = qs(0xec54f9d3)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_skull02.skin'
		materials = [
			cab_knob_star01_primary
		]
	}
	{
		desc_id = cab_knob_skull03
		frontend_desc = qs(0x20545663)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_skull03.skin'
		materials = [
			cab_knobs_spd_blak_primary
		]
	}
	{
		desc_id = cab_knob_skull04
		frontend_desc = qs(0xd3ccbd55)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_skull04.skin'
		materials = [
			cab_knobs_jbass01_primary
		]
	}
	{
		desc_id = cab_knob_skull05
		frontend_desc = qs(0x9efef592)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_skull05.skin'
		materials = [
			cab_knobs_knurl01_primary
		]
	}
	{
		desc_id = cab_knob_skull06
		frontend_desc = qs(0x9d6bd1bd)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_skull06.skin'
		materials = [
			cab_knobs_6tz01_primary
		]
	}
	{
		desc_id = cab_knob_skull07
		frontend_desc = qs(0xa433a9e0)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_skull07.skin'
		materials = [
			gtr_knob_type6_01_primary
		]
	}
	{
		desc_id = cab_knob_skull08
		frontend_desc = qs(0xb5d3a651)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_skull08.skin'
		materials = [
			gtr_knob_type10_01_primary
		]
	}
	{
		desc_id = cab_knob_skull09
		frontend_desc = qs(0x69bab14e)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_skull09.skin'
		materials = [
			gtr_knob_type1_01_primary
		]
	}
	{
		desc_id = cab_knob_skull10
		frontend_desc = qs(0x8f2cae0b)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_skull10.skin'
		materials = [
			gtr_knob_type2_01_primary
		]
	}
	{
		desc_id = cab_knob_rubyat01
		frontend_desc = qs(0xaf972615)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Rubyat01.skin'
		materials = [
			cab_knobs_hack001_primary
		]
	}
	{
		desc_id = cab_knob_rubyat02
		frontend_desc = qs(0xec54f9d3)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Rubyat02.skin'
		materials = [
			cab_knob_star01_primary
		]
	}
	{
		desc_id = cab_knob_rubyat03
		frontend_desc = qs(0x20545663)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Rubyat03.skin'
		materials = [
			cab_knobs_spd_blak_primary
		]
	}
	{
		desc_id = cab_knob_rubyat04
		frontend_desc = qs(0xd3ccbd55)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Rubyat04.skin'
		materials = [
			cab_knobs_jbass01_primary
		]
	}
	{
		desc_id = cab_knob_rubyat05
		frontend_desc = qs(0x9efef592)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Rubyat05.skin'
		materials = [
			cab_knobs_knurl01_primary
		]
	}
	{
		desc_id = cab_knob_rubyat06
		frontend_desc = qs(0x9d6bd1bd)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Rubyat06.skin'
		materials = [
			cab_knobs_6tz01_primary
		]
	}
	{
		desc_id = cab_knob_rubyat07
		frontend_desc = qs(0xa433a9e0)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Rubyat07.skin'
		materials = [
			gtr_knob_type6_01_primary
		]
	}
	{
		desc_id = cab_knob_rubyat08
		frontend_desc = qs(0xb5d3a651)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Rubyat08.skin'
		materials = [
			gtr_knob_type10_01_primary
		]
	}
	{
		desc_id = cab_knob_rubyat09
		frontend_desc = qs(0x69bab14e)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Rubyat09.skin'
		materials = [
			gtr_knob_type1_01_primary
		]
	}
	{
		desc_id = cab_knob_rubyat10
		frontend_desc = qs(0x8f2cae0b)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Rubyat10.skin'
		materials = [
			gtr_knob_type2_01_primary
		]
	}
	{
		desc_id = cab_knob_icross01
		frontend_desc = qs(0xaf972615)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_ICross01.skin'
		materials = [
			cab_knobs_hack001_primary
		]
	}
	{
		desc_id = cab_knob_icross02
		frontend_desc = qs(0xec54f9d3)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_ICross02.skin'
		materials = [
			cab_knob_star01_primary
		]
	}
	{
		desc_id = cab_knob_icross03
		frontend_desc = qs(0x20545663)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_ICross03.skin'
		materials = [
			cab_knobs_spd_blak_primary
		]
	}
	{
		desc_id = cab_knob_icross04
		frontend_desc = qs(0xd3ccbd55)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_ICross04.skin'
		materials = [
			cab_knobs_jbass01_primary
		]
	}
	{
		desc_id = cab_knob_icross05
		frontend_desc = qs(0x9efef592)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_ICross05.skin'
		materials = [
			cab_knobs_knurl01_primary
		]
	}
	{
		desc_id = cab_knob_icross06
		frontend_desc = qs(0x9d6bd1bd)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_ICross06.skin'
		materials = [
			cab_knobs_6tz01_primary
		]
	}
	{
		desc_id = cab_knob_icross07
		frontend_desc = qs(0xa433a9e0)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_ICross07.skin'
		materials = [
			gtr_knob_type6_01_primary
		]
	}
	{
		desc_id = cab_knob_icross08
		frontend_desc = qs(0xb5d3a651)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_ICross08.skin'
		materials = [
			gtr_knob_type10_01_primary
		]
	}
	{
		desc_id = cab_knob_icross09
		frontend_desc = qs(0x69bab14e)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_ICross09.skin'
		materials = [
			gtr_knob_type1_01_primary
		]
	}
	{
		desc_id = cab_knob_icross10
		frontend_desc = qs(0x8f2cae0b)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_ICross10.skin'
		materials = [
			gtr_knob_type2_01_primary
		]
	}
	{
		desc_id = cab_knob_sting
		frontend_desc = qs(0x3f91596b)
		mesh = 'models/CAR_Instruments/bass/Cab_Knob_Sting.skin'
		materials = [
			cab_knobs_knurl01_primary
		]
		$car_rocker_bass_factoredglobal_68
	}
	{
		desc_id = None
		frontend_desc = qs(0x9c1b5214)
		random_weight = 10.0
	}
]
cas_bass_bridges = [
	{
		desc_id = cab_bridge_bb1a
		frontend_desc = qs(0xd7cbdc94)
		mesh = 'models/CAR_Instruments/bass/CAB_Bridge_BB1A.skin'
		materials = [
			cab_bridge_bb1a_primary
		]
	}
	{
		desc_id = cab_bridge_bb3a
		frontend_desc = qs(0x53dfc87e)
		mesh = 'models/CAR_Instruments/bass/CAB_Bridge_BB3A.skin'
		materials = [
			cab_bridge_bb3a_primary
		]
	}
	{
		desc_id = cab_bridge_hack
		frontend_desc = qs(0x5a1a5daa)
		mesh = 'models/CAR_Instruments/bass/CAB_Bridge_Hack.skin'
		materials = [
			cab_bridge_hack_primary
		]
	}
	{
		desc_id = cab_bridge_bb2a
		frontend_desc = qs(0xe8f34bec)
		mesh = 'models/CAR_Instruments/bass/CAB_Bridge_BB2A.skin'
		materials = [
			cab_bridge_bb2a_primary
		]
	}
	{
		desc_id = cab_bridge_mls
		frontend_desc = qs(0x32fdd64d)
		mesh = 'models/CAR_Instruments/bass/CAB_Bridge_MLS.skin'
		materials = [
			cab_bridge_mls_primary
		]
	}
]
cas_bass_head = [
	{
		desc_id = cab_head_radex
		frontend_desc = qs(0x6f3ac614)
		mesh = 'models/CAR_Instruments/bass/CAB_Head_Radex.skin'
		materials = [
			cab_head_radex_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_RadEx.dds'
				material = cab_head_radex_headstock
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_head_13_finishes
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_RadEx.dds'
				material = cab_head_radex_headstock
				$car_rocker_bass_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cab_head_13_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_RadEx.dds'
				material = cab_head_radex_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_4
				$car_rocker_bass_factoredglobal_100
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_RadEx.dds'
				material = cab_head_radex_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_6
				$car_rocker_bass_factoredglobal_100
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_RadEx.dds'
				material = cab_head_radex_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_7
				$car_rocker_bass_factoredglobal_100
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_RadEx.dds'
				material = cab_head_radex_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_8
				$car_rocker_bass_factoredglobal_100
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_RadEx.dds'
				material = cab_head_radex_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_9
				$car_rocker_bass_factoredglobal_100
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_RadEx.dds'
				material = cab_head_radex_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_10
				$car_rocker_bass_factoredglobal_100
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_RadEx.dds'
				material = cab_head_radex_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_11
				$car_rocker_bass_factoredglobal_100
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_RadEx.dds'
				material = cab_head_radex_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_12
				$car_rocker_bass_factoredglobal_100
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_RadEx.dds'
				material = cab_head_radex_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_13
				$car_rocker_bass_factoredglobal_100
			}
		]
	}
	{
		desc_id = cab_head_bh1a
		frontend_desc = qs(0xd7a9261e)
		mesh = 'models/CAR_Instruments/bass/Cab_Head_BH1A.skin'
		materials = [
			cab_head_bh2a_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_01_maple_d_mls.dds'
				material = cab_head_bh2a_headstock
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_head_01_finishes
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_01_maple_d_mls.dds'
				material = cab_head_bh2a_headstock
				$car_rocker_bass_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cab_head_01_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_01_maple_d_mls.dds'
				material = cab_head_bh2a_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_4
				$car_rocker_bass_factoredglobal_103
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_01_maple_d_mls.dds'
				material = cab_head_bh2a_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_6
				$car_rocker_bass_factoredglobal_103
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_01_maple_d_mls.dds'
				material = cab_head_bh2a_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_7
				$car_rocker_bass_factoredglobal_103
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_01_maple_d_mls.dds'
				material = cab_head_bh2a_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_8
				$car_rocker_bass_factoredglobal_103
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_01_maple_d_mls.dds'
				material = cab_head_bh2a_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_9
				$car_rocker_bass_factoredglobal_103
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_01_maple_d_mls.dds'
				material = cab_head_bh2a_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_10
				$car_rocker_bass_factoredglobal_103
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_01_maple_d_mls.dds'
				material = cab_head_bh2a_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_11
				$car_rocker_bass_factoredglobal_103
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_01_maple_d_mls.dds'
				material = cab_head_bh2a_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_12
				$car_rocker_bass_factoredglobal_103
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_01_maple_d_mls.dds'
				material = cab_head_bh2a_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_13
				$car_rocker_bass_factoredglobal_103
			}
		]
	}
	{
		desc_id = cab_head_bh6a
		frontend_desc = qs(0x51e118f0)
		mesh = 'models/CAR_Instruments/bass/CAB_Head_BH6A.skin'
		materials = [
			cab_head_chunder02_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_bh6a.dds'
				material = cab_head_chunder02_primary
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_head_02_finishes
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_bh6a.dds'
				material = cab_head_chunder02_primary
				$car_rocker_bass_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cab_head_02_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_bh6a.dds'
				material = cab_head_chunder02_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_4
				$car_rocker_bass_factoredglobal_106
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_bh6a.dds'
				material = cab_head_chunder02_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_6
				$car_rocker_bass_factoredglobal_106
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_bh6a.dds'
				material = cab_head_chunder02_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_7
				$car_rocker_bass_factoredglobal_106
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_bh6a.dds'
				material = cab_head_chunder02_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_8
				$car_rocker_bass_factoredglobal_106
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_bh6a.dds'
				material = cab_head_chunder02_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_9
				$car_rocker_bass_factoredglobal_106
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_bh6a.dds'
				material = cab_head_chunder02_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_10
				$car_rocker_bass_factoredglobal_106
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_bh6a.dds'
				material = cab_head_chunder02_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_11
				$car_rocker_bass_factoredglobal_106
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_bh6a.dds'
				material = cab_head_chunder02_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_12
				$car_rocker_bass_factoredglobal_106
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_bh6a.dds'
				material = cab_head_chunder02_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_13
				$car_rocker_bass_factoredglobal_106
			}
		]
	}
	{
		desc_id = cab_head_rubyat
		frontend_desc = qs(0x15dc01bd)
		mesh = 'models/CAR_Instruments/bass/CAB_HEAD_Rubyat.skin'
		materials = [
			cab_head_rubyat_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_machine_rubyat_d.dds'
				material = cab_head_rubyat_hardware
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_head_rubyat_finishes
			}
		]
	}
	{
		desc_id = cab_head_bh6b
		frontend_desc = qs(0xb70b0351)
		mesh = 'models/CAR_Instruments/bass/CAB_Head_BH6B.skin'
		materials = [
			cab_head_chunder01_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_trad_delx_d.dds'
				material = cab_head_chunder01_headstock
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_head_03_finishes
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_trad_delx_d.dds'
				material = cab_head_chunder01_headstock
				$car_rocker_bass_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cab_head_03_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_trad_delx_d.dds'
				material = cab_head_chunder01_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_4
				$car_rocker_bass_factoredglobal_110
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_trad_delx_d.dds'
				material = cab_head_chunder01_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_6
				$car_rocker_bass_factoredglobal_110
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_trad_delx_d.dds'
				material = cab_head_chunder01_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_7
				$car_rocker_bass_factoredglobal_110
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_trad_delx_d.dds'
				material = cab_head_chunder01_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_8
				$car_rocker_bass_factoredglobal_110
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_trad_delx_d.dds'
				material = cab_head_chunder01_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_9
				$car_rocker_bass_factoredglobal_110
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_trad_delx_d.dds'
				material = cab_head_chunder01_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_10
				$car_rocker_bass_factoredglobal_110
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_trad_delx_d.dds'
				material = cab_head_chunder01_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_11
				$car_rocker_bass_factoredglobal_110
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_trad_delx_d.dds'
				material = cab_head_chunder01_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_12
				$car_rocker_bass_factoredglobal_110
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_trad_delx_d.dds'
				material = cab_head_chunder01_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_13
				$car_rocker_bass_factoredglobal_110
			}
		]
	}
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
				$car_rocker_bass_factoredglobal_110
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_bh7a.dds'
				material = cab_head_bh7a_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_6
				$car_rocker_bass_factoredglobal_110
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_bh7a.dds'
				material = cab_head_bh7a_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_7
				$car_rocker_bass_factoredglobal_110
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_bh7a.dds'
				material = cab_head_bh7a_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_8
				$car_rocker_bass_factoredglobal_110
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_bh7a.dds'
				material = cab_head_bh7a_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_9
				$car_rocker_bass_factoredglobal_110
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_bh7a.dds'
				material = cab_head_bh7a_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_10
				$car_rocker_bass_factoredglobal_110
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_bh7a.dds'
				material = cab_head_bh7a_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_11
				$car_rocker_bass_factoredglobal_110
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_bh7a.dds'
				material = cab_head_bh7a_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_12
				$car_rocker_bass_factoredglobal_110
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_bh7a.dds'
				material = cab_head_bh7a_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_13
				$car_rocker_bass_factoredglobal_110
			}
		]
	}
	{
		desc_id = cab_head_bh4a
		frontend_desc = qs(0x64b61dec)
		mesh = 'models/CAR_Instruments/bass/CAB_Head_BH4A.skin'
		materials = [
			cab_head_bh1a_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_flay001.dds'
				material = cab_head_bh1a_headstock
				$car_rocker_bass_factoredglobal_0
				$car_rocker_bass_factoredglobal_113
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_flay001.dds'
				material = cab_head_bh1a_headstock
				$car_rocker_bass_factoredglobal_0
				$car_rocker_bass_factoredglobal_114
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_flay001.dds'
				material = cab_head_bh1a_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_4
				$car_rocker_bass_factoredglobal_115
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_flay001.dds'
				material = cab_head_bh1a_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_6
				$car_rocker_bass_factoredglobal_115
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_flay001.dds'
				material = cab_head_bh1a_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_7
				$car_rocker_bass_factoredglobal_115
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_flay001.dds'
				material = cab_head_bh1a_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_8
				$car_rocker_bass_factoredglobal_115
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_flay001.dds'
				material = cab_head_bh1a_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_9
				$car_rocker_bass_factoredglobal_115
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_flay001.dds'
				material = cab_head_bh1a_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_10
				$car_rocker_bass_factoredglobal_115
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_flay001.dds'
				material = cab_head_bh1a_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_11
				$car_rocker_bass_factoredglobal_115
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_flay001.dds'
				material = cab_head_bh1a_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_12
				$car_rocker_bass_factoredglobal_115
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_flay001.dds'
				material = cab_head_bh1a_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_13
				$car_rocker_bass_factoredglobal_115
			}
		]
	}
	{
		desc_id = cab_head_flay_rev
		frontend_desc = qs(0x775797b0)
		mesh = 'models/CAR_Instruments/bass/CAB_Head_Flay_rev.skin'
		materials = [
			cab_head_bh1a_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_flay001.dds'
				material = cab_head_bh1a_headstock
				$car_rocker_bass_factoredglobal_0
				$car_rocker_bass_factoredglobal_113
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_flay001.dds'
				material = cab_head_bh1a_headstock
				$car_rocker_bass_factoredglobal_0
				$car_rocker_bass_factoredglobal_114
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_flay001.dds'
				material = cab_head_bh1a_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_4
				$car_rocker_bass_factoredglobal_115
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_flay001.dds'
				material = cab_head_bh1a_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_6
				$car_rocker_bass_factoredglobal_115
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_flay001.dds'
				material = cab_head_bh1a_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_7
				$car_rocker_bass_factoredglobal_115
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_flay001.dds'
				material = cab_head_bh1a_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_8
				$car_rocker_bass_factoredglobal_115
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_flay001.dds'
				material = cab_head_bh1a_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_9
				$car_rocker_bass_factoredglobal_115
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_flay001.dds'
				material = cab_head_bh1a_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_10
				$car_rocker_bass_factoredglobal_115
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_flay001.dds'
				material = cab_head_bh1a_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_11
				$car_rocker_bass_factoredglobal_115
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_flay001.dds'
				material = cab_head_bh1a_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_12
				$car_rocker_bass_factoredglobal_115
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_flay001.dds'
				material = cab_head_bh1a_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_13
				$car_rocker_bass_factoredglobal_115
			}
		]
	}
	{
		desc_id = cab_head_bh5a
		frontend_desc = qs(0x1e6af2e4)
		mesh = 'models/CAR_Instruments/bass/CAB_Head_BH5A.skin'
		materials = [
			cab_head_bh5a_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_bh5a.dds'
				material = cab_head_bh5a_headstock
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_head_07_finishes
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_bh5a.dds'
				material = cab_head_bh5a_headstock
				$car_rocker_bass_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cab_head_07_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_bh5a.dds'
				material = cab_head_bh5a_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_4
				$car_rocker_bass_factoredglobal_118
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_bh5a.dds'
				material = cab_head_bh5a_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_6
				$car_rocker_bass_factoredglobal_118
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_bh5a.dds'
				material = cab_head_bh5a_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_7
				$car_rocker_bass_factoredglobal_118
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_bh5a.dds'
				material = cab_head_bh5a_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_8
				$car_rocker_bass_factoredglobal_118
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_bh5a.dds'
				material = cab_head_bh5a_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_9
				$car_rocker_bass_factoredglobal_118
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_bh5a.dds'
				material = cab_head_bh5a_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_10
				$car_rocker_bass_factoredglobal_118
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_bh5a.dds'
				material = cab_head_bh5a_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_11
				$car_rocker_bass_factoredglobal_118
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_bh5a.dds'
				material = cab_head_bh5a_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_12
				$car_rocker_bass_factoredglobal_118
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_bh5a.dds'
				material = cab_head_bh5a_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_13
				$car_rocker_bass_factoredglobal_118
			}
		]
	}
	{
		desc_id = cab_head_bhphnq01
		frontend_desc = qs(0x8484b961)
		mesh = 'models/CAR_Instruments/bass/CAB_Head_BHPhnq01.skin'
		materials = [
			cab_head_phunquie01_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_bh8a.dds'
				material = cab_head_phunquie01_headstock
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_head_08_finishes
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_bh8a.dds'
				material = cab_head_phunquie01_headstock
				$car_rocker_bass_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cab_head_08_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_bh8a.dds'
				material = cab_head_phunquie01_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_4
				$car_rocker_bass_factoredglobal_121
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_bh8a.dds'
				material = cab_head_phunquie01_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_6
				$car_rocker_bass_factoredglobal_121
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_bh8a.dds'
				material = cab_head_phunquie01_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_7
				$car_rocker_bass_factoredglobal_121
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_bh8a.dds'
				material = cab_head_phunquie01_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_8
				$car_rocker_bass_factoredglobal_121
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_bh8a.dds'
				material = cab_head_phunquie01_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_9
				$car_rocker_bass_factoredglobal_121
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_bh8a.dds'
				material = cab_head_phunquie01_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_10
				$car_rocker_bass_factoredglobal_121
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_bh8a.dds'
				material = cab_head_phunquie01_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_11
				$car_rocker_bass_factoredglobal_121
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_bh8a.dds'
				material = cab_head_phunquie01_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_12
				$car_rocker_bass_factoredglobal_121
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_bh8a.dds'
				material = cab_head_phunquie01_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_13
				$car_rocker_bass_factoredglobal_121
			}
		]
	}
	{
		desc_id = cab_head_mnemonic
		frontend_desc = qs(0x9707fdc2)
		mesh = 'models/CAR_Instruments/bass/CAB_Head_Mnemonic.skin'
		materials = [
			cab_head_mnemonic_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_mnemonic_d.dds'
				material = cab_head_mnemonic_headstock
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_head_14_finishes
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_mnemonic_d.dds'
				material = cab_head_mnemonic_headstock
				$car_rocker_bass_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cab_head_14_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_Mnemonic_d.dds'
				material = cab_head_mnemonic_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_4
				$car_rocker_bass_factoredglobal_124
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_Mnemonic_d.dds'
				material = cab_head_mnemonic_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_6
				$car_rocker_bass_factoredglobal_124
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_Mnemonic_d.dds'
				material = cab_head_mnemonic_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_7
				$car_rocker_bass_factoredglobal_124
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_Mnemonic_d.dds'
				material = cab_head_mnemonic_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_8
				$car_rocker_bass_factoredglobal_124
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_Mnemonic_d.dds'
				material = cab_head_mnemonic_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_9
				$car_rocker_bass_factoredglobal_124
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_Mnemonic_d.dds'
				material = cab_head_mnemonic_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_10
				$car_rocker_bass_factoredglobal_124
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_Mnemonic_d.dds'
				material = cab_head_mnemonic_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_11
				$car_rocker_bass_factoredglobal_124
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_Mnemonic_d.dds'
				material = cab_head_mnemonic_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_12
				$car_rocker_bass_factoredglobal_124
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_Mnemonic_d.dds'
				material = cab_head_mnemonic_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_13
				$car_rocker_bass_factoredglobal_124
			}
		]
	}
	{
		desc_id = cab_head_foots01
		frontend_desc = qs(0x06037cc1)
		mesh = 'models/CAR_Instruments/bass/CAB_Head_Foots01.skin'
		materials = [
			cab_head_star01_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_star01_d.dds'
				material = cab_head_star01_headstock
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_head_09_finishes
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_star01_d.dds'
				material = cab_head_star01_headstock
				$car_rocker_bass_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cab_head_09_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_Star01_D.dds'
				material = cab_head_star01_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_4
				$car_rocker_bass_factoredglobal_124
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_Star01_D.dds'
				material = cab_head_star01_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_6
				$car_rocker_bass_factoredglobal_124
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_Star01_D.dds'
				material = cab_head_star01_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_7
				$car_rocker_bass_factoredglobal_124
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_Star01_D.dds'
				material = cab_head_star01_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_8
				$car_rocker_bass_factoredglobal_124
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_Star01_D.dds'
				material = cab_head_star01_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_9
				$car_rocker_bass_factoredglobal_124
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_Star01_D.dds'
				material = cab_head_star01_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_10
				$car_rocker_bass_factoredglobal_124
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_Star01_D.dds'
				material = cab_head_star01_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_11
				$car_rocker_bass_factoredglobal_124
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_Star01_D.dds'
				material = cab_head_star01_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_12
				$car_rocker_bass_factoredglobal_124
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_Star01_D.dds'
				material = cab_head_star01_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_13
				$car_rocker_bass_factoredglobal_124
			}
		]
	}
	{
		desc_id = cab_head_grumbel01
		frontend_desc = qs(0xcff8dc11)
		mesh = 'models/CAR_Instruments/bass/CAB_Head_Grumbel01.skin'
		materials = [
			cab_head_grumbel01_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_grumbel01.dds'
				material = cab_head_grumbel01_headstock
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_head_04_finishes
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_grumbel01.dds'
				material = cab_head_grumbel01_headstock
				$car_rocker_bass_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cab_head_04_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_Grumbel01.dds'
				material = cab_head_grumbel01_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_4
				initial_values = {
					x_trans = -18
					y_trans = -3
					x_scale = 20
					flags = 3
					y_scale = 55
				}
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_Grumbel01.dds'
				material = cab_head_grumbel01_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_6
				$car_rocker_bass_factoredglobal_130
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_Grumbel01.dds'
				material = cab_head_grumbel01_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_7
				$car_rocker_bass_factoredglobal_130
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_Grumbel01.dds'
				material = cab_head_grumbel01_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_8
				$car_rocker_bass_factoredglobal_130
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_Grumbel01.dds'
				material = cab_head_grumbel01_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_9
				$car_rocker_bass_factoredglobal_130
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_Grumbel01.dds'
				material = cab_head_grumbel01_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_10
				$car_rocker_bass_factoredglobal_130
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_Grumbel01.dds'
				material = cab_head_grumbel01_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_11
				$car_rocker_bass_factoredglobal_130
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_Grumbel01.dds'
				material = cab_head_grumbel01_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_12
				$car_rocker_bass_factoredglobal_130
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_Grumbel01.dds'
				material = cab_head_grumbel01_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_13
				$car_rocker_bass_factoredglobal_130
			}
		]
	}
	{
		desc_id = cab_head_sixtease
		frontend_desc = qs(0xe68acf2e)
		mesh = 'models/CAR_Instruments/bass/CAB_Head_SixTease.skin'
		materials = [
			cab_head_sixtease_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_sixtease_d_mls.dds'
				material = cab_head_sixtease_headstock
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_head_10_finishes
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_sixtease_d_mls.dds'
				material = cab_head_sixtease_headstock
				$car_rocker_bass_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cab_head_10_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_sixtease_d_mls.dds'
				material = cab_head_sixtease_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_4
				$car_rocker_bass_factoredglobal_133
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_sixtease_d_mls.dds'
				material = cab_head_sixtease_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_6
				$car_rocker_bass_factoredglobal_133
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_sixtease_d_mls.dds'
				material = cab_head_sixtease_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_7
				$car_rocker_bass_factoredglobal_133
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_sixtease_d_mls.dds'
				material = cab_head_sixtease_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_8
				$car_rocker_bass_factoredglobal_133
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_sixtease_d_mls.dds'
				material = cab_head_sixtease_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_9
				$car_rocker_bass_factoredglobal_124
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_sixtease_d_mls.dds'
				material = cab_head_sixtease_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_10
				$car_rocker_bass_factoredglobal_133
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_sixtease_d_mls.dds'
				material = cab_head_sixtease_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_11
				$car_rocker_bass_factoredglobal_133
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_sixtease_d_mls.dds'
				material = cab_head_sixtease_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_12
				$car_rocker_bass_factoredglobal_133
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_sixtease_d_mls.dds'
				material = cab_head_sixtease_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_13
				$car_rocker_bass_factoredglobal_133
			}
		]
	}
	{
		desc_id = cab_head_predikt
		frontend_desc = qs(0xa9624079)
		mesh = 'models/CAR_Instruments/bass/CAB_Head_Predikt.skin'
		materials = [
			cab_head_predikt_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_predikt_hstock_d.dds'
				material = cab_head_predikt_primary
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_head_predikt_finishes
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_predikt_hstock_d.dds'
				material = cab_head_predikt_primary
				$car_rocker_bass_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cab_head_predikt_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_predikt_hstock_d.dds'
				material = cab_head_predikt_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_4
				$car_rocker_bass_factoredglobal_136
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_predikt_hstock_d.dds'
				material = cab_head_predikt_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_6
				$car_rocker_bass_factoredglobal_136
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_predikt_hstock_d.dds'
				material = cab_head_predikt_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_7
				$car_rocker_bass_factoredglobal_136
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_predikt_hstock_d.dds'
				material = cab_head_predikt_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_8
				$car_rocker_bass_factoredglobal_136
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_predikt_hstock_d.dds'
				material = cab_head_predikt_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_9
				$car_rocker_bass_factoredglobal_136
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_predikt_hstock_d.dds'
				material = cab_head_predikt_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_10
				$car_rocker_bass_factoredglobal_136
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_predikt_hstock_d.dds'
				material = cab_head_predikt_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_11
				$car_rocker_bass_factoredglobal_136
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_predikt_hstock_d.dds'
				material = cab_head_predikt_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_12
				$car_rocker_bass_factoredglobal_136
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_predikt_hstock_d.dds'
				material = cab_head_predikt_primary
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_13
				$car_rocker_bass_factoredglobal_136
			}
		]
	}
	{
		desc_id = cab_head_guppy
		frontend_desc = qs(0xf4ee30a1)
		mesh = 'models/CAR_Instruments/bass/CAB_Head_Guppy.skin'
		materials = [
			cab_head_guppy_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_guppy_d.dds'
				material = cab_head_guppy_headstock
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_head_12_finishes
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_guppy_d.dds'
				material = cab_head_guppy_headstock
				$car_rocker_bass_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cab_head_12_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_guppy_d.dds'
				material = cab_head_guppy_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_4
				$car_rocker_bass_factoredglobal_139
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_guppy_d.dds'
				material = cab_head_guppy_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_6
				$car_rocker_bass_factoredglobal_139
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_guppy_d.dds'
				material = cab_head_guppy_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_7
				$car_rocker_bass_factoredglobal_139
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_guppy_d.dds'
				material = cab_head_guppy_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_8
				$car_rocker_bass_factoredglobal_139
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_guppy_d.dds'
				material = cab_head_guppy_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_9
				$car_rocker_bass_factoredglobal_124
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_guppy_d.dds'
				material = cab_head_guppy_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_10
				$car_rocker_bass_factoredglobal_139
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_guppy_d.dds'
				material = cab_head_guppy_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_11
				$car_rocker_bass_factoredglobal_139
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_guppy_d.dds'
				material = cab_head_guppy_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_12
				$car_rocker_bass_factoredglobal_139
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/CAB_Head_guppy_d.dds'
				material = cab_head_guppy_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_13
				$car_rocker_bass_factoredglobal_139
			}
		]
	}
	{
		desc_id = cab_head_mlsplit
		frontend_desc = qs(0x62191b93)
		mesh = 'models/CAR_Instruments/bass/CAB_Head_MLSplit.skin'
		materials = [
			cab_head_mlsplit_hardware
		]
	}
	{
		desc_id = cab_head_skull
		frontend_desc = qs(0xbcb6decb)
		mesh = 'models/CAR_Instruments/bass/CAB_Head_Skull.skin'
		materials = [
			cab_head_skull_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_Skull_d.dds'
				material = cab_head_skull_headstock
				$car_rocker_bass_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cab_head_11_finishes
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_Skull_d.dds'
				material = cab_head_skull_headstock
				$car_rocker_bass_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cab_head_11_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_skull_d.dds'
				material = cab_head_skull_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_4
				$car_rocker_bass_factoredglobal_142
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_skull_d.dds'
				material = cab_head_skull_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_6
				$car_rocker_bass_factoredglobal_142
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_skull_d.dds'
				material = cab_head_skull_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_7
				$car_rocker_bass_factoredglobal_142
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_skull_d.dds'
				material = cab_head_skull_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_8
				$car_rocker_bass_factoredglobal_142
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_skull_d.dds'
				material = cab_head_skull_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_9
				$car_rocker_bass_factoredglobal_142
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_skull_d.dds'
				material = cab_head_skull_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_10
				$car_rocker_bass_factoredglobal_142
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_skull_d.dds'
				material = cab_head_skull_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_11
				$car_rocker_bass_factoredglobal_142
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_skull_d.dds'
				material = cab_head_skull_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_12
				$car_rocker_bass_factoredglobal_142
			}
			{
				base_tex = 'tex/models/Car_Instruments/Bass/cab_head_skull_d.dds'
				material = cab_head_skull_headstock
				$car_rocker_bass_factoredglobal_3
				$car_rocker_bass_factoredglobal_13
				$car_rocker_bass_factoredglobal_142
			}
		]
	}
]
car_rocker_bass_factoredglobal_0 = {
	diffuse
	pre_userlayer
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
		x_trans = -27
		x_scale = 30
		y_scale = 60
		y_trans = 15
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
	desc_id = `font	a1`
	frontend_desc = qs(0x272e6e53)
	mask = $car_fontgrid_text_a10
}
car_rocker_bass_factoredglobal_12 = {
	desc_id = `font	a6`
	frontend_desc = qs(0x0c033d90)
	mask = $car_fontgrid_bordello
}
car_rocker_bass_factoredglobal_13 = {
	desc_id = `font	a8`
	frontend_desc = qs(0x15180cd1)
	mask = $car_fontgrid_denim_title
}
car_rocker_bass_factoredglobal_16 = {
	initial_values = {
		x_trans = -23
		y_trans = 23
		y_scale = 60
		x_scale = 30
	}
}
car_rocker_bass_factoredglobal_19 = {
	initial_values = {
		x_trans = -19
		y_trans = 18
		y_scale = 60
		x_scale = 30
	}
}
car_rocker_bass_factoredglobal_22 = {
	initial_values = {
		x_trans = -30
		y_trans = 10
		y_scale = 60
		x_scale = 30
	}
}
car_rocker_bass_factoredglobal_26 = {
	initial_values = {
		x_trans = -28
		y_trans = -15
		y_scale = 60
		x_scale = 30
	}
}
car_rocker_bass_factoredglobal_29 = {
	initial_values = {
		x_trans = -23
		y_trans = -7
		x_scale = 20
	}
}
car_rocker_bass_factoredglobal_32 = {
	initial_values = {
		x_trans = -26
		y_trans = -3
		y_scale = 60
		x_scale = 30
	}
}
car_rocker_bass_factoredglobal_35 = {
	initial_values = {
		x_trans = -23
		y_trans = 14
		x_scale = 30
		y_scale = 60
	}
}
car_rocker_bass_factoredglobal_38 = {
	initial_values = {
		x_trans = -28
		y_trans = 10
		y_scale = 60
		x_scale = 30
	}
}
car_rocker_bass_factoredglobal_41 = {
	initial_values = {
		x_trans = -23
		y_trans = -15
		x_scale = 30
		y_scale = 60
	}
}
car_rocker_bass_factoredglobal_44 = {
	initial_values = {
		x_trans = -25
		x_scale = 30
		y_scale = 60
	}
}
car_rocker_bass_factoredglobal_47 = {
	initial_values = {
		x_trans = -17
		x_scale = 30
		y_scale = 60
	}
}
car_rocker_bass_factoredglobal_50 = {
	initial_values = {
		y_trans = 9
		x_scale = 16
		y_scale = 35
		x_trans = -30
	}
}
car_rocker_bass_factoredglobal_53 = {
	initial_values = {
		y_trans = -1
		x_scale = 30
		y_scale = 60
		x_trans = -28
	}
}
car_rocker_bass_factoredglobal_56 = {
	initial_values = {
		x_scale = 30
		y_scale = 60
		x_trans = -15
	}
}
car_rocker_bass_factoredglobal_59 = {
	initial_values = {
		x_trans = -12
		x_scale = 16
		y_scale = 30
		y_trans = -1
	}
}
car_rocker_bass_factoredglobal_62 = {
	initial_values = {
		y_trans = 29
		x_scale = 16
		y_scale = 30
		x_trans = -14
	}
}
car_rocker_bass_factoredglobal_63 = {
	desc_id = finishes
	frontend_desc = qs(0x6e23fd31)
	mask = $cab_neck_01_finishes
}
car_rocker_bass_factoredglobal_64 = {
	initial_values = {
		Color = grey_3
	}
}
car_rocker_bass_factoredglobal_65 = {
	diffuse
}
car_rocker_bass_factoredglobal_66 = {
	desc_id = finishes
	frontend_desc = qs(0x6e23fd31)
	mask = $cab_neck_fretless01_finishes
}
car_rocker_bass_factoredglobal_67 = {
	desc_id = finishes
	frontend_desc = qs(0x6e23fd31)
	mask = $cab_arcos_pgrd01
}
car_rocker_bass_factoredglobal_68 = {
	hidden
}
car_rocker_bass_factoredglobal_75 = {
	desc_id = finishes
	frontend_desc = qs(0x6e23fd31)
	mask = $cab_hack_pgrd01
}
car_rocker_bass_factoredglobal_77 = {
	desc_id = finishes
	frontend_desc = qs(0x6e23fd31)
	mask = $cag_gtr16_pickgrd01
}
car_rocker_bass_factoredglobal_84 = {
	desc_id = finishes
	frontend_desc = qs(0x6e23fd31)
	mask = $cab_unos_pgrd01
}
car_rocker_bass_factoredglobal_100 = {
	initial_values = {
		x_trans = 5
		y_trans = 8
		x_scale = 25
		y_scale = 35
	}
}
car_rocker_bass_factoredglobal_103 = {
	initial_values = {
		y_trans = -7
		x_scale = 65
		y_scale = 30
		rot = 1400
		x_trans = -28
	}
}
car_rocker_bass_factoredglobal_106 = {
	initial_values = {
		x_trans = -33
		x_scale = 25
		y_scale = 60
		flags = 3
		y_trans = 3
	}
}
car_rocker_bass_factoredglobal_110 = {
	initial_values = {
		y_trans = -5
		x_scale = 20
		y_scale = 45
		flags = 3
		x_trans = -28
	}
}
car_rocker_bass_factoredglobal_113 = {
	desc_id = finishes
	frontend_desc = qs(0x6e23fd31)
	mask = $cab_head_06_finishes
}
car_rocker_bass_factoredglobal_114 = {
	desc_id = details
	frontend_desc = qs(0x7f5a5c11)
	mask = $cab_head_06_details
}
car_rocker_bass_factoredglobal_115 = {
	initial_values = {
		x_trans = -41
		x_scale = 10
		y_scale = 50
		y_trans = -1
	}
}
car_rocker_bass_factoredglobal_118 = {
	initial_values = {
		y_trans = -1
		x_scale = 20
		y_scale = 60
		flags = 3
		x_trans = -29
	}
}
car_rocker_bass_factoredglobal_121 = {
	initial_values = {
		x_trans = -26
		x_scale = 20
		y_scale = 45
		y_trans = -14
	}
}
car_rocker_bass_factoredglobal_124 = {
	initial_values = {
		y_trans = 13
		x_scale = 20
		y_scale = 45
		x_trans = 37
	}
}
car_rocker_bass_factoredglobal_130 = {
	initial_values = {
		x_trans = -18
		y_trans = -3
		x_scale = 20
		y_scale = 55
	}
}
car_rocker_bass_factoredglobal_133 = {
	initial_values = {
		x_trans = -29
		y_trans = -4
		x_scale = 20
		y_scale = 50
	}
}
car_rocker_bass_factoredglobal_136 = {
	initial_values = {
		x_trans = -25
		x_scale = 26
		y_scale = 55
		y_trans = 2
	}
}
car_rocker_bass_factoredglobal_139 = {
	initial_values = {
		x_trans = -38
		y_trans = -7
		x_scale = 20
		y_scale = 60
	}
}
car_rocker_bass_factoredglobal_142 = {
	initial_values = {
		x_trans = -21
		y_trans = 4
		y_scale = 50
		x_scale = 35
	}
}
