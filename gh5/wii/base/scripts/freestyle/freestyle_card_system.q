freestyle_drum_assist_simplification_mask = 1048832
freestyle_starting_beat = 1
freestyle_smallest_hold_length = 0.5
freestyle_gem_track_ids = [
	guitar_ai
	bass_ai
	drums_ai
	guitar_high
	guitar_mid
	guitar_low
	bass_high
	bass_mid
	bass_low
	drums
]
freestyle_gem_track_names = [
	'guitar_ai'
	'bass_ai'
	'drums_ai'
	'guitar_high'
	'guitar_mid'
	'guitar_low'
	'bass_high'
	'bass_mid'
	'bass_low'
	'drums'
]
freestyle_gem_track_capacities = {
	guitar_ai = 1500
	bass_ai = 1500
	drums_ai = 3000
	guitar_high = 1250
	guitar_mid = 1250
	guitar_low = 1250
	bass_high = 1250
	bass_mid = 1250
	bass_low = 1250
	drums = 2500
}
freestyle_card_spawn_offset_time = 0
freestyle_card_spawn_offset_beats = 0
freestyle_gem_track_params = {
}
freestyle_gem_track_count = 0
freestyle_gem_track_guitar_ai = [
]
freestyle_gem_track_bass_ai = [
]
freestyle_gem_track_drums_ai = [
]
freestyle_gem_track_guitar_high = [
]
freestyle_gem_track_guitar_mid = [
]
freestyle_gem_track_guitar_low = [
]
freestyle_gem_track_bass_high = [
]
freestyle_gem_track_bass_mid = [
]
freestyle_gem_track_bass_low = [
]
freestyle_gem_track_drums = [
]
freestyle_card_set = {
}
freestyle_loop_gem_tracks = FALSE

script freestyle_init_card_system 
	GetArraySize \{$freestyle_gem_track_ids}
	Change freestyle_gem_track_count = <array_Size>
	Player = 0
	begin
	freestyle_choose_player_gem_tracks Player = <Player>
	freestyle_set_player_param Player = <Player> param = highway_gem_track value = <highway_gem_track>
	freestyle_set_player_param Player = <Player> param = auto_play_gem_track value = <auto_play_gem_track>
	<Player> = (<Player> + 1)
	repeat $freestyle_max_players
	track = 0
	begin
	gem_track_id = ($freestyle_gem_track_ids [<track>])
	gem_track_name = ($freestyle_gem_track_names [<track>])
	freestyle_set_gem_track_param gem_track_id = <gem_track_id> param = current_event value = 0
	freestyle_set_gem_track_param gem_track_id = <gem_track_id> param = offset_beats value = ($freestyle_starting_beat)
	formatText checksumName = event_array 'freestyle_gem_track_%t' t = <gem_track_name>
	freestyle_set_gem_track_param gem_track_id = <gem_track_id> param = event_array value = <event_array>
	freestyle_set_gem_track_param gem_track_id = <gem_track_id> param = event_count value = 0
	freestyle_set_gem_track_param gem_track_id = <gem_track_id> param = loop_count value = 0
	createstructurearray array_name = <event_array> size = ($freestyle_gem_track_capacities.<gem_track_id>) Heap = quota_song
	<track> = (<track> + 1)
	repeat $freestyle_gem_track_count
	if (($freestyle_endless_song = true) || ($freestyle_game_mode = tutorial))
		Change \{freestyle_loop_gem_tracks = true}
	else
		Change \{freestyle_loop_gem_tracks = FALSE}
	endif
endscript

script freestyle_deinit_card_system 
	freestyle_destroy_all_gem_tracks
endscript

script freestyle_start_card_system 
	if NOT ismetronomeenabled
		ScriptAssert \{'metronome must be started before starting card system'}
	endif
	freestyle_calculate_card_spawn_offset
endscript

