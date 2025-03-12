
script net_songlist_leader_text 
	if screenelementexists \{id = songlist}
		gamemode_gettype
		if (($g_net_leader_player_num) > 0 && (<type> = career || (($g_lobby_net_state) = net_private)))
			getplayerinfo ($g_net_leader_player_num) gamertag
			<name> = ($<gamertag>)
			songlist :se_setprops \{songlist_leader_alpha = 1.0}
			songlist :se_setprops songlist_net_gamertag_text = <name>
		endif
	endif
endscript

script net_songlist_warning_msg 
	change \{g_songlist_warning_active = 1}
	if screenelementexists \{id = current_menu}
		launchevent \{type = unfocus
			target = current_menu}
		current_menu :se_setprops \{block_events}
	endif
	if isps3
		<popup_text> = ($g_online_songlist_warning_msg_ps3)
	else
		<popup_text> = ($g_online_songlist_warning_msg_xen)
	endif
	gamemode_gettype
	if (<type> = career)
		if (($g_net_leader_player_num) > 0)
			getplayerinfo ($g_net_leader_player_num) gamertag
			<name> = ($<gamertag>)
		else
			<name> = qs(0x00000000)
		endif
		formattext textname = heading_text ($g_online_career_sl_warning_title) s = <name>
	else
		<heading_text> = ($g_online_songlist_warning_title)
	endif
	if screenelementexists \{id = dialog_box_container}
		if (($net_popup_active) = 0)
			destroy_dialog_box
		else
			printf \{qs(0x21d40163)}
			return
		endif
	endif
	create_dialog_box {
		heading_text = <heading_text>
		body_text = <popup_text>
		parent = songlist
		no_background
		dlg_z_priority = 100
	}
	if screenelementexists \{id = dialog_box_container}
		dialog_box_container :obj_spawnscriptnow \{net_songlist_warning_msg_timer}
	else
		scriptassert \{'Failed creating dialog box'}
	endif
endscript

script net_songlist_warning_msg_timer 
	onexitrun \{net_songlist_warning_msg_end}
	wait \{2.0
		seconds}
	destroy_dialog_box
	clean_up_user_control_helpers
	add_gamertag_helper exclusive_device = ($primary_controller)
	songlist_create_default_user_control_helpers \{mode = playlist}
	if screenelementexists \{id = current_menu}
		songlist :getsingletag \{hilight_bar_index}
		current_menu :se_setprops \{unblock_events}
		launchevent \{type = unfocus
			target = current_menu}
		launchevent type = focus target = current_menu data = {child_index = <hilight_bar_index>}
	endif
endscript

script net_songlist_warning_msg_end 
	change \{g_songlist_warning_active = 0}
endscript

script net_get_songlist_player 
	<choosing_player> = 1
	<is_local> = 0
	getnumplayersingame \{local}
	if (<num_players> > 0)
		getfirstplayer \{local}
		<choosing_player> = <player>
		begin
		getplayerinfo <player> net_obj_id
		if ($online_song_choice_id = <net_obj_id>)
			<choosing_player> = <player>
			<is_local> = 1
		endif
		getnextplayer player = <player>
		repeat <num_players>
	endif
	return player = <choosing_player> is_local = <is_local>
endscript

script net_career_songlist_back 
	if ishost
		generic_event_back \{state = uistate_career_venue_select}
		sendstructure \{callback = generic_event_back
			data_to_send = {
				state = uistate_career_venue_select
			}}
	else
		sendstructure \{callback = net_career_songlist_back
			data_to_send = {
				none
			}}
	endif
endscript

script net_songlist_add_song 
	requireparams \{[
			song
		]
		all}
	if ($g_num_local_song_picks > 0 && $net_song_countdown = 0)
		change g_num_local_song_picks = ($g_num_local_song_picks - 1)
		if (($g_num_local_song_picks) = 0)
			user_control_destroy_helper \{button = green}
		endif
		if ishost
			server_add_song song = <song>
		else
			sendstructure callback = server_add_song data_to_send = {song = <song>}
		endif
	endif
endscript

script server_add_song 
	requireparams \{[
			song
		]
		all}
	if NOT scriptisrunning \{host_randomize_playlist}
		if ($net_song_countdown = 0)
			getarraysize ($current_playlist)
			sendstructure callback = net_add_song_to_playlist data_to_send = {song = <song> playlist_index = <array_size> spawn_script_now}
			net_add_song_to_playlist song = <song> playlist_index = <array_size>
		endif
	endif
