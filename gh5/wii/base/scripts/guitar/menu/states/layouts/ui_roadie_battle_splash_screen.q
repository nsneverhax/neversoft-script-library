
script ui_init_roadie_battle_splash_screen 
endscript

script ui_deinit_roadie_battle_splash_screen 
endscript

script ui_create_roadie_battle_splash_screen 
	RequireParams \{[
			device_num
		]
		all}
	CreateScreenElement {
		parent = root_window
		id = roadie_battle_splash_screen
		Type = descinterface
		desc = 'roadie_battle_splash_screen'
		event_handlers = [
			{pad_back generic_event_back}
			{pad_choose generic_event_choose params = {
					event = menu_replace
					data = {
						state = uistate_ds_connection_handler
						device_num = <device_num>
						mode = roadie_battle
					}
				}
			}
		]
		z_priority = 100
	}
	clean_up_user_control_helpers
	add_user_control_helper \{button = green
		text = qs(0x182f0173)
		z = 1000}
	add_user_control_helper \{button = red
		text = qs(0xaf4d5dd2)
		z = 1000}
	AssignAlias \{id = roadie_battle_splash_screen
		alias = current_menu}
endscript

script ui_destroy_roadie_battle_splash_screen 
	DestroyScreenElement \{id = roadie_battle_splash_screen}
	clean_up_user_control_helpers
endscript
