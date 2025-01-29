top_rockers_enabled = 0

script ui_init_top_rockers_mode 
	Change \{top_rockers_enabled = 1}
endscript

script ui_create_top_rockers_mode 
	Change \{rich_presence_context = presence_leaderboards}
	Change lb_controller = ($primary_controller)
	make_generic_menu \{title = qs(0xa1ae7e56)}
	if isXenon
		add_generic_menu_text_item {
			text = qs(0xcd9c2562)
			rgba = (($g_menu_colors).white230)
			not_focusable
			internal_scale = 1
			font = text_a1
			heading
		}
	else
		add_generic_menu_text_item {
			text = qs(0xe7da9225)
			rgba = (($g_menu_colors).white230)
			not_focusable
			internal_scale = 1
			font = text_a1
			heading
		}
	endif
	add_generic_menu_text_item \{text = qs(0xd7809370)
		pad_choose_script = ui_leaderboard_group_select
		pad_choose_params = {
			group = song
		}
		internal_scale = 0.9
		font = text_a1}
	add_generic_menu_text_item \{text = qs(0x5a4f279f)
		pad_choose_script = ui_leaderboard_group_select
		pad_choose_params = {
			group = career
		}
		internal_scale = 0.9
		font = text_a1}
	add_generic_menu_text_item \{text = qs(0xd1cfe6c8)
		pad_choose_script = ui_leaderboard_list_cash
		internal_scale = 0.9
		font = text_a1}
	add_generic_menu_text_item {
		text = qs(0x583a7179)
		not_focusable
		rgba = (($g_menu_colors).white230)
		internal_scale = 1
		font = text_a1
		heading
	}
	add_generic_menu_text_item \{text = qs(0x53edf88c)
		pad_choose_script = setup_top_rockers_single
		internal_scale = 0.9
		font = text_a1}
	menu_finish
	LaunchEvent Type = focus target = current_menu data = {child_index = <selected_index>}
endscript

script ui_destroy_top_rockers_mode 
	generic_ui_destroy
endscript

script ui_deinit_top_rockers_mode 
	Change \{top_rockers_enabled = 0}
endscript

script ui_top_rockers_mode_anim_in 
	menu_transition_in \{menu = generic_menu
		anim_type = zoom_blur}
endscript

script ui_top_rockers_mode_anim_out 
	menu_transition_out \{menu = generic_menu
		anim_type = zoom_blur}
endscript
