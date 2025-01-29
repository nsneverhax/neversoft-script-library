cas_bass_body = [
	{
		desc_id = bass9_esp_ax_01
		frontend_desc = qs(0x13982024)
		sponsor_id = esp
		mesh = `models/car_instruments/bass/esp/bass9_esp_ax_01`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex\models\car_instruments\bass\esp\bass9_esp_ax_d`
				material = bass9_esp_ax_01_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_esp_ax_finishes
					}
					{
						$preset_layer_fades
						mask = $cab_esp_ax_fades
					}
					{
						$preset_layer_details
						mask = $cab_esp_ax_details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						x_trans = -26
						y_trans = 30
						x_scale = 20
						y_scale = 24
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = cas_bass_neck
				valid = [
					bass_fretboard_22a
					bass_fretboard_22b
					bass_fretboard_22c
					bass_fretboard_22d
					bass_fretboard_24
					bass_fretboard_24b
					bass_fretboard_24c
					bass_fretboard_24d
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
					bass9_pkup_type1_blk_02
					bass9_pkup_type2_blk_03
					bass9_pkup_type3_blk_2
				]
			}
			{
				part = cas_bass_knobs
				valid = [
					bass9_esp_knob_10_04
					bass9_knob_02
					bass9_knob_03
					bass9_knob_04
					bass9_knob_05
				]
			}
			{
				part = cas_bass_bridges
				valid = [
					bass9_bridge_4str_01
				]
			}
			{
				part = cas_bass_head
				valid = [
					bass9_neckhead_01
					bass9_neckhead_02
					bass9_neckhead_03
					bass9_neckhead_04
					bass9_neckhead_05
				]
			}
			{
				part = cas_bass_misc
				valid = [
					None
				]
			}
		]
	}
	{
		desc_id = bass17_esp_ec_01
		frontend_desc = qs(0x9f1df0f7)
		sponsor_id = esp
		mesh = `models/car_instruments/bass/esp/bass17_esp_ec_01`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex\models\car_instruments\bass\esp\bass17_esp_ec_d`
				material = bass17_esp_ec_01_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_esp_ec_finishes
					}
					{
						$preset_layer_fades
						mask = $cab_esp_ec_fades
					}
					{
						$preset_layer_details
						mask = $cab_esp_ec_details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						y_trans = 29
						x_scale = 20
						y_scale = 27
						x_trans = -32
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = cas_bass_neck
				valid = [
					bass_fretboard_22a
					bass_fretboard_22b
					bass_fretboard_22c
					bass_fretboard_22d
					bass_fretboard_24
					bass_fretboard_24b
					bass_fretboard_24c
					bass_fretboard_24d
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
					bass9_pkup_type1_blk_02
					bass9_pkup_type2_blk_03
					bass9_pkup_type3_blk_2
				]
			}
			{
				part = cas_bass_knobs
				valid = [
					bass17_esp_knob_10
					bass17_knob_02
					bass17_knob_03
					bass17_knob_04
					bass17_knob_05
				]
			}
			{
				part = cas_bass_bridges
				valid = [
					bass17_bridge_4str_04
					bass17_bridge_4str_05
				]
			}
			{
				part = cas_bass_head
				valid = [
					bass14_neckhead_03
					bass14_neckhead_04
					bass14_neckhead_01
					bass14_neckhead_02
					bass14_neckhead_05
				]
			}
			{
				part = cas_bass_misc
				valid = [
					None
				]
			}
		]
	}
	{
		desc_id = bass63_ex
		frontend_desc = qs(0x109e1b5b)
		sponsor_id = esp
		mesh = `models/car_instruments/bass/esp/bass63_ex`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex\models\car_instruments\bass\esp\bass63_ex_d`
				material = bass63_ex_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $bass63_ex_finishes
					}
					{
						$preset_layer_fades
						mask = $bass63_ex_fades
					}
					{
						$preset_layer_details
						mask = $bass63_ex_details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						x_trans = -33
						y_trans = 19
						x_scale = 16
						y_scale = 21
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = cas_bass_neck
				valid = [
					bass_fretboard_22a
					bass_fretboard_22b
					bass_fretboard_22c
					bass_fretboard_22d
					bass_fretboard_24
					bass_fretboard_24b
					bass_fretboard_24c
					bass_fretboard_24d
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
					bass9_pkup_type1_blk_02
					bass9_pkup_type2_blk_03
					bass9_pkup_type3_blk_2
				]
			}
			{
				part = cas_bass_knobs
				valid = [
					bass63_knob_type1
					bass63_knob_type2
					bass63_knob_type3
					bass63_knob_type4
					bass63_knob_type5
				]
			}
			{
				part = cas_bass_bridges
				valid = [
					bass17_bridge_4str_05
				]
			}
			{
				part = cas_bass_head
				valid = [
					bass63_neckhead
					bass63_neckhead_02
					bass63_neckhead_03
					bass63_neckhead_04
					bass63_neckhead_05
				]
			}
			{
				part = cas_bass_misc
				valid = [
					None
				]
			}
		]
	}
	{
		desc_id = bass64_f405
		frontend_desc = qs(0x92a23c9d)
		sponsor_id = esp
		mesh = `models/car_instruments/bass/esp/bass64_f405`
		cap_textures = [
			{
				base_tex = `tex\models\car_instruments\bass\esp\bass64_f405_d`
				material = bass64_f405_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $bass64_f405_finishes
					}
					{
						$preset_layer_fades
						mask = $bass64_f405_fades
					}
					{
						$preset_layer_details
						mask = $bass64_f405_details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						x_trans = -30
						x_scale = 20
						y_scale = 25
						y_trans = 30
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = cas_bass_neck
				valid = [
					bass_fretboard_22a
					bass_fretboard_22b
					bass_fretboard_22c
					bass_fretboard_22d
					bass_fretboard_24
					bass_fretboard_24b
					bass_fretboard_24c
					bass_fretboard_24d
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
					bass9_pkup_type1_blk_02
					bass9_pkup_type2_blk_03
					bass9_pkup_type3_blk_2
				]
			}
			{
				part = cas_bass_knobs
				valid = [
					bass64_esp_knob_01
					bass64_esp_knob_02
					bass64_esp_knob_03
					bass64_esp_knob_04
					bass64_esp_knob_05
				]
			}
			{
				part = cas_bass_bridges
				valid = [
					bass17_bridge_4str_05
					bass9_bridge_4str_01b
				]
			}
			{
				part = cas_bass_head
				valid = [
					bass64_neckhead
					bass64_neckhead_02
					bass64_neckhead_03
					bass64_neckhead_04
					bass64_neckhead_05
				]
			}
			{
				part = cas_bass_misc
				valid = [
					None
				]
			}
		]
		locked
	}
	{
		desc_id = bass14_esp_surveyor
		frontend_desc = qs(0xd3e7edae)
		sponsor_id = esp
		mesh = `models/car_instruments/bass/esp/bass14_esp_surveyor`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex\models\car_instruments\bass\esp\bass14_esp_surveyor_d`
				material = bass14_esp_surveyor_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_esp_surveyor_finishes
					}
					{
						$preset_layer_fades
						mask = $cab_esp_surveyor_fades
					}
					{
						$preset_layer_details
						mask = $cab_esp_surveyor_details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						x_trans = -36
						x_scale = 20
						y_scale = 28
						y_trans = 21
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = cas_bass_neck
				valid = [
					bass_fretboard_22a
					bass_fretboard_22b
					bass_fretboard_22c
					bass_fretboard_22d
					bass_fretboard_24
					bass_fretboard_24b
					bass_fretboard_24c
					bass_fretboard_24d
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
					bass9_pkup_type1_blk_02
					bass9_pkup_type2_blk_03
					bass9_pkup_type3_blk_2
				]
			}
			{
				part = cas_bass_knobs
				valid = [
					bass14_esp_knob_10_04
					bass14_knob_02
					bass14_knob_03
					bass14_knob_04
					bass14_knob_05
				]
			}
			{
				part = cas_bass_bridges
				valid = [
					bass14_bridge_4str_01
					bass14_bridge_4str_02
				]
			}
			{
				part = cas_bass_head
				valid = [
					bass14_neckhead_04
					bass14_neckhead_01
					bass14_neckhead_02
					bass14_neckhead_03
					bass14_neckhead_05
				]
			}
			{
				part = cas_bass_misc
				valid = [
					None
				]
			}
		]
		locked
	}
	{
		desc_id = bass102_axe
		frontend_desc = qs(0xe1122dfb)
		mesh = `models/car_instruments/bass/heroes/bass102_axe`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex\models\car_instruments\bass\heroes\bass102_axe_d`
				material = bass102_axe_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $bass102_axe_finishes
					}
					{
						$preset_layer_fades
						mask = $bass102_axe_fades
					}
					{
						$preset_layer_details
						mask = $bass102_axe_details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						y_trans = -30
						x_scale = 16
						y_scale = 21
						x_trans = -12
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = cas_bass_neck
				valid = [
					cab_22_heroes01
					cab_22_heroes02
					cab_22_heroes03
					cab_22_heroes04
					cab_24_heroes01
					cab_24_heroes02
					cab_24_heroes03
					cab_24_heroes04
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
					bass_emgpickup1
					bass_emgpickup1b
					bass_emgpickup2
					bass_emgpickup2b
					bass_emgpickup3
					bass_emgpickup3b
					bass_pickup_sd
				]
			}
			{
				part = cas_bass_knobs
				valid = [
					bass_knob_01
					bass_knob_02
					bass_knob_03
					bass_knob_04
					bass_knob_05
					bass_knob_06
					bass_knob_07
					bass_knob_08
					bass_knob_09
					bass_knob_10
				]
			}
			{
				part = cas_bass_bridges
				valid = [
					bs_sch_brdg_a
					bass100_bridge
				]
			}
			{
				part = cas_bass_head
				valid = [
					bass102_neckhead
					bass104_neckhead
					bass105_neckhead_b
				]
			}
			{
				part = cas_bass_misc
				valid = [
					None
				]
			}
		]
		$car_rocker_bass_factoredglobal_6
	}
	{
		desc_id = bass103_cross
		frontend_desc = qs(0xefb65903)
		mesh = `models/car_instruments/bass/heroes/bass103_cross`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex\models\car_instruments\bass\heroes\bass103_cross_d`
				material = bass103_cross_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $bass103_cross_finishes
					}
					{
						$preset_layer_fades
						mask = $bass103_cross_fades
					}
					{
						$preset_layer_details
						mask = $bass103_cross_details
					}
				]
				user_layer_settings = {
					diffuse
					initial_values = {
						x_trans = -34
						y_trans = 9
						x_scale = 20
						y_scale = 12
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = cas_bass_neck
				valid = [
					cab_22_heroes01
					cab_22_heroes02
					cab_22_heroes03
					cab_22_heroes04
					cab_24_heroes01
					cab_24_heroes02
					cab_24_heroes03
					cab_24_heroes04
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
					bass_emgpickup1
					bass_emgpickup1b
					bass_emgpickup2
					bass_emgpickup2b
					bass_emgpickup3
					bass_emgpickup3b
					bass_pickup_sd
				]
			}
			{
				part = cas_bass_knobs
				valid = [
					bass_knob_01
					bass_knob_02
					bass_knob_03
					bass_knob_04
					bass_knob_05
					bass_knob_06
					bass_knob_07
					bass_knob_08
					bass_knob_09
					bass_knob_10
				]
			}
			{
				part = cas_bass_bridges
				valid = [
					bs_sch_brdg_a
					bass100_bridge
				]
			}
			{
				part = cas_bass_head
				valid = [
					bass102_neckhead
					bass104_neckhead
					bass105_neckhead_b
				]
			}
			{
				part = cas_bass_misc
				valid = [
					None
				]
			}
		]
		$car_rocker_bass_factoredglobal_6
	}
	{
		desc_id = bass104_skull
		frontend_desc = qs(0xa40aefbe)
		mesh = `models/car_instruments/bass/heroes/bass104_skull`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex\models\car_instruments\bass\heroes\bass104_skull_d`
				material = bass104_skull_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $bass104_skull_finishes
					}
					{
						$preset_layer_fades
						mask = $bass104_skull_fades
					}
					{
						$preset_layer_details
						mask = $bass104_skull_details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_180
					initial_values = {
						x_trans = -20
						y_trans = 12
						x_scale = 20
						y_scale = 16
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = cas_bass_neck
				valid = [
					cab_22_heroes01
					cab_22_heroes02
					cab_22_heroes03
					cab_22_heroes04
					cab_24_heroes01
					cab_24_heroes02
					cab_24_heroes03
					cab_24_heroes04
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
					bass_emgpickup1
					bass_emgpickup1b
					bass_emgpickup2
					bass_emgpickup2b
					bass_emgpickup3
					bass_emgpickup3b
					bass_pickup_sd
				]
			}
			{
				part = cas_bass_knobs
				valid = [
					bass_knob_01
					bass_knob_02
					bass_knob_03
					bass_knob_04
					bass_knob_05
					bass_knob_06
					bass_knob_07
					bass_knob_08
					bass_knob_09
					bass_knob_10
				]
			}
			{
				part = cas_bass_bridges
				valid = [
					bs_sch_brdg_a
					bass100_bridge
				]
			}
			{
				part = cas_bass_head
				valid = [
					bass104_neckhead
					bass102_neckhead
					bass105_neckhead_b
				]
			}
			{
				part = cas_bass_misc
				valid = [
					None
				]
			}
		]
		$car_rocker_bass_factoredglobal_6
	}
	{
		desc_id = bass105_pin
		frontend_desc = qs(0x4829c7e8)
		mesh = `models/car_instruments/bass/heroes/bass105_pin`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex\models\car_instruments\bass\heroes\bass105_pin_d`
				material = bass105_pin_primary
			}
		]
		inclusion = [
			{
				part = cas_bass_neck
				valid = [
					cab_22_heroes04
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
					bass_emgpickup3b
				]
			}
			{
				part = cas_bass_knobs
				valid = [
					bass_knob_01
					bass_knob_02
					bass_knob_03
					bass_knob_04
					bass_knob_05
					bass_knob_06
					bass_knob_07
					bass_knob_08
					bass_knob_09
					bass_knob_10
				]
			}
			{
				part = cas_bass_bridges
				valid = [
					bs_sch_brdg_a
					bass100_bridge
				]
			}
			{
				part = cas_bass_head
				valid = [
					bass105_neckhead
					bass102_neckhead
					bass104_neckhead
				]
			}
			{
				part = cas_bass_misc
				valid = [
					None
				]
			}
		]
		$car_rocker_bass_factoredglobal_6
	}
	{
		desc_id = ibanez_icb_body
		frontend_desc = qs(0xa54f4110)
		mesh = `models/car_instruments/bass/ibanez/ibanez_icb_body`
		sponsor_id = ibanez
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex\models\car_instruments\bass\ibanez\bs_ibz_icb_body`
				material = bs_ibz_icb_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_ibz_icb_finishes
					}
					{
						$preset_layer_fades
						mask = $cab_ibz_icb_fades
					}
					{
						$preset_layer_details
						mask = $cab_ibz_icb_details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						x_trans = -37
						y_trans = 23
						y_scale = 20
						x_scale = 18
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = cas_bass_neck
				valid = [
					bass_ibz_fretboard_22a
					bass_ibz_fretboard_22b
					bass_ibz_fretboard_22c
					bass_ibz_fretboard_22d
					bass_ibz_fretboard_24
					bass_ibz_fretboard_24b
					bass_ibz_fretboard_24c
					bass_ibz_fretboard_24d
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
					bas_pickup_ibz01
					bas_ibz_pkup002
					bass_pickup_sd
					bass_pickup_emg01
					bass_emgpickup1
					bass_emgpickup1b
					bass_emgpickup2
					bass_emgpickup2b
					bass_emgpickup3
					bass_emgpickup3b
				]
			}
			{
				part = cas_bass_knobs
				valid = [
					knob_knurl02
					bass_knob_01
					bass_knob_02
					bass_knob_03
					bass_knob_04
					bass_knob_05
					bass_knob_06
					bass_knob_07
					bass_knob_08
					bass_knob_09
					bass_knob_10
				]
			}
			{
				part = cas_bass_bridges
				valid = [
					bas_brdg_ibz01
					bas_brdg_sch_t2
					bas_brdg_ibz_mono
					bas_brdg_capsule
				]
			}
			{
				part = cas_bass_head
				valid = [
					bs_ibz_icb_head
				]
			}
			{
				part = cas_bass_misc
				valid = [
					None
				]
			}
		]
		$car_rocker_bass_factoredglobal_6
	}
	{
		desc_id = bas_ibz_sr505
		frontend_desc = qs(0x475ac684)
		mesh = `models/car_instruments/bass/ibanez/bas_ibz_sr505`
		sponsor_id = ibanez
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex\models\car_instruments\bass\ibanez\bs_ibz_sr_body`
				material = bs_ibz_sr_body_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_ibz_sr_finishes
					}
					{
						$preset_layer_fades
						mask = $cab_ibz_sr_fades
					}
					{
						$preset_layer_details
						mask = $cab_ibz_sr_details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						x_trans = -35
						y_trans = 25
						y_scale = 20
						x_scale = 18
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = cas_bass_neck
				valid = [
					bass_fretboard_sr_24a
					bass_fretboard_sr_24b
					bass_fretboard_sr_24d
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
					bas_ibz_pkup002
					bas_pickup_ibz01
					bass_pickup_sd
					bass_mm_sr_pkup_type5
					bass_pickup_emg01
					bass_emgpickup1
					bass_emgpickup1b
					bass_emgpickup2
					bass_emgpickup2b
					bass_emgpickup3
					bass_emgpickup3b
				]
			}
			{
				part = cas_bass_knobs
				valid = [
					knob_knurl02
					bass_knob_01
					bass_knob_02
					bass_knob_03
					bass_knob_04
					bass_knob_05
					bass_knob_06
					bass_knob_07
					bass_knob_08
					bass_knob_09
					bass_knob_10
				]
			}
			{
				part = cas_bass_bridges
				valid = [
					bas_brdg_ibz01
					bas_brdg_sch_t2
					bas_brdg_ibz_mono
					bas_brdg_capsule
				]
			}
			{
				part = cas_bass_head
				valid = [
					bas_ibz_sr_head01
				]
			}
			{
				part = cas_bass_misc
				valid = [
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = bass15_mcswain_machine
		frontend_desc = qs(0xc2e7c0f1)
		sponsor_id = mcswain
		mesh = `models/car_instruments/bass/mcswain/bass15_mcswain_machine`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex\models\car_instruments\bass\mcswain\bass15_mcswain_machine_d`
				material = bass15_mcswain_machine_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $bass15_mcswain_finishes
					}
					{
						$preset_layer_fades
						mask = $bass15_mcswain_fades
					}
					{
						$preset_layer_details
						mask = $bass15_mcswain_details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						x_trans = -30
						x_scale = 20
						y_scale = 27
						y_trans = 28
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = cas_bass_neck
				valid = [
					bass_mcswain_fboard22a
					bass_mcswain_fboard22b
					bass_mcswain_fboard22c
					bass_mcswain_fboard22d
					bass_mcswain_fboard24
					bass_mcswain_fboard24b
					bass_mcswain_fboard24c
					bass_mcswain_fboard24d
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
					bass_pickup_sd
					bass_emgpickup1
					bass_emgpickup1b
					bass_emgpickup2
					bass_emgpickup2b
					bass_emgpickup3
					bass_emgpickup3b
				]
			}
			{
				part = cas_bass_knobs
				valid = [
					bass_knob_01
					bass_knob_02
					bass_knob_03
					bass_knob_04
					bass_knob_05
					bass_knob_06
					bass_knob_07
					bass_knob_08
					bass_knob_09
					bass_knob_10
				]
			}
			{
				part = cas_bass_bridges
				valid = [
					bass15_bridge_mcswain1
				]
			}
			{
				part = cas_bass_head
				valid = [
					bass15_neckhead_mcswain11
				]
			}
			{
				part = cas_bass_misc
				valid = [
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = bass_mm_stingray
		frontend_desc = qs(0xc6739ae3)
		sponsor_id = `music	man`
		mesh = `models/car_instruments/bass/musicman/bass_mm_stingray`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex\models\car_instruments\bass\musicman\bass_body_mm_stingray_d`
				material = bass_mm_stingray_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_musicman_stingray_finishes
					}
					{
						$preset_layer_fades
						mask = $cab_musicman_stingray_fades
					}
					{
						$preset_layer_details
						mask = $cab_musicman_stingray_details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						y_trans = 16
						x_scale = 14
						y_scale = 20
						x_trans = -2
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = cas_bass_neck
				valid = [
					bass_mm_fretboard_22a
					bass_mm_fretboard_22b
					bass_mm_fretboard_22c
					bass_mm_fretboard_22d
					bass_mm_fretboard_24
					bass_mm_fretboard_24b
					bass_mm_fretboard_24c
					bass_mm_fretboard_24d
				]
			}
			{
				part = cas_bass_pickguards
				valid = [
					bass_pickguard_mm_sr
					None
				]
			}
			{
				part = cas_bass_pickups
				valid = [
					bass_emgpickup1
					bass_emgpickup1b
					bass_emgpickup2
					bass_emgpickup2b
					bass_emgpickup3
					bass_emgpickup3b
				]
			}
			{
				part = cas_bass_knobs
				valid = [
					bass_knob_01
					bass_knob_02
					bass_knob_03
					bass_knob_04
					bass_knob_05
					bass_knob_06
					bass_knob_07
					bass_knob_08
					bass_knob_09
					bass_knob_10
				]
			}
			{
				part = cas_bass_bridges
				valid = [
					bass_mm_bridge_sr_1
				]
			}
			{
				part = cas_bass_head
				valid = [
					bass_mm_neckhead_1
				]
			}
			{
				part = cas_bass_misc
				valid = [
					bass_mm_sr_misc_1
					None
				]
			}
		]
		$car_rocker_bass_factoredglobal_6
	}
	{
		desc_id = bass_schect_030
		frontend_desc = qs(0xa1a6df33)
		sponsor_id = schecter
		mesh = `models/car_instruments/bass/schecter/bass_schect_030`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex\models\car_instruments\bass\schecter\bs_sch_bod04_01`
				material = bass_sch001_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_sch_004_finishes
					}
					{
						$preset_layer_fades
						mask = $cab_sch_004_fades
					}
					{
						$preset_layer_details
						mask = $cab_sch_004_details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_270
					initial_values = {
						x_trans = 38
						y_trans = -34
						y_scale = 20
						x_scale = 17
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = cas_bass_neck
				valid = [
					bass_sch_fretboard_22a
					bass_sch_fretboard_22b
					bass_sch_fretboard_22c
					bass_sch_fretboard_22d
					bass_sch_fretboard_24c
					bass_sch_fretboard_24b
					bass_sch_fretboard_24
					bass_sch_fretboard_24d
				]
			}
			{
				part = cas_bass_pickguards
				valid = [
					bs_sch_030_pga
					None
				]
			}
			{
				part = cas_bass_pickups
				valid = [
					bass_pickup_sd
					bass_pickup_emg01
					bass_emgpickup1
					bass_emgpickup1b
					bass_emgpickup2
					bass_emgpickup2b
					bass_emgpickup3
					bass_emgpickup3b
				]
			}
			{
				part = cas_bass_knobs
				valid = [
					knob_knurl02
					bass_knob_02
					bass_knob_03
					bass_knob_09
					bass_knob_tophat
					bass_knob_04
					bass_knob_05
					bass_knob_06
					bass_knob_07
					bass_knob_08
				]
			}
			{
				part = cas_bass_bridges
				valid = [
					bs_sch_brdg_a
					bas_brdg_sch_t
					bas_brdg_sch_c
					bas_brdg_capsule
				]
			}
			{
				part = cas_bass_head
				valid = [
					bs_sch_030_nhead01
				]
			}
			{
				part = cas_bass_misc
				valid = [
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = bs_sch_t_body
		frontend_desc = qs(0xcf7a4c6e)
		sponsor_id = schecter
		mesh = `models/car_instruments/bass/schecter/bs_sch_t_body`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex\models\car_instruments\bass\schecter\bs_sch_modelt`
				material = bs_sch_modelt_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_sch_modelt_finishes
					}
					{
						$preset_layer_fades
						mask = $cab_sch_modelt_fades
					}
					{
						$preset_layer_details
						mask = $cab_sch_modelt_details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						x_trans = -39
						x_scale = 20
						y_scale = 20
						y_trans = 20
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = cas_bass_neck
				valid = [
					bass_sch_fretboard_22a
					bass_sch_fretboard_22b
					bass_sch_fretboard_22c
					bass_sch_fretboard_22d
					bass_sch_fretboard_24c
					bass_sch_fretboard_24b
					bass_sch_fretboard_24
					bass_sch_fretboard_24d
				]
			}
			{
				part = cas_bass_pickguards
				valid = [
					bs_sch_t_pga
					None
				]
			}
			{
				part = cas_bass_pickups
				valid = [
					bass_pickup_sd
					bass_pickup_emg01
					bass_emgpickup1
					bass_emgpickup1b
					bass_emgpickup2
					bass_emgpickup2b
					bass_emgpickup3
					bass_emgpickup3b
				]
			}
			{
				part = cas_bass_knobs
				valid = [
					knob_knurl02
					bass_knob_01
					bass_knob_02
					bass_knob_03
					bass_knob_04
					bass_knob_05
					bass_knob_06
					bass_knob_07
					bass_knob_08
					bass_knob_09
					knob_knurl02
				]
			}
			{
				part = cas_bass_bridges
				valid = [
					bs_sch_brdg_a
					bas_brdg_sch_t
					bas_brdg_sch_c
					bas_brdg_capsule
				]
			}
			{
				part = cas_bass_head
				valid = [
					bs_sch_t_nhead
				]
			}
			{
				part = cas_bass_misc
				valid = [
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = bas_sch_stil
		frontend_desc = qs(0x7f18fb3a)
		sponsor_id = schecter
		mesh = `models\car_instruments\bass\schecter\bas_sch_stil`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex\models\car_instruments\bass\schecter\bas_sch_stil_bod`
				material = bass_stiletto_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_sch_stiletto_finishes
					}
					{
						$preset_layer_fades
						mask = $cab_sch_stiletto_fades
					}
					{
						$preset_layer_details
						mask = $cab_sch_stiletto_details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						x_trans = -37
						x_scale = 20
						y_scale = 20
						y_trans = 24
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = cas_bass_neck
				valid = [
					bass_sch_fretboard_22a
					bass_sch_fretboard_22b
					bass_sch_fretboard_22c
					bass_sch_fretboard_22d
					bass_sch_fretboard_24c
					bass_sch_fretboard_24b
					bass_sch_fretboard_24
					bass_sch_fretboard_24d
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
					bass_pickup_sd
					bass_pickup_emg01
					bass_emgpickup1
					bass_emgpickup1b
					bass_emgpickup2
					bass_emgpickup2b
					bass_emgpickup3
					bass_emgpickup3b
				]
			}
			{
				part = cas_bass_knobs
				valid = [
					bass_knob_01
					bass_knob_02
					bass_knob_03
					bass_knob_04
					bass_knob_05
					bass_knob_06
					bass_knob_07
					bass_knob_08
					bass_knob_09
					knob_knurl02
				]
			}
			{
				part = cas_bass_bridges
				valid = [
					bs_sch_brdg_a
					bas_brdg_sch_t
					bas_brdg_sch_c
					bas_brdg_capsule
				]
			}
			{
				part = cas_bass_head
				valid = [
					bas_neckhead_sch_stl
				]
			}
			{
				part = cas_bass_misc
				valid = [
					None
				]
			}
		]
		$car_rocker_bass_factoredglobal_6
	}
]
cas_bass_neck = [
	{
		desc_id = bass_fretboard_22a
		frontend_desc = qs(0x40f28e6a)
		mesh = `models/car_instruments/bass/esp/bass_fretboard_22a`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_02`
				material = bass_fretboard_22a_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_fretboard_inlays_22fret
						$car_rocker_bass_factoredglobal_16
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_02`
				material = bass_fretboard_22a_primary
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/esp/bass_fretboard_inlay_06`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = bass_fretboard_22b
		frontend_desc = qs(0x403e976b)
		mesh = `models/car_instruments/bass/esp/bass_fretboard_22b`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_03`
				material = bass_fretboard_22b_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_fretboard_inlays_22fret
						$car_rocker_bass_factoredglobal_16
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_03`
				material = bass_fretboard_22b_primary
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/esp/bass_fretboard_inlay_06`
						flags = 4
						Color = black_1guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = bass_fretboard_22c
		frontend_desc = qs(0xec4e31fa)
		mesh = `models/car_instruments/bass/esp/bass_fretboard_22c`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_04`
				material = bass_fretboard_22c_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_fretboard_inlays_22fret
						$car_rocker_bass_factoredglobal_16
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_04`
				material = bass_fretboard_22c_primary
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/esp/bass_fretboard_inlay_06`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = bass_fretboard_22d
		frontend_desc = qs(0x6398f5e4)
		mesh = `models/car_instruments/bass/esp/bass_fretboard_22d`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_05`
				material = bass_fretboard_22d_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_fretboard_inlays_22fret
						$car_rocker_bass_factoredglobal_16
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_05`
				material = bass_fretboard_22d_primary
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/esp/bass_fretboard_inlay_06`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = bass_fretboard_24
		frontend_desc = qs(0xc0a291ea)
		mesh = `models/car_instruments/bass/esp/bass_fretboard_24`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d`
				material = bass_fretboard_24_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $bass_fretboard_24
						$car_rocker_bass_factoredglobal_16
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d`
				material = bass_fretboard_24_primary
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/esp/bass_fretboard_24_inlay_05`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = bass_fretboard_24b
		frontend_desc = qs(0xa81d6c13)
		mesh = `models/car_instruments/bass/esp/bass_fretboard_24b`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_02`
				material = bass_fretboard_24b_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $bass_fretboard_24
						$car_rocker_bass_factoredglobal_16
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_02`
				material = bass_fretboard_24b_primary
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/esp/bass_fretboard_24_inlay_05`
						flags = 4
						Color = black_1guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = bass_fretboard_24c
		frontend_desc = qs(0x21ad5ed2)
		mesh = `models/car_instruments/bass/esp/bass_fretboard_24c`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_03`
				material = bass_fretboard_24c_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $bass_fretboard_24
						$car_rocker_bass_factoredglobal_16
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_03`
				material = bass_fretboard_24c_primary
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/esp/bass_fretboard_24_inlay_05`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = bass_fretboard_24d
		frontend_desc = qs(0x8bbb0e9c)
		mesh = `models/car_instruments/bass/esp/bass_fretboard_24d`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
				material = bass_fretboard_24d_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $bass_fretboard_24
						$car_rocker_bass_factoredglobal_16
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
				material = bass_fretboard_24d_primary
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/esp/bass_fretboard_24_inlay_05`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = bass_fretboard_sr_24a
		frontend_desc = qs(0x21ad5ed2)
		mesh = `models/car_instruments/bass/ibanez/bass_fretboard_sr_24`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d`
				material = bass_fretboard_24_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_bass_fretboard_sr24
						$car_rocker_bass_factoredglobal_16
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d`
				material = bass_fretboard_24_primary
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/ibanez/bass_sr24_inlay001`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = bass_fretboard_sr_24b
		frontend_desc = qs(0xa81d6c13)
		mesh = `models/car_instruments/bass/ibanez/bass_fretboard_sr_24b`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_02`
				material = bass_fretboard_sr24b_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_bass_fretboard_sr24
						$car_rocker_bass_factoredglobal_16
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_02`
				material = bass_fretboard_sr24b_primary
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/ibanez/bass_sr24_inlay001`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = bass_fretboard_sr_24d
		frontend_desc = qs(0x8bbb0e9c)
		mesh = `models/car_instruments/bass/ibanez/bass_fretboard_sr_24d`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
				material = bass_fretboard_sr24d_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_bass_fretboard_sr24
						$car_rocker_bass_factoredglobal_16
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
				material = bass_fretboard_sr24d_primary
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/ibanez/bass_sr24_inlay001`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = bass_ibz_fretboard_22a
		frontend_desc = qs(0xdbe5091e)
		mesh = `models/car_instruments/bass/esp/bass_fretboard_22a`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_02`
				material = bass_fretboard_22a_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_ibz_fboard_inlays_21fret
						$car_rocker_bass_factoredglobal_17
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_02`
				material = bass_fretboard_22a_primary
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/ibanez/bass_ibz22_inlay_67`
						flags = 4
						Color = grey_2guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = bass_ibz_fretboard_22b
		frontend_desc = qs(0x403e976b)
		mesh = `models/car_instruments/bass/esp/bass_fretboard_22b`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_03`
				material = bass_fretboard_22b_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_ibz_fboard_inlays_21fret
						$car_rocker_bass_factoredglobal_18
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_03`
				material = bass_fretboard_22b_primary
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/ibanez/bass_ibz22_inlay_67`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = bass_ibz_fretboard_22c
		frontend_desc = qs(0xec4e31fa)
		mesh = `models/car_instruments/bass/esp/bass_fretboard_22c`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_04`
				material = bass_fretboard_22c_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_ibz_fboard_inlays_21fret
						$car_rocker_bass_factoredglobal_17
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_04`
				material = bass_fretboard_22c_primary
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/ibanez/bass_ibz22_inlay_67`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = bass_ibz_fretboard_22d
		frontend_desc = qs(0x6398f5e4)
		mesh = `models/car_instruments/bass/esp/bass_fretboard_22d`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_05`
				material = bass_fretboard_22d_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_ibz_fboard_inlays_21fret
						$car_rocker_bass_factoredglobal_17
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_05`
				material = bass_fretboard_22d_primary
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/ibanez/bass_ibz22_inlay_67`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = bass_ibz_fretboard_24
		frontend_desc = qs(0xc0a291ea)
		mesh = `models/car_instruments/bass/esp/bass_fretboard_24`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d`
				material = bass_fretboard_24_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_ibz_fboard_inlays_24fret
						$car_rocker_bass_factoredglobal_17
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d`
				material = bass_fretboard_24_primary
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/ibanez/bass_ibz24_inlay_67`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = bass_ibz_fretboard_24b
		frontend_desc = qs(0xa81d6c13)
		mesh = `models/car_instruments/bass/esp/bass_fretboard_24b`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_02`
				material = bass_fretboard_24b_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_ibz_fboard_inlays_24fret
						$car_rocker_bass_factoredglobal_18
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_02`
				material = bass_fretboard_24b_primary
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/ibanez/bass_ibz24_inlay_67`
						flags = 4
						Color = grey_2guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = bass_ibz_fretboard_24c
		frontend_desc = qs(0x21ad5ed2)
		mesh = `models/car_instruments/bass/esp/bass_fretboard_24c`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_03`
				material = bass_fretboard_24c_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_ibz_fboard_inlays_24fret
						$car_rocker_bass_factoredglobal_17
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_03`
				material = bass_fretboard_24c_primary
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/ibanez/bass_ibz24_inlay_67`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = bass_ibz_fretboard_24d
		frontend_desc = qs(0x8bbb0e9c)
		mesh = `models/car_instruments/bass/esp/bass_fretboard_24d`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
				material = bass_fretboard_24d_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_ibz_fboard_inlays_24fret
						$car_rocker_bass_factoredglobal_17
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
				material = bass_fretboard_24d_primary
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/ibanez/bass_ibz24_inlay_67`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = bass_mcswain_fboard22a
		frontend_desc = qs(0x40f28e6a)
		mesh = `models/car_instruments/bass/esp/bass_fretboard_22a`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_02`
				material = bass_fretboard_22a_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_mcswain_22fret_inlays
						$car_rocker_bass_factoredglobal_17
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_02`
				material = bass_fretboard_22a_primary
				pre_layer = [
					{
						Color = grey_5guitar
						texture = `tex/models/characters/layers/cab/mcswain/22fret_ld07_mcswn_bullets`
						flags = 36
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = bass_mcswain_fboard22b
		frontend_desc = qs(0x403e976b)
		mesh = `models/car_instruments/bass/esp/bass_fretboard_22b`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_03`
				material = bass_fretboard_22b_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_mcswain_22fret_inlays
						$car_rocker_bass_factoredglobal_18
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_03`
				material = bass_fretboard_22b_primary
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/mcswain/22fret_ld07_mcswn_bullets`
						flags = 36
						Color = grey_3guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = bass_mcswain_fboard22c
		frontend_desc = qs(0xec4e31fa)
		mesh = `models/car_instruments/bass/esp/bass_fretboard_22c`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_04`
				material = bass_fretboard_22c_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_mcswain_22fret_inlays
						$car_rocker_bass_factoredglobal_17
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_04`
				material = bass_fretboard_22c_primary
				pre_layer = [
					{
						Color = grey_5guitar
						texture = `tex/models/characters/layers/cab/mcswain/22fret_ld07_mcswn_bullets`
						flags = 36
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = bass_mcswain_fboard22d
		frontend_desc = qs(0x6398f5e4)
		mesh = `models/car_instruments/bass/esp/bass_fretboard_22d`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_05`
				material = bass_fretboard_22d_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_mcswain_22fret_inlays
						$car_rocker_bass_factoredglobal_17
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_05`
				material = bass_fretboard_22d_primary
				pre_layer = [
					{
						Color = grey_5guitar
						texture = `tex/models/characters/layers/cab/mcswain/22fret_ld07_mcswn_bullets`
						flags = 36
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = bass_mcswain_fboard24
		frontend_desc = qs(0xc0a291ea)
		mesh = `models/car_instruments/bass/esp/bass_fretboard_24`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d`
				material = bass_fretboard_24_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_mcswn_24fret_inlays
						$car_rocker_bass_factoredglobal_17
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d`
				material = bass_fretboard_24_primary
				pre_layer = [
					{
						Color = grey_5guitar
						texture = `tex/models/characters/layers/cab/mcswain/24fret_ld07_mcswn_bullets`
						flags = 36
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = bass_mcswain_fboard24b
		frontend_desc = qs(0xa81d6c13)
		mesh = `models/car_instruments/bass/esp/bass_fretboard_24b`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_02`
				material = bass_fretboard_24b_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_mcswn_24fret_inlays
						$car_rocker_bass_factoredglobal_18
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_02`
				material = bass_fretboard_24b_primary
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/mcswain/24fret_ld07_mcswn_bullets`
						flags = 36
						Color = grey_3guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = bass_mcswain_fboard24c
		frontend_desc = qs(0x21ad5ed2)
		mesh = `models/car_instruments/bass/esp/bass_fretboard_24c`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_03`
				material = bass_fretboard_24c_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_mcswn_24fret_inlays
						$car_rocker_bass_factoredglobal_17
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_03`
				material = bass_fretboard_24c_primary
				pre_layer = [
					{
						Color = grey_5guitar
						texture = `tex/models/characters/layers/cab/mcswain/24fret_ld07_mcswn_bullets`
						flags = 36
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = bass_mcswain_fboard24d
		frontend_desc = qs(0x8bbb0e9c)
		mesh = `models/car_instruments/bass/esp/bass_fretboard_24d`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
				material = bass_fretboard_24d_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_mcswn_24fret_inlays
						$car_rocker_bass_factoredglobal_17
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
				material = bass_fretboard_24d_primary
				pre_layer = [
					{
						Color = grey_5guitar
						texture = `tex/models/characters/layers/cab/mcswain/24fret_ld07_mcswn_bullets`
						flags = 36
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = bass_mm_fretboard_22a
		frontend_desc = qs(0x40f28e6a)
		mesh = `models/car_instruments/bass/esp/bass_fretboard_22a`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_02`
				material = bass_fretboard_22a_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_mm_fboard_inlays_22fret
						$car_rocker_bass_factoredglobal_17
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_02`
				material = bass_fretboard_22a_primary
				pre_layer = [
					{
						Color = grey_5guitar
						texture = `tex/models/characters/layers/cab/musicman/bass_mm_fboard_22_inlay1`
						flags = 4
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = bass_mm_fretboard_22b
		frontend_desc = qs(0x403e976b)
		mesh = `models/car_instruments/bass/esp/bass_fretboard_22b`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_03`
				material = bass_fretboard_22b_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_mm_fboard_inlays_22fret
						$car_rocker_bass_factoredglobal_18
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_03`
				material = bass_fretboard_22b_primary
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/musicman/bass_mm_fboard_22_inlay1`
						flags = 4
						Color = black_1guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = bass_mm_fretboard_22c
		frontend_desc = qs(0xec4e31fa)
		mesh = `models/car_instruments/bass/esp/bass_fretboard_22c`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_04`
				material = bass_fretboard_22c_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_mm_fboard_inlays_22fret
						$car_rocker_bass_factoredglobal_17
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_04`
				material = bass_fretboard_22c_primary
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/musicman/bass_mm_fboard_22_inlay1`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = bass_mm_fretboard_22d
		frontend_desc = qs(0x6398f5e4)
		mesh = `models/car_instruments/bass/esp/bass_fretboard_22d`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_05`
				material = bass_fretboard_22d_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_mm_fboard_inlays_22fret
						$car_rocker_bass_factoredglobal_17
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_05`
				material = bass_fretboard_22d_primary
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/musicman/bass_mm_fboard_22_inlay1`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = bass_mm_fretboard_24
		frontend_desc = qs(0xc0a291ea)
		mesh = `models/car_instruments/bass/esp/bass_fretboard_24`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d`
				material = bass_fretboard_24_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_mm_fboard_inlays_24
						$car_rocker_bass_factoredglobal_17
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d`
				material = bass_fretboard_24_primary
				pre_layer = [
					{
						Color = grey_5guitar
						texture = `tex/models/characters/layers/cab/musicman/bass_mm_fboard_24_inlay1`
						flags = 4
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = bass_mm_fretboard_24b
		frontend_desc = qs(0xa81d6c13)
		mesh = `models/car_instruments/bass/esp/bass_fretboard_24b`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_02`
				material = bass_fretboard_24b_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_mm_fboard_inlays_24
						$car_rocker_bass_factoredglobal_18
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_02`
				material = bass_fretboard_24b_primary
				pre_layer = [
					{
						Color = black_1guitar
						texture = `tex/models/characters/layers/cab/musicman/bass_mm_fboard_24_inlay1`
						flags = 4
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = bass_mm_fretboard_24c
		frontend_desc = qs(0x21ad5ed2)
		mesh = `models/car_instruments/bass/esp/bass_fretboard_24c`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_03`
				material = bass_fretboard_24c_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_mm_fboard_inlays_24
						$car_rocker_bass_factoredglobal_17
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_03`
				material = bass_fretboard_24c_primary
				pre_layer = [
					{
						Color = grey_5guitar
						texture = `tex/models/characters/layers/cab/musicman/bass_mm_fboard_24_inlay1`
						flags = 4
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = bass_mm_fretboard_24d
		frontend_desc = qs(0x8bbb0e9c)
		mesh = `models/car_instruments/bass/esp/bass_fretboard_24d`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
				material = bass_fretboard_24d_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_mm_fboard_inlays_24
						$car_rocker_bass_factoredglobal_17
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
				material = bass_fretboard_24d_primary
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/musicman/bass_mm_fboard_24_inlay1`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = cab_22_heroes01
		frontend_desc = qs(0x40f28e6a)
		mesh = `models/car_instruments/bass/esp/bass_fretboard_22a`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_02`
				material = bass_fretboard_22a_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_22fret_heroes
						$car_rocker_bass_factoredglobal_17
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_02`
				material = bass_fretboard_22a_primary
				pre_layer = [
					{
						Color = grey_5guitar
						texture = `tex/models/characters/layers/cab/musicman/bass_mm_fboard_22_inlay1`
						flags = 4
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = cab_22_heroes02
		frontend_desc = qs(0x403e976b)
		mesh = `models/car_instruments/bass/esp/bass_fretboard_22b`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_03`
				material = bass_fretboard_22b_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_22fret_heroes
						$car_rocker_bass_factoredglobal_18
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_03`
				material = bass_fretboard_22b_primary
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/musicman/bass_mm_fboard_22_inlay1`
						flags = 4
						Color = black_1guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = cab_22_heroes03
		frontend_desc = qs(0xec4e31fa)
		mesh = `models/car_instruments/bass/esp/bass_fretboard_22c`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_04`
				material = bass_fretboard_22c_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_22fret_heroes
						$car_rocker_bass_factoredglobal_17
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_04`
				material = bass_fretboard_22c_primary
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/musicman/bass_mm_fboard_22_inlay1`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = cab_22_heroes04
		frontend_desc = qs(0x6398f5e4)
		mesh = `models/car_instruments/bass/esp/bass_fretboard_22d`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_05`
				material = bass_fretboard_22d_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_22fret_heroes
						$car_rocker_bass_factoredglobal_17
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_05`
				material = bass_fretboard_22d_primary
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/musicman/bass_mm_fboard_22_inlay1`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = cab_24_heroes01
		frontend_desc = qs(0xc0a291ea)
		mesh = `models/car_instruments/bass/esp/bass_fretboard_24`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d`
				material = bass_fretboard_24_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_24_heroes
						$car_rocker_bass_factoredglobal_17
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d`
				material = bass_fretboard_24_primary
				pre_layer = [
					{
						Color = grey_5guitar
						texture = `tex/models/characters/layers/cab/musicman/bass_mm_fboard_24_inlay1`
						flags = 4
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = cab_24_heroes02
		frontend_desc = qs(0xa81d6c13)
		mesh = `models/car_instruments/bass/esp/bass_fretboard_24b`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_02`
				material = bass_fretboard_24b_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_24_heroes
						$car_rocker_bass_factoredglobal_18
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_02`
				material = bass_fretboard_24b_primary
				pre_layer = [
					{
						Color = black_1guitar
						texture = `tex/models/characters/layers/cab/musicman/bass_mm_fboard_24_inlay1`
						flags = 4
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = cab_24_heroes03
		frontend_desc = qs(0x21ad5ed2)
		mesh = `models/car_instruments/bass/esp/bass_fretboard_24c`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_03`
				material = bass_fretboard_24c_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_24_heroes
						$car_rocker_bass_factoredglobal_17
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_03`
				material = bass_fretboard_24c_primary
				pre_layer = [
					{
						Color = grey_5guitar
						texture = `tex/models/characters/layers/cab/musicman/bass_mm_fboard_24_inlay1`
						flags = 4
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = cab_24_heroes04
		frontend_desc = qs(0x8bbb0e9c)
		mesh = `models/car_instruments/bass/esp/bass_fretboard_24d`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
				material = bass_fretboard_24d_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_24_heroes
						$car_rocker_bass_factoredglobal_17
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
				material = bass_fretboard_24d_primary
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/musicman/bass_mm_fboard_24_inlay1`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = bass_sch_fretboard_22a
		frontend_desc = qs(0x40f28e6a)
		mesh = `models/car_instruments/bass/esp/bass_fretboard_22a`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_02`
				material = bass_fretboard_22a_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_22fret_schecter
						$car_rocker_bass_factoredglobal_16
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_02`
				material = bass_fretboard_22a_primary
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/schecter/bs_sch22_inl_ld30`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = bass_sch_fretboard_22b
		frontend_desc = qs(0x403e976b)
		mesh = `models/car_instruments/bass/esp/bass_fretboard_22b`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_03`
				material = bass_fretboard_22b_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_22fret_schecter
						$car_rocker_bass_factoredglobal_16
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_03`
				material = bass_fretboard_22b_primary
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/schecter/bs_sch22_inl_ld30`
						flags = 4
						Color = black_1guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = bass_sch_fretboard_22c
		frontend_desc = qs(0xec4e31fa)
		mesh = `models/car_instruments/bass/esp/bass_fretboard_22c`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_04`
				material = bass_fretboard_22c_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_22fret_schecter
						$car_rocker_bass_factoredglobal_16
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_04`
				material = bass_fretboard_22c_primary
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/schecter/bs_sch22_inl_ld30`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = bass_sch_fretboard_22d
		frontend_desc = qs(0x6398f5e4)
		mesh = `models/car_instruments/bass/esp/bass_fretboard_22d`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_05`
				material = bass_fretboard_22d_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_22fret_schecter
						$car_rocker_bass_factoredglobal_16
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_05`
				material = bass_fretboard_22d_primary
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/schecter/bs_sch22_inl_ld30`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = bs_schect_fbrd_24a
		frontend_desc = qs(0x21ad5ed2)
		mesh = `models/car_instruments/bass/schecter/bs_schect_fbrd_24a`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/schecter/bs_schfbrd24_01`
				material = bs_schect_fbrd_24a_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $bass_fretboard_24
						$car_rocker_bass_factoredglobal_16
					}
				]
			}
		]
	}
	{
		desc_id = bass_sch_fretboard_24
		frontend_desc = qs(0xc0a291ea)
		mesh = `models/car_instruments/bass/esp/bass_fretboard_24`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d`
				material = bass_fretboard_24_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_24fret_schecter
						$car_rocker_bass_factoredglobal_16
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d`
				material = bass_fretboard_24_primary
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/schecter/bs_sch_inl_ld30`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = bass_sch_fretboard_24b
		frontend_desc = qs(0xa81d6c13)
		mesh = `models/car_instruments/bass/esp/bass_fretboard_24b`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_02`
				material = bass_fretboard_24b_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_24fret_schecter
						$car_rocker_bass_factoredglobal_16
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_02`
				material = bass_fretboard_24b_primary
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/schecter/bs_sch_inl_ld30`
						flags = 4
						Color = black_1guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = bass_sch_fretboard_24c
		frontend_desc = qs(0x21ad5ed2)
		mesh = `models/car_instruments/bass/esp/bass_fretboard_24c`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_03`
				material = bass_fretboard_24c_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_24fret_schecter
						$car_rocker_bass_factoredglobal_16
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_03`
				material = bass_fretboard_24c_primary
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/schecter/bs_sch_inl_ld30`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = bass_sch_fretboard_24d
		frontend_desc = qs(0x8bbb0e9c)
		mesh = `models/car_instruments/bass/esp/bass_fretboard_24d`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
				material = bass_fretboard_24d_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_24fret_schecter
						$car_rocker_bass_factoredglobal_16
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
				material = bass_fretboard_24d_primary
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/schecter/bs_sch_inl_ld30`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
]
cas_bass_pickguards = [
	{
		desc_id = bass16_pickguard_01
		frontend_desc = qs(0xec20133c)
		mesh = `models/car_instruments/bass/esp/bass16_pickguard_01`
	}
	{
		desc_id = bs_sch_030_pga
		frontend_desc = qs(0x59db0d7a)
		mesh = `models/car_instruments/bass/schecter/bs_sch_030_pga`
	}
	{
		desc_id = bs_sch_t_pga
		frontend_desc = qs(0x743ec6bb)
		mesh = `models/car_instruments/bass/schecter/bs_sch_t_pga`
	}
	{
		desc_id = bass_pickguard_mm_sr
		frontend_desc = qs(0x3f85ecca)
		mesh = `models/car_instruments/bass/musicman/bass_pickguard_mm_sr`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/musicman/bass_mm_sr_pickguard_1_d`
				material = bass_pickguard_mm_sr_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $bass_pickguard_mm_sr1
					}
				]
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
		desc_id = bass_pkup_type1_blk_2
		frontend_desc = qs(0xcf1a182c)
		sponsor_id = emg
		mesh = `models/car_instruments/bass/esp/bass_pkup_type1_blk_2`
		materials = [
			bass_pkup_type1_blk_primary
		]
		$car_rocker_bass_factoredglobal_19
	}
	{
		desc_id = bass9_pkup_type1_blk_02
		frontend_desc = qs(0xcf1a182c)
		sponsor_id = emg
		mesh = `models/car_instruments/bass/esp/bass9_pkup_type1_blk_02`
		materials = [
			bass9_pkup_type1_blk_primary
		]
		$car_rocker_bass_factoredglobal_19
	}
	{
		desc_id = bass9_pkup_type2_blk_03
		frontend_desc = qs(0x59bd530d)
		sponsor_id = emg
		mesh = `models/car_instruments/bass/esp/bass9_pkup_type2_blk_03`
		materials = [
			bass9_pkup_type2_blk_primary
		]
		$car_rocker_bass_factoredglobal_19
	}
	{
		desc_id = bass9_pkup_type3_blk_2
		frontend_desc = qs(0x56b9a21d)
		sponsor_id = emg
		mesh = `models/car_instruments/bass/esp/bass9_pkup_type3_blk_2`
		materials = [
			bass9_pkup_type3_blk_primary
		]
		$car_rocker_bass_factoredglobal_19
	}
	{
		desc_id = bass_pickup_emg01
		frontend_desc = qs(0x48bce410)
		sponsor_id = emg
		node_meshes = {
			$bass_pickups_nodes
			placements = [
				{
					parents = [
						bass_schect_030
						ibanez_icb_body
						bas_ibz_sr505
						bas_sch_stil
						bs_sch_t_body
					]
					node_set = 1
					meshes = [
						{
							mesh = `models\car_instruments\guitar\gh5\pickups\bass_pickup_emg01`
							attach_indices = [
								1
								2
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = bas_pickup_ibz01
		frontend_desc = qs(0x6e593804)
		materials = [
			bas_pickup_ibz01_primary
		]
		sponsor_id = ibanez
		node_meshes = {
			$bass_pickups_nodes
			placements = [
				{
					parents = [
						ibanez_icb_body
						bas_ibz_sr505
					]
					node_set = 1
					meshes = [
						{
							mesh = `models\car_instruments\guitar\gh5\pickups\bas_pickup_ibz01`
							attach_indices = [
								1
								2
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = bas_ibz_pkup002
		frontend_desc = qs(0x45746bc7)
		materials = [
			bas_ibz_pkup002_primary
		]
		sponsor_id = ibanez
		chosen_materials = {
			material1 = black_1guitar
		}
		node_meshes = {
			$bass_pickups_nodes
			placements = [
				{
					parents = [
						ibanez_icb_body
						bas_ibz_sr505
					]
					node_set = 1
					meshes = [
						{
							mesh = `models\car_instruments\bass\gh5\pickups\bas_ibz_pkup002`
							attach_indices = [
								1
								2
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = bass_pickup_sd
		frontend_desc = qs(0x64554abd)
		sponsor_id = `seymour	duncan`
		materials = [
			bass_pickup_sd_primary
		]
		chosen_materials = {
			material1 = black_1guitar
		}
		node_meshes = {
			$bass_pickups_nodes
			placements = [
				{
					parents = [
						bass102_axe
						bass104_skull
						bass103_cross
					]
					node_set = 0
					meshes = [
						{
							mesh = `models\car_instruments\bass\gh5\pickups\bass_pickup_sd`
							attach_indices = [
								2
							]
						}
					]
				}
				{
					parents = [
						bass_schect_030
						bs_sch_t_body
						bas_ibz_sr505
						bas_sch_stil
						ibanez_icb_body
					]
					node_set = 1
					meshes = [
						{
							mesh = `models\car_instruments\bass\gh5\pickups\bass_pickup_sd`
							attach_indices = [
								1
							]
						}
					]
				}
				{
					parents = [
						bass15_mcswain_machine
					]
					node_set = 2
					meshes = [
						{
							mesh = `models\car_instruments\bass\gh5\pickups\bass_pickup_sd`
							attach_indices = [
								1
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = bass_mm_sr_pkup_type5
		frontend_desc = qs(0x60d78247)
		sponsor_id = `seymour	duncan`
		materials = [
			bass_pickup_sd_primary
		]
		chosen_materials = {
			material1 = black_1guitar
		}
		node_meshes = {
			$bass_pickups_nodes
			placements = [
				{
					parents = [
						bass_schect_030
						bs_sch_t_body
						bas_ibz_sr505
						bas_sch_stil
						ibanez_icb_body
						bas_ibz_sr505
					]
					node_set = 1
					meshes = [
						{
							mesh = `models\car_instruments\bass\gh5\pickups\bass_pickup_sd`
							attach_indices = [
								1
								2
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = bass_emgpickup1
		frontend_desc = qs(0xcf1a182c)
		sponsor_id = emg
		materials = [
			bass_emgpickup1_primary
		]
		chosen_materials = {
			material1 = black_1guitar
		}
		node_meshes = {
			$bass_pickups_nodes
			placements = [
				{
					parents = [
						bass102_axe
						bass104_skull
						bass103_cross
					]
					node_set = 0
					meshes = [
						{
							mesh = `models\car_instruments\bass\gh5\pickups\bass_emgpickup1`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						bass_mm_stingray
						bass_schect_030
						bs_sch_t_body
						bas_ibz_sr505
						bas_sch_stil
						ibanez_icb_body
					]
					node_set = 1
					meshes = [
						{
							mesh = `models\car_instruments\bass\gh5\pickups\bass_emgpickup1`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						bass15_mcswain_machine
					]
					node_set = 2
					meshes = [
						{
							mesh = `models\car_instruments\bass\gh5\pickups\bass_emgpickup1`
							attach_indices = [
								1
								2
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = bass_emgpickup1b
		frontend_desc = qs(0x2b570be2)
		sponsor_id = emg
		materials = [
			bass_emgpickup1_primary
		]
		chosen_materials = {
			material1 = black_1guitar
		}
		node_meshes = {
			$bass_pickups_nodes
			placements = [
				{
					parents = [
						bass102_axe
						bass104_skull
						bass103_cross
					]
					node_set = 0
					meshes = [
						{
							mesh = `models\car_instruments\bass\gh5\pickups\bass_emgpickup1`
							attach_indices = [
								1
							]
						}
					]
				}
				{
					parents = [
						bass_mm_stingray
						bs_sch_t_body
						bass_schect_030
						bas_sch_stil
						ibanez_icb_body
						bas_ibz_sr505
					]
					node_set = 1
					meshes = [
						{
							mesh = `models\car_instruments\bass\gh5\pickups\bass_emgpickup1`
							attach_indices = [
								1
							]
						}
					]
				}
				{
					parents = [
						bass15_mcswain_machine
					]
					node_set = 2
					meshes = [
						{
							mesh = `models\car_instruments\bass\gh5\pickups\bass_emgpickup1`
							attach_indices = [
								1
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = bass_emgpickup2
		frontend_desc = qs(0x3824cbe0)
		sponsor_id = emg
		materials = [
			bass_emgpickup1_primary
		]
		chosen_materials = {
			material1 = black_1guitar
		}
		node_meshes = {
			$bass_pickups_nodes
			placements = [
				{
					parents = [
						bass102_axe
						bass104_skull
						bass103_cross
					]
					node_set = 0
					meshes = [
						{
							mesh = `models\car_instruments\bass\gh5\pickups\bass_emgpickup2`
							attach_indices = [
								2
							]
						}
					]
				}
				{
					parents = [
						bass_mm_stingray
						bs_sch_t_body
						bass_schect_030
						bas_sch_stil
						ibanez_icb_body
						bas_ibz_sr505
					]
					node_set = 1
					meshes = [
						{
							mesh = `models\car_instruments\bass\gh5\pickups\bass_emgpickup2`
							attach_indices = [
								2
							]
						}
					]
				}
				{
					parents = [
						bass15_mcswain_machine
					]
					node_set = 2
					meshes = [
						{
							mesh = `models\car_instruments\bass\gh5\pickups\bass_emgpickup2`
							attach_indices = [
								2
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = bass_emgpickup2b
		frontend_desc = qs(0x6a056c5c)
		sponsor_id = emg
		materials = [
			bass_emgpickup1_primary
		]
		chosen_materials = {
			material1 = black_1guitar
		}
		node_meshes = {
			$bass_pickups_nodes
			placements = [
				{
					parents = [
						bass102_axe
						bass104_skull
						bass103_cross
					]
					node_set = 0
					meshes = [
						{
							mesh = `models\car_instruments\bass\gh5\pickups\bass_emgpickup2`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						bass_mm_stingray
						bs_sch_t_body
						bass_schect_030
						bas_sch_stil
						ibanez_icb_body
						bas_ibz_sr505
					]
					node_set = 1
					meshes = [
						{
							mesh = `models\car_instruments\bass\gh5\pickups\bass_emgpickup2`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						bass15_mcswain_machine
					]
					node_set = 2
					meshes = [
						{
							mesh = `models\car_instruments\bass\gh5\pickups\bass_emgpickup2`
							attach_indices = [
								1
								2
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = bass_emgpickup3
		frontend_desc = qs(0x59bd530d)
		sponsor_id = emg
		materials = [
			bass_emgpickup1_primary
		]
		chosen_materials = {
			material1 = black_1guitar
		}
		node_meshes = {
			$bass_pickups_nodes
			placements = [
				{
					parents = [
						bass102_axe
						bass104_skull
						bass103_cross
					]
					node_set = 0
					meshes = [
						{
							mesh = `models\car_instruments\bass\gh5\pickups\bass_emgpickup1`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models\car_instruments\bass\gh5\pickups\bass_emgpickup3`
							attach_indices = [
								2
							]
						}
					]
				}
				{
					parents = [
						bass_mm_stingray
						bs_sch_t_body
						bass_schect_030
						bas_sch_stil
						ibanez_icb_body
						bas_ibz_sr505
					]
					node_set = 1
					meshes = [
						{
							mesh = `models\car_instruments\bass\gh5\pickups\bass_emgpickup1`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models\car_instruments\bass\gh5\pickups\bass_emgpickup3`
							attach_indices = [
								2
							]
						}
					]
				}
				{
					parents = [
						bass15_mcswain_machine
					]
					node_set = 2
					meshes = [
						{
							mesh = `models\car_instruments\bass\gh5\pickups\bass_emgpickup1`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models\car_instruments\bass\gh5\pickups\bass_emgpickup3`
							attach_indices = [
								2
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = bass_emgpickup3b
		frontend_desc = qs(0xd40cf59f)
		sponsor_id = emg
		materials = [
			bass_emgpickup1_primary
		]
		chosen_materials = {
			material1 = black_1guitar
		}
		node_meshes = {
			$bass_pickups_nodes
			placements = [
				{
					parents = [
						bass102_axe
						bass104_skull
						bass103_cross
					]
					node_set = 0
					meshes = [
						{
							mesh = `models\car_instruments\bass\gh5\pickups\bass_emgpickup3`
							attach_indices = [
								2
							]
						}
					]
				}
				{
					parents = [
						bass_mm_stingray
						bs_sch_t_body
						bass_schect_030
						bas_sch_stil
						ibanez_icb_body
						bas_ibz_sr505
						bass105_pin
					]
					node_set = 1
					meshes = [
						{
							mesh = `models\car_instruments\bass\gh5\pickups\bass_emgpickup3`
							attach_indices = [
								2
							]
						}
					]
				}
				{
					parents = [
						bass15_mcswain_machine
					]
					node_set = 2
					meshes = [
						{
							mesh = `models\car_instruments\bass\gh5\pickups\bass_emgpickup3`
							attach_indices = [
								2
							]
						}
					]
				}
			]
		}
	}
]
cas_bass_knobs = [
	{
		desc_id = bs_scht_030_knob01_four
		frontend_desc = qs(0xde7b0495)
		node_meshes = {
			$bass_knobs_nodes
			placements = [
				{
					parents = [
						bass_schect_030
						ibanez_icb_body
						bas_ibz_sr505
						bas_sch_stil
						bs_sch_t_body
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/bs_scht_030_knob01`
							attach_indices = [
								1
								2
								3
								4
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = knob_knurl001
		frontend_desc = qs(0xdac78d7a)
		node_meshes = {
			$bass_knobs_nodes
			placements = [
				{
					parents = [
						bass_schect_030
						ibanez_icb_body
						bas_ibz_sr505
						bas_sch_stil
						bs_sch_t_body
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/knob_knurl001`
							attach_indices = [
								1
								2
								3
								4
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = bass_knob_tophat
		frontend_desc = qs(0x24ff7e81)
		materials = [
			bass63_knob_type2_primary
		]
		node_meshes = {
			$bass_knobs_nodes
			placements = [
				{
					parents = [
						bass_schect_030
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/bass_knob_tophat`
							attach_indices = [
								1
								2
								3
								4
							]
						}
					]
				}
				{
					parents = [
						ibanez_icb_body
						bas_ibz_sr505
						bas_sch_stil
						bs_sch_t_body
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/bass_knob_tophat`
							attach_indices = [
								1
								2
								3
								4
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = knob_knurl02
		frontend_desc = qs(0xdac78d7a)
		materials = [
			gtr_36_knobs_primary
		]
		node_meshes = {
			$bass_knobs_nodes
			placements = [
				{
					parents = [
						bas_sch_stil
						ibanez_icb_body
						bas_ibz_sr505
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/knob_knurl02`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						bass_mm_stingray
						bass_schect_030
						bs_sch_t_body
						bas_sch_stil
						ibanez_icb_body
						bas_ibz_sr505
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/knob_knurl02`
							attach_indices = [
								1
								2
								3
								4
							]
						}
					]
				}
				{
					parents = [
						bs_sch_t_body
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/knob_knurl02`
							attach_indices = [
								1
								2
								3
							]
						}
					]
				}
				{
					parents = [
						bas_ibz_sr505
					]
					node_set = 4
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/knob_knurl02`
							attach_indices = [
								1
								2
								3
								4
								5
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = bass_knob_01
		frontend_desc = qs(0x2a068a61)
		materials = [
			bass_knob_01_primary
		]
		node_meshes = {
			$bass_knobs_nodes
			placements = [
				{
					parents = [
						bass15_mcswain_machine
						ibanez_icb_body
						bas_ibz_sr505
						bass102_axe
						bass104_skull
						bass105_pin
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass_knob_01`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						bass103_cross
						bs_sch_t_body
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass_knob_01`
							attach_indices = [
								1
								2
								3
							]
						}
					]
				}
				{
					parents = [
						bass_schect_030
						bass_mm_stingray
						bas_sch_stil
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass_knob_01`
							attach_indices = [
								1
								2
								3
								4
							]
						}
					]
				}
				{
					parents = [
						bas_ibz_sr505
					]
					node_set = 4
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass_knob_01`
							attach_indices = [
								1
								2
								3
								4
								5
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = bass_knob_02
		frontend_desc = qs(0x5593d6d0)
		materials = [
			bass_knob_02_primary
		]
		node_meshes = {
			$bass_knobs_nodes
			placements = [
				{
					parents = [
						bass15_mcswain_machine
						bas_sch_stil
						ibanez_icb_body
						bas_ibz_sr505
						bass102_axe
						bass104_skull
						bass105_pin
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass_knob_02`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						bass103_cross
						bs_sch_t_body
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass_knob_02`
							attach_indices = [
								1
								2
								3
							]
						}
					]
				}
				{
					parents = [
						bass_schect_030
						bass_mm_stingray
						bas_sch_stil
						ibanez_icb_body
						bas_ibz_sr505
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass_knob_02`
							attach_indices = [
								1
								2
								3
								4
							]
						}
					]
				}
				{
					parents = [
						bas_ibz_sr505
					]
					node_set = 4
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass_knob_02`
							attach_indices = [
								1
								2
								3
								4
								5
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = bass_knob_03
		frontend_desc = qs(0x6b3ddd60)
		materials = [
			bass_knob_03_primary
		]
		node_meshes = {
			$bass_knobs_nodes
			placements = [
				{
					parents = [
						bass15_mcswain_machine
						bas_sch_stil
						ibanez_icb_body
						bas_ibz_sr505
						bass102_axe
						bass104_skull
						bass105_pin
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass_knob_03`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						bass103_cross
						bs_sch_t_body
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass_knob_03`
							attach_indices = [
								1
								2
								3
							]
						}
					]
				}
				{
					parents = [
						bass_schect_030
						bass_mm_stingray
						bas_sch_stil
						ibanez_icb_body
						bas_ibz_sr505
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass_knob_03`
							attach_indices = [
								1
								2
								3
								4
							]
						}
					]
				}
				{
					parents = [
						bas_ibz_sr505
					]
					node_set = 4
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass_knob_03`
							attach_indices = [
								1
								2
								3
								4
								5
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = bass_knob_04
		frontend_desc = qs(0xbdf0bd59)
		materials = [
			bass_knob_04_primary
		]
		node_meshes = {
			$bass_knobs_nodes
			placements = [
				{
					parents = [
						bass15_mcswain_machine
						bas_sch_stil
						ibanez_icb_body
						bas_ibz_sr505
						bass102_axe
						bass104_skull
						bass105_pin
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass_knob_04`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						bass103_cross
						bs_sch_t_body
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass_knob_04`
							attach_indices = [
								1
								2
								3
							]
						}
					]
				}
				{
					parents = [
						bass_schect_030
						bass_mm_stingray
						bas_sch_stil
						ibanez_icb_body
						bas_ibz_sr505
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass_knob_04`
							attach_indices = [
								1
								2
								3
								4
							]
						}
					]
				}
				{
					parents = [
						bas_ibz_sr505
					]
					node_set = 4
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass_knob_04`
							attach_indices = [
								1
								2
								3
								4
								5
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = bass_knob_05
		frontend_desc = qs(0x4a3737b3)
		materials = [
			bass_knob_05_primary
		]
		node_meshes = {
			$bass_knobs_nodes
			placements = [
				{
					parents = [
						bass15_mcswain_machine
						bas_sch_stil
						ibanez_icb_body
						bas_ibz_sr505
						bass102_axe
						bass104_skull
						bass105_pin
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass_knob_05`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						bass103_cross
						bs_sch_t_body
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass_knob_05`
							attach_indices = [
								1
								2
								3
							]
						}
					]
				}
				{
					parents = [
						bass_schect_030
						bass_mm_stingray
						bas_sch_stil
						ibanez_icb_body
						bas_ibz_sr505
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass_knob_05`
							attach_indices = [
								1
								2
								3
								4
							]
						}
					]
				}
				{
					parents = [
						bas_ibz_sr505
					]
					node_set = 4
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass_knob_05`
							attach_indices = [
								1
								2
								3
								4
								5
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = bass_knob_06
		frontend_desc = qs(0x8ae89cb9)
		materials = [
			bass_knob_06_primary
		]
		node_meshes = {
			$bass_knobs_nodes
			placements = [
				{
					parents = [
						bass15_mcswain_machine
						bas_sch_stil
						ibanez_icb_body
						bas_ibz_sr505
						bass102_axe
						bass104_skull
						bass105_pin
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass_knob_06`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						bass103_cross
						bs_sch_t_body
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass_knob_06`
							attach_indices = [
								1
								2
								3
							]
						}
					]
				}
				{
					parents = [
						bass_schect_030
						bass_mm_stingray
						bas_sch_stil
						ibanez_icb_body
						bas_ibz_sr505
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass_knob_06`
							attach_indices = [
								1
								2
								3
								4
							]
						}
					]
				}
				{
					parents = [
						bas_ibz_sr505
					]
					node_set = 4
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass_knob_06`
							attach_indices = [
								1
								2
								3
								4
								5
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = bass_knob_07
		frontend_desc = qs(0x794033c5)
		materials = [
			bass_knob_07_primary
		]
		node_meshes = {
			$bass_knobs_nodes
			placements = [
				{
					parents = [
						bass15_mcswain_machine
						bas_sch_stil
						ibanez_icb_body
						bas_ibz_sr505
						bass102_axe
						bass104_skull
						bass105_pin
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass_knob_07`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						bass103_cross
						bs_sch_t_body
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass_knob_07`
							attach_indices = [
								1
								2
								3
							]
						}
					]
				}
				{
					parents = [
						bass_schect_030
						bass_mm_stingray
						bas_sch_stil
						ibanez_icb_body
						bas_ibz_sr505
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass_knob_07`
							attach_indices = [
								1
								2
								3
								4
							]
						}
					]
				}
				{
					parents = [
						bas_ibz_sr505
					]
					node_set = 4
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass_knob_07`
							attach_indices = [
								1
								2
								3
								4
								5
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = bass_knob_08
		frontend_desc = qs(0x655796b4)
		materials = [
			bass_knob_08_primary
		]
		node_meshes = {
			$bass_knobs_nodes
			placements = [
				{
					parents = [
						bass15_mcswain_machine
						bas_sch_stil
						ibanez_icb_body
						bas_ibz_sr505
						bass102_axe
						bass104_skull
						bass105_pin
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass_knob_08`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						bass103_cross
						bs_sch_t_body
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass_knob_08`
							attach_indices = [
								1
								2
								3
							]
						}
					]
				}
				{
					parents = [
						bass_schect_030
						bass_mm_stingray
						bas_sch_stil
						ibanez_icb_body
						bas_ibz_sr505
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass_knob_08`
							attach_indices = [
								1
								2
								3
								4
							]
						}
					]
				}
				{
					parents = [
						bas_ibz_sr505
					]
					node_set = 4
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass_knob_08`
							attach_indices = [
								1
								2
								3
								4
								5
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = bass_knob_09
		frontend_desc = qs(0x1f3d4f54)
		materials = [
			bass_knob_09_primary
		]
		node_meshes = {
			$bass_knobs_nodes
			placements = [
				{
					parents = [
						bass15_mcswain_machine
						bas_sch_stil
						ibanez_icb_body
						bas_ibz_sr505
						bass102_axe
						bass104_skull
						bass105_pin
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass_knob_09`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						bass103_cross
						bs_sch_t_body
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass_knob_09`
							attach_indices = [
								1
								2
								3
							]
						}
					]
				}
				{
					parents = [
						bass_schect_030
						bass_mm_stingray
						bas_sch_stil
						ibanez_icb_body
						bas_ibz_sr505
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass_knob_09`
							attach_indices = [
								1
								2
								3
								4
							]
						}
					]
				}
				{
					parents = [
						bas_ibz_sr505
					]
					node_set = 4
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass_knob_09`
							attach_indices = [
								1
								2
								3
								4
								5
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = bass_knob_10
		frontend_desc = qs(0x8ce8c0b3)
		materials = [
			bass_knob_10_primary
			bs_sch_t_body
		]
		node_meshes = {
			$bass_knobs_nodes
			placements = [
				{
					parents = [
						bass15_mcswain_machine
						bas_sch_stil
						ibanez_icb_body
						bas_ibz_sr505
						bass102_axe
						bass104_skull
						bass105_pin
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass_knob_10`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						bass103_cross
						bs_sch_t_body
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass_knob_10`
							attach_indices = [
								1
								2
								3
							]
						}
					]
				}
				{
					parents = [
						bass_schect_030
						bass_mm_stingray
						bas_sch_stil
						ibanez_icb_body
						bas_ibz_sr505
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass_knob_10`
							attach_indices = [
								1
								2
								3
								4
							]
						}
					]
				}
				{
					parents = [
						bas_ibz_sr505
					]
					node_set = 4
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass_knob_10`
							attach_indices = [
								1
								2
								3
								4
								5
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = bass9_esp_knob_10_04
		frontend_desc = qs(0xfe3916b5)
		mesh = `models/car_instruments/bass/esp/bass9_esp_knob_10_04`
		materials = [
			bass9_esp_knob_10_primary
		]
	}
	{
		desc_id = bass9_knob_02
		frontend_desc = qs(0x8f2cae0b)
		mesh = `models/car_instruments/bass/esp/bass9_knob_02`
		materials = [
			bass9_knob_02_primary
		]
	}
	{
		desc_id = bass9_knob_03
		frontend_desc = qs(0x4e6b4489)
		mesh = `models/car_instruments/bass/esp/bass9_knob_03`
		materials = [
			bass9_knob_03_primary
		]
	}
	{
		desc_id = bass9_knob_04
		frontend_desc = qs(0xc99e6543)
		mesh = `models/car_instruments/bass/esp/bass9_knob_04`
		materials = [
			bass9_knob_04_primary
		]
	}
	{
		desc_id = bass9_knob_05
		frontend_desc = qs(0x8ae89cb9)
		mesh = `models/car_instruments/bass/esp/bass9_knob_05`
		materials = [
			bass9_knob_05_primary
		]
	}
	{
		desc_id = bass14_esp_knob_10_04
		frontend_desc = qs(0xc1a0c062)
		mesh = `models/car_instruments/bass/esp/bass14_esp_knob_10_04`
		materials = [
			bass14_esp_knob_10_primary
		]
	}
	{
		desc_id = bass14_knob_02
		frontend_desc = qs(0x8f2cae0b)
		mesh = `models/car_instruments/bass/esp/bass14_knob_02`
		materials = [
			bass14_knob_02_primary
		]
	}
	{
		desc_id = bass14_knob_03
		frontend_desc = qs(0x4e6b4489)
		mesh = `models/car_instruments/bass/esp/bass14_knob_03`
		materials = [
			bass14_knob_03_primary
		]
	}
	{
		desc_id = bass14_knob_04
		frontend_desc = qs(0xc99e6543)
		mesh = `models/car_instruments/bass/esp/bass14_knob_04`
		materials = [
			bass14_knob_04_primary
		]
	}
	{
		desc_id = bass14_knob_05
		frontend_desc = qs(0x8ae89cb9)
		mesh = `models/car_instruments/bass/esp/bass14_knob_05`
		materials = [
			bass14_knob_05_primary
		]
	}
	{
		desc_id = bass17_esp_knob_10
		frontend_desc = qs(0x03825db3)
		mesh = `models/car_instruments/bass/esp/bass17_esp_knob_10`
		materials = [
			bass17_esp_knob_10_primary
		]
	}
	{
		desc_id = bass17_knob_02
		frontend_desc = qs(0x8f2cae0b)
		mesh = `models/car_instruments/bass/esp/bass17_knob_02`
		materials = [
			bass17_knob_02_primary
		]
	}
	{
		desc_id = bass17_knob_03
		frontend_desc = qs(0x4e6b4489)
		mesh = `models/car_instruments/bass/esp/bass17_knob_03`
		materials = [
			bass17_knob_03_primary
		]
	}
	{
		desc_id = bass17_knob_04
		frontend_desc = qs(0xc99e6543)
		mesh = `models/car_instruments/bass/esp/bass17_knob_04`
		materials = [
			bass17_knob_04_primary
		]
	}
	{
		desc_id = bass17_knob_05
		frontend_desc = qs(0x8ae89cb9)
		mesh = `models/car_instruments/bass/esp/bass17_knob_05`
		materials = [
			bass17_knob_05_primary
		]
	}
	{
		desc_id = bass64_esp_knob_01
		frontend_desc = qs(0x34c902b4)
		mesh = `models/car_instruments/bass/esp/bass64_esp_knob_01`
		materials = [
			bass64_esp_knob_01_primary
		]
	}
	{
		desc_id = bass64_esp_knob_02
		frontend_desc = qs(0x8f2cae0b)
		mesh = `models/car_instruments/bass/esp/bass64_esp_knob_02`
		materials = [
			bass64_esp_knob_02_primary
		]
	}
	{
		desc_id = bass64_esp_knob_03
		frontend_desc = qs(0x4e6b4489)
		mesh = `models/car_instruments/bass/esp/bass64_esp_knob_03`
		materials = [
			bass64_esp_knob_03_primary
		]
	}
	{
		desc_id = bass64_esp_knob_04
		frontend_desc = qs(0xc99e6543)
		mesh = `models/car_instruments/bass/esp/bass64_esp_knob_04`
		materials = [
			bass64_esp_knob_04_primary
		]
	}
	{
		desc_id = bass64_esp_knob_05
		frontend_desc = qs(0x8ae89cb9)
		mesh = `models/car_instruments/bass/esp/bass64_esp_knob_05`
		materials = [
			bass64_esp_knob_05_primary
		]
	}
	{
		desc_id = bass63_knob_type1
		frontend_desc = qs(0x34c902b4)
		mesh = `models/car_instruments/bass/esp/bass63_knob_type1`
		materials = [
			bass63_knob_type1_primary
		]
	}
	{
		desc_id = bass63_knob_type2
		frontend_desc = qs(0x8f2cae0b)
		mesh = `models/car_instruments/bass/esp/bass63_knob_type2`
		materials = [
			bass63_knob_type2_primary
		]
	}
	{
		desc_id = bass63_knob_type3
		frontend_desc = qs(0x4e6b4489)
		mesh = `models/car_instruments/bass/esp/bass63_knob_type3`
		materials = [
			bass63_knob_type3_primary
		]
	}
	{
		desc_id = bass63_knob_type4
		frontend_desc = qs(0xc99e6543)
		mesh = `models/car_instruments/bass/esp/bass63_knob_type4`
		materials = [
			bass63_knob_type4_primary
		]
	}
	{
		desc_id = bass63_knob_type5
		frontend_desc = qs(0x8ae89cb9)
		mesh = `models/car_instruments/bass/esp/bass63_knob_type5`
		materials = [
			bass63_knob_type5_primary
		]
	}
	{
		desc_id = bs_scht_030_knob01
		frontend_desc = qs(0xb4fb57dd)
		mesh = `models/car_instruments/bass/esp/bs_scht_030_knob01`
		materials = [
			gtr4_esp_knob_10_03_primary
		]
	}
]
cas_bass_bridges = [
	{
		desc_id = bs_sch_brdg_a
		frontend_desc = qs(0x640f2f2a)
		bass_string_start = bs_sch_brdg_a_str_start_properties
		bass_string_end = default_bass_string_end_properties
		materials = [
			schec_brdg_001_primary
		]
		node_meshes = {
			$bass_bridges_nodes
			placements = [
				{
					parents = [
						bass_schect_030
						bas_sch_stil
						bs_sch_t_body
						bass102_axe
						bass103_cross
						bass104_skull
						bass105_pin
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/bridges/bs_sch_brdg_a`
							attach_indices = [
								1
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = bas_brdg_sch_t
		frontend_desc = qs(0xff589880)
		bass_string_start = bas_brdg_sch_t_str_start_properties
		bass_string_end = default_bass_string_end_properties
		materials = [
			ibz_brdg_001_primary
		]
		node_meshes = {
			$bass_bridges_nodes
			placements = [
				{
					parents = [
						bass_schect_030
						bas_sch_stil
						bs_sch_t_body
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/bridges/bas_brdg_sch_t`
							attach_indices = [
								1
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = bas_brdg_capsule
		frontend_desc = qs(0xf143ea7f)
		bass_string_start = bas_brdg_capsule_str_start_properties
		bass_string_end = default_bass_string_end_properties
		materials = [
			bas_brdg_capsule_primary
		]
		node_meshes = {
			$bass_bridges_nodes
			placements = [
				{
					parents = [
						bass_schect_030
						bas_sch_stil
						bs_sch_t_body
						bas_ibz_sr505
						ibanez_icb_body
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/bridges/bas_brdg_capsule`
							attach_indices = [
								1
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = bas_brdg_ibz01
		frontend_desc = qs(0x01026d5e)
		bass_string_start = bas_brdg_ibz01_str_start_properties
		bass_string_end = default_bass_string_end_properties
		materials = [
			ibz_brdg_001_primary
		]
		node_meshes = {
			$bass_bridges_nodes
			placements = [
				{
					parents = [
						bas_ibz_sr505
						ibanez_icb_body
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/bridges/bas_brdg_ibz01`
							attach_indices = [
								1
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = bas_brdg_sch_t2
		frontend_desc = qs(0x03dc6033)
		bass_string_start = bas_brdg_sch_t2_str_start_properties
		bass_string_end = default_bass_string_end_properties
		materials = [
			ibz_brdg_001_primary
		]
		node_meshes = {
			$bass_bridges_nodes
			placements = [
				{
					parents = [
						bas_ibz_sr505
						ibanez_icb_body
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/bridges/bas_brdg_sch_t`
							attach_indices = [
								1
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = bas_brdg_sch_c
		frontend_desc = qs(0xeb24bcfe)
		bass_string_start = bas_brdg_sch_c_str_start_properties
		bass_string_end = default_bass_string_end_properties
		materials = [
			bas_brdg_capsule_primary
		]
		node_meshes = {
			$bass_bridges_nodes
			placements = [
				{
					parents = [
						bass_schect_030
						bas_sch_stil
						bs_sch_t_body
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/bridges/bas_brdg_sch_c`
							attach_indices = [
								1
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = bas_brdg_ibz_mono
		frontend_desc = qs(0x3dd0e964)
		bass_string_start = bas_brdg_sch_c_str_start_properties
		bass_string_end = default_bass_string_end_properties
		materials = [
			bas_brdg_ibz_mono_primary
		]
		node_meshes = {
			$bass_bridges_nodes
			placements = [
				{
					parents = [
						bas_ibz_sr505
						ibanez_icb_body
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/bridges/bas_brdg_ibz_mono`
							attach_indices = [
								1
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = bass9_bridge_4str_01
		frontend_desc = qs(0x55d4c28a)
		mesh = `models/car_instruments/bass/esp/bass9_bridge_4str_01`
		materials = [
			bass9_bridge_4str_01_primary
		]
		bass_string_start = bass9_bridge1_4str_start_properties
		bass_string_end = bass9_bridge1_4str_end_properties
	}
	{
		desc_id = bass13_bridge_4str
		frontend_desc = qs(0xe444c3ff)
		mesh = `models/car_instruments/bass/esp/bass13_bridge_4str`
		materials = [
			bass13_bridge_4str_primary
		]
		bass_string_start = bass9_bridge1_4str_start_properties
		bass_string_end = bass9_bridge1_4str_end_properties
	}
	{
		desc_id = bass14_bridge_4str_01
		frontend_desc = qs(0xd995dfde)
		mesh = `models/car_instruments/bass/esp/bass14_bridge_4str_01`
		materials = [
			bass14_bridge_4str_01_primary
		]
		bass_string_start = bass14ex_bridge1_4str_start_properties
		bass_string_end = bass14_bridge1_4str_end_properties
	}
	{
		desc_id = bass14_bridge_4str_02
		frontend_desc = qs(0xf2b88c1d)
		mesh = `models/car_instruments/bass/esp/bass14_bridge_4str_02`
		materials = [
			bass14_bridge_4str_02_primary
		]
		bass_string_start = bass14_bridge1_4str_start_properties
		bass_string_end = bass14_bridge1_4str_end_properties
	}
	{
		desc_id = bass17_bridge_4str_04
		frontend_desc = qs(0xb171d66e)
		mesh = `models/car_instruments/bass/esp/bass17_bridge_4str_04`
		materials = [
			bass17_bridge_4str_04_primary
		]
		bass_string_start = bass14_bridge1_4str_start_properties
		bass_string_end = bass14_bridge1_4str_end_properties
	}
	{
		desc_id = bass17_bridge_4str_05
		frontend_desc = qs(0x9a5c85ad)
		mesh = `models/car_instruments/bass/esp/bass17_bridge_4str_05`
		materials = [
			bass17_bridge_4str_05_primary
		]
		bass_string_start = bass14_bridge1_4str_start_properties
		bass_string_end = bass14_bridge1_4str_end_properties
	}
	{
		desc_id = bass9_bridge_4str_01b
		frontend_desc = qs(0x55d4c28a)
		mesh = `models/car_instruments/bass/esp/bass9_bridge_4str_01b`
		materials = [
			bass9_bridge_4str_01b_primary
		]
		bass_string_start = bass9_bridge_4str_01b_start_properties
		bass_string_end = bass9_bridge_4str_01b_end_properties
	}
	{
		desc_id = bass15_bridge_mcswain1
		frontend_desc = qs(0x33574946)
		materials = [
			bass15_bridge_mcswain1_primary
		]
		bass_string_start = bass_mcswn_4str_start_properties
		bass_string_end = bass_mcswn_4str_end_properties
		node_meshes = {
			$bass_bridges_nodes
			placements = [
				{
					parents = [
						bass15_mcswain_machine
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/bridges/bass15_bridge_mcswain1`
							attach_indices = [
								1
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = bass_mm_bridge_sr_1
		frontend_desc = qs(0x86a2f3b5)
		materials = [
			bass_mm_bridge_sr_1_primary
		]
		bass_string_start = bass_mmbridge1_4str_start_properties
		bass_string_end = bass_mmbridge1_4str_end_properties
		node_meshes = {
			$bass_bridges_nodes
			placements = [
				{
					parents = [
						bass_mm_stingray
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/bass/musicman/bass_mm_bridge_sr_1`
							attach_indices = [
								1
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = bass100_bridge
		frontend_desc = qs(0x684038fc)
		materials = [
			bass100_bridge_primary
		]
		bass_string_start = bass100_brdg_4str_start_properties
		node_meshes = {
			$bass_bridges_nodes
			placements = [
				{
					parents = [
						bass102_axe
						bass104_skull
						bass103_cross
						bass105_pin
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/bass/heroes/bass100_bridge`
							attach_indices = [
								1
							]
						}
					]
				}
			]
		}
	}
]
cas_bass_head = [
	{
		desc_id = bass15_neckhead_mcswain11
		frontend_desc = qs(0xc2e7c0f1)
		sponsor_id = mcswain
		mesh = `models/car_instruments/bass/mcswain/bass15_neckhead_mcswain1`
		materials = [
			bass15_neckhead_mcswain1_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/mcswain/bass15_neckhead_machine_d`
				material = bass15_neckhead_mcswain1_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $bass15_mcswn_nkhd_finishes
					}
					{
						$preset_layer_fades
						mask = $bass15_mcswn_nkhd_fades
					}
					{
						$preset_layer_details
						mask = $bass15_mcswn_nkhd_details
					}
				]
				$car_rocker_bass_factoredglobal_55
			}
		]
	}
	{
		desc_id = bass_mm_neckhead_1
		frontend_desc = qs(0xc6739ae3)
		sponsor_id = `music	man`
		mesh = `models/car_instruments/bass/musicman/bass_mm_neckhead_1`
		materials = [
			bass_mm_neckhead_sr1_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/musicman/bass_mm_sr_neckhead_1_d`
				material = bass_mm_neckhead_sr1_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $bass_mm_nkhd1_finishes
					}
					{
						$preset_layer_fades
						mask = $bass_mm_nkhd1_fades
					}
					{
						$preset_layer_details
						mask = $bass_mm_nkhd1_details
					}
				]
				$car_rocker_bass_factoredglobal_55
			}
		]
	}
	{
		desc_id = bass9_neckhead_01
		frontend_desc = qs(0xeed02a85)
		sponsor_id = esp
		mesh = `models/car_instruments/bass/esp/bass9_neckhead_01`
		materials = [
			bass9_neckhead_01_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass9_neckhead_d`
				material = bass9_neckhead_01_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_esp_neckhead_ax_finishes
					}
					{
						$preset_layer_fades
						mask = $cab_esp_neckhead_ax_fades
					}
					{
						$preset_layer_details
						mask = $cab_esp_neckhead_ax_details
					}
				]
				$car_rocker_bass_factoredglobal_56
			}
		]
	}
	{
		desc_id = bass9_neckhead_02
		frontend_desc = qs(0x9cd34835)
		sponsor_id = esp
		mesh = `models/car_instruments/bass/esp/bass9_neckhead_02`
		materials = [
			bass9_neckhead_02_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass9_neckhead_d_02`
				material = bass9_neckhead_02_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_esp_neckhead_standard_finishes
					}
					{
						$preset_layer_fades
						mask = $cab_esp_neckhead_standard_fades
					}
					{
						$preset_layer_details
						mask = $cab_esp_neckhead_standard_details
					}
				]
				$car_rocker_bass_factoredglobal_56
			}
		]
	}
	{
		desc_id = bass9_neckhead_03
		frontend_desc = qs(0x5194cc1c)
		sponsor_id = esp
		mesh = `models/car_instruments/bass/esp/bass9_neckhead_03`
		materials = [
			bass9_neckhead_03_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass9_neckhead_d_03`
				material = bass9_neckhead_03_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_esp_neckhead_flagship_finishes
					}
					{
						$preset_layer_fades
						mask = $cab_esp_neckhead_flagship_fades
					}
					{
						$preset_layer_details
						mask = $cab_esp_neckhead_flagship_details
					}
				]
				$car_rocker_bass_factoredglobal_56
			}
		]
	}
	{
		desc_id = bass9_neckhead_04
		frontend_desc = qs(0xd3e7edae)
		sponsor_id = esp
		mesh = `models/car_instruments/bass/esp/bass9_neckhead_04`
		materials = [
			bass9_neckhead_04_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass9_neckhead_d_04`
				material = bass9_neckhead_04_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_esp_nckhd_surveyor_finishes
					}
					{
						$preset_layer_fades
						mask = $cab_esp_nckhd_surveyor_fades
					}
					{
						$preset_layer_details
						mask = $cab_esp_nckhd_surveyor_details
					}
				]
				$car_rocker_bass_factoredglobal_57
			}
		]
	}
	{
		desc_id = bass9_neckhead_05
		frontend_desc = qs(0x59425cea)
		sponsor_id = esp
		mesh = `models/car_instruments/bass/esp/bass9_neckhead_05`
		materials = [
			bass9_neckhead_05_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass9_neckhead_d_05`
				material = bass9_neckhead_05_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_esp_nckhd_wedge_finishes
					}
					{
						$preset_layer_fades
						mask = $cab_esp_nckhd_wedge_fades
					}
					{
						$preset_layer_details
						mask = $cab_esp_nckhd_wedge_details
					}
				]
				$car_rocker_bass_factoredglobal_57
			}
		]
	}
	{
		desc_id = bass14_neckhead_01
		frontend_desc = qs(0xeed02a85)
		sponsor_id = esp
		mesh = `models/car_instruments/bass/esp/bass14_neckhead_01`
		materials = [
			bass14_neckhead_01_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass9_neckhead_d`
				material = bass14_neckhead_01_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_esp_neckhead_ax_finishes
					}
					{
						$preset_layer_fades
						mask = $cab_esp_neckhead_ax_fades
					}
					{
						$preset_layer_details
						mask = $cab_esp_neckhead_ax_details
					}
				]
				$car_rocker_bass_factoredglobal_56
			}
		]
	}
	{
		desc_id = bass14_neckhead_02
		frontend_desc = qs(0x9cd34835)
		sponsor_id = esp
		mesh = `models/car_instruments/bass/esp/bass14_neckhead_02`
		materials = [
			bass14_neckhead_02_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass9_neckhead_d_02`
				material = bass14_neckhead_02_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_esp_neckhead_standard_finishes
					}
					{
						$preset_layer_fades
						mask = $cab_esp_neckhead_standard_fades
					}
					{
						$preset_layer_details
						mask = $cab_esp_neckhead_standard_details
					}
				]
				$car_rocker_bass_factoredglobal_56
			}
		]
	}
	{
		desc_id = bass14_neckhead_03
		frontend_desc = qs(0x5194cc1c)
		sponsor_id = esp
		mesh = `models/car_instruments/bass/esp/bass14_neckhead_03`
		materials = [
			bass14_neckhead_03_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass9_neckhead_d_03`
				material = bass14_neckhead_03_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_esp_neckhead_flagship_finishes
					}
					{
						$preset_layer_fades
						mask = $cab_esp_neckhead_flagship_fades
					}
					{
						$preset_layer_details
						mask = $cab_esp_neckhead_flagship_details
					}
				]
				$car_rocker_bass_factoredglobal_56
			}
		]
	}
	{
		desc_id = bass14_neckhead_04
		frontend_desc = qs(0xd3e7edae)
		sponsor_id = esp
		mesh = `models/car_instruments/bass/esp/bass14_neckhead_04`
		materials = [
			bass14_neckhead_04_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass9_neckhead_d_04`
				material = bass14_neckhead_04_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_esp_nckhd_surveyor_finishes
					}
					{
						$preset_layer_fades
						mask = $cab_esp_nckhd_surveyor_fades
					}
					{
						$preset_layer_details
						mask = $cab_esp_nckhd_surveyor_details
					}
				]
				$car_rocker_bass_factoredglobal_57
			}
		]
	}
	{
		desc_id = bass14_neckhead_05
		frontend_desc = qs(0x59425cea)
		sponsor_id = esp
		mesh = `models/car_instruments/bass/esp/bass14_neckhead_05`
		materials = [
			bass14_neckhead_05_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass9_neckhead_d_05`
				material = bass14_neckhead_05_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_esp_nckhd_wedge_finishes
					}
					{
						$preset_layer_fades
						mask = $cab_esp_nckhd_wedge_fades
					}
					{
						$preset_layer_details
						mask = $cab_esp_nckhd_wedge_details
					}
				]
				$car_rocker_bass_factoredglobal_57
			}
		]
	}
	{
		desc_id = bass63_neckhead
		frontend_desc = qs(0x59425cea)
		sponsor_id = esp
		mesh = `models/car_instruments/bass/esp/bass63_neckhead`
		materials = [
			bass63_neckhead_primary
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass63_neckhead_d`
				material = bass63_neckhead_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $bass63_neckhead_finishes
					}
					{
						$preset_layer_fades
						mask = $bass63_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $bass63_neckhead_details
					}
				]
				$car_rocker_bass_factoredglobal_57
			}
		]
	}
	{
		desc_id = bass63_neckhead_02
		frontend_desc = qs(0x92a23c9d)
		sponsor_id = esp
		mesh = `models/car_instruments/bass/esp/bass63_neckhead_02`
		materials = [
			bass63_neckhead_02_primary
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass64_neckhead_d`
				material = bass63_neckhead_02_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $bass64_neckhead_finishes
					}
					{
						$preset_layer_fades
						mask = $bass64_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $bass64_neckhead_details
					}
				]
				$car_rocker_bass_factoredglobal_56
			}
		]
	}
	{
		desc_id = bass63_neckhead_03
		frontend_desc = qs(0xeed02a85)
		sponsor_id = esp
		mesh = `models/car_instruments/bass/esp/bass63_neckhead_03`
		materials = [
			bass63_neckhead_03_primary
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass9_neckhead_d`
				material = bass63_neckhead_03_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_esp_neckhead_ax_finishes
					}
					{
						$preset_layer_fades
						mask = $cab_esp_neckhead_ax_fades
					}
					{
						$preset_layer_details
						mask = $cab_esp_neckhead_ax_details
					}
				]
				$car_rocker_bass_factoredglobal_56
			}
		]
	}
	{
		desc_id = bass64_neckhead
		frontend_desc = qs(0x92a23c9d)
		sponsor_id = esp
		mesh = `models/car_instruments/bass/esp/bass64_neckhead`
		materials = [
			bass64_neckhead_primary
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass64_neckhead_d`
				material = bass64_neckhead_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $bass64_neckhead_finishes
					}
					{
						$preset_layer_fades
						mask = $bass64_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $bass64_neckhead_details
					}
				]
				$car_rocker_bass_factoredglobal_56
			}
		]
	}
	{
		desc_id = bass63_neckhead_04
		frontend_desc = qs(0xd3e7edae)
		sponsor_id = esp
		mesh = `models/car_instruments/bass/esp/bass63_neckhead_04`
		materials = [
			bass63_neckhead_04_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass9_neckhead_d_04`
				material = bass63_neckhead_04_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_esp_nckhd_surveyor_finishes
					}
					{
						$preset_layer_fades
						mask = $cab_esp_nckhd_surveyor_fades
					}
					{
						$preset_layer_details
						mask = $cab_esp_nckhd_surveyor_details
					}
				]
				$car_rocker_bass_factoredglobal_57
			}
		]
	}
	{
		desc_id = bass63_neckhead_05
		frontend_desc = qs(0x5194cc1c)
		sponsor_id = esp
		mesh = `models/car_instruments/bass/esp/bass63_neckhead_05`
		materials = [
			bass63_neckhead_05_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass9_neckhead_d_03`
				material = bass63_neckhead_05_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_esp_neckhead_flagship_finishes
					}
					{
						$preset_layer_fades
						mask = $cab_esp_neckhead_flagship_fades
					}
					{
						$preset_layer_details
						mask = $cab_esp_neckhead_flagship_details
					}
				]
				$car_rocker_bass_factoredglobal_56
			}
		]
	}
	{
		desc_id = bass64_neckhead_02
		frontend_desc = qs(0x59425cea)
		sponsor_id = esp
		mesh = `models/car_instruments/bass/esp/bass64_neckhead_02`
		materials = [
			bass64_neckhead_02_primary
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass63_neckhead_d`
				material = bass64_neckhead_02_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $bass63_neckhead_finishes
					}
					{
						$preset_layer_fades
						mask = $bass63_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $bass63_neckhead_details
					}
				]
				$car_rocker_bass_factoredglobal_57
			}
		]
	}
	{
		desc_id = bass64_neckhead_03
		frontend_desc = qs(0xeed02a85)
		sponsor_id = esp
		mesh = `models/car_instruments/bass/esp/bass64_neckhead_03`
		materials = [
			bass64_neckhead_03_primary
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass9_neckhead_02_d`
				material = bass64_neckhead_03_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_esp_neckhead_ax_finishes
					}
					{
						$preset_layer_fades
						mask = $cab_esp_neckhead_ax_fades
					}
					{
						$preset_layer_details
						mask = $cab_esp_neckhead_ax_details
					}
				]
				$car_rocker_bass_factoredglobal_56
			}
		]
	}
	{
		desc_id = bass64_neckhead_04
		frontend_desc = qs(0xd3e7edae)
		sponsor_id = esp
		mesh = `models/car_instruments/bass/esp/bass64_neckhead_04`
		materials = [
			bass64_neckhead_04_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass9_neckhead_d_04`
				material = bass64_neckhead_04_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_esp_nckhd_surveyor_finishes
					}
					{
						$preset_layer_fades
						mask = $cab_esp_nckhd_surveyor_fades
					}
					{
						$preset_layer_details
						mask = $cab_esp_nckhd_surveyor_details
					}
				]
				$car_rocker_bass_factoredglobal_57
			}
		]
		locked
	}
	{
		desc_id = bass64_neckhead_05
		frontend_desc = qs(0x5194cc1c)
		sponsor_id = esp
		mesh = `models/car_instruments/bass/esp/bass64_neckhead_05`
		materials = [
			bass64_neckhead_05_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass9_neckhead_d_03`
				material = bass64_neckhead_05_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_esp_neckhead_flagship_finishes
					}
					{
						$preset_layer_fades
						mask = $cab_esp_neckhead_flagship_fades
					}
					{
						$preset_layer_details
						mask = $cab_esp_neckhead_flagship_details
					}
				]
				$car_rocker_bass_factoredglobal_56
			}
		]
	}
	{
		desc_id = bs_sch_030_nhead01
		frontend_desc = qs(0x59db0d7a)
		sponsor_id = schecter
		mesh = `models/car_instruments/bass/schecter/bs_sch_030_nhead01`
		materials = [
			bass_neckhead_030_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/schecter/bass_neckhead_030`
				material = bass_neckhead_030_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_schec_nhead_004_finishes
					}
					{
						$preset_layer_details
						mask = $cab_schec_nhead_004_details
					}
					{
						$preset_layer_fades
						mask = $cab_schec_nhead_004_fades
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_270
					initial_values = {
						x_trans = -20
						y_trans = -25
						x_scale = 25
						y_scale = 25
					}
				}
			}
		]
	}
	{
		desc_id = bs_sch_t_nhead
		frontend_desc = qs(0x86541e66)
		sponsor_id = schecter
		mesh = `models/car_instruments/bass/schecter/bs_sch_t_nhead`
		materials = [
			bs_sch_t_nhead_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/schecter/bass_neckhead_mt`
				material = bs_sch_t_nhead_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_bs_sch_modelt_finishes
					}
					{
						$preset_layer_fades
						mask = $cab_bs_sch_modelt_fades
					}
					{
						$preset_layer_details
						mask = $cab_bs_sch_modelt_details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_270
					initial_values = {
						x_trans = 25
						y_trans = -30
						x_scale = 55
						y_scale = 10
					}
				}
			}
		]
	}
	{
		desc_id = bas_neckhead_sch_stl
		frontend_desc = qs(0x32a408c4)
		sponsor_id = schecter
		mesh = `models/car_instruments/bass/schecter/bas_neckhead_sch_stl`
		materials = [
			bass_neckhead_stil01_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/schecter/bs_sch_head_stil01`
				material = bass_neckhead_stil01_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_bs_sch_stl_finishes
					}
					{
						$preset_layer_fades
						mask = $cab_bs_sch_stl_fades
					}
					{
						$preset_layer_details
						mask = $cab_bs_sch_stl_details
					}
				]
				$car_rocker_bass_factoredglobal_56
			}
		]
	}
	{
		desc_id = bs_ibz_icb_head
		frontend_desc = qs(0xa2d6a71d)
		sponsor_id = ibanez
		mesh = `models/car_instruments/bass/ibanez/bs_ibz_icb_head`
		materials = [
			bass_neckhead_icb_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/ibanez/bs_ibz_icb_head`
				material = bass_neckhead_icb_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_bs_ibz_icb_head_finishes
					}
					{
						$preset_layer_fades
						mask = $cab_bs_ibz_icb_head_fades
					}
					{
						$preset_layer_details
						mask = $cab_bs_ibz_icb_head_details
					}
				]
				$car_rocker_bass_factoredglobal_56
			}
		]
	}
	{
		desc_id = bas_ibz_sr_head01
		frontend_desc = qs(0xb1fb9392)
		sponsor_id = ibanez
		mesh = `models/car_instruments/bass/ibanez/bas_ibz_sr_head01`
		materials = [
			bass_neckhead_ibz_sr_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/ibanez/bs_ibz_sr_head`
				material = bass_neckhead_ibz_sr_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_bs_ibz_sr_head_finishes
					}
					{
						$preset_layer_fades
						mask = $cab_bs_ibz_sr_head_fades
					}
					{
						$preset_layer_details
						mask = $cab_bs_ibz_sr_head_details
					}
				]
				$car_rocker_bass_factoredglobal_56
			}
		]
	}
	{
		desc_id = bass102_neckhead
		frontend_desc = qs(0x9707fdc2)
		mesh = `models/car_instruments/bass/heroes/bass102_neckhead`
		materials = [
			bass102_neckhead_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/heroes/bass102_neckhead_d`
				material = bass102_neckhead_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $bass102_neckhead_finishes
					}
					{
						$preset_layer_fades
						mask = $bass102_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $bass102_neckhead_details
					}
				]
				$car_rocker_bass_factoredglobal_56
			}
		]
	}
	{
		desc_id = bass104_neckhead
		frontend_desc = qs(0x2a26573d)
		mesh = `models/car_instruments/bass/heroes/bass104_neckhead`
		materials = [
			bass104_neckhead_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/heroes/bass104_neckhead_d`
				material = bass104_neckhead_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $bass104_neckhead_finishes
					}
					{
						$preset_layer_fades
						mask = $bass104_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $bass104_neckhead_details
					}
				]
				$car_rocker_bass_factoredglobal_56
			}
		]
	}
	{
		desc_id = bass105_neckhead
		frontend_desc = qs(0xf1f5c447)
		mesh = `models/car_instruments/bass/heroes/bass105_neckhead`
		materials = [
			bass105_neckhead_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/heroes/bass105_neckhead_d`
				material = bass105_neckhead_primary
				$car_rocker_bass_factoredglobal_56
			}
		]
	}
	{
		desc_id = bass105_neckhead_b
		frontend_desc = qs(0xc15459f6)
		mesh = `models/car_instruments/bass/heroes/bass105_neckhead_b`
		materials = [
			bass105_neckhead_b_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/heroes/bass105_neckhead_b_d`
				material = bass105_neckhead_b_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $bass105_neckhead_b_finishes
					}
					{
						$preset_layer_fades
						mask = $bass105_neckhead_b_fades
					}
					{
						$preset_layer_details
						mask = $bass105_neckhead_b_details
					}
				]
				$car_rocker_bass_factoredglobal_56
			}
		]
	}
]
cas_bass_misc = [
	{
		desc_id = bass_mm_sr_misc_1
		frontend_desc = qs(0xab44586d)
		materials = [
			bass_mm_sr_misc_1_primary
		]
		node_meshes = {
			$bass_misc_nodes
			placements = [
				{
					parents = [
						bass_mm_stingray
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/bass/musicman/bass_mm_sr_misc_1`
							attach_indices = [
								1
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = None
		frontend_desc = qs(0x9c1b5214)
	}
]
car_rocker_bass_factoredglobal_6 = {
	has_node_array
	locked
}
car_rocker_bass_factoredglobal_16 = {
	initial_values = {
		Color = grey_4
	}
}
car_rocker_bass_factoredglobal_17 = {
	initial_values = {
		Color = grey_5guitar
	}
}
car_rocker_bass_factoredglobal_18 = {
	initial_values = {
		Color = black_1guitar
	}
}
car_rocker_bass_factoredglobal_19 = {
	chosen_materials = {
		material1 = grey_2guitar
	}
}
car_rocker_bass_factoredglobal_55 = {
	user_layer_settings = {
		diffuse
		ui_rotated_90
		initial_values = {
			x_trans = -20
			y_trans = -25
			x_scale = 25
			y_scale = 25
		}
		aspect_ratio = 1.75
	}
}
car_rocker_bass_factoredglobal_56 = {
	user_layer_settings = {
		diffuse
		ui_rotated_90
		initial_values = {
			x_trans = -20
			y_trans = -25
			x_scale = 25
			y_scale = 25
		}
	}
}
car_rocker_bass_factoredglobal_57 = {
	user_layer_settings = {
		diffuse
		ui_rotated_90
		initial_values = {
			x_trans = -20
			y_trans = -29
			x_scale = 25
			y_scale = 25
		}
	}
}
bass_knobs_nodes = {
	node_array_part = cas_bass_body
	node_type = knob
}
bass_misc_nodes = {
	node_array_part = cas_bass_body
	node_type = Misc
}
bass_pickups_nodes = {
	node_array_part = cas_bass_body
	node_type = pickup
}
bass_bridges_nodes = {
	node_array_part = cas_bass_body
	node_type = bridge
}
