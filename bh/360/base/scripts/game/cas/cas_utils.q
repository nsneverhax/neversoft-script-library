
script check_if_part_deformable 
	if GetCASAppearancePartDescID part = <part>
		GetActualCASOptionStruct part = <part> desc_id = <desc_id>
		if GotParam \{deform_bones}
			return \{is_enabled = 1}
		endif
	endif
	return \{is_enabled = 0}
endscript

script is_part_capable 
	RequireParams \{[
			part
		]
		all}
	if GetCASAppearancePartDescID part = <part>
		GetActualCASOptionStruct part = <part> desc_id = <desc_id>
		if GotParam \{cap_textures}
			GetArraySize <cap_textures>
			if (<array_size> > 0)
				i = 0
				begin
				if StructureContains structure = (<cap_textures> [<i>]) user_layer_settings
					return \{true}
				endif
				i = (<i> + 1)
				repeat <array_size>
			endif
			return \{false}
		endif
		if GotParam \{sections}
			ScriptAssert \{'sections is deprecated'}
		endif
	endif
	return \{false}
endscript

script cas_item_is_visible 
	if IsTrue \{$worst_case_cas_debug}
		return \{true}
	endif
	if GotParam \{part_index}
		ScriptAssert \{'DEPRICATED! cas_item_is_visible should take a desc_id and use the lookup table for dlc reasons!'}
	elseif GotParam \{desc_id}
		if NOT GetActualCASOptionStruct part = <part> desc_id = <desc_id>
			ScriptAssert '%s %t not found' s = <part> t = <desc_id>
		endif
		if GotParam \{hidden}
			return \{false}
		endif
		if GotParam \{swatch_for}
			return \{false}
		endif
	else
		ScriptAssert \{qs(0x05d9170f)}
	endif
	return \{true}
endscript

script get_part_current_desc_id 
	if GetCASAppearancePartDescID part = <part>
		return true current_desc_id = <desc_id>
	endif
	return \{false
		current_desc_id = None}
endscript

script get_part_key_from_appearance 
	if StructureContains structure = <appearance> <part>
		if StructureContains structure = (<appearance>.<part>) desc_id
			if GetActualCASOptionStruct part = <part> desc_id = ((<appearance>.<part>).desc_id)
				if GotParam <key>
					ret_struct = {}
					UpdateStructElement struct = <ret_struct> element = <key> value = ((<...>).<key>)
					return true {<newstruct>}
				endif
			endif
		endif
	endif
	return \{false}
endscript

script get_body_key_from_appearance 
	if StructureContains structure = <appearance> CAS_Body
		GetActualCASOptionStruct part = CAS_Body desc_id = (<appearance>.CAS_Body.desc_id)
		if GotParam <key>
			ret_struct = {}
			UpdateStructElement struct = <ret_struct> element = <key> value = ((<...>).<key>)
			return true {<newstruct>}
		endif
	elseif StructureContains structure = <appearance> CAS_Full_Body
		GetActualCASOptionStruct part = CAS_Full_Body desc_id = (<appearance>.CAS_Full_Body.desc_id)
		if GotParam <key>
			ret_struct = {}
			UpdateStructElement struct = <ret_struct> element = <key> value = ((<...>).<key>)
			return true {<newstruct>}
		endif
	else
		ScriptAssert \{'No body part in appearance'}
	endif
	return \{false}
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
	EditCASAppearance target = SetPart targetParams = {part = <part> desc_id = <desc_id>}
	if NOT GotParam \{no_rebuild}
		if GotParam \{incremental}
			RebuildCurrentCASModel \{buildscriptparams = {
					build_incremental
				}}
		else
			RebuildCurrentCASModel
		endif
	endif
	if IsTrue \{$cas_debug}
		Dumpheaps
	endif
endscript

script cas_find_tex_swap_parts \{tex_swap_parts = [
		]}
endscript

script cas_has_tex_replace 
endscript

script cas_desc_id_is_excluded \{part_name = None
		part_desc_id = None}
	if checksumequals a = <part_desc_id> b = None
		return \{false}
	endif
	if cas_part_is_excluded part_name = <part_name>
		return true conflict_part = <conflict_part>
	endif
	GetArraySize ($master_editable_list)
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
	if GetCASAppearancePartDescID part = <list_part_name>
		if GetActualCASOptionStruct part = <list_part_name> desc_id = <desc_id>
			if GotParam \{exclusions}
				conflict_part = {part = <list_part_name> desc_id = <desc_id>}
				if StructureContains structure = <exclusions> <change_part_name>
					exclusion = (<exclusions>.<change_part_name>)
					if NOT StructureContains structure = <exclusion> reverse
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

script cas_part_is_excluded \{part_name = None}
	GetArraySize ($master_editable_list)
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
	if GetCASAppearancePartDescID part = <list_part_name>
		if GetActualCASOptionStruct part = <list_part_name> desc_id = <desc_id>
			conflict_part = {part = <list_part_name> desc_id = <desc_id>}
			if GotParam \{exclusions}
				if StructureContains structure = <exclusions> <change_part_name>
					exclusion = (<exclusions>.<change_part_name>)
					if NOT StructureContains structure = <exclusion> reverse
						if NOT StructureContains structure = <exclusion> change_from
							return true conflict_part = <conflict_part>
						endif
					endif
				endif
			endif
			if GotParam \{hide_parts}
				i = 0
				GetArraySize <hide_parts>
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

script cas_part_will_conflict \{part_name = None
		part_desc_id = None
		force_first_include_part = 0}
	if checksumequals a = <part_desc_id> b = None
		return \{false}
	endif
	if checksumequals a = <part_name> b = None
		return \{false}
	endif
	GetActualCASOptionStruct part = <part_name> desc_id = <part_desc_id>
	change_parts = []
	conflict = false
	if GotParam \{inclusion}
		GetArraySize \{inclusion}
		inclusion_size = <array_size>
		if (<inclusion_size> > 0)
			i = 0
			begin
			if NOT GetCASAppearancePartDescID part = (<inclusion> [<i>].part)
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
					if ((<j> + 1) = <array_size>)
						ScriptAssert qs(0xfa3c9e8a) p = <part_name> d = <part_desc_id> s = (<inclusion> [<i>].part) DoNotResolve
					endif
				endif
				j = (<j> + 1)
				repeat <array_size>
			endif
			i = (<i> + 1)
			repeat <inclusion_size>
		endif
	endif
	GetArraySize \{change_parts}
	if (<array_size> > 0)
		return change_parts = <change_parts>
	else
		return
	endif
endscript

script cas_in_inclusion_list 
	if GotParam \{inclusion}
		GetArraySize \{inclusion}
		matched_part = 0
		if (<array_size> > 0)
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
	RequireParams \{[
			part
			desc_id
			savegame
		]
		all}
	if NOT GetActualCASOptionStruct part = <part> desc_id = <desc_id>
		ScriptAssert '%s %t not found' s = <part> t = <desc_id>
	endif
	if GotParam \{locked}
		if check_cas_item_unlocked_flag part = <part> desc_id = <desc_id> savegame = <savegame>
			return \{true}
		else
			return \{false}
		endif
	else
		return \{true}
	endif
endscript

script guitar_has_strings 
	RequireParams \{[
			part
			desc_id
		]
		all}
	if NOT GetActualCASOptionStruct part = <part> desc_id = <desc_id>
		ScriptAssert '%s %t not found' s = <part> t = <desc_id>
	endif
	if GotParam \{no_strings}
		return \{false}
	else
		return \{true}
	endif
endscript
