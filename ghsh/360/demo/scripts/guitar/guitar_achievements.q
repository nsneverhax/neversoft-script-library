gstar_power_triggered = 0
achievement_scripts = [
	achievements_rockers_guide_to_godhood
	achievements_i_wanna_rock
	achievements_one_for_all
	achievements_the_greatest_crew
	achievements_warmachine
	achievements_the_greatest_journey_in_history
	achievements_promising_diva
	achievements_golden_fingers
	achievements_beatbox
	achievements_unnoticed_presence
	achievements_bark_at_the_moon
	achievements_made_of_iron
	achievements_wondrous_strummer
	achievements_low_pitched_king
	achievements_rock_legends
	achievements_the_one_man_band
	achievements_thunder_kissing
	achievements_band_leader
	achievements_a_new_hope
	achievements_cowboys_from_hell
	achievements_play_with_me
	achievements_you_should_be_afraid
	achievements_jaw_dropper
	achievements_face_to_face
	achievements_you_cannot_beat_me
	achievements_clash_of_the_titans
	achievements_craving_for_more
	achievements_masterpiece
	achievements_ink_and_blood
	achievements_artist_on_the_rise
	achievements_master_craftsmen
	achievements_in_extremis
	achievements_eighth_wonder
	achievements_bloody_feet
	achievements_rising_star
	achievements_free_as_a_band
	achievements_killing_in_the_name_of
	achievements_cyborg
	achievements_rock_veteran
	achievements_amazing_rockstar
	achievements_smoking
	achievements_raining_notes
	achievements_glory_to_the_brave
	achievements_hellborn
	achievements_golden_voice
	achievements_fast_as_a_shark
	achievements_open_minded_strummer
	achievements_you_play_it_well
	achievements_deadzone
	achievements_hail_the_reverend
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
		format_globaltag_song_checksum part_text = ($part_list_props.<part>.text_nl) song = throughthefire difficulty = <difficulty>
		getglobaltags <song_checksum> param = stars savegame = <savegame>
		printf qs(0x39bedc44) s = <stars>
		if (<stars> >= 3)
			return \{complete = 1}
		endif
	else
		getarraysize ($difficulty_list)
		<i> = 0
		begin
		format_globaltag_song_checksum part_text = ($part_list_props.<part>.text_nl) song = throughthefire difficulty_index = <i>
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
	printf qs(0x0b5fb748) n = <player> c = <controller> a = <part> b = <achievement> channel = achievements
	writeachievements achievement = <achievement> controller_id = <controller>
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
	setglobaltags savegame = <savegame> achievement_info params = {open_note_missed = 0}
	setglobaltags savegame = <savegame> achievement_info params = {open_notes_exist = 0}
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

script achievements_onlinematchwon 
	gamemode_getnumplayersshown
	savegames = [-1 -1 -1 -1]
	<player> = 1
	begin
	getplayerinfo <player> controller
	if checkforsignin local controller_index = <controller>
		get_savegame_from_controller controller = <controller>
		printf qs(0xf44d460e) p = <player> n = <savegame>
		if NOT arraycontains array = <savegames> contains = <savegame>
			getglobaltags savegame = <savegame> achievement_info param = num_online_matches_won
			printf channel = killinginthename qs(0xdab7e2fc) p = <player> n = <num_online_matches_won>
			<num_online_matches_won> = (<num_online_matches_won> + 1)
			printf channel = killinginthename qs(0xeee7d3a5) p = <player> n = <num_online_matches_won>
			setglobaltags savegame = <savegame> achievement_info params = {num_online_matches_won = <num_online_matches_won>}
			setarrayelement arrayname = savegames index = (<player> - 1) newvalue = <savegame>
		endif
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_totalcareersongsplayed 
	gamemode_getnumplayersshown
	savegames = [-1 -1 -1 -1]
	<player> = 1
	begin
	getplayerinfo <player> controller
	if checkforsignin local controller_index = <controller>
		get_savegame_from_controller controller = <controller>
		printf qs(0xf44d460e) p = <player> n = <savegame>
		if NOT arraycontains array = <savegames> contains = <savegame>
			getglobaltags savegame = <savegame> achievement_info param = total_career_songs_played
			printf channel = achievements qs(0x2b9f6840) p = <player> n = <total_career_songs_played>
			<total_career_songs_played> = (<total_career_songs_played> + 1)
			printf channel = achievements qs(0x0424dcb7) p = <player> n = <total_career_songs_played>
			setglobaltags savegame = <savegame> achievement_info params = {total_career_songs_played = <total_career_songs_played>}
			setarrayelement arrayname = savegames index = (<player> - 1) newvalue = <savegame>
		endif
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_rockers_guide_to_godhood 
	printf \{'Achievements_ROCKERS_GUIDE_TO_GODHOOD'}
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
		printf \{qs(0xf33e38e4)
			channel = achievements}
		writeachievements \{achievement = rockers_guide_to_godhood
			controller_id = 0}
		writeachievements \{achievement = rockers_guide_to_godhood
			controller_id = 1}
		writeachievements \{achievement = rockers_guide_to_godhood
			controller_id = 2}
		writeachievements \{achievement = rockers_guide_to_godhood
			controller_id = 3}
	endif
endscript

script achievements_i_wanna_rock 
	printf \{'Achievements_I_WANNA_ROCK'}
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
	achievements_awardplayer achievement = i_wanna_rock player = <player>
	printf \{channel = achievements
		qs(0xbe6383e9)}
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_one_for_all 
	printf \{'Achievements_ONE_FOR_ALL'}
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
	achievements_awardband \{achievement = one_for_all}
	printf \{qs(0x20c21472)
		channel = achievements}
endscript

script achievements_the_greatest_crew 
	printf \{'Achievements_THE_GREATEST_CREW'}
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
	achievements_awardband \{achievement = the_greatest_crew}
	printf \{qs(0xaeb30466)
		channel = achievements}
endscript

script achievements_warmachine 
	printf \{'Achievements_WARMACHINE'}
	if ($is_network_game = 1)
		return
	endif
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
		achievements_awardplayer achievement = warmachine player = <player>
		printf \{qs(0x3ed8ba88)
			channel = achievements}
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_the_greatest_journey_in_history 
	printf \{'Achievements_THE_GREATEST_JOURNEY_IN_HISTORY'}
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
		case load_z_amazon
		<venues_played> = {<venues_played> load_z_amazon = 1}
		case load_z_canyon
		<venues_played> = {<venues_played> load_z_canyon = 1}
		case load_z_icecap
		<venues_played> = {<venues_played> load_z_icecap = 1}
		case load_z_london
		<venues_played> = {<venues_played> load_z_london = 1}
		case load_z_sphinx
		<venues_played> = {<venues_played> load_z_sphinx = 1}
		case load_z_greatwall
		<venues_played> = {<venues_played> load_z_greatwall = 1}
		case load_z_atlantis
		<venues_played> = {<venues_played> load_z_atlantis = 1}
		case load_z_quebec
		<venues_played> = {<venues_played> load_z_quebec = 1}
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
		achievements_awardplayer achievement = the_greatest_journey_in_history player = <player>
		printf \{qs(0xe00ace37)
			channel = achievements}
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_promising_diva 
	printf \{'Achievements_PROMISING_DIVA'}
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
			achievements_awardplayer achievement = promising_diva player = <player>
		endif
	else
		if (<controller> = ($primary_controller) && <part> = vocals)
			achievements_awardplayer achievement = promising_diva player = <player>
			printf \{qs(0xaa92c8ce)
				channel = achievements}
		endif
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_golden_fingers 
	printf \{'Achievements_GOLDEN_FINGERS'}
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
			achievements_awardplayer achievement = golden_fingers player = <player>
		endif
	else
		if (<controller> = ($primary_controller) && <part> = guitar)
			achievements_awardplayer achievement = golden_fingers player = <player>
			printf \{qs(0xd614b9a8)
				channel = achievements}
		endif
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_beatbox 
	printf \{'Achievements_BEATBOX'}
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
			achievements_awardplayer achievement = beatbox player = <player>
		endif
	else
		if (<controller> = ($primary_controller) && <part> = drum)
			achievements_awardplayer achievement = beatbox player = <player>
			printf \{qs(0x4d5aed0e)
				channel = achievements}
		endif
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_unnoticed_presence 
	printf \{'Achievements_UNNOTICED_PRESENCE'}
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
			achievements_awardplayer achievement = unnoticed_presence player = <player>
		endif
	else
		if (<controller> = ($primary_controller) && <part> = bass)
			achievements_awardplayer achievement = unnoticed_presence player = <player>
			printf \{qs(0x5ac6e222)
				channel = achievements}
		endif
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_bark_at_the_moon 
	printf \{'Achievements_BARK_AT_THE_MOON'}
	gamemode_getnumplayers
	if (<num_players> > 1)
		return
	endif
	achievements_careercomplete \{part = vocals
		player = 1}
	if (<complete> = 1)
		achievements_awardplayer \{achievement = bark_at_the_moon
			player = 1}
		printf \{qs(0x57834595)
			channel = achievements}
	endif
endscript

script achievements_made_of_iron 
	printf \{'Achievements_MADE_OF_IRON'}
	gamemode_getnumplayers
	if (<num_players> > 1)
		return
	endif
	achievements_careercomplete \{part = drum
		player = 1}
	if (<complete> = 1)
		achievements_awardplayer \{achievement = made_of_iron
			player = 1}
		printf \{qs(0xf907caad)
			channel = achievements}
	endif
endscript

script achievements_wondrous_strummer 
	printf \{'Achievements_WONDROUS_STRUMMER'}
	gamemode_getnumplayers
	if (<num_players> > 1)
		return
	endif
	achievements_careercomplete \{part = guitar
		player = 1}
	if (<complete> = 1)
		achievements_awardplayer \{achievement = wondrous_strummer
			player = 1}
		printf \{qs(0xfdf64949)
			channel = achievements}
	endif
endscript

script achievements_low_pitched_king 
	printf \{'Achievements_LOW_PITCHED_KING'}
	gamemode_getnumplayers
	if (<num_players> > 1)
		return
	endif
	achievements_careercomplete \{part = bass
		player = 1}
	if (<complete> = 1)
		achievements_awardplayer \{achievement = low_pitched_king
			player = 1}
		printf \{qs(0xb756190f)
			channel = achievements}
	endif
endscript

script achievements_rock_legends 
	printf \{'Achievements_ROCK_LEGENDS'}
	gamemode_getnumplayersshown
	<player> = 1
	begin
	achievements_careercomplete part = band player = <player>
	if (<complete> = 1)
		achievements_awardplayer achievement = rock_legends player = <player>
		printf \{qs(0x62f27c46)
			channel = achievements}
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_the_one_man_band 
	printf \{'Achievements_THE_ONE_MAN_BAND'}
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
	achievements_awardplayer \{achievement = the_one_man_band
		player = 1}
	printf \{qs(0xfba24e4c)
		channel = achievements}
endscript

script achievements_thunder_kissing 
	printf \{'Achievements_THUNDER_KISSING'}
	if NOT achievements_issongwon
		return
	endif
	if NOT achievements_issongcompleted
		return
	endif
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
	if ($is_network_game = 1)
		getnumplayers
		if (<num_players> < 4)
			printf qs(0x5c94b031) n = <num_players>
			return
		endif
	endif
	if ($achievements_ride_the_lightning_flag = 1)
		achievements_awardband \{achievement = thunder_kissing}
		printf \{qs(0x6fe7b1a1)
			channel = achievements}
		change \{achievements_ride_the_lightning_flag = 0}
	endif
endscript

script achievements_band_leader 
	printf \{'Achievements_BAND_LEADER'}
	if ($is_network_game = 1)
		return
	endif
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
		achievements_awardplayer achievement = band_leader player = <highest_score_player>
		printf \{qs(0x05019a6c)
			channel = achievements}
	endif
endscript

script achievements_a_new_hope 
	printf \{'Achievements_A_NEW_HOPE'}
	if ($is_network_game = 1)
		return
	endif
	if NOT achievements_issongwon
		return
	endif
	if ($rich_presence_context = presence_music_studio)
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
			achievements_awardplayer achievement = a_new_hope player = <player>
			printf \{qs(0xa7c7db42)
				channel = achievements}
		endif
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_cowboys_from_hell 
	printf \{'Achievements_COWBOYS_FROM_HELL'}
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
	achievements_awardband \{achievement = cowboys_from_hell}
	printf \{qs(0x527a1b01)
		channel = achievements}
endscript

script achievements_play_with_me 
	printf \{'Achievements_PLAY_WITH_ME'}
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
			achievements_awardplayer achievement = play_with_me player = <player>
			printf \{qs(0xb10e1247)
				channel = achievements}
		endif
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_you_should_be_afraid 
	printf \{'Achievements_YOU_SHOULD_BE_AFRAID'}
	if NOT achievements_issongwon
		return
	endif
	if ($game_mode = p2_faceoff && $is_network_game)
		determine_game_scores_and_winner
		printf qs(0x09667ec7) n = <team_score>
		printf qs(0x29c1b0ec) n = <opponent_team_score>
		printf qs(0x5f65d94c) b = <tie>
		if (<tie> = false && <team_score> > <opponent_team_score>)
			achievements_awardband \{achievement = you_should_be_afraid}
			printf \{qs(0xae0146f8)
				channel = achievements}
		endif
	endif
endscript

script achievements_jaw_dropper 
	printf \{'Achievements_JAW_DROPPER'}
	if NOT achievements_issongwon
		return
	endif
	if ($game_mode = p2_faceoff && $is_network_game)
		determine_game_scores_and_winner
		if (<tie> = false && <team_score> >= (<opponent_team_score> + 25000))
			achievements_awardband \{achievement = jaw_dropper}
			printf \{qs(0x25c93528)
				channel = achievements}
		endif
	endif
endscript

script achievements_face_to_face 
	printf \{'Achievements_FACE_TO_FACE'}
	if NOT achievements_issongwon
		return
	endif
	if ($game_mode = p2_pro_faceoff && $is_network_game)
		determine_game_scores_and_winner
		printf qs(0x09667ec7) n = <team_score>
		printf qs(0x29c1b0ec) n = <opponent_team_score>
		printf qs(0x5f65d94c) b = <tie>
		if (<tie> = false && <team_score> > <opponent_team_score>)
			achievements_awardband \{achievement = face_to_face}
			printf \{qs(0xd333c052)
				channel = achievements}
		endif
	endif
endscript

script achievements_you_cannot_beat_me 
	printf \{'Achievements_YOU_CANNOT_BEAT_ME'}
	if NOT achievements_issongwon
		return
	endif
	if ($game_mode = p2_pro_faceoff && $is_network_game)
		determine_game_scores_and_winner
		if (<tie> = false && <team_score> >= (<opponent_team_score> + 25000))
			achievements_awardband \{achievement = you_cannot_beat_me}
			printf \{qs(0x1d820239)
				channel = achievements}
		endif
	endif
endscript

script achievements_clash_of_the_titans 
	printf \{'Achievements_CLASH_OF_THE_TITANS'}
	if NOT achievements_issongwon
		return
	endif
	if ($game_mode = p8_pro_faceoff && $is_network_game)
		determine_game_scores_and_winner
		printf qs(0x09667ec7) n = <team_score>
		printf qs(0x29c1b0ec) n = <opponent_team_score>
		printf qs(0x5f65d94c) b = <tie>
		if (<tie> = false && <team_score> > <opponent_team_score>)
			achievements_awardband \{achievement = clash_of_the_titans}
			printf \{qs(0x3ca15c67)
				channel = achievements}
		endif
	endif
endscript

script achievements_craving_for_more 
	printf \{'Achievements_CRAVING_FOR_MORE'}
	if gotparam \{controller}
		writeachievements achievement = craving_for_more controller_id = <controller>
	endif
endscript

script achievements_masterpiece 
	printf \{'Achievements_MASTERPIECE'}
	if gotparam \{controller}
		writeachievements achievement = masterpiece controller_id = <controller>
	endif
endscript

script achievements_ink_and_blood 
	printf \{'Achievements_INK_AND_BLOOD'}
	if gotparam \{controller}
		writeachievements achievement = ink_and_blood controller_id = <controller>
	endif
endscript

script achievements_artist_on_the_rise 
	printf \{'Achievements_ARTIST_ON_THE_RISE'}
	if ($rich_presence_context = presence_music_studio)
		return
	endif
	if gotparam \{controller}
		writeachievements achievement = artist_on_the_rise controller_id = <controller>
		change \{achievements_modified_logo = 0}
	endif
endscript

script achievements_master_craftsmen 
	printf \{'Achievements_MASTER_CRAFTSMEN'}
	if gotparam \{controller}
		writeachievements achievement = master_craftsmen controller_id = <controller>
	endif
endscript

script achievements_in_extremis 
	printf \{'Achievements_IN_EXTREMIS'}
	if ($is_network_game = 1)
		return
	endif
	if NOT achievements_issongwon
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
	getplayerinfo <player> part
	if ($current_song = jamsession &&
			<part> = vocals)
		printf \{qs(0x4ad0e43b)
			channel = achievements}
		return
	endif
	formattext checksumname = player_status 'player%n_status' n = <player>
	if (($<player_status>.current_health) < $health_poor_medium)
		achievements_awardplayer achievement = in_extremis player = <player>
		printf \{qs(0xcc1f60fd)
			channel = achievements}
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_eighth_wonder 
	printf \{'Achievements_EIGHTH_WONDER'}
	if NOT achievements_issongwon
		return
	endif
	gamemode_getnumplayers
	if (<num_players> > 1)
		return
	endif
	if ($current_song != throughthefire)
		printf \{qs(0xa998b6b5)
			channel = achievements}
		return
	endif
	getplayerinfo \{1
		difficulty}
	getplayerinfo \{1
		stars}
	getplayerinfo \{1
		part}
	if (<stars> >= 4 &&
			<part> = guitar &&
			<difficulty> = expert)
		achievements_awardplayer \{achievement = eighth_wonder
			player = 1}
		printf \{qs(0xb592881c)
			channel = achievements}
	endif
endscript

script achievements_bloody_feet 
	printf \{'Achievements_BLOODY_FEET'}
	if NOT achievements_issongwon
		return
	endif
	if ($current_song != rainingblood)
		printf \{qs(0xd383e683)
			channel = achievements}
		return
	endif
	gamemode_getnumplayers
	if (<num_players> > 1)
		return
	endif
	getplayerinfo \{1
		part}
	getplayerinfo \{1
		stars}
	getplayerinfo \{1
		double_kick_drum}
	if (<part> = drum &&
			<double_kick_drum> = 1 &&
			<stars> = 5)
		achievements_awardplayer \{achievement = bloody_feet
			player = 1}
		printf \{qs(0x1ca7f0eb)
			channel = achievements}
	endif
endscript

script achievements_rising_star 
	if NOT achievements_issongwon
		return
	endif
	if ($is_network_game = 1)
		return
	endif
	if ($current_song = jamsession)
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
	if (<difficulty> = expert)
		getplayerinfo <player> part
		if (<part> = vocals)
			getplayerinfo <player> vocal_phrase_quality
			getplayerinfo <player> vocal_phrase_max_qual
			if (<vocal_phrase_quality> = <vocal_phrase_max_qual>)
				if (<vocal_phrase_quality> != 0)
					achievements_awardplayer achievement = rising_star player = <player>
				endif
			endif
		else
			getplayerinfo <player> notes_hit
			getplayerinfo <player> total_notes
			getplayerinfo <player> max_notes
			if (<notes_hit> = <max_notes>)
				if (<total_notes> != 0)
					achievements_awardplayer achievement = rising_star player = <player>
				endif
			endif
		endif
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_free_as_a_band 
	printf \{'Achievements_FREE_AS_A_BAND'}
	if NOT achievements_issongwon
		return
	endif
	gamemode_getnumplayersshown
	if (<num_players_shown> != 4)
		return
	endif
	if ($current_song != freebird)
		printf \{qs(0x33c03a1c)
			channel = achievements}
		return
	endif
	if ($band1_status.score >= 2000000)
		achievements_awardband \{achievement = free_as_a_band}
		printf \{qs(0x8d643c1d)
			channel = achievements}
	endif
endscript

script achievements_killing_in_the_name_of 
	printf \{'Achievements_KILLING_IN_THE_NAME_OF'}
	if ($is_network_game = 0)
		printf \{channel = killinginthename
			qs(0xcd762bf7)}
		return
	endif
	gamemode_getnumplayersshown
	<player> = 1
	begin
	getplayerinfo <player> controller
	if checkforsignin local controller_index = <controller>
		get_savegame_from_controller controller = <controller>
		getglobaltags savegame = <savegame> achievement_info param = num_online_matches_won
		printf channel = killinginthename qs(0x4a4e37ba) p = <player> n = <num_online_matches_won>
		if (<num_online_matches_won> >= 50)
			achievements_awardplayer achievement = killing_in_the_name_of player = <player>
			printf \{qs(0xec0ea1ce)
				channel = achievements}
		endif
	endif
	setglobaltags savegame = <savegame> achievement_info params = {num_online_matches_won = <num_online_matches_won>}
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_cyborg 
	printf \{'Achievements_CYBORG'}
	if NOT achievements_issongwon
		return
	endif
	if ($game_mode = tutorial ||
			$game_mode = training ||
			$game_mode = p1_improv ||
			$rich_presence_context = presence_music_studio)
		return
	endif
	if ($current_song != throughthefire)
		printf \{qs(0xb106b734)
			channel = achievements}
		return
	endif
	gamemode_getnumplayersshown
	<player> = 1
	begin
	getplayerinfo <player> part
	getplayerinfo <player> best_run
	getplayerinfo <player> difficulty
	printf channel = achievements qs(0xa34b5ff7) n = <part> t = <player>
	printf channel = achievements qs(0x349ced74) n = <best_run> t = <player>
	printf channel = achievements qs(0x3ed8a730) n = <difficulty> t = <player>
	if (<part> != drum)
		printf qs(0x8bc689e2) t = <player> channel = achievements
		return
	endif
	if (<difficulty> = hard || <difficulty> = expert)
		if (<best_run> >= 100)
			achievements_awardplayer achievement = cyborg player = <player>
			printf \{qs(0xedeb563a)
				channel = achievements}
		endif
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_rock_veteran 
	printf \{'Achievements_ROCK_VETERAN'}
	if NOT ($game_mode = p1_career ||
			$game_mode = p2_career ||
			$game_mode = p3_career ||
			$game_mode = p4_career)
		return
	endif
	gamemode_getnumplayersshown
	<player> = 1
	begin
	getplayerinfo <player> controller
	if checkforsignin local controller_index = <controller>
		get_savegame_from_controller controller = <controller>
		getglobaltags savegame = <savegame> achievement_info param = total_career_songs_played
		if (<total_career_songs_played> >= 150)
			achievements_awardplayer achievement = rock_veteran player = <player>
			printf \{qs(0xa648fe94)
				channel = achievements}
		endif
	endif
	setglobaltags savegame = <savegame> achievement_info params = {total_career_songs_played = <total_career_songs_played>}
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_amazing_rockstar 
	printf \{'Achievements_AMAZING_ROCKSTAR'}
	gamemode_getnumplayers
	if (<num_players> > 1)
		return
	endif
	achievements_careercomplete \{part = guitar
		difficulty = expert
		player = 1}
	if (<complete> = 0)
		return
	endif
	achievements_careercomplete \{part = bass
		difficulty = expert
		player = 1}
	if (<complete> = 0)
		return
	endif
	achievements_careercomplete \{part = drum
		difficulty = expert
		player = 1}
	if (<complete> = 0)
		return
	endif
	achievements_careercomplete \{part = vocals
		difficulty = expert
		player = 1}
	if (<complete> = 0)
		return
	endif
	achievements_awardplayer \{achievement = amazing_rockstar
		player = 1}
	printf \{qs(0xaea89ba8)
		channel = achievements}
endscript

script achievements_smoking 
	printf \{'Achievements_SMOKING'}
	if NOT achievements_issongcompleted
		return
	endif
	if NOT achievements_issongwon
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
	if ($current_song != smokeonthewater)
		printf \{qs(0x5d166f6b)
			channel = achievements}
		return
	endif
	gamemode_getnumplayersshown
	<player> = 1
	begin
	getplayerinfo <player> part
	if (<part> = vocals)
		achievements_awardplayer achievement = smoking player = <player>
		printf \{qs(0x1498cce6)
			channel = achievements}
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_raining_notes 
	printf \{'Achievements_RAINING_NOTES'}
	if NOT achievements_issongwon
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
	if NOT ($current_song = rainingblood)
		printf \{qs(0xa24ebdc9)
			channel = achievements}
		return
	endif
	gamemode_getnumplayersshown
	<player> = 1
	begin
	getplayerinfo <player> part
	getplayerinfo <player> difficulty
	formattext {
		checksumname = sectionhit
		'%a%b%c'
		a = qs(0x911994f6)
		b = <player>
		c = qs(0x7c535db8)
		addtostringlookup = true
	}
	formattext {
		checksumname = sectionhitmax
		'%a%b%c'
		a = qs(0x911994f6)
		b = <player>
		c = qs(0xad39ac84)
		addtostringlookup = true
	}
	g = (($<sectionhit> [3]) * 1.0)
	h = (($<sectionhitmax> [3]) * 1.0)
	if (<h> = 0)
		h = 1
	endif
	mosh_verification = ((<g> / <h>) * 100.0)
	printstruct <...>
	if (<part> = guitar &&
			<difficulty> = expert &&
			<mosh_verification> = 100)
		achievements_awardplayer achievement = raining_notes player = <player>
		printf \{qs(0xbe448360)
			channel = achievements}
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_glory_to_the_brave 
	printf \{'Achievements_GLORY_TO_THE_BRAVE'}
	gamemode_getnumplayersshown
	<player> = 1
	begin
	if (($levelzones).($current_level).zone = z_atlantis)
		achievements_awardband \{achievement = glory_to_the_brave}
		printf \{qs(0x4615b335)
			channel = achievements}
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_hellborn 
	if NOT achievements_issongwon
		return
	endif
	if ($game_mode = tutorial ||
			$game_mode = training ||
			$game_mode = p1_improv ||
			$rich_presence_context = presence_music_studio)
		return
	endif
	if NOT ($game_mode = p1_quickplay ||
			$game_mode = p1_career)
		printf \{qs(0xadd18d36)
			channel = achievements}
		return
	endif
	gamemode_getnumplayers
	if (<num_players> > 1)
		printf \{qs(0xee480df8)
			channel = achievements}
		return
	endif
	getplayerinfo \{1
		character_id}
	if (<character_id> != lars)
		printf \{qs(0x17da2086)
			channel = achievements}
		return
	endif
	getplayerinfo \{1
		difficulty}
	getplayerinfo \{1
		stars}
	printf qs(0x3c3d58d2) d = <stars> channel = achievements
	if (<stars> = 5 &&
			<difficulty> = expert)
		achievements_awardplayer \{achievement = hellborn
			player = 1}
		printf \{qs(0x1f1a0620)
			channel = achievements}
	endif
endscript

script achievements_golden_voice 
	printf \{'Achievements_GOLDEN_VOICE'}
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
	if NOT ($current_song = killerqueen)
		printf \{qs(0xf699b9da)}
		return
	endif
	gamemode_getnumplayersshown
	<player> = 1
	begin
	getplayerinfo <player> part
	if (<part> = vocals)
		getplayerinfo <player> difficulty
		if (<difficulty> = expert)
			getplayerinfo <player> vocal_phrase_max_qual
			getplayerinfo <player> vocal_phrase_quality
			if (<vocal_phrase_max_qual> > 0)
				<percent> = (((<vocal_phrase_quality> * 1.0) / <vocal_phrase_max_qual>) * 100.0)
				if (<percent> >= 95)
					achievements_awardplayer achievement = golden_voice player = <player>
					printf \{qs(0xaf692200)
						channel = achievements}
				endif
			endif
		endif
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_fast_as_a_shark 
	printf \{'Achievements_FAST_AS_A_SHARK'}
	if NOT achievements_issongwon
		return
	endif
	gamemode_getnumplayers
	if (<num_players> > 1)
		return
	endif
	if ($current_song != yyz)
		printf \{qs(0x12b220ae)
			channel = achievements}
		return
	endif
	getplayerinfo \{1
		difficulty}
	getplayerinfo \{1
		stars}
	getplayerinfo \{1
		part}
	if (<stars> = 5 &&
			<part> = bass &&
			<difficulty> = expert)
		achievements_awardplayer \{achievement = fast_as_a_shark
			player = 1}
		printf \{qs(0xe2ca0a7e)
			channel = achievements}
	endif
endscript

script achievements_open_minded_strummer 
	printf \{'Achievements_OPEN_MINDED_STRUMMER'}
	if NOT achievements_issongwon
		return
	endif
	if NOT ($game_mode = p1_quickplay ||
			$game_mode = p1_career)
		return
	endif
	if ($current_song != laidtorest)
		printf \{qs(0xfc966297)
			channel = achievements}
		return
	endif
	gamemode_getnumplayers
	if (<num_players> > 1)
		return
	endif
	getplayerinfo \{1
		part}
	getplayerinfo \{1
		difficulty}
	printf \{qs(0xabf594c4)
		a = $total_open_notes_hit
		channel = achievements}
	printf qs(0xf87c0ff9) a = <part> channel = achievements
	printf qs(0xc70f6966) b = <difficulty> channel = achievements
	if (<part> = bass &&
			<difficulty> = expert &&
			$total_open_notes_hit = 576)
		achievements_awardplayer \{achievement = open_minded_strummer
			player = 1}
		printf \{qs(0xaf93551f)
			channel = achievements}
	endif
endscript

script achievements_you_play_it_well 
	printf \{'Achievements_YOU_PLAY_IT_WELL'}
	if NOT achievements_issongwon
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
	if NOT ($current_song = playwithme)
		printf \{qs(0xe74c34e5)}
		return
	endif
	gamemode_getnumplayersshown
	<player> = 1
	begin
	getplayerinfo <player> part
	getplayerinfo <player> difficulty
	formattext {
		checksumname = sectionhit
		'%a%b%c'
		a = qs(0x911994f6)
		b = <player>
		c = qs(0x7c535db8)
		addtostringlookup = true
	}
	formattext {
		checksumname = sectionhitmax
		'%a%b%c'
		a = qs(0x911994f6)
		b = <player>
		c = qs(0xad39ac84)
		addtostringlookup = true
	}
	g = (($<sectionhit> [18]) * 1.0)
	h = (($<sectionhitmax> [18]) * 1.0)
	if (<h> = 0)
		h = 1
	endif
	pwm_verification = ((<g> / <h>) * 100.0)
	printstruct <...>
	if (<part> = guitar &&
			<difficulty> = expert &&
			<pwm_verification> = 100)
		achievements_awardplayer achievement = you_play_it_well player = <player>
		printf \{qs(0xbdcfc854)
			channel = achievements}
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_deadzone 
	printf \{'Achievements_DEADZONE'}
	if achievements_issongwon
		return
	endif
	gamemode_getnumplayers
	if (<num_players> > 1)
		return
	endif
	getplayerinfo \{1
		star_power_amount}
	if (<star_power_amount> >= 50)
		achievements_awardplayer \{achievement = deadzone
			player = 1}
		printf \{qs(0x63258f80)
			channel = achievements}
	endif
endscript

script achievements_hail_the_reverend 
	printf \{'Achievements_HAIL_THE_REVEREND'}
	if NOT achievements_issongwon
		return
	endif
	if NOT ($current_song = beastandtheharlot)
		printf \{qs(0x22834e60)}
		return
	endif
	gamemode_getnumplayers
	if (<num_players> > 1)
		return
	endif
	getplayerinfo \{1
		star_power_use_count}
	getplayerinfo \{1
		part}
	getplayerinfo \{1
		difficulty}
	getplayerinfo \{1
		stars}
	if (<star_power_use_count> = 0 &&
			<part> = drum &&
			<difficulty> = expert &&
			<stars> = 5)
		achievements_awardplayer \{achievement = hail_the_reverend
			player = 1}
		printf \{qs(0x6b56352d)
			channel = achievements}
	endif
endscript
