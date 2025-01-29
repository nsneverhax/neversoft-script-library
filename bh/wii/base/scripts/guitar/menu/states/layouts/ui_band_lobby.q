
script ui_init_band_lobby 
	set_cas_loading_setup \{setup = lobby}
	disable_pause
	if NOT ininternetmode
		NetSessionFunc \{func = match_init}
		NetSessionFunc \{func = friends_init}
	endif
	if freestyle_is_active
		Change \{g_lobby_enter_from_main_menu = 0}
		Change \{g_lobby_net_state = local}
	else
		LightShow_InitEventMappings
		lightshow_notingameplay_setmood \{mood = band_lobby}
	endif
	if ($g_lobby_enter_from_main_menu = 1)
		Change \{g_lobby_enter_from_main_menu = 0}
		if CheckForSignIn controller_index = <device_num> dont_set_primary
			get_savegame_from_controller controller = <device_num>
			GetGlobalTags savegame = <savegame> net
			Change g_lobby_net_state = <prev_net_settings>
			if isngc
				if NOT islobbyconnected \{default_lobby}
					Change \{g_lobby_net_state = local}
				elseif ($demonware_connection_success = 0)
					Change \{g_lobby_net_state = local}
				endif
			endif
		else
			Change \{g_lobby_net_state = local}
		endif
		NetSessionFunc \{func = removeallcontrollers}
		if ($g_lobby_state != vs)
			if NOT freestyle_is_active
				persistent_band_force_traditional_band
			endif
		endif
		band_lobby_attempt_to_join viewport_index = <device_num> device_num = <device_num> from_main_menu
		if GotParam \{error}
			Change g_band_lobby_error_msg = <error>
			Change g_leader_player_num = (<device_num> + 1)
		endif
		if ($g_lobby_state != career)
			quick_remove_goal \{goal_name = career}
		endif
	endif
	band_lobby_set_gamemode_by_state lobby = ($g_lobby_state)
	if is_roadie_battle_mode
		band_lobby_update_submenu_data \{submenu_index = 0
			element = Player
			value = 1}
		band_lobby_update_submenu_data \{submenu_index = 0
			element = occupied
			value = 1}
		band_lobby_update_submenu_data \{submenu_index = 0
			element = menu
			value = empty}
		band_lobby_update_submenu_data \{submenu_index = 1
			element = Player
			value = 2}
		band_lobby_update_submenu_data \{submenu_index = 1
			element = occupied
			value = 0}
		band_lobby_update_submenu_data \{submenu_index = 1
			element = menu
			value = empty}
	elseif freestyle_is_active
		band_lobby_update_submenu_data \{submenu_index = 0
			element = Player
			value = 1}
		band_lobby_update_submenu_data \{submenu_index = 1
			element = Player
			value = 2}
		band_lobby_update_submenu_data \{submenu_index = 2
			element = Player
			value = 3}
		band_lobby_update_submenu_data \{submenu_index = 3
			element = Player
			value = 4}
		if NOT (($freestyle_recording_mode) = overdub)
			if NOT (($freestyle_band_lobby_first_pass) = FALSE)
				freestyle_set_default_player_data
			endif
		endif
	else
		band_lobby_add_local_players_to_submenus
		band_lobby_add_remote_players_to_submenus
	endif
	if freestyle_is_active
		freestyle_band_lobbby_init
	else
		band_lobby_make_visible_players_mutually_exclusive
		persistent_band_play_all_default_anims
		if NOT is_roadie_battle_mode
			NetSessionFunc \{Obj = party
				func = set_party_joinable
				params = {
					joinable = 1
				}}
		endif
		KillCamAnim \{all}
	endif
	if isngc
		get_home_button_allowed
		if (<disabled> = 1)
			SpawnScriptNow \{band_lobby_wii_delay_allow_home_button}
		endif
	endif
endscript

script ui_deinit_band_lobby 
	quick_remove_goal \{goal_name = career}
	band_lobby_reset_all_chosen_characters
	if freestyle_is_active
		ui_deinit_band_lobby_setup
	endif
	unlock_all_controllers
endscript

