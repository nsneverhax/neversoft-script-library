freestyle_max_players = 3
freestyle_player_data = [
	{
	}
	{
	}
	{
	}
]
freestyle_player_data_permanent = [
	{
	}
	{
	}
	{
	}
]
freestyle_player_count = 0
freestyle_tutorial_player = 0

script freestyle_set_default_player_data 
	i = 0
	begin
	setstructureparam array_name = freestyle_player_data array_index = <i> param = instrument value = None
	setstructureparam array_name = freestyle_player_data array_index = <i> param = instrument_handler value = None
	setstructureparam array_name = freestyle_player_data array_index = <i> param = lefty value = FALSE
	setstructureparam array_name = freestyle_player_data array_index = <i> param = tuning value = []
	setstructureparam array_name = freestyle_player_data array_index = <i> param = controller value = -1
	setstructureparam array_name = freestyle_player_data array_index = <i> param = whammy_reverse value = FALSE
	setstructureparam array_name = freestyle_player_data array_index = <i> param = difficulty value = beginner
	setstructureparam array_name = freestyle_player_data array_index = <i> param = mii_index value = -1
	setstructureparam array_name = freestyle_player_data array_index = <i> param = mii_database value = FrontEnd
	setstructureparam array_name = freestyle_player_data array_index = <i> param = mii_expressions value = []
	setstructureparam array_name = freestyle_player_data array_index = <i> param = character value = None
	setstructureparam array_name = freestyle_player_data array_index = <i> param = controller_type value = None
	setstructureparam array_name = freestyle_player_data array_index = <i> param = synth_effect value = None
	setstructureparam array_name = freestyle_player_data array_index = <i> param = gh_player value = (<i> + 1)
	setstructureparam array_name = freestyle_player_data array_index = <i> param = highway_player value = (<i> + 1)
	setstructureparam array_name = freestyle_player_data array_index = <i> param = has_highway value = FALSE
	setstructureparam array_name = freestyle_player_data array_index = <i> param = input_source value = controller
	setstructureparam array_name = freestyle_player_data array_index = <i> param = author_type value = None
	setstructureparam array_name = freestyle_player_data array_index = <i> param = nowbar_offset value = 0
	setstructureparam array_name = freestyle_player_data array_index = <i> param = auto_play_enabled value = FALSE
	setstructureparam array_name = freestyle_player_data array_index = <i> param = drum_assist value = FALSE
	setstructureparam array_name = freestyle_player_data array_index = <i> param = player_type value = ai
	setstructureparam array_name = freestyle_player_data array_index = <i> param = gem_track_visible value = true
	setstructureparam array_name = freestyle_player_data array_index = <i> param = hat_mode value = None
	setstructureparam array_name = freestyle_player_data array_index = <i> param = original_player_type value = None
	setstructureparam array_name = freestyle_player_data array_index = <i> param = metronome_visual value = FALSE
	setstructureparam array_name = freestyle_player_data array_index = <i> param = metronome_audio value = FALSE
	setstructureparam array_name = freestyle_player_data array_index = <i> param = metronome_rumble value = FALSE
	setstructureparam array_name = freestyle_player_data array_index = <i> param = beat_lines value = FALSE
	setstructureparam array_name = freestyle_player_data array_index = <i> param = hints value = FALSE
	formatText checksumName = recording_track 'player%p' p = <i>
	setstructureparam array_name = freestyle_player_data array_index = <i> param = recording_track value = <recording_track>
	<i> = (<i> + 1)
	repeat $freestyle_max_players
	freestyle_randomize_all_miis
endscript

script freestyle_calculate_player_count 
	Change \{freestyle_player_count = 0}
	Player = 0
	begin
	if ($freestyle_player_data [<Player>].instrument != None)
		if ($freestyle_player_data [<Player>].player_type = human)
			Change freestyle_player_count = ($freestyle_player_count + 1)
		endif
	endif
	<Player> = (<Player> + 1)
	repeat $freestyle_max_players
endscript

