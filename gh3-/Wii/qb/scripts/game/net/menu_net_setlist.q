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
g_tie_breaker_song = 0

script create_setlist_popup 
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
	if (ishost)
		if ($host_songs_to_pick = 0)
			setlist_ready_up
		endif
		if ($client_songs_to_pick = 0)
			spawnscriptlater \{drop_in_ready_sign
				params = {
					player = 2
				}}
		endif
	else
		if ($client_songs_to_pick = 0)
			spawnscriptlater \{setlist_ready_up}
		endif
		if ($host_songs_to_pick = 0)
			drop_in_ready_sign \{player = 2}
		endif
	endif
	create_setlist_popup_frames
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

	get_number_of_songs
	get_selection_indeces is_host_selection = <is_host_selection>
	if (<is_host_selection>)
		change host_songs_to_pick = ($host_songs_to_pick -1)
		if ($host_songs_to_pick = 0)
			if ishost
				vmenu_setlist :obj_spawnscriptlater \{setlist_ready_up}
			else
				vmenu_setlist :obj_spawnscriptlater drop_in_ready_sign params = {player = <player>}
			endif
		endif
	else
		change client_songs_to_pick = ($client_songs_to_pick -1)
		if ($client_songs_to_pick = 0)
			if NOT ishost
				vmenu_setlist :obj_spawnscriptlater \{setlist_ready_up}
			else
				vmenu_setlist :obj_spawnscriptlater drop_in_ready_sign params = {player = <player>}
			endif
		endif
	endif
	formattext checksumname = chosen_song_id 'chosen_song_id_p%a_%b' a = <player> b = <menu_selection_index>
	get_song_title song = <song_selection>
	<chosen_song_id> :setprops text = <song_title> scale = (0.58, 0.75)
	setarrayelement arrayname = net_setlist_songs globalarray index = (<songlist_index> -1) newvalue = <song_selection>
	setarrayelement arrayname = net_setlist_tiers globalarray index = (<songlist_index> -1) newvalue = <tier>
	if (($host_songs_to_pick + $client_songs_to_pick) = 0)
		spawnscriptlater \{net_setlist_players_ready}
	endif
endscript

script net_setlist_players_ready 
	wait \{2
		seconds}

	net_print_setlist
	change current_song = ($net_setlist_songs [($net_song_num)])
	setglobaltags progression params = {current_tier = ($net_setlist_tiers [($net_song_num)])}
	if ($g_tie_breaker_song = 1)
		ui_flow_manager_respond_to_action \{action = continue_to_final_song}
	else
		ui_flow_manager_respond_to_action \{action = continue}
	endif
endscript

script net_print_setlist 
	getarraysize \{$net_setlist_songs}
	array_count = 0
	begin

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

script net_deselect_song 

	get_selection_indeces is_host_selection = <is_host_selection>
	if (<menu_selection_index> = 1)
		begin
		killspawnedscript \{name = drop_in_ready_sign}
		killspawnedscript \{name = drop_out_ready_sign}
		repeat 2
		ui_flow_manager_respond_to_action \{action = go_back}
		return
	endif
	formattext checksumname = chosen_song_id 'chosen_song_id_p%a_%b' a = <player> b = (<menu_selection_index> -1)
	<chosen_song_id> :setprops text = '...' scale = (1.0, 1.0)
	if (<is_host_selection>)
		if ($host_songs_to_pick = 0)
			if ishost
				spawnscriptlater \{setlist_unready}
			else
				spawnscriptlater drop_out_ready_sign params = {player = <player>}
			endif
		endif
		change host_songs_to_pick = ($host_songs_to_pick + 1)
	else
		if ($client_songs_to_pick = 0)
			if NOT ishost
				spawnscriptlater \{setlist_unready}
			else
				spawnscriptlater drop_out_ready_sign params = {player = <player>}
			endif
		endif
		change client_songs_to_pick = ($client_songs_to_pick + 1)
	endif
	setarrayelement arrayname = net_setlist_songs globalarray index = (<songlist_index> -3) newvalue = null
	setarrayelement arrayname = net_setlist_tiers globalarray index = (<songlist_index> -3) newvalue = 0
