agora_materials = [
]
cas_agora_parts = [
	cas_guitar_body
	cas_bass_body
	cas_drums
	cas_mic
]

script create_agora_character_struct 
	requireparams \{[
			player
		]
		all}
	net_get_character_name player = <player> check_profanity = 0
	savegame = 0
	if isxenonorwindx
		if playerinfoequals <player> is_local_client = 1
			getplayerinfo <player> controller
			get_savegame_from_controller controller = <controller>
		endif
	endif
	getplayerinfo <player> character_id
	if characterprofilegetstruct name = <character_id> savegame = <savegame> dont_assert
		if structurecontains structure = <profile_struct> appearance
			getplayerinfo <player> part
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
	requireparams \{[
			appearance
			instrument
		]
		all}
	filterappearance appearance_name = appearance part_set = $instrument_part_sets chosen_set = <instrument>
	get_is_female_from_appearance appearance = <appearance>
	appearance_data = {is_female = <is_female>}
	array = []
	getarraysize \{$master_editable_list}
	i = 0
	begin
	part_name = ((($master_editable_list) [<i>]).part)
	if arraycontains array = ($cas_agora_parts) contains = <part_name>
		if structurecontains structure = <appearance> <part_name>
			if structurecontains structure = (<appearance>.<part_name>) desc_id
				part_def = {
					part = <part_name>
					choice = ((<appearance>.<part_name>).desc_id)
				}
				addarrayelement array = <array> element = <part_def>
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
		eyes
	]
	array = []
	getarraysize <material_names>
	i = 0
	begin
	matname = (<material_names> [<i>])
	if structurecontains structure = <chosen_materials> <matname>
		addarrayelement array = <array> element = (<chosen_materials>.<matname>)
	endif
	i = (<i> + 1)
	repeat <array_size>
	return agora_materials = <array>
endscript
