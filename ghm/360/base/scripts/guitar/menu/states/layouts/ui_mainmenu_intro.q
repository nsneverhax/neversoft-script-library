
script ui_create_mainmenu_intro 
	SpawnScriptNow \{ui_create_mainmenu_intro_spawned}
endscript

script ui_destroy_mainmenu_intro 
	if ScriptIsRunning \{ui_create_mainmenu_intro}
		KillSpawnedScript \{Name = ui_create_mainmenu_intro}
		DestroyScreenElement \{id = current_menu}
	endif
endscript

script ui_create_mainmenu_intro_spawned 
	if ($invite_controller = -1)
		frontend_load_soundcheck \{loadingscreen}
		z_soundcheck_uiresetpos
		ui_event_wait \{event = menu_replace
			data = {
				state = uistate_mainmenu
			}}
	else
		ui_event_block \{event = menu_replace
			data = {
				state = uistate_mainmenu
			}}
	endif
endscript
