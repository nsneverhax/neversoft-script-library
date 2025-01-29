signin_continue_state = uistate_mainmenu
signin_continue_data = {
}
signin_jam_mode = 0
store_respond_to_signin_changed = 0
store_respond_to_signin_changed_warning_dialog = 0
alternative_primary_selected = -1
signin_state_working = 0

script ui_init_signin 
	Change \{signin_continue_state = uistate_mainmenu}
	Change \{signin_continue_data = {
		}}
	Change store_respond_to_signin_changed = ($respond_to_signin_changed)
	Change \{respond_to_signin_changed = 0}
	Change \{respond_to_signin_changed_func = ui_signin_changed_func}
	Change \{alternative_primary_selected = -1}
endscript

script ui_create_signin \{new_data = {
		}
		show_mainmenu_bg = 0}
	Change \{signin_state_working = 1}
	if (<show_mainmenu_bg> = 1)
		SetPakManCurrentBlock \{map = ui_paks
			pakname = 'band_lobby'
			block_scripts = 1}
		create_mainmenu_bg
	endif
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
	SpawnScriptNow ui_signin_check params = <...>
endscript

script ui_destroy_signin \{show_mainmenu_bg = 0
		no_hide_glitch = 0}
	if (<no_hide_glitch> = 0)
		hide_glitch \{num_frames = 8}
	endif
	if (<show_mainmenu_bg> = 1)
		destroy_mainmenu_bg
	endif
	destroy_dialog_box
	Change \{signin_state_working = 0}
endscript

script ui_deinit_signin 
	Change respond_to_signin_changed = ($store_respond_to_signin_changed)
	Change \{respond_to_signin_changed_func = None}
	Change \{signin_state_working = 0}
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

script change_primary_controller \{controller = !i1768515945
		modify_signin_change_flags = 1}
	RequireParams \{[
			controller
		]
		all}
	if (<controller> >= 4)
		ScriptAssert 'Bad primary controller! Trying to be set to %d' d = <controller>
	endif
	threadsafesetglobalinteger global_name = primary_controller new_value = <controller>
	threadsafesetglobalinteger \{global_name = primary_controller_assigned
		new_value = 1}
	Change last_start_pressed_device = ($primary_controller)
	jam_update_curr_directory_listing controller = ($primary_controller)
	if (<modify_signin_change_flags> = 1)
		Change \{respond_to_signin_changed = 1}
		Change \{respond_to_signin_changed_all_players = 1}
	endif
	if NOT GotParam \{from_boot}
		set_audio_options_for_primary_controller
	endif
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

script ui_signin_changed_func 
	printf \{qs(0xd7935d9a)}
	reset_dlc_signin_state
	reset_savegame savegame = <controller>
	set_audio_options_for_primary_controller
	gamemode_gettype
	if (<Type> = freeplay)
		sanity_check_fix_deleted_characters
	endif
endscript
ps3_done_signin_check = 0

script ui_signin_check \{primary = 1
		force_signin = 0
		boot = 0
		require_signin = 1
		no_hide_glitch = 0}
	if ($invite_controller != -1)
		printf 'Load soundcheck for non-primary player invite - controller %c' c = ($invite_controller)
	endif
	if (<primary> = 1)
		if GotParam \{device_num}
			assign_new_primary_controller device_num = <device_num>
			if (<boot> = 1)
				Change \{respond_to_signin_changed = 0}
			endif
		endif
	endif
	if isps3
		if ($ps3_done_signin_check = 1)
			if GotParam \{require_live}
				NetSessionFunc func = OnlineSignIn params = {
					use_online_flow
					fail_state = uistate_signin_warning
					fail_params = {allow_back = <allow_back>
						require_live = <require_live>
						going_to_career = <going_to_career>
						controller = <device_num>
						jam = <jam>}
					success_state = <callback>
					success_params = <callback_params>
				}
				return
			endif
			ui_signin_hide_glitch no_hide_glitch = <no_hide_glitch>
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
	if isps3
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
		if isxenonorwindx
			if NetSessionFunc func = xenonisguest params = {controller_index = <device_num>}
				perform_signin = 1
			endif
		else
			perform_signin = 1
		endif
		if isps3
			if ($skip_signin = 1)
				Change \{skip_signin = 0}
				printf qs(0x9ba8ea44) s = ($signin_continue_state)
				destroy_dialog_box
				ui_signin_hide_glitch no_hide_glitch = <no_hide_glitch>
				ui_event_wait event = menu_replace state = $signin_continue_state data = ($signin_continue_data)
				return
			endif
		endif
	endif
	if demobuild
		perform_signin = 0
	endif
	if (<perform_signin> = 1)
		if isps3
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
				if NOT GotParam \{musicstore}
					NetSessionFunc \{func = showsigninui
						params = {
							online_only
						}}
				else
					NetSessionFunc \{func = showsigninui}
				endif
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
	elseif CheckForSignIn \{local}
	endif
	NetSessionFunc \{func = live_settings_init}
	NetSessionFunc \{Obj = live_settings
		func = get_settings}
	if isxenonorwindx
		if NOT GotParam \{require_live}
			if NetSessionFunc func = xenonisguest params = {controller_index = <device_num>}
				destroy_dialog_box
				ui_signin_hide_glitch no_hide_glitch = <no_hide_glitch>
				ui_event_wait event = menu_replace state = $signin_continue_state data = ($signin_continue_data)
				return
			endif
		elseif GotParam \{net_auto_launch}
			printf qs(0x050c2578) s = ($signin_continue_state)
			destroy_dialog_box
			ui_signin_hide_glitch no_hide_glitch = <no_hide_glitch>
			ui_event_wait event = menu_replace state = $signin_continue_state data = ($signin_continue_data)
			return
		endif
		if ($skip_signin = 1)
			Change \{skip_signin = 0}
			printf qs(0x5fc7bfbd) s = ($signin_continue_state)
			destroy_dialog_box
			ui_signin_hide_glitch no_hide_glitch = <no_hide_glitch>
			ui_event_wait event = menu_replace state = $signin_continue_state data = ($signin_continue_data)
			return
		endif
		ui_signin_process_complete controller = <device_num>
		ui_signin_hide_glitch no_hide_glitch = <no_hide_glitch>
		<callback> controller = <device_num> <callback_params>
	else
		ui_signin_hide_glitch no_hide_glitch = <no_hide_glitch>
		ui_event_wait event = menu_replace data = {state = uistate_signin_complete no_hide_glitch = <no_hide_glitch>}
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
	if isxenonorwindx
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
	start_checking_for_signin_change
	ui_event_wait_for_safe
	return callback = ui_memcard_single_signin callback_params = {this_event = menu_replace state = $signin_continue_state data = ($signin_continue_data)}
