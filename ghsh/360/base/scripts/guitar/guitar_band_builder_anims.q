band_builder_anims = {
}

script band_anim_reset_loading 
	printf \{'band_anim_reset_loading'}
	Change \{band_builder_anims = {
		}}
endscript

script band_anim_set_star_power_anim 
	RequireParams \{[
			star_power_anim
		]
		all}
	Change band_builder_anims = {($band_builder_anims) starpower = <star_power_anim>}
endscript

script band_anim_check_star_power_anim 
	if StructureContains \{structure = $band_builder_anims
			starpower}
		return true star_power_anim = (($band_builder_anims).starpower)
	endif
	return \{FALSE}
endscript

script band_anim_set_appearance 
	RequireParams \{[
			info_struct
			appearance_checksum
		]
		all}
	struct = ($band_builder_anims)
	AddParam Name = <info_struct> structure_name = struct value = <appearance_checksum>
	Change band_builder_anims = <struct>
endscript

script band_anim_check_appearance 
	RequireParams \{[
			info_struct
			appearance_checksum
		]
		all}
	if StructureContains structure = $band_builder_anims <info_struct>
		if (<appearance_checksum> = (($band_builder_anims).<info_struct>))
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script band_ensure_flushed_frontend_pak 
	RequireParams \{[
			pak
		]
		all}
	if mpm_find_existing_loaded_pak pak = <pak>
		mpm_flush_all_paks_eachlink checksum = <links>
	endif
endscript

script band_load_anim_paks 
	is_training = 0
	band_ensure_flushed_frontend_pak \{pak = frontend_anims_guit1}
	band_ensure_flushed_frontend_pak \{pak = frontend_anims_guit2}
	band_ensure_flushed_frontend_pak \{pak = frontend_anims_sing}
	band_ensure_flushed_frontend_pak \{pak = frontend_anims_drum}
	GetArraySize \{$band_builder_current_setup}
	if (<array_Size> > 0)
		i = 0
		begin
		RemoveParameter \{player_status}
		if StructureContains structure = ($band_builder_current_setup [<i>]) player_status
			player_status = (($band_builder_current_setup [<i>]).player_status)
		endif
		band_load_single_anim_pak {
			character_id = (($band_builder_current_setup [<i>]).character_id)
			part = (($band_builder_current_setup [<i>]).real_part)
			Name = (($band_builder_current_setup [<i>]).Name)
			savegame = (($band_builder_current_setup [<i>]).savegame)
			async = <async>
			player_status = <player_status>
		}
		if ((($band_builder_current_setup [<i>]).character_id) = emptyguy)
			is_training = 1
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	if (($is_attract_mode = 1) || (<is_training> = 1))
		Change \{group_starpower = None}
		return
	endif
	if NOT band_anim_check_star_power_anim
		getrandomarrayelement ($starpower_anim_sets)
		GetArraySize \{$starpower_anim_sets}
		if (<array_Size> = 0)
			Change \{group_starpower = None}
			return
		endif
		GetRandomValue Name = newindex integer a = 0 b = (<array_Size> - 1)
		printf channel = AnimInfo qs(0x28598bf2) a = ($starpower_anim_sets [<index>]) donotresolve
		starpower_pak = ($starpower_anim_sets [<index>])
		band_anim_set_star_power_anim star_power_anim = <starpower_pak>
	else
		printf 'Keeping star power pak from previous song %s' s = <starpower_pak>
		starpower_pak = <star_power_anim>
	endif
	ExtendCrc <starpower_pak> '_clip' out = starpower_clip
	Change group_starpower = <starpower_clip>
	printf channel = AnimInfo qs(0x0d1bd8db) a = <starpower_pak> donotresolve
	mpm_load_pak pak = <starpower_pak> owner = band_anim_pak async = <async> links = anim_starpower_pakman_links
endscript
group_starpower = None

