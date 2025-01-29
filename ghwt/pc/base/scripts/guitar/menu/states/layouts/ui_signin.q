signin_continue_state = uistate_boot_guitar
signin_continue_data = {
}
signin_jam_mode = 0
store_respond_to_signin_changed = 0
alternative_primary_selected = -1

script ui_init_signin 
	change \{signin_continue_state = uistate_boot_guitar}
	change \{signin_continue_data = {
		}}
	change store_respond_to_signin_changed = ($respond_to_signin_changed)
	change \{respond_to_signin_changed = 0}
	change \{respond_to_signin_changed_func = ui_signin_changed_func}
	change \{alternative_primary_selected = -1}
endscript

script ui_create_signin \{new_data = {
		}}
	printscriptinfo \{'ui_create_signin'}
	if gotparam \{new_state}
		change signin_continue_state = <new_state>
		change signin_continue_data = <new_data>
	endif
	spawnscriptnow ui_signin_check params = <...>
endscript

script ui_destroy_signin 
	destroy_popup_warning_menu
endscript

script ui_deinit_signin 
	change respond_to_signin_changed = ($store_respond_to_signin_changed)
	change \{respond_to_signin_changed_func = none}
endscript

script assign_new_primary_controller 
	if ($primary_controller_assigned = 0)
		first_press = 1
	endif
	change primary_controller = <device_num>
	change \{primary_controller_assigned = 1}
	change structurename = player1_status controller = ($primary_controller)
	change globalname = player1_device newvalue = ($primary_controller)
	change last_start_pressed_device = ($primary_controller)
	if gotparam \{first_press}
		change \{respond_to_signin_changed_func = ui_signin_changed_first_press}
		memcard_secondary_signin_first_press
	endif
	if ($invite_controller = -1)
		netsessionfunc \{func = removeallcontrollers}
	endif
	netsessionfunc func = addcontrollers params = {controller = <device_num>}
endscript

script ui_signin_changed_first_press 
	printf \{qs(0x23492f74)}
	if NOT (<controller> = $primary_controller)
		if islocallysignedin controller = <controller>
			printf \{qs(0xac06c05e)}
			change alternative_primary_selected = <controller>
		endif
	endif
endscript

script ui_signin_changed_func 
	printf \{qs(0xd7935d9a)}
	removecontentfiles playerid = <controller>
	reset_globaltags savegame = <controller>
	cheat_turnoffalllocked
endscript
ps3_done_signin_check = 0

