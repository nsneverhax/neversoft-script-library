
script RegisterBehaviors_Evasion_Rider 
	registerstate {
		name = Bv_Evasion_Rider_Combat
		task = {name = Task_GenEvents params = {event_gen_id = riderlegalaim}}
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = move state = Bv_Evasion_Rider}]}
			{events = [got_riderlegalaim] ,
				responses = [{replacement = child state = Bv_SimpleAimCombat_EquippedItem}]}
			{events = [lost_riderlegalaim] ,
				responses = [{replacement = child state = bv_blank}]}
		]}
	registerstate {
		name = Bv_Evasion_Rider
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = events state = Bv_GenEvents_IsRider_Enemy}
				]}
			{events = [Got_IsRider_Enemy] ,
				responses = [{replacement = child state = Bv_Evasion_Rider_Vs_Rider}
				]}
			{events = [Lost_IsRider_Enemy] ,
				responses = [{replacement = child state = Bv_Evasion_Rider_Vs_Ground}
				]}
		]}
endscript

script RegisterBehaviors_Evasion_Rider_Vs_Ground 
	circle_radius = 20
	circle_speed = 12.5
	charge_offset = 3
	Rider_Vs_Ground_Charge_Move_Desc = {
		movement = run_fast
		stop_distance = 0
		arrival_distance = 2.5
		stopping_distance = 0
	}
	registerstate {
		name = Bv_Evasion_Rider_Vs_Ground
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = child state = Bv_Evasion_Rider_Vs_Ground_CircleClockwise weight = 1}
					{replacement = child state = Bv_Evasion_Rider_Vs_Ground_CircleCounterClockwise weight = 1}
					{replacement = child state = Bv_Evasion_Rider_Vs_Ground_Charge weight = 2}
				]}
		]}
	registerstate {
		name = Bv_Evasion_Rider_Vs_Ground_CircleClockwise
		task = {name = Task_Circle
			params = {interest_type_id = enemy
				radius = <circle_radius>
				speed = <circle_speed>
				clockwise = true
			}
		}
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = timer state = Bv_Evasion_Rider_Vs_Rider_Circle_Timer}
				]}
			{events = [Evasion_Rider_Circle_TimedOut] ,
				responses = [{replacement = this state = Bv_Evasion_Rider_Vs_Ground_CircleCounterClockwise weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Ground_Charge weight = 2}
				]}
		]}
	registerstate {
		name = Bv_Evasion_Rider_Vs_Ground_CircleCounterClockwise
		task = {name = Task_Circle
			params = {interest_type_id = enemy
				radius = <circle_radius>
				speed = <circle_speed>
				clockwise = false
			}
		}
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = timer state = Bv_Evasion_Rider_Vs_Rider_Circle_Timer}
				]}
			{events = [Evasion_Rider_Circle_TimedOut] ,
				responses = [{replacement = this state = Bv_Evasion_Rider_Vs_Ground_CircleCounterClockwise weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Ground_Charge weight = 2}
				]}
		]}
	registerstate {
		name = Bv_Evasion_Rider_Vs_Ground_Circle_Timer
		task = {name = Task_GenEvents_Timer
			params = {min_duration_secs = 10
				max_duration_secs = 15
				event_id = Evasion_Rider_Circle_TimedOut}}
		transitions = []}
	registerstate {
		name = Bv_Evasion_Rider_Vs_Ground_Charge
		task = {name = Task_Lunge
			params = {offset_dist = <charge_offset>
				movement_desc = <Rider_Vs_Ground_Charge_Move_Desc>}}
		transitions = [{events = [lunge_finished] ,
				responses = [{replacement = this state = Bv_Evasion_Rider_Vs_Ground_CircleClockwise weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Ground_CircleCounterClockwise weight = 1}
				]}
		]}
endscript

