goal_types = [
	playable
	testing
]
goal_type_info = {
	core = {
		Type = core
		Name = qs(0xf76a04e6)
	}
	game_mode = {
		Type = game_mode
		Name = qs(0x8db55d51)
	}
	quickplay_challenge = {
		Type = quickplay_challenge
		Name = qs(0xf134c6f5)
	}
	challenge = {
		Type = challenge
		Name = qs(0xc64f12f9)
	}
	testing = {
		Type = testing
		Name = qs(0x63d6939a)
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
