
script band_lobby_continue_check_mic_distribution 
	if ($allow_controller_for_all_instruments = 1)
		return \{true}
	endif
	distribution_valid = true
	getnumplayersingame \{on_screen}
	getfirstplayer \{on_screen}
	NetSessionFunc \{Obj = plat_party
		func = get_num_party_players}
	num_local_guest_invalid = 0
	num_local_nonguest_invalid = 0
	num_nonlocal_invalid = 0
	num_plat_party_headset_invalid = 0
	invalid_mic_player = -1
	begin
	if playerinfoequals <Player> part = vocals
		if playerinfoequals <Player> lobby_mic_valid = 0
			distribution_valid = FALSE
			if playerinfoequals <Player> is_local_client = 1
				invalid_mic_player = <Player>
				getplayerinfo <Player> controller
				band_lobby_get_is_guest device_num = <controller>
				if (<is_guest> = 1)
					num_local_guest_invalid = (<num_local_guest_invalid> + 1)
				else
					num_local_nonguest_invalid = (<num_local_nonguest_invalid> + 1)
				endif
				if playerinfoequals <Player> mic_type = headset
					if (<num_plat_party_players> > 0)
						num_plat_party_headset_invalid = (<num_plat_party_headset_invalid> + 1)
					endif
				endif
			else
				num_nonlocal_invalid = (<num_nonlocal_invalid> + 1)
			endif
		endif
	endif
	getnextplayer on_screen Player = <Player>
	repeat <num_players_shown>
	if (<distribution_valid> = FALSE)
		if isXenon
			if (<num_local_guest_invalid> + <num_local_nonguest_invalid> > 0)
				if (<num_plat_party_headset_invalid> > 0)
					return \{FALSE
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
				ui_sfx \{menustate = Generic
					uitype = warningmessage}
				raw_message = ($band_lobby_mic_invalid_messages_xenon.<num_mics_entry>.<acct_type_entry>)
				formatText TextName = message <raw_message> a = <invalid_mic_player>
				getplayerinfo <invalid_mic_player> controller
				return FALSE reason = mic_distribution_invalid message = <message> mic_controller = <controller>
			else
				return \{FALSE
					reason = nonlocal_mic_distribution_invalid}
			endif
		else
			if (<num_local_guest_invalid> + <num_local_nonguest_invalid> > 0)
				return FALSE reason = mic_distribution_invalid message = ($band_lobby_strings.popup_mic_distribution_invalid)
			else
				if NetSessionFunc \{Obj = party
						func = is_host}
					NetSessionFunc \{Obj = party
						func = send_all_check_mics}
				endif
				return \{FALSE
					reason = nonlocal_mic_distribution_invalid}
			endif
		endif
	endif
	return \{true}
endscript

script band_lobby_check_continue_public_competitive 
	printf \{channel = band_lobby
		qs(0x0187f034)}
	return \{true}
endscript

script band_lobby_check_continue_private_competitive 
	printf \{channel = band_lobby
		qs(0xb0ce6574)}
	if band_lobby_is_matching_instruments
		if band_lobby_satisfy_min_players \{team = 0}
			return \{true}
		else
			band_lobby_update_ticker \{msg_checksum = more_players
				msg_count = 3}
			return \{FALSE}
		endif
	elseif band_lobby_is_even_number_of_instruments
		if band_lobby_satisfy_min_players \{team = 1}
			return \{true}
		else
			band_lobby_update_ticker \{msg_checksum = more_players_or_match
				msg_count = 3}
			return \{FALSE}
		endif
	else
		band_lobby_update_ticker \{msg_checksum = more_players_or_match
			msg_count = 3}
	endif
endscript

script bl_local_join_in_process 
	printf \{channel = band_lobby
		qs(0x8a9752b6)}
	i = 0
	begin
	band_lobby_get_submenu_data submenu_index = <i> param = menu
	if (<menu> = attempt_join)
		return \{true}
	endif
	i = (<i> + 1)
	repeat ($g_num_lobby_local_submenus)
	return \{FALSE}
endscript

script bl_are_all_in_game_controllers_fully_joined 
	printf \{channel = band_lobby
		qs(0xb7520340)}
	if ininternetmode
		if NOT InNetGame
			GetActiveControllers
			GetArraySize <active_controllers>
			i = 0
			begin
			if NetSessionFunc func = iscontrolleringame params = {controller = <i>}
				if playerinfoequals (<i> + 1) in_game = 1
					if playerinfoequals (<i> + 1) is_local_client = 0
						return \{FALSE}
					endif
				else
					return \{FALSE}
				endif
			endif
			<i> = (<i> + 1)
			repeat <array_Size>
		else
			return \{true}
		endif
	endif
	return \{true}
endscript

script bl_remote_join_in_process 
	printf \{channel = band_lobby
		qs(0xa79e3ce2)}
	if ininternetmode
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
			getnumplayersingame \{remote}
			if (<num_remote_party_players> != <num_players>)
				return \{true}
			endif
			if ScriptIsRunning \{band_lobby_add_party_member}
				return \{true}
			endif
		else
			return \{FALSE}
		endif
	endif
	return \{FALSE}
endscript

script band_lobby_continue_check 
	printf \{channel = band_lobby
		qs(0x7111d555)}
	RequireParams \{[
			Player
			check_type
			submenu_index
		]
		all}
	if savegame_async_is_busy
		return \{FALSE
			popup = 0}
	endif
	if ($g_leader_player_num != <Player>)
		return \{FALSE
			popup = 0}
	endif
	if ($g_net_leader_player_num != <Player>)
		return \{FALSE
			popup = 0}
	endif
	if NOT band_lobby_check_controllers
		return \{FALSE
			popup = 1}
	endif
	if bl_local_join_in_process
		return \{FALSE
			popup = 0}
	endif
	if NOT bl_are_all_in_game_controllers_fully_joined
		return \{FALSE
			popup = 0}
	endif
	if bl_remote_join_in_process
		return \{FALSE
			popup = 0}
	endif
	if ($cheat_freedrum = 1)
		if ($g_lobby_state = career)
			band_lobby_flash_ticker_msg \{msg_checksum = freedrum_error_msg
				time = 5}
			return \{FALSE
				popup = 0}
		endif
	endif
	band_lobby_kick_leader_out_of_band_manage
	getplayerinfo <Player> controller
	if (<check_type> = fail)
		return \{FALSE
			popup = 0}
	endif
	getnumplayersingame
	if (<check_type> = net)
		if (career = $g_lobby_state || quickplay = $g_lobby_state)
			if (<num_players> = 4)
				if GotParam \{private}
					if (0 = <private>)
						band_lobby_flash_ticker_msg \{msg_checksum = game_full
							time = 3}
						return \{FALSE
							popup = 0}
					endif
				else
					band_lobby_flash_ticker_msg \{msg_checksum = game_full
						time = 3}
					return \{FALSE
						popup = 0}
				endif
			endif
		endif
		if NOT NetSessionFunc \{func = ismultiplayerallowed}
			band_lobby_change_focus_submenu_all \{focus_type = unfocus}
			ui_event_wait event = menu_change data = {is_popup state = uistate_band_lobby_popup controller = <controller> reason = age_restricted}
			return \{FALSE
				popup = 1}
		endif
		getplayerinfo <Player> controller
		band_lobby_get_is_guest device_num = <controller>
		if (<is_guest> = 1)
			band_lobby_change_focus_submenu_all \{focus_type = unfocus}
			ui_event_wait event = menu_change data = {is_popup state = uistate_band_lobby_popup controller = <controller> reason = guest_leader}
			return \{FALSE
				popup = 1}
		endif
		if NOT InNetGame
			getnumplayersingame \{remote}
			if (<num_players> > 0)
				getfirstplayer \{remote
					out = remote_player}
				begin
				if NOT playerinfoequals <remote_player> async_io_status = ready
					SpawnScriptNow \{host_full_sync_and_wait_hack}
					band_lobby_change_focus_submenu_all \{focus_type = unfocus}
					ui_event_wait event = menu_change data = {is_popup state = uistate_band_lobby_popup controller = <controller> reason = players_not_ready_io_host}
					SendStructure \{callback = band_lobby_flash_ticker_msg
						party
						channel = party
						data_to_send = {
							msg_checksum = players_not_ready_io_client
							time = 10
						}}
					return \{FALSE
						popup = 1}
				endif
				getnextplayer Player = <remote_player> remote out = remote_player
				repeat <num_players>
			endif
		endif
		band_lobby_update_ticker \{msg_checksum = update_net}
		if ((isps3) || (isngc))
			NetSessionFunc \{func = can_view_user_content
				params = {
					set_explicit_error_code
				}}
			if netstatus_checkforerrors \{context = Misc}
				show_last_connection_error \{unfocus_script = band_lobby_change_focus_submenu_all
					unfocus_params = {
						focus_type = unfocus
					}
					continue_script = band_lobby_return_from_error
					context = Misc}
				band_lobby_update_ticker \{msg_checksum = current_state}
				return \{FALSE
					popup = 1}
			endif
			if NOT NetSessionFunc \{func = is_lobby_available}
				band_lobby_update_ticker \{msg_checksum = current_state}
				show_last_connection_error \{unfocus_script = band_lobby_change_focus_submenu_all
					unfocus_params = {
						focus_type = unfocus
					}
					continue_script = band_lobby_return_from_error
					context = default_lobby}
				return \{FALSE
					popup = 1}
			endif
			if ($DEMONWARE_IS_READY = 1)
			else
				show_last_connection_error \{unfocus_script = band_lobby_change_focus_submenu_all
					unfocus_params = {
						focus_type = unfocus
					}
					continue_script = band_lobby_return_from_error
					context = default_lobby}
				if isngc
					band_lobby_update_ticker \{msg_checksum = current_state}
				else
					band_lobby_change_focus_submenu_all \{focus_type = unfocus}
					ui_event_wait event = menu_change data = {is_popup state = uistate_band_lobby_popup controller = <controller> reason = game_servers_unavailable}
				endif
				return \{FALSE
					popup = 1}
			endif
		endif
		band_lobby_update_ticker \{msg_checksum = current_state}
	endif
	if (<check_type> != skip)
		if band_lobby_is_anyone_in_forced_flow
			band_lobby_change_focus_submenu_all \{focus_type = unfocus}
			ui_event_wait event = menu_change data = {is_popup state = uistate_band_lobby_popup controller = <controller> reason = player_in_forced_flow}
			return \{FALSE
				popup = 1}
		endif
		if NOT band_lobby_continue_check_mic_distribution
			band_lobby_change_focus_submenu_all \{focus_type = unfocus}
			ui_event_wait event = menu_change data = {is_popup state = uistate_band_lobby_popup controller = <controller> reason = <reason> message = <message>}
			return \{FALSE
				popup = 1}
		endif
		if inroadiebattlemode
			if NOT roadie_battle_lobby_continue_check
				if (<reason> = roadie_battle_connection_problems)
					roadie_battle_goto_ds_disconnect_screen
				else
					ui_event_wait event = menu_change data = {is_popup state = uistate_band_lobby_popup controller = <controller> reason = <reason>}
				endif
				return \{FALSE
					popup = 1}
			endif
		endif
		getnumplayersingame
		if (<num_players> > 4)
			if (($g_lobby_state = quickplay) || ($g_lobby_state = career))
				band_lobby_change_focus_submenu_all \{focus_type = unfocus}
				ui_event_wait event = menu_change data = {is_popup state = uistate_band_lobby_popup controller = <controller> reason = too_many_players_host}
				SendStructure \{callback = band_lobby_flash_ticker_msg
					party
					channel = party
					data_to_send = {
						msg_checksum = too_many_players_client
						time = 10
					}}
				return \{FALSE
					popup = 1}
			endif
		endif
	endif
	return \{true}
endscript

script band_lobby_net_continue 
	RequireParams \{[
			Player
			submenu_index
		]
		all}
	printf \{channel = band_lobby
		qs(0x97d37c06)}
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <submenu_index>
	band_lobby_change_focus_submenu_all \{focus_type = unfocus}
	if isps3
		if NOT CheckForSignIn
			band_lobby_seamless_net_change {
				network = net_public
				Player = <Player>
				callback = band_lobby_net_continue
				callback_params = {
					Player = <Player>
					submenu_index = <submenu_index>
				}
			}
			return
		endif
	endif
	if band_lobby_continue_check check_type = net Player = ($<submenu_data>.Player) submenu_index = <submenu_index>
		if ininternetmode
			band_lobby_change_network Player = <Player> network = net_public focus = 0
			switch ($g_lobby_state)
				case career
				band_lobby_get_submenu_data submenu_index = <submenu_index> param = menu
				if (<menu> != career_search)
					if ($g_career_search = NULL)
						if NOT (($<submenu_data>.menu) = career_search)
							band_lobby_change_menu action = forward menu = career_search Player = <Player> submenu_index = <submenu_index> no_forced reset_characters
							band_lobby_change_focus_submenu_all \{focus_type = focus}
						endif
					else
						if band_lobby_cancel_matchmaking
							band_lobby_update_submenu_data submenu_index = <submenu_index> element = menu_indices value = [0 0 0]
							band_lobby_change_menu menu = main action = forward Player = <Player> submenu_index = <submenu_index>
							band_lobby_change_focus_submenu_all \{focus_type = focus}
							band_lobby_update_button_helpers
						endif
					endif
				else
					band_lobby_change_focus_submenu_all \{focus_type = focus}
				endif
				case quickplay
				band_lobby_whole_band_autosave choose_script = band_lobby_continue_quickplay_save_callback <...> scan_dlc_if_online
				case vs
				if band_lobby_check_continue_public_competitive
					band_lobby_set_party_joinable \{joinable = 0}
					band_lobby_whole_band_autosave choose_script = band_lobby_continue_vs_save_callback <...> scan_dlc_if_online
				endif
				default
				ScriptAssert \{qs(0x7f08d1db)}
			endswitch
		else
			band_lobby_seamless_net_change {
				network = net_public
				Player = <Player>
				callback = band_lobby_net_continue
				callback_params = {
					Player = <Player>
					submenu_index = <submenu_index>
				}
			}
		endif
	else
		if (<popup> = 0)
			band_lobby_change_focus_submenu_all \{focus_type = focus}
		endif
	endif
endscript

script band_lobby_continue \{Player = !i1768515945
		submenu_index = !i1768515945
		private = 0}
	printf channel = band_lobby qs(0x1c9eef19) c = <submenu_index> d = <Player>
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <submenu_index>
	band_lobby_change_focus_submenu_all \{focus_type = unfocus}
	check_type = local
	if ininternetmode
		if ($g_career_search = NULL)
			if NOT band_lobby_are_remote_players_in_game
				band_lobby_change_network Player = ($<submenu_data>.Player) network = local focus = 0
			else
				band_lobby_change_network Player = ($<submenu_data>.Player) network = net_private focus = 0
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
	if band_lobby_continue_check check_type = <check_type> Player = <Player> submenu_index = <submenu_index> private = <private>
		if checksumequals a = ($g_lobby_state) b = vs
			if band_lobby_check_continue_private_competitive
				band_lobby_not_all_signed_in_check callback = band_lobby_really_continue callback_params = {<...>}
			else
				if inroadiebattlemode
					if ($roadie_battle_band_lobby_popup_pending_via_ticker = true)
						return
					endif
				endif
				stopsound \{lobbyselecta}
				SoundEvent \{event = audio_ui_band_lobby_negative_select}
				band_lobby_change_focus_submenu_all \{focus_type = focus}
			endif
		else
			band_lobby_not_all_signed_in_check callback = band_lobby_really_continue callback_params = {<...>}
		endif
	else
		if inroadiebattlemode
			if ($roadie_battle_band_lobby_popup_pending_via_ticker = true)
				return
			endif
		endif
		if (<popup> = 0)
			band_lobby_change_focus_submenu_all \{focus_type = focus}
		endif
	endif
endscript

script band_lobby_really_continue 
	switch ($g_lobby_state)
		case career
		SoundEvent \{event = audio_ui_band_lobby_complete}
		if ($g_career_search = NULL)
			band_lobby_whole_band_autosave choose_script = band_lobby_continue_career <...> scan_dlc_if_online
		elseif ($g_career_search = host_only)
			if NetSessionFunc \{Obj = match
					func = get_num_matchmaking_players}
				getnumplayersingame
				total_players = <num_players>
				getnumplayersingame \{local}
				if ((<total_players> = <num_matchmaking_players>) && (<num_players> = <num_matchmaking_players>))
					if band_lobby_cancel_matchmaking
						band_lobby_update_submenu_data submenu_index = <submenu_index> element = menu_indices value = [0 0 0]
						band_lobby_change_menu menu = main action = forward Player = <Player> submenu_index = <submenu_index> focus = 1
						band_lobby_change_focus_submenu_all \{focus_type = focus}
						band_lobby_update_button_helpers
					endif
				else
					band_lobby_proceed_with_current_reservations
				endif
			endif
		endif
		case quickplay
		SoundEvent \{event = audio_ui_band_lobby_complete}
		band_lobby_whole_band_autosave choose_script = band_lobby_continue_quickplay_save_callback <...> scan_dlc_if_online
		case vs
		if band_lobby_check_continue_private_competitive
			SoundEvent \{event = audio_ui_band_lobby_complete}
			band_lobby_set_party_joinable \{joinable = 0}
			band_lobby_whole_band_autosave choose_script = band_lobby_continue_vs_save_callback <...> scan_dlc_if_online
		else
			SoundEvent \{event = audio_ui_band_lobby_negative_select}
			band_lobby_change_focus_submenu_all \{focus_type = focus}
		endif
		default
		ScriptAssert \{qs(0x25c1ea30)}
	endswitch
	if inroadiebattlemode
		roadie_battle_lobby_continue
	endif
	if safetolockcontrollers
		lock_all_controllers
	endif
endscript

script band_lobby_not_all_signed_in_check \{callback_params = {
		}}
	RequireParams \{[
			callback
		]}
	printf \{qs(0x9c22dcea)}
	<ret> = FALSE
	if NOT band_lobby_are_all_players_signed_in
		ui_sfx \{menustate = Generic
			uitype = warningmessage}
		band_lobby_desc_id :Obj_KillSpawnedScript \{Name = band_lobby_update_mics}
		getplayerinfo ($g_leader_player_num) controller
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
		LaunchEvent \{Type = focus
			target = band_lobby_not_all_signed_confirm_menu}
		<ret> = FALSE
	else
		<callback> <callback_params>
		<ret> = true
	endif
	return <ret>
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
			Player
			submenu_index
			server_list_mode
		]
		all}
	printf \{channel = band_lobby
		qs(0xa2155c0f)}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if ininternetmode
		if InNetGame
			band_lobby_change_menu action = back menu = main Player = <Player> submenu_index = <submenu_index>
			return
		endif
		if band_lobby_continue_check check_type = net Player = <Player> submenu_index = <submenu_index> private = <private>
			if (<server_list_mode> = quickmatch)
				if band_lobby_are_remote_players_in_game
					ui_sfx \{menustate = bandlobby
						uitype = negativeselect}
					band_lobby_change_focus_submenu_all \{focus_type = focus}
					band_lobby_flash_ticker_msg \{msg_checksum = career_join_w_invite
						time = 5}
					return
				endif
			endif
			if ((<server_list_mode> = host_only) || (<server_list_mode> = quickmatch))
				Change g_career_search = <server_list_mode>
				band_lobby_update_button_helpers
			endif
			band_lobby_prepare_for_matchmaking Player = <Player> private = <private>
			if (<private> = 1)
				band_lobby_flash_ticker_msg \{msg_checksum = creating_session
					time = 5}
			else
				band_lobby_update_submenu_data submenu_index = <submenu_index> element = menu_indices value = [0 0 0]
				band_lobby_change_menu action = back menu = main Player = <Player> submenu_index = <submenu_index>
			endif
			band_lobby_start_public_matchmaking Player = <Player> server_list_mode = <server_list_mode> private = <private>
		else
			if (<popup> = 0)
				band_lobby_change_focus_submenu_all \{focus_type = focus}
			endif
		endif
	else
		band_lobby_seamless_net_change {
			network = net_public
			Player = <Player>
			callback = band_lobby_find_more_players
			callback_params = {
				Player = <Player>
				submenu_index = <submenu_index>
				server_list_mode = <server_list_mode>
				private = <private>
			}
		}
	endif
endscript

script band_lobby_continue_career 
	printf \{channel = band_lobby
		qs(0xc595a1be)}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	getnumplayersingame
	if (<num_players> > 0)
		Band = 1
		<solo_highway_enabled> = 0
		getfirstplayer \{out = index}
		begin
		setplayerinfo <index> Band = <Band>
		if InNetGame
			if playerinfoequals <index> is_local_client = 0
				if (<solo_highway_enabled> = 1)
					setplayerinfo <index> is_onscreen = 0
				else
					setplayerinfo <index> is_onscreen = 1
				endif
			elseif playerinfoequals <index> is_local_client = 1
				if playerinfoequals <index> solo_highway_mode = 1
					<solo_highway_enabled> = 1
				endif
			endif
		endif
		getnextplayer Player = <index> out = index
		repeat <num_players>
	endif
	if ininternetmode
		if band_lobby_are_remote_players_in_game
			if InNetGame
				if IsHost
					getplayerinfo ($g_leader_player_num) controller
					get_savegame_from_controller controller = <controller>
					net_career_build_host_progression
					SendStructure callback = band_lobby_continue_career data_to_send = {host_career_struct = ($g_net_career_progression)}
				else
					Change g_net_career_progression = <host_career_struct>
				endif
				spawnscript \{net_career_flip_save_warning_flag}
			else
				band_lobby_change_focus_submenu_all \{focus_type = unfocus}
				band_lobby_change_network Player = <Player> network = net_private focus = 0
				band_lobby_find_more_players Player = <Player> submenu_index = <submenu_index> server_list_mode = host_only private = 1
				return
			endif
		else
			band_lobby_change_network Player = <Player> focus = 0 network = local
		endif
	endif
	get_savegame_from_controller controller = ($primary_controller)
	Change \{g_net_career_ignore_unlock_atoms = 1}
	reset_progression_atoms savegame = <savegame> async = 1 force_update = 1
	Change \{g_net_career_ignore_unlock_atoms = 0}
	begin
	if NOT savegame_async_is_busy
		break
	endif
	Wait \{1
		gameframe}
	repeat
	getplayerinfo ($g_leader_player_num) controller
	if NOT has_completed_forced_career_flow device_num = <controller>
		if isps3
			hide_glitch \{num_frames = 20}
		endif
		band_lobby_continue_menu_change new_state = uistate_career_movie data = {movie = 'career_intro' Stream = 'career_intro' new_state = uistate_quest_map device_num = <controller> new_data = {device_num = <controller>}}
	else
		band_lobby_continue_menu_change \{new_state = uistate_quest_map}
	endif
	band_lobby_whole_band_mark_first_time_career
