
script band_lobby_does_need_to_show_warning 
	printf \{channel = band_lobby
		qs(0x0b5e07bc)}
	show_warning = 0
	msg_checksum = leave_msg_net
	choose_script = empty_script
	if ininternetmode
		getnumplayersingame
		total_num_players = <num_players>
		NetSessionFunc \{Obj = party
			func = get_party_members}
		GetArraySize \{connections}
		party_num_players = <array_Size>
		getnumplayersingame \{local}
		local_num_players = <num_players>
		if NOT InNetGame
			if (<party_num_players> <= <local_num_players>)
				if NOT is_current_playlist_empty
					show_warning = 1
					msg_checksum = leave_msg_local_playlist
					choose_script = band_lobby_go_back
				else
					if (<total_num_players> = 1)
						show_warning = 0
					else
						show_warning = 1
						msg_checksum = leave_msg_local
						choose_script = band_lobby_go_back
					endif
				endif
			else
				show_warning = 1
				msg_checksum = leave_msg_party
				choose_script = band_lobby_leave_party
			endif
		else
			show_warning = 1
			msg_checksum = leave_msg_matchmade
			choose_script = quit_online_now
		endif
	else
		if NOT is_current_playlist_empty
			show_warning = 1
			msg_checksum = leave_msg_local_playlist
			choose_script = band_lobby_go_back
		else
			getnumplayersingame
			total_num_players = <num_players>
			if (<total_num_players> = 1)
				show_warning = 0
			else
				show_warning = 1
				msg_checksum = leave_msg_local
				choose_script = band_lobby_go_back
			endif
		endif
	endif
	if is_roadie_battle_mode
		<show_warning> = 1
		msg_checksum = leave_msg_roadie_battle
		choose_script = ui_roadie_battle_choose_sides_back
	endif
	if (<show_warning> = 1)
		return true msg_checksum = <msg_checksum> choose_script = <choose_script>
	else
		return \{FALSE}
	endif
endscript

script band_lobby_local_leader_leave 
	RequireParams \{[
			submenu_index
		]
		all}
	printf \{channel = band_lobby
		qs(0x36f59359)}
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <submenu_index>
	if band_lobby_does_need_to_show_warning
		if band_lobby_desc_id :desc_resolvealias \{Name = alias_pu_cont_parent}
			gh5_band_screen_ui_sound generic_back = 1 player_num = <Player>
			if is_roadie_battle_mode
				band_lobby_create_popup_menu {
					menu = leave_lobby_roadie_battle
					Player = ($<submenu_data>.Player)
					container = <resolved_id>
					msg_checksum = <msg_checksum>
					choose_script = <choose_script>
				}
			else
				band_lobby_create_popup_menu {
					menu = leave_lobby
					msg_checksum = <msg_checksum>
					choose_script = <choose_script>
					submenu_index = <submenu_index>
					Player = ($<submenu_data>.Player)
					container = <resolved_id>
				}
			endif
		endif
	else
		gh5_band_screen_ui_sound generic_back = 1 player_num = <Player>
		band_lobby_whole_band_autosave choose_script = band_lobby_go_back Player = ($<submenu_data>.Player) viewport_index = <submenu_index>
	endif
endscript

script band_lobby_local_player_leave 
	RequireParams \{[
			viewport_index
		]
		all}
	printf \{channel = band_lobby
		qs(0x8fd6684a)}
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <viewport_index>
	if NOT (($<submenu_data>.menu) = join)
		getplayerinfo ($<submenu_data>.Player) controller
		setplayerinfo ($<submenu_data>.Player) in_game = 0
		setplayerinfo ($<submenu_data>.Player) is_local_client = 1
		setplayerinfo ($<submenu_data>.Player) net_id_first = 0
		setplayerinfo ($<submenu_data>.Player) net_id_first = 0
		setplayerinfo ($<submenu_data>.Player) party_id = -1
		setplayerinfo ($<submenu_data>.Player) chosen_character_id = None
		setplayerinfo ($<submenu_data>.Player) chosen_character_savegame = -1
		NetSessionFunc func = removecontroller params = {controller = <controller>}
		if NOT NetSessionFunc \{Obj = party
				func = is_host}
			NetSessionFunc Obj = party func = remove_playr_from_party params = {controller_index = <controller>}
		endif
		session_stats_reset
		band_lobby_update_submenu_data submenu_index = <viewport_index> element = occupied value = 0
		band_lobby_update_submenu_data submenu_index = <viewport_index> element = net_id value = [0 0]
		if ((isps3) || (isngc))
			Change GlobalName = ($<submenu_data>.gamertag_checksum) NewValue = qs(0x00000000)
		endif
		if band_lobby_find_missing_part Player = ($<submenu_data>.Player)
			setplayerinfo ($<submenu_data>.Player) part = <missing_part>
		endif
		band_lobby_change_menu action = back menu = join Player = ($<submenu_data>.Player) viewport_index = <viewport_index> no_forced
		band_lobby_kick_leader_out_of_band_manage
		band_lobby_update_player_viewport_assignments
		band_lobby_refresh_band_leader_characters
		band_lobby_update_button_helpers
	endif
endscript

script band_lobby_leave_forced_flow 
	RequireParams \{[
			Player
			viewport_index
		]
		all}
	band_lobby_get_submenu_data viewport_index = <viewport_index> param = is_managed
	if (<submenu_data> = 1)
		band_lobby_manage_band_members action = deselect Player = <Player> viewport_index = <viewport_index>
	else
		band_lobby_leave Player = <Player> viewport_index = <viewport_index>
	endif
endscript

script band_lobby_can_leave 
	printf \{channel = band_lobby
		qs(0x7848a09d)}
	if ($net_popup_active = 1)
		return \{FALSE}
	endif
	if savegame_async_is_busy
		return \{FALSE}
	endif
	return \{true}
endscript

script band_lobby_leave 
	RequireParams \{[
			viewport_index
			Player
		]
		all}
	printf channel = band_lobby qs(0x9439bf1f) c = <viewport_index> d = <Player>
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <viewport_index>
	if band_lobby_can_leave
		if is_roadie_battle_mode
			if (<Player> != 1)
				SpawnScriptNow ui_roadie_battle_destroy_controller_lights params = {Player = <Player>}
			endif
		endif
		if ($g_leader_player_num = -1)
			band_lobby_go_back
		elseif ($g_career_search != NULL)
			if ($g_leader_player_num = <Player>)
				if band_lobby_cancel_matchmaking
					band_lobby_update_submenu_data submenu_index = <viewport_index> element = menu_indices value = [0 0 0]
					band_lobby_change_menu menu = main action = back Player = <Player> viewport_index = <viewport_index>
					band_lobby_update_button_helpers
				endif
			endif
		else
			if ($g_leader_player_num = <Player>)
				if NOT GotParam \{controller_pulled}
					band_lobby_local_leader_leave submenu_index = <viewport_index>
				else
					band_lobby_autosave not_on_ps3 choose_script = band_lobby_local_player_leave Player = ($<submenu_data>.Player) viewport_index = <viewport_index>
				endif
			else
				if NOT InNetGame
					band_lobby_autosave not_on_ps3 choose_script = band_lobby_local_player_leave Player = ($<submenu_data>.Player) viewport_index = <viewport_index>
				endif
			endif
		endif
	endif
endscript

script band_lobby_switch_to_enabled_profile_or_guest_start 
	RequireParams \{[
			silver_guys_controller
		]}
	printf qs(0x00f41a7c) d = <silver_guys_controller>
	printstruct <...>
	band_lobby_change_focus_submenu_all \{focus_type = unfocus}
	optionsarray = []
	item = {func = band_lobby_switch_to_enabled_profile_or_guest_signin
		func_params = {silver_guys_controller = <silver_guys_controller>}
		text = ($band_lobby_strings.popup_option_signin)
	}
	AddArrayElement array = <optionsarray> element = <item>
	optionsarray = <array>
	if isxenonorwindx
		if GotParam \{allow_continue_as_guest}
			item = {func = band_lobby_switch_to_enabled_profile_or_guest_continue_as_guest
				func_params = {silver_guys_controller = <silver_guys_controller>}
				text = ($band_lobby_strings.continue_guest)
			}
			AddArrayElement array = <optionsarray> element = <item>
			optionsarray = <array>
		endif
	endif
	item = {func = band_lobby_switch_to_enabled_profile_or_guest_cancel
		func_params = {silver_guys_controller = <silver_guys_controller>}
		text = ($band_lobby_strings.popup_option_cancel)
	}
	AddArrayElement array = <optionsarray> element = <item>
	optionsarray = <array>
	body_text = ($band_lobby_strings.switch_to_enabled_profile_or_guest)
	if isxenonorwindx
		if GotParam \{allow_continue_as_guest}
			body_text = ($band_lobby_strings.switch_to_enabled_profile_or_continue_as_guest)
		endif
	endif
	create_dialog_box {
		heading_text = ($band_lobby_strings.popup_title_warning)
		body_text = <body_text>
		no_background
		player_device = <silver_guys_controller>
		back_button_script = band_lobby_switch_to_enabled_profile_or_guest_cancel
		parent = band_lobby_desc_id
		options = <optionsarray>
	}
	AssignAlias id = <menu_id> alias = switch_to_enabled_profile_or_guest
	LaunchEvent \{Type = focus
		target = switch_to_enabled_profile_or_guest}
	printf \{qs(0x4dec4a44)}
endscript

script band_lobby_switch_to_enabled_profile_or_guest_close 
	if ScreenElementExists \{id = switch_to_enabled_profile_or_guest}
		destroy_dialog_box
	endif
	band_lobby_update_button_helpers
	band_lobby_change_focus_submenu_all \{focus_type = focus}
endscript

script band_lobby_switch_to_enabled_profile_or_guest_signin 
	printf qs(0x5fc606a4) d = <silver_guys_controller>
	printstruct <...>
	band_lobby_switch_to_enabled_profile_or_guest_close
	band_lobby_signin controller = <silver_guys_controller> forceui4
	printf \{qs(0x93333ca6)}
endscript

script band_lobby_switch_to_enabled_profile_or_guest_continue_as_guest 
	printf qs(0x95502f47) d = <silver_guys_controller>
	printstruct <...>
	band_lobby_switch_to_enabled_profile_or_guest_close
	band_lobby_call_signin_ui_from_popup func = showsigninui params = {convert_offline_to_guest} device_num = <silver_guys_controller>
	printf \{qs(0x44143a36)}
endscript

script band_lobby_switch_to_enabled_profile_or_guest_cancel 
	printf \{qs(0x35cd0bef)}
	printstruct <...>
	band_lobby_switch_to_enabled_profile_or_guest_close
	printf \{qs(0x680f4364)}
endscript

script band_lobby_attempt_to_join 
	RequireParams \{[
			viewport_index
			device_num
		]
		all}
	printf channel = band_lobby qs(0x965aa400) c = <device_num>
	RemoveParameter \{Player}
	if band_lobby_can_join_local controller = <device_num> submenu_index = <viewport_index> <...>
		NetSessionFunc func = addcontrollers params = {controller = <device_num>}
		if ininternetmode
			NetSessionFunc Obj = party func = add_local_player_to_party params = {controller_index = <device_num>}
			if NOT GotParam \{from_main_menu}
				band_lobby_change_menu menu = attempt_join action = forward Player = (<device_num> + 1) viewport_index = <viewport_index> no_forced focus = 0
			endif
		else
			band_lobby_join submenu_index = <viewport_index> device_num = <device_num> <...>
		endif
	endif
endscript

script band_lobby_join 
	RequireParams \{[
			submenu_index
			device_num
		]
		all}
	printf \{channel = band_lobby
		qs(0x0a9e37ad)}
	if band_lobby_can_join_local controller = <device_num> submenu_index = <submenu_index> <...>
		if is_roadie_battle_mode
			getplayerinfo \{1
				in_game}
			if (<in_game> = 0)
				Player = 1
			else
				Player = 2
			endif
			getwiicontrollertype controller = <device_num>
			if ((<controller_type> != guitar) && (<controller_type> != rb_guitar))
				return
			endif
			SpawnScriptNow ui_roadie_battle_spawn_controller_lights params = {Player = <Player> device_num = <device_num>}
		else
			Player = (<device_num> + 1)
		endif
		if CheckForSignIn controller_index = <device_num> dont_set_primary
			GetNetID controller_index = <device_num>
		else
			net_id_first = 0
			net_id_second = 0
		endif
		array = []
		AddArrayElement array = <array> element = <net_id_first>
		AddArrayElement array = <array> element = <net_id_second>
		band_lobby_get_is_guest device_num = <device_num>
		if ($g_leader_player_num = -1)
			local_primary_joining = 1
		endif
		band_lobby_add_player_to_playerinfo {
			player_type = local
			playerinfo = <Player>
			data = {
				controller = <device_num>
				user_id = <array>
			}
			local_primary_joining = <local_primary_joining>
		}
		if playerinfoequals <Player> part = vocals
			if playerinfoequals <Player> is_local_client = 1
				if NOT playerinfoequals <Player> mic_preference = None
					band_lobby_assign_mic Player = <playerinfo>
				else
					if NOT controller_has_headset controller = <device_num>
						band_lobby_set_mic_preference mic_preference = mic Player = <Player>
						band_lobby_assign_mic Player = <Player>
					endif
				endif
			endif
		endif
		session_stats_reset
		if ($g_leader_player_num = -1)
			band_lobby_change_band_leader Player = <Player> from_join
		endif
		band_lobby_get_submenu_data viewport_index = <submenu_index> param = occupied
		if (<submenu_data> = 1)
			printf \{qs(0xac7d58fd)}
			band_lobby_find_available_submenu_data
			if (<submenu_data_index> = -1)
				ScriptAssert \{qs(0x18b28ce3)}
			else
				printf qs(0x9fbb135b) d = <submenu_data_index>
				band_lobby_get_submenu_data viewport_index = <submenu_index> param = Player
				xuid = [0 0]
				getplayerinfo <submenu_data> net_id_first
				getplayerinfo <submenu_data> net_id_second
				SetArrayElement ArrayName = array index = 0 NewValue = <net_id_first>
				SetArrayElement ArrayName = array index = 1 NewValue = <net_id_second>
				band_lobby_update_submenu_data submenu_index = <submenu_data_index> element = Player value = <submenu_data>
				band_lobby_update_submenu_data submenu_index = <submenu_data_index> element = occupied value = 1
				band_lobby_update_submenu_data submenu_index = <submenu_data_index> element = net_id value = <array>
				if ((isps3) || (isngc))
					getplayerinfo <submenu_data> gamertag
					band_lobby_get_submenu_data_new submenu_index = <submenu_data_index> param = gamertag_checksum
					Change GlobalName = <gamertag_checksum> NewValue = ($<gamertag>)
				endif
				if (<submenu_data_index> < $g_num_lobby_local_submenus)
					setplayerinfo <submenu_data> controller = <submenu_data_index>
					band_lobby_change_menu menu = remote_player no_forced viewport_index = <submenu_data_index> action = forward Player = <submenu_data>
				endif
			endif
		endif
		band_lobby_update_submenu_data submenu_index = <submenu_index> element = Player value = <Player>
		band_lobby_update_submenu_data submenu_index = <submenu_index> element = occupied value = 1
		band_lobby_update_submenu_data submenu_index = <submenu_index> element = net_id value = <array>
		if ((isps3) || (isngc))
			getplayerinfo <Player> gamertag
			band_lobby_get_submenu_data viewport_index = <submenu_index> param = gamertag_checksum
			Change GlobalName = <submenu_data> NewValue = ($<gamertag>)
		endif
		band_lobby_refresh_band_leader_characters \{no_refresh}
		persistent_band_refresh_changed_characters
		if NOT GotParam \{from_main_menu}
			band_lobby_join_continue_to_next_menu {
				device_num = <device_num>
				Player = <Player>
				viewport_index = <submenu_index>
			}
		endif
		load_saved_extras_states_for_player Player = <Player> controller = <device_num> leader = ($g_leader_player_num)
	else
		band_lobby_get_submenu_data_new submenu_index = <device_num> param = menu
		if (<menu> = attempt_join)
			NetSessionFunc func = removecontroller params = {controller = <device_num>}
			band_lobby_flash_ticker_msg \{msg_checksum = failed_to_join_session
				time = 3}
			band_lobby_change_menu menu = join action = back Player = (<device_num> + 1) viewport_index = <submenu_index> no_forced focus = 1
		endif
	endif
endscript

script band_lobby_failed_join 
	RequireParams \{[
			controller
		]
		all}
	printf \{channel = band_lobby
		qs(0x3f69d58e)}
	sdcardmanagerfunc \{func = net_hold_ejects
		OFF}
	band_lobby_get_submenu_data_new submenu_index = <controller> param = menu
	if (<menu> = attempt_join)
		NetSessionFunc func = removecontroller params = {controller = <controller>}
		band_lobby_flash_ticker_msg \{msg_checksum = failed_to_join_session
			time = 3}
		band_lobby_change_menu menu = join action = back Player = (<controller> + 1) viewport_index = <controller> no_forced focus = 1
	endif
endscript

script band_lobby_can_join_local 
	RequireParams \{[
			controller
			submenu_index
		]
		all}
	printf \{channel = band_lobby
		qs(0x944b9a6c)}
	if (<controller> > 3)
		band_lobby_update_ticker \{msg_checksum = controller_limit}
		return \{FALSE
			error = ps3_controller_limit}
	endif
	band_lobby_get_is_guest device_num = <controller>
	if ininternetmode
		if band_lobby_are_remote_players_in_game
			if NOT CheckForSignIn controller_index = <controller> dont_set_primary
				if NOT GotParam \{from_main_menu}
					SpawnScriptNow band_lobby_switch_to_enabled_profile_or_guest_start params = {silver_guys_controller = <controller>}
				endif
				return \{FALSE
					error = no_online_privileges}
			elseif NOT NetSessionFunc func = ismultiplayerallowed params = {controller_index = <device_num>}
				if NOT GotParam \{from_main_menu}
					SpawnScriptNow band_lobby_switch_to_enabled_profile_or_guest_start params = {silver_guys_controller = <controller> allow_continue_as_guest}
				endif
				return \{FALSE
					error = no_online_privileges}
			elseif (<is_guest> = 1)
				if NOT band_lobby_live_profile_ingame \{multiplayer_enabled}
					band_lobby_flash_ticker_msg \{msg_checksum = no_live_profile_in_game
						time = 5}
					return \{FALSE
						error = no_live_profile_in_game}
				endif
			endif
		else
			join_reaction = None
			if CheckForSignIn controller_index = <device_num> dont_set_primary
				if NOT NetSessionFunc func = ismultiplayerallowed params = {controller_index = <controller>}
					if ($g_lobby_invite_flag = 1)
						join_reaction = show_change_msg
					else
						join_reaction = change_network
					endif
				endif
			else
				if ($g_lobby_invite_flag = 1)
					join_reaction = show_change_msg
				else
					join_reaction = change_network
				endif
			endif
			if (<join_reaction> != None)
				if (<join_reaction> = change_network)
					band_lobby_change_network Player = ($g_leader_player_num) network = local focus = 0
				else
					if band_lobby_live_profile_ingame \{multiplayer_enabled}
						if CheckForSignIn local controller_index = <device_num> dont_set_primary
							msg_checksum = invite_sent_change_profile
						else
							msg_checksum = invite_sent_signin_profile
						endif
					else
						msg_checksum = invite_sent_signin_profile
					endif
					if band_lobby_desc_id :desc_resolvealias \{Name = alias_pu_cont_parent}
						band_lobby_create_popup_menu {
							menu = change_profile
							controller = <controller>
							container = <resolved_id>
							msg_checksum = <msg_checksum>
							viewport_index = <submenu_index>
						}
					endif
					return \{FALSE}
				endif
			endif
		endif
	endif
	if is_roadie_battle_mode
		Player = 1
		begin
		getplayerinfo <Player> controller out = player_controller
		if (<player_controller> = <controller>)
			break
		endif
		<Player> = (<Player> + 1)
		repeat 4
		getwiicontrollertype controller = <controller>
		if ((<controller_type> != guitar) && (<controller_type> != rb_guitar))
			return \{FALSE}
		endif
		if playerinfoequals <Player> in_game = 1
			printstruct <...>
			band_lobby_update_ticker \{msg_checksum = game_full}
			return \{FALSE
				error = no_available_playerinfo}
		endif
	else
		if playerinfoequals (<controller> + 1) in_game = 1
			band_lobby_flash_ticker_msg \{msg_checksum = game_full
				time = 5}
			return \{FALSE
				error = no_available_playerinfo}
		endif
	endif
	return \{true}
endscript

script band_lobby_join_continue_to_next_menu \{attempt_savegame_stuff = true}
	RequireParams \{[
			device_num
			Player
			viewport_index
		]
		all}
	band_lobby_kick_leader_out_of_band_manage
	band_lobby_update_player_viewport_assignments
	if band_lobby_controller_can_save controller = <device_num>
		load_savegame = 1
	endif
	if ((isps3) || (isngc))
		RemoveParameter \{load_savegame}
	endif
	get_savegame_from_controller controller = <device_num>
	if get_savegame_has_saved_game savegame = <savegame>
		RemoveParameter \{load_savegame}
	endif
	if NOT is_autosave_on savegame = <savegame>
		RemoveParameter \{load_savegame}
	endif
	if (<attempt_savegame_stuff> = FALSE)
		RemoveParameter \{load_savegame}
	endif
	if GotParam \{load_savegame}
		band_lobby_change_menu menu = mc_checking action = forward Player = <Player> viewport_index = <viewport_index> focus = 0 no_forced
		savegame_async_button_in savegame = <savegame> callback = lobby_mc_loading_callback data = {
			Player = <Player>
			viewport_index = <viewport_index>
			controller = <device_num>
		}
	else
		if band_lobby_does_popup_exist
			band_lobby_change_menu menu = main action = forward Player = <Player> viewport_index = <viewport_index> focus = 0
		else
			band_lobby_change_menu menu = main action = forward Player = <Player> viewport_index = <viewport_index>
		endif
	endif
	band_lobby_update_button_helpers
endscript

script band_lobby_get_is_guest 
	if isxenonorwindx
		if NetSessionFunc func = xenonisguest params = {controller_index = <device_num>}
			return \{is_guest = 1}
		else
			return \{is_guest = 0}
		endif
	else
		return \{is_guest = 0}
	endif
endscript

