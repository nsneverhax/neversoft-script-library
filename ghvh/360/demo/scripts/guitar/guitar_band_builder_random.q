band_builder_random_appearances = [
]
band_builder_random_preset_used = [
	none
	none
	none
	none
]
band_builder_no_genre_swaps = 0

script band_builder_is_random 
	switch (<character_id>)
		case randomcharacter
		case randommale
		case randomfemale
		case randomappearance0
		case randomappearance1
		case randomappearance2
		case randomappearance3
		return \{true}
		default
		return \{false}
	endswitch
endscript

script band_builder_is_finalized_random 
	switch (<character_id>)
		case randomappearance0
		case randomappearance1
		case randomappearance2
		case randomappearance3
		return \{true}
		default
		return \{false}
	endswitch
endscript

script band_builder_is_finalized_character 
	if band_builder_is_random character_id = <character_id>
		if NOT band_builder_is_finalized_random character_id = <character_id>
			return \{false}
		endif
	endif
	return \{true}
endscript

script band_builder_fixup_random_human_player_names 
	i = 0
	getarraysize \{$band_builder_current_setup}
	if (<array_size> > 0)
		begin
		character_id = ($band_builder_current_setup [<i>].character_id)
		if band_builder_is_finalized_random character_id = <character_id>
			if band_builder_find_random_human_character_id character_id = <character_id>
				random_struct = ($band_builder_random_appearances [<index>])
				random_struct = {<random_struct> name = ($band_builder_current_setup [<i>].name)}
				setarrayelement arrayname = band_builder_random_appearances globalarray index = <index> newvalue = <random_struct>
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script band_builder_find_random_human_character_id 
	i = 0
	getarraysize \{$band_builder_random_appearances}
	if (<array_size> > 0)
		begin
		if (<character_id> = ($band_builder_random_appearances [<i>].character_id))
			if structurecontains structure = ($band_builder_random_appearances [<i>]) player_status
				return true index = <i>
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	return \{false}
endscript

script band_builder_fill_in_random_characters 
	if NOT gotparam \{genre}
		if NOT ($band_builder_current_gig_genre = none)
			genre = ($band_builder_current_gig_genre)
			printf 'Using gig genre %g' g = <genre>
		else
			get_song_struct song = ($current_song)
			if structurecontains structure = <song_struct> genre
				genre = (<song_struct>.genre)
				printf 'Using song genre %g' g = <genre>
			else
				generate_random_genre
				printf 'Using random genre %g' g = <genre>
			endif
		endif
	endif
	verify_genre genre = <genre>
	i = 0
	getarraysize \{$band_builder_current_setup}
	if (<array_size> > 0)
		begin
		character_id = ((($band_builder_current_setup) [<i>]).character_id)
		name = ((($band_builder_current_setup) [<i>]).name)
		part = ((($band_builder_current_setup) [<i>]).part)
		real_part = ((($band_builder_current_setup) [<i>]).part)
		if band_builder_is_random character_id = <character_id>
			if NOT band_builder_is_finalized_random character_id = <character_id>
				removeparameter \{force_random_index}
				if NOT band_builder_find_previous_random_appearance name = <name> character_id = <character_id> part = <part> genre = <genre>
					band_builder_new_random_character {
						name = <name>
						character_id = <character_id>
						part = <part>
						real_part = <real_part>
						genre = <genre>
						force_random_index = <force_random_index>
						cpu_character
					}
				endif
				old_setup = ($band_builder_current_setup [<i>])
				setarrayelement arrayname = band_builder_current_setup globalarray index = <i> newvalue = {
					<old_setup>
					old_character_id = (<old_setup>.character_id)
					character_id = <new_character_id>
				}
				if structurecontains structure = <old_setup> player_status
					change structurename = (<old_setup>.player_status) character_id = <new_character_id>
				endif
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script band_builder_new_random_character 
	if (<character_id> = randomcharacter)
		if gotparam \{cpu_character}
			band_builder_get_num_each_gender
			if (<females> >= 2)
				character_id = randommale
			else
				if (<males> >= 3)
					character_id = randomfemale
				else
					character_id = Random (@ randomfemale @ randommale )
				endif
			endif
		else
			character_id = Random (@ randomfemale @ randommale )
		endif
	endif
	if gotparam \{player_status}
		make_unique_band = random_appearances
	else
		make_unique_band = band_builder
	endif
	if gotparam \{given_appearance}
		change cas_current_appearance = <given_appearance>
	else
		if (<character_id> = randommale)
			change cas_current_appearance = ($default_custom_musician_profile_male.appearance)
		else
			change cas_current_appearance = ($default_custom_musician_profile_female.appearance)
		endif
		cas_set_random_appearance genre = <genre> random_instruments cpu_band make_unique_band = <make_unique_band>
	endif
	getarraysize \{$band_builder_random_appearances}
	if NOT gotparam \{force_random_index}
		force_random_index = <array_size>
	endif
	formattext checksumname = new_character_id 'RandomAppearance%d' d = <force_random_index>
	random_entry = {
		name = <name>
		part = <part>
		genre = <genre>
		character_id = <new_character_id>
		original_character_id = <character_id>
		appearance = ($cas_current_appearance)
		player_status = <player_status>
		cas_name = <cas_name>
	}
	change \{cas_current_appearance = {
		}}
	if (<force_random_index> = <array_size>)
		addarrayelement array = $band_builder_random_appearances element = (<random_entry>)
		change band_builder_random_appearances = <array>
	else
		setarrayelement arrayname = band_builder_random_appearances globalarray index = <force_random_index> newvalue = <random_entry>
	endif
	return new_character_id = <new_character_id>
