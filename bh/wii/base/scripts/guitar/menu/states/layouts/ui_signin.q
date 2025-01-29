signin_continue_state = uistate_freeplay
signin_continue_data = {
}
signin_jam_mode = 0
alternative_primary_selected = -1

script ui_init_signin 
	Change \{signin_continue_state = uistate_freeplay}
	Change \{signin_continue_data = {
		}}
	Change \{respond_to_signin_changed = 0}
	Change \{alternative_primary_selected = -1}
endscript

script ui_create_signin \{new_data = {
		}}
	if GotParam \{new_state}
		Change signin_continue_state = <new_state>
		Change signin_continue_data = <new_data>
	endif
	if ($game_mode = freeplay)
		Change \{game_mode = career}
	endif
	setplayerinfo \{1
		in_game = 0}
	setplayerinfo \{2
		in_game = 0}
	setplayerinfo \{3
		in_game = 0}
	setplayerinfo \{4
		in_game = 0}
	SpawnScriptNow wii_ui_signin_check params = <...>
endscript

script ui_destroy_signin 
	destroy_dialog_box
endscript

script ui_deinit_signin 
	Change \{respond_to_signin_changed = 1}
	Change \{respond_to_signin_changed_func = None}
endscript

script assign_new_primary_controller 
	printf qs(0xf2fa52bc) c = ($primary_controller_assigned)
	if ($primary_controller_assigned = 0)
		first_press = 1
	endif
	change_primary_controller controller = <device_num>
	if GotParam \{first_press}
		Change \{respond_to_signin_changed_func = ui_signin_changed_first_press}
	endif
	if ($invite_controller = -1)
		NetSessionFunc \{func = removeallcontrollers}
	endif
	NetSessionFunc func = addcontrollers params = {controller = <device_num>}
endscript

script change_primary_controller 
	RequireParams \{[
			controller
		]
		all}
	Change primary_controller = <controller>
	Change \{primary_controller_assigned = 1}
	Change last_start_pressed_device = ($primary_controller)
	Change \{respond_to_signin_changed = 1}
	Change \{respond_to_signin_changed_all_players = 1}
	get_savegame_from_controller controller = ($primary_controller)
	ui_options_audio_set_dolby_digital savegame = <savegame>
	update_all_volumes_savegame savegame = <savegame>
endscript

script ui_signin_changed_first_press 
	printf \{qs(0x23492f74)}
	if NOT (<controller> = $primary_controller)
		if islocallysignedin controller = <controller>
			printf \{qs(0xac06c05e)}
			Change alternative_primary_selected = <controller>
		endif
	endif
endscript
ui_signin_lobby_task_keep_running = 0
ui_signin_normal_wait = 5
auto_signin_hit_freeplay = 0
current_lobby = default_lobby

script ui_signin_start_always_on_lobby_task 
	printf \{qs(0x840dba72)}
	if ScriptIsRunning \{ui_signin_launch_lobby_task}
		printf \{qs(0x2de5db6c)}
	else
		Change \{ui_signin_lobby_task_keep_running = 1}
		SpawnScriptNow \{ui_signin_launch_lobby_task}
	endif
endscript

script ui_signin_stop_always_on_lobby_task 
	Change \{ui_signin_lobby_task_keep_running = 0}
endscript

script ui_signin_launch_lobby_task 
	setscriptcannotpause
	reconnect_wait = ($ui_signin_normal_wait)
	begin
	if ($auto_signin_hit_freeplay = 1)
		break
	endif
	printf \{qs(0xfb0620f0)}
	Wait \{1
		Second}
	repeat
	begin
	if ($ui_signin_lobby_task_keep_running = 0)
		printf \{qs(0x325fff01)}
		return
	endif
	if NOT islobbyconnected \{default_lobby}
		printf \{qs(0x4ec78a30)}
		ui_signin_wait_and_sign_in
	endif
	demonware_error = 0
	getngcneterrors
	if (<demonware_error> = 0)
		<reconnect_wait> = ($ui_signin_normal_wait)
	else
		if (<reconnect_wait> < 40)
			<reconnect_wait> = (<reconnect_wait> * 2)
		endif
		printf qs(0x0a10b6af) a = <demonware_error> , b = <reconnect_wait>
	endif
	Wait <reconnect_wait> Seconds
	repeat
endscript
always_on_signing_in = 0

script ui_signin_wait_and_sign_in 
	setscriptcannotpause
	if ($always_on_signing_in = 0)
		printf \{qs(0x5d4168ec)}
		Change \{always_on_signing_in = 1}
		if NOT islobbyconnected \{default_lobby}
			printf \{qs(0xab829178)}
			begin
			if hascompletedonlinesetup
				break
			endif
			Wait \{2
				Seconds}
			repeat
			begin
			if CheckForSignIn \{controller_index = 0
					dont_set_primary
					network_platform_only}
				break
			endif
			Wait \{2
				Seconds}
			repeat
			if NOT CheckForSignIn \{controller_index = 0
					dont_set_primary}
				callback = ui_signin_reset_session_funcs
				NetSessionFunc func = OnlineSignIn params = {callback = <callback>}
				begin
				printf \{'waiting for sign-in callback: always_on_signing_in == 0'}
				if (0 = $always_on_signing_in)
					break
				endif
				Wait \{1
					Frame}
				repeat
			else
				ui_signin_reset_session_funcs
			endif
		else
			ui_signin_reset_session_funcs
		endif
	else
		printf \{qs(0x87cff851)}
	endif
endscript

script ui_signin_reset_session_funcs 
	printf \{qs(0xd6fbcd2a)}
	printf \{qs(0xce235623)}
	Change \{always_on_signing_in = 0}
	if CheckForSignIn \{controller_index = 0
			dont_set_primary
			network_platform_only}
		if CheckForSignIn \{controller_index = 0
				dont_set_primary}
		else
		endif
	endif
endscript

script wii_ui_signin_check \{primary = 1
		force_signin = 0
		boot = 0
		require_signin = 1}
	printf \{qs(0x35644c36)}
	if (<primary> = 1)
		if GotParam \{device_num}
			assign_new_primary_controller device_num = <device_num>
		endif
	endif
	if GotParam \{require_live}
		if CheckForSignIn
			destroy_dialog_box
			ui_event_wait event = menu_replace state = $signin_continue_state data = ($signin_continue_data)
			return
		else
			ui_signin_handle_warnings <...>
			return
		endif
	else
		ui_signin_process_complete controller = <device_num>
		<callback> <callback_params>
	endif
endscript
ps3_done_signin_check = 0

script ui_signin_check \{primary = 1
		force_signin = 0
		boot = 0
		require_signin = 1}
	printf \{qs(0x86320b10)}
	if ($invite_controller != -1)
		printf 'Load soundcheck for non-primary player invite - controller %c' c = ($invite_controller)
	endif
	if (<primary> = 1)
		if GotParam \{device_num}
			assign_new_primary_controller device_num = <device_num>
		endif
	endif
	if ((isps3) || (isngc))
		if ($ps3_done_signin_check = 1)
			if GotParam \{require_live}
				NetSessionFunc func = OnlineSignIn params = {
					use_online_flow
					fail_state = uistate_signin_warning
					fail_params = {allow_back = <allow_back>
						require_live = <require_live>
						going_to_career = <going_to_career>
						controller = <device_num>}
					success_state = <callback>
					success_params = <callback_params>}
				return
			endif
			ui_signin_process_complete controller = <device_num>
			<callback> <callback_params>
			return
		else
			first_signin_on_ps3 = 1
		endif
		Change \{ps3_done_signin_check = 1}
	endif
	signin_params = {local}
	if GotParam \{require_live}
		signin_params = {}
	endif
	if ((isps3) || (isngc))
		if GotParam \{leaderboards}
			signin_params = {}
		endif
	endif
	perform_signin = 0
	if (<require_signin> = 1)
		if (<force_signin> = 1)
			perform_signin = 1
		endif
		if NOT CheckForSignIn <signin_params> controller_index = <device_num>
			perform_signin = 1
			if ((GotParam jam) || (GotParam musicstore))
				if isxenonorwindx
					if NetSessionFunc func = isliveenabled params = {controller_index = <device_num>}
						perform_signin = 0
					endif
				endif
			endif
		endif
		if NetSessionFunc func = xenonisguest params = {controller_index = <device_num>}
			perform_signin = 1
		endif
		if ((isps3) || (isngc))
			if ($skip_signin = 1)
				Change \{skip_signin = 0}
				printf qs(0x9ba8ea44) s = ($signin_continue_state)
				destroy_dialog_box
				ui_event_wait event = menu_replace state = $signin_continue_state data = ($signin_continue_data)
				return
			endif
		endif
	endif
	if (<perform_signin> = 1)
		if ((isps3) || (isngc))
			if GotParam \{first_signin_on_ps3}
				boot = 1
			endif
		endif
		if NOT (<boot>)
			if NOT (<force_signin>)
				ui_signin_handle_warnings <...>
				if (<warnings> = 1)
					return
				endif
			endif
		endif
		if isxenonorwindx
			if GotParam \{require_live}
				NetSessionFunc \{func = showsigninui
					params = {
						online_only
					}}
			else
				NetSessionFunc \{func = showsigninui}
			endif
		else
			Change \{ps3_signin_complete = 0}
			xenon_singleplayer_session_init \{ps3_signin_callback = signin_complete_callback}
		endif
		wait_for_blade_complete
		ui_signin_handle_warnings <...>
		if (<warnings> = 1)
			return
		endif
	else
		if GotParam \{leaderboards}
			ui_signin_handle_warnings <...>
			if (<warnings> = 1)
				return
			endif
		endif
	endif
	if CheckForSignIn
		NetSessionFunc \{func = stats_uninit}
		NetSessionFunc \{func = stats_init}
		NetSessionFunc \{func = motd_uninit}
		NetSessionFunc \{func = motd_init}
		NetSessionFunc \{func = live_settings_init}
	elseif CheckForSignIn \{local}
		NetSessionFunc \{func = live_settings_init}
	endif
	if isxenonorwindx
		if NOT GotParam \{require_live}
			if NetSessionFunc func = xenonisguest params = {controller_index = <device_num>}
				destroy_dialog_box
				ui_event_wait event = menu_replace state = $signin_continue_state data = ($signin_continue_data)
				return
			endif
		elseif GotParam \{net_auto_launch}
			printf qs(0x050c2578) s = ($signin_continue_state)
			destroy_dialog_box
			ui_event_wait event = menu_replace state = $signin_continue_state data = ($signin_continue_data)
			return
		endif
		if ($skip_signin = 1)
			Change \{skip_signin = 0}
			printf qs(0x5fc7bfbd) s = ($signin_continue_state)
			destroy_dialog_box
			ui_event_wait event = menu_replace state = $signin_continue_state data = ($signin_continue_data)
			return
		endif
		ui_signin_process_complete controller = <device_num>
		<callback> controller = <device_num> <callback_params>
	else
		ui_event_wait \{event = menu_replace
			data = {
				state = uistate_signin_complete
			}}
	endif
endscript

script ui_signin_process_complete \{controller = -1}
	begin
	RefreshSigninStatus
	if issigninfinished
		break
	endif
	Wait \{1
		gameframe}
	repeat
	if (<controller> = -1)
		controller = ($primary_controller)
	endif
	if isXenon
		StartGameProfileSettingsRead controller = <controller>
		begin
		if GameProfileSettingsFinished controller = <controller>
			break
		endif
		repeat
		if GetGameProfileSetting gsid = 1 controller = <controller>
			SetArrayElement ArrayName = default_difficulty globalarray index = <controller> NewValue = easy
			if (<game_setting> = 3)
				SetArrayElement ArrayName = default_difficulty globalarray index = <controller> NewValue = medium
			elseif (<game_setting> = 4)
				SetArrayElement ArrayName = default_difficulty globalarray index = <controller> NewValue = hard
			endif
		endif
	endif
	get_savegame_from_controller controller = <controller>
	set_savegame_signed_in savegame = <savegame>
	callback = ui_event
	callback_params = {event = menu_replace data = {state = $signin_continue_state ($signin_continue_data) device_num = <controller>}}
	ui_event_wait_for_safe
	return callback = <callback> callback_params = <callback_params>
endscript

script ui_create_signin_complete 
	SpawnScriptNow \{create_signin_complete_menu}
endscript

script ui_destroy_signin_complete 
	destroy_signin_complete_menu
endscript

script ui_create_signin_warning 
	create_signin_warning_menu <...>
	0x61906aac
endscript

script ui_destroy_signin_warning 
	destroy_signin_warning_menu
endscript

script ui_signin_warning_back 
	Change \{force_mainmenu_signin = 1}
	Change \{wii_entering_music_store = 0}
	if isngc
		set_home_button_allowed
	endif
	if ui_event_exists_in_stack \{Name = 'jam'}
		ghtunes_menu_back
	else
		ui_event \{event = menu_replace
			data = {
				state = uistate_mainmenu
				clear_previous_stack
			}}
	endif
endscript

script ui_signin_warning_jam_back \{jam = 1}
	if NOT (<jam> = 1)
		generic_event_back
	else
		0xc9083294
		ui_signin_warning_back
	endif
endscript

