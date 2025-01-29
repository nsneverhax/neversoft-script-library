
script get_musician_profile_size 
	RequireParams \{[
			savegame
		]
		all}
	size = 0
	if GotParam \{borrowed_from_band_leader}
		globaltag_getarraysize savegame = <borrowed_from_band_leader> array_name = custom_profiles
		size = (<array_Size> + <size>)
	endif
	globaltag_getarraysize savegame = <savegame> array_name = custom_profiles
	size = (<array_Size> + <size>)
	GetArraySize \{$preset_musician_profiles_modifiable}
	size = (<array_Size> + <size>)
	GetArraySize \{$preset_musician_profiles_locked}
	size = (<array_Size> + <size>)
	GetArraySize \{$net_musician_profiles}
	size = (<array_Size> + <size>)
	return array_Size = <size>
endscript

script get_musician_profile_struct_by_index 
	RequireParams \{[
			index
			savegame
		]
		all}
	if GotParam \{borrowed_from_band_leader}
		globaltag_getarraysize savegame = <borrowed_from_band_leader> array_name = custom_profiles
		if (<index> < <array_Size>)
			globaltag_getarrayelement savegame = <borrowed_from_band_leader> array_name = custom_profiles index = <index>
			return profile_struct = <element> character_savegame = <borrowed_from_band_leader>
		endif
		index = (<index> - <array_Size>)
	endif
	globaltag_getarraysize savegame = <savegame> array_name = custom_profiles
	if (<index> < <array_Size>)
		globaltag_getarrayelement savegame = <savegame> array_name = custom_profiles index = <index>
		profile_struct = <element>
	else
		index = (<index> - <array_Size>)
		GetArraySize \{$preset_musician_profiles_modifiable}
		if (<index> < <array_Size>)
			profile_struct = ($preset_musician_profiles_modifiable [<index>])
			globaltag_get_preset_musician savegame = <savegame> profile_struct = <profile_struct> index = <index>
		else
			index = (<index> - <array_Size>)
			GetArraySize \{$preset_musician_profiles_locked}
			if (<index> < <array_Size>)
				profile_struct = ($preset_musician_profiles_locked [<index>])
				resolve_random_appearance profile_struct = <profile_struct>
			else
				index = (<index> - <array_Size>)
				GetArraySize \{$net_musician_profiles}
				if (<index> < <array_Size>)
					profile_struct = ($net_musician_profiles [<index>])
				else
					ScriptAssert \{'profile index out of bounds'}
				endif
			endif
		endif
	endif
	if NOT StructureContains structure = <profile_struct> appearance
		ScriptAssert \{'All profiles require an appearance'}
	endif
	if NOT StructureContains structure = <profile_struct> Name
		ScriptAssert \{'All profiles require a name'}
	endif
	return profile_struct = <profile_struct> character_savegame = <savegame>
endscript

script get_musician_profile_struct_by_id 
	RequireParams \{[
			id
			savegame
		]
		all}
	if searchmusicianprofilearray array_name = preset_musician_profiles_locked id = <id>
		profile_struct = ($preset_musician_profiles_locked [<index>])
		resolve_random_appearance profile_struct = <profile_struct>
		return true profile_struct = <profile_struct>
	endif
	if searchmusicianprofilearray array_name = net_musician_profiles id = <id>
		return true profile_struct = ($net_musician_profiles [<index>])
	endif
	if searchmusicianprofilearray array_name = preset_musician_profiles_modifiable id = <id>
		globaltag_get_preset_musician savegame = <savegame> profile_struct = ($preset_musician_profiles_modifiable [<index>]) index = <index>
		return true profile_struct = <profile_struct>
	endif
	globaltag_getarraysize savegame = <savegame> array_name = custom_profiles
	i = 0
	if (<array_Size> > 0)
		begin
		globaltag_getarrayelement savegame = <savegame> array_name = custom_profiles index = <i>
		if (<id> = (<element>.Name))
			return true profile_struct = <element>
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	if NOT GotParam \{dont_assert}
		ScriptAssert 'Profile %d not found' d = <id>
	endif
	return \{FALSE}
