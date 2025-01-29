g_dgs_checksumsneeded = [
	net_dgsversion2
	net_dgs
	Name
	conditions
	event
	controller
	controller_index
	Player
	buildversion
	dgsversion1
	dgsversion2
	userid
	playername
	usingheadset
	instrument
	difficulty
	character
	leftyflip
	localbandnumber
	localbandnumplayers
	sessionid1
	sessionid2
	localtime
	countrycode
	language
	territory
	hardware
	isserver
	IsHost
	isserverplayer
	debugmsg
	audio_offset
	video_offset
	time
	venue
	song
	songstatus
	numplayers
	gametype
	lobbynetstate
	rules
	gamemode
	length
	notes_hit
	total_notes
	max_notes
	note_streak
	score
	stars
	challenge_name
	challenge_grade
	challenge_progress
	oldstate
	newstate
	userlist
	invite_msg
	invite_title
	invite_instrument
	var1
	var2
	var3
	var4
	testarray
	teststruct
	temp1
	temp2
	temp3
	temp4
	test1
	test2
	test3
	test4
	string1
	string2
	string3
	string4
]

script dgsrecorddata_trace 
	if GotParam \{Name}
		dgsrecorddata event = 'Trace' Name = <Name>
	else
		dgsrecorddata \{event = 'Trace'}
	endif
endscript

script dgsrecorddata_dumpplayerinfo 
	temparray = []
	Player = 1
	begin
	getplayerinfo <Player> in_game
	getplayerinfo <Player> is_local_client
	getplayerinfo <Player> net_id_first
	getplayerinfo <Player> net_id_second
	getplayerinfo <Player> controller
	getplayerinfo <Player> part
	getplayerinfo <Player> lefty_flip
	getplayerinfo <Player> double_kick_drum
	getplayerinfo <Player> difficulty
	getplayerinfo <Player> character_id
	getplayerinfo <Player> character_savegame
	getplayerinfo <Player> vocals_highway_view
	gameevent_getlastusedmictype Player = <Player>
	if characterprofilegetstruct Name = <character_id> savegame = <character_savegame> dont_assert
		if StructureContains structure = <profile_struct> appearance
			if get_is_female_from_appearance appearance = (<profile_struct>.appearance) dont_assert
			endif
		endif
	endif
	formatText checksumName = gamertag_global 'gamertag_%d' d = (<Player> - 1)
	item = {Player = <Player> in_game = <in_game> is_local_client = <is_local_client> gamertag = <gamertag_global> net_id_first = <net_id_first> net_id_second = <net_id_second> controller = <controller> part = <part> lefty_flip = <lefty_flip> double_kick_drum = <double_kick_drum> difficulty = <difficulty> character_id = <character_id> character_savegame = <character_savegame> vocals_highway_view = <vocals_highway_view> specific_mic_type = <specific_mic_type> is_female = <is_female>}
	AddArrayElement array = <temparray> element = <item>
	<temparray> = <array>
	Player = (<Player> + 1)
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
	if ($autotest_on = 1)
		return
	endif
	getnumplayersingame \{local
		out = X}
	if (<X> > 0)
		getfirstplayer \{local}
		begin
		if StructureContains \{structure = $LevelZones
				$current_level}
			tempvenuename = (($LevelZones.$current_level).Name)
		else
			tempvaluename = ''
		endif
		dgsrecorddata event = 'VenueEnter' conditions = [net_dgs_venueenter] Player = <Player> debugmsg = 'VenueEnter' venue = <tempvenuename>
		getnextplayer Player = <Player> local
		repeat <X>
	endif
endscript

script dgsrecorddata_venueexit 
	if ($autotest_on = 1)
		return
	endif
	getnumplayersingame \{local
		out = X}
	if (<X> > 0)
		getfirstplayer \{local}
		begin
		if StructureContains \{structure = $LevelZones
				$current_level}
			tempvenuename = (($LevelZones.$current_level).Name)
		else
			tempvaluename = ''
		endif
		dgsrecorddata event = 'VenueExit' conditions = [net_dgs_venueexit] Player = <Player> debugmsg = 'VenueExit' venue = <tempvenuename> time = ($g_gameevent_in_venue_time)
		getnextplayer Player = <Player> local
		repeat <X>
	endif
