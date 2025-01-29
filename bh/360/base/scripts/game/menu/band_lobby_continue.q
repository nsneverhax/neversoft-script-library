
script band_lobby_are_all_local_players_plugged_in 
	GetNumPlayersInGame \{local
		out = x}
	if (<x> <= 0)
		return \{false
			offender = noplayers}
	endif
	GetFirstPlayer \{local}
	begin
	GetPlayerInfo <player> part
	GetPlayerInfo <player> controller
	if (<part> = vocals)
		if NOT Vocals_ControllerHasUsableHeadset controller = <controller>
			return \{false
				offender = mic}
		endif
	else
		if NOT IsControllerPluggedIn controller = <controller>
			return \{false
				offender = controller}
		endif
	endif
	GetNextPlayer player = <player> local
	repeat <x>
	return \{true}
endscript

script band_lobby_continue_check_mic_distribution 
	if ($allow_controller_for_all_instruments = 1)
		return \{true}
	endif
	distribution_valid = true
	GetNumPlayersInGame \{on_screen}
	GetFirstPlayer \{on_screen}
	NetSessionFunc \{Obj = plat_party
		func = get_num_party_players}
	num_local_guest_invalid = 0
	num_local_nonguest_invalid = 0
	num_nonlocal_invalid = 0
	num_plat_party_headset_invalid = 0
	invalid_mic_player = -1
	begin
	if PlayerInfoEquals <player> part = vocals
		if PlayerInfoEquals <player> lobby_mic_valid = 0
			distribution_valid = false
			if PlayerInfoEquals <player> is_local_client = 1
				invalid_mic_player = <player>
				GetPlayerInfo <player> controller
				band_lobby_get_is_guest device_num = <controller>
				if (<is_guest> = 1)
					num_local_guest_invalid = (<num_local_guest_invalid> + 1)
				else
					num_local_nonguest_invalid = (<num_local_nonguest_invalid> + 1)
				endif
				if PlayerInfoEquals <player> mic_type = headset
					if (<num_plat_party_players> > 0)
						num_plat_party_headset_invalid = (<num_plat_party_headset_invalid> + 1)
					endif
				endif
			else
				num_nonlocal_invalid = (<num_nonlocal_invalid> + 1)
			endif
		endif
	endif
	GetNextPlayer on_screen player = <player>
	repeat <num_players_shown>
	if (<distribution_valid> = false)
		if isXenon
			if (<num_local_guest_invalid> + <num_local_nonguest_invalid> > 0)
				if (<num_plat_party_headset_invalid> > 0)
					return \{false
						reason = plat_party_headset_invalid}
				endif
				vocals_get_num_mics
				num_mics_entry = zero_to_1_mics
				if (<num_mics> >= 2)
					num_mics_entry = two_or_more_mics
				endif
				acct_type_entry = guest_invalid
				if (<num_local_guest_invalid> + <num_local_nonguest_invalid> >= 2)
					acct_type_entry = multiple_invalid
				elseif (<num_local_nonguest_invalid> > 0)
					acct_type_entry = nonguest_invalid
				endif
				raw_message = ($band_lobby_mic_invalid_messages_xenon.<num_mics_entry>.<acct_type_entry>)
				FormatText TextName = message <raw_message> a = <invalid_mic_player>
				return false reason = mic_distribution_invalid message = <message>
			else
				return \{false
					reason = nonlocal_mic_distribution_invalid}
			endif
		else
			if (<num_local_guest_invalid> + <num_local_nonguest_invalid> > 0)
				return false reason = mic_distribution_invalid message = ($band_lobby_strings.popup_mic_distribution_invalid)
			else
				return \{false
					reason = nonlocal_mic_distribution_invalid}
			endif
		endif
	endif
	return \{true}
endscript

script band_lobby_check_continue_public_competitive 
	printf \{channel = Band_Lobby
		qs(0x0187f034)}
	return \{true}
endscript