script band_lobby_add_player_to_playerinfo_local 
	printf \{channel = band_lobby
		qs(0x5600c7de)}
	RequireParams \{[
			playerinfo
			controller
			part
			is_local
		]
		all}
	get_progression_instrument_user_option controller = <controller> option = 'guitar_bass_flip'
	guitar_bass_flip = <user_option>
	if is_roadie_battle_mode
		<guitar_bass_flip> = guitar
	endif
	switch <part>
		case guitar
		case bass
		switch (<guitar_bass_flip>)
			case guitar
			part = guitar
			get_progression_instrument_user_option controller = <controller> part = guitar option = 'difficulty'
			difficulty = <user_option>
			case bass
			part = bass
			get_progression_instrument_user_option controller = <controller> part = bass option = 'difficulty'
			difficulty = <user_option>
			case None
			part = guitar
			get_progression_instrument_user_option controller = <controller> part = guitar option = 'difficulty'
			difficulty = <user_option>
		endswitch
		get_progression_instrument_user_option controller = <controller> part = <part> option = 'lefty_flip'
		if (<user_option> = -1)
			setplayerinfo <playerinfo> lefty_flip = 0
		else
			setplayerinfo <playerinfo> lefty_flip = <user_option>
		endif
		case drum
		get_progression_instrument_user_option controller = <controller> part = drum option = 'difficulty'
		difficulty = <user_option>
		get_progression_instrument_user_option controller = <controller> part = drum option = 'double_kick_drum'
		double_kick_drum = <user_option>
		setplayerinfo <playerinfo> double_kick_drum = <double_kick_drum>
		get_progression_instrument_user_option controller = <controller> part = drum option = 'lefty_flip'
		if (<user_option> = -1)
			setplayerinfo <playerinfo> lefty_flip = 0
		else
			setplayerinfo <playerinfo> lefty_flip = <user_option>
		endif
		case vocals
		get_progression_instrument_user_option controller = <controller> part = vocals option = 'difficulty'
		difficulty = <user_option>
		get_progression_instrument_user_option controller = <controller> part = vocals option = 'mic_preference'
		setplayerinfo <playerinfo> mic_preference = <user_option>
		setplayerinfo <playerinfo> lobby_mic_valid = 0
		get_progression_instrument_user_option controller = <controller> part = vocals option = 'highway_view'
		setplayerinfo <playerinfo> vocals_highway_view = <user_option>
		band_lobby_sync_highway_view Player = <playerinfo>
		default
		ScriptAssert \{qs(0x6825c4a2)}
	endswitch
	if (<difficulty> = None)
		setplayerinfo <playerinfo> difficulty = ($default_difficulty [<controller>])
	else
		setplayerinfo <playerinfo> difficulty = <difficulty>
	endif
	if ((isps3) || (isngc))
		if GotParam \{local_primary_joining}
			band_lobby_switch_characters_for_ps3_at_join Player = <playerinfo> controller = <controller>
		endif
	endif
	get_savegame_from_controller controller = <controller>
	if (<playerinfo> <= 4)
		getplayerinfo <playerinfo> part out = old_part
		if (<old_part> != <part>)
			setplayerinfo <playerinfo> is_local_client = <is_local>
			setplayerinfo <playerinfo> in_game = 1
			band_lobby_handle_character_swap {
				Player = <playerinfo>
				old_part = <old_part>
				new_part = <part>
				no_refresh
			}
		endif
		band_lobby_local_join_get_character_id savegame = <savegame> playerinfo = <playerinfo> local_primary_joining = <local_primary_joining>
		setplayerinfo <playerinfo> character_id = <character_id>
		setplayerinfo <playerinfo> character_savegame = <character_savegame>
		setplayerinfo <playerinfo> stored_character_index = <stored_character_index>
	endif
	return part = <part>
endscript

script band_lobby_add_player_to_playerinfo 
	RequireParams \{[
			player_type
			data
		]}
	printf \{channel = band_lobby
		qs(0xd8cbcdba)}
	if (<player_type> = party)
		net_id_first = (<data>.user_id [0])
		net_id_second = (<data>.user_id [1])
		is_local = (<data>.is_local)
		controller = (<data>.controller_index)
		party_id = (<data>.party_id)
		if (<is_local> = 1)
			find_available_playerinfo player_type = party_local controller_index = <controller>
		else
			find_available_playerinfo \{player_type = party_remote}
		endif
		if (<playerinfo> = -1)
			ScriptAssert \{qs(0x1382536d)}
		endif
		setplayerinfo <playerinfo> in_game = 1
		switch (<data>.instrument)
			case eguitar
			part = guitar
			case emicrophone
			part = vocals
			case edrums
			part = drum
			default
			ScriptAssert \{qs(0x5cbdd6e9)}
			part = guitar
		endswitch
		formatText checksumName = gamertag 'gamertag_%d' d = (<playerinfo> - 1)
		Change GlobalName = <gamertag> NewValue = (<data>.gamertag)
		if (<is_local> = 1)
			band_lobby_add_player_to_playerinfo_local {
				playerinfo = <playerinfo>
				controller = <controller>
				part = <part>
				local_primary_joining = <local_primary_joining>
				is_local = <is_local>
			}
		else
			persistent_band_get_unused_musician
			if (<unused_musician> != None)
				setplayerinfo <playerinfo> band_member = <unused_musician>
			endif
		endif
	elseif (<player_type> = local)
		net_id_first = (<data>.user_id [0])
		net_id_second = (<data>.user_id [1])
		is_local = 1
		controller = (<data>.controller)
		if IsGuitarController controller = <controller>
			part = guitar
		elseif isdrumcontroller controller = <controller>
			part = drum
		else
			if ($allow_controller_for_all_instruments = 1)
				part = guitar
			else
				part = vocals
			endif
		endif
		band_lobby_add_player_to_playerinfo_local {
			playerinfo = <playerinfo>
			controller = <controller>
			part = <part>
			local_primary_joining = <local_primary_joining>
			is_local = <is_local>
		}
		formatText checksumName = gamertag 'gamertag_%d' d = (<playerinfo> - 1)
		if isxenonorwindx
			NetSessionFunc Obj = match func = get_gamertag params = {controller = <controller>}
		else
			if NOT NetSessionFunc Obj = match func = get_gamertag params = {controller = <controller>}
				Name = qs(0x00000000)
			endif
		endif
		Change GlobalName = <gamertag> NewValue = <Name>
		if NOT band_lobby_get_party_id_by_user_id user_id = (<data>.user_id) gamertag = <Name>
			party_id = -1
		endif
	endif
	setplayerinfo <playerinfo> gamertag = <gamertag>
	setplayerinfo <playerinfo> part = <part>
	setplayerinfo <playerinfo> is_local_client = <is_local>
	setplayerinfo <playerinfo> in_game = 1
	setplayerinfo <playerinfo> net_id_first = <net_id_first>
	setplayerinfo <playerinfo> net_id_second = <net_id_second>
	setplayerinfo <playerinfo> controller = <controller>
	setplayerinfo <playerinfo> party_id = <party_id>
	setplayerinfo <playerinfo> is_onscreen = 1
	if is_roadie_battle_mode
		if playerinfoequals <playerinfo> difficulty = beginner
			setplayerinfo <playerinfo> difficulty = easy
		endif
	endif
	if (<part> = drum)
		usefourlanehighway Player = <playerinfo> reset
	endif
	return playerinfo = <playerinfo>
endscript

script band_lobby_local_join_get_character_id 
	RequireParams \{[
			savegame
			playerinfo
		]
		all}
	getplayerinfo <playerinfo> character_id out = existing_character_id
	getplayerinfo <playerinfo> character_savegame out = existing_character_savegame
	getplayerinfo <playerinfo> stored_character_index out = existing_stored_character_index
	if ((isps3) || (isngc))
		get_saved_band_member index = <existing_stored_character_index> savegame = 0
		return {
			character_id = <character_id>
			character_savegame = <character_savegame>
			stored_character_index = <existing_stored_character_index>
		}
	else
		get_saved_band_member index = 0 savegame = <savegame>
		if (<user_changed> = 0)
			if GotParam \{local_primary_joining}
				existing_character_id = <character_id>
				existing_character_savegame = <character_savegame>
			endif
			globaltag_fix_band_member0_at_join {
				savegame = <savegame>
				existing_character_id = <existing_character_id>
				existing_character_savegame = <existing_character_savegame>
				existing_stored_character_index = <existing_stored_character_index>
			}
			return {
				character_id = <character_id>
				character_savegame = <character_savegame>
				stored_character_index = 0
			}
		else
			return {
				character_id = <character_id>
				character_savegame = <character_savegame>
				stored_character_index = 0
			}
		endif
	endif
endscript

script band_lobby_assign_mic 
	RequireParams \{[
			Player
		]
		all}
	getplayerinfo <Player> mic_preference
	if (<mic_preference> = None)
		SoftAssert \{qs(0xf47713fc)}
	endif
endscript

script band_lobby_vocals_destroy_icon_update 
	Obj_KillSpawnedScript \{Name = band_lobby_vocals_icon_update}
	se_setprops \{rgba = [
			255
			255
			255
			255
		]}
	Obj_GetID
	GetScreenElementChildren id = <objID>
	invalid_icon_id = (<children> [0])
	<invalid_icon_id> :se_setprops {
		alpha = 0
	}
endscript

script band_lobby_update_mics 
	vocals_reinit_mics noise_gate = ($band_lobby_noise_gate)
	begin
	vocals_distribute_mics \{only_preferences = 1
		invalidate_bogus_mics = 0}
	if (<distribution_changed> = true)
		vocals_reinit_mics noise_gate = ($band_lobby_noise_gate)
	endif
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		if playerinfoequals <Player> part = vocals
			if playerinfoequals <Player> is_local_client = 1
				mic_valid = 1
				if playerinfoequals <Player> mic_type = headset
					if isXenon
						NetSessionFunc \{Obj = plat_party
							func = get_num_party_players}
						if (<num_plat_party_players> > 0)
							mic_valid = 0
						endif
					endif
				endif
				if NOT vocals_player_has_mic Player = <Player>
					mic_valid = 0
				endif
				setplayerinfo <Player> lobby_mic_valid = <mic_valid>
			endif
		endif
		getnextplayer Player = <Player> on_screen
		repeat <num_players_shown>
	endif
	Wait \{1
		Second}
	repeat
endscript

script band_lobby_vocals_icon_update 
	RequireParams \{[
			submenu_index
		]
		all}
	Obj_GetID
	GetScreenElementChildren id = <objID>
	invalid_icon_id = (<children> [0])
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <submenu_index>
	begin
	Player = ($<submenu_data>.Player)
	getplayerinfo <Player> mic_preference
	getplayerinfo <Player> mic_type
	switch <mic_preference>
		case headset
		icon_texture = logo_headset
		case None
		icon_texture = mixer_icon_vox
		default
		icon_texture = mixer_icon_vox
	endswitch
	band_lobby_get_player_color viewport = <submenu_index>
	rgba = <rgba_md>
	if playerinfoequals <Player> is_local_client = 1
		getplayerinfo <Player> controller
		vocals_getmicamplitude controller = <controller>
		if (<amplitude> > ($band_lobby_noise_gate))
			rgba = [255 0 0 255]
		endif
	endif
	se_setprops {
		texture = <icon_texture>
		rgba = <rgba>
	}
	Wait \{1
		gameframe}
	repeat
endscript

script band_lobby_controller_connected_update 
	RequireParams \{[
			submenu_index
		]
		all}
	Obj_GetID
	GetScreenElementChildren id = <objID>
	invalid_icon_id = (<children> [0])
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <submenu_index>
	begin
	Player = ($<submenu_data>.Player)
	invalid_alpha = 0
	if ((($<submenu_data>.occupied) = 1) && ($roadie_battle_ds_disconnect_popup_visible = 0))
		if playerinfoequals <Player> is_local_client = 1
			getplayerinfo <Player> controller
			if NOT iscontrollerpluggedin controller = <controller>
				invalid_alpha = 1
			elseif NOT band_lobby_check_single_controller Player = <Player>
				if NOT InNetGame
					NetSessionFunc Obj = party func = update_game_data params = {controller_index = <controller>}
					band_lobby_update_part_to_match_controller submenu_index = <submenu_index>
					return
				endif
			elseif playerinfoequals <Player> part = vocals
				band_lobby_set_mic_preference mic_preference = mic Player = <Player>
				getplayerinfo <Player> mic_preference
				getplayerinfo <Player> mic_type
				getplayerinfo <Player> lobby_mic_valid
				if (<mic_type> = None || <mic_preference> = None || <lobby_mic_valid> = 0)
					invalid_alpha = 1
				endif
			endif
		endif
	endif
	<invalid_icon_id> :se_setprops {
		alpha = <invalid_alpha>
	}
	Wait \{1
		gameframe}
	repeat
endscript

script band_lobby_signin 
	RequireParams \{[
			controller
		]
		all}
	printf channel = band_lobby qs(0x7cd060bd) d = <controller>
	Change \{respond_to_signin_changed_func = band_lobby_signin_changed}
	band_lobby_desc_id :se_setprops \{block_events}
	if isxenonorwindx
		call_blade = 0
		if NOT GotParam \{func}
			if (CheckForSignIn local controller_index = <controller>)
				if NOT (CheckForSignIn controller_index = <controller>)
					func = showsigninui
					params = {convert_offline_to_guest}
					call_blade = 1
				endif
				if GotParam \{forceui4}
					func = showsigninui4pane
					params = {online_only}
					call_blade = 1
				else
					if NOT NetSessionFunc func = ismultiplayerallowed params = {controller_index = <controller>}
						func = showsigninui4pane
						params = {online_only}
						call_blade = 1
					endif
				endif
			else
				func = showsigninui4pane
				params = {online_only}
				call_blade = 1
			endif
		else
			call_blade = 1
		endif
		if (<call_blade> = 1)
			NetSessionFunc func = <func> params = <params>
			band_lobby_update_ticker \{msg_checksum = signin_waiting}
			wait_for_blade_complete
		endif
	elseif isps3
		if NOT CheckForSignIn controller_index = <controller>
			Change \{ps3_signin_complete = 0}
			NetSessionFunc \{func = OnlineSignIn
				params = {
					callback = signin_complete_callback
				}}
			wait_for_blade_complete
		endif
		band_lobby_set_gamertag_strings controller = <controller>
	else
		ScriptAssert \{qs(0x0c85b718)}
	endif
	Change \{respond_to_signin_changed_func = band_lobby_signin_changed}
	band_lobby_desc_id :se_setprops \{unblock_events}
	band_lobby_update_ticker \{msg_checksum = current_state}
endscript

script band_lobby_signin_changed 
	printf \{channel = band_lobby
		qs(0x5cbab501)}
	if ScreenElementExists \{id = band_lobby_desc_id}
		band_lobby_desc_id :se_setprops \{unblock_events}
		band_lobby_update_ticker \{msg_checksum = current_state}
	endif
	if ininternetmode
		if InNetGame
			handle_signin_changed
			return
		else
			getplayerinfo ($g_leader_player_num) controller out = leader_controller
			if (<leader_controller> = <controller>)
				if band_lobby_are_remote_players_in_game
					handle_signin_changed
					return
				else
					band_lobby_change_network Player = ($g_leader_player_num) network = local focus = 0
					band_lobby_refresh_all_submenus \{Type = not_in_game}
				endif
			endif
		endif
	endif
	ui_event_get_top
	if (<base_name> = 'mic_binding')
		mic_binding_end
	elseif (<base_name> != 'band_lobby')
		generic_event_back
	endif
	if band_lobby_does_popup_exist
		band_lobby_destroy_popup_menu
	endif
	ui_signin_changed_func controller = <controller>
	found_player = 0
	i = 0
	begin
	band_lobby_get_submenu_data viewport_index = <i> param = Player
	Player = <submenu_data>
	getplayerinfo <Player> controller out = temp_controller
	getplayerinfo <Player> is_local_client
	if ((<temp_controller> = <controller>) && (1 = <is_local_client>))
		found_player = 1
		band_lobby_wait_for_menu_change
		if band_lobby_has_managed_submenu
			band_lobby_manage_band_members action = deselect Player = ($g_leader_player_num) viewport_index = <managed_submenu>
		endif
		band_lobby_wait_for_menu_change
		band_lobby_get_submenu_data viewport_index = <i> param = occupied
		occupied = <submenu_data>
		if (<occupied> = 1)
			band_lobby_clear_submenu_data submenu_data_index = <i>
			setplayerinfo <Player> in_game = 0
			NetSessionFunc func = removecontroller params = {controller = <controller>}
			if NOT NetSessionFunc \{Obj = party
					func = is_host}
				NetSessionFunc {
					Obj = party
					func = remove_playr_from_party
					params = {
						controller_index = <controller>
					}
				}
			endif
			action = back
			if ($g_leader_player_num = <Player>)
				if band_lobby_desc_id :desc_resolvealias \{Name = alias_band_viewport_vmenu}
					if isscreenelementinfocus id = <resolved_id>
						band_lobby_band_memebers_back viewport_index = <i>
					endif
				endif
				band_lobby_lost_band_leader
			endif
			setplayerinfo <Player> chosen_character_id = None
			setplayerinfo <Player> chosen_character_savegame = -1
			($band_lobby_viewport_menus [<i>]) :Obj_SpawnScriptNow band_lobby_change_menu params = {action = back menu = join Player = <Player> viewport_index = <i>}
			band_lobby_update_button_helpers
			return
		endif
		break
	endif
	i = (<i> + 1)
	repeat ($g_num_lobby_local_submenus)
	if (<found_player> = 1)
		if ScreenElementExists id = ($band_lobby_viewport_menus [<i>])
			($band_lobby_viewport_menus [<i>]) :Obj_SpawnScriptNow band_lobby_change_menu params = {action = forward menu = join Player = <Player> viewport_index = <i>}
		endif
	endif
endscript

script band_lobby_set_gamertag_strings 
	RequireParams \{[
			controller
		]
		all}
	printf \{channel = band_lobby
		qs(0xd6368250)}
	if CheckForSignIn controller_index = <controller>
		i = 0
		begin
		formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <i>
		if (($<submenu_data>.occupied) = 1)
			getplayerinfo ($<submenu_data>.Player) controller
			getplayerinfo ($<submenu_data>.Player) gamertag
			if NOT NetSessionFunc Obj = match func = get_gamertag params = {controller = <controller>}
				Name = qs(0x00000000)
			endif
			Change GlobalName = <gamertag> NewValue = <Name>
			Change GlobalName = ($<submenu_data>.gamertag_checksum) NewValue = <Name>
		endif
		i = (<i> + 1)
		repeat ($g_num_lobby_local_submenus)
	endif
endscript

script band_lobby_drop_player 
	printf \{channel = band_lobby
		qs(0xd897fbb0)}
	printstruct <...>
	if (<is_game_over> = 0)
		i = 0
		begin
		formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <i>
		if (<dropped_player_num> = ($<submenu_data>.Player))
			if (($<submenu_data>.occupied) = 1)
				band_lobby_clear_submenu_data submenu_data_index = <i>
				if ScreenElementExists id = ($band_lobby_viewport_menus [<i>])
					($band_lobby_viewport_menus [<i>]) :Obj_SpawnScriptNow band_lobby_change_menu params = {action = back menu = empty Player = (<i> + 1) viewport_index = <i> focus = 0}
				endif
				break
			endif
		endif
		i = (<i> + 1)
		repeat ($g_num_lobby_local_submenus)
		common_net_player_cleanup player_num = <dropped_player_num>
		Change net_dropped_players_flag = (($net_dropped_players_flag) + 1)
		switch <drop_reason>
			case net_message_player_kicked
			formatText TextName = drop_msg qs(0x7adab19b) s = <name_string>
			case net_message_player_quit
			formatText TextName = drop_msg qs(0xafcc55cd) s = <name_string>
			case net_message_player_dropped
			case net_message_player_timed_out
			formatText TextName = drop_msg qs(0xc11e11da) s = <name_string>
			default
			drop_msg = qs(0x00000000)
		endswitch
		getnumplayersingame \{local}
		num_local_players = <num_players>
		getnumplayersingame
		if (<num_local_players> = <num_players>)
			band_lobby_end_game <...>
		else
			if ScreenElementExists \{id = band_lobby_desc_id}
				add_dropped_player_to_dialog_box parent = band_lobby_desc_id msg_text = <drop_msg>
			endif
		endif
	endif
endscript

script band_lobby_end_game 
	printf \{channel = band_lobby
		qs(0xda78fc3b)}
	band_lobby_change_focus_submenu_all \{focus_type = unfocus}
	switch <drop_reason>
		case net_message_player_kicked
		formatText TextName = drop_msg qs(0x7adab19b) s = <name_string>
		getnumplayersingame \{local}
		if (<num_players> > 0)
			getfirstplayer \{local}
			begin
			if (<Player> = <dropped_player_num>)
				formatText \{TextName = first_msg
					qs(0xbfe89076)}
				break
			endif
			getnextplayer Player = <Player> local
			repeat <num_players>
		endif
		case net_message_player_quit
		formatText TextName = first_msg qs(0x567f10d8) s = <name_string>
		case net_message_player_dropped
		case net_message_player_timed_out
		formatText TextName = first_msg qs(0xd4b272d7) s = <name_string>
		default
		first_msg = qs(0x00000000)
	endswitch
	formatText TextName = msg qs(0x78bb855f) s = <first_msg>
	create_net_popup title = qs(0x5ca2c535) popup_text = <msg>
	if ScreenElementExists \{id = dialog_box_desc_id}
		dialog_box_desc_id :se_setprops \{z_priority = 1500.2}
		dialog_box_desc_id :Obj_SpawnScriptNow \{band_lobby_end_game_spawned
			id = not_ui_player_drop_scripts}
	endif
	band_lobby_desc_id :Obj_KillSpawnedScript \{Name = band_lobby_display_final_matchmaking_players}
endscript

script band_lobby_end_game_spawned 
	Wait \{3
		Seconds}
	destroy_net_popup
	quit_network_game
	band_lobby_restore_prematchmaking_settings
	ui_event \{event = menu_back
		data = {
			state = uistate_band_lobby_setup
		}}
endscript

script band_lobby_change_lobby 
	RequireParams \{[
			Player
			viewport_index
			lobby
			action
		]
		all}
	printf channel = band_lobby qs(0x2761e008) c = <viewport_index> d = <Player>
	Change g_lobby_state = <lobby>
	band_lobby_set_gamemode_by_state lobby = ($g_lobby_state)
	if NOT ($g_lobby_net_state = local)
		band_lobby_set_party_joiner_mode
		band_lobby_set_party_joinable
	endif
	band_lobby_update_lobby_title
	band_lobby_update_button_helpers
	band_lobby_update_ticker \{msg_checksum = current_state}
	band_lobby_change_menu menu = main action = <action> Player = <Player> viewport_index = <viewport_index>
endscript

script band_lobby_set_gamemode_by_state 
	RequireParams \{[
			lobby
		]
		all}
	if (<lobby> = vs)
		if ($game_mode = roadie_battle)
		elseif ($competitive_rules = solo_fest_mode)
			Change \{game_mode = fest_mode}
		elseif ($competitive_rules = team_fest_mode)
			Change \{game_mode = fest_mode_team}
		else
			rules = ($competitive_rules)
			if (($<rules>.team) = 1)
				Change \{game_mode = compmega_team}
			else
				Change \{game_mode = compmega}
			endif
		endif
	elseif (<lobby> = career)
		Change \{game_mode = career}
	elseif (<lobby> = quickplay)
		Change \{game_mode = p4_quickplay}
	endif
	if (<lobby> != career)
		if (GMan_GoalIsActive goal = career)
			gman_deactivategoal \{goal = career}
		endif
	endif
	if (<lobby> != vs)
		session_stats_reset
	endif
endscript

script band_lobby_choose_gamemmode 
	RequireParams \{[
			game_mode
		]
		all}
	if ((<game_mode> = quickplay_traditional) || (<game_mode> = quickplay_mixed))
		return
	endif
	if (
			(<game_mode> = solo_fest_mode) ||
			(<game_mode> = team_fest_mode)
		)
	endif
	Change game_mode = <game_mode>
	Change g_copy_game_mode = <game_mode>
	if GotParam \{rules}
		Change competitive_rules = <rules>
	endif
	band_lobby_update_lobby_title
	band_lobby_update_button_helpers
	band_lobby_change_menu menu = main action = <action> Player = <Player> viewport_index = <viewport_index>
endscript

script band_lobby_change_network \{focus = 1}
	RequireParams \{[
			Player
			network
		]
		all}
	printf \{channel = band_lobby
		qs(0x70172cac)}
	if GotParam \{viewport_index}
		submenu_index = <viewport_index>
	endif
	if (($g_lobby_net_state = local) && ((<network> = net_private) || (<network> = net_public)))
		if band_lobby_check_if_all_players_are_online_enabled
			if (<focus> = 1)
				band_lobby_change_focus_submenu_all \{focus_type = unfocus}
			endif
			band_lobby_update_ticker \{msg_checksum = update_net}
			Change g_lobby_net_state = <network>
			if (<network> = net_public)
				if ($game_mode = compmega && $competitive_rules != team_faceoff && $competitive_rules != faceoff)
					Change \{game_mode = fest_mode}
					Change \{competitive_rules = solo_fest_mode}
				endif
			endif
			band_lobby_update_lobby_title
			band_lobby_ensure_primary_controller_is_signed_in
			if NOT band_lobby_net_setup
				Change \{g_lobby_net_state = local}
				band_lobby_update_lobby_title
				band_lobby_update_button_helpers
			endif
			band_lobby_update_ticker \{msg_checksum = current_state}
			if (<focus> = 1)
				band_lobby_change_focus_submenu_all \{focus_type = focus}
			endif
		else
			band_lobby_update_ticker \{msg_checksum = players_not_live_enabled}
		endif
	elseif ((<network> = local) && (($g_lobby_net_state = net_private) || ($g_lobby_net_state = net_public)))
		if (<focus> = 1)
			band_lobby_change_focus_submenu_all \{focus_type = unfocus}
		endif
		band_lobby_update_ticker \{msg_checksum = update_net}
		Change g_lobby_net_state = <network>
		band_lobby_update_lobby_title
		band_lobby_net_cleanup
		NetSessionFunc \{func = match_init}
		NetSessionFunc \{func = friends_init}
		band_lobby_update_ticker \{msg_checksum = current_state}
		if (<focus> = 1)
			band_lobby_change_focus_submenu_all \{focus_type = focus}
		endif
	elseif (((<network> = net_private) && ($g_lobby_net_state = net_public)) || ((<network> = net_public) && ($g_lobby_net_state = net_private)))
		if (<focus> = 1)
			band_lobby_change_focus_submenu_all \{focus_type = unfocus}
		endif
		band_lobby_update_ticker \{msg_checksum = update_net}
		Change g_lobby_net_state = <network>
		if (
				(<network> = net_private) &&
				(
					($competitive_rules = solo_fest_mode) ||
					($competitive_rules = team_fest_mode)
				)
			)
			Change \{competitive_rules = faceoff}
			Change \{game_mode = compmega}
		endif
		band_lobby_update_lobby_title
		band_lobby_update_ticker \{msg_checksum = current_state}
		if (<focus> = 1)
			band_lobby_change_focus_submenu_all \{focus_type = focus}
		endif
	else
		Change g_lobby_net_state = <network>
		band_lobby_update_lobby_title
	endif
	if GotParam \{action}
		band_lobby_update_button_helpers
		band_lobby_change_menu menu = main action = <action> Player = <Player> viewport_index = <submenu_index>
	endif
endscript

script band_lobby_change_global 
	RequireParams \{[
			Player
			viewport_index
			menu
			action
			Global
			value
		]
		all}
	printf \{channel = band_lobby
		qs(0x99d0a9b9)}
	Change GlobalName = <Global> NewValue = <value>
	band_lobby_change_menu menu = <menu> action = <action> Player = <Player> viewport_index = <viewport_index>
endscript

script band_lobby_set_mic_preference 
	RequireParams \{[
			Player
			mic_preference
		]}
	setplayerinfo <Player> mic_preference = <mic_preference>
	getplayerinfo <Player> controller
	save_progression_instrument_user_option part = vocals controller = <controller> option = 'mic_preference' new_value = <mic_preference>
endscript

script band_lobby_set_mic_preference_menu 
	RequireParams \{[
			Player
			mic_preference
			action
			menu
		]
		all}
	band_lobby_set_mic_preference Player = <Player> mic_preference = <mic_preference>
	if GotParam \{no_forced}
		band_lobby_vocals_forced_menu Player = <Player> action = <action> previous_menu = forced_mic_preference viewport_index = <viewport_index>
	else
		band_lobby_change_menu menu = <menu> action = <action> Player = <Player> viewport_index = <viewport_index>
	endif
endscript

script band_lobby_change_playerinfo 
	RequireParams \{[
			Player
			viewport_index
			menu
			action
		]
		all}
	printf \{channel = band_lobby
		qs(0xdd3e9d04)}
	get_savegame_from_player Player = <Player>
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <viewport_index>
	if NOT GotParam \{character_id}
		if (<Player> != ($<submenu_data>.Player))
			ScriptAssert 'Logic is screwed up. Player %a != %b' a = <Player> b = ($<submenu_data>.Player)
		endif
	endif
	if GotParam \{difficulty}
		getplayerinfo <Player> controller
		getplayerinfo ($<submenu_data>.Player) part
		if (<part> = drum)
			if (<difficulty> = expert_plus)
				difficulty = expert
				double_kick_drum = 1
			else
				double_kick_drum = 0
			endif
			setplayerinfo ($<submenu_data>.Player) double_kick_drum = <double_kick_drum>
			get_progression_instrument_user_option part = drum controller = <controller> option = 'double_kick_drum'
			if (<difficulty> != <user_option>)
				band_lobby_set_dirty_save_flag Player = <Player> flag = 1
				save_progression_instrument_user_option part = drum controller = <controller> option = 'double_kick_drum' new_value = <double_kick_drum>
			endif
		endif
		setplayerinfo ($<submenu_data>.Player) difficulty = <difficulty> store
		get_progression_instrument_user_option part = <part> controller = <controller> option = 'difficulty'
		if (<difficulty> != <user_option>)
			band_lobby_set_dirty_save_flag Player = <Player> flag = 1
			save_progression_instrument_user_option part = <part> controller = <controller> option = 'difficulty' new_value = <difficulty>
		endif
	elseif GotParam \{character_id}
		RequireParams \{[
				character_savegame
			]
			all}
		if characterprofilegetcategory Name = <character_id>
			if (<profile_category> = temporary)
				ScriptAssert 'Should not be setting the character_id to %s' s = <character_id>
			endif
		endif
		setplayerinfo ($<submenu_data>.Player) character_id = <character_id> store
		setplayerinfo ($<submenu_data>.Player) character_savegame = <character_savegame> store
		getplayerinfo ($<submenu_data>.Player) stored_character_index
		new_character_id = <character_id>
		new_character_savegame = <character_savegame>
		get_saved_band_member index = <stored_character_index> savegame = <savegame>
		if (<character_id> != <new_character_id> || <character_savegame> != <new_character_savegame>)
			band_lobby_set_dirty_save_flag Player = <Player> flag = 1
			globaltag_save_band_member_choice index = <stored_character_index> character_id = <new_character_id> savegame = <savegame> character_savegame = <new_character_savegame>
		endif
		if is_roadie_battle_mode
			<Player> = ($<submenu_data>.Player)
			band_lobby_rockertext Player = <Player> viewport_index = (<Player> -1)
			formatText TextName = Name '%n' n = (<text_params>.a)
			wiidscommunication :sendmessage set_player_name player_number = ($<submenu_data>.Player) player_name = <Name>
		endif
	elseif GotParam \{lefty_flip}
		setplayerinfo ($<submenu_data>.Player) lefty_flip = <lefty_flip> store
		getplayerinfo <Player> controller
		getplayerinfo ($<submenu_data>.Player) part
		if (<part> = guitar || <part> = bass)
			get_progression_instrument_user_option part = guitar controller = <controller> option = 'lefty_flip'
			if (<lefty_flip> != <user_option>)
				save_progression_instrument_user_option part = guitar controller = <controller> option = 'lefty_flip' new_value = <lefty_flip>
			endif
			get_progression_instrument_user_option part = bass controller = <controller> option = 'lefty_flip'
			if (<lefty_flip> != <user_option>)
				save_progression_instrument_user_option part = bass controller = <controller> option = 'lefty_flip' new_value = <lefty_flip>
			endif
		elseif (<part> = drum)
			get_progression_instrument_user_option part = <part> controller = <controller> option = 'lefty_flip'
			if (<lefty_flip> != <user_option>)
				save_progression_instrument_user_option part = <part> controller = <controller> option = 'lefty_flip' new_value = <lefty_flip>
			endif
		else
			ScriptAssert \{'no lefty flip on vocals!'}
		endif
	elseif GotParam \{vocals_highway_view}
		band_lobby_set_vocals_highway_view Player = ($<submenu_data>.Player) vocals_highway_view = <vocals_highway_view>
		getplayerinfo <Player> controller
		getplayerinfo ($<submenu_data>.Player) part
		get_progression_instrument_user_option part = <part> controller = <controller> option = 'highway_view'
		if (<vocals_highway_view> != <user_option>)
			band_lobby_set_dirty_save_flag Player = <Player> flag = 1
			save_progression_instrument_user_option part = <part> controller = <controller> option = 'highway_view' new_value = <vocals_highway_view>
		endif
	elseif GotParam \{part}
		band_lobby_rocker_changed_player_part {
			part = <part>
			Player = <Player>
			viewport_index = <viewport_index>
		}
	endif
	persistent_band_refresh_changed_characters
	if GotParam \{vocals_forced_previous_menu}
		band_lobby_vocals_forced_menu Player = <Player> action = <action> previous_menu = <vocals_forced_previous_menu> viewport_index = <viewport_index>
	else
		if GotParam \{no_forced}
			band_lobby_change_menu menu = <menu> action = <action> Player = <Player> viewport_index = <viewport_index> no_forced
		else
			band_lobby_change_menu menu = <menu> action = <action> Player = <Player> viewport_index = <viewport_index>
		endif
	endif
	if ($g_career_search != NULL)
		set_player_temp_net_id_array Player = ($<submenu_data>.Player)
	endif
endscript

script band_lobby_change_menu \{focus = 1}
	RequireParams \{[
			menu
			Player
			viewport_index
			action
		]
		all}
	printf channel = band_lobby qs(0x3c595779) c = <viewport_index> d = <Player>
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <viewport_index>
	if ScreenElementExists id = ($band_lobby_viewport_menus [<viewport_index>])
		original_menu = <menu>
		if (<menu> = main)
			if ($<submenu_data>.is_managed = 1)
				menu = manage_member
				band_lobby_update_submenu_data submenu_index = <viewport_index> element = return_menu value = main
			else
				if (($g_leader_player_num = <Player>) && ($g_net_leader_player_num = <Player>))
					if is_roadie_battle_mode
						menu = band_leader_roadie_battle
					else
						if ($g_lobby_state = career)
							menu = band_leader_career
						elseif ($g_lobby_state = quickplay)
							menu = band_leader_quickplay
						else
							menu = band_leader_vs
						endif
					endif
				else
					if is_roadie_battle_mode
						menu = band_member_roadie_battle
					else
						menu = band_member
					endif
				endif
			endif
		elseif (<menu> = select_rocker)
			formatText checksumName = select_rocker 'select_rocker%i' i = <viewport_index>
			menu = <select_rocker>
		elseif (<menu> = select_outfit)
			formatText checksumName = select_outfit 'select_outfit%i' i = <viewport_index>
			menu = <select_outfit>
		elseif (<menu> = join)
			if freestyle_is_active
				if (<viewport_index> < 3)
					if ((($freestyle_player_data [<viewport_index>].player_type) = human))
						controller = ($freestyle_player_data [<viewport_index>].controller)
						orig_controller_type = ($freestyle_player_data [<viewport_index>].controller_type)
						getwiicontrollertype controller = <controller>
						if (<controller_type> = <orig_controller_type>)
							menu = freestyle_final
						endif
					endif
				endif
			endif
		endif
		if NOT GotParam \{no_forced}
			if band_lobby_get_forced_menu viewport_index = <viewport_index>
				<menu> = <forced_menu>
			endif
		endif
		($band_lobby_viewport_menus [<viewport_index>]) :menu_getselectedindex
		array = ($<submenu_data>.menu_indices)
		if (<action> = forward)
			focus_value = NULL
			default_index = 0
			menu_options = ($band_lobby_submenu_states.<menu>.options)
			if StructureContains structure = ($band_lobby_submenu_states.<menu>) focus_param
				band_lobby_get_focus_value Player = ($<submenu_data>.Player) viewport_index = <viewport_index> focus_param = ($band_lobby_submenu_states.<menu>.focus_param)
				GetArraySize \{menu_options}
				if (<array_Size> > 0)
					i = 0
					index = 0
					begin
					<option> = ($band_lobby_submenu_states.<menu>.options [<i>])
					if StructureContains structure = <option> condition
						<condition> = (<option>.condition)
						if <condition> Player = <Player> viewport_index = <viewport_index>
							if ((<menu_options> [<i>].checksum) = <focus_value>)
								break
							endif
							<index> = (<index> + 1)
						endif
					else
						if ((<menu_options> [<i>].checksum) = <focus_value>)
							break
						endif
						<index> = (<index> + 1)
					endif
					i = (<i> + 1)
					repeat <array_Size>
					default_index = <index>
				endif
			endif
			SetArrayElement ArrayName = array index = 2 NewValue = (<array> [1])
			SetArrayElement ArrayName = array index = 1 NewValue = <selected_index>
			SetArrayElement ArrayName = array index = 0 NewValue = <default_index>
		elseif (<action> = back)
			if (<menu> = join)
				SetArrayElement \{ArrayName = array
					index = 0
					NewValue = 0}
				SetArrayElement \{ArrayName = array
					index = 1
					NewValue = 0}
				SetArrayElement \{ArrayName = array
					index = 2
					NewValue = 0}
			else
				SetArrayElement ArrayName = array index = 0 NewValue = (<array> [1])
				SetArrayElement ArrayName = array index = 1 NewValue = (<array> [2])
				SetArrayElement \{ArrayName = array
					index = 2
					NewValue = 0}
			endif
		endif
		band_lobby_update_submenu_data submenu_index = <viewport_index> element = menu value = <menu>
		band_lobby_update_submenu_data submenu_index = <viewport_index> element = menu_indices value = <array>
		if GotParam \{reset_characters}
			setplayerinfo ($<submenu_data>.Player) chosen_character_id = None
			setplayerinfo ($<submenu_data>.Player) chosen_character_savegame = -1
			band_lobby_refresh_band_leader_characters \{no_refresh}
			persistent_band_refresh_changed_characters
		endif
		band_lobby_add_menu_update_to_queue submenu_index = <viewport_index> action = <action> focus = <focus> menu = <menu>
	endif
endscript

script band_lobby_net_setup 
	printf \{channel = band_lobby
		qs(0x3bdeb4db)}
	if ((isps3) || (isngc))
		xenon_singleplayer_session_init \{ps3_signin_callback = signin_complete_callback}
		begin
		if ($ps3_signin_complete = 1)
			break
		endif
		Wait \{1
			Frame}
		repeat
	endif
	net_init
	NetSessionFunc \{func = friends_init}
	if ((isps3) || (isngc))
		if NOT NetSessionFunc \{func = is_lobby_available}
			band_lobby_net_cleanup
			return \{FALSE}
		endif
		if ($DEMONWARE_IS_READY = 1)
			if ($demonware_stun_failed = 1)
				band_lobby_net_cleanup
				return \{FALSE}
			endif
		else
			band_lobby_net_cleanup
			return \{FALSE}
		endif
	endif
	NetSessionFunc \{func = match_uninit}
	NetSessionFunc \{func = match_init}
	if ($demonware_connection_success = 1)
		NetSessionFunc {
			Obj = party
			func = create_party_session
			params = {
				controller_index = ($primary_controller)
				callback = band_lobby_net_setup_party_callback
			}
		}
	endif
	return \{true}
endscript

script band_lobby_net_setup_party_callback 
	if (<success> = 1)
		NetSessionFunc \{Obj = party
			func = set_can_join_callback
			params = {
				callback = net_party_can_accept_new_players
			}}
		band_lobby_set_party_joiner_mode
		band_lobby_set_party_joinable
		band_lobby_add_in_game_players_to_party \{net_init}
		band_lobby_store_local_players_net_and_party_ids_in_playerinfo
		bl_store_local_player_net_ids_in_submenu_data
		band_lobby_poll_party_object
	else
	endif
endscript

script band_lobby_net_cleanup 
	printf \{channel = band_lobby
		qs(0x93722761)}
	band_lobby_kill_party_object_polling
	NetSessionFunc \{Obj = party
		func = stop_party_session}
	NetSessionFunc \{Obj = friends
		func = clear_sent_invites}
	NetSessionFunc \{func = friends_uninit}
	NetSessionFunc \{Obj = match
		func = cancel_join_server}
	quit_network_game
	shut_down_net_play
endscript

script band_lobby_set_party_joiner_mode 
	printf \{channel = band_lobby
		qs(0xd51c4bb7)}
	switch ($g_lobby_state)
		case quickplay
		mode = quickplay_join
		case career
		mode = career_join
		case vs
		mode = competitive_join
		default
		ScriptAssert \{qs(0xbc58f794)}
	endswitch
	NetSessionFunc {
		Obj = party
		func = set_joiner_mode
		params = {
			mode = <mode>
		}
	}
endscript

script band_lobby_set_party_joinable 
	printf \{channel = band_lobby
		qs(0x1341e861)}
	if NOT GotParam \{joinable}
		switch ($g_lobby_net_state)
			case local
			ScriptAssert \{qs(0xa0f5420c)}
			case net_private
			joinable = 1
			case net_public
			joinable = 1
			default
			ScriptAssert \{qs(0xa3be6b94)}
		endswitch
	endif
	NetSessionFunc {
		Obj = party
		func = set_party_joinable
		params = {
			joinable = <joinable>
		}
	}
endscript

script band_lobby_update_player_viewport_assignments 
	printf \{qs(0x61a46220)}
	band_lobby_get_viewport_assignments
	GetArraySize <viewport_assignments>
	<viewport_index> = 0
	begin
	user_id = [0 0]
	<viewport_player> = (<viewport_assignments> [<viewport_index>].Player)
	if (<viewport_player> > 0)
		<viewport_occupied> = (<viewport_assignments> [<viewport_index>].occupied)
		getplayerinfo <viewport_player> is_local_client
		getplayerinfo <viewport_player> gamertag
		getplayerinfo <viewport_player> net_id_first
		getplayerinfo <viewport_player> net_id_second
		SetArrayElement ArrayName = user_id index = 0 NewValue = <net_id_first>
		SetArrayElement ArrayName = user_id index = 1 NewValue = <net_id_second>
		if (<viewport_occupied> = 0)
			band_lobby_clear_submenu_data submenu_data_index = <viewport_index>
			band_lobby_update_submenu_data submenu_index = <viewport_index> element = Player value = <viewport_player>
			if (<viewport_index> < ($g_num_lobby_local_submenus))
				setplayerinfo <viewport_player> is_onscreen = 1
				band_lobby_update_submenu_data submenu_index = <viewport_index> element = menu value = join
				setplayerinfo <viewport_player> controller = <viewport_index>
				if NOT checksumequals a = ($band_lobby_viewport_menus [<viewport_index>]) b = NULL
					band_lobby_add_menu_update_to_queue submenu_index = <viewport_index> focus = 1
				endif
			endif
		else
			band_lobby_update_submenu_data submenu_index = <viewport_index> element = Player value = <viewport_player>
			band_lobby_update_submenu_data submenu_index = <viewport_index> element = net_id value = <user_id>
			band_lobby_update_submenu_data submenu_index = <viewport_index> element = occupied value = 1
			band_lobby_get_submenu_data_new submenu_index = <viewport_index> param = gamertag_checksum
			Change GlobalName = <gamertag_checksum> NewValue = ($<gamertag>)
			if (<viewport_index> < ($g_num_lobby_local_submenus))
				setplayerinfo <viewport_player> is_onscreen = 1
				if (<is_local_client> = 0)
					setplayerinfo <viewport_player> controller = <viewport_index>
					if NOT checksumequals a = ($band_lobby_viewport_menus [<viewport_index>]) b = NULL
						band_lobby_update_submenu_data submenu_index = <viewport_index> element = menu value = remote_player
						band_lobby_add_menu_update_to_queue submenu_index = <viewport_index> focus = 1
					endif
				endif
			endif
		endif
		persistent_band_get_unused_musician
		if (<unused_musician> != None)
			setplayerinfo <viewport_player> band_member = <unused_musician>
		endif
		if (<viewport_index> < ($g_num_lobby_local_submenus))
			update_camera_for_viewport viewport_index = <viewport_index> Player = <viewport_player>
		endif
		<viewport_index> = (<viewport_index> + 1)
		if is_roadie_battle_mode
			return
		endif
	endif
	repeat <array_Size>
	band_lobby_refresh_band_leader_characters \{no_refresh}
	persistent_band_refresh_changed_characters
endscript

