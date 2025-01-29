
script cas_handle_disqualifications 
	if StructureContains \{structure = $cas_current_appearance
			cas_body}
		cas_disq_resolve_hat_hair part = <part> desc_id = <desc_id>
		cas_disq_resolve_acc part = <part> desc_id = <desc_id>
		cas_disq_resolve_shoes part = <part> desc_id = <desc_id>
	endif
	return new_desc_id = <new_desc_id>
endscript

script get_hair_body_specific_part_names 
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
	ScriptAssert \{'get_hair_body_specific_part_names failed!'}
endscript

script get_acc_body_specific_part_names 
	if StructureContains \{structure = $cas_current_appearance
			cas_body}
		body_desc_id = (($cas_current_appearance.cas_body).desc_id)
		if getactualcasoptionstruct part = cas_body desc_id = <body_desc_id> no_resolve
			if GotParam \{body_specific_parts}
				acc_left_part = (<body_specific_parts>.cas_acc_left)
				acc_left_small_part = (<body_specific_parts>.cas_acc_left_small)
				acc_right_part = (<body_specific_parts>.cas_acc_right)
				acc_right_small_part = (<body_specific_parts>.cas_acc_right_small)
				acc_torso_part = (<body_specific_parts>.cas_torso)
				return acc_left_part = <acc_left_part> acc_left_small_part = <acc_left_small_part> acc_right_part = <acc_right_part> acc_right_small_part = <acc_right_small_part> acc_torso_part = <acc_torso_part>
			endif
		endif
	endif
	ScriptAssert \{'get_acc_body_specific_part_names failed!'}
endscript

script get_shoes_body_specific_part_names 
	if StructureContains \{structure = $cas_current_appearance
			cas_body}
		body_desc_id = (($cas_current_appearance.cas_body).desc_id)
		if getactualcasoptionstruct part = cas_body desc_id = <body_desc_id> no_resolve
			if GotParam \{body_specific_parts}
				shoes_part = (<body_specific_parts>.cas_shoes)
				pant_part = (<body_specific_parts>.cas_legs)
				shoes_cutoff_part = (<body_specific_parts>.cas_shoes_cutoff)
				return shoes_part = <shoes_part> pant_part = <pant_part> shoes_cutoff_part = <shoes_cutoff_part>
			endif
		endif
	endif
	ScriptAssert \{'get_shoes_body_specific_part_names failed!'}
endscript

script cas_disq_resolve_shoes 
	stars
	printf \{qs(0x0a658a56)}
	get_shoes_body_specific_part_names
	<need_disq> = 0
	<use_shoes_cutoff> = 0
	orig_desc_id = <desc_id>
	if checksumequals a = <part> b = <shoes_part>
		printf \{qs(0x8c45969c)}
		<need_disq> = 1
		shoes_desc_id = <orig_desc_id>
		cas_propogate_shoe_color reset = <new_desc_id>
	else
		printf \{qs(0xb7276504)}
		if getcasappearancepartdescid part = <shoes_part>
			shoes_desc_id = <desc_id>
		else
			shoes_desc_id = None
		endif
	endif
	printf <shoes_desc_id>
	if checksumequals a = <part> b = <pant_part>
		printf \{qs(0x5bc4d5eb)}
		<need_disq> = 1
		pant_desc_id = <orig_desc_id>
	else
		printf \{qs(0x60a62673)}
		if getcasappearancepartdescid part = <pant_part>
			pant_desc_id = <desc_id>
		else
			pant_desc_id = None
		endif
	endif
	printf <pant_desc_id>
	printf qs(0x7e3200da) d = <need_disq>
	if (<need_disq> = 1)
		getactualcasoptionstruct part = <pant_part> desc_id = <pant_desc_id>
		if GotParam \{long_pants}
			printf \{qs(0xe9092b30)}
			getactualcasoptionstruct part = <shoes_part> desc_id = <shoes_desc_id>
			if GotParam \{shoes_cutoff}
				printf \{qs(0x14558c41)}
				<use_shoes_cutoff> = 1
				shoes_cutoff_desc_id = shoes_cutoff
				shoes_cutoff_desc_id = <shoes_cutoff>
				printf <shoes_cutoff_desc_id>
			endif
		endif
		if (<use_shoes_cutoff> = 1)
			printf \{qs(0x346f4b72)}
			editcasappearance {
				target = setpart
				targetparams = {part = <shoes_cutoff_part> desc_id = <shoes_cutoff_desc_id>}
			}
			cas_propogate_shoe_color
		else
			printf \{qs(0xfb306b9d)}
			editcasappearance {
				target = setpart
				targetparams = {part = <shoes_part> desc_id = <shoes_desc_id>}
			}
			cas_reverse_propogate_shoe_color
			editcasappearance {
				target = clearpart
				targetparams = {part = <shoes_cutoff_part>}
			}
		endif
	endif
