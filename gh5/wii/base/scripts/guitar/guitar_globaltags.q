debug_saves = 0
globaltag_checksum = empty
default_audio_lag = 0.0
default_video_lag = 0.0
fake_dlc_song_savegame_entries = 0
num_savegame_progressions = 4
debug_unlockall_on_boot = 0
guitar_globaltags_loaded = 0

script reset_globaltags \{savegame = 0}
	globaltag_checksum = initial_v291
	lockglobaltags \{freeplay_check_off}
	lockglobaltags \{OFF}
	savegamereset savegame = <savegame>
	printf 'Resetting GlobalTags for savegame %d' d = <savegame>
	setupsongtags savegame = <savegame> globaltag_checksum = <globaltag_checksum> part = 'guitar'
	conditional_async_wait async = <async>
	setupsongtags savegame = <savegame> globaltag_checksum = <globaltag_checksum> part = 'bass'
	conditional_async_wait async = <async>
	setupsongtags savegame = <savegame> globaltag_checksum = <globaltag_checksum> part = 'drum'
	conditional_async_wait async = <async>
	setupsongtags savegame = <savegame> globaltag_checksum = <globaltag_checksum> part = 'vocals'
	conditional_async_wait async = <async>
	setupsongtags savegame = <savegame> globaltag_checksum = <globaltag_checksum> part = 'band'
	conditional_async_wait async = <async>
	setup_quickplay_song_tags savegame = <savegame> allsongs
	conditional_async_wait async = <async>
	setup_user_option_tags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	setup_tutorial_tags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	setup_unlocks savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	setup_custom_character_tags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	conditional_async_wait async = <async>
	setup_unlock_tags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	SetGlobalTags savegame = <savegame> net params = {prev_net_settings = local}
	reset_transient_tags savegame = <savegame>
	setup_achievement_tags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	setup_cas_helper_tags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	setup_saved_instrument_tags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	jam_reset_controller_directory_listing savegame = <savegame>
	Change \{ghtunes_verified = 0}
	setup_playlist_tags savegame = <savegame>
	setup_songlist_tags savegame = <savegame>
	conditional_async_wait async = <async> text = qs(0x7aad5055)
	setup_progression_slots savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	setup_download_song_killswitch savegame = <savegame>
	conditional_async_wait async = <async> text = qs(0x5fc60f89)
	getpackedstructvaliditychecksum
	globaltag_checksum = (<globaltag_checksum> + <validity_checksum>)
	SetGlobalTags savegame = <savegame> globaltag_checksum params = {globaltag_checksum = <globaltag_checksum>}
	SetGlobalTags \{slot_illumination
		params = {
			Enabled = 1
		}}
	lockglobaltags
	lockglobaltags \{freeplay_check_on}
	sanity_check_fix_deleted_characters
endscript
default_progression_name = qs(0x4de75715)
default_progressionheader = {
	progression_name = qs(0x4dcda8f7)
	stars = 0
	progression_in_use = 0
}

script setup_progression_slots 
	i = 0
	begin
	reset_progression_slot savegame = <savegame> slot = <i> globaltag_checksum = <globaltag_checksum>
	i = (<i> + 1)
	repeat $num_savegame_progressions
	savegamesetprogression savegame = <savegame> no_progression
	savegamesetprogression savegame = <savegame> Progression = 0
	SetGlobalTags savegame = <savegame> progression_header0 params = {progression_name = ($default_progression_name) progression_in_use = 1}
	conditional_async_wait async = <async>
	return globaltag_checksum = <globaltag_checksum>
endscript

script reset_progression_slot \{async = 0}
	RequireParams \{[
			savegame
			slot
		]
		all}
	savegamesetprogression savegame = <savegame> Progression = <slot>
	conditional_async_wait async = <async>
	lockglobaltags \{push_progression_writes_only}
	savegamereset savegame = <savegame> progression_only
	setup_progression_globaltags async = <async> savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	conditional_async_wait async = <async>
	reset_progression_atoms savegame = <savegame>
	lockglobaltags \{pop_progression_writes_only}
	formatText checksumName = Field 'progression_header%d' d = <slot> AddToStringLookup = true
	SetGlobalTags savegame = <savegame> <Field> params = ($default_progressionheader)
	conditional_async_wait async = <async>
	return globaltag_checksum = <globaltag_checksum>
endscript
default_progression_band_info = {
	band_unique_id = non_existent_checksum
	band_logo = [
	]
}

script setup_progression_globaltags 
	GetTrueStartTime
	formatText checksumName = band_unique_id 'band_info_%d' d = <starttime>
	SetGlobalTags savegame = <savegame> progression_band_info params = {($default_progression_band_info) band_unique_id = <band_unique_id>} Progression = true
	setup_band_member_tags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	SetGlobalTags savegame = <savegame> progression_user_option_info params = {($default_progression_useroptiontags)} Progression = true
	setup_venuetags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	setup_gigtags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	SetGlobalTags savegame = <savegame> career_linking_progression params = {($default_career_linking_tags)} Progression = true
	return globaltag_checksum = <globaltag_checksum>
endscript

script reset_globaltags_all 
	get_num_savegames
	if (<num_savegames> > 0)
		savegame = 0
		begin
		reset_globaltags savegame = <savegame>
		<savegame> = (<savegame> + 1)
		repeat <num_savegames>
	endif
	Change \{guitar_globaltags_loaded = 1}
	if NOT GotParam \{boot}
		cheat_turnoffalllocked
		monitorcontrollerstates
	endif
endscript

script init_savegames 
	PushMemProfile \{'savegames'}
	get_savegame_constants
	savegamesysteminit {
		max_savegames = <num_savegames>
		max_global_structs = <max_global_structs>
		max_progression_structs = <max_progression_structs>
		max_progressions = $num_savegame_progressions
		progression_atom_buffersize = (8 * 1024)
		progression_struct_buffersize = (16 * 1024)
		max_car_photos = 0
	}
	PopMemProfile
endscript

script get_num_savegames 
	getmaxplayers
	if ((isps3) || (isps2) || (isngc))
		return \{num_savegames = 1}
	else
		return num_savegames = <max_players>
	endif
endscript

script globaltag_sanity_check_pre_save 
	RequireParams \{[
			savegame
		]
		all}
	check_band_members_for_saving savegame = <savegame>
endscript

script has_savegame_signed_in 
	RequireParams \{[
			savegame
		]
		all}
	GetGlobalTags user_options param = has_signed_in savegame = <savegame>
	if (<has_signed_in> = 1)
		return \{true}
	endif
	return \{FALSE}
endscript

script set_savegame_signed_in 
	RequireParams \{[
			savegame
		]
		all}
	SetGlobalTags user_options params = {has_signed_in = 1} savegame = <savegame>
