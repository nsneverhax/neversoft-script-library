
script ui_create_tutorial_guitar_load_advanced 
	destroy_generic_menu
	tutorial_system_set_part \{part = guitar}
	spawnscriptlater ui_create_tutorial_guitar_load_advanced_spawned params = {<...>}
endscript

script ui_create_tutorial_guitar_load_advanced_spawned 
	requireparams \{[
			tutorial_header
			tutorial_id
		]
		all}
	ui_event_wait_for_safe
	ui_event event = menu_change data = {
		state = uistate_tutorial_menu_lessons
		tutorial_header = <tutorial_header>
		tutorial_id = <tutorial_id>
	}
endscript
