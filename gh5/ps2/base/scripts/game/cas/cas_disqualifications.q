
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
		if getcasappearancepart part = <hair_part>
			hair_desc_id = <desc_id>
		else
			hair_desc_id = None
		endif
	endif
	if checksumequals a = <part> b = <hat_part>
		<need_disq> = 1
		hat_desc_id = <orig_desc_id>
	else
		if getcasappearancepart part = <hat_part>
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

			endif
		else
			if cas_need_to_use_hat_hair hat_desc_id = <hat_desc_id> hair_part = <hair_part> hair_desc_id = <hair_desc_id>
				base_id = `hat	hair`
				base_id = <hat_hair>

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
		if getcasappearancepart part = <part>
			cas_propogate_color_to_other_parts \{part = cas_guitar_bridges
				other_parts = [
					cas_guitar_head
				]}
		endif
	endif
	if (<part> = cas_guitar_head)
		if getcasappearancepart part = <part>
			cas_propogate_color_to_other_parts \{part = cas_guitar_head
				other_parts = [
					cas_guitar_bridges
				]}
		endif
	endif
	if (<part> = cas_bass_bridges)
		if getcasappearancepart part = <part>
			cas_propogate_color_to_other_parts \{part = cas_bass_bridges
				other_parts = [
					cas_bass_head
				]}
		endif
	endif
	if (<part> = cas_bass_head)
		if getcasappearancepart part = <part>
			cas_propogate_color_to_other_parts \{part = cas_bass_head
				other_parts = [
					cas_bass_bridges
				]}
		endif
	endif
endscript

script cas_propogate_guitar_color_from 
	if (<part> = cas_guitar_bridges)
		if getcasappearancepart part = <part>
			cas_propogate_color_to_other_parts \{part = cas_guitar_head
				other_parts = [
					cas_guitar_bridges
				]}
		endif
	endif
	if (<part> = cas_guitar_head)
		if getcasappearancepart part = <part>
			cas_propogate_color_to_other_parts \{part = cas_guitar_bridges
				other_parts = [
					cas_guitar_head
				]}
		endif
	endif
	if (<part> = cas_bass_bridges)
		if getcasappearancepart part = <part>
			cas_propogate_color_to_other_parts \{part = cas_bass_head
				other_parts = [
					cas_bass_bridges
				]}
		endif
	endif
	if (<part> = cas_bass_head)
		if getcasappearancepart part = <part>
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
	SetArrayElement ArrayName = other_parts index = 0 NewValue = <hat_hair_part> ResolveGlobals = 0
	cas_propogate_color_to_other_parts part = <hair_part> other_parts = <other_parts>
endscript

script cas_propogate_color_to_other_parts 
	GetArraySize <other_parts>
	i = 0
	begin
	part_slot = (<other_parts> [<i>])
	if getcasappearancepart part = <part_slot>
		str = (($cas_current_appearance).<part_slot>)
		appendstruct struct = cas_current_appearance Field = <part_slot> params = {<str> chosen_materials = {}} globalstruct

	endif
	i = (<i> + 1)
	repeat <array_Size>
	if getcasappearancepart part = <part>
		if GotParam \{chosen_materials}
			ForEachIn structure = <chosen_materials> pass_index do = cas_propogate_color_to_other_parts_foreach params = {
				part = <part>
				other_parts = <other_parts>
			}
		endif
	endif
	if NOT GotParam \{color_part}
		if GotParam \{part}
			color_part = <part>
		else

		endif
	endif
	if getcasappearancepart part = <color_part>
		should_use_h = 0
		should_use_s = 0
		should_use_v = 100
		should_use_default_diffuse = 0
		if GotParam \{use_default_diffuse}
			if (<use_default_diffuse> = 1)
				should_use_default_diffuse = 1
			endif
		endif
		if NOT GotParam \{h}
			should_use_default_diffuse = 1
		endif
		if GotParam \{reset}
			should_use_default_diffuse = 1
			desc_id = <reset>
		endif
		if (<should_use_default_diffuse> = 0)
			if GotParam \{h}
				should_use_h = <h>
				should_use_s = <s>
				should_use_v = <v>
			endif
		else
			getactualcasoptionstruct part = <color_part> desc_id = <desc_id>
			if GotParam \{default_diffuse}
				if NOT IsArray <default_diffuse>

				endif
				if NOT StructureContains structure = (<default_diffuse> [0]) h

				endif
				should_use_h = (<default_diffuse> [0].h)
				should_use_s = (<default_diffuse> [0].s)
				should_use_v = (<default_diffuse> [0].v)
				should_use_default_diffuse = 0
			endif
		endif
		GetArraySize <other_parts>
		i = 0
		begin
		given_other_part = (<other_parts> [<i>])
		if getcasappearancepart part = <given_other_part>
			setcasappearancecolor {
				part = <given_other_part>
				use_default_diffuse = <should_use_default_diffuse>
				h = <should_use_h>
				s = <should_use_s>
				v = <should_use_v>
			}
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
endscript

