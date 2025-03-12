difficulty_list = [
	easy
	medium
	hard
	expert
]
difficulty_list_props = {
	easy = {
		index = 0
		text_nl = 'easy'
		text = "Easy"
		text_upper = "EASY"
		scroll_time = 3.5
		game_speed = 1.5
	}
	medium = {
		index = 1
		text_nl = 'medium'
		text = "Medium"
		text_upper = "MEDIUM"
		scroll_time = 3.0
		game_speed = 2.0
	}
	hard = {
		index = 2
		text_nl = 'hard'
		text = "Hard"
		text_upper = "HARD"
		scroll_time = 2.75
		game_speed = 2.125
	}
	expert = {
		index = 3
		text_nl = 'expert'
		text = "Expert"
		text_upper = "EXPERT"
		scroll_time = 2.5
		game_speed = 2.25
	}
}
p2_scroll_time_factor = 0.8
p2_game_speed_factor = 0.8

script get_difficulty_text \{difficulty = easy}
	return difficulty_text = ($difficulty_list_props.<difficulty>.text)
endscript

script get_difficulty_text_nl \{difficulty = easy}
	return difficulty_text_nl = ($difficulty_list_props.<difficulty>.text_nl)
endscript

script get_difficulty_text_upper \{difficulty = easy}
	return difficulty_text = ($difficulty_list_props.<difficulty>.text_upper)
endscript

script difficulty_setup 
	scroll_time_factor = 1
	game_speed_factor = 1
	if ($current_num_players = 2 || $end_credits = 1)
		scroll_time_factor = ($p2_scroll_time_factor)
		game_speed_factor = ($p2_game_speed_factor)
	endif
	if ($cheat_hyperspeed > 0)
		hyperspeed_scale = -1
		switch $cheat_hyperspeed
			case 1
			<hyperspeed_scale> = 0.88
			case 2
			<hyperspeed_scale> = 0.83
			case 3
			<hyperspeed_scale> = 0.78
			case 4
			<hyperspeed_scale> = 0.72999996
			case 5
			<hyperspeed_scale> = 0.68
		endswitch
		if (<hyperspeed_scale> > 0)
			scroll_time_factor = (<scroll_time_factor> * <hyperspeed_scale>)
			game_speed_factor = (<game_speed_factor> * <hyperspeed_scale>)
		endif
	endif
	addparams ($difficulty_list_props.<difficulty>)
	change structurename = <player_status> scroll_time = (<scroll_time> * <scroll_time_factor>)
	change structurename = <player_status> game_speed = (<game_speed> * <game_speed_factor>)
endscript
