
script check_if_part_deformable 
	ScriptAssert \{'check_if_part_deformable: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script is_part_capable 
	RequireParams \{[
			part
		]
		all}
	if getcasappearancepart part = <part>
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
	ScriptAssert \{'check_if_has_belt: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
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
					if GotParam \{color_all_materials}
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
	ScriptAssert \{'check_if_secondary_colorable: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
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
	if getcasappearancepart part = <part>
		if GotParam \{desc_id}
			return true current_desc_id = <desc_id>
		endif
	endif
	return \{FALSE
		current_desc_id = None}
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

script check_need_to_block_back 
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
	ps2_getactualcasoptionstruct_as_struct part = <part> desc_id = <desc_id>
	if StructureContains structure = (<ps2_part_struct>) finishable
		editcasappearance target = setpart targetparams = {part = (<ps2_part_struct>.finishable) desc_id = None}
	endif
	if StructureContains structure = (<ps2_part_struct>) detailable
		editcasappearance target = setpart targetparams = {part = (<ps2_part_struct>.detailable) desc_id = None}
	endif
	if StructureContains structure = (<ps2_part_struct>) logoable
		editcasappearance target = setpart targetparams = {part = (<ps2_part_struct>.logoable) desc_id = None}
	endif
	if StructureContains structure = (<ps2_part_struct>) fadeable
		editcasappearance target = setpart targetparams = {part = (<ps2_part_struct>.fadeable) desc_id = None}
	endif
	if NOT GotParam \{no_rebuild}
		if GotParam \{incremental}
			rebuildcurrentcasmodel \{buildscriptparams = {
					build_incremental
				}}
		else
			rebuildcurrentcasmodel
		endif
	else
		if check_need_to_block_back part = <part>
			Change \{disable_cas_back = 0}
		endif
	endif
	if IsTrue \{$cas_debug}
		Dumpheaps
	endif
endscript

script cas_find_tex_swap_parts \{tex_swap_parts = [
		]}
	ScriptAssert \{'cas_find_tex_swap_parts: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script cas_has_tex_replace 
endscript

script cas_desc_id_is_excluded \{part_name = None
		part_desc_id = None}
	ScriptAssert \{'cas_desc_id_is_excluded: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
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
	if ((<part> = cas_guitar_strings) || (<part> = cas_bass_strings))
		return \{true}
	endif
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
ps2_part_pak_unloading = 0

script incrementpartpakunloading 
	printf \{qs(0x5e14792a)
		d = $ps2_part_pak_unloading}
	Change ps2_part_pak_unloading = ($ps2_part_pak_unloading + 1)
endscript

script decrementpartpakunloading 
	printf \{qs(0x1502922e)
		d = $ps2_part_pak_unloading}
	Change ps2_part_pak_unloading = ($ps2_part_pak_unloading - 1)
endscript

script unloadappearancepaks \{asset_context = 0
		async = 0}
	RequireParams \{[
			appearance
			asset_context
		]
		all}
	if GotParam \{appearance}
		setcasappearance appearance = <appearance>
	endif
	if (<async> = 1)
		Change \{ps2_part_pak_unloading = 0}
		foreachincas do = unloadpartpak params = {asset_context = <asset_context> <...>}
		begin
		if ispartpakunloaddone
			break
		endif
		Wait \{1
			gameframe}
		repeat
	else
		foreachincas do = unloadpartpak params = {asset_context = <asset_context> <...>}
	endif
endscript
ps2_part_pak_loading = 0

script incrementpartpakloading 
	Change ps2_part_pak_loading = ($ps2_part_pak_loading + 1)
endscript

script decrementpartpakloading 
	Change ps2_part_pak_loading = ($ps2_part_pak_loading - 1)
endscript
ps2_loading_appearance_paks = 0

script loadappearancepaks \{reload = 0
		async = 0}
	stars
	printf qs(0xa0c9fdd5) c = <asset_context> r = <reload>
	Change \{ps2_loading_appearance_paks = 1}
	RequireParams \{[
			appearance
			Heap
			asset_context
		]
		all}
	create_new_type_heaps appearance = <appearance> Heap = <Heap> Type = Body
	if GotParam \{instrument}
		printf qs(0xf140ef17) d = <instrument>
		create_new_type_heaps appearance = <appearance> Heap = <Heap> Type = instrument instrument_type = <instrument>
	endif
	if (<reload> = 1)
		unloadappearancepaks {asset_context = <asset_context>}
	endif
	if GotParam \{appearance}
		setcasappearance appearance = <appearance>
	endif
	if (<async> = 1)
		Change \{ps2_part_pak_loading = 0}
		GetArraySize ($master_editable_list)
		i = 0
		begin
		part_struct = ($master_editable_list [(<i>)])
		part_slot = (<part_struct>.part)
		printf \{qs(0x8cf97b8b)}
		loadpartpak {part = <part_slot> asset_context = <asset_context> <...>}
		begin
		if ispartpakloaddone
			break
		endif
		Wait \{5
			gameframes}
		repeat
		i = (<i> + 1)
		repeat <array_Size>
	else
		printf \{qs(0xe049f787)}
		foreachincas do = loadpartpak params = {asset_context = <asset_context> <...>}
	endif
	Change \{ps2_loading_appearance_paks = 0}
endscript

script loadpartpak \{instrument = None
		asset_context = 0
		async = 0
		instrument = None}
	setcasappearance appearance = <appearance>
	original_part = <part>
	if getcasappearancepart part = <part>
		if getactualcasoptionstruct part = <part> desc_id = <desc_id>
			printf qs(0x12cc645c) d = <part> s = <Heap> a = <instrument>
			isinstrumentpart = 0
			if NOT (<instrument> = None)
				printf \{qs(0x85c3faa8)}
				if StructureContains structure = $instrument_part_sets <instrument>
					printf qs(0x20693de0) d = <instrument>
					GetArraySize (($instrument_part_sets).<instrument>)
					i = 0
					if (<array_Size> > 0)
						begin
						if (<part> = ($instrument_part_sets.<instrument> [<i>]))
							printf \{qs(0xb3e3edf8)}
							isinstrumentpart = 1
						endif
						i = (<i> + 1)
						repeat <array_Size>
					endif
				endif
			endif
			if (<isinstrumentpart> = 0)
				get_current_part_heap_map Heap = <Heap> Type = Body
				if NOT StructureContains structure = $car_generic_part_map <part>
					printf qs(0x7102430e) d = <part>
					return
				endif
				part = (($car_generic_part_map).<part>)
				if NOT StructureContains structure = $<current_part_heap_map> <part>
					printf qs(0x531afb92) d = <part>
					return
				endif
				Heap = ((($<current_part_heap_map>).<part>).<Heap>)
			else
				get_current_part_heap_map Heap = <Heap> Type = instrument
				if NOT StructureContains structure = $<current_part_heap_map> <part>
					printf qs(0x26102d70) d = <part>
					return
				endif
				Heap = ((($<current_part_heap_map>).<part>).<Heap>)
			endif
			printf qs(0x9d4415c7) d = <part> s = <Heap>
			if GotParam \{pak}
				if filterpartbyinstrument part = <original_part> instrument = <instrument>
					printf qs(0xf7a7a2bd) d = <part>
					return
				endif
				if (<original_part> = cas_male_hair || <original_part> = cas_female_hair)
					gethathairchoice appearance = <appearance>
					if (<hat_hair_choice> = hat_hair)
						printf qs(0xf7a7a2bd) d = <original_part>
						return
					endif
				endif
				if (<original_part> = cas_male_acc_left || <original_part> = cas_female_acc_left)
					getaccchoice appearance = <appearance>
					if (<acc_left_choice> = small_acc)
						printf qs(0xf7a7a2bd) d = <original_part>
						return
					endif
				endif
				if (<original_part> = cas_male_acc_right || <original_part> = cas_female_acc_right)
					getaccchoice appearance = <appearance>
					if (<acc_right_choice> = small_acc)
						printf qs(0xf7a7a2bd) d = <original_part>
						return
					endif
				endif
				if (<original_part> = cas_male_shoes || <original_part> = cas_female_shoes)
					getshoeschoice appearance = <appearance>
					if (<shoes_choice> = shoes_cutoff)
						printf qs(0xf7a7a2bd) d = <original_part>
						return
					endif
				endif
				if GotParam \{pak_folder}
					formatText '%a%b' a = <pak_folder> b = <pak> TextName = pak
				endif
				pushassetcontextcar context = <asset_context>
				MemPushContext <Heap>
				if (<async> = 1)
					incrementpartpakloading
					LoadPak <pak> Heap = <Heap> load_callback = loadpartpak_done callback_data = None
				else
					LoadPak <pak> Heap = <Heap>
				endif
				MemPopContext
				popassetcontextcar
				return \{true}
			elseif GotParam \{add_to_nodes}
				if filterpartbyinstrument part = <original_part> instrument = <instrument>
					printf qs(0xf7a7a2bd) d = <part>
					return
				endif
				if (<original_part> = cas_male_hair || <original_part> = cas_female_hair)
					gethathairchoice appearance = <appearance>
					if (<hat_hair_choice> = hat_hair)
						printf qs(0xf7a7a2bd) d = <original_part>
						return
					endif
				endif
				if (<original_part> = cas_male_acc_left || <original_part> = cas_female_acc_left)
					getaccchoice appearance = <appearance>
					if (<acc_left_choice> = small_acc)
						printf qs(0xf7a7a2bd) d = <original_part>
						return
					endif
				endif
				if (<original_part> = cas_male_acc_right || <original_part> = cas_female_acc_right)
					getaccchoice appearance = <appearance>
					if (<acc_right_choice> = small_acc)
						printf qs(0xf7a7a2bd) d = <original_part>
						return
					endif
				endif
				if (<original_part> = cas_male_shoes || <original_part> = cas_female_shoes)
					getshoeschoice appearance = <appearance>
					if (<shoes_choice> = shoes_cutoff)
						printf qs(0xf7a7a2bd) d = <original_part>
						return
					endif
				endif
				GetArraySize (add_to_nodes)
				i = 0
				begin
				node_child_struct = (<add_to_nodes> [<i>])
				if getactualcasoptionstruct part = (<node_child_struct>.part_type) desc_id = (<node_child_struct>.desc_id)
					if GotParam \{pak_folder}
						formatText '%a%b' a = <pak_folder> b = <pak> TextName = pak
					endif
					pushassetcontextcar context = <asset_context>
					MemPushContext <Heap>
					if (<async> = 1)
						incrementpartpakloading
						LoadPak <pak> Heap = <Heap> load_callback = loadpartpak_done callback_data = None
					else
						LoadPak <pak> Heap = <Heap>
					endif
				endif
				MemPopContext
				popassetcontextcar
				i = (<i> + 1)
				repeat <array_Size>
				return \{true}
			endif
		endif
	endif
	return \{FALSE}
endscript

script loadpartpak_done 
	if ($ps2_part_pak_loading > 0)
		decrementpartpakloading
	endif
endscript

script ispartpakloaddone 
	if ($ps2_part_pak_loading > 0)
		return \{FALSE}
	endif
	return \{true}
endscript

script unloadpartpak \{asset_context = 0
		async = 0}
	setcasappearance appearance = <appearance>
	if getcasappearancepart part = <part>
		if getactualcasoptionstruct part = <part> desc_id = <desc_id>
			if GotParam \{pak}
				if GotParam \{pak_folder}
					formatText '%a%b' a = <pak_folder> b = <pak> TextName = pak
				endif
				printf qs(0xfecc6864) a = <part>
				printf qs(0x18cf9c48) a = <pak>
				printf qs(0x8e557537) a = <async>
				printf qs(0x873b4fbf) d = <part> s = <asset_context>
				if (<async> = 1)
					incrementpartpakunloading
					SpawnScriptLater unloadappearancepak_async params = {asset_context = <asset_context> pak = <pak>}
				else
					pushassetcontextcar context = <asset_context>
					UnLoadPak <pak> sameheaps
					if NOT GotParam \{no_wait}
						WaitUnloadPak <pak> Block
					endif
					popassetcontextcar
				endif
				return \{true}
			elseif GotParam \{add_to_nodes}
				GetArraySize (add_to_nodes)
				i = 0
				begin
				node_child_struct = (<add_to_nodes> [<i>])
				if getactualcasoptionstruct part = (<node_child_struct>.part_type) desc_id = (<node_child_struct>.desc_id)
					if GotParam \{pak_folder}
						formatText '%a%b' a = <pak_folder> b = <pak> TextName = pak
					endif
					if (<async> = 1)
						incrementpartpakunloading
						SpawnScriptLater unloadappearancepak_async params = {asset_context = <asset_context> pak = <pak>}
					else
						PushAssetContext context = <asset_context>
						UnLoadPak <pak> sameheaps
						if NOT GotParam \{no_wait}
							WaitUnloadPak <pak> Block
						endif
						PopAssetContext
					endif
				endif
				i = (<i> + 1)
				repeat <array_Size>
			endif
		endif
	endif
	return \{FALSE}
endscript

script unloadappearancepak_async 
	pushassetcontextcar context = <context>
	UnLoadPak <pak> sameheaps
	begin
	if WaitUnloadPak <pak> noblock
		break
	endif
	Wait \{1
		gameframe}
	repeat
	decrementpartpakunloading
	popassetcontextcar
endscript

script ispartpakunloaddone 
	if ($ps2_part_pak_unloading = 0)
		return \{true}
	endif
	return \{FALSE}
endscript
ps2_changing_appearance_paks = 0

script changeappearancepaks \{current_instrument = None
		new_instrument = None}
	Change \{ps2_changing_appearance_paks = 1}
	diffappearances <...>
	if (<diff_array_size> = 0)
		Change \{ps2_changing_appearance_paks = 0}
		return
	endif
	setcasappearance appearance = <current_appearance>
	i = 0
	begin
	part = (<diff_array> [<i>])
	if StructureContains structure = current_appearance <part>
		unloadpartpak part = <part> no_wait asset_context = <asset_context> appearance = <current_appearance>
	endif
	i = (<i> + 1)
	repeat <diff_array_size>
	setcasappearance appearance = <new_appearance>
	i = 0
	begin
	if ($ps2_cas_load_canceled = 1)
		Change \{ps2_changing_appearance_paks = 0}
		return
	endif
	part = (<diff_array> [<i>])
	if StructureContains structure = new_appearance <part>
		loadpartpak part = <part> Heap = <Heap> instrument = <new_instrument> asset_context = <asset_context> appearance = <new_appearance>
	endif
	i = (<i> + 1)
	repeat <diff_array_size>
	Change \{ps2_changing_appearance_paks = 0}
endscript

script ifpartinarray 
	GetArraySize (<array>)
	upper_array_size = <array_Size>
	i = 0
	begin
	subarray = (<array> [<i>])
	GetArraySize (<subarray>)
	j = 0
	begin
	if ((<subarray> [<j>].desc_id) = <part>)
		return \{true}
	endif
	j = (<j> + 1)
	repeat <array_Size>
	i = (<i> + 1)
	repeat <upper_array_size>
	return \{FALSE}
endscript

script ps2_instrument_filter 
	ScriptAssert \{'PS2_Instrument_Filter: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript
ps2_car_part_scripts_loaded = 0

script ps2_load_car_part_script \{Heap = heap_car_parts_pak}
	pushassetcontextcar context = <Heap>
	LoadPak 'pak\\car_parts\\car_parts.pak' Heap = <Heap>
	popassetcontextcar
	Change \{ps2_car_part_scripts_loaded = 1}
endscript

script ps2_unload_car_part_script \{Heap = heap_car_parts_pak}
	pushassetcontextcar context = <Heap>
	UnLoadPak \{'pak\\car_parts\\car_parts.pak'}
	popassetcontextcar
	Change \{ps2_car_part_scripts_loaded = 0}
endscript
ps2_cas_load_canceled = 0

script cascancelloading 
	if cas_queue_is_busy
		Change \{ps2_cas_load_canceled = 1}
	endif
endscript

script ps2_getactualcasoptionstruct_as_struct 
	if getactualcasoptionstruct part = <part> desc_id = <desc_id>
		RemoveParameter \{part}
		return true ps2_part_struct = {<...>}
	endif
	return \{FALSE}
endscript

script caswaitforloading 
	begin
	if ($ps2_changing_appearance_paks = 0 && $ps2_loading_appearance_paks = 0)
		break
	endif
	Wait \{1
		Seconds}
	repeat
endscript
