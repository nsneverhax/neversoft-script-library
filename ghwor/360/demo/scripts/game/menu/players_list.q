players_list_force_refresh = 0

script band_lobby_create_popup_menu_players_list 
	printf \{channel = band_lobby
		qs(0xe83e284d)}
	if NOT gotparam \{is_popup}
		parent = root_window
		player = ($g_leader_player_num)
	endif
	createscreenelement {
		parent = <parent>
		type = descinterface
		desc = 'band_lobby_pu_players'
		z_priority = 25.0
	}
	assignalias id = <id> alias = current_band_lobby_popup
	clean_up_user_control_helpers
	getplayerinfo <player> controller
	add_gamertag_helper exclusive_device = <controller>
	band_lobby_create_lobby_status_string
	game_info = <text>
	text = qs(0x00000000)
	title = qs(0x00000000)
	if gotparam \{is_popup}
		if checksumequals a = <list_type> b = matchmaking
			current_band_lobby_popup :obj_spawnscriptnow \{band_lobby_animate_searching}
			if netsessionfunc \{obj = party
					func = is_host}
				current_band_lobby_popup :obj_spawnscriptnow \{band_lobby_searching_timeout}
			endif
			if ($g_lobby_net_state = net_public)
				current_band_lobby_popup :obj_spawnscriptnow \{band_lobby_searching_update}
			endif
			title = ($band_lobby_strings.popup_title_matchmake)
		elseif checksumequals a = <list_type> b = matchmaking_done
			title = ($band_lobby_strings.popup_title_matchmake)
		else
			title = ($band_lobby_strings.popup_title_players)
			text = qs(0x00000000)
		endif
	else
		title = ($band_lobby_strings.popup_title_players)
		text = qs(0x00000000)
	endif
	<id> :se_setprops {
		pu_title_text = <title>
		pu_helper_msg_text = <text>
		game_info_text = <game_info>
	}
	if <id> :desc_resolvealias name = alias_pu_menu
		<resolved_id> :settags desc_id = <id>
		<resolved_id> :obj_spawnscriptnow players_list_update_player_ui_loop params = {list_type = <list_type> controlling_player = <player>}
		<resolved_id> :se_setprops {
			event_handlers = [
				{menu_selection_changed ui_sfx params = {menustate = generic uitype = scrollup}}
				{pad_up band_lobby_popup_adjust_scroll_thumb params = {direction = up}}
				{pad_down band_lobby_popup_adjust_scroll_thumb params = {direction = down}}
			]
		}
		if checksumequals a = <list_type> b = matchmaking
			if (1 = $global_should_use_net_debugging)
				<resolved_id> :se_setprops {
					event_handlers = [
						{pad_choose matchmaking_set_early_desirable}
					]
				}
			endif
		elseif checksumequals a = <list_type> b = matchmaking_done
			if bl_is_in_band_lobby_menus
				gamemode_gettype
				if checksumequals a = <type> b = quickplay
					if band_lobby_can_toggle_guitar_bass
						<resolved_id> :se_setprops {
							event_handlers = [
								{pad_option band_lobby_toggle_guitar_bass}
							]
						}
					endif
				endif
			endif
		endif
		if NOT gotparam \{is_popup}
			assignalias id = <resolved_id> alias = current_menu
		else
			return vmenu = <resolved_id>
		endif
	endif
endscript

script players_list_refresh 
	change \{players_list_force_refresh = 1}
endscript

script players_list_update_player_ui_loop 
	printf \{qs(0x0e844336)}
	obj_getid
	getnumplayersingame
	current_num_players = 0
	return_focus = 0
	begin
	getnumplayersingame
	if ((<current_num_players> != <num_players>) || ($players_list_force_refresh = 1))
		if isscreenelementinfocus id = <objid>
			return_focus = 1
		else
			return_focus = 0
		endif
		<objid> :menu_getselectedindex
		destroyscreenelement id = <objid> preserve_parent
		if (0 < <num_players>)
			getfirstplayer
			begin
			select_actions = none
			if (player = <list_type>)
				if ($g_net_leader_player_num = <controlling_player>)
					select_actions = leadership_and_kick
				else
					select_actions = view
				endif
			elseif (<list_type> = matchmaking_done)
				select_actions = view
			endif
			if playerinfoequals <player> is_local_client = 1
				if (<select_actions> = leadership_and_kick)
					select_actions = grant_leadership
				endif
				band_lobby_add_player_ui_to_popup player_index = <player> parent_id = <objid> controlling_player = <controlling_player> select_actions = <select_actions> list_type = <list_type>
			else
				if (<select_actions> = leadership_and_kick)
					select_actions = kick
				endif
				band_lobby_add_player_ui_to_popup player_index = <player> parent_id = <objid> controlling_player = <controlling_player> select_actions = <select_actions> list_type = <list_type>
			endif
			getnextplayer player = <player>
			repeat <num_players>
		endif
		current_num_players = <num_players>
		if (<return_focus> = 1)
			if (<selected_index> < <num_players>)
				launchevent type = focus target = <objid> data = {child_index = <selected_index>}
			else
				launchevent type = focus target = <objid> data = {child_index = 0}
			endif
		endif
		change \{players_list_force_refresh = 0}
	endif
	wait \{0.5
		second}
	repeat
endscript

script band_lobby_animate_searching 
	printf \{channel = band_lobby
		qs(0x5bd7cef2)}
	obj_getid
	<objid> :se_setprops pu_spinner_cont_alpha = 1.0
	if ($g_lobby_net_state = net_private)
		<objid> :se_setprops pu_spinner_text_text = ($band_lobby_strings.creating_session)
	endif
	if <objid> :desc_resolvealias name = alias_instrument_spinner param = spinner_id
		<spinner_id> :obj_spawnscriptnow instrument_spinner_ui_icon_anim
	endif
	if <objid> :desc_resolvealias name = alias_pu_spinner_text param = spinner_text
		<spinner_text> :obj_spawnscriptnow ui_pulse3
	endif
endscript
