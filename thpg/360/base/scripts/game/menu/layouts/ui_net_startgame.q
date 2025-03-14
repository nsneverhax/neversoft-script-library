
script ui_create_net_startgame 
	printf \{"UI: ui_create_net_startgame"}
	if innetgame
		<add_opt> = nullscript
	else
		<add_opt> = end_run
	endif
	network_game_options_selected <add_opt>
endscript

script ui_destroy_net_startgame 
	printf \{"UI: ui_destroy_net_startgame"}
	if screenelementexists \{id = current_menu_anchor}
		destroyscreenelement \{id = current_menu_anchor}
	endif
endscript
