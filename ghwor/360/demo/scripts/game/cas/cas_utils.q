
script check_if_part_deformable 
	if getcasappearancepartdescid part = <part>
		getactualcasoptionstruct part = <part> desc_id = <desc_id>
		if gotparam \{deform_bones}
			return \{is_enabled = 1}
		endif
	endif
	return \{is_enabled = 0}
endscript

script is_part_capable 
	requireparams \{[
			part
		]
		all}
	if getcasappearancepartdescid part = <part>
		getactualcasoptionstruct part = <part> desc_id = <desc_id>
		if gotparam \{cap_textures}
			getarraysize <cap_textures>
			if (<array_size> > 0)
				i = 0
				begin
				if structurecontains structure = (<cap_textures> [<i>]) user_layer_settings
					return \{true}
				endif
				i = (<i> + 1)
				repeat <array_size>
			endif
			return \{false}
		endif
		if gotparam \{sections}
			scriptassert \{'sections is deprecated'}
		endif
	endif
	return \{false}
endscript

script cas_item_is_visible 
	if istrue \{$worst_case_cas_debug}
		return \{true}
	endif
	if gotparam \{part_index}
		scriptassert \{'DEPRICATED! cas_item_is_visible should take a desc_id and use the lookup table for dlc reasons!'}
	elseif gotparam \{desc_id}
		if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
			scriptassert '%s %t not found' s = <part> t = <desc_id>
		endif
		if gotparam \{hidden}
			return \{false}
		endif
		if gotparam \{swatch_for}
			return \{false}
		endif
	else
		scriptassert \{qs(0x05d9170f)}
	endif
	return \{true}
endscript

script get_part_current_desc_id 
	if getcasappearancepartdescid part = <part>
		return true current_desc_id = <desc_id>
	endif
	return \{false
		current_desc_id = none}
endscript

script get_part_key_from_appearance 
	if structurecontains structure = <appearance> <part>
		if structurecontains structure = (<appearance>.<part>) desc_id
			if getactualcasoptionstruct part = <part> desc_id = ((<appearance>.<part>).desc_id)
				if gotparam <key>
					ret_struct = {}
					updatestructelement struct = <ret_struct> element = <key> value = ((<...>).<key>)
					return true {<newstruct>}
				endif
			endif
		endif
	endif
	return \{false}
endscript

script get_body_key_from_appearance 
	if structurecontains structure = <appearance> cas_body
		getactualcasoptionstruct part = cas_body desc_id = (<appearance>.cas_body.desc_id)
		if gotparam <key>
			ret_struct = {}
			updatestructelement struct = <ret_struct> element = <key> value = ((<...>).<key>)
			return true {<newstruct>}
		endif
	elseif structurecontains structure = <appearance> cas_full_body
		getactualcasoptionstruct part = cas_full_body desc_id = (<appearance>.cas_full_body.desc_id)
		if gotparam <key>
			ret_struct = {}
			updatestructelement struct = <ret_struct> element = <key> value = ((<...>).<key>)
			return true {<newstruct>}
		endif
	else
		scriptassert \{'No body part in appearance'}
	endif
	return \{false}
endscript

script cas_add_item_to_appearance 
	requireparams \{[
			part
			desc_id
		]
		all}
	cas_handle_disqualifications part = <part> desc_id = <desc_id>
	if gotparam \{new_desc_id}
		desc_id = <new_desc_id>
		printf 'Disqualification told us to use this instead: %d' d = <desc_id>
	endif
	editcasappearance target = setpart targetparams = {part = <part> desc_id = <desc_id>}
	if NOT gotparam \{no_rebuild}
		if gotparam \{incremental}
			rebuildcurrentcasmodel \{buildscriptparams = {
					build_incremental
				}}
		else
			rebuildcurrentcasmodel
		endif
	endif
	if istrue \{$cas_debug}
		dumpheaps
	endif
endscript

script cas_find_tex_swap_parts \{tex_swap_parts = [
		]}
endscript

script cas_has_tex_replace 
endscript

script cas_desc_id_is_excluded \{part_name = none
		part_desc_id = none}
	if checksumequals a = <part_desc_id> b = none
		return \{false}
	endif
	if cas_part_is_excluded part_name = <part_name>
		return true conflict_part = <conflict_part>
	endif
	getarraysize ($master_editable_list)
	i = 0
	begin
	list_part_name = ((($master_editable_list) [<i>]).part)
	if NOT checksumequals a = <list_part_name> b = <part_name>
		if cas_desc_id_is_excluded_part list_part_name = <list_part_name> change_part_name = <part_name> change_part_desc_id = <part_desc_id>
			return true conflict_part = <conflict_part>
		endif
	endif
	i = (<i> + 1)
	repeat <array_size>
	return \{false}
endscript

script cas_desc_id_is_excluded_part 
	if getcasappearancepartdescid part = <list_part_name>
		if getactualcasoptionstruct part = <list_part_name> desc_id = <desc_id>
			if gotparam \{exclusions}
				conflict_part = {part = <list_part_name> desc_id = <desc_id>}
				if structurecontains structure = <exclusions> <change_part_name>
					exclusion = (<exclusions>.<change_part_name>)
					if NOT structurecontains structure = <exclusion> reverse
						if cas_disq_matches_change_from exclusion = <exclusion> desc_id = <change_part_desc_id>
							return true conflict_part = <conflict_part>
						endif
					endif
				endif
			endif
		endif
	endif
	return \{false}
