
script ui_create_mainmenu_intro 
	spawnscriptnow \{ui_create_mainmenu_intro_spawned}
endscript

script ui_destroy_mainmenu_intro 
	if scriptisrunning \{ui_create_mainmenu_intro}
		killspawnedscript \{name = ui_create_mainmenu_intro}
		destroyscreenelement \{id = current_menu}
	endif
endscript

script ui_mainmenu_intro_anim_out 
	startrendering \{reason = menu_transition}
endscript

script ui_create_mainmenu_intro_spawned 
	if ($invite_controller = -1)
		frontend_load_soundcheck \{loadingscreen}
		z_soundcheck_uiresetpos
		z_soundcheck_uianimationpre
		ui_event_wait_for_safe
		wait \{0.1
			seconds}
		fadetoblack \{off
			no_wait}
		wait \{0.5
			seconds}
		create_main_menu_elements
		z_soundcheck_uianimation
		soundevent \{event = front_end_main_menu_intro}
		soundevent \{event = front_end_main_menu_intro_rears}
		wait \{2.4
			seconds}
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
