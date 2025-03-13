gstar_power_triggered = 0
achievements_table = [
	{
		name = achievement_thestreak
		fetcher = getplayerinfo
		field = current_run
		comparator = 1001
		condition_test = ach_check_greater_than_equal_to
		check_time = during_song
	}
	{
		name = achievement_ironlungs
		fetcher = getplayerinfo
		field = part
		comparator = vocals
		condition_test = ach_check_equality
		check_time = begin_song
	}
	{
		name = achievement_ironlungs
		fetcher = getplayerinfo
		field = current_run
		comparator = 250
		condition_test = ach_check_greater_than_equal_to
		check_time = during_song
	}
	{
		name = achievement_crankituptoeleven
		fetcher = getbandinfo
		field = current_mult
		comparator = 11
		condition_test = ach_check_equality
		check_time = during_song
	}
	{
		name = achievement_crankituptoeleven
		fetcher = check_is_standard_band
		field = standard_band
		comparator = 1
		condition_test = ach_check_equality
		check_time = begin_song
	}
	{
		name = achievement_crowdpleaser
		fetcher = getplayerinfo
		field = current_health
		comparator = 2.0
		condition_test = ach_check_greater_than_equal_to
		check_time = during_song
	}
	{
		name = achievement_crowdpleaser
		fetcher = get_gametype_bitfield
		field = mode
		comparator = 4353
		condition_test = ach_compare_nibbles
		check_time = begin_song
	}
	{
		name = achievement_seniorcommander
		fetcher = ach_get_song_stars
		field = stars
		comparator = 5
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		name = achievement_seniorcommander
		fetcher = get_gametype_bitfield
		field = mode
		comparator = 4353
		condition_test = ach_compare_nibbles
		check_time = begin_song
	}
	{
		name = achievement_seniorcommander
		fetcher = gman_songtool_getcurrentsong
		field = current_song
		comparator = jamsession
		condition_test = ach_check_not_equal
		check_time = begin_song
	}
	{
		name = achievement_aboveandbeyond
		fetcher = get_average_multiplier
		field = average_multiplier
		comparator = 4
		condition_test = ach_check_greater_than
		check_time = end_song
	}
	{
		name = achievement_aboveandbeyond
		fetcher = get_gametype_bitfield
		field = mode
		comparator = 4353
		condition_test = ach_compare_nibbles
		check_time = begin_song
	}
	{
		name = achievement_scorebig
		fetcher = getnumplayersingame
		field = num_players
		comparator = 1
		condition_test = ach_check_equality
		check_time = begin_song
	}
	{
		name = achievement_scorebig
		fetcher = getplayerinfo
		field = score
		comparator = 500000
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		name = achievement_scorebigger
		fetcher = getbandinfo
		field = score
		comparator = 1000000
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		name = achievement_scorebiggest
		fetcher = getbandinfo
		field = score
		comparator = 3000000
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		name = achievement_barbershop
		fetcher = get_band_config
		field = num_vocals
		comparator = 4
		condition_test = ach_check_equality
		check_time = begin_song
	}
	{
		name = achievement_drumline
		fetcher = get_band_config
		field = num_drums
		comparator = 4
		condition_test = ach_check_equality
		check_time = begin_song
	}
	{
		name = achievement_stringquartet
		fetcher = get_band_config
		field = num_guitars
		comparator = 4
		condition_test = ach_check_equality
		check_time = begin_song
	}
	{
		name = achievement_allfourbasearebelongtous
		fetcher = get_band_config
		field = num_bass
		comparator = 4
		condition_test = ach_check_equality
		check_time = begin_song
	}
	{
		name = achievement_synchronized
		fetcher = get_achievement_info
		field = band_moments_completed
		comparator = 20
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		name = achievement_festquartetquest
		fetcher = get_achievement_info
		field = four_player_shredfest_games_played
		comparator = 10
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		name = achievement_whatsanlp
		fetcher = get_achievement_info
		field = quickplay_songs_completed
		comparator = 14
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		name = achievement_boxset
		fetcher = get_achievement_info
		field = quickplay_songs_completed
		comparator = 100
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		name = achievement_jukebox
		fetcher = get_achievement_info
		field = quickplay_songs_completed
		comparator = 300
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		name = achievement_outgoing
		fetcher = get_achievement_info
		field = online_pro_faceoff_games_played
		comparator = 25
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		name = achievement_chanteuse
		fetcher = ach_chanteuse_test
		field = passed
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_specialguest
		fetcher = getplayerinfo
		field = character_id
		comparator = avatar
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_nomistakesallowed
		fetcher = ach_nomistakesallowed_test
		field = passed
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_nomistakesallowed
		fetcher = get_gametype_bitfield
		field = mode
		comparator = 4352
		condition_test = ach_compare_nibbles
		check_time = begin_song
	}
	{
		name = achievement_openminded
		fetcher = ach_openminded_test
		field = passed
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_octuplets
		fetcher = ach_octuplets_test
		field = passed
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_rocktopus
		fetcher = ach_rocktopus_test
		field = passed
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_kirshnerreborn
		fetcher = ach_kirshnerreborn_test
		field = passed
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_samplerplate
		fetcher = ach_sampler_plate_test
		field = passed
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_starmony
		fetcher = check_is_standard_band
		field = standard_band
		comparator = 1
		condition_test = ach_check_equality
		check_time = begin_song
	}
	{
		name = achievement_starmony
		fetcher = num_players_in_star_power
		field = players_in_star_power
		comparator = 4
		condition_test = ach_check_equality
		check_time = during_song
	}
	{
		name = achievement_didyoufaillikewedid
		fetcher = gman_songtool_getcurrentsong
		field = current_song
		comparator = doyoufeellikewedo
		condition_test = ach_check_equality
		check_time = begin_song
	}
	{
		name = achievement_didyoufaillikewedid
		fetcher = ach_test_didyoufail
		field = passed
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_didyoufaillikewedid
		fetcher = get_gametype_bitfield
		field = mode
		comparator = 4352
		condition_test = ach_compare_nibbles
		check_time = begin_song
	}
	{
		name = achievement_playittothebone
		fetcher = ach_play_it_to_the_bone_test
		field = passed
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
]
progression_based_achievements = [
	{
		name = achievement_youngstar
		fetcher = get_progression_stars
		field = total_stars
		comparator = 25
		condition_test = ach_check_greater_than_equal_to
		check_time = progression_update
	}
	{
		name = achievement_risingstar
		fetcher = get_progression_stars
		field = total_stars
		comparator = 101
		condition_test = ach_check_greater_than_equal_to
		check_time = progression_update
	}
	{
		name = achievement_shootingstar
		fetcher = get_progression_stars
		field = total_stars
		comparator = 303
		condition_test = ach_check_greater_than_equal_to
		check_time = progression_update
	}
	{
		name = achievement_superstar
		fetcher = get_progression_stars
		field = total_stars
		comparator = 505
		condition_test = ach_check_greater_than_equal_to
		check_time = progression_update
	}
	{
		name = achievement_starcluster
		fetcher = get_progression_stars
		field = total_stars
		comparator = 808
		condition_test = ach_check_greater_than_equal_to
		check_time = progression_update
	}
	{
		name = achievement_youwantmore
		fetcher = ach_youwantmore_test
		field = passed
		comparator = 1
		condition_test = ach_check_equality
		check_time = progression_update
	}
	{
		name = achievement_representative
		fetcher = ach_representative_test
		field = passed
		comparator = 1
		condition_test = ach_check_equality
		check_time = progression_update
	}
	{
		name = achievement_goinggold
		fetcher = get_num_challenges_completed
		field = num_gold_challenges_completed
		comparator = 50
		condition_test = ach_check_greater_than_equal_to
		check_time = progression_update
	}
	{
		name = achievement_goingplatinum
		fetcher = get_num_challenges_completed
		field = num_plat_challenges_completed
		comparator = 50
		condition_test = ach_check_greater_than_equal_to
		check_time = progression_update
	}
	{
		name = achievement_goingdiamond
		fetcher = get_num_challenges_completed
		field = num_diamond_challenges_completed
		comparator = 50
		condition_test = ach_check_greater_than_equal_to
		check_time = progression_update
	}
	{
		name = achievement_challengeofthesupergroup
		fetcher = get_num_challenges_completed
		field = num_band_challenges_completed
		comparator = 5
		condition_test = ach_check_greater_than_equal_to
		check_time = progression_update
	}
	{
		name = achievement_quadruplethreat
		fetcher = ach_quadruplethreat_test
		field = passed
		comparator = 1
		condition_test = ach_check_equality
		check_time = progression_update
	}
	{
		name = achievement_thegrandtour
		fetcher = ach_grand_tour_test
		field = passed
		comparator = 1
		condition_test = ach_check_equality
		check_time = progression_update
	}
	{
		name = achievement_starstruck
		fetcher = ach_starstruck_test
		field = passed
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
	if NOT achievements_ischeating
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
		song_won_update_achievement_counters \{player = 1}
	else
		begin
		song_won_update_achievement_counters player = <player>
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
		case num_players_in_star_power
		getfirstplayer \{on_screen}
		params = {player = <player>}
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
	printf qs(0x66aa720a) s = <name>
	writeachievements achievement = <name> controller_id = <controller>
endscript

script get_num_challenges_completed 
	requireparams \{[
			controller
		]
		all}
	get_savegame_from_controller controller = <controller>
	gold_done = 0
	plat_done = 0
	diamond_done = 0
	band_done = 0
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
	<j> = (<j> + 1)
	repeat <gig_list_size>
	<i> = (<i> + 1)
	repeat <progression_list_size>
	return num_gold_challenges_completed = <gold_done> num_plat_challenges_completed = <plat_done> num_diamond_challenges_completed = <diamond_done> num_band_challenges_completed = <band_done>
endscript

script ach_get_song_stars 
	getplayerinfo <player> band
	getbandinfo <band> projected_song_stars
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

script song_won_update_achievement_counters 
	gamemode_gettype
	getnumplayersingame
	get_savegame_from_player player = <player>
	achievement_global_tags = {}
	switch (<type>)
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
			case perfectionist
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
			scriptassert qs(0xa6d815a7) s = ($competitive_rules)
		endswitch
		case career
		achievement_global_tags = {<achievement_global_tags> played_career = 1}
		case freeplay
		printf \{qs(0x89ed9637)}
		default
		scriptassert qs(0xa6d815a7) s = <type>
	endswitch
	if (<type> = quickplay)
		getglobaltags achievement_info savegame = <savegame> param = quickplay_songs_completed
		achievement_global_tags = {<achievement_global_tags> quickplay_songs_completed = (<quickplay_songs_completed> + 1)}
	elseif (($is_network_game = 1) && (<type> = competitive) && ($competitive_rules = faceoff))
		getglobaltags achievement_info savegame = <savegame> param = online_pro_faceoff_games_played
		achievement_global_tags = {<achievement_global_tags> online_pro_faceoff_games_played = (<online_pro_faceoff_games_played> + 1)}
	endif
	if (($game_mode = fest_mode) && (<num_players> = 4))
		getglobaltags achievement_info savegame = <savegame> param = four_player_shredfest_games_played
		achievement_global_tags = {<achievement_global_tags> four_player_shredfest_games_played = (<four_player_shredfest_games_played> + 1)}
	endif
	if ((<type> = quickplay) || (<type> = career))
		getplayerinfo <player> part
		if (<part> = vocals)
			getplayerinfo player = <player> stars
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
	printf qs(0x7507ebe3) d = <player> a = <savegame>
	printstruct <achievement_global_tags>
	setglobaltags achievement_info savegame = <savegame> params = <achievement_global_tags>
endscript

script ach_chanteuse_test 
	get_savegame_from_controller controller = <controller>
	getglobaltags achievement_info savegame = <savegame> param = five_starred_exgirlfriend
	getglobaltags achievement_info savegame = <savegame> param = five_starred_lovetoken
	getglobaltags achievement_info savegame = <savegame> param = five_starred_onlyhappywhenitrains
	if ((<five_starred_exgirlfriend> = 1) && (<five_starred_lovetoken> = 1) && (<five_starred_onlyhappywhenitrains> = 1))
		return \{passed = 1}
	else
		return \{passed = 0}
	endif
endscript

script ach_specialguest_test 
	getplayerinfo <player> character_id
	get_savegame_from_player player = <player>
	if is_avatar_character id = <character_id> savegame = <savegame>
		return \{passed = 1}
	else
		return \{passed = 0}
	endif
endscript

script ach_nomistakesallowed_test 
	getplayerinfo <player> part
	gman_songfunc \{func = get_current_song}
	passed = 1
	if (<current_song> = jamsession)
		<passed> = 0
	else
		if (<part> != vocals)
			getplayerinfo <player> notes_hit
			getplayerinfo <player> total_notes
			getplayerinfo <player> max_notes
			getplayerinfo <player> unnecessary_notes
			if ((<notes_hit> < <max_notes>) || (<total_notes> = 0) || (<unnecessary_notes> > 0))
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
	return passed = <passed>
endscript

script ach_openminded_test 
	getarraysize \{$gh5_songlist}
	get_savegame_from_controller controller = <controller>
	if (<array_size> > 0)
		i = 0
		begin
		getglobaltags ($gh5_songlist [<i>]) savegame = <savegame> param = completed
		printf qs(0xc904a8ec) a = <i> b = ($gh5_songlist [<i>]) c = <completed>
		if (<completed> = 0)
			return \{passed = 0}
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	return \{passed = 1}
endscript

script ach_octuplets_test 
	getnumplayersingame
	gamemode_gettype
	passed = 0
	if (($is_network_game = 1) && (<num_players> = 8) && (<type> = competitive))
		getplayerinfo \{1
			part}
		instrument = <part>
		<passed> = 1
		<player> = 1
		begin
		getplayerinfo <player> part
		if NOT (<instrument> = <part>)
			<passed> = 0
			break
		endif
		<player> = (<player> + 1)
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

script ach_grand_tour_test 
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

script ach_kirshnerreborn_test 
	gamemode_gettype
	if ((<type> = career) || (<type> = quickplay))
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
	getarraysize \{$gig_sponsors}
	i = 0
	begin
	getglobaltags ($gig_sponsors [<i>]) savegame = <savegame>
	if (<completed_diamond> = 1)
		return \{passed = 1}
	endif
	<i> = (<i> + 1)
	repeat <array_size>
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
	getsongtimems
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
	getarraysize \{$gig_encores}
	encores_passed = 0
	i = 0
	begin
	getglobaltags ($gig_encores [<i>]) savegame = <savegame>
	if (<completed> = 1)
		<encores_passed> = (<encores_passed> + 1)
		if (<encores_passed> = 5)
			return \{passed = 1}
		endif
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	return \{passed = 0}
endscript

script ach_sampler_plate_test 
	get_savegame_from_controller controller = <controller>
	getglobaltags achievement_info savegame = <savegame>
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
		getplayerinfo <player> score
		getplayerinfo <player> sp_points
		point_diff = (<score> - <sp_points>)
		if (<point_diff> > 9000)
			getplayerinfo <player> controller
			fire_achievement name = achievement_over19000 controller = <controller>
		endif
	endif
endscript

script ach_starstruck_test 
	requireparams \{[
			controller
		]
		all}
	printf qs(0xecfcba88) d = <controller>
	passed = 0
	get_savegame_from_controller controller = <controller>
	getglobaltags unlocked_profiles savegame = <savegame>
	if gotparam \{unlocked_profiles}
		indices = [0 1 3 6 8]
		<passed> = 1
		getarraysize <indices>
		i = 0
		begin
		profile_index = (<indices> [<i>])
		if NOT arraycontains array = <unlocked_profiles> contains = ($preset_musician_profiles_locked [<profile_index>].name)
			printstruct <...>
			printf qs(0x35898d04) s = ($preset_musician_profiles_locked [<profile_index>].name)
			<passed> = 0
			break
		endif
		printf qs(0xd0e593f5) s = ($preset_musician_profiles_locked [<profile_index>].name)
		<i> = (<i> + 1)
		repeat <array_size>
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
	getplayerinfo <player> star_power_used
	if (<star_power_used> = 1)
		<players_in_star_power> = (<players_in_star_power> + 1)
	else
		break
	endif
	getnextplayer player = <player> on_screen
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
