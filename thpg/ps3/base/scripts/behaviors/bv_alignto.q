
script RegisterBehaviors_AlignTo 
	registerstate {
		name = Bv_AlignTo
		task = {name = Task_SetLocationInterest}
		transitions = [{events = [enter_behavior]
				responses = [{replacement = spinto
						state = Bv_ShuffleTo_Location_Exact
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_AlignTo_Once_Enemy
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = Bv_AlignTo_Loop_Enemy
					}]
			}
			{events = [AlignTo_Finished]
				responses = [{replacement = child
						state = bv_blank
					}]
			}]
	}
	registerstate {
		name = Bv_AlignTo_Loop_Enemy
		task = {name = Task_AlignTo
			params = {interest_type_id = enemy
				finished_event_id = AlignTo_Finished
				movement_desc = {force_align = true shuffle = false}
			}
		}
		transitions = []
	}
	registerstate {
		name = Bv_SpinTo_Location
		task = {name = Task_AlignTo
			params = {interest_type_id = location
				finished_event_id = AlignTo_Finished
				movement_desc = {force_align = true shuffle = false}
			}
		}
		transitions = []
	}
	registerstate {
		name = Bv_ShuffleTo_Location
		task = {name = Task_AlignTo
			params = {interest_type_id = location
				finished_event_id = AlignTo_Finished
				movement_desc = {force_align = false shuffle = true}
			}
		}
		transitions = []
	}
	registerstate {
		name = Bv_ShuffleTo_Location_Exact
		task = {name = Task_AlignTo
			params = {interest_type_id = location
				finished_event_id = AlignTo_Finished
				movement_desc = {force_align = true shuffle = true}
			}
		}
		transitions = []
	}
	registerstate {
		name = Bv_SpinTo_Enemy
		task = {name = Task_AlignTo
			params = {interest_type_id = enemy
				finished_event_id = AlignTo_Finished
				movement_desc = {force_align = true shuffle = false}
			}
		}
		transitions = []
	}
	registerstate {
		name = Bv_ShuffleTo_Enemy
		task = {name = Task_AlignTo
			params = {interest_type_id = enemy
				finished_event_id = AlignTo_Finished
				movement_desc = {force_align = false shuffle = true}
			}
		}
		transitions = []
	}
	registerstate {
		name = Bv_ShuffleTo_Enemy_Exact
		task = {name = Task_AlignTo
			params = {interest_type_id = enemy
				finished_event_id = AlignTo_Finished
				movement_desc = {force_align = true shuffle = true}
			}
		}
		transitions = []
	}
	registerstate {
		name = Bv_Align_Spin
		task = {name = Task_SetLocationInterest}
		transitions = [{events = [enter_behavior]
				responses = [{replacement = spinto
						state = Bv_SpinTo_Location
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_Align_Shuffle
		task = {name = Task_SetLocationInterest}
		transitions = [{events = [enter_behavior]
				responses = [{replacement = spinto
						state = Bv_ShuffleTo_Location
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_Align_ShuffleExact
		task = {name = Task_SetLocationInterest}
		transitions = [{events = [enter_behavior]
				responses = [{replacement = spinto
						state = Bv_ShuffleTo_Location_Exact
					}
				]
			}
		]
	}
endscript
