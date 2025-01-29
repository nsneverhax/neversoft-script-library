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
		get_is_female_from_appearance appearance = (<profile_struct>.appearance)
		if (<is_female> = 1)
			gender = female
		else
			gender = male
		endif
		if (<part> = vocals_and_guitar)
			part = guitar
		endif
		GetArraySize ($win_anims.<gender>.<part>)
		GetRandomValue Name = win_index a = 0 b = (<array_Size> -1) integer
		win_anim_name = ($win_anims.<gender>.<part> [<win_index>])
		GetArraySize ($lose_anims.<gender>.<part>)
		GetRandomValue Name = lose_index a = 0 b = (<array_Size> -1) integer
		lose_anim_name = ($lose_anims.<gender>.<part> [<lose_index>])
		if (($is_attract_mode = 1) || (<character_id> = emptyguy))
			win_anim_name = None
			lose_anim_name = None
			if (<character_id> = emptyguy)
				intro_anim_name = None
			endif
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
	if NOT (<intro_anim_name> = None)
		smartloadpakman map = win_anims pak_name = <intro_anim_name> async = <async> tags = {Type = animpak part = <part>}
	endif
endscript

script prepare_for_pending_animpaks 


	smartunloadpak async = <async> tags = {Type = looppak}

	smartunloadpak async = <async> tags = {Type = nextsongpak}
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

	getactualcasoptionstruct part = <part> desc_id = <desc_id>
	if ($game_mode = p2_pro_faceoff)
		if GotParam \{headtohead_anim_name}
			if NOT (<who> = drummer)

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
endscript
0xf280c0a5 = {
	guitar = [
		bdgs_g_guitarist_lose_01
		g_jeff_lose_depressed
		g_jeff_lose_fearful
		g_jeff_lose_pretentious
		g_jeff_lose_walkoff
	]
	vocals_and_guitar = [
		bdgs_g_guitarist_lose_01
		g_jeff_lose_depressed
		g_jeff_lose_fearful
		g_jeff_lose_pretentious
		g_jeff_lose_walkoff
	]
	bass = [
		b_jeff_lose_depressed
		b_jeff_lose_fearful
		b_jeff_lose_pretentious
		b_jeff_lose_walkoff
		bdgs_b_bassist_lose_01
		gsbd_b_lose_angryatcrowd01
	]
	vocals = [
		s_jeff_lose_depressed
		s_jeff_lose_fearful
		s_jeff_lose_pretentious
		s_jeff_lose_walkoff
		bdgs_s_singer_lose_01
	]
	drum = [
		bdgs_d_drummer_lose_01
		d_jeff_lose_pretentious
		d_jeff_lose_walkoff
		gsbd_d_lose_angryatcrowd01
		d_jeff_lose_depressed
		d_jeff_lose_fearful
	]
}
0xcb2191e4 = {
	guitar = [
		g_kris_lose_pretentious
		g_kris_lose_angryatcrowd
		g_kris_lose_depressed
	]
	bass = [
		b_kris_lose_pretentious
		b_kris_lose_pointbass
		b_kris_lose_angryatcrowd
		b_kris_lose_depressed
	]
	vocals = [
		s_kris_lose_depressed
		s_kris_lose_angryatcrowd
		s_kris_lose_pointsing
		s_kris_lose_pretentious
	]
	drum = [
		d_kris_lose_pretentious
		d_kris_lose_pointdrum
		d_kris_lose_angryatcrowd
		d_kris_lose_depressed
	]
}
0x8f2cdcc4 = {
	guitar = [
		gsbd_g_win_pointing01
		g_jeff_win_waving
		g_june_win_pointguit
		g_ringers_take02_wins01
		g_jeff_win_kick
	]
	vocals_and_guitar = [
		gsbd_g_win_pointing01
		g_jeff_win_waving
		g_june_win_pointguit
		g_ringers_take02_wins01
		g_jeff_win_kick
	]
	bass = [
		b_jeff_win_kick
		b_jeff_win_waving
		b_june_win_pointbass
		gsbd_b_win_pointing01
		g_ringers_take03_wins02
	]
	vocals = [
		gsbd_s_win_pointing01
		s_jeff_win_waving
		s_june_win_pointsing
		s_ringers_take02_wins01
		s_ringers_take03_wins02
	]
	drum = [
		d_jeff_win_pretentious
		d_jeff_win_waving
		d_june_win_pointdrum
		d_ringers_take03_wins02
		gsbd_d_win_pointing01
	]
}
0xbe761e83 = {
	guitar = [
		g_alla_win_generic
		g_alla_win_jump
		g_kris_win_pointguit
		g_kris_win_pretentious
		g_kris_win_waving
	]
	bass = [
		b_alla_win_generic
		b_alla_win_jump
		b_kris_win_kick
		b_kris_win_pointbass
		b_kris_win_pretentious
		b_kris_win_waving
	]
	vocals = [
		s_alla_win_generic
		s_alla_win_jump
		s_kris_win_pointsing
		s_kris_win_waving
	]
	drum = [
		d_alla_win_generic
		d_alla_win_jump
		d_kris_win_kick
		d_kris_win_pointdrum
		d_kris_win_pretentious
		d_kris_win_waving
	]
}
