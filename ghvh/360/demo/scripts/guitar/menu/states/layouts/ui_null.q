
script ui_create_null \{object = 1}
	if NOT cd
		if screenelementexists \{id = root_window}
			if (<object> = 1)
				spawnscriptnow \{ui_null_warning_spawned}
			endif
		endif
	endif
endscript

script ui_destroy_null 
	if NOT cd
		if screenelementexists \{id = root_window}
			killspawnedscript \{name = ui_null_warning_spawned}
			destroy_popup_warning_menu
		endif
	endif
endscript

script ui_null_warning_spawned 
	wait \{5
		seconds}
	create_popup_warning_menu \{textblock = {
			text = qs(0x9386c855)
			dims = (600.0, 400.0)
			scale = 0.6
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
