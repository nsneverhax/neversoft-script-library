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
	ishost
	isserverplayer
	songstatus
]

script dgsrecorddata_trace 
	if gotparam \{name}
		dgsrecorddata event = 'Trace' name = <name>
	else
		dgsrecorddata \{event = 'Trace'}
	endif
endscript

script dgsrecorddata_dumpplayerinfo 
	temparray = []
	player = 1
	begin
	getplayerinfo <player> in_game
	getplayerinfo <player> is_local_client
	getplayerinfo <player> net_id_first
	getplayerinfo <player> net_id_second
	getplayerinfo <player> controller
	getplayerinfo <player> part
	getplayerinfo <player> lefty_flip
	getplayerinfo <player> double_kick_drum
	getplayerinfo <player> difficulty
	getplayerinfo <player> character_id
	getplayerinfo <player> character_savegame
	getplayerinfo <player> vocals_highway_view
	gameevent_getlastusedmictype player = <player>
	if characterprofilegetstruct name = <character_id> savegame = <character_savegame> dont_assert
		if structurecontains structure = <profile_struct> appearance
			if get_is_female_from_appearance appearance = (<profile_struct>.appearance) dont_assert
			endif
		endif
	endif
	formattext checksumname = gamertag_global 'gamertag_%d' d = (<player> - 1)
	item = {player = <player> in_game = <in_game> is_local_client = <is_local_client> gamertag = <gamertag_global> net_id_first = <net_id_first> net_id_second = <net_id_second> controller = <controller> part = <part> lefty_flip = <lefty_flip> double_kick_drum = <double_kick_drum> difficulty = <difficulty> character_id = <character_id> character_savegame = <character_savegame> vocals_highway_view = <vocals_highway_view> specific_mic_type = <specific_mic_type> is_female = <is_female>}
	addarrayelement array = <temparray> element = <item>
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
	dgsrecorddata event = 'Calibrate' conditions = [net_dgs_calibrate] debugmsg = 'Calibrate' audio_offset = <audio_offset> video_offset = <video_offset> time = ($g_gameevent_calibration_time)
endscript

script dgsrecorddata_venueenter 
	getnumplayersingame \{local
		out = x}
	if (<x> > 0)
		getfirstplayer \{local}
		begin
		if structurecontains \{structure = $levelzones
				$current_level}
			tempvenuename = (($levelzones.$current_level).name)
		else
			tempvaluename = ''
		endif
		dgsrecorddata event = 'VenueEnter' conditions = [net_dgs_venueenter] player = <player> debugmsg = 'VenueEnter' venue = <tempvenuename>
		getnextplayer player = <player> local
		repeat <x>
	endif
endscript

script dgsrecorddata_venueexit 
	getnumplayersingame \{local
		out = x}
	if (<x> > 0)
		getfirstplayer \{local}
		begin
		if structurecontains \{structure = $levelzones
				$current_level}
			tempvenuename = (($levelzones.$current_level).name)
		else
			tempvaluename = ''
		endif
		dgsrecorddata event = 'VenueExit' conditions = [net_dgs_venueexit] player = <player> debugmsg = 'VenueExit' venue = <tempvenuename> time = ($g_gameevent_in_venue_time)
		getnextplayer player = <player> local
		repeat <x>
	endif
endscript

script dgsrecorddata_songbegin 
	getnumplayersingame \{local
		out = x}
	if (<x> > 0)
		getfirstplayer \{local}
		begin
		gman_songtool_getcurrentsong
		getnumplayersingame
		gamemode_gettype
		if structurecontains \{structure = $levelzones
				$current_level}
			tempvenuename = (($levelzones.$current_level).name)
		else
			tempvaluename = ''
		endif
		getplayerinfo <player> vocals_highway_view
		gameevent_getlastusedmictype player = <player>
		getplayerinfo <player> character_id
		getplayerinfo <player> character_savegame
		if characterprofilegetstruct name = <character_id> savegame = <character_savegame> dont_assert
			if structurecontains structure = <profile_struct> appearance
				if get_is_female_from_appearance appearance = (<profile_struct>.appearance) dont_assert
				endif
			endif
		endif
		dgsrecorddata event = 'SongBegin' conditions = [net_dgs_songbegin] player = <player> debugmsg = 'SongBegin' song = <current_song> numplayers = <num_players> gametype = <type> lobbynetstate = ($g_lobby_net_state) rules = ($competitive_rules) gamemode = ($game_mode) venue = <tempvenuename> vocals_highway_view = <vocals_highway_view> specific_mic_type = <specific_mic_type> is_female = <is_female>
		getnextplayer player = <player> local
		repeat <x>
	endif
