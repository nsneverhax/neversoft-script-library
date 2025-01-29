players_list_force_refresh = 0

script band_lobby_create_popup_menu_players_list 
	printf \{channel = Band_Lobby
		qs(0xe83e284d)}
	if NOT GotParam \{is_popup}
		parent = root_window
		player = ($g_leader_player_num)
	endif
	CreateScreenElement {
		parent = <parent>
		type = DescInterface
		desc = 'band_lobby_pu_players'
		z_priority = 25.0
	}
	AssignAlias id = <id> alias = current_band_lobby_popup
	clean_up_user_control_helpers
	GetPlayerInfo <player> controller
	add_gamertag_helper exclusive_device = <controller>
	band_lobby_create_lobby_status_string
	game_info = <text>
	text = qs(0x00000000)
	Title = qs(0x00000000)
	if GotParam \{is_popup}
		if checksumequals a = <list_type> b = matchmaking
			current_band_lobby_popup :Obj_SpawnScriptNow \{band_lobby_animate_searching}
			if NetSessionFunc \{Obj = party
					func = is_host}
				current_band_lobby_popup :Obj_SpawnScriptNow \{band_lobby_searching_timeout}
			endif
			if ($g_lobby_net_state = net_public)
				current_band_lobby_popup :Obj_SpawnScriptNow \{band_lobby_searching_update}
			endif
			Title = ($band_lobby_strings.popup_title_matchmake)
		elseif checksumequals a = <list_type> b = matchmaking_done
			Title = ($band_lobby_strings.popup_title_matchmake)
		else
			Title = ($band_lobby_strings.popup_title_players)
			text = qs(0x00000000)
		endif
	else
		Title = ($band_lobby_strings.popup_title_players)
		text = qs(0x00000000)
	endif
	<id> :SE_SetProps {
		pu_title_text = <Title>
		pu_helper_msg_text = <text>
		game_info_text = <game_info>
	}
	if <id> :Desc_ResolveAlias name = alias_diamondBling param = diamondBling_id
		<diamondBling_id> :Obj_SpawnScript anim_bling_horizontal_sm params = {minwidth = 50 maxwidth = 100 maxtime = 0.5}
	else
		ScriptAssert \{'UI_art'}
	endif
	if <id> :Desc_ResolveAlias name = alias_diamondBling2 param = diamondbling_id2
		<diamondbling_id2> :Obj_SpawnScript anim_bling_horizontal_sm params = {minwidth = 2 maxwidth = 300 maxtime = 0.5}
	else
		ScriptAssert \{'UI_art'}
	endif
	if <id> :Desc_ResolveAlias name = alias_top_emit1
		if ScreenElementExists \{id = current_band_lobby_popup}
			<resolved_id> :Obj_SpawnScript ui_anim_carbonate params = {max_interval = 5 float_time = 5 start_dims = (20.0, 20.0)}
		endif
	else
		ScriptAssert \{'UI_art'}
	endif
	if <id> :Desc_ResolveAlias name = alias_right_emit1
		if ScreenElementExists \{id = current_band_lobby_popup}
			<resolved_id> :Obj_SpawnScript ui_anim_carbonate params = {max_interval = 1 float_time = 5 start_dims = (20.0, 20.0)}
		endif
	else
		ScriptAssert \{'UI_art'}
	endif
	if <id> :Desc_ResolveAlias name = alias_bottom_emit1
		if ScreenElementExists \{id = current_band_lobby_popup}
			<resolved_id> :Obj_SpawnScript ui_anim_carbonate params = {max_interval = 1 float_time = 5 start_dims = (20.0, 20.0)}
		endif
	else
		ScriptAssert \{'UI_art'}
	endif
	if <id> :Desc_ResolveAlias name = alias_left_emit1
		if ScreenElementExists \{id = current_band_lobby_popup}
			<resolved_id> :Obj_SpawnScript ui_anim_carbonate params = {max_interval = 1 float_time = 5 start_dims = (20.0, 20.0)}
		endif
	else
		ScriptAssert \{'UI_art'}
	endif
	if <id> :Desc_ResolveAlias name = alias_pu_menu
		<resolved_id> :SetTags desc_id = <id>
		<resolved_id> :Obj_SpawnScriptNow players_list_update_player_ui_loop params = {list_type = <list_type> controlling_player = <player>}
		<resolved_id> :SE_SetProps {
			event_handlers = [
				{menu_selection_changed GH5_Band_Screen_UI_Sound params = {player_num = <player> up = 1}}
			]
		}
		if checksumequals a = <list_type> b = matchmaking
			if (1 = $GLOBAL_SHOULD_USE_NET_DEBUGGING)
				<resolved_id> :SE_SetProps {
					event_handlers = [
						{pad_choose matchmaking_set_early_desirable}
					]
				}
			endif
		elseif checksumequals a = <list_type> b = matchmaking_done
			if bl_is_in_band_lobby_menus
				GameMode_GetType
				if checksumequals a = <type> b = quickplay
					if band_lobby_can_toggle_guitar_bass
						<resolved_id> :SE_SetProps {
							event_handlers = [
								{pad_option band_lobby_toggle_guitar_bass}
							]
						}
					endif
				endif
			endif
		endif
		if NOT GotParam \{is_popup}
			AssignAlias id = <resolved_id> alias = current_menu
		else
			return vmenu = <resolved_id>
		endif
	endif
