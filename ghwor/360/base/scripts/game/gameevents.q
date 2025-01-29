g_gameevent_in_venue = 0
g_gameevent_in_venue_starttime = 0
g_gameevent_in_venue_time = 0
g_gameevent_calibration_starttime = 0
g_gameevent_calibration_time = 0
g_gameevent_in_song = 0
g_gameevent_lastusedmictype_array = [
]

script gameevent_getlastusedmictype 
	if GotParam \{Player}
		GetArraySize \{$g_gameevent_lastusedmictype_array}
		num_items = <array_Size>
		if (<num_items> > 0)
			index = 0
			begin
			item_player = ($g_gameevent_lastusedmictype_array [<index>].Player)
			if (<item_player> = <Player>)
				return true specific_mic_type = ($g_gameevent_lastusedmictype_array [<index>].specific_mic_type)
			endif
			index = (<index> + 1)
			repeat <num_items>
		endif
	endif
	getnullchecksum
	return FALSE specific_mic_type = <nullchecksum>
endscript

script gameevent_calibratebegin 
	GetTrueStartTime
	Change g_gameevent_calibration_starttime = <starttime>
	dgsrecorddata_calibratebegin
endscript

script gameevent_calibrateend 
	if ($g_gameevent_calibration_starttime != 0)
		GetTrueStartTime
		time = (<starttime> - $g_gameevent_calibration_starttime)
		Change \{g_gameevent_calibration_starttime = 0}
	else
		time = 0
	endif
	Change g_gameevent_calibration_time = <time>
	dgsrecorddata_calibrateend
endscript

script gameevent_venueenter 
	if ($game_mode != freeplay)
		if ($g_gameevent_in_venue = 0)
			dgsrecorddata_venueenter
			GetTrueStartTime
			Change g_gameevent_in_venue_starttime = <starttime>
			Change \{g_gameevent_in_venue = 1}
		endif
	endif
endscript

script gameevent_venueexit 
	if ($game_mode != freeplay)
		if ($g_gameevent_in_venue = 1)
			GetTrueStartTime
			time = (<starttime> - $g_gameevent_in_venue_starttime)
			Change g_gameevent_in_venue_time = <time>
			dgsrecorddata_venueexit
			Change \{g_gameevent_in_venue = 0}
		endif
	endif
endscript

script gameevent_songbegin 
	getnumplayersingame \{out = X}
	temparray = []
	if (<X> > 0)
		getfirstplayer
		begin
		getplayerinfo <Player> part
		if (<part> = vocals)
			if vocals_getmictype Player = <Player>
				item = {Player = <Player> specific_mic_type = <specific_mic_type>}
				AddArrayElement array = <temparray> element = <item>
				<temparray> = <array>
			endif
		endif
		if playerinfoequals <Player> is_local_client = 1
			setplayerinfo <Player> recent_award_points = 0
		endif
		getnextplayer Player = <Player>
		repeat <X>
	endif
	Change g_gameevent_lastusedmictype_array = <temparray>
	gman_sendcallbacktoallgoals \{suffix = 'song_init'}
	webpresence_setup_play_records
	dynamicadmanagercommand \{func = flushalldebugimpressioncounters}
	if ($game_mode != freeplay)
		dgsrecorddata_trace \{Name = 'GameEvent_SongBegin'}
		dgsrecorddata_songbegin
	endif
	Change \{g_gameevent_in_song = 1}
endscript

script gameevent_songwon 
	webpresence_update_play_records
	if ($game_mode != freeplay)
		dgsrecorddata_songwon
	endif
	Change \{g_gameevent_in_song = 0}
endscript

script gameevent_songfailed 
	if ($game_mode != freeplay)
		dgsrecorddata_songfailed
	endif
	Change \{g_gameevent_in_song = 0}
endscript

script gameevent_songretry 
	if ($game_mode != freeplay)
		dgsrecorddata_songretry
	endif
	Change \{g_gameevent_in_song = 1}
endscript

script gameevent_songaborted 
	if ($game_mode != freeplay)
		dgsrecorddata_songaborted
	endif
	Change \{g_gameevent_in_song = 0}
endscript

script gameevent_gigbegin 
endscript

script gameevent_gigwon 
endscript

script gameevent_gigfailed 
endscript

script gameevent_gigretry 
endscript

script gameevent_gigaborted 
endscript
