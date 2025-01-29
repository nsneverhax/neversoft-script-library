gender_create_script_done = 0

script ui_create_create_character_gender 
	0x7d8b2005
	rebuildcurrentcasmodel
	Change \{gender_create_script_done = 0}
	Change \{achievements_creating_character = 1}
	KillSkaterCamAnim \{all}
	make_generic_menu \{title = qs(0xa0e6ab60)
		vmenu_id = create_create_character_gender_vmenu
		pad_back_script = exit_gender_cleanup}
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
	if cas_item_is_visible part = cas_body part_index = <i>
		add_generic_menu_text_item {
			text = ((($cas_body) [<i>]).frontend_desc)
			choose_state = uistate_create_character_genre
			additional_focus_script = cas_gender_focus_change
			additional_focus_params = {part = cas_body new_desc_id = (($cas_body) [<i>].desc_id) price = (($cas_body) [<i>].price)}
		}
	endif
	i = (<i> + 1)
	repeat <array_Size>
	menu_finish \{no_rotate_zoom_text}
	LaunchEvent Type = focus target = create_create_character_gender_vmenu data = {child_index = <current_part>}
	Change \{gender_create_script_done = 1}
	cas_get_is_female Player = ($cas_current_player)
	Change cas_current_is_female = <is_female>
	if ($autolaunch_cas_artist = 1)
		z_objviewer_trg_01 :Hide
	endif
	cas_set_object_node_pos Player = ($cas_current_player) node = z_soundcheck_trg_waypoint_car_start
endscript

script ui_destroy_create_character_gender 
	destroy_generic_menu
endscript

script ui_deinit_create_character_gender 
	KillSpawnedScript \{Name = random_character_throttled_spawned}
	if NOT (($invite_controller) = -1)
		exit_discard_changes
		Change \{cas_current_savegame = -1}
		Change \{cas_current_profile = None}
	endif
endscript

script exit_gender_cleanup 
	KillSpawnedScript \{Name = random_character_throttled_spawned}
	destroy_generic_menu
	if is_ui_event_running
		return \{FALSE}
	endif
	create_loading_screen \{spawn}
	if ($cas_heap_state = in_game)

	endif
	cas_free_resources
	exit_discard_changes
	Change \{cas_current_savegame = -1}
	Change \{cas_current_profile = None}
endscript

script cas_gender_focus_change 
	SpawnScriptNow 0xb38c95de params = <...>
endscript

script 0xb38c95de 
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	Wait \{0.5
		Seconds}
	if ($gender_create_script_done = 0)
		return
	endif
	0x79db87d7
	Wait \{0.5
		Seconds}
	0xf00f29a9
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
		Change \{cas_current_is_female = 1}
	else
		Change \{cas_current_is_female = 0}
	endif
	generate_random_genre
	cas_change_current_character_gender is_female = ($cas_current_is_female)
endscript

script cas_gender_rerandomize 
	generate_random_genre
	random_character_throttled is_female = ($cas_current_is_female) genre = <genre>
endscript

script random_character_throttled 
	if ScriptIsRunning \{random_character_throttled_spawned}
		do_wait = 1
	endif
	KillSpawnedScript \{Name = random_character_throttled_spawned}
	SpawnScriptNow random_character_throttled_spawned params = <...>
endscript

script random_character_throttled_spawned 
	if GotParam \{do_wait}
		Wait \{5
			gameframes}
	endif
	wanted_is_female = <is_female>
	if GotParam \{genre_select}
		cas_flag = {in_cas}
	endif
	cas_get_is_female Player = ($cas_current_player)
	if (<wanted_is_female> = <is_female>)
		generate_random_appearance is_female = <is_female> genre = <genre> new_car_character
		cas_queue_add_request appearance = ($cas_current_appearance) Player = ($cas_current_player) <cas_flag>
	else
		cas_change_current_character_gender is_female = <wanted_is_female>
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
