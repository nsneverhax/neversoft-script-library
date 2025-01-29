
script ui_create_tutorial_guitar_load_intermediate 
	destroy_generic_menu
	tutorial_system_set_part \{part = guitar}
	SpawnScriptLater ui_create_tutorial_guitar_load_intermediate_spawned params = {<...>}
endscript

script ui_create_tutorial_guitar_load_intermediate_spawned 
	RequireParams \{[
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
