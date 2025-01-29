
script ui_create_jam_quickplay_event 
	SpawnScriptNow do_jam_quickplay_event params = {<...>}
endscript

script ui_destroy_jam_quickplay_event 
endscript

script do_jam_quickplay_event 
	($default_loading_screen.create)
	getsonginfo
	gettrackinfo \{track = rhythm}
	Change jam_current_bpm = <bpm>
	Change jam_current_tuning = <tuning>
	Change \{jam_current_instrument_effects = [
			0
			0
			0
			0
			0
		]}
	Change \{jam_current_active_effects = [
			0
			0
			0
			0
			0
		]}
	jam_load_effect
	jam_recording_create_jamsession_arrays
	song_prefix = 'editable'
	formatText checksumName = arraylist '%s_arraylist' s = <song_prefix> AddToStringLookup = true
	song_prefix = 'jamsession'
	formatText checksumName = arraylist2 '%s_arraylist' s = <song_prefix> AddToStringLookup = true
	jamsession_copymarkerarrays \{song = editable}
	jamsession_copyfinalscriptarrays arraylist = <arraylist> arraylist2 = <arraylist2>
	getplayerinfo \{1
		part}
	<players> = ($current_num_players)
	end_time = 0
	if (<players> = 1)
		switch (<part>)
			case guitar
			inst = 0
			case bass
			inst = 2
			case drum
			inst = 3
			case vocals
			inst = 4
		endswitch
		setup_jam_song difficulty = ($player1_status.difficulty) inst = <inst> end_time = <end_time>
	else
		setup_jam_song_qp players = <players> end_time = <end_time>
	endif
	getsonginfo
	change_jamsession_songlist_props_struct title = $jam_selected_song artist = <artist>
	start_song song_name = jamsession endtime = <end_time> difficulty = ($player1_status.difficulty) difficulty2 = ($player2_status.difficulty) difficulty3 = ($player3_status.difficulty) difficulty4 = ($player4_status.difficulty)
	ui_event_wait \{event = menu_replace
		data = {
			state = Uistate_gameplay
		}}
endscript