endscript

script band_lobby_continue_quickplay_save_callback 
	printf \{channel = band_lobby
		qs(0xecf15cba)}
	i = 0
	begin
	band_lobby_get_submenu_data submenu_index = <i> param = menu
	if (<menu> = mc_saving)
		band_lobby_get_submenu_data submenu_index = <i> param = Player
		band_lobby_update_submenu_data submenu_index = <i> element = menu_indices value = [0 0 0]
		band_lobby_change_menu action = back menu = main Player = <Player> submenu_index = <i> focus = 0 no_forced
	endif
	i = (<i> + 1)
	repeat ($g_num_lobby_local_submenus)
	band_lobby_get_player_submenu_index player_num = ($g_leader_player_num)
	band_lobby_wait_for_menu_update submenu_index = <submenu_index>
	if ($g_connection_loss_dialogue = 1)
		return
	endif
	band_lobby_continue_quickplay Player = <Player> submenu_index = <submenu_index>
endscript

script band_lobby_continue_quickplay \{Player = !i1768515945
		submenu_index = !i1768515945}
	printf channel = band_lobby qs(0xcb8cc4d1) c = <submenu_index> d = <Player>
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <submenu_index>
	getnumplayersingame
	if (<num_players> > 0)
		<Band> = 1
		getfirstplayer \{out = index}
		begin
		setplayerinfo <index> Band = <Band>
		getnextplayer Player = <index> out = index
		repeat <num_players>
	endif
	if (<num_players> > 0)
		Change \{game_mode = quickplay}
		if ininternetmode
			<private> = 0
			if ($g_lobby_net_state = net_private)
				<private> = 1
			endif
			band_lobby_prepare_for_matchmaking Player = ($<submenu_data>.Player) private = <private>
			band_lobby_start_public_matchmaking Player = ($<submenu_data>.Player) private = <private>
		else
			pushdisablerendering \{context = going_into_songlist
				Type = unchecked}
			band_lobby_continue_menu_change \{new_state = uistate_songlist
				data = {
					no_sound
				}}
		endif
	else
		ScriptAssert \{qs(0x61815ab7)}
	endif
	gman_startgamemodegoal
endscript

script band_lobby_continue_vs_save_callback 
	printf \{channel = band_lobby
		qs(0xcba7243b)}
	pre_player = <Player>
	i = 0
	begin
	band_lobby_get_submenu_data submenu_index = <i> param = menu
	if (<menu> = mc_saving)
		band_lobby_get_submenu_data submenu_index = <i> param = Player
		band_lobby_update_submenu_data submenu_index = <i> element = menu_indices value = [0 0 0]
		band_lobby_change_menu action = back menu = main Player = <Player> submenu_index = <i> focus = 0 no_forced
	endif
	i = (<i> + 1)
	repeat ($g_num_lobby_local_submenus)
	band_lobby_get_player_submenu_index player_num = ($g_leader_player_num)
	band_lobby_wait_for_menu_update submenu_index = <submenu_index>
	band_lobby_set_party_joinable \{joinable = 0}
	if ($g_connection_loss_dialogue = 1)
		return
	endif
	if inroadiebattlemode
		Change \{competitive_rules = roadie_battle}
		band_lobby_continue_vs Player = ($g_leader_player_num)
	else
		band_lobby_game_rules Player = <pre_player>
	endif
endscript

script band_lobby_continue_vs \{Player = !i1768515945}
	printf channel = band_lobby qs(0xa41989a5) d = <Player>
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	getnumplayersingame
	if ininternetmode
		clean_up_user_control_helpers
		<private> = 0
		if ($g_lobby_net_state = net_private)
			<private> = 1
		endif
		band_lobby_prepare_for_matchmaking Player = <Player> private = <private>
		band_lobby_start_public_matchmaking private = <private> Player = <Player>
	else
		if teammodeequals \{team_mode = two_teams}
			band_lobby_continue_menu_change \{new_state = uistate_team_select}
		else
			<Band> = 1
			getfirstplayer
			begin
			setplayerinfo <Player> Band = <Band>
			getnextplayer Player = <Player>
			<Band> = (<Band> + 1)
			repeat <num_players>
			pushdisablerendering \{context = going_into_songlist
				Type = unchecked}
			band_lobby_continue_menu_change \{new_state = uistate_songlist
				data = {
					no_sound
				}}
		endif
	endif
