freestyle_mii_nps_start_time = 0
freestyle_mii_nps_updated = 0
freestyle_mii_expression_settings = {
}
freestyle_used_miis = {
}
freestyle_mii_expression_guitar_notes_to_trigger = 3
freestyle_mii_expression_min_time_before_change = 10000
freestyle_mii_playing_fast_nps_drums = 10
freestyle_mii_stance_min_time_before_change = 1000
freestyle_mii_drummer_needed_expressions = [
	open_mouth
	smile
]
freestyle_guitar_nps_levels = [
	0
	2
	6
]
freestyle_bass_nps_levels = [
	0
	5
]
freestyle_nps_smooth_factor = 0.6
freestyle_nps_stabilize_time = 3

script freestyle_init_mii_scripts 
	GetStartTime
	Change freestyle_mii_nps_start_time = <starttime>
	Change \{freestyle_mii_nps_updated = 0}
	Player = 0
	begin
	setstructureparam array_name = freestyle_player_data array_index = <Player> param = expression_notes value = 0
	setstructureparam array_name = freestyle_player_data array_index = <Player> param = last_expression_time value = 0
	setstructureparam array_name = freestyle_player_data array_index = <Player> param = notes_per_second value = 0
	setstructureparam array_name = freestyle_player_data array_index = <Player> param = nps_counter value = 0
	setstructureparam array_name = freestyle_player_data array_index = <Player> param = nps_smooth value = 0.0
	setstructureparam array_name = freestyle_player_data array_index = <Player> param = nps_range value = 0
	setstructureparam array_name = freestyle_player_data array_index = <Player> param = nps_last_range value = 0
	setstructureparam array_name = freestyle_player_data array_index = <Player> param = nps_unstable_counter value = 0
	setstructureparam array_name = freestyle_player_data array_index = <Player> param = playing_fast value = 0
	setstructureparam array_name = freestyle_player_data array_index = <Player> param = last_stance_time value = 0
	setstructureparam array_name = freestyle_player_data array_index = <Player> param = last_stance_index value = 0
	<Player> = (<Player> + 1)
	repeat $freestyle_max_players
	freestyle_spawn_mii_expression_scripts
endscript

script freestyle_deinit_mii_scripts 
	freestyle_kill_mii_expression_scripts
endscript

script freestyle_spawn_mii_expression_scripts 
	Player = 0
	begin
	character = ($freestyle_player_data [<Player>].character)
	if (<character> != None)
		freestyle_get_mii_expression_script_id character = <character>
		SpawnScriptNow {
			freestyle_mii_expression_blink_loop
			params = {character = <character>}
			id = <expression_script_id>
		}
	endif
	<Player> = (<Player> + 1)
	repeat $freestyle_max_players
endscript

script freestyle_kill_mii_expression_scripts 
	Player = 0
	begin
	character = ($freestyle_player_data [<Player>].character)
	freestyle_get_mii_expression_script_id character = <character>
	KillSpawnedScript id = <expression_script_id>
	<Player> = (<Player> + 1)
	repeat $freestyle_max_players
endscript

script freestyle_mii_expression_blink_loop 
	begin
	<character> :mii_setexpression expression = ($freestyle_mii_expression_settings.default_expression)
	GetRandomValue \{a = 3.0
		b = 8.0
		Name = random_wait}
	Wait <random_wait> Seconds
	<character> :mii_setexpression expression = blink
	Wait \{0.1
		Seconds}
	repeat
endscript

script freestyle_mii_expression_wait_then_begin_blinking 
	Wait <Duration> Seconds
	freestyle_get_mii_expression_script_id character = <character>
	SpawnScriptLater {
		freestyle_mii_expression_blink_loop
		params = {character = <character>}
		id = <expression_script_id>
	}
endscript

