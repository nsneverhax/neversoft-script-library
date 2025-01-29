
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
					getsavegamefromcontroller controller = <leader_index>
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
		get_musician_profile_struct_by_id id = <my_character_id> savegame = <savegame>
		resolve_guest_character_id id = <my_character_id>
		if (($<player_status>.part = drum) || ($<player_status>.part = vocals))
			printf \{qs(0x3d7c0aa6)}
		endif
		return character_id = <my_character_id> appearance = {(<profile_struct>.appearance) fullname = <fullname> old_character_id = <id>}
	endif
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
	get_savegame_from_controller controller = ($primary_controller)
	i = 0
	begin
	new_custom_character_name savegame = <savegame>
	formatText TextName = fullname qs(0xfd63420c) i = (<i> + 1)
	Profile = {
		<Profile>
		Name = <new_character_id>
		fullname = <fullname>
		allowed_parts = [drum vocals guitar bass]
		appearance = {
			genre = `black	metal`
			cas_body = {desc_id = gh4_car_male
				bones = {headsize = 1.0 facefullness = 1.0 jawscale = 1.0 chinsize = 1.0 chinwidth = 1.0 cheekboneshape = 1.0 earangle = 1.0 eartip = 1.0 nosesize = 1.0 nosetip = 1.0 nosewidth = 1.0 noseangle = 0.0 nosedepth = 1.0 noseposition = 1.0 nosebridge = 1.0 nosebroken = 1.0 mouthscale = 1.0 mouthangle = 1.0 mouthdepth = 1.0 mouthposition = 1.0 lipshape = 1.0 upperlipthickness = 1.0 lowerlipthickness = 1.0 eyeangle = 1.0 eyeshape = 1.0 eyeposition = -1.0 eyedepth = 1.0 eyescale = 1.0 eyedistance = 1.0 eyebrowsize = 1.0 eyebrowangle = 1.0 eyebrowdistance = 1.0 browposition = 1.0 browdepth = 1.0 eyebrowshape = 1.0}
				chosen_materials = {skin = purple_blue_1}
				cap = [{base_tex = `tex/models/characters/global/global_blank_head_dnc.dds` material = car_male_head cas_1
						layers = [{texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001.img` a = 85 x_trans = 31 y_trans = 16 x_skew = 75 y_skew = -24 x_scale = 16 y_scale = 53 rot = 5983 flags = 27 Color = black_1guitar}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapeoutline_001.img` a = 60 x_trans = -45 y_trans = 11 x_skew = -51 y_skew = 24 x_scale = 121 y_scale = 30 rot = 930 flags = 27 Color = yellow_1guitar}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_001.img` x_trans = -15 y_trans = -51 x_skew = 24 y_skew = -21 x_scale = 15 y_scale = 22 rot = 4513 flags = 27 Color = yellow_orange_1}
							{texture = `tex/models/characters/skater_male/decals/cag_icon001.img` Color = orange_1 a = 75 y_trans = -27 x_skew = 18 y_skew = 18 x_scale = 25 y_scale = 150 rot = 510 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_icon_creature001.img` Color = red_orange_1 x_trans = -40 y_trans = 19 x_skew = -27 y_skew = -21 x_scale = 149 y_scale = 149 rot = 360 flags = 3}
							{texture = `tex/models/characters/skater_male/decals/cag_graphics_zombieface.img` x_trans = 20 x_scale = 30 flags = 3 y_scale = 149}
							{texture = `tex/models/characters/skater_male/decals/cag_sponsors_amoeba_01.img` x_scale = 30 y_scale = 30 flags = 3 x_trans = -23}
							{font = fontgrid_title_a1 text = 'A' Color = violet_1 x_trans = -35 x_scale = 6 y_scale = 50 flags = 3 y_trans = 41}
							{font = fontgrid_text_a3 text = 'a' Color = purple_blue_1 x_trans = -18 y_trans = 19 x_skew = -33 x_scale = 86 y_scale = 64 rot = 6253 flags = 27}
							{font = fontgrid_text_a6 text = 'B' Color = navy_1 x_trans = -44 y_trans = 0 x_scale = 50 y_scale = 50 flags = 3 a = 45}
							{font = fontgrid_text_a8 text = 'b' Color = blue_1 x_trans = -54 y_trans = 33 x_scale = 50 y_scale = 50 flags = 3 a = 30}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_002.img` Color = teal_1 y_trans = 31 x_scale = 75 y_scale = 70 flags = 3 x_trans = -3}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapeoutline_002.img` Color = green_1guitar x_skew = 12 y_skew = -45 x_scale = 14 y_scale = 150 rot = 6073 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_002.img` Color = yellow_green_1guitar a = 60 x_trans = 50 x_scale = 54 flags = 3 y_scale = 127}
							{texture = `tex/models/characters/skater_male/decals/cag_icon002.img` Color = grey_2guitar x_trans = -16 y_trans = -44 x_skew = -75 y_skew = -75 x_scale = 103 y_scale = 71 rot = 5863 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_icon_creature002.img` a = 0 x_trans = -21 y_trans = 13 x_skew = -75 y_skew = 72 x_scale = 1 y_scale = 1 rot = 5953 flags = 27 Color = yellow_2guitar}
							{texture = `tex/models/characters/skater_male/decals/cag_graphics_spiral.img` x_trans = -50 x_scale = 65 y_scale = 72 flags = 3 Color = yellow_orange_2}
							{texture = `tex/models/characters/skater_male/decals/cag_sponsors_famous_02.img` y_trans = 7 x_scale = 30 y_scale = 30 flags = 3 x_trans = 20}
							{font = fontgrid_title_a1 text = 'b' Color = orange_2 x_scale = 76 y_scale = 37 flags = 3 y_trans = -27}
							{font = fontgrid_text_a3 text = 'C' Color = red_orange_2 x_trans = -54 x_skew = -18 y_skew = 21 x_scale = 81 y_scale = 136 rot = 6013 flags = 27}
							{font = fontgrid_text_a6 text = 'c' Color = red_2 x_trans = -13 y_trans = 17 x_scale = 150 y_scale = 150 flags = 3 rot = 5083}
							{font = fontgrid_text_a8 text = 'D' Color = violet_2 x_trans = 19 x_scale = 50 y_scale = 20 flags = 3 y_trans = -42}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_003.img` Color = purple_blue_2 a = 65 x_trans = -8 y_trans = 18 y_scale = 138 flags = 3 x_scale = 60}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapeoutline_003.img` x_trans = -20 y_trans = -33 x_scale = 48 y_scale = 38 rot = 5773 flags = 3 Color = blue_2}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_003.img` Color = teal_2 a = 45 x_skew = -12 x_scale = 63 y_scale = 68 flags = 3 rot = 570}
							{texture = `tex/models/characters/skater_male/decals/cag_icon003.img` Color = green_2guitar x_trans = 6 x_scale = 37 y_scale = 57 y_trans = -43 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_icon_creature003.img` Color = yellow_green_2guitar x_trans = -53 y_trans = 18 x_skew = -21 y_skew = 42 x_scale = 46 y_scale = 82 rot = 5923 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_graphics_punkskull.img` Color = grey_3guitar x_trans = -37 y_trans = 27 x_scale = 11 y_scale = 150 rot = 1980 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_sponsors_famous_01.img` y_trans = -29 x_scale = 30 y_scale = 30 flags = 3 x_trans = -31}
							{font = fontgrid_title_a1 text = 'd' Color = yellow_3guitar x_trans = -47 y_trans = -34 x_skew = -39 y_skew = 39 x_scale = 147 y_scale = 36 rot = 5953 flags = 27}
							{font = fontgrid_text_a3 text = 'E' Color = yellow_orange_3 x_trans = -15 y_trans = 5 x_scale = 50 y_scale = 50 flags = 3 x_skew = -75}
							{font = fontgrid_text_a6 text = 'e' Color = orange_3 y_trans = 18 y_skew = -21 x_scale = 31 y_scale = 25 rot = 6103 flags = 11}
							{font = fontgrid_text_a8 text = 'F' Color = red_orange_3 x_trans = 17 y_trans = -8 x_scale = 50 y_scale = 50 flags = 3 a = 20}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_004.img` a = 80 x_trans = -6 y_trans = 16 x_skew = -75 y_skew = 66 x_scale = 14 y_scale = 52 rot = 5983 flags = 3 Color = red_3}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapeoutline_004.img` Color = violet_3 x_trans = 22 x_skew = -30 y_skew = 60 x_scale = 23 y_scale = 17 rot = 6043 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_004.img` Color = purple_blue_3 a = 55 x_skew = -30 y_skew = 27 x_scale = 141 y_scale = 150 rot = 5563 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_icon004.img` Color = navy_3 x_trans = -73 y_trans = 37 x_scale = 25 y_scale = 9 flags = 3 x_skew = -51}
							{texture = `tex/models/characters/skater_male/decals/cag_icon_creature004.img` a = 60 x_trans = 7 y_trans = 2 x_skew = 21 y_skew = -24 x_scale = 30 y_scale = 24 rot = 6043 flags = 27 Color = blue_3}
							{texture = `tex/models/characters/skater_male/decals/cag_graphics005.img` Color = teal_3 x_trans = -17 y_trans = 3 x_skew = -24 y_skew = 27 x_scale = 30 y_scale = 21 rot = 5713 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_graphics006.img` Color = green_3guitar x_trans = 4 y_trans = -11 x_skew = -18 y_skew = 27 x_scale = 63 y_scale = 43 rot = 90 flags = 3}]}
					{base_tex = `tex\models\characters\car\female\car_female_body_tat_o_dnc.dds` material = car_male_body cas_1
						layers = [{texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_005.img` Color = grey_4guitar y_trans = -50 x_skew = -18 y_skew = 18 x_scale = 42 y_scale = 30 rot = 5923 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapeoutline_005.img` Color = yellow_4guitar a = 75 y_trans = 43 y_skew = -24 x_scale = 75 y_scale = 39 rot = 5923 flags = 3 x_skew = -72}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_005.img` Color = yellow_orange_4 a = 85 x_trans = -21 y_trans = -24 x_scale = 74 y_scale = 70 rot = 6103 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_icon005.img` Color = orange_4 x_trans = 23 y_trans = -28 x_scale = 73 y_scale = 61 rot = 2490 flags = 27 a = 80}
							{texture = `tex/models/characters/skater_male/decals/cag_icon_creature005.img` x_trans = -68 y_trans = 33 x_scale = 45 flags = 3 y_scale = 60}
							{texture = `tex/models/characters/skater_male/decals/cag_graphics007.img` Color = red_orange_4 a = 75 x_trans = -49 y_trans = -45 x_skew = -21 y_skew = 33 x_scale = 55 y_scale = 70 rot = 300 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_sponsors_kfc_01.img` x_trans = -59 x_scale = 30 y_scale = 30 flags = 3 y_trans = -25}
							{font = fontgrid_title_a1 text = 'f' Color = red_4 x_trans = -30 y_trans = 28 x_skew = -27 y_skew = 57 x_scale = 63 y_scale = 89 rot = 6133 flags = 11}
							{font = fontgrid_text_a3 text = 'G' Color = violet_4 x_trans = 32 y_trans = -44 x_skew = -9 y_skew = 15 x_scale = 38 y_scale = 79 rot = 6133 flags = 27}
							{font = fontgrid_text_a6 text = 'g' Color = purple_blue_4 a = 70 x_skew = -51 y_skew = 75 x_scale = 77 y_scale = 77 flags = 27 rot = 5803}
							{font = fontgrid_text_a8 text = 'H' Color = blue_4 y_trans = 71 x_skew = -24 y_skew = -33 x_scale = 61 y_scale = 60 rot = 6073 flags = 19}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006.img` Color = green_4guitar x_trans = -52 x_scale = 57 y_scale = 124 flags = 3 a = 35}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapeoutline_006.img` Color = yellow_green_4guitar a = 85 x_trans = -37 y_trans = 25 x_skew = -21 y_skew = -36 x_scale = 64 y_scale = 88 rot = 6043 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_006.img` Color = grey_5guitar x_trans = -59 y_trans = -6 x_skew = -9 y_skew = -15 x_scale = 107 y_scale = 35 rot = 6073 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_icon006.img` Color = yellow_5guitar x_trans = -37 x_skew = 33 y_skew = 69 x_scale = 60 y_scale = 123 rot = 5863 flags = 3 y_trans = 14}
							{texture = `tex/models/characters/skater_male/decals/cag_icon_creature006.img` x_trans = -20 y_trans = 61 x_skew = -36 x_scale = 87 y_scale = 79 rot = 4453 flags = 3 y_skew = 51}
							{texture = `tex/models/characters/skater_male/decals/cag_graphics008.img` Color = yellow_orange_5 y_trans = -26 x_skew = 36 y_skew = 21 x_scale = 150 y_scale = 150 rot = 240 flags = 3}
							{texture = `tex/models/characters/skater_male/decals/cag_sponsors_sabian_01.img` x_scale = 30 y_scale = 30 flags = 3 y_trans = 18}
							{font = fontgrid_title_a1 text = 'h' Color = orange_4 x_trans = -60 x_skew = -75 x_scale = 100 y_scale = 100 flags = 3 y_skew = 75}
							{font = fontgrid_text_a3 text = 'I' Color = orange_5 x_trans = -55 x_skew = 75 x_scale = 126 y_scale = 100 flags = 3 y_skew = 75}
							{font = fontgrid_text_a6 text = 'i' x_trans = -49 x_skew = -69 y_skew = -75 x_scale = 121 y_scale = 130 flags = 3 rot = 570}
							{font = fontgrid_text_a8 text = 'J' x_trans = -45 x_skew = 48 y_skew = -75 x_scale = 147 y_scale = 143 rot = 450 flags = 27 Color = red_5}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_007.img` x_trans = 0 y_trans = 26 x_scale = 67 y_scale = 8 flags = 3 Color = violet_5}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapeoutline_007.img` Color = navy_5 x_skew = -12 y_skew = 24 x_scale = 53 y_scale = 64 rot = 210 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_007.img` Color = blue_5 a = 40 y_trans = -37 y_skew = -36 x_scale = 53 y_scale = 51 rot = 3613 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_icon007.img` Color = teal_5 a = 60 x_trans = 13 y_trans = 35 x_skew = -21 y_skew = -24 x_scale = 52 y_scale = 39 rot = 6163 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_icon_creature007.img` x_trans = -28 y_trans = -30 x_scale = 49 y_scale = 37 Color = green_5guitar flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_graphics009.img` Color = yellow_green_5guitar x_trans = 23 y_trans = -28 x_skew = -24 y_skew = 75 x_scale = 30 y_scale = 68 rot = 5983 flags = 19}
							{texture = `tex/models/characters/skater_male/decals/cag_sponsors_emg_01.img` x_scale = 30 y_scale = 30 flags = 3 y_trans = -48}
							{font = fontgrid_title_a1 text = 'j' x_trans = 59 y_trans = 100 x_scale = 100 y_scale = 100 flags = 3 Color = yellow_green_5guitar}
							{font = fontgrid_text_a3 text = 'K' Color = black_1guitar x_scale = 77 y_scale = 77 flags = 19}
							{font = fontgrid_text_a6 text = 'k' Color = yellow_1guitar x_trans = 14 y_trans = 23 x_scale = 100 y_scale = 100 flags = 3 a = 0}
							{font = fontgrid_text_a8 text = 'L' Color = yellow_orange_1 x_trans = -23 y_trans = 24 x_scale = 100 flags = 3 y_scale = 150}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_008.img` Color = orange_1 a = 60 x_skew = -12 y_skew = 57 x_scale = 21 y_scale = 143 rot = 360 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapeoutline_008.img` Color = red_1 a = 15 x_trans = 29 y_trans = 2 x_scale = 30 y_scale = 71 flags = 3 rot = 6043}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_008.img` x_scale = 1 y_scale = 4 flags = 3 Color = violet_4}
							{texture = `tex/models/characters/skater_male/decals/cag_icon008.img` Color = purple_blue_1 x_trans = -44 y_trans = 3 y_skew = 48 x_scale = 55 y_scale = 54 rot = 5383 x_skew = -39 flags = 11}
							{texture = `tex/models/characters/skater_male/decals/cag_icon_insect001.img` Color = green_1guitar x_trans = -87 y_trans = -39 x_skew = -30 y_skew = 36 x_scale = 75 y_scale = 41 rot = 270 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_graphics010.img` x_trans = 20 x_scale = 30 y_scale = 78 flags = 3 y_trans = 65}
							{texture = `tex/models/characters/skater_male/decals/cag_graphics011.img` Color = green_1guitar y_trans = -38 x_skew = -75 y_skew = -75 x_scale = 150 y_scale = 30 flags = 27 a = 80}]}
					{base_tex = `tex\models\characters\car\female\car_female_arml_tat_o_dnc.dds` material = car_male_arml cas_1
						layers = [{texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_013.img` y_trans = 44 x_scale = 1 y_scale = 1 flags = 3 Color = black_1guitar}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapeoutline_013.img` y_trans = 41 x_scale = 1 y_scale = 1 flags = 3 Color = yellow_1guitar}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_013.img` Color = yellow_orange_1 y_trans = 38 x_skew = -63 y_skew = 57 x_scale = 1 y_scale = 4 rot = 6043 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_icon013.img` Color = orange_1 y_trans = 37 x_skew = -21 y_skew = -24 x_scale = 1 y_scale = 1 rot = 540 flags = 11}
							{texture = `tex/models/characters/skater_male/decals/cag_icon_wing001.img` Color = red_1 x_trans = 4 y_trans = 31 x_skew = -36 x_scale = 1 y_scale = 1 flags = 3 y_skew = -36}
							{texture = `tex/models/characters/skater_male/decals/cag_graphics017.img` Color = violet_1 a = 0 y_trans = 19 x_skew = 63 y_skew = -75 x_scale = 1 y_scale = 1 flags = 3 rot = 5983}
							{texture = `tex/models/characters/skater_male/decals/cag_sponsors_gcaxesmith_01.img` y_trans = -33 x_scale = 30 y_scale = 30 flags = 3 x_trans = 0}
							{font = fontgrid_title_a1 text = 'r' y_trans = 42 x_skew = -27 y_skew = 33 x_scale = 1 y_scale = 1 flags = 3 rot = 990}
							{font = fontgrid_text_a3 text = 'S' y_trans = 20 x_scale = 1 y_scale = 2 flags = 3 x_trans = -37}
							{font = fontgrid_text_a6 text = 's' x_trans = -12 y_trans = 23 y_scale = 1 flags = 3 x_scale = 1}
							{font = fontgrid_text_a8 text = 'T' Color = navy_1 y_trans = 40 x_scale = 1 y_scale = 1 flags = 3 x_trans = 39}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_014.img` Color = blue_1 x_trans = -18 y_trans = 42 x_skew = -48 y_skew = 36 x_scale = 1 y_scale = 1 rot = 1920 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapeoutline_014.img` x_trans = 54 y_trans = 27 x_scale = 1 y_scale = 2 flags = 3 Color = green_1guitar}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_014.img` x_trans = -30 x_scale = 2 y_scale = 1 flags = 3 y_trans = 22}
							{texture = `tex/models/characters/skater_male/decals/cag_icon014.img` Color = blue_1 y_trans = -42 x_skew = -75 y_skew = 75 x_scale = 1 y_scale = 2 rot = 330 flags = 11 x_trans = -21}
							{texture = `tex/models/characters/skater_male/decals/cag_icon_wing002.img` Color = navy_3 x_trans = -71 x_skew = -51 y_skew = 75 x_scale = 1 y_scale = 1 rot = 4213 flags = 27 y_trans = -29}
							{texture = `tex/models/characters/skater_male/decals/cag_graphics018.img` Color = yellow_orange_3 x_trans = -15 y_trans = 41 y_skew = -75 x_scale = 1 y_scale = 2 rot = 2370 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_sponsors_hob_01.img` y_trans = 20 x_scale = 30 y_scale = 30 flags = 3 x_trans = -20}
							{font = fontgrid_title_a1 text = 't' x_trans = -54 x_scale = 1 y_scale = 1 flags = 3 y_trans = -55}
							{font = fontgrid_text_a3 text = 'U' x_trans = 60 y_trans = 35 x_skew = 75 y_skew = 75 x_scale = 1 y_scale = 1 flags = 3 rot = 660}
							{font = fontgrid_text_a6 text = 'u' x_trans = 54 y_trans = -21 x_skew = -30 y_skew = -66 x_scale = 1 y_scale = 1 rot = 180 flags = 27}
							{font = fontgrid_text_a8 text = 'V' Color = green_4guitar x_trans = -38 y_trans = -60 x_skew = -39 y_skew = 75 x_scale = 1 y_scale = 1 rot = 3193 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_015.img` y_trans = 43 x_scale = 1 y_scale = 2 flags = 3 x_trans = 66}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapeoutline_015.img` Color = yellow_green_1guitar x_trans = -25 y_trans = -31 x_skew = 15 y_skew = 21 x_scale = 1 y_scale = 6 rot = 270 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_015.img` Color = yellow_5guitar x_trans = -58 x_scale = 1 y_scale = 2 flags = 3 y_trans = -60}
							{texture = `tex/models/characters/skater_male/decals/cag_icon015.img` Color = grey_5guitar a = 0 x_scale = 1 flags = 3 y_scale = 1}
							{texture = `tex/models/characters/skater_male/decals/cag_graphics019.img` x_trans = 34 y_trans = 54 x_scale = 1 y_scale = 1 flags = 3 x_skew = -75}
							{texture = `tex/models/characters/skater_male/decals/cag_sponsors_kfc_02.img` y_trans = -16 x_scale = 30 y_scale = 30 flags = 3 x_trans = 34}
							{font = fontgrid_title_a1 text = 'v' Color = teal_3 x_trans = -36 x_skew = -75 y_skew = -75 x_scale = 1 y_scale = 1 rot = 4153 flags = 27 y_trans = -55}
							{font = fontgrid_text_a3 text = 'W' Color = purple_blue_3 a = 20 x_skew = -36 y_skew = 39 x_scale = 1 y_scale = 1 rot = 5473 flags = 27 x_trans = 65}
							{font = fontgrid_text_a6 text = 'w' a = 70 x_trans = -28 y_trans = -21 x_skew = -18 y_skew = 30 x_scale = 1 y_scale = 1 rot = 6073 flags = 27 Color = yellow_green_3guitar}
							{font = fontgrid_text_a8 text = 'X' Color = grey_4guitar x_trans = -21 y_trans = 100 x_skew = -21 y_skew = -27 x_scale = 1 y_scale = 1 rot = 4063 flags = 11}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_016.img` Color = yellow_3guitar x_trans = 44 y_trans = -52 x_skew = -3 x_scale = 1 y_scale = 1 flags = 19 rot = 2100}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapeoutline_016.img` Color = navy_2 a = 65 x_trans = 35 y_trans = 33 x_scale = 1 y_scale = 1 x_skew = -75 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_016.img` x_trans = 47 y_trans = -67 x_skew = -27 y_skew = 36 x_scale = 1 y_scale = 1 rot = 3913 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_icon016.img` x_trans = 11 y_trans = 20 x_skew = -30 y_skew = 72 x_scale = 1 y_scale = 1 rot = 6073 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_icon_wing004.img` Color = blue_1 x_trans = -48 y_trans = -52 x_skew = -6 y_skew = -39 x_scale = 1 y_scale = 1 rot = 6163 flags = 11}
							{texture = `tex/models/characters/skater_male/decals/cag_graphics020.img` Color = red_orange_2 x_trans = -11 y_trans = -46 x_scale = 1 y_scale = 1 flags = 3 x_skew = -75}
							{texture = `tex/models/characters/skater_male/decals/cag_graphics021.img` Color = black_1guitar a = 20 x_trans = -46 y_trans = -28 x_skew = 66 y_skew = 75 x_scale = 1 y_scale = 1 rot = 6103 flags = 11}
							{texture = `tex/models/characters/skater_male/decals/cag_icon_wing003.img` Color = blue_1 x_trans = -65 y_trans = 21 x_skew = -75 x_scale = 1 y_scale = 5 flags = 3 y_skew = 75}]}
					{base_tex = `tex\models\characters\car\female\car_female_armr_tat_o_dnc.dds` material = car_male_armr cas_1
						layers = [{texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_009.img` Color = grey_2guitar x_trans = -41 x_skew = 24 y_skew = -24 x_scale = 51 y_scale = 118 rot = 6043 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapeoutline_009.img` Color = yellow_2guitar x_trans = -6 y_trans = -42 x_skew = 75 x_scale = 143 y_scale = 35 flags = 3 y_skew = -33}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_009.img` Color = yellow_orange_2 a = 75 y_trans = 44 x_skew = 27 y_skew = -21 x_scale = 58 y_scale = 40 rot = 6103 flags = 19}
							{texture = `tex/models/characters/skater_male/decals/cag_icon009.img` Color = orange_2 x_trans = 28 y_trans = -13 x_skew = 72 x_scale = 52 y_scale = 83 flags = 3 y_skew = -75}
							{texture = `tex/models/characters/skater_male/decals/cag_icon_insect002.img` Color = red_orange_2 x_trans = -27 y_trans = 21 x_skew = -18 x_scale = 83 y_scale = 21 y_skew = 30 flags = 11}
							{texture = `tex/models/characters/skater_male/decals/cag_graphics012.img` Color = red_2 x_scale = 30 y_scale = 66 flags = 3 x_trans = 32}
							{texture = `tex/models/characters/skater_male/decals/cag_sponsors_at_01.img` y_trans = 30 x_scale = 30 y_scale = 30 flags = 3 x_trans = 28}
							{font = fontgrid_title_a1 text = 'l' Color = violet_2 x_trans = -15 y_trans = 20 x_scale = 13 y_scale = 100 flags = 3 a = 0}
							{font = fontgrid_text_a3 text = 'M' y_trans = -28 x_skew = -30 x_scale = 100 y_scale = 147 flags = 3 Color = purple_blue_2}
							{font = fontgrid_text_a6 text = 'm' Color = navy_2 x_trans = 19 y_trans = 18 x_skew = -36 x_scale = 132 y_scale = 150 flags = 3 y_skew = 75}
							{font = fontgrid_text_a8 text = 'N' Color = teal_2 x_trans = -30 y_trans = -10 y_skew = -66 x_scale = 100 y_scale = 100 rot = 240 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_010.img` Color = green_3guitar a = 40 x_skew = -63 y_skew = -24 x_scale = 150 y_scale = 150 rot = 6073 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapeoutline_010.img` x_trans = 24 y_trans = -8 x_scale = 30 y_scale = 30 flags = 3 x_skew = 48}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_010.img` Color = yellow_green_2guitar a = 55 x_trans = -17 y_trans = 15 y_scale = 44 flags = 3 x_scale = 42}
							{texture = `tex/models/characters/skater_male/decals/cag_icon_mammal002.img` a = 95 x_trans = 35 y_trans = 23 x_skew = -42 y_skew = 45 x_scale = 55 y_scale = 60 rot = 5563 flags = 11 Color = black_1guitar}
							{texture = `tex/models/characters/skater_male/decals/cag_icon010.img` Color = grey_4guitar a = 80 y_trans = -28 x_skew = -33 y_skew = 75 x_scale = 75 y_scale = 111 rot = 5653 flags = 19}
							{texture = `tex/models/characters/skater_male/decals/cag_graphics013.img` y_trans = 24 x_scale = 1 y_scale = 1 flags = 3 x_trans = -22}
							{texture = `tex/models/characters/skater_male/decals/cag_sponsors_coke_01.img` x_scale = 30 y_scale = 30 flags = 3 y_trans = 41}
							{font = fontgrid_title_a1 text = 'n' Color = green_2guitar y_trans = 23 x_skew = -42 x_scale = 124 y_scale = 100 flags = 3 x_trans = -20}
							{font = fontgrid_text_a3 text = 'O' x_scale = 100 y_scale = 100 flags = 3 y_trans = 22}
							{font = fontgrid_text_a6 text = 'o' Color = yellow_orange_3 a = 30 x_skew = -30 x_scale = 114 y_scale = 100 rot = 5893 flags = 27}
							{font = fontgrid_text_a8 text = 'P' Color = teal_5 x_trans = 30 y_trans = -21 x_skew = -48 y_skew = -27 x_scale = 114 y_scale = 146 rot = 6013 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_011.img` Color = navy_1 a = 60 x_trans = -29 y_trans = 56 x_skew = -69 y_skew = -75 x_scale = 30 y_scale = 99 rot = 5293 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapeoutline_011.img` Color = purple_blue_1 x_trans = 0 y_trans = 25 x_scale = 43 y_scale = 30 flags = 3 a = 55}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_011.img` y_trans = 9 x_skew = -33 y_skew = -24 x_scale = 30 y_scale = 30 rot = 5713 flags = 27 x_trans = 53}
							{texture = `tex/models/characters/skater_male/decals/cag_icon011.img` Color = red_3 x_trans = -7 x_scale = 68 y_scale = 46 flags = 3 y_trans = -30}
							{texture = `tex/models/characters/skater_male/decals/cag_icon_insect003.img` Color = navy_3 x_trans = 35 x_scale = 78 y_scale = 150 flags = 3 a = 35}
							{texture = `tex/models/characters/skater_male/decals/cag_graphics014.img` x_trans = -29 x_skew = -45 y_skew = 63 x_scale = 30 y_scale = 79 rot = 5683 flags = 11}
							{texture = `tex/models/characters/skater_male/decals/cag_sponsors_evans_01.img` y_trans = 34 x_scale = 30 y_scale = 30 flags = 3 x_trans = 37}
							{font = fontgrid_title_a1 text = 'p' Color = yellow_3guitar x_trans = 29 y_trans = 15 x_skew = -75 y_skew = -69 x_scale = 118 y_scale = 116 rot = 5773 flags = 27}
							{font = fontgrid_text_a3 text = 'Q' x_trans = -17 y_trans = -36 x_scale = 100 y_scale = 40 flags = 3 Color = yellow_green_3guitar}
							{font = fontgrid_text_a6 text = 'q' Color = teal_3 x_trans = -20 y_trans = 13 x_scale = 117 y_scale = 113 flags = 3 a = 45}
							{font = fontgrid_text_a8 text = 'R' Color = teal_3 x_trans = -29 y_trans = -14 x_skew = -63 x_scale = 122 y_scale = 147 flags = 3 y_skew = 75}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_012.img` x_trans = 16 y_trans = 21 x_scale = 149 y_scale = 1 flags = 3 Color = navy_3}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapeoutline_012.img` x_trans = 43 x_scale = 18 y_scale = 18 flags = 3 Color = violet_3}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_012.img` x_trans = 14 y_trans = 26 x_scale = 30 y_scale = 30 flags = 3 Color = black_1guitar}
							{texture = `tex/models/characters/skater_male/decals/cag_icon012.img` Color = red_orange_3 x_trans = -26 y_trans = -25 x_skew = -45 y_skew = 57 x_scale = 22 y_scale = 117 rot = 5953 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_icon_mammal001.img` x_trans = 32 y_trans = -17 x_scale = 67 y_scale = 85 flags = 3 Color = blue_1}
							{texture = `tex/models/characters/skater_male/decals/cag_graphics015.img` x_trans = 5 y_trans = 28 x_skew = -57 y_skew = 75 y_scale = 51 rot = 4933 x_scale = 76 flags = 19}
							{texture = `tex/models/characters/skater_male/decals/cag_graphics016.img` Color = yellow_orange_3 x_trans = 31 y_trans = 6 x_skew = -39 y_skew = 36 x_scale = 67 y_scale = 42 rot = 5863 flags = 27}]}]}
			cas_physique = {desc_id = malephysique
				bones = {height = 1.0}
				additional_bone_transforms = [{bone = Bone_Neck
						scaling = {value = (0.25, 0.25, 0.25) no_propagate}}
					{bone = bone_chest
						scaling = {value = (0.1, 0.4, 0.4) no_propagate}}
					{bone = Bone_Stomach_Upper
						scaling = {value = (0.1, 0.25, 0.25) no_propagate}}
					{bone = Bone_Stomach_Lower
						scaling = {value = (0.1, 0.25, 0.15) no_propagate}}
					{bone = Bone_Collar_R
						scaling = {value = (0.2, 0.2, 0.2) no_propagate}
						translation = {value = (0.0, -0.07, 0.0)}}
					{bone = Bone_Collar_L
						scaling = {value = (0.2, 0.2, 0.2) no_propagate}
						translation = {value = (0.0, -0.07, 0.0)}}
					{bone = Bone_Twist_Bicep_Top_R
						scaling = {value = (0.0, 0.65000004, 0.5) no_propagate}}
					{bone = Bone_Twist_Bicep_Mid_R
						scaling = {value = (0.0, 0.65000004, 0.5) no_propagate}}
					{bone = Bone_Bicep_R
						scaling = {value = (0.0, 0.65000004, 0.5) no_propagate}}
					{bone = Bone_Twist_Bicep_Top_L
						scaling = {value = (0.0, 0.65000004, 0.5) no_propagate}}
					{bone = Bone_Twist_Bicep_Mid_L
						scaling = {value = (0.0, 0.65000004, 0.5) no_propagate}}
					{bone = Bone_Bicep_L
						scaling = {value = (0.0, 0.65000004, 0.5) no_propagate}}
					{bone = Bone_Forearm_L
						scaling = {value = (0.0, 0.5, 0.35000002) no_propagate}}
					{bone = Bone_Forearm_R
						scaling = {value = (0.0, 0.5, 0.35000002) no_propagate}}
					{bone = Bone_Palm_L
						scaling = {value = (0.0, 0.3, 0.3)}}
					{bone = Bone_Palm_R
						scaling = {value = (0.0, 0.3, 0.3)}}
					{bone = Bone_Ankle_R
						scaling = {value = (0.13, 0.0, 0.3)}}
					{bone = Bone_Ankle_L
						scaling = {value = (0.13, 0.0, 0.3)}}]}
			cas_eyes = {desc_id = car_demon_eyes}
			cas_male_hair = {desc_id = m_rock_hair_guitarist
				chosen_materials = {material1 = teal_4}}
			cas_male_hat = {desc_id = None}
			cas_male_facial_hair = {desc_id = m_clsc_fhair_burns01}
			cas_male_torso = {desc_id = m_torso_tshirt
				chosen_materials = {material1 = red_orange_3}
				cap = [{base_tex = `tex/models/characters/car/male/m_torso_tshirt_o_dnc.dds` material = m_torso_tshirt_primary cas_1
						layers = [{texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_017.img` a = 65 x_trans = -59 y_trans = 18 x_skew = 36 y_skew = -54 x_scale = 29 y_scale = 39 flags = 3 rot = 600}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_017.img` x_trans = -39 y_trans = -25 x_skew = -75 y_skew = -75 x_scale = 21 y_scale = 30 rot = 270 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_icon017.img` x_trans = -52 y_trans = -11 x_scale = 104 y_scale = 64 flags = 3 Color = red_orange_3}
							{texture = `tex/models/characters/skater_male/decals/cag_icon_wing004.img` Color = yellow_orange_1 x_trans = -58 y_trans = -13 y_skew = -45 x_scale = 21 y_scale = 127 rot = 510 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_graphics022.img` Color = yellow_green_1guitar a = 80 x_trans = -40 y_trans = 18 x_scale = 12 y_scale = 25 flags = 3 x_skew = 57}
							{texture = `tex/models/characters/skater_male/decals/cag_sponsors_line6_01.img` x_trans = -49 x_scale = 21 y_scale = 30 flags = 3 y_trans = -29}
							{font = fontgrid_title_a1 text = 'x' x_trans = -63 y_trans = -3 x_scale = 80 y_scale = 80 flags = 3 Color = orange_1}
							{font = fontgrid_text_a6 text = 'y' x_trans = -39 y_trans = -5 y_skew = -36 x_scale = 80 y_scale = 150 rot = 450 flags = 27 Color = green_2guitar}
							{font = fontgrid_text_a8 text = 'Z' x_trans = -50 y_trans = 15 x_scale = 31 y_scale = 44 flags = 3 a = 0}
							{font = fontgrid_text_a3 text = 'Y' Color = grey_2guitar x_trans = -51 y_trans = -19 x_scale = 127 y_scale = 80 flags = 3 rot = 5293}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_018.img` x_trans = -59 y_trans = 0 x_skew = -63 y_skew = 21 x_scale = 12 y_scale = 46 rot = 6013 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_018.img` x_trans = -43 y_trans = 13 x_scale = 16 y_scale = 46 rot = 5593 flags = 3 Color = teal_2}
							{texture = `tex/models/characters/skater_male/decals/cag_icon018.img` Color = black_1guitar x_trans = -52 x_scale = 101 y_scale = 73 flags = 3 a = 60}
							{texture = `tex/models/characters/skater_male/decals/cag_icon_wing005.img` x_trans = -56 y_trans = 14 x_scale = 21 y_scale = 30 flags = 3 Color = blue_2}
							{texture = `tex/models/characters/skater_male/decals/cag_graphics023.img` x_trans = 44 y_trans = -19 x_skew = 33 y_skew = 21 x_scale = 21 y_scale = 30 rot = 6073 flags = 11}
							{texture = `tex/models/characters/skater_male/decals/cag_sponsors_mackie_02.img` x_trans = -47 x_scale = 21 y_scale = 30 flags = 3 y_trans = -3}
							{font = fontgrid_title_a1 text = 'z' a = 25 x_trans = -59 y_trans = 9 x_skew = 75 y_skew = 3 x_scale = 41 y_scale = 91 flags = 3 Color = blue_2}
							{font = fontgrid_text_a3 text = '0' Color = purple_blue_2 a = 45 x_trans = -50 y_trans = -16 x_skew = 6 y_skew = -75 x_scale = 80 y_scale = 80 rot = 870 flags = 11}
							{font = fontgrid_text_a6 text = '1' Color = violet_2 x_trans = -39 y_trans = 9 x_skew = -24 x_scale = 114 y_scale = 32 flags = 3 y_skew = 75}
							{font = fontgrid_text_a8 text = '2' x_trans = -59 y_trans = -9 y_skew = 42 x_scale = 80 y_scale = 80 rot = 5743 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_019.img` Color = red_3 a = 80 y_trans = -36 y_skew = 75 x_scale = 14 y_scale = 37 flags = 3 rot = 6133}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_019.img` Color = yellow_5guitar y_trans = 28 x_skew = -21 x_scale = 68 y_scale = 63 rot = 6073 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_icon019.img` y_trans = -20 x_skew = 60 y_skew = -21 x_scale = 149 y_scale = 1 flags = 3 rot = 300}
							{texture = `tex/models/characters/skater_male/decals/cag_icon_wing006.img` x_trans = 23 y_trans = 14 x_scale = 36 y_scale = 41 rot = 5623 flags = 11 x_skew = -36}
							{texture = `tex/models/characters/skater_male/decals/cag_graphics024.img` y_trans = -22 x_scale = 85 y_scale = 61 flags = 3 a = 55}
							{texture = `tex/models/characters/skater_male/decals/cag_sponsors_mackie_01.img` x_scale = 21 y_scale = 30 flags = 3 y_trans = 27}
							{font = fontgrid_title_a1 text = '3' Color = blue_3 x_trans = -21 y_trans = -20 x_skew = -33 y_skew = 42 x_scale = 26 y_scale = 80 rot = 5773 flags = 27}
							{font = fontgrid_text_a3 text = '4' x_trans = 24 y_trans = -40 x_skew = 27 x_scale = 146 flags = 3 y_scale = 150}
							{font = fontgrid_text_a6 text = '5' Color = yellow_orange_3 x_trans = 20 y_trans = -22 y_skew = -33 x_scale = 100 y_scale = 46 rot = 5053 flags = 27}
							{font = fontgrid_text_a8 text = '6' Color = navy_3 a = 60 x_trans = -35 y_trans = 46 x_scale = 80 y_scale = 80 rot = 5863 flags = 3 x_skew = -75}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_020.img` y_trans = -39 x_scale = 105 y_scale = 39 flags = 3 Color = yellow_4guitar}
							{texture = `tex/models/characters/skater_male/decals/cag_icon020.img` x_skew = -24 x_scale = 32 y_scale = 30 flags = 3 rot = 660}
							{texture = `tex/models/characters/skater_male/decals/cag_icon_wing007.img` y_trans = 33 x_skew = -51 y_skew = 36 x_scale = 10 y_scale = 41 rot = 150 flags = 3 x_trans = -20}
							{texture = `tex/models/characters/skater_male/decals/cag_graphics025.img` x_trans = 27 x_scale = 60 y_scale = 30 rot = 6013 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_sponsors_ernieball_01.img` y_trans = -9 x_scale = 21 y_scale = 30 flags = 3 x_trans = -23}
							{font = fontgrid_title_a1 text = '7' Color = blue_3 y_trans = -20 x_skew = -33 y_skew = -57 x_scale = 80 y_scale = 150 rot = 450 flags = 27}
							{font = fontgrid_text_a3 text = '8' Color = red_orange_4 a = 75 y_trans = -14 x_scale = 146 y_scale = 80 rot = 4753 flags = 3 x_skew = -27}
							{font = fontgrid_text_a6 text = '9' Color = black_1guitar x_trans = 21 y_trans = 17 x_skew = -18 y_skew = 21 x_scale = 107 y_scale = 80 rot = 6073 flags = 27}
							{font = fontgrid_text_a8 text = '!' y_trans = -9 x_scale = 80 y_scale = 91 flags = 3 a = 10}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_021.img` Color = purple_blue_5 x_skew = 48 y_skew = 42 x_scale = 70 y_scale = 30 rot = 240 flags = 27}]}]}
			cas_male_legs = {desc_id = m_glam_legs_stripes
				chosen_materials = {material1 = green_2 material2 = yellow_orange_2}}
			cas_male_shoes = {desc_id = m_goth_shoes_spats
				chosen_materials = {material1 = carblack_1 material2 = yellow_orange_5}}
			cas_male_acc_left = {desc_id = m_bmtl_acc_llars
				chosen_materials = {material1 = yellow_orange_4}}
			cas_male_acc_right = {desc_id = m_bmtl_acc_rlars
				chosen_materials = {material1 = yellow_green_5}}
			cas_male_acc_face = {desc_id = m_clsc_glasses_round2
				chosen_materials = {material1 = red_1}}
			cas_male_acc_ears = {desc_id = m_punk_acc_ring}
			cas_male_intro_anim = {desc_id = intro_scary}
			cas_male_win_anim = {desc_id = win_pointing}
			cas_male_lose_anim = {desc_id = lose_tantrum}
			cas_male_age = {desc_id = car_male_old}
			cas_guitar_body = {desc_id = guitar_body03
				cap = [{base_tex = `tex/models/car_instruments/guitars/gtr_body_style3_d_01.dds` material = guitar_body_style_03_primary diffuse
						pre_layer = [{texture = `tex/models/characters/layers/cag/gtr_body_style3_ld_15.img` flags = 4}
							{texture = `tex/models/characters/layers/cag/gtr_body_style3_dtl_02.img` flags = 4}]
						layers = [{texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_022.img` Color = yellow_5guitar a = 85 x_trans = -41 y_trans = 39 x_skew = 21 y_skew = -42 x_scale = 42 y_scale = 84 rot = 5833 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_icon021.img` x_trans = -38 y_trans = -33 x_skew = -24 y_skew = -54 x_scale = 42 y_scale = 65 rot = 240 flags = 27 Color = yellow_orange_5}
							{texture = `tex/models/characters/skater_male/decals/cag_icon_wing008.img` x_trans = -27 y_trans = -14 x_scale = 41 y_scale = 67 flags = 3 Color = orange_5}
							{texture = `tex/models/characters/skater_male/decals/cag_graphics026.img` Color = red_orange_5 y_trans = 19 x_scale = 50 y_scale = 39 rot = 3943 flags = 3 x_trans = -34}
							{texture = `tex/models/characters/skater_male/decals/cag_sponsors_marshall_01.img` y_trans = -16 x_scale = 21 y_scale = 40 flags = 3 x_trans = -25}
							{font = fontgrid_title_a1 text = '?' Color = red_orange_5 x_trans = 39 y_trans = 66 x_skew = -21 y_skew = 24 x_scale = 53 y_scale = 9 flags = 3 rot = 5923}
							{font = fontgrid_text_a3 text = '@' Color = red_5 a = 0 x_trans = 17 x_scale = 77 y_scale = 67 flags = 3 y_trans = -33}
							{font = fontgrid_text_a6 text = '#' Color = violet_5 x_trans = -18 y_trans = -10 x_skew = -75 y_skew = -75 x_scale = 59 y_scale = 55 rot = 4783 flags = 27}
							{font = fontgrid_text_a8 text = '$' Color = purple_blue_5 a = 85 x_trans = 13 x_scale = 124 y_scale = 99 flags = 3 y_trans = -17}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_023.img` Color = teal_5 x_trans = 8 y_trans = 40 x_scale = 66 y_scale = 111 flags = 3 a = 40}
							{texture = `tex/models/characters/skater_male/decals/cag_icon029.img` Color = green_5guitar y_trans = -36 x_scale = 38 y_scale = 61 flags = 3 x_trans = 10}
							{texture = `tex/models/characters/skater_male/decals/cag_icon_wing009.img` x_trans = -11 y_trans = 8 x_scale = 30 y_scale = 23 Color = yellow_green_5guitar flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_graphics027.img` Color = grey_5guitar x_trans = -26 y_trans = -11 x_skew = -30 y_skew = -75 x_scale = 9 y_scale = 40 rot = 750 flags = 27}
							{font = fontgrid_title_a1 text = '%' a = 0 x_trans = 61 y_trans = -49 x_skew = -69 y_skew = -75 x_scale = 1 y_scale = 4 rot = 5533 flags = 27}
							{font = fontgrid_text_a3 text = '^' Color = yellow_4guitar x_trans = 47 y_trans = 59 x_skew = -75 y_skew = -66 x_scale = 69 y_scale = 92 rot = 4423 flags = 11}
							{font = fontgrid_text_a6 text = '&' Color = orange_4 x_trans = -3 x_skew = 45 y_skew = -33 x_scale = 60 y_scale = 66 rot = 5893 flags = 11 y_trans = -15}
							{font = fontgrid_text_a8 text = '*' Color = red_orange_4 x_trans = 15 y_trans = 52 x_skew = -36 y_skew = 36 x_scale = 150 y_scale = 150 rot = 5803 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_024.img` Color = red_4 x_trans = -20 y_trans = -23 x_scale = 10 y_scale = 150 flags = 3 x_skew = -27}
							{texture = `tex/models/characters/skater_male/decals/cag_icon030.img` Color = violet_4 x_trans = 24 y_trans = 8 x_skew = -30 y_skew = 33 x_scale = 21 y_scale = 40 rot = 750 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_plant_001.img` Color = purple_blue_4 a = 40 x_trans = -20 y_trans = 25 x_skew = 48 y_skew = -48 x_scale = 147 y_scale = 150 rot = 210 flags = 11}
							{texture = `tex/models/characters/skater_male/decals/cag_graphics029.img` x_trans = -20 y_trans = 12 x_skew = -57 y_skew = 39 x_scale = 35 y_scale = 150 rot = 6043 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_sponsors_ocdp_01.img` y_trans = -11 x_scale = 21 y_scale = 40 flags = 3 x_trans = -22}
							{texture = `tex/models/characters/skater_male/decals/cag_sponsors_porkpie_01.img` y_trans = 25 x_scale = 21 y_scale = 40 flags = 3 x_trans = 9}
							{font = fontgrid_title_a1 text = '(' x_trans = -37 y_trans = 39 x_scale = 21 y_scale = 1 flags = 3 Color = navy_4}
							{font = fontgrid_text_a3 text = ')' Color = blue_4 a = 45 x_trans = -20 y_trans = 25 x_skew = -33 y_skew = 69 x_scale = 29 y_scale = 70 rot = 1620 flags = 27}
							{font = fontgrid_text_a6 text = '`' Color = green_4guitar a = 60 x_trans = 25 y_trans = -11 x_skew = 36 y_skew = -36 x_scale = 36 y_scale = 40 rot = 1110 flags = 19}
							{font = fontgrid_text_a8 text = ':' Color = grey_4guitar a = 10 x_trans = 71 y_trans = -48 x_scale = 21 y_scale = 40 flags = 3 x_skew = -75}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_025.img` Color = yellow_4guitar a = 65 x_trans = -20 y_trans = 25 x_skew = -75 y_skew = 18 x_scale = 140 y_scale = 78 rot = 5893 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_icon031.img` Color = teal_4 x_trans = -8 y_trans = -25 x_skew = -27 y_skew = -39 x_scale = 31 y_scale = 52 rot = 270 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_plant_002.img` Color = yellow_3guitar x_trans = -18 y_trans = 6 x_scale = 21 y_scale = 40 flags = 3 rot = 1350}
							{texture = `tex/models/characters/skater_male/decals/cag_graphics030.img` x_trans = 10 y_trans = -3 x_skew = -15 y_skew = 30 x_scale = 121 y_scale = 33 rot = 5803 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_sponsors_regaltip_01.img` y_trans = 32 x_scale = 21 y_scale = 40 flags = 3 x_trans = -36}
							{font = fontgrid_title_a1 text = '-' Color = green_4guitar x_trans = -20 y_trans = -4 x_scale = 39 y_scale = 40 flags = 3 x_skew = -75}
							{font = fontgrid_text_a3 text = 'A' Color = blue_4 x_trans = 26 y_trans = -18 x_skew = -42 y_skew = 45 x_scale = 21 y_scale = 40 rot = 5593 flags = 27}
							{font = fontgrid_text_a6 text = 'a' Color = purple_blue_4 x_trans = -20 y_trans = -25 x_skew = -51 x_scale = 150 y_scale = 148 flags = 3 rot = 5653}
							{font = fontgrid_text_a8 text = 'B' Color = green_2guitar a = 50 x_trans = 19 y_trans = 25 x_scale = 82 y_scale = 40 rot = 6283 flags = 11 y_skew = -75}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_026.img` Color = purple_blue_4 x_trans = -27 y_trans = 4 x_scale = 34 flags = 3 y_scale = 5}
							{texture = `tex/models/characters/skater_male/decals/cag_icon033.img` Color = red_4 x_trans = 1 x_scale = 81 y_scale = 40 flags = 3 y_trans = -31}
							{texture = `tex/models/characters/skater_male/decals/cag_plant_003.img` x_trans = -20 y_trans = 58 x_skew = -45 y_skew = 75 x_scale = 101 y_scale = 40 rot = 4963 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_graphics031.img` x_trans = -20 y_trans = 25 x_scale = 10 y_scale = 14 rot = 5683 y_skew = 33 flags = 27}]}]}
			cas_guitar_neck = {desc_id = guitar_neck03
				cap = [{base_tex = `tex/models/car_instruments/guitars/neck_maple_tb_03.dds` material = guitar_neck3_primary diffuse
						pre_layer = [{texture = `tex/models/characters/layers/cag/neck1_inlay_tribal2_d_20.img` flags = 36 Color = grey_5guitar}]}]}
			cas_guitar_head = {desc_id = guitar_head02
				chosen_materials = {material1 = grey_2guitar}
				cap = [{base_tex = `tex/models/car_instruments/guitars/gtr_headtock02_d_01.dds` material = headstock2_primary diffuse
						pre_layer = [{texture = `tex/models/characters/layers/cag/gtr_headtock02_ld_01.img` Color = red_orange_1 flags = 36 a = 55}
							{texture = `tex/models/characters/layers/cag/gtr_headtock02_dtl_04.img` flags = 36}]
						layers = [{texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_027.img` Color = black_1guitar x_trans = -25 y_trans = 2 x_scale = 150 flags = 3 y_scale = 150}
							{texture = `tex/models/characters/skater_male/decals/cag_icons044.img` Color = yellow_1guitar x_trans = -25 y_trans = 2 x_scale = 148 flags = 3 y_scale = 150}
							{texture = `tex/models/characters/skater_male/decals/cag_icon_veggie001.img` Color = yellow_orange_1 x_trans = -25 y_trans = 2 x_scale = 149 y_scale = 150 x_skew = -75 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_graphics032.img` Color = orange_2 x_trans = -25 y_trans = 2 x_scale = 150 flags = 3 y_scale = 150}
							{texture = `tex/models/characters/skater_male/decals/cag_sponsors_vox_01.img` y_trans = 2 x_scale = 26 y_scale = 55 flags = 3 x_trans = 1}
							{font = fontgrid_title_a1 text = 'b' x_trans = -25 y_trans = 2 x_scale = 148 flags = 3 y_scale = 150}
							{font = fontgrid_text_a3 text = 'C' x_trans = -61 y_trans = -13 x_scale = 150 y_scale = 150 flags = 27}
							{font = fontgrid_text_a6 text = 'D' Color = red_1 x_trans = 13 y_trans = -35 y_skew = 27 x_scale = 149 y_scale = 150 flags = 3 x_skew = -33}
							{font = fontgrid_text_a8 text = 'E' Color = yellow_green_1guitar x_trans = -25 y_trans = 2 x_skew = -39 y_skew = 36 x_scale = 150 y_scale = 150 rot = 6073 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_028.img` Color = green_1guitar a = 80 y_trans = 2 x_scale = 147 y_scale = 150 flags = 3 x_trans = 12}
							{texture = `tex/models/characters/skater_male/decals/cag_icons045.img` Color = teal_1 x_trans = -25 y_trans = -43 x_scale = 148 y_scale = 150 rot = 5683 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_icon_veggie002.img` Color = blue_1 y_trans = 1 x_scale = 147 y_scale = 150 flags = 3 x_trans = -42}
							{texture = `tex/models/characters/skater_male/decals/cag_graphics033.img` Color = navy_1 y_trans = 2 x_skew = -75 y_skew = 75 x_scale = 150 y_scale = 150 rot = 5983 flags = 11 x_trans = 18}
							{texture = `tex/models/characters/skater_male/decals/cag_sponsors_wrigleys_01.img` y_trans = -21 x_scale = 26 y_scale = 55 flags = 3 x_trans = -46}
							{font = fontgrid_title_a1 text = 'F' Color = violet_1 y_trans = -8 x_scale = 150 y_scale = 150 flags = 3 x_trans = -46}
							{font = fontgrid_text_a3 text = 'G' Color = red_2 x_trans = -25 y_trans = -21 x_scale = 150 y_scale = 150 flags = 3 x_skew = 63}
							{font = fontgrid_text_a6 text = 'H' Color = red_orange_2 x_trans = -6 y_trans = 2 x_skew = -75 y_skew = -75 x_scale = 150 y_scale = 150 rot = 270 flags = 27}
							{font = fontgrid_text_a8 text = 'I' Color = orange_2 x_trans = -5 y_trans = 2 x_scale = 148 y_scale = 150 x_skew = 63 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_029.img` Color = yellow_2guitar x_trans = -76 y_trans = 2 x_skew = -30 y_skew = -69 x_scale = 150 y_scale = 150 rot = 5503 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_icons046.img` Color = green_2guitar x_trans = -25 y_trans = 2 x_skew = 54 y_skew = 75 x_scale = 150 y_scale = 150 rot = 5563 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_icon_veggie003.img` Color = teal_2 x_trans = -25 y_trans = -75 x_scale = 147 y_scale = 150 rot = 4873 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_graphics034.img` Color = navy_2 x_trans = -25 x_scale = 148 y_scale = 148 flags = 3 y_trans = 48}
							{texture = `tex/models/characters/skater_male/decals/cag_sponsors_zildjian_01.img` y_trans = -33 x_scale = 26 y_scale = 55 flags = 3 x_trans = -35}
							{font = fontgrid_title_a1 text = 'j' Color = violet_2 x_trans = -25 y_trans = -8 x_skew = 39 y_skew = -21 x_scale = 150 y_scale = 150 rot = 6193 flags = 11}
							{font = fontgrid_text_a3 text = 'k' x_trans = -25 y_trans = 31 x_scale = 149 y_scale = 150 flags = 3 Color = red_3}
							{font = fontgrid_text_a6 text = 'L' Color = red_orange_2 x_trans = 5 y_trans = -27 x_skew = -42 y_skew = 63 x_scale = 148 y_scale = 150 rot = 5893 flags = 27}
							{font = fontgrid_text_a8 text = 'm' Color = yellow_3guitar y_trans = 2 x_skew = -27 x_scale = 150 y_scale = 148 x_trans = -43 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_030.img` Color = grey_3guitar x_trans = -25 y_trans = 36 x_skew = -33 y_skew = -21 x_scale = 148 y_scale = 150 rot = 6103 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_icons047.img` Color = yellow_green_3guitar x_trans = -3 y_trans = -13 x_skew = -27 y_skew = -33 x_scale = 147 y_scale = 150 rot = 5953 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_icon_veggie004.img` Color = green_3guitar x_trans = -25 y_trans = -7 x_skew = -75 y_skew = -75 x_scale = 149 y_scale = 150 rot = 5683 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_graphics035.img` Color = teal_3 a = 60 x_trans = -25 y_trans = 2 x_skew = 39 y_skew = 54 x_scale = 150 y_scale = 150 rot = 6043 flags = 27}
							{font = fontgrid_title_a1 text = 'N' Color = teal_3 y_trans = 16 x_skew = 36 x_scale = 150 y_scale = 150 flags = 3 x_trans = -2}
							{font = fontgrid_text_a3 text = 'O' Color = blue_3 x_trans = -39 y_trans = -29 x_skew = 45 y_skew = -63 x_scale = 150 y_scale = 150 rot = 6103 flags = 27}
							{font = fontgrid_text_a6 text = 'p' Color = violet_3 x_trans = -54 y_trans = 13 x_skew = 33 x_scale = 150 y_scale = 150 rot = 6013 flags = 27}
							{font = fontgrid_text_a8 text = 'q' Color = yellow_orange_3 x_trans = -7 x_scale = 150 y_scale = 150 flags = 3 y_trans = -23}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_031.img` Color = orange_3 x_trans = -1 x_skew = -75 y_skew = 75 x_scale = 150 y_scale = 150 rot = 5863 flags = 27 y_trans = -40}
							{texture = `tex/models/characters/skater_male/decals/cag_icons048.img` Color = navy_3 x_trans = -25 y_trans = 2 x_skew = -30 y_skew = -51 x_scale = 150 y_scale = 150 rot = 390 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_icon_veggie005.img` Color = purple_blue_3 x_trans = 45 y_trans = -43 x_skew = 75 x_scale = 150 y_scale = 150 flags = 3 a = 30}
							{texture = `tex/models/characters/skater_male/decals/cag_graphics036.img` Color = red_orange_4 a = 45 x_trans = -25 y_trans = 89 y_skew = -75 x_scale = 148 y_scale = 150 rot = 180 flags = 3 x_skew = -33}
							{font = fontgrid_title_a1 text = 'r' Color = teal_4 x_trans = -24 y_trans = -42 x_scale = 150 y_scale = 150 flags = 3 rot = 300}]}]}
			cas_guitar_pickguards = {desc_id = gtr_body3_pickg01}
			cas_guitar_bridges = {desc_id = gtr_hardware01a
				chosen_materials = {material1 = grey_2guitar}}
			cas_guitar_knobs = {desc_id = gtr3_knob_type5_03}
			cas_guitar_pickups = {desc_id = gtr_pickup_type1_blk_3
				chosen_materials = {material1 = black_1guitar}}
			cas_guitar_strings = {desc_id = super_slinky}
			cas_guitar_highway = {desc_id = judyhighway}
			cas_bass_body = {desc_id = cab_body_bandera
				cap = [{base_tex = `tex\models\car_instruments\guitars\gtr_body_style17_d.dds` material = guitar_body_bandera_primary diffuse
						pre_layer = [{texture = `tex/models/characters/layers/cag/gtr_body_style17_ld_chrb.img` flags = 4}
							{texture = `tex/models/characters/layers/cag/gtr_body_style17_dtl_pin.img` flags = 4}]
						layers = [{texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_055.img` a = 40 x_trans = -44 y_trans = 45 x_scale = 32 y_scale = 95 x_skew = -75 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapeoutline_016.img` Color = yellow_green_1guitar a = 60 x_trans = 62 y_trans = 35 x_skew = -39 y_skew = -36 x_scale = 29 y_scale = 59 rot = 4183 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_019.img` Color = green_1guitar a = 60 x_trans = -60 y_trans = -30 x_skew = -36 y_skew = 33 x_scale = 118 y_scale = 125 rot = 1230 flags = 27}
							{texture = `tex/models/characters/skater_male/cag_proto/cag_sticker01.img` Color = teal_1 a = 60 x_trans = -26 x_scale = 71 y_scale = 150 flags = 3 y_trans = -47}
							{texture = `tex/models/characters/skater_male/decals/cag_icon_veggie006.img` Color = blue_1 a = 45 x_trans = -45 y_trans = 20 x_skew = -33 y_skew = 42 x_scale = 77 y_scale = 75 rot = 6193 flags = 11}
							{texture = `tex/models/characters/skater_male/decals/cag_icon035.img` Color = navy_1 a = 60 x_trans = -45 y_trans = 43 x_skew = 48 y_skew = 33 x_scale = 85 y_scale = 97 rot = 180 flags = 11}
							{texture = `tex/models/characters/skater_male/decals/cag_sponsors_zildjian_01.img` y_trans = -19 x_scale = 40 y_scale = 80 flags = 3 x_trans = -14}
							{font = fontgrid_title_a1 text = '-' Color = violet_1 a = 100 x_trans = -32 y_trans = -37 x_skew = -33 y_skew = 75 x_scale = 40 y_scale = 62 rot = 4783 flags = 27}
							{font = fontgrid_text_a3 text = 'A' Color = red_1 a = 70 x_trans = 13 y_trans = 53 x_skew = -39 y_skew = -75 x_scale = 110 y_scale = 122 flags = 3 rot = 6253}
							{font = fontgrid_text_a6 text = ':' x_trans = -26 y_trans = -3 x_scale = 40 y_scale = 80 flags = 3 rot = 720}
							{font = fontgrid_text_a8 text = 'a' x_trans = -66 x_scale = 40 y_scale = 80 flags = 3 y_trans = -32}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_054.img` x_trans = -26 y_trans = -3 x_scale = 77 y_scale = 113 flags = 3 Color = red_orange_1}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapeoutline_015.img` Color = yellow_orange_1 x_trans = -44 y_trans = -16 x_scale = 51 y_scale = 80 flags = 3 y_skew = 75}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_018.img` a = 80 x_trans = -7 y_trans = 44 x_scale = 63 y_scale = 145 flags = 3 Color = yellow_1guitar}
							{texture = `tex/models/characters/skater_male/decals/cag_icons058.img` Color = yellow_green_2guitar x_trans = -26 y_trans = -3 x_skew = -27 x_scale = 116 y_scale = 22 flags = 3 rot = 1380}
							{texture = `tex/models/characters/skater_male/decals/cag_icon_veggie005.img` Color = navy_2 a = 40 x_trans = -26 y_trans = -3 x_skew = -45 y_skew = -39 x_scale = 121 y_scale = 144 flags = 3 rot = 510}
							{texture = `tex/models/characters/skater_male/decals/cag_icon032.img` Color = yellow_orange_3 a = 55 x_trans = -26 y_trans = -3 x_scale = 106 y_scale = 101 rot = 1800 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_sponsors_wrigleys_01.img` y_trans = 10 x_scale = 40 y_scale = 80 flags = 3 x_trans = -43}
							{font = fontgrid_title_a1 text = '`' y_trans = -3 x_skew = -51 y_skew = 51 x_scale = 40 y_scale = 80 rot = 5953 flags = 3 x_trans = 9}
							{font = fontgrid_text_a3 text = 'B' Color = yellow_green_3guitar a = 25 x_trans = -82 y_trans = -3 x_scale = 40 y_scale = 80 flags = 3 rot = 4303}
							{font = fontgrid_text_a6 text = ')' Color = purple_blue_3 y_trans = -3 x_scale = 148 y_scale = 149 flags = 3 x_trans = -47}
							{font = fontgrid_text_a8 text = 'b' Color = red_3 x_trans = -27 x_skew = -51 x_scale = 148 y_scale = 150 rot = 5833 flags = 3 y_trans = 29}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_053.img` Color = grey_4guitar x_trans = -26 y_trans = -3 x_skew = -75 y_skew = -75 x_scale = 1 y_scale = 1 rot = 450 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapeoutline_014.img` Color = green_4guitar a = 70 x_trans = -26 y_trans = -3 x_skew = 75 y_skew = 60 x_scale = 149 y_scale = 150 rot = 6013 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_017.img` Color = teal_4 x_trans = -37 y_trans = 37 x_scale = 74 y_scale = 80 flags = 3 a = 40}
							{texture = `tex/models/characters/skater_male/decals/cag_icons057.img` x_trans = -26 y_trans = -14 x_skew = -21 y_skew = 36 x_scale = 37 y_scale = 51 rot = 5653 flags = 3 Color = yellow_4guitar}
							{texture = `tex/models/characters/skater_male/decals/cag_icon_veggie004.img` Color = black_1guitar y_trans = 1 x_scale = 64 y_scale = 80 flags = 3 x_trans = 17}
							{texture = `tex/models/characters/skater_male/decals/cag_elemental007.img` Color = purple_blue_2 x_trans = -32 x_scale = 69 y_scale = 76 flags = 3 y_trans = -29}
							{texture = `tex/models/characters/skater_male/decals/cag_sponsors_vox_01.img` x_trans = 2 x_scale = 40 y_scale = 80 flags = 3 y_trans = 17}
							{font = fontgrid_title_a1 text = 'B' x_trans = -26 y_trans = -3 x_scale = 40 y_scale = 80 flags = 3 a = 0}
							{font = fontgrid_text_a3 text = '(' Color = purple_blue_4 x_trans = -59 y_trans = 23 x_skew = -33 y_skew = -42 x_scale = 40 y_scale = 80 rot = 5983 flags = 27}
							{font = fontgrid_text_a6 text = 'c' Color = red_orange_4 x_trans = -6 y_trans = -24 x_skew = -36 y_skew = -33 x_scale = 40 y_scale = 80 rot = 5923 flags = 19}
							{font = fontgrid_text_a8 text = 'C' Color = yellow_orange_4 y_trans = -30 x_skew = -66 x_scale = 148 y_scale = 150 flags = 3 x_trans = -40}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_052.img` Color = violet_1 x_trans = -26 y_trans = -11 x_skew = -54 y_skew = -21 x_scale = 58 y_scale = 110 rot = 6103 flags = 11}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapeoutline_013.img` Color = black_1guitar x_trans = 1 y_trans = -11 x_scale = 28 y_scale = 113 flags = 3 a = 75}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_016.img` a = 55 x_trans = -26 y_trans = -3 x_scale = 90 y_scale = 43 flags = 3 Color = yellow_orange_2}
							{texture = `tex/models/characters/skater_male/decals/cag_graphics073.img` x_trans = -8 y_trans = -27 x_skew = -30 y_skew = 51 x_scale = 24 y_scale = 29 rot = 480 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_icon_veggie003.img` Color = blue_3 x_trans = -13 x_skew = -6 x_scale = 20 y_scale = 42 flags = 3 y_trans = 25}
							{texture = `tex/models/characters/skater_male/decals/cag_elemental006.img` x_trans = -29 y_trans = -3 x_scale = 149 y_scale = 91 rot = 1590 flags = 3 Color = yellow_orange_4}
							{texture = `tex/models/characters/skater_male/decals/cag_sponsors_regaltip_01.img` y_trans = -28 x_scale = 40 y_scale = 80 flags = 3 x_trans = -15}]}]}
			cas_bass_neck = {desc_id = cab_neck_bn1a
				cap = [{base_tex = `tex/models/car_instruments/bass/cab_neck_01_maple_d_mls.dds` material = cab_neck_bn1a_neck diffuse
						pre_layer = [{texture = `tex/models/characters/layers/cab/cab_nek_lyrmpl_blk_wht.img` flags = 4 Color = grey_1}]}]}
			cas_bass_head = {desc_id = cab_head_bhphnq01
				cap = [{base_tex = `tex/models/car_instruments/bass/cab_head_bh8a.dds` material = cab_head_phunquie01_headstock diffuse
						pre_layer = [{texture = `tex/models/characters/layers/cag/all_clear.img` flags = 36}
							{texture = `tex/models/characters/layers/cab/cab_head_bh8a_dtl_04.img` flags = 36}]
						layers = [{texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_001.img` Color = black_1guitar x_trans = -1 y_trans = -14 y_skew = -21 x_scale = 1 y_scale = 71 rot = 5833 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapeoutline_001.img` Color = yellow_5guitar a = 75 x_trans = -10 y_trans = 2 x_skew = -30 y_skew = -9 x_scale = 149 y_scale = 1 flags = 3 rot = 5503}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_001.img` Color = yellow_orange_1 x_trans = -26 y_trans = -14 x_skew = -75 y_skew = 27 x_scale = 114 y_scale = 45 rot = 6013 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_icon009.img` x_trans = -42 y_trans = -34 x_scale = 28 y_scale = 62 Color = red_orange_5 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_icon_mammal001.img` Color = red_1 x_trans = -45 x_skew = 75 y_skew = -69 x_scale = 20 y_scale = 45 rot = 5323 flags = 27 y_trans = 9}
							{texture = `tex/models/characters/skater_male/decals/cag_graphics018.img` Color = violet_5 a = 60 y_trans = -31 x_scale = 39 y_scale = 108 flags = 3 x_trans = -40}
							{texture = `tex/models/characters/skater_male/decals/cag_sponsors_mackie_01.img` x_trans = -26 x_scale = 20 y_scale = 45 flags = 3 y_trans = 8}
							{texture = `tex/models/characters/skater_male/decals/cag_sponsors_gcaxesmith_01.img` y_trans = -3 x_scale = 20 y_scale = 45 flags = 3 x_trans = -4}
							{font = fontgrid_title_a1 text = 'k' Color = purple_blue_1 x_trans = -26 y_trans = -14 x_skew = 21 x_scale = 115 y_scale = 86 rot = 6193 flags = 11}
							{font = fontgrid_text_a3 text = 'N' y_trans = -25 x_scale = 4 y_scale = 3 flags = 3 x_trans = 5}
							{font = fontgrid_text_a6 text = '&' Color = navy_5 a = 60 x_trans = 25 y_trans = -52 x_skew = 45 y_skew = 15 x_scale = 47 y_scale = 45 rot = 6073 flags = 19}
							{font = fontgrid_text_a8 text = 'U' Color = teal_1 y_trans = -14 x_skew = -69 x_scale = 42 y_scale = 45 rot = 4663 flags = 11 x_trans = -1}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_013.img` Color = green_5guitar x_trans = 2 y_trans = 0 x_skew = 15 x_scale = 74 flags = 3 y_scale = 1}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapeoutline_007.img` y_trans = -2 x_scale = 23 y_scale = 30 flags = 3 x_trans = -54}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_011.img` Color = yellow_green_1guitar x_trans = -40 x_scale = 82 y_scale = 6 flags = 3 y_trans = -37}
							{texture = `tex/models/characters/skater_male/decals/cag_icon019.img` Color = grey_4guitar x_trans = -26 y_trans = -15 x_skew = -75 y_skew = 75 x_scale = 20 y_scale = 45 rot = 4783 flags = 19}
							{texture = `tex/models/characters/skater_male/decals/cag_plant_001.img` Color = yellow_1guitar x_trans = -26 y_trans = -14 x_scale = 134 y_scale = 148 flags = 3 a = 35}
							{texture = `tex/models/characters/skater_male/decals/cag_banners010.img` Color = yellow_orange_5 a = 95 x_trans = -26 x_scale = 109 y_scale = 57 flags = 3 y_trans = 15}
							{texture = `tex/models/characters/skater_male/decals/cag_sponsors_wrigleys_01.img` y_trans = -14 x_scale = 20 y_scale = 45 flags = 3 x_trans = -45}
							{font = fontgrid_title_a1 text = 'v' x_trans = -26 y_trans = -14 x_scale = 20 y_scale = 45 rot = 4843 flags = 27}
							{font = fontgrid_text_a3 text = 'o' x_trans = -53 x_scale = 20 y_scale = 45 flags = 3 y_trans = 35}
							{font = fontgrid_text_a6 text = '4' Color = yellow_green_1guitar a = 55 x_trans = 4 y_trans = 6 x_scale = 7 y_scale = 45 flags = 3 x_skew = -75}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_046.img` Color = orange_1 y_trans = -33 x_scale = 30 y_scale = 56 flags = 3 x_trans = -46}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapeoutline_008.img` Color = red_orange_5 y_trans = 5 x_skew = 51 x_scale = 106 y_scale = 65 flags = 3 x_trans = 19}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_012.img` Color = red_1 x_trans = -47 x_scale = 40 y_scale = 67 flags = 3 y_trans = 3}
							{texture = `tex/models/characters/skater_male/decals/cag_icon022.img` Color = violet_5 x_trans = -2 y_trans = 8 x_skew = -27 y_skew = 39 x_scale = 113 y_scale = 73 rot = 5953 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_icon_insect003.img` Color = purple_blue_1 y_trans = -22 x_skew = 75 x_scale = 20 y_scale = 67 rot = 5473 flags = 3 x_trans = -41}
							{texture = `tex/models/characters/skater_male/decals/cag_banners009.img` Color = navy_5 a = 50 x_trans = -43 x_scale = 71 y_scale = 45 flags = 3 y_trans = 29}
							{texture = `tex/models/characters/skater_male/decals/cag_sponsors_line6_01.img` y_trans = 6 x_scale = 20 y_scale = 45 flags = 3 x_trans = -3}
							{font = fontgrid_title_a1 text = 'F' x_trans = -26 x_scale = 20 y_scale = 45 flags = 3 y_trans = -99}
							{font = fontgrid_text_a8 text = '(' a = 15 y_trans = -14 x_scale = 8 y_scale = 18 flags = 3 x_trans = -100}
							{font = fontgrid_text_a3 text = '-' x_trans = 99 x_scale = 20 y_scale = 45 flags = 3 y_trans = 99}
							{font = fontgrid_text_a6 text = 'G' x_trans = -26 y_trans = -14 y_skew = 75 x_scale = 20 y_scale = 45 rot = 2130 x_skew = 75 flags = 27}
							{font = fontgrid_text_a8 text = '*' Color = teal_5 a = 65 x_trans = 57 y_trans = -32 x_scale = 70 flags = 3 y_scale = 84}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_018.img` Color = yellow_green_3guitar a = 40 x_trans = -26 y_trans = -14 x_scale = 41 y_scale = 89 flags = 3 y_skew = 75}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapeoutline_012.img` Color = grey_2guitar x_trans = -12 y_trans = 29 x_skew = -48 y_skew = -45 x_scale = 62 y_scale = 68 rot = 660 flags = 11}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_009.img` Color = navy_3 x_trans = -12 y_trans = -3 x_scale = 45 y_scale = 54 flags = 3 a = 30}
							{texture = `tex/models/characters/skater_male/decals/cag_icon041.img` Color = black_1guitar x_trans = -26 x_skew = -33 x_scale = 20 y_scale = 115 rot = 5653 flags = 3 y_trans = 26}
							{texture = `tex/models/characters/skater_male/decals/cag_icon_veggie003.img` x_trans = -11 x_skew = 75 y_skew = -48 x_scale = 20 y_scale = 45 rot = 2550 flags = 27 y_trans = -13}
							{texture = `tex/models/characters/skater_male/decals/cag_elemental003.img` Color = blue_3 x_trans = -26 y_trans = -14 x_scale = 78 y_scale = 45 flags = 3 rot = 930}]}]}
			cas_bass_pickguards = {desc_id = cab_phnq_pg002
				cap = [{base_tex = `tex/models/car_instruments/bass/cab_phnq_pg001b.dds` material = cab_phnq_pg002_primary diffuse
						pre_layer = [{texture = `tex/models/characters/layers/cab/cab_phnq_pg001_tort.img` flags = 36}]}]}
			cas_bass_pickups = {desc_id = cab_bumbl_pickup_a3}
			cas_bass_bridges = {desc_id = cab_bridge_bb2a}
			cas_bass_knobs = {desc_id = cab_knob_phunq10}
			cas_bass_strings = {desc_id = regular_slinky}
			cas_bass_highway = {desc_id = caseyhighway}
			cas_drums = {desc_id = basic
				cap = [{base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1.dds` material = cad_drums_01_primary diffuse
						pre_layer = [{texture = `tex/models/characters/layers/cadrm/drumshell_ds_51.img` flags = 32}]}
					{base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a.dds` material = cad_drums_01_bassdrum diffuse
						pre_layer = [{texture = `tex/models/characters/layers/cadrm/bass_skin_ds_42.img` flags = 4}]
						layers = [{texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_021.img` Color = yellow_orange_2 x_trans = -32 x_scale = 110 y_scale = 90 flags = 3 y_trans = -17}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_009.img` Color = orange_2 a = 65 y_trans = -38 x_skew = 45 y_skew = -21 x_scale = 124 rot = 540 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_015.img` Color = red_orange_2 a = 100 x_trans = -27 y_trans = -10 x_skew = -21 y_skew = 27 x_scale = 90 y_scale = 128 rot = 5983 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_016.img` Color = red_2 a = 85 x_trans = 35 y_trans = -19 x_skew = -24 x_scale = 74 y_scale = 79 flags = 3 y_skew = -33}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapeoutline_013.img` Color = violet_2 y_trans = -38 x_skew = 45 y_skew = 54 x_scale = 20 y_scale = 25 rot = 4153 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapeoutline_015.img` Color = purple_blue_2 y_trans = 21 x_scale = 106 flags = 3 x_trans = 34}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapeoutline_002.img` Color = navy_2 a = 65 x_trans = -17 y_trans = 54 x_skew = -42 y_skew = -24 x_scale = 39 y_scale = 126 rot = 360 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapeoutline_003.img` Color = teal_2 a = 80 x_trans = 11 y_trans = -58 x_skew = 75 y_skew = -75 x_scale = 109 y_scale = 129 rot = 5233 flags = 11}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_001.img` Color = green_2guitar a = 70 x_trans = 36 y_trans = 8 x_skew = -21 y_skew = -21 x_scale = 22 y_scale = 91 rot = 840 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_016.img` Color = yellow_green_2guitar a = 75 x_trans = -16 y_trans = -16 x_scale = 146 y_scale = 1 rot = 4363 flags = 19}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_004.img` Color = green_4guitar y_trans = -30 y_skew = 36 rot = 5533 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_primitiveshapegradient_008.img` Color = teal_3 a = 70 x_trans = -32 y_trans = -53 x_skew = 42 y_skew = 69 x_scale = 115 y_scale = 119 rot = 3343 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_icon027.img` Color = blue_3 a = 80 x_trans = -48 y_trans = 56 x_skew = 21 y_skew = -33 x_scale = 110 y_scale = 111 rot = 4513 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_icon026.img` Color = navy_3 a = 70 x_trans = 38 y_trans = -26 x_scale = 126 y_scale = 123 flags = 3 rot = 1410}
							{texture = `tex/models/characters/skater_male/decals/cag_icons043.img` x_trans = 8 x_skew = -69 y_skew = -57 x_scale = 54 y_scale = 48 rot = 720 flags = 11}
							{texture = `tex/models/characters/skater_male/decals/cag_icons050.img` x_trans = -33 x_scale = 74 y_scale = 120 flags = 3 y_trans = -68}
							{texture = `tex/models/characters/skater_male/decals/cag_icon_creature001.img` Color = purple_blue_3 a = 65 x_trans = 0 y_trans = 46 x_skew = -51 y_skew = 75 x_scale = 42 y_scale = 45 flags = 27 rot = 3030}
							{texture = `tex/models/characters/skater_male/decals/cag_plant_003.img` x_scale = 60 y_scale = 43 flags = 3 y_trans = -47}
							{texture = `tex/models/characters/skater_male/decals/cag_icon_veggie006.img` Color = violet_3 a = 50 x_skew = 75 y_skew = -75 x_scale = 148 y_scale = 149 flags = 11 rot = 5893}
							{texture = `tex/models/characters/skater_male/decals/cag_icon_veggie001.img` Color = red_3 a = 65 x_trans = -28 y_trans = 8 y_skew = -69 x_scale = 1 y_scale = 1 rot = 5923 flags = 11}
							{texture = `tex/models/characters/skater_male/decals/cag_graphics110.img` x_trans = -52 rot = 5323 flags = 3 y_skew = -66}
							{texture = `tex/models/characters/skater_male/decals/cag_graphics105.img` Color = yellow_3guitar a = 65 x_trans = 56 y_trans = -18 x_scale = 126 flags = 3 y_scale = 150}
							{texture = `tex/models/characters/skater_male/decals/cag_graphics091.img` x_scale = 90 y_scale = 58 y_trans = 45 flags = 19}
							{texture = `tex/models/characters/skater_male/decals/cag_graphics046.img` x_skew = 42 x_scale = 69 y_scale = 51 rot = 510 y_skew = 72 flags = 27}
							{texture = `tex/models/characters/skater_male/decals/cag_graphics039.img` Color = navy_3 y_trans = -36 x_skew = -30 y_skew = 21 x_scale = 143 y_scale = 17 rot = 270 flags = 11}
							{texture = `tex/models/characters/skater_male/decals/cag_sponsors_kfc_01.img` y_trans = 31 flags = 3 x_trans = -37}
							{texture = `tex/models/characters/skater_male/decals/cag_sponsors_emg_01.img` x_trans = 43 flags = 3 y_trans = -24}
							{texture = `tex/models/characters/skater_male/decals/cag_sponsors_coke_01.img` y_trans = -30 flags = 3 x_trans = -33}
							{font = fontgrid_title_a1 text = 'z' Color = yellow_green_4guitar x_trans = 43 flags = 3 x_skew = -54}
							{font = fontgrid_title_a1 text = 'Z' Color = green_3guitar y_trans = 38 x_skew = 63 y_skew = -18 rot = 6133 flags = 27}
							{font = fontgrid_title_a1 text = 'y' x_trans = -43 flags = 3 Color = grey_3guitar}
							{font = fontgrid_text_a3 text = '9' Color = yellow_4guitar y_trans = -42 x_skew = 75 y_skew = -33 rot = 6073 flags = 19}
							{font = fontgrid_text_a3 text = '8' Color = yellow_orange_3 x_trans = 30 y_trans = 27 x_scale = 49 flags = 3 y_scale = 39}
							{font = fontgrid_text_a3 text = 'E' Color = red_3 a = 30 x_trans = -30 y_trans = 29 rot = 5833 flags = 11}
							{font = fontgrid_text_a3 text = 'm' Color = purple_blue_4 x_trans = -26 y_trans = -33 x_scale = 108 y_scale = 119 flags = 3 x_skew = -45}
							{font = fontgrid_text_a6 text = ':' a = 85 x_trans = 28 y_trans = -30 rot = 450 flags = 27 Color = navy_4}
							{font = fontgrid_text_a6 text = 'C' Color = green_2guitar x_trans = -24 y_trans = -3 x_scale = 90 y_scale = 10 flags = 3 x_skew = -48}
							{font = fontgrid_text_a6 text = '5' x_trans = 26 y_trans = 7 x_skew = -75 x_scale = 69 rot = 4693 flags = 3 Color = teal_5}
							{font = fontgrid_text_a8 text = '*' Color = red_5 x_trans = -14 y_trans = -28 x_skew = 24 y_skew = -27 x_scale = 3 y_scale = 4 rot = 6073 flags = 27}
							{font = fontgrid_text_a8 text = 'K' Color = black_1guitar x_trans = 6 y_trans = -3 x_skew = 72 y_skew = -75 x_scale = 143 y_scale = 150 rot = 4243 flags = 27}]}]}
			cas_drums_sticks = {desc_id = drumsticks1}
			cas_drums_highway = {desc_id = judyhighway}
			cas_mic = {desc_id = mic_standard}
			cas_mic_stand = {desc_id = mic_stand_metal}
		}
	}
	add_new_custom_profile Profile = <Profile> savegame = <savegame>
	i = (<i> + 1)
	repeat 4
endscript
