save_changes_message = qs(0x9859c78c)

script create_online_options_menu \{menu_title = qs(0x976cf9e7)
		menu_subtitle = qs(0x90e984c4)
		menu_id = online_options_menu
		vmenu_id = online_options_vmenu}
	setup_options_globals
	createscreenelement {
		type = vscrollingmenu
		parent = root_window
		id = <menu_id>
		just = [center top]
		dims = (256.0, 350.0)
		pos = (($online_general_menu_pos) + (0.0, 182.0))
		z_priority = 1
	}
	createscreenelement {
		type = vmenu
		parent = <menu_id>
		id = <vmenu_id>
		pos = ((128.0, 0.0) + (-8.0, 0.0))
		just = [center top]
		internal_just = [center center]
		dims = (256.0, 350.0)
		padding_scale = 1.5
		event_handlers = [
			{pad_back ui_flow_manager_respond_to_action params = {action = go_back}}
			{pad_back generic_menu_pad_back_sound}
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
		]
		exclusive_device = ($primary_controller)
	}
	create_menu_backdrop \{texture = xb_online_bg}
	createscreenelement \{type = containerelement
		parent = root_window
		id = online_menu_ui_container
		pos = (0.0, 0.0)}
	createscreenelement {
		type = textelement
		parent = online_menu_ui_container
		font = fontgrid_text_3
		scale = (0.65000004, 0.75)
		rgba = ($online_medium_blue)
		text = <menu_title>
		just = [center top]
		pos = (($online_general_menu_pos) + (0.0, 32.0))
		z_priority = 3.0
	}
	createscreenelement {
		type = textelement
		parent = online_menu_ui_container
		font = fontgrid_title_a1
		scale = (0.7, 0.75)
		rgba = ($online_dark_purple)
		text = <menu_subtitle>
		just = [center top]
		pos = (($online_general_menu_pos) + (0.0, 115.0))
		z_priority = 4.0
	}
	selectable_menu_items = 0
	createscreenelement {
		type = textelement
		parent = <vmenu_id>
		font = fontgrid_title_a1
		scale = (0.5, 0.75)
		rgba = ($online_light_blue)
		text = qs(0x65098b68)
		just = [left top]
		z_priority = 4.0
	}
	<id> :settags menu_item = <selectable_menu_items>
	<id> :se_setprops event_handlers = [
		{focus online_general_menu_focus params = {id = <id>}}
		{unfocus retail_menu_unfocus}
		{pad_choose online_options_select_quickmatch_player}
	]
	<selectable_menu_items> = (<selectable_menu_items> + 1)
	createscreenelement {
		type = textelement
		parent = <vmenu_id>
		font = fontgrid_title_a1
		scale = (0.65000004, 0.75)
		rgba = ($online_light_blue)
		text = qs(0xe5550c84)
		just = [left top]
		z_priority = 4.0
	}
	<id> :settags menu_item = <selectable_menu_items>
	<id> :se_setprops event_handlers = [
		{focus online_general_menu_focus params = {id = <id>}}
		{unfocus retail_menu_unfocus}
		{pad_choose online_options_select_player_pref}
	]
	<selectable_menu_items> = (<selectable_menu_items> + 1)
	set_online_menu_highlight_pos menu_items = <selectable_menu_items>
	set_focus_color rgba = ($online_dark_purple)
	set_unfocus_color rgba = ($online_light_blue)
	set_user_control_color \{text_rgba = [
			200
			200
			200
			255
		]
		bg_rgba = [
			0
			0
			0
			200
		]}
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
	launchevent type = focus target = <vmenu_id>
endscript

script destroy_online_options_menu 
	if screenelementexists \{id = online_menu_ui_container}
		destroyscreenelement \{id = online_menu_ui_container}
	endif
	if screenelementexists \{id = online_options_menu}
		destroyscreenelement \{id = online_options_menu}
	endif
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript

script online_options_select_quickmatch_player 
	ui_flow_manager_respond_to_action \{action = select_quickmatch_pref}
endscript

script online_options_select_player_pref 
	ui_flow_manager_respond_to_action \{action = select_player_pref}
endscript

script create_online_quickmatch_prefs \{menu_id = quickmatch_options_menu
		vmenu_id = quickmatch_options_vmenu}
	setup_options_globals
	game_mode_vmenu_id = game_mode_selection
	game_mode_text_id = game_mode_selection_text
	difficulty_vmenu_id = difficulty_selection
	difficulty_text_id = difficulty_selection_text
	num_songs_vmenu_id = number_of_songs_selection
	num_songs_text_id = number_of_songs_selection_text
	tie_breaker_vmenu_id = tie_breaker_selection
	tie_breaker_text_id = tie_breaker_selection_text
	createscreenelement \{type = containerelement
		parent = root_window
		id = quickmatch_options_container
		pos = (0.0, 0.0)}
	createscreenelement {
		type = vscrollingmenu
		parent = quickmatch_options_container
		id = <menu_id>
		just = [center top]
		dims = (500.0, 480.0)
		pos = (640.0, 300.0)
		z_priority = 1
	}
	createscreenelement {
		type = vmenu
		parent = <menu_id>
		id = <vmenu_id>
		pos = (205.0, 0.0)
		just = [center top]
		internal_just = [left top]
		dims = (500.0, 480.0)
		event_handlers = [
			{pad_back check_for_options_change_go_back}
			{pad_back generic_menu_pad_back_sound}
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
		]
		exclusive_device = ($primary_controller)
	}
	create_menu_backdrop \{texture = xb_online_bg}
	displaysprite \{id = online_frame
		parent = quickmatch_options_container
		tex = xb_online_frame_large
		pos = (640.0, 100.0)
		just = [
			center
			top
		]
		z = 2}
	displaysprite \{id = xb_online_frame_crown
		parent = quickmatch_options_container
		tex = xb_online_frame_crown
		pos = (640.0, 42.0)
		just = [
			center
			top
		]
		z = 3
		dims = (256.0, 105.0)}
	createscreenelement {
		type = textelement
		parent = quickmatch_options_container
		font = fontgrid_title_a1
		scale = 0.85
		rgba = ($online_dark_purple)
		text = qs(0x65098b68)
		pos = (640.0, 135.0)
		just = [center top]
		z_priority = 10.0
	}
	createscreenelement {
		type = textelement
		id = game_mode
		parent = <vmenu_id>
		font = fontgrid_title_a1
		scale = 0.65000004
		rgba = ($online_light_blue)
		text = qs(0x0d0530ec)
		just = [left top]
		z_priority = 10.0
		event_handlers = [
			{focus net_custom_ui_focus params = {this_id = game_mode text_id = <game_mode_text_id> vmenu = <vmenu_id>}}
			{unfocus net_custom_ui_unfocus params = {text_id = <game_mode_text_id>}}
			{pad_choose net_custom_ui_change_focus params = {this_id = game_mode text_id = <game_mode_text_id> to = <game_mode_vmenu_id> from = <vmenu_id>}}
			{pad_choose net_copy_intial_params params = {copy_from = optionsgamemodevalue copy_to = copyofglobal}}
		]
	}
	createscreenelement {
		type = vmenu
		id = <game_mode_vmenu_id>
		parent = game_mode
		pos = (550.0, 0.0)
		just = [left top]
		internal_just = [left top]
		event_handlers = [
			{pad_up animate_helper_arrows params = {direction = up}}
			{pad_down animate_helper_arrows params = {direction = down}}
			{pad_up net_custom_up_down params = {text = <game_mode_text_id> global = copyofglobal type = mode direction = up}}
			{pad_down net_custom_up_down params = {text = <game_mode_text_id> global = copyofglobal type = mode direction = down}}
			{pad_back net_commit_or_reset_params params = {text = <game_mode_text_id> global = optionsgamemodevalue type = mode}}
			{pad_back net_custom_ui_change_unfocus params = {action = back to = <vmenu_id> from = <game_mode_vmenu_id> menu = options}}
			{pad_choose net_commit_or_reset_params params = {commit copy_from = copyofglobal copy_to = optionsgamemodevalue}}
			{pad_choose net_custom_ui_change_unfocus params = {action = choose to = <vmenu_id> from = <game_mode_vmenu_id> menu = options}}
		]
	}
	createscreenelement {
		type = textelement
		id = <game_mode_text_id>
		parent = <game_mode_vmenu_id>
		font = fontgrid_title_a1
		scale = 1.0
		rgba = ($online_light_blue)
		text = ($filtertypes.mode.values [($optionsgamemodevalue)])
		just = [left top]
		z_priority = 10.0
	}
	fit_text_into_menu_item id = <id> max_width = 375
	createscreenelement {
		type = textelement
		id = difficulty
		parent = <vmenu_id>
		font = fontgrid_title_a1
		scale = 0.65000004
		rgba = ($online_light_blue)
		text = qs(0x48cdc36e)
		just = [left top]
		z_priority = 10.0
		event_handlers = [
			{focus net_custom_ui_focus params = {this_id = difficulty text_id = <difficulty_text_id> vmenu = <vmenu_id>}}
			{unfocus net_custom_ui_unfocus params = {text_id = <difficulty_text_id>}}
			{pad_choose net_custom_ui_change_focus params = {this_id = difficulty text_id = <difficulty_text_id> to = <difficulty_vmenu_id> from = <vmenu_id>}}
			{pad_choose net_copy_intial_params params = {copy_from = optionsdifficultyvalue copy_to = copyofglobal}}
		]
	}
	createscreenelement {
		type = vmenu
		id = <difficulty_vmenu_id>
		parent = difficulty
		pos = (550.0, 0.0)
		just = [left top]
		internal_just = [left top]
		event_handlers = [
			{pad_up animate_helper_arrows params = {direction = up}}
			{pad_down animate_helper_arrows params = {direction = down}}
			{pad_up net_custom_up_down params = {text = <difficulty_text_id> global = copyofglobal type = diff direction = up}}
			{pad_down net_custom_up_down params = {text = <difficulty_text_id> global = copyofglobal type = diff direction = down}}
			{pad_back net_commit_or_reset_params params = {text = <difficulty_text_id> global = optionsdifficultyvalue type = diff}}
			{pad_back net_custom_ui_change_unfocus params = {action = back to = <vmenu_id> from = <difficulty_vmenu_id> menu = options diff_focus}}
			{pad_choose net_commit_or_reset_params params = {commit copy_from = copyofglobal copy_to = optionsdifficultyvalue}}
			{pad_choose net_custom_ui_change_unfocus params = {action = choose to = <vmenu_id> from = <difficulty_vmenu_id> menu = options diff_focus}}
		]
	}
	createscreenelement {
		type = textelement
		id = <difficulty_text_id>
		parent = <difficulty_vmenu_id>
		font = fontgrid_title_a1
		scale = 1.0
		rgba = ($online_light_blue)
		text = ($filtertypes.diff.values [($optionsdifficultyvalue)])
		just = [left top]
		z_priority = 10.0
	}
	fit_text_into_menu_item id = <id> max_width = 375
	createscreenelement {
		type = textelement
		id = number_of_songs
		parent = <vmenu_id>
		font = fontgrid_title_a1
		scale = 0.65000004
		rgba = ($online_light_blue)
		text = qs(0xb9bb9f92)
		just = [left top]
		z_priority = 10.0
		event_handlers = [
			{focus net_custom_ui_focus params = {this_id = number_of_songs text_id = <num_songs_text_id> vmenu = <vmenu_id>}}
			{unfocus net_custom_ui_unfocus params = {text_id = <num_songs_text_id>}}
			{pad_choose net_custom_ui_change_focus params = {this_id = number_of_songs text_id = <num_songs_text_id> to = <num_songs_vmenu_id> from = <vmenu_id>}}
			{pad_choose net_copy_intial_params params = {copy_from = optionsnumsongsvalue copy_to = copyofglobal}}
		]
	}
	createscreenelement {
		type = vmenu
		id = <num_songs_vmenu_id>
		parent = number_of_songs
		pos = (550.0, 0.0)
		just = [left top]
		internal_just = [left top]
		event_handlers = [
			{pad_up animate_helper_arrows params = {direction = up}}
			{pad_down animate_helper_arrows params = {direction = down}}
			{pad_up net_custom_up_down params = {text = <num_songs_text_id> global = copyofglobal type = num_songs direction = up}}
			{pad_down net_custom_up_down params = {text = <num_songs_text_id> global = copyofglobal type = num_songs direction = down}}
			{pad_back net_commit_or_reset_params params = {text = <num_songs_text_id> global = optionsnumsongsvalue type = num_songs}}
			{pad_back net_custom_ui_change_unfocus params = {action = back to = <vmenu_id> from = <num_songs_vmenu_id> menu = options}}
			{pad_choose net_commit_or_reset_params params = {commit copy_from = copyofglobal copy_to = optionsnumsongsvalue}}
			{pad_choose net_custom_ui_change_unfocus params = {action = choose to = <vmenu_id> from = <num_songs_vmenu_id> menu = options}}
		]
	}
	createscreenelement {
		type = textelement
		id = <num_songs_text_id>
		parent = <num_songs_vmenu_id>
		font = fontgrid_title_a1
		scale = 1.0
		rgba = ($online_light_blue)
		text = ($filtertypes.num_songs.values [($optionsnumsongsvalue)])
		just = [left top]
		z_priority = 10.0
	}
	fit_text_into_menu_item id = <id> max_width = 375
	createscreenelement {
		type = textelement
		id = submit_selection
		parent = <vmenu_id>
		font = fontgrid_title_a1
		scale = 0.65000004
		rgba = ($online_light_blue)
		text = qs(0x3fc1c076)
		just = [left top]
		z_priority = 10.0
		event_handlers = [
			{focus net_custom_ui_focus params = {this_id = submit_selection vmenu = <vmenu_id>}}
			{unfocus net_custom_ui_unfocus}
			{pad_choose check_for_options_change_go_forward}
		]
	}
	<vmenu_id> :settags current_focus = first_time
	block_unblock_difficulty_actions \{menu = options}
	set_focus_color rgba = ($online_dark_purple)
	set_unfocus_color rgba = ($online_light_blue)
	set_user_control_color \{text_rgba = [
			200
			200
			200
			255
		]
		bg_rgba = [
			0
			0
			0
			200
		]}
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
	launchevent type = focus target = <vmenu_id>
