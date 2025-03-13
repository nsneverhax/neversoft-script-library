
script ui_create_mainmenu_intro 
	spawnscriptnow \{ui_create_mainmenu_intro_spawned}
endscript

script ui_destroy_mainmenu_intro 
	if scriptisrunning \{ui_create_mainmenu_intro}
		killspawnedscript \{name = ui_create_mainmenu_intro}
		destroyscreenelement \{id = current_menu}
	endif
endscript

script ui_create_mainmenu_intro_spawned 
	ui_event_block \{event = menu_replace
		data = {
			state = uistate_mainmenu
		}}
endscript
