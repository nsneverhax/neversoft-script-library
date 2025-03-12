gstar_power_triggered = 0
achievement_scripts = [
	achievements_the_more_i_see
	achievements_metallica
	achievements_james_hetfield
	achievements_lars_ulrich
	achievements_kirk_hammet
	achievements_robert_trujillo
	achievements_holier_than_thou
	achievements_one
	achievements_and_justice_for_all
	achievements_the_ecstacy_of_gold
	achievements_damage_inc
	achievements_motorbreath
	achievements_some_kind_of_monster
	achievements_invisible_kid
	achievements_ride_the_lightning
	achievements_2x4
	achievements_metal_militia
	achievements_master_of_puppets
	achievements_the_struggle_within
	achievements_the_four_horsemen
	achievements_nothing_else_matters
	achievements_black
	achievements_better_than_you
	achievements_blitzkrieg
	achievements_seek_and_destroy
	achievements_the_unforgiven
	achievements_the_unforgiven_ii
	achievements_the_unforgiven_iii
	achievements_reload
	achievements_cure
	achievements_green_hell
	achievements_disposable_heroes
	achievements_blackened
	achievements_eye_of_the_beholder
	achievements_fixxxer
	achievements_hero_of_the_day
	achievements_the_house_jack_built
	achievements_wherever_i_may_roam
	achievements_trapped_under_ice
	achievements_stone_dead_forever
	achievements_king_diamond
	achievements_lemmy
	achievements_the_memory_remains
	achievements_creeping_death
	achievements_dyers_eve
	achievements_fight_fire_with_fire
	achievements_stone_cold_crazy
	achievements_enter_sandman
	achievements_battery
	achievements_astronomy
]

script achievements_update 
	return
	if achievements_ischeating
		return
	endif
	getarraysize \{$achievement_scripts}
	printf qs(0x90881b0e) n = ($achievements_songcompleteflag)
	printf qs(0x026acf46) n = ($achievements_songwonflag)
	determine_game_scores_and_winner
	printf qs(0x09667ec7) n = <team_score>
	printf qs(0x29c1b0ec) n = <opponent_team_score>
	printf qs(0x5f65d94c) b = <tie>
	<i> = 0
	begin
	<scr> = ($achievement_scripts [<i>])
	<scr>
	<i> = (<i> + 1)
	repeat <array_size>
endscript
achievements_songcompleteflag = 0
achievements_songwonflag = 0
achievements_newgigwonflag = 0
achievements_2x4_flag = 0
achievements_ride_the_lightning_flag = 0
achievements_super_group_unite_flag = 0
achievements_creating_character = 0
achievements_modified_logo = 0
achievements_ignore_bots = 0

script achievements_resetglobals 
	change \{achievements_songwonflag = 0}
	change \{achievements_newgigwonflag = 0}
	change \{achievements_2x4_flag = 0}
	change \{achievements_ride_the_lightning_flag = 0}
	change \{achievements_super_group_unite_flag = 0}
	change \{achievements_creating_character = 0}
	change \{achievements_modified_logo = 0}
	change \{achievements_ignore_bots = 0}
endscript

script achievements_issongwon 
	if ($achievements_songwonflag = 1)
		return \{true}
	endif
	printf \{qs(0x5ef4d603)}
	return \{false}
endscript

script achievements_issongcompleted 
	if ($achievements_songcompleteflag = 1)
		return \{true}
	endif
	printf \{qs(0xfd6328a8)}
	return \{false}
endscript

script achievements_isnewgigwon 
	if ($achievements_newgigwonflag = 1)
		return \{true}
	endif
	return \{false}
endscript

script achievements_areanygigswon \{part = 'guitar'}
	formattext checksumname = career_part_struct 'gh4_career_%p_songs' p = <part>
	<total_gigs> = ($<career_part_struct>.num_tiers)
	<i> = 1
	begin
	formattext checksumname = career_part_gig 'career_%p_gig%n' p = <part> n = <i>
	getglobaltags <career_part_gig>
	if (<completed> = 1)
		return \{true}
	endif
	<i> = (<i> + 1)
	repeat <total_gigs>
	return \{false}
endscript

script achievements_numgigswon \{part = 'guitar'}
	formattext checksumname = player_status 'player%n_status' n = <player>
	get_savegame_from_controller controller = ($<player_status>.controller)
	formattext checksumname = career_part_struct 'gh4_career_%p_songs' p = <part>
	<total_gigs> = ($<career_part_struct>.num_tiers)
	<num_crucial_gigs> = 0
	<num_gigs_won> = 0
	<i> = 1
	begin
	formattext checksumname = career_part_gig 'career_%p_gig%n' p = <part> n = <i>
	getglobaltags <career_part_gig> savegame = <savegame>
	formattext checksumname = tier 'tier%n' n = <i>
	if NOT structurecontains structure = ($<career_part_struct>.<tier>) paytoplay
		if NOT structurecontains structure = ($<career_part_struct>.<tier>) debug_gig
			if NOT structurecontains structure = ($<career_part_struct>.<tier>) createagig
				<num_crucial_gigs> = (<num_crucial_gigs> + 1)
				if (<completed> = 1)
					<num_gigs_won> = (<num_gigs_won> + 1)
				endif
			endif
		endif
	endif
	<i> = (<i> + 1)
	repeat <total_gigs>
	return num_gigs_won = <num_gigs_won> total_gigs = <num_crucial_gigs>
endscript

