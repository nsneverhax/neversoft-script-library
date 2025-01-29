debug_saves = 0
globaltag_checksum = Empty
default_audio_lag = 0.0
default_video_lag = 0.0
debug_unlockall_on_boot = 0
fake_dlc_song_savegame_entries = 0
num_savegame_progressions = 4
instrument_list = {
	guitar = {
		text = qs(0x9504b94a)
		text_nl = 'guitar'
	}
	bass = {
		text = qs(0x7d4f9214)
		text_nl = 'bass'
	}
	Drum = {
		text = qs(0xcf488ba5)
		text_nl = 'drum'
	}
	vocals = {
		text = qs(0x1b9f6f84)
		text_nl = 'vocals'
	}
	Band = {
		text = qs(0xdabf99c0)
		text_nl = 'band'
	}
}
g_conditional_async_wait_time = -1
guitar_globaltags_loaded = 0

script conditional_async_wait \{text = qs(0xfe15cfe7)
		async = 0
		frame_length = 16}
	if (<async> = 1)
		if ($g_conditional_async_wait_time = -1)
			GetTrueStartTime
			Change g_conditional_async_wait_time = <starttime>
		endif
		GetTrueElapsedTime starttime = ($g_conditional_async_wait_time)
		if (<elapsedtime> < 0)
			GetTrueStartTime
			Change g_conditional_async_wait_time = <starttime>
		endif
		if (<elapsedtime> > <frame_length>)
			if NOT GotParam \{no_wait}
				wait \{1
					gameframe}
			endif
			GetTrueStartTime
			Change g_conditional_async_wait_time = <starttime>
			if GotParam \{print_time}
				FinalPrintf qs(0x755ac6bc) s = <text> t = <elapsedtime>
			endif
		else
			if GotParam \{print_time}
				FinalPrintf qs(0x4ccd2fa6) s = <text> t = <elapsedtime>
			endif
		endif
	endif
endscript

script GlobalTagSaveGameSetProgression \{savegame = 0
		Progression = 0
		async = 0}
	if (<async> = 0)
		SaveGameSetProgression savegame = <savegame> Progression = <Progression>
	else
		SaveGameSetProgression savegame = <savegame> Progression = <Progression> start
		reset_progression_atoms savegame = <savegame> force_update = 0 async = 1
		SaveGameSetProgression savegame = <savegame> Progression = <Progression> end
	endif
endscript

script reset_globaltags savegame = ($primary_controller) async = 0
	globaltag_checksum = initial_v170
	LockGlobalTags \{freeplay_check_off}
	LockGlobalTags \{off}
	SaveGameReset savegame = <savegame>
	printf 'Resetting GlobalTags for savegame %d' d = <savegame>
	conditional_async_wait async = <async> text = qs(0x7398f1b3)
	amount = 1
	<idx> = 0
	begin
	if setupsongtags savegame = <savegame> globaltag_checksum = <globaltag_checksum> part = 'guitar' start = <idx> count = <amount>
		break
	endif
	conditional_async_wait async = <async> text = qs(0x612d5e5d)
	<idx> = (<idx> + <amount>)
	repeat
	<idx> = 0
	begin
	if setupsongtags savegame = <savegame> globaltag_checksum = <globaltag_checksum> part = 'bass' start = <idx> count = <amount>
		break
	endif
	conditional_async_wait async = <async> text = qs(0xd9913938)
	<idx> = (<idx> + <amount>)
	repeat
	<idx> = 0
	begin
	if setupsongtags savegame = <savegame> globaltag_checksum = <globaltag_checksum> part = 'drum' start = <idx> count = <amount>
		break
	endif
	conditional_async_wait async = <async> text = qs(0x44460181)
	<idx> = (<idx> + <amount>)
	repeat
	<idx> = 0
	begin
	if setupsongtags savegame = <savegame> globaltag_checksum = <globaltag_checksum> part = 'vocals' start = <idx> count = <amount>
		break
	endif
	conditional_async_wait async = <async> text = qs(0xfcfa66e4)
	<idx> = (<idx> + <amount>)
	repeat
	<idx> = 0
	begin
	if setupsongtags savegame = <savegame> globaltag_checksum = <globaltag_checksum> part = 'band' start = <idx> count = <amount>
		break
	endif
	conditional_async_wait async = <async> text = qs(0xee4fc90a)
	<idx> = (<idx> + <amount>)
	repeat
	setup_quickplay_song_tags savegame = <savegame> allsongs
	conditional_async_wait async = <async> text = qs(0x56f3ae6f)
	setup_user_option_tags savegame = <savegame> globaltag_checksum = <globaltag_checksum> async = <async>
	conditional_async_wait async = <async> text = qs(0x1bf84b7b)
	setup_tutorial_tags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	setup_unlocks savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	setup_custom_character_tags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	conditional_async_wait async = <async> text = qs(0x094de495)
	setup_unlock_tags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	SetGlobalTags savegame = <savegame> net params = {prev_net_settings = local}
	reset_transient_tags savegame = <savegame>
	setup_achievement_tags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	setup_cas_helper_tags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	setup_saved_instrument_tags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	conditional_async_wait async = <async> text = qs(0xb62cd95c)
	jam_reset_controller_directory_listing savegame = <savegame>
	Change \{ghtunes_verified = 0}
	conditional_async_wait async = <async> text = qs(0xd0a498de)
	SetGlobalTags savegame = <savegame> check_guid params = {user_id0 = -1 user_id1 = -1}
	conditional_async_wait async = <async> text = qs(0xc2113730)
	setup_playlist_tags savegame = <savegame>
	setup_songlist_tags savegame = <savegame>
	conditional_async_wait async = <async> text = qs(0x7aad5055)
	setup_progression_slots savegame = <savegame> globaltag_checksum = <globaltag_checksum> async = <async>
	conditional_async_wait async = <async> text = qs(0xe77a68ec)
	setup_download_song_killswitch savegame = <savegame>
	conditional_async_wait async = <async> text = qs(0x5fc60f89)
	globaltag_update_avatar_metadata savegame = <savegame>
	conditional_async_wait async = <async> text = qs(0x4f467274)
	ClearAchievementCache controller_Id = <savegame>
	GetPackedStructValidityChecksum
	globaltag_checksum = (<globaltag_checksum> + <validity_checksum>)
	SetGlobalTags savegame = <savegame> globaltag_checksum params = {globaltag_checksum = <globaltag_checksum>}
	Change globaltag_checksum = <globaltag_checksum>
	SetArrayElement arrayName = globaltags_to_invalidate GlobalArray index = <savegame> newValue = 0
	restore_globals_from_global_tags savegame = <savegame> callmonitorcontrollerstates = 0
	LockGlobalTags
	LockGlobalTags \{freeplay_check_on}
	conditional_async_wait async = <async> text = qs(0xf7fa1511)
	sanity_check_fix_deleted_characters
