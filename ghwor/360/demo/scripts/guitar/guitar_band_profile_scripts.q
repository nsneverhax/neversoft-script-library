
script register_initial_character_profiles \{async = 0}
	getarraysize \{$preset_musician_profiles_ghrockers}
	num_profiles = (<array_size>)
	getarraysize \{$preset_musician_profiles_modifiable}
	num_profiles = (<array_size> + <num_profiles>)
	getarraysize \{$preset_musician_profiles_locked}
	num_profiles = (<array_size> + <num_profiles>)
	getarraysize \{$preset_musician_profiles_debug}
	num_profiles = (<array_size> + <num_profiles>)
	num_profiles = (($max_num_create_a_rockers) + <num_profiles>)
	num_profiles = (($max_temporary_profiles_small) + ($max_temporary_profiles_large) + <num_profiles>)
	if NOT gotparam \{no_reinit}
		characterprofileinit max_profiles = <num_profiles>
	endif
	i = 0
	begin
	formattext checksumname = id_checksum 'custom_character_%d' d = <i> addtostringlookup = true
	characterprofileregister {
		type = saved
		category = cars
		packtype = createarocker
		name = <id_checksum>
		character_id_callback = agora_character_id_callback
	}
	i = (<i> + 1)
	repeat ($max_num_create_a_rockers)
	characterprofileregister \{type = saved
		category = ghrockers
		packtype = presetcars
		profiles = $preset_musician_profiles_ghrockers
		character_id_callback = agora_character_id_callback}
	if isxenon
		characterprofileregister \{type = avatar
			category = modifiable
			packtype = presetcars
			profile = $avatar_profile
			character_id_callback = agora_character_id_callback}
	endif
	characterprofileregister \{type = saved
		category = modifiable
		packtype = presetcars
		profiles = $preset_musician_profiles_modifiable
		character_id_callback = agora_character_id_callback}
	characterprofileregister \{type = constant
		category = locked
		profiles = $preset_musician_profiles_locked
		character_id_callback = agora_character_id_callback}
	characterprofileregister \{type = global_appearance
		category = should_never_list
		profile = {
			$default_temporary_profile
			name = cas_current_appearance
			fullname = qs(0x03ac90f0)
		}
		global_name = cas_current_appearance
		character_id_callback = agora_character_id_callback}
	getmaxplayers
	i = 0
	begin
	formattext checksumname = id_checksum 'temporary_netprofile_%d' d = <i> addtostringlookup = true
	profile = {
		name = <id_checksum>
		fullname = qs(0x03ac90f0)
		appearance = ($empty_appearance)
		($default_temporary_profile)
	}
	characterprofileregister {
		type = temporary
		category = temporary
		profile = <profile>
		packed_type = temporary_profiles_large
		character_id_callback = agora_character_id_callback
	}
	i = (<i> + 1)
	repeat <max_players>
	i = 0
	begin
	formattext checksumname = id_checksum 'temporary_car_%d' d = <i> addtostringlookup = true
	characterprofileregister {
		type = temporary
		category = temporary
		profile = {name = <id_checksum> appearance = {}}
		packed_type = temporary_profiles_large
		character_id_callback = agora_character_id_callback
	}
	formattext checksumname = id_checksum 'temporary_ghrocker_%d' d = <i> addtostringlookup = true
	characterprofileregister {
		type = temporary
		category = temporary
		profile = {name = <id_checksum> appearance = {}}
		packed_type = temporary_profiles_large
		character_id_callback = agora_character_id_callback
	}
	if isxenon
		formattext checksumname = id_checksum 'temporary_avatar_%d' d = <i> addtostringlookup = true
		characterprofileregister {
			type = temporary
			category = temporary
			profile = {name = <id_checksum> appearance = {}}
			packed_type = temporary_profiles_large
			character_id_callback = agora_character_id_callback
		}
	endif
	i = (<i> + 1)
	repeat 4
	if NOT cd
		register_debug_character_profiles
	endif
	characterprofiledump
endscript

script update_temporary_random_car \{slot = !i1768515945
		savegame = !i1768515945}
	formattext checksumname = id_checksum 'temporary_car_%d' d = <slot> addtostringlookup = true
	generate_random_car_profile name = <id_checksum> savegame = <savegame> is_female = <is_female>
	characterprofilesetstruct name = <id_checksum> savegame = <savegame> profile_struct = <profile>