endscript
default_topscores = [
	{
		tr_scores = [
			19737
			18164
			17809
		]
	}
	{
		tr_scores = [
			19737
			18164
			17809
		]
	}
	{
		tr_scores = [
			46322
			41217
			39989
		]
	}
	{
		tr_scores = [
			54046
			49787
			41256
		]
	}
	{
		tr_scores = [
			64289
			61986
			55423
		]
	}
]
default_songtags_global = {
	rating = 1
	available_on_other_client = 0
}
default_songtags_tr = {
	setlist_bestscore = 0
	setlist_beststars = 0
	setlist_bestpercentage = 0
}
default_songtags_career = {
	career_stars = 0
	career_score = 0
	career_unlocked = 0
}

script setup_unlock_tags 
	SetGlobalTags savegame = <savegame> unlocked_profiles params = {unlocked_profiles = []}
	SetGlobalTags savegame = <savegame> unlocked_cas_items params = {unlocked_cas_items = []}
endscript

script setup_custom_character_tags 
	characterprofileinitglobaltags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	SetGlobalTags savegame = <savegame> custom_character_order params = {custom_character_order = []}
	return globaltag_checksum = <globaltag_checksum>
endscript

script reset_all_preset_characters 
	GetArraySize \{$preset_musician_profiles_modifiable}
	i = 0
	begin
	characterprofilegetstruct Name = ($preset_musician_profiles_modifiable [<i>].Name)
	characterprofilesetstruct savegame = <savegame> Name = ($preset_musician_profiles_modifiable [<i>].Name) profile_struct = <profile_struct>
	i = (<i> + 1)
	repeat <array_Size>
	GetArraySize \{$preset_musician_profiles_ghrockers}
	i = 0
	begin
	characterprofilegetstruct Name = ($preset_musician_profiles_ghrockers [<i>].Name)
	characterprofilesetstruct savegame = <savegame> Name = ($preset_musician_profiles_ghrockers [<i>].Name) profile_struct = <profile_struct>
	i = (<i> + 1)
	repeat <array_Size>
endscript

script delete_all_car_characters 
	i = 0
	begin
	formatText checksumName = id_checksum 'custom_character_%d' d = <i> AddToStringLookup = true
	characterprofilesetstruct savegame = <savegame> Name = <id_checksum> profile_struct = {}
	i = (<i> + 1)
	repeat ($max_num_create_a_rockers)
endscript

script get_formatted_songname \{part = 'guitar'}
	formatText checksumName = songname '%s%p%d' s = (<song_prefix>) p = <part> d = <difficulty_text_nl> AddToStringLookup = true
	return songname = <songname>
endscript

script get_formatted_songname_for_jam_mode \{part = 'guitar'}
	formatText checksumName = songname '%s_%p_%d_quickplay' s = (<song_prefix>) p = <part> d = <difficulty_text_nl> AddToStringLookup = true
	return songname = <songname>
endscript
initial_random_bands = [
	{
		member0 = gh_rocker_eddie
		member1 = gh_rocker_izzy
		member2 = gh_rocker_johnny
		member3 = gh_rocker_judy
	}
	{
		member0 = gh_rocker_izzy
		member1 = gh_rocker_johnny
		member2 = gh_rocker_pandora
		member3 = gh_rocker_lars
	}
	{
		member0 = gh_rocker_axel
		member1 = gh_rocker_izzy
		member2 = gh_rocker_pandora
		member3 = gh_rocker_lars
	}
	{
		member0 = gh_rocker_izzy
		member1 = gh_rocker_axel
		member2 = gh_rocker_judy
		member3 = gh_rocker_pandora
	}
	{
		member0 = gh_rocker_clive
		member1 = gh_rocker_johnny
		member2 = gh_rocker_judy
		member3 = gh_rocker_lars
	}
	{
		member0 = gh_rocker_clive
		member1 = gh_rocker_axel
		member2 = gh_rocker_pandora
		member3 = gh_rocker_eddie
	}
]
default_band_members = {
	member0 = {
		character_id = randomcharacter
		character_savegame = -1
		user_changed = 0
	}
	member1 = {
		character_id = randomcharacter
		character_savegame = -1
		user_changed = 0
	}
	member2 = {
		character_id = randomcharacter
		character_savegame = -1
		user_changed = 0
	}
	member3 = {
		character_id = randomcharacter
		character_savegame = -1
		user_changed = 0
	}
}
override_band_members = 0

script set_band_member_entry 
	RequireParams \{[
			savegame
			index
			character_id
			character_savegame
			user_changed
		]
		all}
	formatText checksumName = member 'member%i' i = <index>
	params = {}
	AddParam structure_name = params Name = <member> value = {
		character_id = <character_id>
		character_savegame = <character_savegame>
		user_changed = <user_changed>
	}
	SetGlobalTags savegame = <savegame> band_members Progression = true params = <params>
endscript

script setup_band_member_tags 
	SetGlobalTags savegame = <savegame> band_members params = {($default_band_members)} Progression = true
	randomize
	GetArraySize ($initial_random_bands)
	GetRandomValue Name = random_index integer a = 0 b = (<array_Size> - 1)
	i = 0
	begin
	formatText checksumName = member 'member%i' i = <i>
	if NOT StructureContains structure = ($default_band_members) <member>
		ScriptAssert 'band member %i not found' i = <i>
	endif
	entry = (($default_band_members).<member>)
	if isstructure \{entry}
		character_id = (<entry>.character_id)
		character_savegame = (<entry>.character_savegame)
	else
		character_id = <entry>
		character_savegame = -1
	endif
	if (<character_id> = randomcharacter)
		<character_id> = ($initial_random_bands [<random_index>].<member>)
	endif
	set_band_member_entry {
		savegame = <savegame>
		index = <i>
		character_id = <character_id>
		character_savegame = <character_savegame>
		user_changed = 0
	}
	i = (<i> + 1)
	repeat 4
	globaltag_dump_band savegame = <savegame>
endscript

script check_band_members_for_saving 
	RequireParams \{[
			savegame
		]
		all}
	GetGlobalTags savegame = <savegame> band_members
	i = 0
	begin
	formatText checksumName = member 'member%i' i = <i>
	if NOT GotParam <member>
		ScriptAssert 'band member %i not found' i = <i>
	endif
	character_savegame = (<...>.<member>.character_savegame)
	if (<character_savegame> != -1)
		ScriptAssert 'savegame %s has a band member entry referring to savegame %b' s = <savegame> b = <character_savegame>
	endif
	i = (<i> + 1)
	repeat 4
	return band_members_array = <array>
endscript

script get_band_members_as_array 
	RequireParams \{[
			savegame
		]
		all}
	GetGlobalTags savegame = <savegame> band_members
	array = []
	i = 0
	begin
	formatText checksumName = member 'member%i' i = <i>
	if NOT GotParam <member>
		ScriptAssert 'band member %i not found' i = <i>
	endif
	AddArrayElement array = <array> element = (<...>.<member>.character_id)
	i = (<i> + 1)
	repeat 4
	return band_members_array = <array>
