
script register_initial_character_profiles \{async = 0}
	GetArraySize \{$Preset_Musician_Profiles_GHRockers}
	num_profiles = (<array_size>)
	GetArraySize \{$Preset_Musician_Profiles_Modifiable}
	num_profiles = (<array_size> + <num_profiles>)
	GetArraySize \{$Preset_Musician_Profiles_Locked}
	num_profiles = (<array_size> + <num_profiles>)
	GetArraySize \{$Preset_Musician_Profiles_Debug}
	num_profiles = (<array_size> + <num_profiles>)
	num_profiles = (($max_num_create_a_rockers) + <num_profiles>)
	num_profiles = (($max_temporary_profiles_small) + ($max_temporary_profiles_large) + <num_profiles>)
	if NOT GotParam \{no_reinit}
		CharacterProfileInit max_profiles = <num_profiles>
	endif
	i = 0
	begin
	FormatText checksumname = id_checksum 'custom_character_%d' d = <i> AddToStringLookup = true
	CharacterProfileRegister {
		type = saved
		category = cars
		packtype = createarocker
		name = <id_checksum>
	}
	i = (<i> + 1)
	repeat ($max_num_create_a_rockers)
	CharacterProfileRegister \{type = saved
		category = ghrockers
		packtype = presetcars
		profiles = $Preset_Musician_Profiles_GHRockers}
	if isXenon
		CharacterProfileRegister \{type = avatar
			category = modifiable
			packtype = presetcars
			Profile = $avatar_profile}
	endif
	CharacterProfileRegister \{type = saved
		category = modifiable
		packtype = presetcars
		profiles = $Preset_Musician_Profiles_Modifiable}
	CharacterProfileRegister \{type = constant
		category = locked
		profiles = $Preset_Musician_Profiles_Locked}
	CharacterProfileRegister \{type = global_appearance
		category = should_never_list
		Profile = {
			$default_temporary_profile
			name = cas_current_appearance
			fullname = qs(0x03ac90f0)
		}
		global_name = cas_current_appearance}
	GetMaxPlayers
	i = 0
	begin
	FormatText checksumname = id_checksum 'temporary_netprofile_%d' d = <i> AddToStringLookup = true
	Profile = {
		name = <id_checksum>
		fullname = qs(0x03ac90f0)
		appearance = ($empty_appearance)
		($default_temporary_profile)
	}
	CharacterProfileRegister {
		type = temporary
		category = temporary
		Profile = <Profile>
		packed_type = temporary_profiles_large
	}
	i = (<i> + 1)
	repeat <max_players>
	i = 0
	begin
	FormatText checksumname = id_checksum 'temporary_car_%d' d = <i> AddToStringLookup = true
	CharacterProfileRegister {
		type = temporary
		category = temporary
		Profile = {name = <id_checksum> appearance = {}}
		packed_type = temporary_profiles_large
	}
	FormatText checksumname = id_checksum 'temporary_ghrocker_%d' d = <i> AddToStringLookup = true
	CharacterProfileRegister {
		type = temporary
		category = temporary
		Profile = {name = <id_checksum> appearance = {}}
		packed_type = temporary_profiles_large
	}
	if isXenon
		FormatText checksumname = id_checksum 'temporary_avatar_%d' d = <i> AddToStringLookup = true
		CharacterProfileRegister {
			type = temporary
			category = temporary
			Profile = {name = <id_checksum> appearance = {}}
			packed_type = temporary_profiles_large
		}
	endif
	i = (<i> + 1)
	repeat 4
	if NOT CD
		register_debug_character_profiles
	endif
	CharacterProfileDump
endscript

script update_temporary_random_car 
	RequireParams \{[
			Slot
			savegame
		]
		all}
	FormatText checksumname = id_checksum 'temporary_car_%d' d = <Slot> AddToStringLookup = true
	generate_random_car_profile name = <id_checksum> savegame = <savegame>
	CharacterProfileSetStruct name = <id_checksum> savegame = <savegame> profile_struct = <Profile>