endscript

script dgsrecorddata_songwon 
	getnumplayersingame \{local
		out = x}
	if (<x> > 0)
		getfirstplayer \{local}
		begin
		gman_songtool_getcurrentsong
		getnumplayersingame
		getsongtimems
		gamemode_gettype
		if structurecontains \{structure = $levelzones
				$current_level}
			tempvenuename = (($levelzones.$current_level).name)
		else
			tempvaluename = ''
		endif
		getplayerinfo <player> notes_hit
		getplayerinfo <player> total_notes
		getplayerinfo <player> max_notes
		getplayerinfo <player> best_run
		getplayerinfo <player> score
		getplayerinfo <player> stars
		getplayerinfo <player> vocals_highway_view
		gameevent_getlastusedmictype player = <player>
		getplayerinfo <player> character_id
		getplayerinfo <player> character_savegame
		if characterprofilegetstruct name = <character_id> savegame = <character_savegame> dont_assert
			if structurecontains structure = <profile_struct> appearance
				if get_is_female_from_appearance appearance = (<profile_struct>.appearance) dont_assert
				endif
			endif
		endif
		dgsrecorddata event = 'SongPlayed' conditions = [net_dgs_songwon] player = <player> debugmsg = 'SongWon' song = <current_song> songstatus = 1 numplayers = <num_players> length = <time> gametype = <type> lobbynetstate = ($g_lobby_net_state) rules = ($competitive_rules) gamemode = ($game_mode) venue = <tempvenuename> notes_hit = <notes_hit> total_notes = <total_notes> max_notes = <max_notes> best_run = <best_run> score = <score> stars = <stars> vocals_highway_view = <vocals_highway_view> specific_mic_type = <specific_mic_type> is_female = <is_female>
		getnextplayer player = <player> local
		repeat <x>
	endif
endscript

script dgsrecorddata_songfailed 
	getnumplayersingame \{local
		out = x}
	if (<x> > 0)
		getfirstplayer \{local}
		begin
		gman_songtool_getcurrentsong
		getnumplayersingame
		getsongtimems
		gamemode_gettype
		if structurecontains \{structure = $levelzones
				$current_level}
			tempvenuename = (($levelzones.$current_level).name)
		else
			tempvaluename = ''
		endif
		getplayerinfo <player> notes_hit
		getplayerinfo <player> total_notes
		getplayerinfo <player> max_notes
		getplayerinfo <player> best_run
		getplayerinfo <player> score
		getplayerinfo <player> stars
		getplayerinfo <player> vocals_highway_view
		gameevent_getlastusedmictype player = <player>
		getplayerinfo <player> character_id
		getplayerinfo <player> character_savegame
		if characterprofilegetstruct name = <character_id> savegame = <character_savegame> dont_assert
			if structurecontains structure = <profile_struct> appearance
				if get_is_female_from_appearance appearance = (<profile_struct>.appearance) dont_assert
				endif
			endif
		endif
		dgsrecorddata event = 'SongPlayed' conditions = [net_dgs_songfailed] player = <player> debugmsg = 'SongFailed' song = <current_song> songstatus = 0 numplayers = <num_players> length = <time> gametype = <type> lobbynetstate = ($g_lobby_net_state) rules = ($competitive_rules) gamemode = ($game_mode) venue = <tempvenuename> notes_hit = <notes_hit> total_notes = <total_notes> max_notes = <max_notes> best_run = <best_run> score = <score> stars = <stars> vocals_highway_view = <vocals_highway_view> specific_mic_type = <specific_mic_type> is_female = <is_female>
		getnextplayer player = <player> local
		repeat <x>
	endif
