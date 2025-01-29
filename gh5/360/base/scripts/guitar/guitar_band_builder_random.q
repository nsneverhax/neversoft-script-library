
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
		updatestructelement struct = <used_parts> element = <part_name> value = <array>
		used_parts = <newstruct>
	endif
	i = (<i> + 1)
	repeat <array_Size>
	return used_parts = <used_parts>
endscript

script cas_get_random_character 
	RequireParams \{[
			savegame
			part
			categories
		]
		all}
	characterprofilegetlist savegame = <savegame> categories = <categories>
	GetArraySize <profile_list>
	if NOT GotParam \{band_members_array}
		if (<savegame> >= 0)
			get_band_members_as_array savegame = <savegame>
		else
			band_members_array = []
		endif
	endif
	character_id = ($failsafe_car_profile)
	begin
	if (<array_Size> > 0)
		GetRandomValue Name = index integer a = 0 b = (<array_Size> - 1)
		character_id = (<profile_list> [<index>])
		if (<character_id> != avatar)
			characterprofilegetstruct savegame = <savegame> Name = <character_id>
			if NOT ArrayContains array = <band_members_array> contains = <character_id>
				if NOT StructureContains structure = <profile_struct> no_random_pick
					if display_character_logic savegame = <savegame> profile_struct = <profile_struct> part = <part>
						return true character_id = <character_id>
					endif
				endif
			endif
		endif
	endif
	repeat 100
	return FALSE character_id = <character_id>
endscript

script cas_get_random_car_character 
	RequireParams \{[
			savegame
		]
		all}
	if cas_get_random_character savegame = <savegame> part = guitar categories = [cars]
		return true character_id = <character_id>
	endif
	return \{FALSE}
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
