host_songs_to_pick = 0
client_songs_to_pick = 0
tie_breaker = HOST
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
	NULL
	NULL
	NULL
	NULL
	NULL
	NULL
	NULL
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
		Dims = (400.0, 45.0)
		just1 = [
			LEFT
			Top
		]
		just2 = [
			RIGHT
			Top
		]}
	if (ScreenElementExists Id = net_setlist_popup_container)
		return
	endif
	create_ready_icons \{pos1 = (290.0, 170.0)
		pos2 = (850.0, 150.0)}
	if ($g_tie_breaker_song = 0)
		reset_setlist
		reset_net_stats_menu
		Change \{net_song_num = 0}
	endif
	if ((<num_songs> = 1) || ($game_mode = p2_coop))
		set_final_song_selection
	endif
	if (IsHost)
		if ($host_songs_to_pick = 0)
			setlist_ready_up
		endif
		if ($client_songs_to_pick = 0)
			drop_in_ready_sign \{Player = 2}
		endif
	else
		if ($client_songs_to_pick = 0)
			setlist_ready_up
		endif
		if ($host_songs_to_pick = 0)
			drop_in_ready_sign \{Player = 2}
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
	FormatText ChecksumName = tier_checksum 'tier%s' S = <Tier>
	song_checksum = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
	SendNetMessage {
		Type = select_song
		Tier = <Tier>
		song_checksum = <song_checksum>
	}
endscript

script net_setlist_go_back 
	SendNetMessage \{Type = select_song
		Tier = 0
		song_checksum = 0}
endscript

script net_select_song 
	Printf "net select song is_host_selection=%d, songs to pick H(%h) C(%c)" D = <is_host_selection> H = ($host_songs_to_pick) C = ($client_songs_to_pick)
	get_number_of_songs
	get_selection_indeces is_host_selection = <is_host_selection>
	if (<is_host_selection>)
		Change host_songs_to_pick = ($host_songs_to_pick -1)
		if ($host_songs_to_pick = 0)
			if IsHost
				vmenu_setlist :Obj_SpawnScriptLater \{setlist_ready_up}
			else
				vmenu_setlist :Obj_SpawnScriptLater drop_in_ready_sign Params = {Player = <Player>}
			endif
		endif
	else
		Change client_songs_to_pick = ($client_songs_to_pick -1)
		if ($client_songs_to_pick = 0)
			if NOT IsHost
				vmenu_setlist :Obj_SpawnScriptLater \{setlist_ready_up}
			else
				vmenu_setlist :Obj_SpawnScriptLater drop_in_ready_sign Params = {Player = <Player>}
			endif
		endif
	endif
	FormatText ChecksumName = chosen_song_id 'chosen_song_id_p%a_%b' A = <Player> B = <menu_selection_index>
	get_song_title Song = <song_selection>
	<chosen_song_id> :SetProps Text = <Song_Title> Scale = (0.58, 0.75)
	SetArrayElement ArrayName = net_setlist_songs GlobalArray Index = (<songlist_index> -1) NewValue = <song_selection>
	SetArrayElement ArrayName = net_setlist_tiers GlobalArray Index = (<songlist_index> -1) NewValue = <Tier>
	if (($host_songs_to_pick + $client_songs_to_pick) = 0)
		SpawnScriptLater \{net_setlist_players_ready}
	endif
endscript

script net_setlist_players_ready 
	Wait \{2
		Seconds}
	Printf \{"Starting net play with setlist:"}
	net_print_setlist
	Change current_song = ($net_setlist_songs [($net_song_num)])
	SetGlobalTags Progression Params = {current_tier = ($net_setlist_tiers [($net_song_num)])}
	if ($g_tie_breaker_song = 1)
		ui_flow_manager_respond_to_action \{action = continue_to_final_song}
	else
		ui_flow_manager_respond_to_action \{action = Continue}
	endif
endscript

script net_print_setlist 
	GetArraySize \{$net_setlist_songs}
	array_count = 0
	begin
	Printf "%c" C = ($net_setlist_songs [<array_count>])
	<array_count> = (<array_count> + 1)
	repeat <array_Size>
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
	Printf "net deselect song songs to pick H(%h) C(%c)" H = ($host_songs_to_pick) C = ($client_songs_to_pick)
	get_selection_indeces is_host_selection = <is_host_selection>
	if (<menu_selection_index> = 1)
		begin
		KillSpawnedScript \{Name = drop_in_ready_sign}
		KillSpawnedScript \{Name = drop_out_ready_sign}
		repeat 2
		ui_flow_manager_respond_to_action \{action = go_back}
		return
	endif
	FormatText ChecksumName = chosen_song_id 'chosen_song_id_p%a_%b' A = <Player> B = (<menu_selection_index> -1)
	<chosen_song_id> :SetProps Text = "..." Scale = (1.0, 1.0)
	if (<is_host_selection>)
		if ($host_songs_to_pick = 0)
			if IsHost
				SpawnScriptLater \{setlist_unready}
			else
				SpawnScriptLater drop_out_ready_sign Params = {Player = <Player>}
			endif
		endif
		Change host_songs_to_pick = ($host_songs_to_pick + 1)
	else
		if ($client_songs_to_pick = 0)
			if NOT IsHost
				SpawnScriptLater \{setlist_unready}
			else
				SpawnScriptLater drop_out_ready_sign Params = {Player = <Player>}
			endif
		endif
		Change client_songs_to_pick = ($client_songs_to_pick + 1)
	endif
	SetArrayElement ArrayName = net_setlist_songs GlobalArray Index = (<songlist_index> -3) NewValue = NULL
	SetArrayElement ArrayName = net_setlist_tiers GlobalArray Index = (<songlist_index> -3) NewValue = 0
endscript

script reset_setlist 
	Printf \{"---reset_setlist"}
	get_number_of_song_selections
	Change host_songs_to_pick = <song_selections>
	Change client_songs_to_pick = <song_selections>
	if (IsHost)
		SetSongSelections
	endif
	GetArraySize \{$net_setlist_songs}
	array_count = 0
	begin
	SetArrayElement ArrayName = net_setlist_songs GlobalArray Index = <array_count> NewValue = NULL
	SetArrayElement ArrayName = net_setlist_tiers GlobalArray Index = <array_count> NewValue = 0
	<array_count> = (<array_count> + 1)
	repeat <array_Size>
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
	CreateScreenElement \{Type = ContainerElement
		Id = net_setlist_popup_container
		PARENT = root_window
		Pos = (0.0, 0.0)}
	setlist_popup_z = ($setlist_text_z + 50.0)
	if (IsHost)
		p1_songs = ($host_songs_to_pick)
		p2_songs = ($client_songs_to_pick)
	else
		p1_songs = ($client_songs_to_pick)
		p2_songs = ($host_songs_to_pick)
	endif
	Player = 1
	begin
	if (<Player> = 1)
		num_songs = <p1_songs>
		Color = ($player1_color)
	else
		num_songs = <p2_songs>
		Color = ($player2_color)
	endif
	if (<num_songs> > 0)
		popup_pos = ((380.0, 180.0) + ((<Player> -1) * (520.0, 0.0)))
		frame_dims = (350.0, 16.0)
		middle_dims = ((350.0, 0.0) + (0.0, 32.0) * <num_songs>)
		bottom_pos = (<popup_pos> + (13.0, 16.0) + (0.0, 32.0) * <num_songs>)
		displaySprite PARENT = net_setlist_popup_container tex = window_frame_cap Pos = (<popup_pos> + (13.0, 8.0)) Dims = <frame_dims> just = [Center Center] rgba = ($online_dark_blue) Z = <setlist_popup_z>
		displaySprite PARENT = net_setlist_popup_container tex = window_frame_body_tall Pos = (<popup_pos> + (13.0, 16.0)) Dims = <middle_dims> just = [Center Top] rgba = ($online_dark_blue) Z = <setlist_popup_z>
		displaySprite PARENT = net_setlist_popup_container tex = window_frame_cap Pos = <bottom_pos> Dims = <frame_dims> just = [Center Top] rgba = ($online_dark_blue) Z = <setlist_popup_z> flip_h
		displaySprite PARENT = net_setlist_popup_container tex = window_fill_cap Pos = (<popup_pos> + (13.0, 8.0)) Dims = <frame_dims> just = [Center Center] rgba = ($online_trans_grey) Z = <setlist_popup_z>
		displaySprite PARENT = net_setlist_popup_container tex = window_fill_body_large Pos = (<popup_pos> + (13.0, 16.0)) Dims = <middle_dims> just = [Center Top] rgba = ($online_trans_grey) Z = <setlist_popup_z>
		displaySprite PARENT = net_setlist_popup_container tex = window_fill_cap Pos = <bottom_pos> Dims = <frame_dims> just = [Center Top] rgba = ($online_trans_grey) Z = <setlist_popup_z> flip_h
		text_pos = (<popup_pos> + (0.0, 37.0))
		array_count = 1
		begin
		FormatText ChecksumName = chosen_song_id 'chosen_song_id_p%a_%b' A = <Player> B = <array_count>
		CreateScreenElement {
			Type = TextElement
			Id = <chosen_song_id>
			PARENT = net_setlist_popup_container
			just = [Center Center]
			internal_just = [Center Center]
			Pos = <text_pos>
			Scale = (1.0, 1.0)
			Text = "..."
			font = text_a5
			rgba = <Color>
			z_priority = (<setlist_popup_z> + 0.2)
		}
		<text_pos> = (<text_pos> + (0.0, 32.0))
		<array_count> = (<array_count> + 1)
		repeat (<num_songs>)
	endif
	<Player> = (<Player> + 1)
	repeat 2
endscript

script setlist_ready_up 
	LaunchEvent \{Type = unfocus
		Target = vmenu_setlist}
	drop_in_ready_sign \{Player = 1}
	if ($net_current_flow_state = Song)
		LaunchEvent \{Type = Focus
			Target = ready_container_p1}
	endif
	ready_container_p1 :SetProps \{event_handlers = [
			{
				pad_back
				setlist_go_back
			}
			{
				pad_start
				menu_show_gamercard
			}
		]
		Replace_Handlers}
endscript

script setlist_unready 
	LaunchEvent \{Type = unfocus
		Target = ready_container_p1}
	LaunchEvent \{Type = Focus
		Target = vmenu_setlist}
	drop_out_ready_sign \{Player = 1}
endscript