endscript

script update_temporary_random_avatar 
	requireparams \{[
			slot
			savegame
		]
		all}
	formattext checksumname = id_checksum 'temporary_avatar_%d' d = <slot> addtostringlookup = true
	generate_random_avatar_profile name = <id_checksum> savegame = <savegame>
	characterprofilesetstruct name = <id_checksum> savegame = <savegame> profile_struct = <profile>
endscript

script create_initial_temporary_random_cars async = <async>
	randomize
	i = 0
	begin
	update_temporary_random_car slot = <i> savegame = <i>
	if (<async> = 1)
		wait \{1
			gameframe}
	endif
	if isavatarsysteminitialized
		update_temporary_random_avatar slot = <i> savegame = <i>
		if (<async> = 1)
			wait \{1
				gameframe}
		endif
	endif
	i = (<i> + 1)
	repeat 4
endscript

script generate_random_car_profile \{car_flags = {
			new_car_character
			random_instruments
		}}
	requireparams \{[
			name
			savegame
			car_flags
		]
		all}
	if (($cas_current_savegame) != -1)
		scriptassert \{'Dont call this from within create a rocker'}
	endif
	if NOT gotparam \{is_female}
		is_female = Random (@ 0 @ 1 )
	endif
	if (<is_female> = 1)
		profile = ($default_custom_musician_profile_female)
	else
		profile = ($default_custom_musician_profile_male)
	endif
	generate_random_name is_female = <is_female>
	if NOT gotparam \{genre}
		generate_random_genre
	endif
	change cas_current_savegame = <savegame>
	cas_set_random_appearance savegame = <savegame> is_female = <is_female> genre = <genre> used_parts = <used_parts> <car_flags>
	change \{cas_current_savegame = -1}
	profile = {
		<profile>
		name = <name>
		fullname = <random_name>
		appearance = ($cas_current_appearance)
		allowed_parts = [drum vocals guitar bass]
		blurb = qs(0x03ac90f0)
	}
	change \{cas_current_appearance = {
		}}
	return profile = <profile>
endscript

script generate_random_avatar_profile \{genre = pop}
	requireparams \{[
			name
			savegame
		]
		all}
	if (($cas_current_savegame) != -1)
		scriptassert \{'Dont call this from within create a rocker'}
	endif
	if NOT gotparam \{is_female}
		is_female = Random (@ 0 @ 1 )
	endif
	if (<is_female> = 1)
		profile = ($default_custom_musician_profile_female)
	else
		profile = ($default_custom_musician_profile_male)
	endif
	generate_random_name is_female = <is_female>
	get_random_avatar_appearance is_female = <is_female>
	change cas_current_appearance = <appearance>
	change cas_current_savegame = <savegame>
	cas_set_random_avatar_instrument is_female = <is_female> genre = <genre>
	change \{cas_current_savegame = -1}
	profile = {
		<profile>
		name = <name>
		fullname = <random_name>
		appearance = ($cas_current_appearance)
	}
	change \{cas_current_appearance = {
		}}
	return profile = <profile>
endscript

script register_debug_character_profiles 
	characterprofileregister \{type = constant
		category = debug
		profiles = $preset_musician_profiles_debug
		character_id_callback = agora_character_id_callback}
	if isps3
		new_random_debug_car_profile \{fullname = qs(0x6ff7f068)
			name = avatar
			is_female = 0}
		characterprofileregister {
			type = temporary
			category = debug
			profile = {<profile_struct> selection_not_allowed}
			packed_type = temporary_profiles_small
			character_id_callback = agora_character_id_callback
		}
	endif
	i = 1
	begin
	formattext checksumname = name 'RandomAvatar%d' d = <i> addtostringlookup = true
	formattext textname = fullname qs(0x689c63a9) d = <i> addtostringlookup = true
	if isavatarsysteminitialized
		new_random_avatar_profile fullname = <fullname> name = <name>
	else
		new_random_debug_car_profile fullname = <fullname> name = <name> is_female = 0
		profile_struct = {<profile_struct> selection_not_allowed}
	endif
	characterprofileregister {
		type = temporary
		category = debug
		profile = <profile_struct>
		packed_type = temporary_profiles_small
		character_id_callback = agora_character_id_callback
	}
	i = (<i> + 1)
	repeat 4
	new_random_debug_car_profile_set \{is_female = 0}
	new_random_debug_car_profile_set \{is_female = 1}
	change \{cas_current_appearance = {
		}}
