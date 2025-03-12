band_builder_anims = {
}

script band_anim_reset_loading 
	printf \{channel = animinfo
		'band_anim_reset_loading'}
	change \{band_builder_anims = {
		}}
endscript

script band_anim_set_star_power_anim 
	requireparams \{[
			star_power_anim
		]
		all}
	change band_builder_anims = {($band_builder_anims) starpower = <star_power_anim>}
endscript

script band_anim_check_star_power_anim 
	if structurecontains \{structure = $band_builder_anims
			starpower}
		return true star_power_anim = (($band_builder_anims).starpower)
	endif
	return \{false}
endscript

script band_anim_set_appearance 
	requireparams \{[
			info_struct
			appearance_checksum
		]
		all}
	struct = ($band_builder_anims)
	addparam name = <info_struct> structure_name = struct value = <appearance_checksum>
	change band_builder_anims = <struct>
endscript

script band_anim_check_appearance 
	requireparams \{[
			info_struct
			appearance_checksum
		]
		all}
	if structurecontains structure = $band_builder_anims <info_struct>
		if (<appearance_checksum> = (($band_builder_anims).<info_struct>))
			return \{true}
		endif
	endif
	return \{false}
endscript

script band_ensure_flushed_frontend_pak 
	requireparams \{[
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
	getarraysize \{$band_builder_current_setup}
	if (<array_size> > 0)
		i = 0
		begin
		removeparameter \{player_status}
		if structurecontains structure = ($band_builder_current_setup [<i>]) player_status
			player_status = (($band_builder_current_setup [<i>]).player_status)
		endif
		band_load_single_anim_pak {
			character_id = (($band_builder_current_setup [<i>]).character_id)
			part = (($band_builder_current_setup [<i>]).real_part)
			name = (($band_builder_current_setup [<i>]).name)
			savegame = (($band_builder_current_setup [<i>]).savegame)
			async = <async>
			player_status = <player_status>
		}
		if ((($band_builder_current_setup [<i>]).character_id) = emptyguy)
			is_training = 1
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	if (($is_attract_mode = 1) || (<is_training> = 1))
		change \{group_starpower = none}
		return
	endif
	if NOT band_anim_check_star_power_anim
		getrandomarrayelement ($starpower_anim_sets)
		getarraysize \{$starpower_anim_sets}
		if (<array_size> = 0)
			change \{group_starpower = none}
			return
		endif
		getrandomvalue name = newindex integer a = 0 b = (<array_size> - 1)
		printf channel = animinfo qs(0x28598bf2) a = ($starpower_anim_sets [<index>]) donotresolve
		starpower_pak = ($starpower_anim_sets [<index>])
		band_anim_set_star_power_anim star_power_anim = <starpower_pak>
	else
		printf channel = animinfo 'Keeping star power pak from previous song %s' s = <starpower_pak>
		starpower_pak = <star_power_anim>
	endif
	extendcrc <starpower_pak> '_clip' out = starpower_clip
	change group_starpower = <starpower_clip>
	printf channel = animinfo qs(0x0d1bd8db) a = <starpower_pak> donotresolve
	mpm_load_pak pak = <starpower_pak> owner = band_anim_pak async = <async> links = anim_starpower_pakman_links
endscript
group_starpower = none

script band_load_single_anim_pak 
	if ($game_mode = training)
		return
	endif
	get_musician_profile_struct_by_id id = <character_id> savegame = <savegame>
	extendcrc <name> '_Info' out = info_struct
	if get_body_key_from_appearance key = anim_struct appearance = (<profile_struct>.appearance)
		if get_anim_struct_member anim_struct = <anim_struct> loading_into_song = ($current_song) member = <part>
			if structurecontains structure = <anim_struct_member> pak
				if NOT ($guitar_character_loops_state = loop_paks_enabled)
					scriptassert \{qs(0xa4f1d90f)}
				endif
				mpm_load_pak pak = (<anim_struct_member>.pak) owner = band_anim_pak async = <async>
			elseif ($guitar_character_loops_state = loop_paks_enabled)
				scriptassert 'No animation pak specified for %s' s = <name>
			endif
		endif
	endif
	generatechecksumfromstruct struct = (<profile_struct>.appearance)
	appearance_checksum = <structure_checksum>
	if NOT band_anim_check_appearance appearance_checksum = <appearance_checksum> info_struct = <info_struct>
		printf channel = animinfo 'New anims for %s' s = <info_struct>
		win_anim_name = none
		lose_anim_name = none
		intro_anim_name = none
		printf channel = animinfo qs(0x27da2bf9) c = <character_id> donotresolve
		if get_cas_custom_anim instrument = <part> appearance = (<profile_struct>.appearance) part = cas_win_anim
			win_anim_name = <custom_anim_name>
		else
			printf channel = animinfo qs(0x8bb886a5) a = <character_id>
		endif
		printf channel = animinfo qs(0x384b6f80) c = <character_id> donotresolve
		if get_cas_custom_anim instrument = <part> appearance = (<profile_struct>.appearance) part = cas_lose_anim
			lose_anim_name = <custom_anim_name>
		else
			printf channel = animinfo qs(0x8f3700ed) a = <character_id>
		endif
		printf channel = animinfo qs(0xb5c3e268) c = <character_id> donotresolve
		if get_cas_custom_anim instrument = <part> appearance = (<profile_struct>.appearance) part = cas_intro_anim
			intro_anim_name = <custom_anim_name>
		else
			printf channel = animinfo qs(0xcb8864a5) a = <character_id>
		endif
		printf \{channel = animinfo
			qs(0x7f115927)}
		if NOT gotparam \{player_status}
			if NOT is_current_band_vanhalen
				band_get_human_players
				getarraysize <human_players>
				if (<array_size> > 0)
					pointing_anim_set = default_pointing_anims
					get_key_from_appearance key = pointing_anim_set appearance = (<profile_struct>.appearance)
					getrandomarrayelement <human_players>
					point_to = <element>
					if get_pointing_anim struct = ($<pointing_anim_set>) type = win_anims from = <part> to = <point_to>
						win_anim_name = <pointing_anim>
					endif
					getrandomarrayelement <human_players>
					point_to = <element>
					if get_pointing_anim struct = ($<pointing_anim_set>) type = lose_anims from = <part> to = <point_to>
						lose_anim_name = <pointing_anim>
					endif
				endif
			endif
		endif
		if (($is_attract_mode = 1) || (<character_id> = emptyguy))
			win_anim_name = none
			lose_anim_name = none
			if (<character_id> = emptyguy)
				intro_anim_name = none
			endif
		endif
		change structurename = <info_struct> intro_anim_name = <intro_anim_name>
		change structurename = <info_struct> win_anim_name = <win_anim_name>
		change structurename = <info_struct> lose_anim_name = <lose_anim_name>
		band_anim_set_appearance appearance_checksum = <appearance_checksum> info_struct = <info_struct>
	else
		printf channel = animinfo 'Avoiding rerandomizing anims for %s' s = <info_struct>
		win_anim_name = ($<info_struct>.win_anim_name)
		lose_anim_name = ($<info_struct>.lose_anim_name)
		intro_anim_name = ($<info_struct>.intro_anim_name)
	endif
	printf channel = animinfo 'win_anim_name = %w' w = <win_anim_name>
	printf channel = animinfo 'lose_anim_name = %w' w = <lose_anim_name>
	printf channel = animinfo 'intro_anim_name = %w' w = <intro_anim_name>
	if NOT (<win_anim_name> = none)
		mpm_load_pak pak = <win_anim_name> owner = band_anim_pak async = <async> links = anim_intro_win_pakman_links
	endif
	if NOT (<lose_anim_name> = none)
		mpm_load_pak pak = <lose_anim_name> owner = band_anim_pak async = <async> links = anim_lose_pakman_links
	endif
	if NOT (<intro_anim_name> = none)
		mpm_load_pak pak = <intro_anim_name> owner = band_anim_pak async = <async> links = anim_intro_win_pakman_links
	endif
endscript

script get_pointing_anim 
	if structurecontains structure = <struct> <type>
		struct = (<struct>.<type>)
		if structurecontains structure = <struct> <from>
			struct = (<struct>.<from>)
			if structurecontains structure = <struct> <to>
				return true pointing_anim = (<struct>.<to>)
			endif
		endif
	endif
	return \{false}
endscript

script grab_custom_anim_name_from_key 
	requireparams \{[
			part
			desc_id
			key
			who
		]
		all}
	getactualcasoptionstruct part = <part> desc_id = <desc_id>
	if (($game_mode = p2_battle) || ($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff) || ($boss_battle = 1))
		if gotparam \{headtohead_anim_name}
			if NOT (<who> = drummer)
				printf 'headtohead_anim_name = %s' s = <headtohead_anim_name>
				key = headtohead_anim_name
			endif
		endif
	endif
	if gotparam <key>
		custom_anim_name = (<...>.<key>)
	endif
	if gotparam \{transition_override}
		transition_gettransitionspecificanim type = <transition_override> part = <part> key = <key> who = <who>
	endif
	if NOT gotparam \{custom_anim_name}
		printf 'Could not find key %p %d %k' p = <part> d = <desc_id> k = <key>
		return \{false}
	endif
	if isarray <custom_anim_name>
		getrandomarrayelement <custom_anim_name>
		custom_anim_name = <element>
	endif
	return true custom_anim_name = <custom_anim_name>
endscript

script get_cas_custom_anim 
	resolvebodyspecificpartinappearance part = <part> appearance = <appearance>
	switch <instrument>
		case guitar
		who = guitarist
		case bass
		who = bassist
		case drum
		who = drummer
		case vocals
		who = singer
		case rhythm
		who = rhythm
		default
		return \{false}
	endswitch
	extendcrc <who> '_anim_name' out = key
	if structurecontains structure = <appearance> <part>
		if grab_custom_anim_name_from_key part = <part> desc_id = (<appearance>.<part>.desc_id) key = <key> who = <who>
			return true custom_anim_name = <custom_anim_name>
		endif
	endif
	if NOT gotparam \{custom_anim_name}
		printf channel = animinfo 'Profile doesnt have custom anim %p specified' p = <part> donotresolve
		begin
		getrandomarrayelement ($<part>)
		if NOT structurecontains structure = <element> hidden
			if grab_custom_anim_name_from_key part = <part> desc_id = (<element>.desc_id) key = <key> who = <who>
				return true custom_anim_name = <custom_anim_name>
			endif
		endif
		repeat 50
	endif
	return \{false}
endscript

script band_start_anims 
	if ($game_mode = training)
		return
	endif
	getarraysize \{$band_builder_current_setup}
	if (<array_size> > 0)
		i = 0
		begin
		part = (($band_builder_current_setup [<i>]).part)
		real_part = (($band_builder_current_setup [<i>]).real_part)
		name = (($band_builder_current_setup [<i>]).name)
		character_id = (($band_builder_current_setup [<i>]).character_id)
		savegame = (($band_builder_current_setup [<i>]).savegame)
		get_musician_profile_struct_by_id id = <character_id> savegame = <savegame>
		params = {
			name = <name>
			character_id = <character_id>
			instrument = <real_part>
			loading_into_song = ($current_song)
			savegame = <savegame>
			profile_struct = <profile_struct>
		}
		start_anims = ($band_builder_part_constants.<real_part>.start_anims)
		printf channel = animinfo qs(0xfe6a8329) a = <name>
		<start_anims> <params>
		i = (<i> + 1)
		repeat <array_size>
	endif
	band_restartidles
endscript

script band_stop_anims 
	getarraysize \{$band_builder_current_setup}
	if (<array_size> > 0)
		i = 0
		begin
		name = (($band_builder_current_setup [<i>]).name)
		if compositeobjectexists name = <name>
			<name> :obj_killallspawnedscripts
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	bandmanager_removeallcharacters
endscript

script band_unload_anim_paks 
	mpm_object_unload_paks \{owner = band_anim_pak}
endscript