script freestyle_change_mii_expression \{Duration = 3}
	freestyle_get_mii_expression_script_id character = <character>
	KillSpawnedScript id = <expression_script_id>
	<character> :mii_setexpression expression = <expression>
	SpawnScriptNow {
		freestyle_mii_expression_wait_then_begin_blinking
		params = {character = <character> Duration = <Duration>}
		id = <expression_script_id>
	}
endscript

script quantize_value_to_buckets 
	RequireParams \{[
			bucket_array
			bucket_value
		]
		all}
	bucket_index = 0
	GetArraySize <bucket_array>
	i = (<array_Size> - 1)
	begin
	if (<bucket_value> >= (<bucket_array> [<i>]))
		index = <i>
		break
	endif
	i = (<i> - 1)
	repeat <array_Size>
	return bucket_index = <index>
endscript

script freestyle_update_mii_scripts 
	getelapsedtime starttime = ($freestyle_mii_nps_start_time)
	if (<ElapsedTime> >= 1000)
		Player = 0
		begin
		last_nps = ($freestyle_player_data [<Player>].notes_per_second)
		notes_per_second = ($freestyle_player_data [<Player>].nps_counter)
		setstructureparam array_name = freestyle_player_data array_index = <Player> param = notes_per_second value = <notes_per_second>
		setstructureparam array_name = freestyle_player_data array_index = <Player> param = nps_counter value = 0
		notes_smoothed = ((<notes_per_second> * $freestyle_nps_smooth_factor) + (<last_nps> * (1.0 - $freestyle_nps_smooth_factor)))
		setstructureparam array_name = freestyle_player_data array_index = <Player> param = nps_smooth value = <notes_smoothed>
		skip_this = FALSE
		switch ($freestyle_player_data [<Player>].instrument)
			case guitar
			nps_levels = ($freestyle_guitar_nps_levels)
			case bass
			nps_levels = ($freestyle_bass_nps_levels)
			default
			skip_this = true
		endswitch
		nps_range = 0
		if (<skip_this> = FALSE)
			quantize_value_to_buckets bucket_array = <nps_levels> bucket_value = <notes_per_second>
			nps_range = <bucket_index>
			if (<nps_range> = $freestyle_player_data [<Player>].nps_last_range)
				setstructureparam array_name = freestyle_player_data array_index = <Player> param = nps_range value = <nps_range>
				setstructureparam array_name = freestyle_player_data array_index = <Player> param = nps_unstable_counter value = 0
			else
				count = ($freestyle_player_data [<Player>].nps_unstable_counter + 1)
				setstructureparam array_name = freestyle_player_data array_index = <Player> param = nps_unstable_counter value = <count>
			endif
			setstructureparam array_name = freestyle_player_data array_index = <Player> param = nps_last_range value = <nps_range>
			if ($freestyle_player_data [<Player>].nps_unstable_counter > $freestyle_nps_stabilize_time)
				setstructureparam array_name = freestyle_player_data array_index = <Player> param = notes_per_second value = <notes_smoothed>
				quantize_value_to_buckets bucket_array = <nps_levels> bucket_value = <notes_smoothed>
				nps_range = <bucket_index>
				setstructureparam array_name = freestyle_player_data array_index = <Player> param = nps_range value = <bucket_index>
			endif
		endif
		<Player> = (<Player> + 1)
		repeat $freestyle_max_players
		GetStartTime
		Change freestyle_mii_nps_start_time = <starttime>
		Change \{freestyle_mii_nps_updated = 1}
	else
		Change \{freestyle_mii_nps_updated = 0}
	endif
	Player = 0
	begin
	switch ($freestyle_player_data [<Player>].instrument)
		case guitar
		case bass
		freestyle_update_mii_guitarist Player = <Player>
		case drums
		freestyle_update_mii_drummer Player = <Player>
	endswitch
	<Player> = (<Player> + 1)
	repeat $freestyle_max_players
endscript

script freestyle_mii_notify_guitar_note_played 
	freestyle_mii_notify_note_played Player = <Player>
	freestyle_increment_total_notes_played Player = <Player>
	expression_notes = ($freestyle_player_data [<Player>].expression_notes + 1)
	if (<expression_notes> >= $freestyle_mii_expression_guitar_notes_to_trigger)
		last_expression_time = ($freestyle_player_data [<Player>].last_expression_time)
		getelapsedtime starttime = <last_expression_time>
		if (<ElapsedTime> >= $freestyle_mii_expression_min_time_before_change)
			switch ($freestyle_player_data [<Player>].instrument)
				case guitar
				expression_list = ($freestyle_mii_expression_settings.guitar_expressions)
				case bass
				expression_list = ($freestyle_mii_expression_settings.bass_expressions)
			endswitch
			GetArraySize <expression_list>
			GetRandomValue Name = random_index a = 0 b = (<array_Size> - 1) integer
			random_expression = (<expression_list> [<random_index>])
			freestyle_change_mii_expression expression = <random_expression> character = ($freestyle_player_data [<Player>].character)
			GetStartTime
			setstructureparam {
				array_name = freestyle_player_data
				array_index = <Player>
				param = last_expression_time
				value = <starttime>
			}
			<expression_notes> = 0
		endif
	endif
	setstructureparam {
		array_name = freestyle_player_data
		array_index = <Player>
		param = expression_notes
		value = <expression_notes>
	}
endscript

script freestyle_update_mii_guitarist \{Player = 0}
	freestyle_update_mii_guitarist_anims Player = <Player>
endscript

script freestyle_update_mii_guitarist_anims 
	last_stance_time = ($freestyle_player_data [<Player>].last_stance_time)
	getelapsedtime starttime = <last_stance_time>
	if (<ElapsedTime> > $freestyle_mii_stance_min_time_before_change)
		switch ($freestyle_player_data [<Player>].instrument)
			case guitar
			stance_levels = ($freestyle_mii_anim_set.guitar_stances)
			case bass
			stance_levels = ($freestyle_mii_anim_set.bass_stances)
		endswitch
		GetArraySize <stance_levels>
		stance_level_count = <array_Size>
		if ($freestyle_player_data [<Player>].nps_range >= <stance_level_count>)
			ScriptAssert \{'freestyle_mii_anim_set nps_levels does not match # of stances!'}
		endif
		new_stance = ($freestyle_player_data [<Player>].nps_range)
		old_stance_index = ($freestyle_player_data [<Player>].last_stance_index)
		if (<old_stance_index> != <new_stance>)
			freestyle_request_next_stance Player = <Player> stance = (<stance_levels> [<new_stance>])
			freestyle_register_stance_index Player = <Player> index = <new_stance>
		endif
		if (<new_stance> > 0)
			GetStartTime
			setstructureparam {
				array_name = freestyle_player_data
				array_index = <Player>
				param = last_stance_time
				value = <starttime>
			}
		endif
	endif
endscript

script freestyle_update_mii_drummer 
	if ($freestyle_mii_nps_updated = 1)
		notes_per_second = ($freestyle_player_data [<Player>].notes_per_second)
		playing_fast = ($freestyle_player_data [<Player>].playing_fast)
		if (<notes_per_second> >= $freestyle_mii_playing_fast_nps_drums)
			freestyle_change_mii_expression {
				expression = open_mouth
				character = ($freestyle_player_data [<Player>].character)
				Duration = 1.1
			}
			setstructureparam array_name = freestyle_player_data array_index = <Player> param = playing_fast value = 1
		elseif (<playing_fast> = 1)
			freestyle_change_mii_expression expression = smile character = ($freestyle_player_data [<Player>].character)
			setstructureparam array_name = freestyle_player_data array_index = <Player> param = playing_fast value = 0
		endif
	endif
endscript

script freestyle_get_mii_expression_script_id 
	MangleChecksums a = <character> b = mii_expression_script
	return expression_script_id = <mangled_ID>
endscript

script freestyle_mii_notify_note_played 
	nps_counter = ($freestyle_player_data [<Player>].nps_counter + 1)
	setstructureparam array_name = freestyle_player_data array_index = <Player> param = nps_counter value = <nps_counter>
endscript

script freestyle_setup_miis_by_style 
	Change freestyle_mii_expression_settings = ($freestyle_current_style_settings.mii_expression_settings)
	freestyle_determine_needed_mii_expressions
endscript

script freestyle_determine_needed_mii_expressions 
	Player = 0
	begin
	instrument = ($freestyle_player_data [<Player>].instrument)
	if (<instrument> != None)
		expression_list = [blink]
		AddArrayElement array = <expression_list> element = ($freestyle_mii_expression_settings.default_expression)
		<expression_list> = <array>
		switch (<instrument>)
			case guitar
			combine_arrays array1 = <expression_list> array2 = ($freestyle_mii_expression_settings.guitar_expressions)
			<expression_list> = <combined_array>
			case bass
			combine_arrays array1 = <expression_list> array2 = ($freestyle_mii_expression_settings.bass_expressions)
			<expression_list> = <combined_array>
			case drums
			combine_arrays array1 = <expression_list> array2 = $freestyle_mii_drummer_needed_expressions
			<expression_list> = <combined_array>
			default
			ScriptAssert 'unhandled instrument type %a' a = <instrument>
		endswitch
		setstructureparam array_name = freestyle_player_data array_index = <Player> param = mii_expressions value = <expression_list>
	endif
	<Player> = (<Player> + 1)
	repeat $freestyle_max_players
endscript

script freestyle_clear_used_miis 
	vector_clear \{vector_name = freestyle_used_miis}
endscript

script freestyle_add_used_mii 
	RequireParams \{[
			index
			database
		]
		all}
	element = {
		index = <index>
		database = <database>
	}
	vector_push_back vector_name = freestyle_used_miis element = <element>
endscript

script freestyle_is_mii_used 
	RequireParams \{[
			index
			database
		]
		all}
	vector_get_size \{vector_name = freestyle_used_miis}
	i = 0
	if (<vector_size> > 0)
		begin
		vector_get_element vector_name = freestyle_used_miis index = <i>
		if ((<element>.index = <index>) && (<element>.database = <database>))
			return \{true}
		endif
		<i> = (<i> + 1)
		repeat <vector_size>
	endif
	return \{FALSE}
endscript

script freestyle_choose_random_mii_params \{random_type = from_frontend}
	switch (<random_type>)
		case from_frontend
		if freestyle_choose_random_mii_index_from_database \{database = FrontEnd}
			return mii_database = FrontEnd mii_index = <index>
		elseif freestyle_choose_random_mii_index_from_database \{database = randomdb}
			return mii_database = randomdb mii_index = <index>
		else
			ScriptAssert \{'Unable to find a random mii that isnt in use'}
		endif
		case generated
		if freestyle_choose_random_mii_index_from_database \{database = randomdb}
			return mii_database = randomdb mii_index = <index>
		else
			ScriptAssert \{'Unable to find a random mii that isnt in use'}
		endif
		default
		ScriptAssert 'Invalid random mii type %r' r = <random_type>
	endswitch
endscript

script freestyle_choose_random_mii_index_from_database 
	RequireParams \{[
			database
		]
		all}
	getmiicount database = <database>
	if (<mii_count> > 0)
		GetRandomValue Name = random_index a = 0 b = (<mii_count> - 1) integer
		begin
		if NOT freestyle_is_mii_used index = <random_index> database = <database>
			return true index = <random_index>
		endif
		<random_index> = (<random_index> + 1)
		if (<random_index> >= <mii_count>)
			<random_index> = 0
		endif
		repeat <mii_count>
	endif
	return \{FALSE}
endscript
