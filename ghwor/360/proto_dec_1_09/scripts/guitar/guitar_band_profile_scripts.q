
script register_initial_character_profiles \{async = 0}
	GetArraySize \{$preset_musician_profiles_ghrockers}
	num_profiles = (<array_Size>)
	GetArraySize \{$preset_musician_profiles_modifiable}
	num_profiles = (<array_Size> + <num_profiles>)
	GetArraySize \{$preset_musician_profiles_locked}
	num_profiles = (<array_Size> + <num_profiles>)
	GetArraySize \{$preset_musician_profiles_debug}
	num_profiles = (<array_Size> + <num_profiles>)
	num_profiles = (($max_num_create_a_rockers) + <num_profiles>)
	num_profiles = (($max_temporary_profiles_small) + ($max_temporary_profiles_large) + <num_profiles>)
	if NOT GotParam \{no_reinit}
		characterprofileinit max_profiles = <num_profiles>
	endif
	i = 0
	begin
	formatText checksumName = id_checksum 'custom_character_%d' d = <i> AddToStringLookup = true
	characterprofileregister {
		Type = saved
		category = cars
		packtype = createarocker
		Name = <id_checksum>
	}
	i = (<i> + 1)
	repeat ($max_num_create_a_rockers)
	characterprofileregister \{Type = saved
		category = ghrockers
		packtype = presetcars
		profiles = $preset_musician_profiles_ghrockers}
	if isXenon
		characterprofileregister \{Type = avatar
			category = modifiable
			packtype = presetcars
			Profile = $avatar_profile}
	endif
	characterprofileregister \{Type = saved
		category = modifiable
		packtype = presetcars
		profiles = $preset_musician_profiles_modifiable}
	characterprofileregister \{Type = constant
		category = locked
		profiles = $preset_musician_profiles_locked}
	characterprofileregister \{Type = global_appearance
		category = should_never_list
		Profile = {
			$default_temporary_profile
			Name = cas_current_appearance
			fullname = qs(0x03ac90f0)
		}
		global_name = cas_current_appearance}
	getmaxplayers
	i = 0
	begin
	formatText checksumName = id_checksum 'temporary_netprofile_%d' d = <i> AddToStringLookup = true
	Profile = {
		Name = <id_checksum>
		fullname = qs(0x03ac90f0)
		appearance = ($empty_appearance)
		($default_temporary_profile)
	}
	characterprofileregister {
		Type = temporary
		category = temporary
		Profile = <Profile>
		packed_type = temporary_profiles_large
	}
	i = (<i> + 1)
	repeat <max_players>
	i = 0
	begin
	formatText checksumName = id_checksum 'temporary_car_%d' d = <i> AddToStringLookup = true
	characterprofileregister {
		Type = temporary
		category = temporary
		Profile = {Name = <id_checksum> appearance = {}}
		packed_type = temporary_profiles_large
	}
	formatText checksumName = id_checksum 'temporary_ghrocker_%d' d = <i> AddToStringLookup = true
	characterprofileregister {
		Type = temporary
		category = temporary
		Profile = {Name = <id_checksum> appearance = {}}
		packed_type = temporary_profiles_large
	}
	if isXenon
		formatText checksumName = id_checksum 'temporary_avatar_%d' d = <i> AddToStringLookup = true
		characterprofileregister {
			Type = temporary
			category = temporary
			Profile = {Name = <id_checksum> appearance = {}}
			packed_type = temporary_profiles_large
		}
	endif
	i = (<i> + 1)
	repeat 4
	if NOT CD
		register_debug_character_profiles
	endif
	characterprofiledump
endscript

script update_temporary_random_car 
	RequireParams \{[
			slot
			savegame
		]
		all}
	formatText checksumName = id_checksum 'temporary_car_%d' d = <slot> AddToStringLookup = true
	generate_random_car_profile Name = <id_checksum> savegame = <savegame>
	characterprofilesetstruct Name = <id_checksum> savegame = <savegame> profile_struct = <Profile>
endscript

