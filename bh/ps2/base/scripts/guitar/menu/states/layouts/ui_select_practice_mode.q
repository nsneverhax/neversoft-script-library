practice_enabled = 0

script ui_init_select_practice_mode 
	0xfd22d1e7 \{num = 1}
	Change \{practice_enabled = 1}
	Change \{came_to_practice_from = main_menu}
	Change \{game_mode = practice}
	Change \{respond_to_signin_changed = 1}
	Change \{respond_to_signin_changed_func = None}
	SpawnScriptNow \{do_training_loading}
endscript
g_training_loading_done = 0

script do_training_loading 
	Change \{g_training_loading_done = 0}
	if ScreenElementExists \{id = current_menu_anchor}
		LaunchEvent \{target = current_menu_anchor
			Type = unfocus}
	endif
	if NOT ($current_progression_flag = None)
		Change came_to_practice_from_progression = ($current_progression_flag)
	endif
	Change \{current_progression_flag = None}
	getplayerinfo \{1
		character_id}
	if NOT (<character_id> = emptyguy)
		Change came_to_practice_character_id = <character_id>
		setplayerinfo \{1
			character_id = emptyguy}
	endif
	destroy_band
	StopSoundsByBuss \{Encore_Events}
	apply_band_logo_to_venue \{step = build}
	if GotParam \{part}
		tutorial_setup_band players = ($current_num_players) part = <part>
	else
		tutorial_setup_band players = ($current_num_players)
	endif
	0x72fc1318
	Change current_level = <0x2132a86b>
	Load_Venue \{block_scripts = 0}
	apply_band_logo_to_venue \{step = apply}
	create_bandname_viewport
	Wait \{2
		gameframes}
	destroy_bg_viewport
	setup_bg_viewport
	Change \{current_num_players = 1}
	gamemode_updatenumplayers \{num_players = 1}
	Change \{g_training_loading_done = 1}
	Hide_Band
endscript

script ui_create_select_practice_mode 
	SpawnScriptNow \{0x66cea520}
endscript

script 0x66cea520 
	BG_Crowd_Front_End_Silence
	begin
	if ($g_training_loading_done = 1)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	disable_pause
	UnPauseGame
	0x5e1a3a04 \{title = qs(0xd093953b)
		pad_back_script = menu_select_practice_back}
	0x9d0992fe \{text = qs(0x3ea7dec9)
		pad_choose_script = ui_select_practice_mode_choose
		pad_choose_params = {
			practice
		}}
	0x9d0992fe \{text = qs(0xc6510dd1)
		pad_choose_script = ui_select_practice_mode_choose}
	0x87679bf6 \{z_offset = 700.0}
	menu_finish
	LaunchEvent Type = focus target = current_menu data = {child_index = <selected_index>}
endscript

script menu_select_practice_back 
	generic_event_back
endscript

script ui_destroy_select_practice_mode 
	0xafd96096
	generic_ui_destroy
endscript

script ui_deinit_select_practice_mode 
	0x88e84c31
	destroy_band
	destroy_bandname_viewport
	tutorial_disable_botplay
	Change \{practice_enabled = 0}
endscript

script ui_select_practice_mode_choose 
	Change \{practice_enabled = 1}
	Change \{came_to_practice_from = main_menu}
	Change \{game_mode = practice}
	Change \{respond_to_signin_changed = 1}
	Change \{respond_to_signin_changed_func = None}

	if GotParam \{practice}
		0xe9384b7a \{0x9fe16047}
		Change \{training_mode = practice}
		Change \{game_mode = practice}
	else
		0xe9384b7a \{full}
		do_training_loading
		Change \{training_mode = tutorials}
	endif
	if ($training_mode = tutorials)
		set_primary_controller device_num = <device_num> state = uistate_select_tutorial no_sound
	else
		Change \{current_num_players = 1}
		gamemode_updatenumplayers \{num_players = 1}
		clear_exclusive_devices
		add_exclusive_device device = ($primary_controller)
		if (($allow_controller_for_all_instruments) = 0)
			if NOT IsGuitarController controller = <device_num>
				if isdrumcontroller controller = <device_num>
					ui_select_instrument_done instrument = drum device_num = <device_num> skip
				else
					ui_select_instrument_done instrument = vocals device_num = <device_num> skip
				endif
				ui_event_wait_for_safe
				destroy_loading_screen
				SetButtonEventMappings \{unblock_menu_input}
				return
			endif
		endif
		generic_event_choose \{state = uistate_select_instrument}
	endif
endscript

script check_tutorial_allowances \{allow_rb_drums = 1}
	if ($allow_controller_for_all_instruments = 1)
		return \{allowances = all}
	endif
	if IsGuitarController \{controller = $primary_controller}
		<allowances> = guitar
	elseif isrbdrum \{controller = $primary_controller}
		if (<allow_rb_drums> = 1)
			<allowances> = drum
		else
			<allowances> = rb_drum
		endif
	elseif isdrumcontroller \{controller = $primary_controller}
		<allowances> = drum
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
