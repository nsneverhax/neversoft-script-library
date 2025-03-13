
script cas_handle_disqualifications 
	if structurecontains \{structure = $cas_current_appearance
			cas_body}
		cas_disq_resolve_hat_hair part = <part> desc_id = <desc_id>
	endif
	return new_desc_id = <new_desc_id>
endscript

script get_body_specific_part_names 
	if structurecontains \{structure = $cas_current_appearance
			cas_body}
		body_desc_id = (($cas_current_appearance.cas_body).desc_id)
		if getactualcasoptionstruct part = cas_body desc_id = <body_desc_id> no_resolve
			if gotparam \{body_specific_parts}
				hair_part = (<body_specific_parts>.cas_hair)
				hat_part = (<body_specific_parts>.cas_hat)
				hat_hair_part = (<body_specific_parts>.cas_hat_hair)
				return hair_part = <hair_part> hat_part = <hat_part> hat_hair_part = <hat_hair_part>
			endif
		endif
	endif
	scriptassert \{'get_body_specific_part_names failed!'}
endscript

script cas_disq_resolve_hat_hair 
	get_body_specific_part_names
	<need_disq> = 0
	orig_desc_id = <desc_id>
	if checksumequals a = <part> b = <hair_part>
		<need_disq> = 1
		hair_desc_id = <orig_desc_id>
		cas_propogate_hair_color reset = <new_desc_id>
	else
		if getcasappearancepartdescid part = <hair_part>
			hair_desc_id = <desc_id>
		else
			hair_desc_id = none
		endif
	endif
	if checksumequals a = <part> b = <hat_part>
		<need_disq> = 1
		hat_desc_id = <orig_desc_id>
	else
		if getcasappearancepartdescid part = <hat_part>
			hat_desc_id = <desc_id>
		else
			hat_desc_id = none
		endif
	endif
	if checksumequals a = <part> b = <hat_hair_part>
		<need_disq> = 1
	endif
	if (<need_disq> = 1)
		if cas_get_hat_hair_param hat_part = <hat_part> hat_desc_id = <hat_desc_id>
			if (<hat_hair_param> = original_hair)
				editcasappearance {
					target = clearpart
					targetparams = {part = <hat_hair_part>}
				}
			elseif (<hat_hair_param> = none)
				editcasappearance {
					target = setpart
					targetparams = {part = <hat_hair_part> desc_id = none}
				}
			else
				scriptassert 'Unknown hat_hair argument %a in %b %c' a = <hat_hair_param> b = <hat_part> c = <hat_desc_id> donotresolve
			endif
		else
			if cas_need_to_use_hat_hair hat_desc_id = <hat_desc_id> hair_part = <hair_part> hair_desc_id = <hair_desc_id>
				base_id = `hat hair`
				base_id = <hat_hair>
				printf 'Applying hat hair %s' s = <base_id>
				editcasappearance {
					target = setpart
					targetparams = {part = <hat_hair_part> desc_id = <base_id>}
				}
				cas_propogate_hair_color
			else
				editcasappearance {
					target = clearpart
					targetparams = {part = <hat_hair_part>}
				}
			endif
		endif
	endif
endscript

script cas_propogate_guitar_color_to 
	if (<part> = cas_guitar_bridges)
		if getcasappearancepartdescid part = <part>
			cas_propogate_color_to_other_parts \{part = cas_guitar_bridges
				other_parts = [
					cas_guitar_head
				]}
		endif
	endif
	if (<part> = cas_guitar_head)
		if getcasappearancepartdescid part = <part>
			cas_propogate_color_to_other_parts \{part = cas_guitar_head
				other_parts = [
					cas_guitar_bridges
				]}
		endif
	endif
	if (<part> = cas_bass_bridges)
		if getcasappearancepartdescid part = <part>
			cas_propogate_color_to_other_parts \{part = cas_bass_bridges
				other_parts = [
					cas_bass_head
				]}
		endif
	endif
	if (<part> = cas_bass_head)
		if getcasappearancepartdescid part = <part>
			cas_propogate_color_to_other_parts \{part = cas_bass_head
				other_parts = [
					cas_bass_bridges
				]}
		endif
	endif