script freestyle_update_card_system 
	if NOT ismetronomeenabled
		return
	endif
	Player = 0
	begin
	freestyle_choose_player_gem_tracks Player = <Player>
	freestyle_change_gem_tracks Player = <Player> highway_gem_track = <highway_gem_track> auto_play_gem_track = <auto_play_gem_track>
	<Player> = (<Player> + 1)
	repeat $freestyle_max_players
	if metronomebeatthisframe
		getmetronomelengthofbeat
		current_beat = ($freestyle_last_beat_number)
		next_beat = (<current_beat> + 1)
		track = 0
		begin
		gem_track_id = ($freestyle_gem_track_ids [<track>])
		freestyle_get_gem_track_param gem_track_id = <gem_track_id> param = current_event
		freestyle_get_gem_track_param gem_track_id = <gem_track_id> param = offset_beats
		freestyle_get_gem_track_param gem_track_id = <gem_track_id> param = event_count
		begin
		if (<current_event> >= <event_count>)
			if (($freestyle_loop_gem_tracks = true) && (<event_count> > 0))
				freestyle_get_gem_track_param gem_track_id = <gem_track_id> param = loop_count
				<loop_count> = (<loop_count> + 1)
				freestyle_set_gem_track_param gem_track_id = <gem_track_id> param = loop_count value = <loop_count>
				<current_event> = 0
				<offset_beats> = ($freestyle_starting_beat + ($freestyle_total_song_beats * <loop_count>))
			else
				break
			endif
		endif
		freestyle_get_gem_track_event_data gem_track_id = <gem_track_id> event_index = <current_event>
		spawn_beat = (<offset_beats> + (<event_data>.offset))
		if ((<spawn_beat> < <current_beat>) || (<spawn_beat> > <next_beat>))
			break
		endif
		spawn_time = ((<spawn_beat> * <length_of_beat>) + $freestyle_card_spawn_offset_time)
		freestyle_spawn_gem_track_event gem_track_id = <gem_track_id> event_index = <current_event> spawn_time = <spawn_time>
		<current_event> = (<current_event> + 1)
		<offset_beats> = (<offset_beats> + <event_data>.offset + <event_data>.length)
		repeat
		freestyle_set_gem_track_param gem_track_id = <gem_track_id> param = current_event value = <current_event>
		freestyle_set_gem_track_param gem_track_id = <gem_track_id> param = offset_beats value = <offset_beats>
		<track> = (<track> + 1)
		repeat $freestyle_gem_track_count
	endif
endscript

script freestyle_spawn_gem_track_event 
	RequireParams \{[
			gem_track_id
			event_index
			spawn_time
		]
		all}
	Player = 0
	begin
	freestyle_get_player_param Player = <Player> param = highway_gem_track
	freestyle_get_player_param Player = <Player> param = auto_play_gem_track
	if (<highway_gem_track> = <gem_track_id>)
		freestyle_spawn_gem_track_event_for_player {
			Player = <Player>
			gem_track_id = <gem_track_id>
			event_index = <event_index>
			spawn_time = <spawn_time>
			highway = true
		}
	endif
	if (<auto_play_gem_track> = <gem_track_id>)
		freestyle_spawn_gem_track_event_for_player {
			Player = <Player>
			gem_track_id = <gem_track_id>
			event_index = <event_index>
			spawn_time = <spawn_time>
			auto_play = true
		}
	endif
	<Player> = (<Player> + 1)
	repeat $freestyle_max_players
endscript

script freestyle_spawn_gem_track_event_for_player \{highway = FALSE
		auto_play = FALSE}
	RequireParams \{[
			Player
			gem_track_id
			event_index
			spawn_time
		]
		all}
	freestyle_get_gem_track_event_data gem_track_id = <gem_track_id> event_index = <event_index>
	freestyle_get_player_param Player = <Player> param = has_highway
	freestyle_get_player_param Player = <Player> param = gem_track_visible
	freestyle_get_player_param Player = <Player> param = instrument
	freestyle_get_player_param Player = <Player> param = lefty
	getmetronomelengthofbeat
	GetSongTimeMs
	if (<instrument> = drums)
		hold_time = 0.0
	else
		hold_time = (<event_data>.length * <length_of_beat>)
	endif
	if ((<highway> = true) && (<has_highway> = true) && (<gem_track_visible> = true))
		if (<event_data>.length < $freestyle_smallest_hold_length)
			visual_hold_time = 0.0
		else
			visual_hold_time = <hold_time>
		endif
		freestyle_get_player_param Player = <Player> param = nowbar_offset
		freestyle_get_player_param Player = <Player> param = highway_player
		marker = (<spawn_time> - <nowbar_offset>)
		freestyle_simplify_gem_mask Player = <Player> gem_mask = (<event_data>.gems)
		final_mask = <simplified_mask>
		if ((<instrument> = drums) && (<lefty> = true))
			leftyswapdrumgems gems = <simplified_mask>
			<final_mask> = <swapped_gems>
		endif
		freestyle_spawn_gems_on_highway {
			highway_player = <highway_player>
			event_mask = <final_mask>
			marker = <marker>
			length = <visual_hold_time>
			accent = FALSE
			gem_type = suggested
			play_spawn_anim = 0
		}
	endif
	if ((<auto_play> = true) && (<spawn_time> > <time>))
		freestyle_add_auto_play_event {
			Player = <Player>
			event_data = <event_data>
			start_time = <spawn_time>
			hold_time = <hold_time>
		}
	endif
