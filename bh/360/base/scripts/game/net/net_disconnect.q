
script handle_matchmaking_handoff_failed 
	printf \{qs(0xe8e7935e)}
	GetNumPlayersInGame
	printf qs(0x471d1eec) a = ($game_mode)
	printf qs(0xf92aa5b5) a = ($competitive_rules)
	printf qs(0x69afdfb0) a = <num_players>
	debug_bl_dump_submenu_data_all
	destroy_player_drop_events
	quit_network_game
	if ScreenElementExists \{id = band_lobby_popup_menu}
		LaunchEvent \{type = unfocus
			target = band_lobby_popup_menu}
	endif
	continue_script = handle_matchmaking_handoff_failed_band_lobby
	destroy_dialog_box
	if IsXenonOrWinDX
		popup_text = qs(0xeba184f9)
	else
		popup_text = qs(0x93a3822e)
	endif
	create_dialog_box {
		heading_text = qs(0x1d13706e)
		dlg_z_priority = 1500
		body_text = <popup_text>
		no_background
		options = [
			{
				func = <continue_script>
				text = qs(0x182f0173)
			}
		]
	}
endscript

script handle_matchmaking_handoff_failed_band_lobby 
	printf \{qs(0xcc06a9d8)}
	destroy_dialog_box
	band_lobby_return_from_matchmaking
endscript

script handle_matchmaking_handoff_failed_continue_band_mode 
	printf \{qs(0x78a057d3)}
	destroy_dialog_box
	ui_event \{event = menu_refresh}
endscript

script handle_matchmaking_handoff_failed_continue_online 
	printf \{qs(0xb7dda6e3)}
	destroy_dialog_box
	net_clear_all_remote_player_info
	ui_event \{event = menu_refresh}
endscript

script gameinvite_server_unavailable 
	printf \{qs(0x071785f3)}
	net_party_attempted_join_result \{join_result = 0
		join_mode = failed_invite_search
		reason = bad_state}
endscript

script CreateJoinRefusedDialog 
	if NetSessionFunc \{Obj = party
			func = is_host}
		band_lobby_restart_quickmatch
	endif
endscript

script destroy_join_refuse_dialog 
	destroy_connection_dialog_scroller
	destroy_dialog_box
endscript

script destroy_connection_dialog_scroller 
	if ScreenElementExists \{id = connection_dialog_scroller}
		DestroyScreenElement \{id = connection_dialog_scroller}
	endif
	destroy_net_popup
endscript

script spawn_player_drop_listeners 
	destroy_player_drop_events
	spawnscriptnow net_ui_player_drop_listeners params = {<...>}
endscript

script net_ui_player_drop_listeners \{drop_player_script = default_drop_player_script
		end_game_script = default_end_game_scr}
	printscriptinfo \{qs(0xeed0481c)}
	spawnscriptnow create_player_drop_events params = {<...>}
	spawnscriptnow create_end_game_events params = {<...>}
endscript

script create_player_drop_events 
	SetEventHandler response = call_script event = drop_net_player Scr = drop_script_spawner params = {spawn_script = <drop_player_script>}
	Block
endscript

script create_end_game_events 
	SetEventHandler response = call_script event = drop_player_end_game Scr = drop_script_spawner params = {spawn_script = <end_game_script>}
	Block
endscript

script end_game_kill_event_test 
	printf \{qs(0x43c62dae)}
	if (<is_game_over> = 1)
		printf \{qs(0xb76c91f9)}
	endif
endscript

script drop_script_spawner 
	if (1 = <is_game_over>)
		printf \{qs(0x80cfd935)}
		Change \{net_ready_to_start = 1}
	endif
	spawnscriptnow <spawn_script> params = {<...>} id = ui_player_drop_scripts
endscript

script destroy_player_drop_events 
	printscriptinfo \{qs(0xb3fc45b9)}
	killspawnedscript \{name = create_player_drop_events}
	killspawnedscript \{name = create_end_game_events}
	killspawnedscript \{id = ui_player_drop_scripts}
endscript

script default_drop_player_script 
	warn_default_drop_script <...>
endscript

script default_end_game_scr 
	create_net_popup \{Title = qs(0x5ca2c535)
		popup_text = qs(0x32f94482)}
	wait \{3
		seconds}
	destroy_net_popup
	quit_network_game
	generic_event_back \{state = UIstate_band_lobby_setup}
endscript

script warn_default_drop_script 
	printf \{qs(0x03ac90f0)}
	printf \{qs(0xbc5429e7)}
	printf \{qs(0xdd595c0d)}
	printf \{qs(0x9aeb32e8)}
	printf \{qs(0x838dd1ff)}
	printf \{qs(0x03ac90f0)}
	printstruct <...>
	ui_print_states
endscript

script net_popup_game_over 
	if NOT ($net_popup_active)
		FormatText TextName = popup_text qs(0x5e34475d) s = <name_string>
		create_net_popup \{Title = qs(0x5ca2c535)
			popup_text = qs(0x00000000)}
		wait \{3
			seconds}
		destroy_net_popup
	endif
endscript

script net_generic_drop_player \{parent = root_window}
	if (<is_game_over> = 0)
		band_lobby_get_player_submenu_index player_num = <dropped_player_num> occupied
		if (<submenu_index> > -1)
			band_lobby_clear_submenu_data submenu_data_index = <submenu_index>
		endif
		GetPlayerInfo <dropped_player_num> Band
		RemovePlayerFromBand player = <dropped_player_num> Band = <Band>
		SetPlayerInfo <dropped_player_num> is_local_client = 0
		SetPlayerInfo <dropped_player_num> net_id_first = 0
		SetPlayerInfo <dropped_player_num> net_id_second = 0
		SetPlayerInfo <dropped_player_num> net_obj_id = -1
		SetPlayerInfo <dropped_player_num> Band = 1
		SetPlayerInfo <dropped_player_num> party_id = -1
		SetPlayerInfo <dropped_player_num> in_game = 0
		switch <drop_reason>
			case net_message_player_quit
			FormatText TextName = drop_msg qs(0x567f10d8) s = <name_string>
			case net_message_player_dropped
			case net_message_player_timed_out
			FormatText TextName = drop_msg qs(0xd4b272d7) s = <name_string>
			default
			drop_msg = qs(0x00000000)
		endswitch
		add_dropped_player_to_dialog_box msg_text = <drop_msg> parent = <parent>
	endif
endscript

script common_net_player_cleanup 
	RequireParams \{[
			player_num
		]
		all}
	SetPlayerInfo <player_num> is_local_client = 0
	SetPlayerInfo <player_num> net_id_first = 0
	SetPlayerInfo <player_num> net_id_second = 0
	SetPlayerInfo <player_num> net_obj_id = -1
	SetPlayerInfo <player_num> Band = 1
	SetPlayerInfo <player_num> party_id = -1
	SetPlayerInfo <player_num> in_game = 0
endscript

script create_flaming_wait 
	printscriptinfo \{qs(0x470d8ce0)}
	CreateScreenElement {
		id = net_please_wait
		type = DescInterface
		desc = 'net_please_wait'
		parent = root_window
		z_priority = <setlist_popup_z>
		alpha = 1.0
		not_focusable
		z_priority = 662
	}
	net_please_wait :SE_SetProps \{net_flame_message_text = qs(0xa4d1f3c3)}
endscript

script show_flaming_wait 
	wait \{2
		seconds}
	if ScreenElementExists \{id = net_please_wait}
		net_please_wait :SE_SetProps \{alpha = 1.0}
	endif
endscript

script destroy_flaming_wait 
	printscriptinfo \{qs(0x76965b35)}
	if ScreenElementExists \{id = net_please_wait}
		DestroyScreenElement \{id = net_please_wait}
	endif
endscript

script net_dropped_player_recovery 
	Change \{recovered_dropped_players = 1}
	printf \{qs(0x11894cb8)}
	if ($net_dropped_players_flag > 0)
		GetNumPlayersInGame
		old_num_players_shown = (<num_players> + ($net_dropped_players_flag))
		GetNumPlayersInGame \{on_screen}
		if (<num_players_shown> > 0)
			GetFirstPlayer \{on_screen
				out = i}
			count = 1
			begin
			GetPlayerInfo <i> net_obj_id
			if (<net_obj_id> < 0)
				GetPlayerInfo <i> GamerTag out = temp_bogus_gamertag
				GetPlayerInfo <i> part out = temp_bogus_part
				GetPlayerInfo <i> character_id out = temp_bogus_character_id
				GetPlayerInfo <i> character_savegame out = temp_bogus_character_savegame
				GetPlayerInfo <i> band_member out = temp_bogus_band_member
				GetPlayerInfo <i> difficulty out = temp_bogus_difficulty
				GetPlayerInfo <i> controller out = temp_bogus_controller
				GetPlayerInfo <i> fret_anims out = temp_bogus_fret_anims
				GetPlayerInfo <i> bot_play out = temp_bogus_bot_play
				GetPlayerInfo <i> bot_original_controller out = temp_bogus_bot_original_controller
				GetPlayerInfo <i> lefty_flip out = temp_bogus_lefty_flip
				GetPlayerInfo <i> vocals_highway_view out = temp_bogus_vocals_highway_view
				GetPlayerInfo <i> lefthanded_gems out = temp_bogus_lefthanded_gems
				GetPlayerInfo <i> lefthanded_button_ups out = temp_bogus_lefthanded_button_ups
				GetPlayerInfo <i> lefthanded_gems_flip_save out = temp_bogus_lefthanded_gems_flip_save
				GetPlayerInfo <i> lefthanded_button_ups_flip_save out = temp_bogus_lefthanded_button_ups_flip_save
				GetPlayerInfo <i> vocal_streak_phrases out = temp_bogus_vocal_streak_phrases
				GetPlayerInfo <i> vocal_phrase_quality out = temp_bogus_vocal_phrase_quality
				GetPlayerInfo <i> vocal_phrase_max_qual out = temp_bogus_vocal_phrase_max_qual
				GetPlayerInfo <i> mic_type out = temp_bogus_mic_type
				GetPlayerInfo <i> mic_connected out = temp_bogus_mic_connected
				GetPlayerInfo <i> hyperspeed out = temp_bogus_hyperspeed
				GetPlayerInfo <i> net_whammy out = temp_bogus_net_whammy
				GetPlayerInfo <i> is_local_client out = temp_bogus_is_local_client
				GetPlayerInfo <i> highway_layout out = temp_bogus_highway_layout
				GetPlayerInfo <i> net_id_first out = temp_bogus_net_id_first
				GetPlayerInfo <i> net_id_second out = temp_bogus_net_id_second
				GetPlayerInfo <i> controller_type out = temp_bogus_controller_type
				GetPlayerInfo <i> net_obj_id out = temp_bogus_net_obj_id
				GetPlayerInfo <i> net_difficulty out = temp_bogus_net_difficulty
				GetPlayerInfo <i> net_venue out = temp_bogus_net_venue
				GetPlayerInfo <i> Band out = temp_bogus_band
				GetPlayerInfo <i> party_id out = temp_bogus_party_id
				GetPlayerInfo <i> individual_band_score out = temp_bogus_individual_band_score
				GetNextPlayer on_screen player = <i> out = j
				begin
				GetPlayerInfo <j> net_obj_id
				if (<net_obj_id> >= 0)
					printf qs(0x1f1776f8) c = <i> d = <j>
					UpdatePlayerNumObjIdMapper old_player_num = <j> new_player_num = <i>
					GetPlayerInfo <j> GamerTag out = temp_valid_gamertag
					GetPlayerInfo <j> part out = temp_valid_part
					GetPlayerInfo <j> character_id out = temp_valid_character_id
					GetPlayerInfo <j> character_savegame out = temp_valid_character_savegame
					GetPlayerInfo <j> band_member out = temp_valid_band_member
					GetPlayerInfo <j> difficulty out = temp_valid_difficulty
					GetPlayerInfo <j> controller out = temp_valid_controller
					GetPlayerInfo <j> fret_anims out = temp_valid_fret_anims
					GetPlayerInfo <j> bot_play out = temp_valid_bot_play
					GetPlayerInfo <j> bot_original_controller out = temp_valid_bot_original_controller
					GetPlayerInfo <j> lefty_flip out = temp_valid_lefty_flip
					GetPlayerInfo <j> vocals_highway_view out = temp_valid_vocals_highway_view
					GetPlayerInfo <j> lefthanded_gems out = temp_valid_lefthanded_gems
					GetPlayerInfo <j> lefthanded_button_ups out = temp_valid_lefthanded_button_ups
					GetPlayerInfo <j> lefthanded_gems_flip_save out = temp_valid_lefthanded_gems_flip_save
					GetPlayerInfo <j> lefthanded_button_ups_flip_save out = temp_valid_lefthanded_button_ups_flip_save
					GetPlayerInfo <j> vocal_streak_phrases out = temp_valid_vocal_streak_phrases
					GetPlayerInfo <j> vocal_phrase_quality out = temp_valid_vocal_phrase_quality
					GetPlayerInfo <j> vocal_phrase_max_qual out = temp_valid_vocal_phrase_max_qual
					GetPlayerInfo <j> mic_type out = temp_valid_mic_type
					GetPlayerInfo <j> mic_connected out = temp_valid_mic_connected
					GetPlayerInfo <j> hyperspeed out = temp_valid_hyperspeed
					GetPlayerInfo <j> net_whammy out = temp_valid_net_whammy
					GetPlayerInfo <j> is_local_client out = temp_valid_is_local_client
					GetPlayerInfo <j> highway_layout out = temp_valid_highway_layout
					GetPlayerInfo <j> net_id_first out = temp_valid_net_id_first
					GetPlayerInfo <j> net_id_second out = temp_valid_net_id_second
					GetPlayerInfo <j> controller_type out = temp_valid_controller_type
					GetPlayerInfo <j> net_obj_id out = temp_valid_net_obj_id
					GetPlayerInfo <j> net_difficulty out = temp_valid_net_difficulty
					GetPlayerInfo <j> net_venue out = temp_valid_net_venue
					GetPlayerInfo <j> Band out = temp_valid_band
					GetPlayerInfo <j> party_id out = temp_valid_party_id
					GetPlayerInfo <j> individual_band_score out = temp_valid_individual_band_score
					SetPlayerInfo <i> GamerTag = <temp_valid_gamertag>
					SetPlayerInfo <i> part = <temp_valid_part>
					SetPlayerInfo <i> character_id = <temp_valid_character_id>
					SetPlayerInfo <i> character_savegame = <temp_valid_character_savegame>
					SetPlayerInfo <i> band_member = <temp_valid_band_member>
					SetPlayerInfo <i> difficulty = <temp_valid_difficulty>
					SetPlayerInfo <i> controller = <temp_valid_controller>
					SetPlayerInfo <i> fret_anims = <temp_valid_fret_anims>
					SetPlayerInfo <i> bot_play = <temp_valid_bot_play>
					SetPlayerInfo <i> bot_original_controller = <temp_valid_bot_original_controller>
					SetPlayerInfo <i> lefty_flip = <temp_valid_lefty_flip>
					SetPlayerInfo <i> vocals_highway_view = <temp_valid_vocals_highway_view>
					SetPlayerInfo <i> lefthanded_gems = <temp_valid_lefthanded_gems>
					SetPlayerInfo <i> lefthanded_button_ups = <temp_valid_lefthanded_button_ups>
					SetPlayerInfo <i> lefthanded_gems_flip_save = <temp_valid_lefthanded_gems_flip_save>
					SetPlayerInfo <i> lefthanded_button_ups_flip_save = <temp_valid_lefthanded_button_ups_flip_save>
					SetPlayerInfo <i> vocal_streak_phrases = <temp_valid_vocal_streak_phrases>
					SetPlayerInfo <i> vocal_phrase_quality = <temp_valid_vocal_phrase_quality>
					SetPlayerInfo <i> vocal_phrase_max_qual = <temp_valid_vocal_phrase_max_qual>
					SetPlayerInfo <i> mic_type = <temp_valid_mic_type>
					SetPlayerInfo <i> mic_connected = <temp_valid_mic_connected>
					SetPlayerInfo <i> hyperspeed = <temp_valid_hyperspeed>
					SetPlayerInfo <i> net_whammy = <temp_valid_net_whammy>
					SetPlayerInfo <i> is_local_client = <temp_valid_is_local_client>
					SetPlayerInfo <i> highway_layout = <temp_valid_highway_layout>
					SetPlayerInfo <i> net_id_first = <temp_valid_net_id_first>
					SetPlayerInfo <i> net_id_second = <temp_valid_net_id_second>
					SetPlayerInfo <i> controller_type = <temp_valid_controller_type>
					SetPlayerInfo <i> net_obj_id = <temp_valid_net_obj_id>
					SetPlayerInfo <i> net_difficulty = <temp_valid_net_difficulty>
					SetPlayerInfo <i> net_venue = <temp_valid_net_venue>
					SetPlayerInfo <i> Band = <temp_valid_band>
					SetPlayerInfo <i> party_id = <temp_valid_party_id>
					SetPlayerInfo <i> individual_band_score = <temp_valid_individual_band_score>
					SetPlayerInfo <j> GamerTag = <temp_bogus_gamertag>
					SetPlayerInfo <j> part = <temp_bogus_part>
					SetPlayerInfo <j> character_id = <temp_bogus_character_id>
					SetPlayerInfo <j> character_savegame = <temp_bogus_character_savegame>
					SetPlayerInfo <j> band_member = <temp_bogus_band_member>
					SetPlayerInfo <j> difficulty = <temp_bogus_difficulty>
					SetPlayerInfo <j> controller = <temp_bogus_controller>
					SetPlayerInfo <j> fret_anims = <temp_bogus_fret_anims>
					SetPlayerInfo <j> bot_play = <temp_bogus_bot_play>
					SetPlayerInfo <j> bot_original_controller = <temp_bogus_bot_original_controller>
					SetPlayerInfo <j> lefty_flip = <temp_bogus_lefty_flip>
					SetPlayerInfo <j> vocals_highway_view = <temp_bogus_vocals_highway_view>
					SetPlayerInfo <j> lefthanded_gems = <temp_bogus_lefthanded_gems>
					SetPlayerInfo <j> lefthanded_button_ups = <temp_bogus_lefthanded_button_ups>
					SetPlayerInfo <j> lefthanded_gems_flip_save = <temp_bogus_lefthanded_gems_flip_save>
					SetPlayerInfo <j> lefthanded_button_ups_flip_save = <temp_bogus_lefthanded_button_ups_flip_save>
					SetPlayerInfo <j> vocal_streak_phrases = <temp_bogus_vocal_streak_phrases>
					SetPlayerInfo <j> vocal_phrase_quality = <temp_bogus_vocal_phrase_quality>
					SetPlayerInfo <j> vocal_phrase_max_qual = <temp_bogus_vocal_phrase_max_qual>
					SetPlayerInfo <j> mic_type = <temp_bogus_mic_type>
					SetPlayerInfo <j> mic_connected = <temp_bogus_mic_connected>
					SetPlayerInfo <j> hyperspeed = <temp_bogus_hyperspeed>
					SetPlayerInfo <j> net_whammy = <temp_bogus_net_whammy>
					SetPlayerInfo <j> is_local_client = <temp_bogus_is_local_client>
					SetPlayerInfo <j> highway_layout = <temp_bogus_highway_layout>
					SetPlayerInfo <j> net_id_first = <temp_bogus_net_id_first>
					SetPlayerInfo <j> net_id_second = <temp_bogus_net_id_second>
					SetPlayerInfo <j> controller_type = <temp_bogus_controller_type>
					SetPlayerInfo <j> net_obj_id = <temp_bogus_net_obj_id>
					SetPlayerInfo <j> net_difficulty = <temp_bogus_net_difficulty>
					SetPlayerInfo <j> net_venue = <temp_bogus_net_venue>
					SetPlayerInfo <j> Band = <temp_bogus_band>
					SetPlayerInfo <j> party_id = <temp_bogus_party_id>
					SetPlayerInfo <j> individual_band_score = <temp_bogus_individual_band_score>
					break
				endif
				GetNextPlayer on_screen player = <j> out = j
				repeat (<old_num_players_shown> - <count>)
			endif
			GetNextPlayer on_screen player = <i> out = i
			<count> = (<count> + 1)
			repeat <num_players_shown>
		endif
		Change \{net_dropped_players_flag = 0}
	endif
