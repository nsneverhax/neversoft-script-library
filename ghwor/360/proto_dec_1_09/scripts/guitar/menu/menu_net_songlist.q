
script net_songlist_leader_text 
	if ScreenElementExists \{id = SongList}
		SongList :se_setprops \{songlist_net_cont_alpha = 1.0}
		gamemode_gettype
		if (($g_net_leader_player_num) > 0 && (<Type> = career || (($g_lobby_net_state) = net_private)))
			getplayerinfo ($g_net_leader_player_num) gamertag
			<Name> = ($<gamertag>)
			SongList :se_setprops songlist_net_gamertag_text = <Name>
			SongList :se_setprops \{songlist_net_leader_alpha = 1.0}
		else
			formatText TextName = choices_text qs(0x48c6d14c) d = ($g_num_local_song_picks)
			SongList :se_setprops songlist_choices_left_text = <choices_text>
			SongList :se_setprops \{songlist_choices_left_cont_alpha = 1.0}
		endif
	endif
endscript

script net_songlist_warning_msg 
	Change \{g_songlist_warning_active = 1}
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{Type = unfocus
			target = current_menu}
	endif
	if isps3
		<popup_text> = ($g_online_songlist_warning_msg_ps3)
	else
		<popup_text> = ($g_online_songlist_warning_msg_xen)
	endif
	gamemode_gettype
	if (<Type> = career)
		if (($g_net_leader_player_num) > 0)
			getplayerinfo ($g_net_leader_player_num) gamertag
			<Name> = ($<gamertag>)
		else
			<Name> = qs(0x00000000)
		endif
		formatText TextName = heading_text ($g_online_career_sl_warning_title) s = <Name>
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
		parent = SongList
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
	Wait \{2.0
		Seconds}
	destroy_dialog_box
	clean_up_user_control_helpers
	add_gamertag_helper exclusive_device = ($primary_controller)
	songlist_create_default_user_control_helpers \{mode = playlist}
	if ScreenElementExists \{id = current_menu}
		current_menu :se_setprops \{unblock_events}
		LaunchEvent \{Type = unfocus
			target = current_menu}
		LaunchEvent \{Type = focus
			target = current_menu
			data = {
				child_index = 0
			}}
	endif
endscript

script net_songlist_warning_msg_end 
	Change \{g_songlist_warning_active = 0}
endscript

script net_get_songlist_player 
	<choosing_player> = 1
	<is_local> = 0
	getnumplayersingame \{local}
	if (<num_players> > 0)
		getfirstplayer \{local}
		<choosing_player> = <Player>
		begin
		getplayerinfo <Player> net_obj_id
		if ($online_song_choice_id = <net_obj_id>)
			<choosing_player> = <Player>
			<is_local> = 1
		endif
		getnextplayer Player = <Player>
		repeat <num_players>
	endif
	return Player = <choosing_player> is_local = <is_local>
endscript

