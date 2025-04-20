
script RegisterBehaviors_SquadCommand 
	registerstate {
		name = Bv_SquadAttack
		task = {name = Task_SquadAttack
			params = {
			}}
		transitions = [{events = [Squad_MeleeAttack]
				responses = [{replacement = child
						state = Bv_SquadMeleeAttack
						params = [{name = members ref = members}]
					}]
			}
			{events = [Squad_GunAttack]
				responses = [{replacement = child
						state = Bv_SquadGunAttack
						params = [{name = members ref = members}]
					}]
			}]
	}
	registerstate {
		name = Bv_SquadMeleeAttack
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = bv_message
						params = [{name = message val = "Squad Melee Attack"}]
					}]
			}]
	}
	registerstate {
		name = Bv_SquadGunAttack
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = bv_message
						params = [{name = message val = "Squad Gun Attack"}]
					}]
			}]
	}
	registerstate {
		name = Bv_SquadMoveTo
		task = {name = Task_SquadMoveTo
			params = {interest_type_id = center
				relative_offset_type = world
				relative_offset = (0.0, 0.0, 0.0)
				finished_event_id = MoveTo_Finished
			}
		}
	}
	registerstate {
		name = Bv_SquadFollow
		task = {name = Task_SquadIssueCommand
			params = {state = `tex/models/characters/layers/cag/esp/gtr63f_esp_ex_ld_06.img`}
		}
	}
	registerstate {
		name = Bv_SquadStand
		task = {name = Task_SquadIssueCommand
			params = {state = bv_stand}
		}
	}
	registerstate {
		name = Bv_SquadStandIdle
		task = {name = Task_SquadIssueCommand
			params = {state = Bv_StandIdle}
		}
	}
endscript
