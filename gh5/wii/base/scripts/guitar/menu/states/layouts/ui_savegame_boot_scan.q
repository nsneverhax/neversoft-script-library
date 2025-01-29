initial_load_done = 0

script ui_init_savegame_boot_scan 
	disablereset
	set_home_button_notallowed
	destroy_loading_screen
	StartRendering
	setup_bg_viewport
	fadetoblack \{OFF
		time = 0.0
		no_wait}
	choose_random_loading_screen \{booting = 1}
	Change reuse_last_loading_screen = <random_screen>
	screen = ($loading_screens [<random_screen>])
	LoadPak (<screen>.pak)
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = loading_screen_container
		Pos = (0.0, 0.0)
		just = [
			left
			center
		]
		z_priority = 0}
	CreateScreenElement \{Type = SpriteElement
		parent = loading_screen_container
		id = loading_screen_background
		texture = loading_background
		Pos = (640.0, 360.0)
		just = [
			center
			center
		]
		dims = (1280.0, 720.0)
		z_priority = 1}
	CreateScreenElement {
		Type = descinterface
		parent = root_window
		desc = 'loading_boot_scan'
		id = loading_screen_tips
		tip_text = (<screen>.text)
	}
	savegame_set_ui_state \{state = boot}
	Change \{initial_load_done = 1}
endscript

script ui_deinit_savegame_boot_scan 
	StopRendering
	if ScreenElementExists \{id = loading_screen_background}
		DestroyScreenElement \{id = loading_screen_background}
	endif
	if ScreenElementExists \{id = loading_screen_container}
		DestroyScreenElement \{id = loading_screen_container}
	endif
	if ScreenElementExists \{id = loading_screen_tips}
		DestroyScreenElement \{id = loading_screen_tips}
	endif
	unload_all_loading_screen_paks
	destroy_bg_viewport
	create_loading_screen \{force_predisplay = 1}
	savegame_set_ui_state \{state = fullscreen}
	set_home_button_allowed
	enablereset
endscript

script ui_create_savegame_boot_scan 
	printscriptinfo \{'ui_create_savegame_boot_scan'}
	if NOT GotParam \{finished_scan}
		set_home_button_notallowed
		SpawnScriptNow ui_create_savegame_boot_scan_spawned params = {finish_state = <finish_state>}
	else
		SpawnScriptNow ui_event_block params = {event = menu_replace data = {state = <finish_state>}}
	endif
endscript

script ui_create_savegame_boot_scan_spawned 
	printstruct <...>
	Wait \{2
		gameframes}
	event_params = {event = menu_back data = {state = uistate_savegame_boot_scan finished_scan}}
	ui_event event = menu_change data = {state = uistate_memcard Type = boot event_params = <event_params>}
endscript

script ui_destroy_savegame_boot_scan 
	hide_glitch \{num_frames = 5}
	printscriptinfo \{'ui_destroy_savegame_boot_scan'}
endscript
