debug_saves = 0
globaltag_checksum = empty

script reset_globaltags savegame = ($primary_controller)
	globaltag_checksum = initial_v040
	lockglobaltags \{OFF}
	ClearGlobalTags savegame = <savegame>
	stars
	printf \{'I take a long time... I need to be fixed'}
	stars
	printf 'Resetting GlobalTags for savegame %d' d = <savegame>
	SetGlobalTags savegame = <savegame> last_singleplayer_character params = {last_singleplayer_character = None}
	SetGlobalTags savegame = <savegame> last_band_characters params = {
		last_band_characters = [None None None None]
	}
	SetGlobalTags savegame = <savegame> last_h2h_characters params = {
		last_h2h_characters = [None None]
	}
	SetGlobalTags savegame = <savegame> last_band_xbox_character params = {last_band_xbox_character = None}
	SetGlobalTags savegame = <savegame> last_h2h_xbox_character params = {last_h2h_xbox_character = None}
	setupsongtags savegame = <savegame> globaltag_checksum = <globaltag_checksum> part = 'guitar'
	setupsongtags savegame = <savegame> globaltag_checksum = <globaltag_checksum> part = 'bass'
	setupsongtags savegame = <savegame> globaltag_checksum = <globaltag_checksum> part = 'drum'
	setupsongtags savegame = <savegame> globaltag_checksum = <globaltag_checksum> part = 'vocals' topscores = ($vocals_topscores)
	setupsongtags savegame = <savegame> globaltag_checksum = <globaltag_checksum> part = 'band'
	setup_venuetags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	get_progression_globals \{career_guitar}
	setup_gigtags savegame = <savegame> SetList_Songs = <tier_global> globaltag_checksum = <globaltag_checksum> part = guitar
	get_progression_globals \{career_bass}
	setup_gigtags savegame = <savegame> SetList_Songs = <tier_global> globaltag_checksum = <globaltag_checksum> part = bass
	get_progression_globals \{career_drum}
	setup_gigtags savegame = <savegame> SetList_Songs = <tier_global> globaltag_checksum = <globaltag_checksum> part = drum
	get_progression_globals \{career_vocals}
	setup_gigtags savegame = <savegame> SetList_Songs = <tier_global> globaltag_checksum = <globaltag_checksum> part = vocals
	get_progression_globals \{career_band}
	setup_gigtags savegame = <savegame> SetList_Songs = <tier_global> globaltag_checksum = <globaltag_checksum> part = Band
	get_progression_globals \{career_guitar}
	setup_setlisttags savegame = <savegame> SetList_Songs = <tier_global> globaltag_checksum = <globaltag_checksum> part = guitar
	get_progression_globals \{career_bass}
	setup_setlisttags savegame = <savegame> SetList_Songs = <tier_global> globaltag_checksum = <globaltag_checksum> part = bass
	get_progression_globals \{career_drum}
	setup_setlisttags savegame = <savegame> SetList_Songs = <tier_global> globaltag_checksum = <globaltag_checksum> part = drum
	get_progression_globals \{career_vocals}
	setup_setlisttags savegame = <savegame> SetList_Songs = <tier_global> globaltag_checksum = <globaltag_checksum> part = vocals
	get_progression_globals \{career_band}
	setup_setlisttags savegame = <savegame> SetList_Songs = <tier_global> globaltag_checksum = <globaltag_checksum> part = Band
	setup_quickplay_song_tags savegame = <savegame> allsongs
	get_progression_globals \{career_guitar}
	setup_quickplay_song_tags savegame = <savegame> SetList_Songs = <tier_global> globaltag_checksum = <globaltag_checksum> part = guitar
	get_progression_globals \{career_bass}
	setup_quickplay_song_tags savegame = <savegame> SetList_Songs = <tier_global> globaltag_checksum = <globaltag_checksum> part = bass
	get_progression_globals \{career_drum}
	setup_quickplay_song_tags savegame = <savegame> SetList_Songs = <tier_global> globaltag_checksum = <globaltag_checksum> part = drum
	get_progression_globals \{career_vocals}
	setup_quickplay_song_tags savegame = <savegame> SetList_Songs = <tier_global> globaltag_checksum = <globaltag_checksum> part = vocals
	get_progression_globals \{career_band}
	setup_quickplay_song_tags savegame = <savegame> SetList_Songs = <tier_global> globaltag_checksum = <globaltag_checksum> part = Band
	setup_bandtags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	setup_user_option_tags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	setup_training_tags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	setup_unlocks savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	setup_custom_character_tags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	setup_online_tags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	reset_transient_tags savegame = <savegame>
	setup_achievement_tags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	setup_cas_helper_tags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	setup_saved_instrument_tags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	jam_reset_controller_directory_listing savegame = <savegame>
	Change \{ghtunes_verified = 0}
	restore_globals_from_global_tags savegame = <savegame> callmonitorcontrollerstates = 0
	SetGlobalTags savegame = <savegame> globaltag_checksum params = {globaltag_checksum = <globaltag_checksum>}
	Change globaltag_checksum = <globaltag_checksum>
	SetGlobalTags savegame = <savegame> check_guid params = {user_id0 = -1 user_id1 = -1}
	SetArrayElement ArrayName = globaltags_to_invalidate globalarray index = <savegame> NewValue = 0
	clearachievementcache controller_id = <savegame>
	lockglobaltags
endscript

script reset_globaltags_all 
	reset_globaltags \{savegame = 0}
	get_num_globaltag_sets
	if (<num_globaltag_sets> > 1)
		savegame = 1
		begin
		printf 'Copying GlobalTags for savegame %d' d = <savegame>
		ClearGlobalTags savegame = <savegame>
		copyglobaltags from = 0 to = <savegame>
		jam_reset_controller_directory_listing savegame = <savegame>
		SetArrayElement ArrayName = globaltags_to_invalidate globalarray index = <savegame> NewValue = 0
		<savegame> = (<savegame> + 1)
		repeat (<num_globaltag_sets> - 1)
	endif
endscript

script init_globaltags 
	max_globaltag_structs = 19000
	PushMemProfile \{'globaltags'}
	GetArraySize ($instrument_progression_list)
	instrument_size = <array_Size>
	initglobaltags max_sets = <globaltag_sets> max_structs = <max_globaltag_structs> max_cars = ($max_num_create_a_rockers)
	PopMemProfile
endscript

script get_num_globaltag_sets 
	getmaxplayers
	if isps3
		return \{num_globaltag_sets = 1}
	else
		return num_globaltag_sets = <max_players>
	endif
endscript
globaltags_to_invalidate = [
	0
	0
	0
	0
]

script mark_globaltags_to_invalidate \{savegame = 0}
	SetArrayElement ArrayName = globaltags_to_invalidate globalarray index = <savegame> NewValue = 1
endscript

script invalidate_globaltags 
	savegame = 0
	begin
	if ($globaltags_to_invalidate [<savegame>])
		reset_globaltags savegame = <savegame>
	endif
	savegame = (<savegame> + 1)
	repeat 4
endscript

script set_globaltag_guid controller = ($primary_controller)
	if isXenon
		if islocallysignedin controller = <controller>
			NetSessionFunc func = get_user_id params = {controller_index = <controller>}
			user_id0 = (<user_id> [0])
			user_id1 = (<user_id> [1])
		else
			user_id0 = 0
			user_id1 = 0
		endif
		SetGlobalTags controller = <controller> check_guid params = {user_id0 = <user_id0> user_id1 = <user_id1>}
	else
		SetGlobalTags controller = <controller> check_guid params = {user_id0 = 1 user_id1 = 1}
	endif
endscript

