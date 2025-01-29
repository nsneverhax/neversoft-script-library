
script ui_init_freeplay 
	requestmicdetection \{enable = FALSE}
	GetPakManCurrent \{map = zones}
	if (<pak> = None)
		quickplay_choose_random_venue
	endif
	if ui_event_exists_in_stack \{Name = 'savegame_boot_scan'}
		ScriptAssert \{'savegame_boot_scan on the UI stack. This is bad!'}
	endif
	if demobuild
		if ($g_kiosk_demo = 1)
			Change \{freeplay_time_before_automatic_dropout = 30}
		endif
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
	requestmicdetection \{enable = true}
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
	if demobuild
		if NOT GotParam \{boot}
			globaltag_setup_traditional_band \{savegame = 0}
			persistent_band_force_traditional_band
		endif
	else
		if NOT GotParam \{boot}
			persistent_band_force_traditional_band
		endif
	endif
	getmaxlocalplayers
	Player = 1
	begin
	getplayerinfo <Player> bot_play
	setplayerinfo <Player> in_game = 1
	setplayerinfo <Player> interactive = 0
	setplayerinfo <Player> scoring = 0
	setplayerinfo <Player> freeplay_state = dropped
	setplayerinfo <Player> highway_position = center
	setplayerinfo <Player> vocals_highway_view = scrolling
	setplayerinfo <Player> is_onscreen = 1
	if NOT (<bot_play> = 1)
		setplayerinfo <Player> controller = (<Player> - 1)
		botplayoff Player = <Player>
	endif
	if demobuild
		if ($g_kiosk_demo = 1)
			setplayerinfo <Player> cheat_autokick = 1
		endif
	endif
	Player = (<Player> + 1)
	repeat <max_players>
	max_local_players = <max_players>
	getmaxplayers
	num_nonlocal_players = (<max_players> - <max_local_players>)
	begin
	setplayerinfo <Player> is_onscreen = 0
	Player = (<Player> + 1)
	repeat <num_nonlocal_players>
	getmaxlocalplayers
	get_local_player_num_from_controller controller_index = ($primary_controller)
	leader = <local_player_num>
	Player = 1
	begin
	getplayerinfo <Player> controller
	get_savegame_from_controller controller = <controller>
	GetGlobalTags savegame = <savegame> user_options param = use_tilt_for_starpower_save
	setplayerinfo <Player> use_tilt_for_starpower = <use_tilt_for_starpower_save>
	GetGlobalTags savegame = <savegame> user_options param = enable_touch_strip_save
	setplayerinfo <Player> enable_touch_strip = <enable_touch_strip_save>
	GetGlobalTags savegame = <savegame> user_options param = vocal_star_power_tap_save
	setplayerinfo <Player> vocal_star_power_tap = <vocal_star_power_tap_save>
	load_saved_extras_states_for_player Player = <Player> controller = <controller> leader = <leader> dont_reset_cheats
	Player = (<Player> + 1)
	repeat <max_players>
	get_savegame_from_controller controller = ($primary_controller)
	ui_options_audio_set_dolby_digital savegame = <savegame>
	update_all_volumes_savegame savegame = <savegame>
	freeplay_unpause_sound \{freeplay_create = true}
	if NOT GotParam \{boot}
		playlist_clear
	endif
	pushunsafeforshutdown \{context = gameplay
		Type = unchecked}
	UnPauseGame
	if NOT GotParam \{boot}
		freeplay_next_song \{initial_song_list = true}
	endif
	formatText checksumName = venue_checksum 'venue_%s' s = ($LevelZones.($current_level).Name)
	GetGlobalTags <venue_checksum> param = unlocked savegame = ($primary_controller)
	if NOT (<unlocked> = 1)
		create_loading_screen
		quickplay_choose_random_venue
	endif
	start_gem_scroller
	fadetoblack \{OFF
		time = 1.0
		no_wait}
	if NOT retailbuild
		if ($freeplay_mem_dump_done = 0)
			Change \{freeplay_mem_dump_done = 1}
			SpawnScriptNow \{freeplay_boot_memory_dump}
		endif
	endif
	if (($autolaunch_cas = 1) || ($autolaunch_jam = 1) || ($autolaunch_lobby = 1))
		if ($autolaunch_jam = 1)
			Change \{skip_signin = 0}
		endif
		Change \{autolaunch_mainmenu = 0}
		fix_primary_controller_for_autolaunch
		spawnscriptdelayed frames = 20 ui_freeplay_main_menu params = {device_num = ($primary_controller)}
	endif
	if GotParam \{boot}
		memory_check_bottomup_space
	endif
	SpawnScriptLater ui_event_wait params = {event = menu_change data = {state = Uistate_gameplay freeplay_auto_join_device = <freeplay_auto_join_device>}}
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
		ignore_go_to_main_menu_for_players = [FALSE FALSE FALSE FALSE]
	endif
	if demobuild
		jump_in_script = nullscript
		<back_script> = ui_freeplay_exit_demo
	else
		jump_in_script = ui_freeplay_jump_in
		<back_script> = nullscript
	endif
	destroy_freeplay_jump_in_event_handler
	CreateScreenElement {
		Type = ContainerElement
		parent = root_window
		id = freeplay_join_event_handler
		event_handlers = [
			{pad_btn_top <jump_in_script>}
			{pad_btn_bottom ui_freeplay_handle_green}
			{pad_btn_right <back_script>}
			{pad_start ui_freeplay_handle_start}
		]
		tags = {
			ignore_go_to_main_menu_for_players = <ignore_go_to_main_menu_for_players>
		}
	}
	LaunchEvent \{Type = focus
		target = freeplay_join_event_handler}
	if GotParam \{freeplay_auto_join_device}
		Change \{g_beginning_of_freeplay_highway_up = 1}
		LaunchEvent Type = pad_btn_top target = freeplay_join_event_handler data = {device_num = <freeplay_auto_join_device> auto_join = true}
	endif
