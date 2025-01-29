
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

			elseif NOT StructureContains structure = <adjustcrc> pass

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
			if GotParam \{color_all_materials}
				<retval> = 1
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

	endif
	if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>

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

endscript

script check_need_to_block_back 
	switch <part>
		case cas_male_intro_anim
		case cas_male_win_anim
		case cas_male_lose_anim
		case cas_female_intro_anim
		case cas_female_win_anim
		case cas_female_lose_anim
		case cas_guitar_highway
		case cas_bass_highway
		case cas_drums_highway
		return \{true}
	endswitch
	return \{FALSE}
endscript

script cas_add_item_to_appearance 

	cas_handle_disqualifications part = <part> desc_id = <desc_id>
	if GotParam \{new_desc_id}
		desc_id = <new_desc_id>

	endif
	editcasappearance target = setpart targetparams = {part = <part> desc_id = <desc_id>}
	if NOT GotParam \{no_rebuild}
		if GotParam \{incremental}
			SpawnScriptNow \{trigger_cas_rebuild_loop}
		else
			SpawnScriptNow \{trigger_cas_rebuild_loop}
		endif
	endif
	if IsTrue \{$cas_debug}
		Dumpheaps
	endif
endscript

script cas_find_tex_swap_parts \{tex_swap_parts = [
		]}

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
		GetArraySize <inclusion>
		inclusion_size = (<array_Size>)
		0x95083ac8 = <inclusion>
		if (<inclusion_size> > 0)
			i = 0
			begin
			if getcasappearancepart part = (<0x95083ac8> [<i>].part)
				valid = (<0x95083ac8> [<i>].valid)
				if NOT ((checksumequals a = <desc_id> b = None) || (ArrayContains array = <valid> contains = <desc_id>))
					GetArraySize <valid>
					j = 0
					begin
					if is_part_unlocked_purchased part = (<0x95083ac8> [<i>].part) desc_id = ((<0x95083ac8> [<i>].valid) [<j>]) savegame = ($cas_current_savegame)
						AddArrayElement array = <change_parts> element = {part = (<0x95083ac8> [<i>].part) desc_id = ((<0x95083ac8> [<i>].valid) [<j>])}
						change_parts = <array>
						conflict = true
						break
					else
						if ((<j> + 1) = <array_Size>)

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

	if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>

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

	if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>

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

	if is_part_unlocked part = <part> desc_id = <desc_id> savegame = <savegame>
		if is_part_purchased part = <part> desc_id = <desc_id> savegame = <savegame>
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script is_part_purchased_preset 

	if StructureContains structure = <preset> price
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
ps2_part_pak_unloading = 0

script incrementpartpakunloading 

	Change ps2_part_pak_unloading = ($ps2_part_pak_unloading + 1)
endscript

script decrementpartpakunloading 

	Change ps2_part_pak_unloading = ($ps2_part_pak_unloading - 1)
endscript

script unloadappearancepaks \{asset_context = 0
		async = 0}

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
		if get_key_from_appearance \{key = shadow_pak
				appearance = $cas_current_appearance}
			incrementpartpakunloading
			SpawnScriptLater unloadappearancepak_async params = {asset_context = <asset_context> pak = <pak>}
			begin
			if ispartpakunloaddone
				break
			endif
			Wait \{1
				gameframe}
			repeat
		endif
	else
		foreachincas do = unloadpartpak params = {asset_context = <asset_context> <...>}
		if get_key_from_appearance \{key = shadow_pak
				appearance = $cas_current_appearance}
			PushAssetContext context = <asset_context>
			UnLoadPak (<shadow_pak>)
			if NOT GotParam \{no_wait}
				WaitUnloadPak <pak> Block
			endif
			PopAssetContext
		endif
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

	Change \{ps2_loading_appearance_paks = 1}

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
		loadpartpak {part = <part_slot> asset_context = <asset_context> <...>}
		begin
		if ispartpakloaddone
			break
		endif
		Wait \{1
			gameframes}
		repeat
		i = (<i> + 1)
		repeat <array_Size>
		if get_key_from_appearance \{key = shadow_pak
				appearance = $cas_current_appearance}
			PushAssetContext context = <asset_context>
			incrementpartpakloading
			LoadPak <shadow_pak> Heap = <Heap> load_callback = loadpartpak_done callback_data = None
			PopAssetContext
			begin
			if ispartpakloaddone
				break
			endif
			Wait \{1
				gameframes}
			repeat
		endif
	else
		foreachincas do = loadpartpak params = {asset_context = <asset_context> <...>}
		if get_key_from_appearance \{key = shadow_pak
				appearance = $cas_current_appearance}
			PushAssetContext context = <asset_context>
			LoadPak <shadow_pak> Heap = <Heap>
			PopAssetContext
		endif
	endif
	Change \{ps2_loading_appearance_paks = 0}