endscript
default_progression_name = qs(0x4de75715)
default_progressionheader = {
	progression_name = qs(0x4dcda8f7)
	STARS = 0
	progression_in_use = 0
}

script setup_progression_slots \{async = 0}
	i = 0
	begin
	reset_progression_slot savegame = <savegame> Slot = <i> globaltag_checksum = <globaltag_checksum> async = <async>
	i = (<i> + 1)
	conditional_async_wait async = <async> text = qs(0xfcd818d0)
	repeat $num_savegame_progressions
	SaveGameSetProgression savegame = <savegame> no_progression
	conditional_async_wait async = <async> text = qs(0xee6db73e)
	GlobalTagSaveGameSetProgression savegame = <savegame> Progression = 0 async = <async>
	conditional_async_wait async = <async> text = qs(0x56d1d05b)
	cas_random_band_name
	SetGlobalTags savegame = <savegame> progression_header0 params = {progression_name = <random_name> progression_in_use = 1}
	conditional_async_wait async = <async> text = qs(0xcb06e8e2)
	return globaltag_checksum = <globaltag_checksum>
endscript

script reset_progression_slot \{async = 0}
	RequireParams \{[
			savegame
			Slot
		]
		all}
	GlobalTagSaveGameSetProgression savegame = <savegame> Progression = <Slot> async = <async>
	conditional_async_wait async = <async> text = qs(0x7a4c6a7e)
	LockGlobalTags \{push_progression_writes_only}
	conditional_async_wait async = <async> text = qs(0x68f9c590)
	SaveGameReset savegame = <savegame> progression_only
	conditional_async_wait async = <async> text = qs(0xd045a2f5)
	setup_progression_globaltags async = <async> savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	conditional_async_wait async = <async> text = qs(0x4d929a4c)
	reset_progression_atoms savegame = <savegame> async = <async>
	conditional_async_wait async = <async> text = qs(0xf52efd29)
	LockGlobalTags \{pop_progression_writes_only}
	conditional_async_wait async = <async> text = qs(0xe79b52c7)
	FormatText checksumname = Field 'progression_header%d' d = <Slot> AddToStringLookup = true
	SetGlobalTags savegame = <savegame> <Field> params = ($default_progressionheader)
	conditional_async_wait async = <async> text = qs(0x5f2735a2)
	return globaltag_checksum = <globaltag_checksum>
endscript

script setup_progression_globaltags 
	GetTrueStartTime
	FormatText checksumname = band_unique_id 'band_info_%d' d = <starttime>
	cas_random_band_logo
	SetGlobalTags savegame = <savegame> progression_band_info Progression = true params = {
		band_unique_id = <band_unique_id>
		band_logo = <CAP>
	}
	setup_band_member_tags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	SetGlobalTags savegame = <savegame> progression_user_option_info params = {($default_progression_useroptiontags)} Progression = true
	setup_venuetags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	setup_gigtags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	return globaltag_checksum = <globaltag_checksum>
endscript

script reset_globaltags_all \{async = 0}
	get_num_savegames
	if (<num_savegames> > 0)
		savegame = 0
		begin
		reset_globaltags savegame = <savegame> async = <async>
		MC_InvalidateStorageDevice userid = <savegame>
		<savegame> = (<savegame> + 1)
		repeat <num_savegames>
	endif
	Change \{guitar_globaltags_loaded = 1}
	if NOT GotParam \{boot}
		cheat_turnoffalllocked
		MonitorControllerStates
	endif
endscript

script reset_savegame 
	RequireParams \{[
			savegame
		]
		all}
	reset_globaltags savegame = <savegame>
	if NOT GotParam \{no_invalidate_device}
		MC_InvalidateStorageDevice userid = <savegame>
	endif
	cheat_turnoffalllocked
	MonitorControllerStates
endscript

