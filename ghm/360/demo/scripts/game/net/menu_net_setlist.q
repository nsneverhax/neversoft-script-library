host_songs_to_pick = 0
client_songs_to_pick = 0
tie_breaker = host
num_songs = num_1
player1_color = [
	0
	200
	100
	255
]
player2_color = [
	200
	0
	100
	255
]
net_setlist_songs = [
	null
	null
	null
	null
	null
	null
	null
]
net_setlist_tiers = [
	0
	0
	0
	0
	0
	0
	0
]
net_song_num = 0
net_song_countdown = 0
g_tie_breaker_song = 0
g_disable_song_chooser_spinner = 0

script create_net_setlist_ui 
	if ($net_new_matchmaking_ui_flag = 1)
		if gotparam \{parent_element}
			create_net_ui parent_element = <parent_element>
		else
			create_net_ui
		endif
	else
		get_number_of_songs
		ui_print_gamertags \{pos1 = (240.0, 70.0)
			pos2 = (1045.0, 70.0)
			dims = (400.0, 45.0)
			just1 = [
				left
				top
			]
			just2 = [
				right
				top
			]}
		if (screenelementexists id = net_setlist_popup_container)
			return
		endif
		create_ready_icons \{pos1 = (290.0, 170.0)
			pos2 = (850.0, 150.0)}
		if ($g_tie_breaker_song = 0)
			reset_setlist
			reset_net_stats_menu
			change \{net_song_num = 0}
		endif
		if ((<num_songs> = 1) || ($game_mode = p2_coop))
			set_final_song_selection
		endif
	endif
endscript

script destroy_setlist_popup 
	destroy_gamertags
	destroy_menu \{menu_id = net_setlist_popup_container}
	destroy_ready_icons
endscript

script net_request_song 
	change \{net_permision_to_select_song = 0}
	if NOT search_for_tool_in_quickplay_list song = ($current_song)
		if (($current_level) = load_z_tool)
			change \{current_level = load_z_newyork}
		endif
	endif
	sendstructure callback = net_song_selected data_to_send = {song_checksum = ($current_song) level_checksum = ($current_level)}
	if ishost
		change \{net_song_countdown = 1}
		if screenelementexists \{id = setlistinterface}
			setlistinterface :obj_spawnscriptlater song_selected_countdown params = {song_checksum = ($current_song)}
		endif
	endif
endscript

script net_song_selected 
	requireparams \{[
			song_checksum
			level_checksum
		]
		all}
	spawnscriptnow \{destroy_setlist_songpreview_monitor}
	change current_song = <song_checksum>
	change current_level = <level_checksum>
	if ishost
		sendstructure callback = net_song_selected data_to_send = {song_checksum = ($current_song) level_checksum = ($current_level)}
	endif
	change \{net_song_countdown = 1}
	ui_event_get_top
	if (<base_name> = 'online_quit_warning')
		generic_event_back
	endif
	if screenelementexists \{id = net_setlist_spinner}
		destroy_net_setlist_spinner
	endif
	ui_event_wait_for_safe
	wait_time = 0
	begin
	if screenelementexists \{id = setlistinterface}
		break
	endif
	if (<wait_time> > 3)
		break
	endif
	wait \{1.0
		seconds}
	<wait_time> = (<wait_time> + 1)
	repeat
	if screenelementexists \{id = setlistinterface}
		setlistinterface :obj_spawnscriptlater song_selected_countdown params = {song_checksum = <song_checksum>}
	endif
endscript

script create_song_chooser_spinner 
	printf \{qs(0xefd530a5)}
	launchevent \{type = unfocus
		target = setlist_menu}
	change \{net_song_countdown = 0}
	clean_up_user_control_helpers
	setlist_popup_z = ($setlist_text_z + 50.0)
	createscreenelement {
		id = net_setlist_spinner
		type = descinterface
		desc = 'net_setlist_spinner'
		parent = setlistinterface
		z_priority = <setlist_popup_z>
		alpha = 0.0
		message_text = <message_text>
		not_focusable
	}
	net_setlist_spinner :se_setprops net_spinner_name_text = ($gamertag_0)
	if NOT gotparam \{selected_index}
		selected_index = 0
	endif
	net_setlist_spinner :obj_spawnscriptlater spin_names params = {selected_index = <selected_index>}
