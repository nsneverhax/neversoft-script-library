freestyle_event_queue = {
}
freestyle_event_count = 0
freestyle_event_current_index = 0
freestyle_event_beat_offset = 0.0

script freestyle_init_event_system 
	freestyle_clear_event_system
endscript

script freestyle_start_event_system 
	vector_get_size \{vector_name = freestyle_event_queue}
	Change freestyle_event_count = <vector_size>
endscript

script freestyle_deinit_event_system 
	freestyle_clear_event_system
endscript

script freestyle_clear_event_system 
	vector_clear \{vector_name = freestyle_event_queue}
	Change \{freestyle_event_current_index = 0}
	Change \{freestyle_event_beat_offset = 0.0}
endscript

script freestyle_loop_event_system 
	Change \{freestyle_event_current_index = 0}
	Change freestyle_event_beat_offset = ($freestyle_event_beat_offset + $freestyle_total_song_beats)
endscript

script freestyle_update_event_system 
	if NOT ismetronomeenabled
		return
	endif
	if metronomebeatthisframe
		begin
		if ($freestyle_event_current_index >= $freestyle_event_count)
			break
		endif
		vector_get_element \{vector_name = freestyle_event_queue
			index = $freestyle_event_current_index}
		current_event_data = <element>
		beats_left = ((<current_event_data>.trigger_beat) + $freestyle_event_beat_offset - $freestyle_last_nowbar_beat_number)
		if (<beats_left> < 1)
			Change freestyle_event_current_index = ($freestyle_event_current_index + 1)
			freestyle_trigger_event event_data = <current_event_data> offset_beats = <beats_left>
		else
			break
		endif
		repeat
	endif
endscript

script freestyle_trigger_event 
	RequireParams \{[
			event_data
			offset_beats
		]
		all}
	switch (<event_data>.Type)
		case spawn_solo_section
		freestyle_spawn_solo_section_now {
			Player = (<event_data>.Player)
			length_in_beats = (<event_data>.length_in_beats)
			offset_beats = <offset_beats>
		}
		case advance_section
		freestyle_advance_section
		case end_of_song
		freestyle_end_of_song_reached
		case one_measure_before_solo_end
		freestyle_handle_one_measure_before_solo_end
		case one_beat_before_solo_end
		freestyle_handle_one_beat_before_solo_end
		case final_beat
		freestyle_final_beat_reached
		default
		ScriptAssert 'unknown event type %a' a = (<event_data>.Type)
	endswitch
endscript

script freestyle_add_solo_section_event 
	RequireParams \{[
			Player
			trigger_beat
			length_in_beats
		]
		all}
	event_data = {
		Type = spawn_solo_section
		trigger_beat = (<trigger_beat> - $freestyle_card_spawn_offset_beats)
		Player = <Player>
		length_in_beats = <length_in_beats>
	}
	vector_push_back vector_name = freestyle_event_queue element = <event_data>
	event_data = {
		Type = one_measure_before_solo_end
		trigger_beat = (<trigger_beat> + <length_in_beats> - $freestyle_beats_per_measure)
	}
	vector_push_back vector_name = freestyle_event_queue element = <event_data>
	event_data = {
		Type = one_beat_before_solo_end
		trigger_beat = (<trigger_beat> + <length_in_beats> - 1)
	}
	vector_push_back vector_name = freestyle_event_queue element = <event_data>
endscript

script freestyle_add_advance_section_event 
	RequireParams \{[
			trigger_beat
		]
		all}
	event_data = {
		Type = advance_section
		trigger_beat = <trigger_beat>
	}
	vector_push_back vector_name = freestyle_event_queue element = <event_data>
endscript

script freestyle_add_end_of_song_event 
	RequireParams \{[
			trigger_beat
		]
		all}
	event_data = {
		Type = end_of_song
		trigger_beat = <trigger_beat>
	}
	vector_push_back vector_name = freestyle_event_queue element = <event_data>
endscript

script freestyle_add_final_beat_event 
	RequireParams \{[
			trigger_beat
		]
		all}
	event_data = {
		Type = final_beat
		trigger_beat = <trigger_beat>
	}
	vector_push_back vector_name = freestyle_event_queue element = <event_data>
endscript

script freestyle_sort_events 
	vector_sort \{vector_name = freestyle_event_queue
		compare_func = freestyle_event_compare}
endscript

script freestyle_event_compare 
	RequireParams \{[
			a
			b
		]
		all}
	if ((<a>.trigger_beat) > (<b>.trigger_beat))
		return \{true}
	else
		return \{FALSE}
	endif
endscript
