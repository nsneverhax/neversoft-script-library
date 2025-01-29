
script ui_init_band_lobby_setup 
	Change \{g_band_lobby_flag = 1}
	Change g_band_lobby_current_level = ($current_level)
	killspawnedscript \{name = persistent_band_cancel_lobby}
	killspawnedscript \{name = switch_to_no_band_camera}
endscript

script ui_deinit_band_lobby_setup 
	Change \{g_band_lobby_flag = 0}
	Change \{g_leader_player_num = -1}
	Change \{g_net_leader_player_num = -1}
	Change \{g_career_search = null}
	Change \{g_lobby_invite_flag = 0}
	Change g_band_lobby_current_level = ($current_level)
	reset_all_player_in_game_status
	reset_all_players_local_client_status
	band_lobby_clear_all_viewports_data
	GMan_ShutDownAllGoals
	if InInternetMode
		if NOT ($invite_controller > -1)
			band_lobby_net_cleanup
		endif
	endif
	GetMaxLocalPlayers
	i = 0
	begin
	SetPlayerInfo (<i> + 1) controller = <i>
	i = (<i> + 1)
	repeat <max_players>
	persistent_band_force_unique_musicians
endscript

script ui_create_band_lobby_setup 
	spawnscriptnow ui_create_band_lobby_setup_spawned params = <...>
endscript

script ui_destroy_band_lobby_setup 
endscript

script ui_create_band_lobby_setup_spawned 
	push_unsafe_for_shutdown \{reason = ui_create_band_lobby_setup_spawned}
	begin
	if NOT ScriptIsRunning \{kill_gem_scroller}
		break
	endif
	wait \{1
		gameframe}
	repeat
	mainmenu_kill_song_and_characters
	band_lobby_clear_all_viewports_data
	hide_glitch \{num_frames = 2}
	KillCamAnim \{all}
	destroy_bg_viewport
	setup_bg_viewport
	get_savegame_from_controller controller = ($primary_controller)
	if ($g_lobby_enter_from_main_menu = 1)
		GetMaxLocalPlayers
		i = 0
		begin
		playerinfo = (<i> + 1)
		SetPlayerInfo <playerinfo> controller = <i>
		i = (<i> + 1)
		repeat <max_players>
	endif
	GetPakManCurrent \{map = zones}
	ExtendCrc <pak> '_TRG_Waypoint_' out = node_prefix
	ExtendCrc <node_prefix> 'Vocalist_Start' out = node
	Change CAS_node_name = <node>
	Change \{net_breakdown_continue_msg_sent = 0}
	band_lobby_setup_strings
	ui_event_wait_for_safe
	PlayIGCCam \{id = modelview_view_cam_id
		name = modelview_view_cam
		viewport = bg_viewport
		LockTo = World
		Pos = (3.561758, 4.0928774, 12.285821)
		Quat = (0.029093998, -0.97165793, 0.132579)
		FOV = 72.0
		Play_hold = 1
		interrupt_current}
	pop_unsafe_for_shutdown \{reason = ui_create_band_lobby_setup_spawned}
	ui_event event = menu_change data = {state = UIstate_band_lobby device_num = <device_num> lobby_mode = <lobby_mode>}
endscript