script achievements_numgigswonondiff \{part = 'guitar'
		diff = expert}
	formattext checksumname = player_status 'player%n_status' n = <player>
	get_savegame_from_controller controller = ($<player_status>.controller)
	formattext checksumname = career_part_struct 'gh4_career_%p_songs' p = <part>
	<total_gigs> = ($<career_part_struct>.num_tiers)
	<num_crucial_gigs> = 0
	<num_gigs_won> = 0
	<diff_array> = []
	switch (<diff>)
		case easy
		<diff_array> = [easy medium hard expert]
		case medium
		<diff_array> = [medium hard expert]
		case hard
		<diff_array> = [hard expert]
		case expert
		<diff_array> = [expert]
		default
		<diff_array> = [easy]
	endswitch
	<i> = 1
	begin
	formattext checksumname = career_part_gig 'career_%p_gig%n' p = <part> n = <i>
	getglobaltags <career_part_gig> savegame = <savegame>
	formattext checksumname = tier 'tier%n' n = <i>
	if NOT structurecontains structure = ($<career_part_struct>.<tier>) paytoplay
		if NOT structurecontains structure = ($<career_part_struct>.<tier>) debug_gig
			if NOT structurecontains structure = ($<career_part_struct>.<tier>) createagig
				<num_crucial_gigs> = (<num_crucial_gigs> + 1)
				getarraysize ($<career_part_struct>.<tier>.songs)
				<num_required> = <array_size>
				<song_size> = <array_size>
				<array_entry> = 0
				begin
				getarraysize <diff_array>
				<diff_size> = <array_size>
				<diff_index> = 0
				begin
				<diff> = (<diff_array> [<diff_index>])
				format_globaltag_song_checksum part = ($<career_part_struct>.part) song = ($<career_part_struct>.<tier>.songs [<array_entry>]) difficulty = <diff>
				getglobaltags <song_checksum> params = stars
				if (<stars> > 2)
					<num_required> = (<num_required> - 1)
					break
				endif
				<diff_index> = (<diff_index> + 1)
				repeat <diff_size>
				<array_entry> = (<array_entry> + 1)
				repeat <song_size>
				if (<num_required> <= 0)
					<num_gigs_won> = (<num_gigs_won> + 1)
				endif
			endif
		endif
	endif
	<i> = (<i> + 1)
	repeat <total_gigs>
	return num_gigs_won = <num_gigs_won> total_gigs = <num_crucial_gigs>
endscript

script achievements_careercomplete \{part = guitar
		player = 1}
	getplayerinfo <player> bot_play
	if (<bot_play> = 1)
		return \{complete = 0}
	endif
	if isxenon
		getplayerinfo <player> controller
		if NOT checkforsignin local controller_index = <controller>
			return \{complete = 0}
		endif
	endif
	switch <part>
		case guitar
		tier_global = gh4_career_guitar_songs
		case bass
		tier_global = gh4_career_bass_songs
		case drum
		tier_global = gh4_career_drum_songs
		case vocals
		tier_global = gh4_career_vocals_songs
		case band
		tier_global = gh4_career_band_songs
		default
		printf \{qs(0xfd92de4d)}
		return \{complete = 0}
	endswitch
	getplayerinfo <player> controller
	get_savegame_from_controller controller = <controller>
	gamemode_getnumplayersshown
	if (<num_players_shown> > 1 && <controller> != ($band_mode_current_leader))
		printf qs(0x9d060324) n = <player>
		return \{complete = 0}
	endif
	if gotparam \{difficulty}
		format_globaltag_song_checksum part_text = ($part_list_props.<part>.text_nl) song = thethingthat difficulty = <difficulty>
		getglobaltags <song_checksum> param = stars savegame = <savegame>
		printf qs(0x39bedc44) s = <stars>
		if (<stars> >= 3)
			return \{complete = 1}
		endif
	else
		getarraysize ($difficulty_list)
		<i> = 0
		begin
		format_globaltag_song_checksum part_text = ($part_list_props.<part>.text_nl) song = thethingthat difficulty_index = <i>
		getglobaltags <song_checksum> param = stars savegame = <savegame>
		printf qs(0x39bedc44) s = <stars>
		if (<stars> >= 3)
			return \{complete = 1}
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	return \{complete = 0}
endscript

script achievements_getpartstring 
	switch (<part>)
		case guitar
		return \{part_string = 'guitar'}
		case bass
		return \{part_string = 'bass'}
		case drum
		return \{part_string = 'drum'}
		case vocals
		return \{part_string = 'vocals'}
		case none
		return \{part_string = 'none'}
		default
		return \{part_string = 'none'}
	endswitch
endscript

script achievements_awardplayer 
	if ($achievements_ignore_bots = 0)
		getplayerinfo <player> bot_play
		if (<bot_play> = 1)
			return
		endif
	endif
	getplayerinfo <player> part
	if (<part> = vocals)
		if ($current_song != jamsession)
			if structurecontains structure = ($permanent_songlist_props.($current_song)) doesnt_support_vocals
				return
			endif
		endif
	endif
	formattext checksumname = player_status 'player%n_status' n = <player>
	<controller> = ($<player_status>.controller)
	writeachievements achievement = <achievement> controller_id = <controller>
	printf qs(0x41f01db8) n = <player> c = <controller>
endscript

script achievements_awardband 
	gamemode_getnumplayersshown
	<player> = 1
	begin
	achievements_awardplayer achievement = <achievement> player = <player>
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_checkforbandstreak 
	if ($achievements_2x4_flag = 0 && ($game_mode = p4_career || $game_mode = p4_quickplay || $game_mode = p8_pro_faceoff))
		<four_way_streak> = 1
		<player> = 1
		begin
		getplayerinfo <player> current_run
		if (<current_run> < 50)
			<four_way_streak> = 0
			break
		endif
		<player> = (<player> + 1)
		repeat 4
		if (<four_way_streak> = 1)
			change \{achievements_2x4_flag = 1}
		endif
	endif
endscript

script achievements_checkforsupergroupunite 
	if ($achievements_super_group_unite_flag = 0 && ($game_mode = p4_career || $game_mode = p4_quickplay || $game_mode = p8_pro_faceoff))
		<four_way_multiplier> = 1
		<player> = 1
		begin
		formattext checksumname = player_status 'player%n_status' n = <player>
		get_current_multiplier player_status = <player_status>
		if (<multiplier> < 8)
			<four_way_multiplier> = 0
			break
		endif
		<player> = (<player> + 1)
		repeat 4
		if (<four_way_multiplier> = 1)
			change \{achievements_super_group_unite_flag = 1}
		endif
	endif
