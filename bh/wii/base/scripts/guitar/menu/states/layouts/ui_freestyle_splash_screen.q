
script 0xb977d9b9 
endscript

script 0xdad3d728 
endscript

script 0xcf1e87d5 
	0x61906aac
	CreateScreenElement \{parent = root_window
		id = 0xfcfb524d
		Type = descinterface
		desc = 'freestyle_splash_screen'
		event_handlers = [
			{
				pad_back
				generic_event_back
			}
			{
				pad_choose
				0x3f3887a9
			}
		]
		z_priority = 100}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0x182f0173)
		button = green
		all_buttons
		z = 1000}
	AssignAlias \{id = 0xfcfb524d
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

script 0x3f3887a9 
	create_loading_screen
	setplayerinfo \{1
		in_game = 0}
	setplayerinfo \{2
		in_game = 0}
	setplayerinfo \{3
		in_game = 0}
	setplayerinfo \{4
		in_game = 0}
	musician1 :Pause
	musician2 :Pause
	musician3 :Pause
	musician4 :Pause
	generic_event_choose event = menu_replace data = {state = uistate_freestyle_load device_num = <device_num>}
endscript

script 0xa8fd5f8d 
	DestroyScreenElement \{id = 0xfcfb524d}
	clean_up_user_control_helpers
endscript
