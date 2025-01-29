
script setup_globaltags 
	globaltag_checksum = 0x93ce58cf
	setup_songtags globaltag_checksum = <globaltag_checksum>
	setup_venuetags globaltag_checksum = <globaltag_checksum>
	setup_unlocks globaltag_checksum = <globaltag_checksum>
	get_progression_globals game_mode = p1_career
	setup_setlisttags setlist_songs = <tier_global> globaltag_checksum = <globaltag_checksum>
	get_progression_globals game_mode = p2_career
	setup_setlisttags setlist_songs = <tier_global> globaltag_checksum = <globaltag_checksum>
	get_progression_globals game_mode = p1_quickplay
	setup_setlisttags setlist_songs = <tier_global> globaltag_checksum = <globaltag_checksum>
	get_progression_globals game_mode = p2_faceoff
	setup_setlisttags setlist_songs = <tier_global> globaltag_checksum = <globaltag_checksum>
	get_progression_globals game_mode = p1_quickplay bonus
	setup_setlisttags setlist_songs = <tier_global> globaltag_checksum = <globaltag_checksum>
	setup_bandtags globaltag_checksum = <globaltag_checksum>
	setup_user_option_tags globaltag_checksum = <globaltag_checksum>
	setup_training_tags globaltag_checksum = <globaltag_checksum>
	setup_store_tags globaltag_checksum = <globaltag_checksum>
	setglobaltags globaltag_checksum params = {globaltag_checksum = <globaltag_checksum>}
endscript
default_topscores_easy = {
	score1 = 1000
	score2 = 1000
	score3 = 1000
	score4 = 1000
	score5 = 1000
}
default_topscores_medium = {
	score1 = 1000
	score2 = 1000
	score3 = 1000
	score4 = 1000
	score5 = 1000
}
default_topscores_hard = {
	score1 = 1000
	score2 = 1000
	score3 = 1000
	score4 = 1000
	score5 = 1000
}
default_topscores_expert = {
	score1 = 1000
	score2 = 1000
	score3 = 1000
	score4 = 1000
	score5 = 1000
}
default_songtags = {
	name1 = "ZIMMER"
	name2 = "SWINDON"
	name3 = "MRS BADCRUMBLE"
	name4 = "GUNTER"
	name5 = "THE QUEEN"
	stars1 = 0
	stars2 = 0
	stars3 = 0
	stars4 = 0
	stars5 = 0
}

script setup_songtags 
	getarraysize $difficulty_list
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
	formattext checksumname = songname '%s_%d' s = (<song_prefix>) d = <difficulty_text_nl> addtostringlookup = true
	if gotparam globaltag_checksum
		globaltag_checksum = (<globaltag_checksum> + <songname>)
	endif
	get_song_struct song = <song_checksum>
	if (<song_struct>.version = gh3)
		if NOT getglobaltags <songname> noassert = 1
			get_song_title song = <song_checksum>
			setglobaltags <songname> params = {($default_songtags) (<default_topscores>)}
		endif
	endif
	song_count = (<song_count> + 1)
	repeat <song_array_size>
	<array_count> = (<array_count> + 1)
	repeat <num_difficulty>
	if gotparam globaltag_checksum
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
	if gotparam cheat
		venue_tags = $cheat_venuetags
	else
		venue_tags = $default_venuetags
	endif
	setup_generalvenuetags
	band_count = 0
	begin
	getarraysize $levelzonearray
	level_zone_array_size = <array_size>
	index = 0
	begin
	getarraysize $difficulty_list
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
		get_progression_globals game_mode = p1_career
	else
		get_progression_globals game_mode = p2_career
	endif
	tier_level = ($<tier_global>.tier1.level)
	tier_name = ($levelzones.<tier_level>.name)
	formattext checksumname = final_checksum 'p%p_career_band%i_%d%s' i = (<band_count> + 1) p = <player> d = <difficulty_text_nl> s = <tier_name> addtostringlookup = true
	setglobaltags <final_checksum> params = {unlocked = 1}
	formattext checksumname = venue_checksum 'venue_%s' s = ($levelzones.<tier_level>.name)
	setglobaltags <venue_checksum> params = {unlocked = 1}
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
	if gotparam globaltag_checksum
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
	if gotparam globaltag_checksum
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
}
default_charactertags = {
	unlocked = 0
}

script setup_unlocks 
	getarraysize $secret_guitars
	array_count = 0
	begin
	if NOT getglobaltags ($secret_guitars [<array_count>].id) noassert = 1
		setglobaltags ($secret_guitars [<array_count>].id) params = {($default_guitartags) unlocked_for_purchase = 0}
	endif
	globaltag_checksum = (<globaltag_checksum> + ($secret_guitars [<array_count>].id))
	array_count = (<array_count> + 1)
	repeat <array_size>
	getarraysize $bonus_guitars
	array_count = 0
	begin
	if NOT getglobaltags ($bonus_guitars [<array_count>].id) noassert = 1
		setglobaltags ($bonus_guitars [<array_count>].id) params = {($default_guitartags) unlocked_for_purchase = 1}
	endif
	globaltag_checksum = (<globaltag_checksum> + ($bonus_guitars [<array_count>].id))
	array_count = (<array_count> + 1)
	repeat <array_size>
	getarraysize $bonus_guitar_finishes
	array_count = 0
	begin
	if NOT getglobaltags ($bonus_guitar_finishes [<array_count>].id) noassert = 1
		setglobaltags ($bonus_guitar_finishes [<array_count>].id) params = {($default_guitartags) unlocked_for_purchase = 1}
	endif
	globaltag_checksum = (<globaltag_checksum> + ($bonus_guitar_finishes [<array_count>].id))
	array_count = (<array_count> + 1)
	repeat <array_size>
	getarraysize $secret_basses
	array_count = 0
	begin
	if NOT getglobaltags ($secret_basses [<array_count>].id) noassert = 1
		setglobaltags ($secret_basses [<array_count>].id) params = {($default_guitartags) unlocked_for_purchase = 0}
	endif
	globaltag_checksum = (<globaltag_checksum> + ($secret_basses [<array_count>].id))
	array_count = (<array_count> + 1)
	repeat <array_size>
	getarraysize $secret_characters
	array_count = 0
	begin
	if NOT getglobaltags ($secret_characters [<array_count>].id) noassert = 1
		setglobaltags ($secret_characters [<array_count>].id) params = {($default_charactertags)}
	endif
	globaltag_checksum = (<globaltag_checksum> + ($secret_characters [<array_count>].id))
	array_count = (<array_count> + 1)
	repeat <array_size>
	getarraysize $bonus_outfits
	array_count = 0
	begin
	if NOT getglobaltags ($bonus_outfits [<array_count>].id) noassert = 1
		setglobaltags ($bonus_outfits [<array_count>].id) params = {unlocked = 0}
	endif
	globaltag_checksum = (<globaltag_checksum> + ($bonus_outfits [<array_count>].id))
	array_count = (<array_count> + 1)
	repeat <array_size>
	getarraysize $bonus_styles
	array_count = 0
	begin
	if NOT getglobaltags ($bonus_styles [<array_count>].id) noassert = 1
		setglobaltags ($bonus_styles [<array_count>].id) params = {unlocked = 0}
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

script setup_setlisttags globaltag_checksum = none
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
		formattext textname = song_checksum_suffix '%p_song%i_tier%s' p = <setlist_prefix> i = (<song_count> + 1) s = (<array_count> + 1)
		extendcrc out = song_checksum <song> <song_checksum_suffix>
		globaltag_checksum = (<globaltag_checksum> + <song_checksum>)
		formattext checksumname = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = (<song_count> + 1) s = (<array_count> + 1) addtostringlookup = true
		if NOT getglobaltags <song_checksum> noassert = 1
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
	boss_unlocked = 0
	num_songs_to_progress = 4
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
}

script setup_bandtags 
	band_count = 0
	begin
	getarraysize $difficulty_list
	array_count = 0
	begin
	get_difficulty_text_nl difficulty = ($difficulty_list [<array_count>])
	formattext checksumname = bandname 'p1_career_band%i_%d' i = (<band_count> + 1) d = <difficulty_text_nl> addtostringlookup = true
	push_bandtags bandname = <bandname> mode = p1_career
	formattext checksumname = bandname 'p2_career_band%i_%d' i = (<band_count> + 1) d = <difficulty_text_nl> addtostringlookup = true
	push_bandtags bandname = <bandname> mode = p2_career
	formattext checksumname = default_bandname 'band%i_info_p1_career' i = (<band_count> + 1) addtostringlookup = true
	setglobaltags <default_bandname> params = {($default_bandtags)}
	formattext checksumname = default_bandname 'band%i_info_p2_career' i = (<band_count> + 1) addtostringlookup = true
	setglobaltags <default_bandname> params = {($default_bandtags)}
	array_count = (<array_count> + 1)
	repeat <array_size>
	<band_count> = (<band_count> + 1)
	repeat ($num_career_bands)
	setglobaltags progression params = {current_band = 1
		current_difficulty = easy
		current_gamemode = p1_career}
endscript

script setup_user_option_tags 
	setglobaltags user_options params = {
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
		star_power_position_device_0 = 16.0
		star_power_position_device_1 = 16.0
		star_power_position_device_2 = 16.0
		star_power_position_device_3 = 16.0
		gamma_brightness = 5
		online_game_mode = 0
		online_difficulty = 0
		online_num_songs = 0
		online_tie_breaker = 0
		online_highway = 0
	}
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
			star_power_lesson = locked
			guitar_battle_lesson = locked
			advanced_techniques_lesson = locked
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
endscript

script push_bandtags mode = p1_career
	get_progression_globals game_mode = <mode>
	if (<mode> = p1_career)
		career_songs = <tier_global>
		num_players = 1
	elseif (<mode> = p2_career)
		career_songs = <tier_global>
		num_players = 2
	else
		printstruct <...>
		scriptassert "Invalid mode"
	endif
	num_tiers = ($<career_songs>.num_tiers)
	array_count = 0
	begin
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
	array_count = (<array_count> + 1)
	repeat <num_tiers>
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
endscript

script pop_bandtags 
	popglobaltags section = <bandname>
	if ($game_mode = p1_career)
		num_players = 1
	elseif ($game_mode = p2_career)
		num_players = 2
	endif
	player = 1
	begin
	formattext checksumname = player_status 'player%i_status' i = <player>
	formattext checksumname = player_character_params 'player%i_character_params' i = <player>
	getglobaltags <player_character_params>
	change structurename = <player_status> character_id = <character_id>
	change structurename = <player_status> instrument_id = <instrument_id>
	change structurename = <player_status> style = <style>
	change structurename = <player_status> outfit = <outfit>
	player = (<player> + 1)
	repeat <num_players>
endscript

script globaltags_unlockall songs_only = 0
	if NOT (<songs_only> = 1)
		array_count = 0
		getarraysize $bonus_guitars
		begin
		setglobaltags ($bonus_guitars [<array_count>].id) params = {unlocked = 1 unlocked_for_purchase = 1}
		array_count = (<array_count> + 1)
		repeat <array_size>
		array_count = 0
		getarraysize $bonus_guitar_finishes
		begin
		setglobaltags ($bonus_guitar_finishes [<array_count>].id) params = {unlocked = 1 unlocked_for_purchase = 1}
		array_count = (<array_count> + 1)
		repeat <array_size>
		array_count = 0
		getarraysize $secret_guitars
		begin
		setglobaltags ($secret_guitars [<array_count>].id) params = {unlocked = 1 unlocked_for_purchase = 1}
		array_count = (<array_count> + 1)
		repeat <array_size>
		array_count = 0
		getarraysize $secret_basses
		begin
		setglobaltags ($secret_basses [<array_count>].id) params = {unlocked = 1 unlocked_for_purchase = 1}
		array_count = (<array_count> + 1)
		repeat <array_size>
		array_count = 0
		getarraysize $secret_characters
		begin
		setglobaltags ($secret_characters [<array_count>].id) params = {unlocked = 1}
		array_count = (<array_count> + 1)
		repeat <array_size>
		array_count = 0
		getarraysize $bonus_outfits
		begin
		setglobaltags ($bonus_outfits [<array_count>].id) params = {unlocked = 1}
		array_count = (<array_count> + 1)
		repeat <array_size>
		array_count = 0
		getarraysize $bonus_styles
		begin
		setglobaltags ($bonus_styles [<array_count>].id) params = {unlocked = 1}
		array_count = (<array_count> + 1)
		repeat <array_size>
		array_count = 0
		getarraysize $bonus_videos
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
		encore_unlocked = 1
		boss_unlocked = 1
		num_songs_to_progress = 0}
	song_count = 0
	begin
	setlist_prefix = ($<songlist>.prefix)
	formattext checksumname = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = (<song_count> + 1) s = (<array_count> + 1) addtostringlookup = true
	setglobaltags <song_checksum> params = {stars = 5
		score = 1000000
		unlocked = 1}
	song_count = (<song_count> + 1)
	repeat <array_size>
	array_count = (<array_count> + 1)
	repeat ($<songlist>.num_tiers)
	setup_venuetags cheat
endscript
progression_pop_count = 0

script progression_push_current force = 0
	printscriptinfo "progression_push_current_callstack"
	if NOT ($progression_pop_count = 1)
		if (force = 0)
			scriptassert "progression_push_current with nothing popped"
		endif
		return
	endif
	getglobaltags progression params = current_band
	getglobaltags progression params = current_difficulty
	getglobaltags progression params = current_gamemode
	get_difficulty_text_nl difficulty = (<current_difficulty>)
	if (<current_gamemode> = p1_career)
		bandname_part1 = 'p1_career'
	elseif (<current_gamemode> = p2_career)
		bandname_part1 = 'p2_career'
	endif
	formattext checksumname = bandname '%s_band%i_%d' s = <bandname_part1> i = <current_band> d = <difficulty_text_nl>
	push_bandtags bandname = <bandname> mode = <current_gamemode>
	change progression_pop_count = ($progression_pop_count - 1)
endscript

script progression_pop_current force = 0
	printscriptinfo "progression_pop_current_callstack"
	if NOT ($progression_pop_count = 0)
		if (force = 0)
			scriptassert "progression_pop_current with something already popped"
		endif
		return
	endif
	if ($game_mode = p1_career)
		bandname_part1 = 'p1_career'
	elseif ($game_mode = p2_career)
		bandname_part1 = 'p2_career'
	else
		scriptassert "progression_pop_current not in career mode"
	endif
	progression_getdifficulty
	get_difficulty_text_nl difficulty = <difficulty>
	formattext checksumname = bandname '%s_band%i_%d' s = <bandname_part1> i = ($current_band) d = <difficulty_text_nl>
	pop_bandtags bandname = <bandname>
	setglobaltags progression params = {current_band = ($current_band)
		current_difficulty = <difficulty>
		current_gamemode = ($game_mode)}
	updateatoms
	change progression_pop_count = ($progression_pop_count + 1)
endscript

script get_minimum_difficulty difficulty1 = easy difficulty2 = easy
	if (<difficulty1> = <difficulty2>)
		return minimum_difficulty = <difficulty1>
	else
		switch <difficulty1>
			case easy
			return minimum_difficulty = easy
			case medium
			if (<difficulty2> = easy)
				return minimum_difficulty = easy
			else
				return minimum_difficulty = <difficulty2>
			endif
			case hard
			switch <difficulty2>
				case easy
				return minimum_difficulty = easy
				case medium
				return minimum_difficulty = hard
				case expert
				return minimum_difficulty = expert
			endswitch
			case expert
			switch <difficulty2>
				case easy
				return minimum_difficulty = easy
				case medium
				return minimum_difficulty = medium
				case hard
				return minimum_difficulty = hard
			endswitch
		endswitch
	endif
endscript
game_mode_names = {
	p1_career = 'p1_career'
	p2_career = 'p2_career'
	p1_quickplay = 'p1_quickplay'
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
	if ($game_mode = p2_career)
		formattext checksumname = bandname 'p2_career_band%i_%d' i = ($current_band) d = <difficulty_text_nl>
	else
		formattext checksumname = bandname 'p1_career_band%i_%d' i = ($current_band) d = <difficulty_text_nl>
	endif
	return band_checksum = <bandname>
endscript