endscript

script achievements_ischeatingautokick 
	if ($cheat_autokick = 1 || $cheat_freedrum = 1)
		gamemode_getnumplayersshown
		<player> = 1
		begin
		getplayerinfo <player> part
		if (<part> = drum)
			printf \{qs(0x90144029)}
			return \{true}
		endif
		<player> = (<player> + 1)
		repeat <num_players_shown>
	endif
	return \{false}
endscript

script achievements_ischeating 
	if ($cheat_autokick = 1 || $cheat_freedrum = 1)
		gamemode_getnumplayersshown
		<player> = 1
		begin
		getplayerinfo <player> part
		if (<part> = drum)
			printf \{qs(0x90144029)}
			return \{true}
		endif
		<player> = (<player> + 1)
		repeat <num_players_shown>
	endif
	if ($cheat_alwaysslide = 1)
		gamemode_getnumplayersshown
		<player> = 1
		begin
		getplayerinfo <player> part
		if (<part> = guitar)
			printf \{qs(0x90144029)}
			return \{true}
		endif
		<player> = (<player> + 1)
		repeat <num_players_shown>
	endif
	return \{false}
endscript

script achievements_resetgreenhellflags 
	gamemode_getnumplayersshown
	printf qs(0xbd640c58) n = <num_players_shown> channel = ach_debug
	<player> = 1
	begin
	getplayerinfo <player> controller
	get_savegame_from_controller controller = <controller>
	setglobaltags savegame = <savegame> achievement_info params = {green_note_missed = 0}
	setglobaltags savegame = <savegame> achievement_info params = {green_notes_exist = 0}
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_onlinematchplayed 
	gamemode_getnumplayersshown
	savegames = [-1 -1 -1 -1]
	<player> = 1
	begin
	getplayerinfo <player> controller
	if checkforsignin local controller_index = <controller>
		get_savegame_from_controller controller = <controller>
		printf qs(0xf44d460e) p = <player> n = <savegame>
		if NOT arraycontains array = <savegames> contains = <savegame>
			getglobaltags savegame = <savegame> achievement_info param = num_online_matches_played
			printf qs(0x0c5d5165) p = <player> n = <num_online_matches_played>
			<num_online_matches_played> = (<num_online_matches_played> + 1)
			setglobaltags savegame = <savegame> achievement_info params = {num_online_matches_played = <num_online_matches_played>}
			setarrayelement arrayname = savegames index = (<player> - 1) newvalue = <savegame>
		endif
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_the_more_i_see 
	printf \{'Achievements_THE_MORE_I_SEE'}
	getglobaltags \{training}
	if (<basic_lesson> = complete &&
			<star_power_lesson> = complete &&
			<advanced_techniques_lesson> = complete &&
			<new_features_lesson> = complete &&
			<drum_basic_lesson> = complete &&
			<drum_int_lesson> = complete &&
			<vocals_lesson> = complete &&
			<band_lesson> = complete &&
			<versus_lesson> = complete)
		printf \{qs(0xc8fe5730)}
		writeachievements \{achievement = the_more_i_see
			controller_id = 0}
		writeachievements \{achievement = the_more_i_see
			controller_id = 1}
		writeachievements \{achievement = the_more_i_see
			controller_id = 2}
		writeachievements \{achievement = the_more_i_see
			controller_id = 3}
	endif
endscript

script achievements_metallica 
	printf \{'Achievements_METALLICA'}
	gamemode_getnumplayersshown
	<player> = 1
	begin
	achievements_careercomplete part = guitar player = <player> difficulty = expert
	if (<complete> = 1)
		achievements_awardplayer achievement = metallica player = <player>
	endif
	achievements_careercomplete part = bass player = <player> difficulty = expert
	if (<complete> = 1)
		achievements_awardplayer achievement = metallica player = <player>
	endif
	achievements_careercomplete part = drum player = <player> difficulty = expert
	if (<complete> = 1)
		achievements_awardplayer achievement = metallica player = <player>
	endif
	achievements_careercomplete part = vocals player = <player> difficulty = expert
	if (<complete> = 1)
		achievements_awardplayer achievement = metallica player = <player>
	endif
	achievements_careercomplete part = band player = <player> difficulty = expert
	if (<complete> = 1)
		achievements_awardplayer achievement = metallica player = <player>
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_james_hetfield 
	printf \{'Achievements_JAMES_HETFIELD'}
	gamemode_getnumplayers
	if (<num_players> > 1)
		return
	endif
	achievements_careercomplete \{part = vocals
		player = 1}
	if (<complete> = 1)
		achievements_awardplayer \{achievement = james_hetfield
			player = 1}
	endif
endscript

script achievements_lars_ulrich 
	printf \{'Achievements_LARS_ULRICH'}
	gamemode_getnumplayers
	if (<num_players> > 1)
		return
	endif
	achievements_careercomplete \{part = drum
		player = 1}
	if (<complete> = 1)
		achievements_awardplayer \{achievement = lars_ulrich
			player = 1}
	endif
endscript

script achievements_kirk_hammet 
	printf \{'Achievements_KIRK_HAMMET'}
	gamemode_getnumplayers
	if (<num_players> > 1)
		return
	endif
	achievements_careercomplete \{part = guitar
		player = 1}
	if (<complete> = 1)
		achievements_awardplayer \{achievement = kirk_hammet
			player = 1}
	endif
endscript

script achievements_robert_trujillo 
	printf \{'Achievements_ROBERT_TRUJILLO'}
	gamemode_getnumplayers
	if (<num_players> > 1)
		return
	endif
	achievements_careercomplete \{part = bass
		player = 1}
	if (<complete> = 1)
		achievements_awardplayer \{achievement = robert_trujillo
			player = 1}
	endif
endscript

