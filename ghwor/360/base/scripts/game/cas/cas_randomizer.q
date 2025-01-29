cas_randomized_parts = [
]
cas_randomized_parts_mixed_genre = [
]
cas_randomized_presets = [
	{
		preset_type = car_presets_body
	}
	{
		preset_type = car_presets_face
	}
	{
		preset_type = car_presets_makeup
	}
	{
		preset_type = car_presets_tattoo
	}
	{
		preset_type = car_presets_outfit
		globaltag_unlocks = unlocked_cas_outfit_presets
	}
]
cas_randomized_instruments = {
	guitar = {
		array = cas_random_guitars
	}
	bass = {
		array = cas_random_basses
	}
	drum = {
		array = cas_random_drums
	}
	vocals = {
		male_array = cas_random_male_vocals
		female_array = cas_random_female_vocals
	}
}
cas_band_used_parts = {
}
cpu_random_character = 0

script cas_set_random_appearance \{genre = !q1768515945
		is_female = !i1768515945
		savegame = !i1768515945}
	RequireParams \{[
			genre
			is_female
			savegame
		]
		all}
	printscriptinfo \{'cas_set_random_appearance'}
	Change cas_dupe_appearance = ($cas_current_appearance)
	if GotParam \{used_parts}
		Change cas_band_used_parts = <used_parts>
	else
		Change \{cas_band_used_parts = {
			}}
	endif
	if GotParam \{cpu_band}
		Change \{cpu_random_character = 1}
	else
		Change \{cpu_random_character = 0}
	endif
	if (<is_female> = 1)
		Change cas_current_appearance = ($default_custom_musician_profile_female.appearance)
	else
		Change cas_current_appearance = ($default_custom_musician_profile_male.appearance)
	endif
	cas_grab_random_unlocks
	randomize
	stars
	printf 'Generating random appearance - Seed=%s genre=%g' s = <rand_seed> g = <genre>
	stars
	random_preset_list = ($cas_randomized_presets)
	if (<is_female> = 1)
		<gender_checksum> = female
	else
		<gender_checksum> = male
	endif
	cas_random_pick_random_car_setup gender = <gender_checksum> genre = <genre> savegame = <savegame>
	cas_random_set_hair_from_car_setup chosen_setup = <chosen_setup>
	cas_propogate_hair_color
	ForEachIn <random_preset_list> do = cas_set_random_presets params = {gender = <gender_checksum> savegame = <savegame> chosen_setup = <chosen_setup>}
	if GotParam \{random_instruments}
		cas_generate_all_random_instruments is_female = <is_female> genre = <genre>
	endif
	Change cas_current_appearance = {($cas_current_appearance) genre = <genre>}
	Change \{cas_current_unlock_list = [
		]}
	Change \{cpu_random_character = 0}
	Change \{cas_dupe_appearance = {
		}}
endscript

script cas_random_pick_random_car_setup \{gender = !q1768515945
		genre = !q1768515945
		savegame = !i1768515945}
	if (<savegame> >= 0)
		GetGlobalTags unlocked_cas_outfit_presets savegame = <savegame>
	endif
	<array> = ($car_random_car_setups.<gender>)
	iloop = 0
	begin
	if pickfromweightedarray weighted_array = <array>
		printf 'Picked index %i' i = <random_index>
		<chosen_setup> = (<array> [<random_index>])
		<chosen_outfit> = (<chosen_setup>.car_presets_outfit)
		cas_get_preset_index preset_type = car_presets_outfit gender = <gender> desc_id = <chosen_outfit>
		<preset_struct> = (($car_presets_outfit.<gender>) [<preset_index>])
		<locked> = 0
		if StructureContains structure = <preset_struct> locked
			<locked> = 1
			if GotParam \{unlocked_cas_outfit_presets}
				if ArrayContains array = <unlocked_cas_outfit_presets> contains = <chosen_outfit>
					<locked> = 0
				endif
			endif
		endif
		if (<locked> = 1)
			RemoveArrayElement array = <array> index = <random_index>
			printf \{'locked outfit, picking again...'}
		else
			<possible_setup> = <chosen_setup>
			if check_dupe_appearance avoid_dupe_parts = [cas_torso cas_legs] random_preset = <preset_struct>
				<iloop> = (<iloop> + 1)
				if (<iloop> = 20)
					printf \{'gave up'}
					break
				else
					printf \{'dupe outfit, picking again...'}
				endif
			else
				break
			endif
		endif
	else
		ScriptAssert \{'Could not pick a random preset!'}
	endif
	repeat
	return chosen_setup = <possible_setup>
endscript

script cas_random_set_hair_from_car_setup \{chosen_setup = 0x69696969}
	resolvebodyspecificpartinappearance \{part = cas_hair}
	<part_struct> = (<chosen_setup>.<part>)
	cas_add_item_to_appearance part = <part> desc_id = (<part_struct>.desc_id) no_rebuild
	setcasappearancepartinstance part = <part> part_instance = <part_struct>
endscript

script cas_set_random_presets \{gender = !q1768515945
		preset_type = !q1768515945
		chosen_setup = 0x69696969}
	if StructureContains structure = <chosen_setup> <preset_type>
		cas_get_preset_index preset_type = <preset_type> gender = <gender> desc_id = (<chosen_setup>.<preset_type>)
		cas_apply_preset {
			preset_type = <preset_type>
			preset_index = <preset_index>
			gender = <gender>
		}
		if (<preset_type> = car_presets_outfit)
			if resolvebodyspecificpartinappearance \{part = cas_hat}
				<preset_struct> = (($<preset_type>.<gender>) [<preset_index>])
				if StructureContains structure = <preset_struct> <part>
					if getcasappearancepartdescid part = <part>
						cas_disq_resolve_hat_hair part = <part> desc_id = <desc_id>
					endif
				endif
			endif
		endif
	endif
endscript

script cas_get_preset_index \{preset_type = !q1768515945
		gender = !q1768515945
		desc_id = !q1768515945}
	<preset_array> = ($<preset_type>.<gender>)
	GetArraySize <preset_array>
	<i> = 0
	begin
	if ((<preset_array> [<i>].desc_id) = <desc_id>)
		return true preset_index = <i>
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	ScriptAssert 'Preset %a not found in %b %c' a = <desc_id> b = <preset_type> c = <gender>
	return \{FALSE}
endscript

script cas_set_random_avatar_instrument 
	Change cas_dupe_appearance = ($cas_current_appearance)
	cas_grab_random_unlocks
	randomize
	cas_generate_all_random_instruments is_female = <is_female> genre = <genre>
	Change \{cas_current_unlock_list = [
		]}
	Change \{cas_dupe_appearance = {
		}}
endscript

script cas_grab_random_unlocks 
	if ($cpu_random_character = 0 && $cas_current_savegame >= 0)
		GetGlobalTags unlocked_cas_items savegame = ($cas_current_savegame)
		Change cas_current_unlock_list = <unlocked_cas_items>
	else
		Change \{cas_current_unlock_list = [
			]}
	endif
endscript

script cas_generate_all_random_instruments 
	cas_merge_in_random_entry ($cas_randomized_instruments.guitar) is_female = <is_female> genre = <genre>
	cas_merge_in_random_entry ($cas_randomized_instruments.bass) is_female = <is_female> genre = <genre>
	cas_merge_in_random_entry ($cas_randomized_instruments.drum) is_female = <is_female> genre = <genre>
	cas_merge_in_random_entry ($cas_randomized_instruments.vocals) is_female = <is_female> genre = <genre>
endscript

script cas_set_random_appearance_part 
	part = (<part_struct>.part)
	resolvebodyspecificpartinappearance part = <part>
	part_array = ($<part>)
	GetArraySize <part_array>
	if chooserandomcaspart part_name = <part> genre = <genre>
		desc_id = (<random_part>.desc_id)
		cas_handle_disqualifications part = <part> desc_id = <desc_id>
		if GotParam \{new_desc_id}
			desc_id = <new_desc_id>
		endif
		editcasappearance target = setpart targetparams = {part = <part> desc_id = <desc_id>}
	endif
endscript

script cas_random_should_include_part 
	if (<locked> = 1)
		if ($cpu_random_character = 0)
			MangleChecksums a = <desc_id> b = <part_name>
			if NOT ArrayContains array = ($cas_current_unlock_list) contains = <mangled_ID>
				return \{FALSE}
			endif
		endif
	endif
	if (<make_unique> = 1)
		if StructureContains structure = $cas_band_used_parts <part_name>
			if NOT (<desc_id> = None)
				if ArrayContains array = ($cas_band_used_parts.<part_name>) contains = <desc_id>
					return \{FALSE}
				endif
			endif
		endif
	endif
	return \{true}
endscript

