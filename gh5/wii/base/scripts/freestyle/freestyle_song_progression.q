freestyle_song_extra_beats = 2
freestyle_instrument_steal_solo_chance = {
	guitar = 0.5
	bass = 0.5
	drums = 0.25
}
freestyle_song_section_text_duration_secs = 5.0
freestyle_song_progression = {
}
freestyle_song_sections = [
]
freestyle_song_section_count = 0
freestyle_current_song_section = 0
freestyle_song_progression_enabled = 1
freestyle_chosen_cards = {
}
freestyle_chosen_progression = 0
freestyle_total_song_beats = 0
freestyle_endless_song = FALSE
freestyle_end_of_song_time = 0
freestyle_actual_end_of_song_time = 0
freestyle_chosen_solos = {
}
freestyle_current_solo_players = [
]

script freestyle_init_song_progression 
	GetArraySize ($freestyle_song_progression.progression_choices)
	if ($freestyle_recording_mode != overdub)
		if (($freestyle_debug_force_song_progression >= 0) && ($freestyle_debug_force_song_progression < <array_Size>))
			Change freestyle_chosen_progression = ($freestyle_debug_force_song_progression)
		else
			GetRandomValue Name = random_progression a = 0 b = (<array_Size> - 1) integer
			Change freestyle_chosen_progression = <random_progression>
		endif
	endif
	Change freestyle_song_sections = ($freestyle_song_progression.progression_choices [$freestyle_chosen_progression])
	GetArraySize ($freestyle_song_sections)
	Change freestyle_song_section_count = <array_Size>
	freestyle_choose_solo_sections
	track = 0
	begin
	freestyle_build_gem_track gem_track_id = ($freestyle_gem_track_ids [<track>])
	<track> = (<track> + 1)
	repeat $freestyle_gem_track_count
	freestyle_reset_song_progression
endscript

script freestyle_start_song_progression 
	freestyle_build_event_list
	freestyle_sort_events
	if ($freestyle_recording_mode = overdub)
		Change freestyle_end_of_song_time = ($freestyle_actual_end_of_song_time)
	else
		getmetronomelengthofbeat
		end_of_song_beats = ($freestyle_starting_beat + $freestyle_total_song_beats + $freestyle_card_spawn_offset_beats)
		Change freestyle_end_of_song_time = (<end_of_song_beats> * <length_of_beat>)
	endif
endscript

script freestyle_deinit_song_progression 
	Change \{freestyle_song_sections = [
		]}
	Change \{freestyle_chosen_cards = {
		}}
	Change \{freestyle_chosen_solos = {
		}}
	Change \{freestyle_current_solo_players = [
		]}
endscript

script freestyle_reset_song_progression 
	Change \{freestyle_current_song_section = -1}
	Player = 0
	begin
	freestyle_set_player_param Player = <Player> param = soloing value = FALSE
	freestyle_set_player_param Player = <Player> param = solo_type value = None
	<Player> = (<Player> + 1)
	repeat $freestyle_max_players
endscript

script freestyle_should_instrument_have_solo 
	RequireParams \{[
			section
			instrument
		]
		all}
	assignchecksum checksum_name = section_checksum value = (<section> + 1)
	if StructureContains structure = ($freestyle_chosen_solos) <section_checksum>
		if StructureContains structure = ($freestyle_chosen_solos.<section_checksum>) <instrument>
			return true solo_type = ($freestyle_chosen_solos.<section_checksum>.<instrument>)
		endif
	endif
	return \{FALSE}
endscript

script freestyle_should_player_have_solo 
	RequireParams \{[
			section
			Player
		]
		all}
	if freestyle_should_instrument_have_solo section = <section> instrument = ($freestyle_player_data [<Player>].instrument)
		return true solo_type = <solo_type>
	endif
	return \{FALSE}
endscript

script freestyle_advance_section 
	Change freestyle_current_song_section = ($freestyle_current_song_section + 1)
	section_data = ($freestyle_song_sections [$freestyle_current_song_section])
	if ($freestyle_song_progression_enabled = 1)
		if StructureContains structure = <section_data> display_text
			freestyle_hud_show_flashy_text text = (<section_data>.display_text) Duration = $freestyle_song_section_text_duration_secs
		endif
		Change \{freestyle_current_solo_players = [
			]}
		Player = 0
		begin
		if freestyle_should_player_have_solo section = $freestyle_current_song_section Player = <Player>
			if NOT ($freestyle_player_data [<Player>].soloing = true)
				freestyle_starpower_on Player = <Player>
			endif
			freestyle_set_player_param Player = <Player> param = soloing value = true
			freestyle_set_player_param Player = <Player> param = solo_type value = <solo_type>
			AddArrayElement array = ($freestyle_current_solo_players) element = <Player>
			Change freestyle_current_solo_players = <array>
		else
			if ($freestyle_player_data [<Player>].soloing = true)
				freestyle_play_solo_end_anim Player = <Player>
				freestyle_starpower_off Player = <Player>
			endif
			freestyle_destroy_solo_indicator Player = <Player>
			freestyle_set_player_param Player = <Player> param = soloing value = FALSE
			freestyle_set_player_param Player = <Player> param = solo_type value = None
		endif
		<Player> = (<Player> + 1)
		repeat $freestyle_max_players
		freestyle_spawn_solo_indicators
		freestyle_set_solo_instrument_volumes
	endif
	if StructureContains structure = <section_data> change_hat_mode
		if freestyle_find_player_with_instrument \{instrument = drums}
			freestyle_get_player_param Player = <player_with_instrument> param = player_type
			freestyle_get_player_param Player = <player_with_instrument> param = input_source
			if ((<player_type> = ai) && (<input_source> = auto_play))
				setdrumhihatmode Player = <player_with_instrument> hat_mode = (<section_data>.change_hat_mode)
			endif
		endif
	endif
	freestyle_choose_appropriate_camera
endscript

script freestyle_build_gem_track 
	RequireParams \{[
			gem_track_id
		]
		all}
	section = 0
	next_section_offset = 0.0
	if ($freestyle_song_section_count > 0)
		begin
		if NOT freestyle_find_card_for_song_section section = <section>
			ScriptAssert 'No card found in song section number %s' s = <section>
			return
		endif
		if NOT StructureContains structure = $freestyle_card_set <card>
			ScriptAssert 'No card named %c exists' c = <card>
			return
		endif
		card_length = ($freestyle_card_set.<card>.card_length)
		if freestyle_should_gem_track_have_solo gem_track_id = <gem_track_id> section = <section>
			<next_section_offset> = (<next_section_offset> + <card_length>)
		else
			freestyle_add_card_events_to_gem_track gem_track_id = <gem_track_id> card = <card> initial_offset = <next_section_offset>
			if (<total_events_length> = 0)
				<next_section_offset> = (<next_section_offset> + <card_length>)
			else
				<next_section_offset> = (<card_length> - <total_events_length>)
			endif
		endif
		<section> = (<section> + 1)
		repeat $freestyle_song_section_count
	endif
endscript

script freestyle_should_gem_track_have_solo 
	RequireParams \{[
			gem_track_id
			section
		]
		all}
	switch (<gem_track_id>)
		case guitar_high
		case guitar_mid
		case guitar_low
		instrument = guitar
		case bass_high
		case bass_mid
		case bass_low
		instrument = bass
		case drums
		instrument = drums
		default
		return \{FALSE}
	endswitch
	if freestyle_should_instrument_have_solo section = <section> instrument = <instrument>
		return true solo_type = <solo_type>
	endif
	return \{FALSE}
endscript

script freestyle_build_event_list 
	section = 0
	offset = 0.0
	if ($freestyle_song_section_count > 0)
		begin
		section_data = ($freestyle_song_sections [<section>])
		if NOT freestyle_find_card_for_song_section section = <section>
			formatText TextName = error_msg qs(0x067cb1d2) s = <section>
			wii_screen_logger_print text = <error_msg>
			ScriptAssert <error_msg>
			return
		endif
		if NOT StructureContains structure = $freestyle_card_set <card>
			formatText TextName = error_msg qs(0x811d31bd) c = <card>
			wii_screen_logger_print text = <error_msg>
			ScriptAssert <error_msg>
			return
		endif
		card_length = ($freestyle_card_set.<card>.card_length)
		freestyle_add_advance_section_event trigger_beat = <offset>
		<offset> = (<offset> + <card_length>)
		<section> = (<section> + 1)
		repeat $freestyle_song_section_count
		Change freestyle_total_song_beats = (<offset>)
		freestyle_add_final_beat_event trigger_beat = ($freestyle_total_song_beats - 1)
		if ($freestyle_endless_song = true)
			freestyle_add_end_of_song_event trigger_beat = ($freestyle_total_song_beats)
		else
			freestyle_add_end_of_song_event trigger_beat = ($freestyle_total_song_beats + $freestyle_song_extra_beats)
		endif
		Player = 0
		begin
		<section> = 0
		<offset> = 0.0
		solo_trigger_beat = -1
		solo_length = 0.0
		begin
		section_data = ($freestyle_song_sections [<section>])
		if NOT freestyle_find_card_for_song_section section = <section>
			return
		endif
		if NOT StructureContains structure = $freestyle_card_set <card>
			return
		endif
		card_length = ($freestyle_card_set.<card>.card_length)
		if freestyle_should_player_have_solo section = <section> Player = <Player>
			if (<solo_trigger_beat> = -1)
				<solo_trigger_beat> = <offset>
				<solo_length> = <card_length>
			else
				<solo_length> = (<solo_length> + <card_length>)
			endif
		elseif (<solo_trigger_beat> != -1)
			freestyle_add_solo_section_event {
				trigger_beat = <solo_trigger_beat>
				Player = <Player>
				length_in_beats = <solo_length>
			}
			<solo_trigger_beat> = -1
		endif
		<offset> = (<offset> + <card_length>)
		<section> = (<section> + 1)
		repeat $freestyle_song_section_count
		if (<solo_trigger_beat> != -1)
			freestyle_add_solo_section_event {
				trigger_beat = <solo_trigger_beat>
				Player = <Player>
				length_in_beats = <solo_length>
			}
		endif
		<Player> = (<Player> + 1)
		repeat $freestyle_max_players
	endif