script achievements_holier_than_thou 
	printf \{'Achievements_HOLIER_THAN_THOU'}
	gamemode_getnumplayers
	if (<num_players> > 1)
		return
	endif
	achievements_careercomplete \{part = guitar
		player = 1}
	if (<complete> = 0)
		return
	endif
	achievements_careercomplete \{part = bass
		player = 1}
	if (<complete> = 0)
		return
	endif
	achievements_careercomplete \{part = drum
		player = 1}
	if (<complete> = 0)
		return
	endif
	achievements_careercomplete \{part = vocals
		player = 1}
	if (<complete> = 0)
		return
	endif
	achievements_awardplayer \{achievement = holier_than_thou
		player = 1}
endscript

script achievements_one 
	printf \{'Achievements_ONE'}
	if NOT achievements_issongcompleted
		return
	endif
	if NOT achievements_issongwon
		return
	endif
	if ($is_network_game = 1)
		return
	endif
	if ($game_mode = tutorial ||
			$game_mode = training ||
			$game_mode = p1_improv ||
			$rich_presence_context = presence_music_studio)
		return
	endif
	if NOT ($game_mode = p1_quickplay ||
			$game_mode = p2_quickplay ||
			$game_mode = p3_quickplay ||
			$game_mode = p4_quickplay ||
			$game_mode = p1_career ||
			$game_mode = p2_career ||
			$game_mode = p3_career ||
			$game_mode = p4_career)
		return
	endif
	gamemode_getnumplayersshown
	<player> = 1
	begin
	getplayerinfo <player> difficulty
	if (<difficulty> = hard || <difficulty> = expert)
		achievements_awardplayer achievement = one player = <player>
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_and_justice_for_all 
	printf \{'Achievements_AND_JUSTICE_FOR_ALL'}
	gamemode_getnumplayersshown
	<player> = 1
	begin
	getplayerinfo <player> controller
	printf qs(0x3bc5cc25) n = <player>
	valid = 1
	if (<num_players_shown> > 1 && <controller> != ($band_mode_current_leader))
		printf \{qs(0x5878efb7)}
		<valid> = 0
	endif
	if (<valid> = 1)
		get_savegame_from_controller controller = <controller>
		progression_get_total_stars savegame = <savegame>
		printf qs(0x724d6c02) t = <total_stars>
		if (<total_stars> >= 100)
			achievements_awardplayer achievement = and_justice_for_all player = <player>
		endif
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_the_ecstacy_of_gold 
	printf \{'Achievements_THE_ECSTACY_OF_GOLD'}
	gamemode_getnumplayersshown
	<player> = 1
	begin
	getplayerinfo <player> controller
	get_savegame_from_controller controller = <controller>
	getglobaltags savegame = <savegame> band_info
	if (<career_earnings> >= 15000)
		achievements_awardplayer achievement = the_ecstacy_of_gold player = <player>
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_damage_inc 
	printf \{'Achievements_DAMAGE_INC'}
	if NOT achievements_issongcompleted
		return
	endif
	if ($is_network_game = 0)
		if NOT achievements_issongwon
			return
		endif
	endif
	if ($game_mode = tutorial ||
			$game_mode = training ||
			$game_mode = p1_improv ||
			$rich_presence_context = presence_music_studio)
		return
	endif
	gamemode_getnumplayersshown
	<player> = 1
	begin
	getplayerinfo <player> part
	getplayerinfo <player> controller
	if isxenon
		if (<part> = drum)
			achievements_awardplayer achievement = damage_inc player = <player>
		endif
	else
		if (<controller> = ($primary_controller) && <part> = drum)
			achievements_awardplayer achievement = damage_inc player = <player>
		endif
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_motorbreath 
	printf \{'Achievements_MOTORBREATH'}
	if NOT achievements_issongcompleted
		return
	endif
	if ($is_network_game = 0)
		if NOT achievements_issongwon
			return
		endif
	endif
	if ($game_mode = tutorial ||
			$game_mode = training ||
			$game_mode = p1_improv ||
			$rich_presence_context = presence_music_studio)
		return
	endif
	gamemode_getnumplayersshown
	<player> = 1
	begin
	getplayerinfo <player> part
	getplayerinfo <player> controller
	if isxenon
		if (<part> = vocals)
			achievements_awardplayer achievement = motorbreath player = <player>
		endif
	else
		if (<controller> = ($primary_controller) && <part> = vocals)
			achievements_awardplayer achievement = motorbreath player = <player>
		endif
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_invisible_kid 
	printf \{'Achievements_INVISIBLE_KID'}
	if NOT achievements_issongcompleted
		return
	endif
	if ($is_network_game = 0)
		if NOT achievements_issongwon
			return
		endif
	endif
	if ($game_mode = tutorial ||
			$game_mode = training ||
			$game_mode = p1_improv ||
			$rich_presence_context = presence_music_studio)
		return
	endif
	gamemode_getnumplayersshown
	<player> = 1
	begin
	getplayerinfo <player> part
	getplayerinfo <player> controller
	if isxenon
		if (<part> = bass)
			achievements_awardplayer achievement = invisible_kid player = <player>
		endif
	else
		if (<controller> = ($primary_controller) && <part> = bass)
			achievements_awardplayer achievement = invisible_kid player = <player>
		endif
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_some_kind_of_monster 
	printf \{'Achievements_SOME_KIND_OF_MONSTER'}
	if NOT achievements_issongcompleted
		return
	endif
	if ($is_network_game = 0)
		if NOT achievements_issongwon
			return
		endif
	endif
	if ($game_mode = tutorial ||
			$game_mode = training ||
			$game_mode = p1_improv ||
			$rich_presence_context = presence_music_studio)
		return
	endif
	gamemode_getnumplayersshown
	<player> = 1
	begin
	getplayerinfo <player> part
	getplayerinfo <player> controller
	if isxenon
		if (<part> = guitar)
			achievements_awardplayer achievement = some_kind_of_monster player = <player>
		endif
	else
		if (<controller> = ($primary_controller) && <part> = guitar)
			achievements_awardplayer achievement = some_kind_of_monster player = <player>
		endif
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_ride_the_lightning 
	printf \{'Achievements_RIDE_THE_LIGHTNING'}
	if NOT ($game_mode = p4_quickplay ||
			$game_mode = p4_career ||
			$game_mode = p8_pro_faceoff)
		return
	endif
	if ($game_mode = tutorial ||
			$game_mode = training ||
			$game_mode = p1_improv ||
			$rich_presence_context = presence_music_studio)
		return
	endif
	if ($achievements_ride_the_lightning_flag = 1)
		achievements_awardband \{achievement = ride_the_lightning}
		change \{achievements_ride_the_lightning_flag = 0}
	endif