script init_savegames 
	PushMemProfile \{'savegames'}
	get_savegame_constants
	SaveGameSystemInit {
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
	GetMaxLocalPlayers
	if IsPS3
		return \{num_savegames = 1}
	else
		return num_savegames = <max_players>
	endif
endscript

script get_savegame_has_saved_game 
	RequireParams \{[
			savegame
		]
		all}
	GetGlobalTags user_options param = has_saved_game savegame = <savegame>
	if (<has_saved_game> = 1)
		return \{true}
	endif
	return \{false}
endscript

script invalidate_savegame 
	RequireParams \{[
			savegame
		]
		all}
	SetGlobalTags savegame = <savegame> user_options params = {has_saved_game = 0}
endscript

script globaltag_sanity_check_pre_save 
	RequireParams \{[
			savegame
		]
		all}
	check_band_members_for_saving savegame = <savegame>
endscript
globaltags_to_invalidate = [
	0
	0
	0
	0
]

script mark_globaltags_to_invalidate \{savegame = 0}
	SetArrayElement arrayName = globaltags_to_invalidate GlobalArray index = <savegame> newValue = 1
endscript

script invalidate_globaltags 
	savegame = 0
	begin
	if ($globaltags_to_invalidate [<savegame>])
		reset_globaltags savegame = <savegame>
		MC_InvalidateStorageDevice userid = <savegame>
	endif
	savegame = (<savegame> + 1)
	repeat 4
	cheat_turnoffalllocked
	MonitorControllerStates
endscript

script set_globaltag_guid controller = ($primary_controller)
	if IsXenonOrWinDX
		if IsLocallySignedIn controller = <controller>
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
	if IsXenonOrWinDX
		printf qs(0xb006a6d7) i = <controller>
		if IsLocallySignedIn controller = <controller>
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
		return \{false}
	else
		GetGlobalTags controller = <controller> check_guid
		if (<user_id0> = 1)
			if (<user_id1> = 1)
				printf \{qs(0x2f83670c)}
				return \{true}
			endif
		endif
		return \{false}
	endif
endscript
default_topscores = [
	{
		tr_scores = [
			10737
			7164
			4809
		]
	}
	{
		tr_scores = [
			10737
			7164
			4809
		]
	}
	{
		tr_scores = [
			18322
			13217
			9989
		]
	}
	{
		tr_scores = [
			25046
			20787
			17256
		]
	}
	{
		tr_scores = [
			32289
			22986
			15423
		]
	}
]
default_songtags_global = {
	rating = 1
	available_on_other_client = 0
	completed = 0
}
default_songtags_tr = {
	setlist_bestscore = 0
	setlist_beststars = 0
	setlist_bestpercentage = 0
}

script setup_unlock_tags 
	SetGlobalTags savegame = <savegame> unlocked_profiles params = {unlocked_profiles = []}
	SetGlobalTags savegame = <savegame> unlocked_cas_items params = {unlocked_cas_items = []}
	SetGlobalTags savegame = <savegame> unlocked_cas_textures params = {unlocked_cas_textures = []}
endscript

script setup_custom_character_tags 
	CharacterProfileInitGlobalTags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	SetGlobalTags savegame = <savegame> custom_character_order params = {custom_character_order = []}
	return globaltag_checksum = <globaltag_checksum>
endscript

script reset_all_preset_characters 
	CharacterProfileGetList savegame = <savegame> categories = [ghrockers presetcars]
	GetArraySize <profile_list>
	if (<array_size> > 0)
		i = 0
		begin
		charid = (<profile_list> [<i>])
		CharacterProfileGetStruct name = <charid>
		CharacterProfileSetStruct savegame = <savegame> name = <charid> profile_struct = <profile_struct>
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script delete_all_car_characters 
	i = 0
	begin
	FormatText checksumname = id_checksum 'custom_character_%d' d = <i> AddToStringLookup = true
	CharacterProfileSetStruct savegame = <savegame> name = <id_checksum> delete_profile
	i = (<i> + 1)
	repeat ($max_num_create_a_rockers)
	SetGlobalTags savegame = <savegame> custom_character_order params = {custom_character_order = []}
endscript

script get_formatted_songname \{part = 'guitar'}
	FormatText checksumname = songname '%s%p%d' s = (<song_prefix>) p = <part> d = <difficulty_text_nl> AddToStringLookup = true
	return songname = <songname>
endscript

script get_formatted_songname_for_jam_mode \{part = 'guitar'}
	FormatText checksumname = songname '%s_%p_%d_quickplay' s = (<song_prefix>) p = <part> d = <difficulty_text_nl> AddToStringLookup = true
	return songname = <songname>
endscript
initial_random_bands = [
	{
		member0 = GH_Rocker_Eddie
		member1 = GH_Rocker_Izzy
		member2 = GH_Rocker_Johnny
		member3 = GH_Rocker_Judy
	}
	{
		member0 = GH_Rocker_Izzy
		member1 = GH_Rocker_Johnny
		member2 = GH_Rocker_Pandora
		member3 = GH_Rocker_Axel
	}
	{
		member0 = GH_Rocker_Axel
		member1 = GH_Rocker_Izzy
		member2 = GH_Rocker_Pandora
		member3 = GH_Rocker_Johnny
	}
	{
		member0 = GH_Rocker_Izzy
		member1 = GH_Rocker_Axel
		member2 = GH_Rocker_Judy
		member3 = GH_Rocker_Pandora
	}
	{
		member0 = GH_Rocker_Clive
		member1 = GH_Rocker_Johnny
		member2 = GH_Rocker_Judy
		member3 = GH_Rocker_Pandora
	}
	{
		member0 = GH_Rocker_Clive
		member1 = GH_Rocker_Axel
		member2 = GH_Rocker_Pandora
		member3 = GH_Rocker_Eddie
	}
]
default_band_members = {
	member0 = {
		character_id = RandomCharacter
		character_savegame = -1
		user_changed = 0
		band_leader_member_id = -1
	}
	member1 = {
		character_id = RandomCharacter
		character_savegame = -1
		user_changed = 0
		band_leader_member_id = -1
	}
	member2 = {
		character_id = RandomCharacter
		character_savegame = -1
		user_changed = 0
		band_leader_member_id = -1
	}
	member3 = {
		character_id = RandomCharacter
		character_savegame = -1
		user_changed = 0
		band_leader_member_id = -1
	}
}
override_band_members = 0

script remove_avatars_from_band 
	GetGlobalTags savegame = <savegame> band_members
	i = 0
	begin
	get_saved_band_member savegame = <savegame> index = <i>
	if is_avatar_character savegame = <character_savegame> id = <character_id>
		cas_get_random_ghrocker savegame = <savegame>
		params = {}
		AddParam structure_name = params name = <member> value = <character_id>
		SetGlobalTags savegame = <savegame> band_members params = <params> Progression = true
	endif
	i = (<i> + 1)
	repeat 4
endscript

script set_band_member_entry \{band_leader_member_id = -1}
	RequireParams \{[
			savegame
			index
			character_id
			character_savegame
			user_changed
			band_leader_member_id
		]
		all}
	FormatText checksumname = member 'member%i' i = <index>
	params = {}
	AddParam structure_name = params name = <member> value = {
		character_id = <character_id>
		character_savegame = <character_savegame>
		user_changed = <user_changed>
		band_leader_member_id = <band_leader_member_id>
	}
	SetGlobalTags savegame = <savegame> band_members Progression = true params = <params>
endscript

script setup_band_member_tags 
	SetGlobalTags savegame = <savegame> band_members params = {($default_band_members)} Progression = true
	Randomize
	GetArraySize ($initial_random_bands)
	GetRandomValue name = random_index integer a = 0 b = (<array_size> - 1)
	i = 0
	begin
	FormatText checksumname = member 'member%i' i = <i>
	if NOT StructureContains structure = ($default_band_members) <member>
		ScriptAssert \{'Badly formed default_band_members structure.  Do you perhaps have an old default_band_members in your startup?  (Old ones use guitar, bass, drum, vocals.  Switch to using member0, member1, member2, member3 instead.)'}
	endif
	entry = (($default_band_members).<member>)
	if IsStructure \{entry}
		character_id = (<entry>.character_id)
		character_savegame = (<entry>.character_savegame)
	else
		character_id = <entry>
		character_savegame = -1
	endif
	if (<character_id> = RandomCharacter)
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
	FormatText checksumname = member 'member%i' i = <i>
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
	FormatText checksumname = member 'member%i' i = <i>
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
	FormatText checksumname = member 'member%i' i = <index>
	if NOT GotParam <member>
		ScriptAssert 'band member %i not found' i = <index>
	endif
	character_id = (<...>.<member>.character_id)
	character_savegame = (<...>.<member>.character_savegame)
	user_changed = (<...>.<member>.user_changed)
	band_leader_member_id = (<...>.<member>.band_leader_member_id)
	globaltag_sanity_check_character_savegame savegame = <savegame> character_savegame = <character_savegame>
	if (<character_savegame> = -1)
		character_savegame = <savegame>
	endif
	return true character_id = <character_id> character_savegame = <character_savegame> user_changed = <user_changed> band_leader_member_id = <band_leader_member_id>
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

script globaltag_save_band_member_choice \{set_user_changed = 1
		band_leader_member_id = -1}
	RequireParams \{[
			savegame
			character_id
			character_savegame
			band_leader_member_id
			index
			set_user_changed
		]
		all}
	if (<character_savegame> = <savegame>)
		character_savegame = -1
	endif
	globaltag_sanity_check_character_savegame savegame = <savegame> character_savegame = <character_savegame>
	if CharacterProfileGetCategory name = <character_id> savegame = <savegame>
		if CharacterProfileGetType name = <character_id> savegame = <savegame>
			if (<profile_category> = debug)
				printf 'Forgetting about %s, it\'s a debug character' s = <character_id>
				return
			endif
			if (<profile_type> = temporary)
				printf 'Forgetting about %s, it\'s a temporary character' s = <character_id>
				return
			endif
		endif
	endif
	set_band_member_entry {
		savegame = <savegame>
		index = <index>
		character_id = <character_id>
		character_savegame = <character_savegame>
		user_changed = <set_user_changed>
		band_leader_member_id = <band_leader_member_id>
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
			existing_stored_character_index
		]
		all}
	if IsPS3
		ScriptAssert \{'globaltag_fix_band_member0_at_join - Not for PS3'}
	endif
	array = []
	i = 1
	begin
	GetPlayerInfo <i> character_id
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
		band_leader_member_id = <existing_stored_character_index>
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
	SetPlayerInfo 1 part = ($part_priority [0])
	SetPlayerInfo 2 part = ($part_priority [1])
	SetPlayerInfo 3 part = ($part_priority [2])
	SetPlayerInfo 4 part = ($part_priority [3])
	if NOT GotParam \{savegame}
		return
	endif
