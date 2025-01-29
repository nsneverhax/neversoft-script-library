default_globaltag_checksum = initial_v158
debug_saves = 0
globaltag_checksum = empty
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
	drum = {
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
g_globaltag_freeplay_check_stack = 0

script conditional_async_wait \{text = qs(0xfe15cfe7)
		async = 0
		frame_length = 32}
	if (<async> = 1)
		if ($g_conditional_async_wait_time = -1)
			GetTrueStartTime
			Change g_conditional_async_wait_time = <starttime>
		endif
		GetTrueElapsedTime starttime = ($g_conditional_async_wait_time)
		if (<ElapsedTime> < 0)
			GetTrueStartTime
			Change g_conditional_async_wait_time = <starttime>
		endif
		if (<ElapsedTime> > <frame_length>)
			if NOT GotParam \{no_wait}
				Wait \{1
					gameframe}
			endif
			GetTrueStartTime
			Change g_conditional_async_wait_time = <starttime>
			if GotParam \{print_time}
				finalprintf qs(0x755ac6bc) s = <text> t = <ElapsedTime>
			endif
		else
			if GotParam \{print_time}
				finalprintf qs(0x4ccd2fa6) s = <text> t = <ElapsedTime>
			endif
		endif
	endif
endscript

script globaltagsavegamesetprogression \{savegame = 0
		Progression = 0
		async = 0}
	if (<async> = 0)
		savegamesetprogression savegame = <savegame> Progression = <Progression>
	else
		savegamesetprogression savegame = <savegame> Progression = <Progression> start
		reset_progression_atoms savegame = <savegame> force_update = 0 async = 1
		savegamesetprogression savegame = <savegame> Progression = <Progression> end
	endif
endscript

script reset_globaltags savegame = ($primary_controller) async = 0
	globaltag_checksum = ($default_globaltag_checksum)
	lockglobaltags \{freeplay_check_off}
	lockglobaltags \{OFF}
	savegamereset savegame = <savegame>
	printf 'Resetting GlobalTags for savegame %d' d = <savegame>
	conditional_async_wait async = <async> text = qs(0x7398f1b3)
	amount = 1
	<idx> = 0
	begin
	if setupsongtags savegame = <savegame> globaltag_checksum = <globaltag_checksum> start = <idx> count = <amount>
		break
	endif
	conditional_async_wait async = <async> text = qs(0x612d5e5d)
	<idx> = (<idx> + <amount>)
	repeat
	conditional_async_wait async = <async> text = qs(0xd9913938)
	setup_user_option_tags savegame = <savegame> globaltag_checksum = <globaltag_checksum> async = <async>
	setup_user_offline_rock_records savegame = <savegame>
	conditional_async_wait async = <async> text = qs(0x6c3a8b00)
	setup_tutorial_tags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	setup_unlocks savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	setup_custom_character_tags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	conditional_async_wait async = <async> text = qs(0x7e8f24ee)
	setup_unlock_tags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	SetGlobalTags savegame = <savegame> net params = {prev_net_settings = local}
	setup_achievement_tags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	setup_cas_helper_tags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	setup_saved_instrument_tags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	conditional_async_wait async = <async> text = qs(0xfcfa66e4)
	jam_reset_controller_directory_listing savegame = <savegame>
	Change \{ghtunes_verified = 0}
	conditional_async_wait async = <async> text = qs(0x21f22a0b)
	SetGlobalTags savegame = <savegame> check_guid params = {user_id0 = -1 user_id1 = -1}
	conditional_async_wait async = <async> text = qs(0x334785e5)
	setup_quickplay_tags savegame = <savegame>
	setup_venuetags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	setup_playlist_tags savegame = <savegame>
	setup_songlist_tags savegame = <savegame>
	setup_universal_help_tags savegame = <savegame>
	conditional_async_wait async = <async> text = qs(0x872fc99c)
	setup_progression_slots savegame = <savegame> globaltag_checksum = <globaltag_checksum> async = <async>
	conditional_async_wait async = <async> text = qs(0x959a6672)
	SetGlobalTags savegame = <savegame> progression_user_option_info params = {($default_progression_useroptiontags)}
	setup_band_member_tags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	conditional_async_wait async = <async> text = qs(0x2d260117)
	setup_global_atoms savegame = <savegame> globaltag_checksum = <globaltag_checksum> async = <async>
	conditional_async_wait async = <async> text = qs(0x162cda39)
	setup_download_song_killswitch savegame = <savegame>
	conditional_async_wait async = <async> text = qs(0xae90bd5c)
	clearachievementcache controller_id = <savegame>
	getpackedstructvaliditychecksum
	globaltag_checksum = (<globaltag_checksum> + <validity_checksum>)
	SetGlobalTags savegame = <savegame> globaltag_checksum params = {globaltag_checksum = <globaltag_checksum>}
	Change globaltag_checksum = <globaltag_checksum>
	SetGlobalTags savegame = <savegame> cag_presets params = {cag_presets = ($cag_initial_presets)}
	SetGlobalTags savegame = <savegame> cab_presets params = {cab_presets = ($cab_initial_presets)}
	SetArrayElement ArrayName = globaltags_to_invalidate globalarray index = <savegame> NewValue = 0
	restore_globals_from_global_tags savegame = <savegame> callmonitorcontrollerstates = 0
	if demobuild
		if ($g_kiosk_demo = 1)
			SetGlobalTags savegame = <savegame> user_options params = {
				unlock_cheat_autokick = 1
			}
		endif
	endif
	SetGlobalTags \{slot_illumination
		params = {
			Enabled = 1
		}}
	SetArrayElement globalarray ArrayName = g_facebook_can_post index = <savegame> NewValue = 0
	SetArrayElement globalarray ArrayName = g_twitter_can_post index = <savegame> NewValue = 0
	lockglobaltags
	lockglobaltags \{freeplay_check_on}
	conditional_async_wait async = <async> text = qs(0x0e90be39)
	sanity_check_fix_deleted_characters
endscript

script setup_global_atoms \{savegame = !i1768515945
		force_update = 1
		async = 0}
	conditional_async_wait async = <async> text = qs(0x941b71c3)
	completed_atoms_array = []
	create_quickplay_rewards_atoms_array {savegame = <savegame> completed_atoms_array = <completed_atoms_array> async = <async>}
	conditional_async_wait async = <async> text = qs(0xbf362200)
	RegisterAtoms savegame = <savegame> atoms = <completed_atoms_array> global_atoms = 1
	conditional_async_wait async = <async> text = qs(0xa62d1341)
	if (<force_update> = 1)
		UpdateAtoms savegame = <savegame> global_atoms = 1
	endif
	conditional_async_wait async = <async> text = qs(0xe96c8586)
endscript
default_progressionheader = {
	progression_name = qs(0x4dcda8f7)
	stars = 0
	award_points = 0
	progression_in_use = 0
}

script setup_progression_slots \{async = 0}
	i = 0
	begin
	reset_progression_slot savegame = <savegame> slot = <i> globaltag_checksum = <globaltag_checksum> async = <async>
	i = (<i> + 1)
	conditional_async_wait async = <async> text = qs(0xfcd818d0)
	repeat $num_savegame_progressions
	savegamesetprogression savegame = <savegame> no_progression
	conditional_async_wait async = <async> text = qs(0xee6db73e)
	<progression_name> = qs(0x2a1c046a)
	globaltagsavegamesetprogression savegame = <savegame> Progression = 0 async = <async>
	conditional_async_wait async = <async> text = qs(0x56d1d05b)
	SetGlobalTags savegame = <savegame> progression_header0 params = {progression_name = <progression_name> progression_in_use = 1}
	conditional_async_wait async = <async> text = qs(0xcb06e8e2)
	return globaltag_checksum = <globaltag_checksum>
endscript

script reset_progression_slot \{async = 0}
	RequireParams \{[
			savegame
			slot
		]
		all}
	globaltagsavegamesetprogression savegame = <savegame> Progression = <slot> async = <async>
	conditional_async_wait async = <async> text = qs(0x7a4c6a7e)
	lockglobaltags \{push_progression_writes_only}
	conditional_async_wait async = <async> text = qs(0x68f9c590)
	savegamereset savegame = <savegame> progression_only
	conditional_async_wait async = <async> text = qs(0xd045a2f5)
	setup_progression_globaltags async = <async> savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	conditional_async_wait async = <async> text = qs(0x4d929a4c)
	lockglobaltags \{pop_progression_writes_only}
	conditional_async_wait async = <async> text = qs(0xf52efd29)
	reset_progression_atoms savegame = <savegame> async = <async>
	conditional_async_wait async = <async> text = qs(0xe79b52c7)
	formatText checksumName = Field 'progression_header%d' d = <slot> AddToStringLookup = true
	SetGlobalTags savegame = <savegame> <Field> params = ($default_progressionheader)
	conditional_async_wait async = <async> text = qs(0x5f2735a2)
	return globaltag_checksum = <globaltag_checksum>
endscript

script setup_progression_globaltags 
	GetTrueStartTime
	formatText checksumName = band_unique_id 'band_info_%d' d = <starttime>
	SetGlobalTags savegame = <savegame> progression_band_info Progression = true params = {
		band_unique_id = <band_unique_id>
	}
	reset_transient_tags savegame = <savegame> struct_name = venue_intro_flags
	reset_transient_tags savegame = <savegame> struct_name = celeb_intro_flags
	setup_chaptertags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	return globaltag_checksum = <globaltag_checksum>
endscript

script reset_globaltags_all \{async = 0}
	get_num_savegames
	if (<num_savegames> > 0)
		savegame = 0
		begin
		reset_globaltags savegame = <savegame> async = <async>
		<savegame> = (<savegame> + 1)
		repeat <num_savegames>
	endif
	Change \{guitar_globaltags_loaded = 1}
	if NOT GotParam \{boot}
		cheat_turnoffalllocked
		monitorcontrollerstates
	endif
endscript

script reset_savegame 
	RequireParams \{[
			savegame
		]
		all}
	destroy_friend_feed
	reset_globaltags savegame = <savegame>
	if NOT GotParam \{no_invalidate_device}
	endif
	cheat_turnoffalllocked
	monitorcontrollerstates
endscript

script init_savegames 
	PushMemProfile \{'savegames'}
	get_savegame_constants
	savegamesysteminit {
		max_savegames = <num_savegames>
		max_global_structs = <max_global_structs>
		global_buckets = <global_buckets>
		max_progression_structs = <max_progression_structs>
		progression_buckets = <progression_buckets>
		max_progressions = $num_savegame_progressions
		progression_atom_buffersize = (8 * 1024)
		progression_struct_buffersize = (16 * 1024)
		max_car_photos = 0
	}
	PopMemProfile
endscript

script get_num_savegames 
	getmaxlocalplayers
	if ((isps3) || (isngc))
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
	return \{FALSE}
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
	SetArrayElement ArrayName = globaltags_to_invalidate globalarray index = <savegame> NewValue = 1
endscript
default_songtags_global = {
	challenge01_best_score = 0
	challenge02_best_score = 0
	challenge03_best_score = 0
	challenge04_best_score = 0
	challenge05_best_score = 0
	challenge06_best_score = 0
	challenge07_best_score = 0
	challenge08_best_score = 0
	challenge09_best_score = 0
	challenge10_best_score = 0
	challenge11_best_score = 0
	challenge12_best_score = 0
	challenge01_grade = 0
	challenge02_grade = 0
	challenge03_grade = 0
	challenge04_grade = 0
	challenge05_grade = 0
	challenge06_grade = 0
	challenge07_grade = 0
	challenge08_grade = 0
	challenge09_grade = 0
	challenge10_grade = 0
	challenge11_grade = 0
	challenge12_grade = 0
	challenge01_best_diff = 0
	challenge02_best_diff = 0
	challenge03_best_diff = 0
	challenge04_best_diff = 0
	challenge05_best_diff = 0
	challenge06_best_diff = 0
	challenge07_best_diff = 0
	challenge08_best_diff = 0
	challenge09_best_diff = 0
	challenge10_best_diff = 0
	challenge11_best_diff = 0
	challenge12_best_diff = 0
	qp_power_best_score = 0
	qp_power_best_diff = 0
	qp_power_best_stars = 0
	qp_power_best_instrument = 0
	qp_performance_stars = 0
	unlocked = 1
	num_times_played = 0
	setlist_bestscore_guitar_beginner = 0
	setlist_beststars_guitar_beginner = 0
	setlist_bestpercentage_guitar_beginner = 0
	setlist_bestscore_guitar_easy = 0
	setlist_beststars_guitar_easy = 0
	setlist_bestpercentage_guitar_easy = 0
	setlist_bestscore_guitar_medium = 0
	setlist_beststars_guitar_medium = 0
	setlist_bestpercentage_guitar_medium = 0
	setlist_bestscore_guitar_hard = 0
	setlist_beststars_guitar_hard = 0
	setlist_bestpercentage_guitar_hard = 0
	setlist_bestscore_guitar_expert = 0
	setlist_beststars_guitar_expert = 0
	setlist_bestpercentage_guitar_expert = 0
	setlist_bestscore_bass_beginner = 0
	setlist_beststars_bass_beginner = 0
	setlist_bestpercentage_bass_beginner = 0
	setlist_bestscore_bass_easy = 0
	setlist_beststars_bass_easy = 0
	setlist_bestpercentage_bass_easy = 0
	setlist_bestscore_bass_medium = 0
	setlist_beststars_bass_medium = 0
	setlist_bestpercentage_bass_medium = 0
	setlist_bestscore_bass_hard = 0
	setlist_beststars_bass_hard = 0
	setlist_bestpercentage_bass_hard = 0
	setlist_bestscore_bass_expert = 0
	setlist_beststars_bass_expert = 0
	setlist_bestpercentage_bass_expert = 0
	setlist_bestscore_drum_beginner = 0
	setlist_beststars_drum_beginner = 0
	setlist_bestpercentage_drum_beginner = 0
	setlist_bestscore_drum_easy = 0
	setlist_beststars_drum_easy = 0
	setlist_bestpercentage_drum_easy = 0
	setlist_bestscore_drum_medium = 0
	setlist_beststars_drum_medium = 0
	setlist_bestpercentage_drum_medium = 0
	setlist_bestscore_drum_hard = 0
	setlist_beststars_drum_hard = 0
	setlist_bestpercentage_drum_hard = 0
	setlist_bestscore_drum_expert = 0
	setlist_beststars_drum_expert = 0
	setlist_bestpercentage_drum_expert = 0
	setlist_bestscore_vocals_beginner = 0
	setlist_beststars_vocals_beginner = 0
	setlist_bestpercentage_vocals_beginner = 0
	setlist_bestscore_vocals_easy = 0
	setlist_beststars_vocals_easy = 0
	setlist_bestpercentage_vocals_easy = 0
	setlist_bestscore_vocals_medium = 0
	setlist_beststars_vocals_medium = 0
	setlist_bestpercentage_vocals_medium = 0
	setlist_bestscore_vocals_hard = 0
	setlist_beststars_vocals_hard = 0
	setlist_bestpercentage_vocals_hard = 0
	setlist_bestscore_vocals_expert = 0
	setlist_beststars_vocals_expert = 0
	setlist_bestpercentage_vocals_expert = 0
	setlist_bestscore_band_beginner = 0
	setlist_beststars_band_beginner = 0
	setlist_bestpercentage_band_beginner = 0
	setlist_bestscore_band_easy = 0
	setlist_beststars_band_easy = 0
	setlist_bestpercentage_band_easy = 0
	setlist_bestscore_band_medium = 0
	setlist_beststars_band_medium = 0
	setlist_bestpercentage_band_medium = 0
	setlist_bestscore_band_hard = 0
	setlist_beststars_band_hard = 0
	setlist_bestpercentage_band_hard = 0
	setlist_bestscore_band_expert = 0
	setlist_beststars_band_expert = 0
	setlist_bestpercentage_band_expert = 0
}

script setup_unlock_tags 
	SetGlobalTags savegame = <savegame> unlocked_profiles params = {unlocked_profiles = []}
	SetGlobalTags savegame = <savegame> unlocked_cas_items params = {unlocked_cas_items = []}
	SetGlobalTags savegame = <savegame> unlocked_cas_outfit_presets params = {unlocked_cas_outfit_presets = []}
endscript

script setup_custom_character_tags 
	characterprofileinitglobaltags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	SetGlobalTags savegame = <savegame> custom_character_order params = {custom_character_order = []}
	return globaltag_checksum = <globaltag_checksum>
endscript
initial_random_bands = [
	{
		member0 = gh_rocker_axel
		member1 = gh_rocker_austin_tejas
		member2 = gh_rocker_johnny
		member3 = gh_rocker_judy
	}
	{
		member0 = gh_rocker_echo_tesla
		member1 = gh_rocker_johnny
		member2 = gh_rocker_pandora
		member3 = gh_rocker_lars
	}
	{
		member0 = gh_rocker_axel
		member1 = gh_rocker_echo_tesla
		member2 = gh_rocker_pandora
		member3 = gh_rocker_lars
	}
	{
		member0 = gh_rocker_echo_tesla
		member1 = gh_rocker_axel
		member2 = gh_rocker_judy
		member3 = gh_rocker_pandora
	}
	{
		member0 = gh_rocker_pandora
		member1 = gh_rocker_johnny
		member2 = gh_rocker_judy
		member3 = gh_rocker_lars
	}
	{
		member0 = gh_rocker_echo_tesla
		member1 = gh_rocker_axel
		member2 = gh_rocker_pandora
		member3 = gh_rocker_austin_tejas
	}
]
default_band_members = {
	member0 = {
		character_id = randomcharacter
		character_savegame = -1
		user_changed = 0
		band_leader_member_id = -1
	}
	member1 = {
		character_id = randomcharacter
		character_savegame = -1
		user_changed = 0
		band_leader_member_id = -1
	}
	member2 = {
		character_id = randomcharacter
		character_savegame = -1
		user_changed = 0
		band_leader_member_id = -1
	}
	member3 = {
		character_id = randomcharacter
		character_savegame = -1
		user_changed = 0
		band_leader_member_id = -1
	}
}
override_band_members = 0

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
	formatText checksumName = member 'member%i' i = <index>
	printf 'set_band_member_entry %s %a %b %c' s = <savegame> a = <index> b = <character_id> c = <user_changed>
	params = {}
	AddParam structure_name = params Name = <member> value = {
		character_id = <character_id>
		character_savegame = <character_savegame>
		user_changed = <user_changed>
		band_leader_member_id = <band_leader_member_id>
	}
	SetGlobalTags savegame = <savegame> band_members params = <params>
endscript

script setup_band_member_tags 
	SetGlobalTags savegame = <savegame> band_members params = {($default_band_members)}
	randomize
	if demobuild
		<random_bands_pick_list> = ($g_demo_band)
	else
		<random_bands_pick_list> = ($initial_random_bands)
	endif
	GetArraySize <random_bands_pick_list>
	GetRandomValue Name = random_index integer a = 0 b = (<array_Size> - 1)
	i = 0
	begin
	formatText checksumName = member 'member%i' i = <i>
	if NOT StructureContains structure = ($default_band_members) <member>
		ScriptAssert \{'Badly formed default_band_members structure.  Do you perhaps have an old default_band_members in your startup?  (Old ones use guitar, bass, drum, vocals.  Switch to using member0, member1, member2, member3 instead.)'}
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
		<character_id> = (<random_bands_pick_list> [<random_index>].<member>)
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
	band_leader_member_id = (<...>.<member>.band_leader_member_id)
	globaltag_sanity_check_character_savegame savegame = <savegame> character_savegame = <character_savegame>
	if (<character_savegame> = -1)
		character_savegame = <savegame>
	endif
	return true character_id = <character_id> character_savegame = <character_savegame> user_changed = <user_changed> band_leader_member_id = <band_leader_member_id>
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
	if GotParam \{borrowed_from_band_leader}
		<savegame> = <borrowed_from_band_leader>
	endif
	if (<character_savegame> = <savegame>)
		character_savegame = -1
	endif
	globaltag_sanity_check_character_savegame savegame = <savegame> character_savegame = <character_savegame>
	if characterprofilegetcategory Name = <character_id> savegame = <savegame>
		if characterprofilegettype Name = <character_id> savegame = <savegame>
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
			if NOT characterprofilegetstruct savegame = <savegame> Name = <existing_character_id>
				RemoveParameter \{existing_character_id}
			else
				if NOT display_character_logic profile_struct = <profile_struct> savegame = <savegame> part = guitar
					RemoveParameter \{existing_character_id}
				endif
			endif
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
	setplayerinfo 1 part = ($part_priority [0])
	setplayerinfo 1 stored_part = ($part_priority [0])
	setplayerinfo 2 part = ($part_priority [1])
	setplayerinfo 2 stored_part = ($part_priority [1])
	setplayerinfo 3 part = ($part_priority [2])
	setplayerinfo 3 stored_part = ($part_priority [2])
	setplayerinfo 4 part = ($part_priority [3])
	setplayerinfo 4 stored_part = ($part_priority [3])
	if NOT GotParam \{savegame}
		return
	endif
endscript
default_venuetags = {
	unlocked = 1
	venue_stars = 0
}
cheat_venuetags = {
	unlocked = 1
	venue_stars = 255
}

script setup_venuetags \{globaltag_checksum = NULL}
	if GotParam \{cheat}
		<venue_tags> = $cheat_venuetags
	else
		<venue_tags> = $default_venuetags
	endif
	setup_generalvenuetags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	return globaltag_checksum = <globaltag_checksum>
endscript

script setup_generalvenuetags 
	get_LevelZoneArray_size
	<array_count> = 0
	begin
	get_LevelZoneArray_checksum index = <array_count>
	if NOT StructureContains structure = ($LevelZones.<level_checksum>) debug_only
		formatText checksumName = venue_checksum 'venue_%s' s = ($LevelZones.<level_checksum>.Name) AddToStringLookup = true
		if NOT GetGlobalTags savegame = <savegame> <venue_checksum> noassert = 1
			SetGlobalTags savegame = <savegame> <venue_checksum> params = {($default_venuetags)} packtype = venuetags
		endif
		<globaltag_checksum> = (<globaltag_checksum> + <venue_checksum>)
		SetGlobalTags savegame = <savegame> <venue_checksum> params = {unlocked = 0} packtype = venuetags
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
	SetGlobalTags savegame = <savegame> progression_user_option_info params = <save_struct>
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
default_difficulty = [
	medium
	medium
	medium
	medium
]

script setup_user_offline_rock_records \{savegame = !i1768515945}
	SetGlobalTags savegame = <savegame> offline_rock_record params = {
		roadie_versus_matches = 0 ,
		roadie_coop_matches = 0 ,
		roadie_total_score = 0 ,
		roadie_max_score = 0
	}
endscript

script setup_user_option_tags \{async = 0}
	controller = <savegame>
	if isxenonorwindx
		StartGameProfileSettingsRead controller = <controller>
		begin
		if GameProfileSettingsFinished controller = <controller>
			break
		endif
		conditional_async_wait async = <async> text = qs(0x85e0766e)
		repeat
		conditional_async_wait async = <async> text = qs(0xaecd25ad)
		if GetGameProfileSetting gsid = 1 controller = <controller>
			SetArrayElement ArrayName = default_difficulty globalarray index = <controller> NewValue = easy
			if (<game_setting> = 3)
				SetArrayElement ArrayName = default_difficulty globalarray index = <controller> NewValue = medium
			elseif (<game_setting> = 4)
				SetArrayElement ArrayName = default_difficulty globalarray index = <controller> NewValue = hard
			endif
		endif
	endif
	conditional_async_wait async = <async> text = qs(0xb7d614ec)
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
				micgain = {vol = 2}
			}
		}
		autosave = 1
		disable_dlc = 0
		use_tilt_for_starpower_save = 1
		enable_touch_strip_save = 1
		vocal_star_power_tap_save = 1
		show_challenge_icons_save = 1
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
		unlock_cheat_alwaysslide = 0
		unlock_cheat_airinstruments = 0
		unlock_cheat_invisiblecharacters = 0
		unlock_Cheat_PerformanceMode = 0
		unlock_cheat_soundcheckmode = 0
		unlock_Cheat_Hyperspeed = 1
		unlock_cheat_solohighway = 1
		unlock_cheat_autokick = 1
		unlock_cheat_freedrum = 0
		unlock_cheat_superuser = 0
		unlock_cheat_unlockallcharacters = 0
		unlock_cheat_invincible = 1
		unlock_cheat_allhopos = 0
		unlock_cheat_focusmode = 0
		unlock_cheat_hudfreemode = 0
		unlock_cheat_absolutelynothing = 0
		unlock_cheat_unlockallvenues = 0
		unlock_cheat_colorshuffle = 0
		unlock_cheat_mirrorgems = 0
		unlock_cheat_randomgems = 0
		cheat_index0 = 0
		cheat_index0_1 = 0
		cheat_index0_2 = 0
		cheat_index0_3 = 0
		cheat_index1 = 0
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
		cheat_index15_1 = 0
		cheat_index15_2 = 0
		cheat_index15_3 = 0
		cheat_index16 = 0
		cheat_index16_1 = 0
		cheat_index16_2 = 0
		cheat_index16_3 = 0
		cheat_index17 = 0
		cheat_index17_1 = 0
		cheat_index17_2 = 0
		cheat_index17_3 = 0
		cheat_index18 = 0
		cheat_index18_1 = 0
		cheat_index18_2 = 0
		cheat_index18_3 = 0
		cheat_index19 = 0
		cheat_index20 = 0
		universal_help_display = Normal
		facebook_info = {accepted_terms = 0 broadcast_enabled = 0 is_registered = 0 account_id = [0 , 0]}
		twitter_info = {accepted_terms = 0 broadcast_enabled = 0 is_registered = 0 account_id = [0 , 0]}
		social_networks_did_first_boot = 0
		quickplay_did_first_time_in = 0
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
			if ((<first_option_global>.location = Global) || (<first_option_global>.location = function))
				Global = 1
			endif
		endif
		if (<Global> = 1)
			formatText checksumName = cheatindexname 'cheat_index%d' d = <index> AddToStringLookup = true
		else
			formatText checksumName = cheatindexname 'cheat_index%d_%c' d = <index> c = <controller> AddToStringLookup = true
		endif
	endif
	GetGlobalTags user_options savegame = <savegame> param = <cheatindexname>
	if NOT StructureContains structure = <...> <cheatindexname>
		formatText checksumName = cheatindexname 'cheat_index%d' d = <index> AddToStringLookup = true
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
			if ((<first_option_global>.location = Global) || (<first_option_global>.location = function))
				Global = 1
			endif
		endif
		if (<Global> = 1)
			formatText checksumName = cheatindexname 'cheat_index%d' d = <index> AddToStringLookup = true
		else
			formatText checksumName = cheatindexname 'cheat_index%d_%c' d = <index> c = <controller> AddToStringLookup = true
		endif
	endif
	GetGlobalTags user_options savegame = <savegame> param = <cheatindexname>
	if NOT StructureContains structure = <...> <cheatindexname>
		formatText checksumName = cheatindexname 'cheat_index%d' d = <index> AddToStringLookup = true
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