script band_lobby_check_continue_private_competitive 
	printf \{channel = Band_Lobby
		qs(0xb0ce6574)}
	if band_lobby_is_matching_instruments
		if band_lobby_satisfy_min_players \{team = 0}
			return \{true}
		else
			band_lobby_flash_ticker_msg \{msg_checksum = more_players
				time = 30}
			return \{false}
		endif
	elseif band_lobby_is_even_number_of_instruments
		if band_lobby_satisfy_min_players \{team = 1}
			return \{true}
		else
			band_lobby_flash_ticker_msg \{msg_checksum = more_players_or_match
				time = 30}
			return \{false}
		endif
	else
		band_lobby_flash_ticker_msg \{msg_checksum = more_players_or_match_teams
			time = 30}
	endif
endscript

script band_lobby_remove_all_character_silhouettes 
	printf \{qs(0xfe4497a8)}
	printstruct <...>
	viewportindex = 0
	begin
	band_lobby_get_submenu_data viewport_index = <viewportindex> param = player
	GetPlayerInfo <submenu_data> chosen_character_id
	GetPlayerInfo <submenu_data> character_id
	printf qs(0x8a3bfe88) a = <submenu_data> b = <viewportindex> c = <chosen_character_id> d = <character_id>
	if (<chosen_character_id> = Silhouette)
		printf qs(0x33b08e77) a = <submenu_data> b = <viewportindex>
		net_stop_character_silhouette player = <submenu_data> submenu_index = <viewportindex>
	endif
	viewportindex = (<viewportindex> + 1)
	repeat ($g_num_lobby_local_submenus)
	printf \{qs(0x83d5ccfa)}
endscript

script bl_local_join_in_process 
	printf \{channel = Band_Lobby
		qs(0x8a9752b6)}
	i = 0
	begin
	band_lobby_get_submenu_data_new submenu_index = <i> param = Menu
	if (<Menu> = attempt_join)
		return \{true}
	endif
	i = (<i> + 1)
	repeat ($g_num_lobby_local_submenus)
	return \{false}
endscript

script bl_are_all_in_game_controllers_fully_joined 
	printf \{channel = Band_Lobby
		qs(0xb7520340)}
	if InInternetMode
		if NOT InNetGame
			GetActiveControllers
			GetArraySize <active_controllers>
			i = 0
			begin
			if NetSessionFunc func = IsControllerInGame params = {controller = <i>}
				if PlayerInfoEquals (<i> + 1) in_game = 1
					if PlayerInfoEquals (<i> + 1) is_local_client = 0
						return \{false}
					endif
				else
					return \{false}
				endif
			endif
			<i> = (<i> + 1)
			repeat <array_size>
		else
			return \{true}
		endif
	endif
	return \{true}
endscript

script bl_remote_join_in_process 
	printf \{channel = Band_Lobby
		qs(0xa79e3ce2)}
	if InInternetMode
		if NOT InNetGame
			NetSessionFunc \{Obj = party
				func = get_party_members}
			GetArraySize <connections> param = party_size
			party_index = 0
			num_remote_party_players = 0
			if (<party_size> > 0)
				begin
				if ((<connections> [<party_index>].is_local) = 0)
					num_remote_party_players = (<num_remote_party_players> + 1)
				endif
				party_index = (<party_index> + 1)
				repeat <party_size>
			endif
			GetNumPlayersInGame \{remote}
			if (<num_remote_party_players> != <num_players>)
				return \{true}
			endif
			if ScriptIsRunning \{band_lobby_add_party_member}
				return \{true}
			endif
		else
			return \{false}
		endif
	endif
	return \{false}
endscript

