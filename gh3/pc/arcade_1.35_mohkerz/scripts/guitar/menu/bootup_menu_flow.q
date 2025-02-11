respond_to_signin_changed = 0
lamp_brightness_level = 1
no_fail_mode = 0
autoplay_mode_enabled = 0
autoplay_miss_percent = 4.0
autoplay_miss_percent2 = 4.0
coinup_enabled = 1
micdata_enabled = 0
bootup_sequence_fs = {
	create = start_bootup_sequence
	Destroy = end_bootup_sequence
	actions = [
		{
			action = skip_bootup_sequence
			flow_state_func = process_signin_complete
		}
	]
}
bootup_press_any_button_fs = {
	create = create_press_any_button_menu
	Destroy = destroy_press_any_button_menu
	actions = [
		{
			action = enter_attract_mode
			flow_state = bootup_attract_mode_fs
		}
		{
			action = continue
			flow_state_func = process_signin_complete
		}
	]
}
bootup_query_autologin_fs = {
	create = create_network_prompt_menu
	Destroy = destroy_network_prompt_menu
	actions = [
		{
			action = select_startup_go_online
			flow_state = online_winport_start_connection_fs
		}
		{
			action = select_startup_stay_offline
			flow_state_func = process_signin_complete
		}
	]
}
bootup_attract_mode_fs = {
	create = create_attract_mode
	Destroy = destroy_attract_mode
	actions = [
		{
			action = exit_attract_mode
			flow_state_func = process_signin_complete
		}
	]
}
legal_timer = 0

script start_legal_timer 
	Change \{legal_timer = 0}
	Wait \{6
		Seconds}
	Change \{legal_timer = 1}
endscript

script wait_for_legal_timer 
	if NotCD
		if ($show_movies = 0)
			return
		endif
	endif
	begin
	if ($legal_timer = 1)
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script bootup_sequence 
	Change \{primary_controller = 0}
	Change \{primary_controller_assigned = 1}
	Change structurename = player1_status controller = ($primary_controller)
	Change \{structurename = player2_status
		controller = 1}
	wait_for_legal_timer
	StartRendering
	if NotIsMacPort
	endif
	SpawnScriptNow \{ui_flow_manager_respond_to_action
		params = {
			action = skip_bootup_sequence
			play_sound = 0
		}}
endscript

script start_bootup_sequence 
	if NotCD
		if ($show_movies = 0)
			StartRendering
			SpawnScriptNow \{ui_flow_manager_respond_to_action
				params = {
					action = skip_bootup_sequence
					play_sound = 0
				}}
			return
		endif
	endif
	SpawnScriptNow \{bootup_sequence}
endscript

script end_bootup_sequence 
endscript

script check_signin_change_monitor_flag 
	if ($respond_to_signin_changed = 0)
		ScriptAssert \{"check_signin_change_monitor_flag failed"}
	endif
endscript

script start_checking_for_signin_change 
	printf \{"start_checking_for_signin_change"}
	printscriptinfo \{"start_checking_for_signin_change"}
	printf \{"start_checking_for_signin_change - killing sysnotifys"}
	KillSpawnedScript \{Name = sysnotify_handle_signin_change}
	printf \{"start_checking_for_signin_change - begin"}
	Change \{respond_to_signin_changed = 1}
	Change \{menu_select_difficulty_first_time = 1}
endscript

script bootup_check_autologin 
	KillSpawnedScript \{Name = attract_mode_spawner}
	Change \{enable_saving = 1}
	if GotParam \{device_num}
		printf "bootup_check_autologin: changing primary_controller to %d" d = <device_num>
		Change primary_controller = <device_num>
		Change \{primary_controller_assigned = 1}
		Change structurename = player1_status controller = ($primary_controller)
	endif
	NetSessionFunc \{func = GetAutoLoginSetting}
	if (<autoLoginSetting> = autoLoginOff || $is_demo_mode = 1)
		process_signin_complete
		return flow_state = <flow_state>
	endif
	if (<autoLoginSetting> = autoLoginOn)
		return \{flow_state = online_winport_start_connection_fs}
	endif
	return \{flow_state = bootup_query_autologin_fs}
endscript

script process_signin_complete 
	RefreshSigninStatus
	if isXenon
		StartGameProfileSettingsRead
		begin
		if GameProfileSettingsFinished
			break
		endif
		repeat
	endif
	if GotParam \{device_num}
		printf "process_signin_complete: changing primary_controller to %d" d = <device_num>
		Change primary_controller = <device_num>
		Change \{primary_controller_assigned = 1}
	else
		printf \{"process_signin_complete: no device_num identified, let's punt"}
	endif
	return \{flow_state = bootup_do_memcard_sequence_fs}
endscript
ps3_signin_complete = 0

script wait_for_blade_complete 
	if isXenon
		wait_for_sysnotify_unpause
	else
		begin
		if (1 = $ps3_signin_complete)
			break
		endif
		Wait \{1
			Frame}
		repeat
	endif
endscript

script signin_complete_callback 
	Change \{ps3_signin_complete = 1}
endscript
bootup_signin_warning_fs = {
	create = create_signin_warning_menu
	Destroy = destroy_signin_warning_menu
	actions = [
		{
			action = select_continue_without_saving
			flow_state = bootup_using_guitar_controller_fs
		}
		{
			action = select_choose_storage_device
			flow_state_func = bootup_check_for_sign_in
		}
		{
			action = select_continue_without_signing_in
			flow_state = bootup_signin_complete_message
		}
	]
}
bootup_do_memcard_sequence_fs = {
	create = memcard_sequence_begin_bootup
	create_params = {
		StorageSelectorForce = 1
	}
	Destroy = memcard_sequence_cleanup_generic
	actions = [
		{
			action = memcard_sequence_save_success
			flow_state = main_menu_fs
		}
		{
			action = memcard_sequence_save_failed
			flow_state = main_menu_fs
		}
		{
			action = memcard_sequence_load_success
			flow_state = main_menu_fs
		}
		{
			action = memcard_sequence_load_failed
			flow_state = main_menu_fs
		}
	]
}

script bootup_audits_update 
	which_dip_switches = 0
	randomize
	GlobalTags_UnlockAll \{SongList = GH3_General_Songs}
	GetGlobalTags \{arcade_audits}
	<arcade_total_boots> = (<arcade_total_boots> + 1)
	<arcade_boot_time> = 0.0
	SetGlobalTags arcade_audits params = {arcade_total_boots = <arcade_total_boots> , arcade_boot_time = <arcade_boot_time>}
	check_rt_guitars
	create_rt_guitar_watch_stuff
	GetGlobalTags \{arcade_audits}
	Change player1_device = (<arcade_left_guitar_device>)
	Change player2_device = (<arcade_right_guitar_device>)
	GetGlobalTags \{arcade_hardware_adjustments}
	Change lamp_brightness_level = <arcade_lamp_brightness_level>
	Change no_fail_mode = <arcade_no_fail>
	Change structurename = player1_status star_tilt_threshold_di = <arcade_tilt_p1>
	Change structurename = player2_status star_tilt_threshold_di = <arcade_tilt_p2>
	checkdipswitches
	if (<dip_switches_1> != 0 || <dip_switches_2> != 0)
		if (<dip_switches_1> != 0)
			GetArraySize ($disney_restricted_songs)
			i = 0
			begin
			Progression_RestrictSong tier_global = GH3_General_Songs song = ($disney_restricted_songs [<i>]) restricted = 1
			<i> = (<i> + 1)
			repeat <array_Size>
			<which_dip_switches> = (<which_dip_switches> + 1)
		endif
		if (<dip_switches_2> != 0)
			GetArraySize ($chuck_restricted_songs)
			i = 0
			begin
			Progression_RestrictSong tier_global = GH3_General_Songs song = ($chuck_restricted_songs [<i>]) restricted = 1
			<i> = (<i> + 1)
			repeat <array_Size>
			<which_dip_switches> = (<which_dip_switches> + 2)
		endif
		Change \{g_cs_num_icons = 8}
		Change family_mode_enabled = (<which_dip_switches>)
		memcard_sequence_begin_autosave
		memcard_sequence_cleanup_generic \{display_anything = 0}
	endif
	if ($autoplay_mode_enabled = 1)
		SpawnScriptNow \{autoplay_input}
	endif
	donglecreditread
	if (<dongle_success> = 1)
		if (<coin_count> < 0)
			coin_reset = (0 - <coin_count>)
			donglecreditadd coins = <coin_reset>
		endif
	endif
endscript
bootup_autologin_save_fs = {
	create = create_autologin_prompt_menu
	Destroy = destroy_autologin_prompt_menu
	actions = [
		{
			action = continue
			flow_state_func = bootup_autologin_complete
		}
	]
}

script bootup_autologin_complete 
	process_signin_complete
	return flow_state = <flow_state>
endscript
bootup_using_guitar_controller_fs = {
	create = create_using_guitar_controller_menu
	Destroy = destroy_using_guitar_controller_menu
	actions = [
		{
			action = continue
			flow_state = main_menu_fs
		}
	]
}
bootup_using_keyboard_fs = {
	create = create_using_guitar_controller_menu
	create_params = {
		keyboard = 1
	}
	Destroy = destroy_using_guitar_controller_menu
	actions = [
		{
			action = continue
			flow_state = bootup_audio_calibrate_reminder_fs
		}
	]
}
bootup_audio_calibrate_reminder_fs = {
	create = winport_create_audio_calibrate_reminder
	Destroy = winport_destroy_audio_calibrate_reminder
	actions = [
		{
			action = continue
			flow_state = main_menu_fs
		}
	]
}
bootup_download_scan_fs = {
	create = create_download_scan_menu
	Destroy = destroy_download_scan_menu
	actions = [
		{
			action = continue
			flow_state = main_menu_fs
		}
	]
}
bootup_signin_complete_message = {
	create = create_signin_complete_menu
	Destroy = destroy_signin_complete_menu
	actions = [
		{
			action = continue
			flow_state_func = process_signin_complete
		}
	]
}
bootup_serial = {
	create = create_serial_menu
	Destroy = destroy_serial_menu
	actions = [
		{
			action = continue
			flow_state = bootup_check_crc
		}
	]
}
bootup_check_crc = {
	create = create_crc_menu
	Destroy = destroy_crc_menu
	actions = [
		{
			action = continue
			flow_state = bootup_check_rt_guitar_mating
		}
	]
}
bootup_check_rt_guitar_mating = {
	create = bootup_rt_check_guitars
	actions = [
		{
			action = rt_guitar_not_mated
			flow_state = bootup_rt_mate_guitars
		}
		{
			action = continue
			func = bootup_audits_update
			flow_state = attract_sequence_start_fs
		}
	]
}
bootup_rt_mate_guitars = {
	create = create_rt_guitar_mating_screen
	create_params = {
		mate_guitars = 1
	}
	Destroy = destroy_rt_guitar_mating_screen
	actions = [
		{
			action = continue
			func = bootup_audits_update
			flow_state = attract_sequence_start_fs
		}
	]
}

script bootup_rt_check_guitars 
	printf \{"bootup_rt_check_guitars: Checking for unmated guitars"}
	check_rt_guitars
	if (<unmated_controllers> > 0)
		SpawnScriptNow \{ui_flow_manager_respond_to_action
			params = {
				action = rt_guitar_not_mated
			}}
	else
		SpawnScriptNow \{ui_flow_manager_respond_to_action
			params = {
				action = continue
			}}
	endif
endscript
is_shutdown_safe = 1

script mark_unsafe_for_shutdown 
	Change \{is_shutdown_safe = 0}
endscript

script mark_safe_for_shutdown 
	Change \{is_shutdown_safe = 1}
	unpausespawnedscript \{wait_for_safe_shutdown}
endscript

script wait_for_safe_shutdown 
	begin
	if ($is_shutdown_safe = 1)
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script handle_signin_changed 
	printf \{"handle_signin_changed"}
	Change \{respond_to_signin_changed = 0}
	wait_for_safe_shutdown
	printf \{"handle_signin_changed started"}
	disable_pause
	StopRendering
	shutdown_game_for_signin_change \{signin_change = 1}
	LaunchEvent \{Type = unfocus
		target = root_window}
	create_signin_changed_menu
	StartRendering
	printf \{"handle_signin_changed end"}
endscript

script signing_change_confirm_reboot 
	printf \{"signing_change_confirm_reboot"}
	destroy_signin_changed_menu
	Wait \{5
		gameframes}
	start_flow_manager \{flow_state = bootup_press_any_button_fs}
	printf \{"signing_change_confirm_reboot end"}
endscript
shutdown_game_for_signin_change_flag = 0

script shutdown_game_for_signin_change \{unloadcontent = 1
		signin_change = 0}
	printf \{"shutdown_game_for_signin_change"}
	Change \{shutdown_game_for_signin_change_flag = 1}
	StopAllSounds
	KillSpawnedScript \{Name = online_menu_init}
	KillSpawnedScript \{Name = do_calibration_update}
	KillSpawnedScript \{Name = cl_do_ping}
	KillSpawnedScript \{Name = kill_off_and_finish_calibration}
	KillSpawnedScript \{Name = menu_calibrate_lag_create_circles}
	set_demonware_failed
	KillSpawnedScript \{Name = create_leaderboard_menu2}
	KillSpawnedScript \{Name = create_leaderboard_menu3}
	KillSpawnedScript \{Name = add_leaderboard_rows_to_menu}
	shutdown_options_video_monitor
	destroy_alert_popup \{Force = 1}
	end_practice_song_slomo
	destroy_loading_screen
	destroy_top_rockers_loading_screen
	memcard_sequence_cleanup_generic
	destroy_leaving_lobby_dialog
	menu_store_go_back
	destroy_menu \{menu_id = select_style_container}
	destroy_menu \{menu_id = select_style_container_p2}
	shut_down_character_hub
	quit_network_game_early \{signin_change}
	tutorial_shutdown
	shut_down_flow_manager \{Player = 1
		resetstate}
	shut_down_flow_manager \{Player = 2
		resetstate}
	store_monitor_goal_guitar_finish
	DeRegisterAtoms
	kill_gem_scroller \{no_render = 1}
	progression_push_current \{Force = 1}
	clean_up_user_control_helpers
	menu_music_off
	unload_songqpak
	SetPakManCurrentBlock \{map = zones
		pak = None
		block_scripts = 1}
	destroy_band \{unload_paks}
	destroy_downloads_EnumContent
	if (<unloadcontent> = 1)
		Downloads_UnloadContent
		ClearGlobalTags
		setup_globaltags
	endif
	if (<signin_change> = 1)
		clear_cheats
	endif
	if ScreenElementExists \{id = ready_container_p2}
		DestroyScreenElement \{id = ready_container_p2}
	endif
	set_default_misc_globals
	cleanup_songwon_event
	destroy_menu_transition
	UnPauseGame
	Change \{shutdown_game_for_signin_change_flag = 0}
	printf \{"shutdown_game_for_signin_change end"}
endscript

script cleanup_songwon_event 
	destroy_menu \{menu_id = yourock_text}
	destroy_menu \{menu_id = yourock_text_2}
	destroy_menu \{menu_id = yourock_text_legend}
	KillSpawnedScript \{Name = jiggle_text_array_elements}
	KillSpawnedScript \{Name = You_Rock_Waiting_Crowd_SFX}
	KillSpawnedScript \{Name = GuitarEvent_SongWon_Spawned}
endscript

script set_default_misc_globals 
	Change \{show_boss_helper_screen = 0}
	Change \{use_last_player_scores = 0}
	Change \{old_song = None}
	Change \{devil_finish = 0}
	Change \{battle_sudden_death = 0}
	Change \{menu_flow_locked = 0}
	Change \{coop_dlc_active = 0}
endscript
in_crc_menu = 0

script create_crc_menu 
	GetGlobalTags \{arcade_crc_adjustments}
	if (<arcade_run_crc_check> = 0)
		SpawnScriptNow \{ui_flow_manager_respond_to_action
			params = {
				action = continue
			}}
		return
	endif
	Change \{in_crc_menu = 1}
	disable_coin_display
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = crc_container
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	displaySprite \{parent = crc_container
		tex = brick_bg
		Pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		just = [
			center
			center
		]
		z = 96}
	displaySprite \{parent = crc_container
		tex = Dialog_Title_BG
		flip_v
		Pos = (416.0, 15.0)
		dims = (224.0, 224.0)
		z = 100}
	displaySprite \{parent = crc_container
		tex = Dialog_Title_BG
		Pos = (640.0, 15.0)
		dims = (224.0, 224.0)
		z = 100}
	create_pause_menu_frame \{parent = crc_container
		z = 97
		x_scale = 1.4
		y_scale = 1.4}
	create_popup_warning_text \{title = "CRC CHECK"
		parent = crc_container
		z = 99
		Pos = (640.0, 132.0)}
	displayText \{parent = crc_container
		text = "Checking..."
		Pos = (346.0, 230.0)
		just = [
			left
			top
		]
		font = text_a4
		z = 110
		Scale = 0.5
		rgba = [
			210
			130
			0
			250
		]}
	CreateScreenElement \{Type = TextElement
		parent = crc_container
		font = text_a4
		Scale = (0.5, 0.5)
		text = "STARTING"
		id = current_crc_file
		Pos = (450.0, 230.0)
		just = [
			left
			top
		]
		z_priority = 110
		rgba = [
			210
			130
			0
			250
		]}
	CreateScreenElement \{Type = TextElement
		parent = crc_container
		font = text_a4
		Scale = (0.5, 0.5)
		text = "THESE FILES ARE DAMAGED OR MISSING!!!"
		id = failed_crc_title
		Pos = (450.0, 270.0)
		just = [
			left
			top
		]
		z_priority = 110
		rgba = [
			210
			0
			0
			250
		]
		alpha = 0}
	i = 0
	p = (450.0, 310.0)
	begin
	formatText checksumName = failed_text 'failed_crc_file_%d' d = <i>
	CreateScreenElement {
		Type = TextElement
		parent = crc_container
		font = text_a4
		Scale = (0.5, 0.5)
		text = ""
		id = <failed_text>
		Pos = <p>
		just = [left top]
		z_priority = 110
		rgba = [210 0 0 250]
	}
	<i> = (<i> + 1)
	<p> = (<p> + (0.0, 20.0))
	repeat 10
	CreateScreenElement {
		Type = TextElement
		parent = crc_container
		font = text_a4
		Scale = (0.5, 0.5)
		text = "..."
		id = failed_crc_cap
		Pos = <p>
		just = [left top]
		z_priority = 110
		rgba = [210 0 0 250]
		alpha = 0
	}
	displaySprite \{parent = crc_container
		tex = Dialog_BG
		z = 100
		Pos = (640.0, 590.0)
		just = [
			center
			center
		]
		Scale = (2.0, 1.25)}
	displaySprite \{parent = crc_container
		tex = Dialog_BG
		flip_h
		z = 100
		Pos = (640.0, 640.0)
		just = [
			center
			center
		]
		Scale = (2.0, 1.25)}
	CreateScreenElement \{Type = TextElement
		parent = crc_container
		font = fontgrid_title_gh3
		text = "CHECK IN PROGRESS"
		id = crc_status_text
		Pos = (640.0, 625.0)
		just = [
			center
			center
		]
		z_priority = 110
		rgba = [
			180
			50
			50
			255
		]
		noshadow}
	Wait \{1
		Seconds}
	SpawnScriptNow \{iterate_crc_files}
