Combat_Melee_MovementDesc = {
	id = Combat_Melee_MovementDesc
	movement = run_fast
	stop_distance = 1.125
	arrival_distance = 1.125
	departure_distance = 1.5
	point_arrival_distance = 0.75
	stopping_distance = 2.5
	starting_distance = 0.75
	outside_boundary = arrive
	path_find = shortest
	strafe = false
	mode = stand
	speeds = ped_speeds_melee
	turn_speeds = ped_turn_speeds_melee
	speed_change_angles = ped_speed_change_angles_melee
	lin_accel = $default_lin_accel
	rot_accel = $default_rot_accel
}
Combat_Gun_Ground_MovementDesc = {
	id = Combat_Gun_Ground_MovementDesc
	movement = run_slow
	stop_distance = 0.25
	arrival_distance = 1.5
	departure_distance = 2.5
	point_arrival_distance = 0.75
	stopping_distance = 0.25
	starting_distance = 0.25
	outside_boundary = arrive
	path_find = shortest
	strafe = true
	speeds = $ped_speeds
	turn_speeds = $ped_turn_speeds
	speed_change_angles = ped_speed_change_angles
	lin_accel = $default_lin_accel
	rot_accel = $default_rot_accel
}
Combat_Gun_Rider_MovementDesc = {
	id = Combat_Gun_Rider_MovementDesc
	movement = run_fast
	stop_distance = 0.125
	arrival_distance = 10
	departure_distance = 0.25
	point_arrival_distance = 3.75
	stopping_distance = 0.25
	starting_distance = 0.25
	outside_boundary = arrive
	path_find = shortest
	strafe = false
	speeds = horse_speeds
	turn_speeds = $Combat_Gun_Rider_turn_speeds
	speed_change_angles = Combat_Gun_Rider_speed_change_angles
	lin_accel = $default_lin_accel
	rot_accel = $default_rot_accel
}
Combat_Gun_Hostage_MovementDesc = {
	id = Combat_Gun_Hostage_MovementDesc
	movement = run_slow
	stop_distance = 0.25
	arrival_distance = 0.25
	departure_distance = 1.5
	point_arrival_distance = 0.75
	stopping_distance = 0.5
	starting_distance = 0.5
	outside_boundary = arrive
	path_find = shortest
	strafe = true
	speeds = hostage_speeds
	turn_speeds = $ped_turn_speeds
	speed_change_angles = ped_speed_change_angles
	lin_accel = $default_lin_accel
	rot_accel = $default_rot_accel
}
Combat_None_Ground_MovementDesc = {
	Combat_Gun_Ground_MovementDesc
	id = Combat_None_Ground_MovementDesc
	strafe = false
}
Combat_None_Rider_MovementDesc = {
	Combat_Gun_Rider_MovementDesc
	id = Combat_None_Rider_MovementDesc
}
Combat_None_Hostage_MovementDesc = {
	Combat_Gun_Hostage_MovementDesc
	id = Combat_None_Hostage_MovementDesc
}
Combat_Bow_MovementDesc = {
	Combat_Gun_Ground_MovementDesc
	id = Combat_Bow_MovementDesc
}

