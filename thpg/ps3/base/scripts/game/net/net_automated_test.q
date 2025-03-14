max_test_num_net_players = 4
net_autotest_started = 0
net_autotest_timeout_assert = 1800

script net_start_server_test 
	if NOT innetgame
		return
	endif
	change \{net_autotest_started = 1}
	printf \{"NET DEBUG: Starting net automated tests for server!"}
	hideloadingscreen
	net_autotest_timeout_script_spawner
	net_autotest_assert_on_player_num
endscript

script net_autotest_assert_on_player_num 
	begin
	netsessionfunc \{func = getnumplayers}
	printf "num Players = %s max = %d" s = <numplayers> d = ($max_test_num_net_players)
	if (<numplayers> = ($max_test_num_net_players))
		wait \{10
			seconds}
		scriptassert \{"Net Automated Tests Complete"}
	endif
	wait \{10
		seconds}
	repeat
endscript

script net_start_client_test 
	if NOT innetgame
		return
	endif
	change \{net_autotest_started = 1}
	net_autotest_timeout_script_spawner
	printf \{"NET DEBUG: Starting net automated tests for client!"}
	net_autotest_assert_on_player_num
	scriptassert \{"Net Automated Tests Complete"}
endscript

script net_autotest_timeout_script_spawner 
	killspawnedscript \{name = net_autotest_timeout_script}
	spawnscriptlater net_autotest_timeout_script params = {message = <message>}
endscript

script net_autotest_timeout_script 
	printf "starting timeout..."
	begin
	wait 1 second
	repeat ($net_autotest_timeout_assert)
	if gotparam message
		printf <message>
	endif
	printf "Net Debug: Net Automated Test Timeout!"
	scriptassert "Net Automated Test Timeout!"
endscript