script check_globaltag_guid controller = ($primary_controller)
	if isXenon
		printf qs(0xb006a6d7) i = <controller>
		if islocallysignedin controller = <controller>
			printf \{qs(0x3659a8f5)}
			current_user_id0 = 0
			current_user_id1 = 0
		else
			printf \{qs(0x0177c50b)}
			NetSessionFunc func = get_user_id params = {controller_index = <controller>}
			current_user_id0 = (<user_id> [0])
			current_user_id1 = (<user_id> [1])
		endif
		GetGlobalTags controller = <controller> check_guid
		if (<user_id0> = <current_user_id0>)
			if (<user_id1> = <current_user_id1>)
				printf \{qs(0x2f83670c)}
				return \{true}
			endif
		endif
		printf \{qs(0xd82ab062)}
		return \{FALSE}
	else
		GetGlobalTags controller = <controller> check_guid
		if (<user_id0> = 1)
			if (<user_id1> = 1)
				printf \{qs(0x2f83670c)}
				return \{true}
			endif
		endif
		return \{FALSE}
	endif
endscript
default_topscores = [
	{
		scores = [
			19737
			18164
			17809
		]
	}
	{
		scores = [
			19737
			18164
			17809
		]
	}
	{
		scores = [
			46322
			41217
			39989
		]
	}
	{
		scores = [
			54046
			49787
			41256
		]
	}
	{
		scores = [
			64289
			61986
			55423
		]
	}
]
vocals_topscores = [
	{
		scores = [
			5239
			3782
			2457
		]
	}
	{
		scores = [
			11363
			8744
			5521
		]
	}
	{
		scores = [
			16963
			12634
			8628
		]
	}
	{
		scores = [
			22008
			17523
			12241
		]
	}
	{
		scores = [
			25326
			20546
			15136
		]
	}
]
default_songtags_with_difficulty = {
	tr_stars = [
		0
		0
		0
	]
	bestscore = 0
	beststars = 0
	achievement_gold_star = 0
	tr_percent100 = 0
	double_bass_complete = 0
	ach_double_bass_complete = 0
	stars = 0
	score = 0
	percent100 = 0
	unlocked = 0
}

script setup_custom_character_tags 
	globaltag_createarray globaltag_checksum = <globaltag_checksum> savegame = <savegame> array_name = custom_profiles max_size = ($max_num_create_a_rockers) packtype = createarocker
	GetArraySize \{$preset_musician_profiles_modifiable}
	globaltag_createarray globaltag_checksum = <globaltag_checksum> savegame = <savegame> array_name = preset_profiles max_size = <array_Size> packtype = presetcars start_full
	i = 0
	begin
	globaltag_set_preset_musician savegame = <savegame> index = <i> appearance = ($preset_musician_profiles_modifiable [<i>].appearance)
	globaltag_checksum = (<globaltag_checksum> + ($preset_musician_profiles_modifiable [<i>].Name))
	i = (<i> + 1)
	repeat <array_Size>
	return globaltag_checksum = <globaltag_checksum>
endscript
default_songtags = {
	available_on_other_client = 0
}

script get_formatted_songname \{part = 'guitar'}
	formatText checksumName = songname '%s%p%d' s = (<song_prefix>) p = <part> d = <difficulty_text_nl> AddToStringLookup = true
	return songname = <songname>
endscript

script get_formatted_songname_for_jam_mode 
	if NOT GotParam \{part}
		part = 'guitar'
	endif
	formatText TextName = songname '%s_%p_%d_quickplay' s = (<song_prefix>) p = <part> d = <difficulty_text_nl> AddToStringLookup = true
	formatText checksumName = songname2 '%s' s = <songname> AddToStringLookup = true
	return songname = <songname2>
endscript
default_venuetags = {
	unlocked = 0
}
cheat_venuetags = {
	unlocked = 1
}

script setup_venuetags 
	setup_generalvenuetags savegame = <savegame>
	GetArraySize \{$LevelZoneArray}
	level_zone_array_size = <array_Size>
	index = 0
	begin
	GetArraySize \{$instrument_progression_list}
	instrument_size = <array_Size>
	instrument_index = 0
	begin
	if GotParam \{cheat}
		venue_tags = $cheat_venuetags
	else
		venue_tags = $default_venuetags
	endif
	get_LevelZoneArray_checksum index = <index>
	if NOT StructureContains structure = ($LevelZones.<level_checksum>) debug_only
		get_progression_globals ($instrument_progression_list [<instrument_index>])
		formatText {
			checksumName = venue_checksum
			'%s_%i'
			s = ($LevelZones.<level_checksum>.Name)
			i = ($instrument_list.($<tier_global>.part).text_nl)
			AddToStringLookup = true
		}
		if StructureContains structure = ($gh4_3_intro_tier) unlocked_levels
			GetArraySize ($gh4_3_intro_tier.unlocked_levels)
			array_count = 0
			begin
			if (($gh4_3_intro_tier.unlocked_levels [<array_count>]) = <level_checksum>)
				venue_tags = {<venue_tags> unlocked = 1}
				break
			endif
			array_count = (<array_count> + 1)
			repeat <array_Size>
		endif
		SetGlobalTags savegame = <savegame> <venue_checksum> params = {(<venue_tags>)} packtype = unlockedtags
		if GotParam \{globaltag_checksum}
			<globaltag_checksum> = (<globaltag_checksum> + <venue_checksum>)
		endif
	endif
	<instrument_index> = (<instrument_index> + 1)
	repeat <instrument_size>
	<index> = (<index> + 1)
	repeat <level_zone_array_size>
	if GotParam \{globaltag_checksum}
		return globaltag_checksum = <globaltag_checksum>
	endif
endscript

script setup_generalvenuetags 
	get_LevelZoneArray_size
	level_size = <array_Size>
	array_count = 0
	begin
	get_LevelZoneArray_checksum index = <array_count>
	if NOT StructureContains structure = ($LevelZones.<level_checksum>) debug_only
		unlocked = 0
		formatText checksumName = venue_checksum 'venue_%s' s = ($LevelZones.<level_checksum>.Name) AddToStringLookup = true
		if Is_LevelZone_Downloaded level_checksum = <level_checksum>
			if (<download> = 1)
				unlocked = 1
			endif
		else
		endif
		if StructureContains structure = ($gh4_3_intro_tier) unlocked_levels
			GetArraySize ($gh4_3_intro_tier.unlocked_levels)
			i = 0
			begin
			if (($gh4_3_intro_tier.unlocked_levels [<i>]) = <level_checksum>)
				unlocked = 1
				break
			endif
			i = (<i> + 1)
			repeat <array_Size>
		endif
		if NOT GetGlobalTags savegame = <savegame> <venue_checksum> noassert = 1
			SetGlobalTags savegame = <savegame> <venue_checksum> params = {($default_venuetags) unlocked = <unlocked>} packtype = unlockedtags
		endif
	endif
	array_count = (<array_count> + 1)
	repeat <level_size>
endscript
default_charactertags = {
	unlocked = 0
}
default_songsetlisttags = {
	stars = 0
	score = 0
	percent100 = 0
	unlocked = 0
	new_song_info = 0
}

