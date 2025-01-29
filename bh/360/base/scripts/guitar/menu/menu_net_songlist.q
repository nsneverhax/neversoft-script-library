
script net_songlist_leader_text 
	if ScreenElementExists \{id = songlist}
		GameMode_GetType
		if (($g_net_leader_player_num) > 0 && (<type> = career || (($g_lobby_net_state) = net_private)))
			GetPlayerInfo ($g_net_leader_player_num) GamerTag
			<name> = ($<GamerTag>)
			songlist :SE_SetProps \{songlist_leader_alpha = 1.0}
			songlist :SE_SetProps songlist_net_gamertag_text = <name>
		endif
	endif
endscript

script net_songlist_warning_msg 
	Change \{g_songlist_warning_active = 1}
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{type = unfocus
			target = current_menu}
		current_menu :SE_SetProps \{block_events}
	endif
	if IsPS3
		<popup_text> = ($g_online_songlist_warning_msg_ps3)
	else
		<popup_text> = ($g_online_songlist_warning_msg_xen)
	endif
	GameMode_GetType
	if (<type> = career)
		if (($g_net_leader_player_num) > 0)
			GetPlayerInfo ($g_net_leader_player_num) GamerTag
			<name> = ($<GamerTag>)
		else
			<name> = qs(0x00000000)
		endif
		FormatText TextName = heading_text ($g_online_career_sl_warning_title) s = <name>
	else
		<heading_text> = ($g_online_songlist_warning_title)
	endif
	if ScreenElementExists \{id = dialog_box_container}
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
	if ScreenElementExists \{id = dialog_box_container}
		dialog_box_container :Obj_SpawnScriptNow \{net_songlist_warning_msg_timer}
	else
		ScriptAssert \{'Failed creating dialog box'}
	endif
endscript

script net_songlist_warning_msg_timer 
	OnExitRun \{net_songlist_warning_msg_end}
	wait \{2.0
		seconds}
	destroy_dialog_box
	clean_up_user_control_helpers
	add_gamertag_helper exclusive_device = ($primary_controller)
	songlist_create_default_user_control_helpers \{mode = playlist}
	if ScreenElementExists \{id = current_menu}
		songlist :GetSingleTag \{hilight_bar_index}
		current_menu :SE_SetProps \{unblock_events}
		LaunchEvent \{type = unfocus
			target = current_menu}
		LaunchEvent type = focus target = current_menu data = {child_index = <hilight_bar_index>}
	endif
endscript

script net_songlist_warning_msg_end 
	Change \{g_songlist_warning_active = 0}
endscript

script net_get_songlist_player 
	<choosing_player> = 1
	<is_local> = 0
	GetNumPlayersInGame \{local}
	if (<num_players> > 0)
		GetFirstPlayer \{local}
		<choosing_player> = <player>
		begin
		GetPlayerInfo <player> net_obj_id
		if ($online_song_choice_id = <net_obj_id>)
			<choosing_player> = <player>
			<is_local> = 1
		endif
		GetNextPlayer player = <player>
		repeat <num_players>
	endif
	return player = <choosing_player> is_local = <is_local>
endscript

script net_career_songlist_back 
	if IsHost
		generic_event_back \{state = UIstate_career_venue_select}
		SendStructure \{callback = generic_event_back
			data_to_send = {
				state = UIstate_career_venue_select
			}}
	else
		SendStructure \{callback = net_career_songlist_back
			data_to_send = {
				None
			}}
	endif
endscript

script net_songlist_add_song 
	RequireParams \{[
			song
		]
		all}
	if ($g_num_local_song_picks > 0 && $net_song_countdown = 0)
		Change g_num_local_song_picks = ($g_num_local_song_picks - 1)
		if (($g_num_local_song_picks) = 0)
			user_control_destroy_helper \{button = green}
		endif
		if IsHost
			server_add_song song = <song>
		else
			SendStructure callback = server_add_song data_to_send = {song = <song>}
		endif
	endif
endscript

