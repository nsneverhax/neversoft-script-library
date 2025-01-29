g_gameevent_in_venue = 0
g_gameevent_in_venue_starttime = 0
g_gameevent_in_venue_time = 0
g_gameevent_calibration_starttime = 0
g_gameevent_calibration_time = 0
g_gameevent_in_song = 0
g_gameevent_lastusedmictype_array = [
]

script GameEvent_GetLastUsedMicType 
	if GotParam \{player}
		GetArraySize \{$g_gameevent_lastusedmictype_array}
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
	GetNullChecksum
	return false specific_mic_type = <nullchecksum>
endscript

script GameEvent_CalibrateBegin 
	GetTrueStartTime
	Change g_gameevent_calibration_starttime = <starttime>
	dgsrecorddata_calibratebegin
endscript

script GameEvent_CalibrateEnd 
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

script GameEvent_VenueEnter 
	if ($game_mode != freeplay)
		if ($g_gameevent_in_venue = 0)
			dgsrecorddata_venueenter
			GetTrueStartTime
			Change g_gameevent_in_venue_starttime = <starttime>
			Change \{g_gameevent_in_venue = 1}
		endif
	endif
endscript

script GameEvent_VenueExit 
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

script GameEvent_SongBegin 
	GetNumPlayersInGame \{out = x}
	temparray = []
	if (<x> > 0)
		GetFirstPlayer
		begin
		GetPlayerInfo <player> part
		if (<part> = vocals)
			if Vocals_GetMicType player = <player>
				item = {player = <player> specific_mic_type = <specific_mic_type>}
				AddArrayElement array = <temparray> element = <item>
				<temparray> = <array>
			endif
		endif
		GetNextPlayer player = <player>
		repeat <x>
	endif
	Change g_gameevent_lastusedmictype_array = <temparray>
	DynamicAdManager_FlushAllDebugImpressionCounters
	if ($game_mode != freeplay)
		dgsrecorddata_trace \{name = 'GameEvent_SongBegin'}
		dgsrecorddata_songbegin
	endif
	Change \{g_gameevent_in_song = 1}
endscript

script GameEvent_SongWon 
	if ($game_mode != freeplay)
		dgsrecorddata_songwon
	endif
	Change \{g_gameevent_in_song = 0}
endscript

script GameEvent_SongFailed 
	if ($game_mode != freeplay)
		dgsrecorddata_songfailed
	endif
	Change \{g_gameevent_in_song = 0}
endscript

script GameEvent_SongRetry 
	if ($game_mode != freeplay)
		dgsrecorddata_songretry
	endif
	Change \{g_gameevent_in_song = 1}
endscript

script GameEvent_SongAborted 
	if ($game_mode != freeplay)
		dgsrecorddata_songaborted
	endif
	Change \{g_gameevent_in_song = 0}
endscript

script GameEvent_GigBegin 
endscript

script GameEvent_GigWon 
endscript

script GameEvent_GigFailed 
endscript

script GameEvent_GigRetry 
endscript

script GameEvent_GigAborted 
endscript