endscript

script freestyle_change_gem_tracks 
	RequireParams \{[
			Player
			highway_gem_track
			auto_play_gem_track
		]
		all}
	old_highway_gem_track = ($freestyle_player_data [<Player>].highway_gem_track)
	old_auto_play_gem_track = ($freestyle_player_data [<Player>].auto_play_gem_track)
	if (<highway_gem_track> != <old_highway_gem_track>)
		highway_gem_track_changed = true
	else
		highway_gem_track_changed = FALSE
	endif
	if (<auto_play_gem_track> != <old_auto_play_gem_track>)
		auto_play_gem_track_changed = true
	else
		auto_play_gem_track_changed = FALSE
	endif
	if ((<highway_gem_track_changed> = FALSE) && (<auto_play_gem_track_changed> = FALSE))
		return
	endif
	freestyle_set_player_param Player = <Player> param = highway_gem_track value = <highway_gem_track>
	freestyle_set_player_param Player = <Player> param = auto_play_gem_track value = <auto_play_gem_track>
	if (<highway_gem_track_changed> = true)
		freestyle_clear_and_respawn_gem_track Player = <Player> highway = true gem_track_id = <highway_gem_track>
	endif
	if (<auto_play_gem_track_changed> = true)
		freestyle_clear_and_respawn_gem_track Player = <Player> auto_play = true gem_track_id = <auto_play_gem_track>
	endif
endscript

script freestyle_clear_and_respawn_player_gem_tracks 
	RequireParams \{[
			Player
		]
		all}
	freestyle_get_player_param Player = <Player> param = highway_gem_track
	freestyle_get_player_param Player = <Player> param = auto_play_gem_track
	freestyle_clear_and_respawn_gem_track Player = <Player> highway = true gem_track_id = <highway_gem_track>
	freestyle_clear_and_respawn_gem_track Player = <Player> auto_play = true gem_track_id = <auto_play_gem_track>
endscript

script freestyle_clear_and_respawn_gem_track \{highway = FALSE
		auto_play = FALSE}
	RequireParams \{[
			Player
			gem_track_id
			highway
			auto_play
		]
		all}
	freestyle_get_player_param Player = <Player> param = has_highway
	freestyle_get_player_param Player = <Player> param = highway_player
	if (<auto_play> = true)
		freestyle_clear_player_auto_play_data Player = <Player>
	endif
	if ((<highway> = true) && (<has_highway> = true))
		clearsuggestedgems Player = <highway_player>
	endif
	if (<gem_track_id> = None)
		return
	endif
	freestyle_get_player_param Player = <Player> param = nowbar_offset
	freestyle_get_gem_track_param gem_track_id = <gem_track_id> param = current_event
	freestyle_get_gem_track_param gem_track_id = <gem_track_id> param = offset_beats
	freestyle_get_gem_track_param gem_track_id = <gem_track_id> param = event_count
	freestyle_get_gem_track_param gem_track_id = <gem_track_id> param = loop_count
	getmetronomelengthofbeat
	if (<event_count> = 0)
		return
	endif
	round_float_to_int value = (<nowbar_offset> / <length_of_beat>)
	nowbar_beats = <rounded_value>
	target_beat = ($freestyle_last_beat_number - <nowbar_beats>)
	if (<offset_beats> < <target_beat>)
		return
	endif
	if ((<current_event> = 0) && (<loop_count> = 0))
		return
	endif
	target_event = <current_event>
	target_offset = <offset_beats>
	begin
	<target_event> = (<target_event> - 1)
	if (<target_event> < 0)
		if (($freestyle_loop_gem_tracks = true) && (<event_count> > 0) && (<loop_count> > 0))
			<target_event> = (<event_count> - 1)
		else
			break
		endif
	endif
	freestyle_get_gem_track_event_data gem_track_id = <gem_track_id> event_index = <target_event>
	<target_offset> = (<target_offset> - <event_data>.offset - <event_data>.length)
	start_beat = (<target_offset> + <event_data>.offset)
	end_beat = (<start_beat> + <event_data>.length)
	if (<end_beat> <= <target_beat>)
		break
	endif
	repeat
	if (<target_event> < 0)
		event_index = 0
		event_offset = ($freestyle_starting_beat)
	else
		event_index = <target_event>
		event_offset = <target_offset>
	endif
	spawn_time = (<event_offset> * <length_of_beat>)
	begin
	if (<event_index> = <current_event>)
		break
	endif
	freestyle_get_gem_track_event_data gem_track_id = <gem_track_id> event_index = <event_index>
	beat_diff = ($freestyle_last_beat_number - <event_offset>)
	time_diff = (<beat_diff> * <length_of_beat>)
	spawn_time = ($freestyle_last_beat_time + $freestyle_card_spawn_offset_time - <time_diff>)
	<spawn_time> = (<spawn_time> + (<event_data>.offset * <length_of_beat>))
	freestyle_spawn_gem_track_event_for_player {
		Player = <Player>
		gem_track_id = <gem_track_id>
		event_index = <event_index>
		spawn_time = <spawn_time>
		highway = <highway>
		auto_play = <auto_play>
	}
	<event_index> = (<event_index> + 1)
	if (<event_index> >= <event_count>)
		if ($freestyle_loop_gem_tracks = true)
			<event_index> = 0
		else
			break
		endif
	endif
	<event_offset> = (<event_offset> + <event_data>.offset + <event_data>.length)
	repeat
endscript

script freestyle_get_gem_track_param 
	RequireParams \{[
			gem_track_id
			param
		]}
	return_params = {}
	setstructureparam {
		struct_name = return_params
		param = <param>
		value = ($freestyle_gem_track_params.<gem_track_id>.<param>)
	}
	return <return_params>
endscript

script freestyle_set_gem_track_param 
	RequireParams \{[
			gem_track_id
			param
			value
		]}
	if StructureContains structure = $freestyle_gem_track_params <gem_track_id>
		track_params = ($freestyle_gem_track_params.<gem_track_id>)
	else
		track_params = {}
	endif
	setstructureparam {
		struct_name = track_params
		param = <param>
		value = <value>
	}
	setstructureparam {
		struct_name = freestyle_gem_track_params
		param = <gem_track_id>
		value = <track_params>
	}
endscript

script freestyle_get_gem_track_event_data 
	RequireParams \{[
			gem_track_id
			event_index
		]}
	freestyle_get_gem_track_param gem_track_id = <gem_track_id> param = event_array
	return event_data = ($<event_array> [<event_index>])
endscript

script freestyle_calculate_card_spawn_offset 
	Player = 0
	largest_nowbar_offset = 0.0
	begin
	nowbar_offset = ($freestyle_player_data [<Player>].nowbar_offset)
	if (<nowbar_offset> > <largest_nowbar_offset>)
		<largest_nowbar_offset> = <nowbar_offset>
	endif
	<Player> = (<Player> + 1)
	repeat $freestyle_max_players
	getmetronomelengthofbeat
	offset_time = 0
	offset_beats = 0
	begin
	if (<offset_time> >= <largest_nowbar_offset>)
		break
	endif
	<offset_time> = (<offset_time> + <length_of_beat>)
	<offset_beats> = (<offset_beats> + 1)
	repeat
	Change freestyle_card_spawn_offset_time = <offset_time>
	Change freestyle_card_spawn_offset_beats = <offset_beats>
endscript

script freestyle_round_beats_up_to_measure 
	RequireParams \{[
			beats
		]
		all}
	round_float_to_int value = <beats>
	Mod a = <rounded_value> b = ($freestyle_beats_per_measure)
	if (<Mod> = 0)
		rounded_beats = <rounded_value>
	else
		rounded_beats = (<rounded_value> + ($freestyle_beats_per_measure - <Mod>))
	endif
	return rounded_beats = <rounded_beats>