script setup_universal_help_tags \{savegame = !i1768515945}
	GetArraySize ($g_universal_help_popups)
	if (<array_Size> > 0)
		<i> = 0
		begin
		ExtendCrc ($g_universal_help_popups [<i>].help_context) '_help_page_viewed' out = help_viewed_checksum
		AddParam structure_name = universal_help_tags Name = <help_viewed_checksum> value = 0
		<i> = (<i> + 1)
		repeat <array_Size>
		SetGlobalTags savegame = <savegame> universal_help params = <universal_help_tags>
	endif
endscript

script get_universal_help_globaltag \{savegame = !i1768515945
		help_context = !q1768515945}
	ExtendCrc <help_context> '_help_page_viewed' out = help_viewed_checksum
	GetGlobalTags savegame = <savegame> universal_help param = <help_viewed_checksum>
	return help_viewed_tag = (<...>.<help_viewed_checksum>)
endscript

script save_universal_help_globaltag \{savegame = !i1768515945
		help_context = !q1768515945
		viewed_value = !i1768515945}
	ExtendCrc <help_context> '_help_page_viewed' out = help_state_checksum
	AddParam structure_name = universal_help_tags Name = <help_state_checksum> value = <viewed_value>
	SetGlobalTags savegame = <savegame> universal_help params = <universal_help_tags>
endscript

script reset_universal_help_per_session_tags \{savegame = !i1768515945}
	GetArraySize ($g_universal_help_popups)
	<per_session_help_pages> = 0
	if (<array_Size> > 0)
		<i> = 0
		begin
		if (($g_universal_help_popups [<i>].triggered) = per_session)
			ExtendCrc ($g_universal_help_popups [<i>].help_context) '_help_page_viewed' out = help_viewed_checksum
			AddParam structure_name = universal_help_tags Name = <help_viewed_checksum> value = 0
			<per_session_help_pages> = (<per_session_help_pages> + 1)
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
		if (<per_session_help_pages> > 0)
			SetGlobalTags savegame = <savegame> universal_help params = <universal_help_tags>
		endif
	endif
endscript

script restore_globals_from_global_tags \{callmonitorcontrollerstates = 1}
	if NOT isxenonorwindx
		reset_audio = 1
	elseif (($primary_controller) = <savegame>)
		reset_audio = 1
	endif
	if GotParam \{reset_audio}
		update_all_volumes_savegame savegame = <savegame>
	endif
	savegame_to_reset = <savegame>
	getmaxplayers
	<i> = 1
	begin
	getplayerinfo Player = <i> controller
	if ((<controller> > -1) && (<controller> < 4))
		get_savegame_from_controller controller = <controller>
		if (<savegame_to_reset> = <savegame>)
			GetGlobalTags savegame = <savegame> user_options
			setplayerinfo <i> use_tilt_for_starpower = <use_tilt_for_starpower_save>
			setplayerinfo <i> enable_touch_strip = <enable_touch_strip_save>
			setplayerinfo <i> vocal_star_power_tap = <vocal_star_power_tap_save>
		endif
	endif
	<i> = (<i> + 1)
	repeat <max_players>
	if (<callmonitorcontrollerstates> = 1)
		monitorcontrollerstates
	endif
endscript

script reset_transient_tags \{struct_name = !q1768515945}
	GetArraySize \{$LevelZoneArray}
	<zone_index> = 0
	begin
	<venue> = ($LevelZoneArray [<zone_index>])
	if NOT StructureContains structure = ($LevelZones.<venue>) debug_only
		<zone> = ($LevelZones.<venue>.zone)
		<zone_struct> = {}
		AddParam structure_name = zone_struct Name = <zone> value = 0
		SetGlobalTags savegame = <savegame> <struct_name> params = {<zone_struct>} Progression = true
	endif
	<zone_index> = (<zone_index> + 1)
	repeat <array_Size>
endscript

script setup_unlocks \{globaltag_checksum = None}
	GetArraySize ($Bonus_videos)
	index = 0
	begin
	unlocked = 0
	if StructureContains structure = ($Bonus_videos [<index>]) unlocked
		unlocked = 1
	endif
	video_checksum = ($Bonus_videos [<index>].id)
	SetGlobalTags savegame = <savegame> <video_checksum> params = {unlocked = <unlocked>} packtype = unlockedtags
	globaltag_checksum = (<globaltag_checksum> + <video_checksum>)
	<index> = (<index> + 1)
	repeat <array_Size>
	GetArraySize ($g_bonus_art_galleries)
	index = 0
	begin
	unlocked = 0
	if StructureContains structure = ($g_bonus_art_galleries [<index>]) unlocked
		unlocked = 1
	endif
	gallery_id = ($g_bonus_art_galleries [<index>].id)
	SetGlobalTags savegame = <savegame> <gallery_id> params = {unlocked = <unlocked>} packtype = unlockedtags
	globaltag_checksum = (<globaltag_checksum> + <gallery_id>)
	<index> = (<index> + 1)
	repeat <array_Size>
	GetArraySize ($g_rocker_powertags)
	index = 0
	begin
	hero_power = ($g_rocker_powertags [<index>])
	SetGlobalTags savegame = <savegame> <hero_power> params = {power_level = 0} packtype = powertags
	globaltag_checksum = (<globaltag_checksum> + <hero_power>)
	index = (<index> + 1)
	repeat <array_Size>
	return globaltag_checksum = <globaltag_checksum>
endscript

script set_cas_texture_unlocked_flag \{texture = !q1768515945
		savegame = !i1768515945}
	GetGlobalTags unlocked_cas_textures savegame = <savegame>
	if NOT ArrayContains array = <unlocked_cas_textures> contains = <texture>
		AddArrayElement array = <unlocked_cas_textures> element = <texture>
		SetGlobalTags unlocked_cas_textures params = {unlocked_cas_textures = <array>} savegame = <savegame>
		return \{true}
	endif
	return \{FALSE}
endscript

script set_cas_item_unlocked_flag \{part = !q1768515945
		desc_id = !q1768515945
		savegame = !i1768515945}
	GetGlobalTags unlocked_cas_items savegame = <savegame>
	MangleChecksums a = <desc_id> b = <part>
	if NOT ArrayContains array = <unlocked_cas_items> contains = <mangled_ID>
		AddArrayElement array = <unlocked_cas_items> element = <mangled_ID>
		SetGlobalTags unlocked_cas_items params = {unlocked_cas_items = <array>} savegame = <savegame>
		return \{true}
	endif
	return \{FALSE}
endscript

script set_cas_outfit_preset_unlocked_flag \{outfit_preset = !q1768515945
		savegame = !i1768515945}
	GetGlobalTags unlocked_cas_outfit_presets savegame = <savegame>
	if NOT ArrayContains array = <unlocked_cas_outfit_presets> contains = <outfit_preset>
		AddArrayElement array = <unlocked_cas_outfit_presets> element = <outfit_preset>
		SetGlobalTags unlocked_cas_outfit_presets params = {unlocked_cas_outfit_presets = <array>} savegame = <savegame>
		return \{true}
	endif
	return \{FALSE}
