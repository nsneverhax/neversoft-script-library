gstar_power_triggered = 0
achievement_scripts = [
	achievements_star_fleet_project
	achievements_hamilton_elementary_school
	achievements_beat_it
	achievements_eat_em_and_smile
	achievements_respect_the_wind
	achievements_fender_bender
	achievements_bang_your_gong
	achievements_brown_sound
	achievements_diamond_dave
	achievements_king_arthur
	achievements_rock_me_amadeus
	achievements_you_really_got_me
	achievements_gazzaris
	achievements_cafe_wha
	achievements_whisky_a_gogo
	achievements_starwood
	achievements_walter_mitty
	achievements_where_have_all_the_good_times_gone
	achievements_hot_for_high_scores
	achievements_im_the_one
	achievements_the_broken_combs
	achievements_the_trojan_rubber_company
	achievements_jump
	achievements_unchained
	achievements_genesis
	achievements_the_space_brothers
	achievements_guitar_god
	achievements_diamond_in_the_rough
	achievements_double_bass_master
	achievements_316
	achievements_red_ball_jets
	achievements_mammoth
	achievements_1984_helper
	achievements_the_woodshed
	achievements_5150
]

script achievements_update 
	return
	if ($is_network_game = 1)
		if NOT gamemode_iscooperative
			determine_game_scores_and_winner
			printf channel = ach_debug qs(0x09667ec7) n = <team_score>
			printf channel = ach_debug qs(0x29c1b0ec) n = <opponent_team_score>
			printf channel = ach_debug qs(0x5f65d94c) b = <tie>
			if (<opponent_team_score> > <team_score> || <tie> = true)
				change \{achievements_songwonflag = 0}
			endif
		endif
	endif
	getarraysize \{$achievement_scripts}
	printf channel = ach_debug qs(0x026acf46) n = ($achievements_songwonflag)
	<i> = 0
	begin
	<scr> = ($achievement_scripts [<i>])
	<scr>
	<i> = (<i> + 1)
	repeat <array_size>
endscript
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
	printf \{channel = ach_debug
		qs(0x5ef4d603)}
	return \{false}
endscript

script achievements_isnewgigwon 
	if ($achievements_newgigwonflag = 1)
		return \{true}
	endif
	return \{false}
endscript

script is_modern_band_vanhalen 
	if NOT gotparam \{band}
		get_band_name song = ($current_song)
	endif
	switch <band>
		case band_vanhalen
		case band_vanhalen_dlr_guitar
		case band_vanhalen_eddie_drill
		case band_vanhalen_wolf_drill
		return \{true}
	endswitch
	return \{false}
endscript

script is_retro_band_vanhalen 
	if NOT gotparam \{band}
		get_band_name song = ($current_song)
	endif
	switch <band>
		case band_vanhalen_alt
		case band_vanhalen_eddie_alt_drill
		case band_vanhalen_dlr_alt_guitar
		return \{true}
	endswitch
	return \{false}
endscript

script played_all_expertplus_songs 
	requireparams \{[
			player
		]
		all}
	getarraysize ($gh_songlist)
	<index> = 0
	begin
	<song> = ($gh_songlist [<index>])
	if structurecontains structure = ($permanent_songlist_props) <song>
		if structurecontains structure = ($permanent_songlist_props.<song>) double_kick
			if (($permanent_songlist_props.<song>.double_kick) = 1)
				printf channel = bort qs(0x92054922) d = <song> e = ($permanent_songlist_props.<song>.double_kick)
				format_globaltag_song_checksum song = <song> part_text = 'drum'
				getglobaltags <song_checksum> param = double_bass_complete
				if (<double_bass_complete> = 0)
					printf channel = bort qs(0x069e087b) d = <song>
					return \{false}
				endif
			endif
		endif
	endif
	<index> = (<index> + 1)
	repeat <array_size>
	return \{true}
endscript

script unwindrandomappearance 
	requireparams \{[
			character_id
		]
		all}
	<temp_cid> = <character_id>
	if structurecontains structure = ($guest_character_names) randomappearance0
		if (<character_id> = randomappearance0)
			<temp_cid> = (($guest_character_names).randomappearance0)
		endif
	endif
	if structurecontains structure = ($guest_character_names) randomappearance1
		if (<character_id> = randomappearance1)
			<temp_cid> = (($guest_character_names).randomappearance1)
		endif
	endif
	if structurecontains structure = ($guest_character_names) randomappearance2
		if (<character_id> = randomappearance2)
			<temp_cid> = (($guest_character_names).randomappearance2)
		endif
	endif
	if structurecontains structure = ($guest_character_names) randomappearance3
		if (<character_id> = randomappearance3)
			<temp_cid> = (($guest_character_names).randomappearance3)
		endif
	endif
	if NOT (<temp_cid> = <character_id>)
		printf channel = ach_debug qs(0x05cd2142) c = <character_id> t = <temp_cid>
	endif
	return temp_cid = <temp_cid>
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

script achievements_hasgigbeenwonondiff \{part = 'guitar'
		diff = expert}
	formattext checksumname = player_status 'player%n_status' n = <player>
	get_savegame_from_controller controller = ($<player_status>.controller)
	formattext checksumname = career_part_struct 'gh4_career_%p_songs' p = <part>
	<total_gigs> = ($<career_part_struct>.num_tiers)
	<num_gigs_won> = 0
	<num_gigs_fived> = 0
	formattext checksumname = career_part_gig 'career_%p_gig%n' p = <part> n = <gignum>
	getglobaltags <career_part_gig> savegame = <savegame>
	formattext checksumname = tier 'tier%n' n = <gignum>
	if NOT structurecontains structure = ($<career_part_struct>.<tier>) paytoplay
		if NOT structurecontains structure = ($<career_part_struct>.<tier>) debug_gig
			if NOT structurecontains structure = ($<career_part_struct>.<tier>) createagig
				getarraysize ($<career_part_struct>.<tier>.songs)
				<num_required> = <array_size>
				<num_five_stars> = <array_size>
				<song_size> = <array_size>
				<array_entry> = 0
				begin
				format_globaltag_song_checksum part = ($<career_part_struct>.part) song = ($<career_part_struct>.<tier>.songs [<array_entry>]) difficulty = <diff>
				getglobaltags <song_checksum> params = stars
				if (<stars> > 2)
					<num_required> = (<num_required> - 1)
				endif
				if (<stars> > 4)
					<num_five_stars> = (<num_five_stars> - 1)
				endif
				<array_entry> = (<array_entry> + 1)
				repeat <song_size>
				if (<num_required> <= 0)
					<num_gigs_won> = (<num_gigs_won> + 1)
				endif
				if (<num_five_stars> <= 0)
					<num_gigs_fived> = (<num_gigs_fived> + 1)
				endif
			endif
		endif
	endif
	return num_gigs_won = <num_gigs_won> num_gigs_fived = <num_gigs_fived>
endscript

script achievements_hasgigbeenwon \{part = 'guitar'}
	formattext checksumname = player_status 'player%n_status' n = <player>
	get_savegame_from_controller controller = ($<player_status>.controller)
	formattext checksumname = career_part_struct 'gh4_career_%p_songs' p = <part>
	<total_gigs> = ($<career_part_struct>.num_tiers)
	<num_gigs_won> = 0
	<num_gigs_fived> = 0
	formattext checksumname = career_part_gig 'career_%p_gig%n' p = <part> n = <gignum>
	getglobaltags <career_part_gig> savegame = <savegame>
	formattext checksumname = tier 'tier%n' n = <gignum>
	if NOT structurecontains structure = ($<career_part_struct>.<tier>) paytoplay
		if NOT structurecontains structure = ($<career_part_struct>.<tier>) debug_gig
			if NOT structurecontains structure = ($<career_part_struct>.<tier>) createagig
				getarraysize ($<career_part_struct>.<tier>.songs)
				num_required = <array_size>
				num_five_stars = 0
				completed_songs = 0
				<array_entry> = 0
				begin
				diff_index = 0
				begin
				format_globaltag_song_checksum part = ($<career_part_struct>.part) song = ($<career_part_struct>.<tier>.songs [<array_entry>]) difficulty_index = <diff_index>
				getglobaltags <song_checksum> params = stars
				if (<stars> > 4)
					completed_songs = (<completed_songs> + 1)
					num_five_stars = (<num_five_stars> + 1)
					break
				elseif (<stars> > 2)
					completed_songs = (<completed_songs> + 1)
					break
				endif
				diff_index = (<diff_index> + 1)
				repeat 5
				<array_entry> = (<array_entry> + 1)
				repeat <num_required>
				if (<num_required> = <completed_songs>)
					<num_gigs_won> = (<num_gigs_won> + 1)
				endif
				if (<num_five_stars> = <completed_songs>)
					<num_gigs_fived> = (<num_gigs_fived> + 1)
				endif
			endif
		endif
	endif
	return num_gigs_won = <num_gigs_won> num_gigs_fived = <num_gigs_fived>
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
	if (<part> = vocals && $current_song = orion)
		return
	endif
	formattext checksumname = player_status 'player%n_status' n = <player>
	<controller> = ($<player_status>.controller)
	writeachievements achievement = <achievement> controller_id = <controller>
	printf channel = ach_debug qs(0x41f01db8) n = <player> c = <controller>
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
	if ($cheat_freedrum = 1)
		gamemode_getnumplayersshown
		<player> = 1
		begin
		getplayerinfo <player> part
		if (<part> = drum)
			printf \{channel = ach_debug
				qs(0x90144029)}
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
			printf \{channel = ach_debug
				qs(0x90144029)}
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
			printf \{channel = ach_debug
				qs(0x90144029)}
			return \{true}
		endif
		<player> = (<player> + 1)
		repeat <num_players_shown>
	endif
	return \{false}
endscript

script achievements_resetgreenhellflags 
	gamemode_getnumplayersshown
	printf channel = ach_debug qs(0xbd640c58) n = <num_players_shown> channel = ach_debug
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
	<player> = 1
	begin
	getplayerinfo <player> controller
	get_savegame_from_controller controller = <controller>
	getglobaltags savegame = <savegame> achievement_info param = num_online_matches_played
	<num_online_matches_played> = (<num_online_matches_played> + 1)
	setglobaltags savegame = <savegame> achievement_info params = {num_online_matches_played = <num_online_matches_played>}
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_hamilton_elementary_school 
	printf channel = ach_debug 'Achievements_HAMILTON_ELEMENTARY_SCHOOL %g' g = ($game_mode)
	gamemode_getnumplayers
	<player> = 1
	begin
	getplayerinfo <player> controller
	get_savegame_from_controller controller = <controller>
	getglobaltags savegame = <savegame> training
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
		printf channel = ach_debug qs(0x18af45dc) s = <savegame> p = <player>
		writeachievements achievement = hamilton_elementary_school controller_id = <controller>
	endif
	<player> = (<player> + 1)
	repeat <num_players>
endscript

script achievements_james_hetfield 
	printf \{channel = ach_debug
		'Achievements_JAMES_HETFIELD'}
	gamemode_getnumplayers
	if (<num_players> > 1)
		return
	endif
	if achievements_ischeating
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
	printf \{channel = ach_debug
		'Achievements_LARS_ULRICH'}
	gamemode_getnumplayers
	if (<num_players> > 1)
		return
	endif
	if achievements_ischeating
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
	printf \{channel = ach_debug
		'Achievements_KIRK_HAMMET'}
	gamemode_getnumplayers
	if (<num_players> > 1)
		return
	endif
	if achievements_ischeating
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
	printf \{channel = ach_debug
		'Achievements_ROBERT_TRUJILLO'}
	gamemode_getnumplayers
	if (<num_players> > 1)
		return
	endif
	if achievements_ischeating
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
	printf \{channel = ach_debug
		'Achievements_HOLIER_THAN_THOU'}
	gamemode_getnumplayers
	if (<num_players> > 1)
		return
	endif
	if achievements_ischeating
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
	printf \{channel = ach_debug
		'Achievements_ONE'}
	if NOT achievements_issongwon
		return
	endif
	if achievements_ischeating
		return
	endif
	if ($game_mode = tutorial ||
			$game_mode = training ||
			$game_mode = p1_improv ||
			$rich_presence_context = presence_music_studio)
		return
	endif
	achievements_awardband \{achievement = one}
endscript

script achievements_and_justice_for_all 
	printf \{channel = ach_debug
		'Achievements_AND_JUSTICE_FOR_ALL'}
	gamemode_getnumplayers
	if (<num_players> > 1)
		return
	endif
	progression_get_total_stars
	printf channel = ach_debug qs(0x724d6c02) t = <total_stars>
	if (<total_stars> > 100)
		achievements_awardplayer \{achievement = and_justice_for_all
			player = 1}
	endif
endscript

script achievements_the_ecstacy_of_gold 
	printf \{channel = ach_debug
		'Achievements_THE_ECSTACY_OF_GOLD'}
	getglobaltags \{band_info}
	if (<career_earnings> >= 15000)
		achievements_awardband \{achievement = the_ecstacy_of_gold}
	endif
endscript

script achievements_damage_inc 
	printf \{channel = ach_debug
		'Achievements_DAMAGE_INC'}
	if NOT achievements_issongwon
		return
	endif
	if achievements_ischeating
		return
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
	if (<controller> = ($primary_controller) && <part> = drum)
		achievements_awardplayer achievement = damage_inc player = <player>
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_motorbreath 
	printf \{channel = ach_debug
		'Achievements_MOTORBREATH'}
	if NOT achievements_issongwon
		return
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
	if (<controller> = ($primary_controller) && <part> = vocals)
		achievements_awardplayer achievement = motorbreath player = <player>
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_invisible_kid 
	printf \{channel = ach_debug
		'Achievements_INVISIBLE_KID'}
	if NOT achievements_issongwon
		return
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
	if (<controller> = ($primary_controller) && <part> = bass)
		achievements_awardplayer achievement = invisible_kid player = <player>
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_some_kind_of_monster 
	printf \{channel = ach_debug
		'Achievements_SOME_KIND_OF_MONSTER'}
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
	if (<controller> = ($primary_controller) && <part> = guitar)
		achievements_awardplayer achievement = some_kind_of_monster player = <player>
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_starwood 
	printf \{channel = ach_debug
		'Achievements_STARWOOD'}
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
	if achievements_ischeating
		return
	endif
	if ($achievements_ride_the_lightning_flag = 1)
		achievements_awardband \{achievement = starwood}
		change \{achievements_ride_the_lightning_flag = 0}
	endif
endscript

script achievements_master_of_puppets 
	printf \{channel = ach_debug
		'Achievements_MASTER_OF_PUPPETS'}
	if NOT achievements_issongwon
		return
	endif
	if NOT ($game_mode = p4_quickplay ||
			$game_mode = p4_career ||
			$game_mode = p8_pro_faceoff)
		return
	endif
	if achievements_ischeating
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
	printf \{channel = ach_debug
		'Achievements_THE_STRUGGLE_WITHIN'}
	if NOT achievements_issongwon
		return
	endif
	if achievements_ischeating
		return
	endif
	if NOT ($game_mode = p4_quickplay ||
			$game_mode = p4_career ||
			$game_mode = p8_pro_faceoff)
		return
	endif
	achievements_awardband \{achievement = the_struggle_within}
endscript

script achievements_the_four_horsemen 
	printf \{channel = ach_debug
		'Achievements_THE_FOUR_HORSEMEN'}
	if NOT achievements_issongwon
		return
	endif
	if NOT ($game_mode = p4_quickplay ||
			$game_mode = p4_career ||
			$game_mode = p8_pro_faceoff)
		return
	endif
	if achievements_ischeating
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
	printf \{channel = ach_debug
		'Achievements_NOTHING_ELSE_MATTERS'}
	if achievements_ischeating
		return
	endif
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
	printf \{channel = ach_debug
		'Achievements_BLACK'}
	if NOT achievements_issongwon
		printf \{channel = ach_debug
			qs(0x6156d3c2)}
		return
	endif
	if achievements_ischeating
		return
	endif
	if ($game_mode != p2_battle || $is_network_game = 0)
		printf \{channel = ach_debug
			qs(0xbc3f64ab)}
		return
	endif
	getplayerinfo \{1
		final_blow_powerup}
	if (<final_blow_powerup> < 0)
		printf \{channel = ach_debug
			qs(0xa70eb440)}
		return
	endif
	<powerup> = ($battlemode_powerups [<final_blow_powerup>].name)
	printf channel = ach_debug qs(0xa4bff48c) f = <powerup>
	if (<powerup> = blackout)
		achievements_awardplayer \{achievement = black
			player = 1}
	endif
endscript

script achievements_better_than_you 
	printf \{channel = ach_debug
		'Achievements_BETTER_THAN_YOU'}
	if NOT achievements_issongwon
		return
	endif
	if achievements_ischeating
		return
	endif
	if ($game_mode = p2_pro_faceoff && $is_network_game)
		determine_game_scores_and_winner
		printf channel = ach_debug qs(0x09667ec7) n = <team_score>
		printf channel = ach_debug qs(0x29c1b0ec) n = <opponent_team_score>
		printf channel = ach_debug qs(0x5f65d94c) b = <tie>
		if (<tie> = false)
			achievements_awardband \{achievement = better_than_you}
		endif
	endif
endscript

script achievements_blitzkrieg 
	printf \{channel = ach_debug
		'Achievements_BLITZKRIEG'}
	if NOT achievements_issongwon
		return
	endif
	if achievements_ischeating
		return
	endif
	if ($game_mode = p8_pro_faceoff && $is_network_game)
		achievements_awardband \{achievement = blitzkrieg}
	endif
endscript

script achievements_seek_and_destroy 
	printf \{channel = ach_debug
		'Achievements_SEEK_AND_DESTROY'}
	if NOT achievements_issongwon
		return
	endif
	if achievements_ischeating
		return
	endif
	if ($is_network_game = 0)
		return
	endif
	gamemode_getnumplayersshown
	<player> = 1
	begin
	getplayerinfo <player> controller
	get_savegame_from_controller controller = <controller>
	getglobaltags savegame = <savegame> achievement_info param = num_online_matches_played
	printf channel = ach_debug qs(0x3c7c5d2b) p = <player> n = <num_online_matches_played>
	if (<num_online_matches_played> >= 20)
		achievements_awardplayer achievement = seek_and_destroy player = <player>
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_the_unforgiven 
	printf \{channel = ach_debug
		'Achievements_THE_UNFORGIVEN'}
	if NOT achievements_issongwon
		return
	endif
	if achievements_ischeating
		return
	endif
	if ($game_mode = p2_faceoff && $is_network_game)
		achievements_awardband \{achievement = the_unforgiven}
	endif
endscript

script achievements_the_unforgiven_ii 
	printf \{channel = ach_debug
		'Achievements_THE_UNFORGIVEN_II'}
	if NOT achievements_issongwon
		return
	endif
	if achievements_ischeating
		return
	endif
	if ($game_mode = p2_faceoff && $is_network_game)
		determine_game_scores_and_winner
		if (<team_score> >= (<opponent_team_score> + 25000))
			achievements_awardband \{achievement = the_unforgiven_ii}
		endif
	endif
endscript

script achievements_the_unforgiven_iii 
	printf \{channel = ach_debug
		'Achievements_THE_UNFORGIVEN_III'}
	if NOT achievements_issongwon
		return
	endif
	if achievements_ischeating
		return
	endif
	if ($game_mode = p2_pro_faceoff && $is_network_game)
		determine_game_scores_and_winner
		if (<team_score> >= (<opponent_team_score> + 25000))
			achievements_awardband \{achievement = the_unforgiven_iii}
		endif
	endif
endscript

script achievements_reload 
	printf \{channel = ach_debug
		'Achievements_RELOAD'}
	if gotparam \{controller}
		writeachievements achievement = reload controller_id = <controller>
	endif
endscript

script achievements_cure 
	printf \{channel = ach_debug
		'Achievements_CURE'}
	if NOT achievements_issongwon
		return
	endif
	if achievements_ischeating
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
	printf \{channel = ach_debug
		'Achievements_GREEN_HELL'}
	if NOT achievements_issongwon
		return
	endif
	if achievements_ischeating
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
		printf channel = ach_debug qs(0xee3aa580) n = <green_note_missed>
		printf channel = ach_debug qs(0x6dc3531d) n = <green_notes_exist>
		printf channel = ach_debug qs(0x08130d7c) n = <current_health>
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
	printf \{channel = ach_debug
		'Achievements_DISPOSABLE_HEROES'}
	if gotparam \{controller}
		writeachievements achievement = disposable_heroes controller_id = <controller>
	endif
endscript

script achievements_blackened 
	printf \{channel = ach_debug
		'Achievements_BLACKENED'}
	if gotparam \{controller}
		writeachievements achievement = blackened controller_id = <controller>
	endif
endscript

script achievements_eye_of_the_beholder 
	printf \{channel = ach_debug
		'Achievements_EYE_OF_THE_BEHOLDER'}
	if ($rich_presence_context = presence_music_studio)
		return
	endif
	if gotparam \{controller}
		writeachievements achievement = eye_of_the_beholder controller_id = <controller>
		change \{achievements_modified_logo = 0}
	endif
endscript

script achievements_fixxxer 
	printf \{channel = ach_debug
		'Achievements_FIXXXER'}
	if gotparam \{controller}
		writeachievements achievement = fixxxer controller_id = <controller>
	endif
endscript

script achievements_hero_of_the_day 
	printf \{channel = ach_debug
		'Achievements_HERO_OF_THE_DAY'}
	if ($rich_presence_context = presence_music_studio)
		return
	endif
	if achievements_ischeating
		return
	endif
	if NOT achievements_issongwon
		return
	endif
	if ($current_song = jamsession)
		return
	endif
	if NOT structurecontains structure = ($permanent_songlist_props.($current_song)) double_kick
		printf \{channel = ach_debug
			qs(0xb3a4f56f)}
		return
	endif
	if (($permanent_songlist_props.($current_song)).double_kick = 0)
		printf \{channel = ach_debug
			qs(0x131e0048)}
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
	printf \{channel = ach_debug
		'Achievements_THE_HOUSE_JACK_BUILT'}
	if NOT achievements_issongwon
		return
	endif
endscript

script achievements_wherever_i_may_roam 
	printf \{channel = ach_debug
		'Achievements_WHEREVER_I_MAY_ROAM'}
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
		case load_z_metalfest
		<venues_played> = {<venues_played> load_z_metalfest = 1}
		case load_z_la_block_party
		<venues_played> = {<venues_played> load_z_la_block_party = 1}
		case load_z_rome
		<venues_played> = {<venues_played> load_z_rome = 1}
		case load_z_london
		<venues_played> = {<venues_played> load_z_london = 1}
		case load_z_drum_kit
		<venues_played> = {<venues_played> load_z_drum_kit = 1}
		case load_z_frankenstrat
		<venues_played> = {<venues_played> load_z_frankenstrat = 1}
		case load_z_starwood
		<venues_played> = {<venues_played> load_z_starwood = 1}
		case load_z_s_stage
		<venues_played> = {<venues_played> load_z_s_stage = 1}
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
	printf \{channel = ach_debug
		'Achievements_TRAPPED_UNDER_ICE'}
	if (($levelzones).($current_level).zone = z_icecave)
		achievements_awardband \{achievement = trapped_under_ice}
	endif
endscript

script achievements_stone_dead_forever 
	printf \{channel = ach_debug
		'Achievements_STONE_DEAD_FOREVER'}
	if (($levelzones).($current_level).zone = z_stone)
		achievements_awardband \{achievement = stone_dead_forever}
	endif
endscript

script achievements_no_brown_mnms 
	printf \{channel = ach_debug
		'Achievements_NO_BROWN_MNMS'}
	if NOT screenelementexists \{id = metallifacts_container}
		printf \{channel = ach_debug
			qs(0xb5bc49fd)}
		return
	endif
	<controller> = 0
	begin
	writeachievements achievement = no_brown_mnms controller_id = <controller>
	printf channel = ach_debug channel = ach_debug qs(0x0e224e31) c = <controller>
	<controller> = (<controller> + 1)
	repeat 4
endscript

script achievements_creeping_death 
	printf \{channel = ach_debug
		'Achievements_CREEPING_DEATH'}
	if NOT achievements_issongwon
		return
	endif
	if achievements_ischeating
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
	printf \{channel = ach_debug
		'Achievements_DYERS_EVE'}
	if NOT achievements_issongwon
		return
	endif
	if achievements_ischeating
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
	printf \{channel = ach_debug
		'Achievements_FIGHT_FIRE_WITH_FIRE'}
	if NOT achievements_issongwon
		return
	endif
	if achievements_ischeating
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
	printf \{channel = ach_debug
		'Achievements_STONE_COLD_CRAZY'}
	if NOT achievements_issongwon
		return
	endif
	if achievements_ischeating
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
	if (<score> >= 90000 &&
			<part> = vocals &&
			$current_song = stonecoldcrazy)
		achievements_awardplayer \{achievement = stone_cold_crazy
			player = 1}
	endif
endscript

script achievements_astronomy 
	printf \{channel = ach_debug
		'Achievements_ASTRONOMY'}
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
	printf channel = ach_debug qs(0x80583d4e) h = <sp_phrases_hit>
	printf channel = ach_debug qs(0x1eac667f) t = <sp_phrases_total>
	if (<sp_phrases_hit> = <sp_phrases_total>)
		achievements_awardplayer achievement = astronomy player = <player>
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_star_fleet_project 
	printf \{channel = ach_debug
		'Achievements_STAR_FLEET_PROJECT'}
	if NOT achievements_issongwon
		return
	endif
	if achievements_ischeating
		return
	endif
	if ($current_song != iwantitall)
		return
	endif
	gamemode_getnumplayersshown
	<player> = 1
	begin
	getplayerinfo <player> character_id
	getplayerinfo <player> part
	if (<character_id> = eddie_van_halen2 || <character_id> = eddie_van_halen_alt2)
		if (<part> = guitar)
			achievements_awardplayer achievement = star_fleet_project player = <player>
		endif
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_i_have_a_sound_system 
	if gotparam \{name}
		printf channel = ach_debug 'Achievements_I_HAVE_A_SOUND_SYSTEM %n' n = <name>
		if localizedstringequals a = <name> b = qs(0xc16f6fa0)
			printf \{channel = ach_debug
				'AWARD Achievements_I_HAVE_A_SOUND_SYSTEM'}
			achievements_awardband \{achievement = i_have_a_sound_system}
		endif
	endif
endscript

script achievements_its_alive 
	printf \{channel = ach_debug
		'Achievements_ITS_ALIVE'}
	if achievements_ischeating
		return
	endif
	if gotparam \{player}
		gamemode_getnumplayersshown
		if (<num_players_shown> > 1)
			getplayerinfo <player> controller
			if (<controller> != ($band_mode_current_leader))
				printf channel = ach_debug qs(0x2be7d508) n = <player>
				return
			endif
		endif
		if is_part_unlocked part = cas_guitar_body desc_id = guitar_body_vhfstrat savegame = ($current_progression_savegame)
			printf \{channel = ach_debug
				'Achievements_ITS_ALIVE found '}
			achievements_awardplayer achievement = its_alive player = <player>
		endif
	endif
endscript

script achievements_beat_it 
	printf \{channel = ach_debug
		'Achievements_BEAT_IT'}
	if NOT achievements_issongwon
		return
	endif
	if achievements_ischeating
		return
	endif
	if is_vanhalen_song
		return
	endif
	gamemode_getnumplayersshown
	<player> = 1
	begin
	getplayerinfo <player> character_id
	printf channel = ach_debug 'Achievements_BEAT_IT char_ID %c' c = <character_id>
	if (<character_id> = eddie_van_halen2 || <character_id> = eddie_van_halen_alt2)
		achievements_awardplayer achievement = beat_it player = <player>
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_eat_em_and_smile 
	printf \{channel = ach_debug
		'Achievements_EAT_EM_AND_SMILE'}
	if NOT achievements_issongwon
		return
	endif
	if achievements_ischeating
		return
	endif
	if is_vanhalen_song
		return
	endif
	gamemode_getnumplayersshown
	<player> = 1
	begin
	getplayerinfo <player> character_id
	printf channel = ach_debug 'Achievements_EAT_EM_AND_SMILE char_ID %c' c = <character_id>
	if (<character_id> = david_lee_roth2 || <character_id> = david_lee_roth_alt2)
		achievements_awardplayer achievement = eat_em_and_smile player = <player>
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_respect_the_wind 
	printf \{channel = ach_debug
		'Achievements_RESPECT_THE_WIND'}
	if NOT achievements_issongwon
		return
	endif
	if achievements_ischeating
		return
	endif
	if is_vanhalen_song
		return
	endif
	printf \{channel = ach_debug
		'Achievements_RESPECT_THE_WIND default; continue;'}
	gamemode_getnumplayersshown
	<player> = 1
	begin
	getplayerinfo <player> character_id
	printf channel = ach_debug 'Achievements_RESPECT_THE_WIND char_ID %c' c = <character_id>
	if (<character_id> = alex_van_halen2 || <character_id> = alex_van_halen_alt2)
		printf \{channel = ach_debug
			'Achievements_RESPECT_THE_WIND found Alex'}
		achievements_awardplayer achievement = respect_the_wind player = <player>
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_fender_bender 
	printf \{channel = ach_debug
		'Achievements_FENDER_BENDER'}
	if gotparam \{controller}
		writeachievements achievement = fender_bender controller_id = <controller>
	endif
endscript

script achievements_bang_your_gong 
	printf \{channel = ach_debug
		'Achievements_BANG_YOUR_GONG'}
	if gotparam \{controller}
		writeachievements achievement = bang_your_gong controller_id = <controller>
	endif
endscript

script achievements_ouch 
	printf \{channel = ach_debug
		'Achievements_OUCH'}
	if gotparam \{controller}
		writeachievements achievement = ouch controller_id = <controller>
	endif
endscript

script achievements_brown_sound 
	printf \{channel = ach_debug
		'Achievements_BROWN_SOUND'}
	if NOT achievements_issongwon
		return
	endif
	if is_modern_band_vanhalen
		printf \{channel = ach_debug
			'Achievements_BROWN_SOUND; fail=already modern VanHalen'}
		return
	endif
	gamemode_getnumplayersshown
	<player> = 1
	begin
	getplayerinfo <player> character_id
	getplayerinfo <player> is_local_client
	<eligible> = 1
	if ($is_network_game && <is_local_client> = 0)
		printf channel = ach_debug 'Achievements_BROWN_SOUND rempote %p' p = <player>
		<eligible> = 0
	endif
	if (<character_id> = eddie_van_halen_alt2 && <eligible> = 1)
		achievements_awardplayer achievement = brown_sound player = <player>
	endif
	if is_retro_band_vanhalen
		getplayerinfo <player> part
		printf channel = ach_debug 'Achievements_BROWN_SOUND %d %p %c LCL=%l' d = <part> p = <player> c = <character_id> l = <is_local_client>
		if (<part> = guitar && <eligible> = 1)
			printf channel = ach_debug 'Achievements_BROWN_SOUND retroband %d %p' d = <part> p = <player>
			achievements_awardplayer achievement = brown_sound player = <player>
		endif
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_diamond_dave 
	printf \{channel = ach_debug
		'Achievements_DIAMOND_DAVE'}
	if NOT achievements_issongwon
		return
	endif
	if is_modern_band_vanhalen
		printf \{channel = ach_debug
			'Achievements_DIAMOND_DAVE; fail=already modern VanHalen'}
		return
	endif
	gamemode_getnumplayersshown
	<player> = 1
	begin
	getplayerinfo <player> character_id
	getplayerinfo <player> is_local_client
	<eligible> = 1
	if ($is_network_game && <is_local_client> = 0)
		printf channel = ach_debug 'Achievements_DIAMOND_DAVE remote  %p' p = <player>
		<eligible> = 0
	endif
	if (<character_id> = david_lee_roth_alt2 && <eligible> = 1)
		achievements_awardplayer achievement = diamond_dave player = <player>
	endif
	if is_retro_band_vanhalen
		getplayerinfo <player> part
		if (<part> = vocals && <eligible> = 1)
			achievements_awardplayer achievement = diamond_dave player = <player>
		endif
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_king_arthur 
	printf \{channel = ach_debug
		'Achievements_KING_ARTHUR'}
	if NOT achievements_issongwon
		return
	endif
	if is_modern_band_vanhalen
		printf \{channel = ach_debug
			'Achievements_KING_ARTHUR; fail=already modern VanHalen'}
		return
	endif
	gamemode_getnumplayersshown
	<player> = 1
	begin
	getplayerinfo <player> character_id
	getplayerinfo <player> is_local_client
	<eligible> = 1
	if ($is_network_game && <is_local_client> = 0)
		printf channel = ach_debug 'Achievements_KING_ARTHUR remote %p' p = <player>
		<eligible> = 0
	endif
	if (<character_id> = alex_van_halen_alt2 && <eligible> = 1)
		achievements_awardplayer achievement = king_arthur player = <player>
	endif
	if is_retro_band_vanhalen
		getplayerinfo <player> part
		if (<part> = drum && <eligible> = 1)
			printf channel = ach_debug 'Achievements_KING_ARTHUR %d %p' d = <part> p = <player>
			achievements_awardplayer achievement = king_arthur player = <player>
		endif
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_rock_me_amadeus 
	printf \{channel = ach_debug
		'Achievements_ROCK_ME_AMADEUS'}
	if NOT achievements_issongwon
		printf \{channel = ach_debug
			'Achievements_ROCK_ME_AMADEUS song not won?'}
		return
	endif
	if is_modern_band_vanhalen
		printf \{channel = ach_debug
			'Achievements_ROCK_ME_AMADEUS; fail=already modern VanHalen'}
		return
	endif
	gamemode_getnumplayersshown
	<player> = 1
	begin
	getplayerinfo <player> character_id
	getplayerinfo <player> is_local_client
	<eligible> = 1
	if ($is_network_game && <is_local_client> = 0)
		printf channel = ach_debug 'Achievements_AMADEUS remote %p' p = <player>
		<eligible> = 0
	endif
	if (<character_id> = wolf_van_halen_alt2 && <eligible> = 1)
		printf \{channel = ach_debug
			'Achievements_ROCK_ME_AMADEUS FOUND'}
		achievements_awardplayer achievement = rock_me_amadeus player = <player>
	endif
	if is_retro_band_vanhalen
		getplayerinfo <player> part
		printf channel = ach_debug 'Achievements_AMADEUS %d %p %c LCL=%l' d = <part> p = <player> c = <character_id> l = <is_local_client>
		if (<part> = bass && <eligible> = 1)
			printf channel = ach_debug 'Achievements_ROCK_ME_AMADEUS retroband %d %p' d = <part> p = <player>
			achievements_awardplayer achievement = rock_me_amadeus player = <player>
		endif
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_you_really_got_me 
	printf \{channel = ach_debug
		'Achievements_YOU_REALLY_GOT_ME'}
	if NOT achievements_issongwon
		return
	endif
	if achievements_ischeating
		return
	endif
	gamemode_getnumplayersshown
	if NOT (<num_players_shown> = 3)
		printf \{channel = ach_debug
			'Achievements_YOU_REALLY_GOT_ME not 3P'}
		return
	endif
	if is_current_band_vanhalen
		<player> = 1
		begin
		getplayerinfo <player> part
		if (<part> = vocals)
			return
		endif
		<player> = (<player> + 1)
		repeat <num_players_shown>
		<player> = 1
		begin
		achievements_awardplayer achievement = you_really_got_me player = <player>
		<player> = (<player> + 1)
		repeat <num_players_shown>
		return
	endif
	<player> = 1
	<van_halens_found> = 0
	begin
	getplayerinfo <player> character_id
	getplayerinfo <player> part
	getplayerinfo <player> is_local_client
	<temp_cid> = <character_id>
	if (<is_local_client> = 0)
		getarraysize \{$net_musician_profiles}
		<nmp_size> = <array_size>
		<net_index> = 0
		begin
		if (<character_id> = ($net_musician_profiles [<net_index>].name))
			getarraysize \{$preset_musician_profiles_modifiable}
			<translate_index> = 0
			begin
			if (($net_musician_profiles [<net_index>].fullname) = ($preset_musician_profiles_modifiable [<translate_index>].fullname))
				printf channel = ach_debug 'FOUND net_tester (NET) %c->%d' c = ($net_musician_profiles [<net_index>].fullname) d = ($preset_musician_profiles_modifiable [<translate_index>].name)
				<temp_cid> = ($preset_musician_profiles_modifiable [<translate_index>].name)
				break
			endif
			<translate_index> = (<translate_index> + 1)
			repeat <array_size>
		endif
		<net_index> = (<net_index> + 1)
		repeat <nmp_size>
	else
		unwindrandomappearance character_id = <character_id>
	endif
	printf channel = ach_debug 'Achievements_YOU_REALLY_GOT_ME tCID %c %p' c = <temp_cid> p = <part>
	if (<part> = drum)
		if (<temp_cid> = alex_van_halen2 || <temp_cid> = alex_van_halen_alt2)
			<van_halens_found> = (<van_halens_found> + 1)
		endif
	elseif (<part> = guitar)
		if (<temp_cid> = eddie_van_halen2 || <temp_cid> = eddie_van_halen_alt2)
			<van_halens_found> = (<van_halens_found> + 1)
		endif
	elseif (<part> = bass)
		if (<temp_cid> = wolf_van_halen2 || <temp_cid> = wolf_van_halen_alt2)
			<van_halens_found> = (<van_halens_found> + 1)
		endif
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
	printf channel = ach_debug qs(0xc4691389) v = <van_halens_found>
	if (<van_halens_found> = 3)
		printf \{channel = ach_debug
			'Achievements_YOU_REALLY_GOT_ME'}
		<player> = 1
		begin
		achievements_awardplayer achievement = you_really_got_me player = <player>
		<player> = (<player> + 1)
		repeat <num_players_shown>
	endif
endscript

script achievements_intruder 
	printf \{channel = ach_debug
		'Achievements_INTRUDER'}
	if achievements_ischeating
		return
	endif
	if gotparam \{player}
		printf \{channel = ach_debug
			'Achievements_INTRUDER found '}
		achievements_awardplayer achievement = intruder player = <player>
	endif
endscript

script achievements_van_halen 
	printf \{channel = ach_debug
		'Achievements_VAN_HALEN'}
	if achievements_ischeating
		return
	endif
	if gotparam \{player}
		gamemode_getnumplayersshown
		if (<num_players_shown> > 1)
			getplayerinfo <player> controller
			if (<controller> != ($band_mode_current_leader))
				printf channel = ach_debug qs(0x390afd8e) n = <player>
				return
			endif
		endif
		printf \{channel = ach_debug
			'Achievements_VAN_HALEN found '}
		achievements_awardplayer achievement = van_halen player = <player>
	endif
endscript

script achievements_gazzaris 
	printf \{channel = ach_debug
		'Achievements_GAZZARIS'}
	if NOT achievements_issongwon
		return
	endif
	if achievements_ischeating
		return
	endif
	gamemode_getnumplayersshown
	if NOT (<num_players_shown> = 4)
		return
	endif
	<player> = 1
	printf \{channel = ach_debug
		'AWARDing Achievements_GAZZARIS to all playersShown'}
	begin
	achievements_awardplayer achievement = gazzaris player = <player>
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_cafe_wha 
	printf \{channel = ach_debug
		'Achievements_CAFE_WHA'}
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
	if achievements_ischeating
		return
	endif
	if ($achievements_2x4_flag = 1)
		achievements_awardband \{achievement = cafe_wha}
		change \{achievements_2x4_flag = 0}
	endif
endscript

script achievements_whisky_a_gogo 
	printf \{channel = ach_debug
		'Achievements_WHISKY_A_GOGO'}
	if NOT achievements_issongwon
		return
	endif
	if achievements_ischeating
		return
	endif
	if ($current_song = jamsession)
		printf \{channel = ach_debug
			qs(0xab6a4722)}
		return
	endif
	if NOT ($game_mode = p4_quickplay ||
			$game_mode = p4_career ||
			$game_mode = p8_pro_faceoff)
		printf \{channel = ach_debug
			qs(0x1364e4dd)}
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
			printf \{channel = ach_debug
				qs(0xdf882bd6)}
			return
		endif
	else
		getplayerinfo <player> vocal_phrase_quality
		getplayerinfo <player> vocal_phrase_max_qual
		if ((<vocal_phrase_quality> < <vocal_phrase_max_qual>) || (<vocal_phrase_quality> = 0))
			printf \{channel = ach_debug
				qs(0xdf882bd6)}
			return
		endif
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
	achievements_awardband \{achievement = whisky_a_gogo}
endscript

script achievements_walter_mitty 
	printf channel = ach_debug 'Achievements_WALTER_MITTY %g' g = ($game_mode)
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
	if achievements_ischeating
		return
	endif
	gamemode_getnumplayersshown
	<player> = 1
	<num_eights> = 0
	begin
	getplayerinfo <player> highest_multiplier
	printf channel = ach_debug qs(0x4c979a1c) p = <player> h = <highest_multiplier>
	if (<highest_multiplier> >= 7)
		<num_eights> = (<num_eights> + 1)
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
	printf channel = ach_debug 'Achievements_WALTER_MITTY num8s=%n pl=%p' n = <num_eights> p = <num_players_shown>
	if (<num_eights> = 4)
		printf \{channel = ach_debug
			'Achievements_WALTER_MITTY awarded for local play'}
		achievements_awardband \{achievement = walter_mittys_rock_n_roll_emporium}
	elseif ($achievements_super_group_unite_flag)
		printf \{channel = ach_debug
			'Achievements_WALTER_MITTY awarded for online play'}
		change \{achievements_super_group_unite_flag = 0}
		achievements_awardband \{achievement = walter_mittys_rock_n_roll_emporium}
	endif
endscript

script achievements_evh 
	printf \{channel = ach_debug
		'Achievements_EVH'}
	if achievements_ischeating
		return
	endif
	<guitar_array> = [guitar_body_vhbwolf guitar_body_vhfstrat guitar_body_vh2 guitar_body_vhswolf guitar_body_vh4 guitar_body_vhdlr guitar_body_vhshark]
	<bass_array> = [bass_body_style_vhystripe bass_body_style_vhblue]
	if gotparam \{player}
		gamemode_getnumplayersshown
		if (<num_players_shown> > 1)
			getplayerinfo <player> controller
			if (<controller> != ($band_mode_current_leader))
				printf channel = ach_debug qs(0x32bb8726) n = <player>
				return
			endif
		endif
		getarraysize <guitar_array>
		<guitar_index> = 0
		<guitars_found> = 0
		begin
		if is_part_unlocked part = cas_guitar_body desc_id = (<guitar_array> [<guitar_index>]) savegame = ($current_progression_savegame)
			<guitars_found> = (<guitars_found> + 1)
		endif
		<guitar_index> = (<guitar_index> + 1)
		repeat <array_size>
		getarraysize <bass_array>
		<bass_index> = 0
		<bass_found> = 0
		begin
		if is_part_unlocked part = cas_bass_body desc_id = (<bass_array> [<bass_index>]) savegame = ($current_progression_savegame)
			<bass_found> = (<bass_found> + 1)
		endif
		<bass_index> = (<bass_index> + 1)
		repeat <array_size>
		printf channel = ach_debug 'ach_debug EVH: found %d+%e+1 / 7+2+1' d = <guitars_found> e = <bass_found>
		if (<guitars_found> = 7 && <bass_found> = 2)
			if is_part_unlocked part = cas_mic desc_id = mic_vhdlr savegame = ($current_progression_savegame)
				printf \{channel = ach_debug
					'Achievements_EVH found '}
				achievements_awardplayer achievement = evh player = <player>
			endif
		endif
	endif
endscript

script achievements_where_have_all_the_good_times_gone 
	printf \{channel = ach_debug
		'CHECKING Achievements_WHERE_HAVE_ALL_THE_GOOD_TIMES_GONE'}
	if ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || $game_mode = p2_battle)
		printf \{channel = ach_debug
			qs(0xf1630bae)}
		return
	endif
	if NOT achievements_issongwon
		printf \{channel = ach_debug
			qs(0x8114b6b0)}
		return
	endif
	if achievements_ischeating
		return
	endif
	gamemode_getnumplayersshown
	<player> = 1
	begin
	getplayerinfo <player> part
	getplayerinfo <player> character_id
	printf channel = ach_debug qs(0x806f9806) n = <character_id>
	if (<character_id> = eddie_van_halen2 || <character_id> = eddie_van_halen_alt2 ||
			<character_id> = wolf_van_halen2 || <character_id> = wolf_van_halen_alt2 ||
			<character_id> = alex_van_halen2 || <character_id> = alex_van_halen_alt2 ||
			<character_id> = david_lee_roth2 || <character_id> = david_lee_roth_alt2)
		getplayerinfo <player> controller
		get_savegame_from_controller controller = <controller>
		getglobaltags savegame = <savegame> achievement_info param = achievement_all_instruments
		printf channel = ach_debug qs(0xada5370b) d = <achievement_all_instruments> n = <character_id> p = <player>
		switch (<part>)
			case guitar
			if NOT (<achievement_all_instruments> && 1)
				<achievement_all_instruments> = (<achievement_all_instruments> + 1)
			endif
			case bass
			if NOT (<achievement_all_instruments> && 2)
				<achievement_all_instruments> = (<achievement_all_instruments> + 2)
			endif
			case drum
			if NOT (<achievement_all_instruments> && 4)
				<achievement_all_instruments> = (<achievement_all_instruments> + 4)
			endif
			case vocals
			if NOT (<achievement_all_instruments> && 8)
				<achievement_all_instruments> = (<achievement_all_instruments> + 8)
			endif
		endswitch
		setglobaltags savegame = <savegame> achievement_info params = {achievement_all_instruments = <achievement_all_instruments>}
		printf channel = ach_debug qs(0xd3ae95d5) d = <achievement_all_instruments>
		if (<achievement_all_instruments> = 15)
			achievements_awardplayer achievement = where_have_all_the_good_times_gone player = <player>
		endif
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_hot_for_high_scores 
	printf \{channel = ach_debug
		'Achievements_HOT_FOR_HIGH_SCORES'}
	if NOT achievements_issongwon
		return
	endif
	if achievements_ischeating
		return
	endif
	gamemode_getnumplayersshown
	if (<num_players_shown> != 4)
		return
	endif
	if (($band1_status.score) >= 800000 &&
			$current_song = hotforteacher)
		achievements_awardband \{achievement = hot_for_high_scores}
	endif
endscript

script achievements_im_the_one 
	printf \{channel = ach_debug
		'Achievements_IM_THE_ONE'}
	if NOT achievements_issongwon
		return
	endif
	if achievements_ischeating
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
	getplayerinfo \{1
		difficulty}
	if (<score> >= 225000 &&
			$current_song = imtheone &&
			<part> = guitar &&
			<difficulty> = expert)
		achievements_awardplayer \{achievement = im_the_one
			player = 1}
	endif
endscript

script achievements_the_broken_combs 
	printf \{channel = ach_debug
		'Achievements_THE_BROKEN_COMBS'}
	if achievements_issongwon
		return
	endif
	if achievements_ischeating
		return
	endif
	gamemode_getnumplayersshown
	<player> = 1
	<gig> = 3
	<part_array> = ['guitar' 'bass' 'drum' 'vocals' 'band']
	begin
	<eligible> = 1
	if (<num_players_shown> > 1)
		getplayerinfo <player> controller
		if (<controller> != ($band_mode_current_leader))
			<eligible> = 0
		endif
	endif
	if (<eligible> = 1)
		<part_index> = 0
		getarraysize <part_array>
		begin
		achievements_hasgigbeenwon player = <player> gignum = <gig> part = (<part_array> [<part_index>])
		if (<num_gigs_won> = 1)
			printf channel = ach_debug qs(0xcd3fbb1b) p = (<part_array> [<part_index>]) n = <gig>
			achievements_awardplayer achievement = the_broken_combs player = <player>
		endif
		<part_index> = (<part_index> + 1)
		repeat <array_size>
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_the_trojan_rubber_company 
	printf \{channel = ach_debug
		'Achievements_THE_TROJAN_RUBBER_COMPANY'}
	if achievements_issongwon
		return
	endif
	if achievements_ischeating
		return
	endif
	gamemode_getnumplayersshown
	<player> = 1
	<gig> = 7
	<part_array> = ['guitar' 'bass' 'drum' 'vocals' 'band']
	begin
	<eligible> = 1
	if (<num_players_shown> > 1)
		getplayerinfo <player> controller
		if (<controller> != ($band_mode_current_leader))
			<eligible> = 0
		endif
	endif
	if (<eligible> = 1)
		<part_index> = 0
		getarraysize <part_array>
		begin
		achievements_hasgigbeenwon player = <player> gignum = <gig> part = (<part_array> [<part_index>])
		if (<num_gigs_won> = 1)
			achievements_awardplayer achievement = the_trojan_rubber_company player = <player>
			printf channel = ach_debug qs(0xcd3fbb1b) p = (<part_array> [<part_index>]) n = <gig>
		endif
		<part_index> = (<part_index> + 1)
		repeat <array_size>
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_van_halen_ii 
	printf \{channel = ach_debug
		'Achievements_VAN_HALEN_II'}
	if achievements_ischeating
		return
	endif
	if gotparam \{player}
		gamemode_getnumplayersshown
		if (<num_players_shown> > 1)
			getplayerinfo <player> controller
			if (<controller> != ($band_mode_current_leader))
				printf channel = ach_debug qs(0x390afd8e) n = <player>
				return
			endif
		endif
		printf \{channel = ach_debug
			'Achievements_VAN_HALEN_II found '}
		achievements_awardplayer achievement = van_halen_ii player = <player>
	endif
endscript

script achievements_jump 
	printf \{channel = ach_debug
		'Achievements_JUMP'}
	if achievements_issongwon
		return
	endif
	if achievements_ischeating
		return
	endif
	gamemode_getnumplayersshown
	<player> = 1
	<gig_array> = [1 3 5 7 9 10]
	<part_array> = ['guitar' 'bass' 'drum' 'vocals' 'band']
	begin
	<eligible> = 1
	if (<num_players_shown> > 1)
		getplayerinfo <player> controller
		if (<controller> != ($band_mode_current_leader))
			<eligible> = 0
		endif
	endif
	if (<eligible> = 1)
		<part_index> = 0
		getarraysize <part_array>
		<part_array_size_holder> = <array_size>
		begin
		getarraysize <gig_array>
		<gig_index> = 0
		<win_counter> = 0
		begin
		achievements_hasgigbeenwon player = <player> gignum = (<gig_array> [<gig_index>]) part = (<part_array> [<part_index>])
		if (<num_gigs_won> = 1)
			<win_counter> = (<win_counter> + 1)
		endif
		<gig_index> = (<gig_index> + 1)
		repeat <array_size>
		printf channel = ach_debug qs(0xad325bfe) w = <win_counter> p = (<part_array> [<part_index>])
		if (<win_counter> = 6)
			achievements_awardplayer achievement = jump player = <player>
		endif
		<part_index> = (<part_index> + 1)
		repeat <part_array_size_holder>
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_unchained 
	printf \{channel = ach_debug
		'Achievements_UNCHAINED'}
	if achievements_ischeating
		return
	endif
	<char_array> = [eddie_van_halen_alt2 alex_van_halen_alt2 wolf_van_halen_alt2 david_lee_roth_alt2 eddie_van_halen2 alex_van_halen2 wolf_van_halen2 david_lee_roth2]
	if gotparam \{player}
		gamemode_getnumplayersshown
		if (<num_players_shown> > 1)
			getplayerinfo <player> controller
			if (<controller> != ($band_mode_current_leader))
				printf channel = ach_debug qs(0xe125b149) n = <player>
				return
			endif
		endif
		getarraysize <char_array>
		<char_index> = 0
		<chars_found> = 0
		begin
		get_musician_profile_struct_by_id id = (<char_array> [<char_index>]) savegame = 0
		if is_profile_unlocked savegame = ($current_progression_savegame) profile_struct = <profile_struct>
			<chars_found> = (<chars_found> + 1)
		endif
		<char_index> = (<char_index> + 1)
		repeat <array_size>
		printf channel = ach_debug 'ach_debug UNCHAINED: found %d/%e' d = <chars_found> e = <array_size>
		if (<chars_found> = <array_size>)
			printf \{channel = ach_debug
				'Achievements_UNCHAINED found '}
			achievements_awardplayer achievement = unchained player = <player>
		endif
	endif
endscript

script achievements_genesis 
	printf \{channel = ach_debug
		'Achievements_GENESIS'}
	if achievements_issongwon
		return
	endif
	if achievements_ischeating
		return
	endif
	gamemode_getnumplayersshown
	<player> = 1
	<gig_array> = [8 9]
	<part_array> = ['guitar' 'bass' 'drum' 'vocals' 'band']
	begin
	<eligible> = 1
	if (<num_players_shown> > 1)
		getplayerinfo <player> controller
		if (<controller> != ($band_mode_current_leader))
			<eligible> = 0
		endif
	endif
	if (<eligible> = 1)
		<part_index> = 0
		getarraysize <part_array>
		<part_array_size_holder> = <array_size>
		begin
		getarraysize <gig_array>
		<gig_index> = 0
		<win_counter> = 0
		begin
		achievements_hasgigbeenwon player = <player> gignum = (<gig_array> [<gig_index>]) part = (<part_array> [<part_index>])
		if (<num_gigs_won> >= 1)
			<win_counter> = (<win_counter> + 1)
		endif
		<gig_index> = (<gig_index> + 1)
		repeat <array_size>
		printf channel = ach_debug qs(0x48354968) w = <win_counter> a = <array_size> p = (<part_array> [<part_index>])
		if (<win_counter> = 2)
			achievements_awardplayer achievement = genesis player = <player>
		endif
		<part_index> = (<part_index> + 1)
		repeat <part_array_size_holder>
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_the_space_brothers 
	printf \{channel = ach_debug
		'Achievements_THE_SPACE_BROTHERS'}
	if achievements_issongwon
		return
	endif
	if achievements_ischeating
		return
	endif
	gamemode_getnumplayersshown
	<player> = 1
	<gig_array> = [2 4]
	<part_array> = ['guitar' 'bass' 'drum' 'vocals' 'band']
	begin
	<eligible> = 1
	if (<num_players_shown> > 1)
		getplayerinfo <player> controller
		if (<controller> != ($band_mode_current_leader))
			<eligible> = 0
		endif
	endif
	if (<eligible> = 1)
		<part_index> = 0
		getarraysize <part_array>
		<part_array_size_holder> = <array_size>
		begin
		getarraysize <gig_array>
		<gig_index> = 0
		<win_counter> = 0
		begin
		achievements_hasgigbeenwon player = <player> gignum = (<gig_array> [<gig_index>]) part = (<part_array> [<part_index>])
		if (<num_gigs_won> >= 1)
			<win_counter> = (<win_counter> + 1)
		endif
		<gig_index> = (<gig_index> + 1)
		repeat <array_size>
		printf channel = ach_debug qs(0x75904e7c) w = <win_counter> a = <array_size> p = (<part_array> [<part_index>])
		if (<win_counter> = 2)
			printf \{channel = ach_debug
				qs(0x0360f8ad)}
			achievements_awardplayer achievement = the_space_brothers player = <player>
		endif
		<part_index> = (<part_index> + 1)
		repeat <part_array_size_holder>
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_women_and_children_first 
	printf \{channel = ach_debug
		'Achievements_WOMEN_AND_CHILDREN_FIRST'}
	if achievements_ischeating
		return
	endif
	if gotparam \{player}
		gamemode_getnumplayersshown
		if (<num_players_shown> > 1)
			getplayerinfo <player> controller
			if (<controller> != ($band_mode_current_leader))
				printf channel = ach_debug qs(0x390afd8e) n = <player>
				return
			endif
		endif
		printf \{channel = ach_debug
			'Achievements_WOMEN_AND_CHILDREN_FIRST found '}
		achievements_awardplayer achievement = women_and_children_first player = <player>
	endif
endscript

script achievements_guitar_god 
	printf \{channel = ach_debug
		'Achievements_GUITAR_GOD'}
	if achievements_issongwon
		return
	endif
	if achievements_ischeating
		return
	endif
	gamemode_getnumplayers
	if (<num_players> > 1)
		return
	endif
	<player> = 1
	<gig_array> = [1 3 5 7 9 10]
	getplayerinfo <player> part
	if (<part> = guitar)
		<total_fived> = 0
		getarraysize <gig_array>
		<gig_index> = 0
		begin
		achievements_hasgigbeenwonondiff player = <player> gignum = (<gig_array> [<gig_index>]) part = 'guitar' diff = expert
		<total_fived> = (<total_fived> + <num_gigs_fived>)
		<gig_index> = (<gig_index> + 1)
		repeat <array_size>
		printf channel = ach_debug qs(0xaa5148e6) d = <total_fived>
		if (<total_fived> >= 6)
			achievements_awardplayer achievement = guitar_god player = <player>
		endif
	endif
endscript

script achievements_diamond_in_the_rough 
	printf \{channel = ach_debug
		'Achievements_DIAMOND_IN_THE_ROUGH'}
	if achievements_issongwon
		return
	endif
	if achievements_ischeating
		return
	endif
	gamemode_getnumplayers
	if (<num_players> > 1)
		return
	endif
	<player> = 1
	<gig_array> = [1 3 5 7 9 10]
	getplayerinfo <player> part
	if (<part> = vocals)
		<total_fived> = 0
		getarraysize <gig_array>
		<gig_index> = 0
		begin
		achievements_hasgigbeenwonondiff player = <player> gignum = (<gig_array> [<gig_index>]) part = 'vocals' diff = expert
		<total_fived> = (<total_fived> + <num_gigs_fived>)
		<gig_index> = (<gig_index> + 1)
		repeat <array_size>
		printf channel = ach_debug qs(0x45264f60) d = <total_fived>
		if (<total_fived> >= 6)
			achievements_awardplayer achievement = diamond_in_the_rough player = <player>
		endif
	endif
endscript

script achievements_double_bass_master 
	printf \{channel = ach_debug
		'Achievements_DOUBLE_BASS_MASTER'}
	if achievements_issongwon
		return
	endif
	if achievements_ischeating
		return
	endif
	gamemode_getnumplayers
	if (<num_players> > 1)
		return
	endif
	<gig_array> = [1 3 5 7 9 10]
	getplayerinfo \{1
		part}
	if (<part> = drum)
		<total_fived> = 0
		getarraysize <gig_array>
		<gig_index> = 0
		begin
		achievements_hasgigbeenwonondiff player = 1 gignum = (<gig_array> [<gig_index>]) part = 'drum' diff = expert
		<total_fived> = (<total_fived> + <num_gigs_fived>)
		<gig_index> = (<gig_index> + 1)
		repeat <array_size>
		printf channel = ach_debug qs(0xdc4aad92) d = <total_fived>
		if (<total_fived> >= 6)
			achievements_awardplayer \{achievement = double_bass_master
				player = 1}
		endif
	endif
endscript

script achievements_316 
	printf \{channel = ach_debug
		'Achievements_316'}
	if achievements_issongwon
		return
	endif
	if achievements_ischeating
		return
	endif
	gamemode_getnumplayers
	if (<num_players> > 1)
		return
	endif
	<player> = 1
	<gig_array> = [1 3 5 7 9 10]
	getplayerinfo <player> part
	if (<part> = bass)
		<total_fived> = 0
		getarraysize <gig_array>
		<gig_index> = 0
		begin
		achievements_hasgigbeenwonondiff player = <player> gignum = (<gig_array> [<gig_index>]) part = 'bass' diff = expert
		<total_fived> = (<total_fived> + <num_gigs_fived>)
		<gig_index> = (<gig_index> + 1)
		repeat <array_size>
		printf channel = ach_debug qs(0x21866a4b) d = <total_fived>
		if (<total_fived> >= 6)
			printf \{channel = ach_debug
				qs(0xe0885e1e)}
			achievements_awardplayer achievement = threeonesix player = <player>
		endif
	endif
endscript

script achievements_red_ball_jets 
	printf \{channel = ach_debug
		'Achievements_RED_BALL_JETS'}
	if achievements_issongwon
		return
	endif
	if achievements_ischeating
		return
	endif
	gamemode_getnumplayersshown
	<player> = 1
	<gig_array> = [1 2 3 4 5 6 7 8 9 10]
	<part_array> = ['guitar' 'bass' 'drum' 'vocals' 'band']
	begin
	<eligible> = 1
	if (<num_players_shown> > 1)
		getplayerinfo <player> controller
		if (<controller> != ($band_mode_current_leader))
			<eligible> = 0
		endif
	endif
	if (<eligible> = 1)
		<part_index> = 0
		getarraysize <part_array>
		<part_array_size_holder> = <array_size>
		begin
		getarraysize <gig_array>
		<gig_index> = 0
		<num_diffs_won> = 0
		begin
		achievements_hasgigbeenwon player = <player> gignum = (<gig_array> [<gig_index>]) part = (<part_array> [<part_index>])
		<num_diffs_won> = (<num_diffs_won> + <num_gigs_won>)
		<gig_index> = (<gig_index> + 1)
		repeat <array_size>
		printf channel = ach_debug qs(0x7d3778b1) n = <num_diffs_won>
		if (<num_diffs_won> > 5)
			achievements_awardplayer achievement = red_ball_jets player = <player>
			printf channel = ach_debug qs(0x5e12386d) p = (<part_array> [<part_index>]) n = <num_diffs_won>
		endif
		<part_index> = (<part_index> + 1)
		repeat <part_array_size_holder>
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_fair_warning 
	printf \{channel = ach_debug
		'Achievements_FAIR_WARNING'}
	if achievements_ischeating
		return
	endif
	if gotparam \{player}
		gamemode_getnumplayersshown
		if (<num_players_shown> > 1)
			getplayerinfo <player> controller
			if (<controller> != ($band_mode_current_leader))
				printf channel = ach_debug qs(0x390afd8e) n = <player>
				return
			endif
		endif
		printf \{channel = ach_debug
			'Achievements_FAIR_WARNING found '}
		achievements_awardplayer achievement = fair_warning player = <player>
	endif
endscript

script achievements_mammoth 
	printf \{channel = ach_debug
		'Achievements_MAMMOTH'}
	if achievements_issongwon
		return
	endif
	if achievements_ischeating
		return
	endif
	gamemode_getnumplayersshown
	<player> = 1
	<gig_array> = [5 6]
	<part_array> = ['guitar' 'bass' 'drum' 'vocals' 'band']
	begin
	<eligible> = 1
	if (<num_players_shown> > 1)
		getplayerinfo <player> controller
		if (<controller> != ($band_mode_current_leader))
			<eligible> = 0
		endif
	endif
	if (<eligible> = 1)
		<part_index> = 0
		getarraysize <part_array>
		<part_array_size_holder> = <array_size>
		begin
		getarraysize <gig_array>
		<gig_index> = 0
		<win_counter> = 0
		begin
		achievements_hasgigbeenwon player = <player> gignum = (<gig_array> [<gig_index>]) part = (<part_array> [<part_index>])
		if (<num_gigs_won> = 1)
			<win_counter> = (<win_counter> + 1)
		endif
		<gig_index> = (<gig_index> + 1)
		repeat <array_size>
		printf channel = ach_debug qs(0xdd35063d) w = <win_counter> a = <array_size> p = (<part_array> [<part_index>])
		if (<win_counter> = 2)
			achievements_awardplayer achievement = mammoth player = <player>
		endif
		<part_index> = (<part_index> + 1)
		repeat <part_array_size_holder>
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_diver_down 
	printf \{channel = ach_debug
		'Achievements_DIVER_DOWN'}
	if achievements_ischeating
		return
	endif
	if gotparam \{player}
		gamemode_getnumplayersshown
		if (<num_players_shown> > 1)
			getplayerinfo <player> controller
			if (<controller> != ($band_mode_current_leader))
				printf channel = ach_debug qs(0xbb8b3dff) n = <player>
				return
			endif
		endif
		printf \{channel = ach_debug
			'Achievements_DIVER_DOWN found '}
		achievements_awardplayer achievement = diver_down player = <player>
	endif
endscript

script achievements_1984 
	printf \{channel = ach_debug
		'Achievements_1984'}
	if achievements_ischeating
		return
	endif
	if gotparam \{player}
		gamemode_getnumplayersshown
		if (<num_players_shown> > 1)
			getplayerinfo <player> controller
			if (<controller> != ($band_mode_current_leader))
				printf channel = ach_debug qs(0x430c1c00) n = <player>
				return
			endif
		endif
		getplayerinfo <player> part
		if (<part> = drum)
			printf \{channel = ach_debug
				'Achievements_1984 found '}
			achievements_awardplayer achievement = nineteen84 player = <player>
		endif
	endif
endscript

script achievements_1984_helper 
	printf \{channel = ach_debug
		'Achievements_1984_helper'}
	if NOT achievements_issongwon
		return
	endif
	if achievements_ischeating
		return
	endif
	get_current_band_info
	getglobaltags <band_info>
	if ($current_num_players > 1)
		if (<career_credits_band_complete> = 0)
			return
		endif
	elseif
		getplayerinfo \{1
			part}
		if NOT (<part> = drum)
			printf \{channel = ach_debug
				qs(0x31e42870)}
			return
		endif
		if (<career_credits_drum_complete> = 0)
			printf \{channel = ach_debug
				qs(0xa5eb4fab)}
			return
		endif
	endif
	printf \{channel = ach_debug
		'Achievements_1984_helper #2'}
	gamemode_getnumplayersshown
	<player> = 1
	begin
	<eligible> = 1
	if (<num_players_shown> > 1)
		getplayerinfo <player> controller
		if (<controller> != ($band_mode_current_leader))
			printf channel = ach_debug qs(0x430c1c00) n = <player>
			<eligible> = 0
		endif
	endif
	getplayerinfo <player> part
	printf channel = ach_debug 'Achievements_1984_helper part=%p' p = <part>
	if (<part> = drum && <eligible> = 1)
		if played_all_expertplus_songs player = <player>
			printf \{channel = ach_debug
				'Achievements_1984_helper found '}
			achievements_awardplayer achievement = nineteen84 player = <player>
		endif
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_the_woodshed 
	printf \{channel = ach_debug
		'Achievements_THE_WOODSHED'}
	if achievements_issongwon
		return
	endif
	if achievements_ischeating
		return
	endif
	gamemode_getnumplayers
	if (<num_players> > 1)
		return
	endif
	<player> = 1
	<song_array> = [eruption littleguitars cathedral spanishfly]
	begin
	<total_fived> = 0
	getarraysize <song_array>
	<song_index> = 0
	begin
	format_globaltag_song_checksum part = guitar song = (<song_array> [<song_index>]) difficulty = expert
	getglobaltags <song_checksum> params = stars
	getglobaltags <song_checksum> params = beststars
	if (<stars> > 4)
		<total_fived> = (<total_fived> + 1)
		printf channel = ach_debug qs(0x9599d9ce) s = (<song_array> [<song_index>])
	elseif (<beststars> > 4)
		<total_fived> = (<total_fived> + 1)
		printf channel = ach_debug qs(0xab824452) s = (<song_array> [<song_index>])
	endif
	<song_index> = (<song_index> + 1)
	repeat <array_size>
	printf channel = ach_debug qs(0x7029befc) d = <total_fived>
	if (<total_fived> = <array_size>)
		achievements_awardplayer achievement = the_woodshed player = <player>
	endif
	<player> = (<player> + 1)
	repeat <num_players>
endscript

script achievements_5150 
	printf \{channel = ach_debug
		'Achievements_5150'}
	if achievements_issongwon
		return
	endif
	if achievements_ischeating
		return
	endif
	gamemode_getnumplayersshown
	<player> = 1
	<gig_array> = [1 3 5 7 9 10]
	<part_array> = ['guitar' 'bass' 'drum' 'vocals']
	begin
	<eligible> = 1
	if (<num_players_shown> > 1)
		getplayerinfo <player> controller
		if (<controller> != ($band_mode_current_leader))
			<eligible> = 0
		endif
	endif
	if (<eligible> = 1)
		<part_index> = 0
		getarraysize <part_array>
		<part_array_size_holder> = <array_size>
		<win_counter> = 0
		begin
		getarraysize <gig_array>
		<gig_index> = 0
		printf channel = ach_debug qs(0x2a2ae064) a = <array_size> p = (<part_array> [<part_index>])
		begin
		achievements_hasgigbeenwon player = <player> gignum = (<gig_array> [<gig_index>]) part = (<part_array> [<part_index>])
		if (<num_gigs_won> >= 1)
			<win_counter> = (<win_counter> + 1)
		endif
		<gig_index> = (<gig_index> + 1)
		repeat <array_size>
		<part_index> = (<part_index> + 1)
		repeat <part_array_size_holder>
		printf channel = ach_debug qs(0x1e220f99) d = <win_counter>
		if (<win_counter> = 24)
			achievements_awardplayer achievement = fiftyonefifty player = <player>
		endif
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript
