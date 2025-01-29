
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
		character_id_callback = agora_character_id_callback
	}
	i = (<i> + 1)
	repeat ($max_num_create_a_rockers)
	characterprofileregister \{Type = saved
		category = ghrockers
		packtype = presetcars
		profiles = $preset_musician_profiles_ghrockers
		character_id_callback = agora_character_id_callback}
	if isXenon
		characterprofileregister \{Type = avatar
			category = modifiable
			packtype = presetcars
			Profile = $avatar_profile
			character_id_callback = agora_character_id_callback}
	endif
	characterprofileregister \{Type = saved
		category = modifiable
		packtype = presetcars
		profiles = $preset_musician_profiles_modifiable
		character_id_callback = agora_character_id_callback}
	characterprofileregister \{Type = constant
		category = locked
		profiles = $preset_musician_profiles_locked
		character_id_callback = agora_character_id_callback}
	characterprofileregister \{Type = global_appearance
		category = should_never_list
		Profile = {
			$default_temporary_profile
			Name = cas_current_appearance
			fullname = qs(0x03ac90f0)
		}
		global_name = cas_current_appearance
		character_id_callback = agora_character_id_callback}
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
		character_id_callback = agora_character_id_callback
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
		character_id_callback = agora_character_id_callback
	}
	formatText checksumName = id_checksum 'temporary_ghrocker_%d' d = <i> AddToStringLookup = true
	characterprofileregister {
		Type = temporary
		category = temporary
		Profile = {Name = <id_checksum> appearance = {}}
		packed_type = temporary_profiles_large
		character_id_callback = agora_character_id_callback
	}
	if isXenon
		formatText checksumName = id_checksum 'temporary_avatar_%d' d = <i> AddToStringLookup = true
		characterprofileregister {
			Type = temporary
			category = temporary
			Profile = {Name = <id_checksum> appearance = {}}
			packed_type = temporary_profiles_large
			character_id_callback = agora_character_id_callback
		}
	endif
	i = (<i> + 1)
	repeat 4
	if NOT CD
		register_debug_character_profiles
	endif
	characterprofiledump
endscript

script update_temporary_random_car \{slot = !i1768515945
		savegame = !i1768515945}
	formatText checksumName = id_checksum 'temporary_car_%d' d = <slot> AddToStringLookup = true
	generate_random_car_profile Name = <id_checksum> savegame = <savegame> is_female = <is_female>
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

script create_initial_temporary_random_cars async = <async>
	randomize
	i = 0
	begin
	update_temporary_random_car slot = <i> savegame = <i>
	conditional_async_wait async = <async>
	if isXenon
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
	cas_set_random_appearance savegame = <savegame> is_female = <is_female> genre = <genre> used_parts = <used_parts> <car_flags>
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
		profiles = $preset_musician_profiles_debug
		character_id_callback = agora_character_id_callback}
	if isps3
		new_random_debug_car_profile \{fullname = qs(0x6ff7f068)
			Name = avatar
			is_female = 0}
		characterprofileregister {
			Type = temporary
			category = debug
			Profile = {<profile_struct> selection_not_allowed}
			packed_type = temporary_profiles_small
			character_id_callback = agora_character_id_callback
		}
	endif
	i = 1
	begin
	formatText checksumName = Name 'RandomAvatar%d' d = <i> AddToStringLookup = true
	formatText TextName = fullname qs(0x689c63a9) d = <i> AddToStringLookup = true
	if isXenon
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
		character_id_callback = agora_character_id_callback
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
		character_id_callback = agora_character_id_callback
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
		if (<profile_type> = saved)
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

script get_savegame_from_controller \{controller = !i1768515945}
	getsavegamefromcontroller controller = <controller>
	if isxenonorwindx
		if GotParam \{band_character_select}
			<guest> = 0
			if NOT CheckForSignIn local controller_index = <controller>
				<guest> = 1
			elseif NetSessionFunc func = xenonisguest params = {controller_index = <controller>}
				<guest> = 1
			endif
			if (<guest> = 1)
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
	gamemode_gettype
	if NOT (<Type> = career)
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
	endif
endscript

script is_profile_unlocked \{profile_struct = 0x69696969
		savegame = !i1768515945}
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

script unlock_profile \{id = !q1768515945
		savegame = !i1768515945}
	profile_unlocked = 0
	if console_is_net_career_client
		<unlocked_profiles> = ($g_net_career_progression.unlocked_profiles)
		if NOT ArrayContains array = <unlocked_profiles> contains = <id>
			AddArrayElement array = <unlocked_profiles> element = <id>
			updatestructelement struct = g_net_career_progression element = unlocked_profiles value = <unlocked_profiles>
			profile_unlocked = 1
		endif
	endif
	profile_struct = {}
	characterprofilegetstruct Name = <id> savegame = <savegame>
	if NOT StructureContains structure = <profile_struct> locked
		return \{FALSE}
	else
		GetGlobalTags unlocked_profiles savegame = <savegame>
		if NOT GotParam \{unlocked_profiles}
			AddArrayElement array = [] element = <id>
			SetGlobalTags unlocked_profiles params = {unlocked_profiles = <array>} savegame = <savegame>
			profile_unlocked = 1
		else
			if NOT ArrayContains array = <unlocked_profiles> contains = <id>
				AddArrayElement array = <unlocked_profiles> element = <id>
				SetGlobalTags unlocked_profiles params = {unlocked_profiles = <array>} savegame = <savegame>
				profile_unlocked = 1
			endif
		endif
	endif
	if (<profile_unlocked> = 1)
		return \{true}
	endif
	return \{FALSE}
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
	fullname = qs(0x4b7ca92c)
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
	if NOT GotParam \{fullname}
		fullname = qs(0x241086be)
	endif
	return fullname = <fullname>