script server_add_song 
	RequireParams \{[
			song
		]
		all}
	if NOT ScriptIsRunning \{host_randomize_playlist}
		if ($net_song_countdown = 0)
			GetArraySize ($current_playlist)
			SendStructure callback = net_add_song_to_playlist data_to_send = {song = <song> playlist_index = <array_size> spawn_script_now}
			net_add_song_to_playlist song = <song> playlist_index = <array_size>
		endif
	endif
endscript

script net_add_song_to_playlist 
	RequireParams \{[
			song
			playlist_index
		]
		all}
	GetArraySize ($current_playlist)
	if (<array_size> <= <playlist_index>)
		AddArrayElement array = ($current_playlist) element = <song>
	else
		InsertArrayElement array = ($current_playlist) element = <song> index = <playlist_index>
	endif
	Change current_playlist = <array>
	if ScreenElementExists \{id = songlist_detail_playlist}
		songlist_detail_playlist :Obj_SpawnScriptNow \{songlist_calculate_playlist_duration}
	endif
	if NOT ScriptIsRunning \{net_song_choosing_timer}
		GameMode_GetType
		if NOT (<type> = career)
			if ScreenElementExists \{id = songlist}
				songlist :Obj_SpawnScriptNow \{net_song_choosing_timer}
			endif
		endif
	endif
	printf \{channel = playlist
		qs(0xe233b640)}
	printstruct channel = playlist ($current_playlist)
	printf \{channel = playlist
		qs(0xcb943ab3)}
	ExtendCrc <song> '_sl_item' out = item_id
	get_ui_song_struct_items song = <song>
	songlist_is_song_in_playlist song = <song>
	if ScreenElementExists id = <item_id>
		GameMode_GetType
		if (<type> = career)
			FormatText TextName = pos_text qs(0xc31d83ea) i = (<playlist_index> + 1)
			<item_id> :SE_SetProps {
				event_handlers = [
					{pad_choose songlist_item_remove_from_playlist params = {ui_struct = <ui_struct>}}
				]
				in_playlist_pos_alpha = 1.0
				in_playlist_pos_text = <pos_text>
				replace_handlers
			}
			<item_id> :SetTags playlist_index = <playlist_index>
			if ($g_net_leader_player_num != -1)
				if PlayerInfoEquals ($g_net_leader_player_num) is_local_client = 1
					user_control_helper_change_text \{button = green
						text = qs(0x34ff4910)}
					GetArraySize ($current_playlist)
					if (<array_size> = $g_songlist_force_num_songs_to_choose)
						songlist_allow_continue
					endif
				endif
			endif
		endif
	endif
	if ScreenElementExists \{id = songlist_detail_playlist_vmenu}
		FormatText TextName = pos_text qs(0xc31d83ea) i = (<playlist_index> + 1)
		CreateScreenElement {
			type = DescInterface
			desc = 'songlist_detail_playlist_item'
			parent = songlist_detail_playlist_vmenu
			songlist_item_text_text = (<ui_struct>.song_title)
			autoSizeDims = true
			in_playlist_pos_alpha = 1.0
			in_playlist_pos_text = <pos_text>
		}
	endif
	if ScreenElementExists \{id = songlist_detail_playlist}
		GetArraySize ($current_playlist)
		FormatText TextName = songs_added qs(0xc31d83ea) i = <array_size>
		songlist_detail_playlist :SE_SetProps {
			songlist_detail_playlist_num_songs_added_text = <songs_added>
		}
	endif
	GetArraySize \{$current_playlist}
	if (<array_size> > ($g_songlist_mini_playlist_detail_items))
		GetScreenElementChildren \{id = songlist_detail_mini_playlist_vmenu}
		DestroyScreenElement id = (<children> [0])
	endif
	if ScreenElementExists \{id = songlist_detail_mini_playlist_vmenu}
		CreateScreenElement {
			type = DescInterface
			desc = 'songlist_detail_playlist_item'
			parent = songlist_detail_mini_playlist_vmenu
			songlist_item_text_text = (<ui_struct>.song_title)
			autoSizeDims = true
			in_playlist_pos_alpha = 1.0
			in_playlist_pos_text = <pos_text>
		}
		<id> :SetTags playlist_index = <playlist_index>
	endif
	SoundEvent \{event = QuickPlay_Select_Song}
	if ScreenElementExists \{id = Songlist_detail}
		Songlist_detail :Obj_SpawnScriptNow \{songlist_detail_transition
			params = {
				desc = songlist_detail_playlist
			}}
	endif
endscript

script net_songlist_remove_song 
	RequireParams \{[
			song
		]
		all}
	if ($net_song_countdown = 0)
		if IsHost
			server_remove_song song = <song>
		else
			SendStructure callback = server_remove_song data_to_send = {song = <song>}
		endif
	endif
endscript

script server_remove_song 
	RequireParams \{[
			song
		]
		all}
	if ($net_song_countdown = 0)
		SendStructure callback = net_remove_song_from_playlist data_to_send = {song = <song> spawn_script_now}
		net_remove_song_from_playlist song = <song>
	endif
endscript

script net_remove_song_from_playlist 
	RequireParams \{[
			song
		]
		all}
	ExtendCrc <song> '_sl_item' out = item_id
	get_ui_song_struct_items song = <song>
	GetArraySize ($current_playlist)
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
		if PlayerInfoEquals ($g_net_leader_player_num) is_local_client = 1
			Change g_num_local_song_picks = ($g_num_local_song_picks + 1)
		endif
	endif
endscript

script net_song_choosing_timer 
	i = 15
	songlist :SE_SetProps \{net_watch_container_alpha = 1.0
		time = 0.5}
	<break_out_index> = 1
	begin
	GetNumPlayersInGame
	GetArraySize ($current_playlist)
	if (<num_players> <= <array_size> && <break_out_index> = 1)
		<break_out_index> = (<i> - 1)
	endif
	if (<i> < <break_out_index> || <i> < 1)
		break
	endif
	FormatText TextName = msg qs(0xfd68af01) i = <i>
	songlist :SE_SetProps net_timer_text = <msg>
	i = (<i> - 1)
	wait \{1
		second}
	repeat
	if IsHost
		host_randomize_playlist
	endif
endscript

script host_randomize_playlist 
	<randomized_playlist> = []
	begin
	GetArraySize ($current_playlist)
	GetRandomValue name = index integer a = 0 b = (<array_size> -1)
	AddArrayElement array = <randomized_playlist> element = ($current_playlist [<index>])
	<randomized_playlist> = <array>
	<song> = ($current_playlist [<index>])
	<i> = 0
	begin
	if (<song> = ($current_playlist [<i>]))
		RemoveArrayElement array = ($current_playlist) index = <i>
		Change current_playlist = <array>
		if ScreenElementExists \{id = songlist_detail_playlist}
			songlist_detail_playlist :Obj_SpawnScriptNow \{songlist_calculate_playlist_duration}
		endif
	else
		<i> = (<i> + 1)
	endif
	GetArraySize ($current_playlist)
	if (<i> >= <array_size>)
		break
	endif
	repeat
	GetArraySize ($current_playlist)
	if (<array_size> <= 0)
		break
	endif
	repeat
	quickplay_choose_random_venue
	SendStructure callback = net_set_randomized_playlist data_to_send = {randomized_playlist = <randomized_playlist> level_checksum = ($current_level)}
	net_set_randomized_playlist randomized_playlist = <randomized_playlist> level_checksum = ($current_level)
endscript