endscript

script destroy_online_quickmatch_prefs 
	if screenelementexists \{id = quickmatch_options_container}
		destroyscreenelement \{id = quickmatch_options_container}
	endif
	if screenelementexists \{id = warning_message_container}
		destroyscreenelement \{id = warning_message_container}
	endif
	clean_up_user_control_helpers
	destroy_menu \{menu_id = quickmatch_options_menu}
	destroy_menu_backdrop
endscript

script create_online_player_prefs \{menu_id = game_options_menu
		vmenu_id = game_options_vmenu}
	highway_layout_vmenu_id = highway_layout_selection
	highway_layout_text_id = highway_layout_selection_text
	createscreenelement {
		type = vscrollingmenu
		parent = root_window
		id = <menu_id>
		just = [center top]
		dims = (500.0, 480.0)
		pos = (640.0, 330.0)
		z_priority = 1
	}
	createscreenelement {
		type = vmenu
		parent = <menu_id>
		id = <vmenu_id>
		pos = (250.0, 0.0)
		just = [center top]
		internal_just = [left top]
		dims = (500.0, 480.0)
		event_handlers = [
			{pad_back check_for_options_change_go_back}
			{pad_back generic_menu_pad_back_sound}
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
		]
		exclusive_device = ($primary_controller)
	}
	create_menu_backdrop \{texture = xb_online_bg}
	createscreenelement \{type = containerelement
		parent = root_window
		id = player_options_container
		pos = (0.0, 0.0)}
	displaysprite \{id = online_frame
		parent = player_options_container
		tex = xb_online_frame_large
		pos = (640.0, 100.0)
		just = [
			center
			top
		]
		z = 2}
	displaysprite \{id = xb_online_frame_crown
		parent = player_options_container
		tex = xb_online_frame_crown
		pos = (640.0, 42.0)
		just = [
			center
			top
		]
		z = 3
		dims = (256.0, 105.0)}
	createscreenelement {
		type = textelement
		parent = player_options_container
		font = fontgrid_title_a1
		scale = 0.85
		rgba = ($online_dark_purple)
		text = qs(0xe5550c84)
		pos = (640.0, 135.0)
		just = [center top]
		z_priority = 10.0
	}
	createscreenelement {
		type = textelement
		id = highway_layout
		parent = <vmenu_id>
		font = fontgrid_title_a1
		scale = 0.65000004
		rgba = ($online_light_blue)
		text = qs(0x33bf1d8f)
		just = [left top]
		z_priority = 10.0
		event_handlers = [
			{focus net_custom_ui_focus params = {this_id = highway_layout text_id = <highway_layout_text_id> vmenu = <vmenu_id>}}
			{unfocus net_custom_ui_unfocus params = {text_id = <highway_layout_text_id>}}
			{pad_choose net_custom_ui_change_focus params = {this_id = highway_layout text_id = <highway_layout_text_id> to = <highway_layout_vmenu_id> from = <vmenu_id>}}
			{pad_choose net_copy_intial_params params = {copy_from = optionshighwayvalue copy_to = copyofglobal}}
		]
	}
	createscreenelement {
		type = vmenu
		id = <highway_layout_vmenu_id>
		parent = highway_layout
		pos = (500.0, 0.0)
		just = [left top]
		internal_just = [left top]
		event_handlers = [
			{pad_up animate_helper_arrows params = {direction = up}}
			{pad_down animate_helper_arrows params = {direction = down}}
			{pad_up net_custom_up_down params = {text = <highway_layout_text_id> global = copyofglobal type = vport direction = up}}
			{pad_down net_custom_up_down params = {text = <highway_layout_text_id> global = copyofglobal type = vport direction = down}}
			{pad_back net_commit_or_reset_params params = {text = <highway_layout_text_id> global = optionshighwayvalue type = vport}}
			{pad_back net_custom_ui_change_unfocus params = {action = back to = <vmenu_id> from = <highway_layout_vmenu_id>}}
			{pad_choose net_commit_or_reset_params params = {commit copy_from = copyofglobal copy_to = optionshighwayvalue}}
			{pad_choose net_custom_ui_change_unfocus params = {action = choose to = <vmenu_id> from = <highway_layout_vmenu_id>}}
		]
	}
	createscreenelement {
		type = textelement
		id = <highway_layout_text_id>
		parent = <highway_layout_vmenu_id>
		font = fontgrid_title_a1
		scale = 1.0
		rgba = ($online_light_blue)
		text = ($filtertypes.vport.values [($optionshighwayvalue)])
		just = [left top]
		z_priority = 10.0
	}
	createscreenelement {
		type = textelement
		id = submit_selection
		parent = <vmenu_id>
		font = fontgrid_title_a1
		scale = 0.65000004
		rgba = ($online_light_blue)
		text = qs(0x3fc1c076)
		just = [left top]
		z_priority = 10.0
		event_handlers = [
			{focus net_custom_ui_focus params = {this_id = submit_selection vmenu = <vmenu_id>}}
			{unfocus net_custom_ui_unfocus}
			{pad_choose check_for_options_change_go_forward}
		]
	}
	<vmenu_id> :settags current_focus = first_time
	set_focus_color rgba = ($online_dark_purple)
	set_unfocus_color rgba = ($online_light_blue)
	set_user_control_color \{text_rgba = [
			200
			200
			200
			255
		]
		bg_rgba = [
			0
			0
			0
			200
		]}
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
	launchevent type = focus target = <vmenu_id>
