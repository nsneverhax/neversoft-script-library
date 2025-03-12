
script band_lobby_does_need_to_show_warning 
	printf \{channel = band_lobby
		qs(0x0b5e07bc)}
	show_warning = 0
	msg_checksum = leave_msg_net
	choose_script = empty_script
	if ininternetmode
		getnumplayersingame
		total_num_players = <num_players>
		netsessionfunc \{obj = party
			func = get_party_members}
		getarraysize \{connections}
		party_num_players = <array_size>
		getnumplayersingame \{local}
		local_num_players = <num_players>
		if NOT innetgame
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
				if bl_does_have_remote_party_connections
					<show_warning> = 1
					<msg_checksum> = leave_msg_party
					<choose_script> = band_lobby_leave_party
				else
					<show_warning> = 1
					<msg_checksum> = leave_msg_local
					<choose_script> = band_lobby_go_back
				endif
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
	if (<show_warning> = 1)
		return true msg_checksum = <msg_checksum> choose_script = <choose_script>
	else
		return \{false}
	endif
endscript

script band_lobby_local_leader_leave 
	requireparams \{[
			submenu_index
		]
		all}
	printf \{channel = band_lobby
		qs(0x36f59359)}
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%d' d = <submenu_index>
	if band_lobby_does_need_to_show_warning
		if band_lobby_desc_id :desc_resolvealias \{name = alias_pu_cont_parent}
			band_lobby_create_popup_menu {
				menu = leave_lobby
				msg_checksum = <msg_checksum>
				choose_script = <choose_script>
				submenu_index = <submenu_index>
				player = ($<submenu_data>.player)
				container = <resolved_id>
			}
		endif
	else
		audio_ui_band_lobby_sfx_logic generic_back = 1 player_num = <player>
		band_lobby_whole_band_autosave choose_script = band_lobby_go_back player = ($<submenu_data>.player) submenu_index = <submenu_index>
	endif
endscript

script band_lobby_local_player_leave 
	requireparams \{[
			submenu_index
		]
		all}
	printf \{channel = band_lobby
		qs(0x8fd6684a)}
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%d' d = <submenu_index>
	if NOT (($<submenu_data>.menu) = join)
		getplayerinfo ($<submenu_data>.player) controller
		setplayerinfo ($<submenu_data>.player) in_game = 0
		setplayerinfo ($<submenu_data>.player) is_local_client = 1
		setplayerinfo ($<submenu_data>.player) net_id_first = 0
		setplayerinfo ($<submenu_data>.player) net_id_first = 0
		setplayerinfo ($<submenu_data>.player) party_id = -1
		set_chosen_character_id player = ($<submenu_data>.player) id = none
		netsessionfunc func = removecontroller params = {controller = <controller>}
		if NOT netsessionfunc \{obj = party
				func = is_host}
			netsessionfunc obj = party func = remove_playr_from_party params = {controller_index = <controller>}
		endif
		session_stats_reset
		band_lobby_update_submenu_data submenu_index = <submenu_index> element = occupied value = 0
		band_lobby_update_submenu_data submenu_index = <submenu_index> element = net_id value = [0 0]
		if isps3
			change globalname = ($<submenu_data>.gamertag_checksum) newvalue = qs(0x00000000)
		endif
		if band_lobby_find_missing_part player = ($<submenu_data>.player)
			setplayerinfo ($<submenu_data>.player) part = <missing_part>
		endif
		band_lobby_change_menu action = back menu = join player = ($<submenu_data>.player) submenu_index = <submenu_index> no_forced
		band_lobby_kick_leader_out_of_band_manage
		band_lobby_update_player_viewport_assignments
		band_lobby_refresh_band_leader_characters
		band_lobby_update_button_helpers
	endif
endscript

script band_lobby_leave_forced_flow 
	requireparams \{[
			player
			submenu_index
		]
		all}
	band_lobby_get_submenu_data submenu_index = <submenu_index> param = is_managed
	if (<is_managed> = 1)
		band_lobby_manage_band_members action = deselect player = <player> submenu_index = <submenu_index>
	else
		band_lobby_leave player = <player> submenu_index = <submenu_index>
	endif
endscript

script band_lobby_can_leave 
	printf \{channel = band_lobby
		qs(0x7848a09d)}
	if ($net_popup_active = 1)
		return \{false}
	endif
	if savegame_async_is_busy
		return \{false}
	endif
	return \{true}
endscript

script band_lobby_leave 
	requireparams \{[
			submenu_index
			player
		]
		all}
	printf channel = band_lobby qs(0x578a6031) c = <submenu_index> d = <player>
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%d' d = <submenu_index>
	if band_lobby_can_leave
		if ($g_leader_player_num = -1)
			band_lobby_go_back
		elseif ($g_career_search != null)
			if ($g_leader_player_num = <player>)
				if netsessionfunc \{obj = party
						func = is_host}
					if band_lobby_cancel_matchmaking
						band_lobby_update_submenu_data submenu_index = <submenu_index> element = menu_indices value = [0 0 0]
						band_lobby_change_menu menu = main action = back player = <player> submenu_index = <submenu_index>
						band_lobby_update_button_helpers
					endif
				endif
			endif
		else
			if ($g_leader_player_num = <player>)
				audio_ui_band_lobby_sfx_logic generic_back = 1 player_num = <player>
				if NOT gotparam \{controller_pulled}
					band_lobby_local_leader_leave submenu_index = <submenu_index>
				else
					band_lobby_autosave not_on_ps3 choose_script = band_lobby_local_player_leave player = ($<submenu_data>.player) submenu_index = <submenu_index>
				endif
			else
				if NOT innetgame
					band_lobby_autosave not_on_ps3 choose_script = band_lobby_local_player_leave player = ($<submenu_data>.player) submenu_index = <submenu_index>
				endif
			endif
		endif
	endif
endscript

