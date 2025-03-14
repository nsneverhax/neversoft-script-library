
script StopServerList 
	printf \{"script StopServerList"}
	netsessionfunc \{obj = match
		func = stop_server_list}
endscript

script set_join_mode 
	StopServerList
	setjoinmode <...>
endscript

script chosen_leave_server 
	printscriptinfo "chosen_leave_server called inappropriately"
	ClearOmnigons
	printf "****************** DEACTIVATING GOALS!!!! ********************"
	deinit_goal_manager
	grid_control_deinit_grid_control_manager
	leaveserver reason = <reason>
	if innetgame
		netsessionfunc obj = match func = free_server_list
	endif
	setnetworkmode
endscript
