default_globaltag_checksum = 0xe2c2d7e9
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
	band = {
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
			gettruestarttime
			change g_conditional_async_wait_time = <starttime>
		endif
		gettrueelapsedtime starttime = ($g_conditional_async_wait_time)
		if (<elapsedtime> < 0)
			gettruestarttime
			change g_conditional_async_wait_time = <starttime>
		endif
		if (<elapsedtime> > <frame_length>)
			if NOT gotparam \{no_wait}
				wait \{1
					gameframe}
			endif
			gettruestarttime
			change g_conditional_async_wait_time = <starttime>
			if gotparam \{print_time}
				finalprintf qs(0x90d42d38) s = <text> t = <elapsedtime>
			endif
		else
			if gotparam \{print_time}
				finalprintf qs(0x466b9ed6) s = <text> t = <elapsedtime>
			endif
		endif
	endif
endscript

script globaltagsavegamesetprogression \{savegame = 0
		progression = 0
		async = 0}
	if (<async> = 0)
		savegamesetprogression savegame = <savegame> progression = <progression>
	else
		wait \{1
			gameframe}
		savegamesetprogression savegame = <savegame> progression = <progression> start
		wait \{1
			gameframe}
		reset_progression_atoms savegame = <savegame> force_update = 0 async = 1
		wait \{1
			gameframe}
		savegamesetprogression savegame = <savegame> progression = <progression> end
		wait \{1
			gameframe}
	endif
endscript

script reset_globaltags savegame = ($primary_controller) async = 0
	globaltag_checksum = ($default_globaltag_checksum)
	getcompressiontablelookupchecksum
	globaltag_checksum = (<globaltag_checksum> + <compression_lookup_table_checksum>)
	lockglobaltags \{freeplay_check_off}
	lockglobaltags \{off}
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
	conditional_async_wait async = <async> text = qs(0x6c3a8b00)
	setup_tutorial_tags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	setup_unlocks savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	setup_custom_character_tags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	conditional_async_wait async = <async> text = qs(0x7e8f24ee)
	setup_unlock_tags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	setglobaltags savegame = <savegame> net params = {prev_net_settings = local}
	setup_achievement_tags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	setup_cas_helper_tags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	setup_saved_instrument_tags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	conditional_async_wait async = <async> text = qs(0xfcfa66e4)
	jam_reset_controller_directory_listing savegame = <savegame>
	change \{ghtunes_verified = 0}
	conditional_async_wait async = <async> text = qs(0x21f22a0b)
	setglobaltags savegame = <savegame> check_guid params = {user_id0 = -1 user_id1 = -1}
	conditional_async_wait async = <async> text = qs(0x334785e5)
	setup_quickplay_tags savegame = <savegame>
	setup_venuetags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	setup_playlist_tags savegame = <savegame>
	setup_songlist_tags savegame = <savegame>
	setup_universal_help_tags savegame = <savegame>
	conditional_async_wait async = <async> text = qs(0x872fc99c)
	setup_progression_slots savegame = <savegame> globaltag_checksum = <globaltag_checksum> async = <async>
	conditional_async_wait async = <async> text = qs(0x959a6672)
	setglobaltags savegame = <savegame> progression_user_option_info params = {($default_progression_useroptiontags)}
	setup_band_member_tags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	conditional_async_wait async = <async> text = qs(0x2d260117)
	setup_global_atoms savegame = <savegame> globaltag_checksum = <globaltag_checksum> async = <async>
	conditional_async_wait async = <async> text = qs(0x162cda39)
	setup_download_song_killswitch savegame = <savegame>
	conditional_async_wait async = <async> text = qs(0xae90bd5c)
	globaltag_update_avatar_metadata savegame = <savegame>
	conditional_async_wait async = <async> text = qs(0x56f3ae6f)
	clearachievementcache controller_id = <savegame>
	getpackedstructvaliditychecksum
	globaltag_checksum = (<globaltag_checksum> + <validity_checksum>)
	setglobaltags savegame = <savegame> globaltag_checksum params = {globaltag_checksum = <globaltag_checksum>}
	change globaltag_checksum = <globaltag_checksum>
	setarrayelement arrayname = globaltags_to_invalidate globalarray index = <savegame> newvalue = 0
	restore_globals_from_global_tags savegame = <savegame> callmonitorcontrollerstates = 0
	if demobuild
		if ($g_kiosk_demo = 1)
			setglobaltags savegame = <savegame> user_options params = {
				unlock_cheat_autokick = 1
			}
		endif
	endif
	setarrayelement globalarray arrayname = g_facebook_can_post index = <savegame> newvalue = 0
	setarrayelement globalarray arrayname = g_twitter_can_post index = <savegame> newvalue = 0
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
	registeratoms savegame = <savegame> atoms = <completed_atoms_array> global_atoms = 1
	conditional_async_wait async = <async> text = qs(0xa62d1341)
	if (<force_update> = 1)
		updateatoms savegame = <savegame> global_atoms = 1
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
	globaltagsavegamesetprogression savegame = <savegame> progression = 0 async = <async>
	conditional_async_wait async = <async> text = qs(0x56d1d05b)
	setglobaltags savegame = <savegame> progression_header0 params = {progression_name = <progression_name> progression_in_use = 1}
	conditional_async_wait async = <async> text = qs(0xcb06e8e2)
	return globaltag_checksum = <globaltag_checksum>
endscript

script reset_progression_slot \{async = 0}
	requireparams \{[
			savegame
			slot
		]
		all}
	globaltagsavegamesetprogression savegame = <savegame> progression = <slot> async = <async>
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
	formattext checksumname = field 'progression_header%d' d = <slot> addtostringlookup = true
	setglobaltags savegame = <savegame> <field> params = ($default_progressionheader)
	conditional_async_wait async = <async> text = qs(0x5f2735a2)
	return globaltag_checksum = <globaltag_checksum>
endscript

script setup_progression_globaltags 
	gettruestarttime
	formattext checksumname = band_unique_id 'band_info_%d' d = <starttime>
	setglobaltags savegame = <savegame> progression_band_info progression = true params = {
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
		conditional_async_wait async = <async> text = qs(0xfcd818d0)
		mc_invalidatestoragedevice userid = <savegame>
		<savegame> = (<savegame> + 1)
		repeat <num_savegames>
	endif
	change \{guitar_globaltags_loaded = 1}
	if NOT gotparam \{boot}
		cheat_turnoffalllocked
		monitorcontrollerstates
	endif
endscript

script reset_savegame 
	requireparams \{[
			savegame
		]
		all}
	destroy_friend_feed
	gamerpictexturecancel flush_user = <savegame>
	reset_globaltags savegame = <savegame>
	if NOT gotparam \{no_invalidate_device}
		mc_invalidatestoragedevice userid = <savegame>
	endif
	cheat_turnoffalllocked
	monitorcontrollerstates
endscript

script init_savegames 
	pushmemprofile \{'savegames'}
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
	popmemprofile
endscript

script get_num_savegames 
	getmaxlocalplayers
	if isps3
		return \{num_savegames = 1}
	else
		return num_savegames = <max_players>
	endif
endscript

script get_savegame_has_saved_game 
	requireparams \{[
			savegame
		]
		all}
	getglobaltags user_options param = has_saved_game savegame = <savegame>
	if (<has_saved_game> = 1)
		return \{true}
	endif
	return \{false}
endscript

script invalidate_savegame 
	requireparams \{[
			savegame
		]
		all}
	setglobaltags savegame = <savegame> user_options params = {has_saved_game = 0}
endscript

script globaltag_sanity_check_pre_save 
	requireparams \{[
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
	setarrayelement arrayname = globaltags_to_invalidate globalarray index = <savegame> newvalue = 1
endscript

script invalidate_globaltags 
	savegame = 0
	begin
	if ($globaltags_to_invalidate [<savegame>])
		reset_globaltags savegame = <savegame>
		mc_invalidatestoragedevice userid = <savegame>
	endif
	savegame = (<savegame> + 1)
	repeat 4
	cheat_turnoffalllocked
	monitorcontrollerstates
endscript

script set_globaltag_guid controller = ($primary_controller)
	if isxenonorwindx
		if islocallysignedin controller = <controller>
			netsessionfunc func = get_user_id params = {controller_index = <controller>}
			user_id0 = (<user_id> [0])
			user_id1 = (<user_id> [1])
		else
			user_id0 = 0
			user_id1 = 0
		endif
		setglobaltags controller = <controller> check_guid params = {user_id0 = <user_id0> user_id1 = <user_id1>}
	else
		setglobaltags controller = <controller> check_guid params = {user_id0 = 1 user_id1 = 1}
	endif
endscript

script check_globaltag_guid controller = ($primary_controller)
	if isxenonorwindx
		printf qs(0xb006a6d7) i = <controller>
		if islocallysignedin controller = <controller>
			printf \{qs(0x3659a8f5)}
			current_user_id0 = 0
			current_user_id1 = 0
		else
			printf \{qs(0x0177c50b)}
			netsessionfunc func = get_user_id params = {controller_index = <controller>}
			current_user_id0 = (<user_id> [0])
			current_user_id1 = (<user_id> [1])
		endif
		getglobaltags controller = <controller> check_guid
		if (<user_id0> = <current_user_id0>)
			if (<user_id1> = <current_user_id1>)
				printf \{qs(0x2f83670c)}
				return \{true}
			endif
		endif
		printf \{qs(0xd82ab062)}
		return \{false}
	else
		getglobaltags controller = <controller> check_guid
		if (<user_id0> = 1)
			if (<user_id1> = 1)
				printf \{qs(0x2f83670c)}
				return \{true}
			endif
		endif
		return \{false}
	endif
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
	setglobaltags savegame = <savegame> unlocked_profiles params = {unlocked_profiles = []}
	setglobaltags savegame = <savegame> unlocked_cas_items params = {unlocked_cas_items = []}
	setglobaltags savegame = <savegame> unlocked_cas_textures params = {unlocked_cas_textures = []}
	setglobaltags savegame = <savegame> unlocked_cas_outfit_presets params = {unlocked_cas_outfit_presets = []}
endscript

script setup_custom_character_tags 
	characterprofileinitglobaltags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	setglobaltags savegame = <savegame> custom_character_order params = {custom_character_order = []}
	return globaltag_checksum = <globaltag_checksum>
endscript

script reset_all_preset_characters 
	characterprofilegetlist savegame = <savegame> categories = [ghrockers presetcars]
	getarraysize <profile_list>
	if (<array_size> > 0)
		i = 0
		begin
		charid = (<profile_list> [<i>])
		characterprofilegetstruct name = <charid>
		characterprofilesetstruct savegame = <savegame> name = <charid> profile_struct = <profile_struct>
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script delete_all_car_characters 
	i = 0
	begin
	formattext checksumname = id_checksum 'custom_character_%d' d = <i> addtostringlookup = true
	characterprofilesetstruct savegame = <savegame> name = <id_checksum> delete_profile
	i = (<i> + 1)
	repeat ($max_num_create_a_rockers)
	setglobaltags savegame = <savegame> custom_character_order params = {custom_character_order = []}
endscript

script set_globaltag_song_info \{part = 'guitar'
		difficulty_text_nl = 0x69696969
		song = !q1768515945}
	formattext checksumname = beststars 'setlist_beststars_%p_%d' s = (<song_prefix>) p = <part> d = <difficulty_text_nl> addtostringlookup = true
	formattext checksumname = bestscore 'setlist_bestscore_%p_%d' s = (<song_prefix>) p = <part> d = <difficulty_text_nl> addtostringlookup = true
	formattext checksumname = bestpercentage 'setlist_bestpercentage_%p_%d' s = (<song_prefix>) p = <part> d = <difficulty_text_nl> addtostringlookup = true
	params = {}
	addparam structure_name = params name = <beststars> value = <setlist_beststars>
	addparam structure_name = params name = <bestscore> value = <setlist_bestscore>
	addparam structure_name = params name = <bestpercentage> value = <setlist_bestpercentage>
	setglobaltags <song> savegame = <savegame> params = <params>
endscript

script get_formatted_songname \{part = 'guitar'}
	formattext checksumname = songname '%s%p%d' s = (<song_prefix>) p = <part> d = <difficulty_text_nl> addtostringlookup = true
	return songname = <songname>
endscript

script get_formatted_songname_for_jam_mode \{part = 'guitar'}
	formattext checksumname = songname '%s_%p_%d_quickplay' s = (<song_prefix>) p = <part> d = <difficulty_text_nl> addtostringlookup = true
	return songname = <songname>
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

script remove_avatars_from_band 
	getglobaltags savegame = <savegame> band_members
	i = 0
	begin
	get_saved_band_member savegame = <savegame> index = <i>
	if is_avatar_character savegame = <character_savegame> id = <character_id>
		cas_get_random_ghrocker savegame = <savegame>
		set_band_member_entry {
			index = <i>
			savegame = <savegame>
			character_id = <character_id>
			character_savegame = -1
			user_changed = 0
			band_leader_member_id = -1
		}
	endif
	i = (<i> + 1)
	repeat 4
endscript

script set_band_member_entry \{band_leader_member_id = -1}
	requireparams \{[
			savegame
			index
			character_id
			character_savegame
			user_changed
			band_leader_member_id
		]
		all}
	formattext checksumname = member 'member%i' i = <index>
	printf 'set_band_member_entry %s %a %b %c' s = <savegame> a = <index> b = <character_id> c = <user_changed>
	<0x8e660293> = <character_savegame>
	if (<character_savegame> = -1)
		<0x8e660293> = <savegame>
	endif
	if NOT characterprofileexists savegame = <0x8e660293> name = <character_id>
		scriptassert 'set_band_member_entry - Eek, character %a (%b) does not exist!' a = <character_id> b = <0x8e660293>
		cas_get_random_ghrocker savegame = <savegame>
		<character_savegame> = -1
	endif
	params = {}
	addparam structure_name = params name = <member> value = {
		character_id = <character_id>
		character_savegame = <character_savegame>
		user_changed = <user_changed>
		band_leader_member_id = <band_leader_member_id>
	}
	setglobaltags savegame = <savegame> band_members params = <params>
endscript

script setup_band_member_tags 
	setglobaltags savegame = <savegame> band_members params = {($default_band_members)}
	randomize
	if demobuild
		<random_bands_pick_list> = ($g_demo_band)
	else
		<random_bands_pick_list> = ($initial_random_bands)
	endif
	getarraysize <random_bands_pick_list>
	getrandomvalue name = random_index integer a = 0 b = (<array_size> - 1)
	i = 0
	begin
	formattext checksumname = member 'member%i' i = <i>
	if NOT structurecontains structure = ($default_band_members) <member>
		scriptassert \{'Badly formed default_band_members structure.  Do you perhaps have an old default_band_members in your startup?  (Old ones use guitar, bass, drum, vocals.  Switch to using member0, member1, member2, member3 instead.)'}
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
	requireparams \{[
			savegame
		]
		all}
	getglobaltags savegame = <savegame> band_members
	i = 0
	begin
	formattext checksumname = member 'member%i' i = <i>
	if NOT gotparam <member>
		scriptassert 'band member %i not found' i = <i>
	endif
	character_savegame = (<...>.<member>.character_savegame)
	if (<character_savegame> != -1)
		scriptassert 'savegame %s has a band member entry referring to savegame %b' s = <savegame> b = <character_savegame>
	endif
	i = (<i> + 1)
	repeat 4
	return band_members_array = <array>
endscript

script get_band_members_as_array 
	requireparams \{[
			savegame
		]
		all}
	getglobaltags savegame = <savegame> band_members
	array = []
	i = 0
	begin
	formattext checksumname = member 'member%i' i = <i>
	if NOT gotparam <member>
		scriptassert 'band member %i not found' i = <i>
	endif
	addarrayelement array = <array> element = (<...>.<member>.character_id)
	i = (<i> + 1)
	repeat 4
	return band_members_array = <array>
endscript

script get_saved_band_member 
	requireparams \{[
			savegame
			index
		]
		all}
	getglobaltags savegame = <savegame> band_members
	formattext checksumname = member 'member%i' i = <index>
	if NOT gotparam <member>
		scriptassert 'band member %i not found' i = <index>
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
	requireparams \{[
			savegame
		]
		all}
	get_saved_band_member index = 0 savegame = <savegame>
	return true character_id = <character_id> character_savegame = <character_savegame> user_changed = <user_changed>
endscript

script globaltag_sanity_check_character_savegame 
	requireparams \{[
			savegame
			character_savegame
		]
		all}
	if isxenon
		if (<character_savegame> != -1)
			if (<savegame> != <character_savegame>)
				if band_lobby_controller_can_save controller = <savegame>
					scriptassert \{'Profiles that can save should not be borrowing band members from other profiles'}
				endif
			endif
		endif
	endif
endscript

script globaltag_save_band_member_choice \{set_user_changed = 1
		band_leader_member_id = -1}
	requireparams \{[
			savegame
			character_id
			character_savegame
			band_leader_member_id
			index
			set_user_changed
		]
		all}
	if gotparam \{borrowed_from_band_leader}
		<savegame> = <borrowed_from_band_leader>
	endif
	if (<character_savegame> = <savegame>)
		character_savegame = -1
	endif
	globaltag_sanity_check_character_savegame savegame = <savegame> character_savegame = <character_savegame>
	if characterprofilegetcategory name = <character_id> savegame = <savegame>
		if characterprofilegettype name = <character_id> savegame = <savegame>
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
	if gotparam \{keep_unique_band}
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
	requireparams \{[
			savegame
			existing_character_id
			existing_character_savegame
			existing_stored_character_index
		]
		all}
	if isps3
		scriptassert \{'globaltag_fix_band_member0_at_join - Not for PS3'}
	endif
	array = []
	i = 1
	begin
	getplayerinfo <i> character_id
	addarrayelement array = <array> element = <character_id>
	i = (<i> + 1)
	repeat 4
	on_screen_band = <array>
	if band_lobby_controller_can_save controller = <savegame>
		existing_character_savegame = -1
		if is_ghrocker id = <existing_character_id>
			if NOT characterprofilegetstruct savegame = <savegame> name = <existing_character_id>
				removeparameter \{existing_character_id}
			else
				if NOT display_character_logic profile_struct = <profile_struct> savegame = <savegame> part = guitar
					removeparameter \{existing_character_id}
				endif
			endif
		else
			removeparameter \{existing_character_id}
		endif
	else
		if NOT is_completely_custom_musician id = <existing_character_id>
			existing_character_savegame = -1
			if (<existing_character_id> = avatar)
				removeparameter \{existing_character_id}
			endif
		else
		endif
	endif
	if gotparam \{existing_character_id}
		if is_band_member_invalid character_id = <existing_character_id> character_savegame = <existing_character_savegame>
			removeparameter \{existing_character_id}
		endif
	endif
	if gotparam \{existing_character_id}
		printf 'globaltag_fix_band_member0_at_join: Using %a %b from band leader' a = <existing_character_id> b = <existing_character_savegame>
	else
		get_saved_band_member savegame = <savegame> index = 0
		if arraycontains array = <on_screen_band> contains = <character_id>
			cas_get_random_character savegame = <savegame> part = guitar categories = [ghrockers] band_members_array = <on_screen_band>
			printf 'globaltag_fix_band_member0_at_join: Using random rocker %a' a = <character_id>
		else
			printf 'globaltag_fix_band_member0_at_join: Using existing rocker %a' a = <character_id>
		endif
		existing_character_id = <character_id>
		existing_character_savegame = <character_savegame>
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
	get_saved_band_member index = 0 savegame = <savegame>
	return {
		character_id = <character_id>
		character_savegame = <character_savegame>
	}
endscript

script globaltag_set_career_band_leader_choice 
	requireparams \{[
			savegame
			character_id
		]
		all}
	globaltag_save_band_member_choice index = 0 character_id = <character_id> savegame = <savegame> character_savegame = <savegame> keep_unique_band = 1
endscript

script globaltag_dump_band \{savegame = 0}
	requireparams \{[
			savegame
		]
		all}
	if NOT cd
		getglobaltags savegame = <savegame> band_members
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
	if NOT gotparam \{savegame}
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

script setup_venuetags \{globaltag_checksum = null}
	if gotparam \{cheat}
		<venue_tags> = $cheat_venuetags
	else
		<venue_tags> = $default_venuetags
	endif
	setup_generalvenuetags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	return globaltag_checksum = <globaltag_checksum>
endscript

script setup_generalvenuetags 
	get_levelzonearray_size
	<array_count> = 0
	begin
	get_levelzonearray_checksum index = <array_count>
	if NOT structurecontains structure = $levelzones <level_checksum>
		scriptassert '%l not found in $LevelZones' l = <level_checksum>
	endif
	if NOT structurecontains structure = ($levelzones.<level_checksum>) debug_only
		formattext checksumname = venue_checksum 'venue_%s' s = ($levelzones.<level_checksum>.name) addtostringlookup = true
		if NOT getglobaltags savegame = <savegame> <venue_checksum> noassert = 1
			setglobaltags savegame = <savegame> <venue_checksum> params = {($default_venuetags)} packtype = venuetags
		endif
		<globaltag_checksum> = (<globaltag_checksum> + <venue_checksum>)
		setglobaltags savegame = <savegame> <venue_checksum> params = {unlocked = 0} packtype = venuetags
	endif
	array_count = (<array_count> + 1)
	repeat <array_size>
	return globaltag_checksum = <globaltag_checksum>
endscript
default_progression_useroptiontags = {
	guitar_bass_flip_save = none
	guitar_difficulty_save = none
	bass_difficulty_save = none
	drum_difficulty_save = none
	vocals_difficulty_save = none
	guitar_lefty_flip_save = -1
	bass_lefty_flip_save = -1
	drum_lefty_flip_save = -1
	vocals_highway_view_save = scrolling
	guitar_hyperspeed_save = -1
	bass_hyperspeed_save = -1
	drum_hyperspeed_save = -1
	vocals_hyperspeed_save = -1
	vocals_mic_preference_save = none
	drum_double_kick_drum_save = 0
	guitar_bass_flip_c0 = none
	guitar_bass_flip_c1 = none
	guitar_bass_flip_c2 = none
	guitar_bass_flip_c3 = none
	guitar_difficulty_c0 = none
	guitar_difficulty_c1 = none
	guitar_difficulty_c2 = none
	guitar_difficulty_c3 = none
	bass_difficulty_c0 = none
	bass_difficulty_c1 = none
	bass_difficulty_c2 = none
	bass_difficulty_c3 = none
	drum_difficulty_c0 = none
	drum_difficulty_c1 = none
	drum_difficulty_c2 = none
	drum_difficulty_c3 = none
	vocals_difficulty_c0 = none
	vocals_difficulty_c1 = none
	vocals_difficulty_c2 = none
	vocals_difficulty_c3 = none
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
	vocals_mic_preference_c0 = none
	vocals_mic_preference_c1 = none
	vocals_mic_preference_c2 = none
	vocals_mic_preference_c3 = none
	drum_double_kick_drum_c0 = 0
	drum_double_kick_drum_c1 = 0
	drum_double_kick_drum_c2 = 0
	drum_double_kick_drum_c3 = 0
}

script save_progression_instrument_user_option 
	requireparams \{[
			controller
			option
			new_value
		]
		all}
	get_savegame_from_controller controller = <controller>
	if gotparam \{part}
		get_part_text_nl part = <part>
		if isps3
			formattext checksumname = save_checksum '%p_%o_c%c' p = <part_text> o = <option> c = <controller>
		else
			formattext checksumname = save_checksum '%p_%o_save' p = <part_text> o = <option>
		endif
	else
		if isps3
			formattext checksumname = save_checksum '%o_c%c' o = <option> c = <controller>
		else
			formattext checksumname = save_checksum '%o_save' o = <option>
		endif
	endif
	addparam structure_name = save_struct name = <save_checksum> value = <new_value>
	setglobaltags savegame = <savegame> progression_user_option_info params = <save_struct>
endscript

script get_progression_instrument_user_option 
	requireparams \{[
			controller
			option
		]
		all}
	get_savegame_from_controller controller = <controller>
	if gotparam \{part}
		get_part_text_nl part = <part>
		if isps3
			formattext checksumname = save_checksum '%p_%o_c%c' p = <part_text> o = <option> c = <controller>
		else
			formattext checksumname = save_checksum '%p_%o_save' p = <part_text> o = <option>
		endif
	else
		if isps3
			formattext checksumname = save_checksum '%o_c%c' o = <option> c = <controller>
		else
			formattext checksumname = save_checksum '%o_save' o = <option>
		endif
	endif
	getglobaltags savegame = <savegame> progression_user_option_info param = <save_checksum>
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
	if isxenonorwindx
		startgameprofilesettingsread controller = <controller>
		begin
		if gameprofilesettingsfinished controller = <controller>
			break
		endif
		conditional_async_wait async = <async> text = qs(0x85e0766e)
		repeat
		conditional_async_wait async = <async> text = qs(0xaecd25ad)
		if getgameprofilesetting gsid = 1 controller = <controller>
			setarrayelement arrayname = default_difficulty globalarray index = <controller> newvalue = easy
			if (<game_setting> = 3)
				setarrayelement arrayname = default_difficulty globalarray index = <controller> newvalue = medium
			elseif (<game_setting> = 4)
				setarrayelement arrayname = default_difficulty globalarray index = <controller> newvalue = hard
			endif
		endif
	endif
	conditional_async_wait async = <async> text = qs(0xb7d614ec)
	<dolby_digital_enabled> = 0
	if isps3
		if isdolbydigitalenabled
			<dolby_digital_enabled> = 1
		endif
	endif
	setglobaltags savegame = <savegame> user_options params = {
		volumes = {
			guitar = {
				mic = {vol = 7 comp = 1 rev = 2}
				vocals = {vol = 7}
				backup = {vol = 7}
				guitar = {vol = 7 eq = 2}
				bass = {vol = 7 eq = 2}
				drum = {vol = 7 eq = 2}
				crowd = {vol = 7}
				sfx = {vol = 7}
				band = {vol = 7}
			}
		}
		dolby_digital = <dolby_digital_enabled>
		autosave = 1
		use_tilt_for_starpower_save = 1
		enable_touch_strip_save = 1
		vocal_star_power_tap_save = 1
		vocals_mic_enhancement_save = 1
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
		unlock_cheat_performancemode = 0
		unlock_cheat_soundcheckmode = 0
		unlock_cheat_hyperspeed = 1
		unlock_cheat_solohighway = 1
		unlock_cheat_autokick = 1
		unlock_cheat_freedrum = 1
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
		universal_help_display = normal
		facebook_info = {accepted_terms = 0 broadcast_enabled = 0 is_registered = 0}
		twitter_info = {accepted_terms = 0 broadcast_enabled = 0 is_registered = 0}
		social_networks_did_first_boot = 0
		quickplay_did_first_time_in = 0
		has_warned_about_signin = 0
	}
	conditional_async_wait async = <async> text = qs(0xf897822b)
	if NOT ($override_audio_lag = -1 || $override_video_lag = -1)
		if ($override_audio_lag > 200)
			change \{override_audio_lag = 200}
		endif
		if ($override_video_lag > 200)
			change \{override_video_lag = 200}
		endif
		setglobaltags savegame = <savegame> user_options params = {lag_audio_calibration = ($override_audio_lag)}
		setglobaltags savegame = <savegame> user_options params = {lag_video_calibration = ($override_video_lag)}
	endif
	conditional_async_wait async = <async> text = qs(0xe18cb36a)
endscript

script get_user_option_cheat_index_state 
	requireparams \{[
			index
			controller
		]
		all}
	if NOT gotparam \{savegame}
		getsavegamefromcontroller controller = <controller>
	endif
	if ((isxenon) || <controller> = 0)
		formattext checksumname = cheatindexname 'cheat_index%d' d = <index>
	else
		cheat_struct = ($guitar_hero_cheats [<index>])
		global = 0
		if NOT structurecontains structure = <cheat_struct> options
			global = 1
		else
			<options> = (<cheat_struct>.options)
			first_option_global = (((<options> [0]).globals) [0])
			if ((<first_option_global>.location = global) || (<first_option_global>.location = function))
				global = 1
			endif
		endif
		if (<global> = 1)
			formattext checksumname = cheatindexname 'cheat_index%d' d = <index> addtostringlookup = true
		else
			formattext checksumname = cheatindexname 'cheat_index%d_%c' d = <index> c = <controller> addtostringlookup = true
		endif
	endif
	getglobaltags user_options savegame = <savegame> param = <cheatindexname>
	if NOT structurecontains structure = <...> <cheatindexname>
		formattext checksumname = cheatindexname 'cheat_index%d' d = <index> addtostringlookup = true
	endif
	return cheat_state = (<...>.<cheatindexname>) cheatindexname = <cheatindexname>
endscript

script set_user_option_cheat_index_state 
	requireparams \{[
			index
			controller
			cheat_state
		]
		all}
	getsavegamefromcontroller controller = <controller>
	if ((isxenon) || <controller> = 0)
		formattext checksumname = cheatindexname 'cheat_index%d' d = <index>
	else
		cheat_struct = ($guitar_hero_cheats [<index>])
		global = 0
		if NOT structurecontains structure = <cheat_struct> options
			global = 1
		else
			<options> = (<cheat_struct>.options)
			first_option_global = (((<options> [0]).globals) [0])
			if ((<first_option_global>.location = global) || (<first_option_global>.location = function))
				global = 1
			endif
		endif
		if (<global> = 1)
			formattext checksumname = cheatindexname 'cheat_index%d' d = <index> addtostringlookup = true
		else
			formattext checksumname = cheatindexname 'cheat_index%d_%c' d = <index> c = <controller> addtostringlookup = true
		endif
	endif
	getglobaltags user_options savegame = <savegame> param = <cheatindexname>
	if NOT structurecontains structure = <...> <cheatindexname>
		formattext checksumname = cheatindexname 'cheat_index%d' d = <index> addtostringlookup = true
	endif
	addparam structure_name = params name = <cheatindexname> value = <cheat_state>
	setglobaltags user_options savegame = <savegame> params = <params>
endscript

script setup_tutorial_tags 
	getarraysize ($tutorial_headers)
	tutorial_header_size = <array_size>
	i = 0
	begin
	tutorial_header = ($tutorial_headers [<i>])
	formattext checksumname = tutorial_array '%s_tutorials' s = <tutorial_header>
	getarraysize ($<tutorial_array>)
	tutorial_array_size = <array_size>
	j = 0
	begin
	tutorial_struct = ($<tutorial_array> [<j>])
	formattext checksumname = tutorial_complete_checksum 'tutorial_%h_%s_save' h = <tutorial_header> s = (<tutorial_struct>.id)
	addparam structure_name = tutorial_tags name = <tutorial_complete_checksum> value = not_complete
	getarraysize (<tutorial_struct>.lessons)
	lesson_array_size = <array_size>
	k = 0
	begin
	lesson_struct = (<tutorial_struct>.lessons [<k>])
	formattext checksumname = lesson_complete_checksum 'tutorial_lesson_%h_%t_%s_save' h = <tutorial_header> t = (<tutorial_struct>.id) s = (<lesson_struct>.id)
	addparam structure_name = tutorial_tags name = <lesson_complete_checksum> value = not_complete
	<k> = (<k> + 1)
	repeat <lesson_array_size>
	<j> = (<j> + 1)
	repeat <tutorial_array_size>
	<i> = (<i> + 1)
	repeat <tutorial_header_size>
	setglobaltags savegame = <savegame> tutorials params = <tutorial_tags>
endscript

script get_tutorial_globaltag 
	requireparams \{[
			savegame
			tutorial_header
			tutorial_id
		]
		all}
	formattext checksumname = tutorial_complete_checksum 'tutorial_%h_%s_save' h = <tutorial_header> s = <tutorial_id>
	getglobaltags savegame = <savegame> tutorials param = <tutorial_complete_checksum>
	return tutorial_tag = (<...>.<tutorial_complete_checksum>)
endscript

script get_tutorial_lesson_globaltag 
	requireparams \{[
			savegame
			tutorial_header
			tutorial_id
			lesson_id
		]
		all}
	formattext checksumname = lesson_complete_checksum 'tutorial_lesson_%h_%t_%s_save' h = <tutorial_header> t = <tutorial_id> s = <lesson_id>
	getglobaltags savegame = <savegame> tutorials param = <lesson_complete_checksum>
	return tutorial_tag = (<...>.<lesson_complete_checksum>)
endscript

script save_tutorial_globaltag 
	requireparams \{[
			savegame
			tutorial_header
			tutorial_id
			value
		]
		all}
	formattext checksumname = tutorial_complete_checksum 'tutorial_%h_%s_save' h = <tutorial_header> s = <tutorial_id>
	addparam structure_name = tutorial_tags name = <tutorial_complete_checksum> value = <value>
	setglobaltags savegame = <savegame> tutorials params = <tutorial_tags>
endscript

script save_tutorial_lesson_globaltag 
	requireparams \{[
			savegame
			tutorial_header
			tutorial_id
			lesson_id
			value
		]
		all}
	formattext checksumname = lesson_complete_checksum 'tutorial_lesson_%h_%t_%s_save' h = <tutorial_header> t = <tutorial_id> s = <lesson_id>
	addparam structure_name = tutorial_tags name = <lesson_complete_checksum> value = <value>
	setglobaltags savegame = <savegame> tutorials params = <tutorial_tags>
endscript

script setup_universal_help_tags \{savegame = !i1768515945}
	getarraysize ($g_universal_help_popups)
	if (<array_size> > 0)
		<i> = 0
		begin
		extendcrc ($g_universal_help_popups [<i>].help_context) '_help_page_viewed' out = help_viewed_checksum
		addparam structure_name = universal_help_tags name = <help_viewed_checksum> value = 0
		<i> = (<i> + 1)
		repeat <array_size>
		setglobaltags savegame = <savegame> universal_help params = <universal_help_tags>
	endif
endscript

script get_universal_help_globaltag \{savegame = !i1768515945
		help_context = !q1768515945}
	extendcrc <help_context> '_help_page_viewed' out = help_viewed_checksum
	getglobaltags savegame = <savegame> universal_help param = <help_viewed_checksum>
	return help_viewed_tag = (<...>.<help_viewed_checksum>)
endscript

script save_universal_help_globaltag \{savegame = !i1768515945
		help_context = !q1768515945
		viewed_value = !i1768515945}
	extendcrc <help_context> '_help_page_viewed' out = help_state_checksum
	addparam structure_name = universal_help_tags name = <help_state_checksum> value = <viewed_value>
	setglobaltags savegame = <savegame> universal_help params = <universal_help_tags>
endscript

script reset_universal_help_per_session_tags \{savegame = !i1768515945}
	getarraysize ($g_universal_help_popups)
	<per_session_help_pages> = 0
	if (<array_size> > 0)
		<i> = 0
		begin
		if (($g_universal_help_popups [<i>].triggered) = per_session)
			extendcrc ($g_universal_help_popups [<i>].help_context) '_help_page_viewed' out = help_viewed_checksum
			addparam structure_name = universal_help_tags name = <help_viewed_checksum> value = 0
			<per_session_help_pages> = (<per_session_help_pages> + 1)
		endif
		<i> = (<i> + 1)
		repeat <array_size>
		if (<per_session_help_pages> > 0)
			setglobaltags savegame = <savegame> universal_help params = <universal_help_tags>
		endif
	endif
endscript

script globaltag_update_avatar_metadata 
	printscriptinfo \{'globaltag_update_avatar_metadata'}
	requireparams \{[
			savegame
		]
		all}
	if isavatarsysteminitialized
		if NOT characterprofilegetstruct name = avatar savegame = <savegame>
			profile_struct = {}
		endif
		if NOT structurecontains structure = <profile_struct> appearance
			profile_struct = ($avatar_profile)
		endif
		printf \{'Grabbing avatar data...'}
		if NOT getavatarcasmetadata userid = <savegame>
			metadata = []
			printf \{'Failed to get avatar metadata'}
		endif
		printf \{'Got it!'}
		fullbody_part = (<profile_struct>.appearance.cas_full_body)
		fullbody_part = {<fullbody_part> avatar_meta_data = <metadata>}
		updatestructelement struct = (<profile_struct>.appearance) element = cas_full_body value = <fullbody_part>
		addparam structure_name = profile_struct name = appearance value = <newstruct>
		characterprofilesetstruct savegame = <savegame> name = avatar profile_struct = <profile_struct>
	endif
endscript

script restore_globals_from_global_tags \{callmonitorcontrollerstates = 1}
	if NOT isxenonorwindx
		reset_audio = 1
	elseif (($primary_controller) = <savegame>)
		reset_audio = 1
	endif
	if gotparam \{reset_audio}
		update_all_volumes_savegame savegame = <savegame>
		update_mic_eq_setting savegame = <savegame>
	endif
	savegame_to_reset = <savegame>
	getmaxplayers
	<i> = 1
	begin
	getplayerinfo player = <i> controller
	if ((<controller> > -1) && (<controller> < 4))
		get_savegame_from_controller controller = <controller>
		if (<savegame_to_reset> = <savegame>)
			getglobaltags savegame = <savegame> user_options
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
	getarraysize \{$levelzonearray}
	<zone_index> = 0
	begin
	<venue> = ($levelzonearray [<zone_index>])
	if NOT structurecontains structure = ($levelzones.<venue>) debug_only
		<zone> = ($levelzones.<venue>.zone)
		<zone_struct> = {}
		addparam structure_name = zone_struct name = <zone> value = 0
		setglobaltags savegame = <savegame> <struct_name> params = {<zone_struct>} progression = true
	endif
	<zone_index> = (<zone_index> + 1)
	repeat <array_size>
endscript

script setup_unlocks \{globaltag_checksum = none}
	getarraysize ($bonus_videos)
	index = 0
	begin
	unlocked = 0
	if structurecontains structure = ($bonus_videos [<index>]) unlocked
		unlocked = 1
	endif
	video_checksum = ($bonus_videos [<index>].id)
	setglobaltags savegame = <savegame> <video_checksum> params = {unlocked = <unlocked>} packtype = unlockedtags
	globaltag_checksum = (<globaltag_checksum> + <video_checksum>)
	<index> = (<index> + 1)
	repeat <array_size>
	getarraysize ($g_bonus_art_galleries)
	index = 0
	begin
	unlocked = 0
	if structurecontains structure = ($g_bonus_art_galleries [<index>]) unlocked
		unlocked = 1
	endif
	gallery_id = ($g_bonus_art_galleries [<index>].id)
	setglobaltags savegame = <savegame> <gallery_id> params = {unlocked = <unlocked>} packtype = unlockedtags
	globaltag_checksum = (<globaltag_checksum> + <gallery_id>)
	<index> = (<index> + 1)
	repeat <array_size>
	getarraysize ($g_rocker_powertags)
	index = 0
	begin
	hero_power = ($g_rocker_powertags [<index>])
	setglobaltags savegame = <savegame> <hero_power> params = {power_level = 0} packtype = powertags
	globaltag_checksum = (<globaltag_checksum> + <hero_power>)
	index = (<index> + 1)
	repeat <array_size>
	return globaltag_checksum = <globaltag_checksum>
endscript

script globaltags_unlockall \{songs_only = 0}
	if NOT gotparam \{difficulty}
		getfirstplayer
		getplayerinfo <player> difficulty
	endif
	get_savegame_from_controller controller = ($primary_controller)
	create_loading_screen
	if NOT (<songs_only> = 1)
		array_count = 0
		getarraysize \{$preset_musician_profiles_locked}
		if (<array_size> > 0)
			begin
			if structurecontains structure = ($preset_musician_profiles_locked [<array_count>]) locked
				unlock_profile id = ($preset_musician_profiles_locked [<array_count>].name) savegame = <savegame>
			endif
			array_count = (<array_count> + 1)
			repeat <array_size>
		endif
		array_count = 0
		getarraysize \{$bonus_videos}
		if (<array_size>)
			begin
			setglobaltags savegame = <savegame> ($bonus_videos [<array_count>].id) params = {unlocked = 1}
			array_count = (<array_count> + 1)
			repeat <array_size>
		endif
	endif
	setup_chaptertags \{cheat
		globaltag_checksum = none}
	setup_venuetags \{cheat
		globaltag_checksum = none}
	destroy_loading_screen
endscript

script set_cas_texture_unlocked_flag \{texture = !q1768515945
		savegame = !i1768515945}
	getglobaltags unlocked_cas_textures savegame = <savegame>
	if NOT arraycontains array = <unlocked_cas_textures> contains = <texture>
		addarrayelement array = <unlocked_cas_textures> element = <texture>
		setglobaltags unlocked_cas_textures params = {unlocked_cas_textures = <array>} savegame = <savegame>
		return \{true}
	endif
	return \{false}
endscript

script set_cas_item_unlocked_flag \{part = !q1768515945
		desc_id = !q1768515945
		savegame = !i1768515945}
	getglobaltags unlocked_cas_items savegame = <savegame>
	manglechecksums a = <desc_id> b = <part>
	if NOT arraycontains array = <unlocked_cas_items> contains = <mangled_id>
		addarrayelement array = <unlocked_cas_items> element = <mangled_id>
		setglobaltags unlocked_cas_items params = {unlocked_cas_items = <array>} savegame = <savegame>
		return \{true}
	endif
	return \{false}
endscript

script set_cas_outfit_preset_unlocked_flag \{outfit_preset = !q1768515945
		savegame = !i1768515945}
	getglobaltags unlocked_cas_outfit_presets savegame = <savegame>
	if NOT arraycontains array = <unlocked_cas_outfit_presets> contains = <outfit_preset>
		addarrayelement array = <unlocked_cas_outfit_presets> element = <outfit_preset>
		setglobaltags unlocked_cas_outfit_presets params = {unlocked_cas_outfit_presets = <array>} savegame = <savegame>
		return \{true}
	endif
	return \{false}
endscript

script unlock_purchase_all_cas_parts \{savegame = !i1768515945}
	getarraysize ($master_editable_list)
	master_list_size = <array_size>
	i = 0
	begin
	part = ((($master_editable_list) [<i>]).part)
	getarraysize ($<part>)
	if (<array_size> > 0)
		j = 0
		begin
		if structurecontains structure = (($<part>) [<j>]) locked
			set_cas_item_unlocked_flag part = <part> desc_id = ((($<part>) [<j>]).desc_id) savegame = <savegame>
		endif
		if structurecontains structure = (($<part>) [<j>]) cap_textures
			unlock_purchase_all_cas_texture_pieces textures = ((($<part>) [<j>]).cap_textures) savegame = <savegame>
		endif
		j = (<j> + 1)
		repeat <array_size>
	endif
	i = (<i> + 1)
	repeat <master_list_size>
endscript

script unlock_purchase_all_cas_texture_pieces 
	getarraysize <textures>
	i = 0
	if (<array_size> > 0)
		begin
		entry = (<textures> [<i>])
		if structurecontains structure = <entry> preset_layers
			unlock_purchase_all_cas_texture_pieces_layers layers = (<entry>.preset_layers) savegame = <savegame>
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script unlock_purchase_all_cas_texture_pieces_layers 
	getarraysize <layers>
	i = 0
	if (<array_size> > 0)
		begin
		entry = (<layers> [<i>])
		if structurecontains structure = <entry> mask
			unlock_purchase_all_cas_texture_pieces_layers_mask mask = (<entry>.mask) savegame = <savegame>
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script unlock_purchase_all_cas_texture_pieces_layers_mask 
	getarraysize <mask>
	i = 0
	if (<array_size> > 0)
		begin
		entry = (<mask> [<i>])
		if structurecontains structure = <entry> locked
			if structurecontains structure = <entry> pattern
				set_cas_texture_unlocked_flag texture = (<entry>.pattern) savegame = <savegame>
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script unlock_purchase_all_outfit_presets \{savegame = !i1768515945}
	<big_array> = (($car_presets_outfit.female) + ($car_presets_outfit.male))
	<i> = 0
	getarraysize <big_array>
	begin
	<struct> = (<big_array> [<i>])
	if structurecontains structure = <struct> locked
		if structurecontains structure = <struct> desc_id
			set_cas_outfit_preset_unlocked_flag {
				savegame = <savegame>
				outfit_preset = (<struct>.desc_id)
			}
		endif
	endif
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script unlock_all_career_powers \{savegame = !i1768515945}
	getarraysize ($g_rocker_powertags)
	index = 0
	begin
	hero_power = ($g_rocker_powertags [<index>])
	setglobaltags savegame = <savegame> <hero_power> params = {power_level = 2} packtype = powertags
	index = (<index> + 1)
	repeat <array_size>
endscript

script check_cas_item_unlocked_flag \{part = !q1768515945
		desc_id = !q1768515945
		savegame = !i1768515945}
	getglobaltags unlocked_cas_items savegame = <savegame>
	manglechecksums a = <desc_id> b = <part>
	if arraycontains array = <unlocked_cas_items> contains = <mangled_id>
		return \{true}
	endif
	return \{false}
endscript

script check_cas_texture_unlocked_flag \{texture = !q1768515945
		savegame = !i1768515945}
	getglobaltags unlocked_cas_textures savegame = <savegame>
	if arraycontains array = <unlocked_cas_textures> contains = <texture>
		return \{true}
	endif
	return \{false}
endscript

script check_cas_outfit_preset_unlocked_flag \{outfit_preset = !q1768515945
		savegame = !i1768515945}
	getglobaltags unlocked_cas_outfit_presets savegame = <savegame>
	if arraycontains array = <unlocked_cas_outfit_presets> contains = <outfit_preset>
		return \{true}
	endif
	return \{false}
endscript

script get_current_band_name 
	if console_is_net_career_client
		return true band_name = ($g_net_career_progression.progression_name)
	else
		if NOT gotparam \{savegame}
			get_savegame_from_controller controller = ($primary_controller)
		endif
		if savegamegetprogression savegame = <savegame>
			formattext checksumname = field 'progression_header%d' d = <progression> addtostringlookup = true
			getglobaltags <field> savegame = <savegame> param = progression_name
			return true band_name = <progression_name>
		endif
		return \{false}
	endif
endscript

script setup_achievement_tags 
	setglobaltags savegame = <savegame> achievement_info params = {
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
	}
endscript

script setup_cas_helper_tags 
	setglobaltags savegame = <savegame> cas_helper_dialogue params = {
		visit_cag = 0
		visit_cap = 0
		visit_cadrm = 0
		visit_deformation = 0
	}
endscript

script set_online_match_info \{ranked = 0
		won = 0
		host = 0
		standard_controller = 0}
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
	requireparams \{[
			device_num
		]
		all}
	if ($skip_career_forced_flow = 1)
		career_first_time_setup = 1
	else
		if console_is_net_career_client
			<career_first_time_setup> = ($g_net_career_progression.career_progression_tags.career_first_time_setup)
		else
			getglobaltags career_progression_tags params = career_first_time_setup controller = <device_num>
		endif
	endif
	if (<career_first_time_setup> = 1)
		return \{true}
	else
		return \{false}
	endif
endscript

script setup_chaptertags \{globaltag_checksum = null}
	setglobaltags savegame = <savegame> career_progression_tags params = {($progression_tags)} progression = true addtostringlookup = true
	globaltag_checksum = (<globaltag_checksum> + career_progression_tags)
	<chapter_tags> = ($default_chapter_tags)
	if gotparam \{cheat}
		<chapter_tags> = ($cheat_chapter_tags)
	endif
	<unlock_index> = 0
	getarraysize \{$quest_progression_unlocks}
	<unlocks_size> = <array_size>
	begin
	<inner_index> = 0
	getarraysize ($quest_progression_unlocks [<unlock_index>])
	<unlock_array_size> = <array_size>
	begin
	<chapter> = ($quest_progression_unlocks [<unlock_index>] [<inner_index>])
	<chapter_name> = ($<chapter>.name)
	formattext checksumname = chapter_unlock '%s' s = <chapter_name>
	setglobaltags savegame = <savegame> <chapter_unlock> params = {(<chapter_tags>)} packtype = gigtags progression = true
	<globaltag_checksum> = (<globaltag_checksum> + <chapter_unlock>)
	<songs_array> = ($<chapter>.songs)
	getarraysize <songs_array>
	<song_array_size> = <array_size>
	<song_index> = 0
	begin
	<song> = (<songs_array> [<song_index>])
	format_career_song_gigtag chapter_name = <chapter_name> song = <song>
	setglobaltags savegame = <savegame> <song_gigtag> params = {($default_gig_song_tags)} packtype = gigsongtags progression = true
	<globaltag_checksum> = (<globaltag_checksum> + <song_gigtag>)
	<song_index> = (<song_index> + 1)
	repeat <song_array_size>
	<song> = ($<chapter>.encore)
	if (<song> != none)
		format_career_song_gigtag chapter_name = <chapter_name> song = <song>
		setglobaltags savegame = <savegame> <song_gigtag> params = {($default_gig_song_tags)} packtype = gigsongtags progression = true
		<globaltag_checksum> = (<globaltag_checksum> + <song_gigtag>)
	endif
	<inner_index> = (<inner_index> + 1)
	repeat <unlock_array_size>
	<unlock_index> = (<unlock_index> + 1)
	repeat <unlocks_size>
	return globaltag_checksum = <globaltag_checksum>
endscript

script format_career_song_gigtag \{chapter_name = 0x69696969
		song = !q1768515945}
	extendcrcwithstring checksum = <song> string = <chapter_name>
	return song_gigtag = <extended_checksum>
endscript

script setup_quickplay_tags \{savegame = !i1768515945}
	setglobaltags savegame = <savegame> quickplay_progression_tags params = {total_stars = 0 total_award_points = 0}
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
	requireparams \{[
			savegame
		]
		all}
	setglobaltags savegame = <savegame> custom_playlists params = {custom_playlists = ($custom_playlists)}
endscript

script setup_songlist_tags 
	requireparams \{[
			savegame
		]
		all}
	setglobaltags savegame = <savegame> songlist_options params = {show_more_info = ($g_songlist_show_more_info) show_ghtunes = ($g_songlist_show_ghtunes)}
endscript

script setup_download_song_killswitch 
	setglobaltags savegame = <savegame> net params = {enabled_songs_bitfield = ($enabled_songs_bitfield)}
endscript

script update_download_song_killswitch_from_globaltags 
	if getglobaltags \{net
			param = enabled_songs_bitfield
			noassert = 1}
		change enabled_songs_bitfield = (<enabled_songs_bitfield>)
		update_download_song_killswitch_save
	endif
endscript

script update_download_song_killswitch_from_net 
	change enabled_songs_bitfield = ($enabled_songs_bitfield_live)
	update_download_song_killswitch_save
endscript

script update_download_song_killswitch_save 
	lockglobaltags \{freeplay_check_off}
	lockglobaltags \{off}
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

script globaltag_createarray \{savegame = !i1768515945
		array_name = !q1768515945
		max_size = !i1768515945
		packtype = !q1768515945}
	setglobaltags savegame = <savegame> <array_name> params = {valid_entries = [] max_size = <max_size>}
	i = 0
	begin
	formattext textname = arrayappend '_array%d' d = <i>
	extendcrc <array_name> <arrayappend> out = arrayid
	setglobaltags savegame = <savegame> <arrayid> params = {} packtype = <packtype>
	globaltag_checksum = (<globaltag_checksum> + <arrayid>)
	i = (<i> + 1)
	repeat <max_size>
	return globaltag_checksum = <globaltag_checksum>
endscript

script globaltag_getarraysize \{savegame = !i1768515945
		array_name = !q1768515945}
	getglobaltags savegame = <savegame> <array_name>
	getarraysize <valid_entries>
	return array_size = <array_size>
endscript

script globaltag_getarrayelement \{savegame = !i1768515945
		array_name = !q1768515945
		index = !i1768515945}
	getglobaltags savegame = <savegame> <array_name>
	getarraysize <valid_entries>
	if (<index> < <array_size>)
		getglobaltags savegame = <savegame> out = contents (<valid_entries> [<index>])
		return true element = <contents>
	endif
	return \{false}
endscript

script globaltag_setarrayelement \{savegame = !i1768515945
		array_name = !q1768515945
		index = !i1768515945
		element = 0x69696969}
	getglobaltags savegame = <savegame> <array_name>
	getarraysize <valid_entries>
	if (<index> < <array_size>)
		lockglobaltags \{off}
		setglobaltags savegame = <savegame> (<valid_entries> [<index>]) params = <element> no_append = true
		lockglobaltags
		return \{true}
	endif
	return \{false}
endscript

script globaltag_addarrayelement \{savegame = !i1768515945
		array_name = !q1768515945
		element = 0x69696969}
	getglobaltags savegame = <savegame> <array_name>
	getarraysize <valid_entries>
	if (<array_size> < <max_size>)
		i = 0
		begin
		formattext textname = arrayappend '_array%d' d = <i>
		extendcrc <array_name> <arrayappend> out = arrayid
		if NOT arraycontains array = <valid_entries> contains = <arrayid>
			addarrayelement array = <valid_entries> element = <arrayid>
			setglobaltags savegame = <savegame> <array_name> params = {valid_entries = <array> max_size = <max_size>}
			lockglobaltags \{off}
			setglobaltags savegame = <savegame> <arrayid> params = <element> no_append = true
			lockglobaltags
			return \{true}
		endif
		i = (<i> + 1)
		repeat (<array_size> + 1)
	endif
	return \{false}
endscript

script globaltag_removearrayelement \{savegame = !i1768515945
		array_name = !q1768515945
		index = !i1768515945}
	getglobaltags savegame = <savegame> <array_name>
	getarraysize <valid_entries>
	if (<array_size> <= <max_size>)
		removearrayelement array = <valid_entries> index = <index>
		setglobaltags savegame = <savegame> <array_name> params = {valid_entries = <array> max_size = <max_size>}
		return \{true}
	endif
	return \{false}
endscript

script globaltag_getarraychecksum \{savegame = !i1768515945
		array_name = !q1768515945}
	array_checksum = arse
	globaltag_getarraysize savegame = <savegame> array_name = <array_name>
	if (<array_size> > 0)
		i = 0
		begin
		globaltag_getarrayelement savegame = <savegame> array_name = <array_name> index = <i>
		generatechecksumfromstruct \{structname = element}
		array_checksum = (<array_checksum> + <structure_checksum>)
		i = (<i> + 1)
		repeat <array_size>
	endif
	return array_checksum = <array_checksum>
endscript

script is_venue_unlocked \{venue = !q1768515945}
	if NOT structurecontains structure = $levelzones <venue>
		printf 'Venue %v does not exist!' v = <venue>
		return \{false}
	endif
	if NOT structurecontains structure = ($levelzones.<venue>) debug_only
		formattext checksumname = venue_checksum 'venue_%s' s = (($levelzones.<venue>).name) addtostringlookup = true
		getglobaltags <venue_checksum> savegame = <savegame> param = unlocked
		if (<unlocked> = 1)
			return \{true}
		endif
	endif
	return \{false}
endscript

script globaltag_unlock_venue \{venue = !q1768515945
		savegame = !i1768515945}
	if NOT structurecontains structure = $levelzones <venue>
		printf 'Venue %v does not exist!' v = <venue>
		return \{false}
	endif
	if structurecontains structure = ($levelzones.<venue>) debug_only
		return \{false}
	endif
	formattext checksumname = venue_checksum 'venue_%s' s = (($levelzones.<venue>).name) addtostringlookup = true
	if console_is_net_career_client
		temp_struct = ($g_net_career_progression.<venue_checksum> + {unlocked = 1})
		appendstruct struct = g_net_career_progression field = <venue_checksum> params = <temp_struct> globalstruct
	endif
	getglobaltags <venue_checksum> savegame = <savegame>
	if (<unlocked> = 0)
		setglobaltags <venue_checksum> savegame = <savegame> params = {unlocked = 1}
		return \{true}
	endif
	return \{false}
endscript