endscript

script destroy_crc_menu 
	destroy_menu \{menu_id = crc_container}
	destroy_pause_menu_frame
	Change \{in_crc_menu = 0}
endscript

script iterate_crc_files 
	failed_crc_count = 0
	crc_file_missing = 0
	crc_success = 1
	current_crc_file_text = nothingyet
	current_crc_dir_text = nothingyet
	OpenCRCFiles
	if (<crc_success> = -1)
		<crc_file_missing> = 1
		failed_crc_title :SetProps \{alpha = 1
			text = "CRC FILE LIST IS MISSING!!!"}
	else
		begin
		UpdateCRCFiles
		formatText TextName = new_current_crc_dir_text "%d" d = <current_crc_dir_text>
		formatText TextName = new_current_crc_file_text "%d" d = <current_crc_file_text>
		printf "iterate_crc_files: new_current_crc_dir_text = %a" a = <new_current_crc_dir_text>
		current_crc_file :SetProps text = <new_current_crc_dir_text>
		if (<eof> = 1)
			formatText \{TextName = new_current_crc_dir_text
				"COMPLETE"}
			printf "iterate_crc_files: new_current_crc_dir_text = %a" a = <new_current_crc_dir_text>
			current_crc_file :SetProps text = <new_current_crc_dir_text>
			break
		endif
		if (<crc_success> = -1)
			failed_crc_title :SetProps \{alpha = 1}
			formatText checksumName = failed_text 'failed_crc_file_%d' d = <failed_crc_count>
			if ScreenElementExists id = <failed_text>
				formatText TextName = crc_error_message "%s" s = <new_current_crc_file_text>
				<failed_text> :SetProps text = <crc_error_message>
				<failed_crc_count> = (<failed_crc_count> + 1)
			elseif (<failed_crc_count> >= 10)
				failed_crc_cap :SetProps \{alpha = 1}
			endif
		endif
		Wait \{1
			gameframe}
		repeat
		CloseCRCFiles
	endif
	if (<failed_crc_count> = 0 && <crc_file_missing> = 0)
		crc_status_text :SetProps \{text = "CRC CHECK COMPLETE"}
		GetGlobalTags \{arcade_crc_adjustments}
		<arcade_run_crc_check> = 0
		SetGlobalTags arcade_crc_adjustments params = {arcade_run_crc_check = <arcade_run_crc_check>}
		memcard_sequence_begin_autosave
		memcard_sequence_cleanup_generic \{display_anything = 0}
		Wait \{4
			Seconds}
		SpawnScriptNow \{ui_flow_manager_respond_to_action
			params = {
				action = continue
			}}
	else
		crc_status_text :SetProps \{text = "REINSTALL SOFTWARE!"}
	endif
endscript

