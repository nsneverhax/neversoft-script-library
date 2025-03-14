
script ui_create_net_xboxlive 
	printf \{"UI: ui_create_net_xboxlive"}
	pause_menu_fmv_kill
	xboxlive_menu_options_push \{from_pause_menu}
endscript

script ui_destroy_net_xboxlive 
	printf \{"UI: ui_destroy_net_xboxlive"}
	if screenelementexists \{id = current_menu_anchor}
		destroyscreenelement \{id = current_menu_anchor}
	endif
endscript