endscript

script get_saved_band_member 
	RequireParams \{[
			savegame
			index
		]
		all}
	GetGlobalTags savegame = <savegame> band_members
	formatText checksumName = member 'member%i' i = <index>
	if NOT GotParam <member>
		ScriptAssert 'band member %i not found' i = <index>
	endif
	character_id = (<...>.<member>.character_id)
	character_savegame = (<...>.<member>.character_savegame)
	user_changed = (<...>.<member>.user_changed)
	globaltag_sanity_check_character_savegame savegame = <savegame> character_savegame = <character_savegame>
	if (<character_savegame> = -1)
		character_savegame = <savegame>
	endif
	return true character_id = <character_id> character_savegame = <character_savegame> user_changed = <user_changed>
endscript

script get_saved_band_leader 
	RequireParams \{[
			savegame
		]
		all}
	get_saved_band_member index = 0 savegame = <savegame>
	return true character_id = <character_id> character_savegame = <character_savegame> user_changed = <user_changed>
endscript

script globaltag_sanity_check_character_savegame 
	RequireParams \{[
			savegame
			character_savegame
		]
		all}
	if isXenon
		if (<character_savegame> != -1)
			if (<savegame> != <character_savegame>)
				if band_lobby_controller_can_save controller = <savegame>
					ScriptAssert \{'Profiles that can save should not be borrowing band members from other profiles'}
				endif
			endif
		endif
	endif
endscript

script globaltag_save_band_member_choice \{set_user_changed = 1}
	RequireParams \{[
			savegame
			character_id
			character_savegame
			index
			set_user_changed
		]
		all}
	if (<character_savegame> = <savegame>)
		character_savegame = -1
	endif
	globaltag_sanity_check_character_savegame savegame = <savegame> character_savegame = <character_savegame>
	set_band_member_entry {
		savegame = <savegame>
		index = <index>
		character_id = <character_id>
		character_savegame = <character_savegame>
		user_changed = <set_user_changed>
	}
	globaltag_dump_band savegame = <savegame>
	if GotParam \{keep_unique_band}
		chosen_character_id = <character_id>
		i = 0
		begin
		if (<i> != <index>)
			get_saved_band_member savegame = <savegame> index = <i>
			if (<user_changed> = 0)
				if (<character_id> = <chosen_character_id>)
					printf '%s is duped in the band, fixing it!' s = <chosen_character_id>
					cas_get_random_ghrocker savegame = <savegame>
					set_band_member_entry {
						savegame = <savegame>
						index = <i>
						character_id = <character_id>
						character_savegame = -1
						user_changed = 0
					}
				endif
			endif
		endif
		i = (<i> + 1)
		repeat 4
	endif
	globaltag_dump_band savegame = <savegame>
endscript

script globaltag_fix_band_member0_at_join 
	RequireParams \{[
			savegame
			existing_character_id
			existing_character_savegame
		]
		all}
	if isps3
		ScriptAssert \{'globaltag_fix_band_member0_at_join - Not for PS3'}
	endif
	array = []
	i = 1
	begin
	getplayerinfo <i> character_id
	AddArrayElement array = <array> element = <character_id>
	i = (<i> + 1)
	repeat 4
	on_screen_band = <array>
	if band_lobby_controller_can_save controller = <savegame>
		existing_character_savegame = -1
		if is_ghrocker id = <existing_character_id>
		else
			RemoveParameter \{existing_character_id}
		endif
	else
		if NOT is_completely_custom_musician id = <existing_character_id>
			existing_character_savegame = -1
			if (<existing_character_id> = avatar)
				RemoveParameter \{existing_character_id}
			endif
		else
		endif
	endif
	if GotParam \{existing_character_id}
		printf 'globaltag_fix_band_member0_at_join: Using %a %b from band leader' a = <existing_character_id> b = <existing_character_savegame>
	else
		get_saved_band_member savegame = <savegame> index = 0
		if ArrayContains array = <on_screen_band> contains = <character_id>
			cas_get_random_character savegame = <savegame> part = guitar categories = [ghrockers] band_members_array = <on_screen_band>
			printf 'globaltag_fix_band_member0_at_join: Using random rocker %a' a = <character_id>
		else
			printf 'globaltag_fix_band_member0_at_join: Using existing rocker %a' a = <character_id>
		endif
		existing_character_id = <character_id>
		existing_character_savegame = -1
	endif
	globaltag_sanity_check_character_savegame savegame = <savegame> character_savegame = <existing_character_savegame>
	globaltag_save_band_member_choice {
		savegame = <savegame>
		character_id = <existing_character_id>
		character_savegame = <existing_character_savegame>
		index = 0
		set_user_changed = 0
		keep_unique_band
	}
	return {
		character_id = <existing_character_id>
		character_savegame = <existing_character_savegame>
	}
endscript

script globaltag_set_career_band_leader_choice 
	RequireParams \{[
			savegame
			character_id
		]
		all}
	globaltag_save_band_member_choice index = 0 character_id = <character_id> savegame = <savegame> character_savegame = <savegame> keep_unique_band = 1
endscript

script globaltag_dump_band \{savegame = 0}
	RequireParams \{[
			savegame
		]
		all}
	if NOT CD
		GetGlobalTags savegame = <savegame> band_members
		printf \{'New saved band:'}
		printstruct {member0 = <member0> member1 = <member1> member2 = <member2> member3 = <member3>}
	endif
endscript

script globaltag_setup_traditional_band 
	setplayerinfo \{1
		part = vocals}
	setplayerinfo \{2
		part = guitar}
	setplayerinfo \{3
		part = bass}
	setplayerinfo \{4
		part = drum}
	if NOT GotParam \{savegame}
		return
	endif
	get_saved_band_member savegame = <savegame> index = 0
	setplayerinfo 1 character_id = <character_id>
	setplayerinfo 1 character_savegame = <character_savegame>
	setplayerinfo \{1
		stored_character_index = 0}
	get_saved_band_member savegame = <savegame> index = 3
	setplayerinfo 2 character_id = <character_id>
	setplayerinfo 2 character_savegame = <character_savegame>
	setplayerinfo \{2
		stored_character_index = 3}
	get_saved_band_member savegame = <savegame> index = 1
	setplayerinfo 3 character_id = <character_id>
	setplayerinfo 3 character_savegame = <character_savegame>
	setplayerinfo \{3
		stored_character_index = 1}
	get_saved_band_member savegame = <savegame> index = 2
	setplayerinfo 4 character_id = <character_id>
	setplayerinfo 4 character_savegame = <character_savegame>
	setplayerinfo \{4
		stored_character_index = 2}
endscript
default_venuetags = {
	unlocked = 0
	venue_stars = 0
}
cheat_venuetags = {
	unlocked = 1
	venue_stars = 255
}