endscript

script unlock_purchase_all_cas_parts \{savegame = !i1768515945}
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

script unlock_purchase_all_outfit_presets \{savegame = !i1768515945}
	<big_array> = (($car_presets_outfit.female) + ($car_presets_outfit.male))
	<i> = 0
	GetArraySize <big_array>
	begin
	<struct> = (<big_array> [<i>])
	if StructureContains structure = <struct> locked
		if StructureContains structure = <struct> desc_id
			set_cas_outfit_preset_unlocked_flag {
				savegame = <savegame>
				outfit_preset = (<struct>.desc_id)
			}
		endif
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
endscript

script unlock_all_career_powers \{savegame = !i1768515945}
	for_each_quest_progression_unlock {
		callback = quest_progression_set_chapter_tags
		params = {savegame = <savegame> params = {completed = 1}}
	}
	for_each_quest_progression_unlock {
		callback = quest_progression_set_chapter_tags
		params = {savegame = <savegame> params = {unlocked = 1}}
	}
endscript

script check_cas_item_unlocked_flag \{part = !q1768515945
		desc_id = !q1768515945
		savegame = !i1768515945}
	GetGlobalTags unlocked_cas_items savegame = <savegame>
	MangleChecksums a = <desc_id> b = <part>
	if ArrayContains array = <unlocked_cas_items> contains = <mangled_ID>
		return \{true}
	endif
	return \{FALSE}
endscript

script check_cas_texture_unlocked_flag \{texture = !q1768515945
		savegame = !i1768515945}
	GetGlobalTags unlocked_cas_textures savegame = <savegame>
	if ArrayContains array = <unlocked_cas_textures> contains = <texture>
		return \{true}
	endif
	return \{FALSE}
endscript

script check_cas_outfit_preset_unlocked_flag \{outfit_preset = !q1768515945
		savegame = !i1768515945}
	GetGlobalTags unlocked_cas_outfit_presets savegame = <savegame>
	if ArrayContains array = <unlocked_cas_outfit_presets> contains = <outfit_preset>
		return \{true}
	endif
	return \{FALSE}
endscript

script get_current_band_name 
	if console_is_net_career_client
		return true band_name = ($g_net_career_progression.progression_name)
	else
		if NOT GotParam \{savegame}
			get_savegame_from_controller controller = ($primary_controller)
		endif
		if savegamegetprogression savegame = <savegame>
			formatText checksumName = Field 'progression_header%d' d = <Progression> AddToStringLookup = true
			GetGlobalTags <Field> savegame = <savegame> param = progression_name
			return true band_name = <progression_name>
		endif
		return \{FALSE}
	endif
endscript

script setup_achievement_tags 
	SetGlobalTags savegame = <savegame> achievement_info params = {
		four_player_shredfest_games_played = 0
		online_pro_faceoff_games_played = 0
		quest_star_power_deployed = 0
		quest_notes_hit = 0
		quest_score = 0
		ff_clicks = 0
		quickplay_songs_completed = 0
		ghmix_tooltips_read = 0
		band_moments_completed = 0
		played_quickplay = 0
		played_faceoff = 0
		played_career = 0
		played_momentum = 0
		played_momentum_plus = 0
		played_streakers = 0
		played_do_or_die = 0
		played_perfectionist = 0
		played_elimination = 0
		played_team_faceoff = 0
		played_team_momentum = 0
		played_team_streakers = 0
		played_team_do_or_die = 0
		played_team_perfectionist = 0
		played_team_elimination = 0
		played_p8_pro_faceoff = 0
		secret_phrase_bitflag_0 = 0
		secret_phrase_bitflag_1 = 0
		secret_phrase_bitflag_2 = 17825792
		bit_mask = [0 0]
		write_offline_achievements = 1
		roadie_battle_total_games_played = 0
		roadie_battle_coop_games_played = 0
		roadie_battle_competitive_games_played = 0
		roadie_battle_total_imps_summoned = 0
		roadie_battle_other_roadie_assists = 0
	}
	get_savegame_constants
	index = 0
	begin
	formatText checksumName = achievement_checksum 'achievement_date_%d' d = <index>
	if NOT globaltagexists savegame = <savegame> <achievement_checksum> noassert = 1
		SetGlobalTags {
			savegame = <savegame>
			<achievement_checksum>
			params = {
				day = 0
				month = 0
				year = 2000
			}
			packtype = achievement_date_tags
		}
		printf 'writing achievement globaltag %i (%c)' c = <achievement_checksum> i = <index>
	endif
	index = (<index> + 1)
	repeat ($g_total_num_achievements)
endscript

script setup_cas_helper_tags 
	SetGlobalTags savegame = <savegame> cas_helper_dialogue params = {
		visit_cag = 0
		visit_cap = 0
		visit_cadrm = 0
		visit_deformation = 0
	}
endscript
default_chapter_tags = {
	unlocked = 0
	has_been_played = 0
	completed = 0
	started = 0
	encore_unlocked = 0
}
cheat_chapter_tags = {
	unlocked = 1
	has_been_played = 1
	completed = 1
	started = 1
	encore_unlocked = 1
}
default_gig_song_tags = {
	stars = 0
}
progression_tags = {
	encore_ready = 0
	career_first_time_setup = 0
	quest_map_first_time_setup = 0
	rush_set_current_song = 1
	rush_set_completed = 0
}

script has_completed_forced_career_flow 
	RequireParams \{[
			device_num
		]
		all}
	if ($skip_career_forced_flow = 1)
		career_first_time_setup = 1
	else
		if console_is_net_career_client
			<career_first_time_setup> = ($g_net_career_progression.career_progression_tags.career_first_time_setup)
		else
			GetGlobalTags career_progression_tags params = career_first_time_setup controller = <device_num>
		endif
	endif
	if (<career_first_time_setup> = 1)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script setup_chaptertags \{globaltag_checksum = NULL}
	SetGlobalTags savegame = <savegame> career_progression_tags params = {($progression_tags)} Progression = true AddToStringLookup = true
	globaltag_checksum = (<globaltag_checksum> + career_progression_tags)
	<chapter_tags> = ($default_chapter_tags)
	if GotParam \{cheat}
		<chapter_tags> = ($cheat_chapter_tags)
	endif
	<unlock_index> = 0
	GetArraySize \{$quest_progression_unlocks}
	<unlocks_size> = <array_Size>
	begin
	<inner_index> = 0
	GetArraySize ($quest_progression_unlocks [<unlock_index>])
	<unlock_array_size> = <array_Size>
	begin
	<chapter> = ($quest_progression_unlocks [<unlock_index>] [<inner_index>])
	<chapter_name> = ($<chapter>.Name)
	formatText checksumName = chapter_unlock '%s' s = <chapter_name>
	SetGlobalTags savegame = <savegame> <chapter_unlock> params = {(<chapter_tags>)} packtype = gigtags Progression = true
	<globaltag_checksum> = (<globaltag_checksum> + <chapter_unlock>)
	<songs_array> = ($<chapter>.songs)
	GetArraySize <songs_array>
	<song_array_size> = <array_Size>
	<song_index> = 0
	begin
	<song> = (<songs_array> [<song_index>])
	get_song_name song = <song>
	format_career_song_gigtag chapter_name = <chapter_name> song_name = <song_name>
	SetGlobalTags savegame = <savegame> <song_gigtag> params = {($default_gig_song_tags)} packtype = gigsongtags Progression = true
	<globaltag_checksum> = (<globaltag_checksum> + <song_gigtag>)
	<song_index> = (<song_index> + 1)
	repeat <song_array_size>
	<song> = ($<chapter>.ENCORE)
	if (<song> != None)
		get_song_name song = <song>
		format_career_song_gigtag chapter_name = <chapter_name> song_name = <song_name>
		SetGlobalTags savegame = <savegame> <song_gigtag> params = {($default_gig_song_tags)} packtype = gigsongtags Progression = true
		<globaltag_checksum> = (<globaltag_checksum> + <song_gigtag>)
	endif
	<inner_index> = (<inner_index> + 1)
	repeat <unlock_array_size>
	<unlock_index> = (<unlock_index> + 1)
	repeat <unlocks_size>
	return globaltag_checksum = <globaltag_checksum>
endscript

script format_career_song_gigtag \{chapter_name = 0x69696969
		song_name = 0x69696969}
	formatText checksumName = song_gigtag '%a_%b' a = <chapter_name> b = <song_name> AddToStringLookup = true
	return song_gigtag = <song_gigtag>
endscript

script setup_quickplay_tags \{savegame = !i1768515945}
	SetGlobalTags savegame = <savegame> quickplay_progression_tags params = {total_stars = 0 total_award_points = 0}
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
		lockglobaltags \{OFF}
		SetGlobalTags savegame = <savegame> (<valid_entries> [<index>]) params = <element>
		lockglobaltags
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
			lockglobaltags \{OFF}
			SetGlobalTags savegame = <savegame> <arrayid> params = <element> no_append = true
			lockglobaltags
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

script is_venue_unlocked \{venue = !q1768515945}
	if NOT StructureContains structure = $LevelZones <venue>
		printf 'Venue %v does not exist!' v = <venue>
		return \{FALSE}
	endif
	if NOT StructureContains structure = ($LevelZones.<venue>) debug_only
		formatText checksumName = venue_checksum 'venue_%s' s = (($LevelZones.<venue>).Name) AddToStringLookup = true
		GetGlobalTags <venue_checksum> savegame = <savegame> param = unlocked
		if (<unlocked> = 1)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script globaltag_unlock_venue \{venue = !q1768515945
		savegame = !i1768515945}
	if NOT StructureContains structure = $LevelZones <venue>
		printf 'Venue %v does not exist!' v = <venue>
		return \{FALSE}
	endif
	if StructureContains structure = ($LevelZones.<venue>) debug_only
		return \{FALSE}
	endif
	formatText checksumName = venue_checksum 'venue_%s' s = (($LevelZones.<venue>).Name) AddToStringLookup = true
	if console_is_net_career_client
		temp_struct = ($g_net_career_progression.<venue_checksum> + {unlocked = 1})
		appendstruct struct = g_net_career_progression Field = <venue_checksum> params = <temp_struct> globalstruct
	endif
	GetGlobalTags <venue_checksum> savegame = <savegame>
	if (<unlocked> = 0)
		SetGlobalTags <venue_checksum> savegame = <savegame> params = {unlocked = 1}
		return \{true}
	endif
	return \{FALSE}
endscript

script get_autosave_enabled 
	GetGlobalTags \{user_options}
	return Enabled = <autosave>
endscript

script push_disable_globaltag_freeplay_check 
	if (($g_globaltag_freeplay_check_stack) = 0)
		toggleglobaltagfreeplaycheck \{enable = 0}
	elseif (($g_globaltag_freeplay_check_stack) < 0)
		ScriptAssert \{'g_globaltag_freeplay_check_stack cannot be negative, one too many calls to push_load/push_unload'}
	endif
	Change g_globaltag_freeplay_check_stack = (($g_globaltag_freeplay_check_stack) + 1)
endscript

script pop_disable_globaltag_freeplay_check 
	Change g_globaltag_freeplay_check_stack = (($g_globaltag_freeplay_check_stack) - 1)
	if (($g_globaltag_freeplay_check_stack) = 0)
		toggleglobaltagfreeplaycheck \{enable = 1}
	elseif (($g_globaltag_freeplay_check_stack) < 0)
		ScriptAssert \{'g_globaltag_freeplay_check_stack cannot be negative, one too many calls to push_load/push_unload'}
	endif
endscript
