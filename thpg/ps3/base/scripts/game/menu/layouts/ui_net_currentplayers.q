
script ui_create_net_currentplayers 
	printf \{"UI: ui_create_net_currentplayers"}
	xbox360live_menu_options_push \{from_pause_menu}
endscript

script ui_destroy_net_currentplayers 
	printf \{"UI: ui_destroy_net_currentplayers"}
	generic_ui_destroy
endscript