script setup_venuetags 
	if GotParam \{cheat}
		venue_tags = $cheat_venuetags
	else
		venue_tags = $default_venuetags
	endif
	setup_generalvenuetags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	if GotParam \{globaltag_checksum}
		return globaltag_checksum = <globaltag_checksum>
	endif
endscript

script setup_generalvenuetags 
	get_LevelZoneArray_size
	array_count = 0
	begin
	get_LevelZoneArray_checksum index = <array_count>
	if NOT StructureContains structure = ($LevelZones.<level_checksum>) debug_only
		formatText checksumName = venue_checksum 'venue_%s' s = ($LevelZones.<level_checksum>.Name) AddToStringLookup = true
		if NOT GetGlobalTags savegame = <savegame> <venue_checksum> noassert = 1
			SetGlobalTags savegame = <savegame> <venue_checksum> params = {($default_venuetags)} packtype = venuetags Progression = true
		endif
		globaltag_checksum = (<globaltag_checksum> + <venue_checksum>)
		SetGlobalTags savegame = <savegame> <venue_checksum> params = {unlocked = 0} packtype = venuetags Progression = true
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
	return globaltag_checksum = <globaltag_checksum>
endscript
default_progression_useroptiontags = {
	guitar_bass_flip_save = None
	guitar_difficulty_save = None
	bass_difficulty_save = None
	drum_difficulty_save = None
	vocals_difficulty_save = None
	guitar_lefty_flip_save = -1
	bass_lefty_flip_save = -1
	drum_lefty_flip_save = -1
	vocals_highway_view_save = scrolling
	guitar_hyperspeed_save = -1
	bass_hyperspeed_save = -1
	drum_hyperspeed_save = -1
	vocals_hyperspeed_save = -1
	vocals_mic_preference_save = None
	drum_double_kick_drum_save = 0
	guitar_bass_flip_c0 = None
	guitar_bass_flip_c1 = None
	guitar_bass_flip_c2 = None
	guitar_bass_flip_c3 = None
	guitar_difficulty_c0 = None
	guitar_difficulty_c1 = None
	guitar_difficulty_c2 = None
	guitar_difficulty_c3 = None
	bass_difficulty_c0 = None
	bass_difficulty_c1 = None
	bass_difficulty_c2 = None
	bass_difficulty_c3 = None
	drum_difficulty_c0 = None
	drum_difficulty_c1 = None
	drum_difficulty_c2 = None
	drum_difficulty_c3 = None
	vocals_difficulty_c0 = None
	vocals_difficulty_c1 = None
	vocals_difficulty_c2 = None
	vocals_difficulty_c3 = None
	guitar_lefty_flip_c0 = -1
	guitar_lefty_flip_c1 = -1
	guitar_lefty_flip_c2 = -1
	guitar_lefty_flip_c3 = -1
	bass_lefty_flip_c0 = -1
	bass_lefty_flip_c1 = -1
	bass_lefty_flip_c2 = -1
	bass_lefty_flip_c3 = -1
	drum_lefty_flip_c0 = -1
	drum_lefty_flip_c1 = -1
	drum_lefty_flip_c2 = -1
	drum_lefty_flip_c3 = -1
	guitar_hyperspeed_c0 = -1
	guitar_hyperspeed_c1 = -1
	guitar_hyperspeed_c2 = -1
	guitar_hyperspeed_c3 = -1
	bass_hyperspeed_c0 = -1
	bass_hyperspeed_c1 = -1
	bass_hyperspeed_c2 = -1
	bass_hyperspeed_c3 = -1
	drum_hyperspeed_c0 = -1
	drum_hyperspeed_c1 = -1
	drum_hyperspeed_c2 = -1
	drum_hyperspeed_c3 = -1
	vocals_hyperspeed_c0 = -1
	vocals_hyperspeed_c1 = -1
	vocals_hyperspeed_c2 = -1
	vocals_hyperspeed_c3 = -1
	vocals_highway_view_c0 = scrolling
	vocals_highway_view_c1 = scrolling
	vocals_highway_view_c2 = scrolling
	vocals_highway_view_c3 = scrolling
	vocals_mic_preference_c0 = None
	vocals_mic_preference_c1 = None
	vocals_mic_preference_c2 = None
	vocals_mic_preference_c3 = None
	drum_double_kick_drum_c0 = 0
	drum_double_kick_drum_c1 = 0
	drum_double_kick_drum_c2 = 0
	drum_double_kick_drum_c3 = 0
}
default_career_linking_tags = {
	common_progression = [
		0
		0
		0
		0
		0
		0
		0
		0
		0
		0
		0
		0
		0
		0
		0
		0
	]
	guitar_sku_progression = [
		0
		0
		0
		0
		0
		0
		0
		0
		0
		0
		0
		0
		0
		0
		0
		0
		0
	]
	drum_sku_progression = [
		0
		0
		0
		0
		0
		0
		0
		0
		0
		0
		0
		0
		0
		0
		0
		0
		0
	]
}

script save_progression_instrument_user_option 
	RequireParams \{[
			controller
			option
			new_value
		]
		all}
	get_savegame_from_controller controller = <controller>
	if GotParam \{part}
		get_part_text_nl part = <part>
		if ((isps3) || (isngc))
			formatText checksumName = save_checksum '%p_%o_c%c' p = <part_text> o = <option> c = <controller>
		else
			formatText checksumName = save_checksum '%p_%o_save' p = <part_text> o = <option>
		endif
	else
		if ((isps3) || (isngc))
			formatText checksumName = save_checksum '%o_c%c' o = <option> c = <controller>
		else
			formatText checksumName = save_checksum '%o_save' o = <option>
		endif
	endif
	AddParam structure_name = save_struct Name = <save_checksum> value = <new_value>
	SetGlobalTags savegame = <savegame> progression_user_option_info params = <save_struct> Progression = true
endscript

script get_progression_instrument_user_option 
	RequireParams \{[
			controller
			option
		]
		all}
	get_savegame_from_controller controller = <controller>
	if GotParam \{part}
		get_part_text_nl part = <part>
		if ((isps3) || (isngc))
			formatText checksumName = save_checksum '%p_%o_c%c' p = <part_text> o = <option> c = <controller>
		else
			formatText checksumName = save_checksum '%p_%o_save' p = <part_text> o = <option>
		endif
	else
		if ((isps3) || (isngc))
			formatText checksumName = save_checksum '%o_c%c' o = <option> c = <controller>
		else
			formatText checksumName = save_checksum '%o_save' o = <option>
		endif
	endif
	GetGlobalTags savegame = <savegame> progression_user_option_info param = <save_checksum>
	return user_option = (<...>.<save_checksum>)
endscript
override_audio_lag = -1
override_video_lag = -1

