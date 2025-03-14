
script Interest_Set 
	if compositeobjectexists <interest>
		agent_setinterest {interest_type_id = <interest_type_id> , object_id = <interest> , acquire_vis_loc = true}
	else
		agent_setinterest {interest_type_id = <interest_type_id> , waypoint_id = <interest> , acquire_vis_loc = true}
	endif
	if gotparam \{max_dist}
		agent_setinterestmaxdesireddist {interest_type_id = <interest_type_id> , max_dist = <max_dist>}
	endif
endscript

script Interest_SetCenter 
	if compositeobjectexists <center>
		agent_setinterest {interest_type_id = center , object_id = <center> , acquire_vis_loc = true}
	else
		agent_setinterest {interest_type_id = center , waypoint_id = <center> , acquire_vis_loc = true}
	endif
	if gotparam \{max_dist}
		agent_setinterestmaxdesireddist {interest_type_id = center , max_dist = <max_dist>}
	endif
endscript

script Interest_SetCenterDist 
	agent_setinterestmaxdesireddist {interest_type_id = center , max_dist = <max_dist>}
endscript

script Interest_ClearCenter 
	agent_clearinterest \{interest_type_id = center}
endscript

script Interest_SetEnemy 
	if compositeobjectexists <enemy>
		agent_setinterest {interest_type_id = enemy , object_id = <enemy> , acquire_vis_loc = true}
	else
		agent_setinterest {interest_type_id = enemy , waypoint_id = <enemy> , acquire_vis_loc = true}
	endif
	if gotparam \{max_dist}
		agent_setinterestmaxdesireddist {interest_type_id = enemy , max_dist = <max_dist>}
	endif
endscript

script Interest_SetEnemyDist 
	agent_setinterestmaxdesireddist {interest_type_id = enemy , max_dist = <max_dist>}
endscript

script Interest_ClearEnemy 
	agent_clearinterest \{interest_type_id = enemy}
endscript

script Interest_GetEnemy 
	agent_getinterestobject \{interest_type_id = enemy}
	return enemy = <interest_obj_id>
endscript

script Interest_SetReaction 
	if compositeobjectexists <reaction>
		agent_setinterest {interest_type_id = reaction , object_id = <reaction> , acquire_vis_loc = true}
	else
		agent_setinterest {interest_type_id = reaction , waypoint_id = <reaction> , acquire_vis_loc = true}
	endif
	if gotparam \{max_dist}
		agent_setinterestmaxdesireddist {interest_type_id = reaction , max_dist = <max_dist>}
	endif
endscript

script Interest_SetReactionDist 
	agent_setinterestmaxdesireddist {interest_type_id = reaction , max_dist = <max_dist>}
endscript

script Interest_ClearReaction 
	agent_clearinterest \{interest_type_id = reaction}
endscript

script Interest_GetReaction 
	agent_getinterestobject \{interest_type_id = reaction}
	return reaction = <interest_obj_id>
endscript

script Interest_SetLocation 
	if compositeobjectexists <location>
		agent_setinterest {interest_type_id = location , object_id = <location> , acquire_vis_loc = true}
	else
		agent_setinterest {interest_type_id = location , waypoint_id = <location> , acquire_vis_loc = true}
	endif
	if gotparam \{max_dist}
		agent_setinterestmaxdesireddist {interest_type_id = location , max_dist = <max_dist>}
	endif
endscript

script Interest_SetLocationDist 
	agent_setinterestmaxdesireddist {interest_type_id = location , max_dist = <max_dist>}
endscript

script Interest_ClearLocation 
	agent_clearinterest \{interest_type_id = location}
endscript

script Interest_GetLocation 
	agent_getinterestobject \{interest_type_id = location}
	return location = <interest_obj_id>
endscript

script Interest_SetVehicle 
	if compositeobjectexists <vehicle>
		agent_setinterest {interest_type_id = vehicle , object_id = <vehicle> , acquire_vis_loc = true}
	else
		agent_setinterest {interest_type_id = vehicle , waypoint_id = <vehicle> , acquire_vis_loc = true}
	endif
	if gotparam \{max_dist}
		agent_setinterestmaxdesireddist {interest_type_id = vehicle , max_dist = <max_dist>}
	endif
