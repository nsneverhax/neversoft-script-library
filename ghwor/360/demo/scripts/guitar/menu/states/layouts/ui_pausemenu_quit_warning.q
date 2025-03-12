g_disconnect_quit_warning_shown = 0

script ui_init_pausemenu_quit_warning \{disconnect_dialog = 0}
	if ($is_network_game)
		enableallinput \{off}
	endif
	if (<disconnect_dialog> = 1)
		change \{g_disconnect_quit_warning_shown = 1}
	endif
endscript

script ui_create_pausemenu_quit_warning 
	if gotparam \{options}
		create_quit_warning_menu_with_custom_options <...>
	else
		create_quit_warning_menu <...>
	endif
endscript

script ui_destroy_pausemenu_quit_warning 
	destroy_quit_warning_menu
endscript

script ui_deinit_pausemenu_quit_warning \{disconnect_dialog = 0}
	if ($is_network_game)
		enableallinput
	endif
	change \{g_disconnect_quit_warning_shown = 0}
endscript