script setup_user_option_tags 
	controller = <savegame>
	if isxenonorwindx
		StartGameProfileSettingsRead controller = <controller>
		begin
		if GameProfileSettingsFinished controller = <controller>
			break
		endif
		repeat
		if GetGameProfileSetting gsid = 1 controller = <controller>
			SetArrayElement ArrayName = default_difficulty globalarray index = <controller> NewValue = easy
			if (<game_setting> = 3)
				SetArrayElement ArrayName = default_difficulty globalarray index = <controller> NewValue = medium
			elseif (<game_setting> = 4)
				SetArrayElement ArrayName = default_difficulty globalarray index = <controller> NewValue = hard
			endif
		endif
	endif
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
		ps2_stereo_sound = 1
		ps2_widescreen = 0
		use_tilt_for_starpower_save = 1
		enable_touch_strip_save = 1
		hyperspeed_guitar = 1.0
		hyperspeed_bass = 1.0
		hyperspeed_drum = 1.0
		airinstruments = 0
		invisiblecharacters = 0
		gem_set = standard_gems
		fx_set = standard_fx
		star_set = standard_stars
		unpause_count = 1
		lag_audio_calibration = ($default_audio_lag)
		lag_video_calibration = ($default_video_lag)
		has_calibrated = 0
		autosave = 1
		has_signed_in = 0
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
		default_tr_name = [qs(0x57449344) qs(0x00000000) qs(0x00000000)]
		online_game_mode = 0
		online_difficulty = 0
		online_num_songs = 0
		online_tie_breaker = 0
		online_highway = 0
		ghtunes_num_songs_rated = 0
		unlock_cheat_contestwinner1 = 0
		unlock_cheat_alwaysslide = 0
		unlock_cheat_airinstruments = 0
		unlock_cheat_invisiblecharacters = 0
		unlock_Cheat_PerformanceMode = 0
		unlock_Cheat_Hyperspeed = 1
		unlock_cheat_autokick = 0
		unlock_cheat_freedrum = 1
		unlock_cheat_superuser = 0
		unlock_cheat_unlockallcharacters = 0
		unlock_cheat_invincible = 1
		unlock_cheat_allhopos = 0
		unlock_cheat_focusmode = 0
		unlock_cheat_hudfreemode = 0
		unlock_cheat_absolutelynothing = 0
		cheat_index0 = 0
		cheat_index1 = 0
		cheat_index1_1 = 0
		cheat_index1_2 = 0
		cheat_index1_3 = 0
		cheat_index2 = 0
		cheat_index3 = 0
		cheat_index4 = 0
		cheat_index5 = 0
		cheat_index5_1 = 0
		cheat_index5_2 = 0
		cheat_index5_3 = 0
		cheat_index6 = 0
		cheat_index6_1 = 0
		cheat_index6_2 = 0
		cheat_index6_3 = 0
		cheat_index7 = 0
		cheat_index8 = 0
		cheat_index9 = 0
		cheat_index10 = 0
		cheat_index10_1 = 0
		cheat_index10_2 = 0
		cheat_index10_3 = 0
		cheat_index11 = 0
		cheat_index11_1 = 0
		cheat_index11_2 = 0
		cheat_index11_3 = 0
		cheat_index12 = 0
		cheat_index13 = 0
		cheat_index14 = 0
		cheat_index15 = 0
		cheat_index16 = 0
		cheat_index17 = 0
		cheat_index18 = 0
		cheat_index19 = 0
		cheat_index20 = 0
	}
	if NOT ($override_audio_lag = -1 || $override_video_lag = -1)
		if ($override_audio_lag > 200)
			Change \{override_audio_lag = 200}
		endif
		if ($override_video_lag > 200)
			Change \{override_video_lag = 200}
		endif
		SetGlobalTags savegame = <savegame> user_options params = {lag_audio_calibration = $override_audio_lag}
		SetGlobalTags savegame = <savegame> user_options params = {lag_video_calibration = $override_video_lag}
	endif
endscript

script get_user_option_cheat_index_state 
	RequireParams \{[
			index
			controller
		]
		all}
	if NOT GotParam \{savegame}
		getsavegamefromcontroller controller = <controller>
	endif
	if ((isXenon) || <controller> = 0)
		formatText checksumName = cheatindexname 'cheat_index%d' d = <index>
	else
		cheat_struct = ($guitar_hero_cheats [<index>])
		Global = 0
		if NOT StructureContains structure = <cheat_struct> options
			Global = 1
		else
			<options> = (<cheat_struct>.options)
			first_option_global = (((<options> [0]).globals) [0])
			if (<first_option_global>.location = Global)
				Global = 1
			endif
		endif
		if (<Global> = 1)
			formatText checksumName = cheatindexname 'cheat_index%d' d = <index>
		else
			formatText checksumName = cheatindexname 'cheat_index%d_%c' d = <index> c = <controller>
		endif
	endif
	GetGlobalTags user_options savegame = <savegame> param = <cheatindexname>
	if NOT StructureContains structure = <...> <cheatindexname>
		formatText checksumName = cheatindexname 'cheat_index%d' d = <index>
	endif
	return cheat_state = (<...>.<cheatindexname>) cheatindexname = <cheatindexname>
endscript

script set_user_option_cheat_index_state 
	RequireParams \{[
			index
			controller
			cheat_state
		]
		all}
	getsavegamefromcontroller controller = <controller>
	if ((isXenon) || <controller> = 0)
		formatText checksumName = cheatindexname 'cheat_index%d' d = <index>
	else
		cheat_struct = ($guitar_hero_cheats [<index>])
		Global = 0
		if NOT StructureContains structure = <cheat_struct> options
			Global = 1
		else
			<options> = (<cheat_struct>.options)
			first_option_global = (((<options> [0]).globals) [0])
			if (<first_option_global>.location = Global)
				Global = 1
			endif
		endif
		if (<Global> = 1)
			formatText checksumName = cheatindexname 'cheat_index%d' d = <index>
		else
			formatText checksumName = cheatindexname 'cheat_index%d_%c' d = <index> c = <controller>
		endif
	endif
	GetGlobalTags user_options savegame = <savegame> param = <cheatindexname>
	if NOT StructureContains structure = <...> <cheatindexname>
		formatText checksumName = cheatindexname 'cheat_index%d' d = <index>
	endif
	AddParam structure_name = params Name = <cheatindexname> value = <cheat_state>
	SetGlobalTags user_options savegame = <savegame> params = <params>
endscript

