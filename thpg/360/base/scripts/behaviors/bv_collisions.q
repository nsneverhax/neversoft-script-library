
script RegisterBehaviors_Collision 
	registerstate {
		name = Bv_Collide_DisableResidents
		task = {name = task_runscript
			params = {script_name = navcollision_enablecollideresidents
				script_params = {off}
			}
		}
	}
	registerstate {
		name = Bv_Collide_EnableResidents
		task = {name = task_runscript
			params = {script_name = navcollision_enablecollideresidents}
		}
	}
	registerstate {
		name = Bv_Collide_DisableWalls
		task = {name = task_runscript
			params = {script_name = navcollision_enablecollidewalls
				script_params = {off}
			}
		}
	}
	registerstate {
		name = Bv_Collide_EnableWalls
		task = {name = task_runscript
			params = {script_name = navcollision_enablecollidewalls}
		}
	}
	registerstate {
		name = Bv_Collide_Disable
		task = {name = task_runscript
			params = {script_name = navcollision_enable
				script_params = {off}
			}
		}
	}
	registerstate {
		name = Bv_Collide_Enable
		task = {name = task_runscript
			params = {script_name = navcollision_enable}
		}
	}
	registerstate {
		name = Bv_Collide_Reset
		task = {name = task_runscript
			params = {script_name = navcollision_reset}
		}
	}
	registerstate {
		name = Bv_EnableGeoTest
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child state = navcollision_enablegeotest}]}
			{events = [exit_behavior]
				responses = [{replacement = child state = navcollision_enablegeotest params = [{name = no_name val = off}]}]}
		]
	}
	registerstate {
		name = Bv_CollisionController
		task = {name = Task_CollisionController}
	}
endscript