endscript

script kill_online_choose_spinner 
	wait \{2.0
		seconds}
	destroy_net_setlist_spinner <...>
endscript

script destroy_net_setlist_spinner 
	printf \{qs(0x4eaf51ef)}
	destroy_spinner
	create_net_setlist_ui \{parent_element = setlistinterface}
	if local_player_is_choosing_song
		add_user_control_helper \{text = qs(0x4d9ad28f)
			button = green
			z = 100}
	endif
	setlist_show_sort_helper_text
	setlist_show_jump_helper_text
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
	if gotparam \{selected_index}
		launchevent type = focus target = setlist_menu data = {child_index = <selected_index>}
	else
		printstruct <...>
		printf \{qs(0xd9c124ee)}
	endif
	spawnscriptnow \{setlist_songpreview_monitor}
endscript

script net_setlist_go_back 
	if ($player2_present = 0)
		sendnetmessage \{type = select_song
			song_checksum = 0}
	endif
endscript

script net_setlist_players_ready 
	wait \{2
		seconds}
	printf \{qs(0x18f64ee8)}
	net_print_setlist
	change current_song = ($net_setlist_songs [($net_song_num)])
	setglobaltags progression params = {current_tier = ($net_setlist_tiers [($net_song_num)])}
	if ($g_tie_breaker_song = 1)
		ui_flow_manager_respond_to_action \{action = continue_to_final_song}
	else
		start_network_game
		generic_event_choose \{state = uistate_play_song}
	endif
endscript

script net_print_setlist 
	getarraysize \{$net_setlist_songs}
	array_count = 0
	begin
	printf qs(0x39f26b60) c = ($net_setlist_songs [<array_count>])
	<array_count> = (<array_count> + 1)
	repeat <array_size>
endscript

script get_selection_indeces 
	get_number_of_songs
	if ($net_song_num = (<num_songs> -1))
		songlist_index = ($net_song_num + 1)
		menu_selection_index = 1
	else
		total_selections = (<num_songs> / 2)
		if (<is_host_selection>)
			picks_left = $host_songs_to_pick
			if ($game_mode = p2_coop)
				<total_selections> = (<total_selections> + 1)
				songlist_index = (<num_songs> - ((<picks_left> - 1) * 2))
				if (<songlist_index> > <num_songs>)
					<songlist_index> = (<num_songs> + 1)
				endif
			else
				songlist_index = (<num_songs> - (<picks_left> * 2))
			endif
		else
			picks_left = $client_songs_to_pick
			songlist_index = (<num_songs> - ((<picks_left> * 2) - 1))
		endif
		menu_selection_index = ((<total_selections> - <picks_left>) + 1)
	endif
	return songlist_index = <songlist_index> menu_selection_index = <menu_selection_index>
endscript

script reset_setlist 
	printf \{qs(0x50c20135)}
	get_number_of_song_selections
	change host_songs_to_pick = <song_selections>
	change client_songs_to_pick = <song_selections>
	if (ishost)
		setsongselections
	endif
	getarraysize \{$net_setlist_songs}
	array_count = 0
	begin
	setarrayelement arrayname = net_setlist_songs globalarray index = <array_count> newvalue = null
	setarrayelement arrayname = net_setlist_tiers globalarray index = <array_count> newvalue = 0
	<array_count> = (<array_count> + 1)
	repeat <array_size>
endscript

script get_number_of_song_selections 
	get_number_of_songs
	return song_selections = ((<num_songs> - 1) / 2)
endscript

script get_number_of_songs 
	switch ($num_songs)
		case num_1
		return \{num_songs = 1}
		case num_3
		return \{num_songs = 3}
		case num_5
		return \{num_songs = 5}
		case num_7
		return \{num_songs = 7}
	endswitch
