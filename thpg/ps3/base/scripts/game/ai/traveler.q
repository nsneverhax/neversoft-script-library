error_for_uncontained = 0
log_unreachable_nodes = 0
SS_VISIBLE_NEAR_DISTANCE = 10.0
ss_travelers = [
	{
		id = terrain_anywhere
		cost_calculator = terrain_calculator
		costs = [
			{
				id = SS_TERRAIN_NONE
				cost = 1.0
			}
			{
				id = SS_TERRAIN_SIDEWALK
				cost = 1.0
			}
			{
				id = SS_TERRAIN_ROAD
				cost = 1.0
			}
			{
				id = SS_TERRAIN_DIRT
				cost = 1.0
			}
			{
				id = SS_TERRAIN_GRASS
				cost = 1.0
			}
			{
				id = SS_TERRAIN_WATER
				cost = 1.0
			}
			{
				id = SS_TERRAIN_RAMP
				cost = 1.0
			}
			{
				id = SS_TERRAIN_INTERIOR
				cost = 1.0
			}
			{
				id = SS_TERRAIN_NO_PED
				cost = 1.0
			}
			{
				id = SS_TERRAIN_NO_SKATER
				cost = 1.0
			}
			{
				id = SS_TERRAIN_NO_ANIMAL
				cost = 1.0
			}
			{
				id = SS_TERRAIN_NO_MOUNTED_ANIMAL
				cost = 1.0
			}
			{
				id = SS_TERRAIN_NO_VEHICLE
				cost = 1.0
			}
			{
				id = SS_TERRAIN_STEEP_INCLINE
				cost = 1.0
			}
			{
				id = SS_TERRAIN_STEEP_DECLINE
				cost = 1.0
			}
			{
				id = SS_TERRAIN_TEMP_DANGER
				cost = 1.0
			}
			{
				id = SS_TERRAIN_TEMP_BLOCKED
				cost = 1.0
			}
			{
				id = SS_TERRAIN_BLOCKED
				cost = 1.0
			}
		]
	}
	{
		id = terrain_ped_urgent
		cost_calculator = terrain_calculator
		costs = [
			{
				id = SS_TERRAIN_NONE
				cost = 1.0
			}
			{
				id = SS_TERRAIN_SIDEWALK
				cost = 1.0
			}
			{
				id = SS_TERRAIN_ROAD
				cost = 1.0
			}
			{
				id = SS_TERRAIN_DIRT
				cost = 1.0
			}
			{
				id = SS_TERRAIN_GRASS
				cost = 1.0
			}
			{
				id = SS_TERRAIN_WATER
				cost = 1.0
			}
			{
				id = SS_TERRAIN_RAMP
				cost = 1.0
			}
			{
				id = SS_TERRAIN_INTERIOR
				cost = 1.0
			}
			{
				id = SS_TERRAIN_NO_PED
				cost = blocked
			}
			{
				id = SS_TERRAIN_NO_SKATER
				cost = 4.0
			}
			{
				id = SS_TERRAIN_NO_ANIMAL
				cost = 1.0
			}
			{
				id = SS_TERRAIN_NO_MOUNTED_ANIMAL
				cost = 1.0
			}
			{
				id = SS_TERRAIN_NO_VEHICLE
				cost = 1.0
			}
			{
				id = SS_TERRAIN_STEEP_INCLINE
				cost = 1.0
			}
			{
				id = SS_TERRAIN_STEEP_DECLINE
				cost = 1.0
			}
			{
				id = SS_TERRAIN_TEMP_DANGER
				cost = 5.0
			}
			{
				id = SS_TERRAIN_TEMP_BLOCKED
				cost = blocked
			}
			{
				id = SS_TERRAIN_BLOCKED
				cost = blocked
			}
		]
	}
	{
		id = terrain_ped_trivial
		cost_calculator = terrain_calculator
		costs = [
			{
				id = SS_TERRAIN_NONE
				cost = 1.0
			}
			{
				id = SS_TERRAIN_SIDEWALK
				cost = 1.0
			}
			{
				id = SS_TERRAIN_ROAD
				cost = 4.0
			}
			{
				id = SS_TERRAIN_DIRT
				cost = 1.2
			}
			{
				id = SS_TERRAIN_GRASS
				cost = 3.0
			}
			{
				id = SS_TERRAIN_WATER
				cost = 1.0
			}
			{
				id = SS_TERRAIN_RAMP
				cost = 3.0
			}
			{
				id = SS_TERRAIN_INTERIOR
				cost = 1.0
			}
			{
				id = SS_TERRAIN_NO_PED
				cost = blocked
			}
			{
				id = SS_TERRAIN_NO_SKATER
				cost = 1.0
			}
			{
				id = SS_TERRAIN_NO_ANIMAL
				cost = 1.0
			}
			{
				id = SS_TERRAIN_NO_MOUNTED_ANIMAL
				cost = 1.0
			}
			{
				id = SS_TERRAIN_NO_VEHICLE
				cost = 1.0
			}
			{
				id = SS_TERRAIN_STEEP_INCLINE
				cost = 3.0
			}
			{
				id = SS_TERRAIN_STEEP_DECLINE
				cost = 1.0
			}
			{
				id = SS_TERRAIN_TEMP_DANGER
				cost = 5.0
			}
			{
				id = SS_TERRAIN_TEMP_BLOCKED
				cost = blocked
			}
			{
				id = SS_TERRAIN_BLOCKED
				cost = blocked
			}
		]
	}
	{
		id = TERRAIN_SKATER_URGENT
		cost_calculator = terrain_calculator
		costs = [
			{
				id = SS_TERRAIN_NONE
				cost = 1.0
			}
			{
				id = SS_TERRAIN_SIDEWALK
				cost = 1.0
			}
			{
				id = SS_TERRAIN_ROAD
				cost = 1.0
			}
			{
				id = SS_TERRAIN_DIRT
				cost = 1.0
			}
			{
				id = SS_TERRAIN_GRASS
				cost = 1.0
			}
			{
				id = SS_TERRAIN_WATER
				cost = 1.0
			}
			{
				id = SS_TERRAIN_RAMP
				cost = 1.0
			}
			{
				id = SS_TERRAIN_INTERIOR
				cost = 1.0
			}
			{
				id = SS_TERRAIN_NO_PED
				cost = 1.0
			}
			{
				id = SS_TERRAIN_NO_SKATER
				cost = 1.0
			}
			{
				id = SS_TERRAIN_NO_ANIMAL
				cost = 1.0
			}
			{
				id = SS_TERRAIN_NO_MOUNTED_ANIMAL
				cost = 1.0
			}
			{
				id = SS_TERRAIN_NO_VEHICLE
				cost = 1.0
			}
			{
				id = SS_TERRAIN_STEEP_INCLINE
				cost = 1.0
			}
			{
				id = SS_TERRAIN_STEEP_DECLINE
				cost = 1.0
			}
			{
				id = SS_TERRAIN_TEMP_DANGER
				cost = 1.0
			}
			{
				id = SS_TERRAIN_TEMP_BLOCKED
				cost = blocked
			}
			{
				id = SS_TERRAIN_BLOCKED
				cost = blocked
			}
		]
	}
	{
		id = terrain_skater_trivial
		cost_calculator = terrain_calculator
		costs = [
			{
				id = SS_TERRAIN_NONE
				cost = 1.0
			}
			{
				id = SS_TERRAIN_SIDEWALK
				cost = 1.0
			}
			{
				id = SS_TERRAIN_ROAD
				cost = 4.0
			}
			{
				id = SS_TERRAIN_DIRT
				cost = 2.0
			}
			{
				id = SS_TERRAIN_GRASS
				cost = 2.7
			}
			{
				id = SS_TERRAIN_WATER
				cost = 1.0
			}
			{
				id = SS_TERRAIN_RAMP
				cost = 3.3
			}
			{
				id = SS_TERRAIN_INTERIOR
				cost = 1.0
			}
			{
				id = SS_TERRAIN_NO_PED
				cost = blocked
			}
			{
				id = SS_TERRAIN_NO_SKATER
				cost = blocked
			}
			{
				id = SS_TERRAIN_NO_ANIMAL
				cost = 1.0
			}
			{
				id = SS_TERRAIN_NO_MOUNTED_ANIMAL
				cost = 1.0
			}
			{
				id = SS_TERRAIN_NO_VEHICLE
				cost = 1.0
			}
			{
				id = SS_TERRAIN_STEEP_INCLINE
				cost = 1.0
			}
			{
				id = SS_TERRAIN_STEEP_DECLINE
				cost = 1.0
			}
			{
				id = SS_TERRAIN_TEMP_DANGER
				cost = 1.0
			}
			{
				id = SS_TERRAIN_TEMP_BLOCKED
				cost = blocked
			}
			{
				id = SS_TERRAIN_BLOCKED
				cost = blocked
			}
		]
	}
	{
		id = TERRAIN_ANIMAL_URGENT
		cost_calculator = terrain_calculator
		costs = [
			{
				id = SS_TERRAIN_NONE
				cost = 1.0
			}
			{
				id = SS_TERRAIN_SIDEWALK
				cost = 1.0
			}
			{
				id = SS_TERRAIN_ROAD
				cost = 1.0
			}
			{
				id = SS_TERRAIN_DIRT
				cost = 1.0
			}
			{
				id = SS_TERRAIN_GRASS
				cost = 1.0
			}
			{
				id = SS_TERRAIN_WATER
				cost = 1.0
			}
			{
				id = SS_TERRAIN_RAMP
				cost = 1.0
			}
			{
				id = SS_TERRAIN_INTERIOR
				cost = 1.0
			}
			{
				id = SS_TERRAIN_NO_PED
				cost = 1.0
			}
			{
				id = SS_TERRAIN_NO_SKATER
				cost = 1.0
			}
			{
				id = SS_TERRAIN_NO_ANIMAL
				cost = blocked
			}
			{
				id = SS_TERRAIN_NO_MOUNTED_ANIMAL
				cost = 1.0
			}
			{
				id = SS_TERRAIN_NO_VEHICLE
				cost = 1.0
			}
			{
				id = SS_TERRAIN_STEEP_INCLINE
				cost = 1.0
			}
			{
				id = SS_TERRAIN_STEEP_DECLINE
				cost = 1.0
			}
			{
				id = SS_TERRAIN_TEMP_DANGER
				cost = 1.0
			}
			{
				id = SS_TERRAIN_TEMP_BLOCKED
				cost = blocked
			}
			{
				id = SS_TERRAIN_BLOCKED
				cost = blocked
			}
		]
	}
	{
		id = terrain_animal_trivial
		cost_calculator = terrain_calculator
		costs = [
			{
				id = SS_TERRAIN_NONE
				cost = 1.0
			}
			{
				id = SS_TERRAIN_SIDEWALK
				cost = 1.0
			}
			{
				id = SS_TERRAIN_ROAD
				cost = 1.0
			}
			{
				id = SS_TERRAIN_DIRT
				cost = 1.0
			}
			{
				id = SS_TERRAIN_GRASS
				cost = 1.0
			}
			{
				id = SS_TERRAIN_WATER
				cost = 1.0
			}
			{
				id = SS_TERRAIN_RAMP
				cost = 1.0
			}
			{
				id = SS_TERRAIN_INTERIOR
				cost = 1.0
			}
			{
				id = SS_TERRAIN_NO_PED
				cost = 1.0
			}
			{
				id = SS_TERRAIN_NO_SKATER
				cost = 1.0
			}
			{
				id = SS_TERRAIN_NO_ANIMAL
				cost = blocked
			}
			{
				id = SS_TERRAIN_NO_MOUNTED_ANIMAL
				cost = 1.0
			}
			{
				id = SS_TERRAIN_NO_VEHICLE
				cost = 1.0
			}
			{
				id = SS_TERRAIN_STEEP_INCLINE
				cost = 1.0
			}
			{
				id = SS_TERRAIN_STEEP_DECLINE
				cost = 1.0
			}
			{
				id = SS_TERRAIN_TEMP_DANGER
				cost = 1.0
			}
			{
				id = SS_TERRAIN_TEMP_BLOCKED
				cost = blocked
			}
			{
				id = SS_TERRAIN_BLOCKED
				cost = blocked
			}
		]
	}
	{
		id = TERRAIN_MOUNTED_ANIMAL_URGENT
		cost_calculator = terrain_calculator
		costs = [
			{
				id = SS_TERRAIN_NONE
				cost = 1.0
			}
			{
				id = SS_TERRAIN_SIDEWALK
				cost = 1.0
			}
			{
				id = SS_TERRAIN_ROAD
				cost = 1.0
			}
			{
				id = SS_TERRAIN_DIRT
				cost = 1.0
			}
			{
				id = SS_TERRAIN_GRASS
				cost = 1.0
			}
			{
				id = SS_TERRAIN_WATER
				cost = 1.0
			}
			{
				id = SS_TERRAIN_RAMP
				cost = 1.0
			}
			{
				id = SS_TERRAIN_INTERIOR
				cost = 1.0
			}
			{
				id = SS_TERRAIN_NO_PED
				cost = 1.0
			}
			{
				id = SS_TERRAIN_NO_SKATER
				cost = 1.0
			}
			{
				id = SS_TERRAIN_NO_ANIMAL
				cost = 1.0
			}
			{
				id = SS_TERRAIN_NO_MOUNTED_ANIMAL
				cost = blocked
			}
			{
				id = SS_TERRAIN_NO_VEHICLE
				cost = 1.0
			}
			{
				id = SS_TERRAIN_STEEP_INCLINE
				cost = 1.0
			}
			{
				id = SS_TERRAIN_STEEP_DECLINE
				cost = 1.0
			}
			{
				id = SS_TERRAIN_TEMP_DANGER
				cost = 1.0
			}
			{
				id = SS_TERRAIN_TEMP_BLOCKED
				cost = blocked
			}
			{
				id = SS_TERRAIN_BLOCKED
				cost = blocked
			}
		]
	}
	{
		id = TERRAIN_MOUNTED_ANIMAL_TRIVIAL
		cost_calculator = terrain_calculator
		costs = [
			{
				id = SS_TERRAIN_NONE
				cost = 1.0
			}
			{
				id = SS_TERRAIN_SIDEWALK
				cost = 1.0
			}
			{
				id = SS_TERRAIN_ROAD
				cost = 1.0
			}
			{
				id = SS_TERRAIN_DIRT
				cost = 1.0
			}
			{
				id = SS_TERRAIN_GRASS
				cost = 1.0
			}
			{
				id = SS_TERRAIN_WATER
				cost = 1.0
			}
			{
				id = SS_TERRAIN_RAMP
				cost = 1.0
			}
			{
				id = SS_TERRAIN_INTERIOR
				cost = 1.0
			}
			{
				id = SS_TERRAIN_NO_PED
				cost = 1.0
			}
			{
				id = SS_TERRAIN_NO_SKATER
				cost = 1.0
			}
			{
				id = SS_TERRAIN_NO_ANIMAL
				cost = 1.0
			}
			{
				id = SS_TERRAIN_NO_MOUNTED_ANIMAL
				cost = blocked
			}
			{
				id = SS_TERRAIN_NO_VEHICLE
				cost = 1.0
			}
			{
				id = SS_TERRAIN_STEEP_INCLINE
				cost = 1.0
			}
			{
				id = SS_TERRAIN_STEEP_DECLINE
				cost = 1.0
			}
			{
				id = SS_TERRAIN_TEMP_DANGER
				cost = 1.0
			}
			{
				id = SS_TERRAIN_TEMP_BLOCKED
				cost = blocked
			}
			{
				id = SS_TERRAIN_BLOCKED
				cost = blocked
			}
		]
	}
	{
		id = TERRAIN_VEHICLE_URGENT
		cost_calculator = terrain_calculator
		costs = [
			{
				id = SS_TERRAIN_NONE
				cost = 1.0
			}
			{
				id = SS_TERRAIN_SIDEWALK
				cost = 1.0
			}
			{
				id = SS_TERRAIN_ROAD
				cost = 1.0
			}
			{
				id = SS_TERRAIN_DIRT
				cost = 1.0
			}
			{
				id = SS_TERRAIN_GRASS
				cost = 1.0
			}
			{
				id = SS_TERRAIN_WATER
				cost = 1.0
			}
			{
				id = SS_TERRAIN_RAMP
				cost = 1.0
			}
			{
				id = SS_TERRAIN_INTERIOR
				cost = 1.0
			}
			{
				id = SS_TERRAIN_NO_PED
				cost = 1.0
			}
			{
				id = SS_TERRAIN_NO_SKATER
				cost = 1.0
			}
			{
				id = SS_TERRAIN_NO_ANIMAL
				cost = 1.0
			}
			{
				id = SS_TERRAIN_NO_MOUNTED_ANIMAL
				cost = 1.0
			}
			{
				id = SS_TERRAIN_NO_VEHICLE
				cost = blocked
			}
			{
				id = SS_TERRAIN_STEEP_INCLINE
				cost = 1.0
			}
			{
				id = SS_TERRAIN_STEEP_DECLINE
				cost = 1.0
			}
			{
				id = SS_TERRAIN_TEMP_DANGER
				cost = 1.0
			}
			{
				id = SS_TERRAIN_TEMP_BLOCKED
				cost = blocked
			}
			{
				id = SS_TERRAIN_BLOCKED
				cost = blocked
			}
		]
	}
	{
		id = TERRAIN_VEHICLE_TRIVIAL
		cost_calculator = terrain_calculator
		costs = [
			{
				id = SS_TERRAIN_NONE
				cost = 1.0
			}
			{
				id = SS_TERRAIN_SIDEWALK
				cost = 1.0
			}
			{
				id = SS_TERRAIN_ROAD
				cost = 1.0
			}
			{
				id = SS_TERRAIN_DIRT
				cost = 1.0
			}
			{
				id = SS_TERRAIN_GRASS
				cost = 1.0
			}
			{
				id = SS_TERRAIN_WATER
				cost = 1.0
			}
			{
				id = SS_TERRAIN_RAMP
				cost = 1.0
			}
			{
				id = SS_TERRAIN_INTERIOR
				cost = 1.0
			}
			{
				id = SS_TERRAIN_NO_PED
				cost = 1.0
			}
			{
				id = SS_TERRAIN_NO_SKATER
				cost = 1.0
			}
			{
				id = SS_TERRAIN_NO_ANIMAL
				cost = 1.0
			}
			{
				id = SS_TERRAIN_NO_MOUNTED_ANIMAL
				cost = 1.0
			}
			{
				id = SS_TERRAIN_NO_VEHICLE
				cost = blocked
			}
			{
				id = SS_TERRAIN_STEEP_INCLINE
				cost = 1.0
			}
			{
				id = SS_TERRAIN_STEEP_DECLINE
				cost = 1.0
			}
			{
				id = SS_TERRAIN_TEMP_DANGER
				cost = 1.0
			}
			{
				id = SS_TERRAIN_TEMP_BLOCKED
				cost = blocked
			}
			{
				id = SS_TERRAIN_BLOCKED
				cost = blocked
			}
		]
	}
	{
		id = TERRAIN_AREA1
		cost_calculator = terrain_calculator
		costs = [
			{
				id = SS_TERRAIN_NONE
				cost = blocked
			}
			{
				id = SS_TERRAIN_SIDEWALK
				cost = blocked
			}
			{
				id = SS_TERRAIN_ROAD
				cost = blocked
			}
			{
				id = SS_TERRAIN_DIRT
				cost = blocked
			}
			{
				id = SS_TERRAIN_GRASS
				cost = blocked
			}
			{
				id = SS_TERRAIN_WATER
				cost = 1.0
			}
			{
				id = SS_TERRAIN_RAMP
				cost = blocked
			}
			{
				id = SS_TERRAIN_INTERIOR
				cost = blocked
			}
			{
				id = SS_TERRAIN_NO_PED
				cost = blocked
			}
			{
				id = SS_TERRAIN_NO_SKATER
				cost = blocked
			}
			{
				id = SS_TERRAIN_NO_ANIMAL
				cost = blocked
			}
			{
				id = SS_TERRAIN_NO_MOUNTED_ANIMAL
				cost = blocked
			}
			{
				id = SS_TERRAIN_NO_VEHICLE
				cost = blocked
			}
			{
				id = SS_TERRAIN_STEEP_INCLINE
				cost = 1.0
			}
			{
				id = SS_TERRAIN_STEEP_DECLINE
				cost = 1.0
			}
			{
				id = SS_TERRAIN_TEMP_DANGER
				cost = 1.0
			}
			{
				id = SS_TERRAIN_TEMP_BLOCKED
				cost = blocked
			}
			{
				id = SS_TERRAIN_BLOCKED
				cost = blocked
			}
		]
	}
]
