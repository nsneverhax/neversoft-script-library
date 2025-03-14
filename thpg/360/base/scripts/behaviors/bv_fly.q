
script RegisterBehaviors_Fly 
	registerstate {
		name = Bv_Fly_Roam
		transitions = [{events = [enter_behavior]
				responses = [{replacement = height
						state = Navigation_PauseStickToGround
					}
					{replacement = disable_collision
						state = navcollision_enablecollidewalls
						params = [{name = no_name val = off}]
					}
					{replacement = disable_obj_collision
						state = navcollision_enablecollideresidents
						params = [{name = no_name val = off}]
					}
					{replacement = wander
						state = Bv_Fly
						params = [{name = movement_desc val = ped_fly}]
					}]
			}
			{
				events = [Fly_Finished]
				recur = true
				responses = [{replacement = wander
						state = Bv_Fly
						params = [{name = movement_desc val = ped_fly}]
					}]
			}
			{events = [exit_behavior]
				responses = [{replacement = height
						state = Bv_Scr_Plummet
					}]
			}]
	}
	registerstate {
		name = Bv_Fly
		task = {name = Task_Fly}
	}
	registerstate {
		name = Bv_Fly_FollowPath
		transitions = [{events = [enter_behavior]
				responses = [{replacement = height
						state = Navigation_PauseStickToGround
					}
					{replacement = disable_collision
						state = navcollision_enablecollidewalls
						params = [{name = no_name val = off}]
					}
					{replacement = disable_obj_collision
						state = navcollision_enablecollideresidents
						params = [{name = no_name val = off}]
					}
					{replacement = followpath
						state = Bv_FollowPath
						params = [{name = movement_desc val = ped_fly}
							{name = movement_desc ref = movement_desc}
							{name = waypoint ref = waypoint}]
					}]
			}
			{events = [FollowPath_Finished]
				responses = [{replacement = this
						state = Bv_Fly_Roam
					}]
			}
			{events = [exit_behavior]
				responses = [{replacement = height
						state = Bv_Scr_Plummet
					}]
			}]
	}
	registerstate {
		name = Bv_Fly_FollowPath_ResCol
		transitions = [{events = [enter_behavior]
				responses = [{replacement = height
						state = Navigation_PauseStickToGround
					}
					{replacement = disable_collision
						state = navcollision_enablecollidewalls
						params = [{name = no_name val = off}]
					}
					{replacement = disable_obj_collision
						state = navcollision_enablecollideresidents
						params = [{name = no_name val = on}]
					}
					{replacement = followpath
						state = Bv_FollowPath
						params = [{name = movement_desc val = ped_fly}
							{name = movement_desc ref = movement_desc}
							{name = waypoint ref = waypoint}]
					}]
			}
			{events = [FollowPath_Finished]
				responses = [{replacement = this
						state = Bv_Fly_roam_ResCol
					}]
			}
			{events = [exit_behavior]
				responses = [{replacement = height
						state = Bv_Scr_Plummet
					}]
			}]
	}
	registerstate {
		name = Bv_Fly_roam_ResCol
		transitions = [{events = [enter_behavior]
				responses = [{replacement = height
						state = Navigation_PauseStickToGround
					}
					{replacement = disable_collision
						state = navcollision_enablecollidewalls
						params = [{name = no_name val = off}]
					}
					{replacement = disable_obj_collision
						state = navcollision_enablecollideresidents
						params = [{name = no_name val = on}]
					}
					{replacement = wander
						state = Bv_Fly
						params = [{name = movement_desc val = ped_fly}]
					}]
			}
			{
				events = [Fly_Finished]
				recur = true
				responses = [{replacement = wander
						state = Bv_Fly
						params = [{name = movement_desc val = ped_fly}]
					}]
			}
			{events = [exit_behavior]
				responses = [{replacement = height
						state = Bv_Scr_Plummet
					}]
			}]
	}
endscript

script Bv_Scr_Plummet 
	obj_getid
	Navigation_ResumeStickToGround
	if AI_IsDead name = <objid>
		obj_spawnscriptlater \{Bv_Scr_Plummet_Spawned}
	endif
endscript

script Bv_Scr_Plummet_Spawned 
	wait \{1
		second}
	begin
	if NOT Navigation_IsFalling
		hide
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript
