
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
	fadetoblack \{OFF
		no_wait}
	ui_event_block \{event = menu_replace
		data = {
			state = uistate_mainmenu
		}}
endscript