endscript

script update_temporary_random_avatar 
	RequireParams \{[
			Slot
			savegame
		]
		all}
	FormatText checksumname = id_checksum 'temporary_avatar_%d' d = <Slot> AddToStringLookup = true
	generate_random_avatar_profile name = <id_checksum> savegame = <savegame>
	CharacterProfileSetStruct name = <id_checksum> savegame = <savegame> profile_struct = <Profile>
endscript

script update_temporary_ghrocker 
	RequireParams \{[
			Slot
			savegame
			character_id
			outfit
		]
		all}
	FormatText checksumname = id_checksum 'temporary_ghrocker_%d' d = <Slot> AddToStringLookup = true
	CharacterProfileGetStruct name = <character_id> savegame = <savegame>
	appearance = (<profile_struct>.appearance)
	new_desc_id = {desc_id = <outfit>}
	<appearance> = {<appearance> CAS_Full_Body = <new_desc_id>}
	CharacterProfileSetStruct savegame = <savegame> name = <id_checksum> profile_struct = {<profile_struct> appearance = <appearance> name = <id_checksum>}
endscript

script create_initial_temporary_random_cars async = <async>
	Randomize
	i = 0
	begin
	update_temporary_random_car Slot = <i> savegame = <i>
	conditional_async_wait async = <async>
	if IsAvatarSystemInitialized
		update_temporary_random_avatar Slot = <i> savegame = <i>
		conditional_async_wait async = <async>
	endif
	i = (<i> + 1)
	repeat 4
endscript

script generate_random_car_profile \{car_flags = {
			new_car_character
			random_instruments
		}}
	RequireParams \{[
			name
			savegame
			car_flags
		]
		all}
	if (($cas_current_savegame) != -1)
		ScriptAssert \{'Dont call this from within create a rocker'}
	endif
	if NOT GotParam \{is_female}
		is_female = Random (@ 0 @ 1 )
	endif
	if (<is_female> = 1)
		Profile = ($default_custom_musician_profile_female)
	else
		Profile = ($default_custom_musician_profile_male)
	endif
	generate_random_name is_female = <is_female>
	if NOT GotParam \{genre}
		generate_random_genre
	endif
	Change cas_current_savegame = <savegame>
	cas_set_random_appearance is_female = <is_female> genre = <genre> used_parts = <used_parts> <car_flags>
	Change \{cas_current_savegame = -1}
	Profile = {
		<Profile>
		name = <name>
		fullname = <random_name>
		appearance = ($cas_current_appearance)
		allowed_parts = [Drum vocals guitar bass]
		blurb = qs(0x03ac90f0)
	}
	Change \{cas_current_appearance = {
		}}
	return Profile = <Profile>
endscript

script generate_random_avatar_profile \{genre = Pop}
	RequireParams \{[
			name
			savegame
		]
		all}
	if (($cas_current_savegame) != -1)
		ScriptAssert \{'Dont call this from within create a rocker'}
	endif
	if NOT GotParam \{is_female}
		is_female = Random (@ 0 @ 1 )
	endif
	if (<is_female> = 1)
		Profile = ($default_custom_musician_profile_female)
	else
		Profile = ($default_custom_musician_profile_male)
	endif
	generate_random_name is_female = <is_female>
	get_random_avatar_appearance is_female = <is_female>
	Change cas_current_appearance = <appearance>
	Change cas_current_savegame = <savegame>
	cas_set_random_avatar_instrument is_female = <is_female> genre = <genre>
	Change \{cas_current_savegame = -1}
	Profile = {
		<Profile>
		name = <name>
		fullname = <random_name>
		appearance = ($cas_current_appearance)
	}
	Change \{cas_current_appearance = {
		}}
	return Profile = <Profile>
endscript