endscript

script dgsrecorddata_songretry 
	getnumplayersingame \{local
		out = x}
	if (<x> > 0)
		getfirstplayer \{local}
		begin
		gman_songtool_getcurrentsong
		getnumplayersingame
		getsongtimems
		gamemode_gettype
		if structurecontains \{structure = $levelzones
				$current_level}
			tempvenuename = (($levelzones.$current_level).name)
		else
			tempvaluename = ''
		endif
		getplayerinfo <player> notes_hit
		getplayerinfo <player> total_notes
		getplayerinfo <player> max_notes
		getplayerinfo <player> best_run
		getplayerinfo <player> score
		getplayerinfo <player> stars
		getplayerinfo <player> vocals_highway_view
		gameevent_getlastusedmictype player = <player>
		getplayerinfo <player> character_id
		getplayerinfo <player> character_savegame
		if characterprofilegetstruct name = <character_id> savegame = <character_savegame> dont_assert
			if structurecontains structure = <profile_struct> appearance
				if get_is_female_from_appearance appearance = (<profile_struct>.appearance) dont_assert
				endif
			endif
		endif
		dgsrecorddata event = 'SongPlayed' conditions = [net_dgs_songretry] player = <player> debugmsg = 'SongRetry' song = <current_song> songstatus = 2 numplayers = <num_players> length = <time> gametype = <type> lobbynetstate = ($g_lobby_net_state) rules = ($competitive_rules) gamemode = ($game_mode) venue = <tempvenuename> notes_hit = <notes_hit> total_notes = <total_notes> max_notes = <max_notes> best_run = <best_run> score = <score> stars = <stars> vocals_highway_view = <vocals_highway_view> specific_mic_type = <specific_mic_type> is_female = <is_female>
		getnextplayer player = <player> local
		repeat <x>
	endif
endscript

script dgsrecorddata_songaborted 
	getnumplayersingame \{local
		out = x}
	if (<x> > 0)
		getfirstplayer \{local}
		begin
		gman_songtool_getcurrentsong
		getnumplayersingame
		getsongtimems
		gamemode_gettype
		if structurecontains \{structure = $levelzones
				$current_level}
			tempvenuename = (($levelzones.$current_level).name)
		else
			tempvaluename = ''
		endif
		getplayerinfo <player> notes_hit
		getplayerinfo <player> total_notes
		getplayerinfo <player> max_notes
		getplayerinfo <player> best_run
		getplayerinfo <player> score
		getplayerinfo <player> stars
		getplayerinfo <player> vocals_highway_view
		gameevent_getlastusedmictype player = <player>
		getplayerinfo <player> character_id
		getplayerinfo <player> character_savegame
		if characterprofilegetstruct name = <character_id> savegame = <character_savegame> dont_assert
			if structurecontains structure = <profile_struct> appearance
				if get_is_female_from_appearance appearance = (<profile_struct>.appearance) dont_assert
				endif
			endif
		endif
		dgsrecorddata event = 'SongPlayed' conditions = [net_dgs_songaborted] player = <player> debugmsg = 'SongAborted' song = <current_song> songstatus = 3 numplayers = <num_players> length = <time> gametype = <type> lobbynetstate = ($g_lobby_net_state) rules = ($competitive_rules) gamemode = ($game_mode) venue = <tempvenuename> notes_hit = <notes_hit> total_notes = <total_notes> max_notes = <max_notes> best_run = <best_run> score = <score> stars = <stars> vocals_highway_view = <vocals_highway_view> specific_mic_type = <specific_mic_type> is_female = <is_female>
		getnextplayer player = <player> local
		repeat <x>
	endif
endscript