endscript

script cas_propogate_guitar_color_from 
	if (<part> = cas_guitar_bridges)
		if getcasappearancepartdescid part = <part>
			cas_propogate_color_to_other_parts \{part = cas_guitar_head
				other_parts = [
					cas_guitar_bridges
				]}
		endif
	endif
	if (<part> = cas_guitar_head)
		if getcasappearancepartdescid part = <part>
			cas_propogate_color_to_other_parts \{part = cas_guitar_bridges
				other_parts = [
					cas_guitar_head
				]}
		endif
	endif
	if (<part> = cas_bass_bridges)
		if getcasappearancepartdescid part = <part>
			cas_propogate_color_to_other_parts \{part = cas_bass_head
				other_parts = [
					cas_bass_bridges
				]}
		endif
	endif
	if (<part> = cas_bass_head)
		if getcasappearancepartdescid part = <part>
			cas_propogate_color_to_other_parts \{part = cas_bass_bridges
				other_parts = [
					cas_bass_head
				]}
		endif
	endif
endscript

script cas_propogate_hair_color 
	get_body_specific_part_names
	other_parts = [something]
	setarrayelement arrayname = other_parts index = 0 newvalue = <hat_hair_part> resolveglobals = 0
	cas_propogate_color_to_other_parts part = <hair_part> other_parts = <other_parts>
endscript

script cas_propogate_color_to_other_parts 
	if getcasappearancepart part = <part>
		if gotparam \{chosen_materials}
			foreachin structure = <chosen_materials> pass_index do = cas_propogate_color_to_other_parts_foreach params = {
				part = <part>
				other_parts = <other_parts>
			}
		endif
	endif
endscript

script cas_propogate_color_to_other_parts_foreach 
	getarraysize <other_parts>
	i = 0
	begin
	given_other_part = (<other_parts> [<i>])
	if getcasappearancepartdescid part = <given_other_part>
		setcasappearancematerial {
			part = <given_other_part>
			material = <foreachin_name>
			value = <checksum>
		}
	endif
	i = (<i> + 1)
	repeat <array_size>
endscript

script cas_get_hat_hair_param 
	if gotparam \{hat_part}
		if gotparam \{hat_desc_id}
			getactualcasoptionstruct part = <hat_part> desc_id = <hat_desc_id>
			if gotparam \{hat_hair}
				return true hat_hair_param = <hat_hair>
			endif
		endif
	endif
	return \{false}
endscript

script cas_need_to_use_hat_hair 
	if NOT (<hat_desc_id> = none)
		if getactualcasoptionstruct part = <hair_part> desc_id = <hair_desc_id>
			if gotparam \{hat_hair}
				return true hat_hair = <hat_hair>
			endif
		endif
	endif
endscript

script cas_disq_basic_exclusions 
	if getactualcasoptionstruct part = <part> desc_id = <desc_id>
		if gotparam \{exclusions}
			foreachincas do = cas_disq_basic_exclusions_per_part params = {exclusions = <exclusions>}
		endif
		foreachincas do = cas_disq_reverse_exclusions_per_part params = {other_part = <part> other_desc_id = <desc_id>}
	endif
endscript

script cas_disq_reverse_exclusions_per_part 
	if getcasappearancepartdescid part = <part>
		if getactualcasoptionstruct part = <part> desc_id = <desc_id>
			if gotparam \{exclusions}
				if structurecontains structure = <exclusions> <other_part>
					exclusion = (<exclusions>.<other_part>)
					if structurecontains structure = <exclusion> reverse
						reverse_desc_id = (<exclusion>.reverse)
						if NOT gotparam \{reverse_desc_id}
							reverse_desc_id = none
						endif
						if (<other_desc_id> = <reverse_desc_id>)
							return
						endif
						if cas_disq_matches_change_from exclusion = <exclusion> desc_id = <other_desc_id>
							change_to = <reverse_desc_id>
							printf 'cas_disq_reverse_exclusions_per_part - %s - %t->%u' s = <part> t = <desc_id> u = <change_to>
							cas_disq_hide_parts part = <part> desc_id = <change_to>
							editcasappearance {
								target = setpart
								targetparams = {part = <part> desc_id = <change_to>}
							}
						endif
					endif
				endif
			endif
		endif
	endif