endscript

script profile_exists 
	RequireParams \{[
			id
			savegame
		]
		all}
	if searchmusicianprofilearray array_name = preset_musician_profiles_locked id = <id>
		return \{true}
	endif
	if searchmusicianprofilearray array_name = net_musician_profiles id = <id>
		return \{true}
	endif
	if searchmusicianprofilearray array_name = preset_musician_profiles_modifiable id = <id>
		return \{true}
	endif
	globaltag_getarraysize savegame = <savegame> array_name = custom_profiles
	i = 0
	if (<array_Size> > 0)
		begin
		globaltag_getarrayelement savegame = <savegame> array_name = custom_profiles index = <i>
		if (<id> = (<element>.Name))
			return \{true}
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	return \{FALSE}
endscript

script new_custom_character_name 
	RequireParams \{[
			savegame
		]
		all}
	i = 0
	begin
	formatText checksumName = id_checksum 'custom_character_%d' d = <i> AddToStringLookup = true
	if NOT is_completely_custom_musician id = <id_checksum> savegame = <savegame>
		return new_character_id = <id_checksum>
	endif
	i = (<i> + 1)
	repeat 100
	ScriptAssert \{'Cannot make a new custom character id'}
endscript

script profile_can_be_modified 
	RequireParams \{[
			id
			savegame
		]
		all}
	if GotParam \{require_purchased}
		if NOT is_profile_purchased id = <id> savegame = <savegame>
			return \{FALSE}
		endif
	endif
	if searchmusicianprofilearray array_name = preset_musician_profiles_modifiable id = <id>
		return \{true}
	endif
	if is_completely_custom_musician id = <id> savegame = <savegame>
		return \{true}
	endif
	return \{FALSE}
endscript

script is_completely_custom_musician 
	RequireParams \{[
			id
			savegame
		]
		all}
	globaltag_getarraysize savegame = <savegame> array_name = custom_profiles
	i = 0
	if (<array_Size> > 0)
		begin
		globaltag_getarrayelement savegame = <savegame> array_name = custom_profiles index = <i>
		if (<id> = (<element>.Name))
			return true custom_musician_index = <i>
		endif
		i = (<i> + 1)
		repeat <array_Size>
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
	if is_completely_custom_musician id = <id> savegame = <savegame>
		globaltag_getarrayelement savegame = <savegame> array_name = custom_profiles index = <custom_musician_index>
		globaltag_setarrayelement savegame = <savegame> array_name = custom_profiles index = <custom_musician_index> element = {
			<element>
			appearance = <appearance>
		}
	elseif searchmusicianprofilearray array_name = preset_musician_profiles_modifiable id = <id>
		globaltag_set_preset_musician savegame = <savegame> appearance = <appearance> index = <index>
	endif
endscript

script modify_custom_profile_fullname 
	RequireParams \{[
			id
			savegame
			fullname
		]
		all}
	if is_completely_custom_musician id = <id> savegame = <savegame>
		globaltag_getarrayelement savegame = <savegame> array_name = custom_profiles index = <custom_musician_index>
		globaltag_setarrayelement savegame = <savegame> array_name = custom_profiles index = <custom_musician_index> element = {
			<element>
			fullname = <fullname>
		}
	endif
endscript

script modify_custom_profile_blurb 
	RequireParams \{[
			id
			savegame
			blurb
		]
		all}
	if is_completely_custom_musician id = <id> savegame = <savegame>
		globaltag_getarrayelement savegame = <savegame> array_name = custom_profiles index = <custom_musician_index>
		globaltag_setarrayelement savegame = <savegame> array_name = custom_profiles index = <custom_musician_index> element = {
			<element>
			blurb = <blurb>
		}
	endif
endscript

script add_new_custom_profile 
	RequireParams \{[
			savegame
			Profile
		]
		all}
	globaltag_addarrayelement savegame = <savegame> array_name = custom_profiles element = <Profile>
endscript

script delete_custom_profile 
	RequireParams \{[
			savegame
			id
		]
		all}
	if is_completely_custom_musician id = <id> savegame = <savegame>
		globaltag_removearrayelement savegame = <savegame> array_name = custom_profiles index = <custom_musician_index>
	endif
