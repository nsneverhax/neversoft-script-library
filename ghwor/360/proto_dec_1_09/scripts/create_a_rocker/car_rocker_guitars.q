cas_guitar_body = [
	{
		desc_id = gtr20_bc_rich_beast
		frontend_desc = qs(0x5bd8e743)
		sponsor_id = `bc	rich`
		mesh = `models/car_instruments/guitar/bc_rich/gtr20_bc_rich_beast`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr20_bc_rich_beast_d`
				material = gtr20_bc_rich_beast_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr_bc_rich_beast_finishes
					}
					{
						$preset_layer_fades
						mask = $gtr_bc_rich_beast_fades
					}
					{
						$preset_layer_details
						mask = $gtr_bc_rich_beast_details
					}
				]
				$car_rocker_guitars_factoredglobal_0
			}
		]
		inclusion = [
			{
				part = cas_guitar_neck
				valid = [
					cag_22fret_bcrich01
					cag_22fret_bcrich02
					cag_22fret_bcrich03
					cag_22fret_bcrich04
					cag_24fret_bcrich01
					cag_24fret_bcrich02
					cag_24fret_bcrich03
					cag_24fret_bcrich04
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr20_neckhead_beast1
					gtr20_neckhead_warlock2
					gtr20_neckhead_pointed3
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
					gtr_emg_pickup1
					gtr_emg_pickup2
					gtr_emg_pickup5
					gtr_emg_pickup4
					gtr_emg_pickup3
					gtr_emg_pickup6
					gtr_pickup_sd01
					gtr_pickup_sd05b
					gtr_pickup_sd05
					gtr_pickup_sd06
					gtr_pickup_sd06b
					gtr_pickup_type2_paf1
					gtr_pickup_type2_paf2
					gtr_pickup_sd03
					gtr_pickup_bc01
					gtr_pickup_bc01b
					gtr_pickup_bc02
					gtr_pickup_sd04b
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_knob_01
					gtr_knob_02
					gtr_knob_03
					gtr_knob_04
					gtr_knob_05
					gtr_knob_06
					gtr_knob_07
					gtr_knob_08
					gtr_knob_09
					gtr_knob_10
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr22_bridge_whammy1
					gtr_bc_rich_bridge_21
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					gtr_misc_switch
					gtr_misc_switch_blk_3
					None
				]
			}
		]
		$car_rocker_guitars_factoredglobal_1
	}
	{
		desc_id = gtr180_richbich
		frontend_desc = qs(0x8b16635b)
		sponsor_id = `bc	rich`
		mesh = `models/car_instruments/guitar/bc_rich/gtr180_richbich`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr180_mbird_body`
				material = gtr180_bcrich_bich_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr_bc_rich_bich_finishes
					}
					{
						$preset_layer_fades
						mask = $gtr_bc_rich_bich_fades
					}
					{
						$preset_layer_details
						mask = $gtr_bc_rich_bich_details
					}
				]
				$car_rocker_guitars_factoredglobal_0
			}
		]
		inclusion = [
			{
				part = cas_guitar_neck
				valid = [
					cag_22fret_bcrich01
					cag_22fret_bcrich02
					cag_22fret_bcrich03
					cag_22fret_bcrich04
					cag_24fret_bcrich01
					cag_24fret_bcrich02
					cag_24fret_bcrich03
					cag_24fret_bcrich04
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr180_nhead_richbich
					gtr20_neckhead_beast1
					gtr20_neckhead_warlock2
					gtr20_neckhead_pointed3
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
					gtr180_pickup01
					gtr_emg_pickup2
					gtr_emg_pickup4
					gtr_emg_pickup3
					gtr_emg_pickup6
					gtr_pickup_sd01
					gtr_pickup_sd05b
					gtr_pickup_sd05
					gtr_pickup_sd06
					gtr_pickup_sd06b
					gtr_pickup_type2_paf1
					gtr_pickup_type2_paf2
					gtr_pickup_sd03
					gtr_pickup_bc01
					gtr_pickup_bc01b
					gtr_pickup_bc02
					gtr_pickup_sd04b
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr180_knob
					knob_knurl001
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr180_bridge
					gtr22_bridge_whammy1
					gtr_bc_rich_bridge_21
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					gtr_misc_switch_bich
				]
			}
		]
		has_node_array
	}
	{
		desc_id = gtr21_bc_rich_warbeast
		frontend_desc = qs(0xe769d4a9)
		sponsor_id = `bc	rich`
		mesh = `models/car_instruments/guitar/bc_rich/gtr21_bc_rich_warbeast`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr21_bc_rich_warbeast_d`
				material = gtr21_bc_rich_warbeast_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr_bc_rich_warbeast_finishes
					}
					{
						$preset_layer_fades
						mask = $gtr_bc_rich_warbeast_fades
					}
					{
						$preset_layer_details
						mask = $gtr_bc_rich_warbeast_details
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
				part = cas_guitar_neck
				valid = [
					cag_22fret_bcrich01
					cag_22fret_bcrich02
					cag_22fret_bcrich03
					cag_22fret_bcrich04
					cag_24fret_bcrich01
					cag_24fret_bcrich02
					cag_24fret_bcrich03
					cag_24fret_bcrich04
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr21_neckhead_beast2
					gtr21_neckhead_warlock3
					gtr21_neckhead_pointed4
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
					gtr_emg_pickup1
					gtr_emg_pickup2
					gtr_emg_pickup5
					gtr_emg_pickup4
					gtr_emg_pickup3
					gtr_emg_pickup6
					gtr_pickup_sd01
					gtr_pickup_sd05b
					gtr_pickup_sd05
					gtr_pickup_sd06
					gtr_pickup_sd06b
					gtr_pickup_type2_paf1
					gtr_pickup_type2_paf2
					gtr_pickup_sd03
					gtr_pickup_bc01
					gtr_pickup_bc01b
					gtr_pickup_bc02
					gtr_pickup_sd04b
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_knob_01
					gtr_knob_02
					gtr_knob_03
					gtr_knob_04
					gtr_knob_05
					gtr_knob_06
					gtr_knob_07
					gtr_knob_08
					gtr_knob_09
					gtr_knob_10
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr22_bridge_whammy1
					gtr_bc_rich_bridge_21
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					gtr_misc_switch
					gtr_misc_switch_blk_3
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = gtr22_bc_rich_warlock
		frontend_desc = qs(0xdeca9e56)
		sponsor_id = `bc	rich`
		mesh = `models/car_instruments/guitar/bc_rich/gtr22_bc_rich_warlock`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr22_bc_rich_warlock_d`
				material = gtr22_bc_rich_warlock_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr_bc_rich_warlock_finishes
					}
					{
						$preset_layer_fades
						mask = $gtr_bc_rich_warlock_fades
					}
					{
						$preset_layer_details
						mask = $gtr_bc_rich_warlock_details
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
				part = cas_guitar_neck
				valid = [
					cag_22fret_bcrich01
					cag_22fret_bcrich02
					cag_22fret_bcrich03
					cag_22fret_bcrich04
					cag_24fret_bcrich01
					cag_24fret_bcrich02
					cag_24fret_bcrich03
					cag_24fret_bcrich04
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr22_neckhead_beast3
					gtr22_neckhead_warlock4
					gtr22_neckhead_pointed5
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
					gtr_emg_pickup1
					gtr_emg_pickup2
					gtr_emg_pickup5
					gtr_pickup_sd05b
					gtr_emg_pickup4
					gtr_emg_pickup3
					gtr_emg_pickup6
					gtr_pickup_sd01
					gtr_pickup_sd05b
					gtr_pickup_sd05
					gtr_pickup_sd06
					gtr_pickup_sd06b
					gtr_pickup_type2_paf1
					gtr_pickup_type2_paf2
					gtr_pickup_sd03
					gtr_pickup_bc01
					gtr_pickup_bc01b
					gtr_pickup_bc02
					gtr_pickup_sd04b
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_knob_01
					gtr_knob_02
					gtr_knob_03
					gtr_knob_04
					gtr_knob_05
					gtr_knob_06
					gtr_knob_07
					gtr_knob_08
					gtr_knob_09
					gtr_knob_10
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr22_bridge_whammy1
					gtr_bc_rich_bridge_21
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					gtr_misc_switch
					gtr_misc_switch_blk_3
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = gtr90_dr_daisy
		frontend_desc = qs(0xebb8d192)
		sponsor_id = daisy
		mesh = `models/car_instruments/guitar/daisyrock/gtr90_dr_daisy`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/daisyrock/gtr90_dr_daisy_d`
				material = gtr90_dr_daisy_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr90_dr_daisy
					}
					{
						$preset_layer_fades
						mask = $gtr90_dr_daisy_fades
					}
					{
						$preset_layer_details
						mask = $gtr90_dr_daisy_details
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
				part = cas_guitar_neck
				valid = [
					cag_22fret_daisy01
					cag_22fret_daisy02
					cag_22fret_daisy03
					cag_22fret_daisy04
					cag_24fret_daisy01
					cag_24fret_daisy02
					cag_24fret_daisy03
					cag_24fret_daisy04
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr90_dr_neckhead01
					gtr90_dr_neckhead02
				]
			}
			{
				part = cas_guitar_pickguards
				valid = [
					gtr90_pg
					None
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr90_pickup3
					gtr90_pickup1
					gtr94_pickup
					gtr_emg_pickup1
					gtr_emg_pickup2
					gtr_emg_pickup5
					gtr_emg_pickup4
					gtr_emg_pickup3
					gtr_emg_pickup6
					gtr_pickup_sd01
					gtr_pickup_sd05b
					gtr_pickup_sd05
					gtr_pickup_sd06
					gtr_pickup_sd06b
					gtr_pickup_type2_paf1
					gtr_pickup_type2_paf2
					gtr_pickup_sd03
					gtr_pickup_sd04
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_knob_01c
					gtr_knob_02c
					gtr_knob_03c
					gtr_knob_04c
					gtr_knob_05c
					gtr_knob_06c
					gtr_knob_07c
					gtr_knob_08c
					gtr_knob_09c
					gtr_knob_10c
					gtr_knob_01
					gtr_knob_02
					gtr_knob_03
					gtr_knob_04
					gtr_knob_05
					gtr_knob_06
					gtr_knob_07
					gtr_knob_08
					gtr_knob_09
					gtr_knob_10
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_bridge_mcswain_l_4b
					gtr_bridge_01d
					gtr94_bridge
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					gtr_misc_switch4
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = gtr91_dr_heart
		frontend_desc = qs(0x56e3da91)
		sponsor_id = daisy
		mesh = `models/car_instruments/guitar/daisyrock/gtr91_dr_heart`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/daisyrock/gtr91_dr_heart_d`
				material = gtr91_dr_heart_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr91_dr_heart
					}
					{
						$preset_layer_fades
						mask = $gtr91_dr_heart_fades
					}
					{
						$preset_layer_details
						mask = $gtr91_dr_heart_details
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
				part = cas_guitar_neck
				valid = [
					cag_22fret_daisy01
					cag_22fret_daisy02
					cag_22fret_daisy03
					cag_22fret_daisy04
					cag_24fret_daisy01
					cag_24fret_daisy02
					cag_24fret_daisy03
					cag_24fret_daisy04
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr91_dr_neckhead01
					gtr91_dr_neckhead02
				]
			}
			{
				part = cas_guitar_pickguards
				valid = [
					gtr91_pg
					None
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr90_pickup1
					gtr90_pickup3
					gtr_emg_pickup5
					gtr_pickup_sd06b
					gtr_emg_pickup4
					gtr_emg_pickup3
					gtr_pickup_sd05
					gtr_pickup_type2_paf2
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_knob_01c
					gtr_knob_02c
					gtr_knob_03c
					gtr_knob_04c
					gtr_knob_05c
					gtr_knob_06c
					gtr_knob_07c
					gtr_knob_08c
					gtr_knob_09c
					gtr_knob_10c
					gtr_knob_01
					gtr_knob_02
					gtr_knob_03
					gtr_knob_04
					gtr_knob_05
					gtr_knob_06
					gtr_knob_07
					gtr_knob_08
					gtr_knob_09
					gtr_knob_10
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_bridge_mcswain_l_4b
					gtr_bridge_01d
					gtr94_bridge
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					gtr_misc_switch4
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = gtr93_dr_siren
		frontend_desc = qs(0x99f8ce9e)
		sponsor_id = daisy
		mesh = `models/car_instruments/guitar/daisyrock/gtr93_dr_siren`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/daisyrock/gtr93_dr_siren_d`
				material = gtr93_dr_siren_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr93_dr_siren
					}
					{
						$preset_layer_fades
						mask = $gtr93_dr_siren_fades
					}
					{
						$preset_layer_details
						mask = $gtr93_dr_siren_details
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
				part = cas_guitar_neck
				valid = [
					cag_22fret_daisy01
					cag_22fret_daisy02
					cag_22fret_daisy03
					cag_22fret_daisy04
					cag_24fret_daisy01
					cag_24fret_daisy02
					cag_24fret_daisy03
					cag_24fret_daisy04
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr93_dr_neckhead01
					gtr93_dr_neckhead02
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
					gtr_pickup_type2_paf1
					gtr90_pickup1
					gtr90_pickup3
					gtr94_pickup
					gtr_emg_pickup1
					gtr_emg_pickup2
					gtr_emg_pickup5
					gtr_emg_pickup4
					gtr_emg_pickup3
					gtr_emg_pickup6
					gtr_pickup_sd05
					gtr_pickup_sd05b
					gtr_pickup_sd06
					gtr_pickup_sd06b
					gtr_pickup_type2_paf1
					gtr_pickup_type2_paf2
					gtr_pickup_sd03
					gtr_pickup_sd04
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_knob_01
					gtr_knob_02
					gtr_knob_03
					gtr_knob_04
					gtr_knob_05
					gtr_knob_06
					gtr_knob_07
					gtr_knob_08
					gtr_knob_09
					gtr_knob_10
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_bridge_01d
					gtr_bridge_mcswain_l_4b
					gtr94_bridge
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					gtr_misc_switch4
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = gtr92_dr_star
		frontend_desc = qs(0xb3a12c1d)
		sponsor_id = daisy
		mesh = `models/car_instruments/guitar/daisyrock/gtr92_dr_star`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/daisyrock/gtr92_dr_star_d`
				material = gtr92_dr_star_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr92_dr_star
					}
					{
						$preset_layer_fades
						mask = $gtr92_dr_star_fades
					}
					{
						$preset_layer_details
						mask = $gtr92_dr_star_details
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
				part = cas_guitar_neck
				valid = [
					cag_22fret_daisy01
					cag_22fret_daisy02
					cag_22fret_daisy03
					cag_22fret_daisy04
					cag_24fret_daisy01
					cag_24fret_daisy02
					cag_24fret_daisy03
					cag_24fret_daisy04
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr92_dr_neckhead01
					gtr92_dr_neckhead02
				]
			}
			{
				part = cas_guitar_pickguards
				valid = [
					gtr92_pg
					None
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr90_pickup1
					gtr90_pickup3
					gtr94_pickup
					gtr_emg_pickup1
					gtr_emg_pickup2
					gtr_emg_pickup5
					gtr_emg_pickup4
					gtr_emg_pickup3
					gtr_emg_pickup6
					gtr_pickup_sd01
					gtr_pickup_sd05
					gtr_pickup_sd05b
					gtr_pickup_sd06
					gtr_pickup_sd06b
					gtr_pickup_type2_paf1
					gtr_pickup_type2_paf2
					gtr_pickup_sd03
					gtr_pickup_sd04
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_knob_01c
					gtr_knob_02c
					gtr_knob_03c
					gtr_knob_04c
					gtr_knob_05c
					gtr_knob_06c
					gtr_knob_07c
					gtr_knob_08c
					gtr_knob_09c
					gtr_knob_10c
					gtr_knob_01
					gtr_knob_02
					gtr_knob_03
					gtr_knob_04
					gtr_knob_05
					gtr_knob_06
					gtr_knob_07
					gtr_knob_08
					gtr_knob_09
					gtr_knob_10
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_bridge_mcswain_l_4b
					gtr_bridge_01d
					gtr94_bridge
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					None
					gtr_misc_switch4
				]
			}
		]
		$car_rocker_guitars_factoredglobal_1
	}
	{
		desc_id = gtr94_dr_tomboy
		frontend_desc = qs(0x43e694e3)
		sponsor_id = daisy
		mesh = `models/car_instruments/guitar/daisyrock/gtr94_dr_tomboy`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/daisyrock/gtr94_dr_tomboy_d`
				material = gtr94_dr_tomboy_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr94_dr_tomboy
					}
					{
						$preset_layer_fades
						mask = $gtr94_dr_tomboy_fades
					}
					{
						$preset_layer_details
						mask = $gtr94_dr_tomboy_details
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
				part = cas_guitar_neck
				valid = [
					cag_22fret_daisy01
					cag_22fret_daisy02
					cag_22fret_daisy03
					cag_22fret_daisy04
					cag_24fret_daisy01
					cag_24fret_daisy02
					cag_24fret_daisy03
					cag_24fret_daisy04
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr94_dr_neckhead01
					gtr94_dr_neckhead02
				]
			}
			{
				part = cas_guitar_pickguards
				valid = [
					gtr94_pg
					None
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_pickup_type2_paf1
					gtr_pickup_type2_paf2
					gtr94_pickup
					gtr90_pickup1
					gtr90_pickup3
					gtr_emg_pickup1
					gtr_emg_pickup2
					gtr_emg_pickup5
					gtr_emg_pickup4
					gtr_emg_pickup3
					gtr_emg_pickup6
					gtr_pickup_sd01
					gtr_pickup_sd05
					gtr_pickup_sd05b
					gtr_pickup_sd06
					gtr_pickup_sd06b
					gtr_pickup_sd03
					gtr_pickup_sd04
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_knob_01
					gtr_knob_02
					gtr_knob_03
					gtr_knob_04
					gtr_knob_05
					gtr_knob_06
					gtr_knob_07
					gtr_knob_08
					gtr_knob_09
					gtr_knob_10
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr94_bridge
					gtr_bridge_01d
					gtr_bridge_mcswain_l_4b
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					gtr_misc_switch4
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = gtr9_esp_ax
		frontend_desc = qs(0xdf25cb7a)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr9_esp_ax`
		pak_num = 1
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr9_esp_ax_d`
				material = gtr9_esp_ax_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr9_esp_ax
					}
					{
						$preset_layer_fades
						mask = $gtr9_esp_ax_fades
					}
					{
						$preset_layer_details
						mask = $gtr9_esp_ax_details
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
				part = cas_guitar_neck
				valid = [
					cag_22fret_esp01
					cag_22fret_esp02
					cag_22fret_esp03
					cag_22fret_esp04
					cag_24fret_esp01
					cag_24fret_esp02
					cag_24fret_esp03
					cag_24fret_esp04
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
					None
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_emg_pickup1
					gtr_emg_pickup2
					gtr_emg_pickup5
					gtr_emg_pickup4
					gtr_emg_pickup3
					gtr_emg_pickup6
					gtr_pickup_sd01
					gtr_pickup_sd05
					gtr_pickup_sd05b
					gtr_pickup_sd06
					gtr_pickup_sd06b
					gtr_pickup_type2_paf1
					gtr_pickup_type2_paf2
					gtr_pickup_sd03
					gtr_pickup_sd04
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_knob_01
					gtr_knob_02
					gtr_knob_03
					gtr_knob_04
					gtr_knob_05
					gtr_knob_06
					gtr_knob_07
					gtr_knob_08
					gtr_knob_09
					gtr_knob_10
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr72_bridge
					gtr4_bridgewhammy
					gtr76_bridge
					gtr_bridge_01d
					gtr136_bridge02
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					gtr_misc_switch4
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = gtr4_esp_eclipse_01
		frontend_desc = qs(0x503bbe00)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr4_esp_eclipse_01`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr4_esp_eclipse_d_01`
				material = gtr4_esp_eclipse_01_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr4_esp_eclipse
					}
					{
						$preset_layer_fades
						mask = $gtr4_esp_eclipse_fades
					}
					{
						$preset_layer_details
						mask = $gtr4_esp_eclipse_details
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
				part = cas_guitar_neck
				valid = [
					cag_22fret_esp01
					cag_22fret_esp02
					cag_22fret_esp03
					cag_22fret_esp04
					cag_24fret_esp01
					cag_24fret_esp02
					cag_24fret_esp03
					cag_24fret_esp04
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
					None
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_emg_pickup1
					gtr_emg_pickup2
					gtr_emg_pickup5
					gtr_emg_pickup4
					gtr_emg_pickup3
					gtr_emg_pickup6
					gtr_pickup_sd01
					gtr_pickup_sd05
					gtr_pickup_sd05b
					gtr_pickup_sd06
					gtr_pickup_sd06b
					gtr_pickup_type2_paf1
					gtr_pickup_type2_paf2
					gtr_pickup_sd03
					gtr_pickup_sd04
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_knob_01
					gtr_knob_02
					gtr_knob_03
					gtr_knob_04
					gtr_knob_05
					gtr_knob_06
					gtr_knob_07
					gtr_knob_08
					gtr_knob_09
					gtr_knob_10
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr72_bridge
					gtr4_bridgewhammy
					gtr76_bridge
					gtr_bridge_01d
					gtr136_bridge02
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					gtr_misc_switch4
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = gtr63f_esp_ex
		frontend_desc = qs(0xd48d1c7c)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr63f_esp_ex`
		pak_num = 1
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr63f_esp_ex_d`
				material = gtr63f_esp_ex_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr63f_esp_ex
					}
					{
						$preset_layer_fades
						mask = $gtr63f_esp_ex_fades
					}
					{
						$preset_layer_details
						mask = $gtr63f_esp_ex_details
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
				part = cas_guitar_pickguards
				valid = [
					None
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
					cag_22fret_esp01
					cag_22fret_esp02
					cag_22fret_esp03
					cag_22fret_esp04
					cag_24fret_esp01
					cag_24fret_esp02
					cag_24fret_esp03
					cag_24fret_esp04
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_emg_pickup1
					gtr_emg_pickup2
					gtr_emg_pickup5
					gtr_emg_pickup4
					gtr_emg_pickup3
					gtr_emg_pickup6
					gtr_pickup_sd01
					gtr_pickup_sd05
					gtr_pickup_sd05b
					gtr_pickup_sd06
					gtr_pickup_sd06b
					gtr_pickup_type2_paf1
					gtr_pickup_type2_paf2
					gtr_pickup_sd03
					gtr_pickup_sd04
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_knob_01
					gtr_knob_02
					gtr_knob_03
					gtr_knob_04
					gtr_knob_05
					gtr_knob_06
					gtr_knob_07
					gtr_knob_08
					gtr_knob_09
					gtr_knob_10
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr72_bridge
					gtr4_bridgewhammy
					gtr76_bridge
					gtr_bridge_01d
					gtr136_bridge02
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					gtr_misc_switch4
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = gtr37_rw01_new
		frontend_desc = qs(0x2be4ce3b)
		sponsor_id = esp
		mesh = 0x11296e65
		pak_num = 1
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr37_rw_d`
				material = gtr37_rw_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr37_rw
					}
					{
						$preset_layer_fades
						mask = $gtr37_rw_fades
					}
					{
						$preset_layer_details
						mask = $gtr37_rw_details
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
					gtr37_pickup_d
					gtr37_pickup_e
					gtr37_pickup_f
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr37_knobs01b
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr37_bridge2
					gtr72_bridge
					gtr4_bridgewhammy
					gtr76_bridge
					gtr_bridge_01d
					gtr136_bridge02
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
					cag_22fret_esp01
					cag_22fret_esp02
					cag_22fret_esp03
					cag_22fret_esp04
					cag_24fret_esp01
					cag_24fret_esp02
					cag_24fret_esp03
					cag_24fret_esp04
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = gtr39_esp_nv
		frontend_desc = qs(0x2830175d)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr39_esp_nv`
		pak_num = 1
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr39_nv_body`
				material = gtr39_nv_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr39_nv_finishes
					}
					{
						$preset_layer_fades
						mask = $gtr39_nv_fades
					}
					{
						$preset_layer_details
						mask = $gtr39_nv_details
					}
				]
				$car_rocker_guitars_factoredglobal_13
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
					gtr_emg_pickup1
					gtr_emg_pickup2
					gtr_emg_pickup5
					gtr_emg_pickup4
					gtr_emg_pickup3
					gtr_emg_pickup6
					gtr_pickup_sd01
					gtr_pickup_sd05
					gtr_pickup_sd05b
					gtr_pickup_sd06
					gtr_pickup_sd06b
					gtr_pickup_type2_paf1
					gtr_pickup_type2_paf2
					gtr_pickup_sd03
					gtr_pickup_sd04
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					knob_knurl001
					gtr_knob_01
					gtr_knob_02
					gtr_knob_03
					gtr_knob_04
					gtr_knob_05
					gtr_knob_06
					gtr_knob_07
					gtr_knob_08
					gtr_knob_09
					gtr_knob_10
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_hardware62
					gtr37_bridge2
					gtr4_bridgewhammy
					gtr12_bridge_1
					gtr32_hardware01_n
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr39_esp_nv_nhead
				]
			}
			{
				part = cas_guitar_neck
				valid = [
					cag_22fret_esp01
					cag_22fret_esp02
					cag_22fret_esp03
					cag_22fret_esp04
					cag_24fret_esp01
					cag_24fret_esp02
					cag_24fret_esp03
					cag_24fret_esp04
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					gtr_misc_switch
					None
				]
			}
		]
		$car_rocker_guitars_factoredglobal_1
	}
	{
		desc_id = gtr40_px_body
		frontend_desc = qs(0x86345e4f)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr40_px_body`
		pak_num = 1
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr40_px_body`
				material = gtr40_phoenix_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr40_px_finishes
					}
					{
						$preset_layer_fades
						mask = $gtr40_px_fades
					}
					{
						$preset_layer_details
						mask = $gtr40_px_details
					}
				]
				$car_rocker_guitars_factoredglobal_13
			}
		]
		inclusion = [
			{
				part = cas_guitar_pickguards
				valid = [
					gtr40_pgard
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_emg_pickup2
					gtr_emg_pickup4
					gtr_emg_pickup3
					gtr_emg_pickup6
					gtr_pickup_sd01
					gtr_pickup_sd05
					gtr_pickup_sd05b
					gtr_pickup_sd06
					gtr_pickup_sd06b
					gtr_pickup_type2_paf1
					gtr_pickup_type2_paf2
					gtr_pickup_sd03
					gtr_pickup_sd04
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					knob_knurl001
					gtr_knob_01
					gtr_knob_02
					gtr_knob_03
					gtr_knob_04
					gtr_knob_05
					gtr_knob_06
					gtr_knob_07
					gtr_knob_08
					gtr_knob_09
					gtr_knob_10
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_hardware62
					gtr37_bridge2
					gtr4_bridgewhammy
					gtr12_bridge_1
					gtr32_hardware01_n
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr40_esp_px_nhead01
				]
			}
			{
				part = cas_guitar_neck
				valid = [
					cag_22fret_esp01
					cag_22fret_esp02
					cag_22fret_esp03
					cag_22fret_esp04
					cag_24fret_esp01
					cag_24fret_esp02
					cag_24fret_esp03
					cag_24fret_esp04
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					gtr_misc_switch
					None
				]
			}
		]
		$car_rocker_guitars_factoredglobal_1
	}
	{
		desc_id = gtr12_esp_v_01
		frontend_desc = qs(0x4615d3b8)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr12_esp_v_01`
		pak_num = 1
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr12_esp_v_series_d`
				material = gtr12_esp_v_01_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr12_esp_v_01
					}
					{
						$preset_layer_fades
						mask = $gtr12_esp_v_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr12_esp_v_01_details
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
				part = cas_guitar_neck
				valid = [
					cag_24fret_esp01
					cag_24fret_esp02
					cag_24fret_esp03
					cag_24fret_esp04
					cag_22fret_esp01
					cag_22fret_esp02
					cag_22fret_esp03
					cag_22fret_esp04
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
					gtr12_pickguard_01
					None
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_emg_pickup1
					gtr_emg_pickup2
					gtr_emg_pickup5
					gtr_emg_pickup4
					gtr_emg_pickup3
					gtr_emg_pickup6
					gtr_pickup_sd01
					gtr_pickup_sd05
					gtr_pickup_sd05b
					gtr_pickup_sd06
					gtr_pickup_sd06b
					gtr_pickup_type2_paf1
					gtr_pickup_type2_paf2
					gtr_pickup_sd03
					gtr_pickup_sd04
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_knob_01
					gtr_knob_02
					gtr_knob_03
					gtr_knob_04
					gtr_knob_05
					gtr_knob_06
					gtr_knob_07
					gtr_knob_08
					gtr_knob_09
					gtr_knob_10
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr72_bridge
					gtr4_bridgewhammy
					gtr76_bridge
					gtr_bridge_01d
					gtr136_bridge02
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					gtr_misc_switch4
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = gtr62_esp_alexi
		frontend_desc = qs(0x032e6d0e)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr62_esp_alexi`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr62_esp_alexi_d`
				material = gtr62_esp_alexi_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr62_esp_alexi
					}
					{
						$preset_layer_fades
						mask = $gtr62b_esp_jack_fades
					}
					{
						$preset_layer_details
						mask = $gtr62b_esp_jack_details
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
				part = cas_guitar_pickguards
				valid = [
					None
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr72_bridge
					gtr4_bridgewhammy
					gtr76_bridge
					gtr_bridge_01d
					gtr136_bridge02
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_emg_pickup1
					gtr_emg_pickup2
					gtr_emg_pickup5
					gtr_emg_pickup4
					gtr_emg_pickup3
					gtr_emg_pickup6
					gtr_pickup_sd01
					gtr_pickup_sd05
					gtr_pickup_sd05b
					gtr_pickup_sd06
					gtr_pickup_sd06b
					gtr_pickup_type2_paf1
					gtr_pickup_type2_paf2
					gtr_pickup_sd03
					gtr_pickup_sd04
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_knob_01
					gtr_knob_02
					gtr_knob_03
					gtr_knob_04
					gtr_knob_05
					gtr_knob_06
					gtr_knob_07
					gtr_knob_08
					gtr_knob_09
					gtr_knob_10
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
					cag_24fret_esp01
					cag_24fret_esp02
					cag_24fret_esp03
					cag_24fret_esp04
					cag_22fret_esp01
					cag_22fret_esp02
					cag_22fret_esp03
					cag_22fret_esp04
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					gtr_misc_switch4
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = gtr64_esp_f
		frontend_desc = qs(0xf6cef999)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr64_esp_f`
		pak_num = 1
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr64_esp_f_d`
				material = gtr64_esp_f_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr64_esp_f
					}
					{
						$preset_layer_fades
						mask = $gtr64_esp_f_fades
					}
					{
						$preset_layer_details
						mask = $gtr64_esp_f_details
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
				part = cas_guitar_pickguards
				valid = [
					None
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_knob_01
					gtr_knob_02
					gtr_knob_03
					gtr_knob_04
					gtr_knob_05
					gtr_knob_06
					gtr_knob_07
					gtr_knob_08
					gtr_knob_09
					gtr_knob_10
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_emg_pickup1
					gtr_emg_pickup2
					gtr_emg_pickup5
					gtr_emg_pickup4
					gtr_emg_pickup3
					gtr_emg_pickup6
					gtr_pickup_sd01
					gtr_pickup_sd05
					gtr_pickup_sd05b
					gtr_pickup_sd06
					gtr_pickup_sd06b
					gtr_pickup_type2_paf1
					gtr_pickup_type2_paf2
					gtr_pickup_sd03
					gtr_pickup_sd04
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr72_bridge
					gtr4_bridgewhammy
					gtr76_bridge
					gtr_bridge_01d
					gtr136_bridge02
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
					cag_22fret_esp01
					cag_22fret_esp02
					cag_22fret_esp03
					cag_22fret_esp04
					cag_24fret_esp01
					cag_24fret_esp02
					cag_24fret_esp03
					cag_24fret_esp04
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					gtr_misc_switch4
					None
				]
			}
		]
		$car_rocker_guitars_factoredglobal_1
	}
	{
		desc_id = gtr_32_body_new
		frontend_desc = qs(0x830c200b)
		sponsor_id = esp
		mesh = 0xf6bc051e
		pak_num = 1
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr32_body`
				material = gtr32_horizon_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cag_gtr32
					}
					{
						$preset_layer_fades
						mask = $cag_gtr32_fades
					}
					{
						$preset_layer_details
						mask = $cag_gtr32_details
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
				part = cas_guitar_pickguards
				valid = [
					None
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_emg_pickup1
					gtr_emg_pickup2
					gtr_emg_pickup5
					gtr_emg_pickup4
					gtr_emg_pickup3
					gtr_emg_pickup6
					gtr_pickup_sd01
					gtr_pickup_sd05
					gtr_pickup_sd05b
					gtr_pickup_sd06
					gtr_pickup_sd06b
					gtr_pickup_type2_paf1
					gtr_pickup_type2_paf2
					gtr_pickup_sd03
					gtr_pickup_sd04
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_knob_01
					gtr_knob_02
					gtr_knob_03
					gtr_knob_04
					gtr_knob_05
					gtr_knob_06
					gtr_knob_07
					gtr_knob_08
					gtr_knob_09
					gtr_knob_10
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr33_hardware01zb
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
					cag_22fret_esp01
					cag_22fret_esp02
					cag_22fret_esp03
					cag_22fret_esp04
					cag_24fret_esp01
					cag_24fret_esp02
					cag_24fret_esp03
					cag_24fret_esp04
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					gtr_misc_switch4
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = gtr33d_base
		frontend_desc = qs(0xe230e599)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr33d_base`
		pak_num = 1
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr33_kh2_wood_d`
				material = gtr33d_wood_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $cag_gtr33
					}
					{
						$preset_layer_fades
						mask = $cag_gtr33_fades
					}
					{
						$preset_layer_details
						mask = $cag_gtr33_details
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
				part = cas_guitar_pickguards
				valid = [
					None
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_knob_01
					gtr_knob_02
					gtr_knob_03
					gtr_knob_04
					gtr_knob_05
					gtr_knob_06
					gtr_knob_07
					gtr_knob_08
					gtr_knob_09
					gtr_knob_10
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_emg_pickup1
					gtr_emg_pickup2
					gtr_emg_pickup5
					gtr_emg_pickup4
					gtr_emg_pickup3
					gtr_emg_pickup6
					gtr_pickup_sd01
					gtr_pickup_sd05
					gtr_pickup_sd05b
					gtr_pickup_sd06
					gtr_pickup_sd06b
					gtr_pickup_type2_paf1
					gtr_pickup_type2_paf2
					gtr_pickup_sd03
					gtr_pickup_sd04
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr32_hardware01_n
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr33d_nekhed
					gtr33d_nekhed_b
					gtr33d_nekhed_c
					gtr33d_neckhead_d
					gtr33d_nekhed_e
					gtr33d_nekhed_f
				]
			}
			{
				part = cas_guitar_neck
				valid = [
					cag_22fret_esp01
					cag_22fret_esp02
					cag_22fret_esp03
					cag_22fret_esp04
					cag_24fret_esp01
					cag_24fret_esp02
					cag_24fret_esp03
					cag_24fret_esp04
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					gtr_misc_switch4
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = gtr_31_viper_new
		frontend_desc = qs(0xd6e22e0b)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr_31_viper_new`
		pak_num = 1
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr31_viper_d`
				material = gtr_31_viper_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr31_viper
					}
					{
						$preset_layer_fades
						mask = $gtr31_viper_fades
					}
					{
						$preset_layer_details
						mask = $gtr31_viper_details
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
				part = cas_guitar_pickguards
				valid = [
					None
					gtr31_pgard
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_emg_pickup1
					gtr_emg_pickup2
					gtr_emg_pickup5
					gtr_emg_pickup4
					gtr_emg_pickup3
					gtr_emg_pickup6
					gtr_pickup_sd01
					gtr_pickup_sd05
					gtr_pickup_sd05b
					gtr_pickup_sd06
					gtr_pickup_sd06b
					gtr_pickup_type2_paf1
					gtr_pickup_type2_paf2
					gtr_pickup_sd03
					gtr_pickup_sd04
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_knob_01
					gtr_knob_02
					gtr_knob_03
					gtr_knob_04
					gtr_knob_05
					gtr_knob_06
					gtr_knob_07
					gtr_knob_08
					gtr_knob_09
					gtr_knob_10
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr72_bridge
					gtr4_bridgewhammy
					gtr76_bridge
					gtr_bridge_01d
					gtr136_bridge02
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
					cag_22fret_esp01
					cag_22fret_esp02
					cag_22fret_esp03
					cag_22fret_esp04
					cag_24fret_esp01
					cag_24fret_esp02
					cag_24fret_esp03
					cag_24fret_esp04
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					gtr_misc_switch4
					None
				]
			}
		]
		$car_rocker_guitars_factoredglobal_1
	}
	{
		desc_id = gtr66_esp_shini
		frontend_desc = qs(0xd78e09c1)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr66_esp_shini`
		pak_num = 0
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
			{
				part = cas_guitar_misc
				valid = [
					None
				]
			}
		]
		locked
	}
	{
		desc_id = gtr77_ibz_rg
		frontend_desc = qs(0xc85347f5)
		mesh = `models/car_instruments/guitar/ibanez/gtr77_ibz_rg`
		sponsor_id = ibanez
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/ibanez/gtr77_ibz_rg_d`
				material = gtr77_ibz_rg_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr77_ibz_rg
					}
					{
						$preset_layer_fades
						mask = $gtr77_ibz_rg_fades
					}
					{
						$preset_layer_details
						mask = $gtr77_ibz_rg_details
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
				part = cas_guitar_neck
				valid = [
					cag_24fret_ibanez01
					cag_24fret_ibanez02
					cag_24fret_ibanez04
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr77_neckhead_01
					gtr77_neckhead_02
					gtr77_neckhead_03
					gtr77_neckhead_04
				]
			}
			{
				part = cas_guitar_pickguards
				valid = [
					gtr77_ibz_rg_pg
					None
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr76_pickupb
					gtr_emg_pickup1
					gtr_emg_pickup2
					gtr_emg_pickup5
					gtr_emg_pickup4
					gtr_emg_pickup3
					gtr_emg_pickup6
					gtr_pickup_sd01
					gtr_pickup_sd05
					gtr_pickup_sd05b
					gtr_pickup_sd06
					gtr_pickup_sd06b
					gtr_pickup_type2_paf1
					gtr_pickup_type2_paf2
					gtr_pickup_sd03
					gtr_pickup_sd04
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_knob_01
					gtr_knob_02
					gtr_knob_03
					gtr_knob_04
					gtr_knob_05
					gtr_knob_06
					gtr_knob_07
					gtr_knob_08
					gtr_knob_09
					gtr_knob_10
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr75_bridge2
					gtr77_bridge
					gtr76_bridge
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = gtr76_ibz_s5470
		frontend_desc = qs(0xb12fdd15)
		mesh = `models/car_instruments/guitar/ibanez/gtr76_ibz_s5470`
		sponsor_id = ibanez
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/ibanez/gtr76_ibz_s5470_d`
				material = gtr76_ibz_s5470_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr76_ibz_s5470
					}
					{
						$preset_layer_fades
						mask = $gtr76_ibz_s5470_fades
					}
					{
						$preset_layer_details
						mask = $gtr76_ibz_s5470_details
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
				part = cas_guitar_neck
				valid = [
					cag_24fret_ibanez01
					cag_24fret_ibanez02
					cag_24fret_ibanez04
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr76_neckhead_01
					gtr76_neckhead_02
					gtr76_neckhead_03
					gtr76_neckhead_04
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
					gtr76_pickupa
					gtr_emg_pickup1
					gtr_emg_pickup2
					gtr_emg_pickup5
					gtr_emg_pickup4
					gtr_emg_pickup3
					gtr_emg_pickup6
					gtr_pickup_sd01
					gtr_pickup_sd05
					gtr_pickup_sd05b
					gtr_pickup_sd06
					gtr_pickup_sd06b
					gtr_pickup_type2_paf1
					gtr_pickup_type2_paf2
					gtr_pickup_sd03
					gtr_pickup_sd04
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_knob_01
					gtr_knob_02
					gtr_knob_03
					gtr_knob_04
					gtr_knob_05
					gtr_knob_06
					gtr_knob_07
					gtr_knob_08
					gtr_knob_09
					gtr_knob_10
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr75_bridge2
					gtr77_bridge
					gtr76_bridge
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					gtr76_switch
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = gtr75_ibz_xpt
		frontend_desc = qs(0x33f1dd88)
		mesh = `models/car_instruments/guitar/ibanez/gtr75_ibz_xpt`
		sponsor_id = ibanez
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/ibanez/gtr75_ibz_xpt_d`
				material = gtr75_ibz_xpt_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr75_ibz_xpt
					}
					{
						$preset_layer_fades
						mask = $gtr75_ibz_xpt_fades
					}
					{
						$preset_layer_details
						mask = $gtr75_ibz_xpt_details
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
				part = cas_guitar_neck
				valid = [
					cag_24fret_ibanez01
					cag_24fret_ibanez02
					cag_24fret_ibanez04
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr75_neckhead_01
					gtr75_neckhead_02
					gtr75_neckhead_03
					gtr75_neckhead_04
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
					gtr78_pickup
					gtr_emg_pickup1
					gtr_emg_pickup2
					gtr_emg_pickup5
					gtr_emg_pickup4
					gtr_emg_pickup3
					gtr_emg_pickup6
					gtr_pickup_sd01
					gtr_pickup_sd05
					gtr_pickup_sd05b
					gtr_pickup_sd06
					gtr_pickup_sd06b
					gtr_pickup_type2_paf1
					gtr_pickup_type2_paf2
					gtr_pickup_sd03
					gtr_pickup_sd04
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_knob_01
					gtr_knob_02
					gtr_knob_03
					gtr_knob_04
					gtr_knob_05
					gtr_knob_06
					gtr_knob_07
					gtr_knob_08
					gtr_knob_09
					gtr_knob_10
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr75_bridge2
					gtr76_bridge
					gtr77_bridge
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					gtr_misc_switch4
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = gtr178_ibz_ict
		frontend_desc = qs(0xb9d7f4c7)
		mesh = `models/car_instruments/guitar/ibanez/gtr178_ibz_ict`
		sponsor_id = ibanez
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/ibanez/gtr178_ibz_ict_d`
				material = gtr178_ibz_ict_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr178_ibz_ict
					}
					{
						$preset_layer_fades
						mask = $gtr178_ibz_ict_fades
					}
					{
						$preset_layer_details
						mask = $gtr178_ibz_ict_details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						x_trans = -32
						x_scale = 15
						y_scale = 21
						y_trans = 15
					}
					aspect_ratio = 1.75
				}
			}
		]
		inclusion = [
			{
				part = cas_guitar_neck
				valid = [
					cag_24fret_ibanez01
					cag_24fret_ibanez02
					cag_24fret_ibanez04
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr178_neckhead_01
					gtr178_neckhead_02
					gtr178_neckhead_03
					gtr178_neckhead_04
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
					gtr_emg_pickup1
					gtr_emg_pickup2
					gtr_emg_pickup5
					gtr_emg_pickup4
					gtr_emg_pickup3
					gtr_emg_pickup6
					gtr_pickup_sd01
					gtr_pickup_sd05
					gtr_pickup_sd05b
					gtr_pickup_sd06
					gtr_pickup_sd06b
					gtr_pickup_type2_paf1
					gtr_pickup_type2_paf2
					gtr_pickup_sd03
					gtr_pickup_sd04
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_knob_01
					gtr_knob_02
					gtr_knob_03
					gtr_knob_04
					gtr_knob_05
					gtr_knob_06
					gtr_knob_07
					gtr_knob_08
					gtr_knob_09
					gtr_knob_10
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr75_bridge2
					gtr76_bridge
					gtr77_bridge
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					gtr_misc_switch4
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = gtr78_kurt
		frontend_desc = qs(0x4226c524)
		mesh = `models/car_instruments/guitar/ibanez/gtr78_kurt`
		pak_num = 0
		inclusion = [
			{
				part = cas_guitar_neck
				valid = [
					cag_22fret_ibanez03
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr78_neckhead
				]
			}
			{
				part = cas_guitar_pickguards
				valid = [
					gtr78_pg
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr78_pickup1
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_knob_01kurt
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr78_bridge
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					gtr78_misc
				]
			}
		]
		$car_rocker_guitars_factoredglobal_24
	}
	{
		desc_id = gtr10_mcswain_flame
		frontend_desc = qs(0x25577ec9)
		sponsor_id = mcswain
		mesh = `models/car_instruments/guitar/mcswain/gtr10_mcswain_flame`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/mcswain/gtr10_mcswain_flame_d`
				material = gtr10_mcswain_flame_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr1_mcswn_flame
					}
					{
						$preset_layer_fades
						mask = $gtr1_mcswn_flame_fades
					}
					{
						$preset_layer_details
						mask = $gtr1_mcswn_flame_details
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
				part = cas_guitar_neck
				valid = [
					cag_22fret_mcswain01
					cag_22fret_mcswain02
					cag_22fret_mcswain03
					cag_22fret_mcswain04
					cag_24fret_mcswain01
					cag_24fret_mcswain02
					cag_24fret_mcswain03
					cag_24fret_mcswain04
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr10_neckhead_mcswain1
					gtr12_neckhead_mcswain12
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
					gtr_pickup_type2_paf1
					gtr_pickup_type2_paf2
					gtr10_pickup_mcswain_1
					gtr_pickup_type2_02
					gtr_pickup_type3_blk
					gtr_emg_pickup1
					gtr_emg_pickup2
					gtr_emg_pickup5
					gtr_emg_pickup4
					gtr_emg_pickup3
					gtr_emg_pickup6
					gtr_pickup_sd01
					gtr_pickup_sd05
					gtr_pickup_sd05b
					gtr_pickup_sd06
					gtr_pickup_sd06b
					gtr_pickup_sd03
					gtr_pickup_sd04
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_knob_01
					gtr_knob_02
					gtr_knob_03
					gtr_knob_04
					gtr_knob_05
					gtr_knob_06
					gtr_knob_07
					gtr_knob_08
					gtr_knob_09
					gtr_knob_10
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_bridge_mcswain_6
					gtr10_bridge_mcswain_1
					gtr_brdg_mcswn_inferno_3
					gtr_bridge_mcswain_l_4
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					gtr_misc_switch
					gtr_misc_switch_blk_3
					None
				]
			}
		]
		$car_rocker_guitars_factoredglobal_1
	}
	{
		desc_id = gtr11_mcswain_carved
		frontend_desc = qs(0x5a6c83f8)
		sponsor_id = mcswain
		mesh = `models/car_instruments/guitar/mcswain/gtr11_mcswain_carved`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/mcswain/gtr11_mcswain_carved_d`
				material = gtr11_mcswain_carved_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr11_mcswn_carve
					}
					{
						$preset_layer_fades
						mask = $gtr11_mcswn_carve_fades
					}
					{
						$preset_layer_details
						mask = $gtr11_mcswn_carve_details
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
				part = cas_guitar_neck
				valid = [
					cag_22fret_mcswain01
					cag_22fret_mcswain02
					cag_22fret_mcswain03
					cag_22fret_mcswain04
					cag_24fret_mcswain01
					cag_24fret_mcswain02
					cag_24fret_mcswain03
					cag_24fret_mcswain04
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr12_neckhead_mcswain12
					gtr10_neckhead_mcswain1
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
					gtr_pickup_type2_paf1
					gtr_pickup_type2_paf2
					gtr10_pickup_mcswain_1
					gtr_pickup_type2_02
					gtr_pickup_type3_blk
					gtr_emg_pickup1
					gtr_emg_pickup2
					gtr_emg_pickup5
					gtr_emg_pickup4
					gtr_emg_pickup3
					gtr_emg_pickup6
					gtr_pickup_sd01
					gtr_pickup_sd05
					gtr_pickup_sd05b
					gtr_pickup_sd06
					gtr_pickup_sd06b
					gtr_pickup_sd03
					gtr_pickup_sd04
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_knob_01
					gtr_knob_02
					gtr_knob_03
					gtr_knob_04
					gtr_knob_05
					gtr_knob_06
					gtr_knob_07
					gtr_knob_08
					gtr_knob_09
					gtr_knob_10
					gtr_knob_01b
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_bridge_mcswain_2
					gtr10_bridge_mcswain_1
					gtr_brdg_mcswn_inferno_3
					gtr_bridge_mcswain_l_4
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					gtr_misc_switch
					gtr_misc_switch_blk_3
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = gtr12_mcswain_minferno
		frontend_desc = qs(0x976a0248)
		sponsor_id = mcswain
		mesh = `models/car_instruments/guitar/mcswain/gtr12_mcswain_minferno`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/mcswain/gtr12_mcswain_minferno_d`
				material = gtr12_mcswain_minferno_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr12_mcswn_minferno
					}
					{
						$preset_layer_fades
						mask = $gtr12_mcswn_minferno_fades
					}
					{
						$preset_layer_details
						mask = $gtr12_mcswn_minferno_details
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
				part = cas_guitar_neck
				valid = [
					cag_22fret_mcswain01
					cag_22fret_mcswain02
					cag_22fret_mcswain03
					cag_22fret_mcswain04
					cag_24fret_mcswain01
					cag_24fret_mcswain02
					cag_24fret_mcswain03
					cag_24fret_mcswain04
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr12_neckhead_mcswain12
					gtr10_neckhead_mcswain1
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
					gtr_pickup_type2_paf1
					gtr_pickup_type2_paf2
					gtr10_pickup_mcswain_1
					gtr_pickup_type2_02
					gtr_pickup_type3_blk
					gtr_pickup_type3_blk
					gtr_emg_pickup1
					gtr_emg_pickup2
					gtr_emg_pickup5
					gtr_emg_pickup4
					gtr_emg_pickup3
					gtr_emg_pickup6
					gtr_pickup_sd01
					gtr_pickup_sd05
					gtr_pickup_sd05b
					gtr_pickup_sd06
					gtr_pickup_sd06b
					gtr_pickup_sd03
					gtr_pickup_sd04
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_knob_01
					gtr_knob_02
					gtr_knob_03
					gtr_knob_04
					gtr_knob_05
					gtr_knob_06
					gtr_knob_07
					gtr_knob_08
					gtr_knob_09
					gtr_knob_10
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_brdg_mcswn_inferno_3
					gtr_bridge_mcswain_2
					gtr10_bridge_mcswain_1
					gtr_bridge_mcswain_l_4
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					gtr_misc_switch
					gtr_misc_switch_blk_3
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = gtr13_mcswain_machine
		frontend_desc = qs(0xc2e7c0f1)
		sponsor_id = mcswain
		mesh = `models/car_instruments/guitar/mcswain/gtr13_mcswain_machine`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/mcswain/gtr13_mcswain_machine_d`
				material = gtr13_mcswain_machine_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr13_mcswain_machine
					}
					{
						$preset_layer_fades
						mask = $gtr13_mcswain_machine_fades
					}
					{
						$preset_layer_details
						mask = $gtr13_mcswain_machine_details
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
				part = cas_guitar_neck
				valid = [
					cag_22fret_mcswain01
					cag_22fret_mcswain02
					cag_22fret_mcswain03
					cag_22fret_mcswain04
					cag_24fret_mcswain01
					cag_24fret_mcswain02
					cag_24fret_mcswain03
					cag_24fret_mcswain04
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr12_neckhead_mcswain12
					gtr10_neckhead_mcswain1
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
					gtr_pickup_type2_paf1
					gtr_pickup_type2_paf2
					gtr10_pickup_mcswain_1
					gtr_pickup_type2_02
					gtr_pickup_type3_blk
					gtr_emg_pickup1
					gtr_emg_pickup2
					gtr_emg_pickup5
					gtr_emg_pickup4
					gtr_emg_pickup3
					gtr_emg_pickup6
					gtr_pickup_sd01
					gtr_pickup_sd05
					gtr_pickup_sd05b
					gtr_pickup_sd06
					gtr_pickup_sd06b
					gtr_pickup_sd03
					gtr_pickup_sd04
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_knob_01
					gtr_knob_02
					gtr_knob_03
					gtr_knob_04
					gtr_knob_05
					gtr_knob_06
					gtr_knob_07
					gtr_knob_08
					gtr_knob_09
					gtr_knob_10
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_bridge_mcswain_2
					gtr10_bridge_mcswain_1
					gtr_brdg_mcswn_inferno_3
					gtr_bridge_mcswain_l_4
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					gtr13_misc_gauges
					gtr13_misc_switch
					None
				]
			}
		]
		$car_rocker_guitars_factoredglobal_1
	}
	{
		desc_id = gtr14_mcswain_life
		frontend_desc = qs(0xe0a8490d)
		sponsor_id = mcswain
		mesh = `models/car_instruments/guitar/mcswain/gtr14_mcswain_life`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/mcswain/gtr14_mcswain_life_d`
				material = gtr14_mcswain_life_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr14_mcswain_life
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
				part = cas_guitar_neck
				valid = [
					cag_22fret_mcswain01
					cag_22fret_mcswain02
					cag_22fret_mcswain03
					cag_22fret_mcswain04
					cag_24fret_mcswain01
					cag_24fret_mcswain02
					cag_24fret_mcswain03
					cag_24fret_mcswain04
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr14_neckhead_mcswain3
					gtr14_neckhead_mcswain4
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
					gtr_pickup_type3_blk2
					gtr10_pickup_mcswain_1
					gtr_pickup_type2_paf1
					gtr_pickup_type2_paf2
					gtr_pickup_type2_02
					gtr_pickup_type3_blk
					gtr_pickup_type3_blk
					gtr_emg_pickup1
					gtr_emg_pickup2
					gtr_emg_pickup5
					gtr_emg_pickup4
					gtr_emg_pickup3
					gtr_emg_pickup6
					gtr_pickup_sd01
					gtr_pickup_sd05
					gtr_pickup_sd05b
					gtr_pickup_sd06
					gtr_pickup_sd06b
					gtr_pickup_sd03
					gtr_pickup_sd04
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_knob_01
					gtr_knob_02
					gtr_knob_03
					gtr_knob_04b
					gtr_knob_05
					gtr_knob_06
					gtr_knob_07
					gtr_knob_08
					gtr_knob_09
					gtr_knob_10
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_bridge_mcswain_l_5
					gtr_bridge_mcswain_2b
					gtr10_bridge_mcswain_1
					gtr_brdg_mcswn_inferno_3b
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					gtr_misc_mcswn_swtch1
					None
				]
			}
		]
		$car_rocker_guitars_factoredglobal_1
	}
	{
		desc_id = gtr86_mm_axis
		frontend_desc = qs(0xb089b2cb)
		sponsor_id = `music	man`
		mesh = `models/car_instruments/guitar/mm/gtr86_mm_axis`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/mm/gtr86_mm_axis_d`
				material = gtr86_mm_axis_primary
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
						mask = $gtr86_mm_axis_details
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
				part = cas_guitar_neck
				valid = [
					cag_22fret_mm01
					cag_22fret_mm02
					cag_22fret_mm03
					cag_22fret_mm04
					cag_24fret_mm01
					cag_24fret_mm02
					cag_24fret_mm03
					cag_24fret_mm04
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr86_neckhead_01
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
					gtr86_pickup
					gtr_pickup_type2_paf1
					gtr76_pickupa_c
					gtr84_pickup_a
					gtr_emg_pickup1
					gtr_emg_pickup2
					gtr_emg_pickup5
					gtr_emg_pickup4
					gtr_emg_pickup3
					gtr_emg_pickup6
					gtr_pickup_sd01
					gtr_pickup_sd05
					gtr_pickup_sd05b
					gtr_pickup_sd06
					gtr_pickup_sd06b
					gtr_pickup_sd03
					gtr_pickup_sd04
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_knob_01c
					gtr_knob_02c
					gtr_knob_03c
					gtr_knob_04c
					gtr_knob_05c
					gtr_knob_06c
					gtr_knob_07c
					gtr_knob_08c
					gtr_knob_09c
					gtr_knob_10
					gtr_knob_01
					gtr_knob_02
					gtr_knob_03
					gtr_knob_04
					gtr_knob_05
					gtr_knob_06
					gtr_knob_07
					gtr_knob_08
					gtr_knob_09
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr75_bridgemm
					gtr86_bridge
					gtr84_whammy
					gtr75_bridgebmm
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					gtr_misc_switch4
					gtr71_switch
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = gtr84_mm_petrucci
		frontend_desc = qs(0xaa5046fb)
		sponsor_id = `music	man`
		mesh = `models/car_instruments/guitar/mm/gtr84_mm_petrucci`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/mm/gtr84_mm_petrucci`
				material = gtr84_mm_pet_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr84_mm_pet
					}
					{
						$preset_layer_fades
						mask = $gtr84_mm_pet_fades
					}
					{
						$preset_layer_details
						mask = $gtr84_mm_pet_details
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
				part = cas_guitar_neck
				valid = [
					cag_22fret_mm01
					cag_22fret_mm02
					cag_22fret_mm03
					cag_22fret_mm04
					cag_24fret_mm01
					cag_24fret_mm02
					cag_24fret_mm03
					cag_24fret_mm04
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr84_neckhead01
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
					gtr84_pickup_a
					gtr86_pickup
					gtr86_pickupb
					gtr_pickup_type2_paf1
					gtr76_pickupa_c
					gtr_emg_pickup1
					gtr_emg_pickup2
					gtr_emg_pickup5
					gtr_emg_pickup4
					gtr_emg_pickup6
					gtr_pickup_sd01
					gtr_pickup_sd05
					gtr_pickup_sd05b
					gtr_pickup_sd06
					gtr_pickup_sd06b
					gtr_pickup_sd03
					gtr_pickup_sd04
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_knob_mm01
					gtr_knob_02
					gtr_knob_03
					gtr_knob_04
					gtr_knob_05
					gtr_knob_06
					gtr_knob_07
					gtr_knob_08
					gtr_knob_09
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr84_whammy
					gtr75_bridgebmm
					gtr76_bridgemm
					gtr86_bridge
					gtr75_bridgemm
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					gtr_misc_switch4
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = gtr1b_nvsft_sk8gtr
		frontend_desc = qs(0x073443ee)
		mesh = `models/car_instruments/guitar/heroes/gtr1b_nvsft_sk8gtr`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/heroes/gtr1b_body_nvsft_sk8brd_d`
				material = gtr1b_nvsft_sk8gtr_primary
				$0x20c2ad2f
			}
		]
		inclusion = [
			{
				part = cas_guitar_neck
				valid = [
					gtr1b_fretboard24_sk8
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr1b_neckhead_sk8
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
					gtr1b_pickup_sk8
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr1b_knob_locknut
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr1b_bridge_whamy
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					gtr1b_misc_wheels
				]
			}
		]
		$car_rocker_guitars_factoredglobal_1
	}
	{
		desc_id = gtr27_nsft_acoustic
		frontend_desc = qs(0x6914711a)
		mesh = `models/car_instruments/guitar/heroes/gtr27_nsft_acoustic`
		pak_num = 0
		guitar_offset = (0.0, 0.2, 0.0)
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/heroes/gtr27_nsft_acoustic_d`
				material = gtr27_nsft_acoustic_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr27_nsft_acoustic_finishes
					}
					{
						$preset_layer_fades
						mask = $gtr27_nsft_acoustic_fades
					}
					{
						$preset_layer_details
						mask = $gtr27_nsft_acoustic_details
					}
				]
				$car_rocker_guitars_factoredglobal_33
			}
		]
		inclusion = [
			{
				part = cas_guitar_neck
				valid = [
					cag_22fret_hero01
					cag_22fret_hero02
					cag_22fret_hero03
					cag_22fret_hero04
					cag_24fret_hero01
					cag_24fret_hero02
					cag_24fret_hero03
					cag_24fret_hero04
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr27_neckhead_acoustic
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
					gtr26_dummy
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
					gtr27_bridge_acoustic
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					None
				]
			}
		]
		$car_rocker_guitars_factoredglobal_1
	}
	{
		desc_id = gtr130_steampunk
		frontend_desc = qs(0xff48758b)
		mesh = `models/car_instruments/guitar/heroes/gtr130_steampunk`
		pak_num = 0
		inclusion = [
			{
				part = cas_guitar_neck
				valid = [
					gtr_fretboard_sp
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr130_neckhead
				]
			}
			{
				part = cas_guitar_pickguards
				valid = [
					gtr130_pg
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr130_pickup
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr130_knob
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr130_bridge
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					gtr130_misc
				]
			}
		]
		has_node_array
	}
	{
		desc_id = gtr131_steel
		frontend_desc = qs(0xa46f12b9)
		mesh = `models/car_instruments/guitar/heroes/gtr131_steel`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/heroes/gtr131_steel_d`
				material = gtr131_steel_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr131_steel
					}
					{
						$preset_layer_fades
						mask = $gtr131_steel_fades
					}
					{
						$preset_layer_details
						mask = $gtr131_steel_details
					}
				]
				$0x20c2ad2f
			}
		]
		inclusion = [
			{
				part = cas_guitar_neck
				valid = [
					cag_22fret_hero04
					cag_24fret_hero04
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr131_neckhead
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
					gtr131_pickup
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
					gtr131_bridge
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					None
				]
			}
		]
		$car_rocker_guitars_factoredglobal_1
	}
	{
		desc_id = gtr132_axe
		frontend_desc = qs(0x878e9b18)
		mesh = 0x779f02db
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/heroes/gtr132_axe_d`
				material = 0x3e4597e2
				$0x20c2ad2f
			}
		]
		inclusion = [
			{
				part = cas_guitar_neck
				valid = [
					cag_22fret_hero_axe
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr132_neckhead
				]
			}
			{
				part = cas_guitar_pickguards
				valid = [
					gtr132_pg
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr132_pickup
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr132_knob
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr132_bridge
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					gtr132_misc
				]
			}
		]
		has_node_array
	}
	{
		desc_id = gtr108_casket
		frontend_desc = qs(0xbcf86fa7)
		mesh = `models/car_instruments/guitar/heroes/gtr108_casket`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex\models\car_instruments\bass\heroes\bass108_casket_d`
				material = gtr108_casket_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr108_casket
					}
					{
						$preset_layer_fades
						mask = $gtr108_casket_fades
					}
					{
						$preset_layer_details
						mask = $gtr108_casket_details
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
				part = cas_guitar_neck
				valid = [
					cag_22fret_hero01
					cag_22fret_hero02
					cag_22fret_hero03
					cag_22fret_hero04
					cag_24fret_hero01
					cag_24fret_hero02
					cag_24fret_hero03
					cag_24fret_hero04
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
					gtr_emg_pickup4
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_knob_01
					gtr_knob_02
					gtr_knob_03
					gtr_knob_04
					gtr_knob_05
					gtr_knob_06
					gtr_knob_07
					gtr_knob_08
					gtr_knob_09
					gtr_knob_10
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr108_bridge
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr108_neckhead
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					None
				]
			}
		]
		$car_rocker_guitars_factoredglobal_1
	}
	{
		desc_id = gtr109_metal
		frontend_desc = qs(0xb1d147af)
		mesh = 0x42cf85ef
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/heroes/gtr109_metal_d`
				material = 0xd2fec434
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr109_metal
					}
					{
						$preset_layer_fades
						mask = $0x660ce520
					}
					{
						$preset_layer_details
						mask = $0xb79d2538
					}
				]
				$0x20c2ad2f
			}
		]
		inclusion = [
			{
				part = cas_guitar_neck
				valid = [
					cag_22fret_hero_metal
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr109_neckhead
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
					gtr_emg_pickup4
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_knob_01
					gtr_knob_02
					gtr_knob_03
					gtr_knob_04
					gtr_knob_05
					gtr_knob_06
					gtr_knob_07
					gtr_knob_08
					gtr_knob_09
					gtr_knob_10
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr109_bridge
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					None
				]
			}
		]
		$car_rocker_guitars_factoredglobal_1
	}
	{
		desc_id = gtr110_banjo
		frontend_desc = qs(0x9af1e7e7)
		mesh = `models/car_instruments/guitar/heroes/gtr110_banjo`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/heroes/gtr110_banjo_d`
				material = gtr110_banjo_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr110_banjo
					}
					{
						$preset_layer_fades
						mask = $gtr110_banjo_fades
					}
					{
						$preset_layer_details
						mask = $gtr110_banjo_details
					}
				]
				$0x20c2ad2f
			}
		]
		inclusion = [
			{
				part = cas_guitar_neck
				valid = [
					cag_22fret_banjo
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr110_neckhead
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
					None
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
					gtr110_bridge
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					gtr110_misc
				]
			}
		]
		has_node_array
	}
	{
		desc_id = gtr133_tiki
		frontend_desc = qs(0x1aa6ccbd)
		mesh = `models/car_instruments/guitar/heroes/gtr133_tiki`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/heroes/gtr133_tiki_d`
				material = gtr133_tiki_primary
				$car_rocker_guitars_factoredglobal_35
			}
		]
		inclusion = [
			{
				part = cas_guitar_neck
				valid = [
					cag_22fret_hero_tiki
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr133_neckhead
				]
			}
			{
				part = cas_guitar_pickguards
				valid = [
					gtr133_pg
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr133_pickup
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_knob_01
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr133_bridge
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					gtr133_misc
				]
			}
		]
		$car_rocker_guitars_factoredglobal_1
	}
	{
		desc_id = gtr142_vtwin
		frontend_desc = qs(0xd199fea9)
		mesh = `models/car_instruments/guitar/heroes/gtr142_vtwin`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/heroes/gtr142_vtwinb_d`
				material = gtr142_vtwin_primary
				$car_rocker_guitars_factoredglobal_35
			}
		]
		inclusion = [
			{
				part = cas_guitar_neck
				valid = [
					cag_22fret_hero_tiki
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr142_neckhead
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
					gtr142_pickup
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr142_knob
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr142_bridge
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					None
				]
			}
		]
		$car_rocker_guitars_factoredglobal_1
	}
	{
		desc_id = gtr136_glass
		frontend_desc = qs(0xddedceef)
		mesh = `models/car_instruments/guitar/heroes/gtr136_glass`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex\models\car_instruments\bass\heroes\bass136_glass_d`
				material = gtr136_glass_primary
				$car_rocker_guitars_factoredglobal_35
			}
		]
		inclusion = [
			{
				part = cas_guitar_neck
				valid = [
					cag_22fret_hero_axe
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr136_neckhead
				]
			}
			{
				part = cas_guitar_pickguards
				valid = [
					gtr136_pg
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr136_pickup
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr136_knob
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr136_bridge
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					gtr136_misc
				]
			}
		]
		$car_rocker_guitars_factoredglobal_1
	}
	{
		desc_id = gtr135_johnny
		frontend_desc = qs(0xd8c55261)
		mesh = 0x031c35ff
		pak_num = 0
		inclusion = [
			{
				part = cas_guitar_neck
				valid = [
					gtr_fretboard_johnny
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr135_neckhead
				]
			}
			{
				part = cas_guitar_pickguards
				valid = [
					gtr135_pg
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_pickup_johnny
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr135_knob
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_bridge_johnny
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					gtr135_misc
				]
			}
		]
		has_node_array
	}
	{
		desc_id = gtr78_prs_sc
		frontend_desc = qs(0xaacb9118)
		sponsor_id = prs
		mesh = `models/car_instruments/guitar/prs/gtr78_prs_sc`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/prs/gtr78_prs_sc_d`
				material = gtr78_prs_sc_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr78_prs_sc
					}
					{
						$preset_layer_fades
						mask = $gtr78_prs_sc_fades
					}
					{
						$preset_layer_details
						mask = $gtr78_prs_sc_details
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
				part = cas_guitar_neck
				valid = [
					cag_22fret_prs01
					cag_22fret_prs02
					cag_22fret_prs03
					cag_22fret_prs04
					cag_24fret_prs01
					cag_24fret_prs02
					cag_24fret_prs03
					cag_24fret_prs04
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr78_neckhead_01
					gtr80_neckhead_01
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
					gtr_pickup_type2_prs
					gtr_pickup_prs001b
					gtr_pickup_prs001
					gtr_pickup_type2_paf2
					gtr_emg_pickup1
					gtr_emg_pickup2
					gtr_emg_pickup4
					gtr_emg_pickup6
					prs_pickup_hbucker
					gtr_pickup_sd01
					gtr_pickup_sd05
					gtr_pickup_sd05b
					gtr_pickup_sd06
					gtr_pickup_sd06b
					gtr_pickup_sd03
					gtr_emg_pickup3
					gtr_pickup_sd04
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					prs_knob_lampshade_4
					gtr_knob_tophat_3
					gtr_knob_tophat_w_3
					gtr_knob_02
					gtr_knob_03
					gtr_knob_04
					gtr_knob_05
					gtr_knob_06
					gtr_knob_07
					gtr_knob_08
					gtr_knob_09
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr81_bridge01
					gtr79_whammy
					gtr78_bridge01
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					gtr_misc_switch4
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = gtr79_prs_cstm24
		frontend_desc = qs(0x5fcde089)
		sponsor_id = prs
		mesh = `models/car_instruments/guitar/prs/gtr79_prs_cstm24`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/prs/prs_ctm24_d`
				material = gtr79_prs_cst24_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr79_prs_cs24_finishes
					}
					{
						$preset_layer_fades
						mask = $gtr79_prs_cs24_fades
					}
					{
						$preset_layer_details
						mask = $gtr79_prs_cs24_details
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
				part = cas_guitar_neck
				valid = [
					cag_22fret_prs01
					cag_22fret_prs02
					cag_22fret_prs03
					cag_22fret_prs04
					cag_24fret_prs01
					cag_24fret_prs02
					cag_24fret_prs03
					cag_24fret_prs04
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr79_neckhead_01
					gtr80_neckhead_01
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
					gtr_pickup_prs001b
					gtr_pickup_prs001
					gtr_pickup_type2_prs
					gtr_pickup_type2_paf2
					gtr_emg_pickup1
					gtr_emg_pickup2
					gtr_emg_pickup3
					gtr_emg_pickup4
					gtr_emg_pickup6
					prs_pickup_hbucker
					gtr_pickup_sd01
					gtr_pickup_sd05
					gtr_pickup_sd05b
					gtr_pickup_sd06
					gtr_pickup_sd06b
					gtr_pickup_sd03
					gtr_pickup_sd04
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					prs_knob_lampshade
					gtr_knob_tophat_2
					gtr_knob_tophat_w_2
					gtr_knob_02
					gtr_knob_03
					gtr_knob_04
					gtr_knob_05
					gtr_knob_06
					gtr_knob_07
					gtr_knob_08
					gtr_knob_09
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr79_whammy
					gtr81_bridge01
					gtr78_bridge01
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					gtr_misc_switch4
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = gtr80_prs_sant
		frontend_desc = qs(0x4be6aea2)
		sponsor_id = prs
		mesh = `models/car_instruments/guitar/prs/gtr80_prs_sant`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/prs/prs_80_snt_d`
				material = gtr80_prs_snt_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr80_prs_snt_finishes
					}
					{
						$preset_layer_fades
						mask = $gtr80_prs_snt_fades
					}
					{
						$preset_layer_details
						mask = $gtr80_prs_snt_details
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
				part = cas_guitar_neck
				valid = [
					cag_22fret_prs01
					cag_22fret_prs02
					cag_22fret_prs03
					cag_22fret_prs04
					cag_24fret_prs01
					cag_24fret_prs02
					cag_24fret_prs03
					cag_24fret_prs04
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr80_neckhead_01
					gtr79_neckhead_01
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
					gtr_pickup_type2_prs
					gtr_pickup_prs001b
					gtr_pickup_prs001
					gtr_pickup_type2_paf2
					gtr_emg_pickup1
					gtr_emg_pickup2
					gtr_emg_pickup3
					gtr_emg_pickup4
					gtr_emg_pickup6
					prs_pickup_hbucker
					gtr_pickup_sd01
					gtr_pickup_sd05
					gtr_pickup_sd05b
					gtr_pickup_sd06
					gtr_pickup_sd06b
					gtr_pickup_sd03
					gtr_pickup_sd04
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					prs_knob_lampshade
					gtr_knob_tophat_2
					gtr_knob_tophat_w_2
					gtr_knob_02
					gtr_knob_03
					gtr_knob_04
					gtr_knob_05
					gtr_knob_06
					gtr_knob_07
					gtr_knob_08
					gtr_knob_09
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr79_whammy
					gtr81_bridge01
					gtr78_bridge01
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					double_switches
				]
			}
		]
		$car_rocker_guitars_factoredglobal_1
	}
	{
		desc_id = gtr81_prs_miramt
		frontend_desc = qs(0x7a61ace7)
		sponsor_id = prs
		mesh = `models/car_instruments/guitar/prs/gtr81_prs_miramt`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/prs/prs_81_mt_d`
				material = gtr81_prs_mt_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr_81_mt_finishes
					}
					{
						$preset_layer_fades
						mask = $gtr_81_mt_fades
					}
					{
						$preset_layer_details
						mask = $gtr_81_mt_details
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
				part = cas_guitar_neck
				valid = [
					cag_22fret_prs01
					cag_22fret_prs02
					cag_22fret_prs03
					cag_22fret_prs04
					cag_24fret_prs01
					cag_24fret_prs02
					cag_24fret_prs03
					cag_24fret_prs04
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr81_neckhead01
					gtr80_neckhead_01
				]
			}
			{
				part = cas_guitar_pickguards
				valid = [
					gtr81_pguard
					None
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_pickup_prs001b
					gtr_pickup_prs001
					gtr_pickup_type2_prs
					gtr_pickup_type2_paf2
					gtr_emg_pickup1
					gtr_emg_pickup2
					gtr_emg_pickup3
					gtr_emg_pickup4
					gtr_emg_pickup6
					prs_pickup_hbucker
					gtr_pickup_sd01
					gtr_pickup_sd05
					gtr_pickup_sd05b
					gtr_pickup_sd06
					gtr_pickup_sd06b
					gtr_pickup_sd03
					gtr_pickup_sd04
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					prs_knob_lampshade
					gtr_knob_tophat_2
					gtr_knob_tophat_w_2
					gtr_knob_02
					gtr_knob_03
					gtr_knob_04
					gtr_knob_05
					gtr_knob_06
					gtr_knob_07
					gtr_knob_08
					gtr_knob_09
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr81_bridge01
					gtr78_bridge01
					gtr79_whammy
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					gtr_misc_switch4
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = gtr82_prs_se1
		frontend_desc = qs(0x0e624dd2)
		sponsor_id = prs
		mesh = `models/car_instruments/guitar/prs/gtr82_prs_se1`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/prs/prs_82_prs_se1`
				material = gtr82_prs_se1_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr82_prs_se1
					}
					{
						$preset_layer_fades
						mask = $gtr82_prs_se1_fades
					}
					{
						$preset_layer_details
						mask = $gtr82_prs_se1_details
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
				part = cas_guitar_neck
				valid = [
					cag_22fret_prs01
					cag_22fret_prs02
					cag_22fret_prs03
					cag_22fret_prs04
					cag_24fret_prs01
					cag_24fret_prs02
					cag_24fret_prs03
					cag_24fret_prs04
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr82_neckhead01
					gtr80_neckhead_01
				]
			}
			{
				part = cas_guitar_pickguards
				valid = [
					gtr82_pguard
					None
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr_pickup_soapbar
					gtr_pickup_prs001
					gtr_emg_pickup3
					gtr_pickup_type2_paf2
					prs_pickup_hbucker
					gtr_pickup_type2_prs
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_knob_tophat
					gtr_knob_tophat_w
					prs_knob_lampshade_1
					gtr_knob_02c
					gtr_knob_03c
					gtr_knob_04c
					gtr_knob_05c
					gtr_knob_06b
					gtr_knob_07c
					gtr_knob_08c
					gtr_knob_09c
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr81_bridge01
					gtr78_bridge01
					gtr79_whammy
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = gtr83_prs_stla
		frontend_desc = qs(0x1ae57f5b)
		sponsor_id = prs
		mesh = `models/car_instruments/guitar/prs/gtr83_prs_stla`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/prs/gtr83_prs_starla`
				material = gtr83_prs_starla_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr82_prs_se1
					}
					{
						$preset_layer_fades
						mask = $gtr82_prs_se1_fades
					}
					{
						$preset_layer_details
						mask = $gtr82_prs_se1_details
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
				part = cas_guitar_neck
				valid = [
					cag_22fret_prs01
					cag_22fret_prs02
					cag_22fret_prs03
					cag_22fret_prs04
					cag_24fret_prs01
					cag_24fret_prs02
					cag_24fret_prs03
					cag_24fret_prs04
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr83_neckhead01
					gtr80_neckhead_01
				]
			}
			{
				part = cas_guitar_pickguards
				valid = [
					gtr83_pguard
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					prs_pickup_hbucker
					gtr_pickup_prs001b
					gtr_pickup_prs001
					gtr_emg_pickup1
					gtr_emg_pickup2
					gtr_emg_pickup4
					gtr_emg_pickup5
					gtr_emg_pickup6
					gtr_pickup_sd01
					gtr_pickup_sd05
					gtr_pickup_sd05b
					gtr_pickup_sd06
					gtr_pickup_sd06b
					gtr_pickup_sd03
					gtr_pickup_sd04
					gtr_pickup_type2_paf2
					gtr_pickup_type2_prs
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					prs_knob_lampshade
					gtr_knob_tophat_2
					gtr_knob_tophat_w_2
					gtr_knob_01
					gtr_knob_02
					gtr_knob_03
					gtr_knob_04
					gtr_knob_05
					gtr_knob_06
					gtr_knob_07
					gtr_knob_08
					gtr_knob_09
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr70_bridge
					gtr79_whammy
					gtr81_bridge01
					gtr78_bridge01
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					None
				]
			}
		]
		$car_rocker_guitars_factoredglobal_1
	}
	{
		desc_id = gtr71_sch_c1
		frontend_desc = qs(0x37e640f4)
		sponsor_id = schecter
		mesh = `models/car_instruments/guitar/schecter/gtr71_sch_c1`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/schecter/gtr71_sch_c1_d`
				material = gtr71_sch_c1_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr71_sch_c1
					}
					{
						$preset_layer_fades
						mask = $gtr71_sch_c1_fades
					}
					{
						$preset_layer_details
						mask = $gtr71_sch_c1_details
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
				part = cas_guitar_neck
				valid = [
					cag_22fret_schecter01
					cag_22fret_schecter02
					cag_22fret_schecter03
					cag_22fret_schecter04
					cag_24fret_schecter01
					cag_24fret_schecter02
					cag_24fret_schecter03
					cag_24fret_schecter04
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr71_neckhead_01
					gtr71_neckhead_02
					gtr71_neckhead_03
					gtr71_neckhead_04
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
					gtr70_sch_ultra_pickup
					gtr70_sch_ultra_pickup3
					gtr_emg_pickup1
					gtr_emg_pickup2
					gtr_emg_pickup5
					gtr_emg_pickup4
					gtr_emg_pickup3
					gtr_emg_pickup6
					gtr_pickup_sd01
					gtr_pickup_sd05
					gtr_pickup_sd05b
					gtr_pickup_sd06
					gtr_pickup_sd06b
					gtr_pickup_type2_paf1
					gtr_pickup_type2_paf2
					gtr_pickup_sd03
					gtr_pickup_sd04
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_knob_01
					gtr_knob_02
					gtr_knob_03
					gtr_knob_04
					gtr_knob_05
					gtr_knob_06
					gtr_knob_07
					gtr_knob_08
					gtr_knob_09
					gtr_knob_10
					gtr_knob_01c
					gtr_knob_02c
					gtr_knob_03c
					gtr_knob_04c
					gtr_knob_05c
					gtr_knob_06c
					gtr_knob_07c
					gtr_knob_08c
					gtr_knob_09c
					gtr_knob_10c
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr71_bridge
					gtr74_bridge1
					gtr70_bridge
					gtr_bridge_01
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					gtr_misc_switch4
					gtr71_switch
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = gtr72_sch_devil
		frontend_desc = qs(0x4c989982)
		sponsor_id = schecter
		mesh = `models/car_instruments/guitar/schecter/gtr72_sch_devil`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/schecter/gtr72_sch_devil_d`
				material = gtr72_sch_devil_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr72_sch_devil
					}
					{
						$preset_layer_fades
						mask = $gtr72_sch_devil_fades
					}
					{
						$preset_layer_details
						mask = $gtr72_sch_devil_details
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
				part = cas_guitar_neck
				valid = [
					cag_22fret_schecter01
					cag_22fret_schecter02
					cag_22fret_schecter03
					cag_22fret_schecter04
					cag_24fret_schecter01
					cag_24fret_schecter02
					cag_24fret_schecter03
					cag_24fret_schecter04
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr72_neckhead_01
					gtr72_neckhead_02
					gtr72_neckhead_03
					gtr72_neckhead_04
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
					gtr70_sch_ultra_pickup
					gtr70_sch_ultra_pickup2
					gtr_emg_pickup1
					gtr_emg_pickup2
					gtr_emg_pickup5
					gtr_pickup_sd05b
					gtr_emg_pickup4
					gtr_emg_pickup3
					gtr_emg_pickup6
					gtr_pickup_sd01
					gtr_pickup_sd05
					gtr_pickup_sd06
					gtr_pickup_sd06b
					gtr_pickup_type2_paf1
					gtr_pickup_type2_paf2
					gtr_pickup_sd03
					gtr_pickup_sd04
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_knob_01
					gtr_knob_02
					gtr_knob_03b
					gtr_knob_04b
					gtr_knob_05b
					gtr_knob_06b
					gtr_knob_07
					gtr_knob_08b
					gtr_knob_09
					gtr_knob_10
					gtr_knob_01c
					gtr_knob_02c
					gtr_knob_03c
					gtr_knob_04c
					gtr_knob_05c
					gtr_knob_06c
					gtr_knob_07c
					gtr_knob_08c
					gtr_knob_09c
					gtr_knob_10c
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr72_bridge
					gtr74_bridge1
					gtr70_bridge
					gtr_bridge_01
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					gtr_misc_switch4
					None
				]
			}
		]
		$car_rocker_guitars_factoredglobal_1
	}
	{
		desc_id = gtr73_sch_s1
		frontend_desc = qs(0x3430426f)
		sponsor_id = schecter
		mesh = `models/car_instruments/guitar/schecter/gtr73_sch_s1`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/schecter/gtr73_sch_s1_d`
				material = gtr73_sch_s1_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr73_sch_s1
					}
					{
						$preset_layer_fades
						mask = $gtr73_sch_s1_fades
					}
					{
						$preset_layer_details
						mask = $gtr73_sch_s1_details
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
				part = cas_guitar_neck
				valid = [
					cag_22fret_schecter01
					cag_22fret_schecter02
					cag_22fret_schecter03
					cag_22fret_schecter04
					cag_24fret_schecter01
					cag_24fret_schecter02
					cag_24fret_schecter03
					cag_24fret_schecter04
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr73_neckhead_01
					gtr73_neckhead_02
					gtr73_neckhead_03
					gtr73_neckhead_04
				]
			}
			{
				part = cas_guitar_pickguards
				valid = [
					gtr73_pg1
					None
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr70_sch_ultra_pickup
					gtr_emg_pickup1
					gtr_emg_pickup2
					gtr_emg_pickup5
					gtr_pickup_sd05b
					gtr_emg_pickup4
					gtr_emg_pickup3
					gtr_emg_pickup6
					gtr_pickup_sd01
					gtr_pickup_sd05
					gtr_pickup_sd06b
					gtr_pickup_type2_paf1
					gtr_pickup_type2_paf2
					gtr_pickup_sd03
					gtr_pickup_sd04
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_knob_01c
					gtr_knob_02c
					gtr_knob_03c
					gtr_knob_04c
					gtr_knob_05c
					gtr_knob_06c
					gtr_knob_07c
					gtr_knob_08c
					gtr_knob_09c
					gtr_knob_10c
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr72_bridge
					gtr74_bridge1b
					gtr70_bridge
					gtr_bridge_01
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					gtr_misc_switch4
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = gtr74_sch_star
		frontend_desc = qs(0xa1a6df33)
		sponsor_id = schecter
		mesh = `models/car_instruments/guitar/schecter/gtr74_sch_star`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/schecter/gtr74_sch_star_d`
				material = gtr74_sch_star_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr74_sch_star
					}
					{
						$preset_layer_fades
						mask = $gtr74_sch_star_fades
					}
					{
						$preset_layer_details
						mask = $gtr74_sch_star_details
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
				part = cas_guitar_neck
				valid = [
					cag_22fret_schecter01
					cag_22fret_schecter02
					cag_22fret_schecter03
					cag_22fret_schecter04
					cag_24fret_schecter01
					cag_24fret_schecter02
					cag_24fret_schecter03
					cag_24fret_schecter04
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr74_neckhead_01
					gtr74_neckhead_02
					gtr74_neckhead_03
					gtr74_neckhead_04
				]
			}
			{
				part = cas_guitar_pickguards
				valid = [
					gtr74_pg1
					None
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr70_sch_ultra_pickup
					gtr_emg_pickup1
					gtr_emg_pickup2
					gtr_emg_pickup5
					gtr_emg_pickup4
					gtr_emg_pickup3
					gtr_emg_pickup6
					gtr_pickup_sd01
					gtr_pickup_sd05
					gtr_pickup_sd05b
					gtr_pickup_sd06
					gtr_pickup_sd06b
					gtr_pickup_type2_paf1
					gtr_pickup_type2_paf2
					gtr_pickup_sd03
					gtr_pickup_sd04
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_knob_01
					gtr_knob_02
					gtr_knob_03
					gtr_knob_04
					gtr_knob_05
					gtr_knob_06
					gtr_knob_07
					gtr_knob_08
					gtr_knob_09
					gtr_knob_10
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr72_bridge
					gtr74_bridge1
					gtr70_bridge
					gtr_bridge_01
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					gtr_misc_switch4
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = gtr1_sch_tempest
		frontend_desc = qs(0xbcbe7e5d)
		sponsor_id = schecter
		mesh = `models/car_instruments/guitar/schecter/gtr1_sch_tempest`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/schecter/gtr1_sch_tempest_body_d`
				material = gtr1_sch_tempest_primary
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
						mask = $gtr1_sch_tempest_details
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
				part = cas_guitar_neck
				valid = [
					cag_22fret_schecter01
					cag_22fret_schecter02
					cag_22fret_schecter03
					cag_22fret_schecter04
					cag_24fret_schecter01
					cag_24fret_schecter02
					cag_24fret_schecter03
					cag_24fret_schecter04
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr1_sch_neckhead_1
					gtr1_sch_neckhead_2
					gtr1_sch_neckhead_3
					gtr1_sch_neckhead_4
				]
			}
			{
				part = cas_guitar_pickguards
				valid = [
					gtr1_sch_pickguard_01
					None
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr70_sch_ultra_pickup
					gtr70_sch_ultra_pickup2
					gtr_emg_pickup1
					gtr_emg_pickup2
					gtr_emg_pickup5
					gtr_emg_pickup6
					gtr_emg_pickup4
					gtr_emg_pickup3
					gtr_pickup_sd05b
					gtr_pickup_sd05
					gtr_pickup_sd06
					gtr_pickup_sd06b
					gtr_pickup_type2_paf1
					gtr_pickup_type2_paf2
					gtr_pickup_sd03
					gtr_pickup_sd04
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_knob_01
					gtr_knob_02
					gtr_knob_03
					gtr_knob_04
					gtr_knob_05
					gtr_knob_06
					gtr_knob_07
					gtr_knob_08
					gtr_knob_09
					gtr_knob_10
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr70_bridge
					gtr_bridge_01
					gtr71_bridge
					gtr74_bridge1
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					gtr_misc_switch4
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = gtr70_sch_ultra
		frontend_desc = qs(0xe4c567a7)
		sponsor_id = schecter
		mesh = `models/car_instruments/guitar/schecter/gtr70_sch_ultra`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/schecter/gtr70_sch_ultra_d`
				material = gtr70_sch_ultra_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr70_sch_ultra
					}
					{
						$preset_layer_fades
						mask = $gtr70_sch_ultra_fades
					}
					{
						$preset_layer_details
						mask = $gtr70_sch_ultra_details
					}
				]
				$0x20c2ad2f
			}
		]
		inclusion = [
			{
				part = cas_guitar_neck
				valid = [
					cag_22fret_schecter01
					cag_22fret_schecter02
					cag_22fret_schecter03
					cag_22fret_schecter04
					cag_24fret_schecter01
					cag_24fret_schecter02
					cag_24fret_schecter03
					cag_24fret_schecter04
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr70_neckhead
					gtr70_neckhead_02b
					gtr70_neckhead_03
					gtr70_neckhead_04
				]
			}
			{
				part = cas_guitar_pickguards
				valid = [
					gtr70_pg
					gtr70_pg2
					None
				]
			}
			{
				part = cas_guitar_pickups
				valid = [
					gtr70_sch_ultra_pickup
					gtr70_sch_ultra_pickup3
					gtr_emg_pickup1
					gtr_emg_pickup2
					gtr_emg_pickup5
					gtr_pickup_sd05b
					gtr_emg_pickup4
					gtr_emg_pickup3
					gtr_emg_pickup6
					gtr_pickup_sd01
					gtr_pickup_sd05
					gtr_pickup_sd06
					gtr_pickup_sd06b
					gtr_pickup_type2_paf1
					gtr_pickup_type2_paf2
					gtr_pickup_sd03
					gtr_pickup_sd04
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_knob_01
					gtr_knob_02
					gtr_knob_03
					gtr_knob_04
					gtr_knob_05
					gtr_knob_06
					gtr_knob_07
					gtr_knob_08
					gtr_knob_09
					gtr_knob_10
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr70_bridge
					gtr_bridge_01
					gtr71_bridge
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					gtr_misc_switch4
					None
				]
			}
		]
		has_node_array
	}
	{
		desc_id = gtr25_manson_bellamy
		frontend_desc = qs(0x448732da)
		mesh = `models/car_instruments/guitar/manson/gtr25_manson_bellamy`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/manson/gtr25_manson_bellamy_d`
				material = gtr25_manson_bellamy_primary
				$car_rocker_guitars_factoredglobal_33
			}
		]
		inclusion = [
			{
				part = cas_guitar_neck
				valid = [
					cag_22fret_mcswain01
					cag_22fret_mcswain02
					cag_22fret_mcswain03
					cag_22fret_mcswain04
					cag_24fret_mcswain01
					cag_24fret_mcswain02
					cag_24fret_mcswain03
					cag_24fret_mcswain04
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr25_neckhead_manson
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
					gtr25_2pickups
				]
			}
			{
				part = cas_guitar_knobs
				valid = [
					gtr_knob_manson_01
				]
			}
			{
				part = cas_guitar_bridges
				valid = [
					gtr_brdg_manson_1
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					gtr_misc_switch_m
					gtr_miscknob_manson_02
					None
				]
			}
		]
		$car_rocker_guitars_factoredglobal_24
	}
	{
		desc_id = gtr26_cash_acoustic
		frontend_desc = qs(0xa8096f32)
		mesh = `models/car_instruments/guitar/cash/gtr26_cash_acoustic`
		pak_num = 0
		guitar_offset = (0.0, 0.2, 0.0)
		inclusion = [
			{
				part = cas_guitar_neck
				valid = [
					gtr_fretboard_04cash
				]
			}
			{
				part = cas_guitar_head
				valid = [
					gtr26_neckhead_cash
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
					gtr26_dummy
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
					gtr26_bridge_cash
				]
			}
			{
				part = cas_guitar_misc
				valid = [
					None
				]
			}
		]
		$car_rocker_guitars_factoredglobal_24
	}
]
cas_guitar_neck = [
	{
		desc_id = cag_22fret_esp01
		frontend_desc = qs(0xa8ef14e2)
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard_01`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d_01`
				material = gtr_fretboard_01_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_22fret_esp
						$0x1fe9cf67
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d_01`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
						flags = 4
						Color = grey_4guitar
					}
				]
			}
		]
	}
	{
		desc_id = cag_22fret_esp02
		frontend_desc = qs(0x18203e43)
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard_02`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d2_01`
				material = gtr_fretboard_02_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_22fret_esp
						$car_rocker_guitars_factoredglobal_48
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d2_01`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
						flags = 4
						Color = black_1guitar
					}
				]
			}
		]
	}
	{
		desc_id = cag_22fret_esp03
		frontend_desc = qs(0x89ed86d5)
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard_03`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d3_01`
				material = gtr_fretboard_03_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_22fret_esp
						$0x1fe9cf67
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d3_01`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
						flags = 4
						Color = grey_4guitar
					}
				]
			}
		]
	}
	{
		desc_id = cag_22fret_esp04
		frontend_desc = qs(0x3b865ccc)
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard_04`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
				material = gtr_fretboard_04_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_22fret_esp
						$0x1fe9cf67
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
						flags = 4
						Color = grey_4guitar
					}
				]
			}
		]
	}
	{
		desc_id = cag_22fret_hero01
		frontend_desc = qs(0xa8ef14e2)
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard_01`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d_01`
				material = gtr_fretboard_01_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_22fret_heroes
						$0x1fe9cf67
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d_01`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
						flags = 4
						Color = grey_4guitar
					}
				]
			}
		]
	}
	{
		desc_id = cag_22fret_hero02
		frontend_desc = qs(0x18203e43)
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard_02`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d2_01`
				material = gtr_fretboard_02_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_22fret_heroes
						$car_rocker_guitars_factoredglobal_48
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d2_01`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
						flags = 4
						Color = black_1guitar
					}
				]
			}
		]
	}
	{
		desc_id = cag_22fret_hero03
		frontend_desc = qs(0x89ed86d5)
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard_03`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d3_01`
				material = gtr_fretboard_03_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_22fret_heroes
						$0x1fe9cf67
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d3_01`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
						flags = 4
						Color = grey_4guitar
					}
				]
			}
		]
	}
	{
		desc_id = cag_22fret_hero04
		frontend_desc = qs(0x3b865ccc)
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard_04`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
				material = gtr_fretboard_04_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_22fret_heroes
						$0x1fe9cf67
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
						flags = 4
						Color = grey_4guitar
					}
				]
			}
		]
	}
	{
		desc_id = gtr_fretboard_sp
		frontend_desc = qs(0xe4a3b9f4)
		mesh = `models/car_instruments/guitar/heroes/gtr_fretboard_sp`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/heroes/gtr_sp_fretboard_d`
				material = gtr_fretboard_sp_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_22fret_heroes
						$0x1fe9cf67
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/heroes/gtr_sp_fretboard_d`
				pre_layer = [
					{
						Color = grey_5
						texture = `tex/models/characters/layers/cag/gh5/22_fret_ld26_hero_cogs`
						flags = 36
					}
				]
			}
		]
	}
	{
		desc_id = gtr_fretboard_johnny
		frontend_desc = qs(0xe4a3b9f4)
		mesh = `models/car_instruments/guitar/heroes/gtr_fretboard_johnny`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/heroes/gtr_johnny_fretboard_d`
				material = gtr_fretboard_johnny_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $gtr_fretboard_johnny
					}
				]
			}
		]
	}
	{
		desc_id = gtr1b_fretboard24_sk8
		frontend_desc = qs(0x0f12b8ca)
		mesh = `models/car_instruments/guitar/heroes/gtr1b_fretboard24_sk8`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
				material = gtr1b_fretboard24_sk8_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_22fret_heroes_sk8ordie
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/heroes/gtr1b_22fret_sk8ordie`
						flags = 4
					}
				]
			}
		]
	}
	{
		desc_id = cag_22fret_hero_axe
		frontend_desc = qs(0x3b865ccc)
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard_04`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
				material = gtr_fretboard_04_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_22fret_heroes_axe
					}
				]
			}
		]
	}
	{
		desc_id = cag_22fret_hero_metal
		frontend_desc = qs(0x3b865ccc)
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard_04`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
				material = gtr_fretboard_04_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_22fret_heroes_metal
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/22_fret_ld29_hero_metal`
						flags = 36
					}
				]
			}
		]
	}
	{
		desc_id = cag_22fret_banjo
		frontend_desc = qs(0xa8ef14e2)
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard_01`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d_01`
				material = gtr_fretboard_01_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_22fret_banjo
						$0x1fe9cf67
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d_01`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/22_fret_ld30_hero_banjo`
						flags = 36
						Color = grey_5guitar
					}
				]
			}
		]
	}
	{
		desc_id = cag_22fret_hero_tiki
		frontend_desc = qs(0x89ed86d5)
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard_03`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d3_01`
				material = gtr_fretboard_03_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_22fret_hero_tiki
						$0x1fe9cf67
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d3_01`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
						flags = 4
						Color = grey_4guitar
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
		desc_id = cag_22fret_daisy01
		frontend_desc = qs(0xa8ef14e2)
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard_01`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d_01`
				material = gtr_fretboard_01_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_22fret_daisy
						$0x1fe9cf67
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d_01`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
						flags = 4
						Color = grey_4guitar
					}
				]
			}
		]
	}
	{
		desc_id = cag_22fret_daisy02
		frontend_desc = qs(0x18203e43)
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard_02`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d2_01`
				material = gtr_fretboard_02_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_22fret_daisy
						$car_rocker_guitars_factoredglobal_48
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d2_01`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
						flags = 4
						Color = black_1guitar
					}
				]
			}
		]
	}
	{
		desc_id = cag_22fret_daisy03
		frontend_desc = qs(0x89ed86d5)
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard_03`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d3_01`
				material = gtr_fretboard_03_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_22fret_daisy
						$0x1fe9cf67
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d3_01`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
						flags = 4
						Color = grey_4guitar
					}
				]
			}
		]
	}
	{
		desc_id = cag_22fret_daisy04
		frontend_desc = qs(0x3b865ccc)
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard_04`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
				material = gtr_fretboard_04_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_22fret_daisy
						$0x1fe9cf67
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
						flags = 4
						Color = grey_4guitar
					}
				]
			}
		]
	}
	{
		desc_id = cag_22fret_prs01
		frontend_desc = qs(0xa8ef14e2)
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard_01`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d_01`
				material = gtr_fretboard_01_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_22fret_prs
						$0x1fe9cf67
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d_01`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/prs/22fret_ld114_prs_dots`
						flags = 4
						Color = grey_4guitar
					}
				]
			}
		]
	}
	{
		desc_id = cag_22fret_prs02
		frontend_desc = qs(0x18203e43)
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard_02`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d2_01`
				material = gtr_fretboard_02_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_22fret_prs
						$car_rocker_guitars_factoredglobal_48
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d2_01`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/prs/22fret_ld114_prs_dots`
						flags = 4
						Color = black_1guitar
					}
				]
			}
		]
	}
	{
		desc_id = cag_22fret_prs03
		frontend_desc = qs(0x89ed86d5)
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard_03`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d3_01`
				material = gtr_fretboard_03_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_22fret_prs
						$0x1fe9cf67
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d3_01`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/prs/22fret_ld114_prs_dots`
						flags = 4
						Color = grey_4guitar
					}
				]
			}
		]
	}
	{
		desc_id = cag_22fret_prs04
		frontend_desc = qs(0x3b865ccc)
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard_04`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
				material = gtr_fretboard_04_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_22fret_prs
						$0x1fe9cf67
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/prs/22fret_ld114_prs_dots`
						flags = 4
						Color = grey_4guitar
					}
				]
			}
		]
	}
	{
		desc_id = cag_22fret_mm01
		frontend_desc = qs(0xa8ef14e2)
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard_01`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d_01`
				material = gtr_fretboard_01_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_22fret_mm
						$0x1fe9cf67
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d_01`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
						flags = 4
						Color = grey_4guitar
					}
				]
			}
		]
	}
	{
		desc_id = cag_22fret_mm02
		frontend_desc = qs(0x18203e43)
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard_02`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d2_01`
				material = gtr_fretboard_02_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_22fret_mm
						$car_rocker_guitars_factoredglobal_48
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d2_01`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
						flags = 4
						Color = black_1guitar
					}
				]
			}
		]
	}
	{
		desc_id = cag_22fret_mm03
		frontend_desc = qs(0x89ed86d5)
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard_03`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d3_01`
				material = gtr_fretboard_03_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_22fret_mm
						$0x1fe9cf67
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d3_01`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
						flags = 4
						Color = grey_4guitar
					}
				]
			}
		]
	}
	{
		desc_id = cag_22fret_mm04
		frontend_desc = qs(0x3b865ccc)
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard_04`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
				material = gtr_fretboard_04_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_22fret_mm
						$0x1fe9cf67
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
						flags = 4
						Color = grey_4guitar
					}
				]
			}
		]
	}
	{
		desc_id = cag_22fret_mcswain01
		frontend_desc = qs(0xa8ef14e2)
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard_01`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d_01`
				material = gtr_fretboard_01_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_22fret_mcswain
						$0x1fe9cf67
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d_01`
				pre_layer = [
					{
						Color = grey_5
						texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
						flags = 36
					}
				]
			}
		]
	}
	{
		desc_id = cag_22fret_mcswain02
		frontend_desc = qs(0x18203e43)
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard_02`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d2_01`
				material = gtr_fretboard_02_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_22fret_mcswain
						$car_rocker_guitars_factoredglobal_48
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d2_01`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
						flags = 4
						Color = black_1guitar
					}
				]
			}
		]
	}
	{
		desc_id = cag_22fret_mcswain03
		frontend_desc = qs(0x89ed86d5)
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard_03`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d3_01`
				material = gtr_fretboard_03_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_22fret_mcswain
						$0x1fe9cf67
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d3_01`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
						flags = 4
						Color = grey_5
					}
				]
			}
		]
	}
	{
		desc_id = cag_22fret_mcswain04
		frontend_desc = qs(0x3b865ccc)
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard_04`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
				material = gtr_fretboard_04_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_22fret_mcswain
						$0x1fe9cf67
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
						flags = 4
						Color = grey_5
					}
				]
			}
		]
	}
	{
		desc_id = cag_22fret_schecter01
		frontend_desc = qs(0xa8ef14e2)
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard_01`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d_01`
				material = gtr_fretboard_01_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_22fret_schecter
						$0x1fe9cf67
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d_01`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
						flags = 4
						Color = grey_4guitar
					}
				]
			}
		]
	}
	{
		desc_id = cag_22fret_schecter02
		frontend_desc = qs(0x18203e43)
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard_02`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d2_01`
				material = gtr_fretboard_02_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_22fret_schecter
						$car_rocker_guitars_factoredglobal_48
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d2_01`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
						flags = 4
						Color = black_1guitar
					}
				]
			}
		]
	}
	{
		desc_id = cag_22fret_schecter03
		frontend_desc = qs(0x89ed86d5)
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard_03`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d3_01`
				material = gtr_fretboard_03_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_22fret_schecter
						$0x1fe9cf67
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d3_01`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
						flags = 4
						Color = grey_4guitar
					}
				]
			}
		]
	}
	{
		desc_id = cag_22fret_schecter04
		frontend_desc = qs(0x3b865ccc)
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard_04`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
				material = gtr_fretboard_04_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_22fret_schecter
						$0x1fe9cf67
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
						flags = 4
						Color = grey_4guitar
					}
				]
			}
		]
	}
	{
		desc_id = cag_22fret_bcrich01
		frontend_desc = qs(0xa8ef14e2)
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard_01`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d_01`
				material = gtr_fretboard_01_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_22fret_bcrich
						$0x1fe9cf67
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d_01`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/22_fret_ld01_hero_dots`
						flags = 4
						Color = grey_4guitar
					}
				]
			}
		]
	}
	{
		desc_id = cag_22fret_bcrich02
		frontend_desc = qs(0x18203e43)
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard_02`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d2_01`
				material = gtr_fretboard_02_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_22fret_bcrich
						$car_rocker_guitars_factoredglobal_48
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d2_01`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/22_fret_ld01_hero_dots`
						flags = 4
						Color = black_1guitar
					}
				]
			}
		]
	}
	{
		desc_id = cag_22fret_bcrich03
		frontend_desc = qs(0x89ed86d5)
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard_03`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d3_01`
				material = gtr_fretboard_03_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_22fret_bcrich
						$0x1fe9cf67
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d3_01`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/22_fret_ld01_hero_dots`
						flags = 4
						Color = grey_4guitar
					}
				]
			}
		]
	}
	{
		desc_id = cag_22fret_bcrich04
		frontend_desc = qs(0x3b865ccc)
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard_04`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
				material = gtr_fretboard_04_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_22fret_bcrich
						$0x1fe9cf67
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/22_fret_ld01_hero_dots`
						flags = 4
						Color = grey_4guitar
					}
				]
			}
		]
	}
	{
		desc_id = cag_22fret_ibanez03
		frontend_desc = qs(0x89ed86d5)
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard_03`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d3_01`
				material = gtr_fretboard_03_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_22fret_ibanez
						$0x1fe9cf67
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d3_01`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
						flags = 4
						Color = grey_4guitar
					}
				]
			}
		]
	}
	{
		desc_id = gtr_fretboard_01
		frontend_desc = qs(0x2bfd4eae)
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard_01`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d_01`
				material = gtr_fretboard_01_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_22fret_fretboard
						$0x1fe9cf67
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d_01`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
						flags = 4
						Color = black_1guitar
					}
				]
			}
		]
	}
	{
		desc_id = gtr_fretboard_02
		frontend_desc = qs(0x01cc0004)
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard_02`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d2_01`
				material = gtr_fretboard_02_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_22fret_fretboard
						$car_rocker_guitars_factoredglobal_48
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d2_01`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
						flags = 4
						Color = black_1guitar
					}
				]
			}
		]
	}
	{
		desc_id = gtr_fretboard_03
		frontend_desc = qs(0x5e9fbd24)
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard_03`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d3_01`
				material = gtr_fretboard_03_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_22fret_fretboard
						$0x1fe9cf67
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d3_01`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
						flags = 4
						Color = grey_4guitar
					}
				]
			}
		]
	}
	{
		desc_id = gtr_fretboard_04
		frontend_desc = qs(0x226a628b)
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard_04`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
				material = gtr_fretboard_04_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_22fret_fretboard
						$0x1fe9cf67
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/22fret_ld86_esp_dots`
						flags = 4
						Color = grey_4guitar
					}
				]
			}
		]
	}
	{
		desc_id = gtr_fretboard_04cash
		frontend_desc = qs(0x226a628b)
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard_04`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
				material = gtr_fretboard_04_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_22fret_cash_fret
						$0x1fe9cf67
					}
				]
			}
		]
	}
	{
		desc_id = cag_24fret_esp01
		frontend_desc = qs(0x21ad5ed2)
		pak_num = 0
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard24_01`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d1_02`
				material = gtr_fretboard24_01_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_24fret_esp
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d1_02`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/24fret_ld01_hero_dots`
						flags = 36
					}
				]
			}
		]
	}
	{
		desc_id = cag_24fret_esp02
		frontend_desc = qs(0xa81d6c13)
		pak_num = 0
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard24_02`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d2_02`
				material = gtr_fretboard24_02_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_24fret_esp
						$car_rocker_guitars_factoredglobal_48
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d2_02`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/24fret_ld01_hero_dots`
						flags = 36
						Color = black_1guitar
					}
				]
			}
		]
	}
	{
		desc_id = cag_24fret_esp03
		frontend_desc = qs(0xc0a291ea)
		pak_num = 0
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard24_03`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d3_02`
				material = gtr_fretboard24_03_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_24fret_esp
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d3_02`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/24fret_ld01_hero_dots`
						flags = 36
					}
				]
			}
		]
	}
	{
		desc_id = cag_24fret_esp04
		frontend_desc = qs(0x8bbb0e9c)
		pak_num = 0
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard24_04`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
				material = gtr_fretboard24_04_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_24fret_esp
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/24fret_ld01_hero_dots`
						flags = 36
					}
				]
			}
		]
	}
	{
		desc_id = cag_24fret_hero01
		frontend_desc = qs(0x21ad5ed2)
		pak_num = 0
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard24_01`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d1_02`
				material = gtr_fretboard24_01_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_24fret_heroes
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d1_02`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/24fret_ld01_hero_dots`
						flags = 36
					}
				]
			}
		]
	}
	{
		desc_id = cag_24fret_hero02
		frontend_desc = qs(0xa81d6c13)
		pak_num = 0
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard24_02`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d2_02`
				material = gtr_fretboard24_02_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_24fret_heroes
						$car_rocker_guitars_factoredglobal_48
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d2_02`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/24fret_ld01_hero_dots`
						flags = 36
						Color = black_1guitar
					}
				]
			}
		]
	}
	{
		desc_id = cag_24fret_hero03
		frontend_desc = qs(0xc0a291ea)
		pak_num = 0
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard24_03`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d3_02`
				material = gtr_fretboard24_03_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_24fret_heroes
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d3_02`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/24fret_ld01_hero_dots`
						flags = 36
					}
				]
			}
		]
	}
	{
		desc_id = cag_24fret_hero04
		frontend_desc = qs(0x8bbb0e9c)
		pak_num = 0
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard24_04`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
				material = gtr_fretboard24_04_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_24fret_heroes
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/24fret_ld01_hero_dots`
						flags = 36
					}
				]
			}
		]
	}
	{
		desc_id = cag_24fret_prs01
		frontend_desc = qs(0x21ad5ed2)
		pak_num = 0
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard24_01`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d1_02`
				material = gtr_fretboard24_01_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_24fret_prs
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d1_02`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/prs/24fret_ld81_prs_dots`
						flags = 36
					}
				]
			}
		]
	}
	{
		desc_id = cag_24fret_prs02
		frontend_desc = qs(0xa81d6c13)
		pak_num = 0
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard24_02`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d2_02`
				material = gtr_fretboard24_02_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_24fret_prs
						$car_rocker_guitars_factoredglobal_48
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d2_02`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/prs/24fret_ld81_prs_dots`
						flags = 36
						Color = black_1guitar
					}
				]
			}
		]
	}
	{
		desc_id = cag_24fret_prs03
		frontend_desc = qs(0xc0a291ea)
		pak_num = 0
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard24_03`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d3_02`
				material = gtr_fretboard24_03_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_24fret_prs
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d3_02`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/prs/24fret_ld81_prs_dots`
						flags = 36
					}
				]
			}
		]
	}
	{
		desc_id = cag_24fret_prs04
		frontend_desc = qs(0x8bbb0e9c)
		pak_num = 0
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard24_04`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
				material = gtr_fretboard24_04_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_24fret_prs
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/prs/24fret_ld81_prs_dots`
						flags = 36
					}
				]
			}
		]
	}
	{
		desc_id = cag_24fret_ibanez01
		frontend_desc = qs(0x21ad5ed2)
		pak_num = 0
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard24_01`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d1_02`
				material = gtr_fretboard24_01_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_24fret_ibanez
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d1_02`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/24fret_ld01_hero_dots`
						flags = 36
					}
				]
			}
		]
	}
	{
		desc_id = cag_24fret_ibanez02
		frontend_desc = qs(0xa81d6c13)
		pak_num = 0
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard24_02`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d2_02`
				material = gtr_fretboard24_02_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_24fret_ibanez
						$car_rocker_guitars_factoredglobal_48
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d2_02`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/24fret_ld01_hero_dots`
						flags = 36
						Color = black_1guitar
					}
				]
			}
		]
	}
	{
		desc_id = cag_24fret_ibanez04
		frontend_desc = qs(0x8bbb0e9c)
		pak_num = 0
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard24_04`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
				material = gtr_fretboard24_04_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_24fret_ibanez
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/24fret_ld01_hero_dots`
						flags = 36
					}
				]
			}
		]
	}
	{
		desc_id = cag_24fret_bcrich01
		frontend_desc = qs(0x21ad5ed2)
		pak_num = 0
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard24_01`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d1_02`
				material = gtr_fretboard24_01_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_24fret_bcrich
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d1_02`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/24fret_ld01_hero_dots`
						flags = 36
					}
				]
			}
		]
	}
	{
		desc_id = cag_24fret_bcrich02
		frontend_desc = qs(0xa81d6c13)
		pak_num = 0
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard24_02`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d2_02`
				material = gtr_fretboard24_02_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_24fret_bcrich
						$car_rocker_guitars_factoredglobal_48
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d2_02`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/24fret_ld01_hero_dots`
						flags = 36
						Color = black_1guitar
					}
				]
			}
		]
	}
	{
		desc_id = cag_24fret_bcrich03
		frontend_desc = qs(0xc0a291ea)
		pak_num = 0
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard24_03`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d3_02`
				material = gtr_fretboard24_03_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_24fret_bcrich
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d3_02`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/24fret_ld01_hero_dots`
						flags = 36
					}
				]
			}
		]
	}
	{
		desc_id = cag_24fret_bcrich04
		frontend_desc = qs(0x8bbb0e9c)
		pak_num = 0
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard24_04`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
				material = gtr_fretboard24_04_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_24fret_bcrich
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/24fret_ld01_hero_dots`
						flags = 36
					}
				]
			}
		]
	}
	{
		desc_id = cag_24fret_mcswain01
		frontend_desc = qs(0x21ad5ed2)
		pak_num = 0
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard24_01`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d1_02`
				material = gtr_fretboard24_01_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_24fret_mcswain
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d1_02`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/24fret_ld01_hero_dots`
						flags = 36
						Color = grey_5guitar
					}
				]
			}
		]
	}
	{
		desc_id = cag_24fret_mcswain02
		frontend_desc = qs(0xa81d6c13)
		pak_num = 0
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard24_02`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d2_02`
				material = gtr_fretboard24_02_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_24fret_mcswain
						$car_rocker_guitars_factoredglobal_48
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d2_02`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/24fret_ld01_hero_dots`
						flags = 36
						Color = black_1guitar
					}
				]
			}
		]
	}
	{
		desc_id = cag_24fret_mcswain03
		frontend_desc = qs(0xc0a291ea)
		pak_num = 0
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard24_03`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d3_02`
				material = gtr_fretboard24_03_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_24fret_mcswain
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d3_02`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/24fret_ld01_hero_dots`
						flags = 36
						Color = grey_5guitar
					}
				]
			}
		]
	}
	{
		desc_id = cag_24fret_mcswain04
		frontend_desc = qs(0x8bbb0e9c)
		pak_num = 0
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard24_04`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
				material = gtr_fretboard24_04_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_24fret_mcswain
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/24fret_ld01_hero_dots`
						flags = 36
						Color = grey_5guitar
					}
				]
			}
		]
	}
	{
		desc_id = cag_24fret_schecter01
		frontend_desc = qs(0x21ad5ed2)
		pak_num = 0
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard24_01`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d1_02`
				material = gtr_fretboard24_01_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_24fret_schecter
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d1_02`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/24fret_ld01_hero_dots`
						flags = 36
					}
				]
			}
		]
	}
	{
		desc_id = cag_24fret_schecter02
		frontend_desc = qs(0xa81d6c13)
		pak_num = 0
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard24_02`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d2_02`
				material = gtr_fretboard24_02_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_24fret_schecter
						$car_rocker_guitars_factoredglobal_48
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d2_02`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/24fret_ld01_hero_dots`
						flags = 36
						Color = black_1guitar
					}
				]
			}
		]
	}
	{
		desc_id = cag_24fret_schecter03
		frontend_desc = qs(0xc0a291ea)
		pak_num = 0
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard24_03`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d3_02`
				material = gtr_fretboard24_03_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_24fret_schecter
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d3_02`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/24fret_ld01_hero_dots`
						flags = 36
					}
				]
			}
		]
	}
	{
		desc_id = cag_24fret_schecter04
		frontend_desc = qs(0x8bbb0e9c)
		pak_num = 0
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard24_04`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
				material = gtr_fretboard24_04_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_24fret_schecter
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/24fret_ld01_hero_dots`
						flags = 36
					}
				]
			}
		]
	}
	{
		desc_id = cag_24fret_mm01
		frontend_desc = qs(0x21ad5ed2)
		pak_num = 0
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard24_01`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d1_02`
				material = gtr_fretboard24_01_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_24fret_mm
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d1_02`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/24fret_ld01_hero_dots`
						flags = 36
					}
				]
			}
		]
	}
	{
		desc_id = cag_24fret_mm02
		frontend_desc = qs(0xa81d6c13)
		pak_num = 0
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard24_02`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d2_02`
				material = gtr_fretboard24_02_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_24fret_mm
						$car_rocker_guitars_factoredglobal_48
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d2_02`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/24fret_ld01_hero_dots`
						flags = 36
						Color = black_1guitar
					}
				]
			}
		]
	}
	{
		desc_id = cag_24fret_mm03
		frontend_desc = qs(0xc0a291ea)
		pak_num = 0
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard24_03`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d3_02`
				material = gtr_fretboard24_03_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_24fret_mm
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d3_02`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/24fret_ld01_hero_dots`
						flags = 36
					}
				]
			}
		]
	}
	{
		desc_id = cag_24fret_mm04
		frontend_desc = qs(0x8bbb0e9c)
		pak_num = 0
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard24_04`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
				material = gtr_fretboard24_04_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_24fret_mm
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/24fret_ld01_hero_dots`
						flags = 36
					}
				]
			}
		]
	}
	{
		desc_id = cag_24fret_daisy01
		frontend_desc = qs(0x21ad5ed2)
		pak_num = 0
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard24_01`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d1_02`
				material = gtr_fretboard24_01_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_24fret_daisy
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d1_02`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/24fret_ld01_hero_dots`
						flags = 36
					}
				]
			}
		]
	}
	{
		desc_id = cag_24fret_daisy02
		frontend_desc = qs(0xa81d6c13)
		pak_num = 0
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard24_02`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d2_02`
				material = gtr_fretboard24_02_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_24fret_daisy
						$car_rocker_guitars_factoredglobal_48
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d2_02`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/24fret_ld01_hero_dots`
						flags = 36
						Color = black_1guitar
					}
				]
			}
		]
	}
	{
		desc_id = cag_24fret_daisy03
		frontend_desc = qs(0xc0a291ea)
		pak_num = 0
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard24_03`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d3_02`
				material = gtr_fretboard24_03_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_24fret_daisy
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d3_02`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/24fret_ld01_hero_dots`
						flags = 36
					}
				]
			}
		]
	}
	{
		desc_id = cag_24fret_daisy04
		frontend_desc = qs(0x8bbb0e9c)
		pak_num = 0
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard24_04`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
				material = gtr_fretboard24_04_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_24fret_daisy
					}
				]
			}
		]
		default_cap = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cag/gh5/24fret_ld01_hero_dots`
						flags = 36
					}
				]
			}
		]
	}
	{
		desc_id = gtr_fretboard_66
		frontend_desc = qs(0xb31e742d)
		mesh = `models/car_instruments/guitar/esp/gtr_fretboard_66`
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_66_d`
				material = gtr_fretboard_66_primary
				preset_layers = [
					{
						$preset_layer_inlays
						mask = $cag_fboard66
					}
				]
			}
		]
	}
]
cas_guitar_head = [
	{
		desc_id = gtr4_neckhead_01
		frontend_desc = qs(0x6de4a5a9)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr4_neckhead_01`
		materials = [
			gtr4_neckhead_01_hardware
		]
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr4_neckhead_d_01`
				material = gtr4_neckhead_01_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr4_neckhead
					}
					{
						$preset_layer_fades
						mask = $gtr4_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr4_neckhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_49
			}
		]
	}
	{
		desc_id = gtr4_neckhead_02
		frontend_desc = qs(0x9e56fccb)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr4_neckhead_02`
		pak_num = 0
		materials = [
			gtr4_neckhead_02_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr9_neckhead_d_01`
				material = gtr4_neckhead_02_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr9_neckhead
					}
					{
						$preset_layer_fades
						mask = $gtr9_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr9_neckhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_49
			}
		]
	}
	{
		desc_id = gtr4_neckhead_03
		frontend_desc = qs(0x866cea3f)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr4_neckhead_03`
		pak_num = 0
		materials = [
			gtr4_neckhead_03_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr4_neckhead_d_03`
				material = gtr4_neckhead_03_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr4_neckhead_03
					}
					{
						$preset_layer_fades
						mask = $gtr4_neckhead_03_fades
					}
					{
						$preset_layer_details
						mask = $gtr4_neckhead_03_details
					}
				]
				$car_rocker_guitars_factoredglobal_49
			}
		]
	}
	{
		desc_id = gtr4_neckhead_04
		frontend_desc = qs(0xab224c92)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr4_neckhead_04`
		pak_num = 0
		materials = [
			gtr4_neckhead_04_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr60_d_neckhead`
				material = gtr4_neckhead_04_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr60_neckhead
					}
					{
						$preset_layer_fades
						mask = $gtr60_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr60_neckhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_50
			}
		]
	}
	{
		desc_id = gtr4_neckhead_05
		frontend_desc = qs(0x5782ad70)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr4_neckhead_05`
		pak_num = 0
		materials = [
			gtr4_neckhead_05_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr64_neckhead_d`
				material = gtr4_neckhead_05_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr64_neckhead
					}
					{
						$preset_layer_fades
						mask = $gtr64_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr64_neckhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_51
			}
		]
	}
	{
		desc_id = gtr4_neckhead_06
		frontend_desc = qs(0xf7d0eb1c)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr4_neckhead_06`
		pak_num = 0
		materials = [
			gtr4_neckhead_06_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr4_neckhead_d_06`
				material = gtr4_neckhead_06_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr4_neckhead_06
					}
					{
						$preset_layer_fades
						mask = $gtr4_neckhead_06_fades
					}
					{
						$preset_layer_details
						mask = $gtr4_neckhead_06_details
					}
				]
				$car_rocker_guitars_factoredglobal_50
			}
		]
	}
	{
		desc_id = gtr4_neckhead_07
		frontend_desc = qs(0xb11049e5)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr4_neckhead_07`
		pak_num = 0
		materials = [
			gtr4_neckhead_07_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr4_neckhead_d_07`
				material = gtr4_neckhead_07_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr4_neckhead_07
					}
					{
						$preset_layer_fades
						mask = $gtr4_neckhead_07_fades
					}
					{
						$preset_layer_details
						mask = $gtr4_neckhead_07_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr9_neckhead_01
		frontend_desc = qs(0xb104e40c)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr9_neckhead_01`
		pak_num = 0
		materials = [
			gtr9_neckhead_01_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr9_neckhead_d_01`
				material = gtr9_neckhead_01_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr9_neckhead
					}
					{
						$preset_layer_fades
						mask = $gtr9_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr9_neckhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_49
			}
		]
	}
	{
		desc_id = gtr9_neckhead_02
		frontend_desc = qs(0x6de4a5a9)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr9_neckhead_02`
		pak_num = 0
		materials = [
			gtr4_neckhead_01_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr4_neckhead_d_01`
				material = gtr4_neckhead_01_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr4_neckhead
					}
					{
						$preset_layer_fades
						mask = $gtr4_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr4_neckhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_49
			}
		]
	}
	{
		desc_id = gtr9_neckhead_03
		frontend_desc = qs(0x866cea3f)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr9_neckhead_03`
		pak_num = 0
		materials = [
			gtr4_neckhead_03_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr4_neckhead_d_03`
				material = gtr4_neckhead_03_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr4_neckhead_03
					}
					{
						$preset_layer_fades
						mask = $gtr4_neckhead_03_fades
					}
					{
						$preset_layer_details
						mask = $gtr4_neckhead_03_details
					}
				]
				$car_rocker_guitars_factoredglobal_49
			}
		]
	}
	{
		desc_id = gtr9_neckhead_04
		frontend_desc = qs(0xab224c92)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr9_neckhead_04`
		pak_num = 0
		materials = [
			gtr4_neckhead_04_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr60_d_neckhead`
				material = gtr4_neckhead_04_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr60_neckhead
					}
					{
						$preset_layer_fades
						mask = $gtr60_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr60_neckhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_50
			}
		]
	}
	{
		desc_id = gtr9_neckhead_05
		frontend_desc = qs(0x5782ad70)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr9_neckhead_05`
		pak_num = 0
		materials = [
			gtr4_neckhead_05_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr64_neckhead_d`
				material = gtr4_neckhead_05_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr64_neckhead
					}
					{
						$preset_layer_fades
						mask = $gtr64_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr64_neckhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_51
			}
		]
	}
	{
		desc_id = gtr9_neckhead_06
		frontend_desc = qs(0xf7d0eb1c)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr9_neckhead_06`
		pak_num = 0
		materials = [
			gtr4_neckhead_06_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr4_neckhead_d_06`
				material = gtr4_neckhead_06_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr4_neckhead_06
					}
					{
						$preset_layer_fades
						mask = $gtr4_neckhead_06_fades
					}
					{
						$preset_layer_details
						mask = $gtr4_neckhead_06_details
					}
				]
				$car_rocker_guitars_factoredglobal_50
			}
		]
	}
	{
		desc_id = gtr9_neckhead_07
		frontend_desc = qs(0xb11049e5)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr9_neckhead_07`
		pak_num = 0
		materials = [
			gtr4_neckhead_07_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr4_neckhead_d_07`
				material = gtr4_neckhead_07_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr4_neckhead_07
					}
					{
						$preset_layer_fades
						mask = $gtr4_neckhead_07_fades
					}
					{
						$preset_layer_details
						mask = $gtr4_neckhead_07_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr12_neckhead_01
		frontend_desc = qs(0x6de4a5a9)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr12_neckhead_01`
		pak_num = 0
		materials = [
			gtr12_neckhead_01_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr4_neckhead_d_01`
				material = gtr12_neckhead_01_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr4_neckhead
					}
					{
						$preset_layer_fades
						mask = $gtr4_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr4_neckhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_49
			}
		]
	}
	{
		desc_id = gtr12_neckhead_02
		frontend_desc = qs(0xb104e40c)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr12_neckhead_02`
		pak_num = 0
		materials = [
			gtr12_neckhead_02_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr9_neckhead_d_01`
				material = gtr12_neckhead_02_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr9_neckhead
					}
					{
						$preset_layer_fades
						mask = $gtr9_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr9_neckhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_49
			}
		]
	}
	{
		desc_id = gtr12_neckhead_03
		frontend_desc = qs(0x866cea3f)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr12_neckhead_03`
		pak_num = 0
		materials = [
			gtr12_neckhead_03_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr4_neckhead_d_03`
				material = gtr12_neckhead_03_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr4_neckhead_03
					}
					{
						$preset_layer_fades
						mask = $gtr4_neckhead_03_fades
					}
					{
						$preset_layer_details
						mask = $gtr4_neckhead_03_details
					}
				]
				$car_rocker_guitars_factoredglobal_49
			}
		]
	}
	{
		desc_id = gtr12_neckhead_04
		frontend_desc = qs(0xab224c92)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr12_neckhead_04`
		pak_num = 0
		materials = [
			gtr12_neckhead_04_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr60_d_neckhead`
				material = gtr12_neckhead_04_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr60_neckhead
					}
					{
						$preset_layer_fades
						mask = $gtr60_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr60_neckhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_50
			}
		]
	}
	{
		desc_id = gtr12_neckhead_05
		frontend_desc = qs(0x5782ad70)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr12_neckhead_05`
		pak_num = 0
		materials = [
			gtr12_neckhead_05_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr64_neckhead_d`
				material = gtr12_neckhead_05_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr64_neckhead
					}
					{
						$preset_layer_fades
						mask = $gtr64_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr64_neckhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_51
			}
		]
	}
	{
		desc_id = gtr12_neckhead_06
		frontend_desc = qs(0xf7d0eb1c)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr12_neckhead_06`
		pak_num = 0
		materials = [
			gtr12_neckhead_06_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr4_neckhead_d_06`
				material = gtr12_neckhead_06_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr4_neckhead_06
					}
					{
						$preset_layer_fades
						mask = $gtr4_neckhead_06_fades
					}
					{
						$preset_layer_details
						mask = $gtr4_neckhead_06_details
					}
				]
				$car_rocker_guitars_factoredglobal_50
			}
		]
	}
	{
		desc_id = gtr12_neckhead_07
		frontend_desc = qs(0xb11049e5)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr12_neckhead_07`
		pak_num = 0
		materials = [
			gtr12_neckhead_07_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr4_neckhead_d_07`
				material = gtr12_neckhead_07_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr4_neckhead_07
					}
					{
						$preset_layer_fades
						mask = $gtr4_neckhead_07_fades
					}
					{
						$preset_layer_details
						mask = $gtr4_neckhead_07_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr30_nekhed_a
		frontend_desc = qs(0xa11eb675)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr30_nekhed_a`
		pak_num = 0
		materials = [
			gtr30_nekhead_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr30_nekhead_h_d`
				material = gtr30_nekhead_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr30_neckhead
					}
					{
						$preset_layer_fades
						mask = $gtr30_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr30_neckhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_53
			}
		]
	}
	{
		desc_id = gtr30_nekhed_b
		frontend_desc = qs(0x8a33e5b6)
		sponsor_id = esp
		pak_num = 0
		mesh = `models/car_instruments/guitar/esp/gtr31c_neckhead`
		materials = [
			gtr31c_neckhead_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr31_neckhead`
				material = gtr31c_neckhead_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr31_nhead
					}
					{
						$preset_layer_fades
						mask = $gtr31_nhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr31_nhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_49
			}
		]
	}
	{
		desc_id = gtr30_nekhed_c
		frontend_desc = qs(0x1a978a31)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr30_nekhed_c`
		pak_num = 0
		materials = [
			gtr36_nhead_sprv_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr36_nekhed`
				material = gtr36_nhead_sprv_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr36_nekhead
					}
					{
						$preset_layer_fades
						mask = $gtr36_nekhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr36_nekhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_54
			}
		]
	}
	{
		desc_id = gtr30_nekhed_d
		frontend_desc = qs(0xb11049e5)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr30_nekhed_d`
		pak_num = 0
		materials = [
			gtr32_nhed_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr32_nekhed`
				material = gtr32_nhed_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr32_nekhead
					}
					{
						$preset_layer_fades
						mask = $gtr32_nekhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr32_nekhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr30_nekhed_e
		frontend_desc = qs(0xf7d0eb1c)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr30_nekhed_e`
		pak_num = 0
		materials = [
			gtr33d_neckhead_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr33d_nekhed`
				material = gtr33d_neckhead_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr33_nhead
					}
					{
						$preset_layer_fades
						mask = $gtr33_nhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr33_nhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_50
			}
		]
	}
	{
		desc_id = gtr30_nekhed_f
		frontend_desc = qs(0x743000b2)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr30_nekhed_f`
		pak_num = 0
		materials = [
			gtr37_nhead_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr37_nekhed`
				material = gtr37_nhead_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr37_nhead
					}
					{
						$preset_layer_fades
						mask = $gtr37_nhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr37_nhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_55
			}
		]
	}
	{
		desc_id = gtr31c_neckhead
		frontend_desc = qs(0x8a33e5b6)
		sponsor_id = esp
		pak_num = 0
		mesh = `models/car_instruments/guitar/esp/gtr31c_neckhead`
		materials = [
			gtr31c_neckhead_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr31_neckhead`
				material = gtr31c_neckhead_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr31_nhead
					}
					{
						$preset_layer_fades
						mask = $gtr31_nhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr31_nhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_49
			}
		]
	}
	{
		desc_id = gtr31c_neckhead03
		frontend_desc = qs(0x1a978a31)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr31c_neckhead03`
		pak_num = 0
		materials = [
			gtr36_nhead_sprv_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr36_nekhed`
				material = gtr36_nhead_sprv_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr36_nekhead
					}
					{
						$preset_layer_fades
						mask = $gtr36_nekhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr36_nekhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_54
			}
		]
	}
	{
		desc_id = gtr31c_neckhead06
		frontend_desc = qs(0x743000b2)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr31c_neckhead06`
		pak_num = 0
		materials = [
			gtr37_nhead_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr37_nekhed`
				material = gtr37_nhead_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr37_nhead
					}
					{
						$preset_layer_fades
						mask = $gtr37_nhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr37_nhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_55
			}
		]
	}
	{
		desc_id = gtr31c_neckhead04
		frontend_desc = qs(0xf7d0eb1c)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr31c_neckhead04`
		pak_num = 0
		materials = [
			gtr33d_neckhead_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr33d_nekhed`
				material = gtr33d_neckhead_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr33_nhead
					}
					{
						$preset_layer_fades
						mask = $gtr33_nhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr33_nhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_50
			}
		]
	}
	{
		desc_id = gtr31c_neckhead05
		frontend_desc = qs(0xb11049e5)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr31c_neckhead05`
		pak_num = 0
		materials = [
			gtr32_nhed_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr32_nekhed`
				material = gtr32_nhed_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr32_nekhead
					}
					{
						$preset_layer_fades
						mask = $gtr32_nekhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr32_nekhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr31c_neckhead02
		frontend_desc = qs(0xa11eb675)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr31c_neckhead02`
		pak_num = 0
		materials = [
			gtr30_nekhead_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr30_nekhead_h_d`
				material = gtr30_nekhead_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr30_neckhead
					}
					{
						$preset_layer_fades
						mask = $gtr30_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr30_neckhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_53
			}
		]
	}
	{
		desc_id = gtr32_nekhead01
		frontend_desc = qs(0xb11049e5)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr32_nekhead01`
		pak_num = 0
		materials = [
			gtr32_nhed_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr32_nekhed`
				material = gtr32_nhed_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr32_nekhead
					}
					{
						$preset_layer_fades
						mask = $gtr32_nekhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr32_nekhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr32_neckhead_f
		frontend_desc = qs(0x1a978a31)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr32_neckhead_f`
		pak_num = 0
		materials = [
			gtr36_nhead_sprv_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr36_nekhed`
				material = gtr36_nhead_sprv_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr36_nekhead
					}
					{
						$preset_layer_fades
						mask = $gtr36_nekhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr36_nekhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_54
			}
		]
	}
	{
		desc_id = gtr32_neckhead_c
		frontend_desc = qs(0x743000b2)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr32_neckhead_c`
		pak_num = 0
		materials = [
			gtr37_nhead_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr37_nekhed`
				material = gtr37_nhead_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr37_nhead
					}
					{
						$preset_layer_fades
						mask = $gtr37_nhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr37_nhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_55
			}
		]
	}
	{
		desc_id = gtr32_neckhead_b
		frontend_desc = qs(0xf7d0eb1c)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr32_neckhead_b`
		pak_num = 0
		materials = [
			gtr33d_neckhead_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr33d_nekhed`
				material = gtr33d_neckhead_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr33_nhead
					}
					{
						$preset_layer_fades
						mask = $gtr33_nhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr33_nhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_50
			}
		]
	}
	{
		desc_id = gtr32_neckhead_e
		frontend_desc = qs(0x8a33e5b6)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr32_neckhead_e`
		pak_num = 0
		materials = [
			gtr31c_neckhead_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr31_neckhead`
				material = gtr31c_neckhead_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr31_nhead
					}
					{
						$preset_layer_fades
						mask = $gtr31_nhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr31_nhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_49
			}
		]
	}
	{
		desc_id = gtr32_neckhead_d
		frontend_desc = qs(0xa11eb675)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr32_neckhead_d`
		pak_num = 0
		materials = [
			gtr30_nekhead_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr30_nekhead_h_d`
				material = gtr30_nekhead_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr30_neckhead
					}
					{
						$preset_layer_fades
						mask = $gtr30_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr30_neckhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_53
			}
		]
	}
	{
		desc_id = gtr33d_nekhed
		frontend_desc = qs(0xf7d0eb1c)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr33d_nekhed`
		pak_num = 0
		materials = [
			gtr33d_neckhead_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr33d_nekhed`
				material = gtr33d_neckhead_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr33_nhead
					}
					{
						$preset_layer_fades
						mask = $gtr33_nhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr33_nhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_50
			}
		]
	}
	{
		desc_id = gtr33d_nekhed_b
		frontend_desc = qs(0xb11049e5)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr33d_nekhed_b`
		pak_num = 0
		materials = [
			gtr32_nhed_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr32_nekhed`
				material = gtr32_nhed_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr32_nekhead
					}
					{
						$preset_layer_fades
						mask = $gtr32_nekhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr32_nekhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr33d_neckhead_d
		frontend_desc = qs(0x743000b2)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr33d_nekhead_d`
		pak_num = 0
		materials = [
			gtr37_nhead_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr37_nekhed`
				material = gtr37_nhead_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr37_nhead
					}
					{
						$preset_layer_fades
						mask = $gtr37_nhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr37_nhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_55
			}
		]
	}
	{
		desc_id = gtr33d_nekhed_c
		frontend_desc = qs(0x1a978a31)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr33d_nekhed_c`
		pak_num = 0
		materials = [
			gtr36_nhead_sprv_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr36_nekhed`
				material = gtr36_nhead_sprv_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr36_nekhead
					}
					{
						$preset_layer_fades
						mask = $gtr36_nekhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr36_nekhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_54
			}
		]
	}
	{
		desc_id = gtr33d_nekhed_e
		frontend_desc = qs(0x8a33e5b6)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr33d_nekhed_e`
		pak_num = 0
		materials = [
			gtr30_nekhead_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr30_nekhead_h_d`
				material = gtr30_nekhead_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr30_neckhead
					}
					{
						$preset_layer_fades
						mask = $gtr30_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr30_neckhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_53
			}
		]
	}
	{
		desc_id = gtr33d_nekhed_f
		frontend_desc = qs(0xa11eb675)
		sponsor_id = esp
		pak_num = 0
		mesh = `models/car_instruments/guitar/esp/gtr33d_nekhed_f`
		materials = [
			gtr31c_neckhead_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr31_neckhead`
				material = gtr31c_neckhead_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr31_nhead
					}
					{
						$preset_layer_fades
						mask = $gtr31_nhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr31_nhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_49
			}
		]
	}
	{
		desc_id = gtr36_nekhed
		frontend_desc = qs(0x1a978a31)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr36_nekhed`
		pak_num = 0
		materials = [
			gtr36_nhead_sprv_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr36_nekhed`
				material = gtr36_nhead_sprv_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr36_nekhead
					}
					{
						$preset_layer_fades
						mask = $gtr36_nekhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr36_nekhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_54
			}
		]
	}
	{
		desc_id = gtr36_nekhed_b
		frontend_desc = qs(0x743000b2)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr36_nekhed_b`
		pak_num = 0
		materials = [
			gtr37_nhead_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr37_nekhed`
				material = gtr37_nhead_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr37_nhead
					}
					{
						$preset_layer_fades
						mask = $gtr37_nhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr37_nhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_55
			}
		]
	}
	{
		desc_id = gtr36_nekhed_e
		frontend_desc = qs(0xb11049e5)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr36_nekhed_e`
		pak_num = 0
		materials = [
			gtr32_nhed_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr32_nekhed`
				material = gtr32_nhed_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr32_nekhead
					}
					{
						$preset_layer_fades
						mask = $gtr32_nekhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr32_nekhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr36_nekhed_f
		frontend_desc = qs(0xf7d0eb1c)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr36_nekhed_f`
		pak_num = 0
		materials = [
			gtr33d_neckhead_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr33d_nekhed`
				material = gtr33d_neckhead_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr33_nhead
					}
					{
						$preset_layer_fades
						mask = $gtr33_nhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr33_nhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_50
			}
		]
	}
	{
		desc_id = gtr36_nekhed_c
		frontend_desc = qs(0x8a33e5b6)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr36_nekhed_c`
		pak_num = 0
		materials = [
			gtr31c_neckhead_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr31_neckhead`
				material = gtr31c_neckhead_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr31_nhead
					}
					{
						$preset_layer_fades
						mask = $gtr31_nhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr31_nhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_49
			}
		]
	}
	{
		desc_id = gtr36_nekhed_d
		frontend_desc = qs(0xa11eb675)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr36_nekhed_d`
		pak_num = 0
		materials = [
			gtr30_nekhead_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr30_nekhead_h_d`
				material = gtr30_nekhead_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr30_neckhead
					}
					{
						$preset_layer_fades
						mask = $gtr30_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr30_neckhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_53
			}
		]
	}
	{
		desc_id = gtr37_neckhead
		frontend_desc = qs(0x743000b2)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr37_neckhead`
		pak_num = 0
		materials = [
			gtr37_nhead_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr37_nekhed`
				material = gtr37_nhead_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr37_nhead
					}
					{
						$preset_layer_fades
						mask = $gtr37_nhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr37_nhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_55
			}
		]
	}
	{
		desc_id = gtr37_neckhead_b
		frontend_desc = qs(0x1a978a31)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr37_neckhead02`
		pak_num = 0
		materials = [
			gtr36_nhead_sprv_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr36_nekhed`
				material = gtr36_nhead_sprv_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr36_nekhead
					}
					{
						$preset_layer_fades
						mask = $gtr36_nekhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr36_nekhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_54
			}
		]
	}
	{
		desc_id = gtr37_neckhead_c
		frontend_desc = qs(0xb11049e5)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr37_neckhead03`
		pak_num = 0
		materials = [
			gtr32_nhed_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr32_nekhed`
				material = gtr32_nhed_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr32_nekhead
					}
					{
						$preset_layer_fades
						mask = $gtr32_nekhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr32_nekhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr37_neckhead_d
		frontend_desc = qs(0xf7d0eb1c)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr37_neckhead04`
		pak_num = 0
		materials = [
			gtr33d_neckhead_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr33d_nekhed`
				material = gtr33d_neckhead_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr33_nhead
					}
					{
						$preset_layer_fades
						mask = $gtr33_nhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr33_nhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_50
			}
		]
	}
	{
		desc_id = gtr37_neckhead_e
		frontend_desc = qs(0x8a33e5b6)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr37_neckhead05`
		pak_num = 0
		materials = [
			gtr31c_neckhead_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr31_neckhead`
				material = gtr31c_neckhead_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr31_nhead
					}
					{
						$preset_layer_fades
						mask = $gtr31_nhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr31_nhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_49
			}
		]
	}
	{
		desc_id = gtr37_neckhead_f
		frontend_desc = qs(0xa11eb675)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr37_neckhead06`
		pak_num = 0
		materials = [
			gtr30_nekhead_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr30_nekhead_h_d`
				material = gtr30_nekhead_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr30_neckhead
					}
					{
						$preset_layer_fades
						mask = $gtr30_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr30_neckhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_53
			}
		]
	}
	{
		desc_id = gtr38_neckhead
		frontend_desc = qs(0xa8d797da)
		mesh = `models/car_instruments/guitar/esp/gtr38_neckhead`
		pak_num = 0
		materials = [
			gtr38_nhead_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr38_nekhed`
				material = gtr38_nhead_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr38_nhead
					}
					{
						$preset_layer_fades
						mask = $gtr38_nhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr38_nhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_56
			}
		]
	}
	{
		desc_id = gtr39_esp_nv_nhead
		frontend_desc = qs(0x35449e93)
		mesh = `models/car_instruments/guitar/esp/gtr39_esp_nv_nhead`
		pak_num = 0
		materials = [
			gtr39_nhed_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr39_nekhed`
				material = gtr39_nhed_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr39_nhead
					}
					{
						$preset_layer_fades
						mask = $gtr39_nhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr39_nhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_56
			}
		]
	}
	{
		desc_id = gtr40_esp_px_nhead01
		frontend_desc = qs(0x224826a9)
		mesh = `models/car_instruments/guitar/esp/gtr40_esp_px_nhead01`
		pak_num = 0
		materials = [
			gtr40_nhead_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr40_nhead`
				material = gtr40_nhead_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr40_nhead
					}
					{
						$preset_layer_fades
						mask = $gtr40_nhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr40_nhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_56
			}
		]
	}
	{
		desc_id = gtr60_neckhead
		frontend_desc = qs(0xab224c92)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr60_neckhead`
		pak_num = 0
		materials = [
			gtr60_neckhead_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr60_d_neckhead`
				material = gtr60_neckhead_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr60_neckhead
					}
					{
						$preset_layer_fades
						mask = $gtr60_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr60_neckhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_50
			}
		]
	}
	{
		desc_id = gtr60_neckhead2
		frontend_desc = qs(0x5782ad70)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr60_neckhead2`
		pak_num = 0
		materials = [
			gtr60_neckhead2_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr60_neckhead2_d`
				material = gtr60_neckhead2_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr60_neckhead2
					}
					{
						$preset_layer_fades
						mask = $gtr60_neckhead2_fades
					}
					{
						$preset_layer_details
						mask = $gtr60_neckhead2_details
					}
				]
				$car_rocker_guitars_factoredglobal_51
			}
		]
	}
	{
		desc_id = gtr60_neckhead3
		frontend_desc = qs(0xb11049e5)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr60_neckhead3`
		pak_num = 0
		materials = [
			gtr60_neckhead3_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr62_d_neckhead`
				material = gtr60_neckhead3_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr62_neckhead
					}
					{
						$preset_layer_fades
						mask = $gtr62_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr62_neckhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr60_neckhead_04
		frontend_desc = qs(0x6de4a5a9)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr60_neckhead_04`
		pak_num = 0
		materials = [
			gtr60_neckhead_04_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr4_neckhead_d_01`
				material = gtr60_neckhead_04_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr4_neckhead
					}
					{
						$preset_layer_fades
						mask = $gtr4_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr4_neckhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_49
			}
		]
	}
	{
		desc_id = gtr60_neckhead_05
		frontend_desc = qs(0xb104e40c)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr60_neckhead_05`
		pak_num = 0
		materials = [
			gtr60_neckhead_05_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr9_neckhead_d_01`
				material = gtr60_neckhead_05_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr9_neckhead
					}
					{
						$preset_layer_fades
						mask = $gtr9_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr9_neckhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_49
			}
		]
	}
	{
		desc_id = gtr62_neckhead
		frontend_desc = qs(0xb11049e5)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr62_neckhead`
		pak_num = 0
		materials = [
			gtr62_neckhead_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr62_d_neckhead`
				material = gtr62_neckhead_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr62_neckhead
					}
					{
						$preset_layer_fades
						mask = $gtr62_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr62_neckhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr62_neckhead2
		frontend_desc = qs(0x5782ad70)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr62_neckhead2`
		pak_num = 0
		materials = [
			gtr62_neckhead2_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr64_neckhead_d`
				material = gtr62_neckhead2_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr64_neckhead
					}
					{
						$preset_layer_fades
						mask = $gtr64_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr64_neckhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_51
			}
		]
	}
	{
		desc_id = gtr62_neckhead3
		frontend_desc = qs(0xab224c92)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr62_neckhead3`
		pak_num = 0
		materials = [
			gtr62_neckhead3_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr60_d_neckhead`
				material = gtr62_neckhead3_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr60_neckhead
					}
					{
						$preset_layer_fades
						mask = $gtr60_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr60_neckhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_50
			}
		]
	}
	{
		desc_id = gtr62_neckhead_04
		frontend_desc = qs(0x6de4a5a9)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr62_neckhead_04`
		pak_num = 0
		materials = [
			gtr62_neckhead_04_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr4_neckhead_d_01`
				material = gtr62_neckhead_04_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr4_neckhead
					}
					{
						$preset_layer_fades
						mask = $gtr4_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr4_neckhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_49
			}
		]
	}
	{
		desc_id = gtr62_neckhead_05
		frontend_desc = qs(0xb104e40c)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr62_neckhead_05`
		pak_num = 0
		materials = [
			gtr62_neckhead_05_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr9_neckhead_d_01`
				material = gtr62_neckhead_05_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr9_neckhead
					}
					{
						$preset_layer_fades
						mask = $gtr9_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr9_neckhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_49
			}
		]
	}
	{
		desc_id = gtr62_neckhead_06
		frontend_desc = qs(0x866cea3f)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr62_neckhead_06`
		pak_num = 0
		materials = [
			gtr62_neckhead_06_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr4_neckhead_d_03`
				material = gtr62_neckhead_06_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr4_neckhead_03
					}
					{
						$preset_layer_fades
						mask = $gtr4_neckhead_03_fades
					}
					{
						$preset_layer_details
						mask = $gtr4_neckhead_03_details
					}
				]
				$car_rocker_guitars_factoredglobal_49
			}
		]
	}
	{
		desc_id = gtr63_neckhead
		frontend_desc = qs(0x6c06bacd)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr63_neckhead`
		pak_num = 0
		materials = [
			gtr63_neckhead_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr63_neckhead_d`
				material = gtr63_neckhead_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr63_neckhead
					}
				]
			}
		]
	}
	{
		desc_id = gtr63_neckhead2
		frontend_desc = qs(0xab224c92)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr63_neckhead2`
		materials = [
			gtr63_neckhead2_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr60_d_neckhead`
				material = gtr63_neckhead2_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr60_neckhead
					}
					{
						$preset_layer_fades
						mask = $gtr60_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr60_neckhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_50
			}
		]
	}
	{
		desc_id = gtr63_neckhead3
		frontend_desc = qs(0x5782ad70)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr63_neckhead3`
		pak_num = 0
		materials = [
			gtr63_neckhead3_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr64_neckhead_d`
				material = gtr63_neckhead3_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr64_neckhead
					}
					{
						$preset_layer_fades
						mask = $gtr64_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr64_neckhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_51
			}
		]
	}
	{
		desc_id = gtr63_neckhead_04
		frontend_desc = qs(0x6de4a5a9)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr63_neckhead_04`
		pak_num = 0
		materials = [
			gtr63_neckhead_04_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr4_neckhead_d_01`
				material = gtr63_neckhead_04_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr4_neckhead
					}
					{
						$preset_layer_fades
						mask = $gtr4_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr4_neckhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_49
			}
		]
	}
	{
		desc_id = gtr63_neckhead_05
		frontend_desc = qs(0xb104e40c)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr63_neckhead_05`
		pak_num = 0
		materials = [
			gtr63_neckhead_05_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr9_neckhead_d_01`
				material = gtr63_neckhead_05_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr9_neckhead
					}
					{
						$preset_layer_fades
						mask = $gtr9_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr9_neckhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_49
			}
		]
	}
	{
		desc_id = gtr63_neckhead_06
		frontend_desc = qs(0x866cea3f)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr63_neckhead_06`
		pak_num = 0
		materials = [
			gtr63_neckhead_06_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr4_neckhead_d_03`
				material = gtr63_neckhead_06_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr4_neckhead_03
					}
					{
						$preset_layer_fades
						mask = $gtr4_neckhead_03_fades
					}
					{
						$preset_layer_details
						mask = $gtr4_neckhead_03_details
					}
				]
				$car_rocker_guitars_factoredglobal_49
			}
		]
	}
	{
		desc_id = gtr63f_neckhead
		frontend_desc = qs(0xb11049e5)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr63f_neckhead`
		pak_num = 0
		materials = [
			gtr63f_neckhead_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr63f_neckhead_d`
				material = gtr63f_neckhead_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr63f_neckhead
					}
					{
						$preset_layer_fades
						mask = $gtr62_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr62_neckhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr64_neckhead
		frontend_desc = qs(0x5782ad70)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr64_neckhead`
		pak_num = 0
		materials = [
			gtr64_neckhead_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr64_neckhead_d`
				material = gtr64_neckhead_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr64_neckhead
					}
					{
						$preset_layer_fades
						mask = $gtr64_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr64_neckhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_51
			}
		]
	}
	{
		desc_id = gtr64_neckhead2
		frontend_desc = qs(0xab224c92)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr64_neckhead2`
		pak_num = 0
		materials = [
			gtr64_neckhead2_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr60_d_neckhead`
				material = gtr64_neckhead2_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr60_neckhead
					}
					{
						$preset_layer_fades
						mask = $gtr60_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr60_neckhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_50
			}
		]
	}
	{
		desc_id = gtr64_neckhead3
		frontend_desc = qs(0xb11049e5)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr64_neckhead3`
		pak_num = 0
		materials = [
			gtr64_neckhead3_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr62_d_neckhead`
				material = gtr64_neckhead3_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr62_neckhead
					}
					{
						$preset_layer_fades
						mask = $gtr62_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr62_neckhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr64_neckhead_04
		frontend_desc = qs(0x6de4a5a9)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr64_neckhead_04`
		pak_num = 0
		materials = [
			gtr64_neckhead_04_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr4_neckhead_d_01`
				material = gtr64_neckhead_04_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr4_neckhead
					}
					{
						$preset_layer_fades
						mask = $gtr4_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr4_neckhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_49
			}
		]
	}
	{
		desc_id = gtr64_neckhead_05
		frontend_desc = qs(0xb104e40c)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr64_neckhead_05`
		pak_num = 0
		materials = [
			gtr64_neckhead_05_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr9_neckhead_d_01`
				material = gtr64_neckhead_05_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr9_neckhead
					}
					{
						$preset_layer_fades
						mask = $gtr9_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr9_neckhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_49
			}
		]
	}
	{
		desc_id = gtr64_neckhead_06
		frontend_desc = qs(0x866cea3f)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr64_neckhead_06`
		pak_num = 0
		materials = [
			gtr64_neckhead_06_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr4_neckhead_d_03`
				material = gtr64_neckhead_06_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr4_neckhead_03
					}
					{
						$preset_layer_fades
						mask = $gtr4_neckhead_03_fades
					}
					{
						$preset_layer_details
						mask = $gtr4_neckhead_03_details
					}
				]
				$car_rocker_guitars_factoredglobal_49
			}
		]
	}
	{
		desc_id = gtr66_neckhead
		frontend_desc = qs(0xa956861e)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr66_neckhead`
		pak_num = 0
		materials = [
			gtr66_neckhead_hardware
		]
	}
	{
		desc_id = gtr1_sch_neckhead_1
		frontend_desc = qs(0xf5902c55)
		sponsor_id = schecter
		mesh = `models/car_instruments/guitar/schecter/gtr1_sch_neckhead_1`
		pak_num = 0
		materials = [
			gtr1_sch_neckhead_1_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/schecter/gtr1_sch_neckhead_d_01`
				material = gtr1_sch_neckhead_1_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr1_sch_neckhead_1
					}
					{
						$preset_layer_fades
						mask = $gtr1_sch_neckhead_1_fades
					}
					{
						$preset_layer_details
						mask = $gtr1_sch_neckhead_1_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr1_sch_neckhead_2
		frontend_desc = qs(0xdca62e7e)
		sponsor_id = schecter
		mesh = `models/car_instruments/guitar/schecter/gtr1_sch_neckhead_2`
		pak_num = 0
		materials = [
			gtr1_sch_neckhead_2_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/schecter/gtr71_neckhead_01_d`
				material = gtr1_sch_neckhead_2_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr71_neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr71_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr71_neckhead_01_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr1_sch_neckhead_3
		frontend_desc = qs(0x4b945d02)
		sponsor_id = schecter
		mesh = `models/car_instruments/guitar/schecter/gtr1_sch_neckhead_3`
		pak_num = 0
		materials = [
			gtr1_sch_neckhead_3_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/schecter/gtr72_neckhead_01_d`
				material = gtr1_sch_neckhead_3_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr72_neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr72_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr72_neckhead_01_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr1_sch_neckhead_4
		frontend_desc = qs(0x0f2dfd1a)
		sponsor_id = schecter
		mesh = `models/car_instruments/guitar/schecter/gtr1_sch_neckhead_4`
		pak_num = 0
		materials = [
			gtr1_sch_neckhead_4_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/schecter/gtr74_neckhead_01_d`
				material = gtr1_sch_neckhead_4_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr74_neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr74_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr74_neckhead_01_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr70_neckhead
		frontend_desc = qs(0xe3c9a327)
		sponsor_id = schecter
		mesh = `models/car_instruments/guitar/schecter/gtr70_neckhead`
		pak_num = 0
		materials = [
			gtr70_neckhead_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/schecter/gtr70_neckhead_d`
				material = gtr70_neckhead_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr70_neckhead
					}
					{
						$preset_layer_fades
						mask = $gtr70_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr70_neckhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr70_neckhead_02b
		frontend_desc = qs(0xdca62e7e)
		sponsor_id = schecter
		mesh = `models/car_instruments/guitar/schecter/gtr70_neckhead_02b`
		pak_num = 0
		materials = [
			gtr70_neckhead_02b_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/schecter/gtr71_neckhead_01_d`
				material = gtr70_neckhead_02b_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr71_neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr71_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr71_neckhead_01_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr70_neckhead_03
		frontend_desc = qs(0x4b945d02)
		sponsor_id = schecter
		mesh = `models/car_instruments/guitar/schecter/gtr70_neckhead_03`
		pak_num = 0
		materials = [
			gtr70_neckhead_03_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/schecter/gtr72_neckhead_01_d`
				material = gtr70_neckhead_03_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr72_neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr72_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr72_neckhead_01_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr70_neckhead_04
		frontend_desc = qs(0x0f2dfd1a)
		sponsor_id = schecter
		mesh = `models/car_instruments/guitar/schecter/gtr70_neckhead_04`
		pak_num = 0
		materials = [
			gtr70_neckhead_04_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/schecter/gtr74_neckhead_01_d`
				material = gtr70_neckhead_04_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr74_neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr74_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr74_neckhead_01_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr71_neckhead_01
		frontend_desc = qs(0xdca62e7e)
		sponsor_id = schecter
		mesh = `models/car_instruments/guitar/schecter/gtr71_neckhead_01`
		pak_num = 0
		materials = [
			gtr71_neckhead_01_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/schecter/gtr71_neckhead_01_d`
				material = gtr71_neckhead_01_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr71_neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr71_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr71_neckhead_01_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr71_neckhead_02
		frontend_desc = qs(0xe3c9a327)
		sponsor_id = schecter
		mesh = `models/car_instruments/guitar/schecter/gtr71_neckhead_02`
		pak_num = 0
		materials = [
			gtr71_neckhead_02_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/schecter/gtr70_neckhead_d`
				material = gtr71_neckhead_02_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr70_neckhead
					}
					{
						$preset_layer_fades
						mask = $gtr70_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr70_neckhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr71_neckhead_03
		frontend_desc = qs(0x4b945d02)
		sponsor_id = schecter
		mesh = `models/car_instruments/guitar/schecter/gtr71_neckhead_03`
		pak_num = 0
		materials = [
			gtr71_neckhead_03_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/schecter/gtr72_neckhead_01_d`
				material = gtr71_neckhead_03_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr72_neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr72_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr72_neckhead_01_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr71_neckhead_04
		frontend_desc = qs(0x0f2dfd1a)
		sponsor_id = schecter
		mesh = `models/car_instruments/guitar/schecter/gtr71_neckhead_04`
		pak_num = 0
		materials = [
			gtr71_neckhead_04_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/schecter/gtr74_neckhead_01_d`
				material = gtr71_neckhead_04_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr74_neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr74_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr74_neckhead_01_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr72_neckhead_01
		frontend_desc = qs(0x4b945d02)
		sponsor_id = schecter
		mesh = `models/car_instruments/guitar/schecter/gtr72_neckhead_01`
		pak_num = 0
		materials = [
			gtr72_neckhead_01_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/schecter/gtr72_neckhead_01_d`
				material = gtr72_neckhead_01_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr72_neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr72_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr72_neckhead_01_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr72_neckhead_02
		frontend_desc = qs(0xe3c9a327)
		sponsor_id = schecter
		mesh = `models/car_instruments/guitar/schecter/gtr72_neckhead_02`
		pak_num = 0
		materials = [
			gtr72_neckhead_02_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/schecter/gtr70_neckhead_d`
				material = gtr72_neckhead_02_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr70_neckhead
					}
					{
						$preset_layer_fades
						mask = $gtr70_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr70_neckhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr72_neckhead_03
		frontend_desc = qs(0xdca62e7e)
		sponsor_id = schecter
		mesh = `models/car_instruments/guitar/schecter/gtr72_neckhead_03`
		pak_num = 0
		materials = [
			gtr72_neckhead_03_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/schecter/gtr71_neckhead_01_d`
				material = gtr72_neckhead_03_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr71_neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr71_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr71_neckhead_01_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr72_neckhead_04
		frontend_desc = qs(0x0f2dfd1a)
		sponsor_id = schecter
		mesh = `models/car_instruments/guitar/schecter/gtr72_neckhead_04`
		pak_num = 0
		materials = [
			gtr72_neckhead_04_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/schecter/gtr74_neckhead_01_d`
				material = gtr72_neckhead_04_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr74_neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr74_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr74_neckhead_01_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr73_neckhead_01
		frontend_desc = qs(0xdf702ce5)
		sponsor_id = schecter
		mesh = `models/car_instruments/guitar/schecter/gtr73_neckhead_01`
		pak_num = 0
		materials = [
			gtr73_neckhead_01_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/schecter/gtr73_neckhead_d`
				material = gtr73_neckhead_01_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr73_neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr73_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr73_neckhead_01_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr73_neckhead_02
		frontend_desc = qs(0xdca62e7e)
		sponsor_id = schecter
		mesh = `models/car_instruments/guitar/schecter/gtr73_neckhead_02`
		pak_num = 0
		materials = [
			gtr73_neckhead_02_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/schecter/gtr71_neckhead_01_d`
				material = gtr73_neckhead_02_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr71_neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr71_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr71_neckhead_01_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr73_neckhead_03
		frontend_desc = qs(0x4b945d02)
		sponsor_id = schecter
		mesh = `models/car_instruments/guitar/schecter/gtr73_neckhead_03`
		pak_num = 0
		materials = [
			gtr73_neckhead_03_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/schecter/gtr72_neckhead_01_d`
				material = gtr73_neckhead_03_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr72_neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr72_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr72_neckhead_01_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr73_neckhead_04
		frontend_desc = qs(0x0f2dfd1a)
		sponsor_id = schecter
		mesh = `models/car_instruments/guitar/schecter/gtr73_neckhead_04`
		pak_num = 0
		materials = [
			gtr73_neckhead_04_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/schecter/gtr74_neckhead_01_d`
				material = gtr73_neckhead_04_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr74_neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr74_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr74_neckhead_01_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr74_neckhead_01
		frontend_desc = qs(0x0f2dfd1a)
		sponsor_id = schecter
		mesh = `models/car_instruments/guitar/schecter/gtr74_neckhead_01`
		pak_num = 0
		materials = [
			gtr74_neckhead_01_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/schecter/gtr74_neckhead_01_d`
				material = gtr74_neckhead_01_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr74_neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr74_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr74_neckhead_01_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr74_neckhead_02
		frontend_desc = qs(0xe3c9a327)
		sponsor_id = schecter
		mesh = `models/car_instruments/guitar/schecter/gtr74_neckhead_02`
		pak_num = 0
		materials = [
			gtr74_neckhead_02_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/schecter/gtr70_neckhead_d`
				material = gtr74_neckhead_02_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr70_neckhead
					}
					{
						$preset_layer_fades
						mask = $gtr70_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr70_neckhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr74_neckhead_03
		frontend_desc = qs(0xdca62e7e)
		sponsor_id = schecter
		mesh = `models/car_instruments/guitar/schecter/gtr74_neckhead_03`
		pak_num = 0
		materials = [
			gtr74_neckhead_03_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/schecter/gtr71_neckhead_01_d`
				material = gtr74_neckhead_03_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr71_neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr71_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr71_neckhead_01_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr74_neckhead_04
		frontend_desc = qs(0x4b945d02)
		sponsor_id = schecter
		mesh = `models/car_instruments/guitar/schecter/gtr74_neckhead_04`
		pak_num = 0
		materials = [
			gtr74_neckhead_04_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/schecter/gtr72_neckhead_01_d`
				material = gtr74_neckhead_04_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr72_neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr72_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr72_neckhead_01_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr20_neckhead_beast1
		frontend_desc = qs(0xb54a02f2)
		mesh = `models/car_instruments/guitar/bc_rich/gtr20_neckhead_beast1`
		sponsor_id = `bc	rich`
		pak_num = 0
		materials = [
			gtr20_neckhead_beast1_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr20_neckhead_beast1_d`
				material = gtr20_neckhead_beast1_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr20_neckhead_beast1_finishes
					}
					{
						$preset_layer_fades
						mask = $gtr20_neckhead_beast1_fades
					}
					{
						$preset_layer_details
						mask = $gtr20_neckhead_beast1_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr180_nhead_richbich
		frontend_desc = qs(0x8b16635b)
		mesh = `models/car_instruments/guitar/bc_rich/gtr180_nhead_richbich`
		sponsor_id = `bc	rich`
		pak_num = 0
		materials = [
			gtr180_nhead_bich_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr180_mbird_head`
				material = gtr180_nhead_bich_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr180_neckhead_bich_finishes
					}
					{
						$preset_layer_fades
						mask = $gtr180_neckhead_bich_fades
					}
					{
						$preset_layer_details
						mask = $gtr180_neckhead_bich_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr20_neckhead_warlock2
		frontend_desc = qs(0xc70d3926)
		mesh = `models/car_instruments/guitar/bc_rich/gtr20_neckhead_warlock2`
		sponsor_id = `bc	rich`
		pak_num = 0
		materials = [
			gtr20_neckhead_warlock2_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr20_neckhead_warlock2_d`
				material = gtr20_neckhead_warlock2_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr20_neckhead_warlock_finishes
					}
					{
						$preset_layer_fades
						mask = $gtr20_neckhead_warlock_fades
					}
					{
						$preset_layer_details
						mask = $gtr20_neckhead_warlock_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr20_neckhead_pointed3
		frontend_desc = qs(0x04bf2ba1)
		mesh = `models/car_instruments/guitar/bc_rich/gtr20_neckhead_pointed3`
		sponsor_id = `bc	rich`
		pak_num = 0
		materials = [
			gtr20_neckhead_pointed3_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr20_neckhead_pointed3_d`
				material = gtr20_neckhead_pointed3_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr20_neckhead_pointed_finishes
					}
					{
						$preset_layer_fades
						mask = $gtr20_neckhead_pointed_fades
					}
					{
						$preset_layer_details
						mask = $gtr20_neckhead_pointed_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr21_neckhead_beast2
		frontend_desc = qs(0xb54a02f2)
		mesh = `models/car_instruments/guitar/bc_rich/gtr21_neckhead_beast2`
		sponsor_id = `bc	rich`
		pak_num = 0
		materials = [
			gtr21_neckhead_beast2_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr20_neckhead_beast1_d`
				material = gtr21_neckhead_beast2_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr20_neckhead_beast1_finishes
					}
					{
						$preset_layer_fades
						mask = $gtr20_neckhead_beast1_fades
					}
					{
						$preset_layer_details
						mask = $gtr20_neckhead_beast1_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr21_neckhead_warlock3
		frontend_desc = qs(0xc70d3926)
		sponsor_id = `bc	rich`
		mesh = `models/car_instruments/guitar/bc_rich/gtr21_neckhead_warlock3`
		pak_num = 0
		materials = [
			gtr21_neckhead_warlock3_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr20_neckhead_warlock2_d`
				material = gtr21_neckhead_warlock3_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr20_neckhead_warlock_finishes
					}
					{
						$preset_layer_fades
						mask = $gtr20_neckhead_warlock_fades
					}
					{
						$preset_layer_details
						mask = $gtr20_neckhead_warlock_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr21_neckhead_pointed4
		frontend_desc = qs(0x04bf2ba1)
		mesh = `models/car_instruments/guitar/bc_rich/gtr21_neckhead_pointed4`
		sponsor_id = `bc	rich`
		pak_num = 0
		materials = [
			gtr21_neckhead_pointed4_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr20_neckhead_pointed3_d`
				material = gtr21_neckhead_pointed4_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr20_neckhead_pointed_finishes
					}
					{
						$preset_layer_fades
						mask = $gtr20_neckhead_pointed_fades
					}
					{
						$preset_layer_details
						mask = $gtr20_neckhead_pointed_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr22_neckhead_beast3
		frontend_desc = qs(0xb54a02f2)
		sponsor_id = `bc	rich`
		mesh = `models/car_instruments/guitar/bc_rich/gtr22_neckhead_beast3`
		pak_num = 0
		materials = [
			gtr22_neckhead_beast3_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr20_neckhead_beast1_d`
				material = gtr22_neckhead_beast3_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr20_neckhead_beast1_finishes
					}
					{
						$preset_layer_fades
						mask = $gtr20_neckhead_beast1_fades
					}
					{
						$preset_layer_details
						mask = $gtr20_neckhead_beast1_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr22_neckhead_warlock4
		frontend_desc = qs(0xc70d3926)
		sponsor_id = `bc	rich`
		mesh = `models/car_instruments/guitar/bc_rich/gtr22_neckhead_warlock4`
		pak_num = 0
		materials = [
			gtr22_neckhead_warlock4_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr20_neckhead_warlock2_d`
				material = gtr22_neckhead_warlock4_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr20_neckhead_warlock_finishes
					}
					{
						$preset_layer_fades
						mask = $gtr20_neckhead_warlock_fades
					}
					{
						$preset_layer_details
						mask = $gtr20_neckhead_warlock_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr22_neckhead_pointed5
		frontend_desc = qs(0x04bf2ba1)
		sponsor_id = `bc	rich`
		mesh = `models/car_instruments/guitar/bc_rich/gtr22_neckhead_pointed5`
		pak_num = 0
		materials = [
			gtr22_neckhead_pointed5_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr20_neckhead_pointed3_d`
				material = gtr22_neckhead_pointed5_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr20_neckhead_pointed_finishes
					}
					{
						$preset_layer_fades
						mask = $gtr20_neckhead_pointed_fades
					}
					{
						$preset_layer_details
						mask = $gtr20_neckhead_pointed_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr10_neckhead_mcswain1
		frontend_desc = qs(0xbaaefe3d)
		sponsor_id = mcswain
		mesh = `models/car_instruments/guitar/mcswain/gtr10_neckhead_mcswain1`
		pak_num = 0
		materials = [
			gtr10_neckhead_mcswain_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/mcswain/gtr10_neckhead_mcswain1_d`
				material = gtr10_neckhead_mcswain_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr10_mcswn_nkhd_finishes
					}
					{
						$preset_layer_fades
						mask = $gtr10_mcswn_nkhd_fades
					}
					{
						$preset_layer_details
						mask = $gtr10_mcswn_nkhd_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr12_neckhead_mcswain12
		frontend_desc = qs(0x976a0248)
		sponsor_id = mcswain
		mesh = `models/car_instruments/guitar/mcswain/gtr12_neckhead_mcswain12`
		pak_num = 0
		materials = [
			gtr12_neckhead_mcswain12_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/mcswain/gtr12_neckhead_mcswain_d`
				material = gtr12_neckhead_mcswain12_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr12_mcswn_nkhd_finishes
					}
					{
						$preset_layer_fades
						mask = $gtr12_mcswn_nkhd_fades
					}
					{
						$preset_layer_details
						mask = $gtr12_mcswn_nkhd_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr14_neckhead_mcswain3
		frontend_desc = qs(0x2d9a1287)
		sponsor_id = mcswain
		mesh = `models/car_instruments/guitar/mcswain/gtr14_neckhead_mcswain3`
		pak_num = 0
		materials = [
			gtr10_neckhead_mcswain_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/mcswain/gtr10_neckhead_mcswain1_d`
				material = gtr10_neckhead_mcswain_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr10_mcswn_nkhd_finishes
					}
					{
						$preset_layer_fades
						mask = $gtr10_mcswn_nkhd_fades
					}
					{
						$preset_layer_details
						mask = $gtr10_mcswn_nkhd_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr14_neckhead_mcswain4
		frontend_desc = qs(0x06b74144)
		sponsor_id = mcswain
		mesh = `models/car_instruments/guitar/mcswain/gtr14_neckhead_mcswain4`
		pak_num = 0
		materials = [
			gtr13_neckhead_mcswain_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/mcswain/gtr12_neckhead_mcswain_d`
				material = gtr13_neckhead_mcswain_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr12_mcswn_nkhd_finishes
					}
					{
						$preset_layer_fades
						mask = $gtr12_mcswn_nkhd_fades
					}
					{
						$preset_layer_details
						mask = $gtr12_mcswn_nkhd_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr75_neckhead_01
		frontend_desc = qs(0x34683b85)
		sponsor_id = ibanez
		mesh = `models/car_instruments/guitar/ibanez/gtr75_neckhead_01`
		pak_num = 0
		materials = [
			gtr75_neckhead_01_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/ibanez/gtr75_neckhead_d`
				material = gtr75_neckhead_01_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr75_neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr75_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr75_neckhead_01_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr75_neckhead_02
		frontend_desc = qs(0x3c35558b)
		sponsor_id = ibanez
		mesh = `models/car_instruments/guitar/ibanez/gtr75_neckhead_02`
		pak_num = 0
		materials = [
			gtr75_neckhead_01_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/ibanez/gtr75_neckhead_d`
				material = gtr75_neckhead_01_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr75_neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr75_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr75_neckhead_01_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr75_neckhead_03
		frontend_desc = qs(0x69ae2964)
		sponsor_id = ibanez
		mesh = `models/car_instruments/guitar/ibanez/gtr75_neckhead_03`
		pak_num = 0
		materials = [
			gtr75_neckhead_03_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/ibanez/gtr75_neckhead_03_d`
				material = gtr75_neckhead_03_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr75_neckhead_03
					}
					{
						$preset_layer_fades
						mask = $gtr75_neckhead_03_fades
					}
					{
						$preset_layer_details
						mask = $gtr75_neckhead_03_details
					}
				]
				$car_rocker_guitars_factoredglobal_57
			}
		]
	}
	{
		desc_id = gtr75_neckhead_04
		frontend_desc = qs(0xe9a505b2)
		sponsor_id = ibanez
		mesh = `models/car_instruments/guitar/ibanez/gtr75_neckhead_04`
		pak_num = 0
		materials = [
			gtr75_neckhead_03_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/ibanez/gtr75_neckhead_03_d`
				material = gtr75_neckhead_03_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr75_neckhead_03
					}
					{
						$preset_layer_fades
						mask = $gtr75_neckhead_03_fades
					}
					{
						$preset_layer_details
						mask = $gtr75_neckhead_03_details
					}
				]
				$car_rocker_guitars_factoredglobal_57
			}
		]
	}
	{
		desc_id = gtr76_neckhead_01
		frontend_desc = qs(0x4f9f9c1d)
		sponsor_id = ibanez
		mesh = `models/car_instruments/guitar/ibanez/gtr76_neckhead_01`
		pak_num = 0
		materials = [
			gtr76_neckhead_01_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/ibanez/gtr76_neckhead_d`
				material = gtr76_neckhead_01_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr76_neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr76_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr76_neckhead_01_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr76_neckhead_02
		frontend_desc = qs(0x941c455d)
		sponsor_id = ibanez
		mesh = `models/car_instruments/guitar/ibanez/gtr76_neckhead_02`
		pak_num = 0
		materials = [
			gtr76_neckhead_01_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/ibanez/gtr76_neckhead_d`
				material = gtr76_neckhead_01_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr76_neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr76_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr76_neckhead_01_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr76_neckhead_03
		frontend_desc = qs(0xeb5b60d8)
		sponsor_id = ibanez
		mesh = `models/car_instruments/guitar/ibanez/gtr76_neckhead_03`
		pak_num = 0
		materials = [
			gtr76_neckhead_03_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/ibanez/gtr76_neckhead_03_d`
				material = gtr76_neckhead_03_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr76_neckhead_03
					}
					{
						$preset_layer_fades
						mask = $gtr76_neckhead_03_fades
					}
					{
						$preset_layer_details
						mask = $gtr76_neckhead_03_details
					}
				]
				$car_rocker_guitars_factoredglobal_57
			}
		]
	}
	{
		desc_id = gtr76_neckhead_04
		frontend_desc = qs(0x82c5ab94)
		sponsor_id = ibanez
		mesh = `models/car_instruments/guitar/ibanez/gtr76_neckhead_04`
		pak_num = 0
		materials = [
			gtr76_neckhead_03_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/ibanez/gtr76_neckhead_03_d`
				material = gtr76_neckhead_03_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr76_neckhead_03
					}
					{
						$preset_layer_fades
						mask = $gtr76_neckhead_03_fades
					}
					{
						$preset_layer_details
						mask = $gtr76_neckhead_03_details
					}
				]
				$car_rocker_guitars_factoredglobal_57
			}
		]
	}
	{
		desc_id = gtr77_neckhead_01
		frontend_desc = qs(0x14b58055)
		sponsor_id = ibanez
		mesh = `models/car_instruments/guitar/ibanez/gtr77_neckhead_01`
		pak_num = 0
		materials = [
			gtr77_neckhead_01_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/ibanez/gtr75_neckhead_d`
				material = gtr77_neckhead_01_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr75_neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr75_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr75_neckhead_01_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr77_neckhead_02
		frontend_desc = qs(0xaf7120f6)
		sponsor_id = ibanez
		mesh = `models/car_instruments/guitar/ibanez/gtr77_neckhead_02`
		pak_num = 0
		materials = [
			gtr77_neckhead_01_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/ibanez/gtr75_neckhead_d`
				material = gtr77_neckhead_01_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr75_neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr75_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr75_neckhead_01_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr77_neckhead_03
		frontend_desc = qs(0x9b70ab40)
		sponsor_id = ibanez
		mesh = `models/car_instruments/guitar/ibanez/gtr77_neckhead_03`
		pak_num = 0
		materials = [
			gtr77_neckhead_03_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/ibanez/gtr75_neckhead_03_d`
				material = gtr77_neckhead_03_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr75_neckhead_03
					}
					{
						$preset_layer_fades
						mask = $gtr75_neckhead_03_fades
					}
					{
						$preset_layer_details
						mask = $gtr75_neckhead_03_details
					}
				]
				$car_rocker_guitars_factoredglobal_57
			}
		]
	}
	{
		desc_id = gtr77_neckhead_04
		frontend_desc = qs(0x2403da9b)
		sponsor_id = ibanez
		mesh = `models/car_instruments/guitar/ibanez/gtr77_neckhead_04`
		pak_num = 0
		materials = [
			gtr77_neckhead_03_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/ibanez/gtr75_neckhead_03_d`
				material = gtr77_neckhead_03_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr75_neckhead_03
					}
					{
						$preset_layer_fades
						mask = $gtr75_neckhead_03_fades
					}
					{
						$preset_layer_details
						mask = $gtr75_neckhead_03_details
					}
				]
				$car_rocker_guitars_factoredglobal_57
			}
		]
	}
	{
		desc_id = gtr78_neckhead
		frontend_desc = qs(0x3ae4e846)
		mesh = `models/car_instruments/guitar/ibanez/gtr78_neckhead`
		pak_num = 0
		materials = [
			gtr78_neckhead_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/ibanez/gtr78_neckhead_d`
				material = gtr78_neckhead_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr75_neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr75_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr75_neckhead_01_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr178_neckhead_01
		frontend_desc = qs(0xbe4e12ca)
		sponsor_id = ibanez
		mesh = `models/car_instruments/guitar/ibanez/gtr178_neckhead_01`
		pak_num = 0
		materials = [
			gtr178_neckhead_01_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/ibanez/gtr75_neckhead_d`
				material = gtr178_neckhead_01_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr75_neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr75_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr75_neckhead_01_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr178_neckhead_02
		frontend_desc = qs(0x69385c76)
		sponsor_id = ibanez
		mesh = `models/car_instruments/guitar/ibanez/gtr178_neckhead_02`
		pak_num = 0
		materials = [
			gtr178_neckhead_02_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/ibanez/gtr75_neckhead_d`
				material = gtr178_neckhead_02_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr75_neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr75_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr75_neckhead_01_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr178_neckhead_03
		frontend_desc = qs(0x981ee10a)
		sponsor_id = ibanez
		mesh = `models/car_instruments/guitar/ibanez/gtr178_neckhead_03`
		pak_num = 0
		materials = [
			gtr178_neckhead_03_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/ibanez/gtr75_neckhead_03_d`
				material = gtr178_neckhead_03_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr75_neckhead_03
					}
					{
						$preset_layer_fades
						mask = $gtr75_neckhead_03_fades
					}
					{
						$preset_layer_details
						mask = $gtr75_neckhead_03_details
					}
				]
				$car_rocker_guitars_factoredglobal_57
			}
		]
	}
	{
		desc_id = gtr178_neckhead_04
		frontend_desc = qs(0xb659fa50)
		sponsor_id = ibanez
		mesh = `models/car_instruments/guitar/ibanez/gtr178_neckhead_04`
		pak_num = 0
		materials = [
			gtr178_neckhead_04_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/ibanez/gtr75_neckhead_03_d`
				material = gtr178_neckhead_04_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr75_neckhead_03
					}
					{
						$preset_layer_fades
						mask = $gtr75_neckhead_03_fades
					}
					{
						$preset_layer_details
						mask = $gtr75_neckhead_03_details
					}
				]
				$car_rocker_guitars_factoredglobal_57
			}
		]
	}
	{
		desc_id = gtr90_dr_neckhead01
		frontend_desc = qs(0xafebdc3f)
		sponsor_id = daisy
		mesh = `models/car_instruments/guitar/daisyrock/gtr90_dr_neckhead01`
		pak_num = 0
		materials = [
			gtr90_dr_neckhead01_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/daisyrock/gtr90_neckhead01_d`
				material = gtr90_dr_neckhead01_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr90_dr_neckhead01
					}
					{
						$preset_layer_fades
						mask = $gtr90_dr_neckhead01_fades
					}
					{
						$preset_layer_details
						mask = $gtr90_dr_neckhead01_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr90_dr_neckhead02
		frontend_desc = qs(0x3a384df0)
		sponsor_id = daisy
		mesh = `models/car_instruments/guitar/daisyrock/gtr90_dr_neckhead02`
		pak_num = 0
		materials = [
			gtr90_dr_neckhead02_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/daisyrock/gtr93_neckhead01_d`
				material = gtr90_dr_neckhead02_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr93_dr_neckhead01b
					}
					{
						$preset_layer_fades
						mask = $gtr93_dr_neckhead01_fades
					}
					{
						$preset_layer_details
						mask = $gtr93_dr_neckhead01_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr91_dr_neckhead01
		frontend_desc = qs(0xafebdc3f)
		sponsor_id = daisy
		mesh = `models/car_instruments/guitar/daisyrock/gtr91_dr_neckhead01`
		pak_num = 0
		materials = [
			gtr91_dr_neckhead01_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/daisyrock/gtr90_neckhead01_d`
				material = gtr91_dr_neckhead01_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr90_dr_neckhead01
					}
					{
						$preset_layer_fades
						mask = $gtr90_dr_neckhead01_fades
					}
					{
						$preset_layer_details
						mask = $gtr90_dr_neckhead01_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr91_dr_neckhead02
		frontend_desc = qs(0x3a384df0)
		sponsor_id = daisy
		mesh = `models/car_instruments/guitar/daisyrock/gtr91_dr_neckhead02`
		pak_num = 0
		materials = [
			gtr91_dr_neckhead02_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/daisyrock/gtr93_neckhead01_d`
				material = gtr91_dr_neckhead02_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr93_dr_neckhead01b
					}
					{
						$preset_layer_fades
						mask = $gtr93_dr_neckhead01_fades
					}
					{
						$preset_layer_details
						mask = $gtr93_dr_neckhead01_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr92_dr_neckhead01
		frontend_desc = qs(0xafebdc3f)
		sponsor_id = daisy
		mesh = `models/car_instruments/guitar/daisyrock/gtr92_dr_neckhead01`
		pak_num = 0
		materials = [
			gtr92_dr_neckhead01_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/daisyrock/gtr90_neckhead01_d`
				material = gtr92_dr_neckhead01_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr90_dr_neckhead01b
					}
					{
						$preset_layer_fades
						mask = $gtr90_dr_neckhead01_fades
					}
					{
						$preset_layer_details
						mask = $gtr90_dr_neckhead01_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr92_dr_neckhead02
		frontend_desc = qs(0x3a384df0)
		sponsor_id = daisy
		mesh = `models/car_instruments/guitar/daisyrock/gtr92_dr_neckhead02`
		pak_num = 0
		materials = [
			gtr92_dr_neckhead02_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/daisyrock/gtr93_neckhead01_d`
				material = gtr92_dr_neckhead02_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr93_dr_neckhead01b
					}
					{
						$preset_layer_fades
						mask = $gtr93_dr_neckhead01_fades
					}
					{
						$preset_layer_details
						mask = $gtr93_dr_neckhead01_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr93_dr_neckhead01
		frontend_desc = qs(0x3a384df0)
		sponsor_id = daisy
		mesh = `models/car_instruments/guitar/daisyrock/gtr93_dr_neckhead01`
		pak_num = 0
		materials = [
			gtr93_dr_neckhead01_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/daisyrock/gtr93_neckhead01_d`
				material = gtr93_dr_neckhead01_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr93_dr_neckhead01
					}
					{
						$preset_layer_fades
						mask = $gtr93_dr_neckhead01_fades
					}
					{
						$preset_layer_details
						mask = $gtr93_dr_neckhead01_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr93_dr_neckhead02
		frontend_desc = qs(0xafebdc3f)
		sponsor_id = daisy
		mesh = `models/car_instruments/guitar/daisyrock/gtr93_dr_neckhead02`
		pak_num = 0
		materials = [
			gtr93_dr_neckhead02_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/daisyrock/gtr90_neckhead01_d`
				material = gtr93_dr_neckhead02_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr90_dr_neckhead01
					}
					{
						$preset_layer_fades
						mask = $gtr90_dr_neckhead01_fades
					}
					{
						$preset_layer_details
						mask = $gtr90_dr_neckhead01_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr94_dr_neckhead01
		frontend_desc = qs(0x3a384df0)
		sponsor_id = daisy
		mesh = `models/car_instruments/guitar/daisyrock/gtr94_dr_neckhead01`
		pak_num = 0
		materials = [
			gtr94_dr_neckhead01_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/daisyrock/gtr93_neckhead01_d`
				material = gtr94_dr_neckhead01_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr93_dr_neckhead01c
					}
					{
						$preset_layer_fades
						mask = $gtr93_dr_neckhead01_fades
					}
					{
						$preset_layer_details
						mask = $gtr93_dr_neckhead01_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr94_dr_neckhead02
		frontend_desc = qs(0xafebdc3f)
		sponsor_id = daisy
		mesh = `models/car_instruments/guitar/daisyrock/gtr94_dr_neckhead02`
		pak_num = 0
		materials = [
			gtr94_dr_neckhead02_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/daisyrock/gtr90_neckhead01_d`
				material = gtr94_dr_neckhead02_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr90_dr_neckhead01
					}
					{
						$preset_layer_fades
						mask = $gtr90_dr_neckhead01_fades
					}
					{
						$preset_layer_details
						mask = $gtr90_dr_neckhead01_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr78_neckhead_01
		frontend_desc = qs(0xaacb9118)
		sponsor_id = prs
		mesh = `models/car_instruments/guitar/prs/gtr78_neckhead_01`
		pak_num = 0
		materials = [
			gtr78_neckhead_01_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/prs/gtr78_neckhead_d`
				material = gtr78_neckhead_01_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr78_neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr78_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr78_neckhead_01_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr79_neckhead_01
		frontend_desc = qs(0xfe93cc00)
		sponsor_id = prs
		mesh = `models/car_instruments/guitar/prs/gtr79_neckhead_01`
		pak_num = 0
		materials = [
			gtr79_neckhead_01_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/prs/gtr79_neckhead_01d`
				material = gtr79_neckhead_01_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr78_neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr78_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr78_neckhead_01_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr80_neckhead_01
		frontend_desc = qs(0x937f401d)
		sponsor_id = prs
		mesh = `models/car_instruments/guitar/prs/gtr80_neckhead_01`
		pak_num = 0
		materials = [
			gtr80_neckhead_01_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/prs/gtr80_neckhead_01d`
				material = gtr80_neckhead_01_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr80_neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr80_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr80_neckhead_01_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr81_neckhead01
		frontend_desc = qs(0x196e726c)
		sponsor_id = prs
		mesh = `models/car_instruments/guitar/prs/gtr81_neckhead01`
		pak_num = 0
		materials = [
			gtr81_neckhead_01_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/prs/gtr81_neckhead_01d`
				material = gtr81_neckhead_01_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr78_neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr78_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr78_neckhead_01_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr82_neckhead01
		frontend_desc = qs(0x0e624dd2)
		sponsor_id = prs
		mesh = `models/car_instruments/guitar/prs/gtr82_neckhead01`
		pak_num = 0
		materials = [
			gtr82_neckhead_01_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/prs/gtr82_neckhead_01`
				material = gtr82_neckhead_01_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr82_neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr82_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr82_neckhead_01_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr83_neckhead01
		frontend_desc = qs(0x1ae57f5b)
		mesh = `models/car_instruments/guitar/prs/gtr83_neckhead01`
		pak_num = 0
		materials = [
			gtr83_neckhead_01_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/prs/gtr83_neckhead_01`
				material = gtr83_neckhead_01_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr78_neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr78_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr78_neckhead_01_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr84_neckhead01
		frontend_desc = qs(0xf02b0c3f)
		sponsor_id = `music	man`
		mesh = `models/car_instruments/guitar/mm/gtr84_neckhead01`
		pak_num = 0
		materials = [
			gtr84_neckhead_01_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/mm/gtr84_neckhead01`
				material = gtr84_neckhead_01_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr84_neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr84_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr84_neckhead_01_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr86_neckhead_01
		frontend_desc = qs(0xf02b0c3f)
		sponsor_id = `music	man`
		mesh = `models/car_instruments/guitar/mm/gtr86_neckhead_01`
		pak_num = 0
		materials = [
			gtr86_neckhead_01_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/mm/gtr86_neckhead_d`
				material = gtr86_neckhead_01_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr86_neckhead_01
					}
					{
						$preset_layer_fades
						mask = $gtr86_neckhead_01_fades
					}
					{
						$preset_layer_details
						mask = $gtr86_neckhead_01_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr1b_neckhead_sk8
		frontend_desc = qs(0x39ddbf5c)
		mesh = `models/car_instruments/guitar/heroes/gtr1b_neckhead_sk8`
		pak_num = 0
		materials = [
			gtr1b_neckhead_sk8_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/heroes/gtr1b_neckhead_sk8_d`
				material = gtr1b_neckhead_sk8_primary
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr104_neckhead
		frontend_desc = qs(0x96bbf6cd)
		mesh = `models/car_instruments/guitar/heroes/gtr104_neckhead`
		pak_num = 0
		materials = [
			gtr104_neckhead_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/heroes/gtr104_neckhead_d`
				material = gtr104_neckhead_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr104_neckhead
					}
					{
						$preset_layer_fades
						mask = $gtr104_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr104_neckhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr27_neckhead_acoustic
		frontend_desc = qs(0xd0c872b5)
		mesh = `models/car_instruments/guitar/heroes/gtr27_neckhead_acoustic`
		pak_num = 0
		materials = [
			gtr27_neckhead_acoustic_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/heroes/gtr27_neckhead_acoustic_d`
				material = gtr27_neckhead_acoustic_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr27_neckhead_acoustic_finishes
					}
					{
						$preset_layer_fades
						mask = $gtr27_neckhead_acoustic_fades
					}
					{
						$preset_layer_details
						mask = $gtr27_neckhead_acoustic_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr130_neckhead
		frontend_desc = qs(0xf8d8067f)
		mesh = `models/car_instruments/guitar/heroes/gtr130_neckhead`
		pak_num = 0
		materials = [
			gtr130_neckhead_hardware
		]
	}
	{
		desc_id = gtr131_neckhead
		frontend_desc = qs(0xdf40a54a)
		mesh = `models/car_instruments/guitar/heroes/gtr131_neckhead`
		pak_num = 0
		materials = [
			gtr131_neckhead_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/heroes/gtr131_neckhead_d`
				material = gtr131_neckhead_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr131_neckhead
					}
					{
						$preset_layer_fades
						mask = $gtr131_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr131_neckhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr132_neckhead
		frontend_desc = qs(0xd690f064)
		mesh = 0xa338f55c
		pak_num = 0
		materials = [
			gtr132_neckhead_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/heroes/gtr132_neckhead_d`
				material = 0x338a0adb
				preset_layers = [
				]
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr108_neckhead
		frontend_desc = qs(0x1e5cfb0b)
		mesh = `models/car_instruments/guitar/heroes/gtr108_neckhead`
		materials = [
			gtr108_neckhead_hardware
		]
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/heroes/bass108_neckhead_d`
				material = gtr108_neckhead_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr108_neckhead_finishes
					}
					{
						$preset_layer_fades
						mask = $gtr108_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr108_neckhead_details
					}
				]
				$car_rocker_guitars_factoredglobal_58
			}
		]
	}
	{
		desc_id = gtr109_neckhead
		frontend_desc = qs(0x3ffdff2c)
		mesh = 0xc23a68aa
		materials = [
			gtr109_neckhead_hardware
		]
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/heroes/gtr109_neckhead_d`
				material = 0x6d0bff1c
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $0xe73ef539
					}
					{
						$preset_layer_fades
						mask = $0x53e07692
					}
					{
						$preset_layer_details
						mask = $0x08681e10
					}
				]
				$car_rocker_guitars_factoredglobal_58
			}
		]
	}
	{
		desc_id = gtr110_neckhead
		frontend_desc = qs(0xdf40a54a)
		mesh = `models/car_instruments/guitar/heroes/gtr110_neckhead`
		materials = [
			gtr110_neckhead_hardware
		]
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/heroes/gtr110_neckhead_d`
				material = gtr110_neckhead_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr110_neckhead_finishes
					}
					{
						$preset_layer_fades
						mask = $gtr110_neckhead_fades
					}
					{
						$preset_layer_details
						mask = $gtr110_neckhead_details
					}
				]
				user_layer_settings = {
					diffuse
					ui_rotated_90
					initial_values = {
						x_trans = -20
						y_trans = -29
						x_scale = 23
						y_scale = 20
					}
				}
			}
		]
	}
	{
		desc_id = gtr133_neckhead
		frontend_desc = qs(0xa337ae91)
		mesh = `models/car_instruments/guitar/heroes/gtr133_neckhead`
		materials = [
			gtr133_neckhead_hardware
		]
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/heroes/gtr133_neckhead_d`
				material = gtr133_neckhead_primary
				$car_rocker_guitars_factoredglobal_60
			}
		]
	}
	{
		desc_id = gtr142_neckhead
		frontend_desc = qs(0x048d80b3)
		mesh = `models/car_instruments/guitar/heroes/gtr142_neckhead`
		materials = [
			gtr142_vtwin_head_hardware
		]
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/heroes/gtr142_vtwin_head`
				material = gtr142_vtwin_head_primary
				$car_rocker_guitars_factoredglobal_60
			}
		]
	}
	{
		desc_id = gtr136_neckhead
		frontend_desc = qs(0x83449086)
		mesh = `models/car_instruments/guitar/heroes/gtr136_neckhead`
		materials = [
			gtr136_neckhead_hardware
		]
		pak_num = 0
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/heroes/bass136_neckhead_d`
				material = gtr136_neckhead_primary
				$car_rocker_guitars_factoredglobal_60
			}
		]
	}
	{
		desc_id = gtr135_neckhead
		frontend_desc = qs(0x40d6de9d)
		mesh = 0x41e4ee25
		materials = [
			gtr135_neckhead_hardware
		]
		pak_num = 0
	}
	{
		desc_id = None
		frontend_desc = qs(0x9c1b5214)
		random_weight = 10.0
	}
	{
		desc_id = gtr25_neckhead_manson
		frontend_desc = qs(0x7c45b7a1)
		mesh = `models/car_instruments/guitar/manson/gtr25_neckhead_manson`
		pak_num = 0
		materials = [
			gtr25_neckhead_manson_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/manson/gtr25_neckhead_bellamy_d`
				material = gtr25_neckhead_manson_primary
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
	{
		desc_id = gtr26_neckhead_cash
		frontend_desc = qs(0xc3345a1d)
		mesh = `models/car_instruments/guitar/cash/gtr26_neckhead_cash`
		pak_num = 0
		materials = [
			gtr26_neckhead_cash_hardware
		]
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/cash/gtr26_neckhead_cash_d`
				material = gtr26_neckhead_cash_primary
				$car_rocker_guitars_factoredglobal_52
			}
		]
	}
]
cas_guitar_pickguards = [
	{
		desc_id = gtr5_pickguard_01
		frontend_desc = qs(0xea509d4f)
		mesh = `models/car_instruments/guitar/esp/gtr5_pickguard_01`
	}
	{
		desc_id = gtr12_pickguard_01
		frontend_desc = qs(0xf08ae2aa)
		mesh = `models/car_instruments/guitar/esp/gtr12_pickguard_01`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr12_pickguard_d_01`
				material = gtr12_pickguard_01_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr12_pickguard_01
					}
				]
			}
		]
	}
	{
		desc_id = gtr31_pgard
		frontend_desc = qs(0x32d68597)
		mesh = `models/car_instruments/guitar/esp/gtr31_pgard`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr31_vipepgard_d`
				material = gtr31_pgard_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr31_pg
					}
				]
			}
		]
	}
	{
		desc_id = gtr36_pgard
		frontend_desc = qs(0x2bd2f2fd)
		mesh = `models/car_instruments/guitar/esp/gtr36_pgard`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr36_pgard`
				material = gtr36_pgard_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr36_pg
					}
				]
			}
		]
	}
	{
		desc_id = gtr37_pguard01
		frontend_desc = qs(0x743000b2)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr37_pguard01`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr37_pguard01_d`
				material = gtr37_pguard_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr37_pg
					}
				]
			}
		]
	}
	{
		desc_id = gtr62_esp_pg1b
		frontend_desc = qs(0x6550c8f3)
		mesh = `models/car_instruments/guitar/esp/gtr62_esp_pg1b`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/esp/gtr62_esp_pg1b_d`
				material = gtr62_esp_pg1b_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr62_esp_pg1b
					}
				]
			}
		]
	}
	{
		desc_id = gtr40_pgard
		frontend_desc = qs(0x1c9a27f1)
		mesh = `models/car_instruments/guitar/esp/gtr40_pgard`
	}
	{
		desc_id = None
		frontend_desc = qs(0x9c1b5214)
		random_weight = 10.0
	}
	{
		desc_id = gtr1_sch_pickguard_01
		frontend_desc = qs(0xa811680b)
		mesh = `models/car_instruments/guitar/schecter/gtr1_sch_pickguard_01`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/schecter/gtr1_sch_pickguard_01`
				material = gtr1_sch_pickguard_01_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr1_sch_pg_1
					}
				]
			}
		]
	}
	{
		desc_id = gtr70_pg
		frontend_desc = qs(0xe3c9a327)
		mesh = `models/car_instruments/guitar/schecter/gtr70_pg`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/schecter/gtr70_pg_d`
				material = gtr70_pg_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr70_pg
					}
				]
			}
		]
	}
	{
		desc_id = gtr70_pg2
		frontend_desc = qs(0x88a25034)
		mesh = `models/car_instruments/guitar/schecter/gtr70_pg2`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/schecter/gtr70_pg2_d`
				material = gtr70_pg2_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr70_pg2
					}
				]
			}
		]
	}
	{
		desc_id = gtr74_pg1
		frontend_desc = qs(0x0f2dfd1a)
		mesh = `models/car_instruments/guitar/schecter/gtr74_pg1`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/schecter/gtr74_pg1_d`
				material = gtr74_pg1_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr74_pg1
					}
				]
			}
		]
	}
	{
		desc_id = gtr73_pg1
		frontend_desc = qs(0xdf702ce5)
		sponsor_id = schecter
		mesh = `models/car_instruments/guitar/schecter/gtr73_pg1`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/schecter/gtr73_pg1_d`
				material = gtr73_pg1_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr73_pg1
					}
				]
			}
		]
	}
	{
		desc_id = gtr77_ibz_rg_pg
		frontend_desc = qs(0x3ef212e3)
		mesh = `models/car_instruments/guitar/ibanez/gtr77_ibz_rg_pg`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/ibanez/gtr77_ibz_rg_pg_d`
				material = gtr77_ibz_rg_pg_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr77_ibz_rg_pg
					}
				]
			}
		]
	}
	{
		desc_id = gtr78_pg
		frontend_desc = qs(0x5d74f9f5)
		mesh = `models/car_instruments/guitar/ibanez/gtr78_pg`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/ibanez/gtr78_pg_d`
				material = gtr78_pg_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr77_ibz_rg_pg
					}
				]
			}
		]
	}
	{
		desc_id = gtr90_pg
		frontend_desc = qs(0x354fb259)
		sponsor_id = daisy
		mesh = `models/car_instruments/guitar/daisyrock/gtr90_pg`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/daisyrock/gtr90_pg_d`
				material = gtr90_pg_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr90_pg
					}
				]
			}
		]
	}
	{
		desc_id = gtr91_pg
		frontend_desc = qs(0x4a78c768)
		sponsor_id = daisy
		mesh = `models/car_instruments/guitar/daisyrock/gtr91_pg`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/daisyrock/gtr91_pg_d`
				material = gtr91_pg_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr91_pg
					}
				]
			}
		]
	}
	{
		desc_id = gtr92_pg
		frontend_desc = qs(0xec54f9d3)
		sponsor_id = daisy
		mesh = `models/car_instruments/guitar/daisyrock/gtr92_pg`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/daisyrock/gtr92_pg_d`
				material = gtr92_pg_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr92_pg
					}
				]
			}
		]
	}
	{
		desc_id = gtr94_pg
		frontend_desc = qs(0xff499416)
		sponsor_id = daisy
		mesh = `models/car_instruments/guitar/daisyrock/gtr94_pg`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/daisyrock/gtr94_pg_d`
				material = gtr94_pg_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr94_pg
					}
				]
			}
		]
	}
	{
		desc_id = gtr81_pguard
		frontend_desc = qs(0x7a61ace7)
		mesh = `models/car_instruments/guitar/prs/gtr81_pguard`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/prs/prs_81_pguard`
				material = gtr81_pguard_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr81_pguard
					}
				]
			}
		]
	}
	{
		desc_id = gtr82_pguard
		frontend_desc = qs(0x0e624dd2)
		sponsor_id = prs
		mesh = `models/car_instruments/guitar/prs/gtr82_pguard`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/prs/prs_82_pguard`
				material = gtr82_pguard_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr82_pguard
					}
				]
			}
		]
	}
	{
		desc_id = gtr83_pguard
		frontend_desc = qs(0x1ae57f5b)
		sponsor_id = prs
		materials = [
			gtr83_pguard_primary
		]
		node_meshes = {
			$guitar_misc_nodes
			placements = [
				{
					parents = [
						gtr83_prs_stla
					]
					node_set = 3
					meshes = [
						{
							mesh = `models/car_instruments/guitar/prs/gtr83_pguard`
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
		desc_id = gtr_x_anarc_pickg01
		frontend_desc = qs(0xd1603305)
		mesh = `models/car_instruments/guitar/heroes/gtr_x_anarc_pickg01`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/heroes/pickgrd_body_x_anarchy_d_01`
				material = gtr_x_anarc_pickg01_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr_x_anarc_pickg01
					}
				]
			}
		]
	}
	{
		desc_id = gtr_x_anarc_pickg02
		frontend_desc = qs(0xfa4d60c6)
		mesh = `models/car_instruments/guitar/heroes/gtr_x_anarc_pickg02`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/heroes/pickgrd_body_x_anarchy_d_02`
				material = gtr_x_anarc_pickg02_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr_x_anarc_pckgrd_2
					}
				]
			}
		]
	}
	{
		desc_id = gtr_body20_pickg01
		frontend_desc = qs(0x9e2838e5)
		mesh = `models/car_instruments/guitar/heroes/gtr_body20_pickg01`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/heroes/pickgrd_body20_d_01`
				material = pckgrd_body20_01_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr_body20_pickg01
					}
				]
			}
		]
	}
	{
		desc_id = gtr_body20_pickg02
		frontend_desc = qs(0xb5056b26)
		mesh = `models/car_instruments/guitar/heroes/gtr_body20_pickg02`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/heroes/pickgrd_body20_d_02`
				material = pckgrd_body20_02_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr_body20_pickg02
					}
				]
			}
		]
	}
	{
		desc_id = gtr_body20_pickg03
		frontend_desc = qs(0xac1e5a67)
		mesh = `models/car_instruments/guitar/heroes/gtr_body20_pickg03`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/heroes/pickgrd_body20_d_03`
				material = pckgrd_body20_03_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr_body20_pickg03
					}
				]
			}
		]
	}
	{
		desc_id = gtr_x_spider_pickg01
		frontend_desc = qs(0x0875fb66)
		mesh = `models/car_instruments/guitar/heroes/gtr_x_spider_pickg01`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/heroes/pickgrd_body_x_spider_d_01`
				material = gtr_x_spider_pickg01_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr_x_spider_pickg01
					}
				]
			}
		]
	}
	{
		desc_id = gtr_x_skull_pickg01
		frontend_desc = qs(0xca374960)
		mesh = `models/car_instruments/guitar/heroes/gtr_x_skull_pickg01`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/heroes/pickgrd_body_x_skull_d_01a`
				material = gtr_x_skull_pickg01_primary
				preset_layers = [
					{
						$preset_layer_finishes
						mask = $gtr_x_skull_pickg01
					}
				]
			}
		]
	}
	{
		desc_id = gtr130_pg
		frontend_desc = qs(0xb68582dc)
		mesh = `models/car_instruments/guitar/heroes/gtr130_pg`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/heroes/gtr130_pg_d`
				material = gtr130_pg_primary
			}
		]
	}
	{
		desc_id = gtr132_pg
		frontend_desc = qs(0x2a26573d)
		mesh = 0x46e36381
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/heroes/gtr132_pg_d`
				material = 0x97b0a999
				preset_layers = [
				]
			}
		]
	}
	{
		desc_id = gtr133_pg
		frontend_desc = qs(0x7c6774b7)
		mesh = `models/car_instruments/guitar/heroes/gtr133_pg`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/heroes/gtr133_pg_d`
				material = gtr133_pg_primary
				preset_layers = [
				]
			}
		]
	}
	{
		desc_id = gtr136_pg
		frontend_desc = qs(0x53c1766c)
		mesh = `models/car_instruments/guitar/heroes/gtr136_pg`
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/bass/heroes/bass136_pg_d`
				material = gtr136_pg_primary
				preset_layers = [
				]
			}
		]
	}
	{
		desc_id = gtr135_pg
		frontend_desc = qs(0x2f67e699)
		mesh = 0xdb345b38
		cap_textures = [
			{
				base_tex = `tex/models/car_instruments/guitars/heroes/gtr135_pg_d`
				material = 0xe3284016
				preset_layers = [
				]
			}
		]
	}
]
cas_guitar_pickups = [
	{
		desc_id = gtr_pkup_type1_blk_2
		frontend_desc = qs(0x6a91da12)
		mesh = `models/car_instruments/guitar/esp/gtr_pkup_type1_blk_2`
		materials = [
			gtr_pkup_type1_blk_primary
		]
	}
	{
		desc_id = gtr1_esp_emg_pkup_2
		sponsor_id = emg
		frontend_desc = qs(0x03c19c14)
		mesh = `models/car_instruments/guitar/esp/gtr1_esp_emg_pkup_2`
		materials = [
			gtr1_esp_emg_pkup_2_primary
		]
	}
	{
		desc_id = gtr62_esp_emg
		frontend_desc = qs(0x03c19c14)
		sponsor_id = emg
		mesh = `models/car_instruments/guitar/esp/gtr62_esp_emg`
		materials = [
			gtr62_esp_emg_primary
		]
	}
	{
		desc_id = gtr62_pkup_blk
		frontend_desc = qs(0x6a91da12)
		mesh = `models/car_instruments/guitar/esp/gtr62_pkup_blk`
		materials = [
			gtr62_pkup_blk_primary
		]
	}
	{
		desc_id = gtr3_esp_emg_pkup_2
		sponsor_id = emg
		frontend_desc = qs(0x2dfa7ba5)
		mesh = `models/car_instruments/guitar/esp/gtr3_esp_emg_pkup_2`
		materials = [
			gtr3_esp_emg_pkup_2_primary
		]
	}
	{
		desc_id = gtr6_pkup_worngold_2
		frontend_desc = qs(0xc1b00264)
		mesh = `models/car_instruments/guitar/esp/gtr6_pkup_worngold_2`
		materials = [
			gtr6_pkup_worngold_primary
		]
	}
	{
		desc_id = gtr30_pickup_d
		frontend_desc = qs(0x551e5532)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr30_pickup_d`
		materials = [
			sd_hb_pickup01_primary
		]
	}
	{
		desc_id = gtr30_pickup_e
		frontend_desc = qs(0x2d12cb96)
		sponsor_id = `seymour	duncan`
		mesh = `models/car_instruments/guitar/esp/gtr30_pickup_e`
		materials = [
			sd_hb_pickup02_primary
		]
	}
	{
		desc_id = gtr30_pickup_f
		frontend_desc = qs(0x19dcb169)
		mesh = `models/car_instruments/guitar/esp/gtr30_pickup_f`
		materials = [
			gtr_pickup_type3_primary
		]
	}
	{
		desc_id = gtr30_pickup_g
		frontend_desc = qs(0x07d2f82d)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr30_pickup_g`
		materials = [
			gtr36_pickup01_primary
		]
	}
	{
		desc_id = gtr30_emg
		frontend_desc = qs(0xdb31d440)
		sponsor_id = emg
		mesh = `models/car_instruments/guitar/esp/gtr30_emg`
		materials = [
			gtr_emg_pickup3_primary
		]
	}
	{
		desc_id = gtr31_pickup_e
		frontend_desc = qs(0x2d12cb96)
		sponsor_id = `seymour	duncan`
		mesh = `models/car_instruments/guitar/esp/gtr31_pickup_e`
		materials = [
			sd_hb_pickup02_primary
		]
	}
	{
		desc_id = gtr31_pickup_d
		frontend_desc = qs(0x551e5532)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr31_pickup_d`
		materials = [
			sd_hb_pickup01_primary
		]
	}
	{
		desc_id = gtr31_pickup_g
		frontend_desc = qs(0x07d2f82d)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr31_pickup_g`
		materials = [
			gtr36_pickup01_primary
		]
	}
	{
		desc_id = gtr31_pickup_f
		frontend_desc = qs(0x08592cca)
		mesh = `models/car_instruments/guitar/esp/gtr31_pickup_f`
		materials = [
			gtr_pickup_type3_primary
		]
	}
	{
		desc_id = gtr31_emg
		frontend_desc = qs(0xdb31d440)
		sponsor_id = emg
		mesh = `models/car_instruments/guitar/esp/gtr31_emg`
		materials = [
			gtr_emg_pickup3_primary
		]
	}
	{
		desc_id = gtr32_pickup_f
		frontend_desc = qs(0x08592cca)
		mesh = `models/car_instruments/guitar/esp/gtr32_pickup_f`
		materials = [
			gtr_pickup_type3_primary
		]
	}
	{
		desc_id = gtr32_pickup_g
		frontend_desc = qs(0x07d2f82d)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr32_pickup_g`
		materials = [
			gtr36_pickup01_primary
		]
	}
	{
		desc_id = gtr32_emg
		frontend_desc = qs(0xdb31d440)
		sponsor_id = emg
		mesh = `models/car_instruments/guitar/esp/gtr32_emg`
		materials = [
			gtr_emg_pickup3_primary
		]
	}
	{
		desc_id = gtr33_emg
		frontend_desc = qs(0xdb31d440)
		sponsor_id = emg
		mesh = `models/car_instruments/guitar/esp/gtr33_pickup_emg`
		pak_num = 0
		materials = [
			gtr_emg_pickup3_primary
		]
	}
	{
		desc_id = gtr33_pickup_a
		frontend_desc = qs(0x07d2f82d)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr33_pickup_a`
		pak_num = 0
		materials = [
			gtr36_pickup01_primary
		]
	}
	{
		desc_id = gtr33_pickup_d
		frontend_desc = qs(0x551e5532)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr33_pickup_d`
		materials = [
			sd_hb_pickup01_primary
		]
	}
	{
		desc_id = gtr33_pickup_e
		frontend_desc = qs(0x2d12cb96)
		sponsor_id = `seymour	duncan`
		mesh = `models/car_instruments/guitar/esp/gtr33_pickup_e`
		materials = [
			sd_hb_pickup02_primary
		]
	}
	{
		desc_id = gtr33_pickup_f
		frontend_desc = qs(0x08592cca)
		mesh = `models/car_instruments/guitar/esp/gtr33_pickup_f`
		materials = [
			gtr_pickup_type3_primary
		]
	}
	{
		desc_id = gtr36_pickup
		frontend_desc = qs(0x07d2f82d)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr36_pickup`
		materials = [
			gtr36_pickup01_primary
		]
	}
	{
		desc_id = gtr36_pickup_d
		frontend_desc = qs(0xf6b10734)
		mesh = `models/car_instruments/guitar/esp/gtr36_pickup_d`
		materials = [
			sd_hb_pickup01_primary
		]
	}
	{
		desc_id = gtr36_pickup_e
		frontend_desc = qs(0x2d12cb96)
		sponsor_id = `seymour	duncan`
		mesh = `models/car_instruments/guitar/esp/gtr36_pickup_e`
		materials = [
			sd_hb_pickup02_primary
		]
	}
	{
		desc_id = gtr36_pickup_f
		frontend_desc = qs(0x08592cca)
		mesh = `models/car_instruments/guitar/esp/gtr36_pickup_f`
		materials = [
			gtr_pickup_type3_primary
		]
	}
	{
		desc_id = gtr36_emg
		frontend_desc = qs(0xdb31d440)
		sponsor_id = emg
		mesh = `models/car_instruments/guitar/esp/gtr36_emg`
		materials = [
			gtr_emg_pickup3_primary
		]
	}
	{
		desc_id = gtr37_pickup
		frontend_desc = qs(0x561b263a)
		mesh = `models/car_instruments/guitar/esp/gtr37_pickup1`
		materials = [
			gtr37_pickup01_primary
		]
	}
	{
		desc_id = gtr38_pickup
		frontend_desc = qs(0xdb31d440)
		sponsor_id = emg
		mesh = `models/car_instruments/guitar/esp/gtr38_esp_emg`
		pak_num = 0
		materials = [
			gtr_emg_pickup3_primary
		]
	}
	{
		desc_id = gtr37_pickup_d
		frontend_desc = qs(0x551e5532)
		sponsor_id = esp
		mesh = `models/car_instruments/guitar/esp/gtr37_pickup_d`
		materials = [
			sd_hb_pickup01_primary
		]
	}
	{
		desc_id = gtr37_pickup_e
		frontend_desc = qs(0x2d12cb96)
		sponsor_id = `seymour	duncan`
		mesh = `models/car_instruments/guitar/esp/gtr37_pickup_e`
		materials = [
			sd_hb_pickup02_primary
		]
	}
	{
		desc_id = gtr37_pickup_f
		frontend_desc = qs(0x08592cca)
		mesh = `models/car_instruments/guitar/esp/gtr37_pickup_f`
		materials = [
			gtr31_pickup_chrm_primary
		]
	}
	{
		desc_id = gtr_pickup_type66
		frontend_desc = qs(0x4973cdf5)
		mesh = `models/car_instruments/guitar/esp/gtr_pickup_type66`
		materials = [
			gtr_pickup_type66_primary
		]
	}
	{
		desc_id = gtr65_pickup_dummy
		frontend_desc = qs(0x4973cdf5)
		mesh = `models/car_instruments/guitar/esp/gtr65_pickup_dummy`
		materials = [
			gtr65_pickup_dummy_primary
		]
	}
	{
		desc_id = None
		frontend_desc = qs(0x9c1b5214)
		random_weight = 10.0
	}
	{
		desc_id = gtr10_pickup_mcswain_1
		frontend_desc = qs(0x69e0a7bf)
		sponsor_id = mcswain
		materials = [
			gtr10_pickup_mcswain_primary
		]
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr10_mcswain_flame
						gtr11_mcswain_carved
						gtr12_mcswain_minferno
						gtr13_mcswain_machine
						gtr14_mcswain_life
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr10_pickup_mcswain_1`
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
		desc_id = gtr_pickup_type2_02
		frontend_desc = qs(0x4f1e843a)
		materials = [
			gtr_pickup_type2_02_primary
		]
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr10_mcswain_flame
						gtr11_mcswain_carved
						gtr12_mcswain_minferno
						gtr13_mcswain_machine
						gtr14_mcswain_life
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_pickup_type2_02`
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
		desc_id = gtr_pickup_type3_blk
		frontend_desc = qs(0x8ebbb0a5)
		sponsor_id = `seymour	duncan`
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr10_mcswain_flame
						gtr11_mcswain_carved
						gtr12_mcswain_minferno
						gtr13_mcswain_machine
						gtr14_mcswain_life
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_pickup_type3_blk`
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
		desc_id = gtr_pickup_type3_blk2
		frontend_desc = qs(0x847169e6)
		sponsor_id = mcswain
		materials = [
			gtr_pickup_type1_blk_primary
		]
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr14_mcswain_life
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_pickup_type1_blk_2`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_pickup_type3_blk2`
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
		desc_id = gtr_emg_pickup1
		frontend_desc = qs(0x61390a51)
		sponsor_id = emg
		materials = [
			gtr_emg_pickup1_primary
		]
		locked
		chosen_materials = {
			material1 = black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr1_sch_tempest
						gtr72_sch_devil
						gtr73_sch_s1
						gtr74_sch_star
						gtr86_mm_axis
						gtr78_prs_sc
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_emg_pickup1`
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
						gtr70_sch_ultra
						gtr71_sch_c1
						gtr76_ibz_s5470
						gtr77_ibz_rg
						gtr84_mm_petrucci
						gtr83_prs_stla
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_emg_pickup1`
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
						gtr83_prs_stla
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_emg_pickup1`
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
						gtr75_ibz_xpt
						gtr92_dr_star
						gtr90_dr_daisy
						gtr93_dr_siren
						gtr178_ibz_ict
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_emg_pickup1`
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
						gtr94_dr_tomboy
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_emg_pickup1`
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
						gtr20_bc_rich_beast
						gtr21_bc_rich_warbeast
						gtr22_bc_rich_warlock
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_emg_pickup1`
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
						gtr_32_body_new
						gtr_31_viper_new
						gtr64_esp_f
						gtr63f_esp_ex
						gtr62_esp_alexi
						gtr33d_base
						gtr39_esp_nv
						gtr12_esp_v_01
						gtr4_esp_eclipse_01
						gtr9_esp_ax
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_emg_pickup1`
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
						gtr79_prs_cstm24
						gtr81_prs_miramt
						gtr79_prs_cstm24
						gtr80_prs_sant
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_emg_pickup1`
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
						gtr14_mcswain_life
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_emg_pickup1`
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
						gtr39_esp_nv
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_emg_pickup1`
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
						gtr13_mcswain_machine
						gtr12_mcswain_minferno
						gtr11_mcswain_carved
						gtr10_mcswain_flame
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_emg_pickup1`
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
		desc_id = gtr_emg_pickup2
		frontend_desc = qs(0x548cdfee)
		sponsor_id = emg
		materials = [
			gtr_emg_pickup1_primary
		]
		chosen_materials = {
			material1 = black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr1_sch_tempest
						gtr70_sch_ultra
						gtr71_sch_c1
						gtr72_sch_devil
						gtr73_sch_s1
						gtr74_sch_star
						gtr75_ibz_xpt
						gtr76_ibz_s5470
						gtr77_ibz_rg
						gtr90_dr_daisy
						gtr92_dr_star
						gtr93_dr_siren
						gtr94_dr_tomboy
						gtr86_mm_axis
						gtr84_mm_petrucci
						gtr78_prs_sc
						gtr79_prs_cstm24
						gtr80_prs_sant
						gtr81_prs_miramt
						gtr178_ibz_ict
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_emg_pickup2`
							attach_indices = [
								1
								5
							]
						}
					]
				}
				{
					parents = [
						gtr40_px_body
						gtr180_richbich
						gtr_32_body_new
						gtr64_esp_f
						gtr63f_esp_ex
						gtr62_esp_alexi
						gtr37_rw01_new
						gtr33d_base
						gtr_31_viper_new
						gtr39_esp_nv
						gtr4_esp_eclipse_01
						gtr12_esp_v_01
						gtr9_esp_ax
						gtr20_bc_rich_beast
						gtr21_bc_rich_warbeast
						gtr22_bc_rich_warlock
						gtr180_richbich
						gtr39_esp_nv
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_emg_pickup2`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						gtr83_prs_stla
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_emg_pickup2`
							attach_indices = [
								1
								3
							]
						}
					]
				}
				{
					parents = [
						gtr14_mcswain_life
						gtr13_mcswain_machine
						gtr12_mcswain_minferno
						gtr11_mcswain_carved
						gtr10_mcswain_flame
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_emg_pickup2`
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
		desc_id = gtr_emg_pickup4
		frontend_desc = qs(0x500e1714)
		sponsor_id = emg
		materials = [
			gtr_emg_pickup1_primary
		]
		chosen_materials = {
			material1 = black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr40_px_body
						gtr_32_body_new
						gtr64_esp_f
						gtr63f_esp_ex
						gtr62_esp_alexi
						gtr39_esp_nv
						gtr33d_base
						gtr_31_viper_new
						gtr4_esp_eclipse_01
						gtr12_esp_v_01
						gtr9_esp_ax
						gtr1_sch_tempest
						gtr70_sch_ultra
						gtr71_sch_c1
						gtr72_sch_devil
						gtr73_sch_s1
						gtr74_sch_star
						gtr75_ibz_xpt
						gtr76_ibz_s5470
						gtr77_ibz_rg
						gtr90_dr_daisy
						gtr91_dr_heart
						gtr92_dr_star
						gtr93_dr_siren
						gtr94_dr_tomboy
						gtr20_bc_rich_beast
						gtr21_bc_rich_warbeast
						gtr22_bc_rich_warlock
						gtr86_mm_axis
						gtr84_mm_petrucci
						gtr11_mcswain_carved
						gtr10_mcswain_flame
						gtr13_mcswain_machine
						gtr12_mcswain_minferno
						gtr14_mcswain_life
						gtr78_prs_sc
						gtr80_prs_sant
						gtr79_prs_cstm24
						gtr81_prs_miramt
						gtr83_prs_stla
						gtr108_casket
						gtr109_metal
						gtr180_richbich
						gtr178_ibz_ict
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_emg_pickup2`
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
		desc_id = gtr_emg_pickup5
		frontend_desc = qs(0xd034ed70)
		sponsor_id = emg
		materials = [
			gtr_emg_pickup6_primary
		]
		chosen_materials = {
			material1 = black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr1_sch_tempest
						gtr72_sch_devil
						gtr73_sch_s1
						gtr74_sch_star
						gtr91_dr_heart
						gtr86_mm_axis
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_emg_pickup6b`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_emg_pickup6`
							attach_indices = [
								3
								5
							]
						}
					]
				}
				{
					parents = [
						gtr70_sch_ultra
						gtr71_sch_c1
						gtr76_ibz_s5470
						gtr77_ibz_rg
						gtr84_mm_petrucci
						gtr83_prs_stla
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_emg_pickup6b`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_emg_pickup6`
							attach_indices = [
								2
								5
							]
						}
					]
				}
				{
					parents = [
						gtr_32_body_new
						gtr64_esp_f
						gtr63f_esp_ex
						gtr62_esp_alexi
						gtr33d_base
						gtr_31_viper_new
						gtr39_esp_nv
						gtr83_prs_stla
						gtr12_esp_v_01
						gtr4_esp_eclipse_01
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_emg_pickup6b`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_emg_pickup6`
							attach_indices = [
								2
								3
							]
						}
					]
				}
				{
					parents = [
						gtr75_ibz_xpt
						gtr90_dr_daisy
						gtr92_dr_star
						gtr93_dr_siren
						gtr94_dr_tomboy
						gtr178_ibz_ict
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_emg_pickup6b`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_emg_pickup6`
							attach_indices = [
								6
								5
							]
						}
					]
				}
				{
					parents = [
						gtr180_richbich
						gtr20_bc_rich_beast
						gtr21_bc_rich_warbeast
						gtr22_bc_rich_warlock
						gtr10_mcswain_flame
						gtr9_esp_ax
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_emg_pickup6b`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_emg_pickup6`
							attach_indices = [
								3
								2
							]
						}
					]
				}
				{
					parents = [
						gtr14_mcswain_life
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_emg_pickup6b`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_emg_pickup6`
							attach_indices = [
								6
								7
							]
						}
					]
				}
				{
					parents = [
						gtr13_mcswain_machine
						gtr12_mcswain_minferno
						gtr11_mcswain_carved
						gtr10_mcswain_flame
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_emg_pickup6b`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_emg_pickup6`
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
		desc_id = gtr_emg_pickup6
		frontend_desc = qs(0x388e3f46)
		sponsor_id = emg
		materials = [
			gtr_emg_pickup3_primary
		]
		locked
		chosen_materials = {
			material1 = black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr1_sch_tempest
						gtr70_sch_ultra
						gtr71_sch_c1
						gtr72_sch_devil
						gtr73_sch_s1
						gtr74_sch_star
						gtr75_ibz_xpt
						gtr76_ibz_s5470
						gtr77_ibz_rg
						gtr90_dr_daisy
						gtr92_dr_star
						gtr93_dr_siren
						gtr94_dr_tomboy
						gtr86_mm_axis
						gtr84_mm_petrucci
						gtr78_prs_sc
						gtr79_prs_cstm24
						gtr80_prs_sant
						gtr81_prs_miramt
						gtr178_ibz_ict
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_emg_pickup3`
							attach_indices = [
								1
								5
							]
						}
					]
				}
				{
					parents = [
						gtr83_prs_stla
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_emg_pickup3`
							attach_indices = [
								1
								3
							]
						}
					]
				}
				{
					parents = [
						gtr40_px_body
						gtr_32_body_new
						gtr64_esp_f
						gtr63f_esp_ex
						gtr62_esp_alexi
						gtr39_esp_nv
						gtr33d_base
						gtr_31_viper_new
						gtr4_esp_eclipse_01
						gtr9_esp_ax
						gtr20_bc_rich_beast
						gtr21_bc_rich_warbeast
						gtr22_bc_rich_warlock
						gtr10_mcswain_flame
						gtr14_mcswain_life
						gtr12_esp_v_01
						gtr180_richbich
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_emg_pickup3`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						gtr14_mcswain_life
						gtr13_mcswain_machine
						gtr12_mcswain_minferno
						gtr11_mcswain_carved
						gtr10_mcswain_flame
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_emg_pickup3`
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
		desc_id = gtr_emg_pickup3
		frontend_desc = qs(0x3c0cf7bc)
		sponsor_id = emg
		materials = [
			gtr_emg_pickup3_primary
		]
		locked
		chosen_materials = {
			material1 = black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr40_px_body
						gtr_32_body_new
						gtr64_esp_f
						gtr63f_esp_ex
						gtr62_esp_alexi
						gtr39_esp_nv
						gtr33d_base
						gtr_31_viper_new
						gtr9_esp_ax
						gtr4_esp_eclipse_01
						gtr1_sch_tempest
						gtr70_sch_ultra
						gtr71_sch_c1
						gtr72_sch_devil
						gtr73_sch_s1
						gtr74_sch_star
						gtr75_ibz_xpt
						gtr76_ibz_s5470
						gtr77_ibz_rg
						gtr90_dr_daisy
						gtr91_dr_heart
						gtr92_dr_star
						gtr93_dr_siren
						gtr94_dr_tomboy
						gtr20_bc_rich_beast
						gtr21_bc_rich_warbeast
						gtr22_bc_rich_warlock
						gtr82_prs_se1
						gtr86_mm_axis
						gtr84_mm_petrucci
						gtr11_mcswain_carved
						gtr10_mcswain_flame
						gtr13_mcswain_machine
						gtr12_mcswain_minferno
						gtr14_mcswain_life
						gtr78_prs_sc
						gtr80_prs_sant
						gtr79_prs_cstm24
						gtr81_prs_miramt
						gtr83_prs_stla
						gtr12_esp_v_01
						gtr178_ibz_ict
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_emg_pickup3`
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
		desc_id = gtr78_pickup1
		frontend_desc = qs(0xb84da57b)
		materials = [
			gtr78_pickupkurt_primary
		]
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr78_kurt
						gtr180_richbich
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr78_pickup1`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr78_pickup2`
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
		desc_id = gtr_pickup_sd01
		frontend_desc = qs(0x1c166dfb)
		sponsor_id = `seymour	duncan`
		materials = [
			gtr_pickup_sd01_primary
		]
		locked
		chosen_materials = {
			material1 = black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr1_sch_tempest
						gtr70_sch_ultra
						gtr71_sch_c1
						gtr72_sch_devil
						gtr73_sch_s1
						gtr74_sch_star
						gtr75_ibz_xpt
						gtr76_ibz_s5470
						gtr77_ibz_rg
						gtr90_dr_daisy
						gtr92_dr_star
						gtr93_dr_siren
						gtr94_dr_tomboy
						gtr86_mm_axis
						gtr84_mm_petrucci
						gtr78_prs_sc
						gtr79_prs_cstm24
						gtr80_prs_sant
						gtr81_prs_miramt
						gtr178_ibz_ict
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_pickup_sd01`
							attach_indices = [
								5
							]
						}
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_pickup_sd02`
							attach_indices = [
								1
							]
						}
					]
				}
				{
					parents = [
						gtr40_px_body
						gtr_32_body_new
						gtr64_esp_f
						gtr63f_esp_ex
						gtr62_esp_alexi
						gtr39_esp_nv
						gtr33d_base
						gtr_31_viper_new
						gtr9_esp_ax
						gtr20_bc_rich_beast
						gtr21_bc_rich_warbeast
						gtr22_bc_rich_warlock
						gtr4_esp_eclipse_01
						gtr12_esp_v_01
						gtr180_richbich
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_pickup_sd01`
							attach_indices = [
								2
							]
						}
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_pickup_sd02`
							attach_indices = [
								1
							]
						}
					]
				}
				{
					parents = [
						gtr83_prs_stla
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_pickup_sd01`
							attach_indices = [
								3
							]
						}
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_pickup_sd02`
							attach_indices = [
								1
							]
						}
					]
				}
				{
					parents = [
						gtr10_mcswain_flame
						gtr14_mcswain_life
						gtr12_mcswain_minferno
						gtr11_mcswain_carved
						gtr13_mcswain_machine
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_pickup_sd01`
							attach_indices = [
								7
							]
						}
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_pickup_sd02`
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
		desc_id = gtr_pickup_sd06
		frontend_desc = qs(0x3908d59e)
		sponsor_id = `seymour	duncan`
		materials = [
			gtr_pickup_sd01_primary
		]
		chosen_materials = {
			material1 = black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr1_sch_tempest
						gtr70_sch_ultra
						gtr71_sch_c1
						gtr72_sch_devil
						gtr73_sch_s1
						gtr74_sch_star
						gtr75_ibz_xpt
						gtr76_ibz_s5470
						gtr77_ibz_rg
						gtr90_dr_daisy
						gtr92_dr_star
						gtr93_dr_siren
						gtr94_dr_tomboy
						gtr86_mm_axis
						gtr84_mm_petrucci
						gtr78_prs_sc
						gtr79_prs_cstm24
						gtr80_prs_sant
						gtr81_prs_miramt
						gtr178_ibz_ict
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_pickup_sd01`
							attach_indices = [
								5
								1
							]
						}
					]
				}
				{
					parents = [
						gtr40_px_body
						gtr_32_body_new
						gtr64_esp_f
						gtr63f_esp_ex
						gtr62_esp_alexi
						gtr39_esp_nv
						gtr33d_base
						gtr_31_viper_new
						gtr4_esp_eclipse_01
						gtr12_esp_v_01
						gtr9_esp_ax
						gtr20_bc_rich_beast
						gtr21_bc_rich_warbeast
						gtr22_bc_rich_warlock
						gtr180_richbich
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_pickup_sd01`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						gtr83_prs_stla
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_pickup_sd01`
							attach_indices = [
								3
								1
							]
						}
					]
				}
				{
					parents = [
						gtr14_mcswain_life
						gtr13_mcswain_machine
						gtr12_mcswain_minferno
						gtr11_mcswain_carved
						gtr10_mcswain_flame
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_pickup_sd01`
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
		desc_id = gtr130_pickup
		frontend_desc = qs(0x3908d59e)
		sponsor_id = `seymour	duncan`
		materials = [
			gtr_pickup_sd01_primary
		]
		chosen_materials = {
			material1 = black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr130_steampunk
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_pickup_sd01`
							attach_indices = [
								5
								1
							]
						}
					]
				}
			]
		}
	}
	{
		desc_id = gtr_pickup_sd06b
		frontend_desc = qs(0x3d8a1d64)
		sponsor_id = `seymour	duncan`
		materials = [
			gtr_pickup_sd01_primary
		]
		chosen_materials = {
			material1 = black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr40_px_body
						gtr_32_body_new
						gtr64_esp_f
						gtr63f_esp_ex
						gtr62_esp_alexi
						gtr39_esp_nv
						gtr33d_base
						gtr_31_viper_new
						gtr4_esp_eclipse_01
						gtr12_esp_v_01
						gtr9_esp_ax
						gtr1_sch_tempest
						gtr70_sch_ultra
						gtr71_sch_c1
						gtr72_sch_devil
						gtr73_sch_s1
						gtr74_sch_star
						gtr75_ibz_xpt
						gtr76_ibz_s5470
						gtr77_ibz_rg
						gtr90_dr_daisy
						gtr91_dr_heart
						gtr92_dr_star
						gtr93_dr_siren
						gtr94_dr_tomboy
						gtr20_bc_rich_beast
						gtr21_bc_rich_warbeast
						gtr22_bc_rich_warlock
						gtr86_mm_axis
						gtr84_mm_petrucci
						gtr11_mcswain_carved
						gtr10_mcswain_flame
						gtr13_mcswain_machine
						gtr12_mcswain_minferno
						gtr14_mcswain_life
						gtr79_prs_cstm24
						gtr78_prs_sc
						gtr80_prs_sant
						gtr81_prs_miramt
						gtr83_prs_stla
						gtr62_esp_alexi
						gtr180_richbich
						gtr178_ibz_ict
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_pickup_sd01`
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
		desc_id = gtr_pickup_sd05b
		frontend_desc = qs(0x778834af)
		sponsor_id = `seymour	duncan`
		materials = [
			gtr_pickup_sd01_primary
		]
		chosen_materials = {
			material1 = black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr1_sch_tempest
						gtr70_sch_ultra
						gtr71_sch_c1
						gtr72_sch_devil
						gtr73_sch_s1
						gtr74_sch_star
						gtr75_ibz_xpt
						gtr76_ibz_s5470
						gtr77_ibz_rg
						gtr90_dr_daisy
						gtr92_dr_star
						gtr93_dr_siren
						gtr94_dr_tomboy
						gtr86_mm_axis
						gtr84_mm_petrucci
						gtr78_prs_sc
						gtr79_prs_cstm24
						gtr80_prs_sant
						gtr81_prs_miramt
						gtr178_ibz_ict
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_pickup_sd05`
							attach_indices = [
								1
								5
							]
						}
					]
				}
				{
					parents = [
						gtr40_px_body
						gtr_32_body_new
						gtr64_esp_f
						gtr63f_esp_ex
						gtr62_esp_alexi
						gtr39_esp_nv
						gtr33d_base
						gtr_31_viper_new
						gtr4_esp_eclipse_01
						gtr12_esp_v_01
						gtr9_esp_ax
						gtr10_mcswain_flame
						gtr14_mcswain_life
						gtr20_bc_rich_beast
						gtr21_bc_rich_warbeast
						gtr22_bc_rich_warlock
						gtr180_richbich
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_pickup_sd05`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						gtr83_prs_stla
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_pickup_sd05`
							attach_indices = [
								1
								3
							]
						}
					]
				}
				{
					parents = [
						gtr14_mcswain_life
						gtr13_mcswain_machine
						gtr12_mcswain_minferno
						gtr11_mcswain_carved
						gtr10_mcswain_flame
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_pickup_sd05`
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
		desc_id = gtr_pickup_sd05
		frontend_desc = qs(0xd4cee2c9)
		sponsor_id = `seymour	duncan`
		materials = [
			gtr_pickup_sd01_primary
		]
		chosen_materials = {
			material1 = black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr40_px_body
						gtr180_richbich
						gtr_32_body_new
						gtr64_esp_f
						gtr63f_esp_ex
						gtr62_esp_alexi
						gtr39_esp_nv
						gtr33d_base
						gtr_31_viper_new
						gtr4_esp_eclipse_01
						gtr12_esp_v_01
						gtr9_esp_ax
						gtr1_sch_tempest
						gtr70_sch_ultra
						gtr71_sch_c1
						gtr72_sch_devil
						gtr73_sch_s1
						gtr74_sch_star
						gtr75_ibz_xpt
						gtr76_ibz_s5470
						gtr77_ibz_rg
						gtr90_dr_daisy
						gtr91_dr_heart
						gtr92_dr_star
						gtr93_dr_siren
						gtr94_dr_tomboy
						gtr20_bc_rich_beast
						gtr21_bc_rich_warbeast
						gtr22_bc_rich_warlock
						gtr86_mm_axis
						gtr84_mm_petrucci
						gtr11_mcswain_carved
						gtr10_mcswain_flame
						gtr13_mcswain_machine
						gtr12_mcswain_minferno
						gtr14_mcswain_life
						gtr79_prs_cstm24
						gtr78_prs_sc
						gtr80_prs_sant
						gtr81_prs_miramt
						gtr83_prs_stla
						gtr178_ibz_ict
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_pickup_sd05`
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
		desc_id = gtr_pickup_sd03
		frontend_desc = qs(0x3eccb392)
		sponsor_id = `seymour	duncan`
		materials = [
			gtr_pickup_sd03_primary
		]
		locked
		chosen_materials = {
			material1 = black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr1_sch_tempest
						gtr70_sch_ultra
						gtr71_sch_c1
						gtr72_sch_devil
						gtr73_sch_s1
						gtr74_sch_star
						gtr75_ibz_xpt
						gtr76_ibz_s5470
						gtr77_ibz_rg
						gtr90_dr_daisy
						gtr92_dr_star
						gtr93_dr_siren
						gtr94_dr_tomboy
						gtr86_mm_axis
						gtr84_mm_petrucci
						gtr78_prs_sc
						gtr79_prs_cstm24
						gtr80_prs_sant
						gtr81_prs_miramt
						gtr178_ibz_ict
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_pickup_sd03`
							attach_indices = [
								1
								5
							]
						}
					]
				}
				{
					parents = [
						gtr40_px_body
						gtr_32_body_new
						gtr64_esp_f
						gtr63f_esp_ex
						gtr62_esp_alexi
						gtr39_esp_nv
						gtr33d_base
						gtr_31_viper_new
						gtr4_esp_eclipse_01
						gtr9_esp_ax
						gtr14_mcswain_life
						gtr20_bc_rich_beast
						gtr21_bc_rich_warbeast
						gtr22_bc_rich_warlock
						gtr12_esp_v_01
						gtr180_richbich
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_pickup_sd03`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						gtr83_prs_stla
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_pickup_sd03`
							attach_indices = [
								1
								3
							]
						}
					]
				}
				{
					parents = [
						gtr14_mcswain_life
						gtr13_mcswain_machine
						gtr12_mcswain_minferno
						gtr11_mcswain_carved
						gtr10_mcswain_flame
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_pickup_sd03`
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
		desc_id = gtr_pickup_sd04
		frontend_desc = qs(0xb21afdc3)
		sponsor_id = `seymour	duncan`
		materials = [
			gtr_pickup_sd01_primary
		]
		chosen_materials = {
			material1 = black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr1_sch_tempest
						gtr70_sch_ultra
						gtr71_sch_c1
						gtr72_sch_devil
						gtr73_sch_s1
						gtr74_sch_star
						gtr75_ibz_xpt
						gtr76_ibz_s5470
						gtr77_ibz_rg
						gtr90_dr_daisy
						gtr92_dr_star
						gtr93_dr_siren
						gtr94_dr_tomboy
						gtr86_mm_axis
						gtr84_mm_petrucci
						gtr78_prs_sc
						gtr79_prs_cstm24
						gtr80_prs_sant
						gtr81_prs_miramt
						gtr178_ibz_ict
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_pickup_sd04`
							attach_indices = [
								1
								5
							]
						}
					]
				}
				{
					parents = [
						gtr40_px_body
						gtr_32_body_new
						gtr64_esp_f
						gtr63f_esp_ex
						gtr62_esp_alexi
						gtr39_esp_nv
						gtr33d_base
						gtr_31_viper_new
						gtr4_esp_eclipse_01
						gtr12_esp_v_01
						gtr9_esp_ax
						gtr10_mcswain_flame
						gtr14_mcswain_life
						gtr180_richbich
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_pickup_sd04`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						gtr83_prs_stla
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_pickup_sd04`
							attach_indices = [
								1
								3
							]
						}
					]
				}
				{
					parents = [
						gtr14_mcswain_life
						gtr13_mcswain_machine
						gtr12_mcswain_minferno
						gtr11_mcswain_carved
						gtr10_mcswain_flame
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_pickup_sd04`
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
		desc_id = gtr_pickup_sd04b
		frontend_desc = qs(0x01e4725f)
		sponsor_id = `seymour	duncan`
		materials = [
			gtr_pickup_sd01_primary
		]
		chosen_materials = {
			material1 = grey_2guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr40_px_body
						gtr_32_body_new
						gtr64_esp_f
						gtr63f_esp_ex
						gtr62_esp_alexi
						gtr39_esp_nv
						gtr33d_base
						gtr_31_viper_new
						gtr4_esp_eclipse_01
						gtr9_esp_ax
						gtr20_bc_rich_beast
						gtr21_bc_rich_warbeast
						gtr22_bc_rich_warlock
						gtr180_richbich
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_pickup_sd04`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_pickup_sd04b`
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
		desc_id = gtr_pickup_bc01
		frontend_desc = qs(0x6c5a9397)
		sponsor_id = rockfield
		materials = [
			gtr_pickup_bc01_primary
		]
		chosen_materials = {
			material1 = black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr20_bc_rich_beast
						gtr21_bc_rich_warbeast
						gtr22_bc_rich_warlock
						gtr180_richbich
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_pickup_bc01`
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
		desc_id = gtr_pickup_bc01b
		frontend_desc = qs(0x68d85b6d)
		sponsor_id = rockfield
		materials = [
			gtr_pickup_bc01_primary
		]
		chosen_materials = {
			material1 = black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr180_richbich
						gtr20_bc_rich_beast
						gtr21_bc_rich_warbeast
						gtr22_bc_rich_warlock
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_pickup_bc01`
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
		desc_id = gtr180_pickup01
		frontend_desc = qs(0x8d07dd2d)
		sponsor_id = None
		materials = [
			gtr180_pickup_primary
		]
		chosen_materials = {
			material1 = grey_4guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr180_richbich
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/bc_rich/gtr180_pickup01`
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
		desc_id = gtr_pickup_bc02
		frontend_desc = qs(0x49ed9fae)
		materials = [
			gtr_pickup_bc01_primary
		]
		chosen_materials = {
			material1 = black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr20_bc_rich_beast
						gtr21_bc_rich_warbeast
						gtr22_bc_rich_warlock
						gtr180_richbich
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_pickup_bc01`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_pickup_bc02`
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
		desc_id = gtr_pickup_type2_paf1
		frontend_desc = qs(0x17f242c5)
		sponsor_id = `seymour	duncan`
		materials = [
			gtr_pickup_type2_01_primary
		]
		chosen_materials = {
			material1 = black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr39_esp_nv
						gtr40_px_body
						gtr94_dr_tomboy
						gtr86_mm_axis
						gtr75_ibz_xpt
						gtr10_mcswain_flame
						gtr11_mcswain_carved
						gtr14_mcswain_life
						gtr12_mcswain_minferno
						gtr13_mcswain_machine
						gtr1_sch_tempest
						gtr72_sch_devil
						gtr74_sch_star
						gtr73_sch_s1
						gtr180_richbich
						gtr178_ibz_ict
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_pickup_type2_01`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						gtr93_dr_siren
						gtr84_mm_petrucci
						gtr70_sch_ultra
						gtr90_dr_daisy
						gtr92_dr_star
						gtr93_dr_siren
						gtr76_ibz_s5470
						gtr77_ibz_rg
						gtr71_sch_c1
						gtr178_ibz_ict
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_pickup_type2_01`
							attach_indices = [
								1
								3
							]
						}
					]
				}
				{
					parents = [
						gtr20_bc_rich_beast
						gtr21_bc_rich_warbeast
						gtr22_bc_rich_warlock
						gtr9_esp_ax
						gtr4_esp_eclipse_01
						gtr63f_esp_ex
						gtr12_esp_v_01
						gtr62_esp_alexi
						gtr64_esp_f
						gtr33d_base
						gtr_32_body_new
						gtr_31_viper_new
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_pickup_type2_01`
							attach_indices = [
								1
								5
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
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_pickup_type2_01`
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
		desc_id = gtr_pickup_type2_paf2
		frontend_desc = qs(0x13708a3f)
		sponsor_id = `seymour	duncan`
		materials = [
			gtr_pickup_type2_01_primary
		]
		chosen_materials = {
			material1 = black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr40_px_body
						gtr180_richbich
						gtr_32_body_new
						gtr64_esp_f
						gtr63f_esp_ex
						gtr62_esp_alexi
						gtr_31_viper_new
						gtr39_esp_nv
						gtr33d_base
						gtr4_esp_eclipse_01
						gtr12_esp_v_01
						gtr9_esp_ax
						gtr82_prs_se1
						gtr70_sch_ultra
						gtr20_bc_rich_beast
						gtr21_bc_rich_warbeast
						gtr22_bc_rich_warlock
						gtr90_dr_daisy
						gtr91_dr_heart
						gtr92_dr_star
						gtr93_dr_siren
						gtr75_ibz_xpt
						gtr76_ibz_s5470
						gtr77_ibz_rg
						gtr10_mcswain_flame
						gtr11_mcswain_carved
						gtr12_mcswain_minferno
						gtr13_mcswain_machine
						gtr14_mcswain_life
						gtr78_prs_sc
						gtr79_prs_cstm24
						gtr80_prs_sant
						gtr81_prs_miramt
						gtr1_sch_tempest
						gtr71_sch_c1
						gtr72_sch_devil
						gtr73_sch_s1
						gtr74_sch_star
						gtr83_prs_stla
						gtr94_dr_tomboy
						gtr83_prs_stla
						gtr178_ibz_ict
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_pickup_type2_01`
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
		desc_id = gtr70_sch_ultra_pickup2
		frontend_desc = qs(0x1964f74c)
		sponsor_id = `seymour	duncan`
		materials = [
			gtr70_sch_ultra_pickup_primary
		]
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr1_sch_tempest
						gtr72_sch_devil
						gtr83_prs_stla
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr70_sch_ultra_pickup`
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
		desc_id = gtr70_sch_ultra_pickup
		frontend_desc = qs(0x1de63fb6)
		sponsor_id = `seymour	duncan`
		materials = [
			gtr70_sch_ultra_pickup_primary
		]
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr64_esp_f
						gtr63f_esp_ex
						gtr62_esp_alexi
						gtr9_esp_ax
						gtr83_prs_stla
						gtr84_mm_petrucci
						gtr180_richbich
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr70_sch_ultra_pickup`
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
						gtr72_sch_devil
						gtr73_sch_s1
						gtr74_sch_star
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr70_sch_ultra_pickup`
							attach_indices = [
								1
								5
							]
						}
					]
				}
				{
					parents = [
						gtr70_sch_ultra
						gtr71_sch_c1
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr70_sch_ultra_pickup`
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
		desc_id = gtr70_sch_ultra_pickup3
		frontend_desc = qs(0xa6a45fe6)
		sponsor_id = `seymour	duncan`
		materials = [
			gtr70_sch_ultra_pickup_primary
		]
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr70_sch_ultra
						gtr71_sch_c1
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr70_sch_ultra_pickup`
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
		desc_id = gtr76_pickupa
		frontend_desc = qs(0xdc4c4b7d)
		materials = [
			gtr76_pickupa_primary
		]
		chosen_materials = {
			material1 = black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr76_ibz_s5470
						gtr83_prs_stla
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr76_pickupc`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr76_pickupb`
							attach_indices = [
								2
							]
						}
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr76_pickupa`
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
		desc_id = gtr76_pickupb
		frontend_desc = qs(0x1f1cdaf6)
		materials = [
			gtr76_pickupa_primary
		]
		chosen_materials = {
			material1 = black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr77_ibz_rg
						gtr83_prs_stla
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr76_pickupd`
							attach_indices = [
								1
								3
							]
						}
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr76_pickupb`
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
		desc_id = gtr78_pickup
		frontend_desc = qs(0xdb411784)
		materials = [
			gtr78_pickup_primary
		]
		chosen_materials = {
			material1 = black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr75_ibz_xpt
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr78_pickupb`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr78_pickup`
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
		desc_id = gtr_pickup_type2_prs
		frontend_desc = qs(0x071b442e)
		sponsor_id = prs
		materials = [
			gtr_pickup_type2_01_primary
		]
		chosen_materials = {
			material1 = yellow_4guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr78_prs_sc
						gtr79_prs_cstm24
						gtr81_prs_miramt
						gtr80_prs_sant
						gtr83_prs_stla
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_pickup_type2_01`
							attach_indices = [
								1
								3
							]
						}
					]
				}
				{
					parents = [
						gtr78_prs_sc
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_pickup_type2_01`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						gtr82_prs_se1
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_pickup_type2_01`
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
		desc_id = gtr76_pickupa_b
		frontend_desc = qs(0xdc4c4b7d)
		materials = [
			gtr76_pickupa_primary
		]
		chosen_materials = {
			material1 = black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr83_prs_stla
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr76_pickupc`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr76_pickupb`
							attach_indices = [
								2
							]
						}
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr76_pickupa`
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
		desc_id = gtr76_pickupb_b
		frontend_desc = qs(0x1f1cdaf6)
		materials = [
			gtr76_pickupa_primary
		]
		chosen_materials = {
			material1 = black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr83_prs_stla
						gtr84_mm_petrucci
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr76_pickupd`
							attach_indices = [
								1
								3
							]
						}
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr76_pickupb`
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
		desc_id = gtr78_pickup_b
		frontend_desc = qs(0xdb411784)
		materials = [
			gtr78_pickup_primary
		]
		chosen_materials = {
			material1 = black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr84_mm_petrucci
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr78_pickupb`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr78_pickup`
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
		desc_id = prs_pickup_hbucker
		frontend_desc = qs(0xd61aefe3)
		sponsor_id = prs
		materials = [
			prs_pickup_hbucker_primary
		]
		initial_values = {
			Color = grey_4guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr79_prs_cstm24
						gtr83_prs_stla
						gtr80_prs_sant
						gtr81_prs_miramt
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/prs_pickup_hbucker`
							attach_indices = [
								1
								3
							]
						}
					]
				}
				{
					parents = [
						gtr82_prs_se1
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/prs_pickup_hbucker`
							attach_indices = [
								1
							]
						}
					]
				}
				{
					parents = [
						gtr78_prs_sc
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/prs_pickup_hbucker`
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
		desc_id = gtr_pickup_soapbar
		frontend_desc = qs(0x8f26d9fa)
		sponsor_id = prs
		materials = [
			gtr_pickup_soapbar_primary
		]
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr82_prs_se1
						gtr180_richbich
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_pickup_soapbar`
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
		desc_id = gtr_pickup_prs001
		frontend_desc = qs(0x09939196)
		sponsor_id = prs
		materials = [
			gtr_pickup_sd01_primary
		]
		chosen_materials = {
			material1 = black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr78_prs_sc
						gtr79_prs_cstm24
						gtr78_prs_sc
						gtr80_prs_sant
						gtr81_prs_miramt
						gtr82_prs_se1
						gtr83_prs_stla
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_pickup_prs001`
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
		desc_id = gtr_pickup_prs001b
		frontend_desc = qs(0xda041de4)
		sponsor_id = prs
		materials = [
			gtr_pickup_sd01_primary
		]
		chosen_materials = {
			material1 = black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr78_prs_sc
						gtr79_prs_cstm24
						gtr80_prs_sant
						gtr81_prs_miramt
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_pickup_prs001`
							attach_indices = [
								5
								1
							]
						}
					]
				}
				{
					parents = [
						gtr83_prs_stla
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_pickup_prs001`
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
		desc_id = gtr76_pickupa_c
		frontend_desc = qs(0xdc4c4b7d)
		materials = [
			gtr76_pickupa_primary
		]
		chosen_materials = {
			material1 = black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr84_mm_petrucci
						gtr82_prs_se1
						gtr80_prs_sant
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr76_pickupc`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr76_pickupb`
							attach_indices = [
								2
							]
						}
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr76_pickupa`
							attach_indices = [
								3
							]
						}
					]
				}
				{
					parents = [
						gtr86_mm_axis
						gtr180_richbich
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr76_pickupc`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr76_pickupa`
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
		desc_id = gtr76_pickupb_c
		frontend_desc = qs(0x1f1cdaf6)
		materials = [
			gtr76_pickupa_primary
		]
		chosen_materials = {
			material1 = black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr83_prs_stla
						gtr84_mm_petrucci
						gtr80_prs_sant
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr76_pickupd`
							attach_indices = [
								1
								3
							]
						}
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr76_pickupb`
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
		desc_id = gtr78_pickup_c
		frontend_desc = qs(0xdb411784)
		materials = [
			gtr78_pickup_primary
		]
		chosen_materials = {
			material1 = black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr84_mm_petrucci
						gtr82_prs_se1
						gtr80_prs_sant
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr78_pickupb`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr78_pickup`
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
		desc_id = gtr84_pickup_a
		frontend_desc = qs(0x0137cc85)
		materials = [
			gtr84_mm_pickups_primary
		]
		chosen_materials = {
			material1 = black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr84_mm_petrucci
						gtr86_mm_axis
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr84_mm_pickup01`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr84_mm_pickup02`
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
		desc_id = gtr86_pickup
		frontend_desc = qs(0xc5e03a15)
		materials = [
			gtr86_pickup_primary
		]
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr86_mm_axis
						gtr180_richbich
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr86_pickup`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						gtr84_mm_petrucci
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr86_pickup`
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
		desc_id = gtr86_pickupb
		frontend_desc = qs(0xc162f2ef)
		materials = [
			gtr86_pickup_primary
		]
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr84_mm_petrucci
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr86_pickup`
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
		desc_id = gtr90_pickup1
		frontend_desc = qs(0xdc52067b)
		materials = [
			gtr90_pickup1_primary
		]
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr90_dr_daisy
						gtr91_dr_heart
						gtr92_dr_star
						gtr93_dr_siren
						gtr94_dr_tomboy
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr90_pickup1`
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
		desc_id = gtr90_pickup3
		frontend_desc = qs(0x6a991952)
		sponsor_id = `seymour	duncan`
		materials = [
			gtr90_pickup2_primary
		]
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr90_dr_daisy
						gtr92_dr_star
						gtr91_dr_heart
						gtr93_dr_siren
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr90_pickup2b`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr90_pickup2`
							attach_indices = [
								2
							]
						}
					]
				}
				{
					parents = [
						gtr94_dr_tomboy
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr90_pickup2b`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr90_pickup2`
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
		desc_id = gtr94_pickup
		frontend_desc = qs(0xfe3ac904)
		materials = [
			gtr94_pickup_primary
		]
		chosen_materials = {
			material1 = black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr94_dr_tomboy
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr94_pickupa`
							attach_indices = [
								3
							]
						}
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr94_pickupb`
							attach_indices = [
								2
							]
						}
					]
				}
				{
					parents = [
						gtr90_dr_daisy
						gtr92_dr_star
						gtr93_dr_siren
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr94_pickupa`
							attach_indices = [
								4
							]
						}
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr94_pickupb`
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
		desc_id = gtr25_2pickups
		frontend_desc = qs(0xc5867730)
		materials = [
			gtr_pickup_manson_1_primary
		]
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr25_manson_bellamy
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_pickup_manson_1`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_pickup_manson_2`
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
		desc_id = gtr1b_pickup_sk8
		frontend_desc = qs(0x0c88c02c)
		materials = [
			gtr1b_pickup_sk8_primary
		]
		chosen_materials = {
			material1 = black_1guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr1b_nvsft_sk8gtr
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/heroes/gtr1b_pickup_sk8`
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
		desc_id = gtr131_pickup
		frontend_desc = qs(0x14f95af9)
		materials = [
			gtr131_pickup_primary
		]
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr131_steel
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr131_pickup`
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
		desc_id = gtr132_pickup
		frontend_desc = qs(0x2a26573d)
		materials = [
			gtr132_pickup_primary
		]
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr132_axe
					]
					node_set = 0
					meshes = [
						{
							mesh = 0xb066847c
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
		desc_id = gtr133_pickup
		frontend_desc = qs(0x2f67e699)
		materials = [
			gtr133_pickup_primary
		]
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr133_tiki
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr133_pickup`
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
		desc_id = gtr142_pickup
		frontend_desc = qs(0x048d80b3)
		materials = [
			gtr142_vtwin_pickup_primary
		]
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr142_vtwin
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/heroes/gtr142_pickup`
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
		desc_id = gtr136_pickup
		frontend_desc = qs(0x500e1714)
		materials = [
			gtr136_pickup_primary
		]
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr136_glass
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr136_pickup`
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
		desc_id = gtr_pickup_johnny
		frontend_desc = qs(0x3d8a1d64)
		sponsor_id = `seymour	duncan`
		materials = [
			gtr_pickup_johnny_primary
		]
		chosen_materials = {
			material1 = yellow_4guitar
		}
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr135_johnny
					]
					node_set = 0
					meshes = [
						{
							mesh = 0x5265a959
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
		desc_id = gtr26_dummy
		frontend_desc = qs(0x0426db90)
		materials = [
			gtr_pickup_type2_01_primary
		]
		node_meshes = {
			$guitar_pickups_nodes
			placements = [
				{
					parents = [
						gtr26_cash_acoustic
						gtr27_nsft_acoustic
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/pickups/gtr_pickup_type2_01`
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
cas_guitar_knobs = [
	{
		desc_id = gtr_knob_01
		frontend_desc = qs(0x2a068a61)
		materials = [
			gtr_knob_01_primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						gtr40_px_body
						gtr64_esp_f
						gtr63f_esp_ex
						gtr12_esp_v_01
						gtr_32_body_new
						gtr_31_viper_new
						gtr9_esp_ax
						gtr10_mcswain_flame
						gtr12_mcswain_minferno
						gtr13_mcswain_machine
						gtr71_sch_c1
						gtr70_sch_ultra
						gtr75_ibz_xpt
						gtr76_ibz_s5470
						gtr77_ibz_rg
						gtr80_prs_sant
						gtr81_prs_miramt
						gtr83_prs_stla
						gtr90_dr_daisy
						gtr84_mm_petrucci
						gtr92_dr_star
						gtr91_dr_heart
						gtr93_dr_siren
						gtr20_bc_rich_beast
						gtr21_bc_rich_warbeast
						gtr86_mm_axis
						gtr108_casket
						gtr109_metal
						gtr178_ibz_ict
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_01`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						gtr33d_base
						gtr4_esp_eclipse_01
						gtr12_esp_v_01
						gtr11_mcswain_carved
						gtr94_dr_tomboy
						gtr22_bc_rich_warlock
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_01`
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
						gtr39_esp_nv
						gtr62_esp_alexi
						gtr14_mcswain_life
						gtr72_sch_devil
						gtr133_tiki
						gtr135_johnny
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_01`
							attach_indices = [
								1
							]
						}
					]
				}
				{
					parents = [
						gtr180_richbich
					]
					node_set = 5
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_01`
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
						gtr74_sch_star
						gtr1_sch_tempest
					]
					node_set = 3
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_01`
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
		desc_id = gtr_knob_02
		frontend_desc = qs(0x5593d6d0)
		materials = [
			gtr_knob_02_primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						gtr40_px_body
						gtr64_esp_f
						gtr63f_esp_ex
						gtr12_esp_v_01
						gtr_32_body_new
						gtr_31_viper_new
						gtr9_esp_ax
						gtr10_mcswain_flame
						gtr12_mcswain_minferno
						gtr13_mcswain_machine
						gtr71_sch_c1
						gtr70_sch_ultra
						gtr75_ibz_xpt
						gtr76_ibz_s5470
						gtr77_ibz_rg
						gtr79_prs_cstm24
						gtr80_prs_sant
						gtr81_prs_miramt
						gtr83_prs_stla
						gtr90_dr_daisy
						gtr84_mm_petrucci
						gtr92_dr_star
						gtr91_dr_heart
						gtr93_dr_siren
						gtr20_bc_rich_beast
						gtr21_bc_rich_warbeast
						gtr86_mm_axis
						gtr108_casket
						gtr109_metal
						gtr178_ibz_ict
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_02`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						gtr33d_base
						gtr4_esp_eclipse_01
						gtr12_esp_v_01
						gtr11_mcswain_carved
						gtr94_dr_tomboy
						gtr22_bc_rich_warlock
						gtr84_mm_petrucci
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_02`
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
						gtr39_esp_nv
						gtr62_esp_alexi
						gtr72_sch_devil
						gtr14_mcswain_life
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_02`
							attach_indices = [
								1
							]
						}
					]
				}
				{
					parents = [
						gtr74_sch_star
						gtr1_sch_tempest
						gtr78_prs_sc
					]
					node_set = 3
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_02`
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
		desc_id = gtr_knob_03
		frontend_desc = qs(0x6b3ddd60)
		materials = [
			gtr_knob_03_primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						gtr40_px_body
						gtr64_esp_f
						gtr63f_esp_ex
						gtr12_esp_v_01
						gtr_32_body_new
						gtr_31_viper_new
						gtr9_esp_ax
						gtr10_mcswain_flame
						gtr12_mcswain_minferno
						gtr13_mcswain_machine
						gtr71_sch_c1
						gtr70_sch_ultra
						gtr75_ibz_xpt
						gtr76_ibz_s5470
						gtr77_ibz_rg
						gtr79_prs_cstm24
						gtr80_prs_sant
						gtr81_prs_miramt
						gtr83_prs_stla
						gtr90_dr_daisy
						gtr84_mm_petrucci
						gtr92_dr_star
						gtr91_dr_heart
						gtr93_dr_siren
						gtr20_bc_rich_beast
						gtr21_bc_rich_warbeast
						gtr86_mm_axis
						gtr108_casket
						gtr109_metal
						gtr178_ibz_ict
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_03`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						gtr33d_base
						gtr4_esp_eclipse_01
						gtr12_esp_v_01
						gtr11_mcswain_carved
						gtr94_dr_tomboy
						gtr22_bc_rich_warlock
						gtr84_mm_petrucci
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_03`
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
						gtr39_esp_nv
						gtr62_esp_alexi
						gtr72_sch_devil
						gtr14_mcswain_life
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_03`
							attach_indices = [
								1
							]
						}
					]
				}
				{
					parents = [
						gtr74_sch_star
						gtr1_sch_tempest
						gtr78_prs_sc
					]
					node_set = 3
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_03`
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
		desc_id = gtr_knob_03b
		frontend_desc = qs(0x3f507346)
		materials = [
			gtr_knob_03_primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						gtr39_esp_nv
						gtr72_sch_devil
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_03`
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
		desc_id = gtr_knob_04
		frontend_desc = qs(0x4b3fc55e)
		materials = [
			gtr_knob_04_primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						gtr40_px_body
						gtr64_esp_f
						gtr63f_esp_ex
						gtr12_esp_v_01
						gtr_32_body_new
						gtr_31_viper_new
						gtr9_esp_ax
						gtr10_mcswain_flame
						gtr12_mcswain_minferno
						gtr13_mcswain_machine
						gtr71_sch_c1
						gtr70_sch_ultra
						gtr75_ibz_xpt
						gtr76_ibz_s5470
						gtr77_ibz_rg
						gtr79_prs_cstm24
						gtr80_prs_sant
						gtr81_prs_miramt
						gtr83_prs_stla
						gtr90_dr_daisy
						gtr84_mm_petrucci
						gtr92_dr_star
						gtr91_dr_heart
						gtr93_dr_siren
						gtr20_bc_rich_beast
						gtr21_bc_rich_warbeast
						gtr86_mm_axis
						gtr108_casket
						gtr109_metal
						gtr178_ibz_ict
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_04`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						gtr33d_base
						gtr4_esp_eclipse_01
						gtr12_esp_v_01
						gtr11_mcswain_carved
						gtr94_dr_tomboy
						gtr22_bc_rich_warlock
						gtr84_mm_petrucci
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_04`
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
						gtr39_esp_nv
						gtr62_esp_alexi
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_04`
							attach_indices = [
								1
							]
						}
					]
				}
				{
					parents = [
						gtr74_sch_star
						gtr1_sch_tempest
						gtr78_prs_sc
					]
					node_set = 3
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_04`
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
		desc_id = gtr_knob_04b
		frontend_desc = qs(0x7f39ed53)
		materials = [
			gtr_knob_04_primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						gtr39_esp_nv
						gtr62_esp_alexi
						gtr72_sch_devil
						gtr14_mcswain_life
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_04`
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
		desc_id = gtr_knob_05
		frontend_desc = qs(0x4a3737b3)
		materials = [
			gtr_knob_05_primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						gtr40_px_body
						gtr64_esp_f
						gtr63f_esp_ex
						gtr12_esp_v_01
						gtr_32_body_new
						gtr_31_viper_new
						gtr9_esp_ax
						gtr10_mcswain_flame
						gtr12_mcswain_minferno
						gtr13_mcswain_machine
						gtr71_sch_c1
						gtr70_sch_ultra
						gtr75_ibz_xpt
						gtr76_ibz_s5470
						gtr77_ibz_rg
						gtr79_prs_cstm24
						gtr80_prs_sant
						gtr81_prs_miramt
						gtr83_prs_stla
						gtr90_dr_daisy
						gtr84_mm_petrucci
						gtr92_dr_star
						gtr91_dr_heart
						gtr93_dr_siren
						gtr20_bc_rich_beast
						gtr21_bc_rich_warbeast
						gtr86_mm_axis
						gtr109_metal
						gtr178_ibz_ict
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_05`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						gtr33d_base
						gtr4_esp_eclipse_01
						gtr12_esp_v_01
						gtr11_mcswain_carved
						gtr94_dr_tomboy
						gtr22_bc_rich_warlock
						gtr84_mm_petrucci
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_05`
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
						gtr39_esp_nv
						gtr62_esp_alexi
						gtr72_sch_devil
						gtr14_mcswain_life
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_05`
							attach_indices = [
								1
							]
						}
					]
				}
				{
					parents = [
						gtr74_sch_star
						gtr1_sch_tempest
						gtr78_prs_sc
					]
					node_set = 3
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_05`
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
		desc_id = gtr_knob_05b
		frontend_desc = qs(0x2a26573d)
		materials = [
			gtr39_esp_nv
			gtr_knob_05_primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						gtr72_sch_devil
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_05`
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
		desc_id = gtr_knob_06
		frontend_desc = qs(0x8ae89cb9)
		materials = [
			gtr_knob_06_primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						gtr40_px_body
						gtr64_esp_f
						gtr63f_esp_ex
						gtr12_esp_v_01
						gtr_32_body_new
						gtr_31_viper_new
						gtr9_esp_ax
						gtr10_mcswain_flame
						gtr12_mcswain_minferno
						gtr13_mcswain_machine
						gtr71_sch_c1
						gtr70_sch_ultra
						gtr75_ibz_xpt
						gtr76_ibz_s5470
						gtr77_ibz_rg
						gtr79_prs_cstm24
						gtr80_prs_sant
						gtr81_prs_miramt
						gtr83_prs_stla
						gtr90_dr_daisy
						gtr84_mm_petrucci
						gtr92_dr_star
						gtr91_dr_heart
						gtr93_dr_siren
						gtr20_bc_rich_beast
						gtr21_bc_rich_warbeast
						gtr86_mm_axis
						gtr108_casket
						gtr109_metal
						gtr178_ibz_ict
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_06`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						gtr33d_base
						gtr4_esp_eclipse_01
						gtr12_esp_v_01
						gtr11_mcswain_carved
						gtr94_dr_tomboy
						gtr22_bc_rich_warlock
						gtr84_mm_petrucci
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_06`
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
						gtr39_esp_nv
						gtr62_esp_alexi
						gtr82_prs_se1
						gtr72_sch_devil
						gtr14_mcswain_life
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_06`
							attach_indices = [
								1
							]
						}
					]
				}
				{
					parents = [
						gtr74_sch_star
						gtr1_sch_tempest
						gtr78_prs_sc
					]
					node_set = 3
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_06`
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
		desc_id = gtr_knob_06b
		frontend_desc = qs(0x0b0249fc)
		materials = [
			gtr_knob_06_primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						gtr39_esp_nv
						gtr82_prs_se1
						gtr72_sch_devil
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_06`
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
		desc_id = gtr_knob_07
		frontend_desc = qs(0x794033c5)
		materials = [
			gtr_knob_07_primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						gtr40_px_body
						gtr64_esp_f
						gtr63f_esp_ex
						gtr12_esp_v_01
						gtr_32_body_new
						gtr_31_viper_new
						gtr9_esp_ax
						gtr10_mcswain_flame
						gtr12_mcswain_minferno
						gtr13_mcswain_machine
						gtr71_sch_c1
						gtr70_sch_ultra
						gtr75_ibz_xpt
						gtr76_ibz_s5470
						gtr77_ibz_rg
						gtr79_prs_cstm24
						gtr80_prs_sant
						gtr81_prs_miramt
						gtr83_prs_stla
						gtr90_dr_daisy
						gtr84_mm_petrucci
						gtr92_dr_star
						gtr91_dr_heart
						gtr93_dr_siren
						gtr20_bc_rich_beast
						gtr21_bc_rich_warbeast
						gtr86_mm_axis
						gtr108_casket
						gtr109_metal
						gtr178_ibz_ict
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_07`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						gtr33d_base
						gtr4_esp_eclipse_01
						gtr12_esp_v_01
						gtr11_mcswain_carved
						gtr94_dr_tomboy
						gtr22_bc_rich_warlock
						gtr84_mm_petrucci
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_07`
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
						gtr39_esp_nv
						gtr62_esp_alexi
						gtr72_sch_devil
						gtr14_mcswain_life
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_07`
							attach_indices = [
								1
							]
						}
					]
				}
				{
					parents = [
						gtr74_sch_star
						gtr1_sch_tempest
						gtr78_prs_sc
					]
					node_set = 3
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_07`
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
		desc_id = gtr_knob_08
		frontend_desc = qs(0x655796b4)
		materials = [
			gtr_knob_08_primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						gtr40_px_body
						gtr64_esp_f
						gtr63f_esp_ex
						gtr12_esp_v_01
						gtr_32_body_new
						gtr_31_viper_new
						gtr9_esp_ax
						gtr10_mcswain_flame
						gtr12_mcswain_minferno
						gtr13_mcswain_machine
						gtr79_prs_cstm24
						gtr80_prs_sant
						gtr71_sch_c1
						gtr70_sch_ultra
						gtr75_ibz_xpt
						gtr76_ibz_s5470
						gtr77_ibz_rg
						gtr81_prs_miramt
						gtr83_prs_stla
						gtr90_dr_daisy
						gtr84_mm_petrucci
						gtr92_dr_star
						gtr91_dr_heart
						gtr93_dr_siren
						gtr20_bc_rich_beast
						gtr21_bc_rich_warbeast
						gtr86_mm_axis
						gtr108_casket
						gtr109_metal
						gtr178_ibz_ict
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_08`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						gtr33d_base
						gtr4_esp_eclipse_01
						gtr12_esp_v_01
						gtr11_mcswain_carved
						gtr94_dr_tomboy
						gtr22_bc_rich_warlock
						gtr84_mm_petrucci
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_08`
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
						gtr39_esp_nv
						gtr62_esp_alexi
						gtr72_sch_devil
						gtr14_mcswain_life
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_08`
							attach_indices = [
								1
							]
						}
					]
				}
				{
					parents = [
						gtr74_sch_star
						gtr1_sch_tempest
						gtr78_prs_sc
					]
					node_set = 3
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_08`
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
		desc_id = gtr_knob_08b
		frontend_desc = qs(0xf75f5f7d)
		materials = [
			gtr_knob_08_primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						gtr39_esp_nv
						gtr72_sch_devil
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_08`
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
		desc_id = gtr_knob_09
		frontend_desc = qs(0x11b3745c)
		materials = [
			gtr_knob_09_primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						gtr40_px_body
						gtr64_esp_f
						gtr63f_esp_ex
						gtr12_esp_v_01
						gtr_32_body_new
						gtr_31_viper_new
						gtr12_esp_v_01
						gtr9_esp_ax
						gtr10_mcswain_flame
						gtr12_mcswain_minferno
						gtr13_mcswain_machine
						gtr71_sch_c1
						gtr70_sch_ultra
						gtr75_ibz_xpt
						gtr76_ibz_s5470
						gtr77_ibz_rg
						gtr79_prs_cstm24
						gtr80_prs_sant
						gtr81_prs_miramt
						gtr83_prs_stla
						gtr90_dr_daisy
						gtr84_mm_petrucci
						gtr92_dr_star
						gtr91_dr_heart
						gtr93_dr_siren
						gtr20_bc_rich_beast
						gtr21_bc_rich_warbeast
						gtr86_mm_axis
						gtr108_casket
						gtr109_metal
						gtr178_ibz_ict
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_09`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						gtr33d_base
						gtr4_esp_eclipse_01
						gtr12_esp_v_01
						gtr11_mcswain_carved
						gtr94_dr_tomboy
						gtr22_bc_rich_warlock
						gtr84_mm_petrucci
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_09`
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
						gtr39_esp_nv
						gtr62_esp_alexi
						gtr72_sch_devil
						gtr14_mcswain_life
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_09`
							attach_indices = [
								1
							]
						}
					]
				}
				{
					parents = [
						gtr74_sch_star
						gtr1_sch_tempest
						gtr78_prs_sc
					]
					node_set = 3
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_09`
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
		desc_id = gtr_knob_10
		frontend_desc = qs(0x8ce8c0b3)
		materials = [
			gtr_knob_10_primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						gtr40_px_body
						gtr64_esp_f
						gtr63f_esp_ex
						gtr12_esp_v_01
						gtr_32_body_new
						gtr_31_viper_new
						gtr9_esp_ax
						gtr10_mcswain_flame
						gtr12_mcswain_minferno
						gtr13_mcswain_machine
						gtr71_sch_c1
						gtr70_sch_ultra
						gtr75_ibz_xpt
						gtr76_ibz_s5470
						gtr77_ibz_rg
						gtr90_dr_daisy
						gtr84_mm_petrucci
						gtr92_dr_star
						gtr91_dr_heart
						gtr93_dr_siren
						gtr20_bc_rich_beast
						gtr21_bc_rich_warbeast
						gtr86_mm_axis
						gtr108_casket
						gtr109_metal
						gtr178_ibz_ict
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_10`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						gtr33d_base
						gtr4_esp_eclipse_01
						gtr12_esp_v_01
						gtr11_mcswain_carved
						gtr94_dr_tomboy
						gtr22_bc_rich_warlock
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_10`
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
						gtr39_esp_nv
						gtr62_esp_alexi
						gtr72_sch_devil
						gtr14_mcswain_life
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_10`
							attach_indices = [
								1
							]
						}
					]
				}
				{
					parents = [
						gtr74_sch_star
						gtr1_sch_tempest
					]
					node_set = 3
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_10`
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
		desc_id = gtr_knob_01b
		frontend_desc = qs(0x462738a8)
		materials = [
			gtr_knob_01_primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						gtr11_mcswain_carved
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_01`
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
		desc_id = gtr_knob_01c
		frontend_desc = qs(0x25442520)
		materials = [
			gtr_knob_01_primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						gtr71_sch_c1
						gtr72_sch_devil
						gtr73_sch_s1
						gtr83_prs_stla
						gtr84_mm_petrucci
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_01`
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
						gtr90_dr_daisy
						gtr92_dr_star
						gtr91_dr_heart
						gtr86_mm_axis
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_01`
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
		desc_id = gtr_knob_02c
		frontend_desc = qs(0xa96f44f9)
		materials = [
			gtr_knob_02_primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						gtr71_sch_c1
						gtr72_sch_devil
						gtr73_sch_s1
						gtr83_prs_stla
						gtr84_mm_petrucci
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_02`
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
						gtr82_prs_se1
						gtr90_dr_daisy
						gtr92_dr_star
						gtr91_dr_heart
						gtr86_mm_axis
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_02`
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
		desc_id = gtr_knob_03c
		frontend_desc = qs(0x9bcdd20f)
		materials = [
			gtr_knob_03_primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						gtr71_sch_c1
						gtr72_sch_devil
						gtr73_sch_s1
						gtr83_prs_stla
						gtr84_mm_petrucci
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_03`
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
						gtr82_prs_se1
						gtr90_dr_daisy
						gtr92_dr_star
						gtr91_dr_heart
						gtr86_mm_axis
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_03`
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
		desc_id = gtr_knob_04c
		frontend_desc = qs(0x0f21e9b0)
		materials = [
			gtr_knob_04_primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						gtr71_sch_c1
						gtr72_sch_devil
						gtr73_sch_s1
						gtr83_prs_stla
						gtr84_mm_petrucci
						gtr80_prs_sant
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_04`
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
						gtr82_prs_se1
						gtr90_dr_daisy
						gtr92_dr_star
						gtr91_dr_heart
						gtr86_mm_axis
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_04`
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
		desc_id = gtr_knob_05c
		frontend_desc = qs(0x8d7a3485)
		materials = [
			gtr_knob_05_primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						gtr71_sch_c1
						gtr72_sch_devil
						gtr73_sch_s1
						gtr83_prs_stla
						gtr84_mm_petrucci
						gtr80_prs_sant
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_05`
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
						gtr82_prs_se1
						gtr90_dr_daisy
						gtr92_dr_star
						gtr91_dr_heart
						gtr86_mm_axis
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_05`
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
		desc_id = gtr_knob_06c
		frontend_desc = qs(0xcec054ea)
		materials = [
			gtr_knob_06_primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						gtr71_sch_c1
						gtr72_sch_devil
						gtr73_sch_s1
						gtr83_prs_stla
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_06`
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
						gtr82_prs_se1
						gtr90_dr_daisy
						gtr92_dr_star
						gtr91_dr_heart
						gtr86_mm_axis
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_06`
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
		desc_id = gtr_knob_07c
		frontend_desc = qs(0xc64cbd25)
		materials = [
			gtr_knob_07_primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						gtr71_sch_c1
						gtr72_sch_devil
						gtr73_sch_s1
						gtr84_mm_petrucci
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_07`
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
						gtr82_prs_se1
						gtr90_dr_daisy
						gtr92_dr_star
						gtr91_dr_heart
						gtr86_mm_axis
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_07`
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
		desc_id = gtr_knob_08c
		frontend_desc = qs(0x626d91c0)
		materials = [
			gtr_knob_08_primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						gtr71_sch_c1
						gtr72_sch_devil
						gtr73_sch_s1
						gtr84_mm_petrucci
						gtr80_prs_sant
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_08`
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
						gtr82_prs_se1
						gtr90_dr_daisy
						gtr92_dr_star
						gtr91_dr_heart
						gtr86_mm_axis
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_08`
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
		desc_id = gtr_knob_09c
		frontend_desc = qs(0xd9925e48)
		materials = [
			gtr_knob_09_primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						gtr71_sch_c1
						gtr72_sch_devil
						gtr73_sch_s1
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_09`
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
						gtr82_prs_se1
						gtr90_dr_daisy
						gtr92_dr_star
						gtr91_dr_heart
						gtr86_mm_axis
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_09`
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
		desc_id = gtr_knob_10c
		frontend_desc = qs(0xd9c88d6c)
		materials = [
			gtr_knob_10_primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						gtr71_sch_c1
						gtr72_sch_devil
						gtr73_sch_s1
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_10`
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
						gtr82_prs_se1
						gtr90_dr_daisy
						gtr92_dr_star
						gtr91_dr_heart
						gtr86_mm_axis
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_10`
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
		desc_id = gtr_knob_mm01
		frontend_desc = qs(0xf02b0c3f)
		materials = [
			gtr_knob_mm01_primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						gtr84_mm_petrucci
						gtr71_sch_c1
						gtr72_sch_devil
						gtr73_sch_s1
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_mm01`
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
		desc_id = prs_knob_lampshade
		frontend_desc = qs(0xc93beecb)
		materials = [
			prs_knob_lampshade_primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						gtr81_prs_miramt
						gtr79_prs_cstm24
						gtr80_prs_sant
						gtr83_prs_stla
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/prs/prs_knob_lampshade`
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
		desc_id = prs_knob_lampshade_1
		frontend_desc = qs(0xc93beecb)
		materials = [
			prs_knob_lampshade_primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						gtr82_prs_se1
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/prs/prs_knob_lampshade`
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
		desc_id = prs_knob_lampshade_3
		frontend_desc = qs(0xc93beecb)
		materials = [
			prs_knob_lampshade_primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						gtr78_prs_sc
					]
					node_set = 3
					meshes = [
						{
							mesh = `models/car_instruments/guitar/prs/prs_knob_lampshade`
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
		desc_id = prs_knob_lampshade_4
		frontend_desc = qs(0xc93beecb)
		materials = [
			prs_knob_lampshade_primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						gtr78_prs_sc
					]
					node_set = 3
					meshes = [
						{
							mesh = `models/car_instruments/guitar/prs/prs_knob_lampshade`
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
		desc_id = gtr_knob_tophat
		frontend_desc = qs(0x66b0c24a)
		materials = [
			gtr_knob_tophat_primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						gtr82_prs_se1
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_tophat`
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
		desc_id = gtr_knob_tophat_2
		frontend_desc = qs(0x66b0c24a)
		materials = [
			gtr_knob_tophat_primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						gtr9_esp_ax
						gtr79_prs_cstm24
						gtr80_prs_sant
						gtr81_prs_miramt
						gtr83_prs_stla
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_tophat`
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
		desc_id = gtr_knob_tophat_3
		frontend_desc = qs(0x66b0c24a)
		materials = [
			gtr_knob_tophat_primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						gtr78_prs_sc
					]
					node_set = 3
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_tophat`
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
		desc_id = gtr_knob_tophat_w
		frontend_desc = qs(0x6bd46bed)
		materials = [
			gtr_knob_tophat_w_primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						gtr82_prs_se1
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_tophat_w`
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
		desc_id = gtr_knob_tophat_w_2
		frontend_desc = qs(0x6bd46bed)
		materials = [
			gtr_knob_tophat_w_primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						gtr9_esp_ax
						gtr79_prs_cstm24
						gtr80_prs_sant
						gtr81_prs_miramt
						gtr83_prs_stla
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_tophat_w`
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
		desc_id = gtr_knob_tophat_w_3
		frontend_desc = qs(0x6bd46bed)
		materials = [
			gtr_knob_tophat_w_primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						gtr78_prs_sc
					]
					node_set = 3
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_tophat_w`
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
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						gtr180_richbich
					]
					node_set = 5
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/knob_knurl001`
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
						gtr40_px_body
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/knob_knurl001`
							attach_indices = [
								1
								2
							]
						}
					]
				}
				{
					parents = [
						gtr39_esp_nv
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/knob_knurl001`
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
		desc_id = gtr180_knob
		frontend_desc = qs(0xc55b146f)
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						gtr180_richbich
					]
					node_set = 5
					meshes = [
						{
							mesh = `models/car_instruments/guitar/bc_rich/gtr180_knob`
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
						gtr39_esp_nv
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/car_instruments/guitar/bc_rich/gtr180_knob`
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
		desc_id = gtr_knob_01kurt
		frontend_desc = qs(0x83d66768)
		materials = [
			gtr_knob_01kurt_primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						gtr78_kurt
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_01kurt`
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
		desc_id = gtr_knob_manson_01
		frontend_desc = qs(0x57ceba84)
		materials = [
			gtr_knob_manson_01_primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						gtr25_manson_bellamy
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr_knob_manson_01`
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
		desc_id = gtr1b_knob_locknut
		frontend_desc = qs(0x4b5a1417)
		materials = [
			gtr1b_knob_locknut_primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						gtr1b_nvsft_sk8gtr
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/heroes/gtr1b_knob_locknut`
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
		desc_id = gtr130_knob
		frontend_desc = qs(0x0ca51789)
		materials = [
			gtr130_knob_primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						gtr130_steampunk
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr130_knob`
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
		desc_id = gtr132_knob
		frontend_desc = qs(0x7596ac56)
		materials = [
			gtr132_knob_primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						gtr132_axe
					]
					node_set = 0
					meshes = [
						{
							mesh = 0x3c0a4a8b
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
		desc_id = gtr142_knob
		frontend_desc = qs(0xcbec2ae5)
		materials = [
			gtr142_vtwin_knob_primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						gtr142_vtwin
					]
					node_set = 6
					meshes = [
						{
							mesh = `models/car_instruments/guitar/heroes/gtr142_knob01`
							attach_indices = [
								1
								2
								3
								4
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
		desc_id = gtr136_knob
		frontend_desc = qs(0xa73705e0)
		materials = [
			gtr136_knob_primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						gtr136_glass
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/knobs/gtr136_knob`
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
		desc_id = gtr135_knob
		frontend_desc = qs(0x0fa2adb3)
		materials = [
			gtr135_knob_primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						gtr135_johnny
					]
					node_set = 0
					meshes = [
						{
							mesh = 0x210f7a33
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
		desc_id = gtr4_esp_knob_10_03
		frontend_desc = qs(0xcc7bacce)
		mesh = `models/car_instruments/guitar/esp/gtr4_esp_knob_10_03`
		materials = [
			gtr4_esp_knob_10_03_primary
		]
	}
	{
		desc_id = gtr4_knob_02
		frontend_desc = qs(0x8f2cae0b)
		mesh = `models/car_instruments/guitar/esp/gtr4_knob_02`
		materials = [
			gtr4_knob_02_primary
		]
	}
	{
		desc_id = gtr4_knob_03
		frontend_desc = qs(0x4e6b4489)
		mesh = `models/car_instruments/guitar/esp/gtr4_knob_03`
		materials = [
			gtr4_knob_03_primary
		]
	}
	{
		desc_id = gtr4_knob_04
		frontend_desc = qs(0xc99e6543)
		mesh = `models/car_instruments/guitar/esp/gtr4_knob_04`
		materials = [
			gtr4_knob_04_primary
		]
	}
	{
		desc_id = gtr4_knob_05
		frontend_desc = qs(0x8ae89cb9)
		mesh = `models/car_instruments/guitar/esp/gtr4_knob_05`
		materials = [
			gtr4_knob_05_primary
		]
	}
	{
		desc_id = gtr4_knob_06
		frontend_desc = qs(0xea9acd58)
		mesh = `models/car_instruments/guitar/esp/gtr4_knob_06`
		materials = [
			gtr4_knob_06_primary
		]
	}
	{
		desc_id = gtr9_esp_knob_10_02
		frontend_desc = qs(0x1387d414)
		mesh = `models/car_instruments/guitar/esp/gtr9_esp_knob_10_02`
		materials = [
			gtr4_esp_knob_10_03_primary
		]
	}
	{
		desc_id = gtr9_knob_02
		frontend_desc = qs(0x8f2cae0b)
		mesh = `models/car_instruments/guitar/esp/gtr9_knob_02`
		materials = [
			gtr9_knob_02_primary
		]
	}
	{
		desc_id = gtr9_knob_03
		frontend_desc = qs(0x4e6b4489)
		mesh = `models/car_instruments/guitar/esp/gtr9_knob_03`
		materials = [
			gtr9_knob_03_primary
		]
	}
	{
		desc_id = gtr9_knob_04
		frontend_desc = qs(0xc99e6543)
		mesh = `models/car_instruments/guitar/esp/gtr9_knob_04`
		materials = [
			gtr9_knob_04_primary
		]
	}
	{
		desc_id = gtr9_knob_06
		frontend_desc = qs(0xea9acd58)
		mesh = `models/car_instruments/guitar/esp/gtr9_knob_06`
		materials = [
			gtr9_knob_06_primary
		]
	}
	{
		desc_id = gtr12_esp_knob_01
		frontend_desc = qs(0x34c902b4)
		mesh = `models/car_instruments/guitar/esp/gtr12_esp_knob_01`
		materials = [
			gtr12_esp_knob_01_primary
		]
	}
	{
		desc_id = gtr12_esp_knob_02
		frontend_desc = qs(0x8f2cae0b)
		mesh = `models/car_instruments/guitar/esp/gtr12_esp_knob_02`
		materials = [
			gtr12_esp_knob_02_primary
		]
	}
	{
		desc_id = gtr12_esp_knob_03
		frontend_desc = qs(0x4e6b4489)
		mesh = `models/car_instruments/guitar/esp/gtr12_esp_knob_03`
		materials = [
			gtr12_esp_knob_03_primary
		]
	}
	{
		desc_id = gtr12_esp_knob_04
		frontend_desc = qs(0xc99e6543)
		mesh = `models/car_instruments/guitar/esp/gtr12_esp_knob_04`
		materials = [
			gtr12_esp_knob_04_primary
		]
	}
	{
		desc_id = gtr12_esp_knob_05
		frontend_desc = qs(0x8ae89cb9)
		mesh = `models/car_instruments/guitar/esp/gtr12_esp_knob_05`
		materials = [
			gtr12_esp_knob_05_primary
		]
	}
	{
		desc_id = gtr12_esp_knob_06
		frontend_desc = qs(0xea9acd58)
		mesh = `models/car_instruments/guitar/esp/gtr12_esp_knob_06`
		materials = [
			gtr12_esp_knob_06_primary
		]
	}
	{
		desc_id = gtr_30_knobs_a
		frontend_desc = qs(0x6ae51c48)
		mesh = `models/car_instruments/guitar/esp/gtr_30_knobs_a`
		materials = [
			gtr_31b_knobs_viper_primary
		]
	}
	{
		desc_id = gtr_30_knobs_b
		frontend_desc = qs(0x41c84f8b)
		mesh = `models/car_instruments/guitar/esp/gtr_30_knobs_b`
		materials = [
			gtr_36_knobs_primary
		]
	}
	{
		desc_id = gtr_30_knobs_c
		frontend_desc = qs(0x58d37eca)
		mesh = `models/car_instruments/guitar/esp/gtr_30_knobs_c`
		materials = [
			gtr60c_knob_type1_primary
		]
	}
	{
		desc_id = gtr_30_knobs_d
		frontend_desc = qs(0x1792e80d)
		mesh = `models/car_instruments/guitar/esp/gtr_30_knobs_d`
		materials = [
			gtr_knob_type4_01_primary
		]
	}
	{
		desc_id = gtr_30_knobs_e
		frontend_desc = qs(0x0e89d94c)
		mesh = `models/car_instruments/guitar/esp/gtr_30_knobs_e`
		materials = [
			gtr12h_knob_primary
		]
	}
	{
		desc_id = gtr_31_knobs_vpr
		frontend_desc = qs(0x4ce53e6a)
		mesh = `models/car_instruments/guitar/esp/gtr_31b_knobs_vpr`
		materials = [
			gtr_31b_knobs_viper_primary
		]
	}
	{
		desc_id = gtr_31_knobs_c
		frontend_desc = qs(0xe650fc7c)
		mesh = `models/car_instruments/guitar/esp/gtr_31_knobs_c`
		materials = [
			gtr60c_knob_type1_primary
		]
	}
	{
		desc_id = gtr_31_knobs_d
		frontend_desc = qs(0x4b3fc55e)
		mesh = `models/car_instruments/guitar/esp/gtr_31_knobs_d`
		materials = [
			gtr_knob_type4_01_primary
		]
	}
	{
		desc_id = gtr_31_knobs_e
		frontend_desc = qs(0x24ff7e81)
		mesh = `models/car_instruments/guitar/esp/gtr_31_knobs_e`
		materials = [
			gtr12h_knob_primary
		]
	}
	{
		desc_id = gtr_32_knobs_a
		frontend_desc = qs(0xf5c42fb0)
		mesh = `models/car_instruments/guitar/esp/gtr_32_knobs_a`
		materials = [
			gtr_32_knobs01_primary
		]
	}
	{
		desc_id = gtr_32_knobs_b
		frontend_desc = qs(0xdee97c73)
		mesh = `models/car_instruments/guitar/esp/gtr_32_knobs_b`
		materials = [
			gtr_36_knobs_primary
		]
	}
	{
		desc_id = gtr_32_knobs_c
		frontend_desc = qs(0xc7f24d32)
		mesh = `models/car_instruments/guitar/esp/gtr_32_knobs_c`
		materials = [
			gtr60c_knob_type1_primary
		]
	}
	{
		desc_id = gtr_32_knobs_d
		frontend_desc = qs(0x88b3dbf5)
		mesh = `models/car_instruments/guitar/esp/gtr_32_knobs_d`
		materials = [
			gtr_knob_type4_01_primary
		]
	}
	{
		desc_id = gtr_32_knobs_e
		frontend_desc = qs(0x91a8eab4)
		mesh = `models/car_instruments/guitar/esp/gtr_32_knobs_e`
		materials = [
			gtr12h_knob_primary
		]
	}
	{
		desc_id = gtr33_knobs_kh2
		frontend_desc = qs(0xb7370f85)
		mesh = `models/car_instruments/guitar/esp/gtr_33_knobs_kh2`
		materials = [
			gtr_33_knobs_primary
		]
	}
	{
		desc_id = gtr_33_knobs_a
		frontend_desc = qs(0xfec4db1d)
		mesh = `models/car_instruments/guitar/esp/gtr_33_knobs_a`
		materials = [
			gtr_31b_knobs_viper_primary
		]
	}
	{
		desc_id = gtr_33_knobs_b
		frontend_desc = qs(0xd5e988de)
		mesh = `models/car_instruments/guitar/esp/gtr_33_knobs_b`
		materials = [
			gtr_36_knobs_primary
		]
	}
	{
		desc_id = gtr_33_knobs_c
		frontend_desc = qs(0xccf2b99f)
		mesh = `models/car_instruments/guitar/esp/gtr_33_knobs_c`
		materials = [
			gtr60c_knob_type1_primary
		]
	}
	{
		desc_id = gtr_33_knobs_d
		frontend_desc = qs(0x83b32f58)
		mesh = `models/car_instruments/guitar/esp/gtr_33_knobs_d`
		materials = [
			gtr_knob_type4_01_primary
		]
	}
	{
		desc_id = gtr_33_knobs_e
		frontend_desc = qs(0x9aa81e19)
		mesh = `models/car_instruments/guitar/esp/gtr_33_knobs_e`
		materials = [
			gtr12h_knob_primary
		]
	}
	{
		desc_id = gtr_36_knobs_a
		frontend_desc = qs(0xd6b5be34)
		mesh = `models/car_instruments/guitar/esp/gtr_36_knobs_a`
		materials = [
			gtr_31b_knobs_viper_primary
		]
	}
	{
		desc_id = gtr_36_knobs_b
		frontend_desc = qs(0xfd98edf7)
		mesh = `models/car_instruments/guitar/esp/gtr_36_knobs_b`
		materials = [
			gtr_36_knobs_primary
		]
	}
	{
		desc_id = gtr_36_knobs_c
		frontend_desc = qs(0xe483dcb6)
		mesh = `models/car_instruments/guitar/esp/gtr_36_knobs_c`
		materials = [
			gtr60c_knob_type1_primary
		]
	}
	{
		desc_id = gtr_36_knobs_d
		frontend_desc = qs(0xabc24a71)
		mesh = `models/car_instruments/guitar/esp/gtr_36_knobs_d`
		materials = [
			gtr_knob_type4_01_primary
		]
	}
	{
		desc_id = gtr_36_knobs_e
		frontend_desc = qs(0xb2d97b30)
		mesh = `models/car_instruments/guitar/esp/gtr_36_knobs_e`
		materials = [
			gtr12h_knob_primary
		]
	}
	{
		desc_id = gtr37_knobs01
		frontend_desc = qs(0x7f5c191d)
		mesh = `models/car_instruments/guitar/esp/gtr37_knobs01`
		materials = [
			gtr37_knobs_primary
		]
	}
	{
		desc_id = gtr62_knob_type01
		frontend_desc = qs(0x8ae89cb9)
		mesh = `models/car_instruments/guitar/esp/gtr62_knob_type01`
		materials = [
			gtr62_knob_type01_primary
		]
	}
	{
		desc_id = gtr62_knob_type02
		frontend_desc = qs(0x4e6b4489)
		mesh = `models/car_instruments/guitar/esp/gtr62_knob_type02`
		materials = [
			gtr62_knob_type02_primary
		]
	}
	{
		desc_id = gtr62_knob_type03
		frontend_desc = qs(0x34c902b4)
		mesh = `models/car_instruments/guitar/esp/gtr62_knob_type03`
		materials = [
			gtr62_knob_type03_primary
		]
	}
	{
		desc_id = gtr62_knob_type04
		frontend_desc = qs(0x8f2cae0b)
		mesh = `models/car_instruments/guitar/esp/gtr62_knob_type04`
		materials = [
			gtr62_knob_type04_primary
		]
	}
	{
		desc_id = gtr62_knob_type05
		frontend_desc = qs(0xea9acd58)
		mesh = `models/car_instruments/guitar/esp/gtr62_knob_type05`
		materials = [
			gtr62_knob_type05_primary
		]
	}
	{
		desc_id = gtr62_knob_type06
		frontend_desc = qs(0xc99e6543)
		mesh = `models/car_instruments/guitar/esp/gtr62_knob_type06`
		materials = [
			gtr62_knob_type06_primary
		]
	}
	{
		desc_id = gtr63c_knob_type1
		frontend_desc = qs(0x0330fcc6)
		mesh = `models/car_instruments/guitar/esp/gtr63c_knob_type1`
		materials = [
			gtr63c_knob_type1_primary
		]
	}
	{
		desc_id = gtr63_knob_type2
		frontend_desc = qs(0x8f2cae0b)
		mesh = `models/car_instruments/guitar/esp/gtr63_knob_type2`
		materials = [
			gtr63_knob_type2_primary
		]
	}
	{
		desc_id = gtr63_knob_type3
		frontend_desc = qs(0x4e6b4489)
		mesh = `models/car_instruments/guitar/esp/gtr63_knob_type3`
		materials = [
			gtr63_knob_type3_primary
		]
	}
	{
		desc_id = gtr63_knob_type4
		frontend_desc = qs(0xc99e6543)
		mesh = `models/car_instruments/guitar/esp/gtr63_knob_type4`
		materials = [
			gtr63_knob_type4_primary
		]
	}
	{
		desc_id = gtr63_knob_type5
		frontend_desc = qs(0x8ae89cb9)
		mesh = `models/car_instruments/guitar/esp/gtr63_knob_type5`
		materials = [
			gtr63_knob_type5_primary
		]
	}
	{
		desc_id = gtr63_knob_type06
		frontend_desc = qs(0x34c902b4)
		mesh = `models/car_instruments/guitar/esp/gtr63_knob_type06`
		materials = [
			gtr63_knob_type06_primary
		]
	}
	{
		desc_id = gtr64_knob_type1
		frontend_desc = qs(0x2a068a61)
		mesh = `models/car_instruments/guitar/esp/gtr64_knob_type1`
		materials = [
			gtr64_knob_type1_primary
		]
	}
	{
		desc_id = gtr64_knob_type2
		frontend_desc = qs(0x8f2cae0b)
		mesh = `models/car_instruments/guitar/esp/gtr64_knob_type2`
		materials = [
			gtr64_knob_type2_primary
		]
	}
	{
		desc_id = gtr64_knob_type3
		frontend_desc = qs(0x4e6b4489)
		mesh = `models/car_instruments/guitar/esp/gtr64_knob_type3`
		materials = [
			gtr64_knob_type3_primary
		]
	}
	{
		desc_id = gtr64_knob_type4
		frontend_desc = qs(0xc99e6543)
		mesh = `models/car_instruments/guitar/esp/gtr64_knob_type4`
		materials = [
			gtr64_knob_type4_primary
		]
	}
	{
		desc_id = gtr64_knob_type5
		frontend_desc = qs(0x8ae89cb9)
		mesh = `models/car_instruments/guitar/esp/gtr64_knob_type5`
		materials = [
			gtr64_knob_type5_primary
		]
	}
	{
		desc_id = gtr64_knob_type6
		frontend_desc = qs(0xea9acd58)
		mesh = `models/car_instruments/guitar/esp/gtr64_knob_type6`
		materials = [
			gtr64_knob_type6_primary
		]
	}
	{
		desc_id = gtr66_knob_type1
		frontend_desc = qs(0x34c902b4)
		mesh = `models/car_instruments/guitar/esp/gtr66_knob_type1`
		materials = [
			gtr66_knob_type1_primary
		]
	}
	{
		desc_id = gtr37_knobs01b
		frontend_desc = qs(0x8afcea8e)
		materials = [
			gtr37_knobs01b_primary
		]
		node_meshes = {
			$guitar_knobs_nodes
			placements = [
				{
					parents = [
						gtr37_rw01_new
					]
					node_set = 1
					meshes = [
						{
							mesh = 0x32d4721c
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
		random_weight = 10.0
	}
]
cas_guitar_bridges = [
	{
		desc_id = gtr4_bridgewhammy
		frontend_desc = qs(0x5f83866e)
		materials = [
			gtr4_bridgewhammy_primary
		]
		guitar_string_start = gtr4_bridgewhammy_str_start_properties
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr39_esp_nv
						gtr40_px_body
						gtr9_esp_ax
						gtr64_esp_f
						gtr63f_esp_ex
						gtr62_esp_alexi
						gtr4_esp_eclipse_01
						gtr12_esp_v_01
						gtr_31_viper_new
						gtr37_rw01_new
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/bridges/gtr4_bridgewhammy`
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
		desc_id = gtr4_esp_bridge_02
		frontend_desc = qs(0xe3256784)
		mesh = `models/car_instruments/guitar/esp/gtr4_esp_bridge_02`
		materials = [
			gtr4_esp_bridge_02_primary
		]
		guitar_string_start = gtr4_esp_bridge_02_str_start_properties
	}
	{
		desc_id = gtr4_bridge_fr10
		frontend_desc = qs(0x5f83866e)
		mesh = `models/car_instruments/guitar/esp/gtr4_bridge_fr10`
		materials = [
			gtr4_bridge_fr10_primary
		]
		guitar_string_start = gtr4_bridge_fr10_str_start_properties
	}
	{
		desc_id = gtr4_esp_bridge_9
		frontend_desc = qs(0xddfd5fc4)
		mesh = `models/car_instruments/guitar/esp/gtr4_esp_bridge_9`
		materials = [
			gtr4_esp_bridge_9_primary
		]
		guitar_string_start = gtr4_esp_bridge_9_str_start_properties
	}
	{
		desc_id = gtr9_esp_bridge_03
		frontend_desc = qs(0xddfd5fc4)
		mesh = `models/car_instruments/guitar/esp/gtr9_esp_bridge_03`
		materials = [
			gtr9_esp_bridge_03_primary
		]
		guitar_string_start = gtr4_esp_bridge_9_str_start_properties
	}
	{
		desc_id = gtr9_bridge_fr11
		frontend_desc = qs(0x5f83866e)
		mesh = `models/car_instruments/guitar/esp/gtr9_bridge_fr11`
		materials = [
			gtr9_bridge_fr11_primary
		]
		guitar_string_start = gtr9_bridge_fr11_str_start_properties
		guitar_string_end = default_guitar_string_end_properties
	}
	{
		desc_id = gtr9_bridge_04
		frontend_desc = qs(0xe3256784)
		mesh = `models/car_instruments/guitar/esp/gtr9_bridge_04`
		materials = [
			gtr9_bridge_04_primary
		]
		guitar_string_start = gtr9_esp_bridge_04_str_start_properties
	}
	{
		desc_id = gtr12_bridge_1
		frontend_desc = qs(0x023a6f1d)
		mesh = `models/car_instruments/guitar/esp/gtr12_bridge_1`
		materials = [
			gtr12_bridge_1_primary
		]
		guitar_string_start = gtr12_bridge_1_str_start_properties
		guitar_string_end = gtr12_bridge_1_end_properties
	}
	{
		desc_id = gtr12_bridge_2
		frontend_desc = qs(0xe3256784)
		mesh = `models/car_instruments/guitar/esp/gtr12_bridge_2`
		materials = [
			gtr12_bridge_2_primary
		]
		guitar_string_start = gtr12_bridge_2_str_start_properties
	}
	{
		desc_id = gtr12_bridge_3
		frontend_desc = qs(0xddfd5fc4)
		mesh = `models/car_instruments/guitar/esp/gtr12_bridge_3`
		materials = [
			gtr12_bridge_3_primary
		]
		guitar_string_start = gtr12_bridge_3_str_start_properties
	}
	{
		desc_id = gtr30_brdg_strgthru
		frontend_desc = qs(0xddfd5fc4)
		mesh = `models/car_instruments/guitar/esp/gtr30_brdg_strgthru`
		materials = [
			gtr30_brdg_strgthru_primary
		]
		guitar_string_start = gtr30_brdg_strgthru_str_start_properties
	}
	{
		desc_id = gtr30_hardware_03
		frontend_desc = qs(0x6973bba6)
		mesh = `models/car_instruments/guitar/esp/gtr30_hardware_03`
		materials = [
			gtr30_hardware_03_primary
		]
		guitar_string_start = gtr30_hardware_03_str_start_properties
	}
	{
		desc_id = gtr30_bridge_d
		frontend_desc = qs(0xe3256784)
		mesh = `models/car_instruments/guitar/esp/gtr30_bridge_d`
		materials = [
			gtr30_bridge_d_primary
		]
		guitar_string_start = gtr30_bridge_d_str_start_properties
	}
	{
		desc_id = gtr31_bridge_tm02
		frontend_desc = qs(0xe3256784)
		mesh = `models/car_instruments/guitar/esp/gtr31_bridge_tm02`
		materials = [
			gtr31_bridge_tm02_primary
		]
		guitar_string_start = gtr31_bridge_tm02_str_start_properties
	}
	{
		desc_id = gtr31_hardware_b
		frontend_desc = qs(0x6973bba6)
		mesh = `models/car_instruments/guitar/esp/gtr31_hardware_b`
		materials = [
			gtr31_hardware_b_primary
		]
		guitar_string_start = gtr31_hardware_b_str_start_properties
	}
	{
		desc_id = gtr_31_bridge_e
		frontend_desc = qs(0x81204927)
		mesh = `models/car_instruments/guitar/esp/gtr_31_bridge_e`
		materials = [
			gtr_31_bridge_e_primary
		]
		guitar_string_start = gtr31_hardware_e_str_start_properties
	}
	{
		desc_id = gtr32_hardware01
		frontend_desc = qs(0xe3256784)
		mesh = `models/car_instruments/guitar/esp/gtr32_hardware01`
		materials = [
			gtr32_hardware01_primary
		]
		guitar_string_start = gtr32_hardware01_str_start_properties
	}
	{
		desc_id = gtr33_hardware01z
		frontend_desc = qs(0xe3256784)
		mesh = `models/car_instruments/guitar/esp/gtr33_hardware01z`
		materials = [
			gtr33_hardware01z_primary
		]
		guitar_string_start = gtr32_hardware01_str_start_properties
	}
	{
		desc_id = gtr36_hardware01
		frontend_desc = qs(0xe3256784)
		mesh = `models/car_instruments/guitar/esp/gtr36_hardware01`
		materials = [
			gtr36_hardware01_primary
		]
		guitar_string_start = gtr36_hardware01_str_start_properties
	}
	{
		desc_id = gtr37_bridge
		frontend_desc = qs(0xe9a73532)
		mesh = `models/car_instruments/guitar/esp/gtr37_bridge`
		materials = [
			gtr37_bridge_primary
		]
		guitar_string_start = gtr37_bridge_str_string_start_properties
	}
	{
		desc_id = gtr37_hardware
		frontend_desc = qs(0xe3256784)
		mesh = `models/car_instruments/guitar/esp/gtr37_hardware`
		materials = [
			gtr37_hardware_primary
		]
		guitar_string_start = gtr37_hardware_str_string_start_properties
	}
	{
		desc_id = gtr37_brdg_st
		frontend_desc = qs(0xddfd5fc4)
		mesh = `models/car_instruments/guitar/esp/gtr37_brdg_st`
		materials = [
			gtr37_brdg_st_primary
		]
		guitar_string_start = gtr37_brdg_st_str_string_start_properties
	}
	{
		desc_id = gtr_hardware62
		frontend_desc = qs(0x739e5905)
		mesh = `models/car_instruments/guitar/esp/gtr_hardware62`
		materials = [
			gtr_hardware62_primary
		]
		guitar_string_start = gtr_hardware60b_start_properties
		guitar_string_end = gtr_hardware60b_end_properties
	}
	{
		desc_id = gtr_hardware62a
		frontend_desc = qs(0x81204927)
		mesh = `models/car_instruments/guitar/esp/gtr_hardware62a`
		materials = [
			gtr_hardware62a_primary
		]
		guitar_string_start = gtr_hardware60b_str_start_properties
		guitar_string_end = gtr_hardware60b_end_properties
	}
	{
		desc_id = gtr_hardware02
		frontend_desc = qs(0x023a6f1d)
		mesh = `models/car_instruments/guitar/esp/gtr_hardware02`
		materials = [
			gtr_hardware02_primary
		]
		guitar_string_start = gtr_hardware02_str_start_properties
	}
	{
		desc_id = gtr_hardware64
		frontend_desc = qs(0xe3256784)
		mesh = `models/car_instruments/guitar/esp/gtr_hardware64`
		materials = [
			gtr_hardware64_primary
		]
		guitar_string_start = gtr_hardware64_str_start_properties
	}
	{
		desc_id = gtr_hardware60b
		frontend_desc = qs(0xe3256784)
		mesh = `models/car_instruments/guitar/esp/gtr_hardware60b`
		materials = [
			gtr_hardware60b_primary
		]
		guitar_string_start = gtr_hardware60b_start_properties
		guitar_string_end = gtr_hardware60b_end_properties
	}
	{
		desc_id = gtr_hardware63
		frontend_desc = qs(0xe3256784)
		mesh = `models/car_instruments/guitar/esp/gtr_hardware63`
		materials = [
			gtr_hardware63_primary
		]
	}
	{
		desc_id = gtr_hardware63b
		frontend_desc = qs(0x023a6f1d)
		mesh = `models/car_instruments/guitar/esp/gtr_hardware63b`
		materials = [
			gtr_hardware63b_primary
		]
		guitar_string_start = gtr_hardware63f_str_start_properties
	}
	{
		desc_id = gtr_hardware63f
		frontend_desc = qs(0xe3256784)
		mesh = `models/car_instruments/guitar/esp/gtr_hardware63f`
		materials = [
			gtr_hardware63f_primary
		]
		guitar_string_start = gtr_hardware63b_str_start_properties
	}
	{
		desc_id = gtr_hardware64b
		frontend_desc = qs(0xddfd5fc4)
		mesh = `models/car_instruments/guitar/esp/gtr_hardware64b`
		materials = [
			gtr_hardware64b_primary
		]
		guitar_string_start = gtr_hardware64b_str_start_properties
	}
	{
		desc_id = gtr_hardware64bb
		frontend_desc = qs(0x023a6f1d)
		mesh = `models/car_instruments/guitar/esp/gtr_hardware64bb`
		materials = [
			gtr_hardware64bb_primary
		]
		guitar_string_start = gtr_hardware64bb_str_start_properties
	}
	{
		desc_id = gtr_hardware64f
		frontend_desc = qs(0xe3256784)
		mesh = `models/car_instruments/guitar/esp/gtr_hardware64f`
		materials = [
			gtr_hardware64f_primary
		]
		guitar_string_start = gtr_hardware64f_str_start_properties
	}
	{
		desc_id = gtr_hardware66
		frontend_desc = qs(0xa956861e)
		mesh = `models/car_instruments/guitar/esp/gtr_hardware66`
		materials = [
			gtr_hardware66_primary
		]
		guitar_string_start = gtr_bridge_66_str_start_properties
	}
	{
		desc_id = gtr33_hardware01zb
		frontend_desc = qs(0xe3256784)
		materials = [
			gtr33_hardware01zb_primary
		]
		guitar_string_start = gtr33_hardware01zb_str_start_properties
		guitar_string_end = default_guitar_string_end_properties
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr39_esp_nv
						gtr_32_body_new
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/bridges/gtr33_hardware01zb`
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
		desc_id = gtr37_bridge2
		frontend_desc = qs(0xe9a73532)
		materials = [
			gtr37_bridge2_primary
		]
		guitar_string_start = gtr37_bridge2_str_start_properties
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr39_esp_nv
						gtr40_px_body
						gtr37_rw01_new
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/bridges/gtr37_bridge2`
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
		random_weight = 10.0
	}
	{
		desc_id = gtr22_bridge_whammy1
		frontend_desc = qs(0x22b11e8c)
		materials = [
			gtr22_bridge_whammy1_primary
		]
		guitar_string_start = gtr22_bridge_whammy1_str_start_properties
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr20_bc_rich_beast
						gtr21_bc_rich_warbeast
						gtr22_bc_rich_warlock
						gtr180_richbich
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/bridges/gtr22_bridge_whammy1`
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
		desc_id = gtr_bc_rich_bridge_21
		frontend_desc = qs(0xc3bc3aa5)
		materials = [
			gtr_bc_rich_bridge_21_primary
		]
		guitar_string_start = gtr_bc_rich_bridge_21_str_start_properties
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr20_bc_rich_beast
						gtr21_bc_rich_warbeast
						gtr22_bc_rich_warlock
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/bridges/gtr_bc_rich_bridge_21`
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
		desc_id = gtr180_bridge
		frontend_desc = qs(0x4f5dee2c)
		materials = [
			gtr180_bridge_primary
		]
		guitar_string_start = gtr_bc_rich_bridge_21_str_start_properties
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr180_richbich
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/bc_rich/gtr180_bridge`
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
		desc_id = gtr10_bridge_mcswain_1
		frontend_desc = qs(0xcf7d93bc)
		materials = [
			gtr10_bridge_mcswain_1_primary
		]
		guitar_string_start = gtr10_bridge_mcswain_1_str_start_properties
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr10_mcswain_flame
						gtr11_mcswain_carved
						gtr12_mcswain_minferno
						gtr13_mcswain_machine
						gtr14_mcswain_life
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/bridges/gtr10_bridge_mcswain_1`
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
		desc_id = gtr_bridge_mcswain_2
		frontend_desc = qs(0xd695a9e9)
		materials = [
			gtr_bridge_mcswain_2_primary
		]
		guitar_string_start = gtr_bridge_mcswain_2_str_start_properties
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr11_mcswain_carved
						gtr12_mcswain_minferno
						gtr13_mcswain_machine
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/bridges/gtr_bridge_mcswain_2`
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
		desc_id = gtr_brdg_mcswn_inferno_3
		frontend_desc = qs(0x00db211c)
		materials = [
			gtr_brdg_mcswn_inferno_3_primary
		]
		guitar_string_start = gtr_brdg_mcswn_inferno_3_str_start_properties
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr10_mcswain_flame
						gtr11_mcswain_carved
						gtr12_mcswain_minferno
						gtr13_mcswain_machine
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/bridges/gtr_brdg_mcswn_inferno_3`
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
		desc_id = gtr_bridge_mcswain_2b
		frontend_desc = qs(0xd695a9e9)
		materials = [
			gtr_bridge_mcswain_2_primary
		]
		guitar_string_start = gtr_bridge_mcswain_2_str_start_properties
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr14_mcswain_life
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/bridges/gtr_bridge_mcswain_2`
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
		desc_id = gtr_brdg_mcswn_inferno_3b
		frontend_desc = qs(0x00db211c)
		materials = [
			gtr_brdg_mcswn_inferno_3_primary
		]
		guitar_string_start = gtr_brdg_mcswn_inferno_3_str_start_properties
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr14_mcswain_life
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/bridges/gtr_brdg_mcswn_inferno_3`
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
		desc_id = gtr_bridge_mcswain_l_4
		frontend_desc = qs(0xb43e5fb8)
		materials = [
			gtr_bridge_mcswain_l_4_primary
		]
		guitar_string_start = gtr_bridge_mcswain_l_4_str_start_properties
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr10_mcswain_flame
						gtr11_mcswain_carved
						gtr12_mcswain_minferno
						gtr13_mcswain_machine
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/bridges/gtr_bridge_mcswain_l_4`
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
		desc_id = gtr_bridge_mcswain_l_5
		frontend_desc = qs(0xec5392ce)
		materials = [
			gtr_bridge_mcswain_l_5_primary
		]
		guitar_string_start = gtr_bridge_mcswain_l_5_str_start_properties
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr14_mcswain_life
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/bridges/gtr_bridge_mcswain_l_5`
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
		desc_id = gtr_bridge_mcswain_6
		frontend_desc = qs(0xd1fe756b)
		materials = [
			gtr_bridge_mcswain_6_primary
		]
		guitar_string_start = gtr_bridge_mcswain_6_str_start_properties
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr10_mcswain_flame
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/mcswain/gtr_bridge_mcswain_6`
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
		desc_id = gtr_bridge_01
		frontend_desc = qs(0xe3256784)
		guitar_string_start = gtr_bridge_01b_str_start_properties
		materials = [
			gtr_hardware03a_primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr9_esp_ax
						gtr70_sch_ultra
						gtr71_sch_c1
						gtr72_sch_devil
						gtr73_sch_s1
						gtr74_sch_star
						gtr1_sch_tempest
						gtr109_metal
						gtr133_tiki
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/bridges/gtr_bridge_01`
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
		desc_id = gtr70_bridge
		frontend_desc = qs(0x53951716)
		guitar_string_start = gtr70_bridge_str_start_properties
		materials = [
			gtr70_bridge_primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr9_esp_ax
						gtr70_sch_ultra
						gtr71_sch_c1
						gtr72_sch_devil
						gtr73_sch_s1
						gtr74_sch_star
						gtr1_sch_tempest
						gtr83_prs_stla
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/bridges/gtr70_bridge`
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
		desc_id = gtr72_bridge
		frontend_desc = qs(0xddfd5fc4)
		guitar_string_start = gtr72_bridge_str_start_properties
		materials = [
			gtr72_bridge_primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr9_esp_ax
						gtr72_sch_devil
						gtr73_sch_s1
						gtr74_sch_star
						gtr64_esp_f
						gtr63f_esp_ex
						gtr62_esp_alexi
						gtr4_esp_eclipse_01
						gtr12_esp_v_01
						gtr9_esp_ax
						gtr9_esp_ax
						gtr_31_viper_new
						gtr37_rw01_new
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/bridges/gtr72_bridge`
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
		desc_id = gtr71_bridge
		frontend_desc = qs(0xddfd5fc4)
		guitar_string_start = gtr71_bridge_str_start_properties
		materials = [
			gtr71_bridge_primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr9_esp_ax
						gtr71_sch_c1
						gtr70_sch_ultra
						gtr1_sch_tempest
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/bridges/gtr71_bridge`
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
		desc_id = gtr74_bridge1
		frontend_desc = qs(0x364bf61b)
		guitar_string_start = gtr74_bridge_str_start_properties
		materials = [
			gtr74_bridge1_primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr9_esp_ax
						gtr71_sch_c1
						gtr70_sch_ultra
						gtr72_sch_devil
						gtr74_sch_star
						gtr1_sch_tempest
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/bridges/gtr74_bridge1`
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
		desc_id = gtr74_bridge1b
		frontend_desc = qs(0x0edbe187)
		guitar_string_start = gtr74_bridge_str_start_properties
		materials = [
			gtr74_bridge1_primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr73_sch_s1
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/bridges/gtr74_bridge1`
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
		desc_id = gtr75_bridge
		frontend_desc = qs(0xec82e0a4)
		guitar_string_start = gtr75_bridge_str_start_properties
		materials = [
			gtr75_bridge_primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr75_ibz_xpt
						gtr76_ibz_s5470
						gtr77_ibz_rg
						gtr108_casket
						gtr109_metal
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/bridges/gtr75_bridge`
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
		desc_id = gtr75_bridge2
		frontend_desc = qs(0x2d748c5a)
		guitar_string_start = gtr75_bridge2_str_start_properties
		materials = [
			gtr75_bridge2_primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr75_ibz_xpt
						gtr76_ibz_s5470
						gtr77_ibz_rg
						gtr178_ibz_ict
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/bridges/gtr75_bridge2`
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
		desc_id = gtr32_hardware01_n
		frontend_desc = qs(0xe3256784)
		guitar_string_start = gtr32_hardware01_str_start_properties
		materials = [
			gtr33_hardware01z_primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr33d_base
						gtr39_esp_nv
						gtr40_px_body
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/esp/gtr32_hardware01`
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
		desc_id = gtr77_bridge
		frontend_desc = qs(0x7e89c2d1)
		guitar_string_start = gtr77_bridge_str_start_properties
		materials = [
			gtr77_bridge_primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr75_ibz_xpt
						gtr76_ibz_s5470
						gtr77_ibz_rg
						gtr178_ibz_ict
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/bridges/gtr77_bridge`
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
		desc_id = gtr75_bridgeb
		frontend_desc = qs(0xb22f7ed7)
		guitar_string_start = gtr79_whammy_str_start_properties
		materials = [
			gtr_hardware64bc_primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr75_ibz_xpt
						gtr76_ibz_s5470
						gtr77_ibz_rg
						gtr108_casket
						gtr109_metal
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/bridges/gtr75_bridgeb`
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
		desc_id = gtr76_bridge
		frontend_desc = qs(0xfe8b53a6)
		guitar_string_start = gtr76_bridge_str_start_properties
		materials = [
			gtr76_bridge_primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr64_esp_f
						gtr63f_esp_ex
						gtr62_esp_alexi
						gtr37_rw01_new
						gtr_31_viper_new
						gtr4_esp_eclipse_01
						gtr12_esp_v_01
						gtr9_esp_ax
						gtr75_ibz_xpt
						gtr76_ibz_s5470
						gtr77_ibz_rg
						gtr178_ibz_ict
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/bridges/gtr76_bridge`
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
		guitar_string_start = kurt_bridge_str_start_properties
		materials = [
			gtr78_bridge_primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr78_kurt
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/bridges/gtr78_bridge`
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
		desc_id = gtr_bridge_mcswain_l_4b
		frontend_desc = qs(0x6973bba6)
		materials = [
			gtr_bridge_mcswain_l_4_primary
		]
		guitar_string_start = gtr_bridge_mcswain_l_4_str_start_properties
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr90_dr_daisy
						gtr91_dr_heart
						gtr92_dr_star
						gtr93_dr_siren
						gtr94_dr_tomboy
						gtr109_metal
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/bridges/gtr_bridge_mcswain_l_4`
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
		desc_id = gtr_bridge_01d
		frontend_desc = qs(0x421f0555)
		materials = [
			gtr_hardware03a_primary
		]
		guitar_string_start = gtr_bridge_01_str_start_properties
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr64_esp_f
						gtr63f_esp_ex
						gtr62_esp_alexi
						gtr9_esp_ax
						gtr_31_viper_new
						gtr90_dr_daisy
						gtr91_dr_heart
						gtr92_dr_star
						gtr93_dr_siren
						gtr94_dr_tomboy
						gtr4_esp_eclipse_01
						gtr12_esp_v_01
						gtr37_rw01_new
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/bridges/gtr_bridge_01`
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
		desc_id = gtr94_bridge
		frontend_desc = qs(0xc69b70de)
		guitar_string_start = gtr94_bridge_str_start_properties
		materials = [
			gtr94_bridge_primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr94_dr_tomboy
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/bridges/gtr94_bridge`
							attach_indices = [
								1
							]
						}
					]
				}
				{
					parents = [
						gtr90_dr_daisy
						gtr91_dr_heart
						gtr92_dr_star
						gtr93_dr_siren
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/bridges/gtr94_bridge`
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
		desc_id = gtr75_bridgemm
		frontend_desc = qs(0xb62696a4)
		guitar_string_start = gtr79_whammy_str_start_properties
		materials = [
			gtr75_bridge_primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr84_mm_petrucci
						gtr80_prs_sant
						gtr86_mm_axis
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/bridges/gtr75_bridge`
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
		desc_id = gtr75_bridgebmm
		frontend_desc = qs(0x48fac7b7)
		guitar_string_start = gtr79_whammy_str_start_properties
		materials = [
			gtr_hardware64bc_primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr84_mm_petrucci
						gtr82_prs_se1
						gtr86_mm_axis
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/bridges/gtr75_bridgeb`
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
		desc_id = gtr76_bridgemm
		frontend_desc = qs(0xfe8b53a6)
		guitar_string_start = gtr76_bridge_str_start_properties
		materials = [
			gtr76_bridge_primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr82_prs_se1
						gtr84_mm_petrucci
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/bridges/gtr76_bridge`
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
		desc_id = gtr84_whammy
		frontend_desc = qs(0x5fb58f3c)
		guitar_string_start = gtr84_whammy_str_start_properties
		materials = [
			gtr84_whammy_primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr84_mm_petrucci
						gtr86_mm_axis
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/bridges/gtr84_whammy`
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
		desc_id = gtr86_bridge
		frontend_desc = qs(0x71de0a90)
		guitar_string_start = gtr86_bridge_str_start_properties
		materials = [
			gtr86_bridge_primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr86_mm_axis
						gtr84_mm_petrucci
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/bridges/gtr86_bridge`
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
		desc_id = gtr79_whammy
		frontend_desc = qs(0x602994d6)
		guitar_string_start = gtr79_bridge_str_start_properties
		materials = [
			gtr79_whammy_primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr79_prs_cstm24
						gtr80_prs_sant
						gtr81_prs_miramt
						gtr82_prs_se1
						gtr78_prs_sc
						gtr83_prs_stla
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/bridges/gtr79_whammy`
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
		desc_id = gtr78_bridge01
		frontend_desc = qs(0x3694d3be)
		guitar_string_start = gtr78_bridge01_str_start_properties
		materials = [
			gtr81_bridge01_primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr79_prs_cstm24
						gtr80_prs_sant
						gtr81_prs_miramt
						gtr82_prs_se1
						gtr78_prs_sc
						gtr83_prs_stla
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/bridges/gtr78_bridge01`
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
		desc_id = gtr81_bridge01
		frontend_desc = qs(0xbd6acc58)
		guitar_string_start = gtr81_bridge_str_start_properties
		materials = [
			gtr81_bridge01_primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr79_prs_cstm24
						gtr80_prs_sant
						gtr81_prs_miramt
						gtr82_prs_se1
						gtr78_prs_sc
						gtr83_prs_stla
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/bridges/gtr81_bridge01`
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
		desc_id = gtr1b_bridge_whamy
		frontend_desc = qs(0xab837d05)
		guitar_string_start = gtr130_bridge_str_start_properties
		materials = [
			gtr1b_bridge_whamy_primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr1b_nvsft_sk8gtr
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/heroes/gtr1b_bridge_whamy`
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
		desc_id = gtr27_bridge_acoustic
		frontend_desc = qs(0x2e63e837)
		guitar_string_start = gtr26_bridge_cash_string_start_properties
		materials = [
			gtr27_bridge_acoustic_primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr27_nsft_acoustic
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/heroes/gtr27_bridge_acoustic`
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
		desc_id = gtr130_bridge
		frontend_desc = qs(0x5f83866e)
		materials = [
			gtr130b_bridge_primary
		]
		guitar_string_start = gtr4_bridgewhammy_str_start_properties
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr130_steampunk
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/bridges/gtr130_bridge`
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
		desc_id = gtr131_bridge
		frontend_desc = qs(0xaa98876d)
		guitar_string_start = gtr130_bridge_str_start_properties
		materials = [
			gtr131_bridge_primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr131_steel
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/bridges/gtr131_bridge`
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
		desc_id = gtr132_bridge
		frontend_desc = qs(0xaa98876d)
		guitar_string_start = 0xb1b0850d
		materials = [
			gtr132_bridge_primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr132_axe
					]
					node_set = 0
					meshes = [
						{
							mesh = 0x316dc4fc
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
		desc_id = gtr110_bridge
		frontend_desc = qs(0x60f2de02)
		guitar_string_start = gtr110_bridge_str_start_properties
		materials = [
			gtr110_bridge_primary
		]
		chosen_materials = {
			material1 = yellow_3guitar
		}
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr110_banjo
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/bridges/gtr110_bridge`
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
		desc_id = gtr109_bridge
		frontend_desc = qs(0x0b74d575)
		guitar_string_start = gtr109_bridge_str_start_properties
		materials = [
			gtr109_bridge_primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr109_metal
					]
					node_set = 1
					meshes = [
						{
							mesh = 0x558ae46f
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
		desc_id = gtr108_bridge
		frontend_desc = qs(0x684038fc)
		guitar_string_start = gtr108_bridge_str_start_properties
		materials = [
			gtr108_bridge_primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr108_casket
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/bridges/gtr108_bridge`
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
		desc_id = gtr133_bridge
		frontend_desc = qs(0x597dd83e)
		guitar_string_start = gtr133_bridge_str_start_properties
		materials = [
			gtr133_bridge_primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr133_tiki
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/bridges/gtr133_bridge`
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
		desc_id = gtr142_bridge
		frontend_desc = qs(0x048d80b3)
		guitar_string_start = gtr133_bridge_str_start_properties
		materials = [
			gtr142_vtwin_bridge_hardware
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr142_vtwin
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/heroes/gtr142_bridge`
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
		desc_id = gtr136_bridge
		frontend_desc = qs(0x7e89c2d1)
		guitar_string_start = gtr136_bridge_str_start_properties
		materials = [
			gtr136_bridge_primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr136_glass
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/bridges/gtr136_bridge`
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
		desc_id = gtr136_bridge02
		frontend_desc = qs(0x7e89c2d1)
		guitar_string_start = gtr136_bridge_str_start_properties
		materials = [
			gtr136_bridge02_primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr64_esp_f
						gtr63f_esp_ex
						gtr62_esp_alexi
						gtr4_esp_eclipse_01
						gtr12_esp_v_01
						gtr9_esp_ax
						gtr9_esp_ax
						gtr_31_viper_new
						gtr37_rw01_new
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/bridges/gtr136_bridge02`
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
		desc_id = gtr_bridge_johnny
		frontend_desc = qs(0xe3256784)
		guitar_string_start = gtr_bridge_01b_str_start_properties
		materials = [
			gtr135_bridge_primary
		]
		chosen_materials = {
			material1 = yellow_4guitar
		}
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr135_johnny
					]
					node_set = 1
					meshes = [
						{
							mesh = 0x3ba8cde5
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
		desc_id = gtr26_bridge_cash
		frontend_desc = qs(0x6008ec21)
		guitar_string_start = gtr26_bridge_cash_string_start_properties
		materials = [
			gtr26_bridge_cash_primary
		]
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr26_cash_acoustic
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/cash/gtr26_bridge_cash`
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
		desc_id = gtr_brdg_manson_1
		frontend_desc = qs(0x499d4ecc)
		materials = [
			gtr_brdg_manson_1_primary
		]
		guitar_string_start = gtr_brdg_manson_1_str_start_properties
		guitar_string_end = default_guitar_string_end_properties
		node_meshes = {
			$guitar_bridges_nodes
			placements = [
				{
					parents = [
						gtr25_manson_bellamy
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/bridges/gtr_brdg_manson_1`
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
cas_guitar_misc = [
	{
		desc_id = gtr_misc_switch
		frontend_desc = qs(0xc6154ac3)
		materials = [
			gtr_misc_switch2_primary
		]
		node_meshes = {
			$guitar_misc_nodes
			placements = [
				{
					parents = [
						gtr40_px_body
						gtr10_mcswain_flame
						gtr11_mcswain_carved
						gtr12_mcswain_minferno
						gtr14_mcswain_life
						gtr20_bc_rich_beast
						gtr21_bc_rich_warbeast
						gtr22_bc_rich_warlock
						gtr39_esp_nv
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/misc/gtr_misc_switch2`
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
		desc_id = gtr_misc_switch_bich
		frontend_desc = qs(0xc6154ac3)
		materials = [
			gtr_misc_switch2_primary
		]
		node_meshes = {
			$guitar_misc_nodes
			placements = [
				{
					parents = [
						gtr180_richbich
					]
					node_set = 6
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/misc/gtr_misc_switch2`
							attach_indices = [
								1
								2
								3
								4
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
		desc_id = gtr_misc_switch_blk_3
		frontend_desc = qs(0x2796be6a)
		materials = [
			gtr_misc_switch_blk_3_primary
		]
		node_meshes = {
			$guitar_misc_nodes
			placements = [
				{
					parents = [
						gtr10_mcswain_flame
						gtr11_mcswain_carved
						gtr12_mcswain_minferno
						gtr14_mcswain_life
						gtr20_bc_rich_beast
						gtr21_bc_rich_warbeast
						gtr22_bc_rich_warlock
						gtr39_esp_nv
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/misc/gtr_misc_switch_blk_3`
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
		desc_id = gtr13_misc_gauges
		frontend_desc = qs(0x940675f9)
		node_meshes = {
			$guitar_misc_nodes
			placements = [
				{
					parents = [
						gtr13_mcswain_machine
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/misc/gtr13_misc_gauges`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models/car_instruments/guitar/gh5/misc/gtr13_misc_gauges_glow`
							attach_indices = [
								1
							]
						}
						{
							mesh = `models/car_instruments/guitar/gh5/misc/gtr13_misc_switch1`
							tex = `models/car_instruments/guitar/gh5/misc/gtr13_misc_gauges`
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
		desc_id = gtr13_misc_switch
		frontend_desc = qs(0x93a392c2)
		node_meshes = {
			$guitar_misc_nodes
			placements = [
				{
					parents = [
						gtr13_mcswain_machine
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/misc/gtr13_misc_switch1`
							tex = `models/car_instruments/guitar/gh5/misc/gtr13_misc_gauges`
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
		desc_id = gtr_misc_mcswn_swtch1
		frontend_desc = qs(0xc7fe120a)
		node_meshes = {
			$guitar_misc_nodes
			placements = [
				{
					parents = [
						gtr14_mcswain_life
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/misc/gtr_misc_mcswn_swtch1`
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
		desc_id = gtr_misc_switch4
		frontend_desc = qs(0x93a392c2)
		materials = [
			gtr_misc_switch4_primary
		]
		node_meshes = {
			$guitar_misc_nodes
			placements = [
				{
					parents = [
						gtr_32_body_new
						gtr64_esp_f
						gtr63f_esp_ex
						gtr62_esp_alexi
						gtr12_esp_v_01
						gtr33d_base
						gtr4_esp_eclipse_01
						gtr_31_viper_new
						gtr9_esp_ax
						gtr75_ibz_xpt
						gtr72_sch_devil
						gtr71_sch_c1
						gtr70_sch_ultra
						gtr1_sch_tempest
						gtr73_sch_s1
						gtr74_sch_star
						gtr78_prs_sc
						gtr79_prs_cstm24
						gtr84_mm_petrucci
						gtr90_dr_daisy
						gtr80_prs_sant
						gtr92_dr_star
						gtr91_dr_heart
						gtr93_dr_siren
						gtr94_dr_tomboy
						gtr86_mm_axis
						gtr78_prs_sc
						gtr79_prs_cstm24
						gtr81_prs_miramt
						gtr178_ibz_ict
						gtr39_esp_nv
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/misc/gtr_misc_switch4`
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
		desc_id = gtr71_switch
		frontend_desc = qs(0x83bd9c88)
		materials = [
			gtr71_switch_primary
		]
		node_meshes = {
			$guitar_misc_nodes
			placements = [
				{
					parents = [
						gtr71_sch_c1
						gtr84_mm_petrucci
						gtr86_mm_axis
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/misc/gtr71_switch`
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
		desc_id = gtr76_switch
		frontend_desc = qs(0x93a392c2)
		materials = [
			gtr76_switch_primary
		]
		node_meshes = {
			$guitar_misc_nodes
			placements = [
				{
					parents = [
						gtr39_esp_nv
						gtr9_esp_ax
						gtr76_ibz_s5470
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/misc/gtr76_switch`
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
		desc_id = gtr78_misc
		frontend_desc = qs(0x93a392c2)
		materials = [
			gtr78_misc_primary
		]
		node_meshes = {
			$guitar_misc_nodes
			placements = [
				{
					parents = [
						gtr78_kurt
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/misc/gtr78_misc`
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
		desc_id = double_switches
		frontend_desc = qs(0x9f602986)
		materials = [
			gtr80_switch_primary
		]
		node_meshes = {
			$guitar_misc_nodes
			placements = [
				{
					parents = [
						gtr80_prs_sant
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/misc/gtr80_switch01`
							initial_values = {
								Color = grey_3guitar
							}
							attach_indices = [
								1
							]
						}
						{
							mesh = `models/car_instruments/guitar/gh5/misc/gtr80_switch02`
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
		desc_id = gtr1b_misc_wheels
		frontend_desc = qs(0x28706c65)
		materials = [
			gtr1b_nvsft_misc_primary
		]
		node_meshes = {
			$guitar_misc_nodes
			placements = [
				{
					parents = [
						gtr1b_nvsft_sk8gtr
					]
					node_set = 3
					meshes = [
						{
							mesh = `models/car_instruments/guitar/heroes/gtr1b_misc_wheels`
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
		desc_id = gtr130_misc
		frontend_desc = qs(0x93a392c2)
		materials = [
			gtr130_misc_primary
		]
		node_meshes = {
			$guitar_misc_nodes
			placements = [
				{
					parents = [
						gtr130_steampunk
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/misc/gtr130_misc`
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
		desc_id = gtr110_misc
		frontend_desc = qs(0x22f04441)
		materials = [
			gtr110_misc_primary
		]
		node_meshes = {
			$guitar_misc_nodes
			placements = [
				{
					parents = [
						gtr110_banjo
					]
					node_set = 0
					meshes = [
						{
							mesh = 0x61da43e3
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
		desc_id = gtr132_misc
		frontend_desc = qs(0x0fa2adb3)
		materials = [
			gtr132_misc_primary
		]
		node_meshes = {
			$guitar_misc_nodes
			placements = [
				{
					parents = [
						gtr132_axe
					]
					node_set = 0
					meshes = [
						{
							mesh = 0xbb8df3c1
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
		desc_id = gtr133_misc
		frontend_desc = qs(0x29975138)
		materials = [
			gtr133_misc_primary
		]
		node_meshes = {
			$guitar_misc_nodes
			placements = [
				{
					parents = [
						gtr133_tiki
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/misc/gtr133_misc`
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
		desc_id = gtr136_misc
		frontend_desc = qs(0x53c1766c)
		materials = [
			gtr136_misc_primary
		]
		node_meshes = {
			$guitar_misc_nodes
			placements = [
				{
					parents = [
						gtr136_glass
					]
					node_set = 0
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/misc/gtr136_misc`
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
		desc_id = gtr135_misc
		frontend_desc = qs(0x3b86ba16)
		materials = [
			gtr135_misc_primary
		]
		node_meshes = {
			$guitar_misc_nodes
			placements = [
				{
					parents = [
						gtr135_johnny
					]
					node_set = 0
					meshes = [
						{
							mesh = 0xa688c379
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
		desc_id = gtr_misc_switch_m
		frontend_desc = qs(0x95ba3660)
		materials = [
			gtr_misc_switch2_primary
		]
		node_meshes = {
			$guitar_misc_nodes
			placements = [
				{
					parents = [
						gtr25_manson_bellamy
					]
					node_set = 1
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/misc/gtr_misc_switch2`
							attach_indices = [
								3
								4
							]
						}
						{
							mesh = `models/car_instruments/guitar/gh5/misc/gtr_miscknob_manson_02`
							tex = `models/car_instruments/guitar/gh5/misc/gtr_miscknob_manson_02`
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
		desc_id = gtr_miscknob_manson_02
		frontend_desc = qs(0x96a8abf5)
		materials = [
			gtr_miscknob_manson_02_primary
		]
		node_meshes = {
			$guitar_misc_nodes
			placements = [
				{
					parents = [
						gtr25_manson_bellamy
					]
					node_set = 2
					meshes = [
						{
							mesh = `models/car_instruments/guitar/gh5/misc/gtr_miscknob_manson_02`
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
car_rocker_guitars_factoredglobal_0 = {
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
car_rocker_guitars_factoredglobal_1 = {
	has_node_array
	locked
}
car_rocker_guitars_factoredglobal_13 = {
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
car_rocker_guitars_factoredglobal_24 = {
	hidden
	has_node_array
}
0x20c2ad2f = {
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
car_rocker_guitars_factoredglobal_33 = {
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
car_rocker_guitars_factoredglobal_35 = {
	user_layer_settings = {
		diffuse
		ui_rotated_90
		initial_values = {
			x_trans = -2
			x_scale = 17
			y_scale = 23
			y_trans = 0
		}
		aspect_ratio = 1.75
	}
}
0x1fe9cf67 = {
	initial_values = {
		Color = grey_5
	}
}
car_rocker_guitars_factoredglobal_48 = {
	initial_values = {
		Color = grey_2
	}
}
car_rocker_guitars_factoredglobal_49 = {
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
car_rocker_guitars_factoredglobal_50 = {
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
car_rocker_guitars_factoredglobal_51 = {
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
car_rocker_guitars_factoredglobal_52 = {
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
car_rocker_guitars_factoredglobal_53 = {
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
car_rocker_guitars_factoredglobal_54 = {
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
car_rocker_guitars_factoredglobal_55 = {
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
car_rocker_guitars_factoredglobal_56 = {
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
car_rocker_guitars_factoredglobal_57 = {
	user_layer_settings = {
		diffuse
		ui_rotated_90
		initial_values = {
			x_trans = -25
			x_scale = 26
			y_scale = 26
			y_trans = -20
			flags = 3
		}
	}
}
car_rocker_guitars_factoredglobal_58 = {
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
car_rocker_guitars_factoredglobal_60 = {
	user_layer_settings = {
		diffuse
		ui_rotated_90
		initial_values = {
			y_trans = -25
			x_scale = 23
			y_scale = 20
			x_trans = -26
		}
	}
}
preset_layer_details = {
	desc_id = details
	frontend_desc = qs(0x7f5a5c11)
	diffuse
	pre_userlayer
}
guitar_bridges_nodes = {
	node_array_part = cas_guitar_body
	node_type = bridge
}
guitar_pickups_nodes = {
	node_array_part = cas_guitar_body
	node_type = pickup
}
guitar_misc_nodes = {
	node_array_part = cas_guitar_body
	node_type = Misc
}
preset_layer_fades = {
	desc_id = fades
	frontend_desc = qs(0x081f2003)
	diffuse
	pre_userlayer
}
guitar_knobs_nodes = {
	node_array_part = cas_guitar_body
	node_type = knob
}
preset_layer_inlays = {
	desc_id = finishes
	frontend_desc = qs(0x3436c336)
	diffuse
	pre_userlayer
}
preset_layer_finishes = {
	desc_id = finishes
	frontend_desc = qs(0x3f47b13d)
	diffuse
	pre_userlayer
}