endscript

script destroy_online_player_prefs 
	if screenelementexists \{id = player_options_container}
		destroyscreenelement \{id = player_options_container}
	endif
	if screenelementexists \{id = game_options_menu}
		destroyscreenelement \{id = game_options_menu}
	endif
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript

script create_online_options_changed_dialog \{menu_id = online_options_changed_menu
		vmenu_id = online_options_changed_vmenu
		pos = (500.0, 516.0)
		z = 100}
	createscreenelement \{type = containerelement
		parent = quickmatch_options_container
		id = warning_message_container
		pos = (0.0, 0.0)}
	createscreenelement {
		type = vscrollingmenu
		parent = warning_message_container
		id = <menu_id>
		just = [center top]
		dims = (500.0, 150.0)
		pos = (640.0, 465.0)
		z_priority = 15
	}
	createscreenelement {
		type = vmenu
		parent = <menu_id>
		id = <vmenu_id>
		pos = (298.0, 0.0)
		just = [center top]
		internal_just = [center top]
		dims = (500.0, 150.0)
		event_handlers = [
			{pad_back remove_save_dialog}
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
		]
	}
	<menu_pos> = (575.0, 487.0)
	<bookend_r_pos> = (745.0, 533.0)
	<bookend_l_pos> = (470.0, 533.0)
	change \{menu_focus_color = [
			180
			50
			50
			255
		]}
	change \{menu_unfocus_color = [
			0
			0
			0
			255
		]}
	create_pause_menu_frame \{parent = warning_message_container
		z = 16}
	displaysprite \{parent = warning_message_container
		tex = dialog_title_bg
		scale = (1.7, 1.7)
		z = 19
		pos = (640.0, 100.0)
		just = [
			right
			top
		]
		flip_v}
	displaysprite \{parent = warning_message_container
		tex = dialog_title_bg
		scale = (1.7, 1.7)
		z = 19
		pos = (640.0, 100.0)
		just = [
			left
			top
		]}
	displaysprite \{parent = warning_message_container
		tex = dialog_frame_joiner
		pos = (480.0, 510.0)
		rot_angle = 5
		scale = (1.575, 1.5)
		z = 19}
	displaysprite \{parent = warning_message_container
		tex = dialog_frame_joiner
		pos = (750.0, 514.0)
		flip_v
		rot_angle = -5
		scale = (1.575, 1.5)
		z = 19}
	displaysprite \{parent = warning_message_container
		tex = dialog_menu_bg
		pos = (480.0, 500.0)
		scale = (1.25, 1.0)
		z = 19
		just = [
			left
			botom
		]}
	displaysprite \{parent = warning_message_container
		tex = dialog_menu_bg
		pos = (480.0, 530.0)
		scale = (1.25, 1.0)
		z = 19
		just = [
			left
			top
		]
		flip_h}
	createscreenelement \{type = textelement
		parent = warning_message_container
		font = fontgrid_title_a1
		scale = 1.3
		rgba = [
			223
			223
			223
			250
		]
		text = qs(0xaa163738)
		just = [
			center
			top
		]
		z_priority = 20.0
		pos = (640.0, 175.0)
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]}
	createscreenelement \{type = textblockelement
		parent = warning_message_container
		font = fontgrid_title_a1
		scale = 0.6
		rgba = [
			210
			210
			210
			250
		]
		text = $save_changes_message
		just = [
			center
			top
		]
		internal_just = [
			center
			top
		]
		z_priority = 20.0
		pos = (640.0, 290.0)
		dims = (700.0, 320.0)
		line_spacing = 1.0}
	createscreenelement \{type = containerelement
		parent = online_options_changed_vmenu
		dims = (100.0, 50.0)
		event_handlers = [
			{
				focus
				net_warning_focus
			}
			{
				unfocus
				net_warning_unfocus
			}
			{
				pad_choose
				options_changed_select_save
			}
		]}
	container_id = <id>
	createscreenelement {
		type = textelement
		parent = <container_id>
		local_id = text
		font = fontgrid_title_a1
		scale = (0.7, 0.85)
		rgba = ($menu_unfocus_color)
		text = qs(0xf17d914d)
		just = [center top]
		z_priority = (<z> + 5)
	}
	fit_text_into_menu_item id = <id> max_width = 240
	getscreenelementdims id = <id>
	createscreenelement {
		type = spriteelement
		parent = <container_id>
		local_id = bookend_left
		texture = dialog_menu_hilight
		alpha = 1.0
		just = [right center]
		pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (-2)) + (-5.0, 0.0))
		z_priority = (<z> + 6)
		scale = (1.0, 1.0)
		flip_v
	}
	createscreenelement {
		type = spriteelement
		parent = <container_id>
		local_id = bookend_right
		texture = dialog_menu_hilight
		alpha = 1.0
		just = [left center]
		pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (2)) + (5.0, 0.0))
		z_priority = (<z> + 6)
		scale = (1.0, 1.0)
	}
	createscreenelement \{type = containerelement
		parent = online_options_changed_vmenu
		dims = (100.0, 50.0)
		event_handlers = [
			{
				focus
				net_warning_focus
			}
			{
				unfocus
				net_warning_unfocus
			}
			{
				pad_choose
				options_changed_select_dont_save
			}
		]}
	container_id = <id>
	createscreenelement {
		type = textelement
		parent = <container_id>
		local_id = text
		font = fontgrid_title_a1
		scale = (0.45000002, 0.85)
		rgba = ($menu_unfocus_color)
		text = qs(0x06d0b6b0)
		just = [center top]
		z_priority = (<z> + 5)
	}
	fit_text_into_menu_item id = <id> max_width = 240
	getscreenelementdims id = <id>
	createscreenelement {
		type = spriteelement
		parent = <container_id>
		local_id = bookend_left
		texture = dialog_menu_hilight
		just = [right center]
		pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (-2)) + (-5.0, 0.0))
		alpha = 0.0
		z_priority = (<z> + 6)
		scale = (1.0, 1.0)
		flip_v
	}
	createscreenelement {
		type = spriteelement
		parent = <container_id>
		local_id = bookend_right
		texture = dialog_menu_hilight
		just = [left center]
		pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (2)) + (5.0, 0.0))
		alpha = 0.0
		z_priority = (<z> + 6)
		scale = (1.0, 1.0)
	}
	launchevent type = focus target = <vmenu_id>
