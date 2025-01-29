practice_enabled = 0
training_mode = tutorials

script ui_init_select_practice_mode 
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
	Wait \{2
		gameframes}
	destroy_bg_viewport
	setup_bg_viewport
	Change \{g_training_loading_done = 1}
	Hide_Band
endscript

script ui_create_select_practice_mode 
	SpawnScriptNow \{new_create_select_practice_mode}
endscript

script new_create_select_practice_mode 
	audio_ui_menu_music_off
	if ScriptExists \{audio_crowd_play_swells_during_stats_screen}
		KillSpawnedScript \{Name = audio_crowd_play_swells_during_stats_screen}
	endif
	if IsSoundEventPlaying \{surge_during_stats_screen}
		StopSoundEvent \{surge_during_stats_screen
			fade_time = 1.5
			fade_type = linear}
	endif
	audio_crowd_silence_front_end
	begin
	if ($g_training_loading_done = 1)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	disable_pause
	UnPauseGame
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
	StartRendering
	LaunchEvent Type = focus target = current_menu data = {child_index = <selected_index>}
endscript

script menu_select_practice_back 
	LaunchEvent \{Type = unfocus
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
		ui_sfx \{menustate = Generic
			uitype = select}
		generic_event_choose \{state = uistate_select_tutorial}
	else
		ui_sfx \{menustate = Generic
			uitype = select}
		generic_event_choose \{state = 0x0604ee76
			data = {
				0x3002594a = {
					no_jamsession
				}
			}}
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
			<allowances> = not_specific
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

script ui_get_controller_parts_allowed 
	RequireParams \{[
			controller
		]
		all}
	if (($allow_controller_for_all_instruments) = 0)
		allowed = {}
		if IsGuitarController controller = <controller>
			allowed = {guitar bass}
		elseif isdrumcontroller controller = <controller>
			allowed = {drum}
		elseif ismicrophonepluggedin
			allowed = {vocals}
		endif
	else
		allowed = {guitar bass drum vocals}
		if IsGuitarController controller = <controller>
			allowed = {guitar bass}
		elseif isdrumcontroller controller = <controller>
			allowed = {drum}
		elseif ismicrophonepluggedin
			allowed = {guitar bass drum vocals}
		endif
	endif
	if is_regular_controller controller = <controller>
		if controller_has_headset controller = <controller>
			allowed = {<allowed> vocals}
		endif
	endif
	if GotParam \{filter_by_character}
		filter_allowed_parts_by_character_type allowed = <allowed> controller = <controller>
	endif
	return allowed = <allowed>
endscript
