g_dgs_checksumsneeded = [
	sessionid1
	sessionid2
	localbandnumber
	localbandnumplayers
	leftyflip
	time
	usingheadset
	lobbystate
	buildversion
	dgsversion1
	dgsversion2
	isserver
	IsHost
	isserverplayer
	songstatus
]

script dgsrecorddata_trace 
	if GotParam \{name}
		DGSRecordData event = 'Trace' name = <name>
	else
		DGSRecordData \{event = 'Trace'}
	endif
endscript

script dgsrecorddata_dumpplayerinfo 
	temparray = []
	player = 1
	begin
	GetPlayerInfo <player> in_game
	GetPlayerInfo <player> is_local_client
	GetPlayerInfo <player> net_id_first
	GetPlayerInfo <player> net_id_second
	GetPlayerInfo <player> controller
	GetPlayerInfo <player> part
	GetPlayerInfo <player> lefty_flip
	GetPlayerInfo <player> double_kick_drum
	GetPlayerInfo <player> difficulty
	GetPlayerInfo <player> character_id
	GetPlayerInfo <player> character_savegame
	GetPlayerInfo <player> vocals_highway_view
	GameEvent_GetLastUsedMicType player = <player>
	if CharacterProfileGetStruct name = <character_id> savegame = <character_savegame> dont_assert
		if StructureContains structure = <profile_struct> appearance
			if get_is_female_from_appearance appearance = (<profile_struct>.appearance) dont_assert
			endif
		endif
	endif
	FormatText checksumname = gamertag_global 'gamertag_%d' d = (<player> - 1)
	item = {player = <player> in_game = <in_game> is_local_client = <is_local_client> GamerTag = <gamertag_global> net_id_first = <net_id_first> net_id_second = <net_id_second> controller = <controller> part = <part> lefty_flip = <lefty_flip> double_kick_drum = <double_kick_drum> difficulty = <difficulty> character_id = <character_id> character_savegame = <character_savegame> vocals_highway_view = <vocals_highway_view> specific_mic_type = <specific_mic_type> is_female = <is_female>}
	AddArrayElement array = <temparray> element = <item>
	<temparray> = <array>
	player = (<player> + 1)
	repeat 8
	printf \{qs(0x610b1fe4)}
	printstruct <...>
	printf \{qs(0x127bd057)}
endscript

script dgsrecorddata_calibratebegin 
endscript

script dgsrecorddata_calibrateend 
	DGSRecordData event = 'Calibrate' conditions = [net_dgs_calibrate] debugmsg = 'Calibrate' audio_offset = <audio_offset> video_offset = <video_offset> time = ($g_gameevent_calibration_time)
endscript

script dgsrecorddata_venueenter 
	GetNumPlayersInGame \{local
		out = x}
	if (<x> > 0)
		GetFirstPlayer \{local}
		begin
		if StructureContains \{structure = $LevelZones
				$current_level}
			tempvenuename = (($LevelZones.$current_level).name)
		else
			tempvaluename = ''
		endif
		DGSRecordData event = 'VenueEnter' conditions = [net_dgs_venueenter] player = <player> debugmsg = 'VenueEnter' venue = <tempvenuename>
		GetNextPlayer player = <player> local
		repeat <x>
	endif
endscript

script dgsrecorddata_venueexit 
	GetNumPlayersInGame \{local
		out = x}
	if (<x> > 0)
		GetFirstPlayer \{local}
		begin
		if StructureContains \{structure = $LevelZones
				$current_level}
			tempvenuename = (($LevelZones.$current_level).name)
		else
			tempvaluename = ''
		endif
		DGSRecordData event = 'VenueExit' conditions = [net_dgs_venueexit] player = <player> debugmsg = 'VenueExit' venue = <tempvenuename> time = ($g_gameevent_in_venue_time)
		GetNextPlayer player = <player> local
		repeat <x>
	endif
endscript

script dgsrecorddata_songbegin 
	GetNumPlayersInGame \{local
		out = x}
	if (<x> > 0)
		GetFirstPlayer \{local}
		begin
		GMan_SongTool_GetCurrentSong
		GetNumPlayersInGame
		GameMode_GetType
		if StructureContains \{structure = $LevelZones
				$current_level}
			tempvenuename = (($LevelZones.$current_level).name)
		else
			tempvaluename = ''
		endif
		GetPlayerInfo <player> vocals_highway_view
		GameEvent_GetLastUsedMicType player = <player>
		GetPlayerInfo <player> character_id
		GetPlayerInfo <player> character_savegame
		if CharacterProfileGetStruct name = <character_id> savegame = <character_savegame> dont_assert
			if StructureContains structure = <profile_struct> appearance
				if get_is_female_from_appearance appearance = (<profile_struct>.appearance) dont_assert
				endif
			endif
		endif
		DGSRecordData event = 'SongBegin' conditions = [net_dgs_songbegin] player = <player> debugmsg = 'SongBegin' song = <current_song> numplayers = <num_players> gametype = <type> lobbynetstate = ($g_lobby_net_state) rules = ($competitive_rules) gamemode = ($game_mode) venue = <tempvenuename> vocals_highway_view = <vocals_highway_view> specific_mic_type = <specific_mic_type> is_female = <is_female>
		GetNextPlayer player = <player> local
		repeat <x>
	endif