endscript

script get_fullname_for_player 
	if inroadiebattlemode
		getplayerinfo <Player> controller
		formatText TextName = player_name qs(0x3db3ac38) c = (<controller> + 1)
		return fullname = <player_name>
	endif
	getplayerinfo <Player> gamertag
	fullname = ($<gamertag>)
	if playerinfoequals <Player> is_local_client = 1
		getplayerinfo <Player> controller
		if (<controller> < 4)
			if NetSessionFunc func = iscontrolleringame params = {controller = <controller>}
				if NetSessionFunc Obj = match func = get_gamertag params = {controller = <controller>}
					Change GlobalName = <gamertag> NewValue = <Name>
				endif
			endif
			if ((isps3) || (isngc))
				NetSessionFunc func = get_user_id params = {controller_index = <controller>}
				setplayerinfo <Player> net_id_first = (<user_id> [0])
				setplayerinfo <Player> net_id_second = (<user_id> [1])
			endif
		endif
	endif
	fullname = ($<gamertag>)
	if (<fullname> = qs(0x00000000))
		getplayerinfo <Player> character_id
		getplayerinfo <Player> character_savegame
		<use_character_names> = 1
		if GotParam \{no_character_names}
			<use_character_names> = 0
		endif
		if ((GotParam character_savegame) && (<use_character_names> = 1))
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

script is_band_member_invalid \{character_id = !q1768515945
		character_savegame = !i1768515945}
	if characterprofileexists Name = <character_id> savegame = <character_savegame>
		characterprofilegetstruct savegame = <character_savegame> Name = <character_id>
		if (<character_savegame> = -1)
			if NOT StructureContains structure = <profile_struct> locked
				return \{FALSE}
			endif
		else
			if is_profile_unlocked savegame = <character_savegame> profile_struct = <profile_struct>
				return \{FALSE}
			endif
		endif
	endif
	return \{true}
endscript

script fix_deleted_character_player_info \{Player = !i1768515945}
	getplayerinfo <Player> character_id
	getplayerinfo <Player> character_savegame
	if is_band_member_invalid character_id = <character_id> character_savegame = <character_savegame>
		printf 'fix_deleted_character_player_info - fixing playerinfo %a: %b savegame:%c' a = <Player> b = <character_id> c = <character_savegame>
		cas_get_random_ghrocker savegame = <character_savegame>
		setplayerinfo <Player> character_id = <character_id>
		setplayerinfo <Player> character_savegame = <character_savegame>
	endif
	getplayerinfo <Player> chosen_character_id
	if (<chosen_character_id> != None)
		getplayerinfo <Player> chosen_character_savegame
		if is_band_member_invalid character_id = <chosen_character_id> character_savegame = <chosen_character_savegame>
			printf 'fix_deleted_character_player_info - fixing chosen-playerinfo %a: %b savegame:%c' a = <Player> b = <chosen_character_savegame> c = <chosen_character_savegame>
			set_chosen_character_id Player = <Player> id = None
		endif
	endif
endscript

script fix_deleted_character_savegame \{savegame = !i1768515945}
	printf 'fix_deleted_character_savegame %s' s = <savegame>
	if GetGlobalTags savegame = <savegame> band_members noassert = 1
		i = 0
		push_disable_globaltag_freeplay_check
		begin
		get_saved_band_member savegame = <savegame> index = <i>
		printf 'band_members %a = %b(%c)' a = <i> b = <character_id> c = <character_savegame>
		if is_band_member_invalid character_id = <character_id> character_savegame = <character_savegame>
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
		pop_disable_globaltag_freeplay_check
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

script fix_profile_struct_for_career \{profile_struct = 0x69696969}
	if NOT bl_is_in_band_lobby_menus
		gamemode_gettype
		if (<Type> = career)
			get_savegame_from_controller controller = ($primary_controller)
			if quest_progression_check_domination_unlocked savegame = <savegame>
				appearance = (<profile_struct>.appearance)
				if check_cas_item_unlocked_flag part = cas_full_guitar desc_id = gtr137_demi savegame = <savegame>
					remove_instrument_from_appearance appearance = <appearance> instrument = guitar
					AddParam \{structure_name = appearance
						Name = cas_full_guitar
						value = {
							desc_id = gtr137_demi
						}}
				endif
				if check_cas_item_unlocked_flag part = cas_full_bass desc_id = bass137_demi savegame = <savegame>
					remove_instrument_from_appearance appearance = <appearance> instrument = bass
					AddParam \{structure_name = appearance
						Name = cas_full_bass
						value = {
							desc_id = bass137_demi
						}}
				endif
				AddParam structure_name = profile_struct Name = appearance value = <appearance>
				<appearance> = {}
				return true profile_struct = <profile_struct>
			endif
		endif
	endif
	return \{FALSE}
endscript

script remove_instrument_from_appearance \{instrument = !q1768515945
		appearance = 0x69696969}
	array = ($instrument_part_sets.<instrument>)
	GetArraySize <array>
	<i> = 0
	begin
	part = (<array> [<i>])
	RemoveParameter struct_name = appearance <part>
	<i> = (<i> + 1)
	repeat <array_Size>
	return appearance = <appearance>
endscript