script net_career_songlist_back 
	if IsHost
		ui_sfx \{menustate = Generic
			uitype = back}
		generic_event_back \{state = uistate_career_venue_select}
		SendStructure \{callback = generic_event_back
			data_to_send = {
				state = uistate_career_venue_select
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
			SendStructure callback = net_add_song_to_playlist data_to_send = {song = <song> playlist_index = <array_Size> spawn_script_now}
			net_add_song_to_playlist song = <song> playlist_index = <array_Size>
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
	if (<array_Size> <= <playlist_index>)
		AddArrayElement array = ($current_playlist) element = <song>
	else
		insertarrayelement array = ($current_playlist) element = <song> index = <playlist_index>
	endif
	Change current_playlist = <array>
	if ScreenElementExists \{id = songlist_detail_playlist}
		songlist_detail_playlist :Obj_SpawnScriptNow \{songlist_calculate_playlist_duration}
	endif
	if NOT ScriptIsRunning \{net_song_choosing_timer}
		gamemode_gettype
		if NOT (<Type> = career)
			if ScreenElementExists \{id = SongList}
				SongList :Obj_SpawnScriptNow \{net_song_choosing_timer}
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
		gamemode_gettype
		if (<Type> = career)
			formatText TextName = pos_text qs(0xc31d83ea) i = (<playlist_index> + 1)
			<item_id> :se_setprops {
				event_handlers = [
					{pad_choose songlist_item_remove_from_playlist params = {ui_struct = <ui_struct>}}
				]
				in_playlist_pos_alpha = 1.0
				in_playlist_pos_text = <pos_text>
				replace_handlers
			}
			<item_id> :SetTags playlist_index = <playlist_index>
			if ($g_net_leader_player_num != -1)
				if playerinfoequals ($g_net_leader_player_num) is_local_client = 1
					user_control_helper_change_text \{button = green
						text = qs(0x34ff4910)}
					GetArraySize ($current_playlist)
					if (<array_Size> = $g_songlist_force_num_songs_to_choose)
						songlist_allow_continue
					endif
				endif
			endif
		endif
	endif
	if ScreenElementExists \{id = songlist_detail_playlist_vmenu}
		formatText TextName = pos_text qs(0xc31d83ea) i = (<playlist_index> + 1)
		CreateScreenElement {
			Type = descinterface
			desc = 'songlist_detail_playlist_item'
			parent = songlist_detail_playlist_vmenu
			songlist_item_text_text = (<ui_struct>.song_title)
			autosizedims = true
			in_playlist_pos_alpha = 1.0
			in_playlist_pos_text = <pos_text>
		}
	endif
	if ScreenElementExists \{id = songlist_detail_playlist}
		GetArraySize ($current_playlist)
		formatText TextName = songs_added qs(0xc31d83ea) i = <array_Size>
		songlist_detail_playlist :se_setprops {
			songlist_detail_playlist_num_songs_added_text = <songs_added>
		}
	endif
	GetArraySize \{$current_playlist}
	if (<array_Size> > ($g_songlist_mini_playlist_detail_items))
		GetScreenElementChildren \{id = songlist_detail_mini_playlist_vmenu}
		DestroyScreenElement id = (<children> [0])
	endif
	if ScreenElementExists \{id = songlist_detail_mini_playlist_vmenu}
		CreateScreenElement {
			Type = descinterface
			desc = 'songlist_detail_playlist_item'
			parent = songlist_detail_mini_playlist_vmenu
			songlist_item_text_text = (<ui_struct>.song_title)
			autosizedims = true
			in_playlist_pos_alpha = 1.0
			in_playlist_pos_text = <pos_text>
		}
		<id> :SetTags playlist_index = <playlist_index>
	endif
	if ScreenElementExists \{id = SongList}
		<choices_left> = ($g_num_local_song_picks)
		if (<choices_left> < 0)
			<choices_left> = 0
		endif
		formatText TextName = choices_text qs(0x48c6d14c) d = <choices_left>
		SongList :se_setprops songlist_choices_left_text = <choices_text>
	endif
	SoundEvent \{event = audio_ui_setlist_select}
	if ScreenElementExists \{id = songlist_detail}
		songlist_detail :Obj_SpawnScriptNow \{songlist_detail_transition
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
	if (<array_Size> > 0)
		<i> = 0
		begin
		if (($current_playlist) [<i>] = <song>)
			songlist_item_remove_from_playlist_guts playlist_index = <i> id = <item_id> ui_struct = <ui_struct>
			break
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	if ($g_net_leader_player_num != -1)
		if playerinfoequals ($g_net_leader_player_num) is_local_client = 1
			Change g_num_local_song_picks = ($g_num_local_song_picks + 1)
		endif
	endif
endscript

script net_song_choosing_timer 
	i = 15
	SongList :se_setprops \{net_watch_container_alpha = 1.0
		time = 0.5}
	<break_out_index> = 1
	begin
	getnumplayersingame
	GetArraySize ($current_playlist)
	if (<num_players> <= <array_Size> && <break_out_index> = 1)
		<break_out_index> = (<i> - 1)
	endif
	if (<i> < <break_out_index> || <i> < 1)
		break
	endif
	formatText TextName = msg qs(0xfd68af01) i = <i>
	SongList :se_setprops net_timer_text = <msg>
	i = (<i> - 1)
	Wait \{1
		Second}
	repeat
	if IsHost
		host_randomize_playlist
	endif
endscript

script host_randomize_playlist 
	<randomized_playlist> = []
	begin
	GetArraySize ($current_playlist)
	GetRandomValue Name = index integer a = 0 b = (<array_Size> -1)
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
	if (<i> >= <array_Size>)
		break
	endif
	repeat
	GetArraySize ($current_playlist)
	if (<array_Size> <= 0)
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
	playlist_clear
	playlist_addsongarray song_array = ($current_playlist)
	if ScreenElementExists \{id = songlist_detail_playlist_vmenu}
		DestroyScreenElement \{id = songlist_detail_playlist_vmenu
			preserve_parent}
		GetArraySize ($current_playlist)
		if (<array_Size> > 0)
			<index> = 0
			begin
			get_ui_song_struct_items song = ($current_playlist [<index>])
			formatText TextName = pos_text qs(0xc31d83ea) i = (<index> + 1)
			CreateScreenElement {
				Type = descinterface
				desc = 'songlist_detail_playlist_item'
				parent = songlist_detail_playlist_vmenu
				songlist_item_text_text = (<ui_struct>.song_title)
				autosizedims = true
				in_playlist_pos_alpha = 1.0
				in_playlist_pos_text = <pos_text>
			}
			<id> :SetTags playlist_index = <index>
			ExtendCrc ($current_playlist [<index>]) '_sl_item' out = item_id
			if ScreenElementExists id = <item_id>
				formatText TextName = pos_text qs(0xc31d83ea) i = (<index> + 1)
				<item_id> :se_setprops {
					in_playlist_pos_alpha = 1.0
					in_playlist_pos_text = <pos_text>
				}
			endif
			<index> = (<index> + 1)
			repeat <array_Size>
		endif
	endif
	if ScreenElementExists \{id = songlist_detail_mini_playlist_vmenu}
		DestroyScreenElement \{id = songlist_detail_mini_playlist_vmenu
			preserve_parent}
		GetArraySize ($current_playlist)
		if (<array_Size> > 0)
			<i> = 0
			<iters> = <array_Size>
			if (<array_Size> > ($g_songlist_mini_playlist_detail_items))
				<i> = (<array_Size> - ($g_songlist_mini_playlist_detail_items))
				<iters> = ($g_songlist_mini_playlist_detail_items)
			endif
			begin
			get_ui_song_struct_items song = ($current_playlist [<i>])
			formatText TextName = pos_text qs(0xc31d83ea) i = (<i> + 1)
			CreateScreenElement {
				Type = descinterface
				desc = 'songlist_detail_playlist_item'
				parent = songlist_detail_mini_playlist_vmenu
				songlist_item_text_text = (<ui_struct>.song_title)
				autosizedims = true
				in_playlist_pos_alpha = 1.0
				in_playlist_pos_text = <pos_text>
			}
			<id> :SetTags playlist_index = <i>
			<i> = (<i> + 1)
			repeat <iters>
		endif
	endif
	if ScreenElementExists \{id = songlist_detail}
		songlist_detail :se_setprops \{songlist_detail_mini_playlist_text = qs(0x20eca3cb)}
	endif
	if ScreenElementExists \{id = songlist_detail_playlist}
		songlist_detail_playlist :se_setprops \{songlist_detail_playlist_text = qs(0x20eca3cb)}
	endif
	if ScreenElementExists \{id = songlist_detail}
		songlist_detail :Obj_SpawnScriptNow \{songlist_detail_transition
			params = {
				desc = songlist_detail_playlist
			}}
	endif
	if ScreenElementExists \{id = SongList}
		Change \{net_song_countdown = 1}
		SongList :Obj_SpawnScriptLater \{songlist_countdown}
	endif
endscript

script net_songlist_continue 
	playlist_clear
	playlist_addsong song = <song>
	Change \{net_permision_to_select_song = 0}
	quickplay_choose_random_venue
	SendStructure callback = net_songlist_continue_msg data_to_send = {song_checksum = <song> level_checksum = ($current_level)}
	if IsHost
		Change \{net_song_countdown = 1}
		if ScreenElementExists \{id = SongList}
			SongList :Obj_SpawnScriptLater songlist_countdown params = {song_checksum = <song>}
		endif
	endif
endscript

script net_songlist_continue_msg 
	RequireParams \{[
			song_checksum
			level_checksum
		]
		all}
	SpawnScriptNow \{destroy_songlist_song_preview}
	playlist_clear
	playlist_addsong song = <song_checksum>
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
	if ScreenElementExists \{id = SongList}
		break
	endif
	if (<wait_time> > 3)
		break
	endif
	Wait \{1.0
		Seconds}
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
	if ScreenElementExists \{id = SongList}
		SongList :se_setprops \{net_watch_container_alpha = 1.0
			time = 0.5}
		gamemode_gettype
		if (<Type> = career)
			playlist_clear
			playlist_addsongarray song_array = ($current_playlist)
		endif
		Change \{net_song_countdown = 1}
		SongList :Obj_SpawnScriptLater songlist_countdown params = {song_checksum = <song_checksum>}
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
	formatText TextName = msg qs(0xfd68af01) i = <i>
	if ScreenElementExists \{id = SongList}
		SongList :se_setprops net_timer_text = <msg>
	endif
	i = (<i> - 1)
	Wait \{1
		Second}
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
			Result
		]
		all}
	printf \{qs(0xfeb1b8e0)}
	if IsHost
		Change competitive_rules = <Result>
		gman_shutdowngamemodegoal
		gman_startgamemodegoal
		SendStructure callback = net_set_competitive_rules data_to_send = {competitive_rules = <Result> loading_screen = 1}
		venue = ($current_level)
		if StructureContains structure = ($LevelZones.<venue>) Name = loading_movie
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
	gman_shutdowngamemodegoal
	gman_startgamemodegoal
	if (<loading_screen> = 1)
		venue = ($current_level)
		if StructureContains structure = ($LevelZones.<venue>) Name = loading_movie
			create_venue_loading_screen movie_params = ($LevelZones.<venue>)
		else
			create_loading_screen
		endif
	endif
endscript

script songlist_drop_player \{parent = SongList}
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
		KillSpawnedScript \{Name = songlist_countdown}
		KillSpawnedScript \{Name = net_song_choosing_timer}
		if ScreenElementExists \{id = current_menu}
			LaunchEvent \{Type = unfocus
				target = current_menu}
		endif
		create_net_popup \{title = qs(0x5ca2c535)
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
	Wait \{3
		Seconds}
	destroy_net_popup
	Wait \{1
		gameframe}
	band_lobby_restore_prematchmaking_settings
	quit_network_game
	generic_event_back \{state = uistate_band_lobby}
	printf \{qs(0xb4381a1f)}
endscript