script band_load_single_anim_pak 
	if ($game_mode = training)
		return
	endif
	get_musician_profile_struct_by_id id = <character_id> savegame = <savegame>
	ExtendCrc <Name> '_Info' out = info_struct
	if get_body_key_from_appearance key = anim_struct appearance = (<profile_struct>.appearance)
		if get_anim_struct_member anim_struct = <anim_struct> loading_into_song = ($current_song) member = <part>
			if StructureContains structure = <anim_struct_member> pak
				if NOT ($guitar_character_loops_state = loop_paks_enabled)
					ScriptAssert \{qs(0xa4f1d90f)}
				endif
				mpm_load_pak pak = (<anim_struct_member>.pak) owner = band_anim_pak async = <async>
			elseif ($guitar_character_loops_state = loop_paks_enabled)
				ScriptAssert 'No animation pak specified for %s' s = <Name>
			endif
		endif
	endif
	generatechecksumfromstruct struct = (<profile_struct>.appearance)
	appearance_checksum = <structure_checksum>
	if NOT band_anim_check_appearance appearance_checksum = <appearance_checksum> info_struct = <info_struct>
		printf 'New anims for %s' s = <info_struct>
		printstruct ($band_builder_anims)
		win_anim_name = None
		lose_anim_name = None
		intro_anim_name = None
		printf \{qs(0x6a18e534)}
		if get_cas_custom_anim instrument = <part> appearance = (<profile_struct>.appearance) part = cas_win_anim
			win_anim_name = <custom_anim_name>
		else
			printf channel = AnimInfo qs(0x8bb886a5) a = <character_id>
		endif
		printf \{qs(0x28936e7f)}
		if get_cas_custom_anim instrument = <part> appearance = (<profile_struct>.appearance) part = cas_lose_anim
			lose_anim_name = <custom_anim_name>
		else
			printf channel = AnimInfo qs(0x8f3700ed) a = <character_id>
		endif
		printf \{qs(0x1a80e2d9)}
		if get_cas_custom_anim instrument = <part> appearance = (<profile_struct>.appearance) part = cas_intro_anim
			intro_anim_name = <custom_anim_name>
			printf qs(0x1ca6b569) a = <intro_anim_name>
		else
			printf qs(0xcb8864a5) a = <character_id>
		endif
		printf \{qs(0x7f115927)}
		if NOT GotParam \{player_status}
			if NOT is_current_band_metallica
				band_get_human_players
				GetArraySize <human_players>
				if (<array_Size> > 0)
					pointing_anim_set = default_pointing_anims
					get_key_from_appearance key = pointing_anim_set appearance = (<profile_struct>.appearance)
					getrandomarrayelement <human_players>
					point_to = <element>
					if get_pointing_anim struct = ($<pointing_anim_set>) Type = win_anims from = <part> to = <point_to>
						win_anim_name = <pointing_anim>
					endif
					getrandomarrayelement <human_players>
					point_to = <element>
					if get_pointing_anim struct = ($<pointing_anim_set>) Type = lose_anims from = <part> to = <point_to>
						lose_anim_name = <pointing_anim>
					endif
				endif
			endif
		endif
		if (($is_attract_mode = 1) || (<character_id> = emptyguy))
			win_anim_name = None
			lose_anim_name = None
			if (<character_id> = emptyguy)
				intro_anim_name = None
			endif
		endif
		Change structurename = <info_struct> intro_anim_name = <intro_anim_name>
		Change structurename = <info_struct> win_anim_name = <win_anim_name>
		Change structurename = <info_struct> lose_anim_name = <lose_anim_name>
		band_anim_set_appearance appearance_checksum = <appearance_checksum> info_struct = <info_struct>
	else
		printf 'Avoiding rerandomizing anims for %s' s = <info_struct>
		win_anim_name = ($<info_struct>.win_anim_name)
		lose_anim_name = ($<info_struct>.lose_anim_name)
		intro_anim_name = ($<info_struct>.intro_anim_name)
	endif
	printf 'win_anim_name = %w' w = <win_anim_name>
	printf 'lose_anim_name = %w' w = <lose_anim_name>
	printf 'intro_anim_name = %w' w = <intro_anim_name>
	if NOT (<win_anim_name> = None)
		mpm_load_pak pak = <win_anim_name> owner = band_anim_pak async = <async> links = anim_intro_win_pakman_links
	endif
	if NOT (<lose_anim_name> = None)
		mpm_load_pak pak = <lose_anim_name> owner = band_anim_pak async = <async> links = anim_lose_pakman_links
	endif
	if NOT (<intro_anim_name> = None)
		mpm_load_pak pak = <intro_anim_name> owner = band_anim_pak async = <async> links = anim_intro_win_pakman_links
	endif
