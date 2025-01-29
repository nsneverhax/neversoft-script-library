agora_materials = [
]
cas_agora_parts = [
	CAS_Guitar_Body
	CAS_Bass_Body
	CAS_Drums
	CAS_Mic
]

script create_agora_character_struct 
	RequireParams \{[
			player
		]
		all}
	net_get_character_name player = <player> check_profanity = 0
	savegame = 0
	if IsXenonOrWinDX
		if PlayerInfoEquals <player> is_local_client = 1
			GetPlayerInfo <player> controller
			get_savegame_from_controller controller = <controller>
		endif
	endif
	GetPlayerInfo <player> character_id
	if CharacterProfileGetStruct name = <character_id> savegame = <savegame> dont_assert
		if StructureContains structure = <profile_struct> appearance
			GetPlayerInfo <player> part
			create_agora_appearance_struct appearance = (<profile_struct>.appearance) instrument = <part>
		endif
	endif
	return agora_character = {
		character_id = <character_id>
		display_name = <display_name>
		appearance_data = <appearance_data>
	}
endscript

script create_agora_appearance_struct 
	RequireParams \{[
			appearance
			instrument
		]
		all}
	FilterAppearance appearance_name = appearance part_set = $instrument_part_sets chosen_set = <instrument>
	get_is_female_from_appearance appearance = <appearance>
	appearance_data = {is_female = <is_female>}
	array = []
	GetArraySize \{$master_editable_list}
	i = 0
	begin
	part_name = ((($master_editable_list) [<i>]).part)
	if ArrayContains array = ($cas_agora_parts) contains = <part_name>
		if StructureContains structure = <appearance> <part_name>
			if StructureContains structure = (<appearance>.<part_name>) desc_id
				part_def = {
					part = <part_name>
					choice = ((<appearance>.<part_name>).desc_id)
				}
				AddArrayElement array = <array> element = <part_def>
			endif
		endif
	endif
	i = (<i> + 1)
	repeat <array_size>
	return appearance_data = {<appearance_data> parts = <array>}
endscript

script agora_material_reformat 
	material_names = [
		material1
		material2
		material3
		material4
		material5
		material6
		skin
		Eyes
	]
	array = []
	GetArraySize <material_names>
	i = 0
	begin
	matname = (<material_names> [<i>])
	if StructureContains structure = <chosen_materials> <matname>
		AddArrayElement array = <array> element = (<chosen_materials>.<matname>)
	endif
	i = (<i> + 1)
	repeat <array_size>
	return agora_materials = <array>
endscript
