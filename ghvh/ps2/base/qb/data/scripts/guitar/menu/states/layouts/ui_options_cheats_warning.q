
script ui_create_options_cheats_warning 
	if isps3
		text = qs(0x5c2820a1)
	else
		text = qs(0xb30a2538)
	endif
	create_popup_warning_menu {
		textblock = {
			text = <text>
		}
		player_device = ($primary_controller)
		no_background
		long
		options = [
			{
				func = generic_event_back
				text = qs(0xf7723015)
			}
			{
				func = ui_options_cheats_warning_back
				text = qs(0x182f0173)
			}
		]
	}
endscript

script ui_destroy_options_cheats_warning 
	destroy_popup_warning_menu
endscript

script ui_options_cheats_warning_back 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if is_ui_event_running
		return
	endif
	ui_event \{event = menu_back}
	SpawnScriptNow \{ui_options_cheats_warning_back_spawned}
endscript

script ui_options_cheats_warning_back_spawned 
	Wait \{5
		gameframes}
	ui_event_wait_for_safe
	ui_options_check_settings
endscript
