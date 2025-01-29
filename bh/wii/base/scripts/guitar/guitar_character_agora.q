agora_materials = [
]
cas_agora_parts = [
	cas_guitar_body
	cas_bass_body
	cas_drums
	cas_mic
]

script create_agora_character_struct 
	RequireParams \{[
			Player
		]
		all}
	net_get_character_name Player = <Player> check_profanity = 0
	savegame = 0
	if isxenonorwindx
		if playerinfoequals <Player> is_local_client = 1
			getplayerinfo <Player> controller
			get_savegame_from_controller controller = <controller>
		endif
	endif
	getplayerinfo <Player> character_id
	if characterprofilegetstruct Name = <character_id> savegame = <savegame> dont_assert
		if StructureContains structure = <profile_struct> appearance
			getplayerinfo <Player> part
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
	0xcb0276c2 \{load = true}
	filterappearance appearance_name = appearance part_set = $instrument_part_sets chosen_set = <instrument>
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
	repeat <array_Size>
	0xcb0276c2 \{load = FALSE
		0xc28bbbd1 = FALSE}
	return appearance_data = {<appearance_data> parts = <array>}
endscript

script agora_material_reformat 
	ScriptAssert \{'agora_material_reformat: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript
