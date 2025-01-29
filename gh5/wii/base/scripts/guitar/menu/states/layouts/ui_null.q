ui_null_created = 0

script ui_create_null \{object = 1}
	if NOT CD
		if ($ui_null_created = 1)
			if (<object> = 1)
				SpawnScriptNow \{ui_null_warning_spawned}
			endif
		endif
	endif
	Change \{ui_null_created = 1}
endscript

script ui_destroy_null 
	if NOT CD
		if ScreenElementExists \{id = root_window}
			KillSpawnedScript \{Name = ui_null_warning_spawned}
			destroy_dialog_box
		endif
	endif
endscript

script ui_null_warning_spawned 
	Wait \{5
		Seconds}
	create_dialog_box \{body_text = qs(0x9386c855)
		options = [
			{
				func = generic_event_choose
				func_params = {
					state = uistate_freeplay
					data = {
						clear_previous_stack
					}
				}
				text = qs(0x2fba7167)
			}
		]
		use_all_controllers}
endscript