endscript

script restore_custom_musician_parts 
	RequireParams \{[
			savegame
			id
		]
		all}
	if searchmusicianprofilearray array_name = preset_musician_profiles_modifiable id = <id>
		globaltag_set_preset_musician savegame = <savegame> index = <index> appearance = ($preset_musician_profiles_modifiable [<index>].appearance)
	endif
endscript

script get_savegame_from_player_status 
	get_savegame_from_controller controller = ($<player_status>.controller) <...>
	return savegame = <savegame> borrowed_from_band_leader = <borrowed_from_band_leader>
endscript

script get_savegame_from_controller 
	getsavegamefromcontroller controller = <controller>
	if isXenon
		if GotParam \{band_character_select}
			if NOT CheckForSignIn local controller_index = <controller>
				guest = 1
			elseif NetSessionFunc func = xenonisguest params = {controller_index = <controller>}
				guest = 1
			endif
			if GotParam \{guest}
				if ($is_network_game = 0)
					leader_index = ($band_mode_current_leader)
				else
					leader_index = ($primary_controller)
				endif
				if ((<leader_index> != -1) && (<leader_index> != <controller>))
					getsavegamefromcontroller controller = <controller>
					borrowed_from_band_leader = <savegame>
					if NOT GotParam \{allow_guest_savegame}
						getsavegamefromcontroller controller = <leader_index>
					endif
				endif
			endif
		endif
	endif
	return savegame = <savegame> borrowed_from_band_leader = <borrowed_from_band_leader>
endscript

script resolve_random_appearance 
	RequireParams \{[
			profile_struct
		]
		all}
	if StructureContains structure = <profile_struct> random_appearance_lookup
		band_builder_get_random_appearance character_id = (<profile_struct>.Name)
		profile_struct = {
			<profile_struct>
			appearance = <appearance>
		}
	endif
	return profile_struct = <profile_struct>
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
		return \{FALSE}
	endif
	ScriptAssert 'is_allowed_part - %d unrecognized' d = <part>
endscript

script modify_net_appearance 
	if ((<Player> < 1) || (<Player> > 4))
		ScriptAssert \{'Out of range'}
	endif
	index = (<Player> - 1)
	new_entry = {(($net_musician_profiles) [<index>]) appearance = <appearance> fullname = <fullname>}
	SetArrayElement ArrayName = net_musician_profiles globalarray index = <index> NewValue = <new_entry>
endscript

script fill_local_appearance_data 
	printf \{qs(0xf06dd408)}
	printstruct <...>
	formatText checksumName = player_status 'player%p_status' p = <player_number>
	if ($<player_status>.is_local_client = 1)
		my_character_id = ($<player_status>.character_id)
		get_savegame_from_player_status player_status = <player_status>
		if isXenon
			get_fullname_of_character id = <my_character_id> savegame = <savegame>
		else
			if get_musician_profile_struct_by_id id = <my_character_id> savegame = <savegame> dont_assert
				if StructureContains structure = <profile_struct> fullname
					fullname = (<profile_struct>.fullname)
				endif
			endif
			if searchmusicianprofilearray array_name = preset_musician_profiles_locked id = <my_character_id>
				printf qs(0x5ec068d6) , d = <player_number> c = <fullname>
			elseif searchmusicianprofilearray array_name = preset_musician_profiles_modifiable id = <my_character_id>
				printf qs(0x5ec068d6) , d = <player_number> c = <fullname>
			else
				fullname = qs(0x241086be)
			endif
		endif
		if NOT get_musician_profile_struct_by_id id = <my_character_id> savegame = <savegame> dont_assert
			printstruct ($guest_character_names)
			printstruct ($guest_character_fullnames)
			printstruct ($current_num_players)
			if isXenon
				isave = 0
				begin
				globaltag_getarraysize savegame = <isave> array_name = custom_profiles
				printf 'Num custom profiles in savegame %s = %p' s = <isave> p = <array_Size>
				isave = (<isave> + 1)
				repeat 4
			else
				globaltag_getarraysize savegame = <savegame> array_name = custom_profiles
				printf 'Num custom profiles in savegame %s = %p' s = <savegame> p = <array_Size>
			endif
			borrowed_from_band_leader = 666
			get_savegame_from_player_status band_character_select player_status = <player_status>
			printf 'band_character savegames %s borrowed = %b' s = <savegame> b = <borrowed_from_band_leader>
			dump_player_status \{struct = player1_status}
			dump_player_status \{struct = player2_status}
			dump_player_status \{struct = player3_status}
			dump_player_status \{struct = player4_status}
			dump_player_status \{struct = player5_status}
			dump_player_status \{struct = player6_status}
			dump_player_status \{struct = player7_status}
			dump_player_status \{struct = player8_status}
			ScriptAssert '%s not found in savegame %d' s = <my_character_id> d = <savegame>
			Change structurename = <player_status> character_id = Judy
			get_musician_profile_struct_by_id id = Judy savegame = <savegame>
			my_character_id = Judy
			id = Judy
		endif
		resolve_guest_character_id id = <my_character_id>
		if (($<player_status>.part = drum) || ($<player_status>.part = vocals))
			printf \{qs(0x3d7c0aa6)}
		endif
		return character_id = <my_character_id> appearance = {(<profile_struct>.appearance) fullname = <fullname> old_character_id = <id>}
	endif
