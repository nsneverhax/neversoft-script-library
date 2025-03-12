
script cas_gender_focus_change \{instrument = $cas_default_instrument}
	if structurecontains \{structure = $cas_current_appearance
			cas_full_body}
		if ((($cas_current_appearance.cas_full_body).desc_id) = avatar)
			existing_avatar = 1
		endif
	endif
	if gotparam \{avatar_type}
		if gotparam \{existing_avatar}
			if isavatarfemale avatar_meta_data = (($cas_current_appearance.cas_full_body).avatar_meta_data)
				if (<avatar_type> = avatar_female)
					return
				endif
			else
				if (<avatar_type> = avatar_male)
					return
				endif
			endif
		endif
		change cas_current_new_char_type = <avatar_type>
	else
		if NOT gotparam \{existing_avatar}
			get_is_female_from_appearance \{appearance = $cas_current_appearance}
			if (<new_desc_id> = gh4_car_female)
				if (<is_female> = 1)
					return
				endif
			else
				if (<is_female> = 0)
					return
				endif
			endif
		endif
		if (<new_desc_id> = gh4_car_female)
			change \{cas_current_new_char_type = female}
		else
			change \{cas_current_new_char_type = male}
		endif
	endif
	generate_random_genre
	random_character_throttled char_type = ($cas_current_new_char_type) instrument = <instrument> genre = <genre>
endscript

script random_character_throttled 
	if scriptisrunning \{random_character_throttled_spawned}
		do_wait = 1
	endif
	killspawnedscript \{name = random_character_throttled_spawned}
	spawnscriptnow random_character_throttled_spawned params = <...>
endscript

script random_character_throttled_spawned \{instrument = none}
	if ($leaving_genre_select = 0)
		if gotparam \{do_wait}
			wait \{5
				gameframes}
		endif
	endif
	if ((<char_type> = avatar_male) || (<char_type> = avatar_female))
		if (<char_type> = avatar_female)
			wanted_is_female = 1
		else
			wanted_is_female = 0
		endif
		generate_random_name is_female = <wanted_is_female>
		modify_custom_profile_fullname id = ($cas_current_profile) fullname = <random_name> savegame = ($cas_current_savegame)
		generate_random_avatar is_female = <wanted_is_female>
		if ($leaving_genre_select = 1)
			return
		endif
		cas_queue_add_request appearance = ($cas_current_appearance) player = ($cas_current_player) instrument = <instrument> <cas_flag>
	else
		if (<char_type> = female)
			wanted_is_female = 1
		else
			wanted_is_female = 0
		endif
		cas_get_is_female player = ($cas_current_player)
		if ((gotparam genre_select) && (<wanted_is_female> = <is_female>))
			cas_set_random_appearance savegame = ($cas_current_savegame) is_female = <is_female> genre = <genre> new_car_character random_instruments
			if ($leaving_genre_select = 1)
				return
			endif
			cas_queue_add_request appearance = ($cas_current_appearance) player = ($cas_current_player) instrument = <instrument> in_cas
		else
			cas_change_current_character_gender instrument = <instrument> is_female = <wanted_is_female>
		endif
	endif
	if ($leaving_genre_select = 1)
		return
	endif
	cas_queue_wait
	if gotparam \{anim}
		if getcurrentcasobject
			band_playanim name = <cas_object> anim = <anim> no_wait
		endif
	endif
	wait \{5
		gameframes}
endscript