endscript

script ui_create_signin_complete \{no_hide_glitch = 0}
	if (<no_hide_glitch> = 0)
		hide_glitch \{num_frames = 16}
	endif
	SpawnScriptNow \{create_signin_complete_menu}
endscript

script ui_destroy_signin_complete 
	destroy_signin_complete_menu
endscript

script ui_create_signin_warning 
	Change store_respond_to_signin_changed_warning_dialog = ($respond_to_signin_changed)
	Change \{respond_to_signin_changed = 1}
	create_mainmenu_bg
	create_signin_warning_menu <...>
	StartRendering
endscript

script ui_destroy_signin_warning 
	Change respond_to_signin_changed = ($store_respond_to_signin_changed_warning_dialog)
	destroy_mainmenu_bg
	destroy_signin_warning_menu
endscript

script ui_signin_warning_back 
	Change \{force_mainmenu_signin = 1}
	if ui_event_exists_in_stack \{Name = 'mainmenu_create'}
		generic_event_back \{state = uistate_mainmenu_create}
	elseif ui_event_exists_in_stack \{Name = 'mainmenu'}
		generic_event_back \{state = uistate_mainmenu}
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
		ui_sfx \{menustate = Generic
			uitype = back}
		generic_event_back
	else
		ui_signin_warning_back
	endif
endscript

