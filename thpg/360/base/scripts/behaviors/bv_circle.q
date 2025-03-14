
script RegisterBehaviors_Circle 
	default_circle_radius = 16.25
	default_circle_speed = 7.5
	default_circle_clockwise = false
	registerstate {
		name = Bv_Circle_Loop
		task = {name = Task_Circle
			params = {
				radius = <default_circle_radius>
				speed = <default_circle_speed>
				clockwise = <default_circle_clockwise>
			}
		}
		transitions = []
	}
	registerstate {
		name = Bv_Circle_Loop_Enemy
		task = {name = Task_Circle
			params = {interest_type_id = enemy
				radius = <default_circle_radius>
				speed = <default_circle_speed>
				clockwise = <default_circle_clockwise>
			}
		}
		transitions = []
	}
	registerstate {
		name = Bv_Circle_Loop_Center
		task = {name = Task_Circle
			params = {interest_type_id = center
				radius = <default_circle_radius>
				speed = <default_circle_speed>
				clockwise = <default_circle_clockwise>
			}
		}
		transitions = []
	}
endscript
