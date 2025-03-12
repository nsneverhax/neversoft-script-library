cas_randomized_parts = [
	{
		part = cas_physique
	}
	{
		part = cas_hair
	}
	{
		part = cas_facial_hair
	}
	{
		part = cas_hat
	}
	{
		part = cas_acc_left
	}
	{
		part = cas_acc_right
	}
	{
		part = cas_acc_face
	}
	{
		part = cas_acc_ears
	}
	{
		part = cas_age
	}
	{
		part = cas_teeth
	}
	{
		part = cas_eyes
	}
	{
		part = cas_eyebrows
	}
]
cas_randomized_parts_mixed_genre = [
	{
		part = cas_physique
	}
	{
		part = cas_torso
	}
	{
		part = cas_legs
	}
	{
		part = cas_shoes
	}
	{
		part = cas_hair
	}
	{
		part = cas_acc_left
	}
	{
		part = cas_acc_right
	}
	{
		part = cas_acc_face
	}
	{
		part = cas_acc_ears
	}
	{
		part = cas_age
	}
	{
		part = cas_teeth
	}
	{
		part = cas_eyes
	}
	{
		part = cas_eyebrows
	}
]
cas_randomized_presets = [
	{
		female_array = cas_preset_body_female
		male_array = cas_preset_body_male
		note_random_body_index = true
	}
	{
		female_array = cas_preset_outfit_female
		male_array = cas_preset_outfit_male
		avoid_dupe_parts = [
			cas_torso
			cas_legs
		]
	}
]
cas_randomized_presets_mixed_genre = [
	{
		female_array = cas_preset_body_female
		male_array = cas_preset_body_male
		note_random_body_index = true
	}
]
cas_randomized_instruments = {
	guitar = {
		array = cas_preset_guitars
	}
	bass = {
		array = cas_preset_basses
	}
	drum = {
		array = cas_preset_drums
	}
	vocals = {
		male_array = cas_preset_male_vocals
		female_array = cas_preset_female_vocals
	}
}
cas_band_used_parts = {
}
cpu_random_character = 0

script cas_set_random_appearance 
	requireparams \{[
			genre
			is_female
		]
		all}
	change cas_dupe_appearance = ($cas_current_appearance)
	if gotparam \{used_parts}
		change cas_band_used_parts = <used_parts>
	else
		change \{cas_band_used_parts = {
			}}
	endif
	if gotparam \{cpu_band}
		change \{cpu_random_character = 1}
	else
		change \{cpu_random_character = 0}
	endif
	if (<is_female> = 1)
		change cas_current_appearance = ($default_custom_musician_profile_female.appearance)
	else
		change cas_current_appearance = ($default_custom_musician_profile_male.appearance)
	endif
	cas_grab_random_unlocks
	randomize
	stars
	printf 'Generating random appearance - Seed=%s genre=%g' s = <rand_seed> g = <genre>
	stars
	if (<genre> = any)
		random_part_list = ($cas_randomized_parts_mixed_genre)
		random_preset_list = ($cas_randomized_presets_mixed_genre)
	else
		random_part_list = ($cas_randomized_parts)
		random_preset_list = ($cas_randomized_presets)
	endif
	getarraysize <random_part_list>
	i = 0
	begin
	cas_set_random_appearance_part part_struct = (<random_part_list> [<i>]) genre = <genre>
	i = (<i> + 1)
	repeat <array_size>
	getarraysize \{$cas_randomized_parts}
	i = 0
	begin
	cas_set_random_color_part part_struct = ($cas_randomized_parts [<i>]) genre = <genre>
	i = (<i> + 1)
	repeat <array_size>
	cas_propogate_hair_color
	get_is_female_from_appearance \{appearance = $cas_current_appearance}
	foreachin <random_preset_list> do = cas_merge_in_random_entry params = {is_female = <is_female> genre = <genre>}
	if gotparam \{random_instruments}
		cas_generate_all_random_instruments is_female = <is_female> genre = <genre>
	endif
	change cas_current_appearance = {($cas_current_appearance) genre = <genre>}
	change \{cas_current_unlock_list = [
		]}
	change \{cpu_random_character = 0}
	change \{cas_dupe_appearance = {
		}}
endscript

script cas_set_random_avatar_instrument 
	change cas_dupe_appearance = ($cas_current_appearance)
	cas_grab_random_unlocks
	randomize
	cas_generate_all_random_instruments is_female = <is_female> genre = <genre>
	change \{cas_current_unlock_list = [
		]}
	change \{cas_dupe_appearance = {
		}}
endscript

script cas_grab_random_unlocks 
	if ($cpu_random_character = 0)
		getglobaltags unlocked_cas_items savegame = ($cas_current_savegame)
		change cas_current_unlock_list = <unlocked_cas_items>
	else
		change \{cas_current_unlock_list = [
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
	getarraysize <part_array>
	if chooserandomcaspart part_name = <part> genre = <genre>
		desc_id = (<random_part>.desc_id)
		cas_handle_disqualifications part = <part> desc_id = <desc_id>
		if gotparam \{new_desc_id}
			desc_id = <new_desc_id>
		endif
		editcasappearance target = setpart targetparams = {part = <part> desc_id = <desc_id>}
	endif
endscript

script cas_random_should_include_part 
	if (<locked> = 1)
		if ($cpu_random_character = 0)
			manglechecksums a = <desc_id> b = <part_name>
			if NOT arraycontains array = ($cas_current_unlock_list) contains = <mangled_id>
				return \{false}
			endif
		endif
	endif
	if (<make_unique> = 1)
		if structurecontains structure = $cas_band_used_parts <part_name>
			if NOT (<desc_id> = none)
				if arraycontains array = ($cas_band_used_parts.<part_name>) contains = <desc_id>
					return \{false}
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
			getarraysize <part_materials>
			i = 0
			begin
			if cas_pick_random_color part = <part> desc_id = <desc_id> genre = <genre>
				setcasappearancematerial part = <part> material = ((<part_materials> [<i>]).desc_id) value = <color>
				if (<part> = cas_male_hair)
					set_facial_hair_color part = cas_male_facial_hair color = <color>
				endif
			endif
			i = (<i> + 1)
			repeat <array_size>
		endif
	endif
endscript

script set_facial_hair_color 
	if getcaspartmaterials part = <part>
		getarraysize <part_materials>
		i = 0
		begin
		setcasappearancematerial part = <part> material = ((<part_materials> [<i>]).desc_id) value = <color>
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script cas_can_pick_random_color 
	if gotparam \{desc_id}
		getactualcasoptionstruct part = <part> desc_id = <desc_id>
		if gotparam \{random_colors}
			return true rand_colors = (<random_colors>)
		elseif gotparam \{force_random}
			getarraysize \{$cas_randomized_parts}
			i = 0
			begin
			if checksumequals a = (($cas_randomized_parts [<i>]).part) b = <part>
				if structurecontains structure = ($cas_randomized_parts [<i>]) force_random_colors
					return true rand_colors = (($cas_randomized_parts [<i>]).force_random_colors)
				endif
				return \{false}
			endif
			i = (<i> + 1)
			repeat <array_size>
		endif
	endif
	return \{false}
endscript

script cas_pick_random_color 
	if cas_can_pick_random_color <...>
		if chooserandompresetbygenre localarray = <rand_colors> genre = <genre>
			if structurecontains structure = <random_preset> color
				printf 'Set Random color for %s' s = <part> donotresolve
				return true color = (<random_preset>.color)
			endif
		endif
	endif
	return \{false}
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
	if structurecontains structure = <existing_part> cap
		existing_cap = (<existing_part>.cap)
	endif
	i = 0
	getarraysize <cap_merge>
	if (<array_size> > 0)
		begin
		cas_merge_in_cap_foreach existing_cap = <existing_cap> cap_entry = (<cap_merge> [<i>])
		i = (<i> + 1)
		repeat <array_size>
	endif
	getarraysize <existing_cap>
	if (<array_size> = 0)
		removeparameter \{existing_cap}
	endif
	return merge_in = {<existing_part> cap = <existing_cap>}
endscript

script cas_merge_in_cap_foreach 
	if structurecontains structure = <cap_entry> base_tex
		new_base_tex = (<cap_entry>.base_tex)
		i = 0
		getarraysize <existing_cap>
		if (<array_size> > 0)
			begin
			if structurecontains structure = (<existing_cap> [<i>]) base_tex
				if ((<existing_cap> [<i>].base_tex) = <new_base_tex>)
					return
				endif
			endif
			i = (<i> + 1)
			repeat <array_size>
		endif
		addarrayelement array = <existing_cap> element = <cap_entry>
		return existing_cap = <array>
	endif
endscript

script check_dupe_appearance 
	requireparams \{[
			avoid_dupe_parts
			random_preset
		]
		all}
	getarraysize <avoid_dupe_parts>
	if (<array_size> > 0)
		i = 0
		begin
		part = (<avoid_dupe_parts> [<i>])
		resolvebodyspecificpartinappearance part = <part>
		if NOT structurecontains structure = <random_preset> <part>
			return \{false}
		endif
		desc_id = (<random_preset>.<part>.desc_id)
		if NOT structurecontains structure = ($cas_dupe_appearance) <part>
			return \{false}
		endif
		app_desc_id = (($cas_dupe_appearance).<part>.desc_id)
		if (<desc_id> != <app_desc_id>)
			return \{false}
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	printf \{'check_dupe_appearance - Appearance matches!'}
	return \{true}
endscript

script cas_merge_in_random_entry 
	if gotparam \{female_array}
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
		removecomponent \{structure_name = random_preset
			name = random_weight}
		removecomponent \{structure_name = random_preset
			name = genre}
		if gotparam \{avoid_dupe_parts}
			if NOT check_dupe_appearance avoid_dupe_parts = <avoid_dupe_parts> random_preset = <random_preset>
				no_dupes = 1
			endif
		else
			no_dupes = 1
		endif
		if (<iloop> = 10)
			no_dupes = 1
		endif
		if gotparam \{no_dupes}
			if gotparam \{note_random_body_index}
				random_preset = {<random_preset> body_preset_index = <random_preset_index>}
			endif
			change cas_current_appearance = {($cas_current_appearance) <random_preset>}
			if resolvebodyspecificpartinappearance \{part = cas_hat}
				if structurecontains structure = <random_preset> <part>
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

script cas_random_band_name 
	getrandomarrayelement ($gh_random_band_names)
	return random_name = <element>
endscript

script cas_random_band_logo 
	random_index = 0
	getarraysize ($cas_preset_bandlogo)
	if (<array_size> > 0)
		getrandomvalue name = random_index integer a = 0 b = (<array_size> - 1)
	endif
	return cap = ((($cas_preset_bandlogo) [<random_index>]).cap)
endscript

script cas_generate_new_random_instrument 
	change cas_dupe_appearance = ($cas_current_appearance)
	cas_grab_random_unlocks
	randomize
	requireparams \{[
			type
		]
		all}
	switch <type>
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
		($cas_randomized_instruments.<type>)
		is_female = <is_female>
		genre = any
		avoid_dupe_parts = <avoid_dupe_parts>
		avoid_dupe_appearance = <avoid_dupe_appearance>
	}
	change \{cas_current_unlock_list = [
		]}
	change \{cas_dupe_appearance = {
		}}
endscript

script remove_locked_cas_textures 
	getarraysize <array>
	if (<array_size> > 0)
		i = 0
		begin
		if structurecontains structure = (<array> [<i>]) locked
			if NOT check_cas_texture_unlocked_flag savegame = ($cas_current_savegame) texture = (<array> [<i>].pattern)
				is_locked = 1
			endif
		endif
		if gotparam \{is_locked}
			removearrayelement array = <array> index = <i>
			removeparameter \{is_locked}
			printf 'remove_locked_cas_textures: Removed texture index %d' d = <i>
		else
			i = (<i> + 1)
		endif
		repeat <array_size>
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
		getarraysize <sections>
		if (<array_size> > 0)
			i = 0
			begin
			desc_id = (<sections> [<i>].desc_id)
			if ((<desc_id> = finishes) || (<desc_id> = details))
				num_found = (<num_found> + 1)
				if (<num_found> > 2)
					scriptassert \{'this only handles two layers, logic needs to be more complex for more'}
				endif
				printf 'Found %d section in instrument piece' d = <desc_id> donotresolve
				mask = (<sections> [<i>].mask)
				remove_locked_cas_textures array = <mask>
				if pickfromweightedarray weighted_array = <mask>
					printf 'Picked index %i' i = <random_index> donotresolve
					base_tex = (<sections> [<i>].base_tex)
					chosen_mask = (<mask> [<random_index>])
					printf 'Frontend desc is %s' s = (<chosen_mask>.frontend_desc) donotresolve
					if NOT structurecontains structure = (<sections> [<i>]) diffuse
						scriptassert \{'Instrument defs all need to be on diffuse'}
					endif
					if NOT structurecontains structure = (<sections> [<i>]) pre_userlayer
						scriptassert \{'Instrument defs all need to be pre_userlayer'}
					endif
					name = (<chosen_mask>.pattern)
					material = (<sections> [<i>].material)
					new_cap_entry = 1
					if gotparam \{last_base_tex}
						if (<last_base_tex> = <base_tex>)
							new_cap_entry = 0
							if NOT (<last_material> = <material>)
								scriptassert 'material mismatch %a != %b' a = <last_material> b = <material> donotresolve
							endif
						endif
					endif
					if structurecontains structure = <chosen_mask> no_color
						removeparameter \{color}
					else
						cas_pick_random_colorwheel
					endif
					set_cap_flags mask = <chosen_mask>
					new_entry = {
						texture = <name>
						flags = <flags>
						color = <color>
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
						if gotparam \{cap_array}
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
			repeat <array_size>
		endif
	endif
	if gotparam \{cap_array}
		printstruct <cap_array>
		setcasappearancecap part = <part> cap = <cap_array>
	else
		setcasappearancecap part = <part>
	endif
	printf \{''}
endscript

script random_instrument_piece_do_inclusions 
	if gotparam \{inc}
		getcasappearancepartdescid part = <inc>
		getactualcasoptionstruct part = <inc> desc_id = <desc_id>
		if gotparam \{inclusion}
			printf 'Inclusion list for %i->%d...' i = <inc> d = <part> donotresolve
			getarraysize <inclusion>
			if (<array_size> > 0)
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
				repeat <array_size>
			endif
			printf 'Inclusion not found, clearing %a' a = <part>
			editcasappearance target = clearpart targetparams = {part = <part>}
			return \{true}
		endif
	endif
	return \{false}
endscript

script random_instrument_pick_from_array 
	getarraysize <array>
	if (<array_size> = 0)
		return \{false}
	endif
	getrandomarrayelement <array>
	return true element = <element>
endscript

script random_cas_piece_unlocked 
	getactualcasoptionstruct part = <part> desc_id = <desc_id>
	if gotparam \{locked}
		manglechecksums a = <desc_id> b = <part>
		if NOT arraycontains array = ($cas_current_unlock_list) contains = <mangled_id>
			return \{false}
		endif
	endif
	return \{true}
endscript

script trim_inclusion_array 
	array = []
	getarraysize <inclusion_array>
	if (<array_size> > 0)
		i = 0
		begin
		valid_part = (<inclusion_array> [<i>])
		if random_cas_piece_unlocked part = <part> desc_id = <valid_part>
			addarrayelement array = <array> element = <valid_part>
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	return array = <array>
endscript

script cas_pick_random_colorwheel \{wheel = $guitar_colorwheel}
	getarraysize <wheel>
	getrandomvalue name = index integer a = 0 b = (<array_size> -1)
	wheel_entry = (<wheel> [<index>])
	getrandomarrayelement <wheel_entry>
	return color = <element>
endscript