script band_lobby_continue_check 
	printf \{channel = Band_Lobby
		qs(0x7111d555)}
	RequireParams \{[
			player
			check_type
			submenu_index
		]
		all}
	if savegame_async_is_busy
		return \{false
			popup = 0}
	endif
	if ($g_leader_player_num != <player>)
		return \{false
			popup = 0}
	endif
	if ($g_net_leader_player_num != <player>)
		return \{false
			popup = 0}
	endif
	if NOT band_lobby_check_controllers
		return \{false
			popup = 1}
	endif
	if bl_local_join_in_process
		return \{false
			popup = 0}
	endif
	if NOT bl_are_all_in_game_controllers_fully_joined
		return \{false
			popup = 0}
	endif
	if bl_remote_join_in_process
		return \{false
			popup = 0}
	endif
	if ($Cheat_FreeDrum = 1)
		if ($g_lobby_state = career)
			band_lobby_flash_ticker_msg \{msg_checksum = freedrum_error_msg
				time = 5}
			return \{false
				popup = 0}
		endif
	endif
	band_lobby_kick_leader_out_of_band_manage
	GetPlayerInfo <player> controller
	if (<check_type> = fail)
		return \{false
			popup = 0}
	endif
	GetNumPlayersInGame
	if (<check_type> = net)
		if ($g_lobby_state = career)
			if (<num_players> = 4)
				if GotParam \{private}
					if (<private> = 0)
						band_lobby_flash_ticker_msg \{msg_checksum = game_full
							time = 3}
						return \{false
							popup = 0}
					endif
				else
					band_lobby_flash_ticker_msg \{msg_checksum = game_full
						time = 3}
					return \{false
						popup = 0}
				endif
			endif
		endif
		if NOT NetSessionFunc \{func = IsMultiplayerAllowed}
			band_lobby_change_focus_submenu_all \{focus_type = unfocus}
			ui_event_wait event = menu_change data = {is_popup state = UIstate_band_lobby_popup controller = <controller> reason = age_restricted}
			return \{false
				popup = 1}
		endif
		GetPlayerInfo <player> controller
		band_lobby_get_is_guest device_num = <controller>
		if (<is_guest> = 1)
			band_lobby_change_focus_submenu_all \{focus_type = unfocus}
			ui_event_wait event = menu_change data = {is_popup state = UIstate_band_lobby_popup controller = <controller> reason = guest_leader}
			return \{false
				popup = 1}
		endif
		if NOT InNetGame
			GetNumPlayersInGame \{remote}
			if (<num_players> > 0)
				GetFirstPlayer \{remote
					out = remote_player}
				begin
				if NOT PlayerInfoEquals <remote_player> async_io_status = ready
					band_lobby_change_focus_submenu_all \{focus_type = unfocus}
					ui_event_wait event = menu_change data = {is_popup state = UIstate_band_lobby_popup controller = <controller> reason = players_not_ready_io_host}
					SendStructure \{callback = band_lobby_flash_ticker_msg
						party
						channel = party
						data_to_send = {
							msg_checksum = players_not_ready_io_client
							time = 10
						}}
					return \{false
						popup = 1}
				endif
				GetNextPlayer player = <remote_player> remote out = remote_player
				repeat <num_players>
			endif
		endif
		band_lobby_update_ticker \{msg_checksum = update_net}
		if IsPS3
			if NOT NetSessionFunc \{func = is_lobby_available}
				band_lobby_update_ticker \{msg_checksum = current_state}
				band_lobby_change_focus_submenu_all \{focus_type = unfocus}
				ui_event_wait event = menu_change data = {is_popup state = UIstate_band_lobby_popup controller = <controller> reason = game_servers_unavailable}
				return \{false
					popup = 1}
			endif
			if ($DEMONWARE_IS_READY = 1)
				if ($DEMONWARE_STUN_FAILED = 1)
					band_lobby_update_ticker \{msg_checksum = current_state}
					band_lobby_change_focus_submenu_all \{focus_type = unfocus}
					ui_event_wait event = menu_change data = {is_popup state = UIstate_band_lobby_popup controller = <controller> reason = game_servers_unavailable}
					return \{false
						popup = 1}
				endif
			else
				band_lobby_change_focus_submenu_all \{focus_type = unfocus}
				ui_event_wait event = menu_change data = {is_popup state = UIstate_band_lobby_popup controller = <controller> reason = game_servers_unavailable}
				return \{false
					popup = 1}
			endif
		endif
		band_lobby_update_ticker \{msg_checksum = current_state}
	endif
	if (<check_type> != skip)
		if band_lobby_is_anyone_in_forced_flow
			band_lobby_change_focus_submenu_all \{focus_type = unfocus}
			ui_event_wait event = menu_change data = {is_popup state = UIstate_band_lobby_popup controller = <controller> reason = player_in_forced_flow}
			return \{false
				popup = 1}
		endif
		if NOT band_lobby_continue_check_mic_distribution
			band_lobby_change_focus_submenu_all \{focus_type = unfocus}
			ui_event_wait event = menu_change data = {is_popup state = UIstate_band_lobby_popup controller = <controller> reason = <reason> message = <message>}
			return \{false
				popup = 1}
		endif
		GetNumPlayersInGame
		if (<num_players> > 4)
			if (($g_lobby_state = quickplay) || ($g_lobby_state = career))
				band_lobby_change_focus_submenu_all \{focus_type = unfocus}
				ui_event_wait event = menu_change data = {is_popup state = UIstate_band_lobby_popup controller = <controller> reason = too_many_players_host}
				SendStructure \{callback = band_lobby_flash_ticker_msg
					party
					channel = party
					data_to_send = {
						msg_checksum = too_many_players_client
						time = 10
					}}
				return \{false
					popup = 1}
			endif
		endif
	endif
	return \{true}
endscript

script band_lobby_net_continue 
	RequireParams \{[
			player
			viewport_index
		]
		all}
	printf \{channel = Band_Lobby
		qs(0x97d37c06)}
	FormatText checksumname = submenu_data 'band_lobby_submenu_data_%d' d = <viewport_index>
	band_lobby_change_focus_submenu_all \{focus_type = unfocus}
	if IsPS3
		if NOT CheckForSignIn
			band_lobby_seamless_net_change {
				network = net_public
				player = <player>
				callback = band_lobby_net_continue
				callback_params = {
					player = <player>
					viewport_index = <viewport_index>
				}
			}
			return
		endif
	endif
	if band_lobby_continue_check check_type = net player = ($<submenu_data>.player) submenu_index = <viewport_index>
		if InInternetMode
			band_lobby_change_network player = <player> network = net_public focus = 0
			switch ($g_lobby_state)
				case career
				band_lobby_get_submenu_data_new submenu_index = <viewport_index> param = Menu
				if (<Menu> != career_search)
					if ($g_career_search = null)
						if NOT (($<submenu_data>.Menu) = career_search)
							band_lobby_change_menu action = forward Menu = career_search player = <player> viewport_index = <viewport_index> no_forced reset_characters
							band_lobby_change_focus_submenu_all \{focus_type = focus}
						endif
					else
						if band_lobby_cancel_matchmaking
							band_lobby_update_submenu_data submenu_index = <viewport_index> element = menu_indices value = [0 0 0]
							band_lobby_change_menu Menu = main action = forward player = <player> viewport_index = <viewport_index>
							band_lobby_change_focus_submenu_all \{focus_type = focus}
							band_lobby_update_button_helpers
						endif
					endif
				else
					band_lobby_change_focus_submenu_all \{focus_type = focus}
				endif
				case quickplay
				band_lobby_whole_band_autosave choose_script = band_lobby_continue_quickplay_save_callback <...>
				case vs
				if band_lobby_check_continue_public_competitive
					band_lobby_set_party_joinable \{joinable = 0}
					band_lobby_whole_band_autosave choose_script = band_lobby_continue_vs_save_callback <...>
				endif
				default
				ScriptAssert \{qs(0x7f08d1db)}
			endswitch
		else
			band_lobby_seamless_net_change {
				network = net_public
				player = <player>
				callback = band_lobby_net_continue
				callback_params = {
					player = <player>
					viewport_index = <viewport_index>
				}
			}
		endif
	else
		if (<popup> = 0)
			band_lobby_change_focus_submenu_all \{focus_type = focus}
		endif
	endif
endscript