script ui_signin_handle_warnings 
	if NOT ($alternative_primary_selected = -1)
		device_num = ($alternative_primary_selected)
		Change \{alternative_primary_selected = -1}
		assign_new_primary_controller device_num = <device_num>
	endif
	if isngc
		if NOT CheckForSignIn controller_index = <device_num>
			ui_event_wait event = menu_replace data = {state = uistate_signin_warning player_device = <device_num> require_live = <require_live>}
			return \{warnings = 1}
		else
			return \{warnings = 0}
		endif
	endif
	if GotParam \{musicstore}
		if isXenon
			if NOT NetSessionFunc func = isliveenabled params = {controller_index = <device_num>}
				ui_event_wait event = menu_replace data = {state = uistate_signin_warning player_device = <device_num> allow_back = <allow_back> require_live = <require_live>}
				return \{warnings = 1}
			elseif NetSessionFunc func = xenonisguest params = {controller_index = <device_num>}
				ui_event_wait event = menu_replace data = {state = uistate_signin_warning player_device = <device_num> allow_back = <allow_back> require_live = <require_live>}
				return \{warnings = 1}
			endif
		elseif isps3
			if NOT CheckForSignIn controller_index = <device_num>
				ui_event_wait event = menu_replace data = {state = uistate_signin_warning player_device = <device_num> allow_back = <allow_back> require_live = <require_live>}
				return \{warnings = 1}
			elseif NetSessionFunc func = xenonisguest params = {controller_index = <device_num>}
				ui_event_wait event = menu_replace data = {state = uistate_signin_warning player_device = <device_num> allow_back = <allow_back> require_live = <require_live>}
				return \{warnings = 1}
			endif
		endif
	elseif GotParam \{require_live}
		if GotParam \{jam}
			if isxenonorwindx
				if NOT NetSessionFunc func = isliveenabled params = {controller_index = <device_num>}
					ui_event_wait event = menu_replace data = {state = uistate_signin_warning player_device = <device_num> allow_back = <allow_back> require_live = <require_live>}
					return \{warnings = 1}
				elseif NetSessionFunc func = xenonisguest params = {controller_index = <device_num>}
					ui_event_wait event = menu_replace data = {state = uistate_signin_warning player_device = <device_num> allow_back = <allow_back> require_live = <require_live>}
					return \{warnings = 1}
				endif
			elseif isps3
				if NOT CheckForSignIn controller_index = <device_num>
					ui_event_wait event = menu_replace data = {state = uistate_signin_warning player_device = <device_num> allow_back = <allow_back> require_live = <require_live>}
					return \{warnings = 1}
				elseif NetSessionFunc func = xenonisguest params = {controller_index = <device_num>}
					ui_event_wait event = menu_replace data = {state = uistate_signin_warning player_device = <device_num> allow_back = <allow_back> require_live = <require_live>}
					return \{warnings = 1}
				endif
			endif
		else
			if NOT CheckForSignIn controller_index = <device_num>
				ui_event_wait event = menu_replace data = {state = uistate_signin_warning player_device = <device_num> allow_back = <allow_back> require_live = <require_live>}
				return \{warnings = 1}
			elseif NetSessionFunc func = xenonisguest params = {controller_index = <device_num>}
				ui_event_wait event = menu_replace data = {state = uistate_signin_warning player_device = <device_num> allow_back = <allow_back> require_live = <require_live>}
				return \{warnings = 1}
			endif
		endif
	endif
	if isps3
		if GotParam \{boot}
			if NOT CheckForSignIn controller_index = <device_num>
				ui_event_wait event = menu_replace data = {state = uistate_signin_warning player_device = <device_num> allow_back = <allow_back> require_live = <require_live>}
				return \{warnings = 1}
			endif
		endif
	endif
	if GotParam \{downloads}
		if NOT CheckForSignIn local controller_index = <device_num>
			ui_event_wait event = menu_replace data = {state = uistate_signin_warning player_device = <device_num> allow_back = <allow_back> downloads = <downloads>}
			return \{warnings = 1}
		endif
	endif
	if GotParam \{leaderboards}
		if NOT CheckForSignIn <signin_params> controller_index = <device_num>
			ui_event_wait event = menu_replace data = {state = uistate_signin_warning player_device = <device_num> allow_back = <allow_back> leaderboards = <leaderboards>}
			return \{warnings = 1}
		endif
		if NOT NetSessionFunc func = isliveenabled params = {controller_index = <device_num>}
			ui_event_wait event = menu_replace data = {state = uistate_signin_warning player_device = <device_num> allow_back = <allow_back> leaderboards = <leaderboards>}
			return \{warnings = 1}
		endif
	endif
	if isps3
		if GotParam \{optional_signin}
			if NOT CheckForSignIn local controller_index = <device_num>
				ui_event_wait event = menu_replace data = {state = uistate_signin_warning player_device = <device_num> allow_back = <allow_back> jam = <jam> boot = <boot>}
				return \{warnings = 1}
			endif
		endif
	endif
	if NOT CheckForSignIn local controller_index = <device_num>
		ui_event_wait event = menu_replace data = {state = uistate_signin_warning player_device = <device_num> allow_back = <allow_back> jam = <jam> boot = <boot> require_signin = <require_signin>}
		return \{warnings = 1}
	endif
	return \{warnings = 0}
endscript
