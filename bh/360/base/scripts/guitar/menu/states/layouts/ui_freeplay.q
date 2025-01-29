
script ui_init_freeplay 
	RequestMicDetection \{enable = false}
	GetPakManCurrent \{map = zones}
	if (<pak> = None)
		quickplay_choose_random_venue
	endif
	if ui_event_exists_in_stack \{name = 'savegame_boot_scan'}
		ScriptAssert \{'savegame_boot_scan on the UI stack. This is bad!'}
	endif
endscript

script ui_deinit_freeplay 
	musicmonitor_system_deinit
	destroy_freeplay_vocals_visualizer
	vocals_reset_mics
	DestroyScreenElement \{id = freeplay_extra_helper_pill}
	if ScreenElementExists \{id = vocals_highway_root}
		DestroyScreenElement \{id = vocals_highway_root}
	endif
	RequestMicDetection \{enable = true}
endscript

script ui_create_freeplay 
	if NOT ($invite_controller = -1)
		return
	endif
	Change \{game_mode = freeplay}
	Change \{attract_sound_state = start}
	Change \{freeplay_primary_vocalist = -1}
	Change \{respond_to_signin_changed = 0}
	Change \{respond_to_signin_changed_func = ui_signin_changed_func}
	Change \{load_song_synchronous = true}
	if NOT GotParam \{boot}
		persistent_band_force_traditional_band
	endif
	GetMaxLocalPlayers
	player = 1
	begin
	SetPlayerInfo <player> in_game = 1
	SetPlayerInfo <player> interactive = 0
	SetPlayerInfo <player> scoring = 0
	SetPlayerInfo <player> freeplay_state = dropped
	SetPlayerInfo <player> highway_position = center
	SetPlayerInfo <player> vocals_highway_view = scrolling
	SetPlayerInfo <player> controller = (<player> - 1)
	SetPlayerInfo <player> is_onscreen = 1
	SetPlayerInfo <player> bot_play = 0
	player = (<player> + 1)
	repeat <max_players>
	max_local_players = <max_players>
	GetMaxPlayers
	num_nonlocal_players = (<max_players> - <max_local_players>)
	begin
	SetPlayerInfo <player> is_onscreen = 0
	player = (<player> + 1)
	repeat <num_nonlocal_players>
	GetMaxLocalPlayers
	get_local_player_num_from_controller controller_index = ($primary_controller)
	leader = <local_player_num>
	player = 1
	begin
	GetPlayerInfo <player> controller
	get_savegame_from_controller controller = <controller>
	GetGlobalTags savegame = <savegame> user_options param = use_tilt_for_starpower_save
	SetPlayerInfo <player> use_tilt_for_starpower = <use_tilt_for_starpower_save>
	GetGlobalTags savegame = <savegame> user_options param = enable_touch_strip_save
	SetPlayerInfo <player> enable_touch_strip = <enable_touch_strip_save>
	load_saved_extras_states_for_player player = <player> controller = <controller> leader = <leader> dont_reset_cheats
	player = (<player> + 1)
	repeat <max_players>
	get_savegame_from_controller controller = ($primary_controller)
	ui_options_audio_set_dolby_digital savegame = <savegame>
	update_all_volumes_savegame savegame = <savegame>
	freeplay_unpause_sound \{freeplay_create = true}
	if NOT GotParam \{boot}
		GMan_SongFunc \{func = clear_play_list}
	endif
	mark_unsafe_for_shutdown
	UnpauseGame
	if NOT GotParam \{boot}
		freeplay_next_song \{initial_song_list = true}
	endif
	spawnscriptnow ui_create_freeplay_spawned params = {freeplay_auto_join_device = <freeplay_auto_join_device>}
endscript

script ui_create_freeplay_spawned 
	FormatText checksumname = venue_checksum 'venue_%s' s = ($LevelZones.($current_level).name)
	GetGlobalTags <venue_checksum> param = unlocked savegame = ($primary_controller)
	if NOT (<unlocked> = 1)
		create_loading_screen
		quickplay_choose_random_venue
	endif
	start_gem_scroller
	fadetoblack \{off
		time = 1.0
		no_wait}
	ui_event event = menu_change data = {state = uistate_gameplay freeplay_auto_join_device = <freeplay_auto_join_device>}
	if NOT RetailBuild
		if ($freeplay_mem_dump_done = 0)
			Change \{freeplay_mem_dump_done = 1}
			spawnscriptnow \{freeplay_boot_memory_dump}
		endif
	endif
	if (($autolaunch_cas = 1) || ($autolaunch_jam = 1) || ($autolaunch_lobby = 1))
		if ($autolaunch_jam = 1)
			Change \{skip_signin = 0}
		endif
		Change \{autolaunch_mainmenu = 0}
		fix_primary_controller_for_autolaunch
		SpawnScriptDelayed frames = 20 ui_freeplay_main_menu params = {device_num = ($primary_controller)}
	endif