endscript

script cas_disq_basic_exclusions_per_part 
	if structurecontains structure = <exclusions> <part>
		exclusion = (<exclusions>.<part>)
		if getcasappearancepartdescid part = <part>
			if NOT structurecontains structure = <exclusion> change_to
				scriptassert \{'Exclusions require a \'change_to\' to be set'}
			endif
			if cas_disq_matches_change_from exclusion = <exclusion> desc_id = <desc_id>
				change_to = (<exclusion>.change_to)
				printf 'cas_disq_basic_exclusions_per_part - %s - %t->%u' s = <part> t = <desc_id> u = <change_to>
				cas_disq_hide_parts part = <part> desc_id = <change_to>
				editcasappearance {
					target = setpart
					targetparams = {part = <part> desc_id = <change_to>}
				}
			endif
		endif
	endif
endscript

script cas_disq_matches_change_from 
	if NOT structurecontains structure = <exclusion> change_from
		return \{true}
	else
		change_from = (<exclusion>.change_from)
		if isarray (<change_from>)
			getarraysize <change_from>
			i = 0
			begin
			change_from_name = (<change_from> [<i>])
			if (<desc_id> = <change_from_name>)
				return \{true}
			endif
			i = (<i> + 1)
			repeat <array_size>
		elseif (<desc_id> = <change_from>)
			return \{true}
		endif
	endif
endscript
cas_disq_hide_parts_list = [
]

script cas_disq_hide_parts 
	getarraysize \{$cas_disq_hide_parts_list}
	if (<array_size> > 0)
		change \{cas_disq_hide_parts_list = [
			]}
	endif
	foreachincas do = cas_disq_get_current_hide_parts params = {except = <part>}
	if getactualcasoptionstruct part = <part> desc_id = <desc_id>
		if gotparam \{hide_parts}
			new_hide_parts = <hide_parts>
			removeparameter \{hide_parts}
		endif
	endif
	if getcasappearancepartdescid part = <part>
		if getactualcasoptionstruct part = <part> desc_id = <desc_id>
			if gotparam \{hide_parts}
				old_hide_parts = <hide_parts>
			endif
		endif
	endif
	if gotparam \{old_hide_parts}
		printf \{'Unhiding old stuff...'}
		i = 0
		getarraysize <old_hide_parts>
		if (<array_size> > 0)
			begin
			if NOT arraycontains array = ($cas_disq_hide_parts_list) contains = (<old_hide_parts> [<i>])
				editcasappearance {
					target = hidegeom
					targetparams = {part = (<old_hide_parts> [<i>]) hide_geom = 0}
				}
			endif
			i = (<i> + 1)
			repeat <array_size>
		endif
	endif
	if gotparam \{new_hide_parts}
		printf \{'Hiding new stuff...'}
		i = 0
		getarraysize <new_hide_parts>
		if (<array_size> > 0)
			begin
			editcasappearance {
				target = hidegeom
				targetparams = {part = (<new_hide_parts> [<i>]) hide_geom = 1}
			}
			i = (<i> + 1)
			repeat <array_size>
		endif
	endif
endscript

script cas_disq_get_current_hide_parts 
	if NOT checksumequals a = <part> b = <except>
		if getcasappearancepartdescid part = <part>
			if getactualcasoptionstruct part = <part> desc_id = <desc_id> dont_assert
				if gotparam \{hide_parts}
					change cas_disq_hide_parts_list = (($cas_disq_hide_parts_list) + <hide_parts>)
				endif
			endif
		endif
	endif
endscript
