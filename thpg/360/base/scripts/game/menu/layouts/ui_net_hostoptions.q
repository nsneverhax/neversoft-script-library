
script ui_create_net_hostoptions 
	printf \{'UI: ui_create_net_hostoptions'}
	create_network_host_options_menu
	NetRoundFunc \{func = send_message
		params = {
			message = editing_game_options
		}}
endscript

script ui_destroy_net_hostoptions 
	printf \{'UI: ui_destroy_net_hostoptions'}
	generic_ui_destroy
	NetRoundFunc \{func = send_message
		params = {
			message = done_editing_game_options
		}}
endscript