endscript

script freeplay_boot_memory_dump 
endscript

script destroy_freeplay_jump_in_event_handler 
	DestroyScreenElement \{id = freeplay_join_event_handler}
endscript

script create_freeplay_jump_in_event_handler 
	if ScreenElementExists \{id = freeplay_join_event_handler}
		freeplay_join_event_handler :GetSingleTag \{ignore_go_to_main_menu_for_players}
	else
		ignore_go_to_main_menu_for_players = [false false false false]
	endif
	destroy_freeplay_jump_in_event_handler
	CreateScreenElement {
		type = ContainerElement
		parent = root_window
		id = freeplay_join_event_handler
		event_handlers = [
			{pad_btn_top ui_freeplay_jump_in}
			{pad_btn_bottom ui_freeplay_handle_green}
			{pad_start ui_freeplay_handle_start}
		]
		tags = {
			ignore_go_to_main_menu_for_players = <ignore_go_to_main_menu_for_players>
		}
	}
	LaunchEvent \{type = focus
		target = freeplay_join_event_handler}
	if GotParam \{freeplay_auto_join_device}
		Change \{Beginning_Of_Freeplay_Highway_Up = 1}
		LaunchEvent type = pad_btn_top target = freeplay_join_event_handler data = {device_num = <freeplay_auto_join_device> auto_join = true}
	endif
endscript

script ui_freeplay_handle_start 
	GetMaxLocalPlayers
	player = 1
	begin
	GetPlayerInfo <player> controller
	if (<device_num> = <controller>)
		GetPlayerInfo <player> freeplay_state
		if (<freeplay_state> = playing)
			freeplay_pause_player player = <player>
			return
		endif
	endif
	player = (<player> + 1)
	repeat <max_players>
	ui_freeplay_handle_green device_num = <device_num>
endscript

script ui_freeplay_handle_green 
	freeplay_join_event_handler :GetSingleTag \{ignore_go_to_main_menu_for_players}
	GetMaxLocalPlayers
	player = 1
	begin
	GetPlayerInfo <player> controller
	if (<device_num> = <controller>)
		GetPlayerInfo <player> freeplay_state
		if (<freeplay_state> = dropped)
			ignoring = (<ignore_go_to_main_menu_for_players> [<player> - 1])
			if (<ignoring> = true)
				return
			endif
		endif
	endif
	player = (<player> + 1)
	repeat <max_players>
	num_dropped_players = 0
	player = 1
	begin
	GetPlayerInfo <player> freeplay_state
	if (<freeplay_state> = dropped)
		num_dropped_players = (<num_dropped_players> + 1)
	endif
	player = (<player> + 1)
	repeat <max_players>
	if (<num_dropped_players> = <max_players>)
		if NOT ScriptIsRunning \{preload_song}
			ui_freeplay_main_menu device_num = <device_num>
		endif
		return
	endif
	ui_freeplay_jump_in device_num = <device_num>
endscript

script ui_freeplay_jump_in \{auto_join = false}
	GetMaxLocalPlayers
	GetControllerType controller = <device_num>
	player = 1
	begin
	GetPlayerInfo <player> freeplay_state
	if NOT (<freeplay_state> = dropped)
		GetPlayerInfo <player> controller
		if (<device_num> = <controller>)
			return
		endif
	endif
	player = (<player> + 1)
	repeat <max_players>
	player = (<device_num> + 1)
	GetPlayerInfo <player> freeplay_state
	if (<freeplay_state> != dropped)
		ScriptAssert \{qs(0x489e11be)}
	endif
	GetPlayerInfo <player> controller
	if (<controller> != <device_num>)
		ScriptAssert \{qs(0x297a72c1)}
	endif
	if (<auto_join> = false)
		UI_SFX_Freeplay type = start player = <player>
	endif
	freeplay_start_jump_player_in player = <player> controller = <device_num> auto_join = <auto_join>
endscript

script ui_freeplay_main_menu 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	SoundEvent \{event = EndOfSong_Camera_Cheer_Quiet}
	freeplay_disable_menus \{defer_system_notifications_while_disabled = false}
	songlist_clear_playlist
	generic_menu_pad_choose_sound
	if ($skip_signin = 1)
		ui_event \{event = menu_replace
			data = {
				state = uistate_mainmenu
				clear_previous_stack
			}}
	else
		RequireParams \{[
				device_num
			]
			all}
		if IsXenonOrWinDX
			ui_event {
				event = menu_replace
				data = {
					state = uistate_signin
					device_num = <device_num>
					new_state = uistate_mainmenu
					require_signin = 0
					clear_previous_stack
				}
			}
		else
			ui_event {
				event = menu_replace
				data = {
					state = uistate_signin
					device_num = <device_num>
					new_state = uistate_mainmenu
					boot = 1
					clear_previous_stack
				}
			}
		endif
	endif
endscript