script setup_setlisttags \{globaltag_checksum = None
		Force = 0
		SongList = gh_songlist
		download = 0}
	if (<download> = 1)
		return globaltag_checksum = <globaltag_checksum>
	endif
	if GotParam \{SetList_Songs}
		tier_count = 1
		begin
		formatText checksumName = Tier 'tier%d' d = <tier_count>
		defaultunlocked = 0
		UnlockAll = 0
		if StructureContains structure = ($<SetList_Songs>.<Tier>) defaultunlocked
			<defaultunlocked> = 1
		elseif StructureContains structure = ($<SetList_Songs>.<Tier>) UnlockAll
			<UnlockAll> = 1
		endif
		if (<defaultunlocked> = 1 || <UnlockAll> = 1)
			tier_song_count = 0
			GetArraySize ($<SetList_Songs>.<Tier>.songs)
			tier_song_size = <array_Size>
			if (<tier_song_size> > 0)
				begin
				if (<defaultunlocked> = 1)
					unlock_size = ($<SetList_Songs>.<Tier>.defaultunlocked)
				else (<UnlockAll> = 1)
					unlock_size = -1
				endif
				if (<tier_song_count> < <unlock_size> || <unlock_size> = -1)
					difficulty_index = 0
					GetArraySize \{$difficulty_list}
					difficulty_size = <array_Size>
					begin
					format_globaltag_song_checksum part = <part> song = ($<SetList_Songs>.<Tier>.songs [<tier_song_count>]) difficulty_index = <difficulty_index>
					SetGlobalTags savegame = <savegame> <song_checksum> params = {unlocked = 1}
					<difficulty_index> = (<difficulty_index> + 1)
					repeat <difficulty_size>
				endif
				<tier_song_count> = (<tier_song_count> + 1)
				repeat <tier_song_size>
			endif
		endif
		<tier_count> = (<tier_count> + 1)
		repeat ($<SetList_Songs>.num_tiers)
	endif
	return globaltag_checksum = <globaltag_checksum>
endscript
default_bandtags = {
	cash = 100
	career_earnings = 100
	Name = qs(0x03ac90f0)
	font = fontgrid_title_a1
	save_created = 0
	first_play = 1
	first_battle_play = 1
	first_venue_movie_played = 0
	first_quickplay_setlist = 1
	first_career_setlist = 1
	first_setlist_drum = 1
	finalbandintro_transition_played_band = 0
	finalbandintro_transition_played_bass = 0
	finalbandintro_transition_played_drum = 0
	finalbandintro_transition_played_guitar = 0
	finalbandintro_transition_played_vocals = 0
	first_instrument_career_guitar = 0
	first_instrument_career_bass = 0
	first_instrument_career_drum = 0
	first_instrument_career_vocals = 0
	career_intro_guitar_complete = 0
	career_intro_bass_complete = 0
	career_intro_drum_complete = 0
	career_intro_vocals_complete = 0
	career_intro_band_complete = 0
	career_credits_guitar_complete = 0
	career_credits_bass_complete = 0
	career_credits_drum_complete = 0
	career_credits_vocals_complete = 0
	career_credits_band_complete = 0
	career_guitar_movies_played = 0
	career_bass_movies_played = 0
	career_drum_movies_played = 0
	career_vocals_movies_played = 0
	career_band_movies_played = 0
	career_guitar_stone_movie_played = 0
	career_bass_stone_movie_played = 0
	career_drum_stone_movie_played = 0
	career_vocals_stone_movie_played = 0
	career_band_stone_movie_played = 0
	career_guitar_prev_total_songs = 0
	career_bass_prev_total_songs = 0
	career_drum_prev_total_songs = 0
	career_vocals_prev_total_songs = 0
	career_band_prev_total_songs = 0
	band_unique_id = non_existent_checksum
	band_logo = [
		{
			base_tex = `tex\models\characters\global\global_blank_logo.dds`
			material = band_logo_primary
			diffuse
			layers = [
				{
					texture = `tex/models/characters/skater_male/decals/cag_graphics014.img`
					flags = 3
					Color = grey_4
				}
			]
		}
	]
	purchased_profiles = [
	]
	hendrix_achievement_easy = -1
	hendrix_achievement_medium = -1
	hendrix_achievement_hard = -1
	hendrix_achievement_expert = -1
	att_ballpark_band = 0
	att_ballpark_guitar = 0
	att_ballpark_bass = 0
	att_ballpark_drum = 0
	att_ballpark_vocals = 0
	load_z_s_stage = 0
	load_z_starwood = 0
	load_z_frankenstrat = 0
	load_z_drum_kit = 0
	load_z_london = 0
	load_z_rome = 0
	load_z_la_block_party = 0
	load_z_metalfest = 0
	load_z_studio2 = 0
	load_z_soundcheck2 = 0
	load_z_paris = 0
}
default_progressiontags = {
	current_difficulty = easy
	current_tier = 1
	current_song_count = 0
	encore_song = None
	career_play_song_and_end = 0
	career_using_createagig = 0
}

script setup_bandtags 
	formatText \{checksumName = default_bandname
		'band_info'
		AddToStringLookup = true}
	SetGlobalTags savegame = <savegame> <default_bandname> params = {($default_bandtags)}
	GetArraySize \{$difficulty_list}
	array_count = 0
	begin
	get_difficulty_text_nl difficulty = ($difficulty_list [<array_count>])
	get_progression_globals \{game_mode = p1_career}
	setlist_prefix = ($<tier_global>.prefix)
	formatText checksumName = gametype_checksum '%p_%s' p = <setlist_prefix> s = <difficulty_text_nl> AddToStringLookup = true
	SetGlobalTags savegame = <savegame> <gametype_checksum> params = {complete = 0} packtype = completetags
	get_progression_globals \{game_mode = p2_career}
	setlist_prefix = ($<tier_global>.prefix)
	formatText checksumName = gametype_checksum '%p_%s' p = <setlist_prefix> s = <difficulty_text_nl> AddToStringLookup = true
	SetGlobalTags savegame = <savegame> <gametype_checksum> params = {complete = 0} packtype = completetags
	array_count = (<array_count> + 1)
	repeat <array_Size>
	SetGlobalTags savegame = <savegame> Progression params = {$default_progressiontags}
endscript
override_audio_lag = -1
override_video_lag = -1

script setup_user_option_tags 
	<dolby_digital_enabled> = 0
	if isps3
		if isdolbydigitalenabled
			<dolby_digital_enabled> = 1
		endif
	endif
	SetGlobalTags savegame = <savegame> user_options params = {
		volumes = {
			guitar = {
				mic = {vol = 7 comp = 1 rev = 2}
				vocals = {vol = 7}
				backup = {vol = 7}
				guitar = {vol = 7 eq = 2}
				bass = {vol = 7 eq = 2}
				drum = {vol = 7 eq = 2}
				Crowd = {vol = 7}
				sfx = {vol = 7}
				Band = {vol = 7}
			}
		}
		dolby_digital = <dolby_digital_enabled>
		lefty_flip_save = 0
		use_tilt_for_starpower_save = 1
		enable_touch_strip_save = 1
		lefty_flip_p1 = 0
		lefty_flip_p2 = 0
		lefty_flip_p3 = 0
		lefty_flip_p4 = 0
		hyperspeed_guitar = 1.0
		hyperspeed_bass = 1.0
		hyperspeed_drum = 1.0
		airinstruments = 0
		invisiblecharacters = 0
		gem_set = standard_gems
		fx_set = standard_fx
		star_set = standard_stars
		unpause_count = 1
		lag_calibration = 0.0
		has_calibrated = 0
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
		guitar_motion_neck_left_idle = -0.63
		guitar_motion_neck_right_idle = 0.5
		guitar_motion_face_up_idle = -0.76
		guitar_motion_face_down_idle = 0.31
		gamma_brightness = 5
		vocals_highway_view_save = scrolling
		vocals_sp_clap_save = 1
		online_game_mode = 0
		online_difficulty = 0
		online_num_songs = 0
		online_tie_breaker = 0
		online_highway = 0
		ghtunes_num_songs_rated = 0
		unlock_cheat_line6unlock = 0
		unlock_cheat_alwaysslide = 0
		unlock_cheat_airinstruments = 0
		unlock_cheat_invisiblecharacters = 0
		unlock_cheat_snobcrowd = 0
		unlock_Cheat_PerformanceMode = 0
		unlock_Cheat_Hyperspeed = 0
		unlock_cheat_autokick = 0
		unlock_cheat_freedrum = 0
		unlock_cheat_unlockquickplay = 0
		unlock_cheat_unlockattballpark = 0
		unlock_cheat_gemcolor = 0
		unlock_cheat_flamecolor = 0
		unlock_cheat_starcolor = 0
		unlock_cheat_vocalfireball = 0
		unlock_cheat_buckethat = 0
		unlock_cheat_zombband = 0
		unlock_cheat_freedrum = 0
		unlock_cheat_blackhighway = 0
		cheat_index0 = 0
		cheat_index1 = 0
		cheat_index2 = 0
		cheat_index3 = 0
		cheat_index4 = 0
		cheat_index5 = 0
		cheat_index6 = 0
		cheat_index7 = 0
		cheat_index8 = 0
		cheat_index9 = 0
		cheat_index10 = 0
		cheat_index11 = 0
		cheat_index12 = 0
		cheat_index13 = 0
		cheat_index14 = 0
		cheat_index15 = 0
		cheat_index16 = 0
		cheat_index17 = 0
		cheat_index18 = 0
		cheat_index19 = 0
		cheat_index20 = 0
		cheat_index21 = 0
		cheat_index22 = 0
		cheat_index23 = 0
		cheat_index24 = 0
		cheat_index25 = 0
		cheat_index26 = 0
		cheat_index27 = 0
		cheat_index28 = 0
		cheat_index29 = 0
		cheat_index30 = 0
	}
	if NOT (override_audio_lag = -1 || $override_video_lag = -1)
		if ($override_audio_lag > 200)
			Change \{override_audio_lag = 200}
		endif
		if ($override_video_lag > 200)
			Change \{override_video_lag = 200}
		endif
		lag_calibration = (($override_audio_lag * 1000) + 1000)
		SetGlobalTags savegame = <savegame> user_options params = {lag_calibration = <lag_calibration>}
		SetGlobalTags savegame = <savegame> user_options params = {lag_calibration = (<lag_calibration> + $override_video_lag)}
	endif