script service_display 
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = service_container
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	CreateScreenElement \{Type = SpriteElement
		parent = service_container
		texture = Options_Controller_Poster2
		rgba = [
			255
			0
			0
			255
		]
		Pos = (640.0, 360.0)
		Scale = 2
		just = [
			center
			center
		]
		z_priority = 1000000
		rot_angle = -4}
	displayText \{parent = service_container
		text = "SERVICE MODE"
		Pos = (640.0, 340.0)
		just = [
			center
			center
		]
		z = 1000001
		rgba = [
			255
			255
			255
			255
		]
		Scale = 2.5
		font = text_a4
		rot = -2}
	sd_counter = 600
	begin
	if ($is_test_mode = 1 || $in_crc_menu = 1 || $in_rt_guitar_menu = 1)
		service_container :SetProps \{alpha = 0}
	else
		if (<sd_counter> > 420)
			service_container :SetProps \{alpha = 1}
			<sd_counter> = (<sd_counter> - 1)
		elseif (<sd_counter> > 0)
			service_container :SetProps \{alpha = 0}
			<sd_counter> = (<sd_counter> - 1)
		else
			<sd_counter> = 600
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script autoplay_input 
	random_ticks_value = 0
	begin
	current_flow_state_name = ($ui_flow_manager_state [0])
	current_flow_state = (<current_flow_state_name>)
	current_flow_state_name2 = ($ui_flow_manager_state [1])
	current_flow_state2 = (<current_flow_state_name2>)
	if StructureContains structure = <current_flow_state> Name
		if ((<current_flow_state>.Name) = "arcadeplay_multiplayer_wait_fs")
			begin
			current_flow_state_name = ($ui_flow_manager_state [0])
			current_flow_state = (<current_flow_state_name>)
			if ((<current_flow_state>.Name) != "arcadeplay_multiplayer_wait_fs")
				break
			endif
			GetRandomValue \{Name = random_flip
				integer
				a = 0
				b = 3}
			if (<random_flip> = 0)
				PressStartTwo
			else
				LaunchEvent \{Type = pad_back}
			endif
			GetRandomValue \{Name = random_delay
				integer
				a = 15
				b = 240}
			begin
			if ((<current_flow_state>.Name) != "arcadeplay_multiplayer_wait_fs")
				break
			endif
			Wait \{1
				gameframe}
			repeat <random_delay>
			repeat
		elseif ((<current_flow_state>.Name) = "arcadeplay_select_difficulty_fs")
			GetRandomValue \{Name = random_ticks
				integer
				a = 15
				b = 600}
			<random_ticks_value> = <random_ticks>
			begin
			current_flow_state_name = ($ui_flow_manager_state [0])
			current_flow_state = (<current_flow_state_name>)
			if ((<current_flow_state>.Name) != "arcadeplay_select_difficulty_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			GetRandomValue \{Name = random_flip
				integer
				a = 0
				b = 1}
			if (<random_flip> = 0)
				LaunchEvent \{Type = pad_up}
			else
				LaunchEvent \{Type = pad_down}
			endif
			GetRandomValue \{Name = random_delay
				integer
				a = 15
				b = 240}
			begin
			if ((<current_flow_state>.Name) != "arcadeplay_select_difficulty_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			<random_ticks_value> = (<random_ticks_value> - 1)
			Wait \{1
				gameframe}
			repeat <random_delay>
			repeat
			if ((<current_flow_state>.Name) = "arcadeplay_select_difficulty_fs")
				LaunchEvent \{Type = pad_choose}
			endif
		elseif ((<current_flow_state>.Name) = "arcadeplay_select_character_fs")
			GetRandomValue \{Name = random_ticks
				integer
				a = 15
				b = 600}
			<random_ticks_value> = <random_ticks>
			begin
			current_flow_state_name = ($ui_flow_manager_state [0])
			current_flow_state = (<current_flow_state_name>)
			if ((<current_flow_state>.Name) != "arcadeplay_select_character_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			GetRandomValue \{Name = random_flip
				integer
				a = 0
				b = 8}
			if (<random_flip> >= 0 && <random_flip> < 4)
				LaunchEvent \{Type = pad_up}
			elseif (<random_flip> >= 4 && <random_flip> < 8)
				LaunchEvent \{Type = pad_down}
			else
				LaunchEvent \{Type = pad_L1}
			endif
			GetRandomValue \{Name = random_delay
				integer
				a = 15
				b = 240}
			begin
			if ((<current_flow_state>.Name) != "arcadeplay_select_character_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			<random_ticks_value> = (<random_ticks_value> - 1)
			Wait \{1
				gameframe}
			repeat <random_delay>
			repeat
			if ((<current_flow_state>.Name) = "arcadeplay_select_character_fs")
				LaunchEvent \{Type = pad_choose}
			endif
		elseif ((<current_flow_state>.Name) = "arcadeplay_character_hub_fs")
			GetRandomValue \{Name = random_ticks
				integer
				a = 15
				b = 300}
			<random_ticks_value> = <random_ticks>
			begin
			current_flow_state_name = ($ui_flow_manager_state [0])
			current_flow_state = (<current_flow_state_name>)
			if ((<current_flow_state>.Name) != "arcadeplay_character_hub_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			GetRandomValue \{Name = random_flip
				integer
				a = 0
				b = 8}
			if (<random_flip> >= 0 && <random_flip> < 4)
				LaunchEvent \{Type = pad_up}
			elseif (<random_flip> >= 4 && <random_flip> < 8)
				LaunchEvent \{Type = pad_down}
			else
				LaunchEvent \{Type = pad_L1}
			endif
			GetRandomValue \{Name = random_delay
				integer
				a = 15
				b = 240}
			begin
			if ((<current_flow_state>.Name) != "arcadeplay_character_hub_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			<random_ticks_value> = (<random_ticks_value> - 1)
			Wait \{1
				gameframe}
			repeat <random_delay>
			repeat
			if ((<current_flow_state>.Name) = "arcadeplay_character_hub_fs")
				LaunchEvent \{Type = pad_choose}
			endif
		elseif ((<current_flow_state>.Name) = "arcadeplay_select_outfit_fs")
			GetRandomValue \{Name = random_ticks
				integer
				a = 15
				b = 300}
			<random_ticks_value> = <random_ticks>
			begin
			current_flow_state_name = ($ui_flow_manager_state [0])
			current_flow_state = (<current_flow_state_name>)
			if ((<current_flow_state>.Name) != "arcadeplay_select_outfit_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			GetRandomValue \{Name = random_flip
				integer
				a = 0
				b = 8}
			if (<random_flip> >= 0 && <random_flip> < 4)
				LaunchEvent \{Type = pad_up}
			elseif (<random_flip> >= 4 && <random_flip> < 8)
				LaunchEvent \{Type = pad_down}
			else
				LaunchEvent \{Type = pad_L1}
			endif
			GetRandomValue \{Name = random_delay
				integer
				a = 15
				b = 240}
			begin
			if ((<current_flow_state>.Name) != "arcadeplay_select_outfit_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			<random_ticks_value> = (<random_ticks_value> - 1)
			Wait \{1
				gameframe}
			repeat <random_delay>
			repeat
			if ((<current_flow_state>.Name) = "arcadeplay_select_outfit_fs")
				LaunchEvent \{Type = pad_choose}
			endif
		elseif ((<current_flow_state>.Name) = "arcade_select_style_fs")
			GetRandomValue \{Name = random_ticks
				integer
				a = 15
				b = 300}
			<random_ticks_value> = <random_ticks>
			begin
			current_flow_state_name = ($ui_flow_manager_state [0])
			current_flow_state = (<current_flow_state_name>)
			if ((<current_flow_state>.Name) != "arcade_select_style_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			GetRandomValue \{Name = random_flip
				integer
				a = 0
				b = 8}
			if (<random_flip> >= 0 && <random_flip> < 4)
				LaunchEvent \{Type = pad_up}
			elseif (<random_flip> >= 4 && <random_flip> < 8)
				LaunchEvent \{Type = pad_down}
			else
				LaunchEvent \{Type = pad_L1}
			endif
			GetRandomValue \{Name = random_delay
				integer
				a = 15
				b = 240}
			begin
			if ((<current_flow_state>.Name) != "arcade_select_style_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			<random_ticks_value> = (<random_ticks_value> - 1)
			Wait \{1
				gameframe}
			repeat <random_delay>
			repeat
			if ((<current_flow_state>.Name) = "arcade_select_style_fs")
				LaunchEvent \{Type = pad_choose}
			endif
		elseif ((<current_flow_state>.Name) = "arcadeplay_select_guitar_fs")
			GetRandomValue \{Name = random_ticks
				integer
				a = 15
				b = 300}
			<random_ticks_value> = <random_ticks>
			begin
			current_flow_state_name = ($ui_flow_manager_state [0])
			current_flow_state = (<current_flow_state_name>)
			if ((<current_flow_state>.Name) != "arcadeplay_select_guitar_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			GetRandomValue \{Name = random_flip
				integer
				a = 0
				b = 8}
			if (<random_flip> >= 0 && <random_flip> < 4)
				LaunchEvent \{Type = pad_up}
			elseif (<random_flip> >= 4 && <random_flip> < 8)
				LaunchEvent \{Type = pad_down}
			else
				LaunchEvent \{Type = pad_L1}
			endif
			GetRandomValue \{Name = random_delay
				integer
				a = 15
				b = 240}
			begin
			if ((<current_flow_state>.Name) != "arcadeplay_select_guitar_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			<random_ticks_value> = (<random_ticks_value> - 1)
			Wait \{1
				gameframe}
			repeat <random_delay>
			repeat
			if ((<current_flow_state>.Name) = "arcadeplay_select_guitar_fs")
				LaunchEvent \{Type = pad_choose}
			endif
		elseif ((<current_flow_state>.Name) = "arcadeplay_select_guitar_finish_fs")
			GetRandomValue \{Name = random_ticks
				integer
				a = 15
				b = 300}
			<random_ticks_value> = <random_ticks>
			begin
			current_flow_state_name = ($ui_flow_manager_state [0])
			current_flow_state = (<current_flow_state_name>)
			if ((<current_flow_state>.Name) != "arcadeplay_select_guitar_finish_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			GetRandomValue \{Name = random_flip
				integer
				a = 0
				b = 8}
			if (<random_flip> >= 0 && <random_flip> < 4)
				LaunchEvent \{Type = pad_up}
			elseif (<random_flip> >= 4 && <random_flip> < 8)
				LaunchEvent \{Type = pad_down}
			else
				LaunchEvent \{Type = pad_L1}
			endif
			GetRandomValue \{Name = random_delay
				integer
				a = 15
				b = 240}
			begin
			if ((<current_flow_state>.Name) != "arcadeplay_select_guitar_finish_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			<random_ticks_value> = (<random_ticks_value> - 1)
			Wait \{1
				gameframe}
			repeat <random_delay>
			repeat
			if ((<current_flow_state>.Name) = "arcadeplay_select_guitar_finish_fs")
				LaunchEvent \{Type = pad_choose}
			endif
		elseif ((<current_flow_state>.Name) = "arcadeplay_setlist_fs")
			GetRandomValue \{Name = random_ticks
				integer
				a = 15
				b = 1800}
			<random_ticks_value> = <random_ticks>
			begin
			current_flow_state_name = ($ui_flow_manager_state [0])
			current_flow_state = (<current_flow_state_name>)
			if ((<current_flow_state>.Name) != "arcadeplay_setlist_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			GetRandomValue \{Name = random_flip
				integer
				a = 0
				b = 2}
			if (<random_flip> = 0)
				LaunchEvent \{Type = pad_up}
			else
				LaunchEvent \{Type = pad_down}
			endif
			GetRandomValue \{Name = random_flip
				integer
				a = 0
				b = 2}
			if (<random_flip> = 0)
				GetRandomValue \{Name = random_delay
					integer
					a = 30
					b = 120}
			else
				GetRandomValue \{Name = random_delay
					integer
					a = 5
					b = 15}
			endif
			begin
			if ((<current_flow_state>.Name) != "arcadeplay_setlist_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			<random_ticks_value> = (<random_ticks_value> - 1)
			Wait \{1
				gameframe}
			repeat <random_delay>
			repeat
			if ((<current_flow_state>.Name) = "arcadeplay_setlist_fs")
				LaunchEvent \{Type = pad_choose}
			endif
		elseif ((<current_flow_state>.Name) = "arcadeplay_using_guitar_controller_fs")
			GetRandomValue \{Name = random_ticks
				integer
				a = 15
				b = 600}
			<random_ticks_value> = <random_ticks>
			begin
			current_flow_state_name = ($ui_flow_manager_state [0])
			current_flow_state = (<current_flow_state_name>)
			if ((<current_flow_state>.Name) != "arcadeplay_using_guitar_controller_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			<random_ticks_value> = (<random_ticks_value> - 1)
			Wait \{1
				gameframe}
			repeat
			if ((<current_flow_state>.Name) = "arcadeplay_using_guitar_controller_fs")
				LaunchEvent \{Type = pad_choose}
			endif
		elseif ((<current_flow_state>.Name) = "arcadeplay_play_song_fs")
			begin
			current_flow_state_name = ($ui_flow_manager_state [0])
			current_flow_state = (<current_flow_state_name>)
			if ((<current_flow_state>.Name) != "arcadeplay_play_song_fs")
				break
			endif
			GetRandomValue \{Name = random_flip
				integer
				a = 0
				b = 1}
			if (<random_flip> = 0)
				if ($player1_status.star_power_used = 0 && $player1_status.star_power_amount >= 50.0)
					SpawnScriptNow \{star_power_activate_and_drain
						params = {
							player_status = player1_status
							player_text = 'p1'
							Player = 1
						}}
				endif
			endif
			GetRandomValue \{Name = random_delay
				integer
				a = 60
				b = 600}
			begin
			if ((<current_flow_state>.Name) != "arcadeplay_play_song_fs")
				break
			endif
			Wait \{1
				gameframe}
			repeat <random_delay>
			repeat
		elseif ((<current_flow_state>.Name) = "arcadeplay_fail_song_fs")
			GetRandomValue \{Name = random_ticks
				integer
				a = 15
				b = 600}
			<random_ticks_value> = <random_ticks>
			begin
			current_flow_state_name = ($ui_flow_manager_state [0])
			current_flow_state = (<current_flow_state_name>)
			if ((<current_flow_state>.Name) != "arcadeplay_fail_song_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			GetRandomValue \{Name = random_flip
				integer
				a = 0
				b = 1}
			if (<random_flip> = 0)
				LaunchEvent \{Type = pad_up}
			else
				LaunchEvent \{Type = pad_down}
			endif
			GetRandomValue \{Name = random_delay
				integer
				a = 15
				b = 240}
			begin
			if ((<current_flow_state>.Name) != "arcadeplay_fail_song_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			<random_ticks_value> = (<random_ticks_value> - 1)
			Wait \{1
				gameframe}
			repeat <random_delay>
			repeat
			if ((<current_flow_state>.Name) = "arcadeplay_fail_song_fs")
				LaunchEvent \{Type = pad_choose}
			endif
		elseif ((<current_flow_state>.Name) = "arcadeplay_win_song_fs")
			GetRandomValue \{Name = random_ticks
				integer
				a = 15
				b = 600}
			<random_ticks_value> = <random_ticks>
			begin
			current_flow_state_name = ($ui_flow_manager_state [0])
			current_flow_state = (<current_flow_state_name>)
			if ((<current_flow_state>.Name) != "arcadeplay_win_song_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			GetRandomValue \{Name = random_flip
				integer
				a = 0
				b = 1}
			if (<random_flip> = 0)
				LaunchEvent \{Type = pad_up}
			else
				LaunchEvent \{Type = pad_down}
			endif
			GetRandomValue \{Name = random_delay
				integer
				a = 15
				b = 240}
			begin
			if ((<current_flow_state>.Name) != "arcadeplay_win_song_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			<random_ticks_value> = (<random_ticks_value> - 1)
			Wait \{1
				gameframe}
			repeat <random_delay>
			repeat
			if ((<current_flow_state>.Name) = "arcadeplay_win_song_fs")
				LaunchEvent \{Type = pad_choose}
			endif
		elseif ((<current_flow_state>.Name) = "arcadeplay_detailed_stats_fs")
			GetRandomValue \{Name = random_ticks
				integer
				a = 15
				b = 600}
			<random_ticks_value> = <random_ticks>
			begin
			current_flow_state_name = ($ui_flow_manager_state [0])
			current_flow_state = (<current_flow_state_name>)
			if ((<current_flow_state>.Name) != "arcadeplay_detailed_stats_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			GetRandomValue \{Name = random_flip
				integer
				a = 0
				b = 1}
			if (<random_flip> = 0)
				LaunchEvent \{Type = pad_up}
			else
				LaunchEvent \{Type = pad_down}
			endif
			GetRandomValue \{Name = random_delay
				integer
				a = 15
				b = 240}
			begin
			if ((<current_flow_state>.Name) != "arcadeplay_detailed_stats_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			<random_ticks_value> = (<random_ticks_value> - 1)
			Wait \{1
				gameframe}
			repeat <random_delay>
			repeat
			if ((<current_flow_state>.Name) = "arcadeplay_detailed_stats_fs")
				LaunchEvent \{Type = pad_choose}
			endif
		elseif ((<current_flow_state>.Name) = "arcadeplay_toprockers_fs")
			GetRandomValue \{Name = random_ticks
				integer
				a = 15
				b = 1800}
			<random_ticks_value> = <random_ticks>
			begin
			current_flow_state_name = ($ui_flow_manager_state [0])
			current_flow_state = (<current_flow_state_name>)
			if ((<current_flow_state>.Name) != "arcadeplay_toprockers_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			GetRandomValue \{Name = random_flip
				integer
				a = 0
				b = 8}
			if (<random_flip> >= 0 && <random_flip> < 2)
				LaunchEvent \{Type = pad_up}
			elseif (<random_flip> >= 2 && <random_flip> < 6)
				LaunchEvent \{Type = pad_down}
			elseif (<random_flip> >= 6 && <random_flip> < 8)
				LaunchEvent \{Type = pad_choose}
			else
				LaunchEvent \{Type = pad_back}
			endif
			GetRandomValue \{Name = random_flip
				integer
				a = 0
				b = 1}
			if (<random_flip> = 0)
				GetRandomValue \{Name = random_delay
					integer
					a = 5
					b = 15}
			else
				GetRandomValue \{Name = random_delay
					integer
					a = 15
					b = 120}
			endif
			begin
			if ((<current_flow_state>.Name) != "arcadeplay_toprockers_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			<random_ticks_value> = (<random_ticks_value> - 1)
			Wait \{1
				gameframe}
			repeat <random_delay>
			repeat
			if ((<current_flow_state>.Name) = "arcadeplay_toprockers_fs")
				LaunchEvent \{Type = pad_square}
			endif
		elseif ((<current_flow_state>.Name) = "arcadeplay_continue_fs")
			begin
			current_flow_state_name = ($ui_flow_manager_state [0])
			current_flow_state = (<current_flow_state_name>)
			if ((<current_flow_state>.Name) != "arcadeplay_continue_fs")
				break
			endif
			GetRandomValue \{Name = random_flip
				integer
				a = 0
				b = 3}
			if (<random_flip> = 0)
				PressStartOne
			else
				LaunchEvent \{Type = pad_back}
			endif
			GetRandomValue \{Name = random_delay
				integer
				a = 15
				b = 240}
			begin
			if ((<current_flow_state>.Name) != "arcadeplay_continue_fs")
				break
			endif
			Wait \{1
				gameframe}
			repeat <random_delay>
			repeat
		elseif ((<current_flow_state>.Name) = "mp_select_mode_fs")
			GetRandomValue \{Name = random_ticks
				integer
				a = 15
				b = 600}
			<random_ticks_value> = <random_ticks>
			begin
			current_flow_state_name = ($ui_flow_manager_state [0])
			current_flow_state = (<current_flow_state_name>)
			if ((<current_flow_state>.Name) != "mp_select_mode_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			GetRandomValue \{Name = random_flip
				integer
				a = 0
				b = 1}
			if (<random_flip> = 0)
				LaunchEvent \{Type = pad_up}
			else
				LaunchEvent \{Type = pad_down}
			endif
			GetRandomValue \{Name = random_delay
				integer
				a = 15
				b = 240}
			begin
			if ((<current_flow_state>.Name) != "mp_select_mode_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			<random_ticks_value> = (<random_ticks_value> - 1)
			Wait \{1
				gameframe}
			repeat <random_delay>
			repeat
			if ((<current_flow_state>.Name) = "mp_select_mode_fs")
				LaunchEvent \{Type = pad_choose}
			endif
		elseif ((<current_flow_state>.Name) = "mp_faceoff_character_select_fs")
			GetRandomValue \{Name = random_ticks
				integer
				a = 15
				b = 600}
			<random_ticks_value> = <random_ticks>
			begin
			current_flow_state_name = ($ui_flow_manager_state [0])
			current_flow_state = (<current_flow_state_name>)
			if ((<current_flow_state>.Name) != "mp_faceoff_character_select_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			GetRandomValue \{Name = random_flip
				integer
				a = 0
				b = 1}
			if (<random_flip> = 0)
				GetRandomValue \{Name = random_flip
					integer
					a = 0
					b = 8}
				if (<random_flip> >= 0 && <random_flip> < 4)
					LaunchEvent \{Type = pad_up
						data = {
							device_num = $player1_device
						}}
				elseif (<random_flip> >= 4 && <random_flip> < 8)
					LaunchEvent \{Type = pad_down
						data = {
							device_num = $player1_device
						}}
				else
					LaunchEvent \{Type = pad_L1
						data = {
							device_num = $player1_device
						}}
				endif
			else
				GetRandomValue \{Name = random_flip
					integer
					a = 0
					b = 9}
				if (<random_flip> >= 0 && <random_flip> < 4)
					LaunchEvent \{Type = pad_up
						data = {
							device_num = $player2_device
						}}
				elseif (<random_flip> >= 4 && <random_flip> < 8)
					LaunchEvent \{Type = pad_down
						data = {
							device_num = $player2_device
						}}
				elseif (<random_flip> = 8)
					LaunchEvent \{Type = pad_L1
						data = {
							device_num = $player2_device
						}}
				else
					LaunchEvent \{Type = pad_choose
						data = {
							device_num = $player2_device
						}}
				endif
			endif
			GetRandomValue \{Name = random_delay
				integer
				a = 15
				b = 120}
			begin
			if ((<current_flow_state>.Name) != "mp_faceoff_character_select_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			<random_ticks_value> = (<random_ticks_value> - 1)
			Wait \{1
				gameframe}
			repeat <random_delay>
			repeat
			if ((<current_flow_state>.Name) = "mp_faceoff_character_select_fs")
				LaunchEvent \{Type = pad_choose
					data = {
						device_num = $player1_device
					}}
			endif
		elseif ((<current_flow_state>.Name) = "mp_faceoff_character_hub_fs")
			GetRandomValue \{Name = random_ticks
				integer
				a = 15
				b = 300}
			<random_ticks_value> = <random_ticks>
			begin
			current_flow_state_name = ($ui_flow_manager_state [0])
			current_flow_state = (<current_flow_state_name>)
			if ((<current_flow_state>.Name) != "mp_faceoff_character_hub_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			GetRandomValue \{Name = random_choice
				integer
				a = 0
				b = 1}
			if (<random_choice> = 0)
				GetRandomValue \{Name = random_flip
					integer
					a = 0
					b = 8}
				if (<random_flip> >= 0 && <random_flip> < 4)
					LaunchEvent \{Type = pad_up
						data = {
							device_num = $player1_device
						}}
				elseif (<random_flip> >= 4 && <random_flip> < 8)
					LaunchEvent \{Type = pad_down
						data = {
							device_num = $player1_device
						}}
				else
					LaunchEvent \{Type = pad_L1
						data = {
							device_num = $player1_device
						}}
				endif
			else
				GetRandomValue \{Name = random_flip
					integer
					a = 0
					b = 9}
				if (<random_flip> >= 0 && <random_flip> < 4)
					LaunchEvent \{Type = pad_up
						data = {
							device_num = $player2_device
						}}
				elseif (<random_flip> >= 4 && <random_flip> < 8)
					LaunchEvent \{Type = pad_down
						data = {
							device_num = $player2_device
						}}
				elseif (<random_flip> = 8)
					LaunchEvent \{Type = pad_L1
						data = {
							device_num = $player2_device
						}}
				else
					LaunchEvent \{Type = pad_choose
						data = {
							device_num = $player2_device
						}}
				endif
			endif
			GetRandomValue \{Name = random_delay
				integer
				a = 15
				b = 120}
			begin
			if ((<current_flow_state>.Name) != "mp_faceoff_character_hub_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			<random_ticks_value> = (<random_ticks_value> - 1)
			Wait \{1
				gameframe}
			repeat <random_delay>
			repeat
			if ((<current_flow_state>.Name) = "mp_faceoff_character_hub_fs")
				LaunchEvent \{Type = pad_choose
					data = {
						device_num = $player1_device
					}}
			endif
		elseif ((<current_flow_state>.Name) = "mp_faceoff_select_outfit_fs")
			GetRandomValue \{Name = random_ticks
				integer
				a = 15
				b = 300}
			<random_ticks_value> = <random_ticks>
			begin
			current_flow_state_name = ($ui_flow_manager_state [0])
			current_flow_state = (<current_flow_state_name>)
			if ((<current_flow_state>.Name) != "mp_faceoff_select_outfit_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			GetRandomValue \{Name = random_choice
				integer
				a = 0
				b = 1}
			if (<random_choice> = 0)
				GetRandomValue \{Name = random_flip
					integer
					a = 0
					b = 8}
				if (<random_flip> >= 0 && <random_flip> < 4)
					LaunchEvent \{Type = pad_up
						data = {
							device_num = $player1_device
						}}
				elseif (<random_flip> >= 4 && <random_flip> < 8)
					LaunchEvent \{Type = pad_down
						data = {
							device_num = $player1_device
						}}
				else
					LaunchEvent \{Type = pad_L1
						data = {
							device_num = $player1_device
						}}
				endif
			else
				GetRandomValue \{Name = random_flip
					integer
					a = 0
					b = 9}
				if (<random_flip> >= 0 && <random_flip> < 4)
					LaunchEvent \{Type = pad_up
						data = {
							device_num = $player2_device
						}}
				elseif (<random_flip> >= 4 && <random_flip> < 8)
					LaunchEvent \{Type = pad_down
						data = {
							device_num = $player2_device
						}}
				elseif (<random_flip> = 8)
					LaunchEvent \{Type = pad_L1
						data = {
							device_num = $player2_device
						}}
				else
					LaunchEvent \{Type = pad_choose
						data = {
							device_num = $player2_device
						}}
				endif
			endif
			GetRandomValue \{Name = random_delay
				integer
				a = 15
				b = 120}
			begin
			if ((<current_flow_state>.Name) != "mp_faceoff_select_outfit_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			<random_ticks_value> = (<random_ticks_value> - 1)
			Wait \{1
				gameframe}
			repeat <random_delay>
			repeat
			if ((<current_flow_state>.Name) = "mp_faceoff_select_outfit_fs")
				LaunchEvent \{Type = pad_choose
					data = {
						device_num = $player1_device
					}}
			endif
		elseif ((<current_flow_state>.Name) = "mp_faceoff_select_style_fs")
			GetRandomValue \{Name = random_ticks
				integer
				a = 15
				b = 300}
			<random_ticks_value> = <random_ticks>
			begin
			current_flow_state_name = ($ui_flow_manager_state [0])
			current_flow_state = (<current_flow_state_name>)
			if ((<current_flow_state>.Name) != "mp_faceoff_select_style_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			GetRandomValue \{Name = random_choice
				integer
				a = 0
				b = 1}
			if (<random_choice> = 0)
				GetRandomValue \{Name = random_flip
					integer
					a = 0
					b = 8}
				if (<random_flip> >= 0 && <random_flip> < 4)
					LaunchEvent \{Type = pad_up
						data = {
							device_num = $player1_device
						}}
				elseif (<random_flip> >= 4 && <random_flip> < 8)
					LaunchEvent \{Type = pad_down
						data = {
							device_num = $player1_device
						}}
				else
					LaunchEvent \{Type = pad_L1
						data = {
							device_num = $player1_device
						}}
				endif
			else
				GetRandomValue \{Name = random_flip
					integer
					a = 0
					b = 9}
				if (<random_flip> >= 0 && <random_flip> < 4)
					LaunchEvent \{Type = pad_up
						data = {
							device_num = $player2_device
						}}
				elseif (<random_flip> >= 4 && <random_flip> < 8)
					LaunchEvent \{Type = pad_down
						data = {
							device_num = $player2_device
						}}
				elseif (<random_flip> = 8)
					LaunchEvent \{Type = pad_L1
						data = {
							device_num = $player2_device
						}}
				else
					LaunchEvent \{Type = pad_choose
						data = {
							device_num = $player2_device
						}}
				endif
			endif
			GetRandomValue \{Name = random_delay
				integer
				a = 15
				b = 120}
			begin
			if ((<current_flow_state>.Name) != "mp_faceoff_select_style_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			<random_ticks_value> = (<random_ticks_value> - 1)
			Wait \{1
				gameframe}
			repeat <random_delay>
			repeat
			if ((<current_flow_state>.Name) = "mp_faceoff_select_style_fs")
				LaunchEvent \{Type = pad_choose
					data = {
						device_num = $player1_device
					}}
			endif
		elseif ((<current_flow_state>.Name) = "mp_faceoff_select_guitar_fs")
			GetRandomValue \{Name = random_ticks
				integer
				a = 15
				b = 300}
			<random_ticks_value> = <random_ticks>
			begin
			current_flow_state_name = ($ui_flow_manager_state [0])
			current_flow_state = (<current_flow_state_name>)
			if ((<current_flow_state>.Name) != "mp_faceoff_select_guitar_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			GetRandomValue \{Name = random_choice
				integer
				a = 0
				b = 1}
			if (<random_choice> = 0)
				GetRandomValue \{Name = random_flip
					integer
					a = 0
					b = 8}
				if (<random_flip> >= 0 && <random_flip> < 4)
					LaunchEvent \{Type = pad_up
						data = {
							device_num = $player1_device
						}}
				elseif (<random_flip> >= 4 && <random_flip> < 8)
					LaunchEvent \{Type = pad_down
						data = {
							device_num = $player1_device
						}}
				else
					LaunchEvent \{Type = pad_L1
						data = {
							device_num = $player1_device
						}}
				endif
			else
				GetRandomValue \{Name = random_flip
					integer
					a = 0
					b = 9}
				if (<random_flip> >= 0 && <random_flip> < 4)
					LaunchEvent \{Type = pad_up
						data = {
							device_num = $player2_device
						}}
				elseif (<random_flip> >= 4 && <random_flip> < 8)
					LaunchEvent \{Type = pad_down
						data = {
							device_num = $player2_device
						}}
				elseif (<random_flip> = 8)
					LaunchEvent \{Type = pad_L1
						data = {
							device_num = $player2_device
						}}
				else
					LaunchEvent \{Type = pad_choose
						data = {
							device_num = $player2_device
						}}
				endif
			endif
			GetRandomValue \{Name = random_delay
				integer
				a = 15
				b = 120}
			begin
			if ((<current_flow_state>.Name) != "mp_faceoff_select_guitar_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			<random_ticks_value> = (<random_ticks_value> - 1)
			Wait \{1
				gameframe}
			repeat <random_delay>
			repeat
			if ((<current_flow_state>.Name) = "mp_faceoff_select_guitar_fs")
				LaunchEvent \{Type = pad_choose
					data = {
						device_num = $player1_device
					}}
			endif
		elseif ((<current_flow_state>.Name) = "mp_faceoff_select_bass_fs")
			GetRandomValue \{Name = random_ticks
				integer
				a = 15
				b = 300}
			<random_ticks_value> = <random_ticks>
			begin
			current_flow_state_name = ($ui_flow_manager_state [0])
			current_flow_state = (<current_flow_state_name>)
			if ((<current_flow_state>.Name) != "mp_faceoff_select_bass_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			GetRandomValue \{Name = random_choice
				integer
				a = 0
				b = 1}
			if (<random_choice> = 0)
				GetRandomValue \{Name = random_flip
					integer
					a = 0
					b = 8}
				if (<random_flip> >= 0 && <random_flip> < 4)
					LaunchEvent \{Type = pad_up
						data = {
							device_num = $player1_device
						}}
				elseif (<random_flip> >= 4 && <random_flip> < 8)
					LaunchEvent \{Type = pad_down
						data = {
							device_num = $player1_device
						}}
				else
					LaunchEvent \{Type = pad_L1
						data = {
							device_num = $player1_device
						}}
				endif
			else
				GetRandomValue \{Name = random_flip
					integer
					a = 0
					b = 9}
				if (<random_flip> >= 0 && <random_flip> < 4)
					LaunchEvent \{Type = pad_up
						data = {
							device_num = $player2_device
						}}
				elseif (<random_flip> >= 4 && <random_flip> < 8)
					LaunchEvent \{Type = pad_down
						data = {
							device_num = $player2_device
						}}
				elseif (<random_flip> = 8)
					LaunchEvent \{Type = pad_L1
						data = {
							device_num = $player2_device
						}}
				else
					LaunchEvent \{Type = pad_choose
						data = {
							device_num = $player2_device
						}}
				endif
			endif
			GetRandomValue \{Name = random_delay
				integer
				a = 15
				b = 120}
			begin
			if ((<current_flow_state>.Name) != "mp_faceoff_select_bass_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			<random_ticks_value> = (<random_ticks_value> - 1)
			Wait \{1
				gameframe}
			repeat <random_delay>
			repeat
			if ((<current_flow_state>.Name) = "mp_faceoff_select_bass_fs")
				LaunchEvent \{Type = pad_choose
					data = {
						device_num = $player1_device
					}}
			endif
		elseif ((<current_flow_state>.Name) = "mp_faceoff_select_guitar_finish_fs")
			GetRandomValue \{Name = random_ticks
				integer
				a = 15
				b = 300}
			<random_ticks_value> = <random_ticks>
			begin
			current_flow_state_name = ($ui_flow_manager_state [0])
			current_flow_state = (<current_flow_state_name>)
			if ((<current_flow_state>.Name) != "mp_faceoff_select_guitar_finish_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			GetRandomValue \{Name = random_choice
				integer
				a = 0
				b = 1}
			if (<random_choice> = 0)
				GetRandomValue \{Name = random_flip
					integer
					a = 0
					b = 8}
				if (<random_flip> >= 0 && <random_flip> < 4)
					LaunchEvent \{Type = pad_up
						data = {
							device_num = $player1_device
						}}
				elseif (<random_flip> >= 4 && <random_flip> < 8)
					LaunchEvent \{Type = pad_down
						data = {
							device_num = $player1_device
						}}
				else
					LaunchEvent \{Type = pad_L1
						data = {
							device_num = $player1_device
						}}
				endif
			else
				GetRandomValue \{Name = random_flip
					integer
					a = 0
					b = 9}
				if (<random_flip> >= 0 && <random_flip> < 4)
					LaunchEvent \{Type = pad_up
						data = {
							device_num = $player2_device
						}}
				elseif (<random_flip> >= 4 && <random_flip> < 8)
					LaunchEvent \{Type = pad_down
						data = {
							device_num = $player2_device
						}}
				elseif (<random_flip> = 8)
					LaunchEvent \{Type = pad_L1
						data = {
							device_num = $player2_device
						}}
				else
					LaunchEvent \{Type = pad_choose
						data = {
							device_num = $player2_device
						}}
				endif
			endif
			GetRandomValue \{Name = random_delay
				integer
				a = 15
				b = 120}
			begin
			if ((<current_flow_state>.Name) != "mp_faceoff_select_guitar_finish_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			<random_ticks_value> = (<random_ticks_value> - 1)
			Wait \{1
				gameframe}
			repeat <random_delay>
			repeat
			if ((<current_flow_state>.Name) = "mp_faceoff_select_guitar_finish_fs")
				LaunchEvent \{Type = pad_choose
					data = {
						device_num = $player1_device
					}}
			endif
		elseif ((<current_flow_state>.Name) = "mp_faceoff_setlist_fs")
			GetRandomValue \{Name = random_ticks
				integer
				a = 15
				b = 1800}
			<random_ticks_value> = <random_ticks>
			begin
			current_flow_state_name = ($ui_flow_manager_state [0])
			current_flow_state = (<current_flow_state_name>)
			if ((<current_flow_state>.Name) != "mp_faceoff_setlist_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			GetRandomValue \{Name = random_flip
				integer
				a = 0
				b = 2}
			if (<random_flip> = 0)
				LaunchEvent \{Type = pad_up}
			else
				LaunchEvent \{Type = pad_down}
			endif
			GetRandomValue \{Name = random_flip
				integer
				a = 0
				b = 2}
			if (<random_flip> = 0)
				GetRandomValue \{Name = random_delay
					integer
					a = 30
					b = 120}
			else
				GetRandomValue \{Name = random_delay
					integer
					a = 5
					b = 15}
			endif
			begin
			if ((<current_flow_state>.Name) != "mp_faceoff_setlist_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			<random_ticks_value> = (<random_ticks_value> - 1)
			Wait \{1
				gameframe}
			repeat <random_delay>
			repeat
			if ((<current_flow_state>.Name) = "mp_faceoff_setlist_fs")
				LaunchEvent \{Type = pad_choose}
			endif
		elseif ((<current_flow_state>.Name) = "mp_faceoff_select_difficulty_fs")
			GetRandomValue \{Name = random_ticks
				integer
				a = 15
				b = 600}
			<random_ticks_value> = <random_ticks>
			begin
			current_flow_state_name = ($ui_flow_manager_state [0])
			current_flow_state = (<current_flow_state_name>)
			if ((<current_flow_state>.Name) != "mp_faceoff_select_difficulty_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			GetRandomValue \{Name = random_flip
				integer
				a = 0
				b = 1}
			if (<random_flip> = 0)
				GetRandomValue \{Name = random_flip
					integer
					a = 0
					b = 1}
				if (<random_flip> = 0)
					LaunchEvent \{Type = pad_up
						data = {
							device_num = $player1_device
						}}
				else
					LaunchEvent \{Type = pad_down
						data = {
							device_num = $player1_device
						}}
				endif
			else
				GetRandomValue \{Name = random_flip
					integer
					a = 0
					b = 8}
				if (<random_flip> >= 0 && <random_flip> < 4)
					LaunchEvent \{Type = pad_up
						data = {
							device_num = $player2_device
						}}
				elseif (<random_flip> >= 4 && <random_flip> < 8)
					LaunchEvent \{Type = pad_down
						data = {
							device_num = $player2_device
						}}
				else
					LaunchEvent \{Type = pad_choose
						data = {
							device_num = $player2_device
						}}
				endif
			endif
			GetRandomValue \{Name = random_delay
				integer
				a = 15
				b = 120}
			begin
			if ((<current_flow_state>.Name) != "mp_faceoff_select_difficulty_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			<random_ticks_value> = (<random_ticks_value> - 1)
			Wait \{1
				gameframe}
			repeat <random_delay>
			repeat
			if ((<current_flow_state>.Name) = "mp_faceoff_select_difficulty_fs")
				LaunchEvent \{Type = pad_choose
					data = {
						device_num = $player1_device
					}}
			endif
		elseif ((<current_flow_state>.Name) = "mp_faceoff_select_part_fs")
			GetRandomValue \{Name = random_ticks
				integer
				a = 15
				b = 600}
			<random_ticks_value> = <random_ticks>
			begin
			current_flow_state_name = ($ui_flow_manager_state [0])
			current_flow_state = (<current_flow_state_name>)
			if ((<current_flow_state>.Name) != "mp_faceoff_select_part_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			GetRandomValue \{Name = random_flip
				integer
				a = 0
				b = 1}
			if (<random_flip> = 0)
				GetRandomValue \{Name = random_flip
					integer
					a = 0
					b = 1}
				if (<random_flip> = 0)
					LaunchEvent \{Type = pad_up
						data = {
							device_num = $player1_device
						}}
				else
					LaunchEvent \{Type = pad_down
						data = {
							device_num = $player1_device
						}}
				endif
			else
				GetRandomValue \{Name = random_flip
					integer
					a = 0
					b = 8}
				if (<random_flip> >= 0 && <random_flip> < 4)
					LaunchEvent \{Type = pad_up
						data = {
							device_num = $player2_device
						}}
				elseif (<random_flip> >= 4 && <random_flip> < 8)
					LaunchEvent \{Type = pad_down
						data = {
							device_num = $player2_device
						}}
				else
					LaunchEvent \{Type = pad_choose
						data = {
							device_num = $player2_device
						}}
				endif
			endif
			GetRandomValue \{Name = random_delay
				integer
				a = 15
				b = 120}
			begin
			if ((<current_flow_state>.Name) != "mp_faceoff_select_part_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			<random_ticks_value> = (<random_ticks_value> - 1)
			Wait \{1
				gameframe}
			repeat <random_delay>
			repeat
			if ((<current_flow_state>.Name) = "mp_faceoff_select_part_fs")
				LaunchEvent \{Type = pad_choose
					data = {
						device_num = $player1_device
					}}
			endif
		elseif ((<current_flow_state>.Name) = "mp_using_guitar_controller_fs")
			GetRandomValue \{Name = random_ticks
				integer
				a = 15
				b = 600}
			<random_ticks_value> = <random_ticks>
			begin
			current_flow_state_name = ($ui_flow_manager_state [0])
			current_flow_state = (<current_flow_state_name>)
			if ((<current_flow_state>.Name) != "mp_using_guitar_controller_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			<random_ticks_value> = (<random_ticks_value> - 1)
			Wait \{1
				gameframe}
			repeat
			if ((<current_flow_state>.Name) = "mp_using_guitar_controller_fs")
				LaunchEvent \{Type = pad_choose}
			endif
		elseif ((<current_flow_state>.Name) = "mp_faceoff_play_song_fs")
			begin
			current_flow_state_name = ($ui_flow_manager_state [0])
			current_flow_state = (<current_flow_state_name>)
			if ((<current_flow_state>.Name) != "mp_faceoff_play_song_fs")
				break
			endif
			GetRandomValue \{Name = random_flip
				integer
				a = 0
				b = 1}
			if (<random_flip> = 0)
				if ($player1_status.star_power_used = 0 && $player1_status.star_power_amount >= 50.0)
					SpawnScriptNow \{star_power_activate_and_drain
						params = {
							player_status = player1_status
							player_text = 'p1'
							Player = 1
						}}
				endif
			endif
			GetRandomValue \{Name = random_flip
				integer
				a = 0
				b = 1}
			if (<random_flip> = 0)
				if ($player2_status.star_power_used = 0 && $player2_status.star_power_amount >= 50.0)
					SpawnScriptNow \{star_power_activate_and_drain
						params = {
							player_status = player2_status
							player_text = 'p2'
							Player = 2
						}}
				endif
			endif
			GetRandomValue \{Name = random_delay
				integer
				a = 60
				b = 600}
			begin
			if ((<current_flow_state>.Name) != "mp_faceoff_play_song_fs")
				break
			endif
			Wait \{1
				gameframe}
			repeat <random_delay>
			repeat
		elseif ((<current_flow_state>.Name) = "mp_faceoff_fail_song_fs")
			GetRandomValue \{Name = random_ticks
				integer
				a = 15
				b = 600}
			<random_ticks_value> = <random_ticks>
			begin
			current_flow_state_name = ($ui_flow_manager_state [0])
			current_flow_state = (<current_flow_state_name>)
			if ((<current_flow_state>.Name) != "mp_faceoff_fail_song_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			GetRandomValue \{Name = random_flip
				integer
				a = 0
				b = 1}
			if (<random_flip> = 0)
				LaunchEvent \{Type = pad_up}
			else
				LaunchEvent \{Type = pad_down}
			endif
			GetRandomValue \{Name = random_delay
				integer
				a = 15
				b = 240}
			begin
			if ((<current_flow_state>.Name) != "mp_faceoff_fail_song_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			<random_ticks_value> = (<random_ticks_value> - 1)
			Wait \{1
				gameframe}
			repeat <random_delay>
			repeat
			if ((<current_flow_state>.Name) = "mp_faceoff_fail_song_fs")
				LaunchEvent \{Type = pad_choose}
			endif
		elseif ((<current_flow_state>.Name) = "mp_faceoff_newspaper_fs")
			GetRandomValue \{Name = random_ticks
				integer
				a = 15
				b = 600}
			<random_ticks_value> = <random_ticks>
			begin
			current_flow_state_name = ($ui_flow_manager_state [0])
			current_flow_state = (<current_flow_state_name>)
			if ((<current_flow_state>.Name) != "mp_faceoff_newspaper_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			GetRandomValue \{Name = random_flip
				integer
				a = 0
				b = 1}
			if (<random_flip> = 0)
				LaunchEvent \{Type = pad_up}
			else
				LaunchEvent \{Type = pad_down}
			endif
			GetRandomValue \{Name = random_delay
				integer
				a = 15
				b = 240}
			begin
			if ((<current_flow_state>.Name) != "mp_faceoff_newspaper_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			<random_ticks_value> = (<random_ticks_value> - 1)
			Wait \{1
				gameframe}
			repeat <random_delay>
			repeat
			if ((<current_flow_state>.Name) = "mp_faceoff_newspaper_fs")
				LaunchEvent \{Type = pad_choose}
			endif
		elseif ((<current_flow_state>.Name) = "mp_faceoff_detailed_stats_fs")
			GetRandomValue \{Name = random_ticks
				integer
				a = 15
				b = 600}
			<random_ticks_value> = <random_ticks>
			begin
			current_flow_state_name = ($ui_flow_manager_state [0])
			current_flow_state = (<current_flow_state_name>)
			if ((<current_flow_state>.Name) != "mp_faceoff_detailed_stats_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			GetRandomValue \{Name = random_flip
				integer
				a = 0
				b = 1}
			if (<random_flip> = 0)
				LaunchEvent \{Type = pad_up}
			else
				LaunchEvent \{Type = pad_down}
			endif
			GetRandomValue \{Name = random_delay
				integer
				a = 15
				b = 240}
			begin
			if ((<current_flow_state>.Name) != "mp_faceoff_detailed_stats_fs")
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			<random_ticks_value> = (<random_ticks_value> - 1)
			Wait \{1
				gameframe}
			repeat <random_delay>
			repeat
			if ((<current_flow_state>.Name) = "mp_faceoff_detailed_stats_fs")
				LaunchEvent \{Type = pad_choose}
			endif
		else
			GetRandomValue \{Name = random_ticks
				integer
				a = 120
				b = 5400}
			<random_ticks_value> = <random_ticks>
			begin
			if ($is_attract_mode = 0)
				break
			endif
			if (<random_ticks_value> < 0)
				break
			endif
			<random_ticks_value> = (<random_ticks_value> - 1)
			Wait \{1
				gameframe}
			repeat
			GetRandomValue \{Name = random_credits
				integer
				a = 4
				b = 8}
			begin
			if ($is_attract_mode = 0)
				break
			endif
			PressCoinOne
			Wait \{10
				gameframes}
			repeat <random_credits>
			if ($is_attract_mode = 1)
				PressStartOne
			endif
			begin
			if ($is_attract_mode = 0)
				break
			endif
			Wait \{1
				gameframe}
			repeat 30
			Change \{structurename = player1_status
				bot_play = 1}
			Change \{structurename = player2_status
				bot_play = 1}
			GetRandomValue \{Name = miss_percent
				integer
				a = 0
				b = 50}
			Change autoplay_miss_percent = <miss_percent>
			printf "autoplay_input: miss percent1=%a" a = <miss_percent>
			GetRandomValue \{Name = miss_percent
				integer
				a = 0
				b = 50}
			Change autoplay_miss_percent2 = <miss_percent>
			printf "autoplay_input: miss percent2=%a" a = <miss_percent>
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript
