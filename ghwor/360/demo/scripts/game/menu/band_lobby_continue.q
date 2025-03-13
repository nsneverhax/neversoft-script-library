
script band_lobby_are_all_local_players_plugged_in 
	getnumplayersingame \{local
		out = x}
	if (<x> <= 0)
		return \{false
			offender = noplayers}
	endif
	getfirstplayer \{local}
	begin
	getplayerinfo <player> part
	getplayerinfo <player> controller
	if (<part> = vocals)
		if NOT vocals_controllerhasusableheadset controller = <controller>
			return \{false
				offender = mic}
		endif
	else
		if NOT iscontrollerpluggedin controller = <controller>
			return \{false
				offender = controller}
		endif
	endif
	getnextplayer player = <player> local
	repeat <x>
	return \{true}
endscript

script band_lobby_continue_check_mic_distribution 
	if ($allow_controller_for_all_instruments = 1)
		return \{true}
	endif
	distribution_valid = true
	getnumplayersingame \{on_screen}
	getfirstplayer \{on_screen}
	netsessionfunc \{obj = plat_party
		func = get_num_party_players}
	num_local_guest_invalid = 0
	num_local_nonguest_invalid = 0
	num_nonlocal_invalid = 0
	num_plat_party_headset_invalid = 0
	invalid_mic_player = -1
	begin
	if playerinfoequals <player> part = vocals
		if playerinfoequals <player> lobby_mic_valid = 0
			distribution_valid = false
			if playerinfoequals <player> is_local_client = 1
				invalid_mic_player = <player>
				getplayerinfo <player> controller
				band_lobby_get_is_guest device_num = <controller>
				if (<is_guest> = 1)
					num_local_guest_invalid = (<num_local_guest_invalid> + 1)
				else
					num_local_nonguest_invalid = (<num_local_nonguest_invalid> + 1)
				endif
				if playerinfoequals <player> mic_type = headset
					if (<num_plat_party_players> > 0)
						num_plat_party_headset_invalid = (<num_plat_party_headset_invalid> + 1)
					endif
				endif
			else
				num_nonlocal_invalid = (<num_nonlocal_invalid> + 1)
			endif
		endif
	endif
	getnextplayer on_screen player = <player>
	repeat <num_players_shown>
	if (<distribution_valid> = false)
		if isxenon
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
				ui_sfx \{menustate = generic
					uitype = warningmessage}
				raw_message = ($band_lobby_mic_invalid_messages_xenon.<num_mics_entry>.<acct_type_entry>)
				formattext textname = message <raw_message> a = <invalid_mic_player>
				getplayerinfo <invalid_mic_player> controller
				return false reason = mic_distribution_invalid message = <message> mic_controller = <controller>
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
			return \{false}
		endif
	elseif band_lobby_is_even_number_of_instruments
		if band_lobby_satisfy_min_players \{team = 1}
			return \{true}
		else
			band_lobby_update_ticker \{msg_checksum = more_players_or_match
				msg_count = 3}
			return \{false}
		endif
	else
		band_lobby_update_ticker \{msg_checksum = more_players_or_match
			msg_count = 3}
	endif
endscript

script band_lobby_remove_all_character_silhouettes 
	printf \{qs(0xfe4497a8)}
	printstruct <...>
	viewportindex = 0
	begin
	band_lobby_get_submenu_data submenu_index = <viewportindex> param = player
	getplayerinfo <player> chosen_character_id
	getplayerinfo <player> character_id
	printf qs(0x8a3bfe88) a = <player> b = <viewportindex> c = <chosen_character_id> d = <character_id>
	if (<chosen_character_id> = silhouette)
		printf qs(0x33b08e77) a = <player> b = <viewportindex>
		net_stop_character_silhouette player = <submenu_data> submenu_index = <viewportindex>
	endif
	viewportindex = (<viewportindex> + 1)
	repeat ($g_num_lobby_local_submenus)
	printf \{qs(0x83d5ccfa)}
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
	return \{false}
endscript

script bl_are_all_in_game_controllers_fully_joined 
	printf \{channel = band_lobby
		qs(0xb7520340)}
	if ininternetmode
		if NOT innetgame
			getactivecontrollers
			getarraysize <active_controllers>
			i = 0
			begin
			if netsessionfunc func = iscontrolleringame params = {controller = <i>}
				if playerinfoequals (<i> + 1) in_game = 1
					if playerinfoequals (<i> + 1) is_local_client = 0
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
	printf \{channel = band_lobby
		qs(0xa79e3ce2)}
	if ininternetmode
		if NOT innetgame
			netsessionfunc \{obj = party
				func = get_party_members}
			getarraysize <connections> param = party_size
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
			if scriptisrunning \{band_lobby_add_party_member}
				return \{true}
			endif
		else
			return \{false}
		endif
	endif
	return \{false}
endscript

script band_lobby_continue_check 
	printf \{channel = band_lobby
		qs(0x7111d555)}
	requireparams \{[
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
	if ($cheat_freedrum = 1)
		if ($g_lobby_state = career)
			band_lobby_flash_ticker_msg \{msg_checksum = freedrum_error_msg
				time = 5}
			return \{false
				popup = 0}
		endif
	endif
	band_lobby_kick_leader_out_of_band_manage
	getplayerinfo <player> controller
	if (<check_type> = fail)
		return \{false
			popup = 0}
	endif
	getnumplayersingame
	if (<check_type> = net)
		if (career = $g_lobby_state || quickplay = $g_lobby_state)
			if (<num_players> = 4)
				if gotparam \{private}
					if (0 = <private>)
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
		if NOT netsessionfunc \{func = ismultiplayerallowed}
			band_lobby_change_focus_submenu_all \{focus_type = unfocus}
			ui_event_wait event = menu_change data = {is_popup state = uistate_band_lobby_popup controller = <controller> reason = age_restricted}
			return \{false
				popup = 1}
		endif
		getplayerinfo <player> controller
		band_lobby_get_is_guest device_num = <controller>
		if (<is_guest> = 1)
			band_lobby_change_focus_submenu_all \{focus_type = unfocus}
			ui_event_wait event = menu_change data = {is_popup state = uistate_band_lobby_popup controller = <controller> reason = guest_leader}
			return \{false
				popup = 1}
		endif
		if NOT innetgame
			getnumplayersingame \{remote}
			if (<num_players> > 0)
				getfirstplayer \{remote
					out = remote_player}
				begin
				if NOT playerinfoequals <remote_player> async_io_status = ready
					band_lobby_change_focus_submenu_all \{focus_type = unfocus}
					ui_event_wait event = menu_change data = {is_popup state = uistate_band_lobby_popup controller = <controller> reason = players_not_ready_io_host}
					sendstructure \{callback = band_lobby_flash_ticker_msg
						party
						channel = party
						data_to_send = {
							msg_checksum = players_not_ready_io_client
							time = 10
						}}
					return \{false
						popup = 1}
				endif
				getnextplayer player = <remote_player> remote out = remote_player
				repeat <num_players>
			endif
		endif
		band_lobby_update_ticker \{msg_checksum = update_net}
		if isps3
			if NOT netsessionfunc \{func = is_lobby_available}
				band_lobby_update_ticker \{msg_checksum = current_state}
				band_lobby_change_focus_submenu_all \{focus_type = unfocus}
				ui_event_wait event = menu_change data = {is_popup state = uistate_band_lobby_popup controller = <controller> reason = game_servers_unavailable}
				return \{false
					popup = 1}
			endif
			if ($demonware_is_ready = 1)
				if ($demonware_stun_failed = 1)
					band_lobby_update_ticker \{msg_checksum = current_state}
					band_lobby_change_focus_submenu_all \{focus_type = unfocus}
					ui_event_wait event = menu_change data = {is_popup state = uistate_band_lobby_popup controller = <controller> reason = game_servers_unavailable}
					return \{false
						popup = 1}
				endif
			else
				band_lobby_change_focus_submenu_all \{focus_type = unfocus}
				ui_event_wait event = menu_change data = {is_popup state = uistate_band_lobby_popup controller = <controller> reason = game_servers_unavailable}
				return \{false
					popup = 1}
			endif
		endif
		band_lobby_update_ticker \{msg_checksum = current_state}
	endif
	if (<check_type> != skip)
		if band_lobby_is_anyone_in_forced_flow
			band_lobby_change_focus_submenu_all \{focus_type = unfocus}
			ui_event_wait event = menu_change data = {is_popup state = uistate_band_lobby_popup controller = <controller> reason = player_in_forced_flow}
			return \{false
				popup = 1}
		endif
		if NOT band_lobby_continue_check_mic_distribution
			band_lobby_change_focus_submenu_all \{focus_type = unfocus}
			ui_event_wait event = menu_change data = {is_popup state = uistate_band_lobby_popup controller = <controller> reason = <reason> message = <message>}
			return \{false
				popup = 1}
		endif
		getnumplayersingame
		if (<num_players> > 4)
			if (($g_lobby_state = quickplay) || ($g_lobby_state = career))
				band_lobby_change_focus_submenu_all \{focus_type = unfocus}
				ui_event_wait event = menu_change data = {is_popup state = uistate_band_lobby_popup controller = <controller> reason = too_many_players_host}
				sendstructure \{callback = band_lobby_flash_ticker_msg
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
	requireparams \{[
			player
			submenu_index
		]
		all}
	printf \{channel = band_lobby
		qs(0x97d37c06)}
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%d' d = <submenu_index>
	band_lobby_change_focus_submenu_all \{focus_type = unfocus}
	if isps3
		if NOT checkforsignin
			band_lobby_seamless_net_change {
				network = net_public
				player = <player>
				callback = band_lobby_net_continue
				callback_params = {
					player = <player>
					submenu_index = <submenu_index>
				}
			}
			return
		endif
	endif
	if band_lobby_continue_check check_type = net player = ($<submenu_data>.player) submenu_index = <submenu_index>
		if ininternetmode
			band_lobby_change_network player = <player> network = net_public focus = 0
			switch ($g_lobby_state)
				case career
				band_lobby_get_submenu_data submenu_index = <submenu_index> param = menu
				if (<menu> != career_search)
					if ($g_career_search = null)
						if NOT (($<submenu_data>.menu) = career_search)
							band_lobby_change_menu action = forward menu = career_search player = <player> submenu_index = <submenu_index> no_forced reset_characters
							band_lobby_change_focus_submenu_all \{focus_type = focus}
						endif
					else
						if band_lobby_cancel_matchmaking
							band_lobby_update_submenu_data submenu_index = <submenu_index> element = menu_indices value = [0 0 0]
							band_lobby_change_menu menu = main action = forward player = <player> submenu_index = <submenu_index>
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
				scriptassert \{qs(0x7f08d1db)}
			endswitch
		else
			band_lobby_seamless_net_change {
				network = net_public
				player = <player>
				callback = band_lobby_net_continue
				callback_params = {
					player = <player>
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

script band_lobby_continue \{player = !i1768515945
		submenu_index = !i1768515945
		private = 0}
	printf channel = band_lobby qs(0x1c9eef19) c = <submenu_index> d = <player>
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%d' d = <submenu_index>
	band_lobby_change_focus_submenu_all \{focus_type = unfocus}
	check_type = local
	if ininternetmode
		band_lobby_change_network player = ($<submenu_data>.player) network = local focus = 0
	endif
	if band_lobby_continue_check check_type = <check_type> player = <player> submenu_index = <submenu_index> private = <private>
		if checksumequals a = ($g_lobby_state) b = vs
			if band_lobby_check_continue_private_competitive
				band_lobby_not_all_signed_in_check callback = band_lobby_really_continue callback_params = {<...>}
			else
				stopsound \{lobbyselecta}
				soundevent \{event = audio_ui_band_lobby_negative_select}
				band_lobby_change_focus_submenu_all \{focus_type = focus}
			endif
		else
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
		soundevent \{event = audio_ui_band_lobby_complete}
		if ($g_career_search = null)
			band_lobby_whole_band_autosave choose_script = band_lobby_continue_career_save_callback <...>
		elseif ($g_career_search = host_only)
			if netsessionfunc \{obj = match
					func = get_num_matchmaking_players}
				getnumplayersingame
				total_players = <num_players>
				getnumplayersingame \{local}
				if ((<total_players> = <num_matchmaking_players>) && (<num_players> = <num_matchmaking_players>))
					if band_lobby_cancel_matchmaking
						band_lobby_update_submenu_data submenu_index = <submenu_index> element = menu_indices value = [0 0 0]
						band_lobby_change_menu menu = main action = forward player = <player> submenu_index = <submenu_index> focus = 1
						band_lobby_change_focus_submenu_all \{focus_type = focus}
						band_lobby_update_button_helpers
					endif
				else
					band_lobby_proceed_with_current_reservations
				endif
			endif
		endif
		case quickplay
		soundevent \{event = audio_ui_band_lobby_complete}
		band_lobby_whole_band_autosave choose_script = band_lobby_continue_quickplay_save_callback <...>
		case vs
		if band_lobby_check_continue_private_competitive
			soundevent \{event = audio_ui_band_lobby_complete}
			band_lobby_set_party_joinable \{joinable = 0}
			band_lobby_whole_band_autosave choose_script = band_lobby_continue_vs_save_callback <...>
		else
			soundevent \{event = audio_ui_band_lobby_negative_select}
			band_lobby_change_focus_submenu_all \{focus_type = focus}
		endif
		default
		scriptassert \{qs(0x25c1ea30)}
	endswitch
endscript

script band_lobby_not_all_signed_in_check \{callback_params = {
		}}
	requireparams \{[
			callback
		]}
	printf \{qs(0x9c22dcea)}
	<ret> = false
	if band_lobby_are_all_players_signed_in
		<callback> <callback_params>
		<ret> = true
	elseif demobuild
		<callback> <callback_params>
		<ret> = true
	else
		ui_sfx \{menustate = generic
			uitype = warningmessage}
		band_lobby_desc_id :obj_killspawnedscript \{name = band_lobby_update_mics}
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
		assignalias id = <menu_id> alias = band_lobby_not_all_signed_confirm_menu
		launchevent \{type = focus
			target = band_lobby_not_all_signed_confirm_menu}
		<ret> = false
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
	if screenelementexists \{id = band_lobby_not_all_signed_confirm_menu}
		destroy_dialog_box
	endif
	band_lobby_update_button_helpers
	band_lobby_change_focus_submenu_all \{focus_type = focus}
endscript

script band_lobby_find_more_players \{private = 0}
	requireparams \{[
			player
			submenu_index
			server_list_mode
		]
		all}
	printf \{channel = band_lobby
		qs(0xa2155c0f)}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	if ininternetmode
		if innetgame
			band_lobby_change_menu action = back menu = main player = <player> submenu_index = <submenu_index>
			return
		endif
		if band_lobby_continue_check check_type = net player = <player> submenu_index = <submenu_index> private = <private>
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
				change g_career_search = <server_list_mode>
				band_lobby_update_button_helpers
			endif
			band_lobby_prepare_for_matchmaking player = <player> private = <private>
			if (<private> = 1)
				band_lobby_flash_ticker_msg \{msg_checksum = creating_session
					time = 5}
			else
				band_lobby_update_submenu_data submenu_index = <submenu_index> element = menu_indices value = [0 0 0]
				band_lobby_change_menu action = back menu = main player = <player> submenu_index = <submenu_index>
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
				submenu_index = <submenu_index>
				server_list_mode = <server_list_mode>
				private = <private>
			}
		}
	endif
endscript

script band_lobby_continue_career_save_callback 
	printf \{channel = band_lobby
		qs(0xc9d64c1c)}
	i = 0
	begin
	band_lobby_get_submenu_data submenu_index = <i> param = menu
	if (<menu> = mc_saving)
		band_lobby_get_submenu_data submenu_index = <i> param = player
		band_lobby_update_submenu_data submenu_index = <i> element = menu_indices value = [0 0 0]
		band_lobby_change_menu action = back menu = main player = <player> submenu_index = <i> focus = 0 no_forced
	endif
	i = (<i> + 1)
	repeat ($g_num_lobby_local_submenus)
	band_lobby_wait_for_menu_update_all
	if ($g_connection_loss_dialogue = 1)
		return
	endif
	band_lobby_continue_career player = <player> submenu_index = <submenu_index>
endscript

script band_lobby_continue_career 
	printf \{channel = band_lobby
		qs(0xc595a1be)}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	getnumplayersingame
	if (<num_players> > 0)
		band = 1
		<solo_highway_enabled> = 0
		getfirstplayer \{out = index}
		begin
		setplayerinfo <index> band = <band>
		if innetgame
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
		getnextplayer player = <index> out = index
		repeat <num_players>
	endif
	if ininternetmode
		band_lobby_change_network player = <player> focus = 0 network = local
	endif
	get_savegame_from_controller controller = ($primary_controller)
	change \{g_net_career_ignore_unlock_atoms = 1}
	reset_progression_atoms savegame = <savegame> async = 1 force_update = 1
	change \{g_net_career_ignore_unlock_atoms = 0}
	begin
	if NOT savegame_async_is_busy
		break
	endif
	wait \{1
		gameframe}
	repeat
	play_outro_vo = 0
	outro_vo_strings = []
	getplayerinfo ($g_leader_player_num) controller
	if NOT has_completed_forced_career_flow device_num = <controller>
		if isps3
			hide_glitch \{num_frames = 20}
		endif
		band_lobby_continue_menu_change new_state = uistate_career_movie data = {movie = 'career_intro' stream = 'career_intro' new_state = uistate_quest_map device_num = <controller> new_data = {play_outro_vo = <play_outro_vo> outro_vo_strings = <outro_vo_strings> device_num = <controller>}}
	else
		band_lobby_continue_menu_change new_state = uistate_quest_map data = {new_data = {play_outro_vo = <play_outro_vo> outro_vo_strings = <outro_vo_strings>}}
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
		band_lobby_get_submenu_data submenu_index = <i> param = player
		band_lobby_update_submenu_data submenu_index = <i> element = menu_indices value = [0 0 0]
		band_lobby_change_menu action = back menu = main player = <player> submenu_index = <i> focus = 0 no_forced
	endif
	i = (<i> + 1)
	repeat ($g_num_lobby_local_submenus)
	band_lobby_get_player_submenu_index player_num = ($g_leader_player_num)
	band_lobby_wait_for_menu_update submenu_index = <submenu_index>
	if ($g_connection_loss_dialogue = 1)
		return
	endif
	band_lobby_continue_quickplay player = <player> submenu_index = <submenu_index>
endscript

script band_lobby_continue_quickplay \{player = !i1768515945
		submenu_index = !i1768515945}
	printf channel = band_lobby qs(0xcb8cc4d1) c = <submenu_index> d = <player>
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%d' d = <submenu_index>
	getnumplayersingame
	if (<num_players> > 0)
		<band> = 1
		getfirstplayer \{out = index}
		begin
		setplayerinfo <index> band = <band>
		getnextplayer player = <index> out = index
		repeat <num_players>
	endif
	if (<num_players> > 0)
		change \{game_mode = quickplay}
		if ininternetmode
			<private> = 0
			if ($g_lobby_net_state = net_private)
				<private> = 1
			endif
			band_lobby_prepare_for_matchmaking player = ($<submenu_data>.player) private = <private>
			band_lobby_start_public_matchmaking player = ($<submenu_data>.player) private = <private>
		else
			pushdisablerendering \{context = going_into_songlist
				type = unchecked}
			band_lobby_continue_menu_change \{new_state = uistate_songlist
				data = {
					no_sound
				}}
		endif
	else
		scriptassert \{qs(0x61815ab7)}
	endif
	gman_startgamemodegoal
endscript

script band_lobby_continue_vs_save_callback 
	printf \{channel = band_lobby
		qs(0xcba7243b)}
	pre_player = <player>
	i = 0
	begin
	band_lobby_get_submenu_data submenu_index = <i> param = menu
	if (<menu> = mc_saving)
		band_lobby_get_submenu_data submenu_index = <i> param = player
		band_lobby_update_submenu_data submenu_index = <i> element = menu_indices value = [0 0 0]
		band_lobby_change_menu action = back menu = main player = <player> submenu_index = <i> focus = 0 no_forced
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

script band_lobby_continue_vs \{player = !i1768515945}
	printf channel = band_lobby qs(0xa41989a5) d = <player>
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	getnumplayersingame
	if ininternetmode
		<private> = 0
		if ($g_lobby_net_state = net_private)
			<private> = 1
		endif
		band_lobby_prepare_for_matchmaking player = <player> private = <private>
		band_lobby_start_public_matchmaking private = <private> player = <player>
	else
		if teammodeequals \{team_mode = two_teams}
			band_lobby_continue_menu_change \{new_state = uistate_team_select}
		else
			<band> = 1
			getfirstplayer
			begin
			setplayerinfo <player> band = <band>
			getnextplayer player = <player>
			<band> = (<band> + 1)
			repeat <num_players>
			pushdisablerendering \{context = going_into_songlist
				type = unchecked}
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
	if (0 = <supress_ui_event>)
		ui_event_get_top
		if gotparam \{is_popup}
			ui_event event = menu_replace data = {state = <new_state> <old_data>}
		else
			ui_event event = menu_change data = {state = <new_state> <old_data>}
		endif
	endif
endscript

script band_lobby_proceed_with_current_reservations 
	printf \{channel = band_lobby
		qs(0x622d7931)}
	netsessionfunc \{obj = match
		func = force_completion}
	gamemode_gettype
	if (<type> = career)
		change \{g_career_search = null}
		band_lobby_change_focus_submenu_all \{focus_type = unfocus}
	endif
endscript

script band_lobby_check_controllers 
	printf \{channel = band_lobby
		qs(0xe529fba7)}
	getnumplayersingame \{local}
	getfirstplayer \{local}
	begin
	if NOT band_lobby_check_single_controller player = <player>
		band_lobby_change_focus_submenu_all \{focus_type = unfocus}
		ui_event event = menu_change state = uistate_controller_disconnect data = {device_num = <controller> is_popup}
		return \{false}
	endif
	getnextplayer local player = <player>
	repeat <num_players>
	return \{true}
endscript

script band_lobby_check_single_controller 
	requireparams \{[
			player
		]
		all}
	getplayerinfo <player> part
	getplayerinfo <player> controller
	getcontrollertype controller = <controller>
	if NOT iscontrollerpluggedin controller = <controller>
		return \{false}
	elseif NOT ($allow_controller_for_all_instruments = 1)
		switch <part>
			case guitar
			case bass
			if (<controller_type> != guitar)
				return \{false}
			endif
			case drum
			if (<controller_type> != drum)
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

script bl_cancel_challenge \{submenu_index = !i1768515945
		supress_button_helpers_update = 0}
	ui_sfx \{menustate = gamerules
		uitype = toggleoff}
	change g_shortcut_data = {($g_shortcut_data) valid = 0}
	band_lobby_add_menu_update_to_queue submenu_index = <submenu_index> menu_index = -1
	if (0 = <supress_button_helpers_update>)
		band_lobby_update_button_helpers
	endif
endscript

script bl_challenge_shortcut_checks \{player = !i1768515945
		submenu_index = !i1768515945
		private = 0}
	printf channel = band_lobby qs(0xfcccbfff) c = <submenu_index> d = <player>
	if screenelementexistssimpleid \{id = band_lobby_desc_id}
		band_lobby_desc_id :obj_spawnscriptnow bl_challenge_shortcut_checks_spawned params = {player = <player> submenu_index = <submenu_index> private = <private> controller_index = <device_num>}
	endif
endscript

script bl_challenge_shortcut_checks_spawned \{player = !i1768515945
		submenu_index = !i1768515945
		controller_index = !i1768515945
		private = 0}
	printf channel = band_lobby qs(0x5112c989) c = <submenu_index> d = <player>
	<failed_checks> = 0
	bl_local_challenge_menu_change
	if ininternetmode
		if NOT band_lobby_are_remote_players_in_game
			band_lobby_get_submenu_data submenu_index = <submenu_index> param = player
			band_lobby_change_network player = <player> network = local focus = 0
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
			soundevent \{event = audio_ui_band_lobby_negative_select}
			band_lobby_flash_ticker_msg \{msg_checksum = ticker_shortcut_invalid_setup
				time = 15}
			<failed_checks> = 1
		endif
	endif
	<popup> = 0
	if (0 = <failed_checks>)
		if band_lobby_continue_check check_type = local player = <player> submenu_index = <submenu_index> private = <private>
			if NOT band_lobby_not_all_signed_in_check callback = bl_follow_challenge_shortcut callback_params = {player = <player> submenu_index = <submenu_index> controller_index = <controller_index>}
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
			band_lobby_desc_id :obj_spawnscriptnow \{bl_challenge_lb_time_out_cleanup}
		endif
		request_friend_stats song = ($g_shortcut_data.song_name)
		block \{type = lb_read}
		block \{type = lb_read}
		gman_startgamemodegoal
		quickplay_reset_target_data
		<goal_name> = ($g_shortcut_data.challenge_type)
		getplayerinfo <player> part
		friendstats_getscores goal_name = <goal_name> controller_index = <controller_index> instrument = <part>
		getarraysize <rows> param = num_lb_entries
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
		change g_shortcut_data = {($g_shortcut_data) valid = 0}
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
					previous_screen_id = none
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
	if scriptisrunning \{bl_follow_challenge_shortcut}
		killspawnedscript \{name = bl_follow_challenge_shortcut}
		band_lobby_update_ticker \{msg_checksum = ticker_shortcut_lb_time_out
			msg_count = 3}
		bl_local_challenge_menu_change \{revert = 1}
	endif
endscript
