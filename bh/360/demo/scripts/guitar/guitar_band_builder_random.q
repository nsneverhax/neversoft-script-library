
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
	if NOT gotparam \{band_members_array}
		if (<savegame> >= 0)
			get_band_members_as_array savegame = <savegame>
		else
			band_members_array = []
		endif
	endif
	addarrayelement array = <band_members_array> element = avatar
	band_members_array = <array>
	getarraysize <band_members_array>
	if (<array_size> > 0)
		band_members_size = <array_size>
		i = 0
		begin
		if arraycontains array = <profile_list> contains = (<band_members_array> [<i>])
			getarraysize <profile_list>
			j = 0
			begin
			if ((<profile_list> [<j>]) = (<band_members_array> [<i>]))
				removearrayelement array = <profile_list> index = <j>
				profile_list = <array>
				break
			endif
			j = (<j> + 1)
			repeat <array_size>
		endif
		i = (<i> + 1)
		repeat <band_members_size>
	endif
	if demobuild
		getarraysize <profile_list>
		i = 0
		begin
		if NOT arraycontains array = ($0xd8edf164) contains = (<profile_list> [<i>])
			removearrayelement array = <array> element = (<profile_list> [<i>])
		endif
		i = (<i> + 1)
		repeat <array_size>
		profile_list = <array>
	endif
	begin
	getarraysize <profile_list>
	if NOT (<array_size> > 0)
		break
	endif
	getrandomvalue name = index integer a = 0 b = (<array_size> - 1)
	character_id = (<profile_list> [<index>])
	removearrayelement array = <profile_list> index = <index>
	profile_list = <array>
	characterprofilegetstruct savegame = <savegame> name = <character_id>
	if NOT structurecontains structure = <profile_struct> no_random_pick
		if display_character_logic savegame = <savegame> profile_struct = <profile_struct> part = <part>
			if gotparam \{female}
				get_is_female_from_character_id savegame = <savegame> character_id = <character_id>
				if (<is_female> = 1)
					return true character_id = <character_id>
				endif
			elseif gotparam \{male}
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
	return false character_id = ($failsafe_car_profile)
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
