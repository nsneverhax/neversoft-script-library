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
	anim_paks_set_state \{state = ingame}
	GetArraySize \{$band_builder_current_setup}
	if (<array_Size> > 0)
		i = 0
		begin
		RemoveParameter \{Player}
		if StructureContains structure = ($band_builder_current_setup [<i>]) Player
			Player = (($band_builder_current_setup [<i>]).Player)
		endif
		if wii_character_needs_building index = <i>
			loadall = 1
		else
			loadall = 0
		endif
		part = (($band_builder_current_setup [<i>]).part)
		band_load_single_anim_pak {
			character_id = (($band_builder_current_setup [<i>]).character_id)
			part = (($band_builder_current_setup [<i>]).part)
			Name = (($band_builder_current_setup [<i>]).Name)
			savegame = (($band_builder_current_setup [<i>]).savegame)
			async = <async>
			Player = <Player>
			loadall = <loadall>
		}
		if ((($band_builder_current_setup [<i>]).character_id) = emptyguy)
			is_training = 1
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	if ((<is_training> = 1))
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
endscript
group_starpower = None

script band_load_single_anim_pak 
	ExtendCrc <Name> '_Info' out = info_struct
	anim_struct = ($<info_struct>.anim_struct)
	gman_songtool_getcurrentsong
	if get_anim_struct_member anim_struct = <anim_struct> loading_into_song = <current_song> member = <part>
		if StructureContains structure = <anim_struct_member> pak
			pakname = (<anim_struct_member>.pak)
			ExtendCrc <Name> '_anims' out = owner
			mpm_object_unload_paks owner = <owner>
			mpm_load_pak pak = <pakname> owner = <owner> async = <async>
		else
			printf 'No animation pak specified for %s' s = <Name>
		endif
	endif
	if NOT <Name> :GetSingleTag appearance_checksum
		ScriptAssert \{'Missing appearance_checksum'}
	endif
	if NOT band_anim_check_appearance appearance_checksum = <appearance_checksum> info_struct = <info_struct>
		printf 'New anims for %s' s = <info_struct>
		printstruct ($band_builder_anims)
		win_anim_name = ($<info_struct>.win_anim_name)
		lose_anim_name = ($<info_struct>.lose_anim_name)
		if ((<character_id> = emptyguy))
			win_anim_name = None
			lose_anim_name = None
		endif
		Change structurename = <info_struct> win_anim_name = <win_anim_name>
		Change structurename = <info_struct> lose_anim_name = <lose_anim_name>
		band_anim_set_appearance appearance_checksum = <appearance_checksum> info_struct = <info_struct>
		song_outro_get_random_animation_for_part part = <part>
		if NOT ((GotParam anim) || (GotParam anim_index))
			ScriptAssert \{qs(0x4ecdbc6c)}
		endif
		outro_anim_name = <anim>
		outro_anim_index = <anim_index>
		Change structurename = <info_struct> outro_anim_name = <anim>
		Change structurename = <info_struct> outro_anim_index = <anim_index>
		band_anim_set_appearance appearance_checksum = <appearance_checksum> info_struct = <info_struct>
	else
		printf 'Avoiding rerandomizing anims for %s' s = <info_struct>
		win_anim_name = ($<info_struct>.win_anim_name)
		lose_anim_name = ($<info_struct>.lose_anim_name)
		outro_anim_name = ($<info_struct>.outro_anim_name)
		outro_anim_index = ($<info_struct>.outro_anim_index)
	endif
	printf 'win_anim_name = %w' w = <win_anim_name>
	printf 'lose_anim_name = %w' w = <lose_anim_name>
	printf 'outro_anim_name = %w' w = <outro_anim_name>
	if NOT (<win_anim_name> = None)
		mpm_load_pak pak = <win_anim_name> owner = <owner> async = <async> links = anim_intro_win_pakman_links
	endif
	if NOT (<lose_anim_name> = None)
		mpm_load_pak pak = <lose_anim_name> owner = <owner> async = <async> links = anim_lose_pakman_links
	endif
	if NOT (<outro_anim_name> = None)
		mpm_load_pak pak = <outro_anim_name> owner = <owner> async = <async> links = anim_outro_win_pakman_links
	endif
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
	if (($game_mode = p2_pro_faceoff) || ($game_mode = p2_roadie_battle))
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
		if getrandomarrayelement ($<part>)
			if NOT StructureContains structure = <element> hidden
				if grab_custom_anim_name_from_key part = <part> desc_id = (<element>.desc_id) key = <key> who = <who>
					return true custom_anim_name = <custom_anim_name>
				endif
			endif
		endif
		repeat 50
	endif
	return \{FALSE}
endscript

script band_start_anims 
	i = 0
	begin
	part = (($persistent_band_data [<i>]).instrument)
	Name = (($persistent_band_data [<i>]).object)
	gman_songtool_getcurrentsong
	printf channel = AnimInfo qs(0xfaaf841e) a = <Name> b = <part>
	if CompositeObjectExists Name = <Name>
		band_member_start_anims {
			Name = <Name>
			instrument = <part>
			loading_into_song = <current_song>
		}
	endif
	i = (<i> + 1)
	repeat 4
	band_restartidles
endscript

script band_stop_anims 
	printf \{qs(0x43e01e19)}
	i = 0
	begin
	Name = (($persistent_band_data [<i>]).object)
	if CompositeObjectExists Name = <Name>
		<Name> :obj_killallspawnedscripts
	endif
	i = (<i> + 1)
	repeat 4
	bandmanager_removeallcharacters
	printf \{qs(0x07b36a58)}
endscript

script band_unload_anim_paks 
	mpm_object_unload_paks \{owner = starpower_anims}
	mpm_object_unload_paks \{owner = musician1_anims}
	mpm_object_unload_paks \{owner = musician2_anims}
	mpm_object_unload_paks \{owner = musician3_anims}
	mpm_object_unload_paks \{owner = musician4_anims}
	mpm_object_unload_paks \{owner = musician1_anims2}
	mpm_object_unload_paks \{owner = musician2_anims2}
	mpm_object_unload_paks \{owner = musician3_anims2}
	mpm_object_unload_paks \{owner = musician4_anims2}
endscript