endscript

script net_add_song_to_playlist 
	requireparams \{[
			song
			playlist_index
		]
		all}
	getarraysize ($current_playlist)
	if (<array_size> <= <playlist_index>)
		addarrayelement array = ($current_playlist) element = <song>
	else
		insertarrayelement array = ($current_playlist) element = <song> index = <playlist_index>
	endif
	change current_playlist = <array>
	if screenelementexists \{id = songlist_detail_playlist}
		songlist_detail_playlist :obj_spawnscriptnow \{songlist_calculate_playlist_duration}
	endif
	if NOT scriptisrunning \{net_song_choosing_timer}
		gamemode_gettype
		if NOT (<type> = career)
			if screenelementexists \{id = songlist}
				songlist :obj_spawnscriptnow \{net_song_choosing_timer}
			endif
		endif
	endif
	printf \{channel = playlist
		qs(0xe233b640)}
	printstruct channel = playlist ($current_playlist)
	printf \{channel = playlist
		qs(0xcb943ab3)}
	extendcrc <song> '_sl_item' out = item_id
	get_ui_song_struct_items song = <song>
	songlist_is_song_in_playlist song = <song>
	if screenelementexists id = <item_id>
		gamemode_gettype
		if (<type> = career)
			formattext textname = pos_text qs(0xc31d83ea) i = (<playlist_index> + 1)
			<item_id> :se_setprops {
				event_handlers = [
					{pad_choose songlist_item_remove_from_playlist params = {ui_struct = <ui_struct>}}
				]
				in_playlist_pos_alpha = 1.0
				in_playlist_pos_text = <pos_text>
				replace_handlers
			}
			<item_id> :settags playlist_index = <playlist_index>
			if ($g_net_leader_player_num != -1)
				if playerinfoequals ($g_net_leader_player_num) is_local_client = 1
					user_control_helper_change_text \{button = green
						text = qs(0x34ff4910)}
					getarraysize ($current_playlist)
					if (<array_size> = $g_songlist_force_num_songs_to_choose)
						songlist_allow_continue
					endif
				endif
			endif
		endif
	endif
	if screenelementexists \{id = songlist_detail_playlist_vmenu}
		formattext textname = pos_text qs(0xc31d83ea) i = (<playlist_index> + 1)
		createscreenelement {
			type = descinterface
			desc = 'songlist_detail_playlist_item'
			parent = songlist_detail_playlist_vmenu
			songlist_item_text_text = (<ui_struct>.song_title)
			autosizedims = true
			in_playlist_pos_alpha = 1.0
			in_playlist_pos_text = <pos_text>
		}
	endif
	if screenelementexists \{id = songlist_detail_playlist}
		getarraysize ($current_playlist)
		formattext textname = songs_added qs(0xc31d83ea) i = <array_size>
		songlist_detail_playlist :se_setprops {
			songlist_detail_playlist_num_songs_added_text = <songs_added>
		}
	endif
	getarraysize \{$current_playlist}
	if (<array_size> > ($g_songlist_mini_playlist_detail_items))
		getscreenelementchildren \{id = songlist_detail_mini_playlist_vmenu}
		destroyscreenelement id = (<children> [0])
	endif
	if screenelementexists \{id = songlist_detail_mini_playlist_vmenu}
		createscreenelement {
			type = descinterface
			desc = 'songlist_detail_playlist_item'
			parent = songlist_detail_mini_playlist_vmenu
			songlist_item_text_text = (<ui_struct>.song_title)
			autosizedims = true
			in_playlist_pos_alpha = 1.0
			in_playlist_pos_text = <pos_text>
		}
		<id> :settags playlist_index = <playlist_index>
	endif
	soundevent \{event = quickplay_select_song}
	if screenelementexists \{id = songlist_detail}
		songlist_detail :obj_spawnscriptnow \{songlist_detail_transition
			params = {
				desc = songlist_detail_playlist
			}}
	endif
endscript

script net_songlist_remove_song 
	requireparams \{[
			song
		]
		all}
	if ($net_song_countdown = 0)
		if ishost
			server_remove_song song = <song>
		else
			sendstructure callback = server_remove_song data_to_send = {song = <song>}
		endif
	endif