endscript

script cas_disq_resolve_acc 
	get_acc_body_specific_part_names
	<need_disq> = 0
	<use_small_acc> = 0
	orig_desc_id = <desc_id>
	if checksumequals a = <part> b = <acc_left_part>
		<need_disq> = 1
	endif
	if checksumequals a = <part> b = <acc_right_part>
		<need_disq> = 1
	endif
	if checksumequals a = <part> b = <acc_torso_part>
		<need_disq> = 1
		torso_desc_id = <orig_desc_id>
	else
		if getcasappearancepartdescid part = <acc_torso_part>
			torso_desc_id = <desc_id>
		else
			torso_desc_id = None
		endif
	endif
	if (<need_disq> = 1)
		getactualcasoptionstruct part = <acc_torso_part> desc_id = <torso_desc_id>
		if GotParam \{small_acc}
			<use_small_acc> = 1
		endif
		if (<use_small_acc> = 1)
			editcasappearance {
				target = setpart
				targetparams = {part = <acc_left_small_part> desc_id = None}
			}
			editcasappearance {
				target = setpart
				targetparams = {part = <acc_right_small_part> desc_id = None}
			}
		else
			editcasappearance {
				target = clearpart
				targetparams = {part = <acc_left_small_part>}
			}
			editcasappearance {
				target = clearpart
				targetparams = {part = <acc_right_small_part>}
			}
		endif
	endif
endscript

script cas_disq_resolve_hat_hair 
	get_hair_body_specific_part_names
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

script cas_propogate_guitar_color_from 
	ScriptAssert \{'cas_propogate_guitar_color_from: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script cas_propogate_hair_color 
	get_hair_body_specific_part_names
	other_parts = [something]
	SetArrayElement ArrayName = other_parts index = 0 NewValue = <hat_hair_part> ResolveGlobals = 0
	cas_propogate_color_to_other_parts part = <hair_part> other_parts = <other_parts>
endscript

script cas_propogate_shoe_color 
	get_shoes_body_specific_part_names
	other_parts = [something]
	SetArrayElement ArrayName = other_parts index = 0 NewValue = <shoes_cutoff_part> ResolveGlobals = 0
	cas_propogate_color_to_other_parts part = <shoes_part> other_parts = <other_parts>
endscript

script cas_reverse_propogate_shoe_color 
	get_shoes_body_specific_part_names
	other_parts = [something]
	SetArrayElement ArrayName = other_parts index = 0 NewValue = <shoes_part> ResolveGlobals = 0
	cas_propogate_color_to_other_parts part = <shoes_cutoff_part> other_parts = <other_parts>
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
	if NOT GotParam \{color_part}
		if GotParam \{part}
			color_part = <part>
		else
			ScriptAssert \{qs(0xe89f03f1)}
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
					ScriptAssert \{'Head default_diffuse must be an array'}
				endif
				if NOT StructureContains structure = (<default_diffuse> [0]) h
					ScriptAssert \{'Head default_diffuse has to have HSV entries'}
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

script cas_disq_basic_exclusions 
	ScriptAssert \{'cas_disq_basic_exclusions: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script cas_disq_reverse_exclusions_per_part 
	if getcasappearancepartdescid part = <part>
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
	if StructureContains structure = <exclusions> <part>
		exclusion = (<exclusions>.<part>)
		if getcasappearancepartdescid part = <part>
			if NOT StructureContains structure = <exclusion> change_to
				ScriptAssert \{'Exclusions require a \'change_to\' to be set'}
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
	if getcasappearancepartdescid part = <part>
		if getactualcasoptionstruct part = <part> desc_id = <desc_id>
			if GotParam \{hide_parts}
				old_hide_parts = <hide_parts>
			endif
		endif
	endif
	if GotParam \{old_hide_parts}
		printf \{'Unhiding old stuff...'}
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
		printf \{'Hiding new stuff...'}
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
		if getcasappearancepartdescid part = <part>
			if getactualcasoptionstruct part = <part> desc_id = <desc_id> dont_assert
				if GotParam \{hide_parts}
					Change cas_disq_hide_parts_list = (($cas_disq_hide_parts_list) + <hide_parts>)
				endif
			endif
		endif
	endif
endscript
