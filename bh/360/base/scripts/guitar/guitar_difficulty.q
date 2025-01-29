difficulty_list = [
	beginner
	easy
	medium
	hard
	expert
]
difficulty_list_props = {
	beginner = {
		index = 0
		text_nl = 'easy'
		text_nl_real = 'beginner'
		text = qs(0x74d6a0a0)
		text_upper = qs(0x74d6a0a0)
		scroll_time = 3.5
		next_difficulty_lower = None
	}
	easy = {
		index = 1
		text_nl = 'easy'
		text_nl_real = 'easy'
		text = qs(0x8d657387)
		text_upper = qs(0x8d657387)
		scroll_time = 3.5
		next_difficulty_lower = beginner
	}
	medium = {
		index = 2
		text_nl = 'medium'
		text_nl_real = 'medium'
		text = qs(0x6ef11a01)
		text_upper = qs(0x6ef11a01)
		scroll_time = 3.0
		next_difficulty_lower = easy
	}
	hard = {
		index = 3
		text_nl = 'hard'
		text_nl_real = 'hard'
		text = qs(0x51b06d2f)
		text_upper = qs(0x51b06d2f)
		scroll_time = 2.75
		next_difficulty_lower = medium
	}
	expert = {
		index = 4
		text_nl = 'expert'
		text_nl_real = 'expert'
		text = qs(0x334908ac)
		text_upper = qs(0x334908ac)
		scroll_time = 2.5
		next_difficulty_lower = hard
	}
}
p2_scroll_time_factor = 0.8

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
	scroll_time_factor = 1
	GetPlayerInfo <player> hyperspeed out = hyperspeed_scale
	if (<hyperspeed_scale> < $Hyperspeed_Fastest)
		<hyperspeed_scale> = $Hyperspeed_Fastest
	endif
	if (<hyperspeed_scale> > 0)
		scroll_time_factor = (<scroll_time_factor> * <hyperspeed_scale>)
	endif
	AddParams ($difficulty_list_props.<difficulty>)
	SetPlayerInfo <player> scroll_time = (<scroll_time> * <scroll_time_factor>)
endscript

script get_current_difficulty 
	RequireParams \{[
			player
		]
		all}
	GetPlayerInfo <player> difficulty
	return current_difficulty = <difficulty>
endscript

script get_band_difficulty 
	GetNumPlayersInGame
	<lowest_difficulty> = 4
	if (<num_players> > 0)
		GetFirstPlayer
		begin
		GetPlayerInfo <player> difficulty
		<difficulty_index> = ($difficulty_list_props.<difficulty>.index)
		if (<difficulty_index> < <lowest_difficulty>)
			<lowest_difficulty> = <difficulty_index>
		endif
		GetNextPlayer player = <player>
		repeat <num_players>
	endif
	return band_difficulty = ($difficulty_list [<lowest_difficulty>])
endscript

script drop_player_difficulty \{player = -1}
	GetPlayerInfo <player> difficulty
	new_difficulty = ($difficulty_list_props.<difficulty>.next_difficulty_lower)
	if (<new_difficulty> = None)
		return \{false}
	endif
	SetPlayerInfo <player> difficulty = <new_difficulty>
	crowd_reset player = <player>
endscript

script set_highway_difficulty 
	get_difficulty_text_nl difficulty = <difficulty>
	player_info_difficulty = <difficulty_text_nl>
	get_difficulty_text_nl difficulty = <difficulty> no_rhythm
	event_difficulty = <difficulty_text_nl>
	FormatText checksumname = player_info_difficulty_checksum '%s' s = <player_info_difficulty>
	SetPlayerInfo <player> difficulty = <player_info_difficulty_checksum>
	ExtendCrcPlayer restart_gem_array_events <player> out = event_type
	broadcastevent type = <event_type>
	GameMode_GetType
	if (<type> != freeplay)
		blend_time = 2.0
	else
		blend_time = 0.0
	endif
	FormatText checksumname = morph_scroll_speed_id 'morph_scroll_speed%p' p = <player>
	killspawnedscript id = <morph_scroll_speed_id>
	spawnscriptnow morph_scroll_speed id = <morph_scroll_speed_id> params = {player = <player> difficulty = <difficulty> blend_time = <blend_time>}
	DifficultyChange player = <player>
endscript

script morph_scroll_speed \{player = 1
		difficulty = easy
		blend_time = 1.0}
	GetPlayerInfo <player> scroll_time out = source_speed
	difficulty_setup player = <player> difficulty = <difficulty>
	GetPlayerInfo <player> scroll_time out = target_speed
	time = 0.0
	begin
	if (<time> >= <blend_time>)
		new_speed = <target_speed>
	else
		<time_factor> = (<time> / <blend_time>)
		delta = (<target_speed> - <source_speed>)
		new_speed = (<source_speed> + (<delta> * <time_factor>))
	endif
	SetPlayerInfo <player> scroll_time = <new_speed>
	set_highway_speed player = <player>
	UpdateGemPositions player = <player>
	if (<time> >= <blend_time>)
		break
	endif
	GetDeltaTime
	<time> = (<time> + <delta_time>)
	wait \{1
		gameframe}
	repeat
endscript