endscript

script setlist_unready 
	launchevent \{type = unfocus
		target = ready_container_p1}
	launchevent \{type = focus
		target = current_menu}
	drop_out_ready_sign \{player = 1}
endscript

script create_net_ui \{parent_element = net_setlist_container}
	gamemode_getnumplayers
	index = 1
	<name> = qs(0x00000000)
	begin
	getplayerinfo <index> net_obj_id
	if ($online_song_choice_id = <net_obj_id>)
		formattext checksumname = gamertag 'gamertag_%d' d = (<index> - 1)
		<name> = $<gamertag>
		break
	endif
	<index> = (<index> + 1)
	repeat <num_players>
	if (<index> <= 8)
		getplayerinfo <index> is_local_client
		if screenelementexists \{id = setlistinterface}
			if (<is_local_client> = 1)
				formattext textname = bottom_text qs(0x1ae5504c) s = <name>
				setlistinterface :se_setprops number_of_stars_text = <bottom_text>
			else
				formattext textname = bottom_text qs(0x1eaf4961) s = <name>
				setlistinterface :se_setprops number_of_stars_text = <bottom_text>
			endif
		endif
		setlist_popup_z = ($setlist_text_z + 50.0)
	endif
endscript

script destroy_net_ui 
	if screenelementexists \{id = net_setlist_container}
		destroyscreenelement \{id = net_setlist_container}
	endif
endscript

script song_selected_countdown 
	printf \{qs(0x6d8a1932)}
	get_song_title song = <song_checksum>
	i = 3
	begin
	if (<i> < 0)
		break
	endif
	if screenelementexists \{id = setlistinterface}
		formattext textname = msg qs(0x1e737845) d = <song_title> i = <i>
		setlistinterface :se_setprops number_of_stars_text = <msg>
	endif
	i = (<i> - 1)
	wait \{1
		second}
	repeat
	if ishost
		host_proceed_to_online_play
	endif
endscript

script spin_names 
	obj_getid
	<objid> :se_setprops alpha = 1.0 time = 0.1
	<objid> :se_waitprops
	wait \{1
		seconds}
	gamemode_getnumplayers
	wait_time = 0.025
	player_index = 1
	begin
	soundevent \{event = ghmix_scroll_up_down}
	<objid> :se_setprops net_spinner_text_pos = (0.0, -90.0) time = (<wait_time> / 2)
	<objid> :se_waitprops
	formattext checksumname = gamertag 'gamertag_%d' d = <player_index>
	name = $<gamertag>
	<objid> :se_setprops net_spinner_name_text = <name>
	<objid> :se_setprops net_spinner_text_pos = (0.0, 90.0)
	<objid> :se_setprops net_spinner_text_pos = (0.0, 0.0) time = (<wait_time> / 2)
	<objid> :se_waitprops
	<wait_time> = (<wait_time> * 1.2)
	getplayerinfo (<player_index> + 1) net_obj_id
	if ((<wait_time> > 0.6) && ($online_song_choice_id = <net_obj_id>))
		break
	endif
	if (<player_index> = (<num_players> - 1))
		<player_index> = 0
	else
		<player_index> = (<player_index> + 1)
	endif
	repeat
	<objid> :obj_spawnscriptlater kill_online_choose_spinner params = {selected_index = <selected_index>}
	i = 0
	begin
	if (<i> = 0)
		soundevent \{event = ghmix_select}
		<objid> :se_setprops net_spinner_text_color = ($online_lobby_item_text_color)
	else
		soundevent \{event = ghmix_select}
		<objid> :se_setprops net_spinner_text_color = [149 48 48 255]
	endif
	wait \{0.1
		seconds}
	if (<i> = 0)
		<i> = 1
	else
		<i> = 0
	endif
	repeat
endscript

script destroy_spinner 
	if screenelementexists \{id = net_setlist_spinner}
		destroyscreenelement \{id = net_setlist_spinner}
	endif
endscript
