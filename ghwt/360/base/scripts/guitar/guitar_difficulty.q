difficulty_list = [
	easy_rhythm
	easy
	medium
	hard
	expert
]
difficulty_list_props = {
	easy_rhythm = {
		index = 0
		text_nl = 'easy'
		text_nl_real = 'easy_rhythm'
		text = qs(0x74d6a0a0)
		text_upper = qs(0x74d6a0a0)
		scroll_time = 3.5
		game_speed = 1.5
	}
	easy = {
		index = 1
		text_nl = 'easy'
		text_nl_real = 'easy'
		text = qs(0x8d657387)
		text_upper = qs(0x8d657387)
		scroll_time = 3.5
		game_speed = 1.5
	}
	medium = {
		index = 2
		text_nl = 'medium'
		text_nl_real = 'medium'
		text = qs(0x6ef11a01)
		text_upper = qs(0x6ef11a01)
		scroll_time = 3.0
		game_speed = 2.0
	}
	hard = {
		index = 3
		text_nl = 'hard'
		text_nl_real = 'hard'
		text = qs(0x51b06d2f)
		text_upper = qs(0x51b06d2f)
		scroll_time = 2.75
		game_speed = 2.125
	}
	expert = {
		index = 4
		text_nl = 'expert'
		text_nl_real = 'expert'
		text = qs(0x334908ac)
		text_upper = qs(0x334908ac)
		scroll_time = 2.5
		game_speed = 2.25
	}
}
p2_scroll_time_factor = 0.8
p2_game_speed_factor = 0.8

script get_difficulty_text \{difficulty = easy}
	return difficulty_text = ($difficulty_list_props.<difficulty>.text)
endscript

script get_difficulty_text_nl 
	if NOT GotParam \{difficulty}
		difficulty = ($difficulty_list [<index>])
	endif
	if NOT GotParam \{no_rhythm}
		return difficulty_text_nl = ($difficulty_list_props.<difficulty>.text_nl_real)
	endif
	return difficulty_text_nl = ($difficulty_list_props.<difficulty>.text_nl)
endscript

script get_difficulty_text_upper \{difficulty = easy}
	return difficulty_text = ($difficulty_list_props.<difficulty>.text_upper)
endscript

script difficulty_setup 
	scroll_time_factor = 1
	game_speed_factor = 1
	get_num_non_vocals_players_onscreen
	if (<num_non_vocals_players> >= 2)
		scroll_time_factor = ($p2_scroll_time_factor)
		game_speed_factor = ($p2_game_speed_factor)
	endif
	<hyperspeed_scale> = ($<player_status>.Hyperspeed)
	<hyperspeed_scale> = (<hyperspeed_scale> * $battle_do_or_die_speed_scale)
	if (<hyperspeed_scale> < $hyperspeed_fastest)
		<hyperspeed_scale> = $hyperspeed_fastest
	endif
	if (<hyperspeed_scale> > 0)
		scroll_time_factor = (<scroll_time_factor> * <hyperspeed_scale>)
		game_speed_factor = (<game_speed_factor> * <hyperspeed_scale>)
	endif
	AddParams ($difficulty_list_props.<difficulty>)
	Change structurename = <player_status> scroll_time = (<scroll_time> * <scroll_time_factor>)
	Change structurename = <player_status> game_speed = (<game_speed> * <game_speed_factor>)
endscript

script get_current_difficulty 
	RequireParams \{[
			Player
		]
		all}
	getplayerinfo <Player> difficulty
	return current_difficulty = <difficulty>
endscript

script get_band_difficulty 
	gamemode_getnumplayers
	<lowest_difficulty> = 4
	<i> = 0
	begin
	getplayerinfo (<i> + 1) difficulty
	<difficulty_index> = ($difficulty_list_props.<difficulty>.index)
	if (<difficulty_index> < <lowest_difficulty>)
		<lowest_difficulty> = <difficulty_index>
	endif
	<i> = (<i> + 1)
	repeat <num_players>
	return band_difficulty = ($difficulty_list [<lowest_difficulty>])
endscript
