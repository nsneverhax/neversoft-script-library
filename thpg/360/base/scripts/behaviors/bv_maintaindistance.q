
script RegisterBehaviors_MaintainDistance 
	registerstate {
		name = Bv_MaintainDistance_Center
		task = {name = Task_GenEvents_Distance
			params = {less_than = Dist_TooClose_Center
				greater_than = Dist_TooFar_Center
				interest_type_id = center
			}
		}
		transitions = [{events = [Dist_TooFar_Center] ,
				responses = [{replacement = child
						state = `tex/models/characters/layers/cag/esp/gtr63f_esp_ex_ld_06.img`
						params = [{name = finished_event_id val = MaintainDistanceCenter_Finished}]
					}
				]
			}
			{events = [Dist_TooClose_Center]
				responses = [{replacement = child
						state = eventcache_add
						params = [{name = event_id val = MaintainDistanceCenter_Finished}]
					}
				]
			}
			{events = [MaintainDistanceCenter_Finished]
				responses = [{replacement = child
						state = bv_blank
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_MaintainDistance_Enemy
		task = {name = Task_GenEvents_Distance
			params = {less_than = Dist_TooClose_Enemy
				greater_than = Dist_TooFar_Enemy
				interest_type_id = enemy
			}
		}
		transitions = [{events = [Dist_TooFar_Enemy] ,
				responses = [{replacement = move_enemy
						state = Bv_MoveTo_Loop_Enemy
						params = [{name = finished_event_id val = MaintainDistanceEnemy_Finished}]
					}
				]
			}
			{events = [Dist_TooClose_Enemy]
				responses = [{replacement = event
						state = eventcache_add
						params = [{name = event_id val = MaintainDistanceEnemy_Finished}]
					}
				]
			}
		]
	}
endscript