script ui_signin_handle_warnings 
	if NOT ($alternative_primary_selected = -1)
		device_num = ($alternative_primary_selected)
		Change \{alternative_primary_selected = -1}
		assign_new_primary_controller device_num = <device_num>
	endif
	if NOT GotParam \{device_num}
		device_num = ($primary_controller)
	endif
	if GotParam \{musicstore}
		if isxenonorwindx
			if NOT NetSessionFunc func = isliveenabled params = {controller_index = <device_num>}
				ui_event_wait event = menu_replace data = {state = uistate_signin_warning player_device = <device_num> allow_back = <allow_back> require_live = <require_live> musicstore = <musicstore>}
				printf \{'ui_signin_handle_warnings: musicstore flag: not IsLiveEnabled'}
				return \{warnings = 1}
			elseif NetSessionFunc func = xenonisguest params = {controller_index = <device_num>}
				ui_event_wait event = menu_replace data = {state = uistate_signin_warning player_device = <device_num> allow_back = <allow_back> require_live = <require_live> musicstore = <musicstore>}
				printf \{'ui_signin_handle_warnings: musicstore flag: XenonIsGuest'}
				return \{warnings = 1}
			endif
		elseif isps3
			if NOT CheckForSignIn controller_index = <device_num>
				ui_event_wait event = menu_replace data = {state = uistate_signin_warning player_device = <device_num> allow_back = <allow_back> require_live = <require_live>}
				printf \{'ui_signin_handle_warnings: musicstore flag: not CheckForSignin'}
				return \{warnings = 1}
			endif
		endif
	elseif GotParam \{jam}
		if isxenonorwindx
			if NOT NetSessionFunc func = isliveenabled params = {controller_index = <device_num>}
				if ($signin_jam_mode = 0)
					ui_event_wait event = menu_replace data = {state = uistate_signin_warning player_device = <device_num> allow_back = <allow_back> require_live = <require_live> jam = <jam>}
					printf \{'ui_signin_handle_warnings: jam flag: $signin_jam_mode = 0'}
					return \{warnings = 1}
				endif
			elseif NetSessionFunc func = xenonisguest params = {controller_index = <device_num>}
				ui_event_wait event = menu_replace data = {state = uistate_signin_warning player_device = <device_num> allow_back = <allow_back> require_live = <require_live> jam = <jam>}
				printf \{'ui_signin_handle_warnings: jam flag: XenonIsGuest'}
				return \{warnings = 1}
			endif
		elseif isps3
			if NOT CheckForSignIn controller_index = <device_num>
				ui_event_wait event = menu_replace data = {state = uistate_signin_warning player_device = <device_num> allow_back = <allow_back> require_live = <require_live> jam = <jam>}
				printf \{'ui_signin_handle_warnings: jam flag: not CheckForSignin'}
				return \{warnings = 1}
			endif
		endif
	elseif GotParam \{require_live}
		if isxenonorwindx
			if NOT CheckForSignIn controller_index = <device_num>
				ui_event_wait event = menu_replace data = {state = uistate_signin_warning player_device = <device_num> allow_back = <allow_back> require_live = <require_live>}
				printf \{'ui_signin_handle_warnings: require_live flag: not CheckForSignin'}
				return \{warnings = 1}
			elseif NetSessionFunc func = xenonisguest params = {controller_index = <device_num>}
				ui_event_wait event = menu_replace data = {state = uistate_signin_warning player_device = <device_num> allow_back = <allow_back> require_live = <require_live>}
				printf \{'ui_signin_handle_warnings: require_live flag: XenonIsGuest'}
				return \{warnings = 1}
			endif
		else
			if NOT CheckForSignIn controller_index = <device_num>
				ui_event_wait event = menu_replace data = {state = uistate_signin_warning player_device = <device_num> allow_back = <allow_back> require_live = <require_live>}
				printf \{'ui_signin_handle_warnings: require_live flag: not CheckForSignin'}
				return \{warnings = 1}
			endif
		endif
	endif
	if isps3
		if GotParam \{boot}
			if NOT CheckForSignIn controller_index = <device_num>
				ui_event_wait event = menu_replace data = {state = uistate_signin_warning player_device = <device_num> allow_back = <allow_back> require_live = <require_live> ps3_boot_warning = 1}
				printf \{'ui_signin_handle_warnings: boot flag: not CheckForSignin'}
				return \{warnings = 1}
			endif
		endif
	endif
	if GotParam \{downloads}
		if NOT CheckForSignIn local controller_index = <device_num>
			ui_event_wait event = menu_replace data = {state = uistate_signin_warning player_device = <device_num> allow_back = <allow_back> downloads = <downloads>}
			printf \{'ui_signin_handle_warnings: downloads flag: not CheckForSignin'}
			return \{warnings = 1}
		endif
	endif
	if GotParam \{leaderboards}
		if NOT CheckForSignIn <signin_params> controller_index = <device_num> network_platform_only
			ui_event_wait event = menu_replace data = {state = uistate_signin_warning player_device = <device_num> allow_back = <allow_back> leaderboards = <leaderboards>}
			printf \{'ui_signin_handle_warnings: leaderboards flag: not CheckForSignin network_platform_only'}
			return \{warnings = 1}
		endif
		if NOT NetSessionFunc func = isliveenabled params = {controller_index = <device_num>}
			ui_event_wait event = menu_replace data = {state = uistate_signin_warning player_device = <device_num> allow_back = <allow_back> leaderboards = <leaderboards>}
			printf \{'ui_signin_handle_warnings: leaderboards flag: not IsLiveEnabled'}
			return \{warnings = 1}
		endif
	endif
	if GotParam \{optional_signin}
		if isxenonorwindx
			if NetSessionFunc func = xenonisguest params = {controller_index = <device_num>}
				ui_event_wait event = menu_replace data = {state = uistate_signin_warning player_device = <device_num> allow_back = <allow_back> jam = <jam> boot = <boot>}
				printf \{'ui_signin_handle_warnings: optional_signin flag: XenonIsGuest'}
				return \{warnings = 1}
			endif
		endif
		if NOT CheckForSignIn local controller_index = <device_num>
			ui_event_wait event = menu_replace data = {state = uistate_signin_warning player_device = <device_num> allow_back = <allow_back> jam = <jam> boot = <boot>}
			printf \{'ui_signin_handle_warnings: optional_signin flag: not CheckForSignin local'}
			return \{warnings = 1}
		endif
	endif
	if NOT CheckForSignIn local controller_index = <device_num>
		if GotParam \{had_require_signin}
			if (<had_require_signin> = 0)
				<require_signin> = 0
			endif
		endif
		ui_event_wait event = menu_replace data = {state = uistate_signin_warning player_device = <device_num> allow_back = <allow_back> jam = <jam> boot = <boot> require_signin = <require_signin>}
		printf \{'ui_signin_handle_warnings: not CheckForSignin local'}
		return \{warnings = 1}
	endif
	return \{warnings = 0}
endscript

script ui_signin_hide_glitch \{no_hide_glitch = 0}
	if (<no_hide_glitch> = 0)
		hide_glitch \{num_frames = 4}
	endif
endscript