endscript

script achievements_2x4 
	printf \{'Achievements_2X4'}
	if NOT ($game_mode = p4_quickplay ||
			$game_mode = p4_career ||
			$game_mode = p8_pro_faceoff)
		return
	endif
	if ($game_mode = tutorial ||
			$game_mode = training ||
			$game_mode = p1_improv ||
			$rich_presence_context = presence_music_studio)
		return
	endif
	if ($achievements_2x4_flag = 1)
		achievements_awardband \{achievement = 2x4}
		change \{achievements_2x4_flag = 0}
	endif
endscript

script achievements_metal_militia 
	printf \{'Achievements_METAL_MILITIA'}
	if NOT achievements_issongwon
		return
	endif
	if ($current_song = jamsession)
		printf \{qs(0xab6a4722)}
		return
	endif
	if NOT ($game_mode = p4_quickplay ||
			$game_mode = p4_career ||
			$game_mode = p8_pro_faceoff)
		printf \{qs(0x1364e4dd)}
		return
	endif
	gamemode_getnumplayersshown
	<player> = 1
	begin
	getplayerinfo <player> part
	if (<part> != vocals)
		getplayerinfo <player> notes_hit
		getplayerinfo <player> total_notes
		getplayerinfo <player> max_notes
		if ((<notes_hit> < <max_notes>) || (<total_notes> = 0))
			printf \{qs(0xdf882bd6)}
			return
		endif
	else
		getplayerinfo <player> vocal_phrase_quality
		getplayerinfo <player> vocal_phrase_max_qual
		if ((<vocal_phrase_quality> < <vocal_phrase_max_qual>) || (<vocal_phrase_quality> = 0))
			printf \{qs(0xdf882bd6)}
			return
		endif
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
	achievements_awardband \{achievement = metal_militia}
endscript

script achievements_master_of_puppets 
	printf \{'Achievements_MASTER_OF_PUPPETS'}
	if NOT achievements_issongwon
		return
	endif
	if NOT ($game_mode = p4_quickplay ||
			$game_mode = p4_career ||
			$game_mode = p8_pro_faceoff)
		return
	endif
	<highest_score> = 0
	<highest_score_player> = -1
	<highest_score_part> = none
	<player> = 1
	begin
	getplayerinfo <player> score
	if (<score> > <highest_score>)
		<highest_score> = <score>
		<highest_score_player> = <player>
	endif
	<player> = (<player> + 1)
	repeat 4
	if (<highest_score_player> > -1)
		achievements_awardplayer achievement = master_of_puppets player = <highest_score_player>
	endif
endscript

script achievements_the_struggle_within 
	printf \{'Achievements_THE_STRUGGLE_WITHIN'}
	if NOT achievements_issongwon
		return
	endif
	if NOT achievements_issongcompleted
		return
	endif
	if NOT ($game_mode = p4_quickplay ||
			$game_mode = p4_career)
		printf qs(0xcd73adc7) n = ($game_mode)
		return
	endif
	if ($is_network_game = 1)
		getnumplayers
		if (<num_players> < 4)
			printf qs(0x5c94b031) n = <num_players>
			return
		endif
	endif
	achievements_awardband \{achievement = the_struggle_within}
endscript

script achievements_the_four_horsemen 
	printf \{'Achievements_THE_FOUR_HORSEMEN'}
	if NOT achievements_issongwon
		return
	endif
	if NOT achievements_issongcompleted
		return
	endif
	if NOT ($game_mode = p4_quickplay ||
			$game_mode = p4_career)
		return
	endif
	if ($current_song = jamsession)
		return
	endif
	<player> = 1
	begin
	getplayerinfo <player> difficulty
	if (<difficulty> != expert)
		return
	endif
	<player> = (<player> + 1)
	repeat 4
	achievements_awardband \{achievement = the_four_horsemen}
endscript

script achievements_nothing_else_matters 
	printf \{'Achievements_NOTHING_ELSE_MATTERS'}
	gamemode_getnumplayersshown
	<player> = 1
	begin
	achievements_careercomplete part = band player = <player>
	if (<complete> = 1)
		achievements_awardplayer achievement = nothing_else_matters player = <player>
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_black 
	printf \{'Achievements_BLACK'}
	if ($game_mode != p2_battle || $is_network_game = 0)
		printf \{qs(0xbc3f64ab)}
		return
	endif
	p1_health = ($player1_status.current_health)
	p2_health = ($player2_status.current_health)
	printstruct <...>
	if (<p1_health> < <p2_health>)
		printf \{qs(0x20b6e86a)}
		return
	endif
	if (<p1_health> = <p2_health> || (<p1_health> > 0.0 && <p2_health> > 0.0))
		printf \{qs(0x756278cf)}
		return
	endif
	getplayerinfo \{1
		final_blow_powerup}
	if (<final_blow_powerup> < 0)
		printf \{qs(0xa70eb440)}
		return
	endif
	<powerup> = ($battlemode_powerups [<final_blow_powerup>].name)
	printf qs(0xa4bff48c) f = <powerup>
	if (<powerup> = blackout)
		achievements_awardplayer \{achievement = black
			player = 1}
	endif
endscript

