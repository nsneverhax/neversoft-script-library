Drums_AutoNoteMapping = [
	{
		MidiNote = 70
		Scr = Countoff_NoteMap
		params = {
		}
	}
]
Crowd_AutoNoteMapping = [
	{
		MidiNote = 72
		Scr = GH3_Crowd_Event_Listener
		params = {
			event_type = applause
			override_state = 1
		}
	}
	{
		MidiNote = 73
		Scr = GH3_Crowd_Event_Listener
		params = {
			event_type = surge_fast
			override_state = 1
		}
	}
	{
		MidiNote = 74
		Scr = GH3_Crowd_Event_Listener
		params = {
			event_type = surge_slow
			override_state = 1
		}
	}
	{
		MidiNote = 75
		Scr = GH3_Crowd_Event_Listener
		params = {
			event_type = applause
		}
	}
	{
		MidiNote = 76
		Scr = GH3_Crowd_Event_Listener
		params = {
			event_type = surge_fast
		}
	}
	{
		MidiNote = 77
		Scr = GH3_Crowd_Event_Listener
		params = {
			event_type = surge_slow
		}
	}
	{
		MidiNote = 78
		Scr = GH3_Crowd_Event_Listener
		params = {
			event_type = applause
			override_state = 1
		}
	}
	{
		MidiNote = 79
		Scr = GH3_Crowd_Event_Listener
		params = {
			event_type = surge_fast
			override_state = 1
		}
	}
	{
		MidiNote = 80
		Scr = GH3_Crowd_Event_Listener
		params = {
			event_type = surge_slow
			override_state = 1
		}
	}
]

script NoteMap_Dummy 
	printf \{"dummy"}
endscript

script Countoff_NoteMap 
	SpawnScriptNow GH_SFX_Countoff_Logic params = {<...>}
endscript

script notemap_startiterator 
	formatText checksumName = global_notemapping '%s_AutoNoteMapping' s = <event_string>
	if NOT GlobalExists Name = <global_notemapping> Type = array
		return
	endif
	formatText checksumName = event_checksum '%s' s = <event_string>
	SetNoteMappings section = <event_checksum> mapping = $<global_notemapping>
	SpawnScriptNow notemap_iterator params = {<...>}
endscript

script notemap_deinit 
	ClearNoteMappings \{section = all}
	KillSpawnedScript \{Name = notemap_iterator}
endscript

script notemap_iterator 
	printf "Notemap Iterator started with time %d" d = <time_offset>
	get_song_prefix song = <song_name>
	formatText checksumName = event_array '%s_%e_notes' s = <song_prefix> e = <event_string> AddToStringLookup
	if NOT GlobalExists Name = <event_array> Type = array
		printf \{"No Drums Notes for Drums Iterator?"}
		return
	endif
	array_entry = 0
	fretbar_count = 0
	GetArraySize $<event_array>
	event_array_size = <array_Size>
	GetSongTimeMs time_offset = <time_offset>
	if NOT (<event_array_size> = 0)
		begin
		if ((<time> - <skipleadin>) < $<event_array> [<array_entry>] [0])
			break
		endif
		<array_entry> = (<array_entry> + 1)
		repeat <event_array_size>
		event_array_size = (<event_array_size> - <array_entry>)
		if NOT (<event_array_size> = 0)
			begin
			TimeMarkerReached_SetParams time_offset = <time_offset> array = <event_array> array_entry = <array_entry> ArrayOfArrays
			begin
			if TimeMarkerReached
				GetSongTimeMs time_offset = <time_offset>
				break
			endif
			Wait \{1
				gameframe}
			repeat
			TimeMarkerReached_ClearParams
			note = ($<event_array> [<array_entry>] [1])
			if GetNoteMapping section = <event_checksum> note = <note>
				GetArraySize ($<event_array> [<array_entry>])
				velocity = 100
				if (<array_Size> > 3)
					velocity = ($<event_array> [<array_entry>] [3])
				endif
				SpawnScriptNow (<note_data>.Scr) params = {(<note_data>.params) length = ($<event_array> [<array_entry>] [2]) velocity = <velocity>}
			endif
			<array_entry> = (<array_entry> + 1)
			repeat <event_array_size>
		endif
	endif
endscript
