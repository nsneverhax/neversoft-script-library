
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
		if ($kiosk_demo = 1)
			change \{freeplay_time_before_automatic_dropout = 60}
		endif
	endif
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
	change \{game_mode = freeplay}
	change \{attract_sound_state = start}
	change \{freeplay_primary_vocalist = -1}
	change \{respond_to_signin_changed = 0}
	change \{respond_to_signin_changed_func = ui_signin_changed_func}
	change \{load_song_synchronous = true}
	if NOT gotparam \{boot}
		persistent_band_force_traditional_band
	endif
	getmaxlocalplayers
	player = 1
	begin
	setplayerinfo <player> in_game = 1
	setplayerinfo <player> interactive = 0
	setplayerinfo <player> scoring = 0
	setplayerinfo <player> freeplay_state = dropped
	setplayerinfo <player> highway_position = center
	setplayerinfo <player> vocals_highway_view = scrolling
	setplayerinfo <player> controller = (<player> - 1)
	setplayerinfo <player> is_onscreen = 1
	if demobuild
		if ($kiosk_demo = 1)
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
	load_saved_extras_states_for_player player = <player> controller = <controller> leader = <leader> dont_reset_cheats
	player = (<player> + 1)
	repeat <max_players>
	get_savegame_from_controller controller = ($primary_controller)
	ui_options_audio_set_dolby_digital savegame = <savegame>
	update_all_volumes_savegame savegame = <savegame>
	if NOT gotparam \{boot}
		gman_songfunc \{func = clear_play_list}
	endif
	mark_unsafe_for_shutdown
	unpausegame
	if NOT gotparam \{boot}
		freeplay_next_song \{initial_song_list = true}
	endif
	spawnscriptnow ui_create_freeplay_spawned params = {freeplay_auto_join_device = <freeplay_auto_join_device>}
endscript

script ui_create_freeplay_spawned 
	formattext checksumname = venue_checksum 'venue_%s' s = ($levelzones.($current_level).name)
	getglobaltags <venue_checksum> param = unlocked savegame = ($primary_controller)
	if NOT (<unlocked> = 1)
		create_loading_screen
		quickplay_choose_random_venue
	endif
	start_gem_scroller
	fadetoblack \{off
		time = 1.0
		no_wait}
	ui_event event = menu_change data = {state = uistate_gameplay freeplay_auto_join_device = <freeplay_auto_join_device>}
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
		back_script = ui_freeplay_exit_demo
	else
		jump_in_script = ui_freeplay_jump_in
		back_script = nullscript
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
		change \{beginning_of_freeplay_highway_up = 1}
		launchevent type = pad_btn_top target = freeplay_join_event_handler data = {device_num = <freeplay_auto_join_device> auto_join = true}
	endif
endscript

script ui_freeplay_handle_start 
	getmaxlocalplayers
	player = 1
	begin
	getplayerinfo <player> controller
	if (<device_num> = <controller>)
		getplayerinfo <player> freeplay_state
		if (<freeplay_state> = paused)
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
			if NOT scriptisrunning \{preload_song}
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
	getmaxlocalplayers
	getcontrollertype controller = <device_num>
	player = 1
	begin
	getplayerinfo <player> freeplay_state
	if NOT (<freeplay_state> = dropped)
		getplayerinfo <player> controller
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
	if (<controller> != <device_num>)
		scriptassert \{qs(0x297a72c1)}
	endif
	if (<auto_join> = false)
		ui_sfx_freeplay type = start player = <player>
	endif
	freeplay_start_jump_player_in player = <player> controller = <device_num> auto_join = <auto_join>
endscript

script ui_freeplay_main_menu 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	soundevent \{event = endofsong_camera_cheer_quiet}
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
		requireparams \{[
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
				change \{freeplay_demo_quit_warning_shown = 1}
				create_dialog_box {
					player_device = <device_num>
					no_background
					heading_text = qs(0x3e1679fb)
					body_text = qs(0xbfe84c6a)
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
	freeplay_setup_root_helper_pills
endscript

script ui_freeplay_exit_demo_warning_confirm 
	destroy_dialog_box
	do_demo_outro
endscript
