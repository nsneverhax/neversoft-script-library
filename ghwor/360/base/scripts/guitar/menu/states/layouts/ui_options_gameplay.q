
script ui_create_options_gameplay 
	Change \{rich_presence_context = presence_menus}
	Change \{respond_to_signin_changed = 1}
	Change \{respond_to_signin_changed_func = None}
	uistack_createboundscreenelement {
		parent = root_window
		id = options_gameplay_menu_id
		Type = descinterface
		desc = 'mainmenu'
		tags = {
		}
		event_handlers = [
			{pad_back ui_options_gameplay_pad_back_script}
		]
		exclusive_device = ($primary_controller)
		menu_header_cont_alpha = 1.0
		menu_header_text_text = qs(0xaf9f86e6)
	}
	attempt_to_add_friend_feed \{parent_id = options_gameplay_menu_id
		menu = main_generic}
	mainmenu_setup_physics_elements \{screen_id = options_gameplay_menu_id}
	uistack_spawnboundscriptnow \{fg_objects_1
		params = {
			desc_id = options_gameplay_menu_id
		}}
	uistack_spawnboundscriptnow \{ampzilla_anim
		params = {
			desc_id = options_gameplay_menu_id
		}}
	uistack_spawnboundscriptnow \{anim_clouds
		params = {
			desc_id = options_gameplay_menu_id
		}}
	mainmenu_setup_option \{choose_state = uistate_options_audio
		choose_params = {
			from_pause_menu = 0
		}
		back_script = ui_options_gameplay_pad_back_script
		menu_item_text = qs(0xa0345d1c)
		screen_id = options_gameplay_menu_id
		helper_text = qs(0xdbc6e6a9)}
	mainmenu_setup_option \{choose_state = uistate_options_cheats_new
		back_script = ui_options_gameplay_pad_back_script
		menu_item_text = qs(0xe6c0d255)
		screen_id = options_gameplay_menu_id
		helper_text = qs(0x03ac90f0)}
	get_progression_instrument_user_option part = guitar controller = ($primary_controller) option = 'lefty_flip'
	if (<user_option> = 1)
		lefty_icon = Options_Controller_Check
	else
		lefty_icon = Options_Controller_X
	endif
	mainmenu_setup_option {
		choose_state = uistate_options_settings_lefty_warning
		choose_params = {part = guitar}
		back_script = ui_options_gameplay_pad_back_script
		menu_item_text = qs(0x7ca6df5a)
		icon = <lefty_icon>
		screen_id = options_gameplay_menu_id
		helper_text = qs(0x03ac90f0)
	}
	get_progression_instrument_user_option part = drum controller = ($primary_controller) option = 'lefty_flip'
	if (<user_option> = 1)
		lefty_icon = Options_Controller_Check
	else
		lefty_icon = Options_Controller_X
	endif
	mainmenu_setup_option {
		choose_state = uistate_options_settings_lefty_warning
		choose_params = {part = drum}
		back_script = ui_options_gameplay_pad_back_script
		menu_item_text = qs(0x555b9dd8)
		icon = <lefty_icon>
		screen_id = options_gameplay_menu_id
		helper_text = qs(0x03ac90f0)
	}
	get_savegame_from_controller controller = ($primary_controller)
	GetGlobalTags savegame = <savegame> user_options param = show_challenge_icons_save
	if (<show_challenge_icons_save> = 1)
		<show_challenges_icon> = Options_Controller_Check
	else
		<show_challenges_icon> = Options_Controller_X
	endif
	ui_options_set_settings
	main_menu_finalize
	LaunchEvent Type = focus target = current_menu data = {child_index = <selected_index>}
	add_gamertag_helper exclusive_device = ($primary_controller)
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000
		all_buttons}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000
		all_buttons}
endscript

script ui_destroy_options_gameplay 
	clean_up_user_control_helpers
	if ScreenElementExists \{id = options_gameplay_menu_id}
		DestroyScreenElement \{id = options_gameplay_menu_id}
	endif
endscript

script ui_options_gameplay_pad_back_script 
	ui_options_check_settings \{no_event}
	ui_sfx \{menustate = Generic
		uitype = back}
	generic_event_back
endscript

script ui_options_gameplay_anim_in 
	mainmenu_animate \{id = options_gameplay_menu_id}
endscript

script ui_options_gameplay_anim_out 
	mainmenu_animate \{id = options_gameplay_menu_id}
endscript