script update_temporary_random_avatar 
	RequireParams \{[
			slot
			savegame
		]
		all}
	formatText checksumName = id_checksum 'temporary_avatar_%d' d = <slot> AddToStringLookup = true
	generate_random_avatar_profile Name = <id_checksum> savegame = <savegame>
	characterprofilesetstruct Name = <id_checksum> savegame = <savegame> profile_struct = <Profile>
endscript

script update_temporary_ghrocker 
	RequireParams \{[
			slot
			savegame
			character_id
			outfit
		]
		all}
	formatText checksumName = id_checksum 'temporary_ghrocker_%d' d = <slot> AddToStringLookup = true
	characterprofilegetstruct Name = <character_id> savegame = <savegame>
	appearance = (<profile_struct>.appearance)
	new_desc_id = {desc_id = <outfit>}
	<appearance> = {<appearance> cas_full_body = <new_desc_id>}
	characterprofilesetstruct savegame = <savegame> Name = <id_checksum> profile_struct = {<profile_struct> appearance = <appearance> Name = <id_checksum>}
endscript

script create_initial_temporary_random_cars async = <async>
	randomize
	i = 0
	begin
	update_temporary_random_car slot = <i> savegame = <i>
	conditional_async_wait async = <async>
	if isavatarsysteminitialized
		update_temporary_random_avatar slot = <i> savegame = <i>
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
			Name
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
		Name = <Name>
		fullname = <random_name>
		appearance = ($cas_current_appearance)
		allowed_parts = [drum vocals guitar bass]
		blurb = qs(0x03ac90f0)
	}
	Change \{cas_current_appearance = {
		}}
	return Profile = <Profile>
endscript