endscript

script dgsrecorddata_songbegin 
	if ($autotest_on = 1)
		return
	endif
	getnumplayersingame \{local
		out = X}
	if (<X> > 0)
		getfirstplayer \{local}
		begin
		playlist_getcurrentsong
		getnumplayersingame
		gamemode_gettype
		if StructureContains \{structure = $LevelZones
				$current_level}
			tempvenuename = (($LevelZones.$current_level).Name)
		else
			tempvaluename = ''
		endif
		getplayerinfo <Player> controller
		getsavegamefromcontroller controller = <controller>
		getplayerinfo <Player> vocals_highway_view
		gameevent_getlastusedmictype Player = <Player>
		getplayerinfo <Player> character_id
		getplayerinfo <Player> character_savegame
		if characterprofilegetstruct Name = <character_id> savegame = <savegame> dont_assert
			if StructureContains structure = <profile_struct> appearance
				if get_is_female_from_appearance appearance = (<profile_struct>.appearance) dont_assert
				endif
			endif
		endif
		dgsrecorddata event = 'SongBegin' conditions = [net_dgs_songbegin] Player = <Player> debugmsg = 'SongBegin' song = <current_song> numplayers = <num_players> gametype = <Type> lobbynetstate = ($g_lobby_net_state) rules = ($competitive_rules) gamemode = ($game_mode) venue = <tempvenuename> vocals_highway_view = <vocals_highway_view> specific_mic_type = <specific_mic_type> is_female = <is_female>
		getnextplayer Player = <Player> local
		repeat <X>
	endif
endscript

script dgsrecorddata_songwon 
	if ($autotest_on = 1)
		return
	endif
	getnumplayersingame \{local
		out = X}
	if (<X> > 0)
		getfirstplayer \{local}
		begin
		playlist_getcurrentsong
		getnumplayersingame
		GetSongTimeMs
		gamemode_gettype
		if StructureContains \{structure = $LevelZones
				$current_level}
			tempvenuename = (($LevelZones.$current_level).Name)
		else
			tempvaluename = ''
		endif
		getplayerinfo <Player> controller
		getsavegamefromcontroller controller = <controller>
		getplayerinfo <Player> notes_hit
		getplayerinfo <Player> total_notes
		getplayerinfo <Player> max_notes
		getplayerinfo <Player> best_run
		getplayerinfo <Player> score
		getplayerinfo <Player> stars
		getplayerinfo <Player> is_local_client
		getplayerinfo <Player> vocals_highway_view
		gameevent_getlastusedmictype Player = <Player>
		getplayerinfo <Player> character_id
		getplayerinfo <Player> character_savegame
		if characterprofilegetstruct Name = <character_id> savegame = <savegame> dont_assert
			if StructureContains structure = <profile_struct> appearance
				if get_is_female_from_appearance appearance = (<profile_struct>.appearance) dont_assert
				endif
			endif
		endif
		<challenge_name> = ''
		<challenge_grade> = 0
		<challenge_progress> = 0
		total_award_points = 0
		gman_getgoalsbyplayer Player = <Player>
		if (0 != <goals_by_player_size>)
			index = 0
			begin
			challenge_instance_id = (<goals_by_player> [<index>])
			gman_challengemanagerfunc goal = quickplay tool = challenges func = get_challenge_score params = {challenge_id = <challenge_instance_id>}
			CastToInteger \{score_value}
			quickplay_get_grade goal_id = <challenge_instance_id>
			goal_name = (<goal_strings_by_player> [<index>])
			ExtendCrc <goal_name> '_info' out = goal_struct
			goal_string = ($<goal_struct>.Name)
			quickplay_do_challenge_score_update {
				challenge_instance_id = <challenge_instance_id>
				goal_name = <goal_name>
				song = <current_song>
				Player = <Player>
				savegame = <savegame>
				save = 0
			}
			item = {Name = <goal_string> score = <score_value> grade = <pending_grade>}
			dgsrecorddata event = 'SongChallengeGoal' conditions = [net_dgs_songchallengegoals] Player = <Player> debugmsg = 'SongChallenge' song = <current_song> songstatus = 1 numplayers = <num_players> length = <time> gametype = <Type> lobbynetstate = ($g_lobby_net_state) rules = ($competitive_rules) gamemode = ($game_mode) venue = <tempvenuename> notes_hit = <notes_hit> total_notes = <total_notes> max_notes = <max_notes> best_run = <best_run> score = <score> stars = <stars> vocals_highway_view = <vocals_highway_view> specific_mic_type = <specific_mic_type> is_female = <is_female> challengegoal_name = <goal_string> challengegoal_score = <score_value> challengegoal_grade = <pending_grade>
			index = (<index> + 1)
			repeat <goals_by_player_size>
		endif
		dgsrecorddata event = 'SongPlayed' conditions = [net_dgs_songwon] Player = <Player> debugmsg = 'SongWon' song = <current_song> songstatus = 1 numplayers = <num_players> length = <time> gametype = <Type> lobbynetstate = ($g_lobby_net_state) rules = ($competitive_rules) gamemode = ($game_mode) venue = <tempvenuename> notes_hit = <notes_hit> total_notes = <total_notes> max_notes = <max_notes> best_run = <best_run> score = <score> stars = <stars> vocals_highway_view = <vocals_highway_view> specific_mic_type = <specific_mic_type> is_female = <is_female> total_award_points = <total_award_points>
		getnextplayer Player = <Player> local
		repeat <X>
	endif
