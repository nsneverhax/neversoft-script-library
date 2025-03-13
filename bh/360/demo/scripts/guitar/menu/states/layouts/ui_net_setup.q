net_career_song_index = 0

script ui_init_net_setup 
	net_init
	gamemode_gettype
	netsessionfunc \{func = friends_init}
	destroy_loading_screen
endscript

script ui_create_net_setup 
	createscreenelement \{type = containerelement
		parent = root_window
		id = net_setup_container
		pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	net_setup_container :obj_spawnscriptnow ui_create_net_setup_spawned params = <...>
endscript

script ui_create_net_setup_spawned 
	if isps3
		title = qs(0xe60e3e4a)
		text = qs(0x169e0e5b)
	else
		title = qs(0x2725b21f)
		text = qs(0x31e93811)
	endif
	create_dialog_box {
		heading_text = <title>
		body_text = <text>
		parent = net_setup_container
	}
	begin
	if ($demonware_is_ready = 1)
		break
	endif
	wait \{1
		frame}
	repeat
	netsessionfunc {
		obj = party
		func = create_party_session
		params = {
			controller_index = ($primary_controller)
		}
	}
	netsessionfunc \{obj = party
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
	if screenelementexists \{id = net_setup_container}
		destroyscreenelement \{id = net_setup_container}
	endif
endscript

script ui_deinit_net_setup 
	netsessionfunc \{obj = party
		func = stop_party_session}
	netsessionfunc \{func = friends_uninit}
	netsessionfunc \{obj = match
		func = cancel_join_server}
	quit_network_game
	shut_down_net_play
	gamemode_gettype
	if (<type> = career)
		gman_songfunc \{func = clear_play_list}
		change \{net_encore_msg_start_sent = 0}
		change \{net_breakdown_continue_msg_sent = 0}
		netsessionfunc func = addcontrollers params = {controller = ($primary_controller)}
		change \{num_exclusive_mp_controllers = 0}
		change \{player_drop_in_setting_sync = 0}
		change \{net_dropped_players_flag = 0}
		clear_temp_net_id_array
	else
		printf \{qs(0xe66bcf88)}
	endif
endscript
