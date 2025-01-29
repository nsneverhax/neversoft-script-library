goal_types = [
	playable
	testing
]
goal_type_info = {
	core = {
		Type = core
		Name = qs(0x56b5400b)
	}
	game_mode = {
		Type = game_mode
		Name = qs(0x1d1402b5)
	}
	challenge = {
		Type = challenge
		Name = qs(0xae9da5d1)
	}
	testing = {
		Type = testing
		Name = qs(0x718ed750)
	}
}

script goal_get_type_info 
	RequireParams \{[
			goal
		]
		all}
	gman_getgoaltype goal = <goal>
	return goal_type_info = ($goal_type_info.<goal_type>)
endscript
