difficulty_list = [
	EASY
	MEDIUM
	HARD
	EXPERT
]
difficulty_list_props = {
	EASY = {
		Index = 0
		text_nl = 'easy'
		Text = "Easy"
		text_upper = "EASY"
		scroll_time = 3.5
		game_speed = 1.5
	}
	MEDIUM = {
		Index = 1
		text_nl = 'medium'
		Text = "Medium"
		text_upper = "MEDIUM"
		scroll_time = 3.0
		game_speed = 2.0
	}
	HARD = {
		Index = 2
		text_nl = 'hard'
		Text = "Hard"
		text_upper = "HARD"
		scroll_time = 2.75
		game_speed = 2.125
	}
	EXPERT = {
		Index = 3
		text_nl = 'expert'
		Text = "Expert"
		text_upper = "EXPERT"
		scroll_time = 2.5
		game_speed = 2.25
	}
}
p2_scroll_time_factor = 0.8
p2_game_speed_factor = 0.8

script get_difficulty_text \{DIFFICULTY = EASY}
	return difficulty_text = ($difficulty_list_props.<DIFFICULTY>.Text)
endscript

script get_difficulty_text_nl \{DIFFICULTY = EASY}
	return difficulty_text_nl = ($difficulty_list_props.<DIFFICULTY>.text_nl)
endscript

script get_difficulty_text_upper \{DIFFICULTY = EASY}
	return difficulty_text = ($difficulty_list_props.<DIFFICULTY>.text_upper)
endscript

script difficulty_setup 
	scroll_time_factor = 1
	game_speed_factor = 1
	if ($current_num_players = 2 || $end_credits = 1)
		scroll_time_factor = ($p2_scroll_time_factor)
		game_speed_factor = ($p2_game_speed_factor)
	endif
	if ($Cheat_HyperSpeed > 0)
		if NOT ($is_network_game)
			hyperspeed_scale = -1
			switch $Cheat_HyperSpeed
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
	endif
	AddParams ($difficulty_list_props.<DIFFICULTY>)
	Change StructureName = <player_status> scroll_time = (<scroll_time> * <scroll_time_factor>)
	Change StructureName = <player_status> game_speed = (<game_speed> * <game_speed_factor>)
endscript
