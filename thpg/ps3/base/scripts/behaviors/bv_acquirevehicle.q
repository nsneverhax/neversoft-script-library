Vehicle_MoveTo_Movement = {
	id = ped_vehicle_moveto_move
	movement = run_fast
	stop_distance = 1.5
	arrival_distance = 1.625
	departure_distance = 2
	point_arrival_distance = 0.5
	stopping_distance = 0.125
	starting_distance = 0.125
}
Dismount_Collision_On_Duration = 0.1

script RegisterBehaviors_AcquireVehicle 
	MountHorse_Move_MoveDesc = {
		id = MountHorse_Move_MoveDesc
		arrival_distance = 0.5
		stop_distance = 0
	}
	registerstate {
		name = Bv_EnterVehicle
		task =
		{
			name = Task_EnterVehicle
			params =
			{
				finished_event_id = AcquireVehicle_Finished
				failed_event_id = AcquireVehicle_Failed
			}
		}
		transitions = []
	}
	registerstate {
		name = Bv_ExitVehicle
		task = {name = Task_ExitVehicle
			params = {finished_event_id = ReleaseVehicle_Finished
				failed_event_id = ReleaseVehicle_Failed}}
		transitions = []
	}
	registerstate {
		name = Bv_EnterItemVehicleInstant
		task =
		{
			name = Task_EnterItemVehicle
			params =
			{
				finished_event_id = AcquireVehicle_Finished
				failed_event_id = AcquireVehicle_Failed
				instant
			}
		}
		transitions = []
	}
	registerstate {
		name = Bv_EnterItemVehicle
		task =
		{
			name = Task_EnterItemVehicle
			params =
			{
				finished_event_id = AcquireVehicle_Finished
				failed_event_id = AcquireVehicle_Failed
			}
		}
		transitions = []
	}
	registerstate {
		name = Bv_ExitItemVehicle
		task =
		{
			name = Task_ExitItemVehicle
			params =
			{
				finished_event_id = ReleaseVehicle_Finished
				failed_event_id = ReleaseVehicle_Failed
			}
		}
		transitions = []
	}
	registerstate {
		name = Bv_ExitItemVehicleInstant
		task =
		{
			name = Task_ExitItemVehicleInstant
			params =
			{
				finished_event_id = ReleaseVehicle_Finished
				failed_event_id = ReleaseVehicle_Failed
			}
		}
		transitions = []
	}
	registerstate {
		name = Bv_PlaceOnVehicle
		task =
		{
			name = Task_PlaceOnVehicle
			params =
			{
				finished_event_id = AcquireVehicle_Finished
				failed_event_id = AcquireVehicle_Failed
			}
		}
		transitions = []
	}
	registerstate {
		name = Bv_AnimSlideEnterVehicle
		task =
		{
			name = Task_AnimMoveEnterVehicle
			params =
			{
				finished_event_id = AcquireVehicle_Finished
				failed_event_id = AcquireVehicle_Failed
				align_behavior = Bv_AnimSlideEnterVehicle_Align
				move_behavior = Bv_AnimSlideEnterVehicle_Move
				anim_behavior = Bv_AnimSlideEnterVehicle_Anim
			}
		}
		transitions = []
	}
	registerstate {
		name = Bv_AnimSlideEnterVehicle_Align
		task =
		{
			name = Task_AlignTo
			params =
			{
				interest_type_id = vehicle
				path_stage = action
			}
		}
	}
	registerstate {
		name = Bv_AnimSlideEnterVehicle_Move
		task =
		{
			name = Task_SlideTo
			params =
			{
				interest_type_id = transit
				relative_offset_type = world
				relative_offset = (0.0, 0.0, 0.0)
				align = true
				blend_vert = true
				traverse_all = true
				path_stage = action
			}
		}
	}
	registerstate {
		name = Bv_AnimSlideEnterVehicle_Anim
		transitions =
		[
			{
				events = [enter_behavior]
				responses =
				[
					{
						replacement = anim
						state = Bv_CustomAnimHoldAndStopOnExit
						params =
						[
							{name = anim ref = anim_id}
							{name = custom_finished_event_id ref = finished_event_id}
							{name = blend_period val = 0.3}
						]
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_AnimSlideExitVehicle
		task =
		{
			name = Task_AnimMoveExitVehicle
			params =
			{
				finished_event_id = ReleaseVehicle_Finished
				failed_event_id = ReleaseVehicle_Failed
				move_behavior = Bv_AnimSlideExitVehicle_Move
				anim_behavior = Bv_AnimSlideExitVehicle_Anim
			}
		}
		transitions = []
	}
	registerstate {
		name = Bv_AnimSlideExitVehicle_Move
		task =
		{
			name = Task_SlideTo
			params =
			{
				interest_type_id = transit
				relative_offset_type = world
				relative_offset = (0.0, 0.0, 0.0)
				align = true
				blend_vert = true
				traverse_all = true
				path_stage = action
			}
		}
	}
	registerstate {
		name = Bv_AnimSlideExitVehicle_Anim
		transitions =
		[
			{
				events = [enter_behavior]
				responses =
				[
					{
						replacement = anim
						state = Bv_CustomAnimHoldAndStopOnExit
						params =
						[
							{name = anim ref = anim_id}
							{name = custom_finished_event_id ref = finished_event_id}
							{name = blend_period val = 0.3}
						]
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_MountHorse_Move
		transitions = [{events = [enter_behavior]
				responses = [{replacement = move
						state = Bv_MoveTo_Once_Transit
						params = [{name = finished_event_id ref = finished_event_id}
							{name = failed_event_id ref = failed_event_id}
							{name = movement_desc val = <MountHorse_Move_MoveDesc>}
							{name = movement_desc_stage val = action}
							{name = path_stage val = action}]
					}]
			}
		]
	}
	registerstate {
		name = Bv_MountHorse_Align
		task = {name = task_setmovedesc
			params = {movement_desc = {rot_accel = 15}
				movement_desc_stage = action}}
		transitions = [{events = [enter_behavior]
				responses = [{replacement = move
						state = Bv_SlideTo_Loop_Transit
						params = [{name = finished_event_id ref = finished_event_id}
							{name = failed_event_id ref = failed_event_id}
							{name = path_stage val = action}
							{name = traverse_all val = true}]
					}]
			}
		]
	}
	registerstate {
		name = Bv_MountHorse_Anim_Left
		task = {name = task_setmovedesc
			params = {movement_desc = {rot_accel = 15}
				movement_desc_stage = action}}
		transitions = [{events = [enter_behavior]
				responses = [{replacement = move
						state = Bv_MountHorse_Anim_Slide
						params = [{name = failed_event_id ref = failed_event_id}]
					}
					{replacement = anim
						state = Bv_CustomAnimHoldAndStopOnExit
						params = [{name = anim val = Enter_Horse_Left}
							{name = custom_finished_event_id ref = finished_event_id}
							{name = blend_period val = 0.3}]
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_MountHorse_Anim_Right
		task = {name = task_setmovedesc
			params = {movement_desc = {rot_accel = 15}
				movement_desc_stage = action}}
		transitions = [{events = [enter_behavior]
				responses = [{replacement = move
						state = Bv_MountHorse_Anim_Slide
						params = [{name = failed_event_id ref = failed_event_id}]
					}
					{replacement = anim
						state = Bv_CustomAnimHoldAndStopOnExit
						params = [{name = anim val = Enter_Horse_Right}
							{name = custom_finished_event_id ref = finished_event_id}
							{name = blend_period val = 0.3}]
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_MountHorse_Anim_Slide
		task =
		{
			name = Task_SlideTo
			params =
			{
				interest_type_id = transit
				relative_offset_type = world
				relative_offset = (0.0, 0.0, 0.0)
				time = 0.5
				align = true
				finished_event_id = SlideTo_Finished
				blend_vert = true
				traverse_all = true
				path_stage = action
			}
		}
	}
	registerstate {
		name = Bv_DismountHorse_Anim_Left
		transitions = [{events = [enter_behavior]
				responses = [{replacement = move
						state = Bv_DismountHorse_Anim_Slide
						params = [{name = failed_event_id ref = failed_event_id}]
					}
					{replacement = anim
						state = Bv_CustomAnimHoldAndStopOnExit
						params = [{name = anim val = Exit_Horse_Left}
							{name = custom_finished_event_id ref = finished_event_id}
							{name = blend_period val = 0.3}]
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_DismountHorse_Anim_Right
		transitions = [{events = [enter_behavior]
				responses = [{replacement = move
						state = Bv_DismountHorse_Anim_Slide
						params = [{name = failed_event_id ref = failed_event_id}]
					}
					{replacement = anim
						state = Bv_CustomAnimHoldAndStopOnExit
						params = [{name = anim val = Exit_Horse_Right}
							{name = custom_finished_event_id ref = finished_event_id}
							{name = blend_period val = 0.3}]
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_DismountHorse_Anim_Slide
		task =
		{
			name = Task_SlideTo
			params =
			{
				interest_type_id = transit
				relative_offset_type = world
				relative_offset = (0.0, 0.0, 0.0)
				time = 1.25
				align = true
				finished_event_id = SlideTo_Finished
				blend_vert = true
				traverse_all = true
				path_stage = action
			}
		}
	}
	registerstate {
		name = Bv_DismountCanoe_Anim_Left
		transitions = [{events = [enter_behavior]
				responses = [{replacement = move
						state = Bv_DismountCanoe_Anim_Slide
						params = [{name = failed_event_id ref = failed_event_id}]
					}
					{replacement = anim
						state = Bv_CustomAnimHoldAndStopOnExit
						params = [{name = anim val = Exit_Canoe_Left}
							{name = custom_finished_event_id ref = finished_event_id}
							{name = blend_period val = 0.3}]
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_DismountCanoe_Anim_Right
		transitions = [{events = [enter_behavior]
				responses = [{replacement = move
						state = Bv_DismountCanoe_Anim_Slide
						params = [{name = failed_event_id ref = failed_event_id}]
					}
					{replacement = anim
						state = Bv_CustomAnimHoldAndStopOnExit
						params = [{name = anim val = Exit_Canoe_Right}
							{name = custom_finished_event_id ref = finished_event_id}
							{name = blend_period val = 0.3}]
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_DismountCanoe_Anim_Slide
		task =
		{
			name = Task_SlideTo
			params =
			{
				interest_type_id = transit
				relative_offset_type = world
				relative_offset = (0.0, 0.0, 0.0)
				time = 1.0
				align = true
				finished_event_id = SlideTo_Finished
				blend_vert = true
				traverse_all = true
				path_stage = action
			}
		}
	}
	registerstate {
		name = Bv_AcquireVehicle
		task = {name = Task_SetVehicleInterest}
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = Bv_EnterVehicle
						params = [
							{name = attach_type ref = attach_type}
							{name = attach_node_name ref = attach_node_name}
						]
					}]
			}
		]
	}
	registerstate {
		name = Bv_ReleaseVehicle
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child state = Bv_ExitVehicle}]
			}
		]
	}
	registerstate {
		name = Bv_InstantAcquireVehicle
		task = {name = Task_SetVehicleInterestAndTeleport}
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = Bv_PlaceOnVehicle
						params = [{name = attach_type ref = attach_type}
							{name = attach_node_name ref = attach_node_name}
						]
					}]
			}
		]
	}
	registerstate {
		name = Bv_AnimSlideAcquireVehicle
		task =
		{
			name = Task_SetVehicleInterest
		}
		transitions =
		[
			{
				events = [enter_behavior]
				responses =
				[
					{
						replacement = child
						state = Bv_AnimSlideEnterVehicle
						params =
						[
							{name = attach_type ref = attach_type}
							{name = attach_node_name ref = attach_node_name}
							{name = anim_id ref = anim_id}
							{name = speed ref = speed}
							{name = time ref = time}
						]
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_AnimSlideReleaseVehicle
		task =
		{
			name = Task_SetTransitInterest
		}
		transitions =
		[
			{
				events = [enter_behavior]
				responses =
				[
					{
						replacement = child
						state = Bv_AnimSlideExitVehicle
						params =
						[
							{name = anim_id ref = anim_id}
							{name = speed ref = speed}
							{name = time ref = time}
						]
					}
				]
			}
		]
	}
endscript
Task_SetVehicleInterestAndTeleport = {
	enter = Enter_SetVehicleInterestAndTeleport
}

script Enter_SetVehicleInterestAndTeleport 
	if gotparam task_params
		<interest> = (<task_params>.interest)
		if NOT gotparam interest
			<interest> = (<task_params>.vehicle)
		endif
		if NOT gotparam interest
			<interest> = (<task_params>.object)
		endif
		if gotparam interest
			Interest_SetVehicle {vehicle = <interest>}
		endif
	endif
	Interest_GetVehicle
	if NOT gotparam vehicle
		scriptassert "vehicle interest is not specified"
	endif
	printf "================== TELEPORTING =========="
	Teleport object = <vehicle>
endscript

script Bv_CrouchOnVehicle 
	CustomAnimLoop \{anims = [
			Gun_CrouchIdle
		]}
endscript

script Bv_InstantReleaseVehicle 
	agent_clearallvehicledata
endscript
