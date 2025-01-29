gender_create_script_done = 0
is_in_gender_select = 0

script ui_create_create_character_gender 
	Change \{is_in_gender_select = 1}
	Change \{rich_presence_context = presence_rockstar_creator}
	Change \{gender_create_script_done = 0}
	if GotParam \{from_lobby}
		if getcurrentcasobject
			band_member_start_anims {Name = <cas_object> instrument = None}
		endif
	endif
	cas_get_player
	set_cas_loading_setup \{setup = single}
	cas_set_object_node_pos Player = <Player>
	make_generic_car_menu {
		title = qs(0x021bbbb3)
		vmenu_id = create_create_character_gender_vmenu
		pad_back_script = exit_gender_cleanup
		pad_back_sound = nullscript
		exclusive_device = <state_device>
	}
	resolvebodyspecificpartinappearance \{part = cas_body}
	current_part = 0
	GetArraySize ($cas_body)
	i = 0
	begin
	get_part_current_desc_id \{part = cas_body}
	if GotParam \{current_desc_id}
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
	repeat <array_Size>
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
	LaunchEvent Type = focus target = create_create_character_gender_vmenu data = {child_index = <current_part>}
	add_user_control_helper controller = <state_device> text = qs(0xc18d5e76) button = green z = 100000
	add_user_control_helper controller = <state_device> text = qs(0xaf4d5dd2) button = red z = 100000
	Change \{gender_create_script_done = 1}
	cas_get_is_female Player = ($cas_current_player)
	if (<is_female> = 1)
		Change \{cas_current_new_char_type = female}
	else
		Change \{cas_current_new_char_type = male}
	endif
	if (($autolaunch_cas_instrument != None) || ($autolaunch_cas_new_char != None))
		if ($autolaunch_cas_new_char != None)
			if ($autolaunch_cas_new_char = female)
				Change \{cas_current_new_char_type = female}
				char_type = female
			else
				Change \{cas_current_new_char_type = male}
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
	Change \{is_in_gender_select = 0}
	destroy_generic_menu
endscript

script ui_init_create_character_gender 
	Change \{leaving_genre_select = 0}
	if ($is_in_cas = 0)
		cas_load_and_setup_resources \{async = 0}
	endif
	anim_paks_set_state \{state = FrontEnd
		async = 0}
	if GotParam \{state_device}
		ui_event event = menu_change_device force_event = true data = {state_device = <state_device>}
	endif
	cas_get_player
	cas_queue_new_character_profile id = ($cas_current_profile) Player = <Player> savegame = ($cas_current_savegame)
	characterprofilegetstruct Name = ($cas_current_profile) savegame = ($cas_current_savegame)
	setcasappearance appearance = (<profile_struct>.appearance)
endscript

script ui_deinit_create_character_gender 
	KillSpawnedScript \{Name = random_character_throttled_spawned}
	if NOT (($invite_controller) = -1)
		exit_discard_changes
	endif
	cas_free_resources
	Change \{cas_current_savegame = -1}
	Change \{cas_current_profile = None}
endscript

script exit_gender_cleanup 
	KillSpawnedScript \{Name = random_character_throttled_spawned}
	destroy_generic_menu
	if is_ui_event_running
		return \{FALSE}
	endif
	cas_destroy_all_characters
	cas_free_resources
	exit_discard_changes
	Change \{cas_current_savegame = -1}
	Change \{cas_current_profile = None}
endscript

script cas_gender_focus_change 
	if ($gender_create_script_done = 0)
		return
	endif
	if StructureContains \{structure = $cas_current_appearance
			cas_full_body}
		if ((($cas_current_appearance.cas_full_body).desc_id) = avatar)
			existing_avatar = 1
		endif
	endif
	if GotParam \{avatar_type}
		if GotParam \{existing_avatar}
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
		Change cas_current_new_char_type = <avatar_type>
	else
		if NOT GotParam \{existing_avatar}
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
			Change \{cas_current_new_char_type = female}
		else
			Change \{cas_current_new_char_type = male}
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
	if ScriptIsRunning \{random_character_throttled_spawned}
		do_wait = 1
	endif
	KillSpawnedScript \{Name = random_character_throttled_spawned}
	SpawnScriptNow random_character_throttled_spawned params = <...>
endscript

script random_character_throttled_spawned 
	if ($leaving_genre_select = 0)
		if GotParam \{do_wait}
			Wait \{5
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
		cas_queue_add_request appearance = ($cas_current_appearance) Player = ($cas_current_player) instrument = None <cas_flag>
	else
		if (<char_type> = female)
			wanted_is_female = 1
		else
			wanted_is_female = 0
		endif
		cas_get_is_female Player = ($cas_current_player)
		if ((GotParam genre_select) && (<wanted_is_female> = <is_female>))
			cas_set_random_appearance is_female = <is_female> genre = <genre> new_car_character random_instruments
			if ($leaving_genre_select = 1)
				return
			endif
			cas_queue_add_request appearance = ($cas_current_appearance) Player = ($cas_current_player) instrument = None in_cas
		else
			cas_change_current_character_gender is_female = <wanted_is_female>
		endif
	endif
	if ($leaving_genre_select = 1)
		return
	endif
	cas_queue_wait
	if GotParam \{anim}
		if getcurrentcasobject
			Band_PlayAnim Name = <cas_object> anim = <anim> no_wait
		endif
	endif
	Wait \{5
		gameframes}
endscript