endscript

script freestyle_simplify_mask 
	RequireParams \{[
			mask_to_simplify
			mask_to_remove
		]
		all}
	negate <mask_to_remove>
	simplified_mask = (<mask_to_simplify> && <negated_value>)
	removed_mask = (<mask_to_simplify> && <mask_to_remove>)
	return simplified_mask = <simplified_mask> removed_mask = <removed_mask>
endscript

script freestyle_simplify_gem_mask 
	RequireParams \{[
			Player
			gem_mask
		]
		all}
	simplified_gem_mask = <gem_mask>
	removed_gem_mask = 0
	if (($freestyle_player_data [<Player>].drum_assist) = true)
		freestyle_simplify_mask mask_to_simplify = <simplified_gem_mask> mask_to_remove = ($freestyle_drum_assist_simplification_mask)
		<simplified_gem_mask> = <simplified_mask>
		<removed_gem_mask> = (<removed_gem_mask> || <removed_mask>)
	endif
	if (($freestyle_player_data [<Player>].instrument_handler) = drums_nunchuk)
		if (<simplified_gem_mask> && 4352)
			freestyle_simplify_mask mask_to_simplify = <simplified_gem_mask> mask_to_remove = 65552
			<simplified_gem_mask> = <simplified_mask>
			<removed_gem_mask> = (<removed_gem_mask> || <removed_mask>)
		endif
	endif
	return simplified_mask = <simplified_gem_mask> removed_mask = <removed_gem_mask>
endscript

script freestyle_choose_player_gem_tracks 
	RequireParams \{[
			Player
		]
		all}
	instrument = ($freestyle_player_data [<Player>].instrument)
	player_type = ($freestyle_player_data [<Player>].player_type)
	auto_play_enabled = ($freestyle_player_data [<Player>].auto_play_enabled)
	highway_gem_track = None
	auto_play_gem_track = None
	if (<player_type> = ai)
		switch (<instrument>)
			case guitar
			<highway_gem_track> = None
			<auto_play_gem_track> = guitar_ai
			case bass
			<highway_gem_track> = None
			<auto_play_gem_track> = bass_ai
			case drums
			<highway_gem_track> = None
			<auto_play_gem_track> = drums_ai
			default
			ScriptAssert 'unhandled instrument %i' i = <instrument>
		endswitch
	else
		if ($freestyle_debug_force_ai_tracks = 1)
			auto_play_ai = true
		else
			auto_play_ai = FALSE
		endif
		switch (<instrument>)
			case guitar
			getguitaractivetilt Player = <Player>
			switch (<active_tilt>)
				case 0
				<highway_gem_track> = guitar_high
				case 1
				<highway_gem_track> = guitar_mid
				case 2
				<highway_gem_track> = guitar_low
				default
				ScriptAssert 'unhandled tilt %t' t = <active_tilt>
			endswitch
			if (<auto_play_enabled> = true)
				if (<auto_play_ai> = true)
					<auto_play_gem_track> = guitar_ai
				else
					<auto_play_gem_track> = <highway_gem_track>
				endif
			endif
			case bass
			getguitaractivetilt Player = <Player>
			switch (<active_tilt>)
				case 0
				<highway_gem_track> = bass_high
				case 1
				<highway_gem_track> = bass_mid
				case 2
				<highway_gem_track> = bass_low
				default
				ScriptAssert 'unhandled tilt %t' t = <active_tilt>
			endswitch
			if (<auto_play_enabled> = true)
				if (<auto_play_ai> = true)
					<auto_play_gem_track> = bass_ai
				else
					<auto_play_gem_track> = <highway_gem_track>
				endif
			endif
			case drums
			drum_assist = ($freestyle_player_data [<Player>].drum_assist)
			<highway_gem_track> = drums
			if ((<auto_play_enabled> = true) || (<drum_assist> = true))
				if (<auto_play_ai> = true)
					<auto_play_gem_track> = drums_ai
				else
					<auto_play_gem_track> = <highway_gem_track>
				endif
			endif
			default
			ScriptAssert 'unhandled instrument %i' i = <instrument>
		endswitch
	endif
	return highway_gem_track = <highway_gem_track> auto_play_gem_track = <auto_play_gem_track>
