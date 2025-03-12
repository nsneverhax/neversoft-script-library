g_gameevent_in_venue = 0
g_gameevent_in_venue_starttime = 0
g_gameevent_in_venue_time = 0
g_gameevent_calibration_starttime = 0
g_gameevent_calibration_time = 0
g_gameevent_in_song = 0
g_gameevent_lastusedmictype_array = [
]

script gameevent_getlastusedmictype 
	if gotparam \{player}
		getarraysize \{$g_gameevent_lastusedmictype_array}
		num_items = <array_size>
		if (<num_items> > 0)
			index = 0
			begin
			item_player = ($g_gameevent_lastusedmictype_array [<index>].player)
			if (<item_player> = <player>)
				return true specific_mic_type = ($g_gameevent_lastusedmictype_array [<index>].specific_mic_type)
			endif
			index = (<index> + 1)
			repeat <num_items>
		endif
	endif
	getnullchecksum
	return false specific_mic_type = <nullchecksum>
endscript

script gameevent_calibratebegin 
	gettruestarttime
	change g_gameevent_calibration_starttime = <starttime>
	dgsrecorddata_calibratebegin
endscript

script gameevent_calibrateend 
	if ($g_gameevent_calibration_starttime != 0)
		gettruestarttime
		time = (<starttime> - $g_gameevent_calibration_starttime)
		change \{g_gameevent_calibration_starttime = 0}
	else
		time = 0
	endif
	change g_gameevent_calibration_time = <time>
	dgsrecorddata_calibrateend
endscript

script gameevent_venueenter 
	if ($game_mode != freeplay)
		if ($g_gameevent_in_venue = 0)
			dgsrecorddata_venueenter
			gettruestarttime
			change g_gameevent_in_venue_starttime = <starttime>
			change \{g_gameevent_in_venue = 1}
		endif
	endif
endscript

script gameevent_venueexit 
	if ($game_mode != freeplay)
		if ($g_gameevent_in_venue = 1)
			gettruestarttime
			time = (<starttime> - $g_gameevent_in_venue_starttime)
			change g_gameevent_in_venue_time = <time>
			dgsrecorddata_venueexit
			change \{g_gameevent_in_venue = 0}
		endif
	endif
endscript

script gameevent_songbegin 
	getnumplayersingame \{out = x}
	temparray = []
	if (<x> > 0)
		getfirstplayer
		begin
		getplayerinfo <player> part
		if (<part> = vocals)
			if vocals_getmictype player = <player>
				item = {player = <player> specific_mic_type = <specific_mic_type>}
				addarrayelement array = <temparray> element = <item>
				<temparray> = <array>
			endif
		endif
		getnextplayer player = <player>
		repeat <x>
	endif
	change g_gameevent_lastusedmictype_array = <temparray>
	dynamicadmanager_flushalldebugimpressioncounters
	if ($game_mode != freeplay)
		dgsrecorddata_trace \{name = 'GameEvent_SongBegin'}
		dgsrecorddata_songbegin
	endif
	change \{g_gameevent_in_song = 1}
endscript

script gameevent_songwon 
	if ($game_mode != freeplay)
		dgsrecorddata_songwon
	endif
	change \{g_gameevent_in_song = 0}
endscript

script gameevent_songfailed 
	if ($game_mode != freeplay)
		dgsrecorddata_songfailed
	endif
	change \{g_gameevent_in_song = 0}
endscript

script gameevent_songretry 
	if ($game_mode != freeplay)
		dgsrecorddata_songretry
	endif
	change \{g_gameevent_in_song = 1}
endscript

script gameevent_songaborted 
	if ($game_mode != freeplay)
		dgsrecorddata_songaborted
	endif
	change \{g_gameevent_in_song = 0}
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