endscript

script destroy_online_options_changed_dialog 
	destroy_pause_menu_frame
	destroy_menu_backdrop
	if screenelementexists \{id = online_options_changed_menu}
		destroyscreenelement \{id = online_options_changed_menu}
	endif
	if screenelementexists \{id = warning_message_container}
		destroyscreenelement \{id = warning_message_container}
	endif
endscript

script options_changed_select_save 
	formattext \{checksumname = player_status
		'player1_status'}
	switch (($optionshighwayvalue))
		case 0
		change structurename = <player_status> highway_layout = default_highway
		case 1
		change structurename = <player_status> highway_layout = solo_highway
	endswitch
	setglobaltags user_options params = {
		online_game_mode = ($optionsgamemodevalue)
		online_difficulty = ($optionsdifficultyvalue)
		online_num_songs = ($optionsnumsongsvalue)
		online_tie_breaker = ($optionstiebreakervalue)
		online_highway = ($optionshighwayvalue)
	}
	ui_flow_manager_respond_to_action \{action = dialog_response_selected_save}
endscript

script options_changed_select_dont_save 
	revert_option_changes
	ui_flow_manager_respond_to_action \{action = dialog_response_selected_dont_save}
endscript

script check_for_options_change_go_forward 
	if screenelementexists \{id = quickmatch_options_vmenu}
		launchevent \{type = unfocus
			target = quickmatch_options_vmenu}
	endif
	create_online_options_changed_dialog