endscript
net_career_drop_msg_timer_count = 0

script net_create_player_drop_message_box 
	printf \{qs(0x0c498bd4)}
	RequireParams \{[
			parent_element
			drop_msg
		]
		all}
	if ScreenElementExists id = <parent_element>
		if NOT ScreenElementExists \{id = net_player_drop_container}
			CreateScreenElement {
				type = ContainerElement
				id = net_player_drop_container
				parent = <parent_element>
				Pos = (640.0, 320.0)
				alpha = 0.0
				z_priority = 1000
				internal_just = [center center]
			}
			CreateScreenElement {
				type = TextBlockElement
				id = net_player_drop_fail_msg_text
				parent = net_player_drop_container
				text = <drop_msg>
				font = fontgrid_text_A1
				fit_width = `scale	each	line	if	larger`
				fit_height = `scale	down	if	larger`
				Pos = (0.0, -5.0)
				dims = (440.0, 180.0)
				rgba = [200 200 200 250]
				internal_scale = 1.0
				just = [center bottom]
				internal_just = [center center]
				shadow
				shadow_rgba = [0 0 0 255]
				shadow_offs = (2.0, 2.0)
				z_priority = 1500.1
			}
			CreateScreenElement \{type = SpriteElement
				parent = net_player_drop_container
				texture = message_container
				rgba = [
					255
					255
					255
					255
				]
				Pos = (0.0, -100.0)
				dims = (600.0, 450.0)
				just = [
					center
					center
				]
				z_priority = 1500.0}
			net_player_drop_container :Obj_SpawnScriptNow \{display_net_dropped_player_msg}
		else
			net_player_drop_fail_msg_text :SE_GetProps
			FormatText TextName = drop_message qs(0x5d10c996) t = <text> d = <drop_msg>
			net_player_drop_fail_msg_text :SE_SetProps text = <drop_message>
			Change net_career_drop_msg_timer_count = (($net_career_drop_msg_timer_count) + 1)
		endif
	endif
endscript

script display_net_dropped_player_msg 
	printf \{qs(0xf38b4635)}
	Obj_GetID
	Change \{net_career_drop_msg_timer_count = 3}
	<objID> :SE_SetProps alpha = 1.0 time = 0.5
	<objID> :SE_WaitProps
	begin
	wait \{1
		second}
	if ($net_career_drop_msg_timer_count < 0)
		break
	endif
	Change net_career_drop_msg_timer_count = (($net_career_drop_msg_timer_count) - 1)
	repeat
	<objID> :SE_SetProps alpha = 0.0 time = 0.8
	<objID> :SE_WaitProps
	if ($net_career_drop_msg_timer_count > 0)
		display_net_dropped_player_msg
		return
	endif
	<objID> :Die
endscript

script drop_client_from_character_select 
	killspawnedscript \{name = cs_rotate_hilites_p2}
	Change \{g_cs_scroll_ready_p2 = 1}
	Change \{g_cs_choose_ready_p2 = 0}
	destroy_menu \{menu_id = char_select_character_container_p2}
	destroy_menu \{menu_id = char_select_container_p2}
	destroy_menu \{menu_id = char_select_hilite_container_p2}
	destroy_menu \{menu_id = scrolling_character_select_p2}
	Change \{player2_present = 0}
	destroy_menu \{menu_id = ready_container_p2}
	if CompositeObjectExists \{name = Bassist}
		Bassist :hide
	endif
endscript

script add_dropped_player_to_dialog_box 
	RequireParams \{[
			msg_text
		]}
	if NOT GotParam \{parent}
		<parent> = root_window
	elseif NOT ScreenElementExists id = <parent>
		<parent> = root_window
	endif
	if NOT ScreenElementExists \{id = NetDroppedInterface}
		if ScreenElementExists id = <parent>
			CreateScreenElement {
				parent = <parent>
				id = NetDroppedInterface
				type = DescInterface
				desc = 'drop_message_box'
				Pos = (640.0, 360.0)
				pos_anchor = [left top]
				just = [center center]
				z_priority = 5000
			}
			<id> :Obj_SpawnScriptLater kill_if_empty
		endif
	endif
	if ScreenElementExists \{id = NetDroppedInterface}
		if NetDroppedInterface :Desc_ResolveAlias \{name = alias_msg_menu
				param = msg_menu}
			CreateScreenElement {
				parent = <msg_menu>
				type = TextBlockElement
				text = <msg_text>
				dims = (480.0, 64.0)
				font = fontgrid_title_a1
				rgba = blue_lt
				internal_just = [center center]
				fit_width = `scale	each	line	if	larger`
				fit_height = `scale	down	if	larger`
				scale_mode = proportional
			}
			<id> :Obj_SpawnScriptNow player_drop_wait_and_kill
		endif
	endif
endscript

script player_drop_wait_and_kill 
	wait \{2.0
		seconds}
	SE_SetProps \{alpha = 0.0
		time = 1.0}
	SE_WaitProps
	Die
endscript

script kill_if_empty 
	begin
	if NetDroppedInterface :Desc_ResolveAlias \{name = alias_msg_menu
			param = msg_menu}
		GetScreenElementChildren id = <msg_menu>
		if GotParam \{children}
			GetArraySize <children>
		else
			<array_size> = 0
		endif
		if (<array_size> <= 0)
			RemoveParameter \{children}
			RemoveParameter \{array_size}
			NetDroppedInterface :SE_SetProps \{alpha = 0.0
				time = 0.5}
			NetDroppedInterface :SE_WaitProps
			GetScreenElementChildren id = <msg_menu>
			if GotParam \{children}
				GetArraySize <children>
			else
				<array_size> = 0
			endif
			if (<array_size> <= 0)
				DestroyScreenElement \{id = NetDroppedInterface}
				return
			else
				NetDroppedInterface :SE_SetProps \{alpha = 1.0}
			endif
		endif
		if GotParam \{children}
			RemoveParameter \{children}
		endif
		if GotParam \{array_size}
			RemoveParameter \{array_size}
		endif
	endif
	wait \{0.5
		seconds}
	repeat
endscript