endscript

script players_list_refresh 
	Change \{players_list_force_refresh = 1}
endscript

script players_list_update_player_ui_loop 
	printf \{qs(0x0e844336)}
	Obj_GetID
	add_helpers_on_refresh = 0
	GetNumPlayersInGame
	current_num_players = 0
	return_focus = 0
	begin
	GetNumPlayersInGame
	if ((<current_num_players> != <num_players>) || ($players_list_force_refresh = 1))
		if IsScreenElementInFocus id = <objID>
			return_focus = 1
		else
			return_focus = 0
		endif
		if ScreenElementExists \{id = band_lobby_manage_player}
			DestroyScreenElement \{id = band_lobby_manage_player}
			return_focus = 1
		endif
		<objID> :Menu_GetSelectedIndex
		DestroyScreenElement id = <objID> preserve_parent
		if (<num_players> > 0)
			GetFirstPlayer
			begin
			select_actions = None
			if (<list_type> = player)
				if ($g_net_leader_player_num = <controlling_player>)
					select_actions = leadership_and_kick
				else
					select_actions = view
				endif
			elseif (<list_type> = matchmaking_done)
				select_actions = view
			endif
			if PlayerInfoEquals <player> is_local_client = 1
				if (<select_actions> = leadership_and_kick)
					select_actions = grant_leadership
				endif
				band_lobby_add_player_ui_to_popup player_index = <player> parent_id = <objID> controlling_player = <controlling_player> select_actions = <select_actions> list_type = <list_type>
			else
				if (<select_actions> = leadership_and_kick)
					select_actions = kick
				endif
				band_lobby_add_player_ui_to_popup player_index = <player> parent_id = <objID> controlling_player = <controlling_player> select_actions = <select_actions> list_type = <list_type>
			endif
			GetNextPlayer player = <player>
			repeat <num_players>
		endif
		current_num_players = <num_players>
		if (<return_focus> = 1)
			if (<selected_index> < <num_players>)
				LaunchEvent type = focus target = <objID> data = {child_index = <selected_index>}
			else
				LaunchEvent type = focus target = <objID> data = {child_index = 0}
			endif
		endif
		if (<add_helpers_on_refresh> = 0)
			add_helpers_on_refresh = 1
		else
			clean_up_user_control_helpers
			GetPlayerInfo <controlling_player> controller
			add_gamertag_helper exclusive_device = <controller>
			band_lobby_update_button_helpers Menu = playerslist controller = <controller>
		endif
		Change \{players_list_force_refresh = 0}
	endif
	wait \{1
		gameframe}
	repeat
endscript

script band_lobby_animate_searching 
	printf \{channel = Band_Lobby
		qs(0x5bd7cef2)}
	Obj_GetID
	<objID> :SE_SetProps pu_spinner_cont_alpha = 1.0
	if ($g_lobby_net_state = net_private)
		<objID> :SE_SetProps pu_spinner_text_text = ($band_lobby_strings.creating_session)
	else
		<objID> :SE_SetProps pu_spinner_text_text = ($band_lobby_strings.popup_search)
	endif
	if <objID> :Desc_ResolveAlias name = alias_instrument_spinner param = spinner_id
		<spinner_id> :Obj_SpawnScriptNow savegame_ui_icon_anim
	endif
endscript
