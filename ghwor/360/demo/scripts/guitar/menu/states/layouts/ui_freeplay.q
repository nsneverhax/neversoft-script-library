
script ui_init_freeplay 
	requestmicdetection \{enable = false}
	getpakmancurrent \{map = zones}
	if (<pak> = none)
		quickplay_choose_random_venue
	endif
	if ui_event_exists_in_stack \{name = 'savegame_boot_scan'}
		scriptassert \{'savegame_boot_scan on the UI stack. This is bad!'}
	endif
	if demobuild
		if ($g_kiosk_demo = 1)
			change \{freeplay_time_before_automatic_dropout = 30}
		endif
	endif
	netsessionfunc \{func = live_settings_init}
	netsessionfunc \{obj = live_settings
		func = get_settings}
endscript

script ui_deinit_freeplay 
	musicmonitor_system_deinit
	destroy_freeplay_vocals_visualizer
	vocals_reset_mics
	destroyscreenelement \{id = freeplay_extra_helper_pill}
	if screenelementexists \{id = vocals_highway_root}
		destroyscreenelement \{id = vocals_highway_root}
	endif
	requestmicdetection \{enable = true}
endscript

script ui_create_freeplay 
	if NOT ($invite_controller = -1)
		return
	endif
	change \{game_mode = freeplay}
	change \{attract_sound_state = start}
	change \{freeplay_primary_vocalist = -1}
	change \{respond_to_signin_changed = 0}
	change \{respond_to_signin_changed_func = ui_signin_changed_func}
	change \{load_song_synchronous = true}
	if demobuild
		if NOT gotparam \{boot}
			globaltag_setup_traditional_band \{savegame = 0}
			persistent_band_force_traditional_band
		endif
	else
		if NOT gotparam \{boot}
			persistent_band_force_traditional_band
		endif
	endif
	getmaxlocalplayers
	player = 1
	begin
	getplayerinfo <player> bot_play
	setplayerinfo <player> in_game = 1
	setplayerinfo <player> interactive = 0
	setplayerinfo <player> scoring = 0
	setplayerinfo <player> freeplay_state = dropped
	setplayerinfo <player> highway_position = center
	setplayerinfo <player> vocals_highway_view = scrolling
	setplayerinfo <player> is_onscreen = 1
	if NOT (<bot_play> = 1)
		setplayerinfo <player> controller = (<player> - 1)
		botplayoff player = <player>
	endif
	if demobuild
		if ($g_kiosk_demo = 1)
			setplayerinfo <player> cheat_autokick = 1
		endif
	endif
	player = (<player> + 1)
	repeat <max_players>
	max_local_players = <max_players>
	getmaxplayers
	num_nonlocal_players = (<max_players> - <max_local_players>)
	begin
	setplayerinfo <player> is_onscreen = 0
	player = (<player> + 1)
	repeat <num_nonlocal_players>
	getmaxlocalplayers
	get_local_player_num_from_controller controller_index = ($primary_controller)
	leader = <local_player_num>
	player = 1
	begin
	getplayerinfo <player> controller
	get_savegame_from_controller controller = <controller>
	getglobaltags savegame = <savegame> user_options param = use_tilt_for_starpower_save
	setplayerinfo <player> use_tilt_for_starpower = <use_tilt_for_starpower_save>
	getglobaltags savegame = <savegame> user_options param = enable_touch_strip_save
	setplayerinfo <player> enable_touch_strip = <enable_touch_strip_save>
	getglobaltags savegame = <savegame> user_options param = vocal_star_power_tap_save
	setplayerinfo <player> vocal_star_power_tap = <vocal_star_power_tap_save>
	load_saved_extras_states_for_player player = <player> controller = <controller> leader = <leader> dont_reset_cheats
	player = (<player> + 1)
	repeat <max_players>
	get_savegame_from_controller controller = ($primary_controller)
	if NOT gotparam \{boot}
		set_audio_options_for_primary_controller
	endif
	freeplay_unpause_sound \{freeplay_create = true}
	if NOT gotparam \{boot}
		playlist_clear
	endif
	pushunsafeforshutdown \{context = gameplay
		type = unchecked}
	unpausegame
	if NOT gotparam \{boot}
		freeplay_next_song \{initial_song_list = true}
	endif
	if NOT is_venue_unlocked venue = ($current_level)
		create_loading_screen
		quickplay_choose_random_venue
	endif
	if gotparam \{signin_change}
		start_gem_scroller \{signin_change}
	else
		start_gem_scroller
	endif
	fadetoblack \{off
		time = 1.0
		no_wait}
	if NOT retailbuild
		if ($freeplay_mem_dump_done = 0)
			change \{freeplay_mem_dump_done = 1}
			spawnscriptnow \{freeplay_boot_memory_dump}
		endif
	endif
	if (($autolaunch_cas = 1) || ($autolaunch_jam = 1) || ($autolaunch_lobby = 1))
		if ($autolaunch_jam = 1)
			change \{skip_signin = 0}
		endif
		change \{autolaunch_mainmenu = 0}
		fix_primary_controller_for_autolaunch
		spawnscriptdelayed frames = 20 ui_freeplay_main_menu params = {device_num = ($primary_controller)}
	endif
	if gotparam \{signin_change}
		hide_glitch \{num_frames = 30}
		spawnscriptdelayed frames = 20 ui_freeplay_main_menu params = {device_num = ($primary_controller) signin_change}
	endif
	if gotparam \{boot}
		memory_check_bottomup_space
	endif
	spawnscriptlater ui_event_wait params = {event = menu_change data = {state = uistate_gameplay freeplay_auto_join_device = <freeplay_auto_join_device>}}