endscript

script server_remove_song 
	requireparams \{[
			song
		]
		all}
	if ($net_song_countdown = 0)
		sendstructure callback = net_remove_song_from_playlist data_to_send = {song = <song> spawn_script_now}
		net_remove_song_from_playlist song = <song>
	endif
endscript

script net_remove_song_from_playlist 
	requireparams \{[
			song
		]
		all}
	extendcrc <song> '_sl_item' out = item_id
	get_ui_song_struct_items song = <song>
	getarraysize ($current_playlist)
	if (<array_size> > 0)
		<i> = 0
		begin
		if (($current_playlist) [<i>] = <song>)
			songlist_item_remove_from_playlist_guts playlist_index = <i> id = <item_id> ui_struct = <ui_struct>
			break
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	if ($g_net_leader_player_num != -1)
		if playerinfoequals ($g_net_leader_player_num) is_local_client = 1
			change g_num_local_song_picks = ($g_num_local_song_picks + 1)
		endif
	endif
endscript

script net_song_choosing_timer 
	i = 15
	songlist :se_setprops \{net_watch_container_alpha = 1.0
		time = 0.5}
	<break_out_index> = 1
	begin
	getnumplayersingame
	getarraysize ($current_playlist)
	if (<num_players> <= <array_size> && <break_out_index> = 1)
		<break_out_index> = (<i> - 1)
	endif
	if (<i> < <break_out_index> || <i> < 1)
		break
	endif
	formattext textname = msg qs(0xfd68af01) i = <i>
	songlist :se_setprops net_timer_text = <msg>
	i = (<i> - 1)
	wait \{1
		second}
	repeat
	if ishost
		host_randomize_playlist
	endif
endscript

script host_randomize_playlist 
	<randomized_playlist> = []
	begin
	getarraysize ($current_playlist)
	getrandomvalue name = index integer a = 0 b = (<array_size> -1)
	addarrayelement array = <randomized_playlist> element = ($current_playlist [<index>])
	<randomized_playlist> = <array>
	<song> = ($current_playlist [<index>])
	<i> = 0
	begin
	if (<song> = ($current_playlist [<i>]))
		removearrayelement array = ($current_playlist) index = <i>
		change current_playlist = <array>
		if screenelementexists \{id = songlist_detail_playlist}
			songlist_detail_playlist :obj_spawnscriptnow \{songlist_calculate_playlist_duration}
		endif
	else
		<i> = (<i> + 1)
	endif
	getarraysize ($current_playlist)
	if (<i> >= <array_size>)
		break
	endif
	repeat
	getarraysize ($current_playlist)
	if (<array_size> <= 0)
		break
	endif
	repeat
	quickplay_choose_random_venue
	sendstructure callback = net_set_randomized_playlist data_to_send = {randomized_playlist = <randomized_playlist> level_checksum = ($current_level)}
	net_set_randomized_playlist randomized_playlist = <randomized_playlist> level_checksum = ($current_level)
endscript

