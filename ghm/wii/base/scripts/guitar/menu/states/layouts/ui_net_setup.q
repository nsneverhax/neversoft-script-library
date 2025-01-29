net_career_song_index = 0

script ui_init_net_setup 
	net_init
	gamemode_gettype
	NetSessionFunc \{func = friends_init}
	destroy_loading_screen
endscript

script ui_create_net_setup 
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = net_setup_container
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	net_setup_container :Obj_SpawnScriptNow ui_create_net_setup_spawned params = <...>
endscript

script ui_create_net_setup_spawned 
	begin
	if ($DEMONWARE_IS_READY = 1)
		break
	endif
	Wait \{1
		Frame}
	repeat
	gamemode_gettype
	if ($g_connection_loss_dialogue = 0)
		if (<Type> = career)
			Wait \{1
				Second}
			Change \{current_num_players = 0}
			0x8dbdaee4 \{qs(0x8e0f9b59)}
			Change \{quickplay_song_list_current = -1}
			Change \{net_dropped_players_flag = 0}
			Change \{band_mode_mode = career}
			Change \{players_in_uistate = [
					0
					0
					0
					0
					0
					0
					0
					0
				]}
			if GotParam \{action}
				Change net_band_mode_menu = <action>
			endif
			ui_event_wait \{event = menu_change
				data = {
					state = uistate_band_mode
				}}
		else
			SpawnScriptNow \{task_menu_default_anim_in
				params = {
					base_name = 'band_hub'
				}}
			NetSessionFunc \{Obj = party
				func = set_joiner_mode
				params = {
					mode = online_menu
				}}
			Wait \{1
				Second}
			Change player1_device = ($primary_controller)
			Change \{current_num_players = 1}
			NetSessionFunc func = addcontrollers params = {controller = ($primary_controller)}
			ui_event_wait \{event = menu_change
				data = {
					state = uistate_online
				}}
		endif
	endif
endscript

script ui_destroy_net_setup 
	destroy_net_setup
	destroy_popup_warning_menu
endscript

script destroy_net_setup 
	if ScreenElementExists \{id = net_setup_container}
		DestroyScreenElement \{id = net_setup_container}
	endif
endscript

script ui_deinit_net_setup 
	NetSessionFunc \{Obj = party
		func = stop_party_session}
	NetSessionFunc \{func = friends_uninit}
	NetSessionFunc \{Obj = match
		func = cancel_join_server}
	quit_network_game
	shut_down_net_play
	gamemode_gettype
	if (<Type> = career)
		Change \{current_num_players = 2}
		Change \{num_players_in_band = 0}
		Change \{quickplay_song_list_current = 0}
		Change \{career_matchmaking_complete = 0}
		Change \{net_band_mode_menu = None}
		Change \{net_band_members = [
			]}
		Change \{net_num_joiners = 0}
		Change \{net_career_invite_flag = 0}
		Change \{net_band_leader_player_num = -1}
		Change \{net_encore_msg_start_sent = 0}
		Change \{net_breakdown_continue_msg_sent = 0}
		NetSessionFunc func = addcontrollers params = {controller = ($primary_controller)}
		Change \{num_exclusive_mp_controllers = 0}
		Change \{player_drop_in_setting_sync = 0}
		Change \{net_dropped_players_flag = 0}
		clear_temp_net_id_array
	else
		printf \{qs(0xe66bcf88)}
	endif
endscript
