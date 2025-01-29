
script ui_create_null \{object = 1}
	if NOT CD
		if NOT GotParam \{initing}
			if ScreenElementExists \{id = root_window}
				if (<object> = 1)
					SpawnScriptNow \{ui_null_warning_spawned}
				endif
			endif
		endif
	endif
	ui_event_remove_params \{param = initing}
endscript

script ui_destroy_null 
	if NOT CD
		if ScreenElementExists \{id = root_window}
			KillSpawnedScript \{Name = ui_null_warning_spawned}
			destroy_dialog_box
		endif
	endif
	KillSpawnedScript \{Name = ui_null_continue_from_warning_spawned}
endscript

script ui_null_warning_spawned 
	Wait \{5
		Seconds}
	if NotCD
		body_text = qs(0x9386c855)
		text = qs(0xc5d17a22)
	else
		body_text = qs(0x36f71bcc)
		text = qs(0x182f0173)
	endif
	SpawnScriptNow \{ui_null_continue_from_warning_spawned}
	create_dialog_box {
		body_text = <body_text>
		options = [
			{
				func = ui_null_continue_from_warning
				text = <text>
			}
		]
		use_all_controllers
	}
	AssignAlias id = <menu_id> alias = null_warning_popup
endscript

script ui_null_continue_from_warning 
	ui_sfx \{menustate = Generic
		uitype = select}
	generic_event_choose \{state = uistate_freeplay
		data = {
		}}
endscript

script ui_null_continue_from_warning_spawned 
	Wait \{20
		Seconds}
	if ScreenElementExists \{id = null_warning_popup}
		LaunchEvent \{Type = unfocus
			target = null_warning_popup}
		null_warning_popup :se_setprops \{block_events}
	endif
	ui_null_continue_from_warning
endscript
