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
		part = cas_teeth
	}
	{
		part = cas_eyes
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

	if GotParam \{make_unique_band}
		band_builder_get_used_parts make_unique_band = <make_unique_band>
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
	stars

	stars
	GetArraySize \{$cas_randomized_parts}
	i = 0
	begin
	cas_set_random_appearance_part part_struct = ($cas_randomized_parts [<i>]) genre = <genre>
	i = (<i> + 1)
	repeat <array_Size>
	GetArraySize \{$cas_randomized_parts}
	i = 0
	begin
	cas_set_random_color_part part_struct = ($cas_randomized_parts [<i>]) genre = <genre>
	i = (<i> + 1)
	repeat <array_Size>
	cas_propogate_hair_color
	get_is_female_from_appearance \{appearance = $cas_current_appearance}
	if (<is_female> = 1)
		0x5a95f6d5 = 0
		if NOT load_part_desc_pak \{part_type = cas_female_base_torso}
			0x5a95f6d5 = 1
		endif
		editcasappearance \{target = setpart
			targetparams = {
				part = cas_female_base_torso
				desc_id = female_full
			}}
		cas_set_random_appearance_part part_struct = {part = cas_eye_makeup} genre = <genre>
		cas_set_random_appearance_part part_struct = {part = cas_lip_makeup} genre = <genre>
		cas_set_random_color_part part_struct = {part = cas_lip_makeup} genre = <genre>
	else
		0x5a95f6d5 = 0
		if NOT load_part_desc_pak \{part_type = cas_male_base_torso}
			0x5a95f6d5 = 1
		endif
		editcasappearance \{target = setpart
			targetparams = {
				part = cas_male_base_torso
				desc_id = male_full
			}}
		if (<0x5a95f6d5> = 1)
			unload_part_desc_pak \{part_type = cas_male_base_torso}
		endif
	endif
	if GotParam \{cpu_band}
		ForEachIn $cas_randomized_presets_cpu_band do = cas_do_randomize_presets params = {is_female = <is_female> genre = <genre>}
		cas_set_random_physique
	elseif GotParam \{new_car_character}
		ForEachIn $cas_randomized_presets_car do = cas_do_randomize_presets params = {is_female = <is_female> genre = <genre>}
	endif
	cas_propogate_color_to_other_parts \{part = cas_body
		other_parts = $ps2_fleshy_parts_array}
	if GotParam \{random_instruments}
		cas_merge_in_random_entry entry = ($cas_randomized_instruments.guitar) is_female = <is_female> genre = <genre>
		cas_merge_in_random_entry entry = ($cas_randomized_instruments.bass) is_female = <is_female> genre = <genre>
		cas_merge_in_random_entry entry = ($cas_randomized_instruments.drum) is_female = <is_female> genre = <genre>
		cas_merge_in_random_entry entry = ($cas_randomized_instruments.vocals) is_female = <is_female> genre = <genre>
	endif
	old_appearance = ($cas_current_appearance)
	Change cas_current_appearance = {<old_appearance> genre = <genre>}
endscript

script cas_set_random_appearance_part 
	part = (<part_struct>.part)
	if NOT resolvebodyspecificpartinappearance part = <part>
		if NOT filterpartbyinstrument part = <part> instrument = None
			return
		endif
	endif
	if cas_pick_random_part part_name = <part> genre = <genre> category = <category>
		desc_id = (<random_part>.desc_id)
		cas_handle_disqualifications part = <part> desc_id = <desc_id>
		if GotParam \{new_desc_id}
			desc_id = <new_desc_id>
		endif
		editcasappearance target = setpart targetparams = {part = <part> desc_id = <desc_id>}
	endif
endscript

script cas_random_should_include_part 
	if GotParam \{category}
		if (<category> = esp)
			if NOT StructureContains structure = ($<part_name> [<i>]) is_esp
				return \{FALSE}
			endif
			if StructureContains structure = ($<part_name> [<i>]) is_metallica
				return \{FALSE}
			endif
		elseif (<category> = gh)
			if StructureContains structure = ($<part_name> [<i>]) is_esp
				return \{FALSE}
			endif
			if StructureContains structure = ($<part_name> [<i>]) is_metallica
				return \{FALSE}
			endif
		endif
	endif
	if StructureContains structure = ($<part_name> [<i>]) exclusive
		return \{FALSE}
	endif
	if StructureContains structure = ($<part_name> [<i>]) hidden
		return \{FALSE}
	endif
	random_weight = 1.0
	if StructureContains structure = ($<part_name> [<i>]) random_weight
		random_weight = (($<part_name> [<i>]).random_weight)
	endif
	if ($cpu_random_character = 1)
		if StructureContains structure = ($<part_name> [<i>]) random_weight_cpu
			random_weight = (($<part_name> [<i>]).random_weight_cpu)
		endif
	endif
	if (<random_weight> = 0.0)
		return \{FALSE}
	endif
	if NOT (<genre> = any)
		if StructureContains structure = ($<part_name> [<i>]) genre
			if NOT ArrayContains array = (($<part_name> [<i>]).genre) contains = <genre>
				return \{FALSE}
			endif
		endif
	endif
	desc_id = ((($<part_name>) [<i>]).desc_id)
	if (1)
		if NOT is_part_unlocked part = <part_name> desc_id = <desc_id> savegame = ($cas_current_savegame)
			return \{FALSE}
		endif
		if NOT is_part_purchased part = <part_name> desc_id = <desc_id> savegame = ($cas_current_savegame)
			return \{FALSE}
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
	return true new_part = {
		desc_id = <desc_id>
		random_weight = <random_weight>
	}
endscript

script cas_create_filtered_parts_array 

	filtered_array = []
	GetArraySize $<part_name>
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
	repeat <array_Size>
	return filtered_array = <filtered_array>
endscript

script cas_pick_random_part 
	cas_create_filtered_parts_array part_name = <part_name> genre = <genre> make_unique = 1 category = <category>
	GetArraySize <filtered_array>
	if (<array_Size> = 0)
		cas_create_filtered_parts_array part_name = <part_name> genre = <genre> make_unique = 0
		GetArraySize <filtered_array>
		if (<array_Size> = 0)
			cas_create_filtered_parts_array part_name = <part_name> genre = any make_unique = 0
		endif
	endif
	if cas_pick_from_weighted_array weighted_array = <filtered_array> cas_pieces = 1
		return true random_part = (<filtered_array> [<random_index>])
	endif
	return \{FALSE}
endscript

script cas_pick_from_weighted_array 
	GetArraySize <weighted_array>
	if (<array_Size> > 0)
		cas_get_total_random_weight array = <weighted_array> cas_pieces = <cas_pieces>
		GetRandomValue Name = rand_val a = 0.0 b = <total_weight> resolution = 10000
		i = 0
		begin
		if GotParam \{cas_pieces}
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
		repeat <array_Size>
		if (<i> = <array_Size>)
			i = (<array_Size> - 1)
		endif
		return true random_index = <i>
	endif
	return \{FALSE}
endscript

script cas_get_random_weight 
	if ($cpu_random_character = 1)
		if StructureContains structure = <part> random_weight_cpu

			return random_weight = (<part>.random_weight_cpu)
		endif
	endif
	if StructureContains structure = <part> random_weight
		return random_weight = (<part>.random_weight)
	endif
	return \{random_weight = 1.0}
endscript

script cas_get_total_random_weight 
	total = 0.0
	GetArraySize <array>
	i = 0
	if GotParam \{cas_pieces}
		begin
		total = (<total> + ((<array> [<i>]).random_weight))
		i = (<i> + 1)
		repeat <array_Size>
	else
		begin
		cas_get_random_weight part = (<array> [<i>])
		total = (<total> + <random_weight>)
		i = (<i> + 1)
		repeat <array_Size>
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
			GetArraySize <part_materials>
			i = 0
			begin
			if cas_pick_random_color part = <part> desc_id = <desc_id> genre = <genre>
				setcasappearancematerial part = <part> material = (<part_materials> [<i>]) value = <Color>
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
	if getcasappearancepart part = <part>
		if getcaspartmaterials part = <part>
			GetArraySize <part_materials>
			i = 0
			begin
			setcasappearancematerial part = <part> material = (<part_materials> [<i>]) value = <Color>
			i = (<i> + 1)
			repeat <array_Size>
		endif
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
		cas_filter_random_presets_by_genre array = <rand_colors> genre = <genre>
		if cas_pick_from_weighted_array weighted_array = <filtered_array>
			color_entry = (<filtered_array> [<random_index>])
			if StructureContains structure = <color_entry> Color

				return true Color = (<color_entry>.Color)
			endif
		endif
	endif
	return \{FALSE}
endscript

script cas_random_find_exclusion 
endscript

script cas_filter_random_presets_by_category 

	if StructureContains structure = <entry> array
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
	GetArraySize <array>
	if (<array_Size> > 0)
		0x5a95f6d5 = 0
		if NOT load_part_desc_pak part_type = <part>
			0x5a95f6d5 = 1
		endif
		i = 0
		begin
		okay = 1
		<desc_id> = (<array> [<i>])
		if (<category> = esp)
			if NOT StructureContains structure = (<desc_id>) is_esp
				<okay> = 0
			endif
		elseif (<category> = metallica)
			if NOT StructureContains structure = (<desc_id>) is_metallica
				<okay> = 0
			endif
		else
			if StructureContains structure = (<desc_id>) is_esp
				<okay> = 0
			endif
			if StructureContains structure = (<desc_id>) is_metallica
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
		if StructureContains structure = (<desc_id>) exclusive
			<okay> = 0
		endif
		if (<okay> = 1)
			new_part = (<array> [<i>])
			new_entry = [{<new_part>}]
			filtered_array = (<filtered_array> + <new_entry>)
		endif
		i = (<i> + 1)
		repeat <array_Size>
		if (<0x5a95f6d5> = 1)
			unload_part_desc_pak part_type = <part>
		endif
	endif
	return filtered_array = <filtered_array>
endscript

script cas_filter_random_presets_by_genre 

	filtered_array = []
	GetArraySize <array>
	if (<array_Size> > 0)
		i = 0
		begin
		okay = 1
		if NOT (<genre> = any)
			if StructureContains structure = (<array> [<i>]) genre
				if NOT ArrayContains array = ((<array> [<i>]).genre) contains = <genre>
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
		repeat <array_Size>
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
		if StructureContains structure = $cas_current_appearance <part>
			existing_part = ($cas_current_appearance.<part>)
		endif
		merge_in = (<filtered_array> [<random_index>])
		if StructureContains structure = <merge_in> cap_merge
			cas_merge_in_cap existing_part = <existing_part> cap_merge = (<merge_in>.cap_merge)
		endif
		existing_part = {<existing_part> <merge_in>}
		updatestructelement struct = $cas_current_appearance element = <part> value = <existing_part>
		Change cas_current_appearance = <newstruct>
	endif
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

script cas_merge_in_random_entry 
	if StructureContains structure = <entry> female_array
		if (<is_female> = 1)
			chosen_array = (<entry>.female_array)
		else
			chosen_array = (<entry>.male_array)
		endif
	else
		chosen_array = (<entry>.array)
	endif
	if NOT GotParam \{category}
		category = Random (@ gh @ esp @ metallica )
	endif
	cas_filter_random_presets_by_category array = $<chosen_array> category = <category> entry = <entry>
	cas_filter_random_presets_by_genre array = <filtered_array> genre = <genre>
	if cas_pick_from_weighted_array weighted_array = <filtered_array>
		merge_in = (<filtered_array> [<random_index>])
		RemoveComponent \{structure_name = merge_in
			Name = random_weight}
		RemoveComponent \{structure_name = merge_in
			Name = random_weight_cpu}
		RemoveComponent \{structure_name = merge_in
			Name = genre}
		RemoveParameter \{struct_name = merge_in
			is_esp}
		RemoveParameter \{struct_name = merge_in
			is_metallica}
		RemoveComponent \{structure_name = merge_in
			Name = is_esp}
		RemoveComponent \{structure_name = merge_in
			Name = is_metallica}
		old_appearance = ($cas_current_appearance)
		Change cas_current_appearance = {<old_appearance> <merge_in>}
	endif
endscript

script cas_random_band_name 
	getrandomarrayelement ($gh_random_band_names)
	return random_name = <element>
endscript

script cas_set_random_physique 
	if NOT getcasappearancepart \{part = cas_physique}

	endif
	if NOT getactualcasoptionstruct part = cas_physique desc_id = <desc_id>

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
	Change \{cpu_random_character = 0}
	Change \{cas_band_used_parts = {
		}}
	randomize
	switch <Type>
		case guitar
		array = [
			{part = cas_guitar_body}
			{part = cas_guitar_strings}
			{part = cas_guitar_neck inc = cas_guitar_body}
			{part = cas_guitar_head inc = cas_guitar_body}
			{part = cas_guitar_pickguards inc = cas_guitar_body}
			{part = cas_guitar_bridges inc = cas_guitar_body}
			{part = cas_guitar_knobs inc = cas_guitar_body}
			{part = cas_guitar_pickups inc = cas_guitar_body}
			{part = cas_guitar_finish inc = cas_guitar_body}
			{part = cas_guitar_body_detail inc = cas_guitar_body}
			{part = cas_guitar_body_fade inc = cas_guitar_body}
			{part = cas_guitar_neck_finish inc = cas_guitar_neck}
			{part = cas_guitar_head_finish inc = cas_guitar_head}
			{part = cas_guitar_head_detail inc = cas_guitar_head}
			{part = cas_guitar_head_fade inc = cas_guitar_head}
			{part = cas_guitar_pickguard_finish inc = cas_guitar_pickguards}
			{part = cas_guitar_logo inc = cas_guitar_body}
		]
		case bass
		array = [
			{part = cas_bass_body}
			{part = cas_bass_strings}
			{part = cas_bass_neck inc = cas_bass_body}
			{part = cas_bass_head inc = cas_bass_body}
			{part = cas_bass_pickguards inc = cas_bass_body}
			{part = cas_bass_bridges inc = cas_bass_body}
			{part = cas_bass_knobs inc = cas_bass_body}
			{part = cas_bass_pickups inc = cas_bass_body}
			{part = cas_bass_finish inc = cas_bass_body}
			{part = cas_bass_body_detail inc = cas_bass_body}
			{part = cas_bass_body_fade inc = cas_bass_body}
			{part = cas_bass_neck_finish inc = cas_bass_neck}
			{part = cas_bass_head_finish inc = cas_bass_head}
			{part = cas_bass_head_detail inc = cas_bass_head}
			{part = cas_bass_head_fade inc = cas_bass_head}
			{part = cas_bass_pickguard_finish inc = cas_bass_pickguards}
			{part = cas_guitar_logo inc = cas_bass_body}
		]
		case drum
		array = [
			{part = cas_drums}
			{part = cas_drums_sticks}
			{part = cas_drums_sticks_l}
			{part = cas_drums_sticks_r}
			{part = cas_drum_finish}
			{part = cas_drum_detail}
		]
		case vocals
		array = [
			{part = cas_mic}
			{part = cas_mic_stand}
		]
	endswitch
	ForEachIn <array> do = random_instrument_piece
	if GotParam \{rebuild}
		rebuildcurrentcasmodel
	endif
endscript

script random_instrument_piece 

	<category> = gh
	if ($randomize_from_cai_menu = 0)
		if ($cag_instrument_type = guitar)
			GetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue param = guitar_category
			<category> = <guitar_category>
		elseif ($cag_instrument_type = bass)
			GetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue param = bass_category
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
	if GotParam \{sections}
		num_found = 0

		GetArraySize <sections>
		if (<array_Size> > 0)
			i = 0
			begin
			desc_id = (<sections> [<i>].desc_id)
			if ((<desc_id> = finishes) || (<desc_id> = details))
				num_found = (<num_found> + 1)
				if (<num_found> > 2)

				endif

				mask = (<sections> [<i>].mask)
				if cas_pick_from_weighted_array weighted_array = <mask>

					formatText checksumName = base_tex '%s' s = (<sections> [<i>].base_tex)
					chosen_mask = (<mask> [<random_index>])

					if NOT StructureContains structure = (<sections> [<i>]) diffuse

					endif
					if NOT StructureContains structure = (<sections> [<i>]) pre_userlayer

					endif
					fiximagepath path = (<chosen_mask>.pattern)
					material = (<sections> [<i>].material)
					new_cap_entry = 1
					if GotParam \{last_base_tex}
						if (<last_base_tex> = <base_tex>)
							new_cap_entry = 0
							if NOT (<last_material> = <material>)

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
		setcasappearancecap part = <part> cap = <cap_array>
	else
		setcasappearancecap part = <part>
	endif

endscript

script random_instrument_piece_do_inclusions 
	if GotParam \{inc}
		getcasappearancepart part = <inc>
		getactualcasoptionstruct part = <inc> desc_id = <desc_id>
		if GotParam \{inclusion}

			GetArraySize <inclusion>
			if (<array_Size> > 0)
				i = 0
				begin
				if (<inclusion> [<i>].part = <part>)

					array = (<inclusion> [<i>].valid)
					trim_inclusion_array inclusion_array = <array> part = <part>
					if random_instrument_pick_from_array array = <array>
						editcasappearance target = setpart targetparams = {part = <part> desc_id = <element>}
						return \{true}
					endif
				endif
				i = (<i> + 1)
				repeat <array_Size>
			endif
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

script cas_piece_exists 
	if getactualcasoptionstruct part = <part> desc_id = <desc_id> dont_assert
		return \{true}
	endif
	return \{FALSE}
endscript

script trim_inclusion_array 
	array = []
	GetArraySize <inclusion_array>
	if (<array_Size> > 0)
		i = 0
		begin
		valid_part = (<inclusion_array> [<i>])
		if cas_piece_exists part = <part> desc_id = <valid_part>
			if is_part_unlocked part = <part> desc_id = <valid_part> savegame = ($cas_current_savegame)
				if is_part_purchased part = <part> desc_id = <valid_part> savegame = ($cas_current_savegame)
					if ps2_getactualcasoptionstruct_as_struct part = <part> desc_id = <valid_part>
						if NOT (StructureContains structure = <ps2_part_struct> hidden)
							cas_get_random_weight part = <ps2_part_struct>
							if (<random_weight> > 0.0)
								AddArrayElement array = <array> element = <valid_part>
							endif
						endif
					endif
				endif
			endif
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
