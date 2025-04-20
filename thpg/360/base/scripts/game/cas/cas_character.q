CAS_Character_ForEach_List = [
	{
		character_type = CAS_CAREER
	}
]
CAS_Character_List = [
	CAS_CAREER
]
CAS_Character_Info = {
	CAS_CAREER = {
		index = 0
		text = "Career"
		body = CareerBody
		only_with = only_with_career
		pause_movie = 'CasHipHop'
		app_struct = appearance_custom_skater_CAREER
		camera_pos = cas_get_part_camera_pos_bedroom_CAREER
	}
}
CAS_Character_Specific_Parts = [
]
CAS_Character_Specific_Part_Names = {
}
CAS_Character_Part_Mappings = {
	CAS_CHAR_Head = CAS_Head
	CAS_CHAR_Scalp = CAS_Scalp
	CAS_CHAR_Hair = cas_hair
	CAS_CHAR_Hat_Hair = cas_hat_hair
	CAS_CHAR_Legs = cas_legs
	CAS_CHAR_Lower_Legs = CAS_Lower_Legs
	CAS_CHAR_Hands = CAS_Hands
	CAS_CHAR_Bare_Torso = CAS_Bare_Torso
	CAS_CHAR_Torso = cas_torso
	CAS_CHAR_Torso_Sec = CAS_Torso_Sec
	CAS_CHAR_Socks = cas_socks
	CAS_CHAR_Glasses = CAS_Glasses
	CAS_CHAR_Hat = cas_hat
	CAS_CHAR_Hat_Sec = CAS_Hat_Sec
	CAS_CHAR_Accessory01 = CAS_Accessory01
	CAS_CHAR_Accessory02 = CAS_Accessory02
	CAS_CHAR_Accessory03 = CAS_Accessory03
	CAS_CHAR_Accessory04 = CAS_Accessory04
}
CAS_Character_Switchable_Parts = [
]

script create_character_part_id 
	appendsuffixtochecksum base = <character_type> suffixstring = '_'
	appendsuffixtochecksum base = <appended_id> suffixstring = <part_name>
	return part_id = <appended_id>
endscript

script GetCharacterIsValid 
	if gotparam \{character_type}
		if structurecontains structure = ($CAS_Character_Info) <character_type>
			return \{true}
		endif
	endif
	return \{false}
endscript

script GetCharacterTypeName 
	return character_type_name = ($CAS_Character_Info.<character_type>.text)
endscript

script GetCharacterBodyName 
	return bodyname = ($CAS_Character_Info.<character_type>.body)
endscript

script GetCharacterOnlyWith 
	return only_with = ($CAS_Character_Info.<character_type>.only_with)
endscript

script GetCharacterPauseMovie 
	return pause_movie = ($CAS_Character_Info.<character_type>.pause_movie)
endscript

script GetCharacterAppearance 
	return character_appearance = ($CAS_Character_Info.<character_type>.app_struct)
endscript

script GetCharacterCameraPosScript 
	return cas_parts_pos_script = ($CAS_Character_Info.<character_type>.camera_pos)
endscript

script ResolveCharacterPart 
	if structurecontains structure = ($CAS_Character_Specific_Part_Names) <part>
		create_character_part_id part_name = (($CAS_Character_Specific_Part_Names).<part>) character_type = <character_type>
		return resolved_part = <part_id>
	endif
	return resolved_part = <part>
endscript

script ResolveCharacterPartArray 
	dest_array = []
	src_index = 0
	getarraysize <array>
	begin
	src_part = (<array> [<src_index>])
	ResolveCharacterPart part = <src_part> character_type = <character_type>
	dest_array = (<dest_array> + CAS_DUMMY)
	setarrayelement arrayname = dest_array dest_array = <dest_array> resolveglobals = 0 index = <src_index> newvalue = <resolved_part>
	src_index = (<src_index> + 1)
	repeat <array_size>
	return resolved_array = <dest_array>
endscript

script ReverseResolveCharacterPart 
	type_index = 0
	getarraysize $CAS_Character_List
	num_chars = <array_size>
	getarraysize $CAS_Character_Specific_Parts
	num_parts = <array_size>
	if isarray part
		scriptassert 'Part must be a single part, not an array!'
	endif
	if ((<num_chars> > 0) && (<num_parts> > 0))
		begin
		part_index = 0
		begin
		char_part = ($CAS_Character_Specific_Parts [<part_index>])
		create_character_part_id character_type = ($CAS_Character_List [<type_index>]) part_name = ($CAS_Character_Specific_Part_Names.<char_part>)
		if checksumequals a = <part_id> b = <part>
			return resolved_part = <char_part>
		endif
		part_index = (<part_index> + 1)
		repeat <num_parts>
		type_index = (<type_index> + 1)
		repeat <num_chars>
	endif
	return resolved_part = <part>
endscript

script GetCharacterPartFromType 
	if structurecontains structure = ($CAS_Character_Part_Mappings) <part>
		return character_part = (($CAS_Character_Part_Mappings).<part>)
	else
		return character_part = <part>
	endif
endscript

script GetCharacterIterated 
	index = ($CAS_Character_Info.<character_type>.index)
	getarraysize $CAS_Character_List
	if gotparam up
		index = (<index> + 1)
		if (<index> = <array_size>)
			<index> = 0
		endif
	elseif gotparam down
		index = (<index> - 1)
		if (<index> < 0)
			<index> = (<array_size> - 1)
		endif
	else
		scriptassert 'GetCharacterIterated needs up or down passed to it!'
	endif
	return character_type = ($CAS_Character_List [<index>])
endscript

script FindFrontEndDescFromPart 
	frontend_desc = "None"
	if gotparam default_desc
		frontend_desc = <default_desc>
	endif
	if gotparam parts
		getarraysize <parts>
		i = 0
		begin
		FindFrontEndDescFromPart_Helper character_type = <character_type> part = (<parts> [<i>]) profile = <profile>
		i = (<i> + 1)
		repeat <array_size>
	else
		FindFrontEndDescFromPart_Helper character_type = <character_type> part = <part> profile = <profile>
	endif
	return frontend_desc = <frontend_desc>
endscript

script FindFrontEndDescFromPart_Helper 
	ResolveCharacterPart character_type = <character_type> part = <part>
	if structurecontains structure = <profile> <resolved_part>
		findfrontenddescfromchecksum part = <resolved_part> desc_id = ((<profile>.<resolved_part>).desc_id)
	endif
	return frontend_desc = <frontend_desc>
endscript

script cas_concat_character_part_arrays 
	getarraysize $CAS_Character_Specific_Parts
	parts_size = <array_size>
	getarraysize $CAS_Character_List
	chars_size = <array_size>
	if ((<parts_size> > 0) && (<chars_size> > 0))
		part_index = 0
		begin
		part_name = ($CAS_Character_Specific_Parts [<part_index>])
		char_index = 0
		begin
		character_type = ($CAS_Character_List [<char_index>])
		GetCharacterPartFromType character_type = <character_type> part = <part_name>
		if globalexists name = <part_name> type = array
			concat_array = (($<character_part>) + ($<part_name>))
			change globalname = <character_part> newvalue = <concat_array>
		endif
		char_index = (<char_index> + 1)
		repeat <chars_size>
		part_index = (<part_index> + 1)
		repeat <parts_size>
	endif
endscript
