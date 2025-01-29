
script ui_create_boot_download_scan 
	Change \{menu_flow_play_sound = 0}
	if ($downloadcontent_enabled = 0)
		SpawnScriptNow \{ui_event_wait
			params = {
				event = menu_replace
				data = {
					state = uistate_boot_guitar
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
				text = qs(0xeef4272c)
			}
			player_device = <controller>
		}
	endswitch
	SpawnScriptNow boot_download_scan params = {controller = <controller> <...>}
endscript

script boot_download_scan \{event_params = {
			event = menu_replace
			data = {
				state = uistate_boot_guitar
			}
		}}
	Wait \{1
		gameframes}
	StartRendering \{reason = menu_transition}
	if NOT ui_event_exists_in_stack \{Name = 'mainmenu'}
		if ControllerPressed X <controller>
			if ControllerPressed circle <controller>
				if ControllerPressed Square <controller>
					if ControllerPressed Triangle <controller>
						printf \{qs(0xa1f3a821)}
						removecontentfiles \{playerid = -1
							clear_cache}
					endif
				endif
			endif
		endif
	endif
	GetStartTime
	Downloads_EnumContent controller = <controller>
	get_current_first_play
	begin
	getelapsedtime starttime = <starttime>
	if (<ElapsedTime> > 1000)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	if ($shutdown_game_for_signin_change_flag = 1)
		return
	endif
	ui_event_wait <event_params>
	if ((<event_params>.data.state) = uistate_jam)
		create_loading_screen \{jam_mode = 1}
	endif
	Change respond_to_signin_changed = ($store_respond_to_signin_changed)
endscript

script ui_destroy_boot_download_scan 
	destroy_popup_warning_menu
endscript