script freestyle_player_has_proper_controller 
	return \{FALSE}
endscript

script freestyle_find_player_with_controller 
	Player = -1
	i = 0
	begin
	if ($freestyle_player_data [<i>].controller = <controller>)
		<Player> = <i>
		break
	endif
	<i> = (<i> + 1)
	repeat $freestyle_max_players
	return Player = <Player>
endscript

script freestyle_setup_ai_player 
	RequireParams \{[
			Player
		]
		all}
	gh_player = (<Player> + 1)
	if NOT (($freestyle_recording_mode) = overdub)
		freestyle_setup_randomized_mii Player = <Player>
	endif
	if ($freestyle_recording_mode = overdub)
		setstructureparam array_name = freestyle_player_data array_index = <Player> param = input_source value = recording
		setstructureparam array_name = freestyle_player_data array_index = <Player> param = auto_play_enabled value = FALSE
	else
		setstructureparam array_name = freestyle_player_data array_index = <Player> param = input_source value = auto_play
		setstructureparam array_name = freestyle_player_data array_index = <Player> param = auto_play_enabled value = true
	endif
	setstructureparam array_name = freestyle_player_data array_index = <Player> param = controller value = -1
	setstructureparam array_name = freestyle_player_data array_index = <Player> param = controller_type value = None
	setstructureparam array_name = freestyle_player_data array_index = <Player> param = has_highway value = FALSE
	setstructureparam array_name = freestyle_player_data array_index = <Player> param = nowbar_offset value = 0
	setstructureparam array_name = freestyle_player_data array_index = <Player> param = player_type value = ai
	setplayerinfo <gh_player> in_game = 0
endscript

script freestyle_setup_human_player 
	RequireParams \{[
			Player
		]
		all}
	gh_player = (<Player> + 1)
	setstructureparam array_name = freestyle_player_data array_index = <Player> param = gh_player value = <gh_player>
	setstructureparam array_name = freestyle_player_data array_index = <Player> param = highway_player value = <gh_player>
	setstructureparam array_name = freestyle_player_data array_index = <Player> param = has_highway value = true
	setstructureparam array_name = freestyle_player_data array_index = <Player> param = input_source value = controller
	setstructureparam array_name = freestyle_player_data array_index = <Player> param = player_type value = human
	setstructureparam array_name = freestyle_player_data array_index = <Player> param = auto_play_enabled value = FALSE
	setplayerinfo <gh_player> in_game = 1
endscript

script freestyle_find_player_with_instrument 
	RequireParams \{[
			instrument
		]
		all}
	Player = 0
	begin
	if (($freestyle_player_data [<Player>].instrument) = <instrument>)
		return true player_with_instrument = <Player>
	endif
	<Player> = (<Player> + 1)
	repeat $freestyle_max_players
	return \{FALSE
		player_with_instrument = -1}
endscript

script freestyle_is_instrument_ai 
	RequireParams \{[
			instrument
		]
		all}
	freestyle_find_player_with_instrument instrument = <instrument>
	if ($freestyle_player_data [<player_with_instrument>].player_type = ai)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script freestyle_get_highway_index 
	freestyle_get_human_player_count
	if ((<human_freestyle_players> = 1) || (($freestyle_player_data [<Player>].instrument) = guitar))
		return \{index = 1}
	else
		if (($freestyle_player_data [<Player>].instrument) = bass)
			if (<human_freestyle_players> = 2)
				return \{index = 2}
			elseif (<human_freestyle_players> = 3)
				return \{index = 3}
			endif
		elseif (($freestyle_player_data [<Player>].instrument) = drums)
			if (<human_freestyle_players> = 2)
				freestyle_is_instrument_there \{instrument = guitar}
				if (<is_there> > -1)
					return \{index = 2}
				endif
				freestyle_is_instrument_there \{instrument = bass}
				if (<is_there> > -1)
					return \{index = 1}
				endif
			elseif (<human_freestyle_players> = 3)
				return \{index = 2}
			endif
		endif
	endif
