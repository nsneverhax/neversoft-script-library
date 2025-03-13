goal_types = [
	playable
	testing
]
goal_type_info = {
	core = {
		type = core
		name = qs(0xf76a04e6)
	}
	game_mode = {
		type = game_mode
		name = qs(0x8db55d51)
	}
	quickplay_challenge = {
		type = quickplay_challenge
		name = qs(0xf134c6f5)
	}
	challenge = {
		type = challenge
		name = qs(0xc64f12f9)
	}
	testing = {
		type = testing
		name = qs(0x63d6939a)
	}
}

script goal_get_type_info 
	requireparams \{[
			goal
		]
		all}
	gman_getgoaltype goal = <goal>
	return goal_type_info = ($goal_type_info.<goal_type>)
endscript
