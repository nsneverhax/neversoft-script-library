
script RegisterBehaviors_Evade_Dodge 
	registerstate {
		name = Bv_DodgeReactions
		task =
		{
			name = Task_DetectDodgeReaction
			params =
			{
				dodge_left_event_id = DodgeReactions_DodgeLeft
				dodge_right_event_id = DodgeReactions_DodgeRight
			}
		}
		transitions =
		[
			{events = [DodgeReactions_DodgeLeft]
				responses =
				[{replacement = this
						state = Bv_DodgeReactions_Dodge
						params = [{name = direction val = left}]
					}
				]
			}
			{events = [DodgeReactions_DodgeRight]
				responses =
				[{replacement = this
						state = Bv_DodgeReactions_Dodge
						params = [{name = direction val = right}]
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_DodgeReactions_Dodge
		task = {name = Task_Dodge
			params = {
				anim_stage = custom
				finished_event_id = DodgeReactions_DodgeFinished}}
		transitions = [{events = [DodgeReactions_DodgeFinished]
				responses = [{replacement = this state = Bv_DodgeReactions}]
			}
		]}
	registerstate {
		name = Bv_Evade_Dodge_Loop
		task = {name = Task_GenEvents params = {event_gen_id = vehicletype}}
		transitions = [{events = [vehicletype_none] ,
				responses = [{replacement = child state = Bv_Evade_GroundDodge_Loop}]}
			{events = [vehicletype_horse] ,
				responses = [{replacement = child state = Bv_Evade_RiderDodge_Loop}]}
		]}
	registerstate {
		name = Bv_Evade_GroundDodge_Loop
		task = {name = Task_GenEvents params = {event_gen_id = shoulddodge}}
		transitions = [{events = [shoulddodge_none] ,
				responses = [{replacement = this state = Bv_Evade_GroundDodge_Loop_None}]}
			{events = [shoulddodge_down] ,
				responses = [{replacement = this state = Bv_Evade_GroundDodge_Loop_Down}]}
			{events = [shoulddodge_left] ,
				responses = [{replacement = this state = Bv_Evade_GroundDodge_Loop_Left}]}
			{events = [shoulddodge_right] ,
				responses = [{replacement = this state = Bv_Evade_GroundDodge_Loop_Right}]}
		]}
	registerstate {
		name = Bv_Evade_GroundDodge_Loop_None
		task = {name = Task_GenEvents_Timer
			params = {min_duration_secs = 1
				max_duration_secs = 3
				event_id = Evade_GroundDodge_None_TimedOut}}
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = child state = bv_stand}]}
			{events = [Evade_GroundDodge_None_TimedOut] ,
				responses = [{replacement = this state = Bv_Evade_GroundDodge_Loop}]}
		]}
	registerstate {
		name = Bv_Evade_GroundDodge_Loop_Down
		task = {name = Task_GenEvents_Timer
			params = {min_duration_secs = 1
				max_duration_secs = 3
				event_id = Evade_GroundDodge_Down_TimedOut}}
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = child state = Bv_Crouch}]}
			{events = [Evade_GroundDodge_Down_TimedOut] ,
				responses = [{replacement = this state = Bv_Evade_GroundDodge_Loop_Wait}]}
		]}
	registerstate {
		name = Bv_Evade_GroundDodge_Loop_Left
		task = {name = Task_Dodge
			params = {direction = left
				anim_stage = custom
				finished_event_id = Evade_GroundDodge_Left_Finished}}
		transitions = [{events = [Evade_GroundDodge_Left_Finished] ,
				responses = [{replacement = this state = Bv_Evade_GroundDodge_Loop_Wait}]}
		]}
	registerstate {
		name = Bv_Evade_GroundDodge_Loop_Right
		task = {name = Task_Dodge
			params = {direction = right
				anim_stage = custom
				finished_event_id = Evade_GroundDodge_Right_Finished}}
		transitions = [{events = [Evade_GroundDodge_Right_Finished] ,
				responses = [{replacement = this state = Bv_Evade_GroundDodge_Loop_Wait}]}
		]}
	registerstate {
		name = Bv_Evade_GroundDodge_Loop_Wait
		task = {name = Task_GenEvents_Timer
			params = {min_duration_secs = 1
				max_duration_secs = 3
				event_id = Evade_GroundDodge_Wait_TimedOut}}
		transitions = [{events = [Evade_GroundDodge_Wait_TimedOut] ,
				responses = [{replacement = this state = Bv_Evade_GroundDodge_Loop}]}
		]}
	registerstate {
		name = Bv_Evade_RiderDodge_Loop
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = aimedat state = Bv_GenEvents_AimedAtBy_Enemy}
					{replacement = vehicleAimedAt state = Bv_GenEvents_VehicleAimedAtBy_Enemy}]}
			{events = [got_aimedatby_enemy
					got_vehicleaimedatby_enemy] ,
				responses = [{replacement = this state = Bv_Evade_RiderDodge_Loop_LeftOrRight}]}
		]}
	registerstate {
		name = Bv_Evade_RiderDodge_Loop_LeftOrRight
		task = {name = Task_MobileDodge
			params = {dodge_distance = 5
				interest_type_id = enemy
				finished_event_id = Evade_RiderDodge_Loop_LeftOrRight_Finished}}
		transitions = [{events = [Evade_RiderDodge_Loop_LeftOrRight_Finished] ,
				responses = [{replacement = this state = Bv_Evade_RiderDodge_Loop}]}
		]}
	registerstate {
		name = Bv_Evasion_MobileDodge_Once_Enemy
		task = {name = Task_MobileDodge
			params = {dodge_distance = 5
				interest_type_id = enemy
				finished_event_id = Evasion_MobileDodge_Once_Enemy_Finished}}
		transitions = [{events = [Evasion_MobileDodge_Once_Enemy_Finished] ,
				responses = [{replacement = this state = bv_blank}]}
		]}
	registerstate {
		name = Bv_Evade_Crouch_Loop
		task = {name = Task_GenEvents params = {event_gen_id = shoulddodge}}
		transitions = [{events = [shoulddodge_none
					shoulddodge_left
					shoulddodge_right] ,
				responses = [{replacement = this state = Bv_Evade_Crouch_Loop_None}]}
			{events = [shoulddodge_down] ,
				responses = [{replacement = this state = Bv_Evade_Crouch_Loop_Down}]}
		]}
	registerstate {
		name = Bv_Evade_Crouch_Loop_None
		task = {name = Task_GenEvents_Timer
			params = {min_duration_secs = 1
				max_duration_secs = 2
				event_id = Evade_Crouch_None_TimedOut}}
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = child state = bv_stand}]}
			{events = [Evade_Crouch_None_TimedOut] ,
				responses = [{replacement = this state = Bv_Evade_Crouch_Loop}]}
		]}
	registerstate {
		name = Bv_Evade_Crouch_Loop_Down
		task = {name = Task_GenEvents_Timer
			params = {min_duration_secs = 1
				max_duration_secs = 2
				event_id = Evade_Crouch_Down_TimedOut}}
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = child state = Bv_Crouch}]}
			{events = [Evade_Crouch_Down_TimedOut] ,
				responses = [{replacement = this state = Bv_Evade_Crouch_Loop}]}
		]}
endscript