script net_set_randomized_playlist 
	requireparams \{[
			level_checksum
			randomized_playlist
		]
		all}
	change current_level = <level_checksum>
	change current_playlist = <randomized_playlist>
	if screenelementexists \{id = songlist_detail_playlist}
		songlist_detail_playlist :obj_spawnscriptnow \{songlist_calculate_playlist_duration}
	endif
	gman_songfunc \{func = clear_play_list}
	gman_songfunc func = add_song_array_to_play_list params = {
		song_array = ($current_playlist)
	}
	if screenelementexists \{id = songlist_detail_playlist_vmenu}
		destroyscreenelement \{id = songlist_detail_playlist_vmenu
			preserve_parent}
		getarraysize ($current_playlist)
		if (<array_size> > 0)
			<index> = 0
			begin
			get_ui_song_struct_items song = ($current_playlist [<index>])
			formattext textname = pos_text qs(0xc31d83ea) i = (<index> + 1)
			createscreenelement {
				type = descinterface
				desc = 'songlist_detail_playlist_item'
				parent = songlist_detail_playlist_vmenu
				songlist_item_text_text = (<ui_struct>.song_title)
				autosizedims = true
				in_playlist_pos_alpha = 1.0
				in_playlist_pos_text = <pos_text>
			}
			<id> :settags playlist_index = <index>
			extendcrc ($current_playlist [<index>]) '_sl_item' out = item_id
			if screenelementexists id = <item_id>
				formattext textname = pos_text qs(0xc31d83ea) i = (<index> + 1)
				<item_id> :se_setprops {
					in_playlist_pos_alpha = 1.0
					in_playlist_pos_text = <pos_text>
				}
			endif
			<index> = (<index> + 1)
			repeat <array_size>
		endif
	endif
	if screenelementexists \{id = songlist_detail_mini_playlist_vmenu}
		destroyscreenelement \{id = songlist_detail_mini_playlist_vmenu
			preserve_parent}
		getarraysize ($current_playlist)
		if (<array_size> > 0)
			<i> = 0
			<iters> = <array_size>
			if (<array_size> > ($g_songlist_mini_playlist_detail_items))
				<i> = (<array_size> - ($g_songlist_mini_playlist_detail_items))
				<iters> = ($g_songlist_mini_playlist_detail_items)
			endif
			begin
			get_ui_song_struct_items song = ($current_playlist [<i>])
			formattext textname = pos_text qs(0xc31d83ea) i = (<i> + 1)
			createscreenelement {
				type = descinterface
				desc = 'songlist_detail_playlist_item'
				parent = songlist_detail_mini_playlist_vmenu
				songlist_item_text_text = (<ui_struct>.song_title)
				autosizedims = true
				in_playlist_pos_alpha = 1.0
				in_playlist_pos_text = <pos_text>
			}
			<id> :settags playlist_index = <i>
			<i> = (<i> + 1)
			repeat <iters>
		endif
	endif
	if screenelementexists \{id = songlist_detail}
		songlist_detail :se_setprops \{songlist_detail_mini_playlist_text = qs(0x20eca3cb)}
	endif
	if screenelementexists \{id = songlist_detail_playlist}
		songlist_detail_playlist :se_setprops \{songlist_detail_playlist_text = qs(0x20eca3cb)}
	endif
	if screenelementexists \{id = songlist_detail}
		songlist_detail :obj_spawnscriptnow \{songlist_detail_transition
			params = {
				desc = songlist_detail_playlist
			}}
	endif
	if screenelementexists \{id = songlist}
		change \{net_song_countdown = 1}
		songlist :obj_spawnscriptlater \{songlist_countdown}
	endif
endscript

script net_songlist_continue 
	gman_songfunc \{func = clear_play_list}
	gman_songfunc func = add_song_to_play_list params = {song = <song>}
	change \{net_permision_to_select_song = 0}
	quickplay_choose_random_venue
	sendstructure callback = net_songlist_continue_msg data_to_send = {song_checksum = <song> level_checksum = ($current_level)}
	if ishost
		change \{net_song_countdown = 1}
		if screenelementexists \{id = songlist}
			songlist :obj_spawnscriptlater songlist_countdown params = {song_checksum = <song>}
		endif
	endif
endscript

script net_songlist_continue_msg 
	requireparams \{[
			song_checksum
			level_checksum
		]
		all}
	spawnscriptnow \{destroy_songlist_song_preview}
	gman_songfunc \{func = clear_play_list}
	gman_songfunc func = add_song_to_play_list params = {song = <song_checksum>}
	change last_song_played = <song_checksum>
	change current_level = <level_checksum>
	if ishost
		sendstructure callback = net_songlist_continue_msg data_to_send = {song_checksum = <song_checksum> level_checksum = ($current_level)}
	endif
	change \{net_song_countdown = 1}
	ui_event_get_top
	if (<base_name> = 'online_quit_warning')
		generic_event_back
	endif
	ui_event_wait_for_safe
	wait_time = 0
	begin
	if screenelementexists \{id = songlist}
		break
	endif
	if (<wait_time> > 3)
		break
	endif
	wait \{1.0
		seconds}
	<wait_time> = (<wait_time> + 1)
	repeat
	host_start_songlist_countdown
endscript

script host_start_songlist_countdown 
	if ishost
		sendstructure \{callback = start_songlist_countdown
			data_to_send = {
				none
			}}
		start_songlist_countdown
	else
		sendstructure \{callback = host_start_songlist_countdown
			data_to_send = {
				none
			}}
	endif
endscript

