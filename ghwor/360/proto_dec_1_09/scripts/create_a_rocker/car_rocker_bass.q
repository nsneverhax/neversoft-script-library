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
				$car_rocker_bass_factoredglobal_0
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
					bass_emgpickup2b
					bass_esp_pkup01a
					bass_esp_pkup02b
					bass_mm_sr_pkup_type5
					bass_pickup_sd
					bass_pickup_emg01
					bass_emgpickup1
					bass_emgpickup1b
					bass_emgpickup2
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
					bass17_bridge01
					bass17_bridge02
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
		has_node_array
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
					bass_emgpickup2b
					bass_esp_pkup01a
					bass_esp_pkup02b
					bass_mm_sr_pkup_type5
					bass_pickup_sd
					bass_pickup_emg01
					bass_emgpickup1
					bass_emgpickup1b
					bass_emgpickup2
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
					bass17_bridge01
					bass17_bridge02
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
		has_node_array
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
					bass_emgpickup2b
					bass_mm_sr_pkup_type5
					bass_pickup_sd
					bass_pickup_emg01
					bass_emgpickup1
					bass_emgpickup1b
					bass_emgpickup2
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
					bass17_bridge01
					bass17_bridge02
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
		has_node_array
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
					bass_emgpickup2b
					bass_mm_sr_pkup_type5
					bass_pickup_sd
					bass_pickup_emg01
					bass_emgpickup1
					bass_emgpickup1b
					bass_emgpickup2
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
					bass17_bridge01
					bass17_bridge02
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
		$car_rocker_bass_factoredglobal_4
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
					bass_emgpickup2b
					bass_mm_sr_pkup_type5
					bass_pickup_sd
					bass_pickup_emg01
					bass_emgpickup1
					bass_emgpickup1b
					bass_emgpickup2
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
					bass17_bridge01
					bass17_bridge02
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
					bass13_misc
					None
				]
			}
		]
		$car_rocker_bass_factoredglobal_4
	}
	{
		desc_id = bas_ibz_btb_body
		frontend_desc = qs(0x0246def5)
		mesh = `models/car_instruments/bass/ibanez/bas_ibz_btb_body`
		sponsor_id = ibanez
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex\models\car_instruments\bass\ibanez\bs_ibz_bcb_body`
				material = bass_ibz_btb_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_ibz_btb_finishes
					}
					{
						$preset_layer_fades
						mask = $cab_ibz_btb_fades
					}
					{
						$preset_layer_details
						mask = $cab_ibz_btb_details
					}
				]
				$car_rocker_bass_factoredglobal_6
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
					bass_ibz_btb_misc
				]
			}
			{
				part = cas_bass_pickups
				valid = [
					bass_emgpickup2b
					bas_pickup_ibz01
					bas_ibz_pkup002
					bass_pickup_sd
					bass_pickup_emg01
					bass_emgpickup1
					bass_emgpickup1b
					bass_emgpickup2
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
					bas_brdg_ibz_mono
					bas_brdg_ibz01
					bas_brdg_sch_t2
					bas_brdg_capsule
				]
			}
			{
				part = cas_bass_head
				valid = [
					bass_nhead_ibz_btb
				]
			}
			{
				part = cas_bass_misc
				valid = [
					None
				]
			}
		]
		$car_rocker_bass_factoredglobal_4
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
				$car_rocker_bass_factoredglobal_6
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
		$car_rocker_bass_factoredglobal_4
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
						mask = $cab_musicman_bigal_finishes
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
				$car_rocker_bass_factoredglobal_9
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
					bass_mm_pickup001
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
		$car_rocker_bass_factoredglobal_4
	}
	{
		desc_id = bass_musicman_bigal
		frontend_desc = qs(0x8c349849)
		sponsor_id = `music	man`
		mesh = `models/car_instruments/bass/musicman/bass_musicman_bigal`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex\models\car_instruments\bass\musicman\bass_mm_bigal`
				material = bass_mm_bigal_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_musicman_bigal_finishes
					}
					{
						$preset_layer_fades
						mask = $cab_musicman_bigal_fades
					}
					{
						$preset_layer_details
						mask = $cab_musicman_bigal_details
					}
				]
				$car_rocker_bass_factoredglobal_9
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
					bass_mm_bigal_pgard
					bass_mm_bigal_pgard02
					None
				]
			}
			{
				part = cas_bass_pickups
				valid = [
					bass_mm_pickup002
					bass_mm_pickup001
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
					bass_mm_knobs
					knob_knurl001
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
					bass_mm_neckhead_al
				]
			}
			{
				part = cas_bass_misc
				valid = [
					bass_mm_bigal_misc_1
					None
				]
			}
		]
		$car_rocker_bass_factoredglobal_4
	}
	{
		desc_id = bass_mm_bng
		frontend_desc = qs(0xb0336885)
		sponsor_id = `music	man`
		mesh = `models/car_instruments/bass/musicman/bass_mm_bng`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex\models\car_instruments\bass\musicman\bass_mm_bongo`
				material = bass_mm_bongo_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_musicman_bng_finishes
					}
					{
						$preset_layer_fades
						mask = $cab_musicman_bng_fades
					}
					{
						$preset_layer_details
						mask = $cab_musicman_bng_details
					}
				]
				$car_rocker_bass_factoredglobal_9
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
					bass_mm_bng_pgard
					None
				]
			}
			{
				part = cas_bass_pickups
				valid = [
					bass_mm_pickup001
					bass_emgpickup1
					bass_emgpickup1b
					bass_emgpickup2
					bass_esp_pkup02b
					bass_emgpickup3
					bass_emgpickup3b
				]
			}
			{
				part = cas_bass_knobs
				valid = [
					bass_mm_knobs_02
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
					bass_mm_neckhead_bng
				]
			}
			{
				part = cas_bass_misc
				valid = [
					None
				]
			}
		]
		$car_rocker_bass_factoredglobal_4
	}
	{
		desc_id = bass1_nvsft_elephant_body
		frontend_desc = qs(0x810104e0)
		mesh = `models/car_instruments/bass/heroes/bass1_nvsft_elephant_body`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex\models\car_instruments\bass\heroes\bass1_nvsft_elephant_d`
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
				$car_rocker_bass_factoredglobal_0
			}
		]
		inclusion = [
			{
				part = cas_bass_neck
				valid = [
					bass_fbrd_nvsft_eleph1
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
					bass_emgpickup1c
				]
			}
			{
				part = cas_bass_knobs
				valid = [
					bass1_knob_elephanteye
				]
			}
			{
				part = cas_bass_bridges
				valid = [
					bass1_nvsft_bridge_eleph
				]
			}
			{
				part = cas_bass_head
				valid = [
					bass1_nvsft_nekhed_eleph1
				]
			}
			{
				part = cas_bass_misc
				valid = [
					bass1_nvsft_eleph_misc1
				]
			}
		]
		$car_rocker_bass_factoredglobal_4
	}
	{
		desc_id = bass108_casket
		frontend_desc = qs(0xbcf86fa7)
		mesh = `models/car_instruments/bass/heroes/bass108_casket`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex\models\car_instruments\bass\heroes\bass108_casket_d`
				material = bass108_casket_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $bass108_casket
					}
					{
						$preset_layer_fades
						mask = $bass108_casket_fades
					}
					{
						$preset_layer_details
						mask = $bass108_casket_details
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
					bas_brdg_capsule
				]
			}
			{
				part = cas_bass_head
				valid = [
					bass108_neckhead
				]
			}
			{
				part = cas_bass_misc
				valid = [
					None
				]
			}
		]
		$car_rocker_bass_factoredglobal_4
	}
	{
		desc_id = bass109_metal
		frontend_desc = qs(0xb1d147af)
		mesh = 0xb07b1d7e
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/heroes/bass109_metal_d`
				material = 0x3a8d5319
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $bass109_metal
					}
					{
						$preset_layer_fades
						mask = $0x44a12e90
					}
					{
						$preset_layer_details
						mask = $0x5feeb215
					}
				]
				$car_rocker_bass_factoredglobal_11
			}
		]
		inclusion = [
			{
				part = cas_bass_neck
				valid = [
					cab_22_heroes_axe
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
					bass_mm_sr_pkup_type5
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
					bas_brdg_capsule
					bas_brdg_sch_c
				]
			}
			{
				part = cas_bass_head
				valid = [
					bass109_neckhead
				]
			}
			{
				part = cas_bass_misc
				valid = [
					None
				]
			}
		]
		$car_rocker_bass_factoredglobal_4
	}
	{
		desc_id = bass120_clawed
		frontend_desc = qs(0xa521f5df)
		mesh = `models/car_instruments/bass/heroes/bass120_clawed`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex\models\car_instruments\bass\heroes\bass_clawed001_d`
				material = bass_clawed_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $bass120_clawed_finishes
					}
				]
				$car_rocker_bass_factoredglobal_11
			}
		]
		inclusion = [
			{
				part = cas_bass_neck
				valid = [
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
					bas120_pickup001
					bass_emgpickup1
					bass_emgpickup1b
					bass_emgpickup2
					bass_emgpickup2b
					bass_emgpickup3
					bass_emgpickup3
					bs141_pickup02
				]
			}
			{
				part = cas_bass_knobs
				valid = [
					knob_knurl001
				]
			}
			{
				part = cas_bass_bridges
				valid = [
					bass120_bridge001
					bass132_bridge
					bs_sch_brdg_a
					bas_brdg_capsule
					bass100_bridge
				]
			}
			{
				part = cas_bass_head
				valid = [
					bs_clawhead001
				]
			}
			{
				part = cas_bass_misc
				valid = [
					bass13_misc
					None
				]
			}
		]
		$car_rocker_bass_factoredglobal_4
	}
	{
		desc_id = bass132_axe
		frontend_desc = qs(0x878e9b18)
		mesh = 0x39e3b97b
		pak_num = 0
		inclusion = [
			{
				part = cas_bass_neck
				valid = [
					cab_22_heroes_axe
				]
			}
			{
				part = cas_bass_pickguards
				valid = [
					bass132_pg
				]
			}
			{
				part = cas_bass_pickups
				valid = [
					bass132_pickup
				]
			}
			{
				part = cas_bass_knobs
				valid = [
					bass132_knob
				]
			}
			{
				part = cas_bass_bridges
				valid = [
					bass132_bridge
				]
			}
			{
				part = cas_bass_head
				valid = [
					bass132_neckhead
				]
			}
			{
				part = cas_bass_misc
				valid = [
					bass132_misc
				]
			}
		]
		has_node_array
	}
	{
		desc_id = bs141_frame
		frontend_desc = qs(0x5d785663)
		mesh = `models/car_instruments/bass/heroes/bs141_frame`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/heroes/bass141_body`
				material = bs141_frame_primary
				preset_layers = [
				]
				$car_rocker_bass_factoredglobal_11
			}
		]
		inclusion = [
			{
				part = cas_bass_neck
				valid = [
					bs141_fboard_22
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
					bs141_pickup02
				]
			}
			{
				part = cas_bass_knobs
				valid = [
					bs141_knob
				]
			}
			{
				part = cas_bass_bridges
				valid = [
					bs141_nsftbridge
				]
			}
			{
				part = cas_bass_head
				valid = [
					bs141_neckhead
				]
			}
			{
				part = cas_bass_misc
				valid = [
					None
				]
			}
		]
		$car_rocker_bass_factoredglobal_4
	}
	{
		desc_id = bass133_tiki
		frontend_desc = qs(0x1aa6ccbd)
		mesh = `models/car_instruments/bass/heroes/bass133_tiki`
		pak_num = 0
		inclusion = [
			{
				part = cas_bass_neck
				valid = [
					cab_22_heroes_tiki
				]
			}
			{
				part = cas_bass_pickguards
				valid = [
					bass133_pg
				]
			}
			{
				part = cas_bass_pickups
				valid = [
					bass133_pickup
				]
			}
			{
				part = cas_bass_knobs
				valid = [
					bass_knob_01
				]
			}
			{
				part = cas_bass_bridges
				valid = [
					bass133_bridge
				]
			}
			{
				part = cas_bass_head
				valid = [
					bass133_neckhead
				]
			}
			{
				part = cas_bass_misc
				valid = [
					bass133_misc
				]
			}
		]
		$car_rocker_bass_factoredglobal_4
	}
	{
		desc_id = bass135_smoke
		frontend_desc = qs(0x8c3d4434)
		mesh = `models/car_instruments/bass/heroes/bass135_smoke`
		pak_num = 0
		inclusion = [
			{
				part = cas_bass_neck
				valid = [
					cab_22_heroes_axe
				]
			}
			{
				part = cas_bass_pickguards
				valid = [
					bass135_pg
				]
			}
			{
				part = cas_bass_pickups
				valid = [
					bass_pickup_sd
				]
			}
			{
				part = cas_bass_knobs
				valid = [
					bass135_knob
				]
			}
			{
				part = cas_bass_bridges
				valid = [
					bass100_bridge
				]
			}
			{
				part = cas_bass_head
				valid = [
					bass135_neckhead
				]
			}
			{
				part = cas_bass_misc
				valid = [
					bass135_misc
				]
			}
		]
		$car_rocker_bass_factoredglobal_4
	}
	{
		desc_id = bass136_glass
		frontend_desc = qs(0xddedceef)
		mesh = `models/car_instruments/bass/heroes/bass136_glass`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex\models\car_instruments\bass\heroes\bass136_glass_d`
				material = bass136_glass_primary
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						x_trans = -19
						y_trans = 7
						y_scale = 16
						x_scale = 10
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = cas_bass_neck
				valid = [
					cab_22_heroes_axe
				]
			}
			{
				part = cas_bass_pickguards
				valid = [
					bass136_pg
				]
			}
			{
				part = cas_bass_pickups
				valid = [
					bass136_pickup
				]
			}
			{
				part = cas_bass_knobs
				valid = [
					bass136_knob
				]
			}
			{
				part = cas_bass_bridges
				valid = [
					bass136_bridge
				]
			}
			{
				part = cas_bass_head
				valid = [
					bass136_neckhead
				]
			}
			{
				part = cas_bass_misc
				valid = [
					bass136_misc
				]
			}
		]
		$car_rocker_bass_factoredglobal_4
	}
	{
		desc_id = bass1b_nvsft_sk8gtr
		frontend_desc = qs(0x430eef3f)
		mesh = `models/car_instruments/bass/heroes/bass1b_nvsft_sk8gtr`
		pak_num = 0
		inclusion = [
			{
				part = cas_bass_neck
				valid = [
					cab_22_heroes_sk8
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
					bass1b_pickup_sk8
				]
			}
			{
				part = cas_bass_knobs
				valid = [
					bass1b_knob_locknut
				]
			}
			{
				part = cas_bass_bridges
				valid = [
					bass100_bridge
				]
			}
			{
				part = cas_bass_head
				valid = [
					bass1b_neckhead_sk8
				]
			}
			{
				part = cas_bass_misc
				valid = [
					bass1b_misc_wheels
				]
			}
		]
		$car_rocker_bass_factoredglobal_4
	}
	{
		desc_id = bas143_chainsaw
		frontend_desc = qs(0xdacb71d9)
		mesh = `models/car_instruments/bass/heroes/bas143_chainsaw`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex\models\car_instruments\bass\heroes\bas143_chainbody`
				material = bass143_chainbody_primary
			}
		]
		inclusion = [
			{
				part = cas_bass_neck
				valid = [
					bass_fretboard_143
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
					bas143_pickup
					bas120_pickup001
					bass_emgpickup3
				]
			}
			{
				part = cas_bass_knobs
				valid = [
					knob_knurl02
				]
			}
			{
				part = cas_bass_bridges
				valid = [
					bas143_bridge
					bass120_bridge001
					bass100_bridge
				]
			}
			{
				part = cas_bass_head
				valid = [
					bas143_chainsaw_nhead
				]
			}
			{
				part = cas_bass_misc
				valid = [
					bass143_misc
				]
			}
		]
		$car_rocker_bass_factoredglobal_4
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
		$car_rocker_bass_factoredglobal_4
	}
]
cas_bass_neck = [
	{
		desc_id = bass_fbrd_nvsft_eleph1
		frontend_desc = qs(0x5821c947)
		mesh = `models/car_instruments/bass/heroes/bass_fbrd_nvsft_eleph1`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/heroes/bass_fbrd_nvsft_eleph1_d`
				material = bass_fbrd_nvsft_eleph1
			}
		]
	}
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
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/esp/bass_fretboard_inlay_06`
						flags = 4
						Color = grey_5guitar
					}
				]
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
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/esp/bass_fretboard_inlay_06`
						flags = 4
						Color = black_1guitar
					}
				]
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
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/esp/bass_fretboard_inlay_06`
						flags = 4
						Color = grey_5guitar
					}
				]
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
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/esp/bass_fretboard_inlay_06`
						flags = 4
						Color = grey_5guitar
					}
				]
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
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/esp/bass_fretboard_24_inlay_05`
						flags = 4
						Color = grey_5guitar
					}
				]
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
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/esp/bass_fretboard_24_inlay_05`
						flags = 4
						Color = black_1guitar
					}
				]
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
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/esp/bass_fretboard_24_inlay_05`
						flags = 4
						Color = grey_5guitar
					}
				]
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
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/esp/bass_fretboard_24_inlay_05`
						flags = 4
						Color = grey_5guitar
					}
				]
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
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/ibanez/bass_sr24_inlay001`
						flags = 4
						Color = grey_5guitar
					}
				]
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
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/ibanez/bass_sr24_inlay001`
						flags = 4
						Color = grey_5guitar
					}
				]
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
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/ibanez/bass_sr24_inlay001`
						flags = 4
						Color = grey_5guitar
					}
				]
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
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/ibanez/bass_ibz22_inlay_67`
						flags = 4
						Color = grey_2guitar
					}
				]
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
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/ibanez/bass_ibz22_inlay_67`
						flags = 4
						Color = grey_5guitar
					}
				]
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
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/ibanez/bass_ibz22_inlay_67`
						flags = 4
						Color = grey_5guitar
					}
				]
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
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/ibanez/bass_ibz22_inlay_67`
						flags = 4
						Color = grey_5guitar
					}
				]
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
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/ibanez/bass_ibz24_inlay_67`
						flags = 4
						Color = grey_5guitar
					}
				]
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
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/ibanez/bass_ibz24_inlay_67`
						flags = 4
						Color = grey_2guitar
					}
				]
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
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/ibanez/bass_ibz24_inlay_67`
						flags = 4
						Color = grey_5guitar
					}
				]
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
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/ibanez/bass_ibz24_inlay_67`
						flags = 4
						Color = grey_5guitar
					}
				]
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
				pre_layer = [
					{
						Color = grey_5guitar
						texture = `tex/models/characters/layers/cab/mcswain/22fret_ld07_mcswn_bullets`
						flags = 36
					}
				]
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
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/mcswain/22fret_ld07_mcswn_bullets`
						flags = 36
						Color = grey_3guitar
					}
				]
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
				pre_layer = [
					{
						Color = grey_5guitar
						texture = `tex/models/characters/layers/cab/mcswain/22fret_ld07_mcswn_bullets`
						flags = 36
					}
				]
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
				pre_layer = [
					{
						Color = grey_5guitar
						texture = `tex/models/characters/layers/cab/mcswain/22fret_ld07_mcswn_bullets`
						flags = 36
					}
				]
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
				pre_layer = [
					{
						Color = grey_5guitar
						texture = `tex/models/characters/layers/cab/mcswain/24fret_ld07_mcswn_bullets`
						flags = 36
					}
				]
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
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/mcswain/24fret_ld07_mcswn_bullets`
						flags = 36
						Color = grey_3guitar
					}
				]
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
				pre_layer = [
					{
						Color = grey_5guitar
						texture = `tex/models/characters/layers/cab/mcswain/24fret_ld07_mcswn_bullets`
						flags = 36
					}
				]
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
				pre_layer = [
					{
						Color = grey_5guitar
						texture = `tex/models/characters/layers/cab/mcswain/24fret_ld07_mcswn_bullets`
						flags = 36
					}
				]
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
				pre_layer = [
					{
						Color = grey_5guitar
						texture = `tex/models/characters/layers/cab/musicman/bass_mm_fboard_22_inlay1`
						flags = 4
					}
				]
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
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/musicman/bass_mm_fboard_22_inlay1`
						flags = 4
						Color = black_1guitar
					}
				]
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
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/musicman/bass_mm_fboard_22_inlay1`
						flags = 4
						Color = grey_5guitar
					}
				]
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
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/musicman/bass_mm_fboard_22_inlay1`
						flags = 4
						Color = grey_5guitar
					}
				]
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
				pre_layer = [
					{
						Color = grey_5guitar
						texture = `tex/models/characters/layers/cab/musicman/bass_mm_fboard_24_inlay1`
						flags = 4
					}
				]
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
				pre_layer = [
					{
						Color = black_1guitar
						texture = `tex/models/characters/layers/cab/musicman/bass_mm_fboard_24_inlay1`
						flags = 4
					}
				]
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
				pre_layer = [
					{
						Color = grey_5guitar
						texture = `tex/models/characters/layers/cab/musicman/bass_mm_fboard_24_inlay1`
						flags = 4
					}
				]
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
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/musicman/bass_mm_fboard_24_inlay1`
						flags = 4
						Color = grey_5guitar
					}
				]
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
				pre_layer = [
					{
						Color = grey_5guitar
						texture = `tex/models/characters/layers/cab/musicman/bass_mm_fboard_22_inlay1`
						flags = 4
					}
				]
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
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/musicman/bass_mm_fboard_22_inlay1`
						flags = 4
						Color = black_1guitar
					}
				]
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
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/musicman/bass_mm_fboard_22_inlay1`
						flags = 4
						Color = grey_5guitar
					}
				]
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
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/musicman/bass_mm_fboard_22_inlay1`
						flags = 4
						Color = grey_5guitar
					}
				]
			}
		]
	}
	{
		desc_id = cab_22_heroes_axe
		frontend_desc = qs(0x6398f5e4)
		mesh = `models/car_instruments/bass/esp/bass_fretboard_22d`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_05`
				material = bass_fretboard_22d_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_22fret_heroes_axe
						$car_rocker_bass_factoredglobal_17
					}
				]
			}
		]
	}
	{
		desc_id = cab_22_heroes_sk8
		frontend_desc = qs(0xa0bbf500)
		mesh = `models/car_instruments/bass/esp/bass_fretboard_22d`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_05`
				material = bass_fretboard_22d_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_22_heroes_sk8
						$car_rocker_bass_factoredglobal_17
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_05`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/heroes/bass_fretboard_22_ld111`
						flags = 4
						Color = grey_5guitar
					}
				]
			}
		]
	}
	{
		desc_id = bs141_fboard_22
		frontend_desc = qs(0xed8e4418)
		mesh = `models/car_instruments/bass/heroes/bs141_fboard_22`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/heroes/bs141_fboard_21`
				material = bs141_fboard_22_primary
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
				base_tex = `tex/models/car_instruments/bass/heroes/bs141_fboard_21`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/heroes/bass_fretboard_22_ld101`
						flags = 4
						Color = grey_5guitar
					}
				]
			}
		]
	}
	{
		desc_id = cab_22_heroes_tiki
		frontend_desc = qs(0x40f28e6a)
		mesh = `models/car_instruments/bass/esp/bass_fretboard_22a`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_02`
				material = bass_fretboard_22a_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_22fret_heroes_tiki
						$car_rocker_bass_factoredglobal_17
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_02`
				pre_layer = [
					{
						Color = grey_5guitar
						texture = `tex/models/characters/layers/cab/musicman/bass_mm_fboard_22_inlay1`
						flags = 4
					}
				]
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
				pre_layer = [
					{
						Color = grey_5guitar
						texture = `tex/models/characters/layers/cab/musicman/bass_mm_fboard_24_inlay1`
						flags = 4
					}
				]
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
				pre_layer = [
					{
						Color = black_1guitar
						texture = `tex/models/characters/layers/cab/musicman/bass_mm_fboard_24_inlay1`
						flags = 4
					}
				]
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
				pre_layer = [
					{
						Color = grey_5guitar
						texture = `tex/models/characters/layers/cab/musicman/bass_mm_fboard_24_inlay1`
						flags = 4
					}
				]
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
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/musicman/bass_mm_fboard_24_inlay1`
						flags = 4
						Color = grey_5guitar
					}
				]
			}
		]
	}
	{
		desc_id = bass_fretboard_143
		frontend_desc = qs(0xdd5235bb)
		mesh = `models/car_instruments/bass/heroes/bass_fretboard_143`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/heroes/bass_fretboard_143`
				material = bassfretboard143_primary
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
				base_tex = `tex/models/car_instruments/bass/heroes/bass_fretboard_143`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/musicman/bass_mm_fboard_24_inlay1`
						flags = 4
						Color = grey_5guitar
					}
				]
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
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/schecter/bs_sch22_inl_ld30`
						flags = 4
						Color = grey_5guitar
					}
				]
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
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/schecter/bs_sch22_inl_ld30`
						flags = 4
						Color = black_1guitar
					}
				]
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
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/schecter/bs_sch22_inl_ld30`
						flags = 4
						Color = grey_5guitar
					}
				]
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
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/schecter/bs_sch22_inl_ld30`
						flags = 4
						Color = grey_5guitar
					}
				]
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
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/schecter/bs_sch_inl_ld30`
						flags = 4
						Color = grey_5guitar
					}
				]
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
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/schecter/bs_sch_inl_ld30`
						flags = 4
						Color = black_1guitar
					}
				]
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
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/schecter/bs_sch_inl_ld30`
						flags = 4
						Color = grey_5guitar
					}
				]
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
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cab/schecter/bs_sch_inl_ld30`
						flags = 4
						Color = grey_5guitar
					}
				]
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
		desc_id = bass_ibz_btb_misc
		frontend_desc = qs(0xfefa1330)
		mesh = `models/car_instruments/bass/ibanez/bass_ibz_btb_misc`
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
		desc_id = bass_mm_bigal_pgard
		frontend_desc = qs(0x20f24eac)
		mesh = `models/car_instruments/bass/musicman/bass_mm_bigal_pgard`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/musicman/bass_mm_bigal_pgard`
				material = bass_mm_bigal_pgard_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $bass_pickguard_mm_bigal
					}
				]
			}
		]
	}
	{
		desc_id = bass_mm_bigal_pgard02
		frontend_desc = qs(0x0bdf1d6f)
		mesh = 0x6b4a8408
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/musicman/bass_mm_bigal_pgard_b_d`
				material = 0x193ff805
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
		desc_id = bass_mm_bng_pgard
		frontend_desc = qs(0xf33d958b)
		mesh = `models/car_instruments/bass/musicman/bass_mm_bng_pgard`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/musicman/bass_mm_bng_pickguard001`
				material = bass_mm_bigal_pgard_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $bass_pickguard_mm_bigal
					}
				]
			}
		]
	}
	{
		desc_id = bass132_pg
		frontend_desc = qs(0x2a26573d)
		mesh = 0x3edb9763
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/heroes/gtr132_pg_d`
				material = 0x386da02f
				preset_layers = [
				]
			}
		]
	}
	{
		desc_id = bass133_pg
		frontend_desc = qs(0x7c6774b7)
		mesh = `models/car_instruments/bass/heroes/bass133_pg`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/heroes/gtr133_pg_d`
				material = bass133_pg_primary
				preset_layers = [
				]
			}
		]
	}
	{
		desc_id = bass135_pg
		frontend_desc = qs(0x3f1bbbb1)
		mesh = `models/car_instruments/bass/heroes/bass135_pg`
		cap_textures = [
			{
				base_tex = `tex/_______default_m_____`
				material = bass135_pg_primary
				preset_layers = [
				]
			}
		]
	}
	{
		desc_id = bass136_pg
		frontend_desc = qs(0x93dbe073)
		mesh = `models/car_instruments/bass/heroes/bass136_pg`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/heroes/bass136_pg_d`
				material = bass136_pg_primary
				preset_layers = [
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
				{
					parents = [
						bass9_esp_ax_01
						bass17_esp_ec_01
						bass14_esp_surveyor
						bass63_ex
						bass64_f405
					]
					node_set = 0
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
						bas_ibz_btb_body
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
						bas_ibz_btb_body
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
		desc_id = bass_esp_pkup01a
		frontend_desc = qs(0x56b9a21d)
		sponsor_id = emg
		materials = [
			bass_esp_pkup01a_primary
		]
		chosen_materials = {
			material1 = black_1guitar
		}
		node_meshes = {
			$bass_pickups_nodes
			placements = [
				{
					parents = [
						bass9_esp_ax_01
						bass17_esp_ec_01
						bass14_esp_surveyor
					]
					node_set = 0
					meshes = [
						{
							mesh = `models\car_instruments\bass\gh5\pickups\bass_esp_pkup01a`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models\car_instruments\bass\gh5\pickups\bass_esp_pkup01b`
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
		desc_id = bass_esp_pkup02a
		frontend_desc = qs(0xcf1a182c)
		sponsor_id = emg
		materials = [
			bass_esp_pkup02a_primary
		]
		chosen_materials = {
			material1 = black_1guitar
		}
		node_meshes = {
			$bass_pickups_nodes
			placements = [
				{
					parents = [
						bass120_clawed
						bass9_esp_ax_01
						bass17_esp_ec_01
						bass14_esp_surveyor
					]
					node_set = 0
					meshes = [
						{
							mesh = `models\car_instruments\bass\gh5\pickups\bass_esp_pkup02a`
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
		desc_id = bass_esp_pkup02b
		frontend_desc = qs(0x59bd530d)
		sponsor_id = emg
		materials = [
			bass_esp_pkup02a_primary
		]
		chosen_materials = {
			material1 = black_1guitar
		}
		node_meshes = {
			$bass_pickups_nodes
			placements = [
				{
					parents = [
						bass120_clawed
						bass9_esp_ax_01
						bass17_esp_ec_01
						bass14_esp_surveyor
					]
					node_set = 0
					meshes = [
						{
							mesh = `models\car_instruments\bass\gh5\pickups\bass_esp_pkup02a`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models\car_instruments\bass\gh5\pickups\bass_esp_pkup02b`
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
		desc_id = bas120_pickup001
		frontend_desc = qs(0x159a68a0)
		materials = [
			bas120_pickup001_primary
		]
		chosen_materials = {
			material1 = grey_4guitar
		}
		node_meshes = {
			$bass_pickups_nodes
			placements = [
				{
					parents = [
						bass120_clawed
						bas143_chainsaw
					]
					node_set = 0
					meshes = [
						{
							mesh = `models\car_instruments\bass\heroes\bas120_pickup001`
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
		desc_id = bas143_pickup
		frontend_desc = qs(0x55904437)
		materials = [
			bas143_pickup_primary
		]
		chosen_materials = {
			material1 = grey_4guitar
		}
		node_meshes = {
			$bass_pickups_nodes
			placements = [
				{
					parents = [
						bas143_chainsaw
					]
					node_set = 0
					meshes = [
						{
							mesh = `models\car_instruments\bass\heroes\bas143_pickup`
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
						bass109_metal
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
						bass9_esp_ax_01
						bass17_esp_ec_01
						bass14_esp_surveyor
						bass63_ex
						bass64_f405
						bass135_smoke
					]
					node_set = 0
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
						bass109_metal
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
				{
					parents = [
						bass9_esp_ax_01
						bass17_esp_ec_01
						bass14_esp_surveyor
						bass63_ex
						bass64_f405
					]
					node_set = 0
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
						bass120_clawed
						bass9_esp_ax_01
						bass17_esp_ec_01
						bass14_esp_surveyor
						bass63_ex
						bass64_f405
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
						bas_ibz_btb_body
						bass_mm_bng
						bass_musicman_bigal
						bass_mm_stingray
						bass_schect_030
						bs_sch_t_body
						bas_ibz_sr505
						bas_sch_stil
						ibanez_icb_body
						bass109_metal
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
		desc_id = bass_emgpickup1c
		frontend_desc = qs(0x2b570be2)
		sponsor_id = emg
		materials = [
			bass_emgpickup1_primary
		]
		chosen_materials = {
			material1 = grey_4guitar
		}
		node_meshes = {
			$bass_pickups_nodes
			placements = [
				{
					parents = [
						bass1_nvsft_elephant_body
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
						bass120_clawed
						bass9_esp_ax_01
						bass17_esp_ec_01
						bass14_esp_surveyor
						bass63_ex
						bass64_f405
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
						bas_ibz_btb_body
						bass_mm_bng
						bass_musicman_bigal
						bass_mm_stingray
						bs_sch_t_body
						bass_schect_030
						bas_sch_stil
						ibanez_icb_body
						bas_ibz_sr505
						bass109_metal
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
						bass120_clawed
						bass9_esp_ax_01
						bass17_esp_ec_01
						bass14_esp_surveyor
						bass63_ex
						bass64_f405
					]
					node_set = 0
					meshes = [
						{
							mesh = `models\car_instruments\bass\gh5\pickups\bass_emgpickup2`
							attach_indices = [
								1
							]
						}
					]
				}
				{
					parents = [
						bas_ibz_btb_body
						bass_mm_bng
						bass_musicman_bigal
						bass_mm_stingray
						bs_sch_t_body
						bass_schect_030
						bas_sch_stil
						ibanez_icb_body
						bas_ibz_sr505
						bass109_metal
					]
					node_set = 1
					meshes = [
						{
							mesh = `models\car_instruments\bass\gh5\pickups\bass_emgpickup2`
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
							mesh = `models\car_instruments\bass\gh5\pickups\bass_emgpickup2`
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
						bass120_clawed
						bass9_esp_ax_01
						bass17_esp_ec_01
						bass14_esp_surveyor
						bass63_ex
						bass64_f405
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
						bas_ibz_btb_body
						bass_mm_bng
						bass_musicman_bigal
						bass_mm_stingray
						bs_sch_t_body
						bass_schect_030
						bas_sch_stil
						ibanez_icb_body
						bas_ibz_sr505
						bass109_metal
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
						bass120_clawed
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
						bas_ibz_btb_body
						bass_mm_bng
						bas143_chainsaw
						bass_musicman_bigal
						bass_mm_stingray
						bs_sch_t_body
						bass_schect_030
						bas_sch_stil
						ibanez_icb_body
						bas_ibz_sr505
						bass109_metal
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
						bass9_esp_ax_01
						bass17_esp_ec_01
						bass14_esp_surveyor
						bass63_ex
						bass64_f405
					]
					node_set = 0
					meshes = [
						{
							mesh = `models\car_instruments\bass\gh5\pickups\bass_emgpickup3`
							attach_indices = [
								1
							]
						}
					]
				}
				{
					parents = [
						bas_ibz_btb_body
						bass_mm_bng
						bass_musicman_bigal
						bass_mm_stingray
						bs_sch_t_body
						bass_schect_030
						bas_sch_stil
						ibanez_icb_body
						bas_ibz_sr505
						bass108_casket
						bass109_metal
					]
					node_set = 1
					meshes = [
						{
							mesh = `models\car_instruments\bass\gh5\pickups\bass_emgpickup3`
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
							mesh = `models\car_instruments\bass\gh5\pickups\bass_emgpickup3`
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
		desc_id = bass_mm_pickup001
		frontend_desc = qs(0x23cfcf9c)
		sponsor_id = `music	man`
		materials = [
			bass_mm_pickup001_primary
		]
		node_meshes = {
			$bass_pickups_nodes
			placements = [
				{
					parents = [
						bass_mm_bng
						bass_musicman_bigal
						bass_mm_stingray
					]
					node_set = 1
					meshes = [
						{
							mesh = `models\car_instruments\bass\musicman\bass_mm_pickup001`
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
		desc_id = bass_mm_pickup002
		frontend_desc = qs(0x08e29c5f)
		sponsor_id = `music	man`
		materials = [
			bass_mm_pickup001_primary
		]
		node_meshes = {
			$bass_pickups_nodes
			placements = [
				{
					parents = [
						bass_musicman_bigal
						bass_mm_stingray
					]
					node_set = 3
					meshes = [
						{
							mesh = `models\car_instruments\bass\musicman\bass_mm_pickup002`
							attach_indices = [
								1
								2
								3
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = bass132_pickup
		frontend_desc = qs(0x2a26573d)
		materials = [
			bass132_pickup_primary
		]
		node_meshes = {
			$bass_pickups_nodes
			placements = [
				{
					parents = [
						bass132_axe
					]
					node_set = 0
					meshes = [
						{
							mesh = 0x7997d8ed
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
		desc_id = bs141_pickup02
		frontend_desc = qs(0xd5066052)
		materials = [
			bas141_pickup001_primary
		]
		node_meshes = {
			$bass_pickups_nodes
			placements = [
				{
					parents = [
						bass120_clawed
						bs141_frame
					]
					node_set = 0
					meshes = [
						{
							mesh = `models\car_instruments\bass\heroes\bs141_pickup02`
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
		desc_id = bass133_pickup
		frontend_desc = qs(0x2f67e699)
		materials = [
			bass133_pickup_primary
		]
		node_meshes = {
			$bass_pickups_nodes
			placements = [
				{
					parents = [
						bass133_tiki
					]
					node_set = 0
					meshes = [
						{
							mesh = `models\car_instruments\bass\gh5\pickups\bass133_pickup`
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
		desc_id = bass136_pickup
		frontend_desc = qs(0x64554abd)
		materials = [
			bass136_pickup_primary
		]
		node_meshes = {
			$bass_pickups_nodes
			placements = [
				{
					parents = [
						bass136_glass
					]
					node_set = 0
					meshes = [
						{
							mesh = `models\car_instruments\bass\gh5\pickups\bass136_pickup`
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
		desc_id = bass1b_pickup_sk8
		frontend_desc = qs(0x0c88c02c)
		materials = [
			bass1b_pickup_sk8_primary
		]
		chosen_materials = {
			material1 = black_1guitar
		}
		node_meshes = {
			$bass_pickups_nodes
			placements = [
				{
					parents = [
						bass1b_nvsft_sk8gtr
					]
					node_set = 0
					meshes = [
						{
							mesh = `models\car_instruments\bass\gh5\pickups\bass1b_pickup_sk8`
							attach_indices = [
								1
								2
								3
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
						bass120_clawed
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
				{
					parents = [
						bass_musicman_bigal
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/knob_knurl001`
							attach_indices = [
								5
								6
								7
								8
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
						bas143_chainsaw
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
						bas_ibz_btb_body
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
		desc_id = bass136_knob
		frontend_desc = qs(0xa73705e0)
		materials = [
			bass136_knob_primary
		]
		node_meshes = {
			$bass_knobs_nodes
			placements = [
				{
					parents = [
						bass136_glass
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass136_knob`
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
		desc_id = bass1_knob_elephanteye
		frontend_desc = qs(0xa59fbb4a)
		materials = [
			bass1_nvsft_knob_elepheye_primary
		]
		node_meshes = {
			$bass_knobs_nodes
			placements = [
				{
					parents = [
						bass1_nvsft_elephant_body
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/bass/heroes/bass1_nvsft_knob_elepheye`
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
						bass108_casket
						bass109_metal
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
						bs_sch_t_body
						bass17_esp_ec_01
						bass135_smoke
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
						bass_musicman_bigal
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass_knob_01`
							attach_indices = [
								5
								6
								7
								8
							]
						}
					]
				}
				{
					parents = [
						bass_mm_bng
						bass_schect_030
						bass_mm_stingray
						bas_sch_stil
						bass9_esp_ax_01
						bass14_esp_surveyor
						bass63_ex
						bass64_f405
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
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass_knob_01`
							attach_indices = [
								5
								6
								7
								8
							]
						}
					]
				}
				{
					parents = [
						bas_ibz_btb_body
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
				{
					parents = [
						bass133_tiki
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass_knob_01`
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
						bass108_casket
						bass109_metal
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
						bs_sch_t_body
						bass17_esp_ec_01
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
						bass_mm_bng
						bass_schect_030
						bass_mm_stingray
						bas_sch_stil
						ibanez_icb_body
						bas_ibz_sr505
						bass9_esp_ax_01
						bass14_esp_surveyor
						bass63_ex
						bass64_f405
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
						bass_musicman_bigal
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass_knob_02`
							attach_indices = [
								5
								6
								7
								8
							]
						}
					]
				}
				{
					parents = [
						bas_ibz_btb_body
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
						bass108_casket
						bass109_metal
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
						bs_sch_t_body
						bass17_esp_ec_01
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
						bass_musicman_bigal
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass_knob_03`
							attach_indices = [
								5
								6
								7
								8
							]
						}
					]
				}
				{
					parents = [
						bass_mm_bng
						bass_schect_030
						bass_mm_stingray
						bas_sch_stil
						ibanez_icb_body
						bas_ibz_sr505
						bass9_esp_ax_01
						bass14_esp_surveyor
						bass63_ex
						bass64_f405
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
						bas_ibz_btb_body
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
						bass108_casket
						bass109_metal
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
						bs_sch_t_body
						bass17_esp_ec_01
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
						bass_musicman_bigal
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass_knob_04`
							attach_indices = [
								5
								6
								7
								8
							]
						}
					]
				}
				{
					parents = [
						bass_mm_bng
						bass_schect_030
						bass_mm_stingray
						bas_sch_stil
						ibanez_icb_body
						bas_ibz_sr505
						bass9_esp_ax_01
						bass14_esp_surveyor
						bass63_ex
						bass64_f405
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
						bas_ibz_btb_body
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
						bass108_casket
						bass109_metal
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
						bs_sch_t_body
						bass17_esp_ec_01
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
						bass_musicman_bigal
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass_knob_05`
							attach_indices = [
								5
								6
								7
								8
							]
						}
					]
				}
				{
					parents = [
						bass_mm_bng
						bass_schect_030
						bass_mm_stingray
						bas_sch_stil
						ibanez_icb_body
						bas_ibz_sr505
						bass9_esp_ax_01
						bass14_esp_surveyor
						bass63_ex
						bass64_f405
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
						bas_ibz_btb_body
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
						bass108_casket
						bass109_metal
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
						bs_sch_t_body
						bass17_esp_ec_01
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
						bass_musicman_bigal
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass_knob_06`
							attach_indices = [
								5
								6
								7
								8
							]
						}
					]
				}
				{
					parents = [
						bass_mm_bng
						bass_schect_030
						bass_mm_stingray
						bas_sch_stil
						ibanez_icb_body
						bas_ibz_sr505
						bass9_esp_ax_01
						bass14_esp_surveyor
						bass63_ex
						bass64_f405
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
						bas_ibz_btb_body
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
						bass108_casket
						bass109_metal
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
						bs_sch_t_body
						bass17_esp_ec_01
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
						bass_musicman_bigal
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass_knob_07`
							attach_indices = [
								5
								6
								7
								8
							]
						}
					]
				}
				{
					parents = [
						bass_mm_bng
						bass_schect_030
						bass_mm_stingray
						bas_sch_stil
						ibanez_icb_body
						bas_ibz_sr505
						bass9_esp_ax_01
						bass14_esp_surveyor
						bass63_ex
						bass64_f405
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
						bas_ibz_btb_body
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
						bass108_casket
						bass109_metal
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
						bs_sch_t_body
						bass17_esp_ec_01
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
						bass_musicman_bigal
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass_knob_08`
							attach_indices = [
								5
								6
								7
								8
							]
						}
					]
				}
				{
					parents = [
						bass_mm_bng
						bass_schect_030
						bass_mm_stingray
						bas_sch_stil
						ibanez_icb_body
						bas_ibz_sr505
						bass9_esp_ax_01
						bass14_esp_surveyor
						bass63_ex
						bass64_f405
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
						bas_ibz_btb_body
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
						bass108_casket
						bass109_metal
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
						bs_sch_t_body
						bass17_esp_ec_01
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
						bass_musicman_bigal
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass_knob_09`
							attach_indices = [
								5
								6
								7
								8
							]
						}
					]
				}
				{
					parents = [
						bass_mm_bng
						bass_schect_030
						bass_mm_stingray
						bas_sch_stil
						ibanez_icb_body
						bas_ibz_sr505
						bass9_esp_ax_01
						bass14_esp_surveyor
						bass63_ex
						bass64_f405
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
						bas_ibz_btb_body
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
						bass108_casket
						bass109_metal
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
						bs_sch_t_body
						bass17_esp_ec_01
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
						bass_musicman_bigal
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass_knob_10`
							attach_indices = [
								5
								6
								7
								8
							]
						}
					]
				}
				{
					parents = [
						bass_mm_bng
						bass_schect_030
						bass_mm_stingray
						bas_sch_stil
						ibanez_icb_body
						bas_ibz_sr505
						bass9_esp_ax_01
						bass14_esp_surveyor
						bass63_ex
						bass64_f405
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
						bas_ibz_btb_body
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
		desc_id = bass132_knob
		frontend_desc = qs(0x7596ac56)
		materials = [
			bass132_knob_primary
		]
		node_meshes = {
			$bass_knobs_nodes
			placements = [
				{
					parents = [
						bass132_axe
					]
					node_set = 0
					meshes = [
						{
							mesh = 0xdede60af
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
		desc_id = bs141_knob
		frontend_desc = qs(0xd5066052)
		materials = [
			bas141_knob_primary
		]
		node_meshes = {
			$bass_knobs_nodes
			placements = [
				{
					parents = [
						bs141_frame
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/bass/heroes/bs141_knob`
							attach_indices = [
								1
								2
								3
								4
								5
								6
								7
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = bass135_knob
		frontend_desc = qs(0xdd465ea0)
		materials = [
			bass135_knob_primary
		]
		node_meshes = {
			$bass_knobs_nodes
			placements = [
				{
					parents = [
						bass135_smoke
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/bass/heroes/bass135_knob`
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
		desc_id = bass1b_knob_locknut
		frontend_desc = qs(0x0b493757)
		materials = [
			bass1b_knob_locknut_primary
		]
		node_meshes = {
			$bass_knobs_nodes
			placements = [
				{
					parents = [
						bass1b_nvsft_sk8gtr
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/knobs/bass1b_knob_locknut`
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
		desc_id = bass_mm_knobs_02
		frontend_desc = qs(0x5cf65d3b)
		materials = [
			bass_mm_knob001_primary
		]
		node_meshes = {
			$bass_knobs_nodes
			placements = [
				{
					parents = [
						bass_mm_bng
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/car_instruments/bass/musicman/bass_mm_knob001`
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
		desc_id = bass_mm_knobs
		frontend_desc = qs(0xc840b1e0)
		materials = [
			bass_mm_knob001_primary
		]
		node_meshes = {
			$bass_knobs_nodes
			placements = [
				{
					parents = [
						bass_musicman_bigal
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/car_instruments/bass/musicman/bass_mm_knob001`
							attach_indices = [
								7
								8
							]
						}
						{
							mesh = `models/car_instruments/bass/musicman/bass_mm_knob002`
							attach_indices = [
								5
								6
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
						bass120_clawed
						bass_schect_030
						bas_sch_stil
						bs_sch_t_body
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
						bas_ibz_btb_body
						bass120_clawed
						bass_schect_030
						bas_sch_stil
						bs_sch_t_body
						bas_ibz_sr505
						ibanez_icb_body
						bass108_casket
						bass109_metal
						bass135_smoke
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
						bas_ibz_btb_body
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
						bas_ibz_btb_body
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
						bass109_metal
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
						bas_ibz_btb_body
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
		desc_id = bass132_bridge
		frontend_desc = qs(0xf143ea7f)
		bass_string_start = bas_brdg_capsule_str_start_properties
		bass_string_end = default_bass_string_end_properties
		materials = [
			bas_brdg_capsule_primary
		]
		chosen_materials = {
			material1 = black_1guitar
		}
		node_meshes = {
			$bass_bridges_nodes
			placements = [
				{
					parents = [
						bass120_clawed
						bass132_axe
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
		desc_id = bs141_nsftbridge
		frontend_desc = qs(0xd5066052)
		bass_string_start = bas_brdg_capsule_str_start_properties
		bass_string_end = default_bass_string_end_properties
		materials = [
			bas141_bridge_primary
		]
		node_meshes = {
			$bass_bridges_nodes
			placements = [
				{
					parents = [
						bs141_frame
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/bass/heroes/bs141_nsftbridge`
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
		desc_id = bass17_bridge01
		frontend_desc = qs(0x8ea66176)
		materials = [
			bass17_bridge01_primary
		]
		bass_string_start = bass17_bridge01_start_properties
		node_meshes = {
			$bass_bridges_nodes
			placements = [
				{
					parents = [
						bass9_esp_ax_01
						bass17_esp_ec_01
						bass14_esp_surveyor
						bass63_ex
						bass64_f405
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/bridges/bass17_bridge01`
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
		desc_id = bass17_bridge02
		frontend_desc = qs(0xa58b32b5)
		materials = [
			bass17_bridge02_primary
		]
		bass_string_start = bass17_bridge02_start_properties
		node_meshes = {
			$bass_bridges_nodes
			placements = [
				{
					parents = [
						bass9_esp_ax_01
						bass17_esp_ec_01
						bass14_esp_surveyor
						bass63_ex
						bass64_f405
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/bridges/bass17_bridge02`
							attach_indices = [
								1
							]
						}
					]
				}
				{
					parents = [
						bass1_nvsft_elephant_body
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/bridges/bass17_bridge02`
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
						bass_mm_bng
						bass_musicman_bigal
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
		desc_id = bass1_nvsft_bridge_eleph
		frontend_desc = qs(0x684038fc)
		materials = [
			bass1_nvsft_bridge_eleph_primary
		]
		bass_string_start = bass100_brdg_4str_start_properties
		node_meshes = {
			$bass_bridges_nodes
			placements = [
				{
					parents = [
						bass1_nvsft_elephant_body
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/car_instruments/bass/heroes/bass1_nvsft_bridge_eleph`
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
						bas143_chainsaw
						bass120_clawed
						bass135_smoke
						bass1b_nvsft_sk8gtr
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
	{
		desc_id = bass120_bridge001
		frontend_desc = qs(0x787389b9)
		materials = [
			bas120_bridge001_primary
		]
		bass_string_start = bass100_brdg_4str_start_properties
		node_meshes = {
			$bass_bridges_nodes
			placements = [
				{
					parents = [
						bas143_chainsaw
						bass120_clawed
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/bass/heroes/bas120_bridge001`
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
		desc_id = bas143_bridge
		frontend_desc = qs(0xdd5235bb)
		materials = [
			bas143_bridge_primary
		]
		bass_string_start = bass100_brdg_4str_start_properties
		node_meshes = {
			$bass_bridges_nodes
			placements = [
				{
					parents = [
						bas143_chainsaw
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/bass/heroes/bas143_bridge`
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
		desc_id = bass133_bridge
		frontend_desc = qs(0xf78147da)
		materials = [
			bass133_bridge_primary
		]
		bass_string_start = bass133_bridge_4str_start_properties
		bass_string_end = default_bass_string_end_properties
		node_meshes = {
			$bass_bridges_nodes
			placements = [
				{
					parents = [
						bass133_tiki
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/bridges/bass133_bridge`
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
		desc_id = bass136_bridge
		frontend_desc = qs(0x684038fc)
		materials = [
			bass136_bridge_primary
		]
		bass_string_start = bass136_bridge_4str_start_properties
		bass_string_end = default_bass_string_end_properties
		node_meshes = {
			$bass_bridges_nodes
			placements = [
				{
					parents = [
						bass136_glass
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/bass/gh5/bridges/bass136_bridge`
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
				$car_rocker_bass_factoredglobal_85
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
				$car_rocker_bass_factoredglobal_85
			}
		]
	}
	{
		desc_id = bass_mm_neckhead_al
		frontend_desc = qs(0x8c349849)
		sponsor_id = `music	man`
		mesh = `models/car_instruments/bass/musicman/bass_mm_neckhead_al`
		materials = [
			bass_mm_neckhead_bigal_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/musicman/bass_mm_al_neckhead`
				material = bass_mm_neckhead_bigal_primary
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
				$car_rocker_bass_factoredglobal_85
			}
		]
	}
	{
		desc_id = bass_mm_neckhead_bng
		frontend_desc = qs(0xb0336885)
		sponsor_id = `music	man`
		mesh = `models/car_instruments/bass/musicman/bass_mm_neckhead_bng`
		materials = [
			bass_mm_neckhead_bng_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/musicman/bass_mm_bng_neckhead`
				material = bass_mm_neckhead_bng_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $bass_mm_bng_nkhead_finishes
					}
					{
						$preset_layer_fades
						mask = $bass_mm_bng_nkhead_fades
					}
					{
						$preset_layer_details
						mask = $bass_mm_bng_nkhead_details
					}
				]
				$car_rocker_bass_factoredglobal_85
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
				$car_rocker_bass_factoredglobal_86
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
				$car_rocker_bass_factoredglobal_86
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
				$car_rocker_bass_factoredglobal_86
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
				$car_rocker_bass_factoredglobal_87
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
				$car_rocker_bass_factoredglobal_87
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
				$car_rocker_bass_factoredglobal_86
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
				$car_rocker_bass_factoredglobal_86
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
				$car_rocker_bass_factoredglobal_86
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
				$car_rocker_bass_factoredglobal_87
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
				$car_rocker_bass_factoredglobal_87
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
				$car_rocker_bass_factoredglobal_87
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
				$car_rocker_bass_factoredglobal_86
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
				$car_rocker_bass_factoredglobal_86
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
				$car_rocker_bass_factoredglobal_86
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
				$car_rocker_bass_factoredglobal_87
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
				$car_rocker_bass_factoredglobal_86
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
				$car_rocker_bass_factoredglobal_87
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
				$car_rocker_bass_factoredglobal_86
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
				$car_rocker_bass_factoredglobal_87
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
				$car_rocker_bass_factoredglobal_86
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
				$car_rocker_bass_factoredglobal_86
			}
		]
	}
	{
		desc_id = bass_nhead_ibz_btb
		frontend_desc = qs(0x05df38f8)
		sponsor_id = ibanez
		mesh = `models/car_instruments/bass/ibanez/bass_nhead_ibz_btb`
		materials = [
			bass_nhead_ibz_btb_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/ibanez/bs_ibz_bcb_head`
				material = bass_nhead_ibz_btb_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cab_bs_ibz_btb_head_finishes
					}
					{
						$preset_layer_fades
						mask = $cab_bs_ibz_btb_head_fades
					}
					{
						$preset_layer_details
						mask = $cab_bs_ibz_btb_head_details
					}
				]
				$car_rocker_bass_factoredglobal_86
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
				$car_rocker_bass_factoredglobal_86
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
				$car_rocker_bass_factoredglobal_86
			}
		]
	}
	{
		desc_id = bass1_nvsft_nekhed_eleph1
		frontend_desc = qs(0xaf97e4fb)
		mesh = `models/car_instruments/bass/heroes/bass1_nvsft_nekhed_eleph1`
		materials = [
			bass1_nvsft_nekhed_eleph1_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/heroes/bass1_neckhead_eleph_d`
				material = bass1_nvsft_nekhed_eleph1_primary
			}
		]
	}
	{
		desc_id = bass108_neckhead
		frontend_desc = qs(0x1e5cfb0b)
		mesh = `models/car_instruments/bass/heroes/bass108_neckhead`
		materials = [
			bass108_neckhead_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/heroes/bass108_neckhead_d`
				material = bass108_neckhead_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $bass108_neckhead_finishes
					}
					{
						$preset_layer_fades
						mask = $bass108_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $bass108_neckhead_details
					}
				]
				$car_rocker_bass_factoredglobal_86
			}
		]
	}
	{
		desc_id = bass109_neckhead
		frontend_desc = qs(0x3ffdff2c)
		mesh = 0x4b7fcd18
		materials = [
			bass109_neckhead_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/heroes/bass109_neckhead_d`
				material = 0xaa92161c
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $0xe7f96cd0
					}
					{
						$preset_layer_fades
						mask = $0x16d75970
					}
					{
						$preset_layer_details
						mask = $0xcff1f710
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						x_trans = -20
						y_trans = -26
						x_scale = 21
						y_scale = 21
					}
				}
			}
		]
	}
	{
		desc_id = bs_clawhead001
		frontend_desc = qs(0x70358bc5)
		mesh = `models/car_instruments/bass/heroes/bs_clawhead001`
		materials = [
			bass120_nhead01_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/heroes/bass_neckhead_claw`
				material = bass120_nhead01_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $bass120_neckhead_finishes
					}
				]
				$car_rocker_bass_factoredglobal_86
			}
		]
	}
	{
		desc_id = bass132_neckhead
		frontend_desc = qs(0xd690f064)
		mesh = 0x2a7d50ee
		materials = [
			bass132_neckhead_hardware
		]
	}
	{
		desc_id = bs141_neckhead
		frontend_desc = qs(0xd5066052)
		mesh = `models/car_instruments/bass/heroes/bs141_neckhead`
		materials = [
			bass141_neckhead_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/heroes/bas141_neckhead`
				material = bass141_neckhead_primary
				preset_layers = [
				]
				$car_rocker_bass_factoredglobal_86
			}
		]
	}
	{
		desc_id = bass133_neckhead
		frontend_desc = qs(0xa337ae91)
		mesh = `models/car_instruments/bass/heroes/bass133_neckhead`
		materials = [
			bass133_neckhead_hardware
		]
	}
	{
		desc_id = bass135_neckhead
		frontend_desc = qs(0xcd6effcf)
		mesh = `models/car_instruments/bass/heroes/bass135_neckhead`
		materials = [
			bass135_neckhead_hardware
		]
	}
	{
		desc_id = bass136_neckhead
		frontend_desc = qs(0x83449086)
		mesh = `models/car_instruments/bass/heroes/bass136_neckhead`
		materials = [
			bass136_neckhead_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/heroes/bass136_neckhead_d`
				material = bass136_neckhead_primary
				preset_layers = [
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						x_trans = -30
						y_trans = -30
						x_scale = 23
						y_scale = 18
					}
				}
			}
		]
	}
	{
		desc_id = bas143_chainsaw_nhead
		frontend_desc = qs(0x2c2c2610)
		mesh = `models/car_instruments/bass/heroes/bas143_chainsaw_nhead`
		materials = [
			bass143_neckhead_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/heroes/bas143_chainhead_d`
				material = bass143_neckhead_primary
				preset_layers = [
				]
				$car_rocker_bass_factoredglobal_86
			}
		]
	}
	{
		desc_id = bass1b_neckhead_sk8
		frontend_desc = qs(0x39ddbf5c)
		mesh = `models/car_instruments/bass/heroes/bass1b_neckhead_sk8`
		materials = [
			bass1b_neckhead_sk8_hardware
		]
	}
]
cas_bass_misc = [
	{
		desc_id = bass1_nvsft_eleph_misc1
		frontend_desc = qs(0x271fba67)
		materials = [
			bass1_nvsft_elep_misc1_primary
		]
		node_meshes = {
			$bass_misc_nodes
			placements = [
				{
					parents = [
						bass1_nvsft_elephant_body
					]
					node_set = 3
					meshes = [
						{
							mesh = `models/car_instruments/bass/heroes/bass1_nvsft_eleph_misc1`
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
		desc_id = bass_mm_bigal_misc_1
		frontend_desc = qs(0xae3d4159)
		materials = [
			bass_mm_knob001_primary
		]
		node_meshes = {
			$bass_misc_nodes
			placements = [
				{
					parents = [
						bass_musicman_bigal
					]
					node_set = 4
					meshes = [
						{
							mesh = `models/car_instruments/bass/musicman/bass_mm_knob003`
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
		desc_id = bass13_misc
		frontend_desc = qs(0x93a392c2)
		materials = [
			bass13_misc_primary
		]
		node_meshes = {
			$bass_misc_nodes
			placements = [
				{
					parents = [
						bass120_clawed
						bass14_esp_surveyor
						bas143_chainsaw
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/bass/esp/bass13_misc`
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
		desc_id = bass132_misc
		frontend_desc = qs(0x0fa2adb3)
		materials = [
			bass132_misc_primary
		]
		node_meshes = {
			$bass_misc_nodes
			placements = [
				{
					parents = [
						bass132_axe
					]
					node_set = 0
					meshes = [
						{
							mesh = 0x58ffb8c7
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
		desc_id = bass133_misc
		frontend_desc = qs(0x2068ab3e)
		materials = [
			bass133_misc_primary
		]
		node_meshes = {
			$bass_misc_nodes
			placements = [
				{
					parents = [
						bass133_tiki
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/bass/heroes/bass133_misc`
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
		desc_id = bass135_misc
		frontend_desc = qs(0x1d343a31)
		materials = [
			bass135_misc_primary
		]
		node_meshes = {
			$bass_misc_nodes
			placements = [
				{
					parents = [
						bass135_smoke
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/bass/heroes/bass135_misc`
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
		desc_id = bass136_misc
		frontend_desc = qs(0x93dbe073)
		materials = [
			bass136_misc_primary
		]
		node_meshes = {
			$bass_misc_nodes
			placements = [
				{
					parents = [
						bass136_glass
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/bass/heroes/bass136_misc`
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
		desc_id = bass143_misc
		frontend_desc = qs(0x9047cdc6)
		materials = [
			bas143_misc001_primary
		]
		node_meshes = {
			$bass_misc_nodes
			placements = [
				{
					parents = [
						bas143_chainsaw
					]
					node_set = 2
					meshes = [
						{
							mesh = `models\car_instruments\bass\heroes\bas143_misc002`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models\car_instruments\bass\heroes\bas143_misc001`
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
		desc_id = bass1b_misc_wheels
		frontend_desc = qs(0x28706c65)
		materials = [
			bass1b_misc_wheels_primary
		]
		node_meshes = {
			$bass_misc_nodes
			placements = [
				{
					parents = [
						bass1b_nvsft_sk8gtr
					]
					node_set = 3
					meshes = [
						{
							mesh = `models/car_instruments/bass/heroes/bass1b_misc_wheels`
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
		desc_id = None
		frontend_desc = qs(0x9c1b5214)
	}
]
car_rocker_bass_factoredglobal_0 = {
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
car_rocker_bass_factoredglobal_4 = {
	has_node_array
	locked
}
car_rocker_bass_factoredglobal_6 = {
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
car_rocker_bass_factoredglobal_9 = {
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
car_rocker_bass_factoredglobal_11 = {
	user_layer_settings = {
		diffuse
		ui_rotated_90
		initial_values = {
			x_trans = -27
			y_trans = 27
			y_scale = 16
			x_scale = 15
		}
		aspect_ratio = 1.75
	}
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
car_rocker_bass_factoredglobal_85 = {
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
car_rocker_bass_factoredglobal_86 = {
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
car_rocker_bass_factoredglobal_87 = {
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
