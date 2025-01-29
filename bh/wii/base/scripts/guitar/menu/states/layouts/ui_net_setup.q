net_career_song_index = 0

script ui_init_net_setup 
	set_home_button_notallowed
	net_init
	gamemode_gettype
	NetSessionFunc \{func = friends_init}
	destroy_loading_screen
endscript

script ui_create_net_setup 
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = net_setup_container
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	net_setup_container :Obj_SpawnScriptNow ui_create_net_setup_spawned params = <...>
endscript

script ui_create_net_setup_spawned 
	if isps3
		title = qs(0xe60e3e4a)
		text = 'Connecting to PLAYSTATION®Network...'
	elseif isXenon
		title = 'Xbox LIVE'
		text = 'Connecting to Xbox LIVE...'
	else
		title = qs(0x826469f8)
		text = qs(0x6a15c764)
	endif
	create_dialog_box {
		heading_text = <title>
		body_text = <text>
		parent = net_setup_container
	}
	begin
	if ($DEMONWARE_IS_READY = 1)
		break
	endif
	Wait \{1
		Frame}
	repeat
	NetSessionFunc {
		Obj = party
		func = create_party_session
		params = {
			controller_index = ($primary_controller)
		}
	}
	NetSessionFunc \{Obj = party
		func = set_can_join_callback
		params = {
			callback = net_party_can_accept_new_players
		}}
	gamemode_gettype
	if ($g_connection_loss_dialogue = 0)
	endif
endscript

script ui_destroy_net_setup 
	destroy_net_setup
	destroy_dialog_box
endscript

script destroy_net_setup 
	if ScreenElementExists \{id = net_setup_container}
		DestroyScreenElement \{id = net_setup_container}
	endif
endscript

script ui_deinit_net_setup 
	NetSessionFunc \{Obj = party
		func = stop_party_session}
	NetSessionFunc \{func = friends_uninit}
	NetSessionFunc \{Obj = match
		func = cancel_join_server}
	quit_network_game
	shut_down_net_play
	gamemode_gettype
	if (<Type> = career)
		gman_songfunc \{func = clear_play_list}
		Change \{net_encore_msg_start_sent = 0}
		Change \{net_breakdown_continue_msg_sent = 0}
		NetSessionFunc func = addcontrollers params = {controller = ($primary_controller)}
		Change \{num_exclusive_mp_controllers = 0}
		Change \{player_drop_in_setting_sync = 0}
		Change \{net_dropped_players_flag = 0}
		clear_temp_net_id_array
	else
		printf \{qs(0xe66bcf88)}
	endif
	set_home_button_allowed
endscript