script setup_tutorial_tags 
	GetArraySize ($tutorial_headers)
	tutorial_header_size = <array_Size>
	i = 0
	begin
	tutorial_header = ($tutorial_headers [<i>])
	formatText checksumName = tutorial_array '%s_tutorials' s = <tutorial_header>
	GetArraySize ($<tutorial_array>)
	tutorial_array_size = <array_Size>
	j = 0
	begin
	tutorial_struct = ($<tutorial_array> [<j>])
	formatText checksumName = tutorial_complete_checksum 'tutorial_%h_%s_save' h = <tutorial_header> s = (<tutorial_struct>.id)
	AddParam structure_name = tutorial_tags Name = <tutorial_complete_checksum> value = not_complete
	GetArraySize (<tutorial_struct>.lessons)
	lesson_array_size = <array_Size>
	k = 0
	begin
	lesson_struct = (<tutorial_struct>.lessons [<k>])
	formatText checksumName = lesson_complete_checksum 'tutorial_lesson_%h_%t_%s_save' h = <tutorial_header> t = (<tutorial_struct>.id) s = (<lesson_struct>.id)
	AddParam structure_name = tutorial_tags Name = <lesson_complete_checksum> value = not_complete
	<k> = (<k> + 1)
	repeat <lesson_array_size>
	<j> = (<j> + 1)
	repeat <tutorial_array_size>
	<i> = (<i> + 1)
	repeat <tutorial_header_size>
	SetGlobalTags savegame = <savegame> tutorials params = <tutorial_tags>
endscript

script get_tutorial_globaltag 
	RequireParams \{[
			savegame
			tutorial_header
			tutorial_id
		]
		all}
	formatText checksumName = tutorial_complete_checksum 'tutorial_%h_%s_save' h = <tutorial_header> s = <tutorial_id>
	GetGlobalTags savegame = <savegame> tutorials param = <tutorial_complete_checksum>
	return tutorial_tag = (<...>.<tutorial_complete_checksum>)
endscript

script get_tutorial_lesson_globaltag 
	RequireParams \{[
			savegame
			tutorial_header
			tutorial_id
			lesson_id
		]
		all}
	formatText checksumName = lesson_complete_checksum 'tutorial_lesson_%h_%t_%s_save' h = <tutorial_header> t = <tutorial_id> s = <lesson_id>
	GetGlobalTags savegame = <savegame> tutorials param = <lesson_complete_checksum>
	return tutorial_tag = (<...>.<lesson_complete_checksum>)
endscript

script save_tutorial_globaltag 
	RequireParams \{[
			savegame
			tutorial_header
			tutorial_id
			value
		]
		all}
	formatText checksumName = tutorial_complete_checksum 'tutorial_%h_%s_save' h = <tutorial_header> s = <tutorial_id>
	AddParam structure_name = tutorial_tags Name = <tutorial_complete_checksum> value = <value>
	SetGlobalTags savegame = <savegame> tutorials params = <tutorial_tags>
endscript

script save_tutorial_lesson_globaltag 
	RequireParams \{[
			savegame
			tutorial_header
			tutorial_id
			lesson_id
			value
		]
		all}
	formatText checksumName = lesson_complete_checksum 'tutorial_lesson_%h_%t_%s_save' h = <tutorial_header> t = <tutorial_id> s = <lesson_id>
	AddParam structure_name = tutorial_tags Name = <lesson_complete_checksum> value = <value>
	SetGlobalTags savegame = <savegame> tutorials params = <tutorial_tags>
endscript

script restore_globals_from_global_tags 
	getmaxplayers
	<i> = 1
	begin
	getplayerinfo Player = <i> controller
	if ((<controller> > -1) && (<controller> < 4))
		get_savegame_from_controller controller = <controller>
		GetGlobalTags savegame = <savegame> user_options
		setplayerinfo <i> use_tilt_for_starpower = <use_tilt_for_starpower_save>
		setplayerinfo <i> enable_touch_strip = <enable_touch_strip_save>
	endif
	<i> = (<i> + 1)
	repeat <max_players>
	monitorcontrollerstates
endscript

