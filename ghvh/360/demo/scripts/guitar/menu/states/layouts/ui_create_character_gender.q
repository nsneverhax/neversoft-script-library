gender_create_script_done = 0

script ui_create_create_character_gender 
	change \{gender_create_script_done = 0}
	change \{achievements_creating_character = 1}
	killskatercamanim \{all}
	cas_set_object_node_pos player = ($cas_current_player) node = z_soundcheck_trg_waypoint_car_start
	make_generic_menu \{title = qs(0xa0e6ab60)
		vmenu_id = create_create_character_gender_vmenu
		pad_back_script = exit_gender_cleanup}
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
	if cas_item_is_visible part = cas_body part_index = <i>
		add_generic_menu_text_item {
			text = ((($cas_body) [<i>]).frontend_desc)
			choose_state = uistate_create_character_genre
			additional_focus_script = cas_gender_focus_change
			additional_focus_params = {part = cas_body new_desc_id = (($cas_body) [<i>].desc_id) price = (($cas_body) [<i>].price)}
		}
	endif
	i = (<i> + 1)
	repeat <array_size>
	menu_finish \{no_rotate_zoom_text}
	launchevent type = focus target = create_create_character_gender_vmenu data = {child_index = <current_part>}
	change \{gender_create_script_done = 1}
	cas_get_is_female player = ($cas_current_player)
	change cas_current_is_female = <is_female>
	if ($autolaunch_cas_artist = 1)
		z_objviewer_trg_01 :hide
	endif
endscript

script ui_destroy_create_character_gender 
	destroy_generic_menu
endscript

script ui_deinit_create_character_gender 
	killspawnedscript \{name = random_character_throttled_spawned}
	if NOT (($invite_controller) = -1)
		exit_discard_changes \{no_changes}
		change \{cas_current_savegame = -1}
		change \{cas_current_profile = none}
	endif
endscript

script exit_gender_cleanup 
	killspawnedscript \{name = random_character_throttled_spawned}
	destroy_generic_menu
	if is_ui_event_running
		return \{false}
	endif
	if ($cas_heap_state = in_game)
		scriptassert \{'Should in in_cas heap state!'}
	endif
	cas_free_resources
	exit_discard_changes
	change \{cas_current_savegame = -1}
	change \{cas_current_profile = none}
endscript

script cas_gender_focus_change 
	if ($gender_create_script_done = 0)
		return
	endif
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
	if (<new_desc_id> = gh4_car_female)
		change \{cas_current_is_female = 1}
	else
		change \{cas_current_is_female = 0}
	endif
	generate_random_genre
	random_character_throttled is_female = ($cas_current_is_female) genre = <genre>
endscript

script cas_gender_rerandomize 
	generate_random_genre
	random_character_throttled is_female = ($cas_current_is_female) genre = <genre>
endscript

script random_character_throttled 
	if scriptisrunning \{random_character_throttled_spawned}
		do_wait = 1
	endif
	killspawnedscript \{name = random_character_throttled_spawned}
	spawnscriptnow random_character_throttled_spawned params = <...>
endscript

script random_character_throttled_spawned 
	if gotparam \{do_wait}
		wait \{5
			gameframes}
	endif
	wanted_is_female = <is_female>
	if gotparam \{genre_select}
		cas_flag = {in_cas}
	endif
	cas_get_is_female player = ($cas_current_player)
	if (<wanted_is_female> = <is_female>)
		generate_random_appearance is_female = <is_female> genre = <genre> new_car_character
		cas_queue_add_request appearance = ($cas_current_appearance) player = ($cas_current_player) <cas_flag>
	else
		cas_change_current_character_gender is_female = <wanted_is_female>
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
