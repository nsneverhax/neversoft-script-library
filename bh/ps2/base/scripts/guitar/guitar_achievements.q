gStar_Power_Triggered = 0
achievements_songcompleteflag = 0
Achievements_SongWonFlag = 0
achievements_newgigwonflag = 0
achievements_2x4_flag = 0
achievements_ride_the_lightning_flag = 0
achievements_super_group_unite_flag = 0
achievements_creating_character = 0
achievements_modified_logo = 0
achievements_ignore_bots = 0

script achievements_resetglobals 
	Change \{Achievements_SongWonFlag = 0}
	Change \{achievements_newgigwonflag = 0}
	Change \{achievements_2x4_flag = 0}
	Change \{achievements_ride_the_lightning_flag = 0}
	Change \{achievements_super_group_unite_flag = 0}
	Change \{achievements_creating_character = 0}
	Change \{achievements_modified_logo = 0}
	Change \{achievements_ignore_bots = 0}
endscript

script Achievements_IsSongWon 
	if ($Achievements_SongWonFlag = 1)
		return \{true}
	endif

	return \{FALSE}
endscript

script achievements_issongcompleted 
	if ($achievements_songcompleteflag = 1)
		return \{true}
	endif

	return \{FALSE}
endscript

script achievements_isnewgigwon 
	if ($achievements_newgigwonflag = 1)
		return \{true}
	endif
	return \{FALSE}
endscript

script achievements_areanygigswon \{part = 'guitar'}
	formatText checksumName = career_part_struct 'gh4_career_%p_songs' p = <part>
	<total_gigs> = ($<career_part_struct>.num_tiers)
	<i> = 1
	begin
	formatText checksumName = career_part_gig 'career_%p_gig%n' p = <part> n = <i>
	GetGlobalTags <career_part_gig>
	if (<completed> = 1)
		return \{true}
	endif
	<i> = (<i> + 1)
	repeat <total_gigs>
	return \{FALSE}
endscript

script achievements_numgigswon \{part = 'guitar'}
	<player_status> = ($0x2994109a [<Player>])
	get_savegame_from_controller controller = ($<player_status>.controller)
	formatText checksumName = career_part_struct 'gh4_career_%p_songs' p = <part>
	<total_gigs> = ($<career_part_struct>.num_tiers)
	<num_crucial_gigs> = 0
	<num_gigs_won> = 0
	<i> = 1
	begin
	formatText checksumName = career_part_gig 'career_%p_gig%n' p = <part> n = <i>
	GetGlobalTags <career_part_gig> savegame = <savegame>
	formatText checksumName = Tier 'tier%n' n = <i>
	if NOT StructureContains structure = ($<career_part_struct>.<Tier>) debug_gig
		if NOT StructureContains structure = ($<career_part_struct>.<Tier>) createagig
			<num_crucial_gigs> = (<num_crucial_gigs> + 1)
			if (<completed> = 1)
				<num_gigs_won> = (<num_gigs_won> + 1)
			endif
		endif
	endif
	<i> = (<i> + 1)
	repeat <total_gigs>
	return num_gigs_won = <num_gigs_won> total_gigs = <num_crucial_gigs>
endscript

script achievements_careercomplete \{part = guitar
		Player = 1}
	getplayerinfo <Player> bot_play
	if (<bot_play> = 1)
		return \{complete = 0}
	endif
	if isXenon
		getplayerinfo <Player> controller
		if NOT CheckForSignIn local controller_index = <controller>
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
		case Band
		tier_global = gh4_career_band_songs
		default

		return \{complete = 0}
	endswitch
	getplayerinfo <Player> controller
	getsavegamefromcontroller controller = <controller>
	if NOT GotParam \{difficulty}
		format_globaltag_song_checksum part_text = ($part_list_props.<part>.text_nl) song = thethingthat difficulty = <difficulty>
		GetGlobalTags <song_checksum> param = stars savegame = <savegame>

		if (<stars> >= 3)
			return \{complete = 1}
		endif
	else
		GetArraySize ($difficulty_list)
		<i> = 0
		begin
		format_globaltag_song_checksum part_text = ($part_list_props.<part>.text_nl) song = thethingthat difficulty_index = <i>
		GetGlobalTags <song_checksum> param = stars savegame = <savegame>

		if (<stars> >= 3)
			return \{complete = 1}
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
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
		case None
		return \{part_string = 'none'}
		default
		return \{part_string = 'none'}
	endswitch