endscript
default_venuetags = {
	unlocked = 0
	venue_stars = 0
	movie_played = 0
}
cheat_venuetags = {
	unlocked = 1
	venue_stars = 255
	movie_played = 1
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
		FormatText checksumname = venue_checksum 'venue_%s' s = ($LevelZones.<level_checksum>.name) AddToStringLookup = true
		if NOT GetGlobalTags savegame = <savegame> <venue_checksum> noassert = 1
			SetGlobalTags savegame = <savegame> <venue_checksum> params = {($default_venuetags)} packtype = venuetags Progression = true
		endif
		globaltag_checksum = (<globaltag_checksum> + <venue_checksum>)
		SetGlobalTags savegame = <savegame> <venue_checksum> params = {unlocked = 0} packtype = venuetags Progression = true
	endif
	array_count = (<array_count> + 1)
	repeat <array_size>
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
		if IsPS3
			FormatText checksumname = save_checksum '%p_%o_c%c' p = <part_text> o = <option> c = <controller>
		else
			FormatText checksumname = save_checksum '%p_%o_save' p = <part_text> o = <option>
		endif
	else
		if IsPS3
			FormatText checksumname = save_checksum '%o_c%c' o = <option> c = <controller>
		else
			FormatText checksumname = save_checksum '%o_save' o = <option>
		endif
	endif
	AddParam structure_name = save_struct name = <save_checksum> value = <new_value>
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
		if IsPS3
			FormatText checksumname = save_checksum '%p_%o_c%c' p = <part_text> o = <option> c = <controller>
		else
			FormatText checksumname = save_checksum '%p_%o_save' p = <part_text> o = <option>
		endif
	else
		if IsPS3
			FormatText checksumname = save_checksum '%o_c%c' o = <option> c = <controller>
		else
			FormatText checksumname = save_checksum '%o_save' o = <option>
		endif
	endif
	GetGlobalTags savegame = <savegame> progression_user_option_info param = <save_checksum>
	return user_option = (<...>.<save_checksum>)
endscript
override_audio_lag = -1
override_video_lag = -1
default_difficulty = [
	medium
	medium
	medium
	medium
]

script setup_user_option_tags \{async = 0}
	controller = <savegame>
	if IsXenonOrWinDX
		StartGameProfileSettingsRead controller = <controller>
		begin
		if GameProfileSettingsFinished controller = <controller>
			break
		endif
		conditional_async_wait async = <async> text = qs(0x85e0766e)
		repeat
		conditional_async_wait async = <async> text = qs(0xaecd25ad)
		if GetGameProfileSetting gsid = 1 controller = <controller>
			SetArrayElement arrayName = default_difficulty GlobalArray index = <controller> newValue = easy
			if (<game_setting> = 3)
				SetArrayElement arrayName = default_difficulty GlobalArray index = <controller> newValue = medium
			elseif (<game_setting> = 4)
				SetArrayElement arrayName = default_difficulty GlobalArray index = <controller> newValue = hard
			endif
		endif
	endif
	conditional_async_wait async = <async> text = qs(0xb7d614ec)
	<dolby_digital_enabled> = 0
	if IsPS3
		if IsDolbyDigitalEnabled
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
				Drum = {vol = 7 eq = 2}
				Crowd = {vol = 7}
				sfx = {vol = 7}
				Band = {vol = 7}
			}
		}
		dolby_digital = <dolby_digital_enabled>
		autosave = 1
		disable_dlc = 0
		use_tilt_for_starpower_save = 1
		enable_touch_strip_save = 1
		Hyperspeed_Guitar = 1.0
		Hyperspeed_Bass = 1.0
		Hyperspeed_Drum = 1.0
		AirInstruments = 0
		InvisibleCharacters = 0
		Gem_Set = standard_gems
		FX_Set = standard_fx
		Star_Set = standard_stars
		unpause_count = 1
		lag_audio_calibration = ($default_audio_lag)
		lag_video_calibration = ($default_video_lag)
		has_calibrated = 0
		has_saved_game = 0
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
		gamma_correction = 1.0
		default_tr_name = [qs(0x57449344) qs(0x00000000) qs(0x00000000)]
		online_game_mode = 0
		online_difficulty = 0
		online_num_songs = 0
		online_tie_breaker = 0
		online_highway = 0
		ghtunes_num_songs_rated = 0
		unlock_Cheat_ContestWinner1 = 0
		unlock_Cheat_AlwaysSlide = 0
		unlock_Cheat_AirInstruments = 0
		unlock_Cheat_InvisibleCharacters = 0
		unlock_Cheat_PerformanceMode = 0
		unlock_Cheat_Hyperspeed = 1
		unlock_Cheat_AutoKick = 0
		unlock_Cheat_FreeDrum = 1
		unlock_Cheat_SuperUser = 0
		unlock_Cheat_UnlockAllCharacters = 0
		unlock_Cheat_Invincible = 1
		unlock_Cheat_allHOPOs = 0
		unlock_Cheat_FocusMode = 0
		unlock_Cheat_HUDFreeMode = 0
		unlock_Cheat_AbsolutelyNothing = 0
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
	conditional_async_wait async = <async> text = qs(0xf897822b)
	if NOT ($override_audio_lag = -1 || $override_video_lag = -1)
		if ($override_audio_lag > 200)
			Change \{override_audio_lag = 200}
		endif
		if ($override_video_lag > 200)
			Change \{override_video_lag = 200}
		endif
		SetGlobalTags savegame = <savegame> user_options params = {lag_audio_calibration = ($override_audio_lag)}
		SetGlobalTags savegame = <savegame> user_options params = {lag_video_calibration = ($override_video_lag)}
	endif
	conditional_async_wait async = <async> text = qs(0xe18cb36a)
