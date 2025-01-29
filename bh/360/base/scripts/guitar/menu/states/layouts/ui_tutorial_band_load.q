
script ui_create_tutorial_band_load 
	destroy_generic_menu
	spawnscriptlater ui_create_tutorial_band_load_spawned params = {<...>}
endscript

script ui_create_tutorial_band_load_spawned 
	RequireParams \{[
			tutorial_header
			Title
		]
		all}
	ui_event_wait_for_safe
	ui_event event = menu_change data = {
		state = UIstate_tutorial_menu_skill_level
		tutorial_header = <tutorial_header>
		Title = <Title>
		check_lefty_flip = <check_lefty_flip>
	}
endscript
