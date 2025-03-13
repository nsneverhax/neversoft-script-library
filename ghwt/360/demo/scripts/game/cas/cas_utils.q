
script check_if_part_deformable 
	if getcasappearancepart part = <part>
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
	if getcasappearancepart part = <part>
		getactualcasoptionstruct part = <part> desc_id = <desc_id>
		if gotparam \{sections}
			return \{true}
		endif
	endif
	return \{false}
endscript

script check_if_part_editable 
	<retval> = 0
	if gotparam \{part}
		if getcasappearancepart part = <part>
			if (<desc_id> = none)
				<retval> = 0
			else
				<retval> = 1
			endif
		endif
	endif
	if (<retval>)
		if gotparam \{extra_script}
			<extra_script> <extra_script_params> part = <part>
			<retval> = <is_enabled>
		endif
	endif
	return is_enabled = <retval>
endscript

script check_if_parts_editable 
	<retval> = 0
	if gotparam \{parts}
		getarraysize <parts>
		<index> = 0
		begin
		if getcasappearancepart part = (<parts> [<index>])
			if (<desc_id> = none)
				<retval> = 0
			else
				<retval> = 1
				break
			endif
		endif
		<index> = (<index> + 1)
		repeat <array_size>
	endif
	return is_enabled = <retval>
endscript

script check_if_part_logoable 
	<retval> = 0
	if gotparam \{extra_script}
		<extra_script> <extra_script_params>
		if (<is_enabled> = 0)
			return is_enabled = <is_enabled>
		endif
	endif
	if gotparam \{parts}
		getarraysize <parts>
		<index> = 0
		begin
		character_part = (<parts> [<index>])
		if getcasappearancepart part = <character_part>
			getactualcasoptionstruct part = <character_part> desc_id = <desc_id>
			if gotparam \{supports_logo}
				<retval> = 1
				break
			else
				<retval> = 0
				break
			endif
		endif
		<index> = (<index> + 1)
		repeat <array_size>
	endif
	return is_enabled = <retval>
endscript

script check_if_part_front_logoable 
	if gotparam \{extra_script}
		<extra_script> <extra_script_params>
		if (<is_enabled> = 0)
			return is_enabled = <is_enabled>
		endif
	endif
	check_if_part_logoable <...>
	if (<is_enabled> = 1)
		if gotparam \{parts}
			getarraysize <parts>
			<index> = 0
			begin
			character_part = (<parts> [<index>])
			if getcasappearancepart part = <character_part>
				getactualcasoptionstruct part = <character_part> desc_id = <desc_id>
				if gotparam \{no_front_logo}
					return \{is_enabled = 0}
				endif
			endif
			<index> = (<index> + 1)
			repeat <array_size>
		endif
	endif
	return is_enabled = <is_enabled>
endscript

script check_if_part_back_logoable 
	if gotparam \{extra_script}
		<extra_script> <extra_script_params>
		if (<is_enabled> = 0)
			return is_enabled = <is_enabled>
		endif
	endif
	check_if_part_logoable <...>
	if (<is_enabled> = 1)
		if gotparam \{parts}
			getarraysize <parts>
			<index> = 0
			begin
			character_part = (<parts> [<index>])
			if getcasappearancepart part = <character_part>
				getactualcasoptionstruct part = <character_part> desc_id = <desc_id>
				if gotparam \{no_back_logo}
					return \{is_enabled = 0}
				endif
			endif
			<index> = (<index> + 1)
			repeat <array_size>
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
	getarraysize \{parts}
	if NOT (<array_size> = 1)
		scriptassert \{'check_if_part_logo_adjustable assumes parts=[] list has one entry'}
	endif
	if getcasappearancepart part = <logo_part>
		if (<desc_id> = none)
			return \{is_enabled = 0}
		endif
	else
		return \{is_enabled = 0}
	endif
	character_part = (<parts> [0])
	if getcasappearancepart part = <character_part>
		getactualcasoptionstruct part = <character_part> desc_id = <desc_id>
		extendcrc <logo_part> '_Adjust' out = adjustcrc
		if gotparam <adjustcrc>
			if NOT structurecontains structure = <adjustcrc> material
				softassert '%s should contain a material and pass' s = <adjustcrc>
			elseif NOT structurecontains structure = <adjustcrc> pass
				softassert '%s should contain a material and pass' s = <adjustcrc>
			endif
			return \{is_enabled = 1}
		endif
	endif
	return \{is_enabled = 0}
endscript

script check_if_has_belt 
	<retval> = 0
	if getcasappearancepart \{part = cas_belt}
		if NOT (<desc_id> = none)
			<retval> = 1
		endif
	endif
	return is_enabled = <retval>
endscript

script check_if_part_colorable 
	<retval> = 0
	if gotparam \{extra_script}
		<extra_script> <extra_script_params>
		if (<is_enabled> = 0)
			return is_enabled = <is_enabled>
		endif
	endif
	if gotparam \{parts}
		getarraysize <parts>
		<index> = 0
		begin
		character_part = (<parts> [<index>])
		if getcasappearancepart part = <character_part>
			if (<desc_id> = none)
				<retval> = 0
				break
			else
				if getactualcasoptionstruct part = <character_part> desc_id = <desc_id> dont_assert
					if gotparam \{modify_all_materials}
						<retval> = 1
						break
					else
						if gotparam \{materials}
							getarraysize <materials>
							if (<array_size> > 0)
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
		repeat <array_size>
	endif
	return is_enabled = <retval>
endscript

