
script ui_create_options_cheats_warning 
	if isps3
		text = qs(0x3e5dab01)
	elseif isXenon
		text = qs(0xa91deaf6)
	elseif isngc
		text = qs(0x8a9607bc)
	else
		text = qs(0x390b2813)
	endif
	create_dialog_box {
		template = large_body
		body_text = <text>
		player_device = ($primary_controller)
		no_background
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
	destroy_dialog_box
endscript

script ui_options_cheats_warning_back 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if is_ui_event_running
		return
	endif
	SpawnScriptNow \{ui_options_cheats_warning_back_spawned}
endscript

script ui_options_cheats_warning_back_spawned 
	StopRendering
	ui_event \{event = menu_back}
	ui_event_wait_for_safe
	ui_options_check_settings
	ui_event_wait_for_safe
	StartRendering
endscript
