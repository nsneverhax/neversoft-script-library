
script band_builder_get_used_parts_in_appearance \{used_parts = {
		}}
	requireparams \{[
			appearance
			used_parts
		]
		all}
	getarraysize \{$master_editable_list}
	i = 0
	begin
	part_name = ((($master_editable_list) [<i>]).part)
	if structurecontains structure = <appearance> <part_name>
		desc_id = (<appearance>.<part_name>.desc_id)
		array = []
		if structurecontains structure = <used_parts> <part_name>
			array = (<used_parts>.<part_name>)
		endif
		if NOT arraycontains array = <array> contains = <desc_id>
			addarrayelement array = <array> element = <desc_id>
		endif
		updatestructelement struct = <used_parts> element = <part_name> value = <array>
		used_parts = <newstruct>
	endif
	i = (<i> + 1)
	repeat <array_size>
	return used_parts = <used_parts>
endscript

script cas_get_random_character 
	requireparams \{[
			savegame
			part
			categories
		]
		all}
	characterprofilegetlist savegame = <savegame> categories = <categories>
	getarraysize <profile_list>
	if NOT gotparam \{band_members_array}
		if (<savegame> >= 0)
			get_band_members_as_array savegame = <savegame>
		else
			band_members_array = []
		endif
	endif
	character_id = ($failsafe_car_profile)
	begin
	if (<array_size> > 0)
		getrandomvalue name = index integer a = 0 b = (<array_size> - 1)
		character_id = (<profile_list> [<index>])
		if (<character_id> != avatar)
			characterprofilegetstruct savegame = <savegame> name = <character_id>
			if NOT arraycontains array = <band_members_array> contains = <character_id>
				if NOT structurecontains structure = <profile_struct> no_random_pick
					if display_character_logic savegame = <savegame> profile_struct = <profile_struct> part = <part>
						return true character_id = <character_id>
					endif
				endif
			endif
		endif
	endif
	repeat 100
	return false character_id = <character_id>
endscript

script cas_get_random_car_character 
	requireparams \{[
			savegame
		]
		all}
	if cas_get_random_character savegame = <savegame> part = guitar categories = [cars]
		return true character_id = <character_id>
	endif
	return \{false}
endscript

script cas_get_random_preset_character 
	requireparams \{[
			savegame
			part
		]
		all}
	cas_get_random_character savegame = <savegame> part = <part> categories = [ghrockers presetcars locked]
	return character_id = <character_id>
endscript

script cas_get_random_ghrocker 
	requireparams \{[
			savegame
		]
		all}
	cas_get_random_character savegame = <savegame> part = guitar categories = [ghrockers]
	return character_id = <character_id>
endscript
