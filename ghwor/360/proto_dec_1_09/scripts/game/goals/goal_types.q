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
		Name = qs(0xa61ab41d)
	}
	quickplay_challenge = {
		Type = quickplay_challenge
		Name = qs(0x00863293)
	}
	challenge = {
		Type = challenge
		Name = qs(0x2b2138f9)
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
