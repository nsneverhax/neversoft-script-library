
script ui_create_mainmenu_intro 
	spawnscriptnow \{ui_create_mainmenu_intro_spawned}
endscript

script ui_destroy_mainmenu_intro 
	if ScriptIsRunning \{ui_create_mainmenu_intro}
		KillSpawnedScript \{name = ui_create_mainmenu_intro}
		DestroyScreenElement \{id = current_menu}
	endif
endscript

script ui_create_mainmenu_intro_spawned 
	if ($invite_controller = -1)
		frontend_load_soundcheck
		z_soundcheck_UIResetPos
		ui_event_wait \{event = menu_replace
			data = {
				state = UIstate_mainmenu
			}}
	else
		ui_event_block \{event = menu_replace
			data = {
				state = UIstate_mainmenu
			}}
	endif
endscript