endscript

script freestyle_find_card_for_song_section 
	RequireParams \{[
			section
		]
		all}
	section_data = ($freestyle_song_sections [<section>])
	if StructureContains structure = <section_data> card
		card = (<section_data>.card)
		return true card = <card>
	elseif StructureContains structure = <section_data> random_card
		random_card = (<section_data>.random_card)
		if StructureContains structure = $freestyle_chosen_cards <random_card>
			card = ($freestyle_chosen_cards.<random_card>)
			return true card = <card>
		else
			if NOT StructureContains \{structure = $freestyle_song_progression
					random_card_choices}
				ScriptAssert \{'Song progression structure does not have random_card_choices'}
				return \{FALSE}
			endif
			if NOT StructureContains structure = ($freestyle_song_progression.random_card_choices) <random_card>
				ScriptAssert 'No card named %c found in random card choices' c = <random_card>
				return \{FALSE}
			endif
			card_choices = ($freestyle_song_progression.random_card_choices.<random_card>)
			GetArraySize <card_choices>
			GetRandomValue Name = chosen_index a = 0 b = (<array_Size> - 1) integer
			card = (<card_choices> [<chosen_index>])
			setstructureparam struct_name = freestyle_chosen_cards param = <random_card> value = <card>
			return true card = <card>
		endif
	endif
	return \{FALSE}
endscript

script freestyle_save_song_time 
	GetSongTimeMs
	Change freestyle_actual_end_of_song_time = <time>
endscript

script freestyle_choose_solo_sections 
	section = 0
	if ($freestyle_song_section_count > 0)
		begin
		if freestyle_does_section_have_solos section = <section>
			solo_data = {}
			i = 0
			ai_solo_count = 0
			human_solo_count = 0
			begin
			instrument = ($freestyle_instrument_types [<i>])
			if freestyle_does_instrument_have_solo section = <section> instrument = <instrument>
				if freestyle_is_instrument_ai instrument = <instrument>
					if (<solo_type> = solo)
						<ai_solo_count> = (<ai_solo_count> + 1)
					endif
				else
					setstructureparam struct_name = solo_data param = <instrument> value = <solo_type>
					<human_solo_count> = (<human_solo_count> + 1)
				endif
			endif
			<i> = (<i> + 1)
			repeat $freestyle_instrument_type_count
			if ((<ai_solo_count> > 0) && (<human_solo_count> = 0))
				<i> = 0
				begin
				instrument = ($freestyle_instrument_types [<i>])
				if NOT freestyle_is_instrument_ai instrument = <instrument>
					GetRandomValue \{Name = throw
						a = 0.0
						b = 1.0}
					chance = ($freestyle_instrument_steal_solo_chance.<instrument>)
					printf '%i is trying to get a solo in section %s' i = <instrument> s = <section>
					printstruct ($freestyle_song_sections [<section>])
					if (<throw> <= <chance>)
						setstructureparam struct_name = solo_data param = <instrument> value = solo
						printf '%i wins a solo!' i = <instrument>
					endif
				endif
				<i> = (<i> + 1)
				repeat $freestyle_instrument_type_count
			endif
			assignchecksum checksum_name = section_checksum value = (<section> + 1)
			setstructureparam struct_name = freestyle_chosen_solos param = <section_checksum> value = <solo_data>
		endif
		<section> = (<section> + 1)
		repeat $freestyle_song_section_count
	endif
endscript

script freestyle_does_section_have_solos 
	RequireParams \{[
			section
		]
		all}
	section_data = ($freestyle_song_sections [<section>])
	if StructureContains structure = <section_data> solos
		GetArraySize (<section_data>.solos)
		if (<array_Size> > 0)
			return \{true}
		endif
	endif
	if StructureContains structure = <section_data> fills
		GetArraySize (<section_data>.fills)
		if (<array_Size> > 0)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script freestyle_does_instrument_have_solo 
	RequireParams \{[
			section
			instrument
		]
		all}
	freestyle_find_player_with_instrument instrument = <instrument>
	freestyle_get_player_param Player = <player_with_instrument> param = player_type
	section_data = ($freestyle_song_sections [<section>])
	if StructureContains structure = <section_data> solos
		GetArraySize (<section_data>.solos)
		i = 0
		if (<array_Size> > 0)
			begin
			solo_instrument = (<section_data>.solos [<i>])
			if (<solo_instrument> = <instrument>)
				return \{true
					solo_type = solo}
			endif
			<i> = (<i> + 1)
			repeat <array_Size>
		endif
	endif
	if StructureContains structure = <section_data> fills
		GetArraySize (<section_data>.fills)
		i = 0
		if (<array_Size> > 0)
			begin
			solo_instrument = (<section_data>.fills [<i>])
			if (<solo_instrument> = <instrument>)
				return \{true
					solo_type = fill}
			endif
			<i> = (<i> + 1)
			repeat <array_Size>
		endif
	endif
	return \{FALSE
		solo_type = None}
endscript