script RegisterBehaviors_ItemControl 
	registerstate {
		name = Bv_EnableItemControlEquip
		task = {name = Task_ItemControlEquip}
		transitions = []}
	registerstate {
		name = Bv_EnableItemControlReload
		task = {name = Task_ItemControlReload}
		transitions = []}
	registerstate {
		name = Bv_ItemControl
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = events_reload state = Bv_GenEvents_ItemControl_Reload}
					{replacement = events_movement state = Bv_GenEvents_ItemControl_Movement}
					{replacement = events_equip state = Bv_GenEvents_ItemControl_Equip}]}
			{conditions = [{name = itemcontrol_compareisitemuseenabled params = {state = true}}]
				responses = [{replacement = use state = Bv_ItemControl_Use}]}
			{conditions = [{name = itemcontrol_compareisitemuseenabled params = {state = false}}]
				responses = [{replacement = use state = bv_blank}]}
			{events = [got_itemcontrol_reload] ,
				responses = [{replacement = reload state = Bv_ItemControl_Reload}]}
			{events = [lost_itemcontrol_reload] ,
				responses = [{replacement = reload state = bv_blank}]}
			{events = [got_itemcontrol_movement] ,
				responses = [{replacement = movement state = Bv_ItemControl_Movement}]}
			{events = [lost_itemcontrol_movement] ,
				responses = [{replacement = movement state = bv_blank}]}
		]}
	registerstate {
		name = Bv_ItemControl_Use
		task = {name = Task_UseItem}
		transitions = []}
	registerstate {
		name = Bv_ItemControl_Reload
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = events state = Bv_GenEvents_LoadedUses}]}
			{events = [lost_loadeduses] ,
				responses = [{replacement = this state = Bv_ItemControl_Reload_Loop}]}
		]}
	registerstate {
		name = Bv_ItemControl_Reload_Loop
		task = {name = Task_ReloadItem
			params = {finished_event_id = ItemControl_Reload_Loop_Reloaded}}
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = events state = Bv_GenEvents_LoadedUses}]}
			{events = [ItemControl_Reload_Loop_Reloaded
					got_loadeduses] ,
				responses = [{replacement = this state = Bv_ItemControl_Reload}]}
		]}
	registerstate {
		name = Bv_ItemControl_Movement
		task = {name = Task_GenEvents
			params = {event_gen_id = equippeditem_type}}
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = this state = Bv_ItemControl_Movement_GotUse}]}
		]}
	registerstate {
		name = Bv_ItemControl_Movement_GotUse
		task = {name = Task_GenEvents
			params = {event_gen_id = equippeditem_type}}
		transitions = [{events = [equipped_meleeweapon] ,
				responses = [{replacement = child state = Bv_ItemControl_Movement_Melee}]}
			{events = [equipped_primaryweapon] ,
				responses = [{replacement = child state = Bv_ItemControl_Movement_Primary}]}
			{events = [equipped_secondaryweapon] ,
				responses = [{replacement = child state = Bv_ItemControl_Movement_Secondary}]}
			{events = [equipped_none] ,
				responses = [{replacement = child state = Bv_ItemControl_Movement_None}]}
		]}
	registerstate {
		name = Bv_ItemControl_Movement_None
		task = {name = Task_GenEvents
			params = {event_gen_id = vehicletype}}
		transitions = [{events = [vehicletype_none
					vehicletype_item] ,
				responses = [{replacement = child state = Bv_ItemControl_Movement_None_Ground}]}
			{events = [vehicletype_horse] ,
				responses = [{replacement = child state = Bv_ItemControl_Movement_None_Rider}]}
			{events = [vehicletype_human] ,
				responses = [{replacement = child state = Bv_ItemControl_Movement_None_Hostage}]}
		]}
	registerstate {
		name = Bv_ItemControl_Movement_None_Ground
		task = {name = task_runscript
			params = {script_name = Navigation_SetMoveDescription
				script_params = Combat_None_Ground_MovementDesc}}
		transitions = []}
	registerstate {
		name = Bv_ItemControl_Movement_None_Rider
		task = {name = task_runscript
			params = {script_name = Navigation_SetMoveDescription
				script_params = Combat_None_Rider_MovementDesc}}
		transitions = []}
	registerstate {
		name = Bv_ItemControl_Movement_None_Hostage
		task = {name = task_runscript
			params = {script_name = Navigation_SetMoveDescription
				script_params = Combat_None_Hostage_MovementDesc}}
		transitions = []}
	registerstate {
		name = Bv_ItemControl_Movement_Melee
		task = {name = task_runscript
			params = {script_name = Navigation_SetMoveDescription
				script_params = Combat_Melee_MovementDesc}}
		transitions = []}
	registerstate {
		name = Bv_ItemControl_Movement_Primary
		task = {name = Task_GenEvents
			params = {event_gen_id = vehicletype}}
		transitions = [{events = [vehicletype_none
					vehicletype_item] ,
				responses = [{replacement = child state = Bv_ItemControl_Movement_Primary_Ground}]}
			{events = [vehicletype_horse] ,
				responses = [{replacement = child state = Bv_ItemControl_Movement_Primary_Rider}]}
			{events = [vehicletype_human] ,
				responses = [{replacement = child state = Bv_ItemControl_Movement_Primary_Hostage}]}
		]}
	registerstate {
		name = Bv_ItemControl_Movement_Primary_Ground
		task = {name = task_runscript
			params = {script_name = Navigation_SetMoveDescription
				script_params = Combat_Gun_Ground_MovementDesc}}
		transitions = []}
	registerstate {
		name = Bv_ItemControl_Movement_Primary_Rider
		task = {name = task_runscript
			params = {script_name = Navigation_SetMoveDescription
				script_params = Combat_Gun_Rider_MovementDesc}}
		transitions = []}
	registerstate {
		name = Bv_ItemControl_Movement_Primary_Hostage
		task = {name = task_runscript
			params = {script_name = Navigation_SetMoveDescription
				script_params = Combat_Gun_Hostage_MovementDesc}}
		transitions = []}
	registerstate {
		name = Bv_ItemControl_Movement_Secondary
		task = {name = task_runscript
			params = {script_name = Navigation_SetMoveDescription
				script_params = Combat_Bow_MovementDesc}}
		transitions = []}
endscript
