freestyle_auto_play_start_early = 25
freestyle_auto_play_queue0 = {
}
freestyle_auto_play_queue1 = {
}
freestyle_auto_play_queue2 = {
}

script freestyle_init_auto_play 
	Player = 0
	begin
	formatText checksumName = vector_name 'freestyle_auto_play_queue%p' p = <Player>
	setstructureparam {
		array_name = freestyle_player_data
		array_index = <Player>
		param = auto_play_queue
		value = <vector_name>
	}
	setstructureparam {
		array_name = freestyle_player_data
		array_index = <Player>
		param = auto_play_event_started
		value = 0
	}
	<Player> = (<Player> + 1)
	repeat $freestyle_max_players
endscript

script freestyle_deinit_auto_play 
	freestyle_clear_auto_play
endscript

script freestyle_update_auto_play 
	Player = 0
	GetSongTimeMs
	begin
	vector_name = ($freestyle_player_data [<Player>].auto_play_queue)
	if ($freestyle_player_data [<Player>].instrument_handler = guitar)
		early_time = (<time> + $freestyle_auto_play_start_early + 16)
	else
		early_time = (<time> + $freestyle_auto_play_start_early)
	endif
	if NOT vector_is_empty vector_name = <vector_name>
		vector_get_front vector_name = <vector_name>
		if ($freestyle_player_data [<Player>].auto_play_event_started = 0)
			if (<early_time> >= (<front_element>.start_time))
				freestyle_auto_play_start_event Player = <Player>
			endif
		else
			if (<early_time> >= (<front_element>.end_time))
				freestyle_auto_play_finish_event Player = <Player>
			endif
		endif
	endif
	<Player> = (<Player> + 1)
	repeat $freestyle_max_players
endscript

script freestyle_add_auto_play_event 
	RequireParams \{[
			Player
			event_data
			start_time
			hold_time
		]
		all}
	auto_play_event = {
		start_time = <start_time>
		end_time = (<start_time> + <hold_time>)
		gems = (<event_data>.gems)
		velocity = (<event_data>.velocity)
		tilt = (<event_data>.tilt)
		accent = (<event_data>.accent)
	}
	vector_push_back {
		vector_name = ($freestyle_player_data [<Player>].auto_play_queue)
		element = <auto_play_event>
	}
endscript

script freestyle_clear_player_auto_play_data 
	RequireParams \{[
			Player
		]
		all}
	freestyle_auto_play_finish_event Player = <Player>
	vector_clear vector_name = ($freestyle_player_data [<Player>].auto_play_queue)
endscript

script freestyle_auto_play_start_event 
	RequireParams \{[
			Player
		]
		all}
	freestyle_get_player_param Player = <Player> param = auto_play_queue
	freestyle_get_player_param Player = <Player> param = soloing
	freestyle_get_player_param Player = <Player> param = input_source
	freestyle_get_player_param Player = <Player> param = auto_play_enabled
	freestyle_get_player_param Player = <Player> param = drum_assist
	vector_get_front vector_name = <auto_play_queue>
	current_event = <front_element>
	if ((<input_source> = auto_play) && (<auto_play_enabled> = true))
		instrumentplaygems {
			Player = <Player>
			gems = (<current_event>.gems)
			velocity = (<current_event>.velocity)
			tilt = (<current_event>.tilt)
			accent = (<current_event>.accent)
		}
	elseif ((<soloing> = FALSE) && (<drum_assist> = true))
		freestyle_simplify_gem_mask Player = <Player> gem_mask = (<current_event>.gems)
		if (<removed_mask> != 0)
			instrumentplaygems {
				Player = <Player>
				gems = <removed_mask>
				velocity = (<current_event>.velocity)
				tilt = (<current_event>.tilt)
				accent = (<current_event>.accent)
			}
		endif
	endif
	freestyle_set_player_param Player = <Player> param = auto_play_event_started value = 1
	if ((<current_event>.start_time) = (<current_event>.end_time))
		freestyle_auto_play_finish_event Player = <Player>
	endif
endscript

script freestyle_auto_play_finish_event 
	RequireParams \{[
			Player
		]
		all}
	if ($freestyle_player_data [<Player>].auto_play_event_started = 0)
		return
	endif
	vector_name = ($freestyle_player_data [<Player>].auto_play_queue)
	input_source = ($freestyle_player_data [<Player>].input_source)
	auto_play_enabled = ($freestyle_player_data [<Player>].auto_play_enabled)
	vector_pop_front vector_name = <vector_name>
	if ((<input_source> = auto_play) && (<auto_play_enabled> = true))
		switch ($freestyle_player_data [<Player>].instrument)
			case guitar
			case bass
			instrumentstopallnotes Player = <Player>
		endswitch
	endif
	setstructureparam {
		array_name = freestyle_player_data
		array_index = <Player>
		param = auto_play_event_started
		value = 0
	}
endscript

script freestyle_sort_auto_play_events 
	RequireParams \{[
			Player
		]
		all}
	vector_name = ($freestyle_player_data [<Player>].auto_play_queue)
	vector_sort vector_name = <vector_name> compare_func = freestyle_auto_play_event_compare
endscript

script freestyle_auto_play_event_compare 
	RequireParams \{[
			a
			b
		]
		all}
	if ((<a>.start_time) > (<b>.start_time))
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script freestyle_clear_auto_play 
	vector_clear \{vector_name = freestyle_auto_play_queue0}
	vector_clear \{vector_name = freestyle_auto_play_queue1}
	vector_clear \{vector_name = freestyle_auto_play_queue2}
endscript