endscript

script freestyle_get_human_player_count 
	counter = 0
	human_freestyle_players = 0
	begin
	if NOT (($freestyle_player_data [<counter>].controller) = -1)
		human_freestyle_players = (<human_freestyle_players> + 1)
	endif
	counter = (<counter> + 1)
	repeat ($freestyle_max_players)
	return human_freestyle_players = <human_freestyle_players>
endscript

script freestyle_setup_instrument 
	RequireParams \{[
			Player
			instrument
		]
		all}
	setstructureparam array_name = freestyle_player_data array_index = <Player> param = instrument value = <instrument>
	player_type = ($freestyle_player_data [<Player>].player_type)
	controller = ($freestyle_player_data [<Player>].controller)
	highway_player = ($freestyle_player_data [<Player>].highway_player)
	if (<player_type> = ai)
		controller_type = None
	else
		getwiicontrollertype controller = <controller>
	endif
	setstructureparam array_name = freestyle_player_data array_index = <Player> param = controller_type value = <controller_type>
	switch (<instrument>)
		case guitar
		setstructureparam array_name = freestyle_player_data array_index = <Player> param = character value = musician3
		setstructureparam array_name = freestyle_player_data array_index = <Player> param = instrument_handler value = guitar
		setplayerinfo <highway_player> part = guitar
		case bass
		setstructureparam array_name = freestyle_player_data array_index = <Player> param = character value = musician4
		setstructureparam array_name = freestyle_player_data array_index = <Player> param = instrument_handler value = guitar
		setplayerinfo <highway_player> part = bass
		case drums
		setstructureparam array_name = freestyle_player_data array_index = <Player> param = character value = musician2
		setplayerinfo <highway_player> part = drum
		if (<player_type> = ai)
			setstructureparam array_name = freestyle_player_data array_index = <Player> param = instrument_handler value = drums_kit
		else
			switch (<controller_type>)
				case drumkit
				setstructureparam array_name = freestyle_player_data array_index = <Player> param = instrument_handler value = drums_kit
				case nunchuk
				setstructureparam array_name = freestyle_player_data array_index = <Player> param = instrument_handler value = drums_nunchuk
				default
				ScriptAssert 'invalid controller type (%c)' c = <controller_type>
			endswitch
		endif
		default
		ScriptAssert 'unhandled instrument type %i' i = <instrument>
	endswitch
endscript