script achievements_better_than_you 
	printf \{'Achievements_BETTER_THAN_YOU'}
	if NOT achievements_issongwon
		return
	endif
	if ($game_mode = p2_pro_faceoff && $is_network_game)
		determine_game_scores_and_winner
		printf qs(0x09667ec7) n = <team_score>
		printf qs(0x29c1b0ec) n = <opponent_team_score>
		printf qs(0x5f65d94c) b = <tie>
		if (<tie> = false && <team_score> > <opponent_team_score>)
			achievements_awardband \{achievement = better_than_you}
		endif
	endif
endscript

script achievements_blitzkrieg 
	printf \{'Achievements_BLITZKRIEG'}
	if NOT achievements_issongwon
		return
	endif
	if ($game_mode = p8_pro_faceoff && $is_network_game)
		determine_game_scores_and_winner
		printf qs(0x09667ec7) n = <team_score>
		printf qs(0x29c1b0ec) n = <opponent_team_score>
		printf qs(0x5f65d94c) b = <tie>
		if (<tie> = false && <team_score> > <opponent_team_score>)
			achievements_awardband \{achievement = blitzkrieg}
		endif
	endif
endscript

script achievements_seek_and_destroy 
	printf \{'Achievements_SEEK_AND_DESTROY'}
	if ($is_network_game = 0)
		return
	endif
	gamemode_getnumplayersshown
	<player> = 1
	begin
	getplayerinfo <player> controller
	if checkforsignin local controller_index = <controller>
		get_savegame_from_controller controller = <controller>
		getglobaltags savegame = <savegame> achievement_info param = num_online_matches_played
		printf qs(0x3c7c5d2b) p = <player> n = <num_online_matches_played>
		if (<num_online_matches_played> >= 20)
			achievements_awardplayer achievement = seek_and_destroy player = <player>
		endif
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_the_unforgiven 
	printf \{'Achievements_THE_UNFORGIVEN'}
	if NOT achievements_issongwon
		return
	endif
	if ($game_mode = p2_faceoff && $is_network_game)
		determine_game_scores_and_winner
		printf qs(0x09667ec7) n = <team_score>
		printf qs(0x29c1b0ec) n = <opponent_team_score>
		printf qs(0x5f65d94c) b = <tie>
		if (<tie> = false && <team_score> > <opponent_team_score>)
			achievements_awardband \{achievement = the_unforgiven}
		endif
	endif
endscript

script achievements_the_unforgiven_ii 
	printf \{'Achievements_THE_UNFORGIVEN_II'}
	if NOT achievements_issongwon
		return
	endif
	if ($game_mode = p2_faceoff && $is_network_game)
		determine_game_scores_and_winner
		if (<tie> = false && <team_score> >= (<opponent_team_score> + 25000))
			achievements_awardband \{achievement = the_unforgiven_ii}
		endif
	endif
endscript

script achievements_the_unforgiven_iii 
	printf \{'Achievements_THE_UNFORGIVEN_III'}
	if NOT achievements_issongwon
		return
	endif
	if ($game_mode = p2_pro_faceoff && $is_network_game)
		determine_game_scores_and_winner
		if (<tie> = false && <team_score> >= (<opponent_team_score> + 25000))
			achievements_awardband \{achievement = the_unforgiven_iii}
		endif
	endif
endscript

script achievements_reload 
	printf \{'Achievements_RELOAD'}
	if gotparam \{controller}
		writeachievements achievement = reload controller_id = <controller>
	endif
endscript

script achievements_cure 
	printf \{'Achievements_CURE'}
	if NOT achievements_issongwon
		return
	endif
	if NOT ($game_mode = p1_quickplay ||
			$game_mode = p2_quickplay ||
			$game_mode = p3_quickplay ||
			$game_mode = p4_quickplay ||
			$game_mode = p1_career ||
			$game_mode = p2_career ||
			$game_mode = p3_career ||
			$game_mode = p4_career)
		return
	endif
	gamemode_getnumplayersshown
	<player> = 1
	begin
	formattext checksumname = player_status 'player%n_status' n = <player>
	if (($<player_status>.lowest_health) < $health_poor_medium)
		if (($<player_status>.current_health) >= $health_poor_medium)
			achievements_awardplayer achievement = cure player = <player>
		endif
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_green_hell 
	printf \{'Achievements_GREEN_HELL'}
	if NOT achievements_issongwon
		return
	endif
	if ($current_song != bloodandthunder)
		return
	endif
	gamemode_getnumplayersshown
	<player> = 1
	begin
	getplayerinfo <player> part
	if (<part> = drum)
		getplayerinfo <player> controller
		get_savegame_from_controller controller = <controller>
		getglobaltags savegame = <savegame> achievement_info param = green_note_missed
		getglobaltags savegame = <savegame> achievement_info param = green_notes_exist
		getplayerinfo <player> current_health
		printf qs(0xee3aa580) n = <green_note_missed>
		printf qs(0x6dc3531d) n = <green_notes_exist>
		printf qs(0x08130d7c) n = <current_health>
		if (<green_note_missed> = 0 &&
				<green_notes_exist> = 1 &&
				<current_health> > $health_medium_good)
			achievements_awardplayer achievement = green_hell player = <player>
		endif
		break
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_disposable_heroes 
	printf \{'Achievements_DISPOSABLE_HEROES'}
	if gotparam \{controller}
		writeachievements achievement = disposable_heroes controller_id = <controller>
	endif
endscript

script achievements_blackened 
	printf \{'Achievements_BLACKENED'}
	if gotparam \{controller}
		writeachievements achievement = blackened controller_id = <controller>
	endif
endscript

script achievements_eye_of_the_beholder 
	printf \{'Achievements_EYE_OF_THE_BEHOLDER'}
	if ($rich_presence_context = presence_music_studio)
		return
	endif
	if gotparam \{controller}
		writeachievements achievement = eye_of_the_beholder controller_id = <controller>
		change \{achievements_modified_logo = 0}
	endif