endscript

script band_lobby_continue_menu_change \{new_state = !q1768515945
		data = {
		}
		supress_ui_event = 0}
	printf \{channel = band_lobby
		qs(0x70ec5ffc)}
	old_data = <data>
	getplayerinfo ($g_leader_player_num) controller
	change_primary_controller controller = <controller>
	destroy_friend_feed
	destroy_achievements_ui
	if (0 = <supress_ui_event>)
		ui_event_get_top
		if GotParam \{is_popup}
			ui_event event = menu_replace data = {state = <new_state> <old_data>}
		else
			ui_event event = menu_change data = {state = <new_state> <old_data>}
		endif
	endif
endscript

script band_lobby_proceed_with_current_reservations 
	printf \{channel = band_lobby
		qs(0x622d7931)}
	NetSessionFunc \{Obj = match
		func = force_completion}
	gamemode_gettype
	if (<Type> = career)
		Change \{g_career_search = NULL}
		band_lobby_change_focus_submenu_all \{focus_type = unfocus}
	endif
endscript

script band_lobby_check_controllers 
	printf \{channel = band_lobby
		qs(0xe529fba7)}
	getnumplayersingame \{local}
	getfirstplayer \{local}
	begin
	if NOT band_lobby_check_single_controller Player = <Player>
		band_lobby_change_focus_submenu_all \{focus_type = unfocus}
		ui_event event = menu_change state = uistate_controller_disconnect data = {device_num = <controller> is_popup}
		return \{FALSE}
	endif
	getnextplayer local Player = <Player>
	repeat <num_players>
	return \{true}
