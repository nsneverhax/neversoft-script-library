two_player_first_time_in = 1

script ui_create_2player_create_game 
	printf \{"UI: ui_create_2player_create_game"}
	if ($two_player_first_time_in = 1)
		pms = {tickover}
		change \{two_player_first_time_in = 0}
	else
		pms = {}
	endif
	spawnscriptnow create_end_run_menu params = <pms>
endscript

script ui_destroy_2player_create_game 
	printf \{"UI: ui_destroy_2player_create_game"}
	generic_ui_destroy
endscript
