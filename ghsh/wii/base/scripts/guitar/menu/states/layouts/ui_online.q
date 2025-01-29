
script ui_init_online 
	Change \{0x10e387b4 = 1}
	set_home_button_notallowed
	net_init
endscript

script ui_create_online 
	sd_unload_song
	Change \{rich_presence_context = presence_gigboard_and_setlist}
	Change \{game_mode = p2_pro_faceoff}
	Change \{respond_to_signin_changed = 1}
	Change \{respond_to_signin_changed_all_players = 1}
	Change \{respond_to_signin_changed_func = None}
	Change \{is_network_game = 1}
	if NetSessionFunc \{Obj = party
			func = is_host}
		NetSessionFunc \{Obj = party
			func = set_party_joinable
			params = {
				joinable = 1
			}}
	endif
	fadetoblack \{OFF
		no_wait}
	SpawnScriptNow \{0x928a98c9}
	SpawnScriptNow create_net_matchmaking_menu params = <...>
	broadcastevent \{Type = online_menu_created}
endscript

script ui_destroy_online 
	KillSpawnedScript \{Name = create_net_matchmaking_menu}
	destroy_net_matchmaking_menu
endscript

script ui_deinit_online 
	KillSpawnedScript \{Name = set_net_ui_to_finished_searching}
	sd_unload_song
	net_clear_all_remote_player_status
	Change \{0x10e387b4 = 0}
	set_home_button_allowed
	KillSpawnedScript \{Name = set_net_ui_to_finished_searching}
	setplayerinfo 1 controller = ($primary_controller)
	if NetSessionFunc \{Obj = party
			func = is_host}
		NetSessionFunc \{Obj = party
			func = set_party_joinable
			params = {
				joinable = 0
			}}
	endif
endscript

script ui_return_online 
	set_focus_color rgba = ($online_lobby_item_text_color)
	set_unfocus_color rgba = ($online_lobby_item_text_color)
	online_lobby_setup_helper_controls
endscript

script kill_online_popup 
	menu_net_matchmaking_deinit
	destroy_popup_warning_menu
	leave_net_main_menu
endscript