endscript

script freeplay_boot_memory_dump 
endscript

script destroy_freeplay_jump_in_event_handler 
	destroyscreenelement \{id = freeplay_join_event_handler}
endscript

script create_freeplay_jump_in_event_handler 
	if screenelementexists \{id = freeplay_join_event_handler}
		freeplay_join_event_handler :getsingletag \{ignore_go_to_main_menu_for_players}
	else
		ignore_go_to_main_menu_for_players = [false false false false]
	endif
	if demobuild
		jump_in_script = nullscript
		<back_script> = ui_freeplay_exit_demo
	else
		jump_in_script = ui_freeplay_jump_in
		<back_script> = nullscript
	endif
	destroy_freeplay_jump_in_event_handler
	createscreenelement {
		type = containerelement
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
	launchevent \{type = focus
		target = freeplay_join_event_handler}
	if gotparam \{freeplay_auto_join_device}
		change \{g_beginning_of_freeplay_highway_up = 1}
		launchevent type = pad_btn_top target = freeplay_join_event_handler data = {device_num = <freeplay_auto_join_device> auto_join = true}
	endif
endscript

script ui_freeplay_handle_start 
	getmaxlocalplayers
	player = 1
	begin
	get_actual_controller player = <player>
	if (<device_num> = <controller>)
		getplayerinfo <player> freeplay_state
		if (<freeplay_state> = paused)
			audio_ui_freeplay_play_sfx player = <player> type = select
			freeplay_pause_menu_resume player = <player>
			return
		elseif (<freeplay_state> = playing)
			freeplay_pause_player player = <player>
			return
		endif
	endif
	player = (<player> + 1)
	repeat <max_players>
	ui_freeplay_handle_green device_num = <device_num>
endscript

script ui_freeplay_handle_green 
	freeplay_join_event_handler :getsingletag \{ignore_go_to_main_menu_for_players}
	getmaxlocalplayers
	player = 1
	begin
	getplayerinfo <player> controller
	if (<device_num> = <controller>)
		getplayerinfo <player> freeplay_state
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
	getplayerinfo <player> freeplay_state
	if (<freeplay_state> = dropped)
		num_dropped_players = (<num_dropped_players> + 1)
	endif
	player = (<player> + 1)
	repeat <max_players>
	if NOT demobuild
		if (<num_dropped_players> = <max_players>)
			if NOT scriptisrunning \{songaudioload}
				ui_freeplay_main_menu device_num = <device_num>
			endif
			return
		endif
	endif
	ui_freeplay_jump_in device_num = <device_num>
endscript

script ui_freeplay_jump_in \{auto_join = false}
	if ($freeplay_demo_quit_warning_shown = 1)
		return
	endif
	if freeplay_song_has_passed_last_fretbar
		return
	endif
	getmaxlocalplayers
	player = 1
	begin
	getplayerinfo <player> freeplay_state
	if NOT (<freeplay_state> = dropped)
		get_actual_controller player = <player>
		if (<device_num> = <controller>)
			return
		endif
	endif
	player = (<player> + 1)
	repeat <max_players>
	player = (<device_num> + 1)
	getplayerinfo <player> freeplay_state
	if (<freeplay_state> != dropped)
		scriptassert \{qs(0x489e11be)}
	endif
	getplayerinfo <player> controller
	getplayerinfo <player> bot_play
	if (<controller> != <device_num> && <bot_play> = 0)
		scriptassert \{qs(0x297a72c1)}
	endif
	if (<auto_join> = false)
		spawnscriptnow audio_ui_freeplay_play_sfx params = {type = start player = <player>}
	endif
	freeplay_start_jump_player_in player = <player> controller = <device_num> auto_join = <auto_join>
endscript

script ui_freeplay_main_menu 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	soundevent \{event = endofsong_camera_cheer_quiet}
	freeplay_disable_menus \{defer_system_notifications_while_disabled = false}
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
		requireparams \{[
				device_num
			]
			all}
		if gotparam \{signin_change}
			ui_event {
				event = menu_replace
				data = {
					state = uistate_save_icon_warning
					device_num = <device_num>
					clear_previous_stack
				}
			}
		else
			ui_event {
				event = menu_replace
				data = {
					state = uistate_signin
					device_num = <device_num>
					new_state = uistate_social_networks_setup
					boot = 1
					optional_signin = 1
					clear_previous_stack
					show_mainmenu_bg = 1
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
				change \{freeplay_demo_quit_warning_shown = 1}
				create_dialog_box {
					player_device = <device_num>
					no_background
					heading_text = qs(0x3e1679fb)
					body_text = qs(0x5e79f5c6)
					back_button_script = ui_freeplay_exit_demo_warning_cancel
					options = [
						{
							text = qs(0x7343df39)
							func = ui_freeplay_exit_demo_warning_cancel
						}
						{
							text = qs(0x55c34bc7)
							func = ui_freeplay_exit_demo_warning_confirm
						}
					]
				}
				ui_sfx \{menustate = generic
					uitype = warningmessage}
				dialog_box_container :obj_killspawnedscript \{name = demo_timeout_check}
				dialog_box_container :obj_spawnscriptnow \{demo_timeout_check
					params = {
						func = ui_freeplay_exit_demo_warning_cancel
					}}
			endif
		endif
	endif
endscript

script ui_freeplay_exit_demo_warning_cancel 
	destroy_dialog_box
	change \{freeplay_demo_quit_warning_shown = 0}
	launchevent \{type = focus
		target = current_menu}
endscript

script ui_freeplay_exit_demo_warning_confirm 
	destroy_dialog_box
	do_demo_outro
endscript
