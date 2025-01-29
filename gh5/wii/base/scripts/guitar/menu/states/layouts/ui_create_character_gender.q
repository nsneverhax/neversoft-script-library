gender_create_script_done = 0
is_in_gender_select = 0
is_create_character_gender_on_ui_stack = 0

script ui_create_create_character_gender 
	printf \{qs(0x891fc60a)}
	Change \{is_in_gender_select = 1}
	Change \{rich_presence_context = presence_rockstar_creator}
	Change \{gender_create_script_done = 0}
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
	SetScreenElementProps \{id = create_create_character_gender_vmenu
		event_handlers = [
			{
				pad_option2
				cas_gender_rerandomize
			}
		]
		replace_handlers}
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
		printf qs(0xb5f99cb9) s = <text> d = (($cas_body) [<i>].desc_id)
		add_car_menu_text_item {
			text = <text>
			choose_state = uistate_create_character_genre
			additional_focus_script = cas_gender_focus_change
			additional_focus_params = {part = cas_body new_desc_id = (($cas_body) [<i>].desc_id) price = (($cas_body) [<i>].price)}
		}
	endif
	i = (<i> + 1)
	repeat <array_Size>
	menu_finish no_rotate_zoom_text controller = <state_device>
	LaunchEvent Type = focus target = create_create_character_gender_vmenu data = {child_index = <current_part>}
	add_user_control_helper controller = <state_device> text = qs(0xc18d5e76) button = green z = 100000
	add_user_control_helper controller = <state_device> text = qs(0xaf4d5dd2) button = red z = 100000
	add_user_control_helper controller = <state_device> text = qs(0x9093ca74) button = yellow z = 100000
	Change \{gender_create_script_done = 1}
	cas_get_is_female Player = ($cas_current_player)
	if (<is_female> = 1)
		printf \{qs(0xf7e90144)}
		Change \{cas_current_new_char_type = female}
	else
		printf \{qs(0x7b5cee91)}
		Change \{cas_current_new_char_type = male}
	endif
	if (($autolaunch_cas_instrument != None) || ($autolaunch_cas_new_char != None))
		printf \{qs(0x5ef88107)}
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
		printf \{qs(0xdc6ce826)}
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
	printf \{qs(0x6385a5d1)}
	Change \{is_create_character_gender_on_ui_stack = 1}
	hack_toggleforceflarerendering
	if GotParam \{from_band_lobby}
		car_camera_position_hack \{base_name = 'character_selection'}
	endif
	Change \{leaving_genre_select = 0}
	if ($is_in_cas = 0)
		printf \{qs(0xba68bdba)}
		cas_load_and_setup_resources \{async = 0}
	endif
	anim_paks_set_state \{state = FrontEnd
		async = 0}
	if GotParam \{state_device}
		printf \{qs(0x232b5ae2)}
		ui_event event = menu_change_device force_event = true data = {state_device = <state_device>}
	endif
	anim_paks_set_state \{state = FrontEnd
		async = 1}
	cas_get_player
	cas_queue_new_character_profile id = ($cas_current_profile) Player = <Player> savegame = ($cas_current_savegame)
	characterprofilegetstruct Name = ($cas_current_profile) savegame = ($cas_current_savegame)
	printf \{qs(0x49cd505b)}
	printstruct <...>
	setcasappearance appearance = (<profile_struct>.appearance)
endscript

script ui_deinit_create_character_gender 
	Change \{is_create_character_gender_on_ui_stack = 0}
	hack_toggleforceflarerendering
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
	printf \{qs(0xa1e7bed4)}
	if ($gender_create_script_done = 0)
		printf \{qs(0x007fdbde)}
		return
	endif
	get_is_female_from_appearance \{appearance = $cas_current_appearance}
	if (<new_desc_id> = gh4_car_female)
		printf \{qs(0xf7994cc3)}
		if (<is_female> = 1)
			printf \{qs(0x4eda8cc1)}
			return
		endif
	else
		printf \{qs(0x07f3dd40)}
		if (<is_female> = 0)
			printf \{qs(0x6ec05b55)}
			return
		endif
	endif
	if (<new_desc_id> = gh4_car_female)
		printf \{qs(0x1201b232)}
		Change \{cas_current_new_char_type = female}
	else
		printf \{qs(0x397f1146)}
		Change \{cas_current_new_char_type = male}
	endif
	generate_random_genre
	random_character_throttled char_type = ($cas_current_new_char_type) genre = <genre>
endscript

script cas_gender_rerandomize 
	printf \{qs(0x9875a6a0)}
	generic_menu_pad_choose_sound
	generate_random_genre
	random_character_throttled char_type = ($cas_current_new_char_type) genre = <genre> genre_select
endscript

script random_character_throttled 
	printf \{qs(0x12e6bcac)}
	if ScriptIsRunning \{random_character_throttled_spawned}
		do_wait = 1
	endif
	printf \{qs(0xeaaf0b07)}
	KillSpawnedScript \{Name = random_character_throttled_spawned}
	SpawnScriptNow random_character_throttled_spawned params = <...>
endscript

script random_character_throttled_spawned 
	printf \{qs(0x5bd20d68)}
	if ($leaving_genre_select = 0)
		if GotParam \{do_wait}
			Wait \{5
				gameframes}
		endif
	endif
	if ((<char_type> = avatar_male) || (<char_type> = avatar_female))
		printf \{qs(0x2377e867)}
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
