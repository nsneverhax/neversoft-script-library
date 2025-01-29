
script ui_create_null \{object = 1}
	if NOT CD
		if ScreenElementExists \{id = root_window}
			if (<object> = 1)
				SpawnScriptNow \{ui_null_warning_spawned}
			endif
		endif
	endif
endscript

script ui_destroy_null 
	if NOT CD
		if ScreenElementExists \{id = root_window}
			KillSpawnedScript \{Name = ui_null_warning_spawned}
			destroy_popup_warning_menu
		endif
	endif
endscript

script ui_null_warning_spawned 
	Wait \{5
		Seconds}
	create_popup_warning_menu \{textblock = {
			text = qs(0x9386c855)
			dims = (600.0, 400.0)
			Scale = 0.6
		}
		menu_pos = (640.0, 480.0)
		options = [
			{
				func = {
					generic_event_choose
					params = {
						state = uistate_mainmenu
						data = {
							clear_previous_stack
						}
					}
				}
				text = qs(0x480ec134)
			}
		]
		use_all_controllers}
endscript