endscript

script freestyle_add_card_events \{initial_offset = 0}
	RequireParams \{[
			card
		]
		all}
	track = 0
	begin
	gem_track_id = ($freestyle_gem_track_ids [<track>])
	freestyle_add_card_events_to_gem_track gem_track_id = <gem_track_id> card = <card> initial_offset = <initial_offset>
	<track> = (<track> + 1)
	repeat $freestyle_gem_track_count
endscript

script freestyle_add_card_events_to_gem_track \{initial_offset = 0}
	RequireParams \{[
			gem_track_id
			card
		]
		all}
	freestyle_get_gem_track_param gem_track_id = <gem_track_id> param = event_array
	freestyle_get_gem_track_param gem_track_id = <gem_track_id> param = event_count
	GetArraySize ($<event_array>)
	array_capacity = <array_Size>
	GetArraySize ($freestyle_card_set.<card>.<gem_track_id>)
	events_to_add = <array_Size>
	event = 0
	total_length = 0.0
	if (<events_to_add> > 0)
		begin
		event_data = ($freestyle_card_set.<card>.<gem_track_id> [<event>])
		<total_length> = (<total_length> + <event_data>.offset + <event_data>.length)
		if (<event> = 0)
			setstructureparam {
				struct_name = event_data
				param = offset
				value = (<event_data>.offset + <initial_offset>)
			}
		endif
		if (<event_count> >= <array_capacity>)
			ScriptAssert 'Gem track %t has exceeded capacity of %c' t = <gem_track_id> c = <array_capacity>
			break
		endif
		SetArrayElement ArrayName = <event_array> index = <event_count> NewValue = <event_data> globalarray
		<event_count> = (<event_count> + 1)
		<event> = (<event> + 1)
		repeat <events_to_add>
		freestyle_set_gem_track_param gem_track_id = <gem_track_id> param = event_count value = <event_count>
	endif
	return total_events_length = <total_length>
endscript

script freestyle_spawn_solo_section_now \{offset_beats = 0.0}
	RequireParams \{[
			Player
			length_in_beats
		]
		all}
	freestyle_get_player_param Player = <Player> param = gem_track_visible
	if ((<gem_track_visible> = FALSE) && ($freestyle_song_progression_enabled = 0))
		if NOT (($freestyle_game_mode) = tutorial)
			return
		endif
	endif
	freestyle_get_player_param Player = <Player> param = highway_player
	freestyle_get_player_param Player = <Player> param = nowbar_offset
	getmetronomelengthofbeat
	offset_time = (<offset_beats> * <length_of_beat>)
	marker = ($freestyle_last_beat_time + $freestyle_card_spawn_offset_time + <offset_time> - <nowbar_offset>)
	length_ms = (<length_in_beats> * <length_of_beat>)
	addfreestylesolo {
		Player = <highway_player>
		marker = <marker>
		length = <length_ms>
	}
endscript

script freestyle_clear_all_gem_tracks 
	track = 0
	begin
	gem_track_id = ($freestyle_gem_track_ids [<track>])
	freestyle_set_gem_track_param gem_track_id = <gem_track_id> param = event_count value = 0
	<track> = (<track> + 1)
	repeat $freestyle_gem_track_count
endscript

script freestyle_destroy_all_gem_tracks 
	track = 0
	begin
	gem_track_id = ($freestyle_gem_track_ids [<track>])
	freestyle_get_gem_track_param gem_track_id = <gem_track_id> param = event_array
	Change GlobalName = <event_array> NewValue = []
	<track> = (<track> + 1)
	repeat $freestyle_gem_track_count
endscript

script freestyle_reset_all_gem_tracks 
	track = 0
	begin
	gem_track_id = ($freestyle_gem_track_ids [<track>])
	freestyle_set_gem_track_param gem_track_id = <gem_track_id> param = current_event value = 0
	freestyle_set_gem_track_param gem_track_id = <gem_track_id> param = offset_beats value = ($freestyle_starting_beat)
	freestyle_set_gem_track_param gem_track_id = <gem_track_id> param = loop_count value = 0
	<track> = (<track> + 1)
	repeat $freestyle_gem_track_count
endscript
