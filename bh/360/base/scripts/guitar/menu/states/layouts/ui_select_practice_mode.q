practice_enabled = 0

script ui_init_select_practice_mode 
	Change \{practice_enabled = 1}
	Change \{came_to_practice_from = main_menu}
	Change \{game_mode = practice}
	Change \{respond_to_signin_changed = 1}
	Change \{respond_to_signin_changed_func = None}
	spawnscriptnow \{do_training_loading}
endscript
g_training_loading_done = 0

script do_training_loading 
	Change \{g_training_loading_done = 0}
	create_loading_screen
	StopSoundsByBuss \{Encore_Events}
	apply_band_logo_to_venue \{step = build}
	if GotParam \{part}
		tutorial_setup_band players = 4 part = <part>
	else
		tutorial_setup_band \{players = 4}
	endif
	apply_band_logo_to_venue \{step = apply}
	create_bandname_viewport
	wait \{2
		gameframes}
	destroy_bg_viewport
	setup_bg_viewport
	GameMode_UpdateNumPlayers \{num_players = 1}
	Change \{g_training_loading_done = 1}
	hide_band
endscript

script ui_create_select_practice_mode 
	spawnscriptnow \{new_create_select_practice_mode}
endscript

script new_create_select_practice_mode 
	Menu_Music_Off
	if ScriptExists \{Crowd_Swells_During_Stats_Screen}
		killspawnedscript \{name = Crowd_Swells_During_Stats_Screen}
	endif
	if IsSoundEventPlaying \{Surge_During_Stats_Screen}
		StopSoundEvent \{Surge_During_Stats_Screen
			fade_time = 1.5
			fade_type = linear}
	endif
	BG_Crowd_Front_End_Silence
	begin
	if ($g_training_loading_done = 1)
		break
	endif
	wait \{1
		gameframe}
	repeat
	disable_pause
	UnpauseGame
	make_generic_menu \{Title = qs(0xd093953b)
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
	StartRendering
	LaunchEvent type = focus target = current_menu data = {child_index = <selected_index>}
endscript

script menu_select_practice_back 
	LaunchEvent \{type = unfocus
		target = current_menu}
	create_loading_screen
	generic_ui_destroy
	persistent_band_stop_and_unload_anims
	destroy_bandname_viewport
	generic_event_back
endscript

script ui_destroy_select_practice_mode 
	generic_ui_destroy
	destroy_generic_menu
endscript

script ui_deinit_select_practice_mode 
	persistent_band_stop_and_unload_anims
	destroy_bandname_viewport
	tutorial_disable_botplay
	Change \{practice_enabled = 0}
endscript

script ui_select_practice_mode_choose 
	printf \{qs(0xdfc3e245)}
	if GotParam \{practice}
		Change \{training_mode = practice}
		Change \{game_mode = practice}
	else
		Change \{training_mode = tutorials}
	endif
	if ($training_mode = tutorials)
		generic_event_choose \{state = UIstate_select_tutorial}
	else
		GameMode_UpdateNumPlayers \{num_players = 1}
		generic_event_choose \{state = uistate_songlist
			data = {
				no_jamsession
			}}
	endif
endscript

script check_tutorial_allowances \{allow_RB_drums = 1}
	if ($allow_controller_for_all_instruments = 1)
		return \{allowances = all}
	endif
	if isguitarcontroller \{controller = $primary_controller}
		<allowances> = guitar
	elseif IsRBDrum \{controller = $primary_controller}
		if (<allow_RB_drums> = 1)
			<allowances> = Drum
		else
			<allowances> = not_specific
		endif
	elseif isdrumcontroller \{controller = $primary_controller}
		<allowances> = Drum
	else
		ui_get_controller_parts_allowed \{controller = $primary_controller}
		if StructureContains structure = <allowed> vocals
			<allowances> = vocals
		else
			<allowances> = not_specific
		endif
	endif
	return allowances = <allowances>
endscript