endscript

script Interest_ClearVehicle 
	agent_clearinterest \{interest_type_id = vehicle}
endscript

script Interest_SetVehicleDist 
	agent_setinterestmaxdesireddist {interest_type_id = vehicle , max_dist = <max_dist>}
endscript

script Interest_GetVehicle 
	agent_getinterestobject \{interest_type_id = vehicle}
	return vehicle = <interest_obj_id>
endscript

script Interest_SetInteract 
	if compositeobjectexists <interact>
		agent_setinterest {interest_type_id = interact , object_id = <interact> , acquire_vis_loc = true}
	else
		agent_setinterest {interest_type_id = interact , waypoint_id = <interact> , acquire_vis_loc = true}
	endif
	if gotparam \{max_dist}
		agent_setinterestmaxdesireddist {interest_type_id = interact , max_dist = <max_dist>}
	endif
endscript

script Interest_ClearInteract 
	agent_clearinterest \{interest_type_id = interact}
endscript

script Interest_SetInteractDist 
	agent_setinterestmaxdesireddist {interest_type_id = interact , max_dist = <max_dist>}
endscript

script Interest_GetInteract 
	agent_getinterestobject \{interest_type_id = interact}
	return interact = <interest_obj_id>
endscript

script Interest_SetTransit 
	if compositeobjectexists <transit>
		agent_setinterest {interest_type_id = transit , object_id = <transit> , acquire_vis_loc = true}
	else
		agent_setinterest {interest_type_id = transit , waypoint_id = <transit> , acquire_vis_loc = true}
	endif
	if gotparam \{max_dist}
		agent_setinterestmaxdesireddist {interest_type_id = transit , max_dist = <max_dist>}
	endif
endscript

script Interest_ClearTransit 
	agent_clearinterest \{interest_type_id = transit}
endscript

script Interest_SetTransitDist 
	agent_setinterestmaxdesireddist {interest_type_id = transit , max_dist = <max_dist>}
endscript

script Interest_GetTransit 
	agent_getinterestobject \{interest_type_id = transit}
	return transit = <interest_obj_id>
endscript

script Interest_SetDanger 
	if compositeobjectexists <danger>
		agent_setinterest {interest_type_id = danger , object_id = <danger> , acquire_vis_loc = true}
	else
		agent_setinterest {interest_type_id = danger , waypoint_id = <danger> , acquire_vis_loc = true}
	endif
	if gotparam \{max_dist}
		agent_setinterestmaxdesireddist {interest_type_id = danger , max_dist = <max_dist>}
	endif
endscript

script Interest_SetDangerDist 
	agent_setinterestmaxdesireddist {interest_type_id = danger , max_dist = <max_dist>}
endscript

script Interest_ClearDanger 
	agent_clearinterest \{interest_type_id = danger}
endscript

script Interest_GetDanger 
	agent_getinterestobject \{interest_type_id = danger}
	return danger = <interest_obj_id>
endscript
Task_SetVehicleInterest = {
	enter = Enter_SetVehicleInterest
}

script Enter_SetVehicleInterest 
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
endscript
Task_SetInteractInterest = {
	enter = Enter_SetInteractInterest
}

script Enter_SetInteractInterest 
	if gotparam task_params
		<interest> = (<task_params>.interest)
		if NOT gotparam interest
			<interest> = (<task_params>.object)
		endif
		if NOT gotparam interest
			<interest> = (<task_params>.interact)
		endif
		if gotparam interest
			Interest_SetInteract {interact = <interest>}
		endif
	endif
	Interest_GetTransit
	if NOT gotparam interest
		scriptassert "interest is not specified"
	endif
endscript
Task_SetTransitInterest = {
	enter = Enter_SetTransitInterest
}

script Enter_SetTransitInterest 
	if gotparam task_params
		<interest> = (<task_params>.interest)
		if NOT gotparam interest
			<interest> = (<task_params>.object)
		endif
		if NOT gotparam interest
			<interest> = (<task_params>.transit)
		endif
		if gotparam interest
			Interest_SetTransit {transit = <interest>}
		endif
	endif
	Interest_GetTransit
	if NOT gotparam interest
		scriptassert "interest is not specified"
	endif
endscript