script register_debug_character_profiles 
	CharacterProfileRegister \{type = constant
		category = debug
		profiles = $Preset_Musician_Profiles_Debug}
	if IsPS3
		new_random_debug_car_profile \{fullname = qs(0x6ff7f068)
			name = avatar
			is_female = 0}
		CharacterProfileRegister {
			type = temporary
			category = debug
			Profile = {<profile_struct> selection_not_allowed}
			packed_type = temporary_profiles_small
		}
	endif
	i = 1
	begin
	FormatText checksumname = name 'RandomAvatar%d' d = <i> AddToStringLookup = true
	FormatText TextName = fullname qs(0x689c63a9) d = <i> AddToStringLookup = true
	if IsAvatarSystemInitialized
		new_random_avatar_profile fullname = <fullname> name = <name>
	else
		new_random_debug_car_profile fullname = <fullname> name = <name> is_female = 0
		profile_struct = {<profile_struct> selection_not_allowed}
	endif
	CharacterProfileRegister {
		type = temporary
		category = debug
		Profile = <profile_struct>
		packed_type = temporary_profiles_small
	}
	i = (<i> + 1)
	repeat 4
	new_random_debug_car_profile_set \{is_female = 0}
	new_random_debug_car_profile_set \{is_female = 1}
	Change \{cas_current_appearance = {
		}}
endscript

script new_random_debug_car_profile_set 
	used_parts = {}
	i = 1
	begin
	if (<is_female> = 1)
		FormatText checksumname = name 'RandomFemale%d' d = <i> AddToStringLookup = true
		FormatText TextName = fullname qs(0xfcd50580) d = <i> AddToStringLookup = true
	else
		FormatText checksumname = name 'RandomMale%d' d = <i> AddToStringLookup = true
		FormatText TextName = fullname qs(0x72d5f526) d = <i> AddToStringLookup = true
	endif
	new_random_debug_car_profile fullname = <fullname> name = <name> is_female = <is_female> used_parts = <used_parts>
	band_builder_get_used_parts_in_appearance appearance = (<profile_struct>.appearance) used_parts = <used_parts>
	CharacterProfileRegister {
		type = temporary
		category = debug
		Profile = <profile_struct>
		packed_type = temporary_profiles_small
	}
	i = (<i> + 1)
	repeat 4
endscript

script new_random_debug_car_profile 
	generate_random_car_profile {
		name = <name>
		is_female = <is_female>
		used_parts = <used_parts>
		car_flags = {cpu_band random_instruments}
		savegame = -1
	}
	return profile_struct = <Profile>
endscript

script new_random_avatar_profile 
	if get_random_avatar_appearance is_female = <is_female>
		return true profile_struct = {
			($avatar_profile)
			name = <name>
			fullname = <fullname>
			appearance = <appearance>
		}
	endif
	return \{false}
endscript

script debug_reset_character_profiles 
	if RetailBuild
		return
	endif
	CharacterProfileGetList \{debug_all}
	GetArraySize <profile_list>
	i = 0
	begin
	character_id = (<profile_list> [<i>])
	CharacterProfileUnregister name = <character_id>
	i = (<i> + 1)
	repeat <array_size>
	CharacterProfileGetList \{debug_all}
	GetArraySize <profile_list>
	if (<array_size> != 0)
		ScriptAssert \{'character profile list is not empty!'}
	endif
	register_initial_character_profiles \{no_reinit}
endscript

script new_custom_character_name 
	RequireParams \{[
			savegame
		]
		all}
	i = 0
	begin
	FormatText checksumname = id_checksum 'custom_character_%d' d = <i> AddToStringLookup = true
	if NOT CharacterProfileExists savegame = <savegame> name = <id_checksum>
		return new_character_id = <id_checksum>
	endif
	i = (<i> + 1)
	repeat ($max_num_create_a_rockers)
	ScriptAssert \{'Cannot make a new custom character id. CARs maxxed out?'}
endscript