endscript

script band_builder_find_previous_random_appearance 
	i = 0
	getarraysize \{$band_builder_random_appearances}
	if (<array_size> > 0)
		begin
		if gotparam \{frontend_character}
			if structurecontains structure = ($band_builder_random_appearances [<i>]) cas_name
				if (($band_builder_random_appearances [<i>]).cas_name = <name>)
					return false force_random_index = <i>
				endif
			endif
		else
			if (($band_builder_random_appearances [<i>]).name = <name>)
				if (($band_builder_random_appearances [<i>]).part = vocals)
					if NOT (($band_builder_random_appearances [<i>]).original_character_id = <character_id>)
						return false force_random_index = <i>
					endif
				endif
				if NOT ui_event_exists_in_stack \{name = 'jam'}
					if ($band_builder_no_genre_swaps = 0)
						if NOT (($band_builder_random_appearances [<i>]).genre = <genre>)
							return false force_random_index = <i>
						endif
					endif
				endif
				formattext checksumname = new_character_id 'RandomAppearance%d' d = <i>
				return true new_character_id = <new_character_id>
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
		if (<array_size> = 4)
			array = []
			i = 0
			getarraysize \{$band_builder_current_setup}
			if (<array_size> > 0)
				begin
				band_char_id = ($band_builder_current_setup [<i>].character_id)
				if band_builder_is_finalized_character character_id = <band_char_id>
					addarrayelement array = <array> element = <band_char_id>
				endif
				i = (<i> + 1)
				repeat <array_size>
			endif
			i = 0
			getarraysize \{$band_builder_random_appearances}
			begin
			random_char_id = ($band_builder_random_appearances [<i>].character_id)
			if NOT arraycontains array = <array> contains = <random_char_id>
				remove_index = <i>
				break
			endif
			i = (<i> + 1)
			repeat <array_size>
			if NOT gotparam \{remove_index}
				printstruct \{$band_builder_current_setup}
				printstruct \{$band_builder_random_appearances}
				scriptassert \{'no remove index found!'}
			endif
			return false force_random_index = <remove_index>
		endif
	endif
	return \{false}
endscript

script band_builder_get_random_appearance 
	i = 0
	getarraysize \{$band_builder_random_appearances}
	if (<array_size> > 0)
		begin
		if ((($band_builder_random_appearances [<i>]).character_id) = <character_id>)
			return true appearance = (($band_builder_random_appearances [<i>]).appearance)
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	return \{false}
endscript

script band_builder_generate_frontend_random_appearance \{character_id = randomcharacter}
	requireparams \{[
			player
			genre
			character_id
		]}
	formattext checksumname = name 'cas_player%d' d = <player>
	formattext checksumname = player_status 'player%d_status' d = <player>
	if band_builder_find_previous_random_appearance name = <name> part = guitarist genre = <genre> frontend_character
		scriptassert \{'Should never find a frontend random appearance'}
	else
		band_builder_new_random_character {
			name = <name>
			cas_name = <name>
			character_id = <character_id>
			part = guitarist
			genre = <genre>
			force_random_index = <force_random_index>
			player_status = <player_status>
		}
		change structurename = <player_status> character_id = <new_character_id>
	endif
endscript

script band_builder_get_used_parts 
	used_parts = {}
	if (<make_unique_band> = random_appearances)
		getarraysize ($band_builder_random_appearances)
		if (<array_size> > 0)
			i = 0
			begin
			band_builder_get_used_parts_in_appearance appearance = (($band_builder_random_appearances [<i>]).appearance) used_parts = <used_parts>
			i = (<i> + 1)
			repeat <array_size>
		endif
	else
		getarraysize \{$band_builder_current_setup}
		if (<array_size> > 0)
			i = 0
			begin
			character_id = (($band_builder_current_setup [<i>]).character_id)
			if band_builder_is_finalized_character character_id = <character_id>
				savegame = (($band_builder_current_setup [<i>]).savegame)
				get_musician_profile_struct_by_id id = <character_id> savegame = <savegame>
				band_builder_get_used_parts_in_appearance appearance = (<profile_struct>.appearance) used_parts = <used_parts>
			endif
			i = (<i> + 1)
			repeat <array_size>
		endif
	endif
	return used_parts = <used_parts>
endscript

script band_builder_get_used_parts_in_appearance 
	getarraysize \{$master_editable_list}
	i = 0
	begin
	part_name = ((($master_editable_list) [<i>]).part)
	if structurecontains structure = <appearance> <part_name>
		desc_id = (<appearance>.<part_name>.desc_id)
		array = []
		if structurecontains structure = <used_parts> <part_name>
			array = (<used_parts>.<part_name>)
		endif
		if NOT arraycontains array = <array> contains = <desc_id>
			addarrayelement array = <array> element = <desc_id>
		endif
		updatestructelement struct = <used_parts> element = <part_name> value = <array>
		used_parts = <newstruct>
	endif
	i = (<i> + 1)
	repeat <array_size>
	return used_parts = <used_parts>
endscript

script cas_reset_random_human_picking 
	change \{band_builder_random_preset_used = [
			none
			none
			none
			none
		]}
endscript

script cas_get_random_car 
	requireparams \{[
			savegame
		]
		all}
	formattext textname = savegametext '%s' s = <savegame>
	globaltag_getarraysize savegame = <savegame> array_name = custom_profiles
	if (<array_size> > 0)
		begin
		getrandomvalue name = index integer a = 0 b = (<array_size> - 1)
		globaltag_getarrayelement savegame = <savegame> array_name = custom_profiles index = <index>
		extendcrc (<element>.name) <savegametext> out = array_char_id
		if NOT arraycontains array = $band_builder_random_preset_used contains = <array_char_id>
			if gotparam \{controller}
				if (<controller> < 4)
					setarrayelement arrayname = band_builder_random_preset_used globalarray index = <controller> newvalue = <array_char_id>
				endif
			endif
			return true character_id = (<element>.name)
		endif
		repeat 20
	endif
	return \{false}
endscript

script cas_get_random_preset_character 
	requireparams \{[
			savegame
			part
		]
		all}
	globaltag_getarraysize savegame = <savegame> array_name = custom_profiles
	num_cars = <array_size>
	getarraysize \{$preset_musician_profiles_modifiable}
	num_mods = (<array_size>)
	getarraysize \{$preset_musician_profiles_locked}
	num_locked = (<array_size>)
	character_id = axel
	begin
	getrandomvalue name = index integer a = <num_cars> b = (<num_cars> + <num_mods> + <num_locked> - 1)
	get_musician_profile_struct_by_index index = <index> savegame = <savegame>
	if display_character_logic savegame = <savegame> profile_struct = <profile_struct> part = <part>
		character_id = (<profile_struct>.name)
		if is_profile_purchased id = <character_id> savegame = <savegame>
			if NOT arraycontains array = $band_builder_random_preset_used contains = <character_id>
				break
			endif
		endif
	endif
	repeat 100
	if gotparam \{controller}
		if (<controller> < 4)
			setarrayelement arrayname = band_builder_random_preset_used globalarray index = <controller> newvalue = <character_id>
		endif
	endif
	return character_id = <character_id>
endscript

script force_set_random_appearance 
	requireparams \{[
			player
			appearance
		]}
	character_id = randomcharacter
	formattext checksumname = name 'cas_player%d' d = <player>
	formattext checksumname = player_status 'player%d_status' d = <player>
	if band_builder_find_previous_random_appearance name = <name> part = guitarist frontend_character
		scriptassert \{'Should never find a frontend random appearance'}
	else
		band_builder_new_random_character {
			name = <name>
			cas_name = <name>
			character_id = <character_id>
			part = guitarist
			genre = humanrandomguy
			force_random_index = <force_random_index>
			player_status = <player_status>
			given_appearance = <appearance>
		}
		change structurename = <player_status> character_id = <new_character_id>
	endif
	return new_character_id = <new_character_id>
endscript