script freestyle_choose_default_settings_based_on_difficulty 
	Player = 0
	beginner_count = 0
	advanced_count = 0
	begin
	player_type = ($freestyle_player_data [<Player>].player_type)
	difficulty = ($freestyle_player_data [<Player>].difficulty)
	instrument = ($freestyle_player_data [<Player>].instrument)
	if (<player_type> = human)
		if (<difficulty> = beginner)
			if (<instrument> = drums)
				setstructureparam array_name = freestyle_player_data array_index = <Player> param = drum_assist value = true
			else
				setstructureparam array_name = freestyle_player_data array_index = <Player> param = drum_assist value = FALSE
			endif
			setstructureparam array_name = freestyle_player_data array_index = <Player> param = gem_track_visible value = true
			<beginner_count> = (<beginner_count> + 1)
		else
			setstructureparam array_name = freestyle_player_data array_index = <Player> param = drum_assist value = FALSE
			setstructureparam array_name = freestyle_player_data array_index = <Player> param = gem_track_visible value = FALSE
			<advanced_count> = (<advanced_count> + 1)
		endif
	endif
	<Player> = (<Player> + 1)
	repeat $freestyle_max_players
	if ((<advanced_count> <= 0) && (<beginner_count> <= 0))
		ds_only = true
	else
		ds_only = FALSE
	endif
	Player = 0
	begin
	player_type = ($freestyle_player_data [<Player>].player_type)
	difficulty = ($freestyle_player_data [<Player>].difficulty)
	instrument = ($freestyle_player_data [<Player>].instrument)
	instrument_handler = ($freestyle_player_data [<Player>].instrument_handler)
	if (<player_type> = human)
		if (<difficulty> = beginner)
			setstructureparam array_name = freestyle_player_data array_index = <Player> param = metronome_visual value = true
			if NOT (($freestyle_game_mode) = tutorial)
				setstructureparam array_name = freestyle_player_data array_index = <Player> param = metronome_audio value = true
			else
				setstructureparam array_name = freestyle_player_data array_index = <Player> param = metronome_audio value = FALSE
			endif
			if NOT (($freestyle_game_mode) = tutorial)
				if (<instrument> = drums)
					if (<instrument_handler> = drums_nunchuk)
						setstructureparam array_name = freestyle_player_data array_index = <Player> param = metronome_rumble value = true
					else
						setstructureparam array_name = freestyle_player_data array_index = <Player> param = metronome_rumble value = FALSE
					endif
				else
					setstructureparam array_name = freestyle_player_data array_index = <Player> param = metronome_rumble value = true
				endif
			else
				setstructureparam array_name = freestyle_player_data array_index = <Player> param = metronome_rumble value = FALSE
			endif
			setstructureparam array_name = freestyle_player_data array_index = <Player> param = beat_lines value = true
			setstructureparam array_name = freestyle_player_data array_index = <Player> param = hints value = true
		else
			setstructureparam array_name = freestyle_player_data array_index = <Player> param = metronome_visual value = FALSE
			setstructureparam array_name = freestyle_player_data array_index = <Player> param = metronome_audio value = FALSE
			setstructureparam array_name = freestyle_player_data array_index = <Player> param = metronome_rumble value = FALSE
			setstructureparam array_name = freestyle_player_data array_index = <Player> param = beat_lines value = true
			setstructureparam array_name = freestyle_player_data array_index = <Player> param = hints value = FALSE
			if NOT (<beginner_count> = 0)
				setstructureparam array_name = freestyle_player_data array_index = <Player> param = metronome_visual value = true
			endif
		endif
	endif
	<Player> = (<Player> + 1)
	repeat $freestyle_max_players
	if (((<beginner_count>) = 0 && (<ds_only> = FALSE)) || (($freestyle_game_mode) = tutorial))
		Change \{freestyle_song_progression_enabled = 0}
		if ($freestyle_recording_mode != overdub)
			Change \{freestyle_endless_song = true}
		endif
	else
		Change \{freestyle_song_progression_enabled = 1}
		if ($freestyle_recording_mode != overdub)
			Change \{freestyle_endless_song = FALSE}
		endif
	endif
	if (<advanced_count> = 0)
		Change \{freestyle_needs_advanced_setup = 0}
	else
		Change \{freestyle_needs_advanced_setup = 1}
	endif
	freestyle_find_player_with_instrument \{instrument = guitar}
	if freestyle_is_instrument_ai \{instrument = guitar}
		if NOT (($freestyle_game_mode) = tutorial)
			setstructureparam array_name = freestyle_player_data array_index = <player_with_instrument> param = auto_play_enabled value = true
		else
			setstructureparam array_name = freestyle_player_data array_index = <player_with_instrument> param = auto_play_enabled value = FALSE
		endif
	else
		setstructureparam array_name = freestyle_player_data array_index = <player_with_instrument> param = auto_play_enabled value = FALSE
	endif
	freestyle_find_player_with_instrument \{instrument = bass}
	if freestyle_is_instrument_ai \{instrument = bass}
		if NOT (($freestyle_game_mode) = tutorial)
			setstructureparam array_name = freestyle_player_data array_index = <player_with_instrument> param = auto_play_enabled value = true
		else
			setstructureparam array_name = freestyle_player_data array_index = <player_with_instrument> param = auto_play_enabled value = FALSE
		endif
	else
		setstructureparam array_name = freestyle_player_data array_index = <player_with_instrument> param = auto_play_enabled value = FALSE
	endif
	freestyle_find_player_with_instrument \{instrument = drums}
	if freestyle_is_instrument_ai \{instrument = drums}
		if NOT (($freestyle_game_mode) = tutorial)
			setstructureparam array_name = freestyle_player_data array_index = <player_with_instrument> param = auto_play_enabled value = true
		else
			setstructureparam array_name = freestyle_player_data array_index = <player_with_instrument> param = auto_play_enabled value = FALSE
		endif
	else
		setstructureparam array_name = freestyle_player_data array_index = <player_with_instrument> param = auto_play_enabled value = FALSE
	endif