script check_if_secondary_colorable 
	check_if_part_colorable <...>
	if (<is_enabled> = 0)
		return is_enabled = <is_enabled>
	endif
	if gotparam \{parts}
		getarraysize <parts>
		<index> = 0
		begin
		character_part = (<parts> [<index>])
		if getcasappearancepart part = <character_part>
			getactualcasoptionstruct part = <character_part> desc_id = <desc_id>
			if gotparam \{modify_all_materials}
				<retval> = 0
				break
			endif
			if gotparam \{materials}
				getarraysize <materials>
				if (<array_size> > 1)
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
		repeat <array_size>
	endif
	return is_enabled = <retval>
endscript

script cas_item_is_visible 
	if istrue \{$worst_case_cas_debug}
		return \{true}
	endif
	if structurecontains structure = ($<part> [<part_index>]) hidden
		return \{false}
	endif
	return \{true}
endscript

script cas_item_rebuild 
	if NOT getcasappearancepart part = <part>
		scriptassert '%s not found' s = <part> donotresolve
	endif
	if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
		scriptassert '%s %t not found' s = <part> t = <desc_id>
	endif
	if NOT gotparam \{no_rebuild}
		return \{true}
	else
		return \{false}
	endif
endscript

script cas_item_matches_genre 
endscript

script get_part_current_desc_id 
	if getcasappearancepart part = <part>
		if gotparam \{desc_id}
			return true current_desc_id = <desc_id>
		endif
	endif
	return \{false
		current_desc_id = none}
endscript

script get_is_wearing_cas_item 
	if get_part_current_desc_id part = <part>
		if (<current_desc_id> = <desc_id>)
			return \{true}
		endif
	endif
	return \{false}
endscript

script get_key_from_appearance 
	getarraysize \{$master_editable_list}
	i = 0
	begin
	part_name = ((($master_editable_list) [<i>]).part)
	if structurecontains structure = <appearance> <part_name>
		if structurecontains structure = (<appearance>.<part_name>) desc_id
			if getactualcasoptionstruct part = <part_name> desc_id = ((<appearance>.<part_name>).desc_id)
				if gotparam <key>
					ret_struct = {}
					updatestructelement struct = <ret_struct> element = <key> value = ((<...>).<key>)
					return true {<newstruct>}
				endif
			endif
		endif
	endif
	i = (<i> + 1)
	repeat <array_size>
	return \{false}
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

script findfrontenddescfromchecksum 
	part_struct = ($<part>)
	getarraysize <part_struct>
	<i> = 0
	begin
	if ((<part_struct> [<i>].desc_id) = <desc_id>)
		if structurecontains structure = (<part_struct> [<i>]) frontend_desc
			<return_val> = (<part_struct> [<i>].frontend_desc)
		endif
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	scriptassert \{'frontend_desc not found'}
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
	requireparams \{[
			appearance
			part_list
		]
		all}
	getarraysize <part_list>
	i = 0
	begin
	if structurecontains structure = (<part_list> [<i>]) part
		part_name = (<part_list> [<i>].part)
		if structurecontains structure = <appearance> <part_name>
			part_desc = ((<appearance>).<part_name>)
			if structurecontains structure = <part_desc> desc_id
				if cas_has_tex_replace part = <part_name> desc_id = ((<part_desc>).desc_id)
					if NOT arraycontains array = <tex_swap_parts> contains = <part_name>
						ve_convert_checksum_to_array checksum = <part_name>
						tex_swap_parts = (<tex_swap_parts> + <checksum_array>)
					endif
				endif
			endif
		endif
		if structurecontains structure = (<part_list> [<i>]) desc_id
			if cas_has_tex_replace part = <part_name> desc_id = ((<part_list> [<i>]).desc_id)
				if NOT arraycontains array = <tex_swap_parts> contains = <part_name>
					ve_convert_checksum_to_array checksum = <part_name>
					tex_swap_parts = (<tex_swap_parts> + <checksum_array>)
				endif
			endif
		endif
	endif
	i = (<i> + 1)
	repeat <array_size>
	return tex_swap_parts = <tex_swap_parts>
endscript

script cas_has_tex_replace 
	getactualcasoptionstruct part = <part> desc_id = <desc_id>
	if ((gotparam replace) || (gotparam replace1) || (gotparam replace2) || (gotparam replace3))
		return \{true}
	endif
	return \{false}
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
	if getcasappearancepart part = <list_part_name>
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
	if getcasappearancepart part = <list_part_name>
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
		part_desc_id = none}
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
			if getcasappearancepart part = (<inclusion> [<i>].part)
				valid = (<inclusion> [<i>].valid)
				if NOT ((checksumequals a = <desc_id> b = none) || (arraycontains array = <valid> contains = <desc_id>))
					getarraysize <valid>
					j = 0
					begin
					if is_part_unlocked_purchased part = (<inclusion> [<i>].part) desc_id = ((<inclusion> [<i>].valid) [<j>]) savegame = ($cas_current_savegame)
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
		get_current_band_part_flags part = <part> desc_id = <desc_id> savegame = <savegame>
		if gotparam \{part_flags}
			if structurecontains structure = <part_flags> unlocked
				return \{true}
			else
				return \{false}
			endif
		else
			return \{false}
		endif
	else
		return \{true}
	endif
endscript

script is_part_purchased 
	requireparams \{[
			part
			desc_id
			savegame
		]
		all}
	if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
		scriptassert '%s %t not found' s = <part> t = <desc_id>
	endif
	if gotparam \{price}
		get_current_band_part_flags part = <part> desc_id = <desc_id> savegame = <savegame>
		if gotparam \{part_flags}
			if structurecontains structure = <part_flags> purchased
				return \{true}
			else
				return \{false}
			endif
		else
			return \{false}
		endif
	else
		return \{true}
	endif
endscript

script is_part_unlocked_purchased 
	requireparams \{[
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
	return \{false}
endscript
