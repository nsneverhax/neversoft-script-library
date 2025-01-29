top_rockers_enabled = 0

script ui_init_top_rockers_mode 
	Change \{top_rockers_enabled = 1}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = tr_rock_record_parent}
endscript

script ui_create_top_rockers_mode 
	Change \{rich_presence_context = presence_leaderboards}
	Change lb_controller = ($primary_controller)
	make_generic_barrel_menu \{max_expansion = 5
		texture = tv_clouds}
	if isXenon
		online_text = 'Xbox LIVE: '
	else
		online_text = qs(0x07a42667)
	endif
	add_generic_barrel_menu_text_item {
		text = <online_text>
		not_focusable
	}
	add_generic_barrel_menu_text_item \{pad_choose_script = ui_leaderboard_group_select
		pad_choose_params = {
			group = song
		}
		text = qs(0x1cec7f8c)}
	add_generic_barrel_menu_text_item \{pad_choose_script = ui_leaderboard_group_select
		pad_choose_params = {
			group = career
		}
		text = qs(0xde7ec8b3)}
	add_generic_barrel_menu_text_item \{pad_choose_script = net_ui_song_breakdown_launch_rock_record
		pad_choose_params = {
			parent_id = tr_rock_record_parent
			Player = 1
			unfocus_id = current_menu
		}
		text = qs(0xbe4c0e5b)}
	add_generic_barrel_menu_text_item \{pad_choose_script = nullscript
		text = qs(0x498fbaf7)
		not_focusable}
	set_focus_color
	set_unfocus_color
	generic_barrel_menu_finish
	if GotParam \{vmenu_id}
		AssignAlias id = <vmenu_id> alias = current_menu
	endif
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	LaunchEvent Type = focus target = current_menu data = {child_index = <selected_index>}
endscript

script tr_launch_rock_record 
	net_ui_song_breakdown_launch_rock_record {
		params = {
			parent_id = song_breakdown_competitive_id
			Player = <Player>
			unfocus_id = <team_menu_id>
		}
	}
endscript

script ui_return_top_rockers_mode 
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
endscript

script ui_destroy_top_rockers_mode 
	clean_up_user_control_helpers
	destroy_generic_barrel_menu
endscript

script ui_deinit_top_rockers_mode 
	Change \{top_rockers_enabled = 0}
	if ScreenElementExists \{id = tr_rock_record_parent}
		DestroyScreenElement \{id = tr_rock_record_parent}
	endif
endscript