endscript

script get_pointing_anim 
	if StructureContains structure = <struct> <Type>
		struct = (<struct>.<Type>)
		if StructureContains structure = <struct> <from>
			struct = (<struct>.<from>)
			if StructureContains structure = <struct> <to>
				return true pointing_anim = (<struct>.<to>)
			endif
		endif
	endif
	return \{FALSE}
endscript

script grab_custom_anim_name_from_key 
	RequireParams \{[
			part
			desc_id
			key
			who
		]
		all}
	getactualcasoptionstruct part = <part> desc_id = <desc_id>
	if (($game_mode = p2_battle) || ($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff) || ($boss_battle = 1))
		if GotParam \{headtohead_anim_name}
			if NOT (<who> = drummer)
				printf 'headtohead_anim_name = %s' s = <headtohead_anim_name>
				key = headtohead_anim_name
			endif
		endif
	endif
	if GotParam <key>
		custom_anim_name = (<...>.<key>)
	endif
	if GotParam \{transition_override}
		transition_gettransitionspecificanim Type = <transition_override> part = <part> key = <key> who = <who>
	endif
	if NOT GotParam \{custom_anim_name}
		printf 'Could not find key %p %d %k' p = <part> d = <desc_id> k = <key>
		return \{FALSE}
	endif
	if IsArray <custom_anim_name>
		getrandomarrayelement <custom_anim_name>
		custom_anim_name = <element>
	endif
	return true custom_anim_name = <custom_anim_name>
endscript

script get_cas_custom_anim 
	resolvebodyspecificpartinappearance part = <part> appearance = <appearance>
	switch <instrument>
		case guitar
		who = GUITARIST
		case bass
		who = BASSIST
		case drum
		who = drummer
		case vocals
		who = singer
		case rhythm
		who = rhythm
		default
		return \{FALSE}
	endswitch
	ExtendCrc <who> '_anim_name' out = key
	if StructureContains structure = <appearance> <part>
		if grab_custom_anim_name_from_key part = <part> desc_id = (<appearance>.<part>.desc_id) key = <key> who = <who>
			return true custom_anim_name = <custom_anim_name>
		endif
	endif
	if NOT GotParam \{custom_anim_name}
		printf 'Profile doesnt have custom anim %p specified' p = <part> donotresolve
		begin
		getrandomarrayelement ($<part>)
		if NOT StructureContains structure = <element> hidden
			if grab_custom_anim_name_from_key part = <part> desc_id = (<element>.desc_id) key = <key> who = <who>
				return true custom_anim_name = <custom_anim_name>
			endif
		endif
		repeat 50
	endif
	return \{FALSE}
endscript

script band_start_anims 
	if ($game_mode = training)
		return
	endif
	GetArraySize \{$band_builder_current_setup}
	if (<array_Size> > 0)
		i = 0
		begin
		part = (($band_builder_current_setup [<i>]).part)
		real_part = (($band_builder_current_setup [<i>]).real_part)
		Name = (($band_builder_current_setup [<i>]).Name)
		character_id = (($band_builder_current_setup [<i>]).character_id)
		savegame = (($band_builder_current_setup [<i>]).savegame)
		get_musician_profile_struct_by_id id = <character_id> savegame = <savegame>
		params = {
			Name = <Name>
			character_id = <character_id>
			instrument = <real_part>
			loading_into_song = ($current_song)
			savegame = <savegame>
			profile_struct = <profile_struct>
		}
		start_anims = ($band_builder_part_constants.<real_part>.start_anims)
		printf channel = AnimInfo qs(0xfe6a8329) a = <Name>
		<start_anims> <params>
		i = (<i> + 1)
		repeat <array_Size>
	endif
	band_restartidles
endscript

script band_stop_anims 
	GetArraySize \{$band_builder_current_setup}
	if (<array_Size> > 0)
		i = 0
		begin
		Name = (($band_builder_current_setup [<i>]).Name)
		if CompositeObjectExists Name = <Name>
			<Name> :obj_killallspawnedscripts
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	bandmanager_removeallcharacters
endscript

script band_unload_anim_paks 
	mpm_object_unload_paks \{owner = band_anim_pak}
endscript
