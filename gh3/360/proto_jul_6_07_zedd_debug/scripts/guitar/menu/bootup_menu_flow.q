respond_to_signin_changed = 0
bootup_sequence_fs = {
	create = start_bootup_sequence
	destroy = end_bootup_sequence
	actions = [
		{
			action = skip_bootup_sequence
			flow_state = bootup_press_any_button_fs
		}
	]
}
bootup_press_any_button_fs = {
	create = create_press_any_button_menu
	destroy = destroy_press_any_button_menu
	actions = [
		{
			action = enter_attract_mode
			flow_state = bootup_attract_mode_fs
		}
		{
			action = continue
			flow_state_func = bootup_check_for_sign_in
		}
	]
}
bootup_attract_mode_fs = {
	create = create_attract_mode
	destroy = destroy_attract_mode
	actions = [
		{
			action = exit_attract_mode
			flow_state = bootup_press_any_button_fs
		}
	]
}
legal_timer = 0

script start_legal_timer 
	change \{legal_timer = 0}
	wait \{6
		seconds}
	change \{legal_timer = 1}
endscript

script wait_for_legal_timer 
	if notcd
		if ($show_movies = 0)
			return
		endif
	endif
	begin
	if ($legal_timer = 1)
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script bootup_sequence 
	wait_for_legal_timer
	startrendering
	playmovieandwait \{movie = 'atvi'}
	playmovieandwait \{movie = 'ns_logo'}
	playmovieandwait \{movie = 'intro'}
	spawnscriptnow \{ui_flow_manager_respond_to_action
		params = {
			action = skip_bootup_sequence
			play_sound = 0
		}}
endscript

script start_bootup_sequence 
	if notcd
		if ($show_movies = 0)
			startrendering
			spawnscriptnow \{ui_flow_manager_respond_to_action
				params = {
					action = skip_bootup_sequence
					play_sound = 0
				}}
			return
		endif
	endif
	spawnscriptnow \{bootup_sequence}
endscript

script end_bootup_sequence 
endscript

script check_signin_change_monitor_flag 
	if ($respond_to_signin_changed = 0)
		scriptassert \{"check_signin_change_monitor_flag failed"}
	endif
endscript

script start_checking_for_signin_change 
	printf "start_checking_for_signin_change"
	printscriptinfo "start_checking_for_signin_change"
	printf "start_checking_for_signin_change - killing sysnotifys"
	killspawnedscript name = sysnotify_handle_signin_change
	printf "start_checking_for_signin_change - begin"
	change respond_to_signin_changed = 1
	change menu_select_difficulty_first_time = 1
endscript

script bootup_check_for_sign_in 
	killspawnedscript name = attract_mode_spawner
	change enable_saving = 1
	if gotparam device_num
		change primary_controller = <device_num>
		change structurename = player1_status controller = ($primary_controller)
	endif
	if NOT checkforsignin local controller_index = <device_num>
		if isxenon
			netsessionfunc func = showsigninui
		else
			change ps3_signin_complete = 0
			xenon_singleplayer_session_init ps3_signin_callback = signin_complete_callback
		endif
		wait_for_blade_complete
		if NOT checkforsignin local
			return flow_state = bootup_signin_warning_fs
		endif
	endif
	if isxenon
		process_signin_complete
		return flow_state = <flow_state>
	else
		return flow_state = bootup_signin_complete_message
	endif
endscript

script process_signin_complete 
	refreshsigninstatus
	startgameprofilesettingsread
	begin
	if gameprofilesettingsfinished
		break
	endif
	repeat
	start_checking_for_signin_change
	return \{flow_state = bootup_do_memcard_sequence_fs}
endscript
ps3_signin_complete = 0

script wait_for_blade_complete 
	if isxenon
		wait_for_sysnotify_unpause
	else
		begin
		if (1 = $ps3_signin_complete)
			break
		endif
		wait \{1
			frame}
		repeat
	endif
endscript

script signin_complete_callback 
	change \{ps3_signin_complete = 1}
endscript
bootup_signin_warning_fs = {
	create = create_signin_warning_menu
	destroy = destroy_signin_warning_menu
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
	destroy = memcard_sequence_cleanup_generic
	actions = [
		{
			action = memcard_sequence_save_success
			flow_state = bootup_using_guitar_controller_fs
		}
		{
			action = memcard_sequence_save_failed
			flow_state = bootup_using_guitar_controller_fs
		}
		{
			action = memcard_sequence_load_success
			flow_state = bootup_download_scan_fs
		}
		{
			action = memcard_sequence_load_failed
			flow_state = bootup_using_guitar_controller_fs
		}
	]
}
bootup_using_guitar_controller_fs = {
	create = create_using_guitar_controller_menu
	destroy = destroy_using_guitar_controller_menu
	actions = [
		{
			action = continue
			flow_state = bootup_download_scan_fs
		}
	]
}
bootup_download_scan_fs = {
	create = create_download_scan_menu
	destroy = destroy_download_scan_menu
	actions = [
		{
			action = continue
			flow_state = main_menu_fs
		}
	]
}
bootup_signin_complete_message = {
	create = create_signin_complete_menu
	destroy = destroy_signin_complete_menu
	actions = [
		{
			action = continue
			flow_state_func = process_signin_complete
		}
	]
}
is_shutdown_safe = 1

script handle_signin_changed 
	printf "handle_signin_changed"
	change respond_to_signin_changed = 0
	begin
	if ($is_shutdown_safe = 1)
		break
	endif
	wait 1 gameframe
	repeat
	printf "handle_signin_changed started"
	disable_pause
	stoprendering
	shutdown_game_for_signin_change
	launchevent type = unfocus target = root_window
	create_signin_changed_menu
	startrendering
	printf "handle_signin_changed end"
endscript

script signing_change_confirm_reboot 
	printf \{"signing_change_confirm_reboot"}
	destroy_signin_changed_menu
	shut_down_flow_manager
	enable_pause
	wait \{5
		gameframes}
	start_flow_manager \{flow_state = bootup_press_any_button_fs}
	printf \{"signing_change_confirm_reboot end"}
endscript

script shutdown_game_for_signin_change unloadcontent = 1
	printf "shutdown_game_for_signin_change"
	memcard_sequence_cleanup_generic
	shut_down_character_hub
	tutorial_shutdown
	shut_down_flow_manager
	store_monitor_goal_guitar_finish
	deregisteratoms
	quit_network_game_early signin_change
	kill_gem_scroller no_render = 1
	progression_push_current force = 1
	clean_up_user_control_helpers
	menu_music_off
	stopallsounds
	setpakmancurrentblock map = zones pak = none block_scripts = 1
	destroy_band
	if (<unloadcontent> = 1)
		downloads_unloadcontent
	endif
	clearglobaltags
	setup_globaltags
	unpausegame
	printf "shutdown_game_for_signin_change end"
endscript
