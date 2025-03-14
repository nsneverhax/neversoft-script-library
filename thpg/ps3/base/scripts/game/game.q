
script pausemusicandstreams 
	pausemusic \{1}
	pausestream \{1}
endscript

script unpausemusicandstreams 
	pausemusic \{0}
	pausestream \{0}
endscript

script do_backend_retry 
	gman_deactivateallgoals
	if innetgame
		if NOT isobserving
			exitsurveyormode
			skater :add_skater_to_world
		endif
		ResetProSetFlags
		if NOT isobserving
			skater :runstarted
		endif
		ClearPowerups
	endif
	spawnscriptlater do_screen_freeze params = {<...>}
endscript

script do_screen_freeze 
	kill_net_panel_messages
	pausegame
	if innetgame
		unpause_game_and_destroy_pause_menu \{menu_id = pause_menu}
		force_close_rankings
		destroy_onscreen_keyboard
		if NetRoundFunc \{func = is_game_over}
			StartNetworkLobby
		elseif gotparam \{early_quit}
			StartNetworkLobby
		else
			NetRoundFunc \{func = post_round_cleanup}
		endif
	else
		unpause_game_and_destroy_pause_menu \{menu_id = pause_menu}
		force_close_rankings
		setgametype \{freeskate2p}
		setcurrentgametype
	endif
	wait \{2
		gameframe}
	unpausegame
	retry
endscript

script entered_chat_message 
	keyboard_current_string :text_getstring
	SendChatMessage string = <string>
	destroy_onscreen_keyboard
endscript

script menu_entered_chat_message 
	entered_chat_message
	pause_game_and_create_pause_menu
endscript

script cancel_chat_menu 
	destroy_onscreen_keyboard
	pause_game_and_create_pause_menu
endscript

script launch_chat_keyboard 
	hide_current_goal
	destroyscreenelement \{id = current_menu_anchor}
	create_onscreen_keyboard allow_cancel icon = <icon> keyboard_cancel_script = cancel_chat_menu keyboard_done_script = menu_entered_chat_message keyboard_title = "ENTER MESSAGE" min_length = 0 max_length = 50 text = ""
endscript

script enter_kb_chat 
	printf \{"script enter_kb_chat"}
	create_onscreen_keyboard \{allow_cancel
		no_buttons
		pos = (320.0, 260.0)
		keyboard_done_script = entered_chat_message
		display_text = "ENTER MESSAGE: "
		keyboard_title = "ENTER MESSAGE"
		min_length = 1
		max_length = 35}
endscript

script prerunqueuedscripts 
	setslomo \{100.0}
endscript

script postrunqueuedscripts 
	setslomo \{1}
endscript