script profile_can_be_modified 
	RequireParams \{[
			id
		]
		all}
	if CharacterProfileGetType name = <id>
		if ((<profile_type> = saved) || (<profile_type> = avatar))
			return \{true}
		endif
	endif
	return \{false}
endscript

script is_completely_custom_musician 
	RequireParams \{[
			id
		]
		all}
	if CharacterProfileGetCategory name = <id>
		if (<profile_category> = cars)
			return \{true}
		endif
	endif
	return \{false}
endscript

script is_ghrocker 
	RequireParams \{[
			id
		]
		all}
	if CharacterProfileGetCategory name = <id>
		if (<profile_category> = ghrockers)
			return \{true}
		endif
	endif
	return \{false}
endscript

script modify_custom_profile_appearance 
	RequireParams \{[
			id
			savegame
			appearance
		]
		all}
	if profile_can_be_modified id = <id>
		CharacterProfileGetStruct name = <id> savegame = <savegame>
		CharacterProfileSetStruct name = <id> savegame = <savegame> profile_struct = {<profile_struct> appearance = <appearance>}
	endif
endscript

script modify_custom_profile_fullname 
	RequireParams \{[
			id
			savegame
			fullname
		]
		all}
	if is_completely_custom_musician id = <id>
		CharacterProfileGetStruct name = <id> savegame = <savegame>
		CharacterProfileSetStruct name = <id> savegame = <savegame> profile_struct = {<profile_struct> fullname = <fullname>}
	endif
endscript

script modify_custom_profile_blurb 
	RequireParams \{[
			id
			savegame
			blurb
		]
		all}
	if is_completely_custom_musician id = <id>
		CharacterProfileGetStruct name = <id> savegame = <savegame>
		CharacterProfileSetStruct name = <id> savegame = <savegame> profile_struct = {<profile_struct> blurb = <blurb>}
	endif
endscript

script add_new_custom_profile 
	RequireParams \{[
			savegame
			Profile
		]
		all}
	if is_completely_custom_musician id = (<Profile>.name)
		CharacterProfileSetStruct name = (<Profile>.name) savegame = <savegame> profile_struct = <Profile>
		GetGlobalTags savegame = <savegame> custom_character_order
		if ArrayContains array = <custom_character_order> contains = (<Profile>.name)
			ScriptAssert '%s already created!' s = (<Profile>.name)
		endif
		AddArrayElement array = <custom_character_order> element = (<Profile>.name)
		SetGlobalTags savegame = <savegame> custom_character_order params = {custom_character_order = <array>}
	else
		ScriptAssert '%s is not a custom profile' s = (<Profile>.name)
	endif
endscript

script delete_custom_profile 
	RequireParams \{[
			savegame
			id
		]
		all}
	if is_completely_custom_musician id = <id>
		CharacterProfileSetStruct name = <id> savegame = <savegame> delete_profile
		GetGlobalTags savegame = <savegame> custom_character_order
		if NOT ArrayContains array = <custom_character_order> contains = <id>
			ScriptAssert '%s not found!' s = <id>
		endif
		RemoveArrayElement array = <custom_character_order> element = <id>
		SetGlobalTags savegame = <savegame> custom_character_order params = {custom_character_order = <array>}
		sanity_check_fix_deleted_characters
	endif
endscript

script restore_custom_musician_parts 
	RequireParams \{[
			savegame
			id
		]
		all}
	CharacterProfileGetStruct name = <id>
	CharacterProfileSetStruct name = <id> savegame = <savegame> profile_struct = <profile_struct>
endscript

script has_custom_rocker_been_modified 
	RequireParams \{[
			savegame
			id
		]
		all}
	CharacterProfileGetStruct name = <id>
	GenerateChecksumFromStruct struct = (<profile_struct>.appearance)
	original_checksum = (<structure_checksum>)
	CharacterProfileGetStruct name = <id> savegame = <savegame>
	GenerateChecksumFromStruct struct = (<profile_struct>.appearance)
	if (<original_checksum> != <structure_checksum>)
		return \{true}
	endif
	return \{false}
endscript

script get_savegame_from_player 
	RequireParams \{[
			player
		]
		all}
	GetPlayerInfo <player> is_local_client
	if (<is_local_client> = 0)
		ScriptAssert \{'get_savegame_from_player called on a remote player, please fix this so it isn\'t'}
	endif
	GetPlayerInfo <player> controller
	get_savegame_from_controller controller = <controller> <...>
	return savegame = <savegame> borrowed_from_band_leader = <borrowed_from_band_leader>
endscript

script get_savegame_from_controller 
	RequireParams \{[
			controller
		]
		all}
	GetSavegameFromController controller = <controller>
	if IsXenonOrWinDX
		if GotParam \{band_character_select}
			if NOT CheckForSignIn local controller_index = <controller>
				guest = 1
			elseif NetSessionFunc func = XenonIsGuest params = {controller_index = <controller>}
				guest = 1
			endif
			if GotParam \{guest}
				leader_index = ($primary_controller)
				if ((<leader_index> != -1) && (<leader_index> != <controller>))
					GetSavegameFromController controller = <controller>
					borrowed_from_band_leader = <savegame>
					GetSavegameFromController controller = <leader_index>
				endif
			endif
		endif
	endif
	return savegame = <savegame> borrowed_from_band_leader = <borrowed_from_band_leader>
endscript

script is_selectable_profile 
	RequireParams \{[
			profile_struct
		]
		all}
	if StructureContains structure = <profile_struct> selection_not_allowed
		return \{false}
	else
		return \{true}
	endif
endscript

script is_allowed_part 
	if ((<part> = bass) || (<part> = guitar) || (<part> = Drum) || (<part> = vocals))
		if StructureContains structure = <profile_struct> allowed_parts
			i = 0
			GetArraySize (<profile_struct>.allowed_parts)
			if (<array_size> > 0)
				begin
				if ((<profile_struct>.allowed_parts) [<i>] = <part>)
					return \{true}
				endif
				i = (<i> + 1)
				repeat <array_size>
			endif
		endif
		return \{false}
	endif
	ScriptAssert 'is_allowed_part - %d unrecognized' d = <part>
endscript

script ghrocker_body_matches 
	RequireParams \{[
			matcheswith
			part
			desc_id
		]
		all}
	if (<part> != CAS_Full_Body)
		ScriptAssert 'part %s != CAS_Full_Body' s = <part>
	endif
	if GetActualCASOptionStruct part = <part> desc_id = <desc_id>
		if GotParam \{ghrocker}
			if (<ghrocker> = <matcheswith>)
				return \{true}
			endif
		endif
	endif
	return \{false}
endscript

script modify_net_appearance 
	RequireParams \{[
			index
			appearance
			fullname
		]
		all}
	if ((<index> < 0) || (<index> > 7))
		ScriptAssert \{'Out of range'}
	endif
	FormatText checksumname = id_checksum 'temporary_netprofile_%d' d = <index> AddToStringLookup = true
	CharacterProfileSetStruct name = <id_checksum> savegame = -1 profile_struct = {
		($default_temporary_profile)
		name = <id_checksum>
		fullname = <fullname>
		appearance = <appearance>
	}
endscript

script fill_local_appearance_data 
	printf \{qs(0xf06dd408)}
	printstruct <...>
	if PlayerInfoEquals <player_number> is_local_client = 1
		GetPlayerInfo <player_number> character_id out = my_character_id
		GetPlayerInfo <player_number> character_savegame
		if NOT CharacterProfileGetStruct name = <my_character_id> savegame = <character_savegame> dont_assert
			ScriptAssert '%s not found in savegame %d' s = <my_character_id> d = <character_savegame>
		endif
		get_fullname_of_character id = <my_character_id> savegame = <character_savegame>
		return character_id = <my_character_id> appearance = {(<profile_struct>.appearance) fullname = <fullname> old_character_id = <id>}
	endif
