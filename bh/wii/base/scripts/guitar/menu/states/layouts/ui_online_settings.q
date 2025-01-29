g_current_friends_setting = -1

script ui_create_online_settings 
	CreateScreenElement \{parent = root_window
		id = 0xba56cf64
		Type = descinterface
		desc = 'options_menu'
		title_text = qs(0xbc85b74d)
		0xf75cb82a = FALSE
		arrows_alpha = 0}
	if NOT 0xba56cf64 :desc_resolvealias \{Name = 0xa39f6109
			param = 0xd27b45a1}
		SoftAssert \{'Couldnt resolve alias_options_vmenu'}
		return
	endif
	AssignAlias id = <0xd27b45a1> alias = current_menu
	current_menu :SetTags \{smooth_morph_time = 0.1}
	current_menu :se_setprops {
		event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_back generic_event_back}
		]
		exclusive_device = ($primary_controller)
	}
	add_generic_barrel_menu_text_item {
		text = qs(0x06352961)
		choose_state = uistate_online_setup
		choose_state_data = {device_num = ($primary_controller) from_options_menu}
		parent = current_menu
		helper_text = qs(0x70117e68)
		additional_focus_script = 0x1d9dd393
	}
	Change g_current_friends_setting = ($g_ngc_friends_enabled)
	if ($g_current_friends_setting = 1)
		friends_icon = Options_Controller_Check
	else
		friends_icon = Options_Controller_X
	endif
	add_generic_barrel_menu_icon_item {
		pad_choose_script = ui_online_settings_change_friends_options
		text = qs(0x66088aad)
		helper_text = qs(0x941e56f2)
		icon = <friends_icon>
		parent = current_menu
		additional_focus_script = 0x1d9dd393
	}
	GetGlobalTags \{slot_illumination}
	if (<Enabled> = 1)
		0xc0fc598a = Options_Controller_Check
	else
		0xc0fc598a = Options_Controller_X
	endif
	add_generic_barrel_menu_icon_item {
		pad_choose_script = ui_online_settings_change_slot_illumination
		text = qs(0x152fc4cc)
		helper_text = qs(0x457b8827)
		icon = <0xc0fc598a>
		parent = current_menu
		additional_focus_script = 0x1d9dd393
	}
	online_settings_helper_pills
endscript

script ui_destroy_online_settings 
	clean_up_user_control_helpers
	DestroyScreenElement \{id = 0xba56cf64}
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
		body_text = qs(0x011333e0)
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

script ui_online_settings_toggle_friends_enabled 
	RequireParams \{[
			menu_option_id
			toggle
		]
		all}
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

script ui_online_settings_change_slot_illumination 
	Obj_GetID
	LaunchEvent \{Type = unfocus
		target = current_menu}
	create_dialog_box {
		body_text = qs(0x5a845d3b)
		player_device = ($primary_controller)
		no_background
		options = [
			{
				func = 0x67f2fcd0
				func_params = {
					toggle = 0
					menu_option_id = <objID>
				}
				text = qs(0xf7723015)
			}
			{
				func = 0x67f2fcd0
				func_params = {
					toggle = 1
					menu_option_id = <objID>
				}
				text = qs(0x182f0173)
			}
		]
	}
endscript

script 0x67f2fcd0 
	RequireParams \{[
			menu_option_id
			toggle
		]
		all}
	if (<toggle> = 1)
		GetGlobalTags \{slot_illumination}
		if (<Enabled> = 0)
			<Enabled> = 1
			0xc0fc598a = Options_Controller_Check
		else
			<Enabled> = 0
			0xc0fc598a = Options_Controller_X
		endif
		<menu_option_id> :SetProps menurow_ico_item_texture = <0xc0fc598a>
	endif
	SetGlobalTags slot_illumination params = {Enabled = <Enabled>}
	freestylesetslotillumination Enabled = <Enabled>
	destroy_dialog_box
	LaunchEvent \{Type = focus
		target = current_menu}
endscript

script 0x1d9dd393 
	GetTags
	if GotParam \{helper_text}
		0xba56cf64 :se_setprops helper_text_text = <helper_text>
	endif
endscript
