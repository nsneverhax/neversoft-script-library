
script ui_init_online 
	cas_destroy_all_characters
endscript

script ui_create_online 
	i = 0
	begin
	if checkforsignin controller_index = <i>
		break
	endif
	i = (<i> + 1)
	if (<i> = 4)
		spawnscriptnow \{sysnotify_handle_connection_loss}
		return
	endif
	repeat 4
	change \{rich_presence_context = presence_gigboard_and_setlist}
	change \{game_mode = p2_pro_faceoff}
	change \{respond_to_signin_changed = 1}
	change \{respond_to_signin_changed_all_players = 0}
	change \{respond_to_signin_changed_func = none}
	if netsessionfunc \{obj = party
			func = is_host}
		netsessionfunc \{obj = party
			func = set_party_joinable
			params = {
				joinable = 1
			}}
	endif
	fadetoblack \{off
		no_wait}
	spawnscriptnow create_net_matchmaking_menu params = <...>
	broadcastevent \{type = online_menu_created}
endscript

script ui_destroy_online 
	killspawnedscript \{name = create_net_matchmaking_menu}
	destroy_net_matchmaking_menu
	if netsessionfunc \{obj = party
			func = is_host}
		netsessionfunc \{obj = party
			func = set_party_joinable
			params = {
				joinable = 0
			}}
	endif
endscript

script ui_deinit_online 
	killspawnedscript \{name = set_net_ui_to_finished_searching}
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
