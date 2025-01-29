
script setup_globaltags 
	globaltag_checksum = 0xeeb9ac8a
	setup_songtags globaltag_checksum = <globaltag_checksum>
	setup_venuetags globaltag_checksum = <globaltag_checksum>
	setup_unlocks globaltag_checksum = <globaltag_checksum>
	get_progression_globals \{game_mode = p1_career}
	setup_setlisttags SetList_Songs = <tier_global> globaltag_checksum = <globaltag_checksum>
	get_progression_globals \{game_mode = p2_career}
	setup_setlisttags SetList_Songs = <tier_global> globaltag_checksum = <globaltag_checksum>
	get_progression_globals \{game_mode = p1_quickplay}
	setup_setlisttags SetList_Songs = <tier_global> globaltag_checksum = <globaltag_checksum>
	get_progression_globals \{game_mode = p2_faceoff}
	setup_setlisttags SetList_Songs = <tier_global> globaltag_checksum = <globaltag_checksum>
	get_progression_globals \{game_mode = p1_quickplay
		Bonus}
	setup_setlisttags SetList_Songs = <tier_global> globaltag_checksum = <globaltag_checksum>
	get_progression_globals \{game_mode = p1_quickplay
		Download}
	setup_setlisttags SetList_Songs = <tier_global> globaltag_checksum = <globaltag_checksum>
	setup_bandtags globaltag_checksum = <globaltag_checksum>
	setup_user_option_tags globaltag_checksum = <globaltag_checksum>
	setup_training_tags globaltag_checksum = <globaltag_checksum>
	setup_store_tags globaltag_checksum = <globaltag_checksum>
	setup_characterguitar_tags globaltag_checksum = <globaltag_checksum>
	setup_online_tags globaltag_checksum = <globaltag_checksum>
	setup_character_tags globaltag_checksum = <globaltag_checksum>
	setup_achievement_tags globaltag_checksum = <globaltag_checksum>
	SetGlobalTags globaltag_checksum Params = {globaltag_checksum = <globaltag_checksum>}
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
	name1 = "D. Stowater"
	name2 = "Ginkel"
	name3 = "Bunny"
	name4 = "BMarvs"
	name5 = "CVance"
	stars1 = 0
	stars2 = 0
	stars3 = 0
	stars4 = 0
	stars5 = 0
	bestscore = 0
	beststars = 0
	achievement_gold_star = 0
	failedtimes = 0
	percent100 = 0
}

script setup_character_tags 
	SetGlobalTags ($Secret_Characters [0].Id) Params = {unlocked_for_purchase = 0}
	globaltag_checksum = (<globaltag_checksum> + ($Secret_Characters [0].Id))
	SetGlobalTags ($Secret_Characters [1].Id) Params = {unlocked_for_purchase = 0}
	globaltag_checksum = (<globaltag_checksum> + ($Secret_Characters [1].Id))
	SetGlobalTags ($Secret_Characters [2].Id) Params = {unlocked_for_purchase = 0}
	globaltag_checksum = (<globaltag_checksum> + ($Secret_Characters [2].Id))
	return globaltag_checksum = <globaltag_checksum>
endscript
default_songtags = {
	available_on_other_client = 0
	beaten_coop_as_lead = 0
	beaten_coop_as_rhythm = 0
}

script setup_songtags 
	GetArraySize \{$difficulty_list}
	num_difficulty = <array_Size>
	array_count = 0
	begin
	get_difficulty_text_nl DIFFICULTY = ($difficulty_list [<array_count>])
	FormatText ChecksumName = default_topscores 'default_topscores_%d' D = <difficulty_text_nl>
	get_songlist_size
	song_array_size = <array_Size>
	song_count = 0
	begin
	get_songlist_checksum Index = <song_count>
	get_song_prefix Song = <song_checksum>
	FormatText ChecksumName = songname '%s_%d' S = (<song_prefix>) D = <difficulty_text_nl> AddToStringLookup = TRUE
	if GotParam \{globaltag_checksum}
		globaltag_checksum = (<globaltag_checksum> + <songname>)
	endif
	get_song_struct Song = <song_checksum>
	if (<song_struct>.version = gh3)
		if NOT GetGlobalTags <songname> noassert = 1
			get_song_title Song = <song_checksum>
			SetGlobalTags <songname> Params = {($default_songtagswithdifficulty) (<default_topscores>)}
		endif
		if NOT GetGlobalTags <song_checksum> noassert = 1
			SetGlobalTags <song_checksum> Params = {($default_songtags)}
		endif
	endif
	song_count = (<song_count> + 1)
	repeat <song_array_size>
	<array_count> = (<array_count> + 1)
	repeat <num_difficulty>
	song_count = 0
	GetArraySize ($GH3_Bonus_Songs.tier1.songs)
	begin
	unlocked = -1
	GetGlobalTags ($GH3_Bonus_Songs.tier1.songs [<song_count>])
	if (<unlocked> = -1)
		SetGlobalTags ($GH3_Bonus_Songs.tier1.songs [<song_count>]) Params = {unlocked = 0}
	endif
	song_count = (<song_count> + 1)
	repeat <array_Size>
	if GotParam \{globaltag_checksum}
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
	if GotParam \{cheat}
		venue_tags = $cheat_venuetags
	else
		venue_tags = $default_venuetags
	endif
	setup_generalvenuetags
	band_count = 0
	begin
	GetArraySize \{$LevelZoneArray}
	level_zone_array_size = <array_Size>
	Index = 0
	begin
	GetArraySize \{$difficulty_list}
	diff_array_size = <array_Size>
	diff_index = 0
	begin
	Player = 1
	begin
	get_difficulty_text_nl DIFFICULTY = ($difficulty_list [<diff_index>])
	get_LevelZoneArray_checksum Index = <Index>
	FormatText ChecksumName = final_checksum 'p%p_career_band%i_%d%s' I = (<band_count> + 1) P = <Player> D = <difficulty_text_nl> S = ($LevelZones.<level_checksum>.Name) AddToStringLookup = TRUE
	SetGlobalTags <final_checksum> Params = {(<venue_tags>)}
	if (<Player> = 1)
		get_progression_globals \{game_mode = p1_career}
	else
		get_progression_globals \{game_mode = p2_career}
	endif
	tier_level = ($<tier_global>.tier1.Level)
	tier_name = ($LevelZones.<tier_level>.Name)
	FormatText ChecksumName = final_checksum 'p%p_career_band%i_%d%s' I = (<band_count> + 1) P = <Player> D = <difficulty_text_nl> S = <tier_name> AddToStringLookup = TRUE
	SetGlobalTags <final_checksum> Params = {unlocked = 1}
	FormatText ChecksumName = venue_checksum 'venue_%s' S = ($LevelZones.<tier_level>.Name)
	SetGlobalTags <venue_checksum> Params = {unlocked = 1}
	if StructureContains Structure = ($<tier_global>.tier1) unlocked_levels
		GetArraySize ($<tier_global>.tier1.unlocked_levels)
		array_count = 0
		begin
		level_checksum = ($<tier_global>.tier1.unlocked_levels [<array_count>])
		FormatText ChecksumName = venue_checksum 'venue_%s' S = ($LevelZones.<level_checksum>.Name)
		SetGlobalTags <venue_checksum> Params = {unlocked = 1}
		array_count = (<array_count> + 1)
		repeat <array_Size>
	endif
	if GotParam \{globaltag_checksum}
		<globaltag_checksum> = (<globaltag_checksum> + <final_checksum>)
	endif
	<Player> = (<Player> + 1)
	repeat 2
	<diff_index> = (<diff_index> + 1)
	repeat <diff_array_size>
	<Index> = (<Index> + 1)
	repeat (<level_zone_array_size> - 1)
	<band_count> = (<band_count> + 1)
	repeat ($num_career_bands)
	if GotParam \{globaltag_checksum}
		return globaltag_checksum = <globaltag_checksum>
	endif
endscript

script setup_generalvenuetags 
	get_LevelZoneArray_size
	array_count = 0
	begin
	get_LevelZoneArray_checksum Index = <array_count>
	FormatText ChecksumName = venue_checksum 'venue_%s' S = ($LevelZones.<level_checksum>.Name) AddToStringLookup = TRUE
	if NOT GetGlobalTags <venue_checksum> noassert = 1
		SetGlobalTags <venue_checksum> Params = {($default_venuetags)}
	endif
	if Is_LevelZone_Downloaded level_checksum = <level_checksum>
		if (<Download> = 1)
			SetGlobalTags <venue_checksum> Params = {unlocked = 1}
		endif
	else
		SetGlobalTags <venue_checksum> Params = {unlocked = 0}
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
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
	GetArraySize \{$Secret_Guitars}
	array_count = 0
	begin
	if NOT GetGlobalTags ($Secret_Guitars [<array_count>].Id) noassert = 1
		SetGlobalTags ($Secret_Guitars [<array_count>].Id) Params = {($default_guitartags) unlocked_for_purchase = 0}
	endif
	globaltag_checksum = (<globaltag_checksum> + ($Secret_Guitars [<array_count>].Id))
	array_count = (<array_count> + 1)
	repeat <array_Size>
	GetArraySize \{$Bonus_Guitars}
	array_count = 0
	begin
	if NOT GetGlobalTags ($Bonus_Guitars [<array_count>].Id) noassert = 1
		SetGlobalTags ($Bonus_Guitars [<array_count>].Id) Params = {($default_guitartags) unlocked_for_purchase = 1}
	endif
	globaltag_checksum = (<globaltag_checksum> + ($Bonus_Guitars [<array_count>].Id))
	array_count = (<array_count> + 1)
	repeat <array_Size>
	GetArraySize \{$Bonus_Guitar_Finishes}
	array_count = 0
	begin
	if NOT GetGlobalTags ($Bonus_Guitar_Finishes [<array_count>].Id) noassert = 1
		SetGlobalTags ($Bonus_Guitar_Finishes [<array_count>].Id) Params = {($default_guitartags) unlocked_for_purchase = 1}
	endif
	globaltag_checksum = (<globaltag_checksum> + ($Bonus_Guitar_Finishes [<array_count>].Id))
	array_count = (<array_count> + 1)
	repeat <array_Size>
	GetArraySize \{$Secret_Basses}
	array_count = 0
	begin
	if NOT GetGlobalTags ($Secret_Basses [<array_count>].Id) noassert = 1
		SetGlobalTags ($Secret_Basses [<array_count>].Id) Params = {($default_guitartags) unlocked_for_purchase = 0}
	endif
	globaltag_checksum = (<globaltag_checksum> + ($Secret_Basses [<array_count>].Id))
	array_count = (<array_count> + 1)
	repeat <array_Size>
	GetArraySize \{$Bonus_Basses}
	array_count = 0
	begin
	if NOT GetGlobalTags ($Bonus_Basses [<array_count>].Id) noassert = 1
		SetGlobalTags ($Bonus_Basses [<array_count>].Id) Params = {($default_guitartags) unlocked_for_purchase = 1}
	endif
	globaltag_checksum = (<globaltag_checksum> + ($Bonus_Basses [<array_count>].Id))
	array_count = (<array_count> + 1)
	repeat <array_Size>
	GetArraySize \{$Bonus_Bass_Finishes}
	array_count = 0
	begin
	if NOT GetGlobalTags ($Bonus_Bass_Finishes [<array_count>].Id) noassert = 1
		SetGlobalTags ($Bonus_Bass_Finishes [<array_count>].Id) Params = {($default_guitartags) unlocked_for_purchase = 1}
	endif
	globaltag_checksum = (<globaltag_checksum> + ($Bonus_Bass_Finishes [<array_count>].Id))
	array_count = (<array_count> + 1)
	repeat <array_Size>
	GetArraySize \{$Secret_Characters}
	array_count = 0
	begin
	if NOT GetGlobalTags ($Secret_Characters [<array_count>].Id) noassert = 1
		SetGlobalTags ($Secret_Characters [<array_count>].Id) Params = {($default_charactertags)}
	endif
	globaltag_checksum = (<globaltag_checksum> + ($Secret_Characters [<array_count>].Id))
	array_count = (<array_count> + 1)
	repeat <array_Size>
	GetArraySize \{$Bonus_Outfits}
	array_count = 0
	begin
	if NOT GetGlobalTags ($Bonus_Outfits [<array_count>].Id) noassert = 1
		SetGlobalTags ($Bonus_Outfits [<array_count>].Id) Params = {unlocked = 0}
	endif
	globaltag_checksum = (<globaltag_checksum> + ($Bonus_Outfits [<array_count>].Id))
	array_count = (<array_count> + 1)
	repeat <array_Size>
	GetArraySize \{$Bonus_Styles}
	array_count = 0
	begin
	if NOT GetGlobalTags ($Bonus_Styles [<array_count>].Id) noassert = 1
		Mod A = <array_count> B = 6
		if (<Mod> = 0)
			SetGlobalTags ($Bonus_Styles [<array_count>].Id) Params = {unlocked = 1}
		else
			SetGlobalTags ($Bonus_Styles [<array_count>].Id) Params = {unlocked = 0}
		endif
	endif
	globaltag_checksum = (<globaltag_checksum> + ($Bonus_Styles [<array_count>].Id))
	array_count = (<array_count> + 1)
	repeat <array_Size>
	return globaltag_checksum = <globaltag_checksum>
endscript
default_songsetlisttags = {
	STARS = 0
	Score = 0
	percent100 = 0
	unlocked = 0
}

script setup_setlisttags \{globaltag_checksum = NONE
		Force = 0}
	setup_tiertags SetList_Songs = <SetList_Songs>
	array_count = 0
	begin
	FormatText ChecksumName = Tier 'tier%s' S = (<array_count> + 1)
	GetArraySize ($<SetList_Songs>.<Tier>.songs)
	if (<array_Size> > 0)
		song_count = 0
		begin
		Song = ($<SetList_Songs>.<Tier>.songs [<song_count>])
		setlist_prefix = ($<SetList_Songs>.prefix)
		SetGlobalTags <Song> Params = {unlocked = 0}
		FormatText TextName = song_checksum_suffix '%p_song%i_tier%s' P = <setlist_prefix> I = (<song_count> + 1) S = (<array_count> + 1)
		ExtendCRC out = song_checksum <Song> <song_checksum_suffix>
		globaltag_checksum = (<globaltag_checksum> + <song_checksum>)
		FormatText ChecksumName = song_checksum '%p_song%i_tier%s' P = <setlist_prefix> I = (<song_count> + 1) S = (<array_count> + 1) AddToStringLookup = TRUE
		if NOT GetGlobalTags <song_checksum> noassert = 1
			SetGlobalTags <song_checksum> Params = {($default_songsetlisttags)}
		elseif (<Force> = 1)
			SetGlobalTags <song_checksum> Params = {($default_songsetlisttags)}
		endif
		if StructureContains Structure = ($<SetList_Songs>.<Tier>) defaultunlocked
			if (<song_count> < $<SetList_Songs>.<Tier>.defaultunlocked)
				SetGlobalTags <song_checksum> Params = {unlocked = 1}
			endif
		elseif StructureContains Structure = ($<SetList_Songs>.<Tier>) unlockall
			Song = ($<SetList_Songs>.<Tier>.songs [<song_count>])
			if is_song_downloaded song_checksum = <Song>
				SetGlobalTags <song_checksum> Params = {unlocked = 1}
			else
				SetGlobalTags <song_checksum> Params = {unlocked = 0}
			endif
		endif
		song_count = (<song_count> + 1)
		repeat <array_Size>
	endif
	array_count = (<array_count> + 1)
	repeat ($<SetList_Songs>.num_tiers)
	return globaltag_checksum = <globaltag_checksum>
endscript
default_tiertags = {
	unlocked = 0
	Complete = 0
	encore_unlocked = 0
	boss_unlocked = 0
	num_songs_to_progress = 4
}

script setup_tiertags 
	num_tiers = ($<SetList_Songs>.num_tiers)
	array_count = 0
	begin
	setlist_prefix = ($<SetList_Songs>.prefix)
	FormatText ChecksumName = Tier 'tier%s' S = (<array_count> + 1)
	FormatText ChecksumName = tiername '%ptier%i' P = <setlist_prefix> I = (<array_count> + 1) AddToStringLookup = TRUE
	if NOT GetGlobalTags <tiername> noassert = 1
		SetGlobalTags <tiername> Params = {($default_tiertags)}
	endif
	if StructureContains Structure = ($<SetList_Songs>.<Tier>) defaultunlocked
		SetGlobalTags <tiername> Params = {unlocked = 1}
	endif
	if StructureContains Structure = ($<SetList_Songs>.<Tier>) unlockall
		SetGlobalTags <tiername> Params = {unlocked = 1}
	endif
	array_count = (<array_count> + 1)
	repeat <num_tiers>
endscript
default_bandtags = {
	Cash = 0
	Name = ""
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
	GetArraySize \{$difficulty_list}
	array_count = 0
	begin
	get_difficulty_text_nl DIFFICULTY = ($difficulty_list [<array_count>])
	FormatText ChecksumName = bandname 'p1_career_band%i_%d' I = (<band_count> + 1) D = <difficulty_text_nl> AddToStringLookup = TRUE
	push_bandtags bandname = <bandname> mode = p1_career
	FormatText ChecksumName = bandname 'p2_career_band%i_%d' I = (<band_count> + 1) D = <difficulty_text_nl> AddToStringLookup = TRUE
	push_bandtags bandname = <bandname> mode = p2_career
	FormatText ChecksumName = default_bandname 'band%i_info_p1_career' I = (<band_count> + 1) AddToStringLookup = TRUE
	SetGlobalTags <default_bandname> Params = {($default_bandtags)}
	FormatText ChecksumName = default_bandname 'band%i_info_p2_career' I = (<band_count> + 1) AddToStringLookup = TRUE
	SetGlobalTags <default_bandname> Params = {($default_bandtags)}
	array_count = (<array_count> + 1)
	repeat <array_Size>
	<band_count> = (<band_count> + 1)
	repeat ($num_career_bands + 1)
	GetArraySize \{$difficulty_list}
	array_count = 0
	begin
	get_difficulty_text_nl DIFFICULTY = ($difficulty_list [<array_count>])
	get_progression_globals \{game_mode = p1_career}
	setlist_prefix = ($<tier_global>.prefix)
	FormatText ChecksumName = gametype_checksum '%p_%s' P = <setlist_prefix> S = <difficulty_text_nl> AddToStringLookup = TRUE
	SetGlobalTags <gametype_checksum> Params = {Complete = 0}
	get_progression_globals \{game_mode = p2_career}
	setlist_prefix = ($<tier_global>.prefix)
	FormatText ChecksumName = gametype_checksum '%p_%s' P = <setlist_prefix> S = <difficulty_text_nl> AddToStringLookup = TRUE
	SetGlobalTags <gametype_checksum> Params = {Complete = 0}
	array_count = (<array_count> + 1)
	repeat <array_Size>
	SetGlobalTags \{Progression
		Params = {
			current_band = 1
			current_difficulty = EASY
			current_gamemode = p1_career
		}}
endscript

script setup_user_option_tags 
	SetGlobalTags \{user_options
		Params = {
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
			online_difficulty = 0
			online_num_songs = 0
			online_tie_breaker = 0
			online_highway = 0
			unlock_Cheat_AirGuitar = 0
			unlock_Cheat_PerformanceMode = 0
			unlock_Cheat_Hyperspeed = 0
			unlock_Cheat_NoFail = 0
			unlock_Cheat_EasyExpert = 0
			unlock_Cheat_PrecisionMode = 0
			unlock_Cheat_BretMichaels = 0
		}}
endscript

script setup_online_tags 
	SetGlobalTags \{net
		Params = {
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
	GetGlobalTags \{user_options}
	if (<lefty_flip_p1>)
		Change \{pad_event_up_inversion = TRUE}
	else
		Change \{pad_event_up_inversion = FALSE}
	endif
endscript

script setup_training_tags 
	SetGlobalTags \{training
		Params = {
			basic_lesson = not_complete
			star_power_lesson = not_complete
			guitar_battle_lesson = not_complete
			advanced_techniques_lesson = not_complete
		}}
endscript

script setup_store_tags 
	GetArraySize ($Bonus_Videos)
	Index = 0
	begin
	video_checksum = ($Bonus_Videos [<Index>].Id)
	SetGlobalTags <video_checksum> Params = {unlocked = 0}
	<Index> = (<Index> + 1)
	repeat <array_Size>
	I = 6
	GetArraySize ($bv_text_array)
	begin
	video_checksum = ($bv_text_array [<I>].Id)
	SetGlobalTags <video_checksum> Params = {unlocked = 0}
	<I> = (<I> + 1)
	repeat (<array_Size> - 6)
endscript
default_characterguitartags = {
	current_selected_guitar = Instrument_Les_Paul_Black
	current_selected_bass = Instrument_LP_VBRST
	current_instrument = GUITAR
	current_outfit = 1
	current_style = 1
}

script setup_characterguitar_tags 
	get_musician_profile_size
	<musician_profile_index> = 0
	begin
	<Player> = 1
	begin
	get_musician_profile_struct Index = <musician_profile_index>
	FormatText ChecksumName = default_characterguitartag 'character_%c_player_%p_guitar_tags' C = (<profile_struct>.Name) P = <Player> AddToStringLookup = TRUE
	if NOT GetGlobalTags <default_characterguitartag> noassert = 1
		SetGlobalTags <default_characterguitartag> Params = {($default_characterguitartags)}
		if StructureContains Structure = <profile_struct> Name = musician_instrument
			<inst_id> = (<profile_struct>.musician_instrument.desc_id)
			SetGlobalTags <default_characterguitartag> Params = {current_selected_guitar = <inst_id>}
		endif
	else
		valid = 0
		if find_instrument_index desc_id = <current_selected_guitar>
			if is_musician_instrument_downloaded Index = <Index>
				valid = 1
			endif
		endif
		if (<valid> = 0)
			Printf \{"Invalid Instrument found in setup_characterguitar_tags - changing to les paul black"}
			SetGlobalTags <default_characterguitartag> Params = {current_selected_guitar = Instrument_Les_Paul_Black}
		endif
		valid = 0
		if find_instrument_index desc_id = <current_selected_bass>
			if is_musician_instrument_downloaded Index = <Index>
				valid = 1
			endif
		endif
		if (<valid> = 0)
			Printf \{"Invalid Bass Instrument found in setup_characterguitar_tags - changing to lp vbrst"}
			SetGlobalTags <default_characterguitartag> Params = {current_selected_bass = Instrument_LP_VBRST}
		endif
	endif
	<Player> = (<Player> + 1)
	repeat 2
	<musician_profile_index> = (<musician_profile_index> + 1)
	repeat <array_Size>
endscript

script push_bandtags \{mode = p1_career}
	get_progression_globals game_mode = <mode>
	if (<mode> = p1_career)
		Career_Songs = <tier_global>
		num_players = 1
	elseif (<mode> = p2_career)
		Career_Songs = <tier_global>
		num_players = 2
	else
		PrintStruct <...>
		ScriptAssert \{"Invalid mode"}
	endif
	I = 0
	begin
	num_tiers = ($<Career_Songs>.num_tiers)
	array_count = 0
	begin
	FormatText ChecksumName = Tier 'tier%d' D = (<array_count> + 1)
	GetArraySize ($<Career_Songs>.<Tier>.songs)
	if NOT (<array_Size> = 0)
		setlist_prefix = ($<Career_Songs>.prefix)
		FormatText ChecksumName = tiername '%ptier%i' P = <setlist_prefix> I = (<array_count> + 1)
		FormatText ChecksumName = tier_checksum 'tier%s' S = (<array_count> + 1)
		PushGlobalTags <tiername> section = <bandname>
		GetArraySize ($<Career_Songs>.<tier_checksum>.songs)
		song_count = 0
		begin
		setlist_prefix = ($<Career_Songs>.prefix)
		FormatText ChecksumName = song_checksum '%p_song%i_tier%s' P = <setlist_prefix> I = (<song_count> + 1) S = (<array_count> + 1) AddToStringLookup = TRUE
		PushGlobalTags <song_checksum> section = <bandname>
		song_count = (<song_count> + 1)
		repeat <array_Size>
	endif
	array_count = (<array_count> + 1)
	repeat <num_tiers>
	<I> = (<I> + 1)
	if (<I> = 1)
		get_progression_globals game_mode = <mode> Bonus
	elseif (<I> = 2)
		get_progression_globals game_mode = <mode> Download
	endif
	Career_Songs = <tier_global>
	repeat 3
	Player = 1
	begin
	FormatText ChecksumName = player_status 'player%i_status' I = <Player>
	FormatText ChecksumName = player_character_params 'player%i_character_params' I = <Player> AddToStringLookup = TRUE
	SetGlobalTags <player_character_params> Params = {character_id = ($<player_status>.character_id)
		instrument_id = ($<player_status>.instrument_id)
		style = ($<player_status>.style)
		outfit = ($<player_status>.outfit)}
	PushGlobalTags <player_character_params> section = <bandname>
	Player = (<Player> + 1)
	repeat <num_players>
	PushGlobalTags <player_character_params> section = <bandname>
endscript

script pop_bandtags 
	setup_setlisttags \{SetList_Songs = GH3_Download_Songs
		Force = 1}
	PopGlobalTags section = <bandname>
	<num_players> = 1
	if ($game_mode = p2_career)
		<num_players> = 2
	endif
	Player = 1
	begin
	FormatText ChecksumName = player_status 'player%i_status' I = <Player>
	FormatText ChecksumName = player_character_params 'player%i_character_params' I = <Player>
	GetGlobalTags <player_character_params>
	Change StructureName = <player_status> character_id = <character_id>
	Change StructureName = <player_status> instrument_id = <instrument_id>
	Change StructureName = <player_status> style = <style>
	Change StructureName = <player_status> outfit = <outfit>
	valid = 0
	if find_profile_by_id Id = ($<player_status>.character_id)
		if is_musician_profile_downloaded Index = <Index>
			valid = 1
		endif
	endif
	if (<valid> = 0)
		Printf \{"Invalid Character found - changing to axel"}
		Change StructureName = <player_status> character_id = Axel
		Change StructureName = <player_status> style = 1
		Change StructureName = <player_status> outfit = 1
	endif
	valid = 0
	if find_instrument_index desc_id = ($<player_status>.instrument_id)
		if is_musician_instrument_downloaded Index = <Index>
			valid = 1
		endif
	endif
	if (<valid> = 0)
		Printf \{"Invalid Instrument found - changing to les paul black"}
		Change StructureName = <player_status> instrument_id = Instrument_Les_Paul_Black
	endif
	Player = (<Player> + 1)
	repeat <num_players>
endscript

script GlobalTags_UnlockAll \{songs_only = 0}
	if NOT (<songs_only> = 1)
		array_count = 0
		GetArraySize \{$Bonus_Guitars}
		begin
		SetGlobalTags ($Bonus_Guitars [<array_count>].Id) Params = {unlocked = 1 unlocked_for_purchase = 1}
		array_count = (<array_count> + 1)
		repeat <array_Size>
		array_count = 0
		GetArraySize \{$Bonus_Guitar_Finishes}
		begin
		SetGlobalTags ($Bonus_Guitar_Finishes [<array_count>].Id) Params = {unlocked = 1 unlocked_for_purchase = 1}
		array_count = (<array_count> + 1)
		repeat <array_Size>
		array_count = 0
		GetArraySize \{$Secret_Guitars}
		begin
		SetGlobalTags ($Secret_Guitars [<array_count>].Id) Params = {unlocked = 1 unlocked_for_purchase = 1}
		array_count = (<array_count> + 1)
		repeat <array_Size>
		array_count = 0
		GetArraySize \{$Bonus_Basses}
		begin
		SetGlobalTags ($Bonus_Basses [<array_count>].Id) Params = {unlocked = 1 unlocked_for_purchase = 1}
		array_count = (<array_count> + 1)
		repeat <array_Size>
		array_count = 0
		GetArraySize \{$Bonus_Bass_Finishes}
		begin
		SetGlobalTags ($Bonus_Bass_Finishes [<array_count>].Id) Params = {unlocked = 1 unlocked_for_purchase = 1}
		array_count = (<array_count> + 1)
		repeat <array_Size>
		array_count = 0
		GetArraySize \{$Secret_Basses}
		begin
		SetGlobalTags ($Secret_Basses [<array_count>].Id) Params = {unlocked = 1 unlocked_for_purchase = 1}
		array_count = (<array_count> + 1)
		repeat <array_Size>
		array_count = 0
		GetArraySize \{$Secret_Characters}
		begin
		SetGlobalTags ($Secret_Characters [<array_count>].Id) Params = {unlocked = 1}
		array_count = (<array_count> + 1)
		repeat <array_Size>
		array_count = 0
		GetArraySize \{$Bonus_Outfits}
		begin
		SetGlobalTags ($Bonus_Outfits [<array_count>].Id) Params = {unlocked = 1}
		array_count = (<array_count> + 1)
		repeat <array_Size>
		array_count = 0
		GetArraySize \{$Bonus_Styles}
		begin
		SetGlobalTags ($Bonus_Styles [<array_count>].Id) Params = {unlocked = 1}
		array_count = (<array_count> + 1)
		repeat <array_Size>
		array_count = 0
		GetArraySize \{$Bonus_Videos}
		begin
		SetGlobalTags ($Bonus_Videos [<array_count>].Id) Params = {unlocked = 1}
		array_count = (<array_count> + 1)
		repeat <array_Size>
	endif
	array_count = 0
	begin
	setlist_prefix = ($<SongList>.prefix)
	FormatText ChecksumName = tiername '%ptier%i' P = <setlist_prefix> I = (<array_count> + 1)
	FormatText ChecksumName = tier_checksum 'tier%s' S = (<array_count> + 1)
	GetArraySize ($<SongList>.<tier_checksum>.songs)
	SetGlobalTags <tiername> Params = {unlocked = 1
		Complete = 1
		encore_unlocked = 1
		boss_unlocked = 1
		num_songs_to_progress = 0}
	song_count = 0
	begin
	setlist_prefix = ($<SongList>.prefix)
	FormatText ChecksumName = song_checksum '%p_song%i_tier%s' P = <setlist_prefix> I = (<song_count> + 1) S = (<array_count> + 1) AddToStringLookup = TRUE
	if (<songs_only> = 1)
		SetGlobalTags <song_checksum> Params = {unlocked = 1}
	else
		SetGlobalTags <song_checksum> Params = {STARS = 5
			Score = 1000000
			unlocked = 1}
		get_difficulty_text_nl DIFFICULTY = ($current_difficulty)
		get_song_prefix Song = ($<SongList>.<tier_checksum>.songs [<song_count>])
		FormatText ChecksumName = songname '%s_%d' S = <song_prefix> D = <difficulty_text_nl>
		SetGlobalTags <songname> Params = {achievement_gold_star = 1}
	endif
	song_count = (<song_count> + 1)
	repeat <array_Size>
	array_count = (<array_count> + 1)
	repeat ($<SongList>.num_tiers)
	setup_venuetags \{cheat}
endscript
progression_pop_count = 0

script progression_push_current \{Force = 0}
	PrintScriptInfo \{"progression_push_current_callstack"}
	if NOT ($progression_pop_count = 1)
		if (<Force> = 0)
			ScriptAssert \{"progression_push_current with nothing popped"}
		endif
		return
	endif
	GetGlobalTags \{Progression
		Params = current_band}
	GetGlobalTags \{Progression
		Params = current_difficulty}
	GetGlobalTags \{Progression
		Params = current_gamemode}
	get_difficulty_text_nl DIFFICULTY = (<current_difficulty>)
	if GotParam \{force_gamemode}
		<current_gamemode> = <force_gamemode>
	endif
	if (<current_gamemode> = p1_career)
		bandname_part1 = 'p1_career'
	elseif (<current_gamemode> = p2_career)
		bandname_part1 = 'p2_career'
	endif
	FormatText ChecksumName = bandname '%s_band%i_%d' S = <bandname_part1> I = <current_band> D = <difficulty_text_nl>
	push_bandtags bandname = <bandname> mode = <current_gamemode>
	Change progression_pop_count = ($progression_pop_count - 1)
endscript

script progression_pop_current \{Force = 0
		UpdateAtoms = 1}
	PrintScriptInfo \{"progression_pop_current_callstack"}
	if NOT ($progression_pop_count = 0)
		if (<Force> = 0)
			ScriptAssert \{"progression_pop_current with something already popped"}
		endif
		return
	endif
	current_gamemode = ($game_mode)
	if GotParam \{force_gamemode}
		<current_gamemode> = <force_gamemode>
	endif
	if (<current_gamemode> = p1_career)
		bandname_part1 = 'p1_career'
	elseif (<current_gamemode> = p2_career)
		bandname_part1 = 'p2_career'
	else
		ScriptAssert \{"progression_pop_current not in career mode"}
	endif
	Progression_GetDifficulty
	get_difficulty_text_nl DIFFICULTY = <DIFFICULTY>
	FormatText ChecksumName = bandname '%s_band%i_%d' S = <bandname_part1> I = ($current_band) D = <difficulty_text_nl>
	pop_bandtags bandname = <bandname>
	SetGlobalTags Progression Params = {current_band = ($current_band)
		current_difficulty = <DIFFICULTY>
		current_gamemode = <current_gamemode>}
	Change progression_pop_count = ($progression_pop_count + 1)
endscript

script get_minimum_difficulty \{difficulty1 = EASY
		difficulty2 = EASY}
	if (<difficulty1> = <difficulty2>)
		return minimum_difficulty = <difficulty1>
	else
		switch <difficulty1>
			case EASY
			return \{minimum_difficulty = EASY}
			case MEDIUM
			if (<difficulty2> = EASY)
				return \{minimum_difficulty = EASY}
			else
				return \{minimum_difficulty = MEDIUM}
			endif
			case HARD
			switch <difficulty2>
				case EASY
				return \{minimum_difficulty = EASY}
				case MEDIUM
				return \{minimum_difficulty = MEDIUM}
				case EXPERT
				return \{minimum_difficulty = HARD}
			endswitch
			case EXPERT
			switch <difficulty2>
				case EASY
				return \{minimum_difficulty = EASY}
				case MEDIUM
				return \{minimum_difficulty = MEDIUM}
				case HARD
				return \{minimum_difficulty = HARD}
			endswitch
		endswitch
	endif
endscript

script get_game_mode_ui_string 
	if NOT GotParam \{game_mode}
		SoftAssert \{"Did not get game_mode!"}
		return
	endif
	return ui_string = ($game_mode_ui_strings.<game_mode>)
endscript
game_mode_ui_strings = {
	p1_career = "Career"
	p2_career = "Career"
	p1_quickplay = "Quick Play"
	p2_faceoff = "Face Off"
	p2_pro_faceoff = "Pro Faceoff"
	p2_battle = "Battle"
	p2_coop = "Co-op"
}

script get_difficulty_ui_string 
	if NOT GotParam \{DIFFICULTY}
		SoftAssert \{"Did not get difficulty!"}
		return
	endif
	return ui_string = ($game_difficulty_ui_strings.<DIFFICULTY>)
endscript
game_difficulty_ui_strings = {
	EASY = "Easy"
	MEDIUM = "Medium"
	HARD = "Hard"
	EXPERT = "Expert"
}
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
	FormatText ChecksumName = bandname 'band%i_info_p1_career' I = ($current_band)
	return band_info = <bandname>
endscript

script get_current_band_checksum 
	get_difficulty_text_nl DIFFICULTY = ($current_difficulty)
	if ($game_mode = p2_career)
		FormatText ChecksumName = bandname 'p2_career_band%i_%d' I = ($current_band) D = <difficulty_text_nl>
	else
		FormatText ChecksumName = bandname 'p1_career_band%i_%d' I = ($current_band) D = <difficulty_text_nl>
	endif
	return band_checksum = <bandname>
endscript

script setup_achievement_tags 
	SetGlobalTags \{achievement_info
		Params = {
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

script set_online_match_info \{Ranked = 0
		won = 0
		HOST = 0
		standard_controller = 0}
	GetGlobalTags \{achievement_info}
	Printf \{"set_online_match_info"}
	if (<Ranked> = 0)
		<player_matches> = (<player_matches_played> + 1)
		SetGlobalTags achievement_info Params = {player_matches_played = <player_matches>}
		if (<won> = 1)
			<matches_won> = (<player_matches_won> + 1)
			SetGlobalTags achievement_info Params = {player_matches_won = <matches_won>}
			if (<HOST> = 1)
				<host_won> = (<player_matches_won_as_host> + 1)
				SetGlobalTags achievement_info Params = {player_matches_won_as_host = <host_won>}
			else
				<client_won> = (<player_matches_won_as_client> + 1)
				SetGlobalTags achievement_info Params = {player_matches_won_as_client = <client_won>}
			endif
		endif
	else
		<player_matches> = (<ranked_matches_played> + 1)
		SetGlobalTags achievement_info Params = {ranked_matches_played = <player_matches>}
		if (<won> = 1)
			<matches_won> = (<ranked_matches_won> + 1)
			SetGlobalTags achievement_info Params = {ranked_matches_won = <matches_won>}
			if (<HOST> = 1)
				<host_won> = (<ranked_matches_won_as_host> + 1)
				SetGlobalTags achievement_info Params = {ranked_matches_won_as_host = <host_won>}
				<consec_won> = (<ranked_consecutive_won_as_host> + 1)
				SetGlobalTags achievement_info Params = {ranked_consecutive_won_as_host = <consec_won>}
			else
				<client_won> = (<ranked_matches_won_as_client> + 1)
				SetGlobalTags achievement_info Params = {ranked_matches_won_as_client = <client_won>}
				<consec_won> = (<ranked_consecutive_won_as_client> + 1)
				SetGlobalTags achievement_info Params = {ranked_consecutive_won_as_client = <consec_won>}
			endif
			if (<standard_controller> = 1)
				<controller_won> = (<ranked_matches_won_with_standard_controller> + 1)
				SetGlobalTags achievement_info Params = {ranked_matches_won_with_standard_controller = <controller_won>}
			endif
		else
			if (<HOST> = 1)
				SetGlobalTags \{achievement_info
					Params = {
						ranked_consecutive_won_as_host = 0
					}}
			else
				SetGlobalTags \{achievement_info
					Params = {
						ranked_consecutive_won_as_client = 0
					}}
			endif
		endif
	endif
	GetGlobalTags \{achievement_info}
	PrintStruct <...>
endscript
