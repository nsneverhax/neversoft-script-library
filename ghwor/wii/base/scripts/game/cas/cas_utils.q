
script is_part_capable 
	RequireParams \{[
			part
		]
		all}
	if getcasappearancepartdescid part = <part>
		getactualcasoptionstruct part = <part> desc_id = <desc_id>
		if GotParam \{cap_textures}
			GetArraySize <cap_textures>
			if (<array_Size> > 0)
				i = 0
				begin
				if StructureContains structure = (<cap_textures> [<i>]) user_layer_settings
					return \{true}
				endif
				i = (<i> + 1)
				repeat <array_Size>
			endif
			return \{FALSE}
		endif
		if GotParam \{sections}
			ScriptAssert \{'sections is deprecated'}
		endif
	endif
	return \{FALSE}
endscript

script cas_item_is_visible 
	if IsTrue \{$worst_case_cas_debug}
		return \{true}
	endif
	if GotParam \{part_index}
		ScriptAssert \{'DEPRICATED! cas_item_is_visible should take a desc_id and use the lookup table for dlc reasons!'}
	elseif GotParam \{desc_id}
		if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
			ScriptAssert '%s %t not found' s = <part> t = <desc_id>
		endif
		if GotParam \{hidden}
			return \{FALSE}
		endif
		if GotParam \{swatch_for}
			return \{FALSE}
		endif
	else
		ScriptAssert \{qs(0x05d9170f)}
	endif
	return \{true}
endscript

script get_part_current_desc_id 
	if getcasappearancepartdescid part = <part>
		return true current_desc_id = <desc_id>
	endif
	return \{FALSE
		current_desc_id = None}
endscript

script get_body_key_from_appearance 
	if StructureContains structure = <appearance> cas_body
		getactualcasoptionstruct part = cas_body desc_id = (<appearance>.cas_body.desc_id)
		if GotParam <key>
			ret_struct = {}
			updatestructelement struct = <ret_struct> element = <key> value = ((<...>).<key>)
			return true {<newstruct>}
		endif
	elseif StructureContains structure = <appearance> cas_full_body
		getactualcasoptionstruct part = cas_full_body desc_id = (<appearance>.cas_full_body.desc_id)
		if GotParam <key>
			ret_struct = {}
			updatestructelement struct = <ret_struct> element = <key> value = ((<...>).<key>)
			return true {<newstruct>}
		endif
	else
		ScriptAssert \{'No body part in appearance'}
	endif
	return \{FALSE}
endscript

script cas_add_item_to_appearance 
	RequireParams \{[
			part
			desc_id
		]
		all}
	cas_handle_disqualifications part = <part> desc_id = <desc_id>
	if GotParam \{new_desc_id}
		desc_id = <new_desc_id>
		printf 'Disqualification told us to use this instead: %d' d = <desc_id>
	endif
	editcasappearance target = setpart targetparams = {part = <part> desc_id = <desc_id>}
	if NOT GotParam \{no_rebuild}
		if GotParam \{incremental}
			rebuildcurrentcasmodel \{buildscriptparams = {
					build_incremental
				}}
		else
			rebuildcurrentcasmodel
		endif
	endif
	if IsTrue \{$cas_debug}
		Dumpheaps
	endif
endscript

script cas_part_will_conflict \{part_name = None
		part_desc_id = None
		force_first_include_part = 0}
	if checksumequals a = <part_desc_id> b = None
		return \{FALSE}
	endif
	if checksumequals a = <part_name> b = None
		return \{FALSE}
	endif
	getactualcasoptionstruct part = <part_name> desc_id = <part_desc_id>
	change_parts = []
	conflict = FALSE
	if GotParam \{inclusion}
		GetArraySize \{inclusion}
		inclusion_size = <array_Size>
		if (<inclusion_size> > 0)
			i = 0
			begin
			if NOT getcasappearancepartdescid part = (<inclusion> [<i>].part)
				desc_id = None
			endif
			valid = (<inclusion> [<i>].valid)
			get_first_inclusion_part = <force_first_include_part>
			if NOT (ArrayContains array = <valid> contains = <desc_id>)
				get_first_inclusion_part = 1
			endif
			if (<get_first_inclusion_part> = 1)
				GetArraySize <valid>
				j = 0
				begin
				if is_part_unlocked part = (<inclusion> [<i>].part) desc_id = ((<inclusion> [<i>].valid) [<j>]) savegame = ($cas_current_savegame)
					AddArrayElement array = <change_parts> element = {part = (<inclusion> [<i>].part) desc_id = ((<inclusion> [<i>].valid) [<j>])}
					change_parts = <array>
					conflict = true
					break
				else
					if ((<j> + 1) = <array_Size>)
						ScriptAssert qs(0xfa3c9e8a) p = <part_name> d = <part_desc_id> s = (<inclusion> [<i>].part) donotresolve
					endif
				endif
				j = (<j> + 1)
				repeat <array_Size>
			endif
			i = (<i> + 1)
			repeat <inclusion_size>
		endif
	endif
	GetArraySize \{change_parts}
	if (<array_Size> > 0)
		return change_parts = <change_parts>
	else
		return
	endif
endscript

script cas_in_inclusion_list 
	if GotParam \{inclusion}
		GetArraySize \{inclusion}
		matched_part = 0
		if (<array_Size> > 0)
			i = 0
			begin
			inc_part = (<inclusion> [<i>].part)
			if (checksumequals a = <inc_part> b = <part_name>)
				matched_part = 1
				if ArrayContains array = (<inclusion> [<i>].valid) contains = <part_desc_id>
					printf \{qs(0xc4069ea6)}
					return \{true}
				endif
			endif
			i = (<i> + 1)
			repeat <array_Size>
			if (<matched_part> = 0)
				return \{true}
			endif
		endif
	else
		return \{true}
	endif
	return \{FALSE}
endscript

script is_part_unlocked 
	RequireParams \{[
			part
			desc_id
			savegame
		]
		all}
	if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
		ScriptAssert '%s %t not found' s = <part> t = <desc_id>
	endif
	if GotParam \{locked}
		if check_cas_item_unlocked_flag part = <part> desc_id = <desc_id> savegame = <savegame>
			return \{true}
		else
			return \{FALSE}
		endif
	else
		return \{true}
	endif
endscript

script is_part_unlockable \{part = !q1768515945
		desc_id = !q1768515945
		savegame = !i1768515945}
	if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
		ScriptAssert '%s %t not found' s = <part> t = <desc_id>
	endif
	if GotParam \{locked}
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script guitar_has_strings 
	RequireParams \{[
			part
			desc_id
		]
		all}
	if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
		ScriptAssert '%s %t not found' s = <part> t = <desc_id>
	endif
	if GotParam \{no_strings}
		return \{FALSE}
	else
		return \{true}
	endif
endscript
