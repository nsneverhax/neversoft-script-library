enable_net_rounds = 1

script net_round_do_round_end_logic 
	printf \{"--- net_round_do_round_end_logic"}
	if NetRoundFunc \{func = in_round_mode}
		NetRoundFunc \{func = dump_round_scores}
		if NetRoundFunc \{func = is_arbitrator}
			if NetRoundFunc \{func = has_active_game}
				if NetRoundFunc \{func = is_game_over}
					NetRoundFunc \{func = end_game}
				else
					NetRoundFunc \{func = start_round}
				endif
			endif
		endif
	endif
endscript

script net_rounds_quit_game_cleanup 
	printf \{"--- net_rounds_quit_game_cleanup"}
	NetRoundFunc \{func = force_local_cleanup}
	NetRoundFunc \{func = deactivate_round_mode}
endscript

script get_current_round_list 
	printf \{"--- get_current_round_list"}
	NetRoundFunc \{func = get_match_results}
	printstruct <...>
endscript

script get_round_count 
	printf \{"--- get_round_count"}
	NetRoundFunc \{func = get_round_count}
	printstruct <...>
endscript

script net_rounds_start_new_game_script 
	printf \{"--- net_rounds_start_new_game_script"}
	net_rounds_create_game_description_ui
endscript

script net_rounds_start_round_script 
	printf \{"--- net_rounds_start_round_script"}
	net_rounds_create_current_round
endscript

script net_rounds_end_round_script 
	printf \{"--- net_rounds_end_round_script"}
	net_rounds_destroy_current_round
endscript

script net_rounds_pre_start_round_script 
	printf \{"--- net_rounds_pre_start_round_script"}
	net_rounds_create_pre_round_info <...>
endscript

script net_rounds_end_round_game_script 
	printf \{"--- net_rounds_end_round_game_script"}
	net_rounds_destroy_current_round
	if screenelementexists \{id = net_round_game_desc_cont}
		destroyscreenelement \{id = net_round_game_desc_cont}
	endif
endscript

script net_rounds_handle_game_message 
	printf "--- net_rounds_handle_game_message"
	if NOT gotparam message
		softassert "Did not get message checksum!"
	endif
	switch <message>
		case editing_rounds
		create_net_panel_message text = "The game rounds are being edited..."
		case done_editing_rounds
		create_net_panel_message text = "The game rounds are no longer being edited"
		case editing_game_options
		create_net_panel_message text = "The game options are being edited..."
		case done_editing_game_options
		create_net_panel_message text = "The game options are no longer being edited"
		default
		printstruct <...>
		softassert "NetRoundManager: got unknown game message!"
	endswitch
endscript
