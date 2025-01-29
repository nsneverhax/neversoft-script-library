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
	printf 'Generating random appearance - Seed=%s genre=%g' s = <rand_seed> g = <genre>
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
	if StructureContains structure = <chosen_setup> <part>
		<part_struct> = (<chosen_setup>.<part>)
		cas_add_item_to_appearance part = <part> desc_id = (<part_struct>.desc_id) no_rebuild
		setcasappearancepartinstance part = <part> part_instance = <part_struct>
	endif
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
