
script cas_handle_disqualifications 
	if StructureContains \{structure = $cas_current_appearance
			CAS_Body}
		cas_disq_resolve_hat_hair part = <part> desc_id = <desc_id>
	endif
	return new_desc_id = <new_desc_id>
endscript

script get_body_specific_part_names 
	if StructureContains \{structure = $cas_current_appearance
			CAS_Body}
		body_desc_id = (($cas_current_appearance.CAS_Body).desc_id)
		if GetActualCASOptionStruct part = CAS_Body desc_id = <body_desc_id> no_resolve
			if GotParam \{body_specific_parts}
				hair_part = (<body_specific_parts>.CAS_Hair)
				hat_part = (<body_specific_parts>.CAS_Hat)
				hat_hair_part = (<body_specific_parts>.CAS_Hat_Hair)
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
		if GetCASAppearancePartDescID part = <hair_part>
			hair_desc_id = <desc_id>
		else
			hair_desc_id = None
		endif
	endif
	if checksumequals a = <part> b = <hat_part>
		<need_disq> = 1
		hat_desc_id = <orig_desc_id>
	else
		if GetCASAppearancePartDescID part = <hat_part>
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
				EditCASAppearance {
					target = ClearPart
					targetParams = {part = <hat_hair_part>}
				}
			elseif (<hat_hair_param> = None)
				EditCASAppearance {
					target = SetPart
					targetParams = {part = <hat_hair_part> desc_id = None}
				}
			else
				ScriptAssert 'Unknown hat_hair argument %a in %b %c' a = <hat_hair_param> b = <hat_part> c = <hat_desc_id> DoNotResolve
			endif
		else
			if cas_need_to_use_hat_hair hat_desc_id = <hat_desc_id> hair_part = <hair_part> hair_desc_id = <hair_desc_id>
				base_id = `hat	hair`
				base_id = <hat_hair>
				printf 'Applying hat hair %s' s = <base_id>
				EditCASAppearance {
					target = SetPart
					targetParams = {part = <hat_hair_part> desc_id = <base_id>}
				}
				cas_propogate_hair_color
			else
				EditCASAppearance {
					target = ClearPart
					targetParams = {part = <hat_hair_part>}
				}
			endif
		endif
	endif
endscript

script cas_propogate_guitar_color_to 
	if (<part> = CAS_Guitar_Bridges)
		if GetCASAppearancePartDescID part = <part>
			cas_propogate_color_to_other_parts \{part = CAS_Guitar_Bridges
				other_parts = [
					CAS_Guitar_Head
				]}
		endif
	endif
	if (<part> = CAS_Guitar_Head)
		if GetCASAppearancePartDescID part = <part>
			cas_propogate_color_to_other_parts \{part = CAS_Guitar_Head
				other_parts = [
					CAS_Guitar_Bridges
				]}
		endif
	endif
	if (<part> = CAS_bass_Bridges)
		if GetCASAppearancePartDescID part = <part>
			cas_propogate_color_to_other_parts \{part = CAS_bass_Bridges
				other_parts = [
					CAS_Bass_Head
				]}
		endif
	endif
	if (<part> = CAS_Bass_Head)
		if GetCASAppearancePartDescID part = <part>
			cas_propogate_color_to_other_parts \{part = CAS_Bass_Head
				other_parts = [
					CAS_bass_Bridges
				]}
		endif
	endif
endscript

script cas_propogate_guitar_color_from 
	if (<part> = CAS_Guitar_Bridges)
		if GetCASAppearancePartDescID part = <part>
			cas_propogate_color_to_other_parts \{part = CAS_Guitar_Head
				other_parts = [
					CAS_Guitar_Bridges
				]}
		endif
	endif
	if (<part> = CAS_Guitar_Head)
		if GetCASAppearancePartDescID part = <part>
			cas_propogate_color_to_other_parts \{part = CAS_Guitar_Bridges
				other_parts = [
					CAS_Guitar_Head
				]}
		endif
	endif
	if (<part> = CAS_bass_Bridges)
		if GetCASAppearancePartDescID part = <part>
			cas_propogate_color_to_other_parts \{part = CAS_Bass_Head
				other_parts = [
					CAS_bass_Bridges
				]}
		endif
	endif
	if (<part> = CAS_Bass_Head)
		if GetCASAppearancePartDescID part = <part>
			cas_propogate_color_to_other_parts \{part = CAS_bass_Bridges
				other_parts = [
					CAS_Bass_Head
				]}
		endif
	endif
endscript

script cas_propogate_hair_color 
	get_body_specific_part_names
	other_parts = [Something]
	SetArrayElement arrayName = other_parts index = 0 newValue = <hat_hair_part> ResolveGlobals = 0
	cas_propogate_color_to_other_parts part = <hair_part> other_parts = <other_parts>
endscript

script cas_propogate_color_to_other_parts 
	if GetCASAppearancePart part = <part>
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
	if GetCASAppearancePartDescID part = <given_other_part>
		SetCASAppearanceMaterial {
			part = <given_other_part>
			material = <foreachin_name>
			value = <checksum>
		}
	endif
	i = (<i> + 1)
	repeat <array_size>
endscript

script cas_get_hat_hair_param 
	if GotParam \{hat_part}
		if GotParam \{hat_desc_id}
			GetActualCASOptionStruct part = <hat_part> desc_id = <hat_desc_id>
			if GotParam \{hat_hair}
				return true hat_hair_param = <hat_hair>
			endif
		endif
	endif
	return \{false}
endscript

script cas_need_to_use_hat_hair 
	if NOT (<hat_desc_id> = None)
		if GetActualCASOptionStruct part = <hair_part> desc_id = <hair_desc_id>
			if GotParam \{hat_hair}
				return true hat_hair = <hat_hair>
			endif
		endif
	endif
endscript

script cas_disq_basic_exclusions 
	if GetActualCASOptionStruct part = <part> desc_id = <desc_id>
		if GotParam \{exclusions}
			ForEachInCAS do = cas_disq_basic_exclusions_per_part params = {exclusions = <exclusions>}
		endif
		ForEachInCAS do = cas_disq_reverse_exclusions_per_part params = {other_part = <part> other_desc_id = <desc_id>}
	endif
endscript

script cas_disq_reverse_exclusions_per_part 
	if GetCASAppearancePartDescID part = <part>
		if GetActualCASOptionStruct part = <part> desc_id = <desc_id>
			if GotParam \{exclusions}
				if StructureContains structure = <exclusions> <other_part>
					exclusion = (<exclusions>.<other_part>)
					if StructureContains structure = <exclusion> reverse
						reverse_desc_id = (<exclusion>.reverse)
						if NOT GotParam \{reverse_desc_id}
							reverse_desc_id = None
						endif
						if (<other_desc_id> = <reverse_desc_id>)
							return
						endif
						if cas_disq_matches_change_from exclusion = <exclusion> desc_id = <other_desc_id>
							change_to = <reverse_desc_id>
							printf 'cas_disq_reverse_exclusions_per_part - %s - %t->%u' s = <part> t = <desc_id> U = <change_to>
							cas_disq_hide_parts part = <part> desc_id = <change_to>
							EditCASAppearance {
								target = SetPart
								targetParams = {part = <part> desc_id = <change_to>}
							}
						endif
					endif
				endif
			endif
		endif
	endif
endscript

script cas_disq_basic_exclusions_per_part 
	if StructureContains structure = <exclusions> <part>
		exclusion = (<exclusions>.<part>)
		if GetCASAppearancePartDescID part = <part>
			if NOT StructureContains structure = <exclusion> change_to
				ScriptAssert \{'Exclusions require a \'change_to\' to be set'}
			endif
			if cas_disq_matches_change_from exclusion = <exclusion> desc_id = <desc_id>
				change_to = (<exclusion>.change_to)
				printf 'cas_disq_basic_exclusions_per_part - %s - %t->%u' s = <part> t = <desc_id> U = <change_to>
				cas_disq_hide_parts part = <part> desc_id = <change_to>
				EditCASAppearance {
					target = SetPart
					targetParams = {part = <part> desc_id = <change_to>}
				}
			endif
		endif
	endif
endscript

script cas_disq_matches_change_from 
	if NOT StructureContains structure = <exclusion> change_from
		return \{true}
	else
		change_from = (<exclusion>.change_from)
		if IsArray (<change_from>)
			GetArraySize <change_from>
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
	GetArraySize \{$cas_disq_hide_parts_list}
	if (<array_size> > 0)
		Change \{cas_disq_hide_parts_list = [
			]}
	endif
	ForEachInCAS do = cas_disq_get_current_hide_parts params = {except = <part>}
	if GetActualCASOptionStruct part = <part> desc_id = <desc_id>
		if GotParam \{hide_parts}
			new_hide_parts = <hide_parts>
			RemoveParameter \{hide_parts}
		endif
	endif
	if GetCASAppearancePartDescID part = <part>
		if GetActualCASOptionStruct part = <part> desc_id = <desc_id>
			if GotParam \{hide_parts}
				old_hide_parts = <hide_parts>
			endif
		endif
	endif
	if GotParam \{old_hide_parts}
		printf \{'Unhiding old stuff...'}
		i = 0
		GetArraySize <old_hide_parts>
		if (<array_size> > 0)
			begin
			if NOT ArrayContains array = ($cas_disq_hide_parts_list) contains = (<old_hide_parts> [<i>])
				EditCASAppearance {
					target = HideGeom
					targetParams = {part = (<old_hide_parts> [<i>]) hide_geom = 0}
				}
			endif
			i = (<i> + 1)
			repeat <array_size>
		endif
	endif
	if GotParam \{new_hide_parts}
		printf \{'Hiding new stuff...'}
		i = 0
		GetArraySize <new_hide_parts>
		if (<array_size> > 0)
			begin
			EditCASAppearance {
				target = HideGeom
				targetParams = {part = (<new_hide_parts> [<i>]) hide_geom = 1}
			}
			i = (<i> + 1)
			repeat <array_size>
		endif
	endif
endscript

script cas_disq_get_current_hide_parts 
	if NOT checksumequals a = <part> b = <except>
		if GetCASAppearancePartDescID part = <part>
			if GetActualCASOptionStruct part = <part> desc_id = <desc_id> dont_assert
				if GotParam \{hide_parts}
					Change cas_disq_hide_parts_list = (($cas_disq_hide_parts_list) + <hide_parts>)
				endif
			endif
		endif
	endif
endscript