endscript

script dgsrecorddata_songwon 
	GetNumPlayersInGame \{local
		out = x}
	if (<x> > 0)
		GetFirstPlayer \{local}
		begin
		GMan_SongTool_GetCurrentSong
		GetNumPlayersInGame
		GetSongTimeMs
		GameMode_GetType
		if StructureContains \{structure = $LevelZones
				$current_level}
			tempvenuename = (($LevelZones.$current_level).name)
		else
			tempvaluename = ''
		endif
		GetPlayerInfo <player> notes_hit
		GetPlayerInfo <player> total_notes
		GetPlayerInfo <player> max_notes
		GetPlayerInfo <player> best_run
		GetPlayerInfo <player> score
		GetPlayerInfo <player> STARS
		GetPlayerInfo <player> vocals_highway_view
		GameEvent_GetLastUsedMicType player = <player>
		GetPlayerInfo <player> character_id
		GetPlayerInfo <player> character_savegame
		if CharacterProfileGetStruct name = <character_id> savegame = <character_savegame> dont_assert
			if StructureContains structure = <profile_struct> appearance
				if get_is_female_from_appearance appearance = (<profile_struct>.appearance) dont_assert
				endif
			endif
		endif
		<challenge_name> = ''
		<challenge_grade> = 0
		<challenge_progress> = 0
		if (<type> = career)
			challenge_get_goal_id
			if GotParam \{goal_id}
				if (<goal_id> != None)
					ExtendCrc <goal_id> '_info' out = challenge_info
					<challenge_name> = ($<challenge_info>.name)
					GetArraySize ($<goal_id>.required_band)
					if (<array_size> > 1)
						GMan_GetData goal = <goal_id> player = 1 name = meter_high
					else
						GMan_GetData goal = <goal_id> player = <player> name = meter_high
					endif
					<challenge_progress> = (<meter_high>)
					GMan_GetGrade goal = <goal_id>
					<challenge_grade> = (<pending_grade>)
				endif
			endif
		endif
		DGSRecordData event = 'SongPlayed' conditions = [net_dgs_songwon] player = <player> debugmsg = 'SongWon' song = <current_song> songstatus = 1 numplayers = <num_players> length = <time> gametype = <type> lobbynetstate = ($g_lobby_net_state) rules = ($competitive_rules) gamemode = ($game_mode) venue = <tempvenuename> notes_hit = <notes_hit> total_notes = <total_notes> max_notes = <max_notes> best_run = <best_run> score = <score> STARS = <STARS> vocals_highway_view = <vocals_highway_view> specific_mic_type = <specific_mic_type> is_female = <is_female> challenge_name = <challenge_name> challenge_progress = <challenge_progress> challenge_grade = <challenge_grade>
		GetNextPlayer player = <player> local
		repeat <x>
	endif
endscript

script dgsrecorddata_songfailed 
	GetNumPlayersInGame \{local
		out = x}
	if (<x> > 0)
		GetFirstPlayer \{local}
		begin
		GMan_SongTool_GetCurrentSong
		GetNumPlayersInGame
		GetSongTimeMs
		GameMode_GetType
		if StructureContains \{structure = $LevelZones
				$current_level}
			tempvenuename = (($LevelZones.$current_level).name)
		else
			tempvaluename = ''
		endif
		GetPlayerInfo <player> notes_hit
		GetPlayerInfo <player> total_notes
		GetPlayerInfo <player> max_notes
		GetPlayerInfo <player> best_run
		GetPlayerInfo <player> score
		GetPlayerInfo <player> STARS
		GetPlayerInfo <player> vocals_highway_view
		GameEvent_GetLastUsedMicType player = <player>
		GetPlayerInfo <player> character_id
		GetPlayerInfo <player> character_savegame
		if CharacterProfileGetStruct name = <character_id> savegame = <character_savegame> dont_assert
			if StructureContains structure = <profile_struct> appearance
				if get_is_female_from_appearance appearance = (<profile_struct>.appearance) dont_assert
				endif
			endif
		endif
		DGSRecordData event = 'SongPlayed' conditions = [net_dgs_songfailed] player = <player> debugmsg = 'SongFailed' song = <current_song> songstatus = 0 numplayers = <num_players> length = <time> gametype = <type> lobbynetstate = ($g_lobby_net_state) rules = ($competitive_rules) gamemode = ($game_mode) venue = <tempvenuename> notes_hit = <notes_hit> total_notes = <total_notes> max_notes = <max_notes> best_run = <best_run> score = <score> STARS = <STARS> vocals_highway_view = <vocals_highway_view> specific_mic_type = <specific_mic_type> is_female = <is_female>
		GetNextPlayer player = <player> local
		repeat <x>
	endif
