
script ui_create_tutorial_band_load 
	destroy_generic_menu
	spawnscriptlater ui_create_tutorial_band_load_spawned params = {<...>}
endscript

script ui_create_tutorial_band_load_spawned 
	requireparams \{[
			tutorial_header
			title
		]
		all}
	ui_event_wait_for_safe
	ui_event event = menu_change data = {
		state = uistate_tutorial_menu_skill_level
		tutorial_header = <tutorial_header>
		title = <title>
		check_lefty_flip = <check_lefty_flip>
	}
endscript
