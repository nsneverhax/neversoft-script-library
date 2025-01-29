drums_autonotemapping = [
	{
		midinote = 70
		scr = countoff_notemap
		params = {
		}
	}
]
crowd_autonotemapping = [
	{
		midinote = 72
		scr = gh3_crowd_event_listener
		params = {
			event_type = applause
			override_state = 1
		}
	}
	{
		midinote = 73
		scr = gh3_crowd_event_listener
		params = {
			event_type = surge_fast
			override_state = 1
		}
	}
	{
		midinote = 74
		scr = gh3_crowd_event_listener
		params = {
			event_type = surge_slow
			override_state = 1
		}
	}
	{
		midinote = 75
		scr = gh3_crowd_event_listener
		params = {
			event_type = applause
		}
	}
	{
		midinote = 76
		scr = gh3_crowd_event_listener
		params = {
			event_type = surge_fast
		}
	}
	{
		midinote = 77
		scr = gh3_crowd_event_listener
		params = {
			event_type = surge_slow
		}
	}
	{
		midinote = 78
		scr = gh3_crowd_event_listener
		params = {
			event_type = applause
			override_state = 1
		}
	}
	{
		midinote = 79
		scr = gh3_crowd_event_listener
		params = {
			event_type = surge_fast
			override_state = 1
		}
	}
	{
		midinote = 80
		scr = gh3_crowd_event_listener
		params = {
			event_type = surge_slow
			override_state = 1
		}
	}
]

script notemap_dummy 
	printf \{"dummy"}
endscript

script countoff_notemap 
	spawnscriptnow gh_sfx_countoff_logic params = {<...>}
endscript

script notemap_startiterator 
	formattext checksumname = global_notemapping '%s_AutoNoteMapping' s = <event_string>
	if NOT globalexists name = <global_notemapping> type = array
		return
	endif
	formattext checksumname = event_checksum '%s' s = <event_string>
	setnotemappings section = <event_checksum> mapping = $<global_notemapping>
	spawnscriptnow notemap_iterator params = {<...>}
endscript

script notemap_deinit 
	clearnotemappings \{section = all}
	killspawnedscript \{name = notemap_iterator}
	killspawnedscript \{name = notemap_startiterator}
endscript

script notemap_iterator 
	printf "Notemap Iterator started with time %d" d = <time_offset>
	get_song_prefix song = <song_name>
	formattext checksumname = event_array '%s_%e_notes' s = <song_prefix> e = <event_string> addtostringlookup
	if NOT globalexists name = <event_array> type = array
		printf \{"No Drums Notes for Drums Iterator?"}
		return
	endif
	array_entry = 0
	fretbar_count = 0
	getarraysize $<event_array>
	event_array_size = <array_size>
	getsongtimems time_offset = <time_offset>
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
			timemarkerreached_setparams time_offset = <time_offset> array = <event_array> array_entry = <array_entry> arrayofarrays
			begin
			if timemarkerreached
				getsongtimems time_offset = <time_offset>
				break
			endif
			wait \{1
				gameframe}
			repeat
			timemarkerreached_clearparams
			note = ($<event_array> [<array_entry>] [1])
			if getnotemapping section = <event_checksum> note = <note>
				getarraysize ($<event_array> [<array_entry>])
				velocity = 100
				if (<array_size> > 3)
					velocity = ($<event_array> [<array_entry>] [3])
				endif
				spawnscriptnow (<note_data>.scr) params = {(<note_data>.params) length = ($<event_array> [<array_entry>] [2]) velocity = <velocity>}
			endif
			<array_entry> = (<array_entry> + 1)
			repeat <event_array_size>
		endif
	endif
endscript