endscript

script achievements_fixxxer 
	printf \{'Achievements_FIXXXER'}
	if gotparam \{controller}
		writeachievements achievement = fixxxer controller_id = <controller>
	endif
endscript

script achievements_hero_of_the_day 
	printf \{'Achievements_HERO_OF_THE_DAY'}
	if ($rich_presence_context = presence_music_studio)
		return
	endif
	if NOT achievements_issongwon
		return
	endif
	if ($current_song = jamsession)
		return
	endif
	if NOT structurecontains structure = ($permanent_songlist_props.($current_song)) double_kick
		printf \{qs(0xb3a4f56f)}
		return
	endif
	if (($permanent_songlist_props.($current_song)).double_kick = 0)
		printf \{qs(0x131e0048)}
		return
	endif
	if NOT ($game_mode = p1_quickplay ||
			$game_mode = p2_quickplay ||
			$game_mode = p3_quickplay ||
			$game_mode = p4_quickplay ||
			$game_mode = p1_career ||
			$game_mode = p2_career ||
			$game_mode = p3_career ||
			$game_mode = p4_career)
		return
	endif
	gamemode_getnumplayersshown
	<player> = 1
	begin
	getplayerinfo <player> part
	getplayerinfo <player> double_kick_drum
	if (<part> = drum && <double_kick_drum> = 1)
		achievements_awardplayer achievement = hero_of_the_day player = <player>
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_the_house_jack_built 
	printf \{'Achievements_THE_HOUSE_JACK_BUILT'}
	if NOT achievements_issongcompleted
		return
	endif
	gamemode_gettype
	if (<type> = career || <type> = quickplay)
		if NOT achievements_issongwon
			return
		endif
	endif
	gamemode_getnumplayersshown
	<player> = 1
	begin
	getplayerinfo <player> controller
	get_savegame_from_controller controller = <controller>
	getglobaltags savegame = <savegame> achievement_info param = venues_played
	switch ($current_level)
		case load_z_meadowlands
		<venues_played> = {<venues_played> load_z_meadowlands = 1}
		case load_z_forum
		<venues_played> = {<venues_played> load_z_forum = 1}
	endswitch
	setglobaltags savegame = <savegame> achievement_info params = {venues_played = <venues_played>}
	printstruct <venues_played>
	if (<venues_played>.load_z_meadowlands = 1 && <venues_played>.load_z_forum = 1)
		achievements_awardplayer achievement = the_house_jack_built player = <player>
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_wherever_i_may_roam 
	printf \{'Achievements_WHEREVER_I_MAY_ROAM'}
	if NOT achievements_issongcompleted
		return
	endif
	gamemode_gettype
	if (<type> = career || <type> = quickplay)
		if NOT achievements_issongwon
			return
		endif
	endif
	gamemode_getnumplayersshown
	<player> = 1
	begin
	getplayerinfo <player> controller
	get_savegame_from_controller controller = <controller>
	getglobaltags savegame = <savegame> achievement_info param = venues_played
	switch ($current_level)
		case load_z_soundcheck2
		<venues_played> = {<venues_played> load_z_soundcheck2 = 1}
		case load_z_studio2
		<venues_played> = {<venues_played> load_z_studio2 = 1}
		case load_z_meadowlands
		<venues_played> = {<venues_played> load_z_meadowlands = 1}
		case load_z_justice
		<venues_played> = {<venues_played> load_z_justice = 1}
		case load_z_mop
		<venues_played> = {<venues_played> load_z_mop = 1}
		case load_z_donnington
		<venues_played> = {<venues_played> load_z_donnington = 1}
		case load_z_forum
		<venues_played> = {<venues_played> load_z_forum = 1}
		case load_z_tushino
		<venues_played> = {<venues_played> load_z_tushino = 1}
		case load_z_stone
		<venues_played> = {<venues_played> load_z_stone = 1}
		case load_z_icecave
		<venues_played> = {<venues_played> load_z_icecave = 1}
	endswitch
	setglobaltags savegame = <savegame> achievement_info params = {venues_played = <venues_played>}
	printstruct <venues_played>
	<all_played> = 1
	getarraysize ($levelzonearray)
	<i> = 0
	begin
	<venue_name> = (($levelzonearray) [<i>])
	if structurecontains structure = <venues_played> <venue_name>
		if ((<venues_played>.<venue_name>) = 0)
			<all_played> = 0
			break
		endif
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	if (<all_played> = 1)
		achievements_awardplayer achievement = wherever_i_may_roam player = <player>
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_trapped_under_ice 
	printf \{'Achievements_TRAPPED_UNDER_ICE'}
	if NOT achievements_issongwon
		return
	endif
	if (($levelzones).($current_level).zone = z_icecave)
		achievements_awardband \{achievement = trapped_under_ice}
	endif
endscript

script achievements_stone_dead_forever 
	printf \{'Achievements_STONE_DEAD_FOREVER'}
	if NOT achievements_issongwon
		return
	endif
	printf qs(0x8194ad84) n = ($current_level)
	printf qs(0x96192cc0) n = (($levelzones).($current_level).zone)
	if (($levelzones).($current_level).zone = z_stone)
		achievements_awardband \{achievement = stone_dead_forever}
	endif
endscript

