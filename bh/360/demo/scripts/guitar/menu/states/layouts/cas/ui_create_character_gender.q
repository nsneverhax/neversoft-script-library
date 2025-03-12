gender_create_script_done = 0
is_in_gender_select = 0

script ui_create_create_character_gender 
	change \{is_in_gender_select = 1}
	change \{rich_presence_context = presence_rockstar_creator}
	change \{gender_create_script_done = 0}
	if gotparam \{from_lobby}
		if getcurrentcasobject
			band_member_start_anims {name = <cas_object> instrument = none}
		endif
	endif
	cas_get_player
	set_cas_loading_setup \{setup = single}
	cas_set_object_node_pos player = <player>
	make_generic_car_menu {
		title = qs(0x021bbbb3)
		vmenu_id = create_create_character_gender_vmenu
		pad_back_script = exit_gender_cleanup
		pad_back_sound = generic_menu_pad_back_sound
		exclusive_device = <state_device>
	}
	resolvebodyspecificpartinappearance \{part = cas_body}
	current_part = 0
	getarraysize ($cas_body)
	i = 0
	begin
	get_part_current_desc_id \{part = cas_body}
	if gotparam \{current_desc_id}
		if (((($cas_body) [<i>]).desc_id) = <current_desc_id>)
			current_part = <i>
		endif
	endif
	if cas_item_is_visible part = cas_body desc_id = ((($cas_body) [<i>]).desc_id)
		text = ((($cas_body) [<i>]).frontend_desc)
		if isavatarsysteminitialized
			text = ((($cas_body) [<i>]).frontend_desc_with_avatar)
		endif
		add_car_menu_text_item {
			text = <text>
			choose_state = uistate_create_character_genre
			additional_focus_script = cas_gender_focus_change
			additional_focus_params = {part = cas_body new_desc_id = (($cas_body) [<i>].desc_id) price = (($cas_body) [<i>].price)}
		}
	endif
	i = (<i> + 1)
	repeat <array_size>
	if isavatarsysteminitialized
		add_car_menu_text_item \{text = qs(0xf4054c17)
			pad_choose_script = cas_advance_from_gender_genre_to_customize
			additional_focus_script = cas_gender_focus_change
			additional_focus_params = {
				avatar_type = avatar_female
			}}
		add_car_menu_text_item \{text = qs(0xc63bf89a)
			pad_choose_script = cas_advance_from_gender_genre_to_customize
			additional_focus_script = cas_gender_focus_change
			additional_focus_params = {
				avatar_type = avatar_male
			}}
	endif
	menu_finish no_rotate_zoom_text controller = <state_device>
	launchevent type = focus target = create_create_character_gender_vmenu data = {child_index = <current_part>}
	add_user_control_helper controller = <state_device> text = qs(0xc18d5e76) button = green z = 100000
	add_user_control_helper controller = <state_device> text = qs(0xaf4d5dd2) button = red z = 100000
	change \{gender_create_script_done = 1}
	cas_get_is_female player = ($cas_current_player)
	if (<is_female> = 1)
		change \{cas_current_new_char_type = female}
	else
		change \{cas_current_new_char_type = male}
	endif
	if (($autolaunch_cas_instrument != none) || ($autolaunch_cas_new_char != none))
		if ($autolaunch_cas_new_char != none)
			if ($autolaunch_cas_new_char = female)
				change \{cas_current_new_char_type = female}
				char_type = female
			else
				change \{cas_current_new_char_type = male}
				char_type = male
			endif
			generate_random_genre
			random_character_throttled char_type = <char_type> genre = <genre>
		endif
		spawnscriptdelayed \{frames = 20
			generic_event_choose
			params = {
				state = uistate_create_character_genre
			}}
	endif
endscript

script ui_destroy_create_character_gender 
	change \{is_in_gender_select = 0}
	destroy_generic_menu
endscript

script ui_init_create_character_gender 
	change \{leaving_genre_select = 0}
	if ($is_in_cas = 0)
		cas_load_and_setup_resources \{async = 0}
	endif
	anim_paks_set_state \{state = frontend
		async = 0}
	if gotparam \{state_device}
		ui_event event = menu_change_device force_event = true data = {state_device = <state_device>}
	endif
	cas_get_player
	cas_queue_new_character_profile id = ($cas_current_profile) player = <player> savegame = ($cas_current_savegame)
	characterprofilegetstruct name = ($cas_current_profile) savegame = ($cas_current_savegame)
	setcasappearance appearance = (<profile_struct>.appearance)
endscript

script ui_deinit_create_character_gender 
	killspawnedscript \{name = random_character_throttled_spawned}
	if NOT (($invite_controller) = -1)
		exit_discard_changes
	endif
	cas_free_resources
	change \{cas_current_savegame = -1}
	change \{cas_current_profile = none}
endscript

script exit_gender_cleanup 
	killspawnedscript \{name = random_character_throttled_spawned}
	destroy_generic_menu
	if is_ui_event_running
		return \{false}
	endif
	cas_destroy_all_characters
	cas_free_resources
	exit_discard_changes
	change \{cas_current_savegame = -1}
	change \{cas_current_profile = none}
endscript

script cas_gender_focus_change 
	if ($gender_create_script_done = 0)
		return
	endif
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
	random_character_throttled char_type = ($cas_current_new_char_type) genre = <genre>
endscript

script cas_gender_rerandomize 
	generic_menu_pad_choose_sound
	generate_random_genre
	random_character_throttled char_type = ($cas_current_new_char_type) genre = <genre>
endscript

script random_character_throttled 
	if scriptisrunning \{random_character_throttled_spawned}
		do_wait = 1
	endif
	killspawnedscript \{name = random_character_throttled_spawned}
	spawnscriptnow random_character_throttled_spawned params = <...>
endscript

script random_character_throttled_spawned 
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
		cas_queue_add_request appearance = ($cas_current_appearance) player = ($cas_current_player) instrument = none <cas_flag>
	else
		if (<char_type> = female)
			wanted_is_female = 1
		else
			wanted_is_female = 0
		endif
		cas_get_is_female player = ($cas_current_player)
		if ((gotparam genre_select) && (<wanted_is_female> = <is_female>))
			cas_set_random_appearance is_female = <is_female> genre = <genre> new_car_character random_instruments
			if ($leaving_genre_select = 1)
				return
			endif
			cas_queue_add_request appearance = ($cas_current_appearance) player = ($cas_current_player) instrument = none in_cas
		else
			cas_change_current_character_gender is_female = <wanted_is_female>
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
