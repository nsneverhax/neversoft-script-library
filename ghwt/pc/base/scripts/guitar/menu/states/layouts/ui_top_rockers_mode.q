top_rockers_enabled = 0

script ui_init_top_rockers_mode 
	change \{top_rockers_enabled = 1}
endscript

script ui_create_top_rockers_mode 
	change \{rich_presence_context = presence_leaderboards}
	change lb_controller = ($primary_controller)
	make_menu_frontend \{screen = guitarist
		title = qs(0xa1ae7e56)}
	if ((isxenon) && ((iswinport) = false))
		add_menu_frontend_item {
			text = qs(0xcd9c2562)
			rgba = (($g_menu_colors).menu_subhead)
			not_focusable
		}
	else
		add_menu_frontend_item {
			text = qs(0xee5e8253)
			rgba = (($g_menu_colors).menu_subhead)
			not_focusable
		}
	endif
	add_menu_frontend_item \{text = qs(0x1cec7f8c)
		pad_choose_script = ui_leaderboard_group_select
		pad_choose_params = {
			group = song
		}}
	add_menu_frontend_item \{text = qs(0xde7ec8b3)
		pad_choose_script = ui_leaderboard_group_select
		pad_choose_params = {
			group = career
		}}
	add_menu_frontend_item \{text = qs(0x21bfb03f)
		pad_choose_script = ui_leaderboard_list_cash}
	add_menu_frontend_item {
		text = qs(0x498fbaf7)
		rgba = (($g_menu_colors).menu_subhead)
		not_focusable
	}
	add_menu_frontend_item \{text = qs(0x88572463)
		pad_choose_script = setup_top_rockers_single}
	menu_finish
endscript

script ui_destroy_top_rockers_mode 
	generic_ui_destroy
endscript

script ui_deinit_top_rockers_mode 
	change \{top_rockers_enabled = 0}
endscript
