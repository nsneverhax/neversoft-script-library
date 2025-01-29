
script freestyle_create_post_load_screen 
	halt_wii_notifications
	CreateScreenElement \{Type = descinterface
		parent = root_window
		desc = 'freestyle_loading_screen_tree_2'
		id = post_load_screen
		z_priority = 1000000}
	if ScreenElementExists \{id = post_load_screen}
		if (($freestyle_player_data [0].lefty) = FALSE)
			post_load_screen :desc_resolvealias \{Name = guitar_tiltmeter}
			<resolved_id> :obj_spawnscript freestyle_animate_mock_hud_element params = {guitar_tiltmeter frequency = 4 righty}
		else
			post_load_screen :desc_resolvealias \{Name = guitar_tiltmeter}
			<resolved_id> :obj_spawnscript freestyle_animate_mock_hud_element params = {guitar_tiltmeter frequency = 4}
		endif
		if (($freestyle_player_data [2].lefty) = FALSE)
			post_load_screen :desc_resolvealias \{Name = bass_tiltmeter}
			<resolved_id> :obj_spawnscript freestyle_animate_mock_hud_element params = {bass_tiltmeter frequency = 3.5 righty}
		else
			post_load_screen :desc_resolvealias \{Name = bass_tiltmeter}
			<resolved_id> :obj_spawnscript freestyle_animate_mock_hud_element params = {bass_tiltmeter frequency = 3.5}
		endif
		if (($freestyle_player_data [1].lefty) = FALSE)
			post_load_screen :desc_resolvealias \{Name = drum_assist}
			<resolved_id> :obj_spawnscript freestyle_animate_mock_hud_element params = {drum_assist frequency = 2 righty}
		else
			post_load_screen :desc_resolvealias \{Name = drum_assist}
			<resolved_id> :obj_spawnscript freestyle_animate_mock_hud_element params = {drum_assist frequency = 2}
		endif
	endif
	add_user_control_helper \{text = qs(0xffb0c002)
		button = green
		z = 1100000}
	SpawnScriptLater pulsate_helper_pill params = {id = <helper_pill_id>}
	user_control_container :se_setprops \{Scale = 1.5}
	generic_menu_pad_choose_sound
endscript

script freestyle_destroy_post_load_screen 
	if ScreenElementExists \{id = post_load_screen}
		DestroyScreenElement \{id = post_load_screen}
	endif
	clean_up_user_control_helpers
	KillSpawnedScript \{Name = pulsate_helper_pill}
	allow_wii_notifications
endscript