endscript

script freestyle_get_player_param 
	RequireParams \{[
			Player
			param
		]
		all}
	return_params = {}
	setstructureparam struct_name = return_params param = <param> value = ($freestyle_player_data [<Player>].<param>)
	return <return_params>
endscript

script freestyle_set_player_param 
	RequireParams \{[
			Player
			param
			value
		]
		all}
	setstructureparam array_name = freestyle_player_data array_index = <Player> param = <param> value = <value>
endscript

script freestyle_find_player_param 
	RequireParams \{[
			param
			value
		]
		all}
	index = -1
	i = 0
	begin
	if StructureContains structure = ($freestyle_player_data [<i>]) Name = <param>
		if ($freestyle_player_data [<i>].<param> = <value>)
			index = <i>
			break
		endif
	endif
	i = (<i> + 1)
	repeat $freestyle_max_players
	if (<i> = $freestyle_max_players)
		printf 'Pair %a=%b not found in any freestyle_player_data' a = <param> b = <value>
		if GotParam \{do_assert}
			ScriptAssert \{'Specified pair not found!'}
		endif
	endif
	return index = <index>
endscript

script freestyle_setup_tutorial_player \{controller = 0
		difficulty = beginner}
	Player = ($freestyle_tutorial_player)
	RequireParams \{[
			instrument
		]
		all}
	freestyle_setup_human_player Player = <Player>
	getwiicontrollertype controller = <controller>
	setstructureparam array_name = freestyle_player_data array_index = <Player> param = controller_type value = <controller_type>
	setstructureparam array_name = freestyle_player_data array_index = <Player> param = controller value = <controller>
	freestyle_setup_instrument Player = <Player> instrument = <instrument>
	freestyle_setup_randomized_mii Player = <Player>
	setstructureparam array_name = freestyle_player_data array_index = <Player> param = difficulty value = <difficulty>
	if (<handedness> = righty)
		freestyle_set_lefty_flip Player = <Player> lefty = FALSE
	else
		freestyle_set_lefty_flip Player = <Player> lefty = true
	endif
	counter = 0
	begin
	if NOT (($freestyle_player_data [<counter>].player_type) = human)
		freestyle_setup_ai_player Player = <counter>
		freestyle_get_unused_instrument
		freestyle_setup_instrument Player = <counter> instrument = <unused_instrument>
	endif
	counter = (<counter> + 1)
	repeat ($freestyle_max_players)
	freestyle_choose_default_settings_based_on_difficulty
endscript

script freestyle_set_enable_all_instruments 
	RequireParams \{[
			enable
		]
		all}
	Player = 0
	begin
	instrumentsetenabled Player = <Player> enable = <enable>
	<Player> = (<Player> + 1)
	repeat $freestyle_max_players
endscript

script freestyle_setup_randomized_mii \{random_type = from_frontend}
	RequireParams \{[
			Player
		]
		all}
	freestyle_set_player_param Player = <Player> param = mii_random_type value = <random_type>
	freestyle_set_player_param Player = <Player> param = mii_index value = -1
	freestyle_set_player_param Player = <Player> param = mii_database value = None
endscript

script freestyle_randomize_all_miis 
	Player = 0
	begin
	freestyle_setup_randomized_mii Player = <Player>
	<Player> = (<Player> + 1)
	repeat $freestyle_max_players
endscript