script cas_set_random_color_part 
	part = (<part_struct>.part)
	if (<part> = cas_facial_hair)
		return
	endif
	resolvebodyspecificpartinappearance part = <part>
	if getcasappearancepartdescid part = <part>
		if getcaspartmaterials part = <part>
			GetArraySize <part_materials>
			i = 0
			begin
			if cas_pick_random_color part = <part> desc_id = <desc_id> genre = <genre>
				setcasappearancematerial part = <part> material = ((<part_materials> [<i>]).desc_id) value = <Color>
				if (<part> = cas_male_hair)
					set_facial_hair_color part = cas_male_facial_hair Color = <Color>
				endif
			endif
			i = (<i> + 1)
			repeat <array_Size>
		endif
	endif
endscript

script set_facial_hair_color 
	if getcaspartmaterials part = <part>
		GetArraySize <part_materials>
		i = 0
		begin
		setcasappearancematerial part = <part> material = ((<part_materials> [<i>]).desc_id) value = <Color>
		i = (<i> + 1)
		repeat <array_Size>
	endif
endscript

script cas_can_pick_random_color 
	if GotParam \{desc_id}
		getactualcasoptionstruct part = <part> desc_id = <desc_id>
		if GotParam \{random_colors}
			return true rand_colors = (<random_colors>)
		elseif GotParam \{force_random}
			GetArraySize \{$cas_randomized_parts}
			i = 0
			begin
			if checksumequals a = (($cas_randomized_parts [<i>]).part) b = <part>
				if StructureContains structure = ($cas_randomized_parts [<i>]) force_random_colors
					return true rand_colors = (($cas_randomized_parts [<i>]).force_random_colors)
				endif
				return \{FALSE}
			endif
			i = (<i> + 1)
			repeat <array_Size>
		endif
	endif
	return \{FALSE}
endscript

script cas_pick_random_color 
	if cas_can_pick_random_color <...>
		if chooserandompresetbygenre localarray = <rand_colors> genre = <genre>
			if StructureContains structure = <random_preset> Color
				printf 'Set Random color for %s' s = <part> donotresolve
				return true Color = (<random_preset>.Color)
			endif
		endif
	endif
	return \{FALSE}
endscript

script cas_random_handle_exclusions 
endscript

script cas_random_handle_exclusions_scanner 
endscript

script cas_random_find_exclusion 
endscript

script cas_do_randomize_presets 
endscript

script cas_merge_in_cap 
	existing_cap = []
	if StructureContains structure = <existing_part> cap
		existing_cap = (<existing_part>.cap)
	endif
	i = 0
	GetArraySize <cap_merge>
	if (<array_Size> > 0)
		begin
		cas_merge_in_cap_foreach existing_cap = <existing_cap> cap_entry = (<cap_merge> [<i>])
		i = (<i> + 1)
		repeat <array_Size>
	endif
	GetArraySize <existing_cap>
	if (<array_Size> = 0)
		RemoveParameter \{existing_cap}
	endif
	return merge_in = {<existing_part> cap = <existing_cap>}
endscript

script cas_merge_in_cap_foreach 
	if StructureContains structure = <cap_entry> base_tex
		new_base_tex = (<cap_entry>.base_tex)
		i = 0
		GetArraySize <existing_cap>
		if (<array_Size> > 0)
			begin
			if StructureContains structure = (<existing_cap> [<i>]) base_tex
				if ((<existing_cap> [<i>].base_tex) = <new_base_tex>)
					return
				endif
			endif
			i = (<i> + 1)
			repeat <array_Size>
		endif
		AddArrayElement array = <existing_cap> element = <cap_entry>
		return existing_cap = <array>
	endif
endscript

script check_dupe_appearance 
	RequireParams \{[
			avoid_dupe_parts
			random_preset
		]
		all}
	GetArraySize <avoid_dupe_parts>
	if (<array_Size> > 0)
		i = 0
		begin
		part = (<avoid_dupe_parts> [<i>])
		resolvebodyspecificpartinappearance part = <part>
		if NOT StructureContains structure = <random_preset> <part>
			return \{FALSE}
		endif
		desc_id = (<random_preset>.<part>.desc_id)
		if NOT StructureContains structure = ($cas_dupe_appearance) <part>
			return \{FALSE}
		endif
		app_desc_id = (($cas_dupe_appearance).<part>.desc_id)
		if (<desc_id> != <app_desc_id>)
			return \{FALSE}
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	printf \{'check_dupe_appearance - Appearance matches!'}
	return \{true}
