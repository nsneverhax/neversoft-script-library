
script ui_create_net_options 
	printf \{"UI: ui_create_net_options"}
	network_options_selected
endscript

script ui_destroy_net_options 
	printf \{"UI: ui_destroy_net_options"}
	if screenelementexists \{id = current_menu_anchor}
		destroyscreenelement \{id = current_menu_anchor}
	endif
endscript