script band_lobby_continue \{private = 0}
	RequireParams \{[
			player
			viewport_index
		]
		all}
	printf channel = Band_Lobby qs(0xb463c410) c = <viewport_index> d = <player>
	FormatText checksumname = submenu_data 'band_lobby_submenu_data_%d' d = <viewport_index>
	band_lobby_change_focus_submenu_all \{focus_type = unfocus}
	check_type = local
	if InInternetMode
		if ($g_career_search = null)
			if NOT band_lobby_are_remote_players_in_game
				band_lobby_change_network player = ($<submenu_data>.player) network = local focus = 0
			else
				band_lobby_change_network player = ($<submenu_data>.player) network = net_private focus = 0
				check_type = net
				private = 1
			endif
		else
			if ($g_career_search = host_only)
				check_type = skip
			else
				check_type = fail
			endif
		endif
	endif
	if band_lobby_continue_check check_type = <check_type> player = <player> submenu_index = <viewport_index> private = <private>
		if checksumequals a = ($g_lobby_state) b = vs
			if band_lobby_check_continue_private_competitive
				band_lobby_not_all_signed_in_check callback = band_lobby_really_continue callback_params = {<...>}
			else
				SoundEvent \{event = Band_Lobby_Negative_Select}
				band_lobby_change_focus_submenu_all \{focus_type = focus}
			endif
		else
			SoundEvent \{event = Band_Lobby_Complete}
			band_lobby_not_all_signed_in_check callback = band_lobby_really_continue callback_params = {<...>}
		endif
	else
		if (<popup> = 0)
			band_lobby_change_focus_submenu_all \{focus_type = focus}
		endif
	endif
endscript

script band_lobby_really_continue 
	switch ($g_lobby_state)
		case career
		if ($play_band_lobby_continue_sfx = 0)
			SoundEvent \{event = Band_Lobby_Complete}
		endif
		band_lobby_whole_band_mark_first_time_career
		if ($g_career_search = null)
			band_lobby_whole_band_autosave choose_script = band_lobby_continue_career_save_callback <...>
		elseif ($g_career_search = host_only)
			if NetSessionFunc \{Obj = match
					func = get_num_matchmaking_players}
				GetNumPlayersInGame
				total_players = <num_players>
				GetNumPlayersInGame \{local}
				if ((<total_players> = <num_matchmaking_players>) && (<num_players> = <num_matchmaking_players>))
					if band_lobby_cancel_matchmaking
						band_lobby_update_submenu_data submenu_index = <viewport_index> element = menu_indices value = [0 0 0]
						band_lobby_change_menu Menu = main action = forward player = <player> viewport_index = <viewport_index> focus = 1
						band_lobby_change_focus_submenu_all \{focus_type = focus}
						band_lobby_update_button_helpers
					endif
				else
					band_lobby_proceed_with_current_reservations
				endif
			endif
		endif
		case quickplay
		if ($play_band_lobby_continue_sfx = 0)
			SoundEvent \{event = Band_Lobby_Complete}
		endif
		band_lobby_whole_band_autosave choose_script = band_lobby_continue_quickplay_save_callback <...>
		case vs
		if band_lobby_check_continue_private_competitive
			if ($play_band_lobby_continue_sfx = 0)
				SoundEvent \{event = Band_Lobby_Complete}
			endif
			band_lobby_set_party_joinable \{joinable = 0}
			band_lobby_whole_band_autosave choose_script = band_lobby_continue_vs_save_callback <...>
		else
			SoundEvent \{event = Band_Lobby_Negative_Select}
			band_lobby_change_focus_submenu_all \{focus_type = focus}
		endif
		default
		ScriptAssert \{qs(0x25c1ea30)}
	endswitch
endscript

script band_lobby_not_all_signed_in_check \{callback_params = {
		}}
	RequireParams \{[
			callback
		]}
	printf \{qs(0x9c22dcea)}
	Change \{play_band_lobby_continue_sfx = 0}
	if NOT band_lobby_are_all_players_signed_in
		Change \{play_band_lobby_continue_sfx = 1}
		GH5_Band_Screen_UI_Sound \{continue}
		band_lobby_desc_id :Obj_KillSpawnedScript \{name = band_lobby_update_mics}
		GetPlayerInfo ($g_leader_player_num) controller
		create_dialog_box {
			heading_text = ($band_lobby_strings.popup_title_warning)
			body_text = ($band_lobby_strings.popup_unsigned_players)
			no_background
			player_device = <controller>
			back_button_script = band_lobby_not_all_signed_in_dialog_exit
			parent = band_lobby_desc_id
			options = [
				{
					func = band_lobby_not_all_signed_in_dialog_exit_with_callback
					func_params = {
						callback_params = <callback_params>
						callback = <callback>
					}
					text = ($band_lobby_strings.popup_option_ok)
				}
			]
		}
		AssignAlias id = <menu_id> alias = band_lobby_not_all_signed_confirm_menu
		LaunchEvent \{type = focus
			target = band_lobby_not_all_signed_confirm_menu}
	else
		Change \{play_band_lobby_continue_sfx = 0}
		<callback> <callback_params>
	endif
endscript

script band_lobby_not_all_signed_in_dialog_exit_with_callback 
	printf \{qs(0xb42117b2)}
	band_lobby_not_all_signed_in_dialog_exit
	<callback> <callback_params>
endscript

script band_lobby_not_all_signed_in_dialog_exit 
	printf \{qs(0x3a6cb459)}
	if ScreenElementExists \{id = band_lobby_not_all_signed_confirm_menu}
		destroy_dialog_box
	endif
	band_lobby_update_button_helpers
	band_lobby_change_focus_submenu_all \{focus_type = focus}
endscript

script band_lobby_find_more_players \{private = 0}
	RequireParams \{[
			player
			viewport_index
			server_list_mode
		]
		all}
	printf \{channel = Band_Lobby
		qs(0xa2155c0f)}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if InInternetMode
		if InNetGame
			band_lobby_change_menu action = back Menu = main player = <player> viewport_index = <viewport_index>
			return
		endif
		if band_lobby_continue_check check_type = net player = <player> submenu_index = <viewport_index> private = <private>
			if (<server_list_mode> = quickmatch)
				if band_lobby_are_remote_players_in_game
					SoundEvent \{event = UI_SFX_Negative_Select}
					band_lobby_change_focus_submenu_all \{focus_type = focus}
					band_lobby_flash_ticker_msg \{msg_checksum = career_join_w_invite
						time = 5}
					return
				endif
			endif
			if ((<server_list_mode> = host_only) || (<server_list_mode> = quickmatch))
				Change g_career_search = <server_list_mode>
				band_lobby_update_button_helpers
				GameMode_UpdateNumPlayers \{num_players = 4}
				GameMode_UpdateCooperative \{cooperative = 1}
			endif
			band_lobby_prepare_for_matchmaking player = <player> private = <private>
			if (<private> = 1)
				band_lobby_flash_ticker_msg \{msg_checksum = creating_session
					time = 5}
			else
				band_lobby_update_submenu_data submenu_index = <viewport_index> element = menu_indices value = [0 0 0]
				band_lobby_change_menu action = back Menu = main player = <player> viewport_index = <viewport_index>
			endif
			band_lobby_start_public_matchmaking player = <player> server_list_mode = <server_list_mode> private = <private>
		else
			if (<popup> = 0)
				band_lobby_change_focus_submenu_all \{focus_type = focus}
			endif
		endif
	else
		band_lobby_seamless_net_change {
			network = net_public
			player = <player>
			callback = band_lobby_find_more_players
			callback_params = {
				player = <player>
				viewport_index = <viewport_index>
				server_list_mode = <server_list_mode>
				private = <private>
			}
		}
	endif
endscript

script band_lobby_continue_career_save_callback 
	printf \{channel = Band_Lobby
		qs(0xc9d64c1c)}
	i = 0
	begin
	band_lobby_get_submenu_data_new submenu_index = <i> param = Menu
	if (<Menu> = mc_saving)
		band_lobby_get_submenu_data_new submenu_index = <i> param = player
		band_lobby_update_submenu_data submenu_index = <i> element = menu_indices value = [0 0 0]
		band_lobby_change_menu action = back Menu = main player = <player> viewport_index = <i> focus = 0 no_forced
	endif
	i = (<i> + 1)
	repeat ($g_num_lobby_local_submenus)
	band_lobby_wait_for_menu_update_all
	if ($g_connection_loss_dialogue = 1)
		return
	endif
	band_lobby_continue_career player = <player> viewport_index = <viewport_index>