endscript

script cas_merge_in_random_entry 
	if GotParam \{female_array}
		if (<is_female> = 1)
			chosen_array = <female_array>
		else
			chosen_array = <male_array>
		endif
	else
		chosen_array = <array>
	endif
	iloop = 0
	begin
	if chooserandompresetbygenre globalarray = <chosen_array> genre = <genre>
		RemoveComponent \{structure_name = random_preset
			Name = random_weight}
		RemoveComponent \{structure_name = random_preset
			Name = genre}
		if GotParam \{avoid_dupe_parts}
			if NOT check_dupe_appearance avoid_dupe_parts = <avoid_dupe_parts> random_preset = <random_preset>
				no_dupes = 1
			endif
		else
			no_dupes = 1
		endif
		if (<iloop> = 10)
			no_dupes = 1
		endif
		if GotParam \{no_dupes}
			Change cas_current_appearance = {($cas_current_appearance) <random_preset>}
			if resolvebodyspecificpartinappearance \{part = cas_hat}
				if StructureContains structure = <random_preset> <part>
					if getcasappearancepartdescid part = <part>
						cas_disq_resolve_hat_hair part = <part> desc_id = <desc_id>
					endif
				endif
			endif
			return
		else
			printf 'Avoided duped parts %d' d = <iloop>
		endif
	endif
	iloop = (<iloop> + 1)
	repeat
endscript

script cas_generate_new_random_instrument 
	Change cas_dupe_appearance = ($cas_current_appearance)
	cas_grab_random_unlocks
	randomize
	RequireParams \{[
			Type
		]
		all}
	switch <Type>
		case guitar
		avoid_dupe_parts = [cas_guitar_body cas_guitar_head]
		case bass
		avoid_dupe_parts = [cas_bass_body cas_bass_head]
		case drum
		avoid_dupe_parts = [cas_drums]
		case vocals
		avoid_dupe_parts = [cas_mic_stand cas_mic]
	endswitch
	get_is_female_from_appearance appearance = ($cas_current_appearance)
	cas_merge_in_random_entry {
		($cas_randomized_instruments.<Type>)
		is_female = <is_female>
		genre = any
		avoid_dupe_parts = <avoid_dupe_parts>
		avoid_dupe_appearance = <avoid_dupe_appearance>
	}
	Change \{cas_current_unlock_list = [
		]}
	Change \{cas_dupe_appearance = {
		}}
endscript

script remove_locked_cas_textures 
	GetArraySize <array>
	if (<array_Size> > 0)
		i = 0
		begin
		if StructureContains structure = (<array> [<i>]) locked
			if NOT check_cas_texture_unlocked_flag savegame = ($cas_current_savegame) texture = (<array> [<i>].pattern)
				is_locked = 1
			endif
		endif
		if GotParam \{is_locked}
			RemoveArrayElement array = <array> index = <i>
			RemoveParameter \{is_locked}
			printf 'remove_locked_cas_textures: Removed texture index %d' d = <i>
		else
			i = (<i> + 1)
		endif
		repeat <array_Size>
	endif
	return mask = <array>
endscript