endscript

script setup_online_tags 
endscript

script write_globals_to_global_tags 
endscript

script globaltag_set_preset_musician 
	RequireParams \{[
			savegame
			index
			appearance
		]}
	dest_appearance = {}
	cascopyselectiveparts \{src_appearance_name = appearance
		dest_appearance_name = dest_appearance
		part_array_name = modifiable_preset_musician_parts}
	cascopyselectiveparts \{src_appearance_name = appearance
		dest_appearance_name = dest_appearance
		part_array_name = modifiable_preset_musician_instrument_parts}
	globaltag_setarrayelement savegame = <savegame> array_name = preset_profiles index = <index> element = <dest_appearance>
endscript

script globaltag_get_preset_musician 
	RequireParams \{[
			savegame
			index
			profile_struct
		]}
	globaltag_getarrayelement savegame = <savegame> array_name = preset_profiles index = <index>
	dest_appearance = (<profile_struct>.appearance)
	cascopyselectiveparts \{src_appearance_name = element
		dest_appearance_name = dest_appearance
		part_array_name = modifiable_preset_musician_parts}
	cascopyselectiveparts \{src_appearance_name = element
		dest_appearance_name = dest_appearance
		part_array_name = modifiable_preset_musician_instrument_parts}
	return profile_struct = {<profile_struct> appearance = <dest_appearance>}
endscript

script get_checksum_of_modified_appearance 
	RequireParams \{[
			appearance
		]
		all}
	dest_appearance = {}
	cascopyselectiveparts \{src_appearance_name = appearance
		dest_appearance_name = dest_appearance
		part_array_name = modifiable_preset_musician_parts}
	cascopyselectiveparts \{src_appearance_name = appearance
		dest_appearance_name = dest_appearance
		part_array_name = modifiable_preset_musician_instrument_parts}
	generatechecksumfromstruct struct = <dest_appearance>
	return checksum = <structure_checksum>
endscript

script globaltag_check_preset_musician_modified 
	RequireParams \{[
			savegame
			index
		]
		all}
	get_checksum_of_modified_appearance appearance = (($preset_musician_profiles_modifiable [<index>]).appearance)
	original_checksum = <checksum>
	globaltag_get_preset_musician savegame = <savegame> profile_struct = ($preset_musician_profiles_modifiable [<index>]) index = <index>
	get_checksum_of_modified_appearance appearance = (<profile_struct>.appearance)
	if (<original_checksum> = <checksum>)
		return \{FALSE}
	endif
	return \{true}
endscript

script restore_globals_from_global_tags \{callmonitorcontrollerstates = 1}
	if GotParam \{savegame}
		savegame_to_reset = <savegame>
	else
		savegame_to_reset = -1
	endif
	<i> = 1
	begin
	getplayerinfo Player = <i> controller
	get_savegame_from_controller controller = <controller>
	if (<savegame_to_reset> = <savegame> ||
			<savegame_to_reset> = -1)
		GetGlobalTags savegame = <savegame> user_options
		formatText checksumName = player_status 'player%i_status' i = <i> AddToStringLookup
		Change structurename = <player_status> lefty_flip = <lefty_flip_save>
		Change structurename = <player_status> vocals_highway_view = <vocals_highway_view_save>
		Change structurename = <player_status> vocals_sp_clap = <vocals_sp_clap_save>
		Change structurename = <player_status> use_tilt_for_starpower = <use_tilt_for_starpower_save>
		Change structurename = <player_status> enable_touch_strip = <enable_touch_strip_save>
	endif
	<i> = (<i> + 1)
	repeat 4
	if (<callmonitorcontrollerstates> = 1)
		monitorcontrollerstates
	endif
endscript

script setup_training_tags 
	SetGlobalTags savegame = <savegame> training params = {basic_lesson = not_complete
		star_power_lesson = not_complete
		advanced_techniques_lesson = not_complete
		new_features_lesson = not_complete
		drum_basic_lesson = not_complete
		drum_int_lesson = not_complete
		vocals_lesson = not_complete
		band_lesson = not_complete
		versus_lesson = not_complete
		has_prompt_guitar_tutorial = not_complete
		has_prompt_bass_tutorial = not_complete
		has_prompt_drum_tutorial = not_complete
		has_prompt_vocal_tutorial = not_complete
		rs_introduction_lesson = not_complete
		rs_lead_and_bass_lesson = not_complete
		rs_rhythm_lesson = not_complete
		rs_drums_lesson = not_complete
		rs_melody_lesson = not_complete
		rs_recording_lesson = not_complete
		rs_pro_guitar_lesson = not_complete
		rs_advanced_tools_lesson = not_complete
		rs_ghmix_editing_lesson = not_complete
		rs_ghmix_pro_techniques_tools_lesson = not_complete
	}
endscript

script reset_transient_tags 
	SetGlobalTags savegame = <savegame> venue_intro_flags params = {
		z_s_stage = 0
		z_starwood = 0
		z_frankenstrat = 0
		z_drum_kit = 0
		z_london = 0
		z_rome = 0
		z_la_block_party = 0
		z_metalfest = 0
		z_studio2 = 0
		z_studio = 0
		z_soundcheck2 = 0
		z_paris = 0
	}
endscript

script setup_unlocks \{globaltag_checksum = None}
	GetArraySize ($Bonus_videos)
	index = 0
	begin
	unlocked = 1
	if NOT StructureContains structure = ($Bonus_videos [<index>]) unlocked
		unlocked = 0
	endif
	video_checksum = ($Bonus_videos [<index>].id)
	SetGlobalTags savegame = <savegame> <video_checksum> params = {unlocked = <unlocked>} packtype = unlockedtags
	globaltag_checksum = (<globaltag_checksum> + <video_checksum>)
	<index> = (<index> + 1)
	repeat <array_Size>
	return globaltag_checksum = <globaltag_checksum>