endscript

script band_lobby_continue_career 
	printf \{channel = Band_Lobby
		qs(0xc595a1be)}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if NOT (GMan_GoalIsActive goal = career)
		GetNumPlayersInGame
		GameMode_UpdateNumPlayers num_players = <num_players>
		if (<num_players> = 1)
			GameMode_UpdateCooperative \{cooperative = 0}
		else
			GameMode_UpdateCooperative \{cooperative = 1}
		endif
		if (<num_players> > 0)
			Band = 1
			GetFirstPlayer \{out = index}
			begin
			SetPlayerInfo <index> Band = <Band>
			GetNextPlayer player = <index> out = index
			repeat <num_players>
		endif
		if InInternetMode
			if band_lobby_are_remote_players_in_game
				if InNetGame
					if IsHost
						SendStructure \{callback = band_lobby_continue_career
							data_to_send = {
							}}
					endif
				else
					band_lobby_change_focus_submenu_all \{focus_type = unfocus}
					band_lobby_change_network player = <player> network = net_private focus = 0
					band_lobby_find_more_players player = <player> viewport_index = <viewport_index> server_list_mode = host_only private = 1
					return
				endif
			else
				band_lobby_change_network player = <player> focus = 0 network = local
			endif
		endif
		quick_start_goal \{goal_struct = career_info
			goal_name = career}
		begin
		if NOT savegame_async_is_busy
			break
		endif
		wait \{1
			gameframe}
		repeat
		band_lobby_continue_menu_change \{state = UIstate_career_venue_select}
	endif
endscript

script band_lobby_continue_quickplay_save_callback 
	printf \{channel = Band_Lobby
		qs(0xecf15cba)}
	i = 0
	begin
	band_lobby_get_submenu_data_new submenu_index = <i> param = Menu
	if (<Menu> = mc_saving)
		band_lobby_get_submenu_data_new submenu_index = <i> param = player
		band_lobby_update_submenu_data submenu_index = <i> element = menu_indices value = [0 0 0]
		band_lobby_change_menu action = back Menu = main player = <player> viewport_index = <i> focus = 0 no_forced
	endif
	i = (<i> + 1)
	repeat ($g_num_lobby_local_submenus)
	band_lobby_get_player_submenu_index player_num = ($g_leader_player_num)
	band_lobby_wait_for_menu_update submenu_index = <submenu_index>
	if ($g_connection_loss_dialogue = 1)
		return
	endif
	band_lobby_continue_quickplay player = <player> viewport_index = <viewport_index>
endscript

script band_lobby_continue_quickplay 
	RequireParams \{[
			player
			viewport_index
		]
		all}
	printf channel = Band_Lobby qs(0x1bfcb704) c = <viewport_index> d = <player>
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	FormatText checksumname = submenu_data 'band_lobby_submenu_data_%d' d = <viewport_index>
	GetNumPlayersInGame
	if (<num_players> > 0)
		Band = 1
		GetFirstPlayer \{out = index}
		begin
		SetPlayerInfo <index> Band = <Band>
		GetNextPlayer player = <index> out = index
		repeat <num_players>
	endif
	if (<num_players> > 0)
		FormatText checksumname = my_game_mode 'p%i_quickplay' i = <num_players>
		Change game_mode = <my_game_mode>
		if InInternetMode
			private = 0
			if ($g_lobby_net_state = net_private)
				private = 1
			endif
			band_lobby_prepare_for_matchmaking player = ($<submenu_data>.player) private = <private>
			band_lobby_start_public_matchmaking player = ($<submenu_data>.player) private = <private>
		else
			band_lobby_continue_menu_change \{state = uistate_songlist}
		endif
	else
		ScriptAssert \{qs(0x61815ab7)}
	endif
endscript