script random_instrument_piece 
	printf 'random_instrument_piece %p' p = <part> donotresolve
	if NOT random_instrument_piece_do_inclusions inc = <inc> part = <part>
		cas_set_random_appearance_part part_struct = {part = <part>} genre = any
	endif
	if getcapsectionsarray appearance = $cas_current_appearance part = <part>
		num_found = 0
		printf 'Found sections in instrument piece %p' p = <part> donotresolve
		GetArraySize <sections>
		if (<array_Size> > 0)
			i = 0
			begin
			desc_id = (<sections> [<i>].desc_id)
			if ((<desc_id> = finishes) || (<desc_id> = details))
				num_found = (<num_found> + 1)
				if (<num_found> > 2)
					ScriptAssert \{'this only handles two layers, logic needs to be more complex for more'}
				endif
				printf 'Found %d section in instrument piece' d = <desc_id> donotresolve
				mask = (<sections> [<i>].mask)
				remove_locked_cas_textures array = <mask>
				if pickfromweightedarray weighted_array = <mask>
					printf 'Picked index %i' i = <random_index> donotresolve
					base_tex = (<sections> [<i>].base_tex)
					chosen_mask = (<mask> [<random_index>])
					printf 'Frontend desc is %s' s = (<chosen_mask>.frontend_desc) donotresolve
					if NOT StructureContains structure = (<sections> [<i>]) diffuse
						ScriptAssert \{'Instrument defs all need to be on diffuse'}
					endif
					if NOT StructureContains structure = (<sections> [<i>]) pre_userlayer
						ScriptAssert \{'Instrument defs all need to be pre_userlayer'}
					endif
					Name = (<chosen_mask>.pattern)
					material = (<sections> [<i>].material)
					new_cap_entry = 1
					if GotParam \{last_base_tex}
						if (<last_base_tex> = <base_tex>)
							new_cap_entry = 0
							if NOT (<last_material> = <material>)
								ScriptAssert 'material mismatch %a != %b' a = <last_material> b = <material> donotresolve
							endif
						endif
					endif
					if StructureContains structure = <chosen_mask> no_color
						RemoveParameter \{Color}
					else
						cas_pick_random_colorwheel
					endif
					set_cap_flags mask = <chosen_mask>
					new_entry = {
						texture = <Name>
						flags = <flags>
						Color = <Color>
					}
					if (<new_cap_entry> = 0)
						cap_array = [
							{
								base_tex = <base_tex>
								material = <material>
								diffuse
								pre_layer = [
									{
										<last_entry>
									}
									{
										<new_entry>
									}
								]
							}
						]
					else
						cap_entry = [
							{
								base_tex = <base_tex>
								material = <material>
								diffuse
								pre_layer = [
									{
										<new_entry>
									}
								]
							}
						]
						if GotParam \{cap_array}
							cap_array = (<cap_array> + <cap_entry>)
						else
							cap_array = <cap_entry>
						endif
					endif
					last_base_tex = <base_tex>
					last_material = <material>
					last_entry = <new_entry>
				endif
			endif
			i = (<i> + 1)
			repeat <array_Size>
		endif
	endif
	if GotParam \{cap_array}
		printstruct <cap_array>
		setcasappearancecap part = <part> cap = <cap_array>
	else
		setcasappearancecap part = <part>
	endif
	printf \{''}
endscript

script random_instrument_piece_do_inclusions 
	if GotParam \{inc}
		getcasappearancepartdescid part = <inc>
		getactualcasoptionstruct part = <inc> desc_id = <desc_id>
		if GotParam \{inclusion}
			printf 'Inclusion list for %i->%d...' i = <inc> d = <part> donotresolve
			GetArraySize <inclusion>
			if (<array_Size> > 0)
				i = 0
				begin
				if (<inclusion> [<i>].part = <part>)
					printf \{'Found!'}
					array = (<inclusion> [<i>].valid)
					trim_inclusion_array inclusion_array = <array> part = <part>
					if random_instrument_pick_from_array array = <array>
						printf 'Using %a %b' a = <part> b = <element>
						editcasappearance target = setpart targetparams = {part = <part> desc_id = <element>}
						return \{true}
					endif
				endif
				i = (<i> + 1)
				repeat <array_Size>
			endif
			printf 'Inclusion not found, clearing %a' a = <part>
			editcasappearance target = clearpart targetparams = {part = <part>}
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script random_instrument_pick_from_array 
	GetArraySize <array>
	if (<array_Size> = 0)
		return \{FALSE}
	endif
	getrandomarrayelement <array>
	return true element = <element>
endscript

script random_cas_piece_unlocked 
	getactualcasoptionstruct part = <part> desc_id = <desc_id>
	if GotParam \{locked}
		MangleChecksums a = <desc_id> b = <part>
		if NOT ArrayContains array = ($cas_current_unlock_list) contains = <mangled_ID>
			return \{FALSE}
		endif
	endif
	return \{true}
endscript

script trim_inclusion_array 
	array = []
	GetArraySize <inclusion_array>
	if (<array_Size> > 0)
		i = 0
		begin
		valid_part = (<inclusion_array> [<i>])
		if random_cas_piece_unlocked part = <part> desc_id = <valid_part>
			AddArrayElement array = <array> element = <valid_part>
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	return array = <array>
endscript

script cas_pick_random_colorwheel \{wheel = $guitar_colorwheel}
	GetArraySize <wheel>
	GetRandomValue Name = index integer a = 0 b = (<array_Size> -1)
	wheel_entry = (<wheel> [<index>])
	getrandomarrayelement <wheel_entry>
	return Color = <element>
endscript