script RegisterBehaviors_Evasion_Rider_Vs_Rider 
	circle_radius = 22.5
	circle_speed = 13.75
	get_in_front_offset = (0.0, 0.0, 22.5)
	get_behind_offset = (0.0, 0.0, -22.5)
	get_to_left_offset = (7.5, 0.0, 0.0)
	get_to_right_offset = (-7.5, 0.0, 0.0)
	move_to_min_secs = 10
	move_to_max_secs = 15
	move_away_min_secs = 20
	move_away_max_secs = 25
	move_straight_min_secs = 20
	move_straight_max_secs = 25
	circle_min_secs = 20
	circle_max_secs = 25
	get_in_front_min_secs = 20
	get_in_front_max_secs = 25
	get_behind_min_secs = 20
	get_behind_max_secs = 25
	get_to_side_min_secs = 20
	get_to_side_max_secs = 25
	registerstate {
		name = Bv_Evasion_Rider_Vs_Rider
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = child state = Bv_Evasion_Rider_Vs_Rider_MoveTo weight = 1}
					{replacement = child state = Bv_Evasion_Rider_Vs_Rider_MoveAway weight = 1}
					{replacement = child state = Bv_Evasion_Rider_Vs_Rider_MoveStraight weight = 1}
					{replacement = child state = Bv_Evasion_Rider_Vs_Rider_CircleClockwise weight = 1}
					{replacement = child state = Bv_Evasion_Rider_Vs_Rider_CircleCounterClockwise weight = 1}
					{replacement = child state = Bv_Evasion_Rider_Vs_Rider_GetInFront weight = 1}
					{replacement = child state = Bv_Evasion_Rider_Vs_Rider_GetBehind weight = 1}
					{replacement = child state = Bv_Evasion_Rider_Vs_Rider_GetToLeft weight = 1}
					{replacement = child state = Bv_Evasion_Rider_Vs_Rider_GetToRight weight = 1}
				]}
		]}
	registerstate {
		name = Bv_Evasion_Rider_Vs_Rider_Combat
		task = {name = Task_GenEvents params = {event_gen_id = riderlegalaim}}
		transitions = [{events = [got_riderlegalaim] ,
				responses = [{replacement = child state = Bv_SimpleAimCombat_EquippedItem}]}
			{events = [lost_riderlegalaim] ,
				responses = [{replacement = child state = bv_blank}]}
		]}
	registerstate {
		name = Bv_Evasion_Rider_Vs_Rider_MoveTo
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = child state = Bv_MoveTo_Loop_Enemy}
					{replacement = timer state = Bv_Evasion_Rider_Vs_Rider_MoveTo_Timer}
				]}
			{events = [MoveTo_Finished
					Evasion_Rider_MoveTo_TimedOut] ,
				responses = [{replacement = this state = Bv_Evasion_Rider_Vs_Rider_MoveAway weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_MoveStraight weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_CircleClockwise weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_CircleCounterClockwise weight = 1}
				]}
		]}
	registerstate {
		name = Bv_Evasion_Rider_Vs_Rider_MoveTo_Timer
		task = {name = Task_GenEvents_Timer
			params = {min_duration_secs = <move_to_min_secs>
				max_duration_secs = <move_to_max_secs>
				event_id = Evasion_Rider_MoveTo_TimedOut}}
		transitions = []}
	registerstate {
		name = Bv_Evasion_Rider_Vs_Rider_MoveAway
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = child
						state = Bv_MoveAway_Loop_Enemy
						params = [{name = failed_event_id val = Evasion_Rider_MoveAway_Finished}
							{name = finished_event_id val = Evasion_Rider_MoveAway_Finished}]}
					{replacement = timer state = Bv_Evasion_Rider_Vs_Rider_MoveAway_Timer}
					{replacement = toofar state = Bv_Evasion_Rider_Vs_Rider_GenEvents_TooFar}
				]}
			{events = [Evasion_Rider_MoveAway_TimedOut
					Evasion_Rider_MoveAway_Finished
					Got_Evasion_Rider_TooFar] ,
				responses = [{replacement = this state = Bv_Evasion_Rider_Vs_Rider_MoveTo weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_MoveStraight weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_CircleClockwise weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_CircleCounterClockwise weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_GetInFront weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_GetBehind weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_GetToLeft weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_GetToRight weight = 1}
				]}
		]}
	registerstate {
		name = Bv_Evasion_Rider_Vs_Rider_MoveAway_Timer
		task = {name = Task_GenEvents_Timer
			params = {min_duration_secs = <move_away_min_secs>
				max_duration_secs = <move_away_max_secs>
				event_id = Evasion_Rider_MoveAway_TimedOut}}
		transitions = []}
	registerstate {
		name = Bv_Evasion_Rider_Vs_Rider_MoveStraight
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = child state = Bv_MoveStraight_Loop}
					{replacement = timer state = Bv_Evasion_Rider_Vs_Rider_MoveStraight_Timer}
					{replacement = toofar state = Bv_Evasion_Rider_Vs_Rider_GenEvents_TooFar}
				]}
			{events = [Evasion_Rider_MoveStraight_TimedOut
					Got_Evasion_Rider_TooFar
					MoveStraight_Failed] ,
				responses = [{replacement = this state = Bv_Evasion_Rider_Vs_Rider_MoveTo weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_MoveAway weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_CircleClockwise weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_CircleCounterClockwise weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_GetInFront weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_GetBehind weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_GetToLeft weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_GetToRight weight = 1}
				]}
		]}
	registerstate {
		name = Bv_Evasion_Rider_Vs_Rider_MoveStraight_Timer
		task = {name = Task_GenEvents_Timer
			params = {min_duration_secs = <move_straight_min_secs>
				max_duration_secs = <move_straight_max_secs>
				event_id = Evasion_Rider_MoveStraight_TimedOut}}
		transitions = []}
	registerstate {
		name = Bv_Evasion_Rider_Vs_Rider_CircleClockwise
		task = {name = Task_Circle
			params = {interest_type_id = enemy
				radius = <circle_radius>
				speed = <circle_speed>
				clockwise = true
			}
		}
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = timer state = Bv_Evasion_Rider_Vs_Rider_Circle_Timer}
				]}
			{events = [Evasion_Rider_Circle_TimedOut] ,
				responses = [{replacement = this state = Bv_Evasion_Rider_Vs_Rider_MoveTo weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_MoveAway weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_MoveStraight weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_CircleCounterClockwise weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_GetInFront weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_GetBehind weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_GetToLeft weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_GetToRight weight = 1}
				]}
		]}
	registerstate {
		name = Bv_Evasion_Rider_Vs_Rider_CircleCounterClockwise
		task = {name = Task_Circle
			params = {interest_type_id = enemy
				radius = <circle_radius>
				speed = <circle_speed>
				clockwise = false
			}
		}
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = timer state = Bv_Evasion_Rider_Vs_Rider_Circle_Timer}
				]}
			{events = [Evasion_Rider_Circle_TimedOut] ,
				responses = [{replacement = this state = Bv_Evasion_Rider_Vs_Rider_MoveTo weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_MoveAway weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_MoveStraight weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_CircleCounterClockwise weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_GetInFront weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_GetBehind weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_GetToLeft weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_GetToRight weight = 1}
				]}
		]}
	registerstate {
		name = Bv_Evasion_Rider_Vs_Rider_Circle_Timer
		task = {name = Task_GenEvents_Timer
			params = {min_duration_secs = <circle_min_secs>
				max_duration_secs = <circle_max_secs>
				event_id = Evasion_Rider_Circle_TimedOut}}
		transitions = []}
	registerstate {
		name = Bv_Evasion_Rider_Vs_Rider_GetInFront
		task = {name = Task_MoveTo
			params = {interest_type_id = enemy
				relative_offset_type = movement
				relative_offset = <get_in_front_offset>
				finished_event_id = Evasion_Rider_GetInFront_Finished
			}
		}
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = timer state = Bv_Evasion_Rider_Vs_Rider_GetInFront_Timer}
				]}
			{events = [Evasion_Rider_GetInFront_Finished] ,
				responses = [{replacement = this state = Bv_Evasion_Rider_Vs_Rider_MoveStraight}]}
			{events = [Evasion_Rider_GetInFront_TimedOut] ,
				responses = [{replacement = this state = Bv_Evasion_Rider_Vs_Rider_MoveTo weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_MoveAway weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_MoveStraight weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_CircleClockwise weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_CircleCounterClockwise weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_GetBehind weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_GetToLeft weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_GetToRight weight = 1}
				]}
		]}
	registerstate {
		name = Bv_Evasion_Rider_Vs_Rider_GetInFront_Timer
		task = {name = Task_GenEvents_Timer
			params = {min_duration_secs = <get_in_front_min_secs>
				max_duration_secs = <get_in_front_max_secs>
				event_id = Evasion_Rider_GetInFront_TimedOut}}
		transitions = []}
	registerstate {
		name = Bv_Evasion_Rider_Vs_Rider_GetBehind
		task = {name = Task_MoveTo
			params = {interest_type_id = enemy
				relative_offset_type = movement
				relative_offset = <get_behind_offset>
				finished_event_id = Evasion_Rider_GetBehind_Finished
			}
		}
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = timer state = Bv_Evasion_Rider_Vs_Rider_GetBehind_Timer}
				]}
			{events = [Evasion_Rider_GetBehind_Finished] ,
				responses = [{replacement = this state = Bv_Evasion_Rider_Vs_Rider_MoveStraight}]}
			{events = [Evasion_Rider_GetBehind_TimedOut] ,
				responses = [{replacement = this state = Bv_Evasion_Rider_Vs_Rider_MoveTo weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_MoveAway weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_MoveStraight weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_CircleClockwise weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_CircleCounterClockwise weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_GetInFront weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_GetToLeft weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_GetToRight weight = 1}
				]}
		]}
	registerstate {
		name = Bv_Evasion_Rider_Vs_Rider_GetBehind_Timer
		task = {name = Task_GenEvents_Timer
			params = {min_duration_secs = <get_behind_min_secs>
				max_duration_secs = <get_behind_max_secs>
				event_id = Evasion_Rider_GetBehind_TimedOut}}
		transitions = []}
	registerstate {
		name = Bv_Evasion_Rider_Vs_Rider_GetToLeft
		task = {name = Task_MoveTo
			params = {interest_type_id = enemy
				relative_offset_type = movement
				relative_offset = <get_to_left_offset>
				finished_event_id = Evasion_Rider_GetToLeft_Finished
			}
		}
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = timer state = Bv_Evasion_Rider_Vs_Rider_GetToSide_Timer}
				]}
			{events = [Evasion_Rider_GetToLeft_Finished] ,
				responses = [{replacement = this state = Bv_Evasion_Rider_Vs_Rider_MoveStraight}]}
			{events = [Evasion_Rider_GetToSide_TimedOut] ,
				responses = [{replacement = this state = Bv_Evasion_Rider_Vs_Rider_MoveTo weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_MoveAway weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_MoveStraight weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_CircleClockwise weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_CircleCounterClockwise weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_GetInFront weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_GetBehind weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_GetToRight weight = 1}
				]}
		]}
	registerstate {
		name = Bv_Evasion_Rider_Vs_Rider_GetToRight
		task = {name = Task_MoveTo
			params = {interest_type_id = enemy
				relative_offset_type = movement
				relative_offset = <get_to_right_offset>
				finished_event_id = Evasion_Rider_GetToRight_Finished
			}
		}
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = timer state = Bv_Evasion_Rider_Vs_Rider_GetToSide_Timer}
				]}
			{events = [Evasion_Rider_GetToRight_Finished] ,
				responses = [{replacement = this state = Bv_Evasion_Rider_Vs_Rider_MoveStraight}]}
			{events = [Evasion_Rider_GetToSide_TimedOut] ,
				responses = [{replacement = this state = Bv_Evasion_Rider_Vs_Rider_MoveTo weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_MoveAway weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_MoveStraight weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_CircleClockwise weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_CircleCounterClockwise weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_GetInFront weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_GetBehind weight = 1}
					{replacement = this state = Bv_Evasion_Rider_Vs_Rider_GetToLeft weight = 1}
				]}
		]}
	registerstate {
		name = Bv_Evasion_Rider_Vs_Rider_GetToSide_Timer
		task = {name = Task_GenEvents_Timer
			params = {min_duration_secs = <get_to_side_min_secs>
				max_duration_secs = <get_to_side_max_secs>
				event_id = Evasion_Rider_GetToSide_TimedOut}}
		transitions = []}
	registerstate {
		name = Bv_Evasion_Rider_Vs_Rider_GenEvents_TooFar
		task = {name = Task_GenEvents_Distance
			params = {interest_type_id = enemy
				less_than = Lost_Evasion_Rider_TooFar
				greater_than = Got_Evasion_Rider_TooFar
				distance = 1500}}
		transitions = []}
endscript