endscript

script new_random_debug_car_profile_set 
	used_parts = {}
	i = 1
	begin
	if (<is_female> = 1)
		formattext checksumname = name 'RandomFemale%d' d = <i> addtostringlookup = true
		formattext textname = fullname qs(0xfcd50580) d = <i> addtostringlookup = true
	else
		formattext checksumname = name 'RandomMale%d' d = <i> addtostringlookup = true
		formattext textname = fullname qs(0x72d5f526) d = <i> addtostringlookup = true
	endif
	new_random_debug_car_profile fullname = <fullname> name = <name> is_female = <is_female> used_parts = <used_parts>
	band_builder_get_used_parts_in_appearance appearance = (<profile_struct>.appearance) used_parts = <used_parts>
	characterprofileregister {
		type = temporary
		category = debug
		profile = <profile_struct>
		packed_type = temporary_profiles_small
		character_id_callback = agora_character_id_callback
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
	return profile_struct = <profile>
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
	if retailbuild
		return
	endif
	characterprofilegetlist \{debug_all}
	getarraysize <profile_list>
	i = 0
	begin
	character_id = (<profile_list> [<i>])
	characterprofileunregister name = <character_id>
	i = (<i> + 1)
	repeat <array_size>
	characterprofilegetlist \{debug_all}
	getarraysize <profile_list>
	if (<array_size> != 0)
		scriptassert \{'character profile list is not empty!'}
	endif
	register_initial_character_profiles \{no_reinit}
endscript

script new_custom_character_name 
	requireparams \{[
			savegame
		]
		all}
	i = 0
	begin
	formattext checksumname = id_checksum 'custom_character_%d' d = <i> addtostringlookup = true
	if NOT characterprofileexists savegame = <savegame> name = <id_checksum>
		return new_character_id = <id_checksum>
	endif
	i = (<i> + 1)
	repeat ($max_num_create_a_rockers)
	scriptassert \{'Cannot make a new custom character id. CARs maxxed out?'}
endscript

script profile_can_be_modified 
	requireparams \{[
			id
		]
		all}
	if characterprofilegettype name = <id>
		if ((<profile_type> = saved) || (<profile_type> = avatar))
			return \{true}
		endif
	endif
	return \{false}
endscript

script is_completely_custom_musician 
	requireparams \{[
			id
		]
		all}
	if characterprofilegetcategory name = <id>
		if (<profile_category> = cars)
			return \{true}
		endif
	endif
	return \{false}
endscript

script is_ghrocker 
	requireparams \{[
			id
		]
		all}
	if characterprofilegetcategory name = <id>
		if (<profile_category> = ghrockers)
			return \{true}
		endif
	endif
	return \{false}
endscript

script modify_custom_profile_appearance 
	requireparams \{[
			id
			savegame
			appearance
		]
		all}
	if profile_can_be_modified id = <id>
		characterprofilegetstruct name = <id> savegame = <savegame>
		characterprofilesetstruct name = <id> savegame = <savegame> profile_struct = {<profile_struct> appearance = <appearance>}
	endif
endscript

script modify_custom_profile_fullname 
	requireparams \{[
			id
			savegame
			fullname
		]
		all}
	if is_completely_custom_musician id = <id>
		characterprofilegetstruct name = <id> savegame = <savegame>
		characterprofilesetstruct name = <id> savegame = <savegame> profile_struct = {<profile_struct> fullname = <fullname>}
	endif
endscript

script modify_custom_profile_blurb 
	requireparams \{[
			id
			savegame
			blurb
		]
		all}
	if is_completely_custom_musician id = <id>
		characterprofilegetstruct name = <id> savegame = <savegame>
		characterprofilesetstruct name = <id> savegame = <savegame> profile_struct = {<profile_struct> blurb = <blurb>}
	endif
endscript

script add_new_custom_profile 
	requireparams \{[
			savegame
			profile
		]
		all}
	if is_completely_custom_musician id = (<profile>.name)
		characterprofilesetstruct name = (<profile>.name) savegame = <savegame> profile_struct = <profile>
		getglobaltags savegame = <savegame> custom_character_order
		if arraycontains array = <custom_character_order> contains = (<profile>.name)
			scriptassert '%s already created!' s = (<profile>.name)
		endif
		addarrayelement array = <custom_character_order> element = (<profile>.name)
		setglobaltags savegame = <savegame> custom_character_order params = {custom_character_order = <array>}
	else
		scriptassert '%s is not a custom profile' s = (<profile>.name)
	endif
endscript

script delete_custom_profile 
	requireparams \{[
			savegame
			id
		]
		all}
	if is_completely_custom_musician id = <id>
		characterprofilesetstruct name = <id> savegame = <savegame> delete_profile
		getglobaltags savegame = <savegame> custom_character_order
		if NOT arraycontains array = <custom_character_order> contains = <id>
			scriptassert '%s not found!' s = <id>
		endif
		removearrayelement array = <custom_character_order> element = <id>
		setglobaltags savegame = <savegame> custom_character_order params = {custom_character_order = <array>}
		sanity_check_fix_deleted_characters
	endif
endscript

script restore_custom_musician_parts 
	requireparams \{[
			savegame
			id
		]
		all}
	characterprofilegetstruct name = <id>
	characterprofilesetstruct name = <id> savegame = <savegame> profile_struct = <profile_struct>
endscript

script has_custom_rocker_been_modified 
	requireparams \{[
			savegame
			id
		]
		all}
	characterprofilegetstruct name = <id>
	generatechecksumfromstruct struct = (<profile_struct>.appearance)
	original_checksum = (<structure_checksum>)
	characterprofilegetstruct name = <id> savegame = <savegame>
	generatechecksumfromstruct struct = (<profile_struct>.appearance)
	if (<original_checksum> != <structure_checksum>)
		return \{true}
	endif
	return \{false}
endscript

script get_savegame_from_player 
	requireparams \{[
			player
		]
		all}
	getplayerinfo <player> is_local_client
	if (<is_local_client> = 0)
		scriptassert \{'get_savegame_from_player called on a remote player, please fix this so it isn\'t'}
	endif
	getplayerinfo <player> controller
	get_savegame_from_controller controller = <controller> <...>
	return savegame = <savegame> borrowed_from_band_leader = <borrowed_from_band_leader>
endscript

script get_savegame_from_controller \{controller = !i1768515945}
	getsavegamefromcontroller controller = <controller>
	if isxenonorwindx
		if gotparam \{band_character_select}
			<guest> = 0
			if NOT checkforsignin local controller_index = <controller>
				<guest> = 1
			elseif netsessionfunc func = xenonisguest params = {controller_index = <controller>}
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
	requireparams \{[
			profile_struct
		]
		all}
	if structurecontains structure = <profile_struct> selection_not_allowed
		return \{false}
	else
		return \{true}
	endif
endscript

script is_allowed_part 
	if ((<part> = bass) || (<part> = guitar) || (<part> = drum) || (<part> = vocals))
		if structurecontains structure = <profile_struct> allowed_parts
			i = 0
			getarraysize (<profile_struct>.allowed_parts)
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
	scriptassert 'is_allowed_part - %d unrecognized' d = <part>
endscript

script modify_net_appearance 
	requireparams \{[
			index
			appearance
			fullname
		]
		all}
	if ((<index> < 0) || (<index> > 7))
		scriptassert \{'Out of range'}
	endif
	formattext checksumname = id_checksum 'temporary_netprofile_%d' d = <index> addtostringlookup = true
	characterprofilesetstruct name = <id_checksum> savegame = -1 profile_struct = {
		($default_temporary_profile)
		name = <id_checksum>
		fullname = <fullname>
		appearance = <appearance>
	}
endscript

script fill_local_appearance_data 
	printf \{qs(0xf06dd408)}
	printstruct <...>
	adcplayerdump
	if playerinfoequals <player_number> is_local_client = 1
		printf qs(0xef9e522a) d = <player_number>
		formattext textname = msgtext 'fill_local_appearance_data: Player %d is a local player, yay' d = <player_number> dontassertforchecksums
		appearancedatacompressor func = logmessage msg = <msgtext>
		getplayerinfo <player_number> character_id out = my_character_id
		getplayerinfo <player_number> character_savegame
		if NOT characterprofilegetstruct name = <my_character_id> savegame = <character_savegame> dont_assert
			scriptassert '%s not found in savegame %d' s = <my_character_id> d = <character_savegame>
		endif
		get_fullname_of_character id = <my_character_id> savegame = <character_savegame>
		return character_id = <my_character_id> appearance = {(<profile_struct>.appearance) fullname = <fullname> old_character_id = <id>}
	else
		printf qs(0x72d88c47) d = <player_number>
		formattext textname = msgtext 'fill_local_appearance_data: PLAYER %d IS NOT A LOCAL PLAYER!!!!!' d = <player_number> dontassertforchecksums
		appearancedatacompressor func = logmessage msg = <msgtext>
		return
	endif
endscript

script dump_player_info 
	getplayerinfo <player> controller
	getplayerinfo <player> character_id
	getplayerinfo <player> is_local_client
	printstruct {player = <player> controller = <controller> character_id = <character_id> is_local_client = <is_local_client>}
endscript

script start_song_got_net_appearance 
	printf 'start_song_got_net_appearance %d' d = <netplayer>
	gamemode_gettype
	if NOT (<type> = career)
		if (<netplayer> > 1)
			if (<netplayer> < 5)
				appearance_num = <netplayer>
				formattext checksumname = netappearance_id 'temporary_netprofile_%d' d = (<appearance_num> -1)
				if gotparam \{userandomplayer}
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
				set_chosen_character_id player = <netplayer> id = none
				persistent_band_refresh_changed_characters
			endif
		endif
	endif
endscript

script is_profile_unlocked \{profile_struct = 0x69696969
		savegame = !i1768515945}
	if NOT structurecontains structure = <profile_struct> locked
		return \{true}
	else
		getglobaltags unlocked_profiles savegame = <savegame>
		if NOT gotparam \{unlocked_profiles}
			return \{false}
		else
			if arraycontains array = <unlocked_profiles> contains = (<profile_struct>.name)
				return \{true}
			else
				return \{false}
			endif
		endif
	endif
endscript

script unlock_profile \{id = !q1768515945
		savegame = !i1768515945}
	profile_unlocked = 0
	if console_is_net_career_client
		<unlocked_profiles> = ($g_net_career_progression.unlocked_profiles)
		if NOT arraycontains array = <unlocked_profiles> contains = <id>
			addarrayelement array = <unlocked_profiles> element = <id>
			updatestructelement struct = g_net_career_progression element = unlocked_profiles value = <unlocked_profiles>
			profile_unlocked = 1
		endif
	endif
	profile_struct = {}
	characterprofilegetstruct name = <id> savegame = <savegame>
	if NOT structurecontains structure = <profile_struct> locked
		return \{false}
	else
		getglobaltags unlocked_profiles savegame = <savegame>
		if NOT gotparam \{unlocked_profiles}
			addarrayelement array = [] element = <id>
			setglobaltags unlocked_profiles params = {unlocked_profiles = <array>} savegame = <savegame>
			profile_unlocked = 1
		else
			if NOT arraycontains array = <unlocked_profiles> contains = <id>
				addarrayelement array = <unlocked_profiles> element = <id>
				setglobaltags unlocked_profiles params = {unlocked_profiles = <array>} savegame = <savegame>
				profile_unlocked = 1
			endif
		endif
	endif
	if (<profile_unlocked> = 1)
		return \{true}
	endif
	return \{false}
endscript

script unlock_all_profiles 
	characterprofilegetlist savegame = <savegame>
	getarraysize <profile_list>
	if (<array_size> > 0)
		i = 0
		begin
		unlock_profile id = (<profile_list> [<i>]) savegame = <savegame>
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script get_fullname_of_character 
	requireparams \{[
			id
			savegame
		]
		all}
	if (<id> = avatar)
		return \{fullname = qs(0xc6da5330)}
	endif
	fullname = qs(0x4b7ca92c)
	if characterprofilegetstruct name = <id> savegame = <savegame> dont_assert
		if structurecontains structure = <profile_struct> fullname
			fullname = (<profile_struct>.fullname)
		endif
	endif
	if characterprofilegetcategory name = <id> savegame = <savegame>
		switch (<profile_category>)
			case ghrockers
			case modifiable
			case locked
			case debug
			return fullname = <fullname>
		endswitch
	endif
	if NOT gotparam \{profanity_allowed}
		if gotparam \{fullname}
			if NOT isacceptablestring string = <fullname>
				removeparameter \{fullname}
			endif
		endif
	endif
	if NOT gotparam \{fullname}
		fullname = qs(0x241086be)
	endif
	return fullname = <fullname>
endscript

script get_fullname_for_player 
	getplayerinfo <player> gamertag
	fullname = ($<gamertag>)
	if playerinfoequals <player> is_local_client = 1
		getplayerinfo <player> controller
		if (<controller> < 4)
			if netsessionfunc func = iscontrolleringame params = {controller = <controller>}
				netsessionfunc \{func = update_gamertag}
				if netsessionfunc obj = match func = get_gamertag params = {controller = <controller>}
					change globalname = <gamertag> newvalue = <name>
				endif
			endif
			if isps3
				netsessionfunc func = get_user_id params = {controller_index = <controller>}
				setplayerinfo <player> net_id_first = (<user_id> [0])
				setplayerinfo <player> net_id_second = (<user_id> [1])
			endif
		endif
	endif
	fullname = ($<gamertag>)
	if (<fullname> = qs(0x00000000))
		getplayerinfo <player> character_id
		getplayerinfo <player> character_savegame
		<use_character_names> = 1
		if gotparam \{no_character_names}
			<use_character_names> = 0
		endif
		if ((gotparam character_savegame) && (<use_character_names> = 1))
			if gotparam \{no_character_name}
				getplayerinfo <player> controller
				formattext textname = fullname qs(0x72f23aff) d = (<controller> + 1)
			else
				if playerinfoequals <player> is_local_client = 1
					get_fullname_of_character savegame = <character_savegame> id = <character_id> profanity_allowed
				else
					get_fullname_of_character savegame = <character_savegame> id = <character_id>
				endif
			endif
		else
			getplayerinfo <player> controller
			formattext textname = fullname qs(0x72f23aff) d = (<controller> + 1)
		endif
	endif
	return fullname = <fullname>
endscript

script is_band_member_invalid \{character_id = !q1768515945
		character_savegame = !i1768515945}
	if characterprofileexists name = <character_id> savegame = <character_savegame>
		characterprofilegetstruct savegame = <character_savegame> name = <character_id>
		if (<character_savegame> = -1)
			if NOT structurecontains structure = <profile_struct> locked
				return \{false}
			endif
		else
			if is_profile_unlocked savegame = <character_savegame> profile_struct = <profile_struct>
				return \{false}
			endif
		endif
	endif
	return \{true}
endscript

script fix_deleted_character_player_info \{player = !i1768515945}
	getplayerinfo <player> character_id
	getplayerinfo <player> character_savegame
	if is_band_member_invalid character_id = <character_id> character_savegame = <character_savegame>
		printf 'fix_deleted_character_player_info - fixing playerinfo %a: %b savegame:%c' a = <player> b = <character_id> c = <character_savegame>
		cas_get_random_ghrocker savegame = <character_savegame>
		setplayerinfo <player> character_id = <character_id>
		setplayerinfo <player> character_savegame = <character_savegame>
	endif
	getplayerinfo <player> chosen_character_id
	if (<chosen_character_id> != none)
		getplayerinfo <player> chosen_character_savegame
		if is_band_member_invalid character_id = <chosen_character_id> character_savegame = <chosen_character_savegame>
			printf 'fix_deleted_character_player_info - fixing chosen-playerinfo %a: %b savegame:%c' a = <player> b = <chosen_character_savegame> c = <chosen_character_savegame>
			set_chosen_character_id player = <player> id = none
		endif
	endif
endscript

script fix_deleted_character_savegame \{savegame = !i1768515945}
	printf 'fix_deleted_character_savegame %s' s = <savegame>
	if getglobaltags savegame = <savegame> band_members noassert = 1
		i = 0
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
	fix_deleted_character_player_info player = (<i> + 1)
	i = (<i> + 1)
	repeat <max_players>
endscript

script safe_update_band_characters 
	sanity_check_fix_deleted_characters
	persistent_band_refresh_changed_characters
endscript

script has_singing_guitarist 
	if NOT globalexists name = <band>
		return \{false}
	endif
	guitarist = ($<band>.guitarist)
	vocalist = ($<band>.vocalist)
	if (<guitarist> = savedbandmember)
		return \{false}
	endif
	if (<vocalist> = savedbandmember)
		return \{false}
	endif
	printf channel = band qs(0x6dd4ecb7) a = <guitarist> b = <vocalist>
	if (<guitarist> != <vocalist>)
		return \{false}
	endif
	return \{true}
endscript

script has_singing_bassist 
	if NOT globalexists name = <band>
		return \{false}
	endif
	bassist = ($<band>.bassist)
	vocalist = ($<band>.vocalist)
	if (<bassist> = savedbandmember)
		return \{false}
	endif
	if (<vocalist> = savedbandmember)
		return \{false}
	endif
	printf channel = band qs(0xa1168bf9) a = <bassist> b = <vocalist>
	if (<bassist> != <vocalist>)
		return \{false}
	endif
	return \{true}
endscript

script is_standard_band_setup 
	gamemode_gettype
	if (<type> = freeplay || $in_sing_a_long = true)
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
	player = (<player_infos_in_use> [<i>])
	getplayerinfo <player> part
	if (<part> = <check_part>)
		if (<found> [<part_index>] = 1)
			return \{false}
		endif
		setarrayelement arrayname = found index = <part_index> newvalue = 1
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
			return \{band = worst_male_band}
		else
			return \{band = worst_female_band}
		endif
	endif
	if ($jam_mode_band = 1)
		return \{band = jam_mode_band_profiles}
	endif
	if NOT gotparam \{song}
		playlist_getcurrentsong
		song = <current_song>
	endif
	get_band_configuration song = <song>
	return band = <band>
endscript

script get_band_configuration 
	if NOT gotparam \{skip_dlc_check}
		if structurecontains structure = $download_songlist_props <song>
			return \{band = default_band}
		endif
	endif
	get_song_struct song = <song>
	if structurecontains structure = <song_struct> band
		return band = (<song_struct>.band)
	else
		return \{band = default_band}
	endif
endscript

script set_chosen_character_id \{savegame = -1}
	requireparams \{[
			player
			id
			savegame
		]
		all}
	store_flag = {store}
	if gotparam \{no_store}
		store_flag = {}
	endif
	printf 'set_chosen_character_id player=%p id=%i savegame=%s' p = <player> i = <id> s = <savegame>
	setplayerinfo <player> chosen_character_id = <id> <store_flag>
	setplayerinfo <player> chosen_character_savegame = <savegame> <store_flag>
endscript

script fix_profile_struct_for_career \{profile_struct = 0x69696969}
	if NOT bl_is_in_band_lobby_menus
		gamemode_gettype
		if (<type> = career)
			get_savegame_from_controller controller = ($primary_controller)
			if quest_progression_check_domination_unlocked savegame = <savegame>
				appearance = (<profile_struct>.appearance)
				if check_cas_item_unlocked_flag part = cas_full_guitar desc_id = gtr137_demi savegame = <savegame>
					remove_instrument_from_appearance appearance = <appearance> instrument = guitar
					addparam \{structure_name = appearance
						name = cas_full_guitar
						value = {
							desc_id = gtr137_demi
						}}
				endif
				if check_cas_item_unlocked_flag part = cas_full_bass desc_id = bass137_demi savegame = <savegame>
					remove_instrument_from_appearance appearance = <appearance> instrument = bass
					addparam \{structure_name = appearance
						name = cas_full_bass
						value = {
							desc_id = bass137_demi
						}}
				endif
				addparam structure_name = profile_struct name = appearance value = <appearance>
				<appearance> = {}
				return true profile_struct = <profile_struct>
			endif
		endif
	endif
	return \{false}
endscript

script remove_instrument_from_appearance \{instrument = !q1768515945
		appearance = 0x69696969}
	array = ($instrument_part_sets.<instrument>)
	getarraysize <array>
	<i> = 0
	begin
	part = (<array> [<i>])
	removeparameter struct_name = appearance <part>
	<i> = (<i> + 1)
	repeat <array_size>
	return appearance = <appearance>
endscript
