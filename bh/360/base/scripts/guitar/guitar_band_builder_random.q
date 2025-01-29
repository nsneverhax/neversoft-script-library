
script band_builder_get_used_parts_in_appearance \{used_parts = {
		}}
	RequireParams \{[
			appearance
			used_parts
		]
		all}
	GetArraySize \{$master_editable_list}
	i = 0
	begin
	part_name = ((($master_editable_list) [<i>]).part)
	if StructureContains structure = <appearance> <part_name>
		desc_id = (<appearance>.<part_name>.desc_id)
		array = []
		if StructureContains structure = <used_parts> <part_name>
			array = (<used_parts>.<part_name>)
		endif
		if NOT ArrayContains array = <array> contains = <desc_id>
			AddArrayElement array = <array> element = <desc_id>
		endif
		UpdateStructElement struct = <used_parts> element = <part_name> value = <array>
		used_parts = <newstruct>
	endif
	i = (<i> + 1)
	repeat <array_size>
	return used_parts = <used_parts>
endscript

script cas_get_random_character 
	RequireParams \{[
			savegame
			part
			categories
		]
		all}
	CharacterProfileGetList savegame = <savegame> categories = <categories>
	if NOT GotParam \{band_members_array}
		if (<savegame> >= 0)
			get_band_members_as_array savegame = <savegame>
		else
			band_members_array = []
		endif
	endif
	AddArrayElement array = <band_members_array> element = avatar
	band_members_array = <array>
	GetArraySize <band_members_array>
	if (<array_size> > 0)
		band_members_size = <array_size>
		i = 0
		begin
		if ArrayContains array = <profile_list> contains = (<band_members_array> [<i>])
			GetArraySize <profile_list>
			j = 0
			begin
			if ((<profile_list> [<j>]) = (<band_members_array> [<i>]))
				RemoveArrayElement array = <profile_list> index = <j>
				profile_list = <array>
				break
			endif
			j = (<j> + 1)
			repeat <array_size>
		endif
		i = (<i> + 1)
		repeat <band_members_size>
	endif
	begin
	GetArraySize <profile_list>
	if NOT (<array_size> > 0)
		break
	endif
	GetRandomValue name = index integer a = 0 b = (<array_size> - 1)
	character_id = (<profile_list> [<index>])
	RemoveArrayElement array = <profile_list> index = <index>
	profile_list = <array>
	CharacterProfileGetStruct savegame = <savegame> name = <character_id>
	if NOT StructureContains structure = <profile_struct> no_random_pick
		if display_character_logic savegame = <savegame> profile_struct = <profile_struct> part = <part>
			if GotParam \{female}
				get_is_female_from_character_id savegame = <savegame> character_id = <character_id>
				if (<is_female> = 1)
					return true character_id = <character_id>
				endif
			elseif GotParam \{male}
				get_is_female_from_character_id savegame = <savegame> character_id = <character_id>
				if (<is_female> = 0)
					return true character_id = <character_id>
				endif
			else
				return true character_id = <character_id>
			endif
		endif
	endif
	repeat
	return false character_id = ($FailSafe_CAR_Profile)
endscript

script cas_get_random_car_character 
	RequireParams \{[
			savegame
		]
		all}
	if cas_get_random_character savegame = <savegame> part = guitar categories = [cars]
		return true character_id = <character_id>
	endif
	return \{false}
endscript

script cas_get_random_preset_character 
	RequireParams \{[
			savegame
			part
		]
		all}
	cas_get_random_character savegame = <savegame> part = <part> categories = [ghrockers presetcars locked]
	return character_id = <character_id>
endscript

script cas_get_random_ghrocker 
	RequireParams \{[
			savegame
		]
		all}
	cas_get_random_character savegame = <savegame> part = guitar categories = [ghrockers]
	return character_id = <character_id>
endscript