script update_camera_for_viewport 
	RequireParams \{[
			viewport_index
			Player
		]
		all}
	getplayerinfo <Player> band_member
	if CompositeObjectExists Name = <band_member>
		formatText checksumName = viewport 'band_viewport_%i' i = <viewport_index>
		if ScreenElementExists id = <viewport>
			<viewport> :Obj_KillSpawnedScript Name = band_lobby_play_viewport_camera
			RunScriptOnScreenElement id = <viewport> band_lobby_play_viewport_camera params = {viewport_index = <viewport_index> lock_to_target = <band_member>}
		endif
	endif
endscript

script band_lobby_get_viewport_assignments 
	if is_roadie_battle_mode
		viewport_assignments = [
			{Player = 0 occupied = 0}
			{Player = 0 occupied = 0}
		]
		viewport_player_nums = [0 0]
	else
		viewport_assignments = [
			{Player = 0 occupied = 0}
			{Player = 0 occupied = 0}
			{Player = 0 occupied = 0}
			{Player = 0 occupied = 0}
			{Player = 0 occupied = 0}
			{Player = 0 occupied = 0}
			{Player = 0 occupied = 0}
			{Player = 0 occupied = 0}
		]
		viewport_player_nums = [0 0 0 0 0 0 0 0]
	endif
	getnumplayersingame \{local}
	if (<num_players> > 0)
		getfirstplayer \{local}
		begin
		SetArrayElement ArrayName = viewport_assignments index = (<Player> - 1) NewValue = {Player = <Player> occupied = 1}
		SetArrayElement ArrayName = viewport_player_nums index = (<Player> - 1) NewValue = <Player>
		getnextplayer local Player = <Player>
		repeat <num_players>
	endif
	<num_viewports_filled> = <num_players>
	getnumplayersingame \{remote}
	if (<num_players> > 0)
		getfirstplayer \{remote}
		begin
		GetArraySize <viewport_assignments>
		<i> = 0
		begin
		if ((<viewport_assignments> [<i>].Player) = 0)
			SetArrayElement ArrayName = viewport_assignments index = <i> NewValue = {Player = <Player> occupied = 1}
			SetArrayElement ArrayName = viewport_player_nums index = <i> NewValue = <Player>
			<num_viewports_filled> = (<num_viewports_filled> + 1)
			break
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
		getnextplayer Player = <Player> remote
		repeat <num_players>
	endif
	<npc_index> = 1
	begin
	if NOT ArrayContains array = <viewport_player_nums> contains = <npc_index>
		GetArraySize <viewport_assignments>
		<i> = 0
		begin
		if ((<viewport_assignments> [<i>].Player) = 0)
			if (<i> < ($g_num_lobby_local_submenus))
				band_lobby_get_available_musician_id viewport_assignments = <viewport_assignments> num_viewports_filled = <num_viewports_filled>
				setplayerinfo <npc_index> band_member = <musician_id>
			endif
			SetArrayElement ArrayName = viewport_assignments index = <i> NewValue = {Player = <npc_index> occupied = 0}
			SetArrayElement ArrayName = viewport_player_nums index = <i> NewValue = <npc_index>
			<num_viewports_filled> = (<num_viewports_filled> + 1)
			break
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	<npc_index> = (<npc_index> + 1)
	repeat ($g_num_lobby_total_submenus)
	return viewport_assignments = <viewport_assignments>
endscript

script band_lobby_get_available_musician_id 
	RequireParams \{[
			viewport_assignments
		]
		all}
	printf \{channel = band_lobby
		qs(0xcaa71070)}
	musician_id = None
	available_musicians = [musician1 musician2 musician3 musician4]
	GetArraySize <viewport_assignments>
	if (<array_Size> > 0)
		i = 0
		begin
		if ((<viewport_assignments> [<i>].Player) > 0)
			getplayerinfo (<viewport_assignments> [<i>].Player) band_member
			GetArraySize <available_musicians>
			if (<array_Size> > 0)
				j = 0
				begin
				if ((<available_musicians> [<j>]) = <band_member>)
					RemoveArrayElement array = <available_musicians> index = <j>
					available_musicians = <array>
					break
				endif
				j = (<j> + 1)
				repeat <array_Size>
			endif
		endif
		i = (<i> + 1)
		repeat ($g_num_lobby_local_submenus)
		GetArraySize <available_musicians>
		if (<array_Size> > 0)
			return musician_id = (<available_musicians> [0])
		else
			ScriptAssert \{qs(0x90b83ada)}
			return musician_id = <musician_id>
		endif
	else
		ScriptAssert \{qs(0x98f700d8)}
		return musician_id = <musician_id>
	endif
endscript

script band_lobby_add_in_game_players_to_party 
	printf \{channel = band_lobby
		qs(0xc4474b1d)}
	if GotParam \{net_init}
		i = 0
		begin
		band_lobby_get_submenu_data viewport_index = <i> param = Player
		getplayerinfo <submenu_data> controller
		if NetSessionFunc func = iscontrolleringame params = {controller = <controller>}
			NetSessionFunc Obj = party func = add_local_player_to_party params = {controller_index = <controller>}
		endif
		i = (<i> + 1)
		repeat ($g_num_lobby_local_submenus)
	else
		i = 0
		finished_adding_local_players = 0
		begin
		getnumplayersingame \{local}
		if (<num_players> > 0)
			getfirstplayer \{local}
			begin
			getplayerinfo <Player> controller
			if NetSessionFunc Obj = party func = add_local_player_to_party params = {controller_index = <controller>}
				finished_adding_local_players = 1
			endif
			getnextplayer local Player = <Player>
			repeat <num_players>
		else
			break
		endif
		i = (<i> + 1)
		if (<finished_adding_local_players> = 1)
			break
		endif
		Wait \{1
			gameframe}
		repeat
		printf qs(0x15945978) d = <i>
	endif
	getnumplayersingame \{local}
	if (<num_players> > 0)
		getfirstplayer \{local}
		begin
		getplayerinfo <Player> controller
		getplayerinfo <Player> gamertag
		band_lobby_get_player_user_id Player = <Player>
		if band_lobby_get_party_id_by_user_id gamertag = ($<gamertag>) user_id = <user_id>
			setplayerinfo <Player> party_id = <party_id>
		endif
		getnextplayer local Player = <Player>
		repeat <num_players>
	endif
endscript

script band_lobby_kill_party_object_polling 
	printf \{channel = band_lobby
		qs(0x778bf081)}
	if ScriptIsRunning \{band_lobby_poll_party_members}
		KillSpawnedScript \{Name = band_lobby_poll_party_members}
	endif
	if ScriptIsRunning \{band_lobby_update_party_data}
		KillSpawnedScript \{Name = band_lobby_update_party_data}
	endif
	if NetSessionFunc \{Obj = party
			func = is_host}
		NetSessionFunc \{Obj = party
			func = clear_shared_data}
	endif
endscript

script band_lobby_poll_party_object 
	printf \{channel = band_lobby
		qs(0x43c46458)}
	if ScreenElementExists \{id = band_lobby_desc_id}
		if NOT ScriptIsRunning \{band_lobby_update_party_data}
			band_lobby_desc_id :Obj_SpawnScriptLater \{band_lobby_update_party_data}
		endif
		if NOT ScriptIsRunning \{band_lobby_poll_party_members}
			band_lobby_desc_id :Obj_SpawnScriptLater \{band_lobby_poll_party_members}
		endif
	endif
endscript

script band_lobby_update_party_data 
	printf \{channel = band_lobby
		qs(0xf3c556d0)}
	current_lobby_net_state = NULL
	current_lobby_state = NULL
	current_leader_party_id = -1
	update_lobby_title = 0
	current_difficulties = [NULL NULL NULL NULL NULL NULL NULL NULL]
	current_parts = [NULL NULL NULL NULL NULL NULL NULL NULL]
	current_double_kick = [-1 -1 -1 -1 -1 -1 -1 -1]
	current_valid_mics = [-1 -1 -1 -1 -1 -1 -1 -1]
	current_async_io_status = [NULL NULL NULL NULL NULL NULL NULL NULL]
	begin
	if NOT InNetGame
		if NetSessionFunc \{Obj = party
				func = is_host}
			if (
					(<current_lobby_net_state> != ($g_lobby_net_state)) ||
					(<current_lobby_state> != ($g_lobby_state))
				)
				data = {
					lobby_net_state = ($g_lobby_net_state)
					lobby_state = ($g_lobby_state)
				}
				NetSessionFunc Obj = party func = append_shared_data params = {data = <data>}
				current_lobby_net_state = ($g_lobby_net_state)
				current_lobby_state = ($g_lobby_state)
			endif
			if ($g_net_leader_player_num > 0)
				getplayerinfo ($g_net_leader_player_num) party_id
				if (<current_leader_party_id> != <party_id>)
					data = {
						leader_party_id = <party_id>
					}
					NetSessionFunc Obj = party func = append_shared_data params = {data = <data>}
					current_leader_party_id = <party_id>
				endif
			endif
		else
			NetSessionFunc \{Obj = party
				func = get_shared_data}
			if GotParam \{party_shared_data}
				if StructureContains structure = <party_shared_data> lobby_state
					if NOT checksumequals a = (<party_shared_data>.lobby_state) b = ($g_lobby_state)
						Change g_lobby_state = (<party_shared_data>.lobby_state)
						update_lobby_title = 1
					endif
				endif
				if StructureContains structure = <party_shared_data> lobby_net_state
					if NOT checksumequals a = (<party_shared_data>.lobby_net_state) b = ($g_lobby_net_state)
						Change g_lobby_net_state = (<party_shared_data>.lobby_net_state)
						update_lobby_title = 1
					endif
				endif
				if StructureContains structure = <party_shared_data> leader_party_id
					if band_lobby_get_player_num_by_party_id party_id = (<party_shared_data>.leader_party_id)
						if (<player_num> != $g_net_leader_player_num)
							Change g_net_leader_player_num = <player_num>
							band_lobby_flash_ticker_msg \{msg_checksum = leader_changed
								time = 3}
						endif
					endif
				endif
			endif
			if (<update_lobby_title> = 1)
				band_lobby_update_lobby_title
				update_lobby_title = 0
			endif
		endif
		getnumplayersingame \{local}
		if (<num_players> > 0)
			getfirstplayer \{local}
			begin
			if savegame_async_is_busy
				async_io_status = busy
			else
				async_io_status = ready
			endif
			setplayerinfo <Player> async_io_status = <async_io_status>
			getplayerinfo <Player> part
			getplayerinfo <Player> difficulty
			getplayerinfo <Player> lobby_mic_valid
			getplayerinfo <Player> double_kick_drum
			if (
					(<difficulty> != (<current_difficulties> [(<Player> - 1)])) ||
					(<part> != (<current_parts> [(<Player> - 1)])) ||
					(<lobby_mic_valid> != (<current_valid_mics> [(<Player> - 1)])) ||
					(<double_kick_drum> != (<current_double_kick> [(<Player> - 1)])) ||
					(<async_io_status> != (<current_async_io_status> [(<Player> - 1)]))
				)
				data = {}
				getplayerinfo <Player> party_id
				formatText checksumName = party_member 'party_member_%d' d = <party_id>
				SetArrayElement ArrayName = current_difficulties index = (<Player> - 1) NewValue = <difficulty>
				SetArrayElement ArrayName = current_parts index = (<Player> - 1) NewValue = <part>
				SetArrayElement ArrayName = current_valid_mics index = (<Player> - 1) NewValue = <lobby_mic_valid>
				SetArrayElement ArrayName = current_double_kick index = (<Player> - 1) NewValue = <double_kick_drum>
				SetArrayElement ArrayName = current_async_io_status index = (<Player> - 1) NewValue = <async_io_status>
				player_data = {difficulty = <difficulty> part = <part> lobby_mic_valid = <lobby_mic_valid> double_kick_drum = <double_kick_drum> async_io_status = <async_io_status>}
				AddParam structure_name = data Name = <party_member> value = <player_data>
				NetSessionFunc Obj = party func = append_shared_data params = {data = <data>}
			endif
			getnextplayer Player = <Player> local
			repeat <num_players>
		endif
		NetSessionFunc \{Obj = party
			func = get_shared_data}
		if GotParam \{party_shared_data}
			NetSessionFunc \{Obj = party
				func = get_party_members}
			GetArraySize <connections>
			if (<array_Size> > 0)
				i = 0
				begin
				if ((<connections> [<i>].is_local) = 0)
					formatText checksumName = party_member 'party_member_%d' d = (<connections> [<i>].party_id)
					if StructureContains structure = <party_shared_data> <party_member>
						if band_lobby_get_player_num_by_party_id party_id = (<connections> [<i>].party_id)
							if ((<current_difficulties> [(<player_num> - 1)]) != (<party_shared_data>.<party_member>.difficulty))
								SetArrayElement ArrayName = current_difficulties index = (<player_num> - 1) NewValue = (<party_shared_data>.<party_member>.difficulty)
								setplayerinfo <player_num> difficulty = (<party_shared_data>.<party_member>.difficulty)
							endif
							if ((<current_parts> [(<player_num> - 1)]) != (<party_shared_data>.<party_member>.part))
								SetArrayElement ArrayName = current_parts index = (<player_num> - 1) NewValue = (<party_shared_data>.<party_member>.part)
								setplayerinfo <player_num> part = (<party_shared_data>.<party_member>.part)
							endif
							if ((<current_valid_mics> [(<player_num> - 1)]) != (<party_shared_data>.<party_member>.lobby_mic_valid))
								SetArrayElement ArrayName = current_valid_mics index = (<player_num> - 1) NewValue = (<party_shared_data>.<party_member>.lobby_mic_valid)
								setplayerinfo <player_num> lobby_mic_valid = (<party_shared_data>.<party_member>.lobby_mic_valid)
							endif
							if ((<current_double_kick> [(<player_num> - 1)]) != (<party_shared_data>.<party_member>.double_kick_drum))
								SetArrayElement ArrayName = current_double_kick index = (<player_num> - 1) NewValue = (<party_shared_data>.<party_member>.double_kick_drum)
								setplayerinfo <player_num> double_kick_drum = (<party_shared_data>.<party_member>.double_kick_drum)
							endif
							if ((<current_async_io_status> [(<player_num> - 1)]) != (<party_shared_data>.<party_member>.async_io_status))
								SetArrayElement ArrayName = current_async_io_status index = (<player_num> - 1) NewValue = (<party_shared_data>.<party_member>.async_io_status)
								setplayerinfo <player_num> async_io_status = (<party_shared_data>.<party_member>.async_io_status)
							endif
						endif
					endif
				endif
				i = (<i> + 1)
				repeat <array_Size>
			endif
		endif
	endif
	Wait \{1.0
		Second}
	repeat
endscript

script band_lobby_poll_party_members 
	printf \{channel = band_lobby
		qs(0x158d30f8)}
	Change \{g_num_party_members = 0}
	begin
	if NOT InNetGame
		NetSessionFunc \{Obj = party
			func = get_party_members}
		GetArraySize <connections>
		if (<array_Size> > 0)
			if (<array_Size> > ($g_num_party_members))
				band_lobby_add_party_member
			elseif (<array_Size> < ($g_num_party_members))
				band_lobby_remove_party_member
			endif
			Change g_num_party_members = <array_Size>
		endif
	endif
	Wait \{1
		Second}
	repeat
endscript

script band_lobby_add_party_member 
	printf \{channel = band_lobby
		qs(0xc9903851)}
	NetSessionFunc \{Obj = party
		func = get_party_members}
	did_add_player = 0
	GetArraySize \{connections}
	if (<array_Size> > 0)
		i = 0
		begin
		if ((<connections> [<i>].is_local) = 0)
			if band_lobby_is_new_party_member user_id = (<connections> [<i>].user_id) party_id = (<connections> [<i>].party_id)
				did_add_player = 1
				band_lobby_find_available_submenu_data
				if NOT (<submenu_data_index> = -1)
					if bl_is_managing
						band_lobby_manage_band_members action = deselect Player = (<managed_submenu_index> + 1) viewport_index = <managed_submenu_index>
						band_lobby_wait_for_menu_change
					endif
					band_lobby_add_player_to_playerinfo player_type = party data = (<connections> [<i>])
					formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <submenu_data_index>
					band_lobby_update_submenu_data submenu_index = <submenu_data_index> element = net_id value = (<connections> [<i>].user_id)
					band_lobby_update_submenu_data submenu_index = <submenu_data_index> element = Player value = <playerinfo>
					band_lobby_update_submenu_data submenu_index = <submenu_data_index> element = occupied value = 1
					if ((isps3) || (isngc))
						Change GlobalName = ($<submenu_data>.gamertag_checksum) NewValue = (<connections> [<i>].gamertag)
					endif
					net_start_character_silhouette Player = <playerinfo> submenu_index = <submenu_data_index>
					if (<submenu_data_index> < ($g_num_lobby_local_submenus))
						band_lobby_wait_for_menu_change
						persistent_band_get_unused_musician
						if (<unused_musician> != None)
							setplayerinfo <playerinfo> band_member = <unused_musician>
						endif
						setplayerinfo <playerinfo> controller = <submenu_data_index>
						($band_lobby_viewport_menus [<submenu_data_index>]) :Obj_SpawnScriptNow band_lobby_change_menu params = {action = forward menu = remote_player Player = <playerinfo> viewport_index = <submenu_data_index> no_forced}
						band_lobby_kick_leader_out_of_band_manage
					endif
				else
					ScriptAssert \{qs(0x826c0d06)}
				endif
				if ScreenElementExists \{id = band_lobby_pu_gr}
					band_lobby_return_from_game_rules
				endif
			endif
		endif
		i = (<i> + 1)
		repeat <array_Size>
		if (<did_add_player> = 1)
			band_lobby_update_player_viewport_assignments
		endif
	endif
endscript

script band_lobby_wait_for_menu_change 
	begin
	if NOT ScriptIsRunning \{band_lobby_update_menu}
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script band_lobby_remove_party_member 
	printf \{channel = band_lobby
		qs(0xcf805d25)}
	NetSessionFunc \{Obj = party
		func = get_party_members}
	GetArraySize \{connections}
	getnumplayersingame
	removed_remote_player = 0
	if ((<num_players> > 0) && (<array_Size> > 0))
		getfirstplayer
		begin
		if NOT band_lobby_is_player_party_member player_num = <Player>
			if playerinfoequals <Player> is_local_client = 0
				removed_remote_player = 1
				band_lobby_get_player_submenu_index player_num = <Player>
				if (<submenu_index> > -1)
					net_clear_player_info Player = <Player>
					if (<Player> < ($g_num_lobby_local_submenus))
						setplayerinfo <Player> is_local_client = 1
					else
						setplayerinfo <Player> is_local_client = 0
					endif
					band_lobby_clear_submenu_data submenu_data_index = <submenu_index>
					if (<submenu_index> < ($g_num_lobby_local_submenus))
						net_stop_character_silhouette Player = <Player>
						($band_lobby_viewport_menus [<submenu_index>]) :Obj_SpawnScriptNow band_lobby_change_menu params = {action = back menu = join Player = (<submenu_index> + 1) viewport_index = <submenu_index>}
						band_lobby_kick_leader_out_of_band_manage
					endif
				endif
				if ScreenElementExists \{id = band_lobby_pu_gr}
					band_lobby_return_from_game_rules \{net_change = 0}
				endif
			endif
		endif
		getnextplayer Player = <Player>
		repeat <num_players>
		if (<removed_remote_player> = 1)
			band_lobby_update_player_viewport_assignments
			band_lobby_refresh_band_leader_characters
		endif
	endif
endscript

script band_lobby_is_new_party_member 
	RequireParams \{[
			user_id
			party_id
		]
		all}
	printf \{qs(0x4e5e8444)}
	getmaxplayers
	i = 0
	begin
	getplayerinfo (<i> + 1) net_id_first
	getplayerinfo (<i> + 1) net_id_second
	getplayerinfo (<i> + 1) party_id out = current_party_id
	if ((<net_id_first> = (<user_id> [0])) && (<net_id_second> = (<user_id> [1])) && (<current_party_id> = <party_id>))
		return \{FALSE}
	endif
	i = (<i> + 1)
	repeat <max_players>
	return \{true}
endscript

script band_lobby_is_player_party_member 
	RequireParams \{[
			player_num
		]}
	printf \{channel = band_lobby
		qs(0x8d9246fd)}
	NetSessionFunc \{Obj = party
		func = get_party_members}
	GetArraySize \{connections}
	getplayerinfo <player_num> net_id_first
	getplayerinfo <player_num> net_id_second
	getplayerinfo <player_num> gamertag
	if (<array_Size> > 0)
		i = 0
		begin
		if ((<net_id_first> = (<connections> [<i>].user_id [0])) && (<net_id_second> = (<connections> [<i>].user_id [1])) && (($<gamertag>) = (<connections> [<i>].gamertag)))
			return \{true}
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	return \{FALSE}
endscript

script band_lobby_leave_party 
	printf \{channel = band_lobby
		qs(0xe75a36dc)}
	if ScreenElementExists \{id = current_band_lobby_popup}
		if current_band_lobby_popup :se_getparentid
			band_lobby_destroy_popup_menu container = <parent_id> no_focus
		endif
	endif
	if NetSessionFunc \{Obj = party
			func = is_host}
		NetSessionFunc \{Obj = party
			func = disband_party_session}
	else
		NetSessionFunc \{Obj = party
			func = leave_party}
		Change g_net_leader_player_num = ($g_leader_player_num)
	endif
	band_lobby_add_in_game_players_to_party
	band_lobby_store_local_players_net_and_party_ids_in_playerinfo
	i = 0
	begin
	band_lobby_get_submenu_data_new submenu_index = <i> param = Player
	band_lobby_get_submenu_data_new submenu_index = <i> param = occupied
	if (<occupied> = 1)
		if playerinfoequals <Player> is_local_client = 1
			band_lobby_update_submenu_data submenu_index = <i> element = menu_indices value = [0 0 0]
			band_lobby_change_menu action = back menu = main Player = <Player> viewport_index = <i> no_forced focus = 1
		else
			band_lobby_add_menu_update_to_queue submenu_index = <i> focus = 1
		endif
	else
		band_lobby_add_menu_update_to_queue submenu_index = <i> focus = 1
	endif
	i = (<i> + 1)
	repeat ($g_num_lobby_local_submenus)
	band_lobby_change_focus_submenu_all \{focus_type = focus}
	band_lobby_update_button_helpers
	band_lobby_wait_for_menu_update_all
	Wait \{30
		gameframes}
	band_lobby_change_network Player = ($g_leader_player_num) network = local
endscript

script band_lobby_get_party_id_by_user_id 
	RequireParams \{[
			user_id
		]
		all}
	printf \{channel = band_lobby
		qs(0xab8e5e0c)}
	party_id = -1
	NetSessionFunc \{Obj = party
		func = get_party_members}
	GetArraySize \{connections}
	if (<array_Size> > 0)
		i = 0
		begin
		if (((<user_id> [0]) = (<connections> [<i>].user_id [0])) && ((<user_id> [1]) = (<connections> [<i>].user_id [1])))
			if ((isps3) || (isngc))
				if (<gamertag> = (<connections> [<i>].gamertag))
					party_id = (<connections> [<i>].party_id)
					break
				endif
			else
				party_id = (<connections> [<i>].party_id)
				break
			endif
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	if (<party_id> > -1)
		return true party_id = <party_id>
	else
		return \{FALSE}
	endif
endscript

script band_lobby_get_player_num_by_party_id 
	RequireParams \{[
			party_id
		]
		all}
	if NetSessionFunc Obj = party func = get_party_member params = {party_id = <party_id>}
		player_num = -1
		getnumplayersingame
		if (<num_players> > 0)
			getfirstplayer
			begin
			if playerinfoequals <Player> net_id_first = (<connections> [0].user_id [0])
				if playerinfoequals <Player> net_id_second = (<connections> [0].user_id [1])
					if ((isps3) || (isngc))
						getplayerinfo <Player> gamertag
						if (($<gamertag>) = (<connections> [0].gamertag))
							player_num = <Player>
							break
						endif
					else
						player_num = <Player>
						break
					endif
				endif
			endif
			getnextplayer Player = <Player>
			repeat <num_players>
		endif
		if (<player_num> > -1)
			return true player_num = <player_num>
		else
			return \{FALSE}
		endif
	else
		return \{FALSE}
	endif
endscript

script band_lobby_get_gamertag_by_party_id 
	RequireParams \{[
			party_id
		]
		all}
	printf \{channel = band_lobby
		qs(0x1e1d8649)}
	gamertag = qs(0x00000000)
	NetSessionFunc \{Obj = party
		func = get_party_members}
	GetArraySize \{connections}
	if (<array_Size> > 0)
		i = 0
		begin
		if ((<connections> [<i>].party_id) = <party_id>)
			gamertag = (<connections> [<i>].gamertag)
			break
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	return gamertag = <gamertag>
endscript

script band_lobby_does_have_remote_party_connections 
	printf \{channel = band_lobby
		qs(0xb7450917)}
	found_remote_player = 0
	NetSessionFunc \{Obj = party
		func = get_party_members}
	GetArraySize \{connections}
	printstruct <...>
	if (<array_Size> > 0)
		i = 0
		begin
		if ((<connections> [<i>].is_local) = 0)
			found_remote_player = 1
			break
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	if (<found_remote_player> = 1)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script band_lobby_party_host_started_matchmaking 
	RequireParams \{[
			private
		]
		all}
	printf \{channel = band_lobby
		qs(0xfa201292)}
	common_start_matchmaking_setup
	if (<private> = 1)
		band_lobby_flash_ticker_msg \{msg_checksum = creating_session
			time = 5}
	else
		band_lobby_flash_ticker_msg \{msg_checksum = party_host_start_matchmake
			time = 5}
	endif
	band_lobby_prepare_for_matchmaking Player = ($g_leader_player_num) private = <private>
endscript

script bl_is_managing 
	printf \{channel = band_lobby
		qs(0x8c4c279a)}
	is_managing = 0
	i = 0
	begin
	band_lobby_get_submenu_data_new submenu_index = <i> param = is_managed
	if (<is_managed> = 1)
		is_managing = 1
		break
	endif
	i = (<i> + 1)
	repeat ($g_num_lobby_local_submenus)
	if (<is_managing> = 1)
		return true managed_submenu_index = <i>
	else
		return \{FALSE}
	endif
endscript

script band_lobby_get_focus_value 
	RequireParams \{[
			Player
			focus_param
			viewport_index
		]
		all}
	printf \{channel = band_lobby
		qs(0xd954915c)}
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <viewport_index>
	switch <focus_param>
		case difficulty
		getplayerinfo <Player> difficulty out = focus_value
		if (<focus_value> = expert)
			getplayerinfo <Player> part
			if (<part> = drum)
				getplayerinfo <Player> double_kick_drum
				if (<double_kick_drum> = 1)
					focus_value = expert_plus
				endif
			endif
		endif
		case part
		getplayerinfo <Player> part out = focus_value
		case lefty_flip
		getplayerinfo <Player> lefty_flip
		if (<lefty_flip> = 1)
			<focus_value> = lefty
		else
			<focus_value> = standard
		endif
		case vocals_highway_view
		getplayerinfo <Player> vocals_highway_view out = focus_value
		if (<focus_value> = None)
			focus_value = scrolling
		endif
		case mic_preference
		getplayerinfo <Player> mic_preference out = focus_value
		if (<focus_value> = None)
			<focus_value> = mic
		endif
		case character_id
		getplayerinfo <Player> character_id out = focus_value
		case outfit
		get_savegame_from_player Player = <Player>
		getplayerinfo ($<submenu_data>.Player) chosen_character_id
		characterprofilegetstruct savegame = <savegame> Name = <chosen_character_id>
		if StructureContains structure = (<profile_struct>.appearance) cas_outfit
			focus_value = ((<profile_struct>.appearance).cas_outfit.desc_id)
		else
			ScriptAssert \{qs(0xe92dbc8d)}
		endif
		case venue
		focus_value = $g_band_lobby_current_level
		case game_mode
		focus_value = ($<focus_param>)
		if (<focus_value> = compmega || <focus_value> = compmega_team)
			focus_value = ($competitive_rules)
		endif
		case g_lobby_state
		case g_lobby_net_state
		focus_value = ($<focus_param>)
		default
		ScriptAssert \{qs(0x98947583)}
	endswitch
	return focus_value = <focus_value>
endscript

script band_lobby_get_player_submenu_index 
	RequireParams \{[
			player_num
		]
		all}
	printf \{channel = band_lobby
		qs(0xa5e41d34)}
	i = 0
	begin
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <i>
	if (($<submenu_data>.Player) = <player_num>)
		if GotParam \{occupied}
			if (($<submenu_data>.occupied) = 1)
				return submenu_index = <i>
			endif
		else
			return submenu_index = <i>
		endif
	endif
	i = (<i> + 1)
	repeat ($g_num_lobby_total_submenus)
	return \{submenu_index = -1}
endscript

script band_lobby_clear_submenu_data 
	RequireParams \{[
			submenu_data_index
		]
		all}
	printf qs(0x2b14e3e1) c = <submenu_data_index>
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <submenu_data_index>
	updatestructelement struct = <submenu_data> element = Player value = (<submenu_data_index> + 1)
	updatestructelement struct = <newstruct> element = occupied value = 0
	if (<submenu_data_index> < ($g_num_lobby_local_submenus))
		updatestructelement struct = <newstruct> element = is_updating value = 0
		updatestructelement struct = <newstruct> element = menu value = empty
		updatestructelement struct = <newstruct> element = return_menu value = empty
		updatestructelement struct = <newstruct> element = menu_indices value = [0 0 0]
		updatestructelement struct = <newstruct> element = net_id value = [0 0]
		updatestructelement struct = <newstruct> element = is_managed value = 0
		updatestructelement struct = <newstruct> element = focus_type value = focus
		if ((isps3) || (isngc))
			Change GlobalName = ($<submenu_data>.gamertag_checksum) NewValue = qs(0x00000000)
		endif
		if GotParam \{all_data}
			updatestructelement struct = <newstruct> element = desc_id value = NULL
		endif
	endif
	switch <submenu_data>
		case band_lobby_submenu_data_0
		Change band_lobby_submenu_data_0 = <newstruct>
		case band_lobby_submenu_data_1
		Change band_lobby_submenu_data_1 = <newstruct>
		case band_lobby_submenu_data_2
		Change band_lobby_submenu_data_2 = <newstruct>
		case band_lobby_submenu_data_3
		Change band_lobby_submenu_data_3 = <newstruct>
		case band_lobby_submenu_data_4
		Change band_lobby_submenu_data_4 = <newstruct>
		case band_lobby_submenu_data_5
		Change band_lobby_submenu_data_5 = <newstruct>
		case band_lobby_submenu_data_6
		Change band_lobby_submenu_data_6 = <newstruct>
		case band_lobby_submenu_data_7
		Change band_lobby_submenu_data_7 = <newstruct>
	endswitch
endscript

script band_lobby_clear_all_viewports_data 
	printf \{channel = band_lobby
		qs(0xb3e704d0)}
	i = 0
	begin
	band_lobby_clear_submenu_data submenu_data_index = <i> all_data
	i = (<i> + 1)
	repeat ($g_num_lobby_total_submenus)
endscript

script band_lobby_update_submenu_data 
	RequireParams \{[
			submenu_index
			element
			value
		]
		all}
	printf channel = band_lobby qs(0xd2ba0f58) s = <submenu_index> e = <element>
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <submenu_index>
	if (<submenu_index> > 3)
		if ((<element> = Player) || (<element> = occupied))
			updatestructelement struct = <submenu_data> element = <element> value = <value>
			update = 1
		endif
	else
		updatestructelement struct = <submenu_data> element = <element> value = <value>
		update = 1
	endif
	if GotParam \{update}
		switch <submenu_data>
			case band_lobby_submenu_data_0
			Change band_lobby_submenu_data_0 = <newstruct>
			case band_lobby_submenu_data_1
			Change band_lobby_submenu_data_1 = <newstruct>
			case band_lobby_submenu_data_2
			Change band_lobby_submenu_data_2 = <newstruct>
			case band_lobby_submenu_data_3
			Change band_lobby_submenu_data_3 = <newstruct>
			case band_lobby_submenu_data_4
			Change band_lobby_submenu_data_4 = <newstruct>
			case band_lobby_submenu_data_5
			Change band_lobby_submenu_data_5 = <newstruct>
			case band_lobby_submenu_data_6
			Change band_lobby_submenu_data_6 = <newstruct>
			case band_lobby_submenu_data_7
			Change band_lobby_submenu_data_7 = <newstruct>
		endswitch
	endif
endscript

script band_lobby_get_submenu_data 
	RequireParams \{[
			viewport_index
			param
		]
		all}
	printf channel = band_lobby qs(0xc1d6c64a) c = <viewport_index>
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <viewport_index>
	if StructureContains structure = ($<submenu_data>) <param>
		return submenu_data = ($<submenu_data>.<param>)
	endif
	printstruct <...>
	ScriptAssert \{qs(0x61da7f8a)}
endscript

script band_lobby_get_submenu_data_new 
	RequireParams \{[
			submenu_index
			param
		]
		all}
	printf channel = band_lobby qs(0x1b34976e) c = <submenu_index>
	data = {}
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <submenu_index>
	if StructureContains structure = ($<submenu_data>) <param>
		AddParam structure_name = data Name = <param> value = ($<submenu_data>.<param>)
		return <data>
	endif
	printstruct <...>
	ScriptAssert \{qs(0x61da7f8a)}
endscript

script band_lobby_find_available_submenu_data 
	printf \{channel = band_lobby
		qs(0x24c8991d)}
	i = 0
	begin
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <i>
	if (($<submenu_data>.occupied) = 0)
		return submenu_data_index = <i>
	endif
	i = (<i> + 1)
	repeat ($g_num_lobby_total_submenus)
	return \{submenu_data_index = -1}
endscript

script find_available_playerinfo 
	RequireParams \{[
			player_type
		]}
	printf \{qs(0xd0c86e55)}
	getmaxplayers
	if (<player_type> = local)
		i = 1
		begin
		if playerinfoequals <i> in_game = 0
			return playerinfo = <i>
		endif
		i = (<i> + 1)
		repeat <max_players>
	elseif (<player_type> = party_remote)
		i = <max_players>
		begin
		if playerinfoequals <i> in_game = 0
			return playerinfo = <i>
		endif
		i = (<i> - 1)
		repeat <max_players>
	elseif (<player_type> = party_local)
		if playerinfoequals (<controller_index> + 1) in_game = 0
			return playerinfo = (<controller_index> + 1)
		endif
	endif
	return \{playerinfo = -1}
endscript

script reset_all_player_in_game_status 
	printf \{qs(0x0d312f40)}
	getmaxplayers
	i = 0
	begin
	setplayerinfo (<i> + 1) in_game = 0
	i = (<i> + 1)
	repeat <max_players>
endscript

script reset_all_players_local_client_status 
	printf \{qs(0x9c615b8c)}
	getmaxlocalplayers
	max_local = <max_players>
	getmaxplayers
	if GotParam \{force_remote}
		max_local = 0
	endif
	i = 0
	begin
	if (<i> < <max_local>)
		setplayerinfo (<i> + 1) is_local_client = 1
	else
		setplayerinfo (<i> + 1) is_local_client = 0
	endif
	i = (<i> + 1)
	repeat <max_players>
endscript

script band_lobby_cancel_matchmaking \{start_matchmaking = 0}
	printf \{channel = band_lobby
		qs(0x1cc72416)}
	if NetSessionFunc \{Obj = match
			func = cancel_join_server}
		if (<start_matchmaking> = 0)
			band_lobby_return_from_matchmaking container = <container>
		else
			unlock_all_controllers
		endif
		if ScriptIsRunning \{bl_private_match_ui_timeout}
			KillSpawnedScript \{Name = bl_private_match_ui_timeout}
		endif
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script band_lobby_return_from_matchmaking 
	printf \{channel = band_lobby
		qs(0x1fff1b3c)}
	Change \{respond_to_signin_changed = 0}
	NetSessionFunc \{Obj = party
		func = set_party_joinable
		params = {
			joinable = 1
		}}
	band_lobby_restore_prematchmaking_settings \{cancel_matchmaking}
	band_lobby_poll_party_object
	unlock_all_controllers
	gamemode_gettype
	if (<Type> = career)
		if ScriptIsRunning \{band_lobby_matchmaking_update_loop}
			KillSpawnedScript \{Name = band_lobby_matchmaking_update_loop}
		endif
		band_lobby_force_submenu_change_all \{menu = join
			focus = 1
			submenu_data_match = occupied
			match_value = 0}
		band_lobby_refresh_all_submenus_new \{focus = 1}
		Change \{g_career_search = NULL}
	else
		band_lobby_destroy_popup_menu
	endif
	band_lobby_update_player_viewport_assignments
	band_lobby_update_button_helpers
	band_lobby_refresh_band_leader_characters \{no_refresh}
	persistent_band_refresh_changed_characters
endscript

script band_lobby_start_public_matchmaking \{server_list_mode = automatch
		private = 0}
	RequireParams \{[
			Player
		]
		all}
	printf channel = band_lobby qs(0xa547b7b9) c = <Player>
	Change \{respond_to_signin_changed_all_players = 1}
	NetSessionFunc \{Obj = party
		func = set_party_joinable
		params = {
			joinable = 0
		}}
	NetSessionFunc Obj = party func = set_matchmaking_struct params = {game_mode = ($game_mode) competitive_rules = ($competitive_rules) private = <private>}
	band_lobby_set_all_non_ingame_players_as_remote
	getplayerinfo ($g_leader_player_num) controller
	set_network_preferences
	common_start_matchmaking_setup
	net_dummy_get_needed_search_params
	gamemode_gettype
	if checksumequals a = <Type> b = career
		difficulty = expert
	elseif checksumequals a = <Type> b = quickplay
		difficulty = expert
	endif
	NetSessionFunc Obj = match func = set_search_params params = <...>
	NetSessionFunc Obj = match func = set_server_list_mode params = {<server_list_mode>}
	if (<private> = 1)
		getnumplayersingame
		if ScreenElementExists \{id = band_lobby_desc_id}
			if ScriptIsRunning \{bl_private_match_ui_timeout}
				KillSpawnedScript \{bl_private_match_ui_timeout}
			endif
			band_lobby_desc_id :obj_spawnscript bl_private_match_ui_timeout params = {num_players = <num_players>}
		endif
		NetSessionFunc \{Obj = match
			func = set_server_list_mode
			params = {
				host_only
			}}
	endif
	NetSessionFunc Obj = match func = start_server_list params = {controller = <controller> private = <private> callback_complete = band_lobby_career_search_no_games_available}
	SetServerMode
	StartServer
	SetJoinMode \{$JOIN_MODE_PLAY}
	JoinServer
endscript

script bl_private_match_ui_timeout 
	RequireParams \{[
			num_players
		]
		all}
	printf \{channel = band_lobby
		qs(0xef42f4e2)}
	begin
	NetSessionFunc \{Obj = party
		func = get_party_members}
	GetArraySize <connections>
	if (<array_Size> < <num_players>)
		band_lobby_cancel_matchmaking
		break
	endif
	Wait \{1
		Second}
	repeat
endscript

script band_lobby_restart_quickmatch 
	printf \{qs(0x273fdb7b)}
	LeaveServer
	getplayerinfo ($g_leader_player_num) controller
	NetSessionFunc Obj = match func = start_server_list params = {controller = <controller> private = <private> callback_complete = band_lobby_career_search_no_games_available}
	SetServerMode
	StartServer
	SetJoinMode \{$JOIN_MODE_PLAY}
	JoinServer
endscript

script band_lobby_career_search_no_games_available 
	printf \{channel = band_lobby
		qs(0x4553dd99)}
	if ScreenElementExists \{id = band_lobby_desc_id}
		band_lobby_desc_id :Obj_SpawnScriptNow band_lobby_career_search_no_games_available_spawned params = {<...>}
	endif
endscript

script band_lobby_career_search_no_games_available_spawned 
	printf \{channel = band_lobby
		qs(0xb40f6163)}
	if ScreenElementExists \{id = dialog_box_container}
		printf \{qs(0x6e40243e)}
		return
	endif
	ui_event_get_top
	if GotParam \{is_popup}
		printf \{qs(0x251ccb39)}
		event_type = menu_replace
	else
		event_type = menu_change
	endif
	if band_lobby_does_popup_exist
		band_lobby_destroy_popup_menu \{animate = 0
			no_focus}
	endif
	options = [
		{
			func = band_lobby_career_search_no_games_search_again
			text = ($band_lobby_strings.button_continue)
		}
		{
			func = band_lobby_career_search_no_games_cancel
			text = ($band_lobby_strings.popup_cancel_mm)
		}
	]
	band_lobby_change_focus_submenu_all \{focus_type = unfocus}
	getplayerinfo ($g_leader_player_num) controller
	ui_event_wait {
		event = <event_type>
		data = {
			is_popup
			state = uistate_band_lobby_popup
			controller = <controller>
			reason = popup_no_games_available
			options = <options>
			title = ($band_lobby_strings.popup_title_matchmake)
			back_script = band_lobby_career_search_no_games_cancel
		}
	}
endscript

script band_lobby_career_search_no_games_cancel 
	printf \{channel = band_lobby
		qs(0x62a69699)}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	se_getparentid
	LaunchEvent Type = unfocus target = <parent_id>
	band_lobby_cancel_matchmaking
	band_lobby_get_player_submenu_index player_num = ($g_leader_player_num)
	band_lobby_add_menu_update_to_queue submenu_index = <submenu_index> focus = 1
	generic_event_back
endscript

script band_lobby_career_search_no_games_search_again 
	printf \{channel = band_lobby
		qs(0x451da442)}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	se_getparentid
	LaunchEvent Type = unfocus target = <parent_id>
	NetSessionFunc {
		Obj = match
		func = start_server_list
		params = {
			controller = <device_num>
			callback_complete = band_lobby_career_search_no_games_available
		}
	}
	generic_event_back
endscript

script band_lobby_live_profile_ingame 
	printf \{channel = band_lobby
		qs(0xd27b1c33)}
	getnumplayersingame \{local}
	if (<num_players> > 0)
		getfirstplayer \{local}
		begin
		getplayerinfo <Player> controller
		if CheckForSignIn controller_index = <controller> network_platform_only dont_set_primary
			if isxenonorwindx
				if NOT NetSessionFunc func = xenonisguest params = {controller_index = <controller>}
					if GotParam \{multiplayer_enabled}
						if NetSessionFunc func = ismultiplayerallowed params = {controller_index = <device_num>}
							return \{true}
						endif
					else
						return \{true}
					endif
				endif
			else
				if GotParam \{multiplayer_enabled}
					if NetSessionFunc func = ismultiplayerallowed params = {controller_index = <device_num>}
						return \{true}
					endif
				else
					return \{true}
				endif
			endif
		endif
		getnextplayer Player = <Player> local
		repeat <num_players>
	endif
	return \{FALSE}
endscript

script band_lobby_store_local_players_net_and_party_ids_in_playerinfo 
	printf \{channel = band_lobby
		qs(0x1a7a58b9)}
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		if playerinfoequals <Player> is_local_client = 1
			getplayerinfo <Player> controller
			getplayerinfo <Player> gamertag
			GetNetID controller_index = <controller>
			setplayerinfo <Player> net_id_first = <net_id_first>
			setplayerinfo <Player> net_id_second = <net_id_second>
			array = []
			AddArrayElement array = <array> element = <net_id_first>
			AddArrayElement array = <array> element = <net_id_second>
			if NOT band_lobby_get_party_id_by_user_id user_id = <array> gamertag = ($<gamertag>)
				party_id = -1
			endif
			setplayerinfo <Player> party_id = <party_id>
		endif
		getnextplayer Player = <Player>
		repeat <num_players>
	endif
	return \{true}
endscript

script bl_store_local_player_net_ids_in_submenu_data 
	printf \{channel = band_lobby
		qs(0xb03ed173)}
	submenu_index = 0
	begin
	band_lobby_get_submenu_data_new submenu_index = <submenu_index> param = occupied
	band_lobby_get_submenu_data_new submenu_index = <submenu_index> param = Player
	if (<occupied> = 1)
		if playerinfoequals <Player> is_local_client = 1
			array = []
			getplayerinfo <Player> net_id_first
			getplayerinfo <Player> net_id_second
			AddArrayElement array = <array> element = <net_id_first>
			AddArrayElement array = <array> element = <net_id_second>
			band_lobby_update_submenu_data submenu_index = <submenu_index> element = net_id value = <array>
		endif
	endif
	submenu_index = (<submenu_index> + 1)
	repeat ($g_num_lobby_local_submenus)
endscript

script band_lobby_check_if_all_players_are_online_enabled 
	printf \{channel = band_lobby
		qs(0x0499dd5e)}
	if isxenonorwindx
		getnumplayersingame \{local}
		if (<num_players> > 0)
			getfirstplayer \{local}
			begin
			getplayerinfo <Player> controller
			if NOT (CheckForSignIn controller_index = <controller> dont_set_primary)
				return \{FALSE}
			endif
			getnextplayer Player = <Player> local
			repeat <num_players>
		endif
	else
		getplayerinfo ($g_leader_player_num) controller
		if NOT (CheckForSignIn controller_index = <controller> dont_set_primary network_platform_only)
			return \{FALSE}
		endif
	endif
	return \{true}