endscript

script loadpartpak \{instrument = None
		asset_context = 0
		async = 0
		instrument = None}
	setcasappearance appearance = <appearance>
	if getcasappearancepart part = <part>
		if getactualcasoptionstruct part = <part> desc_id = <desc_id>
			if GotParam \{pak}
				if filterpartbyinstrument part = <part> instrument = <instrument>
					return
				endif
				if (<part> = cas_male_hair || <part> = cas_female_hair)
					get_hat_hair_choice appearance = <appearance>
					if (<hat_hair_choice> = hat_hair)
						return
					endif
				endif
				PushAssetContext context = <asset_context>
				if (<async> = 1)
					incrementpartpakloading
					LoadPak <pak> Heap = <Heap> load_callback = loadpartpak_done callback_data = None
				else
					LoadPak <pak> Heap = <Heap>
				endif
				PopAssetContext
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
				if (<async> = 1)
					incrementpartpakunloading
					SpawnScriptLater unloadappearancepak_async params = {asset_context = <asset_context> pak = <pak>}
				else
					PushAssetContext context = <asset_context>
					UnLoadPak <pak>
					if NOT GotParam \{no_wait}
						WaitUnloadPak <pak> Block
					endif
					PopAssetContext
				endif
				return \{true}
			endif
		endif
	endif
	return \{FALSE}
endscript

script unloadappearancepak_async 
	PushAssetContext context = <context>
	UnLoadPak <pak>
	begin
	if WaitUnloadPak <pak> noblock
		break
	endif
	Wait \{1
		gameframe}
	repeat
	decrementpartpakunloading
	PopAssetContext
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
		if (<part> = cas_male_base_torso || <part> = cas_female_base_torso || <part> = cas_full_body || <part> = cas_male_base_face || <part> = cas_female_base_face)
			if get_key_from_appearance \{key = shadow_pak
					appearance = $cas_current_appearance}
				PushAssetContext context = <asset_context>
				UnLoadPak (<shadow_pak>)
				PopAssetContext
			endif
		endif
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
		if (<part> = cas_male_base_torso || <part> = cas_female_base_torso || <part> = cas_full_body || <part> = cas_male_base_face || <part> = cas_female_base_face)
			if get_key_from_appearance \{key = shadow_pak
					appearance = $cas_current_appearance}
				PushAssetContext context = <asset_context>
				LoadPak <shadow_pak> Heap = <Heap>
				PopAssetContext
			endif
		endif
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
	if ifpartinarray part = <part> array = (($instrument_part_sets).guitar)
		if NOT (<instrument> = guitar)
			return \{true}
		endif
	endif
	if ifpartinarray part = <part> array = (($instrument_part_sets).bass)
		if NOT (<instrument> = bass)
			return \{true}
		endif
	endif
	if ifpartinarray part = <part> array = (($instrument_part_sets).drum)
		if NOT (<instrument> = drum)
			return \{true}
		endif
	endif
	if ifpartinarray part = <part> array = (($instrument_part_sets).vocals)
		if NOT (<instrument> = vocals)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript
ps2_car_part_scripts_loaded = 0
0x56978d8a = 0

script ps2_load_car_part_script \{Heap = heap_song}
	if ($ps2_car_part_scripts_loaded = 0)
		if ispakloaded 'pak\\car_parts\\car_parts.pak' Heap = <Heap>

		else
			PushAssetContext context = <Heap>
			LoadPak 'pak\\car_parts\\car_parts.pak' Heap = <Heap>
			PopAssetContext
		endif
	else

	endif
	Change \{ps2_car_part_scripts_loaded = 1}
	Change 0x56978d8a = ($0x56978d8a + 1)
endscript

script 0xce69e479 \{Heap = heap_song}
	Change \{0x56978d8a = 0}
	PushAssetContext context = <Heap>
	UnLoadPak \{'pak\\car_parts\\car_parts.pak'}
	PopAssetContext
	Change \{ps2_car_part_scripts_loaded = 0}
endscript

script ps2_unload_car_part_script \{Heap = heap_song}
	Change 0x56978d8a = ($0x56978d8a - 1)
	if ($0x56978d8a = 0)
		PushAssetContext context = <Heap>
		UnLoadPak \{'pak\\car_parts\\car_parts.pak'}
		PopAssetContext
	else

	endif
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
