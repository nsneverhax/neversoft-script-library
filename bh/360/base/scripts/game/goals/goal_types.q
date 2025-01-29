goal_types = [
	playable
	Testing
]
goal_type_info = {
	core = {
		type = core
		name = qs(0x56b5400b)
	}
	game_mode = {
		type = game_mode
		name = qs(0x1d1402b5)
	}
	challenge = {
		type = challenge
		name = qs(0xae9da5d1)
	}
	Testing = {
		type = Testing
		name = qs(0x718ed750)
	}
}

script goal_get_type_info 
	RequireParams \{[
			goal
		]
		all}
	GMan_GetGoalType goal = <goal>
	return goal_type_info = ($goal_type_info.<goal_type>)
endscript