endscript

script band_lobby_lost_band_leader 
	printf \{channel = band_lobby
		qs(0xfb37b28b)}
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		if NOT ($g_leader_player_num = <Player>)
			if playerinfoequals <Player> is_local_client = 1
				Change g_leader_player_num = <Player>
				Change g_net_leader_player_num = <Player>
				band_lobby_update_lobby_title
				i = 0
				begin
				formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <i>
				if (($<submenu_data>.Player) = <Player>)
					if (($<submenu_data>.menu) = band_member)
						band_lobby_update_submenu_data submenu_index = <i> element = menu_indices value = [0 0 0]
						($band_lobby_viewport_menus [<i>]) :Obj_SpawnScriptNow band_lobby_change_menu params = {action = back menu = main Player = <Player> viewport_index = <i>}
					endif
					return
				endif
				i = (<i> + 1)
				repeat ($g_num_lobby_local_submenus)
				printstruct <...>
				ScriptAssert \{qs(0x15623c9d)}
			endif
		endif
		getnextplayer Player = <Player>
		repeat <num_players>
	endif
	Change \{g_leader_player_num = -1}
	Change \{g_net_leader_player_num = -1}
	band_lobby_update_lobby_title
endscript

script band_lobby_ensure_primary_controller_is_signed_in 
	printf \{channel = band_lobby
		qs(0x27e2988a)}
	if ($g_leader_player_num > -1)
		if playerinfoequals ($g_leader_player_num) in_game = 1
			getplayerinfo ($g_leader_player_num) controller
			change_primary_controller controller = <controller>
		endif
	endif
endscript

script band_lobby_set_all_non_ingame_players_as_remote 
	printf \{channel = band_lobby
		qs(0x9c5abd92)}
	getmaxplayers
	i = 0
	begin
	if playerinfoequals (<i> + 1) in_game = 0
		setplayerinfo (<i> + 1) is_local_client = 0
	endif
	i = (<i> + 1)
	repeat <max_players>
endscript

script band_lobby_store_playerinfo 
	printf \{channel = band_lobby
		qs(0x04b46a28)}
	Change g_copy_leader_player_num = ($g_leader_player_num)
	Change g_copy_net_leader_player_num = ($g_net_leader_player_num)
	getmaxplayers
	if (<max_players> > 0)
		i = 0
		begin
		playerinfostore (<i> + 1)
		i = (<i> + 1)
		repeat <max_players>
	endif
endscript

script band_lobby_restore_playerinfo 
	printf \{channel = band_lobby
		qs(0xfb2be41d)}
	getmaxplayers
	if (<max_players> > 0)
		i = 0
		begin
		playerinforestore (<i> + 1)
		i = (<i> + 1)
		repeat <max_players>
	endif
endscript

script band_lobby_restore_prematchmaking_settings 
	printf \{channel = band_lobby
		qs(0x1e8dee2a)}
	Change g_leader_player_num = ($g_copy_leader_player_num)
	Change g_net_leader_player_num = ($g_copy_net_leader_player_num)
	band_lobby_restore_playerinfo
	band_lobby_restore_gamertags
	if NOT band_lobby_does_have_remote_party_connections
		restore_local_leadership = 1
	endif
	getnumplayersingame \{remote}
	if (<num_players> > 0)
		getfirstplayer \{remote}
		begin
		if GotParam \{restore_local_leadership}
			if ($g_net_leader_player_num = <Player>)
				Change g_net_leader_player_num = ($g_leader_player_num)
			endif
		endif
		band_lobby_get_player_submenu_index player_num = <Player> occupied
		if (<submenu_index> > -1)
			band_lobby_clear_submenu_data submenu_data_index = <submenu_index>
		endif
		net_clear_player_info Player = <Player>
		getnextplayer Player = <Player> remote
		repeat <num_players>
	endif
	if NOT GotParam \{cancel_matchmaking}
		band_lobby_clear_all_viewports_data
		band_lobby_update_lobby_title
	endif
	if GotParam \{restore_local_leadership}
		band_lobby_change_network Player = ($g_leader_player_num) network = local
	endif
endscript

script band_lobby_restore_gamertags 
	getmaxplayers
	if (<max_players> > 0)
		i = 0
		begin
		formatText checksumName = gamertag 'gamertag_%d' d = (<i>)
		if playerinfoequals (<i> + 1) in_game = 1
			if playerinfoequals (<i> + 1) is_local_client = 1
				getplayerinfo (<i> + 1) controller
				if NetSessionFunc Obj = match func = get_gamertag params = {controller = <controller>}
					Change GlobalName = <gamertag> NewValue = <Name>
				endif
			endif
		else
			Change GlobalName = <gamertag> NewValue = qs(0x00000000)
		endif
		i = (<i> + 1)
		repeat <max_players>
	endif
endscript

script band_lobby_set_exclusive_devices_on_submenus 
	RequireParams \{[
			controller
		]
		all}
	printf \{channel = band_lobby
		qs(0xe0af36b5)}
	i = 0
	begin
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <i>
	($<submenu_data>.desc_id) :se_setprops exclusive_device = <controller>
	i = (<i> + 1)
	repeat ($g_num_lobby_local_submenus)
endscript

script band_lobby_request_player_card 
	RequireParams \{[
			device_num
			net_id_first
			net_id_second
		]
		all}
	printf \{channel = band_lobby
		qs(0x22df035d)}
	if NetSessionFunc func = canviewprofile controller_index = <device_num>
		array = []
		AddArrayElement array = <array> element = <net_id_first>
		AddArrayElement array = <array> element = <net_id_second>
		NetSessionFunc func = showGamerCard params = {player_xuid = <array> controller_index = <device_num>}
	endif
endscript

script set_game_rules_from_voting_result 
	RequireParams \{[
			Result
		]
		all}
	printf \{qs(0x7d7081f8)}
	Change competitive_rules = (<Result>.element)
endscript

script prepare_game_rules_voting 
	printf \{qs(0x8b723a72)}
	array = []
	GetArraySize ($competitive_rules_array)
	if (<array_Size> > 0)
		i = 0
		begin
		add_element = 1
		<competitive_rules> = (($competitive_rules_array) [<i>])
		if NOT gamemode_isteamgame
			if (($<competitive_rules>.team) = 1)
				add_element = 0
			endif
		else
			if (($<competitive_rules>.team) = 0)
				add_element = 0
			endif
		endif
		if checksumequals a = <competitive_rules> b = elimination
			getnumplayersingame
			if (<num_players> < ($<competitive_rules>.min_players))
				add_element = 0
			endif
		elseif checksumequals a = (($competitive_rules_array) [<i>]) b = solo_fest_mode
			add_element = 0
		elseif checksumequals a = (($competitive_rules_array) [<i>]) b = team_fest_mode
			add_element = 0
		elseif checksumequals a = (($competitive_rules_array) [<i>]) b = p8_pro_faceoff
			add_element = 0
		elseif checksumequals a = (($competitive_rules_array) [<i>]) b = roadie_battle
			add_element = 0
		endif
		if (<add_element> = 1)
			AddArrayElement array = <array> element = ($competitive_rules_array [<i>])
		endif
		i = (<i> + 1)
		repeat <array_Size>
		generate_voting_items items_array = <array>
		getrandomarrayelement <voting_items_array>
		AddArrayElement array = <voting_items_array> element = <element>
		<voting_items_array> = <array>
		GetArraySize <voting_items_array>
		if (<array_Size> > 0)
			array = []
			i = 0
			begin
			AddArrayElement array = <array> element = (<voting_items_array> [<i>])
			i = (<i> + 1)
			repeat <array_Size>
		endif
	endif
	return game_rules_voting_array = <array>
endscript

script generate_voting_items 
	RequireParams \{[
			items_array
		]
		all}
	printf \{qs(0x5922c3a5)}
	GetArraySize <items_array>
	if (<array_Size> >= 2)
		if (<array_Size> = 2)
			return voting_items_array = <items_array>
		else
			array = []
			i = 0
			j = 0
			begin
			getrandomarrayelement <items_array>
			if NOT ArrayContains array = <array> contains = <element>
				AddArrayElement array = <array> element = <element>
				i = (<i> + 1)
				if (<i> = 2)
					break
				endif
			endif
			j = (<j> + 1)
			printf qs(0x9a0ed12a) d = <j>
			repeat
			return voting_items_array = <array>
		endif
	else
		printstruct <...>
		ScriptAssert \{qs(0xc58d0742)}
	endif
endscript

script cast_vote 
	RequireParams \{[
			option
		]
		all}
	printf \{qs(0x20f736cb)}
	allowed = 1
	GetArraySize ($g_controllers_that_voted)
	if (<array_Size> > 0)
		i = 0
		begin
		if (<device_num> = (($g_controllers_that_voted) [<i>]))
			allowed = 0
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	if (<allowed> = 1)
		array = ($g_controllers_that_voted)
		AddArrayElement array = <array> element = <device_num>
		Change g_controllers_that_voted = <array>
		if ininternetmode
			SendStructure callback = cast_vote_callback data_to_send = {option = <option>}
			if IsHost
				SetArrayElement globalarray ArrayName = g_vote_counts index = <option> NewValue = (($g_vote_counts [<option>]) + 1)
			endif
		else
			SetArrayElement globalarray ArrayName = g_vote_counts index = <option> NewValue = (($g_vote_counts [<option>]) + 1)
		endif
	else
		printf \{qs(0x4395d3e0)}
	endif
endscript

script cast_vote_callback 
	RequireParams \{[
			option
		]
		all}
	printf \{qs(0xc4c44d96)}
	cast_vote_ui_sfx option = <option>
	SetArrayElement globalarray ArrayName = g_vote_counts index = <option> NewValue = (($g_vote_counts [<option>]) + 1)
	if IsHost
		SendStructure callback = cast_vote_callback data_to_send = {option = <option>}
	endif
endscript

script band_lobby_send_invite 
	RequireParams \{[
			instrument
			net_id
			Name
			controlling_player
		]}
	printf \{channel = band_lobby
		qs(0xc172e72b)}
	Change g_inviting_player = <controlling_player>
	if NOT InNetGame
		gh5_band_screen_ui_sound player_num = <Player> choose = 1
		if ininternetmode
			Change \{g_lobby_was_local_before_invite = 0}
		endif
		band_lobby_seamless_net_change {
			network = net_private
			Player = <controlling_player>
			callback = invite_to_game
			callback_params = {
				instrument = <instrument>
				net_id = <net_id>
				Name = <Name>
				device_num = <device_num>
			}
		}
	endif
endscript

script band_lobby_seamless_net_change \{callback_params = {
		}}
	gh5_band_screen_ui_sound player_num = <Player> choose = 1
	RequireParams \{[
			Player
			network
			callback
		]
		all}
	printf \{channel = band_lobby
		qs(0xf17ee82e)}
	printscriptinfo \{qs(0xfd2558b1)}
	printstruct <...>
	if (<network> = local)
		band_lobby_change_network Player = <Player> network = <network> focus = 1
		<callback> <callback_params>
	else
		trigger_seemless_change = 0
		if ((CheckForSignIn controller_index = $primary_controller dont_set_primary) && (islobbyconnected default_lobby))
			if band_lobby_check_if_all_players_are_online_enabled
				if NetSessionFunc \{func = areallactivecontrollersmultiplayerallowed}
					if GotParam \{from_friendslist}
						band_lobby_change_network Player = <Player> network = <network> focus = 0
					else
						band_lobby_change_network Player = <Player> network = <network> focus = 1
					endif
					<callback> <callback_params>
				else
					trigger_seemless_change = 1
				endif
			else
				trigger_seemless_change = 1
			endif
			if (<trigger_seemless_change> = 1)
				if band_lobby_live_profile_ingame \{multiplayer_enabled}
					if band_lobby_are_all_players_signed_in
						msg_checksum = change_profile
					else
						msg_checksum = signin_to_profile
					endif
				else
					msg_checksum = signin_to_profile
				endif
				if band_lobby_desc_id :desc_resolvealias \{Name = alias_pu_cont_parent}
					band_lobby_create_popup_menu {
						menu = change_profile
						Player = <Player>
						container = <resolved_id>
						msg_checksum = <msg_checksum>
					}
				endif
			endif
		else
			show_last_connection_error \{unfocus_script = band_lobby_change_focus_submenu_all
				unfocus_params = {
					focus_type = unfocus
				}
				continue_script = band_lobby_return_from_error}
			band_lobby_update_ticker \{msg_checksum = current_state}
		endif
	endif
endscript

script band_lobby_return_from_error 
	destroy_dialog_box
	band_lobby_kick_leader_out_of_band_manage
	band_lobby_change_focus_submenu_all \{focus_type = focus}
	band_lobby_update_button_helpers
endscript

script band_lobby_prepare_for_matchmaking 
	RequireParams \{[
			Player
			private
		]
		all}
	printf \{channel = band_lobby
		qs(0x10c18b89)}
	Change \{g_lobby_invite_flag = 0}
	Change \{respond_to_signin_changed = 1}
	Change \{respond_to_signin_changed_all_players = 1}
	gamemode_gettype
	if checksumequals a = ($game_mode) b = fest_mode
		gamemode_updatenumplayers \{num_players = 8}
	elseif checksumequals a = ($game_mode) b = fest_mode_team
		gamemode_updatenumplayers \{num_players = 8}
	elseif (<Type> = competitive)
		session_stats_reset
		gamemode_updatenumplayers \{num_players = 8}
	endif
	band_lobby_kill_party_object_polling
	lock_all_controllers
	band_lobby_store_playerinfo
	band_lobby_display_matchmaking_progress_ui Player = <Player> private = <private>
endscript

script band_lobby_kick_remote_player_popup 
	RequireParams \{[
			user_id
			controlling_player
		]
		all}
	printf \{channel = band_lobby
		qs(0xd26c63c8)}
	if ininternetmode
		band_lobby_change_focus_submenu_all \{focus_type = unfocus}
		ui_event_get_top
		if GotParam \{is_popup}
			printf \{qs(0x251ccb39)}
			event_type = menu_replace
		else
			event_type = menu_change
		endif
		options = [
			{
				func = band_lobby_kick_remote_player
				text = ($band_lobby_strings.popup_submenu_kick)
				func_params = {
					user_id = <user_id>
				}
			}
			{
				func = band_lobby_kick_remote_player_cancel
				text = ($band_lobby_strings.popup_option_cancel)
			}
		]
		getplayerinfo <controlling_player> controller
		ui_event {
			event = <event_type>
			data = {
				is_popup
				state = uistate_band_lobby_popup
				controller = <controller>
				reason = popup_kick_player
				options = <options>
				title = ($band_lobby_strings.popup_title_warning)
				back_script = band_lobby_kick_remote_player_cancel
				z_priority = 1150.0
			}
		}
	endif
endscript

script band_lobby_kick_remote_player 
	RequireParams \{[
			user_id
		]
		all}
	if ininternetmode
		if NetSessionFunc \{Obj = party
				func = is_host}
			NetSessionFunc Obj = party func = kick_player params = {user_id = <user_id>}
		else
			SendStructure callback = band_lobby_kick_remote_player channel = party data_to_send = {user_id = <user_id>}
		endif
		if InNetGame
			if IsHost
				NetSessionFunc func = kick_player params = {player_xuid = <user_id>}
			endif
		endif
		band_lobby_change_focus_submenu_all \{focus_type = focus}
		generic_event_back
	endif
endscript

script band_lobby_kick_remote_player_cancel 
	band_lobby_change_focus_submenu_all \{focus_type = focus}
	generic_event_back
endscript

script band_lobby_common_start_host_migration 
	if band_lobby_does_popup_exist
		band_lobby_destroy_popup_menu
	endif
	band_lobby_change_focus_submenu_all \{focus_type = unfocus}
	band_lobby_update_ticker \{msg_checksum = host_migration}
	Change \{respond_to_signin_changed_all_players = 1}
endscript

script band_lobby_common_finish_host_migration 
	ui_band_lobby_anim_in
	band_lobby_update_ticker \{msg_checksum = current_state}
endscript

script band_lobby_change_band_leader_callback 
	printf \{qs(0x432a320d)}
	if band_lobby_get_player_num_by_party_id party_id = <party_id>
		Change g_net_leader_player_num = <player_num>
	endif
endscript

script band_lobby_change_band_leader 
	if GotParam \{Player}
		old_leader = ($g_net_leader_player_num)
		if ininternetmode
			if playerinfoequals <Player> is_local_client = 1
				Change g_leader_player_num = <Player>
				if NetSessionFunc \{Obj = party
						func = is_host}
					Change g_net_leader_player_num = <Player>
				else
					getplayerinfo <Player> party_id
					SendStructure {
						callback = band_lobby_change_band_leader_callback
						channel = party
						data_to_send = {
							party_id = <party_id>
						}
					}
				endif
			else
				if NetSessionFunc \{Obj = party
						func = is_host}
					Change g_net_leader_player_num = <Player>
				else
					getplayerinfo <Player> party_id
					SendStructure {
						callback = band_lobby_change_band_leader_callback
						channel = party
						data_to_send = {
							party_id = <party_id>
						}
					}
				endif
			endif
		else
			Change g_leader_player_num = <Player>
			Change g_net_leader_player_num = <Player>
			band_lobby_pick_default_venue Player = <Player>
			band_lobby_refresh_band_leader_characters
		endif
		if NOT GotParam \{from_join}
			players_list_refresh
			band_lobby_adjust_submenus_for_leader_change old_leader = <old_leader>
			band_lobby_refresh_all_submenus \{Type = local}
			band_lobby_flash_ticker_msg \{msg_checksum = leader_changed
				time = 3}
			band_lobby_refresh_band_leader_characters \{no_refresh}
			persistent_band_refresh_changed_characters
		endif
	else
		printf \{qs(0x0d5858d2)}
	endif
	if GotParam \{play_sound}
		if (<play_sound> = 1)
			SoundEvent \{event = band_lobby_leader}
		endif
	endif
	band_lobby_update_lobby_title
endscript

script band_lobby_adjust_submenus_for_leader_change 
	RequireParams \{[
			old_leader
		]
		all}
	printf \{channel = band_lobby
		qs(0x71a605d8)}
	i = 0
	begin
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <i>
	if ($g_net_leader_player_num = ($<submenu_data>.Player))
		setplayerinfo ($<submenu_data>.Player) chosen_character_id = None
		setplayerinfo ($<submenu_data>.Player) chosen_character_savegame = -1
		band_lobby_update_submenu_data submenu_index = <i> element = menu_indices value = [0 0 0]
		if ($g_lobby_state = career)
			band_lobby_update_submenu_data submenu_index = <i> element = menu value = band_leader_career
		elseif ($g_lobby_state = quickplay)
			band_lobby_update_submenu_data submenu_index = <i> element = menu value = band_leader_quickplay
		else
			band_lobby_update_submenu_data submenu_index = <i> element = menu value = band_leader_vs
		endif
	else
		if (($<submenu_data>.Player) = <old_leader>)
			setplayerinfo ($<submenu_data>.Player) chosen_character_id = None
			setplayerinfo ($<submenu_data>.Player) chosen_character_savegame = -1
			band_lobby_update_submenu_data submenu_index = <i> element = menu_indices value = [0 0 0]
			band_lobby_update_submenu_data submenu_index = <i> element = menu value = band_member
		endif
	endif
	i = (<i> + 1)
	repeat ($g_num_lobby_local_submenus)
endscript

script band_lobby_grant_leadership 
	RequireParams \{[
			Player
		]
		all}
	printf \{channel = band_lobby
		qs(0x1174822a)}
	band_lobby_change_band_leader Player = <Player> play_sound = 1
endscript

script band_lobby_setup_strings 
	printf \{channel = band_lobby
		qs(0xdb79afa2)}
	additional_strings = {}
	if isxenonorwindx
		additional_strings = ($band_lobby_xenon_strings)
	elseif isps3
		additional_strings = ($band_lobby_ps3_strings)
	elseif isngc
		additional_strings = ($band_lobby_ngc_strings)
	endif
	Change band_lobby_strings = {($band_lobby_common_strings) <additional_strings>}
endscript

script band_lobby_add_local_players_to_submenus 
	printf \{channel = band_lobby
		qs(0x0c3e5146)}
	array = [-1 -1 -1 -1]
	getmaxplayers
	i = 0
	begin
	if playerinfoequals (<i> + 1) in_game = 1
		if playerinfoequals (<i> + 1) is_local_client = 1
			getplayerinfo (<i> + 1) controller
			SetArrayElement ArrayName = array index = <controller> NewValue = <i>
		endif
	endif
	i = (<i> + 1)
	repeat <max_players>
	controller_to_player_array = <array>
	i = 0
	begin
	if ((<controller_to_player_array> [<i>]) >= 0)
		array = [0 0]
		if CheckForSignIn controller_index = <i> dont_set_primary
			GetNetID controller_index = <i>
			SetArrayElement ArrayName = array index = 0 NewValue = <net_id_first>
			SetArrayElement ArrayName = array index = 1 NewValue = <net_id_second>
			if ((isps3) || (isngc))
				getplayerinfo ((<controller_to_player_array> [<i>]) + 1) gamertag
				band_lobby_get_submenu_data viewport_index = <i> param = gamertag_checksum
				Change GlobalName = <submenu_data> NewValue = ($<gamertag>)
			endif
		endif
		band_lobby_update_submenu_data submenu_index = <i> element = Player value = ((<controller_to_player_array> [<i>]) + 1)
		band_lobby_update_submenu_data submenu_index = <i> element = occupied value = 1
		band_lobby_update_submenu_data submenu_index = <i> element = net_id value = <array>
	else
		band_lobby_update_submenu_data submenu_index = <i> element = occupied value = 0
	endif
	band_lobby_update_submenu_data submenu_index = <i> element = menu value = empty
	band_lobby_update_submenu_data submenu_index = <i> element = is_updating value = 0
	i = (<i> + 1)
	repeat ($g_num_lobby_local_submenus)
endscript

