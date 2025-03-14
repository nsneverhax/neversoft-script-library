ped_avoid_jump_time = 3.0
ped_low_priority_waypoint_probability = 0.2
ped_min_distance_to_path = 0.05
ped_max_distance_to_path = 1.2
ped_min_bias = 1E-06
ped_avoid_ped_range = 1.5
ped_avoid_ped_bias = 0.4
ped_whisker_decay_factor = 0.8
ped_head_on_range = 0.175
ped_target_node_bias = 0.75
ped_max_angle_to_heading = 0.175
ped_branching_path_min_angle = 90
ped_fade_target_bias_max_distance_square = 2.6399999
ped_min_inner_path_angle = 80
ped_turn_frames = 30
ped_max_y_distance_to_ignore = 0.9
ped_walker_min_square_distance_to_dead_end = 0.625
ped_min_notice_TrickScore = 500
ped_skater_min_square_distance_to_waypoint = 0.0019
ped_skater_min_square_distance_to_skater = 0.36
ped_skater_min_square_distance_to_crouch_for_jump = 9
ped_skater_fade_target_bias_max_distance_square = 4.4100003
ped_skater_stick_dist_below = 0.6
ped_skater_stick_dist_above = 0.45000002
ped_skater_vert_jump_speed_slop = 1
ped_skater_deltav = 2.5
ped_skater_bail_deceleration = 0.225
ped_skater_stop_deceleration = 0.25
ped_skater_min_180_spin_time = 0.3
ped_skater_vert_rotation_time_slop = 1.1
ped_skater_spine_rotation_slop = 60
ped_skater_jump_to_next_node_height_slop = 0.04
ped_skater_jump_speed = 1
goalped_MinAnimSpeed = 0.75
goalped_MaxAnimSpeed = 1.25

script RegisterBehaviors_SkateSkaterPed 
	registerstate {
		name = Bv_SkaterPed_HandleBoardTransition
		task = {name = task_manageskateboard
			params = {enter_behavior = Bv_EquipSkateboard
				exit_behavior = Bv_UnequipSkateboardInstant
				skateboard_item_id = skateboard
				failed_event_id = ManageSkateboard_NothingToDo}
		}
	}
	registerstate {
		name = Bv_EquipSkateboard
		transitions = [{events = [enter_behavior]
				conditions = [{name = agent_hasvehicleofspecies
						params = {species = skateboard}
						result = false
					}]
				responses = [{replacement = reaction
						state = Bv_ManageReactionState
						params = [{name = state val = bump}]
					}
					{replacement = select
						state = inventory_selectiteminslot
						params = [{name = item_slot_id val = torch}]
					}
					{replacement = equip
						state = inventory_equipiteminstant
						params = [{name = equip_slot_id val = right_hand}]
					}
					{replacement = enter
						state = Bv_EnterItemVehicleInstant
					}]
			}
			{events = [AcquireVehicle_Finished
					AcquireVehicle_Failed]
				responses = [{replacement = this
						state = bv_blank
					}]
			}]
	}
	registerstate {
		name = Bv_UnequipSkateboard
		transitions = [{events = [enter_behavior]
				conditions = [{name = agent_hasvehicleofspecies
						params = {species = skateboard}
					}]
				responses = [{replacement = reaction
						state = Bv_ManageReactionState
						params = [{name = state val = bump}]
					}
					{replacement = unequip
						state = inventory_unequipactiveitem
					}
					{replacement = anims
						state = agent_finishcustomanim
					}
					{replacement = exit
						state = Bv_ExitItemVehicle
					}]
			}
			{events = [ReleaseVehicle_Finished
					ReleaseVehicle_Failed]
				responses = [{replacement = this
						state = bv_blank
					}]
			}]
	}
	registerstate {
		name = Bv_UnequipSkateboardInstant
		transitions = [{events = [enter_behavior]
				conditions = [{name = agent_hasvehicleofspecies
						params = {species = skateboard}
					}]
				responses = [{replacement = unequip
						state = inventory_unequipactiveitem
					}
					{replacement = exit
						state = Bv_ExitItemVehicleInstant
					}]
			}]
	}
	registerstate {
		name = Bv_UnequipSkateboardInstant_ExitVehicle
		task = {name = Task_ExitItemVehicleInstant}
	}
	registerstate {
		name = Bv_SkaterPed_Push
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = agent_playcustomanim
						params = [{name = anim val = Move_Skateboard_PushInit}
							{name = blend_period val = 0.1}
							{name = finished_event_id val = PushOut_Finished}
							{name = interrupt_event_id val = Push_Interrupted}]
					}]
			}
			{events = [PushOut_Finished]
				responses = [{replacement = child
						state = agent_finishcustomanim
					}]
			}]
	}
	registerstate {
		name = Bv_GenEvents_Push
		task = {name = task_geneventspush
			params = {push_duration = 2.0
				flat_min_time = 1.0
				flat_max_time = 5.0
				incline_min_time = 0.0
				incline_max_time = 1.0
				push_event_id = Skater_Push}}
	}
	registerstate {
		name = Bv_GenEvents_Push_Aggressive
		task = {name = task_geneventspush
			params = {push_duration = 1.0
				flat_min_time = 0.5
				flat_max_time = 2.0
				incline_min_time = 0.0
				incline_max_time = 1.0
				push_event_id = Skater_Push}}
	}
endscript
