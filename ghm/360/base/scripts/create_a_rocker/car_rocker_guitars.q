cas_guitar_body = [
	{
		desc_id = gtr1_esp_truckster_01
		frontend_desc = qs(0x50428e38)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR1_ESP_Truckster_01.skin'
		pak_num = 0
		is_metallica = 1
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr1_esp_truckster_d_01.dds'
				material = gtr1_esp_truckster_01_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_1
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					None
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr1_esp_emg_pkup_2
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr1_esp_knob_10_03
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr1_esp_bridge_01
				]
			}
		]
	}
	{
		desc_id = gtr2_esp_truckster_02
		frontend_desc = qs(0xb0bbed42)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR2_ESP_Truckster_02.skin'
		pak_num = 0
		is_metallica = 1
		price = 1000
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr2_esp_truckster_d_02.dds'
				material = gtr2_esp_truckster_02_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_1
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					None
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr1_esp_emg_pkup_2
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr1_esp_knob_10_03
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr1_esp_bridge_01
				]
			}
		]
	}
	{
		desc_id = gtr3_esp_custom_03
		frontend_desc = qs(0xc634043b)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR3_ESP_Custom_03.skin'
		pak_num = 0
		is_metallica = 1
		price = 5000
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr3_esp_custom_d_01.dds'
				material = gtr3_esp_custom_03_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_1
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					None
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr3_esp_emg_pkup_2
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr1_esp_knob_10_03
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr1_esp_bridge_01
				]
			}
		]
	}
	{
		desc_id = gtr4_esp_eclipse_01
		frontend_desc = qs(0x6de4a5a9)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR4_ESP_Eclipse_01.skin'
		pak_num = 0
		is_esp = 1
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_esp_eclipse_d_01.dds'
				material = gtr4_esp_eclipse_01_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x3f47b13d)
				mask = $gtr4_esp_eclipse
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_esp_eclipse_d_01.dds'
				material = gtr4_esp_eclipse_01_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $gtr4_esp_eclipse_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_esp_eclipse_d_01.dds'
				material = gtr4_esp_eclipse_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_6
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_esp_eclipse_d_01.dds'
				material = gtr4_esp_eclipse_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_6
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_esp_eclipse_d_01.dds'
				material = gtr4_esp_eclipse_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_6
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_esp_eclipse_d_01.dds'
				material = gtr4_esp_eclipse_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_6
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_esp_eclipse_d_01.dds'
				material = gtr4_esp_eclipse_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_6
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_esp_eclipse_d_01.dds'
				material = gtr4_esp_eclipse_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_6
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_esp_eclipse_d_01.dds'
				material = gtr4_esp_eclipse_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_6
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_esp_eclipse_d_01.dds'
				material = gtr4_esp_eclipse_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_6
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_esp_eclipse_d_01.dds'
				material = gtr4_esp_eclipse_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_6
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_esp_eclipse_d_01.dds'
				material = gtr4_esp_eclipse_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_6
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_esp_eclipse_d_01.dds'
				material = gtr4_esp_eclipse_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_6
			}
		]
		inclusion = [
			{
				part = cas_guitar_neck
				valid = [
					gtr_fretboard_01
					gtr_fretboard_02
					gtr_fretboard_03
					gtr_fretboard_04
					gtr_fretboard24_01
					gtr_fretboard24_02
					gtr_fretboard24_03
					gtr_fretboard24_04
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr4_neckhead_01
					gtr4_neckhead_02
					gtr4_neckhead_03
					gtr4_neckhead_04
					gtr4_neckhead_05
					gtr4_neckhead_06
					gtr4_neckhead_07
				]
			}
			{
				part = cas_guitar_pickguards
				valid = [
					gtr5_pickguard_01
					None
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr1_esp_emg_pkup_2
					gtr_pkup_type1_blk_2
					gtr3_esp_emg_pkup_2
					gtr6_pkup_worngold_2
					gtr6_pkup_worngold_2
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr4_esp_knob_10_03
					gtr4_knob_02
					gtr4_knob_03
					gtr4_knob_04
					gtr4_knob_05
					gtr4_knob_06
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr4_esp_bridge_02
					gtr4_esp_bridge_9
					gtr4_bridge_fr10
				]
			}
		]
	}
	{
		desc_id = gtr5_cliff_burton
		frontend_desc = qs(0x5a8d3ea3)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR5_Cliff_Burton.skin'
		pak_num = 0
		is_metallica = 1
		price = 5000
		polaroid = guitars_cliff
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr5_cliff_burton_d.dds'
				material = gtr5_cliff_burton_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_1
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr5_pickguard_01
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr1_esp_emg_pkup_2
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr5_esp_knob_10_03
					None
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr5_esp_bridge_05
				]
			}
		]
		$car_rocker_guitars_factoredglobal_17
	}
	{
		desc_id = gtr6_iron_cross
		frontend_desc = qs(0x67c86f32)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR6_Iron_Cross.skin'
		pak_num = 0
		is_metallica = 1
		price = 2500
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr6_iron_cross_d.dds'
				material = gtr6_iron_cross_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_1
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr5_pickguard_01
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr6_pkup_worngold_2
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr6_knob_1_03
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr6_bridge_03
				]
			}
		]
	}
	{
		desc_id = gtr7_old_school
		frontend_desc = qs(0x7306bd81)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR7_Old_School.skin'
		pak_num = 0
		is_metallica = 1
		price = 2000
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr7_old_school_d.dds'
				material = gtr7_old_school_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_1
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					None
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr6_pkup_worngold_2
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr6_knob_1_03
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr6_bridge_03
				]
			}
		]
	}
	{
		desc_id = gtr8_esp_spider
		frontend_desc = qs(0x108cfafa)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR8_ESP_Spider.skin'
		pak_num = 0
		is_metallica = 1
		price = 5000
		polaroid = guitars_spider
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr8_spider_d.dds'
				material = gtr8_esp_spider_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_1
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					None
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr8_esp_emg_pkup
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr8_esp_knob_10_03
					None
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr8_bridge_fr
				]
			}
		]
		$car_rocker_guitars_factoredglobal_17
	}
	{
		desc_id = gtr9_esp_ax
		frontend_desc = qs(0xa1fd44a5)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR9_ESP_AX.skin'
		pak_num = 1
		is_esp = 1
		price = 500
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_esp_ax_d.dds'
				material = gtr9_esp_ax_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x3f47b13d)
				mask = $gtr9_esp_ax
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_esp_ax_d.dds'
				material = gtr9_esp_ax_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $gtr9_esp_ax_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_esp_ax_d.dds'
				material = gtr9_esp_ax_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_20
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_esp_ax_d.dds'
				material = gtr9_esp_ax_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_20
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_esp_ax_d.dds'
				material = gtr9_esp_ax_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_20
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_esp_ax_d.dds'
				material = gtr9_esp_ax_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_20
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_esp_ax_d.dds'
				material = gtr9_esp_ax_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_20
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_esp_ax_d.dds'
				material = gtr9_esp_ax_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_20
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_esp_ax_d.dds'
				material = gtr9_esp_ax_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_20
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_esp_ax_d.dds'
				material = gtr9_esp_ax_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_20
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_esp_ax_d.dds'
				material = gtr9_esp_ax_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_20
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_esp_ax_d.dds'
				material = gtr9_esp_ax_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_20
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_esp_ax_d.dds'
				material = gtr9_esp_ax_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_20
			}
		]
		inclusion = [
			{
				part = cas_guitar_neck
				valid = [
					gtr_fretboard_01
					gtr_fretboard_02
					gtr_fretboard_03
					gtr_fretboard_04
					gtr_fretboard24_01
					gtr_fretboard24_02
					gtr_fretboard24_03
					gtr_fretboard24_04
				]
			}
			{
				part = cas_guitar_pickguards
				valid = [
					None
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr1_esp_emg_pkup_2
					gtr_pkup_type1_blk_2
					gtr3_esp_emg_pkup_2
					gtr6_pkup_worngold_2
					gtr6_pkup_worngold_2
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr9_esp_knob_10_02
					gtr9_knob_02
					gtr9_knob_03
					gtr9_knob_04
					gtr9_knob_04
					gtr9_knob_06
					None
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr9_esp_bridge_03
					gtr9_bridge_04
					gtr9_bridge_fr11
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr9_neckhead_01
					gtr9_neckhead_02
					gtr9_neckhead_03
					gtr9_neckhead_04
					gtr9_neckhead_05
					gtr9_neckhead_06
					gtr9_neckhead_07
				]
			}
		]
	}
	{
		desc_id = gtr10_red_eclipse
		frontend_desc = qs(0x9fa979ad)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR10_Red_Eclipse.skin'
		pak_num = 0
		is_metallica = 1
		price = 2000
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					None
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr6_pkup_worngold_2
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr10_knob1_03
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr10_bridge_04
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr10_neckhead
				]
			}
		]
	}
	{
		desc_id = gtr11_midnight_eclipse
		frontend_desc = qs(0xde071bd2)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR11_Midnight_Eclipse.skin'
		pak_num = 0
		is_metallica = 1
		price = 2000
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					None
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr6_pkup_worngold_2
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr11_knob1_04
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr11_bridge_06
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr11_neckhead
				]
			}
		]
	}
	{
		desc_id = gtr12_esp_v_01
		frontend_desc = qs(0xb3b5202b)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR12_ESP_V_01.skin'
		pak_num = 1
		is_esp = 1
		price = 500
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr12_esp_v_series_d.dds'
				material = gtr12_esp_v_01_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x3f47b13d)
				mask = $gtr12_esp_v_01
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr12_esp_v_series_d.dds'
				material = gtr12_esp_v_01_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $gtr12_esp_v_01_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr12_esp_v_series_d.dds'
				material = gtr12_esp_v_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_23
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr12_esp_v_series_d.dds'
				material = gtr12_esp_v_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_23
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr12_esp_v_series_d.dds'
				material = gtr12_esp_v_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_23
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr12_esp_v_series_d.dds'
				material = gtr12_esp_v_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_23
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr12_esp_v_series_d.dds'
				material = gtr12_esp_v_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_23
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr12_esp_v_series_d.dds'
				material = gtr12_esp_v_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_23
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr12_esp_v_series_d.dds'
				material = gtr12_esp_v_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_23
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr12_esp_v_series_d.dds'
				material = gtr12_esp_v_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr12_esp_v_series_d.dds'
				material = gtr12_esp_v_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_23
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr12_esp_v_series_d.dds'
				material = gtr12_esp_v_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_23
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr12_esp_v_series_d.dds'
				material = gtr12_esp_v_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_23
			}
		]
		inclusion = [
			{
				part = cas_guitar_neck
				valid = [
					gtr_fretboard24_01
					gtr_fretboard24_02
					gtr_fretboard24_03
					gtr_fretboard24_04
					gtr_fretboard_01
					gtr_fretboard_02
					gtr_fretboard_03
					gtr_fretboard_04
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr12_neckhead_07
					gtr12_neckhead_01
					gtr12_neckhead_02
					gtr12_neckhead_03
					gtr12_neckhead_04
					gtr12_neckhead_05
				]
			}
			{
				part = cas_guitar_pickguards
				valid = [
					None
					gtr12_pickguard_01
					gtr12_pickguard_01b
					gtr12_pickguard_02
					gtr12_pickguard_02b
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr1_esp_emg_pkup_2
					gtr_pkup_type1_blk_2
					gtr3_esp_emg_pkup_2
					gtr6_pkup_worngold_2
					gtr6_pkup_worngold_2
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr12_esp_knob_01
					gtr12_esp_knob_02
					gtr12_esp_knob_03
					gtr12_esp_knob_04
					gtr12_esp_knob_05
					gtr12_esp_knob_06
					None
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr12_bridge_3
					gtr12_bridge_2
					gtr12_bridge_1
				]
			}
		]
	}
	{
		desc_id = gtr12_rat_rod
		frontend_desc = qs(0xc9bbc81b)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR12_Rat_Rod.skin'
		pak_num = 0
		is_metallica = 1
		price = 2000
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr12_rat_rod_d.dds'
				material = gtr12_rat_rod_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_1
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickups
				valid = [
					gtr12_esp_pkup_2
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr12_esp_knob_10_3
					None
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr12_esp_bridge_12
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr12_neckhead12
				]
			}
		]
	}
	{
		desc_id = gtr14_tiger_stripe
		frontend_desc = qs(0x3b147dcc)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR14_Tiger_Stripe.skin'
		pak_num = 0
		is_metallica = 1
		price = 2500
		inclusion = [
			{
				part = cas_guitar_pickups
				valid = [
					gtr14_pkup_worngold_14
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr14_knob1_04
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr14_bridge_14
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr14_neckhead
				]
			}
		]
	}
	{
		desc_id = gtr30_h101
		frontend_desc = qs(0x7510e81e)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR30_H101.skin'
		pak_num = 1
		is_esp = 1
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr30_h101_d.dds'
				material = gtr30_h_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x3f47b13d)
				mask = $gtr30_h
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr30_h101_d.dds'
				material = gtr30_h_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $gtr30_h_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_h101_d.dds'
				material = gtr30_h_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_26
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_h101_d.dds'
				material = gtr30_h_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_26
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr30_h101_d.dds'
				material = gtr30_h_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_26
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr30_h101_d.dds'
				material = gtr30_h_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_26
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr30_h101_d.dds'
				material = gtr30_h_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_26
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr30_h101_d.dds'
				material = gtr30_h_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_26
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr30_h101_d.dds'
				material = gtr30_h_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_26
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr30_h101_d.dds'
				material = gtr30_h_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_26
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr30_h101_d.dds'
				material = gtr30_h_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_26
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr30_h101_d.dds'
				material = gtr30_h_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_26
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr30_h101_d.dds'
				material = gtr30_h_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_26
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					None
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr30_pickup_d
					gtr30_pickup_e
					gtr30_pickup_f
					gtr30_pickup_g
					gtr30_pickup_gold
					gtr30_emg
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_30_knobs_a
					gtr_30_knobs_b
					gtr_30_knobs_c
					gtr_30_knobs_d
					gtr_30_knobs_e
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr30_brdg_strgthru
					gtr30_hardware_03
					gtr30_bridge_d
					gtr_30_bridge_e
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr30_nekhed_a
					gtr30_nekhed_b
					gtr30_nekhed_c
					gtr30_nekhed_d
					gtr30_nekhed_e
					gtr30_nekhed_f
				]
			}
			{
				part = cas_guitar_neck
				valid = [
					gtr_fboard_v1000
					gtr31_fboard_02
					gtr31_fboard_03
				]
			}
		]
	}
	{
		desc_id = gtr31_esp_viper
		frontend_desc = qs(0x77ae7ae2)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR_31_Viper.skin'
		pak_num = 1
		is_esp = 1
		price = 1250
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr31_viper_d.dds'
				material = gtr_31_viper_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x3f47b13d)
				mask = $gtr31_viper
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr31_viper_d.dds'
				material = gtr_31_viper_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $gtr31_viper_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_viper_d.dds'
				material = gtr_31_viper_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_29
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_viper_d.dds'
				material = gtr_31_viper_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_29
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr31_viper_d.dds'
				material = gtr_31_viper_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_29
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr31_viper_d.dds'
				material = gtr_31_viper_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_29
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr31_viper_d.dds'
				material = gtr_31_viper_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_29
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr31_viper_d.dds'
				material = gtr_31_viper_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_29
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr31_viper_d.dds'
				material = gtr_31_viper_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_29
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr31_viper_d.dds'
				material = gtr_31_viper_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_29
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr31_viper_d.dds'
				material = gtr_31_viper_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_29
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr31_viper_d.dds'
				material = gtr_31_viper_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_29
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr31_viper_d.dds'
				material = gtr_31_viper_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_29
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					None
					gtr31_pgard
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr31_pickup_gold
					gtr31_pickup_d
					gtr31_pickup_e
					gtr31_pickup_f
					gtr31_pickup_g
					gtr31b_grynch_emg
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_31_knobs_vpr
					gtr_31_knobs_b
					gtr_31_knobs_c
					gtr_31_knobs_d
					gtr_31_knobs_e
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr31_bridge31
					gtr31_hardware_b
					gtr_31_bridge_e
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr31c_neckhead
					gtr31c_neckhead02
					gtr31c_neckhead03
					gtr31c_neckhead04
					gtr31c_neckhead05
					gtr31c_neckhead06
				]
			}
			{
				part = cas_guitar_neck
				valid = [
					gtr_fboard_v1000
					gtr31_fboard_02
					gtr31_fboard_03
				]
			}
		]
	}
	{
		desc_id = gtr_31b_grynch
		frontend_desc = qs(0xbc53fdef)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR_31b_Grynch.skin'
		pak_num = 0
		is_metallica = 1
		price = 5000
		polaroid = guitars_grynch
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_esp_grynch_d.dds'
				material = gtr_31_grynch_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x3f47b13d)
				mask = $cag_guitar31_body
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					None
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr31b_grynch_emg
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_31b_knobs_vpr
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr31_bridge_tmatic
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr31b_neckhead
				]
			}
			{
				part = cas_guitar_neck
				valid = [
					gtr_fretboard_24
				]
			}
		]
		$car_rocker_guitars_factoredglobal_17
	}
	{
		desc_id = gtr32_body
		frontend_desc = qs(0xbed33ba2)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR_32_Body.skin'
		pak_num = 1
		is_esp = 1
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr32_body.dds'
				material = gtr32_horizon_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x3f47b13d)
				mask = $cag_gtr32
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr32_body.dds'
				material = gtr32_horizon_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_gtr32_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_body.dds'
				material = gtr32_horizon_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_6
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_body.dds'
				material = gtr32_horizon_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_6
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr32_body.dds'
				material = gtr32_horizon_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_6
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr32_body.dds'
				material = gtr32_horizon_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_6
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr32_body.dds'
				material = gtr32_horizon_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_6
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr32_body.dds'
				material = gtr32_horizon_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_6
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr32_body.dds'
				material = gtr32_horizon_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_6
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr32_body.dds'
				material = gtr32_horizon_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_6
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr32_body.dds'
				material = gtr32_horizon_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_6
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr32_body.dds'
				material = gtr32_horizon_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_6
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr32_body.dds'
				material = gtr32_horizon_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_6
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					None
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr32_pickup_f
					gtr32_pickup_gold
					gtr31_pickup_d
					gtr31_pickup_e
					gtr32_pickup_g
					gtr32_emg
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_32_knobs_a
					gtr_32_knobs_b
					gtr_32_knobs_c
					gtr_32_knobs_d
					gtr_32_knobs_e
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr32_hardware01
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr32_nekhead01
					gtr32_neckhead_b
					gtr32_neckhead_c
					gtr32_neckhead_d
					gtr32_neckhead_e
					gtr32_neckhead_f
				]
			}
			{
				part = cas_guitar_neck
				valid = [
					gtr_fboard_v1000
					gtr31_fboard_02
					gtr31_fboard_03
				]
			}
		]
	}
	{
		desc_id = gtr33_esp_kh2
		frontend_desc = qs(0x98fa9ce7)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR33_ESP_KH2.skin'
		pak_num = 0
		is_metallica = 1
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr_33_kirk_kh2_d.dds'
				material = gtr33_kh2_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_33
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					None
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr33_pickup_emg
					gtr33_pickup_a
					gtr33_pickup_b
					gtr33_pickup_e
					gtr33_pickup_f
					gtr33_pickup_gold
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr33_knobs_kh2
					gtr_33_knobs_b
					gtr_33_knobs_c
					gtr_33_knobs_c
					gtr_33_knobs_d
					gtr_33_knobs_e
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr33_bridge_fr
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr33_neckhead
				]
			}
			{
				part = cas_guitar_neck
				valid = [
					gtr33_fboard_kh2vint
				]
			}
		]
	}
	{
		desc_id = gtr33d_base
		frontend_desc = qs(0x4d643c82)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR33D_BASE.skin'
		pak_num = 1
		is_esp = 1
		price = 750
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33_kh2_wood_d.dds'
				material = gtr33d_wood_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_33
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr33_kh2_wood_d.dds'
				material = gtr33d_wood_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_gtr33_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33_kh2_wood_d.dds'
				material = gtr33d_wood_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_6
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33_kh2_wood_d.dds'
				material = gtr33d_wood_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_6
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr33_kh2_wood_d.dds'
				material = gtr33d_wood_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_6
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr33_kh2_wood_d.dds'
				material = gtr33d_wood_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_6
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr33_kh2_wood_d.dds'
				material = gtr33d_wood_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_6
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr33_kh2_wood_d.dds'
				material = gtr33d_wood_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_6
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr33_kh2_wood_d.dds'
				material = gtr33d_wood_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_6
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr33_kh2_wood_d.dds'
				material = gtr33d_wood_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_6
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr33_kh2_wood_d.dds'
				material = gtr33d_wood_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_6
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr33_kh2_wood_d.dds'
				material = gtr33d_wood_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_6
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr33_kh2_wood_d.dds'
				material = gtr33d_wood_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_6
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					None
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr33_emg
					gtr33_pickup_a
					gtr33_pickup_d
					gtr33_pickup_e
					gtr33_pickup_f
					gtr33_pickup_gold
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr33_knobs_kh2
					gtr_33_knobs_b
					gtr_33_knobs_c
					gtr_33_knobs_a
					gtr_33_knobs_d
					gtr_33_knobs_e
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr33_hardware01z
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr33d_nekhed
					gtr33d_nekhed_b
					gtr33d_nekhed_c
					gtr33d_nekhead_d
					gtr33d_nekhed_e
					gtr33d_nekhed_f
				]
			}
			{
				part = cas_guitar_neck
				valid = [
					gtr_fboard_v1000
					gtr31_fboard_02
					gtr31_fboard_03
					gtr33d_fboard_anni
				]
			}
		]
	}
	{
		desc_id = gtr33_boris
		frontend_desc = qs(0xd970ef44)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR33_Boris.skin'
		pak_num = 0
		is_metallica = 1
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_boris_d.dds'
				material = gtr33d_boris_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_35
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					None
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr33_pickup_boris
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr33_knobs_kh2
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr33_brdg_strgthru
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr33d_nekhed
				]
			}
			{
				part = cas_guitar_neck
				valid = [
					gtr33d_fboard_brs
				]
			}
		]
		$car_rocker_guitars_factoredglobal_17
	}
	{
		desc_id = gtr33d_bride
		frontend_desc = qs(0xb92d54ec)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR33D_Bride.skin'
		pak_num = 0
		is_metallica = 1
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33_bride.dds'
				material = gtr33_bride_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_35
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					None
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr33_pickup_bride
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr33_knobs_kh2
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr33_hardware01z
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr33brideshead
				]
			}
			{
				part = cas_guitar_neck
				valid = [
					gtr_fboard_v1000
				]
			}
		]
		$car_rocker_guitars_factoredglobal_36
	}
	{
		desc_id = gtr33_drac
		frontend_desc = qs(0x8a9b3bb6)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR33D_Drac.skin'
		pak_num = 0
		is_metallica = 1
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33_drac_d.dds'
				material = gtr33d_drac_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_35
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					None
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr33_pickup_drac
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr33_knobs_kh2
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr33_hardware01z
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr33_nekhed_drac
				]
			}
			{
				part = cas_guitar_neck
				valid = [
					gtr33d_fboard_brs
				]
			}
		]
		$car_rocker_guitars_factoredglobal_36
	}
	{
		desc_id = gtr33_mummy
		frontend_desc = qs(0xb53ad5bf)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR33_Mummy.skin'
		pak_num = 1
		is_metallica = 1
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33_kh2_mum_d.dds'
				material = gtr33_mummy_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x3f47b13d)
				mask = $cag_guitar33_body
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					None
					gtr33_switch01
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr33_pickup_mum
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr33_knobs_kh2
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr33_hardware01z
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr33_nekhed
				]
			}
			{
				part = cas_guitar_neck
				valid = [
					gtr33_fboard_mum
				]
			}
		]
		$car_rocker_guitars_factoredglobal_36
	}
	{
		desc_id = gtr33_anni
		frontend_desc = qs(0xbf52daf4)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR33_ANNI.skin'
		pak_num = 0
		is_metallica = 1
		price = 1000
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33_an_d.dds'
				material = gtr33_anni_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_35
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					None
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr33_emg
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					`	gtr33_knobs_kh2`
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr33_hardware01z
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr33d_nekhed
				]
			}
			{
				part = cas_guitar_neck
				valid = [
					gtr_fretboard_24
				]
			}
		]
	}
	{
		desc_id = gtr36_superv
		frontend_desc = qs(0x1a978a31)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR36_SuperV.skin'
		pak_num = 1
		is_esp = 1
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr36_superv.dds'
				material = gtr36_superv_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x3f47b13d)
				mask = $cag_guitar36_body
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr36_superv.dds'
				material = gtr36_superv_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_guitar36_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_superv.dds'
				material = gtr36_superv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_40
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_superv.dds'
				material = gtr36_superv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_40
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr36_superv.dds'
				material = gtr36_superv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_40
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr36_superv.dds'
				material = gtr36_superv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_40
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr36_superv.dds'
				material = gtr36_superv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_40
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr36_superv.dds'
				material = gtr36_superv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_40
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr36_superv.dds'
				material = gtr36_superv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_40
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr36_superv.dds'
				material = gtr36_superv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_40
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr36_superv.dds'
				material = gtr36_superv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_40
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr36_superv.dds'
				material = gtr36_superv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_40
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr36_superv.dds'
				material = gtr36_superv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_40
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr36_pgard
					None
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr36_pickup
					gtr36_pickup_gold
					gtr36_pickup_d
					gtr36_pickup_e
					gtr36_pickup_f
					gtr36_emg
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_36_knobs
					gtr_36_knobs_a
					gtr_36_knobs_b
					gtr_36_knobs_c
					gtr_36_knobs_d
					gtr_36_knobs_e
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr36_hardware01
					gtr36_bridge_fr
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr36_nekhed
					gtr36_nekhed_b
					gtr36_nekhed_c
					gtr36_nekhed_d
					gtr36_nekhed_e
					gtr36_nekhed_f
				]
			}
			{
				part = cas_guitar_neck
				valid = [
					gtr_fboard_v1000
					gtr31_fboard_02
					gtr31_fboard_03
					gtr36_fboard
				]
			}
		]
	}
	{
		desc_id = gtr37_esp_rw
		frontend_desc = qs(0x743000b2)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR37_RW01.skin'
		pak_num = 1
		is_esp = 1
		price = 750
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr37_rw_d.dds'
				material = gtr37_rw_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x3f47b13d)
				mask = $gtr37_rw
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr37_rw_d.dds'
				material = gtr37_rw_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $gtr37_rw_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_rw_d.dds'
				material = gtr37_rw_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_43
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_rw_d.dds'
				material = gtr37_rw_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_43
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr37_rw_d.dds'
				material = gtr37_rw_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_43
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr37_rw_d.dds'
				material = gtr37_rw_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_43
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr37_rw_d.dds'
				material = gtr37_rw_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_43
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr37_rw_d.dds'
				material = gtr37_rw_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_43
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr37_rw_d.dds'
				material = gtr37_rw_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_43
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr37_rw_d.dds'
				material = gtr37_rw_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_43
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr37_rw_d.dds'
				material = gtr37_rw_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_43
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr37_rw_d.dds'
				material = gtr37_rw_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_43
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr37_rw_d.dds'
				material = gtr37_rw_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_43
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr37_pguard01
					None
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr37_pickup
					gtr38_pickup
					gtr37_pickup_gold
					gtr37_pickup_d
					gtr37_pickup_e
					gtr37_pickup_f
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr37_knobs01
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr37_bridge
					gtr37_hardware
					gtr37_brdg_strgthru
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr37_neckhead
					gtr37_neckhead_b
					gtr37_neckhead_c
					gtr37_neckhead_d
					gtr37_neckhead_e
					gtr37_neckhead_f
				]
			}
			{
				part = cas_guitar_neck
				valid = [
					gtr_fboard_22
					gtr_fboard_22b
					gtr_fboard_22c
				]
			}
		]
	}
	{
		desc_id = gtr38_wave
		frontend_desc = qs(0x5dd0cdac)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR38_WV.skin'
		pak_num = 1
		polaroid = guitars_waveb
		is_metallica = 1
		price = 10000
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr38_trans01_d.dds'
				material = gtr38_trans_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x3f47b13d)
				mask = $gtr38_wave
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr38_trans01_d.dds'
				material = gtr38_trans_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $gtr38_trans_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr38_trans01_d.dds'
				material = gtr38_trans_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_6
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr38_trans01_d.dds'
				material = gtr38_trans_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_6
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr38_trans01_d.dds'
				material = gtr38_trans_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_6
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr38_trans01_d.dds'
				material = gtr38_trans_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_6
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr38_trans01_d.dds'
				material = gtr38_trans_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_6
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr38_trans01_d.dds'
				material = gtr38_trans_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_6
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr38_trans01_d.dds'
				material = gtr38_trans_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_6
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr38_trans01_d.dds'
				material = gtr38_trans_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_6
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr38_trans01_d.dds'
				material = gtr38_trans_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_6
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr38_trans01_d.dds'
				material = gtr38_trans_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_6
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr38_trans01_d.dds'
				material = gtr38_trans_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_6
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					None
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr38_pickup
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr37_knobs01
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr37_bridge
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr38_neckhead
				]
			}
			{
				part = cas_guitar_neck
				valid = [
					gtr_fboard_22b
				]
			}
		]
		$car_rocker_guitars_factoredglobal_17
	}
	{
		desc_id = gtr12b_esp_bc
		frontend_desc = qs(0x9711a0c2)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR12b_ESP_BC.skin'
		pak_num = 0
		is_metallica = 1
		price = 1500
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr12b_esp_bc_d.dds'
				material = gtr12b_esp_bc_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x3f47b13d)
				mask = $gtr60b_esp_ninja
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr12b_esp_pg
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr12b_pkup_emg
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr12b_knob
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr12b_bridge
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr12b_neckhead
				]
			}
			{
				part = cas_guitar_neck
				valid = [
					gtr_fretboard_04
				]
			}
		]
	}
	{
		desc_id = gtr12c_esp_hr
		frontend_desc = qs(0xad5a20d1)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR12c_ESP_HR.skin'
		pak_num = 0
		is_metallica = 1
		price = 2000
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr12c_esp_hr_d.dds'
				material = gtr12c_esp_hr_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x3f47b13d)
				mask = $gtr12c_esp_hr
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					None
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr12b_pkup_emg
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr12c_knob
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr12c_bridge
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr12c_neckhead
				]
			}
			{
				part = cas_guitar_neck
				valid = [
					gtr_fretboard_01
				]
			}
		]
	}
	{
		desc_id = gtr12g_esp_gr
		frontend_desc = qs(0xa4825885)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR12g_ESP_GR.skin'
		pak_num = 0
		is_metallica = 1
		price = 2000
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr12g_esp_gr_d.dds'
				material = gtr12g_esp_gr_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x3f47b13d)
				mask = $gtr12g_esp_gr
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					None
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr12b_pkup_emg
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr12c_knob
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr12c_bridge
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr12g_neckhead
				]
			}
			{
				part = cas_guitar_neck
				valid = [
					gtr_fretboard_01
				]
			}
		]
	}
	{
		desc_id = gtr12d_esp_ch
		frontend_desc = qs(0xc488fb89)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR12D_ESP_CH.skin'
		pak_num = 0
		is_metallica = 1
		price = 1750
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr12d_esp_ch_d.dds'
				material = gtr12d_esp_ch_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x3f47b13d)
				mask = $gtr12d_esp_ch
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr12d_pg
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr12b_pkup_emg
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr12d_knob
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr12d_bridge
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr12d_neckhead
				]
			}
			{
				part = cas_guitar_neck
				valid = [
					gtr_fretboard_04
				]
			}
		]
	}
	{
		desc_id = gtr12e_esp_fd
		frontend_desc = qs(0x1571ea0d)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR12E_ESP_FD.skin'
		pak_num = 0
		is_metallica = 1
		price = 1500
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/GTR12E_ESP_FD_d.dds'
				material = gtr12e_esp_fd_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x3f47b13d)
				mask = $gtr12e_esp_fd
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr12e_esp_pg
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr12e_pkup_emg
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr12e_knob
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_bridge12e
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr12e_neckhead
				]
			}
			{
				part = cas_guitar_neck
				valid = [
					gtr_fretboard_04
				]
			}
		]
	}
	{
		desc_id = gtr12h_esp_kea
		frontend_desc = qs(0x640d05ce)
		mesh = 'models/CAR_Instruments/Guitar/ESP/gtr12H_esp_KEA.skin'
		pak_num = 0
		is_metallica = 1
		price = 2500
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr12h_esp_kea_d.dds'
				material = gtr12h_esp_kea_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x3f47b13d)
				mask = $gtr12h_esp_kea
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr12h_esp_pg
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr12b_pkup_emg
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr12h_knob
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr12h_bridge
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr12h_neckhead
				]
			}
			{
				part = cas_guitar_neck
				valid = [
					gtr_fretboard_04
				]
			}
		]
	}
	{
		desc_id = gtr62b_esp_jack
		frontend_desc = qs(0x13932c66)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR62b_ESP_Jack.skin'
		pak_num = 0
		is_metallica = 1
		price = 2000
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr62b_esp_jack_d.dds'
				material = gtr62b_esp_jack_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x3f47b13d)
				mask = $gtr62b_esp_jack
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr62b_esp_pg1
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr60b_pkup_emg
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr62b_knob_type01
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_hardware62
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr62b_neckhead
				]
			}
			{
				part = cas_guitar_neck
				valid = [
					gtr_fretboard_24
				]
			}
		]
	}
	{
		desc_id = gtr62_esp_alexi
		frontend_desc = qs(0xa26239e7)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR62_ESP_Alexi.skin'
		pak_num = 0
		is_esp = 1
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr62_esp_alexi_d.dds'
				material = gtr62_esp_alexi_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x3f47b13d)
				mask = $gtr62_esp_alexi
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr62_esp_alexi_d.dds'
				material = gtr62_esp_alexi_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $gtr62b_esp_jack_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr62_esp_alexi_d.dds'
				material = gtr62_esp_alexi_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_23
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr62_esp_alexi_d.dds'
				material = gtr62_esp_alexi_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_23
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr62_esp_alexi_d.dds'
				material = gtr62_esp_alexi_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_23
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr62_esp_alexi_d.dds'
				material = gtr62_esp_alexi_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_23
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr62_esp_alexi_d.dds'
				material = gtr62_esp_alexi_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_23
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr62_esp_alexi_d.dds'
				material = gtr62_esp_alexi_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_23
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr62_esp_alexi_d.dds'
				material = gtr62_esp_alexi_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_23
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr62_esp_alexi_d.dds'
				material = gtr62_esp_alexi_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_23
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr62_esp_alexi_d.dds'
				material = gtr62_esp_alexi_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_23
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr62_esp_alexi_d.dds'
				material = gtr62_esp_alexi_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_23
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr62_esp_alexi_d.dds'
				material = gtr62_esp_alexi_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_23
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					None
					gtr62_esp_pg1
					gtr62_esp_pg1b
					gtr62_esp_pg2
					gtr62_esp_pg2b
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr62_esp_emg
					gtr62_pkup_blk
					gtr3_esp_emg_pkup_2
					gtr6_pkup_worngold_2
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr62_knob_type03
					gtr62_knob_type02
					gtr62_knob_type01
					gtr62_knob_type04
					gtr62_knob_type05
					gtr62_knob_type06
					None
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_hardware62a
					gtr_hardware02
					gtr_hardware64
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr62_neckhead
					gtr62_neckhead2
					gtr62_neckhead3
					gtr62_neckhead_04
					gtr62_neckhead_05
					gtr62_neckhead_06
				]
			}
			{
				part = cas_guitar_neck
				valid = [
					gtr_fretboard24_01
					gtr_fretboard24_02
					gtr_fretboard24_03
					gtr_fretboard24_04
					gtr_fretboard_01
					gtr_fretboard_02
					gtr_fretboard_03
					gtr_fretboard_04
				]
			}
		]
	}
	{
		desc_id = gtr63_esp_ex
		frontend_desc = qs(0xa4130561)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR63_ESP_EX.skin'
		pak_num = 0
		is_metallica = 1
		price = 1500
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr63_esp_ex_d.dds'
				material = gtr63_esp_ex_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x3f47b13d)
				mask = $gtr63_esp_ex
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					None
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr60b_pkup_emg
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr63_knob_type1
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_hardware63c
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr63_neckhead
				]
			}
			{
				part = cas_guitar_neck
				valid = [
					gtr_fretboard_01
				]
			}
		]
	}
	{
		desc_id = gtr63b_esp_ex
		frontend_desc = qs(0x2fa28767)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR63b_ESP_EX.skin'
		pak_num = 0
		is_metallica = 1
		price = 5000
		polaroid = guitars_tattoo
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr63b_esp_ex_d.dds'
				material = gtr63b_esp_ex_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x3f47b13d)
				mask = $gtr63b_esp_ex
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					None
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr60b_pkup_emg
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr63_knob_type1
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_hardware63c
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr63b_neckhead
				]
			}
			{
				part = cas_guitar_neck
				valid = [
					gtr_fretboard_01
				]
			}
		]
		$car_rocker_guitars_factoredglobal_17
	}
	{
		desc_id = gtr63c_esp_ex
		frontend_desc = qs(0x15fcc697)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR63c_ESP_EX.skin'
		pak_num = 0
		is_metallica = 1
		price = 2500
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr63c_esp_ex_d.dds'
				material = gtr63c_esp_ex_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_57
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					None
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr63c_pkup_emg
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr63c_knob_type1
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_hardware63c
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr63c_neckhead
				]
			}
			{
				part = cas_guitar_neck
				valid = [
					gtr_fretboard_01
				]
			}
		]
	}
	{
		desc_id = gtr63d_esp_ex
		frontend_desc = qs(0xd69185bf)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR63d_ESP_EX.skin'
		pak_num = 0
		is_metallica = 1
		price = 2000
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr63d_esp_ex_d.dds'
				material = gtr63d_esp_ex_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x3f47b13d)
				mask = $gtr63d_esp_ex
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					None
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr60b_pkup_emg
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr63_knob_type1
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_hardware63c
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr63d_neckhead
				]
			}
			{
				part = cas_guitar_neck
				valid = [
					gtr_fretboard_01
				]
			}
		]
	}
	{
		desc_id = gtr63e_esp_ex
		frontend_desc = qs(0xd8946563)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR63e_ESP_EX.skin'
		pak_num = 0
		is_metallica = 1
		price = 1500
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr63e_esp_ex_d.dds'
				material = gtr63e_esp_ex_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x3f47b13d)
				mask = $gtr63e_esp_ex
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr63e_esp_pg1
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr60b_pkup_emg
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr63_knob_type1
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_hardware63c
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr63e_neckhead
				]
			}
			{
				part = cas_guitar_neck
				valid = [
					gtr_fretboard_01
				]
			}
		]
	}
	{
		desc_id = gtr63f_esp_ex
		frontend_desc = qs(0xaa5593a3)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR63f_ESP_EX.skin'
		pak_num = 1
		is_esp = 1
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr63f_esp_ex_d.dds'
				material = gtr63f_esp_ex_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x3f47b13d)
				mask = $gtr63f_esp_ex
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr63f_esp_ex_d.dds'
				material = gtr63f_esp_ex_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $gtr63f_esp_ex_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr63f_esp_ex_d.dds'
				material = gtr63f_esp_ex_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_43
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr63f_esp_ex_d.dds'
				material = gtr63f_esp_ex_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_43
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr63f_esp_ex_d.dds'
				material = gtr63f_esp_ex_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_43
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr63f_esp_ex_d.dds'
				material = gtr63f_esp_ex_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_43
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr63f_esp_ex_d.dds'
				material = gtr63f_esp_ex_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_43
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr63f_esp_ex_d.dds'
				material = gtr63f_esp_ex_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_43
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr63f_esp_ex_d.dds'
				material = gtr63f_esp_ex_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_43
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr63f_esp_ex_d.dds'
				material = gtr63f_esp_ex_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_43
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr63f_esp_ex_d.dds'
				material = gtr63f_esp_ex_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_43
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr63f_esp_ex_d.dds'
				material = gtr63f_esp_ex_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_43
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr63f_esp_ex_d.dds'
				material = gtr63f_esp_ex_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_43
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					None
					gtr63f_esp_pg1
					gtr63f_esp_pg1b
					gtr63f_esp_pg2
					gtr63f_esp_pg2b
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr62_esp_emg
					gtr62_pkup_blk
					gtr3_esp_emg_pkup_2
					gtr6_pkup_worngold_2
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr63_knob_type06
					gtr63_knob_type2
					gtr63_knob_type3
					gtr63_knob_type4
					gtr63_knob_type5
					gtr63c_knob_type1
					None
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_hardware63f
					gtr_hardware63b
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr63f_neckhead
					gtr63_neckhead2
					gtr63_neckhead3
					gtr63_neckhead_04
					gtr63_neckhead_05
					gtr63_neckhead_06
				]
			}
			{
				part = cas_guitar_neck
				valid = [
					gtr_fretboard_01
					gtr_fretboard_02
					gtr_fretboard_03
					gtr_fretboard_04
					gtr_fretboard24_01
					gtr_fretboard24_02
					gtr_fretboard24_03
					gtr_fretboard24_04
				]
			}
		]
	}
	{
		desc_id = gtr63g_esp_ex
		frontend_desc = qs(0x85d7ebcc)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR63g_ESP_EX.skin'
		pak_num = 1
		is_metallica = 1
		price = 1000
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr63g_esp_ex_d.dds'
				material = gtr63g_esp_ex_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_57
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					None
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr63c_pkup_emg
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr63g_knob_type1
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_hardware63c
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr63g_neckhead
				]
			}
			{
				part = cas_guitar_neck
				valid = [
					gtr_fretboard_01
				]
			}
		]
	}
	{
		desc_id = gtr64_esp_f
		frontend_desc = qs(0x5782ad70)
		mesh = 'models/CAR_Instruments/Guitar/ESP/gtr64_esp_F.skin'
		pak_num = 1
		is_esp = 1
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr64_esp_f_d.dds'
				material = gtr64_esp_f_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x3f47b13d)
				mask = $gtr64_esp_f
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr64_esp_f_d.dds'
				material = gtr64_esp_f_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $gtr64_esp_f_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_esp_f_d.dds'
				material = gtr64_esp_f_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_26
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_esp_f_d.dds'
				material = gtr64_esp_f_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_26
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr64_esp_f_d.dds'
				material = gtr64_esp_f_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_26
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr64_esp_f_d.dds'
				material = gtr64_esp_f_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_26
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr64_esp_f_d.dds'
				material = gtr64_esp_f_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_26
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr64_esp_f_d.dds'
				material = gtr64_esp_f_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_26
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr64_esp_f_d.dds'
				material = gtr64_esp_f_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_26
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr64_esp_f_d.dds'
				material = gtr64_esp_f_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_26
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr64_esp_f_d.dds'
				material = gtr64_esp_f_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_26
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr64_esp_f_d.dds'
				material = gtr64_esp_f_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_26
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr64_esp_f_d.dds'
				material = gtr64_esp_f_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_26
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					None
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr62_esp_emg
					gtr62_pkup_blk
					gtr3_esp_emg_pkup_2
					gtr6_pkup_worngold_2
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr64_knob_type1
					gtr64_knob_type2
					gtr64_knob_type3
					gtr64_knob_type4
					gtr64_knob_type5
					gtr64_knob_type6
					None
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_hardware64b
					gtr_hardware64f
					gtr_hardware64bb
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr64_neckhead
					gtr64_neckhead2
					gtr64_neckhead3
					gtr64_neckhead_04
					gtr64_neckhead_05
					gtr64_neckhead_06
				]
			}
			{
				part = cas_guitar_neck
				valid = [
					gtr_fretboard_01
					gtr_fretboard_02
					gtr_fretboard_03
					gtr_fretboard_04
					gtr_fretboard24_01
					gtr_fretboard24_02
					gtr_fretboard24_03
					gtr_fretboard24_04
				]
			}
		]
	}
	{
		desc_id = gtr65_var
		frontend_desc = qs(0x5421d4ed)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR65_Var.skin'
		pak_num = 1
		is_metallica = 1
		price = 1500
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr65_var_d.dds'
				material = gtr65_var_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_64
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					None
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr65_pickup_dummy
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					None
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_bridge_65
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr65_neckhead
				]
			}
			{
				part = cas_guitar_neck
				valid = [
					gtr_fretboard_65
				]
			}
		]
	}
	{
		desc_id = gtr65b_var
		frontend_desc = qs(0xc18828c2)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR65b_Var.skin'
		pak_num = 1
		is_metallica = 1
		price = 1500
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr65b_var_d.dds'
				material = gtr65b_var_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_64
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					None
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr65_pickup_dummy
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					None
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_bridge_65
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr65b_neckhead
				]
			}
			{
				part = cas_guitar_neck
				valid = [
					gtr_fretboard_65
				]
			}
		]
	}
	{
		desc_id = gtr66_esp_shini
		frontend_desc = qs(0xa956861e)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR66_ESP_Shini.skin'
		pak_num = 0
		price = 3000
		polaroid = guitars_shini
		is_esp = 1
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					None
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_pickup_type66
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr66_knob_type1
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_hardware66
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr66_neckhead
				]
			}
			{
				part = cas_guitar_neck
				valid = [
					gtr_fretboard_66
				]
			}
		]
		$car_rocker_guitars_factoredglobal_17
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
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_67
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style1_D_01.dds'
				material = guitar_body_style_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_67
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style1_D_01.dds'
				material = guitar_body_style_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_68
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style1_D_01.dds'
				material = guitar_body_style_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_68
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style1_D_01.dds'
				material = guitar_body_style_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_68
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style1_D_01.dds'
				material = guitar_body_style_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_68
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style1_D_01.dds'
				material = guitar_body_style_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_68
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style1_D_01.dds'
				material = guitar_body_style_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_68
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style1_D_01.dds'
				material = guitar_body_style_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_68
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style1_D_01.dds'
				material = guitar_body_style_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_68
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style1_D_01.dds'
				material = guitar_body_style_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_68
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					guitar_pickg01
					gtr_body1_pickg02
					gtr_body1_pickg03
					None
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
					gtr_pickup_type6_tkd_03
					gtr_pickup_type6_tkd_02
					gtr_pickup_type6_tkd_01
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
					None
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
				$car_rocker_guitars_factoredglobal_1
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
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_6
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style2_D_01.dds'
				material = guitar_body_style_02_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_6
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style2_D_01.dds'
				material = guitar_body_style_02_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_6
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style2_D_01.dds'
				material = guitar_body_style_02_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_6
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style2_D_01.dds'
				material = guitar_body_style_02_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_6
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style2_D_01.dds'
				material = guitar_body_style_02_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_6
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style2_D_01.dds'
				material = guitar_body_style_02_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_6
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style2_D_01.dds'
				material = guitar_body_style_02_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_6
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style2_D_01.dds'
				material = guitar_body_style_02_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_6
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style2_D_01.dds'
				material = guitar_body_style_02_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_6
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style2_D_01.dds'
				material = guitar_body_style_02_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_6
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_body2_pickg02
					gtr_body2_pickg01
					gtr_body2_pickg03
					None
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
					None
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
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_72
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style3_D_01.dds'
				material = guitar_body_style_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_72
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style3_D_01.dds'
				material = guitar_body_style_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_72
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style3_D_01.dds'
				material = guitar_body_style_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_72
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style3_D_01.dds'
				material = guitar_body_style_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_72
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style3_D_01.dds'
				material = guitar_body_style_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_72
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style3_D_01.dds'
				material = guitar_body_style_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_72
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style3_D_01.dds'
				material = guitar_body_style_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_72
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style3_D_01.dds'
				material = guitar_body_style_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_72
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style3_D_01.dds'
				material = guitar_body_style_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_72
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style3_D_01.dds'
				material = guitar_body_style_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_72
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_body3_pickg01
					gtr_body3_pickg02
					gtr_body3_pickg03
					None
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
					None
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
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_75
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style4_D_01.dds'
				material = guitar_body_style_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_75
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style4_D_01.dds'
				material = guitar_body_style_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_75
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style4_D_01.dds'
				material = guitar_body_style_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_75
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style4_D_01.dds'
				material = guitar_body_style_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_75
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style4_D_01.dds'
				material = guitar_body_style_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_75
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style4_D_01.dds'
				material = guitar_body_style_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_75
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style4_D_01.dds'
				material = guitar_body_style_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_75
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style4_D_01.dds'
				material = guitar_body_style_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_75
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style4_D_01.dds'
				material = guitar_body_style_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_75
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style4_D_01.dds'
				material = guitar_body_style_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_75
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_body4_pickg01
					gtr_body4_pickg02
					gtr_body4_pickg03
					None
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
					None
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
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_75
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style5_D_01.dds'
				material = guitar_body_style_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_75
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style5_D_01.dds'
				material = guitar_body_style_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_75
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style5_D_01.dds'
				material = guitar_body_style_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_75
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style5_D_01.dds'
				material = guitar_body_style_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_75
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style5_D_01.dds'
				material = guitar_body_style_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_75
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style5_D_01.dds'
				material = guitar_body_style_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_75
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style5_D_01.dds'
				material = guitar_body_style_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_75
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style5_D_01.dds'
				material = guitar_body_style_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_75
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style5_D_01.dds'
				material = guitar_body_style_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_75
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style5_D_01.dds'
				material = guitar_body_style_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_75
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_body5_pickg02
					gtr_body5_pickg03
					gtr_body5_pickg01
					None
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
					None
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
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_75
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style6_D_01.dds'
				material = guitar_body_style_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_75
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style6_D_01.dds'
				material = guitar_body_style_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_75
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style6_D_01.dds'
				material = guitar_body_style_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_75
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style6_D_01.dds'
				material = guitar_body_style_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_75
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style6_D_01.dds'
				material = guitar_body_style_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_75
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style6_D_01.dds'
				material = guitar_body_style_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_75
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style6_D_01.dds'
				material = guitar_body_style_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_75
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style6_D_01.dds'
				material = guitar_body_style_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_75
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style6_D_01.dds'
				material = guitar_body_style_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_75
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style6_D_01.dds'
				material = guitar_body_style_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_75
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_body6_pickg01
					gtr_body6_pickg02
					gtr_body6_pickg03
					None
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
					None
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
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				initial_values = {
					x_trans = -28
					x_scale = 30
					y_scale = 60
					y_trans = 30
				}
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style7_D_01.dds'
				material = guitar_body_style_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_83
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style7_D_01.dds'
				material = guitar_body_style_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_83
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style7_D_01.dds'
				material = guitar_body_style_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_83
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style7_D_01.dds'
				material = guitar_body_style_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_83
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style7_D_01.dds'
				material = guitar_body_style_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_83
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style7_D_01.dds'
				material = guitar_body_style_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_83
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style7_D_01.dds'
				material = guitar_body_style_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_83
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style7_D_01.dds'
				material = guitar_body_style_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_83
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style7_D_01.dds'
				material = guitar_body_style_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_83
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style7_D_01.dds'
				material = guitar_body_style_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_83
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_body7_pickg01
					gtr_body7_pickg02
					gtr_body7_pickg03
					None
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
					None
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
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_86
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style8_D_01.dds'
				material = guitar_body_style_08_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_86
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style8_D_01.dds'
				material = guitar_body_style_08_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_86
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style8_D_01.dds'
				material = guitar_body_style_08_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_86
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style8_D_01.dds'
				material = guitar_body_style_08_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_86
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style8_D_01.dds'
				material = guitar_body_style_08_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_86
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style8_D_01.dds'
				material = guitar_body_style_08_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_86
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style8_D_01.dds'
				material = guitar_body_style_08_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_86
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style8_D_01.dds'
				material = guitar_body_style_08_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_86
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style8_D_01.dds'
				material = guitar_body_style_08_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_86
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style8_D_01.dds'
				material = guitar_body_style_08_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_86
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_body8_pickg01
					gtr_body8_pickg02
					gtr_body8_pickg03
					None
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
					None
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
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_86
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style9_D_01.dds'
				material = guitar_body_style_09_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_86
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style9_D_01.dds'
				material = guitar_body_style_09_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_86
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style9_D_01.dds'
				material = guitar_body_style_09_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_86
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style9_D_01.dds'
				material = guitar_body_style_09_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_86
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style9_D_01.dds'
				material = guitar_body_style_09_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_86
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style9_D_01.dds'
				material = guitar_body_style_09_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_86
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style9_D_01.dds'
				material = guitar_body_style_09_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_86
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style9_D_01.dds'
				material = guitar_body_style_09_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_86
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style9_D_01.dds'
				material = guitar_body_style_09_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_86
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style9_D_01.dds'
				material = guitar_body_style_09_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_86
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_body9_pickg01
					gtr_body9_pickg02
					gtr_body9_pickg03
					None
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
					None
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
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_91
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style10_D_01.dds'
				material = guitar_body_style_10_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_91
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style10_D_01.dds'
				material = guitar_body_style_10_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_91
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style10_D_01.dds'
				material = guitar_body_style_10_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_91
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style10_D_01.dds'
				material = guitar_body_style_10_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_91
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style10_D_01.dds'
				material = guitar_body_style_10_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_91
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style10_D_01.dds'
				material = guitar_body_style_10_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_91
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style10_D_01.dds'
				material = guitar_body_style_10_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_91
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style10_D_01.dds'
				material = guitar_body_style_10_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_91
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style10_D_01.dds'
				material = guitar_body_style_10_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_91
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style10_D_01.dds'
				material = guitar_body_style_10_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_91
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_body10_pickg01
					gtr_body10_pickg02
					gtr_body10_pickg03
					None
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
					None
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
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_94
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style11_D_01.dds'
				material = guitar_body_style_11_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_94
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style11_D_01.dds'
				material = guitar_body_style_11_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_94
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style11_D_01.dds'
				material = guitar_body_style_11_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_94
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style11_D_01.dds'
				material = guitar_body_style_11_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_94
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style11_D_01.dds'
				material = guitar_body_style_11_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_94
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style11_D_01.dds'
				material = guitar_body_style_11_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_94
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style11_D_01.dds'
				material = guitar_body_style_11_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_94
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style11_D_01.dds'
				material = guitar_body_style_11_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_94
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style11_D_01.dds'
				material = guitar_body_style_11_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_94
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style11_D_01.dds'
				material = guitar_body_style_11_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_94
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_body11_pickg01
					gtr_body11_pickg02
					gtr_body11_pickg03
					None
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
					None
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
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_91
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style12_D_01.dds'
				material = guitar_body_style_12_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_91
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style12_D_01.dds'
				material = guitar_body_style_12_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_91
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style12_D_01.dds'
				material = guitar_body_style_12_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_91
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style12_D_01.dds'
				material = guitar_body_style_12_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_91
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style12_D_01.dds'
				material = guitar_body_style_12_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_91
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style12_D_01.dds'
				material = guitar_body_style_12_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_91
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style12_D_01.dds'
				material = guitar_body_style_12_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_91
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style12_D_01.dds'
				material = guitar_body_style_12_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_91
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style12_D_01.dds'
				material = guitar_body_style_12_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_91
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style12_D_01.dds'
				material = guitar_body_style_12_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_91
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_body12_pickg01
					gtr_body12_pickg02
					gtr_body12_pickg03
					None
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
					None
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
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_91
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style13_D_01.dds'
				material = guitar_body_style_13_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_91
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style13_D_01.dds'
				material = guitar_body_style_13_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_91
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style13_D_01.dds'
				material = guitar_body_style_13_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_91
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style13_D_01.dds'
				material = guitar_body_style_13_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_91
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style13_D_01.dds'
				material = guitar_body_style_13_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_91
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style13_D_01.dds'
				material = guitar_body_style_13_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_91
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style13_D_01.dds'
				material = guitar_body_style_13_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_91
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style13_D_01.dds'
				material = guitar_body_style_13_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_91
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style13_D_01.dds'
				material = guitar_body_style_13_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_91
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style13_D_01.dds'
				material = guitar_body_style_13_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_91
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_body13_pickg01
					gtr_body13_pickg02
					gtr_body13_pickg03
					None
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
					None
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
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_91
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style14_D_01.dds'
				material = guitar_body_style_14_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_91
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style14_D_01.dds'
				material = guitar_body_style_14_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_91
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style14_D_01.dds'
				material = guitar_body_style_14_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_91
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style14_D_01.dds'
				material = guitar_body_style_14_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_91
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style14_D_01.dds'
				material = guitar_body_style_14_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_91
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style14_D_01.dds'
				material = guitar_body_style_14_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_91
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style14_D_01.dds'
				material = guitar_body_style_14_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_91
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style14_D_01.dds'
				material = guitar_body_style_14_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_91
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style14_D_01.dds'
				material = guitar_body_style_14_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_91
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style14_D_01.dds'
				material = guitar_body_style_14_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_91
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_body14_pickg01
					gtr_body14_pickg02
					gtr_body14_pickg03
					None
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
					None
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
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_103
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style15_D_01.dds'
				material = guitar_body_style_15_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_103
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style15_D_01.dds'
				material = guitar_body_style_15_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_103
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style15_D_01.dds'
				material = guitar_body_style_15_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_103
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style15_D_01.dds'
				material = guitar_body_style_15_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_103
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style15_D_01.dds'
				material = guitar_body_style_15_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_103
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style15_D_01.dds'
				material = guitar_body_style_15_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_103
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style15_D_01.dds'
				material = guitar_body_style_15_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_103
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style15_D_01.dds'
				material = guitar_body_style_15_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_103
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style15_D_01.dds'
				material = guitar_body_style_15_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_103
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Body_Style15_D_01.dds'
				material = guitar_body_style_15_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_103
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_body15_pickg01
					gtr_body15_pickg02
					gtr_body15_pickg03
					None
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
					None
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
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_106
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_body01_d_mls.dds'
				material = guitar_body_prediktor_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_106
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_body01_d_mls.dds'
				material = guitar_body_prediktor_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_106
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_body01_d_mls.dds'
				material = guitar_body_prediktor_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_106
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_body01_d_mls.dds'
				material = guitar_body_prediktor_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_106
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_body01_d_mls.dds'
				material = guitar_body_prediktor_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_106
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_body01_d_mls.dds'
				material = guitar_body_prediktor_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_106
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_body01_d_mls.dds'
				material = guitar_body_prediktor_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_106
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_body01_d_mls.dds'
				material = guitar_body_prediktor_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_106
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_body01_d_mls.dds'
				material = guitar_body_prediktor_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_106
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_body01_d_mls.dds'
				material = guitar_body_prediktor_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_106
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
					None
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
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_103
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style17_d.dds'
				material = guitar_body_bandera_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_103
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style17_d.dds'
				material = guitar_body_bandera_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_103
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style17_d.dds'
				material = guitar_body_bandera_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_103
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style17_d.dds'
				material = guitar_body_bandera_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_103
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style17_d.dds'
				material = guitar_body_bandera_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_103
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style17_d.dds'
				material = guitar_body_bandera_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_103
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style17_d.dds'
				material = guitar_body_bandera_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_103
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style17_d.dds'
				material = guitar_body_bandera_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_103
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style17_d.dds'
				material = guitar_body_bandera_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_103
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style17_d.dds'
				material = guitar_body_bandera_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_103
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_body17_pickg01
					gtr_body17_pickg02
					gtr_body17_pickg03
					None
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
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_111
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style20_d_01.dds'
				material = guitar_body_style_20_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_111
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style20_d_01.dds'
				material = guitar_body_style_20_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_111
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style20_d_01.dds'
				material = guitar_body_style_20_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_111
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style20_d_01.dds'
				material = guitar_body_style_20_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_111
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style20_d_01.dds'
				material = guitar_body_style_20_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_111
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style20_d_01.dds'
				material = guitar_body_style_20_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_111
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style20_d_01.dds'
				material = guitar_body_style_20_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_111
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style20_d_01.dds'
				material = guitar_body_style_20_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_111
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style20_d_01.dds'
				material = guitar_body_style_20_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_111
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_body_style20_d_01.dds'
				material = guitar_body_style_20_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_111
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_body20_pickg02
					gtr_body20_pickg01
					gtr_body20_pickg03
					None
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
					None
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
		polaroid = guitar_rewards_clearcut
		price = 2000
		pak_num = 1
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_clear_d_11.dds'
				material = guitar_x_clear_11_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_112
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_x_clear_pickg01
					None
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
					None
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
		polaroid = guitar_rewards_blinding_light
		price = 5000
		mesh = 'models/CAR_Instruments/Guitar/Guitar_X_Clear_12.skin'
		pak_num = 1
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_clear_d_11.dds'
				material = guitar_x_clear_12_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_112
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_x_clear2_pickg02
					None
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
					None
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
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_115
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_peace_d_13.dds'
				material = gtr_body_x_peace_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_115
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_peace_d_13.dds'
				material = gtr_body_x_peace_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_115
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_peace_d_13.dds'
				material = gtr_body_x_peace_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_115
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_peace_d_13.dds'
				material = gtr_body_x_peace_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_115
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_peace_d_13.dds'
				material = gtr_body_x_peace_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_115
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_peace_d_13.dds'
				material = gtr_body_x_peace_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_115
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_peace_d_13.dds'
				material = gtr_body_x_peace_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_115
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_peace_d_13.dds'
				material = gtr_body_x_peace_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_115
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_peace_d_13.dds'
				material = gtr_body_x_peace_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_115
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_peace_d_13.dds'
				material = gtr_body_x_peace_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_115
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_x_peace_pickg01
					None
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
					None
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
		polaroid = guitar_rewards_body_anarchy
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
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_115
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_anarchy_d_03.dds'
				material = gtr_body_x_anarchy_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_115
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_anarchy_d_03.dds'
				material = gtr_body_x_anarchy_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_115
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_anarchy_d_03.dds'
				material = gtr_body_x_anarchy_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_115
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_anarchy_d_03.dds'
				material = gtr_body_x_anarchy_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_115
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_anarchy_d_03.dds'
				material = gtr_body_x_anarchy_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_115
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_anarchy_d_03.dds'
				material = gtr_body_x_anarchy_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_115
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_anarchy_d_03.dds'
				material = gtr_body_x_anarchy_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_115
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_anarchy_d_03.dds'
				material = gtr_body_x_anarchy_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_115
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_anarchy_d_03.dds'
				material = gtr_body_x_anarchy_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_115
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_anarchy_d_03.dds'
				material = gtr_body_x_anarchy_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_115
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_x_anarc_pickg02
					gtr_x_anarc_pickg01
					None
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
					gtr_pickup_type6_tkd_03
					gtr_pickup_type6_tkd_02
					gtr_pickup_type6_tkd_01
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
					None
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
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_skull_d_01.dds'
				material = gtr_body_x_skull_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_120
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_skull_d_01.dds'
				material = gtr_body_x_skull_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_120
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/Guitar_Special_Skull_D_01.dds'
				material = gtr_body_x_skull_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_120
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/Guitar_Special_Skull_D_01.dds'
				material = gtr_body_x_skull_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_120
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/Guitar_Special_Skull_D_01.dds'
				material = gtr_body_x_skull_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_120
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/Guitar_Special_Skull_D_01.dds'
				material = gtr_body_x_skull_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_120
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/Guitar_Special_Skull_D_01.dds'
				material = gtr_body_x_skull_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_120
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/Guitar_Special_Skull_D_01.dds'
				material = gtr_body_x_skull_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_120
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/Guitar_Special_Skull_D_01.dds'
				material = gtr_body_x_skull_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_120
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/Guitar_Special_Skull_D_01.dds'
				material = gtr_body_x_skull_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_120
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/Guitar_Special_Skull_D_01.dds'
				material = gtr_body_x_skull_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_120
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_x_skull_pickg01
					None
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_x1_skull_pickup_01
					gtr_pickup_skul1_blk_01
					gtr_pickup_skul1_blktan_01
					None
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
					None
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
		polaroid = guitar_rewards_body_spider
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
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_123
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/Guitar_Special_Spider_D_01.dds'
				material = gtr_body_x_spider_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_123
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/Guitar_Special_Spider_D_01.dds'
				material = gtr_body_x_spider_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_123
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/Guitar_Special_Spider_D_01.dds'
				material = gtr_body_x_spider_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_123
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/Guitar_Special_Spider_D_01.dds'
				material = gtr_body_x_spider_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_123
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/Guitar_Special_Spider_D_01.dds'
				material = gtr_body_x_spider_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_123
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/Guitar_Special_Spider_D_01.dds'
				material = gtr_body_x_spider_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_123
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/Guitar_Special_Spider_D_01.dds'
				material = gtr_body_x_spider_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_123
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/Guitar_Special_Spider_D_01.dds'
				material = gtr_body_x_spider_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_123
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/Guitar_Special_Spider_D_01.dds'
				material = gtr_body_x_spider_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_123
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/Guitar_Special_Spider_D_01.dds'
				material = gtr_body_x_spider_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_123
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_x_spider_pickg01
					None
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
					None
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
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_126
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_icross_d_04.dds'
				material = gtr_body_x_icross_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_126
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_icross_d_04.dds'
				material = gtr_body_x_icross_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_126
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_icross_d_04.dds'
				material = gtr_body_x_icross_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_126
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_icross_d_04.dds'
				material = gtr_body_x_icross_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_126
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_icross_d_04.dds'
				material = gtr_body_x_icross_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_126
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_icross_d_04.dds'
				material = gtr_body_x_icross_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_126
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_icross_d_04.dds'
				material = gtr_body_x_icross_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_126
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_icross_d_04.dds'
				material = gtr_body_x_icross_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_126
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_icross_d_04.dds'
				material = gtr_body_x_icross_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_126
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_icross_d_04.dds'
				material = gtr_body_x_icross_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_126
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_x_xross_pickg01
					None
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
					None
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
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_129
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_battle_axe_d_05.dds'
				material = gtr_body_x_battleaxe_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_129
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_battle_axe_d_05.dds'
				material = gtr_body_x_battleaxe_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_129
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_battle_axe_d_05.dds'
				material = gtr_body_x_battleaxe_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_129
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_battle_axe_d_05.dds'
				material = gtr_body_x_battleaxe_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_129
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_battle_axe_d_05.dds'
				material = gtr_body_x_battleaxe_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_129
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_battle_axe_d_05.dds'
				material = gtr_body_x_battleaxe_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_129
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_battle_axe_d_05.dds'
				material = gtr_body_x_battleaxe_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_129
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_battle_axe_d_05.dds'
				material = gtr_body_x_battleaxe_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_129
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_battle_axe_d_05.dds'
				material = gtr_body_x_battleaxe_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_129
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_battle_axe_d_05.dds'
				material = gtr_body_x_battleaxe_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_129
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_x_spider_pickg01
					None
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
					None
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
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_132
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_heart_d_06.dds'
				material = gtr_body_x_heart_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_132
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_heart_d_06.dds'
				material = gtr_body_x_heart_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_132
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_heart_d_06.dds'
				material = gtr_body_x_heart_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_132
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_heart_d_06.dds'
				material = gtr_body_x_heart_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_132
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_heart_d_06.dds'
				material = gtr_body_x_heart_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_132
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_heart_d_06.dds'
				material = gtr_body_x_heart_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_132
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_heart_d_06.dds'
				material = gtr_body_x_heart_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_132
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_heart_d_06.dds'
				material = gtr_body_x_heart_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_132
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_heart_d_06.dds'
				material = gtr_body_x_heart_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_132
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_heart_d_06.dds'
				material = gtr_body_x_heart_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_132
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_x_heart_pickg01
					gtr_x_heart_pickg02
					None
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
					None
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
		polaroid = guitar_rewards_body_money
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
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_135
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_money_d_07.dds'
				material = gtr_body_x_money_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_135
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_money_d_07.dds'
				material = gtr_body_x_money_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_135
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_money_d_07.dds'
				material = gtr_body_x_money_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_135
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_money_d_07.dds'
				material = gtr_body_x_money_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_135
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_money_d_07.dds'
				material = gtr_body_x_money_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_135
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_money_d_07.dds'
				material = gtr_body_x_money_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_135
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_money_d_07.dds'
				material = gtr_body_x_money_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_135
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_money_d_07.dds'
				material = gtr_body_x_money_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_135
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_money_d_07.dds'
				material = gtr_body_x_money_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_135
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_money_d_07.dds'
				material = gtr_body_x_money_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_135
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_x_money_pickg01
					None
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
					None
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
		polaroid = guitar_rewards_body_flame
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
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_138
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_flames_d_08.dds'
				material = gtr_body_x_flames_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_138
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_flames_d_08.dds'
				material = gtr_body_x_flames_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_139
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_flames_d_08.dds'
				material = gtr_body_x_flames_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_139
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_flames_d_08.dds'
				material = gtr_body_x_flames_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_139
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_flames_d_08.dds'
				material = gtr_body_x_flames_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_139
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_flames_d_08.dds'
				material = gtr_body_x_flames_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_139
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_flames_d_08.dds'
				material = gtr_body_x_flames_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_139
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_flames_d_08.dds'
				material = gtr_body_x_flames_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_139
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_flames_d_08.dds'
				material = gtr_body_x_flames_primary
				$car_rocker_guitars_factoredglobal_4
				desc_id = `font	a3`
				frontend_desc = qs(0x5c8b3f2b)
				mask = $car_fontgrid_text_a3
				$car_rocker_guitars_factoredglobal_139
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_flames_d_08.dds'
				material = gtr_body_x_flames_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_139
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_flames_d_08.dds'
				material = gtr_body_x_flames_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_139
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_x_fire_pickg02
					gtr_x_fire_pickg01
					None
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
					None
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
		polaroid = guitar_rewards_body_freebird
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
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_143
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_bird_d_09.dds'
				material = gtr_body_x_bird_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_143
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_bird_d_09.dds'
				material = gtr_body_x_bird_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_143
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_bird_d_09.dds'
				material = gtr_body_x_bird_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_143
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_bird_d_09.dds'
				material = gtr_body_x_bird_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_143
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_bird_d_09.dds'
				material = gtr_body_x_bird_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_143
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_bird_d_09.dds'
				material = gtr_body_x_bird_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_143
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_bird_d_09.dds'
				material = gtr_body_x_bird_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_143
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_bird_d_09.dds'
				material = gtr_body_x_bird_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_143
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_bird_d_09.dds'
				material = gtr_body_x_bird_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_143
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_bird_d_09.dds'
				material = gtr_body_x_bird_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_143
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_x_bird_pickg01
					None
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
					None
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
		polaroid = guitar_rewards_body_trident
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
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_146
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_trident_d_10.dds'
				material = gtr_body_x_trident_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_146
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_trident_d_10.dds'
				material = gtr_body_x_trident_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_146
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_trident_d_10.dds'
				material = gtr_body_x_trident_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_146
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_trident_d_10.dds'
				material = gtr_body_x_trident_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_146
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_trident_d_10.dds'
				material = gtr_body_x_trident_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_146
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_trident_d_10.dds'
				material = gtr_body_x_trident_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_146
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_trident_d_10.dds'
				material = gtr_body_x_trident_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_146
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_trident_d_10.dds'
				material = gtr_body_x_trident_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_146
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_trident_d_10.dds'
				material = gtr_body_x_trident_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_146
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_trident_d_10.dds'
				material = gtr_body_x_trident_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_146
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_x_trident_pickg01
					None
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
					None
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
		price = 1500
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
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_115
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_yinyang_d_14.dds'
				material = gtr_body_x_yinyang_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_115
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_yinyang_d_14.dds'
				material = gtr_body_x_yinyang_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_115
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_yinyang_d_14.dds'
				material = gtr_body_x_yinyang_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_115
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_yinyang_d_14.dds'
				material = gtr_body_x_yinyang_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_115
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_yinyang_d_14.dds'
				material = gtr_body_x_yinyang_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_115
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_yinyang_d_14.dds'
				material = gtr_body_x_yinyang_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_115
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_yinyang_d_14.dds'
				material = gtr_body_x_yinyang_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_115
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_yinyang_d_14.dds'
				material = gtr_body_x_yinyang_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_115
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_yinyang_d_14.dds'
				material = gtr_body_x_yinyang_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_115
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/guitar_special_yinyang_d_14.dds'
				material = gtr_body_x_yinyang_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_115
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr_x_yinyang_pickg01
					None
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
					None
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
		desc_id = gtr5_pickguard_01
		frontend_desc = qs(0x92daee0c)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR5_Pickguard_01.skin'
	}
	{
		desc_id = gtr12_pickguard_01
		frontend_desc = qs(0xeedf1855)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR12_Pickguard_01.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr12_pickguard_d_01.dds'
				material = gtr12_pickguard_01_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $gtr12_pickguard_01
			}
		]
	}
	{
		desc_id = gtr12_pickguard_01b
		frontend_desc = qs(0xa68dfcac)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR12_Pickguard_01b.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr12_pickguard_d_01b.dds'
				material = gtr12_pickguard_01b_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $gtr12_pickguard_01b
			}
		]
	}
	{
		desc_id = gtr12_pickguard_02
		frontend_desc = qs(0x6525555e)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR12_Pickguard_02.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/GTR12_Pickguard_02_D.dds'
				material = gtr12_pickguard_02_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $gtr12_pickguard_02
			}
		]
	}
	{
		desc_id = gtr12_pickguard_02b
		frontend_desc = qs(0x81272891)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR12_Pickguard_02b.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr12_pickguard_02b.dds'
				material = gtr12_pickguard_02b_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $gtr12_pickguard_02b
			}
		]
	}
	{
		desc_id = gtr12b_esp_pg
		frontend_desc = qs(0xffe9bc39)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR12b_ESP_PG.skin'
	}
	{
		desc_id = gtr12d_pg
		frontend_desc = qs(0xdf2f42c9)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR12D_PG.skin'
	}
	{
		desc_id = gtr12e_esp_pg
		frontend_desc = qs(0x640db994)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR12E_ESP_PG.skin'
	}
	{
		desc_id = gtr12h_esp_pg
		frontend_desc = qs(0xbf40ec5c)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR12H_ESP_PG.skin'
	}
	{
		desc_id = gtr31_pgard
		frontend_desc = qs(0x32d68597)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR31_PGard.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr31_vipepgard_d.dds'
				material = gtr31_pgard_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $gtr31_pg
			}
		]
	}
	{
		desc_id = gtr33_switch01
		frontend_desc = qs(0x04742233)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR33_Switch01.skin'
		pak_num = 0
		is_esp = 1
		is_metallica = 1
		i
	}
	{
		desc_id = gtr36_pgard
		frontend_desc = qs(0x2bd2f2fd)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR36_PGARD.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr36_pgard.dds'
				material = gtr36_pgard_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $gtr36_pg
			}
		]
	}
	{
		desc_id = gtr37_pguard01
		frontend_desc = qs(0x2d0be040)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR37_PGuard01.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr37_pguard01_d.dds'
				material = gtr37_pguard_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $gtr37_pg
			}
		]
	}
	{
		desc_id = gtr62_esp_pg1b
		frontend_desc = qs(0x58cd7e31)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR62_ESP_PG1b.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr62_esp_pg1b_d.dds'
				material = gtr62_esp_pg1b_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $gtr62_esp_pg1b
			}
		]
	}
	{
		desc_id = gtr62_esp_pg1
		frontend_desc = qs(0x9afcb0e4)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR62_ESP_PG1.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr62_esp_pg1_d.dds'
				material = gtr62_esp_pg1_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $gtr62_esp_pg1
			}
		]
	}
	{
		desc_id = gtr62_esp_pg2
		frontend_desc = qs(0xa66c65f1)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR62_ESP_PG2.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr62_esp_pg2_d.dds'
				material = gtr62_esp_pg2_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $gtr62_esp_pg2
			}
		]
	}
	{
		desc_id = gtr62_esp_pg2b
		frontend_desc = qs(0xd35913e4)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR62_ESP_PG2b.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr62_esp_pg2b_d.dds'
				material = gtr62_esp_pg2b_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $gtr62_esp_pg2b
			}
		]
	}
	{
		desc_id = gtr62b_esp_pg1
		frontend_desc = qs(0x74b81ffb)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR62b_ESP_PG1.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr62b_esp_pg1_d.dds'
				material = gtr62b_esp_pg1_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $gtr62b_esp_pg1
			}
		]
	}
	{
		desc_id = gtr63e_esp_pg1
		frontend_desc = qs(0xd8946563)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR63e_ESP_PG1.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr63e_esp_pg1_d.dds'
				material = gtr63e_esp_pg1_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $gtr63e_esp_pg1
			}
		]
	}
	{
		desc_id = gtr63f_esp_pg1
		frontend_desc = qs(0xef261af9)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR63f_ESP_PG1.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr63f_esp_pg1_d.dds'
				material = gtr63f_esp_pg1_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $gtr63f_esp_pg1
			}
		]
	}
	{
		desc_id = gtr63f_esp_pg1b
		frontend_desc = qs(0x36fbc58e)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR63f_ESP_PG1b.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr63f_esp_pg1b_d.dds'
				material = gtr63f_esp_pg1b_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $gtr63f_esp_pg1b
			}
		]
	}
	{
		desc_id = gtr63f_esp_pg2
		frontend_desc = qs(0x7fcfe384)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR63f_ESP_PG2.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr63f_esp_pg2_d.dds'
				material = gtr63f_esp_pg2_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $gtr63f_esp_pg2
			}
		]
	}
	{
		desc_id = gtr63f_esp_pg2b
		frontend_desc = qs(0xf4c588c0)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR63f_ESP_PG2b.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr63f_esp_pg2b_d.dds'
				material = gtr63f_esp_pg2b_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $gtr63f_esp_pg2b
			}
		]
	}
	{
		desc_id = gtr64_esp_pg1
		frontend_desc = qs(0x5f4e0a33)
		mesh = 'models/CAR_Instruments/Guitar/ESP/gtr64_esp_PG1.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr64_esp_pg1_d.dds'
				material = gtr64_esp_pg1_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $gtr64_esp_pg1
			}
		]
	}
	{
		desc_id = gtr64_esp_pg1b
		frontend_desc = qs(0xba94abd2)
		mesh = 'models/CAR_Instruments/Guitar/ESP/gtr64_esp_PG1b.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr64_esp_pg1b_d.dds'
				material = gtr64_esp_pg1b_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $gtr64_esp_pg1b
			}
		]
	}
	{
		desc_id = gtr64_esp_pg2
		frontend_desc = qs(0x72806792)
		mesh = 'models/CAR_Instruments/Guitar/ESP/gtr64_esp_PG2.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr64_esp_pg2_d.dds'
				material = gtr64_esp_pg2_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $gtr64_esp_pg2
			}
		]
	}
	{
		desc_id = gtr64_esp_pg2b
		frontend_desc = qs(0x69818c5c)
		mesh = 'models/CAR_Instruments/Guitar/ESP/gtr64_esp_PG2b.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr64_esp_pg2b_d.dds'
				material = gtr64_esp_pg2b_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $gtr64_esp_pg2b
			}
		]
	}
	{
		desc_id = guitar_pickg01
		frontend_desc = qs(0x560739fc)
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
		frontend_desc = qs(0x7d2a6a3f)
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
		frontend_desc = qs(0x64315b7e)
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
		frontend_desc = qs(0x560739fc)
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
		frontend_desc = qs(0x7d2a6a3f)
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
		frontend_desc = qs(0x64315b7e)
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
		frontend_desc = qs(0x560739fc)
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
		frontend_desc = qs(0x7d2a6a3f)
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
		frontend_desc = qs(0x64315b7e)
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
		frontend_desc = qs(0x560739fc)
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
		frontend_desc = qs(0x7d2a6a3f)
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
		frontend_desc = qs(0x64315b7e)
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
		frontend_desc = qs(0x560739fc)
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
		frontend_desc = qs(0x7d2a6a3f)
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
		frontend_desc = qs(0x64315b7e)
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
		frontend_desc = qs(0x560739fc)
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
		frontend_desc = qs(0x7d2a6a3f)
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
		frontend_desc = qs(0x64315b7e)
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
		frontend_desc = qs(0x560739fc)
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
		frontend_desc = qs(0x7d2a6a3f)
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
		frontend_desc = qs(0x64315b7e)
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
		frontend_desc = qs(0x560739fc)
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
		frontend_desc = qs(0x7d2a6a3f)
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
		frontend_desc = qs(0x64315b7e)
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
		frontend_desc = qs(0x560739fc)
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
		frontend_desc = qs(0x7d2a6a3f)
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
		frontend_desc = qs(0x64315b7e)
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
		frontend_desc = qs(0x560739fc)
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
		frontend_desc = qs(0x7d2a6a3f)
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
		frontend_desc = qs(0x64315b7e)
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
		frontend_desc = qs(0x560739fc)
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
		frontend_desc = qs(0x7d2a6a3f)
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
		frontend_desc = qs(0x64315b7e)
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
		frontend_desc = qs(0x560739fc)
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
		frontend_desc = qs(0x7d2a6a3f)
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
		frontend_desc = qs(0x64315b7e)
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
		frontend_desc = qs(0x560739fc)
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
		frontend_desc = qs(0x38358b30)
		mesh = 'models/CAR_Instruments/Guitar/CAG_PGard_Prdiktr01.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_pickg01_d_mls.dds'
				material = gtr_body16_pickgrd_01_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_216
			}
		]
	}
	{
		desc_id = gtr_body16_pickg02
		frontend_desc = qs(0xa76278ce)
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
		frontend_desc = qs(0xb547fd1c)
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
		frontend_desc = qs(0x2054a09a)
		mesh = 'models/CAR_Instruments/Guitar/CAG_PGard_Prdiktr04.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_pickg01_d_mls.dds'
				material = gtr_body16_pickgrd_01_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_216
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
		desc_id = None
		frontend_desc = qs(0x9c1b5214)
		random_weight = 10.0
	}
]
cas_guitar_pickups = [
	{
		desc_id = gtr_pkup_type1_blk_2
		frontend_desc = qs(0x812f1c59)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_Pkup_Type1_Blk_2.skin'
		materials = [
			gtr_pkup_type1_blk_primary
		]
	}
	{
		desc_id = gtr1_esp_emg_pkup_2
		frontend_desc = qs(0x27cebe30)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR1_ESP_EMG_Pkup_2.skin'
		materials = [
			gtr1_esp_emg_pkup_2_primary
		]
	}
	{
		desc_id = gtr62_esp_emg
		frontend_desc = qs(0x48bce410)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR62_ESP_EMG.skin'
		materials = [
			gtr62_esp_emg_primary
		]
	}
	{
		desc_id = gtr62_pkup_blk
		frontend_desc = qs(0xb790bff9)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR62_Pkup_Blk.skin'
		materials = [
			gtr62_pkup_blk_primary
		]
	}
	{
		desc_id = gtr3_esp_emg_pkup_2
		frontend_desc = qs(0x287ef6b6)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR3_ESP_EMG_Pkup_2.skin'
		materials = [
			gtr3_esp_emg_pkup_2_primary
		]
	}
	{
		desc_id = gtr6_pkup_worngold_2
		frontend_desc = qs(0xc1b00264)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR6_Pkup_Worngold_2.skin'
		materials = [
			gtr6_pkup_worngold_primary
		]
	}
	{
		desc_id = gtr8_esp_emg_pkup
		frontend_desc = qs(0x096ddfe7)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR8_ESP_EMG_Pkup.skin'
		materials = [
			gtr8_esp_emg_pkup_primary
		]
	}
	{
		desc_id = gtr12_pkup_emg
		frontend_desc = qs(0x037c789e)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR12_Pkup_EMG.skin'
		materials = [
			gtr12_pkup_emg_primary
		]
	}
	{
		desc_id = gtr12b_pkup_emg
		frontend_desc = qs(0x037c789e)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR12b_Pkup_EMG.skin'
		materials = [
			gtr12b_pkup_emg_primary
		]
	}
	{
		desc_id = gtr12e_pkup_emg
		frontend_desc = qs(0x037c789e)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR12e_Pkup_EMG.skin'
		materials = [
			gtr12e_pkup_emg_primary
		]
	}
	{
		desc_id = gtr12_esp_pkup_2
		frontend_desc = qs(0x4da84912)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR12_ESP_Pkup_2.skin'
		materials = [
			gtr12_esp_pkup_2_primary
		]
	}
	{
		desc_id = gtr14_pkup_worngold_14
		frontend_desc = qs(0x1e7c969e)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR14_Pkup_Worngold_14.skin'
		materials = [
			gtr14_pkup_worngold_14_primary
		]
	}
	{
		desc_id = gtr60b_pkup_emg
		frontend_desc = qs(0x037c789e)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR60b_Pkup_EMG.skin'
		materials = [
			gtr60b_pkup_emg_primary
		]
	}
	{
		desc_id = gtr62_pkup_emg_01
		frontend_desc = qs(0x0764c0d0)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR62_Pkup_EMG_01.skin'
		materials = [
			gtr62_pkup_emg_01_primary
		]
	}
	{
		desc_id = gtr63c_pkup_emg
		frontend_desc = qs(0x037c789e)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR63c_Pkup_EMG.skin'
		materials = [
			gtr60b_pkup_emg_primary
		]
	}
	{
		desc_id = gtr30_pickup_d
		frontend_desc = qs(0x551e5532)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR30_Pickup_D.skin'
		materials = [
			sd_hb_pickup01_primary
		]
	}
	{
		desc_id = gtr30_pickup_e
		frontend_desc = qs(0x2d12cb96)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR30_Pickup_E.skin'
		materials = [
			sd_hb_pickup02_primary
		]
	}
	{
		desc_id = gtr30_pickup_gold
		frontend_desc = qs(0x7e210480)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR30_Pickup_Gold.skin'
		materials = [
			gtr31_pickup_gold_primary
		]
	}
	{
		desc_id = gtr30_pickup_f
		frontend_desc = qs(0xe29814df)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR30_Pickup_F.skin'
		materials = [
			gtr_pickup_type3_primary
		]
	}
	{
		desc_id = gtr30_pickup_g
		frontend_desc = qs(0x07d2f82d)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR30_Pickup_G.skin'
		materials = [
			gtr36_pickup01_primary
		]
	}
	{
		desc_id = gtr30_emg
		frontend_desc = qs(0x48bce410)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR30_EMG.skin'
		materials = [
			gtr31b_emg_primary
		]
	}
	{
		desc_id = gtr31_pickup_gold
		frontend_desc = qs(0x486af9c1)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR31_Pickup_Gold.skin'
		materials = [
			gtr31_pickup_gold_primary
		]
	}
	{
		desc_id = gtr31_pickup_e
		frontend_desc = qs(0x2d12cb96)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR31_Pickup_E.skin'
		materials = [
			sd_hb_pickup02_primary
		]
	}
	{
		desc_id = gtr31_pickup_d
		frontend_desc = qs(0xc0503944)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR31_Pickup_D.skin'
		materials = [
			sd_hb_pickup01_primary
		]
	}
	{
		desc_id = gtr31_pickup_g
		frontend_desc = qs(0x07d2f82d)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR31_Pickup_G.skin'
		materials = [
			gtr36_pickup01_primary
		]
	}
	{
		desc_id = gtr31_pickup_f
		frontend_desc = qs(0x882abdfc)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR31_Pickup_F.skin'
		materials = [
			gtr_pickup_type3_primary
		]
	}
	{
		desc_id = gtr31b_grynch_emg
		frontend_desc = qs(0x212c4086)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR31b_Grynch_EMG.skin'
		materials = [
			gtr31b_emg_primary
		]
	}
	{
		desc_id = gtr32_pickup_gold
		frontend_desc = qs(0xdcbf5669)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR32_Pickup_Gold.skin'
		materials = [
			gtr31_pickup_gold_primary
		]
	}
	{
		desc_id = gtr32_pickup_f
		frontend_desc = qs(0x882abdfc)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR31_Pickup_F.skin'
		materials = [
			gtr_pickup_type3_primary
		]
	}
	{
		desc_id = gtr32_pickup_g
		frontend_desc = qs(0x07d2f82d)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR32_Pickup_G.skin'
		materials = [
			gtr36_pickup01_primary
		]
	}
	{
		desc_id = gtr32_emg
		frontend_desc = qs(0x48bce410)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR32_EMG.skin'
		materials = [
			gtr31b_emg_primary
		]
	}
	{
		desc_id = gtr33_pickup_mum
		frontend_desc = qs(0x2c79428d)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR33_Pickup_MUM.skin'
		pak_num = 1
		is_metallica = 1
		materials = [
			gtr33_pkup_mum_primary
		]
	}
	{
		desc_id = gtr33_pickup_boris
		frontend_desc = qs(0xec90417b)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR33_Pickup_BORIS.skin'
		pak_num = 1
		is_metallica = 1
		materials = [
			gtr33_pkup_boris_primary
		]
	}
	{
		desc_id = gtr33_pickup_drac
		frontend_desc = qs(0x5a167753)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR33_Pickup_DRAC.skin'
		pak_num = 1
		is_metallica = 1
		materials = [
			gtr33_pkup_drac_primary
		]
	}
	{
		desc_id = gtr33_pickup_bride
		frontend_desc = qs(0x135f11f1)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR33_Pickup_Bride.skin'
		pak_num = 1
		is_metallica = 1
		materials = [
			gtr33_pickup_bride_primary
		]
	}
	{
		desc_id = gtr33_emg
		frontend_desc = qs(0x48bce410)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR33_Pickup_EMG.skin'
		pak_num = 0
		is_esp = 1
		is_metallica = 1
		materials = [
			gtr33_emg_primary
		]
	}
	{
		desc_id = gtr33_pickup_a
		frontend_desc = qs(0x07d2f82d)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR33_Pickup_A.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr36_pickup01_primary
		]
	}
	{
		desc_id = gtr33_pickup_gold
		frontend_desc = qs(0xdcbf5669)
		mesh = 'models/CAR_Instruments/Guitar/esp/gtr33_Pickup_Gold.skin'
		materials = [
			gtr31_pickup_gold_primary
		]
	}
	{
		desc_id = gtr33_pickup_d
		frontend_desc = qs(0xc0503944)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR33_Pickup_D.skin'
		materials = [
			sd_hb_pickup01_primary
		]
	}
	{
		desc_id = gtr33_pickup_e
		frontend_desc = qs(0x2d12cb96)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR33_Pickup_E.skin'
		materials = [
			sd_hb_pickup02_primary
		]
	}
	{
		desc_id = gtr33_pickup_f
		frontend_desc = qs(0x882abdfc)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR33_Pickup_F.skin'
		materials = [
			gtr_pickup_type3_primary
		]
	}
	{
		desc_id = gtr36_pickup
		frontend_desc = qs(0x07d2f82d)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR36_Pickup.skin'
		materials = [
			gtr36_pickup01_primary
		]
	}
	{
		desc_id = gtr36_pickup_gold
		frontend_desc = qs(0xdcbf5669)
		mesh = 'models/CAR_Instruments/Guitar/esp/gtr36_Pickup_Gold.skin'
		materials = [
			gtr31_pickup_gold_primary
		]
	}
	{
		desc_id = gtr36_pickup_d
		frontend_desc = qs(0xc0503944)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR36_Pickup_D.skin'
		materials = [
			sd_hb_pickup01_primary
		]
	}
	{
		desc_id = gtr36_pickup_e
		frontend_desc = qs(0x2d12cb96)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR36_Pickup_E.skin'
		materials = [
			sd_hb_pickup02_primary
		]
	}
	{
		desc_id = gtr36_pickup_f
		frontend_desc = qs(0x882abdfc)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR36_Pickup_F.skin'
		materials = [
			gtr_pickup_type3_primary
		]
	}
	{
		desc_id = gtr36_emg
		frontend_desc = qs(0x48bce410)
		mesh = 'models/CAR_Instruments/Guitar/esp/gtr36_EMG.skin'
		materials = [
			gtr31b_emg_primary
		]
	}
	{
		desc_id = gtr37_pickup
		frontend_desc = qs(0xed7abb14)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR37_Pickup1.skin'
		materials = [
			gtr37_pickup01_primary
		]
	}
	{
		desc_id = gtr38_pickup
		frontend_desc = qs(0xf8384e05)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR38_ESP_EMG.skin'
		pak_num = 0
		is_esp = 1
		is_metallica = 1
		materials = [
			gtr38_esp_emg_pkup_primary
		]
	}
	{
		desc_id = gtr37_pickup_a
		frontend_desc = qs(0x07d2f82d)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR37_Pickup_A.skin'
		materials = [
			gtr36_pickup01_primary
		]
	}
	{
		desc_id = gtr37_pickup_gold
		frontend_desc = qs(0xdcbf5669)
		mesh = 'models/CAR_Instruments/Guitar/esp/gtr37_Pickup_Gold.skin'
		materials = [
			gtr31_pickup_gold_primary
		]
	}
	{
		desc_id = gtr37_pickup_d
		frontend_desc = qs(0xc0503944)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR37_Pickup_D.skin'
		materials = [
			sd_hb_pickup01_primary
		]
	}
	{
		desc_id = gtr37_pickup_e
		frontend_desc = qs(0x2d12cb96)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR37_Pickup_E.skin'
		materials = [
			sd_hb_pickup01_primary
		]
	}
	{
		desc_id = gtr37_pickup_f
		frontend_desc = qs(0x882abdfc)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR37_Pickup_F.skin'
		materials = [
			gtr_pickup_type3_primary
		]
	}
	{
		desc_id = gtr63_pkup_blk
		frontend_desc = qs(0x83e3f684)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR63_Pkup_Blk.skin'
		materials = [
			gtr63_pkup_blk_primary
		]
	}
	{
		desc_id = gtr_pickup_type66
		frontend_desc = qs(0x4973cdf5)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR_Pickup_Type66.skin'
		materials = [
			gtr_pickup_type66_primary
		]
	}
	{
		desc_id = gtr65_pickup_dummy
		frontend_desc = qs(0x4973cdf5)
		mesh = 'models/CAR_Instruments/Guitar/esp/GTR65_pickup_dummy.skin'
		materials = [
			gtr65_pickup_dummy_primary
		]
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
		polaroid = guitar_rwds_pckp_hdingcrm_2
	}
	{
		desc_id = gtr_pickup_type3_03
		frontend_desc = qs(0x66ae7ebb)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Pickup_Type3_03.skin'
		materials = [
			gtr_pickup_type3_primary
		]
		polaroid = guitar_rwds_pckp_hdingcrm_3
	}
	{
		desc_id = gtr_pickup_type3b_02
		frontend_desc = qs(0xe6109cc3)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Pickup_Type3b_02.skin'
		materials = [
			gtr_pickup_type3b_primary
		]
		polaroid = guitar_rwds_pckp_hdinggld_2
	}
	{
		desc_id = gtr_pickup_type3b_03
		frontend_desc = qs(0xff0bad82)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Pickup_Type3b_03.skin'
		materials = [
			gtr_pickup_type3b_primary
		]
		polaroid = guitar_rwds_pckp_hdinggld_3
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
		desc_id = gtr_pickup_type6_tkd_03
		frontend_desc = qs(0x9adccdfb)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Pickup_Type6_TKD_03.skin'
		materials = [
			gtr_pickup_type6_primary
		]
	}
	{
		desc_id = gtr_pickup_type6_tkd_02
		frontend_desc = qs(0x83c7fcba)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Pickup_Type6_TKD_02.skin'
		materials = [
			gtr_pickup_type6_primary
		]
	}
	{
		desc_id = gtr_pickup_type6_tkd_01
		frontend_desc = qs(0xa8eaaf79)
		mesh = 'models/CAR_Instruments/Guitar/GTR_Pickup_Type6_TKD_01.skin'
		materials = [
			gtr_pickup_type6_primary
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
		desc_id = None
		frontend_desc = qs(0x9c1b5214)
		random_weight = 10.0
	}
]
cas_guitar_knobs = [
	{
		desc_id = gtr1_esp_knob_10_03
		frontend_desc = qs(0xe3989d18)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR1_ESP_Knob_10_03.skin'
		materials = [
			gtr1_esp_knob_10_01_primary
		]
	}
	{
		desc_id = gtr4_esp_knob_10_03
		frontend_desc = qs(0xcc7bacce)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR4_ESP_Knob_10_03.skin'
		materials = [
			gtr4_esp_knob_10_03_primary
		]
	}
	{
		desc_id = gtr4_knob_02
		frontend_desc = qs(0x8f2cae0b)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR4_Knob_02.skin'
		materials = [
			gtr4_knob_02_primary
		]
	}
	{
		desc_id = gtr4_knob_03
		frontend_desc = qs(0x4e6b4489)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR4_Knob_03.skin'
		materials = [
			gtr4_knob_03_primary
		]
	}
	{
		desc_id = gtr4_knob_04
		frontend_desc = qs(0xc99e6543)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR4_Knob_04.skin'
		materials = [
			gtr4_knob_04_primary
		]
	}
	{
		desc_id = gtr4_knob_05
		frontend_desc = qs(0x8ae89cb9)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR4_Knob_05.skin'
		materials = [
			gtr4_knob_05_primary
		]
	}
	{
		desc_id = gtr4_knob_06
		frontend_desc = qs(0xea9acd58)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR4_Knob_06.skin'
		materials = [
			gtr4_knob_06_primary
		]
	}
	{
		desc_id = gtr5_esp_knob_10_03
		frontend_desc = qs(0xe8d9d225)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR5_ESP_Knob_10_03.skin'
		materials = [
			gtr5_esp_knob_10_03_primary
		]
	}
	{
		desc_id = gtr6_knob_1_03
		frontend_desc = qs(0xc265067f)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR6_Knob_1_03.skin'
		materials = [
			gtr6_knob_1_primary
		]
	}
	{
		desc_id = gtr8_esp_knob_10_03
		frontend_desc = qs(0xf768116c)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR8_ESP_Knob_10_03.skin'
		materials = [
			gtr4_esp_knob_10_03_primary
		]
	}
	{
		desc_id = gtr9_esp_knob_10_02
		frontend_desc = qs(0x1387d414)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR9_ESP_Knob_10_02.skin'
		materials = [
			gtr4_esp_knob_10_03_primary
		]
	}
	{
		desc_id = gtr9_knob_02
		frontend_desc = qs(0x8f2cae0b)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR9_Knob_02.skin'
		materials = [
			gtr9_knob_02_primary
		]
	}
	{
		desc_id = gtr9_knob_03
		frontend_desc = qs(0x4e6b4489)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR9_Knob_03.skin'
		materials = [
			gtr9_knob_03_primary
		]
	}
	{
		desc_id = gtr9_knob_04
		frontend_desc = qs(0xc99e6543)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR9_Knob_04.skin'
		materials = [
			gtr9_knob_04_primary
		]
	}
	{
		desc_id = gtr9_knob_05
		frontend_desc = qs(0x8ae89cb9)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR9_Knob_05.skin'
		materials = [
			gtr9_knob_05_primary
		]
	}
	{
		desc_id = gtr9_knob_06
		frontend_desc = qs(0xea9acd58)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR9_Knob_06.skin'
		materials = [
			gtr9_knob_06_primary
		]
	}
	{
		desc_id = gtr10_knob1_03
		frontend_desc = qs(0xa7452528)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR10_Knob1_03.skin'
		materials = [
			gtr10_knob1_03_primary
		]
	}
	{
		desc_id = gtr11_knob1_04
		frontend_desc = qs(0xd4dc543a)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR11_Knob1_04.skin'
		materials = [
			gtr10_knob1_03_primary
		]
	}
	{
		desc_id = gtr12_esp_knob_10_3
		frontend_desc = qs(0xd3077c0e)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR12_ESP_Knob_10_3.skin'
		materials = [
			gtr12_esp_knob_10_3_primary
		]
	}
	{
		desc_id = gtr14_knob1_04
		frontend_desc = qs(0xad38a196)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR14_Knob1_04.skin'
		materials = [
			gtr14_knob1_04_primary
		]
	}
	{
		desc_id = gtr12_esp_knob_01
		frontend_desc = qs(0x34c902b4)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR12_ESP_Knob_01.skin'
		materials = [
			gtr12_esp_knob_01_primary
		]
	}
	{
		desc_id = gtr12_esp_knob_02
		frontend_desc = qs(0x8f2cae0b)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR12_ESP_Knob_02.skin'
		materials = [
			gtr12_esp_knob_02_primary
		]
	}
	{
		desc_id = gtr12_esp_knob_03
		frontend_desc = qs(0x4e6b4489)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR12_ESP_Knob_03.skin'
		materials = [
			gtr12_esp_knob_03_primary
		]
	}
	{
		desc_id = gtr12_esp_knob_04
		frontend_desc = qs(0xc99e6543)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR12_ESP_Knob_04.skin'
		materials = [
			gtr12_esp_knob_04_primary
		]
	}
	{
		desc_id = gtr12_esp_knob_05
		frontend_desc = qs(0x8ae89cb9)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR12_ESP_Knob_05.skin'
		materials = [
			gtr12_esp_knob_05_primary
		]
	}
	{
		desc_id = gtr12_esp_knob_06
		frontend_desc = qs(0xea9acd58)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR12_ESP_Knob_06.skin'
		materials = [
			gtr12_esp_knob_06_primary
		]
	}
	{
		desc_id = gtr12b_knob
		frontend_desc = qs(0xea9acd58)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR12b_Knob.skin'
		materials = [
			gtr12b_knob_primary
		]
	}
	{
		desc_id = gtr12c_knob
		frontend_desc = qs(0x34c902b4)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR12c_Knob.skin'
		materials = [
			gtr12c_knob_primary
		]
	}
	{
		desc_id = gtr12d_knob
		frontend_desc = qs(0x8f2cae0b)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR12d_Knob.skin'
		materials = [
			gtr12d_knob_primary
		]
	}
	{
		desc_id = gtr12e_knob
		frontend_desc = qs(0x34c902b4)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR12e_Knob.skin'
		materials = [
			gtr12e_knob_primary
		]
	}
	{
		desc_id = gtr12h_knob
		frontend_desc = qs(0x8f2cae0b)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR12H_Knob.skin'
		materials = [
			gtr12h_knob_primary
		]
	}
	{
		desc_id = gtr_30_knobs_a
		frontend_desc = qs(0x6ae51c48)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_30_KNOBS_A.skin'
		materials = [
			gtr_31b_knobs_viper_primary
		]
	}
	{
		desc_id = gtr_30_knobs_b
		frontend_desc = qs(0x41c84f8b)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_30_KNOBS_B.skin'
		materials = [
			gtr36_knobs_primary
		]
	}
	{
		desc_id = gtr_30_knobs_c
		frontend_desc = qs(0x58d37eca)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_30_KNOBS_C.skin'
		materials = [
			gtr60c_knob_type1_primary
		]
	}
	{
		desc_id = gtr_30_knobs_d
		frontend_desc = qs(0x1792e80d)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_30_KNOBS_D.skin'
	}
	{
		desc_id = gtr_30_knobs_e
		frontend_desc = qs(0x0e89d94c)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_30_KNOBS_E.skin'
		materials = [
			gtr12h_knob_primary
		]
	}
	{
		desc_id = gtr_31_knobs_vpr
		frontend_desc = qs(0x4ce53e6a)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_31_KNOBS_VPR.skin'
		materials = [
			gtr_31_knobs_viper_primary
		]
	}
	{
		desc_id = gtr_31b_knobs_vpr
		frontend_desc = qs(0x6b4f2ea0)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_31b_KNOBS_VPR.skin'
		materials = [
			gtr_31b_knobs_viper_primary
		]
	}
	{
		desc_id = gtr_31_knobs_b
		frontend_desc = qs(0x41c84f8b)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_31_KNOBS_B.skin'
		materials = [
			gtr36_knobs_primary
		]
	}
	{
		desc_id = gtr_31_knobs_c
		frontend_desc = qs(0x58d37eca)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_31_KNOBS_C.skin'
		materials = [
			gtr60c_knob_type1_primary
		]
	}
	{
		desc_id = gtr_31_knobs_d
		frontend_desc = qs(0x1792e80d)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_31_KNOBS_D.skin'
	}
	{
		desc_id = gtr_31_knobs_e
		frontend_desc = qs(0x0e89d94c)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_31_KNOBS_E.skin'
		materials = [
			gtr12h_knob_primary
		]
	}
	{
		desc_id = gtr_32_knobs_a
		frontend_desc = qs(0x5be1b4bb)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_32_KNOBS_A.skin'
		materials = [
			gtr_32_knobs01_primary
		]
	}
	{
		desc_id = gtr_32_knobs_b
		frontend_desc = qs(0xdee97c73)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_32_KNOBS_B.skin'
		materials = [
			gtr36_knobs_primary
		]
	}
	{
		desc_id = gtr_32_knobs_c
		frontend_desc = qs(0xc7f24d32)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_32_KNOBS_C.skin'
		materials = [
			gtr60c_knob_type1_primary
		]
	}
	{
		desc_id = gtr_32_knobs_d
		frontend_desc = qs(0x88b3dbf5)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_32_KNOBS_D.skin'
		materials = [
			gtr12_esp_knob_06_primary
		]
	}
	{
		desc_id = gtr_32_knobs_e
		frontend_desc = qs(0x91a8eab4)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_32_KNOBS_E.skin'
		materials = [
			gtr12h_knob_primary
		]
	}
	{
		desc_id = gtr33_knobs_kh2
		frontend_desc = qs(0x98fa9ce7)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_33_KNOBS_KH2.skin'
		materials = [
			gtr_33_knobs_primary
		]
	}
	{
		desc_id = gtr_33_knobs_a
		frontend_desc = qs(0x95613f2a)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_33_KNOBS_A.skin'
		materials = [
			gtr_31b_knobs_viper_primary
		]
	}
	{
		desc_id = gtr_33_knobs_b
		frontend_desc = qs(0xbe4c6ce9)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_33_KNOBS_B.skin'
		materials = [
			gtr36_knobs_primary
		]
	}
	{
		desc_id = gtr_33_knobs_c
		frontend_desc = qs(0xa7575da8)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_33_KNOBS_C.skin'
		materials = [
			gtr60c_knob_type1_primary
		]
	}
	{
		desc_id = gtr_33_knobs_d
		frontend_desc = qs(0xe816cb6f)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_33_KNOBS_D.skin'
	}
	{
		desc_id = gtr_33_knobs_e
		frontend_desc = qs(0xf10dfa2e)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_33_KNOBS_E.skin'
		materials = [
			gtr12h_knob_primary
		]
	}
	{
		desc_id = gtr_36_knobs
		frontend_desc = qs(0x1bb0795c)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_36_Knobs_B.skin'
		materials = [
			gtr_36_knobs_primary
		]
	}
	{
		desc_id = gtr_36_knobs_a
		frontend_desc = qs(0xd6b5be34)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_36_KNOBS_A.skin'
		materials = [
			gtr_31b_knobs_viper_primary
		]
	}
	{
		desc_id = gtr_36_knobs_b
		frontend_desc = qs(0xfd98edf7)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_36_Knobs_B.skin'
		materials = [
			gtr_36_knobs_primary
		]
	}
	{
		desc_id = gtr_36_knobs_c
		frontend_desc = qs(0xe483dcb6)
		mesh = 'models/CAR_Instruments/Guitar/ESP/gtr_36_KNOBS_C.skin'
		materials = [
			gtr60c_knob_type1_primary
		]
	}
	{
		desc_id = gtr_36_knobs_d
		frontend_desc = qs(0xabc24a71)
		mesh = 'models/CAR_Instruments/Guitar/ESP/gtr_36_KNOBS_D.skin'
		materials = [
			gtr12_esp_knob_06_primary
		]
	}
	{
		desc_id = gtr_36_knobs_e
		frontend_desc = qs(0xb2d97b30)
		mesh = 'models/CAR_Instruments/Guitar/ESP/gtr_36_KNOBS_E.skin'
		materials = [
			gtr12h_knob_primary
		]
	}
	{
		desc_id = gtr37_knobs01
		frontend_desc = qs(0x7f5c191d)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR37_Knobs01.skin'
		materials = [
			gtr37_knobs_primary
		]
	}
	{
		desc_id = gtr62_knob_type01
		frontend_desc = qs(0x8ae89cb9)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR62_Knob_Type01.skin'
		materials = [
			gtr62_knob_type01_primary
		]
	}
	{
		desc_id = gtr62_knob_type02
		frontend_desc = qs(0x4e6b4489)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR62_Knob_Type02.skin'
		materials = [
			gtr62_knob_type02_primary
		]
	}
	{
		desc_id = gtr62_knob_type03
		frontend_desc = qs(0x34c902b4)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR62_Knob_Type03.skin'
		materials = [
			gtr62_knob_type03_primary
		]
	}
	{
		desc_id = gtr62_knob_type04
		frontend_desc = qs(0x8f2cae0b)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR62_Knob_Type04.skin'
		materials = [
			gtr62_knob_type04_primary
		]
	}
	{
		desc_id = gtr62_knob_type05
		frontend_desc = qs(0xea9acd58)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR62_Knob_Type05.skin'
		materials = [
			gtr62_knob_type05_primary
		]
	}
	{
		desc_id = gtr62_knob_type06
		frontend_desc = qs(0xc99e6543)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR62_Knob_Type06.skin'
		materials = [
			gtr62_knob_type06_primary
		]
	}
	{
		desc_id = gtr62b_knob_type01
		frontend_desc = qs(0x34c902b4)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR62b_Knob_Type01.skin'
		materials = [
			gtr62b_knob_type01_primary
		]
	}
	{
		desc_id = gtr63_knob_type1
		frontend_desc = qs(0x34c902b4)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR63_Knob_Type1.skin'
		materials = [
			gtr63_knob_type1_primary
		]
	}
	{
		desc_id = gtr63c_knob_type1
		frontend_desc = qs(0x0330fcc6)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR63c_Knob_Type1.skin'
		materials = [
			gtr63c_knob_type1_primary
		]
	}
	{
		desc_id = gtr63g_knob_type1
		frontend_desc = qs(0x34c902b4)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR63g_Knob_Type1.skin'
		materials = [
			gtr63g_knob_type1_primary
		]
	}
	{
		desc_id = gtr63_knob_type2
		frontend_desc = qs(0x8f2cae0b)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR63_Knob_Type2.skin'
		materials = [
			gtr63_knob_type2_primary
		]
	}
	{
		desc_id = gtr63_knob_type3
		frontend_desc = qs(0x4e6b4489)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR63_Knob_Type3.skin'
		materials = [
			gtr63_knob_type3_primary
		]
	}
	{
		desc_id = gtr63_knob_type4
		frontend_desc = qs(0xc99e6543)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR63_Knob_Type4.skin'
		materials = [
			gtr63_knob_type4_primary
		]
	}
	{
		desc_id = gtr63_knob_type5
		frontend_desc = qs(0x8ae89cb9)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR63_Knob_Type5.skin'
		materials = [
			gtr63_knob_type5_primary
		]
	}
	{
		desc_id = gtr63_knob_type06
		frontend_desc = qs(0x34c902b4)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR63_Knob_Type06.skin'
		materials = [
			gtr63_knob_type06_primary
		]
	}
	{
		desc_id = gtr64_knob_type1
		frontend_desc = qs(0x2a068a61)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR64_Knob_Type1.skin'
		materials = [
			gtr64_knob_type1_primary
		]
	}
	{
		desc_id = gtr64_knob_type2
		frontend_desc = qs(0x8f2cae0b)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR64_Knob_Type2.skin'
		materials = [
			gtr64_knob_type2_primary
		]
	}
	{
		desc_id = gtr64_knob_type3
		frontend_desc = qs(0x4e6b4489)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR64_Knob_Type3.skin'
		materials = [
			gtr64_knob_type3_primary
		]
	}
	{
		desc_id = gtr64_knob_type4
		frontend_desc = qs(0xc99e6543)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR64_Knob_Type4.skin'
		materials = [
			gtr64_knob_type4_primary
		]
	}
	{
		desc_id = gtr64_knob_type5
		frontend_desc = qs(0x8ae89cb9)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR64_Knob_Type5.skin'
		materials = [
			gtr64_knob_type5_primary
		]
	}
	{
		desc_id = gtr64_knob_type6
		frontend_desc = qs(0xea9acd58)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR64_Knob_Type6.skin'
		materials = [
			gtr64_knob_type6_primary
		]
	}
	{
		desc_id = gtr66_knob_type1
		frontend_desc = qs(0x34c902b4)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR66_Knob_Type1.skin'
		materials = [
			gtr66_knob_type1_primary
		]
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
		polaroid = guitar_rewards_knobs_dice
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
		polaroid = guitar_rewards_knobs_metalheads
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
		polaroid = guitar_rewards_knobs_dice
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
		polaroid = guitar_rewards_knobs_metalheads
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
		polaroid = guitar_rewards_knobs_dice
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
		frontend_desc = qs(0x2a068a61)
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
		polaroid = guitar_rewards_knobs_dice
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
		frontend_desc = qs(0x2a068a61)
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
		polaroid = guitar_rewards_knobs_dice
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
		frontend_desc = qs(0x2a068a61)
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
		polaroid = guitar_rewards_knobs_dice
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
		polaroid = guitar_rewards_knobs_metalheads
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
		polaroid = guitar_rewards_knobs_dice
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
		polaroid = guitar_rewards_knobs_metalheads
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
		polaroid = guitar_rewards_knobs_dice
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
		polaroid = guitar_rewards_knobs_metalheads
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
		polaroid = guitar_rewards_knobs_dice
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
		polaroid = guitar_rewards_knobs_metalheads
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
		polaroid = guitar_rewards_knobs_dice
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
		polaroid = guitar_rewards_knobs_metalheads
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
		polaroid = guitar_rewards_knobs_dice
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
		polaroid = guitar_rewards_knobs_metalheads
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
		polaroid = guitar_rewards_knobs_dice
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
		polaroid = guitar_rewards_knobs_metalheads
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
		polaroid = guitar_rewards_knobs_dice
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
		polaroid = guitar_rewards_knobs_metalheads
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
		polaroid = guitar_rewards_knobs_dice
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
		polaroid = guitar_rewards_knobs_metalheads
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
		polaroid = guitar_rewards_knobs_dice
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
		polaroid = guitar_rewards_knobs_metalheads
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
		polaroid = guitar_rewards_knobs_dice
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
		polaroid = guitar_rewards_knobs_metalheads
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
		polaroid = guitar_rewards_knobs_dice
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
		polaroid = guitar_rewards_knobs_metalheads
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
		polaroid = guitar_rewards_knobs_dice
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
		polaroid = guitar_rewards_knobs_metalheads
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
		polaroid = guitar_rewards_knobs_dice
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
		polaroid = guitar_rewards_knobs_metalheads
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
	}
	{
		desc_id = gtr_x1_knob_type4_01
		frontend_desc = qs(0x3ad0e324)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X1_Knob_Type4_01.skin'
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
		polaroid = guitar_rewards_knobs_dice
	}
	{
		desc_id = gtr_x1_knob_type6_01
		frontend_desc = qs(0x43698d9a)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X1_Knob_Type6_01.skin'
		materials = [
			gtr_knob_type6_01_primary
		]
		polaroid = guitar_rewards_knobs_dice
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
		polaroid = guitar_rewards_knobs_metalheads
	}
	{
		desc_id = gtr_x1_knob_type9_01
		frontend_desc = qs(0x06d2ca97)
		mesh = 'models/CAR_Instruments/Guitar/GTR_X1_Knob_Type9_01.skin'
		materials = [
			gtr_knob_type9_01_primary
		]
		polaroid = guitar_rewards_knobs_metalheads
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
		polaroid = guitar_rewards_knobs_dice
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
		polaroid = guitar_rewards_knobs_metalheads
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
		polaroid = guitar_rewards_knobs_dice
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
		polaroid = guitar_rewards_knobs_metalheads
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
		polaroid = guitar_rewards_knobs_dice
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
		polaroid = guitar_rewards_knobs_metalheads
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
		polaroid = guitar_rewards_knobs_dice
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
		polaroid = guitar_rewards_knobs_metalheads
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
		polaroid = guitar_rewards_knobs_dice
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
		polaroid = guitar_rewards_knobs_metalheads
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
		polaroid = guitar_rewards_knobs_dice
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
		polaroid = guitar_rewards_knobs_metalheads
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
		polaroid = guitar_rewards_knobs_dice
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
		polaroid = guitar_rewards_knobs_metalheads
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
		polaroid = guitar_rewards_knobs_dice
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
		polaroid = guitar_rewards_knobs_metalheads
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
		polaroid = guitar_rewards_knobs_dice
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
		polaroid = guitar_rewards_knobs_metalheads
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
		desc_id = None
		frontend_desc = qs(0x9c1b5214)
		random_weight = 10.0
	}
]
cas_guitar_bridges = [
	{
		desc_id = gtr1_esp_bridge_01
		frontend_desc = qs(0x4b993bd6)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR1_ESP_Bridge_01.skin'
		materials = [
			gtr1_esp_bridge_01_primary
		]
	}
	{
		desc_id = gtr4_esp_bridge_02
		frontend_desc = qs(0x6de4a5a9)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR4_ESP_Bridge_02.skin'
		materials = [
			gtr4_esp_bridge_02_primary
		]
	}
	{
		desc_id = gtr4_bridge_fr10
		frontend_desc = qs(0x5f83866e)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR4_Bridge_FR10.skin'
		materials = [
			gtr4_bridge_fr10_primary
		]
		guitar_string_start = esp_whammy_bridge_string_start
	}
	{
		desc_id = gtr4_esp_bridge_9
		frontend_desc = qs(0xddfd5fc4)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR4_ESP_Bridge_9.skin'
		materials = [
			gtr4_esp_bridge_9_primary
		]
	}
	{
		desc_id = gtr5_esp_bridge_05
		frontend_desc = qs(0xe60b15c2)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR5_ESP_Bridge_05.skin'
		materials = [
			gtr5_esp_bridge_05_primary
		]
	}
	{
		desc_id = gtr6_bridge_03
		frontend_desc = qs(0xda4c9888)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR6_Bridge_03.skin'
		materials = [
			gtr6_bridge_03_primary
		]
	}
	{
		desc_id = gtr8_bridge_fr
		frontend_desc = qs(0xd4041d76)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR8_Bridge_FR.skin'
		materials = [
			gtr8_bridge_fr_primary
		]
		guitar_string_start = esp_kh_spider_bridge_string_start
	}
	{
		desc_id = gtr9_esp_bridge_03
		frontend_desc = qs(0xddfd5fc4)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR9_ESP_Bridge_03.skin'
		materials = [
			gtr9_esp_bridge_03_primary
		]
	}
	{
		desc_id = gtr9_bridge_fr11
		frontend_desc = qs(0x5f83866e)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR9_Bridge_FR11.skin'
		materials = [
			gtr9_bridge_fr11_primary
		]
		guitar_string_start = esp_whammy_bridge_string_start
	}
	{
		desc_id = gtr9_bridge_04
		frontend_desc = qs(0xc3a3682a)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR9_Bridge_04.skin'
		materials = [
			gtr9_bridge_04_primary
		]
	}
	{
		desc_id = gtr10_bridge_04
		frontend_desc = qs(0xda4c9888)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR10_Bridge_04.skin'
		materials = [
			gtr10_bridge_04_primary
		]
	}
	{
		desc_id = gtr11_bridge_06
		frontend_desc = qs(0xda4c9888)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR11_Bridge_06.skin'
		materials = [
			gtr11_bridge_06_primary
		]
	}
	{
		desc_id = gtr14_bridge_14
		frontend_desc = qs(0xc4ad8ec5)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR14_Bridge_14.skin'
		materials = [
			gtr14_bridge_14_primary
		]
	}
	{
		desc_id = gtr12_bridge_1
		frontend_desc = qs(0x023a6f1d)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR12_Bridge_1.skin'
		materials = [
			gtr12_bridge_1_primary
		]
		guitar_string_start = gtr12_bridge_1_start_properties
		guitar_string_end = gtr12_bridge_1_end_properties
	}
	{
		desc_id = gtr12_bridge_2
		frontend_desc = qs(0xfb65592f)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR12_Bridge_2.skin'
		materials = [
			gtr12_bridge_2_primary
		]
		guitar_string_start = gtr12_bridge_2_start_properties
		guitar_string_end = gtr12_bridge_2_end_properties
	}
	{
		desc_id = gtr12_bridge_3
		frontend_desc = qs(0xddfd5fc4)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR12_Bridge_3.skin'
		materials = [
			gtr12_bridge_3_primary
		]
		guitar_string_start = gtr12_bridge_3_start_properties
		guitar_string_end = gtr12_bridge_3_end_properties
	}
	{
		desc_id = gtr12b_bridge
		frontend_desc = qs(0xfb65592f)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR12b_Bridge.skin'
		materials = [
			gtr12b_bridge_primary
		]
		guitar_string_start = gtr12b_bridge_start_properties
		guitar_string_end = gtr12b_bridge_end_properties
	}
	{
		desc_id = gtr12c_bridge
		frontend_desc = qs(0xfb65592f)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR12c_Bridge.skin'
		materials = [
			gtr12c_bridge_primary
		]
		guitar_string_start = gtr12c_bridge_start_properties
		guitar_string_end = gtr12c_bridge_end_properties
	}
	{
		desc_id = gtr12d_bridge
		frontend_desc = qs(0xfe048df0)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR12D_Bridge.skin'
		materials = [
			gtr12d_bridge_primary
		]
		guitar_string_start = gtr12d_bridge_start_properties
		guitar_string_end = gtr12d_bridge_end_properties
	}
	{
		desc_id = gtr_bridge12e
		frontend_desc = qs(0xfb65592f)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_Bridge12E.skin'
		materials = [
			gtr_bridge12e_primary
		]
		guitar_string_start = gtr_bridge12e_start_properties
		guitar_string_end = gtr_bridge12e_end_properties
	}
	{
		desc_id = gtr12h_bridge
		frontend_desc = qs(0xfb65592f)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR12H_Bridge.skin'
		materials = [
			gtr12h_bridge_primary
		]
		guitar_string_start = gtr12h_bridge_start_properties
		guitar_string_end = gtr12h_bridge_end_properties
	}
	{
		desc_id = gtr12_esp_bridge_12
		frontend_desc = qs(0xb0cc2dd9)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR12_ESP_Bridge_12.skin'
		materials = [
			gtr12_esp_bridge_12_primary
		]
		guitar_string_start = esp_jh_ratrod_string_start
	}
	{
		desc_id = gtr30_brdg_strgthru
		frontend_desc = qs(0xddfd5fc4)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR30_Brdg_StrgThru.skin'
		materials = [
			gtr30_brdg_strgthru_primary
		]
	}
	{
		desc_id = gtr30_hardware_03
		frontend_desc = qs(0x6973bba6)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR30_Hardware_03.skin'
		materials = [
			gtr30_hardware_03_primary
		]
	}
	{
		desc_id = gtr30_bridge_d
		frontend_desc = qs(0xdda90c7d)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR30_Bridge_D.skin'
		materials = [
			gtr30_bridge_d_primary
		]
	}
	{
		desc_id = gtr30_bridge_e
		frontend_desc = qs(0x0fca55d4)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_30_Bridge_E.skin'
		materials = [
			gtr_30_bridge_e_primary
		]
	}
	{
		desc_id = gtr31_bridge
		frontend_desc = qs(0xc10af50b)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR31_Bridge.skin'
		materials = [
			gtr31_bridge_primary
		]
	}
	{
		desc_id = gtr31_bridge31
		frontend_desc = qs(0x54af7300)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR31_TM.skin'
		materials = [
			gtr31_tm_primary
		]
	}
	{
		desc_id = gtr31b_bridge_tmatic
		frontend_desc = qs(0x67ea72ee)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR31_Bridge_TM.skin'
		materials = [
			gtr31_bridge_tm_primary
		]
	}
	{
		desc_id = gtr31_bridge_tmatic
		frontend_desc = qs(0x9386fde9)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR31_Bridge_TMZ.skin'
		materials = [
			gtr31_bridge_tm_primary
		]
	}
	{
		desc_id = gtr31_hardware_b
		frontend_desc = qs(0x6973bba6)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR31_Hardware_B.skin'
		materials = [
			gtr31_hardware_b_primary
		]
	}
	{
		desc_id = gtr_31_bridge_e
		frontend_desc = qs(0x81204927)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_31_Bridge_E.skin'
		materials = [
			gtr_31_bridge_e_primary
		]
	}
	{
		desc_id = gtr32_hardware01
		frontend_desc = qs(0xc3fd2353)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR32_Hardware01.skin'
		materials = [
			gtr32_hardware01_primary
		]
	}
	{
		desc_id = gtr33_hardware01z
		frontend_desc = qs(0xc3fd2353)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR33_Hardware01Z.skin'
		materials = [
			gtr33_hardware01z_primary
		]
	}
	{
		desc_id = gtr33_hardware02
		frontend_desc = qs(0xc3fd2353)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR33_Bridge_FR.skin'
		materials = [
			gtr33_bridge_fr_primary
		]
	}
	{
		desc_id = gtr33_brdg_strgthru
		frontend_desc = qs(0xb7ffb99a)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR33_Brdg_ST.skin'
		materials = [
			gtr33_brdg_st_primary
		]
	}
	{
		desc_id = gtr36_hardware01
		frontend_desc = qs(0x22b1d6b6)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR36_Hardware01.skin'
		materials = [
			gtr36_hardware01_primary
		]
	}
	{
		desc_id = gtr36_bridge_fr
		frontend_desc = qs(0x596bd661)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR36_Bridge_FR.skin'
		pak_num = 1
		is_esp = 1
		materials = [
			gtr36_bridge_fr_primary
		]
	}
	{
		desc_id = gtr37_bridge
		frontend_desc = qs(0xe9a73532)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR37_Bridge.skin'
		materials = [
			gtr37_bridge_primary
		]
	}
	{
		desc_id = gtr37_hardware
		frontend_desc = qs(0xc3fd2353)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR37_Hardware.skin'
		materials = [
			gtr37_hardware_primary
		]
	}
	{
		desc_id = gtr37_brdg_strgthru
		frontend_desc = qs(0xddfd5fc4)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR37_Brdg_ST.skin'
		materials = [
			gtr37_brdg_st_primary
		]
	}
	{
		desc_id = gtr_hardware62
		frontend_desc = qs(0xee920f2f)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_Hardware62.skin'
		materials = [
			gtr_hardware62_primary
		]
		guitar_string_start = gtr_hardware60b_start_properties
		guitar_string_end = gtr_hardware60b_end_properties
	}
	{
		desc_id = gtr_hardware62a
		frontend_desc = qs(0xfe048df0)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_Hardware62a.skin'
		materials = [
			gtr_hardware62a_primary
		]
		guitar_string_start = gtr_hardware60b_start_properties
		guitar_string_end = gtr_hardware60b_end_properties
	}
	{
		desc_id = gtr_hardware02
		frontend_desc = qs(0x023a6f1d)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_Hardware02.skin'
		materials = [
			gtr_hardware02_primary
		]
	}
	{
		desc_id = gtr_hardware02b
		frontend_desc = qs(0x6a58d307)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR33_Bridge_FR.skin'
		pak_num = 0
		is_metallica = 1
		is_esp = 1
		materials = [
			gtr33_bridge_fr_primary
		]
	}
	{
		desc_id = gtr_hardware64
		frontend_desc = qs(0xfb65592f)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_Hardware64.skin'
		materials = [
			gtr_hardware64_primary
		]
	}
	{
		desc_id = gtr_hardware60b
		frontend_desc = qs(0xfb65592f)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_Hardware60b.skin'
		materials = [
			gtr_hardware60b_primary
		]
		guitar_string_start = gtr_hardware60b_start_properties
		guitar_string_end = gtr_hardware60b_end_properties
	}
	{
		desc_id = gtr_hardware63
		frontend_desc = qs(0xfb65592f)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_Hardware63.skin'
		materials = [
			gtr_hardware63_primary
		]
	}
	{
		desc_id = gtr_hardware63c
		frontend_desc = qs(0xfb65592f)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_Hardware63c.skin'
		materials = [
			gtr_hardware63c_primary
		]
		guitar_string_start = gtr_hardware63c_start_properties
		guitar_string_end = gtr_hardware63c_end_properties
	}
	{
		desc_id = gtr_hardware63b
		frontend_desc = qs(0x023a6f1d)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_Hardware63b.skin'
		materials = [
			gtr_hardware63b_primary
		]
	}
	{
		desc_id = gtr_hardware63f
		frontend_desc = qs(0xfb65592f)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_Hardware63f.skin'
		materials = [
			gtr_hardware63f_primary
		]
	}
	{
		desc_id = gtr_hardware64b
		frontend_desc = qs(0xddfd5fc4)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_hardware64b.skin'
		materials = [
			gtr_hardware64b_primary
		]
	}
	{
		desc_id = gtr_hardware64bb
		frontend_desc = qs(0x023a6f1d)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_Hardware64bb.skin'
		materials = [
			gtr_hardware64bb_primary
		]
	}
	{
		desc_id = gtr_hardware64f
		frontend_desc = qs(0xfb65592f)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_Hardware64f.skin'
		materials = [
			gtr_hardware64f_primary
		]
	}
	{
		desc_id = gtr_bridge_65
		frontend_desc = qs(0xd0c872b5)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_bridge_65.skin'
		materials = [
			gtr_bridge_65_primary
		]
		guitar_string_start = gtr_bridge_65_start_properties
		guitar_string_end = gtr_bridge_65_end_properties
	}
	{
		desc_id = gtr_hardware66
		frontend_desc = qs(0xa956861e)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_Hardware66.skin'
		materials = [
			gtr_hardware66_primary
		]
		guitar_string_start = gtr_bridge_66_start_properties
		guitar_string_end = gtr_bridge_66_end_properties
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
		desc_id = gtr_fretboard_01
		frontend_desc = qs(0x2bfd4eae)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_Fretboard_01.skin'
		pak_num = 0
		is_esp = 1
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d_01.dds'
				material = gtr_fretboard_01_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_241
				$car_rocker_guitars_factoredglobal_242
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d_01.dds`
				material = gtr_fretboard_01_primary
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/esp/gtr1_esp_inlay_01.img`
						flags = 4
						Color = grey_5
					}
				]
				$car_rocker_guitars_factoredglobal_243
			}
		]
	}
	{
		desc_id = gtr_fretboard_02
		frontend_desc = qs(0x01cc0004)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_Fretboard_02.skin'
		pak_num = 0
		is_esp = 1
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d2_01.dds'
				material = gtr_fretboard_02_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_241
				$car_rocker_guitars_factoredglobal_244
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d2_01.dds`
				material = gtr_fretboard_02_primary
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/esp/gtr1_esp_inlay_01.img`
						flags = 4
						Color = grey_5
					}
				]
				$car_rocker_guitars_factoredglobal_243
			}
		]
	}
	{
		desc_id = gtr_fretboard_03
		frontend_desc = qs(0x5e9fbd24)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_Fretboard_03.skin'
		pak_num = 0
		is_esp = 1
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d3_01.dds'
				material = gtr_fretboard_03_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_241
				$car_rocker_guitars_factoredglobal_242
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d3_01.dds`
				material = gtr_fretboard_03_primary
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/esp/gtr1_esp_inlay_01.img`
						flags = 4
						Color = grey_5
					}
				]
				$car_rocker_guitars_factoredglobal_243
			}
		]
	}
	{
		desc_id = gtr_fretboard_04
		frontend_desc = qs(0x226a628b)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_Fretboard_04.skin'
		pak_num = 0
		is_esp = 1
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01.dds'
				material = gtr_fretboard_04_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_241
				$car_rocker_guitars_factoredglobal_242
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01.dds`
				material = gtr_fretboard_04_primary
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/esp/gtr1_esp_inlay_01.img`
						flags = 4
						Color = grey_5
					}
				]
				$car_rocker_guitars_factoredglobal_243
			}
		]
	}
	{
		desc_id = gtr_fretboard24_01
		frontend_desc = qs(0xa2bf049e)
		pak_num = 0
		is_esp = 1
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_Fretboard24_01.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d1_02.dds'
				material = gtr_fretboard24_01_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_245
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d1_02.dds`
				material = gtr_fretboard24_01_primary
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/esp/24frt_ld_02.img`
						flags = 36
					}
				]
				$car_rocker_guitars_factoredglobal_243
			}
		]
	}
	{
		desc_id = gtr_fretboard24_02
		frontend_desc = qs(0xb1f15254)
		pak_num = 0
		is_esp = 1
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_Fretboard24_02.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d2_02.dds'
				material = gtr_fretboard24_02_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_245
				$car_rocker_guitars_factoredglobal_244
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d2_02.dds`
				material = gtr_fretboard24_02_primary
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/esp/24frt_ld_02.img`
						flags = 36
					}
				]
				$car_rocker_guitars_factoredglobal_243
			}
		]
	}
	{
		desc_id = gtr_fretboard24_03
		frontend_desc = qs(0x17d0aa1b)
		pak_num = 0
		is_esp = 1
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_Fretboard24_03.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d3_02.dds'
				material = gtr_fretboard24_03_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_245
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d3_02.dds`
				material = gtr_fretboard24_03_primary
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/esp/24frt_ld_02.img`
						flags = 36
					}
				]
				$car_rocker_guitars_factoredglobal_243
			}
		]
	}
	{
		desc_id = gtr_fretboard24_04
		frontend_desc = qs(0x925730db)
		pak_num = 0
		is_esp = 1
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_Fretboard24_04.skin'
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02.dds'
				material = gtr_fretboard24_04_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_245
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02.dds`
				material = gtr_fretboard24_04_primary
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/esp/24frt_ld_02.img`
						flags = 36
					}
				]
				$car_rocker_guitars_factoredglobal_243
			}
		]
	}
	{
		desc_id = gtr_fretboard_24
		frontend_desc = qs(0xf781a84e)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_FBoard_ESP_24Fret.skin'
		pak_num = 0
		is_esp = 1
		is_metallica = 1
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/ESP_Fretboard_24frt.dds'
				material = gtr_fboard_esp_24_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0xb0072c1a)
				mask = $cag_neck_24b
			}
		]
	}
	{
		desc_id = gtr_fboard_v1000
		frontend_desc = qs(0x8bbb0e9c)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_FBoard_V1000.skin'
		pak_num = 0
		is_esp = 1
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/esp_fretboard_24frt.dds'
				material = gtr31_fboard_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_247
				$car_rocker_guitars_factoredglobal_244
			}
		]
	}
	{
		desc_id = gtr31_fboard_02
		frontend_desc = qs(0x21ad5ed2)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR31_FBoard_02.skin'
		pak_num = 0
		is_esp = 1
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/frtbrd_esp_24fr_ros.dds'
				material = gtr31_fbdrose_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_247
				$car_rocker_guitars_factoredglobal_244
			}
		]
	}
	{
		desc_id = gtr31_fboard_03
		frontend_desc = qs(0xa81d6c13)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR31_FBoard_03.skin'
		pak_num = 0
		is_esp = 1
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/frtbrd_esp_24fr_map.dds'
				material = gtr31_fbdmap_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_247
				$car_rocker_guitars_factoredglobal_244
			}
		]
	}
	{
		desc_id = gtr31_fboard_gryn
		frontend_desc = qs(0x96f76fb2)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR31_FBoard_Gryn.skin'
		pak_num = 1
		is_metallica = 1
	}
	{
		desc_id = gtr33_fboard_mum
		frontend_desc = qs(0x5f319491)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR33_FBoard_MUM.skin'
		pak_num = 1
		is_metallica = 1
	}
	{
		desc_id = gtr33d_fboard_brs
		frontend_desc = qs(0x1e539c97)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR33D_FBoard_BRS.skin'
		pak_num = 1
		is_metallica = 1
	}
	{
		desc_id = gtr33d_fboard_anni
		frontend_desc = qs(0x32b67dba)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR33D_FBoard_ANNI.skin'
		pak_num = 0
		is_esp = 1
		is_metallica = 1
	}
	{
		desc_id = gtr36_fboard
		frontend_desc = qs(0x1a978a31)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR36_FBoard.skin'
		pak_num = 0
		is_esp = 1
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_fboard.dds'
				material = gtr36_fboard_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0xb0072c1a)
				mask = $cag_fboard36
				$car_rocker_guitars_factoredglobal_244
			}
		]
	}
	{
		desc_id = gtr_fboard_22
		frontend_desc = qs(0x8fcb8220)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_FBoard_22.skin'
		pak_num = 0
		is_esp = 1
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/esp_fboard_22_d.dds'
				material = gtr_fboard_22_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_249
				$car_rocker_guitars_factoredglobal_244
			}
		]
	}
	{
		desc_id = gtr_fboard_22b
		frontend_desc = qs(0xf1edac8a)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_FBoard_22B.skin'
		pak_num = 0
		is_esp = 1
		is_metallica = 1
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/esp_fboard_22B_d.dds'
				material = gtr_fboard_22b_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_249
				$car_rocker_guitars_factoredglobal_244
			}
		]
	}
	{
		desc_id = gtr_fboard_22c
		frontend_desc = qs(0x583c4f4d)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_FBoard_22C.skin'
		pak_num = 0
		is_esp = 1
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/esp_fboard_22c.dds'
				material = gtr_fboard_22c_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_249
				$car_rocker_guitars_factoredglobal_244
			}
		]
	}
	{
		desc_id = gtr33_fboard_kh2vint
		frontend_desc = qs(0x98fa9ce7)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR33_FBoard_KH2Vint.skin'
		pak_num = 1
		is_metallica = 1
	}
	{
		desc_id = gtr33_fboard_drac
		frontend_desc = qs(0xf97595ed)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR33_FBoard_Drac.skin'
		pak_num = 1
		is_metallica = 1
	}
	{
		desc_id = gtr_fretboard_65
		frontend_desc = qs(0xc1ef2ead)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_Fretboard_65.skin'
		pak_num = 0
		is_metallica = 1
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/ESP_Fretboard_24frtB.dds'
				material = gtr_fretboard_65_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_245
			}
		]
	}
	{
		desc_id = gtr_fretboard_66
		frontend_desc = qs(0xb31e742d)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR_Fretboard_66.skin'
		pak_num = 0
		is_esp = 1
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/GTR_Fretboard_66_D.dds'
				material = gtr_fretboard_66_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0xb0072c1a)
				mask = $cag_fboard66
			}
		]
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
				$car_rocker_guitars_factoredglobal_251
				$car_rocker_guitars_factoredglobal_252
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
						Color = grey_1
					}
				]
				$car_rocker_guitars_factoredglobal_243
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
				$car_rocker_guitars_factoredglobal_251
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
				$car_rocker_guitars_factoredglobal_243
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
				$car_rocker_guitars_factoredglobal_251
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
				$car_rocker_guitars_factoredglobal_243
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
				$car_rocker_guitars_factoredglobal_251
				$car_rocker_guitars_factoredglobal_252
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
						Color = grey_1
					}
				]
				$car_rocker_guitars_factoredglobal_243
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
				$car_rocker_guitars_factoredglobal_251
				$car_rocker_guitars_factoredglobal_252
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
						Color = grey_3
					}
				]
				$car_rocker_guitars_factoredglobal_243
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
				$car_rocker_guitars_factoredglobal_251
				$car_rocker_guitars_factoredglobal_252
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
						Color = grey_3
					}
				]
				$car_rocker_guitars_factoredglobal_243
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
		frontend_desc = qs(0x05beb623)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_Neck_98.skin'
		$car_rocker_guitars_factoredglobal_253
	}
	{
		desc_id = guitar_neck_corgan
		frontend_desc = qs(0x86e5e72b)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_Neck_97.skin'
		$car_rocker_guitars_factoredglobal_253
	}
]
cas_guitar_head = [
	{
		desc_id = gtr1_neckhead_01
		frontend_desc = qs(0xe88a9b10)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR1_Neckhead_01.skin'
		materials = [
			gtr1_neckhead_01_hardware
		]
		pak_num = 0
		is_esp = 1
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr1_neckhead_d_01.dds'
				material = gtr1_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_254
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr1_neckhead_d_01.dds'
				material = gtr1_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_255
			}
		]
	}
	{
		desc_id = gtr2_neckhead_02
		frontend_desc = qs(0x766d7970)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR2_Neckhead_02.skin'
		materials = [
			gtr2_neckhead_02_hardware
		]
		pak_num = 1
		is_metallica = 1
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr2_neckhead_d_02.dds'
				material = gtr2_neckhead_02_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_254
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr2_neckhead_d_02.dds'
				material = gtr2_neckhead_02_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_255
			}
		]
	}
	{
		desc_id = gtr3_neckhead_03
		frontend_desc = qs(0xe534703f)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR3_Neckhead_03.skin'
		pak_num = 1
		is_metallica = 1
		materials = [
			gtr3_neckhead_03_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr3_neckhead_d_03.dds'
				material = gtr3_neckhead_03_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_254
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr3_neckhead_d_03.dds'
				material = gtr3_neckhead_03_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_255
			}
		]
	}
	{
		desc_id = gtr4_neckhead_01
		frontend_desc = qs(0x6de4a5a9)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR4_Neckhead_01.skin'
		materials = [
			gtr4_neckhead_01_hardware
		]
		pak_num = 0
		is_esp = 1
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr4_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_256
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr4_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_257
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr4_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr4_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr4_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr4_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr4_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr4_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr4_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr4_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr4_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr4_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr4_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_258
			}
		]
	}
	{
		desc_id = gtr4_neckhead_02
		frontend_desc = qs(0x9e56fccb)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR4_Neckhead_02.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr4_neckhead_02_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr4_neckhead_02_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_259
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr4_neckhead_02_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_260
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr4_neckhead_02_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr4_neckhead_02_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr4_neckhead_02_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr4_neckhead_02_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr4_neckhead_02_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr4_neckhead_02_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr4_neckhead_02_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr4_neckhead_02_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr4_neckhead_02_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr4_neckhead_02_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr4_neckhead_02_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_258
			}
		]
	}
	{
		desc_id = gtr4_neckhead_03
		frontend_desc = qs(0x947b1639)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR4_Neckhead_03.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr4_neckhead_03_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr4_neckhead_03_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_261
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr4_neckhead_03_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_262
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr4_neckhead_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr4_neckhead_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr4_neckhead_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr4_neckhead_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr4_neckhead_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr4_neckhead_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr4_neckhead_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr4_neckhead_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr4_neckhead_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr4_neckhead_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr4_neckhead_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_258
			}
		]
	}
	{
		desc_id = gtr4_neckhead_04
		frontend_desc = qs(0xab224c92)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR4_Neckhead_04.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr4_neckhead_04_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr4_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_263
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr4_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_264
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr4_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr4_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr4_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr4_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr4_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr4_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr4_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr4_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr4_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr4_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr4_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_265
			}
		]
	}
	{
		desc_id = gtr4_neckhead_05
		frontend_desc = qs(0x5782ad70)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR4_Neckhead_05.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr4_neckhead_05_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_d.dds'
				material = gtr4_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_266
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_d.dds'
				material = gtr4_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_267
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_d.dds'
				material = gtr4_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_d.dds'
				material = gtr4_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_d.dds'
				material = gtr4_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_d.dds'
				material = gtr4_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_d.dds'
				material = gtr4_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_d.dds'
				material = gtr4_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_d.dds'
				material = gtr4_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_d.dds'
				material = gtr4_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_d.dds'
				material = gtr4_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_d.dds'
				material = gtr4_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_d.dds'
				material = gtr4_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_268
			}
		]
	}
	{
		desc_id = gtr4_neckhead_06
		frontend_desc = qs(0x66bbe224)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR4_Neckhead_06.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr4_neckhead_06_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_06.dds'
				material = gtr4_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_269
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_06.dds'
				material = gtr4_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_270
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_06.dds'
				material = gtr4_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_06.dds'
				material = gtr4_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_06.dds'
				material = gtr4_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_06.dds'
				material = gtr4_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_06.dds'
				material = gtr4_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_06.dds'
				material = gtr4_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_06.dds'
				material = gtr4_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_06.dds'
				material = gtr4_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_06.dds'
				material = gtr4_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_06.dds'
				material = gtr4_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_06.dds'
				material = gtr4_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_265
			}
		]
	}
	{
		desc_id = gtr4_neckhead_07
		frontend_desc = qs(0x69d1d04e)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR4_Neckhead_07.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr4_neckhead_07_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_07.dds'
				material = gtr4_neckhead_07_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_271
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_07.dds'
				material = gtr4_neckhead_07_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_272
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_07.dds'
				material = gtr4_neckhead_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_07.dds'
				material = gtr4_neckhead_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_07.dds'
				material = gtr4_neckhead_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_07.dds'
				material = gtr4_neckhead_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_07.dds'
				material = gtr4_neckhead_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_07.dds'
				material = gtr4_neckhead_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_07.dds'
				material = gtr4_neckhead_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_07.dds'
				material = gtr4_neckhead_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_07.dds'
				material = gtr4_neckhead_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_07.dds'
				material = gtr4_neckhead_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_07.dds'
				material = gtr4_neckhead_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_273
			}
		]
	}
	{
		desc_id = gtr5_neckhead
		frontend_desc = qs(0x6a124054)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR5_Neckhead.skin'
		pak_num = 1
		is_metallica = 1
		materials = [
			gtr5_neckhead_hardware
		]
	}
	{
		desc_id = gtr6_neckhead
		frontend_desc = qs(0xa288e720)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR6_Neckhead.skin'
		pak_num = 1
		is_metallica = 1
		materials = [
			gtr6_neckhead_hardware
		]
	}
	{
		desc_id = gtr7_neckhead
		frontend_desc = qs(0xe7bb2626)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR7_Neckhead.skin'
		pak_num = 1
		is_metallica = 1
		materials = [
			gtr7_neckhead_hardware
		]
	}
	{
		desc_id = gtr8_neckhead
		frontend_desc = qs(0x8fc52ae9)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR8_Neckhead.skin'
		pak_num = 1
		is_metallica = 1
		materials = [
			gtr8_neckhead_hardware
		]
	}
	{
		desc_id = gtr9_neckhead_01
		frontend_desc = qs(0xb104e40c)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR9_Neckhead_01.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr9_neckhead_01_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr9_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_259
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr9_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_260
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr9_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr9_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr9_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr9_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr9_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr9_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr9_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr9_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr9_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr9_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr9_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_258
			}
		]
	}
	{
		desc_id = gtr9_neckhead_02
		frontend_desc = qs(0x6de4a5a9)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR9_Neckhead_02.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr4_neckhead_01_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr4_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_256
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr4_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_257
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr4_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr4_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr4_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr4_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr4_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr4_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr4_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr4_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr4_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr4_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr4_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_258
			}
		]
	}
	{
		desc_id = gtr9_neckhead_03
		frontend_desc = qs(0x947b1639)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR9_Neckhead_03.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr4_neckhead_03_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr4_neckhead_03_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_261
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr4_neckhead_03_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_262
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr4_neckhead_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr4_neckhead_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr4_neckhead_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr4_neckhead_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr4_neckhead_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr4_neckhead_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr4_neckhead_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr4_neckhead_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr4_neckhead_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr4_neckhead_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr4_neckhead_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_258
			}
		]
	}
	{
		desc_id = gtr9_neckhead_04
		frontend_desc = qs(0xab224c92)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR9_Neckhead_04.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr4_neckhead_04_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr4_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_263
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr4_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_264
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr4_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr4_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr4_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr4_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr4_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr4_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr4_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr4_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr4_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr4_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr4_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_265
			}
		]
	}
	{
		desc_id = gtr9_neckhead_05
		frontend_desc = qs(0x5782ad70)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR9_Neckhead_05.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr4_neckhead_05_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_d.dds'
				material = gtr4_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_266
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_d.dds'
				material = gtr4_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_267
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_d.dds'
				material = gtr4_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_d.dds'
				material = gtr4_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_d.dds'
				material = gtr4_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_d.dds'
				material = gtr4_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_d.dds'
				material = gtr4_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_d.dds'
				material = gtr4_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_d.dds'
				material = gtr4_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_d.dds'
				material = gtr4_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_d.dds'
				material = gtr4_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_d.dds'
				material = gtr4_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_d.dds'
				material = gtr4_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_268
			}
		]
	}
	{
		desc_id = gtr9_neckhead_06
		frontend_desc = qs(0x66bbe224)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR9_Neckhead_06.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr4_neckhead_06_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_06.dds'
				material = gtr4_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_269
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_06.dds'
				material = gtr4_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_270
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_06.dds'
				material = gtr4_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_06.dds'
				material = gtr4_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_06.dds'
				material = gtr4_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_06.dds'
				material = gtr4_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_06.dds'
				material = gtr4_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_06.dds'
				material = gtr4_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_06.dds'
				material = gtr4_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_06.dds'
				material = gtr4_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_06.dds'
				material = gtr4_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_06.dds'
				material = gtr4_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_06.dds'
				material = gtr4_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_265
			}
		]
	}
	{
		desc_id = gtr9_neckhead_07
		frontend_desc = qs(0x69d1d04e)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR9_Neckhead_07.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr4_neckhead_07_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_07.dds'
				material = gtr4_neckhead_07_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_271
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_07.dds'
				material = gtr4_neckhead_07_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_272
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_07.dds'
				material = gtr4_neckhead_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_07.dds'
				material = gtr4_neckhead_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_07.dds'
				material = gtr4_neckhead_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_07.dds'
				material = gtr4_neckhead_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_07.dds'
				material = gtr4_neckhead_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_07.dds'
				material = gtr4_neckhead_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_07.dds'
				material = gtr4_neckhead_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_07.dds'
				material = gtr4_neckhead_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_07.dds'
				material = gtr4_neckhead_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_07.dds'
				material = gtr4_neckhead_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_07.dds'
				material = gtr4_neckhead_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_273
			}
		]
	}
	{
		desc_id = gtr10_neckhead
		frontend_desc = qs(0x69c196c4)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR10_Neckhead.skin'
		pak_num = 1
		is_metallica = 1
		materials = [
			gtr10_neckhead_hardware
		]
	}
	{
		desc_id = gtr11_neckhead
		frontend_desc = qs(0x28a7dc28)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR11_Neckhead.skin'
		pak_num = 1
		is_metallica = 1
		materials = [
			gtr11_neckhead_hardware
		]
	}
	{
		desc_id = gtr12_neckhead12
		frontend_desc = qs(0x6f1e1d54)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR12_Neckhead12.skin'
		pak_num = 1
		is_metallica = 1
		materials = [
			gtr12_neckhead12_hardware
		]
	}
	{
		desc_id = gtr14_neckhead
		frontend_desc = qs(0xc3c54709)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR14_Neckhead.skin'
		pak_num = 1
		is_metallica = 1
		materials = [
			gtr10_neckhead_hardware
		]
	}
	{
		desc_id = gtr12_neckhead_01
		frontend_desc = qs(0x6de4a5a9)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR12_Neckhead_01.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr12_neckhead_01_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr12_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_256
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr12_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_257
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr12_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr12_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr12_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr12_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr12_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr12_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr12_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr12_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr12_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr12_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr12_neckhead_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_258
			}
		]
	}
	{
		desc_id = gtr12_neckhead_02
		frontend_desc = qs(0xb104e40c)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR12_Neckhead_02.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr12_neckhead_02_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr12_neckhead_02_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_259
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr12_neckhead_02_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_260
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr12_neckhead_02_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr12_neckhead_02_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr12_neckhead_02_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr12_neckhead_02_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr12_neckhead_02_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr12_neckhead_02_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr12_neckhead_02_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr12_neckhead_02_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr12_neckhead_02_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr12_neckhead_02_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr12_neckhead_02_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_258
			}
		]
	}
	{
		desc_id = gtr12_neckhead_03
		frontend_desc = qs(0x947b1639)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR12_Neckhead_03.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr12_neckhead_03_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr12_neckhead_03_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_261
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr12_neckhead_03_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_262
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr12_neckhead_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr12_neckhead_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr12_neckhead_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr12_neckhead_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr12_neckhead_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr12_neckhead_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr12_neckhead_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr12_neckhead_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr12_neckhead_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr12_neckhead_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr12_neckhead_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_258
			}
		]
	}
	{
		desc_id = gtr12_neckhead_04
		frontend_desc = qs(0xab224c92)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR12_Neckhead_04.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr12_neckhead_04_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr12_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_263
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr12_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_264
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr12_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr12_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr12_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr12_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr12_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr12_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr12_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr12_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr12_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr12_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr12_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_265
			}
		]
	}
	{
		desc_id = gtr12_neckhead_05
		frontend_desc = qs(0x5782ad70)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR12_Neckhead_05.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr12_neckhead_05_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_d.dds'
				material = gtr12_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_266
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_d.dds'
				material = gtr12_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_267
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_d.dds'
				material = gtr12_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_d.dds'
				material = gtr12_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_d.dds'
				material = gtr12_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_d.dds'
				material = gtr12_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_d.dds'
				material = gtr12_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_d.dds'
				material = gtr12_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_d.dds'
				material = gtr12_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_d.dds'
				material = gtr12_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_d.dds'
				material = gtr12_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_d.dds'
				material = gtr12_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_d.dds'
				material = gtr12_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_268
			}
		]
	}
	{
		desc_id = gtr12_neckhead_06
		frontend_desc = qs(0x66bbe224)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR12_Neckhead_06.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr12_neckhead_06_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_06.dds'
				material = gtr12_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_269
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_06.dds'
				material = gtr12_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_270
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_06.dds'
				material = gtr12_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_06.dds'
				material = gtr12_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_06.dds'
				material = gtr12_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_06.dds'
				material = gtr12_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_06.dds'
				material = gtr12_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_06.dds'
				material = gtr12_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_06.dds'
				material = gtr12_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_06.dds'
				material = gtr12_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_06.dds'
				material = gtr12_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_06.dds'
				material = gtr12_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_06.dds'
				material = gtr12_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_265
			}
		]
	}
	{
		desc_id = gtr12_neckhead_07
		frontend_desc = qs(0x69d1d04e)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR12_Neckhead_07.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr12_neckhead_07_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_07.dds'
				material = gtr12_neckhead_07_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_271
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_07.dds'
				material = gtr12_neckhead_07_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_272
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_07.dds'
				material = gtr12_neckhead_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_07.dds'
				material = gtr12_neckhead_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_07.dds'
				material = gtr12_neckhead_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_07.dds'
				material = gtr12_neckhead_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_07.dds'
				material = gtr12_neckhead_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_07.dds'
				material = gtr12_neckhead_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_07.dds'
				material = gtr12_neckhead_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_07.dds'
				material = gtr12_neckhead_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_07.dds'
				material = gtr12_neckhead_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_07.dds'
				material = gtr12_neckhead_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_07.dds'
				material = gtr12_neckhead_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_273
			}
		]
	}
	{
		desc_id = gtr30_nekhed_a
		frontend_desc = qs(0xa11eb675)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR30_Nekhed_A.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr30_nekhead_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_274
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_275
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_276
			}
		]
	}
	{
		desc_id = gtr30_nekhed_b
		frontend_desc = qs(0x8a33e5b6)
		pak_num = 0
		is_esp = 1
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR31c_NeckHead.skin'
		materials = [
			gtr31c_neckhead_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_277
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_278
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_258
			}
		]
	}
	{
		desc_id = gtr30_nekhed_c
		frontend_desc = qs(0x1a978a31)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR36_NekHed.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr36_nhead_sprv_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_279
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_280
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_281
			}
		]
	}
	{
		desc_id = gtr30_nekhed_d
		frontend_desc = qs(0x69d1d04e)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR32_Nekhead01.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr32_nhed_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_282
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_283
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_273
			}
		]
	}
	{
		desc_id = gtr30_nekhed_e
		frontend_desc = qs(0x66bbe224)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR31c_NeckHead04.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr33d_neckhead_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_284
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_285
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_265
			}
		]
	}
	{
		desc_id = gtr30_nekhed_f
		frontend_desc = qs(0x743000b2)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR37_Neckhead.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr37_nhead_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_286
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_287
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_288
			}
		]
	}
	{
		desc_id = gtr31b_neckhead
		frontend_desc = qs(0xef3793ba)
		pak_num = 0
		is_metallica = 1
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR31b_Neckhead.skin'
		materials = [
			gtr31b_neckhead_hardware
		]
	}
	{
		desc_id = gtr31c_neckhead
		frontend_desc = qs(0x8a33e5b6)
		pak_num = 0
		is_esp = 1
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR31c_NeckHead.skin'
		materials = [
			gtr31c_neckhead_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_277
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_278
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_258
			}
		]
	}
	{
		desc_id = gtr31c_neckhead03
		frontend_desc = qs(0x1a978a31)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR31c_NeckHead03.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr36_nhead_sprv_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_279
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_280
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_281
			}
		]
	}
	{
		desc_id = gtr31c_neckhead06
		frontend_desc = qs(0x743000b2)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR31c_NeckHead06.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr37_nhead_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_286
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_287
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_288
			}
		]
	}
	{
		desc_id = gtr31c_neckhead04
		frontend_desc = qs(0x66bbe224)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR31c_NeckHead04.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr33d_neckhead_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_284
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_285
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_265
			}
		]
	}
	{
		desc_id = gtr31c_neckhead05
		frontend_desc = qs(0x69d1d04e)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR31c_NeckHead05.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr32_nhed_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_282
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_283
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_273
			}
		]
	}
	{
		desc_id = gtr31c_neckhead02
		frontend_desc = qs(0xa11eb675)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR31c_NeckHead02.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr30_nekhead_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_274
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_275
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_276
			}
		]
	}
	{
		desc_id = gtr32_nekhead01
		frontend_desc = qs(0x69d1d04e)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR32_Nekhead01.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr32_nhed_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_282
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_283
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_273
			}
		]
	}
	{
		desc_id = gtr32_neckhead_f
		frontend_desc = qs(0x1a978a31)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR32_Neckhead_F.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr36_nhead_sprv_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_279
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_280
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_281
			}
		]
	}
	{
		desc_id = gtr32_neckhead_c
		frontend_desc = qs(0x743000b2)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR32_Neckhead_C.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr37_nhead_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_286
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_287
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_288
			}
		]
	}
	{
		desc_id = gtr32_neckhead_b
		frontend_desc = qs(0x66bbe224)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR32_Neckhead_B.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr33d_neckhead_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_284
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_285
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_265
			}
		]
	}
	{
		desc_id = gtr32_neckhead_e
		frontend_desc = qs(0x88fe6e45)
		pak_num = 0
		is_esp = 1
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR31c_NeckHead.skin'
		materials = [
			gtr31c_neckhead_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_277
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_278
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_258
			}
		]
	}
	{
		desc_id = gtr32_neckhead_d
		frontend_desc = qs(0xa11eb675)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR32_Neckhead_D.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr30_nekhead_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_274
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_275
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_276
			}
		]
	}
	{
		desc_id = gtr33d_nekhed
		frontend_desc = qs(0x107806ae)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR33D_NekHed.skin'
		pak_num = 0
		is_esp = 1
		is_metallica = 1
		materials = [
			gtr33d_neckhead_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_284
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_285
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_265
			}
		]
	}
	{
		desc_id = gtr33d_nekhed_b
		frontend_desc = qs(0x311573a7)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR33D_NekHed_B.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr32_nhed_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_282
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_283
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_273
			}
		]
	}
	{
		desc_id = gtr33d_neckhead_d
		frontend_desc = qs(0x743000b2)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR33D_Nekhead_D.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr37_nhead_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_286
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_287
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_288
			}
		]
	}
	{
		desc_id = gtr33d_nekhed_c
		frontend_desc = qs(0x1a978a31)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR33D_NekHed_C.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr36_nhead_sprv_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_279
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_280
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_281
			}
		]
	}
	{
		desc_id = gtr33d_nekhed_e
		frontend_desc = qs(0x7510e81e)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR33D_NekHed_E.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr30_nekhead_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_274
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_275
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_276
			}
		]
	}
	{
		desc_id = gtr33d_nekhed_f
		frontend_desc = qs(0x77ae7ae2)
		pak_num = 0
		is_esp = 1
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR33D_NekHed_F.skin'
		materials = [
			gtr31c_neckhead_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_277
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_278
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_258
			}
		]
	}
	{
		desc_id = gtr33_nekhed_drac
		frontend_desc = qs(0xabc57cd5)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR33_NekHed_Drac.skin'
		pak_num = 1
		is_metallica = 1
		materials = [
			gtr33_nekhed_drac_hardware
		]
	}
	{
		desc_id = gtr33brideshead
		frontend_desc = qs(0xa75c10ea)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR33Brideshead.skin'
		pak_num = 1
		is_metallica = 1
		materials = [
			gtr33_brideshead_hardware
		]
	}
	{
		desc_id = gtr36_nekhed
		frontend_desc = qs(0x1a978a31)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR36_NekHed.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr36_nhead_sprv_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_279
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_280
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_281
			}
		]
	}
	{
		desc_id = gtr36_nekhed_b
		frontend_desc = qs(0x743000b2)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR36_NekHed_B.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr37_nhead_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_286
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_287
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_288
			}
		]
	}
	{
		desc_id = gtr36_nekhed_e
		frontend_desc = qs(0x69d1d04e)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR36_NekHed_E.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr32_nhed_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_282
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_283
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_273
			}
		]
	}
	{
		desc_id = gtr36_nekhed_f
		frontend_desc = qs(0x66bbe224)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR36_NekHed_F.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr33d_neckhead_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_284
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_285
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_265
			}
		]
	}
	{
		desc_id = gtr36_nekhed_c
		frontend_desc = qs(0x88fe6e45)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR36_NekHed_C.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr31c_neckhead_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_277
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_278
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_258
			}
		]
	}
	{
		desc_id = gtr36_nekhed_d
		frontend_desc = qs(0xa11eb675)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR36_NekHed_D.skin'
		is_esp = 1
		pak_num = 0
		materials = [
			gtr30_nekhead_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_274
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_275
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_276
			}
		]
	}
	{
		desc_id = gtr37_neckhead
		frontend_desc = qs(0x743000b2)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR37_Neckhead.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr37_nhead_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_286
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_287
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_288
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed.dds'
				material = gtr37_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_288
			}
		]
	}
	{
		desc_id = gtr37_neckhead_b
		frontend_desc = qs(0x1a978a31)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR37_Neckhead02.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr36_nhead_sprv_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_279
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_280
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_281
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed.dds'
				material = gtr36_nhead_sprv_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_281
			}
		]
	}
	{
		desc_id = gtr37_neckhead_c
		frontend_desc = qs(0x69d1d04e)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR37_Neckhead03.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr32_nhed_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_282
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_283
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed.dds'
				material = gtr32_nhed_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_273
			}
		]
	}
	{
		desc_id = gtr37_neckhead_d
		frontend_desc = qs(0x66bbe224)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR37_Neckhead04.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr33d_neckhead_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_284
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_285
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed.dds'
				material = gtr33d_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_265
			}
		]
	}
	{
		desc_id = gtr37_neckhead_e
		frontend_desc = qs(0x88fe6e45)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR37_Neckhead05.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr31c_neckhead_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_277
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_278
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead.dds'
				material = gtr31c_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_258
			}
		]
	}
	{
		desc_id = gtr37_neckhead_f
		frontend_desc = qs(0xa11eb675)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR37_Neckhead06.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr30_nekhead_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_274
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_275
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_276
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d.dds'
				material = gtr30_nekhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_276
			}
		]
	}
	{
		desc_id = gtr38_neckhead
		frontend_desc = qs(0x9b6034a9)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR38_Neckhead.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr38_nhead_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr38_nekhed.dds'
				material = gtr38_nhead_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $gtr38_nhead
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr38_nekhed.dds'
				material = gtr38_nhead_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $gtr38_nhead_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr38_nekhed.dds'
				material = gtr38_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_291
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr38_nekhed.dds'
				material = gtr38_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_291
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr38_nekhed.dds'
				material = gtr38_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_292
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr38_nekhed.dds'
				material = gtr38_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_292
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr38_nekhed.dds'
				material = gtr38_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_292
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr38_nekhed.dds'
				material = gtr38_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_292
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr38_nekhed.dds'
				material = gtr38_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_292
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr38_nekhed.dds'
				material = gtr38_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_292
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr38_nekhed.dds'
				material = gtr38_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_292
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr38_nekhed.dds'
				material = gtr38_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_292
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr38_nekhed.dds'
				material = gtr38_nhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_292
			}
		]
	}
	{
		desc_id = gtr60_neckhead
		frontend_desc = qs(0xab224c92)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR60_Neckhead.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr60_neckhead_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/GTR60_D_Neckhead.dds'
				material = gtr60_neckhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_263
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/GTR60_D_Neckhead.dds'
				material = gtr60_neckhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_264
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/GTR60_D_Neckhead.dds'
				material = gtr60_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/GTR60_D_Neckhead.dds'
				material = gtr60_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_D_neckhead.dds'
				material = gtr60_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_D_neckhead.dds'
				material = gtr60_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_D_neckhead.dds'
				material = gtr60_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_D_neckhead.dds'
				material = gtr60_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_D_neckhead.dds'
				material = gtr60_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_D_neckhead.dds'
				material = gtr60_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_D_neckhead.dds'
				material = gtr60_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_D_neckhead.dds'
				material = gtr60_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_D_neckhead.dds'
				material = gtr60_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_265
			}
		]
	}
	{
		desc_id = gtr60_neckhead2
		frontend_desc = qs(0x5782ad70)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR60_Neckhead2.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr60_neckhead2_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr60_neckhead2_d.dds'
				material = gtr60_neckhead2_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $gtr60_neckhead2
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr60_neckhead2_d.dds'
				material = gtr60_neckhead2_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $gtr60_neckhead2_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_neckhead2_d.dds'
				material = gtr60_neckhead2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_neckhead2_d.dds'
				material = gtr60_neckhead2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_neckhead2_d.dds'
				material = gtr60_neckhead2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_neckhead2_d.dds'
				material = gtr60_neckhead2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_neckhead2_d.dds'
				material = gtr60_neckhead2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_neckhead2_d.dds'
				material = gtr60_neckhead2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_neckhead2_d.dds'
				material = gtr60_neckhead2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_neckhead2_d.dds'
				material = gtr60_neckhead2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_neckhead2_d.dds'
				material = gtr60_neckhead2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_neckhead2_d.dds'
				material = gtr60_neckhead2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_neckhead2_d.dds'
				material = gtr60_neckhead2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_268
			}
		]
	}
	{
		desc_id = gtr60_neckhead3
		frontend_desc = qs(0x69d1d04e)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR60_Neckhead3.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr60_neckhead3_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr62_d_neckhead.dds'
				material = gtr60_neckhead3_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_295
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr62_d_neckhead.dds'
				material = gtr60_neckhead3_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_296
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr62_d_neckhead.dds'
				material = gtr60_neckhead3_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr62_d_neckhead.dds'
				material = gtr60_neckhead3_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr62_d_neckhead.dds'
				material = gtr60_neckhead3_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr62_d_neckhead.dds'
				material = gtr60_neckhead3_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr62_d_neckhead.dds'
				material = gtr60_neckhead3_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr62_d_neckhead.dds'
				material = gtr60_neckhead3_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr62_d_neckhead.dds'
				material = gtr60_neckhead3_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr62_d_neckhead.dds'
				material = gtr60_neckhead3_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr62_d_neckhead.dds'
				material = gtr60_neckhead3_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr62_d_neckhead.dds'
				material = gtr60_neckhead3_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr62_d_neckhead.dds'
				material = gtr60_neckhead3_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_273
			}
		]
	}
	{
		desc_id = gtr60_neckhead_04
		frontend_desc = qs(0x6de4a5a9)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR60_Neckhead_04.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr60_neckhead_04_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr60_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_256
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr60_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_257
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr60_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr60_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr60_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr60_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr60_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr60_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr60_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr60_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr60_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr60_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr60_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_258
			}
		]
	}
	{
		desc_id = gtr60_neckhead_05
		frontend_desc = qs(0xb104e40c)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR60_Neckhead_05.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr60_neckhead_05_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr60_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_259
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr60_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_260
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr60_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr60_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr60_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr60_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr60_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr60_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr60_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr60_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr60_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr60_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr60_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_258
			}
		]
	}
	{
		desc_id = gtr12b_neckhead
		frontend_desc = qs(0x9711a0c2)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR12b_Neckhead.skin'
		pak_num = 0
		is_metallica = 1
		materials = [
			gtr12b_neckhead_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr12b_neckhead_d.dds'
				material = gtr12b_neckhead_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $gtr12b_neckhead
			}
		]
	}
	{
		desc_id = gtr12c_neckhead
		frontend_desc = qs(0xad5a20d1)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR12c_Neckhead.skin'
		pak_num = 0
		is_metallica = 1
		materials = [
			gtr12c_neckhead_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr12c_neckhead_d.dds'
				material = gtr12c_neckhead_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $gtr12c_neckhead
			}
		]
	}
	{
		desc_id = gtr12g_neckhead
		frontend_desc = qs(0xb3081366)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR12g_Neckhead.skin'
		pak_num = 0
		is_metallica = 1
		materials = [
			gtr12g_neckhead_hardware
		]
		sections = [
		]
	}
	{
		desc_id = gtr12d_neckhead
		frontend_desc = qs(0xc488fb89)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR12D_Neckhead.skin'
		pak_num = 0
		is_metallica = 1
		materials = [
			gtr12d_neckhead_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr12d_neckhead_d.dds'
				material = gtr12d_neckhead_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $gtr12d_neckhead
			}
		]
	}
	{
		desc_id = gtr12e_neckhead
		frontend_desc = qs(0x1571ea0d)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR12E_Neckhead.skin'
		pak_num = 0
		is_metallica = 1
		materials = [
			gtr12e_neckhead_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr12e_neckhead_d.dds'
				material = gtr12e_neckhead_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $gtr12e_neckhead
			}
		]
	}
	{
		desc_id = gtr12h_neckhead
		frontend_desc = qs(0xab35d38c)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR12H_Neckhead.skin'
		pak_num = 0
		is_metallica = 1
		materials = [
			gtr12h_neckhead_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr12h_neckhead_d.dds'
				material = gtr12h_neckhead_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $gtr12h_neckhead
			}
		]
	}
	{
		desc_id = gtr62b_neckhead
		frontend_desc = qs(0x13932c66)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR62b_Neckhead.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr62b_neckhead_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr62b_neckhead_d.dds'
				material = gtr62b_neckhead_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $gtr62b_neckhead
			}
		]
	}
	{
		desc_id = gtr62_neckhead
		frontend_desc = qs(0x69d1d04e)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR62_Neckhead.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr62_neckhead_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr62_d_neckhead.dds'
				material = gtr62_neckhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_295
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr62_d_neckhead.dds'
				material = gtr62_neckhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_296
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr62_d_neckhead.dds'
				material = gtr62_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr62_d_neckhead.dds'
				material = gtr62_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr62_d_neckhead.dds'
				material = gtr62_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr62_d_neckhead.dds'
				material = gtr62_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr62_d_neckhead.dds'
				material = gtr62_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr62_d_neckhead.dds'
				material = gtr62_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr62_d_neckhead.dds'
				material = gtr62_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr62_d_neckhead.dds'
				material = gtr62_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr62_d_neckhead.dds'
				material = gtr62_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr62_d_neckhead.dds'
				material = gtr62_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr62_d_neckhead.dds'
				material = gtr62_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_273
			}
		]
	}
	{
		desc_id = gtr62_neckhead2
		frontend_desc = qs(0x5782ad70)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR62_Neckhead2.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr62_neckhead2_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr64_neckhead_d.dds'
				material = gtr62_neckhead2_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_266
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr64_neckhead_d.dds'
				material = gtr62_neckhead2_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_267
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_d.dds'
				material = gtr62_neckhead2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_d.dds'
				material = gtr62_neckhead2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_D.dds'
				material = gtr62_neckhead2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_D.dds'
				material = gtr62_neckhead2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_D.dds'
				material = gtr62_neckhead2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_D.dds'
				material = gtr62_neckhead2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_D.dds'
				material = gtr62_neckhead2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_D.dds'
				material = gtr62_neckhead2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_D.dds'
				material = gtr62_neckhead2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_D.dds'
				material = gtr62_neckhead2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_D.dds'
				material = gtr62_neckhead2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_268
			}
		]
	}
	{
		desc_id = gtr62_neckhead3
		frontend_desc = qs(0xab224c92)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR62_Neckhead3.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr62_neckhead3_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr60_d_neckhead.dds'
				material = gtr62_neckhead3_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_263
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr60_d_neckhead.dds'
				material = gtr62_neckhead3_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_264
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr62_neckhead3_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr62_neckhead3_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr62_neckhead3_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr62_neckhead3_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr62_neckhead3_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr62_neckhead3_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr62_neckhead3_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr62_neckhead3_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr62_neckhead3_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr62_neckhead3_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr62_neckhead3_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_265
			}
		]
	}
	{
		desc_id = gtr62_neckhead_04
		frontend_desc = qs(0x6de4a5a9)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR62_Neckhead_04.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr62_neckhead_04_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr62_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_256
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr62_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_257
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr62_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr62_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_D_01.dds'
				material = gtr62_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_D_01.dds'
				material = gtr62_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_D_01.dds'
				material = gtr62_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_D_01.dds'
				material = gtr62_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_D_01.dds'
				material = gtr62_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_D_01.dds'
				material = gtr62_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_D_01.dds'
				material = gtr62_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_D_01.dds'
				material = gtr62_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_D_01.dds'
				material = gtr62_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_258
			}
		]
	}
	{
		desc_id = gtr62_neckhead_05
		frontend_desc = qs(0xb104e40c)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR62_Neckhead_05.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr62_neckhead_05_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr62_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_259
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr62_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_260
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr62_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr62_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr62_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr62_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr62_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr62_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr62_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr62_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr62_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr62_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr62_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_258
			}
		]
	}
	{
		desc_id = gtr62_neckhead_06
		frontend_desc = qs(0x947b1639)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR62_Neckhead_06.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr62_neckhead_06_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr62_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_261
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr62_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_262
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr62_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr62_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr62_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr62_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr62_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr62_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr62_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr62_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr62_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr62_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr62_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_258
			}
		]
	}
	{
		desc_id = gtr63_neckhead
		frontend_desc = qs(0xaa5593a3)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR63_Neckhead.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr63_neckhead_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr63_neckhead_d.dds'
				material = gtr63_neckhead_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $gtr63_neckhead
			}
		]
	}
	{
		desc_id = gtr63_neckhead2
		frontend_desc = qs(0xab224c92)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR63_Neckhead2.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr63_neckhead2_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr60_d_neckhead.dds'
				material = gtr63_neckhead2_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_263
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr60_d_neckhead.dds'
				material = gtr63_neckhead2_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_264
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr63_neckhead2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr63_neckhead2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_D_neckhead.dds'
				material = gtr63_neckhead2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_D_neckhead.dds'
				material = gtr63_neckhead2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_D_neckhead.dds'
				material = gtr63_neckhead2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_D_neckhead.dds'
				material = gtr63_neckhead2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_D_neckhead.dds'
				material = gtr63_neckhead2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_D_neckhead.dds'
				material = gtr63_neckhead2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_D_neckhead.dds'
				material = gtr63_neckhead2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_D_neckhead.dds'
				material = gtr63_neckhead2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_D_neckhead.dds'
				material = gtr63_neckhead2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_265
			}
		]
	}
	{
		desc_id = gtr63_neckhead3
		frontend_desc = qs(0x5782ad70)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR63_Neckhead3.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr63_neckhead3_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr64_neckhead_d.dds'
				material = gtr63_neckhead3_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_266
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr64_neckhead_d.dds'
				material = gtr63_neckhead3_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_267
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_d.dds'
				material = gtr63_neckhead3_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_d.dds'
				material = gtr63_neckhead3_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_D.dds'
				material = gtr63_neckhead3_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_D.dds'
				material = gtr63_neckhead3_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_D.dds'
				material = gtr63_neckhead3_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_D.dds'
				material = gtr63_neckhead3_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_D.dds'
				material = gtr63_neckhead3_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_D.dds'
				material = gtr63_neckhead3_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_D.dds'
				material = gtr63_neckhead3_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_D.dds'
				material = gtr63_neckhead3_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_D.dds'
				material = gtr63_neckhead3_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_268
			}
		]
	}
	{
		desc_id = gtr63_neckhead_04
		frontend_desc = qs(0x6de4a5a9)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR63_Neckhead_04.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr63_neckhead_04_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr63_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_256
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr63_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_257
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr63_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr63_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_D_01.dds'
				material = gtr63_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_D_01.dds'
				material = gtr63_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_D_01.dds'
				material = gtr63_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_D_01.dds'
				material = gtr63_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_D_01.dds'
				material = gtr63_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_D_01.dds'
				material = gtr63_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_D_01.dds'
				material = gtr63_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_D_01.dds'
				material = gtr63_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_D_01.dds'
				material = gtr63_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_258
			}
		]
	}
	{
		desc_id = gtr63_neckhead_05
		frontend_desc = qs(0xb104e40c)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR63_Neckhead_05.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr63_neckhead_05_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr63_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_259
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr63_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_260
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr63_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr63_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_D_01.dds'
				material = gtr63_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_D_01.dds'
				material = gtr63_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_D_01.dds'
				material = gtr63_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_D_01.dds'
				material = gtr63_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_D_01.dds'
				material = gtr63_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_D_01.dds'
				material = gtr63_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_D_01.dds'
				material = gtr63_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_D_01.dds'
				material = gtr63_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_D_01.dds'
				material = gtr63_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_258
			}
		]
	}
	{
		desc_id = gtr63_neckhead_06
		frontend_desc = qs(0x947b1639)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR63_Neckhead_06.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr63_neckhead_06_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr63_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_261
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr63_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_262
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr63_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr63_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr63_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr63_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr63_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr63_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr63_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr63_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr63_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr63_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr63_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_258
			}
		]
	}
	{
		desc_id = gtr63b_neckhead
		frontend_desc = qs(0x2fa28767)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR63b_Neckhead.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr63b_neckhead_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr63b_neckhead_d.dds'
				material = gtr63b_neckhead_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $gtr63b_neckhead
			}
		]
	}
	{
		desc_id = gtr63c_neckhead
		frontend_desc = qs(0x15fcc697)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR63c_Neckhead.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr63c_neckhead_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr63c_neckhead_d.dds'
				material = gtr63c_neckhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_305
			}
		]
	}
	{
		desc_id = gtr63d_neckhead
		frontend_desc = qs(0xd69185bf)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR63d_Neckhead.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr63d_neckhead_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr63d_neckhead_d.dds'
				material = gtr63d_neckhead_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $gtr63d_neckhead
			}
		]
	}
	{
		desc_id = gtr63e_neckhead
		frontend_desc = qs(0xd8946563)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR63e_Neckhead.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr63e_neckhead_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr63e_neckhead_d.dds'
				material = gtr63e_neckhead_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $gtr63e_neckhead
			}
		]
	}
	{
		desc_id = gtr63f_neckhead
		frontend_desc = qs(0x69d1d04e)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR63f_Neckhead.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr63f_neckhead_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr63f_neckhead_d.dds'
				material = gtr63f_neckhead_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $gtr63f_neckhead
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr63f_neckhead_d.dds'
				material = gtr63f_neckhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_296
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr63f_neckhead_d.dds'
				material = gtr63f_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr63f_neckhead_d.dds'
				material = gtr63f_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr63f_neckhead_D.dds'
				material = gtr63f_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr63f_neckhead_D.dds'
				material = gtr63f_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr63f_neckhead_D.dds'
				material = gtr63f_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr63f_neckhead_D.dds'
				material = gtr63f_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr63f_neckhead_D.dds'
				material = gtr63f_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr63f_neckhead_D.dds'
				material = gtr63f_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr63f_neckhead_D.dds'
				material = gtr63f_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr63f_neckhead_D.dds'
				material = gtr63f_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr63f_neckhead_D.dds'
				material = gtr63f_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_273
			}
		]
	}
	{
		desc_id = gtr63g_neckhead
		frontend_desc = qs(0x85d7ebcc)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR63g_Neckhead.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr63g_neckhead_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr63g_neckhead_d.dds'
				material = gtr63g_neckhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_305
			}
		]
	}
	{
		desc_id = gtr64_neckhead
		frontend_desc = qs(0x5782ad70)
		mesh = 'models/CAR_Instruments/Guitar/ESP/gtr64_neckhead.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr64_neckhead_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr64_neckhead_d.dds'
				material = gtr64_neckhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_266
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr64_neckhead_d.dds'
				material = gtr64_neckhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_267
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_d.dds'
				material = gtr64_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_d.dds'
				material = gtr64_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_D.dds'
				material = gtr64_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_D.dds'
				material = gtr64_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_D.dds'
				material = gtr64_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_D.dds'
				material = gtr64_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_D.dds'
				material = gtr64_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_D.dds'
				material = gtr64_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_D.dds'
				material = gtr64_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_D.dds'
				material = gtr64_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_268
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_D.dds'
				material = gtr64_neckhead_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_268
			}
		]
	}
	{
		desc_id = gtr64_neckhead2
		frontend_desc = qs(0xab224c92)
		mesh = 'models/CAR_Instruments/Guitar/ESP/gtr64_neckhead2.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr64_neckhead2_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr60_d_neckhead.dds'
				material = gtr64_neckhead2_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_263
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr60_d_neckhead.dds'
				material = gtr64_neckhead2_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_264
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr64_neckhead2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr64_neckhead2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr64_neckhead2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr64_neckhead2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr64_neckhead2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr64_neckhead2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr64_neckhead2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr64_neckhead2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr64_neckhead2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr64_neckhead2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_265
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead.dds'
				material = gtr64_neckhead2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_265
			}
		]
	}
	{
		desc_id = gtr64_neckhead3
		frontend_desc = qs(0x69d1d04e)
		mesh = 'models/CAR_Instruments/Guitar/ESP/gtr64_neckhead3.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr64_neckhead3_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr62_d_neckhead.dds'
				material = gtr64_neckhead3_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_295
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr62_d_neckhead.dds'
				material = gtr64_neckhead3_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_296
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr62_d_neckhead.dds'
				material = gtr64_neckhead3_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr62_d_neckhead.dds'
				material = gtr64_neckhead3_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr62_d_neckhead.dds'
				material = gtr64_neckhead3_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr62_d_neckhead.dds'
				material = gtr64_neckhead3_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr62_d_neckhead.dds'
				material = gtr64_neckhead3_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr62_d_neckhead.dds'
				material = gtr64_neckhead3_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr62_d_neckhead.dds'
				material = gtr64_neckhead3_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr62_d_neckhead.dds'
				material = gtr64_neckhead3_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr62_d_neckhead.dds'
				material = gtr64_neckhead3_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr62_d_neckhead.dds'
				material = gtr64_neckhead3_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_273
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr62_d_neckhead.dds'
				material = gtr64_neckhead3_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_273
			}
		]
	}
	{
		desc_id = gtr64_neckhead_04
		frontend_desc = qs(0x6de4a5a9)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR64_Neckhead_04.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr64_neckhead_04_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr64_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_256
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr64_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_257
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr64_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01.dds'
				material = gtr64_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_D_01.dds'
				material = gtr64_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_D_01.dds'
				material = gtr64_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_D_01.dds'
				material = gtr64_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_D_01.dds'
				material = gtr64_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_D_01.dds'
				material = gtr64_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_D_01.dds'
				material = gtr64_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_D_01.dds'
				material = gtr64_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_D_01.dds'
				material = gtr64_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_D_01.dds'
				material = gtr64_neckhead_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_258
			}
		]
	}
	{
		desc_id = gtr64_neckhead_05
		frontend_desc = qs(0xb104e40c)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR64_Neckhead_05.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr64_neckhead_05_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr64_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_259
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr64_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_260
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr64_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01.dds'
				material = gtr64_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_D_01.dds'
				material = gtr64_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_D_01.dds'
				material = gtr64_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_D_01.dds'
				material = gtr64_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_D_01.dds'
				material = gtr64_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_D_01.dds'
				material = gtr64_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_D_01.dds'
				material = gtr64_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_D_01.dds'
				material = gtr64_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_D_01.dds'
				material = gtr64_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_D_01.dds'
				material = gtr64_neckhead_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_258
			}
		]
	}
	{
		desc_id = gtr64_neckhead_06
		frontend_desc = qs(0x947b1639)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR64_Neckhead_06.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr64_neckhead_06_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr64_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_261
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr64_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_262
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr64_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr64_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr64_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr64_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr64_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr64_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr64_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr64_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr64_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr64_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_258
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03.dds'
				material = gtr64_neckhead_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_258
			}
		]
	}
	{
		desc_id = gtr33_neckhead
		frontend_desc = qs(0x98fa9ce7)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR33_Neckhead.skin'
		pak_num = 0
		is_esp = 1
		is_metallica = 1
		materials = [
			gtr33_neckhead_primary
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr_33nek_kh2_d.dds'
				material = gtr33_neckhead_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_309
			}
		]
	}
	{
		desc_id = gtr33_nekhed
		frontend_desc = qs(0xe2cd2608)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR33_NekHed_MUM.skin'
		pak_num = 1
		is_metallica = 1
		materials = [
			gtr33_nhead_mum_primary
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/ESP/gtr33_nekhed_mum_d.dds'
				material = gtr33_nhead_mum_primary
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_309
			}
		]
	}
	{
		desc_id = gtr65_neckhead
		frontend_desc = qs(0x5421d4ed)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR65_Neckhead.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr65_neckhead_hardware
		]
	}
	{
		desc_id = gtr65b_neckhead
		frontend_desc = qs(0xc18828c2)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR65b_Neckhead.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr65b_neckhead_hardware
		]
	}
	{
		desc_id = gtr66_neckhead
		frontend_desc = qs(0xa956861e)
		mesh = 'models/CAR_Instruments/Guitar/ESP/GTR66_Neckhead.skin'
		pak_num = 0
		is_esp = 1
		materials = [
			gtr66_neckhead_hardware
		]
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
				$car_rocker_guitars_factoredglobal_254
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock01_D_01.dds'
				material = guitar_head_headstock
				$car_rocker_guitars_factoredglobal_0
				$car_rocker_guitars_factoredglobal_255
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock01_D_01.dds'
				material = guitar_head_headstock
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_310
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock01_D_01.dds'
				material = guitar_head_headstock
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_310
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock01_D_01.dds'
				material = guitar_head_headstock
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_310
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock01_D_01.dds'
				material = guitar_head_headstock
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_310
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock01_D_01.dds'
				material = guitar_head_headstock
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_310
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock01_D_01.dds'
				material = guitar_head_headstock
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_310
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock01_D_01.dds'
				material = guitar_head_headstock
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_310
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock01_D_01.dds'
				material = guitar_head_headstock
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_310
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock01_D_01.dds'
				material = guitar_head_headstock
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_310
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock01_D_01.dds'
				material = guitar_head_headstock
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_310
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock01_D_01.dds'
				material = guitar_head_headstock
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_310
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
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock02_D_01.dds'
				material = headstock2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock02_D_01.dds'
				material = headstock2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock02_D_01.dds'
				material = headstock2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock02_D_01.dds'
				material = headstock2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock02_D_01.dds'
				material = headstock2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock02_D_01.dds'
				material = headstock2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock02_D_01.dds'
				material = headstock2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock02_D_01.dds'
				material = headstock2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock02_D_01.dds'
				material = headstock2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock02_D_01.dds'
				material = headstock2_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_313
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
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock03_D_01.dds'
				material = guitar_head_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock03_D_01.dds'
				material = guitar_head_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock03_D_01.dds'
				material = guitar_head_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock03_D_01.dds'
				material = guitar_head_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock03_D_01.dds'
				material = guitar_head_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock03_D_01.dds'
				material = guitar_head_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock03_D_01.dds'
				material = guitar_head_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock03_D_01.dds'
				material = guitar_head_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock03_D_01.dds'
				material = guitar_head_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock03_D_01.dds'
				material = guitar_head_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_313
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
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock04_D_01.dds'
				material = guitar_head_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock04_D_01.dds'
				material = guitar_head_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock04_d_01.dds'
				material = guitar_head_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock04_d_01.dds'
				material = guitar_head_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock04_d_01.dds'
				material = guitar_head_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock04_d_01.dds'
				material = guitar_head_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock04_d_01.dds'
				material = guitar_head_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock04_d_01.dds'
				material = guitar_head_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock04_d_01.dds'
				material = guitar_head_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock04_d_01.dds'
				material = guitar_head_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock04_d_01.dds'
				material = guitar_head_04_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_313
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
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock05_D_01.dds'
				material = guitar_head_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock05_D_01.dds'
				material = guitar_head_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock05_d_01.dds'
				material = guitar_head_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock05_d_01.dds'
				material = guitar_head_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock05_d_01.dds'
				material = guitar_head_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock05_d_01.dds'
				material = guitar_head_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock05_d_01.dds'
				material = guitar_head_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock05_d_01.dds'
				material = guitar_head_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock05_d_01.dds'
				material = guitar_head_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock05_d_01.dds'
				material = guitar_head_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock05_d_01.dds'
				material = guitar_head_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_313
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
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock06_D_01.dds'
				material = guitar_head_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock06_D_01.dds'
				material = guitar_head_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock06_d_01.dds'
				material = guitar_head_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock06_d_01.dds'
				material = guitar_head_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock06_d_01.dds'
				material = guitar_head_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock06_d_01.dds'
				material = guitar_head_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock06_d_01.dds'
				material = guitar_head_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock06_d_01.dds'
				material = guitar_head_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock06_d_01.dds'
				material = guitar_head_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock06_d_01.dds'
				material = guitar_head_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock06_d_01.dds'
				material = guitar_head_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_313
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
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock07_D_01.dds'
				material = guitar_head_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock07_D_01.dds'
				material = guitar_head_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock07_D_01.dds'
				material = guitar_head_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock07_D_01.dds'
				material = guitar_head_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock07_D_01.dds'
				material = guitar_head_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock07_D_01.dds'
				material = guitar_head_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock07_D_01.dds'
				material = guitar_head_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock07_D_01.dds'
				material = guitar_head_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock07_D_01.dds'
				material = guitar_head_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock07_D_01.dds'
				material = guitar_head_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_313
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
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock08_D_01.dds'
				material = guitar_head_08_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock08_D_01.dds'
				material = guitar_head_08_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock08_D_01.dds'
				material = guitar_head_08_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock08_D_01.dds'
				material = guitar_head_08_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock08_D_01.dds'
				material = guitar_head_08_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock08_D_01.dds'
				material = guitar_head_08_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock08_D_01.dds'
				material = guitar_head_08_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock08_D_01.dds'
				material = guitar_head_08_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock08_D_01.dds'
				material = guitar_head_08_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock08_D_01.dds'
				material = guitar_head_08_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_313
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
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock09_D_01.dds'
				material = guitar_head_09_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock09_D_01.dds'
				material = guitar_head_09_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock09_D_01.dds'
				material = guitar_head_09_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock09_D_01.dds'
				material = guitar_head_09_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock09_D_01.dds'
				material = guitar_head_09_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock09_D_01.dds'
				material = guitar_head_09_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock09_D_01.dds'
				material = guitar_head_09_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock09_D_01.dds'
				material = guitar_head_09_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock09_D_01.dds'
				material = guitar_head_09_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock09_D_01.dds'
				material = guitar_head_09_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_313
			}
		]
	}
	{
		desc_id = guitar_head10
		frontend_desc = qs(0xbff82938)
		mesh = 'models/CAR_Instruments/Guitar/Guitar_Head10.skin'
		materials = [
			guitar_head_10_hardware
		]
		sections = [
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock10_d_01.dds'
				material = guitar_head_10_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x6e23fd31)
				mask = $cag_headstk_10
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock10_D_01.dds'
				material = guitar_head_10_primary
				$car_rocker_guitars_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x7f5a5c11)
				mask = $cag_headstk_10_details
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock10_D_01.dds'
				material = guitar_head_10_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock10_D_01.dds'
				material = guitar_head_10_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock10_D_01.dds'
				material = guitar_head_10_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock10_D_01.dds'
				material = guitar_head_10_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock10_D_01.dds'
				material = guitar_head_10_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock10_D_01.dds'
				material = guitar_head_10_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock10_D_01.dds'
				material = guitar_head_10_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock10_D_01.dds'
				material = guitar_head_10_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock10_D_01.dds'
				material = guitar_head_10_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock10_D_01.dds'
				material = guitar_head_10_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock10_D_01.dds'
				material = guitar_head_10_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_313
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
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock11_D_01.dds'
				material = guitar_head_11_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock11_D_01.dds'
				material = guitar_head_11_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock11_d_01.dds'
				material = guitar_head_11_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock11_d_01.dds'
				material = guitar_head_11_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock11_d_01.dds'
				material = guitar_head_11_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock11_d_01.dds'
				material = guitar_head_11_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock11_d_01.dds'
				material = guitar_head_11_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock11_d_01.dds'
				material = guitar_head_11_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock11_d_01.dds'
				material = guitar_head_11_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock11_d_01.dds'
				material = guitar_head_11_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock11_d_01.dds'
				material = guitar_head_11_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_313
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
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock12_D_01.dds'
				material = guitar_head_12_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock12_D_01.dds'
				material = guitar_head_12_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock12_d_01.dds'
				material = guitar_head_12_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock12_d_01.dds'
				material = guitar_head_12_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock12_d_01.dds'
				material = guitar_head_12_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock12_d_01.dds'
				material = guitar_head_12_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock12_d_01.dds'
				material = guitar_head_12_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock12_d_01.dds'
				material = guitar_head_12_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock12_d_01.dds'
				material = guitar_head_12_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock12_d_01.dds'
				material = guitar_head_12_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock12_d_01.dds'
				material = guitar_head_12_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_313
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
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock13_D_01.dds'
				material = guitar_head_13_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock13_D_01.dds'
				material = guitar_head_13_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock13_D_01.dds'
				material = guitar_head_13_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock13_D_01.dds'
				material = guitar_head_13_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock13_D_01.dds'
				material = guitar_head_13_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock13_D_01.dds'
				material = guitar_head_13_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock13_D_01.dds'
				material = guitar_head_13_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock13_D_01.dds'
				material = guitar_head_13_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock13_D_01.dds'
				material = guitar_head_13_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock13_D_01.dds'
				material = guitar_head_13_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_313
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
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock14_D_01.dds'
				material = guitar_head_14_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock14_D_01.dds'
				material = guitar_head_14_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock14_D_01.dds'
				material = guitar_head_14_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock14_D_01.dds'
				material = guitar_head_14_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock14_D_01.dds'
				material = guitar_head_14_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock14_D_01.dds'
				material = guitar_head_14_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock14_D_01.dds'
				material = guitar_head_14_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock14_D_01.dds'
				material = guitar_head_14_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock14_D_01.dds'
				material = guitar_head_14_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock14_D_01.dds'
				material = guitar_head_14_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_313
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
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock15_D_01.dds'
				material = guitar_head_15_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock15_D_01.dds'
				material = guitar_head_15_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock15_D_01.dds'
				material = guitar_head_15_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock15_D_01.dds'
				material = guitar_head_15_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock15_D_01.dds'
				material = guitar_head_15_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock15_D_01.dds'
				material = guitar_head_15_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock15_D_01.dds'
				material = guitar_head_15_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock15_D_01.dds'
				material = guitar_head_15_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock15_D_01.dds'
				material = guitar_head_15_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock15_D_01.dds'
				material = guitar_head_15_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_313
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
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_hstock01_d_mls.dds'
				material = guitar_head_16_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_hstock01_d_mls.dds'
				material = guitar_head_16_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_hstock01_d_mls.dds'
				material = guitar_head_16_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_hstock01_d_mls.dds'
				material = guitar_head_16_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_hstock01_d_mls.dds'
				material = guitar_head_16_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_hstock01_d_mls.dds'
				material = guitar_head_16_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_hstock01_d_mls.dds'
				material = guitar_head_16_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_hstock01_d_mls.dds'
				material = guitar_head_16_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_hstock01_d_mls.dds'
				material = guitar_head_16_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_predikt_hstock01_d_mls.dds'
				material = guitar_head_16_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_313
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
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock20_D_01.dds'
				material = guitar_head_20_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/GTR_Headtock20_D_01.dds'
				material = guitar_head_20_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock20_d_01.dds'
				material = guitar_head_20_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock20_d_01.dds'
				material = guitar_head_20_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock20_d_01.dds'
				material = guitar_head_20_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock20_d_01.dds'
				material = guitar_head_20_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock20_d_01.dds'
				material = guitar_head_20_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock20_d_01.dds'
				material = guitar_head_20_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock20_d_01.dds'
				material = guitar_head_20_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock20_d_01.dds'
				material = guitar_head_20_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock20_d_01.dds'
				material = guitar_head_20_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_313
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
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock_d_31.dds'
				material = guitar_head_31_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock_d_31.dds'
				material = guitar_head_31_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock_d_31.dds'
				material = guitar_head_31_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock_d_31.dds'
				material = guitar_head_31_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock_d_31.dds'
				material = guitar_head_31_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock_d_31.dds'
				material = guitar_head_31_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock_d_31.dds'
				material = guitar_head_31_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock_d_31.dds'
				material = guitar_head_31_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock_d_31.dds'
				material = guitar_head_31_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock_d_31.dds'
				material = guitar_head_31_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_313
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
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock099.dds'
				material = guitar_head_99_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock099.dds'
				material = guitar_head_99_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock099.dds'
				material = guitar_head_99_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock099.dds'
				material = guitar_head_99_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock099.dds'
				material = guitar_head_99_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock099.dds'
				material = guitar_head_99_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock099.dds'
				material = guitar_head_99_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock099.dds'
				material = guitar_head_99_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock099.dds'
				material = guitar_head_99_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_headtock099.dds'
				material = guitar_head_99_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_313
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
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_01.dds'
				material = headstock_x_hand_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_01.dds'
				material = headstock_x_hand_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_01.dds'
				material = headstock_x_hand_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_01.dds'
				material = headstock_x_hand_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_01.dds'
				material = headstock_x_hand_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_01.dds'
				material = headstock_x_hand_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_01.dds'
				material = headstock_x_hand_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_01.dds'
				material = headstock_x_hand_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_01.dds'
				material = headstock_x_hand_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_01.dds'
				material = headstock_x_hand_01_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_313
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
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock2_d_01.dds'
				material = headstock_x_arrow_02_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock2_d_01.dds'
				material = headstock_x_arrow_02_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock2_d_01.dds'
				material = headstock_x_arrow_02_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock2_d_01.dds'
				material = headstock_x_arrow_02_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock2_d_01.dds'
				material = headstock_x_arrow_02_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock2_d_01.dds'
				material = headstock_x_arrow_02_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock2_d_01.dds'
				material = headstock_x_arrow_02_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock2_d_01.dds'
				material = headstock_x_arrow_02_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock2_d_01.dds'
				material = headstock_x_arrow_02_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock2_d_01.dds'
				material = headstock_x_arrow_02_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_313
			}
		]
	}
	{
		desc_id = guitar_head_x_03
		frontend_desc = qs(0x37cd98fc)
		mesh = 'models/CAR_Instruments/Guitar/Headstock_X_bomb_03.skin'
		price = 1000
		polaroid = guitar_rewards_head_bomb
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
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_03.dds'
				material = headstock_x_bomb_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_03.dds'
				material = headstock_x_bomb_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_03.dds'
				material = headstock_x_bomb_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_03.dds'
				material = headstock_x_bomb_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_03.dds'
				material = headstock_x_bomb_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_03.dds'
				material = headstock_x_bomb_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_03.dds'
				material = headstock_x_bomb_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_03.dds'
				material = headstock_x_bomb_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_03.dds'
				material = headstock_x_bomb_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_03.dds'
				material = headstock_x_bomb_03_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_313
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
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_356
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_05.dds'
				material = headstock_x_handle_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_356
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_05.dds'
				material = headstock_x_handle_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_356
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_05.dds'
				material = headstock_x_handle_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_356
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_05.dds'
				material = headstock_x_handle_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_356
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_05.dds'
				material = headstock_x_handle_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_356
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_05.dds'
				material = headstock_x_handle_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_356
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_05.dds'
				material = headstock_x_handle_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_356
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_05.dds'
				material = headstock_x_handle_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_356
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_05.dds'
				material = headstock_x_handle_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_356
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_05.dds'
				material = headstock_x_handle_05_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_356
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
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_06.dds'
				material = headstock_x_feather_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_06.dds'
				material = headstock_x_feather_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_06.dds'
				material = headstock_x_feather_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_06.dds'
				material = headstock_x_feather_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_06.dds'
				material = headstock_x_feather_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_06.dds'
				material = headstock_x_feather_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_06.dds'
				material = headstock_x_feather_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_06.dds'
				material = headstock_x_feather_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_06.dds'
				material = headstock_x_feather_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_06.dds'
				material = headstock_x_feather_06_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_313
			}
		]
	}
	{
		desc_id = headstock_x_cents_07
		frontend_desc = qs(0xa3e5da1e)
		mesh = 'models/CAR_Instruments/Guitar/Headstock_X_Cents_07.skin'
		price = 500
		polaroid = guitar_rewards_head_cents
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
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_07.dds'
				material = headstock_x_cents_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_07.dds'
				material = headstock_x_cents_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_07.dds'
				material = headstock_x_cents_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_07.dds'
				material = headstock_x_cents_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_07.dds'
				material = headstock_x_cents_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_07.dds'
				material = headstock_x_cents_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_07.dds'
				material = headstock_x_cents_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_07.dds'
				material = headstock_x_cents_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_07.dds'
				material = headstock_x_cents_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_07.dds'
				material = headstock_x_cents_07_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_313
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
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_08.dds'
				material = headstock_x_flame_08_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_08.dds'
				material = headstock_x_flame_08_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_08.dds'
				material = headstock_x_flame_08_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_08.dds'
				material = headstock_x_flame_08_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_08.dds'
				material = headstock_x_flame_08_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_08.dds'
				material = headstock_x_flame_08_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_08.dds'
				material = headstock_x_flame_08_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_08.dds'
				material = headstock_x_flame_08_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_08.dds'
				material = headstock_x_flame_08_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_08.dds'
				material = headstock_x_flame_08_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_313
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
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_5
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_10.dds'
				material = headstock_x_tip_10_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_7
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_10.dds'
				material = headstock_x_tip_10_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_8
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_10.dds'
				material = headstock_x_tip_10_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_9
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_10.dds'
				material = headstock_x_tip_10_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_10
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_10.dds'
				material = headstock_x_tip_10_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_11
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_10.dds'
				material = headstock_x_tip_10_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_12
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_10.dds'
				material = headstock_x_tip_10_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_13
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_10.dds'
				material = headstock_x_tip_10_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_14
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_10.dds'
				material = headstock_x_tip_10_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_15
				$car_rocker_guitars_factoredglobal_313
			}
			{
				base_tex = 'tex/models/Car_Instruments/Guitars/gtr_x_headstock_d_10.dds'
				material = headstock_x_tip_10_primary
				$car_rocker_guitars_factoredglobal_4
				$car_rocker_guitars_factoredglobal_16
				$car_rocker_guitars_factoredglobal_313
			}
		]
	}
]
car_rocker_guitars_factoredglobal_0 = {
	diffuse
	pre_userlayer
}
car_rocker_guitars_factoredglobal_1 = {
	desc_id = finishes
	frontend_desc = qs(0x3f47b13d)
	mask = $cag_guitar02_body
}
car_rocker_guitars_factoredglobal_4 = {
	userlayer
	diffuse
}
car_rocker_guitars_factoredglobal_5 = {
	desc_id = car_metallica
	frontend_desc = qs(0xa2a4f973)
	mask = $car_metallica
}
car_rocker_guitars_factoredglobal_6 = {
	initial_values = {
		x_trans = -24
		x_scale = 30
		y_scale = 60
		y_trans = 25
	}
}
car_rocker_guitars_factoredglobal_7 = {
	desc_id = car_bands
	frontend_desc = qs(0xd3bf2886)
	mask = $car_bands
}
car_rocker_guitars_factoredglobal_8 = {
	desc_id = car_primitives
	frontend_desc = qs(0x7dc468d3)
	mask = $car_basic_primitives_1
}
car_rocker_guitars_factoredglobal_9 = {
	desc_id = car_outlines_primitives
	frontend_desc = qs(0x955f1285)
	mask = $car_basic_primitives_2
}
car_rocker_guitars_factoredglobal_10 = {
	desc_id = car_tattoo_decal
	frontend_desc = qs(0x80142024)
	mask = $car_gradiant_shapes
}
car_rocker_guitars_factoredglobal_11 = {
	desc_id = car_icon_decals
	frontend_desc = qs(0xcd9be7cd)
	mask = $car_icons
}
car_rocker_guitars_factoredglobal_12 = {
	desc_id = car_graphics
	frontend_desc = qs(0xde6cb37a)
	mask = $car_graphics
}
car_rocker_guitars_factoredglobal_13 = {
	desc_id = car_sponsors
	frontend_desc = qs(0xc26f9911)
	mask = $car_sponsors
}
car_rocker_guitars_factoredglobal_14 = {
	desc_id = `font	a1`
	frontend_desc = qs(0x272e6e53)
	mask = $car_fontgrid_title_a1
}
car_rocker_guitars_factoredglobal_15 = {
	desc_id = `font	a6`
	frontend_desc = qs(0x0c033d90)
	mask = $car_fontgrid_text_a6
}
car_rocker_guitars_factoredglobal_16 = {
	desc_id = `font	a8`
	frontend_desc = qs(0x15180cd1)
	mask = $car_fontgrid_text_a8
}
car_rocker_guitars_factoredglobal_17 = {
	locked
}
car_rocker_guitars_factoredglobal_20 = {
	initial_values = {
		x_trans = -14
		x_scale = 30
		y_scale = 60
		y_trans = 0
	}
}
car_rocker_guitars_factoredglobal_23 = {
	initial_values = {
		x_trans = -8
		x_scale = 30
		y_scale = 60
		y_trans = 0
	}
}
car_rocker_guitars_factoredglobal_26 = {
	initial_values = {
		x_trans = -24
		x_scale = 30
		y_scale = 60
		y_trans = 15
	}
}
car_rocker_guitars_factoredglobal_29 = {
	initial_values = {
		x_trans = -35
		x_scale = 30
		y_scale = 60
		y_trans = 0
	}
}
car_rocker_guitars_factoredglobal_33 = {
	desc_id = finishes
	frontend_desc = qs(0x3f47b13d)
	mask = $cag_gtr33
}
car_rocker_guitars_factoredglobal_35 = {
	desc_id = finishes
	frontend_desc = qs(0x3f47b13d)
	mask = $cag_guitar33d_body
}
car_rocker_guitars_factoredglobal_36 = {
	exclusive
	locked
}
car_rocker_guitars_factoredglobal_40 = {
	initial_values = {
		x_trans = -6
		x_scale = 30
		y_scale = 60
		y_trans = 0
	}
}
car_rocker_guitars_factoredglobal_43 = {
	initial_values = {
		x_trans = -24
		x_scale = 30
		y_scale = 60
		y_trans = 0
	}
}
car_rocker_guitars_factoredglobal_57 = {
	desc_id = finishes
	frontend_desc = qs(0x3f47b13d)
	mask = $gtr63c_esp_ex
}
car_rocker_guitars_factoredglobal_64 = {
	desc_id = finishes
	frontend_desc = qs(0x3f47b13d)
}
car_rocker_guitars_factoredglobal_67 = {
	initial_values = {
		x_trans = -26
		x_scale = 29
		y_scale = 60
		y_trans = 21
	}
}
car_rocker_guitars_factoredglobal_68 = {
	initial_values = {
		x_trans = -26
		y_trans = 29
		y_scale = 60
		x_scale = 30
	}
}
car_rocker_guitars_factoredglobal_72 = {
	initial_values = {
		y_trans = 25
		x_scale = 30
		y_scale = 60
		x_trans = -20
	}
}
car_rocker_guitars_factoredglobal_75 = {
	initial_values = {
		x_trans = -32
		x_scale = 30
		y_scale = 60
		y_trans = 20
	}
}
car_rocker_guitars_factoredglobal_83 = {
	initial_values = {
		x_trans = -28
		x_scale = 30
		y_scale = 60
		y_trans = 21
	}
}
car_rocker_guitars_factoredglobal_86 = {
	initial_values = {
		y_trans = 21
		x_scale = 30
		y_scale = 60
		x_trans = -22
	}
}
car_rocker_guitars_factoredglobal_91 = {
	initial_values = {
		y_trans = 21
		x_scale = 21
		y_scale = 45
		x_trans = -30
	}
}
car_rocker_guitars_factoredglobal_94 = {
	initial_values = {
		x_trans = -34
		x_scale = 30
		y_scale = 60
		y_trans = 11
	}
}
car_rocker_guitars_factoredglobal_103 = {
	initial_values = {
		x_trans = -10
		x_scale = 21
		y_scale = 45
		y_trans = 3
	}
}
car_rocker_guitars_factoredglobal_106 = {
	initial_values = {
		x_trans = -20
		x_scale = 21
		y_scale = 45
		y_trans = 3
	}
}
car_rocker_guitars_factoredglobal_111 = {
	initial_values = {
		y_trans = 4
		x_scale = 16
		y_scale = 45
		x_trans = -12
	}
}
car_rocker_guitars_factoredglobal_112 = {
	desc_id = finishes
	frontend_desc = qs(0x3f47b13d)
	mask = $cag_x_guitar_clear
}
car_rocker_guitars_factoredglobal_115 = {
	initial_values = {
		x_trans = -17
		y_trans = 22
		x_scale = 31
		y_scale = 55
	}
}
car_rocker_guitars_factoredglobal_120 = {
	initial_values = {
		y_trans = 9
		x_scale = 16
		y_scale = 35
		x_trans = -30
	}
}
car_rocker_guitars_factoredglobal_123 = {
	initial_values = {
		x_trans = -13
		y_trans = 1
		x_scale = 16
		y_scale = 30
	}
}
car_rocker_guitars_factoredglobal_126 = {
	initial_values = {
		y_trans = 29
		x_scale = 16
		y_scale = 30
		x_trans = -14
	}
}
car_rocker_guitars_factoredglobal_129 = {
	initial_values = {
		x_trans = -12
		x_scale = 16
		y_scale = 30
		y_trans = -1
	}
}
car_rocker_guitars_factoredglobal_132 = {
	initial_values = {
		x_trans = -28
		y_trans = 25
		x_scale = 26
		y_scale = 40
	}
}
car_rocker_guitars_factoredglobal_135 = {
	initial_values = {
		y_trans = 2
		x_scale = 15
		y_scale = 30
		flags = 3
		x_trans = -39
	}
}
car_rocker_guitars_factoredglobal_138 = {
	initial_values = {
		x_trans = -5
		x_scale = 15
		y_scale = 30
		y_trans = 20
	}
}
car_rocker_guitars_factoredglobal_139 = {
	initial_values = {
		x_trans = -5
		x_scale = 15
		y_scale = 35
		y_trans = 20
	}
}
car_rocker_guitars_factoredglobal_143 = {
	initial_values = {
		x_trans = -23
		x_scale = 15
		y_scale = 35
		y_trans = 31
	}
}
car_rocker_guitars_factoredglobal_146 = {
	initial_values = {
		x_trans = -8
		x_scale = 15
		y_scale = 20
		flags = 3
		y_trans = 26
	}
}
car_rocker_guitars_factoredglobal_216 = {
	desc_id = finishes
	frontend_desc = qs(0x6e23fd31)
	mask = $cag_gtr16_pickgrd01
}
car_rocker_guitars_factoredglobal_241 = {
	desc_id = finishes
	frontend_desc = qs(0xb0072c1a)
	mask = $cag_neck_22a
}
car_rocker_guitars_factoredglobal_242 = {
	initial_values = {
		Color = grey_5
	}
}
car_rocker_guitars_factoredglobal_243 = {
	diffuse
}
car_rocker_guitars_factoredglobal_244 = {
	initial_values = {
		Color = grey_2
	}
}
car_rocker_guitars_factoredglobal_245 = {
	desc_id = finishes
	frontend_desc = qs(0xb0072c1a)
	mask = $cag_neck_24
}
car_rocker_guitars_factoredglobal_247 = {
	desc_id = finishes
	frontend_desc = qs(0xb0072c1a)
	mask = $cag_neck_31
}
car_rocker_guitars_factoredglobal_249 = {
	desc_id = finishes
	frontend_desc = qs(0xb0072c1a)
	mask = $cag_fboard38
}
car_rocker_guitars_factoredglobal_251 = {
	desc_id = finishes
	frontend_desc = qs(0xb0072c1a)
	mask = $cag_neck_01
}
car_rocker_guitars_factoredglobal_252 = {
	initial_values = {
		Color = grey_1
	}
}
car_rocker_guitars_factoredglobal_253 = {
	hidden
}
car_rocker_guitars_factoredglobal_254 = {
	desc_id = finishes
	frontend_desc = qs(0x6e23fd31)
	mask = $cag_headstk_01
}
car_rocker_guitars_factoredglobal_255 = {
	desc_id = details
	frontend_desc = qs(0x7f5a5c11)
	mask = $cag_headstk_01_details
}
car_rocker_guitars_factoredglobal_256 = {
	desc_id = finishes
	frontend_desc = qs(0x6e23fd31)
	mask = $gtr4_neckhead
}
car_rocker_guitars_factoredglobal_257 = {
	desc_id = details
	frontend_desc = qs(0x7f5a5c11)
	mask = $gtr4_neckhead_details
}
car_rocker_guitars_factoredglobal_258 = {
	initial_values = {
		x_trans = -10
		x_scale = 26
		y_scale = 26
		y_trans = -25
	}
}
car_rocker_guitars_factoredglobal_259 = {
	desc_id = finishes
	frontend_desc = qs(0x6e23fd31)
	mask = $gtr9_neckhead
}
car_rocker_guitars_factoredglobal_260 = {
	desc_id = details
	frontend_desc = qs(0x7f5a5c11)
	mask = $gtr9_neckhead_details
}
car_rocker_guitars_factoredglobal_261 = {
	desc_id = finishes
	frontend_desc = qs(0x6e23fd31)
	mask = $gtr4_neckhead_03
}
car_rocker_guitars_factoredglobal_262 = {
	desc_id = details
	frontend_desc = qs(0x7f5a5c11)
	mask = $gtr4_neckhead_03_details
}
car_rocker_guitars_factoredglobal_263 = {
	desc_id = finishes
	frontend_desc = qs(0x6e23fd31)
	mask = $gtr60_neckhead
}
car_rocker_guitars_factoredglobal_264 = {
	desc_id = details
	frontend_desc = qs(0x7f5a5c11)
	mask = $gtr60_neckhead_details
}
car_rocker_guitars_factoredglobal_265 = {
	initial_values = {
		x_trans = -25
		x_scale = 26
		y_scale = 26
		y_trans = -25
	}
}
car_rocker_guitars_factoredglobal_266 = {
	desc_id = finishes
	frontend_desc = qs(0x6e23fd31)
	mask = $gtr64_neckhead
}
car_rocker_guitars_factoredglobal_267 = {
	desc_id = details
	frontend_desc = qs(0x7f5a5c11)
	mask = $gtr64_neckhead_details
}
car_rocker_guitars_factoredglobal_268 = {
	initial_values = {
		x_trans = -25
		x_scale = 26
		y_scale = 26
		y_trans = -20
	}
}
car_rocker_guitars_factoredglobal_269 = {
	desc_id = finishes
	frontend_desc = qs(0x6e23fd31)
	mask = $gtr4_neckhead_06
}
car_rocker_guitars_factoredglobal_270 = {
	desc_id = details
	frontend_desc = qs(0x7f5a5c11)
	mask = $gtr4_neckhead_06_details
}
car_rocker_guitars_factoredglobal_271 = {
	desc_id = finishes
	frontend_desc = qs(0x6e23fd31)
	mask = $gtr4_neckhead_07
}
car_rocker_guitars_factoredglobal_272 = {
	desc_id = details
	frontend_desc = qs(0x7f5a5c11)
	mask = $gtr4_neckhead_07_details
}
car_rocker_guitars_factoredglobal_273 = {
	initial_values = {
		x_trans = -25
		x_scale = 26
		y_scale = 26
		y_trans = -30
	}
}
car_rocker_guitars_factoredglobal_274 = {
	desc_id = finishes
	frontend_desc = qs(0x6e23fd31)
	mask = $gtr30_neckhead
}
car_rocker_guitars_factoredglobal_275 = {
	desc_id = details
	frontend_desc = qs(0x7f5a5c11)
	mask = $gtr30_neckhead_details
}
car_rocker_guitars_factoredglobal_276 = {
	initial_values = {
		x_trans = 0
		x_scale = 40
		y_scale = 20
		y_trans = -10
	}
}
car_rocker_guitars_factoredglobal_277 = {
	desc_id = finishes
	frontend_desc = qs(0x6e23fd31)
	mask = $gtr31_nhead
}
car_rocker_guitars_factoredglobal_278 = {
	desc_id = details
	frontend_desc = qs(0x7f5a5c11)
	mask = $gtr31_nhead_details
}
car_rocker_guitars_factoredglobal_279 = {
	desc_id = finishes
	frontend_desc = qs(0x6e23fd31)
	mask = $gtr36_nekhead
}
car_rocker_guitars_factoredglobal_280 = {
	desc_id = details
	frontend_desc = qs(0x7f5a5c11)
	mask = $gtr36_nekhead_details
}
car_rocker_guitars_factoredglobal_281 = {
	initial_values = {
		x_trans = -10
		x_scale = 26
		y_scale = 26
		y_trans = -30
	}
}
car_rocker_guitars_factoredglobal_282 = {
	desc_id = finishes
	frontend_desc = qs(0x6e23fd31)
	mask = $gtr32_nekhead
}
car_rocker_guitars_factoredglobal_283 = {
	desc_id = details
	frontend_desc = qs(0x7f5a5c11)
	mask = $gtr32_nekhead_details
}
car_rocker_guitars_factoredglobal_284 = {
	desc_id = finishes
	frontend_desc = qs(0x6e23fd31)
	mask = $gtr33_nhead
}
car_rocker_guitars_factoredglobal_285 = {
	desc_id = details
	frontend_desc = qs(0x7f5a5c11)
	mask = $gtr33_nhead_details
}
car_rocker_guitars_factoredglobal_286 = {
	desc_id = finishes
	frontend_desc = qs(0x6e23fd31)
	mask = $gtr37_nhead
}
car_rocker_guitars_factoredglobal_287 = {
	desc_id = details
	frontend_desc = qs(0x7f5a5c11)
	mask = $gtr37_nhead_details
}
car_rocker_guitars_factoredglobal_288 = {
	initial_values = {
		x_trans = -15
		x_scale = 26
		y_scale = 26
		y_trans = -30
	}
}
car_rocker_guitars_factoredglobal_291 = {
	initial_values = {
		x_trans = 0
		x_scale = 26
		y_scale = 26
		y_trans = -10
	}
}
car_rocker_guitars_factoredglobal_292 = {
	initial_values = {
		x_trans = -25
		x_scale = 26
		y_scale = 26
		y_trans = 2
	}
}
car_rocker_guitars_factoredglobal_295 = {
	desc_id = finishes
	frontend_desc = qs(0x6e23fd31)
	mask = $gtr62_neckhead
}
car_rocker_guitars_factoredglobal_296 = {
	desc_id = details
	frontend_desc = qs(0x7f5a5c11)
	mask = $gtr62_neckhead_details
}
car_rocker_guitars_factoredglobal_305 = {
	desc_id = finishes
	frontend_desc = qs(0x6e23fd31)
	mask = $gtr63c_neckhead
}
car_rocker_guitars_factoredglobal_309 = {
	desc_id = details
	frontend_desc = qs(0x7f5a5c11)
	mask = $gtr33_neckhead_details
}
car_rocker_guitars_factoredglobal_310 = {
	initial_values = {
		x_trans = -25
		y_trans = 6
		x_scale = 21
		y_scale = 55
	}
}
car_rocker_guitars_factoredglobal_313 = {
	initial_values = {
		x_trans = -25
		x_scale = 26
		y_scale = 55
		y_trans = 2
	}
}
car_rocker_guitars_factoredglobal_356 = {
	initial_values = {
		x_trans = -38
		x_scale = 26
		y_scale = 55
		y_trans = 40
	}
}