endscript

script band_lobby_check_single_controller 
	RequireParams \{[
			Player
		]
		all}
	getplayerinfo <Player> part
	getplayerinfo <Player> controller
	getcontrollertype controller = <controller>
	if NOT iscontrollerpluggedin controller = <controller>
		return \{FALSE}
	elseif NOT ($allow_controller_for_all_instruments = 1)
		switch <part>
			case guitar
			case bass
			if (<controller_type> != guitar)
				return \{FALSE}
			endif
			case drum
			if (<controller_type> != drum)
				return \{FALSE}
			endif
			case vocals
			if (<controller_type> != controller && <controller_type> != vocals)
				return \{FALSE}
			endif
		endswitch
	endif
	return \{true}
endscript

script bl_cancel_challenge \{submenu_index = !i1768515945
		supress_button_helpers_update = 0}
	ui_sfx \{menustate = gamerules
		uitype = toggleoff}
	Change g_shortcut_data = {($g_shortcut_data) valid = 0}
	band_lobby_add_menu_update_to_queue submenu_index = <submenu_index> menu_index = -1
	if (0 = <supress_button_helpers_update>)
		band_lobby_update_button_helpers
	endif
endscript

script bl_challenge_shortcut_checks \{Player = !i1768515945
		submenu_index = !i1768515945
		private = 0}
	printf channel = band_lobby qs(0xfcccbfff) c = <submenu_index> d = <Player>
	if screenelementexistssimpleid \{id = band_lobby_desc_id}
		band_lobby_desc_id :Obj_SpawnScriptNow bl_challenge_shortcut_checks_spawned params = {Player = <Player> submenu_index = <submenu_index> private = <private> controller_index = <device_num>}
	endif
