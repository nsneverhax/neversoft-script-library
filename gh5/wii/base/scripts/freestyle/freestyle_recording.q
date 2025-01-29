freestyle_performance_data = [
]
freestyle_current_performance_data = {
}
freestyle_recording_mode = None
freestyle_saveslot = 0
freestyle_friendlist = [
]
freestyle_songinbox = [
]

script freestyle_save_performance_data 
	player_data = [{} {} {}]
	Player = 0
	begin
	setstructureparam {
		array_name = player_data
		array_index = <Player>
		param = instrument
		value = ($freestyle_player_data [<Player>].instrument)
	}
	setstructureparam {
		array_name = player_data
		array_index = <Player>
		param = mii_index
		value = ($freestyle_player_data [<Player>].mii_index)
	}
	setstructureparam {
		array_name = player_data
		array_index = <Player>
		param = mii_database
		value = ($freestyle_player_data [<Player>].mii_database)
	}
	setstructureparam {
		array_name = player_data
		array_index = <Player>
		param = player_type
		value = ($freestyle_player_data [<Player>].player_type)
	}
	setstructureparam {
		array_name = player_data
		array_index = <Player>
		param = auto_play_enabled
		value = ($freestyle_player_data [<Player>].auto_play_enabled)
	}
	setstructureparam {
		array_name = player_data
		array_index = <Player>
		param = original_player_type
		value = ($freestyle_player_data [<Player>].original_player_type)
	}
	<Player> = (<Player> + 1)
	repeat $freestyle_max_players
	setstructureparam struct_name = freestyle_current_performance_data param = player_data value = <player_data>
	setstructureparam struct_name = freestyle_current_performance_data param = style_index value = ($freestyle_current_style_index)
	setstructureparam \{struct_name = freestyle_current_performance_data
		param = song_name
		value = qs(0x03ac90f0)}
	setstructureparam \{struct_name = freestyle_current_performance_data
		param = artist_name
		value = qs(0x03ac90f0)}
	setstructureparam struct_name = freestyle_current_performance_data param = random_seed value = ($freestyle_random_seed)
	setstructureparam struct_name = freestyle_current_performance_data param = card_spawn_offset_beats value = ($freestyle_card_spawn_offset_beats)
	setstructureparam struct_name = freestyle_current_performance_data param = chosen_progression value = ($freestyle_chosen_progression)
	setstructureparam struct_name = freestyle_current_performance_data param = chosen_cards value = ($freestyle_chosen_cards)
	setstructureparam struct_name = freestyle_current_performance_data param = endless_song value = ($freestyle_endless_song)
	setstructureparam struct_name = freestyle_current_performance_data param = stage_manager_name value = ($freestyle_stage_manager_name)
	setstructureparam struct_name = freestyle_current_performance_data param = stage_manager_ds value = ($freestyle_stage_manager_ds)
	setstructureparam \{struct_name = freestyle_current_performance_data
		param = is_tagged
		value = FALSE}
	if ($freestyle_recording_mode != overdub)
		setstructureparam struct_name = freestyle_current_performance_data param = performance_length value = ($freestyle_mode_stats.song_length)
		setstructureparam struct_name = freestyle_current_performance_data param = end_of_song_time value = ($freestyle_actual_end_of_song_time)
	endif
	GetLocalSystemTime
	setstructureparam struct_name = freestyle_current_performance_data param = date value = <localsystemtime>
endscript