script start_songlist_countdown 
	if screenelementexists \{id = songlist}
		songlist :se_setprops \{net_watch_container_alpha = 1.0
			time = 0.5}
		gamemode_gettype
		if (<type> = career)
			gman_songfunc \{func = clear_play_list}
			gman_songfunc func = add_song_array_to_play_list params = {
				song_array = ($current_playlist)
			}
		endif
		change \{net_song_countdown = 1}
		songlist :obj_spawnscriptlater songlist_countdown params = {song_checksum = <song_checksum>}
	endif
endscript

script songlist_countdown 
	ui_event_get_top
	if (<base_name> = 'online_quit_warning')
		generic_event_back
	endif
	user_control_destroy_helper \{button = green}
	user_control_destroy_helper \{button = red}
	if ($game_mode != fest_mode && $game_mode != fest_mode_team)
		gman_shutdowngamemodegoal
		gman_startgamemodegoal
	endif
	disable_pause
	i = 5
	begin
	if (<i> < 0)
		break
	endif
	formattext textname = msg qs(0xfd68af01) i = <i>
	if screenelementexists \{id = songlist}
		songlist :se_setprops net_timer_text = <msg>
	endif
	i = (<i> - 1)
	wait \{1
		second}
	repeat
	ui_event_get_top
	if (<base_name> = 'online_quit_warning')
		ui_event \{event = menu_back
			state = uistate_songlist}
		ui_event_wait_for_safe
	endif
	if ($game_mode = fest_mode || $game_mode = fest_mode_team)
		display_competitive_rules_voting \{voting_callback = net_songlist_voting_callback}
	elseif ishost
		host_proceed_to_online_play
	endif
endscript

script net_songlist_voting_callback 
	requireparams \{[
			result
		]
		all}
	printf \{qs(0xfeb1b8e0)}
	if ishost
		change competitive_rules = <result>
		gman_shutdowngamemodegoal
		gman_startgamemodegoal
		sendstructure callback = net_set_competitive_rules data_to_send = {competitive_rules = <result> loading_screen = 1}
		venue = ($current_level)
		if structurecontains structure = ($levelzones.<venue>) name = loading_movie
			create_venue_loading_screen movie_params = ($levelzones.<venue>)
		else
			create_loading_screen
		endif
	endif
	ui_event_get_top
	if (<base_name> = 'online_quit_warning')
		ui_event \{event = menu_back}
		ui_event_wait_for_safe
	endif
	if ishost
		host_proceed_to_online_play
	endif
endscript

script net_set_competitive_rules 
	printf \{qs(0x90c91c39)}
	change competitive_rules = <competitive_rules>
	gman_shutdowngamemodegoal
	gman_startgamemodegoal
	if (<loading_screen> = 1)
		venue = ($current_level)
		if structurecontains structure = ($levelzones.<venue>) name = loading_movie
			create_venue_loading_screen movie_params = ($levelzones.<venue>)
		else
			create_loading_screen
		endif
	endif
endscript

script songlist_drop_player \{parent = songlist}
	printf \{qs(0x76fc47f7)}
	if screenelementexists id = <parent>
		net_generic_drop_player parent = <parent> <...>
	else
		net_generic_drop_player <...>
	endif
endscript

script songlist_end_game 
	printf \{qs(0xfb089051)}
	printstruct <...>
	if ((<is_game_over> = 1) && ($net_popup_active = 0))
		wait_for_safe_shutdown
		if screenelementexists \{id = current_menu}
			launchevent \{type = unfocus
				target = current_menu}
		endif
		create_net_popup \{title = qs(0x5ca2c535)
			popup_text = qs(0x32f94482)}
		if screenelementexists \{id = dialog_box_desc_id}
			dialog_box_desc_id :obj_spawnscriptnow \{songlist_end_game_spawned
				id = not_ui_player_drop_scripts}
		endif
	endif
	printf \{qs(0xdcfda8f0)}
endscript

script songlist_end_game_spawned 
	printf \{qs(0x462a2120)}
	wait \{3
		seconds}
	destroy_net_popup
	wait \{1
		gameframe}
	band_lobby_restore_prematchmaking_settings
	quit_network_game
	if ($g_band_lobby_flag = 1)
		generic_event_back \{state = uistate_band_lobby_setup}
	else
		scriptassert \{'Deprecated Flow'}
	endif
	printf \{qs(0xb4381a1f)}
endscript
