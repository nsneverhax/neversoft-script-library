
script ui_create_online_settings 
	make_generic_barrel_menu \{pad_back_script = generic_event_back
		texture = tv_clouds
		max_expansion = 3}
	add_generic_barrel_menu_text_item {
		text = qs(0x06352961)
		choose_state = uistate_online_setup
		choose_state_data = {device_num = ($primary_controller) from_options_menu}
	}
	add_generic_barrel_menu_text_item \{text = qs(0x4644013b)
		pad_choose_script = ui_online_settings_change_friends_options}
	add_generic_barrel_menu_text_item \{text = qs(0x152fc4cc)
		pad_choose_script = ui_online_settings_change_slot_illumination}
	generic_barrel_menu_finish
	if GotParam \{vmenu_id}
		AssignAlias id = <vmenu_id> alias = current_menu
	endif
	online_settings_helper_pills
endscript

script ui_destroy_online_settings 
	destroy_generic_barrel_menu
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
	LaunchEvent \{Type = unfocus
		target = current_menu}
	ui_online_setup_display_friends_dialog
endscript

script ui_online_settings_change_slot_illumination 
	LaunchEvent \{Type = unfocus
		target = current_menu}
	ui_online_setup_slot_illumination_dialog
endscript

script ui_online_setup_slot_illumination_dialog 
	ui_event_wait_for_safe
	destroy_dialog_box
	create_dialog_box \{heading_text = qs(0x71848f33)
		body_text = qs(0x5546315b)
		options = [
			{
				func = ui_online_setup_set_slot_illumination
				func_params = {
					Enabled = 1
				}
				text = qs(0x58e0a1fb)
			}
			{
				func = ui_online_setup_set_slot_illumination
				func_params = {
					Enabled = 0
				}
				text = qs(0xd2915c27)
			}
		]}
endscript

script ui_online_setup_set_slot_illumination 
	destroy_dialog_box
	SetGlobalTags slot_illumination params = {Enabled = <Enabled>}
	freestylesetslotillumination Enabled = <Enabled>
	ui_online_setup_continue device_num = <device_num>
endscript
