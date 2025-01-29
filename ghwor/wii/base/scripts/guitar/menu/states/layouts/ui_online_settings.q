g_current_friends_setting = -1

script ui_create_online_settings 
	uistack_createboundscreenelement {
		parent = root_window
		id = options_online_menu_id
		Type = descinterface
		desc = 'mainmenu'
		tags = {
		}
		event_handlers = [
			{pad_back ui_options_online_pad_back_script}
		]
		exclusive_device = ($primary_controller)
		menu_header_cont_alpha = 1.0
		menu_header_text_text = qs(0xbc85b74d)
	}
	attempt_to_add_friend_feed \{parent_id = options_online_menu_id
		menu = main_generic}
	mainmenu_setup_physics_elements \{screen_id = options_online_menu_id}
	uistack_spawnboundscriptnow \{fg_objects_1
		params = {
			desc_id = options_online_menu_id
		}}
	uistack_spawnboundscriptnow \{ampzilla_anim
		params = {
			desc_id = options_online_menu_id
		}}
	uistack_spawnboundscriptnow \{anim_clouds
		params = {
			desc_id = options_online_menu_id
		}}
	mainmenu_setup_option {
		choose_state = uistate_online_setup
		choose_params = {device_num = ($primary_controller) from_options_menu}
		back_script = ui_options_online_pad_back_script
		menu_item_text = qs(0x06352961)
		screen_id = options_online_menu_id
		helper_text = qs(0x03ac90f0)
	}
	Change g_current_friends_setting = ($g_ngc_friends_enabled)
	if ($g_current_friends_setting = 1)
		friends_icon = Options_Controller_Check
	else
		friends_icon = Options_Controller_X
	endif
	mainmenu_setup_option {
		choose_script = ui_online_settings_change_friends_options
		back_script = ui_options_online_pad_back_script
		menu_item_text = qs(0x5bb722bb)
		icon = <friends_icon>
		screen_id = options_online_menu_id
		helper_text = qs(0x17fc275e)
	}
	online_settings_helper_pills
	main_menu_finalize
endscript

script ui_destroy_online_settings 
	clean_up_user_control_helpers
	if ScreenElementExists \{id = options_online_menu_id}
		DestroyScreenElement \{id = options_online_menu_id}
	endif
	if (($g_current_friends_setting) != ($g_ngc_friends_enabled))
		ui_online_setup_import_friends import = ($g_current_friends_setting) from_options
	endif
endscript

script online_settings_helper_pills 
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
endscript

script ui_online_settings_change_friends_options 
	Obj_GetID
	LaunchEvent \{Type = unfocus
		target = current_menu}
	create_dialog_box {
		body_text = qs(0x4ae005fa)
		player_device = ($primary_controller)
		no_background
		options = [
			{
				func = ui_online_settings_toggle_friends_enabled
				func_params = {
					toggle = 0
					menu_option_id = <objID>
				}
				text = qs(0xf7723015)
			}
			{
				func = ui_online_settings_toggle_friends_enabled
				func_params = {
					toggle = 1
					menu_option_id = <objID>
				}
				text = qs(0x182f0173)
			}
		]
	}
endscript

script ui_online_settings_toggle_friends_enabled \{menu_option_id = !q1768515945
		toggle = !i1768515945}
	if (<toggle> = 1)
		if ($g_current_friends_setting = 0)
			Change \{g_current_friends_setting = 1}
			friends_icon = Options_Controller_Check
		else
			Change \{g_current_friends_setting = 0}
			friends_icon = Options_Controller_X
		endif
		<menu_option_id> :SetProps menurow_ico_item_texture = <friends_icon>
	endif
	destroy_dialog_box
	LaunchEvent \{Type = focus
		target = current_menu}
endscript

script ui_options_online_pad_back_script 
	ui_options_check_settings \{no_event}
	ui_sfx \{menustate = Generic
		uitype = back}
	generic_event_back
endscript

script ui_options_online_anim_out 
	if ScreenElementExists \{id = options_online_menu_id}
		begin
		options_online_menu_id :se_setprops \{chain_anim_pos = (-309.0, 210.0)
			gor_anim_pos = (-269.0, -20.0)
			gor_anim_scale = (1.0, 1.0)
			bgrock_anim_pos = (-122.0, -255.0)
			axestone_anim_pos = (291.0, 108.0)
			ampzilla_anim_pos = (-104.0, -210.0)
			mainmenu_anim_calcium_fulltop_pos = (127.0, 109.0)}
		options_online_menu_id :se_waitprops
		options_online_menu_id :se_setprops \{chain_anim_pos = (-315.0, 233.0)
			gor_anim_pos = (-272.0, -20.0)
			gor_anim_scale = (1.03, 1.03)
			bgrock_anim_pos = (-128.0, -258.0)
			axestone_anim_pos = (302.0, 100.0)
			ampzilla_anim_pos = (-106.0, -208.0)
			mainmenu_anim_calcium_fulltop_pos = (130.0, 102.0)
			time = 0.01}
		options_online_menu_id :se_waitprops
		options_online_menu_id :se_setprops \{chain_anim_pos = (-305.0, 233.0)
			gor_anim_pos = (-260.0, -20.0)
			bgrock_anim_pos = (-130.0, -260.0)
			axestone_anim_pos = (289.0, 102.0)
			ampzilla_anim_pos = (-100.0, -205.0)
			mainmenu_anim_calcium_fulltop_pos = (125.0, 105.0)
			time = 0.01}
		options_online_menu_id :se_waitprops
		options_online_menu_id :se_setprops \{chain_anim_pos = (-315.0, 240.0)
			gor_anim_pos = (-272.0, -20.0)
			gor_anim_scale = (1.06, 1.06)
			bgrock_anim_pos = (-125.0, -250.0)
			axestone_anim_pos = (299.0, 110.0)
			ampzilla_anim_pos = (-103.0, -204.0)
			mainmenu_anim_calcium_fulltop_pos = (128.0, 100.0)
			time = 0.01}
		options_online_menu_id :se_waitprops
		options_online_menu_id :se_setprops \{chain_anim_pos = (-309.0, 233.0)
			gor_anim_pos = (-255.0, -20.0)
			gor_anim_scale = (1.05, 1.05)
			bgrock_anim_pos = (-130.0, -251.0)
			axestone_anim_pos = (305.0, 98.0)
			ampzilla_anim_pos = (-106.0, -206.0)
			mainmenu_anim_calcium_fulltop_pos = (127.0, 109.0)
			time = 0.01}
		options_online_menu_id :se_waitprops
		options_online_menu_id :se_setprops \{chain_anim_pos = (-313.0, 233.0)
			gor_anim_pos = (-271.0, -20.0)
			gor_anim_scale = (1.01, 1.01)
			bgrock_anim_pos = (-135.0, -252.0)
			axestone_anim_pos = (297.0, 101.0)
			ampzilla_anim_pos = (-108.0, -202.0)
			mainmenu_anim_calcium_fulltop_pos = (132.0, 100.0)
			time = 0.01}
		options_online_menu_id :se_waitprops
		options_online_menu_id :se_setprops \{chain_anim_pos = (-309.0, 210.0)
			gor_anim_pos = (-269.0, -20.0)
			gor_anim_scale = (1.0, 1.0)
			bgrock_anim_pos = (-122.0, -255.0)
			axestone_anim_pos = (291.0, 108.0)
			ampzilla_anim_pos = (-104.0, -210.0)
			mainmenu_anim_calcium_fulltop_pos = (127.0, 109.0)
			time = 0.01}
		options_online_menu_id :se_waitprops
		repeat 1
	endif
endscript
