
script ui_init_freeplay 
	setcontrollerlock \{controller = 0
		unlock}
	setcontrollerlock \{controller = 1
		unlock}
	setcontrollerlock \{controller = 2
		unlock}
	setcontrollerlock \{controller = 3
		unlock}
	if existspakmanmap \{map = zones}
		GetPakManCurrent \{map = zones}
		if (<pak> = None)
			quickplay_choose_random_venue
		endif
	else
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
	NetSessionFunc \{func = live_settings_init}
	NetSessionFunc \{Obj = live_settings
		func = get_settings}
endscript

script ui_deinit_freeplay 
	musicmonitor_system_deinit
	vocals_reset_mics
	DestroyScreenElement \{id = freeplay_extra_helper_pill}
	DestroyScreenElement \{id = freeplay_ds_helper_pill}
	DestroyScreenElement \{id = freeplay_extra_helper_pill_menu}
	if ScreenElementExists \{id = vocals_highway_root}
		DestroyScreenElement \{id = vocals_highway_root}
	endif
endscript

script skip_freeplay_script 
	destroy_loading_screen
	ui_event_wait_for_safe
	ui_event event = menu_change data = {state = ($skip_freeplay_state)}
	Change \{skip_freeplay_state = None}
endscript

script ui_create_freeplay 
	if NOT ($invite_controller = -1)
		return
	endif
	if ($smoketestisrunning = FALSE)
		if GlobalExists \{Name = skip_freeplay_state
				Type = checksum}
			if ($skip_freeplay_state != None)
				SpawnScriptNow \{skip_freeplay_script}
				return
			endif
		endif
	endif
	Change \{game_mode = freeplay}
	Change \{attract_sound_state = start}
	Change \{freeplay_primary_vocalist = -1}
	Change \{respond_to_signin_changed = 0}
	Change \{respond_to_signin_changed_func = ui_signin_changed_func}
	Change \{load_song_synchronous = true}
	if ($smoketestisrunning = true)
		setplayerinfo \{1
			character_id = gh_rocker_casey}
		setplayerinfo \{2
			character_id = gh_rocker_axel}
		setplayerinfo \{3
			character_id = gh_rocker_lars}
		setplayerinfo \{4
			character_id = gh_rocker_judy}
	endif
	if NOT GotParam \{boot}
		persistent_band_force_traditional_band
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
	setplayerinfo <Player> vocals_slot = (<Player> - 1)
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
	if NOT is_venue_unlocked venue = ($current_level)
		create_loading_screen
		quickplay_choose_random_venue
	endif
	start_gem_scroller
	fadetoblack \{OFF
		time = 1.0
		no_wait}
	SpawnScriptLater ui_event_wait params = {event = menu_change data = {state = Uistate_gameplay freeplay_auto_join_device = <freeplay_auto_join_device>}}
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
			{pad_btn_bottom <jump_in_script>}
			{pad_btn_right ui_freeplay_handle_green}
			{pad_start ui_freeplay_handle_start}
			{pad_wii_1 ui_freeplay_connect_ds params = {from = helper}}
		]
		tags = {
			ignore_go_to_main_menu_for_players = <ignore_go_to_main_menu_for_players>
		}
	}
	LaunchEvent \{Type = focus
		target = freeplay_join_event_handler}
	freeplay_setup_root_helper_pills
	if GotParam \{freeplay_auto_join_device}
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
			audio_ui_freeplay_play_sfx Player = <Player> Type = select
			freeplay_pause_menu_resume Player = <Player>
			return
		elseif (<freeplay_state> = playing)
			freeplay_pause_player Player = <Player>
			return
		endif
	endif
	Player = (<Player> + 1)
	repeat <max_players>
	ui_freeplay_jump_in device_num = <device_num>
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
endscript

script ui_freeplay_jump_in \{auto_join = FALSE}
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
		SpawnScriptNow audio_ui_freeplay_play_sfx params = {Type = start Player = <Player>}
	endif
	freeplay_start_jump_player_in Player = <Player> controller = <device_num> auto_join = <auto_join>
endscript

script ui_freeplay_drop_out_all_players 
	getmaxplayers
	Player = 1
	begin
	getplayerinfo <Player> freeplay_state
	if (<freeplay_state> != dropped)
		freeplay_drop_player_out Player = <Player>
	endif
	Player = (<Player> + 1)
	repeat <max_players>
endscript

script ui_freeplay_main_menu 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	destroy_freeplay_jump_in_event_handler
	if is_ds_connected
		if NOT ScreenElementExists \{id = dialog_box_desc_id}
			freeplay_disable_menus
			audience_party_hide_playlist_popup
			create_dialog_box \{use_all_controllers
				heading_text = qs(0xaa163738)
				body_text = qs(0x7e4f6b33)
				options = [
					{
						func = ui_freeplay_remain_in_freeplay
						text = qs(0x0b0e2e47)
					}
					{
						func = ui_freeplay_main_menu
						text = qs(0xe5cba4a5)
					}
				]
				dlog_event_handlers = [
					{
						pad_up
						ui_sfx
						params = {
							menustate = Generic
							uitype = scrollup
						}
					}
					{
						pad_down
						ui_sfx
						params = {
							menustate = Generic
							uitype = scrolldown
						}
					}
				]}
			return
		else
			destroy_dialog_box
			audience_party_deinit
			wiidscommunication :disconnect
			freeplay_enable_menus
		endif
	endif
	enable_crowd_models_cfunc \{Active = true}
	ui_freeplay_drop_out_all_players
	freeplay_disable_menus \{defer_system_notifications_while_disabled = FALSE}
	songlist_clear_playlist
	ui_sfx \{menustate = freeplay
		uitype = select}
	hide_glitch \{num_frames = 8}
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
		ui_event {
			event = menu_replace
			data = {
				state = uistate_online_setup
				device_num = <device_num>
				boot = 1
				optional_signin = 1
				show_mainmenu_bg = 1
				clear_previous_stack
			}
		}
	endif
endscript

script ui_freeplay_connect_ds \{from = helper}
	if (<from> = helper)
		if NOT ScreenElementExists \{id = freeplay_ds_helper_pill}
			return
		endif
	endif
	if (<from> = Pause)
		hide_glitch \{num_frames = 60}
	endif
	destroy_freeplay_jump_in_event_handler
	ui_freeplay_drop_out_all_players
	ui_event {
		event = menu_change
		state = uistate_roadie_battle_choose_mode
		data = {
			device_num = <device_num>
			default_selection = roadie_battle_mode_setlist
			in_freeplay = true
		}
	}
endscript

script ui_freeplay_remain_in_freeplay 
	ui_sfx \{menustate = Generic
		uitype = back}
	destroy_dialog_box
	Wait \{1
		Frame}
	freeplay_enable_menus
	create_freeplay_jump_in_event_handler
endscript