script ui_signin_check \{primary = 1
		force_signin = 0
		boot = 0}
	printf \{'--- ui_signin_check'}
	printstruct <...>
	change \{enable_saving = 1}
	if ($invite_controller != -1)
		printf 'Load soundcheck for non-primary player invite - controller %c' c = ($invite_controller)
		frontend_load_soundcheck \{loadingscreen
			async = 0}
	endif
	if (<primary> = 1)
		if gotparam \{device_num}
			assign_new_primary_controller device_num = <device_num>
		endif
	endif
	if ((isps3) || (iswinport))
		if ($ps3_done_signin_check = 1)
			if ($0x8bcedbb2 = 1)
				ui_event_wait \{event = menu_replace
					data = {
						state = 0xba517d72
						online_menu
					}}
				return
			endif
			if ($0xe1d01ead = 1)
				ui_event_wait \{event = menu_replace
					data = {
						state = 0xba517d72
						online_menu
					}}
				return
			endif
			if NOT iswinport
				if gotparam \{require_live}
					netsessionfunc func = onlinesignin params = {
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
			endif
			if current_band_has_band_name controller = <device_num>
				destroy_popup_warning_menu
				ui_event_wait event = menu_replace state = $signin_continue_state data = ($signin_continue_data)
				return
			endif
			ui_signin_process_complete controller = <device_num>
			<callback> <callback_params>
			return
		endif
		change \{ps3_done_signin_check = 1}
	endif
	signin_params = {local}
	if gotparam \{require_live}
		signin_params = {}
	endif
	if ((isps3) || (iswinport))
		if gotparam \{leaderboards}
			signin_params = {}
		endif
	endif
	perform_signin = 0
	if (<force_signin> = 1)
		perform_signin = 1
	endif
	if NOT checkforsignin <signin_params> controller_index = <device_num>
		perform_signin = 1
		if gotparam \{jam}
			if isxenon
				if netsessionfunc func = isliveenabled params = {controller_index = <device_num>}
					perform_signin = 0
				endif
			endif
		endif
	endif
	if netsessionfunc func = xenonisguest params = {controller_index = <device_num>}
		perform_signin = 1
	endif
	if (<perform_signin> = 1)
		dynamicadmanager_issuecue \{cue = connect}
		if NOT (<boot>)
			if NOT (<force_signin>)
				ui_signin_handle_warnings <...>
				if (<warnings> = 1)
					return
				endif
			endif
		endif
		if (gotparam boot)
			if NOT (netsessionfunc func = isconnected)
				netsessionfunc \{func = getautologinsetting}
				if (<autologinsetting> = autologinon)
					startrendering
					ui_event_wait \{event = menu_replace
						state = 0xf0870437}
					return
				elseif (<autologinsetting> != autologinoff)
					startrendering
					ui_event_wait event = menu_replace data = {state = 0xba517d72 <params> boot}
					return
				endif
			endif
		else
			ui_signin_handle_warnings <...>
			if (<warnings> = 1)
				return
			endif
		endif
	else
		if gotparam \{leaderboards}
			ui_signin_handle_warnings <...>
			if (<warnings> = 1)
				return
			endif
		endif
		if NOT gotparam \{jam}
			if current_band_has_band_name controller = <device_num>
				destroy_popup_warning_menu
				ui_event_wait event = menu_replace state = $signin_continue_state data = ($signin_continue_data)
				return
			endif
		endif
	endif
	if iswinport
		netsessionfunc \{func = motd_uninit}
		netsessionfunc \{func = motd_init}
		ui_signin_process_complete controller = <device_num>
		<callback> controller = <device_num> <callback_params>
	else
		if checkforsignin
			netsessionfunc \{func = stats_uninit}
			netsessionfunc \{func = stats_init}
			netsessionfunc \{func = motd_uninit}
			netsessionfunc \{func = motd_init}
			netsessionfunc \{func = live_settings_init}
		elseif checkforsignin \{local}
			netsessionfunc \{func = live_settings_init}
		endif
		ui_event_wait \{event = menu_replace
			data = {
				state = uistate_signin_complete
			}}
	endif
endscript

script ui_signin_process_complete \{controller = -1}
	begin
	if issigninfinished
		break
	endif
	wait \{1
		gameframe}
	repeat
	if (<controller> = -1)
		controller = ($primary_controller)
	endif
	if isxenon
		startgameprofilesettingsread controller = <controller>
		begin
		if gameprofilesettingsfinished controller = <controller>
			break
		endif
		repeat
		if getgameprofilesetting gsid = 1 controller = <controller>
			setarrayelement arrayname = default_difficulty globalarray index = <controller> newvalue = easy
			if (<game_setting> = 3)
				setarrayelement arrayname = default_difficulty globalarray index = <controller> newvalue = medium
			elseif (<game_setting> = 4)
				setarrayelement arrayname = default_difficulty globalarray index = <controller> newvalue = hard
			endif
		endif
	endif
	start_checking_for_signin_change
	if checksumequals a = ($signin_continue_state) b = uistate_boot_guitar
		callback = ui_event
		callback_params = {event = menu_replace data = {state = uistate_memcard}}
	else
		callback = ui_memcard_autoload
		callback_params = {this_event = menu_replace state = $signin_continue_state data = ($signin_continue_data)}
	endif
	ui_event_wait_for_safe
	return callback = <callback> callback_params = <callback_params>
endscript

script ui_create_signin_complete 
	spawnscriptnow \{create_signin_complete_menu}
endscript

script ui_destroy_signin_complete 
	destroy_signin_complete_menu
endscript

script ui_create_signin_warning 
	create_signin_warning_menu <...>
endscript

script ui_destroy_signin_warning 
	destroy_signin_warning_menu
endscript

script ui_signin_warning_back 
	change \{force_mainmenu_signin = 1}
	generic_event_back \{nosound}
endscript

script ui_signin_handle_warnings 
	if NOT ($alternative_primary_selected = -1)
		device_num = ($alternative_primary_selected)
		change \{alternative_primary_selected = -1}
		assign_new_primary_controller device_num = <device_num>
	endif
	if gotparam \{require_live}
		if gotparam \{jam}
			if isxenon
				if NOT netsessionfunc func = isliveenabled params = {controller_index = <device_num>}
					ui_event_wait event = menu_replace data = {state = uistate_signin_warning player_device = <device_num> allow_back = <allow_back> require_live = <require_live>}
					return \{warnings = 1}
				elseif netsessionfunc func = xenonisguest params = {controller_index = <device_num>}
					ui_event_wait event = menu_replace data = {state = uistate_signin_warning player_device = <device_num> allow_back = <allow_back> require_live = <require_live>}
					return \{warnings = 1}
				endif
			elseif isps3
				if NOT checkforsignin controller_index = <device_num>
					ui_event_wait event = menu_replace data = {state = uistate_signin_warning player_device = <device_num> allow_back = <allow_back> require_live = <require_live>}
					return \{warnings = 1}
				elseif netsessionfunc func = xenonisguest params = {controller_index = <device_num>}
					ui_event_wait event = menu_replace data = {state = uistate_signin_warning player_device = <device_num> allow_back = <allow_back> require_live = <require_live>}
					return \{warnings = 1}
				endif
			endif
		else
			if NOT checkforsignin controller_index = <device_num>
				ui_event_wait event = menu_replace data = {state = uistate_signin_warning player_device = <device_num> allow_back = <allow_back> require_live = <require_live>}
				return \{warnings = 1}
			elseif netsessionfunc func = xenonisguest params = {controller_index = <device_num>}
				ui_event_wait event = menu_replace data = {state = uistate_signin_warning player_device = <device_num> allow_back = <allow_back> require_live = <require_live>}
				return \{warnings = 1}
			endif
		endif
	endif
	if ((isps3) || (iswinport))
		if gotparam \{boot}
			if NOT checkforsignin controller_index = <device_num>
				ui_event_wait event = menu_replace data = {state = uistate_signin_warning player_device = <device_num> allow_back = <allow_back> require_live = <require_live>}
				return \{warnings = 1}
			endif
		endif
	endif
	if gotparam \{downloads}
		if NOT checkforsignin local controller_index = <device_num>
			ui_event_wait event = menu_replace data = {state = uistate_signin_warning player_device = <device_num> allow_back = <allow_back> downloads = <downloads>}
			return \{warnings = 1}
		endif
	endif
	if gotparam \{leaderboards}
		if NOT checkforsignin <signin_params> controller_index = <device_num>
			ui_event_wait event = menu_replace data = {state = uistate_signin_warning player_device = <device_num> allow_back = <allow_back> leaderboards = <leaderboards>}
			return \{warnings = 1}
		endif
		if NOT netsessionfunc func = isliveenabled params = {controller_index = <device_num>}
			ui_event_wait event = menu_replace data = {state = uistate_signin_warning player_device = <device_num> allow_back = <allow_back> leaderboards = <leaderboards>}
			return \{warnings = 1}
		endif
	endif
	if NOT checkforsignin local controller_index = <device_num>
		ui_event_wait event = menu_replace data = {state = uistate_signin_warning player_device = <device_num> allow_back = <allow_back> jam = <jam> boot = <boot>}
		return \{warnings = 1}
	endif
	return \{warnings = 0}
endscript
