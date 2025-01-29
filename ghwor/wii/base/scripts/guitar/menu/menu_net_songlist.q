
script net_songlist_leader_text 
	if ScreenElementExists \{id = SongList}
		SongList :se_setprops \{songlist_net_cont_alpha = 1.0}
		SongList :se_setprops \{rank_capsule_alpha = 0}
		gamemode_gettype
		if (($g_net_leader_player_num) > 0 && (<Type> = career || (($g_lobby_net_state) = net_private)))
			getplayerinfo ($g_net_leader_player_num) gamertag
			<Name> = ($<gamertag>)
			SongList :se_setprops songlist_net_gamertag_text = <Name>
			SongList :se_setprops \{songlist_net_leader_alpha = 1.0}
		else
			SongList :se_setprops \{songlist_choices_left_cont_alpha = 1.0}
			SongList :se_setprops \{songlist_net_leader_alpha = 0.0}
		endif
		formatText TextName = choices_text qs(0x48c6d14c) d = ($g_num_local_song_picks)
		SongList :se_setprops songlist_choices_left_text = <choices_text>
	endif
endscript

script net_songlist_warning_msg 
	if ($g_show_online_songlist_warning = 1)
		Change \{g_show_online_songlist_warning = 0}
		Change \{g_songlist_warning_active = 1}
		if ScreenElementExists \{id = current_menu}
			LaunchEvent \{Type = unfocus
				target = current_menu}
		endif
		if isps3
			<popup_text> = ($g_online_songlist_warning_msg_ps3)
		elseif isngc
			<popup_text> = ($g_online_songlist_warning_msg_wii)
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
		CreateScreenElement \{parent = SongList
			id = online_songlist_warning
			Type = descinterface
			desc = 'drop_message_box'
			Pos = (640.0, 360.0)
			pos_anchor = [
				left
				top
			]
			just = [
				center
				center
			]
			z_priority = 100}
		if online_songlist_warning :desc_resolvealias \{Name = alias_msg_menu
				param = msg_menu}
			<msg_menu> :se_setprops internal_just = [center top]
			CreateScreenElement {
				parent = <msg_menu>
				Type = TextBlockElement
				text = <heading_text>
				dims = (480.0, 64.0)
				font = fontgrid_text_a1
				rgba = gh6_gold_md
				internal_just = [center center]
				fit_width = `scale	each	line	if	larger`
				fit_height = `scale	down	if	larger`
			}
			CreateScreenElement {
				parent = <msg_menu>
				Type = TextBlockElement
				text = <popup_text>
				dims = (600.0, 200.0)
				font = fontgrid_text_a1
				rgba = gh6_gold_md
				internal_just = [center center]
				Scale = (0.75, 0.75)
				fit_width = wrap
				fit_height = `scale	down	if	larger`
			}
		endif
		if ScreenElementExists \{id = online_songlist_warning}
			online_songlist_warning :Obj_SpawnScriptNow \{net_songlist_warning_msg_timer}
		else
			ScriptAssert \{'Failed creating dialog box'}
		endif
	endif
endscript

script net_songlist_warning_msg_timer 
	OnExitRun \{net_songlist_warning_msg_end}
	Wait \{5.0
		Seconds}
	if ScreenElementExists \{id = online_songlist_warning}
		DestroyScreenElement \{id = online_songlist_warning}
	endif
	clean_up_user_control_helpers
	Change \{g_songlist_warning_active = 0}
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

script net_career_songlist_back 
	if IsHost
		ui_sfx \{menustate = Generic
			uitype = back}
		generic_event_back \{state = uistate_quest_map}
		SendStructure \{callback = generic_event_back
			data_to_send = {
				state = uistate_quest_map
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
			songlist_disallow_jump
			user_control_destroy_helper \{button = yellow}
			songlist_disallow_sort
			user_control_destroy_helper \{button = orange}
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
	get_savegame_from_controller controller = ($primary_controller)
	ExtendCrc <song> '_sl_item' out = item_id
	get_ui_song_struct_items song = <song> savegame = <savegame>
	songlist_is_song_in_playlist song = <song>
	formatText TextName = pos_text qs(0xc31d83ea) i = (<playlist_index> + 1)
	if ScreenElementExists id = <item_id>
		<item_id> :se_setprops {
			in_playlist_pos_alpha = 1.0
			in_playlist_pos_text = <pos_text>
			songlist_source_icon_alpha = 0.0
		}
		<item_id> :SetTags playlist_index = <playlist_index>
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
	get_savegame_from_controller controller = ($primary_controller)
	ExtendCrc <song> '_sl_item' out = item_id
	get_ui_song_struct_items song = <song> savegame = <savegame>
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
		net_songlist_prepare_for_final_countdown
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
	RandomNoRepeat (
		@ Name = main
		@ Name = dream
		@ Name = temple
		)
	SendStructure callback = net_set_randomized_playlist data_to_send = {randomized_playlist = <randomized_playlist> level_checksum = ($current_level) host_rush_scene = <Name>}
	net_set_randomized_playlist randomized_playlist = <randomized_playlist> level_checksum = ($current_level) host_rush_scene = <Name>
endscript

script net_set_randomized_playlist 
	RequireParams \{[
			level_checksum
			randomized_playlist
		]
		all}
	Change current_level = <level_checksum>
	Change current_playlist = <randomized_playlist>
	Change last_rush_selection = <host_rush_scene>
	playlist_clear
	playlist_addsongarray song_array = ($current_playlist)
	get_savegame_from_controller controller = ($primary_controller)
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
			get_ui_song_struct_items song = ($current_playlist [<i>]) savegame = <savegame>
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
	if ScreenElementExists \{id = SongList}
		Change \{net_song_countdown = 1}
		SongList :Obj_SpawnScriptLater \{songlist_countdown}
	endif
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

script net_songlist_prepare_for_final_countdown 
	Change \{net_song_countdown = 1}
	ui_event_wait_for_safe
	<go_back> = 0
	ui_event_get_top
	if (<base_name> = 'online_quit_warning')
		<go_back> = 1
	endif
	if ui_event_exists_in_stack \{Name = 'songlist_options'}
		<go_back> = 1
	endif
	if (<go_back> = 1)
		ui_event \{event = menu_back
			state = uistate_songlist}
		ui_event_wait_for_safe
	endif
	user_control_destroy_helper \{button = green}
	user_control_destroy_helper \{button = red}
	if ($game_mode != fest_mode && $game_mode != fest_mode_team)
		gman_shutdowngamemodegoal
		gman_startgamemodegoal
	endif
	disable_pause
	songlist_disallow_jump
	user_control_destroy_helper \{button = yellow}
	songlist_disallow_sort
	user_control_destroy_helper \{button = blue}
endscript

script songlist_countdown 
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
		if ScreenElementExists \{id = netdroppedinterface}
			DestroyScreenElement \{id = netdroppedinterface}
		endif
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
	quit_network_game_early
	generic_event_back \{state = uistate_band_lobby}
	printf \{qs(0xb4381a1f)}
endscript
