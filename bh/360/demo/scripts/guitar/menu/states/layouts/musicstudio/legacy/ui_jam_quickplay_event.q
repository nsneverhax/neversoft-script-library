
script ui_create_jam_quickplay_event 
	spawnscriptnow do_jam_quickplay_event params = {<...>}
endscript

script ui_destroy_jam_quickplay_event 
endscript

script do_jam_quickplay_event 
	($default_loading_screen.create)
	getsonginfo
	change jam_current_bpm = <bpm>
	change jam_current_tuning = <tuning>
	change \{jam_current_instrument_effects = [
			0
			0
			0
			0
			0
		]}
	change \{jam_current_active_effects = [
			0
			0
			0
			0
			0
		]}
	jam_load_effect
	jam_recording_create_jamsession_arrays
	song_prefix = 'editable'
	formattext checksumname = arraylist '%s_arraylist' s = <song_prefix> addtostringlookup = true
	song_prefix = 'jamsession'
	formattext checksumname = arraylist2 '%s_arraylist' s = <song_prefix> addtostringlookup = true
	jamsession_copymarkerarrays \{song = editable}
	jamsession_copyfinalscriptarrays arraylist = <arraylist> arraylist2 = <arraylist2>
	getplayerinfo \{1
		part}
	getnumplayersingame
	<players> = <num_players>
	end_time = 0
	getplayerinfo \{1
		difficulty}
	getplayerinfo \{2
		difficulty
		out = difficulty2}
	getplayerinfo \{3
		difficulty
		out = difficulty3}
	getplayerinfo \{4
		difficulty
		out = difficulty4}
	musicstudio_setup_custom_song
	getsonginfo
	change_jamsession_songlist_props_struct title = ($jam_selected_song_name) artist = <artist>
	unhide_band
	start_song {
		song_name = jamsession
		endtime = <end_time>
		difficulty = <difficulty>
		difficulty2 = <difficulty2>
		difficulty3 = <difficulty3>
		difficulty4 = <difficulty4>
	}
	if ($notetracker_quickplay_active = 0)
		event = menu_replace
		if ui_event_exists_in_stack \{name = 'gameplay'}
			printf \{channel = bkutcher
				qs(0xcd6ba95e)}
			event = menu_back
		endif
		ui_event_wait event = <event> data = {state = uistate_gameplay}
	endif
	change \{songtime_paused = 0}
endscript
