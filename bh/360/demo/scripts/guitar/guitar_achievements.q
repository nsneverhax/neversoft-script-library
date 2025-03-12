gstar_power_triggered = 0
achievements_table = [
	{
		name = 0xb6293f41
		fetcher = getbandinfo
		field = current_mult
		comparator = 11
		condition_test = ach_check_equality
		check_time = during_song
	}
	{
		name = 0x7e5f38f7
		fetcher = getnumplayersingame
		field = num_players
		comparator = 4
		condition_test = ach_check_equality
		check_time = begin_song
	}
	{
		name = 0x7e5f38f7
		fetcher = getbandinfo
		field = 0xa295c456
		comparator = 0
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = 0x7e5f38f7
		fetcher = get_gametype_bitfield
		field = mode
		comparator = 4352
		condition_test = ach_compare_nibbles
		check_time = begin_song
	}
	{
		name = 0x7e5f38f7
		fetcher = ach_get_difficulties
		field = num_expert
		comparator = 4
		condition_test = ach_check_equality
		check_time = begin_song
	}
	{
		name = 0x7e5f38f7
		fetcher = get_song_completion_precentage
		field = completion_percentage
		comparator = 100
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		name = 0xe4dd8b43
		fetcher = getbandinfo
		field = score
		comparator = 1000000
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		name = 0xe4dd8b43
		fetcher = getnumplayersingame
		field = num_players
		comparator = 2
		condition_test = ach_check_greater_than_equal_to
		check_time = begin_song
	}
	{
		name = 0xe4dd8b43
		fetcher = get_gametype_bitfield
		field = mode
		comparator = 4352
		condition_test = ach_compare_nibbles
		check_time = begin_song
	}
	{
		name = 0xaf7a6dd4
		fetcher = get_achievement_info
		field = online_pro_faceoff_games_played
		comparator = 25
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		name = 0x015e08ab
		fetcher = check_is_avatar
		field = is_avatar
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = 0xaabe3a77
		fetcher = ach_fullcombo_test
		field = passed
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = 0xaabe3a77
		fetcher = getplayerinfo
		field = part
		comparator = vocals
		condition_test = ach_check_equality
		check_time = begin_song
	}
	{
		name = 0x1184af3f
		fetcher = 0x0bd79b75
		field = passed
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = 0x61903c5f
		fetcher = ach_fullcombo_test
		field = passed
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = 0x61903c5f
		fetcher = getplayerinfo
		field = difficulty
		comparator = beginner
		condition_test = ach_check_not_equal
		check_time = begin_song
	}
	{
		name = 0x61903c5f
		fetcher = getplayerinfo
		field = difficulty
		comparator = easy
		condition_test = ach_check_not_equal
		check_time = begin_song
	}
	{
		name = 0x0d8b030e
		fetcher = 0x001a8b1d
		field = passed
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = 0x0d8b030e
		fetcher = get_gametype_bitfield
		field = mode
		comparator = 4352
		condition_test = ach_compare_nibbles
		check_time = begin_song
	}
	{
		name = 0x0f777aab
		fetcher = 0x2439c575
		field = passed
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = 0xb61b36a6
		fetcher = 0x7336d395
		field = passed
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = 0xb34af1eb
		fetcher = 0x32c176e0
		field = passed
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
]
progression_based_achievements = [
	{
		name = 0x660d881c
		fetcher = get_progression_stars
		field = total_stars
		comparator = 111
		condition_test = ach_check_greater_than_equal_to
		check_time = progression_update
	}
	{
		name = 0xef1ebc15
		fetcher = get_progression_stars
		field = total_stars
		comparator = 333
		condition_test = ach_check_greater_than_equal_to
		check_time = progression_update
	}
	{
		name = 0x57fdf44e
		fetcher = get_progression_stars
		field = total_stars
		comparator = 555
		condition_test = ach_check_greater_than_equal_to
		check_time = progression_update
	}
	{
		name = 0x4bb74f79
		fetcher = get_num_challenges_completed
		field = num_plat_challenges_completed
		comparator = 50
		condition_test = ach_check_greater_than_equal_to
		check_time = progression_update
	}
	{
		name = 0x0b2902f0
		fetcher = get_num_challenges_completed
		field = num_plat_challenges_completed
		comparator = 1
		condition_test = ach_check_greater_than_equal_to
		check_time = progression_update
	}
	{
		name = 0xdfb98015
		fetcher = get_num_challenges_completed
		field = num_diamond_challenges_completed
		comparator = 1
		condition_test = ach_check_greater_than_equal_to
		check_time = progression_update
	}
	{
		name = 0xd8dff2fb
		fetcher = get_num_challenges_completed
		field = percent_complete
		comparator = 25
		condition_test = ach_check_greater_than_equal_to
		check_time = progression_update
	}
	{
		name = 0x9b474b84
		fetcher = get_num_challenges_completed
		field = percent_complete
		comparator = 50
		condition_test = ach_check_greater_than_equal_to
		check_time = progression_update
	}
	{
		name = 0x0a5d8795
		fetcher = get_num_challenges_completed
		field = percent_complete
		comparator = 75
		condition_test = ach_check_greater_than_equal_to
		check_time = progression_update
	}
	{
		name = 0xbace4c1f
		fetcher = get_num_challenges_completed
		field = 0xd390f1ca
		comparator = 1
		condition_test = ach_check_greater_than_equal_to
		check_time = progression_update
	}
	{
		name = 0x47b08fc6
		fetcher = 0xb816de7e
		field = passed
		comparator = 1
		condition_test = ach_check_equality
		check_time = progression_update
	}
	{
		name = 0x150a06ef
		fetcher = 0xaefa5637
		field = passed
		comparator = 1
		condition_test = ach_check_equality
		check_time = progression_update
	}
	{
		name = 0xd155c7aa
		fetcher = 0x395e37ce
		field = passed
		comparator = 1
		condition_test = ach_check_equality
		check_time = progression_update
	}
]
0x73553a5a = [
	{
		song = 0x0e02bf53
		0xd9cc1c66 = 5
		0x9e14f856 = 4
		0x791c782c = 7
		0xee199108 = 56
		0xf0fafcc9 = 16777216
	}
	{
		song = 0xd4079a1b
		0xd9cc1c66 = 10
		0x9e14f856 = 2
		0x791c782c = 12
		0xee199108 = 55
		0xf0fafcc9 = 1048576
	}
	{
		song = 0x3ede7cc8
		0xd9cc1c66 = 6
		0x9e14f856 = 5
		0x791c782c = 0
		0xee199108 = 5
		0xf0fafcc9 = 65536
	}
	{
		song = 0x3dc7acbb
		0xd9cc1c66 = 7
		0x9e14f856 = 4
		0x791c782c = 10
		0xee199108 = 10
		0xf0fafcc9 = 4096
	}
	{
		song = 0x58aabfeb
		0xd9cc1c66 = 6
		0x9e14f856 = 1
		0x791c782c = 0
		0xee199108 = 40
		0xf0fafcc9 = 256
	}
	{
		song = shewillbeloved
		0xd9cc1c66 = 13
		0x9e14f856 = 13
		0x791c782c = 2
		0xee199108 = 50
		0xf0fafcc9 = 16
	}
	{
		song = 0x7052b61b
		0xd9cc1c66 = 10
		0x9e14f856 = 0
		0x791c782c = 0
		0xee199108 = 41
		0xf0fafcc9 = 1
	}
	{
		song = 0xabd82191
		0xd9cc1c66 = 6
		0x9e14f856 = 8
		0x791c782c = 9
		0xee199108 = 44
		0xf0fafcc9 = 16777216
	}
	{
		song = 0xd6b99fe2
		0xd9cc1c66 = 11
		0x9e14f856 = 10
		0x791c782c = 11
		0xee199108 = 5
		0xf0fafcc9 = 1048576
	}
	{
		song = 0x878dc3db
		0xd9cc1c66 = 6
		0x9e14f856 = 6
		0x791c782c = 0
		0xee199108 = 19
		0xf0fafcc9 = 65536
	}
	{
		song = dontspeak
		0xd9cc1c66 = 7
		0x9e14f856 = 13
		0x791c782c = 10
		0xee199108 = 50
		0xf0fafcc9 = 4096
	}
	{
		song = 0x826f0248
		0xd9cc1c66 = 9
		0x9e14f856 = 6
		0x791c782c = 9
		0xee199108 = 5
		0xf0fafcc9 = 256
	}
	{
		song = 0x56096622
		0xd9cc1c66 = 0
		0x9e14f856 = 10
		0x791c782c = 5
		0xee199108 = 82
		0xf0fafcc9 = 16
	}
	{
		song = 0xfce6fe2c
		0xd9cc1c66 = 12
		0x9e14f856 = 2
		0x791c782c = 1
		0xee199108 = 77
		0xf0fafcc9 = 1
	}
	{
		song = 0xd0691b84
		0xd9cc1c66 = 16
		0x9e14f856 = 17
		0x791c782c = 11
		0xee199108 = 39
		0xf0fafcc9 = 65536
	}
	{
		song = 0x03726e6d
		0xd9cc1c66 = 9
		0x9e14f856 = 13
		0x791c782c = 5
		0xee199108 = 43
		0xf0fafcc9 = 4096
	}
	{
		song = 0x55397d2a
		0xd9cc1c66 = 8
		0x9e14f856 = 11
		0x791c782c = 7
		0xee199108 = 11
		0xf0fafcc9 = 256
	}
	{
		song = prettywoman
		0xd9cc1c66 = 13
		0x9e14f856 = 10
		0x791c782c = 8
		0xee199108 = 13
		0xf0fafcc9 = 16
	}
	{
		song = 0xabd1e5b9
		0xd9cc1c66 = 1
		0x9e14f856 = 9
		0x791c782c = 7
		0xee199108 = 32
		0xf0fafcc9 = 1
	}
]

script init_achievements 
	kill_all_achievement_scripts
	if should_update_achievements
		getnumplayersingame \{local}
		getfirstplayer \{local}
		if (<num_players> > 0)
			begin
			getplayerinfo <player> controller
			createachievementrequirements controller = <controller> arr = achievements_table
			getarraysize \{$achievements_table}
			i = 0
			begin
			extendcrcplayer (($achievements_table [<i>]).name) <player> out = ach_id
			spawnscriptlater achievement_test params = {($achievements_table [<i>]) player = <player> controller = <controller>} id = <ach_id>
			<i> = (<i> + 1)
			repeat <array_size>
			getnextplayer player = <player> local
			repeat <num_players>
		endif
	endif
endscript

script should_update_achievements 
	if demobuild
		return \{false}
	endif
	if NOT isbandcheating
		gamemode_gettype
		if ((<type> != freeplay) && ($game_mode != training) && ($game_mode != practice) && (<type> != tutorial) && ($calibrate_lag_enabled = 0))
			return \{true}
		endif
	endif
	return \{false}
endscript

script song_won_update_achievements 
	getnumplayersingame \{local}
	getfirstplayer \{local}
	if isps3
		song_won_update_achievement_counters player = <player>
		begin
		0x188c3d7e player = <player>
		getnextplayer player = <player> local
		repeat <num_players>
	else
		begin
		song_won_update_achievement_counters player = <player>
		0x188c3d7e player = <player>
		getnextplayer player = <player> local
		repeat <num_players>
	endif
	broadcastevent \{type = event_endsong_check_achievements}
endscript

script test_progression_based_achievements 
	getnumplayersingame \{local}
	getfirstplayer \{local}
	if (<num_players> > 0)
		begin
		getplayerinfo <player> controller
		createachievementrequirements controller = <controller> arr = progression_based_achievements
		getarraysize \{$progression_based_achievements}
		i = 0
		begin
		achievement_test ($progression_based_achievements [<i>]) player = <player> controller = <controller>
		<i> = (<i> + 1)
		repeat <array_size>
		getnextplayer player = <player> local
		repeat <num_players>
	endif
endscript

script kill_all_achievement_scripts 
	printscriptinfo \{qs(0xea0431ad)}
	getarraysize \{$achievements_table}
	i = 0
	begin
	player = 1
	begin
	extendcrcplayer (($achievements_table [<i>]).name) <player> out = ach_id
	killspawnedscript id = <ach_id>
	<player> = (<player> + 1)
	repeat 4
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script achievement_test 
	switch <fetcher>
		case getnumplayersingame
		case getplayerinfo
		params = {player = <player> <field>}
		case getbandinfo
		getplayerinfo <player> band
		params = {<band> <field>}
		case getglobaltags
		get_savegame_from_controller controller = <controller>
		params = {savegame = <savegame> param = <field>}
		default
		params = {fetch_func = <fetcher> player = <player> controller = <controller> field = <field>}
		<fetcher> = fetchachievementdata
	endswitch
	if (<check_time> = during_song)
		begin
		<fetcher> <params> out = term_a
		if <condition_test> term_a = <term_a> term_b = <comparator>
			achievement_test_pass name = <name> controller = <controller>
			break
		endif
		wait \{1
			gameframe}
		repeat
	else
		if (<check_time> = end_song)
			block \{type = event_endsong_check_achievements}
		endif
		<fetcher> <params> out = term_a
		if <condition_test> term_a = <term_a> term_b = <comparator>
			achievement_test_pass name = <name> controller = <controller>
		else
			extendcrcplayer <name> <player> out = ach_id
			killspawnedscript id = <ach_id>
		endif
	endif
endscript

script dump_req_arr 
	getarraysize \{$achievements_table}
	i = 0
	begin
	name = ($achievements_table [<i>].name)
	get_achievement_structure achievement_name = <name> controller = 0
	printstruct <achievement_structure>
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script achievement_test_pass 
	get_achievement_structure achievement_name = <name> controller = <controller>
	setarrayelement arrayname = <achievement_structure> globalarray index = 1 newvalue = (($<achievement_structure> [1]) + 1)
	printf qs(0x8c7b35c6) d = <name> a = ($<achievement_structure> [0]) b = ($<achievement_structure> [1])
	if (($<achievement_structure> [0]) = ($<achievement_structure> [1]))
		fire_achievement name = <name> controller = <controller>
	endif
endscript

script ach_check_equality 
	if (<term_a> = <term_b>)
		return \{true}
	else
		return \{false}
	endif
endscript

script ach_check_greater_than_equal_to 
	if (<term_a> >= <term_b>)
		return \{true}
	else
		return \{false}
	endif
endscript

script ach_check_greater_than 
	if (<term_a> > <term_b>)
		return \{true}
	else
		return \{false}
	endif
endscript

script ach_compare_nibbles 
	if NOT (<term_a> && <term_b>)
		return \{false}
	else
		return \{true}
	endif
endscript

script ach_check_not_equal 
	if NOT (<term_a> = <term_b>)
		return \{true}
	else
		return \{false}
	endif
endscript

script get_achievement_structure 
	formattext textname = controller_suffix '_%d' d = <controller>
	extendcrc <achievement_name> <controller_suffix> out = achievement_structure
	return achievement_structure = <achievement_structure>
endscript

script fire_achievement 
	if demobuild
		return \{false}
	endif
	printf qs(0x0bb6711e) s = <name> d = <controller>
	writeachievements achievement = <name> controller_id = <controller>
endscript

script check_is_avatar 
	getplayerinfo <player> character_id
	get_savegame_from_controller controller = <controller>
	if is_avatar_character id = <character_id> savegame = <savegame>
		return \{is_avatar = 1}
	else
		return \{is_avatar = 0}
	endif
endscript

script get_song_completion_precentage 
	gman_songfunc \{func = get_current_song}
	getsongtimems
	songfilemanager func = get_song_end_time song_name = <current_song>
	completion_percentage = 0
	if (<total_end_time> > 0)
		<completion_percentage> = ((<time> / <total_end_time>) * 100)
	endif
	if (<completion_percentage> > 100)
		<completion_percentage> = 100
	endif
	printf qs(0x415136c5) a = <time> b = <total_end_time> c = <completion_percentage>
	return completion_percentage = <completion_percentage>
endscript

script get_num_challenges_completed 
	requireparams \{[
			controller
		]
		all}
	get_savegame_from_controller controller = <controller>
	0xd390f1ca = 0
	gold_done = 0
	plat_done = 0
	diamond_done = 0
	band_done = 0
	0x2df31166 = 0
	getarraysize \{$progression_gig_list}
	progression_list_size = <array_size>
	i = 0
	begin
	gig_list = ($progression_gig_list [<i>].gig_list)
	getarraysize ($<gig_list>)
	gig_list_size = <array_size>
	j = 0
	begin
	goal_id = ($<gig_list> [<j>])
	getglobaltags <goal_id> savegame = <savegame>
	if (<completed> = 1)
		<0xd390f1ca> = (<0xd390f1ca> + 1)
	endif
	if (<completed_gold> = 1)
		<gold_done> = (<gold_done> + 1)
		getarraysize ($<goal_id>.required_band)
		if (<array_size> > 1)
			<band_done> = (<band_done> + 1)
		endif
	endif
	if (<completed_platinum> = 1)
		<plat_done> = (<plat_done> + 1)
	endif
	if (<completed_diamond> = 1)
		<diamond_done> = (<diamond_done> + 1)
	endif
	<0x2df31166> = (<0x2df31166> + 1)
	<j> = (<j> + 1)
	repeat <gig_list_size>
	<i> = (<i> + 1)
	repeat <progression_list_size>
	percent_complete = (((<0xd390f1ca> * 1.0) / <0x2df31166>) * 100)
	printf qs(0xeebc501e) a = <0xd390f1ca> b = <0x2df31166>
	return num_gold_challenges_completed = <gold_done> num_plat_challenges_completed = <plat_done> num_diamond_challenges_completed = <diamond_done> num_band_challenges_completed = <band_done> percent_complete = <percent_complete> 0xd390f1ca = <0xd390f1ca>
endscript

script ach_get_difficulties 
	num_beginner = 0
	num_easy = 0
	num_medium = 0
	num_hard = 0
	num_expert = 0
	getnumplayersingame
	getfirstplayer
	begin
	getplayerinfo <player> difficulty
	switch <difficulty>
		case beginner
		<num_beginner> = (<num_beginner> + 1)
		case easy
		<num_easy> = (<num_easy> + 1)
		case medium
		<num_medium> = (<num_medium> + 1)
		case hard
		<num_hard> = (<num_hard> + 1)
		case expert
		<num_expert> = (<num_expert> + 1)
		default
		scriptassert qs(0xd06add8c) s = <part>
	endswitch
	getnextplayer player = <player>
	repeat <num_players>
	return num_beginner = <num_beginner> num_easy = <num_easy> num_medium = <num_medium> num_hard = <num_hard> num_expert = <num_expert>
endscript

script get_progression_stars 
	get_savegame_from_controller controller = <controller>
	get_current_progression_stars savegame = <savegame>
	return total_stars = <total_stars>
endscript

script get_band_config 
	num_guitars = 0
	num_bass = 0
	num_drums = 0
	num_vocals = 0
	getnumplayersingame
	getfirstplayer
	begin
	getplayerinfo <player> part
	switch <part>
		case guitar
		<num_guitars> = (<num_guitars> + 1)
		case bass
		<num_bass> = (<num_bass> + 1)
		case drum
		<num_drums> = (<num_drums> + 1)
		case vocals
		<num_vocals> = (<num_vocals> + 1)
		default
		scriptassert qs(0x1aad6e58) s = <part>
	endswitch
	getnextplayer player = <player>
	repeat <num_players>
	return num_guitars = <num_guitars> num_bass = <num_bass> num_drums = <num_drums> num_vocals = <num_vocals>
endscript

script get_achievement_info 
	get_savegame_from_controller controller = <controller>
	getglobaltags achievement_info savegame = <savegame> param = <field>
	return <...>
endscript

script get_gametype_bitfield 
	mode = 0
	gamemode_gettype
	switch (<type>)
		case quickplay
		<mode> = 4096
		case career
		<mode> = 256
		case competitive
		<mode> = 16
		case freeplay
		<mode> = 1
		default
		scriptassert qs(0x66bb1769) s = <type>
	endswitch
	return <mode>
endscript

script 0x77560dbc 
	requireparams \{[
			player
			song
		]
		all}
	i = 0
	getarraysize ($0x73553a5a)
	begin
	if checksumequals a = ($0x73553a5a [<i>].song) b = <song>
		printf qs(0x474ee30b) d = <player> s = <song>
		getplayerinfo <player> part
		formattext checksumname = last_song_stats 'p%p_last_song_detailed_stats' p = <player> addtostringlookup = true
		formattext checksumname = last_song_stats_max 'p%p_last_song_detailed_stats_max' p = <player> addtostringlookup = true
		extendcrc <part> '_phrase_index' out = 0xb6c2a51a
		0x1e46eefe = ($0x73553a5a [<i>].<0xb6c2a51a>)
		printf qs(0xcf28d692) d = <0x1e46eefe>
		printstruct ($<last_song_stats>)
		printstruct ($<last_song_stats_max>)
		if (($<last_song_stats_max> [<0x1e46eefe>]) > 0)
			printf qs(0x057eaf51) a = ($<last_song_stats_max> [<0x1e46eefe>]) b = ($<last_song_stats> [<0x1e46eefe>])
			if ($<last_song_stats> [<0x1e46eefe>] = ($<last_song_stats_max> [<0x1e46eefe>]))
				printf \{qs(0x79060fae)}
				return true index = <i> 0xf0fafcc9 = ($0x73553a5a [<i>].0xf0fafcc9)
			else
				printf qs(0x1a163bcd) a = ($<last_song_stats> [<0x1e46eefe>]) b = ($<last_song_stats_max> [<0x1e46eefe>])
				return \{false}
			endif
		endif
	endif
	i = (<i> + 1)
	repeat <array_size>
	return \{false}
endscript

script song_won_update_achievement_counters 
	gamemode_gettype
	getnumplayersingame
	get_savegame_from_player player = <player>
	achievement_global_tags = {}
	if (($is_network_game = 1) && (<type> = competitive) && ($competitive_rules = faceoff))
		getglobaltags achievement_info savegame = <savegame> param = online_pro_faceoff_games_played
		achievement_global_tags = {<achievement_global_tags> online_pro_faceoff_games_played = (<online_pro_faceoff_games_played> + 1)}
	endif
	printf qs(0x7507ebe3) d = <player> a = <savegame>
	printstruct <achievement_global_tags>
	setglobaltags achievement_info savegame = <savegame> params = <achievement_global_tags>
endscript

script 0x188c3d7e 
	get_savegame_from_player player = <player>
	0xb763e1af = {}
	song = ($last_song_played)
	if 0x77560dbc song = <song> player = <player>
		if (<index> < 7)
			getglobaltags achievement_info savegame = <savegame> param = secret_phrase_bitflag_0
			<secret_phrase_bitflag_0> = (<secret_phrase_bitflag_0> || <0xf0fafcc9>)
			0xb763e1af = {secret_phrase_bitflag_0 = <secret_phrase_bitflag_0>}
		elseif (<index> < 14)
			getglobaltags achievement_info savegame = <savegame> param = secret_phrase_bitflag_1
			<secret_phrase_bitflag_1> = (<secret_phrase_bitflag_1> || <0xf0fafcc9>)
			0xb763e1af = {secret_phrase_bitflag_1 = <secret_phrase_bitflag_1>}
		else
			getglobaltags achievement_info savegame = <savegame> param = secret_phrase_bitflag_2
			<secret_phrase_bitflag_2> = (<secret_phrase_bitflag_2> || <0xf0fafcc9>)
			0xb763e1af = {secret_phrase_bitflag_2 = <secret_phrase_bitflag_2>}
		endif
		getplayerinfo <player> controller
		extendcrc <song> '_SecretPhrase_Achievement' out = achievement_name
		fire_achievement name = <achievement_name> controller = <controller>
	endif
	printf qs(0x859845ec) d = <player> a = <savegame>
	printstruct <0xb763e1af>
	setglobaltags achievement_info savegame = <savegame> params = <0xb763e1af>
endscript

script 0x32c176e0 
	get_savegame_from_controller controller = <controller>
	passed = 0
	getglobaltags savegame = <savegame> achievement_info
	printf qs(0x108b11d6) a = <secret_phrase_bitflag_0> b = <secret_phrase_bitflag_1> c = <secret_phrase_bitflag_2>
	if (((17895697 && <secret_phrase_bitflag_0>) = 17895697) && ((17895697 && <secret_phrase_bitflag_1>) = 17895697) && ((17895697 && <secret_phrase_bitflag_2>) = 17895697))
		<passed> = 1
	endif
	return passed = <passed>
endscript

script 0x12451402 
	requireparams \{[
			controller
			savegame
		]
		all}
	getarraysize ($tutorial_headers)
	tutorial_header_size = <array_size>
	passed = 1
	i = 0
	begin
	tutorial_header = ($tutorial_headers [<i>])
	formattext checksumname = tutorial_array '%s_tutorials' s = <tutorial_header>
	getarraysize ($<tutorial_array>)
	tutorial_array_size = <array_size>
	j = 0
	begin
	tutorial_struct = ($<tutorial_array> [<j>])
	if NOT tutorial_system_is_tutorial_complete {
			savegame = <savegame>
			tutorial_header = <tutorial_header>
			tutorial_id = (<tutorial_struct>.id)
		}
		printf qs(0x1c4d0a5e) a = (<tutorial_struct>.id)
		<passed> = 0
		break
	endif
	printf qs(0xa8dfabe7) a = (<tutorial_struct>.id)
	<j> = (<j> + 1)
	repeat <tutorial_array_size>
	<i> = (<i> + 1)
	repeat <tutorial_header_size>
	if (<passed> = 1)
		fire_achievement name = 0xad664457 controller = <controller>
	endif
endscript

script 0x2439c575 
	gamemode_gettype
	if (($is_network_game) && (<type> = competitive) && ($competitive_rules = do_or_die))
		return \{passed = 1}
	else
		return \{passed = 0}
	endif
endscript

script 0x7336d395 
	passed = 0
	if ($is_network_game = 1)
		gamemode_gettype
		if (<type> = career)
			if ishost
				<passed> = 1
			endif
		endif
	endif
	return passed = <passed>
endscript

script ach_fullcombo_test 
	printf \{qs(0xd1e7bf0d)}
	getplayerinfo <player> part
	gman_songfunc \{func = get_current_song}
	passed = 1
	if (<current_song> = jamsession)
		<passed> = 0
	else
		getsongtimems
		songfilemanager func = get_song_end_time song_name = <current_song>
		if ((<total_end_time> <= 0) || (<time> < <total_end_time>))
			printf \{qs(0x9cc42b43)}
			<passed> = 0
		else
			if (<part> != vocals)
				getplayerinfo <player> notes_hit
				getplayerinfo <player> total_notes
				getplayerinfo <player> max_notes
				getplayerinfo <player> unnecessary_notes
				if ((<notes_hit> < <total_notes>) || (<total_notes> = 0) || (<unnecessary_notes> > 0))
					printf \{qs(0xdf882bd6)}
					<passed> = 0
				endif
			else
				getplayerinfo <player> vocal_phrase_quality
				getplayerinfo <player> vocal_phrase_max_qual
				if ((<vocal_phrase_quality> < <vocal_phrase_max_qual>) || (<vocal_phrase_quality> = 0))
					printf \{qs(0xdf882bd6)}
					<passed> = 0
				endif
			endif
		endif
	endif
	printstruct <...>
	return passed = <passed>
endscript

script 0x0bd79b75 
	list_array = ($on_disc_list)
	getarraysize ($<list_array>)
	get_savegame_from_controller controller = <controller>
	if (<array_size> > 0)
		i = 0
		begin
		getglobaltags (($<list_array>) [<i>]) savegame = <savegame> param = completed
		printf qs(0xa6438174) a = <i> b = (($<list_array>) [<i>]) c = <completed>
		if (<completed> = 0)
			return \{passed = 0}
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	return \{passed = 1}
endscript

script 0x001a8b1d 
	getnumplayersingame
	gamemode_gettype
	passed = 1
	if NOT (<num_players> = 4)
		<passed> = 0
	else
		getplayerinfo \{1
			part}
		instrument = <part>
		<player> = 1
		begin
		getplayerinfo <player> part
		if NOT (<instrument> = <part>)
			<passed> = 0
			break
		endif
		getnextplayer player = <player>
		repeat <num_players>
	endif
	return passed = <passed>
endscript

script 0xb816de7e 
	completed_lead_gold = 0
	completed_bass_gold = 0
	completed_drum_gold = 0
	completed_vocals_gold = 0
	get_savegame_from_controller controller = <controller>
	getarraysize \{$progression_gig_list}
	progression_list_size = <array_size>
	i = 0
	begin
	gig_list = ($progression_gig_list [<i>].gig_list)
	getarraysize ($<gig_list>)
	gig_list_size = <array_size>
	j = 0
	begin
	goal_id = ($<gig_list> [<j>])
	getglobaltags <goal_id> savegame = <savegame>
	if (<completed_gold> = 1)
		getarraysize ($<goal_id>.required_band)
		if (<array_size> = 1)
			switch ($<goal_id>.required_band [0])
				case lead
				<completed_lead_gold> = (<completed_lead_gold> + 1)
				case bass
				<completed_bass_gold> = (<completed_bass_gold> + 1)
				case drum
				<completed_drum_gold> = (<completed_drum_gold> + 1)
				case vocal
				<completed_vocals_gold> = (<completed_vocals_gold> + 1)
				default
				scriptassert qs(0x8702b120) s = ($<goal_id>.required_band [0])
			endswitch
		endif
	endif
	<j> = (<j> + 1)
	repeat <gig_list_size>
	<i> = (<i> + 1)
	repeat <progression_list_size>
	if ((<completed_lead_gold> > 0) && (<completed_bass_gold> > 0) && (<completed_drum_gold> > 0) && (<completed_vocals_gold> > 0))
		return \{passed = 1}
	else
		return \{passed = 0}
	endif
endscript

script 0xaefa5637 
	get_savegame_from_controller controller = <controller>
	get_levelzonearray_size
	array_count = 0
	begin
	get_levelzonearray_checksum index = <array_count>
	if NOT structurecontains structure = ($levelzones.<level_checksum>) debug_only
		formattext checksumname = venue_checksum 'venue_%s' s = ($levelzones.<level_checksum>.name)
		getglobaltags savegame = <savegame> <venue_checksum>
		if (<unlocked> = 0)
			printf qs(0x3db7aa97) s = <venue_checksum>
			return \{passed = 0}
		endif
		printf qs(0x8e9fcaf8) s = <venue_checksum>
	endif
	array_count = (<array_count> + 1)
	repeat <array_size>
	return \{passed = 1}
endscript

script ach_sp_points_test 
	if should_update_achievements
		getplayerinfo <player> score
		getplayerinfo <player> sp_points
		point_diff = (<score> - <sp_points>)
		if (<point_diff> > 10000)
			getplayerinfo <player> controller
			fire_achievement name = 0xe9625049 controller = <controller>
		endif
	endif
endscript

script 0x395e37ce 
	requireparams \{[
			controller
		]
		all}
	printf qs(0xecfcba88) d = <controller>
	passed = 0
	get_savegame_from_controller controller = <controller>
	0x93a32e1f = [
		0x6bf8a841
		0x693725af
		0x5c382b95
		0x15951136
	]
	<passed> = 1
	getarraysize <0x93a32e1f>
	i = 0
	begin
	getglobaltags (<0x93a32e1f> [<i>]) savegame = <savegame>
	if NOT (<completed> = 1)
		printf qs(0x39d5f5e7) s = (<0x93a32e1f> [<i>])
		<passed> = 0
		break
	endif
	printf qs(0x0e605620) s = (<0x93a32e1f> [<i>])
	<i> = (<i> + 1)
	repeat <array_size>
	return passed = <passed>
endscript

script check_is_standard_band 
	if is_standard_band
		return \{standard_band = 1}
	endif
	return \{standard_band = 0}
endscript

script is_standard_band 
	getnumplayersingame \{on_screen}
	num_lead = 0
	num_bass = 0
	num_vocal = 0
	num_drum = 0
	if (<num_players_shown> = 4)
		getfirstplayer \{on_screen}
		begin
		getplayerinfo <player> part
		switch <part>
			case guitar
			<num_lead> = (<num_lead> + 1)
			case bass
			<num_bass> = (<num_bass> + 1)
			case vocals
			<num_vocal> = (<num_vocal> + 1)
			case drum
			<num_drum> = (<num_drum> + 1)
			default
			scriptassert qs(0x03695c6c) s = <part>
		endswitch
		getnextplayer player = <player> on_screen
		repeat <num_players_shown>
		printstruct <...>
		if ((<num_lead> = 1) && (<num_bass> = 1) && (<num_vocal> = 1) && (<num_drum> = 1))
			return \{true}
		endif
	endif
	return \{false}
endscript

script achievements_ischeating 
	if ($cheat_autokick = 1 || $cheat_freedrum = 1)
		getnumplayersingame \{local}
		getfirstplayer \{local}
		begin
		getplayerinfo <player> part
		if (<part> = drum)
			printf \{qs(0x90144029)}
			return \{true}
		endif
		getnextplayer player = <player> local
		repeat <num_players>
	endif
	if ($cheat_alwaysslide = 1)
		getnumplayersingame \{local}
		getfirstplayer \{local}
		begin
		getplayerinfo <player> part
		if (<part> = guitar)
			printf \{qs(0x90144029)}
			return \{true}
		endif
		getnextplayer player = <player> local
		repeat <num_players>
	endif
	return \{false}
endscript

script achievements_ischeatingautokick 
	if ($cheat_autokick != 1 && $cheat_freedrum != 1)
		return \{false}
	endif
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		getplayerinfo <player> part
		if (<part> = drum)
			printf \{qs(0x90144029)}
			return \{true}
		endif
		getnextplayer on_screen player = <player>
		repeat <num_players_shown>
	endif
	return \{false}
endscript