script band_lobby_continue_vs_save_callback 
	printf \{channel = Band_Lobby
		qs(0xcba7243b)}
	pre_player = <player>
	i = 0
	begin
	band_lobby_get_submenu_data_new submenu_index = <i> param = Menu
	if (<Menu> = mc_saving)
		band_lobby_get_submenu_data_new submenu_index = <i> param = player
		band_lobby_update_submenu_data submenu_index = <i> element = menu_indices value = [0 0 0]
		band_lobby_change_menu action = back Menu = main player = <player> viewport_index = <i> focus = 0 no_forced
	endif
	i = (<i> + 1)
	repeat ($g_num_lobby_local_submenus)
	band_lobby_get_player_submenu_index player_num = ($g_leader_player_num)
	band_lobby_wait_for_menu_update submenu_index = <submenu_index>
	band_lobby_set_party_joinable \{joinable = 0}
	if ($g_connection_loss_dialogue = 1)
		return
	endif
	band_lobby_game_rules player = <pre_player>
endscript

script band_lobby_continue_vs 
	RequireParams \{[
			player
		]
		all}
	printf channel = Band_Lobby qs(0xa41989a5) d = <player>
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	GetNumPlayersInGame
	if InInternetMode
		private = 0
		if ($g_lobby_net_state = net_private)
			GameMode_UpdateNumPlayers num_players = <num_players>
			private = 1
		endif
		band_lobby_prepare_for_matchmaking player = <player> private = <private>
		band_lobby_start_public_matchmaking private = <private> player = <player>
	else
		GameMode_UpdateNumPlayers num_players = <num_players>
		if GameMode_IsTeamGame
			band_lobby_continue_menu_change \{state = UIstate_team_select}
		else
			Band = 1
			GetFirstPlayer
			begin
			SetPlayerInfo <player> Band = <Band>
			GetNextPlayer player = <player>
			<Band> = (<Band> + 1)
			repeat <num_players>
			band_lobby_continue_menu_change \{state = uistate_songlist}
		endif
	endif
endscript

script band_lobby_continue_menu_change 
	RequireParams \{[
			state
		]
		all}
	printf \{channel = Band_Lobby
		qs(0x70ec5ffc)}
	GetPlayerInfo ($g_leader_player_num) controller
	change_primary_controller controller = <controller>
	ui_event_get_top
	if GotParam \{is_popup}
		ui_event event = menu_replace data = {state = <state>}
	else
		ui_event event = menu_change data = {state = <state>}
	endif
endscript

script band_lobby_proceed_with_current_reservations 
	printf \{channel = Band_Lobby
		qs(0x622d7931)}
	NetSessionFunc \{Obj = match
		func = force_completion}
	GameMode_GetType
	if (<type> = career)
		Change \{g_career_search = null}
		band_lobby_change_focus_submenu_all \{focus_type = unfocus}
	endif
endscript

script band_lobby_check_controllers 
	printf \{channel = Band_Lobby
		qs(0xe529fba7)}
	GetNumPlayersInGame \{local}
	GetFirstPlayer \{local}
	begin
	if NOT band_lobby_check_single_controller player = <player>
		band_lobby_change_focus_submenu_all \{focus_type = unfocus}
		ui_event event = menu_change state = UIstate_controller_disconnect data = {device_num = <controller> is_popup}
		return \{false}
	endif
	GetNextPlayer local player = <player>
	repeat <num_players>
	return \{true}
endscript

script band_lobby_check_single_controller 
	RequireParams \{[
			player
		]
		all}
	GetPlayerInfo <player> part
	GetPlayerInfo <player> controller
	GetControllerType controller = <controller>
	if NOT IsControllerPluggedIn controller = <controller>
		return \{false}
	elseif NOT ($allow_controller_for_all_instruments = 1)
		switch <part>
			case guitar
			case bass
			if (<controller_type> != guitar)
				return \{false}
			endif
			case Drum
			if (<controller_type> != Drum)
				return \{false}
			endif
			case vocals
			if (<controller_type> != controller && <controller_type> != vocals)
				return \{false}
			endif
		endswitch
	endif
	return \{true}
endscript