script band_lobby_add_remote_players_to_submenus 
	printf \{channel = band_lobby
		qs(0x43967c7f)}
	getnumplayersingame \{remote}
	if (<num_players> > 0)
		getfirstplayer \{remote}
		begin
		i = 0
		begin
		band_lobby_get_submenu_data_new submenu_index = <i> param = occupied
		if (<occupied> = 0)
			array = []
			getplayerinfo <Player> net_id_first
			getplayerinfo <Player> net_id_second
			AddArrayElement array = <array> element = <net_id_first>
			AddArrayElement array = <array> element = <net_id_second>
			band_lobby_update_submenu_data submenu_index = <i> element = Player value = <Player>
			band_lobby_update_submenu_data submenu_index = <i> element = occupied value = 1
			band_lobby_update_submenu_data submenu_index = <i> element = net_id value = <array>
			if ((isps3) || (isngc))
				getplayerinfo <Player> gamertag
				band_lobby_get_submenu_data viewport_index = <i> param = gamertag_checksum
				Change GlobalName = <submenu_data> NewValue = ($<gamertag>)
			endif
			if ($g_num_lobby_local_submenus > <i>)
				setplayerinfo <Player> controller = <i>
			endif
			break
		endif
		i = (<i> + 1)
		repeat ($g_num_lobby_total_submenus)
		getnextplayer Player = <Player> remote
		repeat <num_players>
	endif
endscript

script band_lobby_return_from_game_rules \{net_change = 1}
	printf \{channel = band_lobby
		qs(0x7b13ff8e)}
	if (<net_change> = 1)
		if NOT band_lobby_does_have_remote_party_connections
			restore_local_leadership = 1
			band_lobby_change_network Player = ($g_leader_player_num) network = local
		endif
	endif
	band_lobby_set_party_joinable \{joinable = 1}
	band_lobby_destroy_popup_menu <...>
endscript

script bl_is_in_band_lobby_menus 
	printf \{channel = band_lobby
		qs(0x3e02d7b9)}
	in_bl = 0
	if ($g_band_lobby_flag = 1)
		ui_event_get_stack
		if ((<stack> [0].base_name) = 'band_lobby')
			in_bl = 1
		else
			if (<stack_size> > 1)
				if ((<stack> [1].base_name) = 'band_lobby')
					ui_event_get_top
					if GotParam \{is_popup}
						in_bl = 1
					endif
				endif
			endif
		endif
	endif
	if (<in_bl> = 1)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script temp_clear_upper_player_infos 
	printf \{qs(0xc0a0339a)}
	gamemode_getnumplayers
	getmaxplayers
	player_num = (<num_players> + 1)
	if ((<max_players> - <num_players>) > 0)
		begin
		net_clear_player_info Player = <player_num> on_screen = 0
		player_num = (<player_num> + 1)
		repeat (<max_players> - <num_players>)
	endif
endscript

script band_lobby_can_manage_band_members 
	printf \{channel = band_lobby
		qs(0x6df1e7d7)}
	if InNetGame
		return \{FALSE}
	endif
	if ($g_career_search != NULL)
		return \{FALSE}
	endif
	return \{true}
endscript

script band_lobby_are_all_players_signed_in 
	printf \{channel = band_lobby
		qs(0xa1ff01a5)}
	ret = true
	getnumplayersingame \{local}
	if (<num_players> > 0)
		getfirstplayer \{local}
		begin
		getplayerinfo <Player> controller
		if NOT CheckForSignIn local controller_index = <controller> dont_set_primary
			ret = FALSE
			break
		endif
		getnextplayer Player = <Player> local
		repeat <num_players>
	endif
	if (<ret> = true)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script band_lobby_get_player_user_id 
	RequireParams \{[
			Player
		]
		all}
	array = []
	getplayerinfo <Player> net_id_first
	getplayerinfo <Player> net_id_second
	AddArrayElement array = <array> element = <net_id_first>
	AddArrayElement array = <array> element = <net_id_second>
	return user_id = <array>
endscript

script band_lobby_can_toggle_guitar_bass 
	printf \{channel = band_lobby
		qs(0x6f9a82ba)}
	getnumplayersingame \{local}
	if (<num_players> > 0)
		getfirstplayer \{local}
		begin
		if playerinfoequals <Player> part = guitar
			return \{true}
		endif
		if playerinfoequals <Player> part = bass
			return \{true}
		endif
		getnextplayer Player = <Player> local
		repeat <num_players>
	endif
	return \{FALSE}
endscript

script band_lobby_satisfy_min_players \{game_rule = faceoff}
	RequireParams \{[
			team
		]
		all}
	printf \{channel = band_lobby
		qs(0x36dc2647)}
	getnumplayersingame
	if (<num_players> > 0)
		if (<team> = 1)
			min_players = 4
		else
			if (<game_rule> = elimination)
				min_players = 3
			else
				min_players = 2
			endif
		endif
		if (<num_players> >= <min_players>)
			return \{true}
		else
			return \{FALSE}
		endif
	else
		return \{FALSE}
	endif
endscript

script band_lobby_is_matching_instruments 
	printf \{channel = band_lobby
		qs(0x0f451bf4)}
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		getplayerinfo <Player> part
		begin
		if NOT playerinfoequals <Player> part = <part>
			return \{FALSE}
		endif
		getnextplayer Player = <Player>
		repeat <num_players>
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script band_lobby_is_even_number_of_instruments 
	printf \{channel = band_lobby
		qs(0xce3de9d5)}
	getnumplayersingame
	if (<num_players> > 0)
		num_guitars = 0
		num_drums = 0
		num_mics = 0
		num_bass = 0
		getfirstplayer
		begin
		if playerinfoequals <Player> part = guitar
			num_guitars = (<num_guitars> + 1)
		elseif playerinfoequals <Player> part = bass
			num_bass = (<num_bass> + 1)
		elseif playerinfoequals <Player> part = drum
			num_drums = (<num_drums> + 1)
		elseif playerinfoequals <Player> part = vocals
			num_mics = (<num_mics> + 1)
		endif
		getnextplayer Player = <Player>
		repeat <num_players>
		Mod a = <num_guitars> b = 2
		guitar_result = <Mod>
		Mod a = <num_bass> b = 2
		bass_result = <Mod>
		Mod a = <num_drums> b = 2
		drums_result = <Mod>
		Mod a = <num_mics> b = 2
		mic_result = <Mod>
		if ((<guitar_result> = 0) && (<bass_result> = 0) && (<drums_result> = 0) && (<mic_result> = 0))
			return \{true}
		else
			return \{FALSE}
		endif
	else
		return \{FALSE}
	endif
endscript

script band_lobby_is_traditional_band 
	printf \{channel = band_lobby
		qs(0x90fba1d2)}
	getnumplayersingame
	if (<num_players> > 4)
		max_guitarists = 4
		max_drummers = 2
		max_vocalists = 2
	else
		max_guitarists = 2
		max_drummers = 1
		max_vocalists = 1
	endif
	if (<num_players> > 0)
		num_guitarists = 0
		num_drummers = 0
		num_vocalists = 0
		getfirstplayer
		begin
		if playerinfoequals <Player> part = guitar
			num_guitarists = (<num_guitarists> + 1)
		elseif playerinfoequals <Player> part = bass
			num_guitarists = (<num_guitarists> + 1)
		elseif playerinfoequals <Player> part = drum
			num_drummers = (<num_drummers> + 1)
		elseif playerinfoequals <Player> part = vocals
			num_vocalists = (<num_vocalists> + 1)
		endif
		getnextplayer Player = <Player>
		repeat <num_players>
		if (
				(<num_guitarists> > <max_guitarists>) ||
				(<num_drummers> > <max_drummers>) ||
				(<num_vocalists> > <max_vocalists>)
			)
			return \{FALSE}
		else
			return \{true}
		endif
	else
		return \{FALSE}
	endif
endscript

script band_lobby_islocallobby 
	printf \{channel = band_lobby
		qs(0xb02c69d6)}
	if NOT freestyle_is_active
		if ($g_lobby_net_state = local)
			return \{true}
		else
			return \{FALSE}
		endif
	else
		return \{FALSE}
	endif
endscript

script band_lobby_isnetlobby_and_signin 
	RequireParams \{[
			Player
			viewport_index
		]
		all}
	printf \{channel = band_lobby
		qs(0x2734bd57)}
	if NOT ($g_lobby_net_state = local)
		getplayerinfo <Player> controller
		if CheckForSignIn controller_index = <controller> dont_set_primary
			return \{true}
		else
			return \{FALSE}
		endif
	else
		return \{FALSE}
	endif
endscript

script band_lobby_isnetlobby_and_not_signin 
	RequireParams \{[
			Player
			viewport_index
		]
		all}
	printf \{channel = band_lobby
		qs(0x2dc029bb)}
	if NOT ($g_lobby_net_state = local)
		getplayerinfo <Player> controller
		if CheckForSignIn controller_index = <controller> dont_set_primary
			return \{FALSE}
		else
			return \{true}
		endif
	else
		return \{FALSE}
	endif
endscript

script band_lobby_isguitarcontroller 
	printf \{channel = band_lobby
		qs(0x24fc26c7)}
	RequireParams \{[
			Player
			viewport_index
		]
		all}
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <viewport_index>
	getplayerinfo ($<submenu_data>.Player) controller
	if ($allow_controller_for_all_instruments = 1)
		return \{true}
	elseif IsGuitarController controller = <controller>
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script band_lobby_isdrumcontroller 
	printf \{channel = band_lobby
		qs(0xfce5cf51)}
	RequireParams \{[
			Player
			viewport_index
		]
		all}
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <viewport_index>
	getplayerinfo ($<submenu_data>.Player) controller
	if isdrumcontroller controller = <controller>
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script band_lobby_isvocalscontroller 
	printf \{channel = band_lobby
		qs(0xf0c599d4)}
	RequireParams \{[
			Player
			viewport_index
		]
		all}
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <viewport_index>
	getplayerinfo ($<submenu_data>.Player) controller
	if NOT band_lobby_check_is_guitar_or_drum_controller Player = <Player> viewport_index = <viewport_index>
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script band_lobby_check_is_guitar_or_drum_controller 
	printf \{channel = band_lobby
		qs(0x7b5dc77c)}
	RequireParams \{[
			Player
			viewport_index
		]
		all}
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <viewport_index>
	getplayerinfo ($<submenu_data>.Player) controller
	if ($allow_controller_for_all_instruments = 1)
		return \{true}
	elseif IsGuitarController controller = <controller>
		return \{true}
	elseif isdrumcontroller controller = <controller>
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script band_lobby_check_is_drummer 
	printf \{channel = band_lobby
		qs(0xe610e314)}
	RequireParams \{[
			Player
			viewport_index
		]
		all}
	getplayerinfo <Player> part
	if (<part> = drum)
		return \{true}
	endif
	return \{FALSE}
endscript

script band_lobby_isbandleader 
	printf \{channel = band_lobby
		qs(0x5e1f3eb1)}
	RequireParams \{[
			Player
			viewport_index
		]
		all}
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <viewport_index>
	if (($<submenu_data>.Player) = ($g_net_leader_player_num))
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script band_lobby_is_career_available 
	printf \{channel = band_lobby
		qs(0xd7f0ccc6)}
	RequireParams \{[
			Player
			viewport_index
		]
		all}
	return \{true}
	if NOT band_lobby_are_remote_players_in_game
		band_lobby_get_submenu_data viewport_index = <viewport_index> param = Player
		getplayerinfo <submenu_data> controller
		if NOT has_completed_forced_career_flow device_num = <controller>
			return \{FALSE}
		endif
	endif
	return \{true}
endscript

script band_lobby_isoccupied 
	printf \{channel = band_lobby
		qs(0xe061c6df)}
	RequireParams \{[
			Player
			viewport_index
		]
		all}
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <viewport_index>
	if (($<submenu_data>.occupied) = 1)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script band_lobby_check_is_occupied_guitarist 
	printf \{channel = band_lobby
		qs(0xe061c6df)}
	RequireParams \{[
			Player
			viewport_index
		]
		all}
	if band_lobby_isoccupied <...>
		if band_lobby_isguitarcontroller <...>
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script band_lobby_should_force_highway_view 
	RequireParams \{[
			Player
		]}
	vocals_get_num_vocalists
	if (<num_vocalists> = 1)
		return \{true}
	endif
	return \{FALSE}
endscript

script band_lobby_sync_highway_view 
	RequireParams \{[
			Player
		]}
	this_player = <Player>
	getnumplayersingame \{local}
	if (<num_players> > 0)
		getfirstplayer \{local}
		begin
		if playerinfoequals <Player> part = vocals
			if NOT (<this_player> = <Player>)
				getplayerinfo <Player> vocals_highway_view
				setplayerinfo <this_player> vocals_highway_view = <vocals_highway_view>
				return
			endif
		endif
		getnextplayer local Player = <Player>
		repeat <num_players>
	endif
endscript

script band_lobby_set_vocals_highway_view 
	RequireParams \{[
			Player
			vocals_highway_view
		]
		all}
	getnumplayersingame \{local}
	if (<num_players> > 0)
		getfirstplayer \{local}
		begin
		if playerinfoequals <Player> part = vocals
			setplayerinfo <Player> vocals_highway_view = <vocals_highway_view> store
		endif
		getnextplayer local Player = <Player>
		repeat <num_players>
	endif
endscript

script band_lobby_is_primary_vocalist_ 
	printf \{channel = band_lobby
		qs(0x69f4f57d)}
	RequireParams \{[
			Player
			viewport_index
		]
		all}
	if NOT band_lobby_isvocals Player = <Player> viewport_index = <viewport_index>
		return \{FALSE}
	endif
	this_player = <Player>
	getnumplayersingame \{on_screen}
	if (<num_players> > 0)
		getfirstplayer
		begin
		if playerinfoequals <Player> part = vocals
			if (<this_player> = <Player>)
				return \{true}
			else
				return \{FALSE}
			endif
		endif
		getnextplayer Player = <Player>
		repeat <num_players>
	endif
	return \{FALSE}
endscript

script band_lobby_should_show_mic_preference 
	RequireParams \{[
			Player
		]}
	if ((isps3) || (isngc))
		return \{FALSE}
	else
		if playerinfoequals <Player> part = vocals
			getplayerinfo <Player> controller
			band_lobby_get_is_guest device_num = <controller>
			if (<is_guest> = 1)
				return \{FALSE}
			endif
			if GotParam \{ignore_headset}
				return \{true}
			endif
			if controller_has_headset controller = <controller>
				return \{true}
			else
				return \{FALSE}
			endif
		else
			return \{FALSE}
		endif
	endif
endscript

script band_lobby_should_show_mic_preference_ignore_headset 
	RequireParams \{[
			Player
		]}
	if band_lobby_should_show_mic_preference ignore_headset Player = <Player>
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script band_lobby_isvocals 
	printf \{channel = band_lobby
		qs(0x06870d9d)}
	RequireParams \{[
			Player
			viewport_index
		]
		all}
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <viewport_index>
	if playerinfoequals ($<submenu_data>.Player) part = vocals
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script band_lobby_isnotlocal 
	printf \{channel = band_lobby
		qs(0x8d1dd4ef)}
	if ($g_lobby_net_state = local)
		return \{FALSE}
	else
		return \{true}
	endif
endscript

script band_lobby_isnotprivate 
	printf \{channel = band_lobby
		qs(0x97bd600f)}
	if ($g_lobby_net_state = net_private)
		return \{FALSE}
	else
		return \{true}
	endif
endscript

script band_lobby_isnotpublic 
	printf \{channel = band_lobby
		qs(0x181d1eed)}
	if ($g_lobby_net_state = net_public)
		return \{FALSE}
	else
		return \{true}
	endif
endscript

script band_lobby_controller_enabled 
	printf \{channel = band_lobby
		qs(0x59830b32)}
	RequireParams \{[
			Player
			viewport_index
		]
		all}
	if ($allow_controller_for_all_instruments = 1)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script band_lobby_is_quickplay_state 
	printf \{channel = band_lobby
		qs(0x1f1859d7)}
	if ($g_lobby_state = quickplay)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script band_lobby_is_career_state 
	printf \{channel = band_lobby
		qs(0x166ecd72)}
	if ($g_lobby_state = career)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script band_lobby_is_vs_state 
	printf \{channel = band_lobby
		qs(0xf195cb54)}
	if ($g_lobby_state = vs)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script band_lobby_is_public_vs_state 
	printf \{channel = band_lobby
		qs(0x34044f43)}
	if (band_lobby_is_vs_state)
		if ($g_lobby_net_state = net_public)
			return \{true}
		elseif ($g_lobby_net_state = net_private)
			return \{true}
		else
			return \{FALSE}
		endif
	else
		return \{FALSE}
	endif
endscript

script band_lobby_is_private_vs_state 
	printf \{channel = band_lobby
		qs(0x34044f43)}
	if (band_lobby_is_vs_state)
		if (($g_lobby_net_state = net_private) || ($g_lobby_net_state = local))
			return \{true}
		else
			return \{FALSE}
		endif
	else
		return \{FALSE}
	endif
endscript

script band_lobby_are_no_remote_players_in_game 
	printf \{channel = band_lobby
		qs(0x41ba538a)}
	if band_lobby_are_remote_players_in_game
		return \{FALSE}
	else
		return \{true}
	endif
endscript

script band_lobby_are_remote_players_in_game 
	printf \{channel = band_lobby
		qs(0x0f378fe5)}
	getnumplayersingame \{remote}
	if (<num_players> > 0)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script band_lobby_can_display_ready 
	display_ready = 1
	if ($g_career_search = quickmatch)
		display_ready = 0
	endif
	if InNetGame
		if NOT IsHost
			display_ready = 0
		endif
	endif
	if (<display_ready> = 1)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script band_lobby_does_not_require_signin 
	printf \{channel = band_lobby
		qs(0x0a0e3d05)}
	if NOT freestyle_is_active
		if band_lobby_does_require_signin
			return \{FALSE}
		else
			return \{true}
		endif
	else
		return \{FALSE}
	endif
endscript

script band_lobby_does_require_signin 
	printf \{channel = band_lobby
		qs(0x2d882bf1)}
	if NOT freestyle_is_active
		if band_lobby_are_remote_players_in_game
			return \{true}
		endif
		if ($g_lobby_invite_flag = 1)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script band_lobby_ischeatunlocked 
	printf \{channel = band_lobby
		qs(0xca03bf06)}
	RequireParams \{[
			Player
			viewport_index
			cheat_tag
		]
		all}
	getplayerinfo <Player> controller
	if islocallysignedin controller = <controller>
		if NetSessionFunc func = xenonisguest params = {controller_index = <controller>}
			getplayerinfo ($g_leader_player_num) controller
		endif
		getsavegamefromcontroller controller = <controller>
	else
		getplayerinfo ($g_leader_player_num) controller
		getsavegamefromcontroller controller = <controller>
	endif
	GetGlobalTags user_options param = <cheat_tag> savegame = <savegame>
	if ((<...>.<cheat_tag>) = 1)
		return \{true}
	endif
	return \{FALSE}
endscript

script band_lobby_ready_text 
	RequireParams \{[
			Player
			viewport_index
		]
		all}
	string_checksum = everyone_play
	if ($g_career_search = host_only)
		string_checksum = finish_search
	endif
	return text_params = {a = ($band_lobby_strings.<string_checksum>)}
endscript

script band_lobby_instrumenttext 
	printf \{channel = band_lobby
		qs(0xaaec68ea)}
	RequireParams \{[
			Player
			viewport_index
		]
		all}
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <viewport_index>
	getplayerinfo ($<submenu_data>.Player) part
	return text_params = {a = ($band_lobby_strings.<part>)}
endscript

script band_lobby_difficultytext 
	printf \{channel = band_lobby
		qs(0xdb10145a)}
	RequireParams \{[
			Player
			viewport_index
		]
		all}
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <viewport_index>
	getplayerinfo ($<submenu_data>.Player) difficulty
	if (<difficulty> = expert)
		getplayerinfo ($<submenu_data>.Player) part
		if (<part> = drum)
			getplayerinfo ($<submenu_data>.Player) double_kick_drum
			if (<double_kick_drum> = 1)
				difficulty = expert_plus
			endif
		endif
	endif
	return text_params = {a = ($band_lobby_strings.<difficulty>)}
endscript

script band_lobby_helperpilltext 
	printf \{channel = band_lobby
		qs(0x70fa2a60)}
	RequireParams \{[
			Player
			viewport_index
		]
		all}
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <viewport_index>
	getplayerinfo ($<submenu_data>.Player) controller
	user_control_helper_get_buttonchar button = green controller = <viewport_index>
	formatText TextName = text_param qs(0x4d4555da) s = <buttonchar>
	return text_params = {a = <text_param>}
endscript

script band_lobby_lobbynetstatetext 
	printf \{channel = band_lobby
		qs(0xf227e1b0)}
	return text_params = {a = ($band_lobby_strings.$g_lobby_net_state)}
endscript

script band_lobby_lobbystatetext 
	printf \{channel = band_lobby
		qs(0x8fd97e26)}
	return text_params = {a = ($band_lobby_strings.$g_lobby_state)}
endscript

script band_lobby_gamerulestext 
	printf \{channel = band_lobby
		qs(0x625e1f5b)}
	if StructureContains structure = $band_lobby_strings ($competitive_rules)
		return text_params = {a = ($band_lobby_strings.$competitive_rules)}
	endif
	if StructureContains structure = $band_lobby_strings ($game_mode)
		return text_params = {a = ($band_lobby_strings.$game_mode)}
	endif
	return \{text_params = {
			a = qs(0x54ddb253)
		}}
endscript

script band_lobby_rockertext 
	printf \{channel = band_lobby
		qs(0x2cb86307)}
	RequireParams \{[
			Player
			viewport_index
		]
		all}
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <viewport_index>
	getplayerinfo ($<submenu_data>.Player) character_id
	getplayerinfo ($<submenu_data>.Player) character_savegame
	if GotParam \{character_savegame}
		if playerinfoequals ($<submenu_data>.Player) is_local_client = 1
			get_fullname_of_character savegame = <character_savegame> id = <character_id> profanity_allowed
		else
			get_fullname_of_character savegame = <character_savegame> id = <character_id>
		endif
	else
		fullname = qs(0x00000000)
	endif
	return text_params = {a = <fullname>}
endscript

script band_lobby_venuetext 
	printf \{channel = band_lobby
		qs(0x2b2b6f3b)}
	RequireParams \{[
			Player
			viewport_index
		]
		all}
	venue = qs(0x00000000)
	if StructureContains structure = $LevelZones ($g_band_lobby_current_level)
		if StructureContains structure = ($LevelZones.$g_band_lobby_current_level) title
			if (($LevelZones.($g_band_lobby_current_level).title) = qs(0xa36d3d13))
				<venue> = qs(0x702529b6)
			else
				<venue> = ($LevelZones.($g_band_lobby_current_level).title)
			endif
		endif
	endif
	return text_params = {a = <venue>}
endscript

script band_lobby_cheatonofftext 
	printf \{channel = band_lobby
		qs(0x88ae0cf1)}
	RequireParams \{[
			Name
			Player
			viewport_index
		]
		all}
	option_text = qs(0x7cddf289)
	i = 0
	GetArraySize ($guitar_hero_cheats)
	begin
	if (($guitar_hero_cheats [<i>].Name) = <Name>)
		var = ($guitar_hero_cheats [<i>].var)
		break
	endif
	i = (<i> + 1)
	repeat <array_Size>
	if NOT StructureContains structure = ($guitar_hero_cheats [<i>]) options
		return
	endif
	options = (($guitar_hero_cheats [<i>]).options)
	Global = ((<options> [0]).globals)
	location = ((<Global> [0]).location)
	variable = ((<Global> [0]).Set)
	if (<location> = playerinfo)
		getplayerinfo <Player> <variable>
		if ((<...>.<variable>) != 0)
			option_text = qs(0x0e96422f)
		endif
	elseif (<location> = Global)
		if ($<var> > 0)
			option_text = qs(0x0e96422f)
		endif
	endif
	return text_params = {a = <option_text>}
endscript

script band_lobby_cheattext 
	printf \{channel = band_lobby
		qs(0x16ea52b8)}
	RequireParams \{[
			Name
			Player
			viewport_index
		]
		all}
	getplayerinfo <Player> part
	i = 0
	GetArraySize ($guitar_hero_cheats)
	begin
	if (($guitar_hero_cheats [<i>].Name) = <Name>)
		continue = 0
		if StructureContains structure = ($guitar_hero_cheats [<i>]) part
			if (<part> = ($guitar_hero_cheats [<i>].part))
				continue = 1
			endif
		else
			continue = 1
		endif
		if (<continue> = 1)
			if NOT StructureContains structure = ($guitar_hero_cheats [<i>]) options
				return
			endif
			options = (($guitar_hero_cheats [<i>]).options)
			Global = ((<options> [0]).globals)
			location = ((<Global> [0]).location)
			variable = ((<Global> [0]).Set)
			if (<location> = playerinfo)
				getplayerinfo <Player> <variable>
				current_state = (<...>.<variable>)
				option_text = ((<options> [<current_state>]).text)
			elseif (<location> = Global)
				index = ($<variable>)
				if (<index> < 0)
					index = 0
				endif
				option_text = ((<options> [<index>]).text)
			endif
		endif
	endif
	i = (<i> + 1)
	repeat <array_Size>
	return text_params = {a = <option_text>}
endscript

script band_lobby_startilt_text 
	printf \{channel = band_lobby
		qs(0x726d2a55)}
	RequireParams \{[
			Player
			viewport_index
		]
		all}
	getplayerinfo <Player> use_tilt_for_starpower
	if (<use_tilt_for_starpower> = 1)
		return \{text_params = {
				a = qs(0xe6b22ea1)
			}}
	else
		return \{text_params = {
				a = qs(0x9dd9821b)
			}}
	endif
endscript

script band_lobby_touchstrip_text 
	printf \{channel = band_lobby
		qs(0x4a7aecf2)}
	RequireParams \{[
			Player
			viewport_index
		]
		all}
	getplayerinfo <Player> enable_touch_strip
	if (<enable_touch_strip> = 1)
		return \{text_params = {
				a = qs(0xe6b22ea1)
			}}
	else
		return \{text_params = {
				a = qs(0x9dd9821b)
			}}
	endif
endscript

script band_lobby_outfittext 
	printf \{channel = band_lobby
		qs(0xb6e87619)}
	RequireParams \{[
			Player
			viewport_index
		]
		all}
	get_savegame_from_player Player = <Player>
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <viewport_index>
	getplayerinfo ($<submenu_data>.Player) character_id
	characterprofilegetstruct savegame = <savegame> Name = <character_id>
	current_desc_id = ((<profile_struct>.appearance).cas_outfit.desc_id)
	outfit_array = cas_outfit
	outfit_list = ($<outfit_array>)
	GetArraySize <outfit_list>
	if (<array_Size> > 0)
		i = 0
		begin
		this_ID = ((<outfit_list> [<i>]).desc_id)
		if cas_item_is_visible part = <outfit_array> desc_id = ((<outfit_list> [<i>]).desc_id)
			if is_part_unlocked part = <outfit_array> desc_id = ((<outfit_list> [<i>]).desc_id) savegame = <savegame>
				if ghrocker_body_matches matcheswith = <character_id> part = <outfit_array> desc_id = ((<outfit_list> [<i>]).desc_id)
					if (<this_ID> = <current_desc_id>)
						outfit_name_struct = {a = ((<outfit_list> [<i>]).frontend_desc)}
						break
					endif
				endif
			endif
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	return text_params = <outfit_name_struct>
endscript

script band_lobby_whole_band_mark_first_time_career 
	if isXenon
		getnumplayersingame \{local}
		if (<num_players> > 0)
			getfirstplayer \{local}
			begin
			getplayerinfo <Player> controller
			get_savegame_from_controller controller = <controller>
			if NOT has_completed_forced_career_flow device_num = <controller>
				SetGlobalTags savegame = <savegame> career_progression_tags params = {career_first_time_setup = 1} Progression = true
				band_lobby_set_dirty_save_flag Player = <Player> flag = 1
			endif
			getnextplayer local Player = <Player>
			repeat <num_players>
		endif
	else
		getplayerinfo ($g_leader_player_num) controller
		get_savegame_from_controller controller = <controller>
		if NOT has_completed_forced_career_flow device_num = <controller>
			SetGlobalTags savegame = <savegame> career_progression_tags params = {career_first_time_setup = 1} Progression = true
			band_lobby_set_dirty_save_flag Player = ($g_leader_player_num) flag = 1
		endif
	endif
endscript

script band_lobby_whole_band_autosave 
	SpawnScriptNow band_lobby_whole_band_autosave_spawned params = <...>
endscript

script band_lobby_whole_band_autosave_spawned 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	setscriptcannotpause
	RequireParams \{[
			choose_script
			Player
			viewport_index
		]
		all}
	original_player_var = <Player>
	original_viewport_index = <viewport_index>
	is_saving = [0 0 0 0]
	is_saving_on_lobby_leave = 0
	if isXenon
		getnumplayersingame \{local}
		if (<num_players> > 0)
			getfirstplayer \{local}
			begin
			band_lobby_get_player_submenu_index player_num = <Player>
			if (<submenu_index> > -1)
				if (<submenu_index> < ($g_num_lobby_local_submenus))
					if band_lobby_autosave choose_script = nullscript Player = <Player> viewport_index = <submenu_index>
						SetArrayElement ArrayName = is_saving index = <submenu_index> NewValue = 1
						is_saving_on_lobby_leave = 1
					endif
				endif
			endif
			getnextplayer local Player = <Player>
			repeat <num_players>
		endif
	else
		band_lobby_get_player_submenu_index \{player_num = $g_leader_player_num}
		if band_lobby_autosave choose_script = nullscript Player = $g_leader_player_num viewport_index = <submenu_index>
			SetArrayElement ArrayName = is_saving index = <submenu_index> NewValue = 1
			is_saving_on_lobby_leave = 1
		endif
	endif
	printstruct <is_saving>
	clean_up_user_control_helpers
	temp_menus = [NULL NULL NULL NULL]
	if (<is_saving_on_lobby_leave> = 1)
		i = 0
		begin
		if ((<is_saving> [<i>]) = 0)
			formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <i>
			if playerinfoequals ($<submenu_data>.Player) is_local_client = 1
				SetArrayElement ArrayName = temp_menus index = <i> NewValue = ($<submenu_data>.menu)
				band_lobby_change_menu viewport_index = <i> Player = ($<submenu_data>.Player) action = forward focus = 0 menu = empty no_forced
			endif
		endif
		i = (<i> + 1)
		repeat ($g_num_lobby_local_submenus)
	endif
	begin
	if NOT savegame_async_is_busy
		break
	endif
	if ($enable_saving = 0)
		break
	endif
	printf \{'Waiting for lobby saving to complete'}
	Wait \{1
		gameframe}
	repeat
	i = 0
	begin
	if NOT (<temp_menus> [<i>] = NULL)
		band_lobby_get_submenu_data_new submenu_index = <i> param = Player
		band_lobby_change_menu viewport_index = <i> Player = <Player> action = back focus = 0 menu = (<temp_menus> [<i>]) no_forced
	endif
	i = (<i> + 1)
	repeat ($g_num_lobby_local_submenus)
	if ((($savegame_async_last_error) = None) || (<is_saving_on_lobby_leave> = 0))
		if ininternetmode
			printstruct <...>
			if GotParam \{scan_dlc_if_online}
				if NOT band_lobby_handle_online_dlc_enum <...>
					return
				endif
			endif
		endif
		<choose_script> <...> Player = <original_player_var> viewport_index = <original_viewport_index> was_autosaving = 1
	endif
endscript

script band_lobby_needs_save 
	RequireParams \{[
			Player
		]
		all}
	getplayerinfo <Player> controller
	if isXenon
		if ($g_band_lobby_dirty_saves [<controller>] = 1)
			return \{true}
		endif
	else
		if ($g_band_lobby_dirty_saves [0] = 1)
			return \{true}
		endif
	endif
endscript

script band_lobby_set_dirty_save_flag 
	RequireParams \{[
			flag
		]
		all}
	if GotParam \{Player}
		getplayerinfo <Player> controller
	else
		RequireParams \{[
				savegame
			]
			all}
		controller = <savegame>
	endif
	if isXenon
		SetArrayElement ArrayName = g_band_lobby_dirty_saves index = <controller> NewValue = <flag> globalarray
	else
		SetArrayElement ArrayName = g_band_lobby_dirty_saves index = 0 NewValue = <flag> globalarray
	endif
endscript

script band_lobby_autosave \{Force = 0}
	RequireParams \{[
			choose_script
			Player
			viewport_index
			Force
		]
		all}
	getplayerinfo <Player> controller
	if (((isps3) || (isngc)) && (GotParam not_on_ps3))
		should_save = 0
	else
		should_save = <Force>
		if (<should_save> = 0)
			if band_lobby_needs_save Player = <Player>
				should_save = 1
			endif
		endif
	endif
	band_lobby_get_is_guest device_num = <controller>
	if ((islocallysignedin controller = <controller>) && (<is_guest> = 0) && (<should_save> = 1))
		get_savegame_from_controller controller = <controller>
		if get_savegame_has_saved_game savegame = <savegame>
			if is_autosave_on savegame = <savegame>
				savegame_async_save savegame = <savegame> callback = lobby_mc_autosave_callback data = <...>
				band_lobby_change_menu menu = mc_saving action = forward Player = <Player> viewport_index = <viewport_index> no_forced focus = 0
				return \{true}
			endif
		endif
	endif
	<choose_script> <...>
	return \{FALSE}
endscript

script net_career_goto_band_lobby 
	printf \{qs(0x02555b76)}
	end_singleplayer_game
	KillSpawnedScript \{Name = loading_screen_crowd_swell}
	KillSpawnedScript \{Name = crowd_loading_whistle}
	if GotParam \{from_encore}
		kill_gem_scroller
	endif
	ui_event_wait_for_safe
	career_end_challenge
	GetGlobalTags \{user_options}
	if (<autosave> = 1)
		ui_memcard_autosave_all_players \{event = menu_back
			state = uistate_career_venue_select}
	else
		ui_event \{event = menu_back
			data = {
				state = uistate_career_venue_select
			}}
	endif
endscript

script lobby_mc_autosave_callback 
	printscriptinfo \{'lobby_mc_autosave_callback'}
	printstruct <...>
	if GotParam \{update_ui}
	else
		if (<success> = 1)
			band_lobby_set_dirty_save_flag savegame = <savegame> flag = 0
		else
			if GotParam \{error}
				lobby_mc_handle_error <...>
				return
			endif
			ScriptAssert \{'This should not happen when autosaving'}
		endif
		choose_script = (<data>.choose_script)
		<choose_script> <data>
	endif
endscript

script lobby_mc_loading_callback 
	printscriptinfo \{'lobby_mc_loading_callback'}
	printstruct <...>
	if GotParam \{update_ui}
		if GotParam \{saving}
			band_lobby_change_menu menu = mc_saving action = forward Player = (<data>.Player) viewport_index = (<data>.viewport_index) no_forced focus = 0
		elseif GotParam \{loading}
			band_lobby_change_menu menu = mc_loading action = forward Player = (<data>.Player) viewport_index = (<data>.viewport_index) no_forced focus = 0
		endif
	else
		if (<success> = 1)
			if ($g_leader_player_num >= 0)
				load_saved_extras_states_for_player Player = (<data>.Player) controller = (<data>.controller) leader = ($g_leader_player_num)
			endif
		else
			if GotParam \{error}
				lobby_mc_handle_error <...>
				return
			endif
		endif
		if band_lobby_does_popup_exist
			band_lobby_change_menu menu = main action = forward Player = (<data>.Player) viewport_index = (<data>.viewport_index) focus = 0
		else
			band_lobby_change_menu menu = main action = forward Player = (<data>.Player) viewport_index = (<data>.viewport_index)
		endif
	endif
endscript

script lobby_mc_handle_error 
	printscriptinfo \{'lobby_mc_handle_error'}
	printstruct <...>
	if abort_for_signout controller = (<data>.controller)
		return
	endif
	ui_memcard_lobby_error error = <error> controller = (<data>.controller) data = {
		state = uistate_band_lobby_setup
		handled_lobby_mc_error = 1
		handled_lobby_mc_error_data = {
			viewport_index = (<data>.viewport_index)
			Player = (<data>.Player)
			controller = (<data>.controller)
			savegame = <savegame>
		}
	}
endscript

script band_lobby_pick_default_venue 
	RequireParams \{[
			Player
		]
		all}
	get_savegame_from_player Player = <Player>
	formatText checksumName = venue_checksum 'venue_%s' s = ($LevelZones.($current_level).Name) AddToStringLookup = true
	GetGlobalTags savegame = <savegame> <venue_checksum>
	if (<unlocked> = 1)
		Change g_band_lobby_current_level = ($current_level)
		return
	endif
	get_LevelZoneArray_size
	array_count = 0
	begin
	get_LevelZoneArray_checksum index = <array_count>
	if NOT StructureContains structure = ($LevelZones.<level_checksum>) debug_only
		formatText checksumName = load_venue_checksum 'venue_%s' s = ($LevelZones.<level_checksum>.Name)
		GetGlobalTags savegame = <savegame> <load_venue_checksum>
		if (<unlocked> = 1)
			Change g_band_lobby_current_level = <level_checksum>
			break
		endif
	endif
	<array_count> = (<array_count> + 1)
	repeat <array_Size>
endscript

script get_submenu_index_from_player 
	RequireParams \{[
			Player
		]
		all}
	i = 0
	begin
	band_lobby_get_submenu_data viewport_index = <i> param = Player
	if (<Player> = <submenu_data>)
		return true submenu_index = <i>
	endif
	i = (<i> + 1)
	repeat ($g_num_lobby_local_submenus)
	return \{FALSE}
endscript

script band_lobby_controller_can_save 
	RequireParams \{[
			controller
		]
		all}
	is_guest = 0
	band_lobby_get_is_guest device_num = <controller>
	if (<is_guest> = 0)
		if NOT islocallysignedin controller = <controller>
			is_guest = 1
		endif
	endif
	if (<is_guest> = 1)
		return \{FALSE}
	endif
	return \{true}
endscript

script bl_toggle_star_tilt 
	RequireParams \{[
			Player
		]
		all}
	options_change_tilt_star_power <...>
	Obj_GetID
	band_lobby_refresh_menu_text id = <objID>
endscript

script bl_toggle_touch_strip 
	RequireParams \{[
			Player
		]
		all}
	options_change_touch_strip_option <...>
	Obj_GetID
	band_lobby_refresh_menu_text id = <objID>
endscript

script band_lobby_any_extras_unlocked 
	printf \{'band_lobby_num_extras_unlocked'}
	extras = ($band_lobby_submenu_states.extras.options)
	GetArraySize <extras>
	if (<array_Size> > 0)
		idx = 0
		begin
		if StructureContains structure = (<extras> [<idx>]) condition
			func = (<extras> [<idx>].condition)
			if StructureContains structure = (<extras> [<idx>]) condition_params
				params = (<extras> [<idx>].condition_params)
			endif
			if <func> Player = <Player> viewport_index = <viewport_index> <params>
				return \{true}
			endif
		else
			return \{true}
		endif
		idx = (<idx> + 1)
		repeat <array_Size>
	endif
	return \{FALSE}
endscript

script band_lobby_num_cheats_unlocked 
	printf \{'band_lobby_num_cheats_unlocked'}
	cheats = ($band_lobby_submenu_states.cheats.options)
	GetArraySize <cheats>
	if (<array_Size> > 0)
		idx = 0
		begin
		if StructureContains structure = (<cheats> [<idx>]) condition
			func = (<cheats> [<idx>].condition)
			if StructureContains structure = (<cheats> [<idx>]) condition_params
				params = (<cheats> [<idx>].condition_params)
			endif
			if <func> Player = <Player> viewport_index = <viewport_index> <params>
				return \{true}
			endif
		else
			return \{true}
		endif
		idx = (<idx> + 1)
		repeat <array_Size>
	endif
	return \{FALSE}
endscript

script band_lobby_get_watch_timer_parent 
	RequireParams \{[
			cas_player_index
		]
		all}
	if NOT ScreenElementExists \{id = band_lobby_desc_id}
		return \{FALSE}
	endif
	if NOT band_lobby_desc_id :desc_resolvealias \{Name = alias_band_viewport_vmenu}
		return \{FALSE}
	endif
	viewport_vmenu = <resolved_id>
	GetArraySize \{$cas_queue_player_info}
	if (<cas_player_index> < 0)
		return \{FALSE}
	endif
	if (<cas_player_index> >= <array_Size>)
		return \{FALSE}
	endif
	player_index = <cas_player_index>
	entry = ($cas_queue_player_info [<cas_player_index>])
	if StructureContains structure = <entry> Player
		if get_submenu_index_from_player Player = (<entry>.Player)
			player_index = <submenu_index>
		endif
	endif
	if NOT ResolveScreenElementID id = [
			{id = <viewport_vmenu>}
			{index = <player_index>}
		]
		return \{FALSE}
	endif
	if <resolved_id> :desc_resolvealias Name = alias_viewport_loading_window param = viewport_window
		return true parent = <viewport_window>
	endif
	return \{FALSE}
endscript

script band_lobby_is_anyone_in_forced_flow 
	i = 0
	begin
	band_lobby_get_submenu_data viewport_index = <i> param = menu
	switch (<submenu_data>)
		case forced_difficulty
		case forced_instruments
		case forced_vocal_highway
		case forced_mic_preference
		case forced_lefty_flip
		return \{true}
	endswitch
	<i> = (<i> + 1)
	repeat ($g_num_lobby_local_submenus)
	return \{FALSE}
endscript

script band_lobby_update_part_to_match_controller 
	if ($allow_controller_for_all_instruments = 1)
		return
	endif
	band_lobby_kick_leader_out_of_band_manage
	band_lobby_update_player_viewport_assignments
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <submenu_index>
	Player = ($<submenu_data>.Player)
	getplayerinfo <Player> controller
	getplayerinfo <Player> part out = old_part
	get_savegame_from_controller controller = <controller>
	getcontrollertype controller = <controller>
	switch <controller_type>
		case guitar
		part = guitar
		case drum
		part = drum
		case vocals
		case controller
		part = vocals
	endswitch
	if ($g_leader_player_num = <Player>)
		local_primary_joining = 1
	endif
	if ((isps3) || (isngc))
		if GotParam \{local_primary_joining}
			band_lobby_switch_characters_for_ps3_at_join Player = <Player> controller = <controller>
		endif
	endif
	band_lobby_handle_character_swap {
		Player = <Player>
		old_part = <old_part>
		new_part = <part>
		no_refresh
	}
	setplayerinfo <Player> part = <part>
	band_lobby_local_join_get_character_id {savegame = <savegame> playerinfo = <Player> local_primary_joining = <local_primary_joining>}
	setplayerinfo <Player> character_id = <character_id>
	setplayerinfo <Player> character_savegame = <character_savegame>
	setplayerinfo <Player> stored_character_index = <stored_character_index>
	band_lobby_refresh_band_leader_characters \{no_refresh}
	persistent_band_refresh_changed_characters
	if band_lobby_does_popup_exist
		focus = 0
	else
		focus = 1
	endif
	band_lobby_change_menu {menu = main action = forward Player = <Player> viewport_index = <submenu_index> focus = <focus>}
endscript

script band_lobby_handle_online_dlc_enum 
	sdcardmanagerfunc \{func = setup_transfer}
	dlccatalogmanagerfunc \{func = load_catalogs}
	begin
	if NOT dlccatalogmanagerfunc \{func = is_busy}
		break
	endif
	WaitOneGameFrame
	repeat
	if NOT dlcmanagerfunc \{func = have_all_content_info}
		sdcardmanagerfunc \{func = get_transfer_results}
		if NOT wii_dlc_get_error_text
			wii_dlc_get_error_text \{error_crc = dlc_cannot_list_all_content}
		endif
		if band_lobby_desc_id :desc_resolvealias \{Name = alias_pu_cont_parent}
			if NOT GotParam \{Player}
				<Player> = ($g_leader_player_num)
			endif
			band_lobby_create_popup_menu {
				menu = dlc_error_msg
				Player = <Player>
				container = <resolved_id>
				error_text = <error_text>
			}
		endif
		sdcardmanagerfunc \{func = shutdown_transfer}
		return \{FALSE}
	endif
	sdcardmanagerfunc \{func = net_hold_ejects}
	sdcardmanagerfunc \{func = shutdown_transfer}
	return \{true}
endscript

script debug_bl_dump_submenu_data_all 
	printf \{qs(0xa220a895)}
	i = 0
	begin
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <i>
	printstruct ($<submenu_data>)
	i = (<i> + 1)
	repeat ($g_num_lobby_total_submenus)
endscript

script debug_bl_dump_submenu_data 
	printf \{qs(0x157248ca)}
	if GotParam \{index}
		formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <index>
		printstruct ($<submenu_data>)
	else
		printf \{qs(0xf9fe8783)}
	endif
endscript

script debug_bl_dump_in_game_player_ids 
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		getplayerinfo <Player> party_id
		getplayerinfo <Player> net_id_first
		getplayerinfo <Player> net_id_second
		getplayerinfo <Player> controller
		printf qs(0x0c15a2f6) a = <Player> b = <party_id> c = <net_id_first> d = <net_id_second> e = <controller>
		getnextplayer Player = <Player>
		repeat <num_players>
	endif
endscript
