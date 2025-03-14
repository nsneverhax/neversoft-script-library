
script RegisterBehaviors_Slide 
	default_speed = 0.75
	registerstate {
		name = Bv_SlideTo
		task = {name = Task_SlideTo
		}
		transitions = []
	}
	registerstate {
		name = Bv_SlideTo_Loop_Interact
		task = {name = Task_SlideTo
			params = {interest_type_id = interact
				relative_offset_type = world
				relative_offset = (0.0, 0.0, 0.0)
				speed = <default_speed>
				align = false
				blend_vert = false
				traverse_all = false
				finished_event_id = SlideTo_Finished
			}
		}
		transitions = []}
	registerstate {
		name = Bv_SlideTo_Loop_Transit
		task = {name = Task_SlideTo
			params = {interest_type_id = transit
				relative_offset_type = world
				relative_offset = (0.0, 0.0, 0.0)
				speed = <default_speed>
				align = false
				blend_vert = false
				traverse_all = false
				finished_event_id = SlideTo_Finished
			}
		}
		transitions = []}
	registerstate {
		name = Bv_SlideTo_Loop_Vehicle
		task = {name = Task_SlideTo
			params = {interest_type_id = vehicle
				relative_offset_type = world
				relative_offset = (0.0, 0.0, 0.0)
				speed = <default_speed>
				align = false
				blend_vert = false
				traverse_all = false
				finished_event_id = SlideTo_Finished
			}
		}
		transitions = []}
	registerstate {
		name = Bv_SlideToAndAlignTo_Loop_Interact
		task = {name = Task_SlideTo
			params = {interest_type_id = interact
				relative_offset_type = world
				relative_offset = (0.0, 0.0, 0.0)
				speed = <default_speed>
				align = true
				blend_vert = false
				traverse_all = false
				finished_event_id = SlideTo_Finished
			}
		}
		transitions = []}
	registerstate {
		name = Bv_SlideToAndAlignTo_Loop_Vehicle
		task = {name = Task_SlideTo
			params = {interest_type_id = vehicle
				relative_offset_type = world
				relative_offset = (0.0, 0.0, 0.0)
				speed = <default_speed>
				align = true
				blend_vert = false
				traverse_all = false
				finished_event_id = SlideTo_Finished
			}
		}
		transitions = []}
endscript
