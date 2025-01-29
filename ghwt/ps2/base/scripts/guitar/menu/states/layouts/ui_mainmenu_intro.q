
script ui_create_mainmenu_intro 
	SpawnScriptNow \{ui_create_mainmenu_intro_spawned}
endscript

script ui_destroy_mainmenu_intro 
	if ScriptIsRunning \{ui_create_mainmenu_intro}
		KillSpawnedScript \{Name = ui_create_mainmenu_intro}
		DestroyScreenElement \{id = current_menu}
	endif
endscript

script ui_mainmenu_intro_anim_out 
	StartRendering \{reason = menu_transition}
endscript

script ui_create_mainmenu_intro_spawned 
	if ($invite_controller = -1)
		frontend_load_soundcheck \{loadingscreen}
		z_soundcheck_uiresetpos
		z_soundcheck_uianimationpre
		ui_event_wait_for_safe
		Wait \{0.1
			Seconds}
		fadetoblack \{OFF
			no_wait}
		Wait \{0.5
			Seconds}
		create_main_menu_elements
		z_soundcheck_uianimation
		SoundEvent \{event = front_end_main_menu_intro}
		Wait \{2.4
			Seconds}
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
