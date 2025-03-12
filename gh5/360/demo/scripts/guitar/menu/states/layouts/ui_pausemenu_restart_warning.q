
script ui_init_pausemenu_restart_warning 
	if ($is_network_game)
		enableallinput \{off}
	endif
endscript

script ui_create_pausemenu_restart_warning 
	create_restart_warning_menu <...>
endscript

script ui_destroy_pausemenu_restart_warning 
	destroy_restart_warning_menu <...>
endscript

script ui_deinit_pausemenu_restart_warning 
	if ($is_network_game)
		enableallinput
	endif
endscript
