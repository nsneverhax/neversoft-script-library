
script ui_create_boot_download_scan 
	change \{menu_flow_play_sound = 0}
	if ($downloadcontent_enabled = 0)
		spawnscriptnow ui_event_wait params = <event_params>
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
		create_popup_warning_menu {
			textblock = {
				text = qs(0x6a959427)
			}
			player_device = <controller>
		}
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
	get_current_first_play
	if ($shutdown_game_for_signin_change_flag = 1)
		return
	endif
	if ($invite_controller != -1)
		change \{signin_jam_mode = 0}
		spawnscriptnow \{ui_boot_guitar_follow_invite}
		return
	endif
	if NOT ui_event_exists_in_stack \{name = 'mainmenu'}
		if isrbdrum \{controller = $primary_controller}
			ui_event_wait event = menu_replace data = {state = uistate_optimal_drum event_params = <event_params>}
		else
			ui_event_wait <event_params>
		endif
	else
		ui_event_wait <event_params>
	endif
	if structurecontains structure = (<event_params>.data) state
		if ((<event_params>.data.state) = uistate_jam)
			create_loading_screen \{jam_mode = 1}
		endif
	endif
	change respond_to_signin_changed = ($store_respond_to_signin_changed)
endscript

script ui_destroy_boot_download_scan 
	if NOT ui_event_exists_in_stack \{name = 'mainmenu'}
		menu_start_transition
		destroyscreenelement \{id = current_menu_anchor}
		createscreenelement \{type = spriteelement
			id = current_menu_anchor
			parent = root_window
			texture = main_menu_bg_1
			pos = (0.0, 0.0)
			just = [
				left
				top
			]
			dims = (1280.0, 720.0)}
	endif
	destroy_popup_warning_menu
	clean_up_user_control_helpers
endscript
