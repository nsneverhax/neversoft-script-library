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

script get_difficulty_text_upper \{difficulty = easy}
	return difficulty_text = ($difficulty_list_props.<difficulty>.text_upper)
endscript

script difficulty_setup 
	scroll_time_factor = 1
	scroll_time_factor = 1
	getplayerinfo <Player> Hyperspeed out = hyperspeed_scale
	if (<hyperspeed_scale> < $hyperspeed_fastest)
		<hyperspeed_scale> = $hyperspeed_fastest
	endif
	if (<hyperspeed_scale> > 0)
		scroll_time_factor = (<scroll_time_factor> * <hyperspeed_scale>)
	endif
	AddParams ($difficulty_list_props.<difficulty>)
	setplayerinfo <Player> scroll_time = (<scroll_time> * <scroll_time_factor>)
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
	getnumplayersingame
	<lowest_difficulty> = 4
	if (<num_players> > 0)
		getfirstplayer
		begin
		getplayerinfo <Player> difficulty
		<difficulty_index> = ($difficulty_list_props.<difficulty>.index)
		if (<difficulty_index> < <lowest_difficulty>)
			<lowest_difficulty> = <difficulty_index>
		endif
		getnextplayer Player = <Player>
		repeat <num_players>
	endif
	return band_difficulty = ($difficulty_list [<lowest_difficulty>])
endscript

script drop_player_difficulty \{Player = -1}
	getplayerinfo <Player> difficulty
	new_difficulty = ($difficulty_list_props.<difficulty>.next_difficulty_lower)
	if (<new_difficulty> = None)
		return \{FALSE}
	endif
	setplayerinfo <Player> difficulty = <new_difficulty>
	crowd_reset Player = <Player>
endscript

script set_highway_difficulty 
	get_difficulty_text_nl difficulty = <difficulty>
	player_info_difficulty = <difficulty_text_nl>
	get_difficulty_text_nl difficulty = <difficulty> no_rhythm = 1
	event_difficulty = <difficulty_text_nl>
	formatText checksumName = player_info_difficulty_checksum '%s' s = <player_info_difficulty>
	setplayerinfo <Player> difficulty = <player_info_difficulty_checksum>
	extendcrcplayer restart_gem_array_events <Player> out = event_type
	broadcastevent Type = <event_type>
	gamemode_gettype
	if (<Type> != freeplay)
		blend_time = 2.0
	else
		blend_time = 0.0
	endif
	formatText checksumName = morph_scroll_speed_id 'morph_scroll_speed%p' p = <Player>
	KillSpawnedScript id = <morph_scroll_speed_id>
	SpawnScriptNow morph_scroll_speed id = <morph_scroll_speed_id> params = {Player = <Player> difficulty = <difficulty> blend_time = <blend_time>}
	difficultychange Player = <Player>
endscript

script morph_scroll_speed \{Player = 1
		difficulty = easy
		blend_time = 1.0}
	getplayerinfo <Player> scroll_time out = source_speed
	difficulty_setup Player = <Player> difficulty = <difficulty>
	getplayerinfo <Player> scroll_time out = target_speed
	time = 0.0
	begin
	if (<time> >= <blend_time>)
		new_speed = <target_speed>
	else
		<time_factor> = (<time> / <blend_time>)
		delta = (<target_speed> - <source_speed>)
		new_speed = (<source_speed> + (<delta> * <time_factor>))
	endif
	setplayerinfo <Player> scroll_time = <new_speed>
	set_highway_speed Player = <Player>
	updategempositions Player = <Player>
	if (<time> >= <blend_time>)
		break
	endif
	GetDeltaTime
	<time> = (<time> + <delta_time>)
	Wait \{1
		gameframe}
	repeat
endscript

script expert_plus_is_enabled \{Player = !i1768515945
		current_song = NULL}
	getplayerinfo <Player> part
	getplayerinfo <Player> difficulty
	getplayerinfo <Player> double_kick_drum
	if (<part> = drum && <difficulty> = expert && <double_kick_drum> = 1)
		if (<current_song> = NULL)
			return \{true}
		endif
		get_song_struct song = <current_song>
		if StructureContains structure = <song_struct> double_kick
			if ((<song_struct>.double_kick) = 1)
				return \{true}
			endif
		endif
	endif
	return \{FALSE}
endscript