endscript

script reset_setlist 

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

script create_setlist_popup_frames 
	createscreenelement \{type = containerelement
		id = net_setlist_popup_container
		parent = root_window
		pos = (0.0, 0.0)}
	setlist_popup_z = ($setlist_text_z + 50.0)
	if (ishost)
		p1_songs = ($host_songs_to_pick)
		p2_songs = ($client_songs_to_pick)
	else
		p1_songs = ($client_songs_to_pick)
		p2_songs = ($host_songs_to_pick)
	endif
	player = 1
	begin
	if (<player> = 1)
		num_songs = <p1_songs>
		color = ($player1_color)
	else
		num_songs = <p2_songs>
		color = ($player2_color)
	endif
	if (<num_songs> > 0)
		popup_pos = ((380.0, 180.0) + ((<player> -1) * (520.0, 0.0)))
		frame_dims = (420.0, 16.0)
		middle_dims = ((420.0, 0.0) + (0.0, 32.0) * <num_songs>)
		bottom_pos = (<popup_pos> + (13.0, 16.0) + (0.0, 32.0) * <num_songs>)
		displaysprite parent = net_setlist_popup_container tex = window_frame_cap pos = (<popup_pos> + (13.0, 8.0)) dims = <frame_dims> just = [center center] rgba = ($online_dark_blue) z = <setlist_popup_z>
		displaysprite parent = net_setlist_popup_container tex = window_frame_body_tall pos = (<popup_pos> + (13.0, 16.0)) dims = <middle_dims> just = [center top] rgba = ($online_dark_blue) z = <setlist_popup_z>
		displaysprite parent = net_setlist_popup_container tex = window_frame_cap pos = <bottom_pos> dims = <frame_dims> just = [center top] rgba = ($online_dark_blue) z = <setlist_popup_z> flip_h
		displaysprite parent = net_setlist_popup_container tex = window_fill_cap pos = (<popup_pos> + (13.0, 8.0)) dims = <frame_dims> just = [center center] rgba = ($online_trans_grey) z = <setlist_popup_z>
		displaysprite parent = net_setlist_popup_container tex = window_fill_body_large pos = (<popup_pos> + (13.0, 16.0)) dims = <middle_dims> just = [center top] rgba = ($online_trans_grey) z = <setlist_popup_z>
		displaysprite parent = net_setlist_popup_container tex = window_fill_cap pos = <bottom_pos> dims = <frame_dims> just = [center top] rgba = ($online_trans_grey) z = <setlist_popup_z> flip_h
		text_pos = (<popup_pos> + (0.0, 37.0))
		array_count = 1
		begin
		formattext checksumname = chosen_song_id 'chosen_song_id_p%a_%b' a = <player> b = <array_count>
		createscreenelement {
			type = textelement
			id = <chosen_song_id>
			parent = net_setlist_popup_container
			just = [center center]
			internal_just = [center center]
			pos = <text_pos>
			scale = (1.0, 1.0)
			text = '...'
			font = text_a5
			rgba = <color>
			z_priority = (<setlist_popup_z> + 0.2)
		}
		<text_pos> = (<text_pos> + (0.0, 32.0))
		<array_count> = (<array_count> + 1)
		repeat (<num_songs>)
	endif
	<player> = (<player> + 1)
	repeat 2
endscript

script setlist_ready_up 
	launchevent \{type = unfocus
		target = vmenu_setlist}
	drop_in_ready_sign \{player = 1}
	if ($net_current_flow_state = song)
		launchevent \{type = focus
			target = ready_container_p1}
	endif
	ready_container_p1 :setprops \{event_handlers = [
			{
				pad_back
				setlist_go_back
			}
		]
		replace_handlers}
endscript

script setlist_unready 
	launchevent \{type = unfocus
		target = ready_container_p1}
	launchevent \{type = focus
		target = vmenu_setlist}
	drop_out_ready_sign \{player = 1}
endscript