endscript

script bl_challenge_shortcut_checks_spawned \{Player = !i1768515945
		submenu_index = !i1768515945
		controller_index = !i1768515945
		private = 0}
	printf channel = band_lobby qs(0x5112c989) c = <submenu_index> d = <Player>
	<failed_checks> = 0
	bl_local_challenge_menu_change
	if ininternetmode
		if NOT band_lobby_are_remote_players_in_game
			band_lobby_get_submenu_data submenu_index = <submenu_index> param = Player
			band_lobby_change_network Player = <Player> network = local focus = 0
		else
			band_lobby_update_ticker \{msg_checksum = ticker_shortcut_remote_players
				msg_count = 3}
			<failed_checks> = 1
		endif
	endif
	if (0 = <failed_checks>)
		if display_target_challenge_config_warning {
				instrument = ($g_shortcut_data.instrument_type)
				goal_name = ($g_shortcut_data.challenge_type)
				controller = <controller_index>
				song = ($g_shortcut_data.song_name)
			}
			stopsound \{lobbyselecta}
			SoundEvent \{event = audio_ui_band_lobby_negative_select}
			band_lobby_flash_ticker_msg \{msg_checksum = ticker_shortcut_invalid_setup
				time = 15}
			<failed_checks> = 1
		endif
	endif
	<popup> = 0
	if (0 = <failed_checks>)
		if band_lobby_continue_check check_type = local Player = <Player> submenu_index = <submenu_index> private = <private>
			if NOT band_lobby_not_all_signed_in_check callback = bl_follow_challenge_shortcut callback_params = {Player = <Player> submenu_index = <submenu_index> controller_index = <controller_index>}
				<failed_checks> = 1
				<popup> = 1
			endif
		else
			<failed_checks> = 1
		endif
	endif
	if (1 = <failed_checks>)
		if (<popup> = 0)
			bl_local_challenge_menu_change \{revert = 1}
		else
			bl_local_challenge_menu_change \{revert = 1
				focus_overide = 0}
		endif
	endif
