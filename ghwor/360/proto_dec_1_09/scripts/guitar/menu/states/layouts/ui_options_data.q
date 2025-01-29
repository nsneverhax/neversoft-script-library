
script ui_create_options_data 
	uistack_createboundscreenelement \{parent = root_window
		id = options_data_menu_id
		Type = descinterface
		desc = 'mainmenu'
		tags = {
		}
		event_handlers = [
			{
				pad_back
				ui_options_check_settings
			}
		]}
	mainmenu_setup_physics_elements \{screen_id = options_data_menu_id}
	uistack_spawnboundscriptnow \{fg_objects_1
		params = {
			desc_id = options_data_menu_id
		}}
	uistack_spawnboundscriptnow \{ampzilla_anim
		params = {
			desc_id = options_data_menu_id
		}}
	uistack_spawnboundscriptnow \{anim_clouds
		params = {
			desc_id = options_data_menu_id
		}}
	mainmenu_setup_option \{choose_script = ui_options_data_save_game
		back_script = ui_options_check_settings
		menu_item_text = qs(0x5d22cc45)
		screen_id = options_data_menu_id
		helper_text = qs(0x03ac90f0)}
	mainmenu_setup_option \{choose_script = ui_options_data_load_game
		back_script = ui_options_check_settings
		menu_item_text = qs(0x3da6185d)
		screen_id = options_data_menu_id
		helper_text = qs(0x03ac90f0)}
	mainmenu_setup_option \{choose_state = uistate_options_progression
		back_script = ui_options_check_settings
		menu_item_text = qs(0xeb003ba8)
		screen_id = options_data_menu_id
		helper_text = qs(0x03ac90f0)}
	ui_options_set_settings
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
endscript

script ui_destroy_options_data 
	clean_up_user_control_helpers
	if ScreenElementExists \{id = options_data_menu_id}
		DestroyScreenElement \{id = options_data_menu_id}
	endif
endscript

script ui_options_data_save_game 
	ui_memcard_save \{event = menu_back}
endscript

script ui_options_data_load_game 
	ui_memcard_load \{event = menu_back
		show_confirm_dialog = 1}
endscript

script ui_options_data_anim_in 
	printf \{channel = blah
		qs(0x0d1a424d)}
	if ScreenElementExists \{id = options_data_menu_id}
		begin
		options_data_menu_id :se_setprops \{chain_anim_pos = (-309.0, 210.0)
			gor_anim_pos = (-269.0, -20.0)
			gor_anim_scale = (1.0, 1.0)
			bgrock_anim_pos = (-130.0, -186.0)
			axestone_anim_pos = (317.0, 82.0)
			ampzilla_anim_pos = (18.0, -176.0)
			mainmenu_anim_calcium_fulltop_pos = (86.0, 100.0)}
		options_data_menu_id :se_waitprops
		options_data_menu_id :se_setprops \{chain_anim_pos = (-315.0, 233.0)
			gor_anim_pos = (-272.0, -20.0)
			gor_anim_scale = (1.03, 1.03)
			bgrock_anim_pos = (-155.0, -178.0)
			axestone_anim_pos = (330.0, 72.0)
			ampzilla_anim_pos = (10.0, -169.0)
			mainmenu_anim_calcium_fulltop_pos = (79.0, 100.0)
			time = 0.01}
		options_data_menu_id :se_waitprops
		options_data_menu_id :se_setprops \{chain_anim_pos = (-305.0, 233.0)
			gor_anim_pos = (-260.0, -20.0)
			bgrock_anim_pos = (-130.0, -195.0)
			axestone_anim_pos = (310.0, 82.0)
			ampzilla_anim_pos = (25.0, -180.0)
			mainmenu_anim_calcium_fulltop_pos = (90.0, 100.0)
			time = 0.01}
		options_data_menu_id :se_waitprops
		options_data_menu_id :se_setprops \{chain_anim_pos = (-315.0, 240.0)
			gor_anim_pos = (-272.0, -20.0)
			gor_anim_scale = (1.06, 1.06)
			bgrock_anim_pos = (-130.0, -180.0)
			axestone_anim_pos = (310.0, 92.0)
			ampzilla_anim_pos = (12.0, -170.0)
			mainmenu_anim_calcium_fulltop_pos = (78.0, 100.0)
			time = 0.01}
		options_data_menu_id :se_waitprops
		options_data_menu_id :se_setprops \{chain_anim_pos = (-309.0, 233.0)
			gor_anim_pos = (-255.0, -20.0)
			gor_anim_scale = (1.05, 1.05)
			bgrock_anim_pos = (-130.0, -195.0)
			axestone_anim_pos = (330.0, 75.0)
			ampzilla_anim_pos = (22.0, -160.0)
			mainmenu_anim_calcium_fulltop_pos = (85.0, 100.0)
			time = 0.01}
		options_data_menu_id :se_waitprops
		options_data_menu_id :se_setprops \{chain_anim_pos = (-313.0, 233.0)
			gor_anim_pos = (-271.0, -20.0)
			gor_anim_scale = (1.01, 1.01)
			bgrock_anim_pos = (-150.0, -178.0)
			axestone_anim_pos = (310.0, 90.0)
			ampzilla_anim_pos = (18.0, -179.0)
			mainmenu_anim_calcium_fulltop_pos = (93.0, 100.0)
			time = 0.01}
		options_data_menu_id :se_waitprops
		options_data_menu_id :se_setprops {
			chain_anim_pos = (-309.0, 210.0)
			gor_anim_pos = (-269.0, -20.0)
			gor_anim_scale = (1.0, 1.0)
			bgrock_anim_pos = (-130.0, -186.0)
			axestone_anim_pos = (317.0, 82.0)
			ampzilla_anim_pos = <Pos>
			mainmenu_anim_calcium_fulltop_pos = (86.0, 100.0)
			time = 0.01
		}
		options_data_menu_id :se_waitprops
		repeat 1
	endif