script ui_create_band_lobby 
	0x61906aac
	if ScriptExists \{crowd_swells_during_stats_screen}
		KillSpawnedScript \{Name = crowd_swells_during_stats_screen}
	endif
	if IsSoundEventPlaying \{surge_during_stats_screen}
		StopSoundEvent \{surge_during_stats_screen
			fade_time = 1.5
			fade_type = linear}
	endif
	unlock_all_controllers
	capturescenetexture
	hide_glitch \{num_frames = 10}
	initlobbytextures
	if ($g_lobby_storageselect_return_savegame != -1)
		continue_after_storage_selector_savegame = ($g_lobby_storageselect_return_savegame)
		continue_after_storage_selector_confirm = ($g_lobby_storageselect_return_confirm)
	endif
	Change \{g_lobby_storageselect_return_savegame = -1}
	Change \{g_lobby_storageselect_return_confirm = FALSE}
	SpawnScriptNow \{Skate8_SFX_Backgrounds_New_Area
		params = {
			BG_SFX_Area = FrontEnd
			fadeintime = 2
			fadeintype = linear
			fadeouttime = 2
			fadeouttype = linear
		}}
	if ($enable_saving = 1)
		savegame_async_init
	endif
	band_lobby_setup_cameras
	if InNetGame
		Change \{respond_to_signin_changed = 1}
		Change \{respond_to_signin_changed_all_players = 1}
	else
		Change \{respond_to_signin_changed = 0}
		Change \{respond_to_signin_changed_all_players = 0}
	endif
	Change \{respond_to_signin_changed_func = band_lobby_signin_changed}
	spawn_player_drop_listeners \{drop_player_script = band_lobby_drop_player
		end_game_script = band_lobby_end_game}
	CreateScreenElement \{parent = root_window
		id = band_lobby_desc_id
		Type = descinterface
		desc = 'band_lobby'
		z_priority = 0.0}
	if band_lobby_desc_id :desc_resolvealias \{Name = 0x10aeb4b2}
		if ScreenElementExists \{id = band_lobby_desc_id}
			<resolved_id> :obj_spawnscript 0xa323fa10 params = {0x971c66e7 = 1 0x3af134dc = 1 start_dims = (10.0, 10.0)}
		endif
	else
		ScriptAssert \{'UI_art'}
	endif
	if band_lobby_desc_id :desc_resolvealias \{Name = 0xa02563d1}
		if ScreenElementExists \{id = band_lobby_desc_id}
			<resolved_id> :obj_spawnscript 0xa323fa10 params = {0x971c66e7 = 1 0x3af134dc = 3 start_dims = (10.0, 10.0)}
		endif
	else
		ScriptAssert \{'UI_art'}
	endif
	if band_lobby_desc_id :desc_resolvealias \{Name = 0x5f448112}
		if ScreenElementExists \{id = band_lobby_desc_id}
			<resolved_id> :obj_spawnscript 0xa323fa10 params = {0x971c66e7 = 1 0x3af134dc = 3 start_dims = (5.0, 5.0)}
		endif
	else
		ScriptAssert \{'UI_art'}
	endif
	if band_lobby_desc_id :desc_resolvealias \{Name = 0x219b1158}
		if ScreenElementExists \{id = band_lobby_desc_id}
			<resolved_id> :obj_spawnscript 0xa323fa10 params = {0x971c66e7 = 1 0x3af134dc = 3 start_dims = (10.0, 10.0)}
		endif
	else
		ScriptAssert \{'UI_art'}
	endif
	if band_lobby_desc_id :desc_resolvealias \{Name = 0x89a7e508}
		if ScreenElementExists \{id = band_lobby_desc_id}
			<resolved_id> :obj_spawnscript 0xa323fa10 params = {0x971c66e7 = 1 0x3af134dc = 1 start_dims = (5.0, 5.0)}
		endif
	else
		ScriptAssert \{'UI_art'}
	endif
	if band_lobby_desc_id :desc_resolvealias \{Name = 0x392c326b}
		if ScreenElementExists \{id = band_lobby_desc_id}
			<resolved_id> :obj_spawnscript 0xa323fa10 params = {0x971c66e7 = 1 0x3af134dc = 3 start_dims = (10.0, 10.0)}
		endif
	else
		ScriptAssert \{'UI_art'}
	endif
	if band_lobby_desc_id :desc_resolvealias \{Name = 0xc64dd0a8}
		if ScreenElementExists \{id = band_lobby_desc_id}
			<resolved_id> :obj_spawnscript 0xa323fa10 params = {0x971c66e7 = 1 0x3af134dc = 3 start_dims = (5.0, 5.0)}
		endif
	else
		ScriptAssert \{'UI_art'}
	endif
	if band_lobby_desc_id :desc_resolvealias \{Name = 0xb89240e2}
		if ScreenElementExists \{id = band_lobby_desc_id}
			<resolved_id> :obj_spawnscript 0xa323fa10 params = {0x971c66e7 = 1 0x3af134dc = 3 start_dims = (10.0, 10.0)}
		endif
	else
		ScriptAssert \{'UI_art'}
	endif
	if band_lobby_desc_id :desc_resolvealias \{Name = 0xfea0d59e}
		if ScreenElementExists \{id = band_lobby_desc_id}
			<resolved_id> :obj_spawnscript 0xa323fa10 params = {0x971c66e7 = 1 0x3af134dc = 1 start_dims = (15.0, 15.0)}
		endif
	else
		ScriptAssert \{'UI_art'}
	endif
	if band_lobby_desc_id :desc_resolvealias \{Name = 0x4e2b02fd}
		if ScreenElementExists \{id = band_lobby_desc_id}
			<resolved_id> :obj_spawnscript 0xa323fa10 params = {0x971c66e7 = 1 0x3af134dc = 3 start_dims = (5.0, 5.0)}
		endif
	else
		ScriptAssert \{'UI_art'}
	endif
	if band_lobby_desc_id :desc_resolvealias \{Name = 0xb14ae03e}
		if ScreenElementExists \{id = band_lobby_desc_id}
			<resolved_id> :obj_spawnscript 0xa323fa10 params = {0x971c66e7 = 1 0x3af134dc = 3 start_dims = (5.0, 5.0)}
		endif
	else
		ScriptAssert \{'UI_art'}
	endif
	if band_lobby_desc_id :desc_resolvealias \{Name = 0xcf957074}
		if ScreenElementExists \{id = band_lobby_desc_id}
			<resolved_id> :obj_spawnscript 0xa323fa10 params = {0x971c66e7 = 1 0x3af134dc = 3 start_dims = (15.0, 15.0)}
		endif
	else
		ScriptAssert \{'UI_art'}
	endif
	if band_lobby_desc_id :desc_resolvealias \{Name = 0x60c4403d}
		if ScreenElementExists id = <resolved_id>
			<resolved_id> :obj_spawnscript 0xa323fa10 params = {0x971c66e7 = 1 0x3af134dc = 1 start_dims = (5.0, 5.0)}
		endif
	else
		ScriptAssert \{'UI_art'}
	endif
	if band_lobby_desc_id :desc_resolvealias \{Name = 0xd04f975e}
		if ScreenElementExists id = <resolved_id>
			<resolved_id> :obj_spawnscript 0xa323fa10 params = {0x971c66e7 = 1 0x3af134dc = 3 start_dims = (10.0, 10.0)}
		endif
	else
		ScriptAssert \{'UI_art'}
	endif
	if band_lobby_desc_id :desc_resolvealias \{Name = 0x2f2e759d}
		if ScreenElementExists id = <resolved_id>
			<resolved_id> :obj_spawnscript 0xa323fa10 params = {0x971c66e7 = 1 0x3af134dc = 3 start_dims = (5.0, 5.0)}
		endif
	else
		ScriptAssert \{'UI_art'}
	endif
	if band_lobby_desc_id :desc_resolvealias \{Name = 0x51f1e5d7}
		if ScreenElementExists id = <resolved_id>
			<resolved_id> :obj_spawnscript 0xa323fa10 params = {0x971c66e7 = 1 0x3af134dc = 3 start_dims = (10.0, 10.0)}
		endif
	else
		ScriptAssert \{'UI_art'}
	endif
	if band_lobby_desc_id :desc_resolvealias \{Name = alias_diamondbling3
			param = diamondbling3_id}
		<diamondbling3_id> :obj_spawnscript 0x976144e6 params = {minwidth = 4 maxwidth = 8 maxtime = 0.5}
	else
		ScriptAssert \{'UI_art'}
	endif
	if band_lobby_desc_id :desc_resolvealias \{Name = alias_diamondbling6
			param = diamondbling6_id}
		<diamondbling6_id> :obj_spawnscript 0x976144e6 params = {minwidth = 4 maxwidth = 8 maxtime = 0.5}
	else
		ScriptAssert \{'UI_art'}
	endif
	if band_lobby_desc_id :desc_resolvealias \{Name = alias_diamondbling9
			param = diamondbling9_id}
		<diamondbling9_id> :obj_spawnscript 0x976144e6 params = {minwidth = 4 maxwidth = 8 maxtime = 0.5}
	else
		ScriptAssert \{'UI_art'}
	endif
	if band_lobby_desc_id :desc_resolvealias \{Name = 0x4da245e6
			param = 0x2b32616d}
		<0x2b32616d> :obj_spawnscript 0x976144e6 params = {minwidth = 4 maxwidth = 8 maxtime = 0.5}
	else
		ScriptAssert \{'UI_art'}
	endif
	if freestyle_is_active
		setplayerinfo \{1
			in_game = 0}
		setplayerinfo \{2
			in_game = 0}
		setplayerinfo \{3
			in_game = 0}
		setplayerinfo \{4
			in_game = 0}
		state_array = ($freestyle_band_lobby_player_states)
		SetArrayElement \{ArrayName = state_array
			index = 0
			NewValue = not_joined}
		SetArrayElement \{ArrayName = state_array
			index = 1
			NewValue = not_joined}
		SetArrayElement \{ArrayName = state_array
			index = 2
			NewValue = not_joined}
		Change freestyle_band_lobby_player_states = <state_array>
	endif
	if band_lobby_desc_id :desc_resolvealias \{Name = alias_band_viewport_vmenu}
		band_lobby_create_viewport_and_menus {
			viewport_vmenu = <resolved_id>
		}
	endif
	if band_lobby_desc_id :desc_resolvealias \{Name = alias_remote_players_menu}
		band_lobby_create_submenus_remote {
			remote_players_menu = <resolved_id>
		}
	endif
	if InNetGame
		if ScreenElementExists \{id = band_lobby_desc_id}
			RunScriptOnScreenElement \{id = band_lobby_desc_id
				band_lobby_watchdog_all_player_appearance_change}
		endif
	endif
	<id> :Obj_SpawnScriptNow band_lobby_ui_animations
	band_lobby_update_lobby_title
	band_lobby_update_ticker \{msg_checksum = current_state}
	band_lobby_update_button_helpers
	gman_shutdownallgoals \{preserve_career}
	session_stats_reset
	Change \{in_band_lobby = 1}
	Change \{check_for_unplugged_controllers = 1}
	Change \{sysnotify_paused_controllers = [
		]}
	hack_toggleforceflarerendering
	if NOT freestyle_is_active
		band_lobby_refresh_band_leader_characters \{no_refresh}
		persistent_band_refresh_changed_characters
		set_cas_loading_setup \{setup = lobby}
		band_lobby_desc_id :obj_spawnscript \{band_lobby_update_mics}
	endif
	band_lobby_desc_id :obj_spawnscript \{0x1550adfb}
	SpawnScriptNow ui_create_band_lobby_spawned params = <...>
	if freestyle_is_active
		SpawnScriptLater \{freestyle_band_lobbby_create}
	endif
	if 0x3e572301
		0x5a603ec5
	endif
