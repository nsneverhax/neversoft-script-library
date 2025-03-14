accuracy_standard = {
	initial_melee_accuracy = 1.0
	vision_melee_accuracy = 1.0
	standard_melee_accuracy = 1.0
	initial_ranged_accuracy = 0.0
	vision_ranged_accuracy = 0.35000002
	standard_ranged_accuracy = 0.7
	initial_accuracy_delay = 1.5
	vision_accuracy_delay = 1.5
	dodging_accuracy_scale = 0.2
	max_rider_aim_offset_degrees = 150
	can_difficulty_scale_melee_accuracy = true
	can_difficulty_scale_ranged_accuracy = true
}
accuracy_civillian = {
	$accuracy_standard
	initial_ranged_accuracy = 0.0
	vision_ranged_accuracy = 0.0
	standard_ranged_accuracy = 0.25
	initial_accuracy_delay = 1.5
	vision_accuracy_delay = 1.5
	dodging_accuracy_scale = 0.1
}
accuracy_deputy = {
	$accuracy_standard
	initial_ranged_accuracy = 1.0
	vision_ranged_accuracy = 1.0
	standard_ranged_accuracy = 1.0
	initial_accuracy_delay = 0.0
	vision_accuracy_delay = 0.0
	dodging_accuracy_scale = 0.2
}
accuracy_sheriff = {
	$accuracy_standard
	initial_ranged_accuracy = 1.0
	vision_ranged_accuracy = 1.0
	standard_ranged_accuracy = 1.0
	initial_accuracy_delay = 0.0
	vision_accuracy_delay = 0.0
	dodging_accuracy_scale = 0.4
}
accuracy_bad = {
	accuracy_standard
	initial_melee_accuracy = 0.0
	vision_melee_accuracy = 0.15
	standard_melee_accuracy = 0.3
	initial_ranged_accuracy = 0.0
	vision_ranged_accuracy = 0.2
	standard_ranged_accuracy = 0.2
	initial_accuracy_delay = 7.5
	vision_accuracy_delay = 7.5
	dodging_accuracy_scale = 0.1
}
accuracy_horrible = {
	accuracy_standard
	initial_melee_accuracy = 0.0
	vision_melee_accuracy = 0.25
	standard_melee_accuracy = 0.5
	initial_ranged_accuracy = 0.0
	vision_ranged_accuracy = 0.05
	standard_ranged_accuracy = 0.1
	initial_accuracy_delay = 20
	vision_accuracy_delay = 20
	dodging_accuracy_scale = 0.0
}
accuracy_boss = {
	accuracy_standard
	dodging_accuracy_scale = 0.5
}
accuracy_high = {
	accuracy_standard
	initial_ranged_accuracy = 0.5
	vision_ranged_accuracy = 0.75
	standard_ranged_accuracy = 1.0
	dodging_accuracy_scale = 0.5
	can_difficulty_scale_melee_accuracy = false
	can_difficulty_scale_ranged_accuracy = false
}
accuracy_insane = {
	accuracy_standard
	initial_melee_accuracy = 1.0
	vision_melee_accuracy = 1.0
	standard_melee_accuracy = 1.0
	initial_ranged_accuracy = 1.0
	vision_ranged_accuracy = 1.0
	standard_ranged_accuracy = 1.0
	dodging_accuracy_scale = 1.0
	can_difficulty_scale_melee_accuracy = false
	can_difficulty_scale_ranged_accuracy = false
}