endscript

script cas_part_is_excluded \{part_name = none}
	getarraysize ($master_editable_list)
	i = 0
	begin
	list_part_name = ((($master_editable_list) [<i>]).part)
	if NOT checksumequals a = <list_part_name> b = <part_name>
		if cas_part_is_excluded_part list_part_name = <list_part_name> change_part_name = <part_name> change_part_desc_id = <part_desc_id>
			return true conflict_part = <conflict_part>
		endif
	endif
	i = (<i> + 1)
	repeat <array_size>
	return \{false}
endscript

script cas_part_is_excluded_part 
	if getcasappearancepartdescid part = <list_part_name>
		if getactualcasoptionstruct part = <list_part_name> desc_id = <desc_id>
			conflict_part = {part = <list_part_name> desc_id = <desc_id>}
			if gotparam \{exclusions}
				if structurecontains structure = <exclusions> <change_part_name>
					exclusion = (<exclusions>.<change_part_name>)
					if NOT structurecontains structure = <exclusion> reverse
						if NOT structurecontains structure = <exclusion> change_from
							return true conflict_part = <conflict_part>
						endif
					endif
				endif
			endif
			if gotparam \{hide_parts}
				i = 0
				getarraysize <hide_parts>
				if (<array_size> > 0)
					begin
					if checksumequals a = (<hide_parts> [<i>]) b = <change_part_name>
						return true conflict_part = <conflict_part>
					endif
					i = (<i> + 1)
					repeat <array_size>
				endif
			endif
		endif
	endif
	return \{false}
endscript

script cas_part_will_conflict \{part_name = none
		part_desc_id = none
		force_first_include_part = 0}
	if checksumequals a = <part_desc_id> b = none
		return \{false}
	endif
	if checksumequals a = <part_name> b = none
		return \{false}
	endif
	getactualcasoptionstruct part = <part_name> desc_id = <part_desc_id>
	change_parts = []
	conflict = false
	if gotparam \{inclusion}
		getarraysize \{inclusion}
		inclusion_size = <array_size>
		if (<inclusion_size> > 0)
			i = 0
			begin
			if NOT getcasappearancepartdescid part = (<inclusion> [<i>].part)
				desc_id = none
			endif
			valid = (<inclusion> [<i>].valid)
			get_first_inclusion_part = <force_first_include_part>
			if NOT (arraycontains array = <valid> contains = <desc_id>)
				get_first_inclusion_part = 1
			endif
			if (<get_first_inclusion_part> = 1)
				getarraysize <valid>
				j = 0
				begin
				if is_part_unlocked part = (<inclusion> [<i>].part) desc_id = ((<inclusion> [<i>].valid) [<j>]) savegame = ($cas_current_savegame)
					addarrayelement array = <change_parts> element = {part = (<inclusion> [<i>].part) desc_id = ((<inclusion> [<i>].valid) [<j>])}
					change_parts = <array>
					conflict = true
					break
				else
					if ((<j> + 1) = <array_size>)
						scriptassert qs(0xfa3c9e8a) p = <part_name> d = <part_desc_id> s = (<inclusion> [<i>].part) donotresolve
					endif
				endif
				j = (<j> + 1)
				repeat <array_size>
			endif
			i = (<i> + 1)
			repeat <inclusion_size>
		endif
	endif
	getarraysize \{change_parts}
	if (<array_size> > 0)
		return change_parts = <change_parts>
	else
		return
	endif
endscript

script cas_in_inclusion_list 
	if gotparam \{inclusion}
		getarraysize \{inclusion}
		matched_part = 0
		if (<array_size> > 0)
			i = 0
			begin
			inc_part = (<inclusion> [<i>].part)
			if (checksumequals a = <inc_part> b = <part_name>)
				matched_part = 1
				if arraycontains array = (<inclusion> [<i>].valid) contains = <part_desc_id>
					printf \{qs(0xc4069ea6)}
					return \{true}
				endif
			endif
			i = (<i> + 1)
			repeat <array_size>
			if (<matched_part> = 0)
				return \{true}
			endif
		endif
	else
		return \{true}
	endif
	return \{false}
endscript

script is_part_unlocked 
	requireparams \{[
			part
			desc_id
			savegame
		]
		all}
	if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
		scriptassert '%s %t not found' s = <part> t = <desc_id>
	endif
	if gotparam \{locked}
		if check_cas_item_unlocked_flag part = <part> desc_id = <desc_id> savegame = <savegame>
			return \{true}
		else
			return \{false}
		endif
	else
		return \{true}
	endif
endscript

script is_part_unlockable \{part = !q1768515945
		desc_id = !q1768515945
		savegame = !i1768515945}
	if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
		scriptassert '%s %t not found' s = <part> t = <desc_id>
	endif
	if gotparam \{locked}
		return \{true}
	else
		return \{false}
	endif
endscript

script guitar_has_strings 
	requireparams \{[
			part
			desc_id
		]
		all}
	if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
		scriptassert '%s %t not found' s = <part> t = <desc_id>
	endif
	if gotparam \{no_strings}
		return \{false}
	else
		return \{true}
	endif
endscript