endscript

script GlobalTags_UnlockAll songs_only = 0 difficulty = ($player1_status.difficulty)
	get_savegame_from_controller controller = ($primary_controller)
	create_loading_screen
	if NOT (<songs_only> = 1)
		array_count = 0
		GetArraySize \{$preset_musician_profiles_locked}
		if (<array_Size>)
			begin
			if StructureContains structure = ($preset_musician_profiles_locked [<array_count>]) locked
				unlock_profile id = ($preset_musician_profiles_locked [<array_count>].Name) savegame = <savegame>
			endif
			array_count = (<array_count> + 1)
			repeat <array_Size>
		endif
		array_count = 0
		GetArraySize \{$Bonus_videos}
		if (<array_Size>)
			begin
			SetGlobalTags savegame = <savegame> ($Bonus_videos [<array_count>].id) params = {unlocked = 1}
			array_count = (<array_count> + 1)
			repeat <array_Size>
		endif
	endif
	array_count = 0
	begin
	setlist_prefix = ($<SongList>.prefix)
	formatText checksumName = tiername '%ptier%i' p = <setlist_prefix> i = (<array_count> + 1)
	formatText checksumName = tier_checksum 'tier%s' s = (<array_count> + 1)
	if NOT GlobalExists Name = <SongList> Type = structure
		ScriptAssert '%s does not exist' s = <SongList> donotresolve
	endif
	if NOT StructureContains structure = ($<SongList>) <tier_checksum>
		ScriptAssert '%s not found in $ %d' s = <tier_checksum> d = <SongList> donotresolve
	endif
	if NOT StructureContains structure = ($<SongList>.<tier_checksum>) songs
		ScriptAssert 'songs not found in $ %d . %s' d = <SongList> s = <tier_checksum> donotresolve
	endif
	GetArraySize ($<SongList>.<tier_checksum>.songs)
	song_count = 0
	begin
	setlist_prefix = ($<SongList>.prefix)
	format_globaltag_song_checksum part = ($<SongList>.part) song = ($<SongList>.<tier_checksum>.songs [<song_count>]) difficulty = <difficulty>
	stars = 5
	if (<song_count> = <array_Size> - 1)
		if StructureContains structure = ($<SongList>.<tier_checksum>) end_with_credits
			stars = 0
		endif
	endif
	if (<songs_only> = 1)
		SetGlobalTags savegame = <savegame> <song_checksum> params = {unlocked = 1}
	else
		SetGlobalTags savegame = <savegame> <song_checksum> params = {stars = <stars>
			score = 1000000
			unlocked = 1}
		get_difficulty_text_nl difficulty = <difficulty>
		get_song_prefix song = ($<SongList>.<tier_checksum>.songs [<song_count>])
		get_formatted_songname song_prefix = <song_prefix> difficulty_text_nl = <difficulty_text_nl>
		SetGlobalTags savegame = <savegame> <songname> params = {achievement_gold_star = 1}
	endif
	song_count = (<song_count> + 1)
	repeat <array_Size>
	array_count = (<array_count> + 1)
	repeat ($<SongList>.num_tiers)
	setup_venuetags \{cheat}
	destroy_loading_screen
endscript
instrument_progression_list = [
	career_guitar
	career_bass
	career_drum
	career_vocals
	career_band
]
instrument_progression_list_nl_strings = {
	career_guitar = 'guitar'
	career_bass = 'bass'
	career_drum = 'drum'
	career_vocals = 'vocals'
	career_band = 'band'
}
unlock_order_list = [
	gh4_career_guitar_progression_unlock_order
	gh4_career_bass_progression_unlock_order
	gh4_career_drum_progression_unlock_order
	gh4_career_vocals_progression_unlock_order
	gh4_career_band_progression_unlock_order
]

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
	if NOT GotParam \{game_mode}
		SoftAssert \{qs(0xc2bbf7ca)}
		return
	endif
	return ui_string = ($game_mode_ui_strings.<game_mode>)
endscript
game_mode_ui_strings = {
	p1_career = qs(0x5a4f279f)
	p2_career = qs(0x5a4f279f)
	p1_quickplay = qs(0x388d2deb)
	p2_quickplay = qs(0x330c43bc)
	p2_faceoff = qs(0x3de98a36)
	p2_pro_faceoff = qs(0x4bf74995)
	p2_battle = qs(0xb7847855)
	p2_coop = qs(0x977b1176)
}

script get_difficulty_ui_string 
	if NOT GotParam \{difficulty}
		SoftAssert \{qs(0x719013b6)}
		return
	endif
	return ui_string = ($game_difficulty_ui_strings.<difficulty>)
endscript
game_difficulty_ui_strings = {
	easy = qs(0xbf7ffd2d)
	medium = qs(0xeac0f52d)
	hard = qs(0x63aae385)
	expert = qs(0xb778e780)
}
game_mode_names = {
	p1_career = 'p1_career'
	p2_career = 'p2_career'
	p1_quickplay = 'p1_quickplay'
	p2_quickplay = 'p2_quickplay'
	p2_faceoff = 'p2_faceoff'
	p2_pro_faceoff = 'p2_pro_faceoff'
	p4_pro_faceoff = 'p4_pro_faceoff'
	p2_battle = 'p2_battle'
	p8_pro_faceoff = 'p8_pro_faceoff'
	p2_coop = 'p2_coop'
	p4_quickplay = 'p4_quickplay'
	training = 'training'
	tutorial = 'tutorial'
}

script get_band_game_mode_name 
	game_mode_name = ($game_mode_names.p1_career)
	return game_mode_name = <game_mode_name>
endscript

script get_game_mode_name 
	return game_mode_name = ($game_mode_names.$game_mode)
endscript

script get_current_band_info 
	return \{band_info = band_info}
endscript

script get_current_band_checksum 
	return \{band_checksum = career_band}
endscript

script set_current_band_part_flags 
	RequireParams \{[
			desc_id
			part
		]
		all}
	if GotParam \{unlocked}
		flag = {unlocked}
	endif
	if GotParam \{purchased}
		flag = {purchased}
	endif
	get_current_band_info
	GetGlobalTags <band_info> savegame = <savegame>
	if NOT GotParam \{unlock_purchased}
		initilize_current_band_unlock_purchase
	endif
	if NOT StructureContains structure = <unlock_purchased> <part>
		ScriptAssert qs(0x8ecf4b3a) p = <part>
	endif
	unlock_purchased_struct = (<unlock_purchased>.<part>)
	GetArraySize \{unlock_purchased_struct}
	if (<array_Size> > 0)
		i = 0
		begin
		if (((<unlock_purchased_struct> [<i>]).desc_id) = <desc_id>)
			SetArrayElement ArrayName = unlock_purchased_struct index = <i> NewValue = {(<unlock_purchased_struct> [<i>]) desc_id = <desc_id> <flag>}
			AddParam Name = <part> structure_name = new_entry value = <unlock_purchased_struct>
			unlock_purchased = {<unlock_purchased> <new_entry>}
			lockglobaltags \{OFF}
			SetGlobalTags <band_info> params = {unlock_purchased = <unlock_purchased>} savegame = <savegame>
			lockglobaltags
			return
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	AddArrayElement array = <unlock_purchased_struct> element = {desc_id = <desc_id> <flag>}
	AddParam Name = <part> structure_name = new_entry value = <array>
	unlock_purchased = {<unlock_purchased> <new_entry>}
	lockglobaltags \{OFF}
	SetGlobalTags <band_info> params = {unlock_purchased = <unlock_purchased>} savegame = <savegame>
	lockglobaltags
	return
endscript