endscript

script dump_player_info 
	GetPlayerInfo <player> controller
	GetPlayerInfo <player> character_id
	GetPlayerInfo <player> is_local_client
	printstruct {player = <player> controller = <controller> character_id = <character_id> is_local_client = <is_local_client>}
endscript

script start_song_got_net_appearance 
	printf 'start_song_got_net_appearance %d' d = <netplayer>
	if (<netplayer> > 1)
		if (<netplayer> < 5)
			appearance_num = <netplayer>
			FormatText checksumname = netappearance_id 'temporary_netprofile_%d' d = (<appearance_num> -1)
			if GotParam \{USERANDOMPLAYER}
				get_savegame_from_controller controller = ($primary_controller)
				GetPlayerInfo <netplayer> part
				cas_get_random_ghrocker savegame = <savegame>
				SetPlayerInfo <netplayer> character_id = <character_id>
				SetPlayerInfo <netplayer> character_savegame = <savegame>
			else
				SetPlayerInfo <netplayer> character_id = <netappearance_id>
				SetPlayerInfo <netplayer> character_savegame = -1
				modify_net_appearance index = (<appearance_num> -1) appearance = <appearance> fullname = (<appearance>.fullname)
			endif
			SetPlayerInfo <netplayer> chosen_character_id = None
			SetPlayerInfo <netplayer> chosen_character_savegame = -1
			persistent_band_refresh_changed_characters
		endif
	endif
endscript

script is_profile_unlocked 
	RequireParams \{[
			profile_struct
			savegame
		]
		all}
	if NOT StructureContains structure = <profile_struct> locked
		return \{true}
	else
		GetGlobalTags unlocked_profiles savegame = <savegame>
		if NOT GotParam \{unlocked_profiles}
			return \{false}
		else
			if ArrayContains array = <unlocked_profiles> contains = (<profile_struct>.name)
				return \{true}
			else
				return \{false}
			endif
		endif
	endif
endscript

script unlock_profile 
	RequireParams \{[
			id
			savegame
		]
		all}
	CharacterProfileGetStruct name = <id> savegame = <savegame>
	if NOT StructureContains structure = <profile_struct> locked
		return
	else
		GetGlobalTags unlocked_profiles savegame = <savegame>
		if NOT GotParam \{unlocked_profiles}
			AddArrayElement array = [] element = <id>
			SetGlobalTags unlocked_profiles params = {unlocked_profiles = <array>} savegame = <savegame>
		else
			if NOT ArrayContains array = <unlocked_profiles> contains = <id>
				AddArrayElement array = <unlocked_profiles> element = <id>
				SetGlobalTags unlocked_profiles params = {unlocked_profiles = <array>} savegame = <savegame>
			endif
		endif
	endif
endscript

script unlock_all_profiles 
	CharacterProfileGetList savegame = <savegame>
	GetArraySize <profile_list>
	i = 0
	begin
	unlock_profile id = (<profile_list> [<i>]) savegame = <savegame>
	i = (<i> + 1)
	repeat <array_size>
endscript

script unlock_all_profiles_no_vbot 
	CharacterProfileGetList savegame = <savegame>
	GetArraySize <profile_list>
	i = 0
	begin
	if NOT ((<profile_list> [<i>]) = GH_Rocker_VBot)
		unlock_profile id = (<profile_list> [<i>]) savegame = <savegame>
	endif
	i = (<i> + 1)
	repeat <array_size>
endscript

script get_fullname_of_character 
	RequireParams \{[
			id
			savegame
		]
		all}
	if (<id> = avatar)
		return \{fullname = qs(0xc6da5330)}
	endif
	fullname = qs(0x241086be)
	if CharacterProfileGetStruct name = <id> savegame = <savegame> dont_assert
		if StructureContains structure = <profile_struct> fullname
			fullname = (<profile_struct>.fullname)
		endif
	endif
	if CharacterProfileGetCategory name = <id> savegame = <savegame>
		switch (<profile_category>)
			case ghrockers
			case modifiable
			case locked
			case debug
			return fullname = <fullname>
		endswitch
	endif
	if NOT GotParam \{profanity_allowed}
		if GotParam \{fullname}
			if NOT IsAcceptableString string = <fullname>
				RemoveParameter \{fullname}
			endif
		endif
	endif
	if NOT GotParam \{fullname}
		fullname = qs(0x241086be)
	endif
	return fullname = <fullname>
endscript

script get_fullname_for_player 
	GetPlayerInfo <player> GamerTag
	fullname = ($<GamerTag>)
	if PlayerInfoEquals <player> is_local_client = 1
		GetPlayerInfo <player> controller
		if NetSessionFunc func = IsControllerInGame params = {controller = <controller>}
			if NetSessionFunc Obj = match func = get_gamertag params = {controller = <controller>}
				Change globalname = <GamerTag> newValue = <name>
			endif
		endif
		if IsPS3
			NetSessionFunc func = get_user_id params = {controller_index = <controller>}
			SetPlayerInfo <player> net_id_first = (<user_id> [0])
			SetPlayerInfo <player> net_id_second = (<user_id> [1])
		endif
	endif
	fullname = ($<GamerTag>)
	if (<fullname> = qs(0x00000000))
		GetPlayerInfo <player> character_id
		GetPlayerInfo <player> character_savegame
		if GotParam \{character_savegame}
			if GotParam \{no_character_name}
				GetPlayerInfo <player> controller
				FormatText TextName = fullname qs(0x72f23aff) d = (<controller> + 1)
			else
				if PlayerInfoEquals <player> is_local_client = 1
					get_fullname_of_character savegame = <character_savegame> id = <character_id> profanity_allowed
				else
					get_fullname_of_character savegame = <character_savegame> id = <character_id>
				endif
			endif
		else
			GetPlayerInfo <player> controller
			FormatText TextName = fullname qs(0x72f23aff) d = (<controller> + 1)
		endif
	endif
	return fullname = <fullname>
endscript

script fix_deleted_character_player_info 
	RequireParams \{[
			player
		]
		all}
	GetPlayerInfo <player> character_id
	GetPlayerInfo <player> character_savegame
	if NOT CharacterProfileExists name = <character_id> savegame = <character_savegame>
		printf 'fix_deleted_character_player_info - fixing playerinfo %a: %b savegame:%c' a = <player> b = <character_id> c = <character_savegame>
		cas_get_random_ghrocker savegame = <character_savegame>
		SetPlayerInfo <player> character_id = <character_id>
		SetPlayerInfo <player> character_savegame = <character_savegame>
	endif
	GetPlayerInfo <player> chosen_character_id
	if (<chosen_character_id> != None)
		GetPlayerInfo <player> chosen_character_savegame
		if NOT CharacterProfileExists name = <chosen_character_id> savegame = <chosen_character_savegame>
			printf 'fix_deleted_character_player_info - fixing chosen-playerinfo %a: %b savegame:%c' a = <player> b = <chosen_character_savegame> c = <chosen_character_savegame>
			SetPlayerInfo <player> chosen_character_id = None
			SetPlayerInfo <player> chosen_character_savegame = -1
		endif
	endif
endscript

script fix_deleted_character_savegame 
	RequireParams \{[
			savegame
		]
		all}
	printf 'fix_deleted_character_savegame %s' s = <savegame>
	if GetGlobalTags savegame = <savegame> band_members noassert = 1
		i = 0
		begin
		get_saved_band_member savegame = <savegame> index = <i>
		printf 'band_members %a = %b(%c)' a = <i> b = <character_id> c = <character_savegame>
		if NOT CharacterProfileExists name = <character_id> savegame = <character_savegame>
			printf 'fix_deleted_character_savegame - fixing band_member %a: %b savegame:%c' a = <i> b = <character_id> c = <savegame>
			cas_get_random_ghrocker savegame = <savegame>
			set_band_member_entry {
				savegame = <savegame>
				index = <i>
				character_id = <character_id>
				character_savegame = -1
				user_changed = 0
			}
		endif
		i = (<i> + 1)
		repeat 4
	else
		printf \{'no band_members!'}
	endif
