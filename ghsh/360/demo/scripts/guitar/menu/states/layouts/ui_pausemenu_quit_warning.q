
script ui_init_pausemenu_quit_warning 
	if ($is_network_game)
		enableallinput \{off}
	endif
endscript

script ui_create_pausemenu_quit_warning 
	create_quit_warning_menu <...>
endscript

script ui_destroy_pausemenu_quit_warning 
	destroy_quit_warning_menu
endscript

script ui_deinit_pausemenu_quit_warning 
	if ($is_network_game)
		enableallinput
	endif
endscript