script initilize_current_band_unlock_purchase 
	GetArraySize ($master_editable_list)
	i = 0
	begin
	AddParam Name = ((($master_editable_list) [<i>]).part) value = []
	i = (<i> + 1)
	repeat <array_Size>
	RemoveParameter \{i}
	RemoveParameter \{array_Size}
	unlock_purchased = {<...>}
	return unlock_purchased = <unlock_purchased>
endscript

script unlock_purchase_all_cas_parts 
	GetArraySize ($master_editable_list)
	master_list_size = <array_Size>
	i = 0
	begin
	part = ((($master_editable_list) [<i>]).part)
	GetArraySize ($<part>)
	j = 0
	begin
	if StructureContains structure = (($<part>) [<j>]) locked
		set_current_band_part_flags part = <part> desc_id = ((($<part>) [<j>]).desc_id) unlocked
	endif
	if StructureContains structure = (($<part>) [<j>]) price
		set_current_band_part_flags part = <part> desc_id = ((($<part>) [<j>]).desc_id) purchased
	endif
	j = (<j> + 1)
	repeat <array_Size>
	i = (<i> + 1)
	repeat <master_list_size>
endscript

script get_current_band_part_flags 
	RequireParams \{[
			desc_id
			part
		]
		all}
	get_current_band_info
	GetGlobalTags <band_info> savegame = <savegame>
	if NOT GotParam \{unlock_purchased}
		return
	endif
	if NOT StructureContains structure = <unlock_purchased> <part>
		ScriptAssert qs(0x8ecf4b3a) p = <part>
	endif
	unlock_purchased_struct = (<unlock_purchased>.<part>)
	GetArraySize \{unlock_purchased_struct}
	if (<array_Size> > 0)
		i = 0
		begin
		if (((<unlock_purchased_struct> [<i>]).desc_id) = <desc_id>)
			return part_flags = (<unlock_purchased_struct> [<i>])
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
endscript

script get_current_band_name 
	get_current_band_info
	GetGlobalTags <band_info>
	return band_name = <Name>
endscript

script setup_achievement_tags 
	SetGlobalTags savegame = <savegame> achievement_info params = {
		total_cash_in_career_mode = 0
		num_online_matches_played = 0
		venues_played = {
			load_z_soundcheck2 = 0
			load_z_studio2 = 0
			load_z_metalfest = 0
			load_z_la_block_party = 0
			load_z_rome = 0
			load_z_london = 0
			load_z_drum_kit = 0
			load_z_frankenstrat = 0
			load_z_starwood = 0
			load_z_s_stage = 0
			load_z_paris = 0
		}
		achievement_all_instruments = 0
		green_notes_exist = 0
		green_note_missed = 0
	}
endscript

script setup_cas_helper_tags 
	SetGlobalTags savegame = <savegame> cas_helper_dialogue params = {
		visit_cag = 0
		visit_cap = 0
		visit_cadrm = 0
		visit_deformation = 0
		visit_outfit = 0
		guitar_category = gh
		bass_category = gh
	}
endscript

script set_online_match_info \{Ranked = 0
		won = 0
		HOST = 0
		standard_controller = 0}
endscript
default_gig_tags = {
	unlocked = 0
	first_time_unlocked = 0
	completed = 0
	started = 0
	encore_unlocked = 0
	boss_unlocked = 0
	cash_earned = 0
}
default_special_event_gig_tags = {
	unlocked = 0
	completed = -1
	challenge1_unlocked = 1
	challenge2_unlocked = 0
	challenge3_unlocked = 0
	challenge1_completed = 0
	challenge2_completed = 0
	challenge3_completed = 0
}
default_pay_to_play_gig_tags = {
	unlocked = 0
	first_time_unlocked = 0
	completed = -1
	cash_earned = 0
}

script setup_gigtags \{globaltag_checksum = None
		use_cheat_tags = 0}
	if NOT GotParam \{unlock_order}
		unlock_order = gh4_career_band_progression_unlock_order
		if (<part> = guitar)
			unlock_order = gh4_career_guitar_progression_unlock_order
		elseif (<part> = drum)
			unlock_order = gh4_career_drum_progression_unlock_order
		elseif (<part> = bass)
			unlock_order = gh4_career_bass_progression_unlock_order
		elseif (<part> = vocals)
			unlock_order = gh4_career_vocals_progression_unlock_order
		endif
	endif
	setlist_prefix = ($<unlock_order>.Name)
	cheat_tags = {}
	if (<use_cheat_tags> = 1)
		<cheat_tags> = {unlocked = 1 encore_unlocked = 1 boss_unlocked = 1 started = 1}
	endif
	free_gig = 1
	begin
	formatText checksumName = gignum 'gig%d' d = <free_gig>
	if NOT StructureContains structure = ($<unlock_order>.freegigs) <gignum>
		break
	endif
	gig = ($<unlock_order>.freegigs.<gignum>.Name)
	format_globaltag_gigname setlist_prefix = <setlist_prefix> gig = <gig>
	additional_tags = {}
	if StructureContains structure = ($<unlock_order>.freegigs.<gignum>) debug_dont_unlock
		<additional_tags> = {completed = -1}
	endif
	SetGlobalTags {
		savegame = <savegame>
		<gig_name>
		params = {($default_gig_tags) <additional_tags> unlocked = 1}
		packtype = gigtags
	}
	globaltag_checksum = (<globaltag_checksum> + <gig_name>)
	formatText checksumName = Tier 'tier%d' d = ($<unlock_order>.freegigs.<gignum>.num)
	song_count = 0
	GetArraySize ($<SetList_Songs>.<Tier>.songs)
	begin
	SetGlobalTags savegame = <savegame> ($<SetList_Songs>.<Tier>.songs [<song_count>]) params = {unlocked = 1}
	<song_count> = (<song_count> + 1)
	repeat <array_Size>
	<free_gig> = (<free_gig> + 1)
	repeat
	set_num = 1
	begin
	formatText checksumName = setnum 'unlockset%d' d = <set_num>
	if NOT StructureContains structure = $<unlock_order> <setnum>
		break
	endif
	if StructureContains structure = ($<unlock_order>.<setnum>) None
		format_globaltag_gigname setlist_prefix = <setlist_prefix> gig = ($<unlock_order>.<setnum>.None)
		SetGlobalTags {
			savegame = <savegame>
			<gig_name>
			params = {($default_gig_tags) <cheat_tags>}
			packtype = gigtags
		}
		globaltag_checksum = (<globaltag_checksum> + <gig_name>)
	endif
	gig_num = 1
	begin
	formatText checksumName = gignum 'gig%d' d = <gig_num>
	if NOT StructureContains structure = ($<unlock_order>.<setnum>) <gignum>
		break
	endif
	gig = ($<unlock_order>.<setnum>.<gignum>.Name)
	format_globaltag_gigname setlist_prefix = <setlist_prefix> gig = <gig>
	SetGlobalTags {
		savegame = <savegame>
		<gig_name>
		params = {($default_gig_tags) <cheat_tags>}
		packtype = gigtags
	}
	globaltag_checksum = (<globaltag_checksum> + <gig_name>)
	<gig_num> = (<gig_num> + 1)
	repeat
	paytoplay_num = 1
	begin
	formatText checksumName = paytoplaynum 'pay_to_play%d' d = <paytoplay_num>
	if NOT StructureContains structure = ($<unlock_order>.<setnum>) <paytoplaynum>
		break
	endif
	gig = ($<unlock_order>.<setnum>.<paytoplaynum>.Name)
	format_globaltag_gigname setlist_prefix = <setlist_prefix> gig = <gig>
	SetGlobalTags savegame = <savegame> <gig_name> params = {($default_pay_to_play_gig_tags) <cheat_tags>} packtype = gigtags
	globaltag_checksum = (<globaltag_checksum> + <gig_name>)
	<paytoplay_num> = (<paytoplay_num> + 1)
	repeat
	<set_num> = (<set_num> + 1)
	repeat
	if StructureContains structure = $<unlock_order> freegigs_last
		free_gig = 1
		begin
		formatText checksumName = gignum 'gig%d' d = <free_gig>
		if NOT StructureContains structure = ($<unlock_order>.freegigs_last) <gignum>
			break
		endif
		gig = ($<unlock_order>.freegigs_last.<gignum>.Name)
		format_globaltag_gigname setlist_prefix = <setlist_prefix> gig = <gig>
		additional_tags = {}
		if StructureContains structure = ($<unlock_order>.freegigs_last.<gignum>) debug_dont_unlock
			<additional_tags> = {completed = -1}
		endif
		SetGlobalTags {
			savegame = <savegame>
			<gig_name>
			params = {($default_gig_tags) <additional_tags>}
			packtype = gigtags
		}
		globaltag_checksum = (<globaltag_checksum> + <gig_name>)
		<free_gig> = (<free_gig> + 1)
		repeat
	endif
	return globaltag_checksum = <globaltag_checksum>
