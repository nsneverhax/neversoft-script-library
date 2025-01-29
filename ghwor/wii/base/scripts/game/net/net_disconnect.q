
script handle_matchmaking_handoff_failed 
	printf \{qs(0xe8e7935e)}
	getnumplayersingame
	printf qs(0x471d1eec) a = ($game_mode)
	printf qs(0xf92aa5b5) a = ($competitive_rules)
	printf qs(0x69afdfb0) a = <num_players>
	debug_bl_dump_submenu_data_all
	destroy_player_drop_events
	quit_network_game
	if ScreenElementExists \{id = band_lobby_popup_menu}
		LaunchEvent \{Type = unfocus
			target = band_lobby_popup_menu}
	endif
	continue_script = handle_matchmaking_handoff_failed_band_lobby
	destroy_dialog_box
	if isxenonorwindx
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

script CreateJoinRefusedDialog 
	if NetSessionFunc \{Obj = party
			func = is_host}
		band_lobby_restart_quickmatch
	endif
endscript

script destroy_connection_dialog_scroller 
	if ScreenElementExists \{id = connection_dialog_scroller}
		DestroyScreenElement \{id = connection_dialog_scroller}
	endif
	destroy_net_popup
endscript

script spawn_player_drop_listeners 
	printf \{qs(0x9428a1b2)}
	destroy_player_drop_events
	SpawnScriptNow net_ui_player_drop_listeners params = {<...>}
endscript

script net_ui_player_drop_listeners \{drop_player_script = default_drop_player_script
		drop_self_script = default_drop_self_script
		end_game_script = default_end_game_scr}
	printf \{qs(0x98bd91b1)}
	SpawnScriptNow create_player_drop_events params = {<...>}
	SpawnScriptNow create_self_drop_events params = {<...>}
	SpawnScriptNow create_end_game_events params = {<...>}
endscript

script create_player_drop_events 
	SetEventHandler response = call_script event = drop_net_player Scr = drop_script_spawner params = {spawn_script = <drop_player_script>}
	Block
endscript

script create_self_drop_events 
	SetEventHandler response = call_script event = drop_net_self Scr = drop_script_spawner params = {spawn_script = <drop_self_script>}
	Block
endscript

script create_end_game_events 
	SetEventHandler response = call_script event = drop_player_end_game Scr = drop_script_spawner params = {spawn_script = <end_game_script>}
	Block
endscript

script drop_script_spawner 
	if (1 = <is_game_over>)
		printf \{qs(0x80cfd935)}
		Change \{net_ready_to_start = 1}
	endif
	SpawnScriptNow <spawn_script> params = {<...>} id = ui_player_drop_scripts
endscript

script destroy_player_drop_events 
	printf \{qs(0xc1c007b8)}
	KillSpawnedScript \{Name = create_player_drop_events}
	KillSpawnedScript \{Name = create_end_game_events}
	KillSpawnedScript \{Name = create_self_drop_events}
	KillSpawnedScript \{id = ui_player_drop_scripts}
endscript

script default_drop_player_script 
	warn_default_drop_script <...>
endscript

script default_drop_self_script 
	printf \{qs(0x03ac90f0)}
	printf \{qs(0xbc5429e7)}
	printf \{qs(0xab024d1b)}
	printf \{qs(0xf45d69d2)}
	printf \{qs(0x838dd1ff)}
	printf \{qs(0x03ac90f0)}
endscript

script default_end_game_scr 
	create_net_popup \{title = qs(0x5ca2c535)
		popup_text = qs(0x32f94482)}
	Wait \{3
		Seconds}
	destroy_net_popup
	quit_network_game
	generic_event_back \{state = uistate_band_lobby}
endscript

script drop_listener_cleanup 
	changeglobalinteger \{global_name = g_band_lobby_kill_switch
		new_value = 0}
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

