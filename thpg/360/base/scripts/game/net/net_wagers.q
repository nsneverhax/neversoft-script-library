
script net_wager_check_match_start 
	if ($net_wager_message_waiting = 1)
		change net_wager_message_waiting = 0
		create_net_panel_message text = $net_wager_message
		wait 3 seconds
	endif
	printf "--- check_wager_match_start"
	careerfunc func = GetCash
	GetCurrentWager
	printstruct <...>
	if (<wager> > 0)
		printf "wager > 0"
		if (<cash> < <wager>)
			printf "cash < wager"
			if ishost
				<text> = "Later Sucka!  You do not have enough cash to wager.  The online session must be ended."
			else
				<text> = "Later Sucka!  You do not have enough cash to wager.  You must leave this online game."
			endif
			getskaterid
			<objid> :netdisableplayerinput
			create_dialog_box {
				title = "NO MONEY TO WAGER!"
				text = <text>
				pos = (320.0, 240.0)
				just = [center center]
				text_rgba = [88 105 112 255]
				text_scale = 0.6
				buttons = [{font = text_a1 text = "QUIT" pad_choose_script = net_wager_quit_network_game}
				]
				pad_back_script = nullscript
				vmenu_width = 500
				text_dims = (550.0, 0.0)
			}
			spawnscriptlater net_wager_wait_and_force_quit
		endif
	endif
endscript

script net_wager_quit_network_game 
	printf \{"--- net_wager_quit_network_game"}
	killspawnedscript \{name = net_wager_wait_and_force_quit}
	getskaterid
	<objid> :netenableplayerinput
	quit_network_game \{reason = out_of_cash}
endscript

script net_wager_wait_and_force_quit 
	printf "--- net_wager_wait_and_force_quit"
	wait 10 seconds
	printf "net wager dialog force quit timeout reached, forcing user out of net game"
	destroy_dialog_box
	getskaterid
	<objid> :netenableplayerinput
	quit_network_game
endscript
net_wager_message_waiting = 0
net_wager_message = ""

script net_wager_handle_game_end 
	printf "--- wager_handle_game_end"
	if NOT gotparam rank
		softassert "Did not get player rank!"
	endif
	netsessionfunc func = getnumplayers
	GetCurrentWager
	net_wager_msg = ""
	if (<rank> = 0)
		if NOT InTeamGame
			cash = (<wager> * (<numplayers> - 1))
		else
			getskaterid
			GetPlayersTeam objid = <objid>
			GetNumPlayersOnTeam team = <team>
			pot = ((<numplayers> - <num_members>) * <wager>)
			cash = (<pot> / <num_members>)
			casttointeger cash
		endif
		formattext textname = net_wager_msg "You won %d dollars!" d = <cash>
	else
		cash = (0 - <wager>)
		formattext textname = net_wager_msg "You lost %d dollars!" d = <wager>
	endif
	printf "You won/loss %s cash!!!!" s = <cash>
	printstruct <...>
	if NOT (<cash> = 0)
		change net_wager_message = <net_wager_msg>
		change net_wager_message_waiting = 1
		careerfunc func = AddCash params = {cash = <cash>}
	endif
endscript

script net_wager_notify_user 
	printf "--- net_wager_notify_user"
	if (<cash> > 0)
		formattext textname = net_wager_msg "You won %d dollars!" d = <cash>
	else
		wager = (0 - <cash>)
		formattext textname = net_wager_msg "You lost %d dollars!" d = <wager>
	endif
	printf "You won/loss %s cash!!!!" s = <cash>
	if NOT (<cash> = 0)
		netsessionfunc func = addtototalcash params = {cash = <cash>}
		change net_wager_message = <net_wager_msg>
		change net_wager_message_waiting = 1
	endif
endscript

script net_wager_can_host_game 
	printf "--- net_wager_can_host_game"
	can_wager = 1
	getpreferencechecksum pref_type = network game_wager_type
	wager_type = <checksum>
	if checksumequals a = <wager_type> b = wagers
		careerfunc func = GetCash
		getpreferencevalue pref_type = network game_wager_amount
		wager = <value>
		if (<cash> < <wager>)
			formattext textname = error_text "You do not have enough money to start this wager game! You currently have %d dollars." d = <cash>
			create_dialog_box {
				title = "NO MONEY TO WAGER!"
				text = <error_text>
				pos = (320.0, 240.0)
				just = [center center]
				text_rgba = [88 105 112 255]
				text_scale = 0.6
				buttons = [{font = text_a1 text = "OK" pad_choose_script = nullscript}
				]
				pad_back_script = nullscript
			}
			can_wager = 0
		endif
	endif
	return can_wager = <can_wager>
endscript

script net_wager_get_largest_wager_amount 
	printf "--- net_wager_get_largest_wager_amount"
	getpreferencechecksum pref_type = network game_wager_type
	wager_type = <checksum>
	if NOT gotparam cash
		careerfunc func = GetCash
	endif
	getarraysize ($wager_amount_info)
	max_wager = 0
	i = 0
	begin
	if ($wager_amount_info [<i>].num <= <cash>)
		max_wager = ($wager_amount_info [<i>].num)
		printf "max wager: %d cash: %e" d = <max_wager> e = <cash>
	endif
	i = (<i> + 1)
	repeat <array_size>
	if (<max_wager> > <cash>)
		max_wager = 0
	endif
	printstruct <...>
	return max_wager = <max_wager>
endscript

script net_wagers_quit_game_cleanup 
	printf \{"--- net_wagers_quit_game_cleanup"}
	ClearWagers
endscript