endscript

script format_globaltag_song_checksum difficulty = ($player1_status.difficulty)
	if GotParam \{song}
		get_song_name song = <song>
	endif
	if GotParam \{difficulty_index}
		get_difficulty_text_nl index = <difficulty_index>
	else
		if NOT GotParam \{difficulty_text_nl}
			get_difficulty_text_nl difficulty = <difficulty>
		endif
	endif
	if NOT GotParam \{part}
		part = guitar
	endif
	if NOT GotParam \{part_text}
		part_text = ($instrument_list.<part>.text_nl)
	endif
	formatText checksumName = song_checksum '%s%p%d' s = <song_name> p = <part_text> d = <difficulty_text_nl> AddToStringLookup = true
	return song_checksum = <song_checksum>
endscript

script format_globaltag_gigname 
	RequireParams \{[
			setlist_prefix
		]
		all}
	if GotParam \{gignum}
		formatText TextName = gig 'gig%g' g = (<gignum>)
	endif
	formatText checksumName = gig_name '%s_%g' s = <setlist_prefix> g = <gig> AddToStringLookup = true
	return gig_name = <gig_name>
endscript

script setup_quickplay_song_tags 
	if GotParam \{allsongs}
		GetArraySize ($gh_songlist)
		i = 0
		begin
		song = ($gh_songlist [<i>])
		get_song_saved_in_globaltags song = <song>
		if (<saved_in_globaltags> = 1)
			SetGlobalTags savegame = <savegame> <song> params = {unlocked = 0}
		endif
		i = (<i> + 1)
		repeat <array_Size>
		return
	endif
	if NOT GotParam \{unlock_order}
		unlock_order = gh4_career_band_progression_unlock_order
		if (<part> = guitar)
			unlock_order = gh4_career_guitar_progression_unlock_order
		elseif (<part> = drum)
			unlock_order = gh4_career_drum_progression_unlock_order
		elseif (<part> = bass)
			unlock_order = gh4_career_bass_progression_unlock_order
		elseif (<part> = vocals)
			unlock_order = gh4_career_vocals_progression_unlock_order
		endif
	endif
	free_gig = 1
	begin
	formatText checksumName = gignum 'gig%d' d = <free_gig>
	if NOT StructureContains structure = ($<unlock_order>.freegigs) <gignum>
		break
	endif
	formatText checksumName = Tier 'tier%d' d = ($<unlock_order>.freegigs.<gignum>.num)
	song_count = 0
	GetArraySize ($<SetList_Songs>.<Tier>.songs)
	begin
	SetGlobalTags savegame = <savegame> ($<SetList_Songs>.<Tier>.songs [<song_count>]) params = {unlocked = 1}
	<globaltag_checksum> = (<globaltag_checksum> + ($<SetList_Songs>.<Tier>.songs [<song_count>]))
	<song_count> = (<song_count> + 1)
	repeat <array_Size>
	<free_gig> = (<free_gig> + 1)
	repeat
	return globaltag_checksum = <globaltag_checksum>
endscript

script set_band_character_id_globaltag 
	if band_builder_is_random character_id = <character_id>
		return
	endif
	if (($is_network_game = 0) && (($game_mode = p2_battle) || ($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff)))
		RequireParams \{[
				savegame
				Player
				character_id
			]}
		player_index = (<Player> -1)
		printf 'set_band_character_id_globaltag h2h savegame=%d player_index=%i char=%c' d = <savegame> i = <player_index> c = <character_id>
		GetGlobalTags savegame = <savegame> last_h2h_characters
		SetArrayElement ArrayName = last_h2h_characters index = <player_index> NewValue = <character_id>
		SetGlobalTags savegame = <savegame> last_h2h_characters params = {last_h2h_characters = <last_h2h_characters>}
		formatText checksumName = player_status 'player%d_status' d = <Player>
		get_savegame_from_player_status player_status = <player_status>
		printf 'set_band_character_id_globaltag h2h savegame=%d last_h2h_xbox_character=%c' d = <savegame> c = <character_id>
		SetGlobalTags savegame = <savegame> last_h2h_xbox_character params = {last_h2h_xbox_character = <character_id>}
		return
	endif
	if (($band_mode_mode = career) || ($is_network_game = 1))
		printf 'set_band_character_id_globaltag savegame=%d controller=%i char=%c' d = <savegame> i = <controller> c = <character_id>
		RequireParams \{[
				savegame
				controller
				character_id
			]}
		if (<controller> >= 4)
			return
		endif
		GetGlobalTags savegame = <savegame> last_band_characters
		SetArrayElement ArrayName = last_band_characters index = <controller> NewValue = <character_id>
		SetGlobalTags savegame = <savegame> last_band_characters params = {last_band_characters = <last_band_characters>}
		get_savegame_from_controller controller = <controller>
		printf 'set_band_character_id_globaltag savegame=%d last_band_xbox_character=%c' d = <savegame> c = <character_id>
		SetGlobalTags savegame = <savegame> last_band_xbox_character params = {last_band_xbox_character = <character_id>}
	endif
endscript

script get_last_band_character_recorded 
	RequireParams \{[
			Player
			part
		]
		all}
	formatText checksumName = player_status 'player%p_status' p = <Player>
	controller = ($<player_status>.controller)
	if GotParam \{no_band_leader_grab}
		get_savegame_from_player_status player_status = <player_status>
	else
		get_savegame_from_player_status band_character_select player_status = <player_status>
	endif
	if (($is_network_game = 0) && (($game_mode = p2_battle) || ($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff)))
		if isXenon
			if NOT GotParam \{borrowed_from_band_leader}
				GetGlobalTags savegame = <savegame> last_h2h_xbox_character
				character_id = <last_h2h_xbox_character>
			endif
		endif
		if NOT GotParam \{character_id}
			player_index = (<Player> -1)
			if (<player_index> >= 2)
				return \{character_id = None}
			endif
			GetGlobalTags savegame = <savegame> last_h2h_characters
			character_id = (<last_h2h_characters> [<player_index>])
		endif
	else
		if isXenon
			if NOT GotParam \{borrowed_from_band_leader}
				GetGlobalTags savegame = <savegame> last_band_xbox_character
				character_id = <last_band_xbox_character>
			endif
		endif
		if NOT GotParam \{character_id}
			if (<controller> >= 4)
				return \{character_id = None}
			endif
			GetGlobalTags savegame = <savegame> last_band_characters
			character_id = (<last_band_characters> [<controller>])
		endif
	endif
	if NOT profile_exists id = <character_id> savegame = <savegame>
		character_id = None
	else
		get_musician_profile_struct_by_id id = <character_id> savegame = <savegame> dont_assert
		if NOT is_allowed_part profile_struct = <profile_struct> part = <part>
			printf 'get_last_band_character_recorded - %c not allowed for %s' c = <character_id> s = <part>
			character_id = None
		endif
	endif
	return character_id = <character_id> borrowed_from_band_leader = <borrowed_from_band_leader>