script net_set_randomized_playlist 
	RequireParams \{[
			level_checksum
			randomized_playlist
		]
		all}
	Change current_level = <level_checksum>
	Change current_playlist = <randomized_playlist>
	if ScreenElementExists \{id = songlist_detail_playlist}
		songlist_detail_playlist :Obj_SpawnScriptNow \{songlist_calculate_playlist_duration}
	endif
	GMan_SongFunc \{func = clear_play_list}
	GMan_SongFunc func = add_song_array_to_play_list params = {
		song_array = ($current_playlist)
	}
	if ScreenElementExists \{id = songlist_detail_playlist_vmenu}
		DestroyScreenElement \{id = songlist_detail_playlist_vmenu
			preserve_parent}
		GetArraySize ($current_playlist)
		if (<array_size> > 0)
			<index> = 0
			begin
			get_ui_song_struct_items song = ($current_playlist [<index>])
			FormatText TextName = pos_text qs(0xc31d83ea) i = (<index> + 1)
			CreateScreenElement {
				type = DescInterface
				desc = 'songlist_detail_playlist_item'
				parent = songlist_detail_playlist_vmenu
				songlist_item_text_text = (<ui_struct>.song_title)
				autoSizeDims = true
				in_playlist_pos_alpha = 1.0
				in_playlist_pos_text = <pos_text>
			}
			<id> :SetTags playlist_index = <index>
			ExtendCrc ($current_playlist [<index>]) '_sl_item' out = item_id
			if ScreenElementExists id = <item_id>
				FormatText TextName = pos_text qs(0xc31d83ea) i = (<index> + 1)
				<item_id> :SE_SetProps {
					in_playlist_pos_alpha = 1.0
					in_playlist_pos_text = <pos_text>
				}
			endif
			<index> = (<index> + 1)
			repeat <array_size>
		endif
	endif
	if ScreenElementExists \{id = songlist_detail_mini_playlist_vmenu}
		DestroyScreenElement \{id = songlist_detail_mini_playlist_vmenu
			preserve_parent}
		GetArraySize ($current_playlist)
		if (<array_size> > 0)
			<i> = 0
			<iters> = <array_size>
			if (<array_size> > ($g_songlist_mini_playlist_detail_items))
				<i> = (<array_size> - ($g_songlist_mini_playlist_detail_items))
				<iters> = ($g_songlist_mini_playlist_detail_items)
			endif
			begin
			get_ui_song_struct_items song = ($current_playlist [<i>])
			FormatText TextName = pos_text qs(0xc31d83ea) i = (<i> + 1)
			CreateScreenElement {
				type = DescInterface
				desc = 'songlist_detail_playlist_item'
				parent = songlist_detail_mini_playlist_vmenu
				songlist_item_text_text = (<ui_struct>.song_title)
				autoSizeDims = true
				in_playlist_pos_alpha = 1.0
				in_playlist_pos_text = <pos_text>
			}
			<id> :SetTags playlist_index = <i>
			<i> = (<i> + 1)
			repeat <iters>
		endif
	endif
	if ScreenElementExists \{id = Songlist_detail}
		Songlist_detail :SE_SetProps \{songlist_detail_mini_playlist_text = qs(0x20eca3cb)}
	endif
	if ScreenElementExists \{id = songlist_detail_playlist}
		songlist_detail_playlist :SE_SetProps \{songlist_detail_playlist_text = qs(0x20eca3cb)}
	endif
	if ScreenElementExists \{id = Songlist_detail}
		Songlist_detail :Obj_SpawnScriptNow \{songlist_detail_transition
			params = {
				desc = songlist_detail_playlist
			}}
	endif
	if ScreenElementExists \{id = songlist}
		Change \{net_song_countdown = 1}
		songlist :Obj_SpawnScriptLater \{songlist_countdown}
	endif
endscript

script net_songlist_continue 
	GMan_SongFunc \{func = clear_play_list}
	GMan_SongFunc func = add_song_to_play_list params = {song = <song>}
	Change \{net_permision_to_select_song = 0}
	quickplay_choose_random_venue
	SendStructure callback = net_songlist_continue_msg data_to_send = {song_checksum = <song> level_checksum = ($current_level)}
	if IsHost
		Change \{net_song_countdown = 1}
		if ScreenElementExists \{id = songlist}
			songlist :Obj_SpawnScriptLater songlist_countdown params = {song_checksum = <song>}
		endif
	endif
endscript

script net_songlist_continue_msg 
	RequireParams \{[
			song_checksum
			level_checksum
		]
		all}
	spawnscriptnow \{destroy_songlist_song_preview}
	GMan_SongFunc \{func = clear_play_list}
	GMan_SongFunc func = add_song_to_play_list params = {song = <song_checksum>}
	Change last_song_played = <song_checksum>
	Change current_level = <level_checksum>
	if IsHost
		SendStructure callback = net_songlist_continue_msg data_to_send = {song_checksum = <song_checksum> level_checksum = ($current_level)}
	endif
	Change \{net_song_countdown = 1}
	ui_event_get_top
	if (<base_name> = 'online_quit_warning')
		generic_event_back
	endif
	ui_event_wait_for_safe
	wait_time = 0
	begin
	if ScreenElementExists \{id = songlist}
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
	if IsHost
		SendStructure \{callback = start_songlist_countdown
			data_to_send = {
				None
			}}
		start_songlist_countdown
	else
		SendStructure \{callback = host_start_songlist_countdown
			data_to_send = {
				None
			}}
	endif
endscript

script start_songlist_countdown 
	if ScreenElementExists \{id = songlist}
		songlist :SE_SetProps \{net_watch_container_alpha = 1.0
			time = 0.5}
		GameMode_GetType
		if (<type> = career)
			GMan_SongFunc \{func = clear_play_list}
			GMan_SongFunc func = add_song_array_to_play_list params = {
				song_array = ($current_playlist)
			}
		endif
		Change \{net_song_countdown = 1}
		songlist :Obj_SpawnScriptLater songlist_countdown params = {song_checksum = <song_checksum>}
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
		GMan_ShutDownGameModeGoal
		GMan_StartGameModeGoal
	endif
	disable_pause
	i = 5
	begin
	if (<i> < 0)
		break
	endif
	FormatText TextName = msg qs(0xfd68af01) i = <i>
	if ScreenElementExists \{id = songlist}
		songlist :SE_SetProps net_timer_text = <msg>
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
	elseif IsHost
		host_proceed_to_online_play
	endif
endscript

script net_songlist_voting_callback 
	RequireParams \{[
			result
		]
		all}
	printf \{qs(0xfeb1b8e0)}
	if IsHost
		Change competitive_rules = <result>
		GMan_ShutDownGameModeGoal
		GMan_StartGameModeGoal
		SendStructure callback = net_set_competitive_rules data_to_send = {competitive_rules = <result> loading_screen = 1}
		venue = ($current_level)
		if StructureContains structure = ($LevelZones.<venue>) name = loading_movie
			create_venue_loading_screen movie_params = ($LevelZones.<venue>)
		else
			create_loading_screen
		endif
	endif
	ui_event_get_top
	if (<base_name> = 'online_quit_warning')
		ui_event \{event = menu_back}
		ui_event_wait_for_safe
	endif
	if IsHost
		host_proceed_to_online_play
	endif
endscript

script net_set_competitive_rules 
	printf \{qs(0x90c91c39)}
	Change competitive_rules = <competitive_rules>
	GMan_ShutDownGameModeGoal
	GMan_StartGameModeGoal
	if (<loading_screen> = 1)
		venue = ($current_level)
		if StructureContains structure = ($LevelZones.<venue>) name = loading_movie
			create_venue_loading_screen movie_params = ($LevelZones.<venue>)
		else
			create_loading_screen
		endif
	endif
endscript

script songlist_drop_player \{parent = songlist}
	printf \{qs(0x76fc47f7)}
	if ScreenElementExists id = <parent>
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
		killspawnedscript \{name = songlist_countdown}
		killspawnedscript \{name = net_song_choosing_timer}
		if ScreenElementExists \{id = current_menu}
			LaunchEvent \{type = unfocus
				target = current_menu}
		endif
		create_net_popup \{Title = qs(0x5ca2c535)
			popup_text = qs(0x32f94482)}
		if ScreenElementExists \{id = dialog_box_desc_id}
			dialog_box_desc_id :Obj_SpawnScriptNow \{songlist_end_game_spawned
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
		generic_event_back \{state = UIstate_band_lobby_setup}
	else
		ScriptAssert \{'Deprecated Flow'}
	endif
	printf \{qs(0xb4381a1f)}
endscript
