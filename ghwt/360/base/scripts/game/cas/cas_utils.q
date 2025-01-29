
script check_if_part_deformable 
	if getcasappearancepart part = <part>
		getactualcasoptionstruct part = <part> desc_id = <desc_id>
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
	if getcasappearancepart part = <part>
		getactualcasoptionstruct part = <part> desc_id = <desc_id>
		if GotParam \{sections}
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script check_if_part_editable 
	<retval> = 0
	if GotParam \{part}
		if getcasappearancepart part = <part>
			if (<desc_id> = None)
				<retval> = 0
			else
				<retval> = 1
			endif
		endif
	endif
	if (<retval>)
		if GotParam \{extra_script}
			<extra_script> <extra_script_params> part = <part>
			<retval> = <is_enabled>
		endif
	endif
	return is_enabled = <retval>
endscript

script check_if_parts_editable 
	<retval> = 0
	if GotParam \{parts}
		GetArraySize <parts>
		<index> = 0
		begin
		if getcasappearancepart part = (<parts> [<index>])
			if (<desc_id> = None)
				<retval> = 0
			else
				<retval> = 1
				break
			endif
		endif
		<index> = (<index> + 1)
		repeat <array_Size>
	endif
	return is_enabled = <retval>
endscript

script check_if_part_logoable 
	<retval> = 0
	if GotParam \{extra_script}
		<extra_script> <extra_script_params>
		if (<is_enabled> = 0)
			return is_enabled = <is_enabled>
		endif
	endif
	if GotParam \{parts}
		GetArraySize <parts>
		<index> = 0
		begin
		character_part = (<parts> [<index>])
		if getcasappearancepart part = <character_part>
			getactualcasoptionstruct part = <character_part> desc_id = <desc_id>
			if GotParam \{supports_logo}
				<retval> = 1
				break
			else
				<retval> = 0
				break
			endif
		endif
		<index> = (<index> + 1)
		repeat <array_Size>
	endif
	return is_enabled = <retval>
endscript

script check_if_part_front_logoable 
	if GotParam \{extra_script}
		<extra_script> <extra_script_params>
		if (<is_enabled> = 0)
			return is_enabled = <is_enabled>
		endif
	endif
	check_if_part_logoable <...>
	if (<is_enabled> = 1)
		if GotParam \{parts}
			GetArraySize <parts>
			<index> = 0
			begin
			character_part = (<parts> [<index>])
			if getcasappearancepart part = <character_part>
				getactualcasoptionstruct part = <character_part> desc_id = <desc_id>
				if GotParam \{no_front_logo}
					return \{is_enabled = 0}
				endif
			endif
			<index> = (<index> + 1)
			repeat <array_Size>
		endif
	endif
	return is_enabled = <is_enabled>
endscript

script check_if_part_back_logoable 
	if GotParam \{extra_script}
		<extra_script> <extra_script_params>
		if (<is_enabled> = 0)
			return is_enabled = <is_enabled>
		endif
	endif
	check_if_part_logoable <...>
	if (<is_enabled> = 1)
		if GotParam \{parts}
			GetArraySize <parts>
			<index> = 0
			begin
			character_part = (<parts> [<index>])
			if getcasappearancepart part = <character_part>
				getactualcasoptionstruct part = <character_part> desc_id = <desc_id>
				if GotParam \{no_back_logo}
					return \{is_enabled = 0}
				endif
			endif
			<index> = (<index> + 1)
			repeat <array_Size>
		endif
	endif
	return is_enabled = <is_enabled>
endscript

script check_if_part_back_logo_adjustable 
	check_if_part_back_logoable <...>
	if (<is_enabled> = 1)
		check_if_part_logo_adjustable <...>
		return is_enabled = <is_enabled>
	endif
	return is_enabled = <is_enabled>
endscript

script check_if_part_front_logo_adjustable 
	check_if_part_front_logoable <...>
	if (<is_enabled> = 1)
		check_if_part_logo_adjustable <...>
		return is_enabled = <is_enabled>
	endif
	return is_enabled = <is_enabled>
endscript

script check_if_part_logo_adjustable 
	GetArraySize \{parts}
	if NOT (<array_Size> = 1)
		ScriptAssert \{'check_if_part_logo_adjustable assumes parts=[] list has one entry'}
	endif
	if getcasappearancepart part = <logo_part>
		if (<desc_id> = None)
			return \{is_enabled = 0}
		endif
	else
		return \{is_enabled = 0}
	endif
	character_part = (<parts> [0])
	if getcasappearancepart part = <character_part>
		getactualcasoptionstruct part = <character_part> desc_id = <desc_id>
		ExtendCrc <logo_part> '_Adjust' out = adjustcrc
		if GotParam <adjustcrc>
			if NOT StructureContains structure = <adjustcrc> material
				SoftAssert '%s should contain a material and pass' s = <adjustcrc>
			elseif NOT StructureContains structure = <adjustcrc> pass
				SoftAssert '%s should contain a material and pass' s = <adjustcrc>
			endif
			return \{is_enabled = 1}
		endif
	endif
	return \{is_enabled = 0}
endscript

script check_if_has_belt 
	<retval> = 0
	if getcasappearancepart \{part = cas_belt}
		if NOT (<desc_id> = None)
			<retval> = 1
		endif
	endif
	return is_enabled = <retval>
endscript

script check_if_part_colorable 
	<retval> = 0
	if GotParam \{extra_script}
		<extra_script> <extra_script_params>
		if (<is_enabled> = 0)
			return is_enabled = <is_enabled>
		endif
	endif
	if GotParam \{parts}
		GetArraySize <parts>
		<index> = 0
		begin
		character_part = (<parts> [<index>])
		if getcasappearancepart part = <character_part>
			if (<desc_id> = None)
				<retval> = 0
				break
			else
				if getactualcasoptionstruct part = <character_part> desc_id = <desc_id> dont_assert
					if GotParam \{modify_all_materials}
						<retval> = 1
						break
					else
						if GotParam \{materials}
							GetArraySize <materials>
							if (<array_Size> > 0)
								<retval> = 1
							else
								<retval> = 0
							endif
						else
							<retval> = 0
						endif
						break
					endif
				endif
			endif
		endif
		<index> = (<index> + 1)
		repeat <array_Size>
	endif
	return is_enabled = <retval>
endscript

script check_if_secondary_colorable 
	check_if_part_colorable <...>
	if (<is_enabled> = 0)
		return is_enabled = <is_enabled>
	endif
	if GotParam \{parts}
		GetArraySize <parts>
		<index> = 0
		begin
		character_part = (<parts> [<index>])
		if getcasappearancepart part = <character_part>
			getactualcasoptionstruct part = <character_part> desc_id = <desc_id>
			if GotParam \{modify_all_materials}
				<retval> = 0
				break
			endif
			if GotParam \{materials}
				GetArraySize <materials>
				if (<array_Size> > 1)
					<retval> = 1
				else
					<retval> = 0
				endif
			else
				<retval> = 0
			endif
			break
		endif
		<index> = (<index> + 1)
		repeat <array_Size>
	endif
	return is_enabled = <retval>
endscript

script cas_item_is_visible 
	if IsTrue \{$worst_case_cas_debug}
		return \{true}
	endif
	if StructureContains structure = ($<part> [<part_index>]) hidden
		return \{FALSE}
	endif
	return \{true}
endscript

script cas_item_rebuild 
	if NOT getcasappearancepart part = <part>
		ScriptAssert '%s not found' s = <part> donotresolve
	endif
	if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
		ScriptAssert '%s %t not found' s = <part> t = <desc_id>
	endif
	if NOT GotParam \{no_rebuild}
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script cas_item_matches_genre 
endscript

script get_part_current_desc_id 
	if getcasappearancepart part = <part>
		if GotParam \{desc_id}
			return true current_desc_id = <desc_id>
		endif
	endif
	return \{FALSE
		current_desc_id = None}
endscript

script get_is_wearing_cas_item 
	if get_part_current_desc_id part = <part>
		if (<current_desc_id> = <desc_id>)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script get_key_from_appearance 
	GetArraySize \{$master_editable_list}
	i = 0
	begin
	part_name = ((($master_editable_list) [<i>]).part)
	if StructureContains structure = <appearance> <part_name>
		if StructureContains structure = (<appearance>.<part_name>) desc_id
			if getactualcasoptionstruct part = <part_name> desc_id = ((<appearance>.<part_name>).desc_id)
				if GotParam <key>
					ret_struct = {}
					updatestructelement struct = <ret_struct> element = <key> value = ((<...>).<key>)
					return true {<newstruct>}
				endif
			endif
		endif
	endif
	i = (<i> + 1)
	repeat <array_Size>
	return \{FALSE}
endscript

script get_part_key_from_appearance 
	if StructureContains structure = <appearance> <part>
		if StructureContains structure = (<appearance>.<part>) desc_id
			if getactualcasoptionstruct part = <part> desc_id = ((<appearance>.<part>).desc_id)
				if GotParam <key>
					ret_struct = {}
					updatestructelement struct = <ret_struct> element = <key> value = ((<...>).<key>)
					return true {<newstruct>}
				endif
			endif
		endif
	endif
	return \{FALSE}
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

script findfrontenddescfromchecksum 
	part_struct = ($<part>)
	GetArraySize <part_struct>
	<i> = 0
	begin
	if ((<part_struct> [<i>].desc_id) = <desc_id>)
		if StructureContains structure = (<part_struct> [<i>]) frontend_desc
			<return_val> = (<part_struct> [<i>].frontend_desc)
		endif
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	ScriptAssert \{'frontend_desc not found'}
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

script cas_find_tex_swap_parts \{tex_swap_parts = [
		]}
	RequireParams \{[
			appearance
			part_list
		]
		all}
	GetArraySize <part_list>
	i = 0
	begin
	if StructureContains structure = (<part_list> [<i>]) part
		part_name = (<part_list> [<i>].part)
		if StructureContains structure = <appearance> <part_name>
			part_desc = ((<appearance>).<part_name>)
			if StructureContains structure = <part_desc> desc_id
				if cas_has_tex_replace part = <part_name> desc_id = ((<part_desc>).desc_id)
					if NOT ArrayContains array = <tex_swap_parts> contains = <part_name>
						ve_convert_checksum_to_array checksum = <part_name>
						tex_swap_parts = (<tex_swap_parts> + <checksum_array>)
					endif
				endif
			endif
		endif
		if StructureContains structure = (<part_list> [<i>]) desc_id
			if cas_has_tex_replace part = <part_name> desc_id = ((<part_list> [<i>]).desc_id)
				if NOT ArrayContains array = <tex_swap_parts> contains = <part_name>
					ve_convert_checksum_to_array checksum = <part_name>
					tex_swap_parts = (<tex_swap_parts> + <checksum_array>)
				endif
			endif
		endif
	endif
	i = (<i> + 1)
	repeat <array_Size>
	return tex_swap_parts = <tex_swap_parts>
endscript

script cas_has_tex_replace 
	getactualcasoptionstruct part = <part> desc_id = <desc_id>
	if ((GotParam replace) || (GotParam replace1) || (GotParam replace2) || (GotParam replace3))
		return \{true}
	endif
	return \{FALSE}
endscript

script cas_desc_id_is_excluded \{part_name = None
		part_desc_id = None}
	if checksumequals a = <part_desc_id> b = None
		return \{FALSE}
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
	repeat <array_Size>
	return \{FALSE}
endscript

script cas_desc_id_is_excluded_part 
	if getcasappearancepart part = <list_part_name>
		if getactualcasoptionstruct part = <list_part_name> desc_id = <desc_id>
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
	return \{FALSE}
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
	repeat <array_Size>
	return \{FALSE}
endscript

script cas_part_is_excluded_part 
	if getcasappearancepart part = <list_part_name>
		if getactualcasoptionstruct part = <list_part_name> desc_id = <desc_id>
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
				if (<array_Size> > 0)
					begin
					if checksumequals a = (<hide_parts> [<i>]) b = <change_part_name>
						return true conflict_part = <conflict_part>
					endif
					i = (<i> + 1)
					repeat <array_Size>
				endif
			endif
		endif
	endif
	return \{FALSE}
endscript

script cas_part_will_conflict \{part_name = None
		part_desc_id = None}
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
			if getcasappearancepart part = (<inclusion> [<i>].part)
				valid = (<inclusion> [<i>].valid)
				if NOT ((checksumequals a = <desc_id> b = None) || (ArrayContains array = <valid> contains = <desc_id>))
					GetArraySize <valid>
					j = 0
					begin
					if is_part_unlocked_purchased part = (<inclusion> [<i>].part) desc_id = ((<inclusion> [<i>].valid) [<j>]) savegame = ($cas_current_savegame)
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
		get_current_band_part_flags part = <part> desc_id = <desc_id> savegame = <savegame>
		if GotParam \{part_flags}
			if StructureContains structure = <part_flags> unlocked
				return \{true}
			else
				return \{FALSE}
			endif
		else
			return \{FALSE}
		endif
	else
		return \{true}
	endif
endscript

script is_part_purchased 
	RequireParams \{[
			part
			desc_id
			savegame
		]
		all}
	if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
		ScriptAssert '%s %t not found' s = <part> t = <desc_id>
	endif
	if GotParam \{price}
		get_current_band_part_flags part = <part> desc_id = <desc_id> savegame = <savegame>
		if GotParam \{part_flags}
			if StructureContains structure = <part_flags> purchased
				return \{true}
			else
				return \{FALSE}
			endif
		else
			return \{FALSE}
		endif
	else
		return \{true}
	endif
endscript

script is_part_unlocked_purchased 
	RequireParams \{[
			part
			desc_id
			savegame
		]
		all}
	if is_part_unlocked part = <part> desc_id = <desc_id> savegame = <savegame>
		if is_part_purchased part = <part> desc_id = <desc_id> savegame = <savegame>
			return \{true}
		endif
	endif
	return \{FALSE}
endscript
