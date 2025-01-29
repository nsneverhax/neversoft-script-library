0x19d65371 = 1
band_builder_anims = {
}

script band_anim_reset_loading 

	Change \{band_builder_anims = {
		}}
endscript

script band_anim_set_star_power_anim 

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

	struct = ($band_builder_anims)
	AddParam Name = <info_struct> structure_name = struct value = <appearance_checksum>
	Change band_builder_anims = <struct>
endscript

script band_anim_check_appearance 

	if StructureContains structure = $band_builder_anims <info_struct>
		if (<appearance_checksum> = (($band_builder_anims).<info_struct>))
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script band_load_anim_paks \{song = None}
	is_training = 0
	anim_paks_set_state state = ingame async = <async>
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
	Change \{group_starpower = None}
endscript
group_starpower = None

script band_load_single_anim_pak 
	if ($game_mode = practice)
		return
	endif
	get_musician_profile_struct_by_id id = <character_id> savegame = <savegame>
	ExtendCrc <Name> '_Info' out = info_struct
	if get_body_key_from_appearance key = anim_struct appearance = (<profile_struct>.appearance)
		if get_anim_struct_member anim_struct = <anim_struct> loading_into_song = ($current_song) member = <part>
			if StructureContains structure = <anim_struct_member> pak
				pakname = (<anim_struct_member>.pak)
				map = loop_anims
				smartloadpakman map = <map> pak_name = <pakname> async = <async> tags = {Type = looppak part = <part> song = <song>}
			else

			endif
		endif
	endif
	generatechecksumfromstruct struct = (<profile_struct>.appearance)
	appearance_checksum = <structure_checksum>
	if NOT band_anim_check_appearance appearance_checksum = <appearance_checksum> info_struct = <info_struct>


		win_anim_name = None
		lose_anim_name = None
		intro_anim_name = None
		if (<part> = vocals_and_guitar)
			part = guitar
		endif
		get_is_female_from_appearance appearance = (<profile_struct>.appearance)
		if (<is_female> = 1)
			gender = female
		else
			gender = male
		endif
		GetArraySize ($win_anims.<gender>.<part>)
		GetRandomValue Name = win_index a = 0 b = (<array_Size> -1) integer
		win_anim_name = ($win_anims.<gender>.<part> [<win_index>])
		GetArraySize ($lose_anims.<gender>.<part>)
		GetRandomValue Name = lose_index a = 0 b = (<array_Size> -1) integer
		lose_anim_name = ($lose_anims.<gender>.<part> [<lose_index>])
		switch <part>
			case guitar
			intro_anim_name = guit_greg_notempo_01
			case bass
			intro_anim_name = guit_greg_notempo_02
			case vocals
			intro_anim_name = sing_greg_notempo
		endswitch
		if (($is_attract_mode = 1) || (<character_id> = emptyguy))
			win_anim_name = None
			lose_anim_name = None
			if (<character_id> = emptyguy)
				intro_anim_name = None
			endif
		endif
		if StructureContains structure = <profile_struct> intro_anims
			intro_anims = (<profile_struct>.intro_anims)
			GetArraySize <intro_anims>
			GetRandomValue Name = index a = 0 b = (<array_Size> -1) integer
			intro_anim_name = (<intro_anims> [<index>])
		endif
		if StructureContains structure = <profile_struct> win_anims
			0x03ef6aed = (<profile_struct>.win_anims)
			GetArraySize (<0x03ef6aed>)
			GetRandomValue Name = win_index a = 0 b = (<array_Size> -1) integer
			win_anim_name = (<0x03ef6aed> [<win_index>])
		endif
		if StructureContains structure = <profile_struct> lose_anims
			0x35d36bbb = (<profile_struct>.lose_anims)
			GetArraySize (<0x35d36bbb>)
			GetRandomValue Name = lose_index a = 0 b = (<array_Size> -1) integer
			lose_anim_name = (<0x35d36bbb> [<lose_index>])
		endif
		Change structurename = <info_struct> intro_anim_name = <intro_anim_name>
		Change structurename = <info_struct> win_anim_name = <win_anim_name>
		Change structurename = <info_struct> lose_anim_name = <lose_anim_name>
		band_anim_set_appearance appearance_checksum = <appearance_checksum> info_struct = <info_struct>
	else

		win_anim_name = ($<info_struct>.win_anim_name)
		lose_anim_name = ($<info_struct>.lose_anim_name)
		intro_anim_name = ($<info_struct>.intro_anim_name)
	endif



	if NOT (<win_anim_name> = None)
		smartloadpakman map = win_anims pak_name = <win_anim_name> async = <async> tags = {Type = animpak part = <part>}
	endif
	if NOT (<lose_anim_name> = None)
		smartloadpakman map = lose_anims pak_name = <lose_anim_name> async = <async> tags = {Type = animpak part = <part>}
	endif
endscript

script prepare_for_pending_animpaks 


	smartunloadpak async = <async> tags = {Type = looppak}

	smartunloadpak async = <async> tags = {Type = nextsongpak}
endscript

script band_start_anims 
	if ($game_mode = practice)
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

script band_unload_anim_paks \{async = 1}
	smartunloadpak async = <async> tags = {Type = animpak}
endscript

script band_unload_song_anim_paks \{async = 1}
	smartunloadpak async = <async> tags = {Type = looppak}
endscript

script 0xf11ce60b 
	bandmanager_playidle \{Name = GUITARIST
		restart}
	bandmanager_playidle \{Name = vocalist
		restart}
	bandmanager_playidle \{Name = BASSIST
		restart}
	intro_anim = ($drummer_info.intro_anim_name)
	if (<intro_anim> = None)
		drummer :Anim_Command \{target = moment_blend
			Command = switch_setstate
			params = {
				OFF
			}}
		drummer :Anim_Command \{target = moment_blend_inner
			Command = switch_setstate
			params = {
				On
			}}
		drummer :Anim_Command \{target = moment_branch
			Command = DegenerateBlend_AddBranch
			params = {
				Tree = $hero_empty_branch
				BlendDuration = 0.0
			}}
	else
		Band_PlaySimpleAnim {Name = drummer anim = <intro_anim> BlendDuration = 0.3}
		band_setikchain \{Name = drummer
			Chain = slave}
	endif
endscript