endscript

script setup_saved_instrument_tags 
	globaltag_createarray globaltag_checksum = <globaltag_checksum> savegame = <savegame> array_name = player_created_graphics_save max_size = ($max_num_logo_saves) packtype = logos
	globaltag_createarray globaltag_checksum = <globaltag_checksum> savegame = <savegame> array_name = player_guitar_save max_size = ($max_num_instrument_saves) packtype = guitars
	globaltag_createarray globaltag_checksum = <globaltag_checksum> savegame = <savegame> array_name = player_bass_save max_size = ($max_num_instrument_saves) packtype = basses
	globaltag_createarray globaltag_checksum = <globaltag_checksum> savegame = <savegame> array_name = player_drum_save max_size = ($max_num_instrument_saves) packtype = drums
	globaltag_createarray globaltag_checksum = <globaltag_checksum> savegame = <savegame> array_name = player_mic_save max_size = ($max_num_instrument_saves) packtype = vocals
	return globaltag_checksum = <globaltag_checksum>
endscript

script globaltag_createarray 
	RequireParams \{[
			savegame
			array_name
			max_size
			packtype
		]
		all}
	SetGlobalTags savegame = <savegame> <array_name> params = {valid_entries = [] max_size = <max_size>}
	i = 0
	begin
	formatText TextName = arrayappend '_array%d' d = <i>
	ExtendCrc <array_name> <arrayappend> out = arrayid
	SetGlobalTags savegame = <savegame> <arrayid> params = {contents = {}} packtype = <packtype>
	globaltag_checksum = (<globaltag_checksum> + <arrayid>)
	i = (<i> + 1)
	repeat <max_size>
	if GotParam \{start_full}
		i = 0
		begin
		globaltag_addarrayelement savegame = <savegame> array_name = <array_name> element = {}
		i = (<i> + 1)
		repeat <max_size>
	endif
	return globaltag_checksum = <globaltag_checksum>
endscript

script globaltag_getarraysize 
	RequireParams \{[
			savegame
			array_name
		]
		all}
	GetGlobalTags savegame = <savegame> <array_name>
	GetArraySize <valid_entries>
	return array_Size = <array_Size>
endscript

script globaltag_getarrayelement 
	RequireParams \{[
			savegame
			array_name
			index
		]
		all}
	GetGlobalTags savegame = <savegame> <array_name>
	GetArraySize <valid_entries>
	if (<index> < <array_Size>)
		GetGlobalTags savegame = <savegame> (<valid_entries> [<index>])
		return true element = <contents>
	endif
	return \{FALSE}
endscript

script globaltag_setarrayelement 
	RequireParams \{[
			savegame
			array_name
			index
			element
		]
		all}
	GetGlobalTags savegame = <savegame> <array_name>
	GetArraySize <valid_entries>
	if (<index> < <array_Size>)
		SetGlobalTags savegame = <savegame> (<valid_entries> [<index>]) params = {contents = <element>}
		return \{true}
	endif
	return \{FALSE}
endscript

script globaltag_addarrayelement 
	RequireParams \{[
			savegame
			array_name
			element
		]
		all}
	GetGlobalTags savegame = <savegame> <array_name>
	GetArraySize <valid_entries>
	if (<array_Size> < <max_size>)
		i = 0
		begin
		formatText TextName = arrayappend '_array%d' d = <i>
		ExtendCrc <array_name> <arrayappend> out = arrayid
		if NOT ArrayContains array = <valid_entries> contains = <arrayid>
			AddArrayElement array = <valid_entries> element = <arrayid>
			SetGlobalTags savegame = <savegame> <array_name> params = {valid_entries = <array> max_size = <max_size>}
			SetGlobalTags savegame = <savegame> <arrayid> params = {contents = <element>}
			return \{true}
		endif
		i = (<i> + 1)
		repeat (<array_Size> + 1)
	endif
	return \{FALSE}
endscript

script globaltag_removearrayelement 
	RequireParams \{[
			savegame
			array_name
			index
		]
		all}
	GetGlobalTags savegame = <savegame> <array_name>
	GetArraySize <valid_entries>
	if (<array_Size> <= <max_size>)
		RemoveArrayElement array = <valid_entries> index = <index>
		SetGlobalTags savegame = <savegame> <array_name> params = {valid_entries = <array> max_size = <max_size>}
		return \{true}
	endif
	return \{FALSE}
endscript

script globaltag_getarraychecksum 
	RequireParams \{[
			savegame
			array_name
		]
		all}
	array_checksum = arse
	globaltag_getarraysize savegame = <savegame> array_name = <array_name>
	if (<array_Size> > 0)
		i = 0
		begin
		globaltag_getarrayelement savegame = <savegame> array_name = <array_name> index = <i>
		generatechecksumfromstruct \{structname = element}
		array_checksum = (<array_checksum> + <structure_checksum>)
		i = (<i> + 1)
		repeat <array_Size>
	endif
	return array_checksum = <array_checksum>
endscript
neversoft_hiscore_names = [
	qs(0x99879b78)
	qs(0x321df572)
	qs(0xf01ce8d7)
	qs(0x683ba910)
	qs(0x2f64a941)
	qs(0x21d0e822)
	qs(0x5f0a60ca)
	qs(0xb2d47f93)
	qs(0xdaf613d7)
	qs(0x34f8e50d)
	qs(0x64016704)
	qs(0xaa3ec6e6)
	qs(0x57b179b6)
	qs(0xf233f310)
	qs(0xa39c9536)
	qs(0x7de26620)
	qs(0x00eae894)
	qs(0xfe04b0c2)
	qs(0x2b2f13d7)
	qs(0x305b59fc)
	qs(0x5ac6c520)
	qs(0x716dfdf3)
	qs(0xef486ee8)
	qs(0x3e8ec06f)
	qs(0xe53396c9)
	qs(0x0d219d8d)
	qs(0xe33f58ed)
	qs(0xbbd42b9d)
	qs(0x9abd0192)
	qs(0x0bf35714)
	qs(0x18b25bcd)
	qs(0x4cea8229)
	qs(0x6c1ea81c)
	qs(0x083b358f)
	qs(0x1ee83e99)
	qs(0xbb540a7d)
	qs(0x280e8d77)
	qs(0x4c610731)
	qs(0xd4408c6d)
	qs(0xe18bcf47)
	qs(0xeea238e8)
	qs(0x6fbabc98)
	qs(0x47cd0ef7)
	qs(0x8af031d8)
	qs(0x5f1421a5)
	qs(0x043797ff)
	qs(0x91c07a9a)
	qs(0x0b9f32c8)
	qs(0x34259644)
	qs(0x85f9c252)
	qs(0x7900ba58)
	qs(0xeeb56acb)
	qs(0x3845ea03)
	qs(0xa95ad542)
	qs(0xa2dffa5f)
	qs(0x5dbd3089)
	qs(0x2d8e7b78)
	qs(0x3e6b6155)
	qs(0x87dfe1cd)
	qs(0xd7c977c1)
	qs(0x3f6bc870)
	qs(0x977faadb)
	qs(0x5682fffa)
	qs(0x03e87bc0)
	qs(0xd68dc84b)
	qs(0xb4db3fcc)
	qs(0xc1d55c97)
	qs(0x748b04e5)
	qs(0x24a347de)
]