endscript

script get_user_option_cheat_index_state 
	RequireParams \{[
			index
			controller
		]
		all}
	if NOT GotParam \{savegame}
		GetSavegameFromController controller = <controller>
	endif
	if ((isXenon) || <controller> = 0)
		FormatText checksumname = cheatindexname 'cheat_index%d' d = <index>
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
			FormatText checksumname = cheatindexname 'cheat_index%d' d = <index>
		else
			FormatText checksumname = cheatindexname 'cheat_index%d_%c' d = <index> c = <controller>
		endif
	endif
	GetGlobalTags user_options savegame = <savegame> param = <cheatindexname>
	if NOT StructureContains structure = <...> <cheatindexname>
		FormatText checksumname = cheatindexname 'cheat_index%d' d = <index>
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
	GetSavegameFromController controller = <controller>
	if ((isXenon) || <controller> = 0)
		FormatText checksumname = cheatindexname 'cheat_index%d' d = <index>
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
			FormatText checksumname = cheatindexname 'cheat_index%d' d = <index>
		else
			FormatText checksumname = cheatindexname 'cheat_index%d_%c' d = <index> c = <controller>
		endif
	endif
	GetGlobalTags user_options savegame = <savegame> param = <cheatindexname>
	if NOT StructureContains structure = <...> <cheatindexname>
		FormatText checksumname = cheatindexname 'cheat_index%d' d = <index>
	endif
	AddParam structure_name = params name = <cheatindexname> value = <cheat_state>
	SetGlobalTags user_options savegame = <savegame> params = <params>
endscript