script reset_transient_tags 
	SetGlobalTags savegame = <savegame> venue_intro_flags params = {
		z_cairo = 0
		z_carhenge = 0
		z_cube = 0
		z_dragrace = 0
		z_dublin = 0
		z_freakshow = 0
		z_lhc = 0
		z_mexicocity = 0
		z_nashville = 0
		z_neworleans = 0
		z_norway = 0
		z_sanfrancisco = 0
		z_studio = 0
		z_subway = 0
		z_tool = 0
		z_vegas = 0
		z_visualizer = 0
	}
	SetGlobalTags savegame = <savegame> celeb_intro_flags params = {
		c_ringoffire = 0
		c_onlyhappywhenitrains = 0
		c_lithium = 0
		c_smellsliketeenspirit = 0
		c_noonetodependon = 0
		c_pluginbaby = 0
	}
	SetGlobalTags savegame = <savegame> venue_encore_flags params = {
		z_cabo = 0
		z_cairo = 0
		z_carhenge = 0
		z_centrlpark = 0
		z_cube = 0
		z_dragrace = 0
		z_dublin = 0
		z_easterisland = 0
		z_freakshow = 0
		z_gorge = 0
		z_lhc = 0
		z_mexicocity = 0
		z_montreux = 0
		z_nashville = 0
		z_neworleans = 0
		z_norway = 0
		z_paris = 0
		z_sanfrancisco = 0
		z_studio = 0
		z_subway = 0
		z_tokyo = 0
		z_vegas = 0
		z_visualizer = 0
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
	index = 0
	GetArraySize ($song_unlock_new_profile)
	begin
	song = (($song_unlock_new_profile) [<index>])
	globaltag_checksum = (<globaltag_checksum> + <song>)
	SetGlobalTags savegame = <savegame> <song> params = {unlocked = 1}
	<index> = (<index> + 1)
	repeat <array_Size>
	return globaltag_checksum = <globaltag_checksum>
endscript

script GlobalTags_UnlockAll \{songs_only = 0}
	if NOT GotParam \{difficulty}
		getfirstplayer
		getplayerinfo <Player> difficulty
	endif
	get_savegame_from_controller controller = ($primary_controller)
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
	setup_gigtags \{cheat
		globaltag_checksum = None}
	setup_venuetags \{cheat
		globaltag_checksum = None}
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
	ScriptAssert \{'get_game_mode_ui_string: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript
game_mode_ui_strings = {
	gh4_p1_career = qs(0x5a4f279f)
	gh4_p2_career = qs(0x5a4f279f)
	p1_quickplay = qs(0x388d2deb)
	p2_quickplay = qs(0x330c43bc)
	p2_pro_faceoff = qs(0x4bf74995)
	p2_roadie_battle = qs(0x86c44e4e)
	p2_coop = qs(0x977b1176)
}

script get_difficulty_ui_string 
	ScriptAssert \{'get_difficulty_ui_string: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript
game_difficulty_ui_strings = {
	easy = qs(0xbf7ffd2d)
	medium = qs(0xeac0f52d)
	hard = qs(0x63aae385)
	expert = qs(0xb778e780)
}
game_mode_names = {
	gh4_p1_career = 'gh4_p1_career'
	gh4_p2_careergh4_ = 'gh4_p2_career'
	p1_quickplay = 'p1_quickplay'
	p2_quickplay = 'p2_quickplay'
	p2_pro_faceoff = 'p2_pro_faceoff'
	p4_pro_faceoff = 'p4_pro_faceoff'
	p2_roadie_battle = 'p2_roadie_battle'
	p8_pro_faceoff = 'p8_pro_faceoff'
	p2_coop = 'p2_coop'
	p4_quickplay = 'p4_quickplay'
	freeplay = 'freeplay'
	practice = 'practice'
	tutorial = 'tutorial'
}

script get_band_game_mode_name 
	game_mode_name = ($game_mode_names.gh4_p1_career)
	return game_mode_name = <game_mode_name>
endscript

script get_game_mode_name 
	return game_mode_name = ($game_mode_names.$game_mode)
endscript

script get_band_info \{band_index = 1}
	if ($num_career_bands > 1)
		formatText checksumName = band_info 'band%i_info' i = <band_index> AddToStringLookup = true
		return band_info = <band_info>
	else
		return \{band_info = band_info}
	endif
endscript

script get_current_band_info 
	get_band_info band_index = ($current_band)
	return band_info = <band_info>
endscript

script get_band_checksum \{band_index = 1}
	if ($num_career_bands > 1)
		formatText checksumName = band_checksum 'career_band%i' i = <band_index> AddToStringLookup = true
		return band_checksum = <band_checksum>
	else
		return \{band_checksum = career_band}
	endif
endscript

script get_current_band_checksum 
	get_band_checksum band_index = ($current_band)
	return band_checksum = <band_checksum>
endscript

script set_cas_texture_unlocked_flag 
	RequireParams \{[
			texture
			savegame
		]
		all}
	GetGlobalTags unlocked_cas_textures savegame = <savegame>
	if NOT ArrayContains array = <unlocked_cas_textures> contains = <texture>
		AddArrayElement array = <unlocked_cas_textures> element = <texture>
		SetGlobalTags unlocked_cas_textures params = {unlocked_cas_textures = <array>} savegame = <savegame>
	endif
endscript

script set_cas_item_unlocked_flag 
	RequireParams \{[
			desc_id
			part
			savegame
		]
		all}
	GetGlobalTags unlocked_cas_items savegame = <savegame>
	MangleChecksums a = <desc_id> b = <part>
	if NOT ArrayContains array = <unlocked_cas_items> contains = <mangled_ID>
		AddArrayElement array = <unlocked_cas_items> element = <mangled_ID>
		SetGlobalTags unlocked_cas_items params = {unlocked_cas_items = <array>} savegame = <savegame>
	endif
endscript

script unlock_purchase_all_cas_parts 
	RequireParams \{[
			savegame
		]
		all}
	GetArraySize ($master_editable_list)
	master_list_size = <array_Size>
	i = 0
	begin
	part = ((($master_editable_list) [<i>]).part)
	GetArraySize ($<part>)
	if (<array_Size> > 0)
		j = 0
		begin
		if StructureContains structure = (($<part>) [<j>]) locked
			set_cas_item_unlocked_flag part = <part> desc_id = ((($<part>) [<j>]).desc_id) savegame = <savegame>
		endif
		if StructureContains structure = (($<part>) [<j>]) cap_textures
			unlock_purchase_all_cas_texture_pieces textures = ((($<part>) [<j>]).cap_textures) savegame = <savegame>
		endif
		j = (<j> + 1)
		repeat <array_Size>
	endif
	i = (<i> + 1)
	repeat <master_list_size>
endscript

script unlock_purchase_all_cas_texture_pieces 
	GetArraySize <textures>
	i = 0
	if (<array_Size> > 0)
		begin
		entry = (<textures> [<i>])
		if StructureContains structure = <entry> preset_layers
			unlock_purchase_all_cas_texture_pieces_layers layers = (<entry>.preset_layers) savegame = <savegame>
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
endscript

script unlock_purchase_all_cas_texture_pieces_layers 
	GetArraySize <layers>
	i = 0
	if (<array_Size> > 0)
		begin
		entry = (<layers> [<i>])
		if StructureContains structure = <entry> mask
			unlock_purchase_all_cas_texture_pieces_layers_mask mask = (<entry>.mask) savegame = <savegame>
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
endscript

script unlock_purchase_all_cas_texture_pieces_layers_mask 
	GetArraySize <mask>
	i = 0
	if (<array_Size> > 0)
		begin
		entry = (<mask> [<i>])
		if StructureContains structure = <entry> locked
			if StructureContains structure = <entry> pattern
				set_cas_texture_unlocked_flag texture = (<entry>.pattern) savegame = <savegame>
			endif
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
endscript

script check_cas_item_unlocked_flag 
	RequireParams \{[
			desc_id
			part
			savegame
		]
		all}
	GetGlobalTags unlocked_cas_items savegame = <savegame>
	MangleChecksums a = <desc_id> b = <part>
	if ArrayContains array = <unlocked_cas_items> contains = <mangled_ID>
		return \{true}
	endif
	return \{FALSE}
endscript

script check_cas_texture_unlocked_flag 
	RequireParams \{[
			texture
			savegame
		]
		all}
	GetGlobalTags unlocked_cas_textures savegame = <savegame>
	if ArrayContains array = <unlocked_cas_textures> contains = <texture>
		return \{true}
	endif
	return \{FALSE}
endscript

script get_current_band_name 
	if NOT GotParam \{savegame}
		get_savegame_from_controller \{controller = $primary_controller}
	endif
	if savegamegetprogression savegame = <savegame>
		formatText checksumName = Field 'progression_header%d' d = <Progression> AddToStringLookup = true
		GetGlobalTags <Field> savegame = <savegame> param = progression_name
		return true band_name = <progression_name>
	endif
	return \{FALSE}
endscript

script setup_achievement_tags 
	SetGlobalTags savegame = <savegame> achievement_info params = {
		performed_as_guitarist = 0
		performed_as_bassist = 0
		performed_as_drummer = 0
		performed_as_vocalist = 0
		total_ghtunes_downloaded = 0
	}
endscript

script setup_cas_helper_tags 
	SetGlobalTags savegame = <savegame> cas_helper_dialogue params = {
		visit_cag = 0
		visit_cap = 0
		visit_cadrm = 0
		visit_deformation = 0
		visit_outfit = 0
	}
endscript
default_gig_tags = {
	unlocked = 0
	has_been_played = 0
	song1_stars_earned = 0
	earned_gold_stars = 0
	completed = 0
	completed_gold = 0
	completed_platinum = 0
	completed_diamond = 0
	started = 0
	encore_unlocked = 0
}
cheat_gig_tags = {
	unlocked = 1
	has_been_played = 1
	song1_stars_earned = 6
	earned_gold_stars = 1
	completed = 1
	completed_gold = 1
	completed_platinum = 1
	completed_diamond = 1
	started = 0
	encore_unlocked = 0
}
progression_tags = {
	total_stars = 0
	career_first_time_setup = 0
}

script has_completed_forced_career_flow 
	RequireParams \{[
			device_num
		]
		all}
	if ($skip_career_forced_flow = 1)
		career_first_time_setup = 1
	else
		GetGlobalTags career_progression_tags params = career_first_time_setup controller = <device_num>
	endif
	if (<career_first_time_setup> = 1)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script setup_gigtags 
	printf \{qs(0xe1924e4e)}
	SetGlobalTags savegame = <savegame> career_progression_tags params = {($progression_tags)} Progression = true
	globaltag_checksum = (<globaltag_checksum> + career_progression_tags)
	<gig_tags> = ($default_gig_tags)
	if GotParam \{cheat}
		<gig_tags> = ($cheat_gig_tags)
	endif
	GetArraySize \{$progression_gig_list}
	num_zones = <array_Size>
	index = 0
	begin
	gig_list = (($progression_gig_list [<index>]).gig_list)
	GetArraySize ($<gig_list>)
	num_gigs = <array_Size>
	if (<num_gigs> > 0)
		gig_index = 0
		begin
		gig_checksum = ($<gig_list> [<gig_index>])
		printf 'adding gig tag for %a, save game is %b' a = <gig_checksum> b = <savegame> channel = globaltags
		SetGlobalTags savegame = <savegame> <gig_checksum> params = {(<gig_tags>)} packtype = gigtags Progression = true
		if GotParam \{globaltag_checksum}
			globaltag_checksum = (<globaltag_checksum> + <gig_checksum>)
		endif
		<gig_index> = (<gig_index> + 1)
		repeat <num_gigs>
	endif
	<index> = (<index> + 1)
	repeat <num_zones>
	return globaltag_checksum = <globaltag_checksum>
endscript
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
	completed = 0
	gig_progress = 0
}

script format_globaltag_song_checksum 
	if NOT GotParam \{difficulty}
		getfirstplayer
		getplayerinfo <Player> difficulty
	endif
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
	if NOT GotParam \{append}
		append = ''
	endif
	formatText checksumName = song_checksum '%s%p%d%a' s = <song_name> p = <part_text> d = <difficulty_text_nl> a = <append> AddToStringLookup = tru
	return song_checksum = <song_checksum>
endscript

script get_autosave_enabled 
	GetGlobalTags \{user_options}
	return Enabled = <autosave>
endscript

script format_globaltag_gigname 
	RequireParams \{[
			setlist_prefix
		]
		all}
	if GotParam \{gignum}
		formatText TextName = gig 'gig%g' g = (<gignum>)
	endif
	if NOT GotParam \{band_prefix}
		formatText TextName = bandname_id 'band%d' d = ($current_band)
		band_prefix = <bandname_id>
	endif
	formatText checksumName = gig_name '%b_%s_%g' b = <band_prefix> s = <setlist_prefix> g = <gig> AddToStringLookup = true
	return gig_name = <gig_name>
endscript

script setup_quickplay_song_tags 
	if GotParam \{allsongs}
		getsonglistsize
		i = 0
		begin
		getsonglistchecksum index = <i>
		get_song_saved_in_globaltags song = <song_checksum>
		if (<saved_in_globaltags> = 1)
			SetGlobalTags savegame = <savegame> <song_checksum> params = {unlocked = 0}
		endif
		i = (<i> + 1)
		repeat <array_Size>
		return
	endif
	return globaltag_checksum = <globaltag_checksum>
endscript

script setup_saved_instrument_tags 
	globaltag_createarray globaltag_checksum = <globaltag_checksum> savegame = <savegame> array_name = player_created_graphics_save max_size = ($max_num_logo_saves) packtype = logos
	globaltag_createarray globaltag_checksum = <globaltag_checksum> savegame = <savegame> array_name = player_guitar_save max_size = ($max_num_instrument_saves) packtype = guitars
	globaltag_createarray globaltag_checksum = <globaltag_checksum> savegame = <savegame> array_name = player_bass_save max_size = ($max_num_instrument_saves) packtype = basses
	globaltag_createarray globaltag_checksum = <globaltag_checksum> savegame = <savegame> array_name = player_drum_save max_size = ($max_num_instrument_saves) packtype = drums
	globaltag_createarray globaltag_checksum = <globaltag_checksum> savegame = <savegame> array_name = player_mic_save max_size = ($max_num_instrument_saves) packtype = vocals
	return globaltag_checksum = <globaltag_checksum>
endscript

script setup_playlist_tags 
	RequireParams \{[
			savegame
		]
		all}
	SetGlobalTags savegame = <savegame> custom_playlists params = {custom_playlists = ($custom_playlists)}
endscript

script setup_songlist_tags 
	RequireParams \{[
			savegame
		]
		all}
	SetGlobalTags savegame = <savegame> songlist_options params = {show_more_info = ($g_songlist_show_more_info) show_ghtunes = ($g_songlist_show_ghtunes)}
endscript

script setup_download_song_killswitch 
	SetGlobalTags savegame = <savegame> net params = {enabled_songs_bitfield = ($enabled_songs_bitfield)}
endscript

script update_download_song_killswitch_from_globaltags 
	if GetGlobalTags \{net
			param = enabled_songs_bitfield
			noassert = 1}
		Change enabled_songs_bitfield = (<enabled_songs_bitfield>)
		update_download_song_killswitch_save
	endif
endscript

script update_download_song_killswitch_from_net 
	Change enabled_songs_bitfield = ($enabled_songs_bitfield_live)
	update_download_song_killswitch_save
endscript

script update_download_song_killswitch_save 
	lockglobaltags \{freeplay_check_off}
	lockglobaltags \{OFF}
	get_num_savegames
	if (<num_savegames> > 0)
		savegame = 0
		begin
		setup_download_song_killswitch savegame = <savegame>
		<savegame> = (<savegame> + 1)
		repeat <num_savegames>
	endif
	lockglobaltags
	lockglobaltags \{freeplay_check_on}
endscript

script globaltag_createarray 
	RequireParams \{[
			savegame
			array_name
			max_size
			packtype
		]
		all}
	SetGlobalTags savegame = <savegame> <array_name> params = {valid_entries = [] max_size = <max_size> names = <names>}
	i = 0
	begin
	formatText TextName = arrayappend '_array%d' d = <i>
	ExtendCrc <array_name> <arrayappend> out = arrayid
	SetGlobalTags savegame = <savegame> <arrayid> params = {} packtype = <packtype>
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
		GetGlobalTags savegame = <savegame> out = contents (<valid_entries> [<index>])
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
		SetGlobalTags savegame = <savegame> (<valid_entries> [<index>]) params = <element>
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
			SetGlobalTags savegame = <savegame> <arrayid> params = <element>
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
	qs(0xef227354)
	qs(0x5f4f2e1b)
	qs(0xac2998a7)
	qs(0x7f75d0d2)
	qs(0x7e83439b)
	qs(0x36dd790b)
	qs(0xc8d66d50)
	qs(0x3f002d40)
]
