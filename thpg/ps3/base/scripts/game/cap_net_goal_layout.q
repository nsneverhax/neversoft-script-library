CAP_NetGoalLayout_Object_Settings = {
	state = {
		up_offset = 0.05
		forward_offset = 12
		camera_dist = 15
		force_to_ground = false
	}
}
CAP_NetGoalLayout_Objects = {
	NetGoalLayout = [
		{
			name = net_start_pos_cursor
			ui_name = "Start Position"
			model = 'missions\\generic_start_asset\\generic_start_asset'
			collision = 'missions\\generic_start_asset_coll\\generic_start_asset_coll'
			NoNodeArray
			norail
			NotPlaceable
			state = {
				up_offset = 0.05
				forward_offset = 12
				camera_dist = 10
				force_to_ground = true
			}
			not_placeable_place_script = net_horse_choose_start_pos
		}
		{
			name = trigger_object_selector
			ui_name = "Choose Objects"
			model = 'GameObjects\\horse_arrow\\horse_arrow'
			collision = 'none'
			NoNodeArray
			norail
			NotPlaceable
			state = {
				up_offset = 0.5
				forward_offset = 12
				camera_dist = 10
				force_to_ground = true
			}
			cursor_components = [
				{
					component = groundcollisioncallback
					begin_contact_callback = net_horse_callback_begin_contact
					end_contact_callback = net_horse_callback_end_contact
				}
			]
			is_valid_script = net_horse_menu_item_validation_script
			associated_goal = net_horse
			not_placeable_place_script = net_horse_choose_piece
		}
		{
			name = NTTKicker
			ui_name = "NTT Kicker"
			model = 'Props\\Kicker_online\\Kicker_online'
			collision = 'Props\\Kicker_online_coll\\Kicker_online_coll'
			sounds = CAP_Sliding_Sounds_Wood
			NotPlaceable
			is_valid_script = net_horse_menu_item_validation_script
			associated_goal = net_horse_ntt
			state = {
				up_offset = 0.05
				forward_offset = 12
				camera_dist = 10
				force_to_ground = true
			}
			not_placeable_place_script = net_horse_choose_kicker
		}
		{
			name = net_end_pos_cursor
			ui_name = "End Position"
			model = 'missions\\generic_finish_asset\\generic_finish_asset'
			collision = 'none'
			NoNodeArray
			norail
			NotPlaceable
			state = {
				up_offset = 0.05
				forward_offset = 12
				camera_dist = 10
				force_to_ground = true
			}
			not_placeable_place_script = net_horse_choose_end_pos
		}
		{
			name = done_object
			ui_name = "Finish"
			model = 'GameObjects\\hud_arrow\\hud_arrow'
			collision = 'none'
			NoNodeArray
			norail
			NotPlaceable
			state = {
				up_offset = 1
				forward_offset = 12
				camera_dist = 10
				force_to_ground = true
			}
			not_placeable_place_script = net_horse_menu_finish_selection
		}
	]
}
