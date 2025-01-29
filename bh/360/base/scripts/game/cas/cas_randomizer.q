cas_randomized_parts = [
	{
		part = CAS_Physique
	}
	{
		part = CAS_Hair
	}
	{
		part = cas_facial_hair
	}
	{
		part = CAS_Hat
	}
	{
		part = CAS_Acc_Left
	}
	{
		part = CAS_Acc_Right
	}
	{
		part = CAS_Acc_Face
	}
	{
		part = CAS_Acc_Ears
	}
	{
		part = CAS_Age
	}
	{
		part = CAS_Teeth
	}
	{
		part = CAS_Eyes
	}
	{
		part = CAS_Eyebrows
	}
]
cas_randomized_parts_mixed_genre = [
	{
		part = CAS_Physique
	}
	{
		part = CAS_Torso
	}
	{
		part = CAS_Legs
	}
	{
		part = CAS_Shoes
	}
	{
		part = CAS_Hair
	}
	{
		part = CAS_Acc_Left
	}
	{
		part = CAS_Acc_Right
	}
	{
		part = CAS_Acc_Face
	}
	{
		part = CAS_Acc_Ears
	}
	{
		part = CAS_Age
	}
	{
		part = CAS_Teeth
	}
	{
		part = CAS_Eyes
	}
	{
		part = CAS_Eyebrows
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
			CAS_Torso
			CAS_Legs
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
	Drum = {
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
	RequireParams \{[
			genre
			is_female
		]
		all}
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
	Randomize
	STARS
	printf 'Generating random appearance - Seed=%s genre=%g' s = <rand_seed> g = <genre>
	STARS
	if (<genre> = any)
		random_part_list = ($cas_randomized_parts_mixed_genre)
		random_preset_list = ($cas_randomized_presets_mixed_genre)
	else
		random_part_list = ($cas_randomized_parts)
		random_preset_list = ($cas_randomized_presets)
	endif
	GetArraySize <random_part_list>
	i = 0
	begin
	cas_set_random_appearance_part part_struct = (<random_part_list> [<i>]) genre = <genre>
	i = (<i> + 1)
	repeat <array_size>
	GetArraySize \{$cas_randomized_parts}
	i = 0
	begin
	cas_set_random_color_part part_struct = ($cas_randomized_parts [<i>]) genre = <genre>
	i = (<i> + 1)
	repeat <array_size>
	cas_propogate_hair_color
	get_is_female_from_appearance \{appearance = $cas_current_appearance}
	ForEachIn <random_preset_list> do = cas_merge_in_random_entry params = {is_female = <is_female> genre = <genre>}
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

script cas_set_random_avatar_instrument 
	Change cas_dupe_appearance = ($cas_current_appearance)
	cas_grab_random_unlocks
	Randomize
	cas_generate_all_random_instruments is_female = <is_female> genre = <genre>
	Change \{cas_current_unlock_list = [
		]}
	Change \{cas_dupe_appearance = {
		}}
endscript

script cas_grab_random_unlocks 
	if ($cpu_random_character = 0)
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
	cas_merge_in_random_entry ($cas_randomized_instruments.Drum) is_female = <is_female> genre = <genre>
	cas_merge_in_random_entry ($cas_randomized_instruments.vocals) is_female = <is_female> genre = <genre>
endscript

script cas_set_random_appearance_part 
	part = (<part_struct>.part)
	ResolveBodySpecificPartInAppearance part = <part>
	part_array = ($<part>)
	GetArraySize <part_array>
	if ChooseRandomCASPart part_name = <part> genre = <genre>
		desc_id = (<random_part>.desc_id)
		cas_handle_disqualifications part = <part> desc_id = <desc_id>
		if GotParam \{new_desc_id}
			desc_id = <new_desc_id>
		endif
		EditCASAppearance target = SetPart targetParams = {part = <part> desc_id = <desc_id>}
	endif
endscript

script cas_random_should_include_part 
	if (<locked> = 1)
		if ($cpu_random_character = 0)
			MangleChecksums a = <desc_id> b = <part_name>
			if NOT ArrayContains array = ($cas_current_unlock_list) contains = <mangled_ID>
				return \{false}
			endif
		endif
	endif
	if (<make_unique> = 1)
		if StructureContains structure = $cas_band_used_parts <part_name>
			if NOT (<desc_id> = None)
				if ArrayContains array = ($cas_band_used_parts.<part_name>) contains = <desc_id>
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
	ResolveBodySpecificPartInAppearance part = <part>
	if GetCASAppearancePartDescID part = <part>
		if GetCASPartMaterials part = <part>
			GetArraySize <part_materials>
			i = 0
			begin
			if cas_pick_random_color part = <part> desc_id = <desc_id> genre = <genre>
				SetCASAppearanceMaterial part = <part> material = ((<part_materials> [<i>]).desc_id) value = <Color>
				if (<part> = CAS_Male_Hair)
					set_facial_hair_color part = CAS_Male_Facial_Hair Color = <Color>
				endif
			endif
			i = (<i> + 1)
			repeat <array_size>
		endif
	endif
endscript

script set_facial_hair_color 
	if GetCASPartMaterials part = <part>
		GetArraySize <part_materials>
		i = 0
		begin
		SetCASAppearanceMaterial part = <part> material = ((<part_materials> [<i>]).desc_id) value = <Color>
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script cas_can_pick_random_color 
	if GotParam \{desc_id}
		GetActualCASOptionStruct part = <part> desc_id = <desc_id>
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
		if ChooseRandomPresetByGenre localarray = <rand_colors> genre = <genre>
			if StructureContains structure = <random_preset> Color
				printf 'Set Random color for %s' s = <part> DoNotResolve
				return true Color = (<random_preset>.Color)
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
	if StructureContains structure = <existing_part> CAP
		existing_cap = (<existing_part>.CAP)
	endif
	i = 0
	GetArraySize <cap_merge>
	if (<array_size> > 0)
		begin
		cas_merge_in_cap_foreach existing_cap = <existing_cap> cap_entry = (<cap_merge> [<i>])
		i = (<i> + 1)
		repeat <array_size>
	endif
	GetArraySize <existing_cap>
	if (<array_size> = 0)
		RemoveParameter \{existing_cap}
	endif
	return merge_in = {<existing_part> CAP = <existing_cap>}
endscript

script cas_merge_in_cap_foreach 
	if StructureContains structure = <cap_entry> base_tex
		new_base_tex = (<cap_entry>.base_tex)
		i = 0
		GetArraySize <existing_cap>
		if (<array_size> > 0)
			begin
			if StructureContains structure = (<existing_cap> [<i>]) base_tex
				if ((<existing_cap> [<i>].base_tex) = <new_base_tex>)
					return
				endif
			endif
			i = (<i> + 1)
			repeat <array_size>
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
	if (<array_size> > 0)
		i = 0
		begin
		part = (<avoid_dupe_parts> [<i>])
		ResolveBodySpecificPartInAppearance part = <part>
		if NOT StructureContains structure = <random_preset> <part>
			return \{false}
		endif
		desc_id = (<random_preset>.<part>.desc_id)
		if NOT StructureContains structure = ($cas_dupe_appearance) <part>
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
	if GotParam \{female_array}
		if (<is_female> = 1)
			chosen_array = <female_array>
		else
			chosen_array = <male_array>
		endif
	else
		chosen_array = <array>
	endif
	iLoop = 0
	begin
	if ChooseRandomPresetByGenre GlobalArray = <chosen_array> genre = <genre>
		RemoveComponent \{structure_name = random_preset
			name = random_weight}
		RemoveComponent \{structure_name = random_preset
			name = genre}
		if GotParam \{avoid_dupe_parts}
			if NOT check_dupe_appearance avoid_dupe_parts = <avoid_dupe_parts> random_preset = <random_preset>
				no_dupes = 1
			endif
		else
			no_dupes = 1
		endif
		if (<iLoop> = 10)
			no_dupes = 1
		endif
		if GotParam \{no_dupes}
			if GotParam \{note_random_body_index}
				random_preset = {<random_preset> body_preset_index = <random_preset_index>}
			endif
			Change cas_current_appearance = {($cas_current_appearance) <random_preset>}
			if ResolveBodySpecificPartInAppearance \{part = CAS_Hat}
				if StructureContains structure = <random_preset> <part>
					if GetCASAppearancePartDescID part = <part>
						cas_disq_resolve_hat_hair part = <part> desc_id = <desc_id>
					endif
				endif
			endif
			return
		else
			printf 'Avoided duped parts %d' d = <iLoop>
		endif
	endif
	iLoop = (<iLoop> + 1)
	repeat
endscript

script cas_random_band_name 
	GetRandomArrayElement ($gh_random_band_names)
	return random_name = <element>
endscript

script cas_random_band_logo 
	random_index = 0
	GetArraySize ($cas_preset_bandlogo)
	if (<array_size> > 0)
		GetRandomValue name = random_index integer a = 0 b = (<array_size> - 1)
	endif
	return CAP = ((($cas_preset_bandlogo) [<random_index>]).CAP)
endscript

script cas_generate_new_random_instrument 
	Change cas_dupe_appearance = ($cas_current_appearance)
	cas_grab_random_unlocks
	Randomize
	RequireParams \{[
			type
		]
		all}
	switch <type>
		case guitar
		avoid_dupe_parts = [CAS_Guitar_Body CAS_Guitar_Head]
		case bass
		avoid_dupe_parts = [CAS_Bass_Body CAS_Bass_Head]
		case Drum
		avoid_dupe_parts = [CAS_Drums]
		case vocals
		avoid_dupe_parts = [CAS_Mic_Stand CAS_Mic]
	endswitch
	get_is_female_from_appearance appearance = ($cas_current_appearance)
	cas_merge_in_random_entry {
		($cas_randomized_instruments.<type>)
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
	if (<array_size> > 0)
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
		repeat <array_size>
	endif
	return mask = <array>
endscript

script random_instrument_piece 
	printf 'random_instrument_piece %p' p = <part> DoNotResolve
	if NOT random_instrument_piece_do_inclusions inc = <inc> part = <part>
		cas_set_random_appearance_part part_struct = {part = <part>} genre = any
	endif
	if GetCAPSectionsArray appearance = $cas_current_appearance part = <part>
		num_found = 0
		printf 'Found sections in instrument piece %p' p = <part> DoNotResolve
		GetArraySize <sections>
		if (<array_size> > 0)
			i = 0
			begin
			desc_id = (<sections> [<i>].desc_id)
			if ((<desc_id> = Finishes) || (<desc_id> = Details))
				num_found = (<num_found> + 1)
				if (<num_found> > 2)
					ScriptAssert \{'this only handles two layers, logic needs to be more complex for more'}
				endif
				printf 'Found %d section in instrument piece' d = <desc_id> DoNotResolve
				mask = (<sections> [<i>].mask)
				remove_locked_cas_textures array = <mask>
				if PickFromWeightedArray weighted_array = <mask>
					printf 'Picked index %i' i = <random_index> DoNotResolve
					base_tex = (<sections> [<i>].base_tex)
					chosen_mask = (<mask> [<random_index>])
					printf 'Frontend desc is %s' s = (<chosen_mask>.frontend_desc) DoNotResolve
					if NOT StructureContains structure = (<sections> [<i>]) diffuse
						ScriptAssert \{'Instrument defs all need to be on diffuse'}
					endif
					if NOT StructureContains structure = (<sections> [<i>]) pre_userlayer
						ScriptAssert \{'Instrument defs all need to be pre_userlayer'}
					endif
					name = (<chosen_mask>.pattern)
					material = (<sections> [<i>].material)
					new_cap_entry = 1
					if GotParam \{last_base_tex}
						if (<last_base_tex> = <base_tex>)
							new_cap_entry = 0
							if NOT (<last_material> = <material>)
								ScriptAssert 'material mismatch %a != %b' a = <last_material> b = <material> DoNotResolve
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
						texture = <name>
						flags = <flags>
						Color = <Color>
					}
					if (<new_cap_entry> = 0)
						CAP_array = [
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
						if GotParam \{CAP_array}
							CAP_array = (<CAP_array> + <cap_entry>)
						else
							CAP_array = <cap_entry>
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
	if GotParam \{CAP_array}
		printstruct <CAP_array>
		SetCASAppearanceCAP part = <part> CAP = <CAP_array>
	else
		SetCASAppearanceCAP part = <part>
	endif
	printf \{''}
endscript

script random_instrument_piece_do_inclusions 
	if GotParam \{inc}
		GetCASAppearancePartDescID part = <inc>
		GetActualCASOptionStruct part = <inc> desc_id = <desc_id>
		if GotParam \{inclusion}
			printf 'Inclusion list for %i->%d...' i = <inc> d = <part> DoNotResolve
			GetArraySize <inclusion>
			if (<array_size> > 0)
				i = 0
				begin
				if (<inclusion> [<i>].part = <part>)
					printf \{'Found!'}
					array = (<inclusion> [<i>].valid)
					trim_inclusion_array inclusion_array = <array> part = <part>
					if random_instrument_pick_from_array array = <array>
						printf 'Using %a %b' a = <part> b = <element>
						EditCASAppearance target = SetPart targetParams = {part = <part> desc_id = <element>}
						return \{true}
					endif
				endif
				i = (<i> + 1)
				repeat <array_size>
			endif
			printf 'Inclusion not found, clearing %a' a = <part>
			EditCASAppearance target = ClearPart targetParams = {part = <part>}
			return \{true}
		endif
	endif
	return \{false}
endscript

script random_instrument_pick_from_array 
	GetArraySize <array>
	if (<array_size> = 0)
		return \{false}
	endif
	GetRandomArrayElement <array>
	return true element = <element>
endscript

script random_cas_piece_unlocked 
	GetActualCASOptionStruct part = <part> desc_id = <desc_id>
	if GotParam \{locked}
		MangleChecksums a = <desc_id> b = <part>
		if NOT ArrayContains array = ($cas_current_unlock_list) contains = <mangled_ID>
			return \{false}
		endif
	endif
	return \{true}
endscript

script trim_inclusion_array 
	array = []
	GetArraySize <inclusion_array>
	if (<array_size> > 0)
		i = 0
		begin
		valid_part = (<inclusion_array> [<i>])
		if random_cas_piece_unlocked part = <part> desc_id = <valid_part>
			AddArrayElement array = <array> element = <valid_part>
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	return array = <array>
endscript

script cas_pick_random_colorwheel \{wheel = $guitar_colorwheel}
	GetArraySize <wheel>
	GetRandomValue name = index integer a = 0 b = (<array_size> -1)
	wheel_entry = (<wheel> [<index>])
	GetRandomArrayElement <wheel_entry>
	return Color = <element>
endscript