script generate_random_avatar_profile \{genre = pop}
	RequireParams \{[
			Name
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
		Name = <Name>
		fullname = <random_name>
		appearance = ($cas_current_appearance)
	}
	Change \{cas_current_appearance = {
		}}
	return Profile = <Profile>
endscript

script register_debug_character_profiles 
	characterprofileregister \{Type = constant
		category = debug
		profiles = $preset_musician_profiles_debug}
	if isps3
		new_random_debug_car_profile \{fullname = qs(0x6ff7f068)
			Name = avatar
			is_female = 0}
		characterprofileregister {
			Type = temporary
			category = debug
			Profile = {<profile_struct> selection_not_allowed}
			packed_type = temporary_profiles_small
		}
	endif
	i = 1
	begin
	formatText checksumName = Name 'RandomAvatar%d' d = <i> AddToStringLookup = true
	formatText TextName = fullname qs(0x689c63a9) d = <i> AddToStringLookup = true
	if isavatarsysteminitialized
		new_random_avatar_profile fullname = <fullname> Name = <Name>
	else
		new_random_debug_car_profile fullname = <fullname> Name = <Name> is_female = 0
		profile_struct = {<profile_struct> selection_not_allowed}
	endif
	characterprofileregister {
		Type = temporary
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
		formatText checksumName = Name 'RandomFemale%d' d = <i> AddToStringLookup = true
		formatText TextName = fullname qs(0xfcd50580) d = <i> AddToStringLookup = true
	else
		formatText checksumName = Name 'RandomMale%d' d = <i> AddToStringLookup = true
		formatText TextName = fullname qs(0x72d5f526) d = <i> AddToStringLookup = true
	endif
	new_random_debug_car_profile fullname = <fullname> Name = <Name> is_female = <is_female> used_parts = <used_parts>
	band_builder_get_used_parts_in_appearance appearance = (<profile_struct>.appearance) used_parts = <used_parts>
	characterprofileregister {
		Type = temporary
		category = debug
		Profile = <profile_struct>
		packed_type = temporary_profiles_small
	}
	i = (<i> + 1)
	repeat 4
endscript

script new_random_debug_car_profile 
	generate_random_car_profile {
		Name = <Name>
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
			Name = <Name>
			fullname = <fullname>
			appearance = <appearance>
		}
	endif
	return \{FALSE}
endscript

script debug_reset_character_profiles 
	if retailbuild
		return
	endif
	characterprofilegetlist \{debug_all}
	GetArraySize <profile_list>
	i = 0
	begin
	character_id = (<profile_list> [<i>])
	characterprofileunregister Name = <character_id>
	i = (<i> + 1)
	repeat <array_Size>
	characterprofilegetlist \{debug_all}
	GetArraySize <profile_list>
	if (<array_Size> != 0)
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
	formatText checksumName = id_checksum 'custom_character_%d' d = <i> AddToStringLookup = true
	if NOT characterprofileexists savegame = <savegame> Name = <id_checksum>
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
	if characterprofilegettype Name = <id>
		if ((<profile_type> = saved) || (<profile_type> = avatar))
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script is_completely_custom_musician 
	RequireParams \{[
			id
		]
		all}
	if characterprofilegetcategory Name = <id>
		if (<profile_category> = cars)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script is_ghrocker 
	RequireParams \{[
			id
		]
		all}
	if characterprofilegetcategory Name = <id>
		if (<profile_category> = ghrockers)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script modify_custom_profile_appearance 
	RequireParams \{[
			id
			savegame
			appearance
		]
		all}
	if profile_can_be_modified id = <id>
		characterprofilegetstruct Name = <id> savegame = <savegame>
		characterprofilesetstruct Name = <id> savegame = <savegame> profile_struct = {<profile_struct> appearance = <appearance>}
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
		characterprofilegetstruct Name = <id> savegame = <savegame>
		characterprofilesetstruct Name = <id> savegame = <savegame> profile_struct = {<profile_struct> fullname = <fullname>}
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
		characterprofilegetstruct Name = <id> savegame = <savegame>
		characterprofilesetstruct Name = <id> savegame = <savegame> profile_struct = {<profile_struct> blurb = <blurb>}
	endif
endscript

script add_new_custom_profile 
	RequireParams \{[
			savegame
			Profile
		]
		all}
	if is_completely_custom_musician id = (<Profile>.Name)
		characterprofilesetstruct Name = (<Profile>.Name) savegame = <savegame> profile_struct = <Profile>
		GetGlobalTags savegame = <savegame> custom_character_order
		if ArrayContains array = <custom_character_order> contains = (<Profile>.Name)
			ScriptAssert '%s already created!' s = (<Profile>.Name)
		endif
		AddArrayElement array = <custom_character_order> element = (<Profile>.Name)
		SetGlobalTags savegame = <savegame> custom_character_order params = {custom_character_order = <array>}
	else
		ScriptAssert '%s is not a custom profile' s = (<Profile>.Name)
	endif
endscript

script delete_custom_profile 
	RequireParams \{[
			savegame
			id
		]
		all}
	if is_completely_custom_musician id = <id>
		characterprofilesetstruct Name = <id> savegame = <savegame> delete_profile
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
	characterprofilegetstruct Name = <id>
	characterprofilesetstruct Name = <id> savegame = <savegame> profile_struct = <profile_struct>
endscript

script has_custom_rocker_been_modified 
	RequireParams \{[
			savegame
			id
		]
		all}
	characterprofilegetstruct Name = <id>
	generatechecksumfromstruct struct = (<profile_struct>.appearance)
	original_checksum = (<structure_checksum>)
	characterprofilegetstruct Name = <id> savegame = <savegame>
	generatechecksumfromstruct struct = (<profile_struct>.appearance)
	if (<original_checksum> != <structure_checksum>)
		return \{true}
	endif
	return \{FALSE}
endscript

script get_savegame_from_player 
	RequireParams \{[
			Player
		]
		all}
	getplayerinfo <Player> is_local_client
	if (<is_local_client> = 0)
		ScriptAssert \{'get_savegame_from_player called on a remote player, please fix this so it isn\'t'}
	endif
	getplayerinfo <Player> controller
	get_savegame_from_controller controller = <controller> <...>
	return savegame = <savegame> borrowed_from_band_leader = <borrowed_from_band_leader>
endscript

script get_savegame_from_controller 
	RequireParams \{[
			controller
		]
		all}
	getsavegamefromcontroller controller = <controller>
	if isxenonorwindx
		if GotParam \{band_character_select}
			if NOT CheckForSignIn local controller_index = <controller>
				guest = 1
			elseif NetSessionFunc func = xenonisguest params = {controller_index = <controller>}
				guest = 1
			endif
			if GotParam \{guest}
				leader_index = ($primary_controller)
				if ((<leader_index> != -1) && (<leader_index> != <controller>))
					getsavegamefromcontroller controller = <controller>
					borrowed_from_band_leader = <savegame>
					getsavegamefromcontroller controller = <leader_index>
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
		return \{FALSE}
	else
		return \{true}
	endif
endscript

script is_allowed_part 
	if ((<part> = bass) || (<part> = guitar) || (<part> = drum) || (<part> = vocals))
		if StructureContains structure = <profile_struct> allowed_parts
			i = 0
			GetArraySize (<profile_struct>.allowed_parts)
			if (<array_Size> > 0)
				begin
				if ((<profile_struct>.allowed_parts) [<i>] = <part>)
					return \{true}
				endif
				i = (<i> + 1)
				repeat <array_Size>
			endif
		endif
		return \{FALSE}
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
	if (<part> != cas_full_body)
		ScriptAssert 'part %s != CAS_Full_Body' s = <part>
	endif
	if getactualcasoptionstruct part = <part> desc_id = <desc_id>
		if GotParam \{ghrocker}
			if (<ghrocker> = <matcheswith>)
				return \{true}
			endif
		endif
	endif
	return \{FALSE}
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
	formatText checksumName = id_checksum 'temporary_netprofile_%d' d = <index> AddToStringLookup = true
	characterprofilesetstruct Name = <id_checksum> savegame = -1 profile_struct = {
		($default_temporary_profile)
		Name = <id_checksum>
		fullname = <fullname>
		appearance = <appearance>
	}
endscript

script fill_local_appearance_data 
	printf \{qs(0xf06dd408)}
	printstruct <...>
	if playerinfoequals <player_number> is_local_client = 1
		getplayerinfo <player_number> character_id out = my_character_id
		getplayerinfo <player_number> character_savegame
		if NOT characterprofilegetstruct Name = <my_character_id> savegame = <character_savegame> dont_assert
			ScriptAssert '%s not found in savegame %d' s = <my_character_id> d = <character_savegame>
		endif
		get_fullname_of_character id = <my_character_id> savegame = <character_savegame>
		return character_id = <my_character_id> appearance = {(<profile_struct>.appearance) fullname = <fullname> old_character_id = <id>}
	endif
endscript

script dump_player_info 
	getplayerinfo <Player> controller
	getplayerinfo <Player> character_id
	getplayerinfo <Player> is_local_client
	printstruct {Player = <Player> controller = <controller> character_id = <character_id> is_local_client = <is_local_client>}
endscript

script start_song_got_net_appearance 
	printf 'start_song_got_net_appearance %d' d = <netplayer>
	if (<netplayer> > 1)
		if (<netplayer> < 5)
			appearance_num = <netplayer>
			formatText checksumName = netappearance_id 'temporary_netprofile_%d' d = (<appearance_num> -1)
			if GotParam \{userandomplayer}
				get_savegame_from_controller controller = ($primary_controller)
				getplayerinfo <netplayer> part
				cas_get_random_ghrocker savegame = <savegame>
				setplayerinfo <netplayer> character_id = <character_id>
				setplayerinfo <netplayer> character_savegame = <savegame>
			else
				setplayerinfo <netplayer> character_id = <netappearance_id>
				setplayerinfo <netplayer> character_savegame = -1
				modify_net_appearance index = (<appearance_num> -1) appearance = <appearance> fullname = (<appearance>.fullname)
			endif
			set_chosen_character_id Player = <netplayer> id = None
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
			return \{FALSE}
		else
			if ArrayContains array = <unlocked_profiles> contains = (<profile_struct>.Name)
				return \{true}
			else
				return \{FALSE}
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
	characterprofilegetstruct Name = <id> savegame = <savegame>
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
	characterprofilegetlist savegame = <savegame>
	GetArraySize <profile_list>
	if (<array_Size> > 0)
		i = 0
		begin
		unlock_profile id = (<profile_list> [<i>]) savegame = <savegame>
		i = (<i> + 1)
		repeat <array_Size>
	endif
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
	if characterprofilegetstruct Name = <id> savegame = <savegame> dont_assert
		if StructureContains structure = <profile_struct> fullname
			fullname = (<profile_struct>.fullname)
		endif
	endif
	if characterprofilegetcategory Name = <id> savegame = <savegame>
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
			if NOT isacceptablestring string = <fullname>
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
	getplayerinfo <Player> gamertag
	fullname = ($<gamertag>)
	if playerinfoequals <Player> is_local_client = 1
		getplayerinfo <Player> controller
		if NetSessionFunc func = iscontrolleringame params = {controller = <controller>}
			if NetSessionFunc Obj = match func = get_gamertag params = {controller = <controller>}
				Change GlobalName = <gamertag> NewValue = <Name>
			endif
		endif
		if isps3
			NetSessionFunc func = get_user_id params = {controller_index = <controller>}
			setplayerinfo <Player> net_id_first = (<user_id> [0])
			setplayerinfo <Player> net_id_second = (<user_id> [1])
		endif
	endif
	fullname = ($<gamertag>)
	if (<fullname> = qs(0x00000000))
		getplayerinfo <Player> character_id
		getplayerinfo <Player> character_savegame
		if GotParam \{character_savegame}
			if GotParam \{no_character_name}
				getplayerinfo <Player> controller
				formatText TextName = fullname qs(0x72f23aff) d = (<controller> + 1)
			else
				if playerinfoequals <Player> is_local_client = 1
					get_fullname_of_character savegame = <character_savegame> id = <character_id> profanity_allowed
				else
					get_fullname_of_character savegame = <character_savegame> id = <character_id>
				endif
			endif
		else
			getplayerinfo <Player> controller
			formatText TextName = fullname qs(0x72f23aff) d = (<controller> + 1)
		endif
	endif
	return fullname = <fullname>
endscript

script fix_deleted_character_player_info 
	RequireParams \{[
			Player
		]
		all}
	getplayerinfo <Player> character_id
	getplayerinfo <Player> character_savegame
	if NOT characterprofileexists Name = <character_id> savegame = <character_savegame>
		printf 'fix_deleted_character_player_info - fixing playerinfo %a: %b savegame:%c' a = <Player> b = <character_id> c = <character_savegame>
		cas_get_random_ghrocker savegame = <character_savegame>
		setplayerinfo <Player> character_id = <character_id>
		setplayerinfo <Player> character_savegame = <character_savegame>
	endif
	getplayerinfo <Player> chosen_character_id
	if (<chosen_character_id> != None)
		getplayerinfo <Player> chosen_character_savegame
		if NOT characterprofileexists Name = <chosen_character_id> savegame = <chosen_character_savegame>
			printf 'fix_deleted_character_player_info - fixing chosen-playerinfo %a: %b savegame:%c' a = <Player> b = <chosen_character_savegame> c = <chosen_character_savegame>
			set_chosen_character_id Player = <Player> id = None
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
		if NOT characterprofileexists Name = <character_id> savegame = <character_savegame>
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
	getmaxplayers
	i = 0
	begin
	fix_deleted_character_player_info Player = (<i> + 1)
	i = (<i> + 1)
	repeat <max_players>
endscript

script safe_update_band_characters 
	sanity_check_fix_deleted_characters
	persistent_band_refresh_changed_characters
endscript

script has_singing_guitarist 
	if NOT GlobalExists Name = <Band>
		return \{FALSE}
	endif
	GUITARIST = ($<Band>.GUITARIST)
	vocalist = ($<Band>.vocalist)
	if (<GUITARIST> = savedbandmember)
		return \{FALSE}
	endif
	if (<vocalist> = savedbandmember)
		return \{FALSE}
	endif
	printf channel = Band qs(0x6dd4ecb7) a = <GUITARIST> b = <vocalist>
	if (<GUITARIST> != <vocalist>)
		return \{FALSE}
	endif
	return \{true}
endscript

script has_singing_bassist 
	if NOT GlobalExists Name = <Band>
		return \{FALSE}
	endif
	BASSIST = ($<Band>.BASSIST)
	vocalist = ($<Band>.vocalist)
	if (<BASSIST> = savedbandmember)
		return \{FALSE}
	endif
	if (<vocalist> = savedbandmember)
		return \{FALSE}
	endif
	printf channel = Band qs(0xa1168bf9) a = <BASSIST> b = <vocalist>
	if (<BASSIST> != <vocalist>)
		return \{FALSE}
	endif
	return \{true}
endscript

script is_standard_band_setup 
	gamemode_gettype
	if (<Type> = freeplay || $in_sing_a_long = true)
		return \{true}
	endif
	parts = [guitar bass vocals drum]
	found = [0 0 0 0]
	get_player_infos_in_use
	part_index = 0
	begin
	check_part = (<parts> [<part_index>])
	i = 0
	begin
	Player = (<player_infos_in_use> [<i>])
	getplayerinfo <Player> part
	if (<part> = <check_part>)
		if (<found> [<part_index>] = 1)
			return \{FALSE}
		endif
		SetArrayElement ArrayName = found index = <part_index> NewValue = 1
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
		playlist_getcurrentsong
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
		return Band = (<song_struct>.Band)
	else
		return \{Band = default_band}
	endif
endscript

script set_chosen_character_id \{savegame = -1}
	RequireParams \{[
			Player
			id
			savegame
		]
		all}
	store_flag = {store}
	if GotParam \{no_store}
		store_flag = {}
	endif
	printf 'set_chosen_character_id player=%p id=%i savegame=%s' p = <Player> i = <id> s = <savegame>
	setplayerinfo <Player> chosen_character_id = <id> <store_flag>
	setplayerinfo <Player> chosen_character_savegame = <savegame> <store_flag>
endscript

script check_cas 
	if CD
		return
	endif
	if GotParam \{textures}
		verifycaptextures
	endif
	if GotParam \{preset_profiles}
		verifycapprofile Profile = ($default_custom_musician_profile_female)
		verifycapprofile Profile = ($default_custom_musician_profile_male)
		verifycapprofile Profile = ($avatar_profile)
		verifycapprofile profiles = ($preset_musician_profiles_ghrockers)
		verifycapprofile profiles = ($preset_musician_profiles_modifiable)
		verifycapprofile profiles = ($preset_musician_profiles_locked) allowlocked
		verifycapprofile profiles = ($preset_musician_profiles_debug) allowlocked
		verifycapprofile appearances = ($cas_preset_guitars) must_have = cas_guitar_bridges
		verifycapprofile appearances = ($cas_preset_basses) must_have = cas_bass_bridges
		verifycapprofile appearances = ($cas_preset_drums) must_have = cas_drums
		verifycapprofile appearances = ($cas_preset_female_vocals) must_have = cas_mic
		verifycapprofile appearances = ($cas_preset_male_vocals) must_have = cas_mic
		verifycapprofile pieces = ($cas_preset_tattoo_female) part = cas_body desc_id = gh4_car_female
		verifycapprofile pieces = ($cas_preset_tattoo_male) part = cas_body desc_id = gh4_car_male
		verifycapprofile appearances = ($cas_preset_body_female) must_have = cas_body
		verifycapprofile appearances = ($cas_preset_body_male) must_have = cas_body
		verifycapprofile appearances = ($cas_preset_outfit_female) must_have = cas_female_torso
		verifycapprofile appearances = ($cas_preset_outfit_male) must_have = cas_male_torso
		verifycapprofile pieces = ($cas_preset_bandlogo) part = cas_band_logo desc_id = cas_band_logo_id
		verifycapprofile \{default_cap}
		verifycapprofile \{inclusion_lists}
	endif
	if GotParam \{savegames}
		get_num_savegames
		savegame = 0
		begin
		reset_savegame = 0
		characterprofilegetlist savegame = <savegame>
		GetArraySize <profile_list>
		if (<array_Size> > 0)
			i = 0
			begin
			if profile_can_be_modified id = (<profile_list> [<i>])
				characterprofilegetstruct savegame = <savegame> Name = (<profile_list> [<i>])
				if NOT verifycapprofile Profile = <profile_struct> no_assert allowlocked
					reset_savegame = 1
					printf \{'bad profile:'}
					printstruct <profile_struct>
				endif
			endif
			i = (<i> + 1)
			repeat <array_Size>
		endif
		if (<reset_savegame> = 1)
			SoftAssert \{'Your savegame has out of date create-a-rocker data, resetting it'}
			reset_all_preset_characters savegame = <savegame>
			delete_all_car_characters savegame = <savegame>
		endif
		<savegame> = (<savegame> + 1)
		repeat <num_savegames>
	endif
endscript

script generate_worst_cas_appearances 
	get_worst_case_band_member_appearance \{required_parts = [
			cas_male_hat_hair
			cas_guitar_body
		]
		forced_choices = {
			cas_body = gh4_car_male
		}}
	male_appearance = <appearance>
	get_worst_case_band_member_appearance \{required_parts = [
			cas_male_hat_hair
			cas_bass_body
		]
		forced_choices = {
			cas_body = gh4_car_male
		}}
	male_appearance = {<male_appearance> <appearance>}
	get_worst_case_band_member_appearance \{required_parts = [
			cas_male_hat_hair
			cas_drums
		]
		forced_choices = {
			cas_body = gh4_car_male
		}}
	male_appearance = {<male_appearance> <appearance>}
	get_worst_case_band_member_appearance \{required_parts = [
			cas_male_hat_hair
			cas_mic
		]
		forced_choices = {
			cas_body = gh4_car_male
		}}
	male_appearance = {<male_appearance> <appearance>}
	get_worst_case_band_member_appearance \{required_parts = [
			cas_female_hat_hair
			cas_guitar_body
		]
		forced_choices = {
			cas_body = gh4_car_female
		}}
	female_appearance = <appearance>
	get_worst_case_band_member_appearance \{required_parts = [
			cas_female_hat_hair
			cas_bass_body
		]
		forced_choices = {
			cas_body = gh4_car_female
		}}
	female_appearance = {<female_appearance> <appearance>}
	get_worst_case_band_member_appearance \{required_parts = [
			cas_female_hat_hair
			cas_drums
		]
		forced_choices = {
			cas_body = gh4_car_female
		}}
	female_appearance = {<female_appearance> <appearance>}
	get_worst_case_band_member_appearance \{required_parts = [
			cas_female_hat_hair
			cas_mic
		]
		forced_choices = {
			cas_body = gh4_car_female
		}}
	female_appearance = {<female_appearance> <appearance>}
	casoutputworstcasefile {
		path = 'car_worst_appearances.q'
		structs = {
			worst_female_appearance = <female_appearance>
			worst_male_appearance = <male_appearance>
		}
	}
endscript

script get_worst_case_band_member_appearance 
	casgetworstskincombination budgets = $cas_budget_groups required_parts = <required_parts>
	appearance = {}
	GetArraySize \{worst_skins}
	i = 0
	begin
	part = (<worst_skins> [<i>])
	RemoveParameter \{forced_choice}
	if GotParam \{forced_choices}
		if StructureContains structure = <forced_choices> <part>
			forced_choice = (<forced_choices>.<part>)
		endif
	endif
	casgettopskins part = <part> Force = <forced_choice>
	appearance = {<appearance> <topskins>}
	i = (<i> + 1)
	repeat <array_Size>
	Change cas_current_appearance = <appearance>
	if StructureContains structure = <appearance> cas_guitar_body
		fix_cag_include_part part = cas_guitar_body desc_id = (<appearance>.cas_guitar_body.desc_id) node_parts_only
	endif
	if StructureContains structure = <appearance> cas_bass_body
		fix_cag_include_part part = cas_bass_body desc_id = (<appearance>.cas_bass_body.desc_id) node_parts_only
	endif
	if StructureContains structure = <appearance> cas_drums
		fix_cag_include_part part = cas_drums desc_id = (<appearance>.cas_drums.desc_id) node_parts_only
	endif
	return appearance = ($cas_current_appearance)
endscript

script debug_add_worst_case_cas_chars 
endscript