endscript

script dump_player_status 
	printstruct {Player = <struct> controller = ($<struct>.controller) character_id = ($<struct>.character_id) is_local_client = ($<struct>.is_local_client)}
endscript

script start_song_got_net_appearance 
	printf 'start_song_got_net_appearance %d' d = <netplayer>
	if (<netplayer> > 1)
		if (<netplayer> < 5)
			formatText checksumName = player_status 'player%p_status' p = <netplayer>
			appearance_num = <netplayer>
			formatText checksumName = netappearance_id 'netappearance%d' d = <appearance_num>
			if GotParam \{userandomplayer}
				get_savegame_from_controller controller = ($primary_controller)
				cas_get_random_preset_character savegame = <savegame> part = ($<player_status>.part)
				Change structurename = <player_status> character_id = <character_id>
			else
				Change structurename = <player_status> character_id = <netappearance_id>
				modify_net_appearance Player = <appearance_num> appearance = <appearance> fullname = (<appearance>.fullname)
			endif
			ui_event_get_top
			can_continue = 0
			if (<base_name> = 'band_mode')
				can_continue = 1
			elseif (<base_name> = 'net_career_join_popup')
				can_continue = 1
			endif
			if is_current_state_band_mode
				formatText checksumName = player_status 'player%p_status' p = <netplayer>
				get_savegame_from_player_status player_status = <player_status>
				if (<can_continue> = 1)
					if ScreenElementExists \{id = myinterfaceelement}
						myinterfaceelement :GetSingleTag \{menus}
						(<menus> [(<netplayer> - 1)]) :obj_spawnscript ui_band_mode_update_menu
					endif
					cas_queue_new_character_profile Player = <netplayer> id = ($<player_status>.character_id) savegame = <savegame>
				endif
			endif
		endif
	endif
endscript

script check_for_dupe_profiles \{savegame = 0}
	if CD
		return
	endif
	get_musician_profile_size savegame = <savegame>
	i = 0
	begin
	get_musician_profile_struct_by_index index = <i> savegame = <savegame>
	iname = (<profile_struct>.Name)
	if NOT ischecksum <iname>
		ScriptAssert \{'Profile names should be checksums now'}
	endif
	j = 0
	begin
	if NOT (<i> = <j>)
		get_musician_profile_struct_by_index index = <j> savegame = <savegame>
		jname = (<profile_struct>.Name)
		if (<iname> = <jname>)
			ScriptAssert 'Profile name %s appears twice!' s = <iname>
		endif
	endif
	j = (<j> + 1)
	repeat <array_Size>
	i = (<i> + 1)
	repeat <array_Size>
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
		get_current_band_info
		GetGlobalTags <band_info> savegame = <savegame>
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
	get_musician_profile_struct_by_id id = <id> savegame = <savegame>
	if NOT StructureContains structure = <profile_struct> locked
		return
	else
		get_current_band_info
		GetGlobalTags <band_info> savegame = <savegame>
		if NOT GotParam \{unlocked_profiles}
			AddArrayElement array = [] element = <id>
			lockglobaltags \{OFF}
			SetGlobalTags <band_info> params = {unlocked_profiles = <array>} savegame = <savegame>
			lockglobaltags
		else
			if NOT ArrayContains array = <unlocked_profiles> contains = <id>
				AddArrayElement array = <unlocked_profiles> element = <id>
				lockglobaltags \{OFF}
				SetGlobalTags <band_info> params = {unlocked_profiles = <array>} savegame = <savegame>
				lockglobaltags
			endif
		endif
	endif
endscript

script unlock_all_profiles 
	get_savegame_from_controller controller = ($primary_controller)
	get_musician_profile_size savegame = <savegame>
	i = 0
	begin
	get_musician_profile_struct_by_index index = <i> savegame = <savegame>
	this_ID = (<profile_struct>.Name)
	if NOT checksumequals a = <this_ID> b = jimi
		unlock_profile id = <this_ID> savegame = <savegame>
	endif
	i = (<i> + 1)
	repeat <array_Size>
endscript

script is_profile_purchased 
	RequireParams \{[
			id
			savegame
		]
		all}
	if GotParam \{borrowed_from_band_leader}
		<savegame> = <borrowed_from_band_leader>
	endif
	get_musician_profile_struct_by_id id = <id> savegame = <savegame>
	if NOT StructureContains structure = <profile_struct> price
		return \{true}
	else
		get_current_band_info
		GetGlobalTags <band_info> savegame = <savegame>
		if NOT GotParam \{purchased_profiles}
			return \{FALSE}
		else
			if ArrayContains array = <purchased_profiles> contains = <id>
				return \{true}
			else
				return \{FALSE}
			endif
		endif
	endif
endscript

script purchase_profile 
	RequireParams \{[
			id
			savegame
		]
		all}
	get_musician_profile_struct_by_id id = <id> savegame = <savegame>
	if NOT StructureContains structure = <profile_struct> price
		return
	else
		get_current_band_info
		GetGlobalTags <band_info> savegame = <savegame>
		if NOT GotParam \{purchased_profiles}
			AddArrayElement array = [] element = <id>
			SetGlobalTags <band_info> params = {purchased_profiles = <array>} savegame = <savegame>
		else
			if NOT ArrayContains array = <purchased_profiles> contains = <id>
				AddArrayElement array = <purchased_profiles> element = <id>
				SetGlobalTags <band_info> params = {purchased_profiles = <array>} savegame = <savegame>
			endif
		endif
	endif
endscript

script purchase_all_profiles 
	get_savegame_from_controller controller = ($primary_controller)
	get_musician_profile_size savegame = <savegame>
	i = 0
	begin
	get_musician_profile_struct_by_index index = <i> savegame = <savegame>
	this_ID = (<profile_struct>.Name)
	purchase_profile id = <this_ID> savegame = <savegame>
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
	if band_builder_is_finalized_random character_id = <id>
		if StructureContains structure = ($guest_character_fullnames) <id>
			fullname = (($guest_character_fullnames).<id>)
		endif
	elseif get_musician_profile_struct_by_id id = <id> savegame = <savegame> dont_assert
		if StructureContains structure = <profile_struct> fullname
			fullname = (<profile_struct>.fullname)
		endif
	endif
	if searchmusicianprofilearray array_name = preset_musician_profiles_locked id = <id>
		return fullname = <fullname>
	endif
	if searchmusicianprofilearray array_name = preset_musician_profiles_modifiable id = <id>
		return fullname = <fullname>
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

script resolve_guest_character_id 
	RequireParams \{[
			id
		]
		all}
	if band_builder_is_finalized_random character_id = <id>
		if StructureContains structure = ($guest_character_names) <id>
			return id = (($guest_character_names).<id>)
		endif
	endif
	return id = <id>
endscript

script debug_add_worst_case_cas_chars 
endscript