endscript

script dgsrecorddata_songfailed 
	if ($autotest_on = 1)
		return
	endif
	getnumplayersingame \{local
		out = X}
	if (<X> > 0)
		getfirstplayer \{local}
		begin
		playlist_getcurrentsong
		getnumplayersingame
		GetSongTimeMs
		gamemode_gettype
		if StructureContains \{structure = $LevelZones
				$current_level}
			tempvenuename = (($LevelZones.$current_level).Name)
		else
			tempvaluename = ''
		endif
		getplayerinfo <Player> controller
		getsavegamefromcontroller controller = <controller>
		getplayerinfo <Player> notes_hit
		getplayerinfo <Player> total_notes
		getplayerinfo <Player> max_notes
		getplayerinfo <Player> best_run
		getplayerinfo <Player> score
		getplayerinfo <Player> stars
		getplayerinfo <Player> vocals_highway_view
		gameevent_getlastusedmictype Player = <Player>
		getplayerinfo <Player> character_id
		getplayerinfo <Player> character_savegame
		if characterprofilegetstruct Name = <character_id> savegame = <savegame> dont_assert
			if StructureContains structure = <profile_struct> appearance
				if get_is_female_from_appearance appearance = (<profile_struct>.appearance) dont_assert
				endif
			endif
		endif
		dgsrecorddata event = 'SongPlayed' conditions = [net_dgs_songfailed] Player = <Player> debugmsg = 'SongFailed' song = <current_song> songstatus = 0 numplayers = <num_players> length = <time> gametype = <Type> lobbynetstate = ($g_lobby_net_state) rules = ($competitive_rules) gamemode = ($game_mode) venue = <tempvenuename> notes_hit = <notes_hit> total_notes = <total_notes> max_notes = <max_notes> best_run = <best_run> score = <score> stars = <stars> vocals_highway_view = <vocals_highway_view> specific_mic_type = <specific_mic_type> is_female = <is_female>
		getnextplayer Player = <Player> local
		repeat <X>
	endif
endscript

script dgsrecorddata_sendgameinvite 
	dgsrecorddata event = 'SendGameInvite' conditions = [net_dgs_sendgameinvite] controller = <controller> userlist = <userlist> invite_msg = <invite_msg> invite_title = <invite_title> invite_instrument = <invite_instrument>
endscript

script dgsrecorddata_joingameinviteattempt 
	dgsrecorddata event = 'JoinGameInviteAttempt' conditions = [net_dgs_joingameinviteattempt] controller = <controller>
endscript

script dgsrecorddata_joingameinvitesuccess 
	dgsrecorddata event = 'JoinGameInviteSuccess' conditions = [net_dgs_joingameinvitesuccess] controller = <controller>
endscript

script dgsrecorddata_joingameinvitefailure 
	dgsrecorddata event = 'JoinGameInviteFailure' conditions = [net_dgs_joingameinvitefailure] controller = <controller>
endscript
