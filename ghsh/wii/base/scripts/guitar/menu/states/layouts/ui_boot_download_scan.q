
script ui_create_boot_download_scan 
	Change \{menu_flow_play_sound = 0}
	if ($downloadcontent_enabled = 0)
		SpawnScriptNow \{ui_event_wait
			params = {
				event = menu_replace
				data = {
					state = uistate_mainmenu_intro
				}
			}}
		return
	endif
	Change store_respond_to_signin_changed = ($respond_to_signin_changed)
	Change \{respond_to_signin_changed = 1}
	GetPlatform
	switch <Platform>
		case PS3
		create_popup_warning_menu {
			textblock = {
				text = qs(0x75e1afbf)
			}
			player_device = <controller>
		}
		case Xenon
		create_popup_warning_menu {
			textblock = {
				text = qs(0x6a959427)
			}
			player_device = <controller>
		}
		case ngc
		create_popup_warning_menu \{textblock = {
				text = qs(0x84664328)
			}}
	endswitch
	SpawnScriptNow boot_download_scan params = {controller = <controller> <...>}
endscript

script boot_download_scan \{event_params = {
			event = menu_replace
			data = {
				state = uistate_mainmenu_intro
			}
		}}
	Wait \{1
		gameframes}
	Downloads_EnumContent controller = <controller>
	get_current_first_play
	Wait \{2
		Seconds}
	if ($shutdown_game_for_signin_change_flag = 1)
		return
	endif
	SpawnScriptNow ui_event_wait params = <event_params>
	Change respond_to_signin_changed = ($store_respond_to_signin_changed)
endscript

script ui_destroy_boot_download_scan 
	destroy_popup_warning_menu
endscript
