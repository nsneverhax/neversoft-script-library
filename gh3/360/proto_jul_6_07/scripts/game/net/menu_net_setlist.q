host_songs_to_pick = 0
client_songs_to_pick = 0
tie_breaker = host
num_songs = num_1
player1_color = [
	0
	200
	0
	255
]
player2_color = [
	200
	0
	0
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
0x738758f9 = 0

script create_setlist_popup 0xd52b09c1 = 5
	ui_print_gamertags pos1 = (200.0, 170.0) pos2 = (1080.0, 170.0) dims = (450.0, 45.0) just1 = [left top] just2 = [right top]
	if (screenelementexists id = net_setlist_popup_container)
		return
	endif
	change 0x738758f9 = 0
	reset_setlist
	change net_song_num = 0
	createscreenelement {
		type = containerelement
		id = net_setlist_popup_container
		parent = root_window
		pos = (80.0, 130.0)
	}
	setlist_popup_z = ($setlist_text_z + 40.0)
	middle_dims = ((296.0, 0.0) + (0.0, 30.0) * <0xd52b09c1>)
	popup_pos = (960.0, 100.0)
	bottom_pos = (<popup_pos> + (0.0, 64.0) + (0.0, 30.0) * <0xd52b09c1>)
	displaysprite parent = net_setlist_popup_container tex = char_select_frame_top pos = <popup_pos> dims = (296.0, 128.0) just = [center center] rgba = [190 95 40 200] z = <setlist_popup_z>
	displaysprite parent = net_setlist_popup_container tex = char_select_frame_middle pos = (<popup_pos> + (0.0, 64.0)) dims = <middle_dims> just = [center top] rgba = [190 95 40 200] z = <setlist_popup_z>
	displaysprite parent = net_setlist_popup_container tex = char_select_frame_bottom pos = <bottom_pos> dims = (296.0, 64.0) just = [center top] rgba = [190 95 40 200] z = <setlist_popup_z>
	displaytext {
		parent = net_setlist_popup_container
		text = "CHOSEN SONGS"
		pos = (960.0, 115.0)
		scale = (0.6, 0.55)
		font = fontgrid_title_gh3
		just = [center center]
		rgba = [180 100 60 255]
		z = (<setlist_popup_z> + 0.1)
	}
	text_pos = (<popup_pos> + (0.0, 80.0))
	0x90c05763
	if (<0x5dd41a9a>)
		color = ($player1_color)
	else
		color = ($player2_color)
	endif
	array_count = 1
	begin
	formattext checksumname = chosen_song_id 'chosen_song_id_%n' n = <array_count>
	createscreenelement {
		type = textelement
		id = <chosen_song_id>
		parent = net_setlist_popup_container
		just = [center center]
		internal_just = [center center]
		pos = <text_pos>
		scale = (1.0, 1.0)
		text = "..."
		font = text_a5
		rgba = <color>
		z_priority = (<setlist_popup_z> + 0.2)
	}
	if (<0x5dd41a9a>)
		<0x5dd41a9a> = 0
		color = ($player2_color)
	else
		<0x5dd41a9a> = 1
		color = ($player1_color)
	endif
	<text_pos> = (<text_pos> + (0.0, 30.0))
	<array_count> = (<array_count> + 1)
	repeat <0xd52b09c1>
	create_ready_icons pos1 = (260.0, 130.0) pos2 = (880.0, 110.0)
endscript

script destroy_setlist_popup 
	destroy_gamertags
	destroy_menu \{menu_id = net_setlist_popup_container}
	destroy_ready_icons
endscript

script net_request_song 
	formattext checksumname = tier_checksum 'tier%s' s = <tier>
	song_checksum = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
	sendnetmessage {
		type = select_song
		tier = <tier>
		song_checksum = <song_checksum>
	}
endscript

script net_setlist_go_back 
	sendnetmessage \{type = select_song
		tier = 0
		song_checksum = 0}
endscript

script net_select_song 
	printf "net select song is_host_selection=%d, songs to pick H(%h) C(%c)" d = <is_host_selection> h = ($host_songs_to_pick) c = ($client_songs_to_pick)
	popup_pos = (960.0, 100.0)
	text_pos = (<popup_pos> + (-148.0, 74.0))
	get_number_of_songs
	if (<is_host_selection>)
		change host_songs_to_pick = ($host_songs_to_pick -1)
		if ($host_songs_to_pick = 0)
			drop_in_ready_sign player = <player>
			if ishost
				change 0x738758f9 = 1
			endif
		endif
	else
		change client_songs_to_pick = ($client_songs_to_pick -1)
		if ($client_songs_to_pick = 0)
			drop_in_ready_sign player = <player>
			if NOT ishost
				change 0x738758f9 = 1
			endif
		endif
	endif
	0x5a99c0a5 is_host_selection = <is_host_selection>
	formattext checksumname = chosen_song_id 'chosen_song_id_%n' n = <songlist_index>
	get_song_title song = <song_selection>
	<chosen_song_id> :setprops text = <song_title> scale = (0.58, 0.75)
	setarrayelement arrayname = net_setlist_songs globalarray index = (<songlist_index> -1) newvalue = <song_selection>
	setarrayelement arrayname = net_setlist_tiers globalarray index = (<songlist_index> -1) newvalue = <tier>
	if (($host_songs_to_pick + $client_songs_to_pick) = 0)
		wait 2 seconds
		getarraysize $net_setlist_songs
		array_count = 0
		printf "Starting net play with setlist:"
		begin
		if NOT ($net_setlist_songs [<array_count>] = null)
			printf "%c" c = ($net_setlist_songs [<array_count>])
		endif
		<array_count> = (<array_count> + 1)
		repeat <array_size>
		reset_net_stats_menu
		change current_song = ($net_setlist_songs [($net_song_num)])
		setglobaltags progression params = {current_tier = ($net_setlist_tiers [($net_song_num)])}
		ui_flow_manager_respond_to_action action = continue
	endif
endscript

script 0x5a99c0a5 
	get_number_of_songs
	if (<is_host_selection>)
		list_index = (<num_songs> - ($host_songs_to_pick * 2))
		if NOT ($tie_breaker = host)
			<list_index> = (<list_index> - 1)
		endif
	else
		list_index = (<num_songs> - ($client_songs_to_pick * 2))
		if NOT ($tie_breaker = client)
			<list_index> = (<list_index> - 1)
		endif
	endif
	return songlist_index = <list_index>
endscript

script net_deselect_song 
	printf "net deselect song songs to pick H(%h) C(%c)" h = ($host_songs_to_pick) c = ($client_songs_to_pick)
	0x5a99c0a5 is_host_selection = <is_host_selection>
	if (<songlist_index> < 1)
		ui_flow_manager_respond_to_action action = go_back
		return
	endif
	formattext checksumname = chosen_song_id 'chosen_song_id_%n' n = <songlist_index>
	<chosen_song_id> :setprops text = "..." scale = (1.0, 1.0)
	if (<is_host_selection>)
		if ($host_songs_to_pick = 0)
			drop_out_ready_sign player = <player>
			if ishost
				change 0x738758f9 = 0
			endif
		endif
		change host_songs_to_pick = ($host_songs_to_pick + 1)
	else
		if ($client_songs_to_pick = 0)
			drop_out_ready_sign player = <player>
			if NOT ishost
				change 0x738758f9 = 0
			endif
		endif
		change client_songs_to_pick = ($client_songs_to_pick + 1)
	endif
	setarrayelement arrayname = net_setlist_songs globalarray index = (<songlist_index> -1) newvalue = null
	setarrayelement arrayname = net_setlist_tiers globalarray index = (<songlist_index> -1) newvalue = 0
endscript

script 0x90c05763 
	if (ishost)
		if ($host_songs_to_pick > $client_songs_to_pick)
			return \{0x5dd41a9a = 1}
		else
			return \{0x5dd41a9a = 0}
		endif
	else
		if ($client_songs_to_pick > $host_songs_to_pick)
			return \{0x5dd41a9a = 1}
		else
			return \{0x5dd41a9a = 0}
		endif
	endif
endscript

script reset_setlist 
	get_number_of_song_selections
	change host_songs_to_pick = <song_selections>
	change client_songs_to_pick = <song_selections>
	if ($tie_breaker = host)
		change host_songs_to_pick = ($host_songs_to_pick + 1)
	elseif ($tie_breaker = client)
		change client_songs_to_pick = ($host_songs_to_pick + 1)
	endif
	getarraysize $net_setlist_songs
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

script 0xed1a3871 
	change player1_current_song_selections = 0
	change player2_current_song_selections = 0
	switch ($num_songs)
		case num_1
		change player1_max_song_selections = 0
		change player2_max_song_selections = 0
		case num_3
		change player1_max_song_selections = 1
		change player2_max_song_selections = 1
		case num_5
		change player1_max_song_selections = 2
		change player2_max_song_selections = 2
		case num_7
		change player1_max_song_selections = 3
		change player2_max_song_selections = 3
	endswitch
	switch ($tie_breaker)
		case host
		if ishost
			change player1_max_song_selections = (($player1_max_song_selections) + 1)
		else
			change player2_max_song_selections = (($player2_max_song_selections) + 1)
		endif
		case client
		if ishost
			change player2_max_song_selections = (($player2_max_song_selections) + 1)
		else
			change player1_max_song_selections = (($player1_max_song_selections) + 1)
		endif
	endswitch
endscript

script online_song_select player = 1
	formattext checksumname = 0x237a7696 'player%i_max_song_selections' i = <player>
	formattext checksumname = 0xb2684bf7 'player%i_current_song_selections' i = <player>
	formattext checksumname = 0x9f62cbd4 'player%i_song_selections' i = <player>
	formattext checksumname = player_ready 'setlist_p%i_ready' i = <player>
	formattext checksumname = ready_container 'ready_container_p%i' i = <player>
	if ($<0xb2684bf7> < $<0x237a7696>)
		check_if_selecting_tie_breaker player = <player>
		if (<selecting_tiebreaker> = 1)
			if (<player> = 1)
				formattext checksumname = tier_checksum 'tier%s' s = <tier>
				change tie_breaker_song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
			else
				change tie_breaker_song = <song>
			endif
		else
			if (<player> = 1)
				formattext checksumname = tier_checksum 'tier%s' s = <tier>
				setarrayelement arrayname = <0x9f62cbd4> globalarray index = $<0xb2684bf7> newvalue = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
			else
				setarrayelement arrayname = <0x9f62cbd4> globalarray index = $<0xb2684bf7> newvalue = <song>
			endif
		endif
		change globalname = <0xb2684bf7> newvalue = ($<0xb2684bf7> + 1)
		if (<player> = 1)
			network_player_lobby_message {
				type = song_select
				action = select
				checksum = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
			}
		endif
	else
		change globalname = <player_ready> newvalue = 1
		if screenelementexists id = <ready_container>
			runscriptonscreenelement id = <ready_container> drop_in_ready_sign params = {player = <player>}
		endif
		if (<player> = 1)
			network_player_lobby_message {
				type = ready_up
				action = select
				checksum = final
			}
		endif
	endif
	if (($0xc280291a = 1) && ($0xf3683387 = 1))
		enable_pause
		spawnscriptlater ui_flow_manager_respond_to_action params = {action = continue}
	endif
endscript

script online_song_deselect player = 1
	formattext checksumname = 0x237a7696 'player%i_max_song_selections' i = <player>
	formattext checksumname = 0xb2684bf7 'player%i_current_song_selections' i = <player>
	formattext checksumname = 0x9f62cbd4 'player%i_song_selections' i = <player>
	formattext checksumname = player_ready 'setlist_p%i_ready' i = <player>
	formattext checksumname = ready_container 'ready_container_p%i' i = <player>
	if ($<player_ready> = 1)
		change globalname = <player_ready> newvalue = 0
		if screenelementexists id = <ready_container>
			runscriptonscreenelement id = <ready_container> drop_out_ready_sign params = {player = <player>}
		endif
		if (<player> = 1)
			network_player_lobby_message {
				type = ready_up
				action = deselect
				checksum = final
			}
		endif
	else
		if (<player> = 1)
			network_player_lobby_message {
				type = song_select
				action = deselect
			}
		endif
		if ($<0xb2684bf7> > 0)
			change globalname = <0xb2684bf7> newvalue = ($<0xb2684bf7> - 1)
		else
			ui_flow_manager_respond_to_action action = go_back
		endif
	endif
endscript