endscript

script check_for_options_change_go_back 
	if ((($optionsgamemodevalue) = ($tempgamemodevalue)) &&
			(($optionsdifficultyvalue) = ($tempdifficultyvalue)) &&
			(($optionsnumsongsvalue) = ($tempnumsongsvalue)) &&
			(($optionstiebreakervalue) = ($temptiebreakervalue)) &&
			(($optionshighwayvalue) = ($temphighwayvalue)))
		ui_flow_manager_respond_to_action \{action = go_back}
	else
		if screenelementexists \{id = quickmatch_options_vmenu}
			launchevent \{type = unfocus
				target = quickmatch_options_vmenu}
		endif
		create_online_options_changed_dialog
	endif
endscript

script save_intial_option_values 
	change tempgamemodevalue = ($optionsgamemodevalue)
	change tempdifficultyvalue = ($optionsdifficultyvalue)
	change tempnumsongsvalue = ($optionsnumsongsvalue)
	change temptiebreakervalue = ($optionstiebreakervalue)
	change temphighwayvalue = ($optionshighwayvalue)
endscript

script revert_option_changes 
	change optionsgamemodevalue = ($tempgamemodevalue)
	change optionsdifficultyvalue = ($tempdifficultyvalue)
	change optionsnumsongsvalue = ($tempnumsongsvalue)
	change optionstiebreakervalue = ($temptiebreakervalue)
	change optionshighwayvalue = ($temphighwayvalue)
endscript

script setup_options_globals 
	getglobaltags \{user_options}
	change optionsgamemodevalue = <online_game_mode>
	change optionsdifficultyvalue = <online_difficulty>
	change optionsnumsongsvalue = <online_num_songs>
	change optionstiebreakervalue = <online_tie_breaker>
	change optionshighwayvalue = <online_highway>
endscript

script remove_save_dialog 
	if screenelementexists \{id = warning_message_container}
		destroyscreenelement \{id = warning_message_container}
	endif
	set_focus_color rgba = ($online_dark_purple)
	set_unfocus_color rgba = ($online_light_blue)
	if screenelementexists \{id = quickmatch_options_vmenu}
		launchevent \{type = focus
			target = quickmatch_options_vmenu}
	endif
endscript
