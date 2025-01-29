
script ui_create_boot_download_scan 
	change \{menu_flow_play_sound = 0}
	if ($downloadcontent_enabled = 0)
		spawnscriptnow \{ui_event_wait
			params = {
				event = menu_replace
				data = {
					state = uistate_boot_guitar
				}
			}}
		return
	endif
	change store_respond_to_signin_changed = ($respond_to_signin_changed)
	change \{respond_to_signin_changed = 1}
	getplatform
	switch <platform>
		case ps3
		create_popup_warning_menu {
			textblock = {
				text = qs(0x75e1afbf)
			}
			player_device = <controller>
		}
		case xenon
		if iswinport
			create_popup_warning_menu {
				textblock = {
					text = qs(0x37da3a1e)
				}
				player_device = <controller>
			}
		else
			create_popup_warning_menu {
				textblock = {
					text = qs(0xeef4272c)
				}
				player_device = <controller>
			}
		endif
	endswitch
	spawnscriptnow boot_download_scan params = {controller = <controller> <...>}
endscript

script boot_download_scan \{event_params = {
			event = menu_replace
			data = {
				state = uistate_boot_guitar
			}
		}}
	wait \{1
		gameframes}
	startrendering \{reason = menu_transition}
	if NOT ui_event_exists_in_stack \{name = 'mainmenu'}
		if controllerpressed x <controller>
			if controllerpressed circle <controller>
				if controllerpressed square <controller>
					if controllerpressed triangle <controller>
						printf \{qs(0xa1f3a821)}
						removecontentfiles \{playerid = -1
							clear_cache}
					endif
				endif
			endif
		endif
	endif
	getstarttime
	downloads_enumcontent controller = <controller>
	get_current_first_play
	begin
	getelapsedtime starttime = <starttime>
	if (<elapsedtime> > 1000)
		break
	endif
	wait \{1
		gameframe}
	repeat
	if ($shutdown_game_for_signin_change_flag = 1)
		return
	endif
	ui_event_wait <event_params>
	if ((<event_params>.data.state) = uistate_jam)
		create_loading_screen \{jam_mode = 1}
	endif
	change respond_to_signin_changed = ($store_respond_to_signin_changed)
endscript

script ui_destroy_boot_download_scan 
	destroy_popup_warning_menu
endscript