script freestyle_restore_performance_data 
	freestyle_set_default_player_data
	Player = 0
	begin
	freestyle_set_player_param Player = <Player> param = has_highway value = FALSE
	freestyle_set_player_param Player = <Player> param = mii_index value = ($freestyle_current_performance_data.player_data [<Player>].mii_index)
	freestyle_set_player_param Player = <Player> param = mii_database value = ($freestyle_current_performance_data.player_data [<Player>].mii_database)
	freestyle_set_player_param Player = <Player> param = original_player_type value = ($freestyle_current_performance_data.player_data [<Player>].original_player_type)
	if (($freestyle_current_performance_data.player_data [<Player>].player_type) = ai)
		if (($freestyle_current_performance_data.player_data [<Player>].auto_play_enabled) = true)
			freestyle_set_player_param Player = <Player> param = author_type value = ai
		else
			freestyle_set_player_param Player = <Player> param = author_type value = None
		endif
	elseif (($freestyle_current_performance_data.player_data [<Player>].player_type) = human)
		freestyle_set_player_param Player = <Player> param = author_type value = human
	endif
	freestyle_setup_instrument Player = <Player> instrument = ($freestyle_current_performance_data.player_data [<Player>].instrument)
	<Player> = (<Player> + 1)
	repeat $freestyle_max_players
	freestyle_apply_style_settings index = ($freestyle_current_performance_data.style_index)
	Change freestyle_random_seed = ($freestyle_current_performance_data.random_seed)
	Change freestyle_card_spawn_offset_beats = ($freestyle_current_performance_data.card_spawn_offset_beats)
	Change freestyle_chosen_progression = ($freestyle_current_performance_data.chosen_progression)
	Change freestyle_chosen_cards = ($freestyle_current_performance_data.chosen_cards)
	Change freestyle_endless_song = ($freestyle_current_performance_data.endless_song)
	Change freestyle_actual_end_of_song_time = ($freestyle_current_performance_data.end_of_song_time)
	Change freestyle_stage_manager_name = ($freestyle_current_performance_data.stage_manager_name)
	Change freestyle_stage_manager_ds = ($freestyle_current_performance_data.stage_manager_ds)
endscript

script freestyle_timeout_error 
	printf \{'[FREESTYLE] Wii Connect 24 timeout! Try again later!'}
	if ScreenElementExists \{id = song_manager_event_catcher}
		LaunchEvent \{Type = timeout
			target = song_manager_event_catcher}
	else
		printf \{'A timeout error occurred but there was nothing to catch the event? I think your missing a possible timeout location'}
	endif
endscript

script freestyle_handle_recording_memory_filled 
	if freestyleisrecording
		if ($freestyle_recording_mode = overdub)
			Player = 0
			begin
			freestyle_get_player_param Player = <Player> param = recording_track
			if freestyleisrecording track = <recording_track>
				instrumentsetenabled Player = <Player> enable = FALSE
			endif
			<Player> = (<Player> + 1)
			repeat $freestyle_max_players
			freestyle_hud_create_warning_notification \{text = qs(0x3fc61783)
				color1 = [
					255
					0
					0
					255
				]
				color2 = [
					150
					0
					0
					255
				]}
		elseif ($freestyle_transition_state != outro)
			freestylerecordendofsongevent \{forced = 1}
			freestylestoprecording
			Change \{freestyle_forced_outro = 1}
			freestyle_start_outro
		endif
		Change \{freestyle_ignore_ds_messages = true}
		freestylestoprecording
	endif
endscript

script freestyle_start_recording 
	switch ($freestyle_recording_mode)
		case record
		freestylestartrecording
		case overdub
		Player = 0
		begin
		freestyle_get_player_param Player = <Player> param = player_type
		freestyle_get_player_param Player = <Player> param = recording_track
		if (<player_type> = human)
			freestylestartrecording track = <recording_track>
		else
			freestylestartplayback track = <recording_track>
		endif
		<Player> = (<Player> + 1)
		repeat $freestyle_max_players
		if freestyle_allow_ds_control
			freestylestartrecording \{track = stage_show}
		else
			freestylestartplayback \{track = stage_show}
		endif
		freestylestartplayback \{track = Misc}
		case playback
		freestylestartplayback
		case None
		do_nothing = true
		default
		ScriptAssert \{'invalid recording mode %r'
			r = $freestyle_recording_mode}
	endswitch
endscript

script freestyle_tag_current_performance 
	RequireParams \{[
			song_name
			artist_name
		]
		all}
	setstructureparam struct_name = freestyle_current_performance_data param = song_name value = <song_name>
	setstructureparam struct_name = freestyle_current_performance_data param = artist_name value = <artist_name>
	setstructureparam \{struct_name = freestyle_current_performance_data
		param = is_tagged
		value = true}
endscript

script freestyle_init_performance_data 
	createstructurearray \{array_name = freestyle_performance_data
		size = 40}
endscript

script freestyle_clear_performance_data 
	Change \{freestyle_performance_data = [
		]}
	Change \{freestyle_current_performance_data = {
		}}
	Change \{freestyle_friendlist = [
		]}
	Change \{freestyle_songinbox = [
		]}
endscript