endscript

script ui_create_band_lobby_spawned 
	destroy_loading_screen
endscript

script ui_destroy_band_lobby 
	if NOT is_roadie_battle_mode
		if NOT freestyle_is_active
			if safetolockcontrollers
				lock_all_controllers
			endif
		endif
	endif
	hide_glitch \{num_frames = 10}
	set_cas_loading_setup \{setup = hidden}
	SpawnScriptNow \{savegame_async_deinit}
	<i> = 0
	begin
	formatText checksumName = viewport 'band_viewport_%i' i = <i>
	formatText checksumName = viewport_cam 'band_viewport_cam_%i' i = <i>
	ScreenFX_ClearFXInstances viewport = <viewport>
	KillCamAnim Name = <viewport_cam>
	if ScreenElementExists id = <viewport>
		DestroyScreenElement id = <viewport>
	endif
	<i> = (<i> + 1)
	repeat ($g_num_lobby_local_submenus)
	band_lobby_reset_all_chosen_characters
	set_all_character_viewports_on
	if freestyle_is_active
		KillSpawnedScript \{id = drum_icon_updater}
		KillSpawnedScript \{id = bouncer}
	endif
	DestroyScreenElement \{id = band_lobby_desc_id}
	ScreenFX_ClearFXInstances \{viewport = bg_viewport}
	destroylobbytextures
	clean_up_user_control_helpers
	vocals_deinit_all_mics
	Change \{in_band_lobby = 0}
	Change \{check_for_unplugged_controllers = 0}
	hack_toggleforceflarerendering
	Change \{g_suppress_anim_in = 0}
	if ScreenElementExists \{id = dialog_box_container}
		DestroyScreenElement \{id = dialog_box_container}
	endif
endscript

script ui_return_band_lobby 
	band_lobby_desc_id :Obj_KillSpawnedScript \{Name = band_lobby_update_mics}
	band_lobby_desc_id :obj_spawnscript \{band_lobby_update_mics}
	printf \{channel = vocals
		qs(0xd3c80918)}
	band_lobby_change_focus_submenu_all \{focus_type = focus}
	vocals_reinit_mics noise_gate = ($band_lobby_noise_gate)
	if ScreenElementExists \{id = band_lobby_popup_menu}
		band_lobby_popup_menu :GetTags
		if ((GotParam menu) && (GotParam Player))
			getplayerinfo <Player> controller
			band_lobby_update_button_helpers controller = <controller> menu = <menu> Player = <Player>
		else
			band_lobby_update_button_helpers
		endif
	else
		band_lobby_update_button_helpers
	endif
endscript

script band_lobby_ui_animations 
	printf \{channel = band_lobby
		qs(0x449b532a)}
	Obj_GetID
endscript

script band_lobby_wii_delay_allow_home_button 
	Wait \{5
		Seconds}
	set_home_button_allowed
endscript
