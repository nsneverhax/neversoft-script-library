practice_enabled = 0

script ui_init_select_practice_mode 
	change \{practice_enabled = 1}
	change \{came_to_practice_from = main_menu}
	change \{game_mode = training}
	change \{respond_to_signin_changed = 1}
	change \{respond_to_signin_changed_func = none}
	spawnscriptnow \{do_training_loading}
endscript
g_training_loading_done = 0

script do_training_loading 
	change \{g_training_loading_done = 0}
	create_loading_screen
	change \{current_progression_flag = none}
	destroy_band
	stopsoundsbybuss \{encore_events}
	apply_band_logo_to_venue \{step = build}
	if gotparam \{part}
		tutorial_setup_band players = 4 part = <part>
	else
		tutorial_setup_band \{players = 4}
	endif
	change \{current_level = load_z_studio}
	load_venue \{block_scripts = 0}
	create_band \{async = 1}
	bandmanager_allchangestance \{stance = stance_a
		no_wait}
	apply_band_logo_to_venue \{step = apply}
	create_bandname_viewport
	wait \{2
		gameframes}
	destroy_bg_viewport
	setup_bg_viewport
	change \{current_num_players = 1}
	gamemode_updatenumplayers \{num_players = 1}
	change \{g_training_loading_done = 1}
	hide_band
endscript

script ui_create_select_practice_mode 
	spawnscriptnow \{new_create_select_practice_mode}
endscript

script new_create_select_practice_mode 
	menu_music_off
	bg_crowd_front_end_silence
	begin
	if ($g_training_loading_done = 1)
		break
	endif
	wait \{1
		gameframe}
	repeat
	disable_pause
	unpausegame
	make_generic_menu \{title = qs(0xd093953b)
		pad_back_script = menu_select_practice_back}
	add_generic_menu_text_item \{text = qs(0x3ea7dec9)
		pad_choose_script = ui_select_practice_mode_choose
		pad_choose_params = {
			practice
		}}
	add_generic_menu_text_item \{text = qs(0xc6510dd1)
		pad_choose_script = ui_select_practice_mode_choose}
	menu_finish
	destroy_loading_screen
	startrendering
	launchevent type = focus target = current_menu data = {child_index = <selected_index>}
endscript

script menu_select_practice_back 
	launchevent \{type = unfocus
		target = current_menu}
	create_loading_screen
	generic_ui_destroy
	destroy_band
	destroy_bandname_viewport
	frontend_load_soundcheck
	generic_event_back
	destroy_loading_screen
endscript

script ui_destroy_select_practice_mode 
	generic_ui_destroy
	destroy_generic_menu
endscript

script ui_deinit_select_practice_mode 
	destroy_band
	destroy_bandname_viewport
	tutorial_disable_botplay
	change \{practice_enabled = 0}
endscript

script ui_select_practice_mode_choose 
	printf \{qs(0xdfc3e245)}
	if gotparam \{practice}
		change \{training_mode = practice}
		change \{game_mode = training}
	else
		change \{training_mode = tutorials}
	endif
	if ($training_mode = tutorials)
		generic_event_choose \{state = uistate_select_tutorial}
	else
		change \{current_num_players = 1}
		gamemode_updatenumplayers \{num_players = 1}
		generic_event_choose \{state = uistate_setlist
			data = {
				no_jamsession
			}}
	endif
endscript

script check_tutorial_allowances \{allow_rb_drums = 1}
	if ($allow_controller_for_all_instruments = 1)
		return \{allowances = all}
	endif
	if isguitarcontroller \{controller = $primary_controller}
		<allowances> = guitar
	elseif isrbdrum \{controller = $primary_controller}
		if (<allow_rb_drums> = 1)
			<allowances> = drum
		else
			<allowances> = not_specific
		endif
	elseif isdrumcontroller \{controller = $primary_controller}
		<allowances> = drum
	else
		ui_get_controller_parts_allowed \{controller = $primary_controller}
		if structurecontains structure = <allowed> vocals
			<allowances> = vocals
		else
			<allowances> = not_specific
		endif
	endif
	return allowances = <allowances>
endscript
