
script register_initial_character_profiles 
	GetArraySize \{$preset_musician_profiles_ghrockers}
	num_profiles = (<array_Size>)
	GetArraySize \{$0x6db04597}
	num_profiles = (<array_Size> + <num_profiles>)
	GetArraySize \{$preset_musician_profiles_locked}
	num_profiles = (<array_Size> + <num_profiles>)
	GetArraySize \{$preset_musician_profiles_debug}
	num_profiles = (<array_Size> + <num_profiles>)
	num_profiles = (($max_num_create_a_rockers) + <num_profiles>)
	num_profiles = (($max_temporary_profiles_small) + ($max_temporary_profiles_large) + <num_profiles>)
	characterprofileinit max_profiles = <num_profiles>
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
	characterprofileregister \{Type = saved
		category = modifiable
		packtype = presetcars
		profiles = $0x6db04597}
	characterprofileregister \{Type = constant
		category = locked
		profiles = $preset_musician_profiles_locked}
	characterprofileregister \{Type = constant
		category = debug
		profiles = $preset_musician_profiles_debug}
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
		allowed_parts = [drum vocals guitar bass]
		selection_not_allowed
		appearance = ($empty_appearance)
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
	new_desc_id = <outfit>
	outfit_array = cas_outfit
	outfit_list = ($<outfit_array>)
	GetArraySize <outfit_list>
	if (<array_Size> > 0)
		i = 0
		begin
		this_ID = ((<outfit_list> [<i>]).desc_id)
		if ghrocker_body_matches matcheswith = <character_id> part = <outfit_array> desc_id = ((<outfit_list> [<i>]).desc_id)
			if (<this_ID> = <new_desc_id>)
				new_part = (<outfit_list> [<i>])
				new_part_desc_id = {desc_id = <outfit>}
				<appearance> = {<appearance> cas_outfit = <new_part_desc_id>}
				if StructureContains structure = (<new_part>) cas_male_base_torso
					new_part_desc_id = {desc_id = ((<new_part>).cas_male_base_torso.desc_id)}
					<appearance> = {<appearance> cas_male_base_torso = <new_part_desc_id>}
				endif
				if StructureContains structure = (<new_part>) cas_male_base_face
					new_part_desc_id = {desc_id = ((<new_part>).cas_male_base_face.desc_id)}
					<appearance> = {<appearance> cas_male_base_face = <new_part_desc_id>}
				endif
				if StructureContains structure = (<new_part>) cas_male_base_hands
					new_part_desc_id = {desc_id = ((<new_part>).cas_male_base_hands.desc_id)}
					<appearance> = {<appearance> cas_male_base_hands = <new_part_desc_id>}
				endif
				if StructureContains structure = (<new_part>) cas_female_base_torso
					new_part_desc_id = {desc_id = ((<new_part>).cas_female_base_torso.desc_id)}
					<appearance> = {<appearance> cas_female_base_torso = <new_part_desc_id>}
				endif
				if StructureContains structure = (<new_part>) cas_female_base_face
					new_part_desc_id = {desc_id = ((<new_part>).cas_female_base_face.desc_id)}
					<appearance> = {<appearance> cas_female_base_face = <new_part_desc_id>}
				endif
				if StructureContains structure = (<new_part>) cas_female_base_hands
					new_part_desc_id = {desc_id = ((<new_part>).cas_female_base_hands.desc_id)}
					<appearance> = {<appearance> cas_female_base_hands = <new_part_desc_id>}
				endif
				break
			endif
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	characterprofilesetstruct savegame = <savegame> Name = <id_checksum> profile_struct = {<profile_struct> appearance = <appearance> Name = <id_checksum>}
endscript

script create_initial_temporary_random_cars async = <async>
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
	cas_set_random_instrument is_female = <is_female> genre = <genre>
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
	return \{savegame = 0
		owns_savegame = 1}
endscript

script get_savegame_from_controller 
	return \{savegame = 0
		owns_savegame = 1}
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
	if ($allow_controller_for_all_instruments = 1)
		return \{true}
	else
		ScriptAssert 'is_allowed_part - %d unrecognized' d = <part>
	endif
endscript

script ghrocker_body_matches 
	RequireParams \{[
			matcheswith
			part
			desc_id
		]
		all}
	if (<part> != cas_outfit)
		ScriptAssert 'part %s != CAS_Outfit' s = <part>
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
			setplayerinfo <netplayer> chosen_character_id = None
			setplayerinfo <netplayer> chosen_character_savegame = -1
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
	i = 0
	begin
	unlock_profile id = (<profile_list> [<i>]) savegame = <savegame>
	i = (<i> + 1)
	repeat <array_Size>
endscript

script 0x2ac7c388 
	characterprofilegetlist savegame = <savegame>
	GetArraySize <profile_list>
	i = 0
	begin
	if NOT ((<profile_list> [<i>]) = 0x26ab6f0d)
		unlock_profile id = (<profile_list> [<i>]) savegame = <savegame>
	endif
	i = (<i> + 1)
	repeat <array_Size>
endscript

script get_fullname_of_character 
	RequireParams \{[
			id
			savegame
		]
		all}
	fullname = qs(0x241086be)
	if characterprofilegetstruct Name = <id> savegame = <savegame> dont_assert
		if StructureContains structure = <profile_struct> fullname
			fullname = (<profile_struct>.fullname)
		endif
	endif
	if searchmusicianprofilearray array_name = preset_musician_profiles_locked id = <id>
		return fullname = <fullname>
	endif
	if searchmusicianprofilearray array_name = 0x6db04597 id = <id>
		return fullname = <fullname>
	endif
	if searchmusicianprofilearray array_name = preset_musician_profiles_ghrockers id = <id>
		return fullname = <fullname>
	endif
	if NOT GotParam \{fullname}
		fullname = qs(0x241086be)
	endif
	return fullname = <fullname>
endscript

script get_fullname_for_player 
	if is_roadie_battle_mode
		getplayerinfo <Player> character_id
		getplayerinfo <Player> character_savegame
		get_fullname_of_character savegame = <character_savegame> id = <character_id> profanity_allowed
		return fullname = <fullname>
	endif
	getplayerinfo <Player> gamertag
	fullname = ($<gamertag>)
	if (<fullname> = qs(0x00000000))
		getplayerinfo <Player> character_id
		getplayerinfo <Player> character_savegame
		if GotParam \{character_savegame}
			if playerinfoequals <Player> is_local_client = 1
				get_fullname_of_character savegame = <character_savegame> id = <character_id> profanity_allowed
			else
				get_fullname_of_character savegame = <character_savegame> id = <character_id>
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
			setplayerinfo <Player> chosen_character_id = None
			setplayerinfo <Player> chosen_character_savegame = -1
		endif
	endif
endscript

script fix_deleted_character_savegame 
	RequireParams \{[
			savegame
		]
		all}
	if GetGlobalTags savegame = <savegame> band_members noassert = 1
		i = 0
		begin
		get_saved_band_member savegame = <savegame> index = <i>
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
	endif
endscript

script sanity_check_fix_deleted_characters 
	getmaxplayers
	i = 0
	begin
	fix_deleted_character_player_info Player = (<i> + 1)
	i = (<i> + 1)
	repeat <max_players>
	get_num_savegames
	i = 0
	begin
	fix_deleted_character_savegame savegame = <i>
	i = (<i> + 1)
	repeat <num_savegames>
endscript
