gStar_Power_Triggered = 0
achievements_table = [
	{
		Name = achievement_thestreak
		fetcher = getplayerinfo
		Field = current_run
		comparator = 1001
		condition_test = ach_check_greater_than_equal_to
		check_time = during_song
	}
	{
		Name = achievement_ironlungs
		fetcher = getplayerinfo
		Field = part
		comparator = vocals
		condition_test = ach_check_equality
		check_time = begin_song
	}
	{
		Name = achievement_ironlungs
		fetcher = getplayerinfo
		Field = current_run
		comparator = 250
		condition_test = ach_check_greater_than_equal_to
		check_time = during_song
	}
	{
		Name = achievement_crankituptoeleven
		fetcher = getbandinfo
		Field = current_mult
		comparator = 11
		condition_test = ach_check_equality
		check_time = during_song
	}
	{
		Name = achievement_crankituptoeleven
		fetcher = check_is_standard_band
		Field = standard_band
		comparator = 1
		condition_test = ach_check_equality
		check_time = begin_song
	}
	{
		Name = achievement_crowdpleaser
		fetcher = getplayerinfo
		Field = current_health
		comparator = 2.0
		condition_test = ach_check_greater_than_equal_to
		check_time = during_song
	}
	{
		Name = achievement_crowdpleaser
		fetcher = get_gametype_bitfield
		Field = mode
		comparator = 4353
		condition_test = ach_compare_nibbles
		check_time = begin_song
	}
	{
		Name = achievement_seniorcommander
		fetcher = ach_get_song_stars
		Field = stars
		comparator = 5
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		Name = achievement_seniorcommander
		fetcher = get_gametype_bitfield
		Field = mode
		comparator = 4353
		condition_test = ach_compare_nibbles
		check_time = begin_song
	}
	{
		Name = achievement_seniorcommander
		fetcher = gman_songtool_getcurrentsong
		Field = current_song
		comparator = jamsession
		condition_test = ach_check_not_equal
		check_time = begin_song
	}
	{
		Name = achievement_aboveandbeyond
		fetcher = get_average_multiplier
		Field = average_multiplier
		comparator = 4
		condition_test = ach_check_greater_than
		check_time = end_song
	}
	{
		Name = achievement_aboveandbeyond
		fetcher = get_gametype_bitfield
		Field = mode
		comparator = 4353
		condition_test = ach_compare_nibbles
		check_time = begin_song
	}
	{
		Name = achievement_scorebig
		fetcher = getnumplayersingame
		Field = num_players
		comparator = 1
		condition_test = ach_check_equality
		check_time = begin_song
	}
	{
		Name = achievement_scorebig
		fetcher = getplayerinfo
		Field = score
		comparator = 500000
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		Name = achievement_scorebigger
		fetcher = getbandinfo
		Field = score
		comparator = 1000000
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		Name = achievement_scorebiggest
		fetcher = getbandinfo
		Field = score
		comparator = 3000000
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		Name = achievement_barbershop
		fetcher = get_band_config
		Field = num_vocals
		comparator = 4
		condition_test = ach_check_equality
		check_time = begin_song
	}
	{
		Name = achievement_drumline
		fetcher = get_band_config
		Field = num_drums
		comparator = 4
		condition_test = ach_check_equality
		check_time = begin_song
	}
	{
		Name = achievement_stringquartet
		fetcher = get_band_config
		Field = num_guitars
		comparator = 4
		condition_test = ach_check_equality
		check_time = begin_song
	}
	{
		Name = achievement_allfourbasearebelongtous
		fetcher = get_band_config
		Field = num_bass
		comparator = 4
		condition_test = ach_check_equality
		check_time = begin_song
	}
	{
		Name = achievement_synchronized
		fetcher = get_achievement_info
		Field = band_moments_completed
		comparator = 20
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		Name = achievement_festquartetquest
		fetcher = get_achievement_info
		Field = four_player_shredfest_games_played
		comparator = 10
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		Name = achievement_whatsanlp
		fetcher = get_achievement_info
		Field = quickplay_songs_completed
		comparator = 14
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		Name = achievement_boxset
		fetcher = get_achievement_info
		Field = quickplay_songs_completed
		comparator = 100
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		Name = achievement_jukebox
		fetcher = get_achievement_info
		Field = quickplay_songs_completed
		comparator = 300
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		Name = achievement_outgoing
		fetcher = get_achievement_info
		Field = online_pro_faceoff_games_played
		comparator = 25
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		Name = achievement_chanteuse
		fetcher = ach_chanteuse_test
		Field = passed
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_specialguest
		fetcher = getplayerinfo
		Field = character_id
		comparator = avatar
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_nomistakesallowed
		fetcher = ach_nomistakesallowed_test
		Field = passed
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_nomistakesallowed
		fetcher = get_gametype_bitfield
		Field = mode
		comparator = 4352
		condition_test = ach_compare_nibbles
		check_time = begin_song
	}
	{
		Name = achievement_openminded
		fetcher = ach_openminded_test
		Field = passed
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_octuplets
		fetcher = ach_octuplets_test
		Field = passed
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_rocktopus
		fetcher = ach_rocktopus_test
		Field = passed
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_kirshnerreborn
		fetcher = ach_kirshnerreborn_test
		Field = passed
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_samplerplate
		fetcher = ach_sampler_plate_test
		Field = passed
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_starmony
		fetcher = check_is_standard_band
		Field = standard_band
		comparator = 1
		condition_test = ach_check_equality
		check_time = begin_song
	}
	{
		Name = achievement_starmony
		fetcher = num_players_in_star_power
		Field = players_in_star_power
		comparator = 4
		condition_test = ach_check_equality
		check_time = during_song
	}
	{
		Name = achievement_didyoufaillikewedid
		fetcher = gman_songtool_getcurrentsong
		Field = current_song
		comparator = doyoufeellikewedo
		condition_test = ach_check_equality
		check_time = begin_song
	}
	{
		Name = achievement_didyoufaillikewedid
		fetcher = ach_test_didyoufail
		Field = passed
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_didyoufaillikewedid
		fetcher = get_gametype_bitfield
		Field = mode
		comparator = 4352
		condition_test = ach_compare_nibbles
		check_time = begin_song
	}
	{
		Name = achievement_playittothebone
		fetcher = ach_play_it_to_the_bone_test
		Field = passed
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
]
progression_based_achievements = [
	{
		Name = achievement_youngstar
		fetcher = get_progression_stars
		Field = total_stars
		comparator = 25
		condition_test = ach_check_greater_than_equal_to
		check_time = progression_update
	}
	{
		Name = achievement_risingstar
		fetcher = get_progression_stars
		Field = total_stars
		comparator = 101
		condition_test = ach_check_greater_than_equal_to
		check_time = progression_update
	}
	{
		Name = achievement_shootingstar
		fetcher = get_progression_stars
		Field = total_stars
		comparator = 303
		condition_test = ach_check_greater_than_equal_to
		check_time = progression_update
	}
	{
		Name = achievement_superstar
		fetcher = get_progression_stars
		Field = total_stars
		comparator = 505
		condition_test = ach_check_greater_than_equal_to
		check_time = progression_update
	}
	{
		Name = achievement_starcluster
		fetcher = get_progression_stars
		Field = total_stars
		comparator = 808
		condition_test = ach_check_greater_than_equal_to
		check_time = progression_update
	}
	{
		Name = achievement_youwantmore
		fetcher = ach_youwantmore_test
		Field = passed
		comparator = 1
		condition_test = ach_check_equality
		check_time = progression_update
	}
	{
		Name = achievement_representative
		fetcher = ach_representative_test
		Field = passed
		comparator = 1
		condition_test = ach_check_equality
		check_time = progression_update
	}
	{
		Name = achievement_goinggold
		fetcher = get_num_challenges_completed
		Field = num_gold_challenges_completed
		comparator = 50
		condition_test = ach_check_greater_than_equal_to
		check_time = progression_update
	}
	{
		Name = achievement_goingplatinum
		fetcher = get_num_challenges_completed
		Field = num_plat_challenges_completed
		comparator = 50
		condition_test = ach_check_greater_than_equal_to
		check_time = progression_update
	}
	{
		Name = achievement_goingdiamond
		fetcher = get_num_challenges_completed
		Field = num_diamond_challenges_completed
		comparator = 50
		condition_test = ach_check_greater_than_equal_to
		check_time = progression_update
	}
	{
		Name = achievement_challengeofthesupergroup
		fetcher = get_num_challenges_completed
		Field = num_band_challenges_completed
		comparator = 5
		condition_test = ach_check_greater_than_equal_to
		check_time = progression_update
	}
	{
		Name = achievement_quadruplethreat
		fetcher = ach_quadruplethreat_test
		Field = passed
		comparator = 1
		condition_test = ach_check_equality
		check_time = progression_update
	}
	{
		Name = achievement_thegrandtour
		fetcher = ach_grand_tour_test
		Field = passed
		comparator = 1
		condition_test = ach_check_equality
		check_time = progression_update
	}
	{
		Name = achievement_starstruck
		fetcher = ach_starstruck_test
		Field = passed
		comparator = 1
		condition_test = ach_check_equality
		check_time = progression_update
	}
]

script init_achievements 
	kill_all_achievement_scripts
	if should_update_achievements
		getnumplayersingame \{local}
		getfirstplayer \{local}
		if (<num_players> > 0)
			begin
			getplayerinfo <Player> controller
			createachievementrequirements controller = <controller> arr = achievements_table
			GetArraySize \{$achievements_table}
			i = 0
			begin
			extendcrcplayer (($achievements_table [<i>]).Name) <Player> out = ach_id
			SpawnScriptLater achievement_test params = {($achievements_table [<i>]) Player = <Player> controller = <controller>} id = <ach_id>
			<i> = (<i> + 1)
			repeat <array_Size>
			getnextplayer Player = <Player> local
			repeat <num_players>
		endif
	endif
endscript

script should_update_achievements 
	if NOT achievements_ischeating
		gamemode_gettype
		if ((<Type> != freeplay) && ($game_mode != training) && ($game_mode != practice) && (<Type> != tutorial) && ($calibrate_lag_enabled = 0))
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script song_won_update_achievements 
	getnumplayersingame \{local}
	getfirstplayer \{local}
	if isps3
		song_won_update_achievement_counters \{Player = 1}
	else
		begin
		song_won_update_achievement_counters Player = <Player>
		getnextplayer Player = <Player> local
		repeat <num_players>
	endif
	broadcastevent \{Type = event_endsong_check_achievements}
endscript

script test_progression_based_achievements 
	getnumplayersingame \{local}
	getfirstplayer \{local}
	if (<num_players> > 0)
		begin
		getplayerinfo <Player> controller
		createachievementrequirements controller = <controller> arr = progression_based_achievements
		GetArraySize \{$progression_based_achievements}
		i = 0
		begin
		achievement_test ($progression_based_achievements [<i>]) Player = <Player> controller = <controller>
		<i> = (<i> + 1)
		repeat <array_Size>
		getnextplayer Player = <Player> local
		repeat <num_players>
	endif
endscript

script kill_all_achievement_scripts 
	printscriptinfo \{qs(0xea0431ad)}
	GetArraySize \{$achievements_table}
	i = 0
	begin
	Player = 1
	begin
	extendcrcplayer (($achievements_table [<i>]).Name) <Player> out = ach_id
	KillSpawnedScript id = <ach_id>
	<Player> = (<Player> + 1)
	repeat 4
	<i> = (<i> + 1)
	repeat <array_Size>
endscript

script achievement_test 
	switch <fetcher>
		case getnumplayersingame
		case getplayerinfo
		params = {Player = <Player> <Field>}
		case getbandinfo
		getplayerinfo <Player> Band
		params = {<Band> <Field>}
		case GetGlobalTags
		get_savegame_from_controller controller = <controller>
		params = {savegame = <savegame> param = <Field>}
		case num_players_in_star_power
		getfirstplayer \{on_screen}
		params = {Player = <Player>}
		default
		params = {fetch_func = <fetcher> Player = <Player> controller = <controller> Field = <Field>}
		<fetcher> = fetchachievementdata
	endswitch
	if (<check_time> = during_song)
		begin
		<fetcher> <params> out = term_a
		if <condition_test> term_a = <term_a> term_b = <comparator>
			achievement_test_pass Name = <Name> controller = <controller>
			break
		endif
		Wait \{1
			gameframe}
		repeat
	else
		if (<check_time> = end_song)
			Block \{Type = event_endsong_check_achievements}
		endif
		<fetcher> <params> out = term_a
		if <condition_test> term_a = <term_a> term_b = <comparator>
			achievement_test_pass Name = <Name> controller = <controller>
		else
			extendcrcplayer <Name> <Player> out = ach_id
			KillSpawnedScript id = <ach_id>
		endif
	endif
endscript

script dump_req_arr 
	GetArraySize \{$achievements_table}
	i = 0
	begin
	Name = ($achievements_table [<i>].Name)
	get_achievement_structure achievement_name = <Name> controller = 0
	printstruct <achievement_structure>
	<i> = (<i> + 1)
	repeat <array_Size>
endscript

script achievement_test_pass 
	get_achievement_structure achievement_name = <Name> controller = <controller>
	SetArrayElement ArrayName = <achievement_structure> globalarray index = 1 NewValue = (($<achievement_structure> [1]) + 1)
	printf qs(0x8c7b35c6) d = <Name> a = ($<achievement_structure> [0]) b = ($<achievement_structure> [1])
	if (($<achievement_structure> [0]) = ($<achievement_structure> [1]))
		fire_achievement Name = <Name> controller = <controller>
	endif
endscript

script ach_check_equality 
	if (<term_a> = <term_b>)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script ach_check_greater_than_equal_to 
	if (<term_a> >= <term_b>)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script ach_check_greater_than 
	if (<term_a> > <term_b>)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script ach_compare_nibbles 
	if NOT (<term_a> && <term_b>)
		return \{FALSE}
	else
		return \{true}
	endif
endscript

script ach_check_not_equal 
	if NOT (<term_a> = <term_b>)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script get_achievement_structure 
	formatText TextName = controller_suffix '_%d' d = <controller>
	ExtendCrc <achievement_name> <controller_suffix> out = achievement_structure
	return achievement_structure = <achievement_structure>
endscript

script fire_achievement 
	printf qs(0x66aa720a) s = <Name>
	WriteAchievements achievement = <Name> controller_id = <controller>
endscript

script get_num_challenges_completed 
	RequireParams \{[
			controller
		]
		all}
	get_savegame_from_controller controller = <controller>
	gold_done = 0
	plat_done = 0
	diamond_done = 0
	band_done = 0
	GetArraySize \{$progression_gig_list}
	progression_list_size = <array_Size>
	i = 0
	begin
	gig_list = ($progression_gig_list [<i>].gig_list)
	GetArraySize ($<gig_list>)
	gig_list_size = <array_Size>
	j = 0
	begin
	goal_id = ($<gig_list> [<j>])
	GetGlobalTags <goal_id> savegame = <savegame>
	if (<completed_gold> = 1)
		<gold_done> = (<gold_done> + 1)
		GetArraySize ($<goal_id>.required_band)
		if (<array_Size> > 1)
			<band_done> = (<band_done> + 1)
		endif
	endif
	if (<completed_platinum> = 1)
		<plat_done> = (<plat_done> + 1)
	endif
	if (<completed_diamond> = 1)
		<diamond_done> = (<diamond_done> + 1)
	endif
	<j> = (<j> + 1)
	repeat <gig_list_size>
	<i> = (<i> + 1)
	repeat <progression_list_size>
	return num_gold_challenges_completed = <gold_done> num_plat_challenges_completed = <plat_done> num_diamond_challenges_completed = <diamond_done> num_band_challenges_completed = <band_done>
endscript

script ach_get_song_stars 
	getplayerinfo <Player> Band
	getbandinfo <Band> projected_song_stars
	return stars = <projected_song_stars>
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
	getplayerinfo <Player> part
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
		ScriptAssert qs(0x1aad6e58) s = <part>
	endswitch
	getnextplayer Player = <Player>
	repeat <num_players>
	return num_guitars = <num_guitars> num_bass = <num_bass> num_drums = <num_drums> num_vocals = <num_vocals>
endscript

script get_achievement_info 
	get_savegame_from_controller controller = <controller>
	GetGlobalTags achievement_info savegame = <savegame> param = <Field>
	return <...>
endscript

script get_gametype_bitfield 
	mode = 0
	gamemode_gettype
	switch (<Type>)
		case quickplay
		<mode> = 4096
		case career
		<mode> = 256
		case competitive
		<mode> = 16
		case freeplay
		<mode> = 1
		default
		ScriptAssert qs(0x66bb1769) s = <Type>
	endswitch
	return <mode>
endscript

script song_won_update_achievement_counters 
	gamemode_gettype
	getnumplayersingame
	get_savegame_from_player Player = <Player>
	achievement_global_tags = {}
	switch (<Type>)
		case quickplay
		achievement_global_tags = {<achievement_global_tags> played_quickplay = 1}
		case competitive
		switch (($competitive_rules))
			case faceoff
			achievement_global_tags = {<achievement_global_tags> played_faceoff = 1}
			case momentum
			achievement_global_tags = {<achievement_global_tags> played_momentum = 1}
			case streakers
			achievement_global_tags = {<achievement_global_tags> played_streakers = 1}
			case do_or_die
			achievement_global_tags = {<achievement_global_tags> played_do_or_die = 1}
			case PERFECTIONIST
			achievement_global_tags = {<achievement_global_tags> played_perfectionist = 1}
			case elimination
			achievement_global_tags = {<achievement_global_tags> played_elimination = 1}
			case team_faceoff
			achievement_global_tags = {<achievement_global_tags> played_team_faceoff = 1}
			case team_momentum
			achievement_global_tags = {<achievement_global_tags> played_team_momentum = 1}
			case team_streakers
			achievement_global_tags = {<achievement_global_tags> played_team_streakers = 1}
			case team_do_or_die
			achievement_global_tags = {<achievement_global_tags> played_team_do_or_die = 1}
			case team_perfectionist
			achievement_global_tags = {<achievement_global_tags> played_team_perfectionist = 1}
			case team_elimination
			achievement_global_tags = {<achievement_global_tags> played_team_elimination = 1}
			case p8_pro_faceoff
			achievement_global_tags = {<achievement_global_tags> played_p8_pro_faceoff = 1}
			default
			ScriptAssert qs(0xa6d815a7) s = ($competitive_rules)
		endswitch
		case career
		achievement_global_tags = {<achievement_global_tags> played_career = 1}
		case freeplay
		printf \{qs(0x89ed9637)}
		default
		ScriptAssert qs(0xa6d815a7) s = <Type>
	endswitch
	if (<Type> = quickplay)
		GetGlobalTags achievement_info savegame = <savegame> param = quickplay_songs_completed
		achievement_global_tags = {<achievement_global_tags> quickplay_songs_completed = (<quickplay_songs_completed> + 1)}
	elseif (($is_network_game = 1) && (<Type> = competitive) && ($competitive_rules = faceoff))
		GetGlobalTags achievement_info savegame = <savegame> param = online_pro_faceoff_games_played
		achievement_global_tags = {<achievement_global_tags> online_pro_faceoff_games_played = (<online_pro_faceoff_games_played> + 1)}
	endif
	if (($game_mode = fest_mode) && (<num_players> = 4))
		GetGlobalTags achievement_info savegame = <savegame> param = four_player_shredfest_games_played
		achievement_global_tags = {<achievement_global_tags> four_player_shredfest_games_played = (<four_player_shredfest_games_played> + 1)}
	endif
	if ((<Type> = quickplay) || (<Type> = career))
		getplayerinfo <Player> part
		if (<part> = vocals)
			getplayerinfo Player = <Player> stars
			if (<stars> >= 5)
				switch ($last_song_played)
					case exgirlfriend
					achievement_global_tags = {<achievement_global_tags> five_starred_exgirlfriend = 1}
					case lovetoken
					achievement_global_tags = {<achievement_global_tags> five_starred_lovetoken = 1}
					case onlyhappywhenitrains
					achievement_global_tags = {<achievement_global_tags> five_starred_onlyhappywhenitrains = 1}
				endswitch
			endif
		endif
	endif
	printf qs(0x7507ebe3) d = <Player> a = <savegame>
	printstruct <achievement_global_tags>
	SetGlobalTags achievement_info savegame = <savegame> params = <achievement_global_tags>
endscript

script ach_chanteuse_test 
	get_savegame_from_controller controller = <controller>
	GetGlobalTags achievement_info savegame = <savegame> param = five_starred_exgirlfriend
	GetGlobalTags achievement_info savegame = <savegame> param = five_starred_lovetoken
	GetGlobalTags achievement_info savegame = <savegame> param = five_starred_onlyhappywhenitrains
	if ((<five_starred_exgirlfriend> = 1) && (<five_starred_lovetoken> = 1) && (<five_starred_onlyhappywhenitrains> = 1))
		return \{passed = 1}
	else
		return \{passed = 0}
	endif
endscript

script ach_specialguest_test 
	getplayerinfo <Player> character_id
	get_savegame_from_player Player = <Player>
	if is_avatar_character id = <character_id> savegame = <savegame>
		return \{passed = 1}
	else
		return \{passed = 0}
	endif
endscript

script ach_nomistakesallowed_test 
	getplayerinfo <Player> part
	gman_songfunc \{func = get_current_song}
	passed = 1
	if (<current_song> = jamsession)
		<passed> = 0
	else
		if (<part> != vocals)
			getplayerinfo <Player> notes_hit
			getplayerinfo <Player> total_notes
			getplayerinfo <Player> max_notes
			getplayerinfo <Player> unnecessary_notes
			if ((<notes_hit> < <max_notes>) || (<total_notes> = 0) || (<unnecessary_notes> > 0))
				printf \{qs(0xdf882bd6)}
				<passed> = 0
			endif
		else
			getplayerinfo <Player> vocal_phrase_quality
			getplayerinfo <Player> vocal_phrase_max_qual
			if ((<vocal_phrase_quality> < <vocal_phrase_max_qual>) || (<vocal_phrase_quality> = 0))
				printf \{qs(0xdf882bd6)}
				<passed> = 0
			endif
		endif
	endif
	return passed = <passed>
endscript

script ach_openminded_test 
	GetArraySize \{$gh5_songlist}
	get_savegame_from_controller controller = <controller>
	if (<array_Size> > 0)
		i = 0
		begin
		GetGlobalTags ($gh5_songlist [<i>]) savegame = <savegame> param = completed
		printf qs(0xc904a8ec) a = <i> b = ($gh5_songlist [<i>]) c = <completed>
		if (<completed> = 0)
			return \{passed = 0}
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	return \{passed = 1}
endscript

script ach_octuplets_test 
	getnumplayersingame
	gamemode_gettype
	passed = 0
	if (($is_network_game = 1) && (<num_players> = 8) && (<Type> = competitive))
		getplayerinfo \{1
			part}
		instrument = <part>
		<passed> = 1
		<Player> = 1
		begin
		getplayerinfo <Player> part
		if NOT (<instrument> = <part>)
			<passed> = 0
			break
		endif
		<Player> = (<Player> + 1)
		repeat 8
	endif
	return passed = <passed>
endscript

script ach_rocktopus_test 
	getnumplayersingame
	if (($competitive_rules = p8_pro_faceoff) && (<num_players> = 8))
		return \{passed = 1}
	else
		return \{passed = 0}
	endif
endscript

script ach_quadruplethreat_test 
	completed_lead_gold = 0
	completed_bass_gold = 0
	completed_drum_gold = 0
	completed_vocals_gold = 0
	get_savegame_from_controller controller = <controller>
	GetArraySize \{$progression_gig_list}
	progression_list_size = <array_Size>
	i = 0
	begin
	gig_list = ($progression_gig_list [<i>].gig_list)
	GetArraySize ($<gig_list>)
	gig_list_size = <array_Size>
	j = 0
	begin
	goal_id = ($<gig_list> [<j>])
	GetGlobalTags <goal_id> savegame = <savegame>
	if (<completed_gold> = 1)
		GetArraySize ($<goal_id>.required_band)
		if (<array_Size> = 1)
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
				ScriptAssert qs(0x8702b120) s = ($<goal_id>.required_band [0])
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

script ach_grand_tour_test 
	get_savegame_from_controller controller = <controller>
	get_LevelZoneArray_size
	array_count = 0
	begin
	get_LevelZoneArray_checksum index = <array_count>
	if NOT StructureContains structure = ($LevelZones.<level_checksum>) debug_only
		formatText checksumName = venue_checksum 'venue_%s' s = ($LevelZones.<level_checksum>.Name)
		GetGlobalTags savegame = <savegame> <venue_checksum>
		if (<unlocked> = 0)
			printf qs(0x3db7aa97) s = <venue_checksum>
			return \{passed = 0}
		endif
		printf qs(0x8e9fcaf8) s = <venue_checksum>
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
	return \{passed = 1}
endscript

script ach_kirshnerreborn_test 
	gamemode_gettype
	if ((<Type> = career) || (<Type> = quickplay))
		i = 1
		begin
		getplayerinfo <i> character_id
		if NOT is_completely_custom_musician id = <character_id>
			return \{passed = 0}
		endif
		<i> = (<i> + 1)
		repeat 4
		return \{passed = 1}
	endif
	return \{passed = 0}
endscript

script ach_representative_test 
	get_savegame_from_controller controller = <controller>
	GetArraySize \{$gig_sponsors}
	i = 0
	begin
	GetGlobalTags ($gig_sponsors [<i>]) savegame = <savegame>
	if (<completed_diamond> = 1)
		return \{passed = 1}
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	return \{passed = 0}
endscript

script ach_play_it_to_the_bone_test 
	if gman_songfunc \{func = is_play_list_finished}
		gman_songfunc \{func = get_play_list_total_time}
		if (<play_list_time_in_seconds> >= 3600)
			return \{passed = 1}
		endif
	endif
	return \{passed = 0}
endscript

script ach_test_didyoufail 
	passed = 0
	completion = 0
	gman_songtool_getcurrentsong
	GetSongTimeMs
	songfilemanager func = get_song_end_time song_name = <current_song>
	if (<total_end_time> > 0)
		completion = (100 * <time> / <total_end_time>)
		if (<completion> > 95)
			<passed> = 1
		endif
	endif
	return passed = <passed>
endscript

script ach_youwantmore_test 
	get_savegame_from_controller controller = <controller>
	GetArraySize \{$gig_encores}
	encores_passed = 0
	i = 0
	begin
	GetGlobalTags ($gig_encores [<i>]) savegame = <savegame>
	if (<completed> = 1)
		<encores_passed> = (<encores_passed> + 1)
		if (<encores_passed> = 5)
			return \{passed = 1}
		endif
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	return \{passed = 0}
endscript

script ach_sampler_plate_test 
	get_savegame_from_controller controller = <controller>
	GetGlobalTags achievement_info savegame = <savegame>
	passed = 0
	if ((<played_quickplay> = 1) &&
			(<played_faceoff> = 1) &&
			(<played_career> = 1) &&
			(<played_momentum> = 1) &&
			(<played_streakers> = 1) &&
			(<played_do_or_die> = 1) &&
			(<played_perfectionist> = 1) &&
			(<played_elimination> = 1) &&
			(<played_team_faceoff> = 1) &&
			(<played_team_momentum> = 1) &&
			(<played_team_streakers> = 1) &&
			(<played_team_do_or_die> = 1) &&
			(<played_team_perfectionist> = 1) &&
			(<played_team_elimination> = 1) &&
			(<played_p8_pro_faceoff> = 1))
		<passed> = 1
	endif
	printf \{qs(0x492e8ebc)}
	printstruct <...>
	return passed = <passed>
endscript

script ach_sp_points_test 
	if should_update_achievements
		getplayerinfo <Player> score
		getplayerinfo <Player> sp_points
		point_diff = (<score> - <sp_points>)
		if (<point_diff> > 9000)
			getplayerinfo <Player> controller
			fire_achievement Name = achievement_over19000 controller = <controller>
		endif
	endif
endscript

script ach_starstruck_test 
	RequireParams \{[
			controller
		]
		all}
	printf qs(0xecfcba88) d = <controller>
	passed = 0
	get_savegame_from_controller controller = <controller>
	GetGlobalTags unlocked_profiles savegame = <savegame>
	if GotParam \{unlocked_profiles}
		indices = [0 1 3 6 8]
		<passed> = 1
		GetArraySize <indices>
		i = 0
		begin
		profile_index = (<indices> [<i>])
		if NOT ArrayContains array = <unlocked_profiles> contains = ($preset_musician_profiles_locked [<profile_index>].Name)
			printstruct <...>
			printf qs(0x35898d04) s = ($preset_musician_profiles_locked [<profile_index>].Name)
			<passed> = 0
			break
		endif
		printf qs(0xd0e593f5) s = ($preset_musician_profiles_locked [<profile_index>].Name)
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	return passed = <passed>
endscript

script check_is_standard_band 
	if is_standard_band
		return \{standard_band = 1}
	endif
	return \{standard_band = 0}
endscript

script num_players_in_star_power 
	getnumplayersingame \{on_screen
		out = num_players}
	players_in_star_power = 0
	begin
	getplayerinfo <Player> star_power_used
	if (<star_power_used> = 1)
		<players_in_star_power> = (<players_in_star_power> + 1)
	else
		break
	endif
	getnextplayer Player = <Player> on_screen
	repeat <num_players>
	return term_a = <players_in_star_power>
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
		getplayerinfo <Player> part
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
			ScriptAssert qs(0x03695c6c) s = <part>
		endswitch
		getnextplayer Player = <Player> on_screen
		repeat <num_players_shown>
		printstruct <...>
		if ((<num_lead> = 1) && (<num_bass> = 1) && (<num_vocal> = 1) && (<num_drum> = 1))
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script achievements_ischeating 
	if ($cheat_autokick = 1 || $cheat_freedrum = 1)
		getnumplayersingame \{local}
		getfirstplayer \{local}
		begin
		getplayerinfo <Player> part
		if (<part> = drum)
			printf \{qs(0x90144029)}
			return \{true}
		endif
		getnextplayer Player = <Player> local
		repeat <num_players>
	endif
	if ($cheat_alwaysslide = 1)
		getnumplayersingame \{local}
		getfirstplayer \{local}
		begin
		getplayerinfo <Player> part
		if (<part> = guitar)
			printf \{qs(0x90144029)}
			return \{true}
		endif
		getnextplayer Player = <Player> local
		repeat <num_players>
	endif
	return \{FALSE}
endscript

script achievements_ischeatingautokick 
	if ($cheat_autokick != 1 && $cheat_freedrum != 1)
		return \{FALSE}
	endif
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		getplayerinfo <Player> part
		if (<part> = drum)
			printf \{qs(0x90144029)}
			return \{true}
		endif
		getnextplayer on_screen Player = <Player>
		repeat <num_players_shown>
	endif
	return \{FALSE}
endscript