endscript

script achievements_awardplayer 
	if ($achievements_ignore_bots = 0)
		getplayerinfo <Player> bot_play
		if (<bot_play> = 1)
			return
		endif
	endif
	getplayerinfo <Player> part
	if (<part> = vocals && $current_song = orion)
		return
	endif
	<player_status> = ($0x2994109a [<Player>])
	<controller> = ($<player_status>.controller)
	WriteAchievements achievement = <achievement> controller_id = <controller>

endscript

script achievements_awardband 
	gamemode_getnumplayersshown
	<Player> = 1
	begin
	achievements_awardplayer achievement = <achievement> Player = <Player>
	<Player> = (<Player> + 1)
	repeat <num_players_shown>
endscript

script achievements_checkforbandstreak 
	if ($achievements_2x4_flag = 0 && ($game_mode = gh4_p4_career || $game_mode = p4_quickplay || $game_mode = p8_pro_faceoff))
		<four_way_streak> = 1
		<Player> = 1
		begin
		getplayerinfo <Player> current_run
		if (<current_run> < 50)
			<four_way_streak> = 0
			break
		endif
		<Player> = (<Player> + 1)
		repeat 4
		if (<four_way_streak> = 1)
			Change \{achievements_2x4_flag = 1}
		endif
	endif
endscript

script achievements_ischeatingautokick 
	if ($cheat_autokick = 1 || $cheat_freedrum = 1)
		gamemode_getnumplayersshown
		<Player> = 1
		begin
		getplayerinfo <Player> part
		if (<part> = drum)

			return \{true}
		endif
		<Player> = (<Player> + 1)
		repeat <num_players_shown>
	endif
	return \{FALSE}
endscript

script achievements_ischeating 
	if ($cheat_autokick = 1 || $cheat_freedrum = 1)
		gamemode_getnumplayersshown
		<Player> = 1
		begin
		getplayerinfo <Player> part
		if (<part> = drum)

			return \{true}
		endif
		<Player> = (<Player> + 1)
		repeat <num_players_shown>
	endif
	if ($cheat_alwaysslide = 1)
		gamemode_getnumplayersshown
		<Player> = 1
		begin
		getplayerinfo <Player> part
		if (<part> = guitar)

			return \{true}
		endif
		<Player> = (<Player> + 1)
		repeat <num_players_shown>
	endif
	return \{FALSE}
endscript

script achievements_resetgreenhellflags 
endscript

script achievements_onlinematchplayed 
endscript

script achievements_the_more_i_see 

	GetGlobalTags \{practice}
	if (<basic_lesson> = complete ||
			<star_power_lesson> = complete ||
			<advanced_techniques_lesson> = complete ||
			<new_features_lesson> = complete ||
			<drum_basic_lesson> = complete ||
			<drum_int_lesson> = complete ||
			<vocals_lesson> = complete ||
			<band_lesson> = complete ||
			<versus_lesson> = complete ||
			<rs_introduction_lesson> = complete ||
			<rs_lead_and_bass_lesson> = complete ||
			<rs_rhythm_lesson> = complete ||
			<rs_drums_lesson> = complete ||
			<rs_melody_lesson> = complete ||
			<rs_recording_lesson> = complete ||
			<rs_pro_guitar_lesson> = complete ||
			<rs_advanced_tools_lesson> = complete ||
			<rs_ghmix_editing_lesson> = complete ||
			<rs_ghmix_pro_techniques_tools_lesson> = complete)

		WriteAchievements \{achievement = the_more_i_see
			controller_id = 0}
		WriteAchievements \{achievement = the_more_i_see
			controller_id = 1}
		WriteAchievements \{achievement = the_more_i_see
			controller_id = 2}
		WriteAchievements \{achievement = the_more_i_see
			controller_id = 3}
	endif
endscript

script achievements_metallica 

	gamemode_getnumplayersshown
	<Player> = 1
	begin
	achievements_careercomplete part = guitar Player = <Player> difficulty = expert
	if (<complete> = 1)
		achievements_awardplayer achievement = metallica Player = <Player>
	endif
	achievements_careercomplete part = bass Player = <Player> difficulty = expert
	if (<complete> = 1)
		achievements_awardplayer achievement = metallica Player = <Player>
	endif
	achievements_careercomplete part = drum Player = <Player> difficulty = expert
	if (<complete> = 1)
		achievements_awardplayer achievement = metallica Player = <Player>
	endif
	achievements_careercomplete part = vocals Player = <Player> difficulty = expert
	if (<complete> = 1)
		achievements_awardplayer achievement = metallica Player = <Player>
	endif
	achievements_careercomplete part = Band Player = <Player> difficulty = expert
	if (<complete> = 1)
		achievements_awardplayer achievement = metallica Player = <Player>
	endif
	<Player> = (<Player> + 1)
	repeat <num_players_shown>
endscript

script achievements_james_hetfield 

	gamemode_getnumplayers
	if (<num_players> > 1)
		return
	endif
	achievements_careercomplete \{part = vocals
		Player = 1}
	if (<complete> = 1)
		achievements_awardplayer \{achievement = james_hetfield
			Player = 1}
	endif
endscript

script achievements_lars_ulrich 

	gamemode_getnumplayers
	if (<num_players> > 1)
		return
	endif
	achievements_careercomplete \{part = drum
		Player = 1}
	if (<complete> = 1)
		achievements_awardplayer \{achievement = lars_ulrich
			Player = 1}
	endif
endscript

script achievements_robert_trujillo 

	gamemode_getnumplayers
	if (<num_players> > 1)
		return
	endif
	achievements_careercomplete \{part = bass
		Player = 1}
	if (<complete> = 1)
		achievements_awardplayer \{achievement = robert_trujillo
			Player = 1}
	endif
endscript

script achievements_holier_than_thou 

	gamemode_getnumplayers
	if (<num_players> > 1)
		return
	endif
	achievements_careercomplete \{part = guitar
		Player = 1}
	if (<complete> = 0)
		return
	endif
	achievements_careercomplete \{part = bass
		Player = 1}
	if (<complete> = 0)
		return
	endif
	achievements_careercomplete \{part = drum
		Player = 1}
	if (<complete> = 0)
		return
	endif
	achievements_careercomplete \{part = vocals
		Player = 1}
	if (<complete> = 0)
		return
	endif
	achievements_awardplayer \{achievement = holier_than_thou
		Player = 1}
endscript

script achievements_one 

	if NOT achievements_issongcompleted
		return
	endif
	if ($game_mode = tutorial ||
			$game_mode = practice ||
			$rich_presence_context = presence_music_studio)
		return
	endif
	gamemode_getnumplayersshown
	<Player> = 1
	begin
	getplayerinfo <Player> difficulty
	if (<difficulty> = hard || <difficulty> = expert)
		achievements_awardplayer achievement = one Player = <Player>
	endif
	<Player> = (<Player> + 1)
	repeat <num_players_shown>
endscript

script achievements_and_justice_for_all 

	gamemode_getnumplayers
	if (<num_players> > 1)
		return
	endif
	progression_get_total_stars

	if (<total_stars> >= 100)
		achievements_awardplayer \{achievement = and_justice_for_all
			Player = 1}
	endif
endscript

script achievements_the_ecstacy_of_gold 
endscript

script achievements_damage_inc 

	if NOT achievements_issongcompleted
		return
	endif
	if ($game_mode = tutorial ||
			$game_mode = practice ||
			$rich_presence_context = presence_music_studio)
		return
	endif
	getplayerinfo \{1
		part}
	if (<part> = drum)
		achievements_awardplayer \{achievement = damage_inc
			Player = 1}
	endif
endscript

script achievements_some_kind_of_monster 

	if NOT achievements_issongcompleted
		return
	endif
	if ($game_mode = tutorial ||
			$game_mode = practice ||
			$rich_presence_context = presence_music_studio)
		return
	endif
	getplayerinfo \{1
		part}
	if (<part> = guitar)
		achievements_awardplayer \{achievement = some_kind_of_monster
			Player = 1}
	endif
endscript

script achievements_ride_the_lightning 

	if NOT ($game_mode = p4_quickplay ||
			$game_mode = gh4_p4_career ||
			$game_mode = p8_pro_faceoff)
		return
	endif
	if ($game_mode = tutorial ||
			$game_mode = practice ||
			$rich_presence_context = presence_music_studio)
		return
	endif
	if ($achievements_ride_the_lightning_flag = 1)
		achievements_awardband \{achievement = ride_the_lightning}
		Change \{achievements_ride_the_lightning_flag = 0}
	endif
endscript

script achievements_2x4 

	if NOT ($game_mode = p4_quickplay ||
			$game_mode = gh4_p4_career ||
			$game_mode = p8_pro_faceoff)
		return
	endif
	if ($game_mode = tutorial ||
			$game_mode = practice ||
			$rich_presence_context = presence_music_studio)
		return
	endif
	if ($achievements_2x4_flag = 1)
		achievements_awardband \{achievement = 2x4}
		Change \{achievements_2x4_flag = 0}
	endif
endscript

script achievements_metal_militia 

	if NOT Achievements_IsSongWon
		return
	endif
	if ($current_song = jamsession)

		return
	endif
	if NOT ($game_mode = p4_quickplay ||
			$game_mode = gh4_p4_career ||
			$game_mode = p8_pro_faceoff)

		return
	endif
	gamemode_getnumplayersshown
	<Player> = 1
	begin
	getplayerinfo <Player> part
	if (<part> != vocals)
		getplayerinfo <Player> notes_hit
		getplayerinfo <Player> total_notes
		getplayerinfo <Player> max_notes
		if ((<notes_hit> < <max_notes>) || (<total_notes> = 0))

			return
		endif
	else
		getplayerinfo <Player> vocal_phrase_quality
		getplayerinfo <Player> vocal_phrase_max_qual
		if ((<vocal_phrase_quality> < <vocal_phrase_max_qual>) || (<vocal_phrase_quality> = 0))

			return
		endif
	endif
	<Player> = (<Player> + 1)
	repeat <num_players_shown>
	achievements_awardband \{achievement = metal_militia}
endscript

script achievements_master_of_puppets 

	if NOT Achievements_IsSongWon
		return
	endif
	if NOT ($game_mode = p4_quickplay ||
			$game_mode = gh4_p4_career ||
			$game_mode = p8_pro_faceoff)
		return
	endif
	<highest_score> = 0
	<highest_score_player> = -1
	<highest_score_part> = None
	<Player> = 1
	begin
	getplayerinfo <Player> score
	if (<score> > <highest_score>)
		<highest_score> = <score>
		<highest_score_player> = <Player>
	endif
	<Player> = (<Player> + 1)
	repeat 4
	if (<highest_score_player> > -1)
		achievements_awardplayer achievement = master_of_puppets Player = <highest_score_player>
	endif
endscript

script achievements_the_struggle_within 

	if NOT Achievements_IsSongWon
		return
	endif
	if NOT ($game_mode = p4_quickplay ||
			$game_mode = gh4_p4_career ||
			$game_mode = p8_pro_faceoff)
		return
	endif
	achievements_awardband \{achievement = the_struggle_within}
endscript

script achievements_black 

	if NOT Achievements_IsSongWon

		return
	endif
	if ($is_network_game = 0)

		return
	endif
	getplayerinfo \{1
		final_blow_powerup}
	if (<final_blow_powerup> < 0)

		return
	endif
	<powerup> = ($battlemode_powerups [<final_blow_powerup>].Name)

	if (<powerup> = blackout)
		getplayerinfo \{1
			current_health}
		if (<current_health> > 0.0)
			achievements_awardplayer \{achievement = black
				Player = 1}
		endif
	endif
endscript

script achievements_better_than_you 

	if NOT Achievements_IsSongWon
		return
	endif
	if ($game_mode = p2_pro_faceoff && $is_network_game)
		determine_game_scores_and_winner



		if (<tie> = FALSE && <team_score> > <opponent_team_score>)
			achievements_awardband \{achievement = better_than_you}
		endif
	endif
endscript

script achievements_blitzkrieg 

	if NOT Achievements_IsSongWon
		return
	endif
	if ($game_mode = p8_pro_faceoff && $is_network_game)
		determine_game_scores_and_winner



		if (<tie> = FALSE && <team_score> > <opponent_team_score>)
			achievements_awardband \{achievement = blitzkrieg}
		endif
	endif
endscript

script achievements_seek_and_destroy 

endscript

script achievements_the_unforgiven 

	if NOT Achievements_IsSongWon
		return
	endif
endscript

script achievements_the_unforgiven_ii 

	if NOT Achievements_IsSongWon
		return
	endif
endscript

script achievements_the_unforgiven_iii 

	if NOT Achievements_IsSongWon
		return
	endif
	if ($game_mode = p2_pro_faceoff && $is_network_game)
		determine_game_scores_and_winner
		if (<tie> = FALSE && <team_score> >= (<opponent_team_score> + 25000))
			achievements_awardband \{achievement = the_unforgiven_iii}
		endif
	endif
endscript

script achievements_reload 

	if GotParam \{controller}
		WriteAchievements achievement = reload controller_id = <controller>
	endif
endscript

script achievements_green_hell 

endscript

script achievements_disposable_heroes 

	if GotParam \{controller}
		WriteAchievements achievement = disposable_heroes controller_id = <controller>
	endif
endscript

script achievements_eye_of_the_beholder 

	if ($rich_presence_context = presence_music_studio)
		return
	endif
	if GotParam \{controller}
		WriteAchievements achievement = eye_of_the_beholder controller_id = <controller>
		Change \{achievements_modified_logo = 0}
	endif
endscript

script achievements_fixxxer 

	if GotParam \{controller}
		WriteAchievements achievement = fixxxer controller_id = <controller>
	endif
endscript

script achievements_hero_of_the_day 

	if ($rich_presence_context = presence_music_studio)
		return
	endif
	if NOT Achievements_IsSongWon
		return
	endif
	if ($current_song = jamsession)
		return
	endif
	if NOT StructureContains structure = ($permanent_songlist_props.($current_song)) double_kick

		return
	endif
	if (($permanent_songlist_props.($current_song)).double_kick = 0)

		return
	endif
	gamemode_getnumplayersshown
	<Player> = 1
	begin
	getplayerinfo <Player> part
	getplayerinfo <Player> double_kick_drum
	if (<part> = drum && <double_kick_drum> = 1)
		achievements_awardplayer achievement = hero_of_the_day Player = <Player>
	endif
	<Player> = (<Player> + 1)
	repeat <num_players_shown>
endscript

script achievements_wherever_i_may_roam 

endscript

script achievements_stone_dead_forever 

	if NOT achievements_issongcompleted
		return
	endif
	if (($LevelZones).($current_level).zone = z_stone)
		achievements_awardband \{achievement = stone_dead_forever}
	endif
endscript

script achievements_king_diamond 

	if NOT Achievements_IsSongWon
		return
	endif
	if ($current_song = jamsession)
		return
	endif
	if NOT ($game_mode = p1_quickplay ||
			$game_mode = p2_quickplay ||
			$game_mode = p3_quickplay ||
			$game_mode = p4_quickplay ||
			$game_mode = gh4_p1_career ||
			$game_mode = gh4_p2_career ||
			$game_mode = gh4_p3_career ||
			$game_mode = gh4_p4_career)
		return
	endif
	if StructureContains structure = ($permanent_songlist_props.($current_song)) Band
		if (($permanent_songlist_props.($current_song).Band) = band_metallica ||
				($permanent_songlist_props.($current_song).Band) = band_lemmy)
			return
		endif
	endif
	gamemode_getnumplayersshown
	<Player> = 1
	begin
	getplayerinfo <Player> character_id
	getplayerinfo <Player> part
	if (<character_id> = kingdiamond || ($permanent_songlist_props.($current_song).Band) = band_kingdiamond)
		if (<part> = vocals)
			achievements_awardplayer achievement = king_diamond Player = <Player>
		endif
	endif
	<Player> = (<Player> + 1)
	repeat <num_players_shown>
endscript

script achievements_creeping_death 

	if NOT Achievements_IsSongWon
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
			Player = 1}
	endif
endscript

script achievements_dyers_eve 

	if NOT Achievements_IsSongWon
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
			Player = 1}
	endif
endscript

script achievements_stone_cold_crazy 

	if NOT Achievements_IsSongWon
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
			Player = 1}
	endif
endscript

script achievements_enter_sandman 

	if NOT Achievements_IsSongWon
		return
	endif
	gamemode_getnumplayers
	if (<num_players> > 1)
		return
	endif
	getplayerinfo \{1
		score}
	if (<score> >= 330000 &&
			$current_song = entersandman)
		achievements_awardplayer \{achievement = enter_sandman
			Player = 1}
	endif
endscript

script achievements_astronomy 

	if NOT Achievements_IsSongWon
		return
	endif
	if ($current_song != orion)
		return
	endif
	gamemode_getnumplayersshown
	<Player> = 1
	begin
	getplayerinfo <Player> sp_phrases_hit
	getplayerinfo <Player> sp_phrases_total


	if (<sp_phrases_hit> = <sp_phrases_total>)
		achievements_awardplayer achievement = astronomy Player = <Player>
	endif
	<Player> = (<Player> + 1)
	repeat <num_players_shown>
endscript