script setup_tutorial_tags 
	GetArraySize ($tutorial_headers)
	tutorial_header_size = <array_size>
	i = 0
	begin
	tutorial_header = ($tutorial_headers [<i>])
	FormatText checksumname = tutorial_array '%s_tutorials' s = <tutorial_header>
	GetArraySize ($<tutorial_array>)
	tutorial_array_size = <array_size>
	j = 0
	begin
	tutorial_struct = ($<tutorial_array> [<j>])
	FormatText checksumname = tutorial_complete_checksum 'tutorial_%h_%s_save' H = <tutorial_header> s = (<tutorial_struct>.id)
	AddParam structure_name = tutorial_tags name = <tutorial_complete_checksum> value = not_complete
	GetArraySize (<tutorial_struct>.lessons)
	lesson_array_size = <array_size>
	k = 0
	begin
	lesson_struct = (<tutorial_struct>.lessons [<k>])
	FormatText checksumname = lesson_complete_checksum 'tutorial_lesson_%h_%t_%s_save' H = <tutorial_header> t = (<tutorial_struct>.id) s = (<lesson_struct>.id)
	AddParam structure_name = tutorial_tags name = <lesson_complete_checksum> value = not_complete
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
	FormatText checksumname = tutorial_complete_checksum 'tutorial_%h_%s_save' H = <tutorial_header> s = <tutorial_id>
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
	FormatText checksumname = lesson_complete_checksum 'tutorial_lesson_%h_%t_%s_save' H = <tutorial_header> t = <tutorial_id> s = <lesson_id>
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
	FormatText checksumname = tutorial_complete_checksum 'tutorial_%h_%s_save' H = <tutorial_header> s = <tutorial_id>
	AddParam structure_name = tutorial_tags name = <tutorial_complete_checksum> value = <value>
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
	FormatText checksumname = lesson_complete_checksum 'tutorial_lesson_%h_%t_%s_save' H = <tutorial_header> t = <tutorial_id> s = <lesson_id>
	AddParam structure_name = tutorial_tags name = <lesson_complete_checksum> value = <value>
	SetGlobalTags savegame = <savegame> tutorials params = <tutorial_tags>
endscript

script globaltag_update_avatar_metadata 
	printscriptinfo \{'globaltag_update_avatar_metadata'}
	RequireParams \{[
			savegame
		]
		all}
	if IsAvatarSystemInitialized
		if NOT CharacterProfileGetStruct name = avatar savegame = <savegame>
			profile_struct = {}
		endif
		if NOT StructureContains structure = <profile_struct> appearance
			profile_struct = ($avatar_profile)
		endif
		printf \{'Grabbing avatar data...'}
		if NOT GetAvatarCASMetadata userid = <savegame>
			Metadata = []
			printf \{'Failed to get avatar metadata'}
		endif
		printf \{'Got it!'}
		fullbody_part = (<profile_struct>.appearance.CAS_Full_Body)
		fullbody_part = {<fullbody_part> avatar_meta_data = <Metadata>}
		UpdateStructElement struct = (<profile_struct>.appearance) element = CAS_Full_Body value = <fullbody_part>
		AddParam structure_name = profile_struct name = appearance value = <newstruct>
		CharacterProfileSetStruct savegame = <savegame> name = avatar profile_struct = <profile_struct>
	endif
endscript

script restore_globals_from_global_tags \{callmonitorcontrollerstates = 1}
	if NOT IsXenonOrWinDX
		reset_audio = 1
	elseif (($primary_controller) = <savegame>)
		reset_audio = 1
	endif
	if GotParam \{reset_audio}
		update_all_volumes_savegame savegame = <savegame>
	endif
	savegame_to_reset = <savegame>
	GetMaxPlayers
	<i> = 1
	begin
	GetPlayerInfo player = <i> controller
	if ((<controller> > -1) && (<controller> < 4))
		get_savegame_from_controller controller = <controller>
		if (<savegame_to_reset> = <savegame>)
			GetGlobalTags savegame = <savegame> user_options
			SetPlayerInfo <i> use_tilt_for_starpower = <use_tilt_for_starpower_save>
			SetPlayerInfo <i> enable_touch_strip = <enable_touch_strip_save>
		endif
	endif
	<i> = (<i> + 1)
	repeat <max_players>
	if (<callmonitorcontrollerstates> = 1)
		MonitorControllerStates
	endif
endscript

script reset_transient_tags 
	SetGlobalTags savegame = <savegame> venue_intro_flags params = {
		Z_AwardShow = 0
		Z_Cabo = 0
		z_cairo = 0
		z_carhenge = 0
		Z_CentralPark = 0
		Z_Cube = 0
		z_dragrace = 0
		z_dublin = 0
		Z_EasterIsland = 0
		z_freakshow = 0
		Z_Gorge = 0
		z_lhc = 0
		Z_Mall = 0
		z_mexicocity = 0
		Z_Montreux = 0
		z_nashville = 0
		z_neworleans = 0
		z_norway = 0
		Z_Paris = 0
		z_sanfrancisco = 0
		Z_Space = 0
		z_Studio = 0
		z_subway = 0
		Z_Tokyo = 0
		z_vegas = 0
		Z_Visualizer = 0
	}
	SetGlobalTags savegame = <savegame> celeb_intro_flags params = {
		c_DontSpeak = 0
		c_JustAGirl = 0
		c_LoveStory = 0
		c_PictureToBurn = 0
		c_SheWillBeLoved = 0
		c_YouBelongWithMe = 0
	}
	SetGlobalTags savegame = <savegame> venue_encore_flags params = {
		Z_AwardShow = 0
		Z_Cabo = 0
		z_cairo = 0
		z_carhenge = 0
		Z_CentralPark = 0
		Z_Cube = 0
		z_dragrace = 0
		z_dublin = 0
		Z_EasterIsland = 0
		z_freakshow = 0
		Z_Gorge = 0
		z_lhc = 0
		z_mexicocity = 0
		Z_Montreux = 0
		z_nashville = 0
		z_neworleans = 0
		z_norway = 0
		Z_Paris = 0
		z_sanfrancisco = 0
		Z_Space = 0
		z_Studio = 0
		z_subway = 0
		Z_Tokyo = 0
		z_vegas = 0
		Z_Visualizer = 0
	}
endscript

script setup_unlocks \{globaltag_checksum = None}
	GetArraySize ($Bonus_Videos)
	index = 0
	begin
	unlocked = 1
	if NOT StructureContains structure = ($Bonus_Videos [<index>]) unlocked
		unlocked = 0
	endif
	video_checksum = ($Bonus_Videos [<index>].id)
	SetGlobalTags savegame = <savegame> <video_checksum> params = {unlocked = <unlocked>} packtype = unlockedtags
	globaltag_checksum = (<globaltag_checksum> + <video_checksum>)
	<index> = (<index> + 1)
	repeat <array_size>
	index = 0
	GetArraySize ($song_unlock_new_profile)
	begin
	song = (($song_unlock_new_profile) [<index>])
	globaltag_checksum = (<globaltag_checksum> + <song>)
	SetGlobalTags savegame = <savegame> <song> params = {unlocked = 1}
	<index> = (<index> + 1)
	repeat <array_size>
	return globaltag_checksum = <globaltag_checksum>