endscript

script dgsrecorddata_songretry 
	GetNumPlayersInGame \{local
		out = x}
	if (<x> > 0)
		GetFirstPlayer \{local}
		begin
		GMan_SongTool_GetCurrentSong
		GetNumPlayersInGame
		GetSongTimeMs
		GameMode_GetType
		if StructureContains \{structure = $LevelZones
				$current_level}
			tempvenuename = (($LevelZones.$current_level).name)
		else
			tempvaluename = ''
		endif
		GetPlayerInfo <player> notes_hit
		GetPlayerInfo <player> total_notes
		GetPlayerInfo <player> max_notes
		GetPlayerInfo <player> best_run
		GetPlayerInfo <player> score
		GetPlayerInfo <player> STARS
		GetPlayerInfo <player> vocals_highway_view
		GameEvent_GetLastUsedMicType player = <player>
		GetPlayerInfo <player> character_id
		GetPlayerInfo <player> character_savegame
		if CharacterProfileGetStruct name = <character_id> savegame = <character_savegame> dont_assert
			if StructureContains structure = <profile_struct> appearance
				if get_is_female_from_appearance appearance = (<profile_struct>.appearance) dont_assert
				endif
			endif
		endif
		DGSRecordData event = 'SongPlayed' conditions = [net_dgs_songretry] player = <player> debugmsg = 'SongRetry' song = <current_song> songstatus = 2 numplayers = <num_players> length = <time> gametype = <type> lobbynetstate = ($g_lobby_net_state) rules = ($competitive_rules) gamemode = ($game_mode) venue = <tempvenuename> notes_hit = <notes_hit> total_notes = <total_notes> max_notes = <max_notes> best_run = <best_run> score = <score> STARS = <STARS> vocals_highway_view = <vocals_highway_view> specific_mic_type = <specific_mic_type> is_female = <is_female>
		GetNextPlayer player = <player> local
		repeat <x>
	endif
endscript

script dgsrecorddata_songaborted 
	GetNumPlayersInGame \{local
		out = x}
	if (<x> > 0)
		GetFirstPlayer \{local}
		begin
		GMan_SongTool_GetCurrentSong
		GetNumPlayersInGame
		GetSongTimeMs
		GameMode_GetType
		if StructureContains \{structure = $LevelZones
				$current_level}
			tempvenuename = (($LevelZones.$current_level).name)
		else
			tempvaluename = ''
		endif
		GetPlayerInfo <player> notes_hit
		GetPlayerInfo <player> total_notes
		GetPlayerInfo <player> max_notes
		GetPlayerInfo <player> best_run
		GetPlayerInfo <player> score
		GetPlayerInfo <player> STARS
		GetPlayerInfo <player> vocals_highway_view
		GameEvent_GetLastUsedMicType player = <player>
		GetPlayerInfo <player> character_id
		GetPlayerInfo <player> character_savegame
		if CharacterProfileGetStruct name = <character_id> savegame = <character_savegame> dont_assert
			if StructureContains structure = <profile_struct> appearance
				if get_is_female_from_appearance appearance = (<profile_struct>.appearance) dont_assert
				endif
			endif
		endif
		DGSRecordData event = 'SongPlayed' conditions = [net_dgs_songaborted] player = <player> debugmsg = 'SongAborted' song = <current_song> songstatus = 3 numplayers = <num_players> length = <time> gametype = <type> lobbynetstate = ($g_lobby_net_state) rules = ($competitive_rules) gamemode = ($game_mode) venue = <tempvenuename> notes_hit = <notes_hit> total_notes = <total_notes> max_notes = <max_notes> best_run = <best_run> score = <score> STARS = <STARS> vocals_highway_view = <vocals_highway_view> specific_mic_type = <specific_mic_type> is_female = <is_female>
		GetNextPlayer player = <player> local
		repeat <x>
	endif
endscript
