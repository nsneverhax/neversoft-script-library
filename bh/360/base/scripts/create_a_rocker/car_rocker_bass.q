CAS_Bass_Body = [
	{
		desc_id = Bass9_ESP_AX_01
		frontend_desc = qs(0x13982024)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Bass/ESP/Bass9_ESP_AX_01`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex\models\CAR_Instruments\Bass\ESP\bass9_esp_ax_d`
				material = Bass9_ESP_AX_01_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_ESP_AX_Finishes
					}
					{
						$preset_layer_fades
						mask = $CAB_ESP_AX_fades
					}
					{
						$preset_layer_details
						mask = $CAB_ESP_AX_Details
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
				part = CAS_Bass_Neck
				valid = [
					Bass_Fretboard_22a
					Bass_Fretboard_22b
					Bass_Fretboard_22c
					Bass_Fretboard_22d
					Bass_Fretboard_24
					Bass_Fretboard_24b
					Bass_Fretboard_24c
					Bass_Fretboard_24d
				]
			}
			{
				part = CAS_Bass_Pickguards
				valid = [
					None
				]
			}
			{
				part = CAS_Bass_Pickups
				valid = [
					Bass9_Pkup_Type1_Blk_02
					Bass9_Pkup_Type2_Blk_03
					Bass9_Pkup_Type3_Blk_2
				]
			}
			{
				part = CAS_Bass_Knobs
				valid = [
					Bass9_ESP_Knob_10_04
					Bass9_Knob_02
					Bass9_Knob_03
					Bass9_Knob_04
					Bass9_Knob_05
				]
			}
			{
				part = CAS_bass_Bridges
				valid = [
					Bass9_Bridge_4str_01
				]
			}
			{
				part = CAS_Bass_Head
				valid = [
					Bass9_Neckhead_01
					Bass9_Neckhead_02
					Bass9_Neckhead_03
					Bass9_Neckhead_04
					Bass9_Neckhead_05
				]
			}
			{
				part = CAS_Bass_Misc
				valid = [
					None
				]
			}
		]
	}
	{
		desc_id = Bass17_ESP_EC_01
		frontend_desc = qs(0x9f1df0f7)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Bass/ESP/Bass17_ESP_EC_01`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex\models\CAR_Instruments\Bass\ESP\bass17_esp_ec_d`
				material = Bass17_ESP_EC_01_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_ESP_EC_Finishes
					}
					{
						$preset_layer_fades
						mask = $CAB_ESP_EC_fades
					}
					{
						$preset_layer_details
						mask = $CAB_ESP_EC_Details
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
				part = CAS_Bass_Neck
				valid = [
					Bass_Fretboard_22a
					Bass_Fretboard_22b
					Bass_Fretboard_22c
					Bass_Fretboard_22d
					Bass_Fretboard_24
					Bass_Fretboard_24b
					Bass_Fretboard_24c
					Bass_Fretboard_24d
				]
			}
			{
				part = CAS_Bass_Pickguards
				valid = [
					None
				]
			}
			{
				part = CAS_Bass_Pickups
				valid = [
					Bass9_Pkup_Type1_Blk_02
					Bass9_Pkup_Type2_Blk_03
					Bass9_Pkup_Type3_Blk_2
				]
			}
			{
				part = CAS_Bass_Knobs
				valid = [
					Bass17_ESP_Knob_10
					bass17_knob_02
					bass17_knob_03
					bass17_knob_04
					bass17_knob_05
				]
			}
			{
				part = CAS_bass_Bridges
				valid = [
					Bass17_Bridge_4str_04
					Bass17_Bridge_4str_05
				]
			}
			{
				part = CAS_Bass_Head
				valid = [
					Bass14_Neckhead_03
					Bass14_Neckhead_04
					Bass14_Neckhead_01
					Bass14_Neckhead_02
					Bass14_Neckhead_05
				]
			}
			{
				part = CAS_Bass_Misc
				valid = [
					None
				]
			}
		]
	}
	{
		desc_id = Bass63_EX
		frontend_desc = qs(0x109e1b5b)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Bass/ESP/Bass63_EX`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex\models\CAR_Instruments\Bass\ESP\bass63_ex_d`
				material = Bass63_EX_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $Bass63_EX_Finishes
					}
					{
						$preset_layer_fades
						mask = $Bass63_EX_fades
					}
					{
						$preset_layer_details
						mask = $Bass63_EX_Details
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
				part = CAS_Bass_Neck
				valid = [
					Bass_Fretboard_22a
					Bass_Fretboard_22b
					Bass_Fretboard_22c
					Bass_Fretboard_22d
					Bass_Fretboard_24
					Bass_Fretboard_24b
					Bass_Fretboard_24c
					Bass_Fretboard_24d
				]
			}
			{
				part = CAS_Bass_Pickguards
				valid = [
					None
				]
			}
			{
				part = CAS_Bass_Pickups
				valid = [
					Bass9_Pkup_Type1_Blk_02
					Bass9_Pkup_Type2_Blk_03
					Bass9_Pkup_Type3_Blk_2
				]
			}
			{
				part = CAS_Bass_Knobs
				valid = [
					Bass63_Knob_Type1
					Bass63_Knob_Type2
					Bass63_Knob_Type3
					Bass63_Knob_Type4
					Bass63_Knob_Type5
				]
			}
			{
				part = CAS_bass_Bridges
				valid = [
					Bass17_Bridge_4str_05
				]
			}
			{
				part = CAS_Bass_Head
				valid = [
					Bass63_Neckhead
					Bass63_Neckhead_02
					Bass63_Neckhead_03
					Bass63_Neckhead_04
					Bass63_Neckhead_05
				]
			}
			{
				part = CAS_Bass_Misc
				valid = [
					None
				]
			}
		]
	}
	{
		desc_id = Bass64_F405
		frontend_desc = qs(0x92a23c9d)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Bass/ESP/Bass64_F405`
		cap_textures = [
			{
				base_tex = `tex/models/CAR_Instruments/Bass/ESP/bass64_f405_d`
				material = Bass64_F405_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $Bass64_F405_Finishes
					}
					{
						$preset_layer_fades
						mask = $Bass64_F405_fades
					}
					{
						$preset_layer_details
						mask = $Bass64_F405_Details
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
				part = CAS_Bass_Neck
				valid = [
					Bass_Fretboard_22a
					Bass_Fretboard_22b
					Bass_Fretboard_22c
					Bass_Fretboard_22d
					Bass_Fretboard_24
					Bass_Fretboard_24b
					Bass_Fretboard_24c
					Bass_Fretboard_24d
				]
			}
			{
				part = CAS_Bass_Pickguards
				valid = [
					None
				]
			}
			{
				part = CAS_Bass_Pickups
				valid = [
					Bass9_Pkup_Type1_Blk_02
					Bass9_Pkup_Type2_Blk_03
					Bass9_Pkup_Type3_Blk_2
				]
			}
			{
				part = CAS_Bass_Knobs
				valid = [
					Bass64_ESP_Knob_01
					Bass64_ESP_Knob_02
					Bass64_ESP_Knob_03
					Bass64_ESP_Knob_04
					Bass64_ESP_Knob_05
				]
			}
			{
				part = CAS_bass_Bridges
				valid = [
					Bass17_Bridge_4str_05
					Bass9_Bridge_4str_01b
				]
			}
			{
				part = CAS_Bass_Head
				valid = [
					Bass64_Neckhead
					Bass64_Neckhead_02
					Bass64_Neckhead_03
					Bass64_Neckhead_04
					Bass64_Neckhead_05
				]
			}
			{
				part = CAS_Bass_Misc
				valid = [
					None
				]
			}
		]
		locked
	}
	{
		desc_id = Bass14_ESP_Surveyor
		frontend_desc = qs(0xd3e7edae)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Bass/ESP/Bass14_ESP_Surveyor`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex\models\CAR_Instruments\Bass\ESP\bass14_esp_surveyor_d`
				material = Bass14_ESP_Surveyor_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_ESP_Surveyor_Finishes
					}
					{
						$preset_layer_fades
						mask = $CAB_ESP_Surveyor_fades
					}
					{
						$preset_layer_details
						mask = $CAB_ESP_Surveyor_Details
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
				part = CAS_Bass_Neck
				valid = [
					Bass_Fretboard_22a
					Bass_Fretboard_22b
					Bass_Fretboard_22c
					Bass_Fretboard_22d
					Bass_Fretboard_24
					Bass_Fretboard_24b
					Bass_Fretboard_24c
					Bass_Fretboard_24d
				]
			}
			{
				part = CAS_Bass_Pickguards
				valid = [
					None
				]
			}
			{
				part = CAS_Bass_Pickups
				valid = [
					Bass9_Pkup_Type1_Blk_02
					Bass9_Pkup_Type2_Blk_03
					Bass9_Pkup_Type3_Blk_2
				]
			}
			{
				part = CAS_Bass_Knobs
				valid = [
					Bass14_ESP_Knob_10_04
					Bass14_knob_02
					Bass14_knob_03
					Bass14_knob_04
					Bass14_knob_05
				]
			}
			{
				part = CAS_bass_Bridges
				valid = [
					Bass14_Bridge_4str_01
					Bass14_Bridge_4str_02
				]
			}
			{
				part = CAS_Bass_Head
				valid = [
					Bass14_Neckhead_04
					Bass14_Neckhead_01
					Bass14_Neckhead_02
					Bass14_Neckhead_03
					Bass14_Neckhead_05
				]
			}
			{
				part = CAS_Bass_Misc
				valid = [
					None
				]
			}
		]
	}
	{
		desc_id = Bass102_Axe
		frontend_desc = qs(0xe1122dfb)
		mesh = `models/CAR_Instruments/Bass/Heroes/Bass102_Axe`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/CAR_Instruments/bass/Heroes/Bass102_Axe_D`
				material = Bass102_Axe_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $Bass102_Axe_Finishes
					}
					{
						$preset_layer_fades
						mask = $Bass102_Axe_Fades
					}
					{
						$preset_layer_details
						mask = $Bass102_Axe_Details
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
				part = CAS_Bass_Neck
				valid = [
					CAB_22_Heroes01
					CAB_22_Heroes02
					CAB_22_Heroes03
					CAB_22_Heroes04
					CAB_24_Heroes01
					CAB_24_Heroes02
					CAB_24_Heroes03
					CAB_24_Heroes04
				]
			}
			{
				part = CAS_Bass_Pickguards
				valid = [
					None
				]
			}
			{
				part = CAS_Bass_Pickups
				valid = [
					Bass_EMGpickup1
					Bass_EMGpickup1b
					Bass_EMGpickup2
					Bass_EMGpickup2b
					Bass_EMGpickup3
					Bass_EMGpickup3b
					Bass_pickup_SD
				]
			}
			{
				part = CAS_Bass_Knobs
				valid = [
					Bass_Knob_01
					Bass_Knob_02
					Bass_Knob_03
					Bass_Knob_04
					Bass_Knob_05
					Bass_Knob_06
					Bass_Knob_07
					Bass_Knob_08
					Bass_Knob_09
					Bass_Knob_10
				]
			}
			{
				part = CAS_bass_Bridges
				valid = [
					BS_Sch_Brdg_A
					Bass100_bridge
				]
			}
			{
				part = CAS_Bass_Head
				valid = [
					Bass102_neckhead
					bass104_neckhead
					bass105_neckhead_B
				]
			}
			{
				part = CAS_Bass_Misc
				valid = [
					None
				]
			}
		]
		$car_rocker_bass_factoredGlobal_6
	}
	{
		desc_id = Bass103_Cross
		frontend_desc = qs(0xefb65903)
		mesh = `models/CAR_Instruments/Bass/Heroes/Bass103_Cross`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/CAR_Instruments/bass/Heroes/bass103_cross_d`
				material = Bass103_Cross_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $Bass103_Cross_Finishes
					}
					{
						$preset_layer_fades
						mask = $Bass103_Cross_Fades
					}
					{
						$preset_layer_details
						mask = $Bass103_Cross_Details
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
				part = CAS_Bass_Neck
				valid = [
					CAB_22_Heroes01
					CAB_22_Heroes02
					CAB_22_Heroes03
					CAB_22_Heroes04
					CAB_24_Heroes01
					CAB_24_Heroes02
					CAB_24_Heroes03
					CAB_24_Heroes04
				]
			}
			{
				part = CAS_Bass_Pickguards
				valid = [
					None
				]
			}
			{
				part = CAS_Bass_Pickups
				valid = [
					Bass_EMGpickup1
					Bass_EMGpickup1b
					Bass_EMGpickup2
					Bass_EMGpickup2b
					Bass_EMGpickup3
					Bass_EMGpickup3b
					Bass_pickup_SD
				]
			}
			{
				part = CAS_Bass_Knobs
				valid = [
					Bass_Knob_01
					Bass_Knob_02
					Bass_Knob_03
					Bass_Knob_04
					Bass_Knob_05
					Bass_Knob_06
					Bass_Knob_07
					Bass_Knob_08
					Bass_Knob_09
					Bass_Knob_10
				]
			}
			{
				part = CAS_bass_Bridges
				valid = [
					BS_Sch_Brdg_A
					Bass100_bridge
				]
			}
			{
				part = CAS_Bass_Head
				valid = [
					Bass102_neckhead
					bass104_neckhead
					bass105_neckhead_B
				]
			}
			{
				part = CAS_Bass_Misc
				valid = [
					None
				]
			}
		]
		$car_rocker_bass_factoredGlobal_6
	}
	{
		desc_id = Bass104_Skull
		frontend_desc = qs(0xa40aefbe)
		mesh = `models/CAR_Instruments/Bass/Heroes/Bass104_Skull`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/bass/Heroes/bass104_skull_d`
				material = Bass104_Skull_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $Bass104_Skull_Finishes
					}
					{
						$preset_layer_fades
						mask = $Bass104_Skull_Fades
					}
					{
						$preset_layer_details
						mask = $Bass104_Skull_Details
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
				part = CAS_Bass_Neck
				valid = [
					CAB_22_Heroes01
					CAB_22_Heroes02
					CAB_22_Heroes03
					CAB_22_Heroes04
					CAB_24_Heroes01
					CAB_24_Heroes02
					CAB_24_Heroes03
					CAB_24_Heroes04
				]
			}
			{
				part = CAS_Bass_Pickguards
				valid = [
					None
				]
			}
			{
				part = CAS_Bass_Pickups
				valid = [
					Bass_EMGpickup1
					Bass_EMGpickup1b
					Bass_EMGpickup2
					Bass_EMGpickup2b
					Bass_EMGpickup3
					Bass_EMGpickup3b
					Bass_pickup_SD
				]
			}
			{
				part = CAS_Bass_Knobs
				valid = [
					Bass_Knob_01
					Bass_Knob_02
					Bass_Knob_03
					Bass_Knob_04
					Bass_Knob_05
					Bass_Knob_06
					Bass_Knob_07
					Bass_Knob_08
					Bass_Knob_09
					Bass_Knob_10
				]
			}
			{
				part = CAS_bass_Bridges
				valid = [
					BS_Sch_Brdg_A
					Bass100_bridge
				]
			}
			{
				part = CAS_Bass_Head
				valid = [
					bass104_neckhead
					Bass102_neckhead
					bass105_neckhead_B
				]
			}
			{
				part = CAS_Bass_Misc
				valid = [
					None
				]
			}
		]
		$car_rocker_bass_factoredGlobal_6
	}
	{
		desc_id = Bass105_pin
		frontend_desc = qs(0x4829c7e8)
		mesh = `models/CAR_Instruments/Bass/Heroes/Bass105_pin`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/CAR_Instruments/bass/Heroes/bass105_pin_d`
				material = Bass105_pin_Primary
			}
		]
		inclusion = [
			{
				part = CAS_Bass_Neck
				valid = [
					CAB_22_Heroes04
				]
			}
			{
				part = CAS_Bass_Pickguards
				valid = [
					None
				]
			}
			{
				part = CAS_Bass_Pickups
				valid = [
					Bass_EMGpickup3b
				]
			}
			{
				part = CAS_Bass_Knobs
				valid = [
					Bass_Knob_01
					Bass_Knob_02
					Bass_Knob_03
					Bass_Knob_04
					Bass_Knob_05
					Bass_Knob_06
					Bass_Knob_07
					Bass_Knob_08
					Bass_Knob_09
					Bass_Knob_10
				]
			}
			{
				part = CAS_bass_Bridges
				valid = [
					BS_Sch_Brdg_A
					Bass100_bridge
				]
			}
			{
				part = CAS_Bass_Head
				valid = [
					bass105_neckhead
					Bass102_neckhead
					bass104_neckhead
				]
			}
			{
				part = CAS_Bass_Misc
				valid = [
					None
				]
			}
		]
		$car_rocker_bass_factoredGlobal_6
	}
	{
		desc_id = IBANEZ_ICB_Body
		frontend_desc = qs(0xa54f4110)
		mesh = `models/CAR_Instruments/Bass/Ibanez/IBANEZ_ICB_Body`
		sponsor_id = Ibanez
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/CAR_Instruments/Bass/Ibanez/bs_ibz_icb_body`
				material = BS_IBZ_ICB_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_IBZ_ICB_Finishes
					}
					{
						$preset_layer_fades
						mask = $CAB_IBZ_ICB_fades
					}
					{
						$preset_layer_details
						mask = $CAB_IBZ_ICB_Details
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
				part = CAS_Bass_Neck
				valid = [
					Bass_IBZ_Fretboard_22a
					Bass_IBZ_Fretboard_22b
					Bass_IBZ_Fretboard_22c
					Bass_IBZ_Fretboard_22d
					Bass_IBZ_Fretboard_24
					Bass_IBZ_Fretboard_24b
					Bass_IBZ_Fretboard_24c
					Bass_IBZ_Fretboard_24d
				]
			}
			{
				part = CAS_Bass_Pickguards
				valid = [
					None
				]
			}
			{
				part = CAS_Bass_Pickups
				valid = [
					Bas_Pickup_Ibz01
					BAS_IBZ_PKUP002
					Bass_pickup_SD
					Bass_Pickup_EMG01
					Bass_EMGpickup1
					Bass_EMGpickup1b
					Bass_EMGpickup2
					Bass_EMGpickup2b
					Bass_EMGpickup3
					Bass_EMGpickup3b
				]
			}
			{
				part = CAS_Bass_Knobs
				valid = [
					Knob_Knurl02
					Bass_Knob_01
					Bass_Knob_02
					Bass_Knob_03
					Bass_Knob_04
					Bass_Knob_05
					Bass_Knob_06
					Bass_Knob_07
					Bass_Knob_08
					Bass_Knob_09
					Bass_Knob_10
				]
			}
			{
				part = CAS_bass_Bridges
				valid = [
					Bas_Brdg_Ibz01
					Bas_Brdg_SCH_T2
					Bas_Brdg_Ibz_Mono
					bas_brdg_capsule
				]
			}
			{
				part = CAS_Bass_Head
				valid = [
					BS_IBZ_ICB_HEAD
					BS_IBZ_ICB_HEAD02
				]
			}
			{
				part = CAS_Bass_Misc
				valid = [
					None
				]
			}
		]
		$car_rocker_bass_factoredGlobal_6
	}
	{
		desc_id = BAS_IBZ_SR505
		frontend_desc = qs(0x475ac684)
		mesh = `models/CAR_Instruments/Bass/Ibanez/BAS_IBZ_SR505`
		sponsor_id = Ibanez
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex\models\CAR_Instruments\Bass\Ibanez\bs_ibz_sr_body`
				material = BS_Ibz_SR_Body_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_IBZ_SR_Finishes
					}
					{
						$preset_layer_fades
						mask = $CAB_IBZ_SR_Fades
					}
					{
						$preset_layer_details
						mask = $CAB_IBZ_SR_Details
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
				part = CAS_Bass_Neck
				valid = [
					Bass_Fretboard_SR_24A
					Bass_Fretboard_SR_24b
					Bass_Fretboard_SR_24d
				]
			}
			{
				part = CAS_Bass_Pickguards
				valid = [
					None
				]
			}
			{
				part = CAS_Bass_Pickups
				valid = [
					BAS_IBZ_PKUP002
					Bas_Pickup_Ibz01
					Bass_pickup_SD
					Bass_MM_SR_Pkup_Type5
					Bass_Pickup_EMG01
					Bass_EMGpickup1
					Bass_EMGpickup1b
					Bass_EMGpickup2
					Bass_EMGpickup2b
					Bass_EMGpickup3
					Bass_EMGpickup3b
				]
			}
			{
				part = CAS_Bass_Knobs
				valid = [
					Knob_Knurl02
					Bass_Knob_01
					Bass_Knob_02
					Bass_Knob_03
					Bass_Knob_04
					Bass_Knob_05
					Bass_Knob_06
					Bass_Knob_07
					Bass_Knob_08
					Bass_Knob_09
					Bass_Knob_10
				]
			}
			{
				part = CAS_bass_Bridges
				valid = [
					Bas_Brdg_Ibz01
					Bas_Brdg_SCH_T2
					Bas_Brdg_Ibz_Mono
					bas_brdg_capsule
				]
			}
			{
				part = CAS_Bass_Head
				valid = [
					BAS_IBZ_SR_Head01
					BAS_IBZ_SR_Head02
				]
			}
			{
				part = CAS_Bass_Misc
				valid = [
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = Bass15_McSwain_Machine
		frontend_desc = qs(0xc2e7c0f1)
		sponsor_id = McSwain
		mesh = `models/CAR_Instruments/Bass/McSwain/Bass15_McSwain_Machine`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/CAR_Instruments/Bass/McSwain/bass15_mcswain_machine_d`
				material = Bass15_McSwain_Machine_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $Bass15_McSwain_Finishes
					}
					{
						$preset_layer_fades
						mask = $Bass15_McSwain_fades
					}
					{
						$preset_layer_details
						mask = $Bass15_McSwain_Details
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
				part = CAS_Bass_Neck
				valid = [
					Bass_McSwain_Fboard22a
					Bass_McSwain_Fboard22b
					Bass_McSwain_Fboard22c
					Bass_McSwain_Fboard22d
					Bass_McSwain_Fboard24
					Bass_McSwain_Fboard24b
					Bass_McSwain_Fboard24c
					Bass_McSwain_Fboard24d
				]
			}
			{
				part = CAS_Bass_Pickguards
				valid = [
					None
				]
			}
			{
				part = CAS_Bass_Pickups
				valid = [
					Bass_pickup_SD
					Bass_EMGpickup1
					Bass_EMGpickup1b
					Bass_EMGpickup2
					Bass_EMGpickup2b
					Bass_EMGpickup3
					Bass_EMGpickup3b
				]
			}
			{
				part = CAS_Bass_Knobs
				valid = [
					Bass_Knob_01
					Bass_Knob_02
					Bass_Knob_03
					Bass_Knob_04
					Bass_Knob_05
					Bass_Knob_06
					Bass_Knob_07
					Bass_Knob_08
					Bass_Knob_09
					Bass_Knob_10
				]
			}
			{
				part = CAS_bass_Bridges
				valid = [
					Bass15_Bridge_McSwain1
				]
			}
			{
				part = CAS_Bass_Head
				valid = [
					Bass15_Neckhead_McSwain11
				]
			}
			{
				part = CAS_Bass_Misc
				valid = [
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = Bass_MM_StingRay
		frontend_desc = qs(0xc6739ae3)
		sponsor_id = `Music	Man`
		mesh = `models/CAR_Instruments/Bass/Musicman/Bass_MM_StingRay`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/CAR_Instruments/Bass/Musicman/bass_body_mm_stingray_d`
				material = Bass_MM_StingRay_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_Musicman_StingRay_Finishes
					}
					{
						$preset_layer_fades
						mask = $CAB_Musicman_StingRay_Fades
					}
					{
						$preset_layer_details
						mask = $CAB_Musicman_StingRay_Details
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
				part = CAS_Bass_Neck
				valid = [
					Bass_MM_Fretboard_22a
					Bass_MM_Fretboard_22b
					Bass_MM_Fretboard_22c
					Bass_MM_Fretboard_22d
					Bass_MM_Fretboard_24
					Bass_MM_Fretboard_24b
					Bass_MM_Fretboard_24c
					Bass_MM_Fretboard_24d
				]
			}
			{
				part = CAS_Bass_Pickguards
				valid = [
					Bass_Pickguard_MM_SR
					None
				]
			}
			{
				part = CAS_Bass_Pickups
				valid = [
					Bass_EMGpickup1
					Bass_EMGpickup1b
					Bass_EMGpickup2
					Bass_EMGpickup2b
					Bass_EMGpickup3
					Bass_EMGpickup3b
				]
			}
			{
				part = CAS_Bass_Knobs
				valid = [
					Bass_Knob_01
					Bass_Knob_02
					Bass_Knob_03
					Bass_Knob_04
					Bass_Knob_05
					Bass_Knob_06
					Bass_Knob_07
					Bass_Knob_08
					Bass_Knob_09
					Bass_Knob_10
				]
			}
			{
				part = CAS_bass_Bridges
				valid = [
					Bass_MM_Bridge_SR_1
				]
			}
			{
				part = CAS_Bass_Head
				valid = [
					Bass_MM_Neckhead_1
				]
			}
			{
				part = CAS_Bass_Misc
				valid = [
					Bass_MM_SR_Misc_1
					None
				]
			}
		]
		$car_rocker_bass_factoredGlobal_6
	}
	{
		desc_id = Bass_Schect_030
		frontend_desc = qs(0xa1a6df33)
		sponsor_id = Schecter
		mesh = `models/CAR_Instruments/Bass/Schecter/Bass_Schect_030`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/CAR_Instruments/Bass/Schecter/BS_Sch_Bod04_01`
				material = Bass_SCH001_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_SCH_004_Finishes
					}
					{
						$preset_layer_fades
						mask = $CAB_SCH_004_Fades
					}
					{
						$preset_layer_details
						mask = $CAB_SCH_004_Details
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
				part = CAS_Bass_Neck
				valid = [
					Bass_SCH_Fretboard_22a
					Bass_SCH_Fretboard_22b
					Bass_SCH_Fretboard_22c
					Bass_SCH_Fretboard_22d
					Bass_SCH_Fretboard_24c
					Bass_SCH_Fretboard_24b
					Bass_SCH_Fretboard_24
					Bass_SCH_Fretboard_24d
				]
			}
			{
				part = CAS_Bass_Pickguards
				valid = [
					BS_SCH_030_PGA
					None
				]
			}
			{
				part = CAS_Bass_Pickups
				valid = [
					Bass_EMGpickup3b
					Bass_pickup_SD
					Bass_Pickup_EMG01
					Bass_EMGpickup1
					Bass_EMGpickup1b
					Bass_EMGpickup2
					Bass_EMGpickup2b
					Bass_EMGpickup3
				]
			}
			{
				part = CAS_Bass_Knobs
				valid = [
					Knob_Knurl02
					Bass_Knob_02
					Bass_Knob_03
					Bass_Knob_09
					Bass_Knob_TopHat
					Bass_Knob_04
					Bass_Knob_05
					Bass_Knob_06
					Bass_Knob_07
					Bass_Knob_08
				]
			}
			{
				part = CAS_bass_Bridges
				valid = [
					BS_Sch_Brdg_A
					Bas_Brdg_SCH_T
					Bas_Brdg_Sch_C
					bas_brdg_capsule
				]
			}
			{
				part = CAS_Bass_Head
				valid = [
					BS_SCH_030_NHEAD01
					BS_SCH_030_NHEAD02
					BS_SCH_030_NHEAD03
				]
			}
			{
				part = CAS_Bass_Misc
				valid = [
					None
				]
			}
		]
		$car_rocker_bass_factoredGlobal_6
	}
	{
		desc_id = BS_SCH_T_Body
		frontend_desc = qs(0xcf7a4c6e)
		sponsor_id = Schecter
		mesh = `models/CAR_Instruments/Bass/Schecter/BS_SCH_T_Body`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex\models\CAR_Instruments\Bass\Schecter\bs_sch_modelt`
				material = BS_Sch_ModelT_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_SCH_MODELT_Finishes
					}
					{
						$preset_layer_fades
						mask = $CAB_SCH_MODELT_fades
					}
					{
						$preset_layer_details
						mask = $CAB_SCH_MODELT_Details
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
				part = CAS_Bass_Neck
				valid = [
					Bass_SCH_Fretboard_22a
					Bass_SCH_Fretboard_22b
					Bass_SCH_Fretboard_22c
					Bass_SCH_Fretboard_22d
					Bass_SCH_Fretboard_24c
					Bass_SCH_Fretboard_24b
					Bass_SCH_Fretboard_24
					Bass_SCH_Fretboard_24d
				]
			}
			{
				part = CAS_Bass_Pickguards
				valid = [
					BS_SCH_T_PGA
					None
				]
			}
			{
				part = CAS_Bass_Pickups
				valid = [
					Bass_EMGpickup3
					Bass_pickup_SD
					Bass_Pickup_EMG01
					Bass_EMGpickup1
					Bass_EMGpickup1b
					Bass_EMGpickup2
					Bass_EMGpickup2b
					Bass_EMGpickup3b
				]
			}
			{
				part = CAS_Bass_Knobs
				valid = [
					Knob_Knurl02
					Bass_Knob_01
					Bass_Knob_02
					Bass_Knob_03
					Bass_Knob_04
					Bass_Knob_05
					Bass_Knob_06
					Bass_Knob_07
					Bass_Knob_08
					Bass_Knob_09
					Knob_Knurl02
				]
			}
			{
				part = CAS_bass_Bridges
				valid = [
					BS_Sch_Brdg_A
					Bas_Brdg_SCH_T
					Bas_Brdg_Sch_C
					bas_brdg_capsule
				]
			}
			{
				part = CAS_Bass_Head
				valid = [
					BS_SCH_T_NHEAD
					BS_SCH_T_NHEAD02
					BS_SCH_T_NHEAD03
				]
			}
			{
				part = CAS_Bass_Misc
				valid = [
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = BAS_SCH_Stil
		frontend_desc = qs(0x7f18fb3a)
		sponsor_id = Schecter
		mesh = `models\CAR_Instruments\bass\Schecter\BAS_SCH_Stil`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex\models\CAR_Instruments\bass\Schecter\bas_sch_stil_bod`
				material = Bass_Stiletto_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_SCH_Stiletto_Finishes
					}
					{
						$preset_layer_fades
						mask = $CAB_SCH_Stiletto_Fades
					}
					{
						$preset_layer_details
						mask = $CAB_SCH_Stiletto_Details
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
				part = CAS_Bass_Neck
				valid = [
					Bass_SCH_Fretboard_22a
					Bass_SCH_Fretboard_22b
					Bass_SCH_Fretboard_22c
					Bass_SCH_Fretboard_22d
					Bass_SCH_Fretboard_24c
					Bass_SCH_Fretboard_24b
					Bass_SCH_Fretboard_24
					Bass_SCH_Fretboard_24d
				]
			}
			{
				part = CAS_Bass_Pickguards
				valid = [
					None
				]
			}
			{
				part = CAS_Bass_Pickups
				valid = [
					Bass_EMGpickup1
					Bass_Pickup_EMG01
					Bass_pickup_SD
					Bass_EMGpickup1b
					Bass_EMGpickup2
					Bass_EMGpickup2b
					Bass_EMGpickup3
					Bass_EMGpickup3b
				]
			}
			{
				part = CAS_Bass_Knobs
				valid = [
					Knob_Knurl02
					Bass_Knob_01
					Bass_Knob_02
					Bass_Knob_03
					Bass_Knob_04
					Bass_Knob_05
					Bass_Knob_06
					Bass_Knob_07
					Bass_Knob_08
					Bass_Knob_09
				]
			}
			{
				part = CAS_bass_Bridges
				valid = [
					BS_Sch_Brdg_A
					Bas_Brdg_SCH_T
					Bas_Brdg_Sch_C
					bas_brdg_capsule
				]
			}
			{
				part = CAS_Bass_Head
				valid = [
					BAS_Neckhead_SCH_STL
					BAS_Neckhead_SCH_STL02
					BAS_Neckhead_SCH_STL03
				]
			}
			{
				part = CAS_Bass_Misc
				valid = [
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = Bass110_Tony1
		frontend_desc = qs(0x8b5adefa)
		mesh = `models\CAR_Instruments\bass\NoDoubt\Bass110_Tony1`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex\models\CAR_Instruments\bass\nodoubt\Bass110_Tony1_D`
				material = Bass110_Tony1_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $Bass110_Tony1_Finishes
					}
					{
						$preset_layer_fades
						mask = $Bass110_Tony1_Fades
					}
					{
						$preset_layer_details
						mask = $Bass110_Tony1_Details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						x_trans = -37
						y_trans = 24
						y_scale = 20
						x_scale = 14
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = CAS_Bass_Neck
				valid = [
					CAB_22_Tony1
					CAB_22_Tony2
					CAB_22_Tony3
					CAB_22_Tony4
				]
			}
			{
				part = CAS_Bass_Pickguards
				valid = [
					bass110_pg
					bass111_pg
					None
				]
			}
			{
				part = CAS_Bass_Pickups
				valid = [
					Bass110_pickup
					Bass_MM_SR_Pkup_Type5
					Bass_pickup_SD
					Bass_Pickup_EMG01
					Bass_EMGpickup1
					Bass_EMGpickup1b
					Bass_EMGpickup2
					Bass_EMGpickup2b
					Bass_EMGpickup3
					Bass_EMGpickup3b
				]
			}
			{
				part = CAS_Bass_Knobs
				valid = [
					Bass_Knob_01
					Bass_Knob_02
					Bass_Knob_03
					Bass_Knob_04
					Bass_Knob_05
					Bass_Knob_06
					Bass_Knob_07
					Bass_Knob_08
					Bass_Knob_09
				]
			}
			{
				part = CAS_bass_Bridges
				valid = [
					Bass110_bridge
					bas_brdg_capsule
					Bas_Brdg_Sch_C
				]
			}
			{
				part = CAS_Bass_Head
				valid = [
					Bass110_Neckhead
				]
			}
			{
				part = CAS_Bass_Misc
				valid = [
					None
				]
			}
		]
		$car_rocker_bass_factoredGlobal_6
	}
]
CAS_Bass_Neck = [
	{
		desc_id = Bass_Fretboard_22a
		frontend_desc = qs(0x40f28e6a)
		mesh = `models/CAR_Instruments/bass/ESP/Bass_Fretboard_22a`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_02`
				material = Bass_Fretboard_22a_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_Fretboard_Inlays_22Fret
						$car_rocker_bass_factoredGlobal_17
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_02`
				material = Bass_Fretboard_22a_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_Inlay_06`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = Bass_Fretboard_22b
		frontend_desc = qs(0x403e976b)
		mesh = `models/CAR_Instruments/bass/ESP/Bass_Fretboard_22b`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_03`
				material = Bass_Fretboard_22b_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_Fretboard_Inlays_22Fret
						$car_rocker_bass_factoredGlobal_17
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_03`
				material = Bass_Fretboard_22b_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_Inlay_06`
						flags = 4
						Color = Black_1guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = Bass_Fretboard_22c
		frontend_desc = qs(0xec4e31fa)
		mesh = `models/CAR_Instruments/bass/ESP/Bass_Fretboard_22c`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_04`
				material = Bass_Fretboard_22c_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_Fretboard_Inlays_22Fret
						$car_rocker_bass_factoredGlobal_17
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_04`
				material = Bass_Fretboard_22c_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_Inlay_06`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = Bass_Fretboard_22d
		frontend_desc = qs(0x6398f5e4)
		mesh = `models/CAR_Instruments/bass/ESP/Bass_Fretboard_22d`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_05`
				material = Bass_Fretboard_22d_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_Fretboard_Inlays_22Fret
						$car_rocker_bass_factoredGlobal_17
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_05`
				material = Bass_Fretboard_22d_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_Inlay_06`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = Bass_Fretboard_24
		frontend_desc = qs(0xc0a291ea)
		mesh = `models/CAR_Instruments/bass/ESP/Bass_Fretboard_24`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d`
				material = Bass_Fretboard_24_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $Bass_Fretboard_24
						$car_rocker_bass_factoredGlobal_17
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d`
				material = Bass_Fretboard_24_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_24_inlay_05`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = Bass_Fretboard_24b
		frontend_desc = qs(0xa81d6c13)
		mesh = `models/CAR_Instruments/bass/ESP/Bass_Fretboard_24b`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_02`
				material = Bass_Fretboard_24b_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $Bass_Fretboard_24
						$car_rocker_bass_factoredGlobal_17
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_02`
				material = Bass_Fretboard_24b_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_24_inlay_05`
						flags = 4
						Color = Black_1guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = Bass_Fretboard_24c
		frontend_desc = qs(0x21ad5ed2)
		mesh = `models/CAR_Instruments/bass/ESP/Bass_Fretboard_24c`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_03`
				material = Bass_Fretboard_24c_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $Bass_Fretboard_24
						$car_rocker_bass_factoredGlobal_17
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_03`
				material = Bass_Fretboard_24c_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_24_inlay_05`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = Bass_Fretboard_24d
		frontend_desc = qs(0x8bbb0e9c)
		mesh = `models/CAR_Instruments/bass/ESP/Bass_Fretboard_24d`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_04`
				material = Bass_Fretboard_24d_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $Bass_Fretboard_24
						$car_rocker_bass_factoredGlobal_17
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_04`
				material = Bass_Fretboard_24d_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAB/ESP/Bass_Fretboard_24_inlay_05`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = Bass_Fretboard_SR_24A
		frontend_desc = qs(0x21ad5ed2)
		mesh = `models/CAR_Instruments/bass/Ibanez/Bass_Fretboard_SR_24`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d`
				material = Bass_Fretboard_24_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_Bass_Fretboard_SR24
						$car_rocker_bass_factoredGlobal_17
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d`
				material = Bass_Fretboard_24_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAB/Ibanez/Bass_SR24_INLAY001`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = Bass_Fretboard_SR_24b
		frontend_desc = qs(0xa81d6c13)
		mesh = `models/CAR_Instruments/bass/Ibanez/Bass_Fretboard_SR_24b`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_02`
				material = Bass_Fretboard_SR24b_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_Bass_Fretboard_SR24
						$car_rocker_bass_factoredGlobal_17
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_02`
				material = Bass_Fretboard_SR24b_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAB/Ibanez/Bass_SR24_INLAY001`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = Bass_Fretboard_SR_24d
		frontend_desc = qs(0x8bbb0e9c)
		mesh = `models/CAR_Instruments/bass/Ibanez/Bass_Fretboard_SR_24d`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_04`
				material = Bass_Fretboard_SR24d_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_Bass_Fretboard_SR24
						$car_rocker_bass_factoredGlobal_17
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_04`
				material = Bass_Fretboard_SR24d_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAB/Ibanez/Bass_SR24_INLAY001`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = Bass_IBZ_Fretboard_22a
		frontend_desc = qs(0xdbe5091e)
		mesh = `models/CAR_Instruments/bass/ESP/Bass_Fretboard_22a`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_02`
				material = Bass_Fretboard_22a_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_IBZ_Fboard_Inlays_21Fret
						$car_rocker_bass_factoredGlobal_18
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_02`
				material = Bass_Fretboard_22a_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAB/Ibanez/Bass_IBZ22_INLAY_67`
						flags = 4
						Color = grey_2guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = Bass_IBZ_Fretboard_22b
		frontend_desc = qs(0x403e976b)
		mesh = `models/CAR_Instruments/bass/ESP/Bass_Fretboard_22b`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_03`
				material = Bass_Fretboard_22b_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_IBZ_Fboard_Inlays_21Fret
						$car_rocker_bass_factoredGlobal_19
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_03`
				material = Bass_Fretboard_22b_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAB/Ibanez/Bass_IBZ22_INLAY_67`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = Bass_IBZ_Fretboard_22c
		frontend_desc = qs(0xec4e31fa)
		mesh = `models/CAR_Instruments/bass/ESP/Bass_Fretboard_22c`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_04`
				material = Bass_Fretboard_22c_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_IBZ_Fboard_Inlays_21Fret
						$car_rocker_bass_factoredGlobal_18
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_04`
				material = Bass_Fretboard_22c_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAB/Ibanez/Bass_IBZ22_INLAY_67`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = Bass_IBZ_Fretboard_22d
		frontend_desc = qs(0x6398f5e4)
		mesh = `models/CAR_Instruments/bass/ESP/Bass_Fretboard_22d`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_05`
				material = Bass_Fretboard_22d_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_IBZ_Fboard_Inlays_21Fret
						$car_rocker_bass_factoredGlobal_18
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_05`
				material = Bass_Fretboard_22d_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAB/Ibanez/Bass_IBZ22_INLAY_67`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = Bass_IBZ_Fretboard_24
		frontend_desc = qs(0xc0a291ea)
		mesh = `models/CAR_Instruments/bass/ESP/Bass_Fretboard_24`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d`
				material = Bass_Fretboard_24_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_IBZ_Fboard_Inlays_24Fret
						$car_rocker_bass_factoredGlobal_18
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d`
				material = Bass_Fretboard_24_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAB/Ibanez/Bass_IBZ24_INLAY_67`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = Bass_IBZ_Fretboard_24b
		frontend_desc = qs(0xa81d6c13)
		mesh = `models/CAR_Instruments/bass/ESP/Bass_Fretboard_24b`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_02`
				material = Bass_Fretboard_24b_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_IBZ_Fboard_Inlays_24Fret
						$car_rocker_bass_factoredGlobal_19
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_02`
				material = Bass_Fretboard_24b_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAB/Ibanez/Bass_IBZ24_INLAY_67`
						flags = 4
						Color = grey_2guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = Bass_IBZ_Fretboard_24c
		frontend_desc = qs(0x21ad5ed2)
		mesh = `models/CAR_Instruments/bass/ESP/Bass_Fretboard_24c`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_03`
				material = Bass_Fretboard_24c_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_IBZ_Fboard_Inlays_24Fret
						$car_rocker_bass_factoredGlobal_18
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_03`
				material = Bass_Fretboard_24c_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAB/Ibanez/Bass_IBZ24_INLAY_67`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = Bass_IBZ_Fretboard_24d
		frontend_desc = qs(0x8bbb0e9c)
		mesh = `models/CAR_Instruments/bass/ESP/Bass_Fretboard_24d`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_04`
				material = Bass_Fretboard_24d_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_IBZ_Fboard_Inlays_24Fret
						$car_rocker_bass_factoredGlobal_18
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_04`
				material = Bass_Fretboard_24d_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAB/Ibanez/Bass_IBZ24_INLAY_67`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = Bass_McSwain_Fboard22a
		frontend_desc = qs(0x40f28e6a)
		mesh = `models/CAR_Instruments/bass/ESP/Bass_Fretboard_22a`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_02`
				material = Bass_Fretboard_22a_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_McSwain_22Fret_Inlays
						$car_rocker_bass_factoredGlobal_18
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_02`
				material = Bass_Fretboard_22a_Primary
				pre_layer = [
					{
						Color = grey_5guitar
						texture = `tex/models/Characters/Layers/CAB/McSwain/22fret_LD07_McSwn_Bullets`
						flags = 36
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = Bass_McSwain_Fboard22b
		frontend_desc = qs(0x403e976b)
		mesh = `models/CAR_Instruments/bass/ESP/Bass_Fretboard_22b`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_03`
				material = Bass_Fretboard_22b_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_McSwain_22Fret_Inlays
						$car_rocker_bass_factoredGlobal_19
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_03`
				material = Bass_Fretboard_22b_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAB/McSwain/22fret_LD07_McSwn_Bullets`
						flags = 36
						Color = grey_3guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = Bass_McSwain_Fboard22c
		frontend_desc = qs(0xec4e31fa)
		mesh = `models/CAR_Instruments/bass/ESP/Bass_Fretboard_22c`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_04`
				material = Bass_Fretboard_22c_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_McSwain_22Fret_Inlays
						$car_rocker_bass_factoredGlobal_18
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_04`
				material = Bass_Fretboard_22c_Primary
				pre_layer = [
					{
						Color = grey_5guitar
						texture = `tex/models/Characters/Layers/CAB/McSwain/22fret_LD07_McSwn_Bullets`
						flags = 36
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = Bass_McSwain_Fboard22d
		frontend_desc = qs(0x6398f5e4)
		mesh = `models/CAR_Instruments/bass/ESP/Bass_Fretboard_22d`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_05`
				material = Bass_Fretboard_22d_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_McSwain_22Fret_Inlays
						$car_rocker_bass_factoredGlobal_18
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_05`
				material = Bass_Fretboard_22d_Primary
				pre_layer = [
					{
						Color = grey_5guitar
						texture = `tex/models/Characters/Layers/CAB/McSwain/22fret_LD07_McSwn_Bullets`
						flags = 36
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = Bass_McSwain_Fboard24
		frontend_desc = qs(0xc0a291ea)
		mesh = `models/CAR_Instruments/bass/ESP/Bass_Fretboard_24`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d`
				material = Bass_Fretboard_24_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_McSwn_24Fret_Inlays
						$car_rocker_bass_factoredGlobal_18
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d`
				material = Bass_Fretboard_24_Primary
				pre_layer = [
					{
						Color = grey_5guitar
						texture = `tex/models/Characters/Layers/CAB/McSwain/24fret_LD07_McSwn_Bullets`
						flags = 36
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = Bass_McSwain_Fboard24b
		frontend_desc = qs(0xa81d6c13)
		mesh = `models/CAR_Instruments/bass/ESP/Bass_Fretboard_24b`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_02`
				material = Bass_Fretboard_24b_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_McSwn_24Fret_Inlays
						$car_rocker_bass_factoredGlobal_19
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_02`
				material = Bass_Fretboard_24b_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAB/McSwain/24fret_LD07_McSwn_Bullets`
						flags = 36
						Color = grey_3guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = Bass_McSwain_Fboard24c
		frontend_desc = qs(0x21ad5ed2)
		mesh = `models/CAR_Instruments/bass/ESP/Bass_Fretboard_24c`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_03`
				material = Bass_Fretboard_24c_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_McSwn_24Fret_Inlays
						$car_rocker_bass_factoredGlobal_18
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_03`
				material = Bass_Fretboard_24c_Primary
				pre_layer = [
					{
						Color = grey_5guitar
						texture = `tex/models/Characters/Layers/CAB/McSwain/24fret_LD07_McSwn_Bullets`
						flags = 36
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = Bass_McSwain_Fboard24d
		frontend_desc = qs(0x8bbb0e9c)
		mesh = `models/CAR_Instruments/bass/ESP/Bass_Fretboard_24d`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_04`
				material = Bass_Fretboard_24d_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_McSwn_24Fret_Inlays
						$car_rocker_bass_factoredGlobal_18
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_04`
				material = Bass_Fretboard_24d_Primary
				pre_layer = [
					{
						Color = grey_5guitar
						texture = `tex/models/Characters/Layers/CAB/McSwain/24fret_LD07_McSwn_Bullets`
						flags = 36
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = Bass_MM_Fretboard_22a
		frontend_desc = qs(0x40f28e6a)
		mesh = `models/CAR_Instruments/bass/ESP/Bass_Fretboard_22a`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_02`
				material = Bass_Fretboard_22a_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_MM_Fboard_Inlays_22Fret
						$car_rocker_bass_factoredGlobal_18
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_02`
				material = Bass_Fretboard_22a_Primary
				pre_layer = [
					{
						Color = grey_5guitar
						texture = `tex/models/Characters/Layers/CAB/Musicman/Bass_MM_Fboard_22_Inlay1`
						flags = 4
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = Bass_MM_Fretboard_22b
		frontend_desc = qs(0x403e976b)
		mesh = `models/CAR_Instruments/bass/ESP/Bass_Fretboard_22b`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_03`
				material = Bass_Fretboard_22b_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_MM_Fboard_Inlays_22Fret
						$car_rocker_bass_factoredGlobal_19
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_03`
				material = Bass_Fretboard_22b_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAB/Musicman/Bass_MM_Fboard_22_Inlay1`
						flags = 4
						Color = Black_1guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = Bass_MM_Fretboard_22c
		frontend_desc = qs(0xec4e31fa)
		mesh = `models/CAR_Instruments/bass/ESP/Bass_Fretboard_22c`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_04`
				material = Bass_Fretboard_22c_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_MM_Fboard_Inlays_22Fret
						$car_rocker_bass_factoredGlobal_18
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_04`
				material = Bass_Fretboard_22c_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAB/Musicman/Bass_MM_Fboard_22_Inlay1`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = Bass_MM_Fretboard_22d
		frontend_desc = qs(0x6398f5e4)
		mesh = `models/CAR_Instruments/bass/ESP/Bass_Fretboard_22d`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_05`
				material = Bass_Fretboard_22d_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_MM_Fboard_Inlays_22Fret
						$car_rocker_bass_factoredGlobal_18
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_05`
				material = Bass_Fretboard_22d_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAB/Musicman/Bass_MM_Fboard_22_Inlay1`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = Bass_MM_Fretboard_24
		frontend_desc = qs(0xc0a291ea)
		mesh = `models/CAR_Instruments/bass/ESP/Bass_Fretboard_24`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d`
				material = Bass_Fretboard_24_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_MM_Fboard_Inlays_24
						$car_rocker_bass_factoredGlobal_18
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d`
				material = Bass_Fretboard_24_Primary
				pre_layer = [
					{
						Color = grey_5guitar
						texture = `tex/models/Characters/Layers/CAB/Musicman/Bass_MM_Fboard_24_Inlay1`
						flags = 4
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = Bass_MM_Fretboard_24b
		frontend_desc = qs(0xa81d6c13)
		mesh = `models/CAR_Instruments/bass/ESP/Bass_Fretboard_24b`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_02`
				material = Bass_Fretboard_24b_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_MM_Fboard_Inlays_24
						$car_rocker_bass_factoredGlobal_19
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_02`
				material = Bass_Fretboard_24b_Primary
				pre_layer = [
					{
						Color = Black_1guitar
						texture = `tex/models/Characters/Layers/CAB/Musicman/Bass_MM_Fboard_24_Inlay1`
						flags = 4
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = Bass_MM_Fretboard_24c
		frontend_desc = qs(0x21ad5ed2)
		mesh = `models/CAR_Instruments/bass/ESP/Bass_Fretboard_24c`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_03`
				material = Bass_Fretboard_24c_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_MM_Fboard_Inlays_24
						$car_rocker_bass_factoredGlobal_18
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_03`
				material = Bass_Fretboard_24c_Primary
				pre_layer = [
					{
						Color = grey_5guitar
						texture = `tex/models/Characters/Layers/CAB/Musicman/Bass_MM_Fboard_24_Inlay1`
						flags = 4
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = Bass_MM_Fretboard_24d
		frontend_desc = qs(0x8bbb0e9c)
		mesh = `models/CAR_Instruments/bass/ESP/Bass_Fretboard_24d`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_04`
				material = Bass_Fretboard_24d_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_MM_Fboard_Inlays_24
						$car_rocker_bass_factoredGlobal_18
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_04`
				material = Bass_Fretboard_24d_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAB/Musicman/Bass_MM_Fboard_24_Inlay1`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAB_22_Heroes01
		frontend_desc = qs(0x40f28e6a)
		mesh = `models/CAR_Instruments/bass/ESP/Bass_Fretboard_22a`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_02`
				material = Bass_Fretboard_22a_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_22Fret_Heroes
						$car_rocker_bass_factoredGlobal_18
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_02`
				material = Bass_Fretboard_22a_Primary
				pre_layer = [
					{
						Color = grey_5guitar
						texture = `tex/models/Characters/Layers/CAB/Musicman/Bass_MM_Fboard_22_Inlay1`
						flags = 4
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAB_22_Heroes02
		frontend_desc = qs(0x403e976b)
		mesh = `models/CAR_Instruments/bass/ESP/Bass_Fretboard_22b`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_03`
				material = Bass_Fretboard_22b_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_22Fret_Heroes
						$car_rocker_bass_factoredGlobal_19
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_03`
				material = Bass_Fretboard_22b_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAB/Musicman/Bass_MM_Fboard_22_Inlay1`
						flags = 4
						Color = Black_1guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAB_22_Heroes03
		frontend_desc = qs(0xec4e31fa)
		mesh = `models/CAR_Instruments/bass/ESP/Bass_Fretboard_22c`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_04`
				material = Bass_Fretboard_22c_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_22Fret_Heroes
						$car_rocker_bass_factoredGlobal_18
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_04`
				material = Bass_Fretboard_22c_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAB/Musicman/Bass_MM_Fboard_22_Inlay1`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAB_22_Heroes04
		frontend_desc = qs(0x6398f5e4)
		mesh = `models/CAR_Instruments/bass/ESP/Bass_Fretboard_22d`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_05`
				material = Bass_Fretboard_22d_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_22Fret_Heroes
						$car_rocker_bass_factoredGlobal_18
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_05`
				material = Bass_Fretboard_22d_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAB/Musicman/Bass_MM_Fboard_22_Inlay1`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAB_22_Tony1
		frontend_desc = qs(0x6398f5e4)
		mesh = `models/CAR_Instruments/bass/ESP/Bass_Fretboard_22d`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_05`
				material = Bass_Fretboard_22d_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_22_Tony
						$car_rocker_bass_factoredGlobal_18
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_05`
				material = Bass_Fretboard_22d_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAB/nodoubt/Bass_Fretboard_22_LD110`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAB_22_Tony2
		frontend_desc = qs(0x40f28e6a)
		mesh = `models/CAR_Instruments/bass/ESP/Bass_Fretboard_22a`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_02`
				material = Bass_Fretboard_22a_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_22_Tony
						$car_rocker_bass_factoredGlobal_18
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_02`
				material = Bass_Fretboard_22a_Primary
				pre_layer = [
					{
						Color = grey_5guitar
						texture = `tex/models/Characters/Layers/CAB/nodoubt/Bass_Fretboard_22_LD110`
						flags = 4
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAB_22_Tony3
		frontend_desc = qs(0x403e976b)
		mesh = `models/CAR_Instruments/bass/ESP/Bass_Fretboard_22b`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_03`
				material = Bass_Fretboard_22b_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_22_Tony
						$car_rocker_bass_factoredGlobal_19
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_03`
				material = Bass_Fretboard_22b_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAB/nodoubt/Bass_Fretboard_22_LD110`
						flags = 4
						Color = Black_1guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAB_22_Tony4
		frontend_desc = qs(0xec4e31fa)
		mesh = `models/CAR_Instruments/bass/ESP/Bass_Fretboard_22c`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_04`
				material = Bass_Fretboard_22c_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_22_Tony
						$car_rocker_bass_factoredGlobal_18
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_04`
				material = Bass_Fretboard_22c_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAB/nodoubt/Bass_Fretboard_22_LD110`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAB_24_Heroes01
		frontend_desc = qs(0xc0a291ea)
		mesh = `models/CAR_Instruments/bass/ESP/Bass_Fretboard_24`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d`
				material = Bass_Fretboard_24_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_24_Heroes
						$car_rocker_bass_factoredGlobal_18
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d`
				material = Bass_Fretboard_24_Primary
				pre_layer = [
					{
						Color = grey_5guitar
						texture = `tex/models/Characters/Layers/CAB/Musicman/Bass_MM_Fboard_24_Inlay1`
						flags = 4
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAB_24_Heroes02
		frontend_desc = qs(0xa81d6c13)
		mesh = `models/CAR_Instruments/bass/ESP/Bass_Fretboard_24b`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_02`
				material = Bass_Fretboard_24b_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_24_Heroes
						$car_rocker_bass_factoredGlobal_19
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_02`
				material = Bass_Fretboard_24b_Primary
				pre_layer = [
					{
						Color = Black_1guitar
						texture = `tex/models/Characters/Layers/CAB/Musicman/Bass_MM_Fboard_24_Inlay1`
						flags = 4
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAB_24_Heroes03
		frontend_desc = qs(0x21ad5ed2)
		mesh = `models/CAR_Instruments/bass/ESP/Bass_Fretboard_24c`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_03`
				material = Bass_Fretboard_24c_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_24_Heroes
						$car_rocker_bass_factoredGlobal_18
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_03`
				material = Bass_Fretboard_24c_Primary
				pre_layer = [
					{
						Color = grey_5guitar
						texture = `tex/models/Characters/Layers/CAB/Musicman/Bass_MM_Fboard_24_Inlay1`
						flags = 4
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAB_24_Heroes04
		frontend_desc = qs(0x8bbb0e9c)
		mesh = `models/CAR_Instruments/bass/ESP/Bass_Fretboard_24d`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_04`
				material = Bass_Fretboard_24d_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_24_Heroes
						$car_rocker_bass_factoredGlobal_18
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_04`
				material = Bass_Fretboard_24d_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAB/Musicman/Bass_MM_Fboard_24_Inlay1`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = Bass_SCH_Fretboard_22a
		frontend_desc = qs(0x40f28e6a)
		mesh = `models/CAR_Instruments/bass/ESP/Bass_Fretboard_22a`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_02`
				material = Bass_Fretboard_22a_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_22Fret_Schecter
						$car_rocker_bass_factoredGlobal_17
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_02`
				material = Bass_Fretboard_22a_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch22_INL_LD30`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = Bass_SCH_Fretboard_22b
		frontend_desc = qs(0x403e976b)
		mesh = `models/CAR_Instruments/bass/ESP/Bass_Fretboard_22b`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_03`
				material = Bass_Fretboard_22b_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_22Fret_Schecter
						$car_rocker_bass_factoredGlobal_17
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_03`
				material = Bass_Fretboard_22b_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch22_INL_LD30`
						flags = 4
						Color = Black_1guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = Bass_SCH_Fretboard_22c
		frontend_desc = qs(0xec4e31fa)
		mesh = `models/CAR_Instruments/bass/ESP/Bass_Fretboard_22c`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_04`
				material = Bass_Fretboard_22c_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_22Fret_Schecter
						$car_rocker_bass_factoredGlobal_17
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_04`
				material = Bass_Fretboard_22c_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch22_INL_LD30`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = Bass_SCH_Fretboard_22d
		frontend_desc = qs(0x6398f5e4)
		mesh = `models/CAR_Instruments/bass/ESP/Bass_Fretboard_22d`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_05`
				material = Bass_Fretboard_22d_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_22Fret_Schecter
						$car_rocker_bass_factoredGlobal_17
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_22_d_05`
				material = Bass_Fretboard_22d_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch22_INL_LD30`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = BS_Schect_Fbrd_24A
		frontend_desc = qs(0x21ad5ed2)
		mesh = `models/CAR_Instruments/bass/Schecter/BS_Schect_Fbrd_24A`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/Schecter/bs_schfbrd24_01`
				material = BS_Schect_Fbrd_24A_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $Bass_Fretboard_24
						$car_rocker_bass_factoredGlobal_17
					}
				]
			}
		]
	}
	{
		desc_id = Bass_SCH_Fretboard_24
		frontend_desc = qs(0xc0a291ea)
		mesh = `models/CAR_Instruments/bass/ESP/Bass_Fretboard_24`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d`
				material = Bass_Fretboard_24_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_24Fret_Schecter
						$car_rocker_bass_factoredGlobal_17
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d`
				material = Bass_Fretboard_24_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch_INL_LD30`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = Bass_SCH_Fretboard_24b
		frontend_desc = qs(0xa81d6c13)
		mesh = `models/CAR_Instruments/bass/ESP/Bass_Fretboard_24b`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_02`
				material = Bass_Fretboard_24b_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_24Fret_Schecter
						$car_rocker_bass_factoredGlobal_17
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_02`
				material = Bass_Fretboard_24b_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch_INL_LD30`
						flags = 4
						Color = Black_1guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = Bass_SCH_Fretboard_24c
		frontend_desc = qs(0x21ad5ed2)
		mesh = `models/CAR_Instruments/bass/ESP/Bass_Fretboard_24c`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_03`
				material = Bass_Fretboard_24c_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_24Fret_Schecter
						$car_rocker_bass_factoredGlobal_17
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_03`
				material = Bass_Fretboard_24c_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch_INL_LD30`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = Bass_SCH_Fretboard_24d
		frontend_desc = qs(0x8bbb0e9c)
		mesh = `models/CAR_Instruments/bass/ESP/Bass_Fretboard_24d`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_04`
				material = Bass_Fretboard_24d_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_24Fret_Schecter
						$car_rocker_bass_factoredGlobal_17
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass_fretboard_24_d_04`
				material = Bass_Fretboard_24d_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAB/Schecter/BS_Sch_INL_LD30`
						flags = 4
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
]
CAS_Bass_Pickguards = [
	{
		desc_id = Bass16_Pickguard_01
		frontend_desc = qs(0xec20133c)
		mesh = `models/CAR_Instruments/bass/ESP/Bass16_Pickguard_01`
	}
	{
		desc_id = BS_SCH_030_PGA
		frontend_desc = qs(0x59db0d7a)
		mesh = `models/CAR_Instruments/bass/Schecter/BS_SCH_030_PGA`
	}
	{
		desc_id = BS_SCH_T_PGA
		frontend_desc = qs(0x743ec6bb)
		mesh = `models/CAR_Instruments/bass/Schecter/BS_SCH_T_PGA`
	}
	{
		desc_id = Bass_Pickguard_MM_SR
		frontend_desc = qs(0x3f85ecca)
		mesh = `models/CAR_Instruments/Bass/Musicman/Bass_Pickguard_MM_SR`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/Musicman/bass_mm_sr_pickguard_1_d`
				material = Bass_Pickguard_MM_SR_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $Bass_Pickguard_MM_SR1
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
	{
		desc_id = bass110_pg
		frontend_desc = qs(0x670776c8)
		mesh = `models/CAR_Instruments/bass/NoDoubt/bass110_pg`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/nodoubt/bass110_pg_d`
				material = bass110_pg_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $bass110_pg
					}
				]
			}
		]
	}
	{
		desc_id = bass111_pg
		frontend_desc = qs(0x36384a00)
		mesh = `models/CAR_Instruments/bass/NoDoubt/bass111_pg`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/nodoubt/bass111_pg_d`
				material = bass111_pg_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $bass111_pg
					}
				]
			}
		]
	}
]
CAS_Bass_Pickups = [
	{
		desc_id = Bass110_pickup
		frontend_desc = qs(0x08a94d6e)
		materials = [
			Bass110_pickup_Primary
		]
		node_meshes = {
			$bass_pickups_nodes
			placements = [
				{
					parents = [
						Bass110_Tony1
					]
					node_set = 1
					meshes = [
						{
							mesh = `models\CAR_Instruments\Bass\nodoubt\Bass110_pickup`
							attach_indices = [
								3
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = Bass_Pkup_Type1_Blk_2
		frontend_desc = qs(0xcf1a182c)
		sponsor_id = EMG
		mesh = `models/CAR_Instruments/Bass/ESP/Bass_Pkup_Type1_Blk_2`
		materials = [
			Bass_Pkup_Type1_Blk_Primary
		]
		$car_rocker_bass_factoredGlobal_21
	}
	{
		desc_id = Bass9_Pkup_Type1_Blk_02
		frontend_desc = qs(0xcf1a182c)
		sponsor_id = EMG
		mesh = `models/CAR_Instruments/Bass/ESP/Bass9_Pkup_Type1_Blk_02`
		materials = [
			Bass9_Pkup_Type1_Blk_Primary
		]
		$car_rocker_bass_factoredGlobal_21
	}
	{
		desc_id = Bass9_Pkup_Type2_Blk_03
		frontend_desc = qs(0x59bd530d)
		sponsor_id = EMG
		mesh = `models/CAR_Instruments/Bass/ESP/Bass9_Pkup_Type2_Blk_03`
		materials = [
			Bass9_Pkup_Type2_Blk_Primary
		]
		$car_rocker_bass_factoredGlobal_21
	}
	{
		desc_id = Bass9_Pkup_Type3_Blk_2
		frontend_desc = qs(0x56b9a21d)
		sponsor_id = EMG
		mesh = `models/CAR_Instruments/Bass/ESP/Bass9_Pkup_Type3_Blk_2`
		materials = [
			Bass9_Pkup_Type3_Blk_Primary
		]
		$car_rocker_bass_factoredGlobal_21
	}
	{
		desc_id = Bass_Pickup_EMG01
		frontend_desc = qs(0x48bce410)
		sponsor_id = EMG
		node_meshes = {
			$bass_pickups_nodes
			placements = [
				{
					parents = [
						Bass_Schect_030
						IBANEZ_ICB_Body
						BAS_IBZ_SR505
						BAS_SCH_Stil
						BS_SCH_T_Body
						Bass110_Tony1
					]
					node_set = 1
					meshes = [
						{
							mesh = `models\CAR_Instruments\Guitar\GH5\pickups\Bass_Pickup_EMG01`
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
		desc_id = Bas_Pickup_Ibz01
		frontend_desc = qs(0x6e593804)
		materials = [
			Bas_Pickup_Ibz01_Primary
		]
		sponsor_id = Ibanez
		node_meshes = {
			$bass_pickups_nodes
			placements = [
				{
					parents = [
						IBANEZ_ICB_Body
						BAS_IBZ_SR505
					]
					node_set = 1
					meshes = [
						{
							mesh = `models\CAR_Instruments\Guitar\GH5\pickups\Bas_Pickup_Ibz01`
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
		desc_id = BAS_IBZ_PKUP002
		frontend_desc = qs(0x45746bc7)
		materials = [
			BAS_IBZ_PKUP002_Primary
		]
		sponsor_id = Ibanez
		chosen_materials = {
			material1 = Black_1guitar
		}
		node_meshes = {
			$bass_pickups_nodes
			placements = [
				{
					parents = [
						IBANEZ_ICB_Body
						BAS_IBZ_SR505
					]
					node_set = 1
					meshes = [
						{
							mesh = `models\CAR_Instruments\bass\GH5\pickups\BAS_IBZ_PKUP002`
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
		desc_id = Bass_pickup_SD
		frontend_desc = qs(0x64554abd)
		sponsor_id = `Seymour	Duncan`
		materials = [
			Bass_pickup_SD_Primary
		]
		chosen_materials = {
			material1 = Black_1guitar
		}
		node_meshes = {
			$bass_pickups_nodes
			placements = [
				{
					parents = [
						Bass102_Axe
						Bass104_Skull
						Bass103_Cross
					]
					node_set = 0
					meshes = [
						{
							mesh = `models\CAR_Instruments\Bass\GH5\Pickups\Bass_pickup_SD`
							attach_indices = [
								2
							]
						}
					]
				}
				{
					parents = [
						Bass_Schect_030
						BS_SCH_T_Body
						BAS_IBZ_SR505
						BAS_SCH_Stil
						IBANEZ_ICB_Body
						Bass110_Tony1
					]
					node_set = 1
					meshes = [
						{
							mesh = `models\CAR_Instruments\Bass\GH5\Pickups\Bass_pickup_SD`
							attach_indices = [
								1
							]
						}
					]
				}
				{
					parents = [
						Bass15_McSwain_Machine
					]
					node_set = 2
					meshes = [
						{
							mesh = `models\CAR_Instruments\Bass\GH5\Pickups\Bass_pickup_SD`
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
		desc_id = Bass_MM_SR_Pkup_Type5
		frontend_desc = qs(0x60d78247)
		sponsor_id = `Seymour	Duncan`
		materials = [
			Bass_pickup_SD_Primary
		]
		chosen_materials = {
			material1 = Black_1guitar
		}
		node_meshes = {
			$bass_pickups_nodes
			placements = [
				{
					parents = [
						Bass_Schect_030
						BS_SCH_T_Body
						BAS_IBZ_SR505
						BAS_SCH_Stil
						IBANEZ_ICB_Body
						BAS_IBZ_SR505
						Bass110_Tony1
					]
					node_set = 1
					meshes = [
						{
							mesh = `models\CAR_Instruments\Bass\GH5\Pickups\Bass_pickup_SD`
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
		desc_id = Bass_EMGpickup1
		frontend_desc = qs(0xcf1a182c)
		sponsor_id = EMG
		materials = [
			Bass_EMGpickup1_Primary
		]
		chosen_materials = {
			material1 = Black_1guitar
		}
		node_meshes = {
			$bass_pickups_nodes
			placements = [
				{
					parents = [
						Bass102_Axe
						Bass104_Skull
						Bass103_Cross
					]
					node_set = 0
					meshes = [
						{
							mesh = `models\CAR_Instruments\Bass\GH5\Pickups\Bass_EMGpickup1`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						Bass_MM_StingRay
						Bass_Schect_030
						BS_SCH_T_Body
						BAS_IBZ_SR505
						BAS_SCH_Stil
						IBANEZ_ICB_Body
						Bass110_Tony1
					]
					node_set = 1
					meshes = [
						{
							mesh = `models\CAR_Instruments\Bass\GH5\Pickups\Bass_EMGpickup1`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						Bass15_McSwain_Machine
					]
					node_set = 2
					meshes = [
						{
							mesh = `models\CAR_Instruments\Bass\GH5\Pickups\Bass_EMGpickup1`
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
		desc_id = Bass_EMGpickup1b
		frontend_desc = qs(0x2b570be2)
		sponsor_id = EMG
		materials = [
			Bass_EMGpickup1_Primary
		]
		chosen_materials = {
			material1 = Black_1guitar
		}
		node_meshes = {
			$bass_pickups_nodes
			placements = [
				{
					parents = [
						Bass102_Axe
						Bass104_Skull
						Bass103_Cross
					]
					node_set = 0
					meshes = [
						{
							mesh = `models\CAR_Instruments\Bass\GH5\Pickups\Bass_EMGpickup1`
							attach_indices = [
								1
							]
						}
					]
				}
				{
					parents = [
						Bass_MM_StingRay
						BS_SCH_T_Body
						Bass_Schect_030
						BAS_SCH_Stil
						IBANEZ_ICB_Body
						BAS_IBZ_SR505
						Bass110_Tony1
					]
					node_set = 1
					meshes = [
						{
							mesh = `models\CAR_Instruments\Bass\GH5\Pickups\Bass_EMGpickup1`
							attach_indices = [
								1
							]
						}
					]
				}
				{
					parents = [
						Bass15_McSwain_Machine
					]
					node_set = 2
					meshes = [
						{
							mesh = `models\CAR_Instruments\Bass\GH5\Pickups\Bass_EMGpickup1`
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
		desc_id = Bass_EMGpickup2
		frontend_desc = qs(0x3824cbe0)
		sponsor_id = EMG
		materials = [
			Bass_EMGpickup1_Primary
		]
		chosen_materials = {
			material1 = Black_1guitar
		}
		node_meshes = {
			$bass_pickups_nodes
			placements = [
				{
					parents = [
						Bass102_Axe
						Bass104_Skull
						Bass103_Cross
					]
					node_set = 0
					meshes = [
						{
							mesh = `models\CAR_Instruments\Bass\GH5\Pickups\Bass_EMGpickup2`
							attach_indices = [
								2
							]
						}
					]
				}
				{
					parents = [
						Bass_MM_StingRay
						BS_SCH_T_Body
						Bass_Schect_030
						BAS_SCH_Stil
						IBANEZ_ICB_Body
						BAS_IBZ_SR505
						Bass110_Tony1
					]
					node_set = 1
					meshes = [
						{
							mesh = `models\CAR_Instruments\Bass\GH5\Pickups\Bass_EMGpickup2`
							attach_indices = [
								2
							]
						}
					]
				}
				{
					parents = [
						Bass15_McSwain_Machine
					]
					node_set = 2
					meshes = [
						{
							mesh = `models\CAR_Instruments\Bass\GH5\Pickups\Bass_EMGpickup2`
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
		desc_id = Bass_EMGpickup2b
		frontend_desc = qs(0x6a056c5c)
		sponsor_id = EMG
		materials = [
			Bass_EMGpickup1_Primary
		]
		chosen_materials = {
			material1 = Black_1guitar
		}
		node_meshes = {
			$bass_pickups_nodes
			placements = [
				{
					parents = [
						Bass102_Axe
						Bass104_Skull
						Bass103_Cross
					]
					node_set = 0
					meshes = [
						{
							mesh = `models\CAR_Instruments\Bass\GH5\Pickups\Bass_EMGpickup2`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						Bass_MM_StingRay
						BS_SCH_T_Body
						Bass_Schect_030
						BAS_SCH_Stil
						IBANEZ_ICB_Body
						BAS_IBZ_SR505
						Bass110_Tony1
					]
					node_set = 1
					meshes = [
						{
							mesh = `models\CAR_Instruments\Bass\GH5\Pickups\Bass_EMGpickup2`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						Bass15_McSwain_Machine
					]
					node_set = 2
					meshes = [
						{
							mesh = `models\CAR_Instruments\Bass\GH5\Pickups\Bass_EMGpickup2`
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
		desc_id = Bass_EMGpickup3
		frontend_desc = qs(0x59bd530d)
		sponsor_id = EMG
		materials = [
			Bass_EMGpickup1_Primary
		]
		chosen_materials = {
			material1 = Black_1guitar
		}
		node_meshes = {
			$bass_pickups_nodes
			placements = [
				{
					parents = [
						Bass102_Axe
						Bass104_Skull
						Bass103_Cross
					]
					node_set = 0
					meshes = [
						{
							mesh = `models\CAR_Instruments\Bass\GH5\Pickups\Bass_EMGpickup1`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models\CAR_Instruments\Bass\GH5\Pickups\Bass_EMGpickup3`
							attach_indices = [
								2
							]
						}
					]
				}
				{
					parents = [
						Bass_MM_StingRay
						BS_SCH_T_Body
						Bass_Schect_030
						BAS_SCH_Stil
						IBANEZ_ICB_Body
						BAS_IBZ_SR505
						Bass110_Tony1
					]
					node_set = 1
					meshes = [
						{
							mesh = `models\CAR_Instruments\Bass\GH5\Pickups\Bass_EMGpickup1`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models\CAR_Instruments\Bass\GH5\Pickups\Bass_EMGpickup3`
							attach_indices = [
								2
							]
						}
					]
				}
				{
					parents = [
						Bass15_McSwain_Machine
					]
					node_set = 2
					meshes = [
						{
							mesh = `models\CAR_Instruments\Bass\GH5\Pickups\Bass_EMGpickup1`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models\CAR_Instruments\Bass\GH5\Pickups\Bass_EMGpickup3`
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
		desc_id = Bass_EMGpickup3b
		frontend_desc = qs(0xd40cf59f)
		sponsor_id = EMG
		materials = [
			Bass_EMGpickup1_Primary
		]
		chosen_materials = {
			material1 = Black_1guitar
		}
		node_meshes = {
			$bass_pickups_nodes
			placements = [
				{
					parents = [
						Bass102_Axe
						Bass104_Skull
						Bass103_Cross
					]
					node_set = 0
					meshes = [
						{
							mesh = `models\CAR_Instruments\Bass\GH5\Pickups\Bass_EMGpickup3`
							attach_indices = [
								2
							]
						}
					]
				}
				{
					parents = [
						Bass_MM_StingRay
						BS_SCH_T_Body
						Bass_Schect_030
						BAS_SCH_Stil
						IBANEZ_ICB_Body
						BAS_IBZ_SR505
						Bass105_pin
						Bass110_Tony1
					]
					node_set = 1
					meshes = [
						{
							mesh = `models\CAR_Instruments\Bass\GH5\Pickups\Bass_EMGpickup3`
							attach_indices = [
								2
							]
						}
					]
				}
				{
					parents = [
						Bass15_McSwain_Machine
					]
					node_set = 2
					meshes = [
						{
							mesh = `models\CAR_Instruments\Bass\GH5\Pickups\Bass_EMGpickup3`
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
CAS_Bass_Knobs = [
	{
		desc_id = BS_Scht_030_KNOB01_Four
		frontend_desc = qs(0xde7b0495)
		node_meshes = {
			$bass_knobs_nodes
			placements = [
				{
					parents = [
						Bass_Schect_030
						IBANEZ_ICB_Body
						BAS_IBZ_SR505
						BAS_SCH_Stil
						BS_SCH_T_Body
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/BS_Scht_030_KNOB01`
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
		desc_id = KNOB_KNURL001
		frontend_desc = qs(0xdac78d7a)
		node_meshes = {
			$bass_knobs_nodes
			placements = [
				{
					parents = [
						Bass_Schect_030
						IBANEZ_ICB_Body
						BAS_IBZ_SR505
						BAS_SCH_Stil
						BS_SCH_T_Body
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/KNOB_KNURL001`
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
		desc_id = Bass_Knob_TopHat
		frontend_desc = qs(0x24ff7e81)
		materials = [
			Bass63_Knob_Type2_Primary
		]
		node_meshes = {
			$bass_knobs_nodes
			placements = [
				{
					parents = [
						Bass_Schect_030
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/Bass_Knob_TopHat`
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
						IBANEZ_ICB_Body
						BAS_IBZ_SR505
						BAS_SCH_Stil
						BS_SCH_T_Body
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/Bass_Knob_TopHat`
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
		desc_id = Knob_Knurl02
		frontend_desc = qs(0xdac78d7a)
		materials = [
			GTR_36_Knobs_Primary
		]
		node_meshes = {
			$bass_knobs_nodes
			placements = [
				{
					parents = [
						BAS_SCH_Stil
						IBANEZ_ICB_Body
						BAS_IBZ_SR505
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Bass/GH5/Knobs/KNOB_KNURL02`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						Bass_MM_StingRay
						Bass_Schect_030
						BS_SCH_T_Body
						BAS_SCH_Stil
						IBANEZ_ICB_Body
						BAS_IBZ_SR505
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/CAR_Instruments/Bass/GH5/Knobs/KNOB_KNURL02`
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
						BS_SCH_T_Body
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Bass/GH5/Knobs/KNOB_KNURL02`
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
						BAS_IBZ_SR505
					]
					node_set = 4
					meshes = [
						{
							mesh = `models/CAR_Instruments/Bass/GH5/Knobs/KNOB_KNURL02`
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
		desc_id = Bass_Knob_01
		frontend_desc = qs(0x2a068a61)
		materials = [
			Bass_Knob_01_Primary
		]
		node_meshes = {
			$bass_knobs_nodes
			placements = [
				{
					parents = [
						Bass15_McSwain_Machine
						IBANEZ_ICB_Body
						BAS_IBZ_SR505
						Bass102_Axe
						Bass104_Skull
						Bass105_pin
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Bass/GH5/Knobs/Bass_Knob_01`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						Bass103_Cross
						BS_SCH_T_Body
						Bass110_Tony1
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Bass/GH5/Knobs/Bass_Knob_01`
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
						Bass_Schect_030
						Bass_MM_StingRay
						BAS_SCH_Stil
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/CAR_Instruments/Bass/GH5/Knobs/Bass_Knob_01`
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
						BAS_IBZ_SR505
					]
					node_set = 4
					meshes = [
						{
							mesh = `models/CAR_Instruments/Bass/GH5/Knobs/Bass_Knob_01`
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
		desc_id = Bass_Knob_02
		frontend_desc = qs(0x5593d6d0)
		materials = [
			Bass_Knob_02_Primary
		]
		node_meshes = {
			$bass_knobs_nodes
			placements = [
				{
					parents = [
						Bass15_McSwain_Machine
						BAS_SCH_Stil
						IBANEZ_ICB_Body
						BAS_IBZ_SR505
						Bass102_Axe
						Bass104_Skull
						Bass105_pin
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Bass/GH5/Knobs/Bass_Knob_02`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						Bass103_Cross
						BS_SCH_T_Body
						Bass110_Tony1
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Bass/GH5/Knobs/Bass_Knob_02`
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
						Bass_Schect_030
						Bass_MM_StingRay
						BAS_SCH_Stil
						IBANEZ_ICB_Body
						BAS_IBZ_SR505
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/CAR_Instruments/Bass/GH5/Knobs/Bass_Knob_02`
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
						BAS_IBZ_SR505
					]
					node_set = 4
					meshes = [
						{
							mesh = `models/CAR_Instruments/Bass/GH5/Knobs/Bass_Knob_02`
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
		desc_id = Bass_Knob_03
		frontend_desc = qs(0x6b3ddd60)
		materials = [
			Bass_Knob_03_Primary
		]
		node_meshes = {
			$bass_knobs_nodes
			placements = [
				{
					parents = [
						Bass15_McSwain_Machine
						BAS_SCH_Stil
						IBANEZ_ICB_Body
						BAS_IBZ_SR505
						Bass102_Axe
						Bass104_Skull
						Bass105_pin
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Bass/GH5/Knobs/Bass_Knob_03`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						Bass103_Cross
						BS_SCH_T_Body
						Bass110_Tony1
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Bass/GH5/Knobs/Bass_Knob_03`
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
						Bass_Schect_030
						Bass_MM_StingRay
						BAS_SCH_Stil
						IBANEZ_ICB_Body
						BAS_IBZ_SR505
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/CAR_Instruments/Bass/GH5/Knobs/Bass_Knob_03`
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
						BAS_IBZ_SR505
					]
					node_set = 4
					meshes = [
						{
							mesh = `models/CAR_Instruments/Bass/GH5/Knobs/Bass_Knob_03`
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
		desc_id = Bass_Knob_04
		frontend_desc = qs(0xbdf0bd59)
		materials = [
			Bass_Knob_04_Primary
		]
		node_meshes = {
			$bass_knobs_nodes
			placements = [
				{
					parents = [
						Bass15_McSwain_Machine
						BAS_SCH_Stil
						IBANEZ_ICB_Body
						BAS_IBZ_SR505
						Bass102_Axe
						Bass104_Skull
						Bass105_pin
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Bass/GH5/Knobs/Bass_Knob_04`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						Bass103_Cross
						BS_SCH_T_Body
						Bass110_Tony1
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Bass/GH5/Knobs/Bass_Knob_04`
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
						Bass_Schect_030
						Bass_MM_StingRay
						BAS_SCH_Stil
						IBANEZ_ICB_Body
						BAS_IBZ_SR505
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/CAR_Instruments/Bass/GH5/Knobs/Bass_Knob_04`
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
						BAS_IBZ_SR505
					]
					node_set = 4
					meshes = [
						{
							mesh = `models/CAR_Instruments/Bass/GH5/Knobs/Bass_Knob_04`
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
		desc_id = Bass_Knob_05
		frontend_desc = qs(0x4a3737b3)
		materials = [
			Bass_Knob_05_Primary
		]
		node_meshes = {
			$bass_knobs_nodes
			placements = [
				{
					parents = [
						Bass15_McSwain_Machine
						BAS_SCH_Stil
						IBANEZ_ICB_Body
						BAS_IBZ_SR505
						Bass102_Axe
						Bass104_Skull
						Bass105_pin
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Bass/GH5/Knobs/Bass_Knob_05`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						Bass103_Cross
						BS_SCH_T_Body
						Bass110_Tony1
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Bass/GH5/Knobs/Bass_Knob_05`
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
						Bass_Schect_030
						Bass_MM_StingRay
						BAS_SCH_Stil
						IBANEZ_ICB_Body
						BAS_IBZ_SR505
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/CAR_Instruments/Bass/GH5/Knobs/Bass_Knob_05`
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
						BAS_IBZ_SR505
					]
					node_set = 4
					meshes = [
						{
							mesh = `models/CAR_Instruments/Bass/GH5/Knobs/Bass_Knob_05`
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
		desc_id = Bass_Knob_06
		frontend_desc = qs(0x8ae89cb9)
		materials = [
			Bass_Knob_06_Primary
		]
		node_meshes = {
			$bass_knobs_nodes
			placements = [
				{
					parents = [
						Bass15_McSwain_Machine
						BAS_SCH_Stil
						IBANEZ_ICB_Body
						BAS_IBZ_SR505
						Bass102_Axe
						Bass104_Skull
						Bass105_pin
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Bass/GH5/Knobs/Bass_Knob_06`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						Bass103_Cross
						BS_SCH_T_Body
						Bass110_Tony1
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Bass/GH5/Knobs/Bass_Knob_06`
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
						Bass_Schect_030
						Bass_MM_StingRay
						BAS_SCH_Stil
						IBANEZ_ICB_Body
						BAS_IBZ_SR505
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/CAR_Instruments/Bass/GH5/Knobs/Bass_Knob_06`
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
						BAS_IBZ_SR505
					]
					node_set = 4
					meshes = [
						{
							mesh = `models/CAR_Instruments/Bass/GH5/Knobs/Bass_Knob_06`
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
		desc_id = Bass_Knob_07
		frontend_desc = qs(0x794033c5)
		materials = [
			Bass_Knob_07_Primary
		]
		node_meshes = {
			$bass_knobs_nodes
			placements = [
				{
					parents = [
						Bass15_McSwain_Machine
						BAS_SCH_Stil
						IBANEZ_ICB_Body
						BAS_IBZ_SR505
						Bass102_Axe
						Bass104_Skull
						Bass105_pin
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Bass/GH5/Knobs/Bass_Knob_07`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						Bass103_Cross
						BS_SCH_T_Body
						Bass110_Tony1
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Bass/GH5/Knobs/Bass_Knob_07`
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
						Bass_Schect_030
						Bass_MM_StingRay
						BAS_SCH_Stil
						IBANEZ_ICB_Body
						BAS_IBZ_SR505
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/CAR_Instruments/Bass/GH5/Knobs/Bass_Knob_07`
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
						BAS_IBZ_SR505
					]
					node_set = 4
					meshes = [
						{
							mesh = `models/CAR_Instruments/Bass/GH5/Knobs/Bass_Knob_07`
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
		desc_id = Bass_Knob_08
		frontend_desc = qs(0x655796b4)
		materials = [
			Bass_Knob_08_Primary
		]
		node_meshes = {
			$bass_knobs_nodes
			placements = [
				{
					parents = [
						Bass15_McSwain_Machine
						BAS_SCH_Stil
						IBANEZ_ICB_Body
						BAS_IBZ_SR505
						Bass102_Axe
						Bass104_Skull
						Bass105_pin
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Bass/GH5/Knobs/Bass_Knob_08`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						Bass103_Cross
						BS_SCH_T_Body
						Bass110_Tony1
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Bass/GH5/Knobs/Bass_Knob_08`
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
						Bass_Schect_030
						Bass_MM_StingRay
						BAS_SCH_Stil
						IBANEZ_ICB_Body
						BAS_IBZ_SR505
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/CAR_Instruments/Bass/GH5/Knobs/Bass_Knob_08`
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
						BAS_IBZ_SR505
					]
					node_set = 4
					meshes = [
						{
							mesh = `models/CAR_Instruments/Bass/GH5/Knobs/Bass_Knob_08`
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
		desc_id = Bass_Knob_09
		frontend_desc = qs(0x1f3d4f54)
		materials = [
			Bass_Knob_09_Primary
		]
		node_meshes = {
			$bass_knobs_nodes
			placements = [
				{
					parents = [
						Bass15_McSwain_Machine
						BAS_SCH_Stil
						IBANEZ_ICB_Body
						BAS_IBZ_SR505
						Bass102_Axe
						Bass104_Skull
						Bass105_pin
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Bass/GH5/Knobs/Bass_Knob_09`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						Bass103_Cross
						BS_SCH_T_Body
						Bass110_Tony1
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Bass/GH5/Knobs/Bass_Knob_09`
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
						Bass_Schect_030
						Bass_MM_StingRay
						BAS_SCH_Stil
						IBANEZ_ICB_Body
						BAS_IBZ_SR505
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/CAR_Instruments/Bass/GH5/Knobs/Bass_Knob_09`
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
						BAS_IBZ_SR505
					]
					node_set = 4
					meshes = [
						{
							mesh = `models/CAR_Instruments/Bass/GH5/Knobs/Bass_Knob_09`
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
		desc_id = Bass_Knob_10
		frontend_desc = qs(0x8ce8c0b3)
		materials = [
			Bass_Knob_10_Primary
		]
		node_meshes = {
			$bass_knobs_nodes
			placements = [
				{
					parents = [
						Bass15_McSwain_Machine
						BAS_SCH_Stil
						IBANEZ_ICB_Body
						BAS_IBZ_SR505
						Bass102_Axe
						Bass104_Skull
						Bass105_pin
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Bass/GH5/Knobs/Bass_Knob_10`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						Bass103_Cross
						BS_SCH_T_Body
						Bass110_Tony1
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Bass/GH5/Knobs/Bass_Knob_10`
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
						Bass_Schect_030
						Bass_MM_StingRay
						BAS_SCH_Stil
						IBANEZ_ICB_Body
						BAS_IBZ_SR505
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/CAR_Instruments/Bass/GH5/Knobs/Bass_Knob_10`
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
						BAS_IBZ_SR505
					]
					node_set = 4
					meshes = [
						{
							mesh = `models/CAR_Instruments/Bass/GH5/Knobs/Bass_Knob_10`
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
		desc_id = Bass9_ESP_Knob_10_04
		frontend_desc = qs(0xfe3916b5)
		mesh = `models/CAR_Instruments/bass/esp/Bass9_ESP_Knob_10_04`
		materials = [
			Bass9_ESP_Knob_10_Primary
		]
	}
	{
		desc_id = Bass9_Knob_02
		frontend_desc = qs(0x8f2cae0b)
		mesh = `models/CAR_Instruments/bass/esp/Bass9_Knob_02`
		materials = [
			Bass9_Knob_02_Primary
		]
	}
	{
		desc_id = Bass9_Knob_03
		frontend_desc = qs(0x4e6b4489)
		mesh = `models/CAR_Instruments/bass/esp/Bass9_Knob_03`
		materials = [
			Bass9_Knob_03_Primary
		]
	}
	{
		desc_id = Bass9_Knob_04
		frontend_desc = qs(0xc99e6543)
		mesh = `models/CAR_Instruments/bass/esp/Bass9_Knob_04`
		materials = [
			Bass9_Knob_04_Primary
		]
	}
	{
		desc_id = Bass9_Knob_05
		frontend_desc = qs(0x8ae89cb9)
		mesh = `models/CAR_Instruments/bass/esp/Bass9_Knob_05`
		materials = [
			Bass9_Knob_05_Primary
		]
	}
	{
		desc_id = Bass14_ESP_Knob_10_04
		frontend_desc = qs(0xc1a0c062)
		mesh = `models/CAR_Instruments/bass/esp/Bass14_ESP_Knob_10_04`
		materials = [
			Bass14_ESP_Knob_10_Primary
		]
	}
	{
		desc_id = Bass14_knob_02
		frontend_desc = qs(0x8f2cae0b)
		mesh = `models/CAR_Instruments/bass/esp/Bass14_knob_02`
		materials = [
			Bass14_knob_02_Primary
		]
	}
	{
		desc_id = Bass14_knob_03
		frontend_desc = qs(0x4e6b4489)
		mesh = `models/CAR_Instruments/bass/esp/Bass14_knob_03`
		materials = [
			Bass14_knob_03_Primary
		]
	}
	{
		desc_id = Bass14_knob_04
		frontend_desc = qs(0xc99e6543)
		mesh = `models/CAR_Instruments/bass/esp/Bass14_knob_04`
		materials = [
			Bass14_knob_04_Primary
		]
	}
	{
		desc_id = Bass14_knob_05
		frontend_desc = qs(0x8ae89cb9)
		mesh = `models/CAR_Instruments/bass/esp/Bass14_knob_05`
		materials = [
			Bass14_knob_05_Primary
		]
	}
	{
		desc_id = Bass17_ESP_Knob_10
		frontend_desc = qs(0x03825db3)
		mesh = `models/CAR_Instruments/bass/esp/Bass17_ESP_Knob_10`
		materials = [
			Bass17_ESP_Knob_10_Primary
		]
	}
	{
		desc_id = bass17_knob_02
		frontend_desc = qs(0x8f2cae0b)
		mesh = `models/CAR_Instruments/bass/esp/bass17_knob_02`
		materials = [
			bass17_knob_02_Primary
		]
	}
	{
		desc_id = bass17_knob_03
		frontend_desc = qs(0x4e6b4489)
		mesh = `models/CAR_Instruments/bass/esp/bass17_knob_03`
		materials = [
			bass17_knob_03_Primary
		]
	}
	{
		desc_id = bass17_knob_04
		frontend_desc = qs(0xc99e6543)
		mesh = `models/CAR_Instruments/bass/esp/bass17_knob_04`
		materials = [
			bass17_knob_04_Primary
		]
	}
	{
		desc_id = bass17_knob_05
		frontend_desc = qs(0x8ae89cb9)
		mesh = `models/CAR_Instruments/bass/esp/bass17_knob_05`
		materials = [
			bass17_knob_05_Primary
		]
	}
	{
		desc_id = Bass64_ESP_Knob_01
		frontend_desc = qs(0x34c902b4)
		mesh = `models/CAR_Instruments/bass/esp/Bass64_ESP_Knob_01`
		materials = [
			Bass64_ESP_Knob_01_Primary
		]
	}
	{
		desc_id = Bass64_ESP_Knob_02
		frontend_desc = qs(0x8f2cae0b)
		mesh = `models/CAR_Instruments/bass/esp/Bass64_ESP_Knob_02`
		materials = [
			Bass64_ESP_Knob_02_Primary
		]
	}
	{
		desc_id = Bass64_ESP_Knob_03
		frontend_desc = qs(0x4e6b4489)
		mesh = `models/CAR_Instruments/bass/esp/Bass64_ESP_Knob_03`
		materials = [
			Bass64_ESP_Knob_03_Primary
		]
	}
	{
		desc_id = Bass64_ESP_Knob_04
		frontend_desc = qs(0xc99e6543)
		mesh = `models/CAR_Instruments/bass/esp/Bass64_ESP_Knob_04`
		materials = [
			Bass64_ESP_Knob_04_Primary
		]
	}
	{
		desc_id = Bass64_ESP_Knob_05
		frontend_desc = qs(0x8ae89cb9)
		mesh = `models/CAR_Instruments/bass/esp/Bass64_ESP_Knob_05`
		materials = [
			Bass64_ESP_Knob_05_Primary
		]
	}
	{
		desc_id = Bass63_Knob_Type1
		frontend_desc = qs(0x34c902b4)
		mesh = `models/CAR_Instruments/bass/esp/Bass63_Knob_Type1`
		materials = [
			Bass63_Knob_Type1_Primary
		]
	}
	{
		desc_id = Bass63_Knob_Type2
		frontend_desc = qs(0x8f2cae0b)
		mesh = `models/CAR_Instruments/bass/esp/Bass63_Knob_Type2`
		materials = [
			Bass63_Knob_Type2_Primary
		]
	}
	{
		desc_id = Bass63_Knob_Type3
		frontend_desc = qs(0x4e6b4489)
		mesh = `models/CAR_Instruments/bass/esp/Bass63_Knob_Type3`
		materials = [
			Bass63_Knob_Type3_Primary
		]
	}
	{
		desc_id = Bass63_Knob_Type4
		frontend_desc = qs(0xc99e6543)
		mesh = `models/CAR_Instruments/bass/esp/Bass63_Knob_Type4`
		materials = [
			Bass63_Knob_Type4_Primary
		]
	}
	{
		desc_id = Bass63_Knob_Type5
		frontend_desc = qs(0x8ae89cb9)
		mesh = `models/CAR_Instruments/bass/esp/Bass63_Knob_Type5`
		materials = [
			Bass63_Knob_Type5_Primary
		]
	}
	{
		desc_id = BS_Scht_030_KNOB01
		frontend_desc = qs(0xb4fb57dd)
		mesh = `models/CAR_Instruments/bass/esp/BS_Scht_030_KNOB01`
		materials = [
			GTR4_ESP_Knob_10_03_Primary
		]
	}
]
CAS_bass_Bridges = [
	{
		desc_id = BS_Sch_Brdg_A
		frontend_desc = qs(0x640f2f2a)
		bass_string_start = BS_Sch_Brdg_A_str_start_properties
		bass_string_end = default_bass_string_end_properties
		materials = [
			Schec_Brdg_001_Primary
		]
		node_meshes = {
			$bass_bridges_nodes
			placements = [
				{
					parents = [
						Bass_Schect_030
						BAS_SCH_Stil
						BS_SCH_T_Body
						Bass102_Axe
						Bass103_Cross
						Bass104_Skull
						Bass105_pin
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/guitar/gh5/bridges/BS_Sch_Brdg_A`
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
		desc_id = Bas_Brdg_SCH_T
		frontend_desc = qs(0xff589880)
		bass_string_start = Bas_Brdg_SCH_T_str_start_properties
		bass_string_end = default_bass_string_end_properties
		materials = [
			IBZ_Brdg_001_Primary
		]
		node_meshes = {
			$bass_bridges_nodes
			placements = [
				{
					parents = [
						Bass_Schect_030
						BAS_SCH_Stil
						BS_SCH_T_Body
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/bass/gh5/bridges/Bas_Brdg_SCH_T`
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
			Bas_Brdg_capsule_Primary
		]
		node_meshes = {
			$bass_bridges_nodes
			placements = [
				{
					parents = [
						Bass_Schect_030
						BAS_SCH_Stil
						BS_SCH_T_Body
						BAS_IBZ_SR505
						IBANEZ_ICB_Body
						Bass110_Tony1
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/bass/gh5/bridges/Bas_Brdg_capsule`
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
		desc_id = Bas_Brdg_Ibz01
		frontend_desc = qs(0x01026d5e)
		bass_string_start = bas_Brdg_Ibz01_str_start_properties
		bass_string_end = default_bass_string_end_properties
		materials = [
			IBZ_Brdg_001_Primary
		]
		node_meshes = {
			$bass_bridges_nodes
			placements = [
				{
					parents = [
						BAS_IBZ_SR505
						IBANEZ_ICB_Body
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/guitar/gh5/bridges/Bas_Brdg_Ibz01`
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
		desc_id = Bas_Brdg_SCH_T2
		frontend_desc = qs(0x03dc6033)
		bass_string_start = Bas_Brdg_SCH_T2_str_start_properties
		bass_string_end = default_bass_string_end_properties
		materials = [
			IBZ_Brdg_001_Primary
		]
		node_meshes = {
			$bass_bridges_nodes
			placements = [
				{
					parents = [
						BAS_IBZ_SR505
						IBANEZ_ICB_Body
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/bass/gh5/bridges/Bas_Brdg_SCH_T`
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
		desc_id = Bas_Brdg_Sch_C
		frontend_desc = qs(0xeb24bcfe)
		bass_string_start = Bas_Brdg_Sch_C_str_start_properties
		bass_string_end = default_bass_string_end_properties
		materials = [
			Bas_Brdg_capsule_Primary
		]
		node_meshes = {
			$bass_bridges_nodes
			placements = [
				{
					parents = [
						Bass_Schect_030
						BAS_SCH_Stil
						BS_SCH_T_Body
						Bass110_Tony1
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/bass/gh5/bridges/Bas_Brdg_Sch_C`
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
		desc_id = Bas_Brdg_Ibz_Mono
		frontend_desc = qs(0x3dd0e964)
		bass_string_start = Bas_Brdg_Sch_C_str_start_properties
		bass_string_end = default_bass_string_end_properties
		materials = [
			Bas_Brdg_Ibz_Mono_Primary
		]
		node_meshes = {
			$bass_bridges_nodes
			placements = [
				{
					parents = [
						BAS_IBZ_SR505
						IBANEZ_ICB_Body
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/bass/gh5/bridges/Bas_Brdg_Ibz_Mono`
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
		desc_id = Bass9_Bridge_4str_01
		frontend_desc = qs(0x55d4c28a)
		mesh = `models/CAR_Instruments/Bass/esp/Bass9_Bridge_4str_01`
		materials = [
			Bass9_Bridge_4str_01_Primary
		]
		bass_string_start = Bass9_Bridge1_4str_start_properties
		bass_string_end = Bass9_Bridge1_4str_end_properties
	}
	{
		desc_id = Bass13_Bridge_4str
		frontend_desc = qs(0xe444c3ff)
		mesh = `models/CAR_Instruments/Bass/esp/Bass13_Bridge_4str`
		materials = [
			Bass13_Bridge_4str_Primary
		]
		bass_string_start = Bass9_Bridge1_4str_start_properties
		bass_string_end = Bass9_Bridge1_4str_end_properties
	}
	{
		desc_id = Bass14_Bridge_4str_01
		frontend_desc = qs(0xd995dfde)
		mesh = `models/CAR_Instruments/Bass/esp/Bass14_Bridge_4str_01`
		materials = [
			Bass14_Bridge_4str_01_Primary
		]
		bass_string_start = Bass14EX_Bridge1_4str_start_properties
		bass_string_end = Bass14_Bridge1_4str_end_properties
	}
	{
		desc_id = Bass14_Bridge_4str_02
		frontend_desc = qs(0xf2b88c1d)
		mesh = `models/CAR_Instruments/Bass/esp/Bass14_Bridge_4str_02`
		materials = [
			Bass14_Bridge_4str_02_Primary
		]
		bass_string_start = Bass14_Bridge1_4str_start_properties
		bass_string_end = Bass14_Bridge1_4str_end_properties
	}
	{
		desc_id = Bass17_Bridge_4str_04
		frontend_desc = qs(0xb171d66e)
		mesh = `models/CAR_Instruments/Bass/esp/Bass17_Bridge_4str_04`
		materials = [
			Bass17_Bridge_4str_04_Primary
		]
		bass_string_start = Bass14_Bridge1_4str_start_properties
		bass_string_end = Bass14_Bridge1_4str_end_properties
	}
	{
		desc_id = Bass17_Bridge_4str_05
		frontend_desc = qs(0x9a5c85ad)
		mesh = `models/CAR_Instruments/Bass/esp/Bass17_Bridge_4str_05`
		materials = [
			Bass17_Bridge_4str_05_Primary
		]
		bass_string_start = Bass14_Bridge1_4str_start_properties
		bass_string_end = Bass14_Bridge1_4str_end_properties
	}
	{
		desc_id = Bass9_Bridge_4str_01b
		frontend_desc = qs(0x55d4c28a)
		mesh = `models/CAR_Instruments/Bass/esp/Bass9_Bridge_4str_01b`
		materials = [
			Bass9_Bridge_4str_01b_Primary
		]
		bass_string_start = Bass9_Bridge_4str_01b_start_properties
		bass_string_end = Bass9_Bridge_4str_01b_end_properties
	}
	{
		desc_id = Bass110_bridge
		frontend_desc = qs(0x684038fc)
		materials = [
			Bass110_bridge_Primary
		]
		bass_string_start = Bass110_bridge_4str_start_properties
		node_meshes = {
			$bass_bridges_nodes
			placements = [
				{
					parents = [
						Bass110_Tony1
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Bass/NoDoubt/Bass110_bridge`
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
		desc_id = Bass15_Bridge_McSwain1
		frontend_desc = qs(0x33574946)
		materials = [
			Bass15_Bridge_McSwain1_Primary
		]
		bass_string_start = Bass_McSwn_4str_start_properties
		bass_string_end = Bass_McSwn_4str_end_properties
		node_meshes = {
			$bass_bridges_nodes
			placements = [
				{
					parents = [
						Bass15_McSwain_Machine
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Bass/gh5/bridges/Bass15_Bridge_McSwain1`
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
		desc_id = Bass_MM_Bridge_SR_1
		frontend_desc = qs(0x86a2f3b5)
		materials = [
			Bass_MM_Bridge_SR_1_Primary
		]
		bass_string_start = Bass_MMBridge1_4str_start_properties
		bass_string_end = Bass_MMBridge1_4str_end_properties
		node_meshes = {
			$bass_bridges_nodes
			placements = [
				{
					parents = [
						Bass_MM_StingRay
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Bass/MusicMan/Bass_MM_Bridge_SR_1`
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
		desc_id = Bass100_bridge
		frontend_desc = qs(0x684038fc)
		materials = [
			Bass100_bridge_Primary
		]
		bass_string_start = Bass100_brdg_4str_start_properties
		node_meshes = {
			$bass_bridges_nodes
			placements = [
				{
					parents = [
						Bass102_Axe
						Bass104_Skull
						Bass103_Cross
						Bass105_pin
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Bass/Heroes/Bass100_bridge`
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
CAS_Bass_Head = [
	{
		desc_id = Bass15_Neckhead_McSwain11
		frontend_desc = qs(0xc2e7c0f1)
		sponsor_id = McSwain
		mesh = `models/CAR_Instruments/bass/McSwain/Bass15_Neckhead_McSwain1`
		materials = [
			Bass15_Neckhead_McSwain1_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/bass/McSwain/bass15_neckhead_machine_d`
				material = Bass15_Neckhead_McSwain1_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $Bass15_McSwn_Nkhd_Finishes
					}
					{
						$preset_layer_fades
						mask = $Bass15_McSwn_Nkhd_fades
					}
					{
						$preset_layer_details
						mask = $Bass15_McSwn_Nkhd_Details
					}
				]
				$car_rocker_bass_factoredGlobal_58
			}
		]
	}
	{
		desc_id = Bass_MM_Neckhead_1
		frontend_desc = qs(0xc6739ae3)
		sponsor_id = `Music	Man`
		mesh = `models/CAR_Instruments/bass/Musicman/Bass_MM_Neckhead_1`
		materials = [
			Bass_MM_Neckhead_SR1_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/bass/Musicman/bass_mm_sr_neckhead_1_d`
				material = Bass_MM_Neckhead_SR1_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $Bass_MM_Nkhd1_Finishes
					}
					{
						$preset_layer_fades
						mask = $Bass_MM_Nkhd1_Fades
					}
					{
						$preset_layer_details
						mask = $Bass_MM_Nkhd1_Details
					}
				]
				$car_rocker_bass_factoredGlobal_58
			}
		]
	}
	{
		desc_id = Bass9_Neckhead_01
		frontend_desc = qs(0xeed02a85)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/bass/ESP/Bass9_Neckhead_01`
		materials = [
			Bass9_Neckhead_01_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass9_neckhead_d`
				material = Bass9_Neckhead_01_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_ESP_Neckhead_AX_Finishes
					}
					{
						$preset_layer_fades
						mask = $CAB_ESP_Neckhead_AX_fades
					}
					{
						$preset_layer_details
						mask = $CAB_ESP_Neckhead_AX_Details
					}
				]
				$car_rocker_bass_factoredGlobal_59
			}
		]
	}
	{
		desc_id = Bass9_Neckhead_02
		frontend_desc = qs(0x9cd34835)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/bass/ESP/Bass9_Neckhead_02`
		materials = [
			Bass9_Neckhead_02_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass9_neckhead_d_02`
				material = Bass9_Neckhead_02_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_ESP_Neckhead_Standard_Finishes
					}
					{
						$preset_layer_fades
						mask = $CAB_ESP_Neckhead_Standard_fades
					}
					{
						$preset_layer_details
						mask = $CAB_ESP_Neckhead_Standard_Details
					}
				]
				$car_rocker_bass_factoredGlobal_59
			}
		]
	}
	{
		desc_id = Bass9_Neckhead_03
		frontend_desc = qs(0x5194cc1c)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/bass/ESP/Bass9_Neckhead_03`
		materials = [
			Bass9_Neckhead_03_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/Bass9_Neckhead_D_03`
				material = Bass9_Neckhead_03_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_ESP_Neckhead_Flagship_Finishes
					}
					{
						$preset_layer_fades
						mask = $CAB_ESP_Neckhead_Flagship_fades
					}
					{
						$preset_layer_details
						mask = $CAB_ESP_Neckhead_Flagship_Details
					}
				]
				$car_rocker_bass_factoredGlobal_59
			}
		]
	}
	{
		desc_id = Bass9_Neckhead_04
		frontend_desc = qs(0xd3e7edae)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/bass/ESP/Bass9_Neckhead_04`
		materials = [
			Bass9_Neckhead_04_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass9_neckhead_d_04`
				material = Bass9_Neckhead_04_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_ESP_Nckhd_Surveyor_Finishes
					}
					{
						$preset_layer_fades
						mask = $CAB_ESP_Nckhd_Surveyor_fades
					}
					{
						$preset_layer_details
						mask = $CAB_ESP_Nckhd_Surveyor_Details
					}
				]
				$car_rocker_bass_factoredGlobal_60
			}
		]
	}
	{
		desc_id = Bass9_Neckhead_05
		frontend_desc = qs(0x59425cea)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/bass/ESP/Bass9_Neckhead_05`
		materials = [
			Bass9_Neckhead_05_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass9_neckhead_d_05`
				material = Bass9_Neckhead_05_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_ESP_Nckhd_Wedge_Finishes
					}
					{
						$preset_layer_fades
						mask = $CAB_ESP_Nckhd_Wedge_fades
					}
					{
						$preset_layer_details
						mask = $CAB_ESP_Nckhd_Wedge_Details
					}
				]
				$car_rocker_bass_factoredGlobal_60
			}
		]
	}
	{
		desc_id = Bass14_Neckhead_01
		frontend_desc = qs(0xeed02a85)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/bass/ESP/Bass14_Neckhead_01`
		materials = [
			Bass14_Neckhead_01_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass9_neckhead_d`
				material = Bass14_Neckhead_01_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_ESP_Neckhead_AX_Finishes
					}
					{
						$preset_layer_fades
						mask = $CAB_ESP_Neckhead_AX_fades
					}
					{
						$preset_layer_details
						mask = $CAB_ESP_Neckhead_AX_Details
					}
				]
				$car_rocker_bass_factoredGlobal_59
			}
		]
	}
	{
		desc_id = Bass14_Neckhead_02
		frontend_desc = qs(0x9cd34835)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/bass/ESP/Bass14_Neckhead_02`
		materials = [
			Bass14_Neckhead_02_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass9_neckhead_d_02`
				material = Bass14_Neckhead_02_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_ESP_Neckhead_Standard_Finishes
					}
					{
						$preset_layer_fades
						mask = $CAB_ESP_Neckhead_Standard_fades
					}
					{
						$preset_layer_details
						mask = $CAB_ESP_Neckhead_Standard_Details
					}
				]
				$car_rocker_bass_factoredGlobal_59
			}
		]
	}
	{
		desc_id = Bass14_Neckhead_03
		frontend_desc = qs(0x5194cc1c)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/bass/ESP/Bass14_Neckhead_03`
		materials = [
			Bass14_Neckhead_03_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/Bass9_Neckhead_D_03`
				material = Bass14_Neckhead_03_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_ESP_Neckhead_Flagship_Finishes
					}
					{
						$preset_layer_fades
						mask = $CAB_ESP_Neckhead_Flagship_fades
					}
					{
						$preset_layer_details
						mask = $CAB_ESP_Neckhead_Flagship_Details
					}
				]
				$car_rocker_bass_factoredGlobal_59
			}
		]
	}
	{
		desc_id = Bass14_Neckhead_04
		frontend_desc = qs(0xd3e7edae)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/bass/ESP/Bass14_Neckhead_04`
		materials = [
			Bass14_Neckhead_04_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass9_neckhead_d_04`
				material = Bass14_Neckhead_04_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_ESP_Nckhd_Surveyor_Finishes
					}
					{
						$preset_layer_fades
						mask = $CAB_ESP_Nckhd_Surveyor_fades
					}
					{
						$preset_layer_details
						mask = $CAB_ESP_Nckhd_Surveyor_Details
					}
				]
				$car_rocker_bass_factoredGlobal_60
			}
		]
	}
	{
		desc_id = Bass14_Neckhead_05
		frontend_desc = qs(0x59425cea)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/bass/ESP/Bass14_Neckhead_05`
		materials = [
			Bass14_Neckhead_05_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass9_neckhead_d_05`
				material = Bass14_Neckhead_05_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_ESP_Nckhd_Wedge_Finishes
					}
					{
						$preset_layer_fades
						mask = $CAB_ESP_Nckhd_Wedge_fades
					}
					{
						$preset_layer_details
						mask = $CAB_ESP_Nckhd_Wedge_Details
					}
				]
				$car_rocker_bass_factoredGlobal_60
			}
		]
	}
	{
		desc_id = Bass63_Neckhead
		frontend_desc = qs(0x59425cea)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/bass/ESP/Bass63_Neckhead`
		materials = [
			Bass63_Neckhead_Primary
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass63_neckhead_d`
				material = Bass63_Neckhead_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $Bass63_Neckhead_Finishes
					}
					{
						$preset_layer_fades
						mask = $Bass63_Neckhead_fades
					}
					{
						$preset_layer_details
						mask = $Bass63_Neckhead_Details
					}
				]
				$car_rocker_bass_factoredGlobal_60
			}
		]
	}
	{
		desc_id = Bass63_Neckhead_02
		frontend_desc = qs(0x92a23c9d)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/bass/ESP/Bass63_Neckhead_02`
		materials = [
			Bass63_Neckhead_02_Primary
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass64_neckhead_d`
				material = Bass63_Neckhead_02_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $Bass64_Neckhead_Finishes
					}
					{
						$preset_layer_fades
						mask = $Bass64_Neckhead_fades
					}
					{
						$preset_layer_details
						mask = $Bass64_Neckhead_Details
					}
				]
				$car_rocker_bass_factoredGlobal_59
			}
		]
	}
	{
		desc_id = Bass63_Neckhead_03
		frontend_desc = qs(0xeed02a85)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/bass/ESP/Bass63_Neckhead_03`
		materials = [
			Bass63_Neckhead_03_Primary
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass9_neckhead_d`
				material = Bass63_Neckhead_03_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_ESP_Neckhead_AX_Finishes
					}
					{
						$preset_layer_fades
						mask = $CAB_ESP_Neckhead_AX_fades
					}
					{
						$preset_layer_details
						mask = $CAB_ESP_Neckhead_AX_Details
					}
				]
				$car_rocker_bass_factoredGlobal_59
			}
		]
	}
	{
		desc_id = Bass64_Neckhead
		frontend_desc = qs(0x92a23c9d)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/bass/ESP/Bass64_Neckhead`
		materials = [
			Bass64_Neckhead_Primary
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass64_neckhead_d`
				material = Bass64_Neckhead_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $Bass64_Neckhead_Finishes
					}
					{
						$preset_layer_fades
						mask = $Bass64_Neckhead_fades
					}
					{
						$preset_layer_details
						mask = $Bass64_Neckhead_Details
					}
				]
				$car_rocker_bass_factoredGlobal_59
			}
		]
	}
	{
		desc_id = Bass63_Neckhead_04
		frontend_desc = qs(0xd3e7edae)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/bass/ESP/Bass63_Neckhead_04`
		materials = [
			Bass63_Neckhead_04_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass9_neckhead_d_04`
				material = Bass63_Neckhead_04_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_ESP_Nckhd_Surveyor_Finishes
					}
					{
						$preset_layer_fades
						mask = $CAB_ESP_Nckhd_Surveyor_fades
					}
					{
						$preset_layer_details
						mask = $CAB_ESP_Nckhd_Surveyor_Details
					}
				]
				$car_rocker_bass_factoredGlobal_60
			}
		]
	}
	{
		desc_id = Bass63_Neckhead_05
		frontend_desc = qs(0x5194cc1c)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/bass/ESP/Bass63_Neckhead_05`
		materials = [
			Bass63_Neckhead_05_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/Bass9_Neckhead_D_03`
				material = Bass63_Neckhead_05_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_ESP_Neckhead_Flagship_Finishes
					}
					{
						$preset_layer_fades
						mask = $CAB_ESP_Neckhead_Flagship_fades
					}
					{
						$preset_layer_details
						mask = $CAB_ESP_Neckhead_Flagship_Details
					}
				]
				$car_rocker_bass_factoredGlobal_59
			}
		]
	}
	{
		desc_id = Bass64_Neckhead_02
		frontend_desc = qs(0x59425cea)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/bass/ESP/Bass64_Neckhead_02`
		materials = [
			Bass64_Neckhead_02_Primary
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass63_neckhead_d`
				material = Bass64_Neckhead_02_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $Bass63_Neckhead_Finishes
					}
					{
						$preset_layer_fades
						mask = $Bass63_Neckhead_fades
					}
					{
						$preset_layer_details
						mask = $Bass63_Neckhead_Details
					}
				]
				$car_rocker_bass_factoredGlobal_60
			}
		]
	}
	{
		desc_id = Bass64_Neckhead_03
		frontend_desc = qs(0xeed02a85)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/bass/ESP/Bass64_Neckhead_03`
		materials = [
			Bass64_Neckhead_03_Primary
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass9_neckhead_02_d`
				material = Bass64_Neckhead_03_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_ESP_Neckhead_AX_Finishes
					}
					{
						$preset_layer_fades
						mask = $CAB_ESP_Neckhead_AX_fades
					}
					{
						$preset_layer_details
						mask = $CAB_ESP_Neckhead_AX_Details
					}
				]
				$car_rocker_bass_factoredGlobal_59
			}
		]
	}
	{
		desc_id = Bass64_Neckhead_04
		frontend_desc = qs(0xd3e7edae)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/bass/ESP/Bass64_Neckhead_04`
		materials = [
			Bass64_Neckhead_04_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/bass9_neckhead_d_04`
				material = Bass64_Neckhead_04_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_ESP_Nckhd_Surveyor_Finishes
					}
					{
						$preset_layer_fades
						mask = $CAB_ESP_Nckhd_Surveyor_fades
					}
					{
						$preset_layer_details
						mask = $CAB_ESP_Nckhd_Surveyor_Details
					}
				]
				$car_rocker_bass_factoredGlobal_60
			}
		]
		locked
	}
	{
		desc_id = Bass64_Neckhead_05
		frontend_desc = qs(0x5194cc1c)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/bass/ESP/Bass64_Neckhead_05`
		materials = [
			Bass64_Neckhead_05_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/ESP/Bass9_Neckhead_D_03`
				material = Bass64_Neckhead_05_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_ESP_Neckhead_Flagship_Finishes
					}
					{
						$preset_layer_fades
						mask = $CAB_ESP_Neckhead_Flagship_fades
					}
					{
						$preset_layer_details
						mask = $CAB_ESP_Neckhead_Flagship_Details
					}
				]
				$car_rocker_bass_factoredGlobal_59
			}
		]
	}
	{
		desc_id = BS_SCH_030_NHEAD01
		frontend_desc = qs(0x59db0d7a)
		sponsor_id = Schecter
		mesh = `models/CAR_Instruments/bass/Schecter/BS_SCH_030_NHEAD01`
		materials = [
			Bass_Neckhead_030_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/Schecter/bass_neckhead_030`
				material = Bass_Neckhead_030_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_Schec_NHead_004_Finishes
					}
					{
						$preset_layer_details
						mask = $CAB_Schec_NHead_004_Details
					}
					{
						$preset_layer_fades
						mask = $CAB_Schec_NHead_004_fades
					}
				]
				$car_rocker_bass_factoredGlobal_61
			}
		]
	}
	{
		desc_id = BS_SCH_030_NHEAD02
		frontend_desc = qs(0x86541e66)
		sponsor_id = Schecter
		mesh = `models/CAR_Instruments/bass/Schecter/BS_SCH_030_NHEAD02`
		materials = [
			BS_SCH_T_NHEAD_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/Schecter/bass_neckhead_mt`
				material = BS_SCH_T_NHEAD_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_bs_sch_modelt_Finishes
					}
					{
						$preset_layer_fades
						mask = $CAB_bs_sch_modelt_fades
					}
					{
						$preset_layer_details
						mask = $CAB_bs_sch_modelt_Details
					}
				]
				$car_rocker_bass_factoredGlobal_62
			}
		]
	}
	{
		desc_id = BS_SCH_030_NHEAD03
		frontend_desc = qs(0x32a408c4)
		sponsor_id = Schecter
		mesh = `models/CAR_Instruments/bass/Schecter/BS_SCH_030_NHEAD03`
		materials = [
			Bass_Neckhead_Stil01_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/Schecter/bs_sch_head_stil01`
				material = Bass_Neckhead_Stil01_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_bs_sch_STL_Finishes
					}
					{
						$preset_layer_fades
						mask = $CAB_bs_sch_STL_fades
					}
					{
						$preset_layer_details
						mask = $CAB_bs_sch_STL_Details
					}
				]
				$car_rocker_bass_factoredGlobal_59
			}
		]
	}
	{
		desc_id = BAS_Neckhead_SCH_STL03
		frontend_desc = qs(0x0f2dfd1a)
		sponsor_id = Schecter
		mesh = `models/CAR_Instruments/bass/Schecter/BAS_Neckhead_SchSTL03`
		materials = [
			Bass_Neckhead_030_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/Schecter/bass_neckhead_030`
				material = Bass_Neckhead_030_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_Schec_NHead_004_Finishes
					}
					{
						$preset_layer_details
						mask = $CAB_Schec_NHead_004_Details
					}
					{
						$preset_layer_fades
						mask = $CAB_Schec_NHead_004_fades
					}
				]
				$car_rocker_bass_factoredGlobal_61
			}
		]
		locked
	}
	{
		desc_id = BS_SCH_T_NHEAD02
		frontend_desc = qs(0x0f2dfd1a)
		sponsor_id = Schecter
		mesh = `models/CAR_Instruments/bass/Schecter/BS_SCH_T_NHEAD02`
		materials = [
			Bass_Neckhead_030_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/Schecter/bass_neckhead_030`
				material = Bass_Neckhead_030_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_Schec_NHead_004_Finishes
					}
					{
						$preset_layer_details
						mask = $CAB_Schec_NHead_004_Details
					}
					{
						$preset_layer_fades
						mask = $CAB_Schec_NHead_004_fades
					}
				]
				$car_rocker_bass_factoredGlobal_61
			}
		]
		locked
	}
	{
		desc_id = BS_SCH_T_NHEAD
		frontend_desc = qs(0x86541e66)
		sponsor_id = Schecter
		mesh = `models/CAR_Instruments/bass/Schecter/BS_SCH_T_NHEAD`
		materials = [
			BS_SCH_T_NHEAD_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/Schecter/bass_neckhead_mt`
				material = BS_SCH_T_NHEAD_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_bs_sch_modelt_Finishes
					}
					{
						$preset_layer_fades
						mask = $CAB_bs_sch_modelt_fades
					}
					{
						$preset_layer_details
						mask = $CAB_bs_sch_modelt_Details
					}
				]
				$car_rocker_bass_factoredGlobal_62
			}
		]
	}
	{
		desc_id = BAS_Neckhead_SCH_STL02
		frontend_desc = qs(0x86541e66)
		sponsor_id = Schecter
		mesh = `models/CAR_Instruments/bass/Schecter/BAS_Neckhead_SchSTL02`
		materials = [
			BS_SCH_T_NHEAD_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/Schecter/bass_neckhead_mt`
				material = BS_SCH_T_NHEAD_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_bs_sch_modelt_Finishes
					}
					{
						$preset_layer_fades
						mask = $CAB_bs_sch_modelt_fades
					}
					{
						$preset_layer_details
						mask = $CAB_bs_sch_modelt_Details
					}
				]
				$car_rocker_bass_factoredGlobal_62
			}
		]
	}
	{
		desc_id = BAS_Neckhead_SCH_STL
		frontend_desc = qs(0x32a408c4)
		sponsor_id = Schecter
		mesh = `models/CAR_Instruments/bass/Schecter/BAS_Neckhead_SCH_STL`
		materials = [
			Bass_Neckhead_Stil01_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/Schecter/bs_sch_head_stil01`
				material = Bass_Neckhead_Stil01_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_bs_sch_STL_Finishes
					}
					{
						$preset_layer_fades
						mask = $CAB_bs_sch_STL_fades
					}
					{
						$preset_layer_details
						mask = $CAB_bs_sch_STL_Details
					}
				]
				$car_rocker_bass_factoredGlobal_59
			}
		]
	}
	{
		desc_id = BS_SCH_T_NHEAD03
		frontend_desc = qs(0x32a408c4)
		sponsor_id = Schecter
		mesh = `models/CAR_Instruments/bass/Schecter/BS_SCH_T_NHEAD03`
		materials = [
			Bass_Neckhead_Stil01_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/Schecter/bs_sch_head_stil01`
				material = Bass_Neckhead_Stil01_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_bs_sch_STL_Finishes
					}
					{
						$preset_layer_fades
						mask = $CAB_bs_sch_STL_fades
					}
					{
						$preset_layer_details
						mask = $CAB_bs_sch_STL_Details
					}
				]
				$car_rocker_bass_factoredGlobal_59
			}
		]
	}
	{
		desc_id = BS_IBZ_ICB_HEAD
		frontend_desc = qs(0xa2d6a71d)
		sponsor_id = Ibanez
		mesh = `models/CAR_Instruments/bass/Ibanez/BS_IBZ_ICB_HEAD`
		materials = [
			Bass_Neckhead_ICB_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/Ibanez/bs_ibz_icb_head`
				material = Bass_Neckhead_ICB_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_bs_ibz_icb_head_Finishes
					}
					{
						$preset_layer_fades
						mask = $CAB_bs_ibz_icb_head_Fades
					}
					{
						$preset_layer_details
						mask = $CAB_bs_ibz_icb_head_Details
					}
				]
				$car_rocker_bass_factoredGlobal_59
			}
		]
	}
	{
		desc_id = BS_IBZ_ICB_HEAD02
		frontend_desc = qs(0xb1fb9392)
		sponsor_id = Ibanez
		mesh = `models/CAR_Instruments/bass/Ibanez/BS_IBZ_ICB_Head02`
		materials = [
			Bass_Neckhead_IBZ_SR_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/Ibanez/bs_ibz_sr_head`
				material = Bass_Neckhead_IBZ_SR_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_bs_ibz_SR_head_Finishes
					}
					{
						$preset_layer_fades
						mask = $CAB_bs_ibz_SR_head_fades
					}
					{
						$preset_layer_details
						mask = $CAB_bs_ibz_SR_head_Details
					}
				]
				$car_rocker_bass_factoredGlobal_59
			}
		]
	}
	{
		desc_id = BAS_IBZ_SR_Head01
		frontend_desc = qs(0xb1fb9392)
		sponsor_id = Ibanez
		mesh = `models/CAR_Instruments/bass/Ibanez/BAS_IBZ_SR_Head01`
		materials = [
			Bass_Neckhead_IBZ_SR_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/Ibanez/bs_ibz_sr_head`
				material = Bass_Neckhead_IBZ_SR_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_bs_ibz_SR_head_Finishes
					}
					{
						$preset_layer_fades
						mask = $CAB_bs_ibz_SR_head_fades
					}
					{
						$preset_layer_details
						mask = $CAB_bs_ibz_SR_head_Details
					}
				]
				$car_rocker_bass_factoredGlobal_59
			}
		]
	}
	{
		desc_id = BAS_IBZ_SR_Head02
		frontend_desc = qs(0xa2d6a71d)
		sponsor_id = Ibanez
		mesh = `models/CAR_Instruments/bass/Ibanez/BAS_IBZ_SR_Head02`
		materials = [
			Bass_Neckhead_ICB_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/Ibanez/bs_ibz_icb_head`
				material = Bass_Neckhead_ICB_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAB_bs_ibz_icb_head_Finishes
					}
					{
						$preset_layer_fades
						mask = $CAB_bs_ibz_icb_head_Fades
					}
					{
						$preset_layer_details
						mask = $CAB_bs_ibz_icb_head_Details
					}
				]
				$car_rocker_bass_factoredGlobal_59
			}
		]
	}
	{
		desc_id = Bass102_neckhead
		frontend_desc = qs(0x9707fdc2)
		mesh = `models/CAR_Instruments/bass/heroes/Bass102_neckhead`
		materials = [
			Bass102_neckhead_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/heroes/Bass102_neckhead_D`
				material = Bass102_neckhead_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $Bass102_neckhead_Finishes
					}
					{
						$preset_layer_fades
						mask = $Bass102_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $Bass102_neckhead_Details
					}
				]
				$car_rocker_bass_factoredGlobal_59
			}
		]
	}
	{
		desc_id = bass104_neckhead
		frontend_desc = qs(0x2a26573d)
		mesh = `models/CAR_Instruments/bass/heroes/bass104_neckhead`
		materials = [
			bass104_neckhead_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/heroes/bass104_neckhead_d`
				material = bass104_neckhead_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $bass104_neckhead_Finishes
					}
					{
						$preset_layer_fades
						mask = $bass104_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $bass104_neckhead_Details
					}
				]
				$car_rocker_bass_factoredGlobal_59
			}
		]
	}
	{
		desc_id = bass105_neckhead
		frontend_desc = qs(0xf1f5c447)
		mesh = `models/CAR_Instruments/bass/heroes/bass105_neckhead`
		materials = [
			bass105_neckhead_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/heroes/bass105_neckhead_d`
				material = bass105_neckhead_Primary
				$car_rocker_bass_factoredGlobal_59
			}
		]
	}
	{
		desc_id = bass105_neckhead_B
		frontend_desc = qs(0xc15459f6)
		mesh = `models/CAR_Instruments/bass/heroes/bass105_neckhead_B`
		materials = [
			bass105_neckhead_B_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/heroes/bass105_neckhead_B_D`
				material = bass105_neckhead_B_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $bass105_neckhead_B_Finishes
					}
					{
						$preset_layer_fades
						mask = $bass105_neckhead_B_fades
					}
					{
						$preset_layer_details
						mask = $bass105_neckhead_B_Details
					}
				]
				$car_rocker_bass_factoredGlobal_59
			}
		]
	}
	{
		desc_id = Bass110_Neckhead
		frontend_desc = qs(0x7131aa49)
		mesh = `models/CAR_Instruments/bass/nodoubt/Bass110_Neckhead`
		materials = [
			Bass110_Neckhead_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/nodoubt/Bass110_Neckhead_D`
				material = Bass110_Neckhead_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $Bass110_Neckhead_Finishes
					}
					{
						$preset_layer_fades
						mask = $Bass110_Neckhead_fades
					}
					{
						$preset_layer_details
						mask = $Bass110_Neckhead_Details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						x_trans = -20
						x_scale = 10
						y_scale = 25
						y_trans = -28
					}
					aspect_ratio = 1.75
				}
			}
		]
	}
	{
		desc_id = Bass111_Neckhead
		frontend_desc = qs(0x7131aa49)
		mesh = `models/CAR_Instruments/bass/nodoubt/Bass111_Neckhead`
		materials = [
			Bass111_Neckhead_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Bass/nodoubt/Bass111_Neckhead_D`
				material = Bass111_Neckhead_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $Bass110_Neckhead_Finishes
					}
					{
						$preset_layer_fades
						mask = $Bass110_Neckhead_fades
					}
					{
						$preset_layer_details
						mask = $Bass110_Neckhead_Details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						x_trans = -20
						x_scale = 10
						y_scale = 25
						y_trans = -29
					}
					aspect_ratio = 1.75
				}
			}
		]
	}
]
CAS_Bass_Misc = [
	{
		desc_id = Bass_MM_SR_Misc_1
		frontend_desc = qs(0xab44586d)
		materials = [
			Bass_MM_SR_Misc_1_Primary
		]
		node_meshes = {
			$bass_misc_nodes
			placements = [
				{
					parents = [
						Bass_MM_StingRay
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Bass/Musicman/Bass_MM_SR_Misc_1`
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
car_rocker_bass_factoredGlobal_6 = {
	has_node_array
	locked
}
car_rocker_bass_factoredGlobal_17 = {
	initial_values = {
		Color = grey_4
	}
}
car_rocker_bass_factoredGlobal_18 = {
	initial_values = {
		Color = grey_5guitar
	}
}
car_rocker_bass_factoredGlobal_19 = {
	initial_values = {
		Color = Black_1guitar
	}
}
car_rocker_bass_factoredGlobal_21 = {
	chosen_materials = {
		material1 = grey_2guitar
	}
}
car_rocker_bass_factoredGlobal_58 = {
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
car_rocker_bass_factoredGlobal_59 = {
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
car_rocker_bass_factoredGlobal_60 = {
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
car_rocker_bass_factoredGlobal_61 = {
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
car_rocker_bass_factoredGlobal_62 = {
	user_layer_settings = {
		diffuse
		ui_rotated_270
		initial_values = {
			x_trans = 25
			y_trans = -30
			x_scale = 19
			y_scale = 19
		}
	}
}
bass_knobs_nodes = {
	node_array_part = CAS_Bass_Body
	node_type = KNOB
}
bass_misc_nodes = {
	node_array_part = CAS_Bass_Body
	node_type = MISC
}
bass_pickups_nodes = {
	node_array_part = CAS_Bass_Body
	node_type = PICKUP
}
bass_bridges_nodes = {
	node_array_part = CAS_Bass_Body
	node_type = BRIDGE
}
