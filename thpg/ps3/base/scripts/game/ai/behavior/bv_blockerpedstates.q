blocker_ped_capped_speed = 21.0
blocker_ped_bump_sqr = 1.38
blocker_ped_speed_slow = 1.625
blocker_ped_stand_dist = 0.02
blocker_ped_arrive_dist = 1.0
blocker_ped_inner_radius = 18.0
blocker_ped_outer_radius = 20.0
blocker_ped_full_speed_radius = 4.0
blocker_ped_shuffle_speed = 21.0

script RegisterBehaviors_BlockerPed 
	registerstate {
		name = Bv_BlockerPed
		task = {name = task_blockerped
			params = {movement_desc = ped_skater_point_move}
		}
		transitions = [
			{
				events = [enter_behavior]
				responses = [{replacement = move_desc
						state = bv_setmovedesc
						params = [{name = movement_desc val = {shuffle = false turn_speeds = $ped_speeds_melee}}
							{name = movement_desc_stage val = action}
						]
					}
					{replacement = look_at
						state = StateScript_blkrLookAt
					}
				]
			}
			{
				events = [blockerped_onguard]
				responses = [{replacement = child
						state = StateScript_blkrStand
					}
				]
			}
			{
				events = [blockerped_idle]
				responses = [{replacement = child
						state = StateScript_blkrIdle
					}
				]
			}
			{
				events = [blockerped_shuffle_left]
				responses = [{replacement = child
						state = StateScript_blkrShuffle
						params = [{name = dir val = left}]
					}
				]
			}
			{
				events = [blockerped_shuffle_right]
				responses = [{replacement = child
						state = StateScript_blkrShuffle
						params = [{name = dir val = right}]
					}
				]
			}
			{
				events = [blockerped_stand]
				responses = [{replacement = child
						state = StateScript_blkrStand
					}
				]
			}
			{
				events = [blockerped_run_left]
				responses = [{replacement = child
						state = StateScript_blkrRun
						params = [{name = dir val = left}]
					}
				]
			}
			{
				events = [blockerped_run_right]
				responses = [{replacement = child
						state = StateScript_blkrRun
						params = [{name = dir val = right}]
					}
				]
			}
			{
				events = [blockerped_bumpplayer]
				responses = [{replacement = child
						state = StateScript_blkrBumpPlayer
					}
				]
			}
		]
	}
endscript

script StateScript_blkrLookAt 
	wait \{0.5
		seconds}
	begin
	if compositeobjectexists \{player1}
		ai_giveorder \{name = Bv_LookAt
			params = {
				object = player1
			}}
		break
	endif
	wait \{1
		second}
	repeat
endscript

script blockerped_playerinrange 
	eventcache_add \{event_id = blockerped_onguard}
endscript

script blockerped_playeroutofrange 
	eventcache_add \{event_id = blockerped_idle}
endscript

script BlockerPed_PlayAnim \{target = pedmainanimparentnode
		tree = $ped_animbranch_standard
		source = bodysource
		flipped = 0}
	if NOT gotparam \{anim}
		return
	endif
	behavior_replacehierarchy {hierarchy = animation
		state = Bv_PlayAnim
		params = {<...>}}
endscript

script StateScript_blkrStand 
	soundevent \{event = sk8_Blocker_SecGuard_Notice}
	if getsingletag \{LastState}
		if (<LastState> = idle)
			blockuntilevent \{type = playanim_finished}
		endif
	endif
	settags \{LastState = stand}
	begin
	BlockerPed_PlayAnim anim = (PedMBlocker_Idle01_F) blend_period = 0.3
	blockuntilevent \{type = playanim_finished}
	repeat
endscript

script StateScript_blkrIdle 
	settags \{LastState = idle}
	begin
	BlockerPed_PlayAnim anim = (pedm_idle00_f) blend_period = 0.3
	blockuntilevent \{type = playanim_finished}
	repeat
endscript

script StateScript_blkrShuffle 
	settags LastState = shuffle
	<anim_speed> = (<event_data>.anim_speed)
	if NOT gotparam anim_speed
		<anim_speed> = 1.5
	endif
	if (<anim_speed> < 0.8)
		<anim_speed> = 0.8
	endif
	begin
	if (<dir> = left)
		BlockerPed_PlayAnim anim = PedMBlocker_MoveLeft01_F blend_period = 0.3 speed = <anim_speed>
	else
		BlockerPed_PlayAnim anim = PedMBlocker_MoveRight01_F blend_period = 0.3 speed = <anim_speed>
	endif
	blockuntilevent type = playanim_finished
	repeat
endscript

script StateScript_blkrRun 
	settags \{LastState = run}
	begin
	if (<dir> = left)
		BlockerPed_PlayAnim \{anim = PedMBlocker_MoveLeft01_F
			blend_period = 0.3
			speed = 2.4}
	else
		BlockerPed_PlayAnim \{anim = PedMBlocker_MoveRight01_F
			blend_period = 0.3
			speed = 2.4}
	endif
	blockuntilevent \{type = playanim_finished}
	repeat
endscript

script StateScript_blkrBumpPlayer 
	scriptassert "StateScript_blkrBumpPlayer not supported"
	settags LastState = bump
	BlockerPed_PlayAnim anim = PedM_Gen_Punch01_F speed = 1.5 motion_extract = true
	soundevent event = sk8_Blocker_SecGuard_Knockdown
	wait 0.13 seconds
	try_to_knock_down_skater SetVelDir = <veldir> SetVelSpeed = $PedAttackKnockdownSpeed
	wait 1 second
	BlockerPed_PlayAnim anim = (PedMBlocker_Idle01_F) blend_period = 0.3 cycle
	wait 4 seconds
	eventcache_add event_id = blockerped_stand
endscript
