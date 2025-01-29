top_rockers_enabled = 0

script ui_init_top_rockers_mode 
	Change \{top_rockers_enabled = 1}
endscript

script ui_create_top_rockers_mode 
	Change \{rich_presence_context = presence_leaderboards}
	make_menu_frontend \{screen = GUITARIST
		title = qs(0x88572463)}
	add_menu_frontend_item \{text = qs(0x98fa7ed6)
		pad_choose_script = setup_top_rockers_coop}
	add_menu_frontend_item \{text = qs(0x88572463)
		pad_choose_script = setup_top_rockers_single}
	menu_finish
endscript

script ui_destroy_top_rockers_mode 
	generic_ui_destroy
endscript

script ui_deinit_top_rockers_mode 
	Change \{top_rockers_enabled = 0}
endscript
