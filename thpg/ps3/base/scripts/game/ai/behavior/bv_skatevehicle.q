
script RegisterBehaviors_SkateVehicle 
	registerstate \{name = Bv_Vehicle
		transitions = [
			{
				events = [
					enter_behavior
				]
				responses = [
					{
						replacement = global
						state = Vehicle_Global
					}
					{
						replacement = state
						state = Bv_Vehicle_Drive
					}
				]
			}
		]}
	registerstate \{name = Bv_Vehicle_Drive
		transitions = [
			{
				events = [
					enter_behavior
				]
				responses = [
					{
						replacement = child
						state = Bv_Agent_Life
					}
				]
			}
		]}
endscript

script Vehicle_Global 
	ai_giveorder \{replacement = sounds
		name = Bv_VehicleSounds}
	ai_giveorder \{replacement = tilted_kill
		name = Bv_DieWhenTilted
		params = {
			max_angle = 30.0
		}}
	if globalexists \{name = draw_vehicle_nav
			type = integer}
		if ($draw_vehicle_nav = 1)
			navigation_display
		endif
	endif
endscript

script Vehicle_DieLater 
	obj_spawnscriptlater \{DieLater}
endscript
