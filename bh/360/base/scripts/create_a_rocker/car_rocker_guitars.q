CAS_Guitar_Body = [
	{
		desc_id = GTR20_BC_Rich_Beast
		frontend_desc = qs(0x5bd8e743)
		sponsor_id = `BC	Rich`
		mesh = `models/CAR_Instruments/Guitar/BC_Rich/GTR20_BC_Rich_Beast`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/BC_Rich/gtr20_bc_rich_beast_d`
				material = GTR20_BC_Rich_Beast_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR_BC_Rich_Beast_Finishes
					}
					{
						$preset_layer_fades
						mask = $GTR_BC_Rich_Beast_Fades
					}
					{
						$preset_layer_details
						mask = $GTR_BC_Rich_Beast_Details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						x_trans = -28
						y_trans = 15
						x_scale = 17
						y_scale = 24
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_22Fret_BCRich01
					CAG_22Fret_BCRich02
					CAG_22Fret_BCRich03
					CAG_22Fret_BCRich04
					CAG_24Fret_BCRich01
					CAG_24Fret_BCRich02
					CAG_24Fret_BCRich03
					CAG_24Fret_BCRich04
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR20_Neckhead_Beast1
					GTR20_Neckhead_Warlock2
					GTR20_Neckhead_Pointed3
				]
			}
			{
				part = CAS_Guitar_Pickguards
				valid = [
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR_EMG_pickup1
					GTR_EMG_pickup2
					GTR_EMG_pickup5
					GTR_EMG_pickup4
					GTR_EMG_pickup3
					GTR_EMG_pickup6
					GTR_pickup_SD01
					GTR_pickup_SD05B
					GTR_pickup_SD05
					GTR_pickup_SD06
					GTR_pickup_SD06B
					GTR_Pickup_Type2_PAF1
					GTR_Pickup_Type2_PAF2
					GTR_pickup_SD03
					GTR_pickup_BC01
					GTR_pickup_BC01b
					GTR_pickup_BC02
					GTR_pickup_SD04b
					GTR_EMG_pickup9
					GTR_EMG_pickup10
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					GTR_Knob_01
					GTR_Knob_02
					GTR_Knob_03
					GTR_Knob_04
					GTR_Knob_05
					GTR_Knob_06
					GTR_Knob_07
					GTR_Knob_08
					GTR_Knob_09
					GTR_Knob_10
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR22_Bridge_Whammy1
					GTR_BC_Rich_Bridge_21
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					GTR_Misc_Switch
					GTR_Misc_Switch_blk_3
					None
				]
			}
		]
		$car_rocker_guitars_factoredGlobal_1
	}
	{
		desc_id = GTR21_BC_Rich_Warbeast
		frontend_desc = qs(0xe769d4a9)
		sponsor_id = `BC	Rich`
		mesh = `models/CAR_Instruments/Guitar/BC_Rich/GTR21_BC_Rich_Warbeast`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/BC_Rich/gtr21_bc_rich_warbeast_d`
				material = GTR21_BC_Rich_Warbeast_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR_BC_Rich_Warbeast_Finishes
					}
					{
						$preset_layer_fades
						mask = $GTR_BC_Rich_Warbeast_Fades
					}
					{
						$preset_layer_details
						mask = $GTR_BC_Rich_Warbeast_Details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						y_trans = 20
						x_scale = 19
						y_scale = 28
						x_trans = -26
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_22Fret_BCRich01
					CAG_22Fret_BCRich02
					CAG_22Fret_BCRich03
					CAG_22Fret_BCRich04
					CAG_24Fret_BCRich01
					CAG_24Fret_BCRich02
					CAG_24Fret_BCRich03
					CAG_24Fret_BCRich04
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR21_Neckhead_Beast2
					GTR21_Neckhead_Warlock3
					GTR21_Neckhead_Pointed4
				]
			}
			{
				part = CAS_Guitar_Pickguards
				valid = [
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR_EMG_pickup1
					GTR_EMG_pickup2
					GTR_EMG_pickup5
					GTR_EMG_pickup4
					GTR_EMG_pickup3
					GTR_EMG_pickup6
					GTR_pickup_SD01
					GTR_pickup_SD05B
					GTR_pickup_SD05
					GTR_pickup_SD06
					GTR_pickup_SD06B
					GTR_Pickup_Type2_PAF1
					GTR_Pickup_Type2_PAF2
					GTR_pickup_SD03
					GTR_pickup_BC01
					GTR_pickup_BC01b
					GTR_pickup_BC02
					GTR_pickup_SD04b
					GTR_EMG_pickup9
					GTR_EMG_pickup10
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					GTR_Knob_01
					GTR_Knob_02
					GTR_Knob_03
					GTR_Knob_04
					GTR_Knob_05
					GTR_Knob_06
					GTR_Knob_07
					GTR_Knob_08
					GTR_Knob_09
					GTR_Knob_10
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR22_Bridge_Whammy1
					GTR_BC_Rich_Bridge_21
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					GTR_Misc_Switch
					GTR_Misc_Switch_blk_3
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = GTR22_BC_Rich_Warlock
		frontend_desc = qs(0xdeca9e56)
		sponsor_id = `BC	Rich`
		mesh = `models/CAR_Instruments/Guitar/BC_Rich/GTR22_BC_Rich_Warlock`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/BC_Rich/gtr22_bc_rich_warlock_d`
				material = GTR22_BC_Rich_Warlock_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR_BC_Rich_Warlock_Finishes
					}
					{
						$preset_layer_fades
						mask = $GTR_BC_Rich_Warlock_Fades
					}
					{
						$preset_layer_details
						mask = $GTR_BC_Rich_Warlock_Details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						y_trans = 25
						x_scale = 20
						y_scale = 31
						x_trans = -23
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_22Fret_BCRich01
					CAG_22Fret_BCRich02
					CAG_22Fret_BCRich03
					CAG_22Fret_BCRich04
					CAG_24Fret_BCRich01
					CAG_24Fret_BCRich02
					CAG_24Fret_BCRich03
					CAG_24Fret_BCRich04
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR22_Neckhead_Beast3
					GTR22_Neckhead_Warlock4
					GTR22_Neckhead_Pointed5
				]
			}
			{
				part = CAS_Guitar_Pickguards
				valid = [
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR_EMG_pickup1
					GTR_EMG_pickup2
					GTR_EMG_pickup5
					GTR_pickup_SD05B
					GTR_EMG_pickup4
					GTR_EMG_pickup3
					GTR_EMG_pickup6
					GTR_pickup_SD01
					GTR_pickup_SD05B
					GTR_pickup_SD05
					GTR_pickup_SD06
					GTR_pickup_SD06B
					GTR_Pickup_Type2_PAF1
					GTR_Pickup_Type2_PAF2
					GTR_pickup_SD03
					GTR_pickup_BC01
					GTR_pickup_BC01b
					GTR_pickup_BC02
					GTR_pickup_SD04b
					GTR_EMG_pickup9
					GTR_EMG_pickup10
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					GTR_Knob_01
					GTR_Knob_02
					GTR_Knob_03
					GTR_Knob_04
					GTR_Knob_05
					GTR_Knob_06
					GTR_Knob_07
					GTR_Knob_08
					GTR_Knob_09
					GTR_Knob_10
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR22_Bridge_Whammy1
					GTR_BC_Rich_Bridge_21
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					GTR_Misc_Switch
					GTR_Misc_Switch_blk_3
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = GTR90_DR_Daisy
		frontend_desc = qs(0xebb8d192)
		sponsor_id = Daisy
		mesh = `models/CAR_Instruments/Guitar/DaisyRock/GTR90_DR_Daisy`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/DaisyRock/gtr90_dr_daisy_d`
				material = GTR90_DR_Daisy_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR90_DR_Daisy
					}
					{
						$preset_layer_fades
						mask = $GTR90_DR_Daisy_fades
					}
					{
						$preset_layer_details
						mask = $GTR90_DR_Daisy_Details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						x_trans = -42
						y_trans = 1
						y_scale = 24
						x_scale = 17
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_22Fret_Daisy01
					CAG_22Fret_Daisy02
					CAG_22Fret_Daisy03
					CAG_22Fret_Daisy04
					CAG_24Fret_Daisy01
					CAG_24Fret_Daisy02
					CAG_24Fret_Daisy03
					CAG_24Fret_Daisy04
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR90_DR_Neckhead01
					GTR90_DR_Neckhead02
				]
			}
			{
				part = CAS_Guitar_Pickguards
				valid = [
					GTR90_pg
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR90_pickup3
					GTR90_pickup1
					GTR94_pickup
					GTR_EMG_pickup1
					GTR_EMG_pickup2
					GTR_EMG_pickup5
					GTR_EMG_pickup4
					GTR_EMG_pickup3
					GTR_EMG_pickup6
					GTR_pickup_SD01
					GTR_pickup_SD05B
					GTR_pickup_SD05
					GTR_pickup_SD06
					GTR_pickup_SD06B
					GTR_Pickup_Type2_PAF1
					GTR_Pickup_Type2_PAF2
					GTR_pickup_SD03
					GTR_pickup_SD04
					GTR_EMG_pickup9
					GTR_EMG_pickup10
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					GTR_Knob_01c
					GTR_Knob_02c
					GTR_Knob_03c
					GTR_Knob_04c
					GTR_Knob_05c
					GTR_Knob_06c
					GTR_Knob_07c
					GTR_Knob_08c
					GTR_Knob_09c
					GTR_Knob_10c
					GTR_Knob_01
					GTR_Knob_02
					GTR_Knob_03
					GTR_Knob_04
					GTR_Knob_05
					GTR_Knob_06
					GTR_Knob_07
					GTR_Knob_08
					GTR_Knob_09
					GTR_Knob_10
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR_Bridge_McSwain_L_4B
					GTR_Bridge_01D
					GTR94_Bridge
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					GTR_Misc_Switch4
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = GTR91_DR_Heart
		frontend_desc = qs(0x56e3da91)
		sponsor_id = Daisy
		mesh = `models/CAR_Instruments/Guitar/DaisyRock/GTR91_DR_Heart`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/DaisyRock/GTR91_DR_Heart_d`
				material = GTR91_DR_heart_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR91_DR_Heart
					}
					{
						$preset_layer_fades
						mask = $GTR91_DR_Heart_fades
					}
					{
						$preset_layer_details
						mask = $GTR91_DR_Heart_Details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						y_trans = 30
						x_scale = 15
						y_scale = 23
						x_trans = -12
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_22Fret_Daisy01
					CAG_22Fret_Daisy02
					CAG_22Fret_Daisy03
					CAG_22Fret_Daisy04
					CAG_24Fret_Daisy01
					CAG_24Fret_Daisy02
					CAG_24Fret_Daisy03
					CAG_24Fret_Daisy04
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR91_DR_Neckhead01
					GTR91_DR_Neckhead02
				]
			}
			{
				part = CAS_Guitar_Pickguards
				valid = [
					GTR91_pg
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR90_pickup1
					GTR90_pickup3
					GTR_EMG_pickup5
					GTR_pickup_SD06B
					GTR_EMG_pickup4
					GTR_EMG_pickup3
					GTR_pickup_SD05
					GTR_Pickup_Type2_PAF2
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					GTR_Knob_01c
					GTR_Knob_02c
					GTR_Knob_03c
					GTR_Knob_04c
					GTR_Knob_05c
					GTR_Knob_06c
					GTR_Knob_07c
					GTR_Knob_08c
					GTR_Knob_09c
					GTR_Knob_10c
					GTR_Knob_01
					GTR_Knob_02
					GTR_Knob_03
					GTR_Knob_04
					GTR_Knob_05
					GTR_Knob_06
					GTR_Knob_07
					GTR_Knob_08
					GTR_Knob_09
					GTR_Knob_10
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR_Bridge_McSwain_L_4B
					GTR_Bridge_01D
					GTR94_Bridge
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					GTR_Misc_Switch4
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = gtr93_DR_Siren
		frontend_desc = qs(0x99f8ce9e)
		sponsor_id = Daisy
		mesh = `models/CAR_Instruments/Guitar/DaisyRock/gtr93_DR_Siren`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/DaisyRock/gtr93_DR_Siren_d`
				material = gtr93_DR_Siren_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr93_DR_Siren
					}
					{
						$preset_layer_fades
						mask = $gtr93_DR_Siren_fades
					}
					{
						$preset_layer_details
						mask = $gtr93_DR_Siren_Details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						y_trans = -1
						x_scale = 20
						y_scale = 30
						x_trans = -40
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_22Fret_Daisy01
					CAG_22Fret_Daisy02
					CAG_22Fret_Daisy03
					CAG_22Fret_Daisy04
					CAG_24Fret_Daisy01
					CAG_24Fret_Daisy02
					CAG_24Fret_Daisy03
					CAG_24Fret_Daisy04
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR93_DR_Neckhead01
					GTR93_DR_Neckhead02
				]
			}
			{
				part = CAS_Guitar_Pickguards
				valid = [
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR_Pickup_Type2_PAF1
					GTR90_pickup1
					GTR90_pickup3
					GTR94_pickup
					GTR_EMG_pickup1
					GTR_EMG_pickup2
					GTR_EMG_pickup5
					GTR_EMG_pickup4
					GTR_EMG_pickup3
					GTR_EMG_pickup6
					GTR_pickup_SD05
					GTR_pickup_SD05B
					GTR_pickup_SD06
					GTR_pickup_SD06B
					GTR_Pickup_Type2_PAF1
					GTR_Pickup_Type2_PAF2
					GTR_pickup_SD03
					GTR_pickup_SD04
					GTR_EMG_pickup9
					GTR_EMG_pickup10
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					GTR_Knob_01
					GTR_Knob_02
					GTR_Knob_03
					GTR_Knob_04
					GTR_Knob_05
					GTR_Knob_06
					GTR_Knob_07
					GTR_Knob_08
					GTR_Knob_09
					GTR_Knob_10
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR_Bridge_01D
					GTR_Bridge_McSwain_L_4B
					GTR94_Bridge
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					GTR_Misc_Switch4
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = gtr92_DR_Star
		frontend_desc = qs(0xb3a12c1d)
		sponsor_id = Daisy
		mesh = `models/CAR_Instruments/Guitar/DaisyRock/gtr92_DR_Star`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/DaisyRock/gtr92_DR_Star_d`
				material = gtr92_DR_Star_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr92_DR_Star
					}
					{
						$preset_layer_fades
						mask = $gtr92_DR_Star_fades
					}
					{
						$preset_layer_details
						mask = $gtr92_DR_Star_Details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						y_trans = 22
						x_scale = 14
						y_scale = 22
						x_trans = -33
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_22Fret_Daisy01
					CAG_22Fret_Daisy02
					CAG_22Fret_Daisy03
					CAG_22Fret_Daisy04
					CAG_24Fret_Daisy01
					CAG_24Fret_Daisy02
					CAG_24Fret_Daisy03
					CAG_24Fret_Daisy04
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR92_DR_Neckhead01
					GTR92_DR_Neckhead02
				]
			}
			{
				part = CAS_Guitar_Pickguards
				valid = [
					GTR92_pg
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR90_pickup1
					GTR90_pickup3
					GTR94_pickup
					GTR_EMG_pickup1
					GTR_EMG_pickup2
					GTR_EMG_pickup5
					GTR_EMG_pickup4
					GTR_EMG_pickup3
					GTR_EMG_pickup6
					GTR_pickup_SD01
					GTR_pickup_SD05
					GTR_pickup_SD05B
					GTR_pickup_SD06
					GTR_pickup_SD06B
					GTR_Pickup_Type2_PAF1
					GTR_Pickup_Type2_PAF2
					GTR_pickup_SD03
					GTR_pickup_SD04
					GTR_EMG_pickup9
					GTR_EMG_pickup10
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					GTR_Knob_01c
					GTR_Knob_02c
					GTR_Knob_03c
					GTR_Knob_04c
					GTR_Knob_05c
					GTR_Knob_06c
					GTR_Knob_07c
					GTR_Knob_08c
					GTR_Knob_09c
					GTR_Knob_10c
					GTR_Knob_01
					GTR_Knob_02
					GTR_Knob_03
					GTR_Knob_04
					GTR_Knob_05
					GTR_Knob_06
					GTR_Knob_07
					GTR_Knob_08
					GTR_Knob_09
					GTR_Knob_10
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR_Bridge_McSwain_L_4B
					GTR_Bridge_01D
					GTR94_Bridge
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					None
					GTR_Misc_Switch4
				]
			}
		]
		$car_rocker_guitars_factoredGlobal_1
	}
	{
		desc_id = GTR94_DR_TomBoy
		frontend_desc = qs(0x43e694e3)
		sponsor_id = Daisy
		mesh = `models/CAR_Instruments/Guitar/DaisyRock/GTR94_DR_TomBoy`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/DaisyRock/GTR94_DR_TomBoy_d`
				material = GTR94_DR_TomBoy_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR94_DR_TomBoy
					}
					{
						$preset_layer_fades
						mask = $GTR94_DR_TomBoy_fades
					}
					{
						$preset_layer_details
						mask = $GTR94_DR_TomBoy_Details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						y_trans = -7
						x_scale = 19
						y_scale = 30
						x_trans = -39
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_22Fret_Daisy01
					CAG_22Fret_Daisy02
					CAG_22Fret_Daisy03
					CAG_22Fret_Daisy04
					CAG_24Fret_Daisy01
					CAG_24Fret_Daisy02
					CAG_24Fret_Daisy03
					CAG_24Fret_Daisy04
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR94_DR_Neckhead01
					GTR94_DR_Neckhead02
				]
			}
			{
				part = CAS_Guitar_Pickguards
				valid = [
					GTR94_PG
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR_Pickup_Type2_PAF1
					GTR_Pickup_Type2_PAF2
					GTR94_pickup
					GTR90_pickup1
					GTR90_pickup3
					GTR_EMG_pickup1
					GTR_EMG_pickup2
					GTR_EMG_pickup5
					GTR_EMG_pickup4
					GTR_EMG_pickup3
					GTR_EMG_pickup6
					GTR_pickup_SD01
					GTR_pickup_SD05
					GTR_pickup_SD05B
					GTR_pickup_SD06
					GTR_pickup_SD06B
					GTR_pickup_SD03
					GTR_pickup_SD04
					GTR_EMG_pickup9
					GTR_EMG_pickup10
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					GTR_Knob_01
					GTR_Knob_02
					GTR_Knob_03
					GTR_Knob_04
					GTR_Knob_05
					GTR_Knob_06
					GTR_Knob_07
					GTR_Knob_08
					GTR_Knob_09
					GTR_Knob_10
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR94_Bridge
					GTR_Bridge_01D
					GTR_Bridge_McSwain_L_4B
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					GTR_Misc_Switch4
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = GTR9_ESP_AX
		frontend_desc = qs(0xdf25cb7a)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/esp/GTR9_ESP_AX`
		pak_num = 1
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr9_esp_ax_d`
				material = GTR9_ESP_AX_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR9_ESP_AX
					}
					{
						$preset_layer_fades
						mask = $GTR9_ESP_AX_fades
					}
					{
						$preset_layer_details
						mask = $GTR9_ESP_AX_Details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						x_trans = -28
						x_scale = 21
						y_scale = 30
						y_trans = 31
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_22Fret_ESP01
					CAG_22Fret_ESP02
					CAG_22Fret_ESP03
					CAG_22Fret_ESP04
					CAG_24Fret_ESP01
					CAG_24Fret_ESP02
					CAG_24Fret_ESP03
					CAG_24Fret_ESP04
				]
			}
			{
				part = CAS_Guitar_Pickguards
				valid = [
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR1_ESP_EMG_Pkup_2
					GTR_Pkup_Type1_Blk_2
					GTR3_ESP_EMG_Pkup_2
					GTR6_Pkup_Worngold_2
					GTR6_Pkup_Worngold_2
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					GTR9_ESP_Knob_10_02
					GTR9_Knob_02
					GTR9_Knob_03
					GTR9_Knob_04
					GTR9_Knob_04
					GTR9_Knob_06
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR9_ESP_Bridge_03
					GTR9_Bridge_04
					GTR9_Bridge_FR11
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR9_Neckhead_01
					GTR9_Neckhead_02
					GTR9_Neckhead_03
					GTR9_Neckhead_04
					GTR9_Neckhead_05
					GTR9_Neckhead_06
					GTR9_Neckhead_07
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					None
				]
			}
		]
	}
	{
		desc_id = GTR4_ESP_Eclipse_01
		frontend_desc = qs(0x503bbe00)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/esp/GTR4_ESP_Eclipse_01`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr4_esp_eclipse_d_01`
				material = GTR4_ESP_Eclipse_01_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR4_ESP_Eclipse
					}
					{
						$preset_layer_fades
						mask = $GTR4_ESP_Eclipse_fades
					}
					{
						$preset_layer_details
						mask = $GTR4_ESP_Eclipse_Details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						x_trans = -40
						y_trans = 0
						y_scale = 30
						x_scale = 22
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_22Fret_ESP01
					CAG_22Fret_ESP02
					CAG_22Fret_ESP03
					CAG_22Fret_ESP04
					CAG_24Fret_ESP01
					CAG_24Fret_ESP02
					CAG_24Fret_ESP03
					CAG_24Fret_ESP04
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR4_Neckhead_01
					GTR4_Neckhead_02
					GTR4_Neckhead_03
					GTR4_Neckhead_04
					GTR4_Neckhead_05
					GTR4_Neckhead_06
					GTR4_Neckhead_07
				]
			}
			{
				part = CAS_Guitar_Pickguards
				valid = [
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR1_ESP_EMG_Pkup_2
					GTR_Pkup_Type1_Blk_2
					GTR3_ESP_EMG_Pkup_2
					GTR6_Pkup_Worngold_2
					GTR6_Pkup_Worngold_2
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					GTR4_ESP_Knob_10_03
					GTR4_Knob_02
					GTR4_Knob_03
					GTR4_knob_04
					GTR4_Knob_05
					GTR4_Knob_06
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR4_ESP_Bridge_02
					GTR4_ESP_Bridge_9
					GTR4_Bridge_FR10
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					None
				]
			}
		]
	}
	{
		desc_id = GTR63f_ESP_EX
		frontend_desc = qs(0xd48d1c7c)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR63f_ESP_EX`
		pak_num = 1
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr63f_esp_ex_d`
				material = GTR63f_ESP_EX_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR63f_ESP_EX
					}
					{
						$preset_layer_fades
						mask = $GTR63f_ESP_EX_fades
					}
					{
						$preset_layer_details
						mask = $GTR63f_ESP_EX_Details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						y_trans = 5
						x_scale = 18
						y_scale = 25
						x_trans = -30
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Pickguards
				valid = [
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR62_ESP_EMG
					GTR62_Pkup_Blk
					GTR3_ESP_EMG_Pkup_2
					GTR6_Pkup_Worngold_2
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					GTR63_Knob_Type06
					GTR63_Knob_Type2
					GTR63_Knob_Type3
					GTR63_Knob_Type4
					GTR63_Knob_Type5
					GTR63c_Knob_Type1
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR_Hardware63f
					GTR_Hardware63b
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR63f_Neckhead
					GTR63_Neckhead2
					GTR63_Neckhead3
					GTR63_Neckhead_04
					GTR63_Neckhead_05
					GTR63_Neckhead_06
				]
			}
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_22Fret_ESP01
					CAG_22Fret_ESP02
					CAG_22Fret_ESP03
					CAG_22Fret_ESP04
					CAG_24Fret_ESP01
					CAG_24Fret_ESP02
					CAG_24Fret_ESP03
					CAG_24Fret_ESP04
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					None
				]
			}
		]
	}
	{
		desc_id = GTR30_H101
		frontend_desc = qs(0x80b01b8d)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR30_H101`
		pak_num = 1
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr30_h101_d`
				material = GTR30_H_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR30_H
					}
					{
						$preset_layer_fades
						mask = $GTR30_H_fades
					}
					{
						$preset_layer_details
						mask = $GTR30_H_Details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						x_trans = -39
						y_trans = 15
						y_scale = 28
						x_scale = 22
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Pickguards
				valid = [
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR30_Pickup_D
					GTR30_Pickup_E
					GTR30_Pickup_F
					GTR30_Pickup_G
					GTR30_EMG
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					GTR_30_KNOBS_A
					GTR_30_KNOBS_B
					GTR_30_KNOBS_C
					GTR_30_KNOBS_D
					GTR_30_KNOBS_E
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR30_Brdg_StrgThru
					GTR30_Hardware_03
					GTR30_Bridge_D
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR30_Nekhed_A
					GTR30_Nekhed_B
					GTR30_Nekhed_C
					GTR30_Nekhed_D
					GTR30_Nekhed_E
					GTR30_Nekhed_F
				]
			}
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_22Fret_ESP01
					CAG_22Fret_ESP02
					CAG_22Fret_ESP03
					CAG_22Fret_ESP04
					CAG_24Fret_ESP01
					CAG_24Fret_ESP02
					CAG_24Fret_ESP03
					CAG_24Fret_ESP04
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					None
				]
			}
		]
	}
	{
		desc_id = GTR12_ESP_V_01
		frontend_desc = qs(0x4615d3b8)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/esp/GTR12_ESP_V_01`
		pak_num = 1
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr12_esp_v_series_d`
				material = GTR12_ESP_V_01_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR12_ESP_V_01
					}
					{
						$preset_layer_fades
						mask = $GTR12_ESP_V_01_fades
					}
					{
						$preset_layer_details
						mask = $GTR12_ESP_V_01_Details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						y_trans = 13
						x_scale = 18
						y_scale = 28
						x_trans = -21
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_24Fret_ESP01
					CAG_24Fret_ESP02
					CAG_24Fret_ESP03
					CAG_24Fret_ESP04
					CAG_22Fret_ESP01
					CAG_22Fret_ESP02
					CAG_22Fret_ESP03
					CAG_22Fret_ESP04
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR12_Neckhead_07
					GTR12_Neckhead_01
					GTR12_Neckhead_02
					GTR12_Neckhead_03
					GTR12_Neckhead_04
					GTR12_Neckhead_05
					GTR60_Neckhead4
				]
			}
			{
				part = CAS_Guitar_Pickguards
				valid = [
					None
					GTR12_Pickguard_01
					gtr60_pg4
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR1_ESP_EMG_Pkup_2
					GTR_Pkup_Type1_Blk_2
					GTR3_ESP_EMG_Pkup_2
					GTR6_Pkup_Worngold_2
					GTR6_Pkup_Worngold_2
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					GTR12_ESP_Knob_01
					GTR12_ESP_Knob_02
					GTR12_ESP_Knob_03
					GTR12_ESP_Knob_04
					GTR12_ESP_Knob_05
					GTR12_ESP_Knob_06
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR12_Bridge_3
					GTR12_Bridge_2
					GTR12_Bridge_1
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					None
				]
			}
		]
	}
	{
		desc_id = GTR62_ESP_Alexi
		frontend_desc = qs(0x032e6d0e)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR62_ESP_Alexi`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr62_esp_alexi_d`
				material = GTR62_ESP_Alexi_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR62_ESP_Alexi
					}
					{
						$preset_layer_fades
						mask = $GTR62b_ESP_Jack_fades
					}
					{
						$preset_layer_details
						mask = $GTR62b_ESP_Jack_Details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						x_trans = -21
						x_scale = 18
						y_scale = 26
						y_trans = 12
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Pickguards
				valid = [
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR62_ESP_EMG
					GTR62_Pkup_Blk
					GTR3_ESP_EMG_Pkup_2
					GTR6_Pkup_Worngold_2
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					GTR62_Knob_Type03
					GTR62_Knob_Type02
					GTR62_Knob_Type01
					GTR62_Knob_Type04
					GTR62_Knob_Type05
					GTR62_Knob_Type06
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR_Hardware62a
					GTR_Hardware02
					GTR_Hardware64
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR62_Neckhead
					GTR62_Neckhead2
					GTR62_Neckhead3
					GTR62_Neckhead_04
					GTR62_Neckhead_05
					GTR62_Neckhead_06
				]
			}
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_24Fret_ESP01
					CAG_24Fret_ESP02
					CAG_24Fret_ESP03
					CAG_24Fret_ESP04
					CAG_22Fret_ESP01
					CAG_22Fret_ESP02
					CAG_22Fret_ESP03
					CAG_22Fret_ESP04
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					None
				]
			}
		]
	}
	{
		desc_id = gtr64_esp_F
		frontend_desc = qs(0xf6cef999)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/gtr64_esp_F`
		pak_num = 1
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr64_esp_f_d`
				material = gtr64_esp_F_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr64_esp_F
					}
					{
						$preset_layer_fades
						mask = $gtr64_esp_F_fades
					}
					{
						$preset_layer_details
						mask = $gtr64_esp_F_Details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						x_trans = -32
						x_scale = 23
						y_scale = 30
						y_trans = 27
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Pickguards
				valid = [
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR62_ESP_EMG
					GTR62_Pkup_Blk
					GTR3_ESP_EMG_Pkup_2
					GTR6_Pkup_Worngold_2
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					GTR64_Knob_Type1
					GTR64_Knob_Type2
					GTR64_Knob_Type3
					GTR64_Knob_Type4
					GTR64_Knob_Type5
					GTR64_Knob_Type6
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR_hardware64b
					GTR_Hardware64f
					GTR_Hardware64bb
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR64_Neckhead
					gtr64_neckhead2
					gtr64_neckhead3
					GTR64_Neckhead_04
					GTR64_Neckhead_05
					GTR64_Neckhead_06
				]
			}
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_22Fret_ESP01
					CAG_22Fret_ESP02
					CAG_22Fret_ESP03
					CAG_22Fret_ESP04
					CAG_24Fret_ESP01
					CAG_24Fret_ESP02
					CAG_24Fret_ESP03
					CAG_24Fret_ESP04
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					None
				]
			}
		]
		locked
	}
	{
		desc_id = GTR32_Body
		frontend_desc = qs(0x830c200b)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/esp/GTR_32_Body`
		pak_num = 1
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr32_body`
				material = GTR32_Horizon_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAG_GTR32
					}
					{
						$preset_layer_fades
						mask = $CAG_GTR32_fades
					}
					{
						$preset_layer_details
						mask = $CAG_GTR32_details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						y_trans = 25
						x_scale = 23
						y_scale = 30
						x_trans = -39
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Pickguards
				valid = [
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR32_Pickup_F
					GTR31_Pickup_D
					GTR31_Pickup_E
					GTR32_Pickup_G
					GTR32_EMG
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					GTR_32_KNOBS_A
					GTR_32_KNOBS_B
					GTR_32_KNOBS_C
					GTR_32_KNOBS_D
					GTR_32_KNOBS_E
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR32_Hardware01
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR32_Nekhead01
					GTR32_Neckhead_B
					GTR32_Neckhead_C
					GTR32_Neckhead_D
					GTR32_Neckhead_E
					GTR32_Neckhead_F
				]
			}
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_22Fret_ESP01
					CAG_22Fret_ESP02
					CAG_22Fret_ESP03
					CAG_22Fret_ESP04
					CAG_24Fret_ESP01
					CAG_24Fret_ESP02
					CAG_24Fret_ESP03
					CAG_24Fret_ESP04
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					None
				]
			}
		]
	}
	{
		desc_id = GTR33D_BASE
		frontend_desc = qs(0xe230e599)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/esp/GTR33D_BASE`
		pak_num = 1
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr33_kh2_wood_d`
				material = GTR33D_Wood_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAG_GTR33
					}
					{
						$preset_layer_fades
						mask = $CAG_GTR33_fades
					}
					{
						$preset_layer_details
						mask = $CAG_GTR33_details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						y_trans = 25
						x_scale = 20
						y_scale = 30
						x_trans = -40
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Pickguards
				valid = [
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR33_EMG
					GTR33_Pickup_A
					GTR33_Pickup_D
					GTR33_Pickup_E
					GTR33_Pickup_F
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					GTR33_Knobs_KH2
					GTR_33_KNOBS_B
					GTR_33_KNOBS_C
					GTR_33_KNOBS_A
					GTR_33_KNOBS_D
					GTR_33_KNOBS_E
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR33_Hardware01Z
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR33D_NekHed
					GTR33D_NekHed_B
					GTR33D_NekHed_C
					GTR33D_Neckhead_D
					GTR33D_NekHed_E
					GTR33D_NekHed_F
				]
			}
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_22Fret_ESP01
					CAG_22Fret_ESP02
					CAG_22Fret_ESP03
					CAG_22Fret_ESP04
					CAG_24Fret_ESP01
					CAG_24Fret_ESP02
					CAG_24Fret_ESP03
					CAG_24Fret_ESP04
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					None
				]
			}
		]
	}
	{
		desc_id = GTR37_ESP_RW
		frontend_desc = qs(0x2be4ce3b)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR37_RW01`
		pak_num = 1
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr37_rw_d`
				material = GTR37_RW_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR37_RW
					}
					{
						$preset_layer_fades
						mask = $GTR37_RW_fades
					}
					{
						$preset_layer_details
						mask = $GTR37_RW_Details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						x_trans = -41
						y_trans = 4
						y_scale = 30
						x_scale = 21
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Pickguards
				valid = [
					GTR37_PGuard01
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR37_Pickup
					GTR38_Pickup
					GTR37_Pickup_D
					GTR37_Pickup_E
					GTR37_Pickup_F
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					GTR37_Knobs01
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR37_Bridge
					GTR37_Hardware
					GTR37_Brdg_ST
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR37_Neckhead
					GTR37_NeckHead_B
					GTR37_NeckHead_C
					GTR37_Neckhead_D
					GTR37_Neckhead_E
					GTR37_Neckhead_F
				]
			}
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_22Fret_ESP01
					CAG_22Fret_ESP02
					CAG_22Fret_ESP03
					CAG_22Fret_ESP04
					CAG_24Fret_ESP01
					CAG_24Fret_ESP02
					CAG_24Fret_ESP03
					CAG_24Fret_ESP04
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					None
				]
			}
		]
	}
	{
		desc_id = GTR36_SuperV
		frontend_desc = qs(0x27489198)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/esp/GTR36_SuperV`
		pak_num = 1
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr36_superv`
				material = GTR36_SuperV_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $CAG_Guitar36_Body
					}
					{
						$preset_layer_fades
						mask = $CAG_Guitar36_fades
					}
					{
						$preset_layer_details
						mask = $CAG_Guitar36_details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						x_trans = -16
						x_scale = 17
						y_scale = 26
						y_trans = 8
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Pickguards
				valid = [
					GTR36_PGARD
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR36_Pickup
					GTR36_Pickup_D
					GTR36_Pickup_E
					GTR36_Pickup_F
					GTR36_EMG
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					GTR_36_Knobs_B
					GTR_36_Knobs_A
					GTR_36_Knobs_C
					GTR_36_Knobs_D
					GTR_36_Knobs_E
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR36_Hardware01
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR36_NekHed
					GTR36_NekHed_B
					GTR36_NekHed_C
					GTR36_NekHed_D
					GTR36_NekHed_E
					GTR36_NekHed_F
				]
			}
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_22Fret_ESP01
					CAG_22Fret_ESP02
					CAG_22Fret_ESP03
					CAG_22Fret_ESP04
					CAG_24Fret_ESP01
					CAG_24Fret_ESP02
					CAG_24Fret_ESP03
					CAG_24Fret_ESP04
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					None
				]
			}
		]
		locked
	}
	{
		desc_id = GTR31_ESP_VIPER
		frontend_desc = qs(0xd6e22e0b)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/esp/GTR_31_Viper`
		pak_num = 1
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr31_viper_d`
				material = GTR_31_Viper_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR31_Viper
					}
					{
						$preset_layer_fades
						mask = $GTR31_Viper_fades
					}
					{
						$preset_layer_details
						mask = $GTR31_Viper_details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						y_trans = 16
						x_scale = 20
						y_scale = 25
						x_trans = -36
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Pickguards
				valid = [
					None
					GTR31_PGard
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR31_Pickup_D
					GTR31_Pickup_E
					GTR31_Pickup_G
					GTR31_Pickup_F
					GTR31_EMG
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					GTR_31_KNOBS_VPR
					GTR_31_KNOBS_C
					GTR_31_KNOBS_D
					GTR_31_KNOBS_E
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR31_Bridge_TM02
					GTR31_Hardware_B
					GTR_31_Bridge_E
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR31c_NeckHead
					GTR31c_NeckHead02
					GTR31c_NeckHead03
					GTR31c_NeckHead04
					GTR31c_NeckHead05
					GTR31c_NeckHead06
				]
			}
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_22Fret_ESP01
					CAG_22Fret_ESP02
					CAG_22Fret_ESP03
					CAG_22Fret_ESP04
					CAG_24Fret_ESP01
					CAG_24Fret_ESP02
					CAG_24Fret_ESP03
					CAG_24Fret_ESP04
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					None
				]
			}
		]
		locked
	}
	{
		desc_id = GTR66_ESP_Shini
		frontend_desc = qs(0xd78e09c1)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR66_ESP_Shini`
		pak_num = 0
		inclusion = [
			{
				part = CAS_Guitar_Pickguards
				valid = [
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR_Pickup_Type66
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					GTR66_Knob_Type1
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR_Hardware66
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR66_Neckhead
				]
			}
			{
				part = CAS_Guitar_Neck
				valid = [
					GTR_Fretboard_66
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					None
				]
			}
		]
		locked
	}
	{
		desc_id = GTR77_IBZ_RG
		frontend_desc = qs(0xc85347f5)
		mesh = `models/CAR_Instruments/Guitar/Ibanez/GTR77_IBZ_RG`
		sponsor_id = Ibanez
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR77_IBZ_RG_d`
				material = GTR77_IBZ_RG_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR77_IBZ_RG
					}
					{
						$preset_layer_fades
						mask = $GTR77_IBZ_RG_fades
					}
					{
						$preset_layer_details
						mask = $GTR77_IBZ_RG_Details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						y_trans = 28
						x_scale = 22
						y_scale = 30
						x_trans = -36
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_24Fret_Ibanez01
					CAG_24Fret_Ibanez02
					CAG_24Fret_Ibanez04
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR77_Neckhead_01
					GTR77_Neckhead_02
					GTR77_Neckhead_03
					GTR77_Neckhead_04
				]
			}
			{
				part = CAS_Guitar_Pickguards
				valid = [
					GTR77_IBZ_RG_PG
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR76_pickupB
					GTR_EMG_pickup1
					GTR_EMG_pickup2
					GTR_EMG_pickup5
					GTR_EMG_pickup4
					GTR_EMG_pickup3
					GTR_EMG_pickup6
					GTR_pickup_SD01
					GTR_pickup_SD05
					GTR_pickup_SD05B
					GTR_pickup_SD06
					GTR_pickup_SD06B
					GTR_Pickup_Type2_PAF1
					GTR_Pickup_Type2_PAF2
					GTR_pickup_SD03
					GTR_pickup_SD04
					GTR_EMG_pickup9
					GTR_EMG_pickup10
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					GTR_Knob_01
					GTR_Knob_02
					GTR_Knob_03
					GTR_Knob_04
					GTR_Knob_05
					GTR_Knob_06
					GTR_Knob_07
					GTR_Knob_08
					GTR_Knob_09
					GTR_Knob_10
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR75_bridge2
					GTR77_bridge
					GTR76_bridge
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = GTR76_IBZ_S5470
		frontend_desc = qs(0xb12fdd15)
		mesh = `models/CAR_Instruments/Guitar/Ibanez/GTR76_IBZ_S5470`
		sponsor_id = Ibanez
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR76_IBZ_S5470_d`
				material = GTR76_IBZ_S5470_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR76_IBZ_S5470
					}
					{
						$preset_layer_fades
						mask = $GTR76_IBZ_S5470_fades
					}
					{
						$preset_layer_details
						mask = $GTR76_IBZ_S5470_Details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						y_trans = 27
						x_scale = 23
						y_scale = 30
						x_trans = -35
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_24Fret_Ibanez01
					CAG_24Fret_Ibanez02
					CAG_24Fret_Ibanez04
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR76_Neckhead_01
					GTR76_Neckhead_02
					GTR76_Neckhead_03
					GTR76_Neckhead_04
				]
			}
			{
				part = CAS_Guitar_Pickguards
				valid = [
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR76_pickupA
					GTR_EMG_pickup1
					GTR_EMG_pickup2
					GTR_EMG_pickup5
					GTR_EMG_pickup4
					GTR_EMG_pickup3
					GTR_EMG_pickup6
					GTR_pickup_SD01
					GTR_pickup_SD05
					GTR_pickup_SD05B
					GTR_pickup_SD06
					GTR_pickup_SD06B
					GTR_Pickup_Type2_PAF1
					GTR_Pickup_Type2_PAF2
					GTR_pickup_SD03
					GTR_pickup_SD04
					GTR_EMG_pickup9
					GTR_EMG_pickup10
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					GTR_Knob_01
					GTR_Knob_02
					GTR_Knob_03
					GTR_Knob_04
					GTR_Knob_05
					GTR_Knob_06
					GTR_Knob_07
					GTR_Knob_08
					GTR_Knob_09
					GTR_Knob_10
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR75_bridge2
					GTR77_bridge
					GTR76_bridge
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					GTR76_Switch
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = GTR75_IBZ_XPT
		frontend_desc = qs(0x33f1dd88)
		mesh = `models/CAR_Instruments/Guitar/Ibanez/GTR75_IBZ_XPT`
		sponsor_id = Ibanez
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR75_IBZ_XPT_d`
				material = GTR75_IBZ_XPT_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR75_IBZ_XPT
					}
					{
						$preset_layer_fades
						mask = $GTR75_IBZ_XPT_fades
					}
					{
						$preset_layer_details
						mask = $GTR75_IBZ_XPT_Details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						x_trans = -25
						x_scale = 15
						y_scale = 21
						y_trans = 16
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_24Fret_Ibanez01
					CAG_24Fret_Ibanez02
					CAG_24Fret_Ibanez04
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR75_Neckhead_01
					GTR75_Neckhead_02
					GTR75_Neckhead_03
					GTR75_Neckhead_04
				]
			}
			{
				part = CAS_Guitar_Pickguards
				valid = [
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR78_pickup
					GTR_EMG_pickup1
					GTR_EMG_pickup2
					GTR_EMG_pickup5
					GTR_EMG_pickup4
					GTR_EMG_pickup3
					GTR_EMG_pickup6
					GTR_pickup_SD01
					GTR_pickup_SD05
					GTR_pickup_SD05B
					GTR_pickup_SD06
					GTR_pickup_SD06B
					GTR_Pickup_Type2_PAF1
					GTR_Pickup_Type2_PAF2
					GTR_pickup_SD03
					GTR_pickup_SD04
					GTR_EMG_pickup9
					GTR_EMG_pickup10
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					GTR_Knob_01
					GTR_Knob_02
					GTR_Knob_03
					GTR_Knob_04
					GTR_Knob_05
					GTR_Knob_06
					GTR_Knob_07
					GTR_Knob_08
					GTR_Knob_09
					GTR_Knob_10
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR75_bridge2
					GTR77_bridge
					GTR76_bridge
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					GTR_Misc_Switch4
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = GTR78_Kurt
		frontend_desc = qs(0x4226c524)
		mesh = `models/CAR_Instruments/Guitar/Ibanez/GTR78_Kurt`
		pak_num = 0
		inclusion = [
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_22Fret_Ibanez03
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR78_Neckhead
				]
			}
			{
				part = CAS_Guitar_Pickguards
				valid = [
					GTR78_PG
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR78_pickup1
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					GTR_Knob_01Kurt
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					gtr78_bridge
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					GTR78_misc
				]
			}
		]
		$car_rocker_guitars_factoredGlobal_24
	}
	{
		desc_id = GTR10_McSwain_Flame
		frontend_desc = qs(0x25577ec9)
		sponsor_id = McSwain
		mesh = `models/CAR_Instruments/Guitar/McSwain/GTR10_McSwain_Flame`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/McSwain/gtr10_mcswain_flame_d`
				material = GTR10_McSwain_Flame_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr1_McSwn_Flame
					}
					{
						$preset_layer_fades
						mask = $gtr1_McSwn_Flame_fades
					}
					{
						$preset_layer_details
						mask = $gtr1_McSwn_Flame_Details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						x_trans = -36
						x_scale = 21
						y_scale = 30
						y_trans = 23
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_22Fret_Mcswain01
					CAG_22Fret_Mcswain02
					CAG_22Fret_Mcswain03
					CAG_22Fret_Mcswain04
					CAG_24Fret_mcswain01
					CAG_24Fret_mcswain02
					CAG_24Fret_mcswain03
					CAG_24Fret_mcswain04
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR10_Neckhead_McSwain1
					GTR12_Neckhead_McSwain12
				]
			}
			{
				part = CAS_Guitar_Pickguards
				valid = [
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR_Pickup_Type2_PAF1
					GTR_Pickup_Type2_PAF2
					Gtr10_Pickup_McSwain_1
					GTR_Pickup_Type2_02
					GTR_Pickup_Type3_Blk
					GTR_EMG_pickup1
					GTR_EMG_pickup2
					GTR_EMG_pickup5
					GTR_EMG_pickup4
					GTR_EMG_pickup3
					GTR_EMG_pickup6
					GTR_pickup_SD01
					GTR_pickup_SD05
					GTR_pickup_SD05B
					GTR_pickup_SD06
					GTR_pickup_SD06B
					GTR_pickup_SD03
					GTR_pickup_SD04
					GTR_EMG_pickup9
					GTR_EMG_pickup10
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					GTR_Knob_01
					GTR_Knob_02
					GTR_Knob_03
					GTR_Knob_04
					GTR_Knob_05
					GTR_Knob_06
					GTR_Knob_07
					GTR_Knob_08
					GTR_Knob_09
					GTR_Knob_10
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR_Bridge_McSwain_6
					Gtr10_Bridge_McSwain_1
					GTR_Brdg_McSwn_inferno_3
					GTR_Bridge_McSwain_L_4
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					GTR_Misc_Switch
					GTR_Misc_Switch_blk_3
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = GTR11_McSwain_Carved
		frontend_desc = qs(0x5a6c83f8)
		sponsor_id = McSwain
		mesh = `models/CAR_Instruments/Guitar/McSwain/GTR11_McSwain_Carved`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/McSwain/gtr11_mcswain_carved_d`
				material = GTR11_McSwain_Carved_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr11_McSwn_Carve
					}
					{
						$preset_layer_fades
						mask = $gtr11_McSwn_Carve_Fades
					}
					{
						$preset_layer_details
						mask = $gtr11_McSwn_Carve_Details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						x_trans = -37
						x_scale = 21
						y_scale = 30
						y_trans = 22
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_22Fret_Mcswain01
					CAG_22Fret_Mcswain02
					CAG_22Fret_Mcswain03
					CAG_22Fret_Mcswain04
					CAG_24Fret_mcswain01
					CAG_24Fret_mcswain02
					CAG_24Fret_mcswain03
					CAG_24Fret_mcswain04
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR12_Neckhead_McSwain12
					GTR10_Neckhead_McSwain1
				]
			}
			{
				part = CAS_Guitar_Pickguards
				valid = [
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR_Pickup_Type2_PAF1
					GTR_Pickup_Type2_PAF2
					Gtr10_Pickup_McSwain_1
					GTR_Pickup_Type2_02
					GTR_Pickup_Type3_Blk
					GTR_EMG_pickup1
					GTR_EMG_pickup2
					GTR_EMG_pickup5
					GTR_EMG_pickup4
					GTR_EMG_pickup3
					GTR_EMG_pickup6
					GTR_pickup_SD01
					GTR_pickup_SD05
					GTR_pickup_SD05B
					GTR_pickup_SD06
					GTR_pickup_SD06B
					GTR_pickup_SD03
					GTR_pickup_SD04
					GTR_EMG_pickup9
					GTR_EMG_pickup10
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					GTR_Knob_01
					GTR_Knob_02
					GTR_Knob_03
					GTR_Knob_04
					GTR_Knob_05
					GTR_Knob_06
					GTR_Knob_07
					GTR_Knob_08
					GTR_Knob_09
					GTR_Knob_10
					GTR_Knob_01b
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR_Bridge_McSwain_2
					Gtr10_Bridge_McSwain_1
					GTR_Brdg_McSwn_inferno_3
					GTR_Bridge_McSwain_L_4
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					GTR_Misc_Switch
					GTR_Misc_Switch_blk_3
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = GTR12_McSwain_MInferno
		frontend_desc = qs(0x976a0248)
		sponsor_id = McSwain
		mesh = `models/CAR_Instruments/Guitar/McSwain/GTR12_McSwain_MInferno`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/McSwain/gtr12_mcswain_minferno_d`
				material = GTR12_McSwain_MInferno_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr12_McSwn_MInferno
					}
					{
						$preset_layer_fades
						mask = $gtr12_McSwn_MInferno_Fades
					}
					{
						$preset_layer_details
						mask = $gtr12_McSwn_MInferno_Details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						y_trans = 25
						x_scale = 21
						y_scale = 30
						x_trans = -33
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_22Fret_Mcswain01
					CAG_22Fret_Mcswain02
					CAG_22Fret_Mcswain03
					CAG_22Fret_Mcswain04
					CAG_24Fret_mcswain01
					CAG_24Fret_mcswain02
					CAG_24Fret_mcswain03
					CAG_24Fret_mcswain04
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR12_Neckhead_McSwain12
					GTR10_Neckhead_McSwain1
				]
			}
			{
				part = CAS_Guitar_Pickguards
				valid = [
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR_Pickup_Type2_PAF1
					GTR_Pickup_Type2_PAF2
					Gtr10_Pickup_McSwain_1
					GTR_Pickup_Type2_02
					GTR_Pickup_Type3_Blk
					GTR_Pickup_Type3_Blk
					GTR_EMG_pickup1
					GTR_EMG_pickup2
					GTR_EMG_pickup5
					GTR_EMG_pickup4
					GTR_EMG_pickup3
					GTR_EMG_pickup6
					GTR_pickup_SD01
					GTR_pickup_SD05
					GTR_pickup_SD05B
					GTR_pickup_SD06
					GTR_pickup_SD06B
					GTR_pickup_SD03
					GTR_pickup_SD04
					GTR_EMG_pickup9
					GTR_EMG_pickup10
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					GTR_Knob_01
					GTR_Knob_02
					GTR_Knob_03
					GTR_Knob_04
					GTR_Knob_05
					GTR_Knob_06
					GTR_Knob_07
					GTR_Knob_08
					GTR_Knob_09
					GTR_Knob_10
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR_Brdg_McSwn_inferno_3
					GTR_Bridge_McSwain_2
					Gtr10_Bridge_McSwain_1
					GTR_Bridge_McSwain_L_4
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					GTR_Misc_Switch
					GTR_Misc_Switch_blk_3
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = GTR13_McSwain_Machine
		frontend_desc = qs(0xc2e7c0f1)
		sponsor_id = McSwain
		mesh = `models/CAR_Instruments/Guitar/McSwain/GTR13_McSwain_Machine`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/McSwain/gtr13_mcswain_machine_d`
				material = GTR13_McSwain_Machine_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR13_McSwain_Machine
					}
					{
						$preset_layer_fades
						mask = $GTR13_McSwain_Machine_Fades
					}
					{
						$preset_layer_details
						mask = $GTR13_McSwain_Machine_Details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						y_trans = 25
						x_scale = 21
						y_scale = 30
						x_trans = -31
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_22Fret_Mcswain01
					CAG_22Fret_Mcswain02
					CAG_22Fret_Mcswain03
					CAG_22Fret_Mcswain04
					CAG_24Fret_mcswain01
					CAG_24Fret_mcswain02
					CAG_24Fret_mcswain03
					CAG_24Fret_mcswain04
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR12_Neckhead_McSwain12
					GTR10_Neckhead_McSwain1
				]
			}
			{
				part = CAS_Guitar_Pickguards
				valid = [
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR_Pickup_Type2_PAF1
					GTR_Pickup_Type2_PAF2
					Gtr10_Pickup_McSwain_1
					GTR_Pickup_Type2_02
					GTR_Pickup_Type3_Blk
					GTR_EMG_pickup1
					GTR_EMG_pickup2
					GTR_EMG_pickup5
					GTR_EMG_pickup4
					GTR_EMG_pickup3
					GTR_EMG_pickup6
					GTR_pickup_SD01
					GTR_pickup_SD05
					GTR_pickup_SD05B
					GTR_pickup_SD06
					GTR_pickup_SD06B
					GTR_pickup_SD03
					GTR_pickup_SD04
					GTR_EMG_pickup9
					GTR_EMG_pickup10
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					GTR_Knob_01
					GTR_Knob_02
					GTR_Knob_03
					GTR_Knob_04
					GTR_Knob_05
					GTR_Knob_06
					GTR_Knob_07
					GTR_Knob_08
					GTR_Knob_09
					GTR_Knob_10
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR_Bridge_McSwain_2
					Gtr10_Bridge_McSwain_1
					GTR_Brdg_McSwn_inferno_3
					GTR_Bridge_McSwain_L_4
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					GTR13_Misc_Gauges
					GTR13_Misc_Switch
					None
				]
			}
		]
		$car_rocker_guitars_factoredGlobal_1
	}
	{
		desc_id = GTR14_McSwain_Life
		frontend_desc = qs(0xe0a8490d)
		sponsor_id = McSwain
		mesh = `models/CAR_Instruments/Guitar/McSwain/GTR14_McSwain_Life`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/McSwain/gtr14_mcswain_life_d`
				material = GTR14_McSwain_Life_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR14_McSwain_Life
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						y_trans = 25
						x_scale = 22
						y_scale = 30
						x_trans = -38
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_22Fret_Mcswain01
					CAG_22Fret_Mcswain02
					CAG_22Fret_Mcswain03
					CAG_22Fret_Mcswain04
					CAG_24Fret_mcswain01
					CAG_24Fret_mcswain02
					CAG_24Fret_mcswain03
					CAG_24Fret_mcswain04
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR14_Neckhead_McSwain3
					GTR14_Neckhead_McSwain4
				]
			}
			{
				part = CAS_Guitar_Pickguards
				valid = [
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR_Pickup_Type3_Blk2
					Gtr10_Pickup_McSwain_1
					GTR_Pickup_Type2_PAF1
					GTR_Pickup_Type2_PAF2
					GTR_Pickup_Type2_02
					GTR_Pickup_Type3_Blk
					GTR_Pickup_Type3_Blk
					GTR_EMG_pickup1
					GTR_EMG_pickup2
					GTR_EMG_pickup5
					GTR_EMG_pickup4
					GTR_EMG_pickup3
					GTR_EMG_pickup6
					GTR_pickup_SD01
					GTR_pickup_SD05
					GTR_pickup_SD05B
					GTR_pickup_SD06
					GTR_pickup_SD06B
					GTR_pickup_SD03
					GTR_pickup_SD04
					GTR_EMG_pickup9
					GTR_EMG_pickup10
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					GTR_Knob_01
					GTR_Knob_02
					GTR_Knob_03
					GTR_Knob_04b
					GTR_Knob_05
					GTR_Knob_06
					GTR_Knob_07
					GTR_Knob_08
					GTR_Knob_09
					GTR_Knob_10
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR_Bridge_McSwain_L_5
					GTR_Bridge_McSwain_2b
					Gtr10_Bridge_McSwain_1
					GTR_Brdg_McSwn_inferno_3b
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					GTR_Misc_McSwn_swtch1
					None
				]
			}
		]
		$car_rocker_guitars_factoredGlobal_1
	}
	{
		desc_id = gtr86_mm_axis
		frontend_desc = qs(0xb089b2cb)
		sponsor_id = `Music	Man`
		mesh = `models/CAR_Instruments/Guitar/MM/gtr86_mm_axis`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/mm/gtr86_mm_axis_d`
				material = gtr86_mm_axis_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr86_mm_axis
					}
					{
						$preset_layer_fades
						mask = $gtr86_mm_axis_fades
					}
					{
						$preset_layer_details
						mask = $gtr86_mm_axis_Details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						x_trans = -30
						x_scale = 22
						y_scale = 30
						y_trans = 28
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_22Fret_MM01
					CAG_22Fret_MM02
					CAG_22Fret_MM03
					CAG_22Fret_MM04
					CAG_24Fret_MM01
					CAG_24Fret_MM02
					CAG_24Fret_MM03
					CAG_24Fret_MM04
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					gtr86_Neckhead_01
				]
			}
			{
				part = CAS_Guitar_Pickguards
				valid = [
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR86_pickup
					GTR_Pickup_Type2_PAF1
					GTR76_pickupA_C
					GTR84_pickup_A
					GTR_EMG_pickup1
					GTR_EMG_pickup2
					GTR_EMG_pickup5
					GTR_EMG_pickup4
					GTR_EMG_pickup3
					GTR_EMG_pickup6
					GTR_pickup_SD01
					GTR_pickup_SD05
					GTR_pickup_SD05B
					GTR_pickup_SD06
					GTR_pickup_SD06B
					GTR_pickup_SD03
					GTR_pickup_SD04
					GTR_EMG_pickup9
					GTR_EMG_pickup10
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					GTR_Knob_01c
					GTR_Knob_02c
					GTR_Knob_03c
					GTR_Knob_04c
					GTR_Knob_05c
					GTR_Knob_06c
					GTR_Knob_07c
					GTR_Knob_08c
					GTR_Knob_09c
					GTR_Knob_10
					GTR_Knob_01
					GTR_Knob_02
					GTR_Knob_03
					GTR_Knob_04
					GTR_Knob_05
					GTR_Knob_06
					GTR_Knob_07
					GTR_Knob_08
					GTR_Knob_09
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR75_bridgeMM
					GTR86_Bridge
					GTR84_Whammy
					GTR75_bridgeBMM
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					GTR_Misc_Switch4
					GTR71_Switch
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = GTR84_MM_Petrucci
		frontend_desc = qs(0xaa5046fb)
		sponsor_id = `Music	Man`
		mesh = `models/CAR_Instruments/Guitar/MM/GTR84_MM_Petrucci`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/MM/gtr84_mm_petrucci`
				material = GTR84_MM_Pet_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR84_MM_PET
					}
					{
						$preset_layer_fades
						mask = $GTR84_MM_PET_fades
					}
					{
						$preset_layer_details
						mask = $GTR84_MM_PET_Details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						y_trans = 21
						x_scale = 23
						y_scale = 26
						x_trans = -36
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_22Fret_MM01
					CAG_22Fret_MM02
					CAG_22Fret_MM03
					CAG_22Fret_MM04
					CAG_24Fret_MM01
					CAG_24Fret_MM02
					CAG_24Fret_MM03
					CAG_24Fret_MM04
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR84_Neckhead01
				]
			}
			{
				part = CAS_Guitar_Pickguards
				valid = [
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR84_pickup_A
					GTR86_pickup
					GTR86_pickupb
					GTR_Pickup_Type2_PAF1
					GTR76_pickupA_C
					GTR_EMG_pickup1
					GTR_EMG_pickup2
					GTR_EMG_pickup5
					GTR_EMG_pickup4
					GTR_EMG_pickup6
					GTR_pickup_SD01
					GTR_pickup_SD05
					GTR_pickup_SD05B
					GTR_pickup_SD06
					GTR_pickup_SD06B
					GTR_pickup_SD03
					GTR_pickup_SD04
					GTR_EMG_pickup9
					GTR_EMG_pickup10
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					GTR_Knob_MM01
					GTR_Knob_02
					GTR_Knob_03
					GTR_Knob_04
					GTR_Knob_05
					GTR_Knob_06
					GTR_Knob_07
					GTR_Knob_08
					GTR_Knob_09
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR84_Whammy
					GTR75_bridgeBMM
					GTR76_bridgeMM
					GTR86_Bridge
					GTR75_bridgeMM
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					GTR_Misc_Switch4
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = GTR101_Hero_Ana
		frontend_desc = qs(0xdd750393)
		mesh = `models/CAR_Instruments/Guitar/Heroes/GTR101_Hero_Ana`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Heroes/GTR101_Hero_Ana_D`
				material = GTR101_Hero_Ana_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR101_Hero_Ana
					}
					{
						$preset_layer_fades
						mask = $GTR101_Hero_Ana_fades
					}
					{
						$preset_layer_details
						mask = $GTR101_Hero_Ana_Details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						y_trans = -18
						x_scale = 17
						y_scale = 27
						x_trans = -39
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_22Fret_Hero01
					CAG_22Fret_Hero02
					CAG_22Fret_Hero03
					CAG_22Fret_Hero04
					CAG_24Fret_Hero01
					CAG_24Fret_Hero02
					CAG_24Fret_Hero03
					CAG_24Fret_Hero04
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR101_Neckhead
					GTR102_headstock
					GTR103_neckhead
					GTR104_neckhead
				]
			}
			{
				part = CAS_Guitar_Pickguards
				valid = [
					GTR_X_Anarc_PickG01
					GTR_X_Anarc_PickG02
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR_EMG_pickup1
					GTR_EMG_pickup2
					GTR_EMG_pickup5
					GTR_EMG_pickup4
					GTR_EMG_pickup3
					GTR_EMG_pickup6
					GTR_pickup_SD01
					GTR_pickup_SD05
					GTR_pickup_SD05B
					GTR_pickup_SD06
					GTR_pickup_SD06B
					GTR_Pickup_Type2_PAF1
					GTR_Pickup_Type2_PAF2
					GTR_pickup_SD03
					GTR_pickup_SD04
					GTR_EMG_pickup9
					GTR_EMG_pickup10
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					GTR_Knob_01
					GTR_Knob_02
					GTR_Knob_03
					GTR_Knob_04
					GTR_Knob_05
					GTR_Knob_06
					GTR_Knob_07
					GTR_Knob_08
					GTR_Knob_09
					GTR_Knob_10
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR101_bridge
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					None
				]
			}
		]
		$car_rocker_guitars_factoredGlobal_1
	}
	{
		desc_id = GTR102_Hero_Axe
		frontend_desc = qs(0xe1122dfb)
		mesh = `models/CAR_Instruments/Guitar/Heroes/GTR102_Hero_Axe`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Heroes/gtr102_hero_axe_d`
				material = GTR102_Hero_Axe_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR102_Hero_Axe
					}
					{
						$preset_layer_fades
						mask = $GTR102_Hero_Axe_fades
					}
					{
						$preset_layer_details
						mask = $GTR102_Hero_Axe_Details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						y_trans = -31
						x_scale = 21
						y_scale = 30
						x_trans = -14
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_22Fret_Hero01
					CAG_22Fret_Hero02
					CAG_22Fret_Hero03
					CAG_22Fret_Hero04
					CAG_24Fret_Hero01
					CAG_24Fret_Hero02
					CAG_24Fret_Hero03
					CAG_24Fret_Hero04
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR102_headstock
					GTR101_Neckhead
					GTR103_neckhead
					GTR104_neckhead
				]
			}
			{
				part = CAS_Guitar_Pickguards
				valid = [
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR_EMG_pickup1
					GTR_EMG_pickup2
					GTR_EMG_pickup5
					GTR_EMG_pickup4
					GTR_EMG_pickup3
					GTR_EMG_pickup6
					GTR_pickup_SD01
					GTR_pickup_SD05
					GTR_pickup_SD05B
					GTR_pickup_SD06
					GTR_pickup_SD06B
					GTR_Pickup_Type2_PAF1
					GTR_Pickup_Type2_PAF2
					GTR_pickup_SD03
					GTR_pickup_SD04
					GTR_EMG_pickup9
					GTR_EMG_pickup10
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					GTR_Knob_01
					GTR_Knob_02
					GTR_Knob_03
					GTR_Knob_04
					GTR_Knob_05
					GTR_Knob_06
					GTR_Knob_07
					GTR_Knob_08
					GTR_Knob_09
					GTR_Knob_10
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR_Bridge_01
					GTR75_bridge
					GTR75_bridgeb
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					None
				]
			}
		]
		$car_rocker_guitars_factoredGlobal_1
	}
	{
		desc_id = GTR103_Hero_manta
		frontend_desc = qs(0x45bfb148)
		mesh = `models/CAR_Instruments/Guitar/Heroes/GTR103_Hero_manta`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Heroes/gtr_body_style20_d_01`
				material = GTR103_Hero_manta_Primary
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_22Fret_Hero01
					CAG_22Fret_Hero02
					CAG_22Fret_Hero03
					CAG_22Fret_Hero04
					CAG_24Fret_Hero01
					CAG_24Fret_Hero02
					CAG_24Fret_Hero03
					CAG_24Fret_Hero04
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR103_neckhead
					GTR101_Neckhead
					GTR102_headstock
					GTR104_neckhead
				]
			}
			{
				part = CAS_Guitar_Pickguards
				valid = [
					GTR_Body20_PickG01
					GTR_Body20_PickG02
					GTR_Body20_PickG03
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR_EMG_pickup1
					GTR_EMG_pickup2
					GTR_EMG_pickup5
					GTR_EMG_pickup4
					GTR_EMG_pickup3
					GTR_EMG_pickup6
					GTR_pickup_SD01
					GTR_pickup_SD05
					GTR_pickup_SD05B
					GTR_pickup_SD06
					GTR_pickup_SD06B
					GTR_Pickup_Type2_PAF1
					GTR_Pickup_Type2_PAF2
					GTR_pickup_SD03
					GTR_pickup_SD04
					GTR_EMG_pickup9
					GTR_EMG_pickup10
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					GTR_Knob_01
					GTR_Knob_02
					GTR_Knob_03
					GTR_Knob_04
					GTR_Knob_05
					GTR_Knob_06
					GTR_Knob_07
					GTR_Knob_08
					GTR_Knob_09
					GTR_Knob_10
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR_Bridge_01
					GTR75_bridge
					GTR75_bridgeb
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					None
				]
			}
		]
		$car_rocker_guitars_factoredGlobal_1
	}
	{
		desc_id = GTR105_Skull
		frontend_desc = qs(0xa40aefbe)
		mesh = `models/CAR_Instruments/Guitar/Heroes/GTR105_Skull`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/bass/Heroes/bass104_skull_d`
				material = GTR105_Skull_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR105_Skull
					}
					{
						$preset_layer_fades
						mask = $GTR105_Skull_fades
					}
					{
						$preset_layer_details
						mask = $GTR105_Skull_Details
					}
				]
				user_layer_settings = {
					diffuse
					initial_values = {
						x_trans = -32
						y_trans = 18
						x_scale = 21
						y_scale = 15
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_22Fret_Hero01
					CAG_22Fret_Hero02
					CAG_22Fret_Hero03
					CAG_22Fret_Hero04
					CAG_24Fret_Hero01
					CAG_24Fret_Hero02
					CAG_24Fret_Hero03
					CAG_24Fret_Hero04
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR104_neckhead
					GTR103_neckhead
					GTR101_Neckhead
					GTR102_headstock
				]
			}
			{
				part = CAS_Guitar_Pickguards
				valid = [
					GTR_X_Skull_PickG01
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR_EMG_pickup1
					GTR_EMG_pickup2
					GTR_EMG_pickup5
					GTR_EMG_pickup4
					GTR_EMG_pickup3
					GTR_EMG_pickup6
					GTR_pickup_SD01
					GTR_pickup_SD05
					GTR_pickup_SD05B
					GTR_pickup_SD06
					GTR_pickup_SD06B
					GTR_Pickup_Type2_PAF1
					GTR_Pickup_Type2_PAF2
					GTR_pickup_SD03
					GTR_pickup_SD04
					GTR_EMG_pickup9
					GTR_EMG_pickup10
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					GTR_Knob_01
					GTR_Knob_02
					GTR_Knob_03
					GTR_Knob_04
					GTR_Knob_05
					GTR_Knob_06
					GTR_Knob_07
					GTR_Knob_08
					GTR_Knob_09
					GTR_Knob_10
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR_Bridge_01
					GTR75_bridge
					GTR75_bridgeb
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					None
				]
			}
		]
		$car_rocker_guitars_factoredGlobal_1
	}
	{
		desc_id = GTR104_spider
		frontend_desc = qs(0x32fb503d)
		mesh = `models/CAR_Instruments/Guitar/Heroes/GTR104_spider`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Heroes/gtr104_spider_d`
				material = GTR104_spider_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR104_spider
					}
					{
						$preset_layer_fades
						mask = $GTR104_spider_fades
					}
					{
						$preset_layer_details
						mask = $GTR104_spider_Details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						x_trans = -30
						y_trans = 1
						y_scale = 30
						x_scale = 19
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_22Fret_Hero01
					CAG_22Fret_Hero02
					CAG_22Fret_Hero03
					CAG_22Fret_Hero04
					CAG_24Fret_Hero01
					CAG_24Fret_Hero02
					CAG_24Fret_Hero03
					CAG_24Fret_Hero04
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR104_neckhead
					GTR103_neckhead
					GTR101_Neckhead
					GTR102_headstock
				]
			}
			{
				part = CAS_Guitar_Pickguards
				valid = [
					GTR_X_Spider_PickG01
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR_EMG_pickup1
					GTR_EMG_pickup2
					GTR_EMG_pickup5
					GTR_EMG_pickup4
					GTR_EMG_pickup3
					GTR_EMG_pickup6
					GTR_pickup_SD01
					GTR_pickup_SD05
					GTR_pickup_SD05B
					GTR_pickup_SD06
					GTR_pickup_SD06B
					GTR_Pickup_Type2_PAF1
					GTR_Pickup_Type2_PAF2
					GTR_pickup_SD03
					GTR_pickup_SD04
					GTR_EMG_pickup9
					GTR_EMG_pickup10
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					GTR_Knob_01
					GTR_Knob_02
					GTR_Knob_03
					GTR_Knob_04
					GTR_Knob_05
					GTR_Knob_06
					GTR_Knob_07
					GTR_Knob_08
					GTR_Knob_09
					GTR_Knob_10
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR_Bridge_01
					GTR75_bridge
					GTR75_bridgeb
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					None
				]
			}
		]
		$car_rocker_guitars_factoredGlobal_1
	}
	{
		desc_id = GTR27_NSFT_Acoustic
		frontend_desc = qs(0x6914711a)
		mesh = `models/CAR_Instruments/Guitar/Heroes/GTR27_NSFT_Acoustic`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Heroes/gtr27_NSFT_acoustic_d`
				material = GTR27_NSFT_Acoustic_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr27_NSFT_Acoustic_Finishes
					}
					{
						$preset_layer_fades
						mask = $gtr27_NSFT_Acoustic_Fades
					}
					{
						$preset_layer_details
						mask = $gtr27_NSFT_Acoustic_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_36
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_22Fret_Hero01
					CAG_22Fret_Hero02
					CAG_22Fret_Hero03
					CAG_22Fret_Hero04
					CAG_24Fret_Hero01
					CAG_24Fret_Hero02
					CAG_24Fret_Hero03
					CAG_24Fret_Hero04
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR27_Neckhead_Acoustic
				]
			}
			{
				part = CAS_Guitar_Pickguards
				valid = [
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR26_Dummy
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					None
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR27_Bridge_Acoustic
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					None
				]
			}
		]
		$car_rocker_guitars_factoredGlobal_1
	}
	{
		desc_id = GTR120_KBRD_LP
		frontend_desc = qs(0xf3d9a9a9)
		mesh = `models/CAR_Instruments/Guitar/Heroes/GTR120_KBRD_LP`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Heroes/gtr120_kbrd01_d`
				material = GTR120_KBRD_LP_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr120_NSFT_KeyLute_Finishes
					}
					{
						$preset_layer_details
						mask = $gtr120_NSFT_KeyLute_Details
					}
				]
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Neck
				valid = [
					GTR120_Fretboard
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR120_NHead01
				]
			}
			{
				part = CAS_Guitar_Pickguards
				valid = [
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					None
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					GTR120_Knob01
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					None
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					None
				]
			}
		]
		has_node_array
		locked
		no_strings
	}
	{
		desc_id = GTR78_PRS_SC
		frontend_desc = qs(0xaacb9118)
		sponsor_id = PRS
		mesh = `models/CAR_Instruments/Guitar/PRS/GTR78_PRS_SC`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/PRS/GTR78_PRS_SC_d`
				material = GTR78_PRS_SC_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR78_PRS_SC
					}
					{
						$preset_layer_fades
						mask = $GTR78_PRS_SC_fades
					}
					{
						$preset_layer_details
						mask = $GTR78_PRS_SC_Details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						x_trans = -36
						y_trans = 5
						y_scale = 30
						x_scale = 23
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_22Fret_PRS01
					CAG_22Fret_PRS02
					CAG_22Fret_PRS03
					CAG_22Fret_PRS04
					CAG_24Fret_PRS01
					CAG_24Fret_PRS02
					CAG_24Fret_PRS03
					CAG_24Fret_PRS04
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR78_Neckhead_01
					GTR80_Neckhead_01
				]
			}
			{
				part = CAS_Guitar_Pickguards
				valid = [
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR_Pickup_Type2_PRS
					GTR_pickup_PRS001b
					GTR_pickup_PRS001
					GTR_Pickup_Type2_PAF2
					GTR_EMG_pickup1
					GTR_EMG_pickup2
					GTR_EMG_pickup4
					GTR_EMG_pickup6
					PRS_Pickup_Hbucker
					GTR_pickup_SD01
					GTR_pickup_SD05
					GTR_pickup_SD05B
					GTR_pickup_SD06
					GTR_pickup_SD06B
					GTR_pickup_SD03
					GTR_EMG_pickup3
					GTR_pickup_SD04
					GTR_EMG_pickup9
					GTR_EMG_pickup10
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					PRS_Knob_Lampshade_4
					GTR_Knob_Tophat_3
					GTR_Knob_Tophat_W_3
					GTR_Knob_02
					GTR_Knob_03
					GTR_Knob_04
					GTR_Knob_05
					GTR_Knob_06
					GTR_Knob_07
					GTR_Knob_08
					GTR_Knob_09
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR81_Bridge01
					GTR79_Whammy
					GTR78_Bridge01
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					GTR_Misc_Switch4
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = GTR79_PRS_CSTM24
		frontend_desc = qs(0x5fcde089)
		sponsor_id = PRS
		mesh = `models/CAR_Instruments/Guitar/PRS/GTR79_PRS_CSTM24`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/PRS/prs_ctm24_d`
				material = GTR79_PRS_CST24_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR79_PRS_CS24_finishes
					}
					{
						$preset_layer_fades
						mask = $GTR79_PRS_CS24_fades
					}
					{
						$preset_layer_details
						mask = $GTR79_PRS_CS24_Details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						x_trans = -38
						x_scale = 20
						y_scale = 30
						y_trans = 5
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_22Fret_PRS01
					CAG_22Fret_PRS02
					CAG_22Fret_PRS03
					CAG_22Fret_PRS04
					CAG_24Fret_PRS01
					CAG_24Fret_PRS02
					CAG_24Fret_PRS03
					CAG_24Fret_PRS04
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR79_Neckhead_01
					GTR80_Neckhead_01
				]
			}
			{
				part = CAS_Guitar_Pickguards
				valid = [
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR_pickup_PRS001b
					GTR_pickup_PRS001
					GTR_Pickup_Type2_PRS
					GTR_Pickup_Type2_PAF2
					GTR_EMG_pickup1
					GTR_EMG_pickup2
					GTR_EMG_pickup3
					GTR_EMG_pickup4
					GTR_EMG_pickup6
					PRS_Pickup_Hbucker
					GTR_pickup_SD01
					GTR_pickup_SD05
					GTR_pickup_SD05B
					GTR_pickup_SD06
					GTR_pickup_SD06B
					GTR_pickup_SD03
					GTR_pickup_SD04
					GTR_EMG_pickup9
					GTR_EMG_pickup10
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					PRS_Knob_Lampshade
					GTR_Knob_Tophat_2
					GTR_Knob_Tophat_W_2
					GTR_Knob_02
					GTR_Knob_03
					GTR_Knob_04
					GTR_Knob_05
					GTR_Knob_06
					GTR_Knob_07
					GTR_Knob_08
					GTR_Knob_09
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR79_Whammy
					GTR81_Bridge01
					GTR78_Bridge01
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					GTR_Misc_Switch4
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = GTR80_PRS_SANT
		frontend_desc = qs(0x4be6aea2)
		sponsor_id = PRS
		mesh = `models/CAR_Instruments/Guitar/PRS/GTR80_PRS_SANT`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/PRS/prs_80_snt_d`
				material = GTR80_PRS_SNT_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR80_PRS_SNT_finishes
					}
					{
						$preset_layer_fades
						mask = $GTR80_PRS_SNT_fades
					}
					{
						$preset_layer_details
						mask = $GTR80_PRS_SNT_Details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						x_trans = -38
						x_scale = 21
						y_scale = 30
						y_trans = 6
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_22Fret_PRS01
					CAG_22Fret_PRS02
					CAG_22Fret_PRS03
					CAG_22Fret_PRS04
					CAG_24Fret_PRS01
					CAG_24Fret_PRS02
					CAG_24Fret_PRS03
					CAG_24Fret_PRS04
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR80_Neckhead_01
					GTR79_Neckhead_01
				]
			}
			{
				part = CAS_Guitar_Pickguards
				valid = [
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR_Pickup_Type2_PRS
					GTR_pickup_PRS001b
					GTR_pickup_PRS001
					GTR_Pickup_Type2_PAF2
					GTR_EMG_pickup1
					GTR_EMG_pickup2
					GTR_EMG_pickup3
					GTR_EMG_pickup4
					GTR_EMG_pickup6
					PRS_Pickup_Hbucker
					GTR_pickup_SD01
					GTR_pickup_SD05
					GTR_pickup_SD05B
					GTR_pickup_SD06
					GTR_pickup_SD06B
					GTR_pickup_SD03
					GTR_pickup_SD04
					GTR_EMG_pickup9
					GTR_EMG_pickup10
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					PRS_Knob_Lampshade
					GTR_Knob_Tophat_2
					GTR_Knob_Tophat_W_2
					GTR_Knob_02
					GTR_Knob_03
					GTR_Knob_04
					GTR_Knob_05
					GTR_Knob_06
					GTR_Knob_07
					GTR_Knob_08
					GTR_Knob_09
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR79_Whammy
					GTR81_Bridge01
					GTR78_Bridge01
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					Double_Switches
				]
			}
		]
		$car_rocker_guitars_factoredGlobal_1
	}
	{
		desc_id = GTR81_PRS_MiraMT
		frontend_desc = qs(0x7a61ace7)
		sponsor_id = PRS
		mesh = `models/CAR_Instruments/Guitar/PRS/GTR81_PRS_MiraMT`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/PRS/prs_81_mt_d`
				material = GTR81_PRS_MT_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR_81_mt_finishes
					}
					{
						$preset_layer_fades
						mask = $GTR_81_mt_fades
					}
					{
						$preset_layer_details
						mask = $GTR_81_mt_Details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						x_trans = -36
						x_scale = 21
						y_scale = 30
						y_trans = 8
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_22Fret_PRS01
					CAG_22Fret_PRS02
					CAG_22Fret_PRS03
					CAG_22Fret_PRS04
					CAG_24Fret_PRS01
					CAG_24Fret_PRS02
					CAG_24Fret_PRS03
					CAG_24Fret_PRS04
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR81_Neckhead01
					GTR80_Neckhead_01
				]
			}
			{
				part = CAS_Guitar_Pickguards
				valid = [
					GTR81_PGuard
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR_pickup_PRS001b
					GTR_pickup_PRS001
					GTR_Pickup_Type2_PRS
					GTR_Pickup_Type2_PAF2
					GTR_EMG_pickup1
					GTR_EMG_pickup2
					GTR_EMG_pickup3
					GTR_EMG_pickup4
					GTR_EMG_pickup6
					PRS_Pickup_Hbucker
					GTR_pickup_SD01
					GTR_pickup_SD05
					GTR_pickup_SD05B
					GTR_pickup_SD06
					GTR_pickup_SD06B
					GTR_pickup_SD03
					GTR_pickup_SD04
					GTR_EMG_pickup9
					GTR_EMG_pickup10
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					PRS_Knob_Lampshade
					GTR_Knob_Tophat_2
					GTR_Knob_Tophat_W_2
					GTR_Knob_02
					GTR_Knob_03
					GTR_Knob_04
					GTR_Knob_05
					GTR_Knob_06
					GTR_Knob_07
					GTR_Knob_08
					GTR_Knob_09
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR81_Bridge01
					GTR78_Bridge01
					GTR79_Whammy
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					GTR_Misc_Switch4
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = GTR82_PRS_SE1
		frontend_desc = qs(0x0e624dd2)
		sponsor_id = PRS
		mesh = `models/CAR_Instruments/Guitar/PRS/GTR82_PRS_SE1`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/PRS/prs_82_prs_se1`
				material = GTR82_PRS_SE1_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR82_PRS_SE1
					}
					{
						$preset_layer_fades
						mask = $GTR82_PRS_SE1_fades
					}
					{
						$preset_layer_details
						mask = $GTR82_PRS_SE1_Details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						x_trans = -36
						y_trans = 3
						y_scale = 30
						x_scale = 22
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_22Fret_PRS01
					CAG_22Fret_PRS02
					CAG_22Fret_PRS03
					CAG_22Fret_PRS04
					CAG_24Fret_PRS01
					CAG_24Fret_PRS02
					CAG_24Fret_PRS03
					CAG_24Fret_PRS04
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR82_Neckhead01
					GTR80_Neckhead_01
				]
			}
			{
				part = CAS_Guitar_Pickguards
				valid = [
					GTR82_PGuard
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR_pickup_soapbar
					GTR_pickup_PRS001
					GTR_EMG_pickup3
					GTR_Pickup_Type2_PAF2
					PRS_Pickup_Hbucker
					GTR_Pickup_Type2_PRS
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					GTR_Knob_Tophat
					GTR_Knob_Tophat_W
					PRS_Knob_Lampshade_1
					GTR_Knob_02c
					GTR_Knob_03c
					GTR_Knob_04c
					GTR_Knob_05c
					GTR_Knob_06b
					GTR_Knob_07c
					GTR_Knob_08c
					GTR_Knob_09c
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR81_Bridge01
					GTR78_Bridge01
					GTR79_Whammy
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = GTR83_PRS_STLA
		frontend_desc = qs(0x1ae57f5b)
		sponsor_id = PRS
		mesh = `models/CAR_Instruments/Guitar/PRS/GTR83_PRS_STLA`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/PRS/gtr83_prs_starla`
				material = GTR83_PRS_Starla_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR82_PRS_SE1
					}
					{
						$preset_layer_fades
						mask = $GTR82_PRS_SE1_fades
					}
					{
						$preset_layer_details
						mask = $GTR82_PRS_SE1_Details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						x_trans = -31
						y_trans = 26
						y_scale = 30
						x_scale = 23
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_22Fret_PRS01
					CAG_22Fret_PRS02
					CAG_22Fret_PRS03
					CAG_22Fret_PRS04
					CAG_24Fret_PRS01
					CAG_24Fret_PRS02
					CAG_24Fret_PRS03
					CAG_24Fret_PRS04
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR83_Neckhead01
					GTR80_Neckhead_01
				]
			}
			{
				part = CAS_Guitar_Pickguards
				valid = [
					GTR83_PGuard
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					PRS_Pickup_Hbucker
					GTR_pickup_PRS001b
					GTR_pickup_PRS001
					GTR_EMG_pickup1
					GTR_EMG_pickup2
					GTR_EMG_pickup4
					GTR_EMG_pickup5
					GTR_EMG_pickup6
					GTR_pickup_SD01
					GTR_pickup_SD05
					GTR_pickup_SD05B
					GTR_pickup_SD06
					GTR_pickup_SD06B
					GTR_pickup_SD03
					GTR_pickup_SD04
					GTR_Pickup_Type2_PAF2
					GTR_Pickup_Type2_PRS
					GTR_EMG_pickup9
					GTR_EMG_pickup10
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					PRS_Knob_Lampshade
					GTR_Knob_Tophat_2
					GTR_Knob_Tophat_W_2
					GTR_Knob_01
					GTR_Knob_02
					GTR_Knob_03
					GTR_Knob_04
					GTR_Knob_05
					GTR_Knob_06
					GTR_Knob_07
					GTR_Knob_08
					GTR_Knob_09
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR70_Bridge
					GTR79_Whammy
					GTR81_Bridge01
					GTR78_Bridge01
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					None
				]
			}
		]
		$car_rocker_guitars_factoredGlobal_1
	}
	{
		desc_id = GTR71_SCH_C1
		frontend_desc = qs(0x37e640f4)
		sponsor_id = Schecter
		mesh = `models/CAR_Instruments/Guitar/Schecter/GTR71_SCH_C1`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Schecter/gtr71_sch_c1_d`
				material = GTR71_SCH_C1_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR71_SCH_C1
					}
					{
						$preset_layer_fades
						mask = $GTR71_SCH_C1_fades
					}
					{
						$preset_layer_details
						mask = $GTR71_SCH_C1_Details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						y_trans = 27
						x_scale = 23
						y_scale = 30
						x_trans = -34
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_22Fret_Schecter01
					CAG_22Fret_Schecter02
					CAG_22Fret_Schecter03
					CAG_22Fret_Schecter04
					CAG_24Fret_Schecter01
					CAG_24Fret_Schecter02
					CAG_24Fret_Schecter03
					CAG_24Fret_Schecter04
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR71_Neckhead_01
					GTR71_Neckhead_02
					GTR71_Neckhead_03
					GTR71_Neckhead_04
				]
			}
			{
				part = CAS_Guitar_Pickguards
				valid = [
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR70_SCH_Ultra_pickup
					GTR70_SCH_Ultra_pickup3
					GTR_EMG_pickup1
					GTR_EMG_pickup2
					GTR_EMG_pickup5
					GTR_EMG_pickup4
					GTR_EMG_pickup3
					GTR_EMG_pickup6
					GTR_pickup_SD01
					GTR_pickup_SD05
					GTR_pickup_SD05B
					GTR_pickup_SD06
					GTR_pickup_SD06B
					GTR_Pickup_Type2_PAF1
					GTR_Pickup_Type2_PAF2
					GTR_pickup_SD03
					GTR_pickup_SD04
					GTR_EMG_pickup9
					GTR_EMG_pickup10
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					GTR_Knob_01
					GTR_Knob_02
					GTR_Knob_03
					GTR_Knob_04
					GTR_Knob_05
					GTR_Knob_06
					GTR_Knob_07
					GTR_Knob_08
					GTR_Knob_09
					GTR_Knob_10
					GTR_Knob_01c
					GTR_Knob_02c
					GTR_Knob_03c
					GTR_Knob_04c
					GTR_Knob_05c
					GTR_Knob_06c
					GTR_Knob_07c
					GTR_Knob_08c
					GTR_Knob_09c
					GTR_Knob_10c
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR71_Bridge
					GTR74_Bridge1
					GTR70_Bridge
					GTR_Bridge_01
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					GTR_Misc_Switch4
					GTR71_Switch
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = GTR72_SCH_Devil
		frontend_desc = qs(0x4c989982)
		sponsor_id = Schecter
		mesh = `models/CAR_Instruments/Guitar/Schecter/GTR72_SCH_Devil`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Schecter/gtr72_sch_devil_d`
				material = GTR72_SCH_Devil_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR72_SCH_Devil
					}
					{
						$preset_layer_fades
						mask = $GTR72_SCH_Devil_fades
					}
					{
						$preset_layer_details
						mask = $GTR72_SCH_Devil_Details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						x_trans = -33
						x_scale = 23
						y_scale = 30
						y_trans = 28
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_22Fret_Schecter01
					CAG_22Fret_Schecter02
					CAG_22Fret_Schecter03
					CAG_22Fret_Schecter04
					CAG_24Fret_Schecter01
					CAG_24Fret_Schecter02
					CAG_24Fret_Schecter03
					CAG_24Fret_Schecter04
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR72_Neckhead_01
					gtr72_neckhead_02
					gtr72_neckhead_03
					gtr72_neckhead_04
				]
			}
			{
				part = CAS_Guitar_Pickguards
				valid = [
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR70_SCH_Ultra_pickup
					GTR70_SCH_Ultra_pickup2
					GTR_EMG_pickup1
					GTR_EMG_pickup2
					GTR_EMG_pickup5
					GTR_pickup_SD05B
					GTR_EMG_pickup4
					GTR_EMG_pickup3
					GTR_EMG_pickup6
					GTR_pickup_SD01
					GTR_pickup_SD05
					GTR_pickup_SD06
					GTR_pickup_SD06B
					GTR_Pickup_Type2_PAF1
					GTR_Pickup_Type2_PAF2
					GTR_pickup_SD03
					GTR_pickup_SD04
					GTR_EMG_pickup9
					GTR_EMG_pickup10
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					GTR_Knob_01
					GTR_Knob_02
					GTR_Knob_03b
					GTR_Knob_04b
					GTR_Knob_05b
					GTR_Knob_06b
					GTR_Knob_07
					GTR_Knob_08b
					GTR_Knob_09
					GTR_Knob_10
					GTR_Knob_01c
					GTR_Knob_02c
					GTR_Knob_03c
					GTR_Knob_04c
					GTR_Knob_05c
					GTR_Knob_06c
					GTR_Knob_07c
					GTR_Knob_08c
					GTR_Knob_09c
					GTR_Knob_10c
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR72_Bridge
					GTR74_Bridge1
					GTR70_Bridge
					GTR_Bridge_01
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					GTR_Misc_Switch4
					None
				]
			}
		]
		$car_rocker_guitars_factoredGlobal_1
	}
	{
		desc_id = GTR73_SCH_S1
		frontend_desc = qs(0x3430426f)
		sponsor_id = Schecter
		mesh = `models/CAR_Instruments/Guitar/Schecter/GTR73_SCH_S1`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Schecter/GTR73_SCH_S1_d`
				material = GTR73_SCH_S1_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR73_SCH_S1
					}
					{
						$preset_layer_fades
						mask = $GTR73_SCH_S1_fades
					}
					{
						$preset_layer_details
						mask = $GTR73_SCH_S1_Details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						x_trans = -29
						x_scale = 23
						y_scale = 30
						y_trans = 29
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_22Fret_Schecter01
					CAG_22Fret_Schecter02
					CAG_22Fret_Schecter03
					CAG_22Fret_Schecter04
					CAG_24Fret_Schecter01
					CAG_24Fret_Schecter02
					CAG_24Fret_Schecter03
					CAG_24Fret_Schecter04
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR73_Neckhead_01
					GTR73_Neckhead_02
					gtr73_neckhead_03
					gtr73_neckhead_04
					GTR73_Neckhead_05
				]
			}
			{
				part = CAS_Guitar_Pickguards
				valid = [
					GTR73_PG1
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR70_SCH_Ultra_pickup
					GTR_EMG_pickup1
					GTR_EMG_pickup2
					GTR_EMG_pickup5
					GTR_pickup_SD05B
					GTR_EMG_pickup4
					GTR_EMG_pickup3
					GTR_EMG_pickup6
					GTR_pickup_SD01
					GTR_pickup_SD05
					GTR_pickup_SD06B
					GTR_Pickup_Type2_PAF1
					GTR_Pickup_Type2_PAF2
					GTR_pickup_SD03
					GTR_pickup_SD04
					GTR_EMG_pickup9
					GTR_EMG_pickup10
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					GTR_Knob_01c
					GTR_Knob_02c
					GTR_Knob_03c
					GTR_Knob_04c
					GTR_Knob_05c
					GTR_Knob_06c
					GTR_Knob_07c
					GTR_Knob_08c
					GTR_Knob_09c
					GTR_Knob_10c
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR72_Bridge
					GTR74_Bridge1b
					GTR70_Bridge
					GTR_Bridge_01
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					GTR_Misc_Switch4
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = GTR74_SCH_Star
		frontend_desc = qs(0xa1a6df33)
		sponsor_id = Schecter
		mesh = `models/CAR_Instruments/Guitar/Schecter/GTR74_SCH_Star`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Schecter/gtr74_sch_star_d`
				material = GTR74_SCH_Star_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR74_SCH_Star
					}
					{
						$preset_layer_fades
						mask = $GTR74_SCH_Star_fades
					}
					{
						$preset_layer_details
						mask = $GTR74_SCH_Star_Details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						y_trans = 26
						x_scale = 23
						y_scale = 30
						x_trans = -35
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_22Fret_Schecter01
					CAG_22Fret_Schecter02
					CAG_22Fret_Schecter03
					CAG_22Fret_Schecter04
					CAG_24Fret_Schecter01
					CAG_24Fret_Schecter02
					CAG_24Fret_Schecter03
					CAG_24Fret_Schecter04
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR74_Neckhead_01
					GTR74_Neckhead_02
					GTR74_Neckhead_03
					GTR74_Neckhead_04
				]
			}
			{
				part = CAS_Guitar_Pickguards
				valid = [
					GTR74_PG1
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR70_SCH_Ultra_pickup
					GTR_EMG_pickup1
					GTR_EMG_pickup2
					GTR_EMG_pickup5
					GTR_EMG_pickup4
					GTR_EMG_pickup3
					GTR_EMG_pickup6
					GTR_pickup_SD01
					GTR_pickup_SD05
					GTR_pickup_SD05B
					GTR_pickup_SD06
					GTR_pickup_SD06B
					GTR_Pickup_Type2_PAF1
					GTR_Pickup_Type2_PAF2
					GTR_pickup_SD03
					GTR_pickup_SD04
					GTR_EMG_pickup9
					GTR_EMG_pickup10
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					GTR_Knob_01
					GTR_Knob_02
					GTR_Knob_03
					GTR_Knob_04
					GTR_Knob_05
					GTR_Knob_06
					GTR_Knob_07
					GTR_Knob_08
					GTR_Knob_09
					GTR_Knob_10
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR72_Bridge
					GTR74_Bridge1
					GTR70_Bridge
					GTR_Bridge_01
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					GTR_Misc_Switch4
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = gtr1_sch_tempest
		frontend_desc = qs(0xbcbe7e5d)
		sponsor_id = Schecter
		mesh = `models/CAR_Instruments/Guitar/Schecter/gtr1_sch_tempest`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Schecter/gtr1_sch_tempest_body_d`
				material = gtr1_sch_tempest_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr1_sch_tempest
					}
					{
						$preset_layer_fades
						mask = $gtr1_sch_tempest_fades
					}
					{
						$preset_layer_details
						mask = $gtr1_sch_tempest_Details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						x_trans = -32
						x_scale = 23
						y_scale = 30
						y_trans = 26
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_22Fret_Schecter01
					CAG_22Fret_Schecter02
					CAG_22Fret_Schecter03
					CAG_22Fret_Schecter04
					CAG_24Fret_Schecter01
					CAG_24Fret_Schecter02
					CAG_24Fret_Schecter03
					CAG_24Fret_Schecter04
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR1_Sch_Neckhead_1
					GTR1_Sch_Neckhead_2
					GTR1_Sch_Neckhead_3
					GTR1_Sch_Neckhead_4
				]
			}
			{
				part = CAS_Guitar_Pickguards
				valid = [
					GTR1_Sch_Pickguard_01
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR70_SCH_Ultra_pickup
					GTR70_SCH_Ultra_pickup2
					GTR_EMG_pickup1
					GTR_EMG_pickup2
					GTR_EMG_pickup5
					GTR_EMG_pickup6
					GTR_EMG_pickup4
					GTR_EMG_pickup3
					GTR_pickup_SD05B
					GTR_pickup_SD05
					GTR_pickup_SD06
					GTR_pickup_SD06B
					GTR_Pickup_Type2_PAF1
					GTR_Pickup_Type2_PAF2
					GTR_pickup_SD03
					GTR_pickup_SD04
					GTR_EMG_pickup9
					GTR_EMG_pickup9
					GTR_EMG_pickup10
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					GTR_Knob_01
					GTR_Knob_02
					GTR_Knob_03
					GTR_Knob_04
					GTR_Knob_05
					GTR_Knob_06
					GTR_Knob_07
					GTR_Knob_08
					GTR_Knob_09
					GTR_Knob_10
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR70_Bridge
					GTR_Bridge_01
					GTR71_Bridge
					GTR74_Bridge1
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					GTR_Misc_Switch4
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = GTR70_SCH_Ultra
		frontend_desc = qs(0xe4c567a7)
		sponsor_id = Schecter
		mesh = `models/CAR_Instruments/Guitar/Schecter/GTR70_SCH_Ultra`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Schecter/GTR70_SCH_Ultra_d`
				material = GTR70_SCH_Ultra_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR70_SCH_Ultra
					}
					{
						$preset_layer_fades
						mask = $GTR70_SCH_Ultra_fades
					}
					{
						$preset_layer_details
						mask = $GTR70_SCH_Ultra_Details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						y_trans = 29
						x_scale = 23
						y_scale = 30
						x_trans = -35
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_22Fret_Schecter01
					CAG_22Fret_Schecter02
					CAG_22Fret_Schecter03
					CAG_22Fret_Schecter04
					CAG_24Fret_Schecter01
					CAG_24Fret_Schecter02
					CAG_24Fret_Schecter03
					CAG_24Fret_Schecter04
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR70_neckhead
					GTR70_neckhead_02b
					GTR70_neckhead_03
					GTR70_neckhead_04
				]
			}
			{
				part = CAS_Guitar_Pickguards
				valid = [
					GTR70_pg
					GTR70_pg2
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR70_SCH_Ultra_pickup
					GTR70_SCH_Ultra_pickup3
					GTR_EMG_pickup1
					GTR_EMG_pickup2
					GTR_EMG_pickup5
					GTR_pickup_SD05B
					GTR_EMG_pickup4
					GTR_EMG_pickup3
					GTR_EMG_pickup6
					GTR_pickup_SD01
					GTR_pickup_SD05
					GTR_pickup_SD06
					GTR_pickup_SD06B
					GTR_Pickup_Type2_PAF1
					GTR_Pickup_Type2_PAF2
					GTR_pickup_SD03
					GTR_pickup_SD04
					GTR_EMG_pickup9
					GTR_EMG_pickup10
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					GTR_Knob_01
					GTR_Knob_02
					GTR_Knob_03
					GTR_Knob_04
					GTR_Knob_05
					GTR_Knob_06
					GTR_Knob_07
					GTR_Knob_08
					GTR_Knob_09
					GTR_Knob_10
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR70_Bridge
					GTR_Bridge_01
					GTR71_Bridge
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					GTR_Misc_Switch4
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = GTR25_Manson_Bellamy
		frontend_desc = qs(0x448732da)
		mesh = `models/CAR_Instruments/Guitar/Manson/GTR25_Manson_Bellamy`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Manson/gtr25_manson_bellamy_d`
				material = GTR25_Manson_Bellamy_Primary
				$car_rocker_guitars_factoredGlobal_36
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_22Fret_Mcswain01
					CAG_22Fret_Mcswain02
					CAG_22Fret_Mcswain03
					CAG_22Fret_Mcswain04
					CAG_24Fret_mcswain01
					CAG_24Fret_mcswain02
					CAG_24Fret_mcswain03
					CAG_24Fret_mcswain04
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR25_Neckhead_Manson
				]
			}
			{
				part = CAS_Guitar_Pickguards
				valid = [
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR25_2pickups
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					GTR_Knob_Manson_01
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR_Brdg_Manson_1
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					GTR_Misc_Switch_M
					GTR_MiscKnob_Manson_02
					None
				]
			}
		]
		$car_rocker_guitars_factoredGlobal_24
	}
	{
		desc_id = GTR26_Cash_Acoustic
		frontend_desc = qs(0xa8096f32)
		mesh = `models/CAR_Instruments/Guitar/Cash/GTR26_Cash_Acoustic`
		pak_num = 0
		inclusion = [
			{
				part = CAS_Guitar_Neck
				valid = [
					GTR_Fretboard_04cash
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR26_Neckhead_Cash
				]
			}
			{
				part = CAS_Guitar_Pickguards
				valid = [
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR26_Dummy
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					None
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR26_Bridge_Cash
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					None
				]
			}
		]
		$car_rocker_guitars_factoredGlobal_24
	}
	{
		desc_id = GTR130_Taylor_SB
		frontend_desc = qs(0xe75afa53)
		mesh = `models/CAR_Instruments/Guitar/Taylor/GTR130_Taylor_SB`
		sponsor_id = Taylor
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Taylor/GTR130_Taylor_SB_d`
				material = GTR130_Taylor_SB_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR130_Taylor_SB
					}
					{
						$preset_layer_fades
						mask = $GTR130_Taylor_SB_fades
					}
					{
						$preset_layer_details
						mask = $GTR130_Taylor_SB_Details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						y_trans = 24
						x_scale = 23
						y_scale = 30
						x_trans = -32
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_22Fret_Taylor01
					CAG_22Fret_Taylor02
					CAG_22Fret_Taylor03
					CAG_22Fret_Taylor04
					CAG_24Fret_Taylor01
					CAG_24Fret_Taylor02
					CAG_24Fret_Taylor03
					CAG_24Fret_Taylor04
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR130_neckhead
				]
			}
			{
				part = CAS_Guitar_Pickguards
				valid = [
					GTR130_PG
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR_Taylor_pickup3
					GTR_Taylor_pickup1
					GTR_Taylor_pickup2
					GTR_EMG_pickup1
					GTR_EMG_pickup2
					GTR_EMG_pickup5
					GTR_pickup_SD05B
					GTR_EMG_pickup4
					GTR_EMG_pickup3
					GTR_EMG_pickup6
					GTR_pickup_SD01
					GTR_pickup_SD05
					GTR_pickup_SD06
					GTR_pickup_SD06B
					GTR_Pickup_Type2_PAF1
					GTR_Pickup_Type2_PAF2
					GTR_pickup_SD03
					GTR_pickup_SD04
					GTR_EMG_pickup9
					GTR_EMG_pickup10
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					GTR_Knob_13
					GTR_Knob_01
					GTR_Knob_02
					GTR_Knob_03
					GTR_Knob_04
					GTR_Knob_05
					GTR_Knob_06
					GTR_Knob_07
					GTR_Knob_08
					GTR_Knob_09
					GTR_Knob_10
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR130_Bridge
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					GTR71_Switch
					None
				]
			}
		]
		$car_rocker_guitars_factoredGlobal_1
	}
	{
		desc_id = GTR142_G6e_Body
		frontend_desc = qs(0x41d40fed)
		mesh = `models/CAR_Instruments/Guitar/Taylor/GTR142_G6e_Body`
		sponsor_id = Taylor
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Taylor/GTR142_G6e_Body`
				material = GTR142_G6e_Body_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR142_G6e
					}
					{
						$preset_layer_fades
						mask = $GTR142_G6e_fades
					}
					{
						$preset_layer_details
						mask = $GTR142_G6e_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_36
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_22Fret_Taylor04
					CAG_22Fret_Taylor01
					CAG_22Fret_Taylor02
					CAG_22Fret_Taylor03
					CAG_22Fret_Taylor04
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR142_neckhead
				]
			}
			{
				part = CAS_Guitar_Pickguards
				valid = [
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR26_Dummy
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					GTR142_Knob001
					None
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR142_G6e_Bridg
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					None
				]
			}
		]
		$car_rocker_guitars_factoredGlobal_1
	}
	{
		desc_id = GTR142_G6e_BodyT
		frontend_desc = qs(0x31b65a33)
		mesh = `models/CAR_Instruments/Guitar/Taylor/GTR142_G6e_BodyT`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Taylor/GTR142_G6e_Body`
				material = GTR142_G6e_Body_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR142_G6e
					}
					{
						$preset_layer_fades
						mask = $GTR142_G6e_fades
					}
					{
						$preset_layer_details
						mask = $GTR142_G6e_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_36
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Neck
				valid = [
					GTR_Fretboard_Taylor_T
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR142T_NeckHead
				]
			}
			{
				part = CAS_Guitar_Pickguards
				valid = [
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR26_Dummy
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					GTR142_Knob001
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR142_G6e_BridgT
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					None
				]
			}
		]
		$car_rocker_guitars_factoredGlobal_24
	}
	{
		desc_id = GTR142_G6e_Body02
		frontend_desc = qs(0xbd4e5b0a)
		mesh = `models/CAR_Instruments/Guitar/Taylor/GTR142_G6e_Body02`
		sponsor_id = Taylor
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Taylor/GTR142_G6e2_Body_D`
				material = GTR142_G6e_Body02_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR142_G6e
					}
					{
						$preset_layer_fades
						mask = $GTR142_G6e_fades
					}
					{
						$preset_layer_details
						mask = $GTR142_G6e_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_36
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_22Fret_Taylor01
					CAG_22Fret_Taylor02
					CAG_22Fret_Taylor03
					CAG_22Fret_Taylor04
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR142_neckhead
				]
			}
			{
				part = CAS_Guitar_Pickguards
				valid = [
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR26_Dummy
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					GTR142_Knob001
					None
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR142_G6e_Bridg
					GTR143_DDSM_Bridg
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					None
				]
			}
		]
		$car_rocker_guitars_factoredGlobal_1
	}
	{
		desc_id = GTR143_DDSM
		frontend_desc = qs(0xfe964f9a)
		mesh = `models/CAR_Instruments/Guitar/Taylor/GTR143_DDSM`
		sponsor_id = Taylor
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Taylor/gtr143_taylor_ddsm_d`
				material = GTR143_DDSM_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR143_DDSM
					}
					{
						$preset_layer_fades
						mask = $GTR143_DDSM_fades
					}
					{
						$preset_layer_details
						mask = $GTR143_DDSM_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_36
			}
		]
		inclusion = [
			{
				part = CAS_Guitar_Neck
				valid = [
					CAG_22Fret_Taylor01
					CAG_22Fret_Taylor04
				]
			}
			{
				part = CAS_Guitar_Head
				valid = [
					GTR142_neckhead
				]
			}
			{
				part = CAS_Guitar_Pickguards
				valid = [
					None
				]
			}
			{
				part = CAS_Guitar_Pickups
				valid = [
					GTR26_Dummy
				]
			}
			{
				part = CAS_Guitar_Knobs
				valid = [
					GTR142_Knob001
					None
				]
			}
			{
				part = CAS_Guitar_Bridges
				valid = [
					GTR143_DDSM_Bridg
					GTR142_G6e_Bridg
				]
			}
			{
				part = CAS_Guitar_Misc
				valid = [
					None
				]
			}
		]
		$car_rocker_guitars_factoredGlobal_1
	}
]
CAS_Guitar_Neck = [
	{
		desc_id = CAG_22Fret_ESP01
		frontend_desc = qs(0xa8ef14e2)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard_01`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d_01`
				material = GTR_Fretboard_01_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_22Fret_ESP
						$car_rocker_guitars_factoredGlobal_51
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d_01`
				material = GTR_Fretboard_01_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
						flags = 4
						Color = grey_4guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_22Fret_ESP02
		frontend_desc = qs(0x18203e43)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard_02`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d2_01`
				material = GTR_Fretboard_02_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_22Fret_ESP
						$car_rocker_guitars_factoredGlobal_52
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d2_01`
				material = GTR_Fretboard_02_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
						flags = 4
						Color = Black_1guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_22Fret_ESP03
		frontend_desc = qs(0x89ed86d5)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard_03`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d3_01`
				material = GTR_Fretboard_03_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_22Fret_ESP
						$car_rocker_guitars_factoredGlobal_51
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d3_01`
				material = GTR_Fretboard_03_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
						flags = 4
						Color = grey_4guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_22Fret_ESP04
		frontend_desc = qs(0x3b865ccc)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard_04`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
				material = GTR_Fretboard_04_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_22Fret_ESP
						$car_rocker_guitars_factoredGlobal_51
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
				material = GTR_Fretboard_04_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
						flags = 4
						Color = grey_4guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_22Fret_Hero01
		frontend_desc = qs(0xa8ef14e2)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard_01`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d_01`
				material = GTR_Fretboard_01_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_22Fret_Heroes
						$car_rocker_guitars_factoredGlobal_51
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d_01`
				material = GTR_Fretboard_01_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
						flags = 4
						Color = grey_4guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_22Fret_Hero02
		frontend_desc = qs(0x18203e43)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard_02`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d2_01`
				material = GTR_Fretboard_02_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_22Fret_Heroes
						$car_rocker_guitars_factoredGlobal_52
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d2_01`
				material = GTR_Fretboard_02_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
						flags = 4
						Color = Black_1guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_22Fret_Hero03
		frontend_desc = qs(0x89ed86d5)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard_03`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d3_01`
				material = GTR_Fretboard_03_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_22Fret_Heroes
						$car_rocker_guitars_factoredGlobal_51
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d3_01`
				material = GTR_Fretboard_03_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
						flags = 4
						Color = grey_4guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_22Fret_Hero04
		frontend_desc = qs(0x3b865ccc)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard_04`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
				material = GTR_Fretboard_04_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_22Fret_Heroes
						$car_rocker_guitars_factoredGlobal_51
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
				material = GTR_Fretboard_04_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
						flags = 4
						Color = grey_4guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = GTR120_Fretboard
		frontend_desc = qs(0x3fe36215)
		mesh = `models/CAR_Instruments/Guitar/Heroes/GTR120_Fretboard`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Heroes/gtr120_fbrd01`
				material = GTR120_Fretboard_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_22Fret_Heroes
						$car_rocker_guitars_factoredGlobal_52
					}
				]
			}
		]
	}
	{
		desc_id = CAG_22Fret_Daisy01
		frontend_desc = qs(0xa8ef14e2)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard_01`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d_01`
				material = GTR_Fretboard_01_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_22Fret_Daisy
						$car_rocker_guitars_factoredGlobal_51
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d_01`
				material = GTR_Fretboard_01_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
						flags = 4
						Color = grey_4guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_22Fret_Daisy02
		frontend_desc = qs(0x18203e43)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard_02`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d2_01`
				material = GTR_Fretboard_02_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_22Fret_Daisy
						$car_rocker_guitars_factoredGlobal_52
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d2_01`
				material = GTR_Fretboard_02_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
						flags = 4
						Color = Black_1guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_22Fret_Daisy03
		frontend_desc = qs(0x89ed86d5)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard_03`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d3_01`
				material = GTR_Fretboard_03_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_22Fret_Daisy
						$car_rocker_guitars_factoredGlobal_51
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d3_01`
				material = GTR_Fretboard_03_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
						flags = 4
						Color = grey_4guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_22Fret_Daisy04
		frontend_desc = qs(0x3b865ccc)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard_04`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
				material = GTR_Fretboard_04_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_22Fret_Daisy
						$car_rocker_guitars_factoredGlobal_51
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
				material = GTR_Fretboard_04_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
						flags = 4
						Color = grey_4guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = GTR_Fretboard_Taylor_T
		frontend_desc = qs(0x31b65a33)
		mesh = `models/CAR_Instruments/Guitar/Taylor/GTR_Fretboard_Taylor_T`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
				material = GTR_Fretboard_Taylor_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_22Fret_Taylor
						$car_rocker_guitars_factoredGlobal_51
					}
				]
			}
		]
	}
	{
		desc_id = CAG_22Fret_Taylor01
		frontend_desc = qs(0xa8ef14e2)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard_01`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d_01`
				material = GTR_Fretboard_01_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_22Fret_Taylor
						$car_rocker_guitars_factoredGlobal_51
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d_01`
				material = GTR_Fretboard_01_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
						flags = 4
						Color = grey_4guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_22Fret_Taylor02
		frontend_desc = qs(0x18203e43)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard_02`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d2_01`
				material = GTR_Fretboard_02_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_22Fret_Taylor
						$car_rocker_guitars_factoredGlobal_52
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d2_01`
				material = GTR_Fretboard_02_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
						flags = 4
						Color = Black_1guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_22Fret_Taylor03
		frontend_desc = qs(0x89ed86d5)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard_03`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d3_01`
				material = GTR_Fretboard_03_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_22Fret_Taylor
						$car_rocker_guitars_factoredGlobal_51
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d3_01`
				material = GTR_Fretboard_03_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
						flags = 4
						Color = grey_4guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_22Fret_Taylor04
		frontend_desc = qs(0x3b865ccc)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard_04`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
				material = GTR_Fretboard_04_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_22Fret_Taylor
						$car_rocker_guitars_factoredGlobal_51
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
				material = GTR_Fretboard_04_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
						flags = 4
						Color = grey_4guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_22Fret_PRS01
		frontend_desc = qs(0xa8ef14e2)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard_01`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d_01`
				material = GTR_Fretboard_01_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_22Fret_PRS
						$car_rocker_guitars_factoredGlobal_51
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d_01`
				material = GTR_Fretboard_01_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/PRS/22fret_LD114_PRS_DOTS`
						flags = 4
						Color = grey_4guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_22Fret_PRS02
		frontend_desc = qs(0x18203e43)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard_02`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d2_01`
				material = GTR_Fretboard_02_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_22Fret_PRS
						$car_rocker_guitars_factoredGlobal_52
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d2_01`
				material = GTR_Fretboard_02_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/PRS/22fret_LD114_PRS_DOTS`
						flags = 4
						Color = Black_1guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_22Fret_PRS03
		frontend_desc = qs(0x89ed86d5)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard_03`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d3_01`
				material = GTR_Fretboard_03_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_22Fret_PRS
						$car_rocker_guitars_factoredGlobal_51
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d3_01`
				material = GTR_Fretboard_03_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/PRS/22fret_LD114_PRS_DOTS`
						flags = 4
						Color = grey_4guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_22Fret_PRS04
		frontend_desc = qs(0x3b865ccc)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard_04`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
				material = GTR_Fretboard_04_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_22Fret_PRS
						$car_rocker_guitars_factoredGlobal_51
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
				material = GTR_Fretboard_04_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/PRS/22fret_LD114_PRS_DOTS`
						flags = 4
						Color = grey_4guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_22Fret_MM01
		frontend_desc = qs(0xa8ef14e2)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard_01`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d_01`
				material = GTR_Fretboard_01_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_22Fret_MM
						$car_rocker_guitars_factoredGlobal_51
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d_01`
				material = GTR_Fretboard_01_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
						flags = 4
						Color = grey_4guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_22Fret_MM02
		frontend_desc = qs(0x18203e43)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard_02`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d2_01`
				material = GTR_Fretboard_02_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_22Fret_MM
						$car_rocker_guitars_factoredGlobal_52
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d2_01`
				material = GTR_Fretboard_02_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
						flags = 4
						Color = Black_1guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_22Fret_MM03
		frontend_desc = qs(0x89ed86d5)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard_03`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d3_01`
				material = GTR_Fretboard_03_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_22Fret_MM
						$car_rocker_guitars_factoredGlobal_51
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d3_01`
				material = GTR_Fretboard_03_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
						flags = 4
						Color = grey_4guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_22Fret_MM04
		frontend_desc = qs(0x3b865ccc)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard_04`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
				material = GTR_Fretboard_04_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_22Fret_MM
						$car_rocker_guitars_factoredGlobal_51
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
				material = GTR_Fretboard_04_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
						flags = 4
						Color = grey_4guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_22Fret_Mcswain01
		frontend_desc = qs(0xa8ef14e2)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard_01`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d_01`
				material = GTR_Fretboard_01_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_22Fret_Mcswain
						$car_rocker_guitars_factoredGlobal_51
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d_01`
				material = GTR_Fretboard_01_Primary
				pre_layer = [
					{
						Color = grey_5
						texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
						flags = 36
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_22Fret_Mcswain02
		frontend_desc = qs(0x18203e43)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard_02`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d2_01`
				material = GTR_Fretboard_02_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_22Fret_Mcswain
						$car_rocker_guitars_factoredGlobal_52
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d2_01`
				material = GTR_Fretboard_02_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
						flags = 4
						Color = Black_1guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_22Fret_Mcswain03
		frontend_desc = qs(0x89ed86d5)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard_03`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d3_01`
				material = GTR_Fretboard_03_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_22Fret_Mcswain
						$car_rocker_guitars_factoredGlobal_51
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d3_01`
				material = GTR_Fretboard_03_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
						flags = 4
						Color = grey_5
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_22Fret_Mcswain04
		frontend_desc = qs(0x3b865ccc)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard_04`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
				material = GTR_Fretboard_04_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_22Fret_Mcswain
						$car_rocker_guitars_factoredGlobal_51
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
				material = GTR_Fretboard_04_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
						flags = 4
						Color = grey_5
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_22Fret_Schecter01
		frontend_desc = qs(0xa8ef14e2)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard_01`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d_01`
				material = GTR_Fretboard_01_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_22Fret_Schecter
						$car_rocker_guitars_factoredGlobal_51
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d_01`
				material = GTR_Fretboard_01_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
						flags = 4
						Color = grey_4guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_22Fret_Schecter02
		frontend_desc = qs(0x18203e43)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard_02`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d2_01`
				material = GTR_Fretboard_02_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_22Fret_Schecter
						$car_rocker_guitars_factoredGlobal_52
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d2_01`
				material = GTR_Fretboard_02_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
						flags = 4
						Color = Black_1guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_22Fret_Schecter03
		frontend_desc = qs(0x89ed86d5)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard_03`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d3_01`
				material = GTR_Fretboard_03_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_22Fret_Schecter
						$car_rocker_guitars_factoredGlobal_51
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d3_01`
				material = GTR_Fretboard_03_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
						flags = 4
						Color = grey_4guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_22Fret_Schecter04
		frontend_desc = qs(0x3b865ccc)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard_04`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
				material = GTR_Fretboard_04_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_22Fret_Schecter
						$car_rocker_guitars_factoredGlobal_51
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
				material = GTR_Fretboard_04_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
						flags = 4
						Color = grey_4guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_22Fret_BCRich01
		frontend_desc = qs(0xa8ef14e2)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard_01`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d_01`
				material = GTR_Fretboard_01_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_22Fret_BCRich
						$car_rocker_guitars_factoredGlobal_51
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d_01`
				material = GTR_Fretboard_01_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/22_fret_LD01_Hero_Dots`
						flags = 4
						Color = grey_4guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_22Fret_BCRich02
		frontend_desc = qs(0x18203e43)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard_02`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d2_01`
				material = GTR_Fretboard_02_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_22Fret_BCRich
						$car_rocker_guitars_factoredGlobal_52
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d2_01`
				material = GTR_Fretboard_02_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/22_fret_LD01_Hero_Dots`
						flags = 4
						Color = Black_1guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_22Fret_BCRich03
		frontend_desc = qs(0x89ed86d5)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard_03`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d3_01`
				material = GTR_Fretboard_03_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_22Fret_BCRich
						$car_rocker_guitars_factoredGlobal_51
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d3_01`
				material = GTR_Fretboard_03_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/22_fret_LD01_Hero_Dots`
						flags = 4
						Color = grey_4guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_22Fret_BCRich04
		frontend_desc = qs(0x3b865ccc)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard_04`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
				material = GTR_Fretboard_04_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_22Fret_BCRich
						$car_rocker_guitars_factoredGlobal_51
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
				material = GTR_Fretboard_04_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/22_fret_LD01_Hero_Dots`
						flags = 4
						Color = grey_4guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_22Fret_Ibanez03
		frontend_desc = qs(0x89ed86d5)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard_03`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d3_01`
				material = GTR_Fretboard_03_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_22Fret_Ibanez
						$car_rocker_guitars_factoredGlobal_51
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d3_01`
				material = GTR_Fretboard_03_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
						flags = 4
						Color = grey_4guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = GTR_Fretboard_01
		frontend_desc = qs(0x2bfd4eae)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard_01`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d_01`
				material = GTR_Fretboard_01_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_22Fret_Fretboard
						$car_rocker_guitars_factoredGlobal_51
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d_01`
				material = GTR_Fretboard_01_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
						flags = 4
						Color = Black_1guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = GTR_Fretboard_02
		frontend_desc = qs(0x01cc0004)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard_02`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d2_01`
				material = GTR_Fretboard_02_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_22Fret_Fretboard
						$car_rocker_guitars_factoredGlobal_52
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d2_01`
				material = GTR_Fretboard_02_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
						flags = 4
						Color = Black_1guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = GTR_Fretboard_03
		frontend_desc = qs(0x5e9fbd24)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard_03`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d3_01`
				material = GTR_Fretboard_03_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_22Fret_Fretboard
						$car_rocker_guitars_factoredGlobal_51
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d3_01`
				material = GTR_Fretboard_03_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
						flags = 4
						Color = grey_4guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = GTR_Fretboard_04
		frontend_desc = qs(0x226a628b)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard_04`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
				material = GTR_Fretboard_04_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_22Fret_Fretboard
						$car_rocker_guitars_factoredGlobal_51
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
				material = GTR_Fretboard_04_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/22fret_LD86_ESP_Dots`
						flags = 4
						Color = grey_4guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = GTR_Fretboard_04cash
		frontend_desc = qs(0x226a628b)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard_04`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr_fretboard_d4_01`
				material = GTR_Fretboard_04_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_22Fret_Cash_Fret
						$car_rocker_guitars_factoredGlobal_51
					}
				]
			}
		]
	}
	{
		desc_id = CAG_24Fret_ESP01
		frontend_desc = qs(0x21ad5ed2)
		pak_num = 0
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard24_01`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d1_02`
				material = GTR_Fretboard24_01_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_24Fret_ESP
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d1_02`
				material = GTR_Fretboard24_01_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
						flags = 36
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_24Fret_ESP02
		frontend_desc = qs(0xa81d6c13)
		pak_num = 0
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard24_02`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d2_02`
				material = GTR_Fretboard24_02_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_24Fret_ESP
						$car_rocker_guitars_factoredGlobal_52
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d2_02`
				material = GTR_Fretboard24_02_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
						flags = 36
						Color = Black_1guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_24Fret_ESP03
		frontend_desc = qs(0xc0a291ea)
		pak_num = 0
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard24_03`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d3_02`
				material = GTR_Fretboard24_03_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_24Fret_ESP
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d3_02`
				material = GTR_Fretboard24_03_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
						flags = 36
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_24Fret_ESP04
		frontend_desc = qs(0x8bbb0e9c)
		pak_num = 0
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard24_04`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
				material = GTR_Fretboard24_04_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_24Fret_ESP
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
				material = GTR_Fretboard24_04_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
						flags = 36
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_24Fret_Hero01
		frontend_desc = qs(0x21ad5ed2)
		pak_num = 0
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard24_01`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d1_02`
				material = GTR_Fretboard24_01_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_24Fret_Heroes
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d1_02`
				material = GTR_Fretboard24_01_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
						flags = 36
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_24Fret_Hero02
		frontend_desc = qs(0xa81d6c13)
		pak_num = 0
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard24_02`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d2_02`
				material = GTR_Fretboard24_02_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_24Fret_Heroes
						$car_rocker_guitars_factoredGlobal_52
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d2_02`
				material = GTR_Fretboard24_02_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
						flags = 36
						Color = Black_1guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_24Fret_Hero03
		frontend_desc = qs(0xc0a291ea)
		pak_num = 0
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard24_03`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d3_02`
				material = GTR_Fretboard24_03_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_24Fret_Heroes
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d3_02`
				material = GTR_Fretboard24_03_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
						flags = 36
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_24Fret_Hero04
		frontend_desc = qs(0x8bbb0e9c)
		pak_num = 0
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard24_04`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
				material = GTR_Fretboard24_04_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_24Fret_Heroes
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
				material = GTR_Fretboard24_04_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
						flags = 36
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_24Fret_PRS01
		frontend_desc = qs(0x21ad5ed2)
		pak_num = 0
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard24_01`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d1_02`
				material = GTR_Fretboard24_01_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_24Fret_PRS
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d1_02`
				material = GTR_Fretboard24_01_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/PRS/24fret_LD81_PRS_Dots`
						flags = 36
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_24Fret_PRS02
		frontend_desc = qs(0xa81d6c13)
		pak_num = 0
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard24_02`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d2_02`
				material = GTR_Fretboard24_02_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_24Fret_PRS
						$car_rocker_guitars_factoredGlobal_52
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d2_02`
				material = GTR_Fretboard24_02_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/PRS/24fret_LD81_PRS_Dots`
						flags = 36
						Color = Black_1guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_24Fret_PRS03
		frontend_desc = qs(0xc0a291ea)
		pak_num = 0
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard24_03`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d3_02`
				material = GTR_Fretboard24_03_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_24Fret_PRS
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d3_02`
				material = GTR_Fretboard24_03_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/PRS/24fret_LD81_PRS_Dots`
						flags = 36
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_24Fret_PRS04
		frontend_desc = qs(0x8bbb0e9c)
		pak_num = 0
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard24_04`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
				material = GTR_Fretboard24_04_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_24Fret_PRS
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
				material = GTR_Fretboard24_04_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/PRS/24fret_LD81_PRS_Dots`
						flags = 36
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_24Fret_Ibanez01
		frontend_desc = qs(0x21ad5ed2)
		pak_num = 0
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard24_01`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d1_02`
				material = GTR_Fretboard24_01_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_24Fret_Ibanez
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d1_02`
				material = GTR_Fretboard24_01_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
						flags = 36
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_24Fret_Ibanez02
		frontend_desc = qs(0xa81d6c13)
		pak_num = 0
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard24_02`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d2_02`
				material = GTR_Fretboard24_02_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_24Fret_Ibanez
						$car_rocker_guitars_factoredGlobal_52
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d2_02`
				material = GTR_Fretboard24_02_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
						flags = 36
						Color = Black_1guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_24Fret_Ibanez04
		frontend_desc = qs(0x8bbb0e9c)
		pak_num = 0
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard24_04`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
				material = GTR_Fretboard24_04_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_24Fret_Ibanez
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
				material = GTR_Fretboard24_04_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
						flags = 36
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_24Fret_BCRich01
		frontend_desc = qs(0x21ad5ed2)
		pak_num = 0
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard24_01`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d1_02`
				material = GTR_Fretboard24_01_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_24Fret_BCRich
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d1_02`
				material = GTR_Fretboard24_01_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
						flags = 36
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_24Fret_BCRich02
		frontend_desc = qs(0xa81d6c13)
		pak_num = 0
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard24_02`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d2_02`
				material = GTR_Fretboard24_02_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_24Fret_BCRich
						$car_rocker_guitars_factoredGlobal_52
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d2_02`
				material = GTR_Fretboard24_02_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
						flags = 36
						Color = Black_1guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_24Fret_BCRich03
		frontend_desc = qs(0xc0a291ea)
		pak_num = 0
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard24_03`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d3_02`
				material = GTR_Fretboard24_03_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_24Fret_BCRich
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d3_02`
				material = GTR_Fretboard24_03_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
						flags = 36
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_24Fret_BCRich04
		frontend_desc = qs(0x8bbb0e9c)
		pak_num = 0
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard24_04`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
				material = GTR_Fretboard24_04_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_24Fret_BCRich
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
				material = GTR_Fretboard24_04_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
						flags = 36
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_24Fret_mcswain01
		frontend_desc = qs(0x21ad5ed2)
		pak_num = 0
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard24_01`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d1_02`
				material = GTR_Fretboard24_01_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_24Fret_mcswain
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d1_02`
				material = GTR_Fretboard24_01_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
						flags = 36
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_24Fret_mcswain02
		frontend_desc = qs(0xa81d6c13)
		pak_num = 0
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard24_02`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d2_02`
				material = GTR_Fretboard24_02_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_24Fret_mcswain
						$car_rocker_guitars_factoredGlobal_52
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d2_02`
				material = GTR_Fretboard24_02_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
						flags = 36
						Color = Black_1guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_24Fret_mcswain03
		frontend_desc = qs(0xc0a291ea)
		pak_num = 0
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard24_03`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d3_02`
				material = GTR_Fretboard24_03_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_24Fret_mcswain
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d3_02`
				material = GTR_Fretboard24_03_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
						flags = 36
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_24Fret_mcswain04
		frontend_desc = qs(0x8bbb0e9c)
		pak_num = 0
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard24_04`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
				material = GTR_Fretboard24_04_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_24Fret_mcswain
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
				material = GTR_Fretboard24_04_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
						flags = 36
						Color = grey_5guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_24Fret_Schecter01
		frontend_desc = qs(0x21ad5ed2)
		pak_num = 0
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard24_01`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d1_02`
				material = GTR_Fretboard24_01_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_24Fret_Schecter
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d1_02`
				material = GTR_Fretboard24_01_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
						flags = 36
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_24Fret_Schecter02
		frontend_desc = qs(0xa81d6c13)
		pak_num = 0
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard24_02`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d2_02`
				material = GTR_Fretboard24_02_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_24Fret_Schecter
						$car_rocker_guitars_factoredGlobal_52
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d2_02`
				material = GTR_Fretboard24_02_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
						flags = 36
						Color = Black_1guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_24Fret_Schecter03
		frontend_desc = qs(0xc0a291ea)
		pak_num = 0
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard24_03`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d3_02`
				material = GTR_Fretboard24_03_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_24Fret_Schecter
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d3_02`
				material = GTR_Fretboard24_03_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
						flags = 36
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_24Fret_Schecter04
		frontend_desc = qs(0x8bbb0e9c)
		pak_num = 0
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard24_04`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
				material = GTR_Fretboard24_04_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_24Fret_Schecter
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
				material = GTR_Fretboard24_04_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
						flags = 36
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_24Fret_MM01
		frontend_desc = qs(0x21ad5ed2)
		pak_num = 0
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard24_01`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d1_02`
				material = GTR_Fretboard24_01_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_24Fret_MM
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d1_02`
				material = GTR_Fretboard24_01_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
						flags = 36
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_24Fret_MM02
		frontend_desc = qs(0xa81d6c13)
		pak_num = 0
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard24_02`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d2_02`
				material = GTR_Fretboard24_02_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_24Fret_MM
						$car_rocker_guitars_factoredGlobal_52
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d2_02`
				material = GTR_Fretboard24_02_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
						flags = 36
						Color = Black_1guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_24Fret_MM03
		frontend_desc = qs(0xc0a291ea)
		pak_num = 0
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard24_03`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d3_02`
				material = GTR_Fretboard24_03_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_24Fret_MM
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d3_02`
				material = GTR_Fretboard24_03_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
						flags = 36
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_24Fret_MM04
		frontend_desc = qs(0x8bbb0e9c)
		pak_num = 0
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard24_04`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
				material = GTR_Fretboard24_04_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_24Fret_MM
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
				material = GTR_Fretboard24_04_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
						flags = 36
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_24Fret_Daisy01
		frontend_desc = qs(0x21ad5ed2)
		pak_num = 0
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard24_01`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d1_02`
				material = GTR_Fretboard24_01_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_24Fret_Daisy
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d1_02`
				material = GTR_Fretboard24_01_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
						flags = 36
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_24Fret_Daisy02
		frontend_desc = qs(0xa81d6c13)
		pak_num = 0
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard24_02`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d2_02`
				material = GTR_Fretboard24_02_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_24Fret_Daisy
						$car_rocker_guitars_factoredGlobal_52
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d2_02`
				material = GTR_Fretboard24_02_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
						flags = 36
						Color = Black_1guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_24Fret_Daisy03
		frontend_desc = qs(0xc0a291ea)
		pak_num = 0
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard24_03`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d3_02`
				material = GTR_Fretboard24_03_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_24Fret_Daisy
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d3_02`
				material = GTR_Fretboard24_03_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
						flags = 36
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_24Fret_Daisy04
		frontend_desc = qs(0x8bbb0e9c)
		pak_num = 0
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard24_04`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
				material = GTR_Fretboard24_04_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_24Fret_Daisy
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
				material = GTR_Fretboard24_04_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
						flags = 36
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_24Fret_Taylor01
		frontend_desc = qs(0x21ad5ed2)
		pak_num = 0
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard24_01`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d1_02`
				material = GTR_Fretboard24_01_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_24Fret_Taylor
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d1_02`
				material = GTR_Fretboard24_01_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
						flags = 36
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_24Fret_Taylor02
		frontend_desc = qs(0xa81d6c13)
		pak_num = 0
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard24_02`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d2_02`
				material = GTR_Fretboard24_02_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_24Fret_Taylor
						$car_rocker_guitars_factoredGlobal_52
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d2_02`
				material = GTR_Fretboard24_02_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
						flags = 36
						Color = Black_1guitar
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_24Fret_Taylor03
		frontend_desc = qs(0xc0a291ea)
		pak_num = 0
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard24_03`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d3_02`
				material = GTR_Fretboard24_03_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_24Fret_Taylor
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d3_02`
				material = GTR_Fretboard24_03_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
						flags = 36
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = CAG_24Fret_Taylor04
		frontend_desc = qs(0x8bbb0e9c)
		pak_num = 0
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard24_04`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
				material = GTR_Fretboard24_04_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_24Fret_Taylor
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr_fretboard24_d4_02`
				material = GTR_Fretboard24_04_Primary
				pre_layer = [
					{
						texture = `tex/models/Characters/Layers/CAG/GH5/24fret_LD01_Hero_Dots`
						flags = 36
					}
				]
				diffuse
			}
		]
	}
	{
		desc_id = GTR_Fretboard_66
		frontend_desc = qs(0xb31e742d)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Fretboard_66`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/GTR_Fretboard_66_D`
				material = GTR_Fretboard_66_Primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $CAG_FBOARD66
					}
				]
			}
		]
	}
]
CAS_Guitar_Head = [
	{
		desc_id = GTR4_Neckhead_01
		frontend_desc = qs(0x6de4a5a9)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR4_Neckhead_01`
		materials = [
			GTR4_Neckhead_01_Hardware
		]
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01`
				material = GTR4_Neckhead_01_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR4_Neckhead
					}
					{
						$preset_layer_fades
						mask = $GTR4_Neckhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR4_Neckhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_53
			}
		]
	}
	{
		desc_id = GTR4_Neckhead_02
		frontend_desc = qs(0x9e56fccb)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR4_Neckhead_02`
		pak_num = 0
		materials = [
			GTR4_Neckhead_02_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01`
				material = GTR4_Neckhead_02_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR9_Neckhead
					}
					{
						$preset_layer_fades
						mask = $GTR9_Neckhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR9_Neckhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_53
			}
		]
	}
	{
		desc_id = GTR4_Neckhead_03
		frontend_desc = qs(0x866cea3f)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR4_Neckhead_03`
		pak_num = 0
		materials = [
			GTR4_Neckhead_03_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03`
				material = GTR4_Neckhead_03_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR4_Neckhead_03
					}
					{
						$preset_layer_fades
						mask = $GTR4_Neckhead_03_fades
					}
					{
						$preset_layer_details
						mask = $GTR4_Neckhead_03_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_53
			}
		]
	}
	{
		desc_id = GTR4_Neckhead_04
		frontend_desc = qs(0xab224c92)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR4_Neckhead_04`
		pak_num = 0
		materials = [
			GTR4_Neckhead_04_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead`
				material = GTR4_Neckhead_04_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR60_Neckhead
					}
					{
						$preset_layer_fades
						mask = $GTR60_Neckhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR60_Neckhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_54
			}
		]
	}
	{
		desc_id = GTR4_Neckhead_05
		frontend_desc = qs(0x5782ad70)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR4_Neckhead_05`
		pak_num = 0
		materials = [
			GTR4_Neckhead_05_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_d`
				material = GTR4_Neckhead_05_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR64_Neckhead
					}
					{
						$preset_layer_fades
						mask = $GTR64_Neckhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR64_Neckhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_55
			}
		]
	}
	{
		desc_id = GTR4_Neckhead_06
		frontend_desc = qs(0xf7d0eb1c)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR4_Neckhead_06`
		pak_num = 0
		materials = [
			GTR4_Neckhead_06_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_06`
				material = GTR4_Neckhead_06_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR4_Neckhead_06
					}
					{
						$preset_layer_fades
						mask = $GTR4_Neckhead_06_fades
					}
					{
						$preset_layer_details
						mask = $GTR4_Neckhead_06_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_54
			}
		]
	}
	{
		desc_id = GTR4_Neckhead_07
		frontend_desc = qs(0xb11049e5)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR4_Neckhead_07`
		pak_num = 0
		materials = [
			GTR4_Neckhead_07_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_07`
				material = GTR4_Neckhead_07_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR4_Neckhead_07
					}
					{
						$preset_layer_fades
						mask = $GTR4_Neckhead_07_fades
					}
					{
						$preset_layer_details
						mask = $GTR4_Neckhead_07_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR9_Neckhead_01
		frontend_desc = qs(0xb104e40c)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR9_Neckhead_01`
		pak_num = 0
		materials = [
			GTR9_Neckhead_01_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01`
				material = GTR9_Neckhead_01_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR9_Neckhead
					}
					{
						$preset_layer_fades
						mask = $GTR9_Neckhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR9_Neckhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_53
			}
		]
	}
	{
		desc_id = GTR9_Neckhead_02
		frontend_desc = qs(0x6de4a5a9)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR9_Neckhead_02`
		pak_num = 0
		materials = [
			GTR4_Neckhead_01_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01`
				material = GTR4_Neckhead_01_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR4_Neckhead
					}
					{
						$preset_layer_fades
						mask = $GTR4_Neckhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR4_Neckhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_53
			}
		]
	}
	{
		desc_id = GTR9_Neckhead_03
		frontend_desc = qs(0x866cea3f)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR9_Neckhead_03`
		pak_num = 0
		materials = [
			GTR4_Neckhead_03_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03`
				material = GTR4_Neckhead_03_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR4_Neckhead_03
					}
					{
						$preset_layer_fades
						mask = $GTR4_Neckhead_03_fades
					}
					{
						$preset_layer_details
						mask = $GTR4_Neckhead_03_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_53
			}
		]
	}
	{
		desc_id = GTR9_Neckhead_04
		frontend_desc = qs(0xab224c92)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR9_Neckhead_04`
		pak_num = 0
		materials = [
			GTR4_Neckhead_04_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead`
				material = GTR4_Neckhead_04_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR60_Neckhead
					}
					{
						$preset_layer_fades
						mask = $GTR60_Neckhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR60_Neckhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_54
			}
		]
	}
	{
		desc_id = GTR9_Neckhead_05
		frontend_desc = qs(0x5782ad70)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR9_Neckhead_05`
		pak_num = 0
		materials = [
			GTR4_Neckhead_05_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_d`
				material = GTR4_Neckhead_05_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR64_Neckhead
					}
					{
						$preset_layer_fades
						mask = $GTR64_Neckhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR64_Neckhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_55
			}
		]
	}
	{
		desc_id = GTR9_Neckhead_06
		frontend_desc = qs(0xf7d0eb1c)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR9_Neckhead_06`
		pak_num = 0
		materials = [
			GTR4_Neckhead_06_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_06`
				material = GTR4_Neckhead_06_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR4_Neckhead_06
					}
					{
						$preset_layer_fades
						mask = $GTR4_Neckhead_06_fades
					}
					{
						$preset_layer_details
						mask = $GTR4_Neckhead_06_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_54
			}
		]
	}
	{
		desc_id = GTR9_Neckhead_07
		frontend_desc = qs(0xb11049e5)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR9_Neckhead_07`
		pak_num = 0
		materials = [
			GTR4_Neckhead_07_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_07`
				material = GTR4_Neckhead_07_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR4_Neckhead_07
					}
					{
						$preset_layer_fades
						mask = $GTR4_Neckhead_07_fades
					}
					{
						$preset_layer_details
						mask = $GTR4_Neckhead_07_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR12_Neckhead_01
		frontend_desc = qs(0x6de4a5a9)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR12_Neckhead_01`
		pak_num = 0
		materials = [
			GTR12_Neckhead_01_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01`
				material = GTR12_Neckhead_01_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR4_Neckhead
					}
					{
						$preset_layer_fades
						mask = $GTR4_Neckhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR4_Neckhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_53
			}
		]
	}
	{
		desc_id = GTR12_Neckhead_02
		frontend_desc = qs(0xb104e40c)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR12_Neckhead_02`
		pak_num = 0
		materials = [
			GTR12_Neckhead_02_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01`
				material = GTR12_Neckhead_02_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR9_Neckhead
					}
					{
						$preset_layer_fades
						mask = $GTR9_Neckhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR9_Neckhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_53
			}
		]
	}
	{
		desc_id = GTR12_Neckhead_03
		frontend_desc = qs(0x866cea3f)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR12_Neckhead_03`
		pak_num = 0
		materials = [
			GTR12_Neckhead_03_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03`
				material = GTR12_Neckhead_03_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR4_Neckhead_03
					}
					{
						$preset_layer_fades
						mask = $GTR4_Neckhead_03_fades
					}
					{
						$preset_layer_details
						mask = $GTR4_Neckhead_03_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_53
			}
		]
	}
	{
		desc_id = GTR12_Neckhead_04
		frontend_desc = qs(0xab224c92)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR12_Neckhead_04`
		pak_num = 0
		materials = [
			GTR12_Neckhead_04_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead`
				material = GTR12_Neckhead_04_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR60_Neckhead
					}
					{
						$preset_layer_fades
						mask = $GTR60_Neckhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR60_Neckhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_54
			}
		]
	}
	{
		desc_id = GTR12_Neckhead_05
		frontend_desc = qs(0x5782ad70)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR12_Neckhead_05`
		pak_num = 0
		materials = [
			GTR12_Neckhead_05_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_d`
				material = GTR12_Neckhead_05_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR64_Neckhead
					}
					{
						$preset_layer_fades
						mask = $GTR64_Neckhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR64_Neckhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_55
			}
		]
	}
	{
		desc_id = GTR60_Neckhead4
		frontend_desc = qs(0xab224c92)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR60_Neckhead4`
		pak_num = 0
		materials = [
			GTR60_Neckhead4_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/GTR60_Neckhead4_d`
				material = GTR60_Neckhead4_Primary
				$car_rocker_guitars_factoredGlobal_55
			}
		]
		hidden
	}
	{
		desc_id = GTR12_Neckhead_06
		frontend_desc = qs(0xf7d0eb1c)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR12_Neckhead_06`
		pak_num = 0
		materials = [
			GTR12_Neckhead_06_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_06`
				material = GTR12_Neckhead_06_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR4_Neckhead_06
					}
					{
						$preset_layer_fades
						mask = $GTR4_Neckhead_06_fades
					}
					{
						$preset_layer_details
						mask = $GTR4_Neckhead_06_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_54
			}
		]
	}
	{
		desc_id = GTR12_Neckhead_07
		frontend_desc = qs(0xb11049e5)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR12_Neckhead_07`
		pak_num = 0
		materials = [
			GTR12_Neckhead_07_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_07`
				material = GTR12_Neckhead_07_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR4_Neckhead_07
					}
					{
						$preset_layer_fades
						mask = $GTR4_Neckhead_07_fades
					}
					{
						$preset_layer_details
						mask = $GTR4_Neckhead_07_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR30_Nekhed_A
		frontend_desc = qs(0xa11eb675)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR30_Nekhed_A`
		pak_num = 0
		materials = [
			GTR30_Nekhead_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d`
				material = GTR30_Nekhead_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR30_Neckhead
					}
					{
						$preset_layer_fades
						mask = $GTR30_Neckhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR30_Neckhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_57
			}
		]
	}
	{
		desc_id = GTR30_Nekhed_B
		frontend_desc = qs(0x8a33e5b6)
		sponsor_id = ESP
		pak_num = 0
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR31c_NeckHead`
		materials = [
			GTR31c_Neckhead_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead`
				material = GTR31C_Neckhead_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR31_Nhead
					}
					{
						$preset_layer_fades
						mask = $GTR31_Nhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR31_Nhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_53
			}
		]
	}
	{
		desc_id = GTR30_Nekhed_C
		frontend_desc = qs(0x1a978a31)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR30_Nekhed_C`
		pak_num = 0
		materials = [
			GTR36_NHead_SprV_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed`
				material = GTR36_NHead_SprV_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr36_Nekhead
					}
					{
						$preset_layer_fades
						mask = $GTR36_Nekhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR36_Nekhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_58
			}
		]
	}
	{
		desc_id = GTR30_Nekhed_D
		frontend_desc = qs(0xb11049e5)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR30_Nekhed_D`
		pak_num = 0
		materials = [
			GTR32_NHED_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed`
				material = GTR32_NHED_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR32_Nekhead
					}
					{
						$preset_layer_fades
						mask = $GTR32_Nekhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR32_Nekhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR30_Nekhed_E
		frontend_desc = qs(0xf7d0eb1c)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR30_Nekhed_E`
		pak_num = 0
		materials = [
			GTR33D_NeckHead_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed`
				material = GTR33D_NeckHead_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR33_NHead
					}
					{
						$preset_layer_fades
						mask = $GTR33_Nhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR33_NHead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_54
			}
		]
	}
	{
		desc_id = GTR30_Nekhed_F
		frontend_desc = qs(0x743000b2)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR30_Nekhed_F`
		pak_num = 0
		materials = [
			GTR37_NHEAD_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed`
				material = GTR37_NHEAD_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR37_Nhead
					}
					{
						$preset_layer_fades
						mask = $GTR37_Nhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR37_Nhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_59
			}
		]
	}
	{
		desc_id = GTR31c_NeckHead
		frontend_desc = qs(0x8a33e5b6)
		sponsor_id = ESP
		pak_num = 0
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR31c_NeckHead`
		materials = [
			GTR31c_Neckhead_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead`
				material = GTR31C_Neckhead_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR31_Nhead
					}
					{
						$preset_layer_fades
						mask = $GTR31_Nhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR31_Nhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_53
			}
		]
	}
	{
		desc_id = GTR31c_NeckHead03
		frontend_desc = qs(0x1a978a31)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR31c_NeckHead03`
		pak_num = 0
		materials = [
			GTR36_NHead_SprV_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed`
				material = GTR36_NHead_SprV_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr36_Nekhead
					}
					{
						$preset_layer_fades
						mask = $GTR36_Nekhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR36_Nekhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_58
			}
		]
	}
	{
		desc_id = GTR31c_NeckHead06
		frontend_desc = qs(0x743000b2)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR31c_NeckHead06`
		pak_num = 0
		materials = [
			GTR37_NHEAD_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed`
				material = GTR37_NHEAD_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR37_Nhead
					}
					{
						$preset_layer_fades
						mask = $GTR37_Nhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR37_Nhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_59
			}
		]
	}
	{
		desc_id = GTR31c_NeckHead04
		frontend_desc = qs(0xf7d0eb1c)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR31c_NeckHead04`
		pak_num = 0
		materials = [
			GTR33D_NeckHead_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed`
				material = GTR33D_NeckHead_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR33_NHead
					}
					{
						$preset_layer_fades
						mask = $GTR33_Nhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR33_NHead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_54
			}
		]
	}
	{
		desc_id = GTR31c_NeckHead05
		frontend_desc = qs(0xb11049e5)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR31c_NeckHead05`
		pak_num = 0
		materials = [
			GTR32_NHED_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed`
				material = GTR32_NHED_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR32_Nekhead
					}
					{
						$preset_layer_fades
						mask = $GTR32_Nekhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR32_Nekhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR31c_NeckHead02
		frontend_desc = qs(0xa11eb675)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR31c_NeckHead02`
		pak_num = 0
		materials = [
			GTR30_Nekhead_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d`
				material = GTR30_Nekhead_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR30_Neckhead
					}
					{
						$preset_layer_fades
						mask = $GTR30_Neckhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR30_Neckhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_57
			}
		]
	}
	{
		desc_id = GTR32_Nekhead01
		frontend_desc = qs(0xb11049e5)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR32_Nekhead01`
		pak_num = 0
		materials = [
			GTR32_NHED_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed`
				material = GTR32_NHED_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR32_Nekhead
					}
					{
						$preset_layer_fades
						mask = $GTR32_Nekhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR32_Nekhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR32_Neckhead_F
		frontend_desc = qs(0x1a978a31)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR32_Neckhead_F`
		pak_num = 0
		materials = [
			GTR36_NHead_SprV_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed`
				material = GTR36_NHead_SprV_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr36_Nekhead
					}
					{
						$preset_layer_fades
						mask = $GTR36_Nekhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR36_Nekhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_58
			}
		]
	}
	{
		desc_id = GTR32_Neckhead_C
		frontend_desc = qs(0x743000b2)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR32_Neckhead_C`
		pak_num = 0
		materials = [
			GTR37_NHEAD_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed`
				material = GTR37_NHEAD_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR37_Nhead
					}
					{
						$preset_layer_fades
						mask = $GTR37_Nhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR37_Nhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_59
			}
		]
	}
	{
		desc_id = GTR32_Neckhead_B
		frontend_desc = qs(0xf7d0eb1c)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR32_Neckhead_B`
		pak_num = 0
		materials = [
			GTR33D_NeckHead_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed`
				material = GTR33D_NeckHead_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR33_NHead
					}
					{
						$preset_layer_fades
						mask = $GTR33_Nhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR33_NHead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_54
			}
		]
	}
	{
		desc_id = GTR32_Neckhead_E
		frontend_desc = qs(0x8a33e5b6)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR32_Neckhead_E`
		pak_num = 0
		materials = [
			GTR31c_Neckhead_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead`
				material = GTR31C_Neckhead_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR31_Nhead
					}
					{
						$preset_layer_fades
						mask = $GTR31_Nhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR31_Nhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_53
			}
		]
	}
	{
		desc_id = GTR32_Neckhead_D
		frontend_desc = qs(0xa11eb675)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR32_Neckhead_D`
		pak_num = 0
		materials = [
			GTR30_Nekhead_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d`
				material = GTR30_Nekhead_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR30_Neckhead
					}
					{
						$preset_layer_fades
						mask = $GTR30_Neckhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR30_Neckhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_57
			}
		]
	}
	{
		desc_id = GTR33D_NekHed
		frontend_desc = qs(0xf7d0eb1c)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR33D_NekHed`
		pak_num = 0
		materials = [
			GTR33D_NeckHead_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed`
				material = GTR33D_NeckHead_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR33_NHead
					}
					{
						$preset_layer_fades
						mask = $GTR33_Nhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR33_NHead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_54
			}
		]
	}
	{
		desc_id = GTR33D_NekHed_B
		frontend_desc = qs(0xb11049e5)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR33D_NekHed_B`
		pak_num = 0
		materials = [
			GTR32_NHED_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed`
				material = GTR32_NHED_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR32_Nekhead
					}
					{
						$preset_layer_fades
						mask = $GTR32_Nekhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR32_Nekhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR33D_Neckhead_D
		frontend_desc = qs(0x743000b2)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR33D_Nekhead_D`
		pak_num = 0
		materials = [
			GTR37_NHEAD_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed`
				material = GTR37_NHEAD_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR37_Nhead
					}
					{
						$preset_layer_fades
						mask = $GTR37_Nhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR37_Nhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_59
			}
		]
	}
	{
		desc_id = GTR33D_NekHed_C
		frontend_desc = qs(0x1a978a31)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR33D_NekHed_C`
		pak_num = 0
		materials = [
			GTR36_NHead_SprV_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed`
				material = GTR36_NHead_SprV_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr36_Nekhead
					}
					{
						$preset_layer_fades
						mask = $GTR36_Nekhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR36_Nekhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_58
			}
		]
	}
	{
		desc_id = GTR33D_NekHed_E
		frontend_desc = qs(0x8a33e5b6)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR33D_NekHed_E`
		pak_num = 0
		materials = [
			GTR30_Nekhead_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d`
				material = GTR30_Nekhead_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR30_Neckhead
					}
					{
						$preset_layer_fades
						mask = $GTR30_Neckhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR30_Neckhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_57
			}
		]
	}
	{
		desc_id = GTR33D_NekHed_F
		frontend_desc = qs(0xa11eb675)
		sponsor_id = ESP
		pak_num = 0
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR33D_NekHed_F`
		materials = [
			GTR31c_Neckhead_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead`
				material = GTR31C_Neckhead_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR31_Nhead
					}
					{
						$preset_layer_fades
						mask = $GTR31_Nhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR31_Nhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_53
			}
		]
	}
	{
		desc_id = GTR36_NekHed
		frontend_desc = qs(0x1a978a31)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR36_NekHed`
		pak_num = 0
		materials = [
			GTR36_NHead_SprV_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed`
				material = GTR36_NHead_SprV_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr36_Nekhead
					}
					{
						$preset_layer_fades
						mask = $GTR36_Nekhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR36_Nekhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_58
			}
		]
	}
	{
		desc_id = GTR36_NekHed_B
		frontend_desc = qs(0x743000b2)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR36_NekHed_B`
		pak_num = 0
		materials = [
			GTR37_NHEAD_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed`
				material = GTR37_NHEAD_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR37_Nhead
					}
					{
						$preset_layer_fades
						mask = $GTR37_Nhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR37_Nhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_59
			}
		]
	}
	{
		desc_id = GTR36_NekHed_E
		frontend_desc = qs(0xb11049e5)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR36_NekHed_E`
		pak_num = 0
		materials = [
			GTR32_NHED_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed`
				material = GTR32_NHED_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR32_Nekhead
					}
					{
						$preset_layer_fades
						mask = $GTR32_Nekhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR32_Nekhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR36_NekHed_F
		frontend_desc = qs(0xf7d0eb1c)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR36_NekHed_F`
		pak_num = 0
		materials = [
			GTR33D_NeckHead_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed`
				material = GTR33D_NeckHead_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR33_NHead
					}
					{
						$preset_layer_fades
						mask = $GTR33_Nhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR33_NHead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_54
			}
		]
	}
	{
		desc_id = GTR36_NekHed_C
		frontend_desc = qs(0x8a33e5b6)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR36_NekHed_C`
		pak_num = 0
		materials = [
			GTR31c_Neckhead_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead`
				material = GTR31C_Neckhead_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR31_Nhead
					}
					{
						$preset_layer_fades
						mask = $GTR31_Nhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR31_Nhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_53
			}
		]
	}
	{
		desc_id = GTR36_NekHed_D
		frontend_desc = qs(0xa11eb675)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR36_NekHed_D`
		pak_num = 0
		materials = [
			GTR30_Nekhead_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d`
				material = GTR30_Nekhead_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR30_Neckhead
					}
					{
						$preset_layer_fades
						mask = $GTR30_Neckhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR30_Neckhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_57
			}
		]
	}
	{
		desc_id = GTR37_Neckhead
		frontend_desc = qs(0x743000b2)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR37_Neckhead`
		pak_num = 0
		materials = [
			GTR37_NHEAD_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr37_nekhed`
				material = GTR37_NHEAD_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR37_Nhead
					}
					{
						$preset_layer_fades
						mask = $GTR37_Nhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR37_Nhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_59
			}
		]
	}
	{
		desc_id = GTR37_NeckHead_B
		frontend_desc = qs(0x1a978a31)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR37_Neckhead02`
		pak_num = 0
		materials = [
			GTR36_NHead_SprV_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr36_nekhed`
				material = GTR36_NHead_SprV_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr36_Nekhead
					}
					{
						$preset_layer_fades
						mask = $GTR36_Nekhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR36_Nekhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_58
			}
		]
	}
	{
		desc_id = GTR37_NeckHead_C
		frontend_desc = qs(0xb11049e5)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR37_Neckhead03`
		pak_num = 0
		materials = [
			GTR32_NHED_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr32_nekhed`
				material = GTR32_NHED_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR32_Nekhead
					}
					{
						$preset_layer_fades
						mask = $GTR32_Nekhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR32_Nekhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR37_Neckhead_D
		frontend_desc = qs(0xf7d0eb1c)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR37_Neckhead04`
		pak_num = 0
		materials = [
			GTR33D_NeckHead_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr33d_nekhed`
				material = GTR33D_NeckHead_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR33_NHead
					}
					{
						$preset_layer_fades
						mask = $GTR33_Nhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR33_NHead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_54
			}
		]
	}
	{
		desc_id = GTR37_Neckhead_E
		frontend_desc = qs(0x8a33e5b6)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR37_Neckhead05`
		pak_num = 0
		materials = [
			GTR31c_Neckhead_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr31_neckhead`
				material = GTR31C_Neckhead_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR31_Nhead
					}
					{
						$preset_layer_fades
						mask = $GTR31_Nhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR31_Nhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_53
			}
		]
	}
	{
		desc_id = GTR37_Neckhead_F
		frontend_desc = qs(0xa11eb675)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR37_Neckhead06`
		pak_num = 0
		materials = [
			GTR30_Nekhead_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr30_nekhead_h_d`
				material = GTR30_Nekhead_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR30_Neckhead
					}
					{
						$preset_layer_fades
						mask = $GTR30_Neckhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR30_Neckhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_57
			}
		]
	}
	{
		desc_id = GTR38_NeckHead
		frontend_desc = qs(0xa8d797da)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR38_Neckhead`
		pak_num = 0
		materials = [
			GTR38_NHead_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr38_nekhed`
				material = GTR38_NHEAD_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR38_Nhead
					}
					{
						$preset_layer_fades
						mask = $GTR38_Nhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR38_Nhead_Details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						x_trans = -25
						x_scale = 26
						y_scale = 26
						y_trans = 2
					}
				}
			}
		]
	}
	{
		desc_id = GTR60_Neckhead
		frontend_desc = qs(0xab224c92)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR60_Neckhead`
		pak_num = 0
		materials = [
			GTR60_Neckhead_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead`
				material = GTR60_Neckhead_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR60_Neckhead
					}
					{
						$preset_layer_fades
						mask = $GTR60_Neckhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR60_Neckhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_54
			}
		]
	}
	{
		desc_id = GTR60_Neckhead2
		frontend_desc = qs(0x5782ad70)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR60_Neckhead2`
		pak_num = 0
		materials = [
			GTR60_Neckhead2_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr60_neckhead2_d`
				material = GTR60_Neckhead2_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR60_Neckhead2
					}
					{
						$preset_layer_fades
						mask = $GTR60_Neckhead2_fades
					}
					{
						$preset_layer_details
						mask = $GTR60_Neckhead2_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_55
			}
		]
	}
	{
		desc_id = GTR60_Neckhead3
		frontend_desc = qs(0xb11049e5)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR60_Neckhead3`
		pak_num = 0
		materials = [
			GTR60_Neckhead3_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr62_d_neckhead`
				material = GTR60_Neckhead3_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR62_Neckhead
					}
					{
						$preset_layer_fades
						mask = $GTR62_Neckhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR62_Neckhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR60_Neckhead_04
		frontend_desc = qs(0x6de4a5a9)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR60_Neckhead_04`
		pak_num = 0
		materials = [
			GTR60_Neckhead_04_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01`
				material = GTR60_Neckhead_04_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR4_Neckhead
					}
					{
						$preset_layer_fades
						mask = $GTR4_Neckhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR4_Neckhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_53
			}
		]
	}
	{
		desc_id = GTR60_Neckhead_05
		frontend_desc = qs(0xb104e40c)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR60_Neckhead_05`
		pak_num = 0
		materials = [
			GTR60_Neckhead_05_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01`
				material = GTR60_Neckhead_05_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR9_Neckhead
					}
					{
						$preset_layer_fades
						mask = $GTR9_Neckhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR9_Neckhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_53
			}
		]
	}
	{
		desc_id = GTR62_Neckhead
		frontend_desc = qs(0xb11049e5)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR62_Neckhead`
		pak_num = 0
		materials = [
			GTR62_Neckhead_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr62_d_neckhead`
				material = GTR62_Neckhead_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR62_Neckhead
					}
					{
						$preset_layer_fades
						mask = $GTR62_Neckhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR62_Neckhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR62_Neckhead2
		frontend_desc = qs(0x5782ad70)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR62_Neckhead2`
		pak_num = 0
		materials = [
			GTR62_Neckhead2_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_d`
				material = GTR62_Neckhead2_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR64_Neckhead
					}
					{
						$preset_layer_fades
						mask = $GTR64_Neckhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR64_Neckhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_55
			}
		]
	}
	{
		desc_id = GTR62_Neckhead3
		frontend_desc = qs(0xab224c92)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR62_Neckhead3`
		pak_num = 0
		materials = [
			GTR62_Neckhead3_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead`
				material = GTR62_Neckhead3_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR60_Neckhead
					}
					{
						$preset_layer_fades
						mask = $GTR60_Neckhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR60_Neckhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_54
			}
		]
	}
	{
		desc_id = GTR62_Neckhead_04
		frontend_desc = qs(0x6de4a5a9)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR62_Neckhead_04`
		pak_num = 0
		materials = [
			GTR62_Neckhead_04_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01`
				material = GTR62_Neckhead_04_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR4_Neckhead
					}
					{
						$preset_layer_fades
						mask = $GTR4_Neckhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR4_Neckhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_53
			}
		]
	}
	{
		desc_id = GTR62_Neckhead_05
		frontend_desc = qs(0xb104e40c)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR62_Neckhead_05`
		pak_num = 0
		materials = [
			GTR62_Neckhead_05_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01`
				material = GTR62_Neckhead_05_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR9_Neckhead
					}
					{
						$preset_layer_fades
						mask = $GTR9_Neckhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR9_Neckhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_53
			}
		]
	}
	{
		desc_id = GTR62_Neckhead_06
		frontend_desc = qs(0x866cea3f)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR62_Neckhead_06`
		pak_num = 0
		materials = [
			GTR62_Neckhead_06_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03`
				material = GTR62_Neckhead_06_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR4_Neckhead_03
					}
					{
						$preset_layer_fades
						mask = $GTR4_Neckhead_03_fades
					}
					{
						$preset_layer_details
						mask = $GTR4_Neckhead_03_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_53
			}
		]
	}
	{
		desc_id = GTR63_Neckhead
		frontend_desc = qs(0x6c06bacd)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR63_Neckhead`
		pak_num = 0
		materials = [
			GTR63_Neckhead_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr63_neckhead_d`
				material = GTR63_Neckhead_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR63_Neckhead
					}
				]
			}
		]
	}
	{
		desc_id = GTR63_Neckhead2
		frontend_desc = qs(0xab224c92)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR63_Neckhead2`
		materials = [
			GTR63_Neckhead2_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead`
				material = GTR63_Neckhead2_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR60_Neckhead
					}
					{
						$preset_layer_fades
						mask = $GTR60_Neckhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR60_Neckhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_54
			}
		]
	}
	{
		desc_id = GTR63_Neckhead3
		frontend_desc = qs(0x5782ad70)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR63_Neckhead3`
		pak_num = 0
		materials = [
			GTR63_Neckhead3_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_d`
				material = GTR63_Neckhead3_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR64_Neckhead
					}
					{
						$preset_layer_fades
						mask = $GTR64_Neckhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR64_Neckhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_55
			}
		]
	}
	{
		desc_id = GTR63_Neckhead_04
		frontend_desc = qs(0x6de4a5a9)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR63_Neckhead_04`
		pak_num = 0
		materials = [
			GTR63_Neckhead_04_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01`
				material = GTR63_Neckhead_04_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR4_Neckhead
					}
					{
						$preset_layer_fades
						mask = $GTR4_Neckhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR4_Neckhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_53
			}
		]
	}
	{
		desc_id = GTR63_Neckhead_05
		frontend_desc = qs(0xb104e40c)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR63_Neckhead_05`
		pak_num = 0
		materials = [
			GTR63_Neckhead_05_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01`
				material = GTR63_Neckhead_05_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR9_Neckhead
					}
					{
						$preset_layer_fades
						mask = $GTR9_Neckhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR9_Neckhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_53
			}
		]
	}
	{
		desc_id = GTR63_Neckhead_06
		frontend_desc = qs(0x866cea3f)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR63_Neckhead_06`
		pak_num = 0
		materials = [
			GTR63_Neckhead_06_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03`
				material = GTR63_Neckhead_06_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR4_Neckhead_03
					}
					{
						$preset_layer_fades
						mask = $GTR4_Neckhead_03_fades
					}
					{
						$preset_layer_details
						mask = $GTR4_Neckhead_03_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_53
			}
		]
	}
	{
		desc_id = GTR63f_Neckhead
		frontend_desc = qs(0xb11049e5)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR63f_Neckhead`
		pak_num = 0
		materials = [
			GTR63f_Neckhead_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr63f_neckhead_d`
				material = GTR63f_Neckhead_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR63f_Neckhead
					}
					{
						$preset_layer_fades
						mask = $GTR62_Neckhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR62_Neckhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR64_Neckhead
		frontend_desc = qs(0x5782ad70)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/gtr64_neckhead`
		pak_num = 0
		materials = [
			gtr64_neckhead_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr64_neckhead_d`
				material = gtr64_neckhead_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR64_Neckhead
					}
					{
						$preset_layer_fades
						mask = $GTR64_Neckhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR64_Neckhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_55
			}
		]
	}
	{
		desc_id = gtr64_neckhead2
		frontend_desc = qs(0xab224c92)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/gtr64_neckhead2`
		pak_num = 0
		materials = [
			gtr64_neckhead2_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr60_d_neckhead`
				material = gtr64_neckhead2_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR60_Neckhead
					}
					{
						$preset_layer_fades
						mask = $GTR60_Neckhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR60_Neckhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_54
			}
		]
	}
	{
		desc_id = gtr64_neckhead3
		frontend_desc = qs(0xb11049e5)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/gtr64_neckhead3`
		pak_num = 0
		materials = [
			gtr64_neckhead3_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr62_d_neckhead`
				material = gtr64_neckhead3_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR62_Neckhead
					}
					{
						$preset_layer_fades
						mask = $GTR62_Neckhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR62_Neckhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR64_Neckhead_04
		frontend_desc = qs(0x6de4a5a9)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR64_Neckhead_04`
		pak_num = 0
		materials = [
			GTR64_Neckhead_04_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_01`
				material = GTR64_Neckhead_04_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR4_Neckhead
					}
					{
						$preset_layer_fades
						mask = $GTR4_Neckhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR4_Neckhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_53
			}
		]
	}
	{
		desc_id = GTR64_Neckhead_05
		frontend_desc = qs(0xb104e40c)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR64_Neckhead_05`
		pak_num = 0
		materials = [
			GTR64_Neckhead_05_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr9_neckhead_d_01`
				material = GTR64_Neckhead_05_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR9_Neckhead
					}
					{
						$preset_layer_fades
						mask = $GTR9_Neckhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR9_Neckhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_53
			}
		]
	}
	{
		desc_id = GTR64_Neckhead_06
		frontend_desc = qs(0x866cea3f)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR64_Neckhead_06`
		pak_num = 0
		materials = [
			GTR64_Neckhead_06_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/esp/gtr4_neckhead_d_03`
				material = GTR64_Neckhead_06_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR4_Neckhead_03
					}
					{
						$preset_layer_fades
						mask = $GTR4_Neckhead_03_fades
					}
					{
						$preset_layer_details
						mask = $GTR4_Neckhead_03_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_53
			}
		]
	}
	{
		desc_id = GTR66_Neckhead
		frontend_desc = qs(0xa956861e)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR66_Neckhead`
		pak_num = 0
		materials = [
			GTR66_Neckhead_Hardware
		]
	}
	{
		desc_id = GTR1_Sch_Neckhead_1
		frontend_desc = qs(0xf5902c55)
		sponsor_id = Schecter
		mesh = `models/CAR_Instruments/Guitar/schecter/GTR1_Sch_Neckhead_1`
		pak_num = 0
		materials = [
			GTR1_Sch_Neckhead_1_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Schecter/gtr1_sch_neckhead_d_01`
				material = GTR1_Sch_Neckhead_1_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR1_Sch_Neckhead_1
					}
					{
						$preset_layer_fades
						mask = $GTR1_Sch_Neckhead_1_fades
					}
					{
						$preset_layer_details
						mask = $GTR1_Sch_Neckhead_1_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR1_Sch_Neckhead_2
		frontend_desc = qs(0xdca62e7e)
		sponsor_id = Schecter
		mesh = `models/CAR_Instruments/Guitar/schecter/GTR1_Sch_Neckhead_2`
		pak_num = 0
		materials = [
			GTR1_Sch_Neckhead_2_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Schecter/gtr71_neckhead_01_d`
				material = GTR1_Sch_Neckhead_2_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR71_Neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr71_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr71_neckhead_01_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR1_Sch_Neckhead_3
		frontend_desc = qs(0x4b945d02)
		sponsor_id = Schecter
		mesh = `models/CAR_Instruments/Guitar/schecter/GTR1_Sch_Neckhead_3`
		pak_num = 0
		materials = [
			GTR1_Sch_Neckhead_3_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Schecter/gtr72_neckhead_01_d`
				material = GTR1_Sch_Neckhead_3_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR72_Neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr72_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr72_neckhead_01_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR1_Sch_Neckhead_4
		frontend_desc = qs(0x0f2dfd1a)
		sponsor_id = Schecter
		mesh = `models/CAR_Instruments/Guitar/schecter/GTR1_Sch_Neckhead_4`
		pak_num = 0
		materials = [
			GTR1_Sch_Neckhead_4_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Schecter/gtr74_neckhead_01_d`
				material = GTR1_Sch_Neckhead_4_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR74_Neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr74_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr74_neckhead_01_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR70_neckhead
		frontend_desc = qs(0xe3c9a327)
		sponsor_id = Schecter
		mesh = `models/CAR_Instruments/Guitar/schecter/GTR70_neckhead`
		pak_num = 0
		materials = [
			GTR70_neckhead_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Schecter/gtr70_neckhead_d`
				material = GTR70_neckhead_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR70_neckhead
					}
					{
						$preset_layer_fades
						mask = $GTR70_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR70_neckhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR70_neckhead_02b
		frontend_desc = qs(0xdca62e7e)
		sponsor_id = Schecter
		mesh = `models/CAR_Instruments/Guitar/schecter/GTR70_neckhead_02b`
		pak_num = 0
		materials = [
			GTR70_neckhead_02b_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Schecter/gtr71_neckhead_01_d`
				material = GTR70_neckhead_02b_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR71_Neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr71_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr71_neckhead_01_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR70_neckhead_03
		frontend_desc = qs(0x4b945d02)
		sponsor_id = Schecter
		mesh = `models/CAR_Instruments/Guitar/schecter/GTR70_neckhead_03`
		pak_num = 0
		materials = [
			GTR70_neckhead_03_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Schecter/gtr72_neckhead_01_d`
				material = GTR70_neckhead_03_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR72_Neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr72_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr72_neckhead_01_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR70_neckhead_04
		frontend_desc = qs(0x0f2dfd1a)
		sponsor_id = Schecter
		mesh = `models/CAR_Instruments/Guitar/schecter/GTR70_neckhead_04`
		pak_num = 0
		materials = [
			GTR70_neckhead_04_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Schecter/gtr74_neckhead_01_d`
				material = GTR70_neckhead_04_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR74_Neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr74_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr74_neckhead_01_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR71_Neckhead_01
		frontend_desc = qs(0xdca62e7e)
		sponsor_id = Schecter
		mesh = `models/CAR_Instruments/Guitar/schecter/GTR71_Neckhead_01`
		pak_num = 0
		materials = [
			GTR71_Neckhead_01_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Schecter/gtr71_neckhead_01_d`
				material = GTR71_Neckhead_01_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR71_Neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr71_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr71_neckhead_01_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR71_Neckhead_02
		frontend_desc = qs(0xe3c9a327)
		sponsor_id = Schecter
		mesh = `models/CAR_Instruments/Guitar/schecter/GTR71_Neckhead_02`
		pak_num = 0
		materials = [
			GTR71_Neckhead_02_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Schecter/gtr70_neckhead_d`
				material = GTR71_Neckhead_02_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR70_neckhead
					}
					{
						$preset_layer_fades
						mask = $GTR70_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR70_neckhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR71_Neckhead_03
		frontend_desc = qs(0x4b945d02)
		sponsor_id = Schecter
		mesh = `models/CAR_Instruments/Guitar/schecter/GTR71_Neckhead_03`
		pak_num = 0
		materials = [
			GTR71_Neckhead_03_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Schecter/gtr72_neckhead_01_d`
				material = GTR71_Neckhead_03_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR72_Neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr72_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr72_neckhead_01_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR71_Neckhead_04
		frontend_desc = qs(0x0f2dfd1a)
		sponsor_id = Schecter
		mesh = `models/CAR_Instruments/Guitar/schecter/GTR71_Neckhead_04`
		pak_num = 0
		materials = [
			GTR71_Neckhead_04_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Schecter/gtr74_neckhead_01_d`
				material = GTR71_Neckhead_04_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR74_Neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr74_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr74_neckhead_01_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR72_Neckhead_01
		frontend_desc = qs(0x4b945d02)
		sponsor_id = Schecter
		mesh = `models/CAR_Instruments/Guitar/schecter/GTR72_Neckhead_01`
		pak_num = 0
		materials = [
			GTR72_Neckhead_01_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Schecter/gtr72_neckhead_01_d`
				material = GTR72_Neckhead_01_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR72_Neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr72_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr72_neckhead_01_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = gtr72_neckhead_02
		frontend_desc = qs(0xe3c9a327)
		sponsor_id = Schecter
		mesh = `models/CAR_Instruments/Guitar/schecter/gtr72_neckhead_02`
		pak_num = 0
		materials = [
			gtr72_neckhead_02_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Schecter/gtr70_neckhead_d`
				material = gtr72_neckhead_02_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR70_neckhead
					}
					{
						$preset_layer_fades
						mask = $GTR70_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR70_neckhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = gtr72_neckhead_03
		frontend_desc = qs(0xdca62e7e)
		sponsor_id = Schecter
		mesh = `models/CAR_Instruments/Guitar/schecter/gtr72_neckhead_03`
		pak_num = 0
		materials = [
			gtr72_neckhead_03_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Schecter/gtr71_neckhead_01_d`
				material = gtr72_neckhead_03_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR71_Neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr71_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr71_neckhead_01_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = gtr72_neckhead_04
		frontend_desc = qs(0x0f2dfd1a)
		sponsor_id = Schecter
		mesh = `models/CAR_Instruments/Guitar/schecter/gtr72_neckhead_04`
		pak_num = 0
		materials = [
			gtr72_neckhead_04_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Schecter/gtr74_neckhead_01_d`
				material = gtr72_neckhead_04_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR74_Neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr74_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr74_neckhead_01_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR73_Neckhead_01
		frontend_desc = qs(0xdf702ce5)
		sponsor_id = Schecter
		mesh = `models/CAR_Instruments/Guitar/schecter/GTR73_Neckhead_01`
		pak_num = 0
		materials = [
			GTR73_Neckhead_01_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Schecter/gtr73_neckhead_d`
				material = GTR73_Neckhead_01_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR73_Neckhead_01
					}
					{
						$preset_layer_fades
						mask = $GTR73_Neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $GTR73_Neckhead_01_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR73_Neckhead_02
		frontend_desc = qs(0xdca62e7e)
		sponsor_id = Schecter
		mesh = `models/CAR_Instruments/Guitar/schecter/GTR73_Neckhead_02`
		pak_num = 0
		materials = [
			GTR73_Neckhead_02_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Schecter/gtr71_neckhead_01_d`
				material = GTR73_Neckhead_02_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR71_Neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr71_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr71_neckhead_01_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = gtr73_neckhead_03
		frontend_desc = qs(0x4b945d02)
		sponsor_id = Schecter
		mesh = `models/CAR_Instruments/Guitar/schecter/gtr73_neckhead_03`
		pak_num = 0
		materials = [
			gtr73_neckhead_03_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Schecter/gtr72_neckhead_01_d`
				material = gtr73_neckhead_03_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR72_Neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr72_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr72_neckhead_01_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = gtr73_neckhead_04
		frontend_desc = qs(0x0f2dfd1a)
		sponsor_id = Schecter
		mesh = `models/CAR_Instruments/Guitar/schecter/gtr73_neckhead_04`
		pak_num = 0
		materials = [
			gtr73_neckhead_04_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Schecter/gtr74_neckhead_01_d`
				material = gtr73_neckhead_04_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR74_Neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr74_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr74_neckhead_01_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR73_Neckhead_05
		frontend_desc = qs(0x83dbb173)
		mesh = `models/CAR_Instruments/Guitar/schecter/GTR73_Neckhead_05`
		pak_num = 0
		materials = [
			GTR73_Neckhead_05_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Schecter/GTR73_Neckhead_05_d`
				material = GTR73_Neckhead_05_Primary
				$car_rocker_guitars_factoredGlobal_56
			}
		]
		hidden
	}
	{
		desc_id = GTR74_Neckhead_01
		frontend_desc = qs(0x0f2dfd1a)
		sponsor_id = Schecter
		mesh = `models/CAR_Instruments/Guitar/schecter/GTR74_Neckhead_01`
		pak_num = 0
		materials = [
			GTR74_Neckhead_01_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Schecter/gtr74_neckhead_01_d`
				material = GTR74_Neckhead_01_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR74_Neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr74_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr74_neckhead_01_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR74_Neckhead_02
		frontend_desc = qs(0xe3c9a327)
		sponsor_id = Schecter
		mesh = `models/CAR_Instruments/Guitar/schecter/GTR74_Neckhead_02`
		pak_num = 0
		materials = [
			GTR74_Neckhead_02_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Schecter/gtr70_neckhead_d`
				material = GTR74_Neckhead_02_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR70_neckhead
					}
					{
						$preset_layer_fades
						mask = $GTR70_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR70_neckhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR74_Neckhead_03
		frontend_desc = qs(0xdca62e7e)
		sponsor_id = Schecter
		mesh = `models/CAR_Instruments/Guitar/schecter/GTR74_Neckhead_03`
		pak_num = 0
		materials = [
			GTR74_Neckhead_03_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Schecter/gtr71_neckhead_01_d`
				material = GTR74_Neckhead_03_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR71_Neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr71_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr71_neckhead_01_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR74_Neckhead_04
		frontend_desc = qs(0x4b945d02)
		sponsor_id = Schecter
		mesh = `models/CAR_Instruments/Guitar/schecter/GTR74_Neckhead_04`
		pak_num = 0
		materials = [
			GTR74_Neckhead_04_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Schecter/gtr72_neckhead_01_d`
				material = GTR74_Neckhead_04_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR72_Neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr72_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr72_neckhead_01_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR20_Neckhead_Beast1
		frontend_desc = qs(0xb54a02f2)
		mesh = `models/CAR_Instruments/Guitar/BC_Rich/GTR20_Neckhead_Beast1`
		sponsor_id = `BC	Rich`
		pak_num = 0
		materials = [
			GTR20_Neckhead_Beast1_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/BC_Rich/gtr20_neckhead_beast1_d`
				material = GTR20_Neckhead_Beast1_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR20_Neckhead_Beast1_Finishes
					}
					{
						$preset_layer_fades
						mask = $GTR20_Neckhead_Beast1_Fades
					}
					{
						$preset_layer_details
						mask = $GTR20_Neckhead_Beast1_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR20_Neckhead_Warlock2
		frontend_desc = qs(0xc70d3926)
		mesh = `models/CAR_Instruments/Guitar/BC_Rich/GTR20_Neckhead_Warlock2`
		sponsor_id = `BC	Rich`
		pak_num = 0
		materials = [
			GTR20_Neckhead_Warlock2_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/BC_Rich/GTR20_Neckhead_Warlock2_d`
				material = GTR20_Neckhead_Warlock2_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR20_Neckhead_Warlock_Finishes
					}
					{
						$preset_layer_fades
						mask = $GTR20_Neckhead_Warlock_Fades
					}
					{
						$preset_layer_details
						mask = $GTR20_Neckhead_Warlock_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR20_Neckhead_Pointed3
		frontend_desc = qs(0x04bf2ba1)
		mesh = `models/CAR_Instruments/Guitar/BC_Rich/GTR20_Neckhead_Pointed3`
		sponsor_id = `BC	Rich`
		pak_num = 0
		materials = [
			GTR20_Neckhead_pointed3_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/BC_Rich/GTR20_Neckhead_Pointed3_d`
				material = GTR20_Neckhead_pointed3_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR20_Neckhead_Pointed_Finishes
					}
					{
						$preset_layer_fades
						mask = $GTR20_Neckhead_Pointed_Fades
					}
					{
						$preset_layer_details
						mask = $GTR20_Neckhead_Pointed_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR21_Neckhead_Beast2
		frontend_desc = qs(0xb54a02f2)
		mesh = `models/CAR_Instruments/Guitar/BC_Rich/GTR21_Neckhead_Beast2`
		sponsor_id = `BC	Rich`
		pak_num = 0
		materials = [
			GTR21_Neckhead_Beast2_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/BC_Rich/gtr20_neckhead_beast1_d`
				material = GTR21_Neckhead_Beast2_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR20_Neckhead_Beast1_Finishes
					}
					{
						$preset_layer_fades
						mask = $GTR20_Neckhead_Beast1_Fades
					}
					{
						$preset_layer_details
						mask = $GTR20_Neckhead_Beast1_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR21_Neckhead_Warlock3
		frontend_desc = qs(0xc70d3926)
		sponsor_id = `BC	Rich`
		mesh = `models/CAR_Instruments/Guitar/BC_Rich/GTR21_Neckhead_Warlock3`
		pak_num = 0
		materials = [
			GTR21_Neckhead_Warlock3_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/BC_Rich/GTR20_Neckhead_Warlock2_d`
				material = GTR21_Neckhead_Warlock3_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR20_Neckhead_Warlock_Finishes
					}
					{
						$preset_layer_fades
						mask = $GTR20_Neckhead_Warlock_Fades
					}
					{
						$preset_layer_details
						mask = $GTR20_Neckhead_Warlock_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR21_Neckhead_Pointed4
		frontend_desc = qs(0x04bf2ba1)
		mesh = `models/CAR_Instruments/Guitar/BC_Rich/GTR21_Neckhead_Pointed4`
		sponsor_id = `BC	Rich`
		pak_num = 0
		materials = [
			GTR21_Neckhead_Pointed4_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/BC_Rich/GTR20_Neckhead_Pointed3_d`
				material = GTR21_Neckhead_Pointed4_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR20_Neckhead_Pointed_Finishes
					}
					{
						$preset_layer_fades
						mask = $GTR20_Neckhead_Pointed_Fades
					}
					{
						$preset_layer_details
						mask = $GTR20_Neckhead_Pointed_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR22_Neckhead_Beast3
		frontend_desc = qs(0xb54a02f2)
		sponsor_id = `BC	Rich`
		mesh = `models/CAR_Instruments/Guitar/BC_Rich/GTR22_Neckhead_Beast3`
		pak_num = 0
		materials = [
			GTR22_Neckhead_Beast3_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/BC_Rich/gtr20_neckhead_beast1_d`
				material = GTR22_Neckhead_Beast3_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR20_Neckhead_Beast1_Finishes
					}
					{
						$preset_layer_fades
						mask = $GTR20_Neckhead_Beast1_Fades
					}
					{
						$preset_layer_details
						mask = $GTR20_Neckhead_Beast1_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR22_Neckhead_Warlock4
		frontend_desc = qs(0xc70d3926)
		sponsor_id = `BC	Rich`
		mesh = `models/CAR_Instruments/Guitar/BC_Rich/GTR22_Neckhead_Warlock4`
		pak_num = 0
		materials = [
			GTR22_Neckhead_Warlock4_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/BC_Rich/GTR20_Neckhead_Warlock2_d`
				material = GTR22_Neckhead_Warlock4_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR20_Neckhead_Warlock_Finishes
					}
					{
						$preset_layer_fades
						mask = $GTR20_Neckhead_Warlock_Fades
					}
					{
						$preset_layer_details
						mask = $GTR20_Neckhead_Warlock_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR22_Neckhead_Pointed5
		frontend_desc = qs(0x04bf2ba1)
		sponsor_id = `BC	Rich`
		mesh = `models/CAR_Instruments/Guitar/BC_Rich/GTR22_Neckhead_Pointed5`
		pak_num = 0
		materials = [
			GTR22_Neckhead_Pointed5_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/BC_Rich/GTR20_Neckhead_Pointed3_d`
				material = GTR22_Neckhead_Pointed5_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR20_Neckhead_Pointed_Finishes
					}
					{
						$preset_layer_fades
						mask = $GTR20_Neckhead_Pointed_Fades
					}
					{
						$preset_layer_details
						mask = $GTR20_Neckhead_Pointed_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR10_Neckhead_McSwain1
		frontend_desc = qs(0xbaaefe3d)
		sponsor_id = McSwain
		mesh = `models/CAR_Instruments/Guitar/McSwain/GTR10_Neckhead_McSwain1`
		pak_num = 0
		materials = [
			GTR10_Neckhead_McSwain_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/McSwain/gtr10_neckhead_mcswain1_d`
				material = GTR10_Neckhead_McSwain_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR10_McSwn_Nkhd_Finishes
					}
					{
						$preset_layer_fades
						mask = $GTR10_McSwn_Nkhd_Fades
					}
					{
						$preset_layer_details
						mask = $GTR10_McSwn_Nkhd_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR12_Neckhead_McSwain12
		frontend_desc = qs(0x976a0248)
		sponsor_id = McSwain
		mesh = `models/CAR_Instruments/Guitar/McSwain/GTR12_Neckhead_McSwain12`
		pak_num = 0
		materials = [
			GTR12_Neckhead_McSwain12_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/McSwain/gtr12_neckhead_mcswain_d`
				material = GTR12_Neckhead_McSwain12_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR12_McSwn_Nkhd_Finishes
					}
					{
						$preset_layer_fades
						mask = $GTR12_McSwn_Nkhd_Fades
					}
					{
						$preset_layer_details
						mask = $GTR12_McSwn_Nkhd_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR14_Neckhead_McSwain3
		frontend_desc = qs(0x2d9a1287)
		sponsor_id = McSwain
		mesh = `models/CAR_Instruments/Guitar/McSwain/GTR14_Neckhead_McSwain3`
		pak_num = 0
		materials = [
			GTR10_Neckhead_McSwain_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/McSwain/gtr10_neckhead_mcswain1_d`
				material = GTR10_Neckhead_McSwain_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR10_McSwn_Nkhd_Finishes
					}
					{
						$preset_layer_fades
						mask = $GTR10_McSwn_Nkhd_Fades
					}
					{
						$preset_layer_details
						mask = $GTR10_McSwn_Nkhd_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR14_Neckhead_McSwain4
		frontend_desc = qs(0x06b74144)
		sponsor_id = McSwain
		mesh = `models/CAR_Instruments/Guitar/McSwain/GTR14_Neckhead_McSwain4`
		pak_num = 0
		materials = [
			GTR13_Neckhead_McSwain_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/McSwain/gtr12_neckhead_mcswain_d`
				material = GTR13_Neckhead_McSwain_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR12_McSwn_Nkhd_Finishes
					}
					{
						$preset_layer_fades
						mask = $GTR12_McSwn_Nkhd_Fades
					}
					{
						$preset_layer_details
						mask = $GTR12_McSwn_Nkhd_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR75_Neckhead_01
		frontend_desc = qs(0x34683b85)
		sponsor_id = Ibanez
		mesh = `models/CAR_Instruments/Guitar/Ibanez/GTR75_Neckhead_01`
		pak_num = 0
		materials = [
			GTR75_Neckhead_01_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR75_Neckhead_d`
				material = GTR75_Neckhead_01_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR75_Neckhead_01
					}
					{
						$preset_layer_fades
						mask = $GTR75_Neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $GTR75_Neckhead_01_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR75_Neckhead_02
		frontend_desc = qs(0x3c35558b)
		sponsor_id = Ibanez
		mesh = `models/CAR_Instruments/Guitar/Ibanez/GTR75_Neckhead_02`
		pak_num = 0
		materials = [
			GTR75_Neckhead_01_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR75_Neckhead_d`
				material = GTR75_Neckhead_01_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR75_Neckhead_01
					}
					{
						$preset_layer_fades
						mask = $GTR75_Neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $GTR75_Neckhead_01_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR75_Neckhead_03
		frontend_desc = qs(0x69ae2964)
		sponsor_id = Ibanez
		mesh = `models/CAR_Instruments/Guitar/Ibanez/GTR75_Neckhead_03`
		pak_num = 0
		materials = [
			GTR75_Neckhead_03_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR75_Neckhead_03_d`
				material = GTR75_Neckhead_03_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR75_Neckhead_03
					}
					{
						$preset_layer_fades
						mask = $GTR75_Neckhead_03_fades
					}
					{
						$preset_layer_details
						mask = $GTR75_Neckhead_03_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_61
			}
		]
	}
	{
		desc_id = GTR75_Neckhead_04
		frontend_desc = qs(0xe9a505b2)
		sponsor_id = Ibanez
		mesh = `models/CAR_Instruments/Guitar/Ibanez/GTR75_Neckhead_04`
		pak_num = 0
		materials = [
			GTR75_Neckhead_03_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR75_Neckhead_03_d`
				material = GTR75_Neckhead_03_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR75_Neckhead_03
					}
					{
						$preset_layer_fades
						mask = $GTR75_Neckhead_03_fades
					}
					{
						$preset_layer_details
						mask = $GTR75_Neckhead_03_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_61
			}
		]
	}
	{
		desc_id = GTR76_Neckhead_01
		frontend_desc = qs(0x4f9f9c1d)
		sponsor_id = Ibanez
		mesh = `models/CAR_Instruments/Guitar/Ibanez/GTR76_Neckhead_01`
		pak_num = 0
		materials = [
			GTR76_Neckhead_01_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR76_Neckhead_d`
				material = GTR76_Neckhead_01_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR76_Neckhead_01
					}
					{
						$preset_layer_fades
						mask = $GTR76_Neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $GTR76_Neckhead_01_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR76_Neckhead_02
		frontend_desc = qs(0x941c455d)
		sponsor_id = Ibanez
		mesh = `models/CAR_Instruments/Guitar/Ibanez/GTR76_Neckhead_02`
		pak_num = 0
		materials = [
			GTR76_Neckhead_01_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR76_Neckhead_d`
				material = GTR76_Neckhead_01_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR76_Neckhead_01
					}
					{
						$preset_layer_fades
						mask = $GTR76_Neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $GTR76_Neckhead_01_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR76_Neckhead_03
		frontend_desc = qs(0xeb5b60d8)
		sponsor_id = Ibanez
		mesh = `models/CAR_Instruments/Guitar/Ibanez/GTR76_Neckhead_03`
		pak_num = 0
		materials = [
			GTR76_Neckhead_03_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR76_Neckhead_03_d`
				material = GTR76_Neckhead_03_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR76_Neckhead_03
					}
					{
						$preset_layer_fades
						mask = $GTR76_Neckhead_03_fades
					}
					{
						$preset_layer_details
						mask = $GTR76_Neckhead_03_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_61
			}
		]
	}
	{
		desc_id = GTR76_Neckhead_04
		frontend_desc = qs(0x82c5ab94)
		sponsor_id = Ibanez
		mesh = `models/CAR_Instruments/Guitar/Ibanez/GTR76_Neckhead_04`
		pak_num = 0
		materials = [
			GTR76_Neckhead_03_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR76_Neckhead_03_d`
				material = GTR76_Neckhead_03_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR76_Neckhead_03
					}
					{
						$preset_layer_fades
						mask = $GTR76_Neckhead_03_fades
					}
					{
						$preset_layer_details
						mask = $GTR76_Neckhead_03_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_61
			}
		]
	}
	{
		desc_id = GTR77_Neckhead_01
		frontend_desc = qs(0x14b58055)
		sponsor_id = Ibanez
		mesh = `models/CAR_Instruments/Guitar/Ibanez/GTR77_Neckhead_01`
		pak_num = 0
		materials = [
			GTR77_Neckhead_01_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR75_Neckhead_d`
				material = GTR77_Neckhead_01_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR75_Neckhead_01
					}
					{
						$preset_layer_fades
						mask = $GTR75_Neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $GTR75_Neckhead_01_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR77_Neckhead_02
		frontend_desc = qs(0xaf7120f6)
		sponsor_id = Ibanez
		mesh = `models/CAR_Instruments/Guitar/Ibanez/GTR77_Neckhead_02`
		pak_num = 0
		materials = [
			GTR77_Neckhead_01_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR75_Neckhead_d`
				material = GTR77_Neckhead_01_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR75_Neckhead_01
					}
					{
						$preset_layer_fades
						mask = $GTR75_Neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $GTR75_Neckhead_01_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR77_Neckhead_03
		frontend_desc = qs(0x9b70ab40)
		sponsor_id = Ibanez
		mesh = `models/CAR_Instruments/Guitar/Ibanez/GTR77_Neckhead_03`
		pak_num = 0
		materials = [
			GTR77_Neckhead_03_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR75_Neckhead_03_d`
				material = GTR77_Neckhead_03_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR75_Neckhead_03
					}
					{
						$preset_layer_fades
						mask = $GTR75_Neckhead_03_fades
					}
					{
						$preset_layer_details
						mask = $GTR75_Neckhead_03_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_61
			}
		]
	}
	{
		desc_id = GTR77_Neckhead_04
		frontend_desc = qs(0x2403da9b)
		sponsor_id = Ibanez
		mesh = `models/CAR_Instruments/Guitar/Ibanez/GTR77_Neckhead_04`
		pak_num = 0
		materials = [
			GTR77_Neckhead_03_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR75_Neckhead_03_d`
				material = GTR77_Neckhead_03_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR75_Neckhead_03
					}
					{
						$preset_layer_fades
						mask = $GTR75_Neckhead_03_fades
					}
					{
						$preset_layer_details
						mask = $GTR75_Neckhead_03_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_61
			}
		]
	}
	{
		desc_id = GTR78_Neckhead
		frontend_desc = qs(0x3ae4e846)
		mesh = `models/CAR_Instruments/Guitar/Ibanez/GTR78_Neckhead`
		pak_num = 0
		materials = [
			GTR78_Neckhead_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR78_Neckhead_d`
				material = GTR78_Neckhead_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR75_Neckhead_01
					}
					{
						$preset_layer_fades
						mask = $GTR75_Neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $GTR75_Neckhead_01_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR90_DR_Neckhead01
		frontend_desc = qs(0xafebdc3f)
		sponsor_id = Daisy
		mesh = `models/CAR_Instruments/Guitar/DaisyRock/GTR90_DR_Neckhead01`
		pak_num = 0
		materials = [
			GTR90_DR_Neckhead01_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/DaisyRock/gtr90_neckhead01_d`
				material = GTR90_DR_Neckhead01_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR90_DR_Neckhead01
					}
					{
						$preset_layer_fades
						mask = $GTR90_DR_Neckhead01_fades
					}
					{
						$preset_layer_details
						mask = $GTR90_DR_Neckhead01_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR90_DR_Neckhead02
		frontend_desc = qs(0x3a384df0)
		sponsor_id = Daisy
		mesh = `models/CAR_Instruments/Guitar/DaisyRock/GTR90_DR_Neckhead02`
		pak_num = 0
		materials = [
			GTR90_DR_Neckhead02_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/DaisyRock/gtr93_neckhead01_d`
				material = GTR90_DR_Neckhead02_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR93_DR_Neckhead01b
					}
					{
						$preset_layer_fades
						mask = $GTR93_DR_Neckhead01_fades
					}
					{
						$preset_layer_details
						mask = $GTR93_DR_Neckhead01_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR91_DR_Neckhead01
		frontend_desc = qs(0xafebdc3f)
		sponsor_id = Daisy
		mesh = `models/CAR_Instruments/Guitar/DaisyRock/GTR91_DR_Neckhead01`
		pak_num = 0
		materials = [
			GTR91_DR_Neckhead01_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/DaisyRock/gtr90_neckhead01_d`
				material = GTR91_DR_Neckhead01_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR90_DR_Neckhead01
					}
					{
						$preset_layer_fades
						mask = $GTR90_DR_Neckhead01_fades
					}
					{
						$preset_layer_details
						mask = $GTR90_DR_Neckhead01_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR91_DR_Neckhead02
		frontend_desc = qs(0x3a384df0)
		sponsor_id = Daisy
		mesh = `models/CAR_Instruments/Guitar/DaisyRock/GTR91_DR_Neckhead02`
		pak_num = 0
		materials = [
			GTR91_DR_Neckhead02_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/DaisyRock/gtr93_neckhead01_d`
				material = GTR91_DR_Neckhead02_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR93_DR_Neckhead01b
					}
					{
						$preset_layer_fades
						mask = $GTR93_DR_Neckhead01_fades
					}
					{
						$preset_layer_details
						mask = $GTR93_DR_Neckhead01_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR92_DR_Neckhead01
		frontend_desc = qs(0xafebdc3f)
		sponsor_id = Daisy
		mesh = `models/CAR_Instruments/Guitar/DaisyRock/GTR92_DR_Neckhead01`
		pak_num = 0
		materials = [
			GTR92_DR_Neckhead01_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/DaisyRock/gtr90_neckhead01_d`
				material = GTR92_DR_Neckhead01_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR90_DR_Neckhead01b
					}
					{
						$preset_layer_fades
						mask = $GTR90_DR_Neckhead01_fades
					}
					{
						$preset_layer_details
						mask = $GTR90_DR_Neckhead01_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR92_DR_Neckhead02
		frontend_desc = qs(0x3a384df0)
		sponsor_id = Daisy
		mesh = `models/CAR_Instruments/Guitar/DaisyRock/GTR92_DR_Neckhead02`
		pak_num = 0
		materials = [
			GTR92_DR_Neckhead02_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/DaisyRock/gtr93_neckhead01_d`
				material = GTR92_DR_Neckhead02_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR93_DR_Neckhead01b
					}
					{
						$preset_layer_fades
						mask = $GTR93_DR_Neckhead01_fades
					}
					{
						$preset_layer_details
						mask = $GTR93_DR_Neckhead01_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR93_DR_Neckhead01
		frontend_desc = qs(0x3a384df0)
		sponsor_id = Daisy
		mesh = `models/CAR_Instruments/Guitar/DaisyRock/GTR93_DR_Neckhead01`
		pak_num = 0
		materials = [
			GTR93_DR_Neckhead01_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/DaisyRock/gtr93_neckhead01_d`
				material = GTR93_DR_Neckhead01_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR93_DR_Neckhead01
					}
					{
						$preset_layer_fades
						mask = $GTR93_DR_Neckhead01_fades
					}
					{
						$preset_layer_details
						mask = $GTR93_DR_Neckhead01_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR93_DR_Neckhead02
		frontend_desc = qs(0xafebdc3f)
		sponsor_id = Daisy
		mesh = `models/CAR_Instruments/Guitar/DaisyRock/GTR93_DR_Neckhead02`
		pak_num = 0
		materials = [
			GTR93_DR_Neckhead02_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/DaisyRock/gtr90_neckhead01_d`
				material = GTR93_DR_Neckhead02_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR90_DR_Neckhead01
					}
					{
						$preset_layer_fades
						mask = $GTR90_DR_Neckhead01_fades
					}
					{
						$preset_layer_details
						mask = $GTR90_DR_Neckhead01_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR94_DR_Neckhead01
		frontend_desc = qs(0x3a384df0)
		sponsor_id = Daisy
		mesh = `models/CAR_Instruments/Guitar/DaisyRock/GTR94_DR_Neckhead01`
		pak_num = 0
		materials = [
			GTR94_DR_Neckhead01_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/DaisyRock/gtr93_neckhead01_d`
				material = GTR94_DR_Neckhead01_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR93_DR_Neckhead01c
					}
					{
						$preset_layer_fades
						mask = $GTR93_DR_Neckhead01_fades
					}
					{
						$preset_layer_details
						mask = $GTR93_DR_Neckhead01_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR94_DR_Neckhead02
		frontend_desc = qs(0xafebdc3f)
		sponsor_id = Daisy
		mesh = `models/CAR_Instruments/Guitar/DaisyRock/GTR94_DR_Neckhead02`
		pak_num = 0
		materials = [
			GTR94_DR_Neckhead02_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/DaisyRock/gtr90_neckhead01_d`
				material = GTR94_DR_Neckhead02_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR90_DR_Neckhead01
					}
					{
						$preset_layer_fades
						mask = $GTR90_DR_Neckhead01_fades
					}
					{
						$preset_layer_details
						mask = $GTR90_DR_Neckhead01_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR78_Neckhead_01
		frontend_desc = qs(0xaacb9118)
		sponsor_id = PRS
		mesh = `models/CAR_Instruments/Guitar/PRS/GTR78_Neckhead_01`
		pak_num = 0
		materials = [
			GTR78_Neckhead_01_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/PRS/GTR78_Neckhead_d`
				material = GTR78_Neckhead_01_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR78_Neckhead_01
					}
					{
						$preset_layer_fades
						mask = $GTR78_Neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $GTR78_Neckhead_01_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR79_Neckhead_01
		frontend_desc = qs(0xfe93cc00)
		sponsor_id = PRS
		mesh = `models/CAR_Instruments/Guitar/PRS/GTR79_Neckhead_01`
		pak_num = 0
		materials = [
			GTR79_Neckhead_01_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/PRS/gtr79_neckhead_01d`
				material = GTR79_Neckhead_01_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR78_Neckhead_01
					}
					{
						$preset_layer_fades
						mask = $GTR78_Neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $GTR78_Neckhead_01_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR80_Neckhead_01
		frontend_desc = qs(0x937f401d)
		sponsor_id = PRS
		mesh = `models/CAR_Instruments/Guitar/PRS/GTR80_Neckhead_01`
		pak_num = 0
		materials = [
			GTR80_Neckhead_01_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/PRS/gtr80_neckhead_01d`
				material = GTR80_Neckhead_01_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR80_Neckhead_01
					}
					{
						$preset_layer_fades
						mask = $GTR80_Neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $GTR80_Neckhead_01_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR81_Neckhead01
		frontend_desc = qs(0x196e726c)
		sponsor_id = PRS
		mesh = `models/CAR_Instruments/Guitar/PRS/GTR81_Neckhead01`
		pak_num = 0
		materials = [
			GTR81_Neckhead_01_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/PRS/gtr81_neckhead_01d`
				material = GTR81_Neckhead_01_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR78_Neckhead_01
					}
					{
						$preset_layer_fades
						mask = $GTR78_Neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $GTR78_Neckhead_01_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR82_Neckhead01
		frontend_desc = qs(0x0e624dd2)
		sponsor_id = PRS
		mesh = `models/CAR_Instruments/Guitar/PRS/GTR82_Neckhead01`
		pak_num = 0
		materials = [
			GTR82_Neckhead_01_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/PRS/gtr82_neckhead_01`
				material = GTR82_Neckhead_01_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR82_Neckhead_01
					}
					{
						$preset_layer_fades
						mask = $GTR82_Neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $GTR82_Neckhead_01_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR83_Neckhead01
		frontend_desc = qs(0x1ae57f5b)
		mesh = `models/CAR_Instruments/Guitar/PRS/GTR83_Neckhead01`
		pak_num = 0
		materials = [
			GTR83_Neckhead_01_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/PRS/gtr83_neckhead_01`
				material = GTR83_Neckhead_01_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR78_Neckhead_01
					}
					{
						$preset_layer_fades
						mask = $GTR78_Neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $GTR78_Neckhead_01_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR84_Neckhead01
		frontend_desc = qs(0xf02b0c3f)
		sponsor_id = `Music	Man`
		mesh = `models/CAR_Instruments/Guitar/MM/GTR84_Neckhead01`
		pak_num = 0
		materials = [
			GTR84_Neckhead_01_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/MM/gtr84_neckhead01`
				material = GTR84_Neckhead_01_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR84_Neckhead_01
					}
					{
						$preset_layer_fades
						mask = $GTR84_Neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $GTR84_Neckhead_01_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = gtr86_Neckhead_01
		frontend_desc = qs(0xf02b0c3f)
		sponsor_id = `Music	Man`
		mesh = `models/CAR_Instruments/Guitar/MM/gtr86_Neckhead_01`
		pak_num = 0
		materials = [
			gtr86_Neckhead_01_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/MM/gtr86_Neckhead_D`
				material = gtr86_Neckhead_01_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr86_Neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr86_Neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr86_Neckhead_01_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR101_Neckhead
		frontend_desc = qs(0x354097d7)
		mesh = `models/CAR_Instruments/Guitar/Heroes/GTR101_Neckhead`
		pak_num = 0
		materials = [
			GTR101_Neckhead_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Heroes/GTR101_Neckhead_D`
				material = GTR101_Neckhead_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR101_Neckhead
					}
					{
						$preset_layer_fades
						mask = $GTR101_Neckhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR101_Neckhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR102_headstock
		frontend_desc = qs(0x20474f06)
		mesh = `models/CAR_Instruments/Guitar/Heroes/GTR102_headstock`
		pak_num = 0
		materials = [
			GTR102_headstock_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Heroes/gtr102_neckhead_d`
				material = GTR102_headstock_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR102_Neckhead
					}
					{
						$preset_layer_fades
						mask = $GTR102_Neckhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR102_Neckhead_Details
					}
				]
			}
		]
	}
	{
		desc_id = GTR103_neckhead
		frontend_desc = qs(0xcb9309cb)
		mesh = `models/CAR_Instruments/Guitar/Heroes/GTR103_neckhead`
		pak_num = 0
		materials = [
			GTR103_neckhead_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Heroes/gtr103_neckhead_d`
				material = GTR103_neckhead_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR103_neckhead
					}
					{
						$preset_layer_fades
						mask = $GTR103_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR103_neckhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR104_neckhead
		frontend_desc = qs(0x96bbf6cd)
		mesh = `models/CAR_Instruments/Guitar/Heroes/GTR104_neckhead`
		pak_num = 0
		materials = [
			GTR104_neckhead_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Heroes/gtr104_neckhead_d`
				material = GTR104_neckhead_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR104_neckhead
					}
					{
						$preset_layer_fades
						mask = $GTR104_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR104_neckhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR120_NHead01
		frontend_desc = qs(0xf449da5d)
		mesh = `models/CAR_Instruments/Guitar/Heroes/GTR120_NHead01`
		pak_num = 0
		materials = [
			GTR120_Nekhed01_Primary
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Heroes/gtr120_nekhed01`
				material = GTR120_Nekhed01_Primary
				preset_layers = [
				]
			}
		]
	}
	{
		desc_id = GTR27_Neckhead_Acoustic
		frontend_desc = qs(0xd0c872b5)
		mesh = `models/CAR_Instruments/Guitar/Heroes/GTR27_Neckhead_Acoustic`
		pak_num = 0
		materials = [
			GTR27_Neckhead_Acoustic_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Heroes/gtr27_neckhead_acoustic_d`
				material = GTR27_Neckhead_Acoustic_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR27_Neckhead_Acoustic_Finishes
					}
					{
						$preset_layer_fades
						mask = $GTR27_Neckhead_Acoustic_Fades
					}
					{
						$preset_layer_details
						mask = $GTR27_Neckhead_Acoustic_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR130_neckhead
		frontend_desc = qs(0x844fc46d)
		mesh = `models/CAR_Instruments/Guitar/taylor/GTR130_neckhead`
		pak_num = 0
		materials = [
			GTR130_neckhead_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/taylor/GTR130_neckhead_D`
				material = GTR130_neckhead_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR130_neckhead
					}
					{
						$preset_layer_fades
						mask = $GTR130_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $GTR130_neckhead_Details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						y_trans = -24
						x_scale = 26
						y_scale = 26
						x_trans = -6
					}
				}
			}
		]
	}
	{
		desc_id = GTR142_neckhead
		frontend_desc = qs(0x1bb6cbf8)
		mesh = `models/CAR_Instruments/Guitar/taylor/GTR142_NeckHead`
		pak_num = 0
		materials = [
			GTR142_NeckHead_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Taylor/gtr142_neckhead001`
				material = GTR142_NeckHead_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR142_neckhead
					}
					{
						$preset_layer_fades
						mask = $GTR142_Neckhead_Fades
					}
					{
						$preset_layer_details
						mask = $GTR142_Neckhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR142T_NeckHead
		frontend_desc = qs(0x1ff5f145)
		mesh = `models/CAR_Instruments/Guitar/taylor/GTR142T_NeckHead`
		pak_num = 0
		materials = [
			GTR142_NeckHead_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Taylor/gtr142_neckhead001`
				material = GTR142_NeckHead_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR142_neckhead
					}
					{
						$preset_layer_fades
						mask = $GTR142_Neckhead_Fades
					}
					{
						$preset_layer_details
						mask = $GTR142_Neckhead_Details
					}
				]
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR25_Neckhead_Manson
		frontend_desc = qs(0x7c45b7a1)
		mesh = `models/CAR_Instruments/Guitar/Manson/GTR25_Neckhead_Manson`
		pak_num = 0
		materials = [
			GTR25_Neckhead_Manson_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Manson/gtr25_neckhead_bellamy_d`
				material = GTR25_Neckhead_Manson_Primary
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
	{
		desc_id = GTR26_Neckhead_Cash
		frontend_desc = qs(0xc3345a1d)
		mesh = `models/CAR_Instruments/Guitar/Cash/GTR26_Neckhead_Cash`
		pak_num = 0
		materials = [
			GTR26_Neckhead_Cash_Hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Cash/gtr26_neckhead_cash_d`
				material = GTR26_Neckhead_Cash_Primary
				$car_rocker_guitars_factoredGlobal_56
			}
		]
	}
]
CAS_Guitar_Pickguards = [
	{
		desc_id = GTR5_Pickguard_01
		frontend_desc = qs(0xea509d4f)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR5_Pickguard_01`
	}
	{
		desc_id = GTR12_Pickguard_01
		frontend_desc = qs(0xf08ae2aa)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR12_Pickguard_01`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr12_pickguard_d_01`
				material = GTR12_Pickguard_01_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR12_Pickguard_01
					}
				]
			}
		]
	}
	{
		desc_id = gtr60_pg4
		frontend_desc = qs(0xffa3c6f7)
		mesh = `models/CAR_Instruments/Guitar/ESP/gtr60_pg4`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr60_pg4_D`
				material = gtr60_pg4_Primary
			}
		]
		hidden
	}
	{
		desc_id = GTR31_PGard
		frontend_desc = qs(0x32d68597)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR31_PGard`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr31_vipepgard_d`
				material = GTR31_PGARD_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR31_PG
					}
				]
			}
		]
	}
	{
		desc_id = GTR36_PGARD
		frontend_desc = qs(0x2bd2f2fd)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR36_PGARD`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr36_pgard`
				material = GTR36_PGARD_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR36_PG
					}
				]
			}
		]
	}
	{
		desc_id = GTR37_PGuard01
		frontend_desc = qs(0x743000b2)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR37_PGuard01`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr37_pguard01_d`
				material = GTR37_PGuard_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR37_PG
					}
				]
			}
		]
	}
	{
		desc_id = GTR62_ESP_PG1b
		frontend_desc = qs(0x6550c8f3)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR62_ESP_PG1b`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/ESP/gtr62_esp_pg1b_d`
				material = GTR62_ESP_PG1b_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR62_ESP_PG1b
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
		desc_id = GTR1_Sch_Pickguard_01
		frontend_desc = qs(0xa811680b)
		mesh = `models/CAR_Instruments/Guitar/Schecter/GTR1_Sch_Pickguard_01`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Schecter/gtr1_sch_pickguard_01`
				material = GTR1_Sch_Pickguard_01_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR1_Sch_PG_1
					}
				]
			}
		]
	}
	{
		desc_id = GTR70_pg
		frontend_desc = qs(0xe3c9a327)
		mesh = `models/CAR_Instruments/Guitar/Schecter/GTR70_pg`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Schecter/gtr70_pg_d`
				material = GTR70_pg_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR70_pg
					}
				]
			}
		]
	}
	{
		desc_id = GTR70_pg2
		frontend_desc = qs(0x88a25034)
		mesh = `models/CAR_Instruments/Guitar/Schecter/GTR70_pg2`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Schecter/gtr70_pg2_d`
				material = GTR70_pg2_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR70_pg2
					}
				]
			}
		]
	}
	{
		desc_id = GTR74_PG1
		frontend_desc = qs(0x0f2dfd1a)
		mesh = `models/CAR_Instruments/Guitar/Schecter/GTR74_PG1`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Schecter/gtr74_pg1_d`
				material = GTR74_PG1_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR74_PG1
					}
				]
			}
		]
	}
	{
		desc_id = GTR73_PG1
		frontend_desc = qs(0xdf702ce5)
		sponsor_id = Schecter
		mesh = `models/CAR_Instruments/Guitar/Schecter/GTR73_PG1`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Schecter/GTR73_PG1_d`
				material = GTR73_PG1_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR73_PG1
					}
				]
			}
		]
	}
	{
		desc_id = GTR77_IBZ_RG_PG
		frontend_desc = qs(0x3ef212e3)
		mesh = `models/CAR_Instruments/Guitar/Ibanez/GTR77_IBZ_RG_PG`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR77_IBZ_RG_PG_d`
				material = GTR77_IBZ_RG_PG_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR77_IBZ_RG_PG
					}
				]
			}
		]
	}
	{
		desc_id = GTR78_PG
		frontend_desc = qs(0x5d74f9f5)
		mesh = `models/CAR_Instruments/Guitar/Ibanez/GTR78_PG`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Ibanez/GTR78_PG_d`
				material = GTR78_PG_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR77_IBZ_RG_PG
					}
				]
			}
		]
	}
	{
		desc_id = GTR90_pg
		frontend_desc = qs(0x354fb259)
		sponsor_id = Daisy
		mesh = `models/CAR_Instruments/Guitar/DaisyRock/GTR90_pg`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/DaisyRock/GTR90_pg_d`
				material = GTR90_pg_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR90_pg
					}
				]
			}
		]
	}
	{
		desc_id = GTR91_pg
		frontend_desc = qs(0x4a78c768)
		sponsor_id = Daisy
		mesh = `models/CAR_Instruments/Guitar/DaisyRock/GTR91_pg`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/DaisyRock/GTR91_pg_d`
				material = GTR91_pg_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR91_pg
					}
				]
			}
		]
	}
	{
		desc_id = GTR92_pg
		frontend_desc = qs(0xec54f9d3)
		sponsor_id = Daisy
		mesh = `models/CAR_Instruments/Guitar/DaisyRock/GTR92_PG`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/DaisyRock/GTR92_pg_d`
				material = GTR92_pg_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR92_pg
					}
				]
			}
		]
	}
	{
		desc_id = GTR94_PG
		frontend_desc = qs(0xff499416)
		sponsor_id = Daisy
		mesh = `models/CAR_Instruments/Guitar/DaisyRock/GTR94_PG`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/DaisyRock/GTR94_pg_d`
				material = GTR94_pg_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR94_PG
					}
				]
			}
		]
	}
	{
		desc_id = GTR81_PGuard
		frontend_desc = qs(0x7a61ace7)
		mesh = `models/CAR_Instruments/Guitar/PRS/GTR81_PGuard`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/PRS/PRS_81_PGuard`
				material = GTR81_PGuard_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR81_PGuard
					}
				]
			}
		]
	}
	{
		desc_id = GTR82_PGuard
		frontend_desc = qs(0x0e624dd2)
		sponsor_id = PRS
		mesh = `models/CAR_Instruments/Guitar/PRS/GTR82_PGuard`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/PRS/PRS_82_PGuard`
				material = GTR82_PGuard_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR82_PGuard
					}
				]
			}
		]
	}
	{
		desc_id = GTR83_PGuard
		frontend_desc = qs(0x1ae57f5b)
		sponsor_id = PRS
		materials = [
			GTR83_PGuard_Primary
		]
		node_meshes = {
			$guitar_misc_nodes
			placements = [
				{
					parents = [
						GTR83_PRS_STLA
					]
					node_set = 3
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/PRS/GTR83_PGuard`
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
		desc_id = GTR_X_Anarc_PickG01
		frontend_desc = qs(0xd1603305)
		mesh = `models/CAR_Instruments/Guitar/Heroes/GTR_X_Anarc_PickG01`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Heroes/pickgrd_body_x_anarchy_d_01`
				material = GTR_X_Anarc_PickG01_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR_X_Anarc_PickG01
					}
				]
			}
		]
	}
	{
		desc_id = GTR_X_Anarc_PickG02
		frontend_desc = qs(0xfa4d60c6)
		mesh = `models/CAR_Instruments/Guitar/Heroes/GTR_X_Anarc_PickG02`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Heroes/pickgrd_body_x_anarchy_d_02`
				material = GTR_X_Anarc_PickG02_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR_X_Anarc_Pckgrd_2
					}
				]
			}
		]
	}
	{
		desc_id = GTR_Body20_PickG01
		frontend_desc = qs(0x9e2838e5)
		mesh = `models/CAR_Instruments/Guitar/Heroes/GTR_Body20_PickG01`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Heroes/pickgrd_body20_d_01`
				material = Pckgrd_Body20_01_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR_Body20_PickG01
					}
				]
			}
		]
	}
	{
		desc_id = GTR_Body20_PickG02
		frontend_desc = qs(0xb5056b26)
		mesh = `models/CAR_Instruments/Guitar/Heroes/GTR_Body20_PickG02`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Heroes/pickgrd_body20_d_02`
				material = Pckgrd_Body20_02_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR_Body20_PickG02
					}
				]
			}
		]
	}
	{
		desc_id = GTR_Body20_PickG03
		frontend_desc = qs(0xac1e5a67)
		mesh = `models/CAR_Instruments/Guitar/Heroes/GTR_Body20_PickG03`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Heroes/pickgrd_body20_d_03`
				material = Pckgrd_Body20_03_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR_Body20_PickG03
					}
				]
			}
		]
	}
	{
		desc_id = GTR_X_Spider_PickG01
		frontend_desc = qs(0x0875fb66)
		mesh = `models/CAR_Instruments/Guitar/Heroes/GTR_X_Spider_PickG01`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Heroes/pickgrd_body_x_spider_d_01`
				material = GTR_X_Spider_PickG01_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR_X_Spider_PickG01
					}
				]
			}
		]
	}
	{
		desc_id = GTR_X_Skull_PickG01
		frontend_desc = qs(0xca374960)
		mesh = `models/CAR_Instruments/Guitar/Heroes/GTR_X_Skull_PickG01`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Heroes/pickgrd_body_x_skull_d_01a`
				material = GTR_X_Skull_PickG01_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR_X_Skull_PickG01
					}
				]
			}
		]
	}
	{
		desc_id = GTR130_PG
		frontend_desc = qs(0xe75afa53)
		mesh = `models/CAR_Instruments/Guitar/Taylor/GTR130_PG`
		cap_textures = [
			{
				base_tex = `tex/models/Car_Instruments/Guitars/Taylor/GTR130_PG_D`
				material = GTR130_PG_Primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $GTR130_PG
					}
				]
			}
		]
	}
]
CAS_Guitar_Pickups = [
	{
		desc_id = GTR_Pkup_Type1_Blk_2
		frontend_desc = qs(0x6a91da12)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Pkup_Type1_Blk_2`
		materials = [
			GTR_Pkup_Type1_Blk_Primary
		]
	}
	{
		desc_id = GTR1_ESP_EMG_Pkup_2
		sponsor_id = EMG
		frontend_desc = qs(0x03c19c14)
		mesh = `models/CAR_Instruments/Guitar/esp/GTR1_ESP_EMG_Pkup_2`
		materials = [
			GTR1_ESP_EMG_Pkup_2_Primary
		]
	}
	{
		desc_id = GTR62_ESP_EMG
		frontend_desc = qs(0x03c19c14)
		sponsor_id = EMG
		mesh = `models/CAR_Instruments/Guitar/esp/GTR62_ESP_EMG`
		materials = [
			GTR62_ESP_EMG_Primary
		]
	}
	{
		desc_id = GTR62_Pkup_Blk
		frontend_desc = qs(0x6a91da12)
		mesh = `models/CAR_Instruments/Guitar/esp/GTR62_Pkup_Blk`
		materials = [
			GTR62_Pkup_Blk_Primary
		]
	}
	{
		desc_id = GTR3_ESP_EMG_Pkup_2
		sponsor_id = EMG
		frontend_desc = qs(0x2dfa7ba5)
		mesh = `models/CAR_Instruments/Guitar/esp/GTR3_ESP_EMG_Pkup_2`
		materials = [
			GTR3_ESP_EMG_Pkup_2_Primary
		]
	}
	{
		desc_id = GTR6_Pkup_Worngold_2
		frontend_desc = qs(0xc1b00264)
		mesh = `models/CAR_Instruments/Guitar/esp/GTR6_Pkup_Worngold_2`
		materials = [
			GTR6_Pkup_Worngold_Primary
		]
	}
	{
		desc_id = GTR30_Pickup_D
		frontend_desc = qs(0x551e5532)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/esp/GTR30_Pickup_D`
		materials = [
			SD_HB_Pickup01_Primary
		]
	}
	{
		desc_id = GTR30_Pickup_E
		frontend_desc = qs(0x2d12cb96)
		sponsor_id = `Seymour	Duncan`
		mesh = `models/CAR_Instruments/Guitar/esp/GTR30_Pickup_E`
		materials = [
			SD_HB_Pickup02_Primary
		]
	}
	{
		desc_id = GTR30_Pickup_F
		frontend_desc = qs(0x19dcb169)
		mesh = `models/CAR_Instruments/Guitar/esp/GTR30_Pickup_F`
		materials = [
			GTR_Pickup_Type3_Primary
		]
	}
	{
		desc_id = GTR30_Pickup_G
		frontend_desc = qs(0x07d2f82d)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/esp/GTR30_Pickup_G`
		materials = [
			GTR36_Pickup01_Primary
		]
	}
	{
		desc_id = GTR30_EMG
		frontend_desc = qs(0xdb31d440)
		sponsor_id = EMG
		mesh = `models/CAR_Instruments/Guitar/esp/GTR30_EMG`
		materials = [
			GTR_EMG_pickup3_Primary
		]
	}
	{
		desc_id = GTR31_Pickup_E
		frontend_desc = qs(0x2d12cb96)
		sponsor_id = `Seymour	Duncan`
		mesh = `models/CAR_Instruments/Guitar/esp/GTR31_Pickup_E`
		materials = [
			SD_HB_Pickup02_Primary
		]
	}
	{
		desc_id = GTR31_Pickup_D
		frontend_desc = qs(0x551e5532)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/esp/GTR31_Pickup_D`
		materials = [
			SD_HB_Pickup01_Primary
		]
	}
	{
		desc_id = GTR31_Pickup_G
		frontend_desc = qs(0x07d2f82d)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/esp/GTR31_Pickup_G`
		materials = [
			GTR36_Pickup01_Primary
		]
	}
	{
		desc_id = GTR31_Pickup_F
		frontend_desc = qs(0x08592cca)
		mesh = `models/CAR_Instruments/Guitar/esp/GTR31_Pickup_F`
		materials = [
			GTR_Pickup_Type3_Primary
		]
	}
	{
		desc_id = GTR31_EMG
		frontend_desc = qs(0xdb31d440)
		sponsor_id = EMG
		mesh = `models/CAR_Instruments/Guitar/esp/GTR31_EMG`
		materials = [
			GTR_EMG_pickup3_Primary
		]
	}
	{
		desc_id = GTR32_Pickup_F
		frontend_desc = qs(0x08592cca)
		mesh = `models/CAR_Instruments/Guitar/esp/GTR32_Pickup_F`
		materials = [
			GTR_Pickup_Type3_Primary
		]
	}
	{
		desc_id = GTR32_Pickup_G
		frontend_desc = qs(0x07d2f82d)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/esp/GTR32_Pickup_G`
		materials = [
			GTR36_Pickup01_Primary
		]
	}
	{
		desc_id = GTR32_EMG
		frontend_desc = qs(0xdb31d440)
		sponsor_id = EMG
		mesh = `models/CAR_Instruments/Guitar/esp/GTR32_EMG`
		materials = [
			GTR_EMG_pickup3_Primary
		]
	}
	{
		desc_id = GTR33_EMG
		frontend_desc = qs(0xdb31d440)
		sponsor_id = EMG
		mesh = `models/CAR_Instruments/Guitar/esp/GTR33_Pickup_EMG`
		pak_num = 0
		materials = [
			GTR_EMG_pickup3_Primary
		]
	}
	{
		desc_id = GTR33_Pickup_A
		frontend_desc = qs(0x07d2f82d)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/esp/GTR33_Pickup_A`
		pak_num = 0
		materials = [
			GTR36_Pickup01_Primary
		]
	}
	{
		desc_id = GTR33_Pickup_D
		frontend_desc = qs(0x551e5532)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/esp/GTR33_Pickup_D`
		materials = [
			SD_HB_Pickup01_Primary
		]
	}
	{
		desc_id = GTR33_Pickup_E
		frontend_desc = qs(0x2d12cb96)
		sponsor_id = `Seymour	Duncan`
		mesh = `models/CAR_Instruments/Guitar/esp/GTR33_Pickup_E`
		materials = [
			SD_HB_Pickup02_Primary
		]
	}
	{
		desc_id = GTR33_Pickup_F
		frontend_desc = qs(0x08592cca)
		mesh = `models/CAR_Instruments/Guitar/esp/GTR33_Pickup_F`
		materials = [
			GTR_Pickup_Type3_Primary
		]
	}
	{
		desc_id = GTR36_Pickup
		frontend_desc = qs(0x07d2f82d)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/esp/GTR36_Pickup`
		materials = [
			GTR36_Pickup01_Primary
		]
	}
	{
		desc_id = GTR36_Pickup_D
		frontend_desc = qs(0xf6b10734)
		mesh = `models/CAR_Instruments/Guitar/esp/GTR36_Pickup_D`
		materials = [
			SD_HB_Pickup01_Primary
		]
	}
	{
		desc_id = GTR36_Pickup_E
		frontend_desc = qs(0x2d12cb96)
		sponsor_id = `Seymour	Duncan`
		mesh = `models/CAR_Instruments/Guitar/esp/GTR36_Pickup_E`
		materials = [
			SD_HB_Pickup02_Primary
		]
	}
	{
		desc_id = GTR36_Pickup_F
		frontend_desc = qs(0x08592cca)
		mesh = `models/CAR_Instruments/Guitar/esp/GTR36_Pickup_F`
		materials = [
			GTR_Pickup_Type3_Primary
		]
	}
	{
		desc_id = GTR36_EMG
		frontend_desc = qs(0xdb31d440)
		sponsor_id = EMG
		mesh = `models/CAR_Instruments/Guitar/esp/gtr36_EMG`
		materials = [
			GTR_EMG_pickup3_Primary
		]
	}
	{
		desc_id = GTR37_Pickup
		frontend_desc = qs(0x561b263a)
		mesh = `models/CAR_Instruments/Guitar/esp/GTR37_Pickup1`
		materials = [
			GTR37_Pickup01_Primary
		]
	}
	{
		desc_id = GTR38_Pickup
		frontend_desc = qs(0xdb31d440)
		sponsor_id = EMG
		mesh = `models/CAR_Instruments/Guitar/esp/GTR38_ESP_EMG`
		pak_num = 0
		materials = [
			GTR_EMG_pickup3_Primary
		]
	}
	{
		desc_id = GTR37_Pickup_D
		frontend_desc = qs(0x551e5532)
		sponsor_id = ESP
		mesh = `models/CAR_Instruments/Guitar/esp/GTR37_Pickup_D`
		materials = [
			SD_HB_Pickup01_Primary
		]
	}
	{
		desc_id = GTR37_Pickup_E
		frontend_desc = qs(0x2d12cb96)
		sponsor_id = `Seymour	Duncan`
		mesh = `models/CAR_Instruments/Guitar/esp/GTR37_Pickup_E`
		materials = [
			SD_HB_Pickup02_Primary
		]
	}
	{
		desc_id = GTR37_Pickup_F
		frontend_desc = qs(0x08592cca)
		mesh = `models/CAR_Instruments/Guitar/esp/GTR37_Pickup_F`
		materials = [
			GTR31_Pickup_CHRM_Primary
		]
	}
	{
		desc_id = GTR_Pickup_Type66
		frontend_desc = qs(0x4973cdf5)
		mesh = `models/CAR_Instruments/Guitar/esp/GTR_Pickup_Type66`
		materials = [
			GTR_Pickup_Type66_Primary
		]
	}
	{
		desc_id = GTR65_pickup_dummy
		frontend_desc = qs(0x4973cdf5)
		mesh = `models/CAR_Instruments/Guitar/esp/GTR65_pickup_dummy`
		materials = [
			GTR65_pickup_dummy_Primary
		]
	}
	{
		desc_id = None
		frontend_desc = qs(0x9c1b5214)
		random_weight = 10.0
	}
	{
		desc_id = Gtr10_Pickup_McSwain_1
		frontend_desc = qs(0x69e0a7bf)
		sponsor_id = McSwain
		materials = [
			Gtr10_Pickup_McSwain_Primary
		]
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						GTR10_McSwain_Flame
						GTR11_McSwain_Carved
						GTR12_McSwain_MInferno
						GTR13_McSwain_Machine
						GTR14_McSwain_Life
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/Gtr10_Pickup_McSwain_1`
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
		desc_id = GTR_Pickup_Type2_02
		frontend_desc = qs(0x4f1e843a)
		materials = [
			GTR_Pickup_Type2_02_Primary
		]
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						GTR10_McSwain_Flame
						GTR11_McSwain_Carved
						GTR12_McSwain_MInferno
						GTR13_McSwain_Machine
						GTR14_McSwain_Life
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_Pickup_Type2_02`
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
		desc_id = GTR_Pickup_Type3_Blk
		frontend_desc = qs(0x8ebbb0a5)
		sponsor_id = `Seymour	Duncan`
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						GTR10_McSwain_Flame
						GTR11_McSwain_Carved
						GTR12_McSwain_MInferno
						GTR13_McSwain_Machine
						GTR14_McSwain_Life
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_Pickup_Type3_Blk`
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
		desc_id = GTR_Pickup_Type3_Blk2
		frontend_desc = qs(0x847169e6)
		sponsor_id = McSwain
		materials = [
			GTR_Pickup_Type1_Blk_Primary
		]
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						GTR14_McSwain_Life
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_Pickup_Type1_Blk_2`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_Pickup_Type3_Blk2`
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
		desc_id = GTR_EMG_pickup1
		frontend_desc = qs(0x61390a51)
		sponsor_id = EMG
		materials = [
			GTR_EMG_pickup1_Primary
		]
		locked
		chosen_materials = {
			material1 = Black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr1_sch_tempest
						GTR72_SCH_Devil
						GTR73_SCH_S1
						GTR74_SCH_Star
						gtr86_mm_axis
						GTR78_PRS_SC
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_EMG_pickup1`
							attach_indices = [
								4
								3
								5
							]
						}
					]
				}
				{
					parents = [
						GTR70_SCH_Ultra
						GTR71_SCH_C1
						GTR76_IBZ_S5470
						GTR77_IBZ_RG
						GTR84_MM_Petrucci
						GTR101_Hero_Ana
						GTR102_Hero_Axe
						GTR103_Hero_manta
						GTR104_spider
						GTR105_Skull
						GTR83_PRS_STLA
						GTR130_Taylor_SB
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_EMG_pickup1`
							attach_indices = [
								4
								2
								5
							]
						}
					]
				}
				{
					parents = [
						GTR83_PRS_STLA
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_EMG_pickup1`
							attach_indices = [
								4
								2
								3
							]
						}
					]
				}
				{
					parents = [
						GTR75_IBZ_XPT
						gtr92_DR_Star
						GTR90_DR_Daisy
						gtr93_DR_Siren
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_EMG_pickup1`
							attach_indices = [
								4
								6
								5
							]
						}
					]
				}
				{
					parents = [
						GTR94_DR_TomBoy
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_EMG_pickup1`
							attach_indices = [
								3
								6
								5
							]
						}
					]
				}
				{
					parents = [
						GTR20_BC_Rich_Beast
						GTR21_BC_Rich_Warbeast
						GTR22_BC_Rich_Warlock
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_EMG_pickup1`
							attach_indices = [
								4
								3
								2
							]
						}
					]
				}
				{
					parents = [
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_EMG_pickup1`
							attach_indices = [
								1
								3
								5
							]
						}
					]
				}
				{
					parents = [
						GTR79_PRS_CSTM24
						GTR81_PRS_MiraMT
						GTR79_PRS_CSTM24
						GTR80_PRS_SANT
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_EMG_pickup1`
							attach_indices = [
								4
								2
								5
							]
						}
					]
				}
				{
					parents = [
						GTR14_McSwain_Life
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_EMG_pickup1`
							attach_indices = [
								5
								6
								7
							]
						}
					]
				}
				{
					parents = [
						GTR13_McSwain_Machine
						GTR12_McSwain_MInferno
						GTR11_McSwain_Carved
						GTR10_McSwain_Flame
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_EMG_pickup1`
							attach_indices = [
								5
								3
								7
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = GTR_EMG_pickup2
		frontend_desc = qs(0x548cdfee)
		sponsor_id = EMG
		materials = [
			GTR_EMG_pickup1_Primary
		]
		chosen_materials = {
			material1 = Black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr1_sch_tempest
						GTR70_SCH_Ultra
						GTR71_SCH_C1
						GTR72_SCH_Devil
						GTR73_SCH_S1
						GTR74_SCH_Star
						GTR75_IBZ_XPT
						GTR76_IBZ_S5470
						GTR77_IBZ_RG
						GTR90_DR_Daisy
						gtr92_DR_Star
						gtr93_DR_Siren
						GTR94_DR_TomBoy
						gtr86_mm_axis
						GTR84_MM_Petrucci
						GTR101_Hero_Ana
						GTR102_Hero_Axe
						GTR103_Hero_manta
						GTR104_spider
						GTR105_Skull
						GTR78_PRS_SC
						GTR79_PRS_CSTM24
						GTR80_PRS_SANT
						GTR81_PRS_MiraMT
						GTR130_Taylor_SB
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_EMG_pickup2`
							attach_indices = [
								1
								5
							]
						}
					]
				}
				{
					parents = [
						GTR20_BC_Rich_Beast
						GTR21_BC_Rich_Warbeast
						GTR22_BC_Rich_Warlock
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_EMG_pickup2`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						GTR83_PRS_STLA
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_EMG_pickup2`
							attach_indices = [
								1
								3
							]
						}
					]
				}
				{
					parents = [
						GTR14_McSwain_Life
						GTR13_McSwain_Machine
						GTR12_McSwain_MInferno
						GTR11_McSwain_Carved
						GTR10_McSwain_Flame
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_EMG_pickup2`
							attach_indices = [
								1
								7
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = GTR_EMG_pickup4
		frontend_desc = qs(0x500e1714)
		sponsor_id = EMG
		materials = [
			GTR_EMG_pickup1_Primary
		]
		chosen_materials = {
			material1 = Black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr1_sch_tempest
						GTR70_SCH_Ultra
						GTR71_SCH_C1
						GTR72_SCH_Devil
						GTR73_SCH_S1
						GTR74_SCH_Star
						GTR75_IBZ_XPT
						GTR76_IBZ_S5470
						GTR77_IBZ_RG
						GTR90_DR_Daisy
						GTR91_DR_Heart
						gtr92_DR_Star
						gtr93_DR_Siren
						GTR94_DR_TomBoy
						GTR20_BC_Rich_Beast
						GTR21_BC_Rich_Warbeast
						GTR22_BC_Rich_Warlock
						gtr86_mm_axis
						GTR84_MM_Petrucci
						GTR11_McSwain_Carved
						GTR10_McSwain_Flame
						GTR13_McSwain_Machine
						GTR12_McSwain_MInferno
						GTR14_McSwain_Life
						GTR101_Hero_Ana
						GTR102_Hero_Axe
						GTR103_Hero_manta
						GTR104_spider
						GTR105_Skull
						GTR78_PRS_SC
						GTR80_PRS_SANT
						GTR79_PRS_CSTM24
						GTR81_PRS_MiraMT
						GTR83_PRS_STLA
						GTR130_Taylor_SB
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_EMG_pickup2`
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
		desc_id = GTR_EMG_pickup5
		frontend_desc = qs(0xd034ed70)
		sponsor_id = EMG
		materials = [
			GTR_EMG_pickup6_Primary
		]
		chosen_materials = {
			material1 = Black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr1_sch_tempest
						GTR72_SCH_Devil
						GTR73_SCH_S1
						GTR74_SCH_Star
						GTR91_DR_Heart
						gtr86_mm_axis
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_EMG_pickup6b`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_EMG_pickup6`
							attach_indices = [
								3
								5
							]
						}
					]
				}
				{
					parents = [
						GTR70_SCH_Ultra
						GTR71_SCH_C1
						GTR76_IBZ_S5470
						GTR77_IBZ_RG
						GTR101_Hero_Ana
						GTR102_Hero_Axe
						GTR103_Hero_manta
						GTR104_spider
						GTR105_Skull
						GTR84_MM_Petrucci
						GTR83_PRS_STLA
						GTR130_Taylor_SB
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_EMG_pickup6b`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_EMG_pickup6`
							attach_indices = [
								2
								5
							]
						}
					]
				}
				{
					parents = [
						GTR83_PRS_STLA
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_EMG_pickup6b`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_EMG_pickup6`
							attach_indices = [
								2
								3
							]
						}
					]
				}
				{
					parents = [
						GTR75_IBZ_XPT
						GTR90_DR_Daisy
						gtr92_DR_Star
						gtr93_DR_Siren
						GTR94_DR_TomBoy
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_EMG_pickup6b`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_EMG_pickup6`
							attach_indices = [
								6
								5
							]
						}
					]
				}
				{
					parents = [
						GTR20_BC_Rich_Beast
						GTR21_BC_Rich_Warbeast
						GTR22_BC_Rich_Warlock
						GTR10_McSwain_Flame
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_EMG_pickup6b`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_EMG_pickup6`
							attach_indices = [
								3
								2
							]
						}
					]
				}
				{
					parents = [
						GTR14_McSwain_Life
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_EMG_pickup6b`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_EMG_pickup6`
							attach_indices = [
								6
								7
							]
						}
					]
				}
				{
					parents = [
						GTR13_McSwain_Machine
						GTR12_McSwain_MInferno
						GTR11_McSwain_Carved
						GTR10_McSwain_Flame
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_EMG_pickup6b`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_EMG_pickup6`
							attach_indices = [
								3
								7
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = GTR_EMG_pickup6
		frontend_desc = qs(0x388e3f46)
		sponsor_id = EMG
		materials = [
			GTR_EMG_pickup3_Primary
		]
		locked
		chosen_materials = {
			material1 = Black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr1_sch_tempest
						GTR70_SCH_Ultra
						GTR71_SCH_C1
						GTR72_SCH_Devil
						GTR73_SCH_S1
						GTR74_SCH_Star
						GTR75_IBZ_XPT
						GTR76_IBZ_S5470
						GTR77_IBZ_RG
						GTR90_DR_Daisy
						gtr92_DR_Star
						gtr93_DR_Siren
						GTR94_DR_TomBoy
						gtr86_mm_axis
						GTR84_MM_Petrucci
						GTR101_Hero_Ana
						GTR102_Hero_Axe
						GTR103_Hero_manta
						GTR104_spider
						GTR105_Skull
						GTR78_PRS_SC
						GTR79_PRS_CSTM24
						GTR80_PRS_SANT
						GTR81_PRS_MiraMT
						GTR130_Taylor_SB
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_EMG_pickup3`
							attach_indices = [
								1
								5
							]
						}
					]
				}
				{
					parents = [
						GTR83_PRS_STLA
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_EMG_pickup3`
							attach_indices = [
								1
								3
							]
						}
					]
				}
				{
					parents = [
						GTR20_BC_Rich_Beast
						GTR21_BC_Rich_Warbeast
						GTR22_BC_Rich_Warlock
						GTR10_McSwain_Flame
						GTR14_McSwain_Life
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_EMG_pickup3`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						GTR14_McSwain_Life
						GTR13_McSwain_Machine
						GTR12_McSwain_MInferno
						GTR11_McSwain_Carved
						GTR10_McSwain_Flame
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_EMG_pickup3`
							attach_indices = [
								1
								7
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = GTR_EMG_pickup3
		frontend_desc = qs(0x3c0cf7bc)
		sponsor_id = EMG
		materials = [
			GTR_EMG_pickup3_Primary
		]
		locked
		chosen_materials = {
			material1 = Black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr1_sch_tempest
						GTR70_SCH_Ultra
						GTR71_SCH_C1
						GTR72_SCH_Devil
						GTR73_SCH_S1
						GTR74_SCH_Star
						GTR75_IBZ_XPT
						GTR76_IBZ_S5470
						GTR77_IBZ_RG
						GTR90_DR_Daisy
						GTR91_DR_Heart
						gtr92_DR_Star
						gtr93_DR_Siren
						GTR94_DR_TomBoy
						GTR20_BC_Rich_Beast
						GTR21_BC_Rich_Warbeast
						GTR22_BC_Rich_Warlock
						GTR82_PRS_SE1
						gtr86_mm_axis
						GTR84_MM_Petrucci
						GTR11_McSwain_Carved
						GTR10_McSwain_Flame
						GTR13_McSwain_Machine
						GTR12_McSwain_MInferno
						GTR14_McSwain_Life
						GTR101_Hero_Ana
						GTR102_Hero_Axe
						GTR103_Hero_manta
						GTR104_spider
						GTR105_Skull
						GTR78_PRS_SC
						GTR80_PRS_SANT
						GTR79_PRS_CSTM24
						GTR81_PRS_MiraMT
						GTR83_PRS_STLA
						GTR130_Taylor_SB
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_EMG_pickup3`
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
		desc_id = GTR78_pickup1
		frontend_desc = qs(0xb84da57b)
		materials = [
			GTR78_pickupKurt_Primary
		]
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						GTR78_Kurt
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR78_pickup1`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR78_pickup2`
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
		desc_id = GTR_EMG_pickup9
		frontend_desc = qs(0xf2bac79f)
		sponsor_id = EMG
		materials = [
			GTR_EMG_pickup6_Primary
		]
		chosen_materials = {
			material1 = Black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr1_sch_tempest
						GTR70_SCH_Ultra
						GTR71_SCH_C1
						GTR72_SCH_Devil
						GTR73_SCH_S1
						GTR74_SCH_Star
						GTR75_IBZ_XPT
						GTR76_IBZ_S5470
						GTR77_IBZ_RG
						GTR90_DR_Daisy
						gtr92_DR_Star
						gtr93_DR_Siren
						GTR94_DR_TomBoy
						gtr86_mm_axis
						GTR84_MM_Petrucci
						GTR101_Hero_Ana
						GTR102_Hero_Axe
						GTR103_Hero_manta
						GTR104_spider
						GTR105_Skull
						GTR78_PRS_SC
						GTR79_PRS_CSTM24
						GTR80_PRS_SANT
						GTR81_PRS_MiraMT
						GTR130_Taylor_SB
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_EMG_pickup6b`
							attach_indices = [
								5
								1
							]
						}
					]
				}
				{
					parents = [
						GTR20_BC_Rich_Beast
						GTR21_BC_Rich_Warbeast
						GTR22_BC_Rich_Warlock
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_EMG_pickup6b`
							attach_indices = [
								2
								1
							]
						}
					]
				}
				{
					parents = [
						GTR83_PRS_STLA
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_EMG_pickup6b`
							attach_indices = [
								3
								1
							]
						}
					]
				}
				{
					parents = [
						GTR10_McSwain_Flame
						GTR14_McSwain_Life
						GTR12_McSwain_MInferno
						GTR11_McSwain_Carved
						GTR13_McSwain_Machine
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_EMG_pickup6b`
							attach_indices = [
								7
								1
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = GTR_EMG_pickup10
		frontend_desc = qs(0x9e364861)
		sponsor_id = EMG
		materials = [
			GTR_EMG_pickup1_Primary
		]
		chosen_materials = {
			material1 = Black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr1_sch_tempest
						GTR70_SCH_Ultra
						GTR71_SCH_C1
						GTR72_SCH_Devil
						GTR73_SCH_S1
						GTR74_SCH_Star
						GTR75_IBZ_XPT
						GTR76_IBZ_S5470
						GTR77_IBZ_RG
						GTR90_DR_Daisy
						gtr92_DR_Star
						gtr93_DR_Siren
						GTR94_DR_TomBoy
						gtr86_mm_axis
						GTR84_MM_Petrucci
						GTR101_Hero_Ana
						GTR102_Hero_Axe
						GTR103_Hero_manta
						GTR104_spider
						GTR105_Skull
						GTR78_PRS_SC
						GTR79_PRS_CSTM24
						GTR80_PRS_SANT
						GTR81_PRS_MiraMT
						GTR130_Taylor_SB
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_EMG_pickup2`
							attach_indices = [
								5
								1
							]
						}
					]
				}
				{
					parents = [
						GTR20_BC_Rich_Beast
						GTR21_BC_Rich_Warbeast
						GTR22_BC_Rich_Warlock
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_EMG_pickup2`
							attach_indices = [
								2
								1
							]
						}
					]
				}
				{
					parents = [
						GTR83_PRS_STLA
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_EMG_pickup2`
							attach_indices = [
								3
								1
							]
						}
					]
				}
				{
					parents = [
						GTR10_McSwain_Flame
						GTR14_McSwain_Life
						GTR12_McSwain_MInferno
						GTR11_McSwain_Carved
						GTR13_McSwain_Machine
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_EMG_pickup2`
							attach_indices = [
								7
								1
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = GTR_pickup_SD01
		frontend_desc = qs(0x1c166dfb)
		sponsor_id = `Seymour	Duncan`
		materials = [
			GTR_pickup_SD01_Primary
		]
		locked
		chosen_materials = {
			material1 = Black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr1_sch_tempest
						GTR70_SCH_Ultra
						GTR71_SCH_C1
						GTR72_SCH_Devil
						GTR73_SCH_S1
						GTR74_SCH_Star
						GTR75_IBZ_XPT
						GTR76_IBZ_S5470
						GTR77_IBZ_RG
						GTR90_DR_Daisy
						gtr92_DR_Star
						gtr93_DR_Siren
						GTR94_DR_TomBoy
						gtr86_mm_axis
						GTR84_MM_Petrucci
						GTR101_Hero_Ana
						GTR102_Hero_Axe
						GTR103_Hero_manta
						GTR104_spider
						GTR105_Skull
						GTR78_PRS_SC
						GTR79_PRS_CSTM24
						GTR80_PRS_SANT
						GTR81_PRS_MiraMT
						GTR130_Taylor_SB
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_pickup_SD01`
							attach_indices = [
								5
							]
						}
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_pickup_SD02`
							attach_indices = [
								1
							]
						}
					]
				}
				{
					parents = [
						GTR20_BC_Rich_Beast
						GTR21_BC_Rich_Warbeast
						GTR22_BC_Rich_Warlock
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_pickup_SD01`
							attach_indices = [
								2
							]
						}
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_pickup_SD02`
							attach_indices = [
								1
							]
						}
					]
				}
				{
					parents = [
						GTR83_PRS_STLA
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_pickup_SD01`
							attach_indices = [
								3
							]
						}
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_pickup_SD02`
							attach_indices = [
								1
							]
						}
					]
				}
				{
					parents = [
						GTR10_McSwain_Flame
						GTR14_McSwain_Life
						GTR12_McSwain_MInferno
						GTR11_McSwain_Carved
						GTR13_McSwain_Machine
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_pickup_SD01`
							attach_indices = [
								7
							]
						}
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_pickup_SD02`
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
		desc_id = GTR_pickup_SD06
		frontend_desc = qs(0x3908d59e)
		sponsor_id = `Seymour	Duncan`
		materials = [
			GTR_pickup_SD01_Primary
		]
		chosen_materials = {
			material1 = Black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr1_sch_tempest
						GTR70_SCH_Ultra
						GTR71_SCH_C1
						GTR72_SCH_Devil
						GTR73_SCH_S1
						GTR74_SCH_Star
						GTR75_IBZ_XPT
						GTR76_IBZ_S5470
						GTR77_IBZ_RG
						GTR90_DR_Daisy
						gtr92_DR_Star
						gtr93_DR_Siren
						GTR94_DR_TomBoy
						gtr86_mm_axis
						GTR84_MM_Petrucci
						GTR101_Hero_Ana
						GTR102_Hero_Axe
						GTR103_Hero_manta
						GTR104_spider
						GTR105_Skull
						GTR78_PRS_SC
						GTR79_PRS_CSTM24
						GTR80_PRS_SANT
						GTR81_PRS_MiraMT
						GTR130_Taylor_SB
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_pickup_SD01`
							attach_indices = [
								5
								1
							]
						}
					]
				}
				{
					parents = [
						GTR20_BC_Rich_Beast
						GTR21_BC_Rich_Warbeast
						GTR22_BC_Rich_Warlock
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_pickup_SD01`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						GTR83_PRS_STLA
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_pickup_SD01`
							attach_indices = [
								3
								1
							]
						}
					]
				}
				{
					parents = [
						GTR14_McSwain_Life
						GTR13_McSwain_Machine
						GTR12_McSwain_MInferno
						GTR11_McSwain_Carved
						GTR10_McSwain_Flame
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_pickup_SD01`
							attach_indices = [
								1
								7
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = GTR_pickup_SD06B
		frontend_desc = qs(0x3d8a1d64)
		sponsor_id = `Seymour	Duncan`
		materials = [
			GTR_pickup_SD01_Primary
		]
		chosen_materials = {
			material1 = Black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr1_sch_tempest
						GTR70_SCH_Ultra
						GTR71_SCH_C1
						GTR72_SCH_Devil
						GTR73_SCH_S1
						GTR74_SCH_Star
						GTR75_IBZ_XPT
						GTR76_IBZ_S5470
						GTR77_IBZ_RG
						GTR90_DR_Daisy
						GTR91_DR_Heart
						gtr92_DR_Star
						gtr93_DR_Siren
						GTR94_DR_TomBoy
						GTR20_BC_Rich_Beast
						GTR21_BC_Rich_Warbeast
						GTR22_BC_Rich_Warlock
						gtr86_mm_axis
						GTR84_MM_Petrucci
						GTR11_McSwain_Carved
						GTR10_McSwain_Flame
						GTR13_McSwain_Machine
						GTR12_McSwain_MInferno
						GTR14_McSwain_Life
						GTR101_Hero_Ana
						GTR102_Hero_Axe
						GTR103_Hero_manta
						GTR104_spider
						GTR105_Skull
						GTR79_PRS_CSTM24
						GTR78_PRS_SC
						GTR80_PRS_SANT
						GTR81_PRS_MiraMT
						GTR83_PRS_STLA
						GTR130_Taylor_SB
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_pickup_SD01`
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
		desc_id = GTR_pickup_SD05B
		frontend_desc = qs(0x778834af)
		sponsor_id = `Seymour	Duncan`
		materials = [
			GTR_pickup_SD01_Primary
		]
		chosen_materials = {
			material1 = Black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr1_sch_tempest
						GTR70_SCH_Ultra
						GTR71_SCH_C1
						GTR72_SCH_Devil
						GTR73_SCH_S1
						GTR74_SCH_Star
						GTR75_IBZ_XPT
						GTR76_IBZ_S5470
						GTR77_IBZ_RG
						GTR90_DR_Daisy
						gtr92_DR_Star
						gtr93_DR_Siren
						GTR94_DR_TomBoy
						gtr86_mm_axis
						GTR84_MM_Petrucci
						GTR101_Hero_Ana
						GTR102_Hero_Axe
						GTR103_Hero_manta
						GTR104_spider
						GTR105_Skull
						GTR78_PRS_SC
						GTR79_PRS_CSTM24
						GTR80_PRS_SANT
						GTR81_PRS_MiraMT
						GTR130_Taylor_SB
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_pickup_SD05`
							attach_indices = [
								1
								5
							]
						}
					]
				}
				{
					parents = [
						GTR10_McSwain_Flame
						GTR14_McSwain_Life
						GTR20_BC_Rich_Beast
						GTR21_BC_Rich_Warbeast
						GTR22_BC_Rich_Warlock
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_pickup_SD05`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						GTR83_PRS_STLA
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_pickup_SD05`
							attach_indices = [
								1
								3
							]
						}
					]
				}
				{
					parents = [
						GTR14_McSwain_Life
						GTR13_McSwain_Machine
						GTR12_McSwain_MInferno
						GTR11_McSwain_Carved
						GTR10_McSwain_Flame
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_pickup_SD05`
							attach_indices = [
								1
								7
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = GTR_pickup_SD05
		frontend_desc = qs(0x730afc55)
		sponsor_id = `Seymour	Duncan`
		materials = [
			GTR_pickup_SD01_Primary
		]
		chosen_materials = {
			material1 = Black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr1_sch_tempest
						GTR70_SCH_Ultra
						GTR71_SCH_C1
						GTR72_SCH_Devil
						GTR73_SCH_S1
						GTR74_SCH_Star
						GTR75_IBZ_XPT
						GTR76_IBZ_S5470
						GTR77_IBZ_RG
						GTR90_DR_Daisy
						GTR91_DR_Heart
						gtr92_DR_Star
						gtr93_DR_Siren
						GTR94_DR_TomBoy
						GTR20_BC_Rich_Beast
						GTR21_BC_Rich_Warbeast
						GTR22_BC_Rich_Warlock
						gtr86_mm_axis
						GTR84_MM_Petrucci
						GTR11_McSwain_Carved
						GTR10_McSwain_Flame
						GTR13_McSwain_Machine
						GTR12_McSwain_MInferno
						GTR14_McSwain_Life
						GTR101_Hero_Ana
						GTR102_Hero_Axe
						GTR103_Hero_manta
						GTR104_spider
						GTR105_Skull
						GTR79_PRS_CSTM24
						GTR78_PRS_SC
						GTR80_PRS_SANT
						GTR81_PRS_MiraMT
						GTR83_PRS_STLA
						GTR130_Taylor_SB
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_pickup_SD05`
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
		desc_id = GTR_pickup_SD03
		frontend_desc = qs(0x3eccb392)
		sponsor_id = `Seymour	Duncan`
		materials = [
			GTR_pickup_SD03_Primary
		]
		chosen_materials = {
			material1 = Black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr1_sch_tempest
						GTR70_SCH_Ultra
						GTR71_SCH_C1
						GTR72_SCH_Devil
						GTR73_SCH_S1
						GTR74_SCH_Star
						GTR75_IBZ_XPT
						GTR76_IBZ_S5470
						GTR77_IBZ_RG
						GTR90_DR_Daisy
						gtr92_DR_Star
						gtr93_DR_Siren
						GTR94_DR_TomBoy
						gtr86_mm_axis
						GTR84_MM_Petrucci
						GTR101_Hero_Ana
						GTR102_Hero_Axe
						GTR103_Hero_manta
						GTR104_spider
						GTR105_Skull
						GTR78_PRS_SC
						GTR79_PRS_CSTM24
						GTR80_PRS_SANT
						GTR81_PRS_MiraMT
						GTR130_Taylor_SB
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_pickup_SD03`
							attach_indices = [
								1
								5
							]
						}
					]
				}
				{
					parents = [
						GTR14_McSwain_Life
						GTR20_BC_Rich_Beast
						GTR21_BC_Rich_Warbeast
						GTR22_BC_Rich_Warlock
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_pickup_SD03`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						GTR83_PRS_STLA
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_pickup_SD03`
							attach_indices = [
								1
								3
							]
						}
					]
				}
				{
					parents = [
						GTR14_McSwain_Life
						GTR13_McSwain_Machine
						GTR12_McSwain_MInferno
						GTR11_McSwain_Carved
						GTR10_McSwain_Flame
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_pickup_SD03`
							attach_indices = [
								1
								7
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = GTR_pickup_SD04
		frontend_desc = qs(0xb21afdc3)
		sponsor_id = `Seymour	Duncan`
		materials = [
			GTR_pickup_SD01_Primary
		]
		chosen_materials = {
			material1 = Black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr1_sch_tempest
						GTR70_SCH_Ultra
						GTR71_SCH_C1
						GTR72_SCH_Devil
						GTR73_SCH_S1
						GTR74_SCH_Star
						GTR75_IBZ_XPT
						GTR76_IBZ_S5470
						GTR77_IBZ_RG
						GTR90_DR_Daisy
						gtr92_DR_Star
						gtr93_DR_Siren
						GTR94_DR_TomBoy
						gtr86_mm_axis
						GTR84_MM_Petrucci
						GTR101_Hero_Ana
						GTR102_Hero_Axe
						GTR103_Hero_manta
						GTR104_spider
						GTR105_Skull
						GTR78_PRS_SC
						GTR79_PRS_CSTM24
						GTR80_PRS_SANT
						GTR81_PRS_MiraMT
						GTR130_Taylor_SB
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_pickup_SD04`
							attach_indices = [
								1
								5
							]
						}
					]
				}
				{
					parents = [
						GTR10_McSwain_Flame
						GTR14_McSwain_Life
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_pickup_SD04`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						GTR83_PRS_STLA
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_pickup_SD04`
							attach_indices = [
								1
								3
							]
						}
					]
				}
				{
					parents = [
						GTR14_McSwain_Life
						GTR13_McSwain_Machine
						GTR12_McSwain_MInferno
						GTR11_McSwain_Carved
						GTR10_McSwain_Flame
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_pickup_SD04`
							attach_indices = [
								1
								7
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = GTR_pickup_SD04b
		frontend_desc = qs(0x01e4725f)
		sponsor_id = `Seymour	Duncan`
		materials = [
			GTR_pickup_SD01_Primary
		]
		chosen_materials = {
			material1 = grey_2guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						GTR20_BC_Rich_Beast
						GTR21_BC_Rich_Warbeast
						GTR22_BC_Rich_Warlock
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_pickup_SD04`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_pickup_SD04b`
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
		desc_id = GTR_pickup_BC01
		frontend_desc = qs(0x870e4174)
		sponsor_id = Rockfield
		materials = [
			GTR_pickup_BC01_Primary
		]
		chosen_materials = {
			material1 = Black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						GTR20_BC_Rich_Beast
						GTR21_BC_Rich_Warbeast
						GTR22_BC_Rich_Warlock
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_pickup_BC01`
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
		desc_id = GTR_pickup_BC01b
		frontend_desc = qs(0x838c898e)
		sponsor_id = Rockfield
		materials = [
			GTR_pickup_BC01_Primary
		]
		chosen_materials = {
			material1 = Black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						GTR20_BC_Rich_Beast
						GTR21_BC_Rich_Warbeast
						GTR22_BC_Rich_Warlock
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_pickup_BC01`
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
		desc_id = GTR_pickup_BC02
		frontend_desc = qs(0xa8ee4150)
		materials = [
			GTR_pickup_BC01_Primary
		]
		chosen_materials = {
			material1 = Black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						GTR20_BC_Rich_Beast
						GTR21_BC_Rich_Warbeast
						GTR22_BC_Rich_Warlock
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_pickup_BC01`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_pickup_BC02`
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
		desc_id = GTR_Pickup_Type2_PAF1
		frontend_desc = qs(0x17f242c5)
		sponsor_id = `Seymour	Duncan`
		materials = [
			GTR_Pickup_Type2_01_Primary
		]
		chosen_materials = {
			material1 = Black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						GTR94_DR_TomBoy
						gtr86_mm_axis
						GTR75_IBZ_XPT
						GTR10_McSwain_Flame
						GTR11_McSwain_Carved
						GTR14_McSwain_Life
						GTR12_McSwain_MInferno
						GTR13_McSwain_Machine
						gtr1_sch_tempest
						GTR72_SCH_Devil
						GTR74_SCH_Star
						GTR73_SCH_S1
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_Pickup_Type2_01`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						gtr93_DR_Siren
						GTR84_MM_Petrucci
						GTR70_SCH_Ultra
						GTR90_DR_Daisy
						gtr92_DR_Star
						gtr93_DR_Siren
						GTR76_IBZ_S5470
						GTR77_IBZ_RG
						GTR71_SCH_C1
						GTR130_Taylor_SB
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_Pickup_Type2_01`
							attach_indices = [
								1
								3
							]
						}
					]
				}
				{
					parents = [
						GTR20_BC_Rich_Beast
						GTR21_BC_Rich_Warbeast
						GTR22_BC_Rich_Warlock
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_Pickup_Type2_01`
							attach_indices = [
								1
								5
							]
						}
					]
				}
				{
					parents = [
						GTR101_Hero_Ana
						GTR102_Hero_Axe
						GTR103_Hero_manta
						GTR104_spider
						GTR105_Skull
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_Pickup_Type2_01`
							attach_indices = [
								1
								6
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = GTR_Pickup_Type2_PAF2
		frontend_desc = qs(0x13708a3f)
		sponsor_id = `Seymour	Duncan`
		materials = [
			GTR_Pickup_Type2_01_Primary
		]
		chosen_materials = {
			material1 = Black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						GTR82_PRS_SE1
						GTR70_SCH_Ultra
						GTR20_BC_Rich_Beast
						GTR21_BC_Rich_Warbeast
						GTR22_BC_Rich_Warlock
						GTR90_DR_Daisy
						GTR91_DR_Heart
						gtr92_DR_Star
						gtr93_DR_Siren
						GTR101_Hero_Ana
						GTR102_Hero_Axe
						GTR103_Hero_manta
						GTR104_spider
						GTR105_Skull
						GTR75_IBZ_XPT
						GTR76_IBZ_S5470
						GTR77_IBZ_RG
						GTR10_McSwain_Flame
						GTR11_McSwain_Carved
						GTR12_McSwain_MInferno
						GTR13_McSwain_Machine
						GTR14_McSwain_Life
						GTR78_PRS_SC
						GTR79_PRS_CSTM24
						GTR80_PRS_SANT
						GTR81_PRS_MiraMT
						gtr1_sch_tempest
						GTR71_SCH_C1
						GTR72_SCH_Devil
						GTR73_SCH_S1
						GTR74_SCH_Star
						GTR83_PRS_STLA
						GTR94_DR_TomBoy
						GTR83_PRS_STLA
						GTR130_Taylor_SB
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_Pickup_Type2_01`
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
		desc_id = GTR70_SCH_Ultra_pickup2
		frontend_desc = qs(0x1964f74c)
		sponsor_id = `Seymour	Duncan`
		materials = [
			GTR70_SCH_Ultra_pickup_Primary
		]
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr1_sch_tempest
						GTR72_SCH_Devil
						GTR83_PRS_STLA
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR70_SCH_Ultra_pickup`
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
		desc_id = GTR70_SCH_Ultra_pickup
		frontend_desc = qs(0x1de63fb6)
		sponsor_id = `Seymour	Duncan`
		materials = [
			GTR70_SCH_Ultra_pickup_Primary
		]
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						GTR83_PRS_STLA
						GTR84_MM_Petrucci
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR70_SCH_Ultra_pickup`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						gtr1_sch_tempest
						GTR72_SCH_Devil
						GTR73_SCH_S1
						GTR74_SCH_Star
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR70_SCH_Ultra_pickup`
							attach_indices = [
								1
								5
							]
						}
					]
				}
				{
					parents = [
						GTR70_SCH_Ultra
						GTR71_SCH_C1
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR70_SCH_Ultra_pickup`
							attach_indices = [
								1
								5
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = GTR70_SCH_Ultra_pickup3
		frontend_desc = qs(0xa6a45fe6)
		sponsor_id = `Seymour	Duncan`
		materials = [
			GTR70_SCH_Ultra_pickup_Primary
		]
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						GTR70_SCH_Ultra
						GTR71_SCH_C1
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR70_SCH_Ultra_pickup`
							attach_indices = [
								1
								2
								5
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = GTR76_pickupA
		frontend_desc = qs(0xdc4c4b7d)
		materials = [
			GTR76_pickupA_Primary
		]
		chosen_materials = {
			material1 = Black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						GTR76_IBZ_S5470
						GTR83_PRS_STLA
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR76_pickupC`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR76_pickupB`
							attach_indices = [
								2
							]
						}
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR76_pickupA`
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
		desc_id = GTR76_pickupB
		frontend_desc = qs(0x1f1cdaf6)
		materials = [
			GTR76_pickupA_Primary
		]
		chosen_materials = {
			material1 = Black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						GTR77_IBZ_RG
						GTR83_PRS_STLA
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR76_pickupD`
							attach_indices = [
								1
								3
							]
						}
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR76_pickupB`
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
		desc_id = GTR78_pickup
		frontend_desc = qs(0xdb411784)
		materials = [
			GTR78_pickup_Primary
		]
		chosen_materials = {
			material1 = Black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						GTR75_IBZ_XPT
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR78_pickupB`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR78_pickup`
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
		desc_id = GTR_Pickup_Type2_PRS
		frontend_desc = qs(0x071b442e)
		sponsor_id = PRS
		materials = [
			GTR_Pickup_Type2_01_Primary
		]
		chosen_materials = {
			material1 = yellow_4guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						GTR78_PRS_SC
						GTR79_PRS_CSTM24
						GTR81_PRS_MiraMT
						GTR80_PRS_SANT
						GTR83_PRS_STLA
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_Pickup_Type2_01`
							attach_indices = [
								1
								3
							]
						}
					]
				}
				{
					parents = [
						GTR78_PRS_SC
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_Pickup_Type2_01`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						GTR82_PRS_SE1
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_Pickup_Type2_01`
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
		desc_id = GTR76_pickupA_B
		frontend_desc = qs(0xdc4c4b7d)
		materials = [
			GTR76_pickupA_Primary
		]
		chosen_materials = {
			material1 = Black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						GTR83_PRS_STLA
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR76_pickupC`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR76_pickupB`
							attach_indices = [
								2
							]
						}
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR76_pickupA`
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
		desc_id = GTR76_pickupB_B
		frontend_desc = qs(0x1f1cdaf6)
		materials = [
			GTR76_pickupA_Primary
		]
		chosen_materials = {
			material1 = Black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						GTR83_PRS_STLA
						GTR84_MM_Petrucci
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR76_pickupD`
							attach_indices = [
								1
								3
							]
						}
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR76_pickupB`
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
		desc_id = GTR78_pickup_B
		frontend_desc = qs(0xdb411784)
		materials = [
			GTR78_pickup_Primary
		]
		chosen_materials = {
			material1 = Black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						GTR84_MM_Petrucci
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR78_pickupB`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR78_pickup`
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
		desc_id = PRS_Pickup_Hbucker
		frontend_desc = qs(0xd61aefe3)
		sponsor_id = PRS
		materials = [
			PRS_Pickup_Hbucker_Primary
		]
		initial_values = {
			Color = grey_4guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						GTR79_PRS_CSTM24
						GTR83_PRS_STLA
						GTR80_PRS_SANT
						GTR81_PRS_MiraMT
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/PRS_Pickup_Hbucker`
							attach_indices = [
								1
								3
							]
						}
					]
				}
				{
					parents = [
						GTR82_PRS_SE1
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/PRS_Pickup_Hbucker`
							attach_indices = [
								1
							]
						}
					]
				}
				{
					parents = [
						GTR78_PRS_SC
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/PRS_Pickup_Hbucker`
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
		desc_id = GTR_pickup_soapbar
		frontend_desc = qs(0x8f26d9fa)
		sponsor_id = PRS
		materials = [
			GTR_Pickup_Soapbar_Primary
		]
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						GTR82_PRS_SE1
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_Pickup_Soapbar`
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
		desc_id = GTR_pickup_PRS001
		frontend_desc = qs(0x09939196)
		sponsor_id = PRS
		materials = [
			GTR_pickup_SD01_Primary
		]
		chosen_materials = {
			material1 = Black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						GTR78_PRS_SC
						GTR79_PRS_CSTM24
						GTR78_PRS_SC
						GTR80_PRS_SANT
						GTR81_PRS_MiraMT
						GTR82_PRS_SE1
						GTR83_PRS_STLA
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_pickup_PRS001`
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
		desc_id = GTR_pickup_PRS001b
		frontend_desc = qs(0xda041de4)
		sponsor_id = PRS
		materials = [
			GTR_pickup_SD01_Primary
		]
		chosen_materials = {
			material1 = Black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						GTR78_PRS_SC
						GTR79_PRS_CSTM24
						GTR80_PRS_SANT
						GTR81_PRS_MiraMT
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_pickup_PRS001`
							attach_indices = [
								5
								1
							]
						}
					]
				}
				{
					parents = [
						GTR83_PRS_STLA
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_pickup_PRS001`
							attach_indices = [
								3
								1
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = GTR76_pickupA_C
		frontend_desc = qs(0xdc4c4b7d)
		materials = [
			GTR76_pickupA_Primary
		]
		chosen_materials = {
			material1 = Black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						GTR84_MM_Petrucci
						GTR82_PRS_SE1
						GTR80_PRS_SANT
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR76_pickupC`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR76_pickupB`
							attach_indices = [
								2
							]
						}
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR76_pickupA`
							attach_indices = [
								3
							]
						}
					]
				}
				{
					parents = [
						gtr86_mm_axis
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR76_pickupC`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR76_pickupA`
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
		desc_id = GTR76_pickupB_C
		frontend_desc = qs(0x1f1cdaf6)
		materials = [
			GTR76_pickupA_Primary
		]
		chosen_materials = {
			material1 = Black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						GTR83_PRS_STLA
						GTR84_MM_Petrucci
						GTR80_PRS_SANT
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR76_pickupD`
							attach_indices = [
								1
								3
							]
						}
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR76_pickupB`
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
		desc_id = GTR78_pickup_C
		frontend_desc = qs(0xdb411784)
		materials = [
			GTR78_pickup_Primary
		]
		chosen_materials = {
			material1 = Black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						GTR84_MM_Petrucci
						GTR82_PRS_SE1
						GTR80_PRS_SANT
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR78_pickupB`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR78_pickup`
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
		desc_id = GTR84_pickup_A
		frontend_desc = qs(0x0137cc85)
		materials = [
			GTR84_MM_Pickups_Primary
		]
		chosen_materials = {
			material1 = Black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						GTR84_MM_Petrucci
						gtr86_mm_axis
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR84_MM_Pickup01`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR84_MM_Pickup02`
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
		desc_id = GTR86_pickup
		frontend_desc = qs(0xc5e03a15)
		materials = [
			GTR86_pickup_Primary
		]
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr86_mm_axis
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR86_pickup`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						GTR84_MM_Petrucci
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR86_pickup`
							attach_indices = [
								1
								3
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = GTR86_pickupb
		frontend_desc = qs(0xc162f2ef)
		materials = [
			GTR86_pickup_Primary
		]
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						GTR84_MM_Petrucci
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR86_pickup`
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
		desc_id = GTR90_pickup1
		frontend_desc = qs(0xdc52067b)
		materials = [
			GTR90_pickup1_Primary
		]
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						GTR90_DR_Daisy
						GTR91_DR_Heart
						gtr92_DR_Star
						gtr93_DR_Siren
						GTR94_DR_TomBoy
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR90_pickup1`
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
		desc_id = GTR90_pickup3
		frontend_desc = qs(0x6a991952)
		sponsor_id = `Seymour	Duncan`
		materials = [
			GTR90_pickup2_Primary
		]
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						GTR90_DR_Daisy
						gtr92_DR_Star
						GTR91_DR_Heart
						gtr93_DR_Siren
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR90_pickup2B`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR90_pickup2`
							attach_indices = [
								2
							]
						}
					]
				}
				{
					parents = [
						GTR94_DR_TomBoy
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR90_pickup2B`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR90_pickup2`
							attach_indices = [
								4
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = GTR94_pickup
		frontend_desc = qs(0xfe3ac904)
		materials = [
			GTR94_pickup_primary
		]
		chosen_materials = {
			material1 = Black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						GTR94_DR_TomBoy
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR94_pickupA`
							attach_indices = [
								3
							]
						}
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR94_pickupB`
							attach_indices = [
								2
							]
						}
					]
				}
				{
					parents = [
						GTR90_DR_Daisy
						gtr92_DR_Star
						gtr93_DR_Siren
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR94_pickupA`
							attach_indices = [
								4
							]
						}
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR94_pickupB`
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
		desc_id = GTR25_2pickups
		frontend_desc = qs(0xc5867730)
		materials = [
			GTR_Pickup_Manson_1_primary
		]
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						GTR25_Manson_Bellamy
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_Pickup_Manson_1`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_Pickup_Manson_2`
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
		desc_id = GTR_Taylor_pickup1
		frontend_desc = qs(0x0a01d07f)
		materials = [
			GTR_Taylor_pickup1_primary
		]
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						GTR130_Taylor_SB
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/pickups/GTR_Taylor_pickup1`
							attach_indices = [
								1
								5
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = GTR_Taylor_pickup2
		frontend_desc = qs(0x6973bba6)
		materials = [
			GTR_Taylor_pickup2_primary
		]
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						GTR130_Taylor_SB
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/pickups/GTR_Taylor_pickup2`
							attach_indices = [
								1
								3
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = GTR_Taylor_pickup3
		frontend_desc = qs(0xe9a8a956)
		materials = [
			GTR_Taylor_pickup3_primary
		]
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						GTR130_Taylor_SB
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/pickups/GTR_Taylor_pickup3`
							attach_indices = [
								1
								5
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = GTR26_Dummy
		frontend_desc = qs(0x3f1bbbb1)
		materials = [
			GTR_Pickup_Type2_01_Primary
		]
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						GTR26_Cash_Acoustic
						GTR27_NSFT_Acoustic
						GTR142_G6e_Body
						GTR142_G6e_BodyT
						GTR142_G6e_Body02
						GTR143_DDSM
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Pickups/GTR_Pickup_Type2_01`
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
CAS_Guitar_Knobs = [
	{
		desc_id = GTR_Knob_01
		frontend_desc = qs(0x2a068a61)
		materials = [
			GTR_Knob_01_Primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						GTR10_McSwain_Flame
						GTR12_McSwain_MInferno
						GTR13_McSwain_Machine
						GTR71_SCH_C1
						GTR70_SCH_Ultra
						GTR75_IBZ_XPT
						GTR76_IBZ_S5470
						GTR77_IBZ_RG
						GTR80_PRS_SANT
						GTR81_PRS_MiraMT
						GTR83_PRS_STLA
						GTR90_DR_Daisy
						GTR84_MM_Petrucci
						gtr92_DR_Star
						GTR91_DR_Heart
						gtr93_DR_Siren
						GTR20_BC_Rich_Beast
						GTR21_BC_Rich_Warbeast
						gtr86_mm_axis
						GTR104_spider
						GTR105_Skull
						GTR130_Taylor_SB
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_01`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						GTR11_McSwain_Carved
						GTR94_DR_TomBoy
						GTR22_BC_Rich_Warlock
						GTR101_Hero_Ana
						GTR102_Hero_Axe
						GTR103_Hero_manta
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_01`
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
						GTR14_McSwain_Life
						GTR72_SCH_Devil
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_01`
							attach_indices = [
								1
							]
						}
					]
				}
				{
					parents = [
						GTR74_SCH_Star
						gtr1_sch_tempest
					]
					node_set = 3
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_01`
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
		desc_id = GTR_Knob_02
		frontend_desc = qs(0x5593d6d0)
		materials = [
			GTR_Knob_02_Primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						GTR10_McSwain_Flame
						GTR12_McSwain_MInferno
						GTR13_McSwain_Machine
						GTR71_SCH_C1
						GTR70_SCH_Ultra
						GTR75_IBZ_XPT
						GTR76_IBZ_S5470
						GTR77_IBZ_RG
						GTR79_PRS_CSTM24
						GTR80_PRS_SANT
						GTR81_PRS_MiraMT
						GTR83_PRS_STLA
						GTR90_DR_Daisy
						GTR84_MM_Petrucci
						gtr92_DR_Star
						GTR91_DR_Heart
						gtr93_DR_Siren
						GTR20_BC_Rich_Beast
						GTR21_BC_Rich_Warbeast
						gtr86_mm_axis
						GTR104_spider
						GTR105_Skull
						GTR130_Taylor_SB
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_02`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						GTR11_McSwain_Carved
						GTR94_DR_TomBoy
						GTR22_BC_Rich_Warlock
						GTR84_MM_Petrucci
						GTR101_Hero_Ana
						GTR102_Hero_Axe
						GTR103_Hero_manta
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_02`
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
						GTR72_SCH_Devil
						GTR14_McSwain_Life
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_02`
							attach_indices = [
								1
							]
						}
					]
				}
				{
					parents = [
						GTR74_SCH_Star
						gtr1_sch_tempest
						GTR78_PRS_SC
					]
					node_set = 3
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_02`
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
		desc_id = GTR_Knob_03
		frontend_desc = qs(0x6b3ddd60)
		materials = [
			GTR_Knob_03_Primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						GTR10_McSwain_Flame
						GTR12_McSwain_MInferno
						GTR13_McSwain_Machine
						GTR71_SCH_C1
						GTR70_SCH_Ultra
						GTR75_IBZ_XPT
						GTR76_IBZ_S5470
						GTR77_IBZ_RG
						GTR79_PRS_CSTM24
						GTR80_PRS_SANT
						GTR81_PRS_MiraMT
						GTR83_PRS_STLA
						GTR90_DR_Daisy
						GTR84_MM_Petrucci
						gtr92_DR_Star
						GTR91_DR_Heart
						gtr93_DR_Siren
						GTR20_BC_Rich_Beast
						GTR21_BC_Rich_Warbeast
						gtr86_mm_axis
						GTR104_spider
						GTR105_Skull
						GTR130_Taylor_SB
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_03`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						GTR11_McSwain_Carved
						GTR94_DR_TomBoy
						GTR22_BC_Rich_Warlock
						GTR84_MM_Petrucci
						GTR101_Hero_Ana
						GTR102_Hero_Axe
						GTR103_Hero_manta
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_03`
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
						GTR72_SCH_Devil
						GTR14_McSwain_Life
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_03`
							attach_indices = [
								1
							]
						}
					]
				}
				{
					parents = [
						GTR74_SCH_Star
						gtr1_sch_tempest
						GTR78_PRS_SC
					]
					node_set = 3
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_03`
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
		desc_id = GTR_Knob_03b
		frontend_desc = qs(0x3f507346)
		materials = [
			GTR_Knob_03_Primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						GTR72_SCH_Devil
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_03`
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
		desc_id = GTR_Knob_04
		frontend_desc = qs(0x4b3fc55e)
		materials = [
			GTR_Knob_04_Primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						GTR10_McSwain_Flame
						GTR12_McSwain_MInferno
						GTR13_McSwain_Machine
						GTR71_SCH_C1
						GTR70_SCH_Ultra
						GTR75_IBZ_XPT
						GTR76_IBZ_S5470
						GTR77_IBZ_RG
						GTR79_PRS_CSTM24
						GTR80_PRS_SANT
						GTR81_PRS_MiraMT
						GTR83_PRS_STLA
						GTR90_DR_Daisy
						GTR84_MM_Petrucci
						gtr92_DR_Star
						GTR91_DR_Heart
						gtr93_DR_Siren
						GTR20_BC_Rich_Beast
						GTR21_BC_Rich_Warbeast
						gtr86_mm_axis
						GTR104_spider
						GTR105_Skull
						GTR130_Taylor_SB
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_04`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						GTR11_McSwain_Carved
						GTR94_DR_TomBoy
						GTR22_BC_Rich_Warlock
						GTR84_MM_Petrucci
						GTR101_Hero_Ana
						GTR102_Hero_Axe
						GTR103_Hero_manta
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_04`
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
						GTR74_SCH_Star
						gtr1_sch_tempest
						GTR78_PRS_SC
					]
					node_set = 3
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_04`
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
		desc_id = GTR_Knob_04b
		frontend_desc = qs(0x7f39ed53)
		materials = [
			GTR_Knob_04_Primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						GTR72_SCH_Devil
						GTR14_McSwain_Life
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_04`
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
		desc_id = GTR_Knob_05
		frontend_desc = qs(0x4a3737b3)
		materials = [
			GTR_Knob_05_Primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						GTR10_McSwain_Flame
						GTR12_McSwain_MInferno
						GTR13_McSwain_Machine
						GTR71_SCH_C1
						GTR70_SCH_Ultra
						GTR75_IBZ_XPT
						GTR76_IBZ_S5470
						GTR77_IBZ_RG
						GTR79_PRS_CSTM24
						GTR80_PRS_SANT
						GTR81_PRS_MiraMT
						GTR83_PRS_STLA
						GTR90_DR_Daisy
						GTR84_MM_Petrucci
						gtr92_DR_Star
						GTR91_DR_Heart
						gtr93_DR_Siren
						GTR20_BC_Rich_Beast
						GTR21_BC_Rich_Warbeast
						gtr86_mm_axis
						GTR104_spider
						GTR105_Skull
						GTR130_Taylor_SB
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_05`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						GTR11_McSwain_Carved
						GTR94_DR_TomBoy
						GTR22_BC_Rich_Warlock
						GTR84_MM_Petrucci
						GTR101_Hero_Ana
						GTR102_Hero_Axe
						GTR103_Hero_manta
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_05`
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
						GTR72_SCH_Devil
						GTR14_McSwain_Life
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_05`
							attach_indices = [
								1
							]
						}
					]
				}
				{
					parents = [
						GTR74_SCH_Star
						gtr1_sch_tempest
						GTR78_PRS_SC
					]
					node_set = 3
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_05`
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
		desc_id = GTR_Knob_05b
		frontend_desc = qs(0x2a26573d)
		materials = [
			GTR_Knob_05_Primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						GTR72_SCH_Devil
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_05`
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
		desc_id = GTR120_Knob01
		frontend_desc = qs(0x9f7639d1)
		materials = [
			GTR120_Knob01_Primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						GTR120_KBRD_LP
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR120_Knob01`
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
		desc_id = GTR_Knob_06
		frontend_desc = qs(0x8ae89cb9)
		materials = [
			GTR_Knob_06_Primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						GTR10_McSwain_Flame
						GTR12_McSwain_MInferno
						GTR13_McSwain_Machine
						GTR71_SCH_C1
						GTR70_SCH_Ultra
						GTR75_IBZ_XPT
						GTR76_IBZ_S5470
						GTR77_IBZ_RG
						GTR79_PRS_CSTM24
						GTR80_PRS_SANT
						GTR81_PRS_MiraMT
						GTR83_PRS_STLA
						GTR90_DR_Daisy
						GTR84_MM_Petrucci
						gtr92_DR_Star
						GTR91_DR_Heart
						gtr93_DR_Siren
						GTR20_BC_Rich_Beast
						GTR21_BC_Rich_Warbeast
						gtr86_mm_axis
						GTR104_spider
						GTR105_Skull
						GTR130_Taylor_SB
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_06`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						GTR11_McSwain_Carved
						GTR94_DR_TomBoy
						GTR22_BC_Rich_Warlock
						GTR84_MM_Petrucci
						GTR101_Hero_Ana
						GTR102_Hero_Axe
						GTR103_Hero_manta
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_06`
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
						GTR82_PRS_SE1
						GTR72_SCH_Devil
						GTR14_McSwain_Life
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_06`
							attach_indices = [
								1
							]
						}
					]
				}
				{
					parents = [
						GTR74_SCH_Star
						gtr1_sch_tempest
						GTR78_PRS_SC
					]
					node_set = 3
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_06`
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
		desc_id = GTR_Knob_06b
		frontend_desc = qs(0x0b0249fc)
		materials = [
			GTR_Knob_06_Primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						GTR82_PRS_SE1
						GTR72_SCH_Devil
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_06`
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
		desc_id = GTR_Knob_07
		frontend_desc = qs(0x794033c5)
		materials = [
			GTR_Knob_07_Primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						GTR10_McSwain_Flame
						GTR12_McSwain_MInferno
						GTR13_McSwain_Machine
						GTR71_SCH_C1
						GTR70_SCH_Ultra
						GTR75_IBZ_XPT
						GTR76_IBZ_S5470
						GTR77_IBZ_RG
						GTR79_PRS_CSTM24
						GTR80_PRS_SANT
						GTR81_PRS_MiraMT
						GTR83_PRS_STLA
						GTR90_DR_Daisy
						GTR84_MM_Petrucci
						gtr92_DR_Star
						GTR91_DR_Heart
						gtr93_DR_Siren
						GTR20_BC_Rich_Beast
						GTR21_BC_Rich_Warbeast
						gtr86_mm_axis
						GTR104_spider
						GTR105_Skull
						GTR130_Taylor_SB
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_07`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						GTR11_McSwain_Carved
						GTR94_DR_TomBoy
						GTR22_BC_Rich_Warlock
						GTR84_MM_Petrucci
						GTR101_Hero_Ana
						GTR102_Hero_Axe
						GTR103_Hero_manta
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_07`
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
						GTR72_SCH_Devil
						GTR14_McSwain_Life
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_07`
							attach_indices = [
								1
							]
						}
					]
				}
				{
					parents = [
						GTR74_SCH_Star
						gtr1_sch_tempest
						GTR78_PRS_SC
					]
					node_set = 3
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_07`
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
		desc_id = GTR_Knob_08
		frontend_desc = qs(0x655796b4)
		materials = [
			GTR_Knob_08_Primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						GTR10_McSwain_Flame
						GTR12_McSwain_MInferno
						GTR13_McSwain_Machine
						GTR79_PRS_CSTM24
						GTR80_PRS_SANT
						GTR71_SCH_C1
						GTR70_SCH_Ultra
						GTR75_IBZ_XPT
						GTR76_IBZ_S5470
						GTR77_IBZ_RG
						GTR81_PRS_MiraMT
						GTR83_PRS_STLA
						GTR90_DR_Daisy
						GTR84_MM_Petrucci
						gtr92_DR_Star
						GTR91_DR_Heart
						gtr93_DR_Siren
						GTR20_BC_Rich_Beast
						GTR21_BC_Rich_Warbeast
						gtr86_mm_axis
						GTR104_spider
						GTR105_Skull
						GTR130_Taylor_SB
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_08`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						GTR11_McSwain_Carved
						GTR94_DR_TomBoy
						GTR22_BC_Rich_Warlock
						GTR84_MM_Petrucci
						GTR101_Hero_Ana
						GTR102_Hero_Axe
						GTR103_Hero_manta
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_08`
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
						GTR72_SCH_Devil
						GTR14_McSwain_Life
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_08`
							attach_indices = [
								1
							]
						}
					]
				}
				{
					parents = [
						GTR74_SCH_Star
						gtr1_sch_tempest
						GTR78_PRS_SC
					]
					node_set = 3
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_08`
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
		desc_id = GTR_Knob_08b
		frontend_desc = qs(0xf75f5f7d)
		materials = [
			GTR_Knob_08_Primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						GTR72_SCH_Devil
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_08`
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
		desc_id = GTR_Knob_09
		frontend_desc = qs(0x11b3745c)
		materials = [
			GTR_Knob_09_Primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						GTR10_McSwain_Flame
						GTR12_McSwain_MInferno
						GTR13_McSwain_Machine
						GTR71_SCH_C1
						GTR70_SCH_Ultra
						GTR75_IBZ_XPT
						GTR76_IBZ_S5470
						GTR77_IBZ_RG
						GTR79_PRS_CSTM24
						GTR80_PRS_SANT
						GTR81_PRS_MiraMT
						GTR83_PRS_STLA
						GTR90_DR_Daisy
						GTR84_MM_Petrucci
						gtr92_DR_Star
						GTR91_DR_Heart
						gtr93_DR_Siren
						GTR20_BC_Rich_Beast
						GTR21_BC_Rich_Warbeast
						gtr86_mm_axis
						GTR104_spider
						GTR105_Skull
						GTR130_Taylor_SB
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_09`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						GTR11_McSwain_Carved
						GTR94_DR_TomBoy
						GTR22_BC_Rich_Warlock
						GTR84_MM_Petrucci
						GTR101_Hero_Ana
						GTR102_Hero_Axe
						GTR103_Hero_manta
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_09`
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
						GTR72_SCH_Devil
						GTR14_McSwain_Life
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_09`
							attach_indices = [
								1
							]
						}
					]
				}
				{
					parents = [
						GTR74_SCH_Star
						gtr1_sch_tempest
						GTR78_PRS_SC
					]
					node_set = 3
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_09`
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
		desc_id = GTR_Knob_10
		frontend_desc = qs(0x8ce8c0b3)
		materials = [
			GTR_Knob_10_Primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						GTR10_McSwain_Flame
						GTR12_McSwain_MInferno
						GTR13_McSwain_Machine
						GTR71_SCH_C1
						GTR70_SCH_Ultra
						GTR75_IBZ_XPT
						GTR76_IBZ_S5470
						GTR77_IBZ_RG
						GTR90_DR_Daisy
						GTR84_MM_Petrucci
						gtr92_DR_Star
						GTR91_DR_Heart
						gtr93_DR_Siren
						GTR20_BC_Rich_Beast
						GTR21_BC_Rich_Warbeast
						gtr86_mm_axis
						GTR104_spider
						GTR105_Skull
						GTR130_Taylor_SB
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_10`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						GTR11_McSwain_Carved
						GTR94_DR_TomBoy
						GTR22_BC_Rich_Warlock
						GTR101_Hero_Ana
						GTR102_Hero_Axe
						GTR103_Hero_manta
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_10`
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
						GTR72_SCH_Devil
						GTR14_McSwain_Life
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_10`
							attach_indices = [
								1
							]
						}
					]
				}
				{
					parents = [
						GTR74_SCH_Star
						gtr1_sch_tempest
					]
					node_set = 3
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_10`
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
		desc_id = GTR_Knob_01b
		frontend_desc = qs(0x462738a8)
		materials = [
			GTR_Knob_01_Primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						GTR11_McSwain_Carved
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_01`
							attach_indices = [
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
		desc_id = GTR_Knob_01c
		frontend_desc = qs(0x25442520)
		materials = [
			GTR_Knob_01_Primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						GTR71_SCH_C1
						GTR72_SCH_Devil
						GTR73_SCH_S1
						GTR83_PRS_STLA
						GTR84_MM_Petrucci
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_01`
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
						GTR90_DR_Daisy
						gtr92_DR_Star
						GTR91_DR_Heart
						gtr86_mm_axis
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_01`
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
		desc_id = GTR_Knob_02c
		frontend_desc = qs(0xa96f44f9)
		materials = [
			GTR_Knob_02_Primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						GTR71_SCH_C1
						GTR72_SCH_Devil
						GTR73_SCH_S1
						GTR83_PRS_STLA
						GTR84_MM_Petrucci
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_02`
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
						GTR82_PRS_SE1
						GTR90_DR_Daisy
						gtr92_DR_Star
						GTR91_DR_Heart
						gtr86_mm_axis
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_02`
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
		desc_id = GTR_Knob_03c
		frontend_desc = qs(0x9bcdd20f)
		materials = [
			GTR_Knob_03_Primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						GTR71_SCH_C1
						GTR72_SCH_Devil
						GTR73_SCH_S1
						GTR83_PRS_STLA
						GTR84_MM_Petrucci
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_03`
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
						GTR82_PRS_SE1
						GTR90_DR_Daisy
						gtr92_DR_Star
						GTR91_DR_Heart
						gtr86_mm_axis
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_03`
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
		desc_id = GTR_Knob_04c
		frontend_desc = qs(0x0f21e9b0)
		materials = [
			GTR_Knob_04_Primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						GTR71_SCH_C1
						GTR72_SCH_Devil
						GTR73_SCH_S1
						GTR83_PRS_STLA
						GTR84_MM_Petrucci
						GTR80_PRS_SANT
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_04`
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
						GTR82_PRS_SE1
						GTR90_DR_Daisy
						gtr92_DR_Star
						GTR91_DR_Heart
						gtr86_mm_axis
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_04`
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
		desc_id = GTR_Knob_05c
		frontend_desc = qs(0x8d7a3485)
		materials = [
			GTR_Knob_05_Primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						GTR71_SCH_C1
						GTR72_SCH_Devil
						GTR73_SCH_S1
						GTR83_PRS_STLA
						GTR84_MM_Petrucci
						GTR80_PRS_SANT
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_05`
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
						GTR82_PRS_SE1
						GTR90_DR_Daisy
						gtr92_DR_Star
						GTR91_DR_Heart
						gtr86_mm_axis
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_05`
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
		desc_id = GTR_Knob_06c
		frontend_desc = qs(0xcec054ea)
		materials = [
			GTR_Knob_06_Primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						GTR71_SCH_C1
						GTR72_SCH_Devil
						GTR73_SCH_S1
						GTR83_PRS_STLA
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_06`
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
						GTR82_PRS_SE1
						GTR90_DR_Daisy
						gtr92_DR_Star
						GTR91_DR_Heart
						gtr86_mm_axis
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_06`
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
		desc_id = GTR_Knob_07c
		frontend_desc = qs(0xc64cbd25)
		materials = [
			GTR_Knob_07_Primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						GTR71_SCH_C1
						GTR72_SCH_Devil
						GTR73_SCH_S1
						GTR84_MM_Petrucci
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_07`
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
						GTR82_PRS_SE1
						GTR90_DR_Daisy
						gtr92_DR_Star
						GTR91_DR_Heart
						gtr86_mm_axis
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_07`
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
		desc_id = GTR_Knob_08c
		frontend_desc = qs(0x626d91c0)
		materials = [
			GTR_Knob_08_Primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						GTR71_SCH_C1
						GTR72_SCH_Devil
						GTR73_SCH_S1
						GTR84_MM_Petrucci
						GTR80_PRS_SANT
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_08`
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
						GTR82_PRS_SE1
						GTR90_DR_Daisy
						gtr92_DR_Star
						GTR91_DR_Heart
						gtr86_mm_axis
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_08`
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
		desc_id = GTR_Knob_09c
		frontend_desc = qs(0xd9925e48)
		materials = [
			GTR_Knob_09_Primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						GTR71_SCH_C1
						GTR72_SCH_Devil
						GTR73_SCH_S1
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_09`
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
						GTR82_PRS_SE1
						GTR90_DR_Daisy
						gtr92_DR_Star
						GTR91_DR_Heart
						gtr86_mm_axis
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_09`
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
		desc_id = GTR_Knob_10c
		frontend_desc = qs(0xd9c88d6c)
		materials = [
			GTR_Knob_10_Primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						GTR71_SCH_C1
						GTR72_SCH_Devil
						GTR73_SCH_S1
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_10`
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
						GTR82_PRS_SE1
						GTR90_DR_Daisy
						gtr92_DR_Star
						GTR91_DR_Heart
						gtr86_mm_axis
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_10`
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
		desc_id = GTR_Knob_MM01
		frontend_desc = qs(0xf02b0c3f)
		materials = [
			GTR_Knob_MM01_Primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						GTR84_MM_Petrucci
						GTR71_SCH_C1
						GTR72_SCH_Devil
						GTR73_SCH_S1
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_MM01`
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
		desc_id = PRS_Knob_Lampshade
		frontend_desc = qs(0xc93beecb)
		materials = [
			PRS_Knob_Lampshade_Primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						GTR81_PRS_MiraMT
						GTR79_PRS_CSTM24
						GTR80_PRS_SANT
						GTR83_PRS_STLA
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/PRS/PRS_Knob_Lampshade`
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
		desc_id = PRS_Knob_Lampshade_1
		frontend_desc = qs(0xc93beecb)
		materials = [
			PRS_Knob_Lampshade_Primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						GTR82_PRS_SE1
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/PRS/PRS_Knob_Lampshade`
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
		desc_id = PRS_Knob_Lampshade_3
		frontend_desc = qs(0xc93beecb)
		materials = [
			PRS_Knob_Lampshade_Primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						GTR78_PRS_SC
					]
					node_set = 3
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/PRS/PRS_Knob_Lampshade`
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
		desc_id = PRS_Knob_Lampshade_4
		frontend_desc = qs(0xc93beecb)
		materials = [
			PRS_Knob_Lampshade_Primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						GTR78_PRS_SC
					]
					node_set = 3
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/PRS/PRS_Knob_Lampshade`
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
		desc_id = GTR_Knob_Tophat
		frontend_desc = qs(0x66b0c24a)
		materials = [
			GTR_Knob_Tophat_Primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						GTR82_PRS_SE1
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/knobs/GTR_Knob_Tophat`
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
		desc_id = GTR_Knob_Tophat_2
		frontend_desc = qs(0x66b0c24a)
		materials = [
			GTR_Knob_Tophat_Primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						GTR79_PRS_CSTM24
						GTR80_PRS_SANT
						GTR81_PRS_MiraMT
						GTR83_PRS_STLA
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/knobs/GTR_Knob_Tophat`
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
		desc_id = GTR_Knob_Tophat_3
		frontend_desc = qs(0x66b0c24a)
		materials = [
			GTR_Knob_Tophat_Primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						GTR78_PRS_SC
					]
					node_set = 3
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/knobs/GTR_Knob_Tophat`
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
		desc_id = GTR_Knob_Tophat_W
		frontend_desc = qs(0x6bd46bed)
		materials = [
			GTR_Knob_Tophat_W_Primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						GTR82_PRS_SE1
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/knobs/GTR_Knob_Tophat_W`
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
		desc_id = GTR_Knob_Tophat_W_2
		frontend_desc = qs(0x6bd46bed)
		materials = [
			GTR_Knob_Tophat_W_Primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						GTR79_PRS_CSTM24
						GTR80_PRS_SANT
						GTR81_PRS_MiraMT
						GTR83_PRS_STLA
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/knobs/GTR_Knob_Tophat_W`
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
		desc_id = GTR_Knob_Tophat_W_3
		frontend_desc = qs(0x6bd46bed)
		materials = [
			GTR_Knob_Tophat_W_Primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						GTR78_PRS_SC
					]
					node_set = 3
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/knobs/GTR_Knob_Tophat_W`
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
		desc_id = GTR_Knob_01Kurt
		frontend_desc = qs(0x83d66768)
		materials = [
			GTR_Knob_01Kurt_Primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						GTR78_Kurt
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_01Kurt`
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
		desc_id = GTR_Knob_Manson_01
		frontend_desc = qs(0x57ceba84)
		materials = [
			GTR_Knob_Manson_01_Primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						GTR25_Manson_Bellamy
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_Manson_01`
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
		desc_id = GTR_Knob_13
		frontend_desc = qs(0xa44e7e5c)
		materials = [
			GTR_Knob_13_Primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						GTR130_Taylor_SB
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Knobs/GTR_Knob_13`
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
		desc_id = GTR142_Knob001
		frontend_desc = qs(0x325d59c5)
		materials = [
			GTR142_Knob001_Primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						GTR142_G6e_Body
						GTR142_G6e_BodyT
						GTR142_G6e_Body02
						GTR143_DDSM
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/Taylor/GTR142_Knob001`
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
		desc_id = GTR4_ESP_Knob_10_03
		frontend_desc = qs(0xcc7bacce)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR4_ESP_Knob_10_03`
		materials = [
			GTR4_ESP_Knob_10_03_Primary
		]
	}
	{
		desc_id = GTR4_Knob_02
		frontend_desc = qs(0x8f2cae0b)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR4_Knob_02`
		materials = [
			GTR4_Knob_02_Primary
		]
	}
	{
		desc_id = GTR4_Knob_03
		frontend_desc = qs(0x4e6b4489)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR4_Knob_03`
		materials = [
			GTR4_Knob_03_Primary
		]
	}
	{
		desc_id = GTR4_knob_04
		frontend_desc = qs(0xc99e6543)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR4_Knob_04`
		materials = [
			GTR4_Knob_04_Primary
		]
	}
	{
		desc_id = GTR4_Knob_05
		frontend_desc = qs(0x8ae89cb9)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR4_Knob_05`
		materials = [
			GTR4_Knob_05_Primary
		]
	}
	{
		desc_id = GTR4_Knob_06
		frontend_desc = qs(0xea9acd58)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR4_Knob_06`
		materials = [
			GTR4_Knob_06_Primary
		]
	}
	{
		desc_id = GTR9_ESP_Knob_10_02
		frontend_desc = qs(0x1387d414)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR9_ESP_Knob_10_02`
		materials = [
			GTR4_ESP_Knob_10_03_Primary
		]
	}
	{
		desc_id = GTR9_Knob_02
		frontend_desc = qs(0x8f2cae0b)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR9_Knob_02`
		materials = [
			GTR9_Knob_02_Primary
		]
	}
	{
		desc_id = GTR9_Knob_03
		frontend_desc = qs(0x4e6b4489)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR9_Knob_03`
		materials = [
			GTR9_Knob_03_Primary
		]
	}
	{
		desc_id = GTR9_Knob_04
		frontend_desc = qs(0xc99e6543)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR9_Knob_04`
		materials = [
			GTR9_Knob_04_Primary
		]
	}
	{
		desc_id = GTR9_Knob_06
		frontend_desc = qs(0xea9acd58)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR9_Knob_06`
		materials = [
			GTR9_Knob_06_Primary
		]
	}
	{
		desc_id = GTR12_ESP_Knob_01
		frontend_desc = qs(0x34c902b4)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR12_ESP_Knob_01`
		materials = [
			GTR12_ESP_Knob_01_Primary
		]
	}
	{
		desc_id = GTR12_ESP_Knob_02
		frontend_desc = qs(0x8f2cae0b)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR12_ESP_Knob_02`
		materials = [
			GTR12_ESP_Knob_02_Primary
		]
	}
	{
		desc_id = GTR12_ESP_Knob_03
		frontend_desc = qs(0x4e6b4489)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR12_ESP_Knob_03`
		materials = [
			GTR12_ESP_Knob_03_Primary
		]
	}
	{
		desc_id = GTR12_ESP_Knob_04
		frontend_desc = qs(0xc99e6543)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR12_ESP_Knob_04`
		materials = [
			GTR12_ESP_Knob_04_Primary
		]
	}
	{
		desc_id = GTR12_ESP_Knob_05
		frontend_desc = qs(0x8ae89cb9)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR12_ESP_Knob_05`
		materials = [
			GTR12_ESP_Knob_05_Primary
		]
	}
	{
		desc_id = GTR12_ESP_Knob_06
		frontend_desc = qs(0xea9acd58)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR12_ESP_Knob_06`
		materials = [
			GTR12_ESP_Knob_06_Primary
		]
	}
	{
		desc_id = GTR_30_KNOBS_A
		frontend_desc = qs(0x6ae51c48)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_30_KNOBS_A`
		materials = [
			GTR_31b_KNOBS_Viper_Primary
		]
	}
	{
		desc_id = GTR_30_KNOBS_B
		frontend_desc = qs(0x41c84f8b)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_30_KNOBS_B`
		materials = [
			GTR_36_Knobs_Primary
		]
	}
	{
		desc_id = GTR_30_KNOBS_C
		frontend_desc = qs(0x58d37eca)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_30_KNOBS_C`
		materials = [
			GTR60c_Knob_Type1_Primary
		]
	}
	{
		desc_id = GTR_30_KNOBS_D
		frontend_desc = qs(0x1792e80d)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_30_KNOBS_D`
		materials = [
			GTR_Knob_Type4_01_Primary
		]
	}
	{
		desc_id = GTR_30_KNOBS_E
		frontend_desc = qs(0x0e89d94c)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_30_KNOBS_E`
		materials = [
			GTR12H_Knob_Primary
		]
	}
	{
		desc_id = GTR_31_KNOBS_VPR
		frontend_desc = qs(0x4ce53e6a)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_31b_KNOBS_Vpr`
		materials = [
			GTR_31b_KNOBS_Viper_Primary
		]
	}
	{
		desc_id = GTR_31_KNOBS_C
		frontend_desc = qs(0xe650fc7c)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_31_KNOBS_C`
		materials = [
			GTR60c_Knob_Type1_Primary
		]
	}
	{
		desc_id = GTR_31_KNOBS_D
		frontend_desc = qs(0x4b3fc55e)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_31_KNOBS_D`
		materials = [
			GTR_Knob_Type4_01_Primary
		]
	}
	{
		desc_id = GTR_31_KNOBS_E
		frontend_desc = qs(0x24ff7e81)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_31_KNOBS_E`
		materials = [
			GTR12H_Knob_Primary
		]
	}
	{
		desc_id = GTR_32_KNOBS_A
		frontend_desc = qs(0xf5c42fb0)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_32_KNOBS_A`
		materials = [
			GTR_32_Knobs01_Primary
		]
	}
	{
		desc_id = GTR_32_KNOBS_B
		frontend_desc = qs(0xdee97c73)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_32_KNOBS_B`
		materials = [
			GTR_36_Knobs_Primary
		]
	}
	{
		desc_id = GTR_32_KNOBS_C
		frontend_desc = qs(0xc7f24d32)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_32_KNOBS_C`
		materials = [
			GTR60c_Knob_Type1_Primary
		]
	}
	{
		desc_id = GTR_32_KNOBS_D
		frontend_desc = qs(0x88b3dbf5)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_32_KNOBS_D`
		materials = [
			GTR_Knob_Type4_01_Primary
		]
	}
	{
		desc_id = GTR_32_KNOBS_E
		frontend_desc = qs(0x91a8eab4)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_32_KNOBS_E`
		materials = [
			GTR12H_Knob_Primary
		]
	}
	{
		desc_id = GTR33_Knobs_KH2
		frontend_desc = qs(0xb7370f85)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_33_KNOBS_KH2`
		materials = [
			GTR_33_Knobs_Primary
		]
	}
	{
		desc_id = GTR_33_KNOBS_A
		frontend_desc = qs(0xfec4db1d)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_33_KNOBS_A`
		materials = [
			GTR_31b_KNOBS_Viper_Primary
		]
	}
	{
		desc_id = GTR_33_KNOBS_B
		frontend_desc = qs(0xd5e988de)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_33_KNOBS_B`
		materials = [
			GTR_36_Knobs_Primary
		]
	}
	{
		desc_id = GTR_33_KNOBS_C
		frontend_desc = qs(0xccf2b99f)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_33_KNOBS_C`
		materials = [
			GTR60c_Knob_Type1_Primary
		]
	}
	{
		desc_id = GTR_33_KNOBS_D
		frontend_desc = qs(0x83b32f58)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_33_KNOBS_D`
		materials = [
			GTR_Knob_Type4_01_Primary
		]
	}
	{
		desc_id = GTR_33_KNOBS_E
		frontend_desc = qs(0x9aa81e19)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_33_KNOBS_E`
		materials = [
			GTR12H_Knob_Primary
		]
	}
	{
		desc_id = GTR_36_Knobs_A
		frontend_desc = qs(0xd6b5be34)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_36_KNOBS_A`
		materials = [
			GTR_31b_KNOBS_Viper_Primary
		]
	}
	{
		desc_id = GTR_36_Knobs_B
		frontend_desc = qs(0xfd98edf7)
		mesh = `models/CAR_Instruments/Guitar/ESP/gtr_36_KNOBS_B`
		materials = [
			GTR_36_Knobs_Primary
		]
	}
	{
		desc_id = GTR_36_Knobs_C
		frontend_desc = qs(0xe483dcb6)
		mesh = `models/CAR_Instruments/Guitar/ESP/gtr_36_KNOBS_C`
		materials = [
			GTR60c_Knob_Type1_Primary
		]
	}
	{
		desc_id = GTR_36_Knobs_D
		frontend_desc = qs(0xabc24a71)
		mesh = `models/CAR_Instruments/Guitar/ESP/gtr_36_KNOBS_D`
		materials = [
			GTR_Knob_Type4_01_Primary
		]
	}
	{
		desc_id = GTR_36_Knobs_E
		frontend_desc = qs(0xb2d97b30)
		mesh = `models/CAR_Instruments/Guitar/ESP/gtr_36_KNOBS_E`
		materials = [
			GTR12H_Knob_Primary
		]
	}
	{
		desc_id = GTR37_Knobs01
		frontend_desc = qs(0x7f5c191d)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR37_Knobs01`
		materials = [
			GTR37_Knobs_Primary
		]
	}
	{
		desc_id = GTR62_Knob_Type01
		frontend_desc = qs(0x8ae89cb9)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR62_Knob_Type01`
		materials = [
			GTR62_Knob_Type01_Primary
		]
	}
	{
		desc_id = GTR62_Knob_Type02
		frontend_desc = qs(0x4e6b4489)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR62_Knob_Type02`
		materials = [
			GTR62_Knob_Type02_Primary
		]
	}
	{
		desc_id = GTR62_Knob_Type03
		frontend_desc = qs(0x34c902b4)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR62_Knob_Type03`
		materials = [
			GTR62_Knob_Type03_Primary
		]
	}
	{
		desc_id = GTR62_Knob_Type04
		frontend_desc = qs(0x8f2cae0b)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR62_Knob_Type04`
		materials = [
			GTR62_Knob_Type04_Primary
		]
	}
	{
		desc_id = GTR62_Knob_Type05
		frontend_desc = qs(0xea9acd58)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR62_Knob_Type05`
		materials = [
			GTR62_Knob_Type05_Primary
		]
	}
	{
		desc_id = GTR62_Knob_Type06
		frontend_desc = qs(0xc99e6543)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR62_Knob_Type06`
		materials = [
			GTR62_Knob_Type06_Primary
		]
	}
	{
		desc_id = GTR63c_Knob_Type1
		frontend_desc = qs(0x0330fcc6)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR63c_Knob_Type1`
		materials = [
			GTR63c_Knob_Type1_Primary
		]
	}
	{
		desc_id = GTR63_Knob_Type2
		frontend_desc = qs(0x8f2cae0b)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR63_Knob_Type2`
		materials = [
			GTR63_Knob_Type2_Primary
		]
	}
	{
		desc_id = GTR63_Knob_Type3
		frontend_desc = qs(0x4e6b4489)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR63_Knob_Type3`
		materials = [
			GTR63_Knob_Type3_Primary
		]
	}
	{
		desc_id = GTR63_Knob_Type4
		frontend_desc = qs(0xc99e6543)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR63_Knob_Type4`
		materials = [
			GTR63_Knob_Type4_Primary
		]
	}
	{
		desc_id = GTR63_Knob_Type5
		frontend_desc = qs(0x8ae89cb9)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR63_Knob_Type5`
		materials = [
			GTR63_Knob_Type5_Primary
		]
	}
	{
		desc_id = GTR63_Knob_Type06
		frontend_desc = qs(0x34c902b4)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR63_Knob_Type06`
		materials = [
			GTR63_Knob_Type06_Primary
		]
	}
	{
		desc_id = GTR64_Knob_Type1
		frontend_desc = qs(0x2a068a61)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR64_Knob_Type1`
		materials = [
			GTR64_Knob_Type1_Primary
		]
	}
	{
		desc_id = GTR64_Knob_Type2
		frontend_desc = qs(0x8f2cae0b)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR64_Knob_Type2`
		materials = [
			GTR64_Knob_Type2_Primary
		]
	}
	{
		desc_id = GTR64_Knob_Type3
		frontend_desc = qs(0x4e6b4489)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR64_Knob_Type3`
		materials = [
			GTR64_Knob_Type3_Primary
		]
	}
	{
		desc_id = GTR64_Knob_Type4
		frontend_desc = qs(0xc99e6543)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR64_Knob_Type4`
		materials = [
			GTR64_Knob_Type4_Primary
		]
	}
	{
		desc_id = GTR64_Knob_Type5
		frontend_desc = qs(0x8ae89cb9)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR64_Knob_Type5`
		materials = [
			GTR64_Knob_Type5_Primary
		]
	}
	{
		desc_id = GTR64_Knob_Type6
		frontend_desc = qs(0xea9acd58)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR64_Knob_Type6`
		materials = [
			GTR64_Knob_Type6_Primary
		]
	}
	{
		desc_id = GTR66_Knob_Type1
		frontend_desc = qs(0x34c902b4)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR66_Knob_Type1`
		materials = [
			GTR66_Knob_Type1_Primary
		]
	}
	{
		desc_id = None
		frontend_desc = qs(0x9c1b5214)
		random_weight = 10.0
	}
]
CAS_Guitar_Bridges = [
	{
		desc_id = GTR4_ESP_Bridge_02
		frontend_desc = qs(0xe3256784)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR4_ESP_Bridge_02`
		materials = [
			GTR4_ESP_Bridge_02_Primary
		]
		guitar_string_start = GTR4_ESP_Bridge_02_str_start_properties
	}
	{
		desc_id = GTR4_Bridge_FR10
		frontend_desc = qs(0x5f83866e)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR4_Bridge_FR10`
		materials = [
			GTR4_Bridge_FR10_Primary
		]
		guitar_string_start = GTR4_Bridge_FR10_str_start_properties
	}
	{
		desc_id = GTR4_ESP_Bridge_9
		frontend_desc = qs(0xddfd5fc4)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR4_ESP_Bridge_9`
		materials = [
			GTR4_ESP_Bridge_9_Primary
		]
		guitar_string_start = GTR4_ESP_Bridge_9_str_start_properties
	}
	{
		desc_id = GTR9_ESP_Bridge_03
		frontend_desc = qs(0xddfd5fc4)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR9_ESP_Bridge_03`
		materials = [
			GTR9_ESP_Bridge_03_Primary
		]
		guitar_string_start = GTR4_ESP_Bridge_9_str_start_properties
	}
	{
		desc_id = GTR9_Bridge_FR11
		frontend_desc = qs(0x5f83866e)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR9_Bridge_FR11`
		materials = [
			GTR9_Bridge_FR11_Primary
		]
		guitar_string_start = GTR9_Bridge_FR11_str_start_properties
		guitar_string_end = default_guitar_string_end_properties
	}
	{
		desc_id = GTR9_Bridge_04
		frontend_desc = qs(0xe3256784)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR9_Bridge_04`
		materials = [
			GTR9_Bridge_04_Primary
		]
		guitar_string_start = GTR9_ESP_Bridge_04_str_start_properties
	}
	{
		desc_id = GTR12_Bridge_1
		frontend_desc = qs(0x023a6f1d)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR12_Bridge_1`
		materials = [
			GTR12_Bridge_1_Primary
		]
		guitar_string_start = GTR12_Bridge_1_str_start_properties
		guitar_string_end = GTR12_Bridge_1_end_properties
	}
	{
		desc_id = GTR12_Bridge_2
		frontend_desc = qs(0xe3256784)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR12_Bridge_2`
		materials = [
			GTR12_Bridge_2_Primary
		]
		guitar_string_start = GTR12_Bridge_2_str_start_properties
	}
	{
		desc_id = GTR12_Bridge_3
		frontend_desc = qs(0xddfd5fc4)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR12_Bridge_3`
		materials = [
			GTR12_Bridge_3_Primary
		]
		guitar_string_start = GTR12_Bridge_3_str_start_properties
	}
	{
		desc_id = GTR30_Brdg_StrgThru
		frontend_desc = qs(0xddfd5fc4)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR30_Brdg_StrgThru`
		materials = [
			GTR30_Brdg_StrgThru_Primary
		]
		guitar_string_start = GTR30_Brdg_StrgThru_str_start_properties
	}
	{
		desc_id = GTR30_Hardware_03
		frontend_desc = qs(0x6973bba6)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR30_Hardware_03`
		materials = [
			GTR30_Hardware_03_Primary
		]
		guitar_string_start = GTR30_Hardware_03_str_start_properties
	}
	{
		desc_id = GTR30_Bridge_D
		frontend_desc = qs(0xe3256784)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR30_Bridge_D`
		materials = [
			GTR30_Bridge_D_Primary
		]
		guitar_string_start = GTR30_Bridge_D_str_start_properties
	}
	{
		desc_id = GTR31_Bridge_TM02
		frontend_desc = qs(0xe3256784)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR31_Bridge_TM02`
		materials = [
			GTR31_Bridge_TM02_Primary
		]
		guitar_string_start = GTR31_Bridge_TM02_str_start_properties
	}
	{
		desc_id = GTR31_Hardware_B
		frontend_desc = qs(0x6973bba6)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR31_Hardware_B`
		materials = [
			GTR31_Hardware_B_Primary
		]
		guitar_string_start = GTR31_Hardware_B_str_start_properties
	}
	{
		desc_id = GTR_31_Bridge_E
		frontend_desc = qs(0x81204927)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_31_Bridge_E`
		materials = [
			GTR_31_Bridge_E_Primary
		]
		guitar_string_start = GTR31_Hardware_E_str_start_properties
	}
	{
		desc_id = GTR32_Hardware01
		frontend_desc = qs(0xe3256784)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR32_Hardware01`
		materials = [
			GTR32_Hardware01_Primary
		]
		guitar_string_start = GTR32_Hardware01_str_start_properties
	}
	{
		desc_id = GTR33_Hardware01Z
		frontend_desc = qs(0xe3256784)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR33_Hardware01Z`
		materials = [
			GTR33_Hardware01Z_Primary
		]
		guitar_string_start = GTR32_Hardware01_str_start_properties
	}
	{
		desc_id = GTR36_Hardware01
		frontend_desc = qs(0xe3256784)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR36_Hardware01`
		materials = [
			GTR36_Hardware01_Primary
		]
		guitar_string_start = GTR36_Hardware01_str_start_properties
	}
	{
		desc_id = GTR37_Bridge
		frontend_desc = qs(0xe9a73532)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR37_Bridge`
		materials = [
			GTR37_Bridge_Primary
		]
		guitar_string_start = GTR37_Bridge_str_string_start_properties
	}
	{
		desc_id = GTR37_Hardware
		frontend_desc = qs(0xe3256784)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR37_Hardware`
		materials = [
			GTR37_Hardware_Primary
		]
		guitar_string_start = GTR37_Hardware_str_string_start_properties
	}
	{
		desc_id = GTR37_Brdg_ST
		frontend_desc = qs(0xddfd5fc4)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR37_Brdg_ST`
		materials = [
			GTR37_Brdg_ST_Primary
		]
		guitar_string_start = GTR37_Brdg_ST_str_string_start_properties
	}
	{
		desc_id = GTR_Hardware62
		frontend_desc = qs(0x739e5905)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Hardware62`
		materials = [
			GTR_Hardware62_Primary
		]
		guitar_string_start = GTR_Hardware60b_start_properties
		guitar_string_end = GTR_Hardware60b_end_properties
	}
	{
		desc_id = GTR_Hardware62a
		frontend_desc = qs(0x81204927)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Hardware62a`
		materials = [
			GTR_Hardware62a_Primary
		]
		guitar_string_start = GTR_Hardware60b_str_start_properties
		guitar_string_end = GTR_Hardware60b_end_properties
	}
	{
		desc_id = GTR_Hardware02
		frontend_desc = qs(0x023a6f1d)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Hardware02`
		materials = [
			GTR_Hardware02_Primary
		]
		guitar_string_start = GTR_Hardware02_str_start_properties
	}
	{
		desc_id = GTR_Hardware64
		frontend_desc = qs(0xe3256784)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Hardware64`
		materials = [
			GTR_Hardware64_Primary
		]
		guitar_string_start = GTR_Hardware64_str_start_properties
	}
	{
		desc_id = GTR_Hardware60b
		frontend_desc = qs(0xe3256784)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Hardware60b`
		materials = [
			GTR_Hardware60b_Primary
		]
		guitar_string_start = GTR_Hardware60b_start_properties
		guitar_string_end = GTR_Hardware60b_end_properties
	}
	{
		desc_id = GTR_Hardware63
		frontend_desc = qs(0xe3256784)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Hardware63`
		materials = [
			GTR_Hardware63_Primary
		]
	}
	{
		desc_id = GTR_Hardware63b
		frontend_desc = qs(0x023a6f1d)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Hardware63b`
		materials = [
			GTR_Hardware63b_Primary
		]
		guitar_string_start = GTR_Hardware63f_str_start_properties
	}
	{
		desc_id = GTR_Hardware63f
		frontend_desc = qs(0xe3256784)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Hardware63f`
		materials = [
			GTR_Hardware63f_Primary
		]
		guitar_string_start = GTR_Hardware63b_str_start_properties
	}
	{
		desc_id = GTR_hardware64b
		frontend_desc = qs(0xddfd5fc4)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_hardware64b`
		materials = [
			GTR_hardware64b_Primary
		]
		guitar_string_start = GTR_Hardware64b_str_start_properties
	}
	{
		desc_id = GTR_Hardware64bb
		frontend_desc = qs(0x023a6f1d)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Hardware64bb`
		materials = [
			GTR_Hardware64bb_Primary
		]
		guitar_string_start = GTR_Hardware64bb_str_start_properties
	}
	{
		desc_id = GTR_Hardware64f
		frontend_desc = qs(0xe3256784)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Hardware64f`
		materials = [
			GTR_Hardware64f_Primary
		]
		guitar_string_start = GTR_Hardware64f_str_start_properties
	}
	{
		desc_id = GTR_Hardware66
		frontend_desc = qs(0xa956861e)
		mesh = `models/CAR_Instruments/Guitar/ESP/GTR_Hardware66`
		materials = [
			GTR_Hardware66_Primary
		]
		guitar_string_start = GTR_bridge_66_str_start_properties
	}
	{
		desc_id = None
		frontend_desc = qs(0x9c1b5214)
		random_weight = 10.0
	}
	{
		desc_id = GTR22_Bridge_Whammy1
		frontend_desc = qs(0x22b11e8c)
		materials = [
			GTR22_Bridge_Whammy1_Primary
		]
		guitar_string_start = GTR22_Bridge_Whammy1_str_start_properties
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						GTR20_BC_Rich_Beast
						GTR21_BC_Rich_Warbeast
						GTR22_BC_Rich_Warlock
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Bridges/GTR22_Bridge_Whammy1`
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
		desc_id = GTR_BC_Rich_Bridge_21
		frontend_desc = qs(0xc3bc3aa5)
		materials = [
			GTR_BC_Rich_Bridge_21_Primary
		]
		guitar_string_start = GTR_BC_Rich_Bridge_21_str_start_properties
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						GTR20_BC_Rich_Beast
						GTR21_BC_Rich_Warbeast
						GTR22_BC_Rich_Warlock
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Bridges/GTR_BC_Rich_Bridge_21`
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
		desc_id = Gtr10_Bridge_McSwain_1
		frontend_desc = qs(0xcf7d93bc)
		materials = [
			Gtr10_Bridge_McSwain_1_Primary
		]
		guitar_string_start = Gtr10_Bridge_McSwain_1_str_start_properties
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						GTR10_McSwain_Flame
						GTR11_McSwain_Carved
						GTR12_McSwain_MInferno
						GTR13_McSwain_Machine
						GTR14_McSwain_Life
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Bridges/Gtr10_Bridge_McSwain_1`
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
		desc_id = GTR_Bridge_McSwain_2
		frontend_desc = qs(0xd695a9e9)
		materials = [
			GTR_Bridge_McSwain_2_Primary
		]
		guitar_string_start = GTR_Bridge_McSwain_2_str_start_properties
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						GTR11_McSwain_Carved
						GTR12_McSwain_MInferno
						GTR13_McSwain_Machine
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Bridges/GTR_Bridge_McSwain_2`
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
		desc_id = GTR_Brdg_McSwn_inferno_3
		frontend_desc = qs(0x00db211c)
		materials = [
			GTR_Brdg_McSwn_inferno_3_Primary
		]
		guitar_string_start = GTR_Brdg_McSwn_inferno_3_str_start_properties
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						GTR10_McSwain_Flame
						GTR11_McSwain_Carved
						GTR12_McSwain_MInferno
						GTR13_McSwain_Machine
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Bridges/GTR_Brdg_McSwn_inferno_3`
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
		desc_id = GTR_Bridge_McSwain_2b
		frontend_desc = qs(0xd695a9e9)
		materials = [
			GTR_Bridge_McSwain_2_Primary
		]
		guitar_string_start = GTR_Bridge_McSwain_2_str_start_properties
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						GTR14_McSwain_Life
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Bridges/GTR_Bridge_McSwain_2`
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
		desc_id = GTR_Brdg_McSwn_inferno_3b
		frontend_desc = qs(0x00db211c)
		materials = [
			GTR_Brdg_McSwn_inferno_3_Primary
		]
		guitar_string_start = GTR_Brdg_McSwn_inferno_3_str_start_properties
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						GTR14_McSwain_Life
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Bridges/GTR_Brdg_McSwn_inferno_3`
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
		desc_id = GTR_Bridge_McSwain_L_4
		frontend_desc = qs(0xb43e5fb8)
		materials = [
			GTR_Bridge_McSwain_L_4_Primary
		]
		guitar_string_start = GTR_Bridge_McSwain_L_4_str_start_properties
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						GTR10_McSwain_Flame
						GTR11_McSwain_Carved
						GTR12_McSwain_MInferno
						GTR13_McSwain_Machine
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Bridges/GTR_Bridge_McSwain_L_4`
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
		desc_id = GTR_Bridge_McSwain_L_5
		frontend_desc = qs(0xec5392ce)
		materials = [
			GTR_Bridge_McSwain_L_5_Primary
		]
		guitar_string_start = GTR_Bridge_McSwain_L_5_str_start_properties
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						GTR14_McSwain_Life
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Bridges/GTR_Bridge_McSwain_L_5`
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
		desc_id = GTR_Bridge_McSwain_6
		frontend_desc = qs(0xd1fe756b)
		materials = [
			GTR_Bridge_McSwain_6_Primary
		]
		guitar_string_start = GTR_Bridge_McSwain_6_str_start_properties
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						GTR10_McSwain_Flame
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/McSwain/GTR_Bridge_McSwain_6`
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
		desc_id = GTR_Bridge_01
		frontend_desc = qs(0xe3256784)
		guitar_string_start = GTR_Bridge_01b_str_start_properties
		materials = [
			GTR_Hardware03a_Primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						GTR70_SCH_Ultra
						GTR71_SCH_C1
						GTR72_SCH_Devil
						GTR73_SCH_S1
						GTR74_SCH_Star
						gtr1_sch_tempest
						GTR102_Hero_Axe
						GTR103_Hero_manta
						GTR104_spider
						GTR105_Skull
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Bridges/GTR_Bridge_01`
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
		desc_id = GTR70_Bridge
		frontend_desc = qs(0x53951716)
		guitar_string_start = GTR70_Bridge_str_start_properties
		materials = [
			GTR70_Bridge_Primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						GTR70_SCH_Ultra
						GTR71_SCH_C1
						GTR72_SCH_Devil
						GTR73_SCH_S1
						GTR74_SCH_Star
						gtr1_sch_tempest
						GTR83_PRS_STLA
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Bridges/GTR70_Bridge`
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
		desc_id = GTR72_Bridge
		frontend_desc = qs(0xddfd5fc4)
		guitar_string_start = GTR72_Bridge_str_start_properties
		materials = [
			GTR72_Bridge_Primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						GTR72_SCH_Devil
						GTR73_SCH_S1
						GTR74_SCH_Star
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Bridges/GTR72_Bridge`
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
		desc_id = GTR71_Bridge
		frontend_desc = qs(0xddfd5fc4)
		guitar_string_start = GTR71_Bridge_str_start_properties
		materials = [
			GTR71_Bridge_Primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						GTR71_SCH_C1
						GTR70_SCH_Ultra
						gtr1_sch_tempest
						GTR130_Taylor_SB
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Bridges/GTR71_Bridge`
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
		desc_id = GTR74_Bridge1
		frontend_desc = qs(0x364bf61b)
		guitar_string_start = GTR74_Bridge_str_start_properties
		materials = [
			GTR74_Bridge1_Primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						GTR71_SCH_C1
						GTR70_SCH_Ultra
						GTR72_SCH_Devil
						GTR74_SCH_Star
						gtr1_sch_tempest
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Bridges/GTR74_Bridge1`
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
		desc_id = GTR74_Bridge1b
		frontend_desc = qs(0x0edbe187)
		guitar_string_start = GTR74_Bridge_str_start_properties
		materials = [
			GTR74_Bridge1_Primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						GTR73_SCH_S1
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Bridges/GTR74_Bridge1`
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
		desc_id = GTR75_bridge
		frontend_desc = qs(0xec82e0a4)
		guitar_string_start = GTR75_bridge_str_start_properties
		materials = [
			GTR75_bridge_Primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						GTR75_IBZ_XPT
						GTR76_IBZ_S5470
						GTR77_IBZ_RG
						GTR102_Hero_Axe
						GTR103_Hero_manta
						GTR104_spider
						GTR105_Skull
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Bridges/GTR75_bridge`
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
		desc_id = GTR75_bridge2
		frontend_desc = qs(0x2d748c5a)
		guitar_string_start = GTR75_bridge2_str_start_properties
		materials = [
			GTR75_bridge2_Primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						GTR75_IBZ_XPT
						GTR76_IBZ_S5470
						GTR77_IBZ_RG
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Bridges/GTR75_bridge2`
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
		desc_id = GTR77_bridge
		frontend_desc = qs(0x7e89c2d1)
		guitar_string_start = GTR77_bridge_str_start_properties
		materials = [
			GTR77_bridge_Primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						GTR75_IBZ_XPT
						GTR76_IBZ_S5470
						GTR77_IBZ_RG
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Bridges/GTR77_bridge`
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
		desc_id = GTR75_bridgeb
		frontend_desc = qs(0xb22f7ed7)
		guitar_string_start = GTR79_Whammy_str_start_properties
		materials = [
			GTR_Hardware64bc_Primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						GTR75_IBZ_XPT
						GTR76_IBZ_S5470
						GTR77_IBZ_RG
						GTR102_Hero_Axe
						GTR103_Hero_manta
						GTR104_spider
						GTR105_Skull
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Bridges/GTR75_bridgeb`
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
		desc_id = GTR76_bridge
		frontend_desc = qs(0xfe8b53a6)
		guitar_string_start = GTR76_bridge_str_start_properties
		materials = [
			GTR76_Bridge_Primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						GTR75_IBZ_XPT
						GTR76_IBZ_S5470
						GTR77_IBZ_RG
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Bridges/GTR76_bridge`
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
		desc_id = gtr78_bridge
		frontend_desc = qs(0x8588767a)
		guitar_string_start = Kurt_bridge_str_start_properties
		materials = [
			gtr78_bridge_Primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						GTR78_Kurt
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Bridges/gtr78_bridge`
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
		desc_id = GTR_Bridge_McSwain_L_4B
		frontend_desc = qs(0x6973bba6)
		materials = [
			GTR_Bridge_McSwain_L_4_Primary
		]
		guitar_string_start = GTR_Bridge_McSwain_L_4_str_start_properties
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						GTR90_DR_Daisy
						GTR91_DR_Heart
						gtr92_DR_Star
						gtr93_DR_Siren
						GTR94_DR_TomBoy
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Bridges/GTR_Bridge_McSwain_L_4`
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
		desc_id = GTR_Bridge_01D
		frontend_desc = qs(0x421f0555)
		materials = [
			GTR_Hardware03a_Primary
		]
		guitar_string_start = GTR_Bridge_01_str_start_properties
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						GTR90_DR_Daisy
						GTR91_DR_Heart
						gtr92_DR_Star
						gtr93_DR_Siren
						GTR94_DR_TomBoy
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Bridges/GTR_Bridge_01`
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
		desc_id = GTR94_Bridge
		frontend_desc = qs(0xc69b70de)
		guitar_string_start = GTR94_Bridge_str_start_properties
		materials = [
			GTR94_Bridge_Primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						GTR94_DR_TomBoy
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Bridges/GTR94_Bridge`
							attach_indices = [
								1
							]
						}
					]
				}
				{
					parents = [
						GTR90_DR_Daisy
						GTR91_DR_Heart
						gtr92_DR_Star
						gtr93_DR_Siren
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Bridges/GTR94_Bridge`
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
		desc_id = GTR75_bridgeMM
		frontend_desc = qs(0xb62696a4)
		guitar_string_start = GTR79_Whammy_str_start_properties
		materials = [
			GTR75_bridge_Primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						GTR84_MM_Petrucci
						GTR80_PRS_SANT
						gtr86_mm_axis
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Bridges/GTR75_bridge`
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
		desc_id = GTR75_bridgeBMM
		frontend_desc = qs(0x48fac7b7)
		guitar_string_start = GTR79_Whammy_str_start_properties
		materials = [
			GTR_Hardware64bc_Primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						GTR84_MM_Petrucci
						GTR82_PRS_SE1
						gtr86_mm_axis
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Bridges/GTR75_bridgeb`
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
		desc_id = GTR76_bridgeMM
		frontend_desc = qs(0xfe8b53a6)
		guitar_string_start = GTR76_bridge_str_start_properties
		materials = [
			GTR76_Bridge_Primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						GTR82_PRS_SE1
						GTR84_MM_Petrucci
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Bridges/GTR76_bridge`
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
		desc_id = GTR84_Whammy
		frontend_desc = qs(0x5fb58f3c)
		guitar_string_start = GTR84_Whammy_str_start_properties
		materials = [
			GTR84_Whammy_Primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						GTR84_MM_Petrucci
						gtr86_mm_axis
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Bridges/GTR84_Whammy`
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
		desc_id = GTR86_Bridge
		frontend_desc = qs(0x71de0a90)
		guitar_string_start = GTR86_Bridge_str_start_properties
		materials = [
			GTR86_Bridge_Primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr86_mm_axis
						GTR84_MM_Petrucci
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Bridges/GTR86_Bridge`
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
		desc_id = GTR79_Whammy
		frontend_desc = qs(0x602994d6)
		guitar_string_start = GTR79_Bridge_str_start_properties
		materials = [
			GTR79_Whammy_Primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						GTR79_PRS_CSTM24
						GTR80_PRS_SANT
						GTR81_PRS_MiraMT
						GTR82_PRS_SE1
						GTR78_PRS_SC
						GTR83_PRS_STLA
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Bridges/GTR79_Whammy`
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
		desc_id = GTR78_Bridge01
		frontend_desc = qs(0x3694d3be)
		guitar_string_start = GTR78_Bridge01_str_start_properties
		materials = [
			GTR81_Bridge01_Primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						GTR79_PRS_CSTM24
						GTR80_PRS_SANT
						GTR81_PRS_MiraMT
						GTR82_PRS_SE1
						GTR78_PRS_SC
						GTR83_PRS_STLA
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Bridges/GTR78_Bridge01`
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
		desc_id = GTR81_Bridge01
		frontend_desc = qs(0xbd6acc58)
		guitar_string_start = GTR81_Bridge_str_start_properties
		materials = [
			GTR81_Bridge01_Primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						GTR79_PRS_CSTM24
						GTR80_PRS_SANT
						GTR81_PRS_MiraMT
						GTR82_PRS_SE1
						GTR78_PRS_SC
						GTR83_PRS_STLA
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Bridges/GTR81_Bridge01`
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
		desc_id = GTR101_bridge
		frontend_desc = qs(0x6f183f3c)
		guitar_string_start = GTR101_bridge_str_start_properties
		materials = [
			GTR101_bridge_Primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						GTR101_Hero_Ana
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Bridges/GTR101_bridge`
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
		desc_id = GTR27_Bridge_Acoustic
		frontend_desc = qs(0x2e63e837)
		guitar_string_start = GTR26_Bridge_Cash_string_start_properties
		materials = [
			GTR27_Bridge_Acoustic_Primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						GTR27_NSFT_Acoustic
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/Heroes/GTR27_Bridge_Acoustic`
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
		desc_id = GTR130_Bridge
		frontend_desc = qs(0xd728a0be)
		guitar_string_start = GTR130_Bridge_str_start_properties
		materials = [
			GTR130_Bridge_Primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						GTR130_Taylor_SB
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Bridges/GTR130_Bridge`
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
		desc_id = GTR142_G6e_Bridg
		frontend_desc = qs(0x27a61dcc)
		guitar_string_start = GTR26_Bridge_Cash_string_start_properties
		materials = [
			GTR142_G6e_Bridg_Primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						GTR142_G6e_Body
						GTR142_G6e_Body02
						GTR143_DDSM
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/Taylor/GTR142_G6e_Bridg`
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
		desc_id = GTR142_G6e_BridgT
		frontend_desc = qs(0x1013fbd8)
		guitar_string_start = GTR26_Bridge_Cash_string_start_properties
		guitar_string_end = GTR142_G6e_BridgT_end_properties
		materials = [
			GTR142_G6e_Bridg_Primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						GTR142_G6e_BodyT
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/Taylor/GTR142_G6e_Bridg`
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
		desc_id = GTR143_DDSM_Bridg
		frontend_desc = qs(0x0c8b4e0f)
		guitar_string_start = GTR26_Bridge_Cash_string_start_properties
		materials = [
			GTR143_DDSM_Bridg_Primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						GTR142_G6e_Body02
						GTR143_DDSM
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/Taylor/GTR143_DDSM_Bridg`
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
		desc_id = GTR26_Bridge_Cash
		frontend_desc = qs(0x6008ec21)
		guitar_string_start = GTR26_Bridge_Cash_string_start_properties
		materials = [
			GTR26_Bridge_Cash_Primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						GTR26_Cash_Acoustic
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/Cash/GTR26_Bridge_Cash`
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
		desc_id = GTR_Brdg_Manson_1
		frontend_desc = qs(0x499d4ecc)
		materials = [
			GTR_Brdg_Manson_1_Primary
		]
		guitar_string_start = GTR_Brdg_Manson_1_str_start_properties
		guitar_string_end = default_guitar_string_end_properties
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						GTR25_Manson_Bellamy
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Bridges/GTR_Brdg_Manson_1`
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
CAS_Guitar_Misc = [
	{
		desc_id = GTR_Misc_Switch
		frontend_desc = qs(0xc6154ac3)
		materials = [
			GTR_Misc_Switch2_Primary
		]
		node_meshes = {
			$guitar_misc_nodes
			placements = [
				{
					parents = [
						GTR10_McSwain_Flame
						GTR11_McSwain_Carved
						GTR12_McSwain_MInferno
						GTR14_McSwain_Life
						GTR20_BC_Rich_Beast
						GTR21_BC_Rich_Warbeast
						GTR22_BC_Rich_Warlock
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Misc/GTR_Misc_Switch2`
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
		desc_id = GTR_Misc_Switch_blk_3
		frontend_desc = qs(0x2796be6a)
		materials = [
			GTR_Misc_Switch_blk_3_Primary
		]
		node_meshes = {
			$guitar_misc_nodes
			placements = [
				{
					parents = [
						GTR10_McSwain_Flame
						GTR11_McSwain_Carved
						GTR12_McSwain_MInferno
						GTR14_McSwain_Life
						GTR20_BC_Rich_Beast
						GTR21_BC_Rich_Warbeast
						GTR22_BC_Rich_Warlock
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Misc/GTR_Misc_Switch_blk_3`
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
		desc_id = GTR13_Misc_Gauges
		frontend_desc = qs(0x940675f9)
		node_meshes = {
			$guitar_misc_nodes
			placements = [
				{
					parents = [
						GTR13_McSwain_Machine
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Misc/GTR13_Misc_Gauges`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Misc/GTR13_Misc_Gauges_Glow`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Misc/GTR13_Misc_Switch1`
							tex = `models/CAR_Instruments/Guitar/GH5/Misc/GTR13_Misc_Gauges`
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
		desc_id = GTR13_Misc_Switch
		frontend_desc = qs(0x93a392c2)
		node_meshes = {
			$guitar_misc_nodes
			placements = [
				{
					parents = [
						GTR13_McSwain_Machine
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Misc/GTR13_Misc_Switch1`
							tex = `models/CAR_Instruments/Guitar/GH5/Misc/GTR13_Misc_Gauges`
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
		desc_id = GTR_Misc_McSwn_swtch1
		frontend_desc = qs(0xc7fe120a)
		node_meshes = {
			$guitar_misc_nodes
			placements = [
				{
					parents = [
						GTR14_McSwain_Life
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Misc/GTR_Misc_McSwn_swtch1`
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
		desc_id = GTR_Misc_Switch4
		frontend_desc = qs(0x93a392c2)
		materials = [
			GTR_Misc_Switch4_Primary
		]
		node_meshes = {
			$guitar_misc_nodes
			placements = [
				{
					parents = [
						GTR75_IBZ_XPT
						GTR72_SCH_Devil
						GTR71_SCH_C1
						GTR70_SCH_Ultra
						gtr1_sch_tempest
						GTR73_SCH_S1
						GTR74_SCH_Star
						GTR78_PRS_SC
						GTR79_PRS_CSTM24
						GTR84_MM_Petrucci
						GTR90_DR_Daisy
						GTR80_PRS_SANT
						gtr92_DR_Star
						GTR91_DR_Heart
						gtr93_DR_Siren
						GTR94_DR_TomBoy
						gtr86_mm_axis
						GTR78_PRS_SC
						GTR79_PRS_CSTM24
						GTR81_PRS_MiraMT
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Misc/GTR_Misc_Switch4`
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
		desc_id = GTR71_Switch
		frontend_desc = qs(0x83bd9c88)
		materials = [
			GTR71_Switch_Primary
		]
		node_meshes = {
			$guitar_misc_nodes
			placements = [
				{
					parents = [
						GTR71_SCH_C1
						GTR84_MM_Petrucci
						gtr86_mm_axis
						GTR130_Taylor_SB
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Misc/GTR71_Switch`
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
		desc_id = GTR76_Switch
		frontend_desc = qs(0x93a392c2)
		materials = [
			GTR76_Switch_Primary
		]
		node_meshes = {
			$guitar_misc_nodes
			placements = [
				{
					parents = [
						GTR76_IBZ_S5470
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Misc/GTR76_Switch`
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
		desc_id = GTR78_misc
		frontend_desc = qs(0x93a392c2)
		materials = [
			GTR78_misc_Primary
		]
		node_meshes = {
			$guitar_misc_nodes
			placements = [
				{
					parents = [
						GTR78_Kurt
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Misc/GTR78_misc`
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
		desc_id = Double_Switches
		frontend_desc = qs(0x9f602986)
		materials = [
			GTR80_Switch_Primary
		]
		node_meshes = {
			$guitar_misc_nodes
			placements = [
				{
					parents = [
						GTR80_PRS_SANT
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Misc/GTR80_Switch01`
							initial_values = {
								Color = grey_3guitar
							}
							attach_indices = [
								1
							]
						}
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Misc/GTR80_Switch02`
							initial_values = {
								Color = grey_3guitar
							}
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
		desc_id = GTR_Misc_Switch_M
		frontend_desc = qs(0x95ba3660)
		materials = [
			GTR_Misc_Switch2_Primary
		]
		node_meshes = {
			$guitar_misc_nodes
			placements = [
				{
					parents = [
						GTR25_Manson_Bellamy
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Misc/GTR_Misc_Switch2`
							attach_indices = [
								3
								4
							]
						}
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Misc/GTR_MiscKnob_Manson_02`
							tex = `models/CAR_Instruments/Guitar/GH5/Misc/GTR_MiscKnob_Manson_02`
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
		desc_id = GTR_MiscKnob_Manson_02
		frontend_desc = qs(0x96a8abf5)
		materials = [
			GTR_MiscKnob_Manson_02_Primary
		]
		node_meshes = {
			$guitar_misc_nodes
			placements = [
				{
					parents = [
						GTR25_Manson_Bellamy
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/CAR_Instruments/Guitar/GH5/Misc/GTR_MiscKnob_Manson_02`
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
car_rocker_guitars_factoredGlobal_1 = {
	has_node_array
	locked
}
car_rocker_guitars_factoredGlobal_24 = {
	hidden
	has_node_array
}
car_rocker_guitars_factoredGlobal_36 = {
	user_layer_settings = {
		diffuse
		ui_rotated_90
		initial_values = {
			x_trans = -24
			x_scale = 30
			y_scale = 30
			y_trans = 25
		}
		aspect_ratio = 1.75
	}
}
car_rocker_guitars_factoredGlobal_51 = {
	initial_values = {
		Color = grey_5
	}
}
car_rocker_guitars_factoredGlobal_52 = {
	initial_values = {
		Color = grey_2
	}
}
car_rocker_guitars_factoredGlobal_53 = {
	user_layer_settings = {
		diffuse
		ui_rotated_90
		initial_values = {
			x_trans = -10
			x_scale = 26
			y_scale = 26
			y_trans = -25
		}
	}
}
car_rocker_guitars_factoredGlobal_54 = {
	user_layer_settings = {
		diffuse
		ui_rotated_90
		initial_values = {
			x_trans = -25
			x_scale = 26
			y_scale = 26
			y_trans = -25
		}
	}
}
car_rocker_guitars_factoredGlobal_55 = {
	user_layer_settings = {
		diffuse
		ui_rotated_90
		initial_values = {
			x_trans = -25
			x_scale = 26
			y_scale = 26
			y_trans = -20
		}
	}
}
car_rocker_guitars_factoredGlobal_56 = {
	user_layer_settings = {
		diffuse
		ui_rotated_90
		initial_values = {
			x_trans = -25
			x_scale = 26
			y_scale = 26
			y_trans = -30
		}
	}
}
car_rocker_guitars_factoredGlobal_57 = {
	user_layer_settings = {
		diffuse
		ui_rotated_90
		initial_values = {
			x_trans = 0
			x_scale = 40
			y_scale = 20
			y_trans = -10
		}
	}
}
car_rocker_guitars_factoredGlobal_58 = {
	user_layer_settings = {
		diffuse
		ui_rotated_90
		initial_values = {
			x_trans = -10
			x_scale = 26
			y_scale = 26
			y_trans = -30
		}
	}
}
car_rocker_guitars_factoredGlobal_59 = {
	user_layer_settings = {
		diffuse
		ui_rotated_90
		initial_values = {
			x_trans = -15
			x_scale = 26
			y_scale = 26
			y_trans = -30
		}
	}
}
car_rocker_guitars_factoredGlobal_61 = {
	user_layer_settings = {
		diffuse
		ui_rotated_90
		initial_values = {
			x_trans = -25
			x_scale = 26
			y_scale = 26
			y_trans = -20
			flags = 259
		}
	}
}
preset_layer_details = {
	desc_id = Details
	frontend_desc = qs(0x7f5a5c11)
	diffuse
	pre_userlayer
}
guitar_bridges_nodes = {
	node_array_part = CAS_Guitar_Body
	node_type = BRIDGE
}
guitar_pickups_nodes = {
	node_array_part = CAS_Guitar_Body
	node_type = PICKUP
}
guitar_misc_nodes = {
	node_array_part = CAS_Guitar_Body
	node_type = MISC
}
preset_layer_fades = {
	desc_id = Fades
	frontend_desc = qs(0x081f2003)
	diffuse
	pre_userlayer
}
guitar_knobs_nodes = {
	node_array_part = CAS_Guitar_Body
	node_type = KNOB
}
preset_layer_inlays = {
	desc_id = Finishes
	frontend_desc = qs(0x3436c336)
	diffuse
	pre_userlayer
}
preset_layer_finishes = {
	desc_id = Finishes
	frontend_desc = qs(0x3f47b13d)
	diffuse
	pre_userlayer
}