endscript

script ui_options_data_anim_out 
	printf \{channel = blah
		qs(0x0d1a424d)}
	if ScreenElementExists \{id = options_data_menu_id}
		begin
		options_data_menu_id :se_setprops \{chain_anim_pos = (-309.0, 210.0)
			gor_anim_pos = (-269.0, -20.0)
			gor_anim_scale = (1.0, 1.0)
			bgrock_anim_pos = (-130.0, -186.0)
			axestone_anim_pos = (317.0, 82.0)
			ampzilla_anim_pos = (18.0, -176.0)
			mainmenu_anim_calcium_fulltop_pos = (86.0, 100.0)}
		options_data_menu_id :se_waitprops
		options_data_menu_id :se_setprops \{chain_anim_pos = (-315.0, 233.0)
			gor_anim_pos = (-272.0, -20.0)
			gor_anim_scale = (1.03, 1.03)
			bgrock_anim_pos = (-155.0, -178.0)
			axestone_anim_pos = (330.0, 72.0)
			ampzilla_anim_pos = (10.0, -169.0)
			mainmenu_anim_calcium_fulltop_pos = (79.0, 100.0)
			time = 0.01}
		options_data_menu_id :se_waitprops
		options_data_menu_id :se_setprops \{chain_anim_pos = (-305.0, 233.0)
			gor_anim_pos = (-260.0, -20.0)
			bgrock_anim_pos = (-130.0, -195.0)
			axestone_anim_pos = (310.0, 82.0)
			ampzilla_anim_pos = (25.0, -180.0)
			mainmenu_anim_calcium_fulltop_pos = (90.0, 100.0)
			time = 0.01}
		options_data_menu_id :se_waitprops
		options_data_menu_id :se_setprops \{chain_anim_pos = (-315.0, 240.0)
			gor_anim_pos = (-272.0, -20.0)
			gor_anim_scale = (1.06, 1.06)
			bgrock_anim_pos = (-130.0, -180.0)
			axestone_anim_pos = (310.0, 92.0)
			ampzilla_anim_pos = (12.0, -170.0)
			mainmenu_anim_calcium_fulltop_pos = (78.0, 100.0)
			time = 0.01}
		options_data_menu_id :se_waitprops
		options_data_menu_id :se_setprops \{chain_anim_pos = (-309.0, 233.0)
			gor_anim_pos = (-255.0, -20.0)
			gor_anim_scale = (1.05, 1.05)
			bgrock_anim_pos = (-130.0, -195.0)
			axestone_anim_pos = (330.0, 75.0)
			ampzilla_anim_pos = (22.0, -160.0)
			mainmenu_anim_calcium_fulltop_pos = (85.0, 100.0)
			time = 0.01}
		options_data_menu_id :se_waitprops
		options_data_menu_id :se_setprops \{chain_anim_pos = (-313.0, 233.0)
			gor_anim_pos = (-271.0, -20.0)
			gor_anim_scale = (1.01, 1.01)
			bgrock_anim_pos = (-150.0, -178.0)
			axestone_anim_pos = (310.0, 90.0)
			ampzilla_anim_pos = (18.0, -179.0)
			mainmenu_anim_calcium_fulltop_pos = (93.0, 100.0)
			time = 0.01}
		options_data_menu_id :se_waitprops
		options_data_menu_id :se_setprops \{chain_anim_pos = (-309.0, 210.0)
			gor_anim_pos = (-269.0, -20.0)
			gor_anim_scale = (1.0, 1.0)
			bgrock_anim_pos = (-130.0, -186.0)
			axestone_anim_pos = (317.0, 82.0)
			ampzilla_anim_pos = (18.0, -176.0)
			mainmenu_anim_calcium_fulltop_pos = (86.0, 100.0)
			time = 0.01}
		options_data_menu_id :se_waitprops
		repeat 1
	endif
endscript
