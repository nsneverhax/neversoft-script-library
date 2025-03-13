cas_randomized_parts = [
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
		part = cas_hat
	}
	{
		part = cas_hair
	}
	{
		part = cas_facial_hair
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
		part = cas_intro_anim
	}
	{
		part = cas_win_anim
	}
	{
		part = cas_lose_anim
	}
	{
		part = cas_age
	}
	{
		part = cas_eyes
	}
	{
		part = cas_drums_highway
	}
	{
		part = cas_guitar_highway
	}
	{
		part = cas_bass_highway
	}
]
cas_randomized_presets_car = [
	{
		part = cas_body
		female_array = cas_preset_face_skin_female
		male_array = cas_preset_face_skin_male
	}
]
cas_randomized_presets_cpu_band = [
	{
		part = cas_body
		female_array = cas_preset_face_skin_female
		male_array = cas_preset_face_skin_male
	}
	{
		part = cas_physique
		female_array = cas_preset_body_female
		male_array = cas_preset_body_male
	}
	{
		part = cas_body
		female_array = cas_preset_tattoo_female
		male_array = cas_preset_tattoo_male
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
randomize_from_cai_menu = 0

script cas_set_random_appearance 
	requireparams \{[
			genre
		]
		all}
	if gotparam \{make_unique_band}
		band_builder_get_used_parts make_unique_band = <make_unique_band>
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
	randomize
	stars
	printf 'Generating random appearance - Seed=%s genre=%g' s = <rand_seed> g = <genre>
	stars
	getarraysize \{$cas_randomized_parts}
	i = 0
	begin
	cas_set_random_appearance_part part_struct = ($cas_randomized_parts [<i>]) genre = <genre>
	i = (<i> + 1)
	repeat <array_size>
	cas_propogate_hair_color
	get_is_female_from_appearance \{appearance = $cas_current_appearance}
	if gotparam \{cpu_band}
		foreachin $cas_randomized_presets_cpu_band do = cas_do_randomize_presets params = {is_female = <is_female> genre = <genre>}
		cas_set_random_physique
	elseif gotparam \{new_car_character}
		foreachin $cas_randomized_presets_car do = cas_do_randomize_presets params = {is_female = <is_female> genre = <genre>}
	endif
	if gotparam \{random_instruments}
		cas_merge_in_random_entry entry = ($cas_randomized_instruments.guitar) is_female = <is_female> genre = <genre>
		cas_merge_in_random_entry entry = ($cas_randomized_instruments.bass) is_female = <is_female> genre = <genre>
		cas_merge_in_random_entry entry = ($cas_randomized_instruments.drum) is_female = <is_female> genre = <genre>
		cas_merge_in_random_entry entry = ($cas_randomized_instruments.vocals) is_female = <is_female> genre = <genre>
	endif
	old_appearance = ($cas_current_appearance)
	change cas_current_appearance = {<old_appearance> genre = <genre>}
endscript

script cas_set_random_appearance_part 
	part = (<part_struct>.part)
	printf 'cas_set_random_appearance_part %s' s = <part> donotresolve
	resolvebodyspecificpartinappearance part = <part>
	part_array = ($<part>)
	getarraysize <part_array>
	if cas_pick_random_part part_name = <part> genre = <genre> category = <category>
		desc_id = (<random_part>.desc_id)
		cas_handle_disqualifications part = <part> desc_id = <desc_id>
		if gotparam \{new_desc_id}
			desc_id = <new_desc_id>
		endif
		editcasappearance target = setpart targetparams = {part = <part> desc_id = <desc_id>}
	endif
endscript

script cas_random_should_include_part 
	if gotparam \{category}
		if (<category> = esp)
			if NOT structurecontains structure = ($<part_name> [<i>]) is_esp
				return \{false}
			endif
			if structurecontains structure = ($<part_name> [<i>]) is_metallica
				return \{false}
			endif
		elseif (<category> = gh)
			if structurecontains structure = ($<part_name> [<i>]) is_esp
				return \{false}
			endif
			if structurecontains structure = ($<part_name> [<i>]) is_metallica
				return \{false}
			endif
		endif
	endif
	if structurecontains structure = ($<part_name> [<i>]) exclusive
		return \{false}
	endif
	if structurecontains structure = ($<part_name> [<i>]) hidden
		return \{false}
	endif
	random_weight = 1.0
	if structurecontains structure = ($<part_name> [<i>]) random_weight
		random_weight = (($<part_name> [<i>]).random_weight)
	endif
	if ($cpu_random_character = 1)
		if structurecontains structure = ($<part_name> [<i>]) random_weight_cpu
			random_weight = (($<part_name> [<i>]).random_weight_cpu)
		endif
	endif
	if (<random_weight> = 0.0)
		return \{false}
	endif
	if NOT (<genre> = any)
		if structurecontains structure = ($<part_name> [<i>]) genre
			if NOT arraycontains array = (($<part_name> [<i>]).genre) contains = <genre>
				return \{false}
			endif
		endif
	endif
	desc_id = ((($<part_name>) [<i>]).desc_id)
	if ($cpu_random_character = 0)
		if NOT is_part_unlocked part = <part_name> desc_id = <desc_id> savegame = ($cas_current_savegame)
			return \{false}
		endif
		if NOT is_part_purchased part = <part_name> desc_id = <desc_id> savegame = ($cas_current_savegame)
			return \{false}
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
	return true new_part = {
		desc_id = <desc_id>
		random_weight = <random_weight>
	}
endscript

script cas_create_filtered_parts_array 
	requireparams \{[
			part_name
			genre
			make_unique
		]
		all}
	filtered_array = []
	getarraysize $<part_name>
	i = 0
	begin
	if cas_random_should_include_part {
			part_name = <part_name>
			i = <i>
			make_unique = <make_unique>
			genre = <genre>
			category = <category>
		}
		new_entry = [{<new_part>}]
		filtered_array = (<filtered_array> + <new_entry>)
	endif
	i = (<i> + 1)
	repeat <array_size>
	return filtered_array = <filtered_array>
endscript

script cas_pick_random_part 
	cas_create_filtered_parts_array part_name = <part_name> genre = <genre> make_unique = 1 category = <category>
	getarraysize <filtered_array>
	if (<array_size> = 0)
		cas_create_filtered_parts_array part_name = <part_name> genre = <genre> make_unique = 0
		getarraysize <filtered_array>
		if (<array_size> = 0)
			cas_create_filtered_parts_array part_name = <part_name> genre = any make_unique = 0
		endif
	endif
	if cas_pick_from_weighted_array weighted_array = <filtered_array> cas_pieces = 1
		return true random_part = (<filtered_array> [<random_index>])
	endif
	return \{false}
endscript

script cas_pick_from_weighted_array 
	getarraysize <weighted_array>
	if (<array_size> > 0)
		cas_get_total_random_weight array = <weighted_array> cas_pieces = <cas_pieces>
		getrandomvalue name = rand_val a = 0.0 b = <total_weight> resolution = 10000
		i = 0
		begin
		if gotparam \{cas_pieces}
			random_weight = ((<weighted_array> [<i>]).random_weight)
		else
			cas_get_random_weight part = (<weighted_array> [<i>])
		endif
		if (<random_weight> > 0.0)
			if (<rand_val> <= <random_weight>)
				break
			endif
		endif
		rand_val = (<rand_val> - <random_weight>)
		i = (<i> + 1)
		repeat <array_size>
		if (<i> = <array_size>)
			i = (<array_size> - 1)
		endif
		return true random_index = <i>
	endif
	return \{false}
endscript

script cas_get_random_weight 
	if ($cpu_random_character = 1)
		if structurecontains structure = <part> random_weight_cpu
			printf \{'random_weight_cpu'}
			return random_weight = (<part>.random_weight_cpu)
		endif
	endif
	if structurecontains structure = <part> random_weight
		return random_weight = (<part>.random_weight)
	endif
	return \{random_weight = 1.0}
endscript

script cas_get_total_random_weight 
	total = 0.0
	getarraysize <array>
	i = 0
	if gotparam \{cas_pieces}
		begin
		total = (<total> + ((<array> [<i>]).random_weight))
		i = (<i> + 1)
		repeat <array_size>
	else
		begin
		cas_get_random_weight part = (<array> [<i>])
		total = (<total> + <random_weight>)
		i = (<i> + 1)
		repeat <array_size>
	endif
	return total_weight = <total>
endscript

script cas_set_random_color_part 
	part = (<part_struct>.part)
	if (<part> = cas_facial_hair)
		return
	endif
	resolvebodyspecificpartinappearance part = <part>
	if getcasappearancepart part = <part>
		if getcaspartmaterials part = <part>
			getarraysize <part_materials>
			i = 0
			begin
			if cas_pick_random_color part = <part> desc_id = <desc_id> genre = <genre>
				setcasappearancematerial part = <part> material = (<part_materials> [<i>]) value = <color>
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
	if getcasappearancepart part = <part>
		if getcaspartmaterials part = <part>
			getarraysize <part_materials>
			i = 0
			begin
			setcasappearancematerial part = <part> material = (<part_materials> [<i>]) value = <color>
			i = (<i> + 1)
			repeat <array_size>
		endif
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
		cas_filter_random_presets_by_genre array = <rand_colors> genre = <genre>
		if cas_pick_from_weighted_array weighted_array = <filtered_array>
			color_entry = (<filtered_array> [<random_index>])
			if structurecontains structure = <color_entry> color
				printf 'Set Random color for %s' s = <part> donotresolve
				return true color = (<color_entry>.color)
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

script cas_filter_random_presets_by_category 
	requireparams \{[
			array
			category
			entry
		]
		all}
	if structurecontains structure = <entry> array
		if (<entry>.array = cas_preset_guitars)
			part = cas_guitar_body
		elseif (<entry>.array = cas_preset_basses)
			part = cas_bass_body
		else
			return filtered_array = <array>
		endif
	else
		return filtered_array = <array>
	endif
	filtered_array = []
	getarraysize <array>
	if (<array_size> > 0)
		i = 0
		begin
		okay = 1
		<desc_id> = (<array> [<i>])
		if (<category> = esp)
			if NOT structurecontains structure = (<desc_id>) is_esp
				<okay> = 0
			endif
		elseif (<category> = metallica)
			if NOT structurecontains structure = (<desc_id>) is_metallica
				<okay> = 0
			endif
		else
			if structurecontains structure = (<desc_id>) is_esp
				<okay> = 0
			endif
			if structurecontains structure = (<desc_id>) is_metallica
				<okay> = 0
			endif
		endif
		if ($cpu_random_character = 0)
			if is_part_unlocked part = <part> desc_id = (<desc_id>.<part>.desc_id) savegame = ($cas_current_savegame)
				if NOT is_part_purchased part = <part> desc_id = (<desc_id>.<part>.desc_id) savegame = ($cas_current_savegame)
					<okay> = 0
				endif
			else
				<okay> = 0
			endif
		endif
		if structurecontains structure = (<desc_id>) exclusive
			<okay> = 0
		endif
		if (<okay> = 1)
			new_part = (<array> [<i>])
			new_entry = [{<new_part>}]
			filtered_array = (<filtered_array> + <new_entry>)
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	return filtered_array = <filtered_array>
endscript

script cas_filter_random_presets_by_genre 
	requireparams \{[
			array
			genre
		]
		all}
	filtered_array = []
	getarraysize <array>
	if (<array_size> > 0)
		i = 0
		begin
		okay = 1
		if NOT (<genre> = any)
			if structurecontains structure = (<array> [<i>]) genre
				if NOT arraycontains array = ((<array> [<i>]).genre) contains = <genre>
					okay = 0
				endif
			endif
		endif
		if (<okay> = 1)
			new_part = (<array> [<i>])
			new_entry = [{<new_part>}]
			filtered_array = (<filtered_array> + <new_entry>)
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	return filtered_array = <filtered_array>
endscript

script cas_do_randomize_presets 
	if (<is_female> = 1)
		array_name = <female_array>
	else
		array_name = <male_array>
	endif
	cas_filter_random_presets_by_genre array = $<array_name> genre = <genre>
	if cas_pick_from_weighted_array weighted_array = <filtered_array>
		existing_part = {}
		if structurecontains structure = $cas_current_appearance <part>
			existing_part = ($cas_current_appearance.<part>)
		endif
		merge_in = (<filtered_array> [<random_index>])
		if structurecontains structure = <merge_in> cap_merge
			cas_merge_in_cap existing_part = <existing_part> cap_merge = (<merge_in>.cap_merge)
		endif
		existing_part = {<existing_part> <merge_in>}
		updatestructelement struct = $cas_current_appearance element = <part> value = <existing_part>
		change cas_current_appearance = <newstruct>
	endif
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

script cas_merge_in_random_entry 
	if structurecontains structure = <entry> female_array
		if (<is_female> = 1)
			chosen_array = (<entry>.female_array)
		else
			chosen_array = (<entry>.male_array)
		endif
	else
		chosen_array = (<entry>.array)
	endif
	if NOT gotparam \{category}
		category = Random (@ gh @ esp @ metallica )
	endif
	cas_filter_random_presets_by_category array = $<chosen_array> category = <category> entry = <entry>
	cas_filter_random_presets_by_genre array = <filtered_array> genre = <genre>
	if cas_pick_from_weighted_array weighted_array = <filtered_array>
		merge_in = (<filtered_array> [<random_index>])
		removecomponent \{structure_name = merge_in
			name = random_weight}
		removecomponent \{structure_name = merge_in
			name = random_weight_cpu}
		removecomponent \{structure_name = merge_in
			name = genre}
		old_appearance = ($cas_current_appearance)
		change cas_current_appearance = {<old_appearance> <merge_in>}
	endif
endscript

script cas_random_band_name 
	getrandomarrayelement ($gh_random_band_names)
	return random_name = <element>
endscript

script cas_random_band_logo 
	getrandomarrayelement ($cas_preset_bandlogo)
	return cap = (<element>.cap)
endscript

script cas_set_random_physique 
	if NOT getcasappearancepart \{part = cas_physique}
		scriptassert \{'%s not found'
			s = cas_physique}
	endif
	if NOT getactualcasoptionstruct part = cas_physique desc_id = <desc_id>
		scriptassert '%s %t not found' s = cas_physique t = <desc_id>
	endif
	cas_pick_from_weighted_array weighted_array = <preset_builds>
	chosen = (<preset_builds> [<random_index>])
	setcasappearanceadditionalbones part = cas_physique additional_bone_transforms = (<chosen>.additional_bone_transforms)
endscript

script generate_random_instrument 
	if cas_queue_is_busy \{in_queue_too}
		return
	endif
	ui_menu_select_sfx
	change \{cpu_random_character = 0}
	change \{cas_band_used_parts = {
		}}
	randomize
	switch <type>
		case guitar
		array = [
			{part = cas_guitar_body}
			{part = cas_guitar_highway}
			{part = cas_guitar_strings}
			{part = cas_guitar_neck inc = cas_guitar_body}
			{part = cas_guitar_head inc = cas_guitar_body}
			{part = cas_guitar_pickguards inc = cas_guitar_body}
			{part = cas_guitar_bridges inc = cas_guitar_body}
			{part = cas_guitar_knobs inc = cas_guitar_body}
			{part = cas_guitar_pickups inc = cas_guitar_body}
		]
		case bass
		array = [
			{part = cas_bass_body}
			{part = cas_bass_highway}
			{part = cas_bass_strings}
			{part = cas_bass_neck inc = cas_bass_body}
			{part = cas_bass_head inc = cas_bass_body}
			{part = cas_bass_pickguards inc = cas_bass_body}
			{part = cas_bass_bridges inc = cas_bass_body}
			{part = cas_bass_knobs inc = cas_bass_body}
			{part = cas_bass_pickups inc = cas_bass_body}
		]
		case drum
		array = [
			{part = cas_drums}
			{part = cas_drums_sticks}
			{part = cas_drums_highway}
		]
		case vocals
		array = [
			{part = cas_mic}
			{part = cas_mic_stand}
		]
	endswitch
	foreachin <array> do = random_instrument_piece
	if gotparam \{rebuild}
		rebuildcurrentcasmodel
	endif
endscript

script random_instrument_piece 
	printf 'random_instrument_piece %p' p = <part> donotresolve
	<category> = gh
	if ($randomize_from_cai_menu = 0)
		if ($cag_instrument_type = guitar)
			getglobaltags savegame = ($cas_current_savegame) cas_helper_dialogue param = guitar_category
			<category> = <guitar_category>
		elseif ($cag_instrument_type = bass)
			getglobaltags savegame = ($cas_current_savegame) cas_helper_dialogue param = bass_category
			<category> = <bass_category>
		endif
	else
		<category> = Random (@ gh @ esp )
	endif
	if NOT random_instrument_piece_do_inclusions inc = <inc> part = <part>
		cas_set_random_appearance_part part_struct = {part = <part>} genre = any category = <category>
	endif
	getcasappearancepart part = <part>
	getactualcasoptionstruct part = <part> desc_id = <desc_id>
	if gotparam \{sections}
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
				if cas_pick_from_weighted_array weighted_array = <mask>
					printf 'Picked index %i' i = <random_index> donotresolve
					formattext checksumname = base_tex '%s' s = (<sections> [<i>].base_tex)
					chosen_mask = (<mask> [<random_index>])
					printf 'Frontend desc is %s' s = (<chosen_mask>.frontend_desc) donotresolve
					if NOT structurecontains structure = (<sections> [<i>]) diffuse
						scriptassert \{'Instrument defs all need to be on diffuse'}
					endif
					if NOT structurecontains structure = (<sections> [<i>]) pre_userlayer
						scriptassert \{'Instrument defs all need to be pre_userlayer'}
					endif
					fiximagepath path = (<chosen_mask>.pattern)
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
		getcasappearancepart part = <inc>
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
						editcasappearance target = setpart targetparams = {part = <part> desc_id = <element>}
						return \{true}
					endif
				endif
				i = (<i> + 1)
				repeat <array_size>
			endif
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

script cas_piece_exists 
	if getactualcasoptionstruct part = <part> desc_id = <desc_id> dont_assert
		return \{true}
	endif
	return \{false}
endscript

script trim_inclusion_array 
	array = []
	getarraysize <inclusion_array>
	if (<array_size> > 0)
		i = 0
		begin
		valid_part = (<inclusion_array> [<i>])
		if cas_piece_exists part = <part> desc_id = <valid_part>
			if is_part_unlocked part = <part> desc_id = <valid_part> savegame = ($cas_current_savegame)
				if is_part_purchased part = <part> desc_id = <valid_part> savegame = ($cas_current_savegame)
					addarrayelement array = <array> element = <valid_part>
				endif
			endif
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
