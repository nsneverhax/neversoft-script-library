
script setup_globaltags 
	globaltag_checksum = initial_v90
	setup_songtags globaltag_checksum = <globaltag_checksum>
	setup_venuetags globaltag_checksum = <globaltag_checksum>
	setup_unlocks globaltag_checksum = <globaltag_checksum>
	get_progression_globals \{game_mode = p1_career}
	setup_setlisttags setlist_songs = <tier_global> globaltag_checksum = <globaltag_checksum>
	get_progression_globals \{game_mode = p1_quickplay}
	setup_setlisttags setlist_songs = <tier_global> globaltag_checksum = <globaltag_checksum>
	get_progression_globals \{game_mode = p2_quickplay}
	setup_setlisttags setlist_songs = <tier_global> globaltag_checksum = <globaltag_checksum>
	get_progression_globals \{game_mode = p2_faceoff}
	setup_setlisttags setlist_songs = <tier_global> globaltag_checksum = <globaltag_checksum>
	get_progression_globals \{game_mode = p1_quickplay
		bonus}
	setup_setlisttags setlist_songs = <tier_global> globaltag_checksum = <globaltag_checksum>
	get_progression_globals \{game_mode = p2_quickplay
		bonus}
	setup_setlisttags setlist_songs = <tier_global> globaltag_checksum = <globaltag_checksum>
	get_progression_globals \{game_mode = p1_quickplay
		download}
	setup_setlisttags setlist_songs = <tier_global> globaltag_checksum = <globaltag_checksum>
	get_progression_globals \{game_mode = p2_quickplay
		download}
	setup_setlisttags setlist_songs = <tier_global> globaltag_checksum = <globaltag_checksum>
	setup_bandtags globaltag_checksum = <globaltag_checksum>
	setup_user_option_tags globaltag_checksum = <globaltag_checksum>
	setup_training_tags globaltag_checksum = <globaltag_checksum>
	setup_store_tags globaltag_checksum = <globaltag_checksum>
	setup_characterguitar_tags globaltag_checksum = <globaltag_checksum>
	setup_online_tags globaltag_checksum = <globaltag_checksum>
	setup_character_tags globaltag_checksum = <globaltag_checksum>
	setup_achievement_tags globaltag_checksum = <globaltag_checksum>
	setglobaltags globaltag_checksum params = {globaltag_checksum = <globaltag_checksum>}
endscript
default_topscores_easy = {
	score1 = 19737
	score2 = 18164
	score3 = 17809
	score4 = 15500
	score5 = 15434
}
default_topscores_medium = {
	score1 = 46322
	score2 = 41217
	score3 = 39989
	score4 = 32984
	score5 = 20107
}
default_topscores_hard = {
	score1 = 54046
	score2 = 49787
	score3 = 41256
	score4 = 38002
	score5 = 27015
}
default_topscores_expert = {
	score1 = 64289
	score2 = 61986
	score3 = 55423
	score4 = 51425
	score5 = 29001
}
default_songtagswithdifficulty = {
	name1 = "C. Ward"
	name2 = "Riggs"
	name3 = "davidicus"
	name4 = "B. Wiuff"
	name5 = "Pam D."
	stars1 = 0
	stars2 = 0
	stars3 = 0
	stars4 = 0
	stars5 = 0
	bestscore = 0
	beststars = 0
	achievement_gold_star = 0
	failedtimes = 0
	coop_failedtimes = 0
	percent100 = 0
}

script setup_character_tags 
	find_secret_character_index \{info_name = tomh}
	<tom_h_index> = <index>
	find_secret_character_index \{info_name = bradw}
	<brad_w_index> = <index>
	getarraysize \{secret_characters
		globalarray}
	<i> = 0
	begin
	if (<i> = <tom_h_index> || <i> = <brad_w_index>)
		setglobaltags ($secret_characters [<i>].id) params = {unlocked_for_purchase = 1}
	else
		setglobaltags ($secret_characters [<i>].id) params = {unlocked_for_purchase = 0}
	endif
	globaltag_checksum = (<globaltag_checksum> + ($secret_characters [0].id))
	<i> = (<i> + 1)
	repeat <array_size>
	return globaltag_checksum = <globaltag_checksum>
endscript
default_songtags = {
	available_on_other_client = 0
	beaten_coop_as_lead = 0
	beaten_coop_as_rhythm = 0
}
player_suffix = [
	'p1'
	'p2'
]

script get_formatted_songname 
	if NOT gotparam \{player_count}
		player_count = 1
		if ($game_mode = p2_quickplay)
			<player_count> = 2
		endif
	endif
	formattext checksumname = songname '%s_%d_%m' s = (<song_prefix>) d = <difficulty_text_nl> m = ($player_suffix [(<player_count> - 1)]) addtostringlookup = true
	return songname = <songname>
endscript

script setup_songtags 
	player_count = 1
	begin
	getarraysize \{$difficulty_list}
	num_difficulty = <array_size>
	array_count = 0
	begin
	get_difficulty_text_nl difficulty = ($difficulty_list [<array_count>])
	formattext checksumname = default_topscores 'default_topscores_%d' d = <difficulty_text_nl>
	get_songlist_size
	song_array_size = <array_size>
	song_count = 0
	begin
	get_songlist_checksum index = <song_count>
	get_song_prefix song = <song_checksum>
	get_formatted_songname song_prefix = (<song_prefix>) difficulty_text_nl = <difficulty_text_nl> player_count = <player_count>
	if gotparam \{globaltag_checksum}
		globaltag_checksum = (<globaltag_checksum> + <songname>)
	endif
	get_song_struct song = <song_checksum>
	if (<song_struct>.version = gh3)
		if NOT getglobaltags <songname> noassert = 1
			get_song_title song = <song_checksum>
			setglobaltags <songname> params = {($default_songtagswithdifficulty) (<default_topscores>)}
		endif
		if NOT getglobaltags <song_checksum> noassert = 1
			setglobaltags <song_checksum> params = {($default_songtags)}
		endif
	endif
	song_count = (<song_count> + 1)
	repeat <song_array_size>
	<array_count> = (<array_count> + 1)
	repeat <num_difficulty>
	<player_count> = (<player_count> + 1)
	repeat 2
	song_count = 0
	getarraysize ($gh3_bonus_songs.tier1.songs)
	begin
	unlocked = -1
	getglobaltags ($gh3_bonus_songs.tier1.songs [<song_count>])
	if (<unlocked> = -1)
		setglobaltags ($gh3_bonus_songs.tier1.songs [<song_count>]) params = {unlocked = 0}
	endif
	song_count = (<song_count> + 1)
	repeat <array_size>
	if gotparam \{globaltag_checksum}
		return globaltag_checksum = <globaltag_checksum>
	endif
endscript
default_venuetags = {
	unlocked = 0
}
cheat_venuetags = {
	unlocked = 1
}

script setup_venuetags 
	if gotparam \{cheat}
		venue_tags = $cheat_venuetags
	else
		venue_tags = $default_venuetags
	endif
	setup_generalvenuetags
	band_count = 0
	begin
	getarraysize \{$levelzonearray}
	level_zone_array_size = <array_size>
	index = 0
	begin
	getarraysize \{$difficulty_list}
	diff_array_size = <array_size>
	diff_index = 0
	begin
	player = 1
	begin
	get_difficulty_text_nl difficulty = ($difficulty_list [<diff_index>])
	get_levelzonearray_checksum index = <index>
	formattext checksumname = final_checksum 'p%p_career_band%i_%d%s' i = (<band_count> + 1) p = <player> d = <difficulty_text_nl> s = ($levelzones.<level_checksum>.name) addtostringlookup = true
	setglobaltags <final_checksum> params = {(<venue_tags>)}
	if (<player> = 1)
		get_progression_globals \{game_mode = p1_career}
	endif
	tier_level = ($<tier_global>.tier1.level)
	tier_name = ($levelzones.<tier_level>.name)
	formattext checksumname = final_checksum 'p%p_career_band%i_%d%s' i = (<band_count> + 1) p = <player> d = <difficulty_text_nl> s = <tier_name> addtostringlookup = true
	setglobaltags <final_checksum> params = {unlocked = 1}
	formattext checksumname = venue_checksum 'venue_%s' s = ($levelzones.<tier_level>.name)
	setglobaltags <venue_checksum> params = {unlocked = 1}
	second_tier_level = ($<tier_global>.tier2.level)
	formattext checksumname = second_venue_checksum 'venue_%s' s = ($levelzones.<second_tier_level>.name)
	setglobaltags <second_venue_checksum> params = {unlocked = 1}
	if structurecontains structure = ($<tier_global>.tier1) unlocked_levels
		getarraysize ($<tier_global>.tier1.unlocked_levels)
		array_count = 0
		begin
		level_checksum = ($<tier_global>.tier1.unlocked_levels [<array_count>])
		formattext checksumname = venue_checksum 'venue_%s' s = ($levelzones.<level_checksum>.name)
		setglobaltags <venue_checksum> params = {unlocked = 1}
		array_count = (<array_count> + 1)
		repeat <array_size>
	endif
	if gotparam \{globaltag_checksum}
		<globaltag_checksum> = (<globaltag_checksum> + <final_checksum>)
	endif
	<player> = (<player> + 1)
	repeat 2
	<diff_index> = (<diff_index> + 1)
	repeat <diff_array_size>
	<index> = (<index> + 1)
	repeat (<level_zone_array_size> - 1)
	<band_count> = (<band_count> + 1)
	repeat ($num_career_bands)
	if gotparam \{globaltag_checksum}
		return globaltag_checksum = <globaltag_checksum>
	endif
endscript

script setup_generalvenuetags 
	get_levelzonearray_size
	array_count = 0
	begin
	get_levelzonearray_checksum index = <array_count>
	formattext checksumname = venue_checksum 'venue_%s' s = ($levelzones.<level_checksum>.name) addtostringlookup = true
	if NOT getglobaltags <venue_checksum> noassert = 1
		setglobaltags <venue_checksum> params = {($default_venuetags)}
	endif
	if is_levelzone_downloaded level_checksum = <level_checksum>
		if (<download> = 1)
			setglobaltags <venue_checksum> params = {unlocked = 1}
		endif
	else
		setglobaltags <venue_checksum> params = {unlocked = 0}
	endif
	array_count = (<array_count> + 1)
	repeat <array_size>
endscript
default_guitartags = {
	unlocked = 0
	unlocked_on_other_client = 0
	available_on_other_client = 0
}
default_charactertags = {
	unlocked = 0
	unlocked_on_other_client = 0
	available_on_other_client = 0
}

script setup_unlocks 
	getarraysize \{$secret_guitars}
	array_count = 0
	begin
	if NOT getglobaltags ($secret_guitars [<array_count>].id) noassert = 1
		setglobaltags ($secret_guitars [<array_count>].id) params = {($default_guitartags) unlocked_for_purchase = 0}
	endif
	globaltag_checksum = (<globaltag_checksum> + ($secret_guitars [<array_count>].id))
	array_count = (<array_count> + 1)
	repeat <array_size>
	getarraysize \{$bonus_guitars}
	array_count = 0
	begin
	if NOT getglobaltags ($bonus_guitars [<array_count>].id) noassert = 1
		setglobaltags ($bonus_guitars [<array_count>].id) params = {($default_guitartags) unlocked_for_purchase = 1}
	endif
	globaltag_checksum = (<globaltag_checksum> + ($bonus_guitars [<array_count>].id))
	array_count = (<array_count> + 1)
	repeat <array_size>
	getarraysize \{$bonus_guitar_finishes}
	array_count = 0
	begin
	if NOT getglobaltags ($bonus_guitar_finishes [<array_count>].id) noassert = 1
		setglobaltags ($bonus_guitar_finishes [<array_count>].id) params = {($default_guitartags) unlocked_for_purchase = 1}
	endif
	globaltag_checksum = (<globaltag_checksum> + ($bonus_guitar_finishes [<array_count>].id))
	array_count = (<array_count> + 1)
	repeat <array_size>
	getarraysize \{$bonus_basses}
	array_count = 0
	begin
	if NOT getglobaltags ($bonus_basses [<array_count>].id) noassert = 1
		setglobaltags ($bonus_basses [<array_count>].id) params = {($default_guitartags) unlocked_for_purchase = 1}
	endif
	globaltag_checksum = (<globaltag_checksum> + ($bonus_basses [<array_count>].id))
	array_count = (<array_count> + 1)
	repeat <array_size>
	getarraysize \{$bonus_bass_finishes}
	array_count = 0
	begin
	if NOT getglobaltags ($bonus_bass_finishes [<array_count>].id) noassert = 1
		setglobaltags ($bonus_bass_finishes [<array_count>].id) params = {($default_guitartags) unlocked_for_purchase = 1}
	endif
	globaltag_checksum = (<globaltag_checksum> + ($bonus_bass_finishes [<array_count>].id))
	array_count = (<array_count> + 1)
	repeat <array_size>
	getarraysize \{$secret_characters}
	array_count = 0
	begin
	if NOT getglobaltags ($secret_characters [<array_count>].id) noassert = 1
		setglobaltags ($secret_characters [<array_count>].id) params = {($default_charactertags)}
	endif
	globaltag_checksum = (<globaltag_checksum> + ($secret_characters [<array_count>].id))
	array_count = (<array_count> + 1)
	repeat <array_size>
	getarraysize \{$bonus_outfits}
	array_count = 0
	begin
	if NOT getglobaltags ($bonus_outfits [<array_count>].id) noassert = 1
		setglobaltags ($bonus_outfits [<array_count>].id) params = {unlocked = 0}
	endif
	globaltag_checksum = (<globaltag_checksum> + ($bonus_outfits [<array_count>].id))
	array_count = (<array_count> + 1)
	repeat <array_size>
	getarraysize \{$bonus_styles}
	array_count = 0
	begin
	if NOT getglobaltags ($bonus_styles [<array_count>].id) noassert = 1
		mod a = <array_count> b = 12
		if ((<mod> = 0) || (<array_count> = 101) || (<array_count> = 106))
			if (<array_count> != 108)
				setglobaltags ($bonus_styles [<array_count>].id) params = {unlocked = 1}
			else
				setglobaltags ($bonus_styles [<array_count>].id) params = {unlocked = 0}
			endif
		else
			setglobaltags ($bonus_styles [<array_count>].id) params = {unlocked = 0}
		endif
	endif
	globaltag_checksum = (<globaltag_checksum> + ($bonus_styles [<array_count>].id))
	array_count = (<array_count> + 1)
	repeat <array_size>
	return globaltag_checksum = <globaltag_checksum>
endscript
default_songsetlisttags = {
	stars = 0
	score = 0
	percent100 = 0
	unlocked = 0
}

script setup_setlisttags \{globaltag_checksum = none
		force = 0}
	setup_tiertags setlist_songs = <setlist_songs>
	array_count = 0
	begin
	formattext checksumname = tier 'tier%s' s = (<array_count> + 1)
	getarraysize ($<setlist_songs>.<tier>.songs)
	if (<array_size> > 0)
		song_count = 0
		begin
		song = ($<setlist_songs>.<tier>.songs [<song_count>])
		setlist_prefix = ($<setlist_songs>.prefix)
		setglobaltags <song> params = {unlocked = 0}
		formattext textname = song_checksum_suffix '%p_song%i_tier%s' p = <setlist_prefix> i = (<song_count> + 1) s = (<array_count> + 1)
		extendcrc out = song_checksum <song> <song_checksum_suffix>
		globaltag_checksum = (<globaltag_checksum> + <song_checksum>)
		formattext checksumname = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = (<song_count> + 1) s = (<array_count> + 1) addtostringlookup = true
		if NOT getglobaltags <song_checksum> noassert = 1
			setglobaltags <song_checksum> params = {($default_songsetlisttags)}
		elseif (<force> = 1)
			setglobaltags <song_checksum> params = {($default_songsetlisttags)}
		endif
		if structurecontains structure = ($<setlist_songs>.<tier>) defaultunlocked
			if (<song_count> < $<setlist_songs>.<tier>.defaultunlocked)
				setglobaltags <song_checksum> params = {unlocked = 1}
			endif
		elseif structurecontains structure = ($<setlist_songs>.<tier>) unlockall
			song = ($<setlist_songs>.<tier>.songs [<song_count>])
			if is_song_downloaded song_checksum = <song>
				setglobaltags <song_checksum> params = {unlocked = 1}
			else
				setglobaltags <song_checksum> params = {unlocked = 0}
			endif
		endif
		song_count = (<song_count> + 1)
		repeat <array_size>
	endif
	array_count = (<array_count> + 1)
	repeat ($<setlist_songs>.num_tiers)
	return globaltag_checksum = <globaltag_checksum>
endscript
default_tiertags = {
	unlocked = 0
	complete = 0
	encore_unlocked = 0
	aerosmith_unlocked = 0
	boss_unlocked = 0
	num_intro_songs_to_progress = 2
	num_songs_to_progress = 3
}

script setup_tiertags 
	num_tiers = ($<setlist_songs>.num_tiers)
	array_count = 0
	begin
	setlist_prefix = ($<setlist_songs>.prefix)
	formattext checksumname = tier 'tier%s' s = (<array_count> + 1)
	formattext checksumname = tiername '%ptier%i' p = <setlist_prefix> i = (<array_count> + 1) addtostringlookup = true
	if NOT getglobaltags <tiername> noassert = 1
		setglobaltags <tiername> params = {($default_tiertags)}
	endif
	if structurecontains structure = ($<setlist_songs>.<tier>) defaultunlocked
		setglobaltags <tiername> params = {unlocked = 1}
	endif
	if structurecontains structure = ($<setlist_songs>.<tier>) unlockall
		setglobaltags <tiername> params = {unlocked = 1}
	endif
	array_count = (<array_count> + 1)
	repeat <num_tiers>
endscript
default_bandtags = {
	cash = 0
	name = ""
	first_play = 1
	first_battle_play = 1
	first_venue_movie_played = 0
	band_unique_id = non_existent_checksum
	hendrix_achievement_easy = -1
	hendrix_achievement_medium = -1
	hendrix_achievement_hard = -1
	hendrix_achievement_expert = -1
}

script setup_bandtags 
	band_count = 0
	begin
	getarraysize \{$difficulty_list}
	array_count = 0
	begin
	get_difficulty_text_nl difficulty = ($difficulty_list [<array_count>])
	formattext checksumname = bandname 'p1_career_band%i_%d' i = (<band_count> + 1) d = <difficulty_text_nl> addtostringlookup = true
	push_bandtags bandname = <bandname> mode = p1_career
	formattext checksumname = default_bandname 'band%i_info_p1_career' i = (<band_count> + 1) addtostringlookup = true
	setglobaltags <default_bandname> params = {($default_bandtags)}
	array_count = (<array_count> + 1)
	repeat <array_size>
	<band_count> = (<band_count> + 1)
	repeat ($num_career_bands + 1)
	getarraysize \{$difficulty_list}
	array_count = 0
	begin
	get_difficulty_text_nl difficulty = ($difficulty_list [<array_count>])
	get_progression_globals \{game_mode = p1_career}
	setlist_prefix = ($<tier_global>.prefix)
	formattext checksumname = gametype_checksum '%p_%s' p = <setlist_prefix> s = <difficulty_text_nl> addtostringlookup = true
	setglobaltags <gametype_checksum> params = {complete = 0}
	get_progression_globals \{game_mode = p1_career
		bonus}
	setlist_prefix = ($<tier_global>.prefix)
	formattext checksumname = gametype_checksum '%p_%s' p = <setlist_prefix> s = <difficulty_text_nl> addtostringlookup = true
	setglobaltags <gametype_checksum> params = {complete = 0}
	get_progression_globals \{game_mode = p2_quickplay}
	setlist_prefix = ($<tier_global>.prefix)
	formattext checksumname = gametype_checksum '%p_%s' p = <setlist_prefix> s = <difficulty_text_nl> addtostringlookup = true
	setglobaltags <gametype_checksum> params = {complete = 0}
	array_count = (<array_count> + 1)
	repeat <array_size>
	setglobaltags \{progression
		params = {
			current_band = 1
			current_difficulty = easy
			current_gamemode = p1_career
		}}
endscript

script setup_user_option_tags 
	setglobaltags \{user_options
		params = {
			guitar_volume = 11
			band_volume = 11
			sfx_volume = 11
			lefty_flip_p1 = 0
			lefty_flip_p2 = 0
			lag_calibration = 0.0
			autosave = 1
			resting_whammy_position_device_0 = -0.76
			resting_whammy_position_device_1 = -0.76
			resting_whammy_position_device_2 = -0.76
			resting_whammy_position_device_3 = -0.76
			resting_whammy_position_device_4 = -0.76
			resting_whammy_position_device_5 = -0.76
			resting_whammy_position_device_6 = -0.76
			star_power_position_device_0 = -1.0
			star_power_position_device_1 = -1.0
			star_power_position_device_2 = -1.0
			star_power_position_device_3 = -1.0
			star_power_position_device_4 = -1.0
			star_power_position_device_5 = -1.0
			star_power_position_device_6 = -1.0
			gamma_brightness = 5
			online_game_mode = 0
			online_game_mode_ranked = 0
			online_difficulty = 0
			online_difficulty_ranked = 0
			online_num_songs = 0
			online_num_songs_ranked = 0
			online_tie_breaker = 0
			online_highway = 0
			unlock_cheat_airguitar = 0
			unlock_cheat_performancemode = 0
			unlock_cheat_hyperspeed = 0
			unlock_cheat_nofail = 0
			unlock_cheat_precisionmode = 0
		}}
endscript

script setup_online_tags 
	setglobaltags \{net
		params = {
			face_off_streak = 0
			pro_face_off_streak = 0
			battle_streak = 0
			faceoff_wins = 0
			faceoff_loses = 0
			pro_faceoff_wins = 0
			pro_faceoff_loses = 0
			battle_wins = 0
			battle_loses = 0
		}}
endscript

script restore_options_from_global_tags 
	getglobaltags \{user_options}
	if (<lefty_flip_p1>)
		change \{pad_event_up_inversion = true}
	else
		change \{pad_event_up_inversion = false}
	endif
endscript

script setup_training_tags 
	setglobaltags \{training
		params = {
			basic_lesson = not_complete
			star_power_lesson = not_complete
			guitar_battle_lesson = not_complete
			advanced_techniques_lesson = not_complete
		}}
endscript

script setup_store_tags 
	getarraysize ($bonus_videos)
	index = 0
	begin
	video_checksum = ($bonus_videos [<index>].id)
	setglobaltags <video_checksum> params = {unlocked = 0}
	<index> = (<index> + 1)
	repeat <array_size>
	bv_find_first_career_movie_index
	i = <index>
	getarraysize ($bv_text_array)
	begin
	video_checksum = ($bv_text_array [<i>].id)
	setglobaltags <video_checksum> params = {unlocked = 0}
	<i> = (<i> + 1)
	repeat (<array_size> - <index> - 5)
	bv_unlock_intro_videos
endscript
default_characterguitartags = {
	current_selected_guitar = instrument_les_paul_black
	current_selected_bass = instrument_lp_vbrst
	current_instrument = guitar
	current_outfit = 1
	current_style = 1
}

script setup_characterguitar_tags 
	get_musician_profile_size
	<musician_profile_index> = 0
	begin
	<player> = 1
	begin
	get_musician_profile_struct index = <musician_profile_index>
	formattext checksumname = characterguitartags 'character_%c_player_%p_guitar_tags' c = (<profile_struct>.name) p = <player> addtostringlookup = true
	if NOT getglobaltags <characterguitartags> noassert = 1
		setglobaltags <characterguitartags> params = {($default_characterguitartags)}
		if structurecontains structure = <profile_struct> name = musician_instrument
			<inst_id> = (<profile_struct>.musician_instrument.desc_id)
			setglobaltags <characterguitartags> params = {current_selected_guitar = <inst_id>}
		endif
		if structurecontains structure = <profile_struct> name = outfits
			formattext checksumname = profile_id '%n' n = (<profile_struct>.name)
			get_initial_outfit_reference player = <player> character_id = <profile_id>
			setglobaltags <characterguitartags> params = {current_style = <reference>}
		endif
	else
		valid = 0
		if find_instrument_index desc_id = <current_selected_guitar>
			if is_musician_instrument_downloaded index = <index>
				valid = 1
			endif
		endif
		if (<valid> = 0)
			printf \{"Invalid Instrument found in setup_characterguitar_tags - changing to les paul black"}
			setglobaltags <characterguitartags> params = {current_selected_guitar = instrument_les_paul_black}
		endif
		valid = 0
		if find_instrument_index desc_id = <current_selected_bass>
			if is_musician_instrument_downloaded index = <index>
				valid = 1
			endif
		endif
		if (<valid> = 0)
			printf \{"Invalid Bass Instrument found in setup_characterguitar_tags - changing to lp vbrst"}
			setglobaltags <characterguitartags> params = {current_selected_bass = instrument_lp_vbrst}
		endif
	endif
	<player> = (<player> + 1)
	repeat 2
	<musician_profile_index> = (<musician_profile_index> + 1)
	repeat <array_size>
endscript

script push_bandtags \{mode = p1_career}
	get_progression_globals game_mode = <mode>
	if (<mode> = p1_career)
		career_songs = <tier_global>
		num_players = 1
	else
		printstruct <...>
		scriptassert \{"Invalid mode"}
	endif
	i = 0
	begin
	num_tiers = ($<career_songs>.num_tiers)
	array_count = 0
	begin
	formattext checksumname = tier 'tier%d' d = (<array_count> + 1)
	getarraysize ($<career_songs>.<tier>.songs)
	if NOT (<array_size> = 0)
		setlist_prefix = ($<career_songs>.prefix)
		formattext checksumname = tiername '%ptier%i' p = <setlist_prefix> i = (<array_count> + 1)
		formattext checksumname = tier_checksum 'tier%s' s = (<array_count> + 1)
		pushglobaltags <tiername> section = <bandname>
		getarraysize ($<career_songs>.<tier_checksum>.songs)
		song_count = 0
		begin
		setlist_prefix = ($<career_songs>.prefix)
		formattext checksumname = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = (<song_count> + 1) s = (<array_count> + 1) addtostringlookup = true
		pushglobaltags <song_checksum> section = <bandname>
		song_count = (<song_count> + 1)
		repeat <array_size>
	endif
	array_count = (<array_count> + 1)
	repeat <num_tiers>
	<i> = (<i> + 1)
	if (<i> = 1)
		get_progression_globals game_mode = <mode> bonus
	elseif (<i> = 2)
		get_progression_globals game_mode = <mode> download
	endif
	career_songs = <tier_global>
	repeat 3
	player = 1
	begin
	formattext checksumname = player_status 'player%i_status' i = <player>
	formattext checksumname = player_character_params 'player%i_character_params' i = <player> addtostringlookup = true
	setglobaltags <player_character_params> params = {character_id = ($<player_status>.character_id)
		instrument_id = ($<player_status>.instrument_id)
		style = ($<player_status>.style)
		outfit = ($<player_status>.outfit)}
	pushglobaltags <player_character_params> section = <bandname>
	player = (<player> + 1)
	repeat <num_players>
	pushglobaltags <player_character_params> section = <bandname>
endscript

script pop_bandtags 
	setup_setlisttags \{setlist_songs = gh3_download_songs
		force = 1}
	popglobaltags section = <bandname>
	<num_players> = 1
	player = 1
	begin
	formattext checksumname = player_status 'player%i_status' i = <player>
	formattext checksumname = player_character_params 'player%i_character_params' i = <player>
	getglobaltags <player_character_params>
	change structurename = <player_status> character_id = <character_id>
	change structurename = <player_status> instrument_id = <instrument_id>
	change structurename = <player_status> style = <style>
	change structurename = <player_status> outfit = <outfit>
	valid = 0
	if find_profile_by_id id = ($<player_status>.character_id)
		if is_musician_profile_downloaded index = <index>
			valid = 1
		endif
	endif
	if (<valid> = 0)
		printf \{"Invalid Character found - changing to axel"}
		change structurename = <player_status> character_id = axel
		change structurename = <player_status> style = 1
		change structurename = <player_status> outfit = 1
	endif
	valid = 0
	if find_instrument_index desc_id = ($<player_status>.instrument_id)
		if is_musician_instrument_downloaded index = <index>
			valid = 1
		endif
	endif
	if (<valid> = 0)
		printf \{"Invalid Instrument found - changing to les paul black"}
		change structurename = <player_status> instrument_id = instrument_les_paul_black
	endif
	player = (<player> + 1)
	repeat <num_players>
endscript

script globaltags_unlockall \{songs_only = 0}
	if NOT (<songs_only> = 1)
		array_count = 0
		getarraysize \{$bonus_guitars}
		begin
		setglobaltags ($bonus_guitars [<array_count>].id) params = {unlocked = 1 unlocked_for_purchase = 1}
		array_count = (<array_count> + 1)
		repeat <array_size>
		array_count = 0
		getarraysize \{$bonus_guitar_finishes}
		begin
		setglobaltags ($bonus_guitar_finishes [<array_count>].id) params = {unlocked = 1 unlocked_for_purchase = 1}
		array_count = (<array_count> + 1)
		repeat <array_size>
		array_count = 0
		getarraysize \{$secret_guitars}
		begin
		setglobaltags ($secret_guitars [<array_count>].id) params = {unlocked = 1 unlocked_for_purchase = 1}
		array_count = (<array_count> + 1)
		repeat <array_size>
		array_count = 0
		getarraysize \{$bonus_basses}
		begin
		setglobaltags ($bonus_basses [<array_count>].id) params = {unlocked = 1 unlocked_for_purchase = 1}
		array_count = (<array_count> + 1)
		repeat <array_size>
		array_count = 0
		getarraysize \{$bonus_bass_finishes}
		begin
		setglobaltags ($bonus_bass_finishes [<array_count>].id) params = {unlocked = 1 unlocked_for_purchase = 1}
		array_count = (<array_count> + 1)
		repeat <array_size>
		array_count = 0
		getarraysize \{$secret_characters}
		begin
		setglobaltags ($secret_characters [<array_count>].id) params = {unlocked = 1}
		array_count = (<array_count> + 1)
		repeat <array_size>
		array_count = 0
		getarraysize \{$bonus_outfits}
		begin
		setglobaltags ($bonus_outfits [<array_count>].id) params = {unlocked = 1}
		array_count = (<array_count> + 1)
		repeat <array_size>
		array_count = 0
		getarraysize \{$bonus_styles}
		begin
		setglobaltags ($bonus_styles [<array_count>].id) params = {unlocked = 1}
		array_count = (<array_count> + 1)
		repeat <array_size>
		array_count = 0
		getarraysize \{$bonus_videos}
		begin
		setglobaltags ($bonus_videos [<array_count>].id) params = {unlocked = 1}
		array_count = (<array_count> + 1)
		repeat <array_size>
	endif
	array_count = 0
	begin
	setlist_prefix = ($<songlist>.prefix)
	formattext checksumname = tiername '%ptier%i' p = <setlist_prefix> i = (<array_count> + 1)
	formattext checksumname = tier_checksum 'tier%s' s = (<array_count> + 1)
	getarraysize ($<songlist>.<tier_checksum>.songs)
	setglobaltags <tiername> params = {unlocked = 1
		complete = 1
		aerosmith_unlocked = 1
		encore_unlocked = 1
		boss_unlocked = 1
		num_intro_songs_to_progress = 0
		num_songs_to_progress = 0}
	song_count = 0
	begin
	setlist_prefix = ($<songlist>.prefix)
	formattext checksumname = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = (<song_count> + 1) s = (<array_count> + 1) addtostringlookup = true
	if (<songs_only> = 1)
		if NOT (<song_checksum> = bonus_song10_tier1)
			setglobaltags <song_checksum> params = {unlocked = 1}
		endif
	else
		setglobaltags <song_checksum> params = {stars = 5
			score = 1000000
			unlocked = 1}
		get_difficulty_text_nl difficulty = ($current_difficulty)
		get_song_prefix song = ($<songlist>.<tier_checksum>.songs [<song_count>])
		get_formatted_songname song_prefix = <song_prefix> difficulty_text_nl = <difficulty_text_nl>
		setglobaltags <songname> params = {achievement_gold_star = 1}
	endif
	song_count = (<song_count> + 1)
	repeat <array_size>
	array_count = (<array_count> + 1)
	repeat ($<songlist>.num_tiers)
	if NOT (<songs_only> = 1)
		setup_venuetags \{cheat}
	endif
endscript
progression_pop_count = 0

script progression_push_current \{force = 0}
	printscriptinfo \{"progression_push_current_callstack"}
	if NOT ($progression_pop_count = 1)
		if (<force> = 0)
			scriptassert \{"progression_push_current with nothing popped"}
		endif
		return
	endif
	getglobaltags \{progression
		params = current_band}
	getglobaltags \{progression
		params = current_difficulty}
	getglobaltags \{progression
		params = current_gamemode}
	get_difficulty_text_nl difficulty = (<current_difficulty>)
	if gotparam \{force_gamemode}
		<current_gamemode> = <force_gamemode>
	endif
	if (<current_gamemode> = p1_career)
		bandname_part1 = 'p1_career'
	endif
	formattext checksumname = bandname '%s_band%i_%d' s = <bandname_part1> i = <current_band> d = <difficulty_text_nl>
	push_bandtags bandname = <bandname> mode = <current_gamemode>
	change progression_pop_count = ($progression_pop_count - 1)
endscript

script progression_pop_current \{force = 0
		updateatoms = 1}
	printscriptinfo \{"progression_pop_current_callstack"}
	if NOT ($progression_pop_count = 0)
		if (<force> = 0)
			scriptassert \{"progression_pop_current with something already popped"}
		endif
		return
	endif
	current_gamemode = ($game_mode)
	if gotparam \{force_gamemode}
		<current_gamemode> = <force_gamemode>
	endif
	if (<current_gamemode> = p1_career)
		bandname_part1 = 'p1_career'
	else
		scriptassert \{"progression_pop_current not in career mode"}
	endif
	progression_getdifficulty
	get_difficulty_text_nl difficulty = <difficulty>
	formattext checksumname = bandname '%s_band%i_%d' s = <bandname_part1> i = ($current_band) d = <difficulty_text_nl>
	pop_bandtags bandname = <bandname>
	setglobaltags progression params = {current_band = ($current_band)
		current_difficulty = <difficulty>
		current_gamemode = <current_gamemode>}
	change progression_pop_count = ($progression_pop_count + 1)
endscript

script get_minimum_difficulty \{difficulty1 = easy
		difficulty2 = easy}
	if (<difficulty1> = <difficulty2>)
		return minimum_difficulty = <difficulty1>
	else
		switch <difficulty1>
			case easy
			return \{minimum_difficulty = easy}
			case medium
			if (<difficulty2> = easy)
				return \{minimum_difficulty = easy}
			else
				return \{minimum_difficulty = medium}
			endif
			case hard
			switch <difficulty2>
				case easy
				return \{minimum_difficulty = easy}
				case medium
				return \{minimum_difficulty = medium}
				case expert
				return \{minimum_difficulty = hard}
			endswitch
			case expert
			switch <difficulty2>
				case easy
				return \{minimum_difficulty = easy}
				case medium
				return \{minimum_difficulty = medium}
				case hard
				return \{minimum_difficulty = hard}
			endswitch
		endswitch
	endif
endscript

script get_game_mode_ui_string 
	if NOT gotparam \{game_mode}
		softassert \{"Did not get game_mode!"}
		return
	endif
	return ui_string = ($game_mode_ui_strings.<game_mode>)
endscript
game_mode_ui_strings = {
	p1_career = "Career"
	p1_quickplay = "Quick Play"
	p2_quickplay = "Co-op Quick Play"
	p2_faceoff = "Face-Off"
	p2_pro_faceoff = "Pro Face-Off"
	p2_battle = "Battle"
	p2_coop = "Co-op"
}

script get_difficulty_ui_string 
	if NOT gotparam \{difficulty}
		softassert \{"Did not get difficulty!"}
		return
	endif
	return ui_string = ($game_difficulty_ui_strings.<difficulty>)
endscript
game_difficulty_ui_strings = {
	easy = "Easy"
	medium = "Medium"
	hard = "Hard"
	expert = "Expert"
}
game_mode_names = {
	p1_career = 'p1_career'
	p1_quickplay = 'p1_quickplay'
	p2_quickplay = 'p2_quickplay'
	p2_faceoff = 'p2_faceoff'
	p2_pro_faceoff = 'p2_pro_faceoff'
	p2_battle = 'p2_battle'
	p2_coop = 'p2_coop'
}

script get_band_game_mode_name 
	game_mode_name = ($game_mode_names.p1_career)
	return game_mode_name = <game_mode_name>
endscript

script get_game_mode_name 
	return game_mode_name = ($game_mode_names.$game_mode)
endscript

script get_current_band_info 
	formattext checksumname = bandname 'band%i_info_p1_career' i = ($current_band)
	return band_info = <bandname>
endscript

script get_current_band_checksum 
	get_difficulty_text_nl difficulty = ($current_difficulty)
	formattext checksumname = bandname 'p1_career_band%i_%d' i = ($current_band) d = <difficulty_text_nl>
	return band_checksum = <bandname>
endscript

script setup_achievement_tags 
	setglobaltags \{achievement_info
		params = {
			ranked_matches_played = 0
			ranked_matches_won = 0
			ranked_consecutive_won_as_host = 0
			ranked_consecutive_won_as_client = 0
			ranked_matches_won_as_host = 0
			ranked_matches_won_as_client = 0
			ranked_matches_won_with_standard_controller = 0
			player_matches_played = 0
			player_matches_won = 0
			player_matches_won_as_host = 0
			player_matches_won_as_client = 0
			total_notes_in_career_mode = 0
			total_cash_in_career_mode = 0
			total_points_in_career_mode = 0
			total_points_in_career_mode_easy = 0
			total_points_in_career_mode_medium = 0
			total_points_in_career_mode_hard = 0
			total_points_in_career_mode_expert = 0
			hendrix_achievement_lefty_on = 0
			hendrix_achievement_lefty_off = 0
		}}
endscript

script set_online_match_info \{ranked = 0
		won = 0
		host = 0
		standard_controller = 0}
	getglobaltags \{achievement_info}
	printf \{"set_online_match_info"}
	if (<ranked> = 0)
		<player_matches> = (<player_matches_played> + 1)
		setglobaltags achievement_info params = {player_matches_played = <player_matches>}
		if (<won> = 1)
			<matches_won> = (<player_matches_won> + 1)
			setglobaltags achievement_info params = {player_matches_won = <matches_won>}
			if (<host> = 1)
				<host_won> = (<player_matches_won_as_host> + 1)
				setglobaltags achievement_info params = {player_matches_won_as_host = <host_won>}
			else
				<client_won> = (<player_matches_won_as_client> + 1)
				setglobaltags achievement_info params = {player_matches_won_as_client = <client_won>}
			endif
		endif
	else
		<player_matches> = (<ranked_matches_played> + 1)
		setglobaltags achievement_info params = {ranked_matches_played = <player_matches>}
		if (<won> = 1)
			<matches_won> = (<ranked_matches_won> + 1)
			setglobaltags achievement_info params = {ranked_matches_won = <matches_won>}
			if (<host> = 1)
				<host_won> = (<ranked_matches_won_as_host> + 1)
				setglobaltags achievement_info params = {ranked_matches_won_as_host = <host_won>}
				<consec_won> = (<ranked_consecutive_won_as_host> + 1)
				setglobaltags achievement_info params = {ranked_consecutive_won_as_host = <consec_won>}
			else
				<client_won> = (<ranked_matches_won_as_client> + 1)
				setglobaltags achievement_info params = {ranked_matches_won_as_client = <client_won>}
				<consec_won> = (<ranked_consecutive_won_as_client> + 1)
				setglobaltags achievement_info params = {ranked_consecutive_won_as_client = <consec_won>}
			endif
			if (<standard_controller> = 1)
				<controller_won> = (<ranked_matches_won_with_standard_controller> + 1)
				setglobaltags achievement_info params = {ranked_matches_won_with_standard_controller = <controller_won>}
			endif
		else
			if (<host> = 1)
				setglobaltags \{achievement_info
					params = {
						ranked_consecutive_won_as_host = 0
					}}
			else
				setglobaltags \{achievement_info
					params = {
						ranked_consecutive_won_as_client = 0
					}}
			endif
		endif
	endif
	getglobaltags \{achievement_info}
	printstruct <...>
endscript