script net_generic_drop_player \{parent = root_window}
	if (<is_game_over> = 0)
		band_lobby_get_player_submenu_index player_num = <dropped_player_num> occupied
		if (<submenu_index> > -1)
			band_lobby_clear_submenu_data submenu_data_index = <submenu_index>
		endif
		getplayerinfo <dropped_player_num> Band
		removeplayerfromband Player = <dropped_player_num> Band = <Band>
		setplayerinfo <dropped_player_num> is_local_client = 0
		setplayerinfo <dropped_player_num> net_id_first = 0
		setplayerinfo <dropped_player_num> net_id_second = 0
		setplayerinfo <dropped_player_num> net_obj_id = -1
		setplayerinfo <dropped_player_num> Band = 1
		setplayerinfo <dropped_player_num> party_id = -1
		setplayerinfo <dropped_player_num> in_game = 0
		switch <drop_reason>
			case net_message_player_quit
			formatText TextName = drop_msg qs(0x567f10d8) s = <name_string>
			case net_message_player_dropped
			case net_message_player_timed_out
			formatText TextName = drop_msg qs(0xd4b272d7) s = <name_string>
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
	setplayerinfo <player_num> is_local_client = 0
	setplayerinfo <player_num> net_id_first = 0
	setplayerinfo <player_num> net_id_second = 0
	setplayerinfo <player_num> net_obj_id = -1
	setplayerinfo <player_num> Band = 1
	setplayerinfo <player_num> party_id = -1
	setplayerinfo <player_num> in_game = 0
endscript
net_career_drop_msg_timer_count = 0

script add_dropped_player_to_dialog_box 
	RequireParams \{[
			msg_text
		]}
	if NOT GotParam \{parent}
		<parent> = root_window
	elseif NOT ScreenElementExists id = <parent>
		<parent> = root_window
	endif
	if NOT ScreenElementExists \{id = netdroppedinterface}
		if ScreenElementExists id = <parent>
			CreateScreenElement {
				parent = <parent>
				id = netdroppedinterface
				Type = descinterface
				desc = 'drop_message_box'
				Pos = (640.0, 360.0)
				dims = (1280.0, 720.0)
				pos_anchor = [left top]
				just = [center center]
				z_priority = 20500
			}
			<id> :Obj_SpawnScriptLater kill_if_empty
		endif
	endif
	if ScreenElementExists \{id = netdroppedinterface}
		if netdroppedinterface :desc_resolvealias \{Name = alias_msg_menu
				param = msg_menu}
			CreateScreenElement {
				parent = <msg_menu>
				Type = TextBlockElement
				text = <msg_text>
				dims = (480.0, 128.0)
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
	Wait \{2.0
		Seconds}
	se_setprops \{alpha = 0.0
		time = 1.0}
	se_waitprops
	Die
endscript

script kill_if_empty 
	begin
	if netdroppedinterface :desc_resolvealias \{Name = alias_msg_menu
			param = msg_menu}
		GetScreenElementChildren id = <msg_menu>
		if GotParam \{children}
			GetArraySize <children>
		else
			<array_Size> = 0
		endif
		if (<array_Size> <= 0)
			RemoveParameter \{children}
			RemoveParameter \{array_Size}
			netdroppedinterface :se_setprops \{alpha = 0.0
				time = 0.5}
			netdroppedinterface :se_waitprops
			GetScreenElementChildren id = <msg_menu>
			if GotParam \{children}
				GetArraySize <children>
			else
				<array_Size> = 0
			endif
			if (<array_Size> <= 0)
				DestroyScreenElement \{id = netdroppedinterface}
				return
			else
				netdroppedinterface :se_setprops \{alpha = 1.0}
			endif
		endif
		if GotParam \{children}
			RemoveParameter \{children}
		endif
		if GotParam \{array_Size}
			RemoveParameter \{array_Size}
		endif
	endif
	Wait \{0.5
		Seconds}
	repeat
endscript