endscript

script GlobalTags_UnlockAll \{songs_only = 0}
	if NOT GotParam \{difficulty}
		GetFirstPlayer
		GetPlayerInfo <player> difficulty
	endif
	get_savegame_from_controller controller = ($primary_controller)
	create_loading_screen
	if NOT (<songs_only> = 1)
		array_count = 0
		GetArraySize \{$Preset_Musician_Profiles_Locked}
		if (<array_size>)
			begin
			if StructureContains structure = ($Preset_Musician_Profiles_Locked [<array_count>]) locked
				unlock_profile id = ($Preset_Musician_Profiles_Locked [<array_count>].name) savegame = <savegame>
			endif
			array_count = (<array_count> + 1)
			repeat <array_size>
		endif
		array_count = 0
		GetArraySize \{$Bonus_Videos}
		if (<array_size>)
			begin
			SetGlobalTags savegame = <savegame> ($Bonus_Videos [<array_count>].id) params = {unlocked = 1}
			array_count = (<array_count> + 1)
			repeat <array_size>
		endif
	endif
	setup_gigtags \{cheat
		globaltag_checksum = None}
	setup_venuetags \{cheat
		globaltag_checksum = None}
	destroy_loading_screen
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
	master_list_size = <array_size>
	i = 0
	begin
	part = ((($master_editable_list) [<i>]).part)
	GetArraySize ($<part>)
	if (<array_size> > 0)
		j = 0
		begin
		if StructureContains structure = (($<part>) [<j>]) locked
			set_cas_item_unlocked_flag part = <part> desc_id = ((($<part>) [<j>]).desc_id) savegame = <savegame>
		endif
		if StructureContains structure = (($<part>) [<j>]) cap_textures
			unlock_purchase_all_cas_texture_pieces textures = ((($<part>) [<j>]).cap_textures) savegame = <savegame>
		endif
		j = (<j> + 1)
		repeat <array_size>
	endif
	i = (<i> + 1)
	repeat <master_list_size>
endscript

script unlock_purchase_all_cas_texture_pieces 
	GetArraySize <textures>
	i = 0
	if (<array_size> > 0)
		begin
		entry = (<textures> [<i>])
		if StructureContains structure = <entry> preset_layers
			unlock_purchase_all_cas_texture_pieces_layers layers = (<entry>.preset_layers) savegame = <savegame>
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script unlock_purchase_all_cas_texture_pieces_layers 
	GetArraySize <layers>
	i = 0
	if (<array_size> > 0)
		begin
		entry = (<layers> [<i>])
		if StructureContains structure = <entry> mask
			unlock_purchase_all_cas_texture_pieces_layers_mask mask = (<entry>.mask) savegame = <savegame>
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script unlock_purchase_all_cas_texture_pieces_layers_mask 
	GetArraySize <mask>
	i = 0
	if (<array_size> > 0)
		begin
		entry = (<mask> [<i>])
		if StructureContains structure = <entry> locked
			if StructureContains structure = <entry> pattern
				set_cas_texture_unlocked_flag texture = (<entry>.pattern) savegame = <savegame>
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
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
	return \{false}
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
	return \{false}
endscript

script get_current_band_name 
	if NOT GotParam \{savegame}
		get_savegame_from_controller \{controller = $primary_controller}
	endif
	if SaveGameGetProgression savegame = <savegame>
		FormatText checksumname = Field 'progression_header%d' d = <Progression> AddToStringLookup = true
		GetGlobalTags <Field> savegame = <savegame> param = progression_name
		return true band_name = <progression_name>
	endif
	return \{false}
endscript