script cas_propogate_color_to_other_parts_foreach 
	GetArraySize <other_parts>
	i = 0
	begin
	given_other_part = (<other_parts> [<i>])
	if getcasappearancepart part = <given_other_part>
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
			0x5a95f6d5 = 0
			if NOT load_part_desc_pak part_type = <hat_part>
				0x5a95f6d5 = 1
			endif
			getactualcasoptionstruct part = <hat_part> desc_id = <hat_desc_id>
			if (<0x5a95f6d5> = 1)
				unload_part_desc_pak part_type = <hat_part>
			endif
			if GotParam \{hat_hair}
				return true hat_hair_param = <hat_hair>
			endif
		endif
	endif
	return \{FALSE}
endscript

script cas_need_to_use_hat_hair 
	if NOT (<hat_desc_id> = None)
		if (<hair_desc_id> = None)
			if GotParam \{hat_hair}
				return true hat_hair = <hat_hair>
			endif
		elseif getactualcasoptionstruct part = <hair_part> desc_id = <hair_desc_id>
			if GotParam \{hat_hair}
				return true hat_hair = <hat_hair>
			endif
		endif
	endif
endscript

script cas_disq_basic_exclusions 
	if getactualcasoptionstruct part = <part> desc_id = <desc_id>
		if GotParam \{exclusions}
			foreachincas do = cas_disq_basic_exclusions_per_part params = {exclusions = <exclusions>}
		endif
		foreachincas do = cas_disq_reverse_exclusions_per_part params = {other_part = <part> other_desc_id = <desc_id>}
	endif
endscript

script cas_disq_reverse_exclusions_per_part 
	if getcasappearancepart part = <part>
		if getactualcasoptionstruct part = <part> desc_id = <desc_id>
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
	if StructureContains structure = <exclusions> <part>
		exclusion = (<exclusions>.<part>)
		if getcasappearancepart part = <part>
			if NOT StructureContains structure = <exclusion> change_to

			endif
			if cas_disq_matches_change_from exclusion = <exclusion> desc_id = <desc_id>
				change_to = (<exclusion>.change_to)

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
			repeat <array_Size>
		elseif (<desc_id> = <change_from>)
			return \{true}
		endif
	endif
endscript
cas_disq_hide_parts_list = [
]

script cas_disq_hide_parts 
	GetArraySize \{$cas_disq_hide_parts_list}
	if (<array_Size> > 0)
		Change \{cas_disq_hide_parts_list = [
			]}
	endif
	foreachincas do = cas_disq_get_current_hide_parts params = {except = <part>}
	if getactualcasoptionstruct part = <part> desc_id = <desc_id>
		if GotParam \{hide_parts}
			new_hide_parts = <hide_parts>
			RemoveParameter \{hide_parts}
		endif
	endif
	if getcasappearancepart part = <part>
		if getactualcasoptionstruct part = <part> desc_id = <desc_id>
			if GotParam \{hide_parts}
				old_hide_parts = <hide_parts>
			endif
		endif
	endif
	if GotParam \{old_hide_parts}

		i = 0
		GetArraySize <old_hide_parts>
		if (<array_Size> > 0)
			begin
			if NOT ArrayContains array = ($cas_disq_hide_parts_list) contains = (<old_hide_parts> [<i>])
				editcasappearance {
					target = hidegeom
					targetparams = {part = (<old_hide_parts> [<i>]) hide_geom = 0}
				}
			endif
			i = (<i> + 1)
			repeat <array_Size>
		endif
	endif
	if GotParam \{new_hide_parts}

		i = 0
		GetArraySize <new_hide_parts>
		if (<array_Size> > 0)
			begin
			editcasappearance {
				target = hidegeom
				targetparams = {part = (<new_hide_parts> [<i>]) hide_geom = 1}
			}
			i = (<i> + 1)
			repeat <array_Size>
		endif
	endif
endscript

script cas_disq_get_current_hide_parts 
	if NOT checksumequals a = <part> b = <except>
		if getcasappearancepart part = <part>
			if getactualcasoptionstruct part = <part> desc_id = <desc_id> dont_assert
				if GotParam \{hide_parts}
					Change cas_disq_hide_parts_list = (($cas_disq_hide_parts_list) + <hide_parts>)
				endif
			endif
		endif
	endif
endscript