script achievements_king_diamond 
	printf \{'Achievements_KING_DIAMOND'}
	if NOT achievements_issongwon
		return
	endif
	if ($current_song = jamsession)
		return
	endif
	if ($game_mode = p1_quickplay ||
			$game_mode = p2_quickplay ||
			$game_mode = p3_quickplay ||
			$game_mode = p4_quickplay)
		mode = quickplay
	elseif ($game_mode = p1_career ||
			$game_mode = p2_career ||
			$game_mode = p3_career ||
			$game_mode = p4_career)
		mode = career
	else
		return
	endif
	if structurecontains structure = ($permanent_songlist_props.($current_song)) band
		if (($permanent_songlist_props.($current_song).band) = band_metallica ||
				($permanent_songlist_props.($current_song).band) = band_lemmy)
			return
		endif
	endif
	gamemode_getnumplayersshown
	<player> = 1
	begin
	getplayerinfo <player> character_id
	getplayerinfo <player> part
	if (<mode> = quickplay && <part> = vocals && ($permanent_songlist_props.($current_song).band) = band_kingdiamond)
		achievements_awardplayer achievement = king_diamond player = <player>
	elseif (<mode> = career && <character_id> = kingdiamond)
		achievements_awardplayer achievement = king_diamond player = <player>
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_lemmy 
	printf \{'Achievements_LEMMY'}
	if NOT achievements_issongwon
		return
	endif
	if ($current_song = jamsession)
		return
	endif
	if ($game_mode = p1_quickplay ||
			$game_mode = p2_quickplay ||
			$game_mode = p3_quickplay ||
			$game_mode = p4_quickplay)
		mode = quickplay
	elseif ($game_mode = p1_career ||
			$game_mode = p2_career ||
			$game_mode = p3_career ||
			$game_mode = p4_career)
		mode = career
	else
		return
	endif
	if structurecontains structure = ($permanent_songlist_props.($current_song)) band
		if (($permanent_songlist_props.($current_song).band) = band_metallica ||
				($permanent_songlist_props.($current_song).band) = band_kingdiamond)
			return
		endif
	endif
	gamemode_getnumplayersshown
	<player> = 1
	begin
	getplayerinfo <player> character_id
	getplayerinfo <player> part
	if (<mode> = quickplay && ($permanent_songlist_props.($current_song).band) = band_lemmy)
		if (<part> = vocals || <part> = bass)
			achievements_awardplayer achievement = lemmy player = <player>
		endif
	elseif (<mode> = career && (<character_id> = lemmy || <character_id> = lemmy_2))
		achievements_awardplayer achievement = lemmy player = <player>
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_the_memory_remains 
	printf \{'Achievements_THE_MEMORY_REMAINS'}
	if NOT screenelementexists \{id = metallifacts_container}
		printf \{qs(0xb5bc49fd)}
		return
	endif
	<controller> = 0
	begin
	writeachievements achievement = the_memory_remains controller_id = <controller>
	printf qs(0x0e224e31) c = <controller>
	<controller> = (<controller> + 1)
	repeat 4
endscript

script achievements_creeping_death 
	printf \{'Achievements_CREEPING_DEATH'}
	if NOT achievements_issongwon
		return
	endif
	gamemode_getnumplayers
	if (<num_players> > 1)
		return
	endif
	getplayerinfo \{1
		score}
	getplayerinfo \{1
		part}
	if (<score> >= 575000 &&
			<part> = guitar &&
			$current_song = creepingdeath)
		achievements_awardplayer \{achievement = creeping_death
			player = 1}
	endif
endscript

script achievements_dyers_eve 
	printf \{'Achievements_DYERS_EVE'}
	if NOT achievements_issongwon
		return
	endif
	gamemode_getnumplayers
	if (<num_players> > 1)
		return
	endif
	getplayerinfo \{1
		score}
	getplayerinfo \{1
		part}
	if (<score> >= 450000 &&
			<part> = drum &&
			$current_song = dyerseve)
		achievements_awardplayer \{achievement = dyers_eve
			player = 1}
	endif
endscript

script achievements_fight_fire_with_fire 
	printf \{'Achievements_FIGHT_FIRE_WITH_FIRE'}
	if NOT achievements_issongwon
		return
	endif
	gamemode_getnumplayers
	if (<num_players> > 1)
		return
	endif
	getplayerinfo \{1
		score}
	getplayerinfo \{1
		part}
	if (<score> >= 340000 &&
			<part> = bass &&
			$current_song = fightfirewithfire)
		achievements_awardplayer \{achievement = fight_fire_with_fire
			player = 1}
	endif
endscript

script achievements_stone_cold_crazy 
	printf \{'Achievements_STONE_COLD_CRAZY'}
	if NOT achievements_issongwon
		return
	endif
	gamemode_getnumplayers
	if (<num_players> > 1)
		return
	endif
	getplayerinfo \{1
		score}
	getplayerinfo \{1
		part}
	if (<score> >= 65000 &&
			<part> = vocals &&
			$current_song = stonecoldcrazy)
		achievements_awardplayer \{achievement = stone_cold_crazy
			player = 1}
	endif
endscript

script achievements_enter_sandman 
	printf \{'Achievements_ENTER_SANDMAN'}
	if NOT achievements_issongwon
		return
	endif
	gamemode_getnumplayers
	if (<num_players> > 1)
		return
	endif
	getplayerinfo \{1
		score}
	getplayerinfo \{1
		part}
	if (<score> >= 330000 &&
			<part> = guitar &&
			$current_song = entersandman)
		achievements_awardplayer \{achievement = enter_sandman
			player = 1}
	endif
endscript

script achievements_battery 
	printf \{'Achievements_BATTERY'}
	if NOT achievements_issongwon
		return
	endif
	gamemode_getnumplayersshown
	if (<num_players_shown> != 4)
		return
	endif
	if (($band1_status.score) >= 1000000 &&
			$current_song = battery)
		achievements_awardband \{achievement = battery}
	endif
endscript

script achievements_astronomy 
	printf \{'Achievements_ASTRONOMY'}
	if NOT achievements_issongwon
		return
	endif
	if ($current_song != orion)
		return
	endif
	gamemode_getnumplayersshown
	<player> = 1
	begin
	getplayerinfo <player> sp_phrases_hit
	getplayerinfo <player> sp_phrases_total
	printf qs(0x80583d4e) h = <sp_phrases_hit>
	printf qs(0x1eac667f) t = <sp_phrases_total>
	if (<sp_phrases_hit> = <sp_phrases_total>)
		achievements_awardplayer achievement = astronomy player = <player>
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript
