
script setup_globaltags 
	globaltag_checksum = initial_v175
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
		download}
	setup_setlisttags SetList_Songs = <tier_global> globaltag_checksum = <globaltag_checksum>
	setup_bandtags globaltag_checksum = <globaltag_checksum>
	setup_user_option_tags globaltag_checksum = <globaltag_checksum>
	setup_training_tags globaltag_checksum = <globaltag_checksum>
	setup_store_tags globaltag_checksum = <globaltag_checksum>
	setup_characterguitar_tags globaltag_checksum = <globaltag_checksum>
	setup_online_tags globaltag_checksum = <globaltag_checksum>
	setup_character_tags globaltag_checksum = <globaltag_checksum>
	setup_arcade_audit_tags globaltag_checksum = <globaltag_checksum>
	setup_arcade_adjustments_tags globaltag_checksum = <globaltag_checksum>
	setup_arcade_hardware_tags globaltag_checksum = <globaltag_checksum>
	setup_arcade_crc_tags globaltag_checksum = <globaltag_checksum>
	setup_achievement_tags globaltag_checksum = <globaltag_checksum>
	SetGlobalTags globaltag_checksum params = {globaltag_checksum = <globaltag_checksum>}
endscript
default_topscores_beginner = {
	score1 = 1200
	score2 = 1183
	score3 = 1161
	score4 = 1144
	score5 = 1127
	score6 = 1099
	score7 = 1078
	score8 = 1054
	score9 = 1032
	score10 = 1019
}
default_topscores_easy = {
	score1 = 3390
	score2 = 3228
	score3 = 3063
	score4 = 2842
	score5 = 2612
	score6 = 2398
	score7 = 2114
	score8 = 1972
	score9 = 1653
	score10 = 1325
}
default_topscores_medium = {
	score1 = 11137
	score2 = 10254
	score3 = 9753
	score4 = 8129
	score5 = 7485
	score6 = 7235
	score7 = 6791
	score8 = 6329
	score9 = 5821
	score10 = 5596
}
default_topscores_hard = {
	score1 = 34046
	score2 = 32659
	score3 = 31273
	score4 = 29787
	score5 = 25521
	score6 = 21256
	score7 = 19637
	score8 = 18002
	score9 = 12508
	score10 = 7015
}
default_topscores_expert = {
	score1 = 44289
	score2 = 43531
	score3 = 42773
	score4 = 41986
	score5 = 38704
	score6 = 35423
	score7 = 33518
	score8 = 31425
	score9 = 20213
	score10 = 9001
}
default_songtagswithdifficulty_beginner = {
	name1 = "MOHKERZ"
	name2 = "WALLACE"
	name3 = "RAMONA"
	name4 = "JOHN"
	name5 = "STEPHEN"
	name6 = "JULIE"
	name7 = "PAUL"
	name8 = "STACEY"
	name9 = "GEORGE"
	name10 = "RINGO"
	stars1 = 0
	stars2 = 0
	stars3 = 0
	stars4 = 0
	stars5 = 0
	stars6 = 0
	stars7 = 0
	stars8 = 0
	stars9 = 0
	stars10 = 0
	bestscore = 0
	beststars = 0
	achievement_gold_star = 0
	failedtimes = 0
}
default_songtagswithdifficulty_easy = {
	name1 = "MOHKERZ"
	name2 = "ERIK"
	name3 = "JOSH"
	name4 = "NATE"
	name5 = "BOB"
	name6 = "AASIM"
	name7 = "MATT"
	name8 = "SCOTT"
	name9 = "ERIC"
	name10 = "GAIL"
	stars1 = 0
	stars2 = 0
	stars3 = 0
	stars4 = 0
	stars5 = 0
	stars6 = 0
	stars7 = 0
	stars8 = 0
	stars9 = 0
	stars10 = 0
	bestscore = 0
	beststars = 0
	achievement_gold_star = 0
	failedtimes = 0
}
default_songtagswithdifficulty_medium = {
	name1 = "MOHKERZ"
	name2 = "CHRIS"
	name3 = "MATT"
	name4 = "JASON"
	name5 = "JOEL"
	name6 = "MARK"
	name7 = "KIM"
	name8 = "JEFF"
	name9 = "RAY"
	name10 = "ANDY"
	stars1 = 0
	stars2 = 0
	stars3 = 0
	stars4 = 0
	stars5 = 0
	stars6 = 0
	stars7 = 0
	stars8 = 0
	stars9 = 0
	stars10 = 0
	bestscore = 0
	beststars = 0
	achievement_gold_star = 0
	failedtimes = 0
}
default_songtagswithdifficulty_hard = {
	name1 = "MOHKERZ"
	name2 = "PAT"
	name3 = "JUSTIN"
	name4 = "TIM"
	name5 = "BRUCE"
	name6 = "BILLOCK"
	name7 = "SERGII"
	name8 = "KEVIN"
	name9 = "BILL"
	name10 = "MATTC"
	stars1 = 0
	stars2 = 0
	stars3 = 0
	stars4 = 0
	stars5 = 0
	stars6 = 0
	stars7 = 0
	stars8 = 0
	stars9 = 0
	stars10 = 0
	bestscore = 0
	beststars = 0
	achievement_gold_star = 0
	failedtimes = 0
}
default_songtagswithdifficulty_expert = {
	name1 = "MOHKERZ"
	name2 = "CRACKED"
	name3 = "THIS"
	name4 = "ONCE"
	name5 = "AGAIN"
	name6 = "HAVE"
	name7 = "FUN"
	name8 = "FELLOWS"
	name9 = "THATSALL"
	name10 = "FOLKS"
	stars1 = 0
	stars2 = 0
	stars3 = 0
	stars4 = 0
	stars5 = 0
	stars6 = 0
	stars7 = 0
	stars8 = 0
	stars9 = 0
	stars10 = 0
	bestscore = 0
	beststars = 0
	achievement_gold_star = 0
	failedtimes = 0
}

script setup_character_tags 
	SetGlobalTags ($Secret_Characters [0].id) params = {unlocked_for_purchase = 0}
	globaltag_checksum = (<globaltag_checksum> + ($Secret_Characters [0].id))
	SetGlobalTags ($Secret_Characters [1].id) params = {unlocked_for_purchase = 0}
	globaltag_checksum = (<globaltag_checksum> + ($Secret_Characters [1].id))
	SetGlobalTags ($Secret_Characters [2].id) params = {unlocked_for_purchase = 0}
	globaltag_checksum = (<globaltag_checksum> + ($Secret_Characters [2].id))
	return globaltag_checksum = <globaltag_checksum>
endscript
default_songtags = {
	available_on_other_client = 1
	beaten_coop_as_lead = 0
	beaten_coop_as_rhythm = 0
}

script setup_songtags 
	GetArraySize \{$difficulty_list}
	num_difficulty = <array_Size>
	array_count = 0
	begin
	get_difficulty_text_nl difficulty = ($difficulty_list [<array_count>])
	formatText checksumName = default_topscores 'default_topscores_%d' d = <difficulty_text_nl>
	formatText checksumName = default_songtagswithdifficulty_diff 'default_songtagswithdifficulty_%d' d = <difficulty_text_nl>
	get_songlist_size
	song_array_size = <array_Size>
	song_count = 0
	begin
	get_songlist_checksum index = <song_count>
	get_song_prefix song = <song_checksum>
	formatText checksumName = songname '%s_%d' s = (<song_prefix>) d = <difficulty_text_nl> AddToStringLookup = true
	if GotParam \{globaltag_checksum}
		globaltag_checksum = (<globaltag_checksum> + <songname>)
	endif
	get_song_struct song = <song_checksum>
	if (<song_struct>.version = gh3)
		if NOT GetGlobalTags <songname> noassert = 1
			get_song_title song = <song_checksum>
			SetGlobalTags <songname> params = {(<default_songtagswithdifficulty_diff>) (<default_topscores>)}
			printf \{"setup_songtags: difficulty topscores"}
		endif
		if NOT GetGlobalTags <song_checksum> noassert = 1
			SetGlobalTags <song_checksum> params = {($default_songtags)}
			printf \{"setup_songtags: songtags"}
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
		SetGlobalTags ($GH3_Bonus_Songs.tier1.songs [<song_count>]) params = {unlocked = 0}
	endif
	song_count = (<song_count> + 1)
	repeat <array_Size>
	if GotParam \{globaltag_checksum}
		return globaltag_checksum = <globaltag_checksum>
	endif
endscript
default_venuetags = {
	unlocked = 1
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
	index = 0
	begin
	GetArraySize \{$difficulty_list}
	diff_array_size = <array_Size>
	diff_index = 0
	begin
	Player = 1
	begin
	get_difficulty_text_nl difficulty = ($difficulty_list [<diff_index>])
	get_LevelZoneArray_checksum index = <index>
	formatText checksumName = final_checksum 'p%p_career_band%i_%d%s' i = (<band_count> + 1) p = <Player> d = <difficulty_text_nl> s = ($LevelZones.<level_checksum>.Name) AddToStringLookup = true
	SetGlobalTags <final_checksum> params = {(<venue_tags>)}
	if (<Player> = 1)
		get_progression_globals \{game_mode = p1_career}
	else
		get_progression_globals \{game_mode = p2_career}
	endif
	tier_level = ($<tier_global>.tier1.level)
	tier_name = ($LevelZones.<tier_level>.Name)
	formatText checksumName = final_checksum 'p%p_career_band%i_%d%s' i = (<band_count> + 1) p = <Player> d = <difficulty_text_nl> s = <tier_name> AddToStringLookup = true
	SetGlobalTags <final_checksum> params = {unlocked = 1}
	formatText checksumName = venue_checksum 'venue_%s' s = ($LevelZones.<tier_level>.Name)
	SetGlobalTags <venue_checksum> params = {unlocked = 1}
	if StructureContains structure = ($<tier_global>.tier1) unlocked_levels
		GetArraySize ($<tier_global>.tier1.unlocked_levels)
		array_count = 0
		begin
		level_checksum = ($<tier_global>.tier1.unlocked_levels [<array_count>])
		formatText checksumName = venue_checksum 'venue_%s' s = ($LevelZones.<level_checksum>.Name)
		SetGlobalTags <venue_checksum> params = {unlocked = 1}
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
	<index> = (<index> + 1)
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
	get_LevelZoneArray_checksum index = <array_count>
	formatText checksumName = venue_checksum 'venue_%s' s = ($LevelZones.<level_checksum>.Name) AddToStringLookup = true
	if NOT GetGlobalTags <venue_checksum> noassert = 1
		SetGlobalTags <venue_checksum> params = {($default_venuetags)}
	endif
	if Is_LevelZone_Downloaded level_checksum = <level_checksum>
		if (<download> = 1)
			SetGlobalTags <venue_checksum> params = {unlocked = 1}
		endif
	else
		SetGlobalTags <venue_checksum> params = {unlocked = 0}
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
endscript
default_guitartags = {
	unlocked = 1
	unlocked_on_other_client = 1
	available_on_other_client = 1
}
default_charactertags = {
	unlocked = 1
	unlocked_on_other_client = 1
	available_on_other_client = 1
}

script setup_unlocks 
	GetArraySize \{$Secret_Guitars}
	array_count = 0
	begin
	if NOT GetGlobalTags ($Secret_Guitars [<array_count>].id) noassert = 1
		SetGlobalTags ($Secret_Guitars [<array_count>].id) params = {($default_guitartags) unlocked_for_purchase = 0}
	endif
	globaltag_checksum = (<globaltag_checksum> + ($Secret_Guitars [<array_count>].id))
	array_count = (<array_count> + 1)
	repeat <array_Size>
	GetArraySize \{$Bonus_Guitars}
	array_count = 0
	begin
	if NOT GetGlobalTags ($Bonus_Guitars [<array_count>].id) noassert = 1
		SetGlobalTags ($Bonus_Guitars [<array_count>].id) params = {($default_guitartags) unlocked_for_purchase = 1}
	endif
	globaltag_checksum = (<globaltag_checksum> + ($Bonus_Guitars [<array_count>].id))
	array_count = (<array_count> + 1)
	repeat <array_Size>
	GetArraySize \{$Bonus_Guitar_Finishes}
	array_count = 0
	begin
	if NOT GetGlobalTags ($Bonus_Guitar_Finishes [<array_count>].id) noassert = 1
		SetGlobalTags ($Bonus_Guitar_Finishes [<array_count>].id) params = {($default_guitartags) unlocked_for_purchase = 1}
	endif
	globaltag_checksum = (<globaltag_checksum> + ($Bonus_Guitar_Finishes [<array_count>].id))
	array_count = (<array_count> + 1)
	repeat <array_Size>
	GetArraySize \{$Secret_Basses}
	array_count = 0
	begin
	if NOT GetGlobalTags ($Secret_Basses [<array_count>].id) noassert = 1
		SetGlobalTags ($Secret_Basses [<array_count>].id) params = {($default_guitartags) unlocked_for_purchase = 0}
	endif
	globaltag_checksum = (<globaltag_checksum> + ($Secret_Basses [<array_count>].id))
	array_count = (<array_count> + 1)
	repeat <array_Size>
	GetArraySize \{$Bonus_Basses}
	array_count = 0
	begin
	if NOT GetGlobalTags ($Bonus_Basses [<array_count>].id) noassert = 1
		SetGlobalTags ($Bonus_Basses [<array_count>].id) params = {($default_guitartags) unlocked_for_purchase = 1}
	endif
	globaltag_checksum = (<globaltag_checksum> + ($Bonus_Basses [<array_count>].id))
	array_count = (<array_count> + 1)
	repeat <array_Size>
	GetArraySize \{$Secret_Characters}
	array_count = 0
	begin
	if NOT GetGlobalTags ($Secret_Characters [<array_count>].id) noassert = 1
		SetGlobalTags ($Secret_Characters [<array_count>].id) params = {($default_charactertags)}
	endif
	globaltag_checksum = (<globaltag_checksum> + ($Secret_Characters [<array_count>].id))
	array_count = (<array_count> + 1)
	repeat <array_Size>
	GetArraySize \{$Bonus_Outfits}
	array_count = 0
	begin
	if NOT GetGlobalTags ($Bonus_Outfits [<array_count>].id) noassert = 1
		SetGlobalTags ($Bonus_Outfits [<array_count>].id) params = {unlocked = 0}
	endif
	globaltag_checksum = (<globaltag_checksum> + ($Bonus_Outfits [<array_count>].id))
	array_count = (<array_count> + 1)
	repeat <array_Size>
	GetArraySize \{$Bonus_Styles}
	array_count = 0
	begin
	if NOT GetGlobalTags ($Bonus_Styles [<array_count>].id) noassert = 1
		Mod a = <array_count> b = 6
		if (<Mod> = 0 && <array_count> != 0)
			SetGlobalTags ($Bonus_Styles [<array_count>].id) params = {unlocked = 1}
		else
			SetGlobalTags ($Bonus_Styles [<array_count>].id) params = {unlocked = 0}
		endif
	endif
	globaltag_checksum = (<globaltag_checksum> + ($Bonus_Styles [<array_count>].id))
	array_count = (<array_count> + 1)
	repeat <array_Size>
	return globaltag_checksum = <globaltag_checksum>
endscript
family_mode_enabled = 0
disney_restricted_songs = [
	takethislife
	laydown
	bullsonparade
	anarchyintheuk
	holidayincambodia
	bellyofashark
	avalancha
	almosteasy
	holeintheearth
	thisisacall
	nomoresorrow
	thearsonist
	prettyhandsomeawkward
	sameoldsonganddance
]
chuck_restricted_songs = [
	sameoldsonganddance
	helicopter
	takethislife
	knightsofcydonia
	laydown
	bullsonparade
	anarchyintheuk
	TalkDirtyToMe
	rockulikeahurricane
	holidayincambodia
	blacksunshine
	blackmagicwoman
	bellyofashark
	dontholdback
	almosteasy
	holeintheearth
	thearsonist
	prettyhandsomeawkward
	avalancha
	barracuda
	cherubrock
	cultofpersonality
	fortheloveofgod
	peaceofmind
	sleepinggiant
]
default_songsetlisttags = {
	stars = 0
	score = 0
	unlocked = 1
	restricted = 0
}

script setup_setlisttags \{globaltag_checksum = None
		Force = 0}
	setup_tiertags SetList_Songs = <SetList_Songs>
	array_count = 0
	begin
	formatText checksumName = Tier 'tier%s' s = (<array_count> + 1)
	GetArraySize ($<SetList_Songs>.<Tier>.songs)
	if (<array_Size> > 0)
		song_count = 0
		begin
		song = ($<SetList_Songs>.<Tier>.songs [<song_count>])
		setlist_prefix = ($<SetList_Songs>.prefix)
		SetGlobalTags <song> params = {unlocked = 0}
		formatText TextName = song_checksum_suffix '%p_song%i_tier%s' p = <setlist_prefix> i = (<song_count> + 1) s = (<array_count> + 1)
		ExtendCrc out = song_checksum <song> <song_checksum_suffix>
		globaltag_checksum = (<globaltag_checksum> + <song_checksum>)
		formatText checksumName = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = (<song_count> + 1) s = (<array_count> + 1) AddToStringLookup = true
		if NOT GetGlobalTags <song_checksum> noassert = 1
			SetGlobalTags <song_checksum> params = {($default_songsetlisttags)}
			printf \{"setup_setlisttags: default not"}
		elseif (<Force> = 1)
			SetGlobalTags <song_checksum> params = {($default_songsetlisttags)}
			printf \{"setup_setlisttags: default force"}
		endif
		if StructureContains structure = ($<SetList_Songs>.<Tier>) defaultunlocked
			if (<song_count> < $<SetList_Songs>.<Tier>.defaultunlocked)
				SetGlobalTags <song_checksum> params = {unlocked = 1}
			endif
		elseif StructureContains structure = ($<SetList_Songs>.<Tier>) UnlockAll
			song = ($<SetList_Songs>.<Tier>.songs [<song_count>])
			if is_song_downloaded song_checksum = <song>
				SetGlobalTags <song_checksum> params = {unlocked = 1}
			else
				SetGlobalTags <song_checksum> params = {unlocked = 0}
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
	unlocked = 1
	complete = 1
	encore_unlocked = 1
	boss_unlocked = 1
	num_songs_to_progress = 4
}

script setup_tiertags 
	num_tiers = ($<SetList_Songs>.num_tiers)
	array_count = 0
	begin
	setlist_prefix = ($<SetList_Songs>.prefix)
	formatText checksumName = Tier 'tier%s' s = (<array_count> + 1)
	formatText checksumName = tiername '%ptier%i' p = <setlist_prefix> i = (<array_count> + 1) AddToStringLookup = true
	if NOT GetGlobalTags <tiername> noassert = 1
		SetGlobalTags <tiername> params = {($default_tiertags)}
	endif
	if StructureContains structure = ($<SetList_Songs>.<Tier>) defaultunlocked
		SetGlobalTags <tiername> params = {unlocked = 1}
	endif
	if StructureContains structure = ($<SetList_Songs>.<Tier>) UnlockAll
		SetGlobalTags <tiername> params = {unlocked = 1}
	endif
	array_count = (<array_count> + 1)
	repeat <num_tiers>
endscript
default_bandtags = {
	cash = 0
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
	get_difficulty_text_nl difficulty = ($difficulty_list [<array_count>])
	formatText checksumName = bandname 'p1_career_band%i_%d' i = (<band_count> + 1) d = <difficulty_text_nl> AddToStringLookup = true
	push_bandtags bandname = <bandname> mode = p1_career
	formatText checksumName = bandname 'p2_career_band%i_%d' i = (<band_count> + 1) d = <difficulty_text_nl> AddToStringLookup = true
	push_bandtags bandname = <bandname> mode = p2_career
	formatText checksumName = default_bandname 'band%i_info_p1_career' i = (<band_count> + 1) AddToStringLookup = true
	SetGlobalTags <default_bandname> params = {($default_bandtags)}
	formatText checksumName = default_bandname 'band%i_info_p2_career' i = (<band_count> + 1) AddToStringLookup = true
	SetGlobalTags <default_bandname> params = {($default_bandtags)}
	array_count = (<array_count> + 1)
	repeat <array_Size>
	<band_count> = (<band_count> + 1)
	repeat ($num_career_bands + 1)
	GetArraySize \{$difficulty_list}
	array_count = 0
	begin
	get_difficulty_text_nl difficulty = ($difficulty_list [<array_count>])
	get_progression_globals \{game_mode = p1_career}
	setlist_prefix = ($<tier_global>.prefix)
	formatText checksumName = gametype_checksum '%p_%s' p = <setlist_prefix> s = <difficulty_text_nl> AddToStringLookup = true
	SetGlobalTags <gametype_checksum> params = {complete = 0}
	get_progression_globals \{game_mode = p2_career}
	setlist_prefix = ($<tier_global>.prefix)
	formatText checksumName = gametype_checksum '%p_%s' p = <setlist_prefix> s = <difficulty_text_nl> AddToStringLookup = true
	SetGlobalTags <gametype_checksum> params = {complete = 0}
	array_count = (<array_count> + 1)
	repeat <array_Size>
	SetGlobalTags \{Progression
		params = {
			current_band = 1
			current_difficulty = easy
			current_gamemode = p1_career
		}}
endscript

script setup_user_option_tags 
	SetGlobalTags \{user_options
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

script setup_init_arcade_adjustments 
	SetGlobalTags \{arcade_adjustments
		params = {
			arcade_credits_for_standard = 0
			arcade_credits_for_continue = 0
			arcade_credits_for_premium = 0
			arcade_credits_for_axeclub = 0
			arcade_credits_per_coin = 1
			arcade_num_bill_pulses = 0
			arcade_credits_for_bonus = 0
			arcade_num_bonus_credits = 1
			arcade_beginner_fade_time = 60000.0
			arcade_easy_fade_time = 75000.0
			arcade_medium_fade_time = 90000.0
			arcade_hard_fade_time = 105000.0
			arcade_expert_fade_time = 120000.0
			arcade_song_fading_enabled = 0
		}}
endscript

script setup_init_arcade_hardware_adjustments 
	SetGlobalTags \{arcade_hardware_adjustments
		params = {
			arcade_lamp_brightness_level = 1
			master_game_volume = -3
			master_attract_volume = -3
			arcade_attract_audio_on = 1
			arcade_tilt_p1 = 100.0
			arcade_tilt_p2 = 100.0
			arcade_base_volume = 100.0
			arcade_volume_auto_adjust = 0
			arcade_winner_stays = 0
			arcade_no_fail = 0
		}}
endscript

script setup_init_arcade_crc_adjustments 
	SetGlobalTags \{arcade_crc_adjustments
		params = {
			arcade_run_crc_check = 1
		}}
endscript

script setup_init_arcade_audits 
	SetGlobalTags \{arcade_audits
		params = {
			arcade_total_coins = 0
			arcade_total_credits = 0
			arcade_service_credits = 0
			arcade_total_plays = 0
			arcade_total_premium = 0
			arcade_total_multiplayer_plays = 0
			arcade_total_faceoff_plays = 0
			arcade_total_pro_faceoff_plays = 0
			arcade_total_coop_plays = 0
			arcade_total_local_plays = 0
			arcade_total_axeclub_plays = 0
			arcade_total_tourney_plays = 0
			arcade_total_coinup_plays = 0
			arcade_num_credits_in = 0
			arcade_num_bills = 0
			arcade_total_bonus_credits = 0
			arcade_right_starts = 0
			arcade_left_starts = 0
			arcade_left_continues = 0
			arcade_right_continues = 0
			arcade_left_freegames = 0
			arcade_right_freegames = 0
			arcade_total_test_in_game = 0
			arcade_total_finished = 0
			arcade_total_wins = 0
			arcade_total_fails = 0
			arcade_total_boots = 0
			arcade_total_maintenance_resets = 0
			arcade_total_watchdog_resets = 0
			arcade_total_time = 0
			arcade_boot_time = 0
			arcade_total_play_time = 0
			arcade_total_menu_time = 0
			arcade_lefty_p1_plays = 0
			arcade_lefty_p2_plays = 0
			arcade_left_guitar_device = 0
			arcade_right_guitar_device = 1
			arcade_guitar_drop_reboots = 0
			arcade_guitar_drops_in_game = 0
			arcade_guitar_left_drops = 0
			arcade_guitar_right_drops = 0
			arcade_io_drops = 0
			arcade_freeplay = 0
			arcade_total_beginner = 0
			arcade_total_easy = 0
			arcade_total_medium = 0
			arcade_total_hard = 0
			arcade_total_expert = 0
			arcade_total_beginner_passed = 0
			arcade_total_easy_passed = 0
			arcade_total_medium_passed = 0
			arcade_total_hard_passed = 0
			arcade_total_expert_passed = 0
		}}
endscript

script setup_init_arcade_song_audits 
	GetArraySize \{$gh3_arcade_tier_songs}
	array_count = 0
	temp_song_name = ''
	begin
	<temp_song_name> = ($gh3_arcade_tier_songs [<array_count>])
	printf "setup_init_arcade_song_audits: temp_song_name=%s" s = ($permanent_songlist_props.<temp_song_name>.Name)
	formatText checksumName = song_stats 'arcade_song_stats_%s' s = ($permanent_songlist_props.<temp_song_name>.Name) AddToStringLookup = true
	SetGlobalTags <song_stats> params = {
		played = 0 ,
		passed = 0 ,
		multiplayer_played = 0 ,
		multiplayer_passed = 0 ,
		beginner_played = 0 ,
		beginner_passed = 0 ,
		beginner_total_notes = 0 ,
		beginner_notes_hit = 0 ,
		beginner_notes_missed = 0 ,
		beginner_fewest_notes_hit = 99999 ,
		beginner_most_notes_hit = 0 ,
		beginner_best_streak = 0 ,
		easy_played = 0 ,
		easy_passed = 0 ,
		easy_total_notes = 0 ,
		easy_notes_hit = 0 ,
		easy_notes_missed = 0 ,
		easy_fewest_notes_hit = 99999 ,
		easy_most_notes_hit = 0 ,
		easy_best_streak = 0 ,
		medium_played = 0 ,
		medium_passed = 0 ,
		medium_total_notes = 0 ,
		medium_notes_hit = 0 ,
		medium_notes_missed = 0 ,
		medium_fewest_notes_hit = 99999 ,
		medium_most_notes_hit = 0 ,
		medium_best_streak = 0 ,
		hard_played = 0 ,
		hard_passed = 0 ,
		hard_total_notes = 0 ,
		hard_notes_hit = 0 ,
		hard_notes_missed = 0 ,
		hard_fewest_notes_hit = 99999 ,
		hard_most_notes_hit = 0 ,
		hard_best_streak = 0 ,
		expert_played = 0 ,
		expert_passed = 0 ,
		expert_total_notes = 0 ,
		expert_notes_hit = 0 ,
		expert_notes_missed = 0 ,
		expert_fewest_notes_hit = 99999 ,
		expert_most_notes_hit = 0 ,
		expert_best_streak = 0 ,
	}
	Increment \{array_count}
	repeat <array_Size>
endscript

script setup_arcade_audit_tags 
	printf \{"setup_arcade_audit_tags: initializing data"}
	setup_init_arcade_audits
	setup_init_arcade_song_audits
endscript

script setup_arcade_adjustments_tags 
	printf \{"setup_arcade_adjustments_tags: initializing data"}
	setup_init_arcade_adjustments
endscript

script setup_arcade_hardware_tags 
	printf \{"setup_arcade_hardware_tags: initializing data"}
	setup_init_arcade_hardware_adjustments
endscript

script setup_arcade_crc_tags 
	printf \{"setup_arcade_crc_tags: initializing data"}
	setup_init_arcade_crc_adjustments
endscript

script setup_online_tags 
	SetGlobalTags \{net
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
	GetGlobalTags \{user_options}
	if (<lefty_flip_p1>)
		Change \{pad_event_up_inversion = true}
	else
		Change \{pad_event_up_inversion = FALSE}
	endif
endscript

script setup_training_tags 
	SetGlobalTags \{training
		params = {
			basic_lesson = not_complete
			star_power_lesson = not_complete
			guitar_battle_lesson = not_complete
			advanced_techniques_lesson = not_complete
		}}
endscript

script setup_store_tags 
	GetArraySize ($Bonus_videos)
	index = 0
	begin
	video_checksum = ($Bonus_videos [<index>].id)
	SetGlobalTags <video_checksum> params = {unlocked = 0}
	<index> = (<index> + 1)
	repeat <array_Size>
	i = 6
	GetArraySize ($bv_text_array)
	begin
	video_checksum = ($bv_text_array [<i>].id)
	SetGlobalTags <video_checksum> params = {unlocked = 0}
	<i> = (<i> + 1)
	repeat (<array_Size> - 6)
endscript
default_characterguitartags = {
	current_selected_guitar = Instrument_Star_Guitar_Red
	current_selected_bass = Instrument_Pend
	current_instrument = guitar
	current_outfit = 1
	current_style = 1
}

script setup_characterguitar_tags 
	get_musician_profile_size
	<musician_profile_index> = 0
	begin
	<Player> = 1
	begin
	get_musician_profile_struct index = <musician_profile_index>
	formatText checksumName = default_characterguitartag 'character_%c_player_%p_guitar_tags' c = (<profile_struct>.Name) p = <Player> AddToStringLookup = true
	if NOT GetGlobalTags <default_characterguitartag> noassert = 1
		SetGlobalTags <default_characterguitartag> params = {($default_characterguitartags)}
		if StructureContains structure = <profile_struct> Name = musician_instrument
			<inst_ID> = (<profile_struct>.musician_instrument.desc_id)
			SetGlobalTags <default_characterguitartag> params = {current_selected_guitar = <inst_ID>}
		endif
	else
		valid = 0
		if find_instrument_index desc_id = <current_selected_guitar>
			if is_musician_instrument_downloaded index = <index>
				valid = 1
			endif
		endif
		if (<valid> = 0)
			SetGlobalTags <default_characterguitartag> params = {current_selected_guitar = Instrument_Guitar_King}
		endif
		valid = 0
		if find_instrument_index desc_id = <current_selected_bass>
			if is_musician_instrument_downloaded index = <index>
				valid = 1
			endif
		endif
		if (<valid> = 0)
			SetGlobalTags <default_characterguitartag> params = {current_selected_bass = Instrument_Assassin}
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
		printstruct <...>
		ScriptAssert \{"Invalid mode"}
	endif
	i = 0
	begin
	num_tiers = ($<Career_Songs>.num_tiers)
	array_count = 0
	begin
	formatText checksumName = Tier 'tier%d' d = (<array_count> + 1)
	GetArraySize ($<Career_Songs>.<Tier>.songs)
	if NOT (<array_Size> = 0)
		setlist_prefix = ($<Career_Songs>.prefix)
		formatText checksumName = tiername '%ptier%i' p = <setlist_prefix> i = (<array_count> + 1)
		formatText checksumName = tier_checksum 'tier%s' s = (<array_count> + 1)
		PushGlobalTags <tiername> section = <bandname>
		GetArraySize ($<Career_Songs>.<tier_checksum>.songs)
		song_count = 0
		begin
		setlist_prefix = ($<Career_Songs>.prefix)
		formatText checksumName = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = (<song_count> + 1) s = (<array_count> + 1) AddToStringLookup = true
		PushGlobalTags <song_checksum> section = <bandname>
		song_count = (<song_count> + 1)
		repeat <array_Size>
	endif
	array_count = (<array_count> + 1)
	repeat <num_tiers>
	<i> = (<i> + 1)
	if (<i> = 1)
		get_progression_globals game_mode = <mode> Bonus
	elseif (<i> = 2)
		get_progression_globals game_mode = <mode> download
	endif
	Career_Songs = <tier_global>
	repeat 3
	Player = 1
	begin
	formatText checksumName = player_status 'player%i_status' i = <Player>
	formatText checksumName = player_character_params 'player%i_character_params' i = <Player> AddToStringLookup = true
	SetGlobalTags <player_character_params> params = {character_id = ($<player_status>.character_id)
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
	formatText checksumName = player_status 'player%i_status' i = <Player>
	formatText checksumName = player_character_params 'player%i_character_params' i = <Player>
	GetGlobalTags <player_character_params>
	Change structurename = <player_status> character_id = <character_id>
	Change structurename = <player_status> instrument_id = <instrument_id>
	Change structurename = <player_status> style = <style>
	Change structurename = <player_status> outfit = <outfit>
	valid = 0
	if find_profile_by_id id = ($<player_status>.character_id)
		if is_musician_profile_downloaded index = <index>
			valid = 1
		endif
	endif
	if (<valid> = 0)
		printf \{"Invalid Character found - changing to axel"}
		Change structurename = <player_status> character_id = Axel
		Change structurename = <player_status> style = 1
		Change structurename = <player_status> outfit = 1
	endif
	valid = 0
	if find_instrument_index desc_id = ($<player_status>.instrument_id)
		if is_musician_instrument_downloaded index = <index>
			valid = 1
		endif
	endif
	if (<valid> = 0)
		printf \{"Invalid Instrument found - changing to les paul black"}
		Change structurename = <player_status> instrument_id = Instrument_Les_Paul_Black
	endif
	Player = (<Player> + 1)
	repeat <num_players>
endscript

script GlobalTags_UnlockAll \{songs_only = 0}
	if NOT (<songs_only> = 1)
		array_count = 0
		GetArraySize \{$Bonus_Guitars}
		begin
		SetGlobalTags ($Bonus_Guitars [<array_count>].id) params = {unlocked = 1 unlocked_for_purchase = 1}
		array_count = (<array_count> + 1)
		repeat <array_Size>
		array_count = 0
		GetArraySize \{$Bonus_Guitar_Finishes}
		begin
		SetGlobalTags ($Bonus_Guitar_Finishes [<array_count>].id) params = {unlocked = 1 unlocked_for_purchase = 1}
		array_count = (<array_count> + 1)
		repeat <array_Size>
		array_count = 0
		GetArraySize \{$Secret_Guitars}
		begin
		SetGlobalTags ($Secret_Guitars [<array_count>].id) params = {unlocked = 1 unlocked_for_purchase = 1}
		array_count = (<array_count> + 1)
		repeat <array_Size>
		array_count = 0
		GetArraySize \{$Bonus_Basses}
		begin
		SetGlobalTags ($Bonus_Basses [<array_count>].id) params = {unlocked = 1 unlocked_for_purchase = 1}
		array_count = (<array_count> + 1)
		repeat <array_Size>
		array_count = 0
		GetArraySize \{$Secret_Basses}
		begin
		SetGlobalTags ($Secret_Basses [<array_count>].id) params = {unlocked = 1 unlocked_for_purchase = 1}
		array_count = (<array_count> + 1)
		repeat <array_Size>
		array_count = 0
		GetArraySize \{$Secret_Characters}
		begin
		SetGlobalTags ($Secret_Characters [<array_count>].id) params = {unlocked = 1}
		array_count = (<array_count> + 1)
		repeat <array_Size>
		array_count = 0
		GetArraySize \{$Bonus_Outfits_For_Unlock}
		begin
		SetGlobalTags ($Bonus_Outfits_For_Unlock [<array_count>].id) params = {unlocked = 1}
		array_count = (<array_count> + 1)
		repeat <array_Size>
		array_count = 0
		GetArraySize \{$Bonus_Styles_For_Unlock}
		begin
		SetGlobalTags ($Bonus_Styles_For_Unlock [<array_count>].id) params = {unlocked = 1}
		array_count = (<array_count> + 1)
		repeat <array_Size>
		array_count = 0
		GetArraySize \{$Bonus_videos}
		begin
		SetGlobalTags ($Bonus_videos [<array_count>].id) params = {unlocked = 1}
		array_count = (<array_count> + 1)
		repeat <array_Size>
	endif
	array_count = 0
	begin
	setlist_prefix = ($<SongList>.prefix)
	formatText checksumName = tiername '%ptier%i' p = <setlist_prefix> i = (<array_count> + 1)
	formatText checksumName = tier_checksum 'tier%s' s = (<array_count> + 1)
	GetArraySize ($<SongList>.<tier_checksum>.songs)
	SetGlobalTags <tiername> params = {unlocked = 1
		complete = 1
		encore_unlocked = 1
		boss_unlocked = 1
		num_songs_to_progress = 0}
	song_count = 0
	begin
	setlist_prefix = ($<SongList>.prefix)
	formatText checksumName = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = (<song_count> + 1) s = (<array_count> + 1) AddToStringLookup = true
	if (<songs_only> = 1)
		SetGlobalTags <song_checksum> params = {unlocked = 1}
	else
		SetGlobalTags <song_checksum> params = {stars = 5
			score = 1000000
			unlocked = 1}
		get_difficulty_text_nl difficulty = ($current_difficulty)
		get_song_prefix song = ($<SongList>.<tier_checksum>.songs [<song_count>])
		formatText checksumName = songname '%s_%d' s = <song_prefix> d = <difficulty_text_nl>
		SetGlobalTags <songname> params = {achievement_gold_star = 1}
	endif
	song_count = (<song_count> + 1)
	repeat <array_Size>
	array_count = (<array_count> + 1)
	repeat ($<SongList>.num_tiers)
	setup_venuetags \{cheat}
endscript
progression_pop_count = 0

script progression_push_current \{Force = 0}
	printscriptinfo \{"progression_push_current_callstack"}
	if NOT ($progression_pop_count = 1)
		if (<Force> = 0)
			ScriptAssert \{"progression_push_current with nothing popped"}
		endif
		return
	endif
	GetGlobalTags \{Progression
		params = current_band}
	GetGlobalTags \{Progression
		params = current_difficulty}
	GetGlobalTags \{Progression
		params = current_gamemode}
	get_difficulty_text_nl difficulty = (<current_difficulty>)
	if GotParam \{force_gamemode}
		<current_gamemode> = <force_gamemode>
	endif
	if (<current_gamemode> = p1_career)
		bandname_part1 = 'p1_career'
	elseif (<current_gamemode> = p2_career)
		bandname_part1 = 'p2_career'
	endif
	formatText checksumName = bandname '%s_band%i_%d' s = <bandname_part1> i = <current_band> d = <difficulty_text_nl>
	push_bandtags bandname = <bandname> mode = <current_gamemode>
	Change progression_pop_count = ($progression_pop_count - 1)
endscript

script progression_pop_current \{Force = 0
		UpdateAtoms = 1}
	printscriptinfo \{"progression_pop_current_callstack"}
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
	get_difficulty_text_nl difficulty = <difficulty>
	formatText checksumName = bandname '%s_band%i_%d' s = <bandname_part1> i = ($current_band) d = <difficulty_text_nl>
	pop_bandtags bandname = <bandname>
	SetGlobalTags Progression params = {current_band = ($current_band)
		current_difficulty = <difficulty>
		current_gamemode = <current_gamemode>}
	Change progression_pop_count = ($progression_pop_count + 1)
endscript

script get_minimum_difficulty \{difficulty1 = easy
		difficulty2 = easy}
	if (<difficulty1> = <difficulty2>)
		return minimum_difficulty = <difficulty1>
	else
		switch <difficulty1>
			case beginner
			return \{minimum_difficulty = beginner}
			case easy
			if (<difficulty2> = beginner)
				return \{minimum_difficulty = beginner}
			else
				return \{minimum_difficulty = easy}
			endif
			case medium
			if (<difficulty2> = beginner)
				return \{minimum_difficulty = beginner}
			elseif (<difficulty2> = easy)
				return \{minimum_difficulty = easy}
			else
				return \{minimum_difficulty = medium}
			endif
			case hard
			if (<difficulty2> = beginner)
				return \{minimum_difficulty = beginner}
			elseif (<difficulty2> = easy)
				return \{minimum_difficulty = easy}
			elseif (<difficulty2> = medium)
				return \{minimum_difficulty = medium}
			else
				return \{minimum_difficulty = hard}
			endif
			case expert
			if (<difficulty2> = beginner)
				return \{minimum_difficulty = beginner}
			elseif (<difficulty2> = easy)
				return \{minimum_difficulty = easy}
			elseif (<difficulty2> = medium)
				return \{minimum_difficulty = medium}
			elseif (<difficulty2> = hard)
				return \{minimum_difficulty = hard}
			endif
		endswitch
	endif
endscript

script get_maximum_difficulty \{difficulty1 = easy
		difficulty2 = easy}
	printf "get_maximum_difficulty: diff1=%d, diff2=%e" d = <difficulty1> e = <difficulty2>
	if (<difficulty1> = <difficulty2>)
		maximum_difficulty = <difficulty1>
	else
		switch <difficulty1>
			case expert
			maximum_difficulty = expert
			case hard
			if (<difficulty2> = expert)
				maximum_difficulty = expert
			else
				maximum_difficulty = hard
			endif
			case medium
			if (<difficulty2> = expert)
				maximum_difficulty = expert
			elseif (<difficulty2> = hard)
				maximum_difficulty = hard
			else
				maximum_difficulty = medium
			endif
			case easy
			if (<difficulty2> = expert)
				maximum_difficulty = expert
			elseif (<difficulty2> = hard)
				maximum_difficulty = hard
			elseif (<difficulty2> = medium)
				maximum_difficulty = medium
			else
				maximum_difficulty = easy
			endif
			case beginner
			if (<difficulty2> = expert)
				maximum_difficulty = expert
			elseif (<difficulty2> = hard)
				maximum_difficulty = hard
			elseif (<difficulty2> = medium)
				maximum_difficulty = medium
			elseif (<difficulty2> = easy)
				maximum_difficulty = easy
			endif
		endswitch
	endif
	return maximum_difficulty = <maximum_difficulty>
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
	if NOT GotParam \{difficulty}
		SoftAssert \{"Did not get difficulty!"}
		return
	endif
	return ui_string = ($game_difficulty_ui_strings.<difficulty>)
endscript
game_difficulty_ui_strings = {
	beginner = "Beginner"
	easy = "Easy"
	medium = "Medium"
	hard = "Hard"
	expert = "Expert"
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
	formatText checksumName = bandname 'band%i_info_p1_career' i = ($current_band)
	return band_info = <bandname>
endscript

script get_current_band_checksum 
	get_difficulty_text_nl difficulty = ($current_difficulty)
	if ($game_mode = p2_career)
		formatText checksumName = bandname 'p2_career_band%i_%d' i = ($current_band) d = <difficulty_text_nl>
	else
		formatText checksumName = bandname 'p1_career_band%i_%d' i = ($current_band) d = <difficulty_text_nl>
	endif
	return band_checksum = <bandname>
endscript

script setup_achievement_tags 
	SetGlobalTags \{achievement_info
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
			total_points_in_career_mode_beginner = 0
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
	printf \{"set_online_match_info"}
	if (<Ranked> = 0)
		<player_matches> = (<player_matches_played> + 1)
		SetGlobalTags achievement_info params = {player_matches_played = <player_matches>}
		if (<won> = 1)
			<matches_won> = (<player_matches_won> + 1)
			SetGlobalTags achievement_info params = {player_matches_won = <matches_won>}
			if (<HOST> = 1)
				<host_won> = (<player_matches_won_as_host> + 1)
				SetGlobalTags achievement_info params = {player_matches_won_as_host = <host_won>}
			else
				<client_won> = (<player_matches_won_as_client> + 1)
				SetGlobalTags achievement_info params = {player_matches_won_as_client = <client_won>}
			endif
		endif
	else
		<player_matches> = (<ranked_matches_played> + 1)
		SetGlobalTags achievement_info params = {ranked_matches_played = <player_matches>}
		if (<won> = 1)
			<matches_won> = (<ranked_matches_won> + 1)
			SetGlobalTags achievement_info params = {ranked_matches_won = <matches_won>}
			if (<HOST> = 1)
				<host_won> = (<ranked_matches_won_as_host> + 1)
				SetGlobalTags achievement_info params = {ranked_matches_won_as_host = <host_won>}
				<consec_won> = (<ranked_consecutive_won_as_host> + 1)
				SetGlobalTags achievement_info params = {ranked_consecutive_won_as_host = <consec_won>}
			else
				<client_won> = (<ranked_matches_won_as_client> + 1)
				SetGlobalTags achievement_info params = {ranked_matches_won_as_client = <client_won>}
				<consec_won> = (<ranked_consecutive_won_as_client> + 1)
				SetGlobalTags achievement_info params = {ranked_consecutive_won_as_client = <consec_won>}
			endif
			if (<standard_controller> = 1)
				<controller_won> = (<ranked_matches_won_with_standard_controller> + 1)
				SetGlobalTags achievement_info params = {ranked_matches_won_with_standard_controller = <controller_won>}
			endif
		else
			if (<HOST> = 1)
				SetGlobalTags \{achievement_info
					params = {
						ranked_consecutive_won_as_host = 0
					}}
			else
				SetGlobalTags \{achievement_info
					params = {
						ranked_consecutive_won_as_client = 0
					}}
			endif
		endif
	endif
	GetGlobalTags \{achievement_info}
	printstruct <...>
endscript
