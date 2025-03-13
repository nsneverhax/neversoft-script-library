
script ui_init_band_lobby_setup 
	killspawnedscript \{name = persistent_band_cancel_lobby}
	killspawnedscript \{name = switch_to_no_band_camera}
endscript

script ui_deinit_band_lobby_setup 
	change \{g_leader_player_num = -1}
	change \{g_net_leader_player_num = -1}
	change \{g_career_search = null}
	change \{g_lobby_invite_flag = 0}
	reset_all_player_in_game_status
	reset_all_players_local_client_status
	band_lobby_clear_all_submenu_data
	gman_shutdownallgoals
	if ininternetmode
		if NOT ($invite_controller > -1)
			band_lobby_net_cleanup
		endif
	endif
	getmaxlocalplayers
	i = 0
	begin
	setplayerinfo (<i> + 1) controller = <i>
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
	pushunsafeforshutdown \{context = ui_create_band_lobby_setup_spawned}
	begin
	if NOT scriptisrunning \{kill_gem_scroller}
		break
	endif
	wait \{1
		gameframe}
	repeat
	mainmenu_kill_song_and_characters
	band_lobby_clear_all_submenu_data
	hide_glitch \{num_frames = 2}
	killcamanim \{all}
	destroy_bg_viewport
	setup_bg_viewport
	get_savegame_from_controller controller = ($primary_controller)
	if ($g_lobby_enter_from_main_menu = 1)
		getmaxlocalplayers
		i = 0
		begin
		playerinfo = (<i> + 1)
		setplayerinfo <playerinfo> controller = <i>
		i = (<i> + 1)
		repeat <max_players>
	endif
	getpakmancurrent \{map = zones}
	extendcrc <pak> '_TRG_Waypoint_' out = node_prefix
	extendcrc <node_prefix> 'Vocalist_Start' out = node
	change cas_node_name = <node>
	change \{net_breakdown_continue_msg_sent = 0}
	band_lobby_setup_strings
	ui_event_wait_for_safe
	playigccam \{id = modelview_view_cam_id
		name = modelview_view_cam
		viewport = bg_viewport
		lockto = world
		pos = (3.561758, 4.0928774, 12.285821)
		quat = (0.029093998, -0.97165793, 0.132579)
		fov = 72.0
		play_hold = 1
		interrupt_current}
	popunsafeforshutdown \{context = ui_create_band_lobby_setup_spawned}
	ui_event event = menu_change data = {state = uistate_band_lobby device_num = <device_num> lobby_mode = <lobby_mode>}
endscript