script freestyle_choose_player_miis 
	Player = 0
	begin
	freestyle_get_player_param Player = <Player> param = mii_index
	freestyle_get_player_param Player = <Player> param = mii_database
	freestyle_get_player_param Player = <Player> param = mii_random_type
	if (<mii_random_type> = None)
		freestyle_add_used_mii index = <mii_index> database = <mii_database>
	endif
	<Player> = (<Player> + 1)
	repeat $freestyle_max_players
	<Player> = 0
	begin
	freestyle_get_player_param Player = <Player> param = mii_random_type
	if (<mii_random_type> != None)
		freestyle_choose_random_mii_params random_type = <mii_random_type>
		freestyle_add_used_mii index = <mii_index> database = <mii_database>
		freestyle_set_player_param Player = <Player> param = mii_index value = <mii_index>
		freestyle_set_player_param Player = <Player> param = mii_database value = <mii_database>
	endif
	<Player> = (<Player> + 1)
	repeat $freestyle_max_players
endscript

script freestyle_get_position_on_highway_for_player 
	RequireParams \{[
			Player
		]
		all}
	if NOT ($freestyle_game_mode = tutorial)
		freestyle_get_human_player_count
		freestyle_get_highway_index Player = <Player>
		position = ($highway_guitarfreestyle.highway_positions [(<human_freestyle_players> -1)] [(<index> -1)])
		return position = <position>
	else
		return position = ($highway_guitarfreestyle.tutorial_highway_pos)
	endif
endscript

script freestyle_setup_players_for_playback 
	Player = 0
	begin
	setstructureparam array_name = freestyle_player_data array_index = <Player> param = input_source value = recording
	setstructureparam array_name = freestyle_player_data array_index = <Player> param = player_type value = ai
	setstructureparam array_name = freestyle_player_data array_index = <Player> param = mii_random_type value = None
	<Player> = (<Player> + 1)
	repeat $freestyle_max_players
endscript

script freestyle_set_lefty_flip 
	RequireParams \{[
			Player
			lefty
		]
		all}
	freestyle_get_player_param Player = <Player> param = controller
	freestyle_get_player_param Player = <Player> param = instrument
	bool_to_int bool_value = <lefty> int_name = lefty_int
	switch (<instrument>)
		case guitar
		case bass
		get_progression_instrument_user_option part = guitar controller = <controller> option = 'lefty_flip'
		if (<lefty_int> != <user_option>)
			save_progression_instrument_user_option part = guitar controller = <controller> option = 'lefty_flip' new_value = <lefty_int>
		endif
		get_progression_instrument_user_option part = bass controller = <controller> option = 'lefty_flip'
		if (<lefty_int> != <user_option>)
			save_progression_instrument_user_option part = bass controller = <controller> option = 'lefty_flip' new_value = <lefty_int>
		endif
		case drums
		get_progression_instrument_user_option part = drum controller = <controller> option = 'lefty_flip'
		if (<lefty_int> != <user_option>)
			save_progression_instrument_user_option part = drum controller = <controller> option = 'lefty_flip' new_value = <lefty_int>
		endif
		default
		ScriptAssert 'unhandled instrument type %i' i = <instrument>
	endswitch
	freestyle_set_player_param Player = <Player> param = lefty value = <lefty>
endscript

script 0xa10cd104 
	RequireParams \{[
			mii_index
			mii_database
			instrument
			player_type
			auto_play_enabled
		]
		all}
	if (<player_type> = human)
		if (<mii_database> = randomdb)
			switch (<instrument>)
				case guitar
				player_name = qs(0xaecdfaea)
				case bass
				player_name = qs(0x1fe7d0f9)
				case drums
				player_name = qs(0x40351ace)
				default
				ScriptAssert 'Unhandled instrument type %i' i = <instrument>
			endswitch
		else
			getmiiname index = <mii_index> database = <mii_database>
			player_name = <mii_name>
		endif
	elseif ((<player_type> = ai) && (<auto_play_enabled> = true))
		player_name = $wii_freestyle_cpu_text
	else
		player_name = qs(0x03ac90f0)
	endif
	return player_name = <player_name>
endscript