script setup_achievement_tags 
	SetGlobalTags savegame = <savegame> achievement_info params = {
		online_pro_faceoff_games_played = 0
		secret_phrase_bitflag_0 = 0
		secret_phrase_bitflag_1 = 0
		secret_phrase_bitflag_2 = 17825792
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

script set_online_match_info \{ranked = 0
		won = 0
		host = 0
		standard_controller = 0}
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
		return \{false}
	endif
endscript

script setup_gigtags 
	SetGlobalTags savegame = <savegame> career_progression_tags params = {($progression_tags)} Progression = true
	globaltag_checksum = (<globaltag_checksum> + career_progression_tags)
	<gig_tags> = ($default_gig_tags)
	if GotParam \{cheat}
		<gig_tags> = ($cheat_gig_tags)
	endif
	GetArraySize \{$progression_gig_list}
	num_zones = <array_size>
	index = 0
	begin
	gig_list = (($progression_gig_list [<index>]).gig_list)
	GetArraySize ($<gig_list>)
	num_gigs = <array_size>
	if (<num_gigs> > 0)
		gig_index = 0
		begin
		gig_checksum = ($<gig_list> [<gig_index>])
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

script format_globaltag_song_checksum 
	if NOT GotParam \{difficulty}
		GetFirstPlayer
		GetPlayerInfo <player> difficulty
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
	FormatText checksumname = song_checksum '%s%p%d%a' s = <song_name> p = <part_text> d = <difficulty_text_nl> a = <append> AddToStringLookup = true
	return song_checksum = <song_checksum>
endscript

script format_globaltag_gigname 
	RequireParams \{[
			setlist_prefix
		]
		all}
	if GotParam \{gignum}
		FormatText TextName = gig 'gig%g' g = (<gignum>)
	endif
	RequireParams \{[
			setlist_prefix
			gig
		]
		all}
	FormatText checksumname = gig_name '%s_%g' s = <setlist_prefix> g = <gig> AddToStringLookup = true
	return gig_name = <gig_name>
endscript

script setup_quickplay_song_tags 
	if GotParam \{allsongs}
		GetSonglistSize
		if (<array_size> > 0)
			i = 0
			begin
			GetSonglistChecksum index = <i>
			get_song_saved_in_globaltags song = <song_checksum>
			if (<saved_in_globaltags> = 1)
				SetGlobalTags savegame = <savegame> <song_checksum> params = {unlocked = 0}
			endif
			i = (<i> + 1)
			repeat <array_size>
		endif
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
	SetGlobalTags savegame = <savegame> songlist_options params = {show_more_info = ($g_songlist_show_more_info) show_GHTunes = ($g_songlist_show_GHTunes)}
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
	LockGlobalTags \{freeplay_check_off}
	LockGlobalTags \{off}
	get_num_savegames
	if (<num_savegames> > 0)
		savegame = 0
		begin
		setup_download_song_killswitch savegame = <savegame>
		<savegame> = (<savegame> + 1)
		repeat <num_savegames>
	endif
	LockGlobalTags
	LockGlobalTags \{freeplay_check_on}
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
	FormatText TextName = arrayappend '_array%d' d = <i>
	ExtendCrc <array_name> <arrayappend> out = arrayid
	SetGlobalTags savegame = <savegame> <arrayid> params = {} packtype = <packtype>
	globaltag_checksum = (<globaltag_checksum> + <arrayid>)
	i = (<i> + 1)
	repeat <max_size>
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
	return array_size = <array_size>
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
	if (<index> < <array_size>)
		GetGlobalTags savegame = <savegame> out = contents (<valid_entries> [<index>])
		return true element = <contents>
	endif
	return \{false}
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
	if (<index> < <array_size>)
		LockGlobalTags \{off}
		SetGlobalTags savegame = <savegame> (<valid_entries> [<index>]) params = <element>
		LockGlobalTags
		return \{true}
	endif
	return \{false}
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
	if (<array_size> < <max_size>)
		i = 0
		begin
		FormatText TextName = arrayappend '_array%d' d = <i>
		ExtendCrc <array_name> <arrayappend> out = arrayid
		if NOT ArrayContains array = <valid_entries> contains = <arrayid>
			AddArrayElement array = <valid_entries> element = <arrayid>
			SetGlobalTags savegame = <savegame> <array_name> params = {valid_entries = <array> max_size = <max_size>}
			LockGlobalTags \{off}
			SetGlobalTags savegame = <savegame> <arrayid> params = <element>
			LockGlobalTags
			return \{true}
		endif
		i = (<i> + 1)
		repeat (<array_size> + 1)
	endif
	return \{false}
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
	if (<array_size> <= <max_size>)
		RemoveArrayElement array = <valid_entries> index = <index>
		SetGlobalTags savegame = <savegame> <array_name> params = {valid_entries = <array> max_size = <max_size>}
		return \{true}
	endif
	return \{false}
endscript

script globaltag_getarraychecksum 
	RequireParams \{[
			savegame
			array_name
		]
		all}
	array_checksum = arse
	globaltag_getarraysize savegame = <savegame> array_name = <array_name>
	if (<array_size> > 0)
		i = 0
		begin
		globaltag_getarrayelement savegame = <savegame> array_name = <array_name> index = <i>
		GenerateChecksumFromStruct \{StructName = element}
		array_checksum = (<array_checksum> + <structure_checksum>)
		i = (<i> + 1)
		repeat <array_size>
	endif
	return array_checksum = <array_checksum>
endscript
neversoft_hiscore_names = [
	qs(0xb04bd058)
	qs(0x74a4f5b2)
	qs(0xf90c9ba4)
	qs(0x7a0bf827)
	qs(0x98b08100)
	qs(0x33a6db48)
	qs(0x2c96652f)
	qs(0x0620502c)
	qs(0x7c5e7e2a)
	qs(0x2b23067f)
	qs(0xe597476a)
	qs(0xb3329772)
	qs(0x7dfa04b1)
	qs(0x5264c8c7)
	qs(0xea4cce1a)
	qs(0x99af13c3)
	qs(0xae8c4f92)
	qs(0x9aefab1d)
	qs(0x6014ee7e)
	qs(0xb702ad8f)
	qs(0x9c95a4f0)
	qs(0x27c78c1e)
	qs(0xe044f1d3)
	qs(0x1241077a)
	qs(0xbf9282d5)
	qs(0x07d41898)
	qs(0x32fdd64d)
	qs(0xe0fc7092)
	qs(0x1f047d36)
	qs(0xb995ed0a)
	qs(0x99af13c3)
	qs(0xc8d4b6ad)
	qs(0x0239009e)
	qs(0x5dae66e8)
	qs(0xe7985f58)
	qs(0xcc70ede8)
	qs(0x8625f718)
	qs(0x2b995cc3)
	qs(0x65528b9b)
	qs(0xae98e27b)
	qs(0xb1fb072a)
	qs(0x913e8e7d)
	qs(0xe7985f58)
	qs(0x1c2cbad7)
	qs(0x2281e9fb)
	qs(0xc52d75f2)
	qs(0x7930c364)
	qs(0xc7c9b7b7)
	qs(0xea0851dc)
	qs(0xe9587cb9)
	qs(0x83cd65a8)
	qs(0xa534a729)
	qs(0xb783d33a)
	qs(0xdf8b500e)
	qs(0x605449ea)
	qs(0xad0d2e6d)
	qs(0x21beeaea)
	qs(0xd4cccf2b)
	qs(0x024460ac)
	qs(0x7dbf2993)
	qs(0x4718d6af)
	qs(0x4d9197d3)
	qs(0xfc0d089e)
	qs(0x59218c1f)
	qs(0xac803eb9)
	qs(0x525d3733)
	qs(0x38f5e984)
	qs(0x980adbbc)
	qs(0xca4ca63e)
	qs(0x1c7bd9b3)
]