script band_lobby_switch_to_enabled_profile_or_guest_start 
	requireparams \{[
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
	addarrayelement array = <optionsarray> element = <item>
	optionsarray = <array>
	if isxenonorwindx
		if gotparam \{allow_continue_as_guest}
			item = {func = band_lobby_switch_to_enabled_profile_or_guest_continue_as_guest
				func_params = {silver_guys_controller = <silver_guys_controller>}
				text = ($band_lobby_strings.continue_guest)
			}
			addarrayelement array = <optionsarray> element = <item>
			optionsarray = <array>
		endif
	endif
	item = {func = band_lobby_switch_to_enabled_profile_or_guest_cancel
		func_params = {silver_guys_controller = <silver_guys_controller>}
		text = ($band_lobby_strings.popup_option_cancel)
	}
	addarrayelement array = <optionsarray> element = <item>
	optionsarray = <array>
	body_text = ($band_lobby_strings.switch_to_enabled_profile_or_guest)
	if isxenonorwindx
		if gotparam \{allow_continue_as_guest}
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
	assignalias id = <menu_id> alias = switch_to_enabled_profile_or_guest
	launchevent \{type = focus
		target = switch_to_enabled_profile_or_guest}
	printf \{qs(0x4dec4a44)}
endscript

script band_lobby_switch_to_enabled_profile_or_guest_close 
	if screenelementexists \{id = switch_to_enabled_profile_or_guest}
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

script band_lobby_attempt_to_join \{hack_is_pad_handler = false
		submenu_index = !i1768515945
		device_num = !i1768515945}
	printf channel = band_lobby qs(0x965aa400) c = <device_num>
	removeparameter \{player}
	if (<hack_is_pad_handler> = true)
		if ($g_career_search != null)
			return
		endif
	endif
	if band_lobby_can_join_local controller = <device_num> submenu_index = <submenu_index> <...>
		netsessionfunc func = addcontrollers params = {controller = <device_num>}
		if ininternetmode
			netsessionfunc obj = party func = add_local_player_to_party params = {controller_index = <device_num>}
			if NOT gotparam \{from_main_menu}
				band_lobby_change_menu menu = attempt_join action = forward player = (<device_num> + 1) submenu_index = <submenu_index> no_forced focus = 0
			endif
		else
			band_lobby_join submenu_index = <submenu_index> device_num = <device_num> <...>
		endif
	else
		if gotparam \{error}
			if (<error> = guest_can_not_lead)
				band_lobby_update_ticker msg_checksum = <error> msg_count = 3
				return error = <error>
			endif
		endif
	endif
endscript

script band_lobby_join 
	requireparams \{[
			submenu_index
			device_num
		]
		all}
	printf \{channel = band_lobby
		qs(0x0a9e37ad)}
	if band_lobby_can_join_local controller = <device_num> submenu_index = <submenu_index> <...>
		new_player = (<device_num> + 1)
		if checkforsignin controller_index = <device_num> dont_set_primary
			getnetid controller_index = <device_num>
		else
			net_id_first = 0
			net_id_second = 0
		endif
		array = []
		addarrayelement array = <array> element = <net_id_first>
		addarrayelement array = <array> element = <net_id_second>
		band_lobby_get_is_guest device_num = <device_num>
		if ($g_leader_player_num = -1)
			local_primary_joining = 1
		endif
		band_lobby_add_player_to_playerinfo {
			player_type = local
			playerinfo = <new_player>
			data = {
				controller = <device_num>
				user_id = <array>
			}
			local_primary_joining = <local_primary_joining>
		}
		if playerinfoequals <new_player> part = vocals
			if playerinfoequals <new_player> is_local_client = 1
				if NOT playerinfoequals <new_player> mic_preference = none
					band_lobby_assign_mic player = <new_player>
				else
					if NOT controller_has_headset controller = <device_num>
						band_lobby_set_mic_preference mic_preference = mic player = <new_player>
						band_lobby_assign_mic player = <new_player>
					endif
				endif
			endif
		endif
		session_stats_reset
		if ($g_leader_player_num = -1)
			band_lobby_change_band_leader player = <new_player> from_join
		endif
		band_lobby_get_submenu_data submenu_index = <submenu_index> param = occupied
		if (<occupied> = 1)
			printf \{qs(0xac7d58fd)}
			band_lobby_find_available_submenu_data
			if (<submenu_data_index> != -1)
				printf qs(0xb52f8585) d = <submenu_data_index>
				band_lobby_get_submenu_data submenu_index = <submenu_index> param = player
				xuid = [0 0]
				getplayerinfo <player> net_id_first
				getplayerinfo <player> net_id_second
				setarrayelement arrayname = array index = 0 newvalue = <net_id_first>
				setarrayelement arrayname = array index = 1 newvalue = <net_id_second>
				band_lobby_update_submenu_data submenu_index = <submenu_data_index> element = player value = <player>
				band_lobby_update_submenu_data submenu_index = <submenu_data_index> element = occupied value = 1
				band_lobby_update_submenu_data submenu_index = <submenu_data_index> element = net_id value = <array>
				if isps3
					getplayerinfo <player> gamertag
					band_lobby_get_submenu_data submenu_index = <submenu_data_index> param = gamertag_checksum
					change globalname = <gamertag_checksum> newvalue = ($<gamertag>)
				endif
				if (<submenu_data_index> < $g_num_lobby_local_submenus)
					setplayerinfo <player> controller = <submenu_data_index>
					band_lobby_change_menu menu = remote_player no_forced submenu_index = <submenu_data_index> action = forward player = <player>
				endif
			else
				scriptassert \{qs(0x18b28ce3)}
			endif
		endif
		band_lobby_update_submenu_data submenu_index = <submenu_index> element = player value = <new_player>
		band_lobby_update_submenu_data submenu_index = <submenu_index> element = occupied value = 1
		band_lobby_update_submenu_data submenu_index = <submenu_index> element = net_id value = <array>
		if isps3
			getplayerinfo <new_player> gamertag
			band_lobby_get_submenu_data submenu_index = <submenu_index> param = gamertag_checksum
			change globalname = <gamertag_checksum> newvalue = ($<gamertag>)
		endif
		band_lobby_refresh_band_leader_characters \{no_refresh}
		persistent_band_refresh_changed_characters
		if NOT gotparam \{from_main_menu}
			band_lobby_join_continue_to_next_menu {
				device_num = <device_num>
				player = <new_player>
				submenu_index = <submenu_index>
			}
		endif
	else
		band_lobby_get_submenu_data submenu_index = <device_num> param = menu
		if (<menu> = attempt_join)
			netsessionfunc func = removecontroller params = {controller = <device_num>}
			band_lobby_flash_ticker_msg \{msg_checksum = failed_to_join_session
				time = 3}
			band_lobby_change_menu menu = join action = back player = (<device_num> + 1) submenu_index = <submenu_index> no_forced focus = 1
		endif
	endif
endscript

script band_lobby_failed_join 
	requireparams \{[
			controller
		]
		all}
	printf \{channel = band_lobby
		qs(0x3f69d58e)}
	band_lobby_get_submenu_data submenu_index = <controller> param = menu
	if (<menu> = attempt_join)
		netsessionfunc func = removecontroller params = {controller = <controller>}
		band_lobby_flash_ticker_msg \{msg_checksum = failed_to_join_session
			time = 3}
		band_lobby_change_menu menu = join action = back player = (<controller> + 1) submenu_index = <controller> no_forced focus = 1
	endif
endscript

script band_lobby_can_join_local 
	requireparams \{[
			controller
			submenu_index
		]
		all}
	printf \{channel = band_lobby
		qs(0x944b9a6c)}
	if (<controller> > 3)
		band_lobby_update_ticker \{msg_checksum = controller_limit}
		return \{false
			error = ps3_controller_limit}
	endif
	band_lobby_get_is_guest device_num = <controller>
	if ininternetmode
		if band_lobby_are_remote_players_in_game
			if NOT checkforsignin controller_index = <controller> dont_set_primary
				if NOT gotparam \{from_main_menu}
					spawnscriptnow band_lobby_switch_to_enabled_profile_or_guest_start params = {silver_guys_controller = <controller>}
				endif
				return \{false
					error = no_online_privileges}
			elseif NOT netsessionfunc func = ismultiplayerallowed params = {controller_index = <device_num>}
				if NOT gotparam \{from_main_menu}
					spawnscriptnow band_lobby_switch_to_enabled_profile_or_guest_start params = {silver_guys_controller = <controller> allow_continue_as_guest}
				endif
				return \{false
					error = no_online_privileges}
			elseif (<is_guest> = 1)
				if NOT band_lobby_live_profile_ingame \{multiplayer_enabled}
					band_lobby_update_ticker \{msg_checksum = no_live_profile_in_game
						msg_count = 3}
					return \{false
						error = no_live_profile_in_game}
				endif
			endif
		else
			join_reaction = none
			if checkforsignin controller_index = <device_num> dont_set_primary
				if NOT netsessionfunc func = ismultiplayerallowed params = {controller_index = <controller>}
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
			if (<join_reaction> != none)
				if (<join_reaction> = change_network)
					band_lobby_change_network player = ($g_leader_player_num) network = local focus = 0
				else
					if band_lobby_live_profile_ingame \{multiplayer_enabled}
						if checkforsignin local controller_index = <device_num> dont_set_primary
							msg_checksum = invite_sent_change_profile
						else
							msg_checksum = invite_sent_signin_profile
						endif
					else
						msg_checksum = invite_sent_signin_profile
					endif
					if band_lobby_desc_id :desc_resolvealias \{name = alias_pu_cont_parent}
						band_lobby_create_popup_menu {
							menu = change_profile
							controller = <controller>
							container = <resolved_id>
							msg_checksum = <msg_checksum>
							submenu_index = <submenu_index>
						}
					endif
					return \{false}
				endif
			endif
		endif
	endif
	if (<is_guest> = 1)
		if ($g_leader_player_num = -1)
			return \{false
				error = guest_can_not_lead}
		endif
	endif
	if playerinfoequals (<controller> + 1) in_game = 1
		band_lobby_flash_ticker_msg \{msg_checksum = game_full
			time = 5}
		return \{false
			error = no_available_playerinfo}
	endif
	return \{true}
endscript

script band_lobby_join_continue_to_next_menu \{attempt_savegame_stuff = true}
	requireparams \{[
			device_num
			player
			submenu_index
		]
		all}
	band_lobby_kick_leader_out_of_band_manage
	band_lobby_update_player_viewport_assignments
	if band_lobby_controller_can_save controller = <device_num>
		load_savegame = 1
	endif
	if isps3
		removeparameter \{load_savegame}
	endif
	get_savegame_from_controller controller = <device_num>
	if get_savegame_has_saved_game savegame = <savegame>
		removeparameter \{load_savegame}
	endif
	if NOT is_autosave_on savegame = <savegame>
		removeparameter \{load_savegame}
	endif
	if (<attempt_savegame_stuff> = false)
		removeparameter \{load_savegame}
	endif
	if demobuild
		removeparameter \{load_savegame}
	endif
	if gotparam \{load_savegame}
		band_lobby_change_menu menu = mc_checking action = forward player = <player> submenu_index = <submenu_index> focus = 0 no_forced
		savegame_async_button_in savegame = <savegame> callback = lobby_mc_loading_callback data = {
			player = <player>
			submenu_index = <submenu_index>
			controller = <device_num>
		}
	else
		if band_lobby_does_popup_exist
			band_lobby_change_menu menu = main action = forward player = <player> submenu_index = <submenu_index> focus = 0
		else
			band_lobby_change_menu menu = main action = forward player = <player> submenu_index = <submenu_index>
		endif
	endif
	band_lobby_update_button_helpers
endscript

script band_lobby_get_is_guest 
	if isxenonorwindx
		if netsessionfunc func = xenonisguest params = {controller_index = <device_num>}
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
	requireparams \{[
			playerinfo
			controller
			part
			is_local
		]
		all}
	getsavegamefromcontroller controller = <controller>
	get_current_progression_award_points savegame = <savegame>
	setplayerinfo <playerinfo> recent_award_points = 0
	setplayerinfo <playerinfo> total_award_points = <total_award_points>
	get_progression_instrument_user_option controller = <controller> option = 'guitar_bass_flip'
	guitar_bass_flip = <user_option>
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
			case none
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
		band_lobby_sync_highway_view player = <playerinfo>
		default
		scriptassert \{qs(0x6825c4a2)}
	endswitch
	if (<difficulty> = none)
		setplayerinfo <playerinfo> difficulty = ($default_difficulty [<controller>])
	else
		setplayerinfo <playerinfo> difficulty = <difficulty>
	endif
	if isps3
		if gotparam \{local_primary_joining}
			band_lobby_switch_characters_for_ps3_at_join player = <playerinfo> controller = <controller>
		endif
	endif
	get_savegame_from_controller controller = <controller>
	if (<playerinfo> <= 4)
		getplayerinfo <playerinfo> part out = old_part
		if (<old_part> != <part>)
			setplayerinfo <playerinfo> is_local_client = <is_local>
			setplayerinfo <playerinfo> in_game = 1
			band_lobby_handle_character_swap {
				player = <playerinfo>
				old_part = <old_part>
				new_part = <part>
				no_refresh
			}
		endif
		band_lobby_local_join_get_character_id {
			savegame = <savegame>
			playerinfo = <playerinfo>
			local_primary_joining = <local_primary_joining>
			borrowed_from_band_leader = <borrowed_from_band_leader>
		}
		setplayerinfo <playerinfo> character_id = <character_id>
		setplayerinfo <playerinfo> character_savegame = <character_savegame>
		setplayerinfo <playerinfo> stored_character_index = <stored_character_index>
	endif
	return part = <part>
endscript

script band_lobby_add_player_to_playerinfo 
	requireparams \{[
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
		netsessionfunc {
			obj = mapper
			func = get_player_handle
			params = {
				channel = party
				player_num = <party_id>
			}
		}
		if (<is_local> = 1)
			find_available_playerinfo player_type = party_local controller_index = <controller>
		else
			find_available_playerinfo \{player_type = party_remote}
		endif
		if (<playerinfo> = -1)
			scriptassert \{qs(0x1382536d)}
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
			scriptassert \{qs(0x5cbdd6e9)}
			part = guitar
		endswitch
		formattext checksumname = gamertag 'gamertag_%d' d = (<playerinfo> - 1)
		change globalname = <gamertag> newvalue = (<data>.gamertag)
		if (<is_local> = 1)
			band_lobby_add_player_to_playerinfo_local {
				playerinfo = <playerinfo>
				controller = <controller>
				part = <part>
				local_primary_joining = <local_primary_joining>
				is_local = <is_local>
			}
			setplayerinfo <playerinfo> async_io_status = busy
		else
			persistent_band_get_unused_musician
			if (<unused_musician> != none)
				setplayerinfo <playerinfo> band_member = <unused_musician>
			endif
		endif
	elseif (<player_type> = local)
		net_id_first = (<data>.user_id [0])
		net_id_second = (<data>.user_id [1])
		is_local = 1
		controller = (<data>.controller)
		if isguitarcontroller controller = <controller>
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
		formattext checksumname = gamertag 'gamertag_%d' d = (<playerinfo> - 1)
		if isxenonorwindx
			netsessionfunc obj = match func = get_gamertag params = {controller = <controller>}
		else
			if NOT netsessionfunc obj = match func = get_gamertag params = {controller = <controller>}
				name = qs(0x00000000)
			endif
		endif
		change globalname = <gamertag> newvalue = <name>
		if NOT band_lobby_get_party_id_by_user_id user_id = (<data>.user_id) gamertag = <name>
			party_id = -1
		endif
		netsessionfunc {
			obj = mapper
			func = get_player_handle
			params = {
				controller_index = <controller>
			}
		}
		setplayerinfo <playerinfo> async_io_status = busy
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
	setplayerinfo <playerinfo> net_player_handle = <net_player_handle>
	if ($g_net_party_needs_full_sync = 1)
		change \{g_net_party_needs_full_sync = 0}
		netsessionfunc \{obj = party
			func = request_full_sync}
	endif
	if (<part> = drum)
		usefourlanehighway player = <playerinfo> reset
	endif
	return playerinfo = <playerinfo>
endscript

script band_lobby_local_join_get_character_id \{savegame = !i1768515945
		playerinfo = !i1768515945}
	getplayerinfo <playerinfo> character_id out = existing_character_id
	getplayerinfo <playerinfo> character_savegame out = existing_character_savegame
	getplayerinfo <playerinfo> stored_character_index out = existing_stored_character_index
	if isps3
		get_saved_band_member index = <existing_stored_character_index> savegame = 0
		return {
			character_id = <character_id>
			character_savegame = <character_savegame>
			stored_character_index = <existing_stored_character_index>
		}
	else
		if gotparam \{borrowed_from_band_leader}
			savegame = <borrowed_from_band_leader>
		endif
		get_saved_band_member index = 0 savegame = <savegame>
		if (<user_changed> = 0)
			if gotparam \{local_primary_joining}
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
	requireparams \{[
			player
		]
		all}
	getplayerinfo <player> mic_preference
	if (<mic_preference> = none)
		softassert \{qs(0xf47713fc)}
	endif
	getplayerinfo <player> mic_type
	this_mic_type = <mic_type>
	this_player = <player>
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		if NOT (<player> = <this_player>)
			if playerinfoequals <player> is_local_client = 1
				if playerinfoequals <player> mic_type = <this_mic_type>
					setplayerinfo <this_player> mic_type = none
					break
				endif
			endif
		endif
		getnextplayer player = <player> on_screen
		repeat <num_players_shown>
	endif
endscript

script band_lobby_vocals_destroy_icon_update 
	obj_killspawnedscript \{name = band_lobby_vocals_icon_update}
	se_setprops \{rgba = [
			255
			255
			255
			255
		]}
	obj_getid
	getscreenelementchildren id = <objid>
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
		if playerinfoequals <player> part = vocals
			if playerinfoequals <player> is_local_client = 1
				mic_valid = 1
				if playerinfoequals <player> mic_type = headset
					if isxenon
						netsessionfunc \{obj = plat_party
							func = get_num_party_players}
						if (<num_plat_party_players> > 0)
							mic_valid = 0
						endif
					endif
				endif
				if NOT vocals_player_has_mic player = <player>
					mic_valid = 0
				endif
				setplayerinfo <player> lobby_mic_valid = <mic_valid>
			endif
		endif
		getnextplayer player = <player> on_screen
		repeat <num_players_shown>
	endif
	wait \{1
		second}
	repeat
endscript

script band_lobby_vocals_icon_update 
	requireparams \{[
			submenu_index
		]
		all}
	obj_getid
	getscreenelementchildren id = <objid>
	invalid_icon_id = (<children> [0])
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%d' d = <submenu_index>
	begin
	player = ($<submenu_data>.player)
	getplayerinfo <player> mic_preference
	getplayerinfo <player> mic_type
	switch <mic_preference>
		case headset
		icon_texture = logo_headset
		case none
		icon_texture = mixer_icon_vox
		default
		icon_texture = mixer_icon_vox
	endswitch
	band_lobby_get_player_color submenu_index = <submenu_index>
	rgba = <rgba_md>
	if playerinfoequals <player> is_local_client = 1
		getplayerinfo <player> controller
		vocals_getmicamplitude controller = <controller>
		if (<amplitude> > ($band_lobby_noise_gate))
			rgba = [255 0 0 255]
		endif
	endif
	se_setprops {
		texture = <icon_texture>
		rgba = <rgba>
	}
	wait \{1
		gameframe}
	repeat
endscript

script band_lobby_controller_connected_update 
	requireparams \{[
			submenu_index
		]
		all}
	obj_getid
	getscreenelementchildren id = <objid>
	invalid_icon_id = (<children> [0])
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%d' d = <submenu_index>
	begin
	removeparameter \{skip}
	ui_event_wait_for_safe
	removeparameter \{is_popup}
	ui_event_get_top
	if NOT (<base_name> = 'band_lobby')
		skip = 1
	endif
	if screenelementexists \{id = current_band_lobby_popup}
		skip = 1
	endif
	if screenelementexists \{id = dialog_box_container}
		skip = 1
	endif
	if NOT gotparam \{skip}
		player = ($<submenu_data>.player)
		invalid_alpha = 0
		if (($<submenu_data>.occupied) = 1)
			if playerinfoequals <player> is_local_client = 1
				getplayerinfo <player> controller
				if NOT iscontrollerpluggedin controller = <controller>
					invalid_alpha = 1
				elseif NOT band_lobby_check_single_controller player = <player>
					if NOT innetgame
						netsessionfunc obj = party func = update_game_data params = {controller_index = <controller>}
						band_lobby_update_part_to_match_controller submenu_index = <submenu_index>
						return
					endif
				elseif playerinfoequals <player> part = vocals
					getplayerinfo <player> mic_preference
					getplayerinfo <player> mic_type
					getplayerinfo <player> lobby_mic_valid
					if (<mic_type> = none || <mic_preference> = none || <lobby_mic_valid> = 0)
						invalid_alpha = 1
					endif
				endif
			endif
		endif
		<invalid_icon_id> :se_setprops {
			alpha = <invalid_alpha>
		}
	endif
	wait \{1
		gameframe}
	repeat
endscript

script band_lobby_signin 
	requireparams \{[
			controller
		]
		all}
	printf channel = band_lobby qs(0x7cd060bd) d = <controller>
	change \{respond_to_signin_changed_func = band_lobby_signin_changed}
	band_lobby_desc_id :se_setprops \{block_events}
	if isxenonorwindx
		call_blade = 0
		if NOT gotparam \{func}
			if (checkforsignin local controller_index = <controller>)
				if NOT (checkforsignin controller_index = <controller>)
					func = showsigninui
					params = {convert_offline_to_guest}
					call_blade = 1
				endif
				if gotparam \{forceui4}
					func = showsigninui4pane
					params = {online_only}
					call_blade = 1
				else
					if NOT netsessionfunc func = ismultiplayerallowed params = {controller_index = <controller>}
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
			if netsessionfunc func = <func> params = <params> breakpoint = 0
				band_lobby_update_ticker \{msg_checksum = signin_waiting}
				wait_for_blade_complete
			else
				printf \{qs(0x910ff9a5)}
			endif
		endif
	elseif isps3
		if NOT checkforsignin controller_index = <controller>
			change \{ps3_signin_complete = 0}
			netsessionfunc \{func = onlinesignin
				params = {
					callback = signin_complete_callback
				}}
			wait_for_blade_complete
		endif
		netsessionfunc \{func = is_lobby_available}
		band_lobby_set_gamertag_strings controller = <controller>
	else
		scriptassert \{qs(0x0c85b718)}
	endif
	change \{respond_to_signin_changed_func = band_lobby_signin_changed}
	band_lobby_desc_id :se_setprops \{unblock_events}
	band_lobby_update_ticker \{msg_checksum = current_state}
endscript

script band_lobby_signin_changed 
	printf channel = band_lobby qs(0x351a0044) d = <controller>
	if screenelementexists \{id = band_lobby_desc_id}
		band_lobby_desc_id :se_setprops \{unblock_events}
		band_lobby_update_ticker \{msg_checksum = current_state}
	endif
	if ininternetmode
		if innetgame
			handle_signin_changed savegame = <savegame>
			return
		else
			getplayerinfo ($g_leader_player_num) controller out = leader_controller
			if (<leader_controller> = <controller>)
				if band_lobby_are_remote_players_in_game
					handle_signin_changed savegame = <savegame>
					return
				else
					band_lobby_change_network player = ($g_leader_player_num) network = local focus = 0
					band_lobby_refresh_all_submenus \{type = not_in_game}
				endif
			endif
		endif
	endif
	if screenelementexists \{id = band_lobby_not_all_signed_confirm_menu}
		band_lobby_not_all_signed_in_dialog_exit
	endif
	if screenelementexists \{id = switch_to_enabled_profile_or_guest}
		band_lobby_switch_to_enabled_profile_or_guest_close
	endif
	tmp_controller = <controller>
	ui_event_get_top
	if (<base_name> = 'mic_binding')
		mic_binding_end
	elseif (<base_name> != 'band_lobby')
		ui_sfx \{menustate = bandlobby
			uitype = back}
		generic_event_back
	endif
	controller = <tmp_controller>
	if band_lobby_does_popup_exist
		band_lobby_destroy_popup_menu
	endif
	ui_signin_changed_func controller = <controller>
	get_savegame_from_controller controller = <controller>
	if islocallysignedin controller = <savegame>
		gamerpictexturerequest {
			local_user_index = <savegame>
			local_id = <savegame>
		}
	endif
	found_player = 0
	i = 0
	begin
	band_lobby_get_submenu_data submenu_index = <i> param = player
	getplayerinfo <player> controller out = temp_controller
	getplayerinfo <player> is_local_client
	if ((<temp_controller> = <controller>) && (1 = <is_local_client>))
		found_player = 1
		band_lobby_wait_for_menu_change
		if band_lobby_has_managed_submenu
			band_lobby_manage_band_members action = deselect player = ($g_leader_player_num) submenu_index = <managed_submenu>
		endif
		band_lobby_wait_for_menu_change
		band_lobby_get_submenu_data submenu_index = <i> param = occupied
		if (<occupied> = 1)
			band_lobby_clear_submenu_data submenu_data_index = <i>
			setplayerinfo <player> in_game = 0
			netsessionfunc func = removecontroller params = {controller = <controller>}
			if NOT netsessionfunc \{obj = party
					func = is_host}
				netsessionfunc {
					obj = party
					func = remove_playr_from_party
					params = {
						controller_index = <controller>
					}
				}
			endif
			action = back
			if ($g_leader_player_num = <player>)
				if band_lobby_desc_id :desc_resolvealias \{name = alias_band_viewport_vmenu}
					if <resolved_id> :getsingletag managing
						if (<managing> = 1)
							band_lobby_band_memebers_back submenu_index = <i>
						endif
					endif
				endif
				band_lobby_lost_band_leader
			endif
			set_chosen_character_id player = <player> id = none
			sanity_check_fix_deleted_characters
			band_lobby_update_player_viewport_assignments
			band_lobby_get_submenu_data submenu_index = <i> param = occupied
			if (<occupied> = 0)
				($band_lobby_viewport_menus [<i>]) :obj_spawnscriptnow band_lobby_change_menu params = {action = back menu = join player = <player> submenu_index = <i>}
			endif
			band_lobby_update_button_helpers
			return
		endif
		break
	endif
	i = (<i> + 1)
	repeat ($g_num_lobby_local_submenus)
	if (<found_player> = 1)
		if screenelementexists id = ($band_lobby_viewport_menus [<i>])
			($band_lobby_viewport_menus [<i>]) :obj_spawnscriptnow band_lobby_change_menu params = {action = forward menu = join player = <player> submenu_index = <i>}
		endif
	endif
	spawnscriptnow \{band_lobby_signin_changed_restore_friends_feed}
endscript

script band_lobby_signin_changed_restore_friends_feed 
	wait \{4
		gameframes}
	if scriptisrunning \{band_lobby_signin_changed}
		return
	endif
	if screenelementexists \{id = band_lobby_desc_id}
		band_lobby_desc_id :obj_spawnscriptlater \{attempt_to_add_friend_feed
			params = {
				menu = band_lobby
				parent_id = band_lobby_desc_id
			}}
	endif
endscript

script band_lobby_set_gamertag_strings 
	requireparams \{[
			controller
		]
		all}
	printf \{channel = band_lobby
		qs(0xd6368250)}
	if checkforsignin controller_index = <controller>
		i = 0
		begin
		formattext checksumname = submenu_data 'band_lobby_submenu_data_%i' i = <i>
		if (($<submenu_data>.occupied) = 1)
			getplayerinfo ($<submenu_data>.player) controller
			getplayerinfo ($<submenu_data>.player) gamertag
			if NOT netsessionfunc obj = match func = get_gamertag params = {controller = <controller>}
				name = qs(0x00000000)
			endif
			change globalname = <gamertag> newvalue = <name>
			change globalname = ($<submenu_data>.gamertag_checksum) newvalue = <name>
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
		formattext checksumname = submenu_data 'band_lobby_submenu_data_%i' i = <i>
		if (<dropped_player_num> = ($<submenu_data>.player))
			if (($<submenu_data>.occupied) = 1)
				band_lobby_clear_submenu_data submenu_data_index = <i>
				if screenelementexists id = ($band_lobby_viewport_menus [<i>])
					($band_lobby_viewport_menus [<i>]) :obj_spawnscriptnow band_lobby_change_menu params = {action = back menu = empty player = (<i> + 1) submenu_index = <i> focus = 0}
				endif
				break
			endif
		endif
		i = (<i> + 1)
		repeat ($g_num_lobby_local_submenus)
		common_net_player_cleanup player_num = <dropped_player_num>
		band_lobby_make_visible_players_mutually_exclusive
		change net_dropped_players_flag = (($net_dropped_players_flag) + 1)
		switch <drop_reason>
			case net_message_player_kicked
			formattext textname = drop_msg qs(0x7adab19b) s = <name_string>
			case net_message_player_quit
			formattext textname = drop_msg qs(0xafcc55cd) s = <name_string>
			case net_message_player_dropped
			case net_message_player_timed_out
			formattext textname = drop_msg qs(0xc11e11da) s = <name_string>
			default
			drop_msg = qs(0x00000000)
		endswitch
		getnumplayersingame \{local}
		num_local_players = <num_players>
		getnumplayersingame
		if (<num_local_players> = <num_players>)
			band_lobby_end_game <...>
		else
			if screenelementexists \{id = band_lobby_desc_id}
				add_dropped_player_to_dialog_box parent = band_lobby_desc_id msg_text = <drop_msg>
			endif
		endif
	endif
endscript

script band_lobby_end_game 
	printf \{channel = band_lobby
		qs(0xda78fc3b)}
	band_lobby_change_focus_submenu_all \{focus_type = unfocus}
	ui_event_get_top
	if ((<base_name> = 'quest_map') || (<base_name> = 'quest_map_giglist') || (<base_name> = 'quest_band_select'))
		if screenelementexists \{id = current_menu}
			launchevent \{type = unfocus
				target = current_menu}
		endif
	elseif screenelementexists \{id = rockrecordinterface}
		launchevent \{type = unfocus
			target = rockrecordinterface}
		elsieif \{screenelementexistssimpleid
			id = hud_mic_binding}
		hud_mic_binding :se_setprops \{block_events}
	endif
	switch <drop_reason>
		case net_message_player_kicked
		formattext textname = drop_msg qs(0x7adab19b) s = <name_string>
		getnumplayersingame \{local}
		if (<num_players> > 0)
			getfirstplayer \{local}
			begin
			if (<player> = <dropped_player_num>)
				formattext \{textname = first_msg
					qs(0xbfe89076)}
				break
			endif
			getnextplayer player = <player> local
			repeat <num_players>
		endif
		case net_message_player_quit
		formattext textname = first_msg qs(0x567f10d8) s = <name_string>
		case net_message_player_dropped
		case net_message_player_timed_out
		formattext textname = first_msg qs(0xd4b272d7) s = <name_string>
		default
		first_msg = qs(0x00000000)
	endswitch
	formattext textname = msg qs(0x78bb855f) s = <first_msg>
	create_net_popup title = qs(0x5ca2c535) popup_text = <msg>
	if screenelementexists \{id = dialog_box_desc_id}
		dialog_box_desc_id :se_setprops \{z_priority = 1500.2}
		dialog_box_desc_id :obj_spawnscriptnow \{band_lobby_end_game_spawned
			id = not_ui_player_drop_scripts}
	endif
	if screenelementexists \{id = band_lobby_desc_id}
		band_lobby_desc_id :obj_killspawnedscript \{name = band_lobby_display_final_matchmaking_players}
	endif
endscript

script band_lobby_end_game_spawned 
	wait \{3
		seconds}
	destroy_net_popup
	if screenelementexists \{id = questmapid}
		questmapid :se_setprops \{net_dialog_alpha = 0.0}
	elseif screenelementexists \{id = questmapgiglistid}
		questmapgiglistid :se_setprops \{net_dialog_alpha = 0.0}
	endif
	quit_network_game
	band_lobby_restore_prematchmaking_settings
	begin
	if NOT savegame_async_is_busy
		break
	endif
	wait \{1
		gameframe}
	repeat
	begin
	if NOT scriptisrunning \{downloads_enumcontent}
		break
	endif
	wait \{1
		gameframe}
	repeat
	if ui_event_exists_in_stack \{name = 'band_lobby'}
		change \{g_suppress_anim_in = 1}
		ui_memcard_autosave_all_players \{event = menu_back
			state = uistate_band_lobby
			data = {
				no_anim_in = 1
			}
			is_popup}
		ui_event_wait_for_safe
		begin
		if NOT ui_event_exists_in_stack \{name = 'memcard'}
			if ($g_memcard_ingame_is_paused = 0)
				break
			endif
		endif
		wait \{1
			gameframe}
		printf \{'waiting for autosave to finish'}
		repeat
		ui_event_wait_for_safe
		change \{g_suppress_anim_in = 0}
		ui_event \{event = menu_refresh}
	endif
endscript

script band_lobby_change_lobby 
	requireparams \{[
			player
			submenu_index
			lobby
			action
		]
		all}
	printf channel = band_lobby qs(0x1cc443d6) c = <submenu_index> d = <player>
	change g_lobby_state = <lobby>
	band_lobby_set_gamemode_by_state lobby = ($g_lobby_state)
	if NOT ($g_lobby_net_state = local)
		band_lobby_set_party_joiner_mode
		band_lobby_set_party_joinable
	endif
	band_lobby_update_lobby_title
	band_lobby_update_button_helpers
	band_lobby_update_ticker \{msg_checksum = current_state}
	fastgetarraysize \{array = $band_lobby_viewport_menus}
	<submenu_index> = 0
	begin
	band_lobby_get_submenu_data submenu_index = <submenu_index> param = player
	if (<player> != $g_leader_player_num)
		band_lobby_update_submenu_data submenu_index = <submenu_index> element = menu_indices value = [0 0 0]
	endif
	<submenu_index> = (1 + <submenu_index>)
	repeat <array_size>
	band_lobby_force_submenu_change_all \{menu = main
		submenu_data_match = occupied
		match_value = 1
		focus = 1
		action = back}
	band_lobby_reset_all_chosen_characters \{not_silhouettes}
	persistent_band_refresh_changed_characters
endscript

script band_lobby_set_gamemode_by_state 
	requireparams \{[
			lobby
		]
		all}
	if (<lobby> = vs)
		if ($competitive_rules = solo_fest_mode)
			change \{game_mode = fest_mode}
		elseif ($competitive_rules = team_fest_mode)
			change \{game_mode = fest_mode_team}
		else
			rules = ($competitive_rules)
			if (($<rules>.team) = 1)
				change \{game_mode = compmega_team}
			else
				change \{game_mode = compmega}
			endif
		endif
	elseif (<lobby> = career)
		change \{game_mode = career}
	elseif (<lobby> = quickplay)
		change \{game_mode = quickplay}
	endif
	if (<lobby> != vs)
		session_stats_reset
	endif
endscript

script band_lobby_choose_gamemmode 
	requireparams \{[
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
	change game_mode = <game_mode>
	change g_copy_game_mode = <game_mode>
	if gotparam \{rules}
		change competitive_rules = <rules>
	endif
	band_lobby_update_lobby_title
	band_lobby_update_button_helpers
	band_lobby_change_menu menu = main action = <action> player = <player> submenu_index = <submenu_index>
endscript

script band_lobby_change_network \{focus = 1}
	requireparams \{[
			player
			network
		]
		all}
	printf \{channel = band_lobby
		qs(0x70172cac)}
	if gotparam \{submenu_index}
		submenu_index = <submenu_index>
	endif
	if (($g_lobby_net_state = local) && ((<network> = net_private) || (<network> = net_public)))
		if band_lobby_check_if_all_players_are_online_enabled
			if (<focus> = 1)
				band_lobby_change_focus_submenu_all \{focus_type = unfocus}
			endif
			band_lobby_update_ticker \{msg_checksum = update_net}
			change g_lobby_net_state = <network>
			if (<network> = net_public)
				if ($game_mode = compmega && $competitive_rules != team_faceoff && $competitive_rules != faceoff)
					change \{game_mode = fest_mode}
					change \{competitive_rules = solo_fest_mode}
				endif
			endif
			band_lobby_update_lobby_title
			band_lobby_ensure_primary_controller_is_signed_in
			if NOT band_lobby_net_setup
				change \{g_lobby_net_state = local}
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
		change g_lobby_net_state = <network>
		band_lobby_update_lobby_title
		band_lobby_net_cleanup
		netsessionfunc \{func = match_init}
		netsessionfunc \{func = friends_init}
		band_lobby_update_ticker \{msg_checksum = current_state}
		if (<focus> = 1)
			band_lobby_change_focus_submenu_all \{focus_type = focus}
		endif
	elseif (((<network> = net_private) && ($g_lobby_net_state = net_public)) || ((<network> = net_public) && ($g_lobby_net_state = net_private)))
		if (<focus> = 1)
			band_lobby_change_focus_submenu_all \{focus_type = unfocus}
		endif
		band_lobby_update_ticker \{msg_checksum = update_net}
		change g_lobby_net_state = <network>
		band_lobby_update_lobby_title
		band_lobby_update_ticker \{msg_checksum = current_state}
		if (<focus> = 1)
			band_lobby_change_focus_submenu_all \{focus_type = focus}
		endif
	else
		change g_lobby_net_state = <network>
		band_lobby_update_lobby_title
	endif
	if gotparam \{action}
		band_lobby_update_button_helpers
		band_lobby_change_menu menu = main action = <action> player = <player> submenu_index = <submenu_index>
	endif
endscript

script band_lobby_change_global 
	requireparams \{[
			player
			submenu_index
			menu
			action
			global
			value
		]
		all}
	printf \{channel = band_lobby
		qs(0x99d0a9b9)}
	change globalname = <global> newvalue = <value>
	band_lobby_change_menu menu = <menu> action = <action> player = <player> submenu_index = <submenu_index>
endscript

script band_lobby_set_mic_preference 
	requireparams \{[
			player
			mic_preference
		]}
	setplayerinfo <player> mic_preference = <mic_preference>
	getplayerinfo <player> controller
	save_progression_instrument_user_option part = vocals controller = <controller> option = 'mic_preference' new_value = <mic_preference>
endscript

script band_lobby_set_mic_preference_menu 
	requireparams \{[
			player
			mic_preference
			action
			menu
		]
		all}
	band_lobby_set_mic_preference player = <player> mic_preference = <mic_preference>
	if gotparam \{no_forced}
		band_lobby_vocals_forced_menu player = <player> action = <action> previous_menu = forced_mic_preference submenu_index = <submenu_index>
	else
		band_lobby_change_menu menu = <menu> action = <action> player = <player> submenu_index = <submenu_index>
	endif
endscript

script band_lobby_change_playerinfo 
	requireparams \{[
			player
			submenu_index
			menu
			action
		]
		all}
	printf \{channel = band_lobby
		qs(0xdd3e9d04)}
	get_savegame_from_player player = <player>
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%i' i = <submenu_index>
	if NOT gotparam \{character_id}
		if (<player> != ($<submenu_data>.player))
			scriptassert 'Logic is screwed up. Player %a != %b' a = <player> b = ($<submenu_data>.player)
		endif
	endif
	if gotparam \{difficulty}
		getplayerinfo <player> controller
		getplayerinfo ($<submenu_data>.player) part
		if (<part> = drum)
			if (<difficulty> = expert_plus)
				difficulty = expert
				double_kick_drum = 1
			else
				double_kick_drum = 0
			endif
			setplayerinfo ($<submenu_data>.player) double_kick_drum = <double_kick_drum> store
			get_progression_instrument_user_option part = drum controller = <controller> option = 'double_kick_drum'
			if (<difficulty> != <user_option>)
				band_lobby_set_dirty_save_flag player = <player> flag = 1
				save_progression_instrument_user_option part = drum controller = <controller> option = 'double_kick_drum' new_value = <double_kick_drum>
			endif
		endif
		setplayerinfo ($<submenu_data>.player) difficulty = <difficulty> store
		get_progression_instrument_user_option part = <part> controller = <controller> option = 'difficulty'
		if (<difficulty> != <user_option>)
			band_lobby_set_dirty_save_flag player = <player> flag = 1
			save_progression_instrument_user_option part = <part> controller = <controller> option = 'difficulty' new_value = <difficulty>
		endif
	elseif gotparam \{character_id}
		requireparams \{[
				character_savegame
			]
			all}
		if characterprofilegetcategory name = <character_id>
			if (<profile_category> = temporary)
				scriptassert 'Should not be setting the character_id to %s' s = <character_id>
			endif
		endif
		setplayerinfo ($<submenu_data>.player) character_id = <character_id> store
		setplayerinfo ($<submenu_data>.player) character_savegame = <character_savegame> store
		getplayerinfo ($<submenu_data>.player) stored_character_index
		new_character_id = <character_id>
		new_character_savegame = <character_savegame>
		get_saved_band_member index = <stored_character_index> savegame = <savegame>
		if (<character_id> != <new_character_id> || <character_savegame> != <new_character_savegame>)
			band_lobby_set_dirty_save_flag player = <player> flag = 1
			globaltag_save_band_member_choice {
				index = <stored_character_index>
				character_id = <new_character_id>
				savegame = <savegame>
				character_savegame = <new_character_savegame>
				borrowed_from_band_leader = <borrowed_from_band_leader>
			}
		endif
	elseif gotparam \{lefty_flip}
		setplayerinfo ($<submenu_data>.player) lefty_flip = <lefty_flip> store
		getplayerinfo <player> controller
		getplayerinfo ($<submenu_data>.player) part
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
			scriptassert \{'no lefty flip on vocals!'}
		endif
	elseif gotparam \{vocals_highway_view}
		band_lobby_set_vocals_highway_view player = ($<submenu_data>.player) vocals_highway_view = <vocals_highway_view>
		getplayerinfo <player> controller
		getplayerinfo ($<submenu_data>.player) part
		get_progression_instrument_user_option part = <part> controller = <controller> option = 'highway_view'
		if (<vocals_highway_view> != <user_option>)
			band_lobby_set_dirty_save_flag player = <player> flag = 1
			save_progression_instrument_user_option part = <part> controller = <controller> option = 'highway_view' new_value = <vocals_highway_view>
		endif
	elseif gotparam \{part}
		band_lobby_rocker_changed_player_part {
			part = <part>
			player = <player>
			submenu_index = <submenu_index>
		}
	endif
	persistent_band_refresh_changed_characters
	if gotparam \{vocals_forced_previous_menu}
		band_lobby_vocals_forced_menu player = <player> action = <action> previous_menu = <vocals_forced_previous_menu> submenu_index = <submenu_index>
	else
		if gotparam \{no_forced}
			band_lobby_change_menu menu = <menu> action = <action> player = <player> submenu_index = <submenu_index> no_forced
		else
			band_lobby_change_menu menu = <menu> action = <action> player = <player> submenu_index = <submenu_index>
		endif
	endif
	if ($g_career_search != null)
		set_player_temp_net_id_array player = ($<submenu_data>.player)
	endif
endscript

script band_lobby_change_menu \{focus = 1}
	requireparams \{[
			menu
			player
			submenu_index
			action
		]
		all}
	printf channel = band_lobby qs(0x0d7dd435) c = <submenu_index> d = <player>
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%d' d = <submenu_index>
	if screenelementexists id = ($band_lobby_viewport_menus [<submenu_index>])
		original_menu = <menu>
		if (<menu> = main)
			if ($<submenu_data>.is_managed = 1)
				menu = manage_member
				band_lobby_update_submenu_data submenu_index = <submenu_index> element = return_menu value = main
			else
				if (($g_leader_player_num = <player>) && ($g_net_leader_player_num = <player>))
					if ($g_lobby_state = career)
						menu = band_leader_career
					elseif ($g_lobby_state = quickplay)
						menu = band_leader_quickplay
					else
						menu = band_leader_vs
					endif
				else
					menu = band_member
				endif
			endif
		elseif (<menu> = select_rocker)
			formattext checksumname = select_rocker 'select_rocker%i' i = <submenu_index>
			menu = <select_rocker>
		endif
		if NOT gotparam \{no_forced}
			if band_lobby_get_forced_menu submenu_index = <submenu_index>
				<menu> = <forced_menu>
			endif
		endif
		($band_lobby_viewport_menus [<submenu_index>]) :menu_getselectedindex
		array = ($<submenu_data>.menu_indices)
		if (<action> = forward)
			focus_value = null
			default_index = 0
			menu_options = ($band_lobby_submenu_states.<menu>.options)
			if structurecontains structure = ($band_lobby_submenu_states.<menu>) focus_param
				band_lobby_get_focus_value player = ($<submenu_data>.player) submenu_index = <submenu_index> focus_param = ($band_lobby_submenu_states.<menu>.focus_param)
				getarraysize \{menu_options}
				if (<array_size> > 0)
					i = 0
					index = 0
					begin
					<option> = ($band_lobby_submenu_states.<menu>.options [<i>])
					if structurecontains structure = <option> condition
						<condition> = (<option>.condition)
						if <condition> player = <player> submenu_index = <submenu_index>
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
					repeat <array_size>
					default_index = <index>
				endif
			endif
			setarrayelement arrayname = array index = 2 newvalue = (<array> [1])
			setarrayelement arrayname = array index = 1 newvalue = <selected_index>
			setarrayelement arrayname = array index = 0 newvalue = <default_index>
		elseif (<action> = back)
			if (<menu> = join)
				setarrayelement \{arrayname = array
					index = 0
					newvalue = 0}
				setarrayelement \{arrayname = array
					index = 1
					newvalue = 0}
				setarrayelement \{arrayname = array
					index = 2
					newvalue = 0}
			else
				setarrayelement arrayname = array index = 0 newvalue = (<array> [1])
				setarrayelement arrayname = array index = 1 newvalue = (<array> [2])
				setarrayelement \{arrayname = array
					index = 2
					newvalue = 0}
			endif
		endif
		band_lobby_update_submenu_data submenu_index = <submenu_index> element = menu value = <menu>
		band_lobby_update_submenu_data submenu_index = <submenu_index> element = menu_indices value = <array>
		if gotparam \{reset_characters}
			set_chosen_character_id player = ($<submenu_data>.player) id = none
			band_lobby_refresh_band_leader_characters \{no_refresh}
			persistent_band_refresh_changed_characters
		endif
		band_lobby_add_menu_update_to_queue submenu_index = <submenu_index> action = <action> focus = <focus> menu = <menu>
	endif
endscript

script band_lobby_net_setup 
	printf \{channel = band_lobby
		qs(0x3bdeb4db)}
	if isps3
		xenon_singleplayer_session_init \{ps3_signin_callback = signin_complete_callback}
		begin
		if ($ps3_signin_complete = 1)
			break
		endif
		wait \{1
			frame}
		repeat
	endif
	net_init
	netsessionfunc \{func = friends_init}
	if isps3
		if NOT netsessionfunc \{func = is_lobby_available}
			band_lobby_net_cleanup
			return \{false}
		endif
		if ($demonware_is_ready = 1)
			if ($demonware_stun_failed = 1)
				band_lobby_net_cleanup
				return \{false}
			endif
		else
			band_lobby_net_cleanup
			return \{false}
		endif
	endif
	netsessionfunc \{func = match_uninit}
	netsessionfunc \{func = match_init}
	netsessionfunc {
		obj = party
		func = create_party_session
		params = {
			controller_index = ($primary_controller)
			callback = band_lobby_net_setup_party_callback
		}
	}
	return \{true}
endscript

script band_lobby_net_setup_party_callback 
	if (<success> = 1)
		netsessionfunc \{obj = party
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
	endif
endscript

script band_lobby_net_cleanup 
	printf \{channel = band_lobby
		qs(0x93722761)}
	band_lobby_kill_party_object_polling
	netsessionfunc \{obj = party
		func = stop_party_session}
	netsessionfunc \{func = friends_uninit}
	netsessionfunc \{obj = match
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
		scriptassert \{qs(0xbc58f794)}
	endswitch
	netsessionfunc {
		obj = party
		func = set_joiner_mode
		params = {
			mode = <mode>
		}
	}
endscript

script band_lobby_set_party_joinable 
	printf \{channel = band_lobby
		qs(0x1341e861)}
	if NOT gotparam \{joinable}
		switch ($g_lobby_net_state)
			case local
			scriptassert \{qs(0xa0f5420c)}
			case net_private
			joinable = 1
			case net_public
			joinable = 1
			default
			scriptassert \{qs(0xa3be6b94)}
		endswitch
	endif
	netsessionfunc {
		obj = party
		func = set_party_joinable
		params = {
			joinable = <joinable>
		}
	}
endscript

script band_lobby_update_player_viewport_assignments 
	printf \{qs(0x61a46220)}
	band_lobby_get_viewport_assignments
	getarraysize <viewport_assignments>
	<submenu_index> = 0
	begin
	user_id = [0 0]
	<viewport_player> = (<viewport_assignments> [<submenu_index>].player)
	if (<viewport_player> > 0)
		<viewport_occupied> = (<viewport_assignments> [<submenu_index>].occupied)
		getplayerinfo <viewport_player> is_local_client
		getplayerinfo <viewport_player> gamertag
		getplayerinfo <viewport_player> net_id_first
		getplayerinfo <viewport_player> net_id_second
		setarrayelement arrayname = user_id index = 0 newvalue = <net_id_first>
		setarrayelement arrayname = user_id index = 1 newvalue = <net_id_second>
		if (<viewport_occupied> = 0)
			band_lobby_clear_submenu_data submenu_data_index = <submenu_index>
			band_lobby_update_submenu_data submenu_index = <submenu_index> element = player value = <viewport_player>
			if (<submenu_index> < ($g_num_lobby_local_submenus))
				setplayerinfo <viewport_player> is_onscreen = 1
				band_lobby_update_submenu_data submenu_index = <submenu_index> element = menu value = join
				setplayerinfo <viewport_player> controller = <submenu_index>
				if NOT checksumequals a = ($band_lobby_viewport_menus [<submenu_index>]) b = null
					band_lobby_add_menu_update_to_queue submenu_index = <submenu_index> focus = 1
				endif
			endif
		else
			band_lobby_update_submenu_data submenu_index = <submenu_index> element = player value = <viewport_player>
			band_lobby_update_submenu_data submenu_index = <submenu_index> element = net_id value = <user_id>
			band_lobby_update_submenu_data submenu_index = <submenu_index> element = occupied value = 1
			band_lobby_get_submenu_data submenu_index = <submenu_index> param = gamertag_checksum
			change globalname = <gamertag_checksum> newvalue = ($<gamertag>)
			if (<submenu_index> < ($g_num_lobby_local_submenus))
				setplayerinfo <viewport_player> is_onscreen = 1
				if (<is_local_client> = 0)
					setplayerinfo <viewport_player> controller = <submenu_index>
					if NOT checksumequals a = ($band_lobby_viewport_menus [<submenu_index>]) b = null
						band_lobby_update_submenu_data submenu_index = <submenu_index> element = menu value = remote_player
						band_lobby_add_menu_update_to_queue submenu_index = <submenu_index> focus = 1
					endif
				endif
			endif
		endif
		persistent_band_get_unused_musician
		if (<unused_musician> != none)
			setplayerinfo <viewport_player> band_member = <unused_musician>
		endif
		if (<submenu_index> < ($g_num_lobby_local_submenus))
			update_camera_for_viewport submenu_index = <submenu_index> player = <viewport_player>
		endif
		<submenu_index> = (<submenu_index> + 1)
	endif
	repeat <array_size>
	band_lobby_refresh_band_leader_characters \{no_refresh}
	persistent_band_refresh_changed_characters
endscript

script update_camera_for_viewport 
	requireparams \{[
			submenu_index
			player
		]
		all}
	getplayerinfo <player> band_member
	if compositeobjectexists name = <band_member>
		formattext checksumname = viewport 'band_viewport_%i' i = <submenu_index>
		if screenelementexists id = <viewport>
			<viewport> :obj_killspawnedscript name = band_lobby_play_viewport_camera
			runscriptonscreenelement id = <viewport> band_lobby_play_viewport_camera params = {viewport_index = <submenu_index> lock_to_target = <band_member>}
		endif
	endif
endscript

script band_lobby_get_viewport_assignments 
	viewport_assignments = [
		{player = 0 occupied = 0}
		{player = 0 occupied = 0}
		{player = 0 occupied = 0}
		{player = 0 occupied = 0}
		{player = 0 occupied = 0}
		{player = 0 occupied = 0}
		{player = 0 occupied = 0}
		{player = 0 occupied = 0}
	]
	viewport_player_nums = [0 0 0 0 0 0 0 0]
	getnumplayersingame \{local}
	if (<num_players> > 0)
		getfirstplayer \{local}
		begin
		setarrayelement arrayname = viewport_assignments index = (<player> - 1) newvalue = {player = <player> occupied = 1}
		setarrayelement arrayname = viewport_player_nums index = (<player> - 1) newvalue = <player>
		getnextplayer local player = <player>
		repeat <num_players>
	endif
	<num_viewports_filled> = <num_players>
	getnumplayersingame \{remote}
	if (<num_players> > 0)
		getfirstplayer \{remote}
		begin
		getarraysize <viewport_assignments>
		<i> = 0
		begin
		if ((<viewport_assignments> [<i>].player) = 0)
			setarrayelement arrayname = viewport_assignments index = <i> newvalue = {player = <player> occupied = 1}
			setarrayelement arrayname = viewport_player_nums index = <i> newvalue = <player>
			<num_viewports_filled> = (<num_viewports_filled> + 1)
			break
		endif
		<i> = (<i> + 1)
		repeat <array_size>
		getnextplayer player = <player> remote
		repeat <num_players>
	endif
	<npc_index> = 1
	begin
	if NOT arraycontains array = <viewport_player_nums> contains = <npc_index>
		getarraysize <viewport_assignments>
		<i> = 0
		begin
		if ((<viewport_assignments> [<i>].player) = 0)
			if (<i> < ($g_num_lobby_local_submenus))
				band_lobby_get_available_musician_id viewport_assignments = <viewport_assignments> num_viewports_filled = <num_viewports_filled>
				setplayerinfo <npc_index> band_member = <musician_id>
			endif
			setarrayelement arrayname = viewport_assignments index = <i> newvalue = {player = <npc_index> occupied = 0}
			setarrayelement arrayname = viewport_player_nums index = <i> newvalue = <npc_index>
			<num_viewports_filled> = (<num_viewports_filled> + 1)
			break
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	<npc_index> = (<npc_index> + 1)
	repeat ($g_num_lobby_total_submenus)
	return viewport_assignments = <viewport_assignments>
endscript

script band_lobby_get_available_musician_id 
	requireparams \{[
			viewport_assignments
		]
		all}
	printf \{channel = band_lobby
		qs(0xcaa71070)}
	musician_id = none
	available_musicians = [musician1 musician2 musician3 musician4]
	getarraysize <viewport_assignments>
	if (<array_size> > 0)
		i = 0
		begin
		if ((<viewport_assignments> [<i>].player) > 0)
			getplayerinfo (<viewport_assignments> [<i>].player) band_member
			getarraysize <available_musicians>
			if (<array_size> > 0)
				j = 0
				begin
				if ((<available_musicians> [<j>]) = <band_member>)
					removearrayelement array = <available_musicians> index = <j>
					available_musicians = <array>
					break
				endif
				j = (<j> + 1)
				repeat <array_size>
			endif
		endif
		i = (<i> + 1)
		repeat ($g_num_lobby_local_submenus)
		getarraysize <available_musicians>
		if (<array_size> > 0)
			return musician_id = (<available_musicians> [0])
		else
			scriptassert \{qs(0x90b83ada)}
			return musician_id = <musician_id>
		endif
	else
		scriptassert \{qs(0x98f700d8)}
		return musician_id = <musician_id>
	endif
endscript

script band_lobby_add_in_game_players_to_party 
	printf \{channel = band_lobby
		qs(0xc4474b1d)}
	if gotparam \{net_init}
		i = 0
		begin
		band_lobby_get_submenu_data submenu_index = <i> param = player
		getplayerinfo <player> controller
		if netsessionfunc func = iscontrolleringame params = {controller = <controller>}
			netsessionfunc obj = party func = add_local_player_to_party params = {controller_index = <controller>}
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
			getplayerinfo <player> controller
			if netsessionfunc obj = party func = add_local_player_to_party params = {controller_index = <controller>}
				finished_adding_local_players = 1
			endif
			getnextplayer local player = <player>
			repeat <num_players>
		else
			break
		endif
		i = (<i> + 1)
		if (<finished_adding_local_players> = 1)
			break
		endif
		wait \{1
			gameframe}
		repeat
		printf qs(0x8e0dd858) d = <i>
	endif
	getnumplayersingame \{local}
	if (<num_players> > 0)
		getfirstplayer \{local}
		begin
		getplayerinfo <player> controller
		getplayerinfo <player> gamertag
		band_lobby_get_player_user_id player = <player>
		if band_lobby_get_party_id_by_user_id gamertag = ($<gamertag>) user_id = <user_id>
			setplayerinfo <player> party_id = <party_id>
		endif
		getnextplayer local player = <player>
		repeat <num_players>
	endif
endscript

script band_lobby_kill_party_object_polling 
	printf \{channel = band_lobby
		qs(0x778bf081)}
	if scriptisrunning \{band_lobby_poll_party_members}
		killspawnedscript \{name = band_lobby_poll_party_members}
	endif
	if scriptisrunning \{band_lobby_update_party_data}
		killspawnedscript \{name = band_lobby_update_party_data}
	endif
	if netsessionfunc \{obj = party
			func = is_host}
		netsessionfunc \{obj = party
			func = clear_shared_data}
	endif
endscript

script band_lobby_poll_party_object 
	printf \{channel = band_lobby
		qs(0x43c46458)}
	if screenelementexists \{id = band_lobby_desc_id}
		if NOT scriptisrunning \{band_lobby_update_party_data}
			band_lobby_desc_id :obj_spawnscriptlater \{band_lobby_update_party_data}
		endif
		if NOT scriptisrunning \{band_lobby_poll_party_members}
			band_lobby_desc_id :obj_spawnscriptlater \{band_lobby_poll_party_members}
		endif
	endif
endscript

script band_lobby_update_party_data 
	printf \{channel = band_lobby
		qs(0xf3c556d0)}
	current_lobby_net_state = null
	current_lobby_state = null
	current_leader_party_id = -1
	update_lobby_title = 0
	begin
	if NOT innetgame
		if netsessionfunc \{obj = party
				func = is_host}
			if (
					(<current_lobby_net_state> != ($g_lobby_net_state)) ||
					(<current_lobby_state> != ($g_lobby_state))
				)
				data = {
					lobby_net_state = ($g_lobby_net_state)
					lobby_state = ($g_lobby_state)
				}
				netsessionfunc obj = party func = append_shared_data params = {data = <data>}
				current_lobby_net_state = ($g_lobby_net_state)
				current_lobby_state = ($g_lobby_state)
			endif
			if ($g_net_leader_player_num > 0)
				getplayerinfo ($g_net_leader_player_num) party_id
				if (<current_leader_party_id> != <party_id>)
					data = {
						leader_party_id = <party_id>
					}
					netsessionfunc obj = party func = append_shared_data params = {data = <data>}
					current_leader_party_id = <party_id>
				endif
			endif
		else
			netsessionfunc \{obj = party
				func = get_shared_data}
			if gotparam \{party_shared_data}
				if structurecontains structure = <party_shared_data> lobby_state
					if NOT checksumequals a = (<party_shared_data>.lobby_state) b = ($g_lobby_state)
						change g_lobby_state = (<party_shared_data>.lobby_state)
						update_lobby_title = 1
					endif
				endif
				if structurecontains structure = <party_shared_data> lobby_net_state
					if NOT checksumequals a = (<party_shared_data>.lobby_net_state) b = ($g_lobby_net_state)
						change g_lobby_net_state = (<party_shared_data>.lobby_net_state)
						update_lobby_title = 1
					endif
				endif
				if structurecontains structure = <party_shared_data> leader_party_id
					if band_lobby_get_player_num_by_party_id party_id = (<party_shared_data>.leader_party_id)
						if (<player_num> != $g_net_leader_player_num)
							change g_net_leader_player_num = <player_num>
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
				<async_io_status> = busy
			elseif ui_event_exists_in_stack \{name = 'memcard'}
				<async_io_status> = busy
			else
				<async_io_status> = ready
			endif
			setplayerinfo <player> async_io_status = <async_io_status>
			getnextplayer player = <player> local
			repeat <num_players>
		endif
	endif
	wait \{1.0
		second}
	repeat
endscript

script band_lobby_poll_party_members 
	printf \{channel = band_lobby
		qs(0x158d30f8)}
	changeglobalinteger \{global_name = g_num_party_members
		new_value = 0}
	begin
	if NOT innetgame
		netsessionfunc \{obj = party
			func = get_party_members}
		getarraysize <connections>
		if (<array_size> > 0)
			if (<array_size> > ($g_num_party_members))
				band_lobby_add_party_member
			elseif (<array_size> < ($g_num_party_members))
				band_lobby_remove_party_member
			endif
			changeglobalinteger global_name = g_num_party_members new_value = <array_size>
		endif
	endif
	waitonegameframe
	repeat
endscript

script band_lobby_add_party_member 
	printf \{channel = band_lobby
		qs(0xc9903851)}
	netsessionfunc \{obj = party
		func = get_party_members}
	did_add_player = 0
	getarraysize \{connections}
	if (0 < <array_size>)
		<i> = 0
		begin
		if (0 = (<connections> [<i>].is_local))
			if band_lobby_is_new_party_member user_id = (<connections> [<i>].user_id) party_id = (<connections> [<i>].party_id)
				did_add_player = 1
				band_lobby_find_available_submenu_data
				if NOT (<submenu_data_index> = -1)
					if bl_is_managing
						band_lobby_manage_band_members action = deselect player = (<managed_submenu_index> + 1) submenu_index = <managed_submenu_index> forced_deselect_for_join = 1
						band_lobby_wait_for_menu_change
					endif
					band_lobby_add_player_to_playerinfo player_type = party data = (<connections> [<i>])
					formattext checksumname = submenu_data 'band_lobby_submenu_data_%d' d = <submenu_data_index>
					band_lobby_update_submenu_data submenu_index = <submenu_data_index> element = net_id value = (<connections> [<i>].user_id)
					band_lobby_update_submenu_data submenu_index = <submenu_data_index> element = player value = <playerinfo>
					band_lobby_update_submenu_data submenu_index = <submenu_data_index> element = occupied value = 1
					if isps3
						change globalname = ($<submenu_data>.gamertag_checksum) newvalue = (<connections> [<i>].gamertag)
					endif
					net_start_character_silhouette player = <playerinfo> submenu_index = <submenu_data_index>
					if (<submenu_data_index> < ($g_num_lobby_local_submenus))
						band_lobby_wait_for_menu_change
						persistent_band_get_unused_musician
						if (<unused_musician> != none)
							setplayerinfo <playerinfo> band_member = <unused_musician>
						endif
						setplayerinfo <playerinfo> controller = <submenu_data_index>
						($band_lobby_viewport_menus [<submenu_data_index>]) :obj_spawnscriptnow band_lobby_change_menu params = {action = forward menu = remote_player player = <playerinfo> submenu_index = <submenu_data_index> no_forced}
						band_lobby_kick_leader_out_of_band_manage
					endif
				else
					scriptassert \{qs(0x826c0d06)}
				endif
				if screenelementexists \{id = band_lobby_pu_gr}
					band_lobby_return_from_game_rules
				endif
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
		if (<did_add_player> = 1)
			band_lobby_update_player_viewport_assignments
		endif
	endif
endscript

script band_lobby_wait_for_menu_change 
	begin
	if NOT scriptisrunning \{band_lobby_update_menu}
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script band_lobby_remove_party_member 
	printf \{channel = band_lobby
		qs(0xcf805d25)}
	netsessionfunc \{obj = party
		func = get_party_members}
	getarraysize \{connections}
	getnumplayersingame
	removed_remote_player = 0
	if ((<num_players> > 0) && (<array_size> > 0))
		getfirstplayer
		begin
		if NOT band_lobby_is_player_party_member player_num = <player>
			if playerinfoequals <player> is_local_client = 0
				removed_remote_player = 1
				band_lobby_get_player_submenu_index player_num = <player>
				if (<submenu_index> > -1)
					net_clear_player_info player = <player>
					if (<player> < ($g_num_lobby_local_submenus))
						setplayerinfo <player> is_local_client = 1
					else
						setplayerinfo <player> is_local_client = 0
					endif
					band_lobby_clear_submenu_data submenu_data_index = <submenu_index>
					if (<submenu_index> < ($g_num_lobby_local_submenus))
						net_stop_character_silhouette player = <player>
						($band_lobby_viewport_menus [<submenu_index>]) :obj_spawnscriptnow band_lobby_change_menu params = {action = back menu = join player = (<submenu_index> + 1) submenu_index = <submenu_index>}
						band_lobby_kick_leader_out_of_band_manage
					endif
				endif
				if screenelementexists \{id = band_lobby_pu_gr}
					band_lobby_return_from_game_rules
				endif
			endif
		endif
		getnextplayer player = <player>
		repeat <num_players>
		if (<removed_remote_player> = 1)
			band_lobby_update_player_viewport_assignments
			band_lobby_refresh_band_leader_characters
		endif
	endif
endscript

script band_lobby_is_new_party_member 
	requireparams \{[
			user_id
			party_id
		]
		all}
	printf \{qs(0x4e5e8444)}
	getmaxplayers
	<index> = 0
	begin
	if playerinfoequals (<index> + 1) in_game = 1
		getplayerinfo (<index> + 1) net_id_first
		getplayerinfo (<index> + 1) net_id_second
		getplayerinfo (<index> + 1) party_id out = current_party_id
		if ((<net_id_first> = (<user_id> [0])) && (<net_id_second> = (<user_id> [1])) && (<current_party_id> = <party_id>))
			return \{false}
		endif
	endif
	<index> = (1 + <index>)
	repeat <max_players>
	return \{true}
endscript

script band_lobby_is_player_party_member 
	requireparams \{[
			player_num
		]}
	printf \{channel = band_lobby
		qs(0x8d9246fd)}
	netsessionfunc \{obj = party
		func = get_party_members}
	getarraysize \{connections}
	getplayerinfo <player_num> net_id_first
	getplayerinfo <player_num> net_id_second
	getplayerinfo <player_num> gamertag
	if (<array_size> > 0)
		i = 0
		begin
		if ((<net_id_first> = (<connections> [<i>].user_id [0])) && (<net_id_second> = (<connections> [<i>].user_id [1])) && (($<gamertag>) = (<connections> [<i>].gamertag)))
			return \{true}
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	return \{false}
endscript

script band_lobby_leave_party 
	printf \{channel = band_lobby
		qs(0xe75a36dc)}
	if screenelementexistssimpleid \{id = current_band_lobby_popup}
		if current_band_lobby_popup :se_getparentid
			band_lobby_destroy_popup_menu container = <parent_id> no_focus
		endif
	endif
	if netsessionfunc \{obj = party
			func = is_host}
		netsessionfunc \{obj = party
			func = disband_party_session}
	else
		netsessionfunc \{obj = party
			func = leave_party}
		changeglobalinteger global_name = g_net_leader_player_num new_value = ($g_leader_player_num)
	endif
	band_lobby_add_in_game_players_to_party
	band_lobby_store_local_players_net_and_party_ids_in_playerinfo
	<submenu_index> = 0
	begin
	band_lobby_get_submenu_data submenu_index = <submenu_index> param = player
	band_lobby_get_submenu_data submenu_index = <submenu_index> param = occupied
	if (1 = <occupied>)
		if playerinfoequals <player> is_local_client = 1
			band_lobby_update_submenu_data submenu_index = <submenu_index> element = menu_indices value = [0 0 0]
			band_lobby_change_menu action = back menu = main player = <player> submenu_index = <submenu_index> no_forced focus = 1
		endif
	else
		band_lobby_update_submenu_data submenu_index = <submenu_index> element = menu value = join
		band_lobby_add_menu_update_to_queue submenu_index = <submenu_index> menu_index = -1 focus = 1
	endif
	<submenu_index> = (1 + <submenu_index>)
	repeat ($g_num_lobby_local_submenus)
	band_lobby_change_focus_submenu_all \{focus_type = focus}
	band_lobby_update_button_helpers
endscript

script band_lobby_get_party_id_by_user_id 
	requireparams \{[
			user_id
		]
		all}
	printf \{channel = band_lobby
		qs(0xab8e5e0c)}
	party_id = -1
	netsessionfunc \{obj = party
		func = get_party_members}
	getarraysize \{connections}
	if (<array_size> > 0)
		i = 0
		begin
		if (((<user_id> [0]) = (<connections> [<i>].user_id [0])) && ((<user_id> [1]) = (<connections> [<i>].user_id [1])))
			if isps3
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
		repeat <array_size>
	endif
	if (<party_id> > -1)
		return true party_id = <party_id>
	else
		return \{false}
	endif
endscript

script band_lobby_get_player_num_by_party_id 
	requireparams \{[
			party_id
		]
		all}
	if netsessionfunc obj = party func = get_party_member params = {party_id = <party_id>}
		player_num = -1
		getnumplayersingame
		if (<num_players> > 0)
			getfirstplayer
			begin
			if playerinfoequals <player> net_id_first = (<connections> [0].user_id [0])
				if playerinfoequals <player> net_id_second = (<connections> [0].user_id [1])
					if isps3
						getplayerinfo <player> gamertag
						if (($<gamertag>) = (<connections> [0].gamertag))
							player_num = <player>
							break
						endif
					else
						player_num = <player>
						break
					endif
				endif
			endif
			getnextplayer player = <player>
			repeat <num_players>
		endif
		if (<player_num> > -1)
			return true player_num = <player_num>
		else
			return \{false}
		endif
	else
		return \{false}
	endif
endscript

script band_lobby_get_gamertag_by_party_id 
	requireparams \{[
			party_id
		]
		all}
	printf \{channel = band_lobby
		qs(0x1e1d8649)}
	gamertag = qs(0x00000000)
	netsessionfunc \{obj = party
		func = get_party_members}
	getarraysize \{connections}
	if (<array_size> > 0)
		i = 0
		begin
		if ((<connections> [<i>].party_id) = <party_id>)
			gamertag = (<connections> [<i>].gamertag)
			break
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	return gamertag = <gamertag>
endscript

script bl_does_have_remote_party_connections 
	printf \{channel = band_lobby
		qs(0xacb8c7d9)}
	<ret> = false
	netsessionfunc \{obj = party
		func = get_party_members}
	getarraysize \{connections
		param = num_connections}
	if (0 < <num_connections>)
		i = 0
		begin
		if ((<connections> [<i>].is_local) = 0)
			<ret> = true
			break
		endif
		i = (<i> + 1)
		repeat <num_connections>
	endif
	return <ret>
endscript

script band_lobby_party_host_started_matchmaking 
	requireparams \{[
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
	band_lobby_prepare_for_matchmaking player = ($g_leader_player_num) private = <private>
endscript

script bl_is_managing 
	printf \{channel = band_lobby
		qs(0x8c4c279a)}
	is_managing = 0
	i = 0
	begin
	band_lobby_get_submenu_data submenu_index = <i> param = is_managed
	if (<is_managed> = 1)
		is_managing = 1
		break
	endif
	i = (<i> + 1)
	repeat ($g_num_lobby_local_submenus)
	if (<is_managing> = 1)
		return true managed_submenu_index = <i>
	else
		return \{false}
	endif
endscript

script band_lobby_get_focus_value 
	requireparams \{[
			player
			focus_param
			submenu_index
		]
		all}
	printf \{channel = band_lobby
		qs(0xd954915c)}
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%d' d = <submenu_index>
	switch <focus_param>
		case difficulty
		getplayerinfo <player> difficulty out = focus_value
		if (<focus_value> = expert)
			getplayerinfo <player> part
			if (<part> = drum)
				getplayerinfo <player> double_kick_drum
				if (<double_kick_drum> = 1)
					focus_value = expert_plus
				endif
			endif
		endif
		case part
		getplayerinfo <player> part out = focus_value
		case lefty_flip
		getplayerinfo <player> lefty_flip
		if (<lefty_flip> = 1)
			<focus_value> = lefty
		else
			<focus_value> = standard
		endif
		case vocals_highway_view
		getplayerinfo <player> vocals_highway_view out = focus_value
		if (<focus_value> = none)
			focus_value = scrolling
		endif
		case mic_preference
		getplayerinfo <player> mic_preference out = focus_value
		if (<focus_value> = none)
			<focus_value> = mic
		endif
		case character_id
		getplayerinfo <player> character_id out = focus_value
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
		scriptassert \{qs(0x98947583)}
	endswitch
	return focus_value = <focus_value>
endscript

script band_lobby_get_player_submenu_index 
	requireparams \{[
			player_num
		]
		all}
	printf \{channel = band_lobby
		qs(0xa5e41d34)}
	i = 0
	begin
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%d' d = <i>
	if (($<submenu_data>.player) = <player_num>)
		if gotparam \{occupied}
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
	requireparams \{[
			submenu_data_index
		]
		all}
	printf qs(0x2b14e3e1) c = <submenu_data_index>
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%d' d = <submenu_data_index>
	updatestructelement struct = <submenu_data> element = player value = (<submenu_data_index> + 1)
	updatestructelement struct = <newstruct> element = occupied value = 0
	if (<submenu_data_index> < ($g_num_lobby_local_submenus))
		updatestructelement struct = <newstruct> element = is_updating value = 0
		updatestructelement struct = <newstruct> element = menu value = empty
		updatestructelement struct = <newstruct> element = return_menu value = empty
		updatestructelement struct = <newstruct> element = menu_indices value = [0 0 0]
		updatestructelement struct = <newstruct> element = net_id value = [0 0]
		updatestructelement struct = <newstruct> element = is_managed value = 0
		updatestructelement struct = <newstruct> element = focus_type value = focus
		if isps3
			change globalname = ($<submenu_data>.gamertag_checksum) newvalue = qs(0x00000000)
		endif
		if gotparam \{all_data}
			updatestructelement struct = <newstruct> element = desc_id value = null
		endif
	endif
	switch <submenu_data>
		case band_lobby_submenu_data_0
		change band_lobby_submenu_data_0 = <newstruct>
		case band_lobby_submenu_data_1
		change band_lobby_submenu_data_1 = <newstruct>
		case band_lobby_submenu_data_2
		change band_lobby_submenu_data_2 = <newstruct>
		case band_lobby_submenu_data_3
		change band_lobby_submenu_data_3 = <newstruct>
		case band_lobby_submenu_data_4
		change band_lobby_submenu_data_4 = <newstruct>
		case band_lobby_submenu_data_5
		change band_lobby_submenu_data_5 = <newstruct>
		case band_lobby_submenu_data_6
		change band_lobby_submenu_data_6 = <newstruct>
		case band_lobby_submenu_data_7
		change band_lobby_submenu_data_7 = <newstruct>
	endswitch
endscript

script band_lobby_clear_all_submenu_data 
	printf \{channel = band_lobby
		qs(0x0b656e58)}
	i = 0
	begin
	band_lobby_clear_submenu_data submenu_data_index = <i> all_data
	i = (<i> + 1)
	repeat ($g_num_lobby_total_submenus)
endscript

script band_lobby_update_submenu_data \{submenu_index = !i1768515945
		element = !q1768515945}
	requireparams \{[
			value
		]
		all}
	printf channel = band_lobby qs(0xf46594e4) s = <submenu_index> e = <element> v = <value>
	if (<element> = update_queue)
		printf \{channel = band_lobby
			qs(0x0feaa9b6)}
		printstruct channel = band_lobby <value>
	endif
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%d' d = <submenu_index>
	if (3 < <submenu_index>)
		if ((<element> = player) || (<element> = occupied))
			updatestructelement struct = <submenu_data> element = <element> value = <value>
			update = 1
		endif
	else
		updatestructelement struct = <submenu_data> element = <element> value = <value>
		update = 1
	endif
	if gotparam \{update}
		switch <submenu_data>
			case band_lobby_submenu_data_0
			change band_lobby_submenu_data_0 = <newstruct>
			case band_lobby_submenu_data_1
			change band_lobby_submenu_data_1 = <newstruct>
			case band_lobby_submenu_data_2
			change band_lobby_submenu_data_2 = <newstruct>
			case band_lobby_submenu_data_3
			change band_lobby_submenu_data_3 = <newstruct>
			case band_lobby_submenu_data_4
			change band_lobby_submenu_data_4 = <newstruct>
			case band_lobby_submenu_data_5
			change band_lobby_submenu_data_5 = <newstruct>
			case band_lobby_submenu_data_6
			change band_lobby_submenu_data_6 = <newstruct>
			case band_lobby_submenu_data_7
			change band_lobby_submenu_data_7 = <newstruct>
		endswitch
	endif
endscript

script band_lobby_get_submenu_data \{submenu_index = !i1768515945
		param = !q1768515945
		out = nullchecksum}
	data = {}
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%d' d = <submenu_index>
	if structurecontains structure = ($<submenu_data>) <param>
		if (nullchecksum != <out>)
			addparam structure_name = data name = <out> value = ($<submenu_data>.<param>)
		else
			addparam structure_name = data name = <param> value = ($<submenu_data>.<param>)
		endif
		return <data>
	endif
	printstruct <...>
	scriptassert \{qs(0xc23eb605)}
endscript

script band_lobby_find_available_submenu_data 
	printf \{channel = band_lobby
		qs(0x24c8991d)}
	<index> = 0
	begin
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%d' d = <index>
	if (0 = ($<submenu_data>.occupied) && attempt_join != ($<submenu_data>.menu))
		return submenu_data_index = <index>
	endif
	<index> = (<index> + 1)
	repeat ($g_num_lobby_total_submenus)
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		dumpplayerinfo <player>
		getnextplayer player = <player>
		repeat <num_players>
	endif
	debug_bl_dump_submenu_data_all
	return \{submenu_data_index = -1}
endscript

script find_available_playerinfo 
	requireparams \{[
			player_type
		]}
	printf \{qs(0xd0c86e55)}
	getmaxplayers
	if (<player_type> = local)
		i = 1
		begin
		if playerinfoequals <i> in_game = 0
			printf qs(0xa5166463) d = <i>
			return playerinfo = <i>
		endif
		i = (<i> + 1)
		repeat <max_players>
	elseif (<player_type> = party_remote)
		i = <max_players>
		begin
		if playerinfoequals <i> in_game = 0
			printf qs(0x1189ab87) d = <i>
			return playerinfo = <i>
		endif
		i = (<i> - 1)
		repeat <max_players>
	elseif (<player_type> = party_local)
		if playerinfoequals (<controller_index> + 1) in_game = 0
			printf qs(0xaa48c505) d = (<controller_index> + 1)
			return playerinfo = (<controller_index> + 1)
		endif
	endif
	printf \{qs(0x2a12ec90)}
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
	if gotparam \{force_remote}
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
	if netsessionfunc \{obj = match
			func = cancel_join_server}
		if (<start_matchmaking> = 0)
			band_lobby_return_from_matchmaking container = <container>
		endif
		if scriptisrunning \{bl_private_match_ui_timeout}
			killspawnedscript \{name = bl_private_match_ui_timeout}
		endif
		change \{g_career_search = null}
		return \{true}
	else
		return \{false}
	endif
endscript

script band_lobby_return_from_matchmaking 
	printf \{channel = band_lobby
		qs(0x1fff1b3c)}
	change \{respond_to_signin_changed = 0}
	netsessionfunc \{obj = party
		func = set_party_joinable
		params = {
			joinable = 1
		}}
	band_lobby_restore_prematchmaking_settings \{cancel_matchmaking}
	band_lobby_poll_party_object
	gamemode_gettype
	if (<type> = career)
		if scriptisrunning \{band_lobby_matchmaking_update_loop}
			killspawnedscript \{name = band_lobby_matchmaking_update_loop}
		endif
		band_lobby_force_submenu_change_all \{menu = join
			focus = 1
			submenu_data_match = occupied
			match_value = 0}
		band_lobby_refresh_all_submenus_new \{focus = 1}
		change \{g_career_search = null}
	else
		band_lobby_destroy_popup_menu
	endif
	if (gman_goalisactive goal = quickplay)
		gman_quickremovegoal \{goal_name = quickplay}
	endif
	band_lobby_update_player_viewport_assignments
	band_lobby_update_button_helpers
	band_lobby_refresh_band_leader_characters \{no_refresh}
	persistent_band_refresh_changed_characters
endscript

script band_lobby_start_public_matchmaking \{server_list_mode = automatch
		private = 0}
	requireparams \{[
			player
		]
		all}
	printf channel = band_lobby qs(0xa547b7b9) c = <player>
	if ($g_leader_player_num > 0)
		bl_update_submenus_stored_gamertag
		change \{respond_to_signin_changed_all_players = 1}
		netsessionfunc \{obj = party
			func = set_party_joinable
			params = {
				joinable = 0
			}}
		netsessionfunc obj = party func = set_matchmaking_struct params = {game_mode = ($game_mode) competitive_rules = ($competitive_rules) private = <private>}
		band_lobby_set_all_non_ingame_players_as_remote
		getplayerinfo ($g_leader_player_num) controller
		set_network_preferences
		common_start_matchmaking_setup
		net_dummy_get_needed_search_params
		gamemode_gettype
		if checksumequals a = <type> b = career
			difficulty = expert
		elseif checksumequals a = <type> b = quickplay
			difficulty = expert
		endif
		netsessionfunc obj = match func = set_search_params params = <...>
		netsessionfunc obj = match func = set_server_list_mode params = {<server_list_mode>}
		if (<private> = 1)
			getnumplayersingame
			if screenelementexists \{id = band_lobby_desc_id}
				if scriptisrunning \{bl_private_match_ui_timeout}
					killspawnedscript \{bl_private_match_ui_timeout}
				endif
				band_lobby_desc_id :obj_spawnscript bl_private_match_ui_timeout params = {num_players = <num_players>}
			endif
			netsessionfunc \{obj = match
				func = set_server_list_mode
				params = {
					host_only
				}}
		endif
		netsessionfunc obj = match func = start_server_list params = {controller = <controller> private = <private> callback_complete = band_lobby_career_search_no_games_available}
	endif
endscript

script bl_private_match_ui_timeout 
	requireparams \{[
			num_players
		]
		all}
	printf \{channel = band_lobby
		qs(0xef42f4e2)}
	begin
	netsessionfunc \{obj = party
		func = get_party_members}
	getarraysize <connections>
	if (<array_size> < <num_players>)
		band_lobby_cancel_matchmaking
		break
	endif
	wait \{1
		second}
	repeat
endscript

script band_lobby_restart_quickmatch 
	printf \{qs(0x273fdb7b)}
	leaveserver
	getplayerinfo ($g_leader_player_num) controller
	netsessionfunc obj = match func = start_server_list params = {controller = <controller> private = <private> callback_complete = band_lobby_career_search_no_games_available}
endscript

script band_lobby_career_search_no_games_available 
	printf \{channel = band_lobby
		qs(0x4553dd99)}
	if screenelementexists \{id = band_lobby_desc_id}
		band_lobby_desc_id :obj_spawnscriptnow band_lobby_career_search_no_games_available_spawned params = {<...>}
	endif
endscript

script band_lobby_career_search_no_games_available_spawned 
	printf \{channel = band_lobby
		qs(0xb40f6163)}
	if screenelementexists \{id = dialog_box_container}
		printf \{qs(0x6e40243e)}
		return
	endif
	ui_event_get_top
	if gotparam \{is_popup}
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
	ui_event {
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
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	se_getparentid
	launchevent type = unfocus target = <parent_id>
	band_lobby_cancel_matchmaking
	band_lobby_get_player_submenu_index player_num = ($g_leader_player_num)
	band_lobby_add_menu_update_to_queue submenu_index = <submenu_index> focus = 1
	ui_sfx \{menustate = bandlobby
		uitype = back}
	generic_event_back
endscript

script band_lobby_career_search_no_games_search_again 
	printf \{channel = band_lobby
		qs(0x451da442)}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	se_getparentid
	launchevent type = unfocus target = <parent_id>
	netsessionfunc {
		obj = match
		func = start_server_list
		params = {
			controller = <device_num>
			callback_complete = band_lobby_career_search_no_games_available
		}
	}
	ui_sfx \{menustate = bandlobby
		uitype = back}
	generic_event_back
endscript

script band_lobby_live_profile_ingame 
	printf \{channel = band_lobby
		qs(0xd27b1c33)}
	getnumplayersingame \{local}
	if (<num_players> > 0)
		getfirstplayer \{local}
		begin
		getplayerinfo <player> controller
		if checkforsignin controller_index = <controller> network_platform_only dont_set_primary
			if isxenonorwindx
				if NOT netsessionfunc func = xenonisguest params = {controller_index = <controller>}
					if gotparam \{multiplayer_enabled}
						if netsessionfunc func = ismultiplayerallowed params = {controller_index = <device_num>}
							return \{true}
						endif
					else
						return \{true}
					endif
				endif
			else
				if gotparam \{multiplayer_enabled}
					if netsessionfunc func = ismultiplayerallowed params = {controller_index = <device_num>}
						return \{true}
					endif
				else
					return \{true}
				endif
			endif
		endif
		getnextplayer player = <player> local
		repeat <num_players>
	endif
	return \{false}
endscript

script band_lobby_store_local_players_net_and_party_ids_in_playerinfo 
	printf \{channel = band_lobby
		qs(0x1a7a58b9)}
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		if playerinfoequals <player> is_local_client = 1
			getplayerinfo <player> controller
			getplayerinfo <player> gamertag
			getnetid controller_index = <controller>
			setplayerinfo <player> net_id_first = <net_id_first>
			setplayerinfo <player> net_id_second = <net_id_second>
			array = []
			addarrayelement array = <array> element = <net_id_first>
			addarrayelement array = <array> element = <net_id_second>
			if NOT band_lobby_get_party_id_by_user_id user_id = <array> gamertag = ($<gamertag>)
				party_id = -1
			endif
			setplayerinfo <player> party_id = <party_id>
		endif
		getnextplayer player = <player>
		repeat <num_players>
	endif
	return \{true}
endscript

script bl_store_local_player_net_ids_in_submenu_data 
	printf \{channel = band_lobby
		qs(0xb03ed173)}
	submenu_index = 0
	begin
	band_lobby_get_submenu_data submenu_index = <submenu_index> param = occupied
	band_lobby_get_submenu_data submenu_index = <submenu_index> param = player
	if (<occupied> = 1)
		if playerinfoequals <player> is_local_client = 1
			array = []
			getplayerinfo <player> net_id_first
			getplayerinfo <player> net_id_second
			addarrayelement array = <array> element = <net_id_first>
			addarrayelement array = <array> element = <net_id_second>
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
			getplayerinfo <player> controller
			if NOT (checkforsignin controller_index = <controller> dont_set_primary)
				return \{false}
			endif
			getnextplayer player = <player> local
			repeat <num_players>
		endif
	else
		if NOT checkforsignin
			return \{false}
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
		if NOT ($g_leader_player_num = <player>)
			if playerinfoequals <player> is_local_client = 1
				getplayerinfo <player> controller
				band_lobby_get_is_guest device_num = <controller>
				if (<is_guest> = 0)
					change g_leader_player_num = <player>
					change g_net_leader_player_num = <player>
					band_lobby_update_primary_controller
					band_lobby_update_lobby_title
					i = 0
					begin
					formattext checksumname = submenu_data 'band_lobby_submenu_data_%d' d = <i>
					if ((($<submenu_data>.player) = <player>) && (($<submenu_data>.occupied) = 1))
						if (($<submenu_data>.menu) = band_member)
							band_lobby_update_submenu_data submenu_index = <i> element = menu_indices value = [0 0 0]
							($band_lobby_viewport_menus [<i>]) :obj_spawnscriptnow band_lobby_change_menu params = {action = back menu = main player = <player> submenu_index = <i>}
						endif
						return
					endif
					i = (<i> + 1)
					repeat ($g_num_lobby_local_submenus)
				endif
			endif
		endif
		getnextplayer player = <player>
		repeat <num_players>
	endif
	change \{g_leader_player_num = -1}
	change \{g_net_leader_player_num = -1}
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
	change g_copy_leader_player_num = ($g_leader_player_num)
	change g_copy_net_leader_player_num = ($g_net_leader_player_num)
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
	change g_leader_player_num = ($g_copy_leader_player_num)
	change g_net_leader_player_num = ($g_copy_net_leader_player_num)
	band_lobby_restore_playerinfo
	band_lobby_update_primary_controller
	band_lobby_restore_gamertags
	marketplacebgmonitorfunc \{func = set_background_download
		on}
	marketplacebgmonitorfunc \{func = start_scan}
	if NOT isps3
		marketplacepersistencefunc \{func = attempt_init}
	endif
	if NOT bl_does_have_remote_party_connections
		restore_local_leadership = 1
		band_lobby_store_local_players_net_and_party_ids_in_playerinfo
	endif
	<async_io_status> = ready
	if NOT gotparam \{cancel_matchmaking}
		<async_io_status> = busy
		getnumplayersingame \{local}
		if (<num_players> > 0)
			getfirstplayer \{local}
			begin
			setplayerinfo <player> async_io_status = busy
			getnextplayer player = <player> local
			repeat <num_players>
		endif
	endif
	getnumplayersingame \{remote}
	if (<num_players> > 0)
		getfirstplayer \{remote}
		begin
		if gotparam \{restore_local_leadership}
			if ($g_net_leader_player_num = <player>)
				change g_net_leader_player_num = ($g_leader_player_num)
			endif
		endif
		band_lobby_get_player_submenu_index player_num = <player> occupied
		if (<submenu_index> > -1)
			band_lobby_clear_submenu_data submenu_data_index = <submenu_index>
		endif
		net_clear_player_info player = <player> async_io_status = <async_io_status>
		getnextplayer player = <player> remote
		repeat <num_players>
	endif
	if NOT gotparam \{cancel_matchmaking}
		band_lobby_clear_all_submenu_data
		band_lobby_update_lobby_title
	endif
	if NOT netsessionfunc \{obj = party
			func = is_host}
		netsessionfunc \{obj = party
			func = request_full_sync}
	endif
	bl_toggle_player_menu_representation \{action = on}
endscript

script band_lobby_is_player_in_party \{player = !i1768515945}
	ret = false
	getplayerinfo <player> net_id_first
	getplayerinfo <player> net_id_second
	net_id = [0 , 0]
	setarrayelement arrayname = net_id index = 0 newvalue = <net_id_first>
	setarrayelement arrayname = net_id index = 1 newvalue = <net_id_second>
	if netsessionfunc obj = party func = is_party_member params = {user_id = <net_id>}
		ret = true
	endif
	return <ret>
endscript

script band_lobby_return_to_party_fix_state_sync_hack 
	printf \{qs(0x919012fe)}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	wait \{4
		seconds}
	if NOT netsessionfunc \{obj = party
			func = is_host}
		netsessionfunc \{obj = party
			func = request_full_sync}
	endif
endscript

script band_lobby_restore_gamertags 
	getmaxplayers
	if (<max_players> > 0)
		i = 0
		begin
		formattext checksumname = gamertag 'gamertag_%d' d = (<i>)
		if playerinfoequals (<i> + 1) in_game = 1
			if playerinfoequals (<i> + 1) is_local_client = 1
				getplayerinfo (<i> + 1) controller
				if netsessionfunc obj = match func = get_gamertag params = {controller = <controller>}
					change globalname = <gamertag> newvalue = <name>
				endif
			endif
		else
			change globalname = <gamertag> newvalue = qs(0x00000000)
		endif
		i = (<i> + 1)
		repeat <max_players>
	endif
endscript

script band_lobby_set_exclusive_devices_on_submenus 
	requireparams \{[
			controller
		]
		all}
	printf \{channel = band_lobby
		qs(0xe0af36b5)}
	i = 0
	begin
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%i' i = <i>
	($<submenu_data>.desc_id) :se_setprops exclusive_device = <controller>
	i = (<i> + 1)
	repeat ($g_num_lobby_local_submenus)
endscript

script band_lobby_request_player_card 
	requireparams \{[
			device_num
			net_id_first
			net_id_second
		]
		all}
	printf \{channel = band_lobby
		qs(0x22df035d)}
	if netsessionfunc func = canviewprofile controller_index = <device_num>
		array = []
		addarrayelement array = <array> element = <net_id_first>
		addarrayelement array = <array> element = <net_id_second>
		if checkforsignin controller_index = <device_num> dont_set_primary
			netsessionfunc func = showgamercard params = {player_xuid = <array> controller_index = <device_num>}
		endif
	endif
endscript

script set_game_rules_from_voting_result 
	requireparams \{[
			result
		]
		all}
	printf \{qs(0x7d7081f8)}
	change competitive_rules = (<result>.element)
endscript

script prepare_game_rules_voting 
	printf \{qs(0x8b723a72)}
	array = []
	getarraysize ($competitive_rules_array)
	if (<array_size> > 0)
		i = 0
		begin
		<add_element> = 1
		<competitive_rules> = (($competitive_rules_array) [<i>])
		if NOT teammodeequals \{team_mode = two_teams}
			if (($<competitive_rules>.team) = 1)
				<add_element> = 0
			endif
		else
			if (($<competitive_rules>.team) = 0)
				<add_element> = 0
			endif
		endif
		if checksumequals a = <competitive_rules> b = elimination
			getnumplayersingame
			if (<num_players> < ($<competitive_rules>.min_players))
				<add_element> = 0
			endif
		elseif checksumequals a = (($competitive_rules_array) [<i>]) b = solo_fest_mode
			<add_element> = 0
		elseif checksumequals a = (($competitive_rules_array) [<i>]) b = team_fest_mode
			<add_element> = 0
		elseif checksumequals a = (($competitive_rules_array) [<i>]) b = band_vs_band
			<add_element> = 0
		elseif checksumequals a = (($competitive_rules_array) [<i>]) b = momentum_plus
			<add_element> = 0
		endif
		if (<add_element> = 1)
			addarrayelement array = <array> element = ($competitive_rules_array [<i>])
		endif
		i = (<i> + 1)
		repeat <array_size>
		generate_voting_items items_array = <array>
		getrandomarrayelement <voting_items_array>
		addarrayelement array = <voting_items_array> element = <element>
		<voting_items_array> = <array>
		getarraysize <voting_items_array>
		if (<array_size> > 0)
			array = []
			i = 0
			begin
			addarrayelement array = <array> element = (<voting_items_array> [<i>])
			i = (<i> + 1)
			repeat <array_size>
		endif
	endif
	return game_rules_voting_array = <array>
endscript

script generate_voting_items 
	requireparams \{[
			items_array
		]
		all}
	printf \{qs(0x5922c3a5)}
	getarraysize <items_array>
	if (<array_size> >= 2)
		if (<array_size> = 2)
			return voting_items_array = <items_array>
		else
			array = []
			i = 0
			j = 0
			begin
			getrandomarrayelement <items_array>
			if NOT arraycontains array = <array> contains = <element>
				addarrayelement array = <array> element = <element>
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
		scriptassert \{qs(0xc58d0742)}
	endif
endscript

script cast_vote 
	requireparams \{[
			option
		]
		all}
	printf \{qs(0x20f736cb)}
	allowed = 1
	getarraysize ($g_controllers_that_voted)
	if (<array_size> > 0)
		i = 0
		begin
		if (<device_num> = (($g_controllers_that_voted) [<i>]))
			allowed = 0
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	if (<allowed> = 1)
		array = ($g_controllers_that_voted)
		addarrayelement array = <array> element = <device_num>
		change g_controllers_that_voted = <array>
		if ininternetmode
			sendstructure callback = cast_vote_callback data_to_send = {option = <option>}
			if ishost
				setarrayelement globalarray arrayname = g_vote_counts index = <option> newvalue = (($g_vote_counts [<option>]) + 1)
			endif
		else
			setarrayelement globalarray arrayname = g_vote_counts index = <option> newvalue = (($g_vote_counts [<option>]) + 1)
		endif
	else
		printf \{qs(0x4395d3e0)}
	endif
endscript

script cast_vote_callback 
	requireparams \{[
			option
		]
		all}
	printf \{qs(0xc4c44d96)}
	if scriptisrunning \{ui_voting_update}
		if ($g_received_final_vote_counts = 0)
			audio_ui_play_cast_vote_sfx option = <option>
			setarrayelement globalarray arrayname = g_vote_counts index = <option> newvalue = (($g_vote_counts [<option>]) + 1)
			if ishost
				sendstructure callback = cast_vote_callback data_to_send = {option = <option>}
			endif
		endif
	endif
endscript

script band_lobby_send_invite 
	requireparams \{[
			instrument
			net_id
			name
			controlling_player
		]}
	printf \{channel = band_lobby
		qs(0xc172e72b)}
	if NOT innetgame
		ui_sfx \{manustate = generic
			uitype = select}
		band_lobby_seamless_net_change {
			network = net_private
			player = <controlling_player>
			callback = invite_to_game
			callback_params = {
				instrument = <instrument>
				net_id = <net_id>
				name = <name>
				device_num = <device_num>
			}
		}
	endif
endscript

script band_lobby_seamless_net_change \{callback_params = {
		}}
	requireparams \{[
			player
			network
			callback
		]
		all}
	printf \{channel = band_lobby
		qs(0xf17ee82e)}
	band_lobby_change_network player = <player> network = local focus = 1
	<callback> <callback_params>
endscript

script band_lobby_prepare_for_matchmaking 
	requireparams \{[
			player
			private
		]
		all}
	printf \{channel = band_lobby
		qs(0x10c18b89)}
	change \{g_lobby_invite_flag = 0}
	change \{respond_to_signin_changed = 1}
	change \{respond_to_signin_changed_all_players = 1}
	gamemode_gettype
	if (<type> = competitive)
		session_stats_reset
	endif
	band_lobby_kill_party_object_polling
	band_lobby_add_party_member
	band_lobby_store_playerinfo
	band_lobby_display_matchmaking_progress_ui player = <player> private = <private>
endscript

script band_lobby_kick_remote_player_popup 
	requireparams \{[
			user_id
			controlling_player
		]
		all}
	printf \{channel = band_lobby
		qs(0xd26c63c8)}
	if ininternetmode
		band_lobby_change_focus_submenu_all \{focus_type = unfocus}
		ui_event_get_top
		if gotparam \{is_popup}
			printf \{qs(0x251ccb39)}
			event_type = menu_replace
		else
			event_type = menu_change
		endif
		options = [
			{
				func = band_lobby_kick_remote_player
				text = ($band_lobby_strings.button_kick_player)
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
	requireparams \{[
			user_id
		]
		all}
	if ininternetmode
		if netsessionfunc \{obj = party
				func = is_host}
			netsessionfunc obj = party func = kick_player params = {user_id = <user_id>}
		else
			sendstructure callback = band_lobby_kick_remote_player channel = party data_to_send = {user_id = <user_id>}
		endif
		if innetgame
			if ishost
				netsessionfunc func = kick_player params = {player_xuid = <user_id>}
			endif
		endif
		band_lobby_change_focus_submenu_all \{focus_type = focus}
		ui_sfx \{menustate = bandlobby
			uitype = back}
		generic_event_back
	endif
endscript

script band_lobby_kick_remote_player_cancel 
	band_lobby_change_focus_submenu_all \{focus_type = focus}
	ui_sfx \{menustate = bandlobby
		uitype = back}
	generic_event_back
endscript

script band_lobby_common_start_host_migration 
	if band_lobby_does_popup_exist
		band_lobby_destroy_popup_menu
	endif
	band_lobby_change_focus_submenu_all \{focus_type = unfocus}
	band_lobby_update_ticker \{msg_checksum = host_migration}
	change \{respond_to_signin_changed_all_players = 1}
endscript

script band_lobby_common_finish_host_migration 
	ui_band_lobby_anim_in
	band_lobby_update_ticker \{msg_checksum = current_state}
endscript

script band_lobby_change_band_leader_callback 
	printf \{qs(0x432a320d)}
	if band_lobby_get_player_num_by_party_id party_id = <party_id>
		change g_net_leader_player_num = <player_num>
	endif
endscript

script band_lobby_change_band_leader 
	printf \{channel = band_lobby
		qs(0xf05cfec6)}
	if gotparam \{player}
		old_leader = ($g_net_leader_player_num)
		if ininternetmode
			if playerinfoequals <player> is_local_client = 1
				change g_leader_player_num = <player>
				band_lobby_update_primary_controller
				if netsessionfunc \{obj = party
						func = is_host}
					change g_net_leader_player_num = <player>
				else
					getplayerinfo <player> party_id
					sendstructure {
						callback = band_lobby_change_band_leader_callback
						channel = party
						data_to_send = {
							party_id = <party_id>
						}
					}
				endif
			else
				if netsessionfunc \{obj = party
						func = is_host}
					change g_net_leader_player_num = <player>
				else
					getplayerinfo <player> party_id
					sendstructure {
						callback = band_lobby_change_band_leader_callback
						channel = party
						data_to_send = {
							party_id = <party_id>
						}
					}
				endif
			endif
		else
			change g_leader_player_num = <player>
			change g_net_leader_player_num = <player>
			band_lobby_update_primary_controller
			band_lobby_pick_default_venue player = <player>
			band_lobby_refresh_band_leader_characters
		endif
		if NOT gotparam \{from_join}
			if (1 = $g_shortcut_data.valid)
				band_lobby_get_player_submenu_index player_num = <player>
				bl_cancel_challenge submenu_index = <submenu_index> supress_button_helpers_update = 1
			endif
			players_list_refresh
			band_lobby_adjust_submenus_for_leader_change old_leader = <old_leader>
			band_lobby_refresh_all_submenus \{type = local}
			band_lobby_flash_ticker_msg \{msg_checksum = leader_changed
				time = 8}
			band_lobby_refresh_band_leader_characters \{no_refresh}
			persistent_band_refresh_changed_characters
		endif
	else
		printf \{qs(0x0d5858d2)}
	endif
	if gotparam \{play_sound}
		if (<play_sound> = 1)
			soundevent \{event = audio_ui_band_lobby_leader}
		endif
	endif
	band_lobby_update_lobby_title
	bl_update_submenus_stored_gamertag
endscript

script band_lobby_update_primary_controller 
	i = 0
	begin
	band_lobby_get_submenu_data submenu_index = <i> param = player
	if (<player> = $g_leader_player_num)
		if playerinfoequals <player> is_local_client = 1
			getplayerinfo <player> controller
			if (<controller> < 4)
				if ($primary_controller != <controller>)
					change_primary_controller {
						controller = <controller>
						modify_signin_change_flags = 0
					}
					return
				endif
			endif
		endif
	endif
	i = (<i> + 1)
	repeat ($g_num_lobby_local_submenus)
endscript

script band_lobby_adjust_submenus_for_leader_change 
	requireparams \{[
			old_leader
		]
		all}
	printf \{channel = band_lobby
		qs(0x71a605d8)}
	i = 0
	begin
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%d' d = <i>
	if ($g_net_leader_player_num = ($<submenu_data>.player))
		set_chosen_character_id player = ($<submenu_data>.player) id = none
		band_lobby_update_submenu_data submenu_index = <i> element = menu_indices value = [0 0 0]
		if ($g_lobby_state = career)
			band_lobby_update_submenu_data submenu_index = <i> element = menu value = band_leader_career
		elseif ($g_lobby_state = quickplay)
			band_lobby_update_submenu_data submenu_index = <i> element = menu value = band_leader_quickplay
		else
			band_lobby_update_submenu_data submenu_index = <i> element = menu value = band_leader_vs
		endif
	else
		if (($<submenu_data>.player) = <old_leader>)
			set_chosen_character_id player = ($<submenu_data>.player) id = none
			band_lobby_update_submenu_data submenu_index = <i> element = menu_indices value = [0 0 0]
			band_lobby_update_submenu_data submenu_index = <i> element = menu value = band_member
		endif
	endif
	i = (<i> + 1)
	repeat ($g_num_lobby_local_submenus)
endscript

script band_lobby_grant_leadership 
	requireparams \{[
			player
		]
		all}
	printf \{channel = band_lobby
		qs(0x1174822a)}
	band_lobby_change_band_leader player = <player> play_sound = 1
endscript

script band_lobby_setup_strings 
	printf \{channel = band_lobby
		qs(0xdb79afa2)}
	additional_strings = {}
	if isxenonorwindx
		additional_strings = ($band_lobby_xenon_strings)
	elseif isps3
		additional_strings = ($band_lobby_ps3_strings)
	endif
	change band_lobby_strings = {($band_lobby_common_strings) <additional_strings>}
endscript

script band_lobby_add_local_players_to_submenus 
	printf \{channel = band_lobby
		qs(0x0c3e5146)}
	array = [-1 -1 -1 -1]
	getmaxplayers
	<player_index> = 0
	begin
	if playerinfoequals (<player_index> + 1) in_game = 1
		if playerinfoequals (<player_index> + 1) is_local_client = 1
			getplayerinfo (<player_index> + 1) controller
			if (<controller> >= 0 && <controller> <= 3)
				setarrayelement arrayname = array index = <controller> newvalue = <player_index>
			endif
		endif
	endif
	<player_index> = (<player_index> + 1)
	repeat <max_players>
	controller_to_player_array = <array>
	<submenu_index> = 0
	begin
	if ((<controller_to_player_array> [<submenu_index>]) >= 0)
		array = [0 0]
		if checkforsignin controller_index = <submenu_index> dont_set_primary
			getnetid controller_index = <submenu_index>
			setarrayelement arrayname = array index = 0 newvalue = <net_id_first>
			setarrayelement arrayname = array index = 1 newvalue = <net_id_second>
			if isps3
				getplayerinfo ((<controller_to_player_array> [<submenu_index>]) + 1) gamertag
				band_lobby_get_submenu_data submenu_index = <submenu_index> param = gamertag_checksum
				change globalname = <gamertag_checksum> newvalue = ($<gamertag>)
			endif
		endif
		band_lobby_update_submenu_data submenu_index = <submenu_index> element = player value = ((<controller_to_player_array> [<submenu_index>]) + 1)
		band_lobby_update_submenu_data submenu_index = <submenu_index> element = occupied value = 1
		band_lobby_update_submenu_data submenu_index = <submenu_index> element = net_id value = <array>
	else
		band_lobby_update_submenu_data submenu_index = <submenu_index> element = occupied value = 0
	endif
	band_lobby_update_submenu_data submenu_index = <submenu_index> element = menu value = empty
	band_lobby_update_submenu_data submenu_index = <submenu_index> element = is_updating value = 0
	<submenu_index> = (<submenu_index> + 1)
	repeat ($g_num_lobby_local_submenus)
endscript

script band_lobby_add_remote_players_to_submenus 
	printf \{channel = band_lobby
		qs(0x43967c7f)}
	getnumplayersingame \{remote}
	if (<num_players> > 0)
		getfirstplayer \{remote}
		begin
		<submen_index> = 0
		begin
		band_lobby_get_submenu_data submenu_index = <submen_index> param = occupied
		if (<occupied> = 0)
			array = []
			getplayerinfo <player> net_id_first
			getplayerinfo <player> net_id_second
			addarrayelement array = <array> element = <net_id_first>
			addarrayelement array = <array> element = <net_id_second>
			band_lobby_update_submenu_data submenu_index = <submen_index> element = player value = <player>
			band_lobby_update_submenu_data submenu_index = <submen_index> element = occupied value = 1
			band_lobby_update_submenu_data submenu_index = <submen_index> element = net_id value = <array>
			if isps3
				getplayerinfo <player> gamertag
				band_lobby_get_submenu_data submenu_index = <submen_index> param = gamertag_checksum
				change globalname = <gamertag_checksum> newvalue = ($<gamertag>)
			endif
			if ($g_num_lobby_local_submenus > <submen_index>)
				setplayerinfo <player> controller = <submen_index>
			endif
			break
		endif
		<submen_index> = (<submen_index> + 1)
		repeat ($g_num_lobby_total_submenus)
		getnextplayer player = <player> remote
		repeat <num_players>
	endif
endscript

script band_lobby_return_from_game_rules 
	printf \{channel = band_lobby
		qs(0x7b13ff8e)}
	band_lobby_set_party_joinable \{joinable = 1}
	band_lobby_destroy_popup_menu <...>
endscript

script bl_is_in_band_lobby_menus 
	printf \{channel = band_lobby
		qs(0x3e02d7b9)}
	<in_bl> = false
	ui_event_get_stack
	if ((<stack> [0].base_name) = 'band_lobby')
		<in_bl> = true
	else
		if (<stack_size> > 1)
			if ((<stack> [1].base_name) = 'band_lobby')
				ui_event_get_top
				if gotparam \{is_popup}
					<in_bl> = true
				endif
			endif
		endif
	endif
	return <in_bl>
endscript

script temp_clear_upper_player_infos 
	printf \{qs(0xc0a0339a)}
	getnumplayersingame
	getmaxplayers
	player_num = (<num_players> + 1)
	if ((<max_players> - <num_players>) > 0)
		begin
		net_clear_player_info player = <player_num> on_screen = 0 is_local_client = 0
		player_num = (<player_num> + 1)
		repeat (<max_players> - <num_players>)
	endif
endscript

script band_lobby_can_manage_band_members 
	printf \{channel = band_lobby
		qs(0x6df1e7d7)}
	<ret> = true
	if innetgame
		<ret> = false
	endif
	if ($g_career_search != null)
		<ret> = false
	endif
	if band_lobby_is_career_state
		if band_lobby_is_single_player
			<ret> = false
		endif
	endif
	return <ret>
endscript

script band_lobby_can_change_game_mode 
	<ret> = true
	if innetgame
		<ret> = false
	endif
	if ($g_career_search != null)
		<ret> = false
	endif
	return <ret>
endscript

script band_lobby_are_all_players_signed_in 
	printf \{channel = band_lobby
		qs(0xa1ff01a5)}
	ret = true
	getnumplayersingame \{local}
	if (<num_players> > 0)
		getfirstplayer \{local}
		begin
		getplayerinfo <player> controller
		if NOT checkforsignin local controller_index = <controller> dont_set_primary
			ret = false
			break
		endif
		getnextplayer player = <player> local
		repeat <num_players>
	endif
	if (<ret> = true)
		return \{true}
	else
		return \{false}
	endif
endscript

script band_lobby_get_player_user_id 
	requireparams \{[
			player
		]
		all}
	array = []
	getplayerinfo <player> net_id_first
	getplayerinfo <player> net_id_second
	addarrayelement array = <array> element = <net_id_first>
	addarrayelement array = <array> element = <net_id_second>
	return user_id = <array>
endscript

script band_lobby_can_toggle_guitar_bass 
	printf \{channel = band_lobby
		qs(0x6f9a82ba)}
	getnumplayersingame \{local}
	if (<num_players> > 0)
		getfirstplayer \{local}
		begin
		if playerinfoequals <player> part = guitar
			return \{true}
		endif
		if playerinfoequals <player> part = bass
			return \{true}
		endif
		getnextplayer player = <player> local
		repeat <num_players>
	endif
	return \{false}
endscript

script band_lobby_satisfy_min_players \{game_rule = faceoff}
	requireparams \{[
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
			return \{false}
		endif
	else
		return \{false}
	endif
endscript

script bl_is_shortcut_data_valid 
	if (1 = $g_shortcut_data.valid)
		return \{true}
	else
		return \{false}
	endif
endscript

script bl_is_shortcut_data_invalid 
	if bl_is_shortcut_data_valid
		return \{false}
	else
		return \{true}
	endif
endscript

script bl_should_display_challenge_shortcut 
	if bl_is_shortcut_data_valid
		if (quickplay = $g_lobby_state)
			return \{true}
		endif
	endif
	return \{false}
endscript

script band_lobby_is_matching_instruments 
	printf \{channel = band_lobby
		qs(0x0f451bf4)}
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		getplayerinfo <player> part
		begin
		if NOT playerinfoequals <player> part = <part>
			return \{false}
		endif
		getnextplayer player = <player>
		repeat <num_players>
		return \{true}
	else
		return \{false}
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
		if playerinfoequals <player> part = guitar
			num_guitars = (<num_guitars> + 1)
		elseif playerinfoequals <player> part = bass
			num_bass = (<num_bass> + 1)
		elseif playerinfoequals <player> part = drum
			num_drums = (<num_drums> + 1)
		elseif playerinfoequals <player> part = vocals
			num_mics = (<num_mics> + 1)
		endif
		getnextplayer player = <player>
		repeat <num_players>
		mod a = <num_guitars> b = 2
		guitar_result = <mod>
		mod a = <num_bass> b = 2
		bass_result = <mod>
		mod a = <num_drums> b = 2
		drums_result = <mod>
		mod a = <num_mics> b = 2
		mic_result = <mod>
		if ((<guitar_result> = 0) && (<bass_result> = 0) && (<drums_result> = 0) && (<mic_result> = 0))
			return \{true}
		else
			return \{false}
		endif
	else
		return \{false}
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
		if playerinfoequals <player> part = guitar
			num_guitarists = (<num_guitarists> + 1)
		elseif playerinfoequals <player> part = bass
			num_guitarists = (<num_guitarists> + 1)
		elseif playerinfoequals <player> part = drum
			num_drummers = (<num_drummers> + 1)
		elseif playerinfoequals <player> part = vocals
			num_vocalists = (<num_vocalists> + 1)
		endif
		getnextplayer player = <player>
		repeat <num_players>
		if (
				(<num_guitarists> > <max_guitarists>) ||
				(<num_drummers> > <max_drummers>) ||
				(<num_vocalists> > <max_vocalists>)
			)
			return \{false}
		else
			return \{true}
		endif
	else
		return \{false}
	endif
endscript

script band_lobby_islocallobby 
	printf \{channel = band_lobby
		qs(0xb02c69d6)}
	if ($g_lobby_net_state = local)
		return \{true}
	else
		return \{false}
	endif
endscript

script band_lobby_isnetlobby_and_signin 
	requireparams \{[
			player
			submenu_index
		]
		all}
	printf \{channel = band_lobby
		qs(0x2734bd57)}
	if NOT ($g_lobby_net_state = local)
		getplayerinfo <player> controller
		if checkforsignin controller_index = <controller> dont_set_primary
			return \{true}
		else
			return \{false}
		endif
	else
		return \{false}
	endif
endscript

script band_lobby_isnetlobby_and_not_signin 
	requireparams \{[
			player
			submenu_index
		]
		all}
	printf \{channel = band_lobby
		qs(0x2dc029bb)}
	if NOT ($g_lobby_net_state = local)
		getplayerinfo <player> controller
		if checkforsignin controller_index = <controller> dont_set_primary
			return \{false}
		else
			return \{true}
		endif
	else
		return \{false}
	endif
endscript

script band_lobby_isguitarcontroller 
	printf \{channel = band_lobby
		qs(0x24fc26c7)}
	requireparams \{[
			player
			submenu_index
		]
		all}
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%i' i = <submenu_index>
	getplayerinfo ($<submenu_data>.player) controller
	if ($allow_controller_for_all_instruments = 1)
		return \{true}
	elseif isguitarcontroller controller = <controller>
		return \{true}
	else
		return \{false}
	endif
endscript

script band_lobby_isdrumcontroller 
	printf \{channel = band_lobby
		qs(0xfce5cf51)}
	requireparams \{[
			player
			submenu_index
		]
		all}
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%i' i = <submenu_index>
	getplayerinfo ($<submenu_data>.player) controller
	if isdrumcontroller controller = <controller>
		return \{true}
	else
		return \{false}
	endif
endscript

script band_lobby_isvocalscontroller 
	printf \{channel = band_lobby
		qs(0xf0c599d4)}
	requireparams \{[
			player
			submenu_index
		]
		all}
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%i' i = <submenu_index>
	getplayerinfo ($<submenu_data>.player) controller
	if NOT band_lobby_check_is_guitar_or_drum_controller player = <player> submenu_index = <submenu_index>
		return \{true}
	else
		return \{false}
	endif
endscript

script band_lobby_check_is_guitar_or_drum_controller 
	printf \{channel = band_lobby
		qs(0x7b5dc77c)}
	requireparams \{[
			player
			submenu_index
		]
		all}
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%i' i = <submenu_index>
	getplayerinfo ($<submenu_data>.player) controller
	if ($allow_controller_for_all_instruments = 1)
		return \{true}
	elseif isguitarcontroller controller = <controller>
		return \{true}
	elseif isdrumcontroller controller = <controller>
		return \{true}
	else
		return \{false}
	endif
endscript

script band_lobby_check_is_drummer 
	printf \{channel = band_lobby
		qs(0xe610e314)}
	requireparams \{[
			player
			submenu_index
		]
		all}
	getplayerinfo <player> part
	if (<part> = drum)
		if any_song_has_double_kick
			return \{true}
		else
			return \{false}
		endif
	endif
	return \{false}
endscript

script band_lobby_check_is_guitarist_or_drummer 
	printf \{channel = band_lobby
		qs(0xfffc644b)}
	requireparams \{[
			player
			submenu_index
		]
		all}
	getplayerinfo <player> part
	if (<part> = drum || <part> = guitar || <part> = bass)
		return \{true}
	endif
	return \{false}
endscript

script band_lobby_isbandleader 
	printf \{channel = band_lobby
		qs(0x5e1f3eb1)}
	requireparams \{[
			player
			submenu_index
		]
		all}
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%i' i = <submenu_index>
	if (($<submenu_data>.player) = ($g_net_leader_player_num))
		return \{true}
	else
		return \{false}
	endif
endscript

script band_lobby_is_career_available 
	printf \{channel = band_lobby
		qs(0xd7f0ccc6)}
	requireparams \{[
			player
			submenu_index
		]
		all}
	if demobuild
		return \{false}
	endif
	return \{true}
	if NOT band_lobby_are_remote_players_in_game
		band_lobby_get_submenu_data submenu_index = <submenu_index> param = player
		getplayerinfo <player> controller
		if NOT has_completed_forced_career_flow device_num = <controller>
			return \{false}
		endif
	endif
	return \{true}
endscript

script band_lobby_isoccupied 
	printf \{channel = band_lobby
		qs(0xe061c6df)}
	requireparams \{[
			player
			submenu_index
		]
		all}
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%i' i = <submenu_index>
	if (($<submenu_data>.occupied) = 1)
		return \{true}
	else
		return \{false}
	endif
endscript

script band_lobby_check_is_occupied_guitarist 
	printf \{channel = band_lobby
		qs(0xe061c6df)}
	requireparams \{[
			player
			submenu_index
		]
		all}
	if band_lobby_isoccupied <...>
		if band_lobby_check_show_instrument_option <...>
			return \{true}
		endif
	endif
	return \{false}
endscript

script band_lobby_should_force_highway_view 
	requireparams \{[
			player
		]}
	if playerinfoequals <player> part = vocals
		return \{true}
	endif
	return \{false}
endscript

script band_lobby_sync_highway_view 
	requireparams \{[
			player
		]}
	this_player = <player>
	getnumplayersingame \{local}
	if (<num_players> > 0)
		getfirstplayer \{local}
		begin
		if playerinfoequals <player> part = vocals
			if NOT (<this_player> = <player>)
				getplayerinfo <player> vocals_highway_view
				setplayerinfo <this_player> vocals_highway_view = <vocals_highway_view>
				return
			endif
		endif
		getnextplayer local player = <player>
		repeat <num_players>
	endif
endscript

script band_lobby_set_vocals_highway_view 
	requireparams \{[
			player
			vocals_highway_view
		]
		all}
	getnumplayersingame \{local}
	if (<num_players> > 0)
		getfirstplayer \{local}
		begin
		if playerinfoequals <player> part = vocals
			setplayerinfo <player> vocals_highway_view = <vocals_highway_view> store
		endif
		getnextplayer local player = <player>
		repeat <num_players>
	endif
endscript

script band_lobby_is_primary_vocalist_ 
	printf \{channel = band_lobby
		qs(0x69f4f57d)}
	requireparams \{[
			player
			submenu_index
		]
		all}
	if NOT band_lobby_isvocals player = <player> submenu_index = <submenu_index>
		return \{false}
	endif
	this_player = <player>
	getnumplayersingame \{on_screen}
	if (<num_players> > 0)
		getfirstplayer
		begin
		if playerinfoequals <player> part = vocals
			if (<this_player> = <player>)
				return \{true}
			else
				return \{false}
			endif
		endif
		getnextplayer player = <player>
		repeat <num_players>
	endif
	return \{false}
endscript

script band_lobby_should_show_mic_preference 
	requireparams \{[
			player
		]}
	if isps3
		return \{false}
	else
		if playerinfoequals <player> part = vocals
			getplayerinfo <player> controller
			band_lobby_get_is_guest device_num = <controller>
			if (<is_guest> = 1)
				return \{false}
			endif
			if gotparam \{ignore_headset}
				return \{true}
			endif
			if controller_has_headset controller = <controller>
				return \{true}
			else
				return \{false}
			endif
		else
			return \{false}
		endif
	endif
endscript

script band_lobby_should_show_mic_preference_ignore_headset 
	requireparams \{[
			player
		]}
	if band_lobby_should_show_mic_preference ignore_headset player = <player>
		return \{true}
	else
		return \{false}
	endif
endscript

script band_lobby_isvocals 
	printf \{channel = band_lobby
		qs(0x06870d9d)}
	requireparams \{[
			player
			submenu_index
		]
		all}
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%i' i = <submenu_index>
	if playerinfoequals ($<submenu_data>.player) part = vocals
		return \{true}
	else
		return \{false}
	endif
endscript

script band_lobby_isnotlocal 
	printf \{channel = band_lobby
		qs(0x8d1dd4ef)}
	if ($g_lobby_net_state = local)
		return \{false}
	else
		return \{true}
	endif
endscript

script band_lobby_isnotprivate 
	printf \{channel = band_lobby
		qs(0x97bd600f)}
	if ($g_lobby_net_state = net_private)
		return \{false}
	else
		return \{true}
	endif
endscript

script band_lobby_isnotpublic 
	printf \{channel = band_lobby
		qs(0x181d1eed)}
	if ($g_lobby_net_state = net_public)
		return \{false}
	else
		return \{true}
	endif
endscript

script band_lobby_controller_enabled 
	printf \{channel = band_lobby
		qs(0x59830b32)}
	requireparams \{[
			player
			submenu_index
		]
		all}
	if ($allow_controller_for_all_instruments = 1)
		return \{true}
	else
		return \{false}
	endif
endscript

script band_lobby_is_quickplay_state 
	printf \{channel = band_lobby
		qs(0x1f1859d7)}
	if ($g_lobby_state = quickplay)
		return \{true}
	else
		return \{false}
	endif
endscript

script band_lobby_is_career_state 
	if ($g_lobby_state = career)
		return \{true}
	else
		return \{false}
	endif
endscript

script band_lobby_is_vs_state 
	printf \{channel = band_lobby
		qs(0xf195cb54)}
	if ($g_lobby_state = vs)
		return \{true}
	else
		return \{false}
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
			return \{false}
		endif
	else
		return \{false}
	endif
endscript

script band_lobby_is_private_vs_state 
	printf \{channel = band_lobby
		qs(0x34044f43)}
	if (band_lobby_is_vs_state)
		if (($g_lobby_net_state = net_private) || ($g_lobby_net_state = local))
			return \{true}
		else
			return \{false}
		endif
	else
		return \{false}
	endif
endscript

script band_lobby_is_local_vs_state 
	printf \{channel = band_lobby
		qs(0xb536f046)}
	if (band_lobby_is_vs_state)
		if ($g_lobby_net_state = local)
			return \{true}
		else
			return \{false}
		endif
	else
		return \{false}
	endif
endscript

script band_lobby_are_no_remote_players_in_game 
	printf \{channel = band_lobby
		qs(0x41ba538a)}
	if band_lobby_are_remote_players_in_game
		return \{false}
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
		return \{false}
	endif
endscript

script band_lobby_can_display_ready 
	<display_ready> = 1
	if ($g_career_search = quickmatch)
		display_ready = 0
	endif
	if innetgame
		if NOT ishost
			display_ready = 0
		endif
	endif
	if (<display_ready> = 1)
		return \{true}
	else
		return \{false}
	endif
endscript

script band_lobby_does_not_require_signin 
	printf \{channel = band_lobby
		qs(0x0a0e3d05)}
	if band_lobby_does_require_signin
		return \{false}
	else
		return \{true}
	endif
endscript

script band_lobby_does_require_signin 
	printf \{channel = band_lobby
		qs(0x6a5b38b5)}
	if band_lobby_are_remote_players_in_game
		return \{true}
	endif
	if ($g_lobby_invite_flag = 1)
		return \{true}
	endif
	return \{false}
endscript

script band_lobby_ischeatunlocked 
	printf \{channel = band_lobby
		qs(0xca03bf06)}
	requireparams \{[
			player
			submenu_index
			cheat_tag
		]
		all}
	gamemode_gettype
	if (<type> = freeplay)
		return \{false}
	endif
	getplayerinfo <player> controller
	if islocallysignedin controller = <controller>
		if isxenonorwindx
			if netsessionfunc func = xenonisguest params = {controller_index = <controller>}
				if NOT ($game_mode = freeplay)
					getplayerinfo ($g_leader_player_num) controller
					getsavegamefromcontroller controller = <controller>
				endif
			else
				getsavegamefromcontroller controller = <controller>
			endif
		else
			getsavegamefromcontroller controller = <controller>
		endif
	else
		if NOT ($game_mode = freeplay)
			getplayerinfo ($g_leader_player_num) controller
			getsavegamefromcontroller controller = <controller>
		endif
	endif
	getglobaltags user_options param = <cheat_tag> savegame = <savegame>
	if ((<...>.<cheat_tag>) = 1)
		return \{true}
	endif
	return \{false}
endscript

script bl_join_text 
	requireparams \{[
			player
			submenu_index
		]
		all}
	if isxenonorwindx
		if band_lobby_does_require_signin
			string_checksum = sign_in
		else
			string_checksum = join
		endif
	else
		string_checksum = join
	endif
	return text_params = {a = ($band_lobby_strings.<string_checksum>)}
endscript

script band_lobby_ready_text 
	requireparams \{[
			player
			submenu_index
		]
		all}
	string_checksum = play_career
	if ($g_career_search = host_only)
		string_checksum = finish_search
	endif
	return text_params = {a = ($band_lobby_strings.<string_checksum>)}
endscript

script band_lobby_instrumenttext 
	printf \{channel = band_lobby
		qs(0xaaec68ea)}
	requireparams \{[
			player
			submenu_index
		]
		all}
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%i' i = <submenu_index>
	getplayerinfo ($<submenu_data>.player) part
	return text_params = {a = ($band_lobby_strings.<part>)}
endscript

script band_lobby_difficultytext 
	printf \{channel = band_lobby
		qs(0xdb10145a)}
	requireparams \{[
			player
			submenu_index
		]
		all}
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%i' i = <submenu_index>
	getplayerinfo ($<submenu_data>.player) difficulty
	if (<difficulty> = expert)
		getplayerinfo ($<submenu_data>.player) part
		if (<part> = drum)
			getplayerinfo ($<submenu_data>.player) double_kick_drum
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
	requireparams \{[
			player
			submenu_index
		]
		all}
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%i' i = <submenu_index>
	getplayerinfo ($<submenu_data>.player) controller
	user_control_helper_get_buttonchar button = green controller = <submenu_index>
	formattext textname = text_param qs(0x4d4555da) s = <buttonchar>
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
	if structurecontains structure = $band_lobby_strings ($competitive_rules)
		return text_params = {a = ($band_lobby_strings.$competitive_rules)}
	endif
	if structurecontains structure = $band_lobby_strings ($game_mode)
		return text_params = {a = ($band_lobby_strings.$game_mode)}
	endif
	return \{text_params = {
			a = qs(0x54ddb253)
		}}
endscript

script band_lobby_rockertext 
	printf \{channel = band_lobby
		qs(0x2cb86307)}
	requireparams \{[
			player
			submenu_index
		]
		all}
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%i' i = <submenu_index>
	getplayerinfo ($<submenu_data>.player) character_id
	getplayerinfo ($<submenu_data>.player) character_savegame
	if gotparam \{character_savegame}
		if playerinfoequals ($<submenu_data>.player) is_local_client = 1
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
	requireparams \{[
			player
			submenu_index
		]
		all}
	venue = qs(0x00000000)
	if structurecontains structure = $levelzones ($g_band_lobby_current_level)
		if structurecontains structure = ($levelzones.$g_band_lobby_current_level) title
			<venue> = ($levelzones.($g_band_lobby_current_level).title)
		endif
	endif
	return text_params = {a = <venue>}
endscript

script band_lobby_cheatonofftext 
	printf \{channel = band_lobby
		qs(0x88ae0cf1)}
	requireparams \{[
			name
			player
			submenu_index
		]
		all}
	option_text = qs(0x7cddf289)
	i = 0
	getarraysize ($guitar_hero_cheats)
	begin
	if (($guitar_hero_cheats [<i>].name) = <name>)
		var = ($guitar_hero_cheats [<i>].var)
		break
	endif
	i = (<i> + 1)
	repeat <array_size>
	if NOT structurecontains structure = ($guitar_hero_cheats [<i>]) options
		return
	endif
	options = (($guitar_hero_cheats [<i>]).options)
	global = ((<options> [0]).globals)
	location = ((<global> [0]).location)
	variable = ((<global> [0]).set)
	if (<location> = playerinfo)
		getplayerinfo <player> <variable>
		if ((<...>.<variable>) != 0)
			option_text = qs(0x0e96422f)
		endif
	elseif (<location> = global)
		if ($<var> > 0)
			option_text = qs(0x0e96422f)
		endif
	endif
	return text_params = {a = <option_text>}
endscript

script band_lobby_cheattext 
	printf \{channel = band_lobby
		qs(0x16ea52b8)}
	requireparams \{[
			name
			player
			submenu_index
		]
		all}
	getplayerinfo <player> part
	i = 0
	getarraysize ($guitar_hero_cheats)
	begin
	if (($guitar_hero_cheats [<i>].name) = <name>)
		continue = 0
		if structurecontains structure = ($guitar_hero_cheats [<i>]) part
			if (<part> = ($guitar_hero_cheats [<i>].part))
				continue = 1
			endif
		else
			continue = 1
		endif
		if (<continue> = 1)
			if NOT structurecontains structure = ($guitar_hero_cheats [<i>]) options
				return
			endif
			options = (($guitar_hero_cheats [<i>]).options)
			global = ((<options> [0]).globals)
			location = ((<global> [0]).location)
			variable = ((<global> [0]).set)
			if (<location> = playerinfo)
				getplayerinfo <player> <variable>
				current_state = (<...>.<variable>)
				option_text = ((<options> [<current_state>]).text)
			elseif (<location> = global)
				index = ($<variable>)
				if (<index> < 0)
					index = 0
				endif
				option_text = ((<options> [<index>]).text)
			elseif (<location> = function)
				get_savegame_from_player player = <player>
				<variable> = ((<global> [0]).get)
				<variable> savegame = <savegame>
				<option_text> = (<options> [<soundcheck>].text)
			endif
		endif
	endif
	i = (<i> + 1)
	repeat <array_size>
	return text_params = {a = <option_text>}
endscript

script band_lobby_startilt_text 
	printf \{channel = band_lobby
		qs(0x726d2a55)}
	requireparams \{[
			player
			submenu_index
		]
		all}
	getplayerinfo <player> use_tilt_for_starpower
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
	requireparams \{[
			player
			submenu_index
		]
		all}
	getplayerinfo <player> enable_touch_strip
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

script band_lobby_vocal_star_power_tap_text 
	printf \{channel = band_lobby
		qs(0x5e8a095f)}
	requireparams \{[
			player
			submenu_index
		]
		all}
	getplayerinfo <player> vocal_star_power_tap
	if (<vocal_star_power_tap> = 1)
		return \{text_params = {
				a = qs(0xe6b22ea1)
			}}
	else
		return \{text_params = {
				a = qs(0x9dd9821b)
			}}
	endif
endscript

script band_lobby_vocals_mic_enhancement_text \{player = !i1768515945
		submenu_index = !i1768515945}
	printf \{channel = band_lobby
		qs(0xf0e2436c)}
	get_savegame_from_player player = <player>
	getglobaltags savegame = <savegame> user_options param = vocals_mic_enhancement_save
	<vocals_mic_enhancement> = <vocals_mic_enhancement_save>
	if (<vocals_mic_enhancement> = 1)
		return \{text_params = {
				a = qs(0xe6b22ea1)
			}}
	else
		return \{text_params = {
				a = qs(0x9dd9821b)
			}}
	endif
endscript

script band_lobby_whole_band_mark_first_time_career 
	if isxenon
		getnumplayersingame \{local}
		if (<num_players> > 0)
			getfirstplayer \{local}
			begin
			getplayerinfo <player> controller
			get_savegame_from_controller controller = <controller>
			if NOT has_completed_forced_career_flow device_num = <controller>
				if console_is_net_career_client
					temp_struct = ($g_net_career_progression.career_progression_tags + {career_first_time_setup = 1})
					appendstruct struct = g_net_career_progression field = career_progression_tags params = <temp_struct> globalstruct
				else
					setglobaltags savegame = <savegame> career_progression_tags params = {career_first_time_setup = 1} progression = true
					band_lobby_set_dirty_save_flag player = <player> flag = 1
				endif
			endif
			getnextplayer local player = <player>
			repeat <num_players>
		endif
	else
		getplayerinfo ($g_leader_player_num) controller
		get_savegame_from_controller controller = <controller>
		if NOT has_completed_forced_career_flow device_num = <controller>
			if console_is_net_career_client
				temp_struct = ($g_net_career_progression.career_progression_tags + {career_first_time_setup = 1})
				appendstruct struct = g_net_career_progression field = career_progression_tags params = <temp_struct> globalstruct
			else
				setglobaltags savegame = <savegame> career_progression_tags params = {career_first_time_setup = 1} progression = true
				band_lobby_set_dirty_save_flag player = ($g_leader_player_num) flag = 1
			endif
		endif
	endif
endscript

script band_lobby_whole_band_autosave 
	spawnscriptnow band_lobby_whole_band_autosave_spawned params = <...>
endscript

script band_lobby_whole_band_autosave_spawned 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	setscriptcannotpause
	requireparams \{[
			choose_script
			player
			submenu_index
		]
		all}
	original_player_var = <player>
	original_submenu_index = <submenu_index>
	is_saving = [0 0 0 0]
	is_saving_on_lobby_leave = 0
	if isxenon
		getnumplayersingame \{local}
		if (<num_players> > 0)
			getfirstplayer \{local}
			begin
			band_lobby_get_player_submenu_index player_num = <player>
			if (<submenu_index> > -1)
				if (<submenu_index> < ($g_num_lobby_local_submenus))
					if band_lobby_autosave choose_script = nullscript player = <player> submenu_index = <submenu_index>
						setarrayelement arrayname = is_saving index = <submenu_index> newvalue = 1
						is_saving_on_lobby_leave = 1
					endif
				endif
			endif
			getnextplayer local player = <player>
			repeat <num_players>
		endif
	else
		band_lobby_get_player_submenu_index \{player_num = $g_leader_player_num}
		if band_lobby_autosave choose_script = nullscript player = $g_leader_player_num submenu_index = <submenu_index>
			setarrayelement arrayname = is_saving index = <submenu_index> newvalue = 1
			is_saving_on_lobby_leave = 1
		endif
	endif
	printstruct <is_saving>
	clean_up_user_control_helpers
	temp_menus = [null null null null]
	if (<is_saving_on_lobby_leave> = 1)
		i = 0
		begin
		if ((<is_saving> [<i>]) = 0)
			formattext checksumname = submenu_data 'band_lobby_submenu_data_%d' d = <i>
			if playerinfoequals ($<submenu_data>.player) is_local_client = 1
				setarrayelement arrayname = temp_menus index = <i> newvalue = ($<submenu_data>.menu)
				band_lobby_change_menu submenu_index = <i> player = ($<submenu_data>.player) action = forward focus = 0 menu = empty no_forced
			endif
		endif
		i = (<i> + 1)
		repeat ($g_num_lobby_local_submenus)
	endif
	begin
	if NOT savegame_async_is_busy
		break
	endif
	printf \{'Waiting for lobby saving to complete'}
	wait \{1
		gameframe}
	repeat
	i = 0
	begin
	if NOT (<temp_menus> [<i>] = null)
		band_lobby_get_submenu_data submenu_index = <i> param = player
		band_lobby_change_menu submenu_index = <i> player = <player> action = back focus = 0 menu = (<temp_menus> [<i>]) no_forced
	endif
	i = (<i> + 1)
	repeat ($g_num_lobby_local_submenus)
	if ((($savegame_async_last_error) = none) || (<is_saving_on_lobby_leave> = 0))
		start_venue_effects
		<choose_script> <...> player = <original_player_var> submenu_index = <original_submenu_index> was_autosaving = 1
	endif
endscript

script band_lobby_needs_save 
	requireparams \{[
			player
		]
		all}
	getplayerinfo <player> controller
	if isxenon
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
	requireparams \{[
			flag
		]
		all}
	if gotparam \{player}
		getplayerinfo <player> controller
	else
		requireparams \{[
				savegame
			]
			all}
		controller = <savegame>
	endif
	printscriptinfo 'band_lobby_set_dirty_save_flag %c = %f' f = <flag> c = <controller>
	if isxenon
		setarrayelement arrayname = g_band_lobby_dirty_saves index = <controller> newvalue = <flag> globalarray
	else
		setarrayelement arrayname = g_band_lobby_dirty_saves index = 0 newvalue = <flag> globalarray
	endif
endscript

script band_lobby_career_mark_save_local_players 
	gamemode_gettype
	if (<type> = career)
		getnumplayersingame \{local}
		if (<num_players> > 0)
			getfirstplayer \{local}
			begin
			band_lobby_set_dirty_save_flag player = <player> flag = 1
			getnextplayer local player = <player>
			repeat <num_players>
		endif
	endif
endscript

script band_lobby_autosave \{force = 0}
	requireparams \{[
			choose_script
			player
			submenu_index
			force
		]
		all}
	getplayerinfo <player> controller
	if ((isps3) && (gotparam not_on_ps3))
		should_save = 0
	else
		should_save = <force>
		if (<should_save> = 0)
			if band_lobby_needs_save player = <player>
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
				band_lobby_change_menu menu = mc_saving action = forward player = <player> submenu_index = <submenu_index> no_forced focus = 0
				return \{true}
			endif
		endif
	endif
	<choose_script> <...>
	return \{false}
endscript

script net_career_goto_band_lobby 
	printf \{qs(0x02555b76)}
	end_singleplayer_game
	killspawnedscript \{name = audio_crowd_play_loading_screen_swell}
	killspawnedscript \{name = audio_crowd_loading_whistle}
	if gotparam \{from_encore}
		kill_gem_scroller
	endif
	ui_event_wait_for_safe
	getglobaltags \{user_options}
	if (<autosave> = 1)
		ui_memcard_autosave_all_players \{event = menu_back
			state = uistate_quest_map}
	else
		ui_event \{event = menu_back
			data = {
				state = uistate_quest_map
			}}
	endif
endscript

script lobby_mc_autosave_callback 
	printscriptinfo \{'lobby_mc_autosave_callback'}
	printstruct <...>
	if gotparam \{update_ui}
	else
		if (<success> = 1)
			band_lobby_set_dirty_save_flag savegame = <savegame> flag = 0
		else
			if gotparam \{error}
				lobby_mc_handle_error <...>
				return
			endif
			scriptassert \{'This should not happen when autosaving'}
		endif
		choose_script = (<data>.choose_script)
		<choose_script> <data>
	endif
endscript

script lobby_mc_loading_callback 
	printscriptinfo \{'lobby_mc_loading_callback'}
	printstruct <...>
	if gotparam \{update_ui}
		if gotparam \{saving}
			band_lobby_change_menu menu = mc_saving action = forward player = (<data>.player) submenu_index = (<data>.submenu_index) no_forced focus = 0
		elseif gotparam \{loading}
			band_lobby_change_menu menu = mc_loading action = forward player = (<data>.player) submenu_index = (<data>.submenu_index) no_forced focus = 0
		elseif gotparam \{scanning_dlc}
			band_lobby_change_menu menu = mc_dlc_scan action = forward player = (<data>.player) submenu_index = (<data>.submenu_index) no_forced focus = 0
		endif
	else
		if (<success> = 1)
			if ($g_leader_player_num >= 0)
				load_saved_extras_states_for_player player = (<data>.player) controller = (<data>.controller) leader = ($g_leader_player_num)
			endif
			if isxenon
				get_savegame_from_controller controller = (<data>.controller)
				get_progression_instrument_user_option controller = (<data>.controller) option = 'guitar_bass_flip'
				guitar_bass_flip = <user_option>
				getplayerinfo (<data>.player) part
				if ((<part> = guitar) || (<part> = bass))
					if (<guitar_bass_flip> != none)
						band_lobby_rocker_changed_player_part {
							player = (<data>.player)
							part = <guitar_bass_flip>
						}
						part = <guitar_bass_flip>
					endif
				endif
				get_progression_instrument_user_option part = <part> controller = (<data>.controller) option = 'difficulty'
				if (<user_option> != none)
					setplayerinfo (<data>.player) difficulty = <user_option>
				endif
				band_lobby_local_join_get_character_id {
					savegame = <savegame>
					playerinfo = (<data>.player)
				}
				setplayerinfo (<data>.player) character_id = <character_id>
				setplayerinfo (<data>.player) character_savegame = <character_savegame>
				setplayerinfo (<data>.player) stored_character_index = <stored_character_index>
				band_lobby_refresh_band_leader_characters \{no_refresh}
				persistent_band_refresh_changed_characters
			endif
		else
			if gotparam \{error}
				lobby_mc_handle_error <...>
				return
			endif
		endif
		if band_lobby_does_popup_exist
			band_lobby_change_menu menu = main action = forward player = (<data>.player) submenu_index = (<data>.submenu_index) focus = 0
		else
			band_lobby_add_menu_update_to_queue submenu_index = (<data>.submenu_index) focus = 1 menu_index = -1
		endif
	endif
endscript

script lobby_mc_handle_error 
	printscriptinfo \{'lobby_mc_handle_error'}
	printstruct <...>
	if abort_for_signout controller = (<data>.controller)
		return
	endif
	change \{leaving_lobby_for_mc_error = mc_error_step_1}
	ui_memcard_lobby_error error = <error> error_params = <error_params> controller = (<data>.controller) data = {
		state = uistate_band_lobby
		handled_lobby_mc_error = 1
		handled_lobby_mc_error_data = {
			submenu_index = (<data>.submenu_index)
			player = (<data>.player)
			controller = (<data>.controller)
			savegame = <savegame>
		}
	}
endscript

script band_lobby_pick_default_venue 
	requireparams \{[
			player
		]
		all}
	get_savegame_from_player player = <player>
	if is_venue_unlocked venue = ($current_level) savegame = <savegame>
		change g_band_lobby_current_level = ($current_level)
		return
	endif
	get_levelzonearray_size
	array_count = 0
	begin
	get_levelzonearray_checksum index = <array_count>
	if is_venue_unlocked venue = <level_checksum> savegame = <savegame>
		change g_band_lobby_current_level = <level_checksum>
		break
	endif
	<array_count> = (<array_count> + 1)
	repeat <array_size>
endscript

script band_lobby_controller_can_save 
	requireparams \{[
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
		return \{false}
	endif
	return \{true}
endscript

script bl_toggle_star_tilt \{in_band_lobby = 1}
	requireparams \{[
			player
		]
		all}
	options_change_tilt_star_power <...>
	obj_getid
	band_lobby_refresh_menu_text id = <objid>
endscript

script bl_toggle_touch_strip \{in_band_lobby = 1}
	requireparams \{[
			player
		]
		all}
	options_change_touch_strip_option <...>
	obj_getid
	band_lobby_refresh_menu_text id = <objid>
endscript

script bl_toggle_vocal_star_power_tap \{in_band_lobby = 1}
	requireparams \{[
			player
		]
		all}
	options_change_vocal_star_power_tap <...>
	obj_getid
	band_lobby_refresh_menu_text id = <objid>
endscript

script bl_toggle_vocals_mic_enhancement \{player = !i1768515945}
	get_savegame_from_player player = <player>
	options_change_vocals_mic_enhancement in_band_lobby player = <player> savegame = <savegame>
	obj_getid
	band_lobby_refresh_menu_text id = <objid>
endscript

script band_lobby_any_extras_unlocked 
	printf \{'band_lobby_num_extras_unlocked'}
	if demobuild
		return \{false}
	endif
	extras = ($band_lobby_submenu_states.extras.options)
	getarraysize <extras>
	if (<array_size> > 0)
		idx = 0
		begin
		if structurecontains structure = (<extras> [<idx>]) condition
			func = (<extras> [<idx>].condition)
			if structurecontains structure = (<extras> [<idx>]) condition_params
				params = (<extras> [<idx>].condition_params)
			endif
			if <func> player = <player> submenu_index = <submenu_index> <params>
				return \{true}
			endif
		else
			return \{true}
		endif
		idx = (<idx> + 1)
		repeat <array_size>
	endif
	return \{false}
endscript

script band_lobby_num_cheats_unlocked 
	printf \{'band_lobby_num_cheats_unlocked'}
	if demobuild
		return \{false}
	endif
	cheats = ($band_lobby_submenu_states.cheats.options)
	getarraysize <cheats>
	if (<array_size> > 0)
		idx = 0
		begin
		if structurecontains structure = (<cheats> [<idx>]) condition
			func = (<cheats> [<idx>].condition)
			if structurecontains structure = (<cheats> [<idx>]) condition_params
				params = (<cheats> [<idx>].condition_params)
			endif
			if <func> player = <player> submenu_index = <submenu_index> <params>
				return \{true}
			endif
		else
			return \{true}
		endif
		idx = (<idx> + 1)
		repeat <array_size>
	endif
	return \{false}
endscript

script band_lobby_get_watch_timer_parent 
	requireparams \{[
			cas_player_index
		]
		all}
	if NOT screenelementexists \{id = band_lobby_desc_id}
		return \{false}
	endif
	if NOT band_lobby_desc_id :desc_resolvealias \{name = alias_band_viewport_vmenu}
		return \{false}
	endif
	viewport_vmenu = <resolved_id>
	getarraysize \{$cas_queue_player_info}
	if (<cas_player_index> < 0)
		return \{false}
	endif
	if (<cas_player_index> >= <array_size>)
		return \{false}
	endif
	player_index = <cas_player_index>
	entry = ($cas_queue_player_info [<cas_player_index>])
	if structurecontains structure = <entry> player
		band_lobby_get_player_submenu_index player_num = (<entry>.player)
		if (-1 != <submenu_index>)
			player_index = <submenu_index>
		endif
	endif
	if NOT resolvescreenelementid id = [
			{id = <viewport_vmenu>}
			{index = <player_index>}
		]
		return \{false}
	endif
	if <resolved_id> :desc_resolvealias name = alias_viewport_loading_window param = viewport_window
		return true parent = <viewport_window>
	endif
	return \{false}
endscript

script band_lobby_is_anyone_in_forced_flow 
	i = 0
	begin
	band_lobby_get_submenu_data submenu_index = <i> param = menu
	switch (<menu>)
		case forced_difficulty
		case forced_instruments
		case forced_vocal_highway
		case forced_mic_preference
		case forced_lefty_flip
		return \{true}
	endswitch
	<i> = (<i> + 1)
	repeat ($g_num_lobby_local_submenus)
	return \{false}
endscript

script band_lobby_is_single_player 
	i = 0
	num_players = 0
	begin
	band_lobby_get_submenu_data submenu_index = <i> param = occupied
	if (<occupied> = 1)
		<num_players> = (<num_players> + 1)
	endif
	<i> = (<i> + 1)
	repeat ($g_num_lobby_local_submenus)
	if (<num_players> = 1)
		return \{true}
	else
		return \{false}
	endif
endscript

script band_lobby_update_part_to_match_controller 
	if ($allow_controller_for_all_instruments = 1)
		return
	endif
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%d' d = <submenu_index>
	player = ($<submenu_data>.player)
	getplayerinfo <player> controller
	getplayerinfo <player> part out = old_part
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
	if ($g_leader_player_num = <player>)
		local_primary_joining = 1
	endif
	if isps3
		if gotparam \{local_primary_joining}
			band_lobby_switch_characters_for_ps3_at_join player = <player> controller = <controller>
		endif
	endif
	band_lobby_handle_character_swap {
		player = <player>
		old_part = <old_part>
		new_part = <part>
		no_refresh
	}
	setplayerinfo <player> part = <part>
	band_lobby_local_join_get_character_id {
		savegame = <savegame>
		playerinfo = <player>
		local_primary_joining = <local_primary_joining>
		borrowed_from_band_leader = <borrowed_from_band_leader>
	}
	setplayerinfo <player> character_id = <character_id>
	setplayerinfo <player> character_savegame = <character_savegame>
	setplayerinfo <player> stored_character_index = <stored_character_index>
	band_lobby_refresh_band_leader_characters \{no_refresh}
	persistent_band_refresh_changed_characters
	band_lobby_change_menu {menu = main action = forward player = <player> submenu_index = <submenu_index> focus = 1}
endscript

script band_lobby_is_not_career 
	if band_lobby_is_career_state
		return \{false}
	else
		return \{true}
	endif
endscript

script bl_should_do_party_connection_lost_logic 
	printf \{channel = band_lobby
		qs(0x66ce6fde)}
	if innetgame
		if netsessionfunc \{obj = match
				func = is_matchmaking_active}
			return \{true}
		else
			return \{false}
		endif
	elseif scriptisrunning \{band_lobby_end_game}
		return \{false}
	elseif scriptisrunning \{band_lobby_end_game_spawned}
		return \{false}
	elseif ($g_connection_loss_dialogue = 1)
		return \{false}
	endif
	return \{true}
endscript

script bl_do_nothing 
endscript

script bl_update_submenus_stored_gamertag 
	printf \{channel = band_lobby
		qs(0x17898809)}
	<submenu_index> = 0
	begin
	band_lobby_get_submenu_data submenu_index = <submenu_index> param = occupied
	if (1 = <occupied>)
		band_lobby_get_submenu_data submenu_index = <submenu_index> param = player
		<array> = [0 0]
		if playerinfoequals <player> is_local_client = 1
			getplayerinfo <player> controller
			if checkforsignin controller_index = <controller> dont_set_primary
				getnetid controller_index = <controller>
				setarrayelement arrayname = array index = 0 newvalue = <net_id_first>
				setarrayelement arrayname = array index = 1 newvalue = <net_id_second>
			endif
			band_lobby_update_submenu_data submenu_index = <submenu_index> element = net_id value = <array>
			if NOT netsessionfunc obj = match func = get_gamertag params = {controller = <controller>}
				<name> = qs(0x00000000)
			endif
			band_lobby_get_submenu_data submenu_index = <submenu_index> param = gamertag_checksum
			change globalname = <gamertag_checksum> newvalue = <name>
		else
			getplayerinfo <player> net_id_first
			getplayerinfo <player> net_id_second
			setarrayelement arrayname = array index = 0 newvalue = <net_id_first>
			setarrayelement arrayname = array index = 1 newvalue = <net_id_second>
			band_lobby_update_submenu_data submenu_index = <submenu_index> element = net_id value = <array>
			getplayerinfo <player> gamertag
			band_lobby_get_submenu_data submenu_index = <submenu_index> param = gamertag_checksum
			change globalname = <gamertag_checksum> newvalue = ($<gamertag>)
		endif
	endif
	<submenu_index> = (1 + <submenu_index>)
	repeat ($g_num_lobby_total_submenus)
endscript

script debug_bl_dump_submenu_data_all 
	printf \{qs(0xa220a895)}
	i = 0
	begin
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%d' d = <i>
	printstruct ($<submenu_data>)
	i = (<i> + 1)
	repeat ($g_num_lobby_total_submenus)
endscript

script debug_bl_dump_submenu_data 
	printf \{qs(0x157248ca)}
	if gotparam \{index}
		printf qs(0xd959eec4) a = <index>
		formattext checksumname = submenu_data 'band_lobby_submenu_data_%d' d = <index>
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
		getplayerinfo <player> party_id
		getplayerinfo <player> net_id_first
		getplayerinfo <player> net_id_second
		getplayerinfo <player> controller
		printf qs(0x0c15a2f6) a = <player> b = <party_id> c = <net_id_first> d = <net_id_second> e = <controller>
		getnextplayer player = <player>
		repeat <num_players>
	endif
endscript
