gStar_Power_Triggered = 0
Achievements_Table = [
	{
		name = Achievement_StarPowered
		fetcher = GetBandInfo
		Field = current_mult
		comparator = 11
		condition_test = ach_check_equality
		check_time = during_song
	}
	{
		name = Achievement_TheresnoIinBandHero
		fetcher = GetNumPlayersInGame
		Field = num_players
		comparator = 4
		condition_test = ach_check_equality
		check_time = begin_song
	}
	{
		name = Achievement_TheresnoIinBandHero
		fetcher = GetBandInfo
		Field = death_toll
		comparator = 0
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = Achievement_TheresnoIinBandHero
		fetcher = get_gametype_bitfield
		Field = mode
		comparator = 4352
		condition_test = ach_compare_nibbles
		check_time = begin_song
	}
	{
		name = Achievement_TheresnoIinBandHero
		fetcher = ach_get_difficulties
		Field = num_expert
		comparator = 4
		condition_test = ach_check_equality
		check_time = begin_song
	}
	{
		name = Achievement_TheresnoIinBandHero
		fetcher = get_song_completion_precentage
		Field = completion_percentage
		comparator = 100
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		name = Achievement_ACoolMill
		fetcher = GetBandInfo
		Field = score
		comparator = 1000000
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		name = Achievement_ACoolMill
		fetcher = GetNumPlayersInGame
		Field = num_players
		comparator = 2
		condition_test = ach_check_greater_than_equal_to
		check_time = begin_song
	}
	{
		name = Achievement_ACoolMill
		fetcher = get_gametype_bitfield
		Field = mode
		comparator = 4352
		condition_test = ach_compare_nibbles
		check_time = begin_song
	}
	{
		name = Achievement_FacetoFace
		fetcher = get_achievement_info
		Field = online_pro_faceoff_games_played
		comparator = 25
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		name = Achievement_15MinutesofFame
		fetcher = check_is_avatar
		Field = is_avatar
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = Achievement_FeveredPitch
		fetcher = ach_fullcombo_test
		Field = passed
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = Achievement_FeveredPitch
		fetcher = GetPlayerInfo
		Field = part
		comparator = vocals
		condition_test = ach_check_equality
		check_time = begin_song
	}
	{
		name = Achievement_TestingtheWaters
		fetcher = ach_testingthewaters_test
		Field = passed
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = Achievement_PicturePerfect
		fetcher = ach_fullcombo_test
		Field = passed
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = Achievement_PicturePerfect
		fetcher = GetPlayerInfo
		Field = difficulty
		comparator = beginner
		condition_test = ach_check_not_equal
		check_time = begin_song
	}
	{
		name = Achievement_PicturePerfect
		fetcher = GetPlayerInfo
		Field = difficulty
		comparator = easy
		condition_test = ach_check_not_equal
		check_time = begin_song
	}
	{
		name = Achievement_FourofaKind
		fetcher = ach_fourofakind_test
		Field = passed
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = Achievement_FourofaKind
		fetcher = get_gametype_bitfield
		Field = mode
		comparator = 4352
		condition_test = ach_compare_nibbles
		check_time = begin_song
	}
	{
		name = Achievement_TillDeathDoUsPart
		fetcher = ach_till_death_do_us_part_test
		Field = passed
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = Achievement_MC
		fetcher = ach_mc_test
		Field = passed
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = Achievement_Route66
		fetcher = ach_route66_test
		Field = passed
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
]
Progression_Based_Achievements = [
	{
		name = Achievement_Glimmer
		fetcher = get_progression_stars
		Field = total_stars
		comparator = 111
		condition_test = ach_check_greater_than_equal_to
		check_time = progression_update
	}
	{
		name = Achievement_Sparkle
		fetcher = get_progression_stars
		Field = total_stars
		comparator = 333
		condition_test = ach_check_greater_than_equal_to
		check_time = progression_update
	}
	{
		name = Achievement_Shine
		fetcher = get_progression_stars
		Field = total_stars
		comparator = 555
		condition_test = ach_check_greater_than_equal_to
		check_time = progression_update
	}
	{
		name = Achievement_ANewChallengeAwaits
		fetcher = get_num_challenges_completed
		Field = num_plat_challenges_completed
		comparator = 50
		condition_test = ach_check_greater_than_equal_to
		check_time = progression_update
	}
	{
		name = Achievement_PlatinumBlonde
		fetcher = get_num_challenges_completed
		Field = num_plat_challenges_completed
		comparator = 1
		condition_test = ach_check_greater_than_equal_to
		check_time = progression_update
	}
	{
		name = Achievement_IcedOut
		fetcher = get_num_challenges_completed
		Field = num_diamond_challenges_completed
		comparator = 1
		condition_test = ach_check_greater_than_equal_to
		check_time = progression_update
	}
	{
		name = Achievement_RisetoFame
		fetcher = get_num_challenges_completed
		Field = percent_complete
		comparator = 25
		condition_test = ach_check_greater_than_equal_to
		check_time = progression_update
	}
	{
		name = Achievement_NationsStar
		fetcher = get_num_challenges_completed
		Field = percent_complete
		comparator = 50
		condition_test = ach_check_greater_than_equal_to
		check_time = progression_update
	}
	{
		name = Achievement_WorldKnown
		fetcher = get_num_challenges_completed
		Field = percent_complete
		comparator = 75
		condition_test = ach_check_greater_than_equal_to
		check_time = progression_update
	}
	{
		name = Achievement_CakeWalk
		fetcher = get_num_challenges_completed
		Field = num_gigs_completed
		comparator = 1
		condition_test = ach_check_greater_than_equal_to
		check_time = progression_update
	}
	{
		name = Achievement_JackofAllTrades
		fetcher = ach_jackofalltrades_test
		Field = passed
		comparator = 1
		condition_test = ach_check_equality
		check_time = progression_update
	}
	{
		name = Achievement_RoadMostTraveled
		fetcher = ach_road_most_traveled_test
		Field = passed
		comparator = 1
		condition_test = ach_check_equality
		check_time = progression_update
	}
	{
		name = Achievement_NicetoMeetYou
		fetcher = ach_nicetomeetyou_test
		Field = passed
		comparator = 1
		condition_test = ach_check_equality
		check_time = progression_update
	}
]
route_66 = [
	{
		song = BeautifulSoul
		guitar_phrase_index = 5
		bass_phrase_index = 4
		drum_phrase_index = 7
		vocals_phrase_index = 56
		secret_phrase_bit = 16777216
	}
	{
		song = BlackCat
		guitar_phrase_index = 10
		bass_phrase_index = 2
		drum_phrase_index = 12
		vocals_phrase_index = 55
		secret_phrase_bit = 1048576
	}
	{
		song = HonkeyTonkWomen
		guitar_phrase_index = 6
		bass_phrase_index = 5
		drum_phrase_index = 0
		vocals_phrase_index = 5
		secret_phrase_bit = 65536
	}
	{
		song = TakeWhatYouTake
		guitar_phrase_index = 7
		bass_phrase_index = 4
		drum_phrase_index = 10
		vocals_phrase_index = 10
		secret_phrase_bit = 4096
	}
	{
		song = LikeWhoa
		guitar_phrase_index = 6
		bass_phrase_index = 1
		drum_phrase_index = 0
		vocals_phrase_index = 40
		secret_phrase_bit = 256
	}
	{
		song = SheWillBeLoved
		guitar_phrase_index = 13
		bass_phrase_index = 13
		drum_phrase_index = 2
		vocals_phrase_index = 50
		secret_phrase_bit = 16
	}
	{
		song = LetsDance
		guitar_phrase_index = 10
		bass_phrase_index = 0
		drum_phrase_index = 0
		vocals_phrase_index = 41
		secret_phrase_bit = 1
	}
	{
		song = BringMeToLife
		guitar_phrase_index = 6
		bass_phrase_index = 8
		drum_phrase_index = 9
		vocals_phrase_index = 44
		secret_phrase_bit = 16777216
	}
	{
		song = LipsOfAnAngel
		guitar_phrase_index = 11
		bass_phrase_index = 10
		drum_phrase_index = 11
		vocals_phrase_index = 5
		secret_phrase_bit = 1048576
	}
	{
		song = LoveIsABattlefield
		guitar_phrase_index = 6
		bass_phrase_index = 6
		drum_phrase_index = 0
		vocals_phrase_index = 19
		secret_phrase_bit = 65536
	}
	{
		song = DontSpeak
		guitar_phrase_index = 7
		bass_phrase_index = 13
		drum_phrase_index = 10
		vocals_phrase_index = 50
		secret_phrase_bit = 4096
	}
	{
		song = IHeardItThrough
		guitar_phrase_index = 9
		bass_phrase_index = 6
		drum_phrase_index = 9
		vocals_phrase_index = 5
		secret_phrase_bit = 256
	}
	{
		song = Wannabe
		guitar_phrase_index = 0
		bass_phrase_index = 10
		drum_phrase_index = 5
		vocals_phrase_index = 82
		secret_phrase_bit = 16
	}
	{
		song = YMCA
		guitar_phrase_index = 12
		bass_phrase_index = 2
		drum_phrase_index = 1
		vocals_phrase_index = 77
		secret_phrase_bit = 1
	}
	{
		song = SoYesterday
		guitar_phrase_index = 16
		bass_phrase_index = 17
		drum_phrase_index = 11
		vocals_phrase_index = 39
		secret_phrase_bit = 65536
	}
	{
		song = OceanAve
		guitar_phrase_index = 9
		bass_phrase_index = 13
		drum_phrase_index = 5
		vocals_phrase_index = 43
		secret_phrase_bit = 4096
	}
	{
		song = DirtyLittleSecret
		guitar_phrase_index = 8
		bass_phrase_index = 11
		drum_phrase_index = 7
		vocals_phrase_index = 11
		secret_phrase_bit = 256
	}
	{
		song = PrettyWoman
		guitar_phrase_index = 13
		bass_phrase_index = 10
		drum_phrase_index = 8
		vocals_phrase_index = 13
		secret_phrase_bit = 16
	}
	{
		song = KungFuFighting
		guitar_phrase_index = 1
		bass_phrase_index = 9
		drum_phrase_index = 7
		vocals_phrase_index = 32
		secret_phrase_bit = 1
	}
]

script Init_Achievements 
	kill_all_achievement_scripts
	if should_update_achievements
		GetNumPlayersInGame \{local}
		GetFirstPlayer \{local}
		if (<num_players> > 0)
			begin
			GetPlayerInfo <player> controller
			CreateAchievementRequirements controller = <controller> arr = Achievements_Table
			GetArraySize \{$Achievements_Table}
			i = 0
			begin
			ExtendCrcPlayer (($Achievements_Table [<i>]).name) <player> out = ach_id
			spawnscriptlater achievement_test params = {($Achievements_Table [<i>]) player = <player> controller = <controller>} id = <ach_id>
			<i> = (<i> + 1)
			repeat <array_size>
			GetNextPlayer player = <player> local
			repeat <num_players>
		endif
	endif
endscript

script should_update_achievements 
	if NOT IsBandCheating
		GameMode_GetType
		if ((<type> != freeplay) && ($game_mode != training) && ($game_mode != practice) && (<type> != tutorial) && ($calibrate_lag_enabled = 0))
			return \{true}
		endif
	endif
	return \{false}
endscript

script song_won_update_achievements 
	GetNumPlayersInGame \{local}
	GetFirstPlayer \{local}
	if IsPS3
		song_won_update_achievement_counters player = <player>
		begin
		update_secret_phrases_hit player = <player>
		GetNextPlayer player = <player> local
		repeat <num_players>
	else
		begin
		song_won_update_achievement_counters player = <player>
		update_secret_phrases_hit player = <player>
		GetNextPlayer player = <player> local
		repeat <num_players>
	endif
	broadcastevent \{type = event_endsong_check_achievements}
endscript

script test_progression_based_achievements 
	GetNumPlayersInGame \{local}
	GetFirstPlayer \{local}
	if (<num_players> > 0)
		begin
		GetPlayerInfo <player> controller
		CreateAchievementRequirements controller = <controller> arr = Progression_Based_Achievements
		GetArraySize \{$Progression_Based_Achievements}
		i = 0
		begin
		achievement_test ($Progression_Based_Achievements [<i>]) player = <player> controller = <controller>
		<i> = (<i> + 1)
		repeat <array_size>
		GetNextPlayer player = <player> local
		repeat <num_players>
	endif
endscript

script kill_all_achievement_scripts 
	printscriptinfo \{qs(0xea0431ad)}
	GetArraySize \{$Achievements_Table}
	i = 0
	begin
	player = 1
	begin
	ExtendCrcPlayer (($Achievements_Table [<i>]).name) <player> out = ach_id
	killspawnedscript id = <ach_id>
	<player> = (<player> + 1)
	repeat 4
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script achievement_test 
	switch <fetcher>
		case GetNumPlayersInGame
		case GetPlayerInfo
		params = {player = <player> <Field>}
		case GetBandInfo
		GetPlayerInfo <player> Band
		params = {<Band> <Field>}
		case GetGlobalTags
		get_savegame_from_controller controller = <controller>
		params = {savegame = <savegame> param = <Field>}
		default
		params = {fetch_func = <fetcher> player = <player> controller = <controller> Field = <Field>}
		<fetcher> = FetchAchievementData
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
			Block \{type = event_endsong_check_achievements}
		endif
		<fetcher> <params> out = term_a
		if <condition_test> term_a = <term_a> term_b = <comparator>
			achievement_test_pass name = <name> controller = <controller>
		else
			ExtendCrcPlayer <name> <player> out = ach_id
			killspawnedscript id = <ach_id>
		endif
	endif
endscript

script dump_req_arr 
	GetArraySize \{$Achievements_Table}
	i = 0
	begin
	name = ($Achievements_Table [<i>].name)
	get_achievement_structure achievement_name = <name> controller = 0
	printstruct <achievement_structure>
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script achievement_test_pass 
	get_achievement_structure achievement_name = <name> controller = <controller>
	SetArrayElement arrayName = <achievement_structure> GlobalArray index = 1 newValue = (($<achievement_structure> [1]) + 1)
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
	FormatText TextName = controller_suffix '_%d' d = <controller>
	ExtendCrc <achievement_name> <controller_suffix> out = achievement_structure
	return achievement_structure = <achievement_structure>
endscript

script fire_achievement 
	printf qs(0x0bb6711e) s = <name> d = <controller>
	WriteAchievements achievement = <name> controller_Id = <controller>
endscript

script check_is_avatar 
	GetPlayerInfo <player> character_id
	get_savegame_from_controller controller = <controller>
	if is_avatar_character id = <character_id> savegame = <savegame>
		return \{is_avatar = 1}
	else
		return \{is_avatar = 0}
	endif
endscript

script get_song_completion_precentage 
	GMan_SongFunc \{func = get_current_song}
	GetSongTimeMs
	SongFileManager func = get_song_end_time song_name = <current_song>
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
	RequireParams \{[
			controller
		]
		all}
	get_savegame_from_controller controller = <controller>
	num_gigs_completed = 0
	gold_done = 0
	plat_done = 0
	diamond_done = 0
	band_done = 0
	num_total_gigs = 0
	GetArraySize \{$progression_gig_list}
	progression_list_size = <array_size>
	i = 0
	begin
	gig_list = ($progression_gig_list [<i>].gig_list)
	GetArraySize ($<gig_list>)
	gig_list_size = <array_size>
	j = 0
	begin
	goal_id = ($<gig_list> [<j>])
	GetGlobalTags <goal_id> savegame = <savegame>
	if (<completed> = 1)
		<num_gigs_completed> = (<num_gigs_completed> + 1)
	endif
	if (<completed_gold> = 1)
		<gold_done> = (<gold_done> + 1)
		GetArraySize ($<goal_id>.required_band)
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
	<num_total_gigs> = (<num_total_gigs> + 1)
	<j> = (<j> + 1)
	repeat <gig_list_size>
	<i> = (<i> + 1)
	repeat <progression_list_size>
	percent_complete = (((<num_gigs_completed> * 1.0) / <num_total_gigs>) * 100)
	printf qs(0xeebc501e) a = <num_gigs_completed> b = <num_total_gigs>
	return num_gold_challenges_completed = <gold_done> num_plat_challenges_completed = <plat_done> num_diamond_challenges_completed = <diamond_done> num_band_challenges_completed = <band_done> percent_complete = <percent_complete> num_gigs_completed = <num_gigs_completed>
endscript

script ach_get_difficulties 
	num_beginner = 0
	num_easy = 0
	num_medium = 0
	num_hard = 0
	num_expert = 0
	GetNumPlayersInGame
	GetFirstPlayer
	begin
	GetPlayerInfo <player> difficulty
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
		ScriptAssert qs(0xd06add8c) s = <part>
	endswitch
	GetNextPlayer player = <player>
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
	GetNumPlayersInGame
	GetFirstPlayer
	begin
	GetPlayerInfo <player> part
	switch <part>
		case guitar
		<num_guitars> = (<num_guitars> + 1)
		case bass
		<num_bass> = (<num_bass> + 1)
		case Drum
		<num_drums> = (<num_drums> + 1)
		case vocals
		<num_vocals> = (<num_vocals> + 1)
		default
		ScriptAssert qs(0x1aad6e58) s = <part>
	endswitch
	GetNextPlayer player = <player>
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
	GameMode_GetType
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
		ScriptAssert qs(0x66bb1769) s = <type>
	endswitch
	return <mode>
endscript

script completed_secret_phrase 
	RequireParams \{[
			player
			song
		]
		all}
	i = 0
	GetArraySize ($route_66)
	begin
	if checksumequals a = ($route_66 [<i>].song) b = <song>
		printf qs(0x474ee30b) d = <player> s = <song>
		GetPlayerInfo <player> part
		FormatText checksumname = last_song_stats 'p%p_last_song_detailed_stats' p = <player> AddToStringLookup = true
		FormatText checksumname = last_song_stats_max 'p%p_last_song_detailed_stats_max' p = <player> AddToStringLookup = true
		ExtendCrc <part> '_phrase_index' out = part_checksum
		secret_phrase_index = ($route_66 [<i>].<part_checksum>)
		printf qs(0xcf28d692) d = <secret_phrase_index>
		printstruct ($<last_song_stats>)
		printstruct ($<last_song_stats_max>)
		if (($<last_song_stats_max> [<secret_phrase_index>]) > 0)
			printf qs(0x057eaf51) a = ($<last_song_stats_max> [<secret_phrase_index>]) b = ($<last_song_stats> [<secret_phrase_index>])
			if ($<last_song_stats> [<secret_phrase_index>] = ($<last_song_stats_max> [<secret_phrase_index>]))
				printf \{qs(0x79060fae)}
				return true index = <i> secret_phrase_bit = ($route_66 [<i>].secret_phrase_bit)
			else
				printf qs(0x1a163bcd) a = ($<last_song_stats> [<secret_phrase_index>]) b = ($<last_song_stats_max> [<secret_phrase_index>])
				return \{false}
			endif
		endif
	endif
	i = (<i> + 1)
	repeat <array_size>
	return \{false}
endscript

script song_won_update_achievement_counters 
	GameMode_GetType
	GetNumPlayersInGame
	get_savegame_from_player player = <player>
	achievement_global_tags = {}
	if (($is_network_game = 1) && (<type> = competitive) && ($competitive_rules = faceoff))
		GetGlobalTags achievement_info savegame = <savegame> param = online_pro_faceoff_games_played
		achievement_global_tags = {<achievement_global_tags> online_pro_faceoff_games_played = (<online_pro_faceoff_games_played> + 1)}
	endif
	printf qs(0x7507ebe3) d = <player> a = <savegame>
	printstruct <achievement_global_tags>
	SetGlobalTags achievement_info savegame = <savegame> params = <achievement_global_tags>
endscript

script update_secret_phrases_hit 
	get_savegame_from_player player = <player>
	secret_phrase_global_tags = {}
	song = ($last_song_played)
	if completed_secret_phrase song = <song> player = <player>
		if (<index> < 7)
			GetGlobalTags achievement_info savegame = <savegame> param = secret_phrase_bitflag_0
			<secret_phrase_bitflag_0> = (<secret_phrase_bitflag_0> || <secret_phrase_bit>)
			secret_phrase_global_tags = {secret_phrase_bitflag_0 = <secret_phrase_bitflag_0>}
		elseif (<index> < 14)
			GetGlobalTags achievement_info savegame = <savegame> param = secret_phrase_bitflag_1
			<secret_phrase_bitflag_1> = (<secret_phrase_bitflag_1> || <secret_phrase_bit>)
			secret_phrase_global_tags = {secret_phrase_bitflag_1 = <secret_phrase_bitflag_1>}
		else
			GetGlobalTags achievement_info savegame = <savegame> param = secret_phrase_bitflag_2
			<secret_phrase_bitflag_2> = (<secret_phrase_bitflag_2> || <secret_phrase_bit>)
			secret_phrase_global_tags = {secret_phrase_bitflag_2 = <secret_phrase_bitflag_2>}
		endif
		GetPlayerInfo <player> controller
		ExtendCrc <song> '_SecretPhrase_Achievement' out = achievement_name
		fire_achievement name = <achievement_name> controller = <controller>
	endif
	printf qs(0x859845ec) d = <player> a = <savegame>
	printstruct <secret_phrase_global_tags>
	SetGlobalTags achievement_info savegame = <savegame> params = <secret_phrase_global_tags>
endscript

script ach_route66_test 
	get_savegame_from_controller controller = <controller>
	passed = 0
	GetGlobalTags savegame = <savegame> achievement_info
	printf qs(0x108b11d6) a = <secret_phrase_bitflag_0> b = <secret_phrase_bitflag_1> c = <secret_phrase_bitflag_2>
	if (((17895697 && <secret_phrase_bitflag_0>) = 17895697) && ((17895697 && <secret_phrase_bitflag_1>) = 17895697) && ((17895697 && <secret_phrase_bitflag_2>) = 17895697))
		<passed> = 1
	endif
	return passed = <passed>
endscript

script ach_welcome_to_band_hero_test 
	RequireParams \{[
			controller
			savegame
		]
		all}
	GetArraySize ($tutorial_headers)
	tutorial_header_size = <array_size>
	passed = 1
	i = 0
	begin
	tutorial_header = ($tutorial_headers [<i>])
	FormatText checksumname = tutorial_array '%s_tutorials' s = <tutorial_header>
	GetArraySize ($<tutorial_array>)
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
		fire_achievement name = Achievement_WelcomeToBandHero controller = <controller>
	endif
endscript

script ach_till_death_do_us_part_test 
	GameMode_GetType
	if (($is_network_game) && (<type> = competitive) && ($competitive_rules = do_or_die))
		return \{passed = 1}
	else
		return \{passed = 0}
	endif
endscript

script ach_mc_test 
	passed = 0
	if ($is_network_game = 1)
		GameMode_GetType
		if (<type> = career)
			if IsHost
				<passed> = 1
			endif
		endif
	endif
	return passed = <passed>
endscript

script ach_fullcombo_test 
	printf \{qs(0xd1e7bf0d)}
	GetPlayerInfo <player> part
	GMan_SongFunc \{func = get_current_song}
	passed = 1
	if (<current_song> = jamsession)
		<passed> = 0
	else
		GetSongTimeMs
		SongFileManager func = get_song_end_time song_name = <current_song>
		if ((<total_end_time> <= 0) || (<time> < <total_end_time>))
			printf \{qs(0x9cc42b43)}
			<passed> = 0
		else
			if (<part> != vocals)
				GetPlayerInfo <player> notes_hit
				GetPlayerInfo <player> total_notes
				GetPlayerInfo <player> max_notes
				GetPlayerInfo <player> unnecessary_notes
				if ((<notes_hit> < <total_notes>) || (<total_notes> = 0) || (<unnecessary_notes> > 0))
					printf \{qs(0xdf882bd6)}
					<passed> = 0
				endif
			else
				GetPlayerInfo <player> vocal_phrase_quality
				GetPlayerInfo <player> vocal_phrase_max_qual
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

script ach_testingthewaters_test 
	list_array = ($on_disc_list)
	GetArraySize ($<list_array>)
	get_savegame_from_controller controller = <controller>
	if (<array_size> > 0)
		i = 0
		begin
		GetGlobalTags (($<list_array>) [<i>]) savegame = <savegame> param = completed
		printf qs(0xa6438174) a = <i> b = (($<list_array>) [<i>]) c = <completed>
		if (<completed> = 0)
			return \{passed = 0}
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	return \{passed = 1}
endscript

script ach_fourofakind_test 
	GetNumPlayersInGame
	GameMode_GetType
	passed = 1
	if NOT (<num_players> = 4)
		<passed> = 0
	else
		GetPlayerInfo \{1
			part}
		instrument = <part>
		<player> = 1
		begin
		GetPlayerInfo <player> part
		if NOT (<instrument> = <part>)
			<passed> = 0
			break
		endif
		GetNextPlayer player = <player>
		repeat <num_players>
	endif
	return passed = <passed>
endscript

script ach_jackofalltrades_test 
	completed_lead_gold = 0
	completed_bass_gold = 0
	completed_drum_gold = 0
	completed_vocals_gold = 0
	get_savegame_from_controller controller = <controller>
	GetArraySize \{$progression_gig_list}
	progression_list_size = <array_size>
	i = 0
	begin
	gig_list = ($progression_gig_list [<i>].gig_list)
	GetArraySize ($<gig_list>)
	gig_list_size = <array_size>
	j = 0
	begin
	goal_id = ($<gig_list> [<j>])
	GetGlobalTags <goal_id> savegame = <savegame>
	if (<completed_gold> = 1)
		GetArraySize ($<goal_id>.required_band)
		if (<array_size> = 1)
			switch ($<goal_id>.required_band [0])
				case lead
				<completed_lead_gold> = (<completed_lead_gold> + 1)
				case bass
				<completed_bass_gold> = (<completed_bass_gold> + 1)
				case Drum
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

script ach_road_most_traveled_test 
	get_savegame_from_controller controller = <controller>
	get_LevelZoneArray_size
	array_count = 0
	begin
	get_LevelZoneArray_checksum index = <array_count>
	if NOT StructureContains structure = ($LevelZones.<level_checksum>) debug_only
		FormatText checksumname = venue_checksum 'venue_%s' s = ($LevelZones.<level_checksum>.name)
		GetGlobalTags savegame = <savegame> <venue_checksum>
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
		GetPlayerInfo <player> score
		GetPlayerInfo <player> sp_points
		point_diff = (<score> - <sp_points>)
		if (<point_diff> > 10000)
			GetPlayerInfo <player> controller
			fire_achievement name = Achievement_StarLightStarBright controller = <controller>
		endif
	endif
endscript

script ach_nicetomeetyou_test 
	RequireParams \{[
			controller
		]
		all}
	printf qs(0xecfcba88) d = <controller>
	passed = 0
	get_savegame_from_controller controller = <controller>
	celeb_gigs = [
		c_DontSpeak
		c_JustAGirl
		c_LoveStory
		c_SheWillBeLoved
	]
	<passed> = 1
	GetArraySize <celeb_gigs>
	i = 0
	begin
	GetGlobalTags (<celeb_gigs> [<i>]) savegame = <savegame>
	if NOT (<completed> = 1)
		printf qs(0x39d5f5e7) s = (<celeb_gigs> [<i>])
		<passed> = 0
		break
	endif
	printf qs(0x0e605620) s = (<celeb_gigs> [<i>])
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
	GetNumPlayersInGame \{on_screen}
	num_lead = 0
	num_bass = 0
	num_vocal = 0
	num_drum = 0
	if (<num_players_shown> = 4)
		GetFirstPlayer \{on_screen}
		begin
		GetPlayerInfo <player> part
		switch <part>
			case guitar
			<num_lead> = (<num_lead> + 1)
			case bass
			<num_bass> = (<num_bass> + 1)
			case vocals
			<num_vocal> = (<num_vocal> + 1)
			case Drum
			<num_drum> = (<num_drum> + 1)
			default
			ScriptAssert qs(0x03695c6c) s = <part>
		endswitch
		GetNextPlayer player = <player> on_screen
		repeat <num_players_shown>
		printstruct <...>
		if ((<num_lead> = 1) && (<num_bass> = 1) && (<num_vocal> = 1) && (<num_drum> = 1))
			return \{true}
		endif
	endif
	return \{false}
endscript

script Achievements_IsCheating 
	if ($Cheat_AutoKick = 1 || $Cheat_FreeDrum = 1)
		GetNumPlayersInGame \{local}
		GetFirstPlayer \{local}
		begin
		GetPlayerInfo <player> part
		if (<part> = Drum)
			printf \{qs(0x90144029)}
			return \{true}
		endif
		GetNextPlayer player = <player> local
		repeat <num_players>
	endif
	if ($Cheat_AlwaysSlide = 1)
		GetNumPlayersInGame \{local}
		GetFirstPlayer \{local}
		begin
		GetPlayerInfo <player> part
		if (<part> = guitar)
			printf \{qs(0x90144029)}
			return \{true}
		endif
		GetNextPlayer player = <player> local
		repeat <num_players>
	endif
	return \{false}
endscript

script Achievements_IsCheatingAutoKick 
	if ($Cheat_AutoKick != 1 && $Cheat_FreeDrum != 1)
		return \{false}
	endif
	GetNumPlayersInGame \{on_screen}
	if (<num_players_shown> > 0)
		GetFirstPlayer \{on_screen}
		begin
		GetPlayerInfo <player> part
		if (<part> = Drum)
			printf \{qs(0x90144029)}
			return \{true}
		endif
		GetNextPlayer on_screen player = <player>
		repeat <num_players_shown>
	endif
	return \{false}
endscript
