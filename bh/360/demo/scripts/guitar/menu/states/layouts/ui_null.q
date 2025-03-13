
script ui_create_null \{object = 1}
	if NOT cd
		if NOT gotparam \{initing}
			if screenelementexists \{id = root_window}
				if (<object> = 1)
					spawnscriptnow \{ui_null_warning_spawned}
				endif
			endif
		endif
	endif
	ui_event_remove_params \{param = initing}
endscript

script ui_destroy_null 
	if NOT cd
		if screenelementexists \{id = root_window}
			killspawnedscript \{name = ui_null_warning_spawned}
			destroy_dialog_box
		endif
	endif
endscript

script ui_null_warning_spawned 
	wait \{5
		seconds}
	if notcd
		body_text = qs(0x9386c855)
		text = qs(0xc5d17a22)
	else
		body_text = qs(0x36f71bcc)
		text = qs(0x182f0173)
	endif
	create_dialog_box {
		body_text = <body_text>
		options = [
			{
				func = generic_event_choose
				func_params = {state = uistate_freeplay data = {clear_previous_stack}}
				text = <text>
			}
		]
		use_all_controllers
	}
endscript