endscript

script ui_freeplay_handle_start 
	getmaxlocalplayers
	Player = 1
	begin
	get_actual_controller Player = <Player>
	if (<device_num> = <controller>)
		getplayerinfo <Player> freeplay_state
		if (<freeplay_state> = paused)
			freeplay_pause_menu_resume Player = <Player>
			return
		elseif (<freeplay_state> = playing)
			freeplay_pause_player Player = <Player>
			return
		endif
	endif
	Player = (<Player> + 1)
	repeat <max_players>
	ui_freeplay_handle_green device_num = <device_num>
endscript

script ui_freeplay_handle_green 
	freeplay_join_event_handler :GetSingleTag \{ignore_go_to_main_menu_for_players}
	getmaxlocalplayers
	Player = 1
	begin
	getplayerinfo <Player> controller
	if (<device_num> = <controller>)
		getplayerinfo <Player> freeplay_state
		if (<freeplay_state> = dropped)
			ignoring = (<ignore_go_to_main_menu_for_players> [<Player> - 1])
			if (<ignoring> = true)
				return
			endif
		endif
	endif
	Player = (<Player> + 1)
	repeat <max_players>
	num_dropped_players = 0
	Player = 1
	begin
	getplayerinfo <Player> freeplay_state
	if (<freeplay_state> = dropped)
		num_dropped_players = (<num_dropped_players> + 1)
	endif
	Player = (<Player> + 1)
	repeat <max_players>
	if NOT demobuild
		if (<num_dropped_players> = <max_players>)
			if NOT ScriptIsRunning \{songaudioload}
				ui_freeplay_main_menu device_num = <device_num>
			endif
			return
		endif
	endif
	ui_freeplay_jump_in device_num = <device_num>
endscript

script ui_freeplay_jump_in \{auto_join = FALSE}
	if ($freeplay_demo_quit_warning_shown = 1)
		return
	endif
	getmaxlocalplayers
	Player = 1
	begin
	getplayerinfo <Player> freeplay_state
	if NOT (<freeplay_state> = dropped)
		get_actual_controller Player = <Player>
		if (<device_num> = <controller>)
			return
		endif
	endif
	Player = (<Player> + 1)
	repeat <max_players>
	Player = (<device_num> + 1)
	getplayerinfo <Player> freeplay_state
	if (<freeplay_state> != dropped)
		ScriptAssert \{qs(0x489e11be)}
	endif
	getplayerinfo <Player> controller
	getplayerinfo <Player> bot_play
	if (<controller> != <device_num> && <bot_play> = 0)
		ScriptAssert \{qs(0x297a72c1)}
	endif
	if (<auto_join> = FALSE)
		audio_ui_freeplay_play_sfx Type = start Player = <Player>
	endif
	freeplay_start_jump_player_in Player = <Player> controller = <device_num> auto_join = <auto_join>
endscript

script ui_freeplay_main_menu 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	SoundEvent \{event = endofsong_camera_cheer_quiet}
	freeplay_disable_menus \{defer_system_notifications_while_disabled = FALSE}
	songlist_clear_playlist
	ui_sfx \{menustate = freeplay
		uitype = select}
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
		if isxenonorwindx
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

script ui_freeplay_exit_demo 
	if demoallowsquit
		freeplay_get_num_active_players
		if (<num_active_players> = 0)
			if ($freeplay_demo_quit_warning_shown = 0)
				Change \{freeplay_demo_quit_warning_shown = 1}
				create_dialog_box {
					player_device = <device_num>
					no_background
					heading_text = qs(0x3e1679fb)
					body_text = qs(0x5e79f5c6)
					back_button_script = ui_freeplay_exit_demo_warning_cancel
					options = [
						{
							text = qs(0xbb46251f)
							func = ui_freeplay_exit_demo_warning_cancel
						}
						{
							text = qs(0x55c34bc7)
							func = ui_freeplay_exit_demo_warning_confirm
						}
					]
				}
				dialog_box_container :Obj_KillSpawnedScript \{Name = demo_timeout_check}
				dialog_box_container :Obj_SpawnScriptNow \{demo_timeout_check
					params = {
						func = ui_freeplay_exit_demo_warning_cancel
					}}
			endif
		endif
	endif
endscript

script ui_freeplay_exit_demo_warning_cancel 
	destroy_dialog_box
	Change \{freeplay_demo_quit_warning_shown = 0}
	freeplay_setup_root_helper_pills
endscript

script ui_freeplay_exit_demo_warning_confirm 
	destroy_dialog_box
	do_demo_outro
endscript
