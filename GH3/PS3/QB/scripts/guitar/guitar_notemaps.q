Drums_AutoNoteMapping = [
	{
		MidiNote = 70
		Scr = Countoff_NoteMap
		Params = {
		}
	}
]
Crowd_AutoNoteMapping = [
	{
		MidiNote = 72
		Scr = GH3_Crowd_Event_Listener
		Params = {
			event_type = applause
			override_state = 1
		}
	}
	{
		MidiNote = 73
		Scr = GH3_Crowd_Event_Listener
		Params = {
			event_type = surge_fast
			override_state = 1
		}
	}
	{
		MidiNote = 74
		Scr = GH3_Crowd_Event_Listener
		Params = {
			event_type = surge_slow
			override_state = 1
		}
	}
	{
		MidiNote = 75
		Scr = GH3_Crowd_Event_Listener
		Params = {
			event_type = applause
		}
	}
	{
		MidiNote = 76
		Scr = GH3_Crowd_Event_Listener
		Params = {
			event_type = surge_fast
		}
	}
	{
		MidiNote = 77
		Scr = GH3_Crowd_Event_Listener
		Params = {
			event_type = surge_slow
		}
	}
	{
		MidiNote = 78
		Scr = GH3_Crowd_Event_Listener
		Params = {
			event_type = applause
			override_state = 1
		}
	}
	{
		MidiNote = 79
		Scr = GH3_Crowd_Event_Listener
		Params = {
			event_type = surge_fast
			override_state = 1
		}
	}
	{
		MidiNote = 80
		Scr = GH3_Crowd_Event_Listener
		Params = {
			event_type = surge_slow
			override_state = 1
		}
	}
]

script NoteMap_Dummy 
	Printf \{"dummy"}
endscript

script Countoff_NoteMap 
	SpawnScriptNow GH_SFX_Countoff_Logic Params = {<...>}
endscript

script notemap_startiterator 
	FormatText ChecksumName = global_notemapping '%s_AutoNoteMapping' S = <event_string>
	if NOT GlobalExists Name = <global_notemapping> Type = Array
		return
	endif
	FormatText ChecksumName = event_checksum '%s' S = <event_string>
	SetNoteMappings section = <event_checksum> mapping = $<global_notemapping>
	SpawnScriptNow notemap_iterator Params = {<...>}
endscript

script notemap_deinit 
	ClearNoteMappings \{section = All}
	KillSpawnedScript \{Name = notemap_iterator}
	KillSpawnedScript \{Name = notemap_startiterator}
endscript

script notemap_iterator 
	Printf "Notemap Iterator started with time %d" D = <time_offset>
	get_song_prefix Song = <song_name>
	FormatText ChecksumName = event_array '%s_%e_notes' S = <song_prefix> E = <event_string> AddToStringLookup
	if NOT GlobalExists Name = <event_array> Type = Array
		Printf \{"No Drums Notes for Drums Iterator?"}
		return
	endif
	array_entry = 0
	fretbar_count = 0
	GetArraySize $<event_array>
	event_array_size = <array_Size>
	GetSongTimeMS time_offset = <time_offset>
	if NOT (<event_array_size> = 0)
		begin
		if ((<Time> - <skipleadin>) < $<event_array> [<array_entry>] [0])
			break
		endif
		<array_entry> = (<array_entry> + 1)
		repeat <event_array_size>
		event_array_size = (<event_array_size> - <array_entry>)
		if NOT (<event_array_size> = 0)
			begin
			TimeMarkerReached_SetParams time_offset = <time_offset> Array = <event_array> array_entry = <array_entry> ArrayOfArrays
			begin
			if TimeMarkerReached
				GetSongTimeMS time_offset = <time_offset>
				break
			endif
			Wait \{1
				GameFrame}
			repeat
			TimeMarkerReached_ClearParams
			note = ($<event_array> [<array_entry>] [1])
			if GetNoteMapping section = <event_checksum> note = <note>
				GetArraySize ($<event_array> [<array_entry>])
				Velocity = 100
				if (<array_Size> > 3)
					Velocity = ($<event_array> [<array_entry>] [3])
				endif
				SpawnScriptNow (<note_data>.Scr) Params = {(<note_data>.Params) Length = ($<event_array> [<array_entry>] [2]) Velocity = <Velocity>}
			endif
			<array_entry> = (<array_entry> + 1)
			repeat <event_array_size>
		endif
	endif
endscript
