
script ui_init_roadie_battle_splash_screen 
endscript

script ui_deinit_roadie_battle_splash_screen 
endscript

script ui_create_roadie_battle_splash_screen 
	RequireParams \{[
			device_num
		]
		all}
	0x61906aac
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
	add_user_control_helper \{text = qs(0x182f0173)
		button = green
		all_buttons
		z = 1000}
	GetRandomValue \{Name = random_sfx
		integer
		a = 0
		b = 1}
	if (<random_sfx> = 0)
		SoundEvent \{event = roadie_battle_roadie2_laugh3}
	else
		SoundEvent \{event = roadie_battle_roadie1_laugh2}
	endif
	AssignAlias \{id = roadie_battle_splash_screen
		alias = current_menu}
	i = 1
	begin
	formatText checksumName = 0xdad6373c 'alias_Icon_Sparkle_Anchor_%i' i = <i>
	<id> :desc_resolvealias Name = <0xdad6373c>
	<resolved_id> :obj_spawnscript 0xa323fa10 params = {0x971c66e7 = 0.5 0x3af134dc = 3 start_dims = (9.0, 9.0)}
	i = (<i> + 1)
	repeat 4
	<id> :desc_resolvealias Name = 0x18b48f47
	<resolved_id> :obj_spawnscript 0xa323fa10 params = {0x971c66e7 = 0.25 0x3af134dc = 3 start_dims = (9.0, 9.0)}
endscript

script ui_destroy_roadie_battle_splash_screen 
	DestroyScreenElement \{id = roadie_battle_splash_screen}
	clean_up_user_control_helpers
endscript
