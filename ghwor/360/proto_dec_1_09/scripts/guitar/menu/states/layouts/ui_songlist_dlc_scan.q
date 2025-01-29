
script 0x61a007cf \{0x28f2d5b2 = menu_replace
		0x3002594a = {
		}}
	if NOT InNetGame
		SpawnScriptNow songlist_dlc_scan_choose_scan_spawned params = {0x28f2d5b2 = <0x28f2d5b2> 0x3002594a = <0x3002594a>}
	else
		SpawnScriptNow 0xf6969029 params = {0x28f2d5b2 = <0x28f2d5b2> 0x3002594a = <0x3002594a>}
	endif
endscript

script 0x2e326f42 
endscript

script songlist_dlc_scan_choose_scan_spawned \{0x28f2d5b2 = !q1768515945
		0x3002594a = 0x69696969}
	get_savegame_from_controller controller = ($primary_controller)
	gamemode_gettype
	<show_help_page> = 0
	if (<Type> = quickplay)
		if (<0x28f2d5b2> != menu_back)
			universal_help_display_help_check help_context = quickplay_songlist device_num = ($primary_controller)
		endif
	endif
	ui_event_wait_for_safe
	if (<show_help_page> = 1)
		generic_event_replace {
			state = uistate_boot_download_scan
			data = {
				savegame = <savegame>
				controller = ($primary_controller)
				Force = 0
				event_params = {
					event = <0x28f2d5b2>
					data = {
						state = uistate_universal_help
						next_state_name = uistate_songlist
						next_state_params = <0x3002594a>
						device_num = ($primary_controller)
						help_global_index = <help_index>
					}
				}
			}
		}
	else
		generic_event_replace {
			state = uistate_boot_download_scan
			data = {
				savegame = <savegame>
				controller = ($primary_controller)
				Force = 0
				event_params = {
					event = <0x28f2d5b2>
					data = {
						state = uistate_songlist
						<0x3002594a>
					}
				}
			}
		}
	endif
endscript

script 0xf6969029 \{0x28f2d5b2 = !q1768515945
		0x3002594a = 0x69696969}
	gamemode_gettype
	<show_help_page> = 0
	if (<Type> = quickplay)
		if (<0x28f2d5b2> != menu_back)
			universal_help_display_help_check help_context = quickplay_songlist device_num = ($primary_controller)
		endif
	endif
	ui_event_wait_for_safe
	if (<show_help_page> = 1)
		generic_event_replace {
			state = uistate_universal_help
			data = {
				state = uistate_universal_help
				next_state_name = uistate_songlist
				next_state_params = <0x3002594a>
				device_num = ($primary_controller)
				help_global_index = <help_index>
			}
		}
	else
		ui_event event = <0x28f2d5b2> data = {state = uistate_songlist <0x3002594a>}
	endif
endscript