endscript

script bl_follow_challenge_shortcut 
	printstruct ($g_shortcut_data)
	if (1 = $g_shortcut_data.valid)
		if screenelementexistssimpleid \{id = band_lobby_desc_id}
			band_lobby_desc_id :Obj_SpawnScriptNow \{bl_challenge_lb_time_out_cleanup}
		endif
		request_friend_stats song = ($g_shortcut_data.song_name)
		Block \{Type = lb_read}
		Block \{Type = lb_read}
		gman_startgamemodegoal
		quickplay_reset_target_data
		<goal_name> = ($g_shortcut_data.challenge_type)
		getplayerinfo <Player> part
		friendstats_getscores goal_name = <goal_name> controller_index = <controller_index> instrument = <part>
		GetArraySize <rows> param = num_lb_entries
		<has_friend_scores> = 0
		<target_index> = -1
		if (0 < <num_lb_entries>)
			<lb_index> = 0
			begin
			if (($g_shortcut_data.sender_id [0]) = (<rows> [<lb_index>].player_id [0]) &&
					($g_shortcut_data.sender_id [1]) = (<rows> [<lb_index>].player_id [1]))
				if checksumequals a = <goal_name> b = qp_power_score_points
					<target_index> = <lb_index>
					<has_friend_scores> = 1
				else
					quickplay_save_specific_friend_stat friend_scores = <rows> target_index = <lb_index>
				endif
				break
			endif
			<lb_index> = (1 + <lb_index>)
			repeat <num_lb_entries>
		endif
		Change g_shortcut_data = {($g_shortcut_data) valid = 0}
		if checksumequals a = <goal_name> b = qp_power_score_points
			generic_event_choose {
				state = uistate_quickplay_power_select
				data = {
					song_name = ($g_shortcut_data.song_name)
					challenge_name = <goal_name>
					instrument = <part>
					friend_scores = <rows>
					target_index = <target_index>
					has_friend_scores = <has_friend_scores>
					device_num = <controller_index>
					previous_screen_id = None
				}
			}
		else
			band_lobby_continue_menu_change \{new_state = uistate_play_song
				supress_ui_event = 1}
			quickplay_start_targeted_challenge song_name = ($g_shortcut_data.song_name) challenge_name = <goal_name> instrument = <part> event = menu_change
		endif
	else
		band_lobby_update_ticker \{msg_checksum = ticker_shortcut_invalid_shortcut
			msg_count = 3}
		band_lobby_add_menu_update_to_queue submenu_index = <submenu_index> menu_index = -1
		band_lobby_update_button_helpers
		bl_local_challenge_menu_change \{revert = 1}
	endif
endscript

script bl_challenge_lb_time_out_cleanup 
	waitseconds num_seconds = ($band_lobby_wait_times.lb_read_for_challenge)
	if ScriptIsRunning \{bl_follow_challenge_shortcut}
		KillSpawnedScript \{Name = bl_follow_challenge_shortcut}
		band_lobby_update_ticker \{msg_checksum = ticker_shortcut_lb_time_out
			msg_count = 3}
		bl_local_challenge_menu_change \{revert = 1}
	endif
endscript

script wii_client_check_mics 
	printf \{'--- wii_client_check_mics ---'}
	ui_event_get_top_base_name
	if ((<base_name> != 'band_lobby_popup') && (<base_name> != 'mic_binding'))
		if NOT band_lobby_continue_check_mic_distribution
			band_lobby_change_focus_submenu_all \{focus_type = unfocus}
			ui_event_wait {
				event = menu_change
				data = {
					is_popup
					state = uistate_band_lobby_popup
					controller = <controller>
					reason = <reason>
					message = <message>
				}
			}
		endif
	endif
endscript