endscript

script sanity_check_fix_deleted_characters 
	get_num_savegames
	i = 0
	begin
	fix_deleted_character_savegame savegame = <i>
	i = (<i> + 1)
	repeat <num_savegames>
	GetMaxPlayers
	i = 0
	begin
	fix_deleted_character_player_info player = (<i> + 1)
	i = (<i> + 1)
	repeat <max_players>
endscript

script safe_update_band_characters 
	sanity_check_fix_deleted_characters
	persistent_band_refresh_changed_characters
endscript

script has_singing_guitarist 
	if NOT GlobalExists name = <Band>
		return \{false}
	endif
	Guitarist = ($<Band>.Guitarist)
	Vocalist = ($<Band>.Vocalist)
	if (<Guitarist> = SavedBandMember)
		return \{false}
	endif
	if (<Vocalist> = SavedBandMember)
		return \{false}
	endif
	printf channel = Band qs(0x6dd4ecb7) a = <Guitarist> b = <Vocalist>
	if (<Guitarist> != <Vocalist>)
		return \{false}
	endif
	return \{true}
endscript

script has_singing_bassist 
	if NOT GlobalExists name = <Band>
		return \{false}
	endif
	Bassist = ($<Band>.Bassist)
	Vocalist = ($<Band>.Vocalist)
	if (<Bassist> = SavedBandMember)
		return \{false}
	endif
	if (<Vocalist> = SavedBandMember)
		return \{false}
	endif
	printf channel = Band qs(0xa1168bf9) a = <Bassist> b = <Vocalist>
	if (<Bassist> != <Vocalist>)
		return \{false}
	endif
	return \{true}
endscript

script is_standard_band_setup 
	GameMode_GetType
	if ($in_sing_a_long = true || <type> = freeplay)
		return \{true}
	endif
	parts = [guitar bass vocals Drum]
	found = [0 0 0 0]
	get_player_infos_in_use
	part_index = 0
	begin
	check_part = (<parts> [<part_index>])
	i = 0
	begin
	player = (<player_infos_in_use> [<i>])
	GetPlayerInfo <player> part
	if (<part> = <check_part>)
		if (<found> [<part_index>] = 1)
			return \{false}
		endif
		SetArrayElement arrayName = found index = <part_index> newValue = 1
	endif
	i = (<i> + 1)
	repeat 4
	part_index = (<part_index> + 1)
	repeat 4
	return \{true}
endscript

script band_builder_get_band_global 
	if NOT ($use_worst_band = 0)
		if ($use_worst_band = male)
			return \{Band = worst_male_band}
		else
			return \{Band = worst_female_band}
		endif
	endif
	if ($jam_mode_band = 1)
		return \{Band = jam_mode_band_profiles}
	endif
	if NOT GotParam \{song}
		GMan_SongTool_GetCurrentSong
		song = <current_song>
	endif
	get_band_configuration song = <song>
	return Band = <Band>
endscript

script get_band_configuration 
	if NOT GotParam \{skip_dlc_check}
		if StructureContains structure = $download_songlist_props <song>
			return \{Band = default_band}
		endif
	endif
	get_song_struct song = <song>
	if StructureContains structure = <song_struct> Band
		if ($game_mode = p2_pro_faceoff)
			return \{Band = default_band}
		else
			return Band = (<song_struct>.Band)
		endif
	else
		return \{Band = default_band}
	endif
endscript

script debug_add_worst_case_cas_chars 
endscript
