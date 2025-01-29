
script cas_handle_disqualifications 
	if StructureContains \{structure = $cas_current_appearance
			cas_body}
		cas_disq_resolve_hat_hair part = <part> desc_id = <desc_id>
	endif
	return new_desc_id = <new_desc_id>
endscript

script get_body_specific_part_names 
	if StructureContains \{structure = $cas_current_appearance
			cas_body}
		body_desc_id = (($cas_current_appearance.cas_body).desc_id)
		if getactualcasoptionstruct part = cas_body desc_id = <body_desc_id> no_resolve
			if GotParam \{body_specific_parts}
				hair_part = (<body_specific_parts>.cas_hair)
				hat_part = (<body_specific_parts>.cas_hat)
				hat_hair_part = (<body_specific_parts>.cas_hat_hair)
				return hair_part = <hair_part> hat_part = <hat_part> hat_hair_part = <hat_hair_part>
			endif
		endif
	endif
	ScriptAssert \{'get_body_specific_part_names failed!'}
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
			hair_desc_id = None
		endif
	endif
	if checksumequals a = <part> b = <hat_part>
		<need_disq> = 1
		hat_desc_id = <orig_desc_id>
	else
		if getcasappearancepartdescid part = <hat_part>
			hat_desc_id = <desc_id>
		else
			hat_desc_id = None
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
			elseif (<hat_hair_param> = None)
				editcasappearance {
					target = setpart
					targetparams = {part = <hat_hair_part> desc_id = None}
				}
			else
				ScriptAssert 'Unknown hat_hair argument %a in %b %c' a = <hat_hair_param> b = <hat_part> c = <hat_desc_id> donotresolve
			endif
		else
			if cas_need_to_use_hat_hair hat_desc_id = <hat_desc_id> hair_part = <hair_part> hair_desc_id = <hair_desc_id>
				base_id = `hat	hair`
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

script cas_propogate_hair_color 
	get_body_specific_part_names
	other_parts = [something]
	SetArrayElement ArrayName = other_parts index = 0 NewValue = <hat_hair_part> ResolveGlobals = 0
	cas_propogate_color_to_other_parts part = <hair_part> other_parts = <other_parts>
endscript

script cas_propogate_color_to_other_parts 
	if getcasappearancepart part = <part>
		if GotParam \{chosen_materials}
			ForEachIn structure = <chosen_materials> pass_index do = cas_propogate_color_to_other_parts_foreach params = {
				part = <part>
				other_parts = <other_parts>
			}
		endif
	endif
endscript

script cas_propogate_color_to_other_parts_foreach 
	GetArraySize <other_parts>
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
	repeat <array_Size>
endscript

script cas_get_hat_hair_param 
	if GotParam \{hat_part}
		if GotParam \{hat_desc_id}
			getactualcasoptionstruct part = <hat_part> desc_id = <hat_desc_id>
			if GotParam \{hat_hair}
				return true hat_hair_param = <hat_hair>
			endif
		endif
	endif
	return \{FALSE}
endscript

script cas_need_to_use_hat_hair 
	if NOT (<hat_desc_id> = None)
		if getactualcasoptionstruct part = <hair_part> desc_id = <hair_desc_id>
			if GotParam \{hat_hair}
				return true hat_hair = <hat_hair>
			endif
		endif
	endif
endscript
cas_disq_hide_parts_list = [
]
